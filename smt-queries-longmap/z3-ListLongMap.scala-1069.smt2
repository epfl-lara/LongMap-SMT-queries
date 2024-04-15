; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22100 () Bool)

(assert start!22100)

(declare-fun b!229411 () Bool)

(declare-fun b_free!6163 () Bool)

(declare-fun b_next!6163 () Bool)

(assert (=> b!229411 (= b_free!6163 (not b_next!6163))))

(declare-fun tp!21631 () Bool)

(declare-fun b_and!13035 () Bool)

(assert (=> b!229411 (= tp!21631 b_and!13035)))

(declare-fun b!229392 () Bool)

(declare-datatypes ((Unit!6969 0))(
  ( (Unit!6970) )
))
(declare-fun e!148826 () Unit!6969)

(declare-fun Unit!6971 () Unit!6969)

(assert (=> b!229392 (= e!148826 Unit!6971)))

(declare-fun lt!115277 () Unit!6969)

(declare-datatypes ((V!7681 0))(
  ( (V!7682 (val!3057 Int)) )
))
(declare-datatypes ((ValueCell!2669 0))(
  ( (ValueCellFull!2669 (v!5071 V!7681)) (EmptyCell!2669) )
))
(declare-datatypes ((array!11285 0))(
  ( (array!11286 (arr!5361 (Array (_ BitVec 32) ValueCell!2669)) (size!5695 (_ BitVec 32))) )
))
(declare-datatypes ((array!11287 0))(
  ( (array!11288 (arr!5362 (Array (_ BitVec 32) (_ BitVec 64))) (size!5696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3238 0))(
  ( (LongMapFixedSize!3239 (defaultEntry!4278 Int) (mask!10159 (_ BitVec 32)) (extraKeys!4015 (_ BitVec 32)) (zeroValue!4119 V!7681) (minValue!4119 V!7681) (_size!1668 (_ BitVec 32)) (_keys!6331 array!11287) (_values!4261 array!11285) (_vacant!1668 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3238)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!280 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) Int) Unit!6969)

(assert (=> b!229392 (= lt!115277 (lemmaInListMapThenSeekEntryOrOpenFindsIt!280 (_keys!6331 thiss!1504) (_values!4261 thiss!1504) (mask!10159 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 (defaultEntry!4278 thiss!1504)))))

(assert (=> b!229392 false))

(declare-fun b!229393 () Bool)

(declare-fun e!148830 () Bool)

(assert (=> b!229393 (= e!148830 true)))

(declare-fun lt!115278 () Bool)

(declare-datatypes ((List!3420 0))(
  ( (Nil!3417) (Cons!3416 (h!4064 (_ BitVec 64)) (t!8370 List!3420)) )
))
(declare-fun arrayNoDuplicates!0 (array!11287 (_ BitVec 32) List!3420) Bool)

(assert (=> b!229393 (= lt!115278 (arrayNoDuplicates!0 (_keys!6331 thiss!1504) #b00000000000000000000000000000000 Nil!3417))))

(declare-fun b!229394 () Bool)

(declare-fun e!148831 () Bool)

(assert (=> b!229394 (= e!148831 (not e!148830))))

(declare-fun res!112870 () Bool)

(assert (=> b!229394 (=> res!112870 e!148830)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229394 (= res!112870 (not (validMask!0 (mask!10159 thiss!1504))))))

(declare-fun lt!115280 () array!11287)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11287 (_ BitVec 32)) Bool)

(assert (=> b!229394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115280 (mask!10159 thiss!1504))))

(declare-fun lt!115273 () Unit!6969)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11287 (_ BitVec 32) (_ BitVec 32)) Unit!6969)

(assert (=> b!229394 (= lt!115273 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6331 thiss!1504) index!297 (mask!10159 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11287 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229394 (= (arrayCountValidKeys!0 lt!115280 #b00000000000000000000000000000000 (size!5696 (_keys!6331 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6331 thiss!1504) #b00000000000000000000000000000000 (size!5696 (_keys!6331 thiss!1504)))))))

(declare-fun lt!115274 () Unit!6969)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11287 (_ BitVec 32) (_ BitVec 64)) Unit!6969)

(assert (=> b!229394 (= lt!115274 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6331 thiss!1504) index!297 key!932))))

(assert (=> b!229394 (arrayNoDuplicates!0 lt!115280 #b00000000000000000000000000000000 Nil!3417)))

(assert (=> b!229394 (= lt!115280 (array!11288 (store (arr!5362 (_keys!6331 thiss!1504)) index!297 key!932) (size!5696 (_keys!6331 thiss!1504))))))

(declare-fun lt!115276 () Unit!6969)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3420) Unit!6969)

(assert (=> b!229394 (= lt!115276 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6331 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3417))))

(declare-fun lt!115275 () Unit!6969)

(declare-fun e!148819 () Unit!6969)

(assert (=> b!229394 (= lt!115275 e!148819)))

(declare-fun c!38047 () Bool)

(declare-fun arrayContainsKey!0 (array!11287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229394 (= c!38047 (arrayContainsKey!0 (_keys!6331 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229395 () Bool)

(declare-fun res!112878 () Bool)

(assert (=> b!229395 (=> res!112878 e!148830)))

(assert (=> b!229395 (= res!112878 (or (not (= (size!5695 (_values!4261 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10159 thiss!1504)))) (not (= (size!5696 (_keys!6331 thiss!1504)) (size!5695 (_values!4261 thiss!1504)))) (bvslt (mask!10159 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4015 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229396 () Bool)

(declare-fun e!148824 () Bool)

(declare-datatypes ((SeekEntryResult!920 0))(
  ( (MissingZero!920 (index!5850 (_ BitVec 32))) (Found!920 (index!5851 (_ BitVec 32))) (Intermediate!920 (undefined!1732 Bool) (index!5852 (_ BitVec 32)) (x!23387 (_ BitVec 32))) (Undefined!920) (MissingVacant!920 (index!5853 (_ BitVec 32))) )
))
(declare-fun lt!115272 () SeekEntryResult!920)

(get-info :version)

(assert (=> b!229396 (= e!148824 ((_ is Undefined!920) lt!115272))))

(declare-fun mapNonEmpty!10207 () Bool)

(declare-fun mapRes!10207 () Bool)

(declare-fun tp!21630 () Bool)

(declare-fun e!148822 () Bool)

(assert (=> mapNonEmpty!10207 (= mapRes!10207 (and tp!21630 e!148822))))

(declare-fun mapRest!10207 () (Array (_ BitVec 32) ValueCell!2669))

(declare-fun mapKey!10207 () (_ BitVec 32))

(declare-fun mapValue!10207 () ValueCell!2669)

(assert (=> mapNonEmpty!10207 (= (arr!5361 (_values!4261 thiss!1504)) (store mapRest!10207 mapKey!10207 mapValue!10207))))

(declare-fun b!229397 () Bool)

(declare-fun res!112880 () Bool)

(declare-fun e!148832 () Bool)

(assert (=> b!229397 (=> (not res!112880) (not e!148832))))

(assert (=> b!229397 (= res!112880 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!112874 () Bool)

(assert (=> start!22100 (=> (not res!112874) (not e!148832))))

(declare-fun valid!1303 (LongMapFixedSize!3238) Bool)

(assert (=> start!22100 (= res!112874 (valid!1303 thiss!1504))))

(assert (=> start!22100 e!148832))

(declare-fun e!148829 () Bool)

(assert (=> start!22100 e!148829))

(assert (=> start!22100 true))

(declare-fun bm!21296 () Bool)

(declare-fun call!21299 () Bool)

(assert (=> bm!21296 (= call!21299 (arrayContainsKey!0 (_keys!6331 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229398 () Bool)

(declare-fun e!148833 () Bool)

(assert (=> b!229398 (= e!148833 e!148831)))

(declare-fun res!112879 () Bool)

(assert (=> b!229398 (=> (not res!112879) (not e!148831))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229398 (= res!112879 (inRange!0 index!297 (mask!10159 thiss!1504)))))

(declare-fun lt!115279 () Unit!6969)

(assert (=> b!229398 (= lt!115279 e!148826)))

(declare-fun c!38050 () Bool)

(declare-datatypes ((tuple2!4482 0))(
  ( (tuple2!4483 (_1!2252 (_ BitVec 64)) (_2!2252 V!7681)) )
))
(declare-datatypes ((List!3421 0))(
  ( (Nil!3418) (Cons!3417 (h!4065 tuple2!4482) (t!8371 List!3421)) )
))
(declare-datatypes ((ListLongMap!3385 0))(
  ( (ListLongMap!3386 (toList!1708 List!3421)) )
))
(declare-fun contains!1583 (ListLongMap!3385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1217 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 32) Int) ListLongMap!3385)

(assert (=> b!229398 (= c!38050 (contains!1583 (getCurrentListMap!1217 (_keys!6331 thiss!1504) (_values!4261 thiss!1504) (mask!10159 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4278 thiss!1504)) key!932))))

(declare-fun b!229399 () Bool)

(declare-fun e!148823 () Bool)

(assert (=> b!229399 (= e!148823 (not call!21299))))

(declare-fun b!229400 () Bool)

(declare-fun lt!115281 () Unit!6969)

(assert (=> b!229400 (= e!148826 lt!115281)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!277 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) Int) Unit!6969)

(assert (=> b!229400 (= lt!115281 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!277 (_keys!6331 thiss!1504) (_values!4261 thiss!1504) (mask!10159 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 (defaultEntry!4278 thiss!1504)))))

(declare-fun c!38049 () Bool)

(assert (=> b!229400 (= c!38049 ((_ is MissingZero!920) lt!115272))))

(declare-fun e!148820 () Bool)

(assert (=> b!229400 e!148820))

(declare-fun b!229401 () Bool)

(declare-fun res!112871 () Bool)

(assert (=> b!229401 (= res!112871 (= (select (arr!5362 (_keys!6331 thiss!1504)) (index!5853 lt!115272)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148828 () Bool)

(assert (=> b!229401 (=> (not res!112871) (not e!148828))))

(declare-fun b!229402 () Bool)

(assert (=> b!229402 (= e!148832 e!148833)))

(declare-fun res!112876 () Bool)

(assert (=> b!229402 (=> (not res!112876) (not e!148833))))

(assert (=> b!229402 (= res!112876 (or (= lt!115272 (MissingZero!920 index!297)) (= lt!115272 (MissingVacant!920 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11287 (_ BitVec 32)) SeekEntryResult!920)

(assert (=> b!229402 (= lt!115272 (seekEntryOrOpen!0 key!932 (_keys!6331 thiss!1504) (mask!10159 thiss!1504)))))

(declare-fun b!229403 () Bool)

(declare-fun tp_is_empty!6025 () Bool)

(assert (=> b!229403 (= e!148822 tp_is_empty!6025)))

(declare-fun b!229404 () Bool)

(declare-fun Unit!6972 () Unit!6969)

(assert (=> b!229404 (= e!148819 Unit!6972)))

(declare-fun lt!115282 () Unit!6969)

(declare-fun lemmaArrayContainsKeyThenInListMap!121 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7681 V!7681 (_ BitVec 64) (_ BitVec 32) Int) Unit!6969)

(assert (=> b!229404 (= lt!115282 (lemmaArrayContainsKeyThenInListMap!121 (_keys!6331 thiss!1504) (_values!4261 thiss!1504) (mask!10159 thiss!1504) (extraKeys!4015 thiss!1504) (zeroValue!4119 thiss!1504) (minValue!4119 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4278 thiss!1504)))))

(assert (=> b!229404 false))

(declare-fun b!229405 () Bool)

(assert (=> b!229405 (= e!148828 (not call!21299))))

(declare-fun mapIsEmpty!10207 () Bool)

(assert (=> mapIsEmpty!10207 mapRes!10207))

(declare-fun b!229406 () Bool)

(declare-fun res!112872 () Bool)

(assert (=> b!229406 (=> res!112872 e!148830)))

(assert (=> b!229406 (= res!112872 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6331 thiss!1504) (mask!10159 thiss!1504))))))

(declare-fun call!21300 () Bool)

(declare-fun bm!21297 () Bool)

(assert (=> bm!21297 (= call!21300 (inRange!0 (ite c!38049 (index!5850 lt!115272) (index!5853 lt!115272)) (mask!10159 thiss!1504)))))

(declare-fun b!229407 () Bool)

(declare-fun e!148821 () Bool)

(assert (=> b!229407 (= e!148821 tp_is_empty!6025)))

(declare-fun b!229408 () Bool)

(assert (=> b!229408 (= e!148824 e!148828)))

(declare-fun res!112877 () Bool)

(assert (=> b!229408 (= res!112877 call!21300)))

(assert (=> b!229408 (=> (not res!112877) (not e!148828))))

(declare-fun b!229409 () Bool)

(declare-fun res!112875 () Bool)

(assert (=> b!229409 (=> (not res!112875) (not e!148823))))

(assert (=> b!229409 (= res!112875 call!21300)))

(assert (=> b!229409 (= e!148820 e!148823)))

(declare-fun b!229410 () Bool)

(declare-fun c!38048 () Bool)

(assert (=> b!229410 (= c!38048 ((_ is MissingVacant!920) lt!115272))))

(assert (=> b!229410 (= e!148820 e!148824)))

(declare-fun e!148827 () Bool)

(declare-fun array_inv!3535 (array!11287) Bool)

(declare-fun array_inv!3536 (array!11285) Bool)

(assert (=> b!229411 (= e!148829 (and tp!21631 tp_is_empty!6025 (array_inv!3535 (_keys!6331 thiss!1504)) (array_inv!3536 (_values!4261 thiss!1504)) e!148827))))

(declare-fun b!229412 () Bool)

(declare-fun Unit!6973 () Unit!6969)

(assert (=> b!229412 (= e!148819 Unit!6973)))

(declare-fun b!229413 () Bool)

(assert (=> b!229413 (= e!148827 (and e!148821 mapRes!10207))))

(declare-fun condMapEmpty!10207 () Bool)

(declare-fun mapDefault!10207 () ValueCell!2669)

(assert (=> b!229413 (= condMapEmpty!10207 (= (arr!5361 (_values!4261 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2669)) mapDefault!10207)))))

(declare-fun b!229414 () Bool)

(declare-fun res!112873 () Bool)

(assert (=> b!229414 (=> (not res!112873) (not e!148823))))

(assert (=> b!229414 (= res!112873 (= (select (arr!5362 (_keys!6331 thiss!1504)) (index!5850 lt!115272)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22100 res!112874) b!229397))

(assert (= (and b!229397 res!112880) b!229402))

(assert (= (and b!229402 res!112876) b!229398))

(assert (= (and b!229398 c!38050) b!229392))

(assert (= (and b!229398 (not c!38050)) b!229400))

(assert (= (and b!229400 c!38049) b!229409))

(assert (= (and b!229400 (not c!38049)) b!229410))

(assert (= (and b!229409 res!112875) b!229414))

(assert (= (and b!229414 res!112873) b!229399))

(assert (= (and b!229410 c!38048) b!229408))

(assert (= (and b!229410 (not c!38048)) b!229396))

(assert (= (and b!229408 res!112877) b!229401))

(assert (= (and b!229401 res!112871) b!229405))

(assert (= (or b!229409 b!229408) bm!21297))

(assert (= (or b!229399 b!229405) bm!21296))

(assert (= (and b!229398 res!112879) b!229394))

(assert (= (and b!229394 c!38047) b!229404))

(assert (= (and b!229394 (not c!38047)) b!229412))

(assert (= (and b!229394 (not res!112870)) b!229395))

(assert (= (and b!229395 (not res!112878)) b!229406))

(assert (= (and b!229406 (not res!112872)) b!229393))

(assert (= (and b!229413 condMapEmpty!10207) mapIsEmpty!10207))

(assert (= (and b!229413 (not condMapEmpty!10207)) mapNonEmpty!10207))

(assert (= (and mapNonEmpty!10207 ((_ is ValueCellFull!2669) mapValue!10207)) b!229403))

(assert (= (and b!229413 ((_ is ValueCellFull!2669) mapDefault!10207)) b!229407))

(assert (= b!229411 b!229413))

(assert (= start!22100 b!229411))

(declare-fun m!250411 () Bool)

(assert (=> mapNonEmpty!10207 m!250411))

(declare-fun m!250413 () Bool)

(assert (=> start!22100 m!250413))

(declare-fun m!250415 () Bool)

(assert (=> bm!21297 m!250415))

(declare-fun m!250417 () Bool)

(assert (=> b!229392 m!250417))

(declare-fun m!250419 () Bool)

(assert (=> b!229402 m!250419))

(declare-fun m!250421 () Bool)

(assert (=> b!229401 m!250421))

(declare-fun m!250423 () Bool)

(assert (=> bm!21296 m!250423))

(declare-fun m!250425 () Bool)

(assert (=> b!229414 m!250425))

(declare-fun m!250427 () Bool)

(assert (=> b!229398 m!250427))

(declare-fun m!250429 () Bool)

(assert (=> b!229398 m!250429))

(assert (=> b!229398 m!250429))

(declare-fun m!250431 () Bool)

(assert (=> b!229398 m!250431))

(declare-fun m!250433 () Bool)

(assert (=> b!229404 m!250433))

(declare-fun m!250435 () Bool)

(assert (=> b!229393 m!250435))

(declare-fun m!250437 () Bool)

(assert (=> b!229400 m!250437))

(declare-fun m!250439 () Bool)

(assert (=> b!229406 m!250439))

(declare-fun m!250441 () Bool)

(assert (=> b!229411 m!250441))

(declare-fun m!250443 () Bool)

(assert (=> b!229411 m!250443))

(declare-fun m!250445 () Bool)

(assert (=> b!229394 m!250445))

(assert (=> b!229394 m!250423))

(declare-fun m!250447 () Bool)

(assert (=> b!229394 m!250447))

(declare-fun m!250449 () Bool)

(assert (=> b!229394 m!250449))

(declare-fun m!250451 () Bool)

(assert (=> b!229394 m!250451))

(declare-fun m!250453 () Bool)

(assert (=> b!229394 m!250453))

(declare-fun m!250455 () Bool)

(assert (=> b!229394 m!250455))

(declare-fun m!250457 () Bool)

(assert (=> b!229394 m!250457))

(declare-fun m!250459 () Bool)

(assert (=> b!229394 m!250459))

(declare-fun m!250461 () Bool)

(assert (=> b!229394 m!250461))

(check-sat (not b!229392) (not bm!21296) (not bm!21297) (not b!229394) (not b!229402) (not b!229393) (not b_next!6163) (not b!229400) (not b!229411) b_and!13035 (not b!229398) (not b!229404) (not start!22100) (not mapNonEmpty!10207) tp_is_empty!6025 (not b!229406))
(check-sat b_and!13035 (not b_next!6163))
