; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22172 () Bool)

(assert start!22172)

(declare-fun b!231590 () Bool)

(declare-fun b_free!6235 () Bool)

(declare-fun b_next!6235 () Bool)

(assert (=> b!231590 (= b_free!6235 (not b_next!6235))))

(declare-fun tp!21846 () Bool)

(declare-fun b_and!13107 () Bool)

(assert (=> b!231590 (= tp!21846 b_and!13107)))

(declare-fun mapNonEmpty!10315 () Bool)

(declare-fun mapRes!10315 () Bool)

(declare-fun tp!21847 () Bool)

(declare-fun e!150344 () Bool)

(assert (=> mapNonEmpty!10315 (= mapRes!10315 (and tp!21847 e!150344))))

(declare-datatypes ((V!7777 0))(
  ( (V!7778 (val!3093 Int)) )
))
(declare-datatypes ((ValueCell!2705 0))(
  ( (ValueCellFull!2705 (v!5107 V!7777)) (EmptyCell!2705) )
))
(declare-datatypes ((array!11429 0))(
  ( (array!11430 (arr!5433 (Array (_ BitVec 32) ValueCell!2705)) (size!5767 (_ BitVec 32))) )
))
(declare-datatypes ((array!11431 0))(
  ( (array!11432 (arr!5434 (Array (_ BitVec 32) (_ BitVec 64))) (size!5768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3310 0))(
  ( (LongMapFixedSize!3311 (defaultEntry!4314 Int) (mask!10219 (_ BitVec 32)) (extraKeys!4051 (_ BitVec 32)) (zeroValue!4155 V!7777) (minValue!4155 V!7777) (_size!1704 (_ BitVec 32)) (_keys!6367 array!11431) (_values!4297 array!11429) (_vacant!1704 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3310)

(declare-fun mapRest!10315 () (Array (_ BitVec 32) ValueCell!2705))

(declare-fun mapKey!10315 () (_ BitVec 32))

(declare-fun mapValue!10315 () ValueCell!2705)

(assert (=> mapNonEmpty!10315 (= (arr!5433 (_values!4297 thiss!1504)) (store mapRest!10315 mapKey!10315 mapValue!10315))))

(declare-datatypes ((SeekEntryResult!956 0))(
  ( (MissingZero!956 (index!5994 (_ BitVec 32))) (Found!956 (index!5995 (_ BitVec 32))) (Intermediate!956 (undefined!1768 Bool) (index!5996 (_ BitVec 32)) (x!23519 (_ BitVec 32))) (Undefined!956) (MissingVacant!956 (index!5997 (_ BitVec 32))) )
))
(declare-fun lt!116690 () SeekEntryResult!956)

(declare-fun c!38482 () Bool)

(declare-fun bm!21512 () Bool)

(declare-fun call!21516 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21512 (= call!21516 (inRange!0 (ite c!38482 (index!5994 lt!116690) (index!5997 lt!116690)) (mask!10219 thiss!1504)))))

(declare-fun b!231573 () Bool)

(declare-datatypes ((Unit!7108 0))(
  ( (Unit!7109) )
))
(declare-fun e!150346 () Unit!7108)

(declare-fun Unit!7110 () Unit!7108)

(assert (=> b!231573 (= e!150346 Unit!7110)))

(declare-fun lt!116683 () Unit!7108)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!306 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231573 (= lt!116683 (lemmaInListMapThenSeekEntryOrOpenFindsIt!306 (_keys!6367 thiss!1504) (_values!4297 thiss!1504) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 (defaultEntry!4314 thiss!1504)))))

(assert (=> b!231573 false))

(declare-fun b!231574 () Bool)

(declare-fun e!150341 () Bool)

(declare-fun call!21515 () Bool)

(assert (=> b!231574 (= e!150341 (not call!21515))))

(declare-fun b!231575 () Bool)

(declare-fun lt!116688 () Unit!7108)

(assert (=> b!231575 (= e!150346 lt!116688)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!303 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) Int) Unit!7108)

(assert (=> b!231575 (= lt!116688 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!303 (_keys!6367 thiss!1504) (_values!4297 thiss!1504) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 (defaultEntry!4314 thiss!1504)))))

(get-info :version)

(assert (=> b!231575 (= c!38482 ((_ is MissingZero!956) lt!116690))))

(declare-fun e!150338 () Bool)

(assert (=> b!231575 e!150338))

(declare-fun b!231576 () Bool)

(declare-fun e!150350 () Bool)

(assert (=> b!231576 (= e!150350 (not true))))

(declare-fun lt!116692 () array!11431)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231576 (= (arrayCountValidKeys!0 lt!116692 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116684 () Unit!7108)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11431 (_ BitVec 32)) Unit!7108)

