; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22190 () Bool)

(assert start!22190)

(declare-fun b!232317 () Bool)

(declare-fun b_free!6253 () Bool)

(declare-fun b_next!6253 () Bool)

(assert (=> b!232317 (= b_free!6253 (not b_next!6253))))

(declare-fun tp!21900 () Bool)

(declare-fun b_and!13165 () Bool)

(assert (=> b!232317 (= tp!21900 b_and!13165)))

(declare-fun b!232307 () Bool)

(declare-fun res!114093 () Bool)

(declare-fun e!150843 () Bool)

(assert (=> b!232307 (=> (not res!114093) (not e!150843))))

(declare-fun call!21582 () Bool)

(assert (=> b!232307 (= res!114093 call!21582)))

(declare-fun e!150842 () Bool)

(assert (=> b!232307 (= e!150842 e!150843)))

(declare-fun mapIsEmpty!10342 () Bool)

(declare-fun mapRes!10342 () Bool)

(assert (=> mapIsEmpty!10342 mapRes!10342))

(declare-fun b!232308 () Bool)

(declare-fun e!150844 () Bool)

(declare-fun tp_is_empty!6115 () Bool)

(assert (=> b!232308 (= e!150844 tp_is_empty!6115)))

(declare-fun b!232309 () Bool)

(declare-fun res!114092 () Bool)

(declare-fun e!150850 () Bool)

