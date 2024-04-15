; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24294 () Bool)

(assert start!24294)

(declare-fun b!254433 () Bool)

(declare-fun b_free!6691 () Bool)

(declare-fun b_next!6691 () Bool)

(assert (=> b!254433 (= b_free!6691 (not b_next!6691))))

(declare-fun tp!23361 () Bool)

(declare-fun b_and!13707 () Bool)

(assert (=> b!254433 (= tp!23361 b_and!13707)))

(declare-fun b!254417 () Bool)

(declare-fun res!124528 () Bool)

(declare-datatypes ((V!8385 0))(
  ( (V!8386 (val!3321 Int)) )
))
(declare-datatypes ((ValueCell!2933 0))(
  ( (ValueCellFull!2933 (v!5389 V!8385)) (EmptyCell!2933) )
))
(declare-datatypes ((array!12429 0))(
  ( (array!12430 (arr!5889 (Array (_ BitVec 32) ValueCell!2933)) (size!6237 (_ BitVec 32))) )
))
(declare-datatypes ((array!12431 0))(
  ( (array!12432 (arr!5890 (Array (_ BitVec 32) (_ BitVec 64))) (size!6238 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3766 0))(
  ( (LongMapFixedSize!3767 (defaultEntry!4696 Int) (mask!10943 (_ BitVec 32)) (extraKeys!4433 (_ BitVec 32)) (zeroValue!4537 V!8385) (minValue!4537 V!8385) (_size!1932 (_ BitVec 32)) (_keys!6849 array!12431) (_values!4679 array!12429) (_vacant!1932 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3766)

(declare-datatypes ((SeekEntryResult!1148 0))(
  ( (MissingZero!1148 (index!6762 (_ BitVec 32))) (Found!1148 (index!6763 (_ BitVec 32))) (Intermediate!1148 (undefined!1960 Bool) (index!6764 (_ BitVec 32)) (x!24871 (_ BitVec 32))) (Undefined!1148) (MissingVacant!1148 (index!6765 (_ BitVec 32))) )
))
(declare-fun lt!127381 () SeekEntryResult!1148)

(assert (=> b!254417 (= res!124528 (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6765 lt!127381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164912 () Bool)

(assert (=> b!254417 (=> (not res!124528) (not e!164912))))

(declare-fun b!254418 () Bool)

(declare-fun call!23994 () Bool)

(assert (=> b!254418 (= e!164912 (not call!23994))))

(declare-fun b!254419 () Bool)

(declare-fun e!164909 () Bool)

(assert (=> b!254419 (= e!164909 e!164912)))

(declare-fun res!124523 () Bool)

(declare-fun call!23995 () Bool)

(assert (=> b!254419 (= res!124523 call!23995)))

(assert (=> b!254419 (=> (not res!124523) (not e!164912))))

(declare-fun mapIsEmpty!11145 () Bool)

(declare-fun mapRes!11145 () Bool)

(assert (=> mapIsEmpty!11145 mapRes!11145))

(declare-fun b!254420 () Bool)

(declare-fun res!124521 () Bool)

(declare-fun e!164914 () Bool)

(assert (=> b!254420 (=> (not res!124521) (not e!164914))))

(assert (=> b!254420 (= res!124521 call!23995)))

(declare-fun e!164905 () Bool)

(assert (=> b!254420 (= e!164905 e!164914)))

(declare-fun res!124525 () Bool)

(declare-fun e!164910 () Bool)

(assert (=> start!24294 (=> (not res!124525) (not e!164910))))

(declare-fun valid!1474 (LongMapFixedSize!3766) Bool)

(assert (=> start!24294 (= res!124525 (valid!1474 thiss!1504))))

(assert (=> start!24294 e!164910))

(declare-fun e!164916 () Bool)

(assert (=> start!24294 e!164916))

(assert (=> start!24294 true))

(declare-fun tp_is_empty!6553 () Bool)

(assert (=> start!24294 tp_is_empty!6553))

(declare-fun b!254421 () Bool)

(declare-fun e!164911 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254421 (= e!164911 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504))))))))

(declare-datatypes ((tuple2!4840 0))(
  ( (tuple2!4841 (_1!2431 (_ BitVec 64)) (_2!2431 V!8385)) )
))
(declare-datatypes ((List!3744 0))(
  ( (Nil!3741) (Cons!3740 (h!4402 tuple2!4840) (t!8782 List!3744)) )
))
(declare-datatypes ((ListLongMap!3743 0))(
  ( (ListLongMap!3744 (toList!1887 List!3744)) )
))
(declare-fun lt!127376 () ListLongMap!3743)

(declare-fun lt!127380 () array!12431)

(declare-fun v!346 () V!8385)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun +!680 (ListLongMap!3743 tuple2!4840) ListLongMap!3743)

(declare-fun getCurrentListMap!1396 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) Int) ListLongMap!3743)

(assert (=> b!254421 (= (+!680 lt!127376 (tuple2!4841 key!932 v!346)) (getCurrentListMap!1396 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-datatypes ((Unit!7855 0))(
  ( (Unit!7856) )
))
(declare-fun lt!127386 () Unit!7855)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!91 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) (_ BitVec 64) V!8385 Int) Unit!7855)

(assert (=> b!254421 (= lt!127386 (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12431 (_ BitVec 32)) Bool)

(assert (=> b!254421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127380 (mask!10943 thiss!1504))))

(declare-fun lt!127377 () Unit!7855)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12431 (_ BitVec 32) (_ BitVec 32)) Unit!7855)

