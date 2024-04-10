; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17646 () Bool)

(assert start!17646)

(declare-fun b!176410 () Bool)

(declare-fun b_free!4353 () Bool)

(declare-fun b_next!4353 () Bool)

(assert (=> b!176410 (= b_free!4353 (not b_next!4353))))

(declare-fun tp!15749 () Bool)

(declare-fun b_and!10847 () Bool)

(assert (=> b!176410 (= tp!15749 b_and!10847)))

(declare-fun mapNonEmpty!7041 () Bool)

(declare-fun mapRes!7041 () Bool)

(declare-fun tp!15750 () Bool)

(declare-fun e!116387 () Bool)

(assert (=> mapNonEmpty!7041 (= mapRes!7041 (and tp!15750 e!116387))))

(declare-datatypes ((V!5147 0))(
  ( (V!5148 (val!2107 Int)) )
))
(declare-datatypes ((ValueCell!1719 0))(
  ( (ValueCellFull!1719 (v!3984 V!5147)) (EmptyCell!1719) )
))
(declare-fun mapValue!7041 () ValueCell!1719)

(declare-fun mapRest!7041 () (Array (_ BitVec 32) ValueCell!1719))

(declare-fun mapKey!7041 () (_ BitVec 32))

(declare-datatypes ((array!7395 0))(
  ( (array!7396 (arr!3509 (Array (_ BitVec 32) (_ BitVec 64))) (size!3813 (_ BitVec 32))) )
))
(declare-datatypes ((array!7397 0))(
  ( (array!7398 (arr!3510 (Array (_ BitVec 32) ValueCell!1719)) (size!3814 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2346 0))(
  ( (LongMapFixedSize!2347 (defaultEntry!3633 Int) (mask!8550 (_ BitVec 32)) (extraKeys!3370 (_ BitVec 32)) (zeroValue!3474 V!5147) (minValue!3474 V!5147) (_size!1222 (_ BitVec 32)) (_keys!5494 array!7395) (_values!3616 array!7397) (_vacant!1222 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2346)

(assert (=> mapNonEmpty!7041 (= (arr!3510 (_values!3616 thiss!1248)) (store mapRest!7041 mapKey!7041 mapValue!7041))))

(declare-fun res!83598 () Bool)

(declare-fun e!116386 () Bool)

(assert (=> start!17646 (=> (not res!83598) (not e!116386))))

(declare-fun valid!987 (LongMapFixedSize!2346) Bool)

(assert (=> start!17646 (= res!83598 (valid!987 thiss!1248))))

(assert (=> start!17646 e!116386))

(declare-fun e!116385 () Bool)

(assert (=> start!17646 e!116385))

(assert (=> start!17646 true))

(declare-fun b!176405 () Bool)

(declare-fun res!83597 () Bool)

(assert (=> b!176405 (=> (not res!83597) (not e!116386))))

(assert (=> b!176405 (= res!83597 (and (= (size!3814 (_values!3616 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8550 thiss!1248))) (= (size!3813 (_keys!5494 thiss!1248)) (size!3814 (_values!3616 thiss!1248))) (bvsge (mask!8550 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3370 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3370 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176406 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7395 (_ BitVec 32)) Bool)

(assert (=> b!176406 (= e!116386 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5494 thiss!1248) (mask!8550 thiss!1248))))))

(declare-fun mapIsEmpty!7041 () Bool)

(assert (=> mapIsEmpty!7041 mapRes!7041))

(declare-fun b!176407 () Bool)

(declare-fun res!83599 () Bool)

(assert (=> b!176407 (=> (not res!83599) (not e!116386))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176407 (= res!83599 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176408 () Bool)

(declare-fun tp_is_empty!4125 () Bool)

(assert (=> b!176408 (= e!116387 tp_is_empty!4125)))

(declare-fun b!176409 () Bool)

(declare-fun e!116389 () Bool)

(declare-fun e!116390 () Bool)

(assert (=> b!176409 (= e!116389 (and e!116390 mapRes!7041))))

(declare-fun condMapEmpty!7041 () Bool)

(declare-fun mapDefault!7041 () ValueCell!1719)

(assert (=> b!176409 (= condMapEmpty!7041 (= (arr!3510 (_values!3616 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1719)) mapDefault!7041)))))

(declare-fun array_inv!2247 (array!7395) Bool)

(declare-fun array_inv!2248 (array!7397) Bool)

(assert (=> b!176410 (= e!116385 (and tp!15749 tp_is_empty!4125 (array_inv!2247 (_keys!5494 thiss!1248)) (array_inv!2248 (_values!3616 thiss!1248)) e!116389))))

(declare-fun b!176411 () Bool)

(declare-fun res!83595 () Bool)

(assert (=> b!176411 (=> (not res!83595) (not e!116386))))

(declare-datatypes ((tuple2!3278 0))(
  ( (tuple2!3279 (_1!1650 (_ BitVec 64)) (_2!1650 V!5147)) )
))
(declare-datatypes ((List!2232 0))(
  ( (Nil!2229) (Cons!2228 (h!2849 tuple2!3278) (t!7056 List!2232)) )
))
(declare-datatypes ((ListLongMap!2205 0))(
  ( (ListLongMap!2206 (toList!1118 List!2232)) )
))
(declare-fun contains!1182 (ListLongMap!2205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!770 (array!7395 array!7397 (_ BitVec 32) (_ BitVec 32) V!5147 V!5147 (_ BitVec 32) Int) ListLongMap!2205)

(assert (=> b!176411 (= res!83595 (contains!1182 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)) key!828))))

(declare-fun b!176412 () Bool)

(declare-fun res!83596 () Bool)

(assert (=> b!176412 (=> (not res!83596) (not e!116386))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!554 0))(
  ( (MissingZero!554 (index!4384 (_ BitVec 32))) (Found!554 (index!4385 (_ BitVec 32))) (Intermediate!554 (undefined!1366 Bool) (index!4386 (_ BitVec 32)) (x!19364 (_ BitVec 32))) (Undefined!554) (MissingVacant!554 (index!4387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7395 (_ BitVec 32)) SeekEntryResult!554)

(assert (=> b!176412 (= res!83596 ((_ is Undefined!554) (seekEntryOrOpen!0 key!828 (_keys!5494 thiss!1248) (mask!8550 thiss!1248))))))

(declare-fun b!176413 () Bool)

(assert (=> b!176413 (= e!116390 tp_is_empty!4125)))

(declare-fun b!176414 () Bool)

(declare-fun res!83600 () Bool)

(assert (=> b!176414 (=> (not res!83600) (not e!116386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176414 (= res!83600 (validMask!0 (mask!8550 thiss!1248)))))

(assert (= (and start!17646 res!83598) b!176407))

(assert (= (and b!176407 res!83599) b!176412))

(assert (= (and b!176412 res!83596) b!176411))

(assert (= (and b!176411 res!83595) b!176414))

(assert (= (and b!176414 res!83600) b!176405))

(assert (= (and b!176405 res!83597) b!176406))

(assert (= (and b!176409 condMapEmpty!7041) mapIsEmpty!7041))

(assert (= (and b!176409 (not condMapEmpty!7041)) mapNonEmpty!7041))

(assert (= (and mapNonEmpty!7041 ((_ is ValueCellFull!1719) mapValue!7041)) b!176408))

(assert (= (and b!176409 ((_ is ValueCellFull!1719) mapDefault!7041)) b!176413))

(assert (= b!176410 b!176409))

(assert (= start!17646 b!176410))

(declare-fun m!205231 () Bool)

(assert (=> b!176410 m!205231))

(declare-fun m!205233 () Bool)

(assert (=> b!176410 m!205233))

(declare-fun m!205235 () Bool)

(assert (=> mapNonEmpty!7041 m!205235))

(declare-fun m!205237 () Bool)

(assert (=> b!176406 m!205237))

(declare-fun m!205239 () Bool)

(assert (=> b!176412 m!205239))

(declare-fun m!205241 () Bool)

(assert (=> b!176414 m!205241))

(declare-fun m!205243 () Bool)

(assert (=> b!176411 m!205243))

(assert (=> b!176411 m!205243))

(declare-fun m!205245 () Bool)

(assert (=> b!176411 m!205245))

(declare-fun m!205247 () Bool)

(assert (=> start!17646 m!205247))

(check-sat (not b!176412) (not b_next!4353) (not b!176411) (not b!176410) tp_is_empty!4125 (not start!17646) b_and!10847 (not b!176406) (not mapNonEmpty!7041) (not b!176414))
(check-sat b_and!10847 (not b_next!4353))
(get-model)

(declare-fun d!53669 () Bool)

(assert (=> d!53669 (= (validMask!0 (mask!8550 thiss!1248)) (and (or (= (mask!8550 thiss!1248) #b00000000000000000000000000000111) (= (mask!8550 thiss!1248) #b00000000000000000000000000001111) (= (mask!8550 thiss!1248) #b00000000000000000000000000011111) (= (mask!8550 thiss!1248) #b00000000000000000000000000111111) (= (mask!8550 thiss!1248) #b00000000000000000000000001111111) (= (mask!8550 thiss!1248) #b00000000000000000000000011111111) (= (mask!8550 thiss!1248) #b00000000000000000000000111111111) (= (mask!8550 thiss!1248) #b00000000000000000000001111111111) (= (mask!8550 thiss!1248) #b00000000000000000000011111111111) (= (mask!8550 thiss!1248) #b00000000000000000000111111111111) (= (mask!8550 thiss!1248) #b00000000000000000001111111111111) (= (mask!8550 thiss!1248) #b00000000000000000011111111111111) (= (mask!8550 thiss!1248) #b00000000000000000111111111111111) (= (mask!8550 thiss!1248) #b00000000000000001111111111111111) (= (mask!8550 thiss!1248) #b00000000000000011111111111111111) (= (mask!8550 thiss!1248) #b00000000000000111111111111111111) (= (mask!8550 thiss!1248) #b00000000000001111111111111111111) (= (mask!8550 thiss!1248) #b00000000000011111111111111111111) (= (mask!8550 thiss!1248) #b00000000000111111111111111111111) (= (mask!8550 thiss!1248) #b00000000001111111111111111111111) (= (mask!8550 thiss!1248) #b00000000011111111111111111111111) (= (mask!8550 thiss!1248) #b00000000111111111111111111111111) (= (mask!8550 thiss!1248) #b00000001111111111111111111111111) (= (mask!8550 thiss!1248) #b00000011111111111111111111111111) (= (mask!8550 thiss!1248) #b00000111111111111111111111111111) (= (mask!8550 thiss!1248) #b00001111111111111111111111111111) (= (mask!8550 thiss!1248) #b00011111111111111111111111111111) (= (mask!8550 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8550 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176414 d!53669))

(declare-fun d!53671 () Bool)

(assert (=> d!53671 (= (array_inv!2247 (_keys!5494 thiss!1248)) (bvsge (size!3813 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176410 d!53671))

(declare-fun d!53673 () Bool)

(assert (=> d!53673 (= (array_inv!2248 (_values!3616 thiss!1248)) (bvsge (size!3814 (_values!3616 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176410 d!53673))

(declare-fun b!176453 () Bool)

(declare-fun e!116416 () Bool)

(declare-fun call!17848 () Bool)

(assert (=> b!176453 (= e!116416 call!17848)))

(declare-fun d!53675 () Bool)

(declare-fun res!83623 () Bool)

(declare-fun e!116415 () Bool)

(assert (=> d!53675 (=> res!83623 e!116415)))

(assert (=> d!53675 (= res!83623 (bvsge #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))

(assert (=> d!53675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5494 thiss!1248) (mask!8550 thiss!1248)) e!116415)))

(declare-fun b!176454 () Bool)

(declare-fun e!116417 () Bool)

(assert (=> b!176454 (= e!116417 call!17848)))

(declare-fun b!176455 () Bool)

(assert (=> b!176455 (= e!116415 e!116416)))

(declare-fun c!31630 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176455 (= c!31630 (validKeyInArray!0 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176456 () Bool)

(assert (=> b!176456 (= e!116416 e!116417)))

(declare-fun lt!87286 () (_ BitVec 64))

(assert (=> b!176456 (= lt!87286 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5404 0))(
  ( (Unit!5405) )
))
(declare-fun lt!87288 () Unit!5404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7395 (_ BitVec 64) (_ BitVec 32)) Unit!5404)

(assert (=> b!176456 (= lt!87288 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5494 thiss!1248) lt!87286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176456 (arrayContainsKey!0 (_keys!5494 thiss!1248) lt!87286 #b00000000000000000000000000000000)))

(declare-fun lt!87287 () Unit!5404)

(assert (=> b!176456 (= lt!87287 lt!87288)))

(declare-fun res!83624 () Bool)

(assert (=> b!176456 (= res!83624 (= (seekEntryOrOpen!0 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000) (_keys!5494 thiss!1248) (mask!8550 thiss!1248)) (Found!554 #b00000000000000000000000000000000)))))

(assert (=> b!176456 (=> (not res!83624) (not e!116417))))

(declare-fun bm!17845 () Bool)

(assert (=> bm!17845 (= call!17848 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5494 thiss!1248) (mask!8550 thiss!1248)))))

(assert (= (and d!53675 (not res!83623)) b!176455))

(assert (= (and b!176455 c!31630) b!176456))

(assert (= (and b!176455 (not c!31630)) b!176453))

(assert (= (and b!176456 res!83624) b!176454))

(assert (= (or b!176454 b!176453) bm!17845))

(declare-fun m!205267 () Bool)

(assert (=> b!176455 m!205267))

(assert (=> b!176455 m!205267))

(declare-fun m!205269 () Bool)

(assert (=> b!176455 m!205269))

(assert (=> b!176456 m!205267))

(declare-fun m!205271 () Bool)

(assert (=> b!176456 m!205271))

(declare-fun m!205273 () Bool)

(assert (=> b!176456 m!205273))

(assert (=> b!176456 m!205267))

(declare-fun m!205275 () Bool)

(assert (=> b!176456 m!205275))

(declare-fun m!205277 () Bool)

(assert (=> bm!17845 m!205277))

(assert (=> b!176406 d!53675))

(declare-fun d!53677 () Bool)

(declare-fun e!116423 () Bool)

(assert (=> d!53677 e!116423))

(declare-fun res!83627 () Bool)

(assert (=> d!53677 (=> res!83627 e!116423)))

(declare-fun lt!87299 () Bool)

(assert (=> d!53677 (= res!83627 (not lt!87299))))

(declare-fun lt!87297 () Bool)

(assert (=> d!53677 (= lt!87299 lt!87297)))

(declare-fun lt!87300 () Unit!5404)

(declare-fun e!116422 () Unit!5404)

(assert (=> d!53677 (= lt!87300 e!116422)))

(declare-fun c!31633 () Bool)

(assert (=> d!53677 (= c!31633 lt!87297)))

(declare-fun containsKey!196 (List!2232 (_ BitVec 64)) Bool)

(assert (=> d!53677 (= lt!87297 (containsKey!196 (toList!1118 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248))) key!828))))

(assert (=> d!53677 (= (contains!1182 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)) key!828) lt!87299)))

(declare-fun b!176463 () Bool)

(declare-fun lt!87298 () Unit!5404)

(assert (=> b!176463 (= e!116422 lt!87298)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!144 (List!2232 (_ BitVec 64)) Unit!5404)

(assert (=> b!176463 (= lt!87298 (lemmaContainsKeyImpliesGetValueByKeyDefined!144 (toList!1118 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248))) key!828))))

(declare-datatypes ((Option!198 0))(
  ( (Some!197 (v!3986 V!5147)) (None!196) )
))
(declare-fun isDefined!145 (Option!198) Bool)

(declare-fun getValueByKey!192 (List!2232 (_ BitVec 64)) Option!198)

(assert (=> b!176463 (isDefined!145 (getValueByKey!192 (toList!1118 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248))) key!828))))

(declare-fun b!176464 () Bool)

(declare-fun Unit!5406 () Unit!5404)

(assert (=> b!176464 (= e!116422 Unit!5406)))

(declare-fun b!176465 () Bool)

(assert (=> b!176465 (= e!116423 (isDefined!145 (getValueByKey!192 (toList!1118 (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248))) key!828)))))

(assert (= (and d!53677 c!31633) b!176463))

(assert (= (and d!53677 (not c!31633)) b!176464))

(assert (= (and d!53677 (not res!83627)) b!176465))

(declare-fun m!205279 () Bool)

(assert (=> d!53677 m!205279))

(declare-fun m!205281 () Bool)

(assert (=> b!176463 m!205281))

(declare-fun m!205283 () Bool)

(assert (=> b!176463 m!205283))

(assert (=> b!176463 m!205283))

(declare-fun m!205285 () Bool)

(assert (=> b!176463 m!205285))

(assert (=> b!176465 m!205283))

(assert (=> b!176465 m!205283))

(assert (=> b!176465 m!205285))

(assert (=> b!176411 d!53677))

(declare-fun b!176508 () Bool)

(declare-fun e!116462 () Unit!5404)

(declare-fun Unit!5407 () Unit!5404)

(assert (=> b!176508 (= e!116462 Unit!5407)))

(declare-fun bm!17860 () Bool)

(declare-fun call!17865 () Bool)

(declare-fun lt!87357 () ListLongMap!2205)

(assert (=> bm!17860 (= call!17865 (contains!1182 lt!87357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53679 () Bool)

(declare-fun e!116458 () Bool)

(assert (=> d!53679 e!116458))

(declare-fun res!83648 () Bool)

(assert (=> d!53679 (=> (not res!83648) (not e!116458))))

(assert (=> d!53679 (= res!83648 (or (bvsge #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))))

(declare-fun lt!87354 () ListLongMap!2205)

(assert (=> d!53679 (= lt!87357 lt!87354)))

(declare-fun lt!87360 () Unit!5404)

(assert (=> d!53679 (= lt!87360 e!116462)))

(declare-fun c!31646 () Bool)

(declare-fun e!116455 () Bool)

(assert (=> d!53679 (= c!31646 e!116455)))

(declare-fun res!83652 () Bool)

(assert (=> d!53679 (=> (not res!83652) (not e!116455))))

(assert (=> d!53679 (= res!83652 (bvslt #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))

(declare-fun e!116459 () ListLongMap!2205)

(assert (=> d!53679 (= lt!87354 e!116459)))

(declare-fun c!31651 () Bool)

(assert (=> d!53679 (= c!31651 (and (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53679 (validMask!0 (mask!8550 thiss!1248))))

(assert (=> d!53679 (= (getCurrentListMap!770 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)) lt!87357)))

(declare-fun b!176509 () Bool)

(declare-fun e!116451 () ListLongMap!2205)

(declare-fun call!17867 () ListLongMap!2205)

(assert (=> b!176509 (= e!116451 call!17867)))

(declare-fun b!176510 () Bool)

(declare-fun e!116452 () Bool)

(declare-fun e!116457 () Bool)

(assert (=> b!176510 (= e!116452 e!116457)))

(declare-fun res!83653 () Bool)

(assert (=> b!176510 (=> (not res!83653) (not e!116457))))

(assert (=> b!176510 (= res!83653 (contains!1182 lt!87357 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176510 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))

(declare-fun b!176511 () Bool)

(declare-fun apply!137 (ListLongMap!2205 (_ BitVec 64)) V!5147)

(declare-fun get!2004 (ValueCell!1719 V!5147) V!5147)

(declare-fun dynLambda!480 (Int (_ BitVec 64)) V!5147)

(assert (=> b!176511 (= e!116457 (= (apply!137 lt!87357 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000)) (get!2004 (select (arr!3510 (_values!3616 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!480 (defaultEntry!3633 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3814 (_values!3616 thiss!1248))))))

(assert (=> b!176511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))

(declare-fun b!176512 () Bool)

(declare-fun res!83646 () Bool)

(assert (=> b!176512 (=> (not res!83646) (not e!116458))))

(assert (=> b!176512 (= res!83646 e!116452)))

(declare-fun res!83651 () Bool)

(assert (=> b!176512 (=> res!83651 e!116452)))

(declare-fun e!116450 () Bool)

(assert (=> b!176512 (= res!83651 (not e!116450))))

(declare-fun res!83654 () Bool)

(assert (=> b!176512 (=> (not res!83654) (not e!116450))))

(assert (=> b!176512 (= res!83654 (bvslt #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))))))

(declare-fun b!176513 () Bool)

(declare-fun e!116456 () Bool)

(declare-fun call!17868 () Bool)

(assert (=> b!176513 (= e!116456 (not call!17868))))

(declare-fun bm!17861 () Bool)

(declare-fun call!17869 () ListLongMap!2205)

(declare-fun call!17863 () ListLongMap!2205)

(assert (=> bm!17861 (= call!17869 call!17863)))

(declare-fun b!176514 () Bool)

(declare-fun res!83650 () Bool)

(assert (=> b!176514 (=> (not res!83650) (not e!116458))))

(assert (=> b!176514 (= res!83650 e!116456)))

(declare-fun c!31650 () Bool)

(assert (=> b!176514 (= c!31650 (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!176515 () Bool)

(declare-fun lt!87351 () Unit!5404)

(assert (=> b!176515 (= e!116462 lt!87351)))

(declare-fun lt!87358 () ListLongMap!2205)

(declare-fun getCurrentListMapNoExtraKeys!170 (array!7395 array!7397 (_ BitVec 32) (_ BitVec 32) V!5147 V!5147 (_ BitVec 32) Int) ListLongMap!2205)

(assert (=> b!176515 (= lt!87358 (getCurrentListMapNoExtraKeys!170 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)))))

(declare-fun lt!87366 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87366 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87352 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87352 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87353 () Unit!5404)

(declare-fun addStillContains!113 (ListLongMap!2205 (_ BitVec 64) V!5147 (_ BitVec 64)) Unit!5404)

(assert (=> b!176515 (= lt!87353 (addStillContains!113 lt!87358 lt!87366 (zeroValue!3474 thiss!1248) lt!87352))))

(declare-fun +!254 (ListLongMap!2205 tuple2!3278) ListLongMap!2205)

(assert (=> b!176515 (contains!1182 (+!254 lt!87358 (tuple2!3279 lt!87366 (zeroValue!3474 thiss!1248))) lt!87352)))

(declare-fun lt!87365 () Unit!5404)

(assert (=> b!176515 (= lt!87365 lt!87353)))

(declare-fun lt!87355 () ListLongMap!2205)

(assert (=> b!176515 (= lt!87355 (getCurrentListMapNoExtraKeys!170 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)))))

(declare-fun lt!87350 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87350 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87359 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87359 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87364 () Unit!5404)

(declare-fun addApplyDifferent!113 (ListLongMap!2205 (_ BitVec 64) V!5147 (_ BitVec 64)) Unit!5404)

(assert (=> b!176515 (= lt!87364 (addApplyDifferent!113 lt!87355 lt!87350 (minValue!3474 thiss!1248) lt!87359))))

(assert (=> b!176515 (= (apply!137 (+!254 lt!87355 (tuple2!3279 lt!87350 (minValue!3474 thiss!1248))) lt!87359) (apply!137 lt!87355 lt!87359))))

(declare-fun lt!87347 () Unit!5404)

(assert (=> b!176515 (= lt!87347 lt!87364)))

(declare-fun lt!87361 () ListLongMap!2205)

(assert (=> b!176515 (= lt!87361 (getCurrentListMapNoExtraKeys!170 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)))))

(declare-fun lt!87346 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87356 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87356 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87345 () Unit!5404)

(assert (=> b!176515 (= lt!87345 (addApplyDifferent!113 lt!87361 lt!87346 (zeroValue!3474 thiss!1248) lt!87356))))

(assert (=> b!176515 (= (apply!137 (+!254 lt!87361 (tuple2!3279 lt!87346 (zeroValue!3474 thiss!1248))) lt!87356) (apply!137 lt!87361 lt!87356))))

(declare-fun lt!87348 () Unit!5404)

(assert (=> b!176515 (= lt!87348 lt!87345)))

(declare-fun lt!87363 () ListLongMap!2205)

(assert (=> b!176515 (= lt!87363 (getCurrentListMapNoExtraKeys!170 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)))))

(declare-fun lt!87349 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87362 () (_ BitVec 64))

(assert (=> b!176515 (= lt!87362 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176515 (= lt!87351 (addApplyDifferent!113 lt!87363 lt!87349 (minValue!3474 thiss!1248) lt!87362))))

(assert (=> b!176515 (= (apply!137 (+!254 lt!87363 (tuple2!3279 lt!87349 (minValue!3474 thiss!1248))) lt!87362) (apply!137 lt!87363 lt!87362))))

(declare-fun b!176516 () Bool)

(declare-fun c!31647 () Bool)

(assert (=> b!176516 (= c!31647 (and (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116453 () ListLongMap!2205)

(assert (=> b!176516 (= e!116453 e!116451)))

(declare-fun bm!17862 () Bool)

(declare-fun call!17864 () ListLongMap!2205)

(assert (=> bm!17862 (= call!17867 call!17864)))

(declare-fun bm!17863 () Bool)

(declare-fun call!17866 () ListLongMap!2205)

(assert (=> bm!17863 (= call!17864 call!17866)))

(declare-fun b!176517 () Bool)

(declare-fun e!116460 () Bool)

(assert (=> b!176517 (= e!116460 (not call!17865))))

(declare-fun bm!17864 () Bool)

(assert (=> bm!17864 (= call!17866 (getCurrentListMapNoExtraKeys!170 (_keys!5494 thiss!1248) (_values!3616 thiss!1248) (mask!8550 thiss!1248) (extraKeys!3370 thiss!1248) (zeroValue!3474 thiss!1248) (minValue!3474 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3633 thiss!1248)))))

(declare-fun b!176518 () Bool)

(declare-fun e!116461 () Bool)

(assert (=> b!176518 (= e!116460 e!116461)))

(declare-fun res!83649 () Bool)

(assert (=> b!176518 (= res!83649 call!17865)))

(assert (=> b!176518 (=> (not res!83649) (not e!116461))))

(declare-fun b!176519 () Bool)

(assert (=> b!176519 (= e!116459 (+!254 call!17863 (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3474 thiss!1248))))))

(declare-fun b!176520 () Bool)

(assert (=> b!176520 (= e!116450 (validKeyInArray!0 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176521 () Bool)

(assert (=> b!176521 (= e!116461 (= (apply!137 lt!87357 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3474 thiss!1248)))))

(declare-fun b!176522 () Bool)

(declare-fun e!116454 () Bool)

(assert (=> b!176522 (= e!116454 (= (apply!137 lt!87357 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3474 thiss!1248)))))

(declare-fun b!176523 () Bool)

(assert (=> b!176523 (= e!116451 call!17869)))

(declare-fun b!176524 () Bool)

(assert (=> b!176524 (= e!116456 e!116454)))

(declare-fun res!83647 () Bool)

(assert (=> b!176524 (= res!83647 call!17868)))

(assert (=> b!176524 (=> (not res!83647) (not e!116454))))

(declare-fun b!176525 () Bool)

(assert (=> b!176525 (= e!116453 call!17869)))

(declare-fun b!176526 () Bool)

(assert (=> b!176526 (= e!116455 (validKeyInArray!0 (select (arr!3509 (_keys!5494 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17865 () Bool)

(assert (=> bm!17865 (= call!17868 (contains!1182 lt!87357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176527 () Bool)

(assert (=> b!176527 (= e!116459 e!116453)))

(declare-fun c!31648 () Bool)

(assert (=> b!176527 (= c!31648 (and (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176528 () Bool)

(assert (=> b!176528 (= e!116458 e!116460)))

(declare-fun c!31649 () Bool)

(assert (=> b!176528 (= c!31649 (not (= (bvand (extraKeys!3370 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17866 () Bool)

(assert (=> bm!17866 (= call!17863 (+!254 (ite c!31651 call!17866 (ite c!31648 call!17864 call!17867)) (ite (or c!31651 c!31648) (tuple2!3279 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3474 thiss!1248)) (tuple2!3279 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3474 thiss!1248)))))))

(assert (= (and d!53679 c!31651) b!176519))

(assert (= (and d!53679 (not c!31651)) b!176527))

(assert (= (and b!176527 c!31648) b!176525))

(assert (= (and b!176527 (not c!31648)) b!176516))

(assert (= (and b!176516 c!31647) b!176523))

(assert (= (and b!176516 (not c!31647)) b!176509))

(assert (= (or b!176523 b!176509) bm!17862))

(assert (= (or b!176525 bm!17862) bm!17863))

(assert (= (or b!176525 b!176523) bm!17861))

(assert (= (or b!176519 bm!17863) bm!17864))

(assert (= (or b!176519 bm!17861) bm!17866))

(assert (= (and d!53679 res!83652) b!176526))

(assert (= (and d!53679 c!31646) b!176515))

(assert (= (and d!53679 (not c!31646)) b!176508))

(assert (= (and d!53679 res!83648) b!176512))

(assert (= (and b!176512 res!83654) b!176520))

(assert (= (and b!176512 (not res!83651)) b!176510))

(assert (= (and b!176510 res!83653) b!176511))

(assert (= (and b!176512 res!83646) b!176514))

(assert (= (and b!176514 c!31650) b!176524))

(assert (= (and b!176514 (not c!31650)) b!176513))

(assert (= (and b!176524 res!83647) b!176522))

(assert (= (or b!176524 b!176513) bm!17865))

(assert (= (and b!176514 res!83650) b!176528))

(assert (= (and b!176528 c!31649) b!176518))

(assert (= (and b!176528 (not c!31649)) b!176517))

(assert (= (and b!176518 res!83649) b!176521))

(assert (= (or b!176518 b!176517) bm!17860))

(declare-fun b_lambda!7039 () Bool)

(assert (=> (not b_lambda!7039) (not b!176511)))

(declare-fun t!7059 () Bool)

(declare-fun tb!2785 () Bool)

(assert (=> (and b!176410 (= (defaultEntry!3633 thiss!1248) (defaultEntry!3633 thiss!1248)) t!7059) tb!2785))

(declare-fun result!4629 () Bool)

(assert (=> tb!2785 (= result!4629 tp_is_empty!4125)))

(assert (=> b!176511 t!7059))

(declare-fun b_and!10851 () Bool)

(assert (= b_and!10847 (and (=> t!7059 result!4629) b_and!10851)))

(declare-fun m!205287 () Bool)

(assert (=> b!176521 m!205287))

(declare-fun m!205289 () Bool)

(assert (=> b!176522 m!205289))

(assert (=> b!176510 m!205267))

(assert (=> b!176510 m!205267))

(declare-fun m!205291 () Bool)

(assert (=> b!176510 m!205291))

(declare-fun m!205293 () Bool)

(assert (=> bm!17865 m!205293))

(declare-fun m!205295 () Bool)

(assert (=> bm!17860 m!205295))

(declare-fun m!205297 () Bool)

(assert (=> b!176519 m!205297))

(assert (=> b!176520 m!205267))

(assert (=> b!176520 m!205267))

(assert (=> b!176520 m!205269))

(assert (=> d!53679 m!205241))

(declare-fun m!205299 () Bool)

(assert (=> b!176511 m!205299))

(assert (=> b!176511 m!205267))

(declare-fun m!205301 () Bool)

(assert (=> b!176511 m!205301))

(assert (=> b!176511 m!205267))

(declare-fun m!205303 () Bool)

(assert (=> b!176511 m!205303))

(assert (=> b!176511 m!205301))

(assert (=> b!176511 m!205299))

(declare-fun m!205305 () Bool)

(assert (=> b!176511 m!205305))

(assert (=> b!176526 m!205267))

(assert (=> b!176526 m!205267))

(assert (=> b!176526 m!205269))

(declare-fun m!205307 () Bool)

(assert (=> b!176515 m!205307))

(declare-fun m!205309 () Bool)

(assert (=> b!176515 m!205309))

(declare-fun m!205311 () Bool)

(assert (=> b!176515 m!205311))

(assert (=> b!176515 m!205267))

(declare-fun m!205313 () Bool)

(assert (=> b!176515 m!205313))

(declare-fun m!205315 () Bool)

(assert (=> b!176515 m!205315))

(declare-fun m!205317 () Bool)

(assert (=> b!176515 m!205317))

(declare-fun m!205319 () Bool)

(assert (=> b!176515 m!205319))

(declare-fun m!205321 () Bool)

(assert (=> b!176515 m!205321))

(declare-fun m!205323 () Bool)

(assert (=> b!176515 m!205323))

(assert (=> b!176515 m!205307))

(assert (=> b!176515 m!205317))

(assert (=> b!176515 m!205313))

(assert (=> b!176515 m!205323))

(declare-fun m!205325 () Bool)

(assert (=> b!176515 m!205325))

(declare-fun m!205327 () Bool)

(assert (=> b!176515 m!205327))

(declare-fun m!205329 () Bool)

(assert (=> b!176515 m!205329))

(declare-fun m!205331 () Bool)

(assert (=> b!176515 m!205331))

(declare-fun m!205333 () Bool)

(assert (=> b!176515 m!205333))

(declare-fun m!205335 () Bool)

(assert (=> b!176515 m!205335))

(declare-fun m!205337 () Bool)

(assert (=> b!176515 m!205337))

(assert (=> bm!17864 m!205321))

(declare-fun m!205339 () Bool)

(assert (=> bm!17866 m!205339))

(assert (=> b!176411 d!53679))

(declare-fun b!176543 () Bool)

(declare-fun e!116469 () SeekEntryResult!554)

(declare-fun lt!87375 () SeekEntryResult!554)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7395 (_ BitVec 32)) SeekEntryResult!554)

(assert (=> b!176543 (= e!116469 (seekKeyOrZeroReturnVacant!0 (x!19364 lt!87375) (index!4386 lt!87375) (index!4386 lt!87375) key!828 (_keys!5494 thiss!1248) (mask!8550 thiss!1248)))))

(declare-fun b!176544 () Bool)

(declare-fun e!116471 () SeekEntryResult!554)

(assert (=> b!176544 (= e!116471 (Found!554 (index!4386 lt!87375)))))

(declare-fun b!176545 () Bool)

(assert (=> b!176545 (= e!116469 (MissingZero!554 (index!4386 lt!87375)))))

(declare-fun d!53681 () Bool)

(declare-fun lt!87373 () SeekEntryResult!554)

(assert (=> d!53681 (and (or ((_ is Undefined!554) lt!87373) (not ((_ is Found!554) lt!87373)) (and (bvsge (index!4385 lt!87373) #b00000000000000000000000000000000) (bvslt (index!4385 lt!87373) (size!3813 (_keys!5494 thiss!1248))))) (or ((_ is Undefined!554) lt!87373) ((_ is Found!554) lt!87373) (not ((_ is MissingZero!554) lt!87373)) (and (bvsge (index!4384 lt!87373) #b00000000000000000000000000000000) (bvslt (index!4384 lt!87373) (size!3813 (_keys!5494 thiss!1248))))) (or ((_ is Undefined!554) lt!87373) ((_ is Found!554) lt!87373) ((_ is MissingZero!554) lt!87373) (not ((_ is MissingVacant!554) lt!87373)) (and (bvsge (index!4387 lt!87373) #b00000000000000000000000000000000) (bvslt (index!4387 lt!87373) (size!3813 (_keys!5494 thiss!1248))))) (or ((_ is Undefined!554) lt!87373) (ite ((_ is Found!554) lt!87373) (= (select (arr!3509 (_keys!5494 thiss!1248)) (index!4385 lt!87373)) key!828) (ite ((_ is MissingZero!554) lt!87373) (= (select (arr!3509 (_keys!5494 thiss!1248)) (index!4384 lt!87373)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!554) lt!87373) (= (select (arr!3509 (_keys!5494 thiss!1248)) (index!4387 lt!87373)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!116470 () SeekEntryResult!554)

(assert (=> d!53681 (= lt!87373 e!116470)))

(declare-fun c!31659 () Bool)

(assert (=> d!53681 (= c!31659 (and ((_ is Intermediate!554) lt!87375) (undefined!1366 lt!87375)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7395 (_ BitVec 32)) SeekEntryResult!554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53681 (= lt!87375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8550 thiss!1248)) key!828 (_keys!5494 thiss!1248) (mask!8550 thiss!1248)))))

(assert (=> d!53681 (validMask!0 (mask!8550 thiss!1248))))

(assert (=> d!53681 (= (seekEntryOrOpen!0 key!828 (_keys!5494 thiss!1248) (mask!8550 thiss!1248)) lt!87373)))

(declare-fun b!176546 () Bool)

(assert (=> b!176546 (= e!116470 e!116471)))

(declare-fun lt!87374 () (_ BitVec 64))

(assert (=> b!176546 (= lt!87374 (select (arr!3509 (_keys!5494 thiss!1248)) (index!4386 lt!87375)))))

(declare-fun c!31660 () Bool)

(assert (=> b!176546 (= c!31660 (= lt!87374 key!828))))

(declare-fun b!176547 () Bool)

(assert (=> b!176547 (= e!116470 Undefined!554)))

(declare-fun b!176548 () Bool)

(declare-fun c!31658 () Bool)

(assert (=> b!176548 (= c!31658 (= lt!87374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176548 (= e!116471 e!116469)))

(assert (= (and d!53681 c!31659) b!176547))

(assert (= (and d!53681 (not c!31659)) b!176546))

(assert (= (and b!176546 c!31660) b!176544))

(assert (= (and b!176546 (not c!31660)) b!176548))

(assert (= (and b!176548 c!31658) b!176545))

(assert (= (and b!176548 (not c!31658)) b!176543))

(declare-fun m!205341 () Bool)

(assert (=> b!176543 m!205341))

(declare-fun m!205343 () Bool)

(assert (=> d!53681 m!205343))

(declare-fun m!205345 () Bool)

(assert (=> d!53681 m!205345))

(declare-fun m!205347 () Bool)

(assert (=> d!53681 m!205347))

(declare-fun m!205349 () Bool)

(assert (=> d!53681 m!205349))

(assert (=> d!53681 m!205347))

(declare-fun m!205351 () Bool)

(assert (=> d!53681 m!205351))

(assert (=> d!53681 m!205241))

(declare-fun m!205353 () Bool)

(assert (=> b!176546 m!205353))

(assert (=> b!176412 d!53681))

(declare-fun d!53683 () Bool)

(declare-fun res!83661 () Bool)

(declare-fun e!116474 () Bool)

(assert (=> d!53683 (=> (not res!83661) (not e!116474))))

(declare-fun simpleValid!151 (LongMapFixedSize!2346) Bool)

(assert (=> d!53683 (= res!83661 (simpleValid!151 thiss!1248))))

(assert (=> d!53683 (= (valid!987 thiss!1248) e!116474)))

(declare-fun b!176555 () Bool)

(declare-fun res!83662 () Bool)

(assert (=> b!176555 (=> (not res!83662) (not e!116474))))

(declare-fun arrayCountValidKeys!0 (array!7395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176555 (= res!83662 (= (arrayCountValidKeys!0 (_keys!5494 thiss!1248) #b00000000000000000000000000000000 (size!3813 (_keys!5494 thiss!1248))) (_size!1222 thiss!1248)))))

(declare-fun b!176556 () Bool)

(declare-fun res!83663 () Bool)

(assert (=> b!176556 (=> (not res!83663) (not e!116474))))

(assert (=> b!176556 (= res!83663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5494 thiss!1248) (mask!8550 thiss!1248)))))

(declare-fun b!176557 () Bool)

(declare-datatypes ((List!2234 0))(
  ( (Nil!2231) (Cons!2230 (h!2851 (_ BitVec 64)) (t!7060 List!2234)) )
))
(declare-fun arrayNoDuplicates!0 (array!7395 (_ BitVec 32) List!2234) Bool)

(assert (=> b!176557 (= e!116474 (arrayNoDuplicates!0 (_keys!5494 thiss!1248) #b00000000000000000000000000000000 Nil!2231))))

(assert (= (and d!53683 res!83661) b!176555))

(assert (= (and b!176555 res!83662) b!176556))

(assert (= (and b!176556 res!83663) b!176557))

(declare-fun m!205355 () Bool)

(assert (=> d!53683 m!205355))

(declare-fun m!205357 () Bool)

(assert (=> b!176555 m!205357))

(assert (=> b!176556 m!205237))

(declare-fun m!205359 () Bool)

(assert (=> b!176557 m!205359))

(assert (=> start!17646 d!53683))

(declare-fun condMapEmpty!7047 () Bool)

(declare-fun mapDefault!7047 () ValueCell!1719)

(assert (=> mapNonEmpty!7041 (= condMapEmpty!7047 (= mapRest!7041 ((as const (Array (_ BitVec 32) ValueCell!1719)) mapDefault!7047)))))

(declare-fun e!116480 () Bool)

(declare-fun mapRes!7047 () Bool)

(assert (=> mapNonEmpty!7041 (= tp!15750 (and e!116480 mapRes!7047))))

(declare-fun b!176565 () Bool)

(assert (=> b!176565 (= e!116480 tp_is_empty!4125)))

(declare-fun mapIsEmpty!7047 () Bool)

(assert (=> mapIsEmpty!7047 mapRes!7047))

(declare-fun b!176564 () Bool)

(declare-fun e!116479 () Bool)

(assert (=> b!176564 (= e!116479 tp_is_empty!4125)))

(declare-fun mapNonEmpty!7047 () Bool)

(declare-fun tp!15759 () Bool)

(assert (=> mapNonEmpty!7047 (= mapRes!7047 (and tp!15759 e!116479))))

(declare-fun mapKey!7047 () (_ BitVec 32))

(declare-fun mapValue!7047 () ValueCell!1719)

(declare-fun mapRest!7047 () (Array (_ BitVec 32) ValueCell!1719))

(assert (=> mapNonEmpty!7047 (= mapRest!7041 (store mapRest!7047 mapKey!7047 mapValue!7047))))

(assert (= (and mapNonEmpty!7041 condMapEmpty!7047) mapIsEmpty!7047))

(assert (= (and mapNonEmpty!7041 (not condMapEmpty!7047)) mapNonEmpty!7047))

(assert (= (and mapNonEmpty!7047 ((_ is ValueCellFull!1719) mapValue!7047)) b!176564))

(assert (= (and mapNonEmpty!7041 ((_ is ValueCellFull!1719) mapDefault!7047)) b!176565))

(declare-fun m!205361 () Bool)

(assert (=> mapNonEmpty!7047 m!205361))

(declare-fun b_lambda!7041 () Bool)

(assert (= b_lambda!7039 (or (and b!176410 b_free!4353) b_lambda!7041)))

(check-sat (not b!176526) (not b!176455) (not d!53679) (not b!176520) (not d!53681) (not b!176521) (not bm!17845) (not bm!17864) (not b!176522) (not b!176555) (not b!176456) (not b!176556) (not d!53677) (not mapNonEmpty!7047) (not bm!17865) (not b_next!4353) (not b!176557) (not bm!17860) b_and!10851 (not d!53683) tp_is_empty!4125 (not b!176511) (not b!176463) (not b_lambda!7041) (not b!176465) (not b!176515) (not b!176519) (not bm!17866) (not b!176510) (not b!176543))
(check-sat b_and!10851 (not b_next!4353))
