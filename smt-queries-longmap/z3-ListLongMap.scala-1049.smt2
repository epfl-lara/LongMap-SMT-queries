; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21978 () Bool)

(assert start!21978)

(declare-fun b!225372 () Bool)

(declare-fun b_free!6045 () Bool)

(declare-fun b_next!6045 () Bool)

(assert (=> b!225372 (= b_free!6045 (not b_next!6045))))

(declare-fun tp!21276 () Bool)

(declare-fun b_and!12943 () Bool)

(assert (=> b!225372 (= tp!21276 b_and!12943)))

(declare-fun b!225352 () Bool)

(declare-fun e!146278 () Bool)

(declare-fun e!146279 () Bool)

(assert (=> b!225352 (= e!146278 e!146279)))

(declare-fun res!110911 () Bool)

(assert (=> b!225352 (=> (not res!110911) (not e!146279))))

(declare-datatypes ((SeekEntryResult!868 0))(
  ( (MissingZero!868 (index!5642 (_ BitVec 32))) (Found!868 (index!5643 (_ BitVec 32))) (Intermediate!868 (undefined!1680 Bool) (index!5644 (_ BitVec 32)) (x!23176 (_ BitVec 32))) (Undefined!868) (MissingVacant!868 (index!5645 (_ BitVec 32))) )
))
(declare-fun lt!113507 () SeekEntryResult!868)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225352 (= res!110911 (or (= lt!113507 (MissingZero!868 index!297)) (= lt!113507 (MissingVacant!868 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7523 0))(
  ( (V!7524 (val!2998 Int)) )
))
(declare-datatypes ((ValueCell!2610 0))(
  ( (ValueCellFull!2610 (v!5018 V!7523)) (EmptyCell!2610) )
))
(declare-datatypes ((array!11057 0))(
  ( (array!11058 (arr!5248 (Array (_ BitVec 32) ValueCell!2610)) (size!5581 (_ BitVec 32))) )
))
(declare-datatypes ((array!11059 0))(
  ( (array!11060 (arr!5249 (Array (_ BitVec 32) (_ BitVec 64))) (size!5582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3120 0))(
  ( (LongMapFixedSize!3121 (defaultEntry!4219 Int) (mask!10061 (_ BitVec 32)) (extraKeys!3956 (_ BitVec 32)) (zeroValue!4060 V!7523) (minValue!4060 V!7523) (_size!1609 (_ BitVec 32)) (_keys!6273 array!11059) (_values!4202 array!11057) (_vacant!1609 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3120)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11059 (_ BitVec 32)) SeekEntryResult!868)

(assert (=> b!225352 (= lt!113507 (seekEntryOrOpen!0 key!932 (_keys!6273 thiss!1504) (mask!10061 thiss!1504)))))

(declare-fun mapIsEmpty!10030 () Bool)

(declare-fun mapRes!10030 () Bool)

(assert (=> mapIsEmpty!10030 mapRes!10030))

(declare-fun bm!20966 () Bool)

(declare-fun call!20969 () Bool)

(declare-fun arrayContainsKey!0 (array!11059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20966 (= call!20969 (arrayContainsKey!0 (_keys!6273 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225354 () Bool)

(declare-fun res!110908 () Bool)

(declare-fun e!146277 () Bool)

(assert (=> b!225354 (=> res!110908 e!146277)))

(assert (=> b!225354 (= res!110908 (or (not (= (size!5582 (_keys!6273 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10061 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5582 (_keys!6273 thiss!1504)))))))

(declare-fun b!225355 () Bool)

(declare-fun res!110910 () Bool)

(assert (=> b!225355 (=> res!110910 e!146277)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225355 (= res!110910 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225356 () Bool)

(declare-fun e!146270 () Bool)

(declare-fun e!146269 () Bool)

(assert (=> b!225356 (= e!146270 (and e!146269 mapRes!10030))))

(declare-fun condMapEmpty!10030 () Bool)

(declare-fun mapDefault!10030 () ValueCell!2610)

(assert (=> b!225356 (= condMapEmpty!10030 (= (arr!5248 (_values!4202 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2610)) mapDefault!10030)))))

(declare-fun b!225357 () Bool)

(declare-fun e!146266 () Bool)

(assert (=> b!225357 (= e!146279 e!146266)))

(declare-fun res!110907 () Bool)

(assert (=> b!225357 (=> (not res!110907) (not e!146266))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225357 (= res!110907 (inRange!0 index!297 (mask!10061 thiss!1504)))))

(declare-datatypes ((Unit!6792 0))(
  ( (Unit!6793) )
))
(declare-fun lt!113511 () Unit!6792)

(declare-fun e!146272 () Unit!6792)

(assert (=> b!225357 (= lt!113511 e!146272)))

(declare-fun c!37366 () Bool)

(declare-datatypes ((tuple2!4440 0))(
  ( (tuple2!4441 (_1!2231 (_ BitVec 64)) (_2!2231 V!7523)) )
))
(declare-datatypes ((List!3353 0))(
  ( (Nil!3350) (Cons!3349 (h!3997 tuple2!4440) (t!8312 List!3353)) )
))
(declare-datatypes ((ListLongMap!3353 0))(
  ( (ListLongMap!3354 (toList!1692 List!3353)) )
))
(declare-fun contains!1566 (ListLongMap!3353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1220 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7523 V!7523 (_ BitVec 32) Int) ListLongMap!3353)

(assert (=> b!225357 (= c!37366 (contains!1566 (getCurrentListMap!1220 (_keys!6273 thiss!1504) (_values!4202 thiss!1504) (mask!10061 thiss!1504) (extraKeys!3956 thiss!1504) (zeroValue!4060 thiss!1504) (minValue!4060 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4219 thiss!1504)) key!932))))

(declare-fun b!225358 () Bool)

(assert (=> b!225358 (= e!146266 (not e!146277))))

(declare-fun res!110903 () Bool)

(assert (=> b!225358 (=> res!110903 e!146277)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225358 (= res!110903 (not (validMask!0 (mask!10061 thiss!1504))))))

(declare-fun lt!113513 () array!11059)

(declare-fun arrayCountValidKeys!0 (array!11059 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225358 (= (arrayCountValidKeys!0 lt!113513 #b00000000000000000000000000000000 (size!5582 (_keys!6273 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6273 thiss!1504) #b00000000000000000000000000000000 (size!5582 (_keys!6273 thiss!1504)))))))

(declare-fun lt!113512 () Unit!6792)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11059 (_ BitVec 32) (_ BitVec 64)) Unit!6792)

(assert (=> b!225358 (= lt!113512 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6273 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3354 0))(
  ( (Nil!3351) (Cons!3350 (h!3998 (_ BitVec 64)) (t!8313 List!3354)) )
))
(declare-fun arrayNoDuplicates!0 (array!11059 (_ BitVec 32) List!3354) Bool)

(assert (=> b!225358 (arrayNoDuplicates!0 lt!113513 #b00000000000000000000000000000000 Nil!3351)))

(assert (=> b!225358 (= lt!113513 (array!11060 (store (arr!5249 (_keys!6273 thiss!1504)) index!297 key!932) (size!5582 (_keys!6273 thiss!1504))))))

(declare-fun lt!113508 () Unit!6792)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3354) Unit!6792)

(assert (=> b!225358 (= lt!113508 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6273 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3351))))

(declare-fun lt!113515 () Unit!6792)

(declare-fun e!146274 () Unit!6792)

(assert (=> b!225358 (= lt!113515 e!146274)))

(declare-fun c!37365 () Bool)

(declare-fun lt!113506 () Bool)

(assert (=> b!225358 (= c!37365 lt!113506)))

(assert (=> b!225358 (= lt!113506 (arrayContainsKey!0 (_keys!6273 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225359 () Bool)

(declare-fun e!146268 () Bool)

(get-info :version)

(assert (=> b!225359 (= e!146268 ((_ is Undefined!868) lt!113507))))

(declare-fun b!225360 () Bool)

(declare-fun res!110905 () Bool)

(declare-fun e!146276 () Bool)

(assert (=> b!225360 (=> (not res!110905) (not e!146276))))

(declare-fun call!20970 () Bool)

(assert (=> b!225360 (= res!110905 call!20970)))

(declare-fun e!146273 () Bool)

(assert (=> b!225360 (= e!146273 e!146276)))

(declare-fun c!37368 () Bool)

(declare-fun bm!20967 () Bool)

(assert (=> bm!20967 (= call!20970 (inRange!0 (ite c!37368 (index!5642 lt!113507) (index!5645 lt!113507)) (mask!10061 thiss!1504)))))

(declare-fun b!225361 () Bool)

(declare-fun res!110902 () Bool)

(assert (=> b!225361 (=> (not res!110902) (not e!146276))))

(assert (=> b!225361 (= res!110902 (= (select (arr!5249 (_keys!6273 thiss!1504)) (index!5642 lt!113507)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225362 () Bool)

(declare-fun res!110904 () Bool)

(assert (=> b!225362 (=> res!110904 e!146277)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11059 (_ BitVec 32)) Bool)

(assert (=> b!225362 (= res!110904 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6273 thiss!1504) (mask!10061 thiss!1504))))))

(declare-fun b!225363 () Bool)

(declare-fun tp_is_empty!5907 () Bool)

(assert (=> b!225363 (= e!146269 tp_is_empty!5907)))

(declare-fun b!225364 () Bool)

(declare-fun Unit!6794 () Unit!6792)

(assert (=> b!225364 (= e!146272 Unit!6794)))

(declare-fun lt!113514 () Unit!6792)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!247 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7523 V!7523 (_ BitVec 64) Int) Unit!6792)

(assert (=> b!225364 (= lt!113514 (lemmaInListMapThenSeekEntryOrOpenFindsIt!247 (_keys!6273 thiss!1504) (_values!4202 thiss!1504) (mask!10061 thiss!1504) (extraKeys!3956 thiss!1504) (zeroValue!4060 thiss!1504) (minValue!4060 thiss!1504) key!932 (defaultEntry!4219 thiss!1504)))))

(assert (=> b!225364 false))

(declare-fun b!225365 () Bool)

(declare-fun lt!113509 () Unit!6792)

(assert (=> b!225365 (= e!146272 lt!113509)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7523 V!7523 (_ BitVec 64) Int) Unit!6792)

(assert (=> b!225365 (= lt!113509 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!258 (_keys!6273 thiss!1504) (_values!4202 thiss!1504) (mask!10061 thiss!1504) (extraKeys!3956 thiss!1504) (zeroValue!4060 thiss!1504) (minValue!4060 thiss!1504) key!932 (defaultEntry!4219 thiss!1504)))))

(assert (=> b!225365 (= c!37368 ((_ is MissingZero!868) lt!113507))))

(assert (=> b!225365 e!146273))

(declare-fun b!225366 () Bool)

(declare-fun res!110909 () Bool)

(assert (=> b!225366 (=> res!110909 e!146277)))

(assert (=> b!225366 (= res!110909 lt!113506)))

(declare-fun res!110913 () Bool)

(assert (=> start!21978 (=> (not res!110913) (not e!146278))))

(declare-fun valid!1257 (LongMapFixedSize!3120) Bool)

(assert (=> start!21978 (= res!110913 (valid!1257 thiss!1504))))

(assert (=> start!21978 e!146278))

(declare-fun e!146265 () Bool)

(assert (=> start!21978 e!146265))

(assert (=> start!21978 true))

(declare-fun b!225353 () Bool)

(declare-fun e!146275 () Bool)

(assert (=> b!225353 (= e!146275 (not call!20969))))

(declare-fun b!225367 () Bool)

(declare-fun c!37367 () Bool)

(assert (=> b!225367 (= c!37367 ((_ is MissingVacant!868) lt!113507))))

(assert (=> b!225367 (= e!146273 e!146268)))

(declare-fun b!225368 () Bool)

(assert (=> b!225368 (= e!146276 (not call!20969))))

(declare-fun b!225369 () Bool)

(assert (=> b!225369 (= e!146268 e!146275)))

(declare-fun res!110914 () Bool)

(assert (=> b!225369 (= res!110914 call!20970)))

(assert (=> b!225369 (=> (not res!110914) (not e!146275))))

(declare-fun b!225370 () Bool)

(declare-fun res!110912 () Bool)

(assert (=> b!225370 (= res!110912 (= (select (arr!5249 (_keys!6273 thiss!1504)) (index!5645 lt!113507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225370 (=> (not res!110912) (not e!146275))))

(declare-fun b!225371 () Bool)

(declare-fun Unit!6795 () Unit!6792)

(assert (=> b!225371 (= e!146274 Unit!6795)))

(declare-fun lt!113516 () Unit!6792)

(declare-fun lemmaArrayContainsKeyThenInListMap!86 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7523 V!7523 (_ BitVec 64) (_ BitVec 32) Int) Unit!6792)

(assert (=> b!225371 (= lt!113516 (lemmaArrayContainsKeyThenInListMap!86 (_keys!6273 thiss!1504) (_values!4202 thiss!1504) (mask!10061 thiss!1504) (extraKeys!3956 thiss!1504) (zeroValue!4060 thiss!1504) (minValue!4060 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4219 thiss!1504)))))

(assert (=> b!225371 false))

(declare-fun array_inv!3473 (array!11059) Bool)

(declare-fun array_inv!3474 (array!11057) Bool)

(assert (=> b!225372 (= e!146265 (and tp!21276 tp_is_empty!5907 (array_inv!3473 (_keys!6273 thiss!1504)) (array_inv!3474 (_values!4202 thiss!1504)) e!146270))))

(declare-fun b!225373 () Bool)

(declare-fun e!146271 () Bool)

(assert (=> b!225373 (= e!146271 tp_is_empty!5907)))

(declare-fun b!225374 () Bool)

(assert (=> b!225374 (= e!146277 true)))

(declare-fun lt!113510 () Bool)

(assert (=> b!225374 (= lt!113510 (arrayNoDuplicates!0 (_keys!6273 thiss!1504) #b00000000000000000000000000000000 Nil!3351))))

(declare-fun mapNonEmpty!10030 () Bool)

(declare-fun tp!21277 () Bool)

(assert (=> mapNonEmpty!10030 (= mapRes!10030 (and tp!21277 e!146271))))

(declare-fun mapKey!10030 () (_ BitVec 32))

(declare-fun mapRest!10030 () (Array (_ BitVec 32) ValueCell!2610))

(declare-fun mapValue!10030 () ValueCell!2610)

(assert (=> mapNonEmpty!10030 (= (arr!5248 (_values!4202 thiss!1504)) (store mapRest!10030 mapKey!10030 mapValue!10030))))

(declare-fun b!225375 () Bool)

(declare-fun Unit!6796 () Unit!6792)

(assert (=> b!225375 (= e!146274 Unit!6796)))

(declare-fun b!225376 () Bool)

(declare-fun res!110906 () Bool)

(assert (=> b!225376 (=> (not res!110906) (not e!146278))))

(assert (=> b!225376 (= res!110906 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21978 res!110913) b!225376))

(assert (= (and b!225376 res!110906) b!225352))

(assert (= (and b!225352 res!110911) b!225357))

(assert (= (and b!225357 c!37366) b!225364))

(assert (= (and b!225357 (not c!37366)) b!225365))

(assert (= (and b!225365 c!37368) b!225360))

(assert (= (and b!225365 (not c!37368)) b!225367))

(assert (= (and b!225360 res!110905) b!225361))

(assert (= (and b!225361 res!110902) b!225368))

(assert (= (and b!225367 c!37367) b!225369))

(assert (= (and b!225367 (not c!37367)) b!225359))

(assert (= (and b!225369 res!110914) b!225370))

(assert (= (and b!225370 res!110912) b!225353))

(assert (= (or b!225360 b!225369) bm!20967))

(assert (= (or b!225368 b!225353) bm!20966))

(assert (= (and b!225357 res!110907) b!225358))

(assert (= (and b!225358 c!37365) b!225371))

(assert (= (and b!225358 (not c!37365)) b!225375))

(assert (= (and b!225358 (not res!110903)) b!225354))

(assert (= (and b!225354 (not res!110908)) b!225355))

(assert (= (and b!225355 (not res!110910)) b!225366))

(assert (= (and b!225366 (not res!110909)) b!225362))

(assert (= (and b!225362 (not res!110904)) b!225374))

(assert (= (and b!225356 condMapEmpty!10030) mapIsEmpty!10030))

(assert (= (and b!225356 (not condMapEmpty!10030)) mapNonEmpty!10030))

(assert (= (and mapNonEmpty!10030 ((_ is ValueCellFull!2610) mapValue!10030)) b!225373))

(assert (= (and b!225356 ((_ is ValueCellFull!2610) mapDefault!10030)) b!225363))

(assert (= b!225372 b!225356))

(assert (= start!21978 b!225372))

(declare-fun m!247999 () Bool)

(assert (=> bm!20966 m!247999))

(declare-fun m!248001 () Bool)

(assert (=> mapNonEmpty!10030 m!248001))

(declare-fun m!248003 () Bool)

(assert (=> b!225374 m!248003))

(declare-fun m!248005 () Bool)

(assert (=> b!225364 m!248005))

(declare-fun m!248007 () Bool)

(assert (=> b!225365 m!248007))

(declare-fun m!248009 () Bool)

(assert (=> b!225370 m!248009))

(declare-fun m!248011 () Bool)

(assert (=> start!21978 m!248011))

(declare-fun m!248013 () Bool)

(assert (=> b!225355 m!248013))

(declare-fun m!248015 () Bool)

(assert (=> b!225352 m!248015))

(declare-fun m!248017 () Bool)

(assert (=> bm!20967 m!248017))

(declare-fun m!248019 () Bool)

(assert (=> b!225362 m!248019))

(declare-fun m!248021 () Bool)

(assert (=> b!225357 m!248021))

(declare-fun m!248023 () Bool)

(assert (=> b!225357 m!248023))

(assert (=> b!225357 m!248023))

(declare-fun m!248025 () Bool)

(assert (=> b!225357 m!248025))

(declare-fun m!248027 () Bool)

(assert (=> b!225372 m!248027))

(declare-fun m!248029 () Bool)

(assert (=> b!225372 m!248029))

(declare-fun m!248031 () Bool)

(assert (=> b!225361 m!248031))

(assert (=> b!225358 m!247999))

(declare-fun m!248033 () Bool)

(assert (=> b!225358 m!248033))

(declare-fun m!248035 () Bool)

(assert (=> b!225358 m!248035))

(declare-fun m!248037 () Bool)

(assert (=> b!225358 m!248037))

(declare-fun m!248039 () Bool)

(assert (=> b!225358 m!248039))

(declare-fun m!248041 () Bool)

(assert (=> b!225358 m!248041))

(declare-fun m!248043 () Bool)

(assert (=> b!225358 m!248043))

(declare-fun m!248045 () Bool)

(assert (=> b!225358 m!248045))

(declare-fun m!248047 () Bool)

(assert (=> b!225371 m!248047))

(check-sat (not b!225362) (not bm!20966) (not b!225372) (not b!225358) b_and!12943 (not mapNonEmpty!10030) (not b!225357) (not b!225355) (not b!225364) (not b!225352) tp_is_empty!5907 (not bm!20967) (not start!21978) (not b_next!6045) (not b!225371) (not b!225374) (not b!225365))
(check-sat b_and!12943 (not b_next!6045))
