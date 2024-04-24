; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12150 () Bool)

(assert start!12150)

(declare-fun b!102584 () Bool)

(declare-fun b_free!2497 () Bool)

(declare-fun b_next!2497 () Bool)

(assert (=> b!102584 (= b_free!2497 (not b_next!2497))))

(declare-fun tp!9804 () Bool)

(declare-fun b_and!6337 () Bool)

(assert (=> b!102584 (= tp!9804 b_and!6337)))

(declare-fun b!102590 () Bool)

(declare-fun b_free!2499 () Bool)

(declare-fun b_next!2499 () Bool)

(assert (=> b!102590 (= b_free!2499 (not b_next!2499))))

(declare-fun tp!9803 () Bool)

(declare-fun b_and!6339 () Bool)

(assert (=> b!102590 (= tp!9803 b_and!6339)))

(declare-fun b!102581 () Bool)

(declare-fun res!51303 () Bool)

(declare-fun e!66807 () Bool)

(assert (=> b!102581 (=> (not res!51303) (not e!66807))))

(declare-datatypes ((V!3201 0))(
  ( (V!3202 (val!1377 Int)) )
))
(declare-datatypes ((array!4303 0))(
  ( (array!4304 (arr!2042 (Array (_ BitVec 32) (_ BitVec 64))) (size!2296 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!989 0))(
  ( (ValueCellFull!989 (v!2867 V!3201)) (EmptyCell!989) )
))
(declare-datatypes ((array!4305 0))(
  ( (array!4306 (arr!2043 (Array (_ BitVec 32) ValueCell!989)) (size!2297 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!886 0))(
  ( (LongMapFixedSize!887 (defaultEntry!2554 Int) (mask!6687 (_ BitVec 32)) (extraKeys!2363 (_ BitVec 32)) (zeroValue!2431 V!3201) (minValue!2431 V!3201) (_size!492 (_ BitVec 32)) (_keys!4256 array!4303) (_values!2537 array!4305) (_vacant!492 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!886)

(declare-datatypes ((Cell!688 0))(
  ( (Cell!689 (v!2868 LongMapFixedSize!886)) )
))
(declare-datatypes ((LongMap!688 0))(
  ( (LongMap!689 (underlying!355 Cell!688)) )
))
(declare-fun thiss!992 () LongMap!688)

(assert (=> b!102581 (= res!51303 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6687 newMap!16)) (_size!492 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102582 () Bool)

(declare-fun e!66814 () Bool)

(declare-fun e!66808 () Bool)

(declare-fun mapRes!3875 () Bool)

(assert (=> b!102582 (= e!66814 (and e!66808 mapRes!3875))))

(declare-fun condMapEmpty!3876 () Bool)

(declare-fun mapDefault!3875 () ValueCell!989)

(assert (=> b!102582 (= condMapEmpty!3876 (= (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3875)))))

(declare-fun b!102583 () Bool)

(declare-fun e!66813 () Bool)

(declare-fun tp_is_empty!2665 () Bool)

(assert (=> b!102583 (= e!66813 tp_is_empty!2665)))

(declare-fun e!66810 () Bool)

(declare-fun array_inv!1257 (array!4303) Bool)

(declare-fun array_inv!1258 (array!4305) Bool)

(assert (=> b!102584 (= e!66810 (and tp!9804 tp_is_empty!2665 (array_inv!1257 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (array_inv!1258 (_values!2537 (v!2868 (underlying!355 thiss!992)))) e!66814))))

(declare-fun b!102585 () Bool)

(declare-fun res!51304 () Bool)

(assert (=> b!102585 (=> (not res!51304) (not e!66807))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102585 (= res!51304 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992)))))))))

(declare-fun mapNonEmpty!3875 () Bool)

(declare-fun mapRes!3876 () Bool)

(declare-fun tp!9802 () Bool)

(declare-fun e!66818 () Bool)

(assert (=> mapNonEmpty!3875 (= mapRes!3876 (and tp!9802 e!66818))))

(declare-fun mapKey!3875 () (_ BitVec 32))

(declare-fun mapValue!3876 () ValueCell!989)

(declare-fun mapRest!3875 () (Array (_ BitVec 32) ValueCell!989))

(assert (=> mapNonEmpty!3875 (= (arr!2043 (_values!2537 newMap!16)) (store mapRest!3875 mapKey!3875 mapValue!3876))))

(declare-fun mapIsEmpty!3875 () Bool)

(assert (=> mapIsEmpty!3875 mapRes!3876))

(declare-fun b!102586 () Bool)

(assert (=> b!102586 (= e!66818 tp_is_empty!2665)))

(declare-fun mapNonEmpty!3876 () Bool)

(declare-fun tp!9801 () Bool)

(assert (=> mapNonEmpty!3876 (= mapRes!3875 (and tp!9801 e!66813))))

(declare-fun mapKey!3876 () (_ BitVec 32))

(declare-fun mapRest!3876 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapValue!3875 () ValueCell!989)

(assert (=> mapNonEmpty!3876 (= (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (store mapRest!3876 mapKey!3876 mapValue!3875))))

(declare-fun res!51302 () Bool)

(assert (=> start!12150 (=> (not res!51302) (not e!66807))))

(declare-fun valid!413 (LongMap!688) Bool)

(assert (=> start!12150 (= res!51302 (valid!413 thiss!992))))

(assert (=> start!12150 e!66807))

(declare-fun e!66820 () Bool)

(assert (=> start!12150 e!66820))

(assert (=> start!12150 true))

(declare-fun e!66819 () Bool)

(assert (=> start!12150 e!66819))

(declare-fun b!102587 () Bool)

(declare-fun e!66816 () Bool)

(declare-fun e!66815 () Bool)

(assert (=> b!102587 (= e!66816 e!66815)))

(declare-fun res!51299 () Bool)

(assert (=> b!102587 (=> (not res!51299) (not e!66815))))

(declare-datatypes ((tuple2!2342 0))(
  ( (tuple2!2343 (_1!1182 Bool) (_2!1182 LongMapFixedSize!886)) )
))
(declare-fun lt!52119 () tuple2!2342)

(assert (=> b!102587 (= res!51299 (and (_1!1182 lt!52119) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3118 0))(
  ( (Unit!3119) )
))
(declare-fun lt!52121 () Unit!3118)

(declare-fun e!66809 () Unit!3118)

(assert (=> b!102587 (= lt!52121 e!66809)))

(declare-fun c!17638 () Bool)

(declare-datatypes ((tuple2!2344 0))(
  ( (tuple2!2345 (_1!1183 (_ BitVec 64)) (_2!1183 V!3201)) )
))
(declare-datatypes ((List!1587 0))(
  ( (Nil!1584) (Cons!1583 (h!2179 tuple2!2344) (t!5629 List!1587)) )
))
(declare-datatypes ((ListLongMap!1521 0))(
  ( (ListLongMap!1522 (toList!776 List!1587)) )
))
(declare-fun lt!52120 () ListLongMap!1521)

(declare-fun contains!807 (ListLongMap!1521 (_ BitVec 64)) Bool)

(assert (=> b!102587 (= c!17638 (contains!807 lt!52120 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun lt!52117 () V!3201)

(declare-fun update!156 (LongMapFixedSize!886 (_ BitVec 64) V!3201) tuple2!2342)

(assert (=> b!102587 (= lt!52119 (update!156 newMap!16 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117))))

(declare-fun b!102588 () Bool)

(declare-fun Unit!3120 () Unit!3118)

(assert (=> b!102588 (= e!66809 Unit!3120)))

(declare-fun b!102589 () Bool)

(declare-fun e!66823 () Bool)

(assert (=> b!102589 (= e!66823 e!66816)))

(declare-fun res!51305 () Bool)

(assert (=> b!102589 (=> (not res!51305) (not e!66816))))

(assert (=> b!102589 (= res!51305 (and (not (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1323 (ValueCell!989 V!3201) V!3201)

(declare-fun dynLambda!381 (Int (_ BitVec 64)) V!3201)

(assert (=> b!102589 (= lt!52117 (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!66817 () Bool)

(assert (=> b!102590 (= e!66819 (and tp!9803 tp_is_empty!2665 (array_inv!1257 (_keys!4256 newMap!16)) (array_inv!1258 (_values!2537 newMap!16)) e!66817))))

(declare-fun mapIsEmpty!3876 () Bool)

(assert (=> mapIsEmpty!3876 mapRes!3875))

(declare-fun b!102591 () Bool)

(assert (=> b!102591 (= e!66807 e!66823)))

(declare-fun res!51300 () Bool)

(assert (=> b!102591 (=> (not res!51300) (not e!66823))))

(declare-fun lt!52126 () ListLongMap!1521)

(assert (=> b!102591 (= res!51300 (= lt!52126 lt!52120))))

(declare-fun map!1274 (LongMapFixedSize!886) ListLongMap!1521)

(assert (=> b!102591 (= lt!52120 (map!1274 newMap!16))))

(declare-fun getCurrentListMap!464 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) ListLongMap!1521)

(assert (=> b!102591 (= lt!52126 (getCurrentListMap!464 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102592 () Bool)

(declare-fun e!66822 () Bool)

(assert (=> b!102592 (= e!66822 tp_is_empty!2665)))

(declare-fun b!102593 () Bool)

(declare-fun Unit!3121 () Unit!3118)

(assert (=> b!102593 (= e!66809 Unit!3121)))

(declare-fun lt!52125 () Unit!3118)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!96 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) (_ BitVec 32) Int) Unit!3118)

(assert (=> b!102593 (= lt!52125 (lemmaListMapContainsThenArrayContainsFrom!96 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102593 (arrayContainsKey!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52116 () Unit!3118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4303 (_ BitVec 32) (_ BitVec 32)) Unit!3118)

(assert (=> b!102593 (= lt!52116 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1588 0))(
  ( (Nil!1585) (Cons!1584 (h!2180 (_ BitVec 64)) (t!5630 List!1588)) )
))
(declare-fun arrayNoDuplicates!0 (array!4303 (_ BitVec 32) List!1588) Bool)

(assert (=> b!102593 (arrayNoDuplicates!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1585)))

(declare-fun lt!52122 () Unit!3118)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4303 (_ BitVec 32) (_ BitVec 64) List!1588) Unit!3118)

(assert (=> b!102593 (= lt!52122 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1584 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1585)))))

(assert (=> b!102593 false))

(declare-fun b!102594 () Bool)

(assert (=> b!102594 (= e!66808 tp_is_empty!2665)))

(declare-fun b!102595 () Bool)

(assert (=> b!102595 (= e!66817 (and e!66822 mapRes!3876))))

(declare-fun condMapEmpty!3875 () Bool)

(declare-fun mapDefault!3876 () ValueCell!989)

(assert (=> b!102595 (= condMapEmpty!3875 (= (arr!2043 (_values!2537 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3876)))))

(declare-fun b!102596 () Bool)

(declare-fun res!51301 () Bool)

(assert (=> b!102596 (=> (not res!51301) (not e!66807))))

(declare-fun valid!414 (LongMapFixedSize!886) Bool)

(assert (=> b!102596 (= res!51301 (valid!414 newMap!16))))

(declare-fun b!102597 () Bool)

(declare-fun e!66821 () Bool)

(assert (=> b!102597 (= e!66821 e!66810)))

(declare-fun b!102598 () Bool)

(assert (=> b!102598 (= e!66820 e!66821)))

(declare-fun b!102599 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102599 (= e!66815 (not (validMask!0 (mask!6687 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun lt!52118 () ListLongMap!1521)

(declare-fun lt!52115 () tuple2!2344)

(declare-fun lt!52123 () tuple2!2344)

(declare-fun +!134 (ListLongMap!1521 tuple2!2344) ListLongMap!1521)

(assert (=> b!102599 (= (+!134 (+!134 lt!52118 lt!52115) lt!52123) (+!134 (+!134 lt!52118 lt!52123) lt!52115))))

(assert (=> b!102599 (= lt!52123 (tuple2!2345 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> b!102599 (= lt!52115 (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117))))

(declare-fun lt!52124 () Unit!3118)

(declare-fun addCommutativeForDiffKeys!47 (ListLongMap!1521 (_ BitVec 64) V!3201 (_ BitVec 64) V!3201) Unit!3118)

(assert (=> b!102599 (= lt!52124 (addCommutativeForDiffKeys!47 lt!52118 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!101 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) ListLongMap!1521)

(assert (=> b!102599 (= lt!52118 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(assert (= (and start!12150 res!51302) b!102585))

(assert (= (and b!102585 res!51304) b!102596))

(assert (= (and b!102596 res!51301) b!102581))

(assert (= (and b!102581 res!51303) b!102591))

(assert (= (and b!102591 res!51300) b!102589))

(assert (= (and b!102589 res!51305) b!102587))

(assert (= (and b!102587 c!17638) b!102593))

(assert (= (and b!102587 (not c!17638)) b!102588))

(assert (= (and b!102587 res!51299) b!102599))

(assert (= (and b!102582 condMapEmpty!3876) mapIsEmpty!3876))

(assert (= (and b!102582 (not condMapEmpty!3876)) mapNonEmpty!3876))

(get-info :version)

(assert (= (and mapNonEmpty!3876 ((_ is ValueCellFull!989) mapValue!3875)) b!102583))

(assert (= (and b!102582 ((_ is ValueCellFull!989) mapDefault!3875)) b!102594))

(assert (= b!102584 b!102582))

(assert (= b!102597 b!102584))

(assert (= b!102598 b!102597))

(assert (= start!12150 b!102598))

(assert (= (and b!102595 condMapEmpty!3875) mapIsEmpty!3875))

(assert (= (and b!102595 (not condMapEmpty!3875)) mapNonEmpty!3875))

(assert (= (and mapNonEmpty!3875 ((_ is ValueCellFull!989) mapValue!3876)) b!102586))

(assert (= (and b!102595 ((_ is ValueCellFull!989) mapDefault!3876)) b!102592))

(assert (= b!102590 b!102595))

(assert (= start!12150 b!102590))

(declare-fun b_lambda!4593 () Bool)

(assert (=> (not b_lambda!4593) (not b!102589)))

(declare-fun t!5626 () Bool)

(declare-fun tb!2009 () Bool)

(assert (=> (and b!102584 (= (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))) t!5626) tb!2009))

(declare-fun result!3391 () Bool)

(assert (=> tb!2009 (= result!3391 tp_is_empty!2665)))

(assert (=> b!102589 t!5626))

(declare-fun b_and!6341 () Bool)

(assert (= b_and!6337 (and (=> t!5626 result!3391) b_and!6341)))

(declare-fun t!5628 () Bool)

(declare-fun tb!2011 () Bool)

(assert (=> (and b!102590 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))) t!5628) tb!2011))

(declare-fun result!3395 () Bool)

(assert (= result!3395 result!3391))

(assert (=> b!102589 t!5628))

(declare-fun b_and!6343 () Bool)

(assert (= b_and!6339 (and (=> t!5628 result!3395) b_and!6343)))

(declare-fun m!113519 () Bool)

(assert (=> start!12150 m!113519))

(declare-fun m!113521 () Bool)

(assert (=> b!102599 m!113521))

(declare-fun m!113523 () Bool)

(assert (=> b!102599 m!113523))

(declare-fun m!113525 () Bool)

(assert (=> b!102599 m!113525))

(assert (=> b!102599 m!113523))

(declare-fun m!113527 () Bool)

(assert (=> b!102599 m!113527))

(declare-fun m!113529 () Bool)

(assert (=> b!102599 m!113529))

(declare-fun m!113531 () Bool)

(assert (=> b!102599 m!113531))

(assert (=> b!102599 m!113531))

(declare-fun m!113533 () Bool)

(assert (=> b!102599 m!113533))

(assert (=> b!102599 m!113527))

(declare-fun m!113535 () Bool)

(assert (=> b!102599 m!113535))

(assert (=> b!102589 m!113523))

(declare-fun m!113537 () Bool)

(assert (=> b!102589 m!113537))

(declare-fun m!113539 () Bool)

(assert (=> b!102589 m!113539))

(assert (=> b!102589 m!113537))

(assert (=> b!102589 m!113539))

(declare-fun m!113541 () Bool)

(assert (=> b!102589 m!113541))

(declare-fun m!113543 () Bool)

(assert (=> b!102596 m!113543))

(declare-fun m!113545 () Bool)

(assert (=> b!102591 m!113545))

(declare-fun m!113547 () Bool)

(assert (=> b!102591 m!113547))

(declare-fun m!113549 () Bool)

(assert (=> b!102593 m!113549))

(declare-fun m!113551 () Bool)

(assert (=> b!102593 m!113551))

(assert (=> b!102593 m!113523))

(declare-fun m!113553 () Bool)

(assert (=> b!102593 m!113553))

(assert (=> b!102593 m!113523))

(assert (=> b!102593 m!113523))

(declare-fun m!113555 () Bool)

(assert (=> b!102593 m!113555))

(assert (=> b!102593 m!113523))

(declare-fun m!113557 () Bool)

(assert (=> b!102593 m!113557))

(declare-fun m!113559 () Bool)

(assert (=> b!102584 m!113559))

(declare-fun m!113561 () Bool)

(assert (=> b!102584 m!113561))

(declare-fun m!113563 () Bool)

(assert (=> b!102590 m!113563))

(declare-fun m!113565 () Bool)

(assert (=> b!102590 m!113565))

(declare-fun m!113567 () Bool)

(assert (=> mapNonEmpty!3876 m!113567))

(declare-fun m!113569 () Bool)

(assert (=> mapNonEmpty!3875 m!113569))

(assert (=> b!102587 m!113523))

(assert (=> b!102587 m!113523))

(declare-fun m!113571 () Bool)

(assert (=> b!102587 m!113571))

(assert (=> b!102587 m!113523))

(declare-fun m!113573 () Bool)

(assert (=> b!102587 m!113573))

(check-sat b_and!6343 (not b!102599) tp_is_empty!2665 (not b!102596) (not b!102589) (not b!102587) (not mapNonEmpty!3875) (not b_next!2497) (not b!102593) (not b!102584) (not b_next!2499) (not b_lambda!4593) (not mapNonEmpty!3876) (not b!102590) (not b!102591) b_and!6341 (not start!12150))
(check-sat b_and!6341 b_and!6343 (not b_next!2497) (not b_next!2499))
(get-model)

(declare-fun b_lambda!4599 () Bool)

(assert (= b_lambda!4593 (or (and b!102584 b_free!2497) (and b!102590 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))))) b_lambda!4599)))

(check-sat b_and!6343 (not b!102599) tp_is_empty!2665 (not b!102596) (not b!102589) (not b!102587) (not mapNonEmpty!3875) (not b_next!2497) (not b!102593) (not b!102584) (not b_next!2499) (not mapNonEmpty!3876) (not b!102590) (not b!102591) (not b_lambda!4599) b_and!6341 (not start!12150))
(check-sat b_and!6341 b_and!6343 (not b_next!2497) (not b_next!2499))
(get-model)

(declare-fun d!27705 () Bool)

(declare-fun e!66930 () Bool)

(assert (=> d!27705 e!66930))

(declare-fun res!51350 () Bool)

(assert (=> d!27705 (=> res!51350 e!66930)))

(declare-fun lt!52208 () Bool)

(assert (=> d!27705 (= res!51350 (not lt!52208))))

(declare-fun lt!52210 () Bool)

(assert (=> d!27705 (= lt!52208 lt!52210)))

(declare-fun lt!52209 () Unit!3118)

(declare-fun e!66931 () Unit!3118)

(assert (=> d!27705 (= lt!52209 e!66931)))

(declare-fun c!17647 () Bool)

(assert (=> d!27705 (= c!17647 lt!52210)))

(declare-fun containsKey!158 (List!1587 (_ BitVec 64)) Bool)

(assert (=> d!27705 (= lt!52210 (containsKey!158 (toList!776 lt!52120) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> d!27705 (= (contains!807 lt!52120 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)) lt!52208)))

(declare-fun b!102726 () Bool)

(declare-fun lt!52207 () Unit!3118)

(assert (=> b!102726 (= e!66931 lt!52207)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!106 (List!1587 (_ BitVec 64)) Unit!3118)

(assert (=> b!102726 (= lt!52207 (lemmaContainsKeyImpliesGetValueByKeyDefined!106 (toList!776 lt!52120) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-datatypes ((Option!161 0))(
  ( (Some!160 (v!2874 V!3201)) (None!159) )
))
(declare-fun isDefined!107 (Option!161) Bool)

(declare-fun getValueByKey!155 (List!1587 (_ BitVec 64)) Option!161)

(assert (=> b!102726 (isDefined!107 (getValueByKey!155 (toList!776 lt!52120) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102727 () Bool)

(declare-fun Unit!3128 () Unit!3118)

(assert (=> b!102727 (= e!66931 Unit!3128)))

(declare-fun b!102728 () Bool)

(assert (=> b!102728 (= e!66930 (isDefined!107 (getValueByKey!155 (toList!776 lt!52120) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355))))))

(assert (= (and d!27705 c!17647) b!102726))

(assert (= (and d!27705 (not c!17647)) b!102727))

(assert (= (and d!27705 (not res!51350)) b!102728))

(assert (=> d!27705 m!113523))

(declare-fun m!113687 () Bool)

(assert (=> d!27705 m!113687))

(assert (=> b!102726 m!113523))

(declare-fun m!113689 () Bool)

(assert (=> b!102726 m!113689))

(assert (=> b!102726 m!113523))

(declare-fun m!113691 () Bool)

(assert (=> b!102726 m!113691))

(assert (=> b!102726 m!113691))

(declare-fun m!113693 () Bool)

(assert (=> b!102726 m!113693))

(assert (=> b!102728 m!113523))

(assert (=> b!102728 m!113691))

(assert (=> b!102728 m!113691))

(assert (=> b!102728 m!113693))

(assert (=> b!102587 d!27705))

(declare-datatypes ((SeekEntryResult!251 0))(
  ( (MissingZero!251 (index!3151 (_ BitVec 32))) (Found!251 (index!3152 (_ BitVec 32))) (Intermediate!251 (undefined!1063 Bool) (index!3153 (_ BitVec 32)) (x!13452 (_ BitVec 32))) (Undefined!251) (MissingVacant!251 (index!3154 (_ BitVec 32))) )
))
(declare-fun lt!52268 () SeekEntryResult!251)

(declare-fun lt!52290 () SeekEntryResult!251)

(declare-fun lt!52266 () SeekEntryResult!251)

(declare-fun c!17674 () Bool)

(declare-fun c!17681 () Bool)

(declare-fun call!10700 () Bool)

(declare-fun lt!52269 () SeekEntryResult!251)

(declare-fun bm!10693 () Bool)

(declare-fun c!17680 () Bool)

(declare-fun c!17677 () Bool)

(declare-fun c!17682 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10693 (= call!10700 (inRange!0 (ite c!17677 (ite c!17680 (index!3152 lt!52269) (ite c!17681 (index!3151 lt!52268) (index!3154 lt!52268))) (ite c!17674 (index!3152 lt!52266) (ite c!17682 (index!3151 lt!52290) (index!3154 lt!52290)))) (mask!6687 newMap!16)))))

(declare-fun b!102809 () Bool)

(declare-fun e!66991 () Bool)

(declare-fun call!10716 () Bool)

(assert (=> b!102809 (= e!66991 (not call!10716))))

(declare-fun bm!10694 () Bool)

(declare-fun call!10719 () ListLongMap!1521)

(declare-fun call!10706 () ListLongMap!1521)

(assert (=> bm!10694 (= call!10719 call!10706)))

(declare-fun bm!10695 () Bool)

(declare-fun call!10704 () SeekEntryResult!251)

(declare-fun call!10703 () SeekEntryResult!251)

(assert (=> bm!10695 (= call!10704 call!10703)))

(declare-fun b!102810 () Bool)

(declare-fun res!51391 () Bool)

(declare-fun call!10697 () Bool)

(assert (=> b!102810 (= res!51391 call!10697)))

(declare-fun e!66993 () Bool)

(assert (=> b!102810 (=> (not res!51391) (not e!66993))))

(declare-fun bm!10696 () Bool)

(declare-fun call!10714 () Bool)

(declare-fun call!10709 () Bool)

(assert (=> bm!10696 (= call!10714 call!10709)))

(declare-fun b!102811 () Bool)

(declare-fun res!51390 () Bool)

(assert (=> b!102811 (= res!51390 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3154 lt!52290)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!102811 (=> (not res!51390) (not e!66991))))

(declare-fun bm!10697 () Bool)

(declare-fun call!10718 () ListLongMap!1521)

(declare-fun call!10707 () ListLongMap!1521)

(assert (=> bm!10697 (= call!10718 call!10707)))

(declare-fun e!66974 () ListLongMap!1521)

(declare-fun c!17675 () Bool)

(declare-fun b!102812 () Bool)

(declare-fun call!10708 () ListLongMap!1521)

(assert (=> b!102812 (= e!66974 (ite c!17675 call!10718 call!10708))))

(declare-fun b!102813 () Bool)

(declare-fun e!66980 () Bool)

(declare-fun e!66977 () Bool)

(assert (=> b!102813 (= e!66980 e!66977)))

(declare-fun call!10712 () ListLongMap!1521)

(declare-fun res!51382 () Bool)

(assert (=> b!102813 (= res!51382 (contains!807 call!10712 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> b!102813 (=> (not res!51382) (not e!66977))))

(declare-fun lt!52267 () SeekEntryResult!251)

(declare-fun call!10715 () ListLongMap!1521)

(declare-fun call!10696 () Bool)

(declare-fun bm!10698 () Bool)

(assert (=> bm!10698 (= call!10696 (contains!807 call!10715 (ite c!17677 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (select (arr!2042 (_keys!4256 newMap!16)) (index!3152 lt!52267)))))))

(declare-fun call!10705 () ListLongMap!1521)

(declare-fun bm!10699 () Bool)

(declare-fun c!17678 () Bool)

(declare-fun lt!52273 () array!4305)

(declare-fun lt!52279 () (_ BitVec 32))

(assert (=> bm!10699 (= call!10705 (getCurrentListMap!464 (_keys!4256 newMap!16) (ite (or c!17678 c!17677) (_values!2537 newMap!16) lt!52273) (mask!6687 newMap!16) (ite (and c!17678 c!17675) lt!52279 (extraKeys!2363 newMap!16)) (ite (and c!17678 c!17675) lt!52117 (zeroValue!2431 newMap!16)) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun b!102814 () Bool)

(declare-fun lt!52280 () Unit!3118)

(declare-fun lt!52287 () Unit!3118)

(assert (=> b!102814 (= lt!52280 lt!52287)))

(assert (=> b!102814 (= call!10719 call!10708)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!45 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 V!3201 Int) Unit!3118)

(assert (=> b!102814 (= lt!52287 (lemmaChangeZeroKeyThenAddPairToListMap!45 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) lt!52279 (zeroValue!2431 newMap!16) lt!52117 (minValue!2431 newMap!16) (defaultEntry!2554 newMap!16)))))

(assert (=> b!102814 (= lt!52279 (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!66983 () tuple2!2342)

(assert (=> b!102814 (= e!66983 (tuple2!2343 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6687 newMap!16) (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000001) lt!52117 (minValue!2431 newMap!16) (_size!492 newMap!16) (_keys!4256 newMap!16) (_values!2537 newMap!16) (_vacant!492 newMap!16))))))

(declare-fun b!102815 () Bool)

(declare-fun call!10701 () ListLongMap!1521)

(assert (=> b!102815 (= e!66980 (= call!10712 call!10701))))

(declare-fun b!102816 () Bool)

(declare-fun e!66990 () Bool)

(assert (=> b!102816 (= e!66990 e!66991)))

(declare-fun res!51385 () Bool)

(declare-fun call!10699 () Bool)

(assert (=> b!102816 (= res!51385 call!10699)))

(assert (=> b!102816 (=> (not res!51385) (not e!66991))))

(declare-fun b!102817 () Bool)

(declare-fun e!66988 () tuple2!2342)

(declare-fun e!66994 () tuple2!2342)

(assert (=> b!102817 (= e!66988 e!66994)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4303 (_ BitVec 32)) SeekEntryResult!251)

(assert (=> b!102817 (= lt!52267 (seekEntryOrOpen!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (_keys!4256 newMap!16) (mask!6687 newMap!16)))))

(assert (=> b!102817 (= c!17677 ((_ is Undefined!251) lt!52267))))

(declare-fun b!102818 () Bool)

(declare-fun lt!52289 () tuple2!2342)

(declare-fun call!10713 () tuple2!2342)

(assert (=> b!102818 (= lt!52289 call!10713)))

(declare-fun e!66979 () tuple2!2342)

(assert (=> b!102818 (= e!66979 (tuple2!2343 (_1!1182 lt!52289) (_2!1182 lt!52289)))))

(declare-fun bm!10700 () Bool)

(assert (=> bm!10700 (= call!10703 (seekEntryOrOpen!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (_keys!4256 newMap!16) (mask!6687 newMap!16)))))

(declare-fun bm!10701 () Bool)

(declare-fun lt!52288 () tuple2!2342)

(assert (=> bm!10701 (= call!10712 (map!1274 (_2!1182 lt!52288)))))

(declare-fun b!102819 () Bool)

(declare-fun e!66975 () Bool)

(declare-fun call!10717 () Bool)

(assert (=> b!102819 (= e!66975 (not call!10717))))

(declare-fun bm!10702 () Bool)

(declare-fun call!10710 () Bool)

(assert (=> bm!10702 (= call!10716 call!10710)))

(declare-fun bm!10703 () Bool)

(assert (=> bm!10703 (= call!10706 (+!134 e!66974 (ite c!17678 (ite c!17675 (tuple2!2345 #b0000000000000000000000000000000000000000000000000000000000000000 lt!52117) (tuple2!2345 #b1000000000000000000000000000000000000000000000000000000000000000 lt!52117)) (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117))))))

(declare-fun c!17686 () Bool)

(assert (=> bm!10703 (= c!17686 c!17678)))

(declare-fun call!10702 () Unit!3118)

(declare-fun bm!10704 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) Int) Unit!3118)

(assert (=> bm!10704 (= call!10702 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (defaultEntry!2554 newMap!16)))))

(declare-fun bm!10705 () Bool)

(assert (=> bm!10705 (= call!10701 (map!1274 newMap!16))))

(declare-fun bm!10706 () Bool)

(declare-fun lt!52272 () (_ BitVec 32))

(assert (=> bm!10706 (= call!10707 (getCurrentListMap!464 (_keys!4256 newMap!16) (ite c!17678 (_values!2537 newMap!16) (array!4306 (store (arr!2043 (_values!2537 newMap!16)) (index!3152 lt!52267) (ValueCellFull!989 lt!52117)) (size!2297 (_values!2537 newMap!16)))) (mask!6687 newMap!16) (ite c!17678 (ite c!17675 (extraKeys!2363 newMap!16) lt!52272) (extraKeys!2363 newMap!16)) (zeroValue!2431 newMap!16) (ite c!17678 (ite c!17675 (minValue!2431 newMap!16) lt!52117) (minValue!2431 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun bm!10707 () Bool)

(assert (=> bm!10707 (= call!10699 call!10697)))

(declare-fun bm!10708 () Bool)

(assert (=> bm!10708 (= call!10709 call!10700)))

(declare-fun b!102820 () Bool)

(declare-fun c!17679 () Bool)

(assert (=> b!102820 (= c!17679 ((_ is MissingVacant!251) lt!52267))))

(declare-fun e!66992 () tuple2!2342)

(assert (=> b!102820 (= e!66994 e!66992)))

(declare-fun b!102821 () Bool)

(declare-fun lt!52281 () Unit!3118)

(declare-fun e!66985 () Unit!3118)

(assert (=> b!102821 (= lt!52281 e!66985)))

(assert (=> b!102821 (= c!17680 call!10696)))

(assert (=> b!102821 (= e!66994 (tuple2!2343 false newMap!16))))

(declare-fun b!102822 () Bool)

(declare-fun Unit!3129 () Unit!3118)

(assert (=> b!102822 (= e!66985 Unit!3129)))

(declare-fun lt!52282 () Unit!3118)

(declare-fun call!10711 () Unit!3118)

(assert (=> b!102822 (= lt!52282 call!10711)))

(declare-fun call!10698 () SeekEntryResult!251)

(assert (=> b!102822 (= lt!52269 call!10698)))

(declare-fun res!51392 () Bool)

(assert (=> b!102822 (= res!51392 ((_ is Found!251) lt!52269))))

(declare-fun e!66976 () Bool)

(assert (=> b!102822 (=> (not res!51392) (not e!66976))))

(assert (=> b!102822 e!66976))

(declare-fun lt!52277 () Unit!3118)

(assert (=> b!102822 (= lt!52277 lt!52282)))

(assert (=> b!102822 false))

(declare-fun b!102823 () Bool)

(declare-fun c!17685 () Bool)

(assert (=> b!102823 (= c!17685 ((_ is MissingVacant!251) lt!52290))))

(declare-fun e!66981 () Bool)

(assert (=> b!102823 (= e!66981 e!66990)))

(declare-fun b!102824 () Bool)

(assert (=> b!102824 (= e!66977 (= call!10712 (+!134 call!10701 (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117))))))

(declare-fun bm!10709 () Bool)

(assert (=> bm!10709 (= call!10708 call!10705)))

(declare-fun b!102825 () Bool)

(declare-fun lt!52274 () Unit!3118)

(declare-fun lt!52271 () Unit!3118)

(assert (=> b!102825 (= lt!52274 lt!52271)))

(assert (=> b!102825 (= call!10719 call!10718)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 V!3201 Int) Unit!3118)

(assert (=> b!102825 (= lt!52271 (lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) lt!52272 (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) lt!52117 (defaultEntry!2554 newMap!16)))))

(assert (=> b!102825 (= lt!52272 (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!102825 (= e!66983 (tuple2!2343 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6687 newMap!16) (bvor (extraKeys!2363 newMap!16) #b00000000000000000000000000000010) (zeroValue!2431 newMap!16) lt!52117 (_size!492 newMap!16) (_keys!4256 newMap!16) (_values!2537 newMap!16) (_vacant!492 newMap!16))))))

(declare-fun bm!10710 () Bool)

(assert (=> bm!10710 (= call!10697 call!10700)))

(declare-fun b!102826 () Bool)

(declare-fun lt!52284 () Unit!3118)

(assert (=> b!102826 (= e!66985 lt!52284)))

(assert (=> b!102826 (= lt!52284 call!10702)))

(assert (=> b!102826 (= lt!52268 call!10698)))

(assert (=> b!102826 (= c!17681 ((_ is MissingZero!251) lt!52268))))

(declare-fun e!66984 () Bool)

(assert (=> b!102826 e!66984))

(declare-fun b!102827 () Bool)

(declare-fun e!66989 () Bool)

(assert (=> b!102827 (= e!66989 e!66975)))

(declare-fun res!51381 () Bool)

(assert (=> b!102827 (= res!51381 call!10714)))

(assert (=> b!102827 (=> (not res!51381) (not e!66975))))

(declare-fun b!102828 () Bool)

(declare-fun e!66986 () Unit!3118)

(declare-fun Unit!3130 () Unit!3118)

(assert (=> b!102828 (= e!66986 Unit!3130)))

(declare-fun lt!52291 () Unit!3118)

(assert (=> b!102828 (= lt!52291 call!10702)))

(assert (=> b!102828 (= lt!52290 call!10704)))

(assert (=> b!102828 (= c!17682 ((_ is MissingZero!251) lt!52290))))

(assert (=> b!102828 e!66981))

(declare-fun lt!52275 () Unit!3118)

(assert (=> b!102828 (= lt!52275 lt!52291)))

(assert (=> b!102828 false))

(declare-fun bm!10711 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) Int) Unit!3118)

(assert (=> bm!10711 (= call!10711 (lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (defaultEntry!2554 newMap!16)))))

(declare-fun bm!10712 () Bool)

(assert (=> bm!10712 (= call!10698 call!10703)))

(declare-fun b!102829 () Bool)

(assert (=> b!102829 (= e!66988 e!66983)))

(assert (=> b!102829 (= c!17675 (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10713 () Bool)

(assert (=> bm!10713 (= call!10715 call!10705)))

(declare-fun d!27707 () Bool)

(declare-fun e!66982 () Bool)

(assert (=> d!27707 e!66982))

(declare-fun res!51387 () Bool)

(assert (=> d!27707 (=> (not res!51387) (not e!66982))))

(assert (=> d!27707 (= res!51387 (valid!414 (_2!1182 lt!52288)))))

(assert (=> d!27707 (= lt!52288 e!66988)))

(assert (=> d!27707 (= c!17678 (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvneg (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355))))))

(assert (=> d!27707 (valid!414 newMap!16)))

(assert (=> d!27707 (= (update!156 newMap!16 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117) lt!52288)))

(declare-fun b!102830 () Bool)

(declare-fun res!51383 () Bool)

(assert (=> b!102830 (= res!51383 call!10709)))

(assert (=> b!102830 (=> (not res!51383) (not e!66976))))

(declare-fun b!102831 () Bool)

(assert (=> b!102831 (= e!66976 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3152 lt!52269)) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun bm!10714 () Bool)

(assert (=> bm!10714 (= call!10710 (arrayContainsKey!0 (_keys!4256 newMap!16) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!102832 () Bool)

(declare-fun res!51386 () Bool)

(declare-fun e!66987 () Bool)

(assert (=> b!102832 (=> (not res!51386) (not e!66987))))

(assert (=> b!102832 (= res!51386 call!10714)))

(assert (=> b!102832 (= e!66984 e!66987)))

(declare-fun b!102833 () Bool)

(declare-fun res!51388 () Bool)

(declare-fun e!66978 () Bool)

(assert (=> b!102833 (=> (not res!51388) (not e!66978))))

(assert (=> b!102833 (= res!51388 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3151 lt!52290)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102834 () Bool)

(assert (=> b!102834 (= e!66992 e!66979)))

(declare-fun c!17684 () Bool)

(assert (=> b!102834 (= c!17684 ((_ is MissingZero!251) lt!52267))))

(declare-fun b!102835 () Bool)

(declare-fun res!51384 () Bool)

(assert (=> b!102835 (=> (not res!51384) (not e!66978))))

(assert (=> b!102835 (= res!51384 call!10699)))

(assert (=> b!102835 (= e!66981 e!66978)))

(declare-fun b!102836 () Bool)

(assert (=> b!102836 (= e!66982 e!66980)))

(declare-fun c!17676 () Bool)

(assert (=> b!102836 (= c!17676 (_1!1182 lt!52288))))

(declare-fun b!102837 () Bool)

(declare-fun res!51379 () Bool)

(assert (=> b!102837 (=> (not res!51379) (not e!66987))))

(assert (=> b!102837 (= res!51379 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3151 lt!52268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102838 () Bool)

(declare-fun lt!52276 () tuple2!2342)

(assert (=> b!102838 (= e!66992 (tuple2!2343 (_1!1182 lt!52276) (_2!1182 lt!52276)))))

(assert (=> b!102838 (= lt!52276 call!10713)))

(declare-fun b!102839 () Bool)

(declare-fun lt!52285 () Unit!3118)

(declare-fun lt!52286 () Unit!3118)

(assert (=> b!102839 (= lt!52285 lt!52286)))

(assert (=> b!102839 call!10696))

(declare-fun lemmaValidKeyInArrayIsInListMap!105 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) Unit!3118)

(assert (=> b!102839 (= lt!52286 (lemmaValidKeyInArrayIsInListMap!105 (_keys!4256 newMap!16) lt!52273 (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (index!3152 lt!52267) (defaultEntry!2554 newMap!16)))))

(assert (=> b!102839 (= lt!52273 (array!4306 (store (arr!2043 (_values!2537 newMap!16)) (index!3152 lt!52267) (ValueCellFull!989 lt!52117)) (size!2297 (_values!2537 newMap!16))))))

(declare-fun lt!52278 () Unit!3118)

(declare-fun lt!52265 () Unit!3118)

(assert (=> b!102839 (= lt!52278 lt!52265)))

(assert (=> b!102839 (= call!10706 call!10707)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) (_ BitVec 64) V!3201 Int) Unit!3118)

(assert (=> b!102839 (= lt!52265 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (index!3152 lt!52267) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117 (defaultEntry!2554 newMap!16)))))

(declare-fun lt!52283 () Unit!3118)

(assert (=> b!102839 (= lt!52283 e!66986)))

(assert (=> b!102839 (= c!17674 (contains!807 (getCurrentListMap!464 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> b!102839 (= e!66979 (tuple2!2343 true (LongMapFixedSize!887 (defaultEntry!2554 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) (_size!492 newMap!16) (_keys!4256 newMap!16) (array!4306 (store (arr!2043 (_values!2537 newMap!16)) (index!3152 lt!52267) (ValueCellFull!989 lt!52117)) (size!2297 (_values!2537 newMap!16))) (_vacant!492 newMap!16))))))

(declare-fun b!102840 () Bool)

(assert (=> b!102840 (= e!66989 ((_ is Undefined!251) lt!52268))))

(declare-fun b!102841 () Bool)

(assert (=> b!102841 (= e!66974 (getCurrentListMap!464 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun b!102842 () Bool)

(declare-fun lt!52270 () Unit!3118)

(assert (=> b!102842 (= e!66986 lt!52270)))

(assert (=> b!102842 (= lt!52270 call!10711)))

(assert (=> b!102842 (= lt!52266 call!10704)))

(declare-fun res!51380 () Bool)

(assert (=> b!102842 (= res!51380 ((_ is Found!251) lt!52266))))

(assert (=> b!102842 (=> (not res!51380) (not e!66993))))

(assert (=> b!102842 e!66993))

(declare-fun b!102843 () Bool)

(assert (=> b!102843 (= e!66978 (not call!10716))))

(declare-fun b!102844 () Bool)

(assert (=> b!102844 (= e!66993 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3152 lt!52266)) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun bm!10715 () Bool)

(declare-fun updateHelperNewKey!45 (LongMapFixedSize!886 (_ BitVec 64) V!3201 (_ BitVec 32)) tuple2!2342)

(assert (=> bm!10715 (= call!10713 (updateHelperNewKey!45 newMap!16 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117 (ite c!17679 (index!3154 lt!52267) (index!3151 lt!52267))))))

(declare-fun b!102845 () Bool)

(declare-fun c!17683 () Bool)

(assert (=> b!102845 (= c!17683 ((_ is MissingVacant!251) lt!52268))))

(assert (=> b!102845 (= e!66984 e!66989)))

(declare-fun b!102846 () Bool)

(assert (=> b!102846 (= e!66987 (not call!10717))))

(declare-fun b!102847 () Bool)

(assert (=> b!102847 (= e!66990 ((_ is Undefined!251) lt!52290))))

(declare-fun b!102848 () Bool)

(declare-fun res!51389 () Bool)

(assert (=> b!102848 (= res!51389 (= (select (arr!2042 (_keys!4256 newMap!16)) (index!3154 lt!52268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!102848 (=> (not res!51389) (not e!66975))))

(declare-fun bm!10716 () Bool)

(assert (=> bm!10716 (= call!10717 call!10710)))

(assert (= (and d!27707 c!17678) b!102829))

(assert (= (and d!27707 (not c!17678)) b!102817))

(assert (= (and b!102829 c!17675) b!102814))

(assert (= (and b!102829 (not c!17675)) b!102825))

(assert (= (or b!102814 b!102825) bm!10709))

(assert (= (or b!102814 b!102825) bm!10697))

(assert (= (or b!102814 b!102825) bm!10694))

(assert (= (and b!102817 c!17677) b!102821))

(assert (= (and b!102817 (not c!17677)) b!102820))

(assert (= (and b!102821 c!17680) b!102822))

(assert (= (and b!102821 (not c!17680)) b!102826))

(assert (= (and b!102822 res!51392) b!102830))

(assert (= (and b!102830 res!51383) b!102831))

(assert (= (and b!102826 c!17681) b!102832))

(assert (= (and b!102826 (not c!17681)) b!102845))

(assert (= (and b!102832 res!51386) b!102837))

(assert (= (and b!102837 res!51379) b!102846))

(assert (= (and b!102845 c!17683) b!102827))

(assert (= (and b!102845 (not c!17683)) b!102840))

(assert (= (and b!102827 res!51381) b!102848))

(assert (= (and b!102848 res!51389) b!102819))

(assert (= (or b!102832 b!102827) bm!10696))

(assert (= (or b!102846 b!102819) bm!10716))

(assert (= (or b!102830 bm!10696) bm!10708))

(assert (= (or b!102822 b!102826) bm!10712))

(assert (= (and b!102820 c!17679) b!102838))

(assert (= (and b!102820 (not c!17679)) b!102834))

(assert (= (and b!102834 c!17684) b!102818))

(assert (= (and b!102834 (not c!17684)) b!102839))

(assert (= (and b!102839 c!17674) b!102842))

(assert (= (and b!102839 (not c!17674)) b!102828))

(assert (= (and b!102842 res!51380) b!102810))

(assert (= (and b!102810 res!51391) b!102844))

(assert (= (and b!102828 c!17682) b!102835))

(assert (= (and b!102828 (not c!17682)) b!102823))

(assert (= (and b!102835 res!51384) b!102833))

(assert (= (and b!102833 res!51388) b!102843))

(assert (= (and b!102823 c!17685) b!102816))

(assert (= (and b!102823 (not c!17685)) b!102847))

(assert (= (and b!102816 res!51385) b!102811))

(assert (= (and b!102811 res!51390) b!102809))

(assert (= (or b!102835 b!102816) bm!10707))

(assert (= (or b!102843 b!102809) bm!10702))

(assert (= (or b!102810 bm!10707) bm!10710))

(assert (= (or b!102842 b!102828) bm!10695))

(assert (= (or b!102838 b!102818) bm!10715))

(assert (= (or b!102826 b!102828) bm!10704))

(assert (= (or bm!10708 bm!10710) bm!10693))

(assert (= (or b!102822 b!102842) bm!10711))

(assert (= (or bm!10716 bm!10702) bm!10714))

(assert (= (or b!102821 b!102839) bm!10713))

(assert (= (or bm!10712 bm!10695) bm!10700))

(assert (= (or b!102821 b!102839) bm!10698))

(assert (= (or bm!10709 bm!10713) bm!10699))

(assert (= (or bm!10697 b!102839) bm!10706))

(assert (= (or bm!10694 b!102839) bm!10703))

(assert (= (and bm!10703 c!17686) b!102812))

(assert (= (and bm!10703 (not c!17686)) b!102841))

(assert (= (and d!27707 res!51387) b!102836))

(assert (= (and b!102836 c!17676) b!102813))

(assert (= (and b!102836 (not c!17676)) b!102815))

(assert (= (and b!102813 res!51382) b!102824))

(assert (= (or b!102824 b!102815) bm!10705))

(assert (= (or b!102813 b!102824 b!102815) bm!10701))

(declare-fun m!113695 () Bool)

(assert (=> d!27707 m!113695))

(assert (=> d!27707 m!113543))

(declare-fun m!113697 () Bool)

(assert (=> b!102841 m!113697))

(declare-fun m!113699 () Bool)

(assert (=> b!102814 m!113699))

(declare-fun m!113701 () Bool)

(assert (=> bm!10706 m!113701))

(declare-fun m!113703 () Bool)

(assert (=> bm!10706 m!113703))

(declare-fun m!113705 () Bool)

(assert (=> bm!10701 m!113705))

(assert (=> bm!10704 m!113523))

(declare-fun m!113707 () Bool)

(assert (=> bm!10704 m!113707))

(declare-fun m!113709 () Bool)

(assert (=> b!102831 m!113709))

(declare-fun m!113711 () Bool)

(assert (=> bm!10693 m!113711))

(assert (=> bm!10700 m!113523))

(declare-fun m!113713 () Bool)

(assert (=> bm!10700 m!113713))

(declare-fun m!113715 () Bool)

(assert (=> bm!10698 m!113715))

(declare-fun m!113717 () Bool)

(assert (=> bm!10698 m!113717))

(declare-fun m!113719 () Bool)

(assert (=> bm!10699 m!113719))

(declare-fun m!113721 () Bool)

(assert (=> b!102825 m!113721))

(assert (=> b!102817 m!113523))

(assert (=> b!102817 m!113713))

(assert (=> b!102813 m!113523))

(declare-fun m!113723 () Bool)

(assert (=> b!102813 m!113723))

(declare-fun m!113725 () Bool)

(assert (=> b!102824 m!113725))

(declare-fun m!113727 () Bool)

(assert (=> b!102837 m!113727))

(assert (=> b!102839 m!113697))

(assert (=> b!102839 m!113523))

(declare-fun m!113729 () Bool)

(assert (=> b!102839 m!113729))

(assert (=> b!102839 m!113523))

(declare-fun m!113731 () Bool)

(assert (=> b!102839 m!113731))

(assert (=> b!102839 m!113701))

(declare-fun m!113733 () Bool)

(assert (=> b!102839 m!113733))

(assert (=> b!102839 m!113697))

(declare-fun m!113735 () Bool)

(assert (=> b!102844 m!113735))

(assert (=> bm!10705 m!113545))

(declare-fun m!113737 () Bool)

(assert (=> b!102833 m!113737))

(declare-fun m!113739 () Bool)

(assert (=> bm!10703 m!113739))

(declare-fun m!113741 () Bool)

(assert (=> b!102848 m!113741))

(declare-fun m!113743 () Bool)

(assert (=> b!102811 m!113743))

(assert (=> bm!10711 m!113523))

(declare-fun m!113745 () Bool)

(assert (=> bm!10711 m!113745))

(assert (=> bm!10715 m!113523))

(declare-fun m!113747 () Bool)

(assert (=> bm!10715 m!113747))

(assert (=> bm!10714 m!113523))

(declare-fun m!113749 () Bool)

(assert (=> bm!10714 m!113749))

(assert (=> b!102587 d!27707))

(declare-fun d!27709 () Bool)

(assert (=> d!27709 (= (array_inv!1257 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvsge (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102584 d!27709))

(declare-fun d!27711 () Bool)

(assert (=> d!27711 (= (array_inv!1258 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (bvsge (size!2297 (_values!2537 (v!2868 (underlying!355 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102584 d!27711))

(declare-fun d!27713 () Bool)

(declare-fun res!51399 () Bool)

(declare-fun e!66997 () Bool)

(assert (=> d!27713 (=> (not res!51399) (not e!66997))))

(declare-fun simpleValid!72 (LongMapFixedSize!886) Bool)

(assert (=> d!27713 (= res!51399 (simpleValid!72 newMap!16))))

(assert (=> d!27713 (= (valid!414 newMap!16) e!66997)))

(declare-fun b!102855 () Bool)

(declare-fun res!51400 () Bool)

(assert (=> b!102855 (=> (not res!51400) (not e!66997))))

(declare-fun arrayCountValidKeys!0 (array!4303 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!102855 (= res!51400 (= (arrayCountValidKeys!0 (_keys!4256 newMap!16) #b00000000000000000000000000000000 (size!2296 (_keys!4256 newMap!16))) (_size!492 newMap!16)))))

(declare-fun b!102856 () Bool)

(declare-fun res!51401 () Bool)

(assert (=> b!102856 (=> (not res!51401) (not e!66997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4303 (_ BitVec 32)) Bool)

(assert (=> b!102856 (= res!51401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4256 newMap!16) (mask!6687 newMap!16)))))

(declare-fun b!102857 () Bool)

(assert (=> b!102857 (= e!66997 (arrayNoDuplicates!0 (_keys!4256 newMap!16) #b00000000000000000000000000000000 Nil!1585))))

(assert (= (and d!27713 res!51399) b!102855))

(assert (= (and b!102855 res!51400) b!102856))

(assert (= (and b!102856 res!51401) b!102857))

(declare-fun m!113751 () Bool)

(assert (=> d!27713 m!113751))

(declare-fun m!113753 () Bool)

(assert (=> b!102855 m!113753))

(declare-fun m!113755 () Bool)

(assert (=> b!102856 m!113755))

(declare-fun m!113757 () Bool)

(assert (=> b!102857 m!113757))

(assert (=> b!102596 d!27713))

(declare-fun d!27715 () Bool)

(assert (=> d!27715 (= (map!1274 newMap!16) (getCurrentListMap!464 (_keys!4256 newMap!16) (_values!2537 newMap!16) (mask!6687 newMap!16) (extraKeys!2363 newMap!16) (zeroValue!2431 newMap!16) (minValue!2431 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2554 newMap!16)))))

(declare-fun bs!4235 () Bool)

(assert (= bs!4235 d!27715))

(assert (=> bs!4235 m!113697))

(assert (=> b!102591 d!27715))

(declare-fun b!102900 () Bool)

(declare-fun res!51425 () Bool)

(declare-fun e!67028 () Bool)

(assert (=> b!102900 (=> (not res!51425) (not e!67028))))

(declare-fun e!67035 () Bool)

(assert (=> b!102900 (= res!51425 e!67035)))

(declare-fun res!51422 () Bool)

(assert (=> b!102900 (=> res!51422 e!67035)))

(declare-fun e!67032 () Bool)

(assert (=> b!102900 (= res!51422 (not e!67032))))

(declare-fun res!51423 () Bool)

(assert (=> b!102900 (=> (not res!51423) (not e!67032))))

(assert (=> b!102900 (= res!51423 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102901 () Bool)

(declare-fun e!67025 () ListLongMap!1521)

(declare-fun e!67026 () ListLongMap!1521)

(assert (=> b!102901 (= e!67025 e!67026)))

(declare-fun c!17703 () Bool)

(assert (=> b!102901 (= c!17703 (and (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102902 () Bool)

(declare-fun e!67029 () Bool)

(assert (=> b!102902 (= e!67028 e!67029)))

(declare-fun c!17702 () Bool)

(assert (=> b!102902 (= c!17702 (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10731 () Bool)

(declare-fun call!10738 () Bool)

(declare-fun lt!52357 () ListLongMap!1521)

(assert (=> bm!10731 (= call!10738 (contains!807 lt!52357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102903 () Bool)

(declare-fun e!67036 () Bool)

(declare-fun apply!96 (ListLongMap!1521 (_ BitVec 64)) V!3201)

(assert (=> b!102903 (= e!67036 (= (apply!96 lt!52357 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2431 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102904 () Bool)

(declare-fun e!67034 () Bool)

(assert (=> b!102904 (= e!67034 (= (apply!96 lt!52357 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun bm!10732 () Bool)

(declare-fun call!10734 () Bool)

(assert (=> bm!10732 (= call!10734 (contains!807 lt!52357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102905 () Bool)

(assert (=> b!102905 (= e!67029 e!67036)))

(declare-fun res!51420 () Bool)

(assert (=> b!102905 (= res!51420 call!10734)))

(assert (=> b!102905 (=> (not res!51420) (not e!67036))))

(declare-fun b!102906 () Bool)

(declare-fun call!10735 () ListLongMap!1521)

(assert (=> b!102906 (= e!67025 (+!134 call!10735 (tuple2!2345 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2431 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun bm!10733 () Bool)

(declare-fun call!10739 () ListLongMap!1521)

(declare-fun call!10737 () ListLongMap!1521)

(assert (=> bm!10733 (= call!10739 call!10737)))

(declare-fun b!102907 () Bool)

(declare-fun c!17701 () Bool)

(assert (=> b!102907 (= c!17701 (and (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!67033 () ListLongMap!1521)

(assert (=> b!102907 (= e!67026 e!67033)))

(declare-fun b!102908 () Bool)

(declare-fun e!67024 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!102908 (= e!67024 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!10734 () Bool)

(assert (=> bm!10734 (= call!10737 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102909 () Bool)

(declare-fun e!67031 () Bool)

(assert (=> b!102909 (= e!67035 e!67031)))

(declare-fun res!51428 () Bool)

(assert (=> b!102909 (=> (not res!51428) (not e!67031))))

(assert (=> b!102909 (= res!51428 (contains!807 lt!52357 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102909 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102910 () Bool)

(declare-fun e!67027 () Unit!3118)

(declare-fun lt!52338 () Unit!3118)

(assert (=> b!102910 (= e!67027 lt!52338)))

(declare-fun lt!52352 () ListLongMap!1521)

(assert (=> b!102910 (= lt!52352 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52339 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52356 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52356 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52340 () Unit!3118)

(declare-fun addStillContains!72 (ListLongMap!1521 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3118)

(assert (=> b!102910 (= lt!52340 (addStillContains!72 lt!52352 lt!52339 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) lt!52356))))

(assert (=> b!102910 (contains!807 (+!134 lt!52352 (tuple2!2345 lt!52339 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))))) lt!52356)))

(declare-fun lt!52342 () Unit!3118)

(assert (=> b!102910 (= lt!52342 lt!52340)))

(declare-fun lt!52336 () ListLongMap!1521)

(assert (=> b!102910 (= lt!52336 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52344 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52341 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52341 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52348 () Unit!3118)

(declare-fun addApplyDifferent!72 (ListLongMap!1521 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3118)

(assert (=> b!102910 (= lt!52348 (addApplyDifferent!72 lt!52336 lt!52344 (minValue!2431 (v!2868 (underlying!355 thiss!992))) lt!52341))))

(assert (=> b!102910 (= (apply!96 (+!134 lt!52336 (tuple2!2345 lt!52344 (minValue!2431 (v!2868 (underlying!355 thiss!992))))) lt!52341) (apply!96 lt!52336 lt!52341))))

(declare-fun lt!52354 () Unit!3118)

(assert (=> b!102910 (= lt!52354 lt!52348)))

(declare-fun lt!52346 () ListLongMap!1521)

(assert (=> b!102910 (= lt!52346 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52345 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52355 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52355 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52353 () Unit!3118)

(assert (=> b!102910 (= lt!52353 (addApplyDifferent!72 lt!52346 lt!52345 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) lt!52355))))

(assert (=> b!102910 (= (apply!96 (+!134 lt!52346 (tuple2!2345 lt!52345 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))))) lt!52355) (apply!96 lt!52346 lt!52355))))

(declare-fun lt!52347 () Unit!3118)

(assert (=> b!102910 (= lt!52347 lt!52353)))

(declare-fun lt!52351 () ListLongMap!1521)

(assert (=> b!102910 (= lt!52351 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52337 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52350 () (_ BitVec 64))

(assert (=> b!102910 (= lt!52350 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!102910 (= lt!52338 (addApplyDifferent!72 lt!52351 lt!52337 (minValue!2431 (v!2868 (underlying!355 thiss!992))) lt!52350))))

(assert (=> b!102910 (= (apply!96 (+!134 lt!52351 (tuple2!2345 lt!52337 (minValue!2431 (v!2868 (underlying!355 thiss!992))))) lt!52350) (apply!96 lt!52351 lt!52350))))

(declare-fun b!102911 () Bool)

(declare-fun call!10740 () ListLongMap!1521)

(assert (=> b!102911 (= e!67026 call!10740)))

(declare-fun b!102912 () Bool)

(assert (=> b!102912 (= e!67031 (= (apply!96 lt!52357 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2297 (_values!2537 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> b!102912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102913 () Bool)

(declare-fun res!51421 () Bool)

(assert (=> b!102913 (=> (not res!51421) (not e!67028))))

(declare-fun e!67030 () Bool)

(assert (=> b!102913 (= res!51421 e!67030)))

(declare-fun c!17700 () Bool)

(assert (=> b!102913 (= c!17700 (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!27717 () Bool)

(assert (=> d!27717 e!67028))

(declare-fun res!51426 () Bool)

(assert (=> d!27717 (=> (not res!51426) (not e!67028))))

(assert (=> d!27717 (= res!51426 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))))

(declare-fun lt!52349 () ListLongMap!1521)

(assert (=> d!27717 (= lt!52357 lt!52349)))

(declare-fun lt!52343 () Unit!3118)

(assert (=> d!27717 (= lt!52343 e!67027)))

(declare-fun c!17704 () Bool)

(assert (=> d!27717 (= c!17704 e!67024)))

(declare-fun res!51424 () Bool)

(assert (=> d!27717 (=> (not res!51424) (not e!67024))))

(assert (=> d!27717 (= res!51424 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27717 (= lt!52349 e!67025)))

(declare-fun c!17699 () Bool)

(assert (=> d!27717 (= c!17699 (and (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27717 (validMask!0 (mask!6687 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27717 (= (getCurrentListMap!464 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))) lt!52357)))

(declare-fun b!102914 () Bool)

(assert (=> b!102914 (= e!67032 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102915 () Bool)

(assert (=> b!102915 (= e!67033 call!10740)))

(declare-fun call!10736 () ListLongMap!1521)

(declare-fun bm!10735 () Bool)

(assert (=> bm!10735 (= call!10735 (+!134 (ite c!17699 call!10737 (ite c!17703 call!10739 call!10736)) (ite (or c!17699 c!17703) (tuple2!2345 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))) (tuple2!2345 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2431 (v!2868 (underlying!355 thiss!992)))))))))

(declare-fun b!102916 () Bool)

(assert (=> b!102916 (= e!67029 (not call!10734))))

(declare-fun bm!10736 () Bool)

(assert (=> bm!10736 (= call!10736 call!10739)))

(declare-fun bm!10737 () Bool)

(assert (=> bm!10737 (= call!10740 call!10735)))

(declare-fun b!102917 () Bool)

(assert (=> b!102917 (= e!67030 e!67034)))

(declare-fun res!51427 () Bool)

(assert (=> b!102917 (= res!51427 call!10738)))

(assert (=> b!102917 (=> (not res!51427) (not e!67034))))

(declare-fun b!102918 () Bool)

(assert (=> b!102918 (= e!67030 (not call!10738))))

(declare-fun b!102919 () Bool)

(declare-fun Unit!3131 () Unit!3118)

(assert (=> b!102919 (= e!67027 Unit!3131)))

(declare-fun b!102920 () Bool)

(assert (=> b!102920 (= e!67033 call!10736)))

(assert (= (and d!27717 c!17699) b!102906))

(assert (= (and d!27717 (not c!17699)) b!102901))

(assert (= (and b!102901 c!17703) b!102911))

(assert (= (and b!102901 (not c!17703)) b!102907))

(assert (= (and b!102907 c!17701) b!102915))

(assert (= (and b!102907 (not c!17701)) b!102920))

(assert (= (or b!102915 b!102920) bm!10736))

(assert (= (or b!102911 bm!10736) bm!10733))

(assert (= (or b!102911 b!102915) bm!10737))

(assert (= (or b!102906 bm!10733) bm!10734))

(assert (= (or b!102906 bm!10737) bm!10735))

(assert (= (and d!27717 res!51424) b!102908))

(assert (= (and d!27717 c!17704) b!102910))

(assert (= (and d!27717 (not c!17704)) b!102919))

(assert (= (and d!27717 res!51426) b!102900))

(assert (= (and b!102900 res!51423) b!102914))

(assert (= (and b!102900 (not res!51422)) b!102909))

(assert (= (and b!102909 res!51428) b!102912))

(assert (= (and b!102900 res!51425) b!102913))

(assert (= (and b!102913 c!17700) b!102917))

(assert (= (and b!102913 (not c!17700)) b!102918))

(assert (= (and b!102917 res!51427) b!102904))

(assert (= (or b!102917 b!102918) bm!10731))

(assert (= (and b!102913 res!51421) b!102902))

(assert (= (and b!102902 c!17702) b!102905))

(assert (= (and b!102902 (not c!17702)) b!102916))

(assert (= (and b!102905 res!51420) b!102903))

(assert (= (or b!102905 b!102916) bm!10732))

(declare-fun b_lambda!4601 () Bool)

(assert (=> (not b_lambda!4601) (not b!102912)))

(assert (=> b!102912 t!5626))

(declare-fun b_and!6361 () Bool)

(assert (= b_and!6341 (and (=> t!5626 result!3391) b_and!6361)))

(assert (=> b!102912 t!5628))

(declare-fun b_and!6363 () Bool)

(assert (= b_and!6343 (and (=> t!5628 result!3395) b_and!6363)))

(assert (=> d!27717 m!113521))

(declare-fun m!113759 () Bool)

(assert (=> b!102904 m!113759))

(declare-fun m!113761 () Bool)

(assert (=> b!102910 m!113761))

(declare-fun m!113763 () Bool)

(assert (=> b!102910 m!113763))

(declare-fun m!113765 () Bool)

(assert (=> b!102910 m!113765))

(declare-fun m!113767 () Bool)

(assert (=> b!102910 m!113767))

(declare-fun m!113769 () Bool)

(assert (=> b!102910 m!113769))

(declare-fun m!113771 () Bool)

(assert (=> b!102910 m!113771))

(declare-fun m!113773 () Bool)

(assert (=> b!102910 m!113773))

(declare-fun m!113775 () Bool)

(assert (=> b!102910 m!113775))

(assert (=> b!102910 m!113769))

(declare-fun m!113777 () Bool)

(assert (=> b!102910 m!113777))

(declare-fun m!113779 () Bool)

(assert (=> b!102910 m!113779))

(declare-fun m!113781 () Bool)

(assert (=> b!102910 m!113781))

(declare-fun m!113783 () Bool)

(assert (=> b!102910 m!113783))

(declare-fun m!113785 () Bool)

(assert (=> b!102910 m!113785))

(declare-fun m!113787 () Bool)

(assert (=> b!102910 m!113787))

(declare-fun m!113789 () Bool)

(assert (=> b!102910 m!113789))

(assert (=> b!102910 m!113763))

(assert (=> b!102910 m!113773))

(assert (=> b!102910 m!113535))

(declare-fun m!113791 () Bool)

(assert (=> b!102910 m!113791))

(assert (=> b!102910 m!113779))

(assert (=> bm!10734 m!113535))

(assert (=> b!102914 m!113789))

(assert (=> b!102914 m!113789))

(declare-fun m!113793 () Bool)

(assert (=> b!102914 m!113793))

(assert (=> b!102908 m!113789))

(assert (=> b!102908 m!113789))

(assert (=> b!102908 m!113793))

(declare-fun m!113795 () Bool)

(assert (=> b!102906 m!113795))

(assert (=> b!102912 m!113789))

(declare-fun m!113797 () Bool)

(assert (=> b!102912 m!113797))

(declare-fun m!113799 () Bool)

(assert (=> b!102912 m!113799))

(assert (=> b!102912 m!113539))

(declare-fun m!113801 () Bool)

(assert (=> b!102912 m!113801))

(assert (=> b!102912 m!113799))

(assert (=> b!102912 m!113789))

(assert (=> b!102912 m!113539))

(declare-fun m!113803 () Bool)

(assert (=> bm!10732 m!113803))

(declare-fun m!113805 () Bool)

(assert (=> b!102903 m!113805))

(declare-fun m!113807 () Bool)

(assert (=> bm!10731 m!113807))

(declare-fun m!113809 () Bool)

(assert (=> bm!10735 m!113809))

(assert (=> b!102909 m!113789))

(assert (=> b!102909 m!113789))

(declare-fun m!113811 () Bool)

(assert (=> b!102909 m!113811))

(assert (=> b!102591 d!27717))

(declare-fun d!27719 () Bool)

(assert (=> d!27719 (not (arrayContainsKey!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52360 () Unit!3118)

(declare-fun choose!68 (array!4303 (_ BitVec 32) (_ BitVec 64) List!1588) Unit!3118)

(assert (=> d!27719 (= lt!52360 (choose!68 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1584 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1585)))))

(assert (=> d!27719 (bvslt (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27719 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1584 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1585)) lt!52360)))

(declare-fun bs!4236 () Bool)

(assert (= bs!4236 d!27719))

(assert (=> bs!4236 m!113523))

(assert (=> bs!4236 m!113555))

(assert (=> bs!4236 m!113523))

(declare-fun m!113813 () Bool)

(assert (=> bs!4236 m!113813))

(assert (=> b!102593 d!27719))

(declare-fun d!27721 () Bool)

(assert (=> d!27721 (arrayNoDuplicates!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1585)))

(declare-fun lt!52363 () Unit!3118)

(declare-fun choose!39 (array!4303 (_ BitVec 32) (_ BitVec 32)) Unit!3118)

(assert (=> d!27721 (= lt!52363 (choose!39 (_keys!4256 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27721 (bvslt (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27721 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355) lt!52363)))

(declare-fun bs!4237 () Bool)

(assert (= bs!4237 d!27721))

(assert (=> bs!4237 m!113551))

(declare-fun m!113815 () Bool)

(assert (=> bs!4237 m!113815))

(assert (=> b!102593 d!27721))

(declare-fun d!27723 () Bool)

(declare-fun res!51433 () Bool)

(declare-fun e!67041 () Bool)

(assert (=> d!27723 (=> res!51433 e!67041)))

(assert (=> d!27723 (= res!51433 (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> d!27723 (= (arrayContainsKey!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!67041)))

(declare-fun b!102925 () Bool)

(declare-fun e!67042 () Bool)

(assert (=> b!102925 (= e!67041 e!67042)))

(declare-fun res!51434 () Bool)

(assert (=> b!102925 (=> (not res!51434) (not e!67042))))

(assert (=> b!102925 (= res!51434 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102926 () Bool)

(assert (=> b!102926 (= e!67042 (arrayContainsKey!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27723 (not res!51433)) b!102925))

(assert (= (and b!102925 res!51434) b!102926))

(assert (=> d!27723 m!113789))

(assert (=> b!102926 m!113523))

(declare-fun m!113817 () Bool)

(assert (=> b!102926 m!113817))

(assert (=> b!102593 d!27723))

(declare-fun d!27725 () Bool)

(declare-fun e!67045 () Bool)

(assert (=> d!27725 e!67045))

(declare-fun c!17707 () Bool)

(assert (=> d!27725 (= c!17707 (and (not (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52366 () Unit!3118)

(declare-fun choose!642 (array!4303 array!4305 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 64) (_ BitVec 32) Int) Unit!3118)

(assert (=> d!27725 (= lt!52366 (choose!642 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> d!27725 (validMask!0 (mask!6687 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27725 (= (lemmaListMapContainsThenArrayContainsFrom!96 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))) lt!52366)))

(declare-fun b!102931 () Bool)

(assert (=> b!102931 (= e!67045 (arrayContainsKey!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!102932 () Bool)

(assert (=> b!102932 (= e!67045 (ite (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27725 c!17707) b!102931))

(assert (= (and d!27725 (not c!17707)) b!102932))

(assert (=> d!27725 m!113523))

(declare-fun m!113819 () Bool)

(assert (=> d!27725 m!113819))

(assert (=> d!27725 m!113521))

(assert (=> b!102931 m!113523))

(assert (=> b!102931 m!113555))

(assert (=> b!102593 d!27725))

(declare-fun d!27727 () Bool)

(declare-fun res!51443 () Bool)

(declare-fun e!67054 () Bool)

(assert (=> d!27727 (=> res!51443 e!67054)))

(assert (=> d!27727 (= res!51443 (bvsge from!355 (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27727 (= (arrayNoDuplicates!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1585) e!67054)))

(declare-fun b!102943 () Bool)

(declare-fun e!67057 () Bool)

(declare-fun e!67055 () Bool)

(assert (=> b!102943 (= e!67057 e!67055)))

(declare-fun c!17710 () Bool)

(assert (=> b!102943 (= c!17710 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102944 () Bool)

(declare-fun call!10743 () Bool)

(assert (=> b!102944 (= e!67055 call!10743)))

(declare-fun bm!10740 () Bool)

(assert (=> bm!10740 (= call!10743 (arrayNoDuplicates!0 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17710 (Cons!1584 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1585) Nil!1585)))))

(declare-fun b!102945 () Bool)

(assert (=> b!102945 (= e!67054 e!67057)))

(declare-fun res!51442 () Bool)

(assert (=> b!102945 (=> (not res!51442) (not e!67057))))

(declare-fun e!67056 () Bool)

(assert (=> b!102945 (= res!51442 (not e!67056))))

(declare-fun res!51441 () Bool)

(assert (=> b!102945 (=> (not res!51441) (not e!67056))))

(assert (=> b!102945 (= res!51441 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102946 () Bool)

(declare-fun contains!809 (List!1588 (_ BitVec 64)) Bool)

(assert (=> b!102946 (= e!67056 (contains!809 Nil!1585 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102947 () Bool)

(assert (=> b!102947 (= e!67055 call!10743)))

(assert (= (and d!27727 (not res!51443)) b!102945))

(assert (= (and b!102945 res!51441) b!102946))

(assert (= (and b!102945 res!51442) b!102943))

(assert (= (and b!102943 c!17710) b!102947))

(assert (= (and b!102943 (not c!17710)) b!102944))

(assert (= (or b!102947 b!102944) bm!10740))

(assert (=> b!102943 m!113523))

(assert (=> b!102943 m!113523))

(declare-fun m!113821 () Bool)

(assert (=> b!102943 m!113821))

(assert (=> bm!10740 m!113523))

(declare-fun m!113823 () Bool)

(assert (=> bm!10740 m!113823))

(assert (=> b!102945 m!113523))

(assert (=> b!102945 m!113523))

(assert (=> b!102945 m!113821))

(assert (=> b!102946 m!113523))

(assert (=> b!102946 m!113523))

(declare-fun m!113825 () Bool)

(assert (=> b!102946 m!113825))

(assert (=> b!102593 d!27727))

(declare-fun d!27729 () Bool)

(assert (=> d!27729 (= (valid!413 thiss!992) (valid!414 (v!2868 (underlying!355 thiss!992))))))

(declare-fun bs!4238 () Bool)

(assert (= bs!4238 d!27729))

(declare-fun m!113827 () Bool)

(assert (=> bs!4238 m!113827))

(assert (=> start!12150 d!27729))

(declare-fun d!27731 () Bool)

(assert (=> d!27731 (= (array_inv!1257 (_keys!4256 newMap!16)) (bvsge (size!2296 (_keys!4256 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102590 d!27731))

(declare-fun d!27733 () Bool)

(assert (=> d!27733 (= (array_inv!1258 (_values!2537 newMap!16)) (bvsge (size!2297 (_values!2537 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102590 d!27733))

(declare-fun d!27735 () Bool)

(declare-fun c!17713 () Bool)

(assert (=> d!27735 (= c!17713 ((_ is ValueCellFull!989) (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun e!67060 () V!3201)

(assert (=> d!27735 (= (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!67060)))

(declare-fun b!102952 () Bool)

(declare-fun get!1324 (ValueCell!989 V!3201) V!3201)

(assert (=> b!102952 (= e!67060 (get!1324 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102953 () Bool)

(declare-fun get!1325 (ValueCell!989 V!3201) V!3201)

(assert (=> b!102953 (= e!67060 (get!1325 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27735 c!17713) b!102952))

(assert (= (and d!27735 (not c!17713)) b!102953))

(assert (=> b!102952 m!113537))

(assert (=> b!102952 m!113539))

(declare-fun m!113829 () Bool)

(assert (=> b!102952 m!113829))

(assert (=> b!102953 m!113537))

(assert (=> b!102953 m!113539))

(declare-fun m!113831 () Bool)

(assert (=> b!102953 m!113831))

(assert (=> b!102589 d!27735))

(declare-fun d!27737 () Bool)

(declare-fun e!67063 () Bool)

(assert (=> d!27737 e!67063))

(declare-fun res!51449 () Bool)

(assert (=> d!27737 (=> (not res!51449) (not e!67063))))

(declare-fun lt!52378 () ListLongMap!1521)

(assert (=> d!27737 (= res!51449 (contains!807 lt!52378 (_1!1183 lt!52115)))))

(declare-fun lt!52376 () List!1587)

(assert (=> d!27737 (= lt!52378 (ListLongMap!1522 lt!52376))))

(declare-fun lt!52377 () Unit!3118)

(declare-fun lt!52375 () Unit!3118)

(assert (=> d!27737 (= lt!52377 lt!52375)))

(assert (=> d!27737 (= (getValueByKey!155 lt!52376 (_1!1183 lt!52115)) (Some!160 (_2!1183 lt!52115)))))

(declare-fun lemmaContainsTupThenGetReturnValue!71 (List!1587 (_ BitVec 64) V!3201) Unit!3118)

(assert (=> d!27737 (= lt!52375 (lemmaContainsTupThenGetReturnValue!71 lt!52376 (_1!1183 lt!52115) (_2!1183 lt!52115)))))

(declare-fun insertStrictlySorted!74 (List!1587 (_ BitVec 64) V!3201) List!1587)

(assert (=> d!27737 (= lt!52376 (insertStrictlySorted!74 (toList!776 (+!134 lt!52118 lt!52123)) (_1!1183 lt!52115) (_2!1183 lt!52115)))))

(assert (=> d!27737 (= (+!134 (+!134 lt!52118 lt!52123) lt!52115) lt!52378)))

(declare-fun b!102958 () Bool)

(declare-fun res!51448 () Bool)

(assert (=> b!102958 (=> (not res!51448) (not e!67063))))

(assert (=> b!102958 (= res!51448 (= (getValueByKey!155 (toList!776 lt!52378) (_1!1183 lt!52115)) (Some!160 (_2!1183 lt!52115))))))

(declare-fun b!102959 () Bool)

(declare-fun contains!810 (List!1587 tuple2!2344) Bool)

(assert (=> b!102959 (= e!67063 (contains!810 (toList!776 lt!52378) lt!52115))))

(assert (= (and d!27737 res!51449) b!102958))

(assert (= (and b!102958 res!51448) b!102959))

(declare-fun m!113833 () Bool)

(assert (=> d!27737 m!113833))

(declare-fun m!113835 () Bool)

(assert (=> d!27737 m!113835))

(declare-fun m!113837 () Bool)

(assert (=> d!27737 m!113837))

(declare-fun m!113839 () Bool)

(assert (=> d!27737 m!113839))

(declare-fun m!113841 () Bool)

(assert (=> b!102958 m!113841))

(declare-fun m!113843 () Bool)

(assert (=> b!102959 m!113843))

(assert (=> b!102599 d!27737))

(declare-fun b!102984 () Bool)

(declare-fun res!51460 () Bool)

(declare-fun e!67083 () Bool)

(assert (=> b!102984 (=> (not res!51460) (not e!67083))))

(declare-fun lt!52394 () ListLongMap!1521)

(assert (=> b!102984 (= res!51460 (not (contains!807 lt!52394 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102985 () Bool)

(declare-fun e!67082 () Bool)

(declare-fun e!67084 () Bool)

(assert (=> b!102985 (= e!67082 e!67084)))

(declare-fun c!17723 () Bool)

(assert (=> b!102985 (= c!17723 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun bm!10743 () Bool)

(declare-fun call!10746 () ListLongMap!1521)

(assert (=> bm!10743 (= call!10746 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102986 () Bool)

(declare-fun e!67081 () ListLongMap!1521)

(declare-fun e!67080 () ListLongMap!1521)

(assert (=> b!102986 (= e!67081 e!67080)))

(declare-fun c!17722 () Bool)

(assert (=> b!102986 (= c!17722 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102987 () Bool)

(assert (=> b!102987 (= e!67084 (= lt!52394 (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102988 () Bool)

(assert (=> b!102988 (= e!67081 (ListLongMap!1522 Nil!1584))))

(declare-fun d!27739 () Bool)

(assert (=> d!27739 e!67083))

(declare-fun res!51458 () Bool)

(assert (=> d!27739 (=> (not res!51458) (not e!67083))))

(assert (=> d!27739 (= res!51458 (not (contains!807 lt!52394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27739 (= lt!52394 e!67081)))

(declare-fun c!17724 () Bool)

(assert (=> d!27739 (= c!17724 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27739 (validMask!0 (mask!6687 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27739 (= (getCurrentListMapNoExtraKeys!101 (_keys!4256 (v!2868 (underlying!355 thiss!992))) (_values!2537 (v!2868 (underlying!355 thiss!992))) (mask!6687 (v!2868 (underlying!355 thiss!992))) (extraKeys!2363 (v!2868 (underlying!355 thiss!992))) (zeroValue!2431 (v!2868 (underlying!355 thiss!992))) (minValue!2431 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992)))) lt!52394)))

(declare-fun b!102989 () Bool)

(declare-fun e!67079 () Bool)

(assert (=> b!102989 (= e!67082 e!67079)))

(assert (=> b!102989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun res!51459 () Bool)

(assert (=> b!102989 (= res!51459 (contains!807 lt!52394 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102989 (=> (not res!51459) (not e!67079))))

(declare-fun b!102990 () Bool)

(assert (=> b!102990 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> b!102990 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2297 (_values!2537 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> b!102990 (= e!67079 (= (apply!96 lt!52394 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102991 () Bool)

(declare-fun lt!52399 () Unit!3118)

(declare-fun lt!52396 () Unit!3118)

(assert (=> b!102991 (= lt!52399 lt!52396)))

(declare-fun lt!52395 () ListLongMap!1521)

(declare-fun lt!52393 () (_ BitVec 64))

(declare-fun lt!52397 () V!3201)

(declare-fun lt!52398 () (_ BitVec 64))

(assert (=> b!102991 (not (contains!807 (+!134 lt!52395 (tuple2!2345 lt!52393 lt!52397)) lt!52398))))

(declare-fun addStillNotContains!46 (ListLongMap!1521 (_ BitVec 64) V!3201 (_ BitVec 64)) Unit!3118)

(assert (=> b!102991 (= lt!52396 (addStillNotContains!46 lt!52395 lt!52393 lt!52397 lt!52398))))

(assert (=> b!102991 (= lt!52398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!102991 (= lt!52397 (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102991 (= lt!52393 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!102991 (= lt!52395 call!10746)))

(assert (=> b!102991 (= e!67080 (+!134 call!10746 (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1323 (select (arr!2043 (_values!2537 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!102992 () Bool)

(assert (=> b!102992 (= e!67080 call!10746)))

(declare-fun b!102993 () Bool)

(declare-fun e!67078 () Bool)

(assert (=> b!102993 (= e!67078 (validKeyInArray!0 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102993 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!102994 () Bool)

(declare-fun isEmpty!372 (ListLongMap!1521) Bool)

(assert (=> b!102994 (= e!67084 (isEmpty!372 lt!52394))))

(declare-fun b!102995 () Bool)

(assert (=> b!102995 (= e!67083 e!67082)))

(declare-fun c!17725 () Bool)

(assert (=> b!102995 (= c!17725 e!67078)))

(declare-fun res!51461 () Bool)

(assert (=> b!102995 (=> (not res!51461) (not e!67078))))

(assert (=> b!102995 (= res!51461 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2296 (_keys!4256 (v!2868 (underlying!355 thiss!992))))))))

(assert (= (and d!27739 c!17724) b!102988))

(assert (= (and d!27739 (not c!17724)) b!102986))

(assert (= (and b!102986 c!17722) b!102991))

(assert (= (and b!102986 (not c!17722)) b!102992))

(assert (= (or b!102991 b!102992) bm!10743))

(assert (= (and d!27739 res!51458) b!102984))

(assert (= (and b!102984 res!51460) b!102995))

(assert (= (and b!102995 res!51461) b!102993))

(assert (= (and b!102995 c!17725) b!102989))

(assert (= (and b!102995 (not c!17725)) b!102985))

(assert (= (and b!102989 res!51459) b!102990))

(assert (= (and b!102985 c!17723) b!102987))

(assert (= (and b!102985 (not c!17723)) b!102994))

(declare-fun b_lambda!4603 () Bool)

(assert (=> (not b_lambda!4603) (not b!102990)))

(assert (=> b!102990 t!5626))

(declare-fun b_and!6365 () Bool)

(assert (= b_and!6361 (and (=> t!5626 result!3391) b_and!6365)))

(assert (=> b!102990 t!5628))

(declare-fun b_and!6367 () Bool)

(assert (= b_and!6363 (and (=> t!5628 result!3395) b_and!6367)))

(declare-fun b_lambda!4605 () Bool)

(assert (=> (not b_lambda!4605) (not b!102991)))

(assert (=> b!102991 t!5626))

(declare-fun b_and!6369 () Bool)

(assert (= b_and!6365 (and (=> t!5626 result!3391) b_and!6369)))

(assert (=> b!102991 t!5628))

(declare-fun b_and!6371 () Bool)

(assert (= b_and!6367 (and (=> t!5628 result!3395) b_and!6371)))

(declare-fun m!113845 () Bool)

(assert (=> b!102984 m!113845))

(assert (=> b!102991 m!113789))

(assert (=> b!102991 m!113799))

(assert (=> b!102991 m!113539))

(assert (=> b!102991 m!113801))

(declare-fun m!113847 () Bool)

(assert (=> b!102991 m!113847))

(declare-fun m!113849 () Bool)

(assert (=> b!102991 m!113849))

(declare-fun m!113851 () Bool)

(assert (=> b!102991 m!113851))

(assert (=> b!102991 m!113847))

(assert (=> b!102991 m!113539))

(declare-fun m!113853 () Bool)

(assert (=> b!102991 m!113853))

(assert (=> b!102991 m!113799))

(declare-fun m!113855 () Bool)

(assert (=> b!102994 m!113855))

(assert (=> b!102989 m!113789))

(assert (=> b!102989 m!113789))

(declare-fun m!113857 () Bool)

(assert (=> b!102989 m!113857))

(assert (=> b!102993 m!113789))

(assert (=> b!102993 m!113789))

(assert (=> b!102993 m!113793))

(assert (=> b!102990 m!113789))

(assert (=> b!102990 m!113799))

(assert (=> b!102990 m!113539))

(assert (=> b!102990 m!113801))

(assert (=> b!102990 m!113789))

(declare-fun m!113859 () Bool)

(assert (=> b!102990 m!113859))

(assert (=> b!102990 m!113799))

(assert (=> b!102990 m!113539))

(declare-fun m!113861 () Bool)

(assert (=> d!27739 m!113861))

(assert (=> d!27739 m!113521))

(declare-fun m!113863 () Bool)

(assert (=> b!102987 m!113863))

(assert (=> b!102986 m!113789))

(assert (=> b!102986 m!113789))

(assert (=> b!102986 m!113793))

(assert (=> bm!10743 m!113863))

(assert (=> b!102599 d!27739))

(declare-fun d!27741 () Bool)

(assert (=> d!27741 (= (+!134 (+!134 lt!52118 (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117)) (tuple2!2345 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))))) (+!134 (+!134 lt!52118 (tuple2!2345 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992))))) (tuple2!2345 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117)))))

(declare-fun lt!52402 () Unit!3118)

(declare-fun choose!643 (ListLongMap!1521 (_ BitVec 64) V!3201 (_ BitVec 64) V!3201) Unit!3118)

(assert (=> d!27741 (= lt!52402 (choose!643 lt!52118 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> d!27741 (not (= (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27741 (= (addCommutativeForDiffKeys!47 lt!52118 (select (arr!2042 (_keys!4256 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52117 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2431 (v!2868 (underlying!355 thiss!992)))) lt!52402)))

(declare-fun bs!4239 () Bool)

(assert (= bs!4239 d!27741))

(assert (=> bs!4239 m!113523))

(declare-fun m!113865 () Bool)

(assert (=> bs!4239 m!113865))

(declare-fun m!113867 () Bool)

(assert (=> bs!4239 m!113867))

(declare-fun m!113869 () Bool)

(assert (=> bs!4239 m!113869))

(declare-fun m!113871 () Bool)

(assert (=> bs!4239 m!113871))

(declare-fun m!113873 () Bool)

(assert (=> bs!4239 m!113873))

(assert (=> bs!4239 m!113867))

(assert (=> bs!4239 m!113871))

(assert (=> b!102599 d!27741))

(declare-fun d!27743 () Bool)

(declare-fun e!67085 () Bool)

(assert (=> d!27743 e!67085))

(declare-fun res!51463 () Bool)

(assert (=> d!27743 (=> (not res!51463) (not e!67085))))

(declare-fun lt!52406 () ListLongMap!1521)

(assert (=> d!27743 (= res!51463 (contains!807 lt!52406 (_1!1183 lt!52123)))))

(declare-fun lt!52404 () List!1587)

(assert (=> d!27743 (= lt!52406 (ListLongMap!1522 lt!52404))))

(declare-fun lt!52405 () Unit!3118)

(declare-fun lt!52403 () Unit!3118)

(assert (=> d!27743 (= lt!52405 lt!52403)))

(assert (=> d!27743 (= (getValueByKey!155 lt!52404 (_1!1183 lt!52123)) (Some!160 (_2!1183 lt!52123)))))

(assert (=> d!27743 (= lt!52403 (lemmaContainsTupThenGetReturnValue!71 lt!52404 (_1!1183 lt!52123) (_2!1183 lt!52123)))))

(assert (=> d!27743 (= lt!52404 (insertStrictlySorted!74 (toList!776 lt!52118) (_1!1183 lt!52123) (_2!1183 lt!52123)))))

(assert (=> d!27743 (= (+!134 lt!52118 lt!52123) lt!52406)))

(declare-fun b!102996 () Bool)

(declare-fun res!51462 () Bool)

(assert (=> b!102996 (=> (not res!51462) (not e!67085))))

(assert (=> b!102996 (= res!51462 (= (getValueByKey!155 (toList!776 lt!52406) (_1!1183 lt!52123)) (Some!160 (_2!1183 lt!52123))))))

(declare-fun b!102997 () Bool)

(assert (=> b!102997 (= e!67085 (contains!810 (toList!776 lt!52406) lt!52123))))

(assert (= (and d!27743 res!51463) b!102996))

(assert (= (and b!102996 res!51462) b!102997))

(declare-fun m!113875 () Bool)

(assert (=> d!27743 m!113875))

(declare-fun m!113877 () Bool)

(assert (=> d!27743 m!113877))

(declare-fun m!113879 () Bool)

(assert (=> d!27743 m!113879))

(declare-fun m!113881 () Bool)

(assert (=> d!27743 m!113881))

(declare-fun m!113883 () Bool)

(assert (=> b!102996 m!113883))

(declare-fun m!113885 () Bool)

(assert (=> b!102997 m!113885))

(assert (=> b!102599 d!27743))

(declare-fun d!27745 () Bool)

(declare-fun e!67086 () Bool)

(assert (=> d!27745 e!67086))

(declare-fun res!51465 () Bool)

(assert (=> d!27745 (=> (not res!51465) (not e!67086))))

(declare-fun lt!52410 () ListLongMap!1521)

(assert (=> d!27745 (= res!51465 (contains!807 lt!52410 (_1!1183 lt!52123)))))

(declare-fun lt!52408 () List!1587)

(assert (=> d!27745 (= lt!52410 (ListLongMap!1522 lt!52408))))

(declare-fun lt!52409 () Unit!3118)

(declare-fun lt!52407 () Unit!3118)

(assert (=> d!27745 (= lt!52409 lt!52407)))

(assert (=> d!27745 (= (getValueByKey!155 lt!52408 (_1!1183 lt!52123)) (Some!160 (_2!1183 lt!52123)))))

(assert (=> d!27745 (= lt!52407 (lemmaContainsTupThenGetReturnValue!71 lt!52408 (_1!1183 lt!52123) (_2!1183 lt!52123)))))

(assert (=> d!27745 (= lt!52408 (insertStrictlySorted!74 (toList!776 (+!134 lt!52118 lt!52115)) (_1!1183 lt!52123) (_2!1183 lt!52123)))))

(assert (=> d!27745 (= (+!134 (+!134 lt!52118 lt!52115) lt!52123) lt!52410)))

(declare-fun b!102998 () Bool)

(declare-fun res!51464 () Bool)

(assert (=> b!102998 (=> (not res!51464) (not e!67086))))

(assert (=> b!102998 (= res!51464 (= (getValueByKey!155 (toList!776 lt!52410) (_1!1183 lt!52123)) (Some!160 (_2!1183 lt!52123))))))

(declare-fun b!102999 () Bool)

(assert (=> b!102999 (= e!67086 (contains!810 (toList!776 lt!52410) lt!52123))))

(assert (= (and d!27745 res!51465) b!102998))

(assert (= (and b!102998 res!51464) b!102999))

(declare-fun m!113887 () Bool)

(assert (=> d!27745 m!113887))

(declare-fun m!113889 () Bool)

(assert (=> d!27745 m!113889))

(declare-fun m!113891 () Bool)

(assert (=> d!27745 m!113891))

(declare-fun m!113893 () Bool)

(assert (=> d!27745 m!113893))

(declare-fun m!113895 () Bool)

(assert (=> b!102998 m!113895))

(declare-fun m!113897 () Bool)

(assert (=> b!102999 m!113897))

(assert (=> b!102599 d!27745))

(declare-fun d!27747 () Bool)

(declare-fun e!67087 () Bool)

(assert (=> d!27747 e!67087))

(declare-fun res!51467 () Bool)

(assert (=> d!27747 (=> (not res!51467) (not e!67087))))

(declare-fun lt!52414 () ListLongMap!1521)

(assert (=> d!27747 (= res!51467 (contains!807 lt!52414 (_1!1183 lt!52115)))))

(declare-fun lt!52412 () List!1587)

(assert (=> d!27747 (= lt!52414 (ListLongMap!1522 lt!52412))))

(declare-fun lt!52413 () Unit!3118)

(declare-fun lt!52411 () Unit!3118)

(assert (=> d!27747 (= lt!52413 lt!52411)))

(assert (=> d!27747 (= (getValueByKey!155 lt!52412 (_1!1183 lt!52115)) (Some!160 (_2!1183 lt!52115)))))

(assert (=> d!27747 (= lt!52411 (lemmaContainsTupThenGetReturnValue!71 lt!52412 (_1!1183 lt!52115) (_2!1183 lt!52115)))))

(assert (=> d!27747 (= lt!52412 (insertStrictlySorted!74 (toList!776 lt!52118) (_1!1183 lt!52115) (_2!1183 lt!52115)))))

(assert (=> d!27747 (= (+!134 lt!52118 lt!52115) lt!52414)))

(declare-fun b!103000 () Bool)

(declare-fun res!51466 () Bool)

(assert (=> b!103000 (=> (not res!51466) (not e!67087))))

(assert (=> b!103000 (= res!51466 (= (getValueByKey!155 (toList!776 lt!52414) (_1!1183 lt!52115)) (Some!160 (_2!1183 lt!52115))))))

(declare-fun b!103001 () Bool)

(assert (=> b!103001 (= e!67087 (contains!810 (toList!776 lt!52414) lt!52115))))

(assert (= (and d!27747 res!51467) b!103000))

(assert (= (and b!103000 res!51466) b!103001))

(declare-fun m!113899 () Bool)

(assert (=> d!27747 m!113899))

(declare-fun m!113901 () Bool)

(assert (=> d!27747 m!113901))

(declare-fun m!113903 () Bool)

(assert (=> d!27747 m!113903))

(declare-fun m!113905 () Bool)

(assert (=> d!27747 m!113905))

(declare-fun m!113907 () Bool)

(assert (=> b!103000 m!113907))

(declare-fun m!113909 () Bool)

(assert (=> b!103001 m!113909))

(assert (=> b!102599 d!27747))

(declare-fun d!27749 () Bool)

(assert (=> d!27749 (= (validMask!0 (mask!6687 (v!2868 (underlying!355 thiss!992)))) (and (or (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000001111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000011111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000001111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000011111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000001111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000011111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000001111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000011111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000000111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000001111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000011111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000000111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000001111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000011111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000000111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000001111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000011111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000000111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000001111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000011111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00000111111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00001111111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00011111111111111111111111111111) (= (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6687 (v!2868 (underlying!355 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!102599 d!27749))

(declare-fun mapNonEmpty!3891 () Bool)

(declare-fun mapRes!3891 () Bool)

(declare-fun tp!9831 () Bool)

(declare-fun e!67093 () Bool)

(assert (=> mapNonEmpty!3891 (= mapRes!3891 (and tp!9831 e!67093))))

(declare-fun mapRest!3891 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapKey!3891 () (_ BitVec 32))

(declare-fun mapValue!3891 () ValueCell!989)

(assert (=> mapNonEmpty!3891 (= mapRest!3876 (store mapRest!3891 mapKey!3891 mapValue!3891))))

(declare-fun condMapEmpty!3891 () Bool)

(declare-fun mapDefault!3891 () ValueCell!989)

(assert (=> mapNonEmpty!3876 (= condMapEmpty!3891 (= mapRest!3876 ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3891)))))

(declare-fun e!67092 () Bool)

(assert (=> mapNonEmpty!3876 (= tp!9801 (and e!67092 mapRes!3891))))

(declare-fun b!103008 () Bool)

(assert (=> b!103008 (= e!67093 tp_is_empty!2665)))

(declare-fun mapIsEmpty!3891 () Bool)

(assert (=> mapIsEmpty!3891 mapRes!3891))

(declare-fun b!103009 () Bool)

(assert (=> b!103009 (= e!67092 tp_is_empty!2665)))

(assert (= (and mapNonEmpty!3876 condMapEmpty!3891) mapIsEmpty!3891))

(assert (= (and mapNonEmpty!3876 (not condMapEmpty!3891)) mapNonEmpty!3891))

(assert (= (and mapNonEmpty!3891 ((_ is ValueCellFull!989) mapValue!3891)) b!103008))

(assert (= (and mapNonEmpty!3876 ((_ is ValueCellFull!989) mapDefault!3891)) b!103009))

(declare-fun m!113911 () Bool)

(assert (=> mapNonEmpty!3891 m!113911))

(declare-fun mapNonEmpty!3892 () Bool)

(declare-fun mapRes!3892 () Bool)

(declare-fun tp!9832 () Bool)

(declare-fun e!67095 () Bool)

(assert (=> mapNonEmpty!3892 (= mapRes!3892 (and tp!9832 e!67095))))

(declare-fun mapRest!3892 () (Array (_ BitVec 32) ValueCell!989))

(declare-fun mapKey!3892 () (_ BitVec 32))

(declare-fun mapValue!3892 () ValueCell!989)

(assert (=> mapNonEmpty!3892 (= mapRest!3875 (store mapRest!3892 mapKey!3892 mapValue!3892))))

(declare-fun condMapEmpty!3892 () Bool)

(declare-fun mapDefault!3892 () ValueCell!989)

(assert (=> mapNonEmpty!3875 (= condMapEmpty!3892 (= mapRest!3875 ((as const (Array (_ BitVec 32) ValueCell!989)) mapDefault!3892)))))

(declare-fun e!67094 () Bool)

(assert (=> mapNonEmpty!3875 (= tp!9802 (and e!67094 mapRes!3892))))

(declare-fun b!103010 () Bool)

(assert (=> b!103010 (= e!67095 tp_is_empty!2665)))

(declare-fun mapIsEmpty!3892 () Bool)

(assert (=> mapIsEmpty!3892 mapRes!3892))

(declare-fun b!103011 () Bool)

(assert (=> b!103011 (= e!67094 tp_is_empty!2665)))

(assert (= (and mapNonEmpty!3875 condMapEmpty!3892) mapIsEmpty!3892))

(assert (= (and mapNonEmpty!3875 (not condMapEmpty!3892)) mapNonEmpty!3892))

(assert (= (and mapNonEmpty!3892 ((_ is ValueCellFull!989) mapValue!3892)) b!103010))

(assert (= (and mapNonEmpty!3875 ((_ is ValueCellFull!989) mapDefault!3892)) b!103011))

(declare-fun m!113913 () Bool)

(assert (=> mapNonEmpty!3892 m!113913))

(declare-fun b_lambda!4607 () Bool)

(assert (= b_lambda!4605 (or (and b!102584 b_free!2497) (and b!102590 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))))) b_lambda!4607)))

(declare-fun b_lambda!4609 () Bool)

(assert (= b_lambda!4601 (or (and b!102584 b_free!2497) (and b!102590 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))))) b_lambda!4609)))

(declare-fun b_lambda!4611 () Bool)

(assert (= b_lambda!4603 (or (and b!102584 b_free!2497) (and b!102590 b_free!2499 (= (defaultEntry!2554 newMap!16) (defaultEntry!2554 (v!2868 (underlying!355 thiss!992))))) b_lambda!4611)))

(check-sat (not b!102824) (not bm!10735) (not b_lambda!4599) (not b!102814) (not d!27715) (not b!103001) (not b!102855) (not b!102996) (not bm!10698) (not b!103000) (not b!102993) (not b!102997) (not d!27739) (not d!27729) (not b!102909) (not mapNonEmpty!3892) (not d!27747) b_and!6371 (not b!102994) (not d!27741) (not bm!10703) tp_is_empty!2665 (not bm!10743) (not d!27721) (not b!102998) (not bm!10699) (not b!102926) (not d!27737) (not d!27743) (not b!102959) (not bm!10701) (not d!27717) (not bm!10734) (not b!102857) b_and!6369 (not b!102946) (not b!102991) (not d!27719) (not b!102986) (not b!102817) (not b!102841) (not b!102999) (not bm!10705) (not b_lambda!4607) (not d!27707) (not b!102987) (not d!27725) (not d!27745) (not b!102906) (not b!102952) (not b!102912) (not bm!10731) (not bm!10714) (not b_lambda!4609) (not bm!10740) (not b!102958) (not b!102813) (not b_next!2497) (not mapNonEmpty!3891) (not b!102904) (not d!27713) (not b!102989) (not bm!10700) (not bm!10693) (not b!102728) (not b!102908) (not b!102945) (not b!102726) (not b!102825) (not b!102953) (not b_next!2499) (not d!27705) (not b!102914) (not b!102931) (not bm!10706) (not bm!10711) (not b!102856) (not b!102943) (not b!102839) (not bm!10732) (not b!102990) (not b!102910) (not b_lambda!4611) (not b!102984) (not bm!10715) (not b!102903) (not bm!10704))
(check-sat b_and!6369 b_and!6371 (not b_next!2497) (not b_next!2499))
