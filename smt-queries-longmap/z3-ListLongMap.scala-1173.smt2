; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25188 () Bool)

(assert start!25188)

(declare-fun b!262264 () Bool)

(declare-fun b_free!6787 () Bool)

(declare-fun b_next!6787 () Bool)

(assert (=> b!262264 (= b_free!6787 (not b_next!6787))))

(declare-fun tp!23695 () Bool)

(declare-fun b_and!13899 () Bool)

(assert (=> b!262264 (= tp!23695 b_and!13899)))

(declare-fun bm!25051 () Bool)

(declare-fun call!25054 () Bool)

(declare-datatypes ((V!8513 0))(
  ( (V!8514 (val!3369 Int)) )
))
(declare-datatypes ((ValueCell!2981 0))(
  ( (ValueCellFull!2981 (v!5491 V!8513)) (EmptyCell!2981) )
))
(declare-datatypes ((array!12649 0))(
  ( (array!12650 (arr!5985 (Array (_ BitVec 32) ValueCell!2981)) (size!6337 (_ BitVec 32))) )
))
(declare-datatypes ((array!12651 0))(
  ( (array!12652 (arr!5986 (Array (_ BitVec 32) (_ BitVec 64))) (size!6338 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3862 0))(
  ( (LongMapFixedSize!3863 (defaultEntry!4834 Int) (mask!11192 (_ BitVec 32)) (extraKeys!4571 (_ BitVec 32)) (zeroValue!4675 V!8513) (minValue!4675 V!8513) (_size!1980 (_ BitVec 32)) (_keys!7023 array!12651) (_values!4817 array!12649) (_vacant!1980 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3862)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25051 (= call!25054 (arrayContainsKey!0 (_keys!7023 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262258 () Bool)

(declare-fun e!169954 () Bool)

(declare-fun e!169951 () Bool)

(assert (=> b!262258 (= e!169954 e!169951)))

(declare-fun res!128080 () Bool)

(declare-fun call!25055 () Bool)

(assert (=> b!262258 (= res!128080 call!25055)))

(assert (=> b!262258 (=> (not res!128080) (not e!169951))))

(declare-fun b!262259 () Bool)

(declare-fun res!128075 () Bool)

(declare-datatypes ((SeekEntryResult!1191 0))(
  ( (MissingZero!1191 (index!6934 (_ BitVec 32))) (Found!1191 (index!6935 (_ BitVec 32))) (Intermediate!1191 (undefined!2003 Bool) (index!6936 (_ BitVec 32)) (x!25214 (_ BitVec 32))) (Undefined!1191) (MissingVacant!1191 (index!6937 (_ BitVec 32))) )
))
(declare-fun lt!132466 () SeekEntryResult!1191)

(assert (=> b!262259 (= res!128075 (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6937 lt!132466)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262259 (=> (not res!128075) (not e!169951))))

(declare-fun b!262260 () Bool)

(declare-datatypes ((Unit!8124 0))(
  ( (Unit!8125) )
))
(declare-fun e!169958 () Unit!8124)

(declare-fun Unit!8126 () Unit!8124)

(assert (=> b!262260 (= e!169958 Unit!8126)))

(declare-fun lt!132463 () Unit!8124)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!447 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8124)

(assert (=> b!262260 (= lt!132463 (lemmaInListMapThenSeekEntryOrOpenFindsIt!447 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> b!262260 false))

(declare-fun mapNonEmpty!11335 () Bool)

(declare-fun mapRes!11335 () Bool)

(declare-fun tp!23694 () Bool)

(declare-fun e!169953 () Bool)

(assert (=> mapNonEmpty!11335 (= mapRes!11335 (and tp!23694 e!169953))))

(declare-fun mapValue!11335 () ValueCell!2981)

(declare-fun mapRest!11335 () (Array (_ BitVec 32) ValueCell!2981))

(declare-fun mapKey!11335 () (_ BitVec 32))

(assert (=> mapNonEmpty!11335 (= (arr!5985 (_values!4817 thiss!1504)) (store mapRest!11335 mapKey!11335 mapValue!11335))))

(declare-fun b!262261 () Bool)

(declare-fun e!169957 () Bool)

(declare-fun e!169956 () Bool)

(assert (=> b!262261 (= e!169957 e!169956)))

(declare-fun res!128077 () Bool)

(assert (=> b!262261 (=> (not res!128077) (not e!169956))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262261 (= res!128077 (inRange!0 index!297 (mask!11192 thiss!1504)))))

(declare-fun lt!132461 () Unit!8124)

(assert (=> b!262261 (= lt!132461 e!169958)))

(declare-fun c!44689 () Bool)

(declare-datatypes ((tuple2!4916 0))(
  ( (tuple2!4917 (_1!2469 (_ BitVec 64)) (_2!2469 V!8513)) )
))
(declare-datatypes ((List!3814 0))(
  ( (Nil!3811) (Cons!3810 (h!4476 tuple2!4916) (t!8880 List!3814)) )
))
(declare-datatypes ((ListLongMap!3819 0))(
  ( (ListLongMap!3820 (toList!1925 List!3814)) )
))
(declare-fun lt!132464 () ListLongMap!3819)

(declare-fun contains!1885 (ListLongMap!3819 (_ BitVec 64)) Bool)

(assert (=> b!262261 (= c!44689 (contains!1885 lt!132464 key!932))))

(declare-fun getCurrentListMap!1434 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) Int) ListLongMap!3819)

(assert (=> b!262261 (= lt!132464 (getCurrentListMap!1434 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun b!262262 () Bool)

(declare-fun e!169949 () Bool)

(assert (=> b!262262 (= e!169949 (not call!25054))))

(declare-fun b!262263 () Bool)

(declare-fun e!169952 () Unit!8124)

(declare-fun Unit!8127 () Unit!8124)

(assert (=> b!262263 (= e!169952 Unit!8127)))

(declare-fun lt!132467 () Unit!8124)

(declare-fun lemmaArrayContainsKeyThenInListMap!260 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) (_ BitVec 32) Int) Unit!8124)

(assert (=> b!262263 (= lt!132467 (lemmaArrayContainsKeyThenInListMap!260 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(assert (=> b!262263 false))

(declare-fun e!169948 () Bool)

(declare-fun tp_is_empty!6649 () Bool)

(declare-fun e!169947 () Bool)

(declare-fun array_inv!3959 (array!12651) Bool)

(declare-fun array_inv!3960 (array!12649) Bool)

(assert (=> b!262264 (= e!169947 (and tp!23695 tp_is_empty!6649 (array_inv!3959 (_keys!7023 thiss!1504)) (array_inv!3960 (_values!4817 thiss!1504)) e!169948))))

(declare-fun mapIsEmpty!11335 () Bool)

(assert (=> mapIsEmpty!11335 mapRes!11335))

(declare-fun b!262265 () Bool)

(declare-fun Unit!8128 () Unit!8124)

(assert (=> b!262265 (= e!169952 Unit!8128)))

(declare-fun b!262266 () Bool)

(assert (=> b!262266 (= e!169953 tp_is_empty!6649)))

(declare-fun b!262267 () Bool)

(declare-fun e!169959 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262267 (= e!169959 (validKeyInArray!0 key!932))))

(declare-fun b!262268 () Bool)

(get-info :version)

(assert (=> b!262268 (= e!169954 ((_ is Undefined!1191) lt!132466))))

(declare-fun b!262269 () Bool)

(assert (=> b!262269 (= e!169951 (not call!25054))))

(declare-fun b!262270 () Bool)

(declare-fun res!128079 () Bool)

(declare-fun e!169955 () Bool)

(assert (=> b!262270 (=> (not res!128079) (not e!169955))))

(assert (=> b!262270 (= res!128079 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262271 () Bool)

(declare-fun c!44691 () Bool)

(assert (=> b!262271 (= c!44691 ((_ is MissingVacant!1191) lt!132466))))

(declare-fun e!169950 () Bool)

(assert (=> b!262271 (= e!169950 e!169954)))

(declare-fun b!262272 () Bool)

(declare-fun e!169961 () Bool)

(assert (=> b!262272 (= e!169961 tp_is_empty!6649)))

(declare-fun b!262273 () Bool)

(declare-fun lt!132455 () Unit!8124)

(assert (=> b!262273 (= e!169958 lt!132455)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8124)

(assert (=> b!262273 (= lt!132455 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(declare-fun c!44692 () Bool)

(assert (=> b!262273 (= c!44692 ((_ is MissingZero!1191) lt!132466))))

(assert (=> b!262273 e!169950))

(declare-fun res!128082 () Bool)

(assert (=> start!25188 (=> (not res!128082) (not e!169955))))

(declare-fun valid!1511 (LongMapFixedSize!3862) Bool)

(assert (=> start!25188 (= res!128082 (valid!1511 thiss!1504))))

(assert (=> start!25188 e!169955))

(assert (=> start!25188 e!169947))

(assert (=> start!25188 true))

(assert (=> start!25188 tp_is_empty!6649))

(declare-fun b!262274 () Bool)

(declare-fun res!128083 () Bool)

(assert (=> b!262274 (=> (not res!128083) (not e!169949))))

(assert (=> b!262274 (= res!128083 (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6934 lt!132466)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25052 () Bool)

(assert (=> bm!25052 (= call!25055 (inRange!0 (ite c!44692 (index!6934 lt!132466) (index!6937 lt!132466)) (mask!11192 thiss!1504)))))

(declare-fun b!262275 () Bool)

(assert (=> b!262275 (= e!169956 (not e!169959))))

(declare-fun res!128074 () Bool)

(assert (=> b!262275 (=> res!128074 e!169959)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262275 (= res!128074 (not (validMask!0 (mask!11192 thiss!1504))))))

(declare-fun lt!132454 () array!12651)

(declare-fun arrayCountValidKeys!0 (array!12651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262275 (= (arrayCountValidKeys!0 lt!132454 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132457 () Unit!8124)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12651 (_ BitVec 32)) Unit!8124)

(assert (=> b!262275 (= lt!132457 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132454 index!297))))

(assert (=> b!262275 (arrayContainsKey!0 lt!132454 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132462 () Unit!8124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12651 (_ BitVec 64) (_ BitVec 32)) Unit!8124)

(assert (=> b!262275 (= lt!132462 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132454 key!932 index!297))))

(declare-fun v!346 () V!8513)

(declare-fun +!712 (ListLongMap!3819 tuple2!4916) ListLongMap!3819)

(assert (=> b!262275 (= (+!712 lt!132464 (tuple2!4917 key!932 v!346)) (getCurrentListMap!1434 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132459 () Unit!8124)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!123 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) (_ BitVec 64) V!8513 Int) Unit!8124)

(assert (=> b!262275 (= lt!132459 (lemmaAddValidKeyToArrayThenAddPairToListMap!123 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12651 (_ BitVec 32)) Bool)

(assert (=> b!262275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132454 (mask!11192 thiss!1504))))

(declare-fun lt!132456 () Unit!8124)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12651 (_ BitVec 32) (_ BitVec 32)) Unit!8124)

(assert (=> b!262275 (= lt!132456 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) index!297 (mask!11192 thiss!1504)))))

(assert (=> b!262275 (= (arrayCountValidKeys!0 lt!132454 #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7023 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504)))))))

(declare-fun lt!132465 () Unit!8124)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12651 (_ BitVec 32) (_ BitVec 64)) Unit!8124)

(assert (=> b!262275 (= lt!132465 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7023 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3815 0))(
  ( (Nil!3812) (Cons!3811 (h!4477 (_ BitVec 64)) (t!8881 List!3815)) )
))
(declare-fun arrayNoDuplicates!0 (array!12651 (_ BitVec 32) List!3815) Bool)

(assert (=> b!262275 (arrayNoDuplicates!0 lt!132454 #b00000000000000000000000000000000 Nil!3812)))

(assert (=> b!262275 (= lt!132454 (array!12652 (store (arr!5986 (_keys!7023 thiss!1504)) index!297 key!932) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun lt!132458 () Unit!8124)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12651 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3815) Unit!8124)

(assert (=> b!262275 (= lt!132458 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7023 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3812))))

(declare-fun lt!132460 () Unit!8124)

(assert (=> b!262275 (= lt!132460 e!169952)))

(declare-fun c!44690 () Bool)

(assert (=> b!262275 (= c!44690 (arrayContainsKey!0 (_keys!7023 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262276 () Bool)

(declare-fun res!128076 () Bool)

(assert (=> b!262276 (=> (not res!128076) (not e!169949))))

(assert (=> b!262276 (= res!128076 call!25055)))

(assert (=> b!262276 (= e!169950 e!169949)))

(declare-fun b!262277 () Bool)

(declare-fun res!128078 () Bool)

(assert (=> b!262277 (=> res!128078 e!169959)))

(assert (=> b!262277 (= res!128078 (or (not (= (size!6337 (_values!4817 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11192 thiss!1504)))) (not (= (size!6338 (_keys!7023 thiss!1504)) (size!6337 (_values!4817 thiss!1504)))) (bvslt (mask!11192 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000011) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6338 (_keys!7023 thiss!1504)))))))

(declare-fun b!262278 () Bool)

(assert (=> b!262278 (= e!169948 (and e!169961 mapRes!11335))))

(declare-fun condMapEmpty!11335 () Bool)

(declare-fun mapDefault!11335 () ValueCell!2981)

(assert (=> b!262278 (= condMapEmpty!11335 (= (arr!5985 (_values!4817 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2981)) mapDefault!11335)))))

(declare-fun b!262279 () Bool)

(assert (=> b!262279 (= e!169955 e!169957)))

(declare-fun res!128081 () Bool)

(assert (=> b!262279 (=> (not res!128081) (not e!169957))))

(assert (=> b!262279 (= res!128081 (or (= lt!132466 (MissingZero!1191 index!297)) (= lt!132466 (MissingVacant!1191 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12651 (_ BitVec 32)) SeekEntryResult!1191)

(assert (=> b!262279 (= lt!132466 (seekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(assert (= (and start!25188 res!128082) b!262270))

(assert (= (and b!262270 res!128079) b!262279))

(assert (= (and b!262279 res!128081) b!262261))

(assert (= (and b!262261 c!44689) b!262260))

(assert (= (and b!262261 (not c!44689)) b!262273))

(assert (= (and b!262273 c!44692) b!262276))

(assert (= (and b!262273 (not c!44692)) b!262271))

(assert (= (and b!262276 res!128076) b!262274))

(assert (= (and b!262274 res!128083) b!262262))

(assert (= (and b!262271 c!44691) b!262258))

(assert (= (and b!262271 (not c!44691)) b!262268))

(assert (= (and b!262258 res!128080) b!262259))

(assert (= (and b!262259 res!128075) b!262269))

(assert (= (or b!262276 b!262258) bm!25052))

(assert (= (or b!262262 b!262269) bm!25051))

(assert (= (and b!262261 res!128077) b!262275))

(assert (= (and b!262275 c!44690) b!262263))

(assert (= (and b!262275 (not c!44690)) b!262265))

(assert (= (and b!262275 (not res!128074)) b!262277))

(assert (= (and b!262277 (not res!128078)) b!262267))

(assert (= (and b!262278 condMapEmpty!11335) mapIsEmpty!11335))

(assert (= (and b!262278 (not condMapEmpty!11335)) mapNonEmpty!11335))

(assert (= (and mapNonEmpty!11335 ((_ is ValueCellFull!2981) mapValue!11335)) b!262266))

(assert (= (and b!262278 ((_ is ValueCellFull!2981) mapDefault!11335)) b!262272))

(assert (= b!262264 b!262278))

(assert (= start!25188 b!262264))

(declare-fun m!277863 () Bool)

(assert (=> bm!25051 m!277863))

(declare-fun m!277865 () Bool)

(assert (=> b!262275 m!277865))

(declare-fun m!277867 () Bool)

(assert (=> b!262275 m!277867))

(declare-fun m!277869 () Bool)

(assert (=> b!262275 m!277869))

(declare-fun m!277871 () Bool)

(assert (=> b!262275 m!277871))

(declare-fun m!277873 () Bool)

(assert (=> b!262275 m!277873))

(declare-fun m!277875 () Bool)

(assert (=> b!262275 m!277875))

(declare-fun m!277877 () Bool)

(assert (=> b!262275 m!277877))

(declare-fun m!277879 () Bool)

(assert (=> b!262275 m!277879))

(declare-fun m!277881 () Bool)

(assert (=> b!262275 m!277881))

(assert (=> b!262275 m!277863))

(declare-fun m!277883 () Bool)

(assert (=> b!262275 m!277883))

(declare-fun m!277885 () Bool)

(assert (=> b!262275 m!277885))

(declare-fun m!277887 () Bool)

(assert (=> b!262275 m!277887))

(declare-fun m!277889 () Bool)

(assert (=> b!262275 m!277889))

(declare-fun m!277891 () Bool)

(assert (=> b!262275 m!277891))

(declare-fun m!277893 () Bool)

(assert (=> b!262275 m!277893))

(declare-fun m!277895 () Bool)

(assert (=> b!262275 m!277895))

(declare-fun m!277897 () Bool)

(assert (=> b!262275 m!277897))

(declare-fun m!277899 () Bool)

(assert (=> b!262264 m!277899))

(declare-fun m!277901 () Bool)

(assert (=> b!262264 m!277901))

(declare-fun m!277903 () Bool)

(assert (=> b!262260 m!277903))

(declare-fun m!277905 () Bool)

(assert (=> b!262273 m!277905))

(declare-fun m!277907 () Bool)

(assert (=> b!262263 m!277907))

(declare-fun m!277909 () Bool)

(assert (=> b!262259 m!277909))

(declare-fun m!277911 () Bool)

(assert (=> bm!25052 m!277911))

(declare-fun m!277913 () Bool)

(assert (=> b!262274 m!277913))

(declare-fun m!277915 () Bool)

(assert (=> start!25188 m!277915))

(declare-fun m!277917 () Bool)

(assert (=> b!262261 m!277917))

(declare-fun m!277919 () Bool)

(assert (=> b!262261 m!277919))

(declare-fun m!277921 () Bool)

(assert (=> b!262261 m!277921))

(declare-fun m!277923 () Bool)

(assert (=> b!262267 m!277923))

(declare-fun m!277925 () Bool)

(assert (=> b!262279 m!277925))

(declare-fun m!277927 () Bool)

(assert (=> mapNonEmpty!11335 m!277927))

(check-sat (not b!262279) (not bm!25052) b_and!13899 (not b_next!6787) (not b!262264) (not b!262261) (not b!262267) (not b!262263) (not b!262260) (not mapNonEmpty!11335) tp_is_empty!6649 (not b!262275) (not b!262273) (not start!25188) (not bm!25051))
(check-sat b_and!13899 (not b_next!6787))
(get-model)

(declare-fun b!262428 () Bool)

(declare-fun res!128155 () Bool)

(declare-fun e!170060 () Bool)

(assert (=> b!262428 (=> (not res!128155) (not e!170060))))

(declare-fun lt!132556 () SeekEntryResult!1191)

(assert (=> b!262428 (= res!128155 (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6937 lt!132556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262428 (and (bvsge (index!6937 lt!132556) #b00000000000000000000000000000000) (bvslt (index!6937 lt!132556) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262429 () Bool)

(declare-fun call!25073 () Bool)

(assert (=> b!262429 (= e!170060 (not call!25073))))

(declare-fun bm!25069 () Bool)

(declare-fun call!25072 () Bool)

(declare-fun c!44721 () Bool)

(assert (=> bm!25069 (= call!25072 (inRange!0 (ite c!44721 (index!6934 lt!132556) (index!6937 lt!132556)) (mask!11192 thiss!1504)))))

(declare-fun bm!25070 () Bool)

(assert (=> bm!25070 (= call!25073 (arrayContainsKey!0 (_keys!7023 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262431 () Bool)

(declare-fun e!170063 () Bool)

(assert (=> b!262431 (= e!170063 ((_ is Undefined!1191) lt!132556))))

(declare-fun b!262432 () Bool)

(declare-fun e!170062 () Bool)

(assert (=> b!262432 (= e!170062 (not call!25073))))

(declare-fun b!262433 () Bool)

(declare-fun res!128154 () Bool)

(assert (=> b!262433 (=> (not res!128154) (not e!170060))))

(assert (=> b!262433 (= res!128154 call!25072)))

(assert (=> b!262433 (= e!170063 e!170060)))

(declare-fun b!262434 () Bool)

(declare-fun e!170061 () Bool)

(assert (=> b!262434 (= e!170061 e!170062)))

(declare-fun res!128152 () Bool)

(assert (=> b!262434 (= res!128152 call!25072)))

(assert (=> b!262434 (=> (not res!128152) (not e!170062))))

(declare-fun b!262435 () Bool)

(assert (=> b!262435 (= e!170061 e!170063)))

(declare-fun c!44722 () Bool)

(assert (=> b!262435 (= c!44722 ((_ is MissingVacant!1191) lt!132556))))

(declare-fun b!262430 () Bool)

(assert (=> b!262430 (and (bvsge (index!6934 lt!132556) #b00000000000000000000000000000000) (bvslt (index!6934 lt!132556) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun res!128153 () Bool)

(assert (=> b!262430 (= res!128153 (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6934 lt!132556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262430 (=> (not res!128153) (not e!170062))))

(declare-fun d!62871 () Bool)

(assert (=> d!62871 e!170061))

(assert (=> d!62871 (= c!44721 ((_ is MissingZero!1191) lt!132556))))

(assert (=> d!62871 (= lt!132556 (seekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(declare-fun lt!132557 () Unit!8124)

(declare-fun choose!1291 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8124)

(assert (=> d!62871 (= lt!132557 (choose!1291 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!62871 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62871 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)) lt!132557)))

(assert (= (and d!62871 c!44721) b!262434))

(assert (= (and d!62871 (not c!44721)) b!262435))

(assert (= (and b!262434 res!128152) b!262430))

(assert (= (and b!262430 res!128153) b!262432))

(assert (= (and b!262435 c!44722) b!262433))

(assert (= (and b!262435 (not c!44722)) b!262431))

(assert (= (and b!262433 res!128154) b!262428))

(assert (= (and b!262428 res!128155) b!262429))

(assert (= (or b!262434 b!262433) bm!25069))

(assert (= (or b!262432 b!262429) bm!25070))

(assert (=> d!62871 m!277925))

(declare-fun m!278061 () Bool)

(assert (=> d!62871 m!278061))

(assert (=> d!62871 m!277865))

(declare-fun m!278063 () Bool)

(assert (=> b!262428 m!278063))

(declare-fun m!278065 () Bool)

(assert (=> b!262430 m!278065))

(assert (=> bm!25070 m!277863))

(declare-fun m!278067 () Bool)

(assert (=> bm!25069 m!278067))

(assert (=> b!262273 d!62871))

(declare-fun d!62873 () Bool)

(assert (=> d!62873 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262267 d!62873))

(declare-fun d!62875 () Bool)

(assert (=> d!62875 (contains!1885 (getCurrentListMap!1434 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) key!932)))

(declare-fun lt!132560 () Unit!8124)

(declare-fun choose!1292 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) (_ BitVec 32) Int) Unit!8124)

(assert (=> d!62875 (= lt!132560 (choose!1292 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!62875 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62875 (= (lemmaArrayContainsKeyThenInListMap!260 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132560)))

(declare-fun bs!9217 () Bool)

(assert (= bs!9217 d!62875))

(assert (=> bs!9217 m!277921))

(assert (=> bs!9217 m!277921))

(declare-fun m!278069 () Bool)

(assert (=> bs!9217 m!278069))

(declare-fun m!278071 () Bool)

(assert (=> bs!9217 m!278071))

(assert (=> bs!9217 m!277865))

(assert (=> b!262263 d!62875))

(declare-fun d!62877 () Bool)

(declare-fun res!128160 () Bool)

(declare-fun e!170068 () Bool)

(assert (=> d!62877 (=> res!128160 e!170068)))

(assert (=> d!62877 (= res!128160 (= (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62877 (= (arrayContainsKey!0 (_keys!7023 thiss!1504) key!932 #b00000000000000000000000000000000) e!170068)))

(declare-fun b!262440 () Bool)

(declare-fun e!170069 () Bool)

(assert (=> b!262440 (= e!170068 e!170069)))

(declare-fun res!128161 () Bool)

(assert (=> b!262440 (=> (not res!128161) (not e!170069))))

(assert (=> b!262440 (= res!128161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262441 () Bool)

(assert (=> b!262441 (= e!170069 (arrayContainsKey!0 (_keys!7023 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62877 (not res!128160)) b!262440))

(assert (= (and b!262440 res!128161) b!262441))

(declare-fun m!278073 () Bool)

(assert (=> d!62877 m!278073))

(declare-fun m!278075 () Bool)

(assert (=> b!262441 m!278075))

(assert (=> bm!25051 d!62877))

(declare-fun d!62879 () Bool)

(declare-fun res!128168 () Bool)

(declare-fun e!170072 () Bool)

(assert (=> d!62879 (=> (not res!128168) (not e!170072))))

(declare-fun simpleValid!284 (LongMapFixedSize!3862) Bool)

(assert (=> d!62879 (= res!128168 (simpleValid!284 thiss!1504))))

(assert (=> d!62879 (= (valid!1511 thiss!1504) e!170072)))

(declare-fun b!262448 () Bool)

(declare-fun res!128169 () Bool)

(assert (=> b!262448 (=> (not res!128169) (not e!170072))))

(assert (=> b!262448 (= res!128169 (= (arrayCountValidKeys!0 (_keys!7023 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (_size!1980 thiss!1504)))))

(declare-fun b!262449 () Bool)

(declare-fun res!128170 () Bool)

(assert (=> b!262449 (=> (not res!128170) (not e!170072))))

(assert (=> b!262449 (= res!128170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(declare-fun b!262450 () Bool)

(assert (=> b!262450 (= e!170072 (arrayNoDuplicates!0 (_keys!7023 thiss!1504) #b00000000000000000000000000000000 Nil!3812))))

(assert (= (and d!62879 res!128168) b!262448))

(assert (= (and b!262448 res!128169) b!262449))

(assert (= (and b!262449 res!128170) b!262450))

(declare-fun m!278077 () Bool)

(assert (=> d!62879 m!278077))

(assert (=> b!262448 m!277873))

(declare-fun m!278079 () Bool)

(assert (=> b!262449 m!278079))

(declare-fun m!278081 () Bool)

(assert (=> b!262450 m!278081))

(assert (=> start!25188 d!62879))

(declare-fun b!262459 () Bool)

(declare-fun e!170078 () (_ BitVec 32))

(declare-fun call!25076 () (_ BitVec 32))

(assert (=> b!262459 (= e!170078 (bvadd #b00000000000000000000000000000001 call!25076))))

(declare-fun d!62881 () Bool)

(declare-fun lt!132563 () (_ BitVec 32))

(assert (=> d!62881 (and (bvsge lt!132563 #b00000000000000000000000000000000) (bvsle lt!132563 (bvsub (size!6338 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun e!170077 () (_ BitVec 32))

(assert (=> d!62881 (= lt!132563 e!170077)))

(declare-fun c!44728 () Bool)

(assert (=> d!62881 (= c!44728 (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(assert (=> d!62881 (and (bvsle #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6338 (_keys!7023 thiss!1504)) (size!6338 lt!132454)))))

(assert (=> d!62881 (= (arrayCountValidKeys!0 lt!132454 #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) lt!132563)))

(declare-fun b!262460 () Bool)

(assert (=> b!262460 (= e!170078 call!25076)))

(declare-fun bm!25073 () Bool)

(assert (=> bm!25073 (= call!25076 (arrayCountValidKeys!0 lt!132454 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262461 () Bool)

(assert (=> b!262461 (= e!170077 e!170078)))

(declare-fun c!44727 () Bool)

(assert (=> b!262461 (= c!44727 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun b!262462 () Bool)

(assert (=> b!262462 (= e!170077 #b00000000000000000000000000000000)))

(assert (= (and d!62881 c!44728) b!262462))

(assert (= (and d!62881 (not c!44728)) b!262461))

(assert (= (and b!262461 c!44727) b!262459))

(assert (= (and b!262461 (not c!44727)) b!262460))

(assert (= (or b!262459 b!262460) bm!25073))

(declare-fun m!278083 () Bool)

(assert (=> bm!25073 m!278083))

(declare-fun m!278085 () Bool)

(assert (=> b!262461 m!278085))

(assert (=> b!262461 m!278085))

(declare-fun m!278087 () Bool)

(assert (=> b!262461 m!278087))

(assert (=> b!262275 d!62881))

(declare-fun d!62883 () Bool)

(declare-fun e!170083 () Bool)

(assert (=> d!62883 e!170083))

(declare-fun res!128179 () Bool)

(assert (=> d!62883 (=> (not res!128179) (not e!170083))))

(assert (=> d!62883 (= res!128179 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7023 thiss!1504)))))))

(declare-fun lt!132566 () Unit!8124)

(declare-fun choose!1 (array!12651 (_ BitVec 32) (_ BitVec 64)) Unit!8124)

(assert (=> d!62883 (= lt!132566 (choose!1 (_keys!7023 thiss!1504) index!297 key!932))))

(declare-fun e!170084 () Bool)

(assert (=> d!62883 e!170084))

(declare-fun res!128181 () Bool)

(assert (=> d!62883 (=> (not res!128181) (not e!170084))))

(assert (=> d!62883 (= res!128181 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7023 thiss!1504)))))))

(assert (=> d!62883 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7023 thiss!1504) index!297 key!932) lt!132566)))

(declare-fun b!262474 () Bool)

(assert (=> b!262474 (= e!170083 (= (arrayCountValidKeys!0 (array!12652 (store (arr!5986 (_keys!7023 thiss!1504)) index!297 key!932) (size!6338 (_keys!7023 thiss!1504))) #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7023 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!262472 () Bool)

(declare-fun res!128182 () Bool)

(assert (=> b!262472 (=> (not res!128182) (not e!170084))))

(assert (=> b!262472 (= res!128182 (validKeyInArray!0 key!932))))

(declare-fun b!262473 () Bool)

(assert (=> b!262473 (= e!170084 (bvslt (size!6338 (_keys!7023 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!262471 () Bool)

(declare-fun res!128180 () Bool)

(assert (=> b!262471 (=> (not res!128180) (not e!170084))))

(assert (=> b!262471 (= res!128180 (not (validKeyInArray!0 (select (arr!5986 (_keys!7023 thiss!1504)) index!297))))))

(assert (= (and d!62883 res!128181) b!262471))

(assert (= (and b!262471 res!128180) b!262472))

(assert (= (and b!262472 res!128182) b!262473))

(assert (= (and d!62883 res!128179) b!262474))

(declare-fun m!278089 () Bool)

(assert (=> d!62883 m!278089))

(assert (=> b!262474 m!277895))

(declare-fun m!278091 () Bool)

(assert (=> b!262474 m!278091))

(assert (=> b!262474 m!277873))

(assert (=> b!262472 m!277923))

(declare-fun m!278093 () Bool)

(assert (=> b!262471 m!278093))

(assert (=> b!262471 m!278093))

(declare-fun m!278095 () Bool)

(assert (=> b!262471 m!278095))

(assert (=> b!262275 d!62883))

(declare-fun d!62885 () Bool)

(declare-fun res!128183 () Bool)

(declare-fun e!170085 () Bool)

(assert (=> d!62885 (=> res!128183 e!170085)))

(assert (=> d!62885 (= res!128183 (= (select (arr!5986 lt!132454) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62885 (= (arrayContainsKey!0 lt!132454 key!932 #b00000000000000000000000000000000) e!170085)))

(declare-fun b!262475 () Bool)

(declare-fun e!170086 () Bool)

(assert (=> b!262475 (= e!170085 e!170086)))

(declare-fun res!128184 () Bool)

(assert (=> b!262475 (=> (not res!128184) (not e!170086))))

(assert (=> b!262475 (= res!128184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 lt!132454)))))

(declare-fun b!262476 () Bool)

(assert (=> b!262476 (= e!170086 (arrayContainsKey!0 lt!132454 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62885 (not res!128183)) b!262475))

(assert (= (and b!262475 res!128184) b!262476))

(assert (=> d!62885 m!278085))

(declare-fun m!278097 () Bool)

(assert (=> b!262476 m!278097))

(assert (=> b!262275 d!62885))

(declare-fun b!262477 () Bool)

(declare-fun e!170088 () (_ BitVec 32))

(declare-fun call!25077 () (_ BitVec 32))

(assert (=> b!262477 (= e!170088 (bvadd #b00000000000000000000000000000001 call!25077))))

(declare-fun d!62887 () Bool)

(declare-fun lt!132567 () (_ BitVec 32))

(assert (=> d!62887 (and (bvsge lt!132567 #b00000000000000000000000000000000) (bvsle lt!132567 (bvsub (size!6338 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!170087 () (_ BitVec 32))

(assert (=> d!62887 (= lt!132567 e!170087)))

(declare-fun c!44730 () Bool)

(assert (=> d!62887 (= c!44730 (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(assert (=> d!62887 (and (bvsle #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6338 (_keys!7023 thiss!1504)) (size!6338 (_keys!7023 thiss!1504))))))

(assert (=> d!62887 (= (arrayCountValidKeys!0 (_keys!7023 thiss!1504) #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) lt!132567)))

(declare-fun b!262478 () Bool)

(assert (=> b!262478 (= e!170088 call!25077)))

(declare-fun bm!25074 () Bool)

(assert (=> bm!25074 (= call!25077 (arrayCountValidKeys!0 (_keys!7023 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262479 () Bool)

(assert (=> b!262479 (= e!170087 e!170088)))

(declare-fun c!44729 () Bool)

(assert (=> b!262479 (= c!44729 (validKeyInArray!0 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262480 () Bool)

(assert (=> b!262480 (= e!170087 #b00000000000000000000000000000000)))

(assert (= (and d!62887 c!44730) b!262480))

(assert (= (and d!62887 (not c!44730)) b!262479))

(assert (= (and b!262479 c!44729) b!262477))

(assert (= (and b!262479 (not c!44729)) b!262478))

(assert (= (or b!262477 b!262478) bm!25074))

(declare-fun m!278099 () Bool)

(assert (=> bm!25074 m!278099))

(assert (=> b!262479 m!278073))

(assert (=> b!262479 m!278073))

(declare-fun m!278101 () Bool)

(assert (=> b!262479 m!278101))

(assert (=> b!262275 d!62887))

(declare-fun d!62889 () Bool)

(declare-fun e!170091 () Bool)

(assert (=> d!62889 e!170091))

(declare-fun res!128187 () Bool)

(assert (=> d!62889 (=> (not res!128187) (not e!170091))))

(assert (=> d!62889 (= res!128187 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7023 thiss!1504))) (bvslt index!297 (size!6337 (_values!4817 thiss!1504)))))))

(declare-fun lt!132570 () Unit!8124)

(declare-fun choose!1293 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) (_ BitVec 64) V!8513 Int) Unit!8124)

(assert (=> d!62889 (= lt!132570 (choose!1293 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!62889 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62889 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!123 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)) lt!132570)))

(declare-fun b!262483 () Bool)

(assert (=> b!262483 (= e!170091 (= (+!712 (getCurrentListMap!1434 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) (tuple2!4917 key!932 v!346)) (getCurrentListMap!1434 (array!12652 (store (arr!5986 (_keys!7023 thiss!1504)) index!297 key!932) (size!6338 (_keys!7023 thiss!1504))) (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504))))))

(assert (= (and d!62889 res!128187) b!262483))

(declare-fun m!278103 () Bool)

(assert (=> d!62889 m!278103))

(assert (=> d!62889 m!277865))

(assert (=> b!262483 m!277895))

(assert (=> b!262483 m!277893))

(assert (=> b!262483 m!277921))

(assert (=> b!262483 m!277921))

(declare-fun m!278105 () Bool)

(assert (=> b!262483 m!278105))

(declare-fun m!278107 () Bool)

(assert (=> b!262483 m!278107))

(assert (=> b!262275 d!62889))

(declare-fun d!62891 () Bool)

(assert (=> d!62891 (= (validMask!0 (mask!11192 thiss!1504)) (and (or (= (mask!11192 thiss!1504) #b00000000000000000000000000000111) (= (mask!11192 thiss!1504) #b00000000000000000000000000001111) (= (mask!11192 thiss!1504) #b00000000000000000000000000011111) (= (mask!11192 thiss!1504) #b00000000000000000000000000111111) (= (mask!11192 thiss!1504) #b00000000000000000000000001111111) (= (mask!11192 thiss!1504) #b00000000000000000000000011111111) (= (mask!11192 thiss!1504) #b00000000000000000000000111111111) (= (mask!11192 thiss!1504) #b00000000000000000000001111111111) (= (mask!11192 thiss!1504) #b00000000000000000000011111111111) (= (mask!11192 thiss!1504) #b00000000000000000000111111111111) (= (mask!11192 thiss!1504) #b00000000000000000001111111111111) (= (mask!11192 thiss!1504) #b00000000000000000011111111111111) (= (mask!11192 thiss!1504) #b00000000000000000111111111111111) (= (mask!11192 thiss!1504) #b00000000000000001111111111111111) (= (mask!11192 thiss!1504) #b00000000000000011111111111111111) (= (mask!11192 thiss!1504) #b00000000000000111111111111111111) (= (mask!11192 thiss!1504) #b00000000000001111111111111111111) (= (mask!11192 thiss!1504) #b00000000000011111111111111111111) (= (mask!11192 thiss!1504) #b00000000000111111111111111111111) (= (mask!11192 thiss!1504) #b00000000001111111111111111111111) (= (mask!11192 thiss!1504) #b00000000011111111111111111111111) (= (mask!11192 thiss!1504) #b00000000111111111111111111111111) (= (mask!11192 thiss!1504) #b00000001111111111111111111111111) (= (mask!11192 thiss!1504) #b00000011111111111111111111111111) (= (mask!11192 thiss!1504) #b00000111111111111111111111111111) (= (mask!11192 thiss!1504) #b00001111111111111111111111111111) (= (mask!11192 thiss!1504) #b00011111111111111111111111111111) (= (mask!11192 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11192 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!262275 d!62891))

(declare-fun b!262484 () Bool)

(declare-fun e!170093 () (_ BitVec 32))

(declare-fun call!25078 () (_ BitVec 32))

(assert (=> b!262484 (= e!170093 (bvadd #b00000000000000000000000000000001 call!25078))))

(declare-fun d!62893 () Bool)

(declare-fun lt!132571 () (_ BitVec 32))

(assert (=> d!62893 (and (bvsge lt!132571 #b00000000000000000000000000000000) (bvsle lt!132571 (bvsub (size!6338 lt!132454) index!297)))))

(declare-fun e!170092 () (_ BitVec 32))

(assert (=> d!62893 (= lt!132571 e!170092)))

(declare-fun c!44732 () Bool)

(assert (=> d!62893 (= c!44732 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62893 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6338 lt!132454)))))

(assert (=> d!62893 (= (arrayCountValidKeys!0 lt!132454 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132571)))

(declare-fun b!262485 () Bool)

(assert (=> b!262485 (= e!170093 call!25078)))

(declare-fun bm!25075 () Bool)

(assert (=> bm!25075 (= call!25078 (arrayCountValidKeys!0 lt!132454 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!262486 () Bool)

(assert (=> b!262486 (= e!170092 e!170093)))

(declare-fun c!44731 () Bool)

(assert (=> b!262486 (= c!44731 (validKeyInArray!0 (select (arr!5986 lt!132454) index!297)))))

(declare-fun b!262487 () Bool)

(assert (=> b!262487 (= e!170092 #b00000000000000000000000000000000)))

(assert (= (and d!62893 c!44732) b!262487))

(assert (= (and d!62893 (not c!44732)) b!262486))

(assert (= (and b!262486 c!44731) b!262484))

(assert (= (and b!262486 (not c!44731)) b!262485))

(assert (= (or b!262484 b!262485) bm!25075))

(declare-fun m!278109 () Bool)

(assert (=> bm!25075 m!278109))

(declare-fun m!278111 () Bool)

(assert (=> b!262486 m!278111))

(assert (=> b!262486 m!278111))

(declare-fun m!278113 () Bool)

(assert (=> b!262486 m!278113))

(assert (=> b!262275 d!62893))

(declare-fun b!262498 () Bool)

(declare-fun e!170105 () Bool)

(declare-fun e!170104 () Bool)

(assert (=> b!262498 (= e!170105 e!170104)))

(declare-fun c!44735 () Bool)

(assert (=> b!262498 (= c!44735 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun b!262499 () Bool)

(declare-fun call!25081 () Bool)

(assert (=> b!262499 (= e!170104 call!25081)))

(declare-fun d!62895 () Bool)

(declare-fun res!128196 () Bool)

(declare-fun e!170103 () Bool)

(assert (=> d!62895 (=> res!128196 e!170103)))

(assert (=> d!62895 (= res!128196 (bvsge #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(assert (=> d!62895 (= (arrayNoDuplicates!0 lt!132454 #b00000000000000000000000000000000 Nil!3812) e!170103)))

(declare-fun b!262500 () Bool)

(assert (=> b!262500 (= e!170104 call!25081)))

(declare-fun b!262501 () Bool)

(declare-fun e!170102 () Bool)

(declare-fun contains!1887 (List!3815 (_ BitVec 64)) Bool)

(assert (=> b!262501 (= e!170102 (contains!1887 Nil!3812 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun bm!25078 () Bool)

(assert (=> bm!25078 (= call!25081 (arrayNoDuplicates!0 lt!132454 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44735 (Cons!3811 (select (arr!5986 lt!132454) #b00000000000000000000000000000000) Nil!3812) Nil!3812)))))

(declare-fun b!262502 () Bool)

(assert (=> b!262502 (= e!170103 e!170105)))

(declare-fun res!128194 () Bool)

(assert (=> b!262502 (=> (not res!128194) (not e!170105))))

(assert (=> b!262502 (= res!128194 (not e!170102))))

(declare-fun res!128195 () Bool)

(assert (=> b!262502 (=> (not res!128195) (not e!170102))))

(assert (=> b!262502 (= res!128195 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(assert (= (and d!62895 (not res!128196)) b!262502))

(assert (= (and b!262502 res!128195) b!262501))

(assert (= (and b!262502 res!128194) b!262498))

(assert (= (and b!262498 c!44735) b!262500))

(assert (= (and b!262498 (not c!44735)) b!262499))

(assert (= (or b!262500 b!262499) bm!25078))

(assert (=> b!262498 m!278085))

(assert (=> b!262498 m!278085))

(assert (=> b!262498 m!278087))

(assert (=> b!262501 m!278085))

(assert (=> b!262501 m!278085))

(declare-fun m!278115 () Bool)

(assert (=> b!262501 m!278115))

(assert (=> bm!25078 m!278085))

(declare-fun m!278117 () Bool)

(assert (=> bm!25078 m!278117))

(assert (=> b!262502 m!278085))

(assert (=> b!262502 m!278085))

(assert (=> b!262502 m!278087))

(assert (=> b!262275 d!62895))

(declare-fun b!262511 () Bool)

(declare-fun e!170114 () Bool)

(declare-fun call!25084 () Bool)

(assert (=> b!262511 (= e!170114 call!25084)))

(declare-fun b!262512 () Bool)

(declare-fun e!170113 () Bool)

(assert (=> b!262512 (= e!170113 call!25084)))

(declare-fun b!262513 () Bool)

(assert (=> b!262513 (= e!170113 e!170114)))

(declare-fun lt!132578 () (_ BitVec 64))

(assert (=> b!262513 (= lt!132578 (select (arr!5986 lt!132454) #b00000000000000000000000000000000))))

(declare-fun lt!132579 () Unit!8124)

(assert (=> b!262513 (= lt!132579 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132454 lt!132578 #b00000000000000000000000000000000))))

(assert (=> b!262513 (arrayContainsKey!0 lt!132454 lt!132578 #b00000000000000000000000000000000)))

(declare-fun lt!132580 () Unit!8124)

(assert (=> b!262513 (= lt!132580 lt!132579)))

(declare-fun res!128202 () Bool)

(assert (=> b!262513 (= res!128202 (= (seekEntryOrOpen!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000) lt!132454 (mask!11192 thiss!1504)) (Found!1191 #b00000000000000000000000000000000)))))

(assert (=> b!262513 (=> (not res!128202) (not e!170114))))

(declare-fun b!262514 () Bool)

(declare-fun e!170112 () Bool)

(assert (=> b!262514 (= e!170112 e!170113)))

(declare-fun c!44738 () Bool)

(assert (=> b!262514 (= c!44738 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun d!62897 () Bool)

(declare-fun res!128201 () Bool)

(assert (=> d!62897 (=> res!128201 e!170112)))

(assert (=> d!62897 (= res!128201 (bvsge #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(assert (=> d!62897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132454 (mask!11192 thiss!1504)) e!170112)))

(declare-fun bm!25081 () Bool)

(assert (=> bm!25081 (= call!25084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132454 (mask!11192 thiss!1504)))))

(assert (= (and d!62897 (not res!128201)) b!262514))

(assert (= (and b!262514 c!44738) b!262513))

(assert (= (and b!262514 (not c!44738)) b!262512))

(assert (= (and b!262513 res!128202) b!262511))

(assert (= (or b!262511 b!262512) bm!25081))

(assert (=> b!262513 m!278085))

(declare-fun m!278119 () Bool)

(assert (=> b!262513 m!278119))

(declare-fun m!278121 () Bool)

(assert (=> b!262513 m!278121))

(assert (=> b!262513 m!278085))

(declare-fun m!278123 () Bool)

(assert (=> b!262513 m!278123))

(assert (=> b!262514 m!278085))

(assert (=> b!262514 m!278085))

(assert (=> b!262514 m!278087))

(declare-fun m!278125 () Bool)

(assert (=> bm!25081 m!278125))

(assert (=> b!262275 d!62897))

(declare-fun b!262557 () Bool)

(declare-fun e!170152 () ListLongMap!3819)

(declare-fun call!25104 () ListLongMap!3819)

(assert (=> b!262557 (= e!170152 call!25104)))

(declare-fun b!262558 () Bool)

(declare-fun e!170145 () ListLongMap!3819)

(declare-fun call!25105 () ListLongMap!3819)

(assert (=> b!262558 (= e!170145 (+!712 call!25105 (tuple2!4917 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504))))))

(declare-fun b!262559 () Bool)

(declare-fun e!170146 () Unit!8124)

(declare-fun lt!132628 () Unit!8124)

(assert (=> b!262559 (= e!170146 lt!132628)))

(declare-fun lt!132633 () ListLongMap!3819)

(declare-fun getCurrentListMapNoExtraKeys!577 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) Int) ListLongMap!3819)

(assert (=> b!262559 (= lt!132633 (getCurrentListMapNoExtraKeys!577 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132644 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132646 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132646 (select (arr!5986 lt!132454) #b00000000000000000000000000000000))))

(declare-fun lt!132625 () Unit!8124)

(declare-fun addStillContains!237 (ListLongMap!3819 (_ BitVec 64) V!8513 (_ BitVec 64)) Unit!8124)

(assert (=> b!262559 (= lt!132625 (addStillContains!237 lt!132633 lt!132644 (zeroValue!4675 thiss!1504) lt!132646))))

(assert (=> b!262559 (contains!1885 (+!712 lt!132633 (tuple2!4917 lt!132644 (zeroValue!4675 thiss!1504))) lt!132646)))

(declare-fun lt!132626 () Unit!8124)

(assert (=> b!262559 (= lt!132626 lt!132625)))

(declare-fun lt!132643 () ListLongMap!3819)

(assert (=> b!262559 (= lt!132643 (getCurrentListMapNoExtraKeys!577 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132642 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132642 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132630 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132630 (select (arr!5986 lt!132454) #b00000000000000000000000000000000))))

(declare-fun lt!132640 () Unit!8124)

(declare-fun addApplyDifferent!237 (ListLongMap!3819 (_ BitVec 64) V!8513 (_ BitVec 64)) Unit!8124)

(assert (=> b!262559 (= lt!132640 (addApplyDifferent!237 lt!132643 lt!132642 (minValue!4675 thiss!1504) lt!132630))))

(declare-fun apply!261 (ListLongMap!3819 (_ BitVec 64)) V!8513)

(assert (=> b!262559 (= (apply!261 (+!712 lt!132643 (tuple2!4917 lt!132642 (minValue!4675 thiss!1504))) lt!132630) (apply!261 lt!132643 lt!132630))))

(declare-fun lt!132632 () Unit!8124)

(assert (=> b!262559 (= lt!132632 lt!132640)))

(declare-fun lt!132639 () ListLongMap!3819)

(assert (=> b!262559 (= lt!132639 (getCurrentListMapNoExtraKeys!577 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132634 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132634 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132627 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132627 (select (arr!5986 lt!132454) #b00000000000000000000000000000000))))

(declare-fun lt!132629 () Unit!8124)

(assert (=> b!262559 (= lt!132629 (addApplyDifferent!237 lt!132639 lt!132634 (zeroValue!4675 thiss!1504) lt!132627))))

(assert (=> b!262559 (= (apply!261 (+!712 lt!132639 (tuple2!4917 lt!132634 (zeroValue!4675 thiss!1504))) lt!132627) (apply!261 lt!132639 lt!132627))))

(declare-fun lt!132637 () Unit!8124)

(assert (=> b!262559 (= lt!132637 lt!132629)))

(declare-fun lt!132638 () ListLongMap!3819)

(assert (=> b!262559 (= lt!132638 (getCurrentListMapNoExtraKeys!577 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132631 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132631 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132636 () (_ BitVec 64))

(assert (=> b!262559 (= lt!132636 (select (arr!5986 lt!132454) #b00000000000000000000000000000000))))

(assert (=> b!262559 (= lt!132628 (addApplyDifferent!237 lt!132638 lt!132631 (minValue!4675 thiss!1504) lt!132636))))

(assert (=> b!262559 (= (apply!261 (+!712 lt!132638 (tuple2!4917 lt!132631 (minValue!4675 thiss!1504))) lt!132636) (apply!261 lt!132638 lt!132636))))

(declare-fun d!62899 () Bool)

(declare-fun e!170141 () Bool)

(assert (=> d!62899 e!170141))

(declare-fun res!128225 () Bool)

(assert (=> d!62899 (=> (not res!128225) (not e!170141))))

(assert (=> d!62899 (= res!128225 (or (bvsge #b00000000000000000000000000000000 (size!6338 lt!132454)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132454)))))))

(declare-fun lt!132635 () ListLongMap!3819)

(declare-fun lt!132645 () ListLongMap!3819)

(assert (=> d!62899 (= lt!132635 lt!132645)))

(declare-fun lt!132641 () Unit!8124)

(assert (=> d!62899 (= lt!132641 e!170146)))

(declare-fun c!44755 () Bool)

(declare-fun e!170150 () Bool)

(assert (=> d!62899 (= c!44755 e!170150)))

(declare-fun res!128222 () Bool)

(assert (=> d!62899 (=> (not res!128222) (not e!170150))))

(assert (=> d!62899 (= res!128222 (bvslt #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(assert (=> d!62899 (= lt!132645 e!170145)))

(declare-fun c!44753 () Bool)

(assert (=> d!62899 (= c!44753 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62899 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62899 (= (getCurrentListMap!1434 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132635)))

(declare-fun b!262560 () Bool)

(declare-fun e!170147 () Bool)

(declare-fun e!170144 () Bool)

(assert (=> b!262560 (= e!170147 e!170144)))

(declare-fun res!128228 () Bool)

(assert (=> b!262560 (=> (not res!128228) (not e!170144))))

(assert (=> b!262560 (= res!128228 (contains!1885 lt!132635 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(assert (=> b!262560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(declare-fun b!262561 () Bool)

(declare-fun e!170149 () ListLongMap!3819)

(assert (=> b!262561 (= e!170149 call!25104)))

(declare-fun bm!25096 () Bool)

(declare-fun call!25099 () ListLongMap!3819)

(declare-fun call!25100 () ListLongMap!3819)

(assert (=> bm!25096 (= call!25099 call!25100)))

(declare-fun b!262562 () Bool)

(assert (=> b!262562 (= e!170145 e!170149)))

(declare-fun c!44756 () Bool)

(assert (=> b!262562 (= c!44756 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262563 () Bool)

(declare-fun e!170142 () Bool)

(declare-fun e!170153 () Bool)

(assert (=> b!262563 (= e!170142 e!170153)))

(declare-fun res!128226 () Bool)

(declare-fun call!25101 () Bool)

(assert (=> b!262563 (= res!128226 call!25101)))

(assert (=> b!262563 (=> (not res!128226) (not e!170153))))

(declare-fun b!262564 () Bool)

(assert (=> b!262564 (= e!170142 (not call!25101))))

(declare-fun bm!25097 () Bool)

(assert (=> bm!25097 (= call!25101 (contains!1885 lt!132635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262565 () Bool)

(declare-fun Unit!8133 () Unit!8124)

(assert (=> b!262565 (= e!170146 Unit!8133)))

(declare-fun b!262566 () Bool)

(assert (=> b!262566 (= e!170150 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun bm!25098 () Bool)

(declare-fun call!25102 () ListLongMap!3819)

(assert (=> bm!25098 (= call!25102 call!25099)))

(declare-fun b!262567 () Bool)

(declare-fun e!170148 () Bool)

(assert (=> b!262567 (= e!170148 (validKeyInArray!0 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)))))

(declare-fun b!262568 () Bool)

(declare-fun e!170151 () Bool)

(declare-fun e!170143 () Bool)

(assert (=> b!262568 (= e!170151 e!170143)))

(declare-fun res!128223 () Bool)

(declare-fun call!25103 () Bool)

(assert (=> b!262568 (= res!128223 call!25103)))

(assert (=> b!262568 (=> (not res!128223) (not e!170143))))

(declare-fun b!262569 () Bool)

(assert (=> b!262569 (= e!170151 (not call!25103))))

(declare-fun bm!25099 () Bool)

(assert (=> bm!25099 (= call!25104 call!25105)))

(declare-fun b!262570 () Bool)

(declare-fun res!128221 () Bool)

(assert (=> b!262570 (=> (not res!128221) (not e!170141))))

(assert (=> b!262570 (= res!128221 e!170147)))

(declare-fun res!128224 () Bool)

(assert (=> b!262570 (=> res!128224 e!170147)))

(assert (=> b!262570 (= res!128224 (not e!170148))))

(declare-fun res!128227 () Bool)

(assert (=> b!262570 (=> (not res!128227) (not e!170148))))

(assert (=> b!262570 (= res!128227 (bvslt #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(declare-fun b!262571 () Bool)

(assert (=> b!262571 (= e!170153 (= (apply!261 lt!132635 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4675 thiss!1504)))))

(declare-fun bm!25100 () Bool)

(assert (=> bm!25100 (= call!25100 (getCurrentListMapNoExtraKeys!577 lt!132454 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun b!262572 () Bool)

(declare-fun res!128229 () Bool)

(assert (=> b!262572 (=> (not res!128229) (not e!170141))))

(assert (=> b!262572 (= res!128229 e!170142)))

(declare-fun c!44754 () Bool)

(assert (=> b!262572 (= c!44754 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!25101 () Bool)

(assert (=> bm!25101 (= call!25103 (contains!1885 lt!132635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262573 () Bool)

(assert (=> b!262573 (= e!170141 e!170151)))

(declare-fun c!44752 () Bool)

(assert (=> b!262573 (= c!44752 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262574 () Bool)

(declare-fun get!3084 (ValueCell!2981 V!8513) V!8513)

(declare-fun dynLambda!595 (Int (_ BitVec 64)) V!8513)

(assert (=> b!262574 (= e!170144 (= (apply!261 lt!132635 (select (arr!5986 lt!132454) #b00000000000000000000000000000000)) (get!3084 (select (arr!5985 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4834 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6337 (array!12650 (store (arr!5985 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6337 (_values!4817 thiss!1504))))))))

(assert (=> b!262574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 lt!132454)))))

(declare-fun bm!25102 () Bool)

(assert (=> bm!25102 (= call!25105 (+!712 (ite c!44753 call!25100 (ite c!44756 call!25099 call!25102)) (ite (or c!44753 c!44756) (tuple2!4917 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4675 thiss!1504)) (tuple2!4917 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504)))))))

(declare-fun b!262575 () Bool)

(assert (=> b!262575 (= e!170143 (= (apply!261 lt!132635 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4675 thiss!1504)))))

(declare-fun b!262576 () Bool)

(assert (=> b!262576 (= e!170152 call!25102)))

(declare-fun b!262577 () Bool)

(declare-fun c!44751 () Bool)

(assert (=> b!262577 (= c!44751 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262577 (= e!170149 e!170152)))

(assert (= (and d!62899 c!44753) b!262558))

(assert (= (and d!62899 (not c!44753)) b!262562))

(assert (= (and b!262562 c!44756) b!262561))

(assert (= (and b!262562 (not c!44756)) b!262577))

(assert (= (and b!262577 c!44751) b!262557))

(assert (= (and b!262577 (not c!44751)) b!262576))

(assert (= (or b!262557 b!262576) bm!25098))

(assert (= (or b!262561 bm!25098) bm!25096))

(assert (= (or b!262561 b!262557) bm!25099))

(assert (= (or b!262558 bm!25096) bm!25100))

(assert (= (or b!262558 bm!25099) bm!25102))

(assert (= (and d!62899 res!128222) b!262566))

(assert (= (and d!62899 c!44755) b!262559))

(assert (= (and d!62899 (not c!44755)) b!262565))

(assert (= (and d!62899 res!128225) b!262570))

(assert (= (and b!262570 res!128227) b!262567))

(assert (= (and b!262570 (not res!128224)) b!262560))

(assert (= (and b!262560 res!128228) b!262574))

(assert (= (and b!262570 res!128221) b!262572))

(assert (= (and b!262572 c!44754) b!262563))

(assert (= (and b!262572 (not c!44754)) b!262564))

(assert (= (and b!262563 res!128226) b!262571))

(assert (= (or b!262563 b!262564) bm!25097))

(assert (= (and b!262572 res!128229) b!262573))

(assert (= (and b!262573 c!44752) b!262568))

(assert (= (and b!262573 (not c!44752)) b!262569))

(assert (= (and b!262568 res!128223) b!262575))

(assert (= (or b!262568 b!262569) bm!25101))

(declare-fun b_lambda!8305 () Bool)

(assert (=> (not b_lambda!8305) (not b!262574)))

(declare-fun t!8884 () Bool)

(declare-fun tb!3027 () Bool)

(assert (=> (and b!262264 (= (defaultEntry!4834 thiss!1504) (defaultEntry!4834 thiss!1504)) t!8884) tb!3027))

(declare-fun result!5419 () Bool)

(assert (=> tb!3027 (= result!5419 tp_is_empty!6649)))

(assert (=> b!262574 t!8884))

(declare-fun b_and!13905 () Bool)

(assert (= b_and!13899 (and (=> t!8884 result!5419) b_and!13905)))

(assert (=> b!262567 m!278085))

(assert (=> b!262567 m!278085))

(assert (=> b!262567 m!278087))

(assert (=> b!262560 m!278085))

(assert (=> b!262560 m!278085))

(declare-fun m!278127 () Bool)

(assert (=> b!262560 m!278127))

(assert (=> d!62899 m!277865))

(declare-fun m!278129 () Bool)

(assert (=> bm!25101 m!278129))

(assert (=> b!262566 m!278085))

(assert (=> b!262566 m!278085))

(assert (=> b!262566 m!278087))

(declare-fun m!278131 () Bool)

(assert (=> b!262574 m!278131))

(declare-fun m!278133 () Bool)

(assert (=> b!262574 m!278133))

(declare-fun m!278135 () Bool)

(assert (=> b!262574 m!278135))

(assert (=> b!262574 m!278133))

(assert (=> b!262574 m!278085))

(declare-fun m!278137 () Bool)

(assert (=> b!262574 m!278137))

(assert (=> b!262574 m!278131))

(assert (=> b!262574 m!278085))

(declare-fun m!278139 () Bool)

(assert (=> b!262558 m!278139))

(declare-fun m!278141 () Bool)

(assert (=> bm!25100 m!278141))

(declare-fun m!278143 () Bool)

(assert (=> b!262575 m!278143))

(declare-fun m!278145 () Bool)

(assert (=> bm!25097 m!278145))

(declare-fun m!278147 () Bool)

(assert (=> bm!25102 m!278147))

(declare-fun m!278149 () Bool)

(assert (=> b!262571 m!278149))

(declare-fun m!278151 () Bool)

(assert (=> b!262559 m!278151))

(declare-fun m!278153 () Bool)

(assert (=> b!262559 m!278153))

(declare-fun m!278155 () Bool)

(assert (=> b!262559 m!278155))

(declare-fun m!278157 () Bool)

(assert (=> b!262559 m!278157))

(declare-fun m!278159 () Bool)

(assert (=> b!262559 m!278159))

(assert (=> b!262559 m!278085))

(declare-fun m!278161 () Bool)

(assert (=> b!262559 m!278161))

(declare-fun m!278163 () Bool)

(assert (=> b!262559 m!278163))

(declare-fun m!278165 () Bool)

(assert (=> b!262559 m!278165))

(declare-fun m!278167 () Bool)

(assert (=> b!262559 m!278167))

(assert (=> b!262559 m!278159))

(declare-fun m!278169 () Bool)

(assert (=> b!262559 m!278169))

(assert (=> b!262559 m!278141))

(assert (=> b!262559 m!278155))

(declare-fun m!278171 () Bool)

(assert (=> b!262559 m!278171))

(declare-fun m!278173 () Bool)

(assert (=> b!262559 m!278173))

(declare-fun m!278175 () Bool)

(assert (=> b!262559 m!278175))

(assert (=> b!262559 m!278151))

(declare-fun m!278177 () Bool)

(assert (=> b!262559 m!278177))

(declare-fun m!278179 () Bool)

(assert (=> b!262559 m!278179))

(assert (=> b!262559 m!278165))

(assert (=> b!262275 d!62899))

(declare-fun d!62901 () Bool)

(declare-fun e!170156 () Bool)

(assert (=> d!62901 e!170156))

(declare-fun res!128232 () Bool)

(assert (=> d!62901 (=> (not res!128232) (not e!170156))))

(assert (=> d!62901 (= res!128232 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7023 thiss!1504)))))))

(declare-fun lt!132649 () Unit!8124)

(declare-fun choose!41 (array!12651 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3815) Unit!8124)

(assert (=> d!62901 (= lt!132649 (choose!41 (_keys!7023 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3812))))

(assert (=> d!62901 (bvslt (size!6338 (_keys!7023 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62901 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7023 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3812) lt!132649)))

(declare-fun b!262582 () Bool)

(assert (=> b!262582 (= e!170156 (arrayNoDuplicates!0 (array!12652 (store (arr!5986 (_keys!7023 thiss!1504)) index!297 key!932) (size!6338 (_keys!7023 thiss!1504))) #b00000000000000000000000000000000 Nil!3812))))

(assert (= (and d!62901 res!128232) b!262582))

(declare-fun m!278181 () Bool)

(assert (=> d!62901 m!278181))

(assert (=> b!262582 m!277895))

(declare-fun m!278183 () Bool)

(assert (=> b!262582 m!278183))

(assert (=> b!262275 d!62901))

(declare-fun d!62903 () Bool)

(assert (=> d!62903 (= (arrayCountValidKeys!0 lt!132454 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132652 () Unit!8124)

(declare-fun choose!2 (array!12651 (_ BitVec 32)) Unit!8124)

(assert (=> d!62903 (= lt!132652 (choose!2 lt!132454 index!297))))

(declare-fun e!170159 () Bool)

(assert (=> d!62903 e!170159))

(declare-fun res!128237 () Bool)

(assert (=> d!62903 (=> (not res!128237) (not e!170159))))

(assert (=> d!62903 (= res!128237 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 lt!132454))))))

(assert (=> d!62903 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132454 index!297) lt!132652)))

(declare-fun b!262587 () Bool)

(declare-fun res!128238 () Bool)

(assert (=> b!262587 (=> (not res!128238) (not e!170159))))

(assert (=> b!262587 (= res!128238 (validKeyInArray!0 (select (arr!5986 lt!132454) index!297)))))

(declare-fun b!262588 () Bool)

(assert (=> b!262588 (= e!170159 (bvslt (size!6338 lt!132454) #b01111111111111111111111111111111))))

(assert (= (and d!62903 res!128237) b!262587))

(assert (= (and b!262587 res!128238) b!262588))

(declare-fun m!278185 () Bool)

(assert (=> d!62903 m!278185))

(declare-fun m!278187 () Bool)

(assert (=> d!62903 m!278187))

(assert (=> b!262587 m!278111))

(assert (=> b!262587 m!278111))

(assert (=> b!262587 m!278113))

(assert (=> b!262275 d!62903))

(declare-fun d!62905 () Bool)

(assert (=> d!62905 (arrayContainsKey!0 lt!132454 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132655 () Unit!8124)

(declare-fun choose!13 (array!12651 (_ BitVec 64) (_ BitVec 32)) Unit!8124)

(assert (=> d!62905 (= lt!132655 (choose!13 lt!132454 key!932 index!297))))

(assert (=> d!62905 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62905 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132454 key!932 index!297) lt!132655)))

(declare-fun bs!9218 () Bool)

(assert (= bs!9218 d!62905))

(assert (=> bs!9218 m!277871))

(declare-fun m!278189 () Bool)

(assert (=> bs!9218 m!278189))

(assert (=> b!262275 d!62905))

(declare-fun d!62907 () Bool)

(declare-fun e!170162 () Bool)

(assert (=> d!62907 e!170162))

(declare-fun res!128243 () Bool)

(assert (=> d!62907 (=> (not res!128243) (not e!170162))))

(declare-fun lt!132666 () ListLongMap!3819)

(assert (=> d!62907 (= res!128243 (contains!1885 lt!132666 (_1!2469 (tuple2!4917 key!932 v!346))))))

(declare-fun lt!132667 () List!3814)

(assert (=> d!62907 (= lt!132666 (ListLongMap!3820 lt!132667))))

(declare-fun lt!132665 () Unit!8124)

(declare-fun lt!132664 () Unit!8124)

(assert (=> d!62907 (= lt!132665 lt!132664)))

(declare-datatypes ((Option!323 0))(
  ( (Some!322 (v!5496 V!8513)) (None!321) )
))
(declare-fun getValueByKey!317 (List!3814 (_ BitVec 64)) Option!323)

(assert (=> d!62907 (= (getValueByKey!317 lt!132667 (_1!2469 (tuple2!4917 key!932 v!346))) (Some!322 (_2!2469 (tuple2!4917 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!176 (List!3814 (_ BitVec 64) V!8513) Unit!8124)

(assert (=> d!62907 (= lt!132664 (lemmaContainsTupThenGetReturnValue!176 lt!132667 (_1!2469 (tuple2!4917 key!932 v!346)) (_2!2469 (tuple2!4917 key!932 v!346))))))

(declare-fun insertStrictlySorted!179 (List!3814 (_ BitVec 64) V!8513) List!3814)

(assert (=> d!62907 (= lt!132667 (insertStrictlySorted!179 (toList!1925 lt!132464) (_1!2469 (tuple2!4917 key!932 v!346)) (_2!2469 (tuple2!4917 key!932 v!346))))))

(assert (=> d!62907 (= (+!712 lt!132464 (tuple2!4917 key!932 v!346)) lt!132666)))

(declare-fun b!262593 () Bool)

(declare-fun res!128244 () Bool)

(assert (=> b!262593 (=> (not res!128244) (not e!170162))))

(assert (=> b!262593 (= res!128244 (= (getValueByKey!317 (toList!1925 lt!132666) (_1!2469 (tuple2!4917 key!932 v!346))) (Some!322 (_2!2469 (tuple2!4917 key!932 v!346)))))))

(declare-fun b!262594 () Bool)

(declare-fun contains!1888 (List!3814 tuple2!4916) Bool)

(assert (=> b!262594 (= e!170162 (contains!1888 (toList!1925 lt!132666) (tuple2!4917 key!932 v!346)))))

(assert (= (and d!62907 res!128243) b!262593))

(assert (= (and b!262593 res!128244) b!262594))

(declare-fun m!278191 () Bool)

(assert (=> d!62907 m!278191))

(declare-fun m!278193 () Bool)

(assert (=> d!62907 m!278193))

(declare-fun m!278195 () Bool)

(assert (=> d!62907 m!278195))

(declare-fun m!278197 () Bool)

(assert (=> d!62907 m!278197))

(declare-fun m!278199 () Bool)

(assert (=> b!262593 m!278199))

(declare-fun m!278201 () Bool)

(assert (=> b!262594 m!278201))

(assert (=> b!262275 d!62907))

(assert (=> b!262275 d!62877))

(declare-fun d!62909 () Bool)

(declare-fun e!170165 () Bool)

(assert (=> d!62909 e!170165))

(declare-fun res!128247 () Bool)

(assert (=> d!62909 (=> (not res!128247) (not e!170165))))

(assert (=> d!62909 (= res!128247 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6338 (_keys!7023 thiss!1504)))))))

(declare-fun lt!132670 () Unit!8124)

(declare-fun choose!102 ((_ BitVec 64) array!12651 (_ BitVec 32) (_ BitVec 32)) Unit!8124)

(assert (=> d!62909 (= lt!132670 (choose!102 key!932 (_keys!7023 thiss!1504) index!297 (mask!11192 thiss!1504)))))

(assert (=> d!62909 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62909 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) index!297 (mask!11192 thiss!1504)) lt!132670)))

(declare-fun b!262597 () Bool)

(assert (=> b!262597 (= e!170165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12652 (store (arr!5986 (_keys!7023 thiss!1504)) index!297 key!932) (size!6338 (_keys!7023 thiss!1504))) (mask!11192 thiss!1504)))))

(assert (= (and d!62909 res!128247) b!262597))

(declare-fun m!278203 () Bool)

(assert (=> d!62909 m!278203))

(assert (=> d!62909 m!277865))

(assert (=> b!262597 m!277895))

(declare-fun m!278205 () Bool)

(assert (=> b!262597 m!278205))

(assert (=> b!262275 d!62909))

(declare-fun d!62911 () Bool)

(assert (=> d!62911 (= (inRange!0 index!297 (mask!11192 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11192 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262261 d!62911))

(declare-fun d!62913 () Bool)

(declare-fun e!170170 () Bool)

(assert (=> d!62913 e!170170))

(declare-fun res!128250 () Bool)

(assert (=> d!62913 (=> res!128250 e!170170)))

(declare-fun lt!132682 () Bool)

(assert (=> d!62913 (= res!128250 (not lt!132682))))

(declare-fun lt!132680 () Bool)

(assert (=> d!62913 (= lt!132682 lt!132680)))

(declare-fun lt!132679 () Unit!8124)

(declare-fun e!170171 () Unit!8124)

(assert (=> d!62913 (= lt!132679 e!170171)))

(declare-fun c!44759 () Bool)

(assert (=> d!62913 (= c!44759 lt!132680)))

(declare-fun containsKey!309 (List!3814 (_ BitVec 64)) Bool)

(assert (=> d!62913 (= lt!132680 (containsKey!309 (toList!1925 lt!132464) key!932))))

(assert (=> d!62913 (= (contains!1885 lt!132464 key!932) lt!132682)))

(declare-fun b!262604 () Bool)

(declare-fun lt!132681 () Unit!8124)

(assert (=> b!262604 (= e!170171 lt!132681)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!258 (List!3814 (_ BitVec 64)) Unit!8124)

(assert (=> b!262604 (= lt!132681 (lemmaContainsKeyImpliesGetValueByKeyDefined!258 (toList!1925 lt!132464) key!932))))

(declare-fun isDefined!259 (Option!323) Bool)

(assert (=> b!262604 (isDefined!259 (getValueByKey!317 (toList!1925 lt!132464) key!932))))

(declare-fun b!262605 () Bool)

(declare-fun Unit!8134 () Unit!8124)

(assert (=> b!262605 (= e!170171 Unit!8134)))

(declare-fun b!262606 () Bool)

(assert (=> b!262606 (= e!170170 (isDefined!259 (getValueByKey!317 (toList!1925 lt!132464) key!932)))))

(assert (= (and d!62913 c!44759) b!262604))

(assert (= (and d!62913 (not c!44759)) b!262605))

(assert (= (and d!62913 (not res!128250)) b!262606))

(declare-fun m!278207 () Bool)

(assert (=> d!62913 m!278207))

(declare-fun m!278209 () Bool)

(assert (=> b!262604 m!278209))

(declare-fun m!278211 () Bool)

(assert (=> b!262604 m!278211))

(assert (=> b!262604 m!278211))

(declare-fun m!278213 () Bool)

(assert (=> b!262604 m!278213))

(assert (=> b!262606 m!278211))

(assert (=> b!262606 m!278211))

(assert (=> b!262606 m!278213))

(assert (=> b!262261 d!62913))

(declare-fun b!262607 () Bool)

(declare-fun e!170183 () ListLongMap!3819)

(declare-fun call!25111 () ListLongMap!3819)

(assert (=> b!262607 (= e!170183 call!25111)))

(declare-fun b!262608 () Bool)

(declare-fun e!170176 () ListLongMap!3819)

(declare-fun call!25112 () ListLongMap!3819)

(assert (=> b!262608 (= e!170176 (+!712 call!25112 (tuple2!4917 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504))))))

(declare-fun b!262609 () Bool)

(declare-fun e!170177 () Unit!8124)

(declare-fun lt!132686 () Unit!8124)

(assert (=> b!262609 (= e!170177 lt!132686)))

(declare-fun lt!132691 () ListLongMap!3819)

(assert (=> b!262609 (= lt!132691 (getCurrentListMapNoExtraKeys!577 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132702 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132704 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132704 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132683 () Unit!8124)

(assert (=> b!262609 (= lt!132683 (addStillContains!237 lt!132691 lt!132702 (zeroValue!4675 thiss!1504) lt!132704))))

(assert (=> b!262609 (contains!1885 (+!712 lt!132691 (tuple2!4917 lt!132702 (zeroValue!4675 thiss!1504))) lt!132704)))

(declare-fun lt!132684 () Unit!8124)

(assert (=> b!262609 (= lt!132684 lt!132683)))

(declare-fun lt!132701 () ListLongMap!3819)

(assert (=> b!262609 (= lt!132701 (getCurrentListMapNoExtraKeys!577 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132700 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132700 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132688 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132688 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132698 () Unit!8124)

(assert (=> b!262609 (= lt!132698 (addApplyDifferent!237 lt!132701 lt!132700 (minValue!4675 thiss!1504) lt!132688))))

(assert (=> b!262609 (= (apply!261 (+!712 lt!132701 (tuple2!4917 lt!132700 (minValue!4675 thiss!1504))) lt!132688) (apply!261 lt!132701 lt!132688))))

(declare-fun lt!132690 () Unit!8124)

(assert (=> b!262609 (= lt!132690 lt!132698)))

(declare-fun lt!132697 () ListLongMap!3819)

(assert (=> b!262609 (= lt!132697 (getCurrentListMapNoExtraKeys!577 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132692 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132685 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132685 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132687 () Unit!8124)

(assert (=> b!262609 (= lt!132687 (addApplyDifferent!237 lt!132697 lt!132692 (zeroValue!4675 thiss!1504) lt!132685))))

(assert (=> b!262609 (= (apply!261 (+!712 lt!132697 (tuple2!4917 lt!132692 (zeroValue!4675 thiss!1504))) lt!132685) (apply!261 lt!132697 lt!132685))))

(declare-fun lt!132695 () Unit!8124)

(assert (=> b!262609 (= lt!132695 lt!132687)))

(declare-fun lt!132696 () ListLongMap!3819)

(assert (=> b!262609 (= lt!132696 (getCurrentListMapNoExtraKeys!577 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132689 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132694 () (_ BitVec 64))

(assert (=> b!262609 (= lt!132694 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262609 (= lt!132686 (addApplyDifferent!237 lt!132696 lt!132689 (minValue!4675 thiss!1504) lt!132694))))

(assert (=> b!262609 (= (apply!261 (+!712 lt!132696 (tuple2!4917 lt!132689 (minValue!4675 thiss!1504))) lt!132694) (apply!261 lt!132696 lt!132694))))

(declare-fun d!62915 () Bool)

(declare-fun e!170172 () Bool)

(assert (=> d!62915 e!170172))

(declare-fun res!128255 () Bool)

(assert (=> d!62915 (=> (not res!128255) (not e!170172))))

(assert (=> d!62915 (= res!128255 (or (bvsge #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))))

(declare-fun lt!132693 () ListLongMap!3819)

(declare-fun lt!132703 () ListLongMap!3819)

(assert (=> d!62915 (= lt!132693 lt!132703)))

(declare-fun lt!132699 () Unit!8124)

(assert (=> d!62915 (= lt!132699 e!170177)))

(declare-fun c!44764 () Bool)

(declare-fun e!170181 () Bool)

(assert (=> d!62915 (= c!44764 e!170181)))

(declare-fun res!128252 () Bool)

(assert (=> d!62915 (=> (not res!128252) (not e!170181))))

(assert (=> d!62915 (= res!128252 (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(assert (=> d!62915 (= lt!132703 e!170176)))

(declare-fun c!44762 () Bool)

(assert (=> d!62915 (= c!44762 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62915 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62915 (= (getCurrentListMap!1434 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132693)))

(declare-fun b!262610 () Bool)

(declare-fun e!170178 () Bool)

(declare-fun e!170175 () Bool)

(assert (=> b!262610 (= e!170178 e!170175)))

(declare-fun res!128258 () Bool)

(assert (=> b!262610 (=> (not res!128258) (not e!170175))))

(assert (=> b!262610 (= res!128258 (contains!1885 lt!132693 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262611 () Bool)

(declare-fun e!170180 () ListLongMap!3819)

(assert (=> b!262611 (= e!170180 call!25111)))

(declare-fun bm!25103 () Bool)

(declare-fun call!25106 () ListLongMap!3819)

(declare-fun call!25107 () ListLongMap!3819)

(assert (=> bm!25103 (= call!25106 call!25107)))

(declare-fun b!262612 () Bool)

(assert (=> b!262612 (= e!170176 e!170180)))

(declare-fun c!44765 () Bool)

(assert (=> b!262612 (= c!44765 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262613 () Bool)

(declare-fun e!170173 () Bool)

(declare-fun e!170184 () Bool)

(assert (=> b!262613 (= e!170173 e!170184)))

(declare-fun res!128256 () Bool)

(declare-fun call!25108 () Bool)

(assert (=> b!262613 (= res!128256 call!25108)))

(assert (=> b!262613 (=> (not res!128256) (not e!170184))))

(declare-fun b!262614 () Bool)

(assert (=> b!262614 (= e!170173 (not call!25108))))

(declare-fun bm!25104 () Bool)

(assert (=> bm!25104 (= call!25108 (contains!1885 lt!132693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262615 () Bool)

(declare-fun Unit!8135 () Unit!8124)

(assert (=> b!262615 (= e!170177 Unit!8135)))

(declare-fun b!262616 () Bool)

(assert (=> b!262616 (= e!170181 (validKeyInArray!0 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25105 () Bool)

(declare-fun call!25109 () ListLongMap!3819)

(assert (=> bm!25105 (= call!25109 call!25106)))

(declare-fun b!262617 () Bool)

(declare-fun e!170179 () Bool)

(assert (=> b!262617 (= e!170179 (validKeyInArray!0 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262618 () Bool)

(declare-fun e!170182 () Bool)

(declare-fun e!170174 () Bool)

(assert (=> b!262618 (= e!170182 e!170174)))

(declare-fun res!128253 () Bool)

(declare-fun call!25110 () Bool)

(assert (=> b!262618 (= res!128253 call!25110)))

(assert (=> b!262618 (=> (not res!128253) (not e!170174))))

(declare-fun b!262619 () Bool)

(assert (=> b!262619 (= e!170182 (not call!25110))))

(declare-fun bm!25106 () Bool)

(assert (=> bm!25106 (= call!25111 call!25112)))

(declare-fun b!262620 () Bool)

(declare-fun res!128251 () Bool)

(assert (=> b!262620 (=> (not res!128251) (not e!170172))))

(assert (=> b!262620 (= res!128251 e!170178)))

(declare-fun res!128254 () Bool)

(assert (=> b!262620 (=> res!128254 e!170178)))

(assert (=> b!262620 (= res!128254 (not e!170179))))

(declare-fun res!128257 () Bool)

(assert (=> b!262620 (=> (not res!128257) (not e!170179))))

(assert (=> b!262620 (= res!128257 (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun b!262621 () Bool)

(assert (=> b!262621 (= e!170184 (= (apply!261 lt!132693 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4675 thiss!1504)))))

(declare-fun bm!25107 () Bool)

(assert (=> bm!25107 (= call!25107 (getCurrentListMapNoExtraKeys!577 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun b!262622 () Bool)

(declare-fun res!128259 () Bool)

(assert (=> b!262622 (=> (not res!128259) (not e!170172))))

(assert (=> b!262622 (= res!128259 e!170173)))

(declare-fun c!44763 () Bool)

(assert (=> b!262622 (= c!44763 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!25108 () Bool)

(assert (=> bm!25108 (= call!25110 (contains!1885 lt!132693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262623 () Bool)

(assert (=> b!262623 (= e!170172 e!170182)))

(declare-fun c!44761 () Bool)

(assert (=> b!262623 (= c!44761 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262624 () Bool)

(assert (=> b!262624 (= e!170175 (= (apply!261 lt!132693 (select (arr!5986 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000)) (get!3084 (select (arr!5985 (_values!4817 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4834 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6337 (_values!4817 thiss!1504))))))

(assert (=> b!262624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6338 (_keys!7023 thiss!1504))))))

(declare-fun bm!25109 () Bool)

(assert (=> bm!25109 (= call!25112 (+!712 (ite c!44762 call!25107 (ite c!44765 call!25106 call!25109)) (ite (or c!44762 c!44765) (tuple2!4917 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4675 thiss!1504)) (tuple2!4917 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504)))))))

(declare-fun b!262625 () Bool)

(assert (=> b!262625 (= e!170174 (= (apply!261 lt!132693 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4675 thiss!1504)))))

(declare-fun b!262626 () Bool)

(assert (=> b!262626 (= e!170183 call!25109)))

(declare-fun b!262627 () Bool)

(declare-fun c!44760 () Bool)

(assert (=> b!262627 (= c!44760 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262627 (= e!170180 e!170183)))

(assert (= (and d!62915 c!44762) b!262608))

(assert (= (and d!62915 (not c!44762)) b!262612))

(assert (= (and b!262612 c!44765) b!262611))

(assert (= (and b!262612 (not c!44765)) b!262627))

(assert (= (and b!262627 c!44760) b!262607))

(assert (= (and b!262627 (not c!44760)) b!262626))

(assert (= (or b!262607 b!262626) bm!25105))

(assert (= (or b!262611 bm!25105) bm!25103))

(assert (= (or b!262611 b!262607) bm!25106))

(assert (= (or b!262608 bm!25103) bm!25107))

(assert (= (or b!262608 bm!25106) bm!25109))

(assert (= (and d!62915 res!128252) b!262616))

(assert (= (and d!62915 c!44764) b!262609))

(assert (= (and d!62915 (not c!44764)) b!262615))

(assert (= (and d!62915 res!128255) b!262620))

(assert (= (and b!262620 res!128257) b!262617))

(assert (= (and b!262620 (not res!128254)) b!262610))

(assert (= (and b!262610 res!128258) b!262624))

(assert (= (and b!262620 res!128251) b!262622))

(assert (= (and b!262622 c!44763) b!262613))

(assert (= (and b!262622 (not c!44763)) b!262614))

(assert (= (and b!262613 res!128256) b!262621))

(assert (= (or b!262613 b!262614) bm!25104))

(assert (= (and b!262622 res!128259) b!262623))

(assert (= (and b!262623 c!44761) b!262618))

(assert (= (and b!262623 (not c!44761)) b!262619))

(assert (= (and b!262618 res!128253) b!262625))

(assert (= (or b!262618 b!262619) bm!25108))

(declare-fun b_lambda!8307 () Bool)

(assert (=> (not b_lambda!8307) (not b!262624)))

(assert (=> b!262624 t!8884))

(declare-fun b_and!13907 () Bool)

(assert (= b_and!13905 (and (=> t!8884 result!5419) b_and!13907)))

(assert (=> b!262617 m!278073))

(assert (=> b!262617 m!278073))

(assert (=> b!262617 m!278101))

(assert (=> b!262610 m!278073))

(assert (=> b!262610 m!278073))

(declare-fun m!278215 () Bool)

(assert (=> b!262610 m!278215))

(assert (=> d!62915 m!277865))

(declare-fun m!278217 () Bool)

(assert (=> bm!25108 m!278217))

(assert (=> b!262616 m!278073))

(assert (=> b!262616 m!278073))

(assert (=> b!262616 m!278101))

(declare-fun m!278219 () Bool)

(assert (=> b!262624 m!278219))

(assert (=> b!262624 m!278133))

(declare-fun m!278221 () Bool)

(assert (=> b!262624 m!278221))

(assert (=> b!262624 m!278133))

(assert (=> b!262624 m!278073))

(declare-fun m!278223 () Bool)

(assert (=> b!262624 m!278223))

(assert (=> b!262624 m!278219))

(assert (=> b!262624 m!278073))

(declare-fun m!278225 () Bool)

(assert (=> b!262608 m!278225))

(declare-fun m!278227 () Bool)

(assert (=> bm!25107 m!278227))

(declare-fun m!278229 () Bool)

(assert (=> b!262625 m!278229))

(declare-fun m!278231 () Bool)

(assert (=> bm!25104 m!278231))

(declare-fun m!278233 () Bool)

(assert (=> bm!25109 m!278233))

(declare-fun m!278235 () Bool)

(assert (=> b!262621 m!278235))

(declare-fun m!278237 () Bool)

(assert (=> b!262609 m!278237))

(declare-fun m!278239 () Bool)

(assert (=> b!262609 m!278239))

(declare-fun m!278241 () Bool)

(assert (=> b!262609 m!278241))

(declare-fun m!278243 () Bool)

(assert (=> b!262609 m!278243))

(declare-fun m!278245 () Bool)

(assert (=> b!262609 m!278245))

(assert (=> b!262609 m!278073))

(declare-fun m!278247 () Bool)

(assert (=> b!262609 m!278247))

(declare-fun m!278249 () Bool)

(assert (=> b!262609 m!278249))

(declare-fun m!278251 () Bool)

(assert (=> b!262609 m!278251))

(declare-fun m!278253 () Bool)

(assert (=> b!262609 m!278253))

(assert (=> b!262609 m!278245))

(declare-fun m!278255 () Bool)

(assert (=> b!262609 m!278255))

(assert (=> b!262609 m!278227))

(assert (=> b!262609 m!278241))

(declare-fun m!278257 () Bool)

(assert (=> b!262609 m!278257))

(declare-fun m!278259 () Bool)

(assert (=> b!262609 m!278259))

(declare-fun m!278261 () Bool)

(assert (=> b!262609 m!278261))

(assert (=> b!262609 m!278237))

(declare-fun m!278263 () Bool)

(assert (=> b!262609 m!278263))

(declare-fun m!278265 () Bool)

(assert (=> b!262609 m!278265))

(assert (=> b!262609 m!278251))

(assert (=> b!262261 d!62915))

(declare-fun d!62917 () Bool)

(assert (=> d!62917 (= (inRange!0 (ite c!44692 (index!6934 lt!132466) (index!6937 lt!132466)) (mask!11192 thiss!1504)) (and (bvsge (ite c!44692 (index!6934 lt!132466) (index!6937 lt!132466)) #b00000000000000000000000000000000) (bvslt (ite c!44692 (index!6934 lt!132466) (index!6937 lt!132466)) (bvadd (mask!11192 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25052 d!62917))

(declare-fun b!262641 () Bool)

(declare-fun e!170193 () SeekEntryResult!1191)

(declare-fun lt!132711 () SeekEntryResult!1191)

(assert (=> b!262641 (= e!170193 (MissingZero!1191 (index!6936 lt!132711)))))

(declare-fun b!262642 () Bool)

(declare-fun e!170192 () SeekEntryResult!1191)

(assert (=> b!262642 (= e!170192 Undefined!1191)))

(declare-fun b!262643 () Bool)

(declare-fun e!170191 () SeekEntryResult!1191)

(assert (=> b!262643 (= e!170191 (Found!1191 (index!6936 lt!132711)))))

(declare-fun b!262644 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12651 (_ BitVec 32)) SeekEntryResult!1191)

(assert (=> b!262644 (= e!170193 (seekKeyOrZeroReturnVacant!0 (x!25214 lt!132711) (index!6936 lt!132711) (index!6936 lt!132711) key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(declare-fun b!262645 () Bool)

(assert (=> b!262645 (= e!170192 e!170191)))

(declare-fun lt!132713 () (_ BitVec 64))

(assert (=> b!262645 (= lt!132713 (select (arr!5986 (_keys!7023 thiss!1504)) (index!6936 lt!132711)))))

(declare-fun c!44772 () Bool)

(assert (=> b!262645 (= c!44772 (= lt!132713 key!932))))

(declare-fun d!62919 () Bool)

(declare-fun lt!132712 () SeekEntryResult!1191)

(assert (=> d!62919 (and (or ((_ is Undefined!1191) lt!132712) (not ((_ is Found!1191) lt!132712)) (and (bvsge (index!6935 lt!132712) #b00000000000000000000000000000000) (bvslt (index!6935 lt!132712) (size!6338 (_keys!7023 thiss!1504))))) (or ((_ is Undefined!1191) lt!132712) ((_ is Found!1191) lt!132712) (not ((_ is MissingZero!1191) lt!132712)) (and (bvsge (index!6934 lt!132712) #b00000000000000000000000000000000) (bvslt (index!6934 lt!132712) (size!6338 (_keys!7023 thiss!1504))))) (or ((_ is Undefined!1191) lt!132712) ((_ is Found!1191) lt!132712) ((_ is MissingZero!1191) lt!132712) (not ((_ is MissingVacant!1191) lt!132712)) (and (bvsge (index!6937 lt!132712) #b00000000000000000000000000000000) (bvslt (index!6937 lt!132712) (size!6338 (_keys!7023 thiss!1504))))) (or ((_ is Undefined!1191) lt!132712) (ite ((_ is Found!1191) lt!132712) (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6935 lt!132712)) key!932) (ite ((_ is MissingZero!1191) lt!132712) (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6934 lt!132712)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1191) lt!132712) (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6937 lt!132712)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62919 (= lt!132712 e!170192)))

(declare-fun c!44773 () Bool)

(assert (=> d!62919 (= c!44773 (and ((_ is Intermediate!1191) lt!132711) (undefined!2003 lt!132711)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12651 (_ BitVec 32)) SeekEntryResult!1191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62919 (= lt!132711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11192 thiss!1504)) key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(assert (=> d!62919 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62919 (= (seekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)) lt!132712)))

(declare-fun b!262640 () Bool)

(declare-fun c!44774 () Bool)

(assert (=> b!262640 (= c!44774 (= lt!132713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262640 (= e!170191 e!170193)))

(assert (= (and d!62919 c!44773) b!262642))

(assert (= (and d!62919 (not c!44773)) b!262645))

(assert (= (and b!262645 c!44772) b!262643))

(assert (= (and b!262645 (not c!44772)) b!262640))

(assert (= (and b!262640 c!44774) b!262641))

(assert (= (and b!262640 (not c!44774)) b!262644))

(declare-fun m!278267 () Bool)

(assert (=> b!262644 m!278267))

(declare-fun m!278269 () Bool)

(assert (=> b!262645 m!278269))

(assert (=> d!62919 m!277865))

(declare-fun m!278271 () Bool)

(assert (=> d!62919 m!278271))

(declare-fun m!278273 () Bool)

(assert (=> d!62919 m!278273))

(declare-fun m!278275 () Bool)

(assert (=> d!62919 m!278275))

(declare-fun m!278277 () Bool)

(assert (=> d!62919 m!278277))

(assert (=> d!62919 m!278277))

(declare-fun m!278279 () Bool)

(assert (=> d!62919 m!278279))

(assert (=> b!262279 d!62919))

(declare-fun d!62921 () Bool)

(assert (=> d!62921 (= (array_inv!3959 (_keys!7023 thiss!1504)) (bvsge (size!6338 (_keys!7023 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262264 d!62921))

(declare-fun d!62923 () Bool)

(assert (=> d!62923 (= (array_inv!3960 (_values!4817 thiss!1504)) (bvsge (size!6337 (_values!4817 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262264 d!62923))

(declare-fun d!62925 () Bool)

(declare-fun e!170196 () Bool)

(assert (=> d!62925 e!170196))

(declare-fun res!128264 () Bool)

(assert (=> d!62925 (=> (not res!128264) (not e!170196))))

(declare-fun lt!132718 () SeekEntryResult!1191)

(assert (=> d!62925 (= res!128264 ((_ is Found!1191) lt!132718))))

(assert (=> d!62925 (= lt!132718 (seekEntryOrOpen!0 key!932 (_keys!7023 thiss!1504) (mask!11192 thiss!1504)))))

(declare-fun lt!132719 () Unit!8124)

(declare-fun choose!1294 (array!12651 array!12649 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8124)

(assert (=> d!62925 (= lt!132719 (choose!1294 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!62925 (validMask!0 (mask!11192 thiss!1504))))

(assert (=> d!62925 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!447 (_keys!7023 thiss!1504) (_values!4817 thiss!1504) (mask!11192 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)) lt!132719)))

(declare-fun b!262650 () Bool)

(declare-fun res!128265 () Bool)

(assert (=> b!262650 (=> (not res!128265) (not e!170196))))

(assert (=> b!262650 (= res!128265 (inRange!0 (index!6935 lt!132718) (mask!11192 thiss!1504)))))

(declare-fun b!262651 () Bool)

(assert (=> b!262651 (= e!170196 (= (select (arr!5986 (_keys!7023 thiss!1504)) (index!6935 lt!132718)) key!932))))

(assert (=> b!262651 (and (bvsge (index!6935 lt!132718) #b00000000000000000000000000000000) (bvslt (index!6935 lt!132718) (size!6338 (_keys!7023 thiss!1504))))))

(assert (= (and d!62925 res!128264) b!262650))

(assert (= (and b!262650 res!128265) b!262651))

(assert (=> d!62925 m!277925))

(declare-fun m!278281 () Bool)

(assert (=> d!62925 m!278281))

(assert (=> d!62925 m!277865))

(declare-fun m!278283 () Bool)

(assert (=> b!262650 m!278283))

(declare-fun m!278285 () Bool)

(assert (=> b!262651 m!278285))

(assert (=> b!262260 d!62925))

(declare-fun condMapEmpty!11344 () Bool)

(declare-fun mapDefault!11344 () ValueCell!2981)

(assert (=> mapNonEmpty!11335 (= condMapEmpty!11344 (= mapRest!11335 ((as const (Array (_ BitVec 32) ValueCell!2981)) mapDefault!11344)))))

(declare-fun e!170202 () Bool)

(declare-fun mapRes!11344 () Bool)

(assert (=> mapNonEmpty!11335 (= tp!23694 (and e!170202 mapRes!11344))))

(declare-fun b!262658 () Bool)

(declare-fun e!170201 () Bool)

(assert (=> b!262658 (= e!170201 tp_is_empty!6649)))

(declare-fun b!262659 () Bool)

(assert (=> b!262659 (= e!170202 tp_is_empty!6649)))

(declare-fun mapNonEmpty!11344 () Bool)

(declare-fun tp!23710 () Bool)

(assert (=> mapNonEmpty!11344 (= mapRes!11344 (and tp!23710 e!170201))))

(declare-fun mapKey!11344 () (_ BitVec 32))

(declare-fun mapValue!11344 () ValueCell!2981)

(declare-fun mapRest!11344 () (Array (_ BitVec 32) ValueCell!2981))

(assert (=> mapNonEmpty!11344 (= mapRest!11335 (store mapRest!11344 mapKey!11344 mapValue!11344))))

(declare-fun mapIsEmpty!11344 () Bool)

(assert (=> mapIsEmpty!11344 mapRes!11344))

(assert (= (and mapNonEmpty!11335 condMapEmpty!11344) mapIsEmpty!11344))

(assert (= (and mapNonEmpty!11335 (not condMapEmpty!11344)) mapNonEmpty!11344))

(assert (= (and mapNonEmpty!11344 ((_ is ValueCellFull!2981) mapValue!11344)) b!262658))

(assert (= (and mapNonEmpty!11335 ((_ is ValueCellFull!2981) mapDefault!11344)) b!262659))

(declare-fun m!278287 () Bool)

(assert (=> mapNonEmpty!11344 m!278287))

(declare-fun b_lambda!8309 () Bool)

(assert (= b_lambda!8307 (or (and b!262264 b_free!6787) b_lambda!8309)))

(declare-fun b_lambda!8311 () Bool)

(assert (= b_lambda!8305 (or (and b!262264 b_free!6787) b_lambda!8311)))

(check-sat (not bm!25078) (not b!262513) (not b!262441) (not d!62905) (not b!262644) (not bm!25100) (not b!262514) tp_is_empty!6649 (not b!262559) (not d!62903) (not d!62883) (not b!262483) (not b!262498) (not b!262567) (not b!262558) (not d!62899) (not bm!25070) (not b!262486) b_and!13907 (not b!262472) (not b_lambda!8311) (not bm!25081) (not b!262650) (not b!262450) (not b!262575) (not b!262461) (not d!62901) (not d!62913) (not b_next!6787) (not bm!25073) (not bm!25104) (not bm!25075) (not bm!25069) (not b!262616) (not bm!25097) (not b!262608) (not b!262593) (not b!262624) (not bm!25074) (not b!262604) (not b!262582) (not d!62871) (not b!262560) (not b_lambda!8309) (not b!262566) (not bm!25108) (not b!262501) (not b!262597) (not d!62919) (not mapNonEmpty!11344) (not d!62875) (not b!262606) (not bm!25102) (not bm!25107) (not bm!25109) (not b!262449) (not b!262448) (not b!262571) (not d!62907) (not b!262625) (not b!262474) (not b!262621) (not b!262471) (not bm!25101) (not b!262594) (not b!262479) (not d!62925) (not b!262617) (not d!62889) (not d!62909) (not b!262574) (not d!62915) (not b!262476) (not b!262610) (not d!62879) (not b!262609) (not b!262587) (not b!262502))
(check-sat b_and!13907 (not b_next!6787))
