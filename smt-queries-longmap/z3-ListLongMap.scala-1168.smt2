; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24918 () Bool)

(assert start!24918)

(declare-fun b!260059 () Bool)

(declare-fun b_free!6757 () Bool)

(declare-fun b_next!6757 () Bool)

(assert (=> b!260059 (= b_free!6757 (not b_next!6757))))

(declare-fun tp!23593 () Bool)

(declare-fun b_and!13877 () Bool)

(assert (=> b!260059 (= tp!23593 b_and!13877)))

(declare-fun b!260043 () Bool)

(declare-fun res!127111 () Bool)

(declare-fun e!168530 () Bool)

(assert (=> b!260043 (=> (not res!127111) (not e!168530))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!260043 (= res!127111 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260044 () Bool)

(declare-fun c!44172 () Bool)

(declare-datatypes ((SeekEntryResult!1148 0))(
  ( (MissingZero!1148 (index!6762 (_ BitVec 32))) (Found!1148 (index!6763 (_ BitVec 32))) (Intermediate!1148 (undefined!1960 Bool) (index!6764 (_ BitVec 32)) (x!25086 (_ BitVec 32))) (Undefined!1148) (MissingVacant!1148 (index!6765 (_ BitVec 32))) )
))
(declare-fun lt!131143 () SeekEntryResult!1148)

(get-info :version)

(assert (=> b!260044 (= c!44172 ((_ is MissingVacant!1148) lt!131143))))

(declare-fun e!168533 () Bool)

(declare-fun e!168538 () Bool)

(assert (=> b!260044 (= e!168533 e!168538)))

(declare-fun b!260045 () Bool)

(assert (=> b!260045 (= e!168538 ((_ is Undefined!1148) lt!131143))))

(declare-fun b!260046 () Bool)

(declare-datatypes ((Unit!8056 0))(
  ( (Unit!8057) )
))
(declare-fun e!168524 () Unit!8056)

(declare-fun lt!131142 () Unit!8056)

(assert (=> b!260046 (= e!168524 lt!131142)))

(declare-datatypes ((V!8473 0))(
  ( (V!8474 (val!3354 Int)) )
))
(declare-datatypes ((ValueCell!2966 0))(
  ( (ValueCellFull!2966 (v!5468 V!8473)) (EmptyCell!2966) )
))
(declare-datatypes ((array!12589 0))(
  ( (array!12590 (arr!5959 (Array (_ BitVec 32) ValueCell!2966)) (size!6308 (_ BitVec 32))) )
))
(declare-datatypes ((array!12591 0))(
  ( (array!12592 (arr!5960 (Array (_ BitVec 32) (_ BitVec 64))) (size!6309 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3832 0))(
  ( (LongMapFixedSize!3833 (defaultEntry!4794 Int) (mask!11120 (_ BitVec 32)) (extraKeys!4531 (_ BitVec 32)) (zeroValue!4635 V!8473) (minValue!4635 V!8473) (_size!1965 (_ BitVec 32)) (_keys!6974 array!12591) (_values!4777 array!12589) (_vacant!1965 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3832)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8056)

(assert (=> b!260046 (= lt!131142 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(declare-fun c!44173 () Bool)

(assert (=> b!260046 (= c!44173 ((_ is MissingZero!1148) lt!131143))))

(assert (=> b!260046 e!168533))

(declare-fun res!127114 () Bool)

(assert (=> start!24918 (=> (not res!127114) (not e!168530))))

(declare-fun valid!1503 (LongMapFixedSize!3832) Bool)

(assert (=> start!24918 (= res!127114 (valid!1503 thiss!1504))))

(assert (=> start!24918 e!168530))

(declare-fun e!168536 () Bool)

(assert (=> start!24918 e!168536))

(assert (=> start!24918 true))

(declare-fun tp_is_empty!6619 () Bool)

(assert (=> start!24918 tp_is_empty!6619))

(declare-fun b!260047 () Bool)

(declare-fun e!168532 () Bool)

(declare-fun e!168526 () Bool)

(declare-fun mapRes!11279 () Bool)

(assert (=> b!260047 (= e!168532 (and e!168526 mapRes!11279))))

(declare-fun condMapEmpty!11279 () Bool)

(declare-fun mapDefault!11279 () ValueCell!2966)

(assert (=> b!260047 (= condMapEmpty!11279 (= (arr!5959 (_values!4777 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11279)))))

(declare-fun bm!24764 () Bool)

(declare-fun call!24768 () Bool)

(declare-fun arrayContainsKey!0 (array!12591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24764 (= call!24768 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24765 () Bool)

(declare-fun call!24767 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24765 (= call!24767 (inRange!0 (ite c!44173 (index!6762 lt!131143) (index!6765 lt!131143)) (mask!11120 thiss!1504)))))

(declare-fun b!260048 () Bool)

(declare-fun res!127109 () Bool)

(declare-fun e!168525 () Bool)

(assert (=> b!260048 (=> (not res!127109) (not e!168525))))

(assert (=> b!260048 (= res!127109 call!24767)))

(assert (=> b!260048 (= e!168533 e!168525)))

(declare-fun b!260049 () Bool)

(declare-fun res!127117 () Bool)

(assert (=> b!260049 (= res!127117 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6765 lt!131143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168529 () Bool)

(assert (=> b!260049 (=> (not res!127117) (not e!168529))))

(declare-fun b!260050 () Bool)

(assert (=> b!260050 (= e!168529 (not call!24768))))

(declare-fun mapIsEmpty!11279 () Bool)

(assert (=> mapIsEmpty!11279 mapRes!11279))

(declare-fun b!260051 () Bool)

(declare-fun Unit!8058 () Unit!8056)

(assert (=> b!260051 (= e!168524 Unit!8058)))

(declare-fun lt!131148 () Unit!8056)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8056)

(assert (=> b!260051 (= lt!131148 (lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!260051 false))

(declare-fun b!260052 () Bool)

(declare-fun e!168528 () Bool)

(declare-fun e!168537 () Bool)

(assert (=> b!260052 (= e!168528 e!168537)))

(declare-fun res!127113 () Bool)

(assert (=> b!260052 (=> (not res!127113) (not e!168537))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!260052 (= res!127113 (inRange!0 index!297 (mask!11120 thiss!1504)))))

(declare-fun lt!131139 () Unit!8056)

(assert (=> b!260052 (= lt!131139 e!168524)))

(declare-fun c!44175 () Bool)

(declare-datatypes ((tuple2!4854 0))(
  ( (tuple2!4855 (_1!2438 (_ BitVec 64)) (_2!2438 V!8473)) )
))
(declare-datatypes ((List!3732 0))(
  ( (Nil!3729) (Cons!3728 (h!4392 tuple2!4854) (t!8793 List!3732)) )
))
(declare-datatypes ((ListLongMap!3769 0))(
  ( (ListLongMap!3770 (toList!1900 List!3732)) )
))
(declare-fun lt!131150 () ListLongMap!3769)

(declare-fun contains!1865 (ListLongMap!3769 (_ BitVec 64)) Bool)

(assert (=> b!260052 (= c!44175 (contains!1865 lt!131150 key!932))))

(declare-fun getCurrentListMap!1432 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) Int) ListLongMap!3769)

(assert (=> b!260052 (= lt!131150 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260053 () Bool)

(declare-fun e!168535 () Bool)

(assert (=> b!260053 (= e!168535 (or (not (= (size!6308 (_values!4777 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11120 thiss!1504)))) (not (= (size!6309 (_keys!6974 thiss!1504)) (size!6308 (_values!4777 thiss!1504)))) (bvslt (mask!11120 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4531 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!260054 () Bool)

(declare-fun e!168527 () Unit!8056)

(declare-fun Unit!8059 () Unit!8056)

(assert (=> b!260054 (= e!168527 Unit!8059)))

(declare-fun lt!131147 () Unit!8056)

(declare-fun lemmaArrayContainsKeyThenInListMap!256 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) (_ BitVec 32) Int) Unit!8056)

(assert (=> b!260054 (= lt!131147 (lemmaArrayContainsKeyThenInListMap!256 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!260054 false))

(declare-fun b!260055 () Bool)

(declare-fun e!168534 () Bool)

(assert (=> b!260055 (= e!168534 tp_is_empty!6619)))

(declare-fun b!260056 () Bool)

(declare-fun Unit!8060 () Unit!8056)

(assert (=> b!260056 (= e!168527 Unit!8060)))

(declare-fun b!260057 () Bool)

(assert (=> b!260057 (= e!168538 e!168529)))

(declare-fun res!127115 () Bool)

(assert (=> b!260057 (= res!127115 call!24767)))

(assert (=> b!260057 (=> (not res!127115) (not e!168529))))

(declare-fun b!260058 () Bool)

(declare-fun res!127112 () Bool)

(assert (=> b!260058 (=> (not res!127112) (not e!168525))))

(assert (=> b!260058 (= res!127112 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6762 lt!131143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!3923 (array!12591) Bool)

(declare-fun array_inv!3924 (array!12589) Bool)

(assert (=> b!260059 (= e!168536 (and tp!23593 tp_is_empty!6619 (array_inv!3923 (_keys!6974 thiss!1504)) (array_inv!3924 (_values!4777 thiss!1504)) e!168532))))

(declare-fun mapNonEmpty!11279 () Bool)

(declare-fun tp!23594 () Bool)

(assert (=> mapNonEmpty!11279 (= mapRes!11279 (and tp!23594 e!168534))))

(declare-fun mapRest!11279 () (Array (_ BitVec 32) ValueCell!2966))

(declare-fun mapValue!11279 () ValueCell!2966)

(declare-fun mapKey!11279 () (_ BitVec 32))

(assert (=> mapNonEmpty!11279 (= (arr!5959 (_values!4777 thiss!1504)) (store mapRest!11279 mapKey!11279 mapValue!11279))))

(declare-fun b!260060 () Bool)

(assert (=> b!260060 (= e!168525 (not call!24768))))

(declare-fun b!260061 () Bool)

(assert (=> b!260061 (= e!168526 tp_is_empty!6619)))

(declare-fun b!260062 () Bool)

(assert (=> b!260062 (= e!168530 e!168528)))

(declare-fun res!127110 () Bool)

(assert (=> b!260062 (=> (not res!127110) (not e!168528))))

(assert (=> b!260062 (= res!127110 (or (= lt!131143 (MissingZero!1148 index!297)) (= lt!131143 (MissingVacant!1148 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12591 (_ BitVec 32)) SeekEntryResult!1148)

(assert (=> b!260062 (= lt!131143 (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun b!260063 () Bool)

(assert (=> b!260063 (= e!168537 (not e!168535))))

(declare-fun res!127116 () Bool)

(assert (=> b!260063 (=> res!127116 e!168535)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260063 (= res!127116 (not (validMask!0 (mask!11120 thiss!1504))))))

(declare-fun lt!131140 () array!12591)

(declare-fun arrayCountValidKeys!0 (array!12591 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260063 (= (arrayCountValidKeys!0 lt!131140 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131146 () Unit!8056)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12591 (_ BitVec 32)) Unit!8056)

(assert (=> b!260063 (= lt!131146 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131140 index!297))))

(assert (=> b!260063 (arrayContainsKey!0 lt!131140 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131138 () Unit!8056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12591 (_ BitVec 64) (_ BitVec 32)) Unit!8056)

(assert (=> b!260063 (= lt!131138 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131140 key!932 index!297))))

(declare-fun v!346 () V!8473)

(declare-fun +!697 (ListLongMap!3769 tuple2!4854) ListLongMap!3769)

(assert (=> b!260063 (= (+!697 lt!131150 (tuple2!4855 key!932 v!346)) (getCurrentListMap!1432 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131141 () Unit!8056)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!112 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) (_ BitVec 64) V!8473 Int) Unit!8056)

(assert (=> b!260063 (= lt!131141 (lemmaAddValidKeyToArrayThenAddPairToListMap!112 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12591 (_ BitVec 32)) Bool)

(assert (=> b!260063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131140 (mask!11120 thiss!1504))))

(declare-fun lt!131149 () Unit!8056)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12591 (_ BitVec 32) (_ BitVec 32)) Unit!8056)

(assert (=> b!260063 (= lt!131149 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) index!297 (mask!11120 thiss!1504)))))

(assert (=> b!260063 (= (arrayCountValidKeys!0 lt!131140 #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504)))))))

(declare-fun lt!131145 () Unit!8056)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12591 (_ BitVec 32) (_ BitVec 64)) Unit!8056)

(assert (=> b!260063 (= lt!131145 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6974 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3733 0))(
  ( (Nil!3730) (Cons!3729 (h!4393 (_ BitVec 64)) (t!8794 List!3733)) )
))
(declare-fun arrayNoDuplicates!0 (array!12591 (_ BitVec 32) List!3733) Bool)

(assert (=> b!260063 (arrayNoDuplicates!0 lt!131140 #b00000000000000000000000000000000 Nil!3730)))

(assert (=> b!260063 (= lt!131140 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun lt!131144 () Unit!8056)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3733) Unit!8056)

(assert (=> b!260063 (= lt!131144 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6974 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730))))

(declare-fun lt!131151 () Unit!8056)

(assert (=> b!260063 (= lt!131151 e!168527)))

(declare-fun c!44174 () Bool)

(assert (=> b!260063 (= c!44174 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!24918 res!127114) b!260043))

(assert (= (and b!260043 res!127111) b!260062))

(assert (= (and b!260062 res!127110) b!260052))

(assert (= (and b!260052 c!44175) b!260051))

(assert (= (and b!260052 (not c!44175)) b!260046))

(assert (= (and b!260046 c!44173) b!260048))

(assert (= (and b!260046 (not c!44173)) b!260044))

(assert (= (and b!260048 res!127109) b!260058))

(assert (= (and b!260058 res!127112) b!260060))

(assert (= (and b!260044 c!44172) b!260057))

(assert (= (and b!260044 (not c!44172)) b!260045))

(assert (= (and b!260057 res!127115) b!260049))

(assert (= (and b!260049 res!127117) b!260050))

(assert (= (or b!260048 b!260057) bm!24765))

(assert (= (or b!260060 b!260050) bm!24764))

(assert (= (and b!260052 res!127113) b!260063))

(assert (= (and b!260063 c!44174) b!260054))

(assert (= (and b!260063 (not c!44174)) b!260056))

(assert (= (and b!260063 (not res!127116)) b!260053))

(assert (= (and b!260047 condMapEmpty!11279) mapIsEmpty!11279))

(assert (= (and b!260047 (not condMapEmpty!11279)) mapNonEmpty!11279))

(assert (= (and mapNonEmpty!11279 ((_ is ValueCellFull!2966) mapValue!11279)) b!260055))

(assert (= (and b!260047 ((_ is ValueCellFull!2966) mapDefault!11279)) b!260061))

(assert (= b!260059 b!260047))

(assert (= start!24918 b!260059))

(declare-fun m!275863 () Bool)

(assert (=> b!260052 m!275863))

(declare-fun m!275865 () Bool)

(assert (=> b!260052 m!275865))

(declare-fun m!275867 () Bool)

(assert (=> b!260052 m!275867))

(declare-fun m!275869 () Bool)

(assert (=> bm!24765 m!275869))

(declare-fun m!275871 () Bool)

(assert (=> b!260046 m!275871))

(declare-fun m!275873 () Bool)

(assert (=> b!260058 m!275873))

(declare-fun m!275875 () Bool)

(assert (=> b!260063 m!275875))

(declare-fun m!275877 () Bool)

(assert (=> b!260063 m!275877))

(declare-fun m!275879 () Bool)

(assert (=> b!260063 m!275879))

(declare-fun m!275881 () Bool)

(assert (=> b!260063 m!275881))

(declare-fun m!275883 () Bool)

(assert (=> b!260063 m!275883))

(declare-fun m!275885 () Bool)

(assert (=> b!260063 m!275885))

(declare-fun m!275887 () Bool)

(assert (=> b!260063 m!275887))

(declare-fun m!275889 () Bool)

(assert (=> b!260063 m!275889))

(declare-fun m!275891 () Bool)

(assert (=> b!260063 m!275891))

(declare-fun m!275893 () Bool)

(assert (=> b!260063 m!275893))

(declare-fun m!275895 () Bool)

(assert (=> b!260063 m!275895))

(declare-fun m!275897 () Bool)

(assert (=> b!260063 m!275897))

(declare-fun m!275899 () Bool)

(assert (=> b!260063 m!275899))

(declare-fun m!275901 () Bool)

(assert (=> b!260063 m!275901))

(declare-fun m!275903 () Bool)

(assert (=> b!260063 m!275903))

(declare-fun m!275905 () Bool)

(assert (=> b!260063 m!275905))

(declare-fun m!275907 () Bool)

(assert (=> b!260063 m!275907))

(declare-fun m!275909 () Bool)

(assert (=> b!260063 m!275909))

(declare-fun m!275911 () Bool)

(assert (=> b!260059 m!275911))

(declare-fun m!275913 () Bool)

(assert (=> b!260059 m!275913))

(assert (=> bm!24764 m!275877))

(declare-fun m!275915 () Bool)

(assert (=> start!24918 m!275915))

(declare-fun m!275917 () Bool)

(assert (=> b!260062 m!275917))

(declare-fun m!275919 () Bool)

(assert (=> b!260049 m!275919))

(declare-fun m!275921 () Bool)

(assert (=> b!260051 m!275921))

(declare-fun m!275923 () Bool)

(assert (=> b!260054 m!275923))

(declare-fun m!275925 () Bool)

(assert (=> mapNonEmpty!11279 m!275925))

(check-sat (not b!260046) (not mapNonEmpty!11279) (not bm!24765) (not b!260062) (not bm!24764) (not b_next!6757) (not b!260063) tp_is_empty!6619 (not b!260051) (not b!260059) (not b!260052) b_and!13877 (not b!260054) (not start!24918))
(check-sat b_and!13877 (not b_next!6757))
(get-model)

(declare-fun d!62521 () Bool)

(declare-fun res!127176 () Bool)

(declare-fun e!168633 () Bool)

(assert (=> d!62521 (=> res!127176 e!168633)))

(assert (=> d!62521 (= res!127176 (= (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62521 (= (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 #b00000000000000000000000000000000) e!168633)))

(declare-fun b!260194 () Bool)

(declare-fun e!168634 () Bool)

(assert (=> b!260194 (= e!168633 e!168634)))

(declare-fun res!127177 () Bool)

(assert (=> b!260194 (=> (not res!127177) (not e!168634))))

(assert (=> b!260194 (= res!127177 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260195 () Bool)

(assert (=> b!260195 (= e!168634 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62521 (not res!127176)) b!260194))

(assert (= (and b!260194 res!127177) b!260195))

(declare-fun m!276055 () Bool)

(assert (=> d!62521 m!276055))

(declare-fun m!276057 () Bool)

(assert (=> b!260195 m!276057))

(assert (=> bm!24764 d!62521))

(declare-fun d!62523 () Bool)

(declare-fun res!127184 () Bool)

(declare-fun e!168637 () Bool)

(assert (=> d!62523 (=> (not res!127184) (not e!168637))))

(declare-fun simpleValid!281 (LongMapFixedSize!3832) Bool)

(assert (=> d!62523 (= res!127184 (simpleValid!281 thiss!1504))))

(assert (=> d!62523 (= (valid!1503 thiss!1504) e!168637)))

(declare-fun b!260202 () Bool)

(declare-fun res!127185 () Bool)

(assert (=> b!260202 (=> (not res!127185) (not e!168637))))

(assert (=> b!260202 (= res!127185 (= (arrayCountValidKeys!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (_size!1965 thiss!1504)))))

(declare-fun b!260203 () Bool)

(declare-fun res!127186 () Bool)

(assert (=> b!260203 (=> (not res!127186) (not e!168637))))

(assert (=> b!260203 (= res!127186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun b!260204 () Bool)

(assert (=> b!260204 (= e!168637 (arrayNoDuplicates!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 Nil!3730))))

(assert (= (and d!62523 res!127184) b!260202))

(assert (= (and b!260202 res!127185) b!260203))

(assert (= (and b!260203 res!127186) b!260204))

(declare-fun m!276059 () Bool)

(assert (=> d!62523 m!276059))

(assert (=> b!260202 m!275897))

(declare-fun m!276061 () Bool)

(assert (=> b!260203 m!276061))

(declare-fun m!276063 () Bool)

(assert (=> b!260204 m!276063))

(assert (=> start!24918 d!62523))

(declare-fun d!62525 () Bool)

(assert (=> d!62525 (= (inRange!0 index!297 (mask!11120 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260052 d!62525))

(declare-fun d!62527 () Bool)

(declare-fun e!168643 () Bool)

(assert (=> d!62527 e!168643))

(declare-fun res!127189 () Bool)

(assert (=> d!62527 (=> res!127189 e!168643)))

(declare-fun lt!131246 () Bool)

(assert (=> d!62527 (= res!127189 (not lt!131246))))

(declare-fun lt!131244 () Bool)

(assert (=> d!62527 (= lt!131246 lt!131244)))

(declare-fun lt!131245 () Unit!8056)

(declare-fun e!168642 () Unit!8056)

(assert (=> d!62527 (= lt!131245 e!168642)))

(declare-fun c!44202 () Bool)

(assert (=> d!62527 (= c!44202 lt!131244)))

(declare-fun containsKey!308 (List!3732 (_ BitVec 64)) Bool)

(assert (=> d!62527 (= lt!131244 (containsKey!308 (toList!1900 lt!131150) key!932))))

(assert (=> d!62527 (= (contains!1865 lt!131150 key!932) lt!131246)))

(declare-fun b!260211 () Bool)

(declare-fun lt!131247 () Unit!8056)

(assert (=> b!260211 (= e!168642 lt!131247)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!256 (List!3732 (_ BitVec 64)) Unit!8056)

(assert (=> b!260211 (= lt!131247 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131150) key!932))))

(declare-datatypes ((Option!323 0))(
  ( (Some!322 (v!5473 V!8473)) (None!321) )
))
(declare-fun isDefined!257 (Option!323) Bool)

(declare-fun getValueByKey!317 (List!3732 (_ BitVec 64)) Option!323)

(assert (=> b!260211 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131150) key!932))))

(declare-fun b!260212 () Bool)

(declare-fun Unit!8070 () Unit!8056)

(assert (=> b!260212 (= e!168642 Unit!8070)))

(declare-fun b!260213 () Bool)

(assert (=> b!260213 (= e!168643 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131150) key!932)))))

(assert (= (and d!62527 c!44202) b!260211))

(assert (= (and d!62527 (not c!44202)) b!260212))

(assert (= (and d!62527 (not res!127189)) b!260213))

(declare-fun m!276065 () Bool)

(assert (=> d!62527 m!276065))

(declare-fun m!276067 () Bool)

(assert (=> b!260211 m!276067))

(declare-fun m!276069 () Bool)

(assert (=> b!260211 m!276069))

(assert (=> b!260211 m!276069))

(declare-fun m!276071 () Bool)

(assert (=> b!260211 m!276071))

(assert (=> b!260213 m!276069))

(assert (=> b!260213 m!276069))

(assert (=> b!260213 m!276071))

(assert (=> b!260052 d!62527))

(declare-fun b!260256 () Bool)

(declare-fun e!168680 () ListLongMap!3769)

(declare-fun call!24795 () ListLongMap!3769)

(assert (=> b!260256 (= e!168680 (+!697 call!24795 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260257 () Bool)

(declare-fun e!168682 () Bool)

(declare-fun e!168674 () Bool)

(assert (=> b!260257 (= e!168682 e!168674)))

(declare-fun res!127216 () Bool)

(declare-fun call!24798 () Bool)

(assert (=> b!260257 (= res!127216 call!24798)))

(assert (=> b!260257 (=> (not res!127216) (not e!168674))))

(declare-fun bm!24792 () Bool)

(declare-fun call!24797 () ListLongMap!3769)

(assert (=> bm!24792 (= call!24797 call!24795)))

(declare-fun b!260259 () Bool)

(declare-fun e!168673 () Bool)

(declare-fun call!24800 () Bool)

(assert (=> b!260259 (= e!168673 (not call!24800))))

(declare-fun b!260260 () Bool)

(declare-fun e!168672 () ListLongMap!3769)

(assert (=> b!260260 (= e!168672 call!24797)))

(declare-fun b!260261 () Bool)

(declare-fun res!127211 () Bool)

(declare-fun e!168670 () Bool)

(assert (=> b!260261 (=> (not res!127211) (not e!168670))))

(assert (=> b!260261 (= res!127211 e!168673)))

(declare-fun c!44220 () Bool)

(assert (=> b!260261 (= c!44220 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260262 () Bool)

(assert (=> b!260262 (= e!168670 e!168682)))

(declare-fun c!44219 () Bool)

(assert (=> b!260262 (= c!44219 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260263 () Bool)

(declare-fun e!168671 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!260263 (= e!168671 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260264 () Bool)

(declare-fun res!127215 () Bool)

(assert (=> b!260264 (=> (not res!127215) (not e!168670))))

(declare-fun e!168679 () Bool)

(assert (=> b!260264 (= res!127215 e!168679)))

(declare-fun res!127208 () Bool)

(assert (=> b!260264 (=> res!127208 e!168679)))

(assert (=> b!260264 (= res!127208 (not e!168671))))

(declare-fun res!127209 () Bool)

(assert (=> b!260264 (=> (not res!127209) (not e!168671))))

(assert (=> b!260264 (= res!127209 (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260265 () Bool)

(assert (=> b!260265 (= e!168680 e!168672)))

(declare-fun c!44216 () Bool)

(assert (=> b!260265 (= c!44216 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260266 () Bool)

(assert (=> b!260266 (= e!168682 (not call!24798))))

(declare-fun b!260267 () Bool)

(declare-fun e!168675 () ListLongMap!3769)

(declare-fun call!24799 () ListLongMap!3769)

(assert (=> b!260267 (= e!168675 call!24799)))

(declare-fun bm!24793 () Bool)

(declare-fun call!24796 () ListLongMap!3769)

(assert (=> bm!24793 (= call!24799 call!24796)))

(declare-fun b!260268 () Bool)

(assert (=> b!260268 (= e!168675 call!24797)))

(declare-fun b!260269 () Bool)

(declare-fun e!168676 () Unit!8056)

(declare-fun Unit!8071 () Unit!8056)

(assert (=> b!260269 (= e!168676 Unit!8071)))

(declare-fun bm!24794 () Bool)

(declare-fun call!24801 () ListLongMap!3769)

(assert (=> bm!24794 (= call!24796 call!24801)))

(declare-fun bm!24795 () Bool)

(declare-fun lt!131301 () ListLongMap!3769)

(assert (=> bm!24795 (= call!24798 (contains!1865 lt!131301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260258 () Bool)

(declare-fun e!168677 () Bool)

(assert (=> b!260258 (= e!168673 e!168677)))

(declare-fun res!127214 () Bool)

(assert (=> b!260258 (= res!127214 call!24800)))

(assert (=> b!260258 (=> (not res!127214) (not e!168677))))

(declare-fun d!62529 () Bool)

(assert (=> d!62529 e!168670))

(declare-fun res!127210 () Bool)

(assert (=> d!62529 (=> (not res!127210) (not e!168670))))

(assert (=> d!62529 (= res!127210 (or (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))))

(declare-fun lt!131308 () ListLongMap!3769)

(assert (=> d!62529 (= lt!131301 lt!131308)))

(declare-fun lt!131296 () Unit!8056)

(assert (=> d!62529 (= lt!131296 e!168676)))

(declare-fun c!44217 () Bool)

(declare-fun e!168681 () Bool)

(assert (=> d!62529 (= c!44217 e!168681)))

(declare-fun res!127212 () Bool)

(assert (=> d!62529 (=> (not res!127212) (not e!168681))))

(assert (=> d!62529 (= res!127212 (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62529 (= lt!131308 e!168680)))

(declare-fun c!44218 () Bool)

(assert (=> d!62529 (= c!44218 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62529 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62529 (= (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131301)))

(declare-fun b!260270 () Bool)

(declare-fun e!168678 () Bool)

(declare-fun apply!258 (ListLongMap!3769 (_ BitVec 64)) V!8473)

(declare-fun get!3077 (ValueCell!2966 V!8473) V!8473)

(declare-fun dynLambda!601 (Int (_ BitVec 64)) V!8473)

(assert (=> b!260270 (= e!168678 (= (apply!258 lt!131301 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)) (get!3077 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6308 (_values!4777 thiss!1504))))))

(assert (=> b!260270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260271 () Bool)

(assert (=> b!260271 (= e!168681 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260272 () Bool)

(declare-fun c!44215 () Bool)

(assert (=> b!260272 (= c!44215 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260272 (= e!168672 e!168675)))

(declare-fun b!260273 () Bool)

(assert (=> b!260273 (= e!168677 (= (apply!258 lt!131301 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260274 () Bool)

(declare-fun lt!131310 () Unit!8056)

(assert (=> b!260274 (= e!168676 lt!131310)))

(declare-fun lt!131292 () ListLongMap!3769)

(declare-fun getCurrentListMapNoExtraKeys!574 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) Int) ListLongMap!3769)

(assert (=> b!260274 (= lt!131292 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131305 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131297 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131297 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131299 () Unit!8056)

(declare-fun addStillContains!234 (ListLongMap!3769 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8056)

(assert (=> b!260274 (= lt!131299 (addStillContains!234 lt!131292 lt!131305 (zeroValue!4635 thiss!1504) lt!131297))))

(assert (=> b!260274 (contains!1865 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) lt!131297)))

(declare-fun lt!131312 () Unit!8056)

(assert (=> b!260274 (= lt!131312 lt!131299)))

(declare-fun lt!131313 () ListLongMap!3769)

(assert (=> b!260274 (= lt!131313 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131293 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131293 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131302 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131302 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131300 () Unit!8056)

(declare-fun addApplyDifferent!234 (ListLongMap!3769 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8056)

(assert (=> b!260274 (= lt!131300 (addApplyDifferent!234 lt!131313 lt!131293 (minValue!4635 thiss!1504) lt!131302))))

(assert (=> b!260274 (= (apply!258 (+!697 lt!131313 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) lt!131302) (apply!258 lt!131313 lt!131302))))

(declare-fun lt!131309 () Unit!8056)

(assert (=> b!260274 (= lt!131309 lt!131300)))

(declare-fun lt!131303 () ListLongMap!3769)

(assert (=> b!260274 (= lt!131303 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131311 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131295 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131295 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131307 () Unit!8056)

(assert (=> b!260274 (= lt!131307 (addApplyDifferent!234 lt!131303 lt!131311 (zeroValue!4635 thiss!1504) lt!131295))))

(assert (=> b!260274 (= (apply!258 (+!697 lt!131303 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) lt!131295) (apply!258 lt!131303 lt!131295))))

(declare-fun lt!131304 () Unit!8056)

(assert (=> b!260274 (= lt!131304 lt!131307)))

(declare-fun lt!131294 () ListLongMap!3769)

(assert (=> b!260274 (= lt!131294 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131306 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131306 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131298 () (_ BitVec 64))

(assert (=> b!260274 (= lt!131298 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260274 (= lt!131310 (addApplyDifferent!234 lt!131294 lt!131306 (minValue!4635 thiss!1504) lt!131298))))

(assert (=> b!260274 (= (apply!258 (+!697 lt!131294 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) lt!131298) (apply!258 lt!131294 lt!131298))))

(declare-fun b!260275 () Bool)

(assert (=> b!260275 (= e!168679 e!168678)))

(declare-fun res!127213 () Bool)

(assert (=> b!260275 (=> (not res!127213) (not e!168678))))

(assert (=> b!260275 (= res!127213 (contains!1865 lt!131301 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260276 () Bool)

(assert (=> b!260276 (= e!168674 (= (apply!258 lt!131301 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun bm!24796 () Bool)

(assert (=> bm!24796 (= call!24795 (+!697 (ite c!44218 call!24801 (ite c!44216 call!24796 call!24799)) (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun bm!24797 () Bool)

(assert (=> bm!24797 (= call!24800 (contains!1865 lt!131301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24798 () Bool)

(assert (=> bm!24798 (= call!24801 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (= (and d!62529 c!44218) b!260256))

(assert (= (and d!62529 (not c!44218)) b!260265))

(assert (= (and b!260265 c!44216) b!260260))

(assert (= (and b!260265 (not c!44216)) b!260272))

(assert (= (and b!260272 c!44215) b!260268))

(assert (= (and b!260272 (not c!44215)) b!260267))

(assert (= (or b!260268 b!260267) bm!24793))

(assert (= (or b!260260 bm!24793) bm!24794))

(assert (= (or b!260260 b!260268) bm!24792))

(assert (= (or b!260256 bm!24794) bm!24798))

(assert (= (or b!260256 bm!24792) bm!24796))

(assert (= (and d!62529 res!127212) b!260271))

(assert (= (and d!62529 c!44217) b!260274))

(assert (= (and d!62529 (not c!44217)) b!260269))

(assert (= (and d!62529 res!127210) b!260264))

(assert (= (and b!260264 res!127209) b!260263))

(assert (= (and b!260264 (not res!127208)) b!260275))

(assert (= (and b!260275 res!127213) b!260270))

(assert (= (and b!260264 res!127215) b!260261))

(assert (= (and b!260261 c!44220) b!260258))

(assert (= (and b!260261 (not c!44220)) b!260259))

(assert (= (and b!260258 res!127214) b!260273))

(assert (= (or b!260258 b!260259) bm!24797))

(assert (= (and b!260261 res!127211) b!260262))

(assert (= (and b!260262 c!44219) b!260257))

(assert (= (and b!260262 (not c!44219)) b!260266))

(assert (= (and b!260257 res!127216) b!260276))

(assert (= (or b!260257 b!260266) bm!24795))

(declare-fun b_lambda!8281 () Bool)

(assert (=> (not b_lambda!8281) (not b!260270)))

(declare-fun t!8800 () Bool)

(declare-fun tb!3021 () Bool)

(assert (=> (and b!260059 (= (defaultEntry!4794 thiss!1504) (defaultEntry!4794 thiss!1504)) t!8800) tb!3021))

(declare-fun result!5401 () Bool)

(assert (=> tb!3021 (= result!5401 tp_is_empty!6619)))

(assert (=> b!260270 t!8800))

(declare-fun b_and!13883 () Bool)

(assert (= b_and!13877 (and (=> t!8800 result!5401) b_and!13883)))

(declare-fun m!276073 () Bool)

(assert (=> b!260256 m!276073))

(assert (=> b!260271 m!276055))

(assert (=> b!260271 m!276055))

(declare-fun m!276075 () Bool)

(assert (=> b!260271 m!276075))

(assert (=> d!62529 m!275875))

(assert (=> b!260263 m!276055))

(assert (=> b!260263 m!276055))

(assert (=> b!260263 m!276075))

(declare-fun m!276077 () Bool)

(assert (=> bm!24797 m!276077))

(assert (=> b!260274 m!276055))

(declare-fun m!276079 () Bool)

(assert (=> b!260274 m!276079))

(declare-fun m!276081 () Bool)

(assert (=> b!260274 m!276081))

(declare-fun m!276083 () Bool)

(assert (=> b!260274 m!276083))

(declare-fun m!276085 () Bool)

(assert (=> b!260274 m!276085))

(declare-fun m!276087 () Bool)

(assert (=> b!260274 m!276087))

(declare-fun m!276089 () Bool)

(assert (=> b!260274 m!276089))

(declare-fun m!276091 () Bool)

(assert (=> b!260274 m!276091))

(assert (=> b!260274 m!276091))

(declare-fun m!276093 () Bool)

(assert (=> b!260274 m!276093))

(declare-fun m!276095 () Bool)

(assert (=> b!260274 m!276095))

(declare-fun m!276097 () Bool)

(assert (=> b!260274 m!276097))

(assert (=> b!260274 m!276087))

(declare-fun m!276099 () Bool)

(assert (=> b!260274 m!276099))

(declare-fun m!276101 () Bool)

(assert (=> b!260274 m!276101))

(declare-fun m!276103 () Bool)

(assert (=> b!260274 m!276103))

(assert (=> b!260274 m!276101))

(declare-fun m!276105 () Bool)

(assert (=> b!260274 m!276105))

(declare-fun m!276107 () Bool)

(assert (=> b!260274 m!276107))

(assert (=> b!260274 m!276081))

(declare-fun m!276109 () Bool)

(assert (=> b!260274 m!276109))

(declare-fun m!276111 () Bool)

(assert (=> b!260273 m!276111))

(declare-fun m!276113 () Bool)

(assert (=> b!260270 m!276113))

(assert (=> b!260270 m!276055))

(declare-fun m!276115 () Bool)

(assert (=> b!260270 m!276115))

(assert (=> b!260270 m!276055))

(declare-fun m!276117 () Bool)

(assert (=> b!260270 m!276117))

(assert (=> b!260270 m!276113))

(assert (=> b!260270 m!276115))

(declare-fun m!276119 () Bool)

(assert (=> b!260270 m!276119))

(declare-fun m!276121 () Bool)

(assert (=> bm!24795 m!276121))

(assert (=> b!260275 m!276055))

(assert (=> b!260275 m!276055))

(declare-fun m!276123 () Bool)

(assert (=> b!260275 m!276123))

(declare-fun m!276125 () Bool)

(assert (=> bm!24796 m!276125))

(declare-fun m!276127 () Bool)

(assert (=> b!260276 m!276127))

(assert (=> bm!24798 m!276095))

(assert (=> b!260052 d!62529))

(declare-fun d!62531 () Bool)

(assert (=> d!62531 (= (inRange!0 (ite c!44173 (index!6762 lt!131143) (index!6765 lt!131143)) (mask!11120 thiss!1504)) (and (bvsge (ite c!44173 (index!6762 lt!131143) (index!6765 lt!131143)) #b00000000000000000000000000000000) (bvslt (ite c!44173 (index!6762 lt!131143) (index!6765 lt!131143)) (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24765 d!62531))

(declare-fun d!62533 () Bool)

(declare-fun e!168685 () Bool)

(assert (=> d!62533 e!168685))

(declare-fun res!127222 () Bool)

(assert (=> d!62533 (=> (not res!127222) (not e!168685))))

(declare-fun lt!131319 () SeekEntryResult!1148)

(assert (=> d!62533 (= res!127222 ((_ is Found!1148) lt!131319))))

(assert (=> d!62533 (= lt!131319 (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun lt!131318 () Unit!8056)

(declare-fun choose!1271 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8056)

(assert (=> d!62533 (= lt!131318 (choose!1271 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62533 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62533 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) lt!131318)))

(declare-fun b!260283 () Bool)

(declare-fun res!127221 () Bool)

(assert (=> b!260283 (=> (not res!127221) (not e!168685))))

(assert (=> b!260283 (= res!127221 (inRange!0 (index!6763 lt!131319) (mask!11120 thiss!1504)))))

(declare-fun b!260284 () Bool)

(assert (=> b!260284 (= e!168685 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6763 lt!131319)) key!932))))

(assert (=> b!260284 (and (bvsge (index!6763 lt!131319) #b00000000000000000000000000000000) (bvslt (index!6763 lt!131319) (size!6309 (_keys!6974 thiss!1504))))))

(assert (= (and d!62533 res!127222) b!260283))

(assert (= (and b!260283 res!127221) b!260284))

(assert (=> d!62533 m!275917))

(declare-fun m!276129 () Bool)

(assert (=> d!62533 m!276129))

(assert (=> d!62533 m!275875))

(declare-fun m!276131 () Bool)

(assert (=> b!260283 m!276131))

(declare-fun m!276133 () Bool)

(assert (=> b!260284 m!276133))

(assert (=> b!260051 d!62533))

(declare-fun d!62535 () Bool)

(declare-fun e!168688 () Bool)

(assert (=> d!62535 e!168688))

(declare-fun res!127227 () Bool)

(assert (=> d!62535 (=> (not res!127227) (not e!168688))))

(declare-fun lt!131330 () ListLongMap!3769)

(assert (=> d!62535 (= res!127227 (contains!1865 lt!131330 (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lt!131329 () List!3732)

(assert (=> d!62535 (= lt!131330 (ListLongMap!3770 lt!131329))))

(declare-fun lt!131331 () Unit!8056)

(declare-fun lt!131328 () Unit!8056)

(assert (=> d!62535 (= lt!131331 lt!131328)))

(assert (=> d!62535 (= (getValueByKey!317 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346))) (Some!322 (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!173 (List!3732 (_ BitVec 64) V!8473) Unit!8056)

(assert (=> d!62535 (= lt!131328 (lemmaContainsTupThenGetReturnValue!173 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun insertStrictlySorted!176 (List!3732 (_ BitVec 64) V!8473) List!3732)

(assert (=> d!62535 (= lt!131329 (insertStrictlySorted!176 (toList!1900 lt!131150) (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!62535 (= (+!697 lt!131150 (tuple2!4855 key!932 v!346)) lt!131330)))

(declare-fun b!260289 () Bool)

(declare-fun res!127228 () Bool)

(assert (=> b!260289 (=> (not res!127228) (not e!168688))))

(assert (=> b!260289 (= res!127228 (= (getValueByKey!317 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346))) (Some!322 (_2!2438 (tuple2!4855 key!932 v!346)))))))

(declare-fun b!260290 () Bool)

(declare-fun contains!1868 (List!3732 tuple2!4854) Bool)

(assert (=> b!260290 (= e!168688 (contains!1868 (toList!1900 lt!131330) (tuple2!4855 key!932 v!346)))))

(assert (= (and d!62535 res!127227) b!260289))

(assert (= (and b!260289 res!127228) b!260290))

(declare-fun m!276135 () Bool)

(assert (=> d!62535 m!276135))

(declare-fun m!276137 () Bool)

(assert (=> d!62535 m!276137))

(declare-fun m!276139 () Bool)

(assert (=> d!62535 m!276139))

(declare-fun m!276141 () Bool)

(assert (=> d!62535 m!276141))

(declare-fun m!276143 () Bool)

(assert (=> b!260289 m!276143))

(declare-fun m!276145 () Bool)

(assert (=> b!260290 m!276145))

(assert (=> b!260063 d!62535))

(declare-fun b!260302 () Bool)

(declare-fun e!168694 () Bool)

(assert (=> b!260302 (= e!168694 (= (arrayCountValidKeys!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!260299 () Bool)

(declare-fun res!127237 () Bool)

(declare-fun e!168693 () Bool)

(assert (=> b!260299 (=> (not res!127237) (not e!168693))))

(assert (=> b!260299 (= res!127237 (not (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) index!297))))))

(declare-fun d!62537 () Bool)

(assert (=> d!62537 e!168694))

(declare-fun res!127238 () Bool)

(assert (=> d!62537 (=> (not res!127238) (not e!168694))))

(assert (=> d!62537 (= res!127238 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 (_keys!6974 thiss!1504)))))))

(declare-fun lt!131334 () Unit!8056)

(declare-fun choose!1 (array!12591 (_ BitVec 32) (_ BitVec 64)) Unit!8056)

(assert (=> d!62537 (= lt!131334 (choose!1 (_keys!6974 thiss!1504) index!297 key!932))))

(assert (=> d!62537 e!168693))

(declare-fun res!127240 () Bool)

(assert (=> d!62537 (=> (not res!127240) (not e!168693))))

(assert (=> d!62537 (= res!127240 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 (_keys!6974 thiss!1504)))))))

(assert (=> d!62537 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6974 thiss!1504) index!297 key!932) lt!131334)))

(declare-fun b!260300 () Bool)

(declare-fun res!127239 () Bool)

(assert (=> b!260300 (=> (not res!127239) (not e!168693))))

(assert (=> b!260300 (= res!127239 (validKeyInArray!0 key!932))))

(declare-fun b!260301 () Bool)

(assert (=> b!260301 (= e!168693 (bvslt (size!6309 (_keys!6974 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!62537 res!127240) b!260299))

(assert (= (and b!260299 res!127237) b!260300))

(assert (= (and b!260300 res!127239) b!260301))

(assert (= (and d!62537 res!127238) b!260302))

(assert (=> b!260302 m!275895))

(declare-fun m!276147 () Bool)

(assert (=> b!260302 m!276147))

(assert (=> b!260302 m!275897))

(declare-fun m!276149 () Bool)

(assert (=> b!260299 m!276149))

(assert (=> b!260299 m!276149))

(declare-fun m!276151 () Bool)

(assert (=> b!260299 m!276151))

(declare-fun m!276153 () Bool)

(assert (=> d!62537 m!276153))

(declare-fun m!276155 () Bool)

(assert (=> b!260300 m!276155))

(assert (=> b!260063 d!62537))

(declare-fun bm!24801 () Bool)

(declare-fun call!24804 () Bool)

(declare-fun c!44223 () Bool)

(assert (=> bm!24801 (= call!24804 (arrayNoDuplicates!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44223 (Cons!3729 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun b!260313 () Bool)

(declare-fun e!168705 () Bool)

(declare-fun e!168703 () Bool)

(assert (=> b!260313 (= e!168705 e!168703)))

(assert (=> b!260313 (= c!44223 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260315 () Bool)

(declare-fun e!168706 () Bool)

(declare-fun contains!1869 (List!3733 (_ BitVec 64)) Bool)

(assert (=> b!260315 (= e!168706 (contains!1869 Nil!3730 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260316 () Bool)

(assert (=> b!260316 (= e!168703 call!24804)))

(declare-fun b!260317 () Bool)

(declare-fun e!168704 () Bool)

(assert (=> b!260317 (= e!168704 e!168705)))

(declare-fun res!127249 () Bool)

(assert (=> b!260317 (=> (not res!127249) (not e!168705))))

(assert (=> b!260317 (= res!127249 (not e!168706))))

(declare-fun res!127247 () Bool)

(assert (=> b!260317 (=> (not res!127247) (not e!168706))))

(assert (=> b!260317 (= res!127247 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260314 () Bool)

(assert (=> b!260314 (= e!168703 call!24804)))

(declare-fun d!62539 () Bool)

(declare-fun res!127248 () Bool)

(assert (=> d!62539 (=> res!127248 e!168704)))

(assert (=> d!62539 (= res!127248 (bvsge #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (=> d!62539 (= (arrayNoDuplicates!0 lt!131140 #b00000000000000000000000000000000 Nil!3730) e!168704)))

(assert (= (and d!62539 (not res!127248)) b!260317))

(assert (= (and b!260317 res!127247) b!260315))

(assert (= (and b!260317 res!127249) b!260313))

(assert (= (and b!260313 c!44223) b!260314))

(assert (= (and b!260313 (not c!44223)) b!260316))

(assert (= (or b!260314 b!260316) bm!24801))

(declare-fun m!276157 () Bool)

(assert (=> bm!24801 m!276157))

(declare-fun m!276159 () Bool)

(assert (=> bm!24801 m!276159))

(assert (=> b!260313 m!276157))

(assert (=> b!260313 m!276157))

(declare-fun m!276161 () Bool)

(assert (=> b!260313 m!276161))

(assert (=> b!260315 m!276157))

(assert (=> b!260315 m!276157))

(declare-fun m!276163 () Bool)

(assert (=> b!260315 m!276163))

(assert (=> b!260317 m!276157))

(assert (=> b!260317 m!276157))

(assert (=> b!260317 m!276161))

(assert (=> b!260063 d!62539))

(declare-fun b!260326 () Bool)

(declare-fun e!168712 () (_ BitVec 32))

(declare-fun e!168711 () (_ BitVec 32))

(assert (=> b!260326 (= e!168712 e!168711)))

(declare-fun c!44229 () Bool)

(assert (=> b!260326 (= c!44229 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun d!62541 () Bool)

(declare-fun lt!131337 () (_ BitVec 32))

(assert (=> d!62541 (and (bvsge lt!131337 #b00000000000000000000000000000000) (bvsle lt!131337 (bvsub (size!6309 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> d!62541 (= lt!131337 e!168712)))

(declare-fun c!44228 () Bool)

(assert (=> d!62541 (= c!44228 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62541 (and (bvsle #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6309 (_keys!6974 thiss!1504)) (size!6309 lt!131140)))))

(assert (=> d!62541 (= (arrayCountValidKeys!0 lt!131140 #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) lt!131337)))

(declare-fun bm!24804 () Bool)

(declare-fun call!24807 () (_ BitVec 32))

(assert (=> bm!24804 (= call!24807 (arrayCountValidKeys!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260327 () Bool)

(assert (=> b!260327 (= e!168711 (bvadd #b00000000000000000000000000000001 call!24807))))

(declare-fun b!260328 () Bool)

(assert (=> b!260328 (= e!168712 #b00000000000000000000000000000000)))

(declare-fun b!260329 () Bool)

(assert (=> b!260329 (= e!168711 call!24807)))

(assert (= (and d!62541 c!44228) b!260328))

(assert (= (and d!62541 (not c!44228)) b!260326))

(assert (= (and b!260326 c!44229) b!260327))

(assert (= (and b!260326 (not c!44229)) b!260329))

(assert (= (or b!260327 b!260329) bm!24804))

(assert (=> b!260326 m!276157))

(assert (=> b!260326 m!276157))

(assert (=> b!260326 m!276161))

(declare-fun m!276165 () Bool)

(assert (=> bm!24804 m!276165))

(assert (=> b!260063 d!62541))

(declare-fun d!62543 () Bool)

(declare-fun e!168715 () Bool)

(assert (=> d!62543 e!168715))

(declare-fun res!127252 () Bool)

(assert (=> d!62543 (=> (not res!127252) (not e!168715))))

(assert (=> d!62543 (= res!127252 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 (_keys!6974 thiss!1504))) (bvslt index!297 (size!6308 (_values!4777 thiss!1504)))))))

(declare-fun lt!131340 () Unit!8056)

(declare-fun choose!1272 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) (_ BitVec 64) V!8473 Int) Unit!8056)

(assert (=> d!62543 (= lt!131340 (choose!1272 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62543 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62543 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!112 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)) lt!131340)))

(declare-fun b!260332 () Bool)

(assert (=> b!260332 (= e!168715 (= (+!697 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4855 key!932 v!346)) (getCurrentListMap!1432 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))))))

(assert (= (and d!62543 res!127252) b!260332))

(declare-fun m!276167 () Bool)

(assert (=> d!62543 m!276167))

(assert (=> d!62543 m!275875))

(assert (=> b!260332 m!275867))

(assert (=> b!260332 m!275895))

(assert (=> b!260332 m!275881))

(assert (=> b!260332 m!275867))

(declare-fun m!276169 () Bool)

(assert (=> b!260332 m!276169))

(declare-fun m!276171 () Bool)

(assert (=> b!260332 m!276171))

(assert (=> b!260063 d!62543))

(declare-fun d!62545 () Bool)

(assert (=> d!62545 (= (validMask!0 (mask!11120 thiss!1504)) (and (or (= (mask!11120 thiss!1504) #b00000000000000000000000000000111) (= (mask!11120 thiss!1504) #b00000000000000000000000000001111) (= (mask!11120 thiss!1504) #b00000000000000000000000000011111) (= (mask!11120 thiss!1504) #b00000000000000000000000000111111) (= (mask!11120 thiss!1504) #b00000000000000000000000001111111) (= (mask!11120 thiss!1504) #b00000000000000000000000011111111) (= (mask!11120 thiss!1504) #b00000000000000000000000111111111) (= (mask!11120 thiss!1504) #b00000000000000000000001111111111) (= (mask!11120 thiss!1504) #b00000000000000000000011111111111) (= (mask!11120 thiss!1504) #b00000000000000000000111111111111) (= (mask!11120 thiss!1504) #b00000000000000000001111111111111) (= (mask!11120 thiss!1504) #b00000000000000000011111111111111) (= (mask!11120 thiss!1504) #b00000000000000000111111111111111) (= (mask!11120 thiss!1504) #b00000000000000001111111111111111) (= (mask!11120 thiss!1504) #b00000000000000011111111111111111) (= (mask!11120 thiss!1504) #b00000000000000111111111111111111) (= (mask!11120 thiss!1504) #b00000000000001111111111111111111) (= (mask!11120 thiss!1504) #b00000000000011111111111111111111) (= (mask!11120 thiss!1504) #b00000000000111111111111111111111) (= (mask!11120 thiss!1504) #b00000000001111111111111111111111) (= (mask!11120 thiss!1504) #b00000000011111111111111111111111) (= (mask!11120 thiss!1504) #b00000000111111111111111111111111) (= (mask!11120 thiss!1504) #b00000001111111111111111111111111) (= (mask!11120 thiss!1504) #b00000011111111111111111111111111) (= (mask!11120 thiss!1504) #b00000111111111111111111111111111) (= (mask!11120 thiss!1504) #b00001111111111111111111111111111) (= (mask!11120 thiss!1504) #b00011111111111111111111111111111) (= (mask!11120 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11120 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!260063 d!62545))

(declare-fun b!260333 () Bool)

(declare-fun e!168717 () (_ BitVec 32))

(declare-fun e!168716 () (_ BitVec 32))

(assert (=> b!260333 (= e!168717 e!168716)))

(declare-fun c!44231 () Bool)

(assert (=> b!260333 (= c!44231 (validKeyInArray!0 (select (arr!5960 lt!131140) index!297)))))

(declare-fun d!62547 () Bool)

(declare-fun lt!131341 () (_ BitVec 32))

(assert (=> d!62547 (and (bvsge lt!131341 #b00000000000000000000000000000000) (bvsle lt!131341 (bvsub (size!6309 lt!131140) index!297)))))

(assert (=> d!62547 (= lt!131341 e!168717)))

(declare-fun c!44230 () Bool)

(assert (=> d!62547 (= c!44230 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62547 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6309 lt!131140)))))

(assert (=> d!62547 (= (arrayCountValidKeys!0 lt!131140 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131341)))

(declare-fun bm!24805 () Bool)

(declare-fun call!24808 () (_ BitVec 32))

(assert (=> bm!24805 (= call!24808 (arrayCountValidKeys!0 lt!131140 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!260334 () Bool)

(assert (=> b!260334 (= e!168716 (bvadd #b00000000000000000000000000000001 call!24808))))

(declare-fun b!260335 () Bool)

(assert (=> b!260335 (= e!168717 #b00000000000000000000000000000000)))

(declare-fun b!260336 () Bool)

(assert (=> b!260336 (= e!168716 call!24808)))

(assert (= (and d!62547 c!44230) b!260335))

(assert (= (and d!62547 (not c!44230)) b!260333))

(assert (= (and b!260333 c!44231) b!260334))

(assert (= (and b!260333 (not c!44231)) b!260336))

(assert (= (or b!260334 b!260336) bm!24805))

(declare-fun m!276173 () Bool)

(assert (=> b!260333 m!276173))

(assert (=> b!260333 m!276173))

(declare-fun m!276175 () Bool)

(assert (=> b!260333 m!276175))

(declare-fun m!276177 () Bool)

(assert (=> bm!24805 m!276177))

(assert (=> b!260063 d!62547))

(declare-fun b!260337 () Bool)

(declare-fun e!168728 () ListLongMap!3769)

(declare-fun call!24809 () ListLongMap!3769)

(assert (=> b!260337 (= e!168728 (+!697 call!24809 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260338 () Bool)

(declare-fun e!168730 () Bool)

(declare-fun e!168722 () Bool)

(assert (=> b!260338 (= e!168730 e!168722)))

(declare-fun res!127261 () Bool)

(declare-fun call!24812 () Bool)

(assert (=> b!260338 (= res!127261 call!24812)))

(assert (=> b!260338 (=> (not res!127261) (not e!168722))))

(declare-fun bm!24806 () Bool)

(declare-fun call!24811 () ListLongMap!3769)

(assert (=> bm!24806 (= call!24811 call!24809)))

(declare-fun b!260340 () Bool)

(declare-fun e!168721 () Bool)

(declare-fun call!24814 () Bool)

(assert (=> b!260340 (= e!168721 (not call!24814))))

(declare-fun b!260341 () Bool)

(declare-fun e!168720 () ListLongMap!3769)

(assert (=> b!260341 (= e!168720 call!24811)))

(declare-fun b!260342 () Bool)

(declare-fun res!127256 () Bool)

(declare-fun e!168718 () Bool)

(assert (=> b!260342 (=> (not res!127256) (not e!168718))))

(assert (=> b!260342 (= res!127256 e!168721)))

(declare-fun c!44237 () Bool)

(assert (=> b!260342 (= c!44237 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260343 () Bool)

(assert (=> b!260343 (= e!168718 e!168730)))

(declare-fun c!44236 () Bool)

(assert (=> b!260343 (= c!44236 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260344 () Bool)

(declare-fun e!168719 () Bool)

(assert (=> b!260344 (= e!168719 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260345 () Bool)

(declare-fun res!127260 () Bool)

(assert (=> b!260345 (=> (not res!127260) (not e!168718))))

(declare-fun e!168727 () Bool)

(assert (=> b!260345 (= res!127260 e!168727)))

(declare-fun res!127253 () Bool)

(assert (=> b!260345 (=> res!127253 e!168727)))

(assert (=> b!260345 (= res!127253 (not e!168719))))

(declare-fun res!127254 () Bool)

(assert (=> b!260345 (=> (not res!127254) (not e!168719))))

(assert (=> b!260345 (= res!127254 (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(declare-fun b!260346 () Bool)

(assert (=> b!260346 (= e!168728 e!168720)))

(declare-fun c!44233 () Bool)

(assert (=> b!260346 (= c!44233 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260347 () Bool)

(assert (=> b!260347 (= e!168730 (not call!24812))))

(declare-fun b!260348 () Bool)

(declare-fun e!168723 () ListLongMap!3769)

(declare-fun call!24813 () ListLongMap!3769)

(assert (=> b!260348 (= e!168723 call!24813)))

(declare-fun bm!24807 () Bool)

(declare-fun call!24810 () ListLongMap!3769)

(assert (=> bm!24807 (= call!24813 call!24810)))

(declare-fun b!260349 () Bool)

(assert (=> b!260349 (= e!168723 call!24811)))

(declare-fun b!260350 () Bool)

(declare-fun e!168724 () Unit!8056)

(declare-fun Unit!8072 () Unit!8056)

(assert (=> b!260350 (= e!168724 Unit!8072)))

(declare-fun bm!24808 () Bool)

(declare-fun call!24815 () ListLongMap!3769)

(assert (=> bm!24808 (= call!24810 call!24815)))

(declare-fun bm!24809 () Bool)

(declare-fun lt!131351 () ListLongMap!3769)

(assert (=> bm!24809 (= call!24812 (contains!1865 lt!131351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260339 () Bool)

(declare-fun e!168725 () Bool)

(assert (=> b!260339 (= e!168721 e!168725)))

(declare-fun res!127259 () Bool)

(assert (=> b!260339 (= res!127259 call!24814)))

(assert (=> b!260339 (=> (not res!127259) (not e!168725))))

(declare-fun d!62549 () Bool)

(assert (=> d!62549 e!168718))

(declare-fun res!127255 () Bool)

(assert (=> d!62549 (=> (not res!127255) (not e!168718))))

(assert (=> d!62549 (= res!127255 (or (bvsge #b00000000000000000000000000000000 (size!6309 lt!131140)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))))

(declare-fun lt!131358 () ListLongMap!3769)

(assert (=> d!62549 (= lt!131351 lt!131358)))

(declare-fun lt!131346 () Unit!8056)

(assert (=> d!62549 (= lt!131346 e!168724)))

(declare-fun c!44234 () Bool)

(declare-fun e!168729 () Bool)

(assert (=> d!62549 (= c!44234 e!168729)))

(declare-fun res!127257 () Bool)

(assert (=> d!62549 (=> (not res!127257) (not e!168729))))

(assert (=> d!62549 (= res!127257 (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (=> d!62549 (= lt!131358 e!168728)))

(declare-fun c!44235 () Bool)

(assert (=> d!62549 (= c!44235 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62549 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62549 (= (getCurrentListMap!1432 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131351)))

(declare-fun b!260351 () Bool)

(declare-fun e!168726 () Bool)

(assert (=> b!260351 (= e!168726 (= (apply!258 lt!131351 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6308 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))))))))

(assert (=> b!260351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(declare-fun b!260352 () Bool)

(assert (=> b!260352 (= e!168729 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260353 () Bool)

(declare-fun c!44232 () Bool)

(assert (=> b!260353 (= c!44232 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260353 (= e!168720 e!168723)))

(declare-fun b!260354 () Bool)

(assert (=> b!260354 (= e!168725 (= (apply!258 lt!131351 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260355 () Bool)

(declare-fun lt!131360 () Unit!8056)

(assert (=> b!260355 (= e!168724 lt!131360)))

(declare-fun lt!131342 () ListLongMap!3769)

(assert (=> b!260355 (= lt!131342 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131355 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131347 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131347 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(declare-fun lt!131349 () Unit!8056)

(assert (=> b!260355 (= lt!131349 (addStillContains!234 lt!131342 lt!131355 (zeroValue!4635 thiss!1504) lt!131347))))

(assert (=> b!260355 (contains!1865 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) lt!131347)))

(declare-fun lt!131362 () Unit!8056)

(assert (=> b!260355 (= lt!131362 lt!131349)))

(declare-fun lt!131363 () ListLongMap!3769)

(assert (=> b!260355 (= lt!131363 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131343 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131343 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131352 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131352 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(declare-fun lt!131350 () Unit!8056)

(assert (=> b!260355 (= lt!131350 (addApplyDifferent!234 lt!131363 lt!131343 (minValue!4635 thiss!1504) lt!131352))))

(assert (=> b!260355 (= (apply!258 (+!697 lt!131363 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) lt!131352) (apply!258 lt!131363 lt!131352))))

(declare-fun lt!131359 () Unit!8056)

(assert (=> b!260355 (= lt!131359 lt!131350)))

(declare-fun lt!131353 () ListLongMap!3769)

(assert (=> b!260355 (= lt!131353 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131361 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131345 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131345 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(declare-fun lt!131357 () Unit!8056)

(assert (=> b!260355 (= lt!131357 (addApplyDifferent!234 lt!131353 lt!131361 (zeroValue!4635 thiss!1504) lt!131345))))

(assert (=> b!260355 (= (apply!258 (+!697 lt!131353 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) lt!131345) (apply!258 lt!131353 lt!131345))))

(declare-fun lt!131354 () Unit!8056)

(assert (=> b!260355 (= lt!131354 lt!131357)))

(declare-fun lt!131344 () ListLongMap!3769)

(assert (=> b!260355 (= lt!131344 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131356 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131356 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131348 () (_ BitVec 64))

(assert (=> b!260355 (= lt!131348 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(assert (=> b!260355 (= lt!131360 (addApplyDifferent!234 lt!131344 lt!131356 (minValue!4635 thiss!1504) lt!131348))))

(assert (=> b!260355 (= (apply!258 (+!697 lt!131344 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) lt!131348) (apply!258 lt!131344 lt!131348))))

(declare-fun b!260356 () Bool)

(assert (=> b!260356 (= e!168727 e!168726)))

(declare-fun res!127258 () Bool)

(assert (=> b!260356 (=> (not res!127258) (not e!168726))))

(assert (=> b!260356 (= res!127258 (contains!1865 lt!131351 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> b!260356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(declare-fun b!260357 () Bool)

(assert (=> b!260357 (= e!168722 (= (apply!258 lt!131351 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun bm!24810 () Bool)

(assert (=> bm!24810 (= call!24809 (+!697 (ite c!44235 call!24815 (ite c!44233 call!24810 call!24813)) (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun bm!24811 () Bool)

(assert (=> bm!24811 (= call!24814 (contains!1865 lt!131351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24812 () Bool)

(assert (=> bm!24812 (= call!24815 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (= (and d!62549 c!44235) b!260337))

(assert (= (and d!62549 (not c!44235)) b!260346))

(assert (= (and b!260346 c!44233) b!260341))

(assert (= (and b!260346 (not c!44233)) b!260353))

(assert (= (and b!260353 c!44232) b!260349))

(assert (= (and b!260353 (not c!44232)) b!260348))

(assert (= (or b!260349 b!260348) bm!24807))

(assert (= (or b!260341 bm!24807) bm!24808))

(assert (= (or b!260341 b!260349) bm!24806))

(assert (= (or b!260337 bm!24808) bm!24812))

(assert (= (or b!260337 bm!24806) bm!24810))

(assert (= (and d!62549 res!127257) b!260352))

(assert (= (and d!62549 c!44234) b!260355))

(assert (= (and d!62549 (not c!44234)) b!260350))

(assert (= (and d!62549 res!127255) b!260345))

(assert (= (and b!260345 res!127254) b!260344))

(assert (= (and b!260345 (not res!127253)) b!260356))

(assert (= (and b!260356 res!127258) b!260351))

(assert (= (and b!260345 res!127260) b!260342))

(assert (= (and b!260342 c!44237) b!260339))

(assert (= (and b!260342 (not c!44237)) b!260340))

(assert (= (and b!260339 res!127259) b!260354))

(assert (= (or b!260339 b!260340) bm!24811))

(assert (= (and b!260342 res!127256) b!260343))

(assert (= (and b!260343 c!44236) b!260338))

(assert (= (and b!260343 (not c!44236)) b!260347))

(assert (= (and b!260338 res!127261) b!260357))

(assert (= (or b!260338 b!260347) bm!24809))

(declare-fun b_lambda!8283 () Bool)

(assert (=> (not b_lambda!8283) (not b!260351)))

(assert (=> b!260351 t!8800))

(declare-fun b_and!13885 () Bool)

(assert (= b_and!13883 (and (=> t!8800 result!5401) b_and!13885)))

(declare-fun m!276179 () Bool)

(assert (=> b!260337 m!276179))

(assert (=> b!260352 m!276157))

(assert (=> b!260352 m!276157))

(assert (=> b!260352 m!276161))

(assert (=> d!62549 m!275875))

(assert (=> b!260344 m!276157))

(assert (=> b!260344 m!276157))

(assert (=> b!260344 m!276161))

(declare-fun m!276181 () Bool)

(assert (=> bm!24811 m!276181))

(assert (=> b!260355 m!276157))

(declare-fun m!276183 () Bool)

(assert (=> b!260355 m!276183))

(declare-fun m!276185 () Bool)

(assert (=> b!260355 m!276185))

(declare-fun m!276187 () Bool)

(assert (=> b!260355 m!276187))

(declare-fun m!276189 () Bool)

(assert (=> b!260355 m!276189))

(declare-fun m!276191 () Bool)

(assert (=> b!260355 m!276191))

(declare-fun m!276193 () Bool)

(assert (=> b!260355 m!276193))

(declare-fun m!276195 () Bool)

(assert (=> b!260355 m!276195))

(assert (=> b!260355 m!276195))

(declare-fun m!276197 () Bool)

(assert (=> b!260355 m!276197))

(declare-fun m!276199 () Bool)

(assert (=> b!260355 m!276199))

(declare-fun m!276201 () Bool)

(assert (=> b!260355 m!276201))

(assert (=> b!260355 m!276191))

(declare-fun m!276203 () Bool)

(assert (=> b!260355 m!276203))

(declare-fun m!276205 () Bool)

(assert (=> b!260355 m!276205))

(declare-fun m!276207 () Bool)

(assert (=> b!260355 m!276207))

(assert (=> b!260355 m!276205))

(declare-fun m!276209 () Bool)

(assert (=> b!260355 m!276209))

(declare-fun m!276211 () Bool)

(assert (=> b!260355 m!276211))

(assert (=> b!260355 m!276185))

(declare-fun m!276213 () Bool)

(assert (=> b!260355 m!276213))

(declare-fun m!276215 () Bool)

(assert (=> b!260354 m!276215))

(declare-fun m!276217 () Bool)

(assert (=> b!260351 m!276217))

(assert (=> b!260351 m!276157))

(assert (=> b!260351 m!276115))

(assert (=> b!260351 m!276157))

(declare-fun m!276219 () Bool)

(assert (=> b!260351 m!276219))

(assert (=> b!260351 m!276217))

(assert (=> b!260351 m!276115))

(declare-fun m!276221 () Bool)

(assert (=> b!260351 m!276221))

(declare-fun m!276223 () Bool)

(assert (=> bm!24809 m!276223))

(assert (=> b!260356 m!276157))

(assert (=> b!260356 m!276157))

(declare-fun m!276225 () Bool)

(assert (=> b!260356 m!276225))

(declare-fun m!276227 () Bool)

(assert (=> bm!24810 m!276227))

(declare-fun m!276229 () Bool)

(assert (=> b!260357 m!276229))

(assert (=> bm!24812 m!276199))

(assert (=> b!260063 d!62549))

(declare-fun b!260366 () Bool)

(declare-fun e!168739 () Bool)

(declare-fun call!24818 () Bool)

(assert (=> b!260366 (= e!168739 call!24818)))

(declare-fun b!260367 () Bool)

(declare-fun e!168738 () Bool)

(assert (=> b!260367 (= e!168738 call!24818)))

(declare-fun b!260368 () Bool)

(assert (=> b!260368 (= e!168738 e!168739)))

(declare-fun lt!131372 () (_ BitVec 64))

(assert (=> b!260368 (= lt!131372 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(declare-fun lt!131370 () Unit!8056)

(assert (=> b!260368 (= lt!131370 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131140 lt!131372 #b00000000000000000000000000000000))))

(assert (=> b!260368 (arrayContainsKey!0 lt!131140 lt!131372 #b00000000000000000000000000000000)))

(declare-fun lt!131371 () Unit!8056)

(assert (=> b!260368 (= lt!131371 lt!131370)))

(declare-fun res!127266 () Bool)

(assert (=> b!260368 (= res!127266 (= (seekEntryOrOpen!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) lt!131140 (mask!11120 thiss!1504)) (Found!1148 #b00000000000000000000000000000000)))))

(assert (=> b!260368 (=> (not res!127266) (not e!168739))))

(declare-fun b!260369 () Bool)

(declare-fun e!168737 () Bool)

(assert (=> b!260369 (= e!168737 e!168738)))

(declare-fun c!44240 () Bool)

(assert (=> b!260369 (= c!44240 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun bm!24815 () Bool)

(assert (=> bm!24815 (= call!24818 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131140 (mask!11120 thiss!1504)))))

(declare-fun d!62551 () Bool)

(declare-fun res!127267 () Bool)

(assert (=> d!62551 (=> res!127267 e!168737)))

(assert (=> d!62551 (= res!127267 (bvsge #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (=> d!62551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131140 (mask!11120 thiss!1504)) e!168737)))

(assert (= (and d!62551 (not res!127267)) b!260369))

(assert (= (and b!260369 c!44240) b!260368))

(assert (= (and b!260369 (not c!44240)) b!260367))

(assert (= (and b!260368 res!127266) b!260366))

(assert (= (or b!260366 b!260367) bm!24815))

(assert (=> b!260368 m!276157))

(declare-fun m!276231 () Bool)

(assert (=> b!260368 m!276231))

(declare-fun m!276233 () Bool)

(assert (=> b!260368 m!276233))

(assert (=> b!260368 m!276157))

(declare-fun m!276235 () Bool)

(assert (=> b!260368 m!276235))

(assert (=> b!260369 m!276157))

(assert (=> b!260369 m!276157))

(assert (=> b!260369 m!276161))

(declare-fun m!276237 () Bool)

(assert (=> bm!24815 m!276237))

(assert (=> b!260063 d!62551))

(declare-fun d!62553 () Bool)

(assert (=> d!62553 (arrayContainsKey!0 lt!131140 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131375 () Unit!8056)

(declare-fun choose!13 (array!12591 (_ BitVec 64) (_ BitVec 32)) Unit!8056)

(assert (=> d!62553 (= lt!131375 (choose!13 lt!131140 key!932 index!297))))

(assert (=> d!62553 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62553 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131140 key!932 index!297) lt!131375)))

(declare-fun bs!9182 () Bool)

(assert (= bs!9182 d!62553))

(assert (=> bs!9182 m!275909))

(declare-fun m!276239 () Bool)

(assert (=> bs!9182 m!276239))

(assert (=> b!260063 d!62553))

(declare-fun d!62555 () Bool)

(declare-fun res!127268 () Bool)

(declare-fun e!168740 () Bool)

(assert (=> d!62555 (=> res!127268 e!168740)))

(assert (=> d!62555 (= res!127268 (= (select (arr!5960 lt!131140) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62555 (= (arrayContainsKey!0 lt!131140 key!932 #b00000000000000000000000000000000) e!168740)))

(declare-fun b!260370 () Bool)

(declare-fun e!168741 () Bool)

(assert (=> b!260370 (= e!168740 e!168741)))

(declare-fun res!127269 () Bool)

(assert (=> b!260370 (=> (not res!127269) (not e!168741))))

(assert (=> b!260370 (= res!127269 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(declare-fun b!260371 () Bool)

(assert (=> b!260371 (= e!168741 (arrayContainsKey!0 lt!131140 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62555 (not res!127268)) b!260370))

(assert (= (and b!260370 res!127269) b!260371))

(assert (=> d!62555 m!276157))

(declare-fun m!276241 () Bool)

(assert (=> b!260371 m!276241))

(assert (=> b!260063 d!62555))

(declare-fun d!62557 () Bool)

(declare-fun e!168744 () Bool)

(assert (=> d!62557 e!168744))

(declare-fun res!127272 () Bool)

(assert (=> d!62557 (=> (not res!127272) (not e!168744))))

(assert (=> d!62557 (= res!127272 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 (_keys!6974 thiss!1504)))))))

(declare-fun lt!131378 () Unit!8056)

(declare-fun choose!41 (array!12591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3733) Unit!8056)

(assert (=> d!62557 (= lt!131378 (choose!41 (_keys!6974 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730))))

(assert (=> d!62557 (bvslt (size!6309 (_keys!6974 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62557 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6974 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730) lt!131378)))

(declare-fun b!260374 () Bool)

(assert (=> b!260374 (= e!168744 (arrayNoDuplicates!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 Nil!3730))))

(assert (= (and d!62557 res!127272) b!260374))

(declare-fun m!276243 () Bool)

(assert (=> d!62557 m!276243))

(assert (=> b!260374 m!275895))

(declare-fun m!276245 () Bool)

(assert (=> b!260374 m!276245))

(assert (=> b!260063 d!62557))

(assert (=> b!260063 d!62521))

(declare-fun d!62559 () Bool)

(declare-fun e!168747 () Bool)

(assert (=> d!62559 e!168747))

(declare-fun res!127275 () Bool)

(assert (=> d!62559 (=> (not res!127275) (not e!168747))))

(assert (=> d!62559 (= res!127275 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 (_keys!6974 thiss!1504)))))))

(declare-fun lt!131381 () Unit!8056)

(declare-fun choose!102 ((_ BitVec 64) array!12591 (_ BitVec 32) (_ BitVec 32)) Unit!8056)

(assert (=> d!62559 (= lt!131381 (choose!102 key!932 (_keys!6974 thiss!1504) index!297 (mask!11120 thiss!1504)))))

(assert (=> d!62559 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62559 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) index!297 (mask!11120 thiss!1504)) lt!131381)))

(declare-fun b!260377 () Bool)

(assert (=> b!260377 (= e!168747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (mask!11120 thiss!1504)))))

(assert (= (and d!62559 res!127275) b!260377))

(declare-fun m!276247 () Bool)

(assert (=> d!62559 m!276247))

(assert (=> d!62559 m!275875))

(assert (=> b!260377 m!275895))

(declare-fun m!276249 () Bool)

(assert (=> b!260377 m!276249))

(assert (=> b!260063 d!62559))

(declare-fun b!260378 () Bool)

(declare-fun e!168749 () (_ BitVec 32))

(declare-fun e!168748 () (_ BitVec 32))

(assert (=> b!260378 (= e!168749 e!168748)))

(declare-fun c!44242 () Bool)

(assert (=> b!260378 (= c!44242 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62561 () Bool)

(declare-fun lt!131382 () (_ BitVec 32))

(assert (=> d!62561 (and (bvsge lt!131382 #b00000000000000000000000000000000) (bvsle lt!131382 (bvsub (size!6309 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62561 (= lt!131382 e!168749)))

(declare-fun c!44241 () Bool)

(assert (=> d!62561 (= c!44241 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62561 (and (bvsle #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6309 (_keys!6974 thiss!1504)) (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62561 (= (arrayCountValidKeys!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) lt!131382)))

(declare-fun bm!24816 () Bool)

(declare-fun call!24819 () (_ BitVec 32))

(assert (=> bm!24816 (= call!24819 (arrayCountValidKeys!0 (_keys!6974 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260379 () Bool)

(assert (=> b!260379 (= e!168748 (bvadd #b00000000000000000000000000000001 call!24819))))

(declare-fun b!260380 () Bool)

(assert (=> b!260380 (= e!168749 #b00000000000000000000000000000000)))

(declare-fun b!260381 () Bool)

(assert (=> b!260381 (= e!168748 call!24819)))

(assert (= (and d!62561 c!44241) b!260380))

(assert (= (and d!62561 (not c!44241)) b!260378))

(assert (= (and b!260378 c!44242) b!260379))

(assert (= (and b!260378 (not c!44242)) b!260381))

(assert (= (or b!260379 b!260381) bm!24816))

(assert (=> b!260378 m!276055))

(assert (=> b!260378 m!276055))

(assert (=> b!260378 m!276075))

(declare-fun m!276251 () Bool)

(assert (=> bm!24816 m!276251))

(assert (=> b!260063 d!62561))

(declare-fun d!62563 () Bool)

(assert (=> d!62563 (= (arrayCountValidKeys!0 lt!131140 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131385 () Unit!8056)

(declare-fun choose!2 (array!12591 (_ BitVec 32)) Unit!8056)

(assert (=> d!62563 (= lt!131385 (choose!2 lt!131140 index!297))))

(declare-fun e!168752 () Bool)

(assert (=> d!62563 e!168752))

(declare-fun res!127280 () Bool)

(assert (=> d!62563 (=> (not res!127280) (not e!168752))))

(assert (=> d!62563 (= res!127280 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6309 lt!131140))))))

(assert (=> d!62563 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131140 index!297) lt!131385)))

(declare-fun b!260386 () Bool)

(declare-fun res!127281 () Bool)

(assert (=> b!260386 (=> (not res!127281) (not e!168752))))

(assert (=> b!260386 (= res!127281 (validKeyInArray!0 (select (arr!5960 lt!131140) index!297)))))

(declare-fun b!260387 () Bool)

(assert (=> b!260387 (= e!168752 (bvslt (size!6309 lt!131140) #b01111111111111111111111111111111))))

(assert (= (and d!62563 res!127280) b!260386))

(assert (= (and b!260386 res!127281) b!260387))

(declare-fun m!276253 () Bool)

(assert (=> d!62563 m!276253))

(declare-fun m!276255 () Bool)

(assert (=> d!62563 m!276255))

(assert (=> b!260386 m!276173))

(assert (=> b!260386 m!276173))

(assert (=> b!260386 m!276175))

(assert (=> b!260063 d!62563))

(declare-fun b!260400 () Bool)

(declare-fun c!44251 () Bool)

(declare-fun lt!131394 () (_ BitVec 64))

(assert (=> b!260400 (= c!44251 (= lt!131394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168760 () SeekEntryResult!1148)

(declare-fun e!168761 () SeekEntryResult!1148)

(assert (=> b!260400 (= e!168760 e!168761)))

(declare-fun b!260401 () Bool)

(declare-fun e!168759 () SeekEntryResult!1148)

(assert (=> b!260401 (= e!168759 e!168760)))

(declare-fun lt!131393 () SeekEntryResult!1148)

(assert (=> b!260401 (= lt!131394 (select (arr!5960 (_keys!6974 thiss!1504)) (index!6764 lt!131393)))))

(declare-fun c!44249 () Bool)

(assert (=> b!260401 (= c!44249 (= lt!131394 key!932))))

(declare-fun b!260402 () Bool)

(assert (=> b!260402 (= e!168761 (MissingZero!1148 (index!6764 lt!131393)))))

(declare-fun b!260403 () Bool)

(assert (=> b!260403 (= e!168760 (Found!1148 (index!6764 lt!131393)))))

(declare-fun b!260404 () Bool)

(assert (=> b!260404 (= e!168759 Undefined!1148)))

(declare-fun d!62565 () Bool)

(declare-fun lt!131392 () SeekEntryResult!1148)

(assert (=> d!62565 (and (or ((_ is Undefined!1148) lt!131392) (not ((_ is Found!1148) lt!131392)) (and (bvsge (index!6763 lt!131392) #b00000000000000000000000000000000) (bvslt (index!6763 lt!131392) (size!6309 (_keys!6974 thiss!1504))))) (or ((_ is Undefined!1148) lt!131392) ((_ is Found!1148) lt!131392) (not ((_ is MissingZero!1148) lt!131392)) (and (bvsge (index!6762 lt!131392) #b00000000000000000000000000000000) (bvslt (index!6762 lt!131392) (size!6309 (_keys!6974 thiss!1504))))) (or ((_ is Undefined!1148) lt!131392) ((_ is Found!1148) lt!131392) ((_ is MissingZero!1148) lt!131392) (not ((_ is MissingVacant!1148) lt!131392)) (and (bvsge (index!6765 lt!131392) #b00000000000000000000000000000000) (bvslt (index!6765 lt!131392) (size!6309 (_keys!6974 thiss!1504))))) (or ((_ is Undefined!1148) lt!131392) (ite ((_ is Found!1148) lt!131392) (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6763 lt!131392)) key!932) (ite ((_ is MissingZero!1148) lt!131392) (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6762 lt!131392)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1148) lt!131392) (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6765 lt!131392)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62565 (= lt!131392 e!168759)))

(declare-fun c!44250 () Bool)

(assert (=> d!62565 (= c!44250 (and ((_ is Intermediate!1148) lt!131393) (undefined!1960 lt!131393)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12591 (_ BitVec 32)) SeekEntryResult!1148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62565 (= lt!131393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11120 thiss!1504)) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(assert (=> d!62565 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62565 (= (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)) lt!131392)))

(declare-fun b!260405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12591 (_ BitVec 32)) SeekEntryResult!1148)

(assert (=> b!260405 (= e!168761 (seekKeyOrZeroReturnVacant!0 (x!25086 lt!131393) (index!6764 lt!131393) (index!6764 lt!131393) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(assert (= (and d!62565 c!44250) b!260404))

(assert (= (and d!62565 (not c!44250)) b!260401))

(assert (= (and b!260401 c!44249) b!260403))

(assert (= (and b!260401 (not c!44249)) b!260400))

(assert (= (and b!260400 c!44251) b!260402))

(assert (= (and b!260400 (not c!44251)) b!260405))

(declare-fun m!276257 () Bool)

(assert (=> b!260401 m!276257))

(declare-fun m!276259 () Bool)

(assert (=> d!62565 m!276259))

(declare-fun m!276261 () Bool)

(assert (=> d!62565 m!276261))

(declare-fun m!276263 () Bool)

(assert (=> d!62565 m!276263))

(declare-fun m!276265 () Bool)

(assert (=> d!62565 m!276265))

(declare-fun m!276267 () Bool)

(assert (=> d!62565 m!276267))

(assert (=> d!62565 m!275875))

(assert (=> d!62565 m!276265))

(declare-fun m!276269 () Bool)

(assert (=> b!260405 m!276269))

(assert (=> b!260062 d!62565))

(declare-fun d!62567 () Bool)

(assert (=> d!62567 (contains!1865 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932)))

(declare-fun lt!131397 () Unit!8056)

(declare-fun choose!1273 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) (_ BitVec 32) Int) Unit!8056)

(assert (=> d!62567 (= lt!131397 (choose!1273 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62567 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62567 (= (lemmaArrayContainsKeyThenInListMap!256 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131397)))

(declare-fun bs!9183 () Bool)

(assert (= bs!9183 d!62567))

(assert (=> bs!9183 m!275867))

(assert (=> bs!9183 m!275867))

(declare-fun m!276271 () Bool)

(assert (=> bs!9183 m!276271))

(declare-fun m!276273 () Bool)

(assert (=> bs!9183 m!276273))

(assert (=> bs!9183 m!275875))

(assert (=> b!260054 d!62567))

(declare-fun d!62569 () Bool)

(assert (=> d!62569 (= (array_inv!3923 (_keys!6974 thiss!1504)) (bvsge (size!6309 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260059 d!62569))

(declare-fun d!62571 () Bool)

(assert (=> d!62571 (= (array_inv!3924 (_values!4777 thiss!1504)) (bvsge (size!6308 (_values!4777 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260059 d!62571))

(declare-fun b!260422 () Bool)

(declare-fun e!168771 () Bool)

(declare-fun lt!131403 () SeekEntryResult!1148)

(assert (=> b!260422 (= e!168771 ((_ is Undefined!1148) lt!131403))))

(declare-fun b!260423 () Bool)

(declare-fun e!168772 () Bool)

(declare-fun call!24825 () Bool)

(assert (=> b!260423 (= e!168772 (not call!24825))))

(declare-fun b!260424 () Bool)

(declare-fun res!127291 () Bool)

(declare-fun e!168770 () Bool)

(assert (=> b!260424 (=> (not res!127291) (not e!168770))))

(declare-fun call!24824 () Bool)

(assert (=> b!260424 (= res!127291 call!24824)))

(assert (=> b!260424 (= e!168771 e!168770)))

(declare-fun b!260425 () Bool)

(declare-fun e!168773 () Bool)

(assert (=> b!260425 (= e!168773 e!168771)))

(declare-fun c!44256 () Bool)

(assert (=> b!260425 (= c!44256 ((_ is MissingVacant!1148) lt!131403))))

(declare-fun d!62573 () Bool)

(assert (=> d!62573 e!168773))

(declare-fun c!44257 () Bool)

(assert (=> d!62573 (= c!44257 ((_ is MissingZero!1148) lt!131403))))

(assert (=> d!62573 (= lt!131403 (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun lt!131402 () Unit!8056)

(declare-fun choose!1274 (array!12591 array!12589 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8056)

(assert (=> d!62573 (= lt!131402 (choose!1274 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62573 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62573 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!430 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) lt!131402)))

(declare-fun bm!24821 () Bool)

(assert (=> bm!24821 (= call!24825 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260426 () Bool)

(assert (=> b!260426 (= e!168773 e!168772)))

(declare-fun res!127293 () Bool)

(assert (=> b!260426 (= res!127293 call!24824)))

(assert (=> b!260426 (=> (not res!127293) (not e!168772))))

(declare-fun b!260427 () Bool)

(assert (=> b!260427 (and (bvsge (index!6762 lt!131403) #b00000000000000000000000000000000) (bvslt (index!6762 lt!131403) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun res!127292 () Bool)

(assert (=> b!260427 (= res!127292 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6762 lt!131403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260427 (=> (not res!127292) (not e!168772))))

(declare-fun bm!24822 () Bool)

(assert (=> bm!24822 (= call!24824 (inRange!0 (ite c!44257 (index!6762 lt!131403) (index!6765 lt!131403)) (mask!11120 thiss!1504)))))

(declare-fun b!260428 () Bool)

(declare-fun res!127290 () Bool)

(assert (=> b!260428 (=> (not res!127290) (not e!168770))))

(assert (=> b!260428 (= res!127290 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6765 lt!131403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260428 (and (bvsge (index!6765 lt!131403) #b00000000000000000000000000000000) (bvslt (index!6765 lt!131403) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260429 () Bool)

(assert (=> b!260429 (= e!168770 (not call!24825))))

(assert (= (and d!62573 c!44257) b!260426))

(assert (= (and d!62573 (not c!44257)) b!260425))

(assert (= (and b!260426 res!127293) b!260427))

(assert (= (and b!260427 res!127292) b!260423))

(assert (= (and b!260425 c!44256) b!260424))

(assert (= (and b!260425 (not c!44256)) b!260422))

(assert (= (and b!260424 res!127291) b!260428))

(assert (= (and b!260428 res!127290) b!260429))

(assert (= (or b!260426 b!260424) bm!24822))

(assert (= (or b!260423 b!260429) bm!24821))

(declare-fun m!276275 () Bool)

(assert (=> bm!24822 m!276275))

(declare-fun m!276277 () Bool)

(assert (=> b!260427 m!276277))

(declare-fun m!276279 () Bool)

(assert (=> b!260428 m!276279))

(assert (=> bm!24821 m!275877))

(assert (=> d!62573 m!275917))

(declare-fun m!276281 () Bool)

(assert (=> d!62573 m!276281))

(assert (=> d!62573 m!275875))

(assert (=> b!260046 d!62573))

(declare-fun b!260437 () Bool)

(declare-fun e!168778 () Bool)

(assert (=> b!260437 (= e!168778 tp_is_empty!6619)))

(declare-fun b!260436 () Bool)

(declare-fun e!168779 () Bool)

(assert (=> b!260436 (= e!168779 tp_is_empty!6619)))

(declare-fun condMapEmpty!11288 () Bool)

(declare-fun mapDefault!11288 () ValueCell!2966)

(assert (=> mapNonEmpty!11279 (= condMapEmpty!11288 (= mapRest!11279 ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11288)))))

(declare-fun mapRes!11288 () Bool)

(assert (=> mapNonEmpty!11279 (= tp!23594 (and e!168778 mapRes!11288))))

(declare-fun mapNonEmpty!11288 () Bool)

(declare-fun tp!23609 () Bool)

(assert (=> mapNonEmpty!11288 (= mapRes!11288 (and tp!23609 e!168779))))

(declare-fun mapKey!11288 () (_ BitVec 32))

(declare-fun mapValue!11288 () ValueCell!2966)

(declare-fun mapRest!11288 () (Array (_ BitVec 32) ValueCell!2966))

(assert (=> mapNonEmpty!11288 (= mapRest!11279 (store mapRest!11288 mapKey!11288 mapValue!11288))))

(declare-fun mapIsEmpty!11288 () Bool)

(assert (=> mapIsEmpty!11288 mapRes!11288))

(assert (= (and mapNonEmpty!11279 condMapEmpty!11288) mapIsEmpty!11288))

(assert (= (and mapNonEmpty!11279 (not condMapEmpty!11288)) mapNonEmpty!11288))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2966) mapValue!11288)) b!260436))

(assert (= (and mapNonEmpty!11279 ((_ is ValueCellFull!2966) mapDefault!11288)) b!260437))

(declare-fun m!276283 () Bool)

(assert (=> mapNonEmpty!11288 m!276283))

(declare-fun b_lambda!8285 () Bool)

(assert (= b_lambda!8281 (or (and b!260059 b_free!6757) b_lambda!8285)))

(declare-fun b_lambda!8287 () Bool)

(assert (= b_lambda!8283 (or (and b!260059 b_free!6757) b_lambda!8287)))

(check-sat (not bm!24804) (not b!260302) (not d!62537) (not b!260354) (not b_lambda!8285) (not b!260276) (not b!260299) (not d!62565) (not d!62535) (not d!62553) (not bm!24815) (not b!260374) (not d!62523) (not mapNonEmpty!11288) (not b!260332) (not d!62559) (not b!260211) (not b!260275) (not b!260386) (not b!260283) (not b!260352) (not bm!24796) (not d!62529) (not d!62533) (not b!260290) (not b!260377) (not b!260333) (not bm!24798) (not b!260337) (not b!260378) (not d!62573) (not bm!24801) (not b_next!6757) (not b!260357) (not b_lambda!8287) (not b!260368) (not bm!24811) (not b!260356) (not b!260371) (not d!62549) (not b!260317) (not b!260256) (not b!260313) (not b!260351) (not b!260213) tp_is_empty!6619 (not bm!24810) (not b!260355) (not bm!24816) (not b!260300) (not b!260271) (not b!260369) (not d!62543) (not b!260274) (not b!260289) (not bm!24795) (not d!62527) (not d!62557) (not d!62567) (not b!260273) (not bm!24797) (not bm!24805) (not b!260270) (not bm!24821) (not b!260326) (not bm!24809) (not b!260344) (not b!260202) (not b!260405) (not b!260315) (not d!62563) (not bm!24822) b_and!13885 (not b!260204) (not b!260263) (not bm!24812) (not b!260203) (not b!260195))
(check-sat b_and!13885 (not b_next!6757))
(get-model)

(declare-fun d!62575 () Bool)

(assert (=> d!62575 (= (inRange!0 (ite c!44257 (index!6762 lt!131403) (index!6765 lt!131403)) (mask!11120 thiss!1504)) (and (bvsge (ite c!44257 (index!6762 lt!131403) (index!6765 lt!131403)) #b00000000000000000000000000000000) (bvslt (ite c!44257 (index!6762 lt!131403) (index!6765 lt!131403)) (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24822 d!62575))

(declare-fun b!260438 () Bool)

(declare-fun e!168782 () Bool)

(declare-fun call!24826 () Bool)

(assert (=> b!260438 (= e!168782 call!24826)))

(declare-fun b!260439 () Bool)

(declare-fun e!168781 () Bool)

(assert (=> b!260439 (= e!168781 call!24826)))

(declare-fun b!260440 () Bool)

(assert (=> b!260440 (= e!168781 e!168782)))

(declare-fun lt!131406 () (_ BitVec 64))

(assert (=> b!260440 (= lt!131406 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131404 () Unit!8056)

(assert (=> b!260440 (= lt!131404 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6974 thiss!1504) lt!131406 #b00000000000000000000000000000000))))

(assert (=> b!260440 (arrayContainsKey!0 (_keys!6974 thiss!1504) lt!131406 #b00000000000000000000000000000000)))

(declare-fun lt!131405 () Unit!8056)

(assert (=> b!260440 (= lt!131405 lt!131404)))

(declare-fun res!127294 () Bool)

(assert (=> b!260440 (= res!127294 (= (seekEntryOrOpen!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) (_keys!6974 thiss!1504) (mask!11120 thiss!1504)) (Found!1148 #b00000000000000000000000000000000)))))

(assert (=> b!260440 (=> (not res!127294) (not e!168782))))

(declare-fun b!260441 () Bool)

(declare-fun e!168780 () Bool)

(assert (=> b!260441 (= e!168780 e!168781)))

(declare-fun c!44258 () Bool)

(assert (=> b!260441 (= c!44258 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24823 () Bool)

(assert (=> bm!24823 (= call!24826 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun d!62577 () Bool)

(declare-fun res!127295 () Bool)

(assert (=> d!62577 (=> res!127295 e!168780)))

(assert (=> d!62577 (= res!127295 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)) e!168780)))

(assert (= (and d!62577 (not res!127295)) b!260441))

(assert (= (and b!260441 c!44258) b!260440))

(assert (= (and b!260441 (not c!44258)) b!260439))

(assert (= (and b!260440 res!127294) b!260438))

(assert (= (or b!260438 b!260439) bm!24823))

(assert (=> b!260440 m!276055))

(declare-fun m!276285 () Bool)

(assert (=> b!260440 m!276285))

(declare-fun m!276287 () Bool)

(assert (=> b!260440 m!276287))

(assert (=> b!260440 m!276055))

(declare-fun m!276289 () Bool)

(assert (=> b!260440 m!276289))

(assert (=> b!260441 m!276055))

(assert (=> b!260441 m!276055))

(assert (=> b!260441 m!276075))

(declare-fun m!276291 () Bool)

(assert (=> bm!24823 m!276291))

(assert (=> b!260203 d!62577))

(declare-fun d!62579 () Bool)

(assert (=> d!62579 (= (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260271 d!62579))

(declare-fun d!62581 () Bool)

(declare-fun get!3078 (Option!323) V!8473)

(assert (=> d!62581 (= (apply!258 lt!131301 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1900 lt!131301) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9184 () Bool)

(assert (= bs!9184 d!62581))

(declare-fun m!276293 () Bool)

(assert (=> bs!9184 m!276293))

(assert (=> bs!9184 m!276293))

(declare-fun m!276295 () Bool)

(assert (=> bs!9184 m!276295))

(assert (=> b!260273 d!62581))

(declare-fun d!62583 () Bool)

(declare-fun e!168783 () Bool)

(assert (=> d!62583 e!168783))

(declare-fun res!127296 () Bool)

(assert (=> d!62583 (=> (not res!127296) (not e!168783))))

(declare-fun lt!131409 () ListLongMap!3769)

(assert (=> d!62583 (= res!127296 (contains!1865 lt!131409 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131408 () List!3732)

(assert (=> d!62583 (= lt!131409 (ListLongMap!3770 lt!131408))))

(declare-fun lt!131410 () Unit!8056)

(declare-fun lt!131407 () Unit!8056)

(assert (=> d!62583 (= lt!131410 lt!131407)))

(assert (=> d!62583 (= (getValueByKey!317 lt!131408 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62583 (= lt!131407 (lemmaContainsTupThenGetReturnValue!173 lt!131408 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62583 (= lt!131408 (insertStrictlySorted!176 (toList!1900 call!24795) (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62583 (= (+!697 call!24795 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) lt!131409)))

(declare-fun b!260442 () Bool)

(declare-fun res!127297 () Bool)

(assert (=> b!260442 (=> (not res!127297) (not e!168783))))

(assert (=> b!260442 (= res!127297 (= (getValueByKey!317 (toList!1900 lt!131409) (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun b!260443 () Bool)

(assert (=> b!260443 (= e!168783 (contains!1868 (toList!1900 lt!131409) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(assert (= (and d!62583 res!127296) b!260442))

(assert (= (and b!260442 res!127297) b!260443))

(declare-fun m!276297 () Bool)

(assert (=> d!62583 m!276297))

(declare-fun m!276299 () Bool)

(assert (=> d!62583 m!276299))

(declare-fun m!276301 () Bool)

(assert (=> d!62583 m!276301))

(declare-fun m!276303 () Bool)

(assert (=> d!62583 m!276303))

(declare-fun m!276305 () Bool)

(assert (=> b!260442 m!276305))

(declare-fun m!276307 () Bool)

(assert (=> b!260443 m!276307))

(assert (=> b!260256 d!62583))

(declare-fun d!62585 () Bool)

(assert (=> d!62585 (= (validKeyInArray!0 (select (arr!5960 lt!131140) index!297)) (and (not (= (select (arr!5960 lt!131140) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5960 lt!131140) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260333 d!62585))

(declare-fun b!260455 () Bool)

(declare-fun e!168789 () Option!323)

(assert (=> b!260455 (= e!168789 None!321)))

(declare-fun b!260453 () Bool)

(declare-fun e!168788 () Option!323)

(assert (=> b!260453 (= e!168788 e!168789)))

(declare-fun c!44264 () Bool)

(assert (=> b!260453 (= c!44264 (and ((_ is Cons!3728) (toList!1900 lt!131330)) (not (= (_1!2438 (h!4392 (toList!1900 lt!131330))) (_1!2438 (tuple2!4855 key!932 v!346))))))))

(declare-fun d!62587 () Bool)

(declare-fun c!44263 () Bool)

(assert (=> d!62587 (= c!44263 (and ((_ is Cons!3728) (toList!1900 lt!131330)) (= (_1!2438 (h!4392 (toList!1900 lt!131330))) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(assert (=> d!62587 (= (getValueByKey!317 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346))) e!168788)))

(declare-fun b!260454 () Bool)

(assert (=> b!260454 (= e!168789 (getValueByKey!317 (t!8793 (toList!1900 lt!131330)) (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun b!260452 () Bool)

(assert (=> b!260452 (= e!168788 (Some!322 (_2!2438 (h!4392 (toList!1900 lt!131330)))))))

(assert (= (and d!62587 c!44263) b!260452))

(assert (= (and d!62587 (not c!44263)) b!260453))

(assert (= (and b!260453 c!44264) b!260454))

(assert (= (and b!260453 (not c!44264)) b!260455))

(declare-fun m!276309 () Bool)

(assert (=> b!260454 m!276309))

(assert (=> b!260289 d!62587))

(declare-fun d!62589 () Bool)

(declare-fun e!168791 () Bool)

(assert (=> d!62589 e!168791))

(declare-fun res!127298 () Bool)

(assert (=> d!62589 (=> res!127298 e!168791)))

(declare-fun lt!131413 () Bool)

(assert (=> d!62589 (= res!127298 (not lt!131413))))

(declare-fun lt!131411 () Bool)

(assert (=> d!62589 (= lt!131413 lt!131411)))

(declare-fun lt!131412 () Unit!8056)

(declare-fun e!168790 () Unit!8056)

(assert (=> d!62589 (= lt!131412 e!168790)))

(declare-fun c!44265 () Bool)

(assert (=> d!62589 (= c!44265 lt!131411)))

(assert (=> d!62589 (= lt!131411 (containsKey!308 (toList!1900 lt!131301) (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62589 (= (contains!1865 lt!131301 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)) lt!131413)))

(declare-fun b!260456 () Bool)

(declare-fun lt!131414 () Unit!8056)

(assert (=> b!260456 (= e!168790 lt!131414)))

(assert (=> b!260456 (= lt!131414 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131301) (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260456 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260457 () Bool)

(declare-fun Unit!8073 () Unit!8056)

(assert (=> b!260457 (= e!168790 Unit!8073)))

(declare-fun b!260458 () Bool)

(assert (=> b!260458 (= e!168791 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62589 c!44265) b!260456))

(assert (= (and d!62589 (not c!44265)) b!260457))

(assert (= (and d!62589 (not res!127298)) b!260458))

(assert (=> d!62589 m!276055))

(declare-fun m!276311 () Bool)

(assert (=> d!62589 m!276311))

(assert (=> b!260456 m!276055))

(declare-fun m!276313 () Bool)

(assert (=> b!260456 m!276313))

(assert (=> b!260456 m!276055))

(declare-fun m!276315 () Bool)

(assert (=> b!260456 m!276315))

(assert (=> b!260456 m!276315))

(declare-fun m!276317 () Bool)

(assert (=> b!260456 m!276317))

(assert (=> b!260458 m!276055))

(assert (=> b!260458 m!276315))

(assert (=> b!260458 m!276315))

(assert (=> b!260458 m!276317))

(assert (=> b!260275 d!62589))

(declare-fun d!62591 () Bool)

(assert (=> d!62591 (= (apply!258 lt!131351 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) (get!3078 (getValueByKey!317 (toList!1900 lt!131351) (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))))

(declare-fun bs!9185 () Bool)

(assert (= bs!9185 d!62591))

(assert (=> bs!9185 m!276157))

(declare-fun m!276319 () Bool)

(assert (=> bs!9185 m!276319))

(assert (=> bs!9185 m!276319))

(declare-fun m!276321 () Bool)

(assert (=> bs!9185 m!276321))

(assert (=> b!260351 d!62591))

(declare-fun c!44268 () Bool)

(declare-fun d!62593 () Bool)

(assert (=> d!62593 (= c!44268 ((_ is ValueCellFull!2966) (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168794 () V!8473)

(assert (=> d!62593 (= (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168794)))

(declare-fun b!260463 () Bool)

(declare-fun get!3079 (ValueCell!2966 V!8473) V!8473)

(assert (=> b!260463 (= e!168794 (get!3079 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260464 () Bool)

(declare-fun get!3080 (ValueCell!2966 V!8473) V!8473)

(assert (=> b!260464 (= e!168794 (get!3080 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62593 c!44268) b!260463))

(assert (= (and d!62593 (not c!44268)) b!260464))

(assert (=> b!260463 m!276217))

(assert (=> b!260463 m!276115))

(declare-fun m!276323 () Bool)

(assert (=> b!260463 m!276323))

(assert (=> b!260464 m!276217))

(assert (=> b!260464 m!276115))

(declare-fun m!276325 () Bool)

(assert (=> b!260464 m!276325))

(assert (=> b!260351 d!62593))

(declare-fun d!62595 () Bool)

(declare-fun e!168795 () Bool)

(assert (=> d!62595 e!168795))

(declare-fun res!127299 () Bool)

(assert (=> d!62595 (=> (not res!127299) (not e!168795))))

(declare-fun lt!131417 () ListLongMap!3769)

(assert (=> d!62595 (= res!127299 (contains!1865 lt!131417 (_1!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun lt!131416 () List!3732)

(assert (=> d!62595 (= lt!131417 (ListLongMap!3770 lt!131416))))

(declare-fun lt!131418 () Unit!8056)

(declare-fun lt!131415 () Unit!8056)

(assert (=> d!62595 (= lt!131418 lt!131415)))

(assert (=> d!62595 (= (getValueByKey!317 lt!131416 (_1!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!322 (_2!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62595 (= lt!131415 (lemmaContainsTupThenGetReturnValue!173 lt!131416 (_1!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62595 (= lt!131416 (insertStrictlySorted!176 (toList!1900 (ite c!44218 call!24801 (ite c!44216 call!24796 call!24799))) (_1!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62595 (= (+!697 (ite c!44218 call!24801 (ite c!44216 call!24796 call!24799)) (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) lt!131417)))

(declare-fun b!260465 () Bool)

(declare-fun res!127300 () Bool)

(assert (=> b!260465 (=> (not res!127300) (not e!168795))))

(assert (=> b!260465 (= res!127300 (= (getValueByKey!317 (toList!1900 lt!131417) (_1!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!322 (_2!2438 (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))))

(declare-fun b!260466 () Bool)

(assert (=> b!260466 (= e!168795 (contains!1868 (toList!1900 lt!131417) (ite (or c!44218 c!44216) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (= (and d!62595 res!127299) b!260465))

(assert (= (and b!260465 res!127300) b!260466))

(declare-fun m!276327 () Bool)

(assert (=> d!62595 m!276327))

(declare-fun m!276329 () Bool)

(assert (=> d!62595 m!276329))

(declare-fun m!276331 () Bool)

(assert (=> d!62595 m!276331))

(declare-fun m!276333 () Bool)

(assert (=> d!62595 m!276333))

(declare-fun m!276335 () Bool)

(assert (=> b!260465 m!276335))

(declare-fun m!276337 () Bool)

(assert (=> b!260466 m!276337))

(assert (=> bm!24796 d!62595))

(assert (=> d!62573 d!62565))

(declare-fun c!44274 () Bool)

(declare-fun call!24832 () Bool)

(declare-fun bm!24828 () Bool)

(declare-fun lt!131421 () SeekEntryResult!1148)

(assert (=> bm!24828 (= call!24832 (inRange!0 (ite c!44274 (index!6762 lt!131421) (index!6765 lt!131421)) (mask!11120 thiss!1504)))))

(declare-fun b!260483 () Bool)

(declare-fun res!127311 () Bool)

(declare-fun e!168804 () Bool)

(assert (=> b!260483 (=> (not res!127311) (not e!168804))))

(assert (=> b!260483 (= res!127311 call!24832)))

(declare-fun e!168807 () Bool)

(assert (=> b!260483 (= e!168807 e!168804)))

(declare-fun bm!24829 () Bool)

(declare-fun call!24831 () Bool)

(assert (=> bm!24829 (= call!24831 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260484 () Bool)

(declare-fun e!168805 () Bool)

(assert (=> b!260484 (= e!168805 e!168807)))

(declare-fun c!44273 () Bool)

(assert (=> b!260484 (= c!44273 ((_ is MissingVacant!1148) lt!131421))))

(declare-fun d!62597 () Bool)

(assert (=> d!62597 e!168805))

(assert (=> d!62597 (= c!44274 ((_ is MissingZero!1148) lt!131421))))

(assert (=> d!62597 (= lt!131421 (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(assert (=> d!62597 true))

(declare-fun _$34!1125 () Unit!8056)

(assert (=> d!62597 (= (choose!1274 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) _$34!1125)))

(declare-fun b!260485 () Bool)

(assert (=> b!260485 (= e!168807 ((_ is Undefined!1148) lt!131421))))

(declare-fun b!260486 () Bool)

(declare-fun res!127310 () Bool)

(assert (=> b!260486 (= res!127310 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6762 lt!131421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168806 () Bool)

(assert (=> b!260486 (=> (not res!127310) (not e!168806))))

(declare-fun b!260487 () Bool)

(declare-fun res!127312 () Bool)

(assert (=> b!260487 (=> (not res!127312) (not e!168804))))

(assert (=> b!260487 (= res!127312 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6765 lt!131421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260488 () Bool)

(assert (=> b!260488 (= e!168805 e!168806)))

(declare-fun res!127309 () Bool)

(assert (=> b!260488 (= res!127309 call!24832)))

(assert (=> b!260488 (=> (not res!127309) (not e!168806))))

(declare-fun b!260489 () Bool)

(assert (=> b!260489 (= e!168806 (not call!24831))))

(declare-fun b!260490 () Bool)

(assert (=> b!260490 (= e!168804 (not call!24831))))

(assert (= (and d!62597 c!44274) b!260488))

(assert (= (and d!62597 (not c!44274)) b!260484))

(assert (= (and b!260488 res!127309) b!260486))

(assert (= (and b!260486 res!127310) b!260489))

(assert (= (and b!260484 c!44273) b!260483))

(assert (= (and b!260484 (not c!44273)) b!260485))

(assert (= (and b!260483 res!127311) b!260487))

(assert (= (and b!260487 res!127312) b!260490))

(assert (= (or b!260488 b!260483) bm!24828))

(assert (= (or b!260489 b!260490) bm!24829))

(assert (=> d!62597 m!275917))

(declare-fun m!276339 () Bool)

(assert (=> b!260486 m!276339))

(assert (=> bm!24829 m!275877))

(declare-fun m!276341 () Bool)

(assert (=> bm!24828 m!276341))

(declare-fun m!276343 () Bool)

(assert (=> b!260487 m!276343))

(assert (=> d!62573 d!62597))

(assert (=> d!62573 d!62545))

(declare-fun b!260491 () Bool)

(declare-fun e!168809 () (_ BitVec 32))

(declare-fun e!168808 () (_ BitVec 32))

(assert (=> b!260491 (= e!168809 e!168808)))

(declare-fun c!44276 () Bool)

(assert (=> b!260491 (= c!44276 (validKeyInArray!0 (select (arr!5960 lt!131140) index!297)))))

(declare-fun d!62599 () Bool)

(declare-fun lt!131422 () (_ BitVec 32))

(assert (=> d!62599 (and (bvsge lt!131422 #b00000000000000000000000000000000) (bvsle lt!131422 (bvsub (size!6309 lt!131140) index!297)))))

(assert (=> d!62599 (= lt!131422 e!168809)))

(declare-fun c!44275 () Bool)

(assert (=> d!62599 (= c!44275 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62599 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(assert (=> d!62599 (= (arrayCountValidKeys!0 lt!131140 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131422)))

(declare-fun bm!24830 () Bool)

(declare-fun call!24833 () (_ BitVec 32))

(assert (=> bm!24830 (= call!24833 (arrayCountValidKeys!0 lt!131140 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!260492 () Bool)

(assert (=> b!260492 (= e!168808 (bvadd #b00000000000000000000000000000001 call!24833))))

(declare-fun b!260493 () Bool)

(assert (=> b!260493 (= e!168809 #b00000000000000000000000000000000)))

(declare-fun b!260494 () Bool)

(assert (=> b!260494 (= e!168808 call!24833)))

(assert (= (and d!62599 c!44275) b!260493))

(assert (= (and d!62599 (not c!44275)) b!260491))

(assert (= (and b!260491 c!44276) b!260492))

(assert (= (and b!260491 (not c!44276)) b!260494))

(assert (= (or b!260492 b!260494) bm!24830))

(assert (=> b!260491 m!276173))

(assert (=> b!260491 m!276173))

(assert (=> b!260491 m!276175))

(declare-fun m!276345 () Bool)

(assert (=> bm!24830 m!276345))

(assert (=> d!62563 d!62599))

(declare-fun d!62601 () Bool)

(assert (=> d!62601 (= (arrayCountValidKeys!0 lt!131140 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62601 true))

(declare-fun _$85!27 () Unit!8056)

(assert (=> d!62601 (= (choose!2 lt!131140 index!297) _$85!27)))

(declare-fun bs!9186 () Bool)

(assert (= bs!9186 d!62601))

(assert (=> bs!9186 m!276253))

(assert (=> d!62563 d!62601))

(assert (=> b!260386 d!62585))

(declare-fun b!260495 () Bool)

(declare-fun e!168812 () Bool)

(declare-fun call!24834 () Bool)

(assert (=> b!260495 (= e!168812 call!24834)))

(declare-fun b!260496 () Bool)

(declare-fun e!168811 () Bool)

(assert (=> b!260496 (= e!168811 call!24834)))

(declare-fun b!260497 () Bool)

(assert (=> b!260497 (= e!168811 e!168812)))

(declare-fun lt!131425 () (_ BitVec 64))

(assert (=> b!260497 (= lt!131425 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131423 () Unit!8056)

(assert (=> b!260497 (= lt!131423 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) lt!131425 #b00000000000000000000000000000000))))

(assert (=> b!260497 (arrayContainsKey!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) lt!131425 #b00000000000000000000000000000000)))

(declare-fun lt!131424 () Unit!8056)

(assert (=> b!260497 (= lt!131424 lt!131423)))

(declare-fun res!127313 () Bool)

(assert (=> b!260497 (= res!127313 (= (seekEntryOrOpen!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000) (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (mask!11120 thiss!1504)) (Found!1148 #b00000000000000000000000000000000)))))

(assert (=> b!260497 (=> (not res!127313) (not e!168812))))

(declare-fun b!260498 () Bool)

(declare-fun e!168810 () Bool)

(assert (=> b!260498 (= e!168810 e!168811)))

(declare-fun c!44277 () Bool)

(assert (=> b!260498 (= c!44277 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24831 () Bool)

(assert (=> bm!24831 (= call!24834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (mask!11120 thiss!1504)))))

(declare-fun d!62603 () Bool)

(declare-fun res!127314 () Bool)

(assert (=> d!62603 (=> res!127314 e!168810)))

(assert (=> d!62603 (= res!127314 (bvsge #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(assert (=> d!62603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (mask!11120 thiss!1504)) e!168810)))

(assert (= (and d!62603 (not res!127314)) b!260498))

(assert (= (and b!260498 c!44277) b!260497))

(assert (= (and b!260498 (not c!44277)) b!260496))

(assert (= (and b!260497 res!127313) b!260495))

(assert (= (or b!260495 b!260496) bm!24831))

(declare-fun m!276347 () Bool)

(assert (=> b!260497 m!276347))

(declare-fun m!276349 () Bool)

(assert (=> b!260497 m!276349))

(declare-fun m!276351 () Bool)

(assert (=> b!260497 m!276351))

(assert (=> b!260497 m!276347))

(declare-fun m!276353 () Bool)

(assert (=> b!260497 m!276353))

(assert (=> b!260498 m!276347))

(assert (=> b!260498 m!276347))

(declare-fun m!276355 () Bool)

(assert (=> b!260498 m!276355))

(declare-fun m!276357 () Bool)

(assert (=> bm!24831 m!276357))

(assert (=> b!260377 d!62603))

(declare-fun d!62605 () Bool)

(assert (=> d!62605 (= (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) (and (not (= (select (arr!5960 lt!131140) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5960 lt!131140) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260313 d!62605))

(declare-fun b!260523 () Bool)

(declare-fun res!127323 () Bool)

(declare-fun e!168827 () Bool)

(assert (=> b!260523 (=> (not res!127323) (not e!168827))))

(declare-fun lt!131442 () ListLongMap!3769)

(assert (=> b!260523 (= res!127323 (not (contains!1865 lt!131442 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260524 () Bool)

(declare-fun e!168830 () Bool)

(declare-fun e!168828 () Bool)

(assert (=> b!260524 (= e!168830 e!168828)))

(declare-fun c!44287 () Bool)

(assert (=> b!260524 (= c!44287 (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260525 () Bool)

(declare-fun e!168832 () Bool)

(assert (=> b!260525 (= e!168830 e!168832)))

(assert (=> b!260525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun res!127326 () Bool)

(assert (=> b!260525 (= res!127326 (contains!1865 lt!131442 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260525 (=> (not res!127326) (not e!168832))))

(declare-fun b!260526 () Bool)

(declare-fun e!168831 () ListLongMap!3769)

(assert (=> b!260526 (= e!168831 (ListLongMap!3770 Nil!3729))))

(declare-fun b!260527 () Bool)

(declare-fun e!168833 () Bool)

(assert (=> b!260527 (= e!168833 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260527 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260528 () Bool)

(assert (=> b!260528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> b!260528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6308 (_values!4777 thiss!1504))))))

(assert (=> b!260528 (= e!168832 (= (apply!258 lt!131442 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)) (get!3077 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260529 () Bool)

(declare-fun lt!131443 () Unit!8056)

(declare-fun lt!131446 () Unit!8056)

(assert (=> b!260529 (= lt!131443 lt!131446)))

(declare-fun lt!131441 () (_ BitVec 64))

(declare-fun lt!131440 () (_ BitVec 64))

(declare-fun lt!131445 () V!8473)

(declare-fun lt!131444 () ListLongMap!3769)

(assert (=> b!260529 (not (contains!1865 (+!697 lt!131444 (tuple2!4855 lt!131440 lt!131445)) lt!131441))))

(declare-fun addStillNotContains!129 (ListLongMap!3769 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8056)

(assert (=> b!260529 (= lt!131446 (addStillNotContains!129 lt!131444 lt!131440 lt!131445 lt!131441))))

(assert (=> b!260529 (= lt!131441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260529 (= lt!131445 (get!3077 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260529 (= lt!131440 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!24837 () ListLongMap!3769)

(assert (=> b!260529 (= lt!131444 call!24837)))

(declare-fun e!168829 () ListLongMap!3769)

(assert (=> b!260529 (= e!168829 (+!697 call!24837 (tuple2!4855 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) (get!3077 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62607 () Bool)

(assert (=> d!62607 e!168827))

(declare-fun res!127325 () Bool)

(assert (=> d!62607 (=> (not res!127325) (not e!168827))))

(assert (=> d!62607 (= res!127325 (not (contains!1865 lt!131442 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62607 (= lt!131442 e!168831)))

(declare-fun c!44289 () Bool)

(assert (=> d!62607 (= c!44289 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62607 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62607 (= (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131442)))

(declare-fun b!260530 () Bool)

(declare-fun isEmpty!542 (ListLongMap!3769) Bool)

(assert (=> b!260530 (= e!168828 (isEmpty!542 lt!131442))))

(declare-fun b!260531 () Bool)

(assert (=> b!260531 (= e!168829 call!24837)))

(declare-fun b!260532 () Bool)

(assert (=> b!260532 (= e!168831 e!168829)))

(declare-fun c!44286 () Bool)

(assert (=> b!260532 (= c!44286 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24834 () Bool)

(assert (=> bm!24834 (= call!24837 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260533 () Bool)

(assert (=> b!260533 (= e!168828 (= lt!131442 (getCurrentListMapNoExtraKeys!574 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504))))))

(declare-fun b!260534 () Bool)

(assert (=> b!260534 (= e!168827 e!168830)))

(declare-fun c!44288 () Bool)

(assert (=> b!260534 (= c!44288 e!168833)))

(declare-fun res!127324 () Bool)

(assert (=> b!260534 (=> (not res!127324) (not e!168833))))

(assert (=> b!260534 (= res!127324 (bvslt #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (= (and d!62607 c!44289) b!260526))

(assert (= (and d!62607 (not c!44289)) b!260532))

(assert (= (and b!260532 c!44286) b!260529))

(assert (= (and b!260532 (not c!44286)) b!260531))

(assert (= (or b!260529 b!260531) bm!24834))

(assert (= (and d!62607 res!127325) b!260523))

(assert (= (and b!260523 res!127323) b!260534))

(assert (= (and b!260534 res!127324) b!260527))

(assert (= (and b!260534 c!44288) b!260525))

(assert (= (and b!260534 (not c!44288)) b!260524))

(assert (= (and b!260525 res!127326) b!260528))

(assert (= (and b!260524 c!44287) b!260533))

(assert (= (and b!260524 (not c!44287)) b!260530))

(declare-fun b_lambda!8289 () Bool)

(assert (=> (not b_lambda!8289) (not b!260528)))

(assert (=> b!260528 t!8800))

(declare-fun b_and!13887 () Bool)

(assert (= b_and!13885 (and (=> t!8800 result!5401) b_and!13887)))

(declare-fun b_lambda!8291 () Bool)

(assert (=> (not b_lambda!8291) (not b!260529)))

(assert (=> b!260529 t!8800))

(declare-fun b_and!13889 () Bool)

(assert (= b_and!13887 (and (=> t!8800 result!5401) b_and!13889)))

(declare-fun m!276359 () Bool)

(assert (=> b!260529 m!276359))

(assert (=> b!260529 m!276359))

(declare-fun m!276361 () Bool)

(assert (=> b!260529 m!276361))

(assert (=> b!260529 m!276113))

(assert (=> b!260529 m!276115))

(assert (=> b!260529 m!276119))

(assert (=> b!260529 m!276055))

(assert (=> b!260529 m!276115))

(assert (=> b!260529 m!276113))

(declare-fun m!276363 () Bool)

(assert (=> b!260529 m!276363))

(declare-fun m!276365 () Bool)

(assert (=> b!260529 m!276365))

(declare-fun m!276367 () Bool)

(assert (=> d!62607 m!276367))

(assert (=> d!62607 m!275875))

(declare-fun m!276369 () Bool)

(assert (=> bm!24834 m!276369))

(assert (=> b!260532 m!276055))

(assert (=> b!260532 m!276055))

(assert (=> b!260532 m!276075))

(assert (=> b!260528 m!276113))

(assert (=> b!260528 m!276115))

(assert (=> b!260528 m!276119))

(assert (=> b!260528 m!276055))

(assert (=> b!260528 m!276115))

(assert (=> b!260528 m!276055))

(declare-fun m!276371 () Bool)

(assert (=> b!260528 m!276371))

(assert (=> b!260528 m!276113))

(assert (=> b!260527 m!276055))

(assert (=> b!260527 m!276055))

(assert (=> b!260527 m!276075))

(declare-fun m!276373 () Bool)

(assert (=> b!260523 m!276373))

(declare-fun m!276375 () Bool)

(assert (=> b!260530 m!276375))

(assert (=> b!260525 m!276055))

(assert (=> b!260525 m!276055))

(declare-fun m!276377 () Bool)

(assert (=> b!260525 m!276377))

(assert (=> b!260533 m!276369))

(assert (=> bm!24798 d!62607))

(declare-fun b!260535 () Bool)

(declare-fun res!127327 () Bool)

(declare-fun e!168834 () Bool)

(assert (=> b!260535 (=> (not res!127327) (not e!168834))))

(declare-fun lt!131449 () ListLongMap!3769)

(assert (=> b!260535 (= res!127327 (not (contains!1865 lt!131449 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260536 () Bool)

(declare-fun e!168837 () Bool)

(declare-fun e!168835 () Bool)

(assert (=> b!260536 (= e!168837 e!168835)))

(declare-fun c!44291 () Bool)

(assert (=> b!260536 (= c!44291 (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(declare-fun b!260537 () Bool)

(declare-fun e!168839 () Bool)

(assert (=> b!260537 (= e!168837 e!168839)))

(assert (=> b!260537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(declare-fun res!127330 () Bool)

(assert (=> b!260537 (= res!127330 (contains!1865 lt!131449 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> b!260537 (=> (not res!127330) (not e!168839))))

(declare-fun b!260538 () Bool)

(declare-fun e!168838 () ListLongMap!3769)

(assert (=> b!260538 (= e!168838 (ListLongMap!3770 Nil!3729))))

(declare-fun b!260539 () Bool)

(declare-fun e!168840 () Bool)

(assert (=> b!260539 (= e!168840 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> b!260539 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260540 () Bool)

(assert (=> b!260540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (=> b!260540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6308 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))))))))

(assert (=> b!260540 (= e!168839 (= (apply!258 lt!131449 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260541 () Bool)

(declare-fun lt!131450 () Unit!8056)

(declare-fun lt!131453 () Unit!8056)

(assert (=> b!260541 (= lt!131450 lt!131453)))

(declare-fun lt!131451 () ListLongMap!3769)

(declare-fun lt!131447 () (_ BitVec 64))

(declare-fun lt!131452 () V!8473)

(declare-fun lt!131448 () (_ BitVec 64))

(assert (=> b!260541 (not (contains!1865 (+!697 lt!131451 (tuple2!4855 lt!131447 lt!131452)) lt!131448))))

(assert (=> b!260541 (= lt!131453 (addStillNotContains!129 lt!131451 lt!131447 lt!131452 lt!131448))))

(assert (=> b!260541 (= lt!131448 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260541 (= lt!131452 (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260541 (= lt!131447 (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))

(declare-fun call!24838 () ListLongMap!3769)

(assert (=> b!260541 (= lt!131451 call!24838)))

(declare-fun e!168836 () ListLongMap!3769)

(assert (=> b!260541 (= e!168836 (+!697 call!24838 (tuple2!4855 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62609 () Bool)

(assert (=> d!62609 e!168834))

(declare-fun res!127329 () Bool)

(assert (=> d!62609 (=> (not res!127329) (not e!168834))))

(assert (=> d!62609 (= res!127329 (not (contains!1865 lt!131449 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62609 (= lt!131449 e!168838)))

(declare-fun c!44293 () Bool)

(assert (=> d!62609 (= c!44293 (bvsge #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (=> d!62609 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62609 (= (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131449)))

(declare-fun b!260542 () Bool)

(assert (=> b!260542 (= e!168835 (isEmpty!542 lt!131449))))

(declare-fun b!260543 () Bool)

(assert (=> b!260543 (= e!168836 call!24838)))

(declare-fun b!260544 () Bool)

(assert (=> b!260544 (= e!168838 e!168836)))

(declare-fun c!44290 () Bool)

(assert (=> b!260544 (= c!44290 (validKeyInArray!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun bm!24835 () Bool)

(assert (=> bm!24835 (= call!24838 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260545 () Bool)

(assert (=> b!260545 (= e!168835 (= lt!131449 (getCurrentListMapNoExtraKeys!574 lt!131140 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504))))))

(declare-fun b!260546 () Bool)

(assert (=> b!260546 (= e!168834 e!168837)))

(declare-fun c!44292 () Bool)

(assert (=> b!260546 (= c!44292 e!168840)))

(declare-fun res!127328 () Bool)

(assert (=> b!260546 (=> (not res!127328) (not e!168840))))

(assert (=> b!260546 (= res!127328 (bvslt #b00000000000000000000000000000000 (size!6309 lt!131140)))))

(assert (= (and d!62609 c!44293) b!260538))

(assert (= (and d!62609 (not c!44293)) b!260544))

(assert (= (and b!260544 c!44290) b!260541))

(assert (= (and b!260544 (not c!44290)) b!260543))

(assert (= (or b!260541 b!260543) bm!24835))

(assert (= (and d!62609 res!127329) b!260535))

(assert (= (and b!260535 res!127327) b!260546))

(assert (= (and b!260546 res!127328) b!260539))

(assert (= (and b!260546 c!44292) b!260537))

(assert (= (and b!260546 (not c!44292)) b!260536))

(assert (= (and b!260537 res!127330) b!260540))

(assert (= (and b!260536 c!44291) b!260545))

(assert (= (and b!260536 (not c!44291)) b!260542))

(declare-fun b_lambda!8293 () Bool)

(assert (=> (not b_lambda!8293) (not b!260540)))

(assert (=> b!260540 t!8800))

(declare-fun b_and!13891 () Bool)

(assert (= b_and!13889 (and (=> t!8800 result!5401) b_and!13891)))

(declare-fun b_lambda!8295 () Bool)

(assert (=> (not b_lambda!8295) (not b!260541)))

(assert (=> b!260541 t!8800))

(declare-fun b_and!13893 () Bool)

(assert (= b_and!13891 (and (=> t!8800 result!5401) b_and!13893)))

(declare-fun m!276379 () Bool)

(assert (=> b!260541 m!276379))

(assert (=> b!260541 m!276379))

(declare-fun m!276381 () Bool)

(assert (=> b!260541 m!276381))

(assert (=> b!260541 m!276217))

(assert (=> b!260541 m!276115))

(assert (=> b!260541 m!276221))

(assert (=> b!260541 m!276157))

(assert (=> b!260541 m!276115))

(assert (=> b!260541 m!276217))

(declare-fun m!276383 () Bool)

(assert (=> b!260541 m!276383))

(declare-fun m!276385 () Bool)

(assert (=> b!260541 m!276385))

(declare-fun m!276387 () Bool)

(assert (=> d!62609 m!276387))

(assert (=> d!62609 m!275875))

(declare-fun m!276389 () Bool)

(assert (=> bm!24835 m!276389))

(assert (=> b!260544 m!276157))

(assert (=> b!260544 m!276157))

(assert (=> b!260544 m!276161))

(assert (=> b!260540 m!276217))

(assert (=> b!260540 m!276115))

(assert (=> b!260540 m!276221))

(assert (=> b!260540 m!276157))

(assert (=> b!260540 m!276115))

(assert (=> b!260540 m!276157))

(declare-fun m!276391 () Bool)

(assert (=> b!260540 m!276391))

(assert (=> b!260540 m!276217))

(assert (=> b!260539 m!276157))

(assert (=> b!260539 m!276157))

(assert (=> b!260539 m!276161))

(declare-fun m!276393 () Bool)

(assert (=> b!260535 m!276393))

(declare-fun m!276395 () Bool)

(assert (=> b!260542 m!276395))

(assert (=> b!260537 m!276157))

(assert (=> b!260537 m!276157))

(declare-fun m!276397 () Bool)

(assert (=> b!260537 m!276397))

(assert (=> b!260545 m!276389))

(assert (=> b!260355 d!62609))

(declare-fun d!62611 () Bool)

(assert (=> d!62611 (= (apply!258 lt!131344 lt!131348) (get!3078 (getValueByKey!317 (toList!1900 lt!131344) lt!131348)))))

(declare-fun bs!9187 () Bool)

(assert (= bs!9187 d!62611))

(declare-fun m!276399 () Bool)

(assert (=> bs!9187 m!276399))

(assert (=> bs!9187 m!276399))

(declare-fun m!276401 () Bool)

(assert (=> bs!9187 m!276401))

(assert (=> b!260355 d!62611))

(declare-fun d!62613 () Bool)

(assert (=> d!62613 (= (apply!258 lt!131363 lt!131352) (get!3078 (getValueByKey!317 (toList!1900 lt!131363) lt!131352)))))

(declare-fun bs!9188 () Bool)

(assert (= bs!9188 d!62613))

(declare-fun m!276403 () Bool)

(assert (=> bs!9188 m!276403))

(assert (=> bs!9188 m!276403))

(declare-fun m!276405 () Bool)

(assert (=> bs!9188 m!276405))

(assert (=> b!260355 d!62613))

(declare-fun d!62615 () Bool)

(assert (=> d!62615 (= (apply!258 (+!697 lt!131344 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) lt!131348) (apply!258 lt!131344 lt!131348))))

(declare-fun lt!131456 () Unit!8056)

(declare-fun choose!1275 (ListLongMap!3769 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8056)

(assert (=> d!62615 (= lt!131456 (choose!1275 lt!131344 lt!131356 (minValue!4635 thiss!1504) lt!131348))))

(declare-fun e!168843 () Bool)

(assert (=> d!62615 e!168843))

(declare-fun res!127333 () Bool)

(assert (=> d!62615 (=> (not res!127333) (not e!168843))))

(assert (=> d!62615 (= res!127333 (contains!1865 lt!131344 lt!131348))))

(assert (=> d!62615 (= (addApplyDifferent!234 lt!131344 lt!131356 (minValue!4635 thiss!1504) lt!131348) lt!131456)))

(declare-fun b!260550 () Bool)

(assert (=> b!260550 (= e!168843 (not (= lt!131348 lt!131356)))))

(assert (= (and d!62615 res!127333) b!260550))

(assert (=> d!62615 m!276201))

(declare-fun m!276407 () Bool)

(assert (=> d!62615 m!276407))

(declare-fun m!276409 () Bool)

(assert (=> d!62615 m!276409))

(assert (=> d!62615 m!276185))

(assert (=> d!62615 m!276185))

(assert (=> d!62615 m!276187))

(assert (=> b!260355 d!62615))

(declare-fun d!62617 () Bool)

(assert (=> d!62617 (= (apply!258 lt!131353 lt!131345) (get!3078 (getValueByKey!317 (toList!1900 lt!131353) lt!131345)))))

(declare-fun bs!9189 () Bool)

(assert (= bs!9189 d!62617))

(declare-fun m!276411 () Bool)

(assert (=> bs!9189 m!276411))

(assert (=> bs!9189 m!276411))

(declare-fun m!276413 () Bool)

(assert (=> bs!9189 m!276413))

(assert (=> b!260355 d!62617))

(declare-fun d!62619 () Bool)

(assert (=> d!62619 (= (apply!258 (+!697 lt!131344 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) lt!131348) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131344 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))) lt!131348)))))

(declare-fun bs!9190 () Bool)

(assert (= bs!9190 d!62619))

(declare-fun m!276415 () Bool)

(assert (=> bs!9190 m!276415))

(assert (=> bs!9190 m!276415))

(declare-fun m!276417 () Bool)

(assert (=> bs!9190 m!276417))

(assert (=> b!260355 d!62619))

(declare-fun d!62621 () Bool)

(declare-fun e!168845 () Bool)

(assert (=> d!62621 e!168845))

(declare-fun res!127334 () Bool)

(assert (=> d!62621 (=> res!127334 e!168845)))

(declare-fun lt!131459 () Bool)

(assert (=> d!62621 (= res!127334 (not lt!131459))))

(declare-fun lt!131457 () Bool)

(assert (=> d!62621 (= lt!131459 lt!131457)))

(declare-fun lt!131458 () Unit!8056)

(declare-fun e!168844 () Unit!8056)

(assert (=> d!62621 (= lt!131458 e!168844)))

(declare-fun c!44294 () Bool)

(assert (=> d!62621 (= c!44294 lt!131457)))

(assert (=> d!62621 (= lt!131457 (containsKey!308 (toList!1900 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) lt!131347))))

(assert (=> d!62621 (= (contains!1865 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) lt!131347) lt!131459)))

(declare-fun b!260551 () Bool)

(declare-fun lt!131460 () Unit!8056)

(assert (=> b!260551 (= e!168844 lt!131460)))

(assert (=> b!260551 (= lt!131460 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) lt!131347))))

(assert (=> b!260551 (isDefined!257 (getValueByKey!317 (toList!1900 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) lt!131347))))

(declare-fun b!260552 () Bool)

(declare-fun Unit!8074 () Unit!8056)

(assert (=> b!260552 (= e!168844 Unit!8074)))

(declare-fun b!260553 () Bool)

(assert (=> b!260553 (= e!168845 (isDefined!257 (getValueByKey!317 (toList!1900 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) lt!131347)))))

(assert (= (and d!62621 c!44294) b!260551))

(assert (= (and d!62621 (not c!44294)) b!260552))

(assert (= (and d!62621 (not res!127334)) b!260553))

(declare-fun m!276419 () Bool)

(assert (=> d!62621 m!276419))

(declare-fun m!276421 () Bool)

(assert (=> b!260551 m!276421))

(declare-fun m!276423 () Bool)

(assert (=> b!260551 m!276423))

(assert (=> b!260551 m!276423))

(declare-fun m!276425 () Bool)

(assert (=> b!260551 m!276425))

(assert (=> b!260553 m!276423))

(assert (=> b!260553 m!276423))

(assert (=> b!260553 m!276425))

(assert (=> b!260355 d!62621))

(declare-fun d!62623 () Bool)

(assert (=> d!62623 (= (apply!258 (+!697 lt!131363 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) lt!131352) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131363 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))) lt!131352)))))

(declare-fun bs!9191 () Bool)

(assert (= bs!9191 d!62623))

(declare-fun m!276427 () Bool)

(assert (=> bs!9191 m!276427))

(assert (=> bs!9191 m!276427))

(declare-fun m!276429 () Bool)

(assert (=> bs!9191 m!276429))

(assert (=> b!260355 d!62623))

(declare-fun d!62625 () Bool)

(declare-fun e!168846 () Bool)

(assert (=> d!62625 e!168846))

(declare-fun res!127335 () Bool)

(assert (=> d!62625 (=> (not res!127335) (not e!168846))))

(declare-fun lt!131463 () ListLongMap!3769)

(assert (=> d!62625 (= res!127335 (contains!1865 lt!131463 (_1!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131462 () List!3732)

(assert (=> d!62625 (= lt!131463 (ListLongMap!3770 lt!131462))))

(declare-fun lt!131464 () Unit!8056)

(declare-fun lt!131461 () Unit!8056)

(assert (=> d!62625 (= lt!131464 lt!131461)))

(assert (=> d!62625 (= (getValueByKey!317 lt!131462 (_1!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62625 (= lt!131461 (lemmaContainsTupThenGetReturnValue!173 lt!131462 (_1!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62625 (= lt!131462 (insertStrictlySorted!176 (toList!1900 lt!131353) (_1!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62625 (= (+!697 lt!131353 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) lt!131463)))

(declare-fun b!260554 () Bool)

(declare-fun res!127336 () Bool)

(assert (=> b!260554 (=> (not res!127336) (not e!168846))))

(assert (=> b!260554 (= res!127336 (= (getValueByKey!317 (toList!1900 lt!131463) (_1!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260555 () Bool)

(assert (=> b!260555 (= e!168846 (contains!1868 (toList!1900 lt!131463) (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62625 res!127335) b!260554))

(assert (= (and b!260554 res!127336) b!260555))

(declare-fun m!276431 () Bool)

(assert (=> d!62625 m!276431))

(declare-fun m!276433 () Bool)

(assert (=> d!62625 m!276433))

(declare-fun m!276435 () Bool)

(assert (=> d!62625 m!276435))

(declare-fun m!276437 () Bool)

(assert (=> d!62625 m!276437))

(declare-fun m!276439 () Bool)

(assert (=> b!260554 m!276439))

(declare-fun m!276441 () Bool)

(assert (=> b!260555 m!276441))

(assert (=> b!260355 d!62625))

(declare-fun d!62627 () Bool)

(declare-fun e!168847 () Bool)

(assert (=> d!62627 e!168847))

(declare-fun res!127337 () Bool)

(assert (=> d!62627 (=> (not res!127337) (not e!168847))))

(declare-fun lt!131467 () ListLongMap!3769)

(assert (=> d!62627 (= res!127337 (contains!1865 lt!131467 (_1!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131466 () List!3732)

(assert (=> d!62627 (= lt!131467 (ListLongMap!3770 lt!131466))))

(declare-fun lt!131468 () Unit!8056)

(declare-fun lt!131465 () Unit!8056)

(assert (=> d!62627 (= lt!131468 lt!131465)))

(assert (=> d!62627 (= (getValueByKey!317 lt!131466 (_1!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))))))

(assert (=> d!62627 (= lt!131465 (lemmaContainsTupThenGetReturnValue!173 lt!131466 (_1!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))))))

(assert (=> d!62627 (= lt!131466 (insertStrictlySorted!176 (toList!1900 lt!131344) (_1!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))))))

(assert (=> d!62627 (= (+!697 lt!131344 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))) lt!131467)))

(declare-fun b!260556 () Bool)

(declare-fun res!127338 () Bool)

(assert (=> b!260556 (=> (not res!127338) (not e!168847))))

(assert (=> b!260556 (= res!127338 (= (getValueByKey!317 (toList!1900 lt!131467) (_1!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))))))))

(declare-fun b!260557 () Bool)

(assert (=> b!260557 (= e!168847 (contains!1868 (toList!1900 lt!131467) (tuple2!4855 lt!131356 (minValue!4635 thiss!1504))))))

(assert (= (and d!62627 res!127337) b!260556))

(assert (= (and b!260556 res!127338) b!260557))

(declare-fun m!276443 () Bool)

(assert (=> d!62627 m!276443))

(declare-fun m!276445 () Bool)

(assert (=> d!62627 m!276445))

(declare-fun m!276447 () Bool)

(assert (=> d!62627 m!276447))

(declare-fun m!276449 () Bool)

(assert (=> d!62627 m!276449))

(declare-fun m!276451 () Bool)

(assert (=> b!260556 m!276451))

(declare-fun m!276453 () Bool)

(assert (=> b!260557 m!276453))

(assert (=> b!260355 d!62627))

(declare-fun d!62629 () Bool)

(assert (=> d!62629 (= (apply!258 (+!697 lt!131353 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) lt!131345) (apply!258 lt!131353 lt!131345))))

(declare-fun lt!131469 () Unit!8056)

(assert (=> d!62629 (= lt!131469 (choose!1275 lt!131353 lt!131361 (zeroValue!4635 thiss!1504) lt!131345))))

(declare-fun e!168848 () Bool)

(assert (=> d!62629 e!168848))

(declare-fun res!127339 () Bool)

(assert (=> d!62629 (=> (not res!127339) (not e!168848))))

(assert (=> d!62629 (= res!127339 (contains!1865 lt!131353 lt!131345))))

(assert (=> d!62629 (= (addApplyDifferent!234 lt!131353 lt!131361 (zeroValue!4635 thiss!1504) lt!131345) lt!131469)))

(declare-fun b!260558 () Bool)

(assert (=> b!260558 (= e!168848 (not (= lt!131345 lt!131361)))))

(assert (= (and d!62629 res!127339) b!260558))

(assert (=> d!62629 m!276211))

(declare-fun m!276455 () Bool)

(assert (=> d!62629 m!276455))

(declare-fun m!276457 () Bool)

(assert (=> d!62629 m!276457))

(assert (=> d!62629 m!276195))

(assert (=> d!62629 m!276195))

(assert (=> d!62629 m!276197))

(assert (=> b!260355 d!62629))

(declare-fun d!62631 () Bool)

(assert (=> d!62631 (= (apply!258 (+!697 lt!131353 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504))) lt!131345) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131353 (tuple2!4855 lt!131361 (zeroValue!4635 thiss!1504)))) lt!131345)))))

(declare-fun bs!9192 () Bool)

(assert (= bs!9192 d!62631))

(declare-fun m!276459 () Bool)

(assert (=> bs!9192 m!276459))

(assert (=> bs!9192 m!276459))

(declare-fun m!276461 () Bool)

(assert (=> bs!9192 m!276461))

(assert (=> b!260355 d!62631))

(declare-fun d!62633 () Bool)

(declare-fun e!168849 () Bool)

(assert (=> d!62633 e!168849))

(declare-fun res!127340 () Bool)

(assert (=> d!62633 (=> (not res!127340) (not e!168849))))

(declare-fun lt!131472 () ListLongMap!3769)

(assert (=> d!62633 (= res!127340 (contains!1865 lt!131472 (_1!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131471 () List!3732)

(assert (=> d!62633 (= lt!131472 (ListLongMap!3770 lt!131471))))

(declare-fun lt!131473 () Unit!8056)

(declare-fun lt!131470 () Unit!8056)

(assert (=> d!62633 (= lt!131473 lt!131470)))

(assert (=> d!62633 (= (getValueByKey!317 lt!131471 (_1!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62633 (= lt!131470 (lemmaContainsTupThenGetReturnValue!173 lt!131471 (_1!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62633 (= lt!131471 (insertStrictlySorted!176 (toList!1900 lt!131342) (_1!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62633 (= (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) lt!131472)))

(declare-fun b!260559 () Bool)

(declare-fun res!127341 () Bool)

(assert (=> b!260559 (=> (not res!127341) (not e!168849))))

(assert (=> b!260559 (= res!127341 (= (getValueByKey!317 (toList!1900 lt!131472) (_1!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260560 () Bool)

(assert (=> b!260560 (= e!168849 (contains!1868 (toList!1900 lt!131472) (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62633 res!127340) b!260559))

(assert (= (and b!260559 res!127341) b!260560))

(declare-fun m!276463 () Bool)

(assert (=> d!62633 m!276463))

(declare-fun m!276465 () Bool)

(assert (=> d!62633 m!276465))

(declare-fun m!276467 () Bool)

(assert (=> d!62633 m!276467))

(declare-fun m!276469 () Bool)

(assert (=> d!62633 m!276469))

(declare-fun m!276471 () Bool)

(assert (=> b!260559 m!276471))

(declare-fun m!276473 () Bool)

(assert (=> b!260560 m!276473))

(assert (=> b!260355 d!62633))

(declare-fun d!62635 () Bool)

(declare-fun e!168850 () Bool)

(assert (=> d!62635 e!168850))

(declare-fun res!127342 () Bool)

(assert (=> d!62635 (=> (not res!127342) (not e!168850))))

(declare-fun lt!131476 () ListLongMap!3769)

(assert (=> d!62635 (= res!127342 (contains!1865 lt!131476 (_1!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131475 () List!3732)

(assert (=> d!62635 (= lt!131476 (ListLongMap!3770 lt!131475))))

(declare-fun lt!131477 () Unit!8056)

(declare-fun lt!131474 () Unit!8056)

(assert (=> d!62635 (= lt!131477 lt!131474)))

(assert (=> d!62635 (= (getValueByKey!317 lt!131475 (_1!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))))))

(assert (=> d!62635 (= lt!131474 (lemmaContainsTupThenGetReturnValue!173 lt!131475 (_1!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))))))

(assert (=> d!62635 (= lt!131475 (insertStrictlySorted!176 (toList!1900 lt!131363) (_1!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))))))

(assert (=> d!62635 (= (+!697 lt!131363 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) lt!131476)))

(declare-fun b!260561 () Bool)

(declare-fun res!127343 () Bool)

(assert (=> b!260561 (=> (not res!127343) (not e!168850))))

(assert (=> b!260561 (= res!127343 (= (getValueByKey!317 (toList!1900 lt!131476) (_1!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))))))))

(declare-fun b!260562 () Bool)

(assert (=> b!260562 (= e!168850 (contains!1868 (toList!1900 lt!131476) (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))))))

(assert (= (and d!62635 res!127342) b!260561))

(assert (= (and b!260561 res!127343) b!260562))

(declare-fun m!276475 () Bool)

(assert (=> d!62635 m!276475))

(declare-fun m!276477 () Bool)

(assert (=> d!62635 m!276477))

(declare-fun m!276479 () Bool)

(assert (=> d!62635 m!276479))

(declare-fun m!276481 () Bool)

(assert (=> d!62635 m!276481))

(declare-fun m!276483 () Bool)

(assert (=> b!260561 m!276483))

(declare-fun m!276485 () Bool)

(assert (=> b!260562 m!276485))

(assert (=> b!260355 d!62635))

(declare-fun d!62637 () Bool)

(assert (=> d!62637 (= (apply!258 (+!697 lt!131363 (tuple2!4855 lt!131343 (minValue!4635 thiss!1504))) lt!131352) (apply!258 lt!131363 lt!131352))))

(declare-fun lt!131478 () Unit!8056)

(assert (=> d!62637 (= lt!131478 (choose!1275 lt!131363 lt!131343 (minValue!4635 thiss!1504) lt!131352))))

(declare-fun e!168851 () Bool)

(assert (=> d!62637 e!168851))

(declare-fun res!127344 () Bool)

(assert (=> d!62637 (=> (not res!127344) (not e!168851))))

(assert (=> d!62637 (= res!127344 (contains!1865 lt!131363 lt!131352))))

(assert (=> d!62637 (= (addApplyDifferent!234 lt!131363 lt!131343 (minValue!4635 thiss!1504) lt!131352) lt!131478)))

(declare-fun b!260563 () Bool)

(assert (=> b!260563 (= e!168851 (not (= lt!131352 lt!131343)))))

(assert (= (and d!62637 res!127344) b!260563))

(assert (=> d!62637 m!276183))

(declare-fun m!276487 () Bool)

(assert (=> d!62637 m!276487))

(declare-fun m!276489 () Bool)

(assert (=> d!62637 m!276489))

(assert (=> d!62637 m!276205))

(assert (=> d!62637 m!276205))

(assert (=> d!62637 m!276207))

(assert (=> b!260355 d!62637))

(declare-fun d!62639 () Bool)

(assert (=> d!62639 (contains!1865 (+!697 lt!131342 (tuple2!4855 lt!131355 (zeroValue!4635 thiss!1504))) lt!131347)))

(declare-fun lt!131481 () Unit!8056)

(declare-fun choose!1276 (ListLongMap!3769 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8056)

(assert (=> d!62639 (= lt!131481 (choose!1276 lt!131342 lt!131355 (zeroValue!4635 thiss!1504) lt!131347))))

(assert (=> d!62639 (contains!1865 lt!131342 lt!131347)))

(assert (=> d!62639 (= (addStillContains!234 lt!131342 lt!131355 (zeroValue!4635 thiss!1504) lt!131347) lt!131481)))

(declare-fun bs!9193 () Bool)

(assert (= bs!9193 d!62639))

(assert (=> bs!9193 m!276191))

(assert (=> bs!9193 m!276191))

(assert (=> bs!9193 m!276193))

(declare-fun m!276491 () Bool)

(assert (=> bs!9193 m!276491))

(declare-fun m!276493 () Bool)

(assert (=> bs!9193 m!276493))

(assert (=> b!260355 d!62639))

(declare-fun d!62641 () Bool)

(assert (=> d!62641 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131150) key!932))))

(declare-fun lt!131484 () Unit!8056)

(declare-fun choose!1277 (List!3732 (_ BitVec 64)) Unit!8056)

(assert (=> d!62641 (= lt!131484 (choose!1277 (toList!1900 lt!131150) key!932))))

(declare-fun e!168854 () Bool)

(assert (=> d!62641 e!168854))

(declare-fun res!127347 () Bool)

(assert (=> d!62641 (=> (not res!127347) (not e!168854))))

(declare-fun isStrictlySorted!362 (List!3732) Bool)

(assert (=> d!62641 (= res!127347 (isStrictlySorted!362 (toList!1900 lt!131150)))))

(assert (=> d!62641 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131150) key!932) lt!131484)))

(declare-fun b!260567 () Bool)

(assert (=> b!260567 (= e!168854 (containsKey!308 (toList!1900 lt!131150) key!932))))

(assert (= (and d!62641 res!127347) b!260567))

(assert (=> d!62641 m!276069))

(assert (=> d!62641 m!276069))

(assert (=> d!62641 m!276071))

(declare-fun m!276495 () Bool)

(assert (=> d!62641 m!276495))

(declare-fun m!276497 () Bool)

(assert (=> d!62641 m!276497))

(assert (=> b!260567 m!276065))

(assert (=> b!260211 d!62641))

(declare-fun d!62643 () Bool)

(declare-fun isEmpty!543 (Option!323) Bool)

(assert (=> d!62643 (= (isDefined!257 (getValueByKey!317 (toList!1900 lt!131150) key!932)) (not (isEmpty!543 (getValueByKey!317 (toList!1900 lt!131150) key!932))))))

(declare-fun bs!9194 () Bool)

(assert (= bs!9194 d!62643))

(assert (=> bs!9194 m!276069))

(declare-fun m!276499 () Bool)

(assert (=> bs!9194 m!276499))

(assert (=> b!260211 d!62643))

(declare-fun b!260571 () Bool)

(declare-fun e!168856 () Option!323)

(assert (=> b!260571 (= e!168856 None!321)))

(declare-fun b!260569 () Bool)

(declare-fun e!168855 () Option!323)

(assert (=> b!260569 (= e!168855 e!168856)))

(declare-fun c!44296 () Bool)

(assert (=> b!260569 (= c!44296 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (not (= (_1!2438 (h!4392 (toList!1900 lt!131150))) key!932))))))

(declare-fun d!62645 () Bool)

(declare-fun c!44295 () Bool)

(assert (=> d!62645 (= c!44295 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (= (_1!2438 (h!4392 (toList!1900 lt!131150))) key!932)))))

(assert (=> d!62645 (= (getValueByKey!317 (toList!1900 lt!131150) key!932) e!168855)))

(declare-fun b!260570 () Bool)

(assert (=> b!260570 (= e!168856 (getValueByKey!317 (t!8793 (toList!1900 lt!131150)) key!932))))

(declare-fun b!260568 () Bool)

(assert (=> b!260568 (= e!168855 (Some!322 (_2!2438 (h!4392 (toList!1900 lt!131150)))))))

(assert (= (and d!62645 c!44295) b!260568))

(assert (= (and d!62645 (not c!44295)) b!260569))

(assert (= (and b!260569 c!44296) b!260570))

(assert (= (and b!260569 (not c!44296)) b!260571))

(declare-fun m!276501 () Bool)

(assert (=> b!260570 m!276501))

(assert (=> b!260211 d!62645))

(declare-fun d!62647 () Bool)

(declare-fun lt!131487 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!173 (List!3733) (InoxSet (_ BitVec 64)))

(assert (=> d!62647 (= lt!131487 (select (content!173 Nil!3730) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun e!168861 () Bool)

(assert (=> d!62647 (= lt!131487 e!168861)))

(declare-fun res!127353 () Bool)

(assert (=> d!62647 (=> (not res!127353) (not e!168861))))

(assert (=> d!62647 (= res!127353 ((_ is Cons!3729) Nil!3730))))

(assert (=> d!62647 (= (contains!1869 Nil!3730 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) lt!131487)))

(declare-fun b!260576 () Bool)

(declare-fun e!168862 () Bool)

(assert (=> b!260576 (= e!168861 e!168862)))

(declare-fun res!127352 () Bool)

(assert (=> b!260576 (=> res!127352 e!168862)))

(assert (=> b!260576 (= res!127352 (= (h!4393 Nil!3730) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260577 () Bool)

(assert (=> b!260577 (= e!168862 (contains!1869 (t!8794 Nil!3730) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (= (and d!62647 res!127353) b!260576))

(assert (= (and b!260576 (not res!127352)) b!260577))

(declare-fun m!276503 () Bool)

(assert (=> d!62647 m!276503))

(assert (=> d!62647 m!276157))

(declare-fun m!276505 () Bool)

(assert (=> d!62647 m!276505))

(assert (=> b!260577 m!276157))

(declare-fun m!276507 () Bool)

(assert (=> b!260577 m!276507))

(assert (=> b!260315 d!62647))

(assert (=> b!260263 d!62579))

(assert (=> b!260213 d!62643))

(assert (=> b!260213 d!62645))

(declare-fun b!260596 () Bool)

(declare-fun lt!131492 () SeekEntryResult!1148)

(assert (=> b!260596 (and (bvsge (index!6764 lt!131492) #b00000000000000000000000000000000) (bvslt (index!6764 lt!131492) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun e!168873 () Bool)

(assert (=> b!260596 (= e!168873 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6764 lt!131492)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260597 () Bool)

(declare-fun e!168876 () Bool)

(declare-fun e!168877 () Bool)

(assert (=> b!260597 (= e!168876 e!168877)))

(declare-fun res!127360 () Bool)

(assert (=> b!260597 (= res!127360 (and ((_ is Intermediate!1148) lt!131492) (not (undefined!1960 lt!131492)) (bvslt (x!25086 lt!131492) #b01111111111111111111111111111110) (bvsge (x!25086 lt!131492) #b00000000000000000000000000000000) (bvsge (x!25086 lt!131492) #b00000000000000000000000000000000)))))

(assert (=> b!260597 (=> (not res!127360) (not e!168877))))

(declare-fun b!260598 () Bool)

(declare-fun e!168875 () SeekEntryResult!1148)

(declare-fun e!168874 () SeekEntryResult!1148)

(assert (=> b!260598 (= e!168875 e!168874)))

(declare-fun c!44303 () Bool)

(declare-fun lt!131493 () (_ BitVec 64))

(assert (=> b!260598 (= c!44303 (or (= lt!131493 key!932) (= (bvadd lt!131493 lt!131493) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260599 () Bool)

(assert (=> b!260599 (= e!168876 (bvsge (x!25086 lt!131492) #b01111111111111111111111111111110))))

(declare-fun b!260600 () Bool)

(assert (=> b!260600 (and (bvsge (index!6764 lt!131492) #b00000000000000000000000000000000) (bvslt (index!6764 lt!131492) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun res!127362 () Bool)

(assert (=> b!260600 (= res!127362 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6764 lt!131492)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260600 (=> res!127362 e!168873)))

(declare-fun b!260601 () Bool)

(assert (=> b!260601 (and (bvsge (index!6764 lt!131492) #b00000000000000000000000000000000) (bvslt (index!6764 lt!131492) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun res!127361 () Bool)

(assert (=> b!260601 (= res!127361 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6764 lt!131492)) key!932))))

(assert (=> b!260601 (=> res!127361 e!168873)))

(assert (=> b!260601 (= e!168877 e!168873)))

(declare-fun b!260602 () Bool)

(assert (=> b!260602 (= e!168875 (Intermediate!1148 true (toIndex!0 key!932 (mask!11120 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!260603 () Bool)

(assert (=> b!260603 (= e!168874 (Intermediate!1148 false (toIndex!0 key!932 (mask!11120 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!260604 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260604 (= e!168874 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11120 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11120 thiss!1504)) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun d!62649 () Bool)

(assert (=> d!62649 e!168876))

(declare-fun c!44305 () Bool)

(assert (=> d!62649 (= c!44305 (and ((_ is Intermediate!1148) lt!131492) (undefined!1960 lt!131492)))))

(assert (=> d!62649 (= lt!131492 e!168875)))

(declare-fun c!44304 () Bool)

(assert (=> d!62649 (= c!44304 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!62649 (= lt!131493 (select (arr!5960 (_keys!6974 thiss!1504)) (toIndex!0 key!932 (mask!11120 thiss!1504))))))

(assert (=> d!62649 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11120 thiss!1504)) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)) lt!131492)))

(assert (= (and d!62649 c!44304) b!260602))

(assert (= (and d!62649 (not c!44304)) b!260598))

(assert (= (and b!260598 c!44303) b!260603))

(assert (= (and b!260598 (not c!44303)) b!260604))

(assert (= (and d!62649 c!44305) b!260599))

(assert (= (and d!62649 (not c!44305)) b!260597))

(assert (= (and b!260597 res!127360) b!260601))

(assert (= (and b!260601 (not res!127361)) b!260600))

(assert (= (and b!260600 (not res!127362)) b!260596))

(declare-fun m!276509 () Bool)

(assert (=> b!260600 m!276509))

(assert (=> b!260604 m!276265))

(declare-fun m!276511 () Bool)

(assert (=> b!260604 m!276511))

(assert (=> b!260604 m!276511))

(declare-fun m!276513 () Bool)

(assert (=> b!260604 m!276513))

(assert (=> b!260601 m!276509))

(assert (=> b!260596 m!276509))

(assert (=> d!62649 m!276265))

(declare-fun m!276515 () Bool)

(assert (=> d!62649 m!276515))

(assert (=> d!62649 m!275875))

(assert (=> d!62565 d!62649))

(declare-fun d!62651 () Bool)

(declare-fun lt!131499 () (_ BitVec 32))

(declare-fun lt!131498 () (_ BitVec 32))

(assert (=> d!62651 (= lt!131499 (bvmul (bvxor lt!131498 (bvlshr lt!131498 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62651 (= lt!131498 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62651 (and (bvsge (mask!11120 thiss!1504) #b00000000000000000000000000000000) (let ((res!127363 (let ((h!4398 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25105 (bvmul (bvxor h!4398 (bvlshr h!4398 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25105 (bvlshr x!25105 #b00000000000000000000000000001101)) (mask!11120 thiss!1504)))))) (and (bvslt res!127363 (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127363 #b00000000000000000000000000000000))))))

(assert (=> d!62651 (= (toIndex!0 key!932 (mask!11120 thiss!1504)) (bvand (bvxor lt!131499 (bvlshr lt!131499 #b00000000000000000000000000001101)) (mask!11120 thiss!1504)))))

(assert (=> d!62565 d!62651))

(assert (=> d!62565 d!62545))

(declare-fun d!62653 () Bool)

(declare-fun e!168878 () Bool)

(assert (=> d!62653 e!168878))

(declare-fun res!127364 () Bool)

(assert (=> d!62653 (=> (not res!127364) (not e!168878))))

(declare-fun lt!131502 () ListLongMap!3769)

(assert (=> d!62653 (= res!127364 (contains!1865 lt!131502 (_1!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun lt!131501 () List!3732)

(assert (=> d!62653 (= lt!131502 (ListLongMap!3770 lt!131501))))

(declare-fun lt!131503 () Unit!8056)

(declare-fun lt!131500 () Unit!8056)

(assert (=> d!62653 (= lt!131503 lt!131500)))

(assert (=> d!62653 (= (getValueByKey!317 lt!131501 (_1!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!322 (_2!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62653 (= lt!131500 (lemmaContainsTupThenGetReturnValue!173 lt!131501 (_1!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62653 (= lt!131501 (insertStrictlySorted!176 (toList!1900 (ite c!44235 call!24815 (ite c!44233 call!24810 call!24813))) (_1!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62653 (= (+!697 (ite c!44235 call!24815 (ite c!44233 call!24810 call!24813)) (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) lt!131502)))

(declare-fun b!260605 () Bool)

(declare-fun res!127365 () Bool)

(assert (=> b!260605 (=> (not res!127365) (not e!168878))))

(assert (=> b!260605 (= res!127365 (= (getValueByKey!317 (toList!1900 lt!131502) (_1!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!322 (_2!2438 (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))))

(declare-fun b!260606 () Bool)

(assert (=> b!260606 (= e!168878 (contains!1868 (toList!1900 lt!131502) (ite (or c!44235 c!44233) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (= (and d!62653 res!127364) b!260605))

(assert (= (and b!260605 res!127365) b!260606))

(declare-fun m!276517 () Bool)

(assert (=> d!62653 m!276517))

(declare-fun m!276519 () Bool)

(assert (=> d!62653 m!276519))

(declare-fun m!276521 () Bool)

(assert (=> d!62653 m!276521))

(declare-fun m!276523 () Bool)

(assert (=> d!62653 m!276523))

(declare-fun m!276525 () Bool)

(assert (=> b!260605 m!276525))

(declare-fun m!276527 () Bool)

(assert (=> b!260606 m!276527))

(assert (=> bm!24810 d!62653))

(declare-fun d!62655 () Bool)

(assert (=> d!62655 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260300 d!62655))

(declare-fun b!260607 () Bool)

(declare-fun e!168880 () (_ BitVec 32))

(declare-fun e!168879 () (_ BitVec 32))

(assert (=> b!260607 (= e!168880 e!168879)))

(declare-fun c!44307 () Bool)

(assert (=> b!260607 (= c!44307 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62657 () Bool)

(declare-fun lt!131504 () (_ BitVec 32))

(assert (=> d!62657 (and (bvsge lt!131504 #b00000000000000000000000000000000) (bvsle lt!131504 (bvsub (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!62657 (= lt!131504 e!168880)))

(declare-fun c!44306 () Bool)

(assert (=> d!62657 (= c!44306 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62657 (and (bvsle #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6309 (_keys!6974 thiss!1504)) (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(assert (=> d!62657 (= (arrayCountValidKeys!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) lt!131504)))

(declare-fun bm!24836 () Bool)

(declare-fun call!24839 () (_ BitVec 32))

(assert (=> bm!24836 (= call!24839 (arrayCountValidKeys!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260608 () Bool)

(assert (=> b!260608 (= e!168879 (bvadd #b00000000000000000000000000000001 call!24839))))

(declare-fun b!260609 () Bool)

(assert (=> b!260609 (= e!168880 #b00000000000000000000000000000000)))

(declare-fun b!260610 () Bool)

(assert (=> b!260610 (= e!168879 call!24839)))

(assert (= (and d!62657 c!44306) b!260609))

(assert (= (and d!62657 (not c!44306)) b!260607))

(assert (= (and b!260607 c!44307) b!260608))

(assert (= (and b!260607 (not c!44307)) b!260610))

(assert (= (or b!260608 b!260610) bm!24836))

(assert (=> b!260607 m!276347))

(assert (=> b!260607 m!276347))

(assert (=> b!260607 m!276355))

(declare-fun m!276529 () Bool)

(assert (=> bm!24836 m!276529))

(assert (=> b!260302 d!62657))

(assert (=> b!260302 d!62561))

(declare-fun b!260611 () Bool)

(declare-fun e!168882 () (_ BitVec 32))

(declare-fun e!168881 () (_ BitVec 32))

(assert (=> b!260611 (= e!168882 e!168881)))

(declare-fun c!44309 () Bool)

(assert (=> b!260611 (= c!44309 (validKeyInArray!0 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62659 () Bool)

(declare-fun lt!131505 () (_ BitVec 32))

(assert (=> d!62659 (and (bvsge lt!131505 #b00000000000000000000000000000000) (bvsle lt!131505 (bvsub (size!6309 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62659 (= lt!131505 e!168882)))

(declare-fun c!44308 () Bool)

(assert (=> d!62659 (= c!44308 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62659 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6309 (_keys!6974 thiss!1504)) (size!6309 lt!131140)))))

(assert (=> d!62659 (= (arrayCountValidKeys!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))) lt!131505)))

(declare-fun bm!24837 () Bool)

(declare-fun call!24840 () (_ BitVec 32))

(assert (=> bm!24837 (= call!24840 (arrayCountValidKeys!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260612 () Bool)

(assert (=> b!260612 (= e!168881 (bvadd #b00000000000000000000000000000001 call!24840))))

(declare-fun b!260613 () Bool)

(assert (=> b!260613 (= e!168882 #b00000000000000000000000000000000)))

(declare-fun b!260614 () Bool)

(assert (=> b!260614 (= e!168881 call!24840)))

(assert (= (and d!62659 c!44308) b!260613))

(assert (= (and d!62659 (not c!44308)) b!260611))

(assert (= (and b!260611 c!44309) b!260612))

(assert (= (and b!260611 (not c!44309)) b!260614))

(assert (= (or b!260612 b!260614) bm!24837))

(declare-fun m!276531 () Bool)

(assert (=> b!260611 m!276531))

(assert (=> b!260611 m!276531))

(declare-fun m!276533 () Bool)

(assert (=> b!260611 m!276533))

(declare-fun m!276535 () Bool)

(assert (=> bm!24837 m!276535))

(assert (=> bm!24804 d!62659))

(assert (=> b!260369 d!62605))

(assert (=> bm!24812 d!62609))

(declare-fun d!62661 () Bool)

(declare-fun res!127366 () Bool)

(declare-fun e!168883 () Bool)

(assert (=> d!62661 (=> res!127366 e!168883)))

(assert (=> d!62661 (= res!127366 (= (select (arr!5960 (_keys!6974 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62661 (= (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168883)))

(declare-fun b!260615 () Bool)

(declare-fun e!168884 () Bool)

(assert (=> b!260615 (= e!168883 e!168884)))

(declare-fun res!127367 () Bool)

(assert (=> b!260615 (=> (not res!127367) (not e!168884))))

(assert (=> b!260615 (= res!127367 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260616 () Bool)

(assert (=> b!260616 (= e!168884 (arrayContainsKey!0 (_keys!6974 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62661 (not res!127366)) b!260615))

(assert (= (and b!260615 res!127367) b!260616))

(declare-fun m!276537 () Bool)

(assert (=> d!62661 m!276537))

(declare-fun m!276539 () Bool)

(assert (=> b!260616 m!276539))

(assert (=> b!260195 d!62661))

(assert (=> b!260344 d!62605))

(declare-fun d!62663 () Bool)

(declare-fun res!127372 () Bool)

(declare-fun e!168889 () Bool)

(assert (=> d!62663 (=> res!127372 e!168889)))

(assert (=> d!62663 (= res!127372 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (= (_1!2438 (h!4392 (toList!1900 lt!131150))) key!932)))))

(assert (=> d!62663 (= (containsKey!308 (toList!1900 lt!131150) key!932) e!168889)))

(declare-fun b!260621 () Bool)

(declare-fun e!168890 () Bool)

(assert (=> b!260621 (= e!168889 e!168890)))

(declare-fun res!127373 () Bool)

(assert (=> b!260621 (=> (not res!127373) (not e!168890))))

(assert (=> b!260621 (= res!127373 (and (or (not ((_ is Cons!3728) (toList!1900 lt!131150))) (bvsle (_1!2438 (h!4392 (toList!1900 lt!131150))) key!932)) ((_ is Cons!3728) (toList!1900 lt!131150)) (bvslt (_1!2438 (h!4392 (toList!1900 lt!131150))) key!932)))))

(declare-fun b!260622 () Bool)

(assert (=> b!260622 (= e!168890 (containsKey!308 (t!8793 (toList!1900 lt!131150)) key!932))))

(assert (= (and d!62663 (not res!127372)) b!260621))

(assert (= (and b!260621 res!127373) b!260622))

(declare-fun m!276541 () Bool)

(assert (=> b!260622 m!276541))

(assert (=> d!62527 d!62663))

(declare-fun d!62665 () Bool)

(declare-fun e!168892 () Bool)

(assert (=> d!62665 e!168892))

(declare-fun res!127374 () Bool)

(assert (=> d!62665 (=> res!127374 e!168892)))

(declare-fun lt!131508 () Bool)

(assert (=> d!62665 (= res!127374 (not lt!131508))))

(declare-fun lt!131506 () Bool)

(assert (=> d!62665 (= lt!131508 lt!131506)))

(declare-fun lt!131507 () Unit!8056)

(declare-fun e!168891 () Unit!8056)

(assert (=> d!62665 (= lt!131507 e!168891)))

(declare-fun c!44310 () Bool)

(assert (=> d!62665 (= c!44310 lt!131506)))

(assert (=> d!62665 (= lt!131506 (containsKey!308 (toList!1900 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(assert (=> d!62665 (= (contains!1865 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932) lt!131508)))

(declare-fun b!260623 () Bool)

(declare-fun lt!131509 () Unit!8056)

(assert (=> b!260623 (= e!168891 lt!131509)))

(assert (=> b!260623 (= lt!131509 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(assert (=> b!260623 (isDefined!257 (getValueByKey!317 (toList!1900 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(declare-fun b!260624 () Bool)

(declare-fun Unit!8075 () Unit!8056)

(assert (=> b!260624 (= e!168891 Unit!8075)))

(declare-fun b!260625 () Bool)

(assert (=> b!260625 (= e!168892 (isDefined!257 (getValueByKey!317 (toList!1900 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932)))))

(assert (= (and d!62665 c!44310) b!260623))

(assert (= (and d!62665 (not c!44310)) b!260624))

(assert (= (and d!62665 (not res!127374)) b!260625))

(declare-fun m!276543 () Bool)

(assert (=> d!62665 m!276543))

(declare-fun m!276545 () Bool)

(assert (=> b!260623 m!276545))

(declare-fun m!276547 () Bool)

(assert (=> b!260623 m!276547))

(assert (=> b!260623 m!276547))

(declare-fun m!276549 () Bool)

(assert (=> b!260623 m!276549))

(assert (=> b!260625 m!276547))

(assert (=> b!260625 m!276547))

(assert (=> b!260625 m!276549))

(assert (=> d!62567 d!62665))

(assert (=> d!62567 d!62529))

(declare-fun d!62667 () Bool)

(assert (=> d!62667 (contains!1865 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932)))

(assert (=> d!62667 true))

(declare-fun _$17!89 () Unit!8056)

(assert (=> d!62667 (= (choose!1273 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) _$17!89)))

(declare-fun bs!9195 () Bool)

(assert (= bs!9195 d!62667))

(assert (=> bs!9195 m!275867))

(assert (=> bs!9195 m!275867))

(assert (=> bs!9195 m!276271))

(assert (=> d!62567 d!62667))

(assert (=> d!62567 d!62545))

(declare-fun d!62669 () Bool)

(declare-fun e!168894 () Bool)

(assert (=> d!62669 e!168894))

(declare-fun res!127375 () Bool)

(assert (=> d!62669 (=> res!127375 e!168894)))

(declare-fun lt!131512 () Bool)

(assert (=> d!62669 (= res!127375 (not lt!131512))))

(declare-fun lt!131510 () Bool)

(assert (=> d!62669 (= lt!131512 lt!131510)))

(declare-fun lt!131511 () Unit!8056)

(declare-fun e!168893 () Unit!8056)

(assert (=> d!62669 (= lt!131511 e!168893)))

(declare-fun c!44311 () Bool)

(assert (=> d!62669 (= c!44311 lt!131510)))

(assert (=> d!62669 (= lt!131510 (containsKey!308 (toList!1900 lt!131301) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62669 (= (contains!1865 lt!131301 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131512)))

(declare-fun b!260626 () Bool)

(declare-fun lt!131513 () Unit!8056)

(assert (=> b!260626 (= e!168893 lt!131513)))

(assert (=> b!260626 (= lt!131513 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131301) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260626 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260627 () Bool)

(declare-fun Unit!8076 () Unit!8056)

(assert (=> b!260627 (= e!168893 Unit!8076)))

(declare-fun b!260628 () Bool)

(assert (=> b!260628 (= e!168894 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62669 c!44311) b!260626))

(assert (= (and d!62669 (not c!44311)) b!260627))

(assert (= (and d!62669 (not res!127375)) b!260628))

(declare-fun m!276551 () Bool)

(assert (=> d!62669 m!276551))

(declare-fun m!276553 () Bool)

(assert (=> b!260626 m!276553))

(declare-fun m!276555 () Bool)

(assert (=> b!260626 m!276555))

(assert (=> b!260626 m!276555))

(declare-fun m!276557 () Bool)

(assert (=> b!260626 m!276557))

(assert (=> b!260628 m!276555))

(assert (=> b!260628 m!276555))

(assert (=> b!260628 m!276557))

(assert (=> bm!24795 d!62669))

(assert (=> b!260378 d!62579))

(declare-fun d!62671 () Bool)

(assert (=> d!62671 (= (arrayCountValidKeys!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62671 true))

(declare-fun _$84!42 () Unit!8056)

(assert (=> d!62671 (= (choose!1 (_keys!6974 thiss!1504) index!297 key!932) _$84!42)))

(declare-fun bs!9196 () Bool)

(assert (= bs!9196 d!62671))

(assert (=> bs!9196 m!275895))

(assert (=> bs!9196 m!276147))

(assert (=> bs!9196 m!275897))

(assert (=> d!62537 d!62671))

(declare-fun b!260640 () Bool)

(declare-fun e!168897 () Bool)

(assert (=> b!260640 (= e!168897 (and (bvsge (extraKeys!4531 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4531 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1965 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!260638 () Bool)

(declare-fun res!127386 () Bool)

(assert (=> b!260638 (=> (not res!127386) (not e!168897))))

(declare-fun size!6314 (LongMapFixedSize!3832) (_ BitVec 32))

(assert (=> b!260638 (= res!127386 (bvsge (size!6314 thiss!1504) (_size!1965 thiss!1504)))))

(declare-fun b!260637 () Bool)

(declare-fun res!127384 () Bool)

(assert (=> b!260637 (=> (not res!127384) (not e!168897))))

(assert (=> b!260637 (= res!127384 (and (= (size!6308 (_values!4777 thiss!1504)) (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001)) (= (size!6309 (_keys!6974 thiss!1504)) (size!6308 (_values!4777 thiss!1504))) (bvsge (_size!1965 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1965 thiss!1504) (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!260639 () Bool)

(declare-fun res!127385 () Bool)

(assert (=> b!260639 (=> (not res!127385) (not e!168897))))

(assert (=> b!260639 (= res!127385 (= (size!6314 thiss!1504) (bvadd (_size!1965 thiss!1504) (bvsdiv (bvadd (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!62673 () Bool)

(declare-fun res!127387 () Bool)

(assert (=> d!62673 (=> (not res!127387) (not e!168897))))

(assert (=> d!62673 (= res!127387 (validMask!0 (mask!11120 thiss!1504)))))

(assert (=> d!62673 (= (simpleValid!281 thiss!1504) e!168897)))

(assert (= (and d!62673 res!127387) b!260637))

(assert (= (and b!260637 res!127384) b!260638))

(assert (= (and b!260638 res!127386) b!260639))

(assert (= (and b!260639 res!127385) b!260640))

(declare-fun m!276559 () Bool)

(assert (=> b!260638 m!276559))

(assert (=> b!260639 m!276559))

(assert (=> d!62673 m!275875))

(assert (=> d!62523 d!62673))

(assert (=> d!62533 d!62565))

(declare-fun d!62675 () Bool)

(declare-fun e!168900 () Bool)

(assert (=> d!62675 e!168900))

(declare-fun res!127392 () Bool)

(assert (=> d!62675 (=> (not res!127392) (not e!168900))))

(declare-fun lt!131516 () SeekEntryResult!1148)

(assert (=> d!62675 (= res!127392 ((_ is Found!1148) lt!131516))))

(assert (=> d!62675 (= lt!131516 (seekEntryOrOpen!0 key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(assert (=> d!62675 true))

(declare-fun _$33!180 () Unit!8056)

(assert (=> d!62675 (= (choose!1271 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) _$33!180)))

(declare-fun b!260645 () Bool)

(declare-fun res!127393 () Bool)

(assert (=> b!260645 (=> (not res!127393) (not e!168900))))

(assert (=> b!260645 (= res!127393 (inRange!0 (index!6763 lt!131516) (mask!11120 thiss!1504)))))

(declare-fun b!260646 () Bool)

(assert (=> b!260646 (= e!168900 (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6763 lt!131516)) key!932))))

(assert (= (and d!62675 res!127392) b!260645))

(assert (= (and b!260645 res!127393) b!260646))

(assert (=> d!62675 m!275917))

(declare-fun m!276561 () Bool)

(assert (=> b!260645 m!276561))

(declare-fun m!276563 () Bool)

(assert (=> b!260646 m!276563))

(assert (=> d!62533 d!62675))

(assert (=> d!62533 d!62545))

(declare-fun d!62677 () Bool)

(assert (=> d!62677 (= (+!697 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4855 key!932 v!346)) (getCurrentListMap!1432 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62677 true))

(declare-fun _$3!61 () Unit!8056)

(assert (=> d!62677 (= (choose!1272 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)) _$3!61)))

(declare-fun bs!9197 () Bool)

(assert (= bs!9197 d!62677))

(assert (=> bs!9197 m!275881))

(assert (=> bs!9197 m!275867))

(assert (=> bs!9197 m!276169))

(assert (=> bs!9197 m!275867))

(assert (=> bs!9197 m!276171))

(assert (=> bs!9197 m!275895))

(assert (=> d!62543 d!62677))

(assert (=> d!62543 d!62545))

(assert (=> b!260202 d!62561))

(declare-fun bm!24838 () Bool)

(declare-fun call!24841 () Bool)

(declare-fun c!44312 () Bool)

(assert (=> bm!24838 (= call!24841 (arrayNoDuplicates!0 (_keys!6974 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44312 (Cons!3729 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun b!260647 () Bool)

(declare-fun e!168903 () Bool)

(declare-fun e!168901 () Bool)

(assert (=> b!260647 (= e!168903 e!168901)))

(assert (=> b!260647 (= c!44312 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260649 () Bool)

(declare-fun e!168904 () Bool)

(assert (=> b!260649 (= e!168904 (contains!1869 Nil!3730 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260650 () Bool)

(assert (=> b!260650 (= e!168901 call!24841)))

(declare-fun b!260651 () Bool)

(declare-fun e!168902 () Bool)

(assert (=> b!260651 (= e!168902 e!168903)))

(declare-fun res!127396 () Bool)

(assert (=> b!260651 (=> (not res!127396) (not e!168903))))

(assert (=> b!260651 (= res!127396 (not e!168904))))

(declare-fun res!127394 () Bool)

(assert (=> b!260651 (=> (not res!127394) (not e!168904))))

(assert (=> b!260651 (= res!127394 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260648 () Bool)

(assert (=> b!260648 (= e!168901 call!24841)))

(declare-fun d!62679 () Bool)

(declare-fun res!127395 () Bool)

(assert (=> d!62679 (=> res!127395 e!168902)))

(assert (=> d!62679 (= res!127395 (bvsge #b00000000000000000000000000000000 (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62679 (= (arrayNoDuplicates!0 (_keys!6974 thiss!1504) #b00000000000000000000000000000000 Nil!3730) e!168902)))

(assert (= (and d!62679 (not res!127395)) b!260651))

(assert (= (and b!260651 res!127394) b!260649))

(assert (= (and b!260651 res!127396) b!260647))

(assert (= (and b!260647 c!44312) b!260648))

(assert (= (and b!260647 (not c!44312)) b!260650))

(assert (= (or b!260648 b!260650) bm!24838))

(assert (=> bm!24838 m!276055))

(declare-fun m!276565 () Bool)

(assert (=> bm!24838 m!276565))

(assert (=> b!260647 m!276055))

(assert (=> b!260647 m!276055))

(assert (=> b!260647 m!276075))

(assert (=> b!260649 m!276055))

(assert (=> b!260649 m!276055))

(declare-fun m!276567 () Bool)

(assert (=> b!260649 m!276567))

(assert (=> b!260651 m!276055))

(assert (=> b!260651 m!276055))

(assert (=> b!260651 m!276075))

(assert (=> b!260204 d!62679))

(declare-fun d!62681 () Bool)

(declare-fun res!127397 () Bool)

(declare-fun e!168905 () Bool)

(assert (=> d!62681 (=> res!127397 e!168905)))

(assert (=> d!62681 (= res!127397 (= (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62681 (= (arrayContainsKey!0 lt!131140 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168905)))

(declare-fun b!260652 () Bool)

(declare-fun e!168906 () Bool)

(assert (=> b!260652 (= e!168905 e!168906)))

(declare-fun res!127398 () Bool)

(assert (=> b!260652 (=> (not res!127398) (not e!168906))))

(assert (=> b!260652 (= res!127398 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(declare-fun b!260653 () Bool)

(assert (=> b!260653 (= e!168906 (arrayContainsKey!0 lt!131140 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62681 (not res!127397)) b!260652))

(assert (= (and b!260652 res!127398) b!260653))

(assert (=> d!62681 m!276531))

(declare-fun m!276569 () Bool)

(assert (=> b!260653 m!276569))

(assert (=> b!260371 d!62681))

(declare-fun b!260666 () Bool)

(declare-fun e!168915 () SeekEntryResult!1148)

(declare-fun e!168913 () SeekEntryResult!1148)

(assert (=> b!260666 (= e!168915 e!168913)))

(declare-fun c!44321 () Bool)

(declare-fun lt!131522 () (_ BitVec 64))

(assert (=> b!260666 (= c!44321 (= lt!131522 key!932))))

(declare-fun b!260667 () Bool)

(declare-fun c!44320 () Bool)

(assert (=> b!260667 (= c!44320 (= lt!131522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168914 () SeekEntryResult!1148)

(assert (=> b!260667 (= e!168913 e!168914)))

(declare-fun lt!131521 () SeekEntryResult!1148)

(declare-fun d!62683 () Bool)

(assert (=> d!62683 (and (or ((_ is Undefined!1148) lt!131521) (not ((_ is Found!1148) lt!131521)) (and (bvsge (index!6763 lt!131521) #b00000000000000000000000000000000) (bvslt (index!6763 lt!131521) (size!6309 (_keys!6974 thiss!1504))))) (or ((_ is Undefined!1148) lt!131521) ((_ is Found!1148) lt!131521) (not ((_ is MissingVacant!1148) lt!131521)) (not (= (index!6765 lt!131521) (index!6764 lt!131393))) (and (bvsge (index!6765 lt!131521) #b00000000000000000000000000000000) (bvslt (index!6765 lt!131521) (size!6309 (_keys!6974 thiss!1504))))) (or ((_ is Undefined!1148) lt!131521) (ite ((_ is Found!1148) lt!131521) (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6763 lt!131521)) key!932) (and ((_ is MissingVacant!1148) lt!131521) (= (index!6765 lt!131521) (index!6764 lt!131393)) (= (select (arr!5960 (_keys!6974 thiss!1504)) (index!6765 lt!131521)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62683 (= lt!131521 e!168915)))

(declare-fun c!44319 () Bool)

(assert (=> d!62683 (= c!44319 (bvsge (x!25086 lt!131393) #b01111111111111111111111111111110))))

(assert (=> d!62683 (= lt!131522 (select (arr!5960 (_keys!6974 thiss!1504)) (index!6764 lt!131393)))))

(assert (=> d!62683 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62683 (= (seekKeyOrZeroReturnVacant!0 (x!25086 lt!131393) (index!6764 lt!131393) (index!6764 lt!131393) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)) lt!131521)))

(declare-fun b!260668 () Bool)

(assert (=> b!260668 (= e!168914 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25086 lt!131393) #b00000000000000000000000000000001) (nextIndex!0 (index!6764 lt!131393) (bvadd (x!25086 lt!131393) #b00000000000000000000000000000001) (mask!11120 thiss!1504)) (index!6764 lt!131393) key!932 (_keys!6974 thiss!1504) (mask!11120 thiss!1504)))))

(declare-fun b!260669 () Bool)

(assert (=> b!260669 (= e!168914 (MissingVacant!1148 (index!6764 lt!131393)))))

(declare-fun b!260670 () Bool)

(assert (=> b!260670 (= e!168913 (Found!1148 (index!6764 lt!131393)))))

(declare-fun b!260671 () Bool)

(assert (=> b!260671 (= e!168915 Undefined!1148)))

(assert (= (and d!62683 c!44319) b!260671))

(assert (= (and d!62683 (not c!44319)) b!260666))

(assert (= (and b!260666 c!44321) b!260670))

(assert (= (and b!260666 (not c!44321)) b!260667))

(assert (= (and b!260667 c!44320) b!260669))

(assert (= (and b!260667 (not c!44320)) b!260668))

(declare-fun m!276571 () Bool)

(assert (=> d!62683 m!276571))

(declare-fun m!276573 () Bool)

(assert (=> d!62683 m!276573))

(assert (=> d!62683 m!276257))

(assert (=> d!62683 m!275875))

(declare-fun m!276575 () Bool)

(assert (=> b!260668 m!276575))

(assert (=> b!260668 m!276575))

(declare-fun m!276577 () Bool)

(assert (=> b!260668 m!276577))

(assert (=> b!260405 d!62683))

(declare-fun d!62685 () Bool)

(declare-fun e!168916 () Bool)

(assert (=> d!62685 e!168916))

(declare-fun res!127399 () Bool)

(assert (=> d!62685 (=> (not res!127399) (not e!168916))))

(declare-fun lt!131525 () ListLongMap!3769)

(assert (=> d!62685 (= res!127399 (contains!1865 lt!131525 (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lt!131524 () List!3732)

(assert (=> d!62685 (= lt!131525 (ListLongMap!3770 lt!131524))))

(declare-fun lt!131526 () Unit!8056)

(declare-fun lt!131523 () Unit!8056)

(assert (=> d!62685 (= lt!131526 lt!131523)))

(assert (=> d!62685 (= (getValueByKey!317 lt!131524 (_1!2438 (tuple2!4855 key!932 v!346))) (Some!322 (_2!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!62685 (= lt!131523 (lemmaContainsTupThenGetReturnValue!173 lt!131524 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!62685 (= lt!131524 (insertStrictlySorted!176 (toList!1900 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!62685 (= (+!697 (getCurrentListMap!1432 (_keys!6974 thiss!1504) (_values!4777 thiss!1504) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4855 key!932 v!346)) lt!131525)))

(declare-fun b!260672 () Bool)

(declare-fun res!127400 () Bool)

(assert (=> b!260672 (=> (not res!127400) (not e!168916))))

(assert (=> b!260672 (= res!127400 (= (getValueByKey!317 (toList!1900 lt!131525) (_1!2438 (tuple2!4855 key!932 v!346))) (Some!322 (_2!2438 (tuple2!4855 key!932 v!346)))))))

(declare-fun b!260673 () Bool)

(assert (=> b!260673 (= e!168916 (contains!1868 (toList!1900 lt!131525) (tuple2!4855 key!932 v!346)))))

(assert (= (and d!62685 res!127399) b!260672))

(assert (= (and b!260672 res!127400) b!260673))

(declare-fun m!276579 () Bool)

(assert (=> d!62685 m!276579))

(declare-fun m!276581 () Bool)

(assert (=> d!62685 m!276581))

(declare-fun m!276583 () Bool)

(assert (=> d!62685 m!276583))

(declare-fun m!276585 () Bool)

(assert (=> d!62685 m!276585))

(declare-fun m!276587 () Bool)

(assert (=> b!260672 m!276587))

(declare-fun m!276589 () Bool)

(assert (=> b!260673 m!276589))

(assert (=> b!260332 d!62685))

(assert (=> b!260332 d!62529))

(declare-fun b!260674 () Bool)

(declare-fun e!168927 () ListLongMap!3769)

(declare-fun call!24842 () ListLongMap!3769)

(assert (=> b!260674 (= e!168927 (+!697 call!24842 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260675 () Bool)

(declare-fun e!168929 () Bool)

(declare-fun e!168921 () Bool)

(assert (=> b!260675 (= e!168929 e!168921)))

(declare-fun res!127409 () Bool)

(declare-fun call!24845 () Bool)

(assert (=> b!260675 (= res!127409 call!24845)))

(assert (=> b!260675 (=> (not res!127409) (not e!168921))))

(declare-fun bm!24839 () Bool)

(declare-fun call!24844 () ListLongMap!3769)

(assert (=> bm!24839 (= call!24844 call!24842)))

(declare-fun b!260677 () Bool)

(declare-fun e!168920 () Bool)

(declare-fun call!24847 () Bool)

(assert (=> b!260677 (= e!168920 (not call!24847))))

(declare-fun b!260678 () Bool)

(declare-fun e!168919 () ListLongMap!3769)

(assert (=> b!260678 (= e!168919 call!24844)))

(declare-fun b!260679 () Bool)

(declare-fun res!127404 () Bool)

(declare-fun e!168917 () Bool)

(assert (=> b!260679 (=> (not res!127404) (not e!168917))))

(assert (=> b!260679 (= res!127404 e!168920)))

(declare-fun c!44327 () Bool)

(assert (=> b!260679 (= c!44327 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260680 () Bool)

(assert (=> b!260680 (= e!168917 e!168929)))

(declare-fun c!44326 () Bool)

(assert (=> b!260680 (= c!44326 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!168918 () Bool)

(declare-fun b!260681 () Bool)

(assert (=> b!260681 (= e!168918 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260682 () Bool)

(declare-fun res!127408 () Bool)

(assert (=> b!260682 (=> (not res!127408) (not e!168917))))

(declare-fun e!168926 () Bool)

(assert (=> b!260682 (= res!127408 e!168926)))

(declare-fun res!127401 () Bool)

(assert (=> b!260682 (=> res!127401 e!168926)))

(assert (=> b!260682 (= res!127401 (not e!168918))))

(declare-fun res!127402 () Bool)

(assert (=> b!260682 (=> (not res!127402) (not e!168918))))

(assert (=> b!260682 (= res!127402 (bvslt #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(declare-fun b!260683 () Bool)

(assert (=> b!260683 (= e!168927 e!168919)))

(declare-fun c!44323 () Bool)

(assert (=> b!260683 (= c!44323 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260684 () Bool)

(assert (=> b!260684 (= e!168929 (not call!24845))))

(declare-fun b!260685 () Bool)

(declare-fun e!168922 () ListLongMap!3769)

(declare-fun call!24846 () ListLongMap!3769)

(assert (=> b!260685 (= e!168922 call!24846)))

(declare-fun bm!24840 () Bool)

(declare-fun call!24843 () ListLongMap!3769)

(assert (=> bm!24840 (= call!24846 call!24843)))

(declare-fun b!260686 () Bool)

(assert (=> b!260686 (= e!168922 call!24844)))

(declare-fun b!260687 () Bool)

(declare-fun e!168923 () Unit!8056)

(declare-fun Unit!8077 () Unit!8056)

(assert (=> b!260687 (= e!168923 Unit!8077)))

(declare-fun bm!24841 () Bool)

(declare-fun call!24848 () ListLongMap!3769)

(assert (=> bm!24841 (= call!24843 call!24848)))

(declare-fun bm!24842 () Bool)

(declare-fun lt!131536 () ListLongMap!3769)

(assert (=> bm!24842 (= call!24845 (contains!1865 lt!131536 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260676 () Bool)

(declare-fun e!168924 () Bool)

(assert (=> b!260676 (= e!168920 e!168924)))

(declare-fun res!127407 () Bool)

(assert (=> b!260676 (= res!127407 call!24847)))

(assert (=> b!260676 (=> (not res!127407) (not e!168924))))

(declare-fun d!62687 () Bool)

(assert (=> d!62687 e!168917))

(declare-fun res!127403 () Bool)

(assert (=> d!62687 (=> (not res!127403) (not e!168917))))

(assert (=> d!62687 (= res!127403 (or (bvsge #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))))

(declare-fun lt!131543 () ListLongMap!3769)

(assert (=> d!62687 (= lt!131536 lt!131543)))

(declare-fun lt!131531 () Unit!8056)

(assert (=> d!62687 (= lt!131531 e!168923)))

(declare-fun c!44324 () Bool)

(declare-fun e!168928 () Bool)

(assert (=> d!62687 (= c!44324 e!168928)))

(declare-fun res!127405 () Bool)

(assert (=> d!62687 (=> (not res!127405) (not e!168928))))

(assert (=> d!62687 (= res!127405 (bvslt #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(assert (=> d!62687 (= lt!131543 e!168927)))

(declare-fun c!44325 () Bool)

(assert (=> d!62687 (= c!44325 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62687 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62687 (= (getCurrentListMap!1432 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131536)))

(declare-fun b!260688 () Bool)

(declare-fun e!168925 () Bool)

(assert (=> b!260688 (= e!168925 (= (apply!258 lt!131536 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)) (get!3077 (select (arr!5959 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6308 (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))))))))

(assert (=> b!260688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(declare-fun b!260689 () Bool)

(assert (=> b!260689 (= e!168928 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260690 () Bool)

(declare-fun c!44322 () Bool)

(assert (=> b!260690 (= c!44322 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260690 (= e!168919 e!168922)))

(declare-fun b!260691 () Bool)

(assert (=> b!260691 (= e!168924 (= (apply!258 lt!131536 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260692 () Bool)

(declare-fun lt!131545 () Unit!8056)

(assert (=> b!260692 (= e!168923 lt!131545)))

(declare-fun lt!131527 () ListLongMap!3769)

(assert (=> b!260692 (= lt!131527 (getCurrentListMapNoExtraKeys!574 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131540 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131532 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131532 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131534 () Unit!8056)

(assert (=> b!260692 (= lt!131534 (addStillContains!234 lt!131527 lt!131540 (zeroValue!4635 thiss!1504) lt!131532))))

(assert (=> b!260692 (contains!1865 (+!697 lt!131527 (tuple2!4855 lt!131540 (zeroValue!4635 thiss!1504))) lt!131532)))

(declare-fun lt!131547 () Unit!8056)

(assert (=> b!260692 (= lt!131547 lt!131534)))

(declare-fun lt!131548 () ListLongMap!3769)

(assert (=> b!260692 (= lt!131548 (getCurrentListMapNoExtraKeys!574 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131528 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131528 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131537 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131537 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131535 () Unit!8056)

(assert (=> b!260692 (= lt!131535 (addApplyDifferent!234 lt!131548 lt!131528 (minValue!4635 thiss!1504) lt!131537))))

(assert (=> b!260692 (= (apply!258 (+!697 lt!131548 (tuple2!4855 lt!131528 (minValue!4635 thiss!1504))) lt!131537) (apply!258 lt!131548 lt!131537))))

(declare-fun lt!131544 () Unit!8056)

(assert (=> b!260692 (= lt!131544 lt!131535)))

(declare-fun lt!131538 () ListLongMap!3769)

(assert (=> b!260692 (= lt!131538 (getCurrentListMapNoExtraKeys!574 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131546 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131530 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131530 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131542 () Unit!8056)

(assert (=> b!260692 (= lt!131542 (addApplyDifferent!234 lt!131538 lt!131546 (zeroValue!4635 thiss!1504) lt!131530))))

(assert (=> b!260692 (= (apply!258 (+!697 lt!131538 (tuple2!4855 lt!131546 (zeroValue!4635 thiss!1504))) lt!131530) (apply!258 lt!131538 lt!131530))))

(declare-fun lt!131539 () Unit!8056)

(assert (=> b!260692 (= lt!131539 lt!131542)))

(declare-fun lt!131529 () ListLongMap!3769)

(assert (=> b!260692 (= lt!131529 (getCurrentListMapNoExtraKeys!574 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131541 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131541 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131533 () (_ BitVec 64))

(assert (=> b!260692 (= lt!131533 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!260692 (= lt!131545 (addApplyDifferent!234 lt!131529 lt!131541 (minValue!4635 thiss!1504) lt!131533))))

(assert (=> b!260692 (= (apply!258 (+!697 lt!131529 (tuple2!4855 lt!131541 (minValue!4635 thiss!1504))) lt!131533) (apply!258 lt!131529 lt!131533))))

(declare-fun b!260693 () Bool)

(assert (=> b!260693 (= e!168926 e!168925)))

(declare-fun res!127406 () Bool)

(assert (=> b!260693 (=> (not res!127406) (not e!168925))))

(assert (=> b!260693 (= res!127406 (contains!1865 lt!131536 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!260693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(declare-fun b!260694 () Bool)

(assert (=> b!260694 (= e!168921 (= (apply!258 lt!131536 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun bm!24843 () Bool)

(assert (=> bm!24843 (= call!24842 (+!697 (ite c!44325 call!24848 (ite c!44323 call!24843 call!24846)) (ite (or c!44325 c!44323) (tuple2!4855 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun bm!24844 () Bool)

(assert (=> bm!24844 (= call!24847 (contains!1865 lt!131536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24845 () Bool)

(assert (=> bm!24845 (= call!24848 (getCurrentListMapNoExtraKeys!574 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (array!12590 (store (arr!5959 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6308 (_values!4777 thiss!1504))) (mask!11120 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (= (and d!62687 c!44325) b!260674))

(assert (= (and d!62687 (not c!44325)) b!260683))

(assert (= (and b!260683 c!44323) b!260678))

(assert (= (and b!260683 (not c!44323)) b!260690))

(assert (= (and b!260690 c!44322) b!260686))

(assert (= (and b!260690 (not c!44322)) b!260685))

(assert (= (or b!260686 b!260685) bm!24840))

(assert (= (or b!260678 bm!24840) bm!24841))

(assert (= (or b!260678 b!260686) bm!24839))

(assert (= (or b!260674 bm!24841) bm!24845))

(assert (= (or b!260674 bm!24839) bm!24843))

(assert (= (and d!62687 res!127405) b!260689))

(assert (= (and d!62687 c!44324) b!260692))

(assert (= (and d!62687 (not c!44324)) b!260687))

(assert (= (and d!62687 res!127403) b!260682))

(assert (= (and b!260682 res!127402) b!260681))

(assert (= (and b!260682 (not res!127401)) b!260693))

(assert (= (and b!260693 res!127406) b!260688))

(assert (= (and b!260682 res!127408) b!260679))

(assert (= (and b!260679 c!44327) b!260676))

(assert (= (and b!260679 (not c!44327)) b!260677))

(assert (= (and b!260676 res!127407) b!260691))

(assert (= (or b!260676 b!260677) bm!24844))

(assert (= (and b!260679 res!127404) b!260680))

(assert (= (and b!260680 c!44326) b!260675))

(assert (= (and b!260680 (not c!44326)) b!260684))

(assert (= (and b!260675 res!127409) b!260694))

(assert (= (or b!260675 b!260684) bm!24842))

(declare-fun b_lambda!8297 () Bool)

(assert (=> (not b_lambda!8297) (not b!260688)))

(assert (=> b!260688 t!8800))

(declare-fun b_and!13895 () Bool)

(assert (= b_and!13893 (and (=> t!8800 result!5401) b_and!13895)))

(declare-fun m!276591 () Bool)

(assert (=> b!260674 m!276591))

(assert (=> b!260689 m!276347))

(assert (=> b!260689 m!276347))

(assert (=> b!260689 m!276355))

(assert (=> d!62687 m!275875))

(assert (=> b!260681 m!276347))

(assert (=> b!260681 m!276347))

(assert (=> b!260681 m!276355))

(declare-fun m!276593 () Bool)

(assert (=> bm!24844 m!276593))

(assert (=> b!260692 m!276347))

(declare-fun m!276595 () Bool)

(assert (=> b!260692 m!276595))

(declare-fun m!276597 () Bool)

(assert (=> b!260692 m!276597))

(declare-fun m!276599 () Bool)

(assert (=> b!260692 m!276599))

(declare-fun m!276601 () Bool)

(assert (=> b!260692 m!276601))

(declare-fun m!276603 () Bool)

(assert (=> b!260692 m!276603))

(declare-fun m!276605 () Bool)

(assert (=> b!260692 m!276605))

(declare-fun m!276607 () Bool)

(assert (=> b!260692 m!276607))

(assert (=> b!260692 m!276607))

(declare-fun m!276609 () Bool)

(assert (=> b!260692 m!276609))

(declare-fun m!276611 () Bool)

(assert (=> b!260692 m!276611))

(declare-fun m!276613 () Bool)

(assert (=> b!260692 m!276613))

(assert (=> b!260692 m!276603))

(declare-fun m!276615 () Bool)

(assert (=> b!260692 m!276615))

(declare-fun m!276617 () Bool)

(assert (=> b!260692 m!276617))

(declare-fun m!276619 () Bool)

(assert (=> b!260692 m!276619))

(assert (=> b!260692 m!276617))

(declare-fun m!276621 () Bool)

(assert (=> b!260692 m!276621))

(declare-fun m!276623 () Bool)

(assert (=> b!260692 m!276623))

(assert (=> b!260692 m!276597))

(declare-fun m!276625 () Bool)

(assert (=> b!260692 m!276625))

(declare-fun m!276627 () Bool)

(assert (=> b!260691 m!276627))

(assert (=> b!260688 m!276217))

(assert (=> b!260688 m!276347))

(assert (=> b!260688 m!276115))

(assert (=> b!260688 m!276347))

(declare-fun m!276629 () Bool)

(assert (=> b!260688 m!276629))

(assert (=> b!260688 m!276217))

(assert (=> b!260688 m!276115))

(assert (=> b!260688 m!276221))

(declare-fun m!276631 () Bool)

(assert (=> bm!24842 m!276631))

(assert (=> b!260693 m!276347))

(assert (=> b!260693 m!276347))

(declare-fun m!276633 () Bool)

(assert (=> b!260693 m!276633))

(declare-fun m!276635 () Bool)

(assert (=> bm!24843 m!276635))

(declare-fun m!276637 () Bool)

(assert (=> b!260694 m!276637))

(assert (=> bm!24845 m!276611))

(assert (=> b!260332 d!62687))

(declare-fun d!62689 () Bool)

(assert (=> d!62689 (= (apply!258 (+!697 lt!131303 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) lt!131295) (apply!258 lt!131303 lt!131295))))

(declare-fun lt!131549 () Unit!8056)

(assert (=> d!62689 (= lt!131549 (choose!1275 lt!131303 lt!131311 (zeroValue!4635 thiss!1504) lt!131295))))

(declare-fun e!168930 () Bool)

(assert (=> d!62689 e!168930))

(declare-fun res!127410 () Bool)

(assert (=> d!62689 (=> (not res!127410) (not e!168930))))

(assert (=> d!62689 (= res!127410 (contains!1865 lt!131303 lt!131295))))

(assert (=> d!62689 (= (addApplyDifferent!234 lt!131303 lt!131311 (zeroValue!4635 thiss!1504) lt!131295) lt!131549)))

(declare-fun b!260695 () Bool)

(assert (=> b!260695 (= e!168930 (not (= lt!131295 lt!131311)))))

(assert (= (and d!62689 res!127410) b!260695))

(assert (=> d!62689 m!276107))

(declare-fun m!276639 () Bool)

(assert (=> d!62689 m!276639))

(declare-fun m!276641 () Bool)

(assert (=> d!62689 m!276641))

(assert (=> d!62689 m!276091))

(assert (=> d!62689 m!276091))

(assert (=> d!62689 m!276093))

(assert (=> b!260274 d!62689))

(declare-fun d!62691 () Bool)

(declare-fun e!168931 () Bool)

(assert (=> d!62691 e!168931))

(declare-fun res!127411 () Bool)

(assert (=> d!62691 (=> (not res!127411) (not e!168931))))

(declare-fun lt!131552 () ListLongMap!3769)

(assert (=> d!62691 (= res!127411 (contains!1865 lt!131552 (_1!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131551 () List!3732)

(assert (=> d!62691 (= lt!131552 (ListLongMap!3770 lt!131551))))

(declare-fun lt!131553 () Unit!8056)

(declare-fun lt!131550 () Unit!8056)

(assert (=> d!62691 (= lt!131553 lt!131550)))

(assert (=> d!62691 (= (getValueByKey!317 lt!131551 (_1!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62691 (= lt!131550 (lemmaContainsTupThenGetReturnValue!173 lt!131551 (_1!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62691 (= lt!131551 (insertStrictlySorted!176 (toList!1900 lt!131303) (_1!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62691 (= (+!697 lt!131303 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) lt!131552)))

(declare-fun b!260696 () Bool)

(declare-fun res!127412 () Bool)

(assert (=> b!260696 (=> (not res!127412) (not e!168931))))

(assert (=> b!260696 (= res!127412 (= (getValueByKey!317 (toList!1900 lt!131552) (_1!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260697 () Bool)

(assert (=> b!260697 (= e!168931 (contains!1868 (toList!1900 lt!131552) (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62691 res!127411) b!260696))

(assert (= (and b!260696 res!127412) b!260697))

(declare-fun m!276643 () Bool)

(assert (=> d!62691 m!276643))

(declare-fun m!276645 () Bool)

(assert (=> d!62691 m!276645))

(declare-fun m!276647 () Bool)

(assert (=> d!62691 m!276647))

(declare-fun m!276649 () Bool)

(assert (=> d!62691 m!276649))

(declare-fun m!276651 () Bool)

(assert (=> b!260696 m!276651))

(declare-fun m!276653 () Bool)

(assert (=> b!260697 m!276653))

(assert (=> b!260274 d!62691))

(declare-fun d!62693 () Bool)

(declare-fun e!168933 () Bool)

(assert (=> d!62693 e!168933))

(declare-fun res!127413 () Bool)

(assert (=> d!62693 (=> res!127413 e!168933)))

(declare-fun lt!131556 () Bool)

(assert (=> d!62693 (= res!127413 (not lt!131556))))

(declare-fun lt!131554 () Bool)

(assert (=> d!62693 (= lt!131556 lt!131554)))

(declare-fun lt!131555 () Unit!8056)

(declare-fun e!168932 () Unit!8056)

(assert (=> d!62693 (= lt!131555 e!168932)))

(declare-fun c!44328 () Bool)

(assert (=> d!62693 (= c!44328 lt!131554)))

(assert (=> d!62693 (= lt!131554 (containsKey!308 (toList!1900 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) lt!131297))))

(assert (=> d!62693 (= (contains!1865 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) lt!131297) lt!131556)))

(declare-fun b!260698 () Bool)

(declare-fun lt!131557 () Unit!8056)

(assert (=> b!260698 (= e!168932 lt!131557)))

(assert (=> b!260698 (= lt!131557 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) lt!131297))))

(assert (=> b!260698 (isDefined!257 (getValueByKey!317 (toList!1900 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) lt!131297))))

(declare-fun b!260699 () Bool)

(declare-fun Unit!8078 () Unit!8056)

(assert (=> b!260699 (= e!168932 Unit!8078)))

(declare-fun b!260700 () Bool)

(assert (=> b!260700 (= e!168933 (isDefined!257 (getValueByKey!317 (toList!1900 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) lt!131297)))))

(assert (= (and d!62693 c!44328) b!260698))

(assert (= (and d!62693 (not c!44328)) b!260699))

(assert (= (and d!62693 (not res!127413)) b!260700))

(declare-fun m!276655 () Bool)

(assert (=> d!62693 m!276655))

(declare-fun m!276657 () Bool)

(assert (=> b!260698 m!276657))

(declare-fun m!276659 () Bool)

(assert (=> b!260698 m!276659))

(assert (=> b!260698 m!276659))

(declare-fun m!276661 () Bool)

(assert (=> b!260698 m!276661))

(assert (=> b!260700 m!276659))

(assert (=> b!260700 m!276659))

(assert (=> b!260700 m!276661))

(assert (=> b!260274 d!62693))

(declare-fun d!62695 () Bool)

(assert (=> d!62695 (= (apply!258 (+!697 lt!131303 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504))) lt!131295) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131303 (tuple2!4855 lt!131311 (zeroValue!4635 thiss!1504)))) lt!131295)))))

(declare-fun bs!9198 () Bool)

(assert (= bs!9198 d!62695))

(declare-fun m!276663 () Bool)

(assert (=> bs!9198 m!276663))

(assert (=> bs!9198 m!276663))

(declare-fun m!276665 () Bool)

(assert (=> bs!9198 m!276665))

(assert (=> b!260274 d!62695))

(declare-fun d!62697 () Bool)

(assert (=> d!62697 (= (apply!258 (+!697 lt!131313 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) lt!131302) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131313 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))) lt!131302)))))

(declare-fun bs!9199 () Bool)

(assert (= bs!9199 d!62697))

(declare-fun m!276667 () Bool)

(assert (=> bs!9199 m!276667))

(assert (=> bs!9199 m!276667))

(declare-fun m!276669 () Bool)

(assert (=> bs!9199 m!276669))

(assert (=> b!260274 d!62697))

(declare-fun d!62699 () Bool)

(declare-fun e!168934 () Bool)

(assert (=> d!62699 e!168934))

(declare-fun res!127414 () Bool)

(assert (=> d!62699 (=> (not res!127414) (not e!168934))))

(declare-fun lt!131560 () ListLongMap!3769)

(assert (=> d!62699 (= res!127414 (contains!1865 lt!131560 (_1!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131559 () List!3732)

(assert (=> d!62699 (= lt!131560 (ListLongMap!3770 lt!131559))))

(declare-fun lt!131561 () Unit!8056)

(declare-fun lt!131558 () Unit!8056)

(assert (=> d!62699 (= lt!131561 lt!131558)))

(assert (=> d!62699 (= (getValueByKey!317 lt!131559 (_1!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62699 (= lt!131558 (lemmaContainsTupThenGetReturnValue!173 lt!131559 (_1!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62699 (= lt!131559 (insertStrictlySorted!176 (toList!1900 lt!131292) (_1!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62699 (= (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) lt!131560)))

(declare-fun b!260701 () Bool)

(declare-fun res!127415 () Bool)

(assert (=> b!260701 (=> (not res!127415) (not e!168934))))

(assert (=> b!260701 (= res!127415 (= (getValueByKey!317 (toList!1900 lt!131560) (_1!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260702 () Bool)

(assert (=> b!260702 (= e!168934 (contains!1868 (toList!1900 lt!131560) (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62699 res!127414) b!260701))

(assert (= (and b!260701 res!127415) b!260702))

(declare-fun m!276671 () Bool)

(assert (=> d!62699 m!276671))

(declare-fun m!276673 () Bool)

(assert (=> d!62699 m!276673))

(declare-fun m!276675 () Bool)

(assert (=> d!62699 m!276675))

(declare-fun m!276677 () Bool)

(assert (=> d!62699 m!276677))

(declare-fun m!276679 () Bool)

(assert (=> b!260701 m!276679))

(declare-fun m!276681 () Bool)

(assert (=> b!260702 m!276681))

(assert (=> b!260274 d!62699))

(declare-fun d!62701 () Bool)

(assert (=> d!62701 (= (apply!258 (+!697 lt!131294 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) lt!131298) (apply!258 lt!131294 lt!131298))))

(declare-fun lt!131562 () Unit!8056)

(assert (=> d!62701 (= lt!131562 (choose!1275 lt!131294 lt!131306 (minValue!4635 thiss!1504) lt!131298))))

(declare-fun e!168935 () Bool)

(assert (=> d!62701 e!168935))

(declare-fun res!127416 () Bool)

(assert (=> d!62701 (=> (not res!127416) (not e!168935))))

(assert (=> d!62701 (= res!127416 (contains!1865 lt!131294 lt!131298))))

(assert (=> d!62701 (= (addApplyDifferent!234 lt!131294 lt!131306 (minValue!4635 thiss!1504) lt!131298) lt!131562)))

(declare-fun b!260703 () Bool)

(assert (=> b!260703 (= e!168935 (not (= lt!131298 lt!131306)))))

(assert (= (and d!62701 res!127416) b!260703))

(assert (=> d!62701 m!276097))

(declare-fun m!276683 () Bool)

(assert (=> d!62701 m!276683))

(declare-fun m!276685 () Bool)

(assert (=> d!62701 m!276685))

(assert (=> d!62701 m!276081))

(assert (=> d!62701 m!276081))

(assert (=> d!62701 m!276083))

(assert (=> b!260274 d!62701))

(declare-fun d!62703 () Bool)

(assert (=> d!62703 (= (apply!258 lt!131294 lt!131298) (get!3078 (getValueByKey!317 (toList!1900 lt!131294) lt!131298)))))

(declare-fun bs!9200 () Bool)

(assert (= bs!9200 d!62703))

(declare-fun m!276687 () Bool)

(assert (=> bs!9200 m!276687))

(assert (=> bs!9200 m!276687))

(declare-fun m!276689 () Bool)

(assert (=> bs!9200 m!276689))

(assert (=> b!260274 d!62703))

(declare-fun d!62705 () Bool)

(assert (=> d!62705 (= (apply!258 lt!131313 lt!131302) (get!3078 (getValueByKey!317 (toList!1900 lt!131313) lt!131302)))))

(declare-fun bs!9201 () Bool)

(assert (= bs!9201 d!62705))

(declare-fun m!276691 () Bool)

(assert (=> bs!9201 m!276691))

(assert (=> bs!9201 m!276691))

(declare-fun m!276693 () Bool)

(assert (=> bs!9201 m!276693))

(assert (=> b!260274 d!62705))

(declare-fun d!62707 () Bool)

(assert (=> d!62707 (contains!1865 (+!697 lt!131292 (tuple2!4855 lt!131305 (zeroValue!4635 thiss!1504))) lt!131297)))

(declare-fun lt!131563 () Unit!8056)

(assert (=> d!62707 (= lt!131563 (choose!1276 lt!131292 lt!131305 (zeroValue!4635 thiss!1504) lt!131297))))

(assert (=> d!62707 (contains!1865 lt!131292 lt!131297)))

(assert (=> d!62707 (= (addStillContains!234 lt!131292 lt!131305 (zeroValue!4635 thiss!1504) lt!131297) lt!131563)))

(declare-fun bs!9202 () Bool)

(assert (= bs!9202 d!62707))

(assert (=> bs!9202 m!276087))

(assert (=> bs!9202 m!276087))

(assert (=> bs!9202 m!276089))

(declare-fun m!276695 () Bool)

(assert (=> bs!9202 m!276695))

(declare-fun m!276697 () Bool)

(assert (=> bs!9202 m!276697))

(assert (=> b!260274 d!62707))

(declare-fun d!62709 () Bool)

(assert (=> d!62709 (= (apply!258 lt!131303 lt!131295) (get!3078 (getValueByKey!317 (toList!1900 lt!131303) lt!131295)))))

(declare-fun bs!9203 () Bool)

(assert (= bs!9203 d!62709))

(declare-fun m!276699 () Bool)

(assert (=> bs!9203 m!276699))

(assert (=> bs!9203 m!276699))

(declare-fun m!276701 () Bool)

(assert (=> bs!9203 m!276701))

(assert (=> b!260274 d!62709))

(declare-fun d!62711 () Bool)

(declare-fun e!168936 () Bool)

(assert (=> d!62711 e!168936))

(declare-fun res!127417 () Bool)

(assert (=> d!62711 (=> (not res!127417) (not e!168936))))

(declare-fun lt!131566 () ListLongMap!3769)

(assert (=> d!62711 (= res!127417 (contains!1865 lt!131566 (_1!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131565 () List!3732)

(assert (=> d!62711 (= lt!131566 (ListLongMap!3770 lt!131565))))

(declare-fun lt!131567 () Unit!8056)

(declare-fun lt!131564 () Unit!8056)

(assert (=> d!62711 (= lt!131567 lt!131564)))

(assert (=> d!62711 (= (getValueByKey!317 lt!131565 (_1!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))))))

(assert (=> d!62711 (= lt!131564 (lemmaContainsTupThenGetReturnValue!173 lt!131565 (_1!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))))))

(assert (=> d!62711 (= lt!131565 (insertStrictlySorted!176 (toList!1900 lt!131294) (_1!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))))))

(assert (=> d!62711 (= (+!697 lt!131294 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) lt!131566)))

(declare-fun b!260704 () Bool)

(declare-fun res!127418 () Bool)

(assert (=> b!260704 (=> (not res!127418) (not e!168936))))

(assert (=> b!260704 (= res!127418 (= (getValueByKey!317 (toList!1900 lt!131566) (_1!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))))))))

(declare-fun b!260705 () Bool)

(assert (=> b!260705 (= e!168936 (contains!1868 (toList!1900 lt!131566) (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))))))

(assert (= (and d!62711 res!127417) b!260704))

(assert (= (and b!260704 res!127418) b!260705))

(declare-fun m!276703 () Bool)

(assert (=> d!62711 m!276703))

(declare-fun m!276705 () Bool)

(assert (=> d!62711 m!276705))

(declare-fun m!276707 () Bool)

(assert (=> d!62711 m!276707))

(declare-fun m!276709 () Bool)

(assert (=> d!62711 m!276709))

(declare-fun m!276711 () Bool)

(assert (=> b!260704 m!276711))

(declare-fun m!276713 () Bool)

(assert (=> b!260705 m!276713))

(assert (=> b!260274 d!62711))

(declare-fun d!62713 () Bool)

(assert (=> d!62713 (= (apply!258 (+!697 lt!131294 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504))) lt!131298) (get!3078 (getValueByKey!317 (toList!1900 (+!697 lt!131294 (tuple2!4855 lt!131306 (minValue!4635 thiss!1504)))) lt!131298)))))

(declare-fun bs!9204 () Bool)

(assert (= bs!9204 d!62713))

(declare-fun m!276715 () Bool)

(assert (=> bs!9204 m!276715))

(assert (=> bs!9204 m!276715))

(declare-fun m!276717 () Bool)

(assert (=> bs!9204 m!276717))

(assert (=> b!260274 d!62713))

(assert (=> b!260274 d!62607))

(declare-fun d!62715 () Bool)

(assert (=> d!62715 (= (apply!258 (+!697 lt!131313 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) lt!131302) (apply!258 lt!131313 lt!131302))))

(declare-fun lt!131568 () Unit!8056)

(assert (=> d!62715 (= lt!131568 (choose!1275 lt!131313 lt!131293 (minValue!4635 thiss!1504) lt!131302))))

(declare-fun e!168937 () Bool)

(assert (=> d!62715 e!168937))

(declare-fun res!127419 () Bool)

(assert (=> d!62715 (=> (not res!127419) (not e!168937))))

(assert (=> d!62715 (= res!127419 (contains!1865 lt!131313 lt!131302))))

(assert (=> d!62715 (= (addApplyDifferent!234 lt!131313 lt!131293 (minValue!4635 thiss!1504) lt!131302) lt!131568)))

(declare-fun b!260706 () Bool)

(assert (=> b!260706 (= e!168937 (not (= lt!131302 lt!131293)))))

(assert (= (and d!62715 res!127419) b!260706))

(assert (=> d!62715 m!276079))

(declare-fun m!276719 () Bool)

(assert (=> d!62715 m!276719))

(declare-fun m!276721 () Bool)

(assert (=> d!62715 m!276721))

(assert (=> d!62715 m!276101))

(assert (=> d!62715 m!276101))

(assert (=> d!62715 m!276103))

(assert (=> b!260274 d!62715))

(declare-fun d!62717 () Bool)

(declare-fun e!168938 () Bool)

(assert (=> d!62717 e!168938))

(declare-fun res!127420 () Bool)

(assert (=> d!62717 (=> (not res!127420) (not e!168938))))

(declare-fun lt!131571 () ListLongMap!3769)

(assert (=> d!62717 (= res!127420 (contains!1865 lt!131571 (_1!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131570 () List!3732)

(assert (=> d!62717 (= lt!131571 (ListLongMap!3770 lt!131570))))

(declare-fun lt!131572 () Unit!8056)

(declare-fun lt!131569 () Unit!8056)

(assert (=> d!62717 (= lt!131572 lt!131569)))

(assert (=> d!62717 (= (getValueByKey!317 lt!131570 (_1!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))))))

(assert (=> d!62717 (= lt!131569 (lemmaContainsTupThenGetReturnValue!173 lt!131570 (_1!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))))))

(assert (=> d!62717 (= lt!131570 (insertStrictlySorted!176 (toList!1900 lt!131313) (_1!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))))))

(assert (=> d!62717 (= (+!697 lt!131313 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))) lt!131571)))

(declare-fun b!260707 () Bool)

(declare-fun res!127421 () Bool)

(assert (=> b!260707 (=> (not res!127421) (not e!168938))))

(assert (=> b!260707 (= res!127421 (= (getValueByKey!317 (toList!1900 lt!131571) (_1!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))))))))

(declare-fun b!260708 () Bool)

(assert (=> b!260708 (= e!168938 (contains!1868 (toList!1900 lt!131571) (tuple2!4855 lt!131293 (minValue!4635 thiss!1504))))))

(assert (= (and d!62717 res!127420) b!260707))

(assert (= (and b!260707 res!127421) b!260708))

(declare-fun m!276723 () Bool)

(assert (=> d!62717 m!276723))

(declare-fun m!276725 () Bool)

(assert (=> d!62717 m!276725))

(declare-fun m!276727 () Bool)

(assert (=> d!62717 m!276727))

(declare-fun m!276729 () Bool)

(assert (=> d!62717 m!276729))

(declare-fun m!276731 () Bool)

(assert (=> b!260707 m!276731))

(declare-fun m!276733 () Bool)

(assert (=> b!260708 m!276733))

(assert (=> b!260274 d!62717))

(declare-fun c!44329 () Bool)

(declare-fun call!24849 () Bool)

(declare-fun bm!24846 () Bool)

(assert (=> bm!24846 (= call!24849 (arrayNoDuplicates!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44329 (Cons!3729 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000) Nil!3730) Nil!3730)))))

(declare-fun b!260709 () Bool)

(declare-fun e!168941 () Bool)

(declare-fun e!168939 () Bool)

(assert (=> b!260709 (= e!168941 e!168939)))

(assert (=> b!260709 (= c!44329 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168942 () Bool)

(declare-fun b!260711 () Bool)

(assert (=> b!260711 (= e!168942 (contains!1869 Nil!3730 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260712 () Bool)

(assert (=> b!260712 (= e!168939 call!24849)))

(declare-fun b!260713 () Bool)

(declare-fun e!168940 () Bool)

(assert (=> b!260713 (= e!168940 e!168941)))

(declare-fun res!127424 () Bool)

(assert (=> b!260713 (=> (not res!127424) (not e!168941))))

(assert (=> b!260713 (= res!127424 (not e!168942))))

(declare-fun res!127422 () Bool)

(assert (=> b!260713 (=> (not res!127422) (not e!168942))))

(assert (=> b!260713 (= res!127422 (validKeyInArray!0 (select (arr!5960 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260710 () Bool)

(assert (=> b!260710 (= e!168939 call!24849)))

(declare-fun d!62719 () Bool)

(declare-fun res!127423 () Bool)

(assert (=> d!62719 (=> res!127423 e!168940)))

(assert (=> d!62719 (= res!127423 (bvsge #b00000000000000000000000000000000 (size!6309 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))))))))

(assert (=> d!62719 (= (arrayNoDuplicates!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 Nil!3730) e!168940)))

(assert (= (and d!62719 (not res!127423)) b!260713))

(assert (= (and b!260713 res!127422) b!260711))

(assert (= (and b!260713 res!127424) b!260709))

(assert (= (and b!260709 c!44329) b!260710))

(assert (= (and b!260709 (not c!44329)) b!260712))

(assert (= (or b!260710 b!260712) bm!24846))

(assert (=> bm!24846 m!276347))

(declare-fun m!276735 () Bool)

(assert (=> bm!24846 m!276735))

(assert (=> b!260709 m!276347))

(assert (=> b!260709 m!276347))

(assert (=> b!260709 m!276355))

(assert (=> b!260711 m!276347))

(assert (=> b!260711 m!276347))

(declare-fun m!276737 () Bool)

(assert (=> b!260711 m!276737))

(assert (=> b!260713 m!276347))

(assert (=> b!260713 m!276347))

(assert (=> b!260713 m!276355))

(assert (=> b!260374 d!62719))

(declare-fun b!260714 () Bool)

(declare-fun e!168944 () (_ BitVec 32))

(declare-fun e!168943 () (_ BitVec 32))

(assert (=> b!260714 (= e!168944 e!168943)))

(declare-fun c!44331 () Bool)

(assert (=> b!260714 (= c!44331 (validKeyInArray!0 (select (arr!5960 lt!131140) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun d!62721 () Bool)

(declare-fun lt!131573 () (_ BitVec 32))

(assert (=> d!62721 (and (bvsge lt!131573 #b00000000000000000000000000000000) (bvsle lt!131573 (bvsub (size!6309 lt!131140) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!62721 (= lt!131573 e!168944)))

(declare-fun c!44330 () Bool)

(assert (=> d!62721 (= c!44330 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62721 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6309 lt!131140)))))

(assert (=> d!62721 (= (arrayCountValidKeys!0 lt!131140 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!131573)))

(declare-fun bm!24847 () Bool)

(declare-fun call!24850 () (_ BitVec 32))

(assert (=> bm!24847 (= call!24850 (arrayCountValidKeys!0 lt!131140 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!260715 () Bool)

(assert (=> b!260715 (= e!168943 (bvadd #b00000000000000000000000000000001 call!24850))))

(declare-fun b!260716 () Bool)

(assert (=> b!260716 (= e!168944 #b00000000000000000000000000000000)))

(declare-fun b!260717 () Bool)

(assert (=> b!260717 (= e!168943 call!24850)))

(assert (= (and d!62721 c!44330) b!260716))

(assert (= (and d!62721 (not c!44330)) b!260714))

(assert (= (and b!260714 c!44331) b!260715))

(assert (= (and b!260714 (not c!44331)) b!260717))

(assert (= (or b!260715 b!260717) bm!24847))

(declare-fun m!276739 () Bool)

(assert (=> b!260714 m!276739))

(assert (=> b!260714 m!276739))

(declare-fun m!276741 () Bool)

(assert (=> b!260714 m!276741))

(declare-fun m!276743 () Bool)

(assert (=> bm!24847 m!276743))

(assert (=> bm!24805 d!62721))

(declare-fun lt!131576 () Bool)

(declare-fun d!62723 () Bool)

(declare-fun content!174 (List!3732) (InoxSet tuple2!4854))

(assert (=> d!62723 (= lt!131576 (select (content!174 (toList!1900 lt!131330)) (tuple2!4855 key!932 v!346)))))

(declare-fun e!168949 () Bool)

(assert (=> d!62723 (= lt!131576 e!168949)))

(declare-fun res!127429 () Bool)

(assert (=> d!62723 (=> (not res!127429) (not e!168949))))

(assert (=> d!62723 (= res!127429 ((_ is Cons!3728) (toList!1900 lt!131330)))))

(assert (=> d!62723 (= (contains!1868 (toList!1900 lt!131330) (tuple2!4855 key!932 v!346)) lt!131576)))

(declare-fun b!260722 () Bool)

(declare-fun e!168950 () Bool)

(assert (=> b!260722 (= e!168949 e!168950)))

(declare-fun res!127430 () Bool)

(assert (=> b!260722 (=> res!127430 e!168950)))

(assert (=> b!260722 (= res!127430 (= (h!4392 (toList!1900 lt!131330)) (tuple2!4855 key!932 v!346)))))

(declare-fun b!260723 () Bool)

(assert (=> b!260723 (= e!168950 (contains!1868 (t!8793 (toList!1900 lt!131330)) (tuple2!4855 key!932 v!346)))))

(assert (= (and d!62723 res!127429) b!260722))

(assert (= (and b!260722 (not res!127430)) b!260723))

(declare-fun m!276745 () Bool)

(assert (=> d!62723 m!276745))

(declare-fun m!276747 () Bool)

(assert (=> d!62723 m!276747))

(declare-fun m!276749 () Bool)

(assert (=> b!260723 m!276749))

(assert (=> b!260290 d!62723))

(declare-fun d!62725 () Bool)

(assert (=> d!62725 (= (apply!258 lt!131301 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1900 lt!131301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9205 () Bool)

(assert (= bs!9205 d!62725))

(assert (=> bs!9205 m!276555))

(assert (=> bs!9205 m!276555))

(declare-fun m!276751 () Bool)

(assert (=> bs!9205 m!276751))

(assert (=> b!260276 d!62725))

(assert (=> d!62553 d!62555))

(declare-fun d!62727 () Bool)

(assert (=> d!62727 (arrayContainsKey!0 lt!131140 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62727 true))

(declare-fun _$60!384 () Unit!8056)

(assert (=> d!62727 (= (choose!13 lt!131140 key!932 index!297) _$60!384)))

(declare-fun bs!9206 () Bool)

(assert (= bs!9206 d!62727))

(assert (=> bs!9206 m!275909))

(assert (=> d!62553 d!62727))

(declare-fun d!62729 () Bool)

(declare-fun e!168952 () Bool)

(assert (=> d!62729 e!168952))

(declare-fun res!127431 () Bool)

(assert (=> d!62729 (=> res!127431 e!168952)))

(declare-fun lt!131579 () Bool)

(assert (=> d!62729 (= res!127431 (not lt!131579))))

(declare-fun lt!131577 () Bool)

(assert (=> d!62729 (= lt!131579 lt!131577)))

(declare-fun lt!131578 () Unit!8056)

(declare-fun e!168951 () Unit!8056)

(assert (=> d!62729 (= lt!131578 e!168951)))

(declare-fun c!44332 () Bool)

(assert (=> d!62729 (= c!44332 lt!131577)))

(assert (=> d!62729 (= lt!131577 (containsKey!308 (toList!1900 lt!131351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62729 (= (contains!1865 lt!131351 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131579)))

(declare-fun b!260724 () Bool)

(declare-fun lt!131580 () Unit!8056)

(assert (=> b!260724 (= e!168951 lt!131580)))

(assert (=> b!260724 (= lt!131580 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260724 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260725 () Bool)

(declare-fun Unit!8079 () Unit!8056)

(assert (=> b!260725 (= e!168951 Unit!8079)))

(declare-fun b!260726 () Bool)

(assert (=> b!260726 (= e!168952 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62729 c!44332) b!260724))

(assert (= (and d!62729 (not c!44332)) b!260725))

(assert (= (and d!62729 (not res!127431)) b!260726))

(declare-fun m!276753 () Bool)

(assert (=> d!62729 m!276753))

(declare-fun m!276755 () Bool)

(assert (=> b!260724 m!276755))

(declare-fun m!276757 () Bool)

(assert (=> b!260724 m!276757))

(assert (=> b!260724 m!276757))

(declare-fun m!276759 () Bool)

(assert (=> b!260724 m!276759))

(assert (=> b!260726 m!276757))

(assert (=> b!260726 m!276757))

(assert (=> b!260726 m!276759))

(assert (=> bm!24809 d!62729))

(declare-fun d!62731 () Bool)

(assert (=> d!62731 (arrayNoDuplicates!0 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) #b00000000000000000000000000000000 Nil!3730)))

(assert (=> d!62731 true))

(declare-fun _$65!92 () Unit!8056)

(assert (=> d!62731 (= (choose!41 (_keys!6974 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730) _$65!92)))

(declare-fun bs!9207 () Bool)

(assert (= bs!9207 d!62731))

(assert (=> bs!9207 m!275895))

(assert (=> bs!9207 m!276245))

(assert (=> d!62557 d!62731))

(assert (=> b!260352 d!62605))

(declare-fun d!62733 () Bool)

(assert (=> d!62733 (= (inRange!0 (index!6763 lt!131319) (mask!11120 thiss!1504)) (and (bvsge (index!6763 lt!131319) #b00000000000000000000000000000000) (bvslt (index!6763 lt!131319) (bvadd (mask!11120 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260283 d!62733))

(declare-fun c!44333 () Bool)

(declare-fun bm!24848 () Bool)

(declare-fun call!24851 () Bool)

(assert (=> bm!24848 (= call!24851 (arrayNoDuplicates!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44333 (Cons!3729 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44223 (Cons!3729 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) Nil!3730) Nil!3730)) (ite c!44223 (Cons!3729 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) Nil!3730) Nil!3730))))))

(declare-fun b!260727 () Bool)

(declare-fun e!168955 () Bool)

(declare-fun e!168953 () Bool)

(assert (=> b!260727 (= e!168955 e!168953)))

(assert (=> b!260727 (= c!44333 (validKeyInArray!0 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260729 () Bool)

(declare-fun e!168956 () Bool)

(assert (=> b!260729 (= e!168956 (contains!1869 (ite c!44223 (Cons!3729 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) Nil!3730) Nil!3730) (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260730 () Bool)

(assert (=> b!260730 (= e!168953 call!24851)))

(declare-fun b!260731 () Bool)

(declare-fun e!168954 () Bool)

(assert (=> b!260731 (= e!168954 e!168955)))

(declare-fun res!127434 () Bool)

(assert (=> b!260731 (=> (not res!127434) (not e!168955))))

(assert (=> b!260731 (= res!127434 (not e!168956))))

(declare-fun res!127432 () Bool)

(assert (=> b!260731 (=> (not res!127432) (not e!168956))))

(assert (=> b!260731 (= res!127432 (validKeyInArray!0 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260728 () Bool)

(assert (=> b!260728 (= e!168953 call!24851)))

(declare-fun d!62735 () Bool)

(declare-fun res!127433 () Bool)

(assert (=> d!62735 (=> res!127433 e!168954)))

(assert (=> d!62735 (= res!127433 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(assert (=> d!62735 (= (arrayNoDuplicates!0 lt!131140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44223 (Cons!3729 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) Nil!3730) Nil!3730)) e!168954)))

(assert (= (and d!62735 (not res!127433)) b!260731))

(assert (= (and b!260731 res!127432) b!260729))

(assert (= (and b!260731 res!127434) b!260727))

(assert (= (and b!260727 c!44333) b!260728))

(assert (= (and b!260727 (not c!44333)) b!260730))

(assert (= (or b!260728 b!260730) bm!24848))

(assert (=> bm!24848 m!276531))

(declare-fun m!276761 () Bool)

(assert (=> bm!24848 m!276761))

(assert (=> b!260727 m!276531))

(assert (=> b!260727 m!276531))

(assert (=> b!260727 m!276533))

(assert (=> b!260729 m!276531))

(assert (=> b!260729 m!276531))

(declare-fun m!276763 () Bool)

(assert (=> b!260729 m!276763))

(assert (=> b!260731 m!276531))

(assert (=> b!260731 m!276531))

(assert (=> b!260731 m!276533))

(assert (=> bm!24801 d!62735))

(declare-fun d!62737 () Bool)

(declare-fun e!168958 () Bool)

(assert (=> d!62737 e!168958))

(declare-fun res!127435 () Bool)

(assert (=> d!62737 (=> res!127435 e!168958)))

(declare-fun lt!131583 () Bool)

(assert (=> d!62737 (= res!127435 (not lt!131583))))

(declare-fun lt!131581 () Bool)

(assert (=> d!62737 (= lt!131583 lt!131581)))

(declare-fun lt!131582 () Unit!8056)

(declare-fun e!168957 () Unit!8056)

(assert (=> d!62737 (= lt!131582 e!168957)))

(declare-fun c!44334 () Bool)

(assert (=> d!62737 (= c!44334 lt!131581)))

(assert (=> d!62737 (= lt!131581 (containsKey!308 (toList!1900 lt!131301) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62737 (= (contains!1865 lt!131301 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131583)))

(declare-fun b!260732 () Bool)

(declare-fun lt!131584 () Unit!8056)

(assert (=> b!260732 (= e!168957 lt!131584)))

(assert (=> b!260732 (= lt!131584 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131301) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260732 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260733 () Bool)

(declare-fun Unit!8080 () Unit!8056)

(assert (=> b!260733 (= e!168957 Unit!8080)))

(declare-fun b!260734 () Bool)

(assert (=> b!260734 (= e!168958 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131301) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62737 c!44334) b!260732))

(assert (= (and d!62737 (not c!44334)) b!260733))

(assert (= (and d!62737 (not res!127435)) b!260734))

(declare-fun m!276765 () Bool)

(assert (=> d!62737 m!276765))

(declare-fun m!276767 () Bool)

(assert (=> b!260732 m!276767))

(assert (=> b!260732 m!276293))

(assert (=> b!260732 m!276293))

(declare-fun m!276769 () Bool)

(assert (=> b!260732 m!276769))

(assert (=> b!260734 m!276293))

(assert (=> b!260734 m!276293))

(assert (=> b!260734 m!276769))

(assert (=> bm!24797 d!62737))

(declare-fun d!62739 () Bool)

(declare-fun e!168959 () Bool)

(assert (=> d!62739 e!168959))

(declare-fun res!127436 () Bool)

(assert (=> d!62739 (=> (not res!127436) (not e!168959))))

(declare-fun lt!131587 () ListLongMap!3769)

(assert (=> d!62739 (= res!127436 (contains!1865 lt!131587 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131586 () List!3732)

(assert (=> d!62739 (= lt!131587 (ListLongMap!3770 lt!131586))))

(declare-fun lt!131588 () Unit!8056)

(declare-fun lt!131585 () Unit!8056)

(assert (=> d!62739 (= lt!131588 lt!131585)))

(assert (=> d!62739 (= (getValueByKey!317 lt!131586 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62739 (= lt!131585 (lemmaContainsTupThenGetReturnValue!173 lt!131586 (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62739 (= lt!131586 (insertStrictlySorted!176 (toList!1900 call!24809) (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62739 (= (+!697 call!24809 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) lt!131587)))

(declare-fun b!260735 () Bool)

(declare-fun res!127437 () Bool)

(assert (=> b!260735 (=> (not res!127437) (not e!168959))))

(assert (=> b!260735 (= res!127437 (= (getValueByKey!317 (toList!1900 lt!131587) (_1!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!322 (_2!2438 (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun b!260736 () Bool)

(assert (=> b!260736 (= e!168959 (contains!1868 (toList!1900 lt!131587) (tuple2!4855 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(assert (= (and d!62739 res!127436) b!260735))

(assert (= (and b!260735 res!127437) b!260736))

(declare-fun m!276771 () Bool)

(assert (=> d!62739 m!276771))

(declare-fun m!276773 () Bool)

(assert (=> d!62739 m!276773))

(declare-fun m!276775 () Bool)

(assert (=> d!62739 m!276775))

(declare-fun m!276777 () Bool)

(assert (=> d!62739 m!276777))

(declare-fun m!276779 () Bool)

(assert (=> b!260735 m!276779))

(declare-fun m!276781 () Bool)

(assert (=> b!260736 m!276781))

(assert (=> b!260337 d!62739))

(declare-fun d!62741 () Bool)

(assert (=> d!62741 (= (apply!258 lt!131351 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1900 lt!131351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9208 () Bool)

(assert (= bs!9208 d!62741))

(declare-fun m!276783 () Bool)

(assert (=> bs!9208 m!276783))

(assert (=> bs!9208 m!276783))

(declare-fun m!276785 () Bool)

(assert (=> bs!9208 m!276785))

(assert (=> b!260354 d!62741))

(declare-fun d!62743 () Bool)

(assert (=> d!62743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12592 (store (arr!5960 (_keys!6974 thiss!1504)) index!297 key!932) (size!6309 (_keys!6974 thiss!1504))) (mask!11120 thiss!1504))))

(assert (=> d!62743 true))

(declare-fun _$56!39 () Unit!8056)

(assert (=> d!62743 (= (choose!102 key!932 (_keys!6974 thiss!1504) index!297 (mask!11120 thiss!1504)) _$56!39)))

(declare-fun bs!9209 () Bool)

(assert (= bs!9209 d!62743))

(assert (=> bs!9209 m!275895))

(assert (=> bs!9209 m!276249))

(assert (=> d!62559 d!62743))

(assert (=> d!62559 d!62545))

(declare-fun d!62745 () Bool)

(declare-fun e!168961 () Bool)

(assert (=> d!62745 e!168961))

(declare-fun res!127438 () Bool)

(assert (=> d!62745 (=> res!127438 e!168961)))

(declare-fun lt!131591 () Bool)

(assert (=> d!62745 (= res!127438 (not lt!131591))))

(declare-fun lt!131589 () Bool)

(assert (=> d!62745 (= lt!131591 lt!131589)))

(declare-fun lt!131590 () Unit!8056)

(declare-fun e!168960 () Unit!8056)

(assert (=> d!62745 (= lt!131590 e!168960)))

(declare-fun c!44335 () Bool)

(assert (=> d!62745 (= c!44335 lt!131589)))

(assert (=> d!62745 (= lt!131589 (containsKey!308 (toList!1900 lt!131351) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> d!62745 (= (contains!1865 lt!131351 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) lt!131591)))

(declare-fun b!260737 () Bool)

(declare-fun lt!131592 () Unit!8056)

(assert (=> b!260737 (= e!168960 lt!131592)))

(assert (=> b!260737 (= lt!131592 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131351) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(assert (=> b!260737 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260738 () Bool)

(declare-fun Unit!8081 () Unit!8056)

(assert (=> b!260738 (= e!168960 Unit!8081)))

(declare-fun b!260739 () Bool)

(assert (=> b!260739 (= e!168961 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) (select (arr!5960 lt!131140) #b00000000000000000000000000000000))))))

(assert (= (and d!62745 c!44335) b!260737))

(assert (= (and d!62745 (not c!44335)) b!260738))

(assert (= (and d!62745 (not res!127438)) b!260739))

(assert (=> d!62745 m!276157))

(declare-fun m!276787 () Bool)

(assert (=> d!62745 m!276787))

(assert (=> b!260737 m!276157))

(declare-fun m!276789 () Bool)

(assert (=> b!260737 m!276789))

(assert (=> b!260737 m!276157))

(assert (=> b!260737 m!276319))

(assert (=> b!260737 m!276319))

(declare-fun m!276791 () Bool)

(assert (=> b!260737 m!276791))

(assert (=> b!260739 m!276157))

(assert (=> b!260739 m!276319))

(assert (=> b!260739 m!276319))

(assert (=> b!260739 m!276791))

(assert (=> b!260356 d!62745))

(declare-fun d!62747 () Bool)

(assert (=> d!62747 (= (apply!258 lt!131351 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1900 lt!131351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9210 () Bool)

(assert (= bs!9210 d!62747))

(assert (=> bs!9210 m!276757))

(assert (=> bs!9210 m!276757))

(declare-fun m!276793 () Bool)

(assert (=> bs!9210 m!276793))

(assert (=> b!260357 d!62747))

(declare-fun d!62749 () Bool)

(assert (=> d!62749 (= (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) index!297)) (and (not (= (select (arr!5960 (_keys!6974 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5960 (_keys!6974 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260299 d!62749))

(assert (=> b!260317 d!62605))

(declare-fun d!62751 () Bool)

(declare-fun e!168963 () Bool)

(assert (=> d!62751 e!168963))

(declare-fun res!127439 () Bool)

(assert (=> d!62751 (=> res!127439 e!168963)))

(declare-fun lt!131595 () Bool)

(assert (=> d!62751 (= res!127439 (not lt!131595))))

(declare-fun lt!131593 () Bool)

(assert (=> d!62751 (= lt!131595 lt!131593)))

(declare-fun lt!131594 () Unit!8056)

(declare-fun e!168962 () Unit!8056)

(assert (=> d!62751 (= lt!131594 e!168962)))

(declare-fun c!44336 () Bool)

(assert (=> d!62751 (= c!44336 lt!131593)))

(assert (=> d!62751 (= lt!131593 (containsKey!308 (toList!1900 lt!131351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62751 (= (contains!1865 lt!131351 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131595)))

(declare-fun b!260740 () Bool)

(declare-fun lt!131596 () Unit!8056)

(assert (=> b!260740 (= e!168962 lt!131596)))

(assert (=> b!260740 (= lt!131596 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260740 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260741 () Bool)

(declare-fun Unit!8082 () Unit!8056)

(assert (=> b!260741 (= e!168962 Unit!8082)))

(declare-fun b!260742 () Bool)

(assert (=> b!260742 (= e!168963 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62751 c!44336) b!260740))

(assert (= (and d!62751 (not c!44336)) b!260741))

(assert (= (and d!62751 (not res!127439)) b!260742))

(declare-fun m!276795 () Bool)

(assert (=> d!62751 m!276795))

(declare-fun m!276797 () Bool)

(assert (=> b!260740 m!276797))

(assert (=> b!260740 m!276783))

(assert (=> b!260740 m!276783))

(declare-fun m!276799 () Bool)

(assert (=> b!260740 m!276799))

(assert (=> b!260742 m!276783))

(assert (=> b!260742 m!276783))

(assert (=> b!260742 m!276799))

(assert (=> bm!24811 d!62751))

(declare-fun d!62753 () Bool)

(assert (=> d!62753 (arrayContainsKey!0 lt!131140 lt!131372 #b00000000000000000000000000000000)))

(declare-fun lt!131597 () Unit!8056)

(assert (=> d!62753 (= lt!131597 (choose!13 lt!131140 lt!131372 #b00000000000000000000000000000000))))

(assert (=> d!62753 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62753 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131140 lt!131372 #b00000000000000000000000000000000) lt!131597)))

(declare-fun bs!9211 () Bool)

(assert (= bs!9211 d!62753))

(assert (=> bs!9211 m!276233))

(declare-fun m!276801 () Bool)

(assert (=> bs!9211 m!276801))

(assert (=> b!260368 d!62753))

(declare-fun d!62755 () Bool)

(declare-fun res!127440 () Bool)

(declare-fun e!168964 () Bool)

(assert (=> d!62755 (=> res!127440 e!168964)))

(assert (=> d!62755 (= res!127440 (= (select (arr!5960 lt!131140) #b00000000000000000000000000000000) lt!131372))))

(assert (=> d!62755 (= (arrayContainsKey!0 lt!131140 lt!131372 #b00000000000000000000000000000000) e!168964)))

(declare-fun b!260743 () Bool)

(declare-fun e!168965 () Bool)

(assert (=> b!260743 (= e!168964 e!168965)))

(declare-fun res!127441 () Bool)

(assert (=> b!260743 (=> (not res!127441) (not e!168965))))

(assert (=> b!260743 (= res!127441 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(declare-fun b!260744 () Bool)

(assert (=> b!260744 (= e!168965 (arrayContainsKey!0 lt!131140 lt!131372 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62755 (not res!127440)) b!260743))

(assert (= (and b!260743 res!127441) b!260744))

(assert (=> d!62755 m!276157))

(declare-fun m!276803 () Bool)

(assert (=> b!260744 m!276803))

(assert (=> b!260368 d!62755))

(declare-fun b!260745 () Bool)

(declare-fun c!44339 () Bool)

(declare-fun lt!131600 () (_ BitVec 64))

(assert (=> b!260745 (= c!44339 (= lt!131600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168967 () SeekEntryResult!1148)

(declare-fun e!168968 () SeekEntryResult!1148)

(assert (=> b!260745 (= e!168967 e!168968)))

(declare-fun b!260746 () Bool)

(declare-fun e!168966 () SeekEntryResult!1148)

(assert (=> b!260746 (= e!168966 e!168967)))

(declare-fun lt!131599 () SeekEntryResult!1148)

(assert (=> b!260746 (= lt!131600 (select (arr!5960 lt!131140) (index!6764 lt!131599)))))

(declare-fun c!44337 () Bool)

(assert (=> b!260746 (= c!44337 (= lt!131600 (select (arr!5960 lt!131140) #b00000000000000000000000000000000)))))

(declare-fun b!260747 () Bool)

(assert (=> b!260747 (= e!168968 (MissingZero!1148 (index!6764 lt!131599)))))

(declare-fun b!260748 () Bool)

(assert (=> b!260748 (= e!168967 (Found!1148 (index!6764 lt!131599)))))

(declare-fun b!260749 () Bool)

(assert (=> b!260749 (= e!168966 Undefined!1148)))

(declare-fun d!62757 () Bool)

(declare-fun lt!131598 () SeekEntryResult!1148)

(assert (=> d!62757 (and (or ((_ is Undefined!1148) lt!131598) (not ((_ is Found!1148) lt!131598)) (and (bvsge (index!6763 lt!131598) #b00000000000000000000000000000000) (bvslt (index!6763 lt!131598) (size!6309 lt!131140)))) (or ((_ is Undefined!1148) lt!131598) ((_ is Found!1148) lt!131598) (not ((_ is MissingZero!1148) lt!131598)) (and (bvsge (index!6762 lt!131598) #b00000000000000000000000000000000) (bvslt (index!6762 lt!131598) (size!6309 lt!131140)))) (or ((_ is Undefined!1148) lt!131598) ((_ is Found!1148) lt!131598) ((_ is MissingZero!1148) lt!131598) (not ((_ is MissingVacant!1148) lt!131598)) (and (bvsge (index!6765 lt!131598) #b00000000000000000000000000000000) (bvslt (index!6765 lt!131598) (size!6309 lt!131140)))) (or ((_ is Undefined!1148) lt!131598) (ite ((_ is Found!1148) lt!131598) (= (select (arr!5960 lt!131140) (index!6763 lt!131598)) (select (arr!5960 lt!131140) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1148) lt!131598) (= (select (arr!5960 lt!131140) (index!6762 lt!131598)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1148) lt!131598) (= (select (arr!5960 lt!131140) (index!6765 lt!131598)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62757 (= lt!131598 e!168966)))

(declare-fun c!44338 () Bool)

(assert (=> d!62757 (= c!44338 (and ((_ is Intermediate!1148) lt!131599) (undefined!1960 lt!131599)))))

(assert (=> d!62757 (= lt!131599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) (mask!11120 thiss!1504)) (select (arr!5960 lt!131140) #b00000000000000000000000000000000) lt!131140 (mask!11120 thiss!1504)))))

(assert (=> d!62757 (validMask!0 (mask!11120 thiss!1504))))

(assert (=> d!62757 (= (seekEntryOrOpen!0 (select (arr!5960 lt!131140) #b00000000000000000000000000000000) lt!131140 (mask!11120 thiss!1504)) lt!131598)))

(declare-fun b!260750 () Bool)

(assert (=> b!260750 (= e!168968 (seekKeyOrZeroReturnVacant!0 (x!25086 lt!131599) (index!6764 lt!131599) (index!6764 lt!131599) (select (arr!5960 lt!131140) #b00000000000000000000000000000000) lt!131140 (mask!11120 thiss!1504)))))

(assert (= (and d!62757 c!44338) b!260749))

(assert (= (and d!62757 (not c!44338)) b!260746))

(assert (= (and b!260746 c!44337) b!260748))

(assert (= (and b!260746 (not c!44337)) b!260745))

(assert (= (and b!260745 c!44339) b!260747))

(assert (= (and b!260745 (not c!44339)) b!260750))

(declare-fun m!276805 () Bool)

(assert (=> b!260746 m!276805))

(declare-fun m!276807 () Bool)

(assert (=> d!62757 m!276807))

(declare-fun m!276809 () Bool)

(assert (=> d!62757 m!276809))

(declare-fun m!276811 () Bool)

(assert (=> d!62757 m!276811))

(declare-fun m!276813 () Bool)

(assert (=> d!62757 m!276813))

(assert (=> d!62757 m!276157))

(declare-fun m!276815 () Bool)

(assert (=> d!62757 m!276815))

(assert (=> d!62757 m!275875))

(assert (=> d!62757 m!276157))

(assert (=> d!62757 m!276813))

(assert (=> b!260750 m!276157))

(declare-fun m!276817 () Bool)

(assert (=> b!260750 m!276817))

(assert (=> b!260368 d!62757))

(assert (=> b!260326 d!62605))

(assert (=> d!62549 d!62545))

(declare-fun b!260751 () Bool)

(declare-fun e!168971 () Bool)

(declare-fun call!24852 () Bool)

(assert (=> b!260751 (= e!168971 call!24852)))

(declare-fun b!260752 () Bool)

(declare-fun e!168970 () Bool)

(assert (=> b!260752 (= e!168970 call!24852)))

(declare-fun b!260753 () Bool)

(assert (=> b!260753 (= e!168970 e!168971)))

(declare-fun lt!131603 () (_ BitVec 64))

(assert (=> b!260753 (= lt!131603 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!131601 () Unit!8056)

(assert (=> b!260753 (= lt!131601 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131140 lt!131603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!260753 (arrayContainsKey!0 lt!131140 lt!131603 #b00000000000000000000000000000000)))

(declare-fun lt!131602 () Unit!8056)

(assert (=> b!260753 (= lt!131602 lt!131601)))

(declare-fun res!127442 () Bool)

(assert (=> b!260753 (= res!127442 (= (seekEntryOrOpen!0 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!131140 (mask!11120 thiss!1504)) (Found!1148 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!260753 (=> (not res!127442) (not e!168971))))

(declare-fun b!260754 () Bool)

(declare-fun e!168969 () Bool)

(assert (=> b!260754 (= e!168969 e!168970)))

(declare-fun c!44340 () Bool)

(assert (=> b!260754 (= c!44340 (validKeyInArray!0 (select (arr!5960 lt!131140) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24849 () Bool)

(assert (=> bm!24849 (= call!24852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!131140 (mask!11120 thiss!1504)))))

(declare-fun d!62759 () Bool)

(declare-fun res!127443 () Bool)

(assert (=> d!62759 (=> res!127443 e!168969)))

(assert (=> d!62759 (= res!127443 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 lt!131140)))))

(assert (=> d!62759 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131140 (mask!11120 thiss!1504)) e!168969)))

(assert (= (and d!62759 (not res!127443)) b!260754))

(assert (= (and b!260754 c!44340) b!260753))

(assert (= (and b!260754 (not c!44340)) b!260752))

(assert (= (and b!260753 res!127442) b!260751))

(assert (= (or b!260751 b!260752) bm!24849))

(assert (=> b!260753 m!276531))

(declare-fun m!276819 () Bool)

(assert (=> b!260753 m!276819))

(declare-fun m!276821 () Bool)

(assert (=> b!260753 m!276821))

(assert (=> b!260753 m!276531))

(declare-fun m!276823 () Bool)

(assert (=> b!260753 m!276823))

(assert (=> b!260754 m!276531))

(assert (=> b!260754 m!276531))

(assert (=> b!260754 m!276533))

(declare-fun m!276825 () Bool)

(assert (=> bm!24849 m!276825))

(assert (=> bm!24815 d!62759))

(declare-fun d!62761 () Bool)

(declare-fun e!168973 () Bool)

(assert (=> d!62761 e!168973))

(declare-fun res!127444 () Bool)

(assert (=> d!62761 (=> res!127444 e!168973)))

(declare-fun lt!131606 () Bool)

(assert (=> d!62761 (= res!127444 (not lt!131606))))

(declare-fun lt!131604 () Bool)

(assert (=> d!62761 (= lt!131606 lt!131604)))

(declare-fun lt!131605 () Unit!8056)

(declare-fun e!168972 () Unit!8056)

(assert (=> d!62761 (= lt!131605 e!168972)))

(declare-fun c!44341 () Bool)

(assert (=> d!62761 (= c!44341 lt!131604)))

(assert (=> d!62761 (= lt!131604 (containsKey!308 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> d!62761 (= (contains!1865 lt!131330 (_1!2438 (tuple2!4855 key!932 v!346))) lt!131606)))

(declare-fun b!260755 () Bool)

(declare-fun lt!131607 () Unit!8056)

(assert (=> b!260755 (= e!168972 lt!131607)))

(assert (=> b!260755 (= lt!131607 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346))))))

(assert (=> b!260755 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun b!260756 () Bool)

(declare-fun Unit!8083 () Unit!8056)

(assert (=> b!260756 (= e!168972 Unit!8083)))

(declare-fun b!260757 () Bool)

(assert (=> b!260757 (= e!168973 (isDefined!257 (getValueByKey!317 (toList!1900 lt!131330) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(assert (= (and d!62761 c!44341) b!260755))

(assert (= (and d!62761 (not c!44341)) b!260756))

(assert (= (and d!62761 (not res!127444)) b!260757))

(declare-fun m!276827 () Bool)

(assert (=> d!62761 m!276827))

(declare-fun m!276829 () Bool)

(assert (=> b!260755 m!276829))

(assert (=> b!260755 m!276143))

(assert (=> b!260755 m!276143))

(declare-fun m!276831 () Bool)

(assert (=> b!260755 m!276831))

(assert (=> b!260757 m!276143))

(assert (=> b!260757 m!276143))

(assert (=> b!260757 m!276831))

(assert (=> d!62535 d!62761))

(declare-fun b!260761 () Bool)

(declare-fun e!168975 () Option!323)

(assert (=> b!260761 (= e!168975 None!321)))

(declare-fun b!260759 () Bool)

(declare-fun e!168974 () Option!323)

(assert (=> b!260759 (= e!168974 e!168975)))

(declare-fun c!44343 () Bool)

(assert (=> b!260759 (= c!44343 (and ((_ is Cons!3728) lt!131329) (not (= (_1!2438 (h!4392 lt!131329)) (_1!2438 (tuple2!4855 key!932 v!346))))))))

(declare-fun d!62763 () Bool)

(declare-fun c!44342 () Bool)

(assert (=> d!62763 (= c!44342 (and ((_ is Cons!3728) lt!131329) (= (_1!2438 (h!4392 lt!131329)) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(assert (=> d!62763 (= (getValueByKey!317 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346))) e!168974)))

(declare-fun b!260760 () Bool)

(assert (=> b!260760 (= e!168975 (getValueByKey!317 (t!8793 lt!131329) (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun b!260758 () Bool)

(assert (=> b!260758 (= e!168974 (Some!322 (_2!2438 (h!4392 lt!131329))))))

(assert (= (and d!62763 c!44342) b!260758))

(assert (= (and d!62763 (not c!44342)) b!260759))

(assert (= (and b!260759 c!44343) b!260760))

(assert (= (and b!260759 (not c!44343)) b!260761))

(declare-fun m!276833 () Bool)

(assert (=> b!260760 m!276833))

(assert (=> d!62535 d!62763))

(declare-fun d!62765 () Bool)

(assert (=> d!62765 (= (getValueByKey!317 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346))) (Some!322 (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun lt!131610 () Unit!8056)

(declare-fun choose!1278 (List!3732 (_ BitVec 64) V!8473) Unit!8056)

(assert (=> d!62765 (= lt!131610 (choose!1278 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun e!168978 () Bool)

(assert (=> d!62765 e!168978))

(declare-fun res!127449 () Bool)

(assert (=> d!62765 (=> (not res!127449) (not e!168978))))

(assert (=> d!62765 (= res!127449 (isStrictlySorted!362 lt!131329))))

(assert (=> d!62765 (= (lemmaContainsTupThenGetReturnValue!173 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))) lt!131610)))

(declare-fun b!260766 () Bool)

(declare-fun res!127450 () Bool)

(assert (=> b!260766 (=> (not res!127450) (not e!168978))))

(assert (=> b!260766 (= res!127450 (containsKey!308 lt!131329 (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun b!260767 () Bool)

(assert (=> b!260767 (= e!168978 (contains!1868 lt!131329 (tuple2!4855 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346)))))))

(assert (= (and d!62765 res!127449) b!260766))

(assert (= (and b!260766 res!127450) b!260767))

(assert (=> d!62765 m!276137))

(declare-fun m!276835 () Bool)

(assert (=> d!62765 m!276835))

(declare-fun m!276837 () Bool)

(assert (=> d!62765 m!276837))

(declare-fun m!276839 () Bool)

(assert (=> b!260766 m!276839))

(declare-fun m!276841 () Bool)

(assert (=> b!260767 m!276841))

(assert (=> d!62535 d!62765))

(declare-fun e!168989 () List!3732)

(declare-fun b!260788 () Bool)

(assert (=> b!260788 (= e!168989 (insertStrictlySorted!176 (t!8793 (toList!1900 lt!131150)) (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun e!168991 () Bool)

(declare-fun b!260789 () Bool)

(declare-fun lt!131613 () List!3732)

(assert (=> b!260789 (= e!168991 (contains!1868 lt!131613 (tuple2!4855 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346)))))))

(declare-fun b!260790 () Bool)

(declare-fun e!168992 () List!3732)

(declare-fun call!24861 () List!3732)

(assert (=> b!260790 (= e!168992 call!24861)))

(declare-fun b!260791 () Bool)

(assert (=> b!260791 (= e!168992 call!24861)))

(declare-fun bm!24856 () Bool)

(declare-fun call!24860 () List!3732)

(declare-fun call!24859 () List!3732)

(assert (=> bm!24856 (= call!24860 call!24859)))

(declare-fun c!44353 () Bool)

(declare-fun b!260792 () Bool)

(declare-fun c!44352 () Bool)

(assert (=> b!260792 (= e!168989 (ite c!44352 (t!8793 (toList!1900 lt!131150)) (ite c!44353 (Cons!3728 (h!4392 (toList!1900 lt!131150)) (t!8793 (toList!1900 lt!131150))) Nil!3729)))))

(declare-fun bm!24857 () Bool)

(declare-fun c!44355 () Bool)

(declare-fun $colon$colon!105 (List!3732 tuple2!4854) List!3732)

(assert (=> bm!24857 (= call!24859 ($colon$colon!105 e!168989 (ite c!44355 (h!4392 (toList!1900 lt!131150)) (tuple2!4855 (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))))))))

(declare-fun c!44354 () Bool)

(assert (=> bm!24857 (= c!44354 c!44355)))

(declare-fun b!260793 () Bool)

(declare-fun e!168990 () List!3732)

(assert (=> b!260793 (= e!168990 call!24859)))

(declare-fun b!260794 () Bool)

(declare-fun res!127455 () Bool)

(assert (=> b!260794 (=> (not res!127455) (not e!168991))))

(assert (=> b!260794 (= res!127455 (containsKey!308 lt!131613 (_1!2438 (tuple2!4855 key!932 v!346))))))

(declare-fun d!62767 () Bool)

(assert (=> d!62767 e!168991))

(declare-fun res!127456 () Bool)

(assert (=> d!62767 (=> (not res!127456) (not e!168991))))

(assert (=> d!62767 (= res!127456 (isStrictlySorted!362 lt!131613))))

(assert (=> d!62767 (= lt!131613 e!168990)))

(assert (=> d!62767 (= c!44355 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (bvslt (_1!2438 (h!4392 (toList!1900 lt!131150))) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(assert (=> d!62767 (isStrictlySorted!362 (toList!1900 lt!131150))))

(assert (=> d!62767 (= (insertStrictlySorted!176 (toList!1900 lt!131150) (_1!2438 (tuple2!4855 key!932 v!346)) (_2!2438 (tuple2!4855 key!932 v!346))) lt!131613)))

(declare-fun b!260795 () Bool)

(assert (=> b!260795 (= c!44353 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (bvsgt (_1!2438 (h!4392 (toList!1900 lt!131150))) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(declare-fun e!168993 () List!3732)

(assert (=> b!260795 (= e!168993 e!168992)))

(declare-fun b!260796 () Bool)

(assert (=> b!260796 (= e!168993 call!24860)))

(declare-fun bm!24858 () Bool)

(assert (=> bm!24858 (= call!24861 call!24860)))

(declare-fun b!260797 () Bool)

(assert (=> b!260797 (= e!168990 e!168993)))

(assert (=> b!260797 (= c!44352 (and ((_ is Cons!3728) (toList!1900 lt!131150)) (= (_1!2438 (h!4392 (toList!1900 lt!131150))) (_1!2438 (tuple2!4855 key!932 v!346)))))))

(assert (= (and d!62767 c!44355) b!260793))

(assert (= (and d!62767 (not c!44355)) b!260797))

(assert (= (and b!260797 c!44352) b!260796))

(assert (= (and b!260797 (not c!44352)) b!260795))

(assert (= (and b!260795 c!44353) b!260790))

(assert (= (and b!260795 (not c!44353)) b!260791))

(assert (= (or b!260790 b!260791) bm!24858))

(assert (= (or b!260796 bm!24858) bm!24856))

(assert (= (or b!260793 bm!24856) bm!24857))

(assert (= (and bm!24857 c!44354) b!260788))

(assert (= (and bm!24857 (not c!44354)) b!260792))

(assert (= (and d!62767 res!127456) b!260794))

(assert (= (and b!260794 res!127455) b!260789))

(declare-fun m!276843 () Bool)

(assert (=> b!260794 m!276843))

(declare-fun m!276845 () Bool)

(assert (=> d!62767 m!276845))

(assert (=> d!62767 m!276497))

(declare-fun m!276847 () Bool)

(assert (=> bm!24857 m!276847))

(declare-fun m!276849 () Bool)

(assert (=> b!260788 m!276849))

(declare-fun m!276851 () Bool)

(assert (=> b!260789 m!276851))

(assert (=> d!62535 d!62767))

(assert (=> bm!24821 d!62521))

(declare-fun b!260798 () Bool)

(declare-fun e!168995 () (_ BitVec 32))

(declare-fun e!168994 () (_ BitVec 32))

(assert (=> b!260798 (= e!168995 e!168994)))

(declare-fun c!44357 () Bool)

(assert (=> b!260798 (= c!44357 (validKeyInArray!0 (select (arr!5960 (_keys!6974 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62769 () Bool)

(declare-fun lt!131614 () (_ BitVec 32))

(assert (=> d!62769 (and (bvsge lt!131614 #b00000000000000000000000000000000) (bvsle lt!131614 (bvsub (size!6309 (_keys!6974 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62769 (= lt!131614 e!168995)))

(declare-fun c!44356 () Bool)

(assert (=> d!62769 (= c!44356 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62769 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6309 (_keys!6974 thiss!1504)) (size!6309 (_keys!6974 thiss!1504))))))

(assert (=> d!62769 (= (arrayCountValidKeys!0 (_keys!6974 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))) lt!131614)))

(declare-fun bm!24859 () Bool)

(declare-fun call!24862 () (_ BitVec 32))

(assert (=> bm!24859 (= call!24862 (arrayCountValidKeys!0 (_keys!6974 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6309 (_keys!6974 thiss!1504))))))

(declare-fun b!260799 () Bool)

(assert (=> b!260799 (= e!168994 (bvadd #b00000000000000000000000000000001 call!24862))))

(declare-fun b!260800 () Bool)

(assert (=> b!260800 (= e!168995 #b00000000000000000000000000000000)))

(declare-fun b!260801 () Bool)

(assert (=> b!260801 (= e!168994 call!24862)))

(assert (= (and d!62769 c!44356) b!260800))

(assert (= (and d!62769 (not c!44356)) b!260798))

(assert (= (and b!260798 c!44357) b!260799))

(assert (= (and b!260798 (not c!44357)) b!260801))

(assert (= (or b!260799 b!260801) bm!24859))

(assert (=> b!260798 m!276537))

(assert (=> b!260798 m!276537))

(declare-fun m!276853 () Bool)

(assert (=> b!260798 m!276853))

(declare-fun m!276855 () Bool)

(assert (=> bm!24859 m!276855))

(assert (=> bm!24816 d!62769))

(declare-fun d!62771 () Bool)

(assert (=> d!62771 (= (apply!258 lt!131301 (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000)) (get!3078 (getValueByKey!317 (toList!1900 lt!131301) (select (arr!5960 (_keys!6974 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9212 () Bool)

(assert (= bs!9212 d!62771))

(assert (=> bs!9212 m!276055))

(assert (=> bs!9212 m!276315))

(assert (=> bs!9212 m!276315))

(declare-fun m!276857 () Bool)

(assert (=> bs!9212 m!276857))

(assert (=> b!260270 d!62771))

(declare-fun d!62773 () Bool)

(declare-fun c!44358 () Bool)

(assert (=> d!62773 (= c!44358 ((_ is ValueCellFull!2966) (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168996 () V!8473)

(assert (=> d!62773 (= (get!3077 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168996)))

(declare-fun b!260802 () Bool)

(assert (=> b!260802 (= e!168996 (get!3079 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260803 () Bool)

(assert (=> b!260803 (= e!168996 (get!3080 (select (arr!5959 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62773 c!44358) b!260802))

(assert (= (and d!62773 (not c!44358)) b!260803))

(assert (=> b!260802 m!276113))

(assert (=> b!260802 m!276115))

(declare-fun m!276859 () Bool)

(assert (=> b!260802 m!276859))

(assert (=> b!260803 m!276113))

(assert (=> b!260803 m!276115))

(declare-fun m!276861 () Bool)

(assert (=> b!260803 m!276861))

(assert (=> b!260270 d!62773))

(assert (=> d!62529 d!62545))

(declare-fun b!260805 () Bool)

(declare-fun e!168997 () Bool)

(assert (=> b!260805 (= e!168997 tp_is_empty!6619)))

(declare-fun b!260804 () Bool)

(declare-fun e!168998 () Bool)

(assert (=> b!260804 (= e!168998 tp_is_empty!6619)))

(declare-fun condMapEmpty!11289 () Bool)

(declare-fun mapDefault!11289 () ValueCell!2966)

(assert (=> mapNonEmpty!11288 (= condMapEmpty!11289 (= mapRest!11288 ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11289)))))

(declare-fun mapRes!11289 () Bool)

(assert (=> mapNonEmpty!11288 (= tp!23609 (and e!168997 mapRes!11289))))

(declare-fun mapNonEmpty!11289 () Bool)

(declare-fun tp!23610 () Bool)

(assert (=> mapNonEmpty!11289 (= mapRes!11289 (and tp!23610 e!168998))))

(declare-fun mapKey!11289 () (_ BitVec 32))

(declare-fun mapRest!11289 () (Array (_ BitVec 32) ValueCell!2966))

(declare-fun mapValue!11289 () ValueCell!2966)

(assert (=> mapNonEmpty!11289 (= mapRest!11288 (store mapRest!11289 mapKey!11289 mapValue!11289))))

(declare-fun mapIsEmpty!11289 () Bool)

(assert (=> mapIsEmpty!11289 mapRes!11289))

(assert (= (and mapNonEmpty!11288 condMapEmpty!11289) mapIsEmpty!11289))

(assert (= (and mapNonEmpty!11288 (not condMapEmpty!11289)) mapNonEmpty!11289))

(assert (= (and mapNonEmpty!11289 ((_ is ValueCellFull!2966) mapValue!11289)) b!260804))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2966) mapDefault!11289)) b!260805))

(declare-fun m!276863 () Bool)

(assert (=> mapNonEmpty!11289 m!276863))

(declare-fun b_lambda!8299 () Bool)

(assert (= b_lambda!8295 (or (and b!260059 b_free!6757) b_lambda!8299)))

(declare-fun b_lambda!8301 () Bool)

(assert (= b_lambda!8291 (or (and b!260059 b_free!6757) b_lambda!8301)))

(declare-fun b_lambda!8303 () Bool)

(assert (= b_lambda!8293 (or (and b!260059 b_free!6757) b_lambda!8303)))

(declare-fun b_lambda!8305 () Bool)

(assert (= b_lambda!8289 (or (and b!260059 b_free!6757) b_lambda!8305)))

(declare-fun b_lambda!8307 () Bool)

(assert (= b_lambda!8297 (or (and b!260059 b_free!6757) b_lambda!8307)))

(check-sat (not b!260625) (not d!62751) (not b!260440) (not b!260760) (not b!260605) (not b!260701) (not b!260753) (not b!260694) (not d!62607) (not b!260727) (not b!260443) (not bm!24849) (not b!260553) (not d!62709) (not b!260714) (not b!260724) (not b!260711) (not b!260672) (not b!260689) (not b!260611) (not d!62673) (not d!62641) (not b!260604) (not b!260554) (not b!260708) (not b!260798) (not d!62591) (not d!62729) (not bm!24846) (not b!260788) (not b!260537) (not b!260767) (not b!260545) (not d!62699) (not b!260458) (not b!260704) (not d!62691) (not b!260626) (not d!62743) (not b!260525) (not d!62621) (not b!260491) (not b!260740) (not b!260688) (not bm!24847) (not b!260803) (not b!260802) (not d!62695) (not b!260539) (not d!62711) (not b!260540) (not d!62715) b_and!13895 (not d!62631) (not d!62581) (not b!260606) (not b!260532) (not bm!24842) (not b!260737) (not b!260794) (not b!260454) (not d!62713) (not bm!24834) (not b!260464) (not d!62765) (not d!62767) (not b!260465) (not d!62753) (not b!260754) (not d!62649) (not d!62611) (not b!260755) (not b!260570) (not d!62643) (not b!260530) (not d!62707) (not b!260567) (not d!62697) (not b!260623) (not d!62685) (not b!260742) (not bm!24857) (not d!62701) (not d!62627) (not b!260691) (not d!62665) (not b!260750) (not d!62619) (not d!62723) (not bm!24828) (not b!260541) (not d!62647) (not d!62633) (not b_next!6757) (not b!260560) (not b!260555) (not b!260705) (not b!260533) (not b!260766) (not b!260681) (not b!260529) (not d!62705) (not b_lambda!8299) (not b!260707) (not b!260561) (not b!260535) (not bm!24823) (not b!260442) (not d!62623) (not d!62609) (not bm!24848) (not d!62635) (not b_lambda!8285) (not b!260757) (not bm!24829) (not b_lambda!8307) (not d!62731) (not b!260556) (not d!62637) (not b!260739) (not b!260668) (not bm!24830) (not d!62771) (not b!260456) (not b!260692) (not d!62683) (not b!260735) (not b!260523) (not b_lambda!8287) (not b!260497) (not d!62629) (not d!62725) (not d!62703) (not b!260577) (not b!260557) (not b!260528) (not b!260647) (not b!260696) (not bm!24837) (not mapNonEmpty!11289) (not d!62667) (not b!260628) tp_is_empty!6619 (not b_lambda!8303) (not bm!24844) (not b!260645) (not d!62615) (not b_lambda!8301) (not b!260562) (not b!260709) (not d!62757) (not d!62761) (not d!62601) (not b!260463) (not b!260697) (not b!260726) (not d!62677) (not b!260674) (not d!62741) (not b!260736) (not d!62717) (not b!260731) (not d!62693) (not bm!24831) (not d!62653) (not d!62613) (not b!260498) (not b!260616) (not b!260702) (not b!260607) (not d!62595) (not b_lambda!8305) (not d!62639) (not b!260789) (not d!62689) (not d!62597) (not d!62675) (not b!260466) (not d!62589) (not d!62687) (not b!260729) (not bm!24859) (not bm!24836) (not b!260732) (not b!260527) (not d!62617) (not d!62671) (not bm!24835) (not bm!24843) (not d!62669) (not b!260542) (not d!62739) (not d!62745) (not b!260734) (not d!62727) (not b!260639) (not b!260638) (not d!62737) (not b!260693) (not d!62583) (not b!260698) (not b!260713) (not b!260651) (not b!260700) (not d!62747) (not b!260544) (not b!260559) (not b!260551) (not b!260744) (not b!260622) (not b!260723) (not b!260649) (not bm!24845) (not b!260653) (not bm!24838) (not d!62625) (not b!260441) (not b!260673))
(check-sat b_and!13895 (not b_next!6757))