(assert (=> b!231576 (= lt!116684 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116692 index!297))))

(declare-fun arrayContainsKey!0 (array!11431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231576 (arrayContainsKey!0 lt!116692 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116693 () Unit!7108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11431 (_ BitVec 64) (_ BitVec 32)) Unit!7108)

(assert (=> b!231576 (= lt!116693 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116692 key!932 index!297))))

(declare-datatypes ((tuple2!4536 0))(
  ( (tuple2!4537 (_1!2279 (_ BitVec 64)) (_2!2279 V!7777)) )
))
(declare-datatypes ((List!3473 0))(
  ( (Nil!3470) (Cons!3469 (h!4117 tuple2!4536) (t!8423 List!3473)) )
))
(declare-datatypes ((ListLongMap!3439 0))(
  ( (ListLongMap!3440 (toList!1735 List!3473)) )
))
(declare-fun lt!116685 () ListLongMap!3439)

(declare-fun v!346 () V!7777)

(declare-fun +!620 (ListLongMap!3439 tuple2!4536) ListLongMap!3439)

(declare-fun getCurrentListMap!1244 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 32) Int) ListLongMap!3439)

(assert (=> b!231576 (= (+!620 lt!116685 (tuple2!4537 key!932 v!346)) (getCurrentListMap!1244 lt!116692 (array!11430 (store (arr!5433 (_values!4297 thiss!1504)) index!297 (ValueCellFull!2705 v!346)) (size!5767 (_values!4297 thiss!1504))) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(declare-fun lt!116695 () Unit!7108)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!75 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 32) (_ BitVec 64) V!7777 Int) Unit!7108)

(assert (=> b!231576 (= lt!116695 (lemmaAddValidKeyToArrayThenAddPairToListMap!75 (_keys!6367 thiss!1504) (_values!4297 thiss!1504) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) index!297 key!932 v!346 (defaultEntry!4314 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11431 (_ BitVec 32)) Bool)

(assert (=> b!231576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116692 (mask!10219 thiss!1504))))

(declare-fun lt!116682 () Unit!7108)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11431 (_ BitVec 32) (_ BitVec 32)) Unit!7108)

(assert (=> b!231576 (= lt!116682 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6367 thiss!1504) index!297 (mask!10219 thiss!1504)))))

