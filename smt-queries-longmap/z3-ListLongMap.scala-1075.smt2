; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22136 () Bool)

(assert start!22136)

(declare-fun b!230494 () Bool)

(declare-fun b_free!6199 () Bool)

(declare-fun b_next!6199 () Bool)

(assert (=> b!230494 (= b_free!6199 (not b_next!6199))))

(declare-fun tp!21738 () Bool)

(declare-fun b_and!13071 () Bool)

(assert (=> b!230494 (= tp!21738 b_and!13071)))

(declare-fun mapNonEmpty!10261 () Bool)

(declare-fun mapRes!10261 () Bool)

(declare-fun tp!21739 () Bool)

(declare-fun e!149590 () Bool)

(assert (=> mapNonEmpty!10261 (= mapRes!10261 (and tp!21739 e!149590))))

(declare-fun mapKey!10261 () (_ BitVec 32))

(declare-datatypes ((V!7729 0))(
  ( (V!7730 (val!3075 Int)) )
))
(declare-datatypes ((ValueCell!2687 0))(
  ( (ValueCellFull!2687 (v!5089 V!7729)) (EmptyCell!2687) )
))
(declare-fun mapRest!10261 () (Array (_ BitVec 32) ValueCell!2687))

(declare-datatypes ((array!11357 0))(
  ( (array!11358 (arr!5397 (Array (_ BitVec 32) ValueCell!2687)) (size!5731 (_ BitVec 32))) )
))
(declare-datatypes ((array!11359 0))(
  ( (array!11360 (arr!5398 (Array (_ BitVec 32) (_ BitVec 64))) (size!5732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3274 0))(
  ( (LongMapFixedSize!3275 (defaultEntry!4296 Int) (mask!10189 (_ BitVec 32)) (extraKeys!4033 (_ BitVec 32)) (zeroValue!4137 V!7729) (minValue!4137 V!7729) (_size!1686 (_ BitVec 32)) (_keys!6349 array!11359) (_values!4279 array!11357) (_vacant!1686 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3274)

(declare-fun mapValue!10261 () ValueCell!2687)

(assert (=> mapNonEmpty!10261 (= (arr!5397 (_values!4279 thiss!1504)) (store mapRest!10261 mapKey!10261 mapValue!10261))))

(declare-fun b!230493 () Bool)

(declare-fun e!149595 () Bool)

(declare-fun e!149585 () Bool)

(assert (=> b!230493 (= e!149595 e!149585)))

(declare-fun res!113329 () Bool)

(assert (=> b!230493 (=> (not res!113329) (not e!149585))))

(declare-datatypes ((SeekEntryResult!938 0))(
  ( (MissingZero!938 (index!5922 (_ BitVec 32))) (Found!938 (index!5923 (_ BitVec 32))) (Intermediate!938 (undefined!1750 Bool) (index!5924 (_ BitVec 32)) (x!23453 (_ BitVec 32))) (Undefined!938) (MissingVacant!938 (index!5925 (_ BitVec 32))) )
))
(declare-fun lt!115928 () SeekEntryResult!938)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230493 (= res!113329 (or (= lt!115928 (MissingZero!938 index!297)) (= lt!115928 (MissingVacant!938 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11359 (_ BitVec 32)) SeekEntryResult!938)

(assert (=> b!230493 (= lt!115928 (seekEntryOrOpen!0 key!932 (_keys!6349 thiss!1504) (mask!10189 thiss!1504)))))

(declare-fun tp_is_empty!6061 () Bool)

(declare-fun e!149583 () Bool)

(declare-fun e!149594 () Bool)

(declare-fun array_inv!3563 (array!11359) Bool)

(declare-fun array_inv!3564 (array!11357) Bool)

(assert (=> b!230494 (= e!149594 (and tp!21738 tp_is_empty!6061 (array_inv!3563 (_keys!6349 thiss!1504)) (array_inv!3564 (_values!4279 thiss!1504)) e!149583))))

(declare-fun b!230495 () Bool)

(declare-fun e!149587 () Bool)

(declare-fun call!21407 () Bool)

(assert (=> b!230495 (= e!149587 (not call!21407))))

(declare-fun res!113324 () Bool)

(assert (=> start!22136 (=> (not res!113324) (not e!149595))))

(declare-fun valid!1316 (LongMapFixedSize!3274) Bool)

(assert (=> start!22136 (= res!113324 (valid!1316 thiss!1504))))

(assert (=> start!22136 e!149595))

(assert (=> start!22136 e!149594))

(assert (=> start!22136 true))

(assert (=> start!22136 tp_is_empty!6061))

(declare-fun b!230496 () Bool)

(declare-fun e!149589 () Bool)

(get-info :version)

(assert (=> b!230496 (= e!149589 ((_ is Undefined!938) lt!115928))))

(declare-fun b!230497 () Bool)

(declare-fun res!113327 () Bool)

(declare-fun e!149592 () Bool)

(assert (=> b!230497 (=> (not res!113327) (not e!149592))))

(assert (=> b!230497 (= res!113327 (= (select (arr!5398 (_keys!6349 thiss!1504)) (index!5922 lt!115928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230498 () Bool)

(declare-fun e!149586 () Bool)

(assert (=> b!230498 (= e!149586 (not true))))

(declare-fun lt!115926 () array!11359)

(declare-fun arrayCountValidKeys!0 (array!11359 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230498 (= (arrayCountValidKeys!0 lt!115926 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7038 0))(
  ( (Unit!7039) )
))
(declare-fun lt!115932 () Unit!7038)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11359 (_ BitVec 32)) Unit!7038)

(assert (=> b!230498 (= lt!115932 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!115926 index!297))))

(declare-fun arrayContainsKey!0 (array!11359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230498 (arrayContainsKey!0 lt!115926 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!115939 () Unit!7038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11359 (_ BitVec 64) (_ BitVec 32)) Unit!7038)

(assert (=> b!230498 (= lt!115939 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!115926 key!932 index!297))))

(declare-fun v!346 () V!7729)

(declare-datatypes ((tuple2!4506 0))(
  ( (tuple2!4507 (_1!2264 (_ BitVec 64)) (_2!2264 V!7729)) )
))
(declare-datatypes ((List!3444 0))(
  ( (Nil!3441) (Cons!3440 (h!4088 tuple2!4506) (t!8394 List!3444)) )
))
(declare-datatypes ((ListLongMap!3409 0))(
  ( (ListLongMap!3410 (toList!1720 List!3444)) )
))
(declare-fun lt!115936 () ListLongMap!3409)

(declare-fun +!606 (ListLongMap!3409 tuple2!4506) ListLongMap!3409)

(declare-fun getCurrentListMap!1229 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 32) Int) ListLongMap!3409)

(assert (=> b!230498 (= (+!606 lt!115936 (tuple2!4507 key!932 v!346)) (getCurrentListMap!1229 lt!115926 (array!11358 (store (arr!5397 (_values!4279 thiss!1504)) index!297 (ValueCellFull!2687 v!346)) (size!5731 (_values!4279 thiss!1504))) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(declare-fun lt!115934 () Unit!7038)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!61 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 32) (_ BitVec 64) V!7729 Int) Unit!7038)

(assert (=> b!230498 (= lt!115934 (lemmaAddValidKeyToArrayThenAddPairToListMap!61 (_keys!6349 thiss!1504) (_values!4279 thiss!1504) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) index!297 key!932 v!346 (defaultEntry!4296 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11359 (_ BitVec 32)) Bool)

(assert (=> b!230498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115926 (mask!10189 thiss!1504))))

(declare-fun lt!115931 () Unit!7038)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11359 (_ BitVec 32) (_ BitVec 32)) Unit!7038)

(assert (=> b!230498 (= lt!115931 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6349 thiss!1504) index!297 (mask!10189 thiss!1504)))))

(assert (=> b!230498 (= (arrayCountValidKeys!0 lt!115926 #b00000000000000000000000000000000 (size!5732 (_keys!6349 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6349 thiss!1504) #b00000000000000000000000000000000 (size!5732 (_keys!6349 thiss!1504)))))))

(declare-fun lt!115929 () Unit!7038)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11359 (_ BitVec 32) (_ BitVec 64)) Unit!7038)

(assert (=> b!230498 (= lt!115929 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6349 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3445 0))(
  ( (Nil!3442) (Cons!3441 (h!4089 (_ BitVec 64)) (t!8395 List!3445)) )
))
(declare-fun arrayNoDuplicates!0 (array!11359 (_ BitVec 32) List!3445) Bool)

(assert (=> b!230498 (arrayNoDuplicates!0 lt!115926 #b00000000000000000000000000000000 Nil!3442)))

(assert (=> b!230498 (= lt!115926 (array!11360 (store (arr!5398 (_keys!6349 thiss!1504)) index!297 key!932) (size!5732 (_keys!6349 thiss!1504))))))

(declare-fun lt!115935 () Unit!7038)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3445) Unit!7038)

(assert (=> b!230498 (= lt!115935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6349 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3442))))

(declare-fun lt!115938 () Unit!7038)

(declare-fun e!149588 () Unit!7038)

(assert (=> b!230498 (= lt!115938 e!149588)))

(declare-fun c!38264 () Bool)

(assert (=> b!230498 (= c!38264 (arrayContainsKey!0 (_keys!6349 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230499 () Bool)

(declare-fun res!113330 () Bool)

(assert (=> b!230499 (=> (not res!113330) (not e!149595))))

(assert (=> b!230499 (= res!113330 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21404 () Bool)

(assert (=> bm!21404 (= call!21407 (arrayContainsKey!0 (_keys!6349 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230500 () Bool)

(assert (=> b!230500 (= e!149585 e!149586)))

(declare-fun res!113323 () Bool)

(assert (=> b!230500 (=> (not res!113323) (not e!149586))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230500 (= res!113323 (inRange!0 index!297 (mask!10189 thiss!1504)))))

(declare-fun lt!115933 () Unit!7038)

(declare-fun e!149582 () Unit!7038)

(assert (=> b!230500 (= lt!115933 e!149582)))

(declare-fun c!38266 () Bool)

(declare-fun contains!1595 (ListLongMap!3409 (_ BitVec 64)) Bool)

(assert (=> b!230500 (= c!38266 (contains!1595 lt!115936 key!932))))

(assert (=> b!230500 (= lt!115936 (getCurrentListMap!1229 (_keys!6349 thiss!1504) (_values!4279 thiss!1504) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(declare-fun b!230501 () Bool)

(declare-fun Unit!7040 () Unit!7038)

(assert (=> b!230501 (= e!149588 Unit!7040)))

(declare-fun lt!115927 () Unit!7038)

(declare-fun lemmaArrayContainsKeyThenInListMap!134 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) (_ BitVec 32) Int) Unit!7038)

(assert (=> b!230501 (= lt!115927 (lemmaArrayContainsKeyThenInListMap!134 (_keys!6349 thiss!1504) (_values!4279 thiss!1504) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(assert (=> b!230501 false))

(declare-fun mapIsEmpty!10261 () Bool)

(assert (=> mapIsEmpty!10261 mapRes!10261))

(declare-fun b!230502 () Bool)

(assert (=> b!230502 (= e!149590 tp_is_empty!6061)))

(declare-fun b!230503 () Bool)

(declare-fun Unit!7041 () Unit!7038)

(assert (=> b!230503 (= e!149588 Unit!7041)))

(declare-fun b!230504 () Bool)

(declare-fun lt!115937 () Unit!7038)

(assert (=> b!230504 (= e!149582 lt!115937)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) Int) Unit!7038)

(assert (=> b!230504 (= lt!115937 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (_keys!6349 thiss!1504) (_values!4279 thiss!1504) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 (defaultEntry!4296 thiss!1504)))))

(declare-fun c!38263 () Bool)

(assert (=> b!230504 (= c!38263 ((_ is MissingZero!938) lt!115928))))

(declare-fun e!149584 () Bool)

(assert (=> b!230504 e!149584))

(declare-fun b!230505 () Bool)

(declare-fun c!38265 () Bool)

(assert (=> b!230505 (= c!38265 ((_ is MissingVacant!938) lt!115928))))

(assert (=> b!230505 (= e!149584 e!149589)))

(declare-fun bm!21405 () Bool)

(declare-fun call!21408 () Bool)

(assert (=> bm!21405 (= call!21408 (inRange!0 (ite c!38263 (index!5922 lt!115928) (index!5925 lt!115928)) (mask!10189 thiss!1504)))))

(declare-fun b!230506 () Bool)

(declare-fun Unit!7042 () Unit!7038)

(assert (=> b!230506 (= e!149582 Unit!7042)))

(declare-fun lt!115930 () Unit!7038)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) Int) Unit!7038)

(assert (=> b!230506 (= lt!115930 (lemmaInListMapThenSeekEntryOrOpenFindsIt!293 (_keys!6349 thiss!1504) (_values!4279 thiss!1504) (mask!10189 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 (defaultEntry!4296 thiss!1504)))))

(assert (=> b!230506 false))

(declare-fun b!230507 () Bool)

(declare-fun res!113325 () Bool)

(assert (=> b!230507 (= res!113325 (= (select (arr!5398 (_keys!6349 thiss!1504)) (index!5925 lt!115928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230507 (=> (not res!113325) (not e!149587))))

(declare-fun b!230508 () Bool)

(declare-fun res!113326 () Bool)

(assert (=> b!230508 (=> (not res!113326) (not e!149592))))

(assert (=> b!230508 (= res!113326 call!21408)))

(assert (=> b!230508 (= e!149584 e!149592)))

(declare-fun b!230509 () Bool)

(assert (=> b!230509 (= e!149592 (not call!21407))))

(declare-fun b!230510 () Bool)

(declare-fun e!149593 () Bool)

(assert (=> b!230510 (= e!149583 (and e!149593 mapRes!10261))))

(declare-fun condMapEmpty!10261 () Bool)

(declare-fun mapDefault!10261 () ValueCell!2687)

(assert (=> b!230510 (= condMapEmpty!10261 (= (arr!5397 (_values!4279 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2687)) mapDefault!10261)))))

(declare-fun b!230511 () Bool)

(assert (=> b!230511 (= e!149593 tp_is_empty!6061)))

(declare-fun b!230512 () Bool)

(assert (=> b!230512 (= e!149589 e!149587)))

(declare-fun res!113328 () Bool)

(assert (=> b!230512 (= res!113328 call!21408)))

(assert (=> b!230512 (=> (not res!113328) (not e!149587))))

(assert (= (and start!22136 res!113324) b!230499))

(assert (= (and b!230499 res!113330) b!230493))

(assert (= (and b!230493 res!113329) b!230500))

(assert (= (and b!230500 c!38266) b!230506))

(assert (= (and b!230500 (not c!38266)) b!230504))

(assert (= (and b!230504 c!38263) b!230508))

(assert (= (and b!230504 (not c!38263)) b!230505))

(assert (= (and b!230508 res!113326) b!230497))

(assert (= (and b!230497 res!113327) b!230509))

(assert (= (and b!230505 c!38265) b!230512))

(assert (= (and b!230505 (not c!38265)) b!230496))

(assert (= (and b!230512 res!113328) b!230507))

(assert (= (and b!230507 res!113325) b!230495))

(assert (= (or b!230508 b!230512) bm!21405))

(assert (= (or b!230509 b!230495) bm!21404))

(assert (= (and b!230500 res!113323) b!230498))

(assert (= (and b!230498 c!38264) b!230501))

(assert (= (and b!230498 (not c!38264)) b!230503))

(assert (= (and b!230510 condMapEmpty!10261) mapIsEmpty!10261))

(assert (= (and b!230510 (not condMapEmpty!10261)) mapNonEmpty!10261))

(assert (= (and mapNonEmpty!10261 ((_ is ValueCellFull!2687) mapValue!10261)) b!230502))

(assert (= (and b!230510 ((_ is ValueCellFull!2687) mapDefault!10261)) b!230511))

(assert (= b!230494 b!230510))

(assert (= start!22136 b!230494))

(declare-fun m!251389 () Bool)

(assert (=> bm!21405 m!251389))

(declare-fun m!251391 () Bool)

(assert (=> b!230507 m!251391))

(declare-fun m!251393 () Bool)

(assert (=> bm!21404 m!251393))

(declare-fun m!251395 () Bool)

(assert (=> b!230497 m!251395))

(declare-fun m!251397 () Bool)

(assert (=> b!230500 m!251397))

(declare-fun m!251399 () Bool)

(assert (=> b!230500 m!251399))

(declare-fun m!251401 () Bool)

(assert (=> b!230500 m!251401))

(declare-fun m!251403 () Bool)

(assert (=> start!22136 m!251403))

(declare-fun m!251405 () Bool)

(assert (=> b!230501 m!251405))

(assert (=> b!230498 m!251393))

(declare-fun m!251407 () Bool)

(assert (=> b!230498 m!251407))

(declare-fun m!251409 () Bool)

(assert (=> b!230498 m!251409))

(declare-fun m!251411 () Bool)

(assert (=> b!230498 m!251411))

(declare-fun m!251413 () Bool)

(assert (=> b!230498 m!251413))

(declare-fun m!251415 () Bool)

(assert (=> b!230498 m!251415))

(declare-fun m!251417 () Bool)

(assert (=> b!230498 m!251417))

(declare-fun m!251419 () Bool)

(assert (=> b!230498 m!251419))

(declare-fun m!251421 () Bool)

(assert (=> b!230498 m!251421))

(declare-fun m!251423 () Bool)

(assert (=> b!230498 m!251423))

(declare-fun m!251425 () Bool)

(assert (=> b!230498 m!251425))

(declare-fun m!251427 () Bool)

(assert (=> b!230498 m!251427))

(declare-fun m!251429 () Bool)

(assert (=> b!230498 m!251429))

(declare-fun m!251431 () Bool)

(assert (=> b!230498 m!251431))

(declare-fun m!251433 () Bool)

(assert (=> b!230498 m!251433))

(declare-fun m!251435 () Bool)

(assert (=> b!230498 m!251435))

(declare-fun m!251437 () Bool)

(assert (=> b!230498 m!251437))

(declare-fun m!251439 () Bool)

(assert (=> mapNonEmpty!10261 m!251439))

(declare-fun m!251441 () Bool)

(assert (=> b!230506 m!251441))

(declare-fun m!251443 () Bool)

(assert (=> b!230493 m!251443))

(declare-fun m!251445 () Bool)

(assert (=> b!230494 m!251445))

(declare-fun m!251447 () Bool)

(assert (=> b!230494 m!251447))

(declare-fun m!251449 () Bool)

(assert (=> b!230504 m!251449))

(check-sat (not bm!21405) (not b!230498) (not b!230500) (not b_next!6199) b_and!13071 (not b!230494) tp_is_empty!6061 (not mapNonEmpty!10261) (not bm!21404) (not b!230493) (not b!230506) (not b!230504) (not start!22136) (not b!230501))
(check-sat b_and!13071 (not b_next!6199))
