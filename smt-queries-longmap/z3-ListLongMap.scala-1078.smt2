; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22154 () Bool)

(assert start!22154)

(declare-fun b!231050 () Bool)

(declare-fun b_free!6217 () Bool)

(declare-fun b_next!6217 () Bool)

(assert (=> b!231050 (= b_free!6217 (not b_next!6217))))

(declare-fun tp!21793 () Bool)

(declare-fun b_and!13089 () Bool)

(assert (=> b!231050 (= tp!21793 b_and!13089)))

(declare-fun b!231033 () Bool)

(declare-fun e!149968 () Bool)

(declare-fun e!149963 () Bool)

(assert (=> b!231033 (= e!149968 e!149963)))

(declare-fun res!113546 () Bool)

(assert (=> b!231033 (=> (not res!113546) (not e!149963))))

(declare-datatypes ((SeekEntryResult!947 0))(
  ( (MissingZero!947 (index!5958 (_ BitVec 32))) (Found!947 (index!5959 (_ BitVec 32))) (Intermediate!947 (undefined!1759 Bool) (index!5960 (_ BitVec 32)) (x!23486 (_ BitVec 32))) (Undefined!947) (MissingVacant!947 (index!5961 (_ BitVec 32))) )
))
(declare-fun lt!116311 () SeekEntryResult!947)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231033 (= res!113546 (or (= lt!116311 (MissingZero!947 index!297)) (= lt!116311 (MissingVacant!947 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7753 0))(
  ( (V!7754 (val!3084 Int)) )
))
(declare-datatypes ((ValueCell!2696 0))(
  ( (ValueCellFull!2696 (v!5098 V!7753)) (EmptyCell!2696) )
))
(declare-datatypes ((array!11393 0))(
  ( (array!11394 (arr!5415 (Array (_ BitVec 32) ValueCell!2696)) (size!5749 (_ BitVec 32))) )
))
(declare-datatypes ((array!11395 0))(
  ( (array!11396 (arr!5416 (Array (_ BitVec 32) (_ BitVec 64))) (size!5750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3292 0))(
  ( (LongMapFixedSize!3293 (defaultEntry!4305 Int) (mask!10204 (_ BitVec 32)) (extraKeys!4042 (_ BitVec 32)) (zeroValue!4146 V!7753) (minValue!4146 V!7753) (_size!1695 (_ BitVec 32)) (_keys!6358 array!11395) (_values!4288 array!11393) (_vacant!1695 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3292)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11395 (_ BitVec 32)) SeekEntryResult!947)

(assert (=> b!231033 (= lt!116311 (seekEntryOrOpen!0 key!932 (_keys!6358 thiss!1504) (mask!10204 thiss!1504)))))

(declare-fun b!231034 () Bool)

(declare-fun res!113540 () Bool)

(assert (=> b!231034 (= res!113540 (= (select (arr!5416 (_keys!6358 thiss!1504)) (index!5961 lt!116311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149964 () Bool)

(assert (=> b!231034 (=> (not res!113540) (not e!149964))))

(declare-fun b!231035 () Bool)

(declare-fun e!149969 () Bool)

(declare-fun tp_is_empty!6079 () Bool)

(assert (=> b!231035 (= e!149969 tp_is_empty!6079)))

(declare-fun b!231036 () Bool)

(declare-fun res!113543 () Bool)

(assert (=> b!231036 (=> (not res!113543) (not e!149968))))

(assert (=> b!231036 (= res!113543 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231037 () Bool)

(declare-fun call!21462 () Bool)

(assert (=> b!231037 (= e!149964 (not call!21462))))

(declare-fun b!231038 () Bool)

(declare-fun res!113544 () Bool)

(declare-fun e!149966 () Bool)

(assert (=> b!231038 (=> (not res!113544) (not e!149966))))

(assert (=> b!231038 (= res!113544 (= (select (arr!5416 (_keys!6358 thiss!1504)) (index!5958 lt!116311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231039 () Bool)

(declare-fun e!149967 () Bool)

(declare-fun mapRes!10288 () Bool)

(assert (=> b!231039 (= e!149967 (and e!149969 mapRes!10288))))

(declare-fun condMapEmpty!10288 () Bool)

(declare-fun mapDefault!10288 () ValueCell!2696)

(assert (=> b!231039 (= condMapEmpty!10288 (= (arr!5415 (_values!4288 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2696)) mapDefault!10288)))))

(declare-fun res!113545 () Bool)

(assert (=> start!22154 (=> (not res!113545) (not e!149968))))

(declare-fun valid!1323 (LongMapFixedSize!3292) Bool)

(assert (=> start!22154 (= res!113545 (valid!1323 thiss!1504))))

(assert (=> start!22154 e!149968))

(declare-fun e!149962 () Bool)

(assert (=> start!22154 e!149962))

(assert (=> start!22154 true))

(assert (=> start!22154 tp_is_empty!6079))

(declare-fun b!231040 () Bool)

(declare-datatypes ((Unit!7075 0))(
  ( (Unit!7076) )
))
(declare-fun e!149970 () Unit!7075)

(declare-fun Unit!7077 () Unit!7075)

(assert (=> b!231040 (= e!149970 Unit!7077)))

(declare-fun bm!21458 () Bool)

(declare-fun arrayContainsKey!0 (array!11395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21458 (= call!21462 (arrayContainsKey!0 (_keys!6358 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231041 () Bool)

(declare-fun Unit!7078 () Unit!7075)

(assert (=> b!231041 (= e!149970 Unit!7078)))

(declare-fun lt!116313 () Unit!7075)

(declare-fun lemmaArrayContainsKeyThenInListMap!140 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) (_ BitVec 32) Int) Unit!7075)

(assert (=> b!231041 (= lt!116313 (lemmaArrayContainsKeyThenInListMap!140 (_keys!6358 thiss!1504) (_values!4288 thiss!1504) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231041 false))

(declare-fun b!231042 () Bool)

(declare-fun e!149965 () Bool)

(assert (=> b!231042 (= e!149963 e!149965)))

(declare-fun res!113541 () Bool)

(assert (=> b!231042 (=> (not res!113541) (not e!149965))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231042 (= res!113541 (inRange!0 index!297 (mask!10204 thiss!1504)))))

(declare-fun lt!116306 () Unit!7075)

(declare-fun e!149971 () Unit!7075)

(assert (=> b!231042 (= lt!116306 e!149971)))

(declare-fun c!38374 () Bool)

(declare-datatypes ((tuple2!4522 0))(
  ( (tuple2!4523 (_1!2272 (_ BitVec 64)) (_2!2272 V!7753)) )
))
(declare-datatypes ((List!3460 0))(
  ( (Nil!3457) (Cons!3456 (h!4104 tuple2!4522) (t!8410 List!3460)) )
))
(declare-datatypes ((ListLongMap!3425 0))(
  ( (ListLongMap!3426 (toList!1728 List!3460)) )
))
(declare-fun lt!116317 () ListLongMap!3425)

(declare-fun contains!1601 (ListLongMap!3425 (_ BitVec 64)) Bool)

(assert (=> b!231042 (= c!38374 (contains!1601 lt!116317 key!932))))

(declare-fun getCurrentListMap!1237 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) Int) ListLongMap!3425)

(assert (=> b!231042 (= lt!116317 (getCurrentListMap!1237 (_keys!6358 thiss!1504) (_values!4288 thiss!1504) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(declare-fun b!231043 () Bool)

(declare-fun e!149960 () Bool)

(assert (=> b!231043 (= e!149960 tp_is_empty!6079)))

(declare-fun b!231044 () Bool)

(declare-fun Unit!7079 () Unit!7075)

(assert (=> b!231044 (= e!149971 Unit!7079)))

(declare-fun lt!116310 () Unit!7075)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) Int) Unit!7075)

(assert (=> b!231044 (= lt!116310 (lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (_keys!6358 thiss!1504) (_values!4288 thiss!1504) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231044 false))

(declare-fun b!231045 () Bool)

(assert (=> b!231045 (= e!149965 (not true))))

(declare-fun lt!116309 () array!11395)

(declare-fun arrayCountValidKeys!0 (array!11395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231045 (= (arrayCountValidKeys!0 lt!116309 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116312 () Unit!7075)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11395 (_ BitVec 32)) Unit!7075)

(assert (=> b!231045 (= lt!116312 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116309 index!297))))

(assert (=> b!231045 (arrayContainsKey!0 lt!116309 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116314 () Unit!7075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11395 (_ BitVec 64) (_ BitVec 32)) Unit!7075)

(assert (=> b!231045 (= lt!116314 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116309 key!932 index!297))))

(declare-fun v!346 () V!7753)

(declare-fun +!614 (ListLongMap!3425 tuple2!4522) ListLongMap!3425)

(assert (=> b!231045 (= (+!614 lt!116317 (tuple2!4523 key!932 v!346)) (getCurrentListMap!1237 lt!116309 (array!11394 (store (arr!5415 (_values!4288 thiss!1504)) index!297 (ValueCellFull!2696 v!346)) (size!5749 (_values!4288 thiss!1504))) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(declare-fun lt!116307 () Unit!7075)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!69 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) (_ BitVec 64) V!7753 Int) Unit!7075)

(assert (=> b!231045 (= lt!116307 (lemmaAddValidKeyToArrayThenAddPairToListMap!69 (_keys!6358 thiss!1504) (_values!4288 thiss!1504) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) index!297 key!932 v!346 (defaultEntry!4305 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11395 (_ BitVec 32)) Bool)

(assert (=> b!231045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116309 (mask!10204 thiss!1504))))

(declare-fun lt!116308 () Unit!7075)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11395 (_ BitVec 32) (_ BitVec 32)) Unit!7075)

(assert (=> b!231045 (= lt!116308 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6358 thiss!1504) index!297 (mask!10204 thiss!1504)))))

(assert (=> b!231045 (= (arrayCountValidKeys!0 lt!116309 #b00000000000000000000000000000000 (size!5750 (_keys!6358 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6358 thiss!1504) #b00000000000000000000000000000000 (size!5750 (_keys!6358 thiss!1504)))))))

(declare-fun lt!116316 () Unit!7075)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11395 (_ BitVec 32) (_ BitVec 64)) Unit!7075)

(assert (=> b!231045 (= lt!116316 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6358 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3461 0))(
  ( (Nil!3458) (Cons!3457 (h!4105 (_ BitVec 64)) (t!8411 List!3461)) )
))
(declare-fun arrayNoDuplicates!0 (array!11395 (_ BitVec 32) List!3461) Bool)

(assert (=> b!231045 (arrayNoDuplicates!0 lt!116309 #b00000000000000000000000000000000 Nil!3458)))

(assert (=> b!231045 (= lt!116309 (array!11396 (store (arr!5416 (_keys!6358 thiss!1504)) index!297 key!932) (size!5750 (_keys!6358 thiss!1504))))))

(declare-fun lt!116304 () Unit!7075)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3461) Unit!7075)

(assert (=> b!231045 (= lt!116304 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6358 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3458))))

(declare-fun lt!116315 () Unit!7075)

(assert (=> b!231045 (= lt!116315 e!149970)))

(declare-fun c!38372 () Bool)

(assert (=> b!231045 (= c!38372 (arrayContainsKey!0 (_keys!6358 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231046 () Bool)

(declare-fun res!113542 () Bool)

(assert (=> b!231046 (=> (not res!113542) (not e!149966))))

(declare-fun call!21461 () Bool)

(assert (=> b!231046 (= res!113542 call!21461)))

(declare-fun e!149961 () Bool)

(assert (=> b!231046 (= e!149961 e!149966)))

(declare-fun b!231047 () Bool)

(declare-fun e!149973 () Bool)

(get-info :version)

(assert (=> b!231047 (= e!149973 ((_ is Undefined!947) lt!116311))))

(declare-fun b!231048 () Bool)

(assert (=> b!231048 (= e!149966 (not call!21462))))

(declare-fun b!231049 () Bool)

(declare-fun lt!116305 () Unit!7075)

(assert (=> b!231049 (= e!149971 lt!116305)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!297 (array!11395 array!11393 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) Int) Unit!7075)

(assert (=> b!231049 (= lt!116305 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!297 (_keys!6358 thiss!1504) (_values!4288 thiss!1504) (mask!10204 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 (defaultEntry!4305 thiss!1504)))))

(declare-fun c!38373 () Bool)

(assert (=> b!231049 (= c!38373 ((_ is MissingZero!947) lt!116311))))

(assert (=> b!231049 e!149961))

(declare-fun mapNonEmpty!10288 () Bool)

(declare-fun tp!21792 () Bool)

(assert (=> mapNonEmpty!10288 (= mapRes!10288 (and tp!21792 e!149960))))

(declare-fun mapKey!10288 () (_ BitVec 32))

(declare-fun mapValue!10288 () ValueCell!2696)

(declare-fun mapRest!10288 () (Array (_ BitVec 32) ValueCell!2696))

(assert (=> mapNonEmpty!10288 (= (arr!5415 (_values!4288 thiss!1504)) (store mapRest!10288 mapKey!10288 mapValue!10288))))

(declare-fun mapIsEmpty!10288 () Bool)

(assert (=> mapIsEmpty!10288 mapRes!10288))

(declare-fun bm!21459 () Bool)

(assert (=> bm!21459 (= call!21461 (inRange!0 (ite c!38373 (index!5958 lt!116311) (index!5961 lt!116311)) (mask!10204 thiss!1504)))))

(declare-fun array_inv!3573 (array!11395) Bool)

(declare-fun array_inv!3574 (array!11393) Bool)

(assert (=> b!231050 (= e!149962 (and tp!21793 tp_is_empty!6079 (array_inv!3573 (_keys!6358 thiss!1504)) (array_inv!3574 (_values!4288 thiss!1504)) e!149967))))

(declare-fun b!231051 () Bool)

(declare-fun c!38371 () Bool)

(assert (=> b!231051 (= c!38371 ((_ is MissingVacant!947) lt!116311))))

(assert (=> b!231051 (= e!149961 e!149973)))

(declare-fun b!231052 () Bool)

(assert (=> b!231052 (= e!149973 e!149964)))

(declare-fun res!113539 () Bool)

(assert (=> b!231052 (= res!113539 call!21461)))

(assert (=> b!231052 (=> (not res!113539) (not e!149964))))

(assert (= (and start!22154 res!113545) b!231036))

(assert (= (and b!231036 res!113543) b!231033))

(assert (= (and b!231033 res!113546) b!231042))

(assert (= (and b!231042 c!38374) b!231044))

(assert (= (and b!231042 (not c!38374)) b!231049))

(assert (= (and b!231049 c!38373) b!231046))

(assert (= (and b!231049 (not c!38373)) b!231051))

(assert (= (and b!231046 res!113542) b!231038))

(assert (= (and b!231038 res!113544) b!231048))

(assert (= (and b!231051 c!38371) b!231052))

(assert (= (and b!231051 (not c!38371)) b!231047))

(assert (= (and b!231052 res!113539) b!231034))

(assert (= (and b!231034 res!113540) b!231037))

(assert (= (or b!231046 b!231052) bm!21459))

(assert (= (or b!231048 b!231037) bm!21458))

(assert (= (and b!231042 res!113541) b!231045))

(assert (= (and b!231045 c!38372) b!231041))

(assert (= (and b!231045 (not c!38372)) b!231040))

(assert (= (and b!231039 condMapEmpty!10288) mapIsEmpty!10288))

(assert (= (and b!231039 (not condMapEmpty!10288)) mapNonEmpty!10288))

(assert (= (and mapNonEmpty!10288 ((_ is ValueCellFull!2696) mapValue!10288)) b!231043))

(assert (= (and b!231039 ((_ is ValueCellFull!2696) mapDefault!10288)) b!231035))

(assert (= b!231050 b!231039))

(assert (= start!22154 b!231050))

(declare-fun m!251947 () Bool)

(assert (=> b!231042 m!251947))

(declare-fun m!251949 () Bool)

(assert (=> b!231042 m!251949))

(declare-fun m!251951 () Bool)

(assert (=> b!231042 m!251951))

(declare-fun m!251953 () Bool)

(assert (=> b!231050 m!251953))

(declare-fun m!251955 () Bool)

(assert (=> b!231050 m!251955))

(declare-fun m!251957 () Bool)

(assert (=> mapNonEmpty!10288 m!251957))

(declare-fun m!251959 () Bool)

(assert (=> b!231044 m!251959))

(declare-fun m!251961 () Bool)

(assert (=> start!22154 m!251961))

(declare-fun m!251963 () Bool)

(assert (=> b!231034 m!251963))

(declare-fun m!251965 () Bool)

(assert (=> bm!21459 m!251965))

(declare-fun m!251967 () Bool)

(assert (=> b!231033 m!251967))

(declare-fun m!251969 () Bool)

(assert (=> b!231049 m!251969))

(declare-fun m!251971 () Bool)

(assert (=> b!231045 m!251971))

(declare-fun m!251973 () Bool)

(assert (=> b!231045 m!251973))

(declare-fun m!251975 () Bool)

(assert (=> b!231045 m!251975))

(declare-fun m!251977 () Bool)

(assert (=> b!231045 m!251977))

(declare-fun m!251979 () Bool)

(assert (=> b!231045 m!251979))

(declare-fun m!251981 () Bool)

(assert (=> b!231045 m!251981))

(declare-fun m!251983 () Bool)

(assert (=> b!231045 m!251983))

(declare-fun m!251985 () Bool)

(assert (=> b!231045 m!251985))

(declare-fun m!251987 () Bool)

(assert (=> b!231045 m!251987))

(declare-fun m!251989 () Bool)

(assert (=> b!231045 m!251989))

(declare-fun m!251991 () Bool)

(assert (=> b!231045 m!251991))

(declare-fun m!251993 () Bool)

(assert (=> b!231045 m!251993))

(declare-fun m!251995 () Bool)

(assert (=> b!231045 m!251995))

(declare-fun m!251997 () Bool)

(assert (=> b!231045 m!251997))

(declare-fun m!251999 () Bool)

(assert (=> b!231045 m!251999))

(declare-fun m!252001 () Bool)

(assert (=> b!231045 m!252001))

(declare-fun m!252003 () Bool)

(assert (=> b!231045 m!252003))

(assert (=> bm!21458 m!251989))

(declare-fun m!252005 () Bool)

(assert (=> b!231041 m!252005))

(declare-fun m!252007 () Bool)

(assert (=> b!231038 m!252007))

(check-sat (not mapNonEmpty!10288) (not b!231049) (not bm!21459) (not bm!21458) (not b!231033) (not b_next!6217) (not start!22154) b_and!13089 (not b!231042) (not b!231044) (not b!231045) tp_is_empty!6079 (not b!231050) (not b!231041))
(check-sat b_and!13089 (not b_next!6217))