(assert (=> b!254421 (= lt!127377 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) index!297 (mask!10943 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254421 (= (arrayCountValidKeys!0 lt!127380 #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504)))))))

(declare-fun lt!127383 () Unit!7855)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12431 (_ BitVec 32) (_ BitVec 64)) Unit!7855)

(assert (=> b!254421 (= lt!127383 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6849 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3745 0))(
  ( (Nil!3742) (Cons!3741 (h!4403 (_ BitVec 64)) (t!8783 List!3745)) )
))
(declare-fun arrayNoDuplicates!0 (array!12431 (_ BitVec 32) List!3745) Bool)

(assert (=> b!254421 (arrayNoDuplicates!0 lt!127380 #b00000000000000000000000000000000 Nil!3742)))

(assert (=> b!254421 (= lt!127380 (array!12432 (store (arr!5890 (_keys!6849 thiss!1504)) index!297 key!932) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun lt!127379 () Unit!7855)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3745) Unit!7855)

(assert (=> b!254421 (= lt!127379 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6849 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3742))))

(declare-fun lt!127378 () Unit!7855)

(declare-fun e!164913 () Unit!7855)

(assert (=> b!254421 (= lt!127378 e!164913)))

(declare-fun c!42909 () Bool)

(declare-fun arrayContainsKey!0 (array!12431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254421 (= c!42909 (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254422 () Bool)

(declare-fun e!164918 () Unit!7855)

(declare-fun lt!127385 () Unit!7855)

(assert (=> b!254422 (= e!164918 lt!127385)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!415 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7855)

(assert (=> b!254422 (= lt!127385 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!415 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(declare-fun c!42912 () Bool)

(get-info :version)

(assert (=> b!254422 (= c!42912 ((_ is MissingZero!1148) lt!127381))))

(assert (=> b!254422 e!164905))

(declare-fun b!254423 () Bool)

(declare-fun e!164906 () Bool)

(declare-fun e!164915 () Bool)

(assert (=> b!254423 (= e!164906 (and e!164915 mapRes!11145))))

(declare-fun condMapEmpty!11145 () Bool)

(declare-fun mapDefault!11145 () ValueCell!2933)

(assert (=> b!254423 (= condMapEmpty!11145 (= (arr!5889 (_values!4679 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2933)) mapDefault!11145)))))

(declare-fun b!254424 () Bool)

(declare-fun res!124524 () Bool)

(assert (=> b!254424 (=> (not res!124524) (not e!164914))))

(assert (=> b!254424 (= res!124524 (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6762 lt!127381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254425 () Bool)

(declare-fun Unit!7857 () Unit!7855)

(assert (=> b!254425 (= e!164913 Unit!7857)))

(declare-fun b!254426 () Bool)

(assert (=> b!254426 (= e!164914 (not call!23994))))

(declare-fun b!254427 () Bool)

(declare-fun res!124522 () Bool)

(assert (=> b!254427 (=> (not res!124522) (not e!164910))))

(assert (=> b!254427 (= res!124522 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254428 () Bool)

(declare-fun e!164908 () Bool)

(assert (=> b!254428 (= e!164910 e!164908)))

(declare-fun res!124527 () Bool)

(assert (=> b!254428 (=> (not res!124527) (not e!164908))))

(assert (=> b!254428 (= res!124527 (or (= lt!127381 (MissingZero!1148 index!297)) (= lt!127381 (MissingVacant!1148 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12431 (_ BitVec 32)) SeekEntryResult!1148)

(assert (=> b!254428 (= lt!127381 (seekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(declare-fun b!254429 () Bool)

(declare-fun Unit!7858 () Unit!7855)

(assert (=> b!254429 (= e!164913 Unit!7858)))

(declare-fun lt!127387 () Unit!7855)

(declare-fun lemmaArrayContainsKeyThenInListMap!226 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) (_ BitVec 32) Int) Unit!7855)

(assert (=> b!254429 (= lt!127387 (lemmaArrayContainsKeyThenInListMap!226 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254429 false))

(declare-fun b!254430 () Bool)

(declare-fun c!42911 () Bool)

(assert (=> b!254430 (= c!42911 ((_ is MissingVacant!1148) lt!127381))))

(assert (=> b!254430 (= e!164905 e!164909)))

(declare-fun bm!23991 () Bool)

(assert (=> bm!23991 (= call!23994 (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254431 () Bool)

(declare-fun e!164907 () Bool)

(assert (=> b!254431 (= e!164907 tp_is_empty!6553)))

(declare-fun b!254432 () Bool)

(assert (=> b!254432 (= e!164915 tp_is_empty!6553)))

(declare-fun mapNonEmpty!11145 () Bool)

(declare-fun tp!23360 () Bool)

(assert (=> mapNonEmpty!11145 (= mapRes!11145 (and tp!23360 e!164907))))

(declare-fun mapRest!11145 () (Array (_ BitVec 32) ValueCell!2933))

(declare-fun mapKey!11145 () (_ BitVec 32))

(declare-fun mapValue!11145 () ValueCell!2933)

(assert (=> mapNonEmpty!11145 (= (arr!5889 (_values!4679 thiss!1504)) (store mapRest!11145 mapKey!11145 mapValue!11145))))

(declare-fun array_inv!3887 (array!12431) Bool)

(declare-fun array_inv!3888 (array!12429) Bool)

(assert (=> b!254433 (= e!164916 (and tp!23361 tp_is_empty!6553 (array_inv!3887 (_keys!6849 thiss!1504)) (array_inv!3888 (_values!4679 thiss!1504)) e!164906))))

(declare-fun b!254434 () Bool)

(assert (=> b!254434 (= e!164909 ((_ is Undefined!1148) lt!127381))))

(declare-fun b!254435 () Bool)

(assert (=> b!254435 (= e!164908 e!164911)))

(declare-fun res!124526 () Bool)

(assert (=> b!254435 (=> (not res!124526) (not e!164911))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254435 (= res!124526 (inRange!0 index!297 (mask!10943 thiss!1504)))))

(declare-fun lt!127384 () Unit!7855)

(assert (=> b!254435 (= lt!127384 e!164918)))

(declare-fun c!42910 () Bool)

(declare-fun contains!1822 (ListLongMap!3743 (_ BitVec 64)) Bool)

(assert (=> b!254435 (= c!42910 (contains!1822 lt!127376 key!932))))

(assert (=> b!254435 (= lt!127376 (getCurrentListMap!1396 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun bm!23992 () Bool)

(assert (=> bm!23992 (= call!23995 (inRange!0 (ite c!42912 (index!6762 lt!127381) (index!6765 lt!127381)) (mask!10943 thiss!1504)))))

(declare-fun b!254436 () Bool)

(declare-fun Unit!7859 () Unit!7855)

(assert (=> b!254436 (= e!164918 Unit!7859)))

(declare-fun lt!127382 () Unit!7855)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!417 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7855)

(assert (=> b!254436 (= lt!127382 (lemmaInListMapThenSeekEntryOrOpenFindsIt!417 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254436 false))

(assert (= (and start!24294 res!124525) b!254427))

(assert (= (and b!254427 res!124522) b!254428))

(assert (= (and b!254428 res!124527) b!254435))

(assert (= (and b!254435 c!42910) b!254436))

(assert (= (and b!254435 (not c!42910)) b!254422))

(assert (= (and b!254422 c!42912) b!254420))

(assert (= (and b!254422 (not c!42912)) b!254430))

(assert (= (and b!254420 res!124521) b!254424))

(assert (= (and b!254424 res!124524) b!254426))

(assert (= (and b!254430 c!42911) b!254419))

(assert (= (and b!254430 (not c!42911)) b!254434))

(assert (= (and b!254419 res!124523) b!254417))

(assert (= (and b!254417 res!124528) b!254418))

(assert (= (or b!254420 b!254419) bm!23992))

(assert (= (or b!254426 b!254418) bm!23991))

(assert (= (and b!254435 res!124526) b!254421))

(assert (= (and b!254421 c!42909) b!254429))

(assert (= (and b!254421 (not c!42909)) b!254425))

(assert (= (and b!254423 condMapEmpty!11145) mapIsEmpty!11145))

(assert (= (and b!254423 (not condMapEmpty!11145)) mapNonEmpty!11145))

(assert (= (and mapNonEmpty!11145 ((_ is ValueCellFull!2933) mapValue!11145)) b!254431))

(assert (= (and b!254423 ((_ is ValueCellFull!2933) mapDefault!11145)) b!254432))

(assert (= b!254433 b!254423))

(assert (= start!24294 b!254433))

(declare-fun m!269489 () Bool)

(assert (=> start!24294 m!269489))

(declare-fun m!269491 () Bool)

(assert (=> b!254435 m!269491))

(declare-fun m!269493 () Bool)

(assert (=> b!254435 m!269493))

(declare-fun m!269495 () Bool)

(assert (=> b!254435 m!269495))

(declare-fun m!269497 () Bool)

(assert (=> b!254433 m!269497))

(declare-fun m!269499 () Bool)

(assert (=> b!254433 m!269499))

(declare-fun m!269501 () Bool)

(assert (=> b!254436 m!269501))

(declare-fun m!269503 () Bool)

(assert (=> b!254422 m!269503))

(declare-fun m!269505 () Bool)

(assert (=> bm!23991 m!269505))

(declare-fun m!269507 () Bool)

(assert (=> mapNonEmpty!11145 m!269507))

(declare-fun m!269509 () Bool)

(assert (=> b!254428 m!269509))

(declare-fun m!269511 () Bool)

(assert (=> b!254421 m!269511))

(declare-fun m!269513 () Bool)

(assert (=> b!254421 m!269513))

(declare-fun m!269515 () Bool)

(assert (=> b!254421 m!269515))

(declare-fun m!269517 () Bool)

(assert (=> b!254421 m!269517))

(declare-fun m!269519 () Bool)

(assert (=> b!254421 m!269519))

(declare-fun m!269521 () Bool)

(assert (=> b!254421 m!269521))

(declare-fun m!269523 () Bool)

(assert (=> b!254421 m!269523))

(declare-fun m!269525 () Bool)

(assert (=> b!254421 m!269525))

(declare-fun m!269527 () Bool)

(assert (=> b!254421 m!269527))

(declare-fun m!269529 () Bool)

(assert (=> b!254421 m!269529))

(declare-fun m!269531 () Bool)

(assert (=> b!254421 m!269531))

(assert (=> b!254421 m!269505))

(declare-fun m!269533 () Bool)

(assert (=> b!254421 m!269533))

(declare-fun m!269535 () Bool)

(assert (=> b!254424 m!269535))

(declare-fun m!269537 () Bool)

(assert (=> bm!23992 m!269537))

(declare-fun m!269539 () Bool)

(assert (=> b!254417 m!269539))

(declare-fun m!269541 () Bool)

(assert (=> b!254429 m!269541))

(check-sat (not b!254422) (not b!254433) (not b_next!6691) (not start!24294) (not bm!23992) (not mapNonEmpty!11145) (not bm!23991) (not b!254428) (not b!254436) (not b!254435) tp_is_empty!6553 (not b!254421) b_and!13707 (not b!254429))
(check-sat b_and!13707 (not b_next!6691))
(get-model)

(declare-fun d!61337 () Bool)

(assert (=> d!61337 (contains!1822 (getCurrentListMap!1396 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) key!932)))

(declare-fun lt!127462 () Unit!7855)

(declare-fun choose!1219 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) (_ BitVec 32) Int) Unit!7855)

(assert (=> d!61337 (= lt!127462 (choose!1219 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61337 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61337 (= (lemmaArrayContainsKeyThenInListMap!226 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127462)))

(declare-fun bs!9030 () Bool)

(assert (= bs!9030 d!61337))

(assert (=> bs!9030 m!269495))

(assert (=> bs!9030 m!269495))

(declare-fun m!269651 () Bool)

(assert (=> bs!9030 m!269651))

(declare-fun m!269653 () Bool)

(assert (=> bs!9030 m!269653))

(declare-fun m!269655 () Bool)

(assert (=> bs!9030 m!269655))

(assert (=> b!254429 d!61337))

(declare-fun d!61339 () Bool)

(declare-fun res!124583 () Bool)

(declare-fun e!165005 () Bool)

(assert (=> d!61339 (=> (not res!124583) (not e!165005))))

(declare-fun simpleValid!270 (LongMapFixedSize!3766) Bool)

(assert (=> d!61339 (= res!124583 (simpleValid!270 thiss!1504))))

(assert (=> d!61339 (= (valid!1474 thiss!1504) e!165005)))

(declare-fun b!254563 () Bool)

(declare-fun res!124584 () Bool)

(assert (=> b!254563 (=> (not res!124584) (not e!165005))))

(assert (=> b!254563 (= res!124584 (= (arrayCountValidKeys!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (_size!1932 thiss!1504)))))

(declare-fun b!254564 () Bool)

(declare-fun res!124585 () Bool)

(assert (=> b!254564 (=> (not res!124585) (not e!165005))))

(assert (=> b!254564 (= res!124585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(declare-fun b!254565 () Bool)

(assert (=> b!254565 (= e!165005 (arrayNoDuplicates!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 Nil!3742))))

(assert (= (and d!61339 res!124583) b!254563))

(assert (= (and b!254563 res!124584) b!254564))

(assert (= (and b!254564 res!124585) b!254565))

(declare-fun m!269657 () Bool)

(assert (=> d!61339 m!269657))

(assert (=> b!254563 m!269527))

(declare-fun m!269659 () Bool)

(assert (=> b!254564 m!269659))

(declare-fun m!269661 () Bool)

(assert (=> b!254565 m!269661))

(assert (=> start!24294 d!61339))

(declare-fun d!61341 () Bool)

(declare-fun e!165008 () Bool)

(assert (=> d!61341 e!165008))

(declare-fun res!124590 () Bool)

(assert (=> d!61341 (=> (not res!124590) (not e!165008))))

(declare-fun lt!127468 () SeekEntryResult!1148)

(assert (=> d!61341 (= res!124590 ((_ is Found!1148) lt!127468))))

(assert (=> d!61341 (= lt!127468 (seekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(declare-fun lt!127467 () Unit!7855)

(declare-fun choose!1220 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7855)

(assert (=> d!61341 (= lt!127467 (choose!1220 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61341 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61341 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!417 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)) lt!127467)))

(declare-fun b!254570 () Bool)

(declare-fun res!124591 () Bool)

(assert (=> b!254570 (=> (not res!124591) (not e!165008))))

(assert (=> b!254570 (= res!124591 (inRange!0 (index!6763 lt!127468) (mask!10943 thiss!1504)))))

(declare-fun b!254571 () Bool)

(assert (=> b!254571 (= e!165008 (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6763 lt!127468)) key!932))))

(assert (=> b!254571 (and (bvsge (index!6763 lt!127468) #b00000000000000000000000000000000) (bvslt (index!6763 lt!127468) (size!6238 (_keys!6849 thiss!1504))))))

(assert (= (and d!61341 res!124590) b!254570))

(assert (= (and b!254570 res!124591) b!254571))

(assert (=> d!61341 m!269509))

(declare-fun m!269663 () Bool)

(assert (=> d!61341 m!269663))

(assert (=> d!61341 m!269655))

(declare-fun m!269665 () Bool)

(assert (=> b!254570 m!269665))

(declare-fun m!269667 () Bool)

(assert (=> b!254571 m!269667))

(assert (=> b!254436 d!61341))

(declare-fun d!61343 () Bool)

(assert (=> d!61343 (= (array_inv!3887 (_keys!6849 thiss!1504)) (bvsge (size!6238 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254433 d!61343))

(declare-fun d!61345 () Bool)

(assert (=> d!61345 (= (array_inv!3888 (_values!4679 thiss!1504)) (bvsge (size!6237 (_values!4679 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254433 d!61345))

(declare-fun d!61347 () Bool)

(assert (=> d!61347 (= (inRange!0 index!297 (mask!10943 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10943 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!254435 d!61347))

(declare-fun d!61349 () Bool)

(declare-fun e!165014 () Bool)

(assert (=> d!61349 e!165014))

(declare-fun res!124594 () Bool)

(assert (=> d!61349 (=> res!124594 e!165014)))

(declare-fun lt!127477 () Bool)

(assert (=> d!61349 (= res!124594 (not lt!127477))))

(declare-fun lt!127480 () Bool)

(assert (=> d!61349 (= lt!127477 lt!127480)))

(declare-fun lt!127479 () Unit!7855)

(declare-fun e!165013 () Unit!7855)

(assert (=> d!61349 (= lt!127479 e!165013)))

(declare-fun c!42939 () Bool)

(assert (=> d!61349 (= c!42939 lt!127480)))

(declare-fun containsKey!295 (List!3744 (_ BitVec 64)) Bool)

(assert (=> d!61349 (= lt!127480 (containsKey!295 (toList!1887 lt!127376) key!932))))

(assert (=> d!61349 (= (contains!1822 lt!127376 key!932) lt!127477)))

(declare-fun b!254578 () Bool)

(declare-fun lt!127478 () Unit!7855)

(assert (=> b!254578 (= e!165013 lt!127478)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!244 (List!3744 (_ BitVec 64)) Unit!7855)

(assert (=> b!254578 (= lt!127478 (lemmaContainsKeyImpliesGetValueByKeyDefined!244 (toList!1887 lt!127376) key!932))))

(declare-datatypes ((Option!309 0))(
  ( (Some!308 (v!5394 V!8385)) (None!307) )
))
(declare-fun isDefined!245 (Option!309) Bool)

(declare-fun getValueByKey!303 (List!3744 (_ BitVec 64)) Option!309)

(assert (=> b!254578 (isDefined!245 (getValueByKey!303 (toList!1887 lt!127376) key!932))))

(declare-fun b!254579 () Bool)

(declare-fun Unit!7864 () Unit!7855)

(assert (=> b!254579 (= e!165013 Unit!7864)))

(declare-fun b!254580 () Bool)

(assert (=> b!254580 (= e!165014 (isDefined!245 (getValueByKey!303 (toList!1887 lt!127376) key!932)))))

(assert (= (and d!61349 c!42939) b!254578))

(assert (= (and d!61349 (not c!42939)) b!254579))

(assert (= (and d!61349 (not res!124594)) b!254580))

(declare-fun m!269669 () Bool)

(assert (=> d!61349 m!269669))

(declare-fun m!269671 () Bool)

(assert (=> b!254578 m!269671))

(declare-fun m!269673 () Bool)

(assert (=> b!254578 m!269673))

(assert (=> b!254578 m!269673))

(declare-fun m!269675 () Bool)

(assert (=> b!254578 m!269675))

(assert (=> b!254580 m!269673))

(assert (=> b!254580 m!269673))

(assert (=> b!254580 m!269675))

(assert (=> b!254435 d!61349))

(declare-fun bm!24019 () Bool)

(declare-fun call!24023 () ListLongMap!3743)

(declare-fun call!24022 () ListLongMap!3743)

(assert (=> bm!24019 (= call!24023 call!24022)))

(declare-fun b!254623 () Bool)

(declare-fun e!165045 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254623 (= e!165045 (validKeyInArray!0 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24020 () Bool)

(declare-fun call!24028 () ListLongMap!3743)

(declare-fun call!24024 () ListLongMap!3743)

(assert (=> bm!24020 (= call!24028 call!24024)))

(declare-fun b!254624 () Bool)

(declare-fun e!165042 () ListLongMap!3743)

(assert (=> b!254624 (= e!165042 call!24028)))

(declare-fun b!254625 () Bool)

(declare-fun e!165041 () Bool)

(declare-fun lt!127534 () ListLongMap!3743)

(declare-fun apply!247 (ListLongMap!3743 (_ BitVec 64)) V!8385)

(assert (=> b!254625 (= e!165041 (= (apply!247 lt!127534 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4537 thiss!1504)))))

(declare-fun b!254626 () Bool)

(declare-fun res!124618 () Bool)

(declare-fun e!165051 () Bool)

(assert (=> b!254626 (=> (not res!124618) (not e!165051))))

(declare-fun e!165052 () Bool)

(assert (=> b!254626 (= res!124618 e!165052)))

(declare-fun c!42957 () Bool)

(assert (=> b!254626 (= c!42957 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!254627 () Bool)

(declare-fun e!165047 () Unit!7855)

(declare-fun Unit!7865 () Unit!7855)

(assert (=> b!254627 (= e!165047 Unit!7865)))

(declare-fun b!254628 () Bool)

(declare-fun res!124620 () Bool)

(assert (=> b!254628 (=> (not res!124620) (not e!165051))))

(declare-fun e!165048 () Bool)

(assert (=> b!254628 (= res!124620 e!165048)))

(declare-fun res!124617 () Bool)

(assert (=> b!254628 (=> res!124617 e!165048)))

(declare-fun e!165043 () Bool)

(assert (=> b!254628 (= res!124617 (not e!165043))))

(declare-fun res!124614 () Bool)

(assert (=> b!254628 (=> (not res!124614) (not e!165043))))

(assert (=> b!254628 (= res!124614 (bvslt #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun d!61351 () Bool)

(assert (=> d!61351 e!165051))

(declare-fun res!124621 () Bool)

(assert (=> d!61351 (=> (not res!124621) (not e!165051))))

(assert (=> d!61351 (= res!124621 (or (bvsge #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))))

(declare-fun lt!127544 () ListLongMap!3743)

(assert (=> d!61351 (= lt!127534 lt!127544)))

(declare-fun lt!127526 () Unit!7855)

(assert (=> d!61351 (= lt!127526 e!165047)))

(declare-fun c!42955 () Bool)

(assert (=> d!61351 (= c!42955 e!165045)))

(declare-fun res!124613 () Bool)

(assert (=> d!61351 (=> (not res!124613) (not e!165045))))

(assert (=> d!61351 (= res!124613 (bvslt #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun e!165049 () ListLongMap!3743)

(assert (=> d!61351 (= lt!127544 e!165049)))

(declare-fun c!42956 () Bool)

(assert (=> d!61351 (= c!42956 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61351 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61351 (= (getCurrentListMap!1396 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127534)))

(declare-fun c!42952 () Bool)

(declare-fun call!24026 () ListLongMap!3743)

(declare-fun bm!24021 () Bool)

(assert (=> bm!24021 (= call!24024 (+!680 (ite c!42956 call!24022 (ite c!42952 call!24023 call!24026)) (ite (or c!42956 c!42952) (tuple2!4841 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4537 thiss!1504)) (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504)))))))

(declare-fun b!254629 () Bool)

(declare-fun e!165046 () Bool)

(assert (=> b!254629 (= e!165051 e!165046)))

(declare-fun c!42953 () Bool)

(assert (=> b!254629 (= c!42953 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24022 () Bool)

(assert (=> bm!24022 (= call!24026 call!24023)))

(declare-fun bm!24023 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!563 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) Int) ListLongMap!3743)

(assert (=> bm!24023 (= call!24022 (getCurrentListMapNoExtraKeys!563 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254630 () Bool)

(declare-fun call!24027 () Bool)

(assert (=> b!254630 (= e!165046 (not call!24027))))

(declare-fun b!254631 () Bool)

(declare-fun e!165044 () Bool)

(declare-fun get!3026 (ValueCell!2933 V!8385) V!8385)

(declare-fun dynLambda!581 (Int (_ BitVec 64)) V!8385)

(assert (=> b!254631 (= e!165044 (= (apply!247 lt!127534 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)) (get!3026 (select (arr!5889 (_values!4679 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4696 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6237 (_values!4679 thiss!1504))))))

(assert (=> b!254631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun bm!24024 () Bool)

(declare-fun call!24025 () Bool)

(assert (=> bm!24024 (= call!24025 (contains!1822 lt!127534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254632 () Bool)

(declare-fun lt!127528 () Unit!7855)

(assert (=> b!254632 (= e!165047 lt!127528)))

(declare-fun lt!127532 () ListLongMap!3743)

(assert (=> b!254632 (= lt!127532 (getCurrentListMapNoExtraKeys!563 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127540 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127537 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127537 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127543 () Unit!7855)

(declare-fun addStillContains!223 (ListLongMap!3743 (_ BitVec 64) V!8385 (_ BitVec 64)) Unit!7855)

(assert (=> b!254632 (= lt!127543 (addStillContains!223 lt!127532 lt!127540 (zeroValue!4537 thiss!1504) lt!127537))))

(assert (=> b!254632 (contains!1822 (+!680 lt!127532 (tuple2!4841 lt!127540 (zeroValue!4537 thiss!1504))) lt!127537)))

(declare-fun lt!127525 () Unit!7855)

(assert (=> b!254632 (= lt!127525 lt!127543)))

(declare-fun lt!127527 () ListLongMap!3743)

(assert (=> b!254632 (= lt!127527 (getCurrentListMapNoExtraKeys!563 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127545 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127545 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127538 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127538 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127546 () Unit!7855)

(declare-fun addApplyDifferent!223 (ListLongMap!3743 (_ BitVec 64) V!8385 (_ BitVec 64)) Unit!7855)

(assert (=> b!254632 (= lt!127546 (addApplyDifferent!223 lt!127527 lt!127545 (minValue!4537 thiss!1504) lt!127538))))

(assert (=> b!254632 (= (apply!247 (+!680 lt!127527 (tuple2!4841 lt!127545 (minValue!4537 thiss!1504))) lt!127538) (apply!247 lt!127527 lt!127538))))

(declare-fun lt!127536 () Unit!7855)

(assert (=> b!254632 (= lt!127536 lt!127546)))

(declare-fun lt!127542 () ListLongMap!3743)

(assert (=> b!254632 (= lt!127542 (getCurrentListMapNoExtraKeys!563 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127529 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127539 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127539 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127533 () Unit!7855)

(assert (=> b!254632 (= lt!127533 (addApplyDifferent!223 lt!127542 lt!127529 (zeroValue!4537 thiss!1504) lt!127539))))

(assert (=> b!254632 (= (apply!247 (+!680 lt!127542 (tuple2!4841 lt!127529 (zeroValue!4537 thiss!1504))) lt!127539) (apply!247 lt!127542 lt!127539))))

(declare-fun lt!127535 () Unit!7855)

(assert (=> b!254632 (= lt!127535 lt!127533)))

(declare-fun lt!127530 () ListLongMap!3743)

(assert (=> b!254632 (= lt!127530 (getCurrentListMapNoExtraKeys!563 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127531 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127541 () (_ BitVec 64))

(assert (=> b!254632 (= lt!127541 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254632 (= lt!127528 (addApplyDifferent!223 lt!127530 lt!127531 (minValue!4537 thiss!1504) lt!127541))))

(assert (=> b!254632 (= (apply!247 (+!680 lt!127530 (tuple2!4841 lt!127531 (minValue!4537 thiss!1504))) lt!127541) (apply!247 lt!127530 lt!127541))))

(declare-fun b!254633 () Bool)

(assert (=> b!254633 (= e!165042 call!24026)))

(declare-fun b!254634 () Bool)

(declare-fun e!165053 () ListLongMap!3743)

(assert (=> b!254634 (= e!165053 call!24028)))

(declare-fun b!254635 () Bool)

(assert (=> b!254635 (= e!165052 (not call!24025))))

(declare-fun b!254636 () Bool)

(assert (=> b!254636 (= e!165049 e!165053)))

(assert (=> b!254636 (= c!42952 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!254637 () Bool)

(declare-fun c!42954 () Bool)

(assert (=> b!254637 (= c!42954 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254637 (= e!165053 e!165042)))

(declare-fun b!254638 () Bool)

(assert (=> b!254638 (= e!165049 (+!680 call!24024 (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504))))))

(declare-fun b!254639 () Bool)

(assert (=> b!254639 (= e!165043 (validKeyInArray!0 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24025 () Bool)

(assert (=> bm!24025 (= call!24027 (contains!1822 lt!127534 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254640 () Bool)

(assert (=> b!254640 (= e!165052 e!165041)))

(declare-fun res!124616 () Bool)

(assert (=> b!254640 (= res!124616 call!24025)))

(assert (=> b!254640 (=> (not res!124616) (not e!165041))))

(declare-fun b!254641 () Bool)

(declare-fun e!165050 () Bool)

(assert (=> b!254641 (= e!165050 (= (apply!247 lt!127534 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4537 thiss!1504)))))

(declare-fun b!254642 () Bool)

(assert (=> b!254642 (= e!165048 e!165044)))

(declare-fun res!124615 () Bool)

(assert (=> b!254642 (=> (not res!124615) (not e!165044))))

(assert (=> b!254642 (= res!124615 (contains!1822 lt!127534 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!254642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun b!254643 () Bool)

(assert (=> b!254643 (= e!165046 e!165050)))

(declare-fun res!124619 () Bool)

(assert (=> b!254643 (= res!124619 call!24027)))

(assert (=> b!254643 (=> (not res!124619) (not e!165050))))

(assert (= (and d!61351 c!42956) b!254638))

(assert (= (and d!61351 (not c!42956)) b!254636))

(assert (= (and b!254636 c!42952) b!254634))

(assert (= (and b!254636 (not c!42952)) b!254637))

(assert (= (and b!254637 c!42954) b!254624))

(assert (= (and b!254637 (not c!42954)) b!254633))

(assert (= (or b!254624 b!254633) bm!24022))

(assert (= (or b!254634 bm!24022) bm!24019))

(assert (= (or b!254634 b!254624) bm!24020))

(assert (= (or b!254638 bm!24019) bm!24023))

(assert (= (or b!254638 bm!24020) bm!24021))

(assert (= (and d!61351 res!124613) b!254623))

(assert (= (and d!61351 c!42955) b!254632))

(assert (= (and d!61351 (not c!42955)) b!254627))

(assert (= (and d!61351 res!124621) b!254628))

(assert (= (and b!254628 res!124614) b!254639))

(assert (= (and b!254628 (not res!124617)) b!254642))

(assert (= (and b!254642 res!124615) b!254631))

(assert (= (and b!254628 res!124620) b!254626))

(assert (= (and b!254626 c!42957) b!254640))

(assert (= (and b!254626 (not c!42957)) b!254635))

(assert (= (and b!254640 res!124616) b!254625))

(assert (= (or b!254640 b!254635) bm!24024))

(assert (= (and b!254626 res!124618) b!254629))

(assert (= (and b!254629 c!42953) b!254643))

(assert (= (and b!254629 (not c!42953)) b!254630))

(assert (= (and b!254643 res!124619) b!254641))

(assert (= (or b!254643 b!254630) bm!24025))

(declare-fun b_lambda!8113 () Bool)

(assert (=> (not b_lambda!8113) (not b!254631)))

(declare-fun t!8785 () Bool)

(declare-fun tb!2999 () Bool)

(assert (=> (and b!254433 (= (defaultEntry!4696 thiss!1504) (defaultEntry!4696 thiss!1504)) t!8785) tb!2999))

(declare-fun result!5335 () Bool)

(assert (=> tb!2999 (= result!5335 tp_is_empty!6553)))

(assert (=> b!254631 t!8785))

(declare-fun b_and!13713 () Bool)

(assert (= b_and!13707 (and (=> t!8785 result!5335) b_and!13713)))

(declare-fun m!269677 () Bool)

(assert (=> bm!24023 m!269677))

(declare-fun m!269679 () Bool)

(assert (=> b!254623 m!269679))

(assert (=> b!254623 m!269679))

(declare-fun m!269681 () Bool)

(assert (=> b!254623 m!269681))

(assert (=> b!254642 m!269679))

(assert (=> b!254642 m!269679))

(declare-fun m!269683 () Bool)

(assert (=> b!254642 m!269683))

(assert (=> d!61351 m!269655))

(declare-fun m!269685 () Bool)

(assert (=> b!254641 m!269685))

(declare-fun m!269687 () Bool)

(assert (=> bm!24021 m!269687))

(declare-fun m!269689 () Bool)

(assert (=> b!254632 m!269689))

(declare-fun m!269691 () Bool)

(assert (=> b!254632 m!269691))

(declare-fun m!269693 () Bool)

(assert (=> b!254632 m!269693))

(declare-fun m!269695 () Bool)

(assert (=> b!254632 m!269695))

(declare-fun m!269697 () Bool)

(assert (=> b!254632 m!269697))

(declare-fun m!269699 () Bool)

(assert (=> b!254632 m!269699))

(declare-fun m!269701 () Bool)

(assert (=> b!254632 m!269701))

(declare-fun m!269703 () Bool)

(assert (=> b!254632 m!269703))

(declare-fun m!269705 () Bool)

(assert (=> b!254632 m!269705))

(assert (=> b!254632 m!269679))

(assert (=> b!254632 m!269695))

(declare-fun m!269707 () Bool)

(assert (=> b!254632 m!269707))

(declare-fun m!269709 () Bool)

(assert (=> b!254632 m!269709))

(declare-fun m!269711 () Bool)

(assert (=> b!254632 m!269711))

(declare-fun m!269713 () Bool)

(assert (=> b!254632 m!269713))

(declare-fun m!269715 () Bool)

(assert (=> b!254632 m!269715))

(assert (=> b!254632 m!269677))

(assert (=> b!254632 m!269707))

(assert (=> b!254632 m!269703))

(declare-fun m!269717 () Bool)

(assert (=> b!254632 m!269717))

(assert (=> b!254632 m!269699))

(declare-fun m!269719 () Bool)

(assert (=> bm!24024 m!269719))

(declare-fun m!269721 () Bool)

(assert (=> b!254638 m!269721))

(declare-fun m!269723 () Bool)

(assert (=> b!254631 m!269723))

(declare-fun m!269725 () Bool)

(assert (=> b!254631 m!269725))

(declare-fun m!269727 () Bool)

(assert (=> b!254631 m!269727))

(assert (=> b!254631 m!269679))

(declare-fun m!269729 () Bool)

(assert (=> b!254631 m!269729))

(assert (=> b!254631 m!269723))

(assert (=> b!254631 m!269679))

(assert (=> b!254631 m!269725))

(declare-fun m!269731 () Bool)

(assert (=> bm!24025 m!269731))

(declare-fun m!269733 () Bool)

(assert (=> b!254625 m!269733))

(assert (=> b!254639 m!269679))

(assert (=> b!254639 m!269679))

(assert (=> b!254639 m!269681))

(assert (=> b!254435 d!61351))

(declare-fun d!61353 () Bool)

(declare-fun lt!127549 () (_ BitVec 32))

(assert (=> d!61353 (and (bvsge lt!127549 #b00000000000000000000000000000000) (bvsle lt!127549 (bvsub (size!6238 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165058 () (_ BitVec 32))

(assert (=> d!61353 (= lt!127549 e!165058)))

(declare-fun c!42962 () Bool)

(assert (=> d!61353 (= c!42962 (bvsge #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(assert (=> d!61353 (and (bvsle #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6238 (_keys!6849 thiss!1504)) (size!6238 (_keys!6849 thiss!1504))))))

(assert (=> d!61353 (= (arrayCountValidKeys!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) lt!127549)))

(declare-fun b!254654 () Bool)

(declare-fun e!165059 () (_ BitVec 32))

(declare-fun call!24031 () (_ BitVec 32))

(assert (=> b!254654 (= e!165059 (bvadd #b00000000000000000000000000000001 call!24031))))

(declare-fun b!254655 () Bool)

(assert (=> b!254655 (= e!165058 #b00000000000000000000000000000000)))

(declare-fun b!254656 () Bool)

(assert (=> b!254656 (= e!165059 call!24031)))

(declare-fun bm!24028 () Bool)

(assert (=> bm!24028 (= call!24031 (arrayCountValidKeys!0 (_keys!6849 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun b!254657 () Bool)

(assert (=> b!254657 (= e!165058 e!165059)))

(declare-fun c!42963 () Bool)

(assert (=> b!254657 (= c!42963 (validKeyInArray!0 (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61353 c!42962) b!254655))

(assert (= (and d!61353 (not c!42962)) b!254657))

(assert (= (and b!254657 c!42963) b!254654))

(assert (= (and b!254657 (not c!42963)) b!254656))

(assert (= (or b!254654 b!254656) bm!24028))

(declare-fun m!269735 () Bool)

(assert (=> bm!24028 m!269735))

(assert (=> b!254657 m!269679))

(assert (=> b!254657 m!269679))

(assert (=> b!254657 m!269681))

(assert (=> b!254421 d!61353))

(declare-fun d!61355 () Bool)

(declare-fun e!165062 () Bool)

(assert (=> d!61355 e!165062))

(declare-fun res!124624 () Bool)

(assert (=> d!61355 (=> (not res!124624) (not e!165062))))

(assert (=> d!61355 (= res!124624 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504))) (bvslt index!297 (size!6237 (_values!4679 thiss!1504)))))))

(declare-fun lt!127552 () Unit!7855)

(declare-fun choose!1221 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) (_ BitVec 64) V!8385 Int) Unit!7855)

(assert (=> d!61355 (= lt!127552 (choose!1221 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61355 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61355 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!91 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)) lt!127552)))

(declare-fun b!254660 () Bool)

(assert (=> b!254660 (= e!165062 (= (+!680 (getCurrentListMap!1396 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) (tuple2!4841 key!932 v!346)) (getCurrentListMap!1396 (array!12432 (store (arr!5890 (_keys!6849 thiss!1504)) index!297 key!932) (size!6238 (_keys!6849 thiss!1504))) (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504))))))

(assert (= (and d!61355 res!124624) b!254660))

(declare-fun m!269737 () Bool)

(assert (=> d!61355 m!269737))

(assert (=> d!61355 m!269655))

(assert (=> b!254660 m!269495))

(assert (=> b!254660 m!269517))

(declare-fun m!269739 () Bool)

(assert (=> b!254660 m!269739))

(assert (=> b!254660 m!269525))

(assert (=> b!254660 m!269495))

(declare-fun m!269741 () Bool)

(assert (=> b!254660 m!269741))

(assert (=> b!254421 d!61355))

(declare-fun d!61357 () Bool)

(declare-fun lt!127553 () (_ BitVec 32))

(assert (=> d!61357 (and (bvsge lt!127553 #b00000000000000000000000000000000) (bvsle lt!127553 (bvsub (size!6238 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun e!165063 () (_ BitVec 32))

(assert (=> d!61357 (= lt!127553 e!165063)))

(declare-fun c!42964 () Bool)

(assert (=> d!61357 (= c!42964 (bvsge #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))))))

(assert (=> d!61357 (and (bvsle #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6238 (_keys!6849 thiss!1504)) (size!6238 lt!127380)))))

(assert (=> d!61357 (= (arrayCountValidKeys!0 lt!127380 #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) lt!127553)))

(declare-fun b!254661 () Bool)

(declare-fun e!165064 () (_ BitVec 32))

(declare-fun call!24032 () (_ BitVec 32))

(assert (=> b!254661 (= e!165064 (bvadd #b00000000000000000000000000000001 call!24032))))

(declare-fun b!254662 () Bool)

(assert (=> b!254662 (= e!165063 #b00000000000000000000000000000000)))

(declare-fun b!254663 () Bool)

(assert (=> b!254663 (= e!165064 call!24032)))

(declare-fun bm!24029 () Bool)

(assert (=> bm!24029 (= call!24032 (arrayCountValidKeys!0 lt!127380 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun b!254664 () Bool)

(assert (=> b!254664 (= e!165063 e!165064)))

(declare-fun c!42965 () Bool)

(assert (=> b!254664 (= c!42965 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(assert (= (and d!61357 c!42964) b!254662))

(assert (= (and d!61357 (not c!42964)) b!254664))

(assert (= (and b!254664 c!42965) b!254661))

(assert (= (and b!254664 (not c!42965)) b!254663))

(assert (= (or b!254661 b!254663) bm!24029))

(declare-fun m!269743 () Bool)

(assert (=> bm!24029 m!269743))

(declare-fun m!269745 () Bool)

(assert (=> b!254664 m!269745))

(assert (=> b!254664 m!269745))

(declare-fun m!269747 () Bool)

(assert (=> b!254664 m!269747))

(assert (=> b!254421 d!61357))

(declare-fun d!61359 () Bool)

(declare-fun e!165067 () Bool)

(assert (=> d!61359 e!165067))

(declare-fun res!124629 () Bool)

(assert (=> d!61359 (=> (not res!124629) (not e!165067))))

(declare-fun lt!127562 () ListLongMap!3743)

(assert (=> d!61359 (= res!124629 (contains!1822 lt!127562 (_1!2431 (tuple2!4841 key!932 v!346))))))

(declare-fun lt!127564 () List!3744)

(assert (=> d!61359 (= lt!127562 (ListLongMap!3744 lt!127564))))

(declare-fun lt!127563 () Unit!7855)

(declare-fun lt!127565 () Unit!7855)

(assert (=> d!61359 (= lt!127563 lt!127565)))

(assert (=> d!61359 (= (getValueByKey!303 lt!127564 (_1!2431 (tuple2!4841 key!932 v!346))) (Some!308 (_2!2431 (tuple2!4841 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!162 (List!3744 (_ BitVec 64) V!8385) Unit!7855)

(assert (=> d!61359 (= lt!127565 (lemmaContainsTupThenGetReturnValue!162 lt!127564 (_1!2431 (tuple2!4841 key!932 v!346)) (_2!2431 (tuple2!4841 key!932 v!346))))))

(declare-fun insertStrictlySorted!165 (List!3744 (_ BitVec 64) V!8385) List!3744)

(assert (=> d!61359 (= lt!127564 (insertStrictlySorted!165 (toList!1887 lt!127376) (_1!2431 (tuple2!4841 key!932 v!346)) (_2!2431 (tuple2!4841 key!932 v!346))))))

(assert (=> d!61359 (= (+!680 lt!127376 (tuple2!4841 key!932 v!346)) lt!127562)))

(declare-fun b!254669 () Bool)

(declare-fun res!124630 () Bool)

(assert (=> b!254669 (=> (not res!124630) (not e!165067))))

(assert (=> b!254669 (= res!124630 (= (getValueByKey!303 (toList!1887 lt!127562) (_1!2431 (tuple2!4841 key!932 v!346))) (Some!308 (_2!2431 (tuple2!4841 key!932 v!346)))))))

(declare-fun b!254670 () Bool)

(declare-fun contains!1823 (List!3744 tuple2!4840) Bool)

(assert (=> b!254670 (= e!165067 (contains!1823 (toList!1887 lt!127562) (tuple2!4841 key!932 v!346)))))

(assert (= (and d!61359 res!124629) b!254669))

(assert (= (and b!254669 res!124630) b!254670))

(declare-fun m!269749 () Bool)

(assert (=> d!61359 m!269749))

(declare-fun m!269751 () Bool)

(assert (=> d!61359 m!269751))

(declare-fun m!269753 () Bool)

(assert (=> d!61359 m!269753))

(declare-fun m!269755 () Bool)

(assert (=> d!61359 m!269755))

(declare-fun m!269757 () Bool)

(assert (=> b!254669 m!269757))

(declare-fun m!269759 () Bool)

(assert (=> b!254670 m!269759))

(assert (=> b!254421 d!61359))

(declare-fun b!254681 () Bool)

(declare-fun e!165078 () Bool)

(declare-fun e!165076 () Bool)

(assert (=> b!254681 (= e!165078 e!165076)))

(declare-fun c!42968 () Bool)

(assert (=> b!254681 (= c!42968 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun d!61361 () Bool)

(declare-fun res!124639 () Bool)

(declare-fun e!165077 () Bool)

(assert (=> d!61361 (=> res!124639 e!165077)))

(assert (=> d!61361 (= res!124639 (bvsge #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(assert (=> d!61361 (= (arrayNoDuplicates!0 lt!127380 #b00000000000000000000000000000000 Nil!3742) e!165077)))

(declare-fun b!254682 () Bool)

(assert (=> b!254682 (= e!165077 e!165078)))

(declare-fun res!124637 () Bool)

(assert (=> b!254682 (=> (not res!124637) (not e!165078))))

(declare-fun e!165079 () Bool)

(assert (=> b!254682 (= res!124637 (not e!165079))))

(declare-fun res!124638 () Bool)

(assert (=> b!254682 (=> (not res!124638) (not e!165079))))

(assert (=> b!254682 (= res!124638 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun b!254683 () Bool)

(declare-fun call!24035 () Bool)

(assert (=> b!254683 (= e!165076 call!24035)))

(declare-fun b!254684 () Bool)

(assert (=> b!254684 (= e!165076 call!24035)))

(declare-fun b!254685 () Bool)

(declare-fun contains!1824 (List!3745 (_ BitVec 64)) Bool)

(assert (=> b!254685 (= e!165079 (contains!1824 Nil!3742 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun bm!24032 () Bool)

(assert (=> bm!24032 (= call!24035 (arrayNoDuplicates!0 lt!127380 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42968 (Cons!3741 (select (arr!5890 lt!127380) #b00000000000000000000000000000000) Nil!3742) Nil!3742)))))

(assert (= (and d!61361 (not res!124639)) b!254682))

(assert (= (and b!254682 res!124638) b!254685))

(assert (= (and b!254682 res!124637) b!254681))

(assert (= (and b!254681 c!42968) b!254683))

(assert (= (and b!254681 (not c!42968)) b!254684))

(assert (= (or b!254683 b!254684) bm!24032))

(assert (=> b!254681 m!269745))

(assert (=> b!254681 m!269745))

(assert (=> b!254681 m!269747))

(assert (=> b!254682 m!269745))

(assert (=> b!254682 m!269745))

(assert (=> b!254682 m!269747))

(assert (=> b!254685 m!269745))

(assert (=> b!254685 m!269745))

(declare-fun m!269761 () Bool)

(assert (=> b!254685 m!269761))

(assert (=> bm!24032 m!269745))

(declare-fun m!269763 () Bool)

(assert (=> bm!24032 m!269763))

(assert (=> b!254421 d!61361))

(declare-fun d!61363 () Bool)

(declare-fun e!165082 () Bool)

(assert (=> d!61363 e!165082))

(declare-fun res!124642 () Bool)

(assert (=> d!61363 (=> (not res!124642) (not e!165082))))

(assert (=> d!61363 (= res!124642 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504)))))))

(declare-fun lt!127568 () Unit!7855)

(declare-fun choose!41 (array!12431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3745) Unit!7855)

(assert (=> d!61363 (= lt!127568 (choose!41 (_keys!6849 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3742))))

(assert (=> d!61363 (bvslt (size!6238 (_keys!6849 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61363 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6849 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3742) lt!127568)))

(declare-fun b!254688 () Bool)

(assert (=> b!254688 (= e!165082 (arrayNoDuplicates!0 (array!12432 (store (arr!5890 (_keys!6849 thiss!1504)) index!297 key!932) (size!6238 (_keys!6849 thiss!1504))) #b00000000000000000000000000000000 Nil!3742))))

(assert (= (and d!61363 res!124642) b!254688))

(declare-fun m!269765 () Bool)

(assert (=> d!61363 m!269765))

(assert (=> b!254688 m!269525))

(declare-fun m!269767 () Bool)

(assert (=> b!254688 m!269767))

(assert (=> b!254421 d!61363))

(declare-fun b!254697 () Bool)

(declare-fun e!165090 () Bool)

(declare-fun e!165091 () Bool)

(assert (=> b!254697 (= e!165090 e!165091)))

(declare-fun lt!127576 () (_ BitVec 64))

(assert (=> b!254697 (= lt!127576 (select (arr!5890 lt!127380) #b00000000000000000000000000000000))))

(declare-fun lt!127577 () Unit!7855)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12431 (_ BitVec 64) (_ BitVec 32)) Unit!7855)

(assert (=> b!254697 (= lt!127577 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127380 lt!127576 #b00000000000000000000000000000000))))

(assert (=> b!254697 (arrayContainsKey!0 lt!127380 lt!127576 #b00000000000000000000000000000000)))

(declare-fun lt!127575 () Unit!7855)

(assert (=> b!254697 (= lt!127575 lt!127577)))

(declare-fun res!124647 () Bool)

(assert (=> b!254697 (= res!124647 (= (seekEntryOrOpen!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000) lt!127380 (mask!10943 thiss!1504)) (Found!1148 #b00000000000000000000000000000000)))))

(assert (=> b!254697 (=> (not res!124647) (not e!165091))))

(declare-fun b!254698 () Bool)

(declare-fun call!24038 () Bool)

(assert (=> b!254698 (= e!165091 call!24038)))

(declare-fun d!61365 () Bool)

(declare-fun res!124648 () Bool)

(declare-fun e!165089 () Bool)

(assert (=> d!61365 (=> res!124648 e!165089)))

(assert (=> d!61365 (= res!124648 (bvsge #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(assert (=> d!61365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127380 (mask!10943 thiss!1504)) e!165089)))

(declare-fun b!254699 () Bool)

(assert (=> b!254699 (= e!165090 call!24038)))

(declare-fun bm!24035 () Bool)

(assert (=> bm!24035 (= call!24038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127380 (mask!10943 thiss!1504)))))

(declare-fun b!254700 () Bool)

(assert (=> b!254700 (= e!165089 e!165090)))

(declare-fun c!42971 () Bool)

(assert (=> b!254700 (= c!42971 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(assert (= (and d!61365 (not res!124648)) b!254700))

(assert (= (and b!254700 c!42971) b!254697))

(assert (= (and b!254700 (not c!42971)) b!254699))

(assert (= (and b!254697 res!124647) b!254698))

(assert (= (or b!254698 b!254699) bm!24035))

(assert (=> b!254697 m!269745))

(declare-fun m!269769 () Bool)

(assert (=> b!254697 m!269769))

(declare-fun m!269771 () Bool)

(assert (=> b!254697 m!269771))

(assert (=> b!254697 m!269745))

(declare-fun m!269773 () Bool)

(assert (=> b!254697 m!269773))

(declare-fun m!269775 () Bool)

(assert (=> bm!24035 m!269775))

(assert (=> b!254700 m!269745))

(assert (=> b!254700 m!269745))

(assert (=> b!254700 m!269747))

(assert (=> b!254421 d!61365))

(declare-fun b!254711 () Bool)

(declare-fun e!165096 () Bool)

(assert (=> b!254711 (= e!165096 (bvslt (size!6238 (_keys!6849 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!254709 () Bool)

(declare-fun res!124660 () Bool)

(assert (=> b!254709 (=> (not res!124660) (not e!165096))))

(assert (=> b!254709 (= res!124660 (not (validKeyInArray!0 (select (arr!5890 (_keys!6849 thiss!1504)) index!297))))))

(declare-fun b!254712 () Bool)

(declare-fun e!165097 () Bool)

(assert (=> b!254712 (= e!165097 (= (arrayCountValidKeys!0 (array!12432 (store (arr!5890 (_keys!6849 thiss!1504)) index!297 key!932) (size!6238 (_keys!6849 thiss!1504))) #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 (size!6238 (_keys!6849 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!254710 () Bool)

(declare-fun res!124659 () Bool)

(assert (=> b!254710 (=> (not res!124659) (not e!165096))))

(assert (=> b!254710 (= res!124659 (validKeyInArray!0 key!932))))

(declare-fun d!61367 () Bool)

(assert (=> d!61367 e!165097))

(declare-fun res!124658 () Bool)

(assert (=> d!61367 (=> (not res!124658) (not e!165097))))

(assert (=> d!61367 (= res!124658 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504)))))))

(declare-fun lt!127580 () Unit!7855)

(declare-fun choose!1 (array!12431 (_ BitVec 32) (_ BitVec 64)) Unit!7855)

(assert (=> d!61367 (= lt!127580 (choose!1 (_keys!6849 thiss!1504) index!297 key!932))))

(assert (=> d!61367 e!165096))

(declare-fun res!124657 () Bool)

(assert (=> d!61367 (=> (not res!124657) (not e!165096))))

(assert (=> d!61367 (= res!124657 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504)))))))

(assert (=> d!61367 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6849 thiss!1504) index!297 key!932) lt!127580)))

(assert (= (and d!61367 res!124657) b!254709))

(assert (= (and b!254709 res!124660) b!254710))

(assert (= (and b!254710 res!124659) b!254711))

(assert (= (and d!61367 res!124658) b!254712))

(declare-fun m!269777 () Bool)

(assert (=> b!254709 m!269777))

(assert (=> b!254709 m!269777))

(declare-fun m!269779 () Bool)

(assert (=> b!254709 m!269779))

(assert (=> b!254712 m!269525))

(declare-fun m!269781 () Bool)

(assert (=> b!254712 m!269781))

(assert (=> b!254712 m!269527))

(declare-fun m!269783 () Bool)

(assert (=> b!254710 m!269783))

(declare-fun m!269785 () Bool)

(assert (=> d!61367 m!269785))

(assert (=> b!254421 d!61367))

(declare-fun bm!24036 () Bool)

(declare-fun call!24040 () ListLongMap!3743)

(declare-fun call!24039 () ListLongMap!3743)

(assert (=> bm!24036 (= call!24040 call!24039)))

(declare-fun b!254713 () Bool)

(declare-fun e!165102 () Bool)

(assert (=> b!254713 (= e!165102 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun bm!24037 () Bool)

(declare-fun call!24045 () ListLongMap!3743)

(declare-fun call!24041 () ListLongMap!3743)

(assert (=> bm!24037 (= call!24045 call!24041)))

(declare-fun b!254714 () Bool)

(declare-fun e!165099 () ListLongMap!3743)

(assert (=> b!254714 (= e!165099 call!24045)))

(declare-fun b!254715 () Bool)

(declare-fun e!165098 () Bool)

(declare-fun lt!127590 () ListLongMap!3743)

(assert (=> b!254715 (= e!165098 (= (apply!247 lt!127590 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4537 thiss!1504)))))

(declare-fun b!254716 () Bool)

(declare-fun res!124666 () Bool)

(declare-fun e!165108 () Bool)

(assert (=> b!254716 (=> (not res!124666) (not e!165108))))

(declare-fun e!165109 () Bool)

(assert (=> b!254716 (= res!124666 e!165109)))

(declare-fun c!42977 () Bool)

(assert (=> b!254716 (= c!42977 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!254717 () Bool)

(declare-fun e!165104 () Unit!7855)

(declare-fun Unit!7866 () Unit!7855)

(assert (=> b!254717 (= e!165104 Unit!7866)))

(declare-fun b!254718 () Bool)

(declare-fun res!124668 () Bool)

(assert (=> b!254718 (=> (not res!124668) (not e!165108))))

(declare-fun e!165105 () Bool)

(assert (=> b!254718 (= res!124668 e!165105)))

(declare-fun res!124665 () Bool)

(assert (=> b!254718 (=> res!124665 e!165105)))

(declare-fun e!165100 () Bool)

(assert (=> b!254718 (= res!124665 (not e!165100))))

(declare-fun res!124662 () Bool)

(assert (=> b!254718 (=> (not res!124662) (not e!165100))))

(assert (=> b!254718 (= res!124662 (bvslt #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(declare-fun d!61369 () Bool)

(assert (=> d!61369 e!165108))

(declare-fun res!124669 () Bool)

(assert (=> d!61369 (=> (not res!124669) (not e!165108))))

(assert (=> d!61369 (= res!124669 (or (bvsge #b00000000000000000000000000000000 (size!6238 lt!127380)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 lt!127380)))))))

(declare-fun lt!127600 () ListLongMap!3743)

(assert (=> d!61369 (= lt!127590 lt!127600)))

(declare-fun lt!127582 () Unit!7855)

(assert (=> d!61369 (= lt!127582 e!165104)))

(declare-fun c!42975 () Bool)

(assert (=> d!61369 (= c!42975 e!165102)))

(declare-fun res!124661 () Bool)

(assert (=> d!61369 (=> (not res!124661) (not e!165102))))

(assert (=> d!61369 (= res!124661 (bvslt #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(declare-fun e!165106 () ListLongMap!3743)

(assert (=> d!61369 (= lt!127600 e!165106)))

(declare-fun c!42976 () Bool)

(assert (=> d!61369 (= c!42976 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61369 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61369 (= (getCurrentListMap!1396 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127590)))

(declare-fun c!42972 () Bool)

(declare-fun bm!24038 () Bool)

(declare-fun call!24043 () ListLongMap!3743)

(assert (=> bm!24038 (= call!24041 (+!680 (ite c!42976 call!24039 (ite c!42972 call!24040 call!24043)) (ite (or c!42976 c!42972) (tuple2!4841 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4537 thiss!1504)) (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504)))))))

(declare-fun b!254719 () Bool)

(declare-fun e!165103 () Bool)

(assert (=> b!254719 (= e!165108 e!165103)))

(declare-fun c!42973 () Bool)

(assert (=> b!254719 (= c!42973 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24039 () Bool)

(assert (=> bm!24039 (= call!24043 call!24040)))

(declare-fun bm!24040 () Bool)

(assert (=> bm!24040 (= call!24039 (getCurrentListMapNoExtraKeys!563 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254720 () Bool)

(declare-fun call!24044 () Bool)

(assert (=> b!254720 (= e!165103 (not call!24044))))

(declare-fun b!254721 () Bool)

(declare-fun e!165101 () Bool)

(assert (=> b!254721 (= e!165101 (= (apply!247 lt!127590 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)) (get!3026 (select (arr!5889 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4696 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6237 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))))))))

(assert (=> b!254721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(declare-fun bm!24041 () Bool)

(declare-fun call!24042 () Bool)

(assert (=> bm!24041 (= call!24042 (contains!1822 lt!127590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254722 () Bool)

(declare-fun lt!127584 () Unit!7855)

(assert (=> b!254722 (= e!165104 lt!127584)))

(declare-fun lt!127588 () ListLongMap!3743)

(assert (=> b!254722 (= lt!127588 (getCurrentListMapNoExtraKeys!563 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127596 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127593 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127593 (select (arr!5890 lt!127380) #b00000000000000000000000000000000))))

(declare-fun lt!127599 () Unit!7855)

(assert (=> b!254722 (= lt!127599 (addStillContains!223 lt!127588 lt!127596 (zeroValue!4537 thiss!1504) lt!127593))))

(assert (=> b!254722 (contains!1822 (+!680 lt!127588 (tuple2!4841 lt!127596 (zeroValue!4537 thiss!1504))) lt!127593)))

(declare-fun lt!127581 () Unit!7855)

(assert (=> b!254722 (= lt!127581 lt!127599)))

(declare-fun lt!127583 () ListLongMap!3743)

(assert (=> b!254722 (= lt!127583 (getCurrentListMapNoExtraKeys!563 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127601 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127601 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127594 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127594 (select (arr!5890 lt!127380) #b00000000000000000000000000000000))))

(declare-fun lt!127602 () Unit!7855)

(assert (=> b!254722 (= lt!127602 (addApplyDifferent!223 lt!127583 lt!127601 (minValue!4537 thiss!1504) lt!127594))))

(assert (=> b!254722 (= (apply!247 (+!680 lt!127583 (tuple2!4841 lt!127601 (minValue!4537 thiss!1504))) lt!127594) (apply!247 lt!127583 lt!127594))))

(declare-fun lt!127592 () Unit!7855)

(assert (=> b!254722 (= lt!127592 lt!127602)))

(declare-fun lt!127598 () ListLongMap!3743)

(assert (=> b!254722 (= lt!127598 (getCurrentListMapNoExtraKeys!563 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127585 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127595 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127595 (select (arr!5890 lt!127380) #b00000000000000000000000000000000))))

(declare-fun lt!127589 () Unit!7855)

(assert (=> b!254722 (= lt!127589 (addApplyDifferent!223 lt!127598 lt!127585 (zeroValue!4537 thiss!1504) lt!127595))))

(assert (=> b!254722 (= (apply!247 (+!680 lt!127598 (tuple2!4841 lt!127585 (zeroValue!4537 thiss!1504))) lt!127595) (apply!247 lt!127598 lt!127595))))

(declare-fun lt!127591 () Unit!7855)

(assert (=> b!254722 (= lt!127591 lt!127589)))

(declare-fun lt!127586 () ListLongMap!3743)

(assert (=> b!254722 (= lt!127586 (getCurrentListMapNoExtraKeys!563 lt!127380 (array!12430 (store (arr!5889 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6237 (_values!4679 thiss!1504))) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127587 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127597 () (_ BitVec 64))

(assert (=> b!254722 (= lt!127597 (select (arr!5890 lt!127380) #b00000000000000000000000000000000))))

(assert (=> b!254722 (= lt!127584 (addApplyDifferent!223 lt!127586 lt!127587 (minValue!4537 thiss!1504) lt!127597))))

(assert (=> b!254722 (= (apply!247 (+!680 lt!127586 (tuple2!4841 lt!127587 (minValue!4537 thiss!1504))) lt!127597) (apply!247 lt!127586 lt!127597))))

(declare-fun b!254723 () Bool)

(assert (=> b!254723 (= e!165099 call!24043)))

(declare-fun b!254724 () Bool)

(declare-fun e!165110 () ListLongMap!3743)

(assert (=> b!254724 (= e!165110 call!24045)))

(declare-fun b!254725 () Bool)

(assert (=> b!254725 (= e!165109 (not call!24042))))

(declare-fun b!254726 () Bool)

(assert (=> b!254726 (= e!165106 e!165110)))

(assert (=> b!254726 (= c!42972 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!254727 () Bool)

(declare-fun c!42974 () Bool)

(assert (=> b!254727 (= c!42974 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254727 (= e!165110 e!165099)))

(declare-fun b!254728 () Bool)

(assert (=> b!254728 (= e!165106 (+!680 call!24041 (tuple2!4841 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504))))))

(declare-fun b!254729 () Bool)

(assert (=> b!254729 (= e!165100 (validKeyInArray!0 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(declare-fun bm!24042 () Bool)

(assert (=> bm!24042 (= call!24044 (contains!1822 lt!127590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254730 () Bool)

(assert (=> b!254730 (= e!165109 e!165098)))

(declare-fun res!124664 () Bool)

(assert (=> b!254730 (= res!124664 call!24042)))

(assert (=> b!254730 (=> (not res!124664) (not e!165098))))

(declare-fun b!254731 () Bool)

(declare-fun e!165107 () Bool)

(assert (=> b!254731 (= e!165107 (= (apply!247 lt!127590 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4537 thiss!1504)))))

(declare-fun b!254732 () Bool)

(assert (=> b!254732 (= e!165105 e!165101)))

(declare-fun res!124663 () Bool)

(assert (=> b!254732 (=> (not res!124663) (not e!165101))))

(assert (=> b!254732 (= res!124663 (contains!1822 lt!127590 (select (arr!5890 lt!127380) #b00000000000000000000000000000000)))))

(assert (=> b!254732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6238 lt!127380)))))

(declare-fun b!254733 () Bool)

(assert (=> b!254733 (= e!165103 e!165107)))

(declare-fun res!124667 () Bool)

(assert (=> b!254733 (= res!124667 call!24044)))

(assert (=> b!254733 (=> (not res!124667) (not e!165107))))

(assert (= (and d!61369 c!42976) b!254728))

(assert (= (and d!61369 (not c!42976)) b!254726))

(assert (= (and b!254726 c!42972) b!254724))

(assert (= (and b!254726 (not c!42972)) b!254727))

(assert (= (and b!254727 c!42974) b!254714))

(assert (= (and b!254727 (not c!42974)) b!254723))

(assert (= (or b!254714 b!254723) bm!24039))

(assert (= (or b!254724 bm!24039) bm!24036))

(assert (= (or b!254724 b!254714) bm!24037))

(assert (= (or b!254728 bm!24036) bm!24040))

(assert (= (or b!254728 bm!24037) bm!24038))

(assert (= (and d!61369 res!124661) b!254713))

(assert (= (and d!61369 c!42975) b!254722))

(assert (= (and d!61369 (not c!42975)) b!254717))

(assert (= (and d!61369 res!124669) b!254718))

(assert (= (and b!254718 res!124662) b!254729))

(assert (= (and b!254718 (not res!124665)) b!254732))

(assert (= (and b!254732 res!124663) b!254721))

(assert (= (and b!254718 res!124668) b!254716))

(assert (= (and b!254716 c!42977) b!254730))

(assert (= (and b!254716 (not c!42977)) b!254725))

(assert (= (and b!254730 res!124664) b!254715))

(assert (= (or b!254730 b!254725) bm!24041))

(assert (= (and b!254716 res!124666) b!254719))

(assert (= (and b!254719 c!42973) b!254733))

(assert (= (and b!254719 (not c!42973)) b!254720))

(assert (= (and b!254733 res!124667) b!254731))

(assert (= (or b!254733 b!254720) bm!24042))

(declare-fun b_lambda!8115 () Bool)

(assert (=> (not b_lambda!8115) (not b!254721)))

(assert (=> b!254721 t!8785))

(declare-fun b_and!13715 () Bool)

(assert (= b_and!13713 (and (=> t!8785 result!5335) b_and!13715)))

(declare-fun m!269787 () Bool)

(assert (=> bm!24040 m!269787))

(assert (=> b!254713 m!269745))

(assert (=> b!254713 m!269745))

(assert (=> b!254713 m!269747))

(assert (=> b!254732 m!269745))

(assert (=> b!254732 m!269745))

(declare-fun m!269789 () Bool)

(assert (=> b!254732 m!269789))

(assert (=> d!61369 m!269655))

(declare-fun m!269791 () Bool)

(assert (=> b!254731 m!269791))

(declare-fun m!269793 () Bool)

(assert (=> bm!24038 m!269793))

(declare-fun m!269795 () Bool)

(assert (=> b!254722 m!269795))

(declare-fun m!269797 () Bool)

(assert (=> b!254722 m!269797))

(declare-fun m!269799 () Bool)

(assert (=> b!254722 m!269799))

(declare-fun m!269801 () Bool)

(assert (=> b!254722 m!269801))

(declare-fun m!269803 () Bool)

(assert (=> b!254722 m!269803))

(declare-fun m!269805 () Bool)

(assert (=> b!254722 m!269805))

(declare-fun m!269807 () Bool)

(assert (=> b!254722 m!269807))

(declare-fun m!269809 () Bool)

(assert (=> b!254722 m!269809))

(declare-fun m!269811 () Bool)

(assert (=> b!254722 m!269811))

(assert (=> b!254722 m!269745))

(assert (=> b!254722 m!269801))

(declare-fun m!269813 () Bool)

(assert (=> b!254722 m!269813))

(declare-fun m!269815 () Bool)

(assert (=> b!254722 m!269815))

(declare-fun m!269817 () Bool)

(assert (=> b!254722 m!269817))

(declare-fun m!269819 () Bool)

(assert (=> b!254722 m!269819))

(declare-fun m!269821 () Bool)

(assert (=> b!254722 m!269821))

(assert (=> b!254722 m!269787))

(assert (=> b!254722 m!269813))

(assert (=> b!254722 m!269809))

(declare-fun m!269823 () Bool)

(assert (=> b!254722 m!269823))

(assert (=> b!254722 m!269805))

(declare-fun m!269825 () Bool)

(assert (=> bm!24041 m!269825))

(declare-fun m!269827 () Bool)

(assert (=> b!254728 m!269827))

(declare-fun m!269829 () Bool)

(assert (=> b!254721 m!269829))

(assert (=> b!254721 m!269725))

(declare-fun m!269831 () Bool)

(assert (=> b!254721 m!269831))

(assert (=> b!254721 m!269745))

(declare-fun m!269833 () Bool)

(assert (=> b!254721 m!269833))

(assert (=> b!254721 m!269829))

(assert (=> b!254721 m!269745))

(assert (=> b!254721 m!269725))

(declare-fun m!269835 () Bool)

(assert (=> bm!24042 m!269835))

(declare-fun m!269837 () Bool)

(assert (=> b!254715 m!269837))

(assert (=> b!254729 m!269745))

(assert (=> b!254729 m!269745))

(assert (=> b!254729 m!269747))

(assert (=> b!254421 d!61369))

(declare-fun d!61371 () Bool)

(declare-fun res!124674 () Bool)

(declare-fun e!165115 () Bool)

(assert (=> d!61371 (=> res!124674 e!165115)))

(assert (=> d!61371 (= res!124674 (= (select (arr!5890 (_keys!6849 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61371 (= (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 #b00000000000000000000000000000000) e!165115)))

(declare-fun b!254738 () Bool)

(declare-fun e!165116 () Bool)

(assert (=> b!254738 (= e!165115 e!165116)))

(declare-fun res!124675 () Bool)

(assert (=> b!254738 (=> (not res!124675) (not e!165116))))

(assert (=> b!254738 (= res!124675 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun b!254739 () Bool)

(assert (=> b!254739 (= e!165116 (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61371 (not res!124674)) b!254738))

(assert (= (and b!254738 res!124675) b!254739))

(assert (=> d!61371 m!269679))

(declare-fun m!269839 () Bool)

(assert (=> b!254739 m!269839))

(assert (=> b!254421 d!61371))

(declare-fun d!61373 () Bool)

(declare-fun e!165119 () Bool)

(assert (=> d!61373 e!165119))

(declare-fun res!124678 () Bool)

(assert (=> d!61373 (=> (not res!124678) (not e!165119))))

(assert (=> d!61373 (= res!124678 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6238 (_keys!6849 thiss!1504)))))))

(declare-fun lt!127605 () Unit!7855)

(declare-fun choose!102 ((_ BitVec 64) array!12431 (_ BitVec 32) (_ BitVec 32)) Unit!7855)

(assert (=> d!61373 (= lt!127605 (choose!102 key!932 (_keys!6849 thiss!1504) index!297 (mask!10943 thiss!1504)))))

(assert (=> d!61373 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61373 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) index!297 (mask!10943 thiss!1504)) lt!127605)))

(declare-fun b!254742 () Bool)

(assert (=> b!254742 (= e!165119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12432 (store (arr!5890 (_keys!6849 thiss!1504)) index!297 key!932) (size!6238 (_keys!6849 thiss!1504))) (mask!10943 thiss!1504)))))

(assert (= (and d!61373 res!124678) b!254742))

(declare-fun m!269841 () Bool)

(assert (=> d!61373 m!269841))

(assert (=> d!61373 m!269655))

(assert (=> b!254742 m!269525))

(declare-fun m!269843 () Bool)

(assert (=> b!254742 m!269843))

(assert (=> b!254421 d!61373))

(assert (=> bm!23991 d!61371))

(declare-fun b!254755 () Bool)

(declare-fun e!165126 () SeekEntryResult!1148)

(declare-fun lt!127612 () SeekEntryResult!1148)

(assert (=> b!254755 (= e!165126 (Found!1148 (index!6764 lt!127612)))))

(declare-fun b!254756 () Bool)

(declare-fun c!42986 () Bool)

(declare-fun lt!127613 () (_ BitVec 64))

(assert (=> b!254756 (= c!42986 (= lt!127613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165128 () SeekEntryResult!1148)

(assert (=> b!254756 (= e!165126 e!165128)))

(declare-fun b!254757 () Bool)

(assert (=> b!254757 (= e!165128 (MissingZero!1148 (index!6764 lt!127612)))))

(declare-fun b!254758 () Bool)

(declare-fun e!165127 () SeekEntryResult!1148)

(assert (=> b!254758 (= e!165127 Undefined!1148)))

(declare-fun b!254759 () Bool)

(assert (=> b!254759 (= e!165127 e!165126)))

(assert (=> b!254759 (= lt!127613 (select (arr!5890 (_keys!6849 thiss!1504)) (index!6764 lt!127612)))))

(declare-fun c!42985 () Bool)

(assert (=> b!254759 (= c!42985 (= lt!127613 key!932))))

(declare-fun b!254760 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12431 (_ BitVec 32)) SeekEntryResult!1148)

(assert (=> b!254760 (= e!165128 (seekKeyOrZeroReturnVacant!0 (x!24871 lt!127612) (index!6764 lt!127612) (index!6764 lt!127612) key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(declare-fun d!61375 () Bool)

(declare-fun lt!127614 () SeekEntryResult!1148)

(assert (=> d!61375 (and (or ((_ is Undefined!1148) lt!127614) (not ((_ is Found!1148) lt!127614)) (and (bvsge (index!6763 lt!127614) #b00000000000000000000000000000000) (bvslt (index!6763 lt!127614) (size!6238 (_keys!6849 thiss!1504))))) (or ((_ is Undefined!1148) lt!127614) ((_ is Found!1148) lt!127614) (not ((_ is MissingZero!1148) lt!127614)) (and (bvsge (index!6762 lt!127614) #b00000000000000000000000000000000) (bvslt (index!6762 lt!127614) (size!6238 (_keys!6849 thiss!1504))))) (or ((_ is Undefined!1148) lt!127614) ((_ is Found!1148) lt!127614) ((_ is MissingZero!1148) lt!127614) (not ((_ is MissingVacant!1148) lt!127614)) (and (bvsge (index!6765 lt!127614) #b00000000000000000000000000000000) (bvslt (index!6765 lt!127614) (size!6238 (_keys!6849 thiss!1504))))) (or ((_ is Undefined!1148) lt!127614) (ite ((_ is Found!1148) lt!127614) (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6763 lt!127614)) key!932) (ite ((_ is MissingZero!1148) lt!127614) (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6762 lt!127614)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1148) lt!127614) (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6765 lt!127614)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61375 (= lt!127614 e!165127)))

(declare-fun c!42984 () Bool)

(assert (=> d!61375 (= c!42984 (and ((_ is Intermediate!1148) lt!127612) (undefined!1960 lt!127612)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12431 (_ BitVec 32)) SeekEntryResult!1148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61375 (= lt!127612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10943 thiss!1504)) key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(assert (=> d!61375 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61375 (= (seekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)) lt!127614)))

(assert (= (and d!61375 c!42984) b!254758))

(assert (= (and d!61375 (not c!42984)) b!254759))

(assert (= (and b!254759 c!42985) b!254755))

(assert (= (and b!254759 (not c!42985)) b!254756))

(assert (= (and b!254756 c!42986) b!254757))

(assert (= (and b!254756 (not c!42986)) b!254760))

(declare-fun m!269845 () Bool)

(assert (=> b!254759 m!269845))

(declare-fun m!269847 () Bool)

(assert (=> b!254760 m!269847))

(declare-fun m!269849 () Bool)

(assert (=> d!61375 m!269849))

(declare-fun m!269851 () Bool)

(assert (=> d!61375 m!269851))

(assert (=> d!61375 m!269655))

(assert (=> d!61375 m!269849))

(declare-fun m!269853 () Bool)

(assert (=> d!61375 m!269853))

(declare-fun m!269855 () Bool)

(assert (=> d!61375 m!269855))

(declare-fun m!269857 () Bool)

(assert (=> d!61375 m!269857))

(assert (=> b!254428 d!61375))

(declare-fun d!61377 () Bool)

(assert (=> d!61377 (= (inRange!0 (ite c!42912 (index!6762 lt!127381) (index!6765 lt!127381)) (mask!10943 thiss!1504)) (and (bvsge (ite c!42912 (index!6762 lt!127381) (index!6765 lt!127381)) #b00000000000000000000000000000000) (bvslt (ite c!42912 (index!6762 lt!127381) (index!6765 lt!127381)) (bvadd (mask!10943 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23992 d!61377))

(declare-fun b!254777 () Bool)

(declare-fun res!124688 () Bool)

(declare-fun e!165137 () Bool)

(assert (=> b!254777 (=> (not res!124688) (not e!165137))))

(declare-fun lt!127620 () SeekEntryResult!1148)

(assert (=> b!254777 (= res!124688 (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6765 lt!127620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254777 (and (bvsge (index!6765 lt!127620) #b00000000000000000000000000000000) (bvslt (index!6765 lt!127620) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun b!254778 () Bool)

(declare-fun e!165139 () Bool)

(declare-fun e!165138 () Bool)

(assert (=> b!254778 (= e!165139 e!165138)))

(declare-fun c!42991 () Bool)

(assert (=> b!254778 (= c!42991 ((_ is MissingVacant!1148) lt!127620))))

(declare-fun b!254779 () Bool)

(assert (=> b!254779 (= e!165138 ((_ is Undefined!1148) lt!127620))))

(declare-fun bm!24047 () Bool)

(declare-fun c!42992 () Bool)

(declare-fun call!24050 () Bool)

(assert (=> bm!24047 (= call!24050 (inRange!0 (ite c!42992 (index!6762 lt!127620) (index!6765 lt!127620)) (mask!10943 thiss!1504)))))

(declare-fun b!254780 () Bool)

(declare-fun e!165140 () Bool)

(assert (=> b!254780 (= e!165139 e!165140)))

(declare-fun res!124689 () Bool)

(assert (=> b!254780 (= res!124689 call!24050)))

(assert (=> b!254780 (=> (not res!124689) (not e!165140))))

(declare-fun b!254781 () Bool)

(assert (=> b!254781 (and (bvsge (index!6762 lt!127620) #b00000000000000000000000000000000) (bvslt (index!6762 lt!127620) (size!6238 (_keys!6849 thiss!1504))))))

(declare-fun res!124690 () Bool)

(assert (=> b!254781 (= res!124690 (= (select (arr!5890 (_keys!6849 thiss!1504)) (index!6762 lt!127620)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254781 (=> (not res!124690) (not e!165140))))

(declare-fun d!61379 () Bool)

(assert (=> d!61379 e!165139))

(assert (=> d!61379 (= c!42992 ((_ is MissingZero!1148) lt!127620))))

(assert (=> d!61379 (= lt!127620 (seekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) (mask!10943 thiss!1504)))))

(declare-fun lt!127619 () Unit!7855)

(declare-fun choose!1222 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7855)

(assert (=> d!61379 (= lt!127619 (choose!1222 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61379 (validMask!0 (mask!10943 thiss!1504))))

(assert (=> d!61379 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!415 (_keys!6849 thiss!1504) (_values!4679 thiss!1504) (mask!10943 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)) lt!127619)))

(declare-fun b!254782 () Bool)

(declare-fun call!24051 () Bool)

(assert (=> b!254782 (= e!165137 (not call!24051))))

(declare-fun b!254783 () Bool)

(declare-fun res!124687 () Bool)

(assert (=> b!254783 (=> (not res!124687) (not e!165137))))

(assert (=> b!254783 (= res!124687 call!24050)))

(assert (=> b!254783 (= e!165138 e!165137)))

(declare-fun bm!24048 () Bool)

(assert (=> bm!24048 (= call!24051 (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254784 () Bool)

(assert (=> b!254784 (= e!165140 (not call!24051))))

(assert (= (and d!61379 c!42992) b!254780))

(assert (= (and d!61379 (not c!42992)) b!254778))

(assert (= (and b!254780 res!124689) b!254781))

(assert (= (and b!254781 res!124690) b!254784))

(assert (= (and b!254778 c!42991) b!254783))

(assert (= (and b!254778 (not c!42991)) b!254779))

(assert (= (and b!254783 res!124687) b!254777))

(assert (= (and b!254777 res!124688) b!254782))

(assert (= (or b!254780 b!254783) bm!24047))

(assert (= (or b!254784 b!254782) bm!24048))

(declare-fun m!269859 () Bool)

(assert (=> b!254777 m!269859))

(assert (=> d!61379 m!269509))

(declare-fun m!269861 () Bool)

(assert (=> d!61379 m!269861))

(assert (=> d!61379 m!269655))

(declare-fun m!269863 () Bool)

(assert (=> bm!24047 m!269863))

(assert (=> bm!24048 m!269505))

(declare-fun m!269865 () Bool)

(assert (=> b!254781 m!269865))

(assert (=> b!254422 d!61379))

(declare-fun condMapEmpty!11154 () Bool)

(declare-fun mapDefault!11154 () ValueCell!2933)

(assert (=> mapNonEmpty!11145 (= condMapEmpty!11154 (= mapRest!11145 ((as const (Array (_ BitVec 32) ValueCell!2933)) mapDefault!11154)))))

(declare-fun e!165145 () Bool)

(declare-fun mapRes!11154 () Bool)

(assert (=> mapNonEmpty!11145 (= tp!23360 (and e!165145 mapRes!11154))))

(declare-fun mapIsEmpty!11154 () Bool)

(assert (=> mapIsEmpty!11154 mapRes!11154))

(declare-fun b!254792 () Bool)

(assert (=> b!254792 (= e!165145 tp_is_empty!6553)))

(declare-fun b!254791 () Bool)

(declare-fun e!165146 () Bool)

(assert (=> b!254791 (= e!165146 tp_is_empty!6553)))

(declare-fun mapNonEmpty!11154 () Bool)

(declare-fun tp!23376 () Bool)

(assert (=> mapNonEmpty!11154 (= mapRes!11154 (and tp!23376 e!165146))))

(declare-fun mapValue!11154 () ValueCell!2933)

(declare-fun mapKey!11154 () (_ BitVec 32))

(declare-fun mapRest!11154 () (Array (_ BitVec 32) ValueCell!2933))

(assert (=> mapNonEmpty!11154 (= mapRest!11145 (store mapRest!11154 mapKey!11154 mapValue!11154))))

(assert (= (and mapNonEmpty!11145 condMapEmpty!11154) mapIsEmpty!11154))

(assert (= (and mapNonEmpty!11145 (not condMapEmpty!11154)) mapNonEmpty!11154))

(assert (= (and mapNonEmpty!11154 ((_ is ValueCellFull!2933) mapValue!11154)) b!254791))

(assert (= (and mapNonEmpty!11145 ((_ is ValueCellFull!2933) mapDefault!11154)) b!254792))

(declare-fun m!269867 () Bool)

(assert (=> mapNonEmpty!11154 m!269867))

(declare-fun b_lambda!8117 () Bool)

(assert (= b_lambda!8115 (or (and b!254433 b_free!6691) b_lambda!8117)))

(declare-fun b_lambda!8119 () Bool)

(assert (= b_lambda!8113 (or (and b!254433 b_free!6691) b_lambda!8119)))

(check-sat (not bm!24032) (not b!254642) (not bm!24025) (not b!254731) (not b!254565) (not b!254732) (not d!61373) (not b!254715) (not d!61355) (not bm!24048) (not b!254685) (not b!254721) (not b_lambda!8119) (not bm!24047) (not b!254760) (not b!254638) (not b!254563) (not b!254709) (not d!61337) (not mapNonEmpty!11154) (not b!254681) (not d!61379) (not b!254722) (not b!254669) (not d!61349) (not d!61367) (not b!254739) (not b!254697) (not b_next!6691) (not b_lambda!8117) (not b!254742) (not b!254657) (not bm!24038) (not b!254712) (not b!254713) (not bm!24042) (not b!254728) (not b!254664) (not bm!24028) (not b!254564) (not bm!24024) (not b!254700) (not b!254580) (not bm!24035) (not bm!24021) (not b!254660) (not bm!24040) (not b!254688) (not d!61363) (not b!254641) tp_is_empty!6553 (not bm!24041) (not bm!24023) (not d!61359) (not b!254570) (not b!254639) (not b!254625) (not d!61341) (not d!61375) (not b!254670) (not d!61369) (not b!254578) (not b!254710) (not b!254631) (not b!254623) (not bm!24029) b_and!13715 (not d!61351) (not b!254632) (not d!61339) (not b!254682) (not b!254729))
(check-sat b_and!13715 (not b_next!6691))