(assert (=> b!231576 (= (arrayCountValidKeys!0 lt!116692 #b00000000000000000000000000000000 (size!5768 (_keys!6367 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6367 thiss!1504) #b00000000000000000000000000000000 (size!5768 (_keys!6367 thiss!1504)))))))

(declare-fun lt!116687 () Unit!7108)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11431 (_ BitVec 32) (_ BitVec 64)) Unit!7108)

(assert (=> b!231576 (= lt!116687 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6367 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3474 0))(
  ( (Nil!3471) (Cons!3470 (h!4118 (_ BitVec 64)) (t!8424 List!3474)) )
))
(declare-fun arrayNoDuplicates!0 (array!11431 (_ BitVec 32) List!3474) Bool)

(assert (=> b!231576 (arrayNoDuplicates!0 lt!116692 #b00000000000000000000000000000000 Nil!3471)))

(assert (=> b!231576 (= lt!116692 (array!11432 (store (arr!5434 (_keys!6367 thiss!1504)) index!297 key!932) (size!5768 (_keys!6367 thiss!1504))))))

(declare-fun lt!116689 () Unit!7108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3474) Unit!7108)

(assert (=> b!231576 (= lt!116689 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6367 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3471))))

(declare-fun lt!116686 () Unit!7108)

(declare-fun e!150345 () Unit!7108)

(assert (=> b!231576 (= lt!116686 e!150345)))

(declare-fun c!38479 () Bool)

(assert (=> b!231576 (= c!38479 (arrayContainsKey!0 (_keys!6367 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231577 () Bool)

(declare-fun Unit!7111 () Unit!7108)

(assert (=> b!231577 (= e!150345 Unit!7111)))

(declare-fun lt!116691 () Unit!7108)

(declare-fun lemmaArrayContainsKeyThenInListMap!145 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7777 V!7777 (_ BitVec 64) (_ BitVec 32) Int) Unit!7108)

(assert (=> b!231577 (= lt!116691 (lemmaArrayContainsKeyThenInListMap!145 (_keys!6367 thiss!1504) (_values!4297 thiss!1504) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(assert (=> b!231577 false))

(declare-fun b!231578 () Bool)

(declare-fun c!38481 () Bool)

(assert (=> b!231578 (= c!38481 ((_ is MissingVacant!956) lt!116690))))

(declare-fun e!150342 () Bool)

(assert (=> b!231578 (= e!150338 e!150342)))

(declare-fun b!231579 () Bool)

(declare-fun e!150343 () Bool)

(assert (=> b!231579 (= e!150343 e!150350)))

(declare-fun res!113756 () Bool)

(assert (=> b!231579 (=> (not res!113756) (not e!150350))))

(assert (=> b!231579 (= res!113756 (inRange!0 index!297 (mask!10219 thiss!1504)))))

(declare-fun lt!116694 () Unit!7108)

(assert (=> b!231579 (= lt!116694 e!150346)))

(declare-fun c!38480 () Bool)

(declare-fun contains!1607 (ListLongMap!3439 (_ BitVec 64)) Bool)

(assert (=> b!231579 (= c!38480 (contains!1607 lt!116685 key!932))))

(assert (=> b!231579 (= lt!116685 (getCurrentListMap!1244 (_keys!6367 thiss!1504) (_values!4297 thiss!1504) (mask!10219 thiss!1504) (extraKeys!4051 thiss!1504) (zeroValue!4155 thiss!1504) (minValue!4155 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4314 thiss!1504)))))

(declare-fun b!231580 () Bool)

(declare-fun Unit!7112 () Unit!7108)

(assert (=> b!231580 (= e!150345 Unit!7112)))

(declare-fun b!231581 () Bool)

(declare-fun res!113761 () Bool)

(declare-fun e!150351 () Bool)

(assert (=> b!231581 (=> (not res!113761) (not e!150351))))

(assert (=> b!231581 (= res!113761 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231582 () Bool)

(declare-fun res!113758 () Bool)

(assert (=> b!231582 (= res!113758 (= (select (arr!5434 (_keys!6367 thiss!1504)) (index!5997 lt!116690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231582 (=> (not res!113758) (not e!150341))))

(declare-fun res!113760 () Bool)

(assert (=> start!22172 (=> (not res!113760) (not e!150351))))

(declare-fun valid!1327 (LongMapFixedSize!3310) Bool)

(assert (=> start!22172 (= res!113760 (valid!1327 thiss!1504))))

(assert (=> start!22172 e!150351))

(declare-fun e!150347 () Bool)

(assert (=> start!22172 e!150347))

(assert (=> start!22172 true))

(declare-fun tp_is_empty!6097 () Bool)

(assert (=> start!22172 tp_is_empty!6097))

(declare-fun b!231583 () Bool)

(assert (=> b!231583 (= e!150342 e!150341)))

(declare-fun res!113757 () Bool)

(assert (=> b!231583 (= res!113757 call!21516)))

(assert (=> b!231583 (=> (not res!113757) (not e!150341))))

(declare-fun b!231584 () Bool)

(assert (=> b!231584 (= e!150351 e!150343)))

(declare-fun res!113759 () Bool)

(assert (=> b!231584 (=> (not res!113759) (not e!150343))))

(assert (=> b!231584 (= res!113759 (or (= lt!116690 (MissingZero!956 index!297)) (= lt!116690 (MissingVacant!956 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11431 (_ BitVec 32)) SeekEntryResult!956)

(assert (=> b!231584 (= lt!116690 (seekEntryOrOpen!0 key!932 (_keys!6367 thiss!1504) (mask!10219 thiss!1504)))))

(declare-fun b!231585 () Bool)

(assert (=> b!231585 (= e!150342 ((_ is Undefined!956) lt!116690))))

(declare-fun b!231586 () Bool)

(declare-fun e!150340 () Bool)

(assert (=> b!231586 (= e!150340 (not call!21515))))

(declare-fun bm!21513 () Bool)

(assert (=> bm!21513 (= call!21515 (arrayContainsKey!0 (_keys!6367 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10315 () Bool)

(assert (=> mapIsEmpty!10315 mapRes!10315))

(declare-fun b!231587 () Bool)

(declare-fun e!150339 () Bool)

(declare-fun e!150348 () Bool)

(assert (=> b!231587 (= e!150339 (and e!150348 mapRes!10315))))

(declare-fun condMapEmpty!10315 () Bool)

(declare-fun mapDefault!10315 () ValueCell!2705)

(assert (=> b!231587 (= condMapEmpty!10315 (= (arr!5433 (_values!4297 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2705)) mapDefault!10315)))))

(declare-fun b!231588 () Bool)

(declare-fun res!113755 () Bool)

(assert (=> b!231588 (=> (not res!113755) (not e!150340))))

(assert (=> b!231588 (= res!113755 (= (select (arr!5434 (_keys!6367 thiss!1504)) (index!5994 lt!116690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231589 () Bool)

(assert (=> b!231589 (= e!150344 tp_is_empty!6097)))

(declare-fun array_inv!3587 (array!11431) Bool)

(declare-fun array_inv!3588 (array!11429) Bool)

(assert (=> b!231590 (= e!150347 (and tp!21846 tp_is_empty!6097 (array_inv!3587 (_keys!6367 thiss!1504)) (array_inv!3588 (_values!4297 thiss!1504)) e!150339))))

(declare-fun b!231591 () Bool)

(declare-fun res!113762 () Bool)

(assert (=> b!231591 (=> (not res!113762) (not e!150340))))

(assert (=> b!231591 (= res!113762 call!21516)))

(assert (=> b!231591 (= e!150338 e!150340)))

(declare-fun b!231592 () Bool)

(assert (=> b!231592 (= e!150348 tp_is_empty!6097)))

(assert (= (and start!22172 res!113760) b!231581))

(assert (= (and b!231581 res!113761) b!231584))

(assert (= (and b!231584 res!113759) b!231579))

(assert (= (and b!231579 c!38480) b!231573))

(assert (= (and b!231579 (not c!38480)) b!231575))

(assert (= (and b!231575 c!38482) b!231591))

(assert (= (and b!231575 (not c!38482)) b!231578))

(assert (= (and b!231591 res!113762) b!231588))

(assert (= (and b!231588 res!113755) b!231586))

(assert (= (and b!231578 c!38481) b!231583))

(assert (= (and b!231578 (not c!38481)) b!231585))

(assert (= (and b!231583 res!113757) b!231582))

(assert (= (and b!231582 res!113758) b!231574))

(assert (= (or b!231591 b!231583) bm!21512))

(assert (= (or b!231586 b!231574) bm!21513))

(assert (= (and b!231579 res!113756) b!231576))

(assert (= (and b!231576 c!38479) b!231577))

(assert (= (and b!231576 (not c!38479)) b!231580))

(assert (= (and b!231587 condMapEmpty!10315) mapIsEmpty!10315))

(assert (= (and b!231587 (not condMapEmpty!10315)) mapNonEmpty!10315))

(assert (= (and mapNonEmpty!10315 ((_ is ValueCellFull!2705) mapValue!10315)) b!231589))

(assert (= (and b!231587 ((_ is ValueCellFull!2705) mapDefault!10315)) b!231592))

(assert (= b!231590 b!231587))

(assert (= start!22172 b!231590))

(declare-fun m!252505 () Bool)

(assert (=> b!231577 m!252505))

(declare-fun m!252507 () Bool)

(assert (=> bm!21513 m!252507))

(declare-fun m!252509 () Bool)

(assert (=> b!231582 m!252509))

(assert (=> b!231576 m!252507))

(declare-fun m!252511 () Bool)

(assert (=> b!231576 m!252511))

(declare-fun m!252513 () Bool)

(assert (=> b!231576 m!252513))

(declare-fun m!252515 () Bool)

(assert (=> b!231576 m!252515))

(declare-fun m!252517 () Bool)

(assert (=> b!231576 m!252517))

(declare-fun m!252519 () Bool)

(assert (=> b!231576 m!252519))

(declare-fun m!252521 () Bool)

(assert (=> b!231576 m!252521))

(declare-fun m!252523 () Bool)

(assert (=> b!231576 m!252523))

(declare-fun m!252525 () Bool)

(assert (=> b!231576 m!252525))

(declare-fun m!252527 () Bool)

(assert (=> b!231576 m!252527))

(declare-fun m!252529 () Bool)

(assert (=> b!231576 m!252529))

(declare-fun m!252531 () Bool)

(assert (=> b!231576 m!252531))

(declare-fun m!252533 () Bool)

(assert (=> b!231576 m!252533))

(declare-fun m!252535 () Bool)

(assert (=> b!231576 m!252535))

(declare-fun m!252537 () Bool)

(assert (=> b!231576 m!252537))

(declare-fun m!252539 () Bool)

(assert (=> b!231576 m!252539))

(declare-fun m!252541 () Bool)

(assert (=> b!231576 m!252541))

(declare-fun m!252543 () Bool)

(assert (=> mapNonEmpty!10315 m!252543))

(declare-fun m!252545 () Bool)

(assert (=> b!231579 m!252545))

(declare-fun m!252547 () Bool)

(assert (=> b!231579 m!252547))

(declare-fun m!252549 () Bool)

(assert (=> b!231579 m!252549))

(declare-fun m!252551 () Bool)

(assert (=> b!231590 m!252551))

(declare-fun m!252553 () Bool)

(assert (=> b!231590 m!252553))

(declare-fun m!252555 () Bool)

(assert (=> start!22172 m!252555))

(declare-fun m!252557 () Bool)

(assert (=> b!231588 m!252557))

(declare-fun m!252559 () Bool)

(assert (=> b!231573 m!252559))

(declare-fun m!252561 () Bool)

(assert (=> b!231575 m!252561))

(declare-fun m!252563 () Bool)

(assert (=> bm!21512 m!252563))

(declare-fun m!252565 () Bool)

(assert (=> b!231584 m!252565))

(check-sat (not b!231576) (not b!231575) (not b!231577) (not bm!21512) (not b_next!6235) (not mapNonEmpty!10315) (not start!22172) tp_is_empty!6097 (not b!231590) b_and!13107 (not b!231584) (not b!231579) (not bm!21513) (not b!231573))
(check-sat b_and!13107 (not b_next!6235))
