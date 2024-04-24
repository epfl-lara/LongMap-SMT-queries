; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18388 () Bool)

(assert start!18388)

(declare-fun b!182394 () Bool)

(declare-fun b_free!4495 () Bool)

(declare-fun b_next!4495 () Bool)

(assert (=> b!182394 (= b_free!4495 (not b_next!4495))))

(declare-fun tp!16244 () Bool)

(declare-fun b_and!11071 () Bool)

(assert (=> b!182394 (= tp!16244 b_and!11071)))

(declare-fun b!182389 () Bool)

(declare-fun e!120097 () Bool)

(declare-fun e!120092 () Bool)

(declare-fun mapRes!7322 () Bool)

(assert (=> b!182389 (= e!120097 (and e!120092 mapRes!7322))))

(declare-fun condMapEmpty!7322 () Bool)

(declare-datatypes ((V!5337 0))(
  ( (V!5338 (val!2178 Int)) )
))
(declare-datatypes ((ValueCell!1790 0))(
  ( (ValueCellFull!1790 (v!4078 V!5337)) (EmptyCell!1790) )
))
(declare-datatypes ((array!7705 0))(
  ( (array!7706 (arr!3644 (Array (_ BitVec 32) (_ BitVec 64))) (size!3956 (_ BitVec 32))) )
))
(declare-datatypes ((array!7707 0))(
  ( (array!7708 (arr!3645 (Array (_ BitVec 32) ValueCell!1790)) (size!3957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2488 0))(
  ( (LongMapFixedSize!2489 (defaultEntry!3730 Int) (mask!8771 (_ BitVec 32)) (extraKeys!3467 (_ BitVec 32)) (zeroValue!3571 V!5337) (minValue!3571 V!5337) (_size!1293 (_ BitVec 32)) (_keys!5641 array!7705) (_values!3713 array!7707) (_vacant!1293 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2488)

(declare-fun mapDefault!7322 () ValueCell!1790)

(assert (=> b!182389 (= condMapEmpty!7322 (= (arr!3645 (_values!3713 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1790)) mapDefault!7322)))))

(declare-fun b!182390 () Bool)

(declare-fun e!120093 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7705 (_ BitVec 32)) Bool)

(assert (=> b!182390 (= e!120093 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5641 thiss!1248) (mask!8771 thiss!1248))))))

(declare-fun b!182391 () Bool)

(declare-fun tp_is_empty!4267 () Bool)

(assert (=> b!182391 (= e!120092 tp_is_empty!4267)))

(declare-fun b!182392 () Bool)

(declare-fun res!86315 () Bool)

(assert (=> b!182392 (=> (not res!86315) (not e!120093))))

(assert (=> b!182392 (= res!86315 (and (= (size!3957 (_values!3713 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8771 thiss!1248))) (= (size!3956 (_keys!5641 thiss!1248)) (size!3957 (_values!3713 thiss!1248))) (bvsge (mask!8771 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3467 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3467 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182393 () Bool)

(declare-fun e!120098 () Bool)

(assert (=> b!182393 (= e!120098 e!120093)))

(declare-fun res!86312 () Bool)

(assert (=> b!182393 (=> (not res!86312) (not e!120093))))

(declare-datatypes ((SeekEntryResult!597 0))(
  ( (MissingZero!597 (index!4558 (_ BitVec 32))) (Found!597 (index!4559 (_ BitVec 32))) (Intermediate!597 (undefined!1409 Bool) (index!4560 (_ BitVec 32)) (x!19871 (_ BitVec 32))) (Undefined!597) (MissingVacant!597 (index!4561 (_ BitVec 32))) )
))
(declare-fun lt!90249 () SeekEntryResult!597)

(get-info :version)

(assert (=> b!182393 (= res!86312 (and (not ((_ is Undefined!597) lt!90249)) (not ((_ is MissingVacant!597) lt!90249)) (not ((_ is MissingZero!597) lt!90249)) ((_ is Found!597) lt!90249)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7705 (_ BitVec 32)) SeekEntryResult!597)

(assert (=> b!182393 (= lt!90249 (seekEntryOrOpen!0 key!828 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(declare-fun e!120096 () Bool)

(declare-fun array_inv!2351 (array!7705) Bool)

(declare-fun array_inv!2352 (array!7707) Bool)

(assert (=> b!182394 (= e!120096 (and tp!16244 tp_is_empty!4267 (array_inv!2351 (_keys!5641 thiss!1248)) (array_inv!2352 (_values!3713 thiss!1248)) e!120097))))

(declare-fun mapIsEmpty!7322 () Bool)

(assert (=> mapIsEmpty!7322 mapRes!7322))

(declare-fun b!182395 () Bool)

(declare-fun e!120094 () Bool)

(assert (=> b!182395 (= e!120094 tp_is_empty!4267)))

(declare-fun mapNonEmpty!7322 () Bool)

(declare-fun tp!16243 () Bool)

(assert (=> mapNonEmpty!7322 (= mapRes!7322 (and tp!16243 e!120094))))

(declare-fun mapValue!7322 () ValueCell!1790)

(declare-fun mapRest!7322 () (Array (_ BitVec 32) ValueCell!1790))

(declare-fun mapKey!7322 () (_ BitVec 32))

(assert (=> mapNonEmpty!7322 (= (arr!3645 (_values!3713 thiss!1248)) (store mapRest!7322 mapKey!7322 mapValue!7322))))

(declare-fun b!182396 () Bool)

(declare-fun res!86311 () Bool)

(assert (=> b!182396 (=> (not res!86311) (not e!120093))))

(declare-datatypes ((tuple2!3342 0))(
  ( (tuple2!3343 (_1!1682 (_ BitVec 64)) (_2!1682 V!5337)) )
))
(declare-datatypes ((List!2283 0))(
  ( (Nil!2280) (Cons!2279 (h!2908 tuple2!3342) (t!7135 List!2283)) )
))
(declare-datatypes ((ListLongMap!2263 0))(
  ( (ListLongMap!2264 (toList!1147 List!2283)) )
))
(declare-fun contains!1243 (ListLongMap!2263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!799 (array!7705 array!7707 (_ BitVec 32) (_ BitVec 32) V!5337 V!5337 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> b!182396 (= res!86311 (contains!1243 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) key!828))))

(declare-fun b!182397 () Bool)

(declare-fun res!86316 () Bool)

(assert (=> b!182397 (=> (not res!86316) (not e!120093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182397 (= res!86316 (validMask!0 (mask!8771 thiss!1248)))))

(declare-fun res!86314 () Bool)

(assert (=> start!18388 (=> (not res!86314) (not e!120098))))

(declare-fun valid!1053 (LongMapFixedSize!2488) Bool)

(assert (=> start!18388 (= res!86314 (valid!1053 thiss!1248))))

(assert (=> start!18388 e!120098))

(assert (=> start!18388 e!120096))

(assert (=> start!18388 true))

(declare-fun b!182398 () Bool)

(declare-fun res!86313 () Bool)

(assert (=> b!182398 (=> (not res!86313) (not e!120098))))

(assert (=> b!182398 (= res!86313 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18388 res!86314) b!182398))

(assert (= (and b!182398 res!86313) b!182393))

(assert (= (and b!182393 res!86312) b!182396))

(assert (= (and b!182396 res!86311) b!182397))

(assert (= (and b!182397 res!86316) b!182392))

(assert (= (and b!182392 res!86315) b!182390))

(assert (= (and b!182389 condMapEmpty!7322) mapIsEmpty!7322))

(assert (= (and b!182389 (not condMapEmpty!7322)) mapNonEmpty!7322))

(assert (= (and mapNonEmpty!7322 ((_ is ValueCellFull!1790) mapValue!7322)) b!182395))

(assert (= (and b!182389 ((_ is ValueCellFull!1790) mapDefault!7322)) b!182391))

(assert (= b!182394 b!182389))

(assert (= start!18388 b!182394))

(declare-fun m!210343 () Bool)

(assert (=> b!182394 m!210343))

(declare-fun m!210345 () Bool)

(assert (=> b!182394 m!210345))

(declare-fun m!210347 () Bool)

(assert (=> mapNonEmpty!7322 m!210347))

(declare-fun m!210349 () Bool)

(assert (=> b!182393 m!210349))

(declare-fun m!210351 () Bool)

(assert (=> b!182390 m!210351))

(declare-fun m!210353 () Bool)

(assert (=> start!18388 m!210353))

(declare-fun m!210355 () Bool)

(assert (=> b!182396 m!210355))

(assert (=> b!182396 m!210355))

(declare-fun m!210357 () Bool)

(assert (=> b!182396 m!210357))

(declare-fun m!210359 () Bool)

(assert (=> b!182397 m!210359))

(check-sat (not b!182390) (not mapNonEmpty!7322) (not b_next!4495) (not b!182393) b_and!11071 (not start!18388) (not b!182396) (not b!182397) tp_is_empty!4267 (not b!182394))
(check-sat b_and!11071 (not b_next!4495))
(get-model)

(declare-fun b!182471 () Bool)

(declare-fun e!120147 () SeekEntryResult!597)

(declare-fun lt!90262 () SeekEntryResult!597)

(assert (=> b!182471 (= e!120147 (MissingZero!597 (index!4560 lt!90262)))))

(declare-fun b!182472 () Bool)

(declare-fun e!120149 () SeekEntryResult!597)

(assert (=> b!182472 (= e!120149 Undefined!597)))

(declare-fun d!54699 () Bool)

(declare-fun lt!90264 () SeekEntryResult!597)

(assert (=> d!54699 (and (or ((_ is Undefined!597) lt!90264) (not ((_ is Found!597) lt!90264)) (and (bvsge (index!4559 lt!90264) #b00000000000000000000000000000000) (bvslt (index!4559 lt!90264) (size!3956 (_keys!5641 thiss!1248))))) (or ((_ is Undefined!597) lt!90264) ((_ is Found!597) lt!90264) (not ((_ is MissingZero!597) lt!90264)) (and (bvsge (index!4558 lt!90264) #b00000000000000000000000000000000) (bvslt (index!4558 lt!90264) (size!3956 (_keys!5641 thiss!1248))))) (or ((_ is Undefined!597) lt!90264) ((_ is Found!597) lt!90264) ((_ is MissingZero!597) lt!90264) (not ((_ is MissingVacant!597) lt!90264)) (and (bvsge (index!4561 lt!90264) #b00000000000000000000000000000000) (bvslt (index!4561 lt!90264) (size!3956 (_keys!5641 thiss!1248))))) (or ((_ is Undefined!597) lt!90264) (ite ((_ is Found!597) lt!90264) (= (select (arr!3644 (_keys!5641 thiss!1248)) (index!4559 lt!90264)) key!828) (ite ((_ is MissingZero!597) lt!90264) (= (select (arr!3644 (_keys!5641 thiss!1248)) (index!4558 lt!90264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!597) lt!90264) (= (select (arr!3644 (_keys!5641 thiss!1248)) (index!4561 lt!90264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54699 (= lt!90264 e!120149)))

(declare-fun c!32733 () Bool)

(assert (=> d!54699 (= c!32733 (and ((_ is Intermediate!597) lt!90262) (undefined!1409 lt!90262)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7705 (_ BitVec 32)) SeekEntryResult!597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54699 (= lt!90262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8771 thiss!1248)) key!828 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(assert (=> d!54699 (validMask!0 (mask!8771 thiss!1248))))

(assert (=> d!54699 (= (seekEntryOrOpen!0 key!828 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)) lt!90264)))

(declare-fun b!182473 () Bool)

(declare-fun e!120148 () SeekEntryResult!597)

(assert (=> b!182473 (= e!120148 (Found!597 (index!4560 lt!90262)))))

(declare-fun b!182474 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7705 (_ BitVec 32)) SeekEntryResult!597)

(assert (=> b!182474 (= e!120147 (seekKeyOrZeroReturnVacant!0 (x!19871 lt!90262) (index!4560 lt!90262) (index!4560 lt!90262) key!828 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(declare-fun b!182475 () Bool)

(assert (=> b!182475 (= e!120149 e!120148)))

(declare-fun lt!90263 () (_ BitVec 64))

(assert (=> b!182475 (= lt!90263 (select (arr!3644 (_keys!5641 thiss!1248)) (index!4560 lt!90262)))))

(declare-fun c!32734 () Bool)

(assert (=> b!182475 (= c!32734 (= lt!90263 key!828))))

(declare-fun b!182476 () Bool)

(declare-fun c!32732 () Bool)

(assert (=> b!182476 (= c!32732 (= lt!90263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182476 (= e!120148 e!120147)))

(assert (= (and d!54699 c!32733) b!182472))

(assert (= (and d!54699 (not c!32733)) b!182475))

(assert (= (and b!182475 c!32734) b!182473))

(assert (= (and b!182475 (not c!32734)) b!182476))

(assert (= (and b!182476 c!32732) b!182471))

(assert (= (and b!182476 (not c!32732)) b!182474))

(declare-fun m!210397 () Bool)

(assert (=> d!54699 m!210397))

(assert (=> d!54699 m!210359))

(declare-fun m!210399 () Bool)

(assert (=> d!54699 m!210399))

(declare-fun m!210401 () Bool)

(assert (=> d!54699 m!210401))

(declare-fun m!210403 () Bool)

(assert (=> d!54699 m!210403))

(assert (=> d!54699 m!210401))

(declare-fun m!210405 () Bool)

(assert (=> d!54699 m!210405))

(declare-fun m!210407 () Bool)

(assert (=> b!182474 m!210407))

(declare-fun m!210409 () Bool)

(assert (=> b!182475 m!210409))

(assert (=> b!182393 d!54699))

(declare-fun d!54701 () Bool)

(declare-fun e!120155 () Bool)

(assert (=> d!54701 e!120155))

(declare-fun res!86355 () Bool)

(assert (=> d!54701 (=> res!86355 e!120155)))

(declare-fun lt!90273 () Bool)

(assert (=> d!54701 (= res!86355 (not lt!90273))))

(declare-fun lt!90274 () Bool)

(assert (=> d!54701 (= lt!90273 lt!90274)))

(declare-datatypes ((Unit!5532 0))(
  ( (Unit!5533) )
))
(declare-fun lt!90276 () Unit!5532)

(declare-fun e!120154 () Unit!5532)

(assert (=> d!54701 (= lt!90276 e!120154)))

(declare-fun c!32737 () Bool)

(assert (=> d!54701 (= c!32737 lt!90274)))

(declare-fun containsKey!216 (List!2283 (_ BitVec 64)) Bool)

(assert (=> d!54701 (= lt!90274 (containsKey!216 (toList!1147 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(assert (=> d!54701 (= (contains!1243 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) key!828) lt!90273)))

(declare-fun b!182483 () Bool)

(declare-fun lt!90275 () Unit!5532)

(assert (=> b!182483 (= e!120154 lt!90275)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!164 (List!2283 (_ BitVec 64)) Unit!5532)

(assert (=> b!182483 (= lt!90275 (lemmaContainsKeyImpliesGetValueByKeyDefined!164 (toList!1147 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(declare-datatypes ((Option!219 0))(
  ( (Some!218 (v!4081 V!5337)) (None!217) )
))
(declare-fun isDefined!165 (Option!219) Bool)

(declare-fun getValueByKey!213 (List!2283 (_ BitVec 64)) Option!219)

(assert (=> b!182483 (isDefined!165 (getValueByKey!213 (toList!1147 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828))))

(declare-fun b!182484 () Bool)

(declare-fun Unit!5534 () Unit!5532)

(assert (=> b!182484 (= e!120154 Unit!5534)))

(declare-fun b!182485 () Bool)

(assert (=> b!182485 (= e!120155 (isDefined!165 (getValueByKey!213 (toList!1147 (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248))) key!828)))))

(assert (= (and d!54701 c!32737) b!182483))

(assert (= (and d!54701 (not c!32737)) b!182484))

(assert (= (and d!54701 (not res!86355)) b!182485))

(declare-fun m!210411 () Bool)

(assert (=> d!54701 m!210411))

(declare-fun m!210413 () Bool)

(assert (=> b!182483 m!210413))

(declare-fun m!210415 () Bool)

(assert (=> b!182483 m!210415))

(assert (=> b!182483 m!210415))

(declare-fun m!210417 () Bool)

(assert (=> b!182483 m!210417))

(assert (=> b!182485 m!210415))

(assert (=> b!182485 m!210415))

(assert (=> b!182485 m!210417))

(assert (=> b!182396 d!54701))

(declare-fun bm!18409 () Bool)

(declare-fun call!18417 () ListLongMap!2263)

(declare-fun getCurrentListMapNoExtraKeys!186 (array!7705 array!7707 (_ BitVec 32) (_ BitVec 32) V!5337 V!5337 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> bm!18409 (= call!18417 (getCurrentListMapNoExtraKeys!186 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun bm!18410 () Bool)

(declare-fun call!18413 () ListLongMap!2263)

(declare-fun call!18414 () ListLongMap!2263)

(assert (=> bm!18410 (= call!18413 call!18414)))

(declare-fun b!182529 () Bool)

(declare-fun e!120193 () Bool)

(declare-fun e!120194 () Bool)

(assert (=> b!182529 (= e!120193 e!120194)))

(declare-fun res!86381 () Bool)

(declare-fun call!18416 () Bool)

(assert (=> b!182529 (= res!86381 call!18416)))

(assert (=> b!182529 (=> (not res!86381) (not e!120194))))

(declare-fun bm!18411 () Bool)

(declare-fun call!18418 () Bool)

(declare-fun lt!90336 () ListLongMap!2263)

(assert (=> bm!18411 (= call!18418 (contains!1243 lt!90336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182530 () Bool)

(declare-fun e!120188 () Bool)

(declare-fun apply!155 (ListLongMap!2263 (_ BitVec 64)) V!5337)

(assert (=> b!182530 (= e!120188 (= (apply!155 lt!90336 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3571 thiss!1248)))))

(declare-fun call!18412 () ListLongMap!2263)

(declare-fun call!18415 () ListLongMap!2263)

(declare-fun bm!18412 () Bool)

(declare-fun c!32751 () Bool)

(declare-fun c!32750 () Bool)

(declare-fun +!275 (ListLongMap!2263 tuple2!3342) ListLongMap!2263)

(assert (=> bm!18412 (= call!18414 (+!275 (ite c!32751 call!18417 (ite c!32750 call!18412 call!18415)) (ite (or c!32751 c!32750) (tuple2!3343 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3571 thiss!1248)) (tuple2!3343 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3571 thiss!1248)))))))

(declare-fun bm!18413 () Bool)

(assert (=> bm!18413 (= call!18412 call!18417)))

(declare-fun b!182531 () Bool)

(declare-fun e!120190 () ListLongMap!2263)

(assert (=> b!182531 (= e!120190 (+!275 call!18414 (tuple2!3343 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3571 thiss!1248))))))

(declare-fun b!182532 () Bool)

(declare-fun res!86376 () Bool)

(declare-fun e!120186 () Bool)

(assert (=> b!182532 (=> (not res!86376) (not e!120186))))

(declare-fun e!120183 () Bool)

(assert (=> b!182532 (= res!86376 e!120183)))

(declare-fun c!32753 () Bool)

(assert (=> b!182532 (= c!32753 (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182533 () Bool)

(declare-fun e!120184 () ListLongMap!2263)

(assert (=> b!182533 (= e!120184 call!18413)))

(declare-fun b!182534 () Bool)

(assert (=> b!182534 (= e!120184 call!18415)))

(declare-fun b!182535 () Bool)

(declare-fun e!120185 () ListLongMap!2263)

(assert (=> b!182535 (= e!120185 call!18413)))

(declare-fun b!182536 () Bool)

(declare-fun c!32755 () Bool)

(assert (=> b!182536 (= c!32755 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!182536 (= e!120185 e!120184)))

(declare-fun d!54703 () Bool)

(assert (=> d!54703 e!120186))

(declare-fun res!86379 () Bool)

(assert (=> d!54703 (=> (not res!86379) (not e!120186))))

(assert (=> d!54703 (= res!86379 (or (bvsge #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))))

(declare-fun lt!90335 () ListLongMap!2263)

(assert (=> d!54703 (= lt!90336 lt!90335)))

(declare-fun lt!90322 () Unit!5532)

(declare-fun e!120182 () Unit!5532)

(assert (=> d!54703 (= lt!90322 e!120182)))

(declare-fun c!32754 () Bool)

(declare-fun e!120191 () Bool)

(assert (=> d!54703 (= c!32754 e!120191)))

(declare-fun res!86380 () Bool)

(assert (=> d!54703 (=> (not res!86380) (not e!120191))))

(assert (=> d!54703 (= res!86380 (bvslt #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))

(assert (=> d!54703 (= lt!90335 e!120190)))

(assert (=> d!54703 (= c!32751 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54703 (validMask!0 (mask!8771 thiss!1248))))

(assert (=> d!54703 (= (getCurrentListMap!799 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)) lt!90336)))

(declare-fun b!182528 () Bool)

(assert (=> b!182528 (= e!120183 (not call!18418))))

(declare-fun b!182537 () Bool)

(assert (=> b!182537 (= e!120190 e!120185)))

(assert (=> b!182537 (= c!32750 (and (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182538 () Bool)

(declare-fun e!120189 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182538 (= e!120189 (validKeyInArray!0 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18414 () Bool)

(assert (=> bm!18414 (= call!18415 call!18412)))

(declare-fun b!182539 () Bool)

(assert (=> b!182539 (= e!120194 (= (apply!155 lt!90336 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3571 thiss!1248)))))

(declare-fun b!182540 () Bool)

(assert (=> b!182540 (= e!120191 (validKeyInArray!0 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182541 () Bool)

(declare-fun lt!90332 () Unit!5532)

(assert (=> b!182541 (= e!120182 lt!90332)))

(declare-fun lt!90323 () ListLongMap!2263)

(assert (=> b!182541 (= lt!90323 (getCurrentListMapNoExtraKeys!186 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90341 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90339 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90339 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90334 () Unit!5532)

(declare-fun addStillContains!131 (ListLongMap!2263 (_ BitVec 64) V!5337 (_ BitVec 64)) Unit!5532)

(assert (=> b!182541 (= lt!90334 (addStillContains!131 lt!90323 lt!90341 (zeroValue!3571 thiss!1248) lt!90339))))

(assert (=> b!182541 (contains!1243 (+!275 lt!90323 (tuple2!3343 lt!90341 (zeroValue!3571 thiss!1248))) lt!90339)))

(declare-fun lt!90338 () Unit!5532)

(assert (=> b!182541 (= lt!90338 lt!90334)))

(declare-fun lt!90326 () ListLongMap!2263)

(assert (=> b!182541 (= lt!90326 (getCurrentListMapNoExtraKeys!186 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90328 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90328 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90342 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90342 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90331 () Unit!5532)

(declare-fun addApplyDifferent!131 (ListLongMap!2263 (_ BitVec 64) V!5337 (_ BitVec 64)) Unit!5532)

(assert (=> b!182541 (= lt!90331 (addApplyDifferent!131 lt!90326 lt!90328 (minValue!3571 thiss!1248) lt!90342))))

(assert (=> b!182541 (= (apply!155 (+!275 lt!90326 (tuple2!3343 lt!90328 (minValue!3571 thiss!1248))) lt!90342) (apply!155 lt!90326 lt!90342))))

(declare-fun lt!90329 () Unit!5532)

(assert (=> b!182541 (= lt!90329 lt!90331)))

(declare-fun lt!90321 () ListLongMap!2263)

(assert (=> b!182541 (= lt!90321 (getCurrentListMapNoExtraKeys!186 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90330 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90325 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90325 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90324 () Unit!5532)

(assert (=> b!182541 (= lt!90324 (addApplyDifferent!131 lt!90321 lt!90330 (zeroValue!3571 thiss!1248) lt!90325))))

(assert (=> b!182541 (= (apply!155 (+!275 lt!90321 (tuple2!3343 lt!90330 (zeroValue!3571 thiss!1248))) lt!90325) (apply!155 lt!90321 lt!90325))))

(declare-fun lt!90337 () Unit!5532)

(assert (=> b!182541 (= lt!90337 lt!90324)))

(declare-fun lt!90327 () ListLongMap!2263)

(assert (=> b!182541 (= lt!90327 (getCurrentListMapNoExtraKeys!186 (_keys!5641 thiss!1248) (_values!3713 thiss!1248) (mask!8771 thiss!1248) (extraKeys!3467 thiss!1248) (zeroValue!3571 thiss!1248) (minValue!3571 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3730 thiss!1248)))))

(declare-fun lt!90333 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90333 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90340 () (_ BitVec 64))

(assert (=> b!182541 (= lt!90340 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182541 (= lt!90332 (addApplyDifferent!131 lt!90327 lt!90333 (minValue!3571 thiss!1248) lt!90340))))

(assert (=> b!182541 (= (apply!155 (+!275 lt!90327 (tuple2!3343 lt!90333 (minValue!3571 thiss!1248))) lt!90340) (apply!155 lt!90327 lt!90340))))

(declare-fun b!182542 () Bool)

(declare-fun e!120187 () Bool)

(declare-fun e!120192 () Bool)

(assert (=> b!182542 (= e!120187 e!120192)))

(declare-fun res!86377 () Bool)

(assert (=> b!182542 (=> (not res!86377) (not e!120192))))

(assert (=> b!182542 (= res!86377 (contains!1243 lt!90336 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))

(declare-fun b!182543 () Bool)

(assert (=> b!182543 (= e!120193 (not call!18416))))

(declare-fun b!182544 () Bool)

(declare-fun get!2100 (ValueCell!1790 V!5337) V!5337)

(declare-fun dynLambda!498 (Int (_ BitVec 64)) V!5337)

(assert (=> b!182544 (= e!120192 (= (apply!155 lt!90336 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000)) (get!2100 (select (arr!3645 (_values!3713 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!498 (defaultEntry!3730 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3957 (_values!3713 thiss!1248))))))

(assert (=> b!182544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))

(declare-fun bm!18415 () Bool)

(assert (=> bm!18415 (= call!18416 (contains!1243 lt!90336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182545 () Bool)

(declare-fun res!86375 () Bool)

(assert (=> b!182545 (=> (not res!86375) (not e!120186))))

(assert (=> b!182545 (= res!86375 e!120187)))

(declare-fun res!86378 () Bool)

(assert (=> b!182545 (=> res!86378 e!120187)))

(assert (=> b!182545 (= res!86378 (not e!120189))))

(declare-fun res!86374 () Bool)

(assert (=> b!182545 (=> (not res!86374) (not e!120189))))

(assert (=> b!182545 (= res!86374 (bvslt #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))

(declare-fun b!182546 () Bool)

(assert (=> b!182546 (= e!120183 e!120188)))

(declare-fun res!86382 () Bool)

(assert (=> b!182546 (= res!86382 call!18418)))

(assert (=> b!182546 (=> (not res!86382) (not e!120188))))

(declare-fun b!182547 () Bool)

(declare-fun Unit!5535 () Unit!5532)

(assert (=> b!182547 (= e!120182 Unit!5535)))

(declare-fun b!182548 () Bool)

(assert (=> b!182548 (= e!120186 e!120193)))

(declare-fun c!32752 () Bool)

(assert (=> b!182548 (= c!32752 (not (= (bvand (extraKeys!3467 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!54703 c!32751) b!182531))

(assert (= (and d!54703 (not c!32751)) b!182537))

(assert (= (and b!182537 c!32750) b!182535))

(assert (= (and b!182537 (not c!32750)) b!182536))

(assert (= (and b!182536 c!32755) b!182533))

(assert (= (and b!182536 (not c!32755)) b!182534))

(assert (= (or b!182533 b!182534) bm!18414))

(assert (= (or b!182535 bm!18414) bm!18413))

(assert (= (or b!182535 b!182533) bm!18410))

(assert (= (or b!182531 bm!18413) bm!18409))

(assert (= (or b!182531 bm!18410) bm!18412))

(assert (= (and d!54703 res!86380) b!182540))

(assert (= (and d!54703 c!32754) b!182541))

(assert (= (and d!54703 (not c!32754)) b!182547))

(assert (= (and d!54703 res!86379) b!182545))

(assert (= (and b!182545 res!86374) b!182538))

(assert (= (and b!182545 (not res!86378)) b!182542))

(assert (= (and b!182542 res!86377) b!182544))

(assert (= (and b!182545 res!86375) b!182532))

(assert (= (and b!182532 c!32753) b!182546))

(assert (= (and b!182532 (not c!32753)) b!182528))

(assert (= (and b!182546 res!86382) b!182530))

(assert (= (or b!182546 b!182528) bm!18411))

(assert (= (and b!182532 res!86376) b!182548))

(assert (= (and b!182548 c!32752) b!182529))

(assert (= (and b!182548 (not c!32752)) b!182543))

(assert (= (and b!182529 res!86381) b!182539))

(assert (= (or b!182529 b!182543) bm!18415))

(declare-fun b_lambda!7197 () Bool)

(assert (=> (not b_lambda!7197) (not b!182544)))

(declare-fun t!7137 () Bool)

(declare-fun tb!2813 () Bool)

(assert (=> (and b!182394 (= (defaultEntry!3730 thiss!1248) (defaultEntry!3730 thiss!1248)) t!7137) tb!2813))

(declare-fun result!4733 () Bool)

(assert (=> tb!2813 (= result!4733 tp_is_empty!4267)))

(assert (=> b!182544 t!7137))

(declare-fun b_and!11077 () Bool)

(assert (= b_and!11071 (and (=> t!7137 result!4733) b_and!11077)))

(declare-fun m!210419 () Bool)

(assert (=> b!182539 m!210419))

(declare-fun m!210421 () Bool)

(assert (=> b!182540 m!210421))

(assert (=> b!182540 m!210421))

(declare-fun m!210423 () Bool)

(assert (=> b!182540 m!210423))

(declare-fun m!210425 () Bool)

(assert (=> bm!18412 m!210425))

(declare-fun m!210427 () Bool)

(assert (=> b!182530 m!210427))

(assert (=> b!182538 m!210421))

(assert (=> b!182538 m!210421))

(assert (=> b!182538 m!210423))

(declare-fun m!210429 () Bool)

(assert (=> b!182531 m!210429))

(declare-fun m!210431 () Bool)

(assert (=> bm!18411 m!210431))

(assert (=> d!54703 m!210359))

(declare-fun m!210433 () Bool)

(assert (=> b!182544 m!210433))

(declare-fun m!210435 () Bool)

(assert (=> b!182544 m!210435))

(assert (=> b!182544 m!210435))

(assert (=> b!182544 m!210433))

(declare-fun m!210437 () Bool)

(assert (=> b!182544 m!210437))

(assert (=> b!182544 m!210421))

(declare-fun m!210439 () Bool)

(assert (=> b!182544 m!210439))

(assert (=> b!182544 m!210421))

(declare-fun m!210441 () Bool)

(assert (=> bm!18409 m!210441))

(assert (=> b!182542 m!210421))

(assert (=> b!182542 m!210421))

(declare-fun m!210443 () Bool)

(assert (=> b!182542 m!210443))

(declare-fun m!210445 () Bool)

(assert (=> b!182541 m!210445))

(assert (=> b!182541 m!210441))

(declare-fun m!210447 () Bool)

(assert (=> b!182541 m!210447))

(declare-fun m!210449 () Bool)

(assert (=> b!182541 m!210449))

(declare-fun m!210451 () Bool)

(assert (=> b!182541 m!210451))

(declare-fun m!210453 () Bool)

(assert (=> b!182541 m!210453))

(declare-fun m!210455 () Bool)

(assert (=> b!182541 m!210455))

(assert (=> b!182541 m!210451))

(declare-fun m!210457 () Bool)

(assert (=> b!182541 m!210457))

(assert (=> b!182541 m!210445))

(declare-fun m!210459 () Bool)

(assert (=> b!182541 m!210459))

(declare-fun m!210461 () Bool)

(assert (=> b!182541 m!210461))

(assert (=> b!182541 m!210449))

(declare-fun m!210463 () Bool)

(assert (=> b!182541 m!210463))

(declare-fun m!210465 () Bool)

(assert (=> b!182541 m!210465))

(declare-fun m!210467 () Bool)

(assert (=> b!182541 m!210467))

(assert (=> b!182541 m!210461))

(declare-fun m!210469 () Bool)

(assert (=> b!182541 m!210469))

(declare-fun m!210471 () Bool)

(assert (=> b!182541 m!210471))

(declare-fun m!210473 () Bool)

(assert (=> b!182541 m!210473))

(assert (=> b!182541 m!210421))

(declare-fun m!210475 () Bool)

(assert (=> bm!18415 m!210475))

(assert (=> b!182396 d!54703))

(declare-fun d!54705 () Bool)

(declare-fun res!86389 () Bool)

(declare-fun e!120197 () Bool)

(assert (=> d!54705 (=> (not res!86389) (not e!120197))))

(declare-fun simpleValid!171 (LongMapFixedSize!2488) Bool)

(assert (=> d!54705 (= res!86389 (simpleValid!171 thiss!1248))))

(assert (=> d!54705 (= (valid!1053 thiss!1248) e!120197)))

(declare-fun b!182557 () Bool)

(declare-fun res!86390 () Bool)

(assert (=> b!182557 (=> (not res!86390) (not e!120197))))

(declare-fun arrayCountValidKeys!0 (array!7705 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182557 (= res!86390 (= (arrayCountValidKeys!0 (_keys!5641 thiss!1248) #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))) (_size!1293 thiss!1248)))))

(declare-fun b!182558 () Bool)

(declare-fun res!86391 () Bool)

(assert (=> b!182558 (=> (not res!86391) (not e!120197))))

(assert (=> b!182558 (= res!86391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(declare-fun b!182559 () Bool)

(declare-datatypes ((List!2284 0))(
  ( (Nil!2281) (Cons!2280 (h!2909 (_ BitVec 64)) (t!7138 List!2284)) )
))
(declare-fun arrayNoDuplicates!0 (array!7705 (_ BitVec 32) List!2284) Bool)

(assert (=> b!182559 (= e!120197 (arrayNoDuplicates!0 (_keys!5641 thiss!1248) #b00000000000000000000000000000000 Nil!2281))))

(assert (= (and d!54705 res!86389) b!182557))

(assert (= (and b!182557 res!86390) b!182558))

(assert (= (and b!182558 res!86391) b!182559))

(declare-fun m!210477 () Bool)

(assert (=> d!54705 m!210477))

(declare-fun m!210479 () Bool)

(assert (=> b!182557 m!210479))

(assert (=> b!182558 m!210351))

(declare-fun m!210481 () Bool)

(assert (=> b!182559 m!210481))

(assert (=> start!18388 d!54705))

(declare-fun b!182568 () Bool)

(declare-fun e!120204 () Bool)

(declare-fun e!120206 () Bool)

(assert (=> b!182568 (= e!120204 e!120206)))

(declare-fun lt!90349 () (_ BitVec 64))

(assert (=> b!182568 (= lt!90349 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90350 () Unit!5532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7705 (_ BitVec 64) (_ BitVec 32)) Unit!5532)

(assert (=> b!182568 (= lt!90350 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5641 thiss!1248) lt!90349 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182568 (arrayContainsKey!0 (_keys!5641 thiss!1248) lt!90349 #b00000000000000000000000000000000)))

(declare-fun lt!90351 () Unit!5532)

(assert (=> b!182568 (= lt!90351 lt!90350)))

(declare-fun res!86396 () Bool)

(assert (=> b!182568 (= res!86396 (= (seekEntryOrOpen!0 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000) (_keys!5641 thiss!1248) (mask!8771 thiss!1248)) (Found!597 #b00000000000000000000000000000000)))))

(assert (=> b!182568 (=> (not res!86396) (not e!120206))))

(declare-fun b!182569 () Bool)

(declare-fun e!120205 () Bool)

(assert (=> b!182569 (= e!120205 e!120204)))

(declare-fun c!32758 () Bool)

(assert (=> b!182569 (= c!32758 (validKeyInArray!0 (select (arr!3644 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182570 () Bool)

(declare-fun call!18421 () Bool)

(assert (=> b!182570 (= e!120204 call!18421)))

(declare-fun d!54707 () Bool)

(declare-fun res!86397 () Bool)

(assert (=> d!54707 (=> res!86397 e!120205)))

(assert (=> d!54707 (= res!86397 (bvsge #b00000000000000000000000000000000 (size!3956 (_keys!5641 thiss!1248))))))

(assert (=> d!54707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5641 thiss!1248) (mask!8771 thiss!1248)) e!120205)))

(declare-fun b!182571 () Bool)

(assert (=> b!182571 (= e!120206 call!18421)))

(declare-fun bm!18418 () Bool)

(assert (=> bm!18418 (= call!18421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5641 thiss!1248) (mask!8771 thiss!1248)))))

(assert (= (and d!54707 (not res!86397)) b!182569))

(assert (= (and b!182569 c!32758) b!182568))

(assert (= (and b!182569 (not c!32758)) b!182570))

(assert (= (and b!182568 res!86396) b!182571))

(assert (= (or b!182571 b!182570) bm!18418))

(assert (=> b!182568 m!210421))

(declare-fun m!210483 () Bool)

(assert (=> b!182568 m!210483))

(declare-fun m!210485 () Bool)

(assert (=> b!182568 m!210485))

(assert (=> b!182568 m!210421))

(declare-fun m!210487 () Bool)

(assert (=> b!182568 m!210487))

(assert (=> b!182569 m!210421))

(assert (=> b!182569 m!210421))

(assert (=> b!182569 m!210423))

(declare-fun m!210489 () Bool)

(assert (=> bm!18418 m!210489))

(assert (=> b!182390 d!54707))

(declare-fun d!54709 () Bool)

(assert (=> d!54709 (= (validMask!0 (mask!8771 thiss!1248)) (and (or (= (mask!8771 thiss!1248) #b00000000000000000000000000000111) (= (mask!8771 thiss!1248) #b00000000000000000000000000001111) (= (mask!8771 thiss!1248) #b00000000000000000000000000011111) (= (mask!8771 thiss!1248) #b00000000000000000000000000111111) (= (mask!8771 thiss!1248) #b00000000000000000000000001111111) (= (mask!8771 thiss!1248) #b00000000000000000000000011111111) (= (mask!8771 thiss!1248) #b00000000000000000000000111111111) (= (mask!8771 thiss!1248) #b00000000000000000000001111111111) (= (mask!8771 thiss!1248) #b00000000000000000000011111111111) (= (mask!8771 thiss!1248) #b00000000000000000000111111111111) (= (mask!8771 thiss!1248) #b00000000000000000001111111111111) (= (mask!8771 thiss!1248) #b00000000000000000011111111111111) (= (mask!8771 thiss!1248) #b00000000000000000111111111111111) (= (mask!8771 thiss!1248) #b00000000000000001111111111111111) (= (mask!8771 thiss!1248) #b00000000000000011111111111111111) (= (mask!8771 thiss!1248) #b00000000000000111111111111111111) (= (mask!8771 thiss!1248) #b00000000000001111111111111111111) (= (mask!8771 thiss!1248) #b00000000000011111111111111111111) (= (mask!8771 thiss!1248) #b00000000000111111111111111111111) (= (mask!8771 thiss!1248) #b00000000001111111111111111111111) (= (mask!8771 thiss!1248) #b00000000011111111111111111111111) (= (mask!8771 thiss!1248) #b00000000111111111111111111111111) (= (mask!8771 thiss!1248) #b00000001111111111111111111111111) (= (mask!8771 thiss!1248) #b00000011111111111111111111111111) (= (mask!8771 thiss!1248) #b00000111111111111111111111111111) (= (mask!8771 thiss!1248) #b00001111111111111111111111111111) (= (mask!8771 thiss!1248) #b00011111111111111111111111111111) (= (mask!8771 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8771 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182397 d!54709))

(declare-fun d!54711 () Bool)

(assert (=> d!54711 (= (array_inv!2351 (_keys!5641 thiss!1248)) (bvsge (size!3956 (_keys!5641 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182394 d!54711))

(declare-fun d!54713 () Bool)

(assert (=> d!54713 (= (array_inv!2352 (_values!3713 thiss!1248)) (bvsge (size!3957 (_values!3713 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182394 d!54713))

(declare-fun b!182578 () Bool)

(declare-fun e!120212 () Bool)

(assert (=> b!182578 (= e!120212 tp_is_empty!4267)))

(declare-fun condMapEmpty!7331 () Bool)

(declare-fun mapDefault!7331 () ValueCell!1790)

(assert (=> mapNonEmpty!7322 (= condMapEmpty!7331 (= mapRest!7322 ((as const (Array (_ BitVec 32) ValueCell!1790)) mapDefault!7331)))))

(declare-fun e!120211 () Bool)

(declare-fun mapRes!7331 () Bool)

(assert (=> mapNonEmpty!7322 (= tp!16243 (and e!120211 mapRes!7331))))

(declare-fun mapIsEmpty!7331 () Bool)

(assert (=> mapIsEmpty!7331 mapRes!7331))

(declare-fun mapNonEmpty!7331 () Bool)

(declare-fun tp!16259 () Bool)

(assert (=> mapNonEmpty!7331 (= mapRes!7331 (and tp!16259 e!120212))))

(declare-fun mapKey!7331 () (_ BitVec 32))

(declare-fun mapValue!7331 () ValueCell!1790)

(declare-fun mapRest!7331 () (Array (_ BitVec 32) ValueCell!1790))

(assert (=> mapNonEmpty!7331 (= mapRest!7322 (store mapRest!7331 mapKey!7331 mapValue!7331))))

(declare-fun b!182579 () Bool)

(assert (=> b!182579 (= e!120211 tp_is_empty!4267)))

(assert (= (and mapNonEmpty!7322 condMapEmpty!7331) mapIsEmpty!7331))

(assert (= (and mapNonEmpty!7322 (not condMapEmpty!7331)) mapNonEmpty!7331))

(assert (= (and mapNonEmpty!7331 ((_ is ValueCellFull!1790) mapValue!7331)) b!182578))

(assert (= (and mapNonEmpty!7322 ((_ is ValueCellFull!1790) mapDefault!7331)) b!182579))

(declare-fun m!210491 () Bool)

(assert (=> mapNonEmpty!7331 m!210491))

(declare-fun b_lambda!7199 () Bool)

(assert (= b_lambda!7197 (or (and b!182394 b_free!4495) b_lambda!7199)))

(check-sat (not b!182558) (not bm!18409) (not b!182538) (not b!182540) (not d!54699) b_and!11077 (not bm!18415) (not b_lambda!7199) (not mapNonEmpty!7331) (not b!182474) (not d!54701) (not d!54703) (not bm!18412) (not b!182542) (not b_next!4495) (not d!54705) (not b!182544) (not b!182483) (not b!182569) (not b!182485) (not b!182559) (not b!182568) (not b!182541) (not bm!18411) (not b!182539) tp_is_empty!4267 (not b!182531) (not b!182530) (not b!182557) (not bm!18418))
(check-sat b_and!11077 (not b_next!4495))
