; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24098 () Bool)

(assert start!24098)

(declare-fun b!252062 () Bool)

(declare-fun b_free!6645 () Bool)

(declare-fun b_next!6645 () Bool)

(assert (=> b!252062 (= b_free!6645 (not b_next!6645))))

(declare-fun tp!23210 () Bool)

(declare-fun b_and!13679 () Bool)

(assert (=> b!252062 (= tp!23210 b_and!13679)))

(declare-fun b!252051 () Bool)

(declare-fun e!163456 () Bool)

(declare-fun e!163460 () Bool)

(assert (=> b!252051 (= e!163456 e!163460)))

(declare-fun res!123389 () Bool)

(assert (=> b!252051 (=> (not res!123389) (not e!163460))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8323 0))(
  ( (V!8324 (val!3298 Int)) )
))
(declare-datatypes ((ValueCell!2910 0))(
  ( (ValueCellFull!2910 (v!5368 V!8323)) (EmptyCell!2910) )
))
(declare-datatypes ((array!12337 0))(
  ( (array!12338 (arr!5848 (Array (_ BitVec 32) ValueCell!2910)) (size!6195 (_ BitVec 32))) )
))
(declare-datatypes ((array!12339 0))(
  ( (array!12340 (arr!5849 (Array (_ BitVec 32) (_ BitVec 64))) (size!6196 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3720 0))(
  ( (LongMapFixedSize!3721 (defaultEntry!4657 Int) (mask!10869 (_ BitVec 32)) (extraKeys!4394 (_ BitVec 32)) (zeroValue!4498 V!8323) (minValue!4498 V!8323) (_size!1909 (_ BitVec 32)) (_keys!6803 array!12339) (_values!4640 array!12337) (_vacant!1909 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3720)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252051 (= res!123389 (inRange!0 index!297 (mask!10869 thiss!1504)))))

(declare-datatypes ((Unit!7799 0))(
  ( (Unit!7800) )
))
(declare-fun lt!126334 () Unit!7799)

(declare-fun e!163449 () Unit!7799)

(assert (=> b!252051 (= lt!126334 e!163449)))

(declare-fun c!42453 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4856 0))(
  ( (tuple2!4857 (_1!2439 (_ BitVec 64)) (_2!2439 V!8323)) )
))
(declare-datatypes ((List!3736 0))(
  ( (Nil!3733) (Cons!3732 (h!4394 tuple2!4856) (t!8775 List!3736)) )
))
(declare-datatypes ((ListLongMap!3769 0))(
  ( (ListLongMap!3770 (toList!1900 List!3736)) )
))
(declare-fun contains!1826 (ListLongMap!3769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1428 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 32) Int) ListLongMap!3769)

(assert (=> b!252051 (= c!42453 (contains!1826 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)) key!932))))

(declare-fun b!252052 () Bool)

(declare-fun e!163457 () Bool)

(assert (=> b!252052 (= e!163460 (not e!163457))))

(declare-fun res!123394 () Bool)

(assert (=> b!252052 (=> res!123394 e!163457)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252052 (= res!123394 (not (validMask!0 (mask!10869 thiss!1504))))))

(declare-fun lt!126328 () array!12339)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12339 (_ BitVec 32)) Bool)

(assert (=> b!252052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126328 (mask!10869 thiss!1504))))

(declare-fun lt!126336 () Unit!7799)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12339 (_ BitVec 32) (_ BitVec 32)) Unit!7799)

