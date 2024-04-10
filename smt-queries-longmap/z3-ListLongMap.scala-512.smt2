; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12514 () Bool)

(assert start!12514)

(declare-fun b!107408 () Bool)

(declare-fun b_free!2537 () Bool)

(declare-fun b_next!2537 () Bool)

(assert (=> b!107408 (= b_free!2537 (not b_next!2537))))

(declare-fun tp!9941 () Bool)

(declare-fun b_and!6619 () Bool)

(assert (=> b!107408 (= tp!9941 b_and!6619)))

(declare-fun b!107396 () Bool)

(declare-fun b_free!2539 () Bool)

(declare-fun b_next!2539 () Bool)

(assert (=> b!107396 (= b_free!2539 (not b_next!2539))))

(declare-fun tp!9944 () Bool)

(declare-fun b_and!6621 () Bool)

(assert (=> b!107396 (= tp!9944 b_and!6621)))

(declare-fun res!53329 () Bool)

(declare-fun e!69886 () Bool)

(assert (=> start!12514 (=> (not res!53329) (not e!69886))))

(declare-datatypes ((V!3227 0))(
  ( (V!3228 (val!1387 Int)) )
))
(declare-datatypes ((array!4363 0))(
  ( (array!4364 (arr!2069 (Array (_ BitVec 32) (_ BitVec 64))) (size!2325 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!999 0))(
  ( (ValueCellFull!999 (v!2907 V!3227)) (EmptyCell!999) )
))
(declare-datatypes ((array!4365 0))(
  ( (array!4366 (arr!2070 (Array (_ BitVec 32) ValueCell!999)) (size!2326 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!906 0))(
  ( (LongMapFixedSize!907 (defaultEntry!2603 Int) (mask!6759 (_ BitVec 32)) (extraKeys!2404 (_ BitVec 32)) (zeroValue!2476 V!3227) (minValue!2476 V!3227) (_size!502 (_ BitVec 32)) (_keys!4313 array!4363) (_values!2586 array!4365) (_vacant!502 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!706 0))(
  ( (Cell!707 (v!2908 LongMapFixedSize!906)) )
))
(declare-datatypes ((LongMap!706 0))(
  ( (LongMap!707 (underlying!364 Cell!706)) )
))
(declare-fun thiss!992 () LongMap!706)

(declare-fun valid!423 (LongMap!706) Bool)

(assert (=> start!12514 (= res!53329 (valid!423 thiss!992))))

(assert (=> start!12514 e!69886))

(declare-fun e!69887 () Bool)

(assert (=> start!12514 e!69887))

(assert (=> start!12514 true))

(declare-fun e!69890 () Bool)

(assert (=> start!12514 e!69890))

(declare-fun mapIsEmpty!3955 () Bool)

(declare-fun mapRes!3956 () Bool)

(assert (=> mapIsEmpty!3955 mapRes!3956))

(declare-fun b!107391 () Bool)

(declare-fun e!69884 () Bool)

(assert (=> b!107391 (= e!69886 e!69884)))

(declare-fun res!53336 () Bool)

(assert (=> b!107391 (=> (not res!53336) (not e!69884))))

(declare-datatypes ((tuple2!2416 0))(
  ( (tuple2!2417 (_1!1219 (_ BitVec 64)) (_2!1219 V!3227)) )
))
(declare-datatypes ((List!1621 0))(
  ( (Nil!1618) (Cons!1617 (h!2215 tuple2!2416) (t!5725 List!1621)) )
))
(declare-datatypes ((ListLongMap!1579 0))(
  ( (ListLongMap!1580 (toList!805 List!1621)) )
))
(declare-fun lt!55076 () ListLongMap!1579)

(declare-fun lt!55082 () ListLongMap!1579)

(assert (=> b!107391 (= res!53336 (= lt!55076 lt!55082))))

(declare-fun newMap!16 () LongMapFixedSize!906)

(declare-fun map!1289 (LongMapFixedSize!906) ListLongMap!1579)

(assert (=> b!107391 (= lt!55082 (map!1289 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!490 (array!4363 array!4365 (_ BitVec 32) (_ BitVec 32) V!3227 V!3227 (_ BitVec 32) Int) ListLongMap!1579)

(assert (=> b!107391 (= lt!55076 (getCurrentListMap!490 (_keys!4313 (v!2908 (underlying!364 thiss!992))) (_values!2586 (v!2908 (underlying!364 thiss!992))) (mask!6759 (v!2908 (underlying!364 thiss!992))) (extraKeys!2404 (v!2908 (underlying!364 thiss!992))) (zeroValue!2476 (v!2908 (underlying!364 thiss!992))) (minValue!2476 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2603 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun b!107392 () Bool)

(declare-fun res!53330 () Bool)

(assert (=> b!107392 (=> (not res!53330) (not e!69886))))

(declare-fun valid!424 (LongMapFixedSize!906) Bool)

(assert (=> b!107392 (= res!53330 (valid!424 newMap!16))))

(declare-fun b!107393 () Bool)

(declare-fun e!69891 () Bool)

(assert (=> b!107393 (= e!69887 e!69891)))

(declare-fun b!107394 () Bool)

(declare-fun e!69889 () Bool)

(assert (=> b!107394 (= e!69891 e!69889)))

(declare-fun mapNonEmpty!3955 () Bool)

(declare-fun mapRes!3955 () Bool)

(declare-fun tp!9942 () Bool)

(declare-fun e!69892 () Bool)

(assert (=> mapNonEmpty!3955 (= mapRes!3955 (and tp!9942 e!69892))))

(declare-fun mapKey!3956 () (_ BitVec 32))

(declare-fun mapValue!3956 () ValueCell!999)

(declare-fun mapRest!3955 () (Array (_ BitVec 32) ValueCell!999))

(assert (=> mapNonEmpty!3955 (= (arr!2070 (_values!2586 (v!2908 (underlying!364 thiss!992)))) (store mapRest!3955 mapKey!3956 mapValue!3956))))

(declare-fun b!107395 () Bool)

(declare-fun e!69893 () Bool)

(declare-fun e!69883 () Bool)

(assert (=> b!107395 (= e!69893 (and e!69883 mapRes!3955))))

(declare-fun condMapEmpty!3956 () Bool)

(declare-fun mapDefault!3956 () ValueCell!999)

(assert (=> b!107395 (= condMapEmpty!3956 (= (arr!2070 (_values!2586 (v!2908 (underlying!364 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!999)) mapDefault!3956)))))

(declare-fun tp_is_empty!2685 () Bool)

(declare-fun e!69888 () Bool)

(declare-fun array_inv!1303 (array!4363) Bool)

(declare-fun array_inv!1304 (array!4365) Bool)

(assert (=> b!107396 (= e!69890 (and tp!9944 tp_is_empty!2685 (array_inv!1303 (_keys!4313 newMap!16)) (array_inv!1304 (_values!2586 newMap!16)) e!69888))))

(declare-fun b!107397 () Bool)

(declare-datatypes ((Unit!3313 0))(
  ( (Unit!3314) )
))
(declare-fun e!69878 () Unit!3313)

(declare-fun Unit!3315 () Unit!3313)

(assert (=> b!107397 (= e!69878 Unit!3315)))

(declare-fun b!107398 () Bool)

(declare-fun e!69879 () Bool)

(assert (=> b!107398 (= e!69884 e!69879)))

(declare-fun res!53334 () Bool)

(assert (=> b!107398 (=> (not res!53334) (not e!69879))))

(assert (=> b!107398 (= res!53334 (and (not (= (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!55080 () V!3227)

(declare-fun get!1337 (ValueCell!999 V!3227) V!3227)

(declare-fun dynLambda!387 (Int (_ BitVec 64)) V!3227)

(assert (=> b!107398 (= lt!55080 (get!1337 (select (arr!2070 (_values!2586 (v!2908 (underlying!364 thiss!992)))) from!355) (dynLambda!387 (defaultEntry!2603 (v!2908 (underlying!364 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!107399 () Bool)

(declare-fun res!53332 () Bool)

(assert (=> b!107399 (=> (not res!53332) (not e!69886))))

(assert (=> b!107399 (= res!53332 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6759 newMap!16)) (_size!502 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun b!107400 () Bool)

(declare-fun res!53335 () Bool)

(assert (=> b!107400 (=> (not res!53335) (not e!69886))))

(assert (=> b!107400 (= res!53335 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2325 (_keys!4313 (v!2908 (underlying!364 thiss!992)))))))))

(declare-fun b!107401 () Bool)

(declare-fun e!69880 () Bool)

(assert (=> b!107401 (= e!69880 (or (not (= (size!2326 (_values!2586 (v!2908 (underlying!364 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6759 (v!2908 (underlying!364 thiss!992)))))) (not (= (size!2325 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) (size!2326 (_values!2586 (v!2908 (underlying!364 thiss!992)))))) (bvsge (mask!6759 (v!2908 (underlying!364 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!107402 () Bool)

(declare-fun e!69882 () Bool)

(assert (=> b!107402 (= e!69888 (and e!69882 mapRes!3956))))

(declare-fun condMapEmpty!3955 () Bool)

(declare-fun mapDefault!3955 () ValueCell!999)

(assert (=> b!107402 (= condMapEmpty!3955 (= (arr!2070 (_values!2586 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!999)) mapDefault!3955)))))

(declare-fun b!107403 () Bool)

(declare-fun e!69881 () Bool)

(assert (=> b!107403 (= e!69879 e!69881)))

(declare-fun res!53331 () Bool)

(assert (=> b!107403 (=> (not res!53331) (not e!69881))))

(declare-datatypes ((tuple2!2418 0))(
  ( (tuple2!2419 (_1!1220 Bool) (_2!1220 LongMapFixedSize!906)) )
))
(declare-fun lt!55079 () tuple2!2418)

(assert (=> b!107403 (= res!53331 (and (_1!1220 lt!55079) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!55074 () Unit!3313)

(assert (=> b!107403 (= lt!55074 e!69878)))

(declare-fun c!18840 () Bool)

(declare-fun contains!831 (ListLongMap!1579 (_ BitVec 64)) Bool)

(assert (=> b!107403 (= c!18840 (contains!831 lt!55082 (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355)))))

(declare-fun update!157 (LongMapFixedSize!906 (_ BitVec 64) V!3227) tuple2!2418)

(assert (=> b!107403 (= lt!55079 (update!157 newMap!16 (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) lt!55080))))

(declare-fun b!107404 () Bool)

(declare-fun e!69894 () Bool)

(assert (=> b!107404 (= e!69894 tp_is_empty!2685)))

(declare-fun b!107405 () Bool)

(declare-fun Unit!3316 () Unit!3313)

(assert (=> b!107405 (= e!69878 Unit!3316)))

(declare-fun lt!55077 () Unit!3313)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!108 (array!4363 array!4365 (_ BitVec 32) (_ BitVec 32) V!3227 V!3227 (_ BitVec 64) (_ BitVec 32) Int) Unit!3313)

(assert (=> b!107405 (= lt!55077 (lemmaListMapContainsThenArrayContainsFrom!108 (_keys!4313 (v!2908 (underlying!364 thiss!992))) (_values!2586 (v!2908 (underlying!364 thiss!992))) (mask!6759 (v!2908 (underlying!364 thiss!992))) (extraKeys!2404 (v!2908 (underlying!364 thiss!992))) (zeroValue!2476 (v!2908 (underlying!364 thiss!992))) (minValue!2476 (v!2908 (underlying!364 thiss!992))) (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2603 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!107405 (arrayContainsKey!0 (_keys!4313 (v!2908 (underlying!364 thiss!992))) (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!55075 () Unit!3313)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4363 (_ BitVec 32) (_ BitVec 32)) Unit!3313)

(assert (=> b!107405 (= lt!55075 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4313 (v!2908 (underlying!364 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1622 0))(
  ( (Nil!1619) (Cons!1618 (h!2216 (_ BitVec 64)) (t!5726 List!1622)) )
))
(declare-fun arrayNoDuplicates!0 (array!4363 (_ BitVec 32) List!1622) Bool)

(assert (=> b!107405 (arrayNoDuplicates!0 (_keys!4313 (v!2908 (underlying!364 thiss!992))) from!355 Nil!1619)))

(declare-fun lt!55072 () Unit!3313)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4363 (_ BitVec 32) (_ BitVec 64) List!1622) Unit!3313)

(assert (=> b!107405 (= lt!55072 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4313 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) (Cons!1618 (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) Nil!1619)))))

(assert (=> b!107405 false))

(declare-fun b!107406 () Bool)

(assert (=> b!107406 (= e!69892 tp_is_empty!2685)))

(declare-fun mapNonEmpty!3956 () Bool)

(declare-fun tp!9943 () Bool)

(assert (=> mapNonEmpty!3956 (= mapRes!3956 (and tp!9943 e!69894))))

(declare-fun mapValue!3955 () ValueCell!999)

(declare-fun mapRest!3956 () (Array (_ BitVec 32) ValueCell!999))

(declare-fun mapKey!3955 () (_ BitVec 32))

(assert (=> mapNonEmpty!3956 (= (arr!2070 (_values!2586 newMap!16)) (store mapRest!3956 mapKey!3955 mapValue!3955))))

(declare-fun mapIsEmpty!3956 () Bool)

(assert (=> mapIsEmpty!3956 mapRes!3955))

(declare-fun b!107407 () Bool)

(assert (=> b!107407 (= e!69881 (not e!69880))))

(declare-fun res!53333 () Bool)

(assert (=> b!107407 (=> res!53333 e!69880)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!107407 (= res!53333 (not (validMask!0 (mask!6759 (v!2908 (underlying!364 thiss!992))))))))

(declare-fun lt!55078 () ListLongMap!1579)

(declare-fun lt!55083 () tuple2!2416)

(declare-fun lt!55081 () tuple2!2416)

(declare-fun +!146 (ListLongMap!1579 tuple2!2416) ListLongMap!1579)

(assert (=> b!107407 (= (+!146 (+!146 lt!55078 lt!55083) lt!55081) (+!146 (+!146 lt!55078 lt!55081) lt!55083))))

(assert (=> b!107407 (= lt!55081 (tuple2!2417 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2476 (v!2908 (underlying!364 thiss!992)))))))

(assert (=> b!107407 (= lt!55083 (tuple2!2417 (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) lt!55080))))

(declare-fun lt!55073 () Unit!3313)

(declare-fun addCommutativeForDiffKeys!58 (ListLongMap!1579 (_ BitVec 64) V!3227 (_ BitVec 64) V!3227) Unit!3313)

(assert (=> b!107407 (= lt!55073 (addCommutativeForDiffKeys!58 lt!55078 (select (arr!2069 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) from!355) lt!55080 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2476 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!112 (array!4363 array!4365 (_ BitVec 32) (_ BitVec 32) V!3227 V!3227 (_ BitVec 32) Int) ListLongMap!1579)

(assert (=> b!107407 (= lt!55078 (getCurrentListMapNoExtraKeys!112 (_keys!4313 (v!2908 (underlying!364 thiss!992))) (_values!2586 (v!2908 (underlying!364 thiss!992))) (mask!6759 (v!2908 (underlying!364 thiss!992))) (extraKeys!2404 (v!2908 (underlying!364 thiss!992))) (zeroValue!2476 (v!2908 (underlying!364 thiss!992))) (minValue!2476 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2603 (v!2908 (underlying!364 thiss!992)))))))

(assert (=> b!107408 (= e!69889 (and tp!9941 tp_is_empty!2685 (array_inv!1303 (_keys!4313 (v!2908 (underlying!364 thiss!992)))) (array_inv!1304 (_values!2586 (v!2908 (underlying!364 thiss!992)))) e!69893))))

(declare-fun b!107409 () Bool)

(assert (=> b!107409 (= e!69883 tp_is_empty!2685)))

(declare-fun b!107410 () Bool)

(assert (=> b!107410 (= e!69882 tp_is_empty!2685)))

(assert (= (and start!12514 res!53329) b!107400))

(assert (= (and b!107400 res!53335) b!107392))

(assert (= (and b!107392 res!53330) b!107399))

(assert (= (and b!107399 res!53332) b!107391))

(assert (= (and b!107391 res!53336) b!107398))

(assert (= (and b!107398 res!53334) b!107403))

(assert (= (and b!107403 c!18840) b!107405))

(assert (= (and b!107403 (not c!18840)) b!107397))

(assert (= (and b!107403 res!53331) b!107407))

(assert (= (and b!107407 (not res!53333)) b!107401))

(assert (= (and b!107395 condMapEmpty!3956) mapIsEmpty!3956))

(assert (= (and b!107395 (not condMapEmpty!3956)) mapNonEmpty!3955))

(get-info :version)

(assert (= (and mapNonEmpty!3955 ((_ is ValueCellFull!999) mapValue!3956)) b!107406))

(assert (= (and b!107395 ((_ is ValueCellFull!999) mapDefault!3956)) b!107409))

(assert (= b!107408 b!107395))

(assert (= b!107394 b!107408))

(assert (= b!107393 b!107394))

(assert (= start!12514 b!107393))

(assert (= (and b!107402 condMapEmpty!3955) mapIsEmpty!3955))

(assert (= (and b!107402 (not condMapEmpty!3955)) mapNonEmpty!3956))

(assert (= (and mapNonEmpty!3956 ((_ is ValueCellFull!999) mapValue!3955)) b!107404))

(assert (= (and b!107402 ((_ is ValueCellFull!999) mapDefault!3955)) b!107410))

(assert (= b!107396 b!107402))

(assert (= start!12514 b!107396))

(declare-fun b_lambda!4813 () Bool)

(assert (=> (not b_lambda!4813) (not b!107398)))

(declare-fun t!5722 () Bool)

(declare-fun tb!2069 () Bool)

(assert (=> (and b!107408 (= (defaultEntry!2603 (v!2908 (underlying!364 thiss!992))) (defaultEntry!2603 (v!2908 (underlying!364 thiss!992)))) t!5722) tb!2069))

(declare-fun result!3477 () Bool)

(assert (=> tb!2069 (= result!3477 tp_is_empty!2685)))

(assert (=> b!107398 t!5722))

(declare-fun b_and!6623 () Bool)

(assert (= b_and!6619 (and (=> t!5722 result!3477) b_and!6623)))

(declare-fun tb!2071 () Bool)

(declare-fun t!5724 () Bool)

(assert (=> (and b!107396 (= (defaultEntry!2603 newMap!16) (defaultEntry!2603 (v!2908 (underlying!364 thiss!992)))) t!5724) tb!2071))

(declare-fun result!3481 () Bool)

(assert (= result!3481 result!3477))

(assert (=> b!107398 t!5724))

(declare-fun b_and!6625 () Bool)

(assert (= b_and!6621 (and (=> t!5724 result!3481) b_and!6625)))

(declare-fun m!120809 () Bool)

(assert (=> start!12514 m!120809))

(declare-fun m!120811 () Bool)

(assert (=> b!107408 m!120811))

(declare-fun m!120813 () Bool)

(assert (=> b!107408 m!120813))

(declare-fun m!120815 () Bool)

(assert (=> b!107391 m!120815))

(declare-fun m!120817 () Bool)

(assert (=> b!107391 m!120817))

(declare-fun m!120819 () Bool)

(assert (=> b!107405 m!120819))

(declare-fun m!120821 () Bool)

(assert (=> b!107405 m!120821))

(declare-fun m!120823 () Bool)

(assert (=> b!107405 m!120823))

(declare-fun m!120825 () Bool)

(assert (=> b!107405 m!120825))

(assert (=> b!107405 m!120823))

(assert (=> b!107405 m!120823))

(declare-fun m!120827 () Bool)

(assert (=> b!107405 m!120827))

(assert (=> b!107405 m!120823))

(declare-fun m!120829 () Bool)

(assert (=> b!107405 m!120829))

(assert (=> b!107398 m!120823))

(declare-fun m!120831 () Bool)

(assert (=> b!107398 m!120831))

(declare-fun m!120833 () Bool)

(assert (=> b!107398 m!120833))

(assert (=> b!107398 m!120831))

(assert (=> b!107398 m!120833))

(declare-fun m!120835 () Bool)

(assert (=> b!107398 m!120835))

(declare-fun m!120837 () Bool)

(assert (=> mapNonEmpty!3955 m!120837))

(assert (=> b!107403 m!120823))

(assert (=> b!107403 m!120823))

(declare-fun m!120839 () Bool)

(assert (=> b!107403 m!120839))

(assert (=> b!107403 m!120823))

(declare-fun m!120841 () Bool)

(assert (=> b!107403 m!120841))

(declare-fun m!120843 () Bool)

(assert (=> mapNonEmpty!3956 m!120843))

(declare-fun m!120845 () Bool)

(assert (=> b!107392 m!120845))

(assert (=> b!107407 m!120823))

(declare-fun m!120847 () Bool)

(assert (=> b!107407 m!120847))

(declare-fun m!120849 () Bool)

(assert (=> b!107407 m!120849))

(declare-fun m!120851 () Bool)

(assert (=> b!107407 m!120851))

(assert (=> b!107407 m!120823))

(declare-fun m!120853 () Bool)

(assert (=> b!107407 m!120853))

(declare-fun m!120855 () Bool)

(assert (=> b!107407 m!120855))

(assert (=> b!107407 m!120849))

(assert (=> b!107407 m!120847))

(declare-fun m!120857 () Bool)

(assert (=> b!107407 m!120857))

(declare-fun m!120859 () Bool)

(assert (=> b!107407 m!120859))

(declare-fun m!120861 () Bool)

(assert (=> b!107396 m!120861))

(declare-fun m!120863 () Bool)

(assert (=> b!107396 m!120863))

(check-sat (not b!107398) (not start!12514) (not b!107396) (not b!107405) (not b!107392) (not b_next!2539) (not b_lambda!4813) (not b_next!2537) (not b!107391) b_and!6623 (not b!107408) b_and!6625 (not b!107403) tp_is_empty!2685 (not mapNonEmpty!3955) (not mapNonEmpty!3956) (not b!107407))
(check-sat b_and!6623 b_and!6625 (not b_next!2537) (not b_next!2539))
