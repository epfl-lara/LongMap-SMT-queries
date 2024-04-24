; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23882 () Bool)

(assert start!23882)

(declare-fun b!250367 () Bool)

(declare-fun b_free!6625 () Bool)

(declare-fun b_next!6625 () Bool)

(assert (=> b!250367 (= b_free!6625 (not b_next!6625))))

(declare-fun tp!23139 () Bool)

(declare-fun b_and!13659 () Bool)

(assert (=> b!250367 (= tp!23139 b_and!13659)))

(declare-fun b!250361 () Bool)

(declare-datatypes ((Unit!7721 0))(
  ( (Unit!7722) )
))
(declare-fun e!162360 () Unit!7721)

(declare-fun Unit!7723 () Unit!7721)

(assert (=> b!250361 (= e!162360 Unit!7723)))

(declare-fun lt!125474 () Unit!7721)

(declare-datatypes ((V!8297 0))(
  ( (V!8298 (val!3288 Int)) )
))
(declare-datatypes ((ValueCell!2900 0))(
  ( (ValueCellFull!2900 (v!5354 V!8297)) (EmptyCell!2900) )
))
(declare-datatypes ((array!12289 0))(
  ( (array!12290 (arr!5827 (Array (_ BitVec 32) ValueCell!2900)) (size!6172 (_ BitVec 32))) )
))
(declare-datatypes ((array!12291 0))(
  ( (array!12292 (arr!5828 (Array (_ BitVec 32) (_ BitVec 64))) (size!6173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3700 0))(
  ( (LongMapFixedSize!3701 (defaultEntry!4627 Int) (mask!10810 (_ BitVec 32)) (extraKeys!4364 (_ BitVec 32)) (zeroValue!4468 V!8297) (minValue!4468 V!8297) (_size!1899 (_ BitVec 32)) (_keys!6763 array!12291) (_values!4610 array!12289) (_vacant!1899 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3700)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7721)

(assert (=> b!250361 (= lt!125474 (lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> b!250361 false))

(declare-fun b!250362 () Bool)

(declare-fun lt!125471 () Unit!7721)

(assert (=> b!250362 (= e!162360 lt!125471)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!388 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7721)

(assert (=> b!250362 (= lt!125471 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(declare-fun c!42070 () Bool)

(declare-datatypes ((SeekEntryResult!1087 0))(
  ( (MissingZero!1087 (index!6518 (_ BitVec 32))) (Found!1087 (index!6519 (_ BitVec 32))) (Intermediate!1087 (undefined!1899 Bool) (index!6520 (_ BitVec 32)) (x!24637 (_ BitVec 32))) (Undefined!1087) (MissingVacant!1087 (index!6521 (_ BitVec 32))) )
))
(declare-fun lt!125473 () SeekEntryResult!1087)

(get-info :version)

(assert (=> b!250362 (= c!42070 ((_ is MissingZero!1087) lt!125473))))

(declare-fun e!162361 () Bool)

(assert (=> b!250362 e!162361))

(declare-fun mapIsEmpty!11023 () Bool)

(declare-fun mapRes!11023 () Bool)

(assert (=> mapIsEmpty!11023 mapRes!11023))

(declare-fun bm!23503 () Bool)

(declare-fun call!23507 () Bool)

(declare-fun arrayContainsKey!0 (array!12291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23503 (= call!23507 (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250363 () Bool)

(declare-fun res!122621 () Bool)

(declare-fun e!162369 () Bool)

(assert (=> b!250363 (=> (not res!122621) (not e!162369))))

(declare-fun call!23506 () Bool)

(assert (=> b!250363 (= res!122621 call!23506)))

(assert (=> b!250363 (= e!162361 e!162369)))

(declare-fun b!250364 () Bool)

(declare-fun c!42069 () Bool)

(assert (=> b!250364 (= c!42069 ((_ is MissingVacant!1087) lt!125473))))

(declare-fun e!162365 () Bool)

(assert (=> b!250364 (= e!162361 e!162365)))

(declare-fun b!250365 () Bool)

(declare-fun e!162374 () Bool)

(declare-fun tp_is_empty!6487 () Bool)

(assert (=> b!250365 (= e!162374 tp_is_empty!6487)))

(declare-fun b!250366 () Bool)

(declare-fun e!162373 () Bool)

(assert (=> b!250366 (= e!162373 (or (not (= (size!6172 (_values!4610 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10810 thiss!1504)))) (not (= (size!6173 (_keys!6763 thiss!1504)) (size!6172 (_values!4610 thiss!1504)))) (bvsge (mask!10810 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun e!162362 () Bool)

(declare-fun e!162372 () Bool)

(declare-fun array_inv!3835 (array!12291) Bool)

(declare-fun array_inv!3836 (array!12289) Bool)

(assert (=> b!250367 (= e!162372 (and tp!23139 tp_is_empty!6487 (array_inv!3835 (_keys!6763 thiss!1504)) (array_inv!3836 (_values!4610 thiss!1504)) e!162362))))

(declare-fun b!250368 () Bool)

(declare-fun e!162364 () Bool)

(assert (=> b!250368 (= e!162364 (not e!162373))))

(declare-fun res!122628 () Bool)

(assert (=> b!250368 (=> res!122628 e!162373)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250368 (= res!122628 (not (validMask!0 (mask!10810 thiss!1504))))))

(declare-fun lt!125466 () array!12291)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12291 (_ BitVec 32)) Bool)

(assert (=> b!250368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125466 (mask!10810 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!125472 () Unit!7721)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12291 (_ BitVec 32) (_ BitVec 32)) Unit!7721)

(assert (=> b!250368 (= lt!125472 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) index!297 (mask!10810 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250368 (= (arrayCountValidKeys!0 lt!125466 #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504)))))))

(declare-fun lt!125465 () Unit!7721)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12291 (_ BitVec 32) (_ BitVec 64)) Unit!7721)

(assert (=> b!250368 (= lt!125465 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6763 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3642 0))(
  ( (Nil!3639) (Cons!3638 (h!4298 (_ BitVec 64)) (t!8667 List!3642)) )
))
(declare-fun arrayNoDuplicates!0 (array!12291 (_ BitVec 32) List!3642) Bool)

(assert (=> b!250368 (arrayNoDuplicates!0 lt!125466 #b00000000000000000000000000000000 Nil!3639)))

(assert (=> b!250368 (= lt!125466 (array!12292 (store (arr!5828 (_keys!6763 thiss!1504)) index!297 key!932) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun lt!125469 () Unit!7721)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3642) Unit!7721)

(assert (=> b!250368 (= lt!125469 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6763 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3639))))

(declare-fun lt!125468 () Unit!7721)

(declare-fun e!162370 () Unit!7721)

(assert (=> b!250368 (= lt!125468 e!162370)))

(declare-fun c!42068 () Bool)

(assert (=> b!250368 (= c!42068 (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250369 () Bool)

(declare-fun e!162367 () Bool)

(declare-fun e!162366 () Bool)

(assert (=> b!250369 (= e!162367 e!162366)))

(declare-fun res!122623 () Bool)

(assert (=> b!250369 (=> (not res!122623) (not e!162366))))

(assert (=> b!250369 (= res!122623 (or (= lt!125473 (MissingZero!1087 index!297)) (= lt!125473 (MissingVacant!1087 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12291 (_ BitVec 32)) SeekEntryResult!1087)

(assert (=> b!250369 (= lt!125473 (seekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(declare-fun mapNonEmpty!11023 () Bool)

(declare-fun tp!23140 () Bool)

(assert (=> mapNonEmpty!11023 (= mapRes!11023 (and tp!23140 e!162374))))

(declare-fun mapValue!11023 () ValueCell!2900)

(declare-fun mapKey!11023 () (_ BitVec 32))

(declare-fun mapRest!11023 () (Array (_ BitVec 32) ValueCell!2900))

(assert (=> mapNonEmpty!11023 (= (arr!5827 (_values!4610 thiss!1504)) (store mapRest!11023 mapKey!11023 mapValue!11023))))

(declare-fun b!250370 () Bool)

(declare-fun Unit!7724 () Unit!7721)

(assert (=> b!250370 (= e!162370 Unit!7724)))

(declare-fun lt!125467 () Unit!7721)

(declare-fun lemmaArrayContainsKeyThenInListMap!213 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) (_ BitVec 32) Int) Unit!7721)

(assert (=> b!250370 (= lt!125467 (lemmaArrayContainsKeyThenInListMap!213 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(assert (=> b!250370 false))

(declare-fun bm!23504 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23504 (= call!23506 (inRange!0 (ite c!42070 (index!6518 lt!125473) (index!6521 lt!125473)) (mask!10810 thiss!1504)))))

(declare-fun b!250371 () Bool)

(declare-fun res!122626 () Bool)

(assert (=> b!250371 (=> (not res!122626) (not e!162369))))

(assert (=> b!250371 (= res!122626 (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6518 lt!125473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250372 () Bool)

(declare-fun e!162363 () Bool)

(assert (=> b!250372 (= e!162363 tp_is_empty!6487)))

(declare-fun res!122627 () Bool)

(assert (=> start!23882 (=> (not res!122627) (not e!162367))))

(declare-fun valid!1457 (LongMapFixedSize!3700) Bool)

(assert (=> start!23882 (= res!122627 (valid!1457 thiss!1504))))

(assert (=> start!23882 e!162367))

(assert (=> start!23882 e!162372))

(assert (=> start!23882 true))

(declare-fun b!250373 () Bool)

(declare-fun res!122625 () Bool)

(assert (=> b!250373 (=> (not res!122625) (not e!162367))))

(assert (=> b!250373 (= res!122625 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250374 () Bool)

(declare-fun Unit!7725 () Unit!7721)

(assert (=> b!250374 (= e!162370 Unit!7725)))

(declare-fun b!250375 () Bool)

(assert (=> b!250375 (= e!162366 e!162364)))

(declare-fun res!122622 () Bool)

(assert (=> b!250375 (=> (not res!122622) (not e!162364))))

(assert (=> b!250375 (= res!122622 (inRange!0 index!297 (mask!10810 thiss!1504)))))

(declare-fun lt!125470 () Unit!7721)

(assert (=> b!250375 (= lt!125470 e!162360)))

(declare-fun c!42067 () Bool)

(declare-datatypes ((tuple2!4766 0))(
  ( (tuple2!4767 (_1!2394 (_ BitVec 64)) (_2!2394 V!8297)) )
))
(declare-datatypes ((List!3643 0))(
  ( (Nil!3640) (Cons!3639 (h!4299 tuple2!4766) (t!8668 List!3643)) )
))
(declare-datatypes ((ListLongMap!3681 0))(
  ( (ListLongMap!3682 (toList!1856 List!3643)) )
))
(declare-fun contains!1793 (ListLongMap!3681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1388 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 32) Int) ListLongMap!3681)

(assert (=> b!250375 (= c!42067 (contains!1793 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932))))

(declare-fun b!250376 () Bool)

(declare-fun e!162371 () Bool)

(assert (=> b!250376 (= e!162365 e!162371)))

(declare-fun res!122624 () Bool)

(assert (=> b!250376 (= res!122624 call!23506)))

(assert (=> b!250376 (=> (not res!122624) (not e!162371))))

(declare-fun b!250377 () Bool)

(assert (=> b!250377 (= e!162369 (not call!23507))))

(declare-fun b!250378 () Bool)

(declare-fun res!122629 () Bool)

(assert (=> b!250378 (= res!122629 (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6521 lt!125473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250378 (=> (not res!122629) (not e!162371))))

(declare-fun b!250379 () Bool)

(assert (=> b!250379 (= e!162371 (not call!23507))))

(declare-fun b!250380 () Bool)

(assert (=> b!250380 (= e!162365 ((_ is Undefined!1087) lt!125473))))

(declare-fun b!250381 () Bool)

(assert (=> b!250381 (= e!162362 (and e!162363 mapRes!11023))))

(declare-fun condMapEmpty!11023 () Bool)

(declare-fun mapDefault!11023 () ValueCell!2900)

(assert (=> b!250381 (= condMapEmpty!11023 (= (arr!5827 (_values!4610 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2900)) mapDefault!11023)))))

(assert (= (and start!23882 res!122627) b!250373))

(assert (= (and b!250373 res!122625) b!250369))

(assert (= (and b!250369 res!122623) b!250375))

(assert (= (and b!250375 c!42067) b!250361))

(assert (= (and b!250375 (not c!42067)) b!250362))

(assert (= (and b!250362 c!42070) b!250363))

(assert (= (and b!250362 (not c!42070)) b!250364))

(assert (= (and b!250363 res!122621) b!250371))

(assert (= (and b!250371 res!122626) b!250377))

(assert (= (and b!250364 c!42069) b!250376))

(assert (= (and b!250364 (not c!42069)) b!250380))

(assert (= (and b!250376 res!122624) b!250378))

(assert (= (and b!250378 res!122629) b!250379))

(assert (= (or b!250363 b!250376) bm!23504))

(assert (= (or b!250377 b!250379) bm!23503))

(assert (= (and b!250375 res!122622) b!250368))

(assert (= (and b!250368 c!42068) b!250370))

(assert (= (and b!250368 (not c!42068)) b!250374))

(assert (= (and b!250368 (not res!122628)) b!250366))

(assert (= (and b!250381 condMapEmpty!11023) mapIsEmpty!11023))

(assert (= (and b!250381 (not condMapEmpty!11023)) mapNonEmpty!11023))

(assert (= (and mapNonEmpty!11023 ((_ is ValueCellFull!2900) mapValue!11023)) b!250365))

(assert (= (and b!250381 ((_ is ValueCellFull!2900) mapDefault!11023)) b!250372))

(assert (= b!250367 b!250381))

(assert (= start!23882 b!250367))

(declare-fun m!266959 () Bool)

(assert (=> b!250362 m!266959))

(declare-fun m!266961 () Bool)

(assert (=> b!250361 m!266961))

(declare-fun m!266963 () Bool)

(assert (=> mapNonEmpty!11023 m!266963))

(declare-fun m!266965 () Bool)

(assert (=> b!250371 m!266965))

(declare-fun m!266967 () Bool)

(assert (=> b!250369 m!266967))

(declare-fun m!266969 () Bool)

(assert (=> b!250368 m!266969))

(declare-fun m!266971 () Bool)

(assert (=> b!250368 m!266971))

(declare-fun m!266973 () Bool)

(assert (=> b!250368 m!266973))

(declare-fun m!266975 () Bool)

(assert (=> b!250368 m!266975))

(declare-fun m!266977 () Bool)

(assert (=> b!250368 m!266977))

(declare-fun m!266979 () Bool)

(assert (=> b!250368 m!266979))

(declare-fun m!266981 () Bool)

(assert (=> b!250368 m!266981))

(declare-fun m!266983 () Bool)

(assert (=> b!250368 m!266983))

(declare-fun m!266985 () Bool)

(assert (=> b!250368 m!266985))

(declare-fun m!266987 () Bool)

(assert (=> b!250368 m!266987))

(declare-fun m!266989 () Bool)

(assert (=> bm!23504 m!266989))

(declare-fun m!266991 () Bool)

(assert (=> start!23882 m!266991))

(declare-fun m!266993 () Bool)

(assert (=> b!250375 m!266993))

(declare-fun m!266995 () Bool)

(assert (=> b!250375 m!266995))

(assert (=> b!250375 m!266995))

(declare-fun m!266997 () Bool)

(assert (=> b!250375 m!266997))

(assert (=> bm!23503 m!266971))

(declare-fun m!266999 () Bool)

(assert (=> b!250367 m!266999))

(declare-fun m!267001 () Bool)

(assert (=> b!250367 m!267001))

(declare-fun m!267003 () Bool)

(assert (=> b!250378 m!267003))

(declare-fun m!267005 () Bool)

(assert (=> b!250370 m!267005))

(check-sat (not mapNonEmpty!11023) (not bm!23504) (not b!250370) tp_is_empty!6487 (not b!250361) (not start!23882) (not b!250362) (not b!250369) (not b!250375) (not b!250368) b_and!13659 (not b!250367) (not b_next!6625) (not bm!23503))
(check-sat b_and!13659 (not b_next!6625))
(get-model)

(declare-fun d!61005 () Bool)

(declare-fun e!162467 () Bool)

(assert (=> d!61005 e!162467))

(declare-fun res!122688 () Bool)

(assert (=> d!61005 (=> (not res!122688) (not e!162467))))

(declare-fun lt!125540 () SeekEntryResult!1087)

(assert (=> d!61005 (= res!122688 ((_ is Found!1087) lt!125540))))

(assert (=> d!61005 (= lt!125540 (seekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(declare-fun lt!125539 () Unit!7721)

(declare-fun choose!1192 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7721)

(assert (=> d!61005 (= lt!125539 (choose!1192 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!61005 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61005 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!392 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)) lt!125539)))

(declare-fun b!250512 () Bool)

(declare-fun res!122689 () Bool)

(assert (=> b!250512 (=> (not res!122689) (not e!162467))))

(assert (=> b!250512 (= res!122689 (inRange!0 (index!6519 lt!125540) (mask!10810 thiss!1504)))))

(declare-fun b!250513 () Bool)

(assert (=> b!250513 (= e!162467 (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6519 lt!125540)) key!932))))

(assert (=> b!250513 (and (bvsge (index!6519 lt!125540) #b00000000000000000000000000000000) (bvslt (index!6519 lt!125540) (size!6173 (_keys!6763 thiss!1504))))))

(assert (= (and d!61005 res!122688) b!250512))

(assert (= (and b!250512 res!122689) b!250513))

(assert (=> d!61005 m!266967))

(declare-fun m!267103 () Bool)

(assert (=> d!61005 m!267103))

(assert (=> d!61005 m!266969))

(declare-fun m!267105 () Bool)

(assert (=> b!250512 m!267105))

(declare-fun m!267107 () Bool)

(assert (=> b!250513 m!267107))

(assert (=> b!250361 d!61005))

(declare-fun b!250526 () Bool)

(declare-fun c!42103 () Bool)

(declare-fun lt!125547 () (_ BitVec 64))

(assert (=> b!250526 (= c!42103 (= lt!125547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162475 () SeekEntryResult!1087)

(declare-fun e!162474 () SeekEntryResult!1087)

(assert (=> b!250526 (= e!162475 e!162474)))

(declare-fun b!250527 () Bool)

(declare-fun lt!125548 () SeekEntryResult!1087)

(assert (=> b!250527 (= e!162474 (MissingZero!1087 (index!6520 lt!125548)))))

(declare-fun b!250528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12291 (_ BitVec 32)) SeekEntryResult!1087)

(assert (=> b!250528 (= e!162474 (seekKeyOrZeroReturnVacant!0 (x!24637 lt!125548) (index!6520 lt!125548) (index!6520 lt!125548) key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(declare-fun d!61007 () Bool)

(declare-fun lt!125549 () SeekEntryResult!1087)

(assert (=> d!61007 (and (or ((_ is Undefined!1087) lt!125549) (not ((_ is Found!1087) lt!125549)) (and (bvsge (index!6519 lt!125549) #b00000000000000000000000000000000) (bvslt (index!6519 lt!125549) (size!6173 (_keys!6763 thiss!1504))))) (or ((_ is Undefined!1087) lt!125549) ((_ is Found!1087) lt!125549) (not ((_ is MissingZero!1087) lt!125549)) (and (bvsge (index!6518 lt!125549) #b00000000000000000000000000000000) (bvslt (index!6518 lt!125549) (size!6173 (_keys!6763 thiss!1504))))) (or ((_ is Undefined!1087) lt!125549) ((_ is Found!1087) lt!125549) ((_ is MissingZero!1087) lt!125549) (not ((_ is MissingVacant!1087) lt!125549)) (and (bvsge (index!6521 lt!125549) #b00000000000000000000000000000000) (bvslt (index!6521 lt!125549) (size!6173 (_keys!6763 thiss!1504))))) (or ((_ is Undefined!1087) lt!125549) (ite ((_ is Found!1087) lt!125549) (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6519 lt!125549)) key!932) (ite ((_ is MissingZero!1087) lt!125549) (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6518 lt!125549)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1087) lt!125549) (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6521 lt!125549)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!162476 () SeekEntryResult!1087)

(assert (=> d!61007 (= lt!125549 e!162476)))

(declare-fun c!42101 () Bool)

(assert (=> d!61007 (= c!42101 (and ((_ is Intermediate!1087) lt!125548) (undefined!1899 lt!125548)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12291 (_ BitVec 32)) SeekEntryResult!1087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61007 (= lt!125548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10810 thiss!1504)) key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(assert (=> d!61007 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61007 (= (seekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)) lt!125549)))

(declare-fun b!250529 () Bool)

(assert (=> b!250529 (= e!162476 Undefined!1087)))

(declare-fun b!250530 () Bool)

(assert (=> b!250530 (= e!162476 e!162475)))

(assert (=> b!250530 (= lt!125547 (select (arr!5828 (_keys!6763 thiss!1504)) (index!6520 lt!125548)))))

(declare-fun c!42102 () Bool)

(assert (=> b!250530 (= c!42102 (= lt!125547 key!932))))

(declare-fun b!250531 () Bool)

(assert (=> b!250531 (= e!162475 (Found!1087 (index!6520 lt!125548)))))

(assert (= (and d!61007 c!42101) b!250529))

(assert (= (and d!61007 (not c!42101)) b!250530))

(assert (= (and b!250530 c!42102) b!250531))

(assert (= (and b!250530 (not c!42102)) b!250526))

(assert (= (and b!250526 c!42103) b!250527))

(assert (= (and b!250526 (not c!42103)) b!250528))

(declare-fun m!267109 () Bool)

(assert (=> b!250528 m!267109))

(assert (=> d!61007 m!266969))

(declare-fun m!267111 () Bool)

(assert (=> d!61007 m!267111))

(declare-fun m!267113 () Bool)

(assert (=> d!61007 m!267113))

(declare-fun m!267115 () Bool)

(assert (=> d!61007 m!267115))

(declare-fun m!267117 () Bool)

(assert (=> d!61007 m!267117))

(assert (=> d!61007 m!267115))

(declare-fun m!267119 () Bool)

(assert (=> d!61007 m!267119))

(declare-fun m!267121 () Bool)

(assert (=> b!250530 m!267121))

(assert (=> b!250369 d!61007))

(declare-fun d!61009 () Bool)

(declare-fun e!162482 () Bool)

(assert (=> d!61009 e!162482))

(declare-fun res!122698 () Bool)

(assert (=> d!61009 (=> (not res!122698) (not e!162482))))

(assert (=> d!61009 (= res!122698 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6173 (_keys!6763 thiss!1504)))))))

(declare-fun lt!125552 () Unit!7721)

(declare-fun choose!1 (array!12291 (_ BitVec 32) (_ BitVec 64)) Unit!7721)

(assert (=> d!61009 (= lt!125552 (choose!1 (_keys!6763 thiss!1504) index!297 key!932))))

(declare-fun e!162481 () Bool)

(assert (=> d!61009 e!162481))

(declare-fun res!122699 () Bool)

(assert (=> d!61009 (=> (not res!122699) (not e!162481))))

(assert (=> d!61009 (= res!122699 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6173 (_keys!6763 thiss!1504)))))))

(assert (=> d!61009 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6763 thiss!1504) index!297 key!932) lt!125552)))

(declare-fun b!250540 () Bool)

(declare-fun res!122700 () Bool)

(assert (=> b!250540 (=> (not res!122700) (not e!162481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!250540 (= res!122700 (not (validKeyInArray!0 (select (arr!5828 (_keys!6763 thiss!1504)) index!297))))))

(declare-fun b!250542 () Bool)

(assert (=> b!250542 (= e!162481 (bvslt (size!6173 (_keys!6763 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!250541 () Bool)

(declare-fun res!122701 () Bool)

(assert (=> b!250541 (=> (not res!122701) (not e!162481))))

(assert (=> b!250541 (= res!122701 (validKeyInArray!0 key!932))))

(declare-fun b!250543 () Bool)

(assert (=> b!250543 (= e!162482 (= (arrayCountValidKeys!0 (array!12292 (store (arr!5828 (_keys!6763 thiss!1504)) index!297 key!932) (size!6173 (_keys!6763 thiss!1504))) #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61009 res!122699) b!250540))

(assert (= (and b!250540 res!122700) b!250541))

(assert (= (and b!250541 res!122701) b!250542))

(assert (= (and d!61009 res!122698) b!250543))

(declare-fun m!267123 () Bool)

(assert (=> d!61009 m!267123))

(declare-fun m!267125 () Bool)

(assert (=> b!250540 m!267125))

(assert (=> b!250540 m!267125))

(declare-fun m!267127 () Bool)

(assert (=> b!250540 m!267127))

(declare-fun m!267129 () Bool)

(assert (=> b!250541 m!267129))

(assert (=> b!250543 m!266983))

(declare-fun m!267131 () Bool)

(assert (=> b!250543 m!267131))

(assert (=> b!250543 m!266985))

(assert (=> b!250368 d!61009))

(declare-fun b!250552 () Bool)

(declare-fun e!162487 () (_ BitVec 32))

(declare-fun call!23522 () (_ BitVec 32))

(assert (=> b!250552 (= e!162487 (bvadd #b00000000000000000000000000000001 call!23522))))

(declare-fun d!61011 () Bool)

(declare-fun lt!125555 () (_ BitVec 32))

(assert (=> d!61011 (and (bvsge lt!125555 #b00000000000000000000000000000000) (bvsle lt!125555 (bvsub (size!6173 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun e!162488 () (_ BitVec 32))

(assert (=> d!61011 (= lt!125555 e!162488)))

(declare-fun c!42109 () Bool)

(assert (=> d!61011 (= c!42109 (bvsge #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(assert (=> d!61011 (and (bvsle #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6173 (_keys!6763 thiss!1504)) (size!6173 lt!125466)))))

(assert (=> d!61011 (= (arrayCountValidKeys!0 lt!125466 #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) lt!125555)))

(declare-fun b!250553 () Bool)

(assert (=> b!250553 (= e!162488 e!162487)))

(declare-fun c!42108 () Bool)

(assert (=> b!250553 (= c!42108 (validKeyInArray!0 (select (arr!5828 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun b!250554 () Bool)

(assert (=> b!250554 (= e!162487 call!23522)))

(declare-fun bm!23519 () Bool)

(assert (=> bm!23519 (= call!23522 (arrayCountValidKeys!0 lt!125466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250555 () Bool)

(assert (=> b!250555 (= e!162488 #b00000000000000000000000000000000)))

(assert (= (and d!61011 c!42109) b!250555))

(assert (= (and d!61011 (not c!42109)) b!250553))

(assert (= (and b!250553 c!42108) b!250552))

(assert (= (and b!250553 (not c!42108)) b!250554))

(assert (= (or b!250552 b!250554) bm!23519))

(declare-fun m!267133 () Bool)

(assert (=> b!250553 m!267133))

(assert (=> b!250553 m!267133))

(declare-fun m!267135 () Bool)

(assert (=> b!250553 m!267135))

(declare-fun m!267137 () Bool)

(assert (=> bm!23519 m!267137))

(assert (=> b!250368 d!61011))

(declare-fun b!250556 () Bool)

(declare-fun e!162489 () (_ BitVec 32))

(declare-fun call!23523 () (_ BitVec 32))

(assert (=> b!250556 (= e!162489 (bvadd #b00000000000000000000000000000001 call!23523))))

(declare-fun d!61013 () Bool)

(declare-fun lt!125556 () (_ BitVec 32))

(assert (=> d!61013 (and (bvsge lt!125556 #b00000000000000000000000000000000) (bvsle lt!125556 (bvsub (size!6173 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162490 () (_ BitVec 32))

(assert (=> d!61013 (= lt!125556 e!162490)))

(declare-fun c!42111 () Bool)

(assert (=> d!61013 (= c!42111 (bvsge #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(assert (=> d!61013 (and (bvsle #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6173 (_keys!6763 thiss!1504)) (size!6173 (_keys!6763 thiss!1504))))))

(assert (=> d!61013 (= (arrayCountValidKeys!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) lt!125556)))

(declare-fun b!250557 () Bool)

(assert (=> b!250557 (= e!162490 e!162489)))

(declare-fun c!42110 () Bool)

(assert (=> b!250557 (= c!42110 (validKeyInArray!0 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250558 () Bool)

(assert (=> b!250558 (= e!162489 call!23523)))

(declare-fun bm!23520 () Bool)

(assert (=> bm!23520 (= call!23523 (arrayCountValidKeys!0 (_keys!6763 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250559 () Bool)

(assert (=> b!250559 (= e!162490 #b00000000000000000000000000000000)))

(assert (= (and d!61013 c!42111) b!250559))

(assert (= (and d!61013 (not c!42111)) b!250557))

(assert (= (and b!250557 c!42110) b!250556))

(assert (= (and b!250557 (not c!42110)) b!250558))

(assert (= (or b!250556 b!250558) bm!23520))

(declare-fun m!267139 () Bool)

(assert (=> b!250557 m!267139))

(assert (=> b!250557 m!267139))

(declare-fun m!267141 () Bool)

(assert (=> b!250557 m!267141))

(declare-fun m!267143 () Bool)

(assert (=> bm!23520 m!267143))

(assert (=> b!250368 d!61013))

(declare-fun d!61015 () Bool)

(assert (=> d!61015 (= (validMask!0 (mask!10810 thiss!1504)) (and (or (= (mask!10810 thiss!1504) #b00000000000000000000000000000111) (= (mask!10810 thiss!1504) #b00000000000000000000000000001111) (= (mask!10810 thiss!1504) #b00000000000000000000000000011111) (= (mask!10810 thiss!1504) #b00000000000000000000000000111111) (= (mask!10810 thiss!1504) #b00000000000000000000000001111111) (= (mask!10810 thiss!1504) #b00000000000000000000000011111111) (= (mask!10810 thiss!1504) #b00000000000000000000000111111111) (= (mask!10810 thiss!1504) #b00000000000000000000001111111111) (= (mask!10810 thiss!1504) #b00000000000000000000011111111111) (= (mask!10810 thiss!1504) #b00000000000000000000111111111111) (= (mask!10810 thiss!1504) #b00000000000000000001111111111111) (= (mask!10810 thiss!1504) #b00000000000000000011111111111111) (= (mask!10810 thiss!1504) #b00000000000000000111111111111111) (= (mask!10810 thiss!1504) #b00000000000000001111111111111111) (= (mask!10810 thiss!1504) #b00000000000000011111111111111111) (= (mask!10810 thiss!1504) #b00000000000000111111111111111111) (= (mask!10810 thiss!1504) #b00000000000001111111111111111111) (= (mask!10810 thiss!1504) #b00000000000011111111111111111111) (= (mask!10810 thiss!1504) #b00000000000111111111111111111111) (= (mask!10810 thiss!1504) #b00000000001111111111111111111111) (= (mask!10810 thiss!1504) #b00000000011111111111111111111111) (= (mask!10810 thiss!1504) #b00000000111111111111111111111111) (= (mask!10810 thiss!1504) #b00000001111111111111111111111111) (= (mask!10810 thiss!1504) #b00000011111111111111111111111111) (= (mask!10810 thiss!1504) #b00000111111111111111111111111111) (= (mask!10810 thiss!1504) #b00001111111111111111111111111111) (= (mask!10810 thiss!1504) #b00011111111111111111111111111111) (= (mask!10810 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10810 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!250368 d!61015))

(declare-fun b!250568 () Bool)

(declare-fun e!162499 () Bool)

(declare-fun call!23526 () Bool)

(assert (=> b!250568 (= e!162499 call!23526)))

(declare-fun b!250569 () Bool)

(declare-fun e!162497 () Bool)

(assert (=> b!250569 (= e!162497 e!162499)))

(declare-fun c!42114 () Bool)

(assert (=> b!250569 (= c!42114 (validKeyInArray!0 (select (arr!5828 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun b!250570 () Bool)

(declare-fun e!162498 () Bool)

(assert (=> b!250570 (= e!162499 e!162498)))

(declare-fun lt!125564 () (_ BitVec 64))

(assert (=> b!250570 (= lt!125564 (select (arr!5828 lt!125466) #b00000000000000000000000000000000))))

(declare-fun lt!125565 () Unit!7721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12291 (_ BitVec 64) (_ BitVec 32)) Unit!7721)

(assert (=> b!250570 (= lt!125565 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125466 lt!125564 #b00000000000000000000000000000000))))

(assert (=> b!250570 (arrayContainsKey!0 lt!125466 lt!125564 #b00000000000000000000000000000000)))

(declare-fun lt!125563 () Unit!7721)

(assert (=> b!250570 (= lt!125563 lt!125565)))

(declare-fun res!122706 () Bool)

(assert (=> b!250570 (= res!122706 (= (seekEntryOrOpen!0 (select (arr!5828 lt!125466) #b00000000000000000000000000000000) lt!125466 (mask!10810 thiss!1504)) (Found!1087 #b00000000000000000000000000000000)))))

(assert (=> b!250570 (=> (not res!122706) (not e!162498))))

(declare-fun d!61017 () Bool)

(declare-fun res!122707 () Bool)

(assert (=> d!61017 (=> res!122707 e!162497)))

(assert (=> d!61017 (= res!122707 (bvsge #b00000000000000000000000000000000 (size!6173 lt!125466)))))

(assert (=> d!61017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125466 (mask!10810 thiss!1504)) e!162497)))

(declare-fun b!250571 () Bool)

(assert (=> b!250571 (= e!162498 call!23526)))

(declare-fun bm!23523 () Bool)

(assert (=> bm!23523 (= call!23526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125466 (mask!10810 thiss!1504)))))

(assert (= (and d!61017 (not res!122707)) b!250569))

(assert (= (and b!250569 c!42114) b!250570))

(assert (= (and b!250569 (not c!42114)) b!250568))

(assert (= (and b!250570 res!122706) b!250571))

(assert (= (or b!250571 b!250568) bm!23523))

(assert (=> b!250569 m!267133))

(assert (=> b!250569 m!267133))

(assert (=> b!250569 m!267135))

(assert (=> b!250570 m!267133))

(declare-fun m!267145 () Bool)

(assert (=> b!250570 m!267145))

(declare-fun m!267147 () Bool)

(assert (=> b!250570 m!267147))

(assert (=> b!250570 m!267133))

(declare-fun m!267149 () Bool)

(assert (=> b!250570 m!267149))

(declare-fun m!267151 () Bool)

(assert (=> bm!23523 m!267151))

(assert (=> b!250368 d!61017))

(declare-fun d!61019 () Bool)

(declare-fun res!122712 () Bool)

(declare-fun e!162504 () Bool)

(assert (=> d!61019 (=> res!122712 e!162504)))

(assert (=> d!61019 (= res!122712 (= (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61019 (= (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 #b00000000000000000000000000000000) e!162504)))

(declare-fun b!250576 () Bool)

(declare-fun e!162505 () Bool)

(assert (=> b!250576 (= e!162504 e!162505)))

(declare-fun res!122713 () Bool)

(assert (=> b!250576 (=> (not res!122713) (not e!162505))))

(assert (=> b!250576 (= res!122713 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250577 () Bool)

(assert (=> b!250577 (= e!162505 (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61019 (not res!122712)) b!250576))

(assert (= (and b!250576 res!122713) b!250577))

(assert (=> d!61019 m!267139))

(declare-fun m!267153 () Bool)

(assert (=> b!250577 m!267153))

(assert (=> b!250368 d!61019))

(declare-fun d!61021 () Bool)

(declare-fun e!162508 () Bool)

(assert (=> d!61021 e!162508))

(declare-fun res!122716 () Bool)

(assert (=> d!61021 (=> (not res!122716) (not e!162508))))

(assert (=> d!61021 (= res!122716 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6173 (_keys!6763 thiss!1504)))))))

(declare-fun lt!125568 () Unit!7721)

(declare-fun choose!102 ((_ BitVec 64) array!12291 (_ BitVec 32) (_ BitVec 32)) Unit!7721)

(assert (=> d!61021 (= lt!125568 (choose!102 key!932 (_keys!6763 thiss!1504) index!297 (mask!10810 thiss!1504)))))

(assert (=> d!61021 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61021 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) index!297 (mask!10810 thiss!1504)) lt!125568)))

(declare-fun b!250580 () Bool)

(assert (=> b!250580 (= e!162508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12292 (store (arr!5828 (_keys!6763 thiss!1504)) index!297 key!932) (size!6173 (_keys!6763 thiss!1504))) (mask!10810 thiss!1504)))))

(assert (= (and d!61021 res!122716) b!250580))

(declare-fun m!267155 () Bool)

(assert (=> d!61021 m!267155))

(assert (=> d!61021 m!266969))

(assert (=> b!250580 m!266983))

(declare-fun m!267157 () Bool)

(assert (=> b!250580 m!267157))

(assert (=> b!250368 d!61021))

(declare-fun d!61023 () Bool)

(declare-fun e!162511 () Bool)

(assert (=> d!61023 e!162511))

(declare-fun res!122719 () Bool)

(assert (=> d!61023 (=> (not res!122719) (not e!162511))))

(assert (=> d!61023 (= res!122719 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6173 (_keys!6763 thiss!1504)))))))

(declare-fun lt!125571 () Unit!7721)

(declare-fun choose!41 (array!12291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3642) Unit!7721)

(assert (=> d!61023 (= lt!125571 (choose!41 (_keys!6763 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3639))))

(assert (=> d!61023 (bvslt (size!6173 (_keys!6763 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61023 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6763 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3639) lt!125571)))

(declare-fun b!250583 () Bool)

(assert (=> b!250583 (= e!162511 (arrayNoDuplicates!0 (array!12292 (store (arr!5828 (_keys!6763 thiss!1504)) index!297 key!932) (size!6173 (_keys!6763 thiss!1504))) #b00000000000000000000000000000000 Nil!3639))))

(assert (= (and d!61023 res!122719) b!250583))

(declare-fun m!267159 () Bool)

(assert (=> d!61023 m!267159))

(assert (=> b!250583 m!266983))

(declare-fun m!267161 () Bool)

(assert (=> b!250583 m!267161))

(assert (=> b!250368 d!61023))

(declare-fun b!250594 () Bool)

(declare-fun e!162521 () Bool)

(declare-fun contains!1794 (List!3642 (_ BitVec 64)) Bool)

(assert (=> b!250594 (= e!162521 (contains!1794 Nil!3639 (select (arr!5828 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun b!250595 () Bool)

(declare-fun e!162522 () Bool)

(declare-fun call!23529 () Bool)

(assert (=> b!250595 (= e!162522 call!23529)))

(declare-fun d!61025 () Bool)

(declare-fun res!122727 () Bool)

(declare-fun e!162520 () Bool)

(assert (=> d!61025 (=> res!122727 e!162520)))

(assert (=> d!61025 (= res!122727 (bvsge #b00000000000000000000000000000000 (size!6173 lt!125466)))))

(assert (=> d!61025 (= (arrayNoDuplicates!0 lt!125466 #b00000000000000000000000000000000 Nil!3639) e!162520)))

(declare-fun b!250596 () Bool)

(declare-fun e!162523 () Bool)

(assert (=> b!250596 (= e!162523 e!162522)))

(declare-fun c!42117 () Bool)

(assert (=> b!250596 (= c!42117 (validKeyInArray!0 (select (arr!5828 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun b!250597 () Bool)

(assert (=> b!250597 (= e!162520 e!162523)))

(declare-fun res!122726 () Bool)

(assert (=> b!250597 (=> (not res!122726) (not e!162523))))

(assert (=> b!250597 (= res!122726 (not e!162521))))

(declare-fun res!122728 () Bool)

(assert (=> b!250597 (=> (not res!122728) (not e!162521))))

(assert (=> b!250597 (= res!122728 (validKeyInArray!0 (select (arr!5828 lt!125466) #b00000000000000000000000000000000)))))

(declare-fun b!250598 () Bool)

(assert (=> b!250598 (= e!162522 call!23529)))

(declare-fun bm!23526 () Bool)

(assert (=> bm!23526 (= call!23529 (arrayNoDuplicates!0 lt!125466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42117 (Cons!3638 (select (arr!5828 lt!125466) #b00000000000000000000000000000000) Nil!3639) Nil!3639)))))

(assert (= (and d!61025 (not res!122727)) b!250597))

(assert (= (and b!250597 res!122728) b!250594))

(assert (= (and b!250597 res!122726) b!250596))

(assert (= (and b!250596 c!42117) b!250595))

(assert (= (and b!250596 (not c!42117)) b!250598))

(assert (= (or b!250595 b!250598) bm!23526))

(assert (=> b!250594 m!267133))

(assert (=> b!250594 m!267133))

(declare-fun m!267163 () Bool)

(assert (=> b!250594 m!267163))

(assert (=> b!250596 m!267133))

(assert (=> b!250596 m!267133))

(assert (=> b!250596 m!267135))

(assert (=> b!250597 m!267133))

(assert (=> b!250597 m!267133))

(assert (=> b!250597 m!267135))

(assert (=> bm!23526 m!267133))

(declare-fun m!267165 () Bool)

(assert (=> bm!23526 m!267165))

(assert (=> b!250368 d!61025))

(assert (=> bm!23503 d!61019))

(declare-fun d!61027 () Bool)

(assert (=> d!61027 (= (array_inv!3835 (_keys!6763 thiss!1504)) (bvsge (size!6173 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250367 d!61027))

(declare-fun d!61029 () Bool)

(assert (=> d!61029 (= (array_inv!3836 (_values!4610 thiss!1504)) (bvsge (size!6172 (_values!4610 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250367 d!61029))

(declare-fun d!61031 () Bool)

(assert (=> d!61031 (= (inRange!0 (ite c!42070 (index!6518 lt!125473) (index!6521 lt!125473)) (mask!10810 thiss!1504)) (and (bvsge (ite c!42070 (index!6518 lt!125473) (index!6521 lt!125473)) #b00000000000000000000000000000000) (bvslt (ite c!42070 (index!6518 lt!125473) (index!6521 lt!125473)) (bvadd (mask!10810 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23504 d!61031))

(declare-fun d!61033 () Bool)

(assert (=> d!61033 (= (inRange!0 index!297 (mask!10810 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10810 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!250375 d!61033))

(declare-fun d!61035 () Bool)

(declare-fun e!162529 () Bool)

(assert (=> d!61035 e!162529))

(declare-fun res!122731 () Bool)

(assert (=> d!61035 (=> res!122731 e!162529)))

(declare-fun lt!125580 () Bool)

(assert (=> d!61035 (= res!122731 (not lt!125580))))

(declare-fun lt!125582 () Bool)

(assert (=> d!61035 (= lt!125580 lt!125582)))

(declare-fun lt!125583 () Unit!7721)

(declare-fun e!162528 () Unit!7721)

(assert (=> d!61035 (= lt!125583 e!162528)))

(declare-fun c!42120 () Bool)

(assert (=> d!61035 (= c!42120 lt!125582)))

(declare-fun containsKey!290 (List!3643 (_ BitVec 64)) Bool)

(assert (=> d!61035 (= lt!125582 (containsKey!290 (toList!1856 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(assert (=> d!61035 (= (contains!1793 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932) lt!125580)))

(declare-fun b!250605 () Bool)

(declare-fun lt!125581 () Unit!7721)

(assert (=> b!250605 (= e!162528 lt!125581)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!238 (List!3643 (_ BitVec 64)) Unit!7721)

(assert (=> b!250605 (= lt!125581 (lemmaContainsKeyImpliesGetValueByKeyDefined!238 (toList!1856 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(declare-datatypes ((Option!305 0))(
  ( (Some!304 (v!5357 V!8297)) (None!303) )
))
(declare-fun isDefined!239 (Option!305) Bool)

(declare-fun getValueByKey!299 (List!3643 (_ BitVec 64)) Option!305)

(assert (=> b!250605 (isDefined!239 (getValueByKey!299 (toList!1856 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932))))

(declare-fun b!250606 () Bool)

(declare-fun Unit!7732 () Unit!7721)

(assert (=> b!250606 (= e!162528 Unit!7732)))

(declare-fun b!250607 () Bool)

(assert (=> b!250607 (= e!162529 (isDefined!239 (getValueByKey!299 (toList!1856 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504))) key!932)))))

(assert (= (and d!61035 c!42120) b!250605))

(assert (= (and d!61035 (not c!42120)) b!250606))

(assert (= (and d!61035 (not res!122731)) b!250607))

(declare-fun m!267167 () Bool)

(assert (=> d!61035 m!267167))

(declare-fun m!267169 () Bool)

(assert (=> b!250605 m!267169))

(declare-fun m!267171 () Bool)

(assert (=> b!250605 m!267171))

(assert (=> b!250605 m!267171))

(declare-fun m!267173 () Bool)

(assert (=> b!250605 m!267173))

(assert (=> b!250607 m!267171))

(assert (=> b!250607 m!267171))

(assert (=> b!250607 m!267173))

(assert (=> b!250375 d!61035))

(declare-fun b!250651 () Bool)

(declare-fun e!162557 () Bool)

(declare-fun lt!125642 () ListLongMap!3681)

(declare-fun apply!240 (ListLongMap!3681 (_ BitVec 64)) V!8297)

(declare-fun get!3003 (ValueCell!2900 V!8297) V!8297)

(declare-fun dynLambda!583 (Int (_ BitVec 64)) V!8297)

(assert (=> b!250651 (= e!162557 (= (apply!240 lt!125642 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)) (get!3003 (select (arr!5827 (_values!4610 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!583 (defaultEntry!4627 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6172 (_values!4610 thiss!1504))))))

(assert (=> b!250651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250652 () Bool)

(declare-fun e!162562 () ListLongMap!3681)

(declare-fun call!23544 () ListLongMap!3681)

(assert (=> b!250652 (= e!162562 call!23544)))

(declare-fun bm!23541 () Bool)

(declare-fun call!23547 () ListLongMap!3681)

(declare-fun call!23548 () ListLongMap!3681)

(assert (=> bm!23541 (= call!23547 call!23548)))

(declare-fun b!250653 () Bool)

(declare-fun res!122756 () Bool)

(declare-fun e!162563 () Bool)

(assert (=> b!250653 (=> (not res!122756) (not e!162563))))

(declare-fun e!162561 () Bool)

(assert (=> b!250653 (= res!122756 e!162561)))

(declare-fun res!122758 () Bool)

(assert (=> b!250653 (=> res!122758 e!162561)))

(declare-fun e!162565 () Bool)

(assert (=> b!250653 (= res!122758 (not e!162565))))

(declare-fun res!122750 () Bool)

(assert (=> b!250653 (=> (not res!122750) (not e!162565))))

(assert (=> b!250653 (= res!122750 (bvslt #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250654 () Bool)

(declare-fun e!162560 () Bool)

(declare-fun call!23545 () Bool)

(assert (=> b!250654 (= e!162560 (not call!23545))))

(declare-fun b!250655 () Bool)

(declare-fun e!162559 () Unit!7721)

(declare-fun lt!125634 () Unit!7721)

(assert (=> b!250655 (= e!162559 lt!125634)))

(declare-fun lt!125643 () ListLongMap!3681)

(declare-fun getCurrentListMapNoExtraKeys!556 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 32) Int) ListLongMap!3681)

(assert (=> b!250655 (= lt!125643 (getCurrentListMapNoExtraKeys!556 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125648 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125630 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125630 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125640 () Unit!7721)

(declare-fun addStillContains!216 (ListLongMap!3681 (_ BitVec 64) V!8297 (_ BitVec 64)) Unit!7721)

(assert (=> b!250655 (= lt!125640 (addStillContains!216 lt!125643 lt!125648 (zeroValue!4468 thiss!1504) lt!125630))))

(declare-fun +!667 (ListLongMap!3681 tuple2!4766) ListLongMap!3681)

(assert (=> b!250655 (contains!1793 (+!667 lt!125643 (tuple2!4767 lt!125648 (zeroValue!4468 thiss!1504))) lt!125630)))

(declare-fun lt!125646 () Unit!7721)

(assert (=> b!250655 (= lt!125646 lt!125640)))

(declare-fun lt!125629 () ListLongMap!3681)

(assert (=> b!250655 (= lt!125629 (getCurrentListMapNoExtraKeys!556 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125644 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125644 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125633 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125633 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125631 () Unit!7721)

(declare-fun addApplyDifferent!216 (ListLongMap!3681 (_ BitVec 64) V!8297 (_ BitVec 64)) Unit!7721)

(assert (=> b!250655 (= lt!125631 (addApplyDifferent!216 lt!125629 lt!125644 (minValue!4468 thiss!1504) lt!125633))))

(assert (=> b!250655 (= (apply!240 (+!667 lt!125629 (tuple2!4767 lt!125644 (minValue!4468 thiss!1504))) lt!125633) (apply!240 lt!125629 lt!125633))))

(declare-fun lt!125628 () Unit!7721)

(assert (=> b!250655 (= lt!125628 lt!125631)))

(declare-fun lt!125641 () ListLongMap!3681)

(assert (=> b!250655 (= lt!125641 (getCurrentListMapNoExtraKeys!556 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125645 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125645 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125636 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125636 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125647 () Unit!7721)

(assert (=> b!250655 (= lt!125647 (addApplyDifferent!216 lt!125641 lt!125645 (zeroValue!4468 thiss!1504) lt!125636))))

(assert (=> b!250655 (= (apply!240 (+!667 lt!125641 (tuple2!4767 lt!125645 (zeroValue!4468 thiss!1504))) lt!125636) (apply!240 lt!125641 lt!125636))))

(declare-fun lt!125638 () Unit!7721)

(assert (=> b!250655 (= lt!125638 lt!125647)))

(declare-fun lt!125635 () ListLongMap!3681)

(assert (=> b!250655 (= lt!125635 (getCurrentListMapNoExtraKeys!556 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun lt!125637 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125637 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125639 () (_ BitVec 64))

(assert (=> b!250655 (= lt!125639 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250655 (= lt!125634 (addApplyDifferent!216 lt!125635 lt!125637 (minValue!4468 thiss!1504) lt!125639))))

(assert (=> b!250655 (= (apply!240 (+!667 lt!125635 (tuple2!4767 lt!125637 (minValue!4468 thiss!1504))) lt!125639) (apply!240 lt!125635 lt!125639))))

(declare-fun b!250656 () Bool)

(declare-fun e!162564 () Bool)

(assert (=> b!250656 (= e!162564 (= (apply!240 lt!125642 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4468 thiss!1504)))))

(declare-fun b!250657 () Bool)

(declare-fun e!162566 () ListLongMap!3681)

(assert (=> b!250657 (= e!162566 call!23547)))

(declare-fun bm!23542 () Bool)

(assert (=> bm!23542 (= call!23545 (contains!1793 lt!125642 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250658 () Bool)

(declare-fun e!162567 () Bool)

(declare-fun e!162568 () Bool)

(assert (=> b!250658 (= e!162567 e!162568)))

(declare-fun res!122754 () Bool)

(declare-fun call!23549 () Bool)

(assert (=> b!250658 (= res!122754 call!23549)))

(assert (=> b!250658 (=> (not res!122754) (not e!162568))))

(declare-fun b!250659 () Bool)

(assert (=> b!250659 (= e!162568 (= (apply!240 lt!125642 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4468 thiss!1504)))))

(declare-fun b!250660 () Bool)

(declare-fun res!122757 () Bool)

(assert (=> b!250660 (=> (not res!122757) (not e!162563))))

(assert (=> b!250660 (= res!122757 e!162567)))

(declare-fun c!42137 () Bool)

(assert (=> b!250660 (= c!42137 (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23543 () Bool)

(declare-fun call!23546 () ListLongMap!3681)

(declare-fun call!23550 () ListLongMap!3681)

(assert (=> bm!23543 (= call!23546 call!23550)))

(declare-fun b!250661 () Bool)

(declare-fun c!42133 () Bool)

(assert (=> b!250661 (= c!42133 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!250661 (= e!162566 e!162562)))

(declare-fun b!250650 () Bool)

(declare-fun Unit!7733 () Unit!7721)

(assert (=> b!250650 (= e!162559 Unit!7733)))

(declare-fun d!61037 () Bool)

(assert (=> d!61037 e!162563))

(declare-fun res!122755 () Bool)

(assert (=> d!61037 (=> (not res!122755) (not e!162563))))

(assert (=> d!61037 (= res!122755 (or (bvsge #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))))

(declare-fun lt!125649 () ListLongMap!3681)

(assert (=> d!61037 (= lt!125642 lt!125649)))

(declare-fun lt!125632 () Unit!7721)

(assert (=> d!61037 (= lt!125632 e!162559)))

(declare-fun c!42134 () Bool)

(declare-fun e!162558 () Bool)

(assert (=> d!61037 (= c!42134 e!162558)))

(declare-fun res!122753 () Bool)

(assert (=> d!61037 (=> (not res!122753) (not e!162558))))

(assert (=> d!61037 (= res!122753 (bvslt #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun e!162556 () ListLongMap!3681)

(assert (=> d!61037 (= lt!125649 e!162556)))

(declare-fun c!42138 () Bool)

(assert (=> d!61037 (= c!42138 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61037 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61037 (= (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) lt!125642)))

(declare-fun b!250662 () Bool)

(assert (=> b!250662 (= e!162563 e!162560)))

(declare-fun c!42136 () Bool)

(assert (=> b!250662 (= c!42136 (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250663 () Bool)

(assert (=> b!250663 (= e!162562 call!23547)))

(declare-fun bm!23544 () Bool)

(assert (=> bm!23544 (= call!23544 call!23546)))

(declare-fun b!250664 () Bool)

(assert (=> b!250664 (= e!162556 (+!667 call!23548 (tuple2!4767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4468 thiss!1504))))))

(declare-fun b!250665 () Bool)

(assert (=> b!250665 (= e!162558 (validKeyInArray!0 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250666 () Bool)

(assert (=> b!250666 (= e!162556 e!162566)))

(declare-fun c!42135 () Bool)

(assert (=> b!250666 (= c!42135 (and (not (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4364 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23545 () Bool)

(assert (=> bm!23545 (= call!23550 (getCurrentListMapNoExtraKeys!556 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(declare-fun b!250667 () Bool)

(assert (=> b!250667 (= e!162567 (not call!23549))))

(declare-fun bm!23546 () Bool)

(assert (=> bm!23546 (= call!23548 (+!667 (ite c!42138 call!23550 (ite c!42135 call!23546 call!23544)) (ite (or c!42138 c!42135) (tuple2!4767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4468 thiss!1504)) (tuple2!4767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4468 thiss!1504)))))))

(declare-fun b!250668 () Bool)

(assert (=> b!250668 (= e!162561 e!162557)))

(declare-fun res!122751 () Bool)

(assert (=> b!250668 (=> (not res!122751) (not e!162557))))

(assert (=> b!250668 (= res!122751 (contains!1793 lt!125642 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun b!250669 () Bool)

(assert (=> b!250669 (= e!162560 e!162564)))

(declare-fun res!122752 () Bool)

(assert (=> b!250669 (= res!122752 call!23545)))

(assert (=> b!250669 (=> (not res!122752) (not e!162564))))

(declare-fun b!250670 () Bool)

(assert (=> b!250670 (= e!162565 (validKeyInArray!0 (select (arr!5828 (_keys!6763 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23547 () Bool)

(assert (=> bm!23547 (= call!23549 (contains!1793 lt!125642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!61037 c!42138) b!250664))

(assert (= (and d!61037 (not c!42138)) b!250666))

(assert (= (and b!250666 c!42135) b!250657))

(assert (= (and b!250666 (not c!42135)) b!250661))

(assert (= (and b!250661 c!42133) b!250663))

(assert (= (and b!250661 (not c!42133)) b!250652))

(assert (= (or b!250663 b!250652) bm!23544))

(assert (= (or b!250657 bm!23544) bm!23543))

(assert (= (or b!250657 b!250663) bm!23541))

(assert (= (or b!250664 bm!23543) bm!23545))

(assert (= (or b!250664 bm!23541) bm!23546))

(assert (= (and d!61037 res!122753) b!250665))

(assert (= (and d!61037 c!42134) b!250655))

(assert (= (and d!61037 (not c!42134)) b!250650))

(assert (= (and d!61037 res!122755) b!250653))

(assert (= (and b!250653 res!122750) b!250670))

(assert (= (and b!250653 (not res!122758)) b!250668))

(assert (= (and b!250668 res!122751) b!250651))

(assert (= (and b!250653 res!122756) b!250660))

(assert (= (and b!250660 c!42137) b!250658))

(assert (= (and b!250660 (not c!42137)) b!250667))

(assert (= (and b!250658 res!122754) b!250659))

(assert (= (or b!250658 b!250667) bm!23547))

(assert (= (and b!250660 res!122757) b!250662))

(assert (= (and b!250662 c!42136) b!250669))

(assert (= (and b!250662 (not c!42136)) b!250654))

(assert (= (and b!250669 res!122752) b!250656))

(assert (= (or b!250669 b!250654) bm!23542))

(declare-fun b_lambda!8109 () Bool)

(assert (=> (not b_lambda!8109) (not b!250651)))

(declare-fun t!8670 () Bool)

(declare-fun tb!2985 () Bool)

(assert (=> (and b!250367 (= (defaultEntry!4627 thiss!1504) (defaultEntry!4627 thiss!1504)) t!8670) tb!2985))

(declare-fun result!5293 () Bool)

(assert (=> tb!2985 (= result!5293 tp_is_empty!6487)))

(assert (=> b!250651 t!8670))

(declare-fun b_and!13665 () Bool)

(assert (= b_and!13659 (and (=> t!8670 result!5293) b_and!13665)))

(assert (=> b!250668 m!267139))

(assert (=> b!250668 m!267139))

(declare-fun m!267175 () Bool)

(assert (=> b!250668 m!267175))

(declare-fun m!267177 () Bool)

(assert (=> b!250656 m!267177))

(assert (=> d!61037 m!266969))

(assert (=> b!250670 m!267139))

(assert (=> b!250670 m!267139))

(assert (=> b!250670 m!267141))

(assert (=> b!250651 m!267139))

(declare-fun m!267179 () Bool)

(assert (=> b!250651 m!267179))

(assert (=> b!250651 m!267139))

(declare-fun m!267181 () Bool)

(assert (=> b!250651 m!267181))

(declare-fun m!267183 () Bool)

(assert (=> b!250651 m!267183))

(assert (=> b!250651 m!267179))

(assert (=> b!250651 m!267183))

(declare-fun m!267185 () Bool)

(assert (=> b!250651 m!267185))

(declare-fun m!267187 () Bool)

(assert (=> b!250659 m!267187))

(declare-fun m!267189 () Bool)

(assert (=> bm!23542 m!267189))

(declare-fun m!267191 () Bool)

(assert (=> bm!23546 m!267191))

(declare-fun m!267193 () Bool)

(assert (=> bm!23545 m!267193))

(declare-fun m!267195 () Bool)

(assert (=> b!250655 m!267195))

(declare-fun m!267197 () Bool)

(assert (=> b!250655 m!267197))

(declare-fun m!267199 () Bool)

(assert (=> b!250655 m!267199))

(declare-fun m!267201 () Bool)

(assert (=> b!250655 m!267201))

(declare-fun m!267203 () Bool)

(assert (=> b!250655 m!267203))

(assert (=> b!250655 m!267139))

(declare-fun m!267205 () Bool)

(assert (=> b!250655 m!267205))

(assert (=> b!250655 m!267195))

(declare-fun m!267207 () Bool)

(assert (=> b!250655 m!267207))

(declare-fun m!267209 () Bool)

(assert (=> b!250655 m!267209))

(assert (=> b!250655 m!267201))

(declare-fun m!267211 () Bool)

(assert (=> b!250655 m!267211))

(declare-fun m!267213 () Bool)

(assert (=> b!250655 m!267213))

(declare-fun m!267215 () Bool)

(assert (=> b!250655 m!267215))

(declare-fun m!267217 () Bool)

(assert (=> b!250655 m!267217))

(assert (=> b!250655 m!267211))

(declare-fun m!267219 () Bool)

(assert (=> b!250655 m!267219))

(assert (=> b!250655 m!267193))

(declare-fun m!267221 () Bool)

(assert (=> b!250655 m!267221))

(assert (=> b!250655 m!267207))

(declare-fun m!267223 () Bool)

(assert (=> b!250655 m!267223))

(declare-fun m!267225 () Bool)

(assert (=> b!250664 m!267225))

(declare-fun m!267227 () Bool)

(assert (=> bm!23547 m!267227))

(assert (=> b!250665 m!267139))

(assert (=> b!250665 m!267139))

(assert (=> b!250665 m!267141))

(assert (=> b!250375 d!61037))

(declare-fun d!61039 () Bool)

(assert (=> d!61039 (contains!1793 (getCurrentListMap!1388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) key!932)))

(declare-fun lt!125652 () Unit!7721)

(declare-fun choose!1193 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) (_ BitVec 32) Int) Unit!7721)

(assert (=> d!61039 (= lt!125652 (choose!1193 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!61039 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61039 (= (lemmaArrayContainsKeyThenInListMap!213 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4627 thiss!1504)) lt!125652)))

(declare-fun bs!9002 () Bool)

(assert (= bs!9002 d!61039))

(assert (=> bs!9002 m!266995))

(assert (=> bs!9002 m!266995))

(assert (=> bs!9002 m!266997))

(declare-fun m!267229 () Bool)

(assert (=> bs!9002 m!267229))

(assert (=> bs!9002 m!266969))

(assert (=> b!250370 d!61039))

(declare-fun b!250689 () Bool)

(declare-fun res!122770 () Bool)

(declare-fun e!162580 () Bool)

(assert (=> b!250689 (=> (not res!122770) (not e!162580))))

(declare-fun call!23556 () Bool)

(assert (=> b!250689 (= res!122770 call!23556)))

(declare-fun e!162578 () Bool)

(assert (=> b!250689 (= e!162578 e!162580)))

(declare-fun b!250690 () Bool)

(declare-fun e!162579 () Bool)

(assert (=> b!250690 (= e!162579 e!162578)))

(declare-fun c!42143 () Bool)

(declare-fun lt!125658 () SeekEntryResult!1087)

(assert (=> b!250690 (= c!42143 ((_ is MissingVacant!1087) lt!125658))))

(declare-fun b!250691 () Bool)

(declare-fun res!122769 () Bool)

(assert (=> b!250691 (=> (not res!122769) (not e!162580))))

(assert (=> b!250691 (= res!122769 (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6521 lt!125658)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250691 (and (bvsge (index!6521 lt!125658) #b00000000000000000000000000000000) (bvslt (index!6521 lt!125658) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun bm!23552 () Bool)

(declare-fun call!23555 () Bool)

(assert (=> bm!23552 (= call!23555 (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!61041 () Bool)

(assert (=> d!61041 e!162579))

(declare-fun c!42144 () Bool)

(assert (=> d!61041 (= c!42144 ((_ is MissingZero!1087) lt!125658))))

(assert (=> d!61041 (= lt!125658 (seekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(declare-fun lt!125657 () Unit!7721)

(declare-fun choose!1194 (array!12291 array!12289 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7721)

(assert (=> d!61041 (= lt!125657 (choose!1194 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> d!61041 (validMask!0 (mask!10810 thiss!1504))))

(assert (=> d!61041 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!388 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)) lt!125657)))

(declare-fun b!250692 () Bool)

(assert (=> b!250692 (= e!162578 ((_ is Undefined!1087) lt!125658))))

(declare-fun bm!23553 () Bool)

(assert (=> bm!23553 (= call!23556 (inRange!0 (ite c!42144 (index!6518 lt!125658) (index!6521 lt!125658)) (mask!10810 thiss!1504)))))

(declare-fun b!250693 () Bool)

(declare-fun e!162577 () Bool)

(assert (=> b!250693 (= e!162577 (not call!23555))))

(declare-fun b!250694 () Bool)

(assert (=> b!250694 (and (bvsge (index!6518 lt!125658) #b00000000000000000000000000000000) (bvslt (index!6518 lt!125658) (size!6173 (_keys!6763 thiss!1504))))))

(declare-fun res!122767 () Bool)

(assert (=> b!250694 (= res!122767 (= (select (arr!5828 (_keys!6763 thiss!1504)) (index!6518 lt!125658)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250694 (=> (not res!122767) (not e!162577))))

(declare-fun b!250695 () Bool)

(assert (=> b!250695 (= e!162579 e!162577)))

(declare-fun res!122768 () Bool)

(assert (=> b!250695 (= res!122768 call!23556)))

(assert (=> b!250695 (=> (not res!122768) (not e!162577))))

(declare-fun b!250696 () Bool)

(assert (=> b!250696 (= e!162580 (not call!23555))))

(assert (= (and d!61041 c!42144) b!250695))

(assert (= (and d!61041 (not c!42144)) b!250690))

(assert (= (and b!250695 res!122768) b!250694))

(assert (= (and b!250694 res!122767) b!250693))

(assert (= (and b!250690 c!42143) b!250689))

(assert (= (and b!250690 (not c!42143)) b!250692))

(assert (= (and b!250689 res!122770) b!250691))

(assert (= (and b!250691 res!122769) b!250696))

(assert (= (or b!250695 b!250689) bm!23553))

(assert (= (or b!250693 b!250696) bm!23552))

(assert (=> bm!23552 m!266971))

(declare-fun m!267231 () Bool)

(assert (=> bm!23553 m!267231))

(declare-fun m!267233 () Bool)

(assert (=> b!250691 m!267233))

(assert (=> d!61041 m!266967))

(declare-fun m!267235 () Bool)

(assert (=> d!61041 m!267235))

(assert (=> d!61041 m!266969))

(declare-fun m!267237 () Bool)

(assert (=> b!250694 m!267237))

(assert (=> b!250362 d!61041))

(declare-fun d!61043 () Bool)

(declare-fun res!122777 () Bool)

(declare-fun e!162583 () Bool)

(assert (=> d!61043 (=> (not res!122777) (not e!162583))))

(declare-fun simpleValid!263 (LongMapFixedSize!3700) Bool)

(assert (=> d!61043 (= res!122777 (simpleValid!263 thiss!1504))))

(assert (=> d!61043 (= (valid!1457 thiss!1504) e!162583)))

(declare-fun b!250703 () Bool)

(declare-fun res!122778 () Bool)

(assert (=> b!250703 (=> (not res!122778) (not e!162583))))

(assert (=> b!250703 (= res!122778 (= (arrayCountValidKeys!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 (size!6173 (_keys!6763 thiss!1504))) (_size!1899 thiss!1504)))))

(declare-fun b!250704 () Bool)

(declare-fun res!122779 () Bool)

(assert (=> b!250704 (=> (not res!122779) (not e!162583))))

(assert (=> b!250704 (= res!122779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6763 thiss!1504) (mask!10810 thiss!1504)))))

(declare-fun b!250705 () Bool)

(assert (=> b!250705 (= e!162583 (arrayNoDuplicates!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 Nil!3639))))

(assert (= (and d!61043 res!122777) b!250703))

(assert (= (and b!250703 res!122778) b!250704))

(assert (= (and b!250704 res!122779) b!250705))

(declare-fun m!267239 () Bool)

(assert (=> d!61043 m!267239))

(assert (=> b!250703 m!266985))

(declare-fun m!267241 () Bool)

(assert (=> b!250704 m!267241))

(declare-fun m!267243 () Bool)

(assert (=> b!250705 m!267243))

(assert (=> start!23882 d!61043))

(declare-fun mapNonEmpty!11032 () Bool)

(declare-fun mapRes!11032 () Bool)

(declare-fun tp!23155 () Bool)

(declare-fun e!162589 () Bool)

(assert (=> mapNonEmpty!11032 (= mapRes!11032 (and tp!23155 e!162589))))

(declare-fun mapKey!11032 () (_ BitVec 32))

(declare-fun mapValue!11032 () ValueCell!2900)

(declare-fun mapRest!11032 () (Array (_ BitVec 32) ValueCell!2900))

(assert (=> mapNonEmpty!11032 (= mapRest!11023 (store mapRest!11032 mapKey!11032 mapValue!11032))))

(declare-fun mapIsEmpty!11032 () Bool)

(assert (=> mapIsEmpty!11032 mapRes!11032))

(declare-fun condMapEmpty!11032 () Bool)

(declare-fun mapDefault!11032 () ValueCell!2900)

(assert (=> mapNonEmpty!11023 (= condMapEmpty!11032 (= mapRest!11023 ((as const (Array (_ BitVec 32) ValueCell!2900)) mapDefault!11032)))))

(declare-fun e!162588 () Bool)

(assert (=> mapNonEmpty!11023 (= tp!23140 (and e!162588 mapRes!11032))))

(declare-fun b!250712 () Bool)

(assert (=> b!250712 (= e!162589 tp_is_empty!6487)))

(declare-fun b!250713 () Bool)

(assert (=> b!250713 (= e!162588 tp_is_empty!6487)))

(assert (= (and mapNonEmpty!11023 condMapEmpty!11032) mapIsEmpty!11032))

(assert (= (and mapNonEmpty!11023 (not condMapEmpty!11032)) mapNonEmpty!11032))

(assert (= (and mapNonEmpty!11032 ((_ is ValueCellFull!2900) mapValue!11032)) b!250712))

(assert (= (and mapNonEmpty!11023 ((_ is ValueCellFull!2900) mapDefault!11032)) b!250713))

(declare-fun m!267245 () Bool)

(assert (=> mapNonEmpty!11032 m!267245))

(declare-fun b_lambda!8111 () Bool)

(assert (= b_lambda!8109 (or (and b!250367 b_free!6625) b_lambda!8111)))

(check-sat (not b!250512) (not bm!23546) (not b!250569) (not bm!23523) (not bm!23547) (not d!61005) (not b!250605) (not d!61009) (not b!250664) (not b!250557) (not b!250670) (not mapNonEmpty!11032) (not b!250655) (not bm!23526) (not d!61037) (not b!250596) (not b!250553) (not bm!23520) (not b!250597) (not bm!23552) (not bm!23519) (not b!250543) (not b!250705) (not d!61023) (not d!61007) (not b!250607) (not d!61043) (not b!250594) (not d!61021) tp_is_empty!6487 (not b!250651) (not b_lambda!8111) (not bm!23553) b_and!13665 (not b!250668) (not b!250577) (not b!250703) (not d!61035) (not b!250583) (not b!250580) (not b!250659) (not d!61039) (not b_next!6625) (not b!250665) (not b!250704) (not bm!23545) (not bm!23542) (not b!250570) (not b!250540) (not b!250656) (not b!250541) (not d!61041) (not b!250528))
(check-sat b_and!13665 (not b_next!6625))