(assert (=> b!252052 (= lt!126336 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) index!297 (mask!10869 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252052 (= (arrayCountValidKeys!0 lt!126328 #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6803 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504)))))))

(declare-fun lt!126335 () Unit!7799)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12339 (_ BitVec 32) (_ BitVec 64)) Unit!7799)

(assert (=> b!252052 (= lt!126335 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6803 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3737 0))(
  ( (Nil!3734) (Cons!3733 (h!4395 (_ BitVec 64)) (t!8776 List!3737)) )
))
(declare-fun arrayNoDuplicates!0 (array!12339 (_ BitVec 32) List!3737) Bool)

(assert (=> b!252052 (arrayNoDuplicates!0 lt!126328 #b00000000000000000000000000000000 Nil!3734)))

(assert (=> b!252052 (= lt!126328 (array!12340 (store (arr!5849 (_keys!6803 thiss!1504)) index!297 key!932) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun lt!126337 () Unit!7799)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3737) Unit!7799)

(assert (=> b!252052 (= lt!126337 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6803 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3734))))

(declare-fun lt!126333 () Unit!7799)

(declare-fun e!163458 () Unit!7799)

(assert (=> b!252052 (= lt!126333 e!163458)))

(declare-fun c!42455 () Bool)

(declare-fun arrayContainsKey!0 (array!12339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252052 (= c!42455 (arrayContainsKey!0 (_keys!6803 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252053 () Bool)

(declare-fun e!163454 () Bool)

(declare-datatypes ((SeekEntryResult!1130 0))(
  ( (MissingZero!1130 (index!6690 (_ BitVec 32))) (Found!1130 (index!6691 (_ BitVec 32))) (Intermediate!1130 (undefined!1942 Bool) (index!6692 (_ BitVec 32)) (x!24750 (_ BitVec 32))) (Undefined!1130) (MissingVacant!1130 (index!6693 (_ BitVec 32))) )
))
(declare-fun lt!126330 () SeekEntryResult!1130)

(get-info :version)

(assert (=> b!252053 (= e!163454 ((_ is Undefined!1130) lt!126330))))

(declare-fun b!252054 () Bool)

(declare-fun e!163452 () Bool)

(declare-fun call!23725 () Bool)

(assert (=> b!252054 (= e!163452 (not call!23725))))

(declare-fun b!252055 () Bool)

(declare-fun e!163459 () Bool)

(assert (=> b!252055 (= e!163459 (not call!23725))))

(declare-fun res!123387 () Bool)

(declare-fun e!163451 () Bool)

(assert (=> start!24098 (=> (not res!123387) (not e!163451))))

(declare-fun valid!1455 (LongMapFixedSize!3720) Bool)

(assert (=> start!24098 (= res!123387 (valid!1455 thiss!1504))))

(assert (=> start!24098 e!163451))

(declare-fun e!163453 () Bool)

(assert (=> start!24098 e!163453))

(assert (=> start!24098 true))

(declare-fun b!252056 () Bool)

(declare-fun c!42454 () Bool)

(assert (=> b!252056 (= c!42454 ((_ is MissingVacant!1130) lt!126330))))

(declare-fun e!163450 () Bool)

(assert (=> b!252056 (= e!163450 e!163454)))

(declare-fun b!252057 () Bool)

(declare-fun res!123386 () Bool)

(assert (=> b!252057 (=> (not res!123386) (not e!163451))))

(assert (=> b!252057 (= res!123386 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252058 () Bool)

(declare-fun res!123393 () Bool)

(assert (=> b!252058 (=> (not res!123393) (not e!163452))))

(assert (=> b!252058 (= res!123393 (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6690 lt!126330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252059 () Bool)

(declare-fun Unit!7801 () Unit!7799)

(assert (=> b!252059 (= e!163458 Unit!7801)))

(declare-fun b!252060 () Bool)

(declare-fun e!163463 () Bool)

(declare-fun tp_is_empty!6507 () Bool)

(assert (=> b!252060 (= e!163463 tp_is_empty!6507)))

(declare-fun b!252061 () Bool)

(declare-fun lt!126329 () Unit!7799)

(assert (=> b!252061 (= e!163449 lt!126329)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) Int) Unit!7799)

(assert (=> b!252061 (= lt!126329 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)))))

(declare-fun c!42452 () Bool)

(assert (=> b!252061 (= c!42452 ((_ is MissingZero!1130) lt!126330))))

(assert (=> b!252061 e!163450))

(declare-fun e!163462 () Bool)

(declare-fun array_inv!3865 (array!12339) Bool)

(declare-fun array_inv!3866 (array!12337) Bool)

(assert (=> b!252062 (= e!163453 (and tp!23210 tp_is_empty!6507 (array_inv!3865 (_keys!6803 thiss!1504)) (array_inv!3866 (_values!4640 thiss!1504)) e!163462))))

(declare-fun b!252063 () Bool)

(declare-fun e!163461 () Bool)

(assert (=> b!252063 (= e!163461 tp_is_empty!6507)))

(declare-fun b!252064 () Bool)

(assert (=> b!252064 (= e!163451 e!163456)))

(declare-fun res!123392 () Bool)

(assert (=> b!252064 (=> (not res!123392) (not e!163456))))

(assert (=> b!252064 (= res!123392 (or (= lt!126330 (MissingZero!1130 index!297)) (= lt!126330 (MissingVacant!1130 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12339 (_ BitVec 32)) SeekEntryResult!1130)

(assert (=> b!252064 (= lt!126330 (seekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun b!252065 () Bool)

(declare-fun Unit!7802 () Unit!7799)

(assert (=> b!252065 (= e!163449 Unit!7802)))

(declare-fun lt!126332 () Unit!7799)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) Int) Unit!7799)

(assert (=> b!252065 (= lt!126332 (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)))))

(assert (=> b!252065 false))

(declare-fun b!252066 () Bool)

(declare-fun res!123390 () Bool)

(assert (=> b!252066 (=> (not res!123390) (not e!163452))))

(declare-fun call!23726 () Bool)

(assert (=> b!252066 (= res!123390 call!23726)))

(assert (=> b!252066 (= e!163450 e!163452)))

(declare-fun b!252067 () Bool)

(assert (=> b!252067 (= e!163454 e!163459)))

(declare-fun res!123388 () Bool)

(assert (=> b!252067 (= res!123388 call!23726)))

(assert (=> b!252067 (=> (not res!123388) (not e!163459))))

(declare-fun b!252068 () Bool)

(declare-fun mapRes!11064 () Bool)

(assert (=> b!252068 (= e!163462 (and e!163463 mapRes!11064))))

(declare-fun condMapEmpty!11064 () Bool)

(declare-fun mapDefault!11064 () ValueCell!2910)

(assert (=> b!252068 (= condMapEmpty!11064 (= (arr!5848 (_values!4640 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2910)) mapDefault!11064)))))

(declare-fun bm!23722 () Bool)

(assert (=> bm!23722 (= call!23725 (arrayContainsKey!0 (_keys!6803 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252069 () Bool)

(declare-fun res!123385 () Bool)

(assert (=> b!252069 (=> res!123385 e!163457)))

(assert (=> b!252069 (= res!123385 (or (not (= (size!6195 (_values!4640 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10869 thiss!1504)))) (not (= (size!6196 (_keys!6803 thiss!1504)) (size!6195 (_values!4640 thiss!1504)))) (bvslt (mask!10869 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4394 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4394 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11064 () Bool)

(declare-fun tp!23211 () Bool)

(assert (=> mapNonEmpty!11064 (= mapRes!11064 (and tp!23211 e!163461))))

(declare-fun mapKey!11064 () (_ BitVec 32))

(declare-fun mapValue!11064 () ValueCell!2910)

(declare-fun mapRest!11064 () (Array (_ BitVec 32) ValueCell!2910))

(assert (=> mapNonEmpty!11064 (= (arr!5848 (_values!4640 thiss!1504)) (store mapRest!11064 mapKey!11064 mapValue!11064))))

(declare-fun b!252070 () Bool)

(assert (=> b!252070 (= e!163457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun mapIsEmpty!11064 () Bool)

(assert (=> mapIsEmpty!11064 mapRes!11064))

(declare-fun b!252071 () Bool)

(declare-fun res!123391 () Bool)

(assert (=> b!252071 (= res!123391 (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6693 lt!126330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252071 (=> (not res!123391) (not e!163459))))

(declare-fun bm!23723 () Bool)

(assert (=> bm!23723 (= call!23726 (inRange!0 (ite c!42452 (index!6690 lt!126330) (index!6693 lt!126330)) (mask!10869 thiss!1504)))))

(declare-fun b!252072 () Bool)

(declare-fun Unit!7803 () Unit!7799)

(assert (=> b!252072 (= e!163458 Unit!7803)))

(declare-fun lt!126331 () Unit!7799)

(declare-fun lemmaArrayContainsKeyThenInListMap!208 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) (_ BitVec 32) Int) Unit!7799)

(assert (=> b!252072 (= lt!126331 (lemmaArrayContainsKeyThenInListMap!208 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(assert (=> b!252072 false))

(assert (= (and start!24098 res!123387) b!252057))

(assert (= (and b!252057 res!123386) b!252064))

(assert (= (and b!252064 res!123392) b!252051))

(assert (= (and b!252051 c!42453) b!252065))

(assert (= (and b!252051 (not c!42453)) b!252061))

(assert (= (and b!252061 c!42452) b!252066))

(assert (= (and b!252061 (not c!42452)) b!252056))

(assert (= (and b!252066 res!123390) b!252058))

(assert (= (and b!252058 res!123393) b!252054))

(assert (= (and b!252056 c!42454) b!252067))

(assert (= (and b!252056 (not c!42454)) b!252053))

(assert (= (and b!252067 res!123388) b!252071))

(assert (= (and b!252071 res!123391) b!252055))

(assert (= (or b!252066 b!252067) bm!23723))

(assert (= (or b!252054 b!252055) bm!23722))

(assert (= (and b!252051 res!123389) b!252052))

(assert (= (and b!252052 c!42455) b!252072))

(assert (= (and b!252052 (not c!42455)) b!252059))

(assert (= (and b!252052 (not res!123394)) b!252069))

(assert (= (and b!252069 (not res!123385)) b!252070))

(assert (= (and b!252068 condMapEmpty!11064) mapIsEmpty!11064))

(assert (= (and b!252068 (not condMapEmpty!11064)) mapNonEmpty!11064))

(assert (= (and mapNonEmpty!11064 ((_ is ValueCellFull!2910) mapValue!11064)) b!252063))

(assert (= (and b!252068 ((_ is ValueCellFull!2910) mapDefault!11064)) b!252060))

(assert (= b!252062 b!252068))

(assert (= start!24098 b!252062))

(declare-fun m!268279 () Bool)

(assert (=> b!252070 m!268279))

(declare-fun m!268281 () Bool)

(assert (=> b!252072 m!268281))

(declare-fun m!268283 () Bool)

(assert (=> b!252065 m!268283))

(declare-fun m!268285 () Bool)

(assert (=> b!252058 m!268285))

(declare-fun m!268287 () Bool)

(assert (=> bm!23722 m!268287))

(declare-fun m!268289 () Bool)

(assert (=> b!252052 m!268289))

(assert (=> b!252052 m!268287))

(declare-fun m!268291 () Bool)

(assert (=> b!252052 m!268291))

(declare-fun m!268293 () Bool)

(assert (=> b!252052 m!268293))

(declare-fun m!268295 () Bool)

(assert (=> b!252052 m!268295))

(declare-fun m!268297 () Bool)

(assert (=> b!252052 m!268297))

(declare-fun m!268299 () Bool)

(assert (=> b!252052 m!268299))

(declare-fun m!268301 () Bool)

(assert (=> b!252052 m!268301))

(declare-fun m!268303 () Bool)

(assert (=> b!252052 m!268303))

(declare-fun m!268305 () Bool)

(assert (=> b!252052 m!268305))

(declare-fun m!268307 () Bool)

(assert (=> b!252062 m!268307))

(declare-fun m!268309 () Bool)

(assert (=> b!252062 m!268309))

(declare-fun m!268311 () Bool)

(assert (=> b!252071 m!268311))

(declare-fun m!268313 () Bool)

(assert (=> bm!23723 m!268313))

(declare-fun m!268315 () Bool)

(assert (=> start!24098 m!268315))

(declare-fun m!268317 () Bool)

(assert (=> mapNonEmpty!11064 m!268317))

(declare-fun m!268319 () Bool)

(assert (=> b!252051 m!268319))

(declare-fun m!268321 () Bool)

(assert (=> b!252051 m!268321))

(assert (=> b!252051 m!268321))

(declare-fun m!268323 () Bool)

(assert (=> b!252051 m!268323))

(declare-fun m!268325 () Bool)

(assert (=> b!252061 m!268325))

(declare-fun m!268327 () Bool)

(assert (=> b!252064 m!268327))

(check-sat (not b!252052) (not b!252061) (not start!24098) (not b!252064) (not bm!23722) (not b!252072) b_and!13679 (not b!252070) (not b!252062) (not b!252051) (not b_next!6645) (not bm!23723) tp_is_empty!6507 (not b!252065) (not mapNonEmpty!11064))
(check-sat b_and!13679 (not b_next!6645))
(get-model)

(declare-fun d!61293 () Bool)

(declare-fun res!123429 () Bool)

(declare-fun e!163513 () Bool)

(assert (=> d!61293 (=> res!123429 e!163513)))

(assert (=> d!61293 (= res!123429 (= (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61293 (= (arrayContainsKey!0 (_keys!6803 thiss!1504) key!932 #b00000000000000000000000000000000) e!163513)))

(declare-fun b!252143 () Bool)

(declare-fun e!163514 () Bool)

(assert (=> b!252143 (= e!163513 e!163514)))

(declare-fun res!123430 () Bool)

(assert (=> b!252143 (=> (not res!123430) (not e!163514))))

(assert (=> b!252143 (= res!123430 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252144 () Bool)

(assert (=> b!252144 (= e!163514 (arrayContainsKey!0 (_keys!6803 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61293 (not res!123429)) b!252143))

(assert (= (and b!252143 res!123430) b!252144))

(declare-fun m!268379 () Bool)

(assert (=> d!61293 m!268379))

(declare-fun m!268381 () Bool)

(assert (=> b!252144 m!268381))

(assert (=> bm!23722 d!61293))

(declare-fun d!61295 () Bool)

(assert (=> d!61295 (contains!1826 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)) key!932)))

(declare-fun lt!126370 () Unit!7799)

(declare-fun choose!1200 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) (_ BitVec 32) Int) Unit!7799)

(assert (=> d!61295 (= lt!126370 (choose!1200 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(assert (=> d!61295 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61295 (= (lemmaArrayContainsKeyThenInListMap!208 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)) lt!126370)))

(declare-fun bs!9027 () Bool)

(assert (= bs!9027 d!61295))

(assert (=> bs!9027 m!268321))

(assert (=> bs!9027 m!268321))

(assert (=> bs!9027 m!268323))

(declare-fun m!268383 () Bool)

(assert (=> bs!9027 m!268383))

(assert (=> bs!9027 m!268289))

(assert (=> b!252072 d!61295))

(declare-fun d!61297 () Bool)

(assert (=> d!61297 (= (inRange!0 (ite c!42452 (index!6690 lt!126330) (index!6693 lt!126330)) (mask!10869 thiss!1504)) (and (bvsge (ite c!42452 (index!6690 lt!126330) (index!6693 lt!126330)) #b00000000000000000000000000000000) (bvslt (ite c!42452 (index!6690 lt!126330) (index!6693 lt!126330)) (bvadd (mask!10869 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23723 d!61297))

(declare-fun b!252157 () Bool)

(declare-fun e!163523 () SeekEntryResult!1130)

(declare-fun lt!126379 () SeekEntryResult!1130)

(assert (=> b!252157 (= e!163523 (Found!1130 (index!6692 lt!126379)))))

(declare-fun b!252158 () Bool)

(declare-fun e!163522 () SeekEntryResult!1130)

(assert (=> b!252158 (= e!163522 Undefined!1130)))

(declare-fun b!252159 () Bool)

(assert (=> b!252159 (= e!163522 e!163523)))

(declare-fun lt!126378 () (_ BitVec 64))

(assert (=> b!252159 (= lt!126378 (select (arr!5849 (_keys!6803 thiss!1504)) (index!6692 lt!126379)))))

(declare-fun c!42476 () Bool)

(assert (=> b!252159 (= c!42476 (= lt!126378 key!932))))

(declare-fun b!252160 () Bool)

(declare-fun c!42474 () Bool)

(assert (=> b!252160 (= c!42474 (= lt!126378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163521 () SeekEntryResult!1130)

(assert (=> b!252160 (= e!163523 e!163521)))

(declare-fun b!252161 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12339 (_ BitVec 32)) SeekEntryResult!1130)

(assert (=> b!252161 (= e!163521 (seekKeyOrZeroReturnVacant!0 (x!24750 lt!126379) (index!6692 lt!126379) (index!6692 lt!126379) key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun d!61299 () Bool)

(declare-fun lt!126377 () SeekEntryResult!1130)

(assert (=> d!61299 (and (or ((_ is Undefined!1130) lt!126377) (not ((_ is Found!1130) lt!126377)) (and (bvsge (index!6691 lt!126377) #b00000000000000000000000000000000) (bvslt (index!6691 lt!126377) (size!6196 (_keys!6803 thiss!1504))))) (or ((_ is Undefined!1130) lt!126377) ((_ is Found!1130) lt!126377) (not ((_ is MissingZero!1130) lt!126377)) (and (bvsge (index!6690 lt!126377) #b00000000000000000000000000000000) (bvslt (index!6690 lt!126377) (size!6196 (_keys!6803 thiss!1504))))) (or ((_ is Undefined!1130) lt!126377) ((_ is Found!1130) lt!126377) ((_ is MissingZero!1130) lt!126377) (not ((_ is MissingVacant!1130) lt!126377)) (and (bvsge (index!6693 lt!126377) #b00000000000000000000000000000000) (bvslt (index!6693 lt!126377) (size!6196 (_keys!6803 thiss!1504))))) (or ((_ is Undefined!1130) lt!126377) (ite ((_ is Found!1130) lt!126377) (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6691 lt!126377)) key!932) (ite ((_ is MissingZero!1130) lt!126377) (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6690 lt!126377)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1130) lt!126377) (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6693 lt!126377)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61299 (= lt!126377 e!163522)))

(declare-fun c!42475 () Bool)

(assert (=> d!61299 (= c!42475 (and ((_ is Intermediate!1130) lt!126379) (undefined!1942 lt!126379)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12339 (_ BitVec 32)) SeekEntryResult!1130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61299 (= lt!126379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10869 thiss!1504)) key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(assert (=> d!61299 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61299 (= (seekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)) lt!126377)))

(declare-fun b!252162 () Bool)

(assert (=> b!252162 (= e!163521 (MissingZero!1130 (index!6692 lt!126379)))))

(assert (= (and d!61299 c!42475) b!252158))

(assert (= (and d!61299 (not c!42475)) b!252159))

(assert (= (and b!252159 c!42476) b!252157))

(assert (= (and b!252159 (not c!42476)) b!252160))

(assert (= (and b!252160 c!42474) b!252162))

(assert (= (and b!252160 (not c!42474)) b!252161))

(declare-fun m!268385 () Bool)

(assert (=> b!252159 m!268385))

(declare-fun m!268387 () Bool)

(assert (=> b!252161 m!268387))

(assert (=> d!61299 m!268289))

(declare-fun m!268389 () Bool)

(assert (=> d!61299 m!268389))

(declare-fun m!268391 () Bool)

(assert (=> d!61299 m!268391))

(declare-fun m!268393 () Bool)

(assert (=> d!61299 m!268393))

(declare-fun m!268395 () Bool)

(assert (=> d!61299 m!268395))

(declare-fun m!268397 () Bool)

(assert (=> d!61299 m!268397))

(assert (=> d!61299 m!268391))

(assert (=> b!252064 d!61299))

(declare-fun d!61301 () Bool)

(declare-fun e!163526 () Bool)

(assert (=> d!61301 e!163526))

(declare-fun res!123435 () Bool)

(assert (=> d!61301 (=> (not res!123435) (not e!163526))))

(declare-fun lt!126384 () SeekEntryResult!1130)

(assert (=> d!61301 (= res!123435 ((_ is Found!1130) lt!126384))))

(assert (=> d!61301 (= lt!126384 (seekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun lt!126385 () Unit!7799)

(declare-fun choose!1201 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) Int) Unit!7799)

(assert (=> d!61301 (= lt!126385 (choose!1201 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)))))

(assert (=> d!61301 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61301 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)) lt!126385)))

(declare-fun b!252167 () Bool)

(declare-fun res!123436 () Bool)

(assert (=> b!252167 (=> (not res!123436) (not e!163526))))

(assert (=> b!252167 (= res!123436 (inRange!0 (index!6691 lt!126384) (mask!10869 thiss!1504)))))

(declare-fun b!252168 () Bool)

(assert (=> b!252168 (= e!163526 (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6691 lt!126384)) key!932))))

(assert (=> b!252168 (and (bvsge (index!6691 lt!126384) #b00000000000000000000000000000000) (bvslt (index!6691 lt!126384) (size!6196 (_keys!6803 thiss!1504))))))

(assert (= (and d!61301 res!123435) b!252167))

(assert (= (and b!252167 res!123436) b!252168))

(assert (=> d!61301 m!268327))

(declare-fun m!268399 () Bool)

(assert (=> d!61301 m!268399))

(assert (=> d!61301 m!268289))

(declare-fun m!268401 () Bool)

(assert (=> b!252167 m!268401))

(declare-fun m!268403 () Bool)

(assert (=> b!252168 m!268403))

(assert (=> b!252065 d!61301))

(declare-fun d!61303 () Bool)

(declare-fun res!123445 () Bool)

(declare-fun e!163536 () Bool)

(assert (=> d!61303 (=> res!123445 e!163536)))

(assert (=> d!61303 (= res!123445 (bvsge #b00000000000000000000000000000000 (size!6196 lt!126328)))))

(assert (=> d!61303 (= (arrayNoDuplicates!0 lt!126328 #b00000000000000000000000000000000 Nil!3734) e!163536)))

(declare-fun b!252179 () Bool)

(declare-fun e!163538 () Bool)

(declare-fun call!23735 () Bool)

(assert (=> b!252179 (= e!163538 call!23735)))

(declare-fun b!252180 () Bool)

(declare-fun e!163537 () Bool)

(declare-fun contains!1828 (List!3737 (_ BitVec 64)) Bool)

(assert (=> b!252180 (= e!163537 (contains!1828 Nil!3734 (select (arr!5849 lt!126328) #b00000000000000000000000000000000)))))

(declare-fun bm!23732 () Bool)

(declare-fun c!42479 () Bool)

(assert (=> bm!23732 (= call!23735 (arrayNoDuplicates!0 lt!126328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42479 (Cons!3733 (select (arr!5849 lt!126328) #b00000000000000000000000000000000) Nil!3734) Nil!3734)))))

(declare-fun b!252181 () Bool)

(declare-fun e!163535 () Bool)

(assert (=> b!252181 (= e!163536 e!163535)))

(declare-fun res!123443 () Bool)

(assert (=> b!252181 (=> (not res!123443) (not e!163535))))

(assert (=> b!252181 (= res!123443 (not e!163537))))

(declare-fun res!123444 () Bool)

(assert (=> b!252181 (=> (not res!123444) (not e!163537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252181 (= res!123444 (validKeyInArray!0 (select (arr!5849 lt!126328) #b00000000000000000000000000000000)))))

(declare-fun b!252182 () Bool)

(assert (=> b!252182 (= e!163535 e!163538)))

(assert (=> b!252182 (= c!42479 (validKeyInArray!0 (select (arr!5849 lt!126328) #b00000000000000000000000000000000)))))

(declare-fun b!252183 () Bool)

(assert (=> b!252183 (= e!163538 call!23735)))

(assert (= (and d!61303 (not res!123445)) b!252181))

(assert (= (and b!252181 res!123444) b!252180))

(assert (= (and b!252181 res!123443) b!252182))

(assert (= (and b!252182 c!42479) b!252179))

(assert (= (and b!252182 (not c!42479)) b!252183))

(assert (= (or b!252179 b!252183) bm!23732))

(declare-fun m!268405 () Bool)

(assert (=> b!252180 m!268405))

(assert (=> b!252180 m!268405))

(declare-fun m!268407 () Bool)

(assert (=> b!252180 m!268407))

(assert (=> bm!23732 m!268405))

(declare-fun m!268409 () Bool)

(assert (=> bm!23732 m!268409))

(assert (=> b!252181 m!268405))

(assert (=> b!252181 m!268405))

(declare-fun m!268411 () Bool)

(assert (=> b!252181 m!268411))

(assert (=> b!252182 m!268405))

(assert (=> b!252182 m!268405))

(assert (=> b!252182 m!268411))

(assert (=> b!252052 d!61303))

(declare-fun b!252195 () Bool)

(declare-fun e!163543 () Bool)

(assert (=> b!252195 (= e!163543 (= (arrayCountValidKeys!0 (array!12340 (store (arr!5849 (_keys!6803 thiss!1504)) index!297 key!932) (size!6196 (_keys!6803 thiss!1504))) #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6803 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252194 () Bool)

(declare-fun e!163544 () Bool)

(assert (=> b!252194 (= e!163544 (bvslt (size!6196 (_keys!6803 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61305 () Bool)

(assert (=> d!61305 e!163543))

(declare-fun res!123456 () Bool)

(assert (=> d!61305 (=> (not res!123456) (not e!163543))))

(assert (=> d!61305 (= res!123456 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6803 thiss!1504)))))))

(declare-fun lt!126388 () Unit!7799)

(declare-fun choose!1 (array!12339 (_ BitVec 32) (_ BitVec 64)) Unit!7799)

(assert (=> d!61305 (= lt!126388 (choose!1 (_keys!6803 thiss!1504) index!297 key!932))))

(assert (=> d!61305 e!163544))

(declare-fun res!123455 () Bool)

(assert (=> d!61305 (=> (not res!123455) (not e!163544))))

(assert (=> d!61305 (= res!123455 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6803 thiss!1504)))))))

(assert (=> d!61305 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6803 thiss!1504) index!297 key!932) lt!126388)))

(declare-fun b!252193 () Bool)

(declare-fun res!123454 () Bool)

(assert (=> b!252193 (=> (not res!123454) (not e!163544))))

(assert (=> b!252193 (= res!123454 (validKeyInArray!0 key!932))))

(declare-fun b!252192 () Bool)

(declare-fun res!123457 () Bool)

(assert (=> b!252192 (=> (not res!123457) (not e!163544))))

(assert (=> b!252192 (= res!123457 (not (validKeyInArray!0 (select (arr!5849 (_keys!6803 thiss!1504)) index!297))))))

(assert (= (and d!61305 res!123455) b!252192))

(assert (= (and b!252192 res!123457) b!252193))

(assert (= (and b!252193 res!123454) b!252194))

(assert (= (and d!61305 res!123456) b!252195))

(assert (=> b!252195 m!268301))

(declare-fun m!268413 () Bool)

(assert (=> b!252195 m!268413))

(assert (=> b!252195 m!268303))

(declare-fun m!268415 () Bool)

(assert (=> d!61305 m!268415))

(declare-fun m!268417 () Bool)

(assert (=> b!252193 m!268417))

(declare-fun m!268419 () Bool)

(assert (=> b!252192 m!268419))

(assert (=> b!252192 m!268419))

(declare-fun m!268421 () Bool)

(assert (=> b!252192 m!268421))

(assert (=> b!252052 d!61305))

(declare-fun b!252204 () Bool)

(declare-fun e!163549 () (_ BitVec 32))

(assert (=> b!252204 (= e!163549 #b00000000000000000000000000000000)))

(declare-fun b!252206 () Bool)

(declare-fun e!163550 () (_ BitVec 32))

(declare-fun call!23738 () (_ BitVec 32))

(assert (=> b!252206 (= e!163550 (bvadd #b00000000000000000000000000000001 call!23738))))

(declare-fun bm!23735 () Bool)

(assert (=> bm!23735 (= call!23738 (arrayCountValidKeys!0 (_keys!6803 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252207 () Bool)

(assert (=> b!252207 (= e!163550 call!23738)))

(declare-fun d!61307 () Bool)

(declare-fun lt!126391 () (_ BitVec 32))

(assert (=> d!61307 (and (bvsge lt!126391 #b00000000000000000000000000000000) (bvsle lt!126391 (bvsub (size!6196 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61307 (= lt!126391 e!163549)))

(declare-fun c!42485 () Bool)

(assert (=> d!61307 (= c!42485 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(assert (=> d!61307 (and (bvsle #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6196 (_keys!6803 thiss!1504)) (size!6196 (_keys!6803 thiss!1504))))))

(assert (=> d!61307 (= (arrayCountValidKeys!0 (_keys!6803 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) lt!126391)))

(declare-fun b!252205 () Bool)

(assert (=> b!252205 (= e!163549 e!163550)))

(declare-fun c!42484 () Bool)

(assert (=> b!252205 (= c!42484 (validKeyInArray!0 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61307 c!42485) b!252204))

(assert (= (and d!61307 (not c!42485)) b!252205))

(assert (= (and b!252205 c!42484) b!252206))

(assert (= (and b!252205 (not c!42484)) b!252207))

(assert (= (or b!252206 b!252207) bm!23735))

(declare-fun m!268423 () Bool)

(assert (=> bm!23735 m!268423))

(assert (=> b!252205 m!268379))

(assert (=> b!252205 m!268379))

(declare-fun m!268425 () Bool)

(assert (=> b!252205 m!268425))

(assert (=> b!252052 d!61307))

(declare-fun d!61309 () Bool)

(assert (=> d!61309 (= (validMask!0 (mask!10869 thiss!1504)) (and (or (= (mask!10869 thiss!1504) #b00000000000000000000000000000111) (= (mask!10869 thiss!1504) #b00000000000000000000000000001111) (= (mask!10869 thiss!1504) #b00000000000000000000000000011111) (= (mask!10869 thiss!1504) #b00000000000000000000000000111111) (= (mask!10869 thiss!1504) #b00000000000000000000000001111111) (= (mask!10869 thiss!1504) #b00000000000000000000000011111111) (= (mask!10869 thiss!1504) #b00000000000000000000000111111111) (= (mask!10869 thiss!1504) #b00000000000000000000001111111111) (= (mask!10869 thiss!1504) #b00000000000000000000011111111111) (= (mask!10869 thiss!1504) #b00000000000000000000111111111111) (= (mask!10869 thiss!1504) #b00000000000000000001111111111111) (= (mask!10869 thiss!1504) #b00000000000000000011111111111111) (= (mask!10869 thiss!1504) #b00000000000000000111111111111111) (= (mask!10869 thiss!1504) #b00000000000000001111111111111111) (= (mask!10869 thiss!1504) #b00000000000000011111111111111111) (= (mask!10869 thiss!1504) #b00000000000000111111111111111111) (= (mask!10869 thiss!1504) #b00000000000001111111111111111111) (= (mask!10869 thiss!1504) #b00000000000011111111111111111111) (= (mask!10869 thiss!1504) #b00000000000111111111111111111111) (= (mask!10869 thiss!1504) #b00000000001111111111111111111111) (= (mask!10869 thiss!1504) #b00000000011111111111111111111111) (= (mask!10869 thiss!1504) #b00000000111111111111111111111111) (= (mask!10869 thiss!1504) #b00000001111111111111111111111111) (= (mask!10869 thiss!1504) #b00000011111111111111111111111111) (= (mask!10869 thiss!1504) #b00000111111111111111111111111111) (= (mask!10869 thiss!1504) #b00001111111111111111111111111111) (= (mask!10869 thiss!1504) #b00011111111111111111111111111111) (= (mask!10869 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10869 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252052 d!61309))

(declare-fun b!252216 () Bool)

(declare-fun e!163559 () Bool)

(declare-fun call!23741 () Bool)

(assert (=> b!252216 (= e!163559 call!23741)))

(declare-fun b!252217 () Bool)

(declare-fun e!163558 () Bool)

(assert (=> b!252217 (= e!163558 e!163559)))

(declare-fun lt!126398 () (_ BitVec 64))

(assert (=> b!252217 (= lt!126398 (select (arr!5849 lt!126328) #b00000000000000000000000000000000))))

(declare-fun lt!126399 () Unit!7799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12339 (_ BitVec 64) (_ BitVec 32)) Unit!7799)

(assert (=> b!252217 (= lt!126399 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126328 lt!126398 #b00000000000000000000000000000000))))

(assert (=> b!252217 (arrayContainsKey!0 lt!126328 lt!126398 #b00000000000000000000000000000000)))

(declare-fun lt!126400 () Unit!7799)

(assert (=> b!252217 (= lt!126400 lt!126399)))

(declare-fun res!123463 () Bool)

(assert (=> b!252217 (= res!123463 (= (seekEntryOrOpen!0 (select (arr!5849 lt!126328) #b00000000000000000000000000000000) lt!126328 (mask!10869 thiss!1504)) (Found!1130 #b00000000000000000000000000000000)))))

(assert (=> b!252217 (=> (not res!123463) (not e!163559))))

(declare-fun d!61311 () Bool)

(declare-fun res!123462 () Bool)

(declare-fun e!163557 () Bool)

(assert (=> d!61311 (=> res!123462 e!163557)))

(assert (=> d!61311 (= res!123462 (bvsge #b00000000000000000000000000000000 (size!6196 lt!126328)))))

(assert (=> d!61311 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126328 (mask!10869 thiss!1504)) e!163557)))

(declare-fun b!252218 () Bool)

(assert (=> b!252218 (= e!163557 e!163558)))

(declare-fun c!42488 () Bool)

(assert (=> b!252218 (= c!42488 (validKeyInArray!0 (select (arr!5849 lt!126328) #b00000000000000000000000000000000)))))

(declare-fun b!252219 () Bool)

(assert (=> b!252219 (= e!163558 call!23741)))

(declare-fun bm!23738 () Bool)

(assert (=> bm!23738 (= call!23741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126328 (mask!10869 thiss!1504)))))

(assert (= (and d!61311 (not res!123462)) b!252218))

(assert (= (and b!252218 c!42488) b!252217))

(assert (= (and b!252218 (not c!42488)) b!252219))

(assert (= (and b!252217 res!123463) b!252216))

(assert (= (or b!252216 b!252219) bm!23738))

(assert (=> b!252217 m!268405))

(declare-fun m!268427 () Bool)

(assert (=> b!252217 m!268427))

(declare-fun m!268429 () Bool)

(assert (=> b!252217 m!268429))

(assert (=> b!252217 m!268405))

(declare-fun m!268431 () Bool)

(assert (=> b!252217 m!268431))

(assert (=> b!252218 m!268405))

(assert (=> b!252218 m!268405))

(assert (=> b!252218 m!268411))

(declare-fun m!268433 () Bool)

(assert (=> bm!23738 m!268433))

(assert (=> b!252052 d!61311))

(declare-fun b!252220 () Bool)

(declare-fun e!163560 () (_ BitVec 32))

(assert (=> b!252220 (= e!163560 #b00000000000000000000000000000000)))

(declare-fun b!252222 () Bool)

(declare-fun e!163561 () (_ BitVec 32))

(declare-fun call!23742 () (_ BitVec 32))

(assert (=> b!252222 (= e!163561 (bvadd #b00000000000000000000000000000001 call!23742))))

(declare-fun bm!23739 () Bool)

(assert (=> bm!23739 (= call!23742 (arrayCountValidKeys!0 lt!126328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252223 () Bool)

(assert (=> b!252223 (= e!163561 call!23742)))

(declare-fun d!61313 () Bool)

(declare-fun lt!126401 () (_ BitVec 32))

(assert (=> d!61313 (and (bvsge lt!126401 #b00000000000000000000000000000000) (bvsle lt!126401 (bvsub (size!6196 lt!126328) #b00000000000000000000000000000000)))))

(assert (=> d!61313 (= lt!126401 e!163560)))

(declare-fun c!42490 () Bool)

(assert (=> d!61313 (= c!42490 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(assert (=> d!61313 (and (bvsle #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6196 (_keys!6803 thiss!1504)) (size!6196 lt!126328)))))

(assert (=> d!61313 (= (arrayCountValidKeys!0 lt!126328 #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) lt!126401)))

(declare-fun b!252221 () Bool)

(assert (=> b!252221 (= e!163560 e!163561)))

(declare-fun c!42489 () Bool)

(assert (=> b!252221 (= c!42489 (validKeyInArray!0 (select (arr!5849 lt!126328) #b00000000000000000000000000000000)))))

(assert (= (and d!61313 c!42490) b!252220))

(assert (= (and d!61313 (not c!42490)) b!252221))

(assert (= (and b!252221 c!42489) b!252222))

(assert (= (and b!252221 (not c!42489)) b!252223))

(assert (= (or b!252222 b!252223) bm!23739))

(declare-fun m!268435 () Bool)

(assert (=> bm!23739 m!268435))

(assert (=> b!252221 m!268405))

(assert (=> b!252221 m!268405))

(assert (=> b!252221 m!268411))

(assert (=> b!252052 d!61313))

(declare-fun d!61315 () Bool)

(declare-fun e!163564 () Bool)

(assert (=> d!61315 e!163564))

(declare-fun res!123466 () Bool)

(assert (=> d!61315 (=> (not res!123466) (not e!163564))))

(assert (=> d!61315 (= res!123466 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6803 thiss!1504)))))))

(declare-fun lt!126404 () Unit!7799)

(declare-fun choose!41 (array!12339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3737) Unit!7799)

(assert (=> d!61315 (= lt!126404 (choose!41 (_keys!6803 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3734))))

(assert (=> d!61315 (bvslt (size!6196 (_keys!6803 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61315 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6803 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3734) lt!126404)))

(declare-fun b!252226 () Bool)

(assert (=> b!252226 (= e!163564 (arrayNoDuplicates!0 (array!12340 (store (arr!5849 (_keys!6803 thiss!1504)) index!297 key!932) (size!6196 (_keys!6803 thiss!1504))) #b00000000000000000000000000000000 Nil!3734))))

(assert (= (and d!61315 res!123466) b!252226))

(declare-fun m!268437 () Bool)

(assert (=> d!61315 m!268437))

(assert (=> b!252226 m!268301))

(declare-fun m!268439 () Bool)

(assert (=> b!252226 m!268439))

(assert (=> b!252052 d!61315))

(assert (=> b!252052 d!61293))

(declare-fun d!61317 () Bool)

(declare-fun e!163567 () Bool)

(assert (=> d!61317 e!163567))

(declare-fun res!123469 () Bool)

(assert (=> d!61317 (=> (not res!123469) (not e!163567))))

(assert (=> d!61317 (= res!123469 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6196 (_keys!6803 thiss!1504)))))))

(declare-fun lt!126407 () Unit!7799)

(declare-fun choose!102 ((_ BitVec 64) array!12339 (_ BitVec 32) (_ BitVec 32)) Unit!7799)

(assert (=> d!61317 (= lt!126407 (choose!102 key!932 (_keys!6803 thiss!1504) index!297 (mask!10869 thiss!1504)))))

(assert (=> d!61317 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61317 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) index!297 (mask!10869 thiss!1504)) lt!126407)))

(declare-fun b!252229 () Bool)

(assert (=> b!252229 (= e!163567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12340 (store (arr!5849 (_keys!6803 thiss!1504)) index!297 key!932) (size!6196 (_keys!6803 thiss!1504))) (mask!10869 thiss!1504)))))

(assert (= (and d!61317 res!123469) b!252229))

(declare-fun m!268441 () Bool)

(assert (=> d!61317 m!268441))

(assert (=> d!61317 m!268289))

(assert (=> b!252229 m!268301))

(declare-fun m!268443 () Bool)

(assert (=> b!252229 m!268443))

(assert (=> b!252052 d!61317))

(declare-fun d!61319 () Bool)

(assert (=> d!61319 (= (inRange!0 index!297 (mask!10869 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10869 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252051 d!61319))

(declare-fun d!61321 () Bool)

(declare-fun e!163573 () Bool)

(assert (=> d!61321 e!163573))

(declare-fun res!123472 () Bool)

(assert (=> d!61321 (=> res!123472 e!163573)))

(declare-fun lt!126419 () Bool)

(assert (=> d!61321 (= res!123472 (not lt!126419))))

(declare-fun lt!126416 () Bool)

(assert (=> d!61321 (= lt!126419 lt!126416)))

(declare-fun lt!126418 () Unit!7799)

(declare-fun e!163572 () Unit!7799)

(assert (=> d!61321 (= lt!126418 e!163572)))

(declare-fun c!42493 () Bool)

(assert (=> d!61321 (= c!42493 lt!126416)))

(declare-fun containsKey!293 (List!3736 (_ BitVec 64)) Bool)

(assert (=> d!61321 (= lt!126416 (containsKey!293 (toList!1900 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504))) key!932))))

(assert (=> d!61321 (= (contains!1826 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)) key!932) lt!126419)))

(declare-fun b!252236 () Bool)

(declare-fun lt!126417 () Unit!7799)

(assert (=> b!252236 (= e!163572 lt!126417)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!241 (List!3736 (_ BitVec 64)) Unit!7799)

(assert (=> b!252236 (= lt!126417 (lemmaContainsKeyImpliesGetValueByKeyDefined!241 (toList!1900 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504))) key!932))))

(declare-datatypes ((Option!307 0))(
  ( (Some!306 (v!5370 V!8323)) (None!305) )
))
(declare-fun isDefined!242 (Option!307) Bool)

(declare-fun getValueByKey!301 (List!3736 (_ BitVec 64)) Option!307)

(assert (=> b!252236 (isDefined!242 (getValueByKey!301 (toList!1900 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504))) key!932))))

(declare-fun b!252237 () Bool)

(declare-fun Unit!7808 () Unit!7799)

(assert (=> b!252237 (= e!163572 Unit!7808)))

(declare-fun b!252238 () Bool)

(assert (=> b!252238 (= e!163573 (isDefined!242 (getValueByKey!301 (toList!1900 (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504))) key!932)))))

(assert (= (and d!61321 c!42493) b!252236))

(assert (= (and d!61321 (not c!42493)) b!252237))

(assert (= (and d!61321 (not res!123472)) b!252238))

(declare-fun m!268445 () Bool)

(assert (=> d!61321 m!268445))

(declare-fun m!268447 () Bool)

(assert (=> b!252236 m!268447))

(declare-fun m!268449 () Bool)

(assert (=> b!252236 m!268449))

(assert (=> b!252236 m!268449))

(declare-fun m!268451 () Bool)

(assert (=> b!252236 m!268451))

(assert (=> b!252238 m!268449))

(assert (=> b!252238 m!268449))

(assert (=> b!252238 m!268451))

(assert (=> b!252051 d!61321))

(declare-fun b!252281 () Bool)

(declare-fun e!163603 () Bool)

(declare-fun e!163601 () Bool)

(assert (=> b!252281 (= e!163603 e!163601)))

(declare-fun res!123498 () Bool)

(declare-fun call!23761 () Bool)

(assert (=> b!252281 (= res!123498 call!23761)))

(assert (=> b!252281 (=> (not res!123498) (not e!163601))))

(declare-fun b!252282 () Bool)

(declare-fun lt!126478 () ListLongMap!3769)

(declare-fun apply!243 (ListLongMap!3769 (_ BitVec 64)) V!8323)

(assert (=> b!252282 (= e!163601 (= (apply!243 lt!126478 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4498 thiss!1504)))))

(declare-fun b!252283 () Bool)

(declare-fun e!163612 () ListLongMap!3769)

(declare-fun e!163606 () ListLongMap!3769)

(assert (=> b!252283 (= e!163612 e!163606)))

(declare-fun c!42507 () Bool)

(assert (=> b!252283 (= c!42507 (and (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252284 () Bool)

(declare-fun e!163608 () Bool)

(declare-fun call!23757 () Bool)

(assert (=> b!252284 (= e!163608 (not call!23757))))

(declare-fun b!252285 () Bool)

(declare-fun e!163611 () Bool)

(declare-fun e!163604 () Bool)

(assert (=> b!252285 (= e!163611 e!163604)))

(declare-fun res!123493 () Bool)

(assert (=> b!252285 (=> (not res!123493) (not e!163604))))

(assert (=> b!252285 (= res!123493 (contains!1826 lt!126478 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252285 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun bm!23754 () Bool)

(declare-fun call!23763 () ListLongMap!3769)

(declare-fun call!23758 () ListLongMap!3769)

(assert (=> bm!23754 (= call!23763 call!23758)))

(declare-fun d!61323 () Bool)

(declare-fun e!163602 () Bool)

(assert (=> d!61323 e!163602))

(declare-fun res!123494 () Bool)

(assert (=> d!61323 (=> (not res!123494) (not e!163602))))

(assert (=> d!61323 (= res!123494 (or (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))))

(declare-fun lt!126476 () ListLongMap!3769)

(assert (=> d!61323 (= lt!126478 lt!126476)))

(declare-fun lt!126483 () Unit!7799)

(declare-fun e!163605 () Unit!7799)

(assert (=> d!61323 (= lt!126483 e!163605)))

(declare-fun c!42509 () Bool)

(declare-fun e!163600 () Bool)

(assert (=> d!61323 (= c!42509 e!163600)))

(declare-fun res!123496 () Bool)

(assert (=> d!61323 (=> (not res!123496) (not e!163600))))

(assert (=> d!61323 (= res!123496 (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(assert (=> d!61323 (= lt!126476 e!163612)))

(declare-fun c!42510 () Bool)

(assert (=> d!61323 (= c!42510 (and (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61323 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61323 (= (getCurrentListMap!1428 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)) lt!126478)))

(declare-fun b!252286 () Bool)

(assert (=> b!252286 (= e!163603 (not call!23761))))

(declare-fun b!252287 () Bool)

(declare-fun get!3012 (ValueCell!2910 V!8323) V!8323)

(declare-fun dynLambda!586 (Int (_ BitVec 64)) V!8323)

(assert (=> b!252287 (= e!163604 (= (apply!243 lt!126478 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)) (get!3012 (select (arr!5848 (_values!4640 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!586 (defaultEntry!4657 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6195 (_values!4640 thiss!1504))))))

(assert (=> b!252287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252288 () Bool)

(declare-fun e!163607 () Bool)

(assert (=> b!252288 (= e!163608 e!163607)))

(declare-fun res!123497 () Bool)

(assert (=> b!252288 (= res!123497 call!23757)))

(assert (=> b!252288 (=> (not res!123497) (not e!163607))))

(declare-fun b!252289 () Bool)

(assert (=> b!252289 (= e!163600 (validKeyInArray!0 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23755 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!565 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 32) Int) ListLongMap!3769)

(assert (=> bm!23755 (= call!23758 (getCurrentListMapNoExtraKeys!565 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(declare-fun b!252290 () Bool)

(declare-fun e!163609 () ListLongMap!3769)

(declare-fun call!23760 () ListLongMap!3769)

(assert (=> b!252290 (= e!163609 call!23760)))

(declare-fun call!23759 () ListLongMap!3769)

(declare-fun bm!23756 () Bool)

(declare-fun +!670 (ListLongMap!3769 tuple2!4856) ListLongMap!3769)

(assert (=> bm!23756 (= call!23759 (+!670 (ite c!42510 call!23758 (ite c!42507 call!23763 call!23760)) (ite (or c!42510 c!42507) (tuple2!4857 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4498 thiss!1504)) (tuple2!4857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4498 thiss!1504)))))))

(declare-fun b!252291 () Bool)

(assert (=> b!252291 (= e!163607 (= (apply!243 lt!126478 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4498 thiss!1504)))))

(declare-fun b!252292 () Bool)

(declare-fun lt!126469 () Unit!7799)

(assert (=> b!252292 (= e!163605 lt!126469)))

(declare-fun lt!126465 () ListLongMap!3769)

(assert (=> b!252292 (= lt!126465 (getCurrentListMapNoExtraKeys!565 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(declare-fun lt!126481 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126475 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126475 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126468 () Unit!7799)

(declare-fun addStillContains!219 (ListLongMap!3769 (_ BitVec 64) V!8323 (_ BitVec 64)) Unit!7799)

(assert (=> b!252292 (= lt!126468 (addStillContains!219 lt!126465 lt!126481 (zeroValue!4498 thiss!1504) lt!126475))))

(assert (=> b!252292 (contains!1826 (+!670 lt!126465 (tuple2!4857 lt!126481 (zeroValue!4498 thiss!1504))) lt!126475)))

(declare-fun lt!126480 () Unit!7799)

(assert (=> b!252292 (= lt!126480 lt!126468)))

(declare-fun lt!126464 () ListLongMap!3769)

(assert (=> b!252292 (= lt!126464 (getCurrentListMapNoExtraKeys!565 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(declare-fun lt!126466 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126474 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126474 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126470 () Unit!7799)

(declare-fun addApplyDifferent!219 (ListLongMap!3769 (_ BitVec 64) V!8323 (_ BitVec 64)) Unit!7799)

(assert (=> b!252292 (= lt!126470 (addApplyDifferent!219 lt!126464 lt!126466 (minValue!4498 thiss!1504) lt!126474))))

(assert (=> b!252292 (= (apply!243 (+!670 lt!126464 (tuple2!4857 lt!126466 (minValue!4498 thiss!1504))) lt!126474) (apply!243 lt!126464 lt!126474))))

(declare-fun lt!126472 () Unit!7799)

(assert (=> b!252292 (= lt!126472 lt!126470)))

(declare-fun lt!126482 () ListLongMap!3769)

(assert (=> b!252292 (= lt!126482 (getCurrentListMapNoExtraKeys!565 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(declare-fun lt!126467 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126477 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126477 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126484 () Unit!7799)

(assert (=> b!252292 (= lt!126484 (addApplyDifferent!219 lt!126482 lt!126467 (zeroValue!4498 thiss!1504) lt!126477))))

(assert (=> b!252292 (= (apply!243 (+!670 lt!126482 (tuple2!4857 lt!126467 (zeroValue!4498 thiss!1504))) lt!126477) (apply!243 lt!126482 lt!126477))))

(declare-fun lt!126479 () Unit!7799)

(assert (=> b!252292 (= lt!126479 lt!126484)))

(declare-fun lt!126473 () ListLongMap!3769)

(assert (=> b!252292 (= lt!126473 (getCurrentListMapNoExtraKeys!565 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4657 thiss!1504)))))

(declare-fun lt!126485 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126471 () (_ BitVec 64))

(assert (=> b!252292 (= lt!126471 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252292 (= lt!126469 (addApplyDifferent!219 lt!126473 lt!126485 (minValue!4498 thiss!1504) lt!126471))))

(assert (=> b!252292 (= (apply!243 (+!670 lt!126473 (tuple2!4857 lt!126485 (minValue!4498 thiss!1504))) lt!126471) (apply!243 lt!126473 lt!126471))))

(declare-fun bm!23757 () Bool)

(assert (=> bm!23757 (= call!23761 (contains!1826 lt!126478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252293 () Bool)

(declare-fun res!123492 () Bool)

(assert (=> b!252293 (=> (not res!123492) (not e!163602))))

(assert (=> b!252293 (= res!123492 e!163611)))

(declare-fun res!123499 () Bool)

(assert (=> b!252293 (=> res!123499 e!163611)))

(declare-fun e!163610 () Bool)

(assert (=> b!252293 (= res!123499 (not e!163610))))

(declare-fun res!123491 () Bool)

(assert (=> b!252293 (=> (not res!123491) (not e!163610))))

(assert (=> b!252293 (= res!123491 (bvslt #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252294 () Bool)

(declare-fun call!23762 () ListLongMap!3769)

(assert (=> b!252294 (= e!163606 call!23762)))

(declare-fun b!252295 () Bool)

(assert (=> b!252295 (= e!163609 call!23762)))

(declare-fun b!252296 () Bool)

(assert (=> b!252296 (= e!163610 (validKeyInArray!0 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252297 () Bool)

(declare-fun c!42508 () Bool)

(assert (=> b!252297 (= c!42508 (and (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!252297 (= e!163606 e!163609)))

(declare-fun b!252298 () Bool)

(declare-fun Unit!7809 () Unit!7799)

(assert (=> b!252298 (= e!163605 Unit!7809)))

(declare-fun bm!23758 () Bool)

(assert (=> bm!23758 (= call!23760 call!23763)))

(declare-fun bm!23759 () Bool)

(assert (=> bm!23759 (= call!23757 (contains!1826 lt!126478 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252299 () Bool)

(declare-fun res!123495 () Bool)

(assert (=> b!252299 (=> (not res!123495) (not e!163602))))

(assert (=> b!252299 (= res!123495 e!163603)))

(declare-fun c!42511 () Bool)

(assert (=> b!252299 (= c!42511 (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23760 () Bool)

(assert (=> bm!23760 (= call!23762 call!23759)))

(declare-fun b!252300 () Bool)

(assert (=> b!252300 (= e!163612 (+!670 call!23759 (tuple2!4857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4498 thiss!1504))))))

(declare-fun b!252301 () Bool)

(assert (=> b!252301 (= e!163602 e!163608)))

(declare-fun c!42506 () Bool)

(assert (=> b!252301 (= c!42506 (not (= (bvand (extraKeys!4394 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61323 c!42510) b!252300))

(assert (= (and d!61323 (not c!42510)) b!252283))

(assert (= (and b!252283 c!42507) b!252294))

(assert (= (and b!252283 (not c!42507)) b!252297))

(assert (= (and b!252297 c!42508) b!252295))

(assert (= (and b!252297 (not c!42508)) b!252290))

(assert (= (or b!252295 b!252290) bm!23758))

(assert (= (or b!252294 bm!23758) bm!23754))

(assert (= (or b!252294 b!252295) bm!23760))

(assert (= (or b!252300 bm!23754) bm!23755))

(assert (= (or b!252300 bm!23760) bm!23756))

(assert (= (and d!61323 res!123496) b!252289))

(assert (= (and d!61323 c!42509) b!252292))

(assert (= (and d!61323 (not c!42509)) b!252298))

(assert (= (and d!61323 res!123494) b!252293))

(assert (= (and b!252293 res!123491) b!252296))

(assert (= (and b!252293 (not res!123499)) b!252285))

(assert (= (and b!252285 res!123493) b!252287))

(assert (= (and b!252293 res!123492) b!252299))

(assert (= (and b!252299 c!42511) b!252281))

(assert (= (and b!252299 (not c!42511)) b!252286))

(assert (= (and b!252281 res!123498) b!252282))

(assert (= (or b!252281 b!252286) bm!23757))

(assert (= (and b!252299 res!123495) b!252301))

(assert (= (and b!252301 c!42506) b!252288))

(assert (= (and b!252301 (not c!42506)) b!252284))

(assert (= (and b!252288 res!123497) b!252291))

(assert (= (or b!252288 b!252284) bm!23759))

(declare-fun b_lambda!8115 () Bool)

(assert (=> (not b_lambda!8115) (not b!252287)))

(declare-fun t!8780 () Bool)

(declare-fun tb!2999 () Bool)

(assert (=> (and b!252062 (= (defaultEntry!4657 thiss!1504) (defaultEntry!4657 thiss!1504)) t!8780) tb!2999))

(declare-fun result!5319 () Bool)

(assert (=> tb!2999 (= result!5319 tp_is_empty!6507)))

(assert (=> b!252287 t!8780))

(declare-fun b_and!13683 () Bool)

(assert (= b_and!13679 (and (=> t!8780 result!5319) b_and!13683)))

(declare-fun m!268453 () Bool)

(assert (=> b!252291 m!268453))

(declare-fun m!268455 () Bool)

(assert (=> b!252292 m!268455))

(declare-fun m!268457 () Bool)

(assert (=> b!252292 m!268457))

(assert (=> b!252292 m!268455))

(declare-fun m!268459 () Bool)

(assert (=> b!252292 m!268459))

(declare-fun m!268461 () Bool)

(assert (=> b!252292 m!268461))

(declare-fun m!268463 () Bool)

(assert (=> b!252292 m!268463))

(declare-fun m!268465 () Bool)

(assert (=> b!252292 m!268465))

(declare-fun m!268467 () Bool)

(assert (=> b!252292 m!268467))

(declare-fun m!268469 () Bool)

(assert (=> b!252292 m!268469))

(declare-fun m!268471 () Bool)

(assert (=> b!252292 m!268471))

(assert (=> b!252292 m!268379))

(declare-fun m!268473 () Bool)

(assert (=> b!252292 m!268473))

(declare-fun m!268475 () Bool)

(assert (=> b!252292 m!268475))

(assert (=> b!252292 m!268467))

(declare-fun m!268477 () Bool)

(assert (=> b!252292 m!268477))

(declare-fun m!268479 () Bool)

(assert (=> b!252292 m!268479))

(declare-fun m!268481 () Bool)

(assert (=> b!252292 m!268481))

(assert (=> b!252292 m!268473))

(declare-fun m!268483 () Bool)

(assert (=> b!252292 m!268483))

(assert (=> b!252292 m!268477))

(declare-fun m!268485 () Bool)

(assert (=> b!252292 m!268485))

(assert (=> b!252289 m!268379))

(assert (=> b!252289 m!268379))

(assert (=> b!252289 m!268425))

(assert (=> b!252296 m!268379))

(assert (=> b!252296 m!268379))

(assert (=> b!252296 m!268425))

(declare-fun m!268487 () Bool)

(assert (=> b!252287 m!268487))

(assert (=> b!252287 m!268379))

(declare-fun m!268489 () Bool)

(assert (=> b!252287 m!268489))

(assert (=> b!252287 m!268487))

(declare-fun m!268491 () Bool)

(assert (=> b!252287 m!268491))

(declare-fun m!268493 () Bool)

(assert (=> b!252287 m!268493))

(assert (=> b!252287 m!268491))

(assert (=> b!252287 m!268379))

(assert (=> bm!23755 m!268461))

(declare-fun m!268495 () Bool)

(assert (=> bm!23757 m!268495))

(declare-fun m!268497 () Bool)

(assert (=> b!252282 m!268497))

(assert (=> b!252285 m!268379))

(assert (=> b!252285 m!268379))

(declare-fun m!268499 () Bool)

(assert (=> b!252285 m!268499))

(declare-fun m!268501 () Bool)

(assert (=> b!252300 m!268501))

(declare-fun m!268503 () Bool)

(assert (=> bm!23756 m!268503))

(assert (=> d!61323 m!268289))

(declare-fun m!268505 () Bool)

(assert (=> bm!23759 m!268505))

(assert (=> b!252051 d!61323))

(declare-fun b!252304 () Bool)

(declare-fun e!163615 () Bool)

(declare-fun call!23764 () Bool)

(assert (=> b!252304 (= e!163615 call!23764)))

(declare-fun b!252305 () Bool)

(declare-fun e!163614 () Bool)

(assert (=> b!252305 (= e!163614 e!163615)))

(declare-fun lt!126486 () (_ BitVec 64))

(assert (=> b!252305 (= lt!126486 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126487 () Unit!7799)

(assert (=> b!252305 (= lt!126487 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6803 thiss!1504) lt!126486 #b00000000000000000000000000000000))))

(assert (=> b!252305 (arrayContainsKey!0 (_keys!6803 thiss!1504) lt!126486 #b00000000000000000000000000000000)))

(declare-fun lt!126488 () Unit!7799)

(assert (=> b!252305 (= lt!126488 lt!126487)))

(declare-fun res!123501 () Bool)

(assert (=> b!252305 (= res!123501 (= (seekEntryOrOpen!0 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000) (_keys!6803 thiss!1504) (mask!10869 thiss!1504)) (Found!1130 #b00000000000000000000000000000000)))))

(assert (=> b!252305 (=> (not res!123501) (not e!163615))))

(declare-fun d!61325 () Bool)

(declare-fun res!123500 () Bool)

(declare-fun e!163613 () Bool)

(assert (=> d!61325 (=> res!123500 e!163613)))

(assert (=> d!61325 (= res!123500 (bvsge #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))))))

(assert (=> d!61325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)) e!163613)))

(declare-fun b!252306 () Bool)

(assert (=> b!252306 (= e!163613 e!163614)))

(declare-fun c!42512 () Bool)

(assert (=> b!252306 (= c!42512 (validKeyInArray!0 (select (arr!5849 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252307 () Bool)

(assert (=> b!252307 (= e!163614 call!23764)))

(declare-fun bm!23761 () Bool)

(assert (=> bm!23761 (= call!23764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(assert (= (and d!61325 (not res!123500)) b!252306))

(assert (= (and b!252306 c!42512) b!252305))

(assert (= (and b!252306 (not c!42512)) b!252307))

(assert (= (and b!252305 res!123501) b!252304))

(assert (= (or b!252304 b!252307) bm!23761))

(assert (=> b!252305 m!268379))

(declare-fun m!268507 () Bool)

(assert (=> b!252305 m!268507))

(declare-fun m!268509 () Bool)

(assert (=> b!252305 m!268509))

(assert (=> b!252305 m!268379))

(declare-fun m!268511 () Bool)

(assert (=> b!252305 m!268511))

(assert (=> b!252306 m!268379))

(assert (=> b!252306 m!268379))

(assert (=> b!252306 m!268425))

(declare-fun m!268513 () Bool)

(assert (=> bm!23761 m!268513))

(assert (=> b!252070 d!61325))

(declare-fun d!61327 () Bool)

(declare-fun res!123508 () Bool)

(declare-fun e!163618 () Bool)

(assert (=> d!61327 (=> (not res!123508) (not e!163618))))

(declare-fun simpleValid!266 (LongMapFixedSize!3720) Bool)

(assert (=> d!61327 (= res!123508 (simpleValid!266 thiss!1504))))

(assert (=> d!61327 (= (valid!1455 thiss!1504) e!163618)))

(declare-fun b!252314 () Bool)

(declare-fun res!123509 () Bool)

(assert (=> b!252314 (=> (not res!123509) (not e!163618))))

(assert (=> b!252314 (= res!123509 (= (arrayCountValidKeys!0 (_keys!6803 thiss!1504) #b00000000000000000000000000000000 (size!6196 (_keys!6803 thiss!1504))) (_size!1909 thiss!1504)))))

(declare-fun b!252315 () Bool)

(declare-fun res!123510 () Bool)

(assert (=> b!252315 (=> (not res!123510) (not e!163618))))

(assert (=> b!252315 (= res!123510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun b!252316 () Bool)

(assert (=> b!252316 (= e!163618 (arrayNoDuplicates!0 (_keys!6803 thiss!1504) #b00000000000000000000000000000000 Nil!3734))))

(assert (= (and d!61327 res!123508) b!252314))

(assert (= (and b!252314 res!123509) b!252315))

(assert (= (and b!252315 res!123510) b!252316))

(declare-fun m!268515 () Bool)

(assert (=> d!61327 m!268515))

(assert (=> b!252314 m!268303))

(assert (=> b!252315 m!268279))

(declare-fun m!268517 () Bool)

(assert (=> b!252316 m!268517))

(assert (=> start!24098 d!61327))

(declare-fun d!61329 () Bool)

(assert (=> d!61329 (= (array_inv!3865 (_keys!6803 thiss!1504)) (bvsge (size!6196 (_keys!6803 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252062 d!61329))

(declare-fun d!61331 () Bool)

(assert (=> d!61331 (= (array_inv!3866 (_values!4640 thiss!1504)) (bvsge (size!6195 (_values!4640 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252062 d!61331))

(declare-fun b!252333 () Bool)

(declare-fun e!163629 () Bool)

(declare-fun call!23770 () Bool)

(assert (=> b!252333 (= e!163629 (not call!23770))))

(declare-fun b!252334 () Bool)

(declare-fun lt!126494 () SeekEntryResult!1130)

(assert (=> b!252334 (and (bvsge (index!6690 lt!126494) #b00000000000000000000000000000000) (bvslt (index!6690 lt!126494) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun res!123520 () Bool)

(assert (=> b!252334 (= res!123520 (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6690 lt!126494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252334 (=> (not res!123520) (not e!163629))))

(declare-fun d!61333 () Bool)

(declare-fun e!163627 () Bool)

(assert (=> d!61333 e!163627))

(declare-fun c!42517 () Bool)

(assert (=> d!61333 (= c!42517 ((_ is MissingZero!1130) lt!126494))))

(assert (=> d!61333 (= lt!126494 (seekEntryOrOpen!0 key!932 (_keys!6803 thiss!1504) (mask!10869 thiss!1504)))))

(declare-fun lt!126493 () Unit!7799)

(declare-fun choose!1202 (array!12339 array!12337 (_ BitVec 32) (_ BitVec 32) V!8323 V!8323 (_ BitVec 64) Int) Unit!7799)

(assert (=> d!61333 (= lt!126493 (choose!1202 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)))))

(assert (=> d!61333 (validMask!0 (mask!10869 thiss!1504))))

(assert (=> d!61333 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!408 (_keys!6803 thiss!1504) (_values!4640 thiss!1504) (mask!10869 thiss!1504) (extraKeys!4394 thiss!1504) (zeroValue!4498 thiss!1504) (minValue!4498 thiss!1504) key!932 (defaultEntry!4657 thiss!1504)) lt!126493)))

(declare-fun bm!23766 () Bool)

(declare-fun call!23769 () Bool)

(assert (=> bm!23766 (= call!23769 (inRange!0 (ite c!42517 (index!6690 lt!126494) (index!6693 lt!126494)) (mask!10869 thiss!1504)))))

(declare-fun b!252335 () Bool)

(declare-fun e!163630 () Bool)

(assert (=> b!252335 (= e!163630 (not call!23770))))

(declare-fun b!252336 () Bool)

(declare-fun e!163628 () Bool)

(assert (=> b!252336 (= e!163627 e!163628)))

(declare-fun c!42518 () Bool)

(assert (=> b!252336 (= c!42518 ((_ is MissingVacant!1130) lt!126494))))

(declare-fun bm!23767 () Bool)

(assert (=> bm!23767 (= call!23770 (arrayContainsKey!0 (_keys!6803 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252337 () Bool)

(declare-fun res!123521 () Bool)

(assert (=> b!252337 (=> (not res!123521) (not e!163630))))

(assert (=> b!252337 (= res!123521 (= (select (arr!5849 (_keys!6803 thiss!1504)) (index!6693 lt!126494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252337 (and (bvsge (index!6693 lt!126494) #b00000000000000000000000000000000) (bvslt (index!6693 lt!126494) (size!6196 (_keys!6803 thiss!1504))))))

(declare-fun b!252338 () Bool)

(assert (=> b!252338 (= e!163627 e!163629)))

(declare-fun res!123519 () Bool)

(assert (=> b!252338 (= res!123519 call!23769)))

(assert (=> b!252338 (=> (not res!123519) (not e!163629))))

(declare-fun b!252339 () Bool)

(declare-fun res!123522 () Bool)

(assert (=> b!252339 (=> (not res!123522) (not e!163630))))

(assert (=> b!252339 (= res!123522 call!23769)))

(assert (=> b!252339 (= e!163628 e!163630)))

(declare-fun b!252340 () Bool)

(assert (=> b!252340 (= e!163628 ((_ is Undefined!1130) lt!126494))))

(assert (= (and d!61333 c!42517) b!252338))

(assert (= (and d!61333 (not c!42517)) b!252336))

(assert (= (and b!252338 res!123519) b!252334))

(assert (= (and b!252334 res!123520) b!252333))

(assert (= (and b!252336 c!42518) b!252339))

(assert (= (and b!252336 (not c!42518)) b!252340))

(assert (= (and b!252339 res!123522) b!252337))

(assert (= (and b!252337 res!123521) b!252335))

(assert (= (or b!252338 b!252339) bm!23766))

(assert (= (or b!252333 b!252335) bm!23767))

(declare-fun m!268519 () Bool)

(assert (=> b!252337 m!268519))

(assert (=> d!61333 m!268327))

(declare-fun m!268521 () Bool)

(assert (=> d!61333 m!268521))

(assert (=> d!61333 m!268289))

(declare-fun m!268523 () Bool)

(assert (=> b!252334 m!268523))

(declare-fun m!268525 () Bool)

(assert (=> bm!23766 m!268525))

(assert (=> bm!23767 m!268287))

(assert (=> b!252061 d!61333))

(declare-fun mapIsEmpty!11070 () Bool)

(declare-fun mapRes!11070 () Bool)

(assert (=> mapIsEmpty!11070 mapRes!11070))

(declare-fun b!252347 () Bool)

(declare-fun e!163636 () Bool)

(assert (=> b!252347 (= e!163636 tp_is_empty!6507)))

(declare-fun condMapEmpty!11070 () Bool)

(declare-fun mapDefault!11070 () ValueCell!2910)

(assert (=> mapNonEmpty!11064 (= condMapEmpty!11070 (= mapRest!11064 ((as const (Array (_ BitVec 32) ValueCell!2910)) mapDefault!11070)))))

(declare-fun e!163635 () Bool)

(assert (=> mapNonEmpty!11064 (= tp!23211 (and e!163635 mapRes!11070))))

(declare-fun mapNonEmpty!11070 () Bool)

(declare-fun tp!23220 () Bool)

(assert (=> mapNonEmpty!11070 (= mapRes!11070 (and tp!23220 e!163636))))

(declare-fun mapRest!11070 () (Array (_ BitVec 32) ValueCell!2910))

(declare-fun mapKey!11070 () (_ BitVec 32))

(declare-fun mapValue!11070 () ValueCell!2910)

(assert (=> mapNonEmpty!11070 (= mapRest!11064 (store mapRest!11070 mapKey!11070 mapValue!11070))))

(declare-fun b!252348 () Bool)

(assert (=> b!252348 (= e!163635 tp_is_empty!6507)))

(assert (= (and mapNonEmpty!11064 condMapEmpty!11070) mapIsEmpty!11070))

(assert (= (and mapNonEmpty!11064 (not condMapEmpty!11070)) mapNonEmpty!11070))

(assert (= (and mapNonEmpty!11070 ((_ is ValueCellFull!2910) mapValue!11070)) b!252347))

(assert (= (and mapNonEmpty!11064 ((_ is ValueCellFull!2910) mapDefault!11070)) b!252348))

(declare-fun m!268527 () Bool)

(assert (=> mapNonEmpty!11070 m!268527))

(declare-fun b_lambda!8117 () Bool)

(assert (= b_lambda!8115 (or (and b!252062 b_free!6645) b_lambda!8117)))

(check-sat (not bm!23766) (not d!61317) (not b!252221) (not mapNonEmpty!11070) (not d!61299) (not bm!23739) (not d!61295) (not b!252195) (not d!61321) (not b!252300) (not b!252161) (not b!252315) (not d!61323) (not bm!23738) (not b!252236) (not b!252305) (not bm!23759) (not b!252217) (not b!252192) (not b!252180) (not d!61327) (not b!252314) (not b!252287) (not b!252291) (not b!252144) (not bm!23732) (not b!252181) (not d!61301) (not b!252226) (not b!252316) (not b!252238) (not bm!23735) (not bm!23767) (not b!252296) (not b!252292) (not bm!23755) (not b!252167) (not bm!23757) (not bm!23756) (not b!252218) (not b_next!6645) (not b!252289) (not d!61315) (not b!252282) (not b_lambda!8117) (not b!252285) (not b!252205) (not d!61305) (not b!252229) (not b!252193) (not b!252182) (not d!61333) tp_is_empty!6507 (not b!252306) (not bm!23761) b_and!13683)
(check-sat b_and!13683 (not b_next!6645))
