; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21986 () Bool)

(assert start!21986)

(declare-fun b!225372 () Bool)

(declare-fun b_free!6049 () Bool)

(declare-fun b_next!6049 () Bool)

(assert (=> b!225372 (= b_free!6049 (not b_next!6049))))

(declare-fun tp!21288 () Bool)

(declare-fun b_and!12921 () Bool)

(assert (=> b!225372 (= tp!21288 b_and!12921)))

(declare-fun b!225355 () Bool)

(declare-fun e!146254 () Bool)

(declare-fun call!20957 () Bool)

(assert (=> b!225355 (= e!146254 (not call!20957))))

(declare-fun b!225356 () Bool)

(declare-datatypes ((Unit!6751 0))(
  ( (Unit!6752) )
))
(declare-fun e!146261 () Unit!6751)

(declare-fun lt!113394 () Unit!6751)

(assert (=> b!225356 (= e!146261 lt!113394)))

(declare-datatypes ((V!7529 0))(
  ( (V!7530 (val!3000 Int)) )
))
(declare-datatypes ((ValueCell!2612 0))(
  ( (ValueCellFull!2612 (v!5014 V!7529)) (EmptyCell!2612) )
))
(declare-datatypes ((array!11057 0))(
  ( (array!11058 (arr!5247 (Array (_ BitVec 32) ValueCell!2612)) (size!5581 (_ BitVec 32))) )
))
(declare-datatypes ((array!11059 0))(
  ( (array!11060 (arr!5248 (Array (_ BitVec 32) (_ BitVec 64))) (size!5582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3124 0))(
  ( (LongMapFixedSize!3125 (defaultEntry!4221 Int) (mask!10064 (_ BitVec 32)) (extraKeys!3958 (_ BitVec 32)) (zeroValue!4062 V!7529) (minValue!4062 V!7529) (_size!1611 (_ BitVec 32)) (_keys!6274 array!11059) (_values!4204 array!11057) (_vacant!1611 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3124)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) Int) Unit!6751)

(assert (=> b!225356 (= lt!113394 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (_keys!6274 thiss!1504) (_values!4204 thiss!1504) (mask!10064 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 (defaultEntry!4221 thiss!1504)))))

(declare-fun c!37365 () Bool)

(declare-datatypes ((SeekEntryResult!868 0))(
  ( (MissingZero!868 (index!5642 (_ BitVec 32))) (Found!868 (index!5643 (_ BitVec 32))) (Intermediate!868 (undefined!1680 Bool) (index!5644 (_ BitVec 32)) (x!23183 (_ BitVec 32))) (Undefined!868) (MissingVacant!868 (index!5645 (_ BitVec 32))) )
))
(declare-fun lt!113395 () SeekEntryResult!868)

(get-info :version)

(assert (=> b!225356 (= c!37365 ((_ is MissingZero!868) lt!113395))))

(declare-fun e!146263 () Bool)

(assert (=> b!225356 e!146263))

(declare-fun mapIsEmpty!10036 () Bool)

(declare-fun mapRes!10036 () Bool)

(assert (=> mapIsEmpty!10036 mapRes!10036))

(declare-fun bm!20954 () Bool)

(declare-fun arrayContainsKey!0 (array!11059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20954 (= call!20957 (arrayContainsKey!0 (_keys!6274 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!110889 () Bool)

(declare-fun e!146257 () Bool)

(assert (=> start!21986 (=> (not res!110889) (not e!146257))))

(declare-fun valid!1270 (LongMapFixedSize!3124) Bool)

(assert (=> start!21986 (= res!110889 (valid!1270 thiss!1504))))

(assert (=> start!21986 e!146257))

(declare-fun e!146260 () Bool)

(assert (=> start!21986 e!146260))

(assert (=> start!21986 true))

(declare-fun b!225357 () Bool)

(declare-fun e!146265 () Bool)

(assert (=> b!225357 (= e!146265 e!146254)))

(declare-fun res!110890 () Bool)

(declare-fun call!20958 () Bool)

(assert (=> b!225357 (= res!110890 call!20958)))

(assert (=> b!225357 (=> (not res!110890) (not e!146254))))

(declare-fun b!225358 () Bool)

(declare-fun res!110885 () Bool)

(declare-fun e!146259 () Bool)

(assert (=> b!225358 (=> res!110885 e!146259)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225358 (= res!110885 (or (not (= (size!5582 (_keys!6274 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10064 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5582 (_keys!6274 thiss!1504)))))))

(declare-fun b!225359 () Bool)

(declare-fun e!146264 () Unit!6751)

(declare-fun Unit!6753 () Unit!6751)

(assert (=> b!225359 (= e!146264 Unit!6753)))

(declare-fun b!225360 () Bool)

(declare-fun res!110892 () Bool)

(assert (=> b!225360 (=> res!110892 e!146259)))

(declare-fun lt!113396 () Bool)

(assert (=> b!225360 (= res!110892 lt!113396)))

(declare-fun b!225361 () Bool)

(declare-fun res!110891 () Bool)

(assert (=> b!225361 (=> res!110891 e!146259)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11059 (_ BitVec 32)) Bool)

(assert (=> b!225361 (= res!110891 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6274 thiss!1504) (mask!10064 thiss!1504))))))

(declare-fun b!225362 () Bool)

(declare-fun e!146256 () Bool)

(declare-fun e!146268 () Bool)

(assert (=> b!225362 (= e!146256 (and e!146268 mapRes!10036))))

(declare-fun condMapEmpty!10036 () Bool)

(declare-fun mapDefault!10036 () ValueCell!2612)

(assert (=> b!225362 (= condMapEmpty!10036 (= (arr!5247 (_values!4204 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2612)) mapDefault!10036)))))

(declare-fun b!225363 () Bool)

(declare-fun res!110895 () Bool)

(declare-fun e!146255 () Bool)

(assert (=> b!225363 (=> (not res!110895) (not e!146255))))

(assert (=> b!225363 (= res!110895 (= (select (arr!5248 (_keys!6274 thiss!1504)) (index!5642 lt!113395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225364 () Bool)

(assert (=> b!225364 (= e!146259 true)))

(declare-fun lt!113392 () Bool)

(declare-datatypes ((List!3341 0))(
  ( (Nil!3338) (Cons!3337 (h!3985 (_ BitVec 64)) (t!8291 List!3341)) )
))
(declare-fun arrayNoDuplicates!0 (array!11059 (_ BitVec 32) List!3341) Bool)

(assert (=> b!225364 (= lt!113392 (arrayNoDuplicates!0 (_keys!6274 thiss!1504) #b00000000000000000000000000000000 Nil!3338))))

(declare-fun b!225365 () Bool)

(declare-fun res!110897 () Bool)

(assert (=> b!225365 (=> (not res!110897) (not e!146255))))

(assert (=> b!225365 (= res!110897 call!20958)))

(assert (=> b!225365 (= e!146263 e!146255)))

(declare-fun b!225366 () Bool)

(declare-fun Unit!6754 () Unit!6751)

(assert (=> b!225366 (= e!146264 Unit!6754)))

(declare-fun lt!113391 () Unit!6751)

(declare-fun lemmaArrayContainsKeyThenInListMap!86 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) (_ BitVec 32) Int) Unit!6751)

(assert (=> b!225366 (= lt!113391 (lemmaArrayContainsKeyThenInListMap!86 (_keys!6274 thiss!1504) (_values!4204 thiss!1504) (mask!10064 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4221 thiss!1504)))))

(assert (=> b!225366 false))

(declare-fun b!225367 () Bool)

(declare-fun c!37364 () Bool)

(assert (=> b!225367 (= c!37364 ((_ is MissingVacant!868) lt!113395))))

(assert (=> b!225367 (= e!146263 e!146265)))

(declare-fun bm!20955 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20955 (= call!20958 (inRange!0 (ite c!37365 (index!5642 lt!113395) (index!5645 lt!113395)) (mask!10064 thiss!1504)))))

(declare-fun b!225368 () Bool)

(declare-fun e!146266 () Bool)

(declare-fun e!146258 () Bool)

(assert (=> b!225368 (= e!146266 e!146258)))

(declare-fun res!110887 () Bool)

(assert (=> b!225368 (=> (not res!110887) (not e!146258))))

(assert (=> b!225368 (= res!110887 (inRange!0 index!297 (mask!10064 thiss!1504)))))

(declare-fun lt!113399 () Unit!6751)

(assert (=> b!225368 (= lt!113399 e!146261)))

(declare-fun c!37363 () Bool)

(declare-datatypes ((tuple2!4412 0))(
  ( (tuple2!4413 (_1!2217 (_ BitVec 64)) (_2!2217 V!7529)) )
))
(declare-datatypes ((List!3342 0))(
  ( (Nil!3339) (Cons!3338 (h!3986 tuple2!4412) (t!8292 List!3342)) )
))
(declare-datatypes ((ListLongMap!3315 0))(
  ( (ListLongMap!3316 (toList!1673 List!3342)) )
))
(declare-fun contains!1548 (ListLongMap!3315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1182 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 32) Int) ListLongMap!3315)

(assert (=> b!225368 (= c!37363 (contains!1548 (getCurrentListMap!1182 (_keys!6274 thiss!1504) (_values!4204 thiss!1504) (mask!10064 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4221 thiss!1504)) key!932))))

(declare-fun b!225369 () Bool)

(declare-fun e!146267 () Bool)

(declare-fun tp_is_empty!5911 () Bool)

(assert (=> b!225369 (= e!146267 tp_is_empty!5911)))

(declare-fun b!225370 () Bool)

(assert (=> b!225370 (= e!146268 tp_is_empty!5911)))

(declare-fun b!225371 () Bool)

(assert (=> b!225371 (= e!146255 (not call!20957))))

(declare-fun array_inv!3463 (array!11059) Bool)

(declare-fun array_inv!3464 (array!11057) Bool)

(assert (=> b!225372 (= e!146260 (and tp!21288 tp_is_empty!5911 (array_inv!3463 (_keys!6274 thiss!1504)) (array_inv!3464 (_values!4204 thiss!1504)) e!146256))))

(declare-fun b!225373 () Bool)

(declare-fun res!110894 () Bool)

(assert (=> b!225373 (= res!110894 (= (select (arr!5248 (_keys!6274 thiss!1504)) (index!5645 lt!113395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225373 (=> (not res!110894) (not e!146254))))

(declare-fun b!225374 () Bool)

(assert (=> b!225374 (= e!146258 (not e!146259))))

(declare-fun res!110888 () Bool)

(assert (=> b!225374 (=> res!110888 e!146259)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225374 (= res!110888 (not (validMask!0 (mask!10064 thiss!1504))))))

(declare-fun lt!113401 () array!11059)

(declare-fun arrayCountValidKeys!0 (array!11059 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225374 (= (arrayCountValidKeys!0 lt!113401 #b00000000000000000000000000000000 (size!5582 (_keys!6274 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6274 thiss!1504) #b00000000000000000000000000000000 (size!5582 (_keys!6274 thiss!1504)))))))

(declare-fun lt!113397 () Unit!6751)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11059 (_ BitVec 32) (_ BitVec 64)) Unit!6751)

(assert (=> b!225374 (= lt!113397 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6274 thiss!1504) index!297 key!932))))

(assert (=> b!225374 (arrayNoDuplicates!0 lt!113401 #b00000000000000000000000000000000 Nil!3338)))

(assert (=> b!225374 (= lt!113401 (array!11060 (store (arr!5248 (_keys!6274 thiss!1504)) index!297 key!932) (size!5582 (_keys!6274 thiss!1504))))))

(declare-fun lt!113393 () Unit!6751)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11059 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3341) Unit!6751)

(assert (=> b!225374 (= lt!113393 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6274 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3338))))

(declare-fun lt!113398 () Unit!6751)

(assert (=> b!225374 (= lt!113398 e!146264)))

(declare-fun c!37366 () Bool)

(assert (=> b!225374 (= c!37366 lt!113396)))

(assert (=> b!225374 (= lt!113396 (arrayContainsKey!0 (_keys!6274 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225375 () Bool)

(declare-fun res!110896 () Bool)

(assert (=> b!225375 (=> (not res!110896) (not e!146257))))

(assert (=> b!225375 (= res!110896 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225376 () Bool)

(assert (=> b!225376 (= e!146265 ((_ is Undefined!868) lt!113395))))

(declare-fun b!225377 () Bool)

(assert (=> b!225377 (= e!146257 e!146266)))

(declare-fun res!110886 () Bool)

(assert (=> b!225377 (=> (not res!110886) (not e!146266))))

(assert (=> b!225377 (= res!110886 (or (= lt!113395 (MissingZero!868 index!297)) (= lt!113395 (MissingVacant!868 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11059 (_ BitVec 32)) SeekEntryResult!868)

(assert (=> b!225377 (= lt!113395 (seekEntryOrOpen!0 key!932 (_keys!6274 thiss!1504) (mask!10064 thiss!1504)))))

(declare-fun b!225378 () Bool)

(declare-fun res!110893 () Bool)

(assert (=> b!225378 (=> res!110893 e!146259)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225378 (= res!110893 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225379 () Bool)

(declare-fun Unit!6755 () Unit!6751)

(assert (=> b!225379 (= e!146261 Unit!6755)))

(declare-fun lt!113400 () Unit!6751)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!243 (array!11059 array!11057 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) Int) Unit!6751)

(assert (=> b!225379 (= lt!113400 (lemmaInListMapThenSeekEntryOrOpenFindsIt!243 (_keys!6274 thiss!1504) (_values!4204 thiss!1504) (mask!10064 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 (defaultEntry!4221 thiss!1504)))))

(assert (=> b!225379 false))

(declare-fun mapNonEmpty!10036 () Bool)

(declare-fun tp!21289 () Bool)

(assert (=> mapNonEmpty!10036 (= mapRes!10036 (and tp!21289 e!146267))))

(declare-fun mapKey!10036 () (_ BitVec 32))

(declare-fun mapValue!10036 () ValueCell!2612)

(declare-fun mapRest!10036 () (Array (_ BitVec 32) ValueCell!2612))

(assert (=> mapNonEmpty!10036 (= (arr!5247 (_values!4204 thiss!1504)) (store mapRest!10036 mapKey!10036 mapValue!10036))))

(assert (= (and start!21986 res!110889) b!225375))

(assert (= (and b!225375 res!110896) b!225377))

(assert (= (and b!225377 res!110886) b!225368))

(assert (= (and b!225368 c!37363) b!225379))

(assert (= (and b!225368 (not c!37363)) b!225356))

(assert (= (and b!225356 c!37365) b!225365))

(assert (= (and b!225356 (not c!37365)) b!225367))

(assert (= (and b!225365 res!110897) b!225363))

(assert (= (and b!225363 res!110895) b!225371))

(assert (= (and b!225367 c!37364) b!225357))

(assert (= (and b!225367 (not c!37364)) b!225376))

(assert (= (and b!225357 res!110890) b!225373))

(assert (= (and b!225373 res!110894) b!225355))

(assert (= (or b!225365 b!225357) bm!20955))

(assert (= (or b!225371 b!225355) bm!20954))

(assert (= (and b!225368 res!110887) b!225374))

(assert (= (and b!225374 c!37366) b!225366))

(assert (= (and b!225374 (not c!37366)) b!225359))

(assert (= (and b!225374 (not res!110888)) b!225358))

(assert (= (and b!225358 (not res!110885)) b!225378))

(assert (= (and b!225378 (not res!110893)) b!225360))

(assert (= (and b!225360 (not res!110892)) b!225361))

(assert (= (and b!225361 (not res!110891)) b!225364))

(assert (= (and b!225362 condMapEmpty!10036) mapIsEmpty!10036))

(assert (= (and b!225362 (not condMapEmpty!10036)) mapNonEmpty!10036))

(assert (= (and mapNonEmpty!10036 ((_ is ValueCellFull!2612) mapValue!10036)) b!225369))

(assert (= (and b!225362 ((_ is ValueCellFull!2612) mapDefault!10036)) b!225370))

(assert (= b!225372 b!225362))

(assert (= start!21986 b!225372))

(declare-fun m!247483 () Bool)

(assert (=> b!225368 m!247483))

(declare-fun m!247485 () Bool)

(assert (=> b!225368 m!247485))

(assert (=> b!225368 m!247485))

(declare-fun m!247487 () Bool)

(assert (=> b!225368 m!247487))

(declare-fun m!247489 () Bool)

(assert (=> start!21986 m!247489))

(declare-fun m!247491 () Bool)

(assert (=> b!225361 m!247491))

(declare-fun m!247493 () Bool)

(assert (=> bm!20955 m!247493))

(declare-fun m!247495 () Bool)

(assert (=> b!225356 m!247495))

(declare-fun m!247497 () Bool)

(assert (=> b!225364 m!247497))

(declare-fun m!247499 () Bool)

(assert (=> b!225377 m!247499))

(declare-fun m!247501 () Bool)

(assert (=> mapNonEmpty!10036 m!247501))

(declare-fun m!247503 () Bool)

(assert (=> b!225373 m!247503))

(declare-fun m!247505 () Bool)

(assert (=> b!225374 m!247505))

(declare-fun m!247507 () Bool)

(assert (=> b!225374 m!247507))

(declare-fun m!247509 () Bool)

(assert (=> b!225374 m!247509))

(declare-fun m!247511 () Bool)

(assert (=> b!225374 m!247511))

(declare-fun m!247513 () Bool)

(assert (=> b!225374 m!247513))

(declare-fun m!247515 () Bool)

(assert (=> b!225374 m!247515))

(declare-fun m!247517 () Bool)

(assert (=> b!225374 m!247517))

(declare-fun m!247519 () Bool)

(assert (=> b!225374 m!247519))

(declare-fun m!247521 () Bool)

(assert (=> b!225372 m!247521))

(declare-fun m!247523 () Bool)

(assert (=> b!225372 m!247523))

(declare-fun m!247525 () Bool)

(assert (=> b!225366 m!247525))

(declare-fun m!247527 () Bool)

(assert (=> b!225379 m!247527))

(declare-fun m!247529 () Bool)

(assert (=> b!225378 m!247529))

(declare-fun m!247531 () Bool)

(assert (=> b!225363 m!247531))

(assert (=> bm!20954 m!247507))

(check-sat (not b!225356) (not b!225366) (not start!21986) b_and!12921 (not b!225372) (not b!225377) tp_is_empty!5911 (not b!225364) (not b!225374) (not b!225368) (not b_next!6049) (not mapNonEmpty!10036) (not b!225379) (not b!225361) (not b!225378) (not bm!20955) (not bm!20954))
(check-sat b_and!12921 (not b_next!6049))
