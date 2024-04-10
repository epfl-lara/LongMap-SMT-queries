; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22032 () Bool)

(assert start!22032)

(declare-fun b!227348 () Bool)

(declare-fun b_free!6099 () Bool)

(declare-fun b_next!6099 () Bool)

(assert (=> b!227348 (= b_free!6099 (not b_next!6099))))

(declare-fun tp!21439 () Bool)

(declare-fun b_and!12997 () Bool)

(assert (=> b!227348 (= tp!21439 b_and!12997)))

(declare-fun b!227331 () Bool)

(declare-datatypes ((Unit!6890 0))(
  ( (Unit!6891) )
))
(declare-fun e!147480 () Unit!6890)

(declare-fun Unit!6892 () Unit!6890)

(assert (=> b!227331 (= e!147480 Unit!6892)))

(declare-fun lt!114405 () Unit!6890)

(declare-datatypes ((V!7595 0))(
  ( (V!7596 (val!3025 Int)) )
))
(declare-datatypes ((ValueCell!2637 0))(
  ( (ValueCellFull!2637 (v!5045 V!7595)) (EmptyCell!2637) )
))
(declare-datatypes ((array!11165 0))(
  ( (array!11166 (arr!5302 (Array (_ BitVec 32) ValueCell!2637)) (size!5635 (_ BitVec 32))) )
))
(declare-datatypes ((array!11167 0))(
  ( (array!11168 (arr!5303 (Array (_ BitVec 32) (_ BitVec 64))) (size!5636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3174 0))(
  ( (LongMapFixedSize!3175 (defaultEntry!4246 Int) (mask!10106 (_ BitVec 32)) (extraKeys!3983 (_ BitVec 32)) (zeroValue!4087 V!7595) (minValue!4087 V!7595) (_size!1636 (_ BitVec 32)) (_keys!6300 array!11167) (_values!4229 array!11165) (_vacant!1636 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3174)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!102 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7595 V!7595 (_ BitVec 64) (_ BitVec 32) Int) Unit!6890)

(assert (=> b!227331 (= lt!114405 (lemmaArrayContainsKeyThenInListMap!102 (_keys!6300 thiss!1504) (_values!4229 thiss!1504) (mask!10106 thiss!1504) (extraKeys!3983 thiss!1504) (zeroValue!4087 thiss!1504) (minValue!4087 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4246 thiss!1504)))))

(assert (=> b!227331 false))

(declare-fun b!227332 () Bool)

(declare-fun res!111918 () Bool)

(declare-fun e!147492 () Bool)

(assert (=> b!227332 (=> (not res!111918) (not e!147492))))

(declare-fun call!21131 () Bool)

(assert (=> b!227332 (= res!111918 call!21131)))

(declare-fun e!147482 () Bool)

(assert (=> b!227332 (= e!147482 e!147492)))

(declare-fun b!227333 () Bool)

(declare-fun Unit!6893 () Unit!6890)

(assert (=> b!227333 (= e!147480 Unit!6893)))

(declare-fun b!227334 () Bool)

(declare-fun e!147494 () Bool)

(declare-fun e!147491 () Bool)

(assert (=> b!227334 (= e!147494 (not e!147491))))

(declare-fun res!111912 () Bool)

(assert (=> b!227334 (=> res!111912 e!147491)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227334 (= res!111912 (not (validMask!0 (mask!10106 thiss!1504))))))

(declare-fun lt!114402 () array!11167)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11167 (_ BitVec 32)) Bool)

(assert (=> b!227334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114402 (mask!10106 thiss!1504))))

(declare-fun lt!114399 () Unit!6890)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11167 (_ BitVec 32) (_ BitVec 32)) Unit!6890)

