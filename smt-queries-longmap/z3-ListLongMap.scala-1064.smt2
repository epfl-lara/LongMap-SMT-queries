; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22068 () Bool)

(assert start!22068)

(declare-fun b!228589 () Bool)

(declare-fun b_free!6135 () Bool)

(declare-fun b_next!6135 () Bool)

(assert (=> b!228589 (= b_free!6135 (not b_next!6135))))

(declare-fun tp!21546 () Bool)

(declare-fun b_and!13033 () Bool)

(assert (=> b!228589 (= tp!21546 b_and!13033)))

(declare-fun b!228573 () Bool)

(declare-fun res!112509 () Bool)

(declare-fun e!148299 () Bool)

(assert (=> b!228573 (=> res!112509 e!148299)))

(declare-datatypes ((V!7643 0))(
  ( (V!7644 (val!3043 Int)) )
))
(declare-datatypes ((ValueCell!2655 0))(
  ( (ValueCellFull!2655 (v!5063 V!7643)) (EmptyCell!2655) )
))
(declare-datatypes ((array!11237 0))(
  ( (array!11238 (arr!5338 (Array (_ BitVec 32) ValueCell!2655)) (size!5671 (_ BitVec 32))) )
))
(declare-datatypes ((array!11239 0))(
  ( (array!11240 (arr!5339 (Array (_ BitVec 32) (_ BitVec 64))) (size!5672 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3210 0))(
  ( (LongMapFixedSize!3211 (defaultEntry!4264 Int) (mask!10136 (_ BitVec 32)) (extraKeys!4001 (_ BitVec 32)) (zeroValue!4105 V!7643) (minValue!4105 V!7643) (_size!1654 (_ BitVec 32)) (_keys!6318 array!11239) (_values!4247 array!11237) (_vacant!1654 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3210)

(assert (=> b!228573 (= res!112509 (or (not (= (size!5671 (_values!4247 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10136 thiss!1504)))) (not (= (size!5672 (_keys!6318 thiss!1504)) (size!5671 (_values!4247 thiss!1504)))) (bvslt (mask!10136 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4001 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4001 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228574 () Bool)

(declare-fun c!37907 () Bool)

(declare-datatypes ((SeekEntryResult!909 0))(
  ( (MissingZero!909 (index!5806 (_ BitVec 32))) (Found!909 (index!5807 (_ BitVec 32))) (Intermediate!909 (undefined!1721 Bool) (index!5808 (_ BitVec 32)) (x!23337 (_ BitVec 32))) (Undefined!909) (MissingVacant!909 (index!5809 (_ BitVec 32))) )
))
(declare-fun lt!115001 () SeekEntryResult!909)

(get-info :version)

(assert (=> b!228574 (= c!37907 ((_ is MissingVacant!909) lt!115001))))

(declare-fun e!148294 () Bool)

(declare-fun e!148302 () Bool)

(assert (=> b!228574 (= e!148294 e!148302)))

(declare-fun bm!21236 () Bool)

(declare-fun c!37906 () Bool)

(declare-fun call!21240 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21236 (= call!21240 (inRange!0 (ite c!37906 (index!5806 lt!115001) (index!5809 lt!115001)) (mask!10136 thiss!1504)))))

(declare-fun b!228575 () Bool)

(declare-fun res!112504 () Bool)

(assert (=> b!228575 (= res!112504 (= (select (arr!5339 (_keys!6318 thiss!1504)) (index!5809 lt!115001)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148304 () Bool)

(assert (=> b!228575 (=> (not res!112504) (not e!148304))))

(declare-fun b!228576 () Bool)

(declare-fun e!148301 () Bool)

(declare-fun call!21239 () Bool)

(assert (=> b!228576 (= e!148301 (not call!21239))))

(declare-fun res!112503 () Bool)

(declare-fun e!148296 () Bool)

(assert (=> start!22068 (=> (not res!112503) (not e!148296))))

(declare-fun valid!1283 (LongMapFixedSize!3210) Bool)

(assert (=> start!22068 (= res!112503 (valid!1283 thiss!1504))))

(assert (=> start!22068 e!148296))

(declare-fun e!148293 () Bool)

(assert (=> start!22068 e!148293))

(assert (=> start!22068 true))

(declare-fun b!228577 () Bool)

(declare-datatypes ((Unit!6953 0))(
  ( (Unit!6954) )
))
(declare-fun e!148303 () Unit!6953)

(declare-fun lt!115000 () Unit!6953)

(assert (=> b!228577 (= e!148303 lt!115000)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!288 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7643 V!7643 (_ BitVec 64) Int) Unit!6953)

(assert (=> b!228577 (= lt!115000 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!288 (_keys!6318 thiss!1504) (_values!4247 thiss!1504) (mask!10136 thiss!1504) (extraKeys!4001 thiss!1504) (zeroValue!4105 thiss!1504) (minValue!4105 thiss!1504) key!932 (defaultEntry!4264 thiss!1504)))))

(assert (=> b!228577 (= c!37906 ((_ is MissingZero!909) lt!115001))))

(assert (=> b!228577 e!148294))

(declare-fun b!228578 () Bool)

(declare-fun res!112510 () Bool)

(assert (=> b!228578 (=> res!112510 e!148299)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11239 (_ BitVec 32)) Bool)

(assert (=> b!228578 (= res!112510 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6318 thiss!1504) (mask!10136 thiss!1504))))))

(declare-fun b!228579 () Bool)

(assert (=> b!228579 (= e!148299 true)))

(declare-fun lt!114999 () Bool)

(declare-datatypes ((List!3414 0))(
  ( (Nil!3411) (Cons!3410 (h!4058 (_ BitVec 64)) (t!8373 List!3414)) )
))
(declare-fun arrayNoDuplicates!0 (array!11239 (_ BitVec 32) List!3414) Bool)

(assert (=> b!228579 (= lt!114999 (arrayNoDuplicates!0 (_keys!6318 thiss!1504) #b00000000000000000000000000000000 Nil!3411))))

(declare-fun b!228580 () Bool)

(assert (=> b!228580 (= e!148304 (not call!21239))))

(declare-fun b!228581 () Bool)

(declare-fun e!148297 () Unit!6953)

(declare-fun Unit!6955 () Unit!6953)

(assert (=> b!228581 (= e!148297 Unit!6955)))

(declare-fun lt!114991 () Unit!6953)

(declare-fun lemmaArrayContainsKeyThenInListMap!110 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7643 V!7643 (_ BitVec 64) (_ BitVec 32) Int) Unit!6953)

(assert (=> b!228581 (= lt!114991 (lemmaArrayContainsKeyThenInListMap!110 (_keys!6318 thiss!1504) (_values!4247 thiss!1504) (mask!10136 thiss!1504) (extraKeys!4001 thiss!1504) (zeroValue!4105 thiss!1504) (minValue!4105 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4264 thiss!1504)))))

(assert (=> b!228581 false))

(declare-fun b!228582 () Bool)

(declare-fun e!148291 () Bool)

(assert (=> b!228582 (= e!148291 (not e!148299))))

(declare-fun res!112511 () Bool)

(assert (=> b!228582 (=> res!112511 e!148299)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228582 (= res!112511 (not (validMask!0 (mask!10136 thiss!1504))))))

(declare-fun lt!114994 () array!11239)

(assert (=> b!228582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114994 (mask!10136 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114995 () Unit!6953)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11239 (_ BitVec 32) (_ BitVec 32)) Unit!6953)

(assert (=> b!228582 (= lt!114995 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6318 thiss!1504) index!297 (mask!10136 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11239 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228582 (= (arrayCountValidKeys!0 lt!114994 #b00000000000000000000000000000000 (size!5672 (_keys!6318 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6318 thiss!1504) #b00000000000000000000000000000000 (size!5672 (_keys!6318 thiss!1504)))))))

(declare-fun lt!114996 () Unit!6953)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11239 (_ BitVec 32) (_ BitVec 64)) Unit!6953)

(assert (=> b!228582 (= lt!114996 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6318 thiss!1504) index!297 key!932))))

(assert (=> b!228582 (arrayNoDuplicates!0 lt!114994 #b00000000000000000000000000000000 Nil!3411)))

(assert (=> b!228582 (= lt!114994 (array!11240 (store (arr!5339 (_keys!6318 thiss!1504)) index!297 key!932) (size!5672 (_keys!6318 thiss!1504))))))

(declare-fun lt!114998 () Unit!6953)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3414) Unit!6953)

(assert (=> b!228582 (= lt!114998 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6318 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3411))))

(declare-fun lt!114992 () Unit!6953)

(assert (=> b!228582 (= lt!114992 e!148297)))

(declare-fun c!37905 () Bool)

(declare-fun arrayContainsKey!0 (array!11239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228582 (= c!37905 (arrayContainsKey!0 (_keys!6318 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228583 () Bool)

(declare-fun e!148292 () Bool)

(assert (=> b!228583 (= e!148292 e!148291)))

(declare-fun res!112512 () Bool)

(assert (=> b!228583 (=> (not res!112512) (not e!148291))))

(assert (=> b!228583 (= res!112512 (inRange!0 index!297 (mask!10136 thiss!1504)))))

(declare-fun lt!114997 () Unit!6953)

(assert (=> b!228583 (= lt!114997 e!148303)))

(declare-fun c!37908 () Bool)

(declare-datatypes ((tuple2!4492 0))(
  ( (tuple2!4493 (_1!2257 (_ BitVec 64)) (_2!2257 V!7643)) )
))
(declare-datatypes ((List!3415 0))(
  ( (Nil!3412) (Cons!3411 (h!4059 tuple2!4492) (t!8374 List!3415)) )
))
(declare-datatypes ((ListLongMap!3405 0))(
  ( (ListLongMap!3406 (toList!1718 List!3415)) )
))
(declare-fun contains!1592 (ListLongMap!3405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1246 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7643 V!7643 (_ BitVec 32) Int) ListLongMap!3405)

(assert (=> b!228583 (= c!37908 (contains!1592 (getCurrentListMap!1246 (_keys!6318 thiss!1504) (_values!4247 thiss!1504) (mask!10136 thiss!1504) (extraKeys!4001 thiss!1504) (zeroValue!4105 thiss!1504) (minValue!4105 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4264 thiss!1504)) key!932))))

(declare-fun b!228584 () Bool)

(assert (=> b!228584 (= e!148302 ((_ is Undefined!909) lt!115001))))

(declare-fun b!228585 () Bool)

(declare-fun res!112507 () Bool)

(assert (=> b!228585 (=> (not res!112507) (not e!148301))))

(assert (=> b!228585 (= res!112507 call!21240)))

(assert (=> b!228585 (= e!148294 e!148301)))

(declare-fun b!228586 () Bool)

(declare-fun Unit!6956 () Unit!6953)

(assert (=> b!228586 (= e!148303 Unit!6956)))

(declare-fun lt!114993 () Unit!6953)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (array!11239 array!11237 (_ BitVec 32) (_ BitVec 32) V!7643 V!7643 (_ BitVec 64) Int) Unit!6953)

(assert (=> b!228586 (= lt!114993 (lemmaInListMapThenSeekEntryOrOpenFindsIt!273 (_keys!6318 thiss!1504) (_values!4247 thiss!1504) (mask!10136 thiss!1504) (extraKeys!4001 thiss!1504) (zeroValue!4105 thiss!1504) (minValue!4105 thiss!1504) key!932 (defaultEntry!4264 thiss!1504)))))

(assert (=> b!228586 false))

(declare-fun mapNonEmpty!10165 () Bool)

(declare-fun mapRes!10165 () Bool)

(declare-fun tp!21547 () Bool)

(declare-fun e!148295 () Bool)

(assert (=> mapNonEmpty!10165 (= mapRes!10165 (and tp!21547 e!148295))))

(declare-fun mapRest!10165 () (Array (_ BitVec 32) ValueCell!2655))

(declare-fun mapKey!10165 () (_ BitVec 32))

(declare-fun mapValue!10165 () ValueCell!2655)

(assert (=> mapNonEmpty!10165 (= (arr!5338 (_values!4247 thiss!1504)) (store mapRest!10165 mapKey!10165 mapValue!10165))))

(declare-fun b!228587 () Bool)

(declare-fun e!148290 () Bool)

(declare-fun tp_is_empty!5997 () Bool)

(assert (=> b!228587 (= e!148290 tp_is_empty!5997)))

(declare-fun bm!21237 () Bool)

(assert (=> bm!21237 (= call!21239 (arrayContainsKey!0 (_keys!6318 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228588 () Bool)

(declare-fun Unit!6957 () Unit!6953)

(assert (=> b!228588 (= e!148297 Unit!6957)))

(declare-fun mapIsEmpty!10165 () Bool)

(assert (=> mapIsEmpty!10165 mapRes!10165))

(declare-fun e!148298 () Bool)

(declare-fun array_inv!3527 (array!11239) Bool)

(declare-fun array_inv!3528 (array!11237) Bool)

(assert (=> b!228589 (= e!148293 (and tp!21546 tp_is_empty!5997 (array_inv!3527 (_keys!6318 thiss!1504)) (array_inv!3528 (_values!4247 thiss!1504)) e!148298))))

(declare-fun b!228590 () Bool)

(assert (=> b!228590 (= e!148298 (and e!148290 mapRes!10165))))

(declare-fun condMapEmpty!10165 () Bool)

(declare-fun mapDefault!10165 () ValueCell!2655)

(assert (=> b!228590 (= condMapEmpty!10165 (= (arr!5338 (_values!4247 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2655)) mapDefault!10165)))))

(declare-fun b!228591 () Bool)

(assert (=> b!228591 (= e!148296 e!148292)))

(declare-fun res!112513 () Bool)

(assert (=> b!228591 (=> (not res!112513) (not e!148292))))

(assert (=> b!228591 (= res!112513 (or (= lt!115001 (MissingZero!909 index!297)) (= lt!115001 (MissingVacant!909 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11239 (_ BitVec 32)) SeekEntryResult!909)

(assert (=> b!228591 (= lt!115001 (seekEntryOrOpen!0 key!932 (_keys!6318 thiss!1504) (mask!10136 thiss!1504)))))

(declare-fun b!228592 () Bool)

(assert (=> b!228592 (= e!148295 tp_is_empty!5997)))

(declare-fun b!228593 () Bool)

(declare-fun res!112508 () Bool)

(assert (=> b!228593 (=> (not res!112508) (not e!148296))))

(assert (=> b!228593 (= res!112508 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228594 () Bool)

(assert (=> b!228594 (= e!148302 e!148304)))

(declare-fun res!112506 () Bool)

(assert (=> b!228594 (= res!112506 call!21240)))

(assert (=> b!228594 (=> (not res!112506) (not e!148304))))

(declare-fun b!228595 () Bool)

(declare-fun res!112505 () Bool)

(assert (=> b!228595 (=> (not res!112505) (not e!148301))))

(assert (=> b!228595 (= res!112505 (= (select (arr!5339 (_keys!6318 thiss!1504)) (index!5806 lt!115001)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22068 res!112503) b!228593))

(assert (= (and b!228593 res!112508) b!228591))

(assert (= (and b!228591 res!112513) b!228583))

(assert (= (and b!228583 c!37908) b!228586))

(assert (= (and b!228583 (not c!37908)) b!228577))

(assert (= (and b!228577 c!37906) b!228585))

(assert (= (and b!228577 (not c!37906)) b!228574))

(assert (= (and b!228585 res!112507) b!228595))

(assert (= (and b!228595 res!112505) b!228576))

(assert (= (and b!228574 c!37907) b!228594))

(assert (= (and b!228574 (not c!37907)) b!228584))

(assert (= (and b!228594 res!112506) b!228575))

(assert (= (and b!228575 res!112504) b!228580))

(assert (= (or b!228585 b!228594) bm!21236))

(assert (= (or b!228576 b!228580) bm!21237))

(assert (= (and b!228583 res!112512) b!228582))

(assert (= (and b!228582 c!37905) b!228581))

(assert (= (and b!228582 (not c!37905)) b!228588))

(assert (= (and b!228582 (not res!112511)) b!228573))

(assert (= (and b!228573 (not res!112509)) b!228578))

(assert (= (and b!228578 (not res!112510)) b!228579))

(assert (= (and b!228590 condMapEmpty!10165) mapIsEmpty!10165))

(assert (= (and b!228590 (not condMapEmpty!10165)) mapNonEmpty!10165))

(assert (= (and mapNonEmpty!10165 ((_ is ValueCellFull!2655) mapValue!10165)) b!228592))

(assert (= (and b!228590 ((_ is ValueCellFull!2655) mapDefault!10165)) b!228587))

(assert (= b!228589 b!228590))

(assert (= start!22068 b!228589))

(declare-fun m!250299 () Bool)

(assert (=> bm!21237 m!250299))

(declare-fun m!250301 () Bool)

(assert (=> b!228579 m!250301))

(declare-fun m!250303 () Bool)

(assert (=> b!228583 m!250303))

(declare-fun m!250305 () Bool)

(assert (=> b!228583 m!250305))

(assert (=> b!228583 m!250305))

(declare-fun m!250307 () Bool)

(assert (=> b!228583 m!250307))

(declare-fun m!250309 () Bool)

(assert (=> b!228577 m!250309))

(declare-fun m!250311 () Bool)

(assert (=> b!228591 m!250311))

(declare-fun m!250313 () Bool)

(assert (=> mapNonEmpty!10165 m!250313))

(declare-fun m!250315 () Bool)

(assert (=> start!22068 m!250315))

(declare-fun m!250317 () Bool)

(assert (=> b!228582 m!250317))

(assert (=> b!228582 m!250299))

(declare-fun m!250319 () Bool)

(assert (=> b!228582 m!250319))

(declare-fun m!250321 () Bool)

(assert (=> b!228582 m!250321))

(declare-fun m!250323 () Bool)

(assert (=> b!228582 m!250323))

(declare-fun m!250325 () Bool)

(assert (=> b!228582 m!250325))

(declare-fun m!250327 () Bool)

(assert (=> b!228582 m!250327))

(declare-fun m!250329 () Bool)

(assert (=> b!228582 m!250329))

(declare-fun m!250331 () Bool)

(assert (=> b!228582 m!250331))

(declare-fun m!250333 () Bool)

(assert (=> b!228582 m!250333))

(declare-fun m!250335 () Bool)

(assert (=> b!228586 m!250335))

(declare-fun m!250337 () Bool)

(assert (=> b!228575 m!250337))

(declare-fun m!250339 () Bool)

(assert (=> b!228578 m!250339))

(declare-fun m!250341 () Bool)

(assert (=> b!228581 m!250341))

(declare-fun m!250343 () Bool)

(assert (=> b!228595 m!250343))

(declare-fun m!250345 () Bool)

(assert (=> bm!21236 m!250345))

(declare-fun m!250347 () Bool)

(assert (=> b!228589 m!250347))

(declare-fun m!250349 () Bool)

(assert (=> b!228589 m!250349))

(check-sat (not b!228586) (not bm!21236) (not b!228583) (not mapNonEmpty!10165) (not start!22068) (not bm!21237) tp_is_empty!5997 (not b_next!6135) (not b!228582) (not b!228579) (not b!228577) (not b!228591) (not b!228589) (not b!228581) (not b!228578) b_and!13033)
(check-sat b_and!13033 (not b_next!6135))
