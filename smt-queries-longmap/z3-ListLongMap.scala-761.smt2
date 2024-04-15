; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17884 () Bool)

(assert start!17884)

(declare-fun b!178236 () Bool)

(declare-fun b_free!4405 () Bool)

(declare-fun b_next!4405 () Bool)

(assert (=> b!178236 (= b_free!4405 (not b_next!4405))))

(declare-fun tp!15929 () Bool)

(declare-fun b_and!10895 () Bool)

(assert (=> b!178236 (= tp!15929 b_and!10895)))

(declare-fun b!178230 () Bool)

(declare-fun e!117479 () Bool)

(declare-fun tp_is_empty!4177 () Bool)

(assert (=> b!178230 (= e!117479 tp_is_empty!4177)))

(declare-fun b!178231 () Bool)

(declare-fun res!84415 () Bool)

(declare-fun e!117476 () Bool)

(assert (=> b!178231 (=> (not res!84415) (not e!117476))))

(declare-datatypes ((V!5217 0))(
  ( (V!5218 (val!2133 Int)) )
))
(declare-datatypes ((ValueCell!1745 0))(
  ( (ValueCellFull!1745 (v!4011 V!5217)) (EmptyCell!1745) )
))
(declare-datatypes ((array!7493 0))(
  ( (array!7494 (arr!3550 (Array (_ BitVec 32) (_ BitVec 64))) (size!3857 (_ BitVec 32))) )
))
(declare-datatypes ((array!7495 0))(
  ( (array!7496 (arr!3551 (Array (_ BitVec 32) ValueCell!1745)) (size!3858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2398 0))(
  ( (LongMapFixedSize!2399 (defaultEntry!3668 Int) (mask!8627 (_ BitVec 32)) (extraKeys!3405 (_ BitVec 32)) (zeroValue!3509 V!5217) (minValue!3509 V!5217) (_size!1248 (_ BitVec 32)) (_keys!5544 array!7493) (_values!3651 array!7495) (_vacant!1248 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2398)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178231 (= res!84415 (validMask!0 (mask!8627 thiss!1248)))))

(declare-fun b!178233 () Bool)

(declare-fun res!84416 () Bool)

(assert (=> b!178233 (=> (not res!84416) (not e!117476))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!178233 (= res!84416 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178234 () Bool)

(declare-fun res!84414 () Bool)

(assert (=> b!178234 (=> (not res!84414) (not e!117476))))

(declare-datatypes ((tuple2!3298 0))(
  ( (tuple2!3299 (_1!1660 (_ BitVec 64)) (_2!1660 V!5217)) )
))
(declare-datatypes ((List!2264 0))(
  ( (Nil!2261) (Cons!2260 (h!2883 tuple2!3298) (t!7093 List!2264)) )
))
(declare-datatypes ((ListLongMap!2217 0))(
  ( (ListLongMap!2218 (toList!1124 List!2264)) )
))
(declare-fun contains!1199 (ListLongMap!2217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!760 (array!7493 array!7495 (_ BitVec 32) (_ BitVec 32) V!5217 V!5217 (_ BitVec 32) Int) ListLongMap!2217)

(assert (=> b!178234 (= res!84414 (not (contains!1199 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) key!828)))))

(declare-fun b!178235 () Bool)

(declare-fun e!117478 () Bool)

(declare-fun e!117480 () Bool)

(declare-fun mapRes!7142 () Bool)

(assert (=> b!178235 (= e!117478 (and e!117480 mapRes!7142))))

(declare-fun condMapEmpty!7142 () Bool)

(declare-fun mapDefault!7142 () ValueCell!1745)

(assert (=> b!178235 (= condMapEmpty!7142 (= (arr!3551 (_values!3651 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7142)))))

(declare-fun e!117481 () Bool)

(declare-fun array_inv!2289 (array!7493) Bool)

(declare-fun array_inv!2290 (array!7495) Bool)

(assert (=> b!178236 (= e!117481 (and tp!15929 tp_is_empty!4177 (array_inv!2289 (_keys!5544 thiss!1248)) (array_inv!2290 (_values!3651 thiss!1248)) e!117478))))

(declare-fun res!84417 () Bool)

(assert (=> start!17884 (=> (not res!84417) (not e!117476))))

(declare-fun valid!1019 (LongMapFixedSize!2398) Bool)

(assert (=> start!17884 (= res!84417 (valid!1019 thiss!1248))))

(assert (=> start!17884 e!117476))

(assert (=> start!17884 e!117481))

(assert (=> start!17884 true))

(declare-fun b!178232 () Bool)

(assert (=> b!178232 (= e!117476 (and (= (size!3858 (_values!3651 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8627 thiss!1248))) (= (size!3857 (_keys!5544 thiss!1248)) (size!3858 (_values!3651 thiss!1248))) (bvsge (mask!8627 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3405 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7142 () Bool)

(declare-fun tp!15928 () Bool)

(assert (=> mapNonEmpty!7142 (= mapRes!7142 (and tp!15928 e!117479))))

(declare-fun mapKey!7142 () (_ BitVec 32))

(declare-fun mapValue!7142 () ValueCell!1745)

(declare-fun mapRest!7142 () (Array (_ BitVec 32) ValueCell!1745))

(assert (=> mapNonEmpty!7142 (= (arr!3551 (_values!3651 thiss!1248)) (store mapRest!7142 mapKey!7142 mapValue!7142))))

(declare-fun b!178237 () Bool)

(declare-fun res!84418 () Bool)

(assert (=> b!178237 (=> (not res!84418) (not e!117476))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!584 0))(
  ( (MissingZero!584 (index!4504 (_ BitVec 32))) (Found!584 (index!4505 (_ BitVec 32))) (Intermediate!584 (undefined!1396 Bool) (index!4506 (_ BitVec 32)) (x!19551 (_ BitVec 32))) (Undefined!584) (MissingVacant!584 (index!4507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7493 (_ BitVec 32)) SeekEntryResult!584)

(assert (=> b!178237 (= res!84418 ((_ is Undefined!584) (seekEntryOrOpen!0 key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248))))))

(declare-fun mapIsEmpty!7142 () Bool)

(assert (=> mapIsEmpty!7142 mapRes!7142))

(declare-fun b!178238 () Bool)

(assert (=> b!178238 (= e!117480 tp_is_empty!4177)))

(assert (= (and start!17884 res!84417) b!178233))

(assert (= (and b!178233 res!84416) b!178237))

(assert (= (and b!178237 res!84418) b!178234))

(assert (= (and b!178234 res!84414) b!178231))

(assert (= (and b!178231 res!84415) b!178232))

(assert (= (and b!178235 condMapEmpty!7142) mapIsEmpty!7142))

(assert (= (and b!178235 (not condMapEmpty!7142)) mapNonEmpty!7142))

(assert (= (and mapNonEmpty!7142 ((_ is ValueCellFull!1745) mapValue!7142)) b!178230))

(assert (= (and b!178235 ((_ is ValueCellFull!1745) mapDefault!7142)) b!178238))

(assert (= b!178236 b!178235))

(assert (= start!17884 b!178236))

(declare-fun m!206161 () Bool)

(assert (=> b!178237 m!206161))

(declare-fun m!206163 () Bool)

(assert (=> start!17884 m!206163))

(declare-fun m!206165 () Bool)

(assert (=> b!178231 m!206165))

(declare-fun m!206167 () Bool)

(assert (=> b!178236 m!206167))

(declare-fun m!206169 () Bool)

(assert (=> b!178236 m!206169))

(declare-fun m!206171 () Bool)

(assert (=> b!178234 m!206171))

(assert (=> b!178234 m!206171))

(declare-fun m!206173 () Bool)

(assert (=> b!178234 m!206173))

(declare-fun m!206175 () Bool)

(assert (=> mapNonEmpty!7142 m!206175))

(check-sat (not b!178236) (not b!178234) (not b_next!4405) (not start!17884) (not mapNonEmpty!7142) b_and!10895 (not b!178237) (not b!178231) tp_is_empty!4177)
(check-sat b_and!10895 (not b_next!4405))
(get-model)

(declare-fun b!178305 () Bool)

(declare-fun e!117526 () SeekEntryResult!584)

(assert (=> b!178305 (= e!117526 Undefined!584)))

(declare-fun d!53797 () Bool)

(declare-fun lt!87980 () SeekEntryResult!584)

(assert (=> d!53797 (and (or ((_ is Undefined!584) lt!87980) (not ((_ is Found!584) lt!87980)) (and (bvsge (index!4505 lt!87980) #b00000000000000000000000000000000) (bvslt (index!4505 lt!87980) (size!3857 (_keys!5544 thiss!1248))))) (or ((_ is Undefined!584) lt!87980) ((_ is Found!584) lt!87980) (not ((_ is MissingZero!584) lt!87980)) (and (bvsge (index!4504 lt!87980) #b00000000000000000000000000000000) (bvslt (index!4504 lt!87980) (size!3857 (_keys!5544 thiss!1248))))) (or ((_ is Undefined!584) lt!87980) ((_ is Found!584) lt!87980) ((_ is MissingZero!584) lt!87980) (not ((_ is MissingVacant!584) lt!87980)) (and (bvsge (index!4507 lt!87980) #b00000000000000000000000000000000) (bvslt (index!4507 lt!87980) (size!3857 (_keys!5544 thiss!1248))))) (or ((_ is Undefined!584) lt!87980) (ite ((_ is Found!584) lt!87980) (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4505 lt!87980)) key!828) (ite ((_ is MissingZero!584) lt!87980) (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4504 lt!87980)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!584) lt!87980) (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4507 lt!87980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53797 (= lt!87980 e!117526)))

(declare-fun c!31945 () Bool)

(declare-fun lt!87981 () SeekEntryResult!584)

(assert (=> d!53797 (= c!31945 (and ((_ is Intermediate!584) lt!87981) (undefined!1396 lt!87981)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7493 (_ BitVec 32)) SeekEntryResult!584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53797 (= lt!87981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8627 thiss!1248)) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(assert (=> d!53797 (validMask!0 (mask!8627 thiss!1248))))

(assert (=> d!53797 (= (seekEntryOrOpen!0 key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)) lt!87980)))

(declare-fun b!178306 () Bool)

(declare-fun e!117525 () SeekEntryResult!584)

(assert (=> b!178306 (= e!117526 e!117525)))

(declare-fun lt!87979 () (_ BitVec 64))

(assert (=> b!178306 (= lt!87979 (select (arr!3550 (_keys!5544 thiss!1248)) (index!4506 lt!87981)))))

(declare-fun c!31944 () Bool)

(assert (=> b!178306 (= c!31944 (= lt!87979 key!828))))

(declare-fun b!178307 () Bool)

(declare-fun e!117524 () SeekEntryResult!584)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7493 (_ BitVec 32)) SeekEntryResult!584)

(assert (=> b!178307 (= e!117524 (seekKeyOrZeroReturnVacant!0 (x!19551 lt!87981) (index!4506 lt!87981) (index!4506 lt!87981) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(declare-fun b!178308 () Bool)

(assert (=> b!178308 (= e!117525 (Found!584 (index!4506 lt!87981)))))

(declare-fun b!178309 () Bool)

(assert (=> b!178309 (= e!117524 (MissingZero!584 (index!4506 lt!87981)))))

(declare-fun b!178310 () Bool)

(declare-fun c!31943 () Bool)

(assert (=> b!178310 (= c!31943 (= lt!87979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178310 (= e!117525 e!117524)))

(assert (= (and d!53797 c!31945) b!178305))

(assert (= (and d!53797 (not c!31945)) b!178306))

(assert (= (and b!178306 c!31944) b!178308))

(assert (= (and b!178306 (not c!31944)) b!178310))

(assert (= (and b!178310 c!31943) b!178309))

(assert (= (and b!178310 (not c!31943)) b!178307))

(declare-fun m!206209 () Bool)

(assert (=> d!53797 m!206209))

(declare-fun m!206211 () Bool)

(assert (=> d!53797 m!206211))

(declare-fun m!206213 () Bool)

(assert (=> d!53797 m!206213))

(assert (=> d!53797 m!206211))

(declare-fun m!206215 () Bool)

(assert (=> d!53797 m!206215))

(assert (=> d!53797 m!206165))

(declare-fun m!206217 () Bool)

(assert (=> d!53797 m!206217))

(declare-fun m!206219 () Bool)

(assert (=> b!178306 m!206219))

(declare-fun m!206221 () Bool)

(assert (=> b!178307 m!206221))

(assert (=> b!178237 d!53797))

(declare-fun d!53799 () Bool)

(assert (=> d!53799 (= (array_inv!2289 (_keys!5544 thiss!1248)) (bvsge (size!3857 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178236 d!53799))

(declare-fun d!53801 () Bool)

(assert (=> d!53801 (= (array_inv!2290 (_values!3651 thiss!1248)) (bvsge (size!3858 (_values!3651 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178236 d!53801))

(declare-fun d!53803 () Bool)

(assert (=> d!53803 (= (validMask!0 (mask!8627 thiss!1248)) (and (or (= (mask!8627 thiss!1248) #b00000000000000000000000000000111) (= (mask!8627 thiss!1248) #b00000000000000000000000000001111) (= (mask!8627 thiss!1248) #b00000000000000000000000000011111) (= (mask!8627 thiss!1248) #b00000000000000000000000000111111) (= (mask!8627 thiss!1248) #b00000000000000000000000001111111) (= (mask!8627 thiss!1248) #b00000000000000000000000011111111) (= (mask!8627 thiss!1248) #b00000000000000000000000111111111) (= (mask!8627 thiss!1248) #b00000000000000000000001111111111) (= (mask!8627 thiss!1248) #b00000000000000000000011111111111) (= (mask!8627 thiss!1248) #b00000000000000000000111111111111) (= (mask!8627 thiss!1248) #b00000000000000000001111111111111) (= (mask!8627 thiss!1248) #b00000000000000000011111111111111) (= (mask!8627 thiss!1248) #b00000000000000000111111111111111) (= (mask!8627 thiss!1248) #b00000000000000001111111111111111) (= (mask!8627 thiss!1248) #b00000000000000011111111111111111) (= (mask!8627 thiss!1248) #b00000000000000111111111111111111) (= (mask!8627 thiss!1248) #b00000000000001111111111111111111) (= (mask!8627 thiss!1248) #b00000000000011111111111111111111) (= (mask!8627 thiss!1248) #b00000000000111111111111111111111) (= (mask!8627 thiss!1248) #b00000000001111111111111111111111) (= (mask!8627 thiss!1248) #b00000000011111111111111111111111) (= (mask!8627 thiss!1248) #b00000000111111111111111111111111) (= (mask!8627 thiss!1248) #b00000001111111111111111111111111) (= (mask!8627 thiss!1248) #b00000011111111111111111111111111) (= (mask!8627 thiss!1248) #b00000111111111111111111111111111) (= (mask!8627 thiss!1248) #b00001111111111111111111111111111) (= (mask!8627 thiss!1248) #b00011111111111111111111111111111) (= (mask!8627 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8627 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178231 d!53803))

(declare-fun d!53805 () Bool)

(declare-fun e!117532 () Bool)

(assert (=> d!53805 e!117532))

(declare-fun res!84451 () Bool)

(assert (=> d!53805 (=> res!84451 e!117532)))

(declare-fun lt!87993 () Bool)

(assert (=> d!53805 (= res!84451 (not lt!87993))))

(declare-fun lt!87990 () Bool)

(assert (=> d!53805 (= lt!87993 lt!87990)))

(declare-datatypes ((Unit!5417 0))(
  ( (Unit!5418) )
))
(declare-fun lt!87992 () Unit!5417)

(declare-fun e!117531 () Unit!5417)

(assert (=> d!53805 (= lt!87992 e!117531)))

(declare-fun c!31948 () Bool)

(assert (=> d!53805 (= c!31948 lt!87990)))

(declare-fun containsKey!201 (List!2264 (_ BitVec 64)) Bool)

(assert (=> d!53805 (= lt!87990 (containsKey!201 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(assert (=> d!53805 (= (contains!1199 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) key!828) lt!87993)))

(declare-fun b!178317 () Bool)

(declare-fun lt!87991 () Unit!5417)

(assert (=> b!178317 (= e!117531 lt!87991)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!150 (List!2264 (_ BitVec 64)) Unit!5417)

(assert (=> b!178317 (= lt!87991 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-datatypes ((Option!203 0))(
  ( (Some!202 (v!4014 V!5217)) (None!201) )
))
(declare-fun isDefined!151 (Option!203) Bool)

(declare-fun getValueByKey!197 (List!2264 (_ BitVec 64)) Option!203)

(assert (=> b!178317 (isDefined!151 (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun b!178318 () Bool)

(declare-fun Unit!5419 () Unit!5417)

(assert (=> b!178318 (= e!117531 Unit!5419)))

(declare-fun b!178319 () Bool)

(assert (=> b!178319 (= e!117532 (isDefined!151 (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828)))))

(assert (= (and d!53805 c!31948) b!178317))

(assert (= (and d!53805 (not c!31948)) b!178318))

(assert (= (and d!53805 (not res!84451)) b!178319))

(declare-fun m!206223 () Bool)

(assert (=> d!53805 m!206223))

(declare-fun m!206225 () Bool)

(assert (=> b!178317 m!206225))

(declare-fun m!206227 () Bool)

(assert (=> b!178317 m!206227))

(assert (=> b!178317 m!206227))

(declare-fun m!206229 () Bool)

(assert (=> b!178317 m!206229))

(assert (=> b!178319 m!206227))

(assert (=> b!178319 m!206227))

(assert (=> b!178319 m!206229))

(assert (=> b!178234 d!53805))

(declare-fun b!178362 () Bool)

(declare-fun e!117564 () Bool)

(declare-fun call!18028 () Bool)

(assert (=> b!178362 (= e!117564 (not call!18028))))

(declare-fun b!178363 () Bool)

(declare-fun res!84475 () Bool)

(declare-fun e!117562 () Bool)

(assert (=> b!178363 (=> (not res!84475) (not e!117562))))

(declare-fun e!117560 () Bool)

(assert (=> b!178363 (= res!84475 e!117560)))

(declare-fun res!84474 () Bool)

(assert (=> b!178363 (=> res!84474 e!117560)))

(declare-fun e!117569 () Bool)

(assert (=> b!178363 (= res!84474 (not e!117569))))

(declare-fun res!84478 () Bool)

(assert (=> b!178363 (=> (not res!84478) (not e!117569))))

(assert (=> b!178363 (= res!84478 (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun b!178364 () Bool)

(declare-fun e!117565 () Unit!5417)

(declare-fun Unit!5420 () Unit!5417)

(assert (=> b!178364 (= e!117565 Unit!5420)))

(declare-fun bm!18019 () Bool)

(declare-fun lt!88055 () ListLongMap!2217)

(assert (=> bm!18019 (= call!18028 (contains!1199 lt!88055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178365 () Bool)

(declare-fun e!117568 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178365 (= e!117568 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178366 () Bool)

(declare-fun e!117567 () Bool)

(declare-fun apply!144 (ListLongMap!2217 (_ BitVec 64)) V!5217)

(declare-fun get!2029 (ValueCell!1745 V!5217) V!5217)

(declare-fun dynLambda!478 (Int (_ BitVec 64)) V!5217)

(assert (=> b!178366 (= e!117567 (= (apply!144 lt!88055 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)) (get!2029 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3858 (_values!3651 thiss!1248))))))

(assert (=> b!178366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun b!178367 () Bool)

(declare-fun e!117571 () ListLongMap!2217)

(declare-fun call!18023 () ListLongMap!2217)

(assert (=> b!178367 (= e!117571 call!18023)))

(declare-fun b!178368 () Bool)

(declare-fun e!117563 () ListLongMap!2217)

(declare-fun call!18022 () ListLongMap!2217)

(assert (=> b!178368 (= e!117563 call!18022)))

(declare-fun b!178369 () Bool)

(declare-fun e!117561 () Bool)

(assert (=> b!178369 (= e!117561 (= (apply!144 lt!88055 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3509 thiss!1248)))))

(declare-fun b!178370 () Bool)

(declare-fun e!117570 () Bool)

(assert (=> b!178370 (= e!117570 e!117561)))

(declare-fun res!84476 () Bool)

(declare-fun call!18025 () Bool)

(assert (=> b!178370 (= res!84476 call!18025)))

(assert (=> b!178370 (=> (not res!84476) (not e!117561))))

(declare-fun bm!18020 () Bool)

(assert (=> bm!18020 (= call!18025 (contains!1199 lt!88055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178371 () Bool)

(declare-fun c!31966 () Bool)

(assert (=> b!178371 (= c!31966 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!178371 (= e!117571 e!117563)))

(declare-fun bm!18021 () Bool)

(declare-fun call!18024 () ListLongMap!2217)

(assert (=> bm!18021 (= call!18023 call!18024)))

(declare-fun d!53807 () Bool)

(assert (=> d!53807 e!117562))

(declare-fun res!84473 () Bool)

(assert (=> d!53807 (=> (not res!84473) (not e!117562))))

(assert (=> d!53807 (= res!84473 (or (bvsge #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))))

(declare-fun lt!88057 () ListLongMap!2217)

(assert (=> d!53807 (= lt!88055 lt!88057)))

(declare-fun lt!88054 () Unit!5417)

(assert (=> d!53807 (= lt!88054 e!117565)))

(declare-fun c!31961 () Bool)

(assert (=> d!53807 (= c!31961 e!117568)))

(declare-fun res!84471 () Bool)

(assert (=> d!53807 (=> (not res!84471) (not e!117568))))

(assert (=> d!53807 (= res!84471 (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun e!117566 () ListLongMap!2217)

(assert (=> d!53807 (= lt!88057 e!117566)))

(declare-fun c!31962 () Bool)

(assert (=> d!53807 (= c!31962 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53807 (validMask!0 (mask!8627 thiss!1248))))

(assert (=> d!53807 (= (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) lt!88055)))

(declare-fun bm!18022 () Bool)

(declare-fun call!18026 () ListLongMap!2217)

(declare-fun call!18027 () ListLongMap!2217)

(assert (=> bm!18022 (= call!18026 call!18027)))

(declare-fun b!178372 () Bool)

(declare-fun +!256 (ListLongMap!2217 tuple2!3298) ListLongMap!2217)

(assert (=> b!178372 (= e!117566 (+!256 call!18024 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))

(declare-fun bm!18023 () Bool)

(assert (=> bm!18023 (= call!18022 call!18026)))

(declare-fun bm!18024 () Bool)

(declare-fun c!31964 () Bool)

(assert (=> bm!18024 (= call!18024 (+!256 (ite c!31962 call!18027 (ite c!31964 call!18026 call!18022)) (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(declare-fun b!178373 () Bool)

(declare-fun e!117559 () Bool)

(assert (=> b!178373 (= e!117564 e!117559)))

(declare-fun res!84477 () Bool)

(assert (=> b!178373 (= res!84477 call!18028)))

(assert (=> b!178373 (=> (not res!84477) (not e!117559))))

(declare-fun b!178374 () Bool)

(assert (=> b!178374 (= e!117566 e!117571)))

(assert (=> b!178374 (= c!31964 (and (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18025 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!165 (array!7493 array!7495 (_ BitVec 32) (_ BitVec 32) V!5217 V!5217 (_ BitVec 32) Int) ListLongMap!2217)

(assert (=> bm!18025 (= call!18027 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun b!178375 () Bool)

(assert (=> b!178375 (= e!117570 (not call!18025))))

(declare-fun b!178376 () Bool)

(assert (=> b!178376 (= e!117560 e!117567)))

(declare-fun res!84470 () Bool)

(assert (=> b!178376 (=> (not res!84470) (not e!117567))))

(assert (=> b!178376 (= res!84470 (contains!1199 lt!88055 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun b!178377 () Bool)

(declare-fun res!84472 () Bool)

(assert (=> b!178377 (=> (not res!84472) (not e!117562))))

(assert (=> b!178377 (= res!84472 e!117564)))

(declare-fun c!31965 () Bool)

(assert (=> b!178377 (= c!31965 (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178378 () Bool)

(assert (=> b!178378 (= e!117559 (= (apply!144 lt!88055 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3509 thiss!1248)))))

(declare-fun b!178379 () Bool)

(assert (=> b!178379 (= e!117562 e!117570)))

(declare-fun c!31963 () Bool)

(assert (=> b!178379 (= c!31963 (not (= (bvand (extraKeys!3405 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178380 () Bool)

(assert (=> b!178380 (= e!117563 call!18023)))

(declare-fun b!178381 () Bool)

(assert (=> b!178381 (= e!117569 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178382 () Bool)

(declare-fun lt!88053 () Unit!5417)

(assert (=> b!178382 (= e!117565 lt!88053)))

(declare-fun lt!88051 () ListLongMap!2217)

(assert (=> b!178382 (= lt!88051 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88056 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88048 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88048 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88040 () Unit!5417)

(declare-fun addStillContains!120 (ListLongMap!2217 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5417)

(assert (=> b!178382 (= lt!88040 (addStillContains!120 lt!88051 lt!88056 (zeroValue!3509 thiss!1248) lt!88048))))

(assert (=> b!178382 (contains!1199 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) lt!88048)))

(declare-fun lt!88052 () Unit!5417)

(assert (=> b!178382 (= lt!88052 lt!88040)))

(declare-fun lt!88047 () ListLongMap!2217)

(assert (=> b!178382 (= lt!88047 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88059 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88059 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88039 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88039 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88038 () Unit!5417)

(declare-fun addApplyDifferent!120 (ListLongMap!2217 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5417)

(assert (=> b!178382 (= lt!88038 (addApplyDifferent!120 lt!88047 lt!88059 (minValue!3509 thiss!1248) lt!88039))))

(assert (=> b!178382 (= (apply!144 (+!256 lt!88047 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) lt!88039) (apply!144 lt!88047 lt!88039))))

(declare-fun lt!88049 () Unit!5417)

(assert (=> b!178382 (= lt!88049 lt!88038)))

(declare-fun lt!88050 () ListLongMap!2217)

(assert (=> b!178382 (= lt!88050 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88045 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88046 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88046 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88058 () Unit!5417)

(assert (=> b!178382 (= lt!88058 (addApplyDifferent!120 lt!88050 lt!88045 (zeroValue!3509 thiss!1248) lt!88046))))

(assert (=> b!178382 (= (apply!144 (+!256 lt!88050 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) lt!88046) (apply!144 lt!88050 lt!88046))))

(declare-fun lt!88043 () Unit!5417)

(assert (=> b!178382 (= lt!88043 lt!88058)))

(declare-fun lt!88041 () ListLongMap!2217)

(assert (=> b!178382 (= lt!88041 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))

(declare-fun lt!88042 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88042 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88044 () (_ BitVec 64))

(assert (=> b!178382 (= lt!88044 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178382 (= lt!88053 (addApplyDifferent!120 lt!88041 lt!88042 (minValue!3509 thiss!1248) lt!88044))))

(assert (=> b!178382 (= (apply!144 (+!256 lt!88041 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) lt!88044) (apply!144 lt!88041 lt!88044))))

(assert (= (and d!53807 c!31962) b!178372))

(assert (= (and d!53807 (not c!31962)) b!178374))

(assert (= (and b!178374 c!31964) b!178367))

(assert (= (and b!178374 (not c!31964)) b!178371))

(assert (= (and b!178371 c!31966) b!178380))

(assert (= (and b!178371 (not c!31966)) b!178368))

(assert (= (or b!178380 b!178368) bm!18023))

(assert (= (or b!178367 bm!18023) bm!18022))

(assert (= (or b!178367 b!178380) bm!18021))

(assert (= (or b!178372 bm!18022) bm!18025))

(assert (= (or b!178372 bm!18021) bm!18024))

(assert (= (and d!53807 res!84471) b!178365))

(assert (= (and d!53807 c!31961) b!178382))

(assert (= (and d!53807 (not c!31961)) b!178364))

(assert (= (and d!53807 res!84473) b!178363))

(assert (= (and b!178363 res!84478) b!178381))

(assert (= (and b!178363 (not res!84474)) b!178376))

(assert (= (and b!178376 res!84470) b!178366))

(assert (= (and b!178363 res!84475) b!178377))

(assert (= (and b!178377 c!31965) b!178373))

(assert (= (and b!178377 (not c!31965)) b!178362))

(assert (= (and b!178373 res!84477) b!178378))

(assert (= (or b!178373 b!178362) bm!18019))

(assert (= (and b!178377 res!84472) b!178379))

(assert (= (and b!178379 c!31963) b!178370))

(assert (= (and b!178379 (not c!31963)) b!178375))

(assert (= (and b!178370 res!84476) b!178369))

(assert (= (or b!178370 b!178375) bm!18020))

(declare-fun b_lambda!7065 () Bool)

(assert (=> (not b_lambda!7065) (not b!178366)))

(declare-fun t!7096 () Bool)

(declare-fun tb!2791 () Bool)

(assert (=> (and b!178236 (= (defaultEntry!3668 thiss!1248) (defaultEntry!3668 thiss!1248)) t!7096) tb!2791))

(declare-fun result!4663 () Bool)

(assert (=> tb!2791 (= result!4663 tp_is_empty!4177)))

(assert (=> b!178366 t!7096))

(declare-fun b_and!10901 () Bool)

(assert (= b_and!10895 (and (=> t!7096 result!4663) b_and!10901)))

(declare-fun m!206231 () Bool)

(assert (=> b!178372 m!206231))

(declare-fun m!206233 () Bool)

(assert (=> bm!18019 m!206233))

(declare-fun m!206235 () Bool)

(assert (=> b!178378 m!206235))

(declare-fun m!206237 () Bool)

(assert (=> bm!18020 m!206237))

(declare-fun m!206239 () Bool)

(assert (=> bm!18025 m!206239))

(declare-fun m!206241 () Bool)

(assert (=> b!178381 m!206241))

(assert (=> b!178381 m!206241))

(declare-fun m!206243 () Bool)

(assert (=> b!178381 m!206243))

(assert (=> b!178376 m!206241))

(assert (=> b!178376 m!206241))

(declare-fun m!206245 () Bool)

(assert (=> b!178376 m!206245))

(assert (=> d!53807 m!206165))

(assert (=> b!178365 m!206241))

(assert (=> b!178365 m!206241))

(assert (=> b!178365 m!206243))

(declare-fun m!206247 () Bool)

(assert (=> b!178369 m!206247))

(declare-fun m!206249 () Bool)

(assert (=> b!178366 m!206249))

(declare-fun m!206251 () Bool)

(assert (=> b!178366 m!206251))

(declare-fun m!206253 () Bool)

(assert (=> b!178366 m!206253))

(assert (=> b!178366 m!206241))

(assert (=> b!178366 m!206251))

(assert (=> b!178366 m!206241))

(declare-fun m!206255 () Bool)

(assert (=> b!178366 m!206255))

(assert (=> b!178366 m!206249))

(declare-fun m!206257 () Bool)

(assert (=> bm!18024 m!206257))

(declare-fun m!206259 () Bool)

(assert (=> b!178382 m!206259))

(declare-fun m!206261 () Bool)

(assert (=> b!178382 m!206261))

(declare-fun m!206263 () Bool)

(assert (=> b!178382 m!206263))

(assert (=> b!178382 m!206239))

(assert (=> b!178382 m!206259))

(declare-fun m!206265 () Bool)

(assert (=> b!178382 m!206265))

(declare-fun m!206267 () Bool)

(assert (=> b!178382 m!206267))

(declare-fun m!206269 () Bool)

(assert (=> b!178382 m!206269))

(declare-fun m!206271 () Bool)

(assert (=> b!178382 m!206271))

(declare-fun m!206273 () Bool)

(assert (=> b!178382 m!206273))

(declare-fun m!206275 () Bool)

(assert (=> b!178382 m!206275))

(assert (=> b!178382 m!206263))

(declare-fun m!206277 () Bool)

(assert (=> b!178382 m!206277))

(declare-fun m!206279 () Bool)

(assert (=> b!178382 m!206279))

(declare-fun m!206281 () Bool)

(assert (=> b!178382 m!206281))

(assert (=> b!178382 m!206273))

(declare-fun m!206283 () Bool)

(assert (=> b!178382 m!206283))

(assert (=> b!178382 m!206267))

(declare-fun m!206285 () Bool)

(assert (=> b!178382 m!206285))

(assert (=> b!178382 m!206241))

(declare-fun m!206287 () Bool)

(assert (=> b!178382 m!206287))

(assert (=> b!178234 d!53807))

(declare-fun d!53809 () Bool)

(declare-fun res!84485 () Bool)

(declare-fun e!117574 () Bool)

(assert (=> d!53809 (=> (not res!84485) (not e!117574))))

(declare-fun simpleValid!158 (LongMapFixedSize!2398) Bool)

(assert (=> d!53809 (= res!84485 (simpleValid!158 thiss!1248))))

(assert (=> d!53809 (= (valid!1019 thiss!1248) e!117574)))

(declare-fun b!178391 () Bool)

(declare-fun res!84486 () Bool)

(assert (=> b!178391 (=> (not res!84486) (not e!117574))))

(declare-fun arrayCountValidKeys!0 (array!7493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178391 (= res!84486 (= (arrayCountValidKeys!0 (_keys!5544 thiss!1248) #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))) (_size!1248 thiss!1248)))))

(declare-fun b!178392 () Bool)

(declare-fun res!84487 () Bool)

(assert (=> b!178392 (=> (not res!84487) (not e!117574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7493 (_ BitVec 32)) Bool)

(assert (=> b!178392 (= res!84487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(declare-fun b!178393 () Bool)

(declare-datatypes ((List!2266 0))(
  ( (Nil!2263) (Cons!2262 (h!2885 (_ BitVec 64)) (t!7097 List!2266)) )
))
(declare-fun arrayNoDuplicates!0 (array!7493 (_ BitVec 32) List!2266) Bool)

(assert (=> b!178393 (= e!117574 (arrayNoDuplicates!0 (_keys!5544 thiss!1248) #b00000000000000000000000000000000 Nil!2263))))

(assert (= (and d!53809 res!84485) b!178391))

(assert (= (and b!178391 res!84486) b!178392))

(assert (= (and b!178392 res!84487) b!178393))

(declare-fun m!206289 () Bool)

(assert (=> d!53809 m!206289))

(declare-fun m!206291 () Bool)

(assert (=> b!178391 m!206291))

(declare-fun m!206293 () Bool)

(assert (=> b!178392 m!206293))

(declare-fun m!206295 () Bool)

(assert (=> b!178393 m!206295))

(assert (=> start!17884 d!53809))

(declare-fun mapNonEmpty!7151 () Bool)

(declare-fun mapRes!7151 () Bool)

(declare-fun tp!15944 () Bool)

(declare-fun e!117579 () Bool)

(assert (=> mapNonEmpty!7151 (= mapRes!7151 (and tp!15944 e!117579))))

(declare-fun mapRest!7151 () (Array (_ BitVec 32) ValueCell!1745))

(declare-fun mapKey!7151 () (_ BitVec 32))

(declare-fun mapValue!7151 () ValueCell!1745)

(assert (=> mapNonEmpty!7151 (= mapRest!7142 (store mapRest!7151 mapKey!7151 mapValue!7151))))

(declare-fun condMapEmpty!7151 () Bool)

(declare-fun mapDefault!7151 () ValueCell!1745)

(assert (=> mapNonEmpty!7142 (= condMapEmpty!7151 (= mapRest!7142 ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7151)))))

(declare-fun e!117580 () Bool)

(assert (=> mapNonEmpty!7142 (= tp!15928 (and e!117580 mapRes!7151))))

(declare-fun mapIsEmpty!7151 () Bool)

(assert (=> mapIsEmpty!7151 mapRes!7151))

(declare-fun b!178401 () Bool)

(assert (=> b!178401 (= e!117580 tp_is_empty!4177)))

(declare-fun b!178400 () Bool)

(assert (=> b!178400 (= e!117579 tp_is_empty!4177)))

(assert (= (and mapNonEmpty!7142 condMapEmpty!7151) mapIsEmpty!7151))

(assert (= (and mapNonEmpty!7142 (not condMapEmpty!7151)) mapNonEmpty!7151))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1745) mapValue!7151)) b!178400))

(assert (= (and mapNonEmpty!7142 ((_ is ValueCellFull!1745) mapDefault!7151)) b!178401))

(declare-fun m!206297 () Bool)

(assert (=> mapNonEmpty!7151 m!206297))

(declare-fun b_lambda!7067 () Bool)

(assert (= b_lambda!7065 (or (and b!178236 b_free!4405) b_lambda!7067)))

(check-sat (not b!178391) (not b!178317) (not b!178393) (not b_next!4405) (not b_lambda!7067) (not b!178381) (not b!178378) (not d!53807) (not b!178319) (not bm!18024) (not b!178392) (not d!53805) (not b!178369) (not b!178382) (not b!178307) (not mapNonEmpty!7151) (not bm!18025) (not bm!18020) (not bm!18019) b_and!10901 tp_is_empty!4177 (not b!178376) (not b!178365) (not d!53797) (not b!178366) (not b!178372) (not d!53809))
(check-sat b_and!10901 (not b_next!4405))
(get-model)

(declare-fun b!178414 () Bool)

(declare-fun e!117588 () SeekEntryResult!584)

(declare-fun e!117589 () SeekEntryResult!584)

(assert (=> b!178414 (= e!117588 e!117589)))

(declare-fun c!31974 () Bool)

(declare-fun lt!88065 () (_ BitVec 64))

(assert (=> b!178414 (= c!31974 (= lt!88065 key!828))))

(declare-fun b!178415 () Bool)

(declare-fun c!31973 () Bool)

(assert (=> b!178415 (= c!31973 (= lt!88065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117587 () SeekEntryResult!584)

(assert (=> b!178415 (= e!117589 e!117587)))

(declare-fun b!178416 () Bool)

(assert (=> b!178416 (= e!117587 (MissingVacant!584 (index!4506 lt!87981)))))

(declare-fun b!178417 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178417 (= e!117587 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19551 lt!87981) #b00000000000000000000000000000001) (nextIndex!0 (index!4506 lt!87981) (x!19551 lt!87981) (mask!8627 thiss!1248)) (index!4506 lt!87981) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(declare-fun b!178418 () Bool)

(assert (=> b!178418 (= e!117588 Undefined!584)))

(declare-fun d!53811 () Bool)

(declare-fun lt!88064 () SeekEntryResult!584)

(assert (=> d!53811 (and (or ((_ is Undefined!584) lt!88064) (not ((_ is Found!584) lt!88064)) (and (bvsge (index!4505 lt!88064) #b00000000000000000000000000000000) (bvslt (index!4505 lt!88064) (size!3857 (_keys!5544 thiss!1248))))) (or ((_ is Undefined!584) lt!88064) ((_ is Found!584) lt!88064) (not ((_ is MissingVacant!584) lt!88064)) (not (= (index!4507 lt!88064) (index!4506 lt!87981))) (and (bvsge (index!4507 lt!88064) #b00000000000000000000000000000000) (bvslt (index!4507 lt!88064) (size!3857 (_keys!5544 thiss!1248))))) (or ((_ is Undefined!584) lt!88064) (ite ((_ is Found!584) lt!88064) (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4505 lt!88064)) key!828) (and ((_ is MissingVacant!584) lt!88064) (= (index!4507 lt!88064) (index!4506 lt!87981)) (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4507 lt!88064)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53811 (= lt!88064 e!117588)))

(declare-fun c!31975 () Bool)

(assert (=> d!53811 (= c!31975 (bvsge (x!19551 lt!87981) #b01111111111111111111111111111110))))

(assert (=> d!53811 (= lt!88065 (select (arr!3550 (_keys!5544 thiss!1248)) (index!4506 lt!87981)))))

(assert (=> d!53811 (validMask!0 (mask!8627 thiss!1248))))

(assert (=> d!53811 (= (seekKeyOrZeroReturnVacant!0 (x!19551 lt!87981) (index!4506 lt!87981) (index!4506 lt!87981) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)) lt!88064)))

(declare-fun b!178419 () Bool)

(assert (=> b!178419 (= e!117589 (Found!584 (index!4506 lt!87981)))))

(assert (= (and d!53811 c!31975) b!178418))

(assert (= (and d!53811 (not c!31975)) b!178414))

(assert (= (and b!178414 c!31974) b!178419))

(assert (= (and b!178414 (not c!31974)) b!178415))

(assert (= (and b!178415 c!31973) b!178416))

(assert (= (and b!178415 (not c!31973)) b!178417))

(declare-fun m!206299 () Bool)

(assert (=> b!178417 m!206299))

(assert (=> b!178417 m!206299))

(declare-fun m!206301 () Bool)

(assert (=> b!178417 m!206301))

(declare-fun m!206303 () Bool)

(assert (=> d!53811 m!206303))

(declare-fun m!206305 () Bool)

(assert (=> d!53811 m!206305))

(assert (=> d!53811 m!206219))

(assert (=> d!53811 m!206165))

(assert (=> b!178307 d!53811))

(declare-fun d!53813 () Bool)

(declare-fun get!2030 (Option!203) V!5217)

(assert (=> d!53813 (= (apply!144 lt!88055 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2030 (getValueByKey!197 (toList!1124 lt!88055) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7299 () Bool)

(assert (= bs!7299 d!53813))

(declare-fun m!206307 () Bool)

(assert (=> bs!7299 m!206307))

(assert (=> bs!7299 m!206307))

(declare-fun m!206309 () Bool)

(assert (=> bs!7299 m!206309))

(assert (=> b!178378 d!53813))

(declare-fun d!53815 () Bool)

(declare-fun e!117591 () Bool)

(assert (=> d!53815 e!117591))

(declare-fun res!84488 () Bool)

(assert (=> d!53815 (=> res!84488 e!117591)))

(declare-fun lt!88069 () Bool)

(assert (=> d!53815 (= res!84488 (not lt!88069))))

(declare-fun lt!88066 () Bool)

(assert (=> d!53815 (= lt!88069 lt!88066)))

(declare-fun lt!88068 () Unit!5417)

(declare-fun e!117590 () Unit!5417)

(assert (=> d!53815 (= lt!88068 e!117590)))

(declare-fun c!31976 () Bool)

(assert (=> d!53815 (= c!31976 lt!88066)))

(assert (=> d!53815 (= lt!88066 (containsKey!201 (toList!1124 lt!88055) (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53815 (= (contains!1199 lt!88055 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)) lt!88069)))

(declare-fun b!178420 () Bool)

(declare-fun lt!88067 () Unit!5417)

(assert (=> b!178420 (= e!117590 lt!88067)))

(assert (=> b!178420 (= lt!88067 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 lt!88055) (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178420 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178421 () Bool)

(declare-fun Unit!5421 () Unit!5417)

(assert (=> b!178421 (= e!117590 Unit!5421)))

(declare-fun b!178422 () Bool)

(assert (=> b!178422 (= e!117591 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53815 c!31976) b!178420))

(assert (= (and d!53815 (not c!31976)) b!178421))

(assert (= (and d!53815 (not res!84488)) b!178422))

(assert (=> d!53815 m!206241))

(declare-fun m!206311 () Bool)

(assert (=> d!53815 m!206311))

(assert (=> b!178420 m!206241))

(declare-fun m!206313 () Bool)

(assert (=> b!178420 m!206313))

(assert (=> b!178420 m!206241))

(declare-fun m!206315 () Bool)

(assert (=> b!178420 m!206315))

(assert (=> b!178420 m!206315))

(declare-fun m!206317 () Bool)

(assert (=> b!178420 m!206317))

(assert (=> b!178422 m!206241))

(assert (=> b!178422 m!206315))

(assert (=> b!178422 m!206315))

(assert (=> b!178422 m!206317))

(assert (=> b!178376 d!53815))

(declare-fun d!53817 () Bool)

(declare-fun e!117593 () Bool)

(assert (=> d!53817 e!117593))

(declare-fun res!84489 () Bool)

(assert (=> d!53817 (=> res!84489 e!117593)))

(declare-fun lt!88073 () Bool)

(assert (=> d!53817 (= res!84489 (not lt!88073))))

(declare-fun lt!88070 () Bool)

(assert (=> d!53817 (= lt!88073 lt!88070)))

(declare-fun lt!88072 () Unit!5417)

(declare-fun e!117592 () Unit!5417)

(assert (=> d!53817 (= lt!88072 e!117592)))

(declare-fun c!31977 () Bool)

(assert (=> d!53817 (= c!31977 lt!88070)))

(assert (=> d!53817 (= lt!88070 (containsKey!201 (toList!1124 lt!88055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53817 (= (contains!1199 lt!88055 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88073)))

(declare-fun b!178423 () Bool)

(declare-fun lt!88071 () Unit!5417)

(assert (=> b!178423 (= e!117592 lt!88071)))

(assert (=> b!178423 (= lt!88071 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 lt!88055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178423 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178424 () Bool)

(declare-fun Unit!5422 () Unit!5417)

(assert (=> b!178424 (= e!117592 Unit!5422)))

(declare-fun b!178425 () Bool)

(assert (=> b!178425 (= e!117593 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53817 c!31977) b!178423))

(assert (= (and d!53817 (not c!31977)) b!178424))

(assert (= (and d!53817 (not res!84489)) b!178425))

(declare-fun m!206319 () Bool)

(assert (=> d!53817 m!206319))

(declare-fun m!206321 () Bool)

(assert (=> b!178423 m!206321))

(declare-fun m!206323 () Bool)

(assert (=> b!178423 m!206323))

(assert (=> b!178423 m!206323))

(declare-fun m!206325 () Bool)

(assert (=> b!178423 m!206325))

(assert (=> b!178425 m!206323))

(assert (=> b!178425 m!206323))

(assert (=> b!178425 m!206325))

(assert (=> bm!18020 d!53817))

(declare-fun d!53819 () Bool)

(declare-fun res!84497 () Bool)

(declare-fun e!117604 () Bool)

(assert (=> d!53819 (=> res!84497 e!117604)))

(assert (=> d!53819 (= res!84497 (bvsge #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> d!53819 (= (arrayNoDuplicates!0 (_keys!5544 thiss!1248) #b00000000000000000000000000000000 Nil!2263) e!117604)))

(declare-fun b!178436 () Bool)

(declare-fun e!117602 () Bool)

(declare-fun contains!1201 (List!2266 (_ BitVec 64)) Bool)

(assert (=> b!178436 (= e!117602 (contains!1201 Nil!2263 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178437 () Bool)

(declare-fun e!117603 () Bool)

(declare-fun call!18031 () Bool)

(assert (=> b!178437 (= e!117603 call!18031)))

(declare-fun b!178438 () Bool)

(declare-fun e!117605 () Bool)

(assert (=> b!178438 (= e!117605 e!117603)))

(declare-fun c!31980 () Bool)

(assert (=> b!178438 (= c!31980 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178439 () Bool)

(assert (=> b!178439 (= e!117603 call!18031)))

(declare-fun b!178440 () Bool)

(assert (=> b!178440 (= e!117604 e!117605)))

(declare-fun res!84498 () Bool)

(assert (=> b!178440 (=> (not res!84498) (not e!117605))))

(assert (=> b!178440 (= res!84498 (not e!117602))))

(declare-fun res!84496 () Bool)

(assert (=> b!178440 (=> (not res!84496) (not e!117602))))

(assert (=> b!178440 (= res!84496 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18028 () Bool)

(assert (=> bm!18028 (= call!18031 (arrayNoDuplicates!0 (_keys!5544 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31980 (Cons!2262 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000) Nil!2263) Nil!2263)))))

(assert (= (and d!53819 (not res!84497)) b!178440))

(assert (= (and b!178440 res!84496) b!178436))

(assert (= (and b!178440 res!84498) b!178438))

(assert (= (and b!178438 c!31980) b!178439))

(assert (= (and b!178438 (not c!31980)) b!178437))

(assert (= (or b!178439 b!178437) bm!18028))

(assert (=> b!178436 m!206241))

(assert (=> b!178436 m!206241))

(declare-fun m!206327 () Bool)

(assert (=> b!178436 m!206327))

(assert (=> b!178438 m!206241))

(assert (=> b!178438 m!206241))

(assert (=> b!178438 m!206243))

(assert (=> b!178440 m!206241))

(assert (=> b!178440 m!206241))

(assert (=> b!178440 m!206243))

(assert (=> bm!18028 m!206241))

(declare-fun m!206329 () Bool)

(assert (=> bm!18028 m!206329))

(assert (=> b!178393 d!53819))

(declare-fun d!53821 () Bool)

(assert (=> d!53821 (= (apply!144 lt!88055 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2030 (getValueByKey!197 (toList!1124 lt!88055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7300 () Bool)

(assert (= bs!7300 d!53821))

(assert (=> bs!7300 m!206323))

(assert (=> bs!7300 m!206323))

(declare-fun m!206331 () Bool)

(assert (=> bs!7300 m!206331))

(assert (=> b!178369 d!53821))

(declare-fun d!53823 () Bool)

(declare-fun isEmpty!455 (Option!203) Bool)

(assert (=> d!53823 (= (isDefined!151 (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828)) (not (isEmpty!455 (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))))

(declare-fun bs!7301 () Bool)

(assert (= bs!7301 d!53823))

(assert (=> bs!7301 m!206227))

(declare-fun m!206333 () Bool)

(assert (=> bs!7301 m!206333))

(assert (=> b!178319 d!53823))

(declare-fun b!178449 () Bool)

(declare-fun e!117610 () Option!203)

(assert (=> b!178449 (= e!117610 (Some!202 (_2!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))))))

(declare-fun b!178451 () Bool)

(declare-fun e!117611 () Option!203)

(assert (=> b!178451 (= e!117611 (getValueByKey!197 (t!7093 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) key!828))))

(declare-fun b!178452 () Bool)

(assert (=> b!178452 (= e!117611 None!201)))

(declare-fun b!178450 () Bool)

(assert (=> b!178450 (= e!117610 e!117611)))

(declare-fun c!31986 () Bool)

(assert (=> b!178450 (= c!31986 (and ((_ is Cons!2260) (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (not (= (_1!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828))))))

(declare-fun d!53825 () Bool)

(declare-fun c!31985 () Bool)

(assert (=> d!53825 (= c!31985 (and ((_ is Cons!2260) (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (= (_1!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(assert (=> d!53825 (= (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) e!117610)))

(assert (= (and d!53825 c!31985) b!178449))

(assert (= (and d!53825 (not c!31985)) b!178450))

(assert (= (and b!178450 c!31986) b!178451))

(assert (= (and b!178450 (not c!31986)) b!178452))

(declare-fun m!206335 () Bool)

(assert (=> b!178451 m!206335))

(assert (=> b!178319 d!53825))

(declare-fun b!178461 () Bool)

(declare-fun e!117617 () (_ BitVec 32))

(declare-fun call!18034 () (_ BitVec 32))

(assert (=> b!178461 (= e!117617 call!18034)))

(declare-fun b!178462 () Bool)

(declare-fun e!117616 () (_ BitVec 32))

(assert (=> b!178462 (= e!117616 #b00000000000000000000000000000000)))

(declare-fun b!178463 () Bool)

(assert (=> b!178463 (= e!117617 (bvadd #b00000000000000000000000000000001 call!18034))))

(declare-fun d!53827 () Bool)

(declare-fun lt!88076 () (_ BitVec 32))

(assert (=> d!53827 (and (bvsge lt!88076 #b00000000000000000000000000000000) (bvsle lt!88076 (bvsub (size!3857 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53827 (= lt!88076 e!117616)))

(declare-fun c!31992 () Bool)

(assert (=> d!53827 (= c!31992 (bvsge #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> d!53827 (and (bvsle #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3857 (_keys!5544 thiss!1248)) (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> d!53827 (= (arrayCountValidKeys!0 (_keys!5544 thiss!1248) #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))) lt!88076)))

(declare-fun bm!18031 () Bool)

(assert (=> bm!18031 (= call!18034 (arrayCountValidKeys!0 (_keys!5544 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun b!178464 () Bool)

(assert (=> b!178464 (= e!117616 e!117617)))

(declare-fun c!31991 () Bool)

(assert (=> b!178464 (= c!31991 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53827 c!31992) b!178462))

(assert (= (and d!53827 (not c!31992)) b!178464))

(assert (= (and b!178464 c!31991) b!178463))

(assert (= (and b!178464 (not c!31991)) b!178461))

(assert (= (or b!178463 b!178461) bm!18031))

(declare-fun m!206337 () Bool)

(assert (=> bm!18031 m!206337))

(assert (=> b!178464 m!206241))

(assert (=> b!178464 m!206241))

(assert (=> b!178464 m!206243))

(assert (=> b!178391 d!53827))

(declare-fun b!178473 () Bool)

(declare-fun e!117624 () Bool)

(declare-fun call!18037 () Bool)

(assert (=> b!178473 (= e!117624 call!18037)))

(declare-fun b!178474 () Bool)

(declare-fun e!117626 () Bool)

(assert (=> b!178474 (= e!117626 e!117624)))

(declare-fun lt!88083 () (_ BitVec 64))

(assert (=> b!178474 (= lt!88083 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88085 () Unit!5417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7493 (_ BitVec 64) (_ BitVec 32)) Unit!5417)

(assert (=> b!178474 (= lt!88085 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5544 thiss!1248) lt!88083 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178474 (arrayContainsKey!0 (_keys!5544 thiss!1248) lt!88083 #b00000000000000000000000000000000)))

(declare-fun lt!88084 () Unit!5417)

(assert (=> b!178474 (= lt!88084 lt!88085)))

(declare-fun res!84504 () Bool)

(assert (=> b!178474 (= res!84504 (= (seekEntryOrOpen!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000) (_keys!5544 thiss!1248) (mask!8627 thiss!1248)) (Found!584 #b00000000000000000000000000000000)))))

(assert (=> b!178474 (=> (not res!84504) (not e!117624))))

(declare-fun b!178475 () Bool)

(assert (=> b!178475 (= e!117626 call!18037)))

(declare-fun bm!18034 () Bool)

(assert (=> bm!18034 (= call!18037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(declare-fun b!178476 () Bool)

(declare-fun e!117625 () Bool)

(assert (=> b!178476 (= e!117625 e!117626)))

(declare-fun c!31995 () Bool)

(assert (=> b!178476 (= c!31995 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53829 () Bool)

(declare-fun res!84503 () Bool)

(assert (=> d!53829 (=> res!84503 e!117625)))

(assert (=> d!53829 (= res!84503 (bvsge #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> d!53829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)) e!117625)))

(assert (= (and d!53829 (not res!84503)) b!178476))

(assert (= (and b!178476 c!31995) b!178474))

(assert (= (and b!178476 (not c!31995)) b!178475))

(assert (= (and b!178474 res!84504) b!178473))

(assert (= (or b!178473 b!178475) bm!18034))

(assert (=> b!178474 m!206241))

(declare-fun m!206339 () Bool)

(assert (=> b!178474 m!206339))

(declare-fun m!206341 () Bool)

(assert (=> b!178474 m!206341))

(assert (=> b!178474 m!206241))

(declare-fun m!206343 () Bool)

(assert (=> b!178474 m!206343))

(declare-fun m!206345 () Bool)

(assert (=> bm!18034 m!206345))

(assert (=> b!178476 m!206241))

(assert (=> b!178476 m!206241))

(assert (=> b!178476 m!206243))

(assert (=> b!178392 d!53829))

(declare-fun b!178501 () Bool)

(declare-fun res!84514 () Bool)

(declare-fun e!117644 () Bool)

(assert (=> b!178501 (=> (not res!84514) (not e!117644))))

(declare-fun lt!88104 () ListLongMap!2217)

(assert (=> b!178501 (= res!84514 (not (contains!1199 lt!88104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178502 () Bool)

(declare-fun lt!88100 () Unit!5417)

(declare-fun lt!88103 () Unit!5417)

(assert (=> b!178502 (= lt!88100 lt!88103)))

(declare-fun lt!88102 () ListLongMap!2217)

(declare-fun lt!88101 () (_ BitVec 64))

(declare-fun lt!88105 () V!5217)

(declare-fun lt!88106 () (_ BitVec 64))

(assert (=> b!178502 (not (contains!1199 (+!256 lt!88102 (tuple2!3299 lt!88101 lt!88105)) lt!88106))))

(declare-fun addStillNotContains!80 (ListLongMap!2217 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5417)

(assert (=> b!178502 (= lt!88103 (addStillNotContains!80 lt!88102 lt!88101 lt!88105 lt!88106))))

(assert (=> b!178502 (= lt!88106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178502 (= lt!88105 (get!2029 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178502 (= lt!88101 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18040 () ListLongMap!2217)

(assert (=> b!178502 (= lt!88102 call!18040)))

(declare-fun e!117646 () ListLongMap!2217)

(assert (=> b!178502 (= e!117646 (+!256 call!18040 (tuple2!3299 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000) (get!2029 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!178503 () Bool)

(declare-fun e!117641 () ListLongMap!2217)

(assert (=> b!178503 (= e!117641 (ListLongMap!2218 Nil!2261))))

(declare-fun b!178504 () Bool)

(declare-fun e!117647 () Bool)

(assert (=> b!178504 (= e!117647 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178504 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!178505 () Bool)

(assert (=> b!178505 (= e!117641 e!117646)))

(declare-fun c!32006 () Bool)

(assert (=> b!178505 (= c!32006 (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178507 () Bool)

(declare-fun e!117645 () Bool)

(declare-fun e!117643 () Bool)

(assert (=> b!178507 (= e!117645 e!117643)))

(assert (=> b!178507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun res!84516 () Bool)

(assert (=> b!178507 (= res!84516 (contains!1199 lt!88104 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178507 (=> (not res!84516) (not e!117643))))

(declare-fun b!178508 () Bool)

(assert (=> b!178508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> b!178508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3858 (_values!3651 thiss!1248))))))

(assert (=> b!178508 (= e!117643 (= (apply!144 lt!88104 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)) (get!2029 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178509 () Bool)

(declare-fun e!117642 () Bool)

(declare-fun isEmpty!456 (ListLongMap!2217) Bool)

(assert (=> b!178509 (= e!117642 (isEmpty!456 lt!88104))))

(declare-fun b!178510 () Bool)

(assert (=> b!178510 (= e!117646 call!18040)))

(declare-fun b!178511 () Bool)

(assert (=> b!178511 (= e!117645 e!117642)))

(declare-fun c!32004 () Bool)

(assert (=> b!178511 (= c!32004 (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun bm!18037 () Bool)

(assert (=> bm!18037 (= call!18040 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3668 thiss!1248)))))

(declare-fun b!178512 () Bool)

(assert (=> b!178512 (= e!117644 e!117645)))

(declare-fun c!32005 () Bool)

(assert (=> b!178512 (= c!32005 e!117647)))

(declare-fun res!84513 () Bool)

(assert (=> b!178512 (=> (not res!84513) (not e!117647))))

(assert (=> b!178512 (= res!84513 (bvslt #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun d!53831 () Bool)

(assert (=> d!53831 e!117644))

(declare-fun res!84515 () Bool)

(assert (=> d!53831 (=> (not res!84515) (not e!117644))))

(assert (=> d!53831 (= res!84515 (not (contains!1199 lt!88104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53831 (= lt!88104 e!117641)))

(declare-fun c!32007 () Bool)

(assert (=> d!53831 (= c!32007 (bvsge #b00000000000000000000000000000000 (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> d!53831 (validMask!0 (mask!8627 thiss!1248))))

(assert (=> d!53831 (= (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)) lt!88104)))

(declare-fun b!178506 () Bool)

(assert (=> b!178506 (= e!117642 (= lt!88104 (getCurrentListMapNoExtraKeys!165 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3668 thiss!1248))))))

(assert (= (and d!53831 c!32007) b!178503))

(assert (= (and d!53831 (not c!32007)) b!178505))

(assert (= (and b!178505 c!32006) b!178502))

(assert (= (and b!178505 (not c!32006)) b!178510))

(assert (= (or b!178502 b!178510) bm!18037))

(assert (= (and d!53831 res!84515) b!178501))

(assert (= (and b!178501 res!84514) b!178512))

(assert (= (and b!178512 res!84513) b!178504))

(assert (= (and b!178512 c!32005) b!178507))

(assert (= (and b!178512 (not c!32005)) b!178511))

(assert (= (and b!178507 res!84516) b!178508))

(assert (= (and b!178511 c!32004) b!178506))

(assert (= (and b!178511 (not c!32004)) b!178509))

(declare-fun b_lambda!7069 () Bool)

(assert (=> (not b_lambda!7069) (not b!178502)))

(assert (=> b!178502 t!7096))

(declare-fun b_and!10903 () Bool)

(assert (= b_and!10901 (and (=> t!7096 result!4663) b_and!10903)))

(declare-fun b_lambda!7071 () Bool)

(assert (=> (not b_lambda!7071) (not b!178508)))

(assert (=> b!178508 t!7096))

(declare-fun b_and!10905 () Bool)

(assert (= b_and!10903 (and (=> t!7096 result!4663) b_and!10905)))

(declare-fun m!206347 () Bool)

(assert (=> b!178501 m!206347))

(assert (=> b!178508 m!206241))

(declare-fun m!206349 () Bool)

(assert (=> b!178508 m!206349))

(assert (=> b!178508 m!206241))

(assert (=> b!178508 m!206249))

(assert (=> b!178508 m!206251))

(assert (=> b!178508 m!206253))

(assert (=> b!178508 m!206251))

(assert (=> b!178508 m!206249))

(declare-fun m!206351 () Bool)

(assert (=> b!178502 m!206351))

(assert (=> b!178502 m!206249))

(assert (=> b!178502 m!206251))

(assert (=> b!178502 m!206253))

(declare-fun m!206353 () Bool)

(assert (=> b!178502 m!206353))

(declare-fun m!206355 () Bool)

(assert (=> b!178502 m!206355))

(assert (=> b!178502 m!206353))

(declare-fun m!206357 () Bool)

(assert (=> b!178502 m!206357))

(assert (=> b!178502 m!206241))

(assert (=> b!178502 m!206251))

(assert (=> b!178502 m!206249))

(declare-fun m!206359 () Bool)

(assert (=> b!178506 m!206359))

(declare-fun m!206361 () Bool)

(assert (=> b!178509 m!206361))

(assert (=> bm!18037 m!206359))

(assert (=> b!178507 m!206241))

(assert (=> b!178507 m!206241))

(declare-fun m!206363 () Bool)

(assert (=> b!178507 m!206363))

(declare-fun m!206365 () Bool)

(assert (=> d!53831 m!206365))

(assert (=> d!53831 m!206165))

(assert (=> b!178504 m!206241))

(assert (=> b!178504 m!206241))

(assert (=> b!178504 m!206243))

(assert (=> b!178505 m!206241))

(assert (=> b!178505 m!206241))

(assert (=> b!178505 m!206243))

(assert (=> bm!18025 d!53831))

(assert (=> d!53807 d!53803))

(declare-fun b!178523 () Bool)

(declare-fun res!84526 () Bool)

(declare-fun e!117650 () Bool)

(assert (=> b!178523 (=> (not res!84526) (not e!117650))))

(declare-fun size!3863 (LongMapFixedSize!2398) (_ BitVec 32))

(assert (=> b!178523 (= res!84526 (= (size!3863 thiss!1248) (bvadd (_size!1248 thiss!1248) (bvsdiv (bvadd (extraKeys!3405 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!178524 () Bool)

(assert (=> b!178524 (= e!117650 (and (bvsge (extraKeys!3405 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3405 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1248 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178522 () Bool)

(declare-fun res!84525 () Bool)

(assert (=> b!178522 (=> (not res!84525) (not e!117650))))

(assert (=> b!178522 (= res!84525 (bvsge (size!3863 thiss!1248) (_size!1248 thiss!1248)))))

(declare-fun b!178521 () Bool)

(declare-fun res!84527 () Bool)

(assert (=> b!178521 (=> (not res!84527) (not e!117650))))

(assert (=> b!178521 (= res!84527 (and (= (size!3858 (_values!3651 thiss!1248)) (bvadd (mask!8627 thiss!1248) #b00000000000000000000000000000001)) (= (size!3857 (_keys!5544 thiss!1248)) (size!3858 (_values!3651 thiss!1248))) (bvsge (_size!1248 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1248 thiss!1248) (bvadd (mask!8627 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53833 () Bool)

(declare-fun res!84528 () Bool)

(assert (=> d!53833 (=> (not res!84528) (not e!117650))))

(assert (=> d!53833 (= res!84528 (validMask!0 (mask!8627 thiss!1248)))))

(assert (=> d!53833 (= (simpleValid!158 thiss!1248) e!117650)))

(assert (= (and d!53833 res!84528) b!178521))

(assert (= (and b!178521 res!84527) b!178522))

(assert (= (and b!178522 res!84525) b!178523))

(assert (= (and b!178523 res!84526) b!178524))

(declare-fun m!206367 () Bool)

(assert (=> b!178523 m!206367))

(assert (=> b!178522 m!206367))

(assert (=> d!53833 m!206165))

(assert (=> d!53809 d!53833))

(declare-fun d!53835 () Bool)

(declare-fun e!117653 () Bool)

(assert (=> d!53835 e!117653))

(declare-fun res!84534 () Bool)

(assert (=> d!53835 (=> (not res!84534) (not e!117653))))

(declare-fun lt!88117 () ListLongMap!2217)

(assert (=> d!53835 (= res!84534 (contains!1199 lt!88117 (_1!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun lt!88116 () List!2264)

(assert (=> d!53835 (= lt!88117 (ListLongMap!2218 lt!88116))))

(declare-fun lt!88118 () Unit!5417)

(declare-fun lt!88115 () Unit!5417)

(assert (=> d!53835 (= lt!88118 lt!88115)))

(assert (=> d!53835 (= (getValueByKey!197 lt!88116 (_1!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))) (Some!202 (_2!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!106 (List!2264 (_ BitVec 64) V!5217) Unit!5417)

(assert (=> d!53835 (= lt!88115 (lemmaContainsTupThenGetReturnValue!106 lt!88116 (_1!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (_2!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun insertStrictlySorted!109 (List!2264 (_ BitVec 64) V!5217) List!2264)

(assert (=> d!53835 (= lt!88116 (insertStrictlySorted!109 (toList!1124 (ite c!31962 call!18027 (ite c!31964 call!18026 call!18022))) (_1!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (_2!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(assert (=> d!53835 (= (+!256 (ite c!31962 call!18027 (ite c!31964 call!18026 call!18022)) (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) lt!88117)))

(declare-fun b!178529 () Bool)

(declare-fun res!84533 () Bool)

(assert (=> b!178529 (=> (not res!84533) (not e!117653))))

(assert (=> b!178529 (= res!84533 (= (getValueByKey!197 (toList!1124 lt!88117) (_1!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))) (Some!202 (_2!1660 (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))))

(declare-fun b!178530 () Bool)

(declare-fun contains!1202 (List!2264 tuple2!3298) Bool)

(assert (=> b!178530 (= e!117653 (contains!1202 (toList!1124 lt!88117) (ite (or c!31962 c!31964) (tuple2!3299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3509 thiss!1248)) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (= (and d!53835 res!84534) b!178529))

(assert (= (and b!178529 res!84533) b!178530))

(declare-fun m!206369 () Bool)

(assert (=> d!53835 m!206369))

(declare-fun m!206371 () Bool)

(assert (=> d!53835 m!206371))

(declare-fun m!206373 () Bool)

(assert (=> d!53835 m!206373))

(declare-fun m!206375 () Bool)

(assert (=> d!53835 m!206375))

(declare-fun m!206377 () Bool)

(assert (=> b!178529 m!206377))

(declare-fun m!206379 () Bool)

(assert (=> b!178530 m!206379))

(assert (=> bm!18024 d!53835))

(declare-fun d!53837 () Bool)

(assert (=> d!53837 (= (apply!144 lt!88055 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)) (get!2030 (getValueByKey!197 (toList!1124 lt!88055) (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7302 () Bool)

(assert (= bs!7302 d!53837))

(assert (=> bs!7302 m!206241))

(assert (=> bs!7302 m!206315))

(assert (=> bs!7302 m!206315))

(declare-fun m!206381 () Bool)

(assert (=> bs!7302 m!206381))

(assert (=> b!178366 d!53837))

(declare-fun d!53839 () Bool)

(declare-fun c!32010 () Bool)

(assert (=> d!53839 (= c!32010 ((_ is ValueCellFull!1745) (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117656 () V!5217)

(assert (=> d!53839 (= (get!2029 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117656)))

(declare-fun b!178535 () Bool)

(declare-fun get!2031 (ValueCell!1745 V!5217) V!5217)

(assert (=> b!178535 (= e!117656 (get!2031 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178536 () Bool)

(declare-fun get!2032 (ValueCell!1745 V!5217) V!5217)

(assert (=> b!178536 (= e!117656 (get!2032 (select (arr!3551 (_values!3651 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!478 (defaultEntry!3668 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53839 c!32010) b!178535))

(assert (= (and d!53839 (not c!32010)) b!178536))

(assert (=> b!178535 m!206249))

(assert (=> b!178535 m!206251))

(declare-fun m!206383 () Bool)

(assert (=> b!178535 m!206383))

(assert (=> b!178536 m!206249))

(assert (=> b!178536 m!206251))

(declare-fun m!206385 () Bool)

(assert (=> b!178536 m!206385))

(assert (=> b!178366 d!53839))

(declare-fun d!53841 () Bool)

(assert (=> d!53841 (isDefined!151 (getValueByKey!197 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun lt!88121 () Unit!5417)

(declare-fun choose!959 (List!2264 (_ BitVec 64)) Unit!5417)

(assert (=> d!53841 (= lt!88121 (choose!959 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(declare-fun e!117659 () Bool)

(assert (=> d!53841 e!117659))

(declare-fun res!84537 () Bool)

(assert (=> d!53841 (=> (not res!84537) (not e!117659))))

(declare-fun isStrictlySorted!334 (List!2264) Bool)

(assert (=> d!53841 (= res!84537 (isStrictlySorted!334 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))))))

(assert (=> d!53841 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) lt!88121)))

(declare-fun b!178539 () Bool)

(assert (=> b!178539 (= e!117659 (containsKey!201 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828))))

(assert (= (and d!53841 res!84537) b!178539))

(assert (=> d!53841 m!206227))

(assert (=> d!53841 m!206227))

(assert (=> d!53841 m!206229))

(declare-fun m!206387 () Bool)

(assert (=> d!53841 m!206387))

(declare-fun m!206389 () Bool)

(assert (=> d!53841 m!206389))

(assert (=> b!178539 m!206223))

(assert (=> b!178317 d!53841))

(assert (=> b!178317 d!53823))

(assert (=> b!178317 d!53825))

(declare-fun d!53843 () Bool)

(declare-fun e!117660 () Bool)

(assert (=> d!53843 e!117660))

(declare-fun res!84539 () Bool)

(assert (=> d!53843 (=> (not res!84539) (not e!117660))))

(declare-fun lt!88124 () ListLongMap!2217)

(assert (=> d!53843 (= res!84539 (contains!1199 lt!88124 (_1!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))))))

(declare-fun lt!88123 () List!2264)

(assert (=> d!53843 (= lt!88124 (ListLongMap!2218 lt!88123))))

(declare-fun lt!88125 () Unit!5417)

(declare-fun lt!88122 () Unit!5417)

(assert (=> d!53843 (= lt!88125 lt!88122)))

(assert (=> d!53843 (= (getValueByKey!197 lt!88123 (_1!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53843 (= lt!88122 (lemmaContainsTupThenGetReturnValue!106 lt!88123 (_1!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53843 (= lt!88123 (insertStrictlySorted!109 (toList!1124 lt!88050) (_1!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53843 (= (+!256 lt!88050 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) lt!88124)))

(declare-fun b!178540 () Bool)

(declare-fun res!84538 () Bool)

(assert (=> b!178540 (=> (not res!84538) (not e!117660))))

(assert (=> b!178540 (= res!84538 (= (getValueByKey!197 (toList!1124 lt!88124) (_1!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))))))))

(declare-fun b!178541 () Bool)

(assert (=> b!178541 (= e!117660 (contains!1202 (toList!1124 lt!88124) (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))))))

(assert (= (and d!53843 res!84539) b!178540))

(assert (= (and b!178540 res!84538) b!178541))

(declare-fun m!206391 () Bool)

(assert (=> d!53843 m!206391))

(declare-fun m!206393 () Bool)

(assert (=> d!53843 m!206393))

(declare-fun m!206395 () Bool)

(assert (=> d!53843 m!206395))

(declare-fun m!206397 () Bool)

(assert (=> d!53843 m!206397))

(declare-fun m!206399 () Bool)

(assert (=> b!178540 m!206399))

(declare-fun m!206401 () Bool)

(assert (=> b!178541 m!206401))

(assert (=> b!178382 d!53843))

(declare-fun d!53845 () Bool)

(assert (=> d!53845 (= (apply!144 (+!256 lt!88041 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) lt!88044) (get!2030 (getValueByKey!197 (toList!1124 (+!256 lt!88041 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))) lt!88044)))))

(declare-fun bs!7303 () Bool)

(assert (= bs!7303 d!53845))

(declare-fun m!206403 () Bool)

(assert (=> bs!7303 m!206403))

(assert (=> bs!7303 m!206403))

(declare-fun m!206405 () Bool)

(assert (=> bs!7303 m!206405))

(assert (=> b!178382 d!53845))

(declare-fun d!53847 () Bool)

(assert (=> d!53847 (= (apply!144 lt!88041 lt!88044) (get!2030 (getValueByKey!197 (toList!1124 lt!88041) lt!88044)))))

(declare-fun bs!7304 () Bool)

(assert (= bs!7304 d!53847))

(declare-fun m!206407 () Bool)

(assert (=> bs!7304 m!206407))

(assert (=> bs!7304 m!206407))

(declare-fun m!206409 () Bool)

(assert (=> bs!7304 m!206409))

(assert (=> b!178382 d!53847))

(declare-fun d!53849 () Bool)

(assert (=> d!53849 (= (apply!144 (+!256 lt!88041 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) lt!88044) (apply!144 lt!88041 lt!88044))))

(declare-fun lt!88128 () Unit!5417)

(declare-fun choose!960 (ListLongMap!2217 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5417)

(assert (=> d!53849 (= lt!88128 (choose!960 lt!88041 lt!88042 (minValue!3509 thiss!1248) lt!88044))))

(declare-fun e!117663 () Bool)

(assert (=> d!53849 e!117663))

(declare-fun res!84542 () Bool)

(assert (=> d!53849 (=> (not res!84542) (not e!117663))))

(assert (=> d!53849 (= res!84542 (contains!1199 lt!88041 lt!88044))))

(assert (=> d!53849 (= (addApplyDifferent!120 lt!88041 lt!88042 (minValue!3509 thiss!1248) lt!88044) lt!88128)))

(declare-fun b!178545 () Bool)

(assert (=> b!178545 (= e!117663 (not (= lt!88044 lt!88042)))))

(assert (= (and d!53849 res!84542) b!178545))

(declare-fun m!206411 () Bool)

(assert (=> d!53849 m!206411))

(assert (=> d!53849 m!206281))

(declare-fun m!206413 () Bool)

(assert (=> d!53849 m!206413))

(assert (=> d!53849 m!206267))

(assert (=> d!53849 m!206285))

(assert (=> d!53849 m!206267))

(assert (=> b!178382 d!53849))

(declare-fun d!53851 () Bool)

(declare-fun e!117665 () Bool)

(assert (=> d!53851 e!117665))

(declare-fun res!84543 () Bool)

(assert (=> d!53851 (=> res!84543 e!117665)))

(declare-fun lt!88132 () Bool)

(assert (=> d!53851 (= res!84543 (not lt!88132))))

(declare-fun lt!88129 () Bool)

(assert (=> d!53851 (= lt!88132 lt!88129)))

(declare-fun lt!88131 () Unit!5417)

(declare-fun e!117664 () Unit!5417)

(assert (=> d!53851 (= lt!88131 e!117664)))

(declare-fun c!32011 () Bool)

(assert (=> d!53851 (= c!32011 lt!88129)))

(assert (=> d!53851 (= lt!88129 (containsKey!201 (toList!1124 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) lt!88048))))

(assert (=> d!53851 (= (contains!1199 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) lt!88048) lt!88132)))

(declare-fun b!178546 () Bool)

(declare-fun lt!88130 () Unit!5417)

(assert (=> b!178546 (= e!117664 lt!88130)))

(assert (=> b!178546 (= lt!88130 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) lt!88048))))

(assert (=> b!178546 (isDefined!151 (getValueByKey!197 (toList!1124 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) lt!88048))))

(declare-fun b!178547 () Bool)

(declare-fun Unit!5423 () Unit!5417)

(assert (=> b!178547 (= e!117664 Unit!5423)))

(declare-fun b!178548 () Bool)

(assert (=> b!178548 (= e!117665 (isDefined!151 (getValueByKey!197 (toList!1124 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) lt!88048)))))

(assert (= (and d!53851 c!32011) b!178546))

(assert (= (and d!53851 (not c!32011)) b!178547))

(assert (= (and d!53851 (not res!84543)) b!178548))

(declare-fun m!206415 () Bool)

(assert (=> d!53851 m!206415))

(declare-fun m!206417 () Bool)

(assert (=> b!178546 m!206417))

(declare-fun m!206419 () Bool)

(assert (=> b!178546 m!206419))

(assert (=> b!178546 m!206419))

(declare-fun m!206421 () Bool)

(assert (=> b!178546 m!206421))

(assert (=> b!178548 m!206419))

(assert (=> b!178548 m!206419))

(assert (=> b!178548 m!206421))

(assert (=> b!178382 d!53851))

(declare-fun d!53853 () Bool)

(assert (=> d!53853 (= (apply!144 lt!88047 lt!88039) (get!2030 (getValueByKey!197 (toList!1124 lt!88047) lt!88039)))))

(declare-fun bs!7305 () Bool)

(assert (= bs!7305 d!53853))

(declare-fun m!206423 () Bool)

(assert (=> bs!7305 m!206423))

(assert (=> bs!7305 m!206423))

(declare-fun m!206425 () Bool)

(assert (=> bs!7305 m!206425))

(assert (=> b!178382 d!53853))

(declare-fun d!53855 () Bool)

(assert (=> d!53855 (= (apply!144 (+!256 lt!88050 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) lt!88046) (apply!144 lt!88050 lt!88046))))

(declare-fun lt!88133 () Unit!5417)

(assert (=> d!53855 (= lt!88133 (choose!960 lt!88050 lt!88045 (zeroValue!3509 thiss!1248) lt!88046))))

(declare-fun e!117666 () Bool)

(assert (=> d!53855 e!117666))

(declare-fun res!84544 () Bool)

(assert (=> d!53855 (=> (not res!84544) (not e!117666))))

(assert (=> d!53855 (= res!84544 (contains!1199 lt!88050 lt!88046))))

(assert (=> d!53855 (= (addApplyDifferent!120 lt!88050 lt!88045 (zeroValue!3509 thiss!1248) lt!88046) lt!88133)))

(declare-fun b!178549 () Bool)

(assert (=> b!178549 (= e!117666 (not (= lt!88046 lt!88045)))))

(assert (= (and d!53855 res!84544) b!178549))

(declare-fun m!206427 () Bool)

(assert (=> d!53855 m!206427))

(assert (=> d!53855 m!206271))

(declare-fun m!206429 () Bool)

(assert (=> d!53855 m!206429))

(assert (=> d!53855 m!206273))

(assert (=> d!53855 m!206283))

(assert (=> d!53855 m!206273))

(assert (=> b!178382 d!53855))

(declare-fun d!53857 () Bool)

(declare-fun e!117667 () Bool)

(assert (=> d!53857 e!117667))

(declare-fun res!84546 () Bool)

(assert (=> d!53857 (=> (not res!84546) (not e!117667))))

(declare-fun lt!88136 () ListLongMap!2217)

(assert (=> d!53857 (= res!84546 (contains!1199 lt!88136 (_1!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))))))

(declare-fun lt!88135 () List!2264)

(assert (=> d!53857 (= lt!88136 (ListLongMap!2218 lt!88135))))

(declare-fun lt!88137 () Unit!5417)

(declare-fun lt!88134 () Unit!5417)

(assert (=> d!53857 (= lt!88137 lt!88134)))

(assert (=> d!53857 (= (getValueByKey!197 lt!88135 (_1!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53857 (= lt!88134 (lemmaContainsTupThenGetReturnValue!106 lt!88135 (_1!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53857 (= lt!88135 (insertStrictlySorted!109 (toList!1124 lt!88051) (_1!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))))))

(assert (=> d!53857 (= (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) lt!88136)))

(declare-fun b!178550 () Bool)

(declare-fun res!84545 () Bool)

(assert (=> b!178550 (=> (not res!84545) (not e!117667))))

(assert (=> b!178550 (= res!84545 (= (getValueByKey!197 (toList!1124 lt!88136) (_1!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))))))))

(declare-fun b!178551 () Bool)

(assert (=> b!178551 (= e!117667 (contains!1202 (toList!1124 lt!88136) (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))))))

(assert (= (and d!53857 res!84546) b!178550))

(assert (= (and b!178550 res!84545) b!178551))

(declare-fun m!206431 () Bool)

(assert (=> d!53857 m!206431))

(declare-fun m!206433 () Bool)

(assert (=> d!53857 m!206433))

(declare-fun m!206435 () Bool)

(assert (=> d!53857 m!206435))

(declare-fun m!206437 () Bool)

(assert (=> d!53857 m!206437))

(declare-fun m!206439 () Bool)

(assert (=> b!178550 m!206439))

(declare-fun m!206441 () Bool)

(assert (=> b!178551 m!206441))

(assert (=> b!178382 d!53857))

(declare-fun d!53859 () Bool)

(assert (=> d!53859 (contains!1199 (+!256 lt!88051 (tuple2!3299 lt!88056 (zeroValue!3509 thiss!1248))) lt!88048)))

(declare-fun lt!88140 () Unit!5417)

(declare-fun choose!961 (ListLongMap!2217 (_ BitVec 64) V!5217 (_ BitVec 64)) Unit!5417)

(assert (=> d!53859 (= lt!88140 (choose!961 lt!88051 lt!88056 (zeroValue!3509 thiss!1248) lt!88048))))

(assert (=> d!53859 (contains!1199 lt!88051 lt!88048)))

(assert (=> d!53859 (= (addStillContains!120 lt!88051 lt!88056 (zeroValue!3509 thiss!1248) lt!88048) lt!88140)))

(declare-fun bs!7306 () Bool)

(assert (= bs!7306 d!53859))

(assert (=> bs!7306 m!206263))

(assert (=> bs!7306 m!206263))

(assert (=> bs!7306 m!206277))

(declare-fun m!206443 () Bool)

(assert (=> bs!7306 m!206443))

(declare-fun m!206445 () Bool)

(assert (=> bs!7306 m!206445))

(assert (=> b!178382 d!53859))

(declare-fun d!53861 () Bool)

(assert (=> d!53861 (= (apply!144 (+!256 lt!88050 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248))) lt!88046) (get!2030 (getValueByKey!197 (toList!1124 (+!256 lt!88050 (tuple2!3299 lt!88045 (zeroValue!3509 thiss!1248)))) lt!88046)))))

(declare-fun bs!7307 () Bool)

(assert (= bs!7307 d!53861))

(declare-fun m!206447 () Bool)

(assert (=> bs!7307 m!206447))

(assert (=> bs!7307 m!206447))

(declare-fun m!206449 () Bool)

(assert (=> bs!7307 m!206449))

(assert (=> b!178382 d!53861))

(declare-fun d!53863 () Bool)

(assert (=> d!53863 (= (apply!144 (+!256 lt!88047 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) lt!88039) (apply!144 lt!88047 lt!88039))))

(declare-fun lt!88141 () Unit!5417)

(assert (=> d!53863 (= lt!88141 (choose!960 lt!88047 lt!88059 (minValue!3509 thiss!1248) lt!88039))))

(declare-fun e!117668 () Bool)

(assert (=> d!53863 e!117668))

(declare-fun res!84547 () Bool)

(assert (=> d!53863 (=> (not res!84547) (not e!117668))))

(assert (=> d!53863 (= res!84547 (contains!1199 lt!88047 lt!88039))))

(assert (=> d!53863 (= (addApplyDifferent!120 lt!88047 lt!88059 (minValue!3509 thiss!1248) lt!88039) lt!88141)))

(declare-fun b!178553 () Bool)

(assert (=> b!178553 (= e!117668 (not (= lt!88039 lt!88059)))))

(assert (= (and d!53863 res!84547) b!178553))

(declare-fun m!206451 () Bool)

(assert (=> d!53863 m!206451))

(assert (=> d!53863 m!206269))

(declare-fun m!206453 () Bool)

(assert (=> d!53863 m!206453))

(assert (=> d!53863 m!206259))

(assert (=> d!53863 m!206265))

(assert (=> d!53863 m!206259))

(assert (=> b!178382 d!53863))

(declare-fun d!53865 () Bool)

(declare-fun e!117669 () Bool)

(assert (=> d!53865 e!117669))

(declare-fun res!84549 () Bool)

(assert (=> d!53865 (=> (not res!84549) (not e!117669))))

(declare-fun lt!88144 () ListLongMap!2217)

(assert (=> d!53865 (= res!84549 (contains!1199 lt!88144 (_1!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88143 () List!2264)

(assert (=> d!53865 (= lt!88144 (ListLongMap!2218 lt!88143))))

(declare-fun lt!88145 () Unit!5417)

(declare-fun lt!88142 () Unit!5417)

(assert (=> d!53865 (= lt!88145 lt!88142)))

(assert (=> d!53865 (= (getValueByKey!197 lt!88143 (_1!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))))))

(assert (=> d!53865 (= lt!88142 (lemmaContainsTupThenGetReturnValue!106 lt!88143 (_1!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))))))

(assert (=> d!53865 (= lt!88143 (insertStrictlySorted!109 (toList!1124 lt!88047) (_1!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))))))

(assert (=> d!53865 (= (+!256 lt!88047 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) lt!88144)))

(declare-fun b!178554 () Bool)

(declare-fun res!84548 () Bool)

(assert (=> b!178554 (=> (not res!84548) (not e!117669))))

(assert (=> b!178554 (= res!84548 (= (getValueByKey!197 (toList!1124 lt!88144) (_1!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))))))))

(declare-fun b!178555 () Bool)

(assert (=> b!178555 (= e!117669 (contains!1202 (toList!1124 lt!88144) (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))))))

(assert (= (and d!53865 res!84549) b!178554))

(assert (= (and b!178554 res!84548) b!178555))

(declare-fun m!206455 () Bool)

(assert (=> d!53865 m!206455))

(declare-fun m!206457 () Bool)

(assert (=> d!53865 m!206457))

(declare-fun m!206459 () Bool)

(assert (=> d!53865 m!206459))

(declare-fun m!206461 () Bool)

(assert (=> d!53865 m!206461))

(declare-fun m!206463 () Bool)

(assert (=> b!178554 m!206463))

(declare-fun m!206465 () Bool)

(assert (=> b!178555 m!206465))

(assert (=> b!178382 d!53865))

(declare-fun d!53867 () Bool)

(assert (=> d!53867 (= (apply!144 (+!256 lt!88047 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248))) lt!88039) (get!2030 (getValueByKey!197 (toList!1124 (+!256 lt!88047 (tuple2!3299 lt!88059 (minValue!3509 thiss!1248)))) lt!88039)))))

(declare-fun bs!7308 () Bool)

(assert (= bs!7308 d!53867))

(declare-fun m!206467 () Bool)

(assert (=> bs!7308 m!206467))

(assert (=> bs!7308 m!206467))

(declare-fun m!206469 () Bool)

(assert (=> bs!7308 m!206469))

(assert (=> b!178382 d!53867))

(assert (=> b!178382 d!53831))

(declare-fun d!53869 () Bool)

(declare-fun e!117670 () Bool)

(assert (=> d!53869 e!117670))

(declare-fun res!84551 () Bool)

(assert (=> d!53869 (=> (not res!84551) (not e!117670))))

(declare-fun lt!88148 () ListLongMap!2217)

(assert (=> d!53869 (= res!84551 (contains!1199 lt!88148 (_1!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88147 () List!2264)

(assert (=> d!53869 (= lt!88148 (ListLongMap!2218 lt!88147))))

(declare-fun lt!88149 () Unit!5417)

(declare-fun lt!88146 () Unit!5417)

(assert (=> d!53869 (= lt!88149 lt!88146)))

(assert (=> d!53869 (= (getValueByKey!197 lt!88147 (_1!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))))))

(assert (=> d!53869 (= lt!88146 (lemmaContainsTupThenGetReturnValue!106 lt!88147 (_1!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))))))

(assert (=> d!53869 (= lt!88147 (insertStrictlySorted!109 (toList!1124 lt!88041) (_1!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))))))

(assert (=> d!53869 (= (+!256 lt!88041 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))) lt!88148)))

(declare-fun b!178556 () Bool)

(declare-fun res!84550 () Bool)

(assert (=> b!178556 (=> (not res!84550) (not e!117670))))

(assert (=> b!178556 (= res!84550 (= (getValueByKey!197 (toList!1124 lt!88148) (_1!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))))))))

(declare-fun b!178557 () Bool)

(assert (=> b!178557 (= e!117670 (contains!1202 (toList!1124 lt!88148) (tuple2!3299 lt!88042 (minValue!3509 thiss!1248))))))

(assert (= (and d!53869 res!84551) b!178556))

(assert (= (and b!178556 res!84550) b!178557))

(declare-fun m!206471 () Bool)

(assert (=> d!53869 m!206471))

(declare-fun m!206473 () Bool)

(assert (=> d!53869 m!206473))

(declare-fun m!206475 () Bool)

(assert (=> d!53869 m!206475))

(declare-fun m!206477 () Bool)

(assert (=> d!53869 m!206477))

(declare-fun m!206479 () Bool)

(assert (=> b!178556 m!206479))

(declare-fun m!206481 () Bool)

(assert (=> b!178557 m!206481))

(assert (=> b!178382 d!53869))

(declare-fun d!53871 () Bool)

(assert (=> d!53871 (= (apply!144 lt!88050 lt!88046) (get!2030 (getValueByKey!197 (toList!1124 lt!88050) lt!88046)))))

(declare-fun bs!7309 () Bool)

(assert (= bs!7309 d!53871))

(declare-fun m!206483 () Bool)

(assert (=> bs!7309 m!206483))

(assert (=> bs!7309 m!206483))

(declare-fun m!206485 () Bool)

(assert (=> bs!7309 m!206485))

(assert (=> b!178382 d!53871))

(declare-fun d!53873 () Bool)

(assert (=> d!53873 (= (validKeyInArray!0 (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3550 (_keys!5544 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178365 d!53873))

(assert (=> b!178381 d!53873))

(declare-fun b!178576 () Bool)

(declare-fun lt!88155 () SeekEntryResult!584)

(assert (=> b!178576 (and (bvsge (index!4506 lt!88155) #b00000000000000000000000000000000) (bvslt (index!4506 lt!88155) (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun res!84558 () Bool)

(assert (=> b!178576 (= res!84558 (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4506 lt!88155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117682 () Bool)

(assert (=> b!178576 (=> res!84558 e!117682)))

(declare-fun b!178577 () Bool)

(assert (=> b!178577 (and (bvsge (index!4506 lt!88155) #b00000000000000000000000000000000) (bvslt (index!4506 lt!88155) (size!3857 (_keys!5544 thiss!1248))))))

(declare-fun res!84560 () Bool)

(assert (=> b!178577 (= res!84560 (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4506 lt!88155)) key!828))))

(assert (=> b!178577 (=> res!84560 e!117682)))

(declare-fun e!117684 () Bool)

(assert (=> b!178577 (= e!117684 e!117682)))

(declare-fun b!178578 () Bool)

(declare-fun e!117685 () SeekEntryResult!584)

(assert (=> b!178578 (= e!117685 (Intermediate!584 true (toIndex!0 key!828 (mask!8627 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178579 () Bool)

(assert (=> b!178579 (and (bvsge (index!4506 lt!88155) #b00000000000000000000000000000000) (bvslt (index!4506 lt!88155) (size!3857 (_keys!5544 thiss!1248))))))

(assert (=> b!178579 (= e!117682 (= (select (arr!3550 (_keys!5544 thiss!1248)) (index!4506 lt!88155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178580 () Bool)

(declare-fun e!117681 () Bool)

(assert (=> b!178580 (= e!117681 e!117684)))

(declare-fun res!84559 () Bool)

(assert (=> b!178580 (= res!84559 (and ((_ is Intermediate!584) lt!88155) (not (undefined!1396 lt!88155)) (bvslt (x!19551 lt!88155) #b01111111111111111111111111111110) (bvsge (x!19551 lt!88155) #b00000000000000000000000000000000) (bvsge (x!19551 lt!88155) #b00000000000000000000000000000000)))))

(assert (=> b!178580 (=> (not res!84559) (not e!117684))))

(declare-fun b!178581 () Bool)

(declare-fun e!117683 () SeekEntryResult!584)

(assert (=> b!178581 (= e!117685 e!117683)))

(declare-fun c!32019 () Bool)

(declare-fun lt!88154 () (_ BitVec 64))

(assert (=> b!178581 (= c!32019 (or (= lt!88154 key!828) (= (bvadd lt!88154 lt!88154) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53875 () Bool)

(assert (=> d!53875 e!117681))

(declare-fun c!32020 () Bool)

(assert (=> d!53875 (= c!32020 (and ((_ is Intermediate!584) lt!88155) (undefined!1396 lt!88155)))))

(assert (=> d!53875 (= lt!88155 e!117685)))

(declare-fun c!32018 () Bool)

(assert (=> d!53875 (= c!32018 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53875 (= lt!88154 (select (arr!3550 (_keys!5544 thiss!1248)) (toIndex!0 key!828 (mask!8627 thiss!1248))))))

(assert (=> d!53875 (validMask!0 (mask!8627 thiss!1248))))

(assert (=> d!53875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8627 thiss!1248)) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)) lt!88155)))

(declare-fun b!178582 () Bool)

(assert (=> b!178582 (= e!117683 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8627 thiss!1248)) #b00000000000000000000000000000000 (mask!8627 thiss!1248)) key!828 (_keys!5544 thiss!1248) (mask!8627 thiss!1248)))))

(declare-fun b!178583 () Bool)

(assert (=> b!178583 (= e!117683 (Intermediate!584 false (toIndex!0 key!828 (mask!8627 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178584 () Bool)

(assert (=> b!178584 (= e!117681 (bvsge (x!19551 lt!88155) #b01111111111111111111111111111110))))

(assert (= (and d!53875 c!32018) b!178578))

(assert (= (and d!53875 (not c!32018)) b!178581))

(assert (= (and b!178581 c!32019) b!178583))

(assert (= (and b!178581 (not c!32019)) b!178582))

(assert (= (and d!53875 c!32020) b!178584))

(assert (= (and d!53875 (not c!32020)) b!178580))

(assert (= (and b!178580 res!84559) b!178577))

(assert (= (and b!178577 (not res!84560)) b!178576))

(assert (= (and b!178576 (not res!84558)) b!178579))

(assert (=> d!53875 m!206211))

(declare-fun m!206487 () Bool)

(assert (=> d!53875 m!206487))

(assert (=> d!53875 m!206165))

(declare-fun m!206489 () Bool)

(assert (=> b!178577 m!206489))

(assert (=> b!178576 m!206489))

(assert (=> b!178582 m!206211))

(declare-fun m!206491 () Bool)

(assert (=> b!178582 m!206491))

(assert (=> b!178582 m!206491))

(declare-fun m!206493 () Bool)

(assert (=> b!178582 m!206493))

(assert (=> b!178579 m!206489))

(assert (=> d!53797 d!53875))

(declare-fun d!53877 () Bool)

(declare-fun lt!88161 () (_ BitVec 32))

(declare-fun lt!88160 () (_ BitVec 32))

(assert (=> d!53877 (= lt!88161 (bvmul (bvxor lt!88160 (bvlshr lt!88160 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53877 (= lt!88160 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53877 (and (bvsge (mask!8627 thiss!1248) #b00000000000000000000000000000000) (let ((res!84561 (let ((h!2886 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19569 (bvmul (bvxor h!2886 (bvlshr h!2886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19569 (bvlshr x!19569 #b00000000000000000000000000001101)) (mask!8627 thiss!1248)))))) (and (bvslt res!84561 (bvadd (mask!8627 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84561 #b00000000000000000000000000000000))))))

(assert (=> d!53877 (= (toIndex!0 key!828 (mask!8627 thiss!1248)) (bvand (bvxor lt!88161 (bvlshr lt!88161 #b00000000000000000000000000001101)) (mask!8627 thiss!1248)))))

(assert (=> d!53797 d!53877))

(assert (=> d!53797 d!53803))

(declare-fun d!53879 () Bool)

(declare-fun e!117686 () Bool)

(assert (=> d!53879 e!117686))

(declare-fun res!84563 () Bool)

(assert (=> d!53879 (=> (not res!84563) (not e!117686))))

(declare-fun lt!88164 () ListLongMap!2217)

(assert (=> d!53879 (= res!84563 (contains!1199 lt!88164 (_1!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(declare-fun lt!88163 () List!2264)

(assert (=> d!53879 (= lt!88164 (ListLongMap!2218 lt!88163))))

(declare-fun lt!88165 () Unit!5417)

(declare-fun lt!88162 () Unit!5417)

(assert (=> d!53879 (= lt!88165 lt!88162)))

(assert (=> d!53879 (= (getValueByKey!197 lt!88163 (_1!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!53879 (= lt!88162 (lemmaContainsTupThenGetReturnValue!106 lt!88163 (_1!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!53879 (= lt!88163 (insertStrictlySorted!109 (toList!1124 call!18024) (_1!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) (_2!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))))))

(assert (=> d!53879 (= (+!256 call!18024 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))) lt!88164)))

(declare-fun b!178585 () Bool)

(declare-fun res!84562 () Bool)

(assert (=> b!178585 (=> (not res!84562) (not e!117686))))

(assert (=> b!178585 (= res!84562 (= (getValueByKey!197 (toList!1124 lt!88164) (_1!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248)))) (Some!202 (_2!1660 (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))))

(declare-fun b!178586 () Bool)

(assert (=> b!178586 (= e!117686 (contains!1202 (toList!1124 lt!88164) (tuple2!3299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3509 thiss!1248))))))

(assert (= (and d!53879 res!84563) b!178585))

(assert (= (and b!178585 res!84562) b!178586))

(declare-fun m!206495 () Bool)

(assert (=> d!53879 m!206495))

(declare-fun m!206497 () Bool)

(assert (=> d!53879 m!206497))

(declare-fun m!206499 () Bool)

(assert (=> d!53879 m!206499))

(declare-fun m!206501 () Bool)

(assert (=> d!53879 m!206501))

(declare-fun m!206503 () Bool)

(assert (=> b!178585 m!206503))

(declare-fun m!206505 () Bool)

(assert (=> b!178586 m!206505))

(assert (=> b!178372 d!53879))

(declare-fun d!53881 () Bool)

(declare-fun e!117688 () Bool)

(assert (=> d!53881 e!117688))

(declare-fun res!84564 () Bool)

(assert (=> d!53881 (=> res!84564 e!117688)))

(declare-fun lt!88169 () Bool)

(assert (=> d!53881 (= res!84564 (not lt!88169))))

(declare-fun lt!88166 () Bool)

(assert (=> d!53881 (= lt!88169 lt!88166)))

(declare-fun lt!88168 () Unit!5417)

(declare-fun e!117687 () Unit!5417)

(assert (=> d!53881 (= lt!88168 e!117687)))

(declare-fun c!32021 () Bool)

(assert (=> d!53881 (= c!32021 lt!88166)))

(assert (=> d!53881 (= lt!88166 (containsKey!201 (toList!1124 lt!88055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53881 (= (contains!1199 lt!88055 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88169)))

(declare-fun b!178587 () Bool)

(declare-fun lt!88167 () Unit!5417)

(assert (=> b!178587 (= e!117687 lt!88167)))

(assert (=> b!178587 (= lt!88167 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1124 lt!88055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178587 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178588 () Bool)

(declare-fun Unit!5424 () Unit!5417)

(assert (=> b!178588 (= e!117687 Unit!5424)))

(declare-fun b!178589 () Bool)

(assert (=> b!178589 (= e!117688 (isDefined!151 (getValueByKey!197 (toList!1124 lt!88055) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53881 c!32021) b!178587))

(assert (= (and d!53881 (not c!32021)) b!178588))

(assert (= (and d!53881 (not res!84564)) b!178589))

(declare-fun m!206507 () Bool)

(assert (=> d!53881 m!206507))

(declare-fun m!206509 () Bool)

(assert (=> b!178587 m!206509))

(assert (=> b!178587 m!206307))

(assert (=> b!178587 m!206307))

(declare-fun m!206511 () Bool)

(assert (=> b!178587 m!206511))

(assert (=> b!178589 m!206307))

(assert (=> b!178589 m!206307))

(assert (=> b!178589 m!206511))

(assert (=> bm!18019 d!53881))

(declare-fun d!53883 () Bool)

(declare-fun res!84569 () Bool)

(declare-fun e!117693 () Bool)

(assert (=> d!53883 (=> res!84569 e!117693)))

(assert (=> d!53883 (= res!84569 (and ((_ is Cons!2260) (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (= (_1!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(assert (=> d!53883 (= (containsKey!201 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))) key!828) e!117693)))

(declare-fun b!178594 () Bool)

(declare-fun e!117694 () Bool)

(assert (=> b!178594 (= e!117693 e!117694)))

(declare-fun res!84570 () Bool)

(assert (=> b!178594 (=> (not res!84570) (not e!117694))))

(assert (=> b!178594 (= res!84570 (and (or (not ((_ is Cons!2260) (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) (bvsle (_1!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)) ((_ is Cons!2260) (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) (bvslt (_1!1660 (h!2883 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248))))) key!828)))))

(declare-fun b!178595 () Bool)

(assert (=> b!178595 (= e!117694 (containsKey!201 (t!7093 (toList!1124 (getCurrentListMap!760 (_keys!5544 thiss!1248) (_values!3651 thiss!1248) (mask!8627 thiss!1248) (extraKeys!3405 thiss!1248) (zeroValue!3509 thiss!1248) (minValue!3509 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3668 thiss!1248)))) key!828))))

(assert (= (and d!53883 (not res!84569)) b!178594))

(assert (= (and b!178594 res!84570) b!178595))

(declare-fun m!206513 () Bool)

(assert (=> b!178595 m!206513))

(assert (=> d!53805 d!53883))

(declare-fun mapNonEmpty!7152 () Bool)

(declare-fun mapRes!7152 () Bool)

(declare-fun tp!15945 () Bool)

(declare-fun e!117695 () Bool)

(assert (=> mapNonEmpty!7152 (= mapRes!7152 (and tp!15945 e!117695))))

(declare-fun mapRest!7152 () (Array (_ BitVec 32) ValueCell!1745))

(declare-fun mapKey!7152 () (_ BitVec 32))

(declare-fun mapValue!7152 () ValueCell!1745)

(assert (=> mapNonEmpty!7152 (= mapRest!7151 (store mapRest!7152 mapKey!7152 mapValue!7152))))

(declare-fun condMapEmpty!7152 () Bool)

(declare-fun mapDefault!7152 () ValueCell!1745)

(assert (=> mapNonEmpty!7151 (= condMapEmpty!7152 (= mapRest!7151 ((as const (Array (_ BitVec 32) ValueCell!1745)) mapDefault!7152)))))

(declare-fun e!117696 () Bool)

(assert (=> mapNonEmpty!7151 (= tp!15944 (and e!117696 mapRes!7152))))

(declare-fun mapIsEmpty!7152 () Bool)

(assert (=> mapIsEmpty!7152 mapRes!7152))

(declare-fun b!178597 () Bool)

(assert (=> b!178597 (= e!117696 tp_is_empty!4177)))

(declare-fun b!178596 () Bool)

(assert (=> b!178596 (= e!117695 tp_is_empty!4177)))

(assert (= (and mapNonEmpty!7151 condMapEmpty!7152) mapIsEmpty!7152))

(assert (= (and mapNonEmpty!7151 (not condMapEmpty!7152)) mapNonEmpty!7152))

(assert (= (and mapNonEmpty!7152 ((_ is ValueCellFull!1745) mapValue!7152)) b!178596))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1745) mapDefault!7152)) b!178597))

(declare-fun m!206515 () Bool)

(assert (=> mapNonEmpty!7152 m!206515))

(declare-fun b_lambda!7073 () Bool)

(assert (= b_lambda!7071 (or (and b!178236 b_free!4405) b_lambda!7073)))

(declare-fun b_lambda!7075 () Bool)

(assert (= b_lambda!7069 (or (and b!178236 b_free!4405) b_lambda!7075)))

(check-sat (not d!53821) (not b!178502) (not b!178476) (not b!178557) (not d!53837) (not bm!18037) (not d!53853) (not b!178536) (not d!53861) (not b!178504) (not d!53847) (not d!53835) (not b!178438) (not d!53811) (not d!53871) (not d!53869) (not b!178509) (not b!178417) (not b!178582) (not d!53875) (not b!178420) (not b!178546) (not b!178595) (not b!178539) (not d!53845) (not d!53857) (not b_next!4405) (not d!53841) (not b!178540) (not d!53855) (not b!178555) (not b_lambda!7067) (not b!178535) (not b!178551) (not b!178523) (not b!178440) (not d!53831) (not d!53823) (not b!178422) (not d!53817) (not b!178507) (not d!53833) b_and!10905 (not b!178522) (not b!178530) (not d!53859) (not d!53815) (not b!178423) (not b!178586) (not b!178451) tp_is_empty!4177 (not b!178506) (not b!178508) (not b!178585) (not b_lambda!7075) (not d!53843) (not d!53863) (not b!178425) (not d!53865) (not b!178556) (not mapNonEmpty!7152) (not b!178548) (not b!178589) (not d!53879) (not b!178501) (not bm!18034) (not b!178587) (not bm!18031) (not b!178464) (not b!178474) (not b!178541) (not b!178554) (not d!53881) (not b!178529) (not d!53813) (not b!178436) (not d!53849) (not b!178505) (not d!53867) (not b!178550) (not b_lambda!7073) (not bm!18028) (not d!53851))
(check-sat b_and!10905 (not b_next!4405))