(assert (=> b!227334 (= lt!114399 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6300 thiss!1504) index!297 (mask!10106 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11167 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227334 (= (arrayCountValidKeys!0 lt!114402 #b00000000000000000000000000000000 (size!5636 (_keys!6300 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6300 thiss!1504) #b00000000000000000000000000000000 (size!5636 (_keys!6300 thiss!1504)))))))

(declare-fun lt!114403 () Unit!6890)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11167 (_ BitVec 32) (_ BitVec 64)) Unit!6890)

(assert (=> b!227334 (= lt!114403 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6300 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3389 0))(
  ( (Nil!3386) (Cons!3385 (h!4033 (_ BitVec 64)) (t!8348 List!3389)) )
))
(declare-fun arrayNoDuplicates!0 (array!11167 (_ BitVec 32) List!3389) Bool)

(assert (=> b!227334 (arrayNoDuplicates!0 lt!114402 #b00000000000000000000000000000000 Nil!3386)))

(assert (=> b!227334 (= lt!114402 (array!11168 (store (arr!5303 (_keys!6300 thiss!1504)) index!297 key!932) (size!5636 (_keys!6300 thiss!1504))))))

(declare-fun lt!114400 () Unit!6890)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11167 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3389) Unit!6890)

(assert (=> b!227334 (= lt!114400 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6300 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3386))))

(declare-fun lt!114397 () Unit!6890)

(assert (=> b!227334 (= lt!114397 e!147480)))

(declare-fun c!37692 () Bool)

(declare-fun arrayContainsKey!0 (array!11167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227334 (= c!37692 (arrayContainsKey!0 (_keys!6300 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227335 () Bool)

(declare-fun e!147481 () Bool)

(declare-fun e!147486 () Bool)

(assert (=> b!227335 (= e!147481 e!147486)))

(declare-fun res!111919 () Bool)

(assert (=> b!227335 (=> (not res!111919) (not e!147486))))

(declare-datatypes ((SeekEntryResult!893 0))(
  ( (MissingZero!893 (index!5742 (_ BitVec 32))) (Found!893 (index!5743 (_ BitVec 32))) (Intermediate!893 (undefined!1705 Bool) (index!5744 (_ BitVec 32)) (x!23273 (_ BitVec 32))) (Undefined!893) (MissingVacant!893 (index!5745 (_ BitVec 32))) )
))
(declare-fun lt!114398 () SeekEntryResult!893)

(assert (=> b!227335 (= res!111919 (or (= lt!114398 (MissingZero!893 index!297)) (= lt!114398 (MissingVacant!893 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11167 (_ BitVec 32)) SeekEntryResult!893)

(assert (=> b!227335 (= lt!114398 (seekEntryOrOpen!0 key!932 (_keys!6300 thiss!1504) (mask!10106 thiss!1504)))))

(declare-fun bm!21128 () Bool)

(declare-fun call!21132 () Bool)

(assert (=> bm!21128 (= call!21132 (arrayContainsKey!0 (_keys!6300 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227336 () Bool)

(assert (=> b!227336 (= e!147491 true)))

(declare-fun lt!114401 () Bool)

(assert (=> b!227336 (= lt!114401 (arrayNoDuplicates!0 (_keys!6300 thiss!1504) #b00000000000000000000000000000000 Nil!3386))))

(declare-fun b!227337 () Bool)

(declare-fun e!147483 () Bool)

(declare-fun tp_is_empty!5961 () Bool)

(assert (=> b!227337 (= e!147483 tp_is_empty!5961)))

(declare-fun b!227338 () Bool)

(declare-fun e!147484 () Bool)

(assert (=> b!227338 (= e!147484 (not call!21132))))

(declare-fun b!227339 () Bool)

(declare-fun c!37689 () Bool)

(get-info :version)

(assert (=> b!227339 (= c!37689 ((_ is MissingVacant!893) lt!114398))))

(declare-fun e!147493 () Bool)

(assert (=> b!227339 (= e!147482 e!147493)))

(declare-fun b!227340 () Bool)

(declare-fun e!147487 () Unit!6890)

(declare-fun lt!114406 () Unit!6890)

(assert (=> b!227340 (= e!147487 lt!114406)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!277 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7595 V!7595 (_ BitVec 64) Int) Unit!6890)

(assert (=> b!227340 (= lt!114406 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!277 (_keys!6300 thiss!1504) (_values!4229 thiss!1504) (mask!10106 thiss!1504) (extraKeys!3983 thiss!1504) (zeroValue!4087 thiss!1504) (minValue!4087 thiss!1504) key!932 (defaultEntry!4246 thiss!1504)))))

(declare-fun c!37690 () Bool)

(assert (=> b!227340 (= c!37690 ((_ is MissingZero!893) lt!114398))))

(assert (=> b!227340 e!147482))

(declare-fun b!227341 () Bool)

(assert (=> b!227341 (= e!147486 e!147494)))

(declare-fun res!111914 () Bool)

(assert (=> b!227341 (=> (not res!111914) (not e!147494))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227341 (= res!111914 (inRange!0 index!297 (mask!10106 thiss!1504)))))

(declare-fun lt!114404 () Unit!6890)

(assert (=> b!227341 (= lt!114404 e!147487)))

(declare-fun c!37691 () Bool)

(declare-datatypes ((tuple2!4470 0))(
  ( (tuple2!4471 (_1!2246 (_ BitVec 64)) (_2!2246 V!7595)) )
))
(declare-datatypes ((List!3390 0))(
  ( (Nil!3387) (Cons!3386 (h!4034 tuple2!4470) (t!8349 List!3390)) )
))
(declare-datatypes ((ListLongMap!3383 0))(
  ( (ListLongMap!3384 (toList!1707 List!3390)) )
))
(declare-fun contains!1581 (ListLongMap!3383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1235 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7595 V!7595 (_ BitVec 32) Int) ListLongMap!3383)

(assert (=> b!227341 (= c!37691 (contains!1581 (getCurrentListMap!1235 (_keys!6300 thiss!1504) (_values!4229 thiss!1504) (mask!10106 thiss!1504) (extraKeys!3983 thiss!1504) (zeroValue!4087 thiss!1504) (minValue!4087 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4246 thiss!1504)) key!932))))

(declare-fun b!227342 () Bool)

(declare-fun e!147488 () Bool)

(assert (=> b!227342 (= e!147488 tp_is_empty!5961)))

(declare-fun bm!21129 () Bool)

(assert (=> bm!21129 (= call!21131 (inRange!0 (ite c!37690 (index!5742 lt!114398) (index!5745 lt!114398)) (mask!10106 thiss!1504)))))

(declare-fun b!227343 () Bool)

(assert (=> b!227343 (= e!147492 (not call!21132))))

(declare-fun mapIsEmpty!10111 () Bool)

(declare-fun mapRes!10111 () Bool)

(assert (=> mapIsEmpty!10111 mapRes!10111))

(declare-fun b!227344 () Bool)

(assert (=> b!227344 (= e!147493 ((_ is Undefined!893) lt!114398))))

(declare-fun b!227345 () Bool)

(declare-fun res!111916 () Bool)

(assert (=> b!227345 (=> res!111916 e!147491)))

(assert (=> b!227345 (= res!111916 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6300 thiss!1504) (mask!10106 thiss!1504))))))

(declare-fun b!227346 () Bool)

(declare-fun e!147490 () Bool)

(assert (=> b!227346 (= e!147490 (and e!147483 mapRes!10111))))

(declare-fun condMapEmpty!10111 () Bool)

(declare-fun mapDefault!10111 () ValueCell!2637)

(assert (=> b!227346 (= condMapEmpty!10111 (= (arr!5302 (_values!4229 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2637)) mapDefault!10111)))))

(declare-fun b!227347 () Bool)

(assert (=> b!227347 (= e!147493 e!147484)))

(declare-fun res!111917 () Bool)

(assert (=> b!227347 (= res!111917 call!21131)))

(assert (=> b!227347 (=> (not res!111917) (not e!147484))))

(declare-fun res!111910 () Bool)

(assert (=> start!22032 (=> (not res!111910) (not e!147481))))

(declare-fun valid!1274 (LongMapFixedSize!3174) Bool)

(assert (=> start!22032 (= res!111910 (valid!1274 thiss!1504))))

(assert (=> start!22032 e!147481))

(declare-fun e!147485 () Bool)

(assert (=> start!22032 e!147485))

(assert (=> start!22032 true))

(declare-fun mapNonEmpty!10111 () Bool)

(declare-fun tp!21438 () Bool)

(assert (=> mapNonEmpty!10111 (= mapRes!10111 (and tp!21438 e!147488))))

(declare-fun mapKey!10111 () (_ BitVec 32))

(declare-fun mapValue!10111 () ValueCell!2637)

(declare-fun mapRest!10111 () (Array (_ BitVec 32) ValueCell!2637))

(assert (=> mapNonEmpty!10111 (= (arr!5302 (_values!4229 thiss!1504)) (store mapRest!10111 mapKey!10111 mapValue!10111))))

(declare-fun array_inv!3505 (array!11167) Bool)

(declare-fun array_inv!3506 (array!11165) Bool)

(assert (=> b!227348 (= e!147485 (and tp!21439 tp_is_empty!5961 (array_inv!3505 (_keys!6300 thiss!1504)) (array_inv!3506 (_values!4229 thiss!1504)) e!147490))))

(declare-fun b!227349 () Bool)

(declare-fun res!111913 () Bool)

(assert (=> b!227349 (= res!111913 (= (select (arr!5303 (_keys!6300 thiss!1504)) (index!5745 lt!114398)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227349 (=> (not res!111913) (not e!147484))))

(declare-fun b!227350 () Bool)

(declare-fun res!111915 () Bool)

(assert (=> b!227350 (=> res!111915 e!147491)))

(assert (=> b!227350 (= res!111915 (or (not (= (size!5635 (_values!4229 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10106 thiss!1504)))) (not (= (size!5636 (_keys!6300 thiss!1504)) (size!5635 (_values!4229 thiss!1504)))) (bvslt (mask!10106 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3983 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3983 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227351 () Bool)

(declare-fun Unit!6894 () Unit!6890)

(assert (=> b!227351 (= e!147487 Unit!6894)))

(declare-fun lt!114407 () Unit!6890)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!263 (array!11167 array!11165 (_ BitVec 32) (_ BitVec 32) V!7595 V!7595 (_ BitVec 64) Int) Unit!6890)

(assert (=> b!227351 (= lt!114407 (lemmaInListMapThenSeekEntryOrOpenFindsIt!263 (_keys!6300 thiss!1504) (_values!4229 thiss!1504) (mask!10106 thiss!1504) (extraKeys!3983 thiss!1504) (zeroValue!4087 thiss!1504) (minValue!4087 thiss!1504) key!932 (defaultEntry!4246 thiss!1504)))))

(assert (=> b!227351 false))

(declare-fun b!227352 () Bool)

(declare-fun res!111911 () Bool)

(assert (=> b!227352 (=> (not res!111911) (not e!147481))))

(assert (=> b!227352 (= res!111911 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227353 () Bool)

(declare-fun res!111909 () Bool)

(assert (=> b!227353 (=> (not res!111909) (not e!147492))))

(assert (=> b!227353 (= res!111909 (= (select (arr!5303 (_keys!6300 thiss!1504)) (index!5742 lt!114398)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22032 res!111910) b!227352))

(assert (= (and b!227352 res!111911) b!227335))

(assert (= (and b!227335 res!111919) b!227341))

(assert (= (and b!227341 c!37691) b!227351))

(assert (= (and b!227341 (not c!37691)) b!227340))

(assert (= (and b!227340 c!37690) b!227332))

(assert (= (and b!227340 (not c!37690)) b!227339))

(assert (= (and b!227332 res!111918) b!227353))

(assert (= (and b!227353 res!111909) b!227343))

(assert (= (and b!227339 c!37689) b!227347))

(assert (= (and b!227339 (not c!37689)) b!227344))

(assert (= (and b!227347 res!111917) b!227349))

(assert (= (and b!227349 res!111913) b!227338))

(assert (= (or b!227332 b!227347) bm!21129))

(assert (= (or b!227343 b!227338) bm!21128))

(assert (= (and b!227341 res!111914) b!227334))

(assert (= (and b!227334 c!37692) b!227331))

(assert (= (and b!227334 (not c!37692)) b!227333))

(assert (= (and b!227334 (not res!111912)) b!227350))

(assert (= (and b!227350 (not res!111915)) b!227345))

(assert (= (and b!227345 (not res!111916)) b!227336))

(assert (= (and b!227346 condMapEmpty!10111) mapIsEmpty!10111))

(assert (= (and b!227346 (not condMapEmpty!10111)) mapNonEmpty!10111))

(assert (= (and mapNonEmpty!10111 ((_ is ValueCellFull!2637) mapValue!10111)) b!227342))

(assert (= (and b!227346 ((_ is ValueCellFull!2637) mapDefault!10111)) b!227337))

(assert (= b!227348 b!227346))

(assert (= start!22032 b!227348))

(declare-fun m!249363 () Bool)

(assert (=> start!22032 m!249363))

(declare-fun m!249365 () Bool)

(assert (=> b!227345 m!249365))

(declare-fun m!249367 () Bool)

(assert (=> bm!21129 m!249367))

(declare-fun m!249369 () Bool)

(assert (=> b!227334 m!249369))

(declare-fun m!249371 () Bool)

(assert (=> b!227334 m!249371))

(declare-fun m!249373 () Bool)

(assert (=> b!227334 m!249373))

(declare-fun m!249375 () Bool)

(assert (=> b!227334 m!249375))

(declare-fun m!249377 () Bool)

(assert (=> b!227334 m!249377))

(declare-fun m!249379 () Bool)

(assert (=> b!227334 m!249379))

(declare-fun m!249381 () Bool)

(assert (=> b!227334 m!249381))

(declare-fun m!249383 () Bool)

(assert (=> b!227334 m!249383))

(declare-fun m!249385 () Bool)

(assert (=> b!227334 m!249385))

(declare-fun m!249387 () Bool)

(assert (=> b!227334 m!249387))

(declare-fun m!249389 () Bool)

(assert (=> b!227349 m!249389))

(declare-fun m!249391 () Bool)

(assert (=> b!227331 m!249391))

(declare-fun m!249393 () Bool)

(assert (=> b!227353 m!249393))

(declare-fun m!249395 () Bool)

(assert (=> b!227351 m!249395))

(assert (=> bm!21128 m!249371))

(declare-fun m!249397 () Bool)

(assert (=> b!227335 m!249397))

(declare-fun m!249399 () Bool)

(assert (=> mapNonEmpty!10111 m!249399))

(declare-fun m!249401 () Bool)

(assert (=> b!227348 m!249401))

(declare-fun m!249403 () Bool)

(assert (=> b!227348 m!249403))

(declare-fun m!249405 () Bool)

(assert (=> b!227340 m!249405))

(declare-fun m!249407 () Bool)

(assert (=> b!227341 m!249407))

(declare-fun m!249409 () Bool)

(assert (=> b!227341 m!249409))

(assert (=> b!227341 m!249409))

(declare-fun m!249411 () Bool)

(assert (=> b!227341 m!249411))

(declare-fun m!249413 () Bool)

(assert (=> b!227336 m!249413))

(check-sat (not start!22032) (not b!227335) (not b!227340) tp_is_empty!5961 (not b!227348) (not b!227345) (not b!227341) (not b!227336) (not bm!21129) (not b!227334) (not b!227351) (not bm!21128) (not b!227331) (not mapNonEmpty!10111) b_and!12997 (not b_next!6099))
(check-sat b_and!12997 (not b_next!6099))