(assert (=> b!232309 (=> (not res!114092) (not e!150850))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!232309 (= res!114092 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232310 () Bool)

(declare-fun e!150845 () Bool)

(declare-fun call!21581 () Bool)

(assert (=> b!232310 (= e!150845 (not call!21581))))

(declare-fun b!232311 () Bool)

(declare-fun e!150846 () Bool)

(assert (=> b!232311 (= e!150846 e!150845)))

(declare-fun res!114088 () Bool)

(assert (=> b!232311 (= res!114088 call!21582)))

(assert (=> b!232311 (=> (not res!114088) (not e!150845))))

(declare-fun b!232312 () Bool)

(declare-fun e!150847 () Bool)

(declare-fun e!150853 () Bool)

(assert (=> b!232312 (= e!150847 (and e!150853 mapRes!10342))))

(declare-fun condMapEmpty!10342 () Bool)

(declare-datatypes ((V!7801 0))(
  ( (V!7802 (val!3102 Int)) )
))
(declare-datatypes ((ValueCell!2714 0))(
  ( (ValueCellFull!2714 (v!5123 V!7801)) (EmptyCell!2714) )
))
(declare-datatypes ((array!11471 0))(
  ( (array!11472 (arr!5455 (Array (_ BitVec 32) ValueCell!2714)) (size!5788 (_ BitVec 32))) )
))
(declare-datatypes ((array!11473 0))(
  ( (array!11474 (arr!5456 (Array (_ BitVec 32) (_ BitVec 64))) (size!5789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3328 0))(
  ( (LongMapFixedSize!3329 (defaultEntry!4323 Int) (mask!10235 (_ BitVec 32)) (extraKeys!4060 (_ BitVec 32)) (zeroValue!4164 V!7801) (minValue!4164 V!7801) (_size!1713 (_ BitVec 32)) (_keys!6377 array!11473) (_values!4306 array!11471) (_vacant!1713 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3328)

(declare-fun mapDefault!10342 () ValueCell!2714)

(assert (=> b!232312 (= condMapEmpty!10342 (= (arr!5455 (_values!4306 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2714)) mapDefault!10342)))))

(declare-fun b!232313 () Bool)

(declare-fun e!150841 () Bool)

(assert (=> b!232313 (= e!150841 (not true))))

(declare-fun lt!117310 () array!11473)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232313 (= (arrayCountValidKeys!0 lt!117310 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7148 0))(
  ( (Unit!7149) )
))
(declare-fun lt!117304 () Unit!7148)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11473 (_ BitVec 32)) Unit!7148)

(assert (=> b!232313 (= lt!117304 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117310 index!297))))

(declare-fun arrayContainsKey!0 (array!11473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232313 (arrayContainsKey!0 lt!117310 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117312 () Unit!7148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11473 (_ BitVec 64) (_ BitVec 32)) Unit!7148)

(assert (=> b!232313 (= lt!117312 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117310 key!932 index!297))))

(declare-datatypes ((tuple2!4508 0))(
  ( (tuple2!4509 (_1!2265 (_ BitVec 64)) (_2!2265 V!7801)) )
))
(declare-datatypes ((List!3417 0))(
  ( (Nil!3414) (Cons!3413 (h!4061 tuple2!4508) (t!8368 List!3417)) )
))
(declare-datatypes ((ListLongMap!3423 0))(
  ( (ListLongMap!3424 (toList!1727 List!3417)) )
))
(declare-fun lt!117313 () ListLongMap!3423)

(declare-fun v!346 () V!7801)

(declare-fun +!622 (ListLongMap!3423 tuple2!4508) ListLongMap!3423)

(declare-fun getCurrentListMap!1259 (array!11473 array!11471 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 32) Int) ListLongMap!3423)

(assert (=> b!232313 (= (+!622 lt!117313 (tuple2!4509 key!932 v!346)) (getCurrentListMap!1259 lt!117310 (array!11472 (store (arr!5455 (_values!4306 thiss!1504)) index!297 (ValueCellFull!2714 v!346)) (size!5788 (_values!4306 thiss!1504))) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(declare-fun lt!117308 () Unit!7148)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!81 (array!11473 array!11471 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 32) (_ BitVec 64) V!7801 Int) Unit!7148)

(assert (=> b!232313 (= lt!117308 (lemmaAddValidKeyToArrayThenAddPairToListMap!81 (_keys!6377 thiss!1504) (_values!4306 thiss!1504) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) index!297 key!932 v!346 (defaultEntry!4323 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11473 (_ BitVec 32)) Bool)

(assert (=> b!232313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117310 (mask!10235 thiss!1504))))

(declare-fun lt!117306 () Unit!7148)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11473 (_ BitVec 32) (_ BitVec 32)) Unit!7148)

(assert (=> b!232313 (= lt!117306 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6377 thiss!1504) index!297 (mask!10235 thiss!1504)))))

(assert (=> b!232313 (= (arrayCountValidKeys!0 lt!117310 #b00000000000000000000000000000000 (size!5789 (_keys!6377 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6377 thiss!1504) #b00000000000000000000000000000000 (size!5789 (_keys!6377 thiss!1504)))))))

(declare-fun lt!117303 () Unit!7148)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11473 (_ BitVec 32) (_ BitVec 64)) Unit!7148)

(assert (=> b!232313 (= lt!117303 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6377 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3418 0))(
  ( (Nil!3415) (Cons!3414 (h!4062 (_ BitVec 64)) (t!8369 List!3418)) )
))
(declare-fun arrayNoDuplicates!0 (array!11473 (_ BitVec 32) List!3418) Bool)

(assert (=> b!232313 (arrayNoDuplicates!0 lt!117310 #b00000000000000000000000000000000 Nil!3415)))

(assert (=> b!232313 (= lt!117310 (array!11474 (store (arr!5456 (_keys!6377 thiss!1504)) index!297 key!932) (size!5789 (_keys!6377 thiss!1504))))))

(declare-fun lt!117311 () Unit!7148)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3418) Unit!7148)

(assert (=> b!232313 (= lt!117311 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6377 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3415))))

(declare-fun lt!117300 () Unit!7148)

(declare-fun e!150852 () Unit!7148)

(assert (=> b!232313 (= lt!117300 e!150852)))

(declare-fun c!38628 () Bool)

(assert (=> b!232313 (= c!38628 (arrayContainsKey!0 (_keys!6377 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232314 () Bool)

(assert (=> b!232314 (= e!150843 (not call!21581))))

(declare-fun b!232315 () Bool)

(declare-fun res!114091 () Bool)

(declare-datatypes ((SeekEntryResult!930 0))(
  ( (MissingZero!930 (index!5890 (_ BitVec 32))) (Found!930 (index!5891 (_ BitVec 32))) (Intermediate!930 (undefined!1742 Bool) (index!5892 (_ BitVec 32)) (x!23518 (_ BitVec 32))) (Undefined!930) (MissingVacant!930 (index!5893 (_ BitVec 32))) )
))
(declare-fun lt!117302 () SeekEntryResult!930)

(assert (=> b!232315 (= res!114091 (= (select (arr!5456 (_keys!6377 thiss!1504)) (index!5893 lt!117302)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232315 (=> (not res!114091) (not e!150845))))

(declare-fun res!114087 () Bool)

(assert (=> start!22190 (=> (not res!114087) (not e!150850))))

(declare-fun valid!1332 (LongMapFixedSize!3328) Bool)

(assert (=> start!22190 (= res!114087 (valid!1332 thiss!1504))))

(assert (=> start!22190 e!150850))

(declare-fun e!150851 () Bool)

(assert (=> start!22190 e!150851))

(assert (=> start!22190 true))

(assert (=> start!22190 tp_is_empty!6115))

(declare-fun bm!21578 () Bool)

(assert (=> bm!21578 (= call!21581 (arrayContainsKey!0 (_keys!6377 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232316 () Bool)

(declare-fun Unit!7150 () Unit!7148)

(assert (=> b!232316 (= e!150852 Unit!7150)))

(declare-fun array_inv!3579 (array!11473) Bool)

(declare-fun array_inv!3580 (array!11471) Bool)

(assert (=> b!232317 (= e!150851 (and tp!21900 tp_is_empty!6115 (array_inv!3579 (_keys!6377 thiss!1504)) (array_inv!3580 (_values!4306 thiss!1504)) e!150847))))

(declare-fun b!232318 () Bool)

(declare-fun e!150849 () Unit!7148)

(declare-fun lt!117309 () Unit!7148)

(assert (=> b!232318 (= e!150849 lt!117309)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!306 (array!11473 array!11471 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) Int) Unit!7148)

(assert (=> b!232318 (= lt!117309 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!306 (_keys!6377 thiss!1504) (_values!4306 thiss!1504) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 (defaultEntry!4323 thiss!1504)))))

(declare-fun c!38626 () Bool)

(get-info :version)

(assert (=> b!232318 (= c!38626 ((_ is MissingZero!930) lt!117302))))

(assert (=> b!232318 e!150842))

(declare-fun b!232319 () Bool)

(assert (=> b!232319 (= e!150853 tp_is_empty!6115)))

(declare-fun mapNonEmpty!10342 () Bool)

(declare-fun tp!21901 () Bool)

(assert (=> mapNonEmpty!10342 (= mapRes!10342 (and tp!21901 e!150844))))

(declare-fun mapKey!10342 () (_ BitVec 32))

(declare-fun mapValue!10342 () ValueCell!2714)

(declare-fun mapRest!10342 () (Array (_ BitVec 32) ValueCell!2714))

(assert (=> mapNonEmpty!10342 (= (arr!5455 (_values!4306 thiss!1504)) (store mapRest!10342 mapKey!10342 mapValue!10342))))

(declare-fun b!232320 () Bool)

(declare-fun Unit!7151 () Unit!7148)

(assert (=> b!232320 (= e!150852 Unit!7151)))

(declare-fun lt!117305 () Unit!7148)

(declare-fun lemmaArrayContainsKeyThenInListMap!149 (array!11473 array!11471 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) (_ BitVec 32) Int) Unit!7148)

(assert (=> b!232320 (= lt!117305 (lemmaArrayContainsKeyThenInListMap!149 (_keys!6377 thiss!1504) (_values!4306 thiss!1504) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(assert (=> b!232320 false))

(declare-fun b!232321 () Bool)

(declare-fun e!150854 () Bool)

(assert (=> b!232321 (= e!150850 e!150854)))

(declare-fun res!114089 () Bool)

(assert (=> b!232321 (=> (not res!114089) (not e!150854))))

(assert (=> b!232321 (= res!114089 (or (= lt!117302 (MissingZero!930 index!297)) (= lt!117302 (MissingVacant!930 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11473 (_ BitVec 32)) SeekEntryResult!930)

(assert (=> b!232321 (= lt!117302 (seekEntryOrOpen!0 key!932 (_keys!6377 thiss!1504) (mask!10235 thiss!1504)))))

(declare-fun b!232322 () Bool)

(declare-fun c!38629 () Bool)

(assert (=> b!232322 (= c!38629 ((_ is MissingVacant!930) lt!117302))))

(assert (=> b!232322 (= e!150842 e!150846)))

(declare-fun b!232323 () Bool)

(assert (=> b!232323 (= e!150854 e!150841)))

(declare-fun res!114090 () Bool)

(assert (=> b!232323 (=> (not res!114090) (not e!150841))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!232323 (= res!114090 (inRange!0 index!297 (mask!10235 thiss!1504)))))

(declare-fun lt!117301 () Unit!7148)

(assert (=> b!232323 (= lt!117301 e!150849)))

(declare-fun c!38627 () Bool)

(declare-fun contains!1609 (ListLongMap!3423 (_ BitVec 64)) Bool)

(assert (=> b!232323 (= c!38627 (contains!1609 lt!117313 key!932))))

(assert (=> b!232323 (= lt!117313 (getCurrentListMap!1259 (_keys!6377 thiss!1504) (_values!4306 thiss!1504) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4323 thiss!1504)))))

(declare-fun b!232324 () Bool)

(declare-fun Unit!7152 () Unit!7148)

(assert (=> b!232324 (= e!150849 Unit!7152)))

(declare-fun lt!117307 () Unit!7148)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (array!11473 array!11471 (_ BitVec 32) (_ BitVec 32) V!7801 V!7801 (_ BitVec 64) Int) Unit!7148)

(assert (=> b!232324 (= lt!117307 (lemmaInListMapThenSeekEntryOrOpenFindsIt!312 (_keys!6377 thiss!1504) (_values!4306 thiss!1504) (mask!10235 thiss!1504) (extraKeys!4060 thiss!1504) (zeroValue!4164 thiss!1504) (minValue!4164 thiss!1504) key!932 (defaultEntry!4323 thiss!1504)))))

(assert (=> b!232324 false))

(declare-fun bm!21579 () Bool)

(assert (=> bm!21579 (= call!21582 (inRange!0 (ite c!38626 (index!5890 lt!117302) (index!5893 lt!117302)) (mask!10235 thiss!1504)))))

(declare-fun b!232325 () Bool)

(declare-fun res!114094 () Bool)

(assert (=> b!232325 (=> (not res!114094) (not e!150843))))

(assert (=> b!232325 (= res!114094 (= (select (arr!5456 (_keys!6377 thiss!1504)) (index!5890 lt!117302)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232326 () Bool)

(assert (=> b!232326 (= e!150846 ((_ is Undefined!930) lt!117302))))

(assert (= (and start!22190 res!114087) b!232309))

(assert (= (and b!232309 res!114092) b!232321))

(assert (= (and b!232321 res!114089) b!232323))

(assert (= (and b!232323 c!38627) b!232324))

(assert (= (and b!232323 (not c!38627)) b!232318))

(assert (= (and b!232318 c!38626) b!232307))

(assert (= (and b!232318 (not c!38626)) b!232322))

(assert (= (and b!232307 res!114093) b!232325))

(assert (= (and b!232325 res!114094) b!232314))

(assert (= (and b!232322 c!38629) b!232311))

(assert (= (and b!232322 (not c!38629)) b!232326))

(assert (= (and b!232311 res!114088) b!232315))

(assert (= (and b!232315 res!114091) b!232310))

(assert (= (or b!232307 b!232311) bm!21579))

(assert (= (or b!232314 b!232310) bm!21578))

(assert (= (and b!232323 res!114090) b!232313))

(assert (= (and b!232313 c!38628) b!232320))

(assert (= (and b!232313 (not c!38628)) b!232316))

(assert (= (and b!232312 condMapEmpty!10342) mapIsEmpty!10342))

(assert (= (and b!232312 (not condMapEmpty!10342)) mapNonEmpty!10342))

(assert (= (and mapNonEmpty!10342 ((_ is ValueCellFull!2714) mapValue!10342)) b!232308))

(assert (= (and b!232312 ((_ is ValueCellFull!2714) mapDefault!10342)) b!232319))

(assert (= b!232317 b!232312))

(assert (= start!22190 b!232317))

(declare-fun m!253861 () Bool)

(assert (=> b!232325 m!253861))

(declare-fun m!253863 () Bool)

(assert (=> b!232315 m!253863))

(declare-fun m!253865 () Bool)

(assert (=> start!22190 m!253865))

(declare-fun m!253867 () Bool)

(assert (=> b!232324 m!253867))

(declare-fun m!253869 () Bool)

(assert (=> b!232320 m!253869))

(declare-fun m!253871 () Bool)

(assert (=> b!232317 m!253871))

(declare-fun m!253873 () Bool)

(assert (=> b!232317 m!253873))

(declare-fun m!253875 () Bool)

(assert (=> b!232313 m!253875))

(declare-fun m!253877 () Bool)

(assert (=> b!232313 m!253877))

(declare-fun m!253879 () Bool)

(assert (=> b!232313 m!253879))

(declare-fun m!253881 () Bool)

(assert (=> b!232313 m!253881))

(declare-fun m!253883 () Bool)

(assert (=> b!232313 m!253883))

(declare-fun m!253885 () Bool)

(assert (=> b!232313 m!253885))

(declare-fun m!253887 () Bool)

(assert (=> b!232313 m!253887))

(declare-fun m!253889 () Bool)

(assert (=> b!232313 m!253889))

(declare-fun m!253891 () Bool)

(assert (=> b!232313 m!253891))

(declare-fun m!253893 () Bool)

(assert (=> b!232313 m!253893))

(declare-fun m!253895 () Bool)

(assert (=> b!232313 m!253895))

(declare-fun m!253897 () Bool)

(assert (=> b!232313 m!253897))

(declare-fun m!253899 () Bool)

(assert (=> b!232313 m!253899))

(declare-fun m!253901 () Bool)

(assert (=> b!232313 m!253901))

(declare-fun m!253903 () Bool)

(assert (=> b!232313 m!253903))

(declare-fun m!253905 () Bool)

(assert (=> b!232313 m!253905))

(declare-fun m!253907 () Bool)

(assert (=> b!232313 m!253907))

(declare-fun m!253909 () Bool)

(assert (=> b!232321 m!253909))

(declare-fun m!253911 () Bool)

(assert (=> mapNonEmpty!10342 m!253911))

(assert (=> bm!21578 m!253875))

(declare-fun m!253913 () Bool)

(assert (=> b!232323 m!253913))

(declare-fun m!253915 () Bool)

(assert (=> b!232323 m!253915))

(declare-fun m!253917 () Bool)

(assert (=> b!232323 m!253917))

(declare-fun m!253919 () Bool)

(assert (=> bm!21579 m!253919))

(declare-fun m!253921 () Bool)

(assert (=> b!232318 m!253921))

(check-sat (not start!22190) (not b!232313) (not b!232321) (not bm!21578) b_and!13165 (not bm!21579) (not b!232318) (not b!232323) (not b_next!6253) tp_is_empty!6115 (not b!232320) (not b!232317) (not b!232324) (not mapNonEmpty!10342))
(check-sat b_and!13165 (not b_next!6253))
