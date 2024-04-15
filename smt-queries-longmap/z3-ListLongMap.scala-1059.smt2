; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22040 () Bool)

(assert start!22040)

(declare-fun b!227325 () Bool)

(declare-fun b_free!6103 () Bool)

(declare-fun b_next!6103 () Bool)

(assert (=> b!227325 (= b_free!6103 (not b_next!6103))))

(declare-fun tp!21450 () Bool)

(declare-fun b_and!12975 () Bool)

(assert (=> b!227325 (= tp!21450 b_and!12975)))

(declare-fun b!227322 () Bool)

(declare-fun res!111887 () Bool)

(declare-fun e!147472 () Bool)

(assert (=> b!227322 (=> res!111887 e!147472)))

(declare-datatypes ((V!7601 0))(
  ( (V!7602 (val!3027 Int)) )
))
(declare-datatypes ((ValueCell!2639 0))(
  ( (ValueCellFull!2639 (v!5041 V!7601)) (EmptyCell!2639) )
))
(declare-datatypes ((array!11165 0))(
  ( (array!11166 (arr!5301 (Array (_ BitVec 32) ValueCell!2639)) (size!5635 (_ BitVec 32))) )
))
(declare-datatypes ((array!11167 0))(
  ( (array!11168 (arr!5302 (Array (_ BitVec 32) (_ BitVec 64))) (size!5636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3178 0))(
  ( (LongMapFixedSize!3179 (defaultEntry!4248 Int) (mask!10109 (_ BitVec 32)) (extraKeys!3985 (_ BitVec 32)) (zeroValue!4089 V!7601) (minValue!4089 V!7601) (_size!1638 (_ BitVec 32)) (_keys!6301 array!11167) (_values!4231 array!11165) (_vacant!1638 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3178)

(assert (=> b!227322 (= res!111887 (or (not (= (size!5635 (_values!4231 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10109 thiss!1504)))) (not (= (size!5636 (_keys!6301 thiss!1504)) (size!5635 (_values!4231 thiss!1504)))) (bvslt (mask!10109 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3985 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227323 () Bool)

(declare-fun e!147480 () Bool)

(declare-fun call!21119 () Bool)

(assert (=> b!227323 (= e!147480 (not call!21119))))

(declare-fun b!227324 () Bool)

(declare-fun e!147478 () Bool)

(assert (=> b!227324 (= e!147478 (not e!147472))))

(declare-fun res!111886 () Bool)

(assert (=> b!227324 (=> res!111886 e!147472)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227324 (= res!111886 (not (validMask!0 (mask!10109 thiss!1504))))))

(declare-fun lt!114290 () array!11167)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11167 (_ BitVec 32)) Bool)

(assert (=> b!227324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114290 (mask!10109 thiss!1504))))

(declare-datatypes ((Unit!6864 0))(
  ( (Unit!6865) )
))
(declare-fun lt!114284 () Unit!6864)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11167 (_ BitVec 32) (_ BitVec 32)) Unit!6864)

(assert (=> b!227324 (= lt!114284 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6301 thiss!1504) index!297 (mask!10109 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11167 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227324 (= (arrayCountValidKeys!0 lt!114290 #b00000000000000000000000000000000 (size!5636 (_keys!6301 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6301 thiss!1504) #b00000000000000000000000000000000 (size!5636 (_keys!6301 thiss!1504)))))))

(declare-fun lt!114291 () Unit!6864)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11167 (_ BitVec 32) (_ BitVec 64)) Unit!6864)

(assert (=> b!227324 (= lt!114291 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6301 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3382 0))(
  ( (Nil!3379) (Cons!3378 (h!4026 (_ BitVec 64)) (t!8332 List!3382)) )
))
(declare-fun arrayNoDuplicates!0 (array!11167 (_ BitVec 32) List!3382) Bool)

(assert (=> b!227324 (arrayNoDuplicates!0 lt!114290 #b00000000000000000000000000000000 Nil!3379)))

(assert (=> b!227324 (= lt!114290 (array!11168 (store (arr!5302 (_keys!6301 thiss!1504)) index!297 key!932) (size!5636 (_keys!6301 thiss!1504))))))

(declare-fun lt!114285 () Unit!6864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3382) Unit!6864)

(assert (=> b!227324 (= lt!114285 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6301 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3379))))

(declare-fun lt!114287 () Unit!6864)

(declare-fun e!147479 () Unit!6864)

(assert (=> b!227324 (= lt!114287 e!147479)))

(declare-fun c!37687 () Bool)

(declare-fun arrayContainsKey!0 (array!11167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227324 (= c!37687 (arrayContainsKey!0 (_keys!6301 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!5965 () Bool)

(declare-fun e!147474 () Bool)

(declare-fun e!147482 () Bool)

(declare-fun array_inv!3501 (array!11167) Bool)

(declare-fun array_inv!3502 (array!11165) Bool)

(assert (=> b!227325 (= e!147474 (and tp!21450 tp_is_empty!5965 (array_inv!3501 (_keys!6301 thiss!1504)) (array_inv!3502 (_values!4231 thiss!1504)) e!147482))))

(declare-fun mapNonEmpty!10117 () Bool)

(declare-fun mapRes!10117 () Bool)

(declare-fun tp!21451 () Bool)

(declare-fun e!147476 () Bool)

(assert (=> mapNonEmpty!10117 (= mapRes!10117 (and tp!21451 e!147476))))

(declare-fun mapValue!10117 () ValueCell!2639)

(declare-fun mapRest!10117 () (Array (_ BitVec 32) ValueCell!2639))

(declare-fun mapKey!10117 () (_ BitVec 32))

(assert (=> mapNonEmpty!10117 (= (arr!5301 (_values!4231 thiss!1504)) (store mapRest!10117 mapKey!10117 mapValue!10117))))

(declare-fun b!227326 () Bool)

(declare-fun res!111885 () Bool)

(declare-fun e!147475 () Bool)

(assert (=> b!227326 (=> (not res!111885) (not e!147475))))

(assert (=> b!227326 (= res!111885 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227327 () Bool)

(declare-fun c!37688 () Bool)

(declare-datatypes ((SeekEntryResult!895 0))(
  ( (MissingZero!895 (index!5750 (_ BitVec 32))) (Found!895 (index!5751 (_ BitVec 32))) (Intermediate!895 (undefined!1707 Bool) (index!5752 (_ BitVec 32)) (x!23282 (_ BitVec 32))) (Undefined!895) (MissingVacant!895 (index!5753 (_ BitVec 32))) )
))
(declare-fun lt!114282 () SeekEntryResult!895)

(get-info :version)

(assert (=> b!227327 (= c!37688 ((_ is MissingVacant!895) lt!114282))))

(declare-fun e!147471 () Bool)

(declare-fun e!147470 () Bool)

(assert (=> b!227327 (= e!147471 e!147470)))

(declare-fun c!37690 () Bool)

(declare-fun bm!21116 () Bool)

(declare-fun call!21120 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21116 (= call!21120 (inRange!0 (ite c!37690 (index!5750 lt!114282) (index!5753 lt!114282)) (mask!10109 thiss!1504)))))

(declare-fun b!227328 () Bool)

(declare-fun e!147473 () Bool)

(assert (=> b!227328 (= e!147473 (not call!21119))))

(declare-fun mapIsEmpty!10117 () Bool)

(assert (=> mapIsEmpty!10117 mapRes!10117))

(declare-fun res!111881 () Bool)

(assert (=> start!22040 (=> (not res!111881) (not e!147475))))

(declare-fun valid!1287 (LongMapFixedSize!3178) Bool)

(assert (=> start!22040 (= res!111881 (valid!1287 thiss!1504))))

(assert (=> start!22040 e!147475))

(assert (=> start!22040 e!147474))

(assert (=> start!22040 true))

(declare-fun b!227329 () Bool)

(declare-fun res!111888 () Bool)

(assert (=> b!227329 (=> (not res!111888) (not e!147480))))

(assert (=> b!227329 (= res!111888 (= (select (arr!5302 (_keys!6301 thiss!1504)) (index!5750 lt!114282)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227330 () Bool)

(assert (=> b!227330 (= e!147470 ((_ is Undefined!895) lt!114282))))

(declare-fun b!227331 () Bool)

(declare-fun res!111890 () Bool)

(assert (=> b!227331 (=> (not res!111890) (not e!147480))))

(assert (=> b!227331 (= res!111890 call!21120)))

(assert (=> b!227331 (= e!147471 e!147480)))

(declare-fun bm!21117 () Bool)

(assert (=> bm!21117 (= call!21119 (arrayContainsKey!0 (_keys!6301 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227332 () Bool)

(declare-fun e!147469 () Bool)

(assert (=> b!227332 (= e!147482 (and e!147469 mapRes!10117))))

(declare-fun condMapEmpty!10117 () Bool)

(declare-fun mapDefault!10117 () ValueCell!2639)

(assert (=> b!227332 (= condMapEmpty!10117 (= (arr!5301 (_values!4231 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2639)) mapDefault!10117)))))

(declare-fun b!227333 () Bool)

(declare-fun e!147477 () Unit!6864)

(declare-fun Unit!6866 () Unit!6864)

(assert (=> b!227333 (= e!147477 Unit!6866)))

(declare-fun lt!114286 () Unit!6864)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!265 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) Int) Unit!6864)

(assert (=> b!227333 (= lt!114286 (lemmaInListMapThenSeekEntryOrOpenFindsIt!265 (_keys!6301 thiss!1504) (_values!4231 thiss!1504) (mask!10109 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 (defaultEntry!4248 thiss!1504)))))

(assert (=> b!227333 false))

(declare-fun b!227334 () Bool)

(declare-fun e!147483 () Bool)

(assert (=> b!227334 (= e!147475 e!147483)))

(declare-fun res!111883 () Bool)

(assert (=> b!227334 (=> (not res!111883) (not e!147483))))

(assert (=> b!227334 (= res!111883 (or (= lt!114282 (MissingZero!895 index!297)) (= lt!114282 (MissingVacant!895 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11167 (_ BitVec 32)) SeekEntryResult!895)

(assert (=> b!227334 (= lt!114282 (seekEntryOrOpen!0 key!932 (_keys!6301 thiss!1504) (mask!10109 thiss!1504)))))

(declare-fun b!227335 () Bool)

(declare-fun res!111882 () Bool)

(assert (=> b!227335 (= res!111882 (= (select (arr!5302 (_keys!6301 thiss!1504)) (index!5753 lt!114282)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227335 (=> (not res!111882) (not e!147473))))

(declare-fun b!227336 () Bool)

(declare-fun Unit!6867 () Unit!6864)

(assert (=> b!227336 (= e!147479 Unit!6867)))

(declare-fun b!227337 () Bool)

(assert (=> b!227337 (= e!147469 tp_is_empty!5965)))

(declare-fun b!227338 () Bool)

(declare-fun lt!114283 () Unit!6864)

(assert (=> b!227338 (= e!147477 lt!114283)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!260 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) Int) Unit!6864)

(assert (=> b!227338 (= lt!114283 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!260 (_keys!6301 thiss!1504) (_values!4231 thiss!1504) (mask!10109 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 (defaultEntry!4248 thiss!1504)))))

(assert (=> b!227338 (= c!37690 ((_ is MissingZero!895) lt!114282))))

(assert (=> b!227338 e!147471))

(declare-fun b!227339 () Bool)

(assert (=> b!227339 (= e!147470 e!147473)))

(declare-fun res!111889 () Bool)

(assert (=> b!227339 (= res!111889 call!21120)))

(assert (=> b!227339 (=> (not res!111889) (not e!147473))))

(declare-fun b!227340 () Bool)

(declare-fun Unit!6868 () Unit!6864)

(assert (=> b!227340 (= e!147479 Unit!6868)))

(declare-fun lt!114289 () Unit!6864)

(declare-fun lemmaArrayContainsKeyThenInListMap!104 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 64) (_ BitVec 32) Int) Unit!6864)

(assert (=> b!227340 (= lt!114289 (lemmaArrayContainsKeyThenInListMap!104 (_keys!6301 thiss!1504) (_values!4231 thiss!1504) (mask!10109 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4248 thiss!1504)))))

(assert (=> b!227340 false))

(declare-fun b!227341 () Bool)

(declare-fun res!111880 () Bool)

(assert (=> b!227341 (=> res!111880 e!147472)))

(assert (=> b!227341 (= res!111880 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6301 thiss!1504) (mask!10109 thiss!1504))))))

(declare-fun b!227342 () Bool)

(assert (=> b!227342 (= e!147483 e!147478)))

(declare-fun res!111884 () Bool)

(assert (=> b!227342 (=> (not res!111884) (not e!147478))))

(assert (=> b!227342 (= res!111884 (inRange!0 index!297 (mask!10109 thiss!1504)))))

(declare-fun lt!114288 () Unit!6864)

(assert (=> b!227342 (= lt!114288 e!147477)))

(declare-fun c!37689 () Bool)

(declare-datatypes ((tuple2!4452 0))(
  ( (tuple2!4453 (_1!2237 (_ BitVec 64)) (_2!2237 V!7601)) )
))
(declare-datatypes ((List!3383 0))(
  ( (Nil!3380) (Cons!3379 (h!4027 tuple2!4452) (t!8333 List!3383)) )
))
(declare-datatypes ((ListLongMap!3355 0))(
  ( (ListLongMap!3356 (toList!1693 List!3383)) )
))
(declare-fun contains!1568 (ListLongMap!3355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1202 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7601 V!7601 (_ BitVec 32) Int) ListLongMap!3355)

(assert (=> b!227342 (= c!37689 (contains!1568 (getCurrentListMap!1202 (_keys!6301 thiss!1504) (_values!4231 thiss!1504) (mask!10109 thiss!1504) (extraKeys!3985 thiss!1504) (zeroValue!4089 thiss!1504) (minValue!4089 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4248 thiss!1504)) key!932))))

(declare-fun b!227343 () Bool)

(assert (=> b!227343 (= e!147476 tp_is_empty!5965)))

(declare-fun b!227344 () Bool)

(assert (=> b!227344 (= e!147472 true)))

(declare-fun lt!114292 () Bool)

(assert (=> b!227344 (= lt!114292 (arrayNoDuplicates!0 (_keys!6301 thiss!1504) #b00000000000000000000000000000000 Nil!3379))))

(assert (= (and start!22040 res!111881) b!227326))

(assert (= (and b!227326 res!111885) b!227334))

(assert (= (and b!227334 res!111883) b!227342))

(assert (= (and b!227342 c!37689) b!227333))

(assert (= (and b!227342 (not c!37689)) b!227338))

(assert (= (and b!227338 c!37690) b!227331))

(assert (= (and b!227338 (not c!37690)) b!227327))

(assert (= (and b!227331 res!111890) b!227329))

(assert (= (and b!227329 res!111888) b!227323))

(assert (= (and b!227327 c!37688) b!227339))

(assert (= (and b!227327 (not c!37688)) b!227330))

(assert (= (and b!227339 res!111889) b!227335))

(assert (= (and b!227335 res!111882) b!227328))

(assert (= (or b!227331 b!227339) bm!21116))

(assert (= (or b!227323 b!227328) bm!21117))

(assert (= (and b!227342 res!111884) b!227324))

(assert (= (and b!227324 c!37687) b!227340))

(assert (= (and b!227324 (not c!37687)) b!227336))

(assert (= (and b!227324 (not res!111886)) b!227322))

(assert (= (and b!227322 (not res!111887)) b!227341))

(assert (= (and b!227341 (not res!111880)) b!227344))

(assert (= (and b!227332 condMapEmpty!10117) mapIsEmpty!10117))

(assert (= (and b!227332 (not condMapEmpty!10117)) mapNonEmpty!10117))

(assert (= (and mapNonEmpty!10117 ((_ is ValueCellFull!2639) mapValue!10117)) b!227343))

(assert (= (and b!227332 ((_ is ValueCellFull!2639) mapDefault!10117)) b!227337))

(assert (= b!227325 b!227332))

(assert (= start!22040 b!227325))

(declare-fun m!248851 () Bool)

(assert (=> b!227338 m!248851))

(declare-fun m!248853 () Bool)

(assert (=> b!227342 m!248853))

(declare-fun m!248855 () Bool)

(assert (=> b!227342 m!248855))

(assert (=> b!227342 m!248855))

(declare-fun m!248857 () Bool)

(assert (=> b!227342 m!248857))

(declare-fun m!248859 () Bool)

(assert (=> b!227344 m!248859))

(declare-fun m!248861 () Bool)

(assert (=> b!227325 m!248861))

(declare-fun m!248863 () Bool)

(assert (=> b!227325 m!248863))

(declare-fun m!248865 () Bool)

(assert (=> b!227341 m!248865))

(declare-fun m!248867 () Bool)

(assert (=> start!22040 m!248867))

(declare-fun m!248869 () Bool)

(assert (=> mapNonEmpty!10117 m!248869))

(declare-fun m!248871 () Bool)

(assert (=> bm!21117 m!248871))

(declare-fun m!248873 () Bool)

(assert (=> b!227340 m!248873))

(declare-fun m!248875 () Bool)

(assert (=> b!227333 m!248875))

(declare-fun m!248877 () Bool)

(assert (=> bm!21116 m!248877))

(declare-fun m!248879 () Bool)

(assert (=> b!227329 m!248879))

(declare-fun m!248881 () Bool)

(assert (=> b!227335 m!248881))

(declare-fun m!248883 () Bool)

(assert (=> b!227334 m!248883))

(declare-fun m!248885 () Bool)

(assert (=> b!227324 m!248885))

(assert (=> b!227324 m!248871))

(declare-fun m!248887 () Bool)

(assert (=> b!227324 m!248887))

(declare-fun m!248889 () Bool)

(assert (=> b!227324 m!248889))

(declare-fun m!248891 () Bool)

(assert (=> b!227324 m!248891))

(declare-fun m!248893 () Bool)

(assert (=> b!227324 m!248893))

(declare-fun m!248895 () Bool)

(assert (=> b!227324 m!248895))

(declare-fun m!248897 () Bool)

(assert (=> b!227324 m!248897))

(declare-fun m!248899 () Bool)

(assert (=> b!227324 m!248899))

(declare-fun m!248901 () Bool)

(assert (=> b!227324 m!248901))

(check-sat tp_is_empty!5965 (not b!227341) (not b!227344) (not b!227340) b_and!12975 (not b!227333) (not b_next!6103) (not b!227342) (not b!227338) (not bm!21116) (not b!227324) (not b!227325) (not b!227334) (not start!22040) (not mapNonEmpty!10117) (not bm!21117))
(check-sat b_and!12975 (not b_next!6103))
