; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11274 () Bool)

(assert start!11274)

(declare-fun b!92842 () Bool)

(declare-fun b_free!2365 () Bool)

(declare-fun b_next!2365 () Bool)

(assert (=> b!92842 (= b_free!2365 (not b_next!2365))))

(declare-fun tp!9353 () Bool)

(declare-fun b_and!5645 () Bool)

(assert (=> b!92842 (= tp!9353 b_and!5645)))

(declare-fun b!92852 () Bool)

(declare-fun b_free!2367 () Bool)

(declare-fun b_next!2367 () Bool)

(assert (=> b!92852 (= b_free!2367 (not b_next!2367))))

(declare-fun tp!9354 () Bool)

(declare-fun b_and!5647 () Bool)

(assert (=> b!92852 (= tp!9354 b_and!5647)))

(declare-datatypes ((V!3113 0))(
  ( (V!3114 (val!1344 Int)) )
))
(declare-datatypes ((array!4149 0))(
  ( (array!4150 (arr!1972 (Array (_ BitVec 32) (_ BitVec 64))) (size!2221 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!956 0))(
  ( (ValueCellFull!956 (v!2737 V!3113)) (EmptyCell!956) )
))
(declare-datatypes ((array!4151 0))(
  ( (array!4152 (arr!1973 (Array (_ BitVec 32) ValueCell!956)) (size!2222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!820 0))(
  ( (LongMapFixedSize!821 (defaultEntry!2424 Int) (mask!6493 (_ BitVec 32)) (extraKeys!2253 (_ BitVec 32)) (zeroValue!2311 V!3113) (minValue!2311 V!3113) (_size!459 (_ BitVec 32)) (_keys!4105 array!4149) (_values!2407 array!4151) (_vacant!459 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!612 0))(
  ( (Cell!613 (v!2738 LongMapFixedSize!820)) )
))
(declare-datatypes ((LongMap!612 0))(
  ( (LongMap!613 (underlying!317 Cell!612)) )
))
(declare-fun thiss!992 () LongMap!612)

(declare-fun e!60601 () Bool)

(declare-fun e!60591 () Bool)

(declare-fun tp_is_empty!2599 () Bool)

(declare-fun array_inv!1233 (array!4149) Bool)

(declare-fun array_inv!1234 (array!4151) Bool)

(assert (=> b!92842 (= e!60601 (and tp!9353 tp_is_empty!2599 (array_inv!1233 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (array_inv!1234 (_values!2407 (v!2738 (underlying!317 thiss!992)))) e!60591))))

(declare-fun b!92843 () Bool)

(declare-fun e!60595 () Bool)

(declare-fun e!60597 () Bool)

(assert (=> b!92843 (= e!60595 e!60597)))

(declare-fun res!47188 () Bool)

(assert (=> b!92843 (=> res!47188 e!60597)))

(declare-datatypes ((tuple2!2280 0))(
  ( (tuple2!2281 (_1!1151 Bool) (_2!1151 LongMapFixedSize!820)) )
))
(declare-fun lt!45749 () tuple2!2280)

(assert (=> b!92843 (= res!47188 (not (_1!1151 lt!45749)))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!45735 () tuple2!2280)

(declare-fun repackFrom!13 (LongMap!612 LongMapFixedSize!820 (_ BitVec 32)) tuple2!2280)

(assert (=> b!92843 (= lt!45749 (repackFrom!13 thiss!992 (_2!1151 lt!45735) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!92844 () Bool)

(declare-fun e!60605 () Bool)

(declare-fun e!60608 () Bool)

(declare-fun mapRes!3626 () Bool)

(assert (=> b!92844 (= e!60605 (and e!60608 mapRes!3626))))

(declare-fun condMapEmpty!3625 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!820)

(declare-fun mapDefault!3625 () ValueCell!956)

(assert (=> b!92844 (= condMapEmpty!3625 (= (arr!1973 (_values!2407 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3625)))))

(declare-fun b!92845 () Bool)

(declare-fun e!60604 () Bool)

(assert (=> b!92845 (= e!60604 tp_is_empty!2599)))

(declare-fun b!92846 () Bool)

(declare-fun res!47187 () Bool)

(declare-fun e!60598 () Bool)

(assert (=> b!92846 (=> (not res!47187) (not e!60598))))

(assert (=> b!92846 (= res!47187 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun b!92847 () Bool)

(declare-fun valid!372 (LongMapFixedSize!820) Bool)

(assert (=> b!92847 (= e!60597 (valid!372 (v!2738 (underlying!317 thiss!992))))))

(declare-fun b!92848 () Bool)

(declare-fun e!60600 () Bool)

(assert (=> b!92848 (= e!60600 tp_is_empty!2599)))

(declare-fun mapIsEmpty!3625 () Bool)

(declare-fun mapRes!3625 () Bool)

(assert (=> mapIsEmpty!3625 mapRes!3625))

(declare-fun b!92849 () Bool)

(declare-fun e!60594 () Bool)

(assert (=> b!92849 (= e!60594 tp_is_empty!2599)))

(declare-fun b!92850 () Bool)

(declare-fun e!60592 () Bool)

(assert (=> b!92850 (= e!60598 e!60592)))

(declare-fun res!47185 () Bool)

(assert (=> b!92850 (=> (not res!47185) (not e!60592))))

(declare-datatypes ((tuple2!2282 0))(
  ( (tuple2!2283 (_1!1152 (_ BitVec 64)) (_2!1152 V!3113)) )
))
(declare-datatypes ((List!1565 0))(
  ( (Nil!1562) (Cons!1561 (h!2153 tuple2!2282) (t!5434 List!1565)) )
))
(declare-datatypes ((ListLongMap!1489 0))(
  ( (ListLongMap!1490 (toList!760 List!1565)) )
))
(declare-fun lt!45734 () ListLongMap!1489)

(declare-fun lt!45748 () ListLongMap!1489)

(assert (=> b!92850 (= res!47185 (= lt!45734 lt!45748))))

(declare-fun map!1223 (LongMapFixedSize!820) ListLongMap!1489)

(assert (=> b!92850 (= lt!45748 (map!1223 newMap!16))))

(declare-fun getCurrentListMap!443 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) ListLongMap!1489)

(assert (=> b!92850 (= lt!45734 (getCurrentListMap!443 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!92851 () Bool)

(declare-datatypes ((Unit!2774 0))(
  ( (Unit!2775) )
))
(declare-fun e!60607 () Unit!2774)

(declare-fun Unit!2776 () Unit!2774)

(assert (=> b!92851 (= e!60607 Unit!2776)))

(declare-fun e!60599 () Bool)

(assert (=> b!92852 (= e!60599 (and tp!9354 tp_is_empty!2599 (array_inv!1233 (_keys!4105 newMap!16)) (array_inv!1234 (_values!2407 newMap!16)) e!60605))))

(declare-fun b!92853 () Bool)

(declare-fun e!60603 () Bool)

(assert (=> b!92853 (= e!60592 e!60603)))

(declare-fun res!47184 () Bool)

(assert (=> b!92853 (=> (not res!47184) (not e!60603))))

(assert (=> b!92853 (= res!47184 (and (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45733 () V!3113)

(declare-fun get!1255 (ValueCell!956 V!3113) V!3113)

(declare-fun dynLambda!360 (Int (_ BitVec 64)) V!3113)

(assert (=> b!92853 (= lt!45733 (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92854 () Bool)

(declare-fun e!60596 () Bool)

(assert (=> b!92854 (= e!60603 e!60596)))

(declare-fun res!47181 () Bool)

(assert (=> b!92854 (=> (not res!47181) (not e!60596))))

(assert (=> b!92854 (= res!47181 (and (_1!1151 lt!45735) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!45741 () Unit!2774)

(assert (=> b!92854 (= lt!45741 e!60607)))

(declare-fun c!15426 () Bool)

(declare-fun contains!779 (ListLongMap!1489 (_ BitVec 64)) Bool)

(assert (=> b!92854 (= c!15426 (contains!779 lt!45748 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun update!137 (LongMapFixedSize!820 (_ BitVec 64) V!3113) tuple2!2280)

(assert (=> b!92854 (= lt!45735 (update!137 newMap!16 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733))))

(declare-fun mapNonEmpty!3625 () Bool)

(declare-fun tp!9356 () Bool)

(assert (=> mapNonEmpty!3625 (= mapRes!3626 (and tp!9356 e!60604))))

(declare-fun mapValue!3625 () ValueCell!956)

(declare-fun mapKey!3625 () (_ BitVec 32))

(declare-fun mapRest!3625 () (Array (_ BitVec 32) ValueCell!956))

(assert (=> mapNonEmpty!3625 (= (arr!1973 (_values!2407 newMap!16)) (store mapRest!3625 mapKey!3625 mapValue!3625))))

(declare-fun b!92855 () Bool)

(assert (=> b!92855 (= e!60591 (and e!60594 mapRes!3625))))

(declare-fun condMapEmpty!3626 () Bool)

(declare-fun mapDefault!3626 () ValueCell!956)

(assert (=> b!92855 (= condMapEmpty!3626 (= (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3626)))))

(declare-fun b!92856 () Bool)

(declare-fun e!60606 () Bool)

(declare-fun e!60602 () Bool)

(assert (=> b!92856 (= e!60606 e!60602)))

(declare-fun b!92857 () Bool)

(declare-fun res!47189 () Bool)

(assert (=> b!92857 (=> (not res!47189) (not e!60598))))

(assert (=> b!92857 (= res!47189 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6493 newMap!16)) (_size!459 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!92858 () Bool)

(assert (=> b!92858 (= e!60602 e!60601)))

(declare-fun b!92859 () Bool)

(declare-fun res!47180 () Bool)

(assert (=> b!92859 (=> (not res!47180) (not e!60598))))

(assert (=> b!92859 (= res!47180 (valid!372 newMap!16))))

(declare-fun mapNonEmpty!3626 () Bool)

(declare-fun tp!9355 () Bool)

(assert (=> mapNonEmpty!3626 (= mapRes!3625 (and tp!9355 e!60600))))

(declare-fun mapValue!3626 () ValueCell!956)

(declare-fun mapRest!3626 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapKey!3626 () (_ BitVec 32))

(assert (=> mapNonEmpty!3626 (= (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (store mapRest!3626 mapKey!3626 mapValue!3626))))

(declare-fun b!92860 () Bool)

(assert (=> b!92860 (= e!60608 tp_is_empty!2599)))

(declare-fun res!47186 () Bool)

(assert (=> start!11274 (=> (not res!47186) (not e!60598))))

(declare-fun valid!373 (LongMap!612) Bool)

(assert (=> start!11274 (= res!47186 (valid!373 thiss!992))))

(assert (=> start!11274 e!60598))

(assert (=> start!11274 e!60606))

(assert (=> start!11274 true))

(assert (=> start!11274 e!60599))

(declare-fun b!92861 () Bool)

(declare-fun Unit!2777 () Unit!2774)

(assert (=> b!92861 (= e!60607 Unit!2777)))

(declare-fun lt!45737 () Unit!2774)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!86 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) (_ BitVec 32) Int) Unit!2774)

(assert (=> b!92861 (= lt!45737 (lemmaListMapContainsThenArrayContainsFrom!86 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92861 (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45740 () Unit!2774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4149 (_ BitVec 32) (_ BitVec 32)) Unit!2774)

(assert (=> b!92861 (= lt!45740 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1566 0))(
  ( (Nil!1563) (Cons!1562 (h!2154 (_ BitVec 64)) (t!5435 List!1566)) )
))
(declare-fun arrayNoDuplicates!0 (array!4149 (_ BitVec 32) List!1566) Bool)

(assert (=> b!92861 (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) from!355 Nil!1563)))

(declare-fun lt!45736 () Unit!2774)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4149 (_ BitVec 32) (_ BitVec 64) List!1566) Unit!2774)

(assert (=> b!92861 (= lt!45736 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (Cons!1562 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) Nil!1563)))))

(assert (=> b!92861 false))

(declare-fun b!92862 () Bool)

(declare-fun res!47182 () Bool)

(assert (=> b!92862 (=> res!47182 e!60597)))

(assert (=> b!92862 (= res!47182 (not (valid!372 (_2!1151 lt!45749))))))

(declare-fun b!92863 () Bool)

(assert (=> b!92863 (= e!60596 (not e!60595))))

(declare-fun res!47183 () Bool)

(assert (=> b!92863 (=> res!47183 e!60595)))

(assert (=> b!92863 (= res!47183 (not (= (getCurrentListMap!443 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) (map!1223 (_2!1151 lt!45735)))))))

(declare-fun lt!45746 () ListLongMap!1489)

(declare-fun lt!45732 () ListLongMap!1489)

(declare-fun lt!45744 () tuple2!2282)

(declare-fun lt!45743 () tuple2!2282)

(declare-fun +!123 (ListLongMap!1489 tuple2!2282) ListLongMap!1489)

(assert (=> b!92863 (= (+!123 lt!45746 lt!45744) (+!123 (+!123 lt!45732 lt!45744) lt!45743))))

(assert (=> b!92863 (= lt!45744 (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!45742 () Unit!2774)

(declare-fun addCommutativeForDiffKeys!42 (ListLongMap!1489 (_ BitVec 64) V!3113 (_ BitVec 64) V!3113) Unit!2774)

(assert (=> b!92863 (= lt!45742 (addCommutativeForDiffKeys!42 lt!45732 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!45738 () ListLongMap!1489)

(assert (=> b!92863 (= lt!45738 lt!45746)))

(assert (=> b!92863 (= lt!45746 (+!123 lt!45732 lt!45743))))

(declare-fun lt!45745 () ListLongMap!1489)

(declare-fun lt!45739 () tuple2!2282)

(assert (=> b!92863 (= lt!45738 (+!123 lt!45745 lt!45739))))

(declare-fun lt!45750 () ListLongMap!1489)

(assert (=> b!92863 (= lt!45732 (+!123 lt!45750 lt!45739))))

(assert (=> b!92863 (= lt!45739 (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(assert (=> b!92863 (= lt!45745 (+!123 lt!45750 lt!45743))))

(assert (=> b!92863 (= lt!45743 (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733))))

(declare-fun lt!45747 () Unit!2774)

(assert (=> b!92863 (= lt!45747 (addCommutativeForDiffKeys!42 lt!45750 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!87 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) ListLongMap!1489)

(assert (=> b!92863 (= lt!45750 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun mapIsEmpty!3626 () Bool)

(assert (=> mapIsEmpty!3626 mapRes!3626))

(assert (= (and start!11274 res!47186) b!92846))

(assert (= (and b!92846 res!47187) b!92859))

(assert (= (and b!92859 res!47180) b!92857))

(assert (= (and b!92857 res!47189) b!92850))

(assert (= (and b!92850 res!47185) b!92853))

(assert (= (and b!92853 res!47184) b!92854))

(assert (= (and b!92854 c!15426) b!92861))

(assert (= (and b!92854 (not c!15426)) b!92851))

(assert (= (and b!92854 res!47181) b!92863))

(assert (= (and b!92863 (not res!47183)) b!92843))

(assert (= (and b!92843 (not res!47188)) b!92862))

(assert (= (and b!92862 (not res!47182)) b!92847))

(assert (= (and b!92855 condMapEmpty!3626) mapIsEmpty!3625))

(assert (= (and b!92855 (not condMapEmpty!3626)) mapNonEmpty!3626))

(get-info :version)

(assert (= (and mapNonEmpty!3626 ((_ is ValueCellFull!956) mapValue!3626)) b!92848))

(assert (= (and b!92855 ((_ is ValueCellFull!956) mapDefault!3626)) b!92849))

(assert (= b!92842 b!92855))

(assert (= b!92858 b!92842))

(assert (= b!92856 b!92858))

(assert (= start!11274 b!92856))

(assert (= (and b!92844 condMapEmpty!3625) mapIsEmpty!3626))

(assert (= (and b!92844 (not condMapEmpty!3625)) mapNonEmpty!3625))

(assert (= (and mapNonEmpty!3625 ((_ is ValueCellFull!956) mapValue!3625)) b!92845))

(assert (= (and b!92844 ((_ is ValueCellFull!956) mapDefault!3625)) b!92860))

(assert (= b!92852 b!92844))

(assert (= start!11274 b!92852))

(declare-fun b_lambda!4091 () Bool)

(assert (=> (not b_lambda!4091) (not b!92853)))

(declare-fun t!5431 () Bool)

(declare-fun tb!1837 () Bool)

(assert (=> (and b!92842 (= (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) t!5431) tb!1837))

(declare-fun result!3137 () Bool)

(assert (=> tb!1837 (= result!3137 tp_is_empty!2599)))

(assert (=> b!92853 t!5431))

(declare-fun b_and!5649 () Bool)

(assert (= b_and!5645 (and (=> t!5431 result!3137) b_and!5649)))

(declare-fun t!5433 () Bool)

(declare-fun tb!1839 () Bool)

(assert (=> (and b!92852 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) t!5433) tb!1839))

(declare-fun result!3141 () Bool)

(assert (= result!3141 result!3137))

(assert (=> b!92853 t!5433))

(declare-fun b_and!5651 () Bool)

(assert (= b_and!5647 (and (=> t!5433 result!3141) b_and!5651)))

(declare-fun m!100075 () Bool)

(assert (=> b!92847 m!100075))

(declare-fun m!100077 () Bool)

(assert (=> mapNonEmpty!3625 m!100077))

(declare-fun m!100079 () Bool)

(assert (=> b!92861 m!100079))

(declare-fun m!100081 () Bool)

(assert (=> b!92861 m!100081))

(declare-fun m!100083 () Bool)

(assert (=> b!92861 m!100083))

(declare-fun m!100085 () Bool)

(assert (=> b!92861 m!100085))

(assert (=> b!92861 m!100083))

(assert (=> b!92861 m!100083))

(declare-fun m!100087 () Bool)

(assert (=> b!92861 m!100087))

(assert (=> b!92861 m!100083))

(declare-fun m!100089 () Bool)

(assert (=> b!92861 m!100089))

(declare-fun m!100091 () Bool)

(assert (=> b!92859 m!100091))

(declare-fun m!100093 () Bool)

(assert (=> b!92843 m!100093))

(declare-fun m!100095 () Bool)

(assert (=> b!92850 m!100095))

(declare-fun m!100097 () Bool)

(assert (=> b!92850 m!100097))

(declare-fun m!100099 () Bool)

(assert (=> b!92863 m!100099))

(declare-fun m!100101 () Bool)

(assert (=> b!92863 m!100101))

(declare-fun m!100103 () Bool)

(assert (=> b!92863 m!100103))

(assert (=> b!92863 m!100083))

(declare-fun m!100105 () Bool)

(assert (=> b!92863 m!100105))

(declare-fun m!100107 () Bool)

(assert (=> b!92863 m!100107))

(assert (=> b!92863 m!100103))

(declare-fun m!100109 () Bool)

(assert (=> b!92863 m!100109))

(declare-fun m!100111 () Bool)

(assert (=> b!92863 m!100111))

(assert (=> b!92863 m!100083))

(assert (=> b!92863 m!100083))

(declare-fun m!100113 () Bool)

(assert (=> b!92863 m!100113))

(declare-fun m!100115 () Bool)

(assert (=> b!92863 m!100115))

(declare-fun m!100117 () Bool)

(assert (=> b!92863 m!100117))

(declare-fun m!100119 () Bool)

(assert (=> b!92863 m!100119))

(declare-fun m!100121 () Bool)

(assert (=> b!92863 m!100121))

(declare-fun m!100123 () Bool)

(assert (=> b!92862 m!100123))

(assert (=> b!92854 m!100083))

(assert (=> b!92854 m!100083))

(declare-fun m!100125 () Bool)

(assert (=> b!92854 m!100125))

(assert (=> b!92854 m!100083))

(declare-fun m!100127 () Bool)

(assert (=> b!92854 m!100127))

(declare-fun m!100129 () Bool)

(assert (=> b!92852 m!100129))

(declare-fun m!100131 () Bool)

(assert (=> b!92852 m!100131))

(assert (=> b!92853 m!100083))

(declare-fun m!100133 () Bool)

(assert (=> b!92853 m!100133))

(declare-fun m!100135 () Bool)

(assert (=> b!92853 m!100135))

(assert (=> b!92853 m!100133))

(assert (=> b!92853 m!100135))

(declare-fun m!100137 () Bool)

(assert (=> b!92853 m!100137))

(declare-fun m!100139 () Bool)

(assert (=> b!92842 m!100139))

(declare-fun m!100141 () Bool)

(assert (=> b!92842 m!100141))

(declare-fun m!100143 () Bool)

(assert (=> start!11274 m!100143))

(declare-fun m!100145 () Bool)

(assert (=> mapNonEmpty!3626 m!100145))

(check-sat (not b!92843) (not b!92847) (not b!92859) (not b_lambda!4091) (not b!92852) (not b!92854) (not b!92853) (not b_next!2365) (not mapNonEmpty!3625) tp_is_empty!2599 (not b!92862) (not b!92842) (not b!92863) (not b!92861) (not b!92850) b_and!5649 (not b_next!2367) b_and!5651 (not mapNonEmpty!3626) (not start!11274))
(check-sat b_and!5649 b_and!5651 (not b_next!2365) (not b_next!2367))
(get-model)

(declare-fun b_lambda!4097 () Bool)

(assert (= b_lambda!4091 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4097)))

(check-sat (not b!92843) (not b_lambda!4097) (not b!92847) (not b!92859) (not b!92852) (not b!92854) (not b!92853) (not b_next!2365) (not mapNonEmpty!3625) tp_is_empty!2599 (not b!92862) (not b!92842) (not b!92863) (not b!92861) (not b!92850) b_and!5649 (not b_next!2367) b_and!5651 (not mapNonEmpty!3626) (not start!11274))
(check-sat b_and!5649 b_and!5651 (not b_next!2365) (not b_next!2367))
(get-model)

(declare-fun d!24415 () Bool)

(declare-fun res!47256 () Bool)

(declare-fun e!60725 () Bool)

(assert (=> d!24415 (=> (not res!47256) (not e!60725))))

(declare-fun simpleValid!64 (LongMapFixedSize!820) Bool)

(assert (=> d!24415 (= res!47256 (simpleValid!64 (v!2738 (underlying!317 thiss!992))))))

(assert (=> d!24415 (= (valid!372 (v!2738 (underlying!317 thiss!992))) e!60725)))

(declare-fun b!93008 () Bool)

(declare-fun res!47257 () Bool)

(assert (=> b!93008 (=> (not res!47257) (not e!60725))))

(declare-fun arrayCountValidKeys!0 (array!4149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93008 (= res!47257 (= (arrayCountValidKeys!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))) (_size!459 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93009 () Bool)

(declare-fun res!47258 () Bool)

(assert (=> b!93009 (=> (not res!47258) (not e!60725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4149 (_ BitVec 32)) Bool)

(assert (=> b!93009 (= res!47258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93010 () Bool)

(assert (=> b!93010 (= e!60725 (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 Nil!1563))))

(assert (= (and d!24415 res!47256) b!93008))

(assert (= (and b!93008 res!47257) b!93009))

(assert (= (and b!93009 res!47258) b!93010))

(declare-fun m!100291 () Bool)

(assert (=> d!24415 m!100291))

(declare-fun m!100293 () Bool)

(assert (=> b!93008 m!100293))

(declare-fun m!100295 () Bool)

(assert (=> b!93009 m!100295))

(declare-fun m!100297 () Bool)

(assert (=> b!93010 m!100297))

(assert (=> b!92847 d!24415))

(declare-fun d!24417 () Bool)

(assert (=> d!24417 (= (valid!373 thiss!992) (valid!372 (v!2738 (underlying!317 thiss!992))))))

(declare-fun bs!3839 () Bool)

(assert (= bs!3839 d!24417))

(assert (=> bs!3839 m!100075))

(assert (=> start!11274 d!24417))

(declare-fun d!24419 () Bool)

(declare-fun e!60731 () Bool)

(assert (=> d!24419 e!60731))

(declare-fun res!47261 () Bool)

(assert (=> d!24419 (=> res!47261 e!60731)))

(declare-fun lt!45873 () Bool)

(assert (=> d!24419 (= res!47261 (not lt!45873))))

(declare-fun lt!45874 () Bool)

(assert (=> d!24419 (= lt!45873 lt!45874)))

(declare-fun lt!45875 () Unit!2774)

(declare-fun e!60730 () Unit!2774)

(assert (=> d!24419 (= lt!45875 e!60730)))

(declare-fun c!15435 () Bool)

(assert (=> d!24419 (= c!15435 lt!45874)))

(declare-fun containsKey!148 (List!1565 (_ BitVec 64)) Bool)

(assert (=> d!24419 (= lt!45874 (containsKey!148 (toList!760 lt!45748) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (=> d!24419 (= (contains!779 lt!45748 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)) lt!45873)))

(declare-fun b!93017 () Bool)

(declare-fun lt!45876 () Unit!2774)

(assert (=> b!93017 (= e!60730 lt!45876)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!97 (List!1565 (_ BitVec 64)) Unit!2774)

(assert (=> b!93017 (= lt!45876 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!760 lt!45748) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-datatypes ((Option!150 0))(
  ( (Some!149 (v!2744 V!3113)) (None!148) )
))
(declare-fun isDefined!98 (Option!150) Bool)

(declare-fun getValueByKey!144 (List!1565 (_ BitVec 64)) Option!150)

(assert (=> b!93017 (isDefined!98 (getValueByKey!144 (toList!760 lt!45748) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun b!93018 () Bool)

(declare-fun Unit!2782 () Unit!2774)

(assert (=> b!93018 (= e!60730 Unit!2782)))

(declare-fun b!93019 () Bool)

(assert (=> b!93019 (= e!60731 (isDefined!98 (getValueByKey!144 (toList!760 lt!45748) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))))

(assert (= (and d!24419 c!15435) b!93017))

(assert (= (and d!24419 (not c!15435)) b!93018))

(assert (= (and d!24419 (not res!47261)) b!93019))

(assert (=> d!24419 m!100083))

(declare-fun m!100299 () Bool)

(assert (=> d!24419 m!100299))

(assert (=> b!93017 m!100083))

(declare-fun m!100301 () Bool)

(assert (=> b!93017 m!100301))

(assert (=> b!93017 m!100083))

(declare-fun m!100303 () Bool)

(assert (=> b!93017 m!100303))

(assert (=> b!93017 m!100303))

(declare-fun m!100305 () Bool)

(assert (=> b!93017 m!100305))

(assert (=> b!93019 m!100083))

(assert (=> b!93019 m!100303))

(assert (=> b!93019 m!100303))

(assert (=> b!93019 m!100305))

(assert (=> b!92854 d!24419))

(declare-fun bm!9155 () Bool)

(declare-fun call!9161 () Bool)

(declare-fun call!9163 () Bool)

(assert (=> bm!9155 (= call!9161 call!9163)))

(declare-fun b!93104 () Bool)

(declare-fun c!15468 () Bool)

(declare-datatypes ((SeekEntryResult!252 0))(
  ( (MissingZero!252 (index!3149 (_ BitVec 32))) (Found!252 (index!3150 (_ BitVec 32))) (Intermediate!252 (undefined!1064 Bool) (index!3151 (_ BitVec 32)) (x!12575 (_ BitVec 32))) (Undefined!252) (MissingVacant!252 (index!3152 (_ BitVec 32))) )
))
(declare-fun lt!45951 () SeekEntryResult!252)

(assert (=> b!93104 (= c!15468 ((_ is MissingVacant!252) lt!45951))))

(declare-fun e!60796 () Bool)

(declare-fun e!60784 () Bool)

(assert (=> b!93104 (= e!60796 e!60784)))

(declare-fun bm!9156 () Bool)

(declare-fun call!9178 () Bool)

(declare-fun call!9165 () Bool)

(assert (=> bm!9156 (= call!9178 call!9165)))

(declare-fun bm!9157 () Bool)

(declare-fun call!9159 () Bool)

(assert (=> bm!9157 (= call!9159 call!9178)))

(declare-fun b!93105 () Bool)

(declare-fun e!60780 () Bool)

(assert (=> b!93105 (= e!60780 (not call!9161))))

(declare-fun bm!9158 () Bool)

(declare-fun call!9160 () Bool)

(declare-fun call!9174 () Bool)

(assert (=> bm!9158 (= call!9160 call!9174)))

(declare-fun b!93106 () Bool)

(declare-fun e!60779 () Bool)

(assert (=> b!93106 (= e!60779 (not call!9161))))

(declare-fun bm!9159 () Bool)

(declare-fun call!9171 () ListLongMap!1489)

(declare-fun call!9172 () ListLongMap!1489)

(assert (=> bm!9159 (= call!9171 call!9172)))

(declare-fun lt!45939 () (_ BitVec 32))

(declare-fun lt!45954 () (_ BitVec 32))

(declare-fun bm!9160 () Bool)

(declare-fun c!15477 () Bool)

(declare-fun lt!45957 () SeekEntryResult!252)

(declare-fun c!15471 () Bool)

(declare-fun call!9175 () ListLongMap!1489)

(declare-fun c!15464 () Bool)

(assert (=> bm!9160 (= call!9175 (getCurrentListMap!443 (_keys!4105 newMap!16) (ite (or c!15477 c!15464) (_values!2407 newMap!16) (array!4152 (store (arr!1973 (_values!2407 newMap!16)) (index!3150 lt!45957) (ValueCellFull!956 lt!45733)) (size!2222 (_values!2407 newMap!16)))) (mask!6493 newMap!16) (ite c!15477 (ite c!15471 lt!45954 lt!45939) (extraKeys!2253 newMap!16)) (ite (and c!15477 c!15471) lt!45733 (zeroValue!2311 newMap!16)) (ite c!15477 (ite c!15471 (minValue!2311 newMap!16) lt!45733) (minValue!2311 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93107 () Bool)

(declare-fun e!60792 () Bool)

(declare-fun lt!45932 () SeekEntryResult!252)

(assert (=> b!93107 (= e!60792 ((_ is Undefined!252) lt!45932))))

(declare-fun bm!9161 () Bool)

(assert (=> bm!9161 (= call!9163 (arrayContainsKey!0 (_keys!4105 newMap!16) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!93108 () Bool)

(declare-fun e!60777 () Unit!2774)

(declare-fun lt!45941 () Unit!2774)

(assert (=> b!93108 (= e!60777 lt!45941)))

(declare-fun call!9162 () Unit!2774)

(assert (=> b!93108 (= lt!45941 call!9162)))

(declare-fun call!9169 () SeekEntryResult!252)

(assert (=> b!93108 (= lt!45951 call!9169)))

(declare-fun c!15474 () Bool)

(assert (=> b!93108 (= c!15474 ((_ is MissingZero!252) lt!45951))))

(assert (=> b!93108 e!60796))

(declare-fun bm!9162 () Bool)

(declare-fun call!9173 () SeekEntryResult!252)

(assert (=> bm!9162 (= call!9169 call!9173)))

(declare-fun b!93109 () Bool)

(declare-fun e!60783 () tuple2!2280)

(declare-fun e!60786 () tuple2!2280)

(assert (=> b!93109 (= e!60783 e!60786)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4149 (_ BitVec 32)) SeekEntryResult!252)

(assert (=> b!93109 (= lt!45957 (seekEntryOrOpen!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (_keys!4105 newMap!16) (mask!6493 newMap!16)))))

(assert (=> b!93109 (= c!15464 ((_ is Undefined!252) lt!45957))))

(declare-fun b!93110 () Bool)

(assert (=> b!93110 (= e!60784 ((_ is Undefined!252) lt!45951))))

(declare-fun b!93111 () Bool)

(declare-fun c!15469 () Bool)

(assert (=> b!93111 (= c!15469 ((_ is MissingVacant!252) lt!45932))))

(declare-fun e!60795 () Bool)

(assert (=> b!93111 (= e!60795 e!60792)))

(declare-fun b!93112 () Bool)

(declare-fun e!60791 () Bool)

(declare-fun e!60793 () Bool)

(assert (=> b!93112 (= e!60791 e!60793)))

(declare-fun c!15475 () Bool)

(declare-fun lt!45952 () tuple2!2280)

(assert (=> b!93112 (= c!15475 (_1!1151 lt!45952))))

(declare-fun bm!9163 () Bool)

(declare-fun call!9180 () ListLongMap!1489)

(assert (=> bm!9163 (= call!9180 (map!1223 newMap!16))))

(declare-fun b!93113 () Bool)

(declare-fun lt!45946 () Unit!2774)

(assert (=> b!93113 (= lt!45946 e!60777)))

(declare-fun c!15467 () Bool)

(declare-fun call!9179 () Bool)

(assert (=> b!93113 (= c!15467 call!9179)))

(assert (=> b!93113 (= e!60786 (tuple2!2281 false newMap!16))))

(declare-fun bm!9164 () Bool)

(assert (=> bm!9164 (= call!9173 (seekEntryOrOpen!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (_keys!4105 newMap!16) (mask!6493 newMap!16)))))

(declare-fun bm!9165 () Bool)

(declare-fun e!60776 () ListLongMap!1489)

(assert (=> bm!9165 (= call!9172 (+!123 e!60776 (ite c!15477 (ite c!15471 (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 lt!45733) (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 lt!45733)) (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733))))))

(declare-fun c!15476 () Bool)

(assert (=> bm!9165 (= c!15476 c!15477)))

(declare-fun b!93114 () Bool)

(declare-fun res!47291 () Bool)

(declare-fun e!60794 () Bool)

(assert (=> b!93114 (=> (not res!47291) (not e!60794))))

(assert (=> b!93114 (= res!47291 call!9160)))

(assert (=> b!93114 (= e!60795 e!60794)))

(declare-fun bm!9166 () Bool)

(declare-fun call!9166 () Bool)

(assert (=> bm!9166 (= call!9166 call!9163)))

(declare-fun e!60785 () Bool)

(declare-fun b!93115 () Bool)

(declare-fun lt!45931 () SeekEntryResult!252)

(assert (=> b!93115 (= e!60785 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3150 lt!45931)) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun c!15470 () Bool)

(declare-fun bm!9167 () Bool)

(declare-fun call!9164 () tuple2!2280)

(declare-fun updateHelperNewKey!37 (LongMapFixedSize!820 (_ BitVec 64) V!3113 (_ BitVec 32)) tuple2!2280)

(assert (=> bm!9167 (= call!9164 (updateHelperNewKey!37 newMap!16 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 (ite c!15470 (index!3152 lt!45957) (index!3149 lt!45957))))))

(declare-fun c!15472 () Bool)

(declare-fun lt!45945 () SeekEntryResult!252)

(declare-fun c!15473 () Bool)

(declare-fun bm!9168 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9168 (= call!9165 (inRange!0 (ite c!15464 (ite c!15467 (index!3150 lt!45931) (ite c!15474 (index!3149 lt!45951) (index!3152 lt!45951))) (ite c!15473 (index!3150 lt!45945) (ite c!15472 (index!3149 lt!45932) (index!3152 lt!45932)))) (mask!6493 newMap!16)))))

(declare-fun b!93116 () Bool)

(declare-fun e!60788 () Unit!2774)

(declare-fun lt!45944 () Unit!2774)

(assert (=> b!93116 (= e!60788 lt!45944)))

(declare-fun call!9168 () Unit!2774)

(assert (=> b!93116 (= lt!45944 call!9168)))

(declare-fun call!9176 () SeekEntryResult!252)

(assert (=> b!93116 (= lt!45945 call!9176)))

(declare-fun res!47299 () Bool)

(assert (=> b!93116 (= res!47299 ((_ is Found!252) lt!45945))))

(declare-fun e!60790 () Bool)

(assert (=> b!93116 (=> (not res!47299) (not e!60790))))

(assert (=> b!93116 e!60790))

(declare-fun b!93117 () Bool)

(declare-fun e!60781 () ListLongMap!1489)

(declare-fun call!9170 () ListLongMap!1489)

(assert (=> b!93117 (= e!60781 call!9170)))

(declare-fun bm!9169 () Bool)

(declare-fun call!9158 () ListLongMap!1489)

(assert (=> bm!9169 (= call!9158 (map!1223 (_2!1151 lt!45952)))))

(declare-fun b!93118 () Bool)

(declare-fun call!9181 () ListLongMap!1489)

(assert (=> b!93118 (= e!60781 call!9181)))

(declare-fun b!93119 () Bool)

(declare-fun e!60797 () Bool)

(assert (=> b!93119 (= e!60793 e!60797)))

(declare-fun res!47293 () Bool)

(assert (=> b!93119 (= res!47293 (contains!779 call!9158 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (=> b!93119 (=> (not res!47293) (not e!60797))))

(declare-fun b!93120 () Bool)

(declare-fun e!60789 () tuple2!2280)

(declare-fun lt!45955 () tuple2!2280)

(assert (=> b!93120 (= e!60789 (tuple2!2281 (_1!1151 lt!45955) (_2!1151 lt!45955)))))

(assert (=> b!93120 (= lt!45955 call!9164)))

(declare-fun b!93121 () Bool)

(declare-fun e!60787 () Bool)

(assert (=> b!93121 (= e!60792 e!60787)))

(declare-fun res!47298 () Bool)

(assert (=> b!93121 (= res!47298 call!9160)))

(assert (=> b!93121 (=> (not res!47298) (not e!60787))))

(declare-fun b!93122 () Bool)

(declare-fun e!60782 () tuple2!2280)

(assert (=> b!93122 (= e!60789 e!60782)))

(declare-fun c!15466 () Bool)

(assert (=> b!93122 (= c!15466 ((_ is MissingZero!252) lt!45957))))

(declare-fun bm!9170 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) Int) Unit!2774)

(assert (=> bm!9170 (= call!9162 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (defaultEntry!2424 newMap!16)))))

(declare-fun b!93123 () Bool)

(declare-fun lt!45953 () Unit!2774)

(declare-fun lt!45937 () Unit!2774)

(assert (=> b!93123 (= lt!45953 lt!45937)))

(declare-fun call!9167 () ListLongMap!1489)

(assert (=> b!93123 (= call!9171 call!9167)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 V!3113 Int) Unit!2774)

(assert (=> b!93123 (= lt!45937 (lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) lt!45939 (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) lt!45733 (defaultEntry!2424 newMap!16)))))

(assert (=> b!93123 (= lt!45939 (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!60778 () tuple2!2280)

(assert (=> b!93123 (= e!60778 (tuple2!2281 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6493 newMap!16) (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000010) (zeroValue!2311 newMap!16) lt!45733 (_size!459 newMap!16) (_keys!4105 newMap!16) (_values!2407 newMap!16) (_vacant!459 newMap!16))))))

(declare-fun b!93124 () Bool)

(assert (=> b!93124 (= e!60790 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3150 lt!45945)) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun b!93125 () Bool)

(declare-fun Unit!2783 () Unit!2774)

(assert (=> b!93125 (= e!60788 Unit!2783)))

(declare-fun lt!45948 () Unit!2774)

(assert (=> b!93125 (= lt!45948 call!9162)))

(assert (=> b!93125 (= lt!45932 call!9176)))

(assert (=> b!93125 (= c!15472 ((_ is MissingZero!252) lt!45932))))

(assert (=> b!93125 e!60795))

(declare-fun lt!45947 () Unit!2774)

(assert (=> b!93125 (= lt!45947 lt!45948)))

(assert (=> b!93125 false))

(declare-fun b!93126 () Bool)

(declare-fun res!47292 () Bool)

(assert (=> b!93126 (= res!47292 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3152 lt!45932)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93126 (=> (not res!47292) (not e!60787))))

(declare-fun b!93127 () Bool)

(declare-fun res!47301 () Bool)

(assert (=> b!93127 (= res!47301 call!9174)))

(assert (=> b!93127 (=> (not res!47301) (not e!60790))))

(declare-fun b!93128 () Bool)

(assert (=> b!93128 (= e!60787 (not call!9166))))

(declare-fun b!93129 () Bool)

(declare-fun lt!45940 () Unit!2774)

(declare-fun lt!45935 () Unit!2774)

(assert (=> b!93129 (= lt!45940 lt!45935)))

(assert (=> b!93129 call!9179))

(declare-fun lt!45943 () array!4151)

(declare-fun lemmaValidKeyInArrayIsInListMap!96 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) Unit!2774)

(assert (=> b!93129 (= lt!45935 (lemmaValidKeyInArrayIsInListMap!96 (_keys!4105 newMap!16) lt!45943 (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (index!3150 lt!45957) (defaultEntry!2424 newMap!16)))))

(assert (=> b!93129 (= lt!45943 (array!4152 (store (arr!1973 (_values!2407 newMap!16)) (index!3150 lt!45957) (ValueCellFull!956 lt!45733)) (size!2222 (_values!2407 newMap!16))))))

(declare-fun lt!45942 () Unit!2774)

(declare-fun lt!45949 () Unit!2774)

(assert (=> b!93129 (= lt!45942 lt!45949)))

(assert (=> b!93129 (= call!9172 call!9170)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) (_ BitVec 64) V!3113 Int) Unit!2774)

(assert (=> b!93129 (= lt!45949 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (index!3150 lt!45957) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 (defaultEntry!2424 newMap!16)))))

(declare-fun lt!45933 () Unit!2774)

(assert (=> b!93129 (= lt!45933 e!60788)))

(assert (=> b!93129 (= c!15473 (contains!779 (getCurrentListMap!443 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (=> b!93129 (= e!60782 (tuple2!2281 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (_size!459 newMap!16) (_keys!4105 newMap!16) (array!4152 (store (arr!1973 (_values!2407 newMap!16)) (index!3150 lt!45957) (ValueCellFull!956 lt!45733)) (size!2222 (_values!2407 newMap!16))) (_vacant!459 newMap!16))))))

(declare-fun b!93130 () Bool)

(declare-fun lt!45938 () Unit!2774)

(declare-fun lt!45950 () Unit!2774)

(assert (=> b!93130 (= lt!45938 lt!45950)))

(assert (=> b!93130 (= call!9171 call!9167)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!37 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 V!3113 Int) Unit!2774)

(assert (=> b!93130 (= lt!45950 (lemmaChangeZeroKeyThenAddPairToListMap!37 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) lt!45954 (zeroValue!2311 newMap!16) lt!45733 (minValue!2311 newMap!16) (defaultEntry!2424 newMap!16)))))

(assert (=> b!93130 (= lt!45954 (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!93130 (= e!60778 (tuple2!2281 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6493 newMap!16) (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000001) lt!45733 (minValue!2311 newMap!16) (_size!459 newMap!16) (_keys!4105 newMap!16) (_values!2407 newMap!16) (_vacant!459 newMap!16))))))

(declare-fun b!93131 () Bool)

(declare-fun res!47302 () Bool)

(assert (=> b!93131 (= res!47302 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3152 lt!45951)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93131 (=> (not res!47302) (not e!60779))))

(declare-fun b!93132 () Bool)

(assert (=> b!93132 (= e!60794 (not call!9166))))

(declare-fun b!93133 () Bool)

(declare-fun lt!45936 () tuple2!2280)

(assert (=> b!93133 (= lt!45936 call!9164)))

(assert (=> b!93133 (= e!60782 (tuple2!2281 (_1!1151 lt!45936) (_2!1151 lt!45936)))))

(declare-fun bm!9171 () Bool)

(assert (=> bm!9171 (= call!9174 call!9165)))

(declare-fun b!93134 () Bool)

(declare-fun res!47294 () Bool)

(assert (=> b!93134 (= res!47294 call!9178)))

(assert (=> b!93134 (=> (not res!47294) (not e!60785))))

(declare-fun b!93135 () Bool)

(assert (=> b!93135 (= e!60783 e!60778)))

(assert (=> b!93135 (= c!15471 (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9172 () Bool)

(assert (=> bm!9172 (= call!9170 call!9175)))

(declare-fun bm!9173 () Bool)

(declare-fun call!9177 () ListLongMap!1489)

(assert (=> bm!9173 (= call!9177 call!9181)))

(declare-fun b!93136 () Bool)

(declare-fun res!47290 () Bool)

(assert (=> b!93136 (=> (not res!47290) (not e!60780))))

(assert (=> b!93136 (= res!47290 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3149 lt!45951)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9174 () Bool)

(assert (=> bm!9174 (= call!9176 call!9173)))

(declare-fun b!93137 () Bool)

(declare-fun res!47300 () Bool)

(assert (=> b!93137 (=> (not res!47300) (not e!60794))))

(assert (=> b!93137 (= res!47300 (= (select (arr!1972 (_keys!4105 newMap!16)) (index!3149 lt!45932)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93138 () Bool)

(assert (=> b!93138 (= e!60776 call!9177)))

(declare-fun d!24421 () Bool)

(assert (=> d!24421 e!60791))

(declare-fun res!47296 () Bool)

(assert (=> d!24421 (=> (not res!47296) (not e!60791))))

(assert (=> d!24421 (= res!47296 (valid!372 (_2!1151 lt!45952)))))

(assert (=> d!24421 (= lt!45952 e!60783)))

(assert (=> d!24421 (= c!15477 (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvneg (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))))

(assert (=> d!24421 (valid!372 newMap!16)))

(assert (=> d!24421 (= (update!137 newMap!16 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733) lt!45952)))

(declare-fun bm!9175 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) Int) Unit!2774)

(assert (=> bm!9175 (= call!9168 (lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (defaultEntry!2424 newMap!16)))))

(declare-fun b!93139 () Bool)

(declare-fun Unit!2784 () Unit!2774)

(assert (=> b!93139 (= e!60777 Unit!2784)))

(declare-fun lt!45934 () Unit!2774)

(assert (=> b!93139 (= lt!45934 call!9168)))

(assert (=> b!93139 (= lt!45931 call!9169)))

(declare-fun res!47297 () Bool)

(assert (=> b!93139 (= res!47297 ((_ is Found!252) lt!45931))))

(assert (=> b!93139 (=> (not res!47297) (not e!60785))))

(assert (=> b!93139 e!60785))

(declare-fun lt!45956 () Unit!2774)

(assert (=> b!93139 (= lt!45956 lt!45934)))

(assert (=> b!93139 false))

(declare-fun bm!9176 () Bool)

(assert (=> bm!9176 (= call!9167 call!9175)))

(declare-fun b!93140 () Bool)

(assert (=> b!93140 (= e!60784 e!60779)))

(declare-fun res!47295 () Bool)

(assert (=> b!93140 (= res!47295 call!9159)))

(assert (=> b!93140 (=> (not res!47295) (not e!60779))))

(declare-fun bm!9177 () Bool)

(assert (=> bm!9177 (= call!9181 (getCurrentListMap!443 (_keys!4105 newMap!16) (ite c!15477 (_values!2407 newMap!16) lt!45943) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93141 () Bool)

(assert (=> b!93141 (= e!60793 (= call!9158 call!9180))))

(declare-fun bm!9178 () Bool)

(declare-fun c!15465 () Bool)

(assert (=> bm!9178 (= c!15465 c!15464)))

(assert (=> bm!9178 (= call!9179 (contains!779 e!60781 (ite c!15464 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (select (arr!1972 (_keys!4105 newMap!16)) (index!3150 lt!45957)))))))

(declare-fun b!93142 () Bool)

(assert (=> b!93142 (= c!15470 ((_ is MissingVacant!252) lt!45957))))

(assert (=> b!93142 (= e!60786 e!60789)))

(declare-fun b!93143 () Bool)

(assert (=> b!93143 (= e!60776 (getCurrentListMap!443 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93144 () Bool)

(declare-fun res!47303 () Bool)

(assert (=> b!93144 (=> (not res!47303) (not e!60780))))

(assert (=> b!93144 (= res!47303 call!9159)))

(assert (=> b!93144 (= e!60796 e!60780)))

(declare-fun b!93145 () Bool)

(assert (=> b!93145 (= e!60797 (= call!9158 (+!123 call!9180 (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733))))))

(assert (= (and d!24421 c!15477) b!93135))

(assert (= (and d!24421 (not c!15477)) b!93109))

(assert (= (and b!93135 c!15471) b!93130))

(assert (= (and b!93135 (not c!15471)) b!93123))

(assert (= (or b!93130 b!93123) bm!9176))

(assert (= (or b!93130 b!93123) bm!9173))

(assert (= (or b!93130 b!93123) bm!9159))

(assert (= (and b!93109 c!15464) b!93113))

(assert (= (and b!93109 (not c!15464)) b!93142))

(assert (= (and b!93113 c!15467) b!93139))

(assert (= (and b!93113 (not c!15467)) b!93108))

(assert (= (and b!93139 res!47297) b!93134))

(assert (= (and b!93134 res!47294) b!93115))

(assert (= (and b!93108 c!15474) b!93144))

(assert (= (and b!93108 (not c!15474)) b!93104))

(assert (= (and b!93144 res!47303) b!93136))

(assert (= (and b!93136 res!47290) b!93105))

(assert (= (and b!93104 c!15468) b!93140))

(assert (= (and b!93104 (not c!15468)) b!93110))

(assert (= (and b!93140 res!47295) b!93131))

(assert (= (and b!93131 res!47302) b!93106))

(assert (= (or b!93144 b!93140) bm!9157))

(assert (= (or b!93105 b!93106) bm!9155))

(assert (= (or b!93134 bm!9157) bm!9156))

(assert (= (or b!93139 b!93108) bm!9162))

(assert (= (and b!93142 c!15470) b!93120))

(assert (= (and b!93142 (not c!15470)) b!93122))

(assert (= (and b!93122 c!15466) b!93133))

(assert (= (and b!93122 (not c!15466)) b!93129))

(assert (= (and b!93129 c!15473) b!93116))

(assert (= (and b!93129 (not c!15473)) b!93125))

(assert (= (and b!93116 res!47299) b!93127))

(assert (= (and b!93127 res!47301) b!93124))

(assert (= (and b!93125 c!15472) b!93114))

(assert (= (and b!93125 (not c!15472)) b!93111))

(assert (= (and b!93114 res!47291) b!93137))

(assert (= (and b!93137 res!47300) b!93132))

(assert (= (and b!93111 c!15469) b!93121))

(assert (= (and b!93111 (not c!15469)) b!93107))

(assert (= (and b!93121 res!47298) b!93126))

(assert (= (and b!93126 res!47292) b!93128))

(assert (= (or b!93114 b!93121) bm!9158))

(assert (= (or b!93132 b!93128) bm!9166))

(assert (= (or b!93127 bm!9158) bm!9171))

(assert (= (or b!93116 b!93125) bm!9174))

(assert (= (or b!93120 b!93133) bm!9167))

(assert (= (or bm!9155 bm!9166) bm!9161))

(assert (= (or bm!9162 bm!9174) bm!9164))

(assert (= (or b!93113 b!93129) bm!9172))

(assert (= (or bm!9156 bm!9171) bm!9168))

(assert (= (or b!93139 b!93116) bm!9175))

(assert (= (or b!93108 b!93125) bm!9170))

(assert (= (or b!93113 b!93129) bm!9178))

(assert (= (and bm!9178 c!15465) b!93117))

(assert (= (and bm!9178 (not c!15465)) b!93118))

(assert (= (or bm!9176 bm!9172) bm!9160))

(assert (= (or bm!9173 b!93118) bm!9177))

(assert (= (or bm!9159 b!93129) bm!9165))

(assert (= (and bm!9165 c!15476) b!93138))

(assert (= (and bm!9165 (not c!15476)) b!93143))

(assert (= (and d!24421 res!47296) b!93112))

(assert (= (and b!93112 c!15475) b!93119))

(assert (= (and b!93112 (not c!15475)) b!93141))

(assert (= (and b!93119 res!47293) b!93145))

(assert (= (or b!93119 b!93145 b!93141) bm!9169))

(assert (= (or b!93145 b!93141) bm!9163))

(declare-fun m!100307 () Bool)

(assert (=> b!93136 m!100307))

(declare-fun m!100309 () Bool)

(assert (=> b!93137 m!100309))

(assert (=> b!93109 m!100083))

(declare-fun m!100311 () Bool)

(assert (=> b!93109 m!100311))

(declare-fun m!100313 () Bool)

(assert (=> b!93131 m!100313))

(assert (=> bm!9175 m!100083))

(declare-fun m!100315 () Bool)

(assert (=> bm!9175 m!100315))

(declare-fun m!100317 () Bool)

(assert (=> d!24421 m!100317))

(assert (=> d!24421 m!100091))

(declare-fun m!100319 () Bool)

(assert (=> b!93145 m!100319))

(assert (=> bm!9164 m!100083))

(assert (=> bm!9164 m!100311))

(declare-fun m!100321 () Bool)

(assert (=> b!93124 m!100321))

(declare-fun m!100323 () Bool)

(assert (=> b!93130 m!100323))

(assert (=> b!93119 m!100083))

(declare-fun m!100325 () Bool)

(assert (=> b!93119 m!100325))

(assert (=> bm!9163 m!100095))

(declare-fun m!100327 () Bool)

(assert (=> b!93143 m!100327))

(declare-fun m!100329 () Bool)

(assert (=> b!93126 m!100329))

(declare-fun m!100331 () Bool)

(assert (=> b!93123 m!100331))

(declare-fun m!100333 () Bool)

(assert (=> bm!9169 m!100333))

(assert (=> bm!9170 m!100083))

(declare-fun m!100335 () Bool)

(assert (=> bm!9170 m!100335))

(assert (=> bm!9167 m!100083))

(declare-fun m!100337 () Bool)

(assert (=> bm!9167 m!100337))

(assert (=> bm!9161 m!100083))

(declare-fun m!100339 () Bool)

(assert (=> bm!9161 m!100339))

(assert (=> b!93129 m!100327))

(assert (=> b!93129 m!100083))

(declare-fun m!100341 () Bool)

(assert (=> b!93129 m!100341))

(declare-fun m!100343 () Bool)

(assert (=> b!93129 m!100343))

(declare-fun m!100345 () Bool)

(assert (=> b!93129 m!100345))

(assert (=> b!93129 m!100327))

(assert (=> b!93129 m!100083))

(declare-fun m!100347 () Bool)

(assert (=> b!93129 m!100347))

(declare-fun m!100349 () Bool)

(assert (=> bm!9178 m!100349))

(declare-fun m!100351 () Bool)

(assert (=> bm!9178 m!100351))

(declare-fun m!100353 () Bool)

(assert (=> b!93115 m!100353))

(assert (=> bm!9160 m!100343))

(declare-fun m!100355 () Bool)

(assert (=> bm!9160 m!100355))

(declare-fun m!100357 () Bool)

(assert (=> bm!9177 m!100357))

(declare-fun m!100359 () Bool)

(assert (=> bm!9168 m!100359))

(declare-fun m!100361 () Bool)

(assert (=> bm!9165 m!100361))

(assert (=> b!92854 d!24421))

(declare-fun d!24423 () Bool)

(declare-fun res!47304 () Bool)

(declare-fun e!60798 () Bool)

(assert (=> d!24423 (=> (not res!47304) (not e!60798))))

(assert (=> d!24423 (= res!47304 (simpleValid!64 (_2!1151 lt!45749)))))

(assert (=> d!24423 (= (valid!372 (_2!1151 lt!45749)) e!60798)))

(declare-fun b!93146 () Bool)

(declare-fun res!47305 () Bool)

(assert (=> b!93146 (=> (not res!47305) (not e!60798))))

(assert (=> b!93146 (= res!47305 (= (arrayCountValidKeys!0 (_keys!4105 (_2!1151 lt!45749)) #b00000000000000000000000000000000 (size!2221 (_keys!4105 (_2!1151 lt!45749)))) (_size!459 (_2!1151 lt!45749))))))

(declare-fun b!93147 () Bool)

(declare-fun res!47306 () Bool)

(assert (=> b!93147 (=> (not res!47306) (not e!60798))))

(assert (=> b!93147 (= res!47306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4105 (_2!1151 lt!45749)) (mask!6493 (_2!1151 lt!45749))))))

(declare-fun b!93148 () Bool)

(assert (=> b!93148 (= e!60798 (arrayNoDuplicates!0 (_keys!4105 (_2!1151 lt!45749)) #b00000000000000000000000000000000 Nil!1563))))

(assert (= (and d!24423 res!47304) b!93146))

(assert (= (and b!93146 res!47305) b!93147))

(assert (= (and b!93147 res!47306) b!93148))

(declare-fun m!100363 () Bool)

(assert (=> d!24423 m!100363))

(declare-fun m!100365 () Bool)

(assert (=> b!93146 m!100365))

(declare-fun m!100367 () Bool)

(assert (=> b!93147 m!100367))

(declare-fun m!100369 () Bool)

(assert (=> b!93148 m!100369))

(assert (=> b!92862 d!24423))

(declare-fun d!24425 () Bool)

(declare-fun c!15480 () Bool)

(assert (=> d!24425 (= c!15480 ((_ is ValueCellFull!956) (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun e!60801 () V!3113)

(assert (=> d!24425 (= (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!60801)))

(declare-fun b!93153 () Bool)

(declare-fun get!1257 (ValueCell!956 V!3113) V!3113)

(assert (=> b!93153 (= e!60801 (get!1257 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93154 () Bool)

(declare-fun get!1258 (ValueCell!956 V!3113) V!3113)

(assert (=> b!93154 (= e!60801 (get!1258 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24425 c!15480) b!93153))

(assert (= (and d!24425 (not c!15480)) b!93154))

(assert (=> b!93153 m!100133))

(assert (=> b!93153 m!100135))

(declare-fun m!100371 () Bool)

(assert (=> b!93153 m!100371))

(assert (=> b!93154 m!100133))

(assert (=> b!93154 m!100135))

(declare-fun m!100373 () Bool)

(assert (=> b!93154 m!100373))

(assert (=> b!92853 d!24425))

(declare-fun d!24427 () Bool)

(assert (=> d!24427 (= (+!123 (+!123 lt!45732 (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733)) (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) (+!123 (+!123 lt!45732 (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733)))))

(declare-fun lt!45960 () Unit!2774)

(declare-fun choose!563 (ListLongMap!1489 (_ BitVec 64) V!3113 (_ BitVec 64) V!3113) Unit!2774)

(assert (=> d!24427 (= lt!45960 (choose!563 lt!45732 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(assert (=> d!24427 (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24427 (= (addCommutativeForDiffKeys!42 lt!45732 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))) lt!45960)))

(declare-fun bs!3840 () Bool)

(assert (= bs!3840 d!24427))

(declare-fun m!100375 () Bool)

(assert (=> bs!3840 m!100375))

(declare-fun m!100377 () Bool)

(assert (=> bs!3840 m!100377))

(assert (=> bs!3840 m!100083))

(declare-fun m!100379 () Bool)

(assert (=> bs!3840 m!100379))

(declare-fun m!100381 () Bool)

(assert (=> bs!3840 m!100381))

(declare-fun m!100383 () Bool)

(assert (=> bs!3840 m!100383))

(assert (=> bs!3840 m!100381))

(assert (=> bs!3840 m!100375))

(assert (=> b!92863 d!24427))

(declare-fun b!93179 () Bool)

(declare-fun res!47318 () Bool)

(declare-fun e!60819 () Bool)

(assert (=> b!93179 (=> (not res!47318) (not e!60819))))

(declare-fun lt!45976 () ListLongMap!1489)

(assert (=> b!93179 (= res!47318 (not (contains!779 lt!45976 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93180 () Bool)

(declare-fun e!60818 () ListLongMap!1489)

(declare-fun call!9184 () ListLongMap!1489)

(assert (=> b!93180 (= e!60818 call!9184)))

(declare-fun b!93181 () Bool)

(declare-fun e!60816 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93181 (= e!60816 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93181 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun d!24429 () Bool)

(assert (=> d!24429 e!60819))

(declare-fun res!47315 () Bool)

(assert (=> d!24429 (=> (not res!47315) (not e!60819))))

(assert (=> d!24429 (= res!47315 (not (contains!779 lt!45976 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!60817 () ListLongMap!1489)

(assert (=> d!24429 (= lt!45976 e!60817)))

(declare-fun c!15490 () Bool)

(assert (=> d!24429 (= c!15490 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24429 (validMask!0 (mask!6493 (v!2738 (underlying!317 thiss!992))))))

(assert (=> d!24429 (= (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) lt!45976)))

(declare-fun b!93182 () Bool)

(assert (=> b!93182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(assert (=> b!93182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2222 (_values!2407 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun e!60820 () Bool)

(declare-fun apply!88 (ListLongMap!1489 (_ BitVec 64)) V!3113)

(assert (=> b!93182 (= e!60820 (= (apply!88 lt!45976 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!93183 () Bool)

(declare-fun e!60821 () Bool)

(declare-fun e!60822 () Bool)

(assert (=> b!93183 (= e!60821 e!60822)))

(declare-fun c!15489 () Bool)

(assert (=> b!93183 (= c!15489 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93184 () Bool)

(assert (=> b!93184 (= e!60817 e!60818)))

(declare-fun c!15491 () Bool)

(assert (=> b!93184 (= c!15491 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93185 () Bool)

(assert (=> b!93185 (= e!60822 (= lt!45976 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93186 () Bool)

(assert (=> b!93186 (= e!60817 (ListLongMap!1490 Nil!1562))))

(declare-fun b!93187 () Bool)

(assert (=> b!93187 (= e!60819 e!60821)))

(declare-fun c!15492 () Bool)

(assert (=> b!93187 (= c!15492 e!60816)))

(declare-fun res!47316 () Bool)

(assert (=> b!93187 (=> (not res!47316) (not e!60816))))

(assert (=> b!93187 (= res!47316 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93188 () Bool)

(declare-fun isEmpty!353 (ListLongMap!1489) Bool)

(assert (=> b!93188 (= e!60822 (isEmpty!353 lt!45976))))

(declare-fun b!93189 () Bool)

(assert (=> b!93189 (= e!60821 e!60820)))

(assert (=> b!93189 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun res!47317 () Bool)

(assert (=> b!93189 (= res!47317 (contains!779 lt!45976 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93189 (=> (not res!47317) (not e!60820))))

(declare-fun b!93190 () Bool)

(declare-fun lt!45981 () Unit!2774)

(declare-fun lt!45980 () Unit!2774)

(assert (=> b!93190 (= lt!45981 lt!45980)))

(declare-fun lt!45979 () V!3113)

(declare-fun lt!45975 () (_ BitVec 64))

(declare-fun lt!45978 () ListLongMap!1489)

(declare-fun lt!45977 () (_ BitVec 64))

(assert (=> b!93190 (not (contains!779 (+!123 lt!45978 (tuple2!2283 lt!45975 lt!45979)) lt!45977))))

(declare-fun addStillNotContains!38 (ListLongMap!1489 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2774)

(assert (=> b!93190 (= lt!45980 (addStillNotContains!38 lt!45978 lt!45975 lt!45979 lt!45977))))

(assert (=> b!93190 (= lt!45977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!93190 (= lt!45979 (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!93190 (= lt!45975 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93190 (= lt!45978 call!9184)))

(assert (=> b!93190 (= e!60818 (+!123 call!9184 (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!9181 () Bool)

(assert (=> bm!9181 (= call!9184 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(assert (= (and d!24429 c!15490) b!93186))

(assert (= (and d!24429 (not c!15490)) b!93184))

(assert (= (and b!93184 c!15491) b!93190))

(assert (= (and b!93184 (not c!15491)) b!93180))

(assert (= (or b!93190 b!93180) bm!9181))

(assert (= (and d!24429 res!47315) b!93179))

(assert (= (and b!93179 res!47318) b!93187))

(assert (= (and b!93187 res!47316) b!93181))

(assert (= (and b!93187 c!15492) b!93189))

(assert (= (and b!93187 (not c!15492)) b!93183))

(assert (= (and b!93189 res!47317) b!93182))

(assert (= (and b!93183 c!15489) b!93185))

(assert (= (and b!93183 (not c!15489)) b!93188))

(declare-fun b_lambda!4099 () Bool)

(assert (=> (not b_lambda!4099) (not b!93182)))

(assert (=> b!93182 t!5431))

(declare-fun b_and!5669 () Bool)

(assert (= b_and!5649 (and (=> t!5431 result!3137) b_and!5669)))

(assert (=> b!93182 t!5433))

(declare-fun b_and!5671 () Bool)

(assert (= b_and!5651 (and (=> t!5433 result!3141) b_and!5671)))

(declare-fun b_lambda!4101 () Bool)

(assert (=> (not b_lambda!4101) (not b!93190)))

(assert (=> b!93190 t!5431))

(declare-fun b_and!5673 () Bool)

(assert (= b_and!5669 (and (=> t!5431 result!3137) b_and!5673)))

(assert (=> b!93190 t!5433))

(declare-fun b_and!5675 () Bool)

(assert (= b_and!5671 (and (=> t!5433 result!3141) b_and!5675)))

(declare-fun m!100385 () Bool)

(assert (=> b!93184 m!100385))

(assert (=> b!93184 m!100385))

(declare-fun m!100387 () Bool)

(assert (=> b!93184 m!100387))

(assert (=> b!93182 m!100385))

(declare-fun m!100389 () Bool)

(assert (=> b!93182 m!100389))

(assert (=> b!93182 m!100135))

(declare-fun m!100391 () Bool)

(assert (=> b!93182 m!100391))

(assert (=> b!93182 m!100391))

(assert (=> b!93182 m!100135))

(declare-fun m!100393 () Bool)

(assert (=> b!93182 m!100393))

(assert (=> b!93182 m!100385))

(declare-fun m!100395 () Bool)

(assert (=> b!93190 m!100395))

(declare-fun m!100397 () Bool)

(assert (=> b!93190 m!100397))

(declare-fun m!100399 () Bool)

(assert (=> b!93190 m!100399))

(assert (=> b!93190 m!100135))

(assert (=> b!93190 m!100397))

(declare-fun m!100401 () Bool)

(assert (=> b!93190 m!100401))

(assert (=> b!93190 m!100391))

(assert (=> b!93190 m!100391))

(assert (=> b!93190 m!100135))

(assert (=> b!93190 m!100393))

(assert (=> b!93190 m!100385))

(declare-fun m!100403 () Bool)

(assert (=> bm!9181 m!100403))

(declare-fun m!100405 () Bool)

(assert (=> b!93179 m!100405))

(declare-fun m!100407 () Bool)

(assert (=> b!93188 m!100407))

(assert (=> b!93189 m!100385))

(assert (=> b!93189 m!100385))

(declare-fun m!100409 () Bool)

(assert (=> b!93189 m!100409))

(declare-fun m!100411 () Bool)

(assert (=> d!24429 m!100411))

(declare-fun m!100413 () Bool)

(assert (=> d!24429 m!100413))

(assert (=> b!93185 m!100403))

(assert (=> b!93181 m!100385))

(assert (=> b!93181 m!100385))

(assert (=> b!93181 m!100387))

(assert (=> b!92863 d!24429))

(declare-fun d!24431 () Bool)

(declare-fun e!60825 () Bool)

(assert (=> d!24431 e!60825))

(declare-fun res!47323 () Bool)

(assert (=> d!24431 (=> (not res!47323) (not e!60825))))

(declare-fun lt!45992 () ListLongMap!1489)

(assert (=> d!24431 (= res!47323 (contains!779 lt!45992 (_1!1152 lt!45744)))))

(declare-fun lt!45993 () List!1565)

(assert (=> d!24431 (= lt!45992 (ListLongMap!1490 lt!45993))))

(declare-fun lt!45990 () Unit!2774)

(declare-fun lt!45991 () Unit!2774)

(assert (=> d!24431 (= lt!45990 lt!45991)))

(assert (=> d!24431 (= (getValueByKey!144 lt!45993 (_1!1152 lt!45744)) (Some!149 (_2!1152 lt!45744)))))

(declare-fun lemmaContainsTupThenGetReturnValue!64 (List!1565 (_ BitVec 64) V!3113) Unit!2774)

(assert (=> d!24431 (= lt!45991 (lemmaContainsTupThenGetReturnValue!64 lt!45993 (_1!1152 lt!45744) (_2!1152 lt!45744)))))

(declare-fun insertStrictlySorted!67 (List!1565 (_ BitVec 64) V!3113) List!1565)

(assert (=> d!24431 (= lt!45993 (insertStrictlySorted!67 (toList!760 lt!45746) (_1!1152 lt!45744) (_2!1152 lt!45744)))))

(assert (=> d!24431 (= (+!123 lt!45746 lt!45744) lt!45992)))

(declare-fun b!93195 () Bool)

(declare-fun res!47324 () Bool)

(assert (=> b!93195 (=> (not res!47324) (not e!60825))))

(assert (=> b!93195 (= res!47324 (= (getValueByKey!144 (toList!760 lt!45992) (_1!1152 lt!45744)) (Some!149 (_2!1152 lt!45744))))))

(declare-fun b!93196 () Bool)

(declare-fun contains!781 (List!1565 tuple2!2282) Bool)

(assert (=> b!93196 (= e!60825 (contains!781 (toList!760 lt!45992) lt!45744))))

(assert (= (and d!24431 res!47323) b!93195))

(assert (= (and b!93195 res!47324) b!93196))

(declare-fun m!100415 () Bool)

(assert (=> d!24431 m!100415))

(declare-fun m!100417 () Bool)

(assert (=> d!24431 m!100417))

(declare-fun m!100419 () Bool)

(assert (=> d!24431 m!100419))

(declare-fun m!100421 () Bool)

(assert (=> d!24431 m!100421))

(declare-fun m!100423 () Bool)

(assert (=> b!93195 m!100423))

(declare-fun m!100425 () Bool)

(assert (=> b!93196 m!100425))

(assert (=> b!92863 d!24431))

(declare-fun b!93239 () Bool)

(declare-fun e!60861 () Bool)

(declare-fun lt!46045 () ListLongMap!1489)

(assert (=> b!93239 (= e!60861 (= (apply!88 lt!46045 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun d!24433 () Bool)

(declare-fun e!60855 () Bool)

(assert (=> d!24433 e!60855))

(declare-fun res!47350 () Bool)

(assert (=> d!24433 (=> (not res!47350) (not e!60855))))

(assert (=> d!24433 (= res!47350 (or (bvsge from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))))

(declare-fun lt!46039 () ListLongMap!1489)

(assert (=> d!24433 (= lt!46045 lt!46039)))

(declare-fun lt!46043 () Unit!2774)

(declare-fun e!60853 () Unit!2774)

(assert (=> d!24433 (= lt!46043 e!60853)))

(declare-fun c!15509 () Bool)

(declare-fun e!60856 () Bool)

(assert (=> d!24433 (= c!15509 e!60856)))

(declare-fun res!47344 () Bool)

(assert (=> d!24433 (=> (not res!47344) (not e!60856))))

(assert (=> d!24433 (= res!47344 (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun e!60864 () ListLongMap!1489)

(assert (=> d!24433 (= lt!46039 e!60864)))

(declare-fun c!15506 () Bool)

(assert (=> d!24433 (= c!15506 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24433 (validMask!0 (mask!6493 (v!2738 (underlying!317 thiss!992))))))

(assert (=> d!24433 (= (getCurrentListMap!443 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) lt!46045)))

(declare-fun b!93240 () Bool)

(declare-fun e!60859 () Bool)

(declare-fun call!9202 () Bool)

(assert (=> b!93240 (= e!60859 (not call!9202))))

(declare-fun b!93241 () Bool)

(assert (=> b!93241 (= e!60855 e!60859)))

(declare-fun c!15510 () Bool)

(assert (=> b!93241 (= c!15510 (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93242 () Bool)

(assert (=> b!93242 (= e!60856 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun b!93243 () Bool)

(declare-fun e!60852 () ListLongMap!1489)

(declare-fun call!9203 () ListLongMap!1489)

(assert (=> b!93243 (= e!60852 call!9203)))

(declare-fun b!93244 () Bool)

(declare-fun e!60857 () Bool)

(assert (=> b!93244 (= e!60857 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun b!93245 () Bool)

(declare-fun e!60858 () Bool)

(declare-fun e!60862 () Bool)

(assert (=> b!93245 (= e!60858 e!60862)))

(declare-fun res!47348 () Bool)

(declare-fun call!9199 () Bool)

(assert (=> b!93245 (= res!47348 call!9199)))

(assert (=> b!93245 (=> (not res!47348) (not e!60862))))

(declare-fun b!93246 () Bool)

(assert (=> b!93246 (= e!60859 e!60861)))

(declare-fun res!47345 () Bool)

(assert (=> b!93246 (= res!47345 call!9202)))

(assert (=> b!93246 (=> (not res!47345) (not e!60861))))

(declare-fun b!93247 () Bool)

(declare-fun call!9200 () ListLongMap!1489)

(assert (=> b!93247 (= e!60864 (+!123 call!9200 (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9196 () Bool)

(declare-fun call!9205 () ListLongMap!1489)

(declare-fun call!9204 () ListLongMap!1489)

(assert (=> bm!9196 (= call!9205 call!9204)))

(declare-fun bm!9197 () Bool)

(assert (=> bm!9197 (= call!9203 call!9200)))

(declare-fun b!93248 () Bool)

(declare-fun res!47343 () Bool)

(assert (=> b!93248 (=> (not res!47343) (not e!60855))))

(assert (=> b!93248 (= res!47343 e!60858)))

(declare-fun c!15507 () Bool)

(assert (=> b!93248 (= c!15507 (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93249 () Bool)

(declare-fun Unit!2785 () Unit!2774)

(assert (=> b!93249 (= e!60853 Unit!2785)))

(declare-fun b!93250 () Bool)

(declare-fun e!60863 () Bool)

(declare-fun e!60854 () Bool)

(assert (=> b!93250 (= e!60863 e!60854)))

(declare-fun res!47349 () Bool)

(assert (=> b!93250 (=> (not res!47349) (not e!60854))))

(assert (=> b!93250 (= res!47349 (contains!779 lt!46045 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (=> b!93250 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9198 () Bool)

(assert (=> bm!9198 (= call!9202 (contains!779 lt!46045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93251 () Bool)

(declare-fun e!60860 () ListLongMap!1489)

(assert (=> b!93251 (= e!60860 call!9203)))

(declare-fun b!93252 () Bool)

(declare-fun res!47346 () Bool)

(assert (=> b!93252 (=> (not res!47346) (not e!60855))))

(assert (=> b!93252 (= res!47346 e!60863)))

(declare-fun res!47351 () Bool)

(assert (=> b!93252 (=> res!47351 e!60863)))

(assert (=> b!93252 (= res!47351 (not e!60857))))

(declare-fun res!47347 () Bool)

(assert (=> b!93252 (=> (not res!47347) (not e!60857))))

(assert (=> b!93252 (= res!47347 (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9199 () Bool)

(declare-fun call!9201 () ListLongMap!1489)

(assert (=> bm!9199 (= call!9201 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93253 () Bool)

(assert (=> b!93253 (= e!60852 call!9205)))

(declare-fun c!15508 () Bool)

(declare-fun bm!9200 () Bool)

(assert (=> bm!9200 (= call!9200 (+!123 (ite c!15506 call!9201 (ite c!15508 call!9204 call!9205)) (ite (or c!15506 c!15508) (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun b!93254 () Bool)

(declare-fun lt!46059 () Unit!2774)

(assert (=> b!93254 (= e!60853 lt!46059)))

(declare-fun lt!46048 () ListLongMap!1489)

(assert (=> b!93254 (= lt!46048 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46057 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46053 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46053 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))

(declare-fun lt!46049 () Unit!2774)

(declare-fun addStillContains!64 (ListLongMap!1489 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2774)

(assert (=> b!93254 (= lt!46049 (addStillContains!64 lt!46048 lt!46057 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46053))))

(assert (=> b!93254 (contains!779 (+!123 lt!46048 (tuple2!2283 lt!46057 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46053)))

(declare-fun lt!46046 () Unit!2774)

(assert (=> b!93254 (= lt!46046 lt!46049)))

(declare-fun lt!46050 () ListLongMap!1489)

(assert (=> b!93254 (= lt!46050 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46038 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46056 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46056 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))

(declare-fun lt!46052 () Unit!2774)

(declare-fun addApplyDifferent!64 (ListLongMap!1489 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2774)

(assert (=> b!93254 (= lt!46052 (addApplyDifferent!64 lt!46050 lt!46038 (minValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46056))))

(assert (=> b!93254 (= (apply!88 (+!123 lt!46050 (tuple2!2283 lt!46038 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46056) (apply!88 lt!46050 lt!46056))))

(declare-fun lt!46058 () Unit!2774)

(assert (=> b!93254 (= lt!46058 lt!46052)))

(declare-fun lt!46054 () ListLongMap!1489)

(assert (=> b!93254 (= lt!46054 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46041 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46041 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46040 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46040 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))

(declare-fun lt!46051 () Unit!2774)

(assert (=> b!93254 (= lt!46051 (addApplyDifferent!64 lt!46054 lt!46041 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46040))))

(assert (=> b!93254 (= (apply!88 (+!123 lt!46054 (tuple2!2283 lt!46041 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46040) (apply!88 lt!46054 lt!46040))))

(declare-fun lt!46055 () Unit!2774)

(assert (=> b!93254 (= lt!46055 lt!46051)))

(declare-fun lt!46047 () ListLongMap!1489)

(assert (=> b!93254 (= lt!46047 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) from!355 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46044 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46042 () (_ BitVec 64))

(assert (=> b!93254 (= lt!46042 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355))))

(assert (=> b!93254 (= lt!46059 (addApplyDifferent!64 lt!46047 lt!46044 (minValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46042))))

(assert (=> b!93254 (= (apply!88 (+!123 lt!46047 (tuple2!2283 lt!46044 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46042) (apply!88 lt!46047 lt!46042))))

(declare-fun b!93255 () Bool)

(assert (=> b!93255 (= e!60854 (= (apply!88 lt!46045 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)) (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93255 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2222 (_values!2407 (v!2738 (underlying!317 thiss!992))))))))

(assert (=> b!93255 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93256 () Bool)

(assert (=> b!93256 (= e!60864 e!60860)))

(assert (=> b!93256 (= c!15508 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93257 () Bool)

(assert (=> b!93257 (= e!60858 (not call!9199))))

(declare-fun bm!9201 () Bool)

(assert (=> bm!9201 (= call!9204 call!9201)))

(declare-fun b!93258 () Bool)

(assert (=> b!93258 (= e!60862 (= (apply!88 lt!46045 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93259 () Bool)

(declare-fun c!15505 () Bool)

(assert (=> b!93259 (= c!15505 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!93259 (= e!60860 e!60852)))

(declare-fun bm!9202 () Bool)

(assert (=> bm!9202 (= call!9199 (contains!779 lt!46045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!24433 c!15506) b!93247))

(assert (= (and d!24433 (not c!15506)) b!93256))

(assert (= (and b!93256 c!15508) b!93251))

(assert (= (and b!93256 (not c!15508)) b!93259))

(assert (= (and b!93259 c!15505) b!93243))

(assert (= (and b!93259 (not c!15505)) b!93253))

(assert (= (or b!93243 b!93253) bm!9196))

(assert (= (or b!93251 bm!9196) bm!9201))

(assert (= (or b!93251 b!93243) bm!9197))

(assert (= (or b!93247 bm!9201) bm!9199))

(assert (= (or b!93247 bm!9197) bm!9200))

(assert (= (and d!24433 res!47344) b!93242))

(assert (= (and d!24433 c!15509) b!93254))

(assert (= (and d!24433 (not c!15509)) b!93249))

(assert (= (and d!24433 res!47350) b!93252))

(assert (= (and b!93252 res!47347) b!93244))

(assert (= (and b!93252 (not res!47351)) b!93250))

(assert (= (and b!93250 res!47349) b!93255))

(assert (= (and b!93252 res!47346) b!93248))

(assert (= (and b!93248 c!15507) b!93245))

(assert (= (and b!93248 (not c!15507)) b!93257))

(assert (= (and b!93245 res!47348) b!93258))

(assert (= (or b!93245 b!93257) bm!9202))

(assert (= (and b!93248 res!47343) b!93241))

(assert (= (and b!93241 c!15510) b!93246))

(assert (= (and b!93241 (not c!15510)) b!93240))

(assert (= (and b!93246 res!47345) b!93239))

(assert (= (or b!93246 b!93240) bm!9198))

(declare-fun b_lambda!4103 () Bool)

(assert (=> (not b_lambda!4103) (not b!93255)))

(assert (=> b!93255 t!5431))

(declare-fun b_and!5677 () Bool)

(assert (= b_and!5673 (and (=> t!5431 result!3137) b_and!5677)))

(assert (=> b!93255 t!5433))

(declare-fun b_and!5679 () Bool)

(assert (= b_and!5675 (and (=> t!5433 result!3141) b_and!5679)))

(declare-fun m!100427 () Bool)

(assert (=> bm!9202 m!100427))

(declare-fun m!100429 () Bool)

(assert (=> bm!9198 m!100429))

(assert (=> b!93255 m!100083))

(declare-fun m!100431 () Bool)

(assert (=> b!93255 m!100431))

(assert (=> b!93255 m!100133))

(assert (=> b!93255 m!100133))

(assert (=> b!93255 m!100135))

(assert (=> b!93255 m!100137))

(assert (=> b!93255 m!100083))

(assert (=> b!93255 m!100135))

(declare-fun m!100433 () Bool)

(assert (=> b!93254 m!100433))

(declare-fun m!100435 () Bool)

(assert (=> b!93254 m!100435))

(declare-fun m!100437 () Bool)

(assert (=> b!93254 m!100437))

(declare-fun m!100439 () Bool)

(assert (=> b!93254 m!100439))

(assert (=> b!93254 m!100437))

(declare-fun m!100441 () Bool)

(assert (=> b!93254 m!100441))

(declare-fun m!100443 () Bool)

(assert (=> b!93254 m!100443))

(declare-fun m!100445 () Bool)

(assert (=> b!93254 m!100445))

(assert (=> b!93254 m!100443))

(declare-fun m!100447 () Bool)

(assert (=> b!93254 m!100447))

(assert (=> b!93254 m!100083))

(assert (=> b!93254 m!100447))

(declare-fun m!100449 () Bool)

(assert (=> b!93254 m!100449))

(declare-fun m!100451 () Bool)

(assert (=> b!93254 m!100451))

(declare-fun m!100453 () Bool)

(assert (=> b!93254 m!100453))

(declare-fun m!100455 () Bool)

(assert (=> b!93254 m!100455))

(declare-fun m!100457 () Bool)

(assert (=> b!93254 m!100457))

(declare-fun m!100459 () Bool)

(assert (=> b!93254 m!100459))

(assert (=> b!93254 m!100453))

(declare-fun m!100461 () Bool)

(assert (=> b!93254 m!100461))

(declare-fun m!100463 () Bool)

(assert (=> b!93254 m!100463))

(declare-fun m!100465 () Bool)

(assert (=> bm!9200 m!100465))

(assert (=> b!93250 m!100083))

(assert (=> b!93250 m!100083))

(declare-fun m!100467 () Bool)

(assert (=> b!93250 m!100467))

(declare-fun m!100469 () Bool)

(assert (=> b!93239 m!100469))

(assert (=> d!24433 m!100413))

(assert (=> bm!9199 m!100451))

(declare-fun m!100471 () Bool)

(assert (=> b!93258 m!100471))

(assert (=> b!93244 m!100083))

(assert (=> b!93244 m!100083))

(declare-fun m!100473 () Bool)

(assert (=> b!93244 m!100473))

(declare-fun m!100475 () Bool)

(assert (=> b!93247 m!100475))

(assert (=> b!93242 m!100083))

(assert (=> b!93242 m!100083))

(assert (=> b!93242 m!100473))

(assert (=> b!92863 d!24433))

(declare-fun d!24435 () Bool)

(declare-fun e!60865 () Bool)

(assert (=> d!24435 e!60865))

(declare-fun res!47352 () Bool)

(assert (=> d!24435 (=> (not res!47352) (not e!60865))))

(declare-fun lt!46062 () ListLongMap!1489)

(assert (=> d!24435 (= res!47352 (contains!779 lt!46062 (_1!1152 lt!45744)))))

(declare-fun lt!46063 () List!1565)

(assert (=> d!24435 (= lt!46062 (ListLongMap!1490 lt!46063))))

(declare-fun lt!46060 () Unit!2774)

(declare-fun lt!46061 () Unit!2774)

(assert (=> d!24435 (= lt!46060 lt!46061)))

(assert (=> d!24435 (= (getValueByKey!144 lt!46063 (_1!1152 lt!45744)) (Some!149 (_2!1152 lt!45744)))))

(assert (=> d!24435 (= lt!46061 (lemmaContainsTupThenGetReturnValue!64 lt!46063 (_1!1152 lt!45744) (_2!1152 lt!45744)))))

(assert (=> d!24435 (= lt!46063 (insertStrictlySorted!67 (toList!760 lt!45732) (_1!1152 lt!45744) (_2!1152 lt!45744)))))

(assert (=> d!24435 (= (+!123 lt!45732 lt!45744) lt!46062)))

(declare-fun b!93260 () Bool)

(declare-fun res!47353 () Bool)

(assert (=> b!93260 (=> (not res!47353) (not e!60865))))

(assert (=> b!93260 (= res!47353 (= (getValueByKey!144 (toList!760 lt!46062) (_1!1152 lt!45744)) (Some!149 (_2!1152 lt!45744))))))

(declare-fun b!93261 () Bool)

(assert (=> b!93261 (= e!60865 (contains!781 (toList!760 lt!46062) lt!45744))))

(assert (= (and d!24435 res!47352) b!93260))

(assert (= (and b!93260 res!47353) b!93261))

(declare-fun m!100477 () Bool)

(assert (=> d!24435 m!100477))

(declare-fun m!100479 () Bool)

(assert (=> d!24435 m!100479))

(declare-fun m!100481 () Bool)

(assert (=> d!24435 m!100481))

(declare-fun m!100483 () Bool)

(assert (=> d!24435 m!100483))

(declare-fun m!100485 () Bool)

(assert (=> b!93260 m!100485))

(declare-fun m!100487 () Bool)

(assert (=> b!93261 m!100487))

(assert (=> b!92863 d!24435))

(declare-fun d!24437 () Bool)

(declare-fun e!60866 () Bool)

(assert (=> d!24437 e!60866))

(declare-fun res!47354 () Bool)

(assert (=> d!24437 (=> (not res!47354) (not e!60866))))

(declare-fun lt!46066 () ListLongMap!1489)

(assert (=> d!24437 (= res!47354 (contains!779 lt!46066 (_1!1152 lt!45743)))))

(declare-fun lt!46067 () List!1565)

(assert (=> d!24437 (= lt!46066 (ListLongMap!1490 lt!46067))))

(declare-fun lt!46064 () Unit!2774)

(declare-fun lt!46065 () Unit!2774)

(assert (=> d!24437 (= lt!46064 lt!46065)))

(assert (=> d!24437 (= (getValueByKey!144 lt!46067 (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743)))))

(assert (=> d!24437 (= lt!46065 (lemmaContainsTupThenGetReturnValue!64 lt!46067 (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24437 (= lt!46067 (insertStrictlySorted!67 (toList!760 (+!123 lt!45732 lt!45744)) (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24437 (= (+!123 (+!123 lt!45732 lt!45744) lt!45743) lt!46066)))

(declare-fun b!93262 () Bool)

(declare-fun res!47355 () Bool)

(assert (=> b!93262 (=> (not res!47355) (not e!60866))))

(assert (=> b!93262 (= res!47355 (= (getValueByKey!144 (toList!760 lt!46066) (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743))))))

(declare-fun b!93263 () Bool)

(assert (=> b!93263 (= e!60866 (contains!781 (toList!760 lt!46066) lt!45743))))

(assert (= (and d!24437 res!47354) b!93262))

(assert (= (and b!93262 res!47355) b!93263))

(declare-fun m!100489 () Bool)

(assert (=> d!24437 m!100489))

(declare-fun m!100491 () Bool)

(assert (=> d!24437 m!100491))

(declare-fun m!100493 () Bool)

(assert (=> d!24437 m!100493))

(declare-fun m!100495 () Bool)

(assert (=> d!24437 m!100495))

(declare-fun m!100497 () Bool)

(assert (=> b!93262 m!100497))

(declare-fun m!100499 () Bool)

(assert (=> b!93263 m!100499))

(assert (=> b!92863 d!24437))

(declare-fun d!24439 () Bool)

(assert (=> d!24439 (= (map!1223 (_2!1151 lt!45735)) (getCurrentListMap!443 (_keys!4105 (_2!1151 lt!45735)) (_values!2407 (_2!1151 lt!45735)) (mask!6493 (_2!1151 lt!45735)) (extraKeys!2253 (_2!1151 lt!45735)) (zeroValue!2311 (_2!1151 lt!45735)) (minValue!2311 (_2!1151 lt!45735)) #b00000000000000000000000000000000 (defaultEntry!2424 (_2!1151 lt!45735))))))

(declare-fun bs!3841 () Bool)

(assert (= bs!3841 d!24439))

(declare-fun m!100501 () Bool)

(assert (=> bs!3841 m!100501))

(assert (=> b!92863 d!24439))

(declare-fun d!24441 () Bool)

(declare-fun e!60867 () Bool)

(assert (=> d!24441 e!60867))

(declare-fun res!47356 () Bool)

(assert (=> d!24441 (=> (not res!47356) (not e!60867))))

(declare-fun lt!46070 () ListLongMap!1489)

(assert (=> d!24441 (= res!47356 (contains!779 lt!46070 (_1!1152 lt!45739)))))

(declare-fun lt!46071 () List!1565)

(assert (=> d!24441 (= lt!46070 (ListLongMap!1490 lt!46071))))

(declare-fun lt!46068 () Unit!2774)

(declare-fun lt!46069 () Unit!2774)

(assert (=> d!24441 (= lt!46068 lt!46069)))

(assert (=> d!24441 (= (getValueByKey!144 lt!46071 (_1!1152 lt!45739)) (Some!149 (_2!1152 lt!45739)))))

(assert (=> d!24441 (= lt!46069 (lemmaContainsTupThenGetReturnValue!64 lt!46071 (_1!1152 lt!45739) (_2!1152 lt!45739)))))

(assert (=> d!24441 (= lt!46071 (insertStrictlySorted!67 (toList!760 lt!45750) (_1!1152 lt!45739) (_2!1152 lt!45739)))))

(assert (=> d!24441 (= (+!123 lt!45750 lt!45739) lt!46070)))

(declare-fun b!93264 () Bool)

(declare-fun res!47357 () Bool)

(assert (=> b!93264 (=> (not res!47357) (not e!60867))))

(assert (=> b!93264 (= res!47357 (= (getValueByKey!144 (toList!760 lt!46070) (_1!1152 lt!45739)) (Some!149 (_2!1152 lt!45739))))))

(declare-fun b!93265 () Bool)

(assert (=> b!93265 (= e!60867 (contains!781 (toList!760 lt!46070) lt!45739))))

(assert (= (and d!24441 res!47356) b!93264))

(assert (= (and b!93264 res!47357) b!93265))

(declare-fun m!100503 () Bool)

(assert (=> d!24441 m!100503))

(declare-fun m!100505 () Bool)

(assert (=> d!24441 m!100505))

(declare-fun m!100507 () Bool)

(assert (=> d!24441 m!100507))

(declare-fun m!100509 () Bool)

(assert (=> d!24441 m!100509))

(declare-fun m!100511 () Bool)

(assert (=> b!93264 m!100511))

(declare-fun m!100513 () Bool)

(assert (=> b!93265 m!100513))

(assert (=> b!92863 d!24441))

(declare-fun d!24443 () Bool)

(declare-fun e!60868 () Bool)

(assert (=> d!24443 e!60868))

(declare-fun res!47358 () Bool)

(assert (=> d!24443 (=> (not res!47358) (not e!60868))))

(declare-fun lt!46074 () ListLongMap!1489)

(assert (=> d!24443 (= res!47358 (contains!779 lt!46074 (_1!1152 lt!45743)))))

(declare-fun lt!46075 () List!1565)

(assert (=> d!24443 (= lt!46074 (ListLongMap!1490 lt!46075))))

(declare-fun lt!46072 () Unit!2774)

(declare-fun lt!46073 () Unit!2774)

(assert (=> d!24443 (= lt!46072 lt!46073)))

(assert (=> d!24443 (= (getValueByKey!144 lt!46075 (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743)))))

(assert (=> d!24443 (= lt!46073 (lemmaContainsTupThenGetReturnValue!64 lt!46075 (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24443 (= lt!46075 (insertStrictlySorted!67 (toList!760 lt!45732) (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24443 (= (+!123 lt!45732 lt!45743) lt!46074)))

(declare-fun b!93266 () Bool)

(declare-fun res!47359 () Bool)

(assert (=> b!93266 (=> (not res!47359) (not e!60868))))

(assert (=> b!93266 (= res!47359 (= (getValueByKey!144 (toList!760 lt!46074) (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743))))))

(declare-fun b!93267 () Bool)

(assert (=> b!93267 (= e!60868 (contains!781 (toList!760 lt!46074) lt!45743))))

(assert (= (and d!24443 res!47358) b!93266))

(assert (= (and b!93266 res!47359) b!93267))

(declare-fun m!100515 () Bool)

(assert (=> d!24443 m!100515))

(declare-fun m!100517 () Bool)

(assert (=> d!24443 m!100517))

(declare-fun m!100519 () Bool)

(assert (=> d!24443 m!100519))

(declare-fun m!100521 () Bool)

(assert (=> d!24443 m!100521))

(declare-fun m!100523 () Bool)

(assert (=> b!93266 m!100523))

(declare-fun m!100525 () Bool)

(assert (=> b!93267 m!100525))

(assert (=> b!92863 d!24443))

(declare-fun d!24445 () Bool)

(assert (=> d!24445 (= (+!123 (+!123 lt!45750 (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733)) (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) (+!123 (+!123 lt!45750 (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) (tuple2!2283 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733)))))

(declare-fun lt!46076 () Unit!2774)

(assert (=> d!24445 (= lt!46076 (choose!563 lt!45750 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(assert (=> d!24445 (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24445 (= (addCommutativeForDiffKeys!42 lt!45750 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) lt!45733 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))) lt!46076)))

(declare-fun bs!3842 () Bool)

(assert (= bs!3842 d!24445))

(declare-fun m!100527 () Bool)

(assert (=> bs!3842 m!100527))

(declare-fun m!100529 () Bool)

(assert (=> bs!3842 m!100529))

(assert (=> bs!3842 m!100083))

(declare-fun m!100531 () Bool)

(assert (=> bs!3842 m!100531))

(declare-fun m!100533 () Bool)

(assert (=> bs!3842 m!100533))

(declare-fun m!100535 () Bool)

(assert (=> bs!3842 m!100535))

(assert (=> bs!3842 m!100533))

(assert (=> bs!3842 m!100527))

(assert (=> b!92863 d!24445))

(declare-fun d!24447 () Bool)

(declare-fun e!60869 () Bool)

(assert (=> d!24447 e!60869))

(declare-fun res!47360 () Bool)

(assert (=> d!24447 (=> (not res!47360) (not e!60869))))

(declare-fun lt!46079 () ListLongMap!1489)

(assert (=> d!24447 (= res!47360 (contains!779 lt!46079 (_1!1152 lt!45743)))))

(declare-fun lt!46080 () List!1565)

(assert (=> d!24447 (= lt!46079 (ListLongMap!1490 lt!46080))))

(declare-fun lt!46077 () Unit!2774)

(declare-fun lt!46078 () Unit!2774)

(assert (=> d!24447 (= lt!46077 lt!46078)))

(assert (=> d!24447 (= (getValueByKey!144 lt!46080 (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743)))))

(assert (=> d!24447 (= lt!46078 (lemmaContainsTupThenGetReturnValue!64 lt!46080 (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24447 (= lt!46080 (insertStrictlySorted!67 (toList!760 lt!45750) (_1!1152 lt!45743) (_2!1152 lt!45743)))))

(assert (=> d!24447 (= (+!123 lt!45750 lt!45743) lt!46079)))

(declare-fun b!93268 () Bool)

(declare-fun res!47361 () Bool)

(assert (=> b!93268 (=> (not res!47361) (not e!60869))))

(assert (=> b!93268 (= res!47361 (= (getValueByKey!144 (toList!760 lt!46079) (_1!1152 lt!45743)) (Some!149 (_2!1152 lt!45743))))))

(declare-fun b!93269 () Bool)

(assert (=> b!93269 (= e!60869 (contains!781 (toList!760 lt!46079) lt!45743))))

(assert (= (and d!24447 res!47360) b!93268))

(assert (= (and b!93268 res!47361) b!93269))

(declare-fun m!100537 () Bool)

(assert (=> d!24447 m!100537))

(declare-fun m!100539 () Bool)

(assert (=> d!24447 m!100539))

(declare-fun m!100541 () Bool)

(assert (=> d!24447 m!100541))

(declare-fun m!100543 () Bool)

(assert (=> d!24447 m!100543))

(declare-fun m!100545 () Bool)

(assert (=> b!93268 m!100545))

(declare-fun m!100547 () Bool)

(assert (=> b!93269 m!100547))

(assert (=> b!92863 d!24447))

(declare-fun d!24449 () Bool)

(declare-fun e!60870 () Bool)

(assert (=> d!24449 e!60870))

(declare-fun res!47362 () Bool)

(assert (=> d!24449 (=> (not res!47362) (not e!60870))))

(declare-fun lt!46083 () ListLongMap!1489)

(assert (=> d!24449 (= res!47362 (contains!779 lt!46083 (_1!1152 lt!45739)))))

(declare-fun lt!46084 () List!1565)

(assert (=> d!24449 (= lt!46083 (ListLongMap!1490 lt!46084))))

(declare-fun lt!46081 () Unit!2774)

(declare-fun lt!46082 () Unit!2774)

(assert (=> d!24449 (= lt!46081 lt!46082)))

(assert (=> d!24449 (= (getValueByKey!144 lt!46084 (_1!1152 lt!45739)) (Some!149 (_2!1152 lt!45739)))))

(assert (=> d!24449 (= lt!46082 (lemmaContainsTupThenGetReturnValue!64 lt!46084 (_1!1152 lt!45739) (_2!1152 lt!45739)))))

(assert (=> d!24449 (= lt!46084 (insertStrictlySorted!67 (toList!760 lt!45745) (_1!1152 lt!45739) (_2!1152 lt!45739)))))

(assert (=> d!24449 (= (+!123 lt!45745 lt!45739) lt!46083)))

(declare-fun b!93270 () Bool)

(declare-fun res!47363 () Bool)

(assert (=> b!93270 (=> (not res!47363) (not e!60870))))

(assert (=> b!93270 (= res!47363 (= (getValueByKey!144 (toList!760 lt!46083) (_1!1152 lt!45739)) (Some!149 (_2!1152 lt!45739))))))

(declare-fun b!93271 () Bool)

(assert (=> b!93271 (= e!60870 (contains!781 (toList!760 lt!46083) lt!45739))))

(assert (= (and d!24449 res!47362) b!93270))

(assert (= (and b!93270 res!47363) b!93271))

(declare-fun m!100549 () Bool)

(assert (=> d!24449 m!100549))

(declare-fun m!100551 () Bool)

(assert (=> d!24449 m!100551))

(declare-fun m!100553 () Bool)

(assert (=> d!24449 m!100553))

(declare-fun m!100555 () Bool)

(assert (=> d!24449 m!100555))

(declare-fun m!100557 () Bool)

(assert (=> b!93270 m!100557))

(declare-fun m!100559 () Bool)

(assert (=> b!93271 m!100559))

(assert (=> b!92863 d!24449))

(declare-fun b!93300 () Bool)

(declare-fun e!60892 () Bool)

(declare-fun lt!46178 () tuple2!2280)

(assert (=> b!93300 (= e!60892 (= (map!1223 (_2!1151 lt!46178)) (map!1223 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun call!9240 () ListLongMap!1489)

(declare-fun call!9234 () ListLongMap!1489)

(declare-fun lt!46152 () (_ BitVec 64))

(declare-fun call!9233 () ListLongMap!1489)

(declare-fun lt!46167 () (_ BitVec 64))

(declare-fun c!15525 () Bool)

(declare-fun bm!9229 () Bool)

(assert (=> bm!9229 (= call!9240 (+!123 (ite c!15525 call!9234 call!9233) (ite c!15525 (tuple2!2283 lt!46152 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 lt!46167 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun b!93301 () Bool)

(declare-fun e!60887 () tuple2!2280)

(declare-fun lt!46179 () tuple2!2280)

(assert (=> b!93301 (= e!60887 (tuple2!2281 false (_2!1151 lt!46179)))))

(declare-fun b!93302 () Bool)

(declare-fun e!60893 () Bool)

(assert (=> b!93302 (= e!60893 e!60892)))

(declare-fun res!47369 () Bool)

(assert (=> b!93302 (=> (not res!47369) (not e!60892))))

(assert (=> b!93302 (= res!47369 (valid!372 (_2!1151 lt!46178)))))

(declare-fun b!93303 () Bool)

(assert (=> b!93303 (= c!15525 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!60894 () tuple2!2280)

(assert (=> b!93303 (= e!60887 e!60894)))

(declare-fun b!93304 () Bool)

(declare-fun lt!46175 () tuple2!2280)

(assert (=> b!93304 (= e!60894 (tuple2!2281 (_1!1151 lt!46175) (_2!1151 lt!46175)))))

(declare-fun lt!46159 () ListLongMap!1489)

(declare-fun call!9237 () ListLongMap!1489)

(assert (=> b!93304 (= lt!46159 call!9237)))

(assert (=> b!93304 (= lt!46152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46176 () Unit!2774)

(declare-fun call!9239 () Unit!2774)

(assert (=> b!93304 (= lt!46176 call!9239)))

(declare-fun call!9242 () ListLongMap!1489)

(assert (=> b!93304 (= call!9240 call!9242)))

(declare-fun lt!46171 () Unit!2774)

(assert (=> b!93304 (= lt!46171 lt!46176)))

(declare-fun lt!46174 () ListLongMap!1489)

(declare-fun call!9241 () ListLongMap!1489)

(assert (=> b!93304 (= lt!46174 call!9241)))

(declare-fun lt!46169 () (_ BitVec 64))

(assert (=> b!93304 (= lt!46169 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46177 () Unit!2774)

(declare-fun call!9243 () Unit!2774)

(assert (=> b!93304 (= lt!46177 call!9243)))

(declare-fun call!9236 () ListLongMap!1489)

(declare-fun call!9238 () ListLongMap!1489)

(assert (=> b!93304 (= call!9236 call!9238)))

(declare-fun lt!46173 () Unit!2774)

(assert (=> b!93304 (= lt!46173 lt!46177)))

(declare-fun call!9232 () tuple2!2280)

(assert (=> b!93304 (= lt!46175 call!9232)))

(declare-fun lt!46158 () (_ BitVec 64))

(declare-fun lt!46156 () ListLongMap!1489)

(declare-fun lt!46172 () V!3113)

(declare-fun bm!9230 () Bool)

(assert (=> bm!9230 (= call!9239 (addCommutativeForDiffKeys!42 (ite c!15525 lt!46159 lt!46156) lt!46158 lt!46172 (ite c!15525 lt!46152 lt!46167) (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46170 () ListLongMap!1489)

(declare-fun lt!46165 () (_ BitVec 64))

(declare-fun bm!9231 () Bool)

(assert (=> bm!9231 (= call!9243 (addCommutativeForDiffKeys!42 (ite c!15525 lt!46174 lt!46170) lt!46158 lt!46172 (ite c!15525 lt!46169 lt!46165) (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun c!15523 () Bool)

(declare-fun bm!9232 () Bool)

(assert (=> bm!9232 (= call!9232 (repackFrom!13 thiss!992 (ite c!15523 (_2!1151 lt!46179) (_2!1151 lt!45735)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun call!9244 () ListLongMap!1489)

(declare-fun bm!9233 () Bool)

(assert (=> bm!9233 (= call!9244 (+!123 (ite c!15525 lt!46174 lt!46170) (tuple2!2283 lt!46158 lt!46172)))))

(declare-fun call!9235 () ListLongMap!1489)

(declare-fun bm!9234 () Bool)

(assert (=> bm!9234 (= call!9238 (+!123 (ite c!15525 call!9235 call!9244) (ite c!15525 (tuple2!2283 lt!46158 lt!46172) (tuple2!2283 lt!46165 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun bm!9235 () Bool)

(assert (=> bm!9235 (= call!9237 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun bm!9236 () Bool)

(assert (=> bm!9236 (= call!9236 (+!123 (ite c!15525 call!9244 call!9235) (ite c!15525 (tuple2!2283 lt!46169 (minValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 lt!46158 lt!46172))))))

(declare-fun bm!9237 () Bool)

(assert (=> bm!9237 (= call!9234 (+!123 (ite c!15525 lt!46159 lt!46156) (ite c!15525 (tuple2!2283 lt!46158 lt!46172) (tuple2!2283 lt!46167 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun d!24451 () Bool)

(assert (=> d!24451 e!60893))

(declare-fun res!47368 () Bool)

(assert (=> d!24451 (=> res!47368 e!60893)))

(assert (=> d!24451 (= res!47368 (not (_1!1151 lt!46178)))))

(declare-fun e!60891 () tuple2!2280)

(assert (=> d!24451 (= lt!46178 e!60891)))

(assert (=> d!24451 (= c!15523 (and (not (= lt!46158 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46158 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46163 () ListLongMap!1489)

(assert (=> d!24451 (= lt!46163 (map!1223 (_2!1151 lt!45735)))))

(assert (=> d!24451 (= lt!46172 (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24451 (= lt!46158 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!24451 (valid!373 thiss!992)))

(assert (=> d!24451 (= (repackFrom!13 thiss!992 (_2!1151 lt!45735) (bvsub from!355 #b00000000000000000000000000000001)) lt!46178)))

(declare-fun b!93305 () Bool)

(declare-fun e!60890 () Bool)

(declare-fun lt!46155 () (_ BitVec 32))

(assert (=> b!93305 (= e!60890 (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) lt!46158 lt!46155))))

(declare-fun bm!9238 () Bool)

(assert (=> bm!9238 (= call!9235 (+!123 (ite c!15525 lt!46174 lt!46170) (ite c!15525 (tuple2!2283 lt!46169 (minValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 lt!46165 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun b!93306 () Bool)

(declare-fun lt!46180 () tuple2!2280)

(assert (=> b!93306 (= lt!46180 call!9232)))

(declare-fun e!60889 () tuple2!2280)

(assert (=> b!93306 (= e!60889 (tuple2!2281 (_1!1151 lt!46180) (_2!1151 lt!46180)))))

(declare-fun b!93307 () Bool)

(assert (=> b!93307 (= e!60891 e!60887)))

(assert (=> b!93307 (= lt!46179 (update!137 (_2!1151 lt!45735) lt!46158 lt!46172))))

(declare-fun c!15526 () Bool)

(assert (=> b!93307 (= c!15526 (contains!779 lt!46163 lt!46158))))

(declare-fun lt!46168 () Unit!2774)

(declare-fun e!60888 () Unit!2774)

(assert (=> b!93307 (= lt!46168 e!60888)))

(declare-fun c!15528 () Bool)

(assert (=> b!93307 (= c!15528 (_1!1151 lt!46179))))

(declare-fun b!93308 () Bool)

(assert (=> b!93308 (= e!60894 (tuple2!2281 true (_2!1151 lt!46179)))))

(assert (=> b!93308 (= lt!46156 call!9237)))

(assert (=> b!93308 (= lt!46167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46162 () Unit!2774)

(assert (=> b!93308 (= lt!46162 call!9239)))

(assert (=> b!93308 (= call!9240 call!9242)))

(declare-fun lt!46164 () Unit!2774)

(assert (=> b!93308 (= lt!46164 lt!46162)))

(assert (=> b!93308 (= lt!46170 call!9241)))

(assert (=> b!93308 (= lt!46165 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46154 () Unit!2774)

(assert (=> b!93308 (= lt!46154 call!9243)))

(assert (=> b!93308 (= call!9238 call!9236)))

(declare-fun lt!46150 () Unit!2774)

(assert (=> b!93308 (= lt!46150 lt!46154)))

(declare-fun b!93309 () Bool)

(assert (=> b!93309 (= e!60891 e!60889)))

(declare-fun c!15527 () Bool)

(assert (=> b!93309 (= c!15527 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!93310 () Bool)

(declare-fun Unit!2786 () Unit!2774)

(assert (=> b!93310 (= e!60888 Unit!2786)))

(declare-fun bm!9239 () Bool)

(assert (=> bm!9239 (= call!9233 (+!123 (ite c!15525 lt!46159 lt!46156) (ite c!15525 (tuple2!2283 lt!46152 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 lt!46158 lt!46172))))))

(declare-fun b!93311 () Bool)

(assert (=> b!93311 (= e!60889 (tuple2!2281 true (_2!1151 lt!45735)))))

(declare-fun bm!9240 () Bool)

(assert (=> bm!9240 (= call!9241 (+!123 call!9237 (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93312 () Bool)

(assert (=> b!93312 false))

(declare-fun lt!46166 () Unit!2774)

(declare-fun lt!46161 () Unit!2774)

(assert (=> b!93312 (= lt!46166 lt!46161)))

(declare-fun lt!46160 () (_ BitVec 32))

(assert (=> b!93312 (not (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) lt!46158 lt!46160))))

(assert (=> b!93312 (= lt!46161 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) lt!46160 lt!46158 (Cons!1562 lt!46158 Nil!1563)))))

(assert (=> b!93312 (= lt!46160 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!46149 () Unit!2774)

(declare-fun lt!46157 () Unit!2774)

(assert (=> b!93312 (= lt!46149 lt!46157)))

(assert (=> b!93312 (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1563)))

(assert (=> b!93312 (= lt!46157 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!46153 () Unit!2774)

(declare-fun lt!46151 () Unit!2774)

(assert (=> b!93312 (= lt!46153 lt!46151)))

(assert (=> b!93312 e!60890))

(declare-fun c!15524 () Bool)

(assert (=> b!93312 (= c!15524 (and (not (= lt!46158 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46158 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93312 (= lt!46151 (lemmaListMapContainsThenArrayContainsFrom!86 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46158 lt!46155 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(assert (=> b!93312 (= lt!46155 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!2787 () Unit!2774)

(assert (=> b!93312 (= e!60888 Unit!2787)))

(declare-fun bm!9241 () Bool)

(assert (=> bm!9241 (= call!9242 (+!123 (ite c!15525 call!9233 call!9234) (tuple2!2283 lt!46158 lt!46172)))))

(declare-fun b!93313 () Bool)

(assert (=> b!93313 (= e!60890 (ite (= lt!46158 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24451 c!15523) b!93307))

(assert (= (and d!24451 (not c!15523)) b!93309))

(assert (= (and b!93307 c!15526) b!93312))

(assert (= (and b!93307 (not c!15526)) b!93310))

(assert (= (and b!93312 c!15524) b!93305))

(assert (= (and b!93312 (not c!15524)) b!93313))

(assert (= (and b!93307 c!15528) b!93303))

(assert (= (and b!93307 (not c!15528)) b!93301))

(assert (= (and b!93303 c!15525) b!93304))

(assert (= (and b!93303 (not c!15525)) b!93308))

(assert (= (or b!93304 b!93308) bm!9231))

(assert (= (or b!93304 b!93308) bm!9237))

(assert (= (or b!93304 b!93308) bm!9230))

(assert (= (or b!93304 b!93308) bm!9238))

(assert (= (or b!93304 b!93308) bm!9235))

(assert (= (or b!93304 b!93308) bm!9239))

(assert (= (or b!93304 b!93308) bm!9233))

(assert (= (or b!93304 b!93308) bm!9236))

(assert (= (or b!93304 b!93308) bm!9234))

(assert (= (or b!93304 b!93308) bm!9229))

(assert (= (or b!93304 b!93308) bm!9241))

(assert (= (or b!93304 b!93308) bm!9240))

(assert (= (and b!93309 c!15527) b!93306))

(assert (= (and b!93309 (not c!15527)) b!93311))

(assert (= (or b!93304 b!93306) bm!9232))

(assert (= (and d!24451 (not res!47368)) b!93302))

(assert (= (and b!93302 res!47369) b!93300))

(declare-fun b_lambda!4105 () Bool)

(assert (=> (not b_lambda!4105) (not d!24451)))

(assert (=> d!24451 t!5431))

(declare-fun b_and!5681 () Bool)

(assert (= b_and!5677 (and (=> t!5431 result!3137) b_and!5681)))

(assert (=> d!24451 t!5433))

(declare-fun b_and!5683 () Bool)

(assert (= b_and!5679 (and (=> t!5433 result!3141) b_and!5683)))

(declare-fun m!100561 () Bool)

(assert (=> bm!9229 m!100561))

(declare-fun m!100563 () Bool)

(assert (=> b!93300 m!100563))

(declare-fun m!100565 () Bool)

(assert (=> b!93300 m!100565))

(assert (=> d!24451 m!100143))

(declare-fun m!100567 () Bool)

(assert (=> d!24451 m!100567))

(assert (=> d!24451 m!100135))

(declare-fun m!100569 () Bool)

(assert (=> d!24451 m!100569))

(declare-fun m!100571 () Bool)

(assert (=> d!24451 m!100571))

(assert (=> d!24451 m!100567))

(assert (=> d!24451 m!100111))

(assert (=> d!24451 m!100135))

(declare-fun m!100573 () Bool)

(assert (=> bm!9233 m!100573))

(declare-fun m!100575 () Bool)

(assert (=> b!93312 m!100575))

(declare-fun m!100577 () Bool)

(assert (=> b!93312 m!100577))

(declare-fun m!100579 () Bool)

(assert (=> b!93312 m!100579))

(declare-fun m!100581 () Bool)

(assert (=> b!93312 m!100581))

(declare-fun m!100583 () Bool)

(assert (=> b!93312 m!100583))

(declare-fun m!100585 () Bool)

(assert (=> bm!9241 m!100585))

(declare-fun m!100587 () Bool)

(assert (=> bm!9230 m!100587))

(declare-fun m!100589 () Bool)

(assert (=> bm!9236 m!100589))

(declare-fun m!100591 () Bool)

(assert (=> bm!9231 m!100591))

(declare-fun m!100593 () Bool)

(assert (=> bm!9234 m!100593))

(declare-fun m!100595 () Bool)

(assert (=> bm!9239 m!100595))

(declare-fun m!100597 () Bool)

(assert (=> bm!9238 m!100597))

(declare-fun m!100599 () Bool)

(assert (=> bm!9237 m!100599))

(declare-fun m!100601 () Bool)

(assert (=> b!93305 m!100601))

(declare-fun m!100603 () Bool)

(assert (=> bm!9235 m!100603))

(declare-fun m!100605 () Bool)

(assert (=> bm!9232 m!100605))

(declare-fun m!100607 () Bool)

(assert (=> bm!9240 m!100607))

(declare-fun m!100609 () Bool)

(assert (=> b!93307 m!100609))

(declare-fun m!100611 () Bool)

(assert (=> b!93307 m!100611))

(declare-fun m!100613 () Bool)

(assert (=> b!93302 m!100613))

(assert (=> b!92843 d!24451))

(declare-fun d!24453 () Bool)

(assert (=> d!24453 (not (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46183 () Unit!2774)

(declare-fun choose!68 (array!4149 (_ BitVec 32) (_ BitVec 64) List!1566) Unit!2774)

(assert (=> d!24453 (= lt!46183 (choose!68 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (Cons!1562 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) Nil!1563)))))

(assert (=> d!24453 (bvslt (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24453 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (Cons!1562 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) Nil!1563)) lt!46183)))

(declare-fun bs!3843 () Bool)

(assert (= bs!3843 d!24453))

(assert (=> bs!3843 m!100083))

(assert (=> bs!3843 m!100087))

(assert (=> bs!3843 m!100083))

(declare-fun m!100615 () Bool)

(assert (=> bs!3843 m!100615))

(assert (=> b!92861 d!24453))

(declare-fun d!24455 () Bool)

(assert (=> d!24455 (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) from!355 Nil!1563)))

(declare-fun lt!46186 () Unit!2774)

(declare-fun choose!39 (array!4149 (_ BitVec 32) (_ BitVec 32)) Unit!2774)

(assert (=> d!24455 (= lt!46186 (choose!39 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24455 (bvslt (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24455 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000000 from!355) lt!46186)))

(declare-fun bs!3844 () Bool)

(assert (= bs!3844 d!24455))

(assert (=> bs!3844 m!100081))

(declare-fun m!100617 () Bool)

(assert (=> bs!3844 m!100617))

(assert (=> b!92861 d!24455))

(declare-fun d!24457 () Bool)

(declare-fun res!47374 () Bool)

(declare-fun e!60899 () Bool)

(assert (=> d!24457 (=> res!47374 e!60899)))

(assert (=> d!24457 (= res!47374 (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (=> d!24457 (= (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!60899)))

(declare-fun b!93318 () Bool)

(declare-fun e!60900 () Bool)

(assert (=> b!93318 (= e!60899 e!60900)))

(declare-fun res!47375 () Bool)

(assert (=> b!93318 (=> (not res!47375) (not e!60900))))

(assert (=> b!93318 (= res!47375 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93319 () Bool)

(assert (=> b!93319 (= e!60900 (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24457 (not res!47374)) b!93318))

(assert (= (and b!93318 res!47375) b!93319))

(assert (=> d!24457 m!100385))

(assert (=> b!93319 m!100083))

(declare-fun m!100619 () Bool)

(assert (=> b!93319 m!100619))

(assert (=> b!92861 d!24457))

(declare-fun d!24459 () Bool)

(declare-fun e!60903 () Bool)

(assert (=> d!24459 e!60903))

(declare-fun c!15531 () Bool)

(assert (=> d!24459 (= c!15531 (and (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46189 () Unit!2774)

(declare-fun choose!564 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) (_ BitVec 32) Int) Unit!2774)

(assert (=> d!24459 (= lt!46189 (choose!564 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(assert (=> d!24459 (validMask!0 (mask!6493 (v!2738 (underlying!317 thiss!992))))))

(assert (=> d!24459 (= (lemmaListMapContainsThenArrayContainsFrom!86 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) lt!46189)))

(declare-fun b!93324 () Bool)

(assert (=> b!93324 (= e!60903 (arrayContainsKey!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93325 () Bool)

(assert (=> b!93325 (= e!60903 (ite (= (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24459 c!15531) b!93324))

(assert (= (and d!24459 (not c!15531)) b!93325))

(assert (=> d!24459 m!100083))

(declare-fun m!100621 () Bool)

(assert (=> d!24459 m!100621))

(assert (=> d!24459 m!100413))

(assert (=> b!93324 m!100083))

(assert (=> b!93324 m!100087))

(assert (=> b!92861 d!24459))

(declare-fun d!24461 () Bool)

(declare-fun res!47383 () Bool)

(declare-fun e!60913 () Bool)

(assert (=> d!24461 (=> res!47383 e!60913)))

(assert (=> d!24461 (= res!47383 (bvsge from!355 (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(assert (=> d!24461 (= (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) from!355 Nil!1563) e!60913)))

(declare-fun b!93336 () Bool)

(declare-fun e!60915 () Bool)

(declare-fun contains!782 (List!1566 (_ BitVec 64)) Bool)

(assert (=> b!93336 (= e!60915 (contains!782 Nil!1563 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun b!93337 () Bool)

(declare-fun e!60912 () Bool)

(declare-fun e!60914 () Bool)

(assert (=> b!93337 (= e!60912 e!60914)))

(declare-fun c!15534 () Bool)

(assert (=> b!93337 (= c!15534 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(declare-fun call!9247 () Bool)

(declare-fun bm!9244 () Bool)

(assert (=> bm!9244 (= call!9247 (arrayNoDuplicates!0 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15534 (Cons!1562 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355) Nil!1563) Nil!1563)))))

(declare-fun b!93338 () Bool)

(assert (=> b!93338 (= e!60914 call!9247)))

(declare-fun b!93339 () Bool)

(assert (=> b!93339 (= e!60914 call!9247)))

(declare-fun b!93340 () Bool)

(assert (=> b!93340 (= e!60913 e!60912)))

(declare-fun res!47384 () Bool)

(assert (=> b!93340 (=> (not res!47384) (not e!60912))))

(assert (=> b!93340 (= res!47384 (not e!60915))))

(declare-fun res!47382 () Bool)

(assert (=> b!93340 (=> (not res!47382) (not e!60915))))

(assert (=> b!93340 (= res!47382 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) from!355)))))

(assert (= (and d!24461 (not res!47383)) b!93340))

(assert (= (and b!93340 res!47382) b!93336))

(assert (= (and b!93340 res!47384) b!93337))

(assert (= (and b!93337 c!15534) b!93339))

(assert (= (and b!93337 (not c!15534)) b!93338))

(assert (= (or b!93339 b!93338) bm!9244))

(assert (=> b!93336 m!100083))

(assert (=> b!93336 m!100083))

(declare-fun m!100623 () Bool)

(assert (=> b!93336 m!100623))

(assert (=> b!93337 m!100083))

(assert (=> b!93337 m!100083))

(assert (=> b!93337 m!100473))

(assert (=> bm!9244 m!100083))

(declare-fun m!100625 () Bool)

(assert (=> bm!9244 m!100625))

(assert (=> b!93340 m!100083))

(assert (=> b!93340 m!100083))

(assert (=> b!93340 m!100473))

(assert (=> b!92861 d!24461))

(declare-fun d!24463 () Bool)

(assert (=> d!24463 (= (array_inv!1233 (_keys!4105 newMap!16)) (bvsge (size!2221 (_keys!4105 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92852 d!24463))

(declare-fun d!24465 () Bool)

(assert (=> d!24465 (= (array_inv!1234 (_values!2407 newMap!16)) (bvsge (size!2222 (_values!2407 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92852 d!24465))

(declare-fun d!24467 () Bool)

(assert (=> d!24467 (= (array_inv!1233 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvsge (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!92842 d!24467))

(declare-fun d!24469 () Bool)

(assert (=> d!24469 (= (array_inv!1234 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvsge (size!2222 (_values!2407 (v!2738 (underlying!317 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!92842 d!24469))

(declare-fun d!24471 () Bool)

(assert (=> d!24471 (= (map!1223 newMap!16) (getCurrentListMap!443 (_keys!4105 newMap!16) (_values!2407 newMap!16) (mask!6493 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun bs!3845 () Bool)

(assert (= bs!3845 d!24471))

(assert (=> bs!3845 m!100327))

(assert (=> b!92850 d!24471))

(declare-fun b!93341 () Bool)

(declare-fun e!60925 () Bool)

(declare-fun lt!46197 () ListLongMap!1489)

(assert (=> b!93341 (= e!60925 (= (apply!88 lt!46197 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun d!24473 () Bool)

(declare-fun e!60919 () Bool)

(assert (=> d!24473 e!60919))

(declare-fun res!47392 () Bool)

(assert (=> d!24473 (=> (not res!47392) (not e!60919))))

(assert (=> d!24473 (= res!47392 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))))

(declare-fun lt!46191 () ListLongMap!1489)

(assert (=> d!24473 (= lt!46197 lt!46191)))

(declare-fun lt!46195 () Unit!2774)

(declare-fun e!60917 () Unit!2774)

(assert (=> d!24473 (= lt!46195 e!60917)))

(declare-fun c!15539 () Bool)

(declare-fun e!60920 () Bool)

(assert (=> d!24473 (= c!15539 e!60920)))

(declare-fun res!47386 () Bool)

(assert (=> d!24473 (=> (not res!47386) (not e!60920))))

(assert (=> d!24473 (= res!47386 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun e!60928 () ListLongMap!1489)

(assert (=> d!24473 (= lt!46191 e!60928)))

(declare-fun c!15536 () Bool)

(assert (=> d!24473 (= c!15536 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24473 (validMask!0 (mask!6493 (v!2738 (underlying!317 thiss!992))))))

(assert (=> d!24473 (= (getCurrentListMap!443 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))) lt!46197)))

(declare-fun b!93342 () Bool)

(declare-fun e!60923 () Bool)

(declare-fun call!9251 () Bool)

(assert (=> b!93342 (= e!60923 (not call!9251))))

(declare-fun b!93343 () Bool)

(assert (=> b!93343 (= e!60919 e!60923)))

(declare-fun c!15540 () Bool)

(assert (=> b!93343 (= c!15540 (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93344 () Bool)

(assert (=> b!93344 (= e!60920 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93345 () Bool)

(declare-fun e!60916 () ListLongMap!1489)

(declare-fun call!9252 () ListLongMap!1489)

(assert (=> b!93345 (= e!60916 call!9252)))

(declare-fun b!93346 () Bool)

(declare-fun e!60921 () Bool)

(assert (=> b!93346 (= e!60921 (validKeyInArray!0 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93347 () Bool)

(declare-fun e!60922 () Bool)

(declare-fun e!60926 () Bool)

(assert (=> b!93347 (= e!60922 e!60926)))

(declare-fun res!47390 () Bool)

(declare-fun call!9248 () Bool)

(assert (=> b!93347 (= res!47390 call!9248)))

(assert (=> b!93347 (=> (not res!47390) (not e!60926))))

(declare-fun b!93348 () Bool)

(assert (=> b!93348 (= e!60923 e!60925)))

(declare-fun res!47387 () Bool)

(assert (=> b!93348 (= res!47387 call!9251)))

(assert (=> b!93348 (=> (not res!47387) (not e!60925))))

(declare-fun b!93349 () Bool)

(declare-fun call!9249 () ListLongMap!1489)

(assert (=> b!93349 (= e!60928 (+!123 call!9249 (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9245 () Bool)

(declare-fun call!9254 () ListLongMap!1489)

(declare-fun call!9253 () ListLongMap!1489)

(assert (=> bm!9245 (= call!9254 call!9253)))

(declare-fun bm!9246 () Bool)

(assert (=> bm!9246 (= call!9252 call!9249)))

(declare-fun b!93350 () Bool)

(declare-fun res!47385 () Bool)

(assert (=> b!93350 (=> (not res!47385) (not e!60919))))

(assert (=> b!93350 (= res!47385 e!60922)))

(declare-fun c!15537 () Bool)

(assert (=> b!93350 (= c!15537 (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93351 () Bool)

(declare-fun Unit!2788 () Unit!2774)

(assert (=> b!93351 (= e!60917 Unit!2788)))

(declare-fun b!93352 () Bool)

(declare-fun e!60927 () Bool)

(declare-fun e!60918 () Bool)

(assert (=> b!93352 (= e!60927 e!60918)))

(declare-fun res!47391 () Bool)

(assert (=> b!93352 (=> (not res!47391) (not e!60918))))

(assert (=> b!93352 (= res!47391 (contains!779 lt!46197 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9247 () Bool)

(assert (=> bm!9247 (= call!9251 (contains!779 lt!46197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93353 () Bool)

(declare-fun e!60924 () ListLongMap!1489)

(assert (=> b!93353 (= e!60924 call!9252)))

(declare-fun b!93354 () Bool)

(declare-fun res!47388 () Bool)

(assert (=> b!93354 (=> (not res!47388) (not e!60919))))

(assert (=> b!93354 (= res!47388 e!60927)))

(declare-fun res!47393 () Bool)

(assert (=> b!93354 (=> res!47393 e!60927)))

(assert (=> b!93354 (= res!47393 (not e!60921))))

(declare-fun res!47389 () Bool)

(assert (=> b!93354 (=> (not res!47389) (not e!60921))))

(assert (=> b!93354 (= res!47389 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun bm!9248 () Bool)

(declare-fun call!9250 () ListLongMap!1489)

(assert (=> bm!9248 (= call!9250 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93355 () Bool)

(assert (=> b!93355 (= e!60916 call!9254)))

(declare-fun bm!9249 () Bool)

(declare-fun c!15538 () Bool)

(assert (=> bm!9249 (= call!9249 (+!123 (ite c!15536 call!9250 (ite c!15538 call!9253 call!9254)) (ite (or c!15536 c!15538) (tuple2!2283 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))) (tuple2!2283 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2738 (underlying!317 thiss!992)))))))))

(declare-fun b!93356 () Bool)

(declare-fun lt!46211 () Unit!2774)

(assert (=> b!93356 (= e!60917 lt!46211)))

(declare-fun lt!46200 () ListLongMap!1489)

(assert (=> b!93356 (= lt!46200 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46209 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46205 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46205 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46201 () Unit!2774)

(assert (=> b!93356 (= lt!46201 (addStillContains!64 lt!46200 lt!46209 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46205))))

(assert (=> b!93356 (contains!779 (+!123 lt!46200 (tuple2!2283 lt!46209 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46205)))

(declare-fun lt!46198 () Unit!2774)

(assert (=> b!93356 (= lt!46198 lt!46201)))

(declare-fun lt!46202 () ListLongMap!1489)

(assert (=> b!93356 (= lt!46202 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46190 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46208 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46208 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46204 () Unit!2774)

(assert (=> b!93356 (= lt!46204 (addApplyDifferent!64 lt!46202 lt!46190 (minValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46208))))

(assert (=> b!93356 (= (apply!88 (+!123 lt!46202 (tuple2!2283 lt!46190 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46208) (apply!88 lt!46202 lt!46208))))

(declare-fun lt!46210 () Unit!2774)

(assert (=> b!93356 (= lt!46210 lt!46204)))

(declare-fun lt!46206 () ListLongMap!1489)

(assert (=> b!93356 (= lt!46206 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46193 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46192 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46192 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46203 () Unit!2774)

(assert (=> b!93356 (= lt!46203 (addApplyDifferent!64 lt!46206 lt!46193 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46192))))

(assert (=> b!93356 (= (apply!88 (+!123 lt!46206 (tuple2!2283 lt!46193 (zeroValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46192) (apply!88 lt!46206 lt!46192))))

(declare-fun lt!46207 () Unit!2774)

(assert (=> b!93356 (= lt!46207 lt!46203)))

(declare-fun lt!46199 () ListLongMap!1489)

(assert (=> b!93356 (= lt!46199 (getCurrentListMapNoExtraKeys!87 (_keys!4105 (v!2738 (underlying!317 thiss!992))) (_values!2407 (v!2738 (underlying!317 thiss!992))) (mask!6493 (v!2738 (underlying!317 thiss!992))) (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) (zeroValue!2311 (v!2738 (underlying!317 thiss!992))) (minValue!2311 (v!2738 (underlying!317 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun lt!46196 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46194 () (_ BitVec 64))

(assert (=> b!93356 (= lt!46194 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93356 (= lt!46211 (addApplyDifferent!64 lt!46199 lt!46196 (minValue!2311 (v!2738 (underlying!317 thiss!992))) lt!46194))))

(assert (=> b!93356 (= (apply!88 (+!123 lt!46199 (tuple2!2283 lt!46196 (minValue!2311 (v!2738 (underlying!317 thiss!992))))) lt!46194) (apply!88 lt!46199 lt!46194))))

(declare-fun b!93357 () Bool)

(assert (=> b!93357 (= e!60918 (= (apply!88 lt!46197 (select (arr!1972 (_keys!4105 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1255 (select (arr!1973 (_values!2407 (v!2738 (underlying!317 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!360 (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93357 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2222 (_values!2407 (v!2738 (underlying!317 thiss!992))))))))

(assert (=> b!93357 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2221 (_keys!4105 (v!2738 (underlying!317 thiss!992))))))))

(declare-fun b!93358 () Bool)

(assert (=> b!93358 (= e!60928 e!60924)))

(assert (=> b!93358 (= c!15538 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93359 () Bool)

(assert (=> b!93359 (= e!60922 (not call!9248))))

(declare-fun bm!9250 () Bool)

(assert (=> bm!9250 (= call!9253 call!9250)))

(declare-fun b!93360 () Bool)

(assert (=> b!93360 (= e!60926 (= (apply!88 lt!46197 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2311 (v!2738 (underlying!317 thiss!992)))))))

(declare-fun b!93361 () Bool)

(declare-fun c!15535 () Bool)

(assert (=> b!93361 (= c!15535 (and (not (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2738 (underlying!317 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!93361 (= e!60924 e!60916)))

(declare-fun bm!9251 () Bool)

(assert (=> bm!9251 (= call!9248 (contains!779 lt!46197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!24473 c!15536) b!93349))

(assert (= (and d!24473 (not c!15536)) b!93358))

(assert (= (and b!93358 c!15538) b!93353))

(assert (= (and b!93358 (not c!15538)) b!93361))

(assert (= (and b!93361 c!15535) b!93345))

(assert (= (and b!93361 (not c!15535)) b!93355))

(assert (= (or b!93345 b!93355) bm!9245))

(assert (= (or b!93353 bm!9245) bm!9250))

(assert (= (or b!93353 b!93345) bm!9246))

(assert (= (or b!93349 bm!9250) bm!9248))

(assert (= (or b!93349 bm!9246) bm!9249))

(assert (= (and d!24473 res!47386) b!93344))

(assert (= (and d!24473 c!15539) b!93356))

(assert (= (and d!24473 (not c!15539)) b!93351))

(assert (= (and d!24473 res!47392) b!93354))

(assert (= (and b!93354 res!47389) b!93346))

(assert (= (and b!93354 (not res!47393)) b!93352))

(assert (= (and b!93352 res!47391) b!93357))

(assert (= (and b!93354 res!47388) b!93350))

(assert (= (and b!93350 c!15537) b!93347))

(assert (= (and b!93350 (not c!15537)) b!93359))

(assert (= (and b!93347 res!47390) b!93360))

(assert (= (or b!93347 b!93359) bm!9251))

(assert (= (and b!93350 res!47385) b!93343))

(assert (= (and b!93343 c!15540) b!93348))

(assert (= (and b!93343 (not c!15540)) b!93342))

(assert (= (and b!93348 res!47387) b!93341))

(assert (= (or b!93348 b!93342) bm!9247))

(declare-fun b_lambda!4107 () Bool)

(assert (=> (not b_lambda!4107) (not b!93357)))

(assert (=> b!93357 t!5431))

(declare-fun b_and!5685 () Bool)

(assert (= b_and!5681 (and (=> t!5431 result!3137) b_and!5685)))

(assert (=> b!93357 t!5433))

(declare-fun b_and!5687 () Bool)

(assert (= b_and!5683 (and (=> t!5433 result!3141) b_and!5687)))

(declare-fun m!100627 () Bool)

(assert (=> bm!9251 m!100627))

(declare-fun m!100629 () Bool)

(assert (=> bm!9247 m!100629))

(assert (=> b!93357 m!100385))

(declare-fun m!100631 () Bool)

(assert (=> b!93357 m!100631))

(assert (=> b!93357 m!100391))

(assert (=> b!93357 m!100391))

(assert (=> b!93357 m!100135))

(assert (=> b!93357 m!100393))

(assert (=> b!93357 m!100385))

(assert (=> b!93357 m!100135))

(declare-fun m!100633 () Bool)

(assert (=> b!93356 m!100633))

(declare-fun m!100635 () Bool)

(assert (=> b!93356 m!100635))

(declare-fun m!100637 () Bool)

(assert (=> b!93356 m!100637))

(declare-fun m!100639 () Bool)

(assert (=> b!93356 m!100639))

(assert (=> b!93356 m!100637))

(declare-fun m!100641 () Bool)

(assert (=> b!93356 m!100641))

(declare-fun m!100643 () Bool)

(assert (=> b!93356 m!100643))

(declare-fun m!100645 () Bool)

(assert (=> b!93356 m!100645))

(assert (=> b!93356 m!100643))

(declare-fun m!100647 () Bool)

(assert (=> b!93356 m!100647))

(assert (=> b!93356 m!100385))

(assert (=> b!93356 m!100647))

(declare-fun m!100649 () Bool)

(assert (=> b!93356 m!100649))

(assert (=> b!93356 m!100107))

(declare-fun m!100651 () Bool)

(assert (=> b!93356 m!100651))

(declare-fun m!100653 () Bool)

(assert (=> b!93356 m!100653))

(declare-fun m!100655 () Bool)

(assert (=> b!93356 m!100655))

(declare-fun m!100657 () Bool)

(assert (=> b!93356 m!100657))

(assert (=> b!93356 m!100651))

(declare-fun m!100659 () Bool)

(assert (=> b!93356 m!100659))

(declare-fun m!100661 () Bool)

(assert (=> b!93356 m!100661))

(declare-fun m!100663 () Bool)

(assert (=> bm!9249 m!100663))

(assert (=> b!93352 m!100385))

(assert (=> b!93352 m!100385))

(declare-fun m!100665 () Bool)

(assert (=> b!93352 m!100665))

(declare-fun m!100667 () Bool)

(assert (=> b!93341 m!100667))

(assert (=> d!24473 m!100413))

(assert (=> bm!9248 m!100107))

(declare-fun m!100669 () Bool)

(assert (=> b!93360 m!100669))

(assert (=> b!93346 m!100385))

(assert (=> b!93346 m!100385))

(assert (=> b!93346 m!100387))

(declare-fun m!100671 () Bool)

(assert (=> b!93349 m!100671))

(assert (=> b!93344 m!100385))

(assert (=> b!93344 m!100385))

(assert (=> b!93344 m!100387))

(assert (=> b!92850 d!24473))

(declare-fun d!24475 () Bool)

(declare-fun res!47394 () Bool)

(declare-fun e!60929 () Bool)

(assert (=> d!24475 (=> (not res!47394) (not e!60929))))

(assert (=> d!24475 (= res!47394 (simpleValid!64 newMap!16))))

(assert (=> d!24475 (= (valid!372 newMap!16) e!60929)))

(declare-fun b!93362 () Bool)

(declare-fun res!47395 () Bool)

(assert (=> b!93362 (=> (not res!47395) (not e!60929))))

(assert (=> b!93362 (= res!47395 (= (arrayCountValidKeys!0 (_keys!4105 newMap!16) #b00000000000000000000000000000000 (size!2221 (_keys!4105 newMap!16))) (_size!459 newMap!16)))))

(declare-fun b!93363 () Bool)

(declare-fun res!47396 () Bool)

(assert (=> b!93363 (=> (not res!47396) (not e!60929))))

(assert (=> b!93363 (= res!47396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4105 newMap!16) (mask!6493 newMap!16)))))

(declare-fun b!93364 () Bool)

(assert (=> b!93364 (= e!60929 (arrayNoDuplicates!0 (_keys!4105 newMap!16) #b00000000000000000000000000000000 Nil!1563))))

(assert (= (and d!24475 res!47394) b!93362))

(assert (= (and b!93362 res!47395) b!93363))

(assert (= (and b!93363 res!47396) b!93364))

(declare-fun m!100673 () Bool)

(assert (=> d!24475 m!100673))

(declare-fun m!100675 () Bool)

(assert (=> b!93362 m!100675))

(declare-fun m!100677 () Bool)

(assert (=> b!93363 m!100677))

(declare-fun m!100679 () Bool)

(assert (=> b!93364 m!100679))

(assert (=> b!92859 d!24475))

(declare-fun mapIsEmpty!3641 () Bool)

(declare-fun mapRes!3641 () Bool)

(assert (=> mapIsEmpty!3641 mapRes!3641))

(declare-fun b!93371 () Bool)

(declare-fun e!60934 () Bool)

(assert (=> b!93371 (= e!60934 tp_is_empty!2599)))

(declare-fun condMapEmpty!3641 () Bool)

(declare-fun mapDefault!3641 () ValueCell!956)

(assert (=> mapNonEmpty!3626 (= condMapEmpty!3641 (= mapRest!3626 ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3641)))))

(declare-fun e!60935 () Bool)

(assert (=> mapNonEmpty!3626 (= tp!9355 (and e!60935 mapRes!3641))))

(declare-fun mapNonEmpty!3641 () Bool)

(declare-fun tp!9383 () Bool)

(assert (=> mapNonEmpty!3641 (= mapRes!3641 (and tp!9383 e!60934))))

(declare-fun mapRest!3641 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapKey!3641 () (_ BitVec 32))

(declare-fun mapValue!3641 () ValueCell!956)

(assert (=> mapNonEmpty!3641 (= mapRest!3626 (store mapRest!3641 mapKey!3641 mapValue!3641))))

(declare-fun b!93372 () Bool)

(assert (=> b!93372 (= e!60935 tp_is_empty!2599)))

(assert (= (and mapNonEmpty!3626 condMapEmpty!3641) mapIsEmpty!3641))

(assert (= (and mapNonEmpty!3626 (not condMapEmpty!3641)) mapNonEmpty!3641))

(assert (= (and mapNonEmpty!3641 ((_ is ValueCellFull!956) mapValue!3641)) b!93371))

(assert (= (and mapNonEmpty!3626 ((_ is ValueCellFull!956) mapDefault!3641)) b!93372))

(declare-fun m!100681 () Bool)

(assert (=> mapNonEmpty!3641 m!100681))

(declare-fun mapIsEmpty!3642 () Bool)

(declare-fun mapRes!3642 () Bool)

(assert (=> mapIsEmpty!3642 mapRes!3642))

(declare-fun b!93373 () Bool)

(declare-fun e!60936 () Bool)

(assert (=> b!93373 (= e!60936 tp_is_empty!2599)))

(declare-fun condMapEmpty!3642 () Bool)

(declare-fun mapDefault!3642 () ValueCell!956)

(assert (=> mapNonEmpty!3625 (= condMapEmpty!3642 (= mapRest!3625 ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3642)))))

(declare-fun e!60937 () Bool)

(assert (=> mapNonEmpty!3625 (= tp!9356 (and e!60937 mapRes!3642))))

(declare-fun mapNonEmpty!3642 () Bool)

(declare-fun tp!9384 () Bool)

(assert (=> mapNonEmpty!3642 (= mapRes!3642 (and tp!9384 e!60936))))

(declare-fun mapRest!3642 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapKey!3642 () (_ BitVec 32))

(declare-fun mapValue!3642 () ValueCell!956)

(assert (=> mapNonEmpty!3642 (= mapRest!3625 (store mapRest!3642 mapKey!3642 mapValue!3642))))

(declare-fun b!93374 () Bool)

(assert (=> b!93374 (= e!60937 tp_is_empty!2599)))

(assert (= (and mapNonEmpty!3625 condMapEmpty!3642) mapIsEmpty!3642))

(assert (= (and mapNonEmpty!3625 (not condMapEmpty!3642)) mapNonEmpty!3642))

(assert (= (and mapNonEmpty!3642 ((_ is ValueCellFull!956) mapValue!3642)) b!93373))

(assert (= (and mapNonEmpty!3625 ((_ is ValueCellFull!956) mapDefault!3642)) b!93374))

(declare-fun m!100683 () Bool)

(assert (=> mapNonEmpty!3642 m!100683))

(declare-fun b_lambda!4109 () Bool)

(assert (= b_lambda!4105 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4109)))

(declare-fun b_lambda!4111 () Bool)

(assert (= b_lambda!4103 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4111)))

(declare-fun b_lambda!4113 () Bool)

(assert (= b_lambda!4099 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4113)))

(declare-fun b_lambda!4115 () Bool)

(assert (= b_lambda!4101 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4115)))

(declare-fun b_lambda!4117 () Bool)

(assert (= b_lambda!4107 (or (and b!92842 b_free!2365) (and b!92852 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2738 (underlying!317 thiss!992))))) b_lambda!4117)))

(check-sat (not b!93352) (not d!24441) (not d!24427) (not d!24431) (not b!93182) (not bm!9198) b_and!5685 (not bm!9231) (not d!24437) (not b!93147) b_and!5687 (not bm!9247) (not b!93260) (not b!93189) (not b!93337) (not b!93262) (not b!93247) (not d!24433) (not d!24439) (not bm!9238) (not b_lambda!4097) (not b!93196) (not bm!9170) (not b!93264) (not b!93239) (not d!24455) (not b!93017) (not b!93181) (not d!24445) (not bm!9248) (not b!93109) (not d!24459) (not d!24453) (not d!24435) (not bm!9168) (not bm!9239) (not b!93270) (not b!93267) (not d!24415) (not b!93242) (not b!93190) (not b!93302) (not bm!9164) (not b!93154) (not b!93130) (not bm!9230) (not b!93357) (not bm!9229) (not b!93145) (not bm!9249) (not d!24419) (not b!93244) (not d!24417) (not b!93356) (not d!24475) (not b!93312) (not b!93258) (not bm!9169) (not bm!9233) (not b!93346) (not bm!9236) (not b!93019) (not b!93254) (not d!24447) (not b!93263) (not bm!9175) (not d!24443) (not b!93009) (not b_lambda!4117) (not d!24423) (not bm!9160) (not b!93341) (not b!93184) (not bm!9251) (not b!93349) (not b_lambda!4111) (not bm!9181) (not b!93268) (not b!93153) (not bm!9165) (not b!93010) (not d!24471) (not bm!9200) (not b!93300) (not d!24421) (not mapNonEmpty!3641) (not bm!9232) (not b!93363) (not d!24473) (not bm!9241) (not d!24451) (not b!93250) (not b_lambda!4113) (not b!93123) (not b!93265) (not bm!9244) (not b_next!2365) (not b!93179) (not b_lambda!4115) (not b!93188) (not d!24449) (not bm!9235) (not b!93129) tp_is_empty!2599 (not b!93271) (not b!93143) (not b!93336) (not d!24429) (not b!93255) (not bm!9163) (not b!93307) (not b!93364) (not b_next!2367) (not b!93269) (not b!93319) (not bm!9161) (not b!93266) (not mapNonEmpty!3642) (not b!93360) (not bm!9167) (not b!93344) (not b!93324) (not b!93340) (not b!93261) (not b!93148) (not bm!9237) (not b_lambda!4109) (not bm!9234) (not b!93362) (not b!93185) (not bm!9178) (not b!93008) (not b!93119) (not b!93146) (not b!93305) (not bm!9199) (not bm!9240) (not bm!9177) (not bm!9202) (not b!93195))
(check-sat b_and!5685 b_and!5687 (not b_next!2365) (not b_next!2367))
