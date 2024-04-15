; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10512 () Bool)

(assert start!10512)

(declare-fun b!82526 () Bool)

(declare-fun b_free!2209 () Bool)

(declare-fun b_next!2209 () Bool)

(assert (=> b!82526 (= b_free!2209 (not b_next!2209))))

(declare-fun tp!8845 () Bool)

(declare-fun b_and!5005 () Bool)

(assert (=> b!82526 (= tp!8845 b_and!5005)))

(declare-fun b!82530 () Bool)

(declare-fun b_free!2211 () Bool)

(declare-fun b_next!2211 () Bool)

(assert (=> b!82530 (= b_free!2211 (not b_next!2211))))

(declare-fun tp!8843 () Bool)

(declare-fun b_and!5007 () Bool)

(assert (=> b!82530 (= tp!8843 b_and!5007)))

(declare-fun res!42797 () Bool)

(declare-fun e!53829 () Bool)

(assert (=> start!10512 (=> (not res!42797) (not e!53829))))

(declare-datatypes ((V!3009 0))(
  ( (V!3010 (val!1305 Int)) )
))
(declare-datatypes ((array!3979 0))(
  ( (array!3980 (arr!1894 (Array (_ BitVec 32) (_ BitVec 64))) (size!2138 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!917 0))(
  ( (ValueCellFull!917 (v!2615 V!3009)) (EmptyCell!917) )
))
(declare-datatypes ((array!3981 0))(
  ( (array!3982 (arr!1895 (Array (_ BitVec 32) ValueCell!917)) (size!2139 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!742 0))(
  ( (LongMapFixedSize!743 (defaultEntry!2313 Int) (mask!6328 (_ BitVec 32)) (extraKeys!2156 (_ BitVec 32)) (zeroValue!2207 V!3009) (minValue!2207 V!3009) (_size!420 (_ BitVec 32)) (_keys!3980 array!3979) (_values!2296 array!3981) (_vacant!420 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!536 0))(
  ( (Cell!537 (v!2616 LongMapFixedSize!742)) )
))
(declare-datatypes ((LongMap!536 0))(
  ( (LongMap!537 (underlying!279 Cell!536)) )
))
(declare-fun thiss!992 () LongMap!536)

(declare-fun valid!329 (LongMap!536) Bool)

(assert (=> start!10512 (= res!42797 (valid!329 thiss!992))))

(assert (=> start!10512 e!53829))

(declare-fun e!53827 () Bool)

(assert (=> start!10512 e!53827))

(assert (=> start!10512 true))

(declare-fun e!53832 () Bool)

(assert (=> start!10512 e!53832))

(declare-fun mapNonEmpty!3349 () Bool)

(declare-fun mapRes!3349 () Bool)

(declare-fun tp!8844 () Bool)

(declare-fun e!53831 () Bool)

(assert (=> mapNonEmpty!3349 (= mapRes!3349 (and tp!8844 e!53831))))

(declare-fun mapRest!3349 () (Array (_ BitVec 32) ValueCell!917))

(declare-fun mapKey!3350 () (_ BitVec 32))

(declare-fun mapValue!3349 () ValueCell!917)

(assert (=> mapNonEmpty!3349 (= (arr!1895 (_values!2296 (v!2616 (underlying!279 thiss!992)))) (store mapRest!3349 mapKey!3350 mapValue!3349))))

(declare-fun b!82511 () Bool)

(declare-fun e!53833 () Bool)

(declare-fun tp_is_empty!2521 () Bool)

(assert (=> b!82511 (= e!53833 tp_is_empty!2521)))

(declare-fun b!82512 () Bool)

(declare-fun res!42791 () Bool)

(assert (=> b!82512 (=> (not res!42791) (not e!53829))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!82512 (= res!42791 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2138 (_keys!3980 (v!2616 (underlying!279 thiss!992)))))))))

(declare-fun b!82513 () Bool)

(declare-fun e!53837 () Bool)

(declare-fun e!53835 () Bool)

(assert (=> b!82513 (= e!53837 e!53835)))

(declare-fun res!42796 () Bool)

(assert (=> b!82513 (=> (not res!42796) (not e!53835))))

(declare-datatypes ((tuple2!2192 0))(
  ( (tuple2!2193 (_1!1107 Bool) (_2!1107 LongMapFixedSize!742)) )
))
(declare-fun lt!38568 () tuple2!2192)

(assert (=> b!82513 (= res!42796 (and (_1!1107 lt!38568) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2420 0))(
  ( (Unit!2421) )
))
(declare-fun lt!38580 () Unit!2420)

(declare-fun e!53836 () Unit!2420)

(assert (=> b!82513 (= lt!38580 e!53836)))

(declare-fun c!13138 () Bool)

(declare-datatypes ((tuple2!2194 0))(
  ( (tuple2!2195 (_1!1108 (_ BitVec 64)) (_2!1108 V!3009)) )
))
(declare-datatypes ((List!1519 0))(
  ( (Nil!1516) (Cons!1515 (h!2105 tuple2!2194) (t!5198 List!1519)) )
))
(declare-datatypes ((ListLongMap!1443 0))(
  ( (ListLongMap!1444 (toList!737 List!1519)) )
))
(declare-fun lt!38574 () ListLongMap!1443)

(declare-fun contains!747 (ListLongMap!1443 (_ BitVec 64)) Bool)

(assert (=> b!82513 (= c!13138 (contains!747 lt!38574 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355)))))

(declare-fun lt!38566 () V!3009)

(declare-fun newMap!16 () LongMapFixedSize!742)

(declare-fun update!119 (LongMapFixedSize!742 (_ BitVec 64) V!3009) tuple2!2192)

(assert (=> b!82513 (= lt!38568 (update!119 newMap!16 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) lt!38566))))

(declare-fun b!82514 () Bool)

(declare-fun e!53826 () Bool)

(assert (=> b!82514 (= e!53826 tp_is_empty!2521)))

(declare-fun b!82515 () Bool)

(declare-fun e!53824 () Bool)

(assert (=> b!82515 (= e!53827 e!53824)))

(declare-fun mapIsEmpty!3349 () Bool)

(declare-fun mapRes!3350 () Bool)

(assert (=> mapIsEmpty!3349 mapRes!3350))

(declare-fun b!82516 () Bool)

(declare-fun res!42793 () Bool)

(assert (=> b!82516 (=> (not res!42793) (not e!53829))))

(assert (=> b!82516 (= res!42793 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6328 newMap!16)) (_size!420 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun b!82517 () Bool)

(declare-fun e!53828 () Bool)

(assert (=> b!82517 (= e!53828 (or (not (= (size!2139 (_values!2296 (v!2616 (underlying!279 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6328 (v!2616 (underlying!279 thiss!992)))))) (not (= (size!2138 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) (size!2139 (_values!2296 (v!2616 (underlying!279 thiss!992)))))) (bvsge (mask!6328 (v!2616 (underlying!279 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!82518 () Bool)

(declare-fun res!42792 () Bool)

(assert (=> b!82518 (=> (not res!42792) (not e!53829))))

(declare-fun valid!330 (LongMapFixedSize!742) Bool)

(assert (=> b!82518 (= res!42792 (valid!330 newMap!16))))

(declare-fun b!82519 () Bool)

(declare-fun e!53841 () Bool)

(assert (=> b!82519 (= e!53829 e!53841)))

(declare-fun res!42795 () Bool)

(assert (=> b!82519 (=> (not res!42795) (not e!53841))))

(declare-fun lt!38565 () ListLongMap!1443)

(assert (=> b!82519 (= res!42795 (= lt!38565 lt!38574))))

(declare-fun map!1180 (LongMapFixedSize!742) ListLongMap!1443)

(assert (=> b!82519 (= lt!38574 (map!1180 newMap!16))))

(declare-fun getCurrentListMap!424 (array!3979 array!3981 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 32) Int) ListLongMap!1443)

(assert (=> b!82519 (= lt!38565 (getCurrentListMap!424 (_keys!3980 (v!2616 (underlying!279 thiss!992))) (_values!2296 (v!2616 (underlying!279 thiss!992))) (mask!6328 (v!2616 (underlying!279 thiss!992))) (extraKeys!2156 (v!2616 (underlying!279 thiss!992))) (zeroValue!2207 (v!2616 (underlying!279 thiss!992))) (minValue!2207 (v!2616 (underlying!279 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun mapNonEmpty!3350 () Bool)

(declare-fun tp!8846 () Bool)

(assert (=> mapNonEmpty!3350 (= mapRes!3350 (and tp!8846 e!53826))))

(declare-fun mapRest!3350 () (Array (_ BitVec 32) ValueCell!917))

(declare-fun mapKey!3349 () (_ BitVec 32))

(declare-fun mapValue!3350 () ValueCell!917)

(assert (=> mapNonEmpty!3350 (= (arr!1895 (_values!2296 newMap!16)) (store mapRest!3350 mapKey!3349 mapValue!3350))))

(declare-fun b!82520 () Bool)

(assert (=> b!82520 (= e!53835 (not e!53828))))

(declare-fun res!42790 () Bool)

(assert (=> b!82520 (=> res!42790 e!53828)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!82520 (= res!42790 (not (validMask!0 (mask!6328 (v!2616 (underlying!279 thiss!992))))))))

(declare-fun lt!38571 () tuple2!2194)

(declare-fun lt!38569 () ListLongMap!1443)

(declare-fun lt!38570 () tuple2!2194)

(declare-fun lt!38575 () ListLongMap!1443)

(declare-fun +!106 (ListLongMap!1443 tuple2!2194) ListLongMap!1443)

(assert (=> b!82520 (= (+!106 lt!38569 lt!38570) (+!106 (+!106 lt!38575 lt!38570) lt!38571))))

(assert (=> b!82520 (= lt!38570 (tuple2!2195 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2207 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun lt!38573 () Unit!2420)

(declare-fun addCommutativeForDiffKeys!25 (ListLongMap!1443 (_ BitVec 64) V!3009 (_ BitVec 64) V!3009) Unit!2420)

(assert (=> b!82520 (= lt!38573 (addCommutativeForDiffKeys!25 lt!38575 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) lt!38566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2207 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun lt!38576 () ListLongMap!1443)

(assert (=> b!82520 (= lt!38576 lt!38569)))

(assert (=> b!82520 (= lt!38569 (+!106 lt!38575 lt!38571))))

(declare-fun lt!38563 () ListLongMap!1443)

(declare-fun lt!38567 () tuple2!2194)

(assert (=> b!82520 (= lt!38576 (+!106 lt!38563 lt!38567))))

(declare-fun lt!38572 () ListLongMap!1443)

(assert (=> b!82520 (= lt!38575 (+!106 lt!38572 lt!38567))))

(assert (=> b!82520 (= lt!38567 (tuple2!2195 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2207 (v!2616 (underlying!279 thiss!992)))))))

(assert (=> b!82520 (= lt!38563 (+!106 lt!38572 lt!38571))))

(assert (=> b!82520 (= lt!38571 (tuple2!2195 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) lt!38566))))

(declare-fun lt!38579 () Unit!2420)

(assert (=> b!82520 (= lt!38579 (addCommutativeForDiffKeys!25 lt!38572 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) lt!38566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2207 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!70 (array!3979 array!3981 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 32) Int) ListLongMap!1443)

(assert (=> b!82520 (= lt!38572 (getCurrentListMapNoExtraKeys!70 (_keys!3980 (v!2616 (underlying!279 thiss!992))) (_values!2296 (v!2616 (underlying!279 thiss!992))) (mask!6328 (v!2616 (underlying!279 thiss!992))) (extraKeys!2156 (v!2616 (underlying!279 thiss!992))) (zeroValue!2207 (v!2616 (underlying!279 thiss!992))) (minValue!2207 (v!2616 (underlying!279 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun b!82521 () Bool)

(declare-fun e!53830 () Bool)

(declare-fun e!53840 () Bool)

(assert (=> b!82521 (= e!53830 (and e!53840 mapRes!3349))))

(declare-fun condMapEmpty!3350 () Bool)

(declare-fun mapDefault!3350 () ValueCell!917)

(assert (=> b!82521 (= condMapEmpty!3350 (= (arr!1895 (_values!2296 (v!2616 (underlying!279 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!917)) mapDefault!3350)))))

(declare-fun b!82522 () Bool)

(declare-fun Unit!2422 () Unit!2420)

(assert (=> b!82522 (= e!53836 Unit!2422)))

(declare-fun b!82523 () Bool)

(declare-fun e!53834 () Bool)

(assert (=> b!82523 (= e!53834 (and e!53833 mapRes!3350))))

(declare-fun condMapEmpty!3349 () Bool)

(declare-fun mapDefault!3349 () ValueCell!917)

(assert (=> b!82523 (= condMapEmpty!3349 (= (arr!1895 (_values!2296 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!917)) mapDefault!3349)))))

(declare-fun b!82524 () Bool)

(declare-fun Unit!2423 () Unit!2420)

(assert (=> b!82524 (= e!53836 Unit!2423)))

(declare-fun lt!38564 () Unit!2420)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!63 (array!3979 array!3981 (_ BitVec 32) (_ BitVec 32) V!3009 V!3009 (_ BitVec 64) (_ BitVec 32) Int) Unit!2420)

(assert (=> b!82524 (= lt!38564 (lemmaListMapContainsThenArrayContainsFrom!63 (_keys!3980 (v!2616 (underlying!279 thiss!992))) (_values!2296 (v!2616 (underlying!279 thiss!992))) (mask!6328 (v!2616 (underlying!279 thiss!992))) (extraKeys!2156 (v!2616 (underlying!279 thiss!992))) (zeroValue!2207 (v!2616 (underlying!279 thiss!992))) (minValue!2207 (v!2616 (underlying!279 thiss!992))) (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2313 (v!2616 (underlying!279 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!82524 (arrayContainsKey!0 (_keys!3980 (v!2616 (underlying!279 thiss!992))) (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!38577 () Unit!2420)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3979 (_ BitVec 32) (_ BitVec 32)) Unit!2420)

(assert (=> b!82524 (= lt!38577 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3980 (v!2616 (underlying!279 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1520 0))(
  ( (Nil!1517) (Cons!1516 (h!2106 (_ BitVec 64)) (t!5199 List!1520)) )
))
(declare-fun arrayNoDuplicates!0 (array!3979 (_ BitVec 32) List!1520) Bool)

(assert (=> b!82524 (arrayNoDuplicates!0 (_keys!3980 (v!2616 (underlying!279 thiss!992))) from!355 Nil!1517)))

(declare-fun lt!38578 () Unit!2420)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3979 (_ BitVec 32) (_ BitVec 64) List!1520) Unit!2420)

(assert (=> b!82524 (= lt!38578 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3980 (v!2616 (underlying!279 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) (Cons!1516 (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) Nil!1517)))))

(assert (=> b!82524 false))

(declare-fun b!82525 () Bool)

(assert (=> b!82525 (= e!53831 tp_is_empty!2521)))

(declare-fun e!53839 () Bool)

(declare-fun array_inv!1191 (array!3979) Bool)

(declare-fun array_inv!1192 (array!3981) Bool)

(assert (=> b!82526 (= e!53839 (and tp!8845 tp_is_empty!2521 (array_inv!1191 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) (array_inv!1192 (_values!2296 (v!2616 (underlying!279 thiss!992)))) e!53830))))

(declare-fun b!82527 () Bool)

(assert (=> b!82527 (= e!53841 e!53837)))

(declare-fun res!42794 () Bool)

(assert (=> b!82527 (=> (not res!42794) (not e!53837))))

(assert (=> b!82527 (= res!42794 (and (not (= (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1894 (_keys!3980 (v!2616 (underlying!279 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1190 (ValueCell!917 V!3009) V!3009)

(declare-fun dynLambda!340 (Int (_ BitVec 64)) V!3009)

(assert (=> b!82527 (= lt!38566 (get!1190 (select (arr!1895 (_values!2296 (v!2616 (underlying!279 thiss!992)))) from!355) (dynLambda!340 (defaultEntry!2313 (v!2616 (underlying!279 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!82528 () Bool)

(assert (=> b!82528 (= e!53840 tp_is_empty!2521)))

(declare-fun mapIsEmpty!3350 () Bool)

(assert (=> mapIsEmpty!3350 mapRes!3349))

(declare-fun b!82529 () Bool)

(assert (=> b!82529 (= e!53824 e!53839)))

(assert (=> b!82530 (= e!53832 (and tp!8843 tp_is_empty!2521 (array_inv!1191 (_keys!3980 newMap!16)) (array_inv!1192 (_values!2296 newMap!16)) e!53834))))

(assert (= (and start!10512 res!42797) b!82512))

(assert (= (and b!82512 res!42791) b!82518))

(assert (= (and b!82518 res!42792) b!82516))

(assert (= (and b!82516 res!42793) b!82519))

(assert (= (and b!82519 res!42795) b!82527))

(assert (= (and b!82527 res!42794) b!82513))

(assert (= (and b!82513 c!13138) b!82524))

(assert (= (and b!82513 (not c!13138)) b!82522))

(assert (= (and b!82513 res!42796) b!82520))

(assert (= (and b!82520 (not res!42790)) b!82517))

(assert (= (and b!82521 condMapEmpty!3350) mapIsEmpty!3350))

(assert (= (and b!82521 (not condMapEmpty!3350)) mapNonEmpty!3349))

(get-info :version)

(assert (= (and mapNonEmpty!3349 ((_ is ValueCellFull!917) mapValue!3349)) b!82525))

(assert (= (and b!82521 ((_ is ValueCellFull!917) mapDefault!3350)) b!82528))

(assert (= b!82526 b!82521))

(assert (= b!82529 b!82526))

(assert (= b!82515 b!82529))

(assert (= start!10512 b!82515))

(assert (= (and b!82523 condMapEmpty!3349) mapIsEmpty!3349))

(assert (= (and b!82523 (not condMapEmpty!3349)) mapNonEmpty!3350))

(assert (= (and mapNonEmpty!3350 ((_ is ValueCellFull!917) mapValue!3350)) b!82514))

(assert (= (and b!82523 ((_ is ValueCellFull!917) mapDefault!3349)) b!82511))

(assert (= b!82530 b!82523))

(assert (= start!10512 b!82530))

(declare-fun b_lambda!3677 () Bool)

(assert (=> (not b_lambda!3677) (not b!82527)))

(declare-fun t!5195 () Bool)

(declare-fun tb!1649 () Bool)

(assert (=> (and b!82526 (= (defaultEntry!2313 (v!2616 (underlying!279 thiss!992))) (defaultEntry!2313 (v!2616 (underlying!279 thiss!992)))) t!5195) tb!1649))

(declare-fun result!2857 () Bool)

(assert (=> tb!1649 (= result!2857 tp_is_empty!2521)))

(assert (=> b!82527 t!5195))

(declare-fun b_and!5009 () Bool)

(assert (= b_and!5005 (and (=> t!5195 result!2857) b_and!5009)))

(declare-fun tb!1651 () Bool)

(declare-fun t!5197 () Bool)

(assert (=> (and b!82530 (= (defaultEntry!2313 newMap!16) (defaultEntry!2313 (v!2616 (underlying!279 thiss!992)))) t!5197) tb!1651))

(declare-fun result!2861 () Bool)

(assert (= result!2861 result!2857))

(assert (=> b!82527 t!5197))

(declare-fun b_and!5011 () Bool)

(assert (= b_and!5007 (and (=> t!5197 result!2861) b_and!5011)))

(declare-fun m!85367 () Bool)

(assert (=> mapNonEmpty!3349 m!85367))

(declare-fun m!85369 () Bool)

(assert (=> b!82527 m!85369))

(declare-fun m!85371 () Bool)

(assert (=> b!82527 m!85371))

(declare-fun m!85373 () Bool)

(assert (=> b!82527 m!85373))

(assert (=> b!82527 m!85371))

(assert (=> b!82527 m!85373))

(declare-fun m!85375 () Bool)

(assert (=> b!82527 m!85375))

(declare-fun m!85377 () Bool)

(assert (=> b!82518 m!85377))

(declare-fun m!85379 () Bool)

(assert (=> b!82519 m!85379))

(declare-fun m!85381 () Bool)

(assert (=> b!82519 m!85381))

(declare-fun m!85383 () Bool)

(assert (=> b!82520 m!85383))

(declare-fun m!85385 () Bool)

(assert (=> b!82520 m!85385))

(declare-fun m!85387 () Bool)

(assert (=> b!82520 m!85387))

(declare-fun m!85389 () Bool)

(assert (=> b!82520 m!85389))

(declare-fun m!85391 () Bool)

(assert (=> b!82520 m!85391))

(declare-fun m!85393 () Bool)

(assert (=> b!82520 m!85393))

(assert (=> b!82520 m!85369))

(assert (=> b!82520 m!85389))

(declare-fun m!85395 () Bool)

(assert (=> b!82520 m!85395))

(declare-fun m!85397 () Bool)

(assert (=> b!82520 m!85397))

(assert (=> b!82520 m!85369))

(declare-fun m!85399 () Bool)

(assert (=> b!82520 m!85399))

(assert (=> b!82520 m!85369))

(declare-fun m!85401 () Bool)

(assert (=> b!82520 m!85401))

(declare-fun m!85403 () Bool)

(assert (=> b!82520 m!85403))

(declare-fun m!85405 () Bool)

(assert (=> b!82530 m!85405))

(declare-fun m!85407 () Bool)

(assert (=> b!82530 m!85407))

(declare-fun m!85409 () Bool)

(assert (=> b!82526 m!85409))

(declare-fun m!85411 () Bool)

(assert (=> b!82526 m!85411))

(assert (=> b!82513 m!85369))

(assert (=> b!82513 m!85369))

(declare-fun m!85413 () Bool)

(assert (=> b!82513 m!85413))

(assert (=> b!82513 m!85369))

(declare-fun m!85415 () Bool)

(assert (=> b!82513 m!85415))

(declare-fun m!85417 () Bool)

(assert (=> b!82524 m!85417))

(declare-fun m!85419 () Bool)

(assert (=> b!82524 m!85419))

(assert (=> b!82524 m!85369))

(declare-fun m!85421 () Bool)

(assert (=> b!82524 m!85421))

(assert (=> b!82524 m!85369))

(assert (=> b!82524 m!85369))

(declare-fun m!85423 () Bool)

(assert (=> b!82524 m!85423))

(assert (=> b!82524 m!85369))

(declare-fun m!85425 () Bool)

(assert (=> b!82524 m!85425))

(declare-fun m!85427 () Bool)

(assert (=> mapNonEmpty!3350 m!85427))

(declare-fun m!85429 () Bool)

(assert (=> start!10512 m!85429))

(check-sat b_and!5011 (not b!82520) (not b!82526) (not b!82518) (not b!82524) (not b!82530) (not start!10512) (not b!82513) (not b_next!2211) b_and!5009 (not b_next!2209) (not mapNonEmpty!3349) (not b_lambda!3677) tp_is_empty!2521 (not b!82519) (not b!82527) (not mapNonEmpty!3350))
(check-sat b_and!5009 b_and!5011 (not b_next!2209) (not b_next!2211))
