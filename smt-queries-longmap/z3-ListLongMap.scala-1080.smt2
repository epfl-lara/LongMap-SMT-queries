; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22166 () Bool)

(assert start!22166)

(declare-fun b!231401 () Bool)

(declare-fun b_free!6229 () Bool)

(declare-fun b_next!6229 () Bool)

(assert (=> b!231401 (= b_free!6229 (not b_next!6229))))

(declare-fun tp!21829 () Bool)

(declare-fun b_and!13101 () Bool)

(assert (=> b!231401 (= tp!21829 b_and!13101)))

(declare-fun b!231393 () Bool)

(declare-fun res!113687 () Bool)

(declare-datatypes ((V!7769 0))(
  ( (V!7770 (val!3090 Int)) )
))
(declare-datatypes ((ValueCell!2702 0))(
  ( (ValueCellFull!2702 (v!5104 V!7769)) (EmptyCell!2702) )
))
(declare-datatypes ((array!11417 0))(
  ( (array!11418 (arr!5427 (Array (_ BitVec 32) ValueCell!2702)) (size!5761 (_ BitVec 32))) )
))
(declare-datatypes ((array!11419 0))(
  ( (array!11420 (arr!5428 (Array (_ BitVec 32) (_ BitVec 64))) (size!5762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3304 0))(
  ( (LongMapFixedSize!3305 (defaultEntry!4311 Int) (mask!10214 (_ BitVec 32)) (extraKeys!4048 (_ BitVec 32)) (zeroValue!4152 V!7769) (minValue!4152 V!7769) (_size!1701 (_ BitVec 32)) (_keys!6364 array!11419) (_values!4294 array!11417) (_vacant!1701 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3304)

(declare-datatypes ((SeekEntryResult!953 0))(
  ( (MissingZero!953 (index!5982 (_ BitVec 32))) (Found!953 (index!5983 (_ BitVec 32))) (Intermediate!953 (undefined!1765 Bool) (index!5984 (_ BitVec 32)) (x!23508 (_ BitVec 32))) (Undefined!953) (MissingVacant!953 (index!5985 (_ BitVec 32))) )
))
(declare-fun lt!116562 () SeekEntryResult!953)

(assert (=> b!231393 (= res!113687 (= (select (arr!5428 (_keys!6364 thiss!1504)) (index!5985 lt!116562)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150224 () Bool)

(assert (=> b!231393 (=> (not res!113687) (not e!150224))))

(declare-fun b!231394 () Bool)

(declare-fun e!150219 () Bool)

(assert (=> b!231394 (= e!150219 e!150224)))

(declare-fun res!113689 () Bool)

(declare-fun call!21497 () Bool)

(assert (=> b!231394 (= res!113689 call!21497)))

(assert (=> b!231394 (=> (not res!113689) (not e!150224))))

(declare-fun b!231395 () Bool)

(declare-datatypes ((Unit!7096 0))(
  ( (Unit!7097) )
))
(declare-fun e!150221 () Unit!7096)

(declare-fun lt!116561 () Unit!7096)

(assert (=> b!231395 (= e!150221 lt!116561)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!301 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) Int) Unit!7096)

(assert (=> b!231395 (= lt!116561 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!301 (_keys!6364 thiss!1504) (_values!4294 thiss!1504) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 (defaultEntry!4311 thiss!1504)))))

(declare-fun c!38445 () Bool)

(get-info :version)

(assert (=> b!231395 (= c!38445 ((_ is MissingZero!953) lt!116562))))

(declare-fun e!150215 () Bool)

(assert (=> b!231395 e!150215))

(declare-fun b!231396 () Bool)

(declare-fun e!150222 () Bool)

(assert (=> b!231396 (= e!150222 (not true))))

(declare-fun lt!116558 () array!11419)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231396 (= (arrayCountValidKeys!0 lt!116558 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116567 () Unit!7096)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11419 (_ BitVec 32)) Unit!7096)

(assert (=> b!231396 (= lt!116567 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116558 index!297))))

(declare-fun arrayContainsKey!0 (array!11419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231396 (arrayContainsKey!0 lt!116558 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116556 () Unit!7096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11419 (_ BitVec 64) (_ BitVec 32)) Unit!7096)

(assert (=> b!231396 (= lt!116556 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116558 key!932 index!297))))

(declare-fun v!346 () V!7769)

(declare-datatypes ((tuple2!4530 0))(
  ( (tuple2!4531 (_1!2276 (_ BitVec 64)) (_2!2276 V!7769)) )
))
(declare-datatypes ((List!3467 0))(
  ( (Nil!3464) (Cons!3463 (h!4111 tuple2!4530) (t!8417 List!3467)) )
))
(declare-datatypes ((ListLongMap!3433 0))(
  ( (ListLongMap!3434 (toList!1732 List!3467)) )
))
(declare-fun lt!116568 () ListLongMap!3433)

(declare-fun +!617 (ListLongMap!3433 tuple2!4530) ListLongMap!3433)

(declare-fun getCurrentListMap!1241 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 32) Int) ListLongMap!3433)

(assert (=> b!231396 (= (+!617 lt!116568 (tuple2!4531 key!932 v!346)) (getCurrentListMap!1241 lt!116558 (array!11418 (store (arr!5427 (_values!4294 thiss!1504)) index!297 (ValueCellFull!2702 v!346)) (size!5761 (_values!4294 thiss!1504))) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(declare-fun lt!116564 () Unit!7096)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!72 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 32) (_ BitVec 64) V!7769 Int) Unit!7096)

(assert (=> b!231396 (= lt!116564 (lemmaAddValidKeyToArrayThenAddPairToListMap!72 (_keys!6364 thiss!1504) (_values!4294 thiss!1504) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) index!297 key!932 v!346 (defaultEntry!4311 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11419 (_ BitVec 32)) Bool)

(assert (=> b!231396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116558 (mask!10214 thiss!1504))))

(declare-fun lt!116559 () Unit!7096)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11419 (_ BitVec 32) (_ BitVec 32)) Unit!7096)

(assert (=> b!231396 (= lt!116559 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6364 thiss!1504) index!297 (mask!10214 thiss!1504)))))

(assert (=> b!231396 (= (arrayCountValidKeys!0 lt!116558 #b00000000000000000000000000000000 (size!5762 (_keys!6364 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6364 thiss!1504) #b00000000000000000000000000000000 (size!5762 (_keys!6364 thiss!1504)))))))

(declare-fun lt!116557 () Unit!7096)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11419 (_ BitVec 32) (_ BitVec 64)) Unit!7096)

(assert (=> b!231396 (= lt!116557 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6364 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3468 0))(
  ( (Nil!3465) (Cons!3464 (h!4112 (_ BitVec 64)) (t!8418 List!3468)) )
))
(declare-fun arrayNoDuplicates!0 (array!11419 (_ BitVec 32) List!3468) Bool)

(assert (=> b!231396 (arrayNoDuplicates!0 lt!116558 #b00000000000000000000000000000000 Nil!3465)))

(assert (=> b!231396 (= lt!116558 (array!11420 (store (arr!5428 (_keys!6364 thiss!1504)) index!297 key!932) (size!5762 (_keys!6364 thiss!1504))))))

(declare-fun lt!116560 () Unit!7096)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3468) Unit!7096)

(assert (=> b!231396 (= lt!116560 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6364 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3465))))

(declare-fun lt!116565 () Unit!7096)

(declare-fun e!150218 () Unit!7096)

(assert (=> b!231396 (= lt!116565 e!150218)))

(declare-fun c!38443 () Bool)

(assert (=> b!231396 (= c!38443 (arrayContainsKey!0 (_keys!6364 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231397 () Bool)

(declare-fun res!113684 () Bool)

(declare-fun e!150214 () Bool)

(assert (=> b!231397 (=> (not res!113684) (not e!150214))))

(assert (=> b!231397 (= res!113684 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231398 () Bool)

(declare-fun res!113686 () Bool)

(declare-fun e!150213 () Bool)

(assert (=> b!231398 (=> (not res!113686) (not e!150213))))

(assert (=> b!231398 (= res!113686 call!21497)))

(assert (=> b!231398 (= e!150215 e!150213)))

(declare-fun bm!21494 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21494 (= call!21497 (inRange!0 (ite c!38445 (index!5982 lt!116562) (index!5985 lt!116562)) (mask!10214 thiss!1504)))))

(declare-fun mapNonEmpty!10306 () Bool)

(declare-fun mapRes!10306 () Bool)

(declare-fun tp!21828 () Bool)

(declare-fun e!150217 () Bool)

(assert (=> mapNonEmpty!10306 (= mapRes!10306 (and tp!21828 e!150217))))

(declare-fun mapKey!10306 () (_ BitVec 32))

(declare-fun mapValue!10306 () ValueCell!2702)

(declare-fun mapRest!10306 () (Array (_ BitVec 32) ValueCell!2702))

(assert (=> mapNonEmpty!10306 (= (arr!5427 (_values!4294 thiss!1504)) (store mapRest!10306 mapKey!10306 mapValue!10306))))

(declare-fun b!231400 () Bool)

(declare-fun e!150212 () Bool)

(declare-fun tp_is_empty!6091 () Bool)

(assert (=> b!231400 (= e!150212 tp_is_empty!6091)))

(declare-fun e!150216 () Bool)

(declare-fun e!150223 () Bool)

(declare-fun array_inv!3583 (array!11419) Bool)

(declare-fun array_inv!3584 (array!11417) Bool)

(assert (=> b!231401 (= e!150216 (and tp!21829 tp_is_empty!6091 (array_inv!3583 (_keys!6364 thiss!1504)) (array_inv!3584 (_values!4294 thiss!1504)) e!150223))))

(declare-fun b!231402 () Bool)

(assert (=> b!231402 (= e!150219 ((_ is Undefined!953) lt!116562))))

(declare-fun b!231403 () Bool)

(declare-fun res!113683 () Bool)

(assert (=> b!231403 (=> (not res!113683) (not e!150213))))

(assert (=> b!231403 (= res!113683 (= (select (arr!5428 (_keys!6364 thiss!1504)) (index!5982 lt!116562)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231404 () Bool)

(assert (=> b!231404 (= e!150217 tp_is_empty!6091)))

(declare-fun b!231405 () Bool)

(declare-fun e!150220 () Bool)

(assert (=> b!231405 (= e!150220 e!150222)))

(declare-fun res!113685 () Bool)

(assert (=> b!231405 (=> (not res!113685) (not e!150222))))

(assert (=> b!231405 (= res!113685 (inRange!0 index!297 (mask!10214 thiss!1504)))))

(declare-fun lt!116566 () Unit!7096)

(assert (=> b!231405 (= lt!116566 e!150221)))

(declare-fun c!38444 () Bool)

(declare-fun contains!1605 (ListLongMap!3433 (_ BitVec 64)) Bool)

(assert (=> b!231405 (= c!38444 (contains!1605 lt!116568 key!932))))

(assert (=> b!231405 (= lt!116568 (getCurrentListMap!1241 (_keys!6364 thiss!1504) (_values!4294 thiss!1504) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(declare-fun bm!21495 () Bool)

(declare-fun call!21498 () Bool)

(assert (=> bm!21495 (= call!21498 (arrayContainsKey!0 (_keys!6364 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231406 () Bool)

(assert (=> b!231406 (= e!150223 (and e!150212 mapRes!10306))))

(declare-fun condMapEmpty!10306 () Bool)

(declare-fun mapDefault!10306 () ValueCell!2702)

(assert (=> b!231406 (= condMapEmpty!10306 (= (arr!5427 (_values!4294 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2702)) mapDefault!10306)))))

(declare-fun b!231407 () Bool)

(assert (=> b!231407 (= e!150224 (not call!21498))))

(declare-fun b!231399 () Bool)

(assert (=> b!231399 (= e!150214 e!150220)))

(declare-fun res!113690 () Bool)

(assert (=> b!231399 (=> (not res!113690) (not e!150220))))

(assert (=> b!231399 (= res!113690 (or (= lt!116562 (MissingZero!953 index!297)) (= lt!116562 (MissingVacant!953 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11419 (_ BitVec 32)) SeekEntryResult!953)

(assert (=> b!231399 (= lt!116562 (seekEntryOrOpen!0 key!932 (_keys!6364 thiss!1504) (mask!10214 thiss!1504)))))

(declare-fun res!113688 () Bool)

(assert (=> start!22166 (=> (not res!113688) (not e!150214))))

(declare-fun valid!1326 (LongMapFixedSize!3304) Bool)

(assert (=> start!22166 (= res!113688 (valid!1326 thiss!1504))))

(assert (=> start!22166 e!150214))

(assert (=> start!22166 e!150216))

(assert (=> start!22166 true))

(assert (=> start!22166 tp_is_empty!6091))

(declare-fun mapIsEmpty!10306 () Bool)

(assert (=> mapIsEmpty!10306 mapRes!10306))

(declare-fun b!231408 () Bool)

(declare-fun Unit!7098 () Unit!7096)

(assert (=> b!231408 (= e!150218 Unit!7098)))

(declare-fun b!231409 () Bool)

(declare-fun Unit!7099 () Unit!7096)

(assert (=> b!231409 (= e!150218 Unit!7099)))

(declare-fun lt!116569 () Unit!7096)

(declare-fun lemmaArrayContainsKeyThenInListMap!144 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) (_ BitVec 32) Int) Unit!7096)

(assert (=> b!231409 (= lt!116569 (lemmaArrayContainsKeyThenInListMap!144 (_keys!6364 thiss!1504) (_values!4294 thiss!1504) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4311 thiss!1504)))))

(assert (=> b!231409 false))

(declare-fun b!231410 () Bool)

(declare-fun c!38446 () Bool)

(assert (=> b!231410 (= c!38446 ((_ is MissingVacant!953) lt!116562))))

(assert (=> b!231410 (= e!150215 e!150219)))

(declare-fun b!231411 () Bool)

(declare-fun Unit!7100 () Unit!7096)

(assert (=> b!231411 (= e!150221 Unit!7100)))

(declare-fun lt!116563 () Unit!7096)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!303 (array!11419 array!11417 (_ BitVec 32) (_ BitVec 32) V!7769 V!7769 (_ BitVec 64) Int) Unit!7096)

(assert (=> b!231411 (= lt!116563 (lemmaInListMapThenSeekEntryOrOpenFindsIt!303 (_keys!6364 thiss!1504) (_values!4294 thiss!1504) (mask!10214 thiss!1504) (extraKeys!4048 thiss!1504) (zeroValue!4152 thiss!1504) (minValue!4152 thiss!1504) key!932 (defaultEntry!4311 thiss!1504)))))

(assert (=> b!231411 false))

(declare-fun b!231412 () Bool)

(assert (=> b!231412 (= e!150213 (not call!21498))))

(assert (= (and start!22166 res!113688) b!231397))

(assert (= (and b!231397 res!113684) b!231399))

(assert (= (and b!231399 res!113690) b!231405))

(assert (= (and b!231405 c!38444) b!231411))

(assert (= (and b!231405 (not c!38444)) b!231395))

(assert (= (and b!231395 c!38445) b!231398))

(assert (= (and b!231395 (not c!38445)) b!231410))

(assert (= (and b!231398 res!113686) b!231403))

(assert (= (and b!231403 res!113683) b!231412))

(assert (= (and b!231410 c!38446) b!231394))

(assert (= (and b!231410 (not c!38446)) b!231402))

(assert (= (and b!231394 res!113689) b!231393))

(assert (= (and b!231393 res!113687) b!231407))

(assert (= (or b!231398 b!231394) bm!21494))

(assert (= (or b!231412 b!231407) bm!21495))

(assert (= (and b!231405 res!113685) b!231396))

(assert (= (and b!231396 c!38443) b!231409))

(assert (= (and b!231396 (not c!38443)) b!231408))

(assert (= (and b!231406 condMapEmpty!10306) mapIsEmpty!10306))

(assert (= (and b!231406 (not condMapEmpty!10306)) mapNonEmpty!10306))

(assert (= (and mapNonEmpty!10306 ((_ is ValueCellFull!2702) mapValue!10306)) b!231404))

(assert (= (and b!231406 ((_ is ValueCellFull!2702) mapDefault!10306)) b!231400))

(assert (= b!231401 b!231406))

(assert (= start!22166 b!231401))

(declare-fun m!252319 () Bool)

(assert (=> b!231405 m!252319))

(declare-fun m!252321 () Bool)

(assert (=> b!231405 m!252321))

(declare-fun m!252323 () Bool)

(assert (=> b!231405 m!252323))

(declare-fun m!252325 () Bool)

(assert (=> b!231395 m!252325))

(declare-fun m!252327 () Bool)

(assert (=> b!231411 m!252327))

(declare-fun m!252329 () Bool)

(assert (=> b!231409 m!252329))

(declare-fun m!252331 () Bool)

(assert (=> mapNonEmpty!10306 m!252331))

(declare-fun m!252333 () Bool)

(assert (=> b!231399 m!252333))

(declare-fun m!252335 () Bool)

(assert (=> b!231403 m!252335))

(declare-fun m!252337 () Bool)

(assert (=> b!231393 m!252337))

(declare-fun m!252339 () Bool)

(assert (=> b!231401 m!252339))

(declare-fun m!252341 () Bool)

(assert (=> b!231401 m!252341))

(declare-fun m!252343 () Bool)

(assert (=> start!22166 m!252343))

(declare-fun m!252345 () Bool)

(assert (=> bm!21495 m!252345))

(assert (=> b!231396 m!252345))

(declare-fun m!252347 () Bool)

(assert (=> b!231396 m!252347))

(declare-fun m!252349 () Bool)

(assert (=> b!231396 m!252349))

(declare-fun m!252351 () Bool)

(assert (=> b!231396 m!252351))

(declare-fun m!252353 () Bool)

(assert (=> b!231396 m!252353))

(declare-fun m!252355 () Bool)

(assert (=> b!231396 m!252355))

(declare-fun m!252357 () Bool)

(assert (=> b!231396 m!252357))

(declare-fun m!252359 () Bool)

(assert (=> b!231396 m!252359))

(declare-fun m!252361 () Bool)

(assert (=> b!231396 m!252361))

(declare-fun m!252363 () Bool)

(assert (=> b!231396 m!252363))

(declare-fun m!252365 () Bool)

(assert (=> b!231396 m!252365))

(declare-fun m!252367 () Bool)

(assert (=> b!231396 m!252367))

(declare-fun m!252369 () Bool)

(assert (=> b!231396 m!252369))

(declare-fun m!252371 () Bool)

(assert (=> b!231396 m!252371))

(declare-fun m!252373 () Bool)

(assert (=> b!231396 m!252373))

(declare-fun m!252375 () Bool)

(assert (=> b!231396 m!252375))

(declare-fun m!252377 () Bool)

(assert (=> b!231396 m!252377))

(declare-fun m!252379 () Bool)

(assert (=> bm!21494 m!252379))

(check-sat (not start!22166) (not bm!21494) (not b!231409) (not b!231396) (not b!231405) (not b_next!6229) tp_is_empty!6091 (not b!231411) (not b!231401) (not b!231399) (not b!231395) (not bm!21495) (not mapNonEmpty!10306) b_and!13101)
(check-sat b_and!13101 (not b_next!6229))
