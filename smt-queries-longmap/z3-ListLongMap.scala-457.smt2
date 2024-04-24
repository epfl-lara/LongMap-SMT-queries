; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8358 () Bool)

(assert start!8358)

(declare-fun b!55651 () Bool)

(declare-fun b_free!1873 () Bool)

(declare-fun b_next!1873 () Bool)

(assert (=> b!55651 (= b_free!1873 (not b_next!1873))))

(declare-fun tp!7720 () Bool)

(declare-fun b_and!3285 () Bool)

(assert (=> b!55651 (= tp!7720 b_and!3285)))

(declare-fun b!55639 () Bool)

(declare-fun b_free!1875 () Bool)

(declare-fun b_next!1875 () Bool)

(assert (=> b!55639 (= b_free!1875 (not b_next!1875))))

(declare-fun tp!7722 () Bool)

(declare-fun b_and!3287 () Bool)

(assert (=> b!55639 (= tp!7722 b_and!3287)))

(declare-fun b!55638 () Bool)

(declare-fun e!36574 () Bool)

(declare-fun e!36581 () Bool)

(assert (=> b!55638 (= e!36574 e!36581)))

(declare-fun tp_is_empty!2353 () Bool)

(declare-fun e!36583 () Bool)

(declare-datatypes ((V!2785 0))(
  ( (V!2786 (val!1221 Int)) )
))
(declare-datatypes ((array!3615 0))(
  ( (array!3616 (arr!1730 (Array (_ BitVec 32) (_ BitVec 64))) (size!1959 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!833 0))(
  ( (ValueCellFull!833 (v!2329 V!2785)) (EmptyCell!833) )
))
(declare-datatypes ((array!3617 0))(
  ( (array!3618 (arr!1731 (Array (_ BitVec 32) ValueCell!833)) (size!1960 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!574 0))(
  ( (LongMapFixedSize!575 (defaultEntry!2001 Int) (mask!5862 (_ BitVec 32)) (extraKeys!1892 (_ BitVec 32)) (zeroValue!1919 V!2785) (minValue!1919 V!2785) (_size!336 (_ BitVec 32)) (_keys!3621 array!3615) (_values!1984 array!3617) (_vacant!336 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!574)

(declare-fun e!36572 () Bool)

(declare-fun array_inv!1065 (array!3615) Bool)

(declare-fun array_inv!1066 (array!3617) Bool)

(assert (=> b!55639 (= e!36572 (and tp!7722 tp_is_empty!2353 (array_inv!1065 (_keys!3621 newMap!16)) (array_inv!1066 (_values!1984 newMap!16)) e!36583))))

(declare-fun b!55640 () Bool)

(declare-fun e!36585 () Bool)

(assert (=> b!55640 (= e!36585 tp_is_empty!2353)))

(declare-fun b!55641 () Bool)

(declare-fun res!31335 () Bool)

(declare-fun e!36582 () Bool)

(assert (=> b!55641 (=> (not res!31335) (not e!36582))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!390 0))(
  ( (Cell!391 (v!2330 LongMapFixedSize!574)) )
))
(declare-datatypes ((LongMap!390 0))(
  ( (LongMap!391 (underlying!206 Cell!390)) )
))
(declare-fun thiss!992 () LongMap!390)

(assert (=> b!55641 (= res!31335 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1959 (_keys!3621 (v!2330 (underlying!206 thiss!992)))))))))

(declare-fun b!55642 () Bool)

(declare-fun e!36579 () Bool)

(assert (=> b!55642 (= e!36579 true)))

(declare-datatypes ((List!1394 0))(
  ( (Nil!1391) (Cons!1390 (h!1970 (_ BitVec 64)) (t!4636 List!1394)) )
))
(declare-fun lt!21977 () List!1394)

(declare-fun lt!21982 () Bool)

(declare-fun contains!655 (List!1394 (_ BitVec 64)) Bool)

(assert (=> b!55642 (= lt!21982 (contains!655 lt!21977 (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355)))))

(declare-fun b!55643 () Bool)

(declare-fun e!36584 () Bool)

(assert (=> b!55643 (= e!36584 (not e!36579))))

(declare-fun res!31329 () Bool)

(assert (=> b!55643 (=> res!31329 e!36579)))

(assert (=> b!55643 (= res!31329 (or (bvsge (size!1959 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1959 (_keys!3621 (v!2330 (underlying!206 thiss!992)))))))))

(assert (=> b!55643 (= lt!21977 (Cons!1390 (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) Nil!1391))))

(declare-fun arrayNoDuplicates!0 (array!3615 (_ BitVec 32) List!1394) Bool)

(assert (=> b!55643 (arrayNoDuplicates!0 (_keys!3621 (v!2330 (underlying!206 thiss!992))) from!355 Nil!1391)))

(declare-datatypes ((Unit!1462 0))(
  ( (Unit!1463) )
))
(declare-fun lt!21980 () Unit!1462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3615 (_ BitVec 32) (_ BitVec 32)) Unit!1462)

(assert (=> b!55643 (= lt!21980 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3621 (v!2330 (underlying!206 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55643 (arrayContainsKey!0 (_keys!3621 (v!2330 (underlying!206 thiss!992))) (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21978 () Unit!1462)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!15 (array!3615 array!3617 (_ BitVec 32) (_ BitVec 32) V!2785 V!2785 (_ BitVec 64) (_ BitVec 32) Int) Unit!1462)

(assert (=> b!55643 (= lt!21978 (lemmaListMapContainsThenArrayContainsFrom!15 (_keys!3621 (v!2330 (underlying!206 thiss!992))) (_values!1984 (v!2330 (underlying!206 thiss!992))) (mask!5862 (v!2330 (underlying!206 thiss!992))) (extraKeys!1892 (v!2330 (underlying!206 thiss!992))) (zeroValue!1919 (v!2330 (underlying!206 thiss!992))) (minValue!1919 (v!2330 (underlying!206 thiss!992))) (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2001 (v!2330 (underlying!206 thiss!992)))))))

(declare-fun b!55644 () Bool)

(declare-fun res!31333 () Bool)

(assert (=> b!55644 (=> res!31333 e!36579)))

(assert (=> b!55644 (= res!31333 (contains!655 lt!21977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55645 () Bool)

(declare-fun e!36586 () Bool)

(assert (=> b!55645 (= e!36586 tp_is_empty!2353)))

(declare-fun b!55646 () Bool)

(declare-fun e!36577 () Bool)

(assert (=> b!55646 (= e!36582 e!36577)))

(declare-fun res!31339 () Bool)

(assert (=> b!55646 (=> (not res!31339) (not e!36577))))

(declare-datatypes ((tuple2!1970 0))(
  ( (tuple2!1971 (_1!996 (_ BitVec 64)) (_2!996 V!2785)) )
))
(declare-datatypes ((List!1395 0))(
  ( (Nil!1392) (Cons!1391 (h!1971 tuple2!1970) (t!4637 List!1395)) )
))
(declare-datatypes ((ListLongMap!1317 0))(
  ( (ListLongMap!1318 (toList!674 List!1395)) )
))
(declare-fun lt!21979 () ListLongMap!1317)

(declare-fun lt!21981 () ListLongMap!1317)

(assert (=> b!55646 (= res!31339 (and (= lt!21979 lt!21981) (not (= (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1083 (LongMapFixedSize!574) ListLongMap!1317)

(assert (=> b!55646 (= lt!21981 (map!1083 newMap!16))))

(declare-fun getCurrentListMap!377 (array!3615 array!3617 (_ BitVec 32) (_ BitVec 32) V!2785 V!2785 (_ BitVec 32) Int) ListLongMap!1317)

(assert (=> b!55646 (= lt!21979 (getCurrentListMap!377 (_keys!3621 (v!2330 (underlying!206 thiss!992))) (_values!1984 (v!2330 (underlying!206 thiss!992))) (mask!5862 (v!2330 (underlying!206 thiss!992))) (extraKeys!1892 (v!2330 (underlying!206 thiss!992))) (zeroValue!1919 (v!2330 (underlying!206 thiss!992))) (minValue!1919 (v!2330 (underlying!206 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2001 (v!2330 (underlying!206 thiss!992)))))))

(declare-fun b!55647 () Bool)

(declare-fun mapRes!2730 () Bool)

(assert (=> b!55647 (= e!36583 (and e!36586 mapRes!2730))))

(declare-fun condMapEmpty!2729 () Bool)

(declare-fun mapDefault!2730 () ValueCell!833)

(assert (=> b!55647 (= condMapEmpty!2729 (= (arr!1731 (_values!1984 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!833)) mapDefault!2730)))))

(declare-fun b!55648 () Bool)

(declare-fun e!36576 () Bool)

(declare-fun e!36575 () Bool)

(declare-fun mapRes!2729 () Bool)

(assert (=> b!55648 (= e!36576 (and e!36575 mapRes!2729))))

(declare-fun condMapEmpty!2730 () Bool)

(declare-fun mapDefault!2729 () ValueCell!833)

(assert (=> b!55648 (= condMapEmpty!2730 (= (arr!1731 (_values!1984 (v!2330 (underlying!206 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!833)) mapDefault!2729)))))

(declare-fun res!31331 () Bool)

(assert (=> start!8358 (=> (not res!31331) (not e!36582))))

(declare-fun valid!241 (LongMap!390) Bool)

(assert (=> start!8358 (= res!31331 (valid!241 thiss!992))))

(assert (=> start!8358 e!36582))

(declare-fun e!36580 () Bool)

(assert (=> start!8358 e!36580))

(assert (=> start!8358 true))

(assert (=> start!8358 e!36572))

(declare-fun b!55649 () Bool)

(declare-fun res!31332 () Bool)

(assert (=> b!55649 (=> res!31332 e!36579)))

(assert (=> b!55649 (= res!31332 (contains!655 lt!21977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55650 () Bool)

(declare-fun res!31336 () Bool)

(assert (=> b!55650 (=> res!31336 e!36579)))

(declare-fun noDuplicate!41 (List!1394) Bool)

(assert (=> b!55650 (= res!31336 (not (noDuplicate!41 lt!21977)))))

(assert (=> b!55651 (= e!36581 (and tp!7720 tp_is_empty!2353 (array_inv!1065 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) (array_inv!1066 (_values!1984 (v!2330 (underlying!206 thiss!992)))) e!36576))))

(declare-fun b!55652 () Bool)

(declare-fun res!31330 () Bool)

(assert (=> b!55652 (=> (not res!31330) (not e!36582))))

(declare-fun valid!242 (LongMapFixedSize!574) Bool)

(assert (=> b!55652 (= res!31330 (valid!242 newMap!16))))

(declare-fun b!55653 () Bool)

(assert (=> b!55653 (= e!36575 tp_is_empty!2353)))

(declare-fun b!55654 () Bool)

(declare-fun res!31337 () Bool)

(assert (=> b!55654 (=> res!31337 e!36579)))

(assert (=> b!55654 (= res!31337 (not (arrayNoDuplicates!0 (_keys!3621 (v!2330 (underlying!206 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21977)))))

(declare-fun b!55655 () Bool)

(assert (=> b!55655 (= e!36577 e!36584)))

(declare-fun res!31338 () Bool)

(assert (=> b!55655 (=> (not res!31338) (not e!36584))))

(declare-fun contains!656 (ListLongMap!1317 (_ BitVec 64)) Bool)

(assert (=> b!55655 (= res!31338 (contains!656 lt!21981 (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1972 0))(
  ( (tuple2!1973 (_1!997 Bool) (_2!997 LongMapFixedSize!574)) )
))
(declare-fun lt!21983 () tuple2!1972)

(declare-fun update!77 (LongMapFixedSize!574 (_ BitVec 64) V!2785) tuple2!1972)

(declare-fun get!1044 (ValueCell!833 V!2785) V!2785)

(declare-fun dynLambda!295 (Int (_ BitVec 64)) V!2785)

(assert (=> b!55655 (= lt!21983 (update!77 newMap!16 (select (arr!1730 (_keys!3621 (v!2330 (underlying!206 thiss!992)))) from!355) (get!1044 (select (arr!1731 (_values!1984 (v!2330 (underlying!206 thiss!992)))) from!355) (dynLambda!295 (defaultEntry!2001 (v!2330 (underlying!206 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!2729 () Bool)

(declare-fun tp!7721 () Bool)

(declare-fun e!36573 () Bool)

(assert (=> mapNonEmpty!2729 (= mapRes!2729 (and tp!7721 e!36573))))

(declare-fun mapValue!2729 () ValueCell!833)

(declare-fun mapKey!2730 () (_ BitVec 32))

(declare-fun mapRest!2729 () (Array (_ BitVec 32) ValueCell!833))

(assert (=> mapNonEmpty!2729 (= (arr!1731 (_values!1984 (v!2330 (underlying!206 thiss!992)))) (store mapRest!2729 mapKey!2730 mapValue!2729))))

(declare-fun b!55656 () Bool)

(assert (=> b!55656 (= e!36580 e!36574)))

(declare-fun mapIsEmpty!2729 () Bool)

(assert (=> mapIsEmpty!2729 mapRes!2729))

(declare-fun b!55657 () Bool)

(assert (=> b!55657 (= e!36573 tp_is_empty!2353)))

(declare-fun mapNonEmpty!2730 () Bool)

(declare-fun tp!7719 () Bool)

(assert (=> mapNonEmpty!2730 (= mapRes!2730 (and tp!7719 e!36585))))

(declare-fun mapRest!2730 () (Array (_ BitVec 32) ValueCell!833))

(declare-fun mapKey!2729 () (_ BitVec 32))

(declare-fun mapValue!2730 () ValueCell!833)

(assert (=> mapNonEmpty!2730 (= (arr!1731 (_values!1984 newMap!16)) (store mapRest!2730 mapKey!2729 mapValue!2730))))

(declare-fun mapIsEmpty!2730 () Bool)

(assert (=> mapIsEmpty!2730 mapRes!2730))

(declare-fun b!55658 () Bool)

(declare-fun res!31334 () Bool)

(assert (=> b!55658 (=> (not res!31334) (not e!36582))))

(assert (=> b!55658 (= res!31334 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5862 newMap!16)) (_size!336 (v!2330 (underlying!206 thiss!992)))))))

(assert (= (and start!8358 res!31331) b!55641))

(assert (= (and b!55641 res!31335) b!55652))

(assert (= (and b!55652 res!31330) b!55658))

(assert (= (and b!55658 res!31334) b!55646))

(assert (= (and b!55646 res!31339) b!55655))

(assert (= (and b!55655 res!31338) b!55643))

(assert (= (and b!55643 (not res!31329)) b!55650))

(assert (= (and b!55650 (not res!31336)) b!55644))

(assert (= (and b!55644 (not res!31333)) b!55649))

(assert (= (and b!55649 (not res!31332)) b!55654))

(assert (= (and b!55654 (not res!31337)) b!55642))

(assert (= (and b!55648 condMapEmpty!2730) mapIsEmpty!2729))

(assert (= (and b!55648 (not condMapEmpty!2730)) mapNonEmpty!2729))

(get-info :version)

(assert (= (and mapNonEmpty!2729 ((_ is ValueCellFull!833) mapValue!2729)) b!55657))

(assert (= (and b!55648 ((_ is ValueCellFull!833) mapDefault!2729)) b!55653))

(assert (= b!55651 b!55648))

(assert (= b!55638 b!55651))

(assert (= b!55656 b!55638))

(assert (= start!8358 b!55656))

(assert (= (and b!55647 condMapEmpty!2729) mapIsEmpty!2730))

(assert (= (and b!55647 (not condMapEmpty!2729)) mapNonEmpty!2730))

(assert (= (and mapNonEmpty!2730 ((_ is ValueCellFull!833) mapValue!2730)) b!55640))

(assert (= (and b!55647 ((_ is ValueCellFull!833) mapDefault!2730)) b!55645))

(assert (= b!55639 b!55647))

(assert (= start!8358 b!55639))

(declare-fun b_lambda!2447 () Bool)

(assert (=> (not b_lambda!2447) (not b!55655)))

(declare-fun t!4633 () Bool)

(declare-fun tb!1217 () Bool)

(assert (=> (and b!55651 (= (defaultEntry!2001 (v!2330 (underlying!206 thiss!992))) (defaultEntry!2001 (v!2330 (underlying!206 thiss!992)))) t!4633) tb!1217))

(declare-fun result!2223 () Bool)

(assert (=> tb!1217 (= result!2223 tp_is_empty!2353)))

(assert (=> b!55655 t!4633))

(declare-fun b_and!3289 () Bool)

(assert (= b_and!3285 (and (=> t!4633 result!2223) b_and!3289)))

(declare-fun tb!1219 () Bool)

(declare-fun t!4635 () Bool)

(assert (=> (and b!55639 (= (defaultEntry!2001 newMap!16) (defaultEntry!2001 (v!2330 (underlying!206 thiss!992)))) t!4635) tb!1219))

(declare-fun result!2227 () Bool)

(assert (= result!2227 result!2223))

(assert (=> b!55655 t!4635))

(declare-fun b_and!3291 () Bool)

(assert (= b_and!3287 (and (=> t!4635 result!2227) b_and!3291)))

(declare-fun m!46831 () Bool)

(assert (=> b!55643 m!46831))

(declare-fun m!46833 () Bool)

(assert (=> b!55643 m!46833))

(declare-fun m!46835 () Bool)

(assert (=> b!55643 m!46835))

(declare-fun m!46837 () Bool)

(assert (=> b!55643 m!46837))

(assert (=> b!55643 m!46835))

(assert (=> b!55643 m!46835))

(declare-fun m!46839 () Bool)

(assert (=> b!55643 m!46839))

(declare-fun m!46841 () Bool)

(assert (=> mapNonEmpty!2730 m!46841))

(declare-fun m!46843 () Bool)

(assert (=> b!55639 m!46843))

(declare-fun m!46845 () Bool)

(assert (=> b!55639 m!46845))

(declare-fun m!46847 () Bool)

(assert (=> b!55650 m!46847))

(declare-fun m!46849 () Bool)

(assert (=> b!55652 m!46849))

(declare-fun m!46851 () Bool)

(assert (=> mapNonEmpty!2729 m!46851))

(declare-fun m!46853 () Bool)

(assert (=> b!55644 m!46853))

(assert (=> b!55646 m!46835))

(declare-fun m!46855 () Bool)

(assert (=> b!55646 m!46855))

(declare-fun m!46857 () Bool)

(assert (=> b!55646 m!46857))

(declare-fun m!46859 () Bool)

(assert (=> b!55654 m!46859))

(declare-fun m!46861 () Bool)

(assert (=> b!55651 m!46861))

(declare-fun m!46863 () Bool)

(assert (=> b!55651 m!46863))

(declare-fun m!46865 () Bool)

(assert (=> b!55649 m!46865))

(assert (=> b!55642 m!46835))

(assert (=> b!55642 m!46835))

(declare-fun m!46867 () Bool)

(assert (=> b!55642 m!46867))

(declare-fun m!46869 () Bool)

(assert (=> b!55655 m!46869))

(declare-fun m!46871 () Bool)

(assert (=> b!55655 m!46871))

(declare-fun m!46873 () Bool)

(assert (=> b!55655 m!46873))

(assert (=> b!55655 m!46835))

(declare-fun m!46875 () Bool)

(assert (=> b!55655 m!46875))

(assert (=> b!55655 m!46835))

(assert (=> b!55655 m!46871))

(assert (=> b!55655 m!46835))

(assert (=> b!55655 m!46873))

(declare-fun m!46877 () Bool)

(assert (=> b!55655 m!46877))

(assert (=> b!55655 m!46869))

(declare-fun m!46879 () Bool)

(assert (=> start!8358 m!46879))

(check-sat (not b!55652) (not b!55654) (not b!55643) (not b!55651) (not start!8358) (not mapNonEmpty!2730) (not b_next!1873) b_and!3289 (not b_lambda!2447) (not b!55646) (not b!55649) (not b!55655) (not b!55644) tp_is_empty!2353 (not b!55639) b_and!3291 (not mapNonEmpty!2729) (not b_next!1875) (not b!55650) (not b!55642))
(check-sat b_and!3289 b_and!3291 (not b_next!1873) (not b_next!1875))
