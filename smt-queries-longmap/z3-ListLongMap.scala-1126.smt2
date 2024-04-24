; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23118 () Bool)

(assert start!23118)

(declare-fun b!242351 () Bool)

(declare-fun b_free!6505 () Bool)

(declare-fun b_next!6505 () Bool)

(assert (=> b!242351 (= b_free!6505 (not b_next!6505))))

(declare-fun tp!22729 () Bool)

(declare-fun b_and!13495 () Bool)

(assert (=> b!242351 (= tp!22729 b_and!13495)))

(declare-datatypes ((SeekEntryResult!1031 0))(
  ( (MissingZero!1031 (index!6294 (_ BitVec 32))) (Found!1031 (index!6295 (_ BitVec 32))) (Intermediate!1031 (undefined!1843 Bool) (index!6296 (_ BitVec 32)) (x!24237 (_ BitVec 32))) (Undefined!1031) (MissingVacant!1031 (index!6297 (_ BitVec 32))) )
))
(declare-fun lt!121790 () SeekEntryResult!1031)

(declare-datatypes ((V!8137 0))(
  ( (V!8138 (val!3228 Int)) )
))
(declare-datatypes ((ValueCell!2840 0))(
  ( (ValueCellFull!2840 (v!5270 V!8137)) (EmptyCell!2840) )
))
(declare-datatypes ((array!12017 0))(
  ( (array!12018 (arr!5707 (Array (_ BitVec 32) ValueCell!2840)) (size!6049 (_ BitVec 32))) )
))
(declare-datatypes ((array!12019 0))(
  ( (array!12020 (arr!5708 (Array (_ BitVec 32) (_ BitVec 64))) (size!6050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3580 0))(
  ( (LongMapFixedSize!3581 (defaultEntry!4491 Int) (mask!10572 (_ BitVec 32)) (extraKeys!4228 (_ BitVec 32)) (zeroValue!4332 V!8137) (minValue!4332 V!8137) (_size!1839 (_ BitVec 32)) (_keys!6599 array!12019) (_values!4474 array!12017) (_vacant!1839 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3580)

(declare-fun call!22563 () Bool)

(declare-fun bm!22559 () Bool)

(declare-fun c!40447 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22559 (= call!22563 (inRange!0 (ite c!40447 (index!6294 lt!121790) (index!6297 lt!121790)) (mask!10572 thiss!1504)))))

(declare-fun mapNonEmpty!10792 () Bool)

(declare-fun mapRes!10792 () Bool)

(declare-fun tp!22728 () Bool)

(declare-fun e!157290 () Bool)

(assert (=> mapNonEmpty!10792 (= mapRes!10792 (and tp!22728 e!157290))))

(declare-fun mapKey!10792 () (_ BitVec 32))

(declare-fun mapValue!10792 () ValueCell!2840)

(declare-fun mapRest!10792 () (Array (_ BitVec 32) ValueCell!2840))

(assert (=> mapNonEmpty!10792 (= (arr!5707 (_values!4474 thiss!1504)) (store mapRest!10792 mapKey!10792 mapValue!10792))))

(declare-fun e!157286 () Bool)

(declare-fun e!157282 () Bool)

(declare-fun tp_is_empty!6367 () Bool)

(declare-fun array_inv!3751 (array!12019) Bool)

(declare-fun array_inv!3752 (array!12017) Bool)

(assert (=> b!242351 (= e!157282 (and tp!22729 tp_is_empty!6367 (array_inv!3751 (_keys!6599 thiss!1504)) (array_inv!3752 (_values!4474 thiss!1504)) e!157286))))

(declare-fun b!242352 () Bool)

(declare-fun e!157288 () Bool)

(declare-fun e!157283 () Bool)

(assert (=> b!242352 (= e!157288 e!157283)))

(declare-fun res!118755 () Bool)

(assert (=> b!242352 (=> res!118755 e!157283)))

(declare-datatypes ((List!3555 0))(
  ( (Nil!3552) (Cons!3551 (h!4208 (_ BitVec 64)) (t!8548 List!3555)) )
))
(declare-fun contains!1721 (List!3555 (_ BitVec 64)) Bool)

(assert (=> b!242352 (= res!118755 (contains!1721 Nil!3552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242353 () Bool)

(declare-fun e!157280 () Bool)

(declare-fun call!22562 () Bool)

(assert (=> b!242353 (= e!157280 (not call!22562))))

(declare-fun b!242354 () Bool)

(declare-datatypes ((Unit!7450 0))(
  ( (Unit!7451) )
))
(declare-fun e!157281 () Unit!7450)

(declare-fun Unit!7452 () Unit!7450)

(assert (=> b!242354 (= e!157281 Unit!7452)))

(declare-fun lt!121793 () Unit!7450)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!170 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) (_ BitVec 32) Int) Unit!7450)

(assert (=> b!242354 (= lt!121793 (lemmaArrayContainsKeyThenInListMap!170 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(assert (=> b!242354 false))

(declare-fun b!242355 () Bool)

(declare-fun res!118749 () Bool)

(assert (=> b!242355 (=> (not res!118749) (not e!157288))))

(declare-fun noDuplicate!88 (List!3555) Bool)

(assert (=> b!242355 (= res!118749 (noDuplicate!88 Nil!3552))))

(declare-fun b!242356 () Bool)

(declare-fun c!40444 () Bool)

(get-info :version)

(assert (=> b!242356 (= c!40444 ((_ is MissingVacant!1031) lt!121790))))

(declare-fun e!157291 () Bool)

(declare-fun e!157289 () Bool)

(assert (=> b!242356 (= e!157291 e!157289)))

(declare-fun b!242357 () Bool)

(declare-fun e!157292 () Bool)

(assert (=> b!242357 (= e!157286 (and e!157292 mapRes!10792))))

(declare-fun condMapEmpty!10792 () Bool)

(declare-fun mapDefault!10792 () ValueCell!2840)

(assert (=> b!242357 (= condMapEmpty!10792 (= (arr!5707 (_values!4474 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2840)) mapDefault!10792)))))

(declare-fun b!242358 () Bool)

(declare-fun res!118745 () Bool)

(assert (=> b!242358 (= res!118745 (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6297 lt!121790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242358 (=> (not res!118745) (not e!157280))))

(declare-fun mapIsEmpty!10792 () Bool)

(assert (=> mapIsEmpty!10792 mapRes!10792))

(declare-fun b!242359 () Bool)

(declare-fun res!118754 () Bool)

(declare-fun e!157293 () Bool)

(assert (=> b!242359 (=> (not res!118754) (not e!157293))))

(assert (=> b!242359 (= res!118754 call!22563)))

(assert (=> b!242359 (= e!157291 e!157293)))

(declare-fun b!242360 () Bool)

(declare-fun e!157284 () Unit!7450)

(declare-fun Unit!7453 () Unit!7450)

(assert (=> b!242360 (= e!157284 Unit!7453)))

(declare-fun lt!121795 () Unit!7450)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7450)

(assert (=> b!242360 (= lt!121795 (lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> b!242360 false))

(declare-fun b!242350 () Bool)

(declare-fun lt!121794 () Unit!7450)

(assert (=> b!242350 (= e!157284 lt!121794)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7450)

(assert (=> b!242350 (= lt!121794 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> b!242350 (= c!40447 ((_ is MissingZero!1031) lt!121790))))

(assert (=> b!242350 e!157291))

(declare-fun res!118748 () Bool)

(declare-fun e!157287 () Bool)

(assert (=> start!23118 (=> (not res!118748) (not e!157287))))

(declare-fun valid!1417 (LongMapFixedSize!3580) Bool)

(assert (=> start!23118 (= res!118748 (valid!1417 thiss!1504))))

(assert (=> start!23118 e!157287))

(assert (=> start!23118 e!157282))

(assert (=> start!23118 true))

(declare-fun b!242361 () Bool)

(declare-fun e!157285 () Bool)

(declare-fun e!157279 () Bool)

(assert (=> b!242361 (= e!157285 e!157279)))

(declare-fun res!118752 () Bool)

(assert (=> b!242361 (=> (not res!118752) (not e!157279))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242361 (= res!118752 (inRange!0 index!297 (mask!10572 thiss!1504)))))

(declare-fun lt!121791 () Unit!7450)

(assert (=> b!242361 (= lt!121791 e!157284)))

(declare-fun c!40445 () Bool)

(declare-datatypes ((tuple2!4686 0))(
  ( (tuple2!4687 (_1!2354 (_ BitVec 64)) (_2!2354 V!8137)) )
))
(declare-datatypes ((List!3556 0))(
  ( (Nil!3553) (Cons!3552 (h!4209 tuple2!4686) (t!8549 List!3556)) )
))
(declare-datatypes ((ListLongMap!3601 0))(
  ( (ListLongMap!3602 (toList!1816 List!3556)) )
))
(declare-fun contains!1722 (ListLongMap!3601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1348 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 32) Int) ListLongMap!3601)

(assert (=> b!242361 (= c!40445 (contains!1722 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932))))

(declare-fun b!242362 () Bool)

(assert (=> b!242362 (= e!157279 e!157288)))

(declare-fun res!118746 () Bool)

(assert (=> b!242362 (=> (not res!118746) (not e!157288))))

(assert (=> b!242362 (= res!118746 (and (bvslt (size!6050 (_keys!6599 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504)))))))

(declare-fun lt!121792 () Unit!7450)

(assert (=> b!242362 (= lt!121792 e!157281)))

(declare-fun c!40446 () Bool)

(declare-fun arrayContainsKey!0 (array!12019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!242362 (= c!40446 (arrayContainsKey!0 (_keys!6599 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242363 () Bool)

(assert (=> b!242363 (= e!157283 (contains!1721 Nil!3552 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242364 () Bool)

(assert (=> b!242364 (= e!157287 e!157285)))

(declare-fun res!118747 () Bool)

(assert (=> b!242364 (=> (not res!118747) (not e!157285))))

(assert (=> b!242364 (= res!118747 (or (= lt!121790 (MissingZero!1031 index!297)) (= lt!121790 (MissingVacant!1031 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12019 (_ BitVec 32)) SeekEntryResult!1031)

(assert (=> b!242364 (= lt!121790 (seekEntryOrOpen!0 key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(declare-fun b!242365 () Bool)

(assert (=> b!242365 (= e!157293 (not call!22562))))

(declare-fun b!242366 () Bool)

(declare-fun res!118753 () Bool)

(assert (=> b!242366 (=> (not res!118753) (not e!157287))))

(assert (=> b!242366 (= res!118753 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242367 () Bool)

(assert (=> b!242367 (= e!157292 tp_is_empty!6367)))

(declare-fun b!242368 () Bool)

(assert (=> b!242368 (= e!157289 ((_ is Undefined!1031) lt!121790))))

(declare-fun b!242369 () Bool)

(assert (=> b!242369 (= e!157290 tp_is_empty!6367)))

(declare-fun b!242370 () Bool)

(assert (=> b!242370 (= e!157289 e!157280)))

(declare-fun res!118750 () Bool)

(assert (=> b!242370 (= res!118750 call!22563)))

(assert (=> b!242370 (=> (not res!118750) (not e!157280))))

(declare-fun b!242371 () Bool)

(declare-fun res!118751 () Bool)

(assert (=> b!242371 (=> (not res!118751) (not e!157293))))

(assert (=> b!242371 (= res!118751 (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6294 lt!121790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242372 () Bool)

(declare-fun Unit!7454 () Unit!7450)

(assert (=> b!242372 (= e!157281 Unit!7454)))

(declare-fun bm!22560 () Bool)

(assert (=> bm!22560 (= call!22562 (arrayContainsKey!0 (_keys!6599 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23118 res!118748) b!242366))

(assert (= (and b!242366 res!118753) b!242364))

(assert (= (and b!242364 res!118747) b!242361))

(assert (= (and b!242361 c!40445) b!242360))

(assert (= (and b!242361 (not c!40445)) b!242350))

(assert (= (and b!242350 c!40447) b!242359))

(assert (= (and b!242350 (not c!40447)) b!242356))

(assert (= (and b!242359 res!118754) b!242371))

(assert (= (and b!242371 res!118751) b!242365))

(assert (= (and b!242356 c!40444) b!242370))

(assert (= (and b!242356 (not c!40444)) b!242368))

(assert (= (and b!242370 res!118750) b!242358))

(assert (= (and b!242358 res!118745) b!242353))

(assert (= (or b!242359 b!242370) bm!22559))

(assert (= (or b!242365 b!242353) bm!22560))

(assert (= (and b!242361 res!118752) b!242362))

(assert (= (and b!242362 c!40446) b!242354))

(assert (= (and b!242362 (not c!40446)) b!242372))

(assert (= (and b!242362 res!118746) b!242355))

(assert (= (and b!242355 res!118749) b!242352))

(assert (= (and b!242352 (not res!118755)) b!242363))

(assert (= (and b!242357 condMapEmpty!10792) mapIsEmpty!10792))

(assert (= (and b!242357 (not condMapEmpty!10792)) mapNonEmpty!10792))

(assert (= (and mapNonEmpty!10792 ((_ is ValueCellFull!2840) mapValue!10792)) b!242369))

(assert (= (and b!242357 ((_ is ValueCellFull!2840) mapDefault!10792)) b!242367))

(assert (= b!242351 b!242357))

(assert (= start!23118 b!242351))

(declare-fun m!261369 () Bool)

(assert (=> b!242360 m!261369))

(declare-fun m!261371 () Bool)

(assert (=> b!242362 m!261371))

(declare-fun m!261373 () Bool)

(assert (=> b!242364 m!261373))

(declare-fun m!261375 () Bool)

(assert (=> bm!22559 m!261375))

(declare-fun m!261377 () Bool)

(assert (=> b!242361 m!261377))

(declare-fun m!261379 () Bool)

(assert (=> b!242361 m!261379))

(assert (=> b!242361 m!261379))

(declare-fun m!261381 () Bool)

(assert (=> b!242361 m!261381))

(declare-fun m!261383 () Bool)

(assert (=> b!242350 m!261383))

(declare-fun m!261385 () Bool)

(assert (=> b!242363 m!261385))

(declare-fun m!261387 () Bool)

(assert (=> b!242371 m!261387))

(declare-fun m!261389 () Bool)

(assert (=> b!242351 m!261389))

(declare-fun m!261391 () Bool)

(assert (=> b!242351 m!261391))

(declare-fun m!261393 () Bool)

(assert (=> b!242358 m!261393))

(declare-fun m!261395 () Bool)

(assert (=> b!242354 m!261395))

(declare-fun m!261397 () Bool)

(assert (=> b!242355 m!261397))

(declare-fun m!261399 () Bool)

(assert (=> b!242352 m!261399))

(assert (=> bm!22560 m!261371))

(declare-fun m!261401 () Bool)

(assert (=> start!23118 m!261401))

(declare-fun m!261403 () Bool)

(assert (=> mapNonEmpty!10792 m!261403))

(check-sat (not b!242364) (not b!242363) b_and!13495 (not b_next!6505) (not b!242355) (not b!242361) (not b!242352) tp_is_empty!6367 (not b!242354) (not bm!22560) (not mapNonEmpty!10792) (not b!242351) (not b!242360) (not start!23118) (not b!242350) (not b!242362) (not bm!22559))
(check-sat b_and!13495 (not b_next!6505))
(get-model)

(declare-fun d!60041 () Bool)

(declare-fun res!118826 () Bool)

(declare-fun e!157395 () Bool)

(assert (=> d!60041 (=> res!118826 e!157395)))

(assert (=> d!60041 (= res!118826 (= (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60041 (= (arrayContainsKey!0 (_keys!6599 thiss!1504) key!932 #b00000000000000000000000000000000) e!157395)))

(declare-fun b!242515 () Bool)

(declare-fun e!157396 () Bool)

(assert (=> b!242515 (= e!157395 e!157396)))

(declare-fun res!118827 () Bool)

(assert (=> b!242515 (=> (not res!118827) (not e!157396))))

(assert (=> b!242515 (= res!118827 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun b!242516 () Bool)

(assert (=> b!242516 (= e!157396 (arrayContainsKey!0 (_keys!6599 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60041 (not res!118826)) b!242515))

(assert (= (and b!242515 res!118827) b!242516))

(declare-fun m!261477 () Bool)

(assert (=> d!60041 m!261477))

(declare-fun m!261479 () Bool)

(assert (=> b!242516 m!261479))

(assert (=> bm!22560 d!60041))

(declare-fun d!60043 () Bool)

(declare-fun res!118834 () Bool)

(declare-fun e!157399 () Bool)

(assert (=> d!60043 (=> (not res!118834) (not e!157399))))

(declare-fun simpleValid!247 (LongMapFixedSize!3580) Bool)

(assert (=> d!60043 (= res!118834 (simpleValid!247 thiss!1504))))

(assert (=> d!60043 (= (valid!1417 thiss!1504) e!157399)))

(declare-fun b!242523 () Bool)

(declare-fun res!118835 () Bool)

(assert (=> b!242523 (=> (not res!118835) (not e!157399))))

(declare-fun arrayCountValidKeys!0 (array!12019 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242523 (= res!118835 (= (arrayCountValidKeys!0 (_keys!6599 thiss!1504) #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))) (_size!1839 thiss!1504)))))

(declare-fun b!242524 () Bool)

(declare-fun res!118836 () Bool)

(assert (=> b!242524 (=> (not res!118836) (not e!157399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12019 (_ BitVec 32)) Bool)

(assert (=> b!242524 (= res!118836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(declare-fun b!242525 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12019 (_ BitVec 32) List!3555) Bool)

(assert (=> b!242525 (= e!157399 (arrayNoDuplicates!0 (_keys!6599 thiss!1504) #b00000000000000000000000000000000 Nil!3552))))

(assert (= (and d!60043 res!118834) b!242523))

(assert (= (and b!242523 res!118835) b!242524))

(assert (= (and b!242524 res!118836) b!242525))

(declare-fun m!261481 () Bool)

(assert (=> d!60043 m!261481))

(declare-fun m!261483 () Bool)

(assert (=> b!242523 m!261483))

(declare-fun m!261485 () Bool)

(assert (=> b!242524 m!261485))

(declare-fun m!261487 () Bool)

(assert (=> b!242525 m!261487))

(assert (=> start!23118 d!60043))

(assert (=> b!242362 d!60041))

(declare-fun d!60045 () Bool)

(declare-fun lt!121834 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!159 (List!3555) (InoxSet (_ BitVec 64)))

(assert (=> d!60045 (= lt!121834 (select (content!159 Nil!3552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157405 () Bool)

(assert (=> d!60045 (= lt!121834 e!157405)))

(declare-fun res!118841 () Bool)

(assert (=> d!60045 (=> (not res!118841) (not e!157405))))

(assert (=> d!60045 (= res!118841 ((_ is Cons!3551) Nil!3552))))

(assert (=> d!60045 (= (contains!1721 Nil!3552 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121834)))

(declare-fun b!242530 () Bool)

(declare-fun e!157404 () Bool)

(assert (=> b!242530 (= e!157405 e!157404)))

(declare-fun res!118842 () Bool)

(assert (=> b!242530 (=> res!118842 e!157404)))

(assert (=> b!242530 (= res!118842 (= (h!4208 Nil!3552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242531 () Bool)

(assert (=> b!242531 (= e!157404 (contains!1721 (t!8548 Nil!3552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60045 res!118841) b!242530))

(assert (= (and b!242530 (not res!118842)) b!242531))

(declare-fun m!261489 () Bool)

(assert (=> d!60045 m!261489))

(declare-fun m!261491 () Bool)

(assert (=> d!60045 m!261491))

(declare-fun m!261493 () Bool)

(assert (=> b!242531 m!261493))

(assert (=> b!242352 d!60045))

(declare-fun d!60047 () Bool)

(assert (=> d!60047 (= (inRange!0 index!297 (mask!10572 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10572 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242361 d!60047))

(declare-fun d!60049 () Bool)

(declare-fun e!157411 () Bool)

(assert (=> d!60049 e!157411))

(declare-fun res!118845 () Bool)

(assert (=> d!60049 (=> res!118845 e!157411)))

(declare-fun lt!121846 () Bool)

(assert (=> d!60049 (= res!118845 (not lt!121846))))

(declare-fun lt!121844 () Bool)

(assert (=> d!60049 (= lt!121846 lt!121844)))

(declare-fun lt!121843 () Unit!7450)

(declare-fun e!157410 () Unit!7450)

(assert (=> d!60049 (= lt!121843 e!157410)))

(declare-fun c!40474 () Bool)

(assert (=> d!60049 (= c!40474 lt!121844)))

(declare-fun containsKey!274 (List!3556 (_ BitVec 64)) Bool)

(assert (=> d!60049 (= lt!121844 (containsKey!274 (toList!1816 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(assert (=> d!60049 (= (contains!1722 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932) lt!121846)))

(declare-fun b!242538 () Bool)

(declare-fun lt!121845 () Unit!7450)

(assert (=> b!242538 (= e!157410 lt!121845)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!222 (List!3556 (_ BitVec 64)) Unit!7450)

(assert (=> b!242538 (= lt!121845 (lemmaContainsKeyImpliesGetValueByKeyDefined!222 (toList!1816 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(declare-datatypes ((Option!289 0))(
  ( (Some!288 (v!5274 V!8137)) (None!287) )
))
(declare-fun isDefined!223 (Option!289) Bool)

(declare-fun getValueByKey!283 (List!3556 (_ BitVec 64)) Option!289)

(assert (=> b!242538 (isDefined!223 (getValueByKey!283 (toList!1816 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(declare-fun b!242539 () Bool)

(declare-fun Unit!7460 () Unit!7450)

(assert (=> b!242539 (= e!157410 Unit!7460)))

(declare-fun b!242540 () Bool)

(assert (=> b!242540 (= e!157411 (isDefined!223 (getValueByKey!283 (toList!1816 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932)))))

(assert (= (and d!60049 c!40474) b!242538))

(assert (= (and d!60049 (not c!40474)) b!242539))

(assert (= (and d!60049 (not res!118845)) b!242540))

(declare-fun m!261495 () Bool)

(assert (=> d!60049 m!261495))

(declare-fun m!261497 () Bool)

(assert (=> b!242538 m!261497))

(declare-fun m!261499 () Bool)

(assert (=> b!242538 m!261499))

(assert (=> b!242538 m!261499))

(declare-fun m!261501 () Bool)

(assert (=> b!242538 m!261501))

(assert (=> b!242540 m!261499))

(assert (=> b!242540 m!261499))

(assert (=> b!242540 m!261501))

(assert (=> b!242361 d!60049))

(declare-fun bm!22587 () Bool)

(declare-fun call!22595 () ListLongMap!3601)

(declare-fun call!22591 () ListLongMap!3601)

(assert (=> bm!22587 (= call!22595 call!22591)))

(declare-fun b!242583 () Bool)

(declare-fun c!40490 () Bool)

(assert (=> b!242583 (= c!40490 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!157443 () ListLongMap!3601)

(declare-fun e!157438 () ListLongMap!3601)

(assert (=> b!242583 (= e!157443 e!157438)))

(declare-fun b!242584 () Bool)

(declare-fun e!157448 () Bool)

(declare-fun lt!121908 () ListLongMap!3601)

(declare-fun apply!224 (ListLongMap!3601 (_ BitVec 64)) V!8137)

(declare-fun get!2938 (ValueCell!2840 V!8137) V!8137)

(declare-fun dynLambda!567 (Int (_ BitVec 64)) V!8137)

(assert (=> b!242584 (= e!157448 (= (apply!224 lt!121908 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000)) (get!2938 (select (arr!5707 (_values!4474 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!567 (defaultEntry!4491 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6049 (_values!4474 thiss!1504))))))

(assert (=> b!242584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun bm!22588 () Bool)

(declare-fun call!22596 () ListLongMap!3601)

(assert (=> bm!22588 (= call!22596 call!22595)))

(declare-fun d!60051 () Bool)

(declare-fun e!157442 () Bool)

(assert (=> d!60051 e!157442))

(declare-fun res!118866 () Bool)

(assert (=> d!60051 (=> (not res!118866) (not e!157442))))

(assert (=> d!60051 (= res!118866 (or (bvsge #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))))))))

(declare-fun lt!121896 () ListLongMap!3601)

(assert (=> d!60051 (= lt!121908 lt!121896)))

(declare-fun lt!121909 () Unit!7450)

(declare-fun e!157445 () Unit!7450)

(assert (=> d!60051 (= lt!121909 e!157445)))

(declare-fun c!40491 () Bool)

(declare-fun e!157446 () Bool)

(assert (=> d!60051 (= c!40491 e!157446)))

(declare-fun res!118869 () Bool)

(assert (=> d!60051 (=> (not res!118869) (not e!157446))))

(assert (=> d!60051 (= res!118869 (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun e!157444 () ListLongMap!3601)

(assert (=> d!60051 (= lt!121896 e!157444)))

(declare-fun c!40489 () Bool)

(assert (=> d!60051 (= c!40489 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60051 (validMask!0 (mask!10572 thiss!1504))))

(assert (=> d!60051 (= (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) lt!121908)))

(declare-fun b!242585 () Bool)

(declare-fun e!157439 () Bool)

(declare-fun e!157441 () Bool)

(assert (=> b!242585 (= e!157439 e!157441)))

(declare-fun res!118872 () Bool)

(declare-fun call!22593 () Bool)

(assert (=> b!242585 (= res!118872 call!22593)))

(assert (=> b!242585 (=> (not res!118872) (not e!157441))))

(declare-fun b!242586 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242586 (= e!157446 (validKeyInArray!0 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22589 () Bool)

(assert (=> bm!22589 (= call!22593 (contains!1722 lt!121908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242587 () Bool)

(declare-fun call!22594 () ListLongMap!3601)

(assert (=> b!242587 (= e!157438 call!22594)))

(declare-fun b!242588 () Bool)

(declare-fun e!157449 () Bool)

(declare-fun call!22590 () Bool)

(assert (=> b!242588 (= e!157449 (not call!22590))))

(declare-fun bm!22590 () Bool)

(assert (=> bm!22590 (= call!22590 (contains!1722 lt!121908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242589 () Bool)

(declare-fun e!157440 () Bool)

(assert (=> b!242589 (= e!157449 e!157440)))

(declare-fun res!118867 () Bool)

(assert (=> b!242589 (= res!118867 call!22590)))

(assert (=> b!242589 (=> (not res!118867) (not e!157440))))

(declare-fun b!242590 () Bool)

(declare-fun res!118868 () Bool)

(assert (=> b!242590 (=> (not res!118868) (not e!157442))))

(assert (=> b!242590 (= res!118868 e!157439)))

(declare-fun c!40487 () Bool)

(assert (=> b!242590 (= c!40487 (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!242591 () Bool)

(declare-fun call!22592 () ListLongMap!3601)

(declare-fun +!651 (ListLongMap!3601 tuple2!4686) ListLongMap!3601)

(assert (=> b!242591 (= e!157444 (+!651 call!22592 (tuple2!4687 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4332 thiss!1504))))))

(declare-fun b!242592 () Bool)

(declare-fun Unit!7461 () Unit!7450)

(assert (=> b!242592 (= e!157445 Unit!7461)))

(declare-fun b!242593 () Bool)

(declare-fun res!118865 () Bool)

(assert (=> b!242593 (=> (not res!118865) (not e!157442))))

(declare-fun e!157450 () Bool)

(assert (=> b!242593 (= res!118865 e!157450)))

(declare-fun res!118870 () Bool)

(assert (=> b!242593 (=> res!118870 e!157450)))

(declare-fun e!157447 () Bool)

(assert (=> b!242593 (= res!118870 (not e!157447))))

(declare-fun res!118871 () Bool)

(assert (=> b!242593 (=> (not res!118871) (not e!157447))))

(assert (=> b!242593 (= res!118871 (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun bm!22591 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!540 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 32) Int) ListLongMap!3601)

(assert (=> bm!22591 (= call!22591 (getCurrentListMapNoExtraKeys!540 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun b!242594 () Bool)

(assert (=> b!242594 (= e!157441 (= (apply!224 lt!121908 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4332 thiss!1504)))))

(declare-fun b!242595 () Bool)

(assert (=> b!242595 (= e!157447 (validKeyInArray!0 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242596 () Bool)

(declare-fun lt!121910 () Unit!7450)

(assert (=> b!242596 (= e!157445 lt!121910)))

(declare-fun lt!121902 () ListLongMap!3601)

(assert (=> b!242596 (= lt!121902 (getCurrentListMapNoExtraKeys!540 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121899 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121898 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121898 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121912 () Unit!7450)

(declare-fun addStillContains!200 (ListLongMap!3601 (_ BitVec 64) V!8137 (_ BitVec 64)) Unit!7450)

(assert (=> b!242596 (= lt!121912 (addStillContains!200 lt!121902 lt!121899 (zeroValue!4332 thiss!1504) lt!121898))))

(assert (=> b!242596 (contains!1722 (+!651 lt!121902 (tuple2!4687 lt!121899 (zeroValue!4332 thiss!1504))) lt!121898)))

(declare-fun lt!121894 () Unit!7450)

(assert (=> b!242596 (= lt!121894 lt!121912)))

(declare-fun lt!121904 () ListLongMap!3601)

(assert (=> b!242596 (= lt!121904 (getCurrentListMapNoExtraKeys!540 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121892 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121911 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121911 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121897 () Unit!7450)

(declare-fun addApplyDifferent!200 (ListLongMap!3601 (_ BitVec 64) V!8137 (_ BitVec 64)) Unit!7450)

(assert (=> b!242596 (= lt!121897 (addApplyDifferent!200 lt!121904 lt!121892 (minValue!4332 thiss!1504) lt!121911))))

(assert (=> b!242596 (= (apply!224 (+!651 lt!121904 (tuple2!4687 lt!121892 (minValue!4332 thiss!1504))) lt!121911) (apply!224 lt!121904 lt!121911))))

(declare-fun lt!121895 () Unit!7450)

(assert (=> b!242596 (= lt!121895 lt!121897)))

(declare-fun lt!121907 () ListLongMap!3601)

(assert (=> b!242596 (= lt!121907 (getCurrentListMapNoExtraKeys!540 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121903 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121891 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121891 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121900 () Unit!7450)

(assert (=> b!242596 (= lt!121900 (addApplyDifferent!200 lt!121907 lt!121903 (zeroValue!4332 thiss!1504) lt!121891))))

(assert (=> b!242596 (= (apply!224 (+!651 lt!121907 (tuple2!4687 lt!121903 (zeroValue!4332 thiss!1504))) lt!121891) (apply!224 lt!121907 lt!121891))))

(declare-fun lt!121901 () Unit!7450)

(assert (=> b!242596 (= lt!121901 lt!121900)))

(declare-fun lt!121905 () ListLongMap!3601)

(assert (=> b!242596 (= lt!121905 (getCurrentListMapNoExtraKeys!540 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121906 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121893 () (_ BitVec 64))

(assert (=> b!242596 (= lt!121893 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242596 (= lt!121910 (addApplyDifferent!200 lt!121905 lt!121906 (minValue!4332 thiss!1504) lt!121893))))

(assert (=> b!242596 (= (apply!224 (+!651 lt!121905 (tuple2!4687 lt!121906 (minValue!4332 thiss!1504))) lt!121893) (apply!224 lt!121905 lt!121893))))

(declare-fun bm!22592 () Bool)

(assert (=> bm!22592 (= call!22594 call!22592)))

(declare-fun b!242597 () Bool)

(assert (=> b!242597 (= e!157439 (not call!22593))))

(declare-fun b!242598 () Bool)

(assert (=> b!242598 (= e!157444 e!157443)))

(declare-fun c!40492 () Bool)

(assert (=> b!242598 (= c!40492 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242599 () Bool)

(assert (=> b!242599 (= e!157440 (= (apply!224 lt!121908 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4332 thiss!1504)))))

(declare-fun b!242600 () Bool)

(assert (=> b!242600 (= e!157442 e!157449)))

(declare-fun c!40488 () Bool)

(assert (=> b!242600 (= c!40488 (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242601 () Bool)

(assert (=> b!242601 (= e!157438 call!22596)))

(declare-fun bm!22593 () Bool)

(assert (=> bm!22593 (= call!22592 (+!651 (ite c!40489 call!22591 (ite c!40492 call!22595 call!22596)) (ite (or c!40489 c!40492) (tuple2!4687 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4332 thiss!1504)) (tuple2!4687 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4332 thiss!1504)))))))

(declare-fun b!242602 () Bool)

(assert (=> b!242602 (= e!157443 call!22594)))

(declare-fun b!242603 () Bool)

(assert (=> b!242603 (= e!157450 e!157448)))

(declare-fun res!118864 () Bool)

(assert (=> b!242603 (=> (not res!118864) (not e!157448))))

(assert (=> b!242603 (= res!118864 (contains!1722 lt!121908 (select (arr!5708 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6050 (_keys!6599 thiss!1504))))))

(assert (= (and d!60051 c!40489) b!242591))

(assert (= (and d!60051 (not c!40489)) b!242598))

(assert (= (and b!242598 c!40492) b!242602))

(assert (= (and b!242598 (not c!40492)) b!242583))

(assert (= (and b!242583 c!40490) b!242587))

(assert (= (and b!242583 (not c!40490)) b!242601))

(assert (= (or b!242587 b!242601) bm!22588))

(assert (= (or b!242602 bm!22588) bm!22587))

(assert (= (or b!242602 b!242587) bm!22592))

(assert (= (or b!242591 bm!22587) bm!22591))

(assert (= (or b!242591 bm!22592) bm!22593))

(assert (= (and d!60051 res!118869) b!242586))

(assert (= (and d!60051 c!40491) b!242596))

(assert (= (and d!60051 (not c!40491)) b!242592))

(assert (= (and d!60051 res!118866) b!242593))

(assert (= (and b!242593 res!118871) b!242595))

(assert (= (and b!242593 (not res!118870)) b!242603))

(assert (= (and b!242603 res!118864) b!242584))

(assert (= (and b!242593 res!118865) b!242590))

(assert (= (and b!242590 c!40487) b!242585))

(assert (= (and b!242590 (not c!40487)) b!242597))

(assert (= (and b!242585 res!118872) b!242594))

(assert (= (or b!242585 b!242597) bm!22589))

(assert (= (and b!242590 res!118868) b!242600))

(assert (= (and b!242600 c!40488) b!242589))

(assert (= (and b!242600 (not c!40488)) b!242588))

(assert (= (and b!242589 res!118867) b!242599))

(assert (= (or b!242589 b!242588) bm!22590))

(declare-fun b_lambda!8021 () Bool)

(assert (=> (not b_lambda!8021) (not b!242584)))

(declare-fun t!8553 () Bool)

(declare-fun tb!2953 () Bool)

(assert (=> (and b!242351 (= (defaultEntry!4491 thiss!1504) (defaultEntry!4491 thiss!1504)) t!8553) tb!2953))

(declare-fun result!5197 () Bool)

(assert (=> tb!2953 (= result!5197 tp_is_empty!6367)))

(assert (=> b!242584 t!8553))

(declare-fun b_and!13501 () Bool)

(assert (= b_and!13495 (and (=> t!8553 result!5197) b_and!13501)))

(declare-fun m!261503 () Bool)

(assert (=> d!60051 m!261503))

(assert (=> b!242603 m!261477))

(assert (=> b!242603 m!261477))

(declare-fun m!261505 () Bool)

(assert (=> b!242603 m!261505))

(assert (=> b!242595 m!261477))

(assert (=> b!242595 m!261477))

(declare-fun m!261507 () Bool)

(assert (=> b!242595 m!261507))

(declare-fun m!261509 () Bool)

(assert (=> b!242599 m!261509))

(assert (=> b!242586 m!261477))

(assert (=> b!242586 m!261477))

(assert (=> b!242586 m!261507))

(declare-fun m!261511 () Bool)

(assert (=> b!242591 m!261511))

(declare-fun m!261513 () Bool)

(assert (=> b!242596 m!261513))

(declare-fun m!261515 () Bool)

(assert (=> b!242596 m!261515))

(declare-fun m!261517 () Bool)

(assert (=> b!242596 m!261517))

(declare-fun m!261519 () Bool)

(assert (=> b!242596 m!261519))

(declare-fun m!261521 () Bool)

(assert (=> b!242596 m!261521))

(declare-fun m!261523 () Bool)

(assert (=> b!242596 m!261523))

(assert (=> b!242596 m!261521))

(declare-fun m!261525 () Bool)

(assert (=> b!242596 m!261525))

(declare-fun m!261527 () Bool)

(assert (=> b!242596 m!261527))

(declare-fun m!261529 () Bool)

(assert (=> b!242596 m!261529))

(declare-fun m!261531 () Bool)

(assert (=> b!242596 m!261531))

(declare-fun m!261533 () Bool)

(assert (=> b!242596 m!261533))

(declare-fun m!261535 () Bool)

(assert (=> b!242596 m!261535))

(assert (=> b!242596 m!261477))

(assert (=> b!242596 m!261527))

(declare-fun m!261537 () Bool)

(assert (=> b!242596 m!261537))

(assert (=> b!242596 m!261513))

(declare-fun m!261539 () Bool)

(assert (=> b!242596 m!261539))

(declare-fun m!261541 () Bool)

(assert (=> b!242596 m!261541))

(declare-fun m!261543 () Bool)

(assert (=> b!242596 m!261543))

(assert (=> b!242596 m!261515))

(assert (=> b!242584 m!261477))

(declare-fun m!261545 () Bool)

(assert (=> b!242584 m!261545))

(assert (=> b!242584 m!261477))

(declare-fun m!261547 () Bool)

(assert (=> b!242584 m!261547))

(declare-fun m!261549 () Bool)

(assert (=> b!242584 m!261549))

(declare-fun m!261551 () Bool)

(assert (=> b!242584 m!261551))

(assert (=> b!242584 m!261547))

(assert (=> b!242584 m!261549))

(declare-fun m!261553 () Bool)

(assert (=> bm!22589 m!261553))

(assert (=> bm!22591 m!261519))

(declare-fun m!261555 () Bool)

(assert (=> bm!22593 m!261555))

(declare-fun m!261557 () Bool)

(assert (=> bm!22590 m!261557))

(declare-fun m!261559 () Bool)

(assert (=> b!242594 m!261559))

(assert (=> b!242361 d!60051))

(declare-fun d!60053 () Bool)

(assert (=> d!60053 (= (array_inv!3751 (_keys!6599 thiss!1504)) (bvsge (size!6050 (_keys!6599 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242351 d!60053))

(declare-fun d!60055 () Bool)

(assert (=> d!60055 (= (array_inv!3752 (_values!4474 thiss!1504)) (bvsge (size!6049 (_values!4474 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242351 d!60055))

(declare-fun d!60057 () Bool)

(declare-fun e!157453 () Bool)

(assert (=> d!60057 e!157453))

(declare-fun res!118878 () Bool)

(assert (=> d!60057 (=> (not res!118878) (not e!157453))))

(declare-fun lt!121918 () SeekEntryResult!1031)

(assert (=> d!60057 (= res!118878 ((_ is Found!1031) lt!121918))))

(assert (=> d!60057 (= lt!121918 (seekEntryOrOpen!0 key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(declare-fun lt!121917 () Unit!7450)

(declare-fun choose!1135 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7450)

(assert (=> d!60057 (= lt!121917 (choose!1135 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> d!60057 (validMask!0 (mask!10572 thiss!1504))))

(assert (=> d!60057 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)) lt!121917)))

(declare-fun b!242610 () Bool)

(declare-fun res!118877 () Bool)

(assert (=> b!242610 (=> (not res!118877) (not e!157453))))

(assert (=> b!242610 (= res!118877 (inRange!0 (index!6295 lt!121918) (mask!10572 thiss!1504)))))

(declare-fun b!242611 () Bool)

(assert (=> b!242611 (= e!157453 (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6295 lt!121918)) key!932))))

(assert (=> b!242611 (and (bvsge (index!6295 lt!121918) #b00000000000000000000000000000000) (bvslt (index!6295 lt!121918) (size!6050 (_keys!6599 thiss!1504))))))

(assert (= (and d!60057 res!118878) b!242610))

(assert (= (and b!242610 res!118877) b!242611))

(assert (=> d!60057 m!261373))

(declare-fun m!261561 () Bool)

(assert (=> d!60057 m!261561))

(assert (=> d!60057 m!261503))

(declare-fun m!261563 () Bool)

(assert (=> b!242610 m!261563))

(declare-fun m!261565 () Bool)

(assert (=> b!242611 m!261565))

(assert (=> b!242360 d!60057))

(declare-fun b!242628 () Bool)

(declare-fun lt!121924 () SeekEntryResult!1031)

(assert (=> b!242628 (and (bvsge (index!6294 lt!121924) #b00000000000000000000000000000000) (bvslt (index!6294 lt!121924) (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun res!118889 () Bool)

(assert (=> b!242628 (= res!118889 (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6294 lt!121924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157465 () Bool)

(assert (=> b!242628 (=> (not res!118889) (not e!157465))))

(declare-fun b!242629 () Bool)

(declare-fun res!118888 () Bool)

(declare-fun e!157464 () Bool)

(assert (=> b!242629 (=> (not res!118888) (not e!157464))))

(assert (=> b!242629 (= res!118888 (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6297 lt!121924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242629 (and (bvsge (index!6297 lt!121924) #b00000000000000000000000000000000) (bvslt (index!6297 lt!121924) (size!6050 (_keys!6599 thiss!1504))))))

(declare-fun d!60059 () Bool)

(declare-fun e!157463 () Bool)

(assert (=> d!60059 e!157463))

(declare-fun c!40498 () Bool)

(assert (=> d!60059 (= c!40498 ((_ is MissingZero!1031) lt!121924))))

(assert (=> d!60059 (= lt!121924 (seekEntryOrOpen!0 key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(declare-fun lt!121923 () Unit!7450)

(declare-fun choose!1136 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7450)

(assert (=> d!60059 (= lt!121923 (choose!1136 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> d!60059 (validMask!0 (mask!10572 thiss!1504))))

(assert (=> d!60059 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)) lt!121923)))

(declare-fun bm!22598 () Bool)

(declare-fun call!22601 () Bool)

(assert (=> bm!22598 (= call!22601 (inRange!0 (ite c!40498 (index!6294 lt!121924) (index!6297 lt!121924)) (mask!10572 thiss!1504)))))

(declare-fun b!242630 () Bool)

(assert (=> b!242630 (= e!157463 e!157465)))

(declare-fun res!118887 () Bool)

(assert (=> b!242630 (= res!118887 call!22601)))

(assert (=> b!242630 (=> (not res!118887) (not e!157465))))

(declare-fun bm!22599 () Bool)

(declare-fun call!22602 () Bool)

(assert (=> bm!22599 (= call!22602 (arrayContainsKey!0 (_keys!6599 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242631 () Bool)

(assert (=> b!242631 (= e!157465 (not call!22602))))

(declare-fun b!242632 () Bool)

(declare-fun e!157462 () Bool)

(assert (=> b!242632 (= e!157462 ((_ is Undefined!1031) lt!121924))))

(declare-fun b!242633 () Bool)

(assert (=> b!242633 (= e!157464 (not call!22602))))

(declare-fun b!242634 () Bool)

(declare-fun res!118890 () Bool)

(assert (=> b!242634 (=> (not res!118890) (not e!157464))))

(assert (=> b!242634 (= res!118890 call!22601)))

(assert (=> b!242634 (= e!157462 e!157464)))

(declare-fun b!242635 () Bool)

(assert (=> b!242635 (= e!157463 e!157462)))

(declare-fun c!40497 () Bool)

(assert (=> b!242635 (= c!40497 ((_ is MissingVacant!1031) lt!121924))))

(assert (= (and d!60059 c!40498) b!242630))

(assert (= (and d!60059 (not c!40498)) b!242635))

(assert (= (and b!242630 res!118887) b!242628))

(assert (= (and b!242628 res!118889) b!242631))

(assert (= (and b!242635 c!40497) b!242634))

(assert (= (and b!242635 (not c!40497)) b!242632))

(assert (= (and b!242634 res!118890) b!242629))

(assert (= (and b!242629 res!118888) b!242633))

(assert (= (or b!242630 b!242634) bm!22598))

(assert (= (or b!242631 b!242633) bm!22599))

(assert (=> bm!22599 m!261371))

(assert (=> d!60059 m!261373))

(declare-fun m!261567 () Bool)

(assert (=> d!60059 m!261567))

(assert (=> d!60059 m!261503))

(declare-fun m!261569 () Bool)

(assert (=> b!242629 m!261569))

(declare-fun m!261571 () Bool)

(assert (=> b!242628 m!261571))

(declare-fun m!261573 () Bool)

(assert (=> bm!22598 m!261573))

(assert (=> b!242350 d!60059))

(declare-fun d!60061 () Bool)

(assert (=> d!60061 (= (inRange!0 (ite c!40447 (index!6294 lt!121790) (index!6297 lt!121790)) (mask!10572 thiss!1504)) (and (bvsge (ite c!40447 (index!6294 lt!121790) (index!6297 lt!121790)) #b00000000000000000000000000000000) (bvslt (ite c!40447 (index!6294 lt!121790) (index!6297 lt!121790)) (bvadd (mask!10572 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22559 d!60061))

(declare-fun d!60063 () Bool)

(declare-fun res!118895 () Bool)

(declare-fun e!157470 () Bool)

(assert (=> d!60063 (=> res!118895 e!157470)))

(assert (=> d!60063 (= res!118895 ((_ is Nil!3552) Nil!3552))))

(assert (=> d!60063 (= (noDuplicate!88 Nil!3552) e!157470)))

(declare-fun b!242640 () Bool)

(declare-fun e!157471 () Bool)

(assert (=> b!242640 (= e!157470 e!157471)))

(declare-fun res!118896 () Bool)

(assert (=> b!242640 (=> (not res!118896) (not e!157471))))

(assert (=> b!242640 (= res!118896 (not (contains!1721 (t!8548 Nil!3552) (h!4208 Nil!3552))))))

(declare-fun b!242641 () Bool)

(assert (=> b!242641 (= e!157471 (noDuplicate!88 (t!8548 Nil!3552)))))

(assert (= (and d!60063 (not res!118895)) b!242640))

(assert (= (and b!242640 res!118896) b!242641))

(declare-fun m!261575 () Bool)

(assert (=> b!242640 m!261575))

(declare-fun m!261577 () Bool)

(assert (=> b!242641 m!261577))

(assert (=> b!242355 d!60063))

(declare-fun b!242654 () Bool)

(declare-fun e!157479 () SeekEntryResult!1031)

(declare-fun lt!121931 () SeekEntryResult!1031)

(assert (=> b!242654 (= e!157479 (MissingZero!1031 (index!6296 lt!121931)))))

(declare-fun b!242655 () Bool)

(declare-fun c!40505 () Bool)

(declare-fun lt!121932 () (_ BitVec 64))

(assert (=> b!242655 (= c!40505 (= lt!121932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157480 () SeekEntryResult!1031)

(assert (=> b!242655 (= e!157480 e!157479)))

(declare-fun b!242656 () Bool)

(assert (=> b!242656 (= e!157480 (Found!1031 (index!6296 lt!121931)))))

(declare-fun b!242657 () Bool)

(declare-fun e!157478 () SeekEntryResult!1031)

(assert (=> b!242657 (= e!157478 e!157480)))

(assert (=> b!242657 (= lt!121932 (select (arr!5708 (_keys!6599 thiss!1504)) (index!6296 lt!121931)))))

(declare-fun c!40506 () Bool)

(assert (=> b!242657 (= c!40506 (= lt!121932 key!932))))

(declare-fun d!60065 () Bool)

(declare-fun lt!121933 () SeekEntryResult!1031)

(assert (=> d!60065 (and (or ((_ is Undefined!1031) lt!121933) (not ((_ is Found!1031) lt!121933)) (and (bvsge (index!6295 lt!121933) #b00000000000000000000000000000000) (bvslt (index!6295 lt!121933) (size!6050 (_keys!6599 thiss!1504))))) (or ((_ is Undefined!1031) lt!121933) ((_ is Found!1031) lt!121933) (not ((_ is MissingZero!1031) lt!121933)) (and (bvsge (index!6294 lt!121933) #b00000000000000000000000000000000) (bvslt (index!6294 lt!121933) (size!6050 (_keys!6599 thiss!1504))))) (or ((_ is Undefined!1031) lt!121933) ((_ is Found!1031) lt!121933) ((_ is MissingZero!1031) lt!121933) (not ((_ is MissingVacant!1031) lt!121933)) (and (bvsge (index!6297 lt!121933) #b00000000000000000000000000000000) (bvslt (index!6297 lt!121933) (size!6050 (_keys!6599 thiss!1504))))) (or ((_ is Undefined!1031) lt!121933) (ite ((_ is Found!1031) lt!121933) (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6295 lt!121933)) key!932) (ite ((_ is MissingZero!1031) lt!121933) (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6294 lt!121933)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1031) lt!121933) (= (select (arr!5708 (_keys!6599 thiss!1504)) (index!6297 lt!121933)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60065 (= lt!121933 e!157478)))

(declare-fun c!40507 () Bool)

(assert (=> d!60065 (= c!40507 (and ((_ is Intermediate!1031) lt!121931) (undefined!1843 lt!121931)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12019 (_ BitVec 32)) SeekEntryResult!1031)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60065 (= lt!121931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10572 thiss!1504)) key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(assert (=> d!60065 (validMask!0 (mask!10572 thiss!1504))))

(assert (=> d!60065 (= (seekEntryOrOpen!0 key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)) lt!121933)))

(declare-fun b!242658 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12019 (_ BitVec 32)) SeekEntryResult!1031)

(assert (=> b!242658 (= e!157479 (seekKeyOrZeroReturnVacant!0 (x!24237 lt!121931) (index!6296 lt!121931) (index!6296 lt!121931) key!932 (_keys!6599 thiss!1504) (mask!10572 thiss!1504)))))

(declare-fun b!242659 () Bool)

(assert (=> b!242659 (= e!157478 Undefined!1031)))

(assert (= (and d!60065 c!40507) b!242659))

(assert (= (and d!60065 (not c!40507)) b!242657))

(assert (= (and b!242657 c!40506) b!242656))

(assert (= (and b!242657 (not c!40506)) b!242655))

(assert (= (and b!242655 c!40505) b!242654))

(assert (= (and b!242655 (not c!40505)) b!242658))

(declare-fun m!261579 () Bool)

(assert (=> b!242657 m!261579))

(declare-fun m!261581 () Bool)

(assert (=> d!60065 m!261581))

(declare-fun m!261583 () Bool)

(assert (=> d!60065 m!261583))

(assert (=> d!60065 m!261503))

(assert (=> d!60065 m!261581))

(declare-fun m!261585 () Bool)

(assert (=> d!60065 m!261585))

(declare-fun m!261587 () Bool)

(assert (=> d!60065 m!261587))

(declare-fun m!261589 () Bool)

(assert (=> d!60065 m!261589))

(declare-fun m!261591 () Bool)

(assert (=> b!242658 m!261591))

(assert (=> b!242364 d!60065))

(declare-fun d!60067 () Bool)

(assert (=> d!60067 (contains!1722 (getCurrentListMap!1348 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932)))

(declare-fun lt!121936 () Unit!7450)

(declare-fun choose!1137 (array!12019 array!12017 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) (_ BitVec 32) Int) Unit!7450)

(assert (=> d!60067 (= lt!121936 (choose!1137 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(assert (=> d!60067 (validMask!0 (mask!10572 thiss!1504))))

(assert (=> d!60067 (= (lemmaArrayContainsKeyThenInListMap!170 (_keys!6599 thiss!1504) (_values!4474 thiss!1504) (mask!10572 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) lt!121936)))

(declare-fun bs!8880 () Bool)

(assert (= bs!8880 d!60067))

(assert (=> bs!8880 m!261379))

(assert (=> bs!8880 m!261379))

(assert (=> bs!8880 m!261381))

(declare-fun m!261593 () Bool)

(assert (=> bs!8880 m!261593))

(assert (=> bs!8880 m!261503))

(assert (=> b!242354 d!60067))

(declare-fun d!60069 () Bool)

(declare-fun lt!121937 () Bool)

(assert (=> d!60069 (= lt!121937 (select (content!159 Nil!3552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157482 () Bool)

(assert (=> d!60069 (= lt!121937 e!157482)))

(declare-fun res!118897 () Bool)

(assert (=> d!60069 (=> (not res!118897) (not e!157482))))

(assert (=> d!60069 (= res!118897 ((_ is Cons!3551) Nil!3552))))

(assert (=> d!60069 (= (contains!1721 Nil!3552 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121937)))

(declare-fun b!242660 () Bool)

(declare-fun e!157481 () Bool)

(assert (=> b!242660 (= e!157482 e!157481)))

(declare-fun res!118898 () Bool)

(assert (=> b!242660 (=> res!118898 e!157481)))

(assert (=> b!242660 (= res!118898 (= (h!4208 Nil!3552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242661 () Bool)

(assert (=> b!242661 (= e!157481 (contains!1721 (t!8548 Nil!3552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60069 res!118897) b!242660))

(assert (= (and b!242660 (not res!118898)) b!242661))

(assert (=> d!60069 m!261489))

(declare-fun m!261595 () Bool)

(assert (=> d!60069 m!261595))

(declare-fun m!261597 () Bool)

(assert (=> b!242661 m!261597))

(assert (=> b!242363 d!60069))

(declare-fun mapNonEmpty!10801 () Bool)

(declare-fun mapRes!10801 () Bool)

(declare-fun tp!22744 () Bool)

(declare-fun e!157488 () Bool)

(assert (=> mapNonEmpty!10801 (= mapRes!10801 (and tp!22744 e!157488))))

(declare-fun mapKey!10801 () (_ BitVec 32))

(declare-fun mapValue!10801 () ValueCell!2840)

(declare-fun mapRest!10801 () (Array (_ BitVec 32) ValueCell!2840))

(assert (=> mapNonEmpty!10801 (= mapRest!10792 (store mapRest!10801 mapKey!10801 mapValue!10801))))

(declare-fun b!242668 () Bool)

(assert (=> b!242668 (= e!157488 tp_is_empty!6367)))

(declare-fun mapIsEmpty!10801 () Bool)

(assert (=> mapIsEmpty!10801 mapRes!10801))

(declare-fun b!242669 () Bool)

(declare-fun e!157487 () Bool)

(assert (=> b!242669 (= e!157487 tp_is_empty!6367)))

(declare-fun condMapEmpty!10801 () Bool)

(declare-fun mapDefault!10801 () ValueCell!2840)

(assert (=> mapNonEmpty!10792 (= condMapEmpty!10801 (= mapRest!10792 ((as const (Array (_ BitVec 32) ValueCell!2840)) mapDefault!10801)))))

(assert (=> mapNonEmpty!10792 (= tp!22728 (and e!157487 mapRes!10801))))

(assert (= (and mapNonEmpty!10792 condMapEmpty!10801) mapIsEmpty!10801))

(assert (= (and mapNonEmpty!10792 (not condMapEmpty!10801)) mapNonEmpty!10801))

(assert (= (and mapNonEmpty!10801 ((_ is ValueCellFull!2840) mapValue!10801)) b!242668))

(assert (= (and mapNonEmpty!10792 ((_ is ValueCellFull!2840) mapDefault!10801)) b!242669))

(declare-fun m!261599 () Bool)

(assert (=> mapNonEmpty!10801 m!261599))

(declare-fun b_lambda!8023 () Bool)

(assert (= b_lambda!8021 (or (and b!242351 b_free!6505) b_lambda!8023)))

(check-sat (not b!242641) (not mapNonEmpty!10801) (not b!242640) (not d!60049) (not d!60057) (not b!242516) (not d!60065) (not bm!22593) (not b!242524) (not bm!22598) (not b!242603) (not bm!22591) (not b!242531) b_and!13501 (not d!60069) (not bm!22590) (not b!242595) (not b!242538) (not b!242610) (not b_next!6505) (not bm!22599) (not bm!22589) (not b!242661) (not d!60045) tp_is_empty!6367 (not d!60051) (not b!242523) (not b!242599) (not d!60067) (not b!242591) (not b!242586) (not b!242596) (not d!60059) (not b!242584) (not b!242594) (not b!242525) (not b_lambda!8023) (not b!242540) (not b!242658) (not d!60043))
(check-sat b_and!13501 (not b_next!6505))
