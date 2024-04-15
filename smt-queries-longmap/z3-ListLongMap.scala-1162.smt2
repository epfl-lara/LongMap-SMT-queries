; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24514 () Bool)

(assert start!24514)

(declare-fun b!256516 () Bool)

(declare-fun b_free!6721 () Bool)

(declare-fun b_next!6721 () Bool)

(assert (=> b!256516 (= b_free!6721 (not b_next!6721))))

(declare-fun tp!23465 () Bool)

(declare-fun b_and!13757 () Bool)

(assert (=> b!256516 (= tp!23465 b_and!13757)))

(declare-fun b!256512 () Bool)

(declare-fun res!125474 () Bool)

(declare-fun e!166280 () Bool)

(assert (=> b!256512 (=> (not res!125474) (not e!166280))))

(declare-datatypes ((V!8425 0))(
  ( (V!8426 (val!3336 Int)) )
))
(declare-datatypes ((ValueCell!2948 0))(
  ( (ValueCellFull!2948 (v!5419 V!8425)) (EmptyCell!2948) )
))
(declare-datatypes ((array!12499 0))(
  ( (array!12500 (arr!5919 (Array (_ BitVec 32) ValueCell!2948)) (size!6267 (_ BitVec 32))) )
))
(declare-datatypes ((array!12501 0))(
  ( (array!12502 (arr!5920 (Array (_ BitVec 32) (_ BitVec 64))) (size!6268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3796 0))(
  ( (LongMapFixedSize!3797 (defaultEntry!4736 Int) (mask!11013 (_ BitVec 32)) (extraKeys!4473 (_ BitVec 32)) (zeroValue!4577 V!8425) (minValue!4577 V!8425) (_size!1947 (_ BitVec 32)) (_keys!6899 array!12501) (_values!4719 array!12499) (_vacant!1947 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3796)

(declare-datatypes ((SeekEntryResult!1161 0))(
  ( (MissingZero!1161 (index!6814 (_ BitVec 32))) (Found!1161 (index!6815 (_ BitVec 32))) (Intermediate!1161 (undefined!1973 Bool) (index!6816 (_ BitVec 32)) (x!24974 (_ BitVec 32))) (Undefined!1161) (MissingVacant!1161 (index!6817 (_ BitVec 32))) )
))
(declare-fun lt!128734 () SeekEntryResult!1161)

(assert (=> b!256512 (= res!125474 (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6814 lt!128734)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256513 () Bool)

(declare-fun e!166281 () Bool)

(assert (=> b!256513 (= e!166281 (bvslt (size!6268 (_keys!6899 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256514 () Bool)

(declare-fun res!125470 () Bool)

(assert (=> b!256514 (=> (not res!125470) (not e!166280))))

(declare-fun call!24304 () Bool)

(assert (=> b!256514 (= res!125470 call!24304)))

(declare-fun e!166268 () Bool)

(assert (=> b!256514 (= e!166268 e!166280)))

(declare-fun b!256515 () Bool)

(declare-fun e!166282 () Bool)

(declare-fun e!166273 () Bool)

(assert (=> b!256515 (= e!166282 e!166273)))

(declare-fun res!125469 () Bool)

(assert (=> b!256515 (=> (not res!125469) (not e!166273))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256515 (= res!125469 (or (= lt!128734 (MissingZero!1161 index!297)) (= lt!128734 (MissingVacant!1161 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12501 (_ BitVec 32)) SeekEntryResult!1161)

(assert (=> b!256515 (= lt!128734 (seekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun tp_is_empty!6583 () Bool)

(declare-fun e!166276 () Bool)

(declare-fun e!166272 () Bool)

(declare-fun array_inv!3915 (array!12501) Bool)

(declare-fun array_inv!3916 (array!12499) Bool)

(assert (=> b!256516 (= e!166276 (and tp!23465 tp_is_empty!6583 (array_inv!3915 (_keys!6899 thiss!1504)) (array_inv!3916 (_values!4719 thiss!1504)) e!166272))))

(declare-fun b!256517 () Bool)

(declare-fun res!125475 () Bool)

(assert (=> b!256517 (=> (not res!125475) (not e!166282))))

(assert (=> b!256517 (= res!125475 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256518 () Bool)

(declare-fun e!166279 () Bool)

(assert (=> b!256518 (= e!166279 tp_is_empty!6583)))

(declare-fun b!256519 () Bool)

(declare-datatypes ((Unit!7929 0))(
  ( (Unit!7930) )
))
(declare-fun e!166274 () Unit!7929)

(declare-fun lt!128729 () Unit!7929)

(assert (=> b!256519 (= e!166274 lt!128729)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7929)

(assert (=> b!256519 (= lt!128729 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(declare-fun c!43369 () Bool)

(get-info :version)

(assert (=> b!256519 (= c!43369 ((_ is MissingZero!1161) lt!128734))))

(assert (=> b!256519 e!166268))

(declare-fun b!256520 () Bool)

(declare-fun Unit!7931 () Unit!7929)

(assert (=> b!256520 (= e!166274 Unit!7931)))

(declare-fun lt!128723 () Unit!7929)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7929)

(assert (=> b!256520 (= lt!128723 (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256520 false))

(declare-fun b!256521 () Bool)

(declare-fun call!24305 () Bool)

(assert (=> b!256521 (= e!166280 (not call!24305))))

(declare-fun bm!24301 () Bool)

(declare-fun arrayContainsKey!0 (array!12501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24301 (= call!24305 (arrayContainsKey!0 (_keys!6899 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256522 () Bool)

(declare-fun e!166277 () Bool)

(assert (=> b!256522 (= e!166273 e!166277)))

(declare-fun res!125467 () Bool)

(assert (=> b!256522 (=> (not res!125467) (not e!166277))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256522 (= res!125467 (inRange!0 index!297 (mask!11013 thiss!1504)))))

(declare-fun lt!128733 () Unit!7929)

(assert (=> b!256522 (= lt!128733 e!166274)))

(declare-fun c!43370 () Bool)

(declare-datatypes ((tuple2!4864 0))(
  ( (tuple2!4865 (_1!2443 (_ BitVec 64)) (_2!2443 V!8425)) )
))
(declare-datatypes ((List!3765 0))(
  ( (Nil!3762) (Cons!3761 (h!4423 tuple2!4864) (t!8813 List!3765)) )
))
(declare-datatypes ((ListLongMap!3767 0))(
  ( (ListLongMap!3768 (toList!1899 List!3765)) )
))
(declare-fun lt!128732 () ListLongMap!3767)

(declare-fun contains!1843 (ListLongMap!3767 (_ BitVec 64)) Bool)

(assert (=> b!256522 (= c!43370 (contains!1843 lt!128732 key!932))))

(declare-fun getCurrentListMap!1408 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) Int) ListLongMap!3767)

(assert (=> b!256522 (= lt!128732 (getCurrentListMap!1408 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256523 () Bool)

(declare-fun e!166278 () Bool)

(declare-fun e!166275 () Bool)

(assert (=> b!256523 (= e!166278 e!166275)))

(declare-fun res!125472 () Bool)

(assert (=> b!256523 (= res!125472 call!24304)))

(assert (=> b!256523 (=> (not res!125472) (not e!166275))))

(declare-fun b!256524 () Bool)

(declare-fun mapRes!11205 () Bool)

(assert (=> b!256524 (= e!166272 (and e!166279 mapRes!11205))))

(declare-fun condMapEmpty!11205 () Bool)

(declare-fun mapDefault!11205 () ValueCell!2948)

(assert (=> b!256524 (= condMapEmpty!11205 (= (arr!5919 (_values!4719 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2948)) mapDefault!11205)))))

(declare-fun b!256525 () Bool)

(assert (=> b!256525 (= e!166278 ((_ is Undefined!1161) lt!128734))))

(declare-fun b!256526 () Bool)

(assert (=> b!256526 (= e!166275 (not call!24305))))

(declare-fun mapNonEmpty!11205 () Bool)

(declare-fun tp!23466 () Bool)

(declare-fun e!166271 () Bool)

(assert (=> mapNonEmpty!11205 (= mapRes!11205 (and tp!23466 e!166271))))

(declare-fun mapKey!11205 () (_ BitVec 32))

(declare-fun mapRest!11205 () (Array (_ BitVec 32) ValueCell!2948))

(declare-fun mapValue!11205 () ValueCell!2948)

(assert (=> mapNonEmpty!11205 (= (arr!5919 (_values!4719 thiss!1504)) (store mapRest!11205 mapKey!11205 mapValue!11205))))

(declare-fun bm!24302 () Bool)

(assert (=> bm!24302 (= call!24304 (inRange!0 (ite c!43369 (index!6814 lt!128734) (index!6817 lt!128734)) (mask!11013 thiss!1504)))))

(declare-fun b!256527 () Bool)

(assert (=> b!256527 (= e!166277 (not e!166281))))

(declare-fun res!125466 () Bool)

(assert (=> b!256527 (=> (not res!125466) (not e!166281))))

(assert (=> b!256527 (= res!125466 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504)))))))

(declare-fun lt!128726 () array!12501)

(assert (=> b!256527 (arrayContainsKey!0 lt!128726 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!128725 () Unit!7929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12501 (_ BitVec 64) (_ BitVec 32)) Unit!7929)

(assert (=> b!256527 (= lt!128725 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128726 key!932 index!297))))

(declare-fun v!346 () V!8425)

(declare-fun +!689 (ListLongMap!3767 tuple2!4864) ListLongMap!3767)

(assert (=> b!256527 (= (+!689 lt!128732 (tuple2!4865 key!932 v!346)) (getCurrentListMap!1408 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128730 () Unit!7929)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!100 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) (_ BitVec 64) V!8425 Int) Unit!7929)

(assert (=> b!256527 (= lt!128730 (lemmaAddValidKeyToArrayThenAddPairToListMap!100 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12501 (_ BitVec 32)) Bool)

(assert (=> b!256527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128726 (mask!11013 thiss!1504))))

(declare-fun lt!128728 () Unit!7929)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12501 (_ BitVec 32) (_ BitVec 32)) Unit!7929)

(assert (=> b!256527 (= lt!128728 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) index!297 (mask!11013 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256527 (= (arrayCountValidKeys!0 lt!128726 #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6899 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504)))))))

(declare-fun lt!128735 () Unit!7929)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12501 (_ BitVec 32) (_ BitVec 64)) Unit!7929)

(assert (=> b!256527 (= lt!128735 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6899 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3766 0))(
  ( (Nil!3763) (Cons!3762 (h!4424 (_ BitVec 64)) (t!8814 List!3766)) )
))
(declare-fun arrayNoDuplicates!0 (array!12501 (_ BitVec 32) List!3766) Bool)

(assert (=> b!256527 (arrayNoDuplicates!0 lt!128726 #b00000000000000000000000000000000 Nil!3763)))

(assert (=> b!256527 (= lt!128726 (array!12502 (store (arr!5920 (_keys!6899 thiss!1504)) index!297 key!932) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun lt!128727 () Unit!7929)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3766) Unit!7929)

(assert (=> b!256527 (= lt!128727 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6899 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3763))))

(declare-fun lt!128724 () Unit!7929)

(declare-fun e!166269 () Unit!7929)

(assert (=> b!256527 (= lt!128724 e!166269)))

(declare-fun c!43372 () Bool)

(assert (=> b!256527 (= c!43372 (arrayContainsKey!0 (_keys!6899 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256528 () Bool)

(declare-fun Unit!7932 () Unit!7929)

(assert (=> b!256528 (= e!166269 Unit!7932)))

(declare-fun lt!128731 () Unit!7929)

(declare-fun lemmaArrayContainsKeyThenInListMap!237 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) (_ BitVec 32) Int) Unit!7929)

(assert (=> b!256528 (= lt!128731 (lemmaArrayContainsKeyThenInListMap!237 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256528 false))

(declare-fun b!256529 () Bool)

(declare-fun res!125468 () Bool)

(assert (=> b!256529 (=> (not res!125468) (not e!166281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256529 (= res!125468 (validKeyInArray!0 key!932))))

(declare-fun b!256530 () Bool)

(assert (=> b!256530 (= e!166271 tp_is_empty!6583)))

(declare-fun mapIsEmpty!11205 () Bool)

(assert (=> mapIsEmpty!11205 mapRes!11205))

(declare-fun b!256531 () Bool)

(declare-fun res!125471 () Bool)

(assert (=> b!256531 (= res!125471 (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6817 lt!128734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256531 (=> (not res!125471) (not e!166275))))

(declare-fun b!256532 () Bool)

(declare-fun c!43371 () Bool)

(assert (=> b!256532 (= c!43371 ((_ is MissingVacant!1161) lt!128734))))

(assert (=> b!256532 (= e!166268 e!166278)))

(declare-fun res!125473 () Bool)

(assert (=> start!24514 (=> (not res!125473) (not e!166282))))

(declare-fun valid!1487 (LongMapFixedSize!3796) Bool)

(assert (=> start!24514 (= res!125473 (valid!1487 thiss!1504))))

(assert (=> start!24514 e!166282))

(assert (=> start!24514 e!166276))

(assert (=> start!24514 true))

(assert (=> start!24514 tp_is_empty!6583))

(declare-fun b!256533 () Bool)

(declare-fun Unit!7933 () Unit!7929)

(assert (=> b!256533 (= e!166269 Unit!7933)))

(assert (= (and start!24514 res!125473) b!256517))

(assert (= (and b!256517 res!125475) b!256515))

(assert (= (and b!256515 res!125469) b!256522))

(assert (= (and b!256522 c!43370) b!256520))

(assert (= (and b!256522 (not c!43370)) b!256519))

(assert (= (and b!256519 c!43369) b!256514))

(assert (= (and b!256519 (not c!43369)) b!256532))

(assert (= (and b!256514 res!125470) b!256512))

(assert (= (and b!256512 res!125474) b!256521))

(assert (= (and b!256532 c!43371) b!256523))

(assert (= (and b!256532 (not c!43371)) b!256525))

(assert (= (and b!256523 res!125472) b!256531))

(assert (= (and b!256531 res!125471) b!256526))

(assert (= (or b!256514 b!256523) bm!24302))

(assert (= (or b!256521 b!256526) bm!24301))

(assert (= (and b!256522 res!125467) b!256527))

(assert (= (and b!256527 c!43372) b!256528))

(assert (= (and b!256527 (not c!43372)) b!256533))

(assert (= (and b!256527 res!125466) b!256529))

(assert (= (and b!256529 res!125468) b!256513))

(assert (= (and b!256524 condMapEmpty!11205) mapIsEmpty!11205))

(assert (= (and b!256524 (not condMapEmpty!11205)) mapNonEmpty!11205))

(assert (= (and mapNonEmpty!11205 ((_ is ValueCellFull!2948) mapValue!11205)) b!256530))

(assert (= (and b!256524 ((_ is ValueCellFull!2948) mapDefault!11205)) b!256518))

(assert (= b!256516 b!256524))

(assert (= start!24514 b!256516))

(declare-fun m!271399 () Bool)

(assert (=> b!256528 m!271399))

(declare-fun m!271401 () Bool)

(assert (=> b!256531 m!271401))

(declare-fun m!271403 () Bool)

(assert (=> bm!24301 m!271403))

(declare-fun m!271405 () Bool)

(assert (=> b!256515 m!271405))

(declare-fun m!271407 () Bool)

(assert (=> mapNonEmpty!11205 m!271407))

(declare-fun m!271409 () Bool)

(assert (=> b!256512 m!271409))

(declare-fun m!271411 () Bool)

(assert (=> b!256520 m!271411))

(declare-fun m!271413 () Bool)

(assert (=> b!256522 m!271413))

(declare-fun m!271415 () Bool)

(assert (=> b!256522 m!271415))

(declare-fun m!271417 () Bool)

(assert (=> b!256522 m!271417))

(declare-fun m!271419 () Bool)

(assert (=> b!256519 m!271419))

(declare-fun m!271421 () Bool)

(assert (=> start!24514 m!271421))

(declare-fun m!271423 () Bool)

(assert (=> b!256529 m!271423))

(declare-fun m!271425 () Bool)

(assert (=> b!256516 m!271425))

(declare-fun m!271427 () Bool)

(assert (=> b!256516 m!271427))

(assert (=> b!256527 m!271403))

(declare-fun m!271429 () Bool)

(assert (=> b!256527 m!271429))

(declare-fun m!271431 () Bool)

(assert (=> b!256527 m!271431))

(declare-fun m!271433 () Bool)

(assert (=> b!256527 m!271433))

(declare-fun m!271435 () Bool)

(assert (=> b!256527 m!271435))

(declare-fun m!271437 () Bool)

(assert (=> b!256527 m!271437))

(declare-fun m!271439 () Bool)

(assert (=> b!256527 m!271439))

(declare-fun m!271441 () Bool)

(assert (=> b!256527 m!271441))

(declare-fun m!271443 () Bool)

(assert (=> b!256527 m!271443))

(declare-fun m!271445 () Bool)

(assert (=> b!256527 m!271445))

(declare-fun m!271447 () Bool)

(assert (=> b!256527 m!271447))

(declare-fun m!271449 () Bool)

(assert (=> b!256527 m!271449))

(declare-fun m!271451 () Bool)

(assert (=> b!256527 m!271451))

(declare-fun m!271453 () Bool)

(assert (=> b!256527 m!271453))

(declare-fun m!271455 () Bool)

(assert (=> b!256527 m!271455))

(declare-fun m!271457 () Bool)

(assert (=> bm!24302 m!271457))

(check-sat (not b!256519) (not b!256529) (not b!256520) (not b!256527) (not b!256522) (not b!256515) (not b!256516) (not mapNonEmpty!11205) (not b!256528) b_and!13757 tp_is_empty!6583 (not b_next!6721) (not bm!24301) (not bm!24302) (not start!24514))
(check-sat b_and!13757 (not b_next!6721))
(get-model)

(declare-fun d!61569 () Bool)

(declare-fun lt!128822 () SeekEntryResult!1161)

(assert (=> d!61569 (and (or ((_ is Undefined!1161) lt!128822) (not ((_ is Found!1161) lt!128822)) (and (bvsge (index!6815 lt!128822) #b00000000000000000000000000000000) (bvslt (index!6815 lt!128822) (size!6268 (_keys!6899 thiss!1504))))) (or ((_ is Undefined!1161) lt!128822) ((_ is Found!1161) lt!128822) (not ((_ is MissingZero!1161) lt!128822)) (and (bvsge (index!6814 lt!128822) #b00000000000000000000000000000000) (bvslt (index!6814 lt!128822) (size!6268 (_keys!6899 thiss!1504))))) (or ((_ is Undefined!1161) lt!128822) ((_ is Found!1161) lt!128822) ((_ is MissingZero!1161) lt!128822) (not ((_ is MissingVacant!1161) lt!128822)) (and (bvsge (index!6817 lt!128822) #b00000000000000000000000000000000) (bvslt (index!6817 lt!128822) (size!6268 (_keys!6899 thiss!1504))))) (or ((_ is Undefined!1161) lt!128822) (ite ((_ is Found!1161) lt!128822) (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6815 lt!128822)) key!932) (ite ((_ is MissingZero!1161) lt!128822) (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6814 lt!128822)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1161) lt!128822) (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6817 lt!128822)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!166380 () SeekEntryResult!1161)

(assert (=> d!61569 (= lt!128822 e!166380)))

(declare-fun c!43404 () Bool)

(declare-fun lt!128821 () SeekEntryResult!1161)

(assert (=> d!61569 (= c!43404 (and ((_ is Intermediate!1161) lt!128821) (undefined!1973 lt!128821)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12501 (_ BitVec 32)) SeekEntryResult!1161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61569 (= lt!128821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11013 thiss!1504)) key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61569 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61569 (= (seekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)) lt!128822)))

(declare-fun b!256678 () Bool)

(declare-fun e!166381 () SeekEntryResult!1161)

(assert (=> b!256678 (= e!166380 e!166381)))

(declare-fun lt!128820 () (_ BitVec 64))

(assert (=> b!256678 (= lt!128820 (select (arr!5920 (_keys!6899 thiss!1504)) (index!6816 lt!128821)))))

(declare-fun c!43405 () Bool)

(assert (=> b!256678 (= c!43405 (= lt!128820 key!932))))

(declare-fun b!256679 () Bool)

(assert (=> b!256679 (= e!166380 Undefined!1161)))

(declare-fun b!256680 () Bool)

(assert (=> b!256680 (= e!166381 (Found!1161 (index!6816 lt!128821)))))

(declare-fun b!256681 () Bool)

(declare-fun e!166379 () SeekEntryResult!1161)

(assert (=> b!256681 (= e!166379 (MissingZero!1161 (index!6816 lt!128821)))))

(declare-fun b!256682 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12501 (_ BitVec 32)) SeekEntryResult!1161)

(assert (=> b!256682 (= e!166379 (seekKeyOrZeroReturnVacant!0 (x!24974 lt!128821) (index!6816 lt!128821) (index!6816 lt!128821) key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun b!256683 () Bool)

(declare-fun c!43403 () Bool)

(assert (=> b!256683 (= c!43403 (= lt!128820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256683 (= e!166381 e!166379)))

(assert (= (and d!61569 c!43404) b!256679))

(assert (= (and d!61569 (not c!43404)) b!256678))

(assert (= (and b!256678 c!43405) b!256680))

(assert (= (and b!256678 (not c!43405)) b!256683))

(assert (= (and b!256683 c!43403) b!256681))

(assert (= (and b!256683 (not c!43403)) b!256682))

(declare-fun m!271579 () Bool)

(assert (=> d!61569 m!271579))

(declare-fun m!271581 () Bool)

(assert (=> d!61569 m!271581))

(declare-fun m!271583 () Bool)

(assert (=> d!61569 m!271583))

(declare-fun m!271585 () Bool)

(assert (=> d!61569 m!271585))

(declare-fun m!271587 () Bool)

(assert (=> d!61569 m!271587))

(assert (=> d!61569 m!271581))

(declare-fun m!271589 () Bool)

(assert (=> d!61569 m!271589))

(declare-fun m!271591 () Bool)

(assert (=> b!256678 m!271591))

(declare-fun m!271593 () Bool)

(assert (=> b!256682 m!271593))

(assert (=> b!256515 d!61569))

(declare-fun d!61571 () Bool)

(declare-fun res!125542 () Bool)

(declare-fun e!166384 () Bool)

(assert (=> d!61571 (=> (not res!125542) (not e!166384))))

(declare-fun simpleValid!275 (LongMapFixedSize!3796) Bool)

(assert (=> d!61571 (= res!125542 (simpleValid!275 thiss!1504))))

(assert (=> d!61571 (= (valid!1487 thiss!1504) e!166384)))

(declare-fun b!256690 () Bool)

(declare-fun res!125543 () Bool)

(assert (=> b!256690 (=> (not res!125543) (not e!166384))))

(assert (=> b!256690 (= res!125543 (= (arrayCountValidKeys!0 (_keys!6899 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (_size!1947 thiss!1504)))))

(declare-fun b!256691 () Bool)

(declare-fun res!125544 () Bool)

(assert (=> b!256691 (=> (not res!125544) (not e!166384))))

(assert (=> b!256691 (= res!125544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun b!256692 () Bool)

(assert (=> b!256692 (= e!166384 (arrayNoDuplicates!0 (_keys!6899 thiss!1504) #b00000000000000000000000000000000 Nil!3763))))

(assert (= (and d!61571 res!125542) b!256690))

(assert (= (and b!256690 res!125543) b!256691))

(assert (= (and b!256691 res!125544) b!256692))

(declare-fun m!271595 () Bool)

(assert (=> d!61571 m!271595))

(assert (=> b!256690 m!271449))

(declare-fun m!271597 () Bool)

(assert (=> b!256691 m!271597))

(declare-fun m!271599 () Bool)

(assert (=> b!256692 m!271599))

(assert (=> start!24514 d!61571))

(declare-fun d!61573 () Bool)

(assert (=> d!61573 (= (array_inv!3915 (_keys!6899 thiss!1504)) (bvsge (size!6268 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256516 d!61573))

(declare-fun d!61575 () Bool)

(assert (=> d!61575 (= (array_inv!3916 (_values!4719 thiss!1504)) (bvsge (size!6267 (_values!4719 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256516 d!61575))

(declare-fun d!61577 () Bool)

(assert (=> d!61577 (contains!1843 (getCurrentListMap!1408 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) key!932)))

(declare-fun lt!128825 () Unit!7929)

(declare-fun choose!1239 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) (_ BitVec 32) Int) Unit!7929)

(assert (=> d!61577 (= lt!128825 (choose!1239 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61577 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61577 (= (lemmaArrayContainsKeyThenInListMap!237 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!128825)))

(declare-fun bs!9050 () Bool)

(assert (= bs!9050 d!61577))

(assert (=> bs!9050 m!271417))

(assert (=> bs!9050 m!271417))

(declare-fun m!271601 () Bool)

(assert (=> bs!9050 m!271601))

(declare-fun m!271603 () Bool)

(assert (=> bs!9050 m!271603))

(assert (=> bs!9050 m!271587))

(assert (=> b!256528 d!61577))

(declare-fun d!61579 () Bool)

(declare-fun e!166387 () Bool)

(assert (=> d!61579 e!166387))

(declare-fun res!125549 () Bool)

(assert (=> d!61579 (=> (not res!125549) (not e!166387))))

(declare-fun lt!128831 () SeekEntryResult!1161)

(assert (=> d!61579 (= res!125549 ((_ is Found!1161) lt!128831))))

(assert (=> d!61579 (= lt!128831 (seekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun lt!128830 () Unit!7929)

(declare-fun choose!1240 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7929)

(assert (=> d!61579 (= lt!128830 (choose!1240 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61579 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61579 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!427 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)) lt!128830)))

(declare-fun b!256697 () Bool)

(declare-fun res!125550 () Bool)

(assert (=> b!256697 (=> (not res!125550) (not e!166387))))

(assert (=> b!256697 (= res!125550 (inRange!0 (index!6815 lt!128831) (mask!11013 thiss!1504)))))

(declare-fun b!256698 () Bool)

(assert (=> b!256698 (= e!166387 (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6815 lt!128831)) key!932))))

(assert (=> b!256698 (and (bvsge (index!6815 lt!128831) #b00000000000000000000000000000000) (bvslt (index!6815 lt!128831) (size!6268 (_keys!6899 thiss!1504))))))

(assert (= (and d!61579 res!125549) b!256697))

(assert (= (and b!256697 res!125550) b!256698))

(assert (=> d!61579 m!271405))

(declare-fun m!271605 () Bool)

(assert (=> d!61579 m!271605))

(assert (=> d!61579 m!271587))

(declare-fun m!271607 () Bool)

(assert (=> b!256697 m!271607))

(declare-fun m!271609 () Bool)

(assert (=> b!256698 m!271609))

(assert (=> b!256520 d!61579))

(declare-fun e!166392 () Bool)

(declare-fun b!256710 () Bool)

(assert (=> b!256710 (= e!166392 (= (arrayCountValidKeys!0 (array!12502 (store (arr!5920 (_keys!6899 thiss!1504)) index!297 key!932) (size!6268 (_keys!6899 thiss!1504))) #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6899 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!256708 () Bool)

(declare-fun res!125560 () Bool)

(declare-fun e!166393 () Bool)

(assert (=> b!256708 (=> (not res!125560) (not e!166393))))

(assert (=> b!256708 (= res!125560 (validKeyInArray!0 key!932))))

(declare-fun b!256707 () Bool)

(declare-fun res!125559 () Bool)

(assert (=> b!256707 (=> (not res!125559) (not e!166393))))

(assert (=> b!256707 (= res!125559 (not (validKeyInArray!0 (select (arr!5920 (_keys!6899 thiss!1504)) index!297))))))

(declare-fun b!256709 () Bool)

(assert (=> b!256709 (= e!166393 (bvslt (size!6268 (_keys!6899 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61581 () Bool)

(assert (=> d!61581 e!166392))

(declare-fun res!125561 () Bool)

(assert (=> d!61581 (=> (not res!125561) (not e!166392))))

(assert (=> d!61581 (= res!125561 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504)))))))

(declare-fun lt!128834 () Unit!7929)

(declare-fun choose!1 (array!12501 (_ BitVec 32) (_ BitVec 64)) Unit!7929)

(assert (=> d!61581 (= lt!128834 (choose!1 (_keys!6899 thiss!1504) index!297 key!932))))

(assert (=> d!61581 e!166393))

(declare-fun res!125562 () Bool)

(assert (=> d!61581 (=> (not res!125562) (not e!166393))))

(assert (=> d!61581 (= res!125562 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504)))))))

(assert (=> d!61581 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6899 thiss!1504) index!297 key!932) lt!128834)))

(assert (= (and d!61581 res!125562) b!256707))

(assert (= (and b!256707 res!125559) b!256708))

(assert (= (and b!256708 res!125560) b!256709))

(assert (= (and d!61581 res!125561) b!256710))

(assert (=> b!256710 m!271439))

(declare-fun m!271611 () Bool)

(assert (=> b!256710 m!271611))

(assert (=> b!256710 m!271449))

(assert (=> b!256708 m!271423))

(declare-fun m!271613 () Bool)

(assert (=> b!256707 m!271613))

(assert (=> b!256707 m!271613))

(declare-fun m!271615 () Bool)

(assert (=> b!256707 m!271615))

(declare-fun m!271617 () Bool)

(assert (=> d!61581 m!271617))

(assert (=> b!256527 d!61581))

(declare-fun b!256719 () Bool)

(declare-fun e!166398 () (_ BitVec 32))

(declare-fun call!24320 () (_ BitVec 32))

(assert (=> b!256719 (= e!166398 call!24320)))

(declare-fun b!256720 () Bool)

(declare-fun e!166399 () (_ BitVec 32))

(assert (=> b!256720 (= e!166399 #b00000000000000000000000000000000)))

(declare-fun b!256721 () Bool)

(assert (=> b!256721 (= e!166398 (bvadd #b00000000000000000000000000000001 call!24320))))

(declare-fun d!61583 () Bool)

(declare-fun lt!128837 () (_ BitVec 32))

(assert (=> d!61583 (and (bvsge lt!128837 #b00000000000000000000000000000000) (bvsle lt!128837 (bvsub (size!6268 lt!128726) #b00000000000000000000000000000000)))))

(assert (=> d!61583 (= lt!128837 e!166399)))

(declare-fun c!43411 () Bool)

(assert (=> d!61583 (= c!43411 (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(assert (=> d!61583 (and (bvsle #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6268 (_keys!6899 thiss!1504)) (size!6268 lt!128726)))))

(assert (=> d!61583 (= (arrayCountValidKeys!0 lt!128726 #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) lt!128837)))

(declare-fun bm!24317 () Bool)

(assert (=> bm!24317 (= call!24320 (arrayCountValidKeys!0 lt!128726 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256722 () Bool)

(assert (=> b!256722 (= e!166399 e!166398)))

(declare-fun c!43410 () Bool)

(assert (=> b!256722 (= c!43410 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(assert (= (and d!61583 c!43411) b!256720))

(assert (= (and d!61583 (not c!43411)) b!256722))

(assert (= (and b!256722 c!43410) b!256721))

(assert (= (and b!256722 (not c!43410)) b!256719))

(assert (= (or b!256721 b!256719) bm!24317))

(declare-fun m!271619 () Bool)

(assert (=> bm!24317 m!271619))

(declare-fun m!271621 () Bool)

(assert (=> b!256722 m!271621))

(assert (=> b!256722 m!271621))

(declare-fun m!271623 () Bool)

(assert (=> b!256722 m!271623))

(assert (=> b!256527 d!61583))

(declare-fun b!256723 () Bool)

(declare-fun e!166400 () (_ BitVec 32))

(declare-fun call!24321 () (_ BitVec 32))

(assert (=> b!256723 (= e!166400 call!24321)))

(declare-fun b!256724 () Bool)

(declare-fun e!166401 () (_ BitVec 32))

(assert (=> b!256724 (= e!166401 #b00000000000000000000000000000000)))

(declare-fun b!256725 () Bool)

(assert (=> b!256725 (= e!166400 (bvadd #b00000000000000000000000000000001 call!24321))))

(declare-fun d!61585 () Bool)

(declare-fun lt!128838 () (_ BitVec 32))

(assert (=> d!61585 (and (bvsge lt!128838 #b00000000000000000000000000000000) (bvsle lt!128838 (bvsub (size!6268 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61585 (= lt!128838 e!166401)))

(declare-fun c!43413 () Bool)

(assert (=> d!61585 (= c!43413 (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(assert (=> d!61585 (and (bvsle #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6268 (_keys!6899 thiss!1504)) (size!6268 (_keys!6899 thiss!1504))))))

(assert (=> d!61585 (= (arrayCountValidKeys!0 (_keys!6899 thiss!1504) #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) lt!128838)))

(declare-fun bm!24318 () Bool)

(assert (=> bm!24318 (= call!24321 (arrayCountValidKeys!0 (_keys!6899 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256726 () Bool)

(assert (=> b!256726 (= e!166401 e!166400)))

(declare-fun c!43412 () Bool)

(assert (=> b!256726 (= c!43412 (validKeyInArray!0 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61585 c!43413) b!256724))

(assert (= (and d!61585 (not c!43413)) b!256726))

(assert (= (and b!256726 c!43412) b!256725))

(assert (= (and b!256726 (not c!43412)) b!256723))

(assert (= (or b!256725 b!256723) bm!24318))

(declare-fun m!271625 () Bool)

(assert (=> bm!24318 m!271625))

(declare-fun m!271627 () Bool)

(assert (=> b!256726 m!271627))

(assert (=> b!256726 m!271627))

(declare-fun m!271629 () Bool)

(assert (=> b!256726 m!271629))

(assert (=> b!256527 d!61585))

(declare-fun d!61587 () Bool)

(declare-fun e!166404 () Bool)

(assert (=> d!61587 e!166404))

(declare-fun res!125565 () Bool)

(assert (=> d!61587 (=> (not res!125565) (not e!166404))))

(assert (=> d!61587 (= res!125565 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504))) (bvslt index!297 (size!6267 (_values!4719 thiss!1504)))))))

(declare-fun lt!128841 () Unit!7929)

(declare-fun choose!1241 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) (_ BitVec 64) V!8425 Int) Unit!7929)

(assert (=> d!61587 (= lt!128841 (choose!1241 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61587 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61587 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!100 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) index!297 key!932 v!346 (defaultEntry!4736 thiss!1504)) lt!128841)))

(declare-fun b!256729 () Bool)

(assert (=> b!256729 (= e!166404 (= (+!689 (getCurrentListMap!1408 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) (tuple2!4865 key!932 v!346)) (getCurrentListMap!1408 (array!12502 (store (arr!5920 (_keys!6899 thiss!1504)) index!297 key!932) (size!6268 (_keys!6899 thiss!1504))) (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504))))))

(assert (= (and d!61587 res!125565) b!256729))

(declare-fun m!271631 () Bool)

(assert (=> d!61587 m!271631))

(assert (=> d!61587 m!271587))

(assert (=> b!256729 m!271417))

(assert (=> b!256729 m!271429))

(assert (=> b!256729 m!271439))

(assert (=> b!256729 m!271417))

(declare-fun m!271633 () Bool)

(assert (=> b!256729 m!271633))

(declare-fun m!271635 () Bool)

(assert (=> b!256729 m!271635))

(assert (=> b!256527 d!61587))

(declare-fun b!256738 () Bool)

(declare-fun e!166413 () Bool)

(declare-fun e!166411 () Bool)

(assert (=> b!256738 (= e!166413 e!166411)))

(declare-fun lt!128848 () (_ BitVec 64))

(assert (=> b!256738 (= lt!128848 (select (arr!5920 lt!128726) #b00000000000000000000000000000000))))

(declare-fun lt!128849 () Unit!7929)

(assert (=> b!256738 (= lt!128849 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128726 lt!128848 #b00000000000000000000000000000000))))

(assert (=> b!256738 (arrayContainsKey!0 lt!128726 lt!128848 #b00000000000000000000000000000000)))

(declare-fun lt!128850 () Unit!7929)

(assert (=> b!256738 (= lt!128850 lt!128849)))

(declare-fun res!125570 () Bool)

(assert (=> b!256738 (= res!125570 (= (seekEntryOrOpen!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000) lt!128726 (mask!11013 thiss!1504)) (Found!1161 #b00000000000000000000000000000000)))))

(assert (=> b!256738 (=> (not res!125570) (not e!166411))))

(declare-fun b!256739 () Bool)

(declare-fun call!24324 () Bool)

(assert (=> b!256739 (= e!166411 call!24324)))

(declare-fun b!256740 () Bool)

(declare-fun e!166412 () Bool)

(assert (=> b!256740 (= e!166412 e!166413)))

(declare-fun c!43416 () Bool)

(assert (=> b!256740 (= c!43416 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(declare-fun bm!24321 () Bool)

(assert (=> bm!24321 (= call!24324 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128726 (mask!11013 thiss!1504)))))

(declare-fun b!256741 () Bool)

(assert (=> b!256741 (= e!166413 call!24324)))

(declare-fun d!61589 () Bool)

(declare-fun res!125571 () Bool)

(assert (=> d!61589 (=> res!125571 e!166412)))

(assert (=> d!61589 (= res!125571 (bvsge #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(assert (=> d!61589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128726 (mask!11013 thiss!1504)) e!166412)))

(assert (= (and d!61589 (not res!125571)) b!256740))

(assert (= (and b!256740 c!43416) b!256738))

(assert (= (and b!256740 (not c!43416)) b!256741))

(assert (= (and b!256738 res!125570) b!256739))

(assert (= (or b!256739 b!256741) bm!24321))

(assert (=> b!256738 m!271621))

(declare-fun m!271637 () Bool)

(assert (=> b!256738 m!271637))

(declare-fun m!271639 () Bool)

(assert (=> b!256738 m!271639))

(assert (=> b!256738 m!271621))

(declare-fun m!271641 () Bool)

(assert (=> b!256738 m!271641))

(assert (=> b!256740 m!271621))

(assert (=> b!256740 m!271621))

(assert (=> b!256740 m!271623))

(declare-fun m!271643 () Bool)

(assert (=> bm!24321 m!271643))

(assert (=> b!256527 d!61589))

(declare-fun d!61591 () Bool)

(declare-fun res!125576 () Bool)

(declare-fun e!166418 () Bool)

(assert (=> d!61591 (=> res!125576 e!166418)))

(assert (=> d!61591 (= res!125576 (= (select (arr!5920 lt!128726) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61591 (= (arrayContainsKey!0 lt!128726 key!932 #b00000000000000000000000000000000) e!166418)))

(declare-fun b!256746 () Bool)

(declare-fun e!166419 () Bool)

(assert (=> b!256746 (= e!166418 e!166419)))

(declare-fun res!125577 () Bool)

(assert (=> b!256746 (=> (not res!125577) (not e!166419))))

(assert (=> b!256746 (= res!125577 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 lt!128726)))))

(declare-fun b!256747 () Bool)

(assert (=> b!256747 (= e!166419 (arrayContainsKey!0 lt!128726 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61591 (not res!125576)) b!256746))

(assert (= (and b!256746 res!125577) b!256747))

(assert (=> d!61591 m!271621))

(declare-fun m!271645 () Bool)

(assert (=> b!256747 m!271645))

(assert (=> b!256527 d!61591))

(declare-fun d!61593 () Bool)

(declare-fun e!166422 () Bool)

(assert (=> d!61593 e!166422))

(declare-fun res!125580 () Bool)

(assert (=> d!61593 (=> (not res!125580) (not e!166422))))

(assert (=> d!61593 (= res!125580 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504)))))))

(declare-fun lt!128853 () Unit!7929)

(declare-fun choose!41 (array!12501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3766) Unit!7929)

(assert (=> d!61593 (= lt!128853 (choose!41 (_keys!6899 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3763))))

(assert (=> d!61593 (bvslt (size!6268 (_keys!6899 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61593 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6899 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3763) lt!128853)))

(declare-fun b!256750 () Bool)

(assert (=> b!256750 (= e!166422 (arrayNoDuplicates!0 (array!12502 (store (arr!5920 (_keys!6899 thiss!1504)) index!297 key!932) (size!6268 (_keys!6899 thiss!1504))) #b00000000000000000000000000000000 Nil!3763))))

(assert (= (and d!61593 res!125580) b!256750))

(declare-fun m!271647 () Bool)

(assert (=> d!61593 m!271647))

(assert (=> b!256750 m!271439))

(declare-fun m!271649 () Bool)

(assert (=> b!256750 m!271649))

(assert (=> b!256527 d!61593))

(declare-fun d!61595 () Bool)

(declare-fun res!125581 () Bool)

(declare-fun e!166423 () Bool)

(assert (=> d!61595 (=> res!125581 e!166423)))

(assert (=> d!61595 (= res!125581 (= (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61595 (= (arrayContainsKey!0 (_keys!6899 thiss!1504) key!932 #b00000000000000000000000000000000) e!166423)))

(declare-fun b!256751 () Bool)

(declare-fun e!166424 () Bool)

(assert (=> b!256751 (= e!166423 e!166424)))

(declare-fun res!125582 () Bool)

(assert (=> b!256751 (=> (not res!125582) (not e!166424))))

(assert (=> b!256751 (= res!125582 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256752 () Bool)

(assert (=> b!256752 (= e!166424 (arrayContainsKey!0 (_keys!6899 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61595 (not res!125581)) b!256751))

(assert (= (and b!256751 res!125582) b!256752))

(assert (=> d!61595 m!271627))

(declare-fun m!271651 () Bool)

(assert (=> b!256752 m!271651))

(assert (=> b!256527 d!61595))

(declare-fun d!61597 () Bool)

(declare-fun e!166427 () Bool)

(assert (=> d!61597 e!166427))

(declare-fun res!125585 () Bool)

(assert (=> d!61597 (=> (not res!125585) (not e!166427))))

(assert (=> d!61597 (= res!125585 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6268 (_keys!6899 thiss!1504)))))))

(declare-fun lt!128856 () Unit!7929)

(declare-fun choose!102 ((_ BitVec 64) array!12501 (_ BitVec 32) (_ BitVec 32)) Unit!7929)

(assert (=> d!61597 (= lt!128856 (choose!102 key!932 (_keys!6899 thiss!1504) index!297 (mask!11013 thiss!1504)))))

(assert (=> d!61597 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61597 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) index!297 (mask!11013 thiss!1504)) lt!128856)))

(declare-fun b!256755 () Bool)

(assert (=> b!256755 (= e!166427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12502 (store (arr!5920 (_keys!6899 thiss!1504)) index!297 key!932) (size!6268 (_keys!6899 thiss!1504))) (mask!11013 thiss!1504)))))

(assert (= (and d!61597 res!125585) b!256755))

(declare-fun m!271653 () Bool)

(assert (=> d!61597 m!271653))

(assert (=> d!61597 m!271587))

(assert (=> b!256755 m!271439))

(declare-fun m!271655 () Bool)

(assert (=> b!256755 m!271655))

(assert (=> b!256527 d!61597))

(declare-fun d!61599 () Bool)

(declare-fun e!166430 () Bool)

(assert (=> d!61599 e!166430))

(declare-fun res!125591 () Bool)

(assert (=> d!61599 (=> (not res!125591) (not e!166430))))

(declare-fun lt!128868 () ListLongMap!3767)

(assert (=> d!61599 (= res!125591 (contains!1843 lt!128868 (_1!2443 (tuple2!4865 key!932 v!346))))))

(declare-fun lt!128865 () List!3765)

(assert (=> d!61599 (= lt!128868 (ListLongMap!3768 lt!128865))))

(declare-fun lt!128866 () Unit!7929)

(declare-fun lt!128867 () Unit!7929)

(assert (=> d!61599 (= lt!128866 lt!128867)))

(declare-datatypes ((Option!314 0))(
  ( (Some!313 (v!5424 V!8425)) (None!312) )
))
(declare-fun getValueByKey!308 (List!3765 (_ BitVec 64)) Option!314)

(assert (=> d!61599 (= (getValueByKey!308 lt!128865 (_1!2443 (tuple2!4865 key!932 v!346))) (Some!313 (_2!2443 (tuple2!4865 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!167 (List!3765 (_ BitVec 64) V!8425) Unit!7929)

(assert (=> d!61599 (= lt!128867 (lemmaContainsTupThenGetReturnValue!167 lt!128865 (_1!2443 (tuple2!4865 key!932 v!346)) (_2!2443 (tuple2!4865 key!932 v!346))))))

(declare-fun insertStrictlySorted!170 (List!3765 (_ BitVec 64) V!8425) List!3765)

(assert (=> d!61599 (= lt!128865 (insertStrictlySorted!170 (toList!1899 lt!128732) (_1!2443 (tuple2!4865 key!932 v!346)) (_2!2443 (tuple2!4865 key!932 v!346))))))

(assert (=> d!61599 (= (+!689 lt!128732 (tuple2!4865 key!932 v!346)) lt!128868)))

(declare-fun b!256760 () Bool)

(declare-fun res!125590 () Bool)

(assert (=> b!256760 (=> (not res!125590) (not e!166430))))

(assert (=> b!256760 (= res!125590 (= (getValueByKey!308 (toList!1899 lt!128868) (_1!2443 (tuple2!4865 key!932 v!346))) (Some!313 (_2!2443 (tuple2!4865 key!932 v!346)))))))

(declare-fun b!256761 () Bool)

(declare-fun contains!1846 (List!3765 tuple2!4864) Bool)

(assert (=> b!256761 (= e!166430 (contains!1846 (toList!1899 lt!128868) (tuple2!4865 key!932 v!346)))))

(assert (= (and d!61599 res!125591) b!256760))

(assert (= (and b!256760 res!125590) b!256761))

(declare-fun m!271657 () Bool)

(assert (=> d!61599 m!271657))

(declare-fun m!271659 () Bool)

(assert (=> d!61599 m!271659))

(declare-fun m!271661 () Bool)

(assert (=> d!61599 m!271661))

(declare-fun m!271663 () Bool)

(assert (=> d!61599 m!271663))

(declare-fun m!271665 () Bool)

(assert (=> b!256760 m!271665))

(declare-fun m!271667 () Bool)

(assert (=> b!256761 m!271667))

(assert (=> b!256527 d!61599))

(declare-fun d!61601 () Bool)

(assert (=> d!61601 (arrayContainsKey!0 lt!128726 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!128871 () Unit!7929)

(declare-fun choose!13 (array!12501 (_ BitVec 64) (_ BitVec 32)) Unit!7929)

(assert (=> d!61601 (= lt!128871 (choose!13 lt!128726 key!932 index!297))))

(assert (=> d!61601 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61601 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128726 key!932 index!297) lt!128871)))

(declare-fun bs!9051 () Bool)

(assert (= bs!9051 d!61601))

(assert (=> bs!9051 m!271437))

(declare-fun m!271669 () Bool)

(assert (=> bs!9051 m!271669))

(assert (=> b!256527 d!61601))

(declare-fun b!256772 () Bool)

(declare-fun e!166441 () Bool)

(declare-fun call!24327 () Bool)

(assert (=> b!256772 (= e!166441 call!24327)))

(declare-fun b!256773 () Bool)

(declare-fun e!166442 () Bool)

(assert (=> b!256773 (= e!166442 e!166441)))

(declare-fun c!43419 () Bool)

(assert (=> b!256773 (= c!43419 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(declare-fun bm!24324 () Bool)

(assert (=> bm!24324 (= call!24327 (arrayNoDuplicates!0 lt!128726 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43419 (Cons!3762 (select (arr!5920 lt!128726) #b00000000000000000000000000000000) Nil!3763) Nil!3763)))))

(declare-fun d!61603 () Bool)

(declare-fun res!125598 () Bool)

(declare-fun e!166439 () Bool)

(assert (=> d!61603 (=> res!125598 e!166439)))

(assert (=> d!61603 (= res!125598 (bvsge #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(assert (=> d!61603 (= (arrayNoDuplicates!0 lt!128726 #b00000000000000000000000000000000 Nil!3763) e!166439)))

(declare-fun b!256774 () Bool)

(assert (=> b!256774 (= e!166441 call!24327)))

(declare-fun b!256775 () Bool)

(assert (=> b!256775 (= e!166439 e!166442)))

(declare-fun res!125600 () Bool)

(assert (=> b!256775 (=> (not res!125600) (not e!166442))))

(declare-fun e!166440 () Bool)

(assert (=> b!256775 (= res!125600 (not e!166440))))

(declare-fun res!125599 () Bool)

(assert (=> b!256775 (=> (not res!125599) (not e!166440))))

(assert (=> b!256775 (= res!125599 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(declare-fun b!256776 () Bool)

(declare-fun contains!1847 (List!3766 (_ BitVec 64)) Bool)

(assert (=> b!256776 (= e!166440 (contains!1847 Nil!3763 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(assert (= (and d!61603 (not res!125598)) b!256775))

(assert (= (and b!256775 res!125599) b!256776))

(assert (= (and b!256775 res!125600) b!256773))

(assert (= (and b!256773 c!43419) b!256772))

(assert (= (and b!256773 (not c!43419)) b!256774))

(assert (= (or b!256772 b!256774) bm!24324))

(assert (=> b!256773 m!271621))

(assert (=> b!256773 m!271621))

(assert (=> b!256773 m!271623))

(assert (=> bm!24324 m!271621))

(declare-fun m!271671 () Bool)

(assert (=> bm!24324 m!271671))

(assert (=> b!256775 m!271621))

(assert (=> b!256775 m!271621))

(assert (=> b!256775 m!271623))

(assert (=> b!256776 m!271621))

(assert (=> b!256776 m!271621))

(declare-fun m!271673 () Bool)

(assert (=> b!256776 m!271673))

(assert (=> b!256527 d!61603))

(declare-fun bm!24339 () Bool)

(declare-fun call!24342 () ListLongMap!3767)

(declare-fun call!24344 () ListLongMap!3767)

(assert (=> bm!24339 (= call!24342 call!24344)))

(declare-fun b!256819 () Bool)

(declare-fun e!166476 () ListLongMap!3767)

(assert (=> b!256819 (= e!166476 call!24342)))

(declare-fun b!256820 () Bool)

(declare-fun res!125626 () Bool)

(declare-fun e!166469 () Bool)

(assert (=> b!256820 (=> (not res!125626) (not e!166469))))

(declare-fun e!166477 () Bool)

(assert (=> b!256820 (= res!125626 e!166477)))

(declare-fun c!43435 () Bool)

(assert (=> b!256820 (= c!43435 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24341 () Bool)

(declare-fun call!24346 () ListLongMap!3767)

(declare-fun call!24348 () ListLongMap!3767)

(assert (=> bm!24341 (= call!24346 call!24348)))

(declare-fun bm!24342 () Bool)

(declare-fun call!24343 () Bool)

(declare-fun lt!128927 () ListLongMap!3767)

(assert (=> bm!24342 (= call!24343 (contains!1843 lt!128927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256821 () Bool)

(declare-fun e!166479 () ListLongMap!3767)

(assert (=> b!256821 (= e!166479 (+!689 call!24344 (tuple2!4865 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504))))))

(declare-fun b!256822 () Bool)

(assert (=> b!256822 (= e!166476 call!24346)))

(declare-fun b!256823 () Bool)

(declare-fun res!125623 () Bool)

(assert (=> b!256823 (=> (not res!125623) (not e!166469))))

(declare-fun e!166471 () Bool)

(assert (=> b!256823 (= res!125623 e!166471)))

(declare-fun res!125621 () Bool)

(assert (=> b!256823 (=> res!125621 e!166471)))

(declare-fun e!166472 () Bool)

(assert (=> b!256823 (= res!125621 (not e!166472))))

(declare-fun res!125624 () Bool)

(assert (=> b!256823 (=> (not res!125624) (not e!166472))))

(assert (=> b!256823 (= res!125624 (bvslt #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(declare-fun b!256824 () Bool)

(declare-fun e!166473 () Bool)

(assert (=> b!256824 (= e!166473 (not call!24343))))

(declare-fun b!256825 () Bool)

(declare-fun e!166480 () Unit!7929)

(declare-fun Unit!7943 () Unit!7929)

(assert (=> b!256825 (= e!166480 Unit!7943)))

(declare-fun b!256826 () Bool)

(declare-fun e!166474 () Bool)

(declare-fun apply!252 (ListLongMap!3767 (_ BitVec 64)) V!8425)

(assert (=> b!256826 (= e!166474 (= (apply!252 lt!128927 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4577 thiss!1504)))))

(declare-fun b!256827 () Bool)

(declare-fun e!166475 () Bool)

(assert (=> b!256827 (= e!166471 e!166475)))

(declare-fun res!125619 () Bool)

(assert (=> b!256827 (=> (not res!125619) (not e!166475))))

(assert (=> b!256827 (= res!125619 (contains!1843 lt!128927 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(assert (=> b!256827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(declare-fun b!256828 () Bool)

(assert (=> b!256828 (= e!166472 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(declare-fun b!256829 () Bool)

(declare-fun e!166470 () ListLongMap!3767)

(assert (=> b!256829 (= e!166479 e!166470)))

(declare-fun c!43437 () Bool)

(assert (=> b!256829 (= c!43437 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256830 () Bool)

(declare-fun c!43434 () Bool)

(assert (=> b!256830 (= c!43434 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256830 (= e!166470 e!166476)))

(declare-fun b!256831 () Bool)

(assert (=> b!256831 (= e!166470 call!24342)))

(declare-fun b!256832 () Bool)

(declare-fun get!3041 (ValueCell!2948 V!8425) V!8425)

(declare-fun dynLambda!586 (Int (_ BitVec 64)) V!8425)

(assert (=> b!256832 (= e!166475 (= (apply!252 lt!128927 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)) (get!3041 (select (arr!5919 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!586 (defaultEntry!4736 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6267 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))))))))

(assert (=> b!256832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(declare-fun c!43433 () Bool)

(declare-fun bm!24343 () Bool)

(declare-fun call!24347 () ListLongMap!3767)

(assert (=> bm!24343 (= call!24344 (+!689 (ite c!43433 call!24347 (ite c!43437 call!24348 call!24346)) (ite (or c!43433 c!43437) (tuple2!4865 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4577 thiss!1504)) (tuple2!4865 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504)))))))

(declare-fun d!61605 () Bool)

(assert (=> d!61605 e!166469))

(declare-fun res!125622 () Bool)

(assert (=> d!61605 (=> (not res!125622) (not e!166469))))

(assert (=> d!61605 (= res!125622 (or (bvsge #b00000000000000000000000000000000 (size!6268 lt!128726)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 lt!128726)))))))

(declare-fun lt!128923 () ListLongMap!3767)

(assert (=> d!61605 (= lt!128927 lt!128923)))

(declare-fun lt!128930 () Unit!7929)

(assert (=> d!61605 (= lt!128930 e!166480)))

(declare-fun c!43432 () Bool)

(declare-fun e!166478 () Bool)

(assert (=> d!61605 (= c!43432 e!166478)))

(declare-fun res!125625 () Bool)

(assert (=> d!61605 (=> (not res!125625) (not e!166478))))

(assert (=> d!61605 (= res!125625 (bvslt #b00000000000000000000000000000000 (size!6268 lt!128726)))))

(assert (=> d!61605 (= lt!128923 e!166479)))

(assert (=> d!61605 (= c!43433 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61605 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61605 (= (getCurrentListMap!1408 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!128927)))

(declare-fun bm!24340 () Bool)

(declare-fun call!24345 () Bool)

(assert (=> bm!24340 (= call!24345 (contains!1843 lt!128927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24344 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!568 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) Int) ListLongMap!3767)

(assert (=> bm!24344 (= call!24347 (getCurrentListMapNoExtraKeys!568 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256833 () Bool)

(declare-fun lt!128934 () Unit!7929)

(assert (=> b!256833 (= e!166480 lt!128934)))

(declare-fun lt!128918 () ListLongMap!3767)

(assert (=> b!256833 (= lt!128918 (getCurrentListMapNoExtraKeys!568 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128924 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128925 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128925 (select (arr!5920 lt!128726) #b00000000000000000000000000000000))))

(declare-fun lt!128936 () Unit!7929)

(declare-fun addStillContains!228 (ListLongMap!3767 (_ BitVec 64) V!8425 (_ BitVec 64)) Unit!7929)

(assert (=> b!256833 (= lt!128936 (addStillContains!228 lt!128918 lt!128924 (zeroValue!4577 thiss!1504) lt!128925))))

(assert (=> b!256833 (contains!1843 (+!689 lt!128918 (tuple2!4865 lt!128924 (zeroValue!4577 thiss!1504))) lt!128925)))

(declare-fun lt!128933 () Unit!7929)

(assert (=> b!256833 (= lt!128933 lt!128936)))

(declare-fun lt!128916 () ListLongMap!3767)

(assert (=> b!256833 (= lt!128916 (getCurrentListMapNoExtraKeys!568 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128921 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128921 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128928 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128928 (select (arr!5920 lt!128726) #b00000000000000000000000000000000))))

(declare-fun lt!128917 () Unit!7929)

(declare-fun addApplyDifferent!228 (ListLongMap!3767 (_ BitVec 64) V!8425 (_ BitVec 64)) Unit!7929)

(assert (=> b!256833 (= lt!128917 (addApplyDifferent!228 lt!128916 lt!128921 (minValue!4577 thiss!1504) lt!128928))))

(assert (=> b!256833 (= (apply!252 (+!689 lt!128916 (tuple2!4865 lt!128921 (minValue!4577 thiss!1504))) lt!128928) (apply!252 lt!128916 lt!128928))))

(declare-fun lt!128926 () Unit!7929)

(assert (=> b!256833 (= lt!128926 lt!128917)))

(declare-fun lt!128937 () ListLongMap!3767)

(assert (=> b!256833 (= lt!128937 (getCurrentListMapNoExtraKeys!568 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128929 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128920 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128920 (select (arr!5920 lt!128726) #b00000000000000000000000000000000))))

(declare-fun lt!128932 () Unit!7929)

(assert (=> b!256833 (= lt!128932 (addApplyDifferent!228 lt!128937 lt!128929 (zeroValue!4577 thiss!1504) lt!128920))))

(assert (=> b!256833 (= (apply!252 (+!689 lt!128937 (tuple2!4865 lt!128929 (zeroValue!4577 thiss!1504))) lt!128920) (apply!252 lt!128937 lt!128920))))

(declare-fun lt!128919 () Unit!7929)

(assert (=> b!256833 (= lt!128919 lt!128932)))

(declare-fun lt!128922 () ListLongMap!3767)

(assert (=> b!256833 (= lt!128922 (getCurrentListMapNoExtraKeys!568 lt!128726 (array!12500 (store (arr!5919 (_values!4719 thiss!1504)) index!297 (ValueCellFull!2948 v!346)) (size!6267 (_values!4719 thiss!1504))) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128931 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128931 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128935 () (_ BitVec 64))

(assert (=> b!256833 (= lt!128935 (select (arr!5920 lt!128726) #b00000000000000000000000000000000))))

(assert (=> b!256833 (= lt!128934 (addApplyDifferent!228 lt!128922 lt!128931 (minValue!4577 thiss!1504) lt!128935))))

(assert (=> b!256833 (= (apply!252 (+!689 lt!128922 (tuple2!4865 lt!128931 (minValue!4577 thiss!1504))) lt!128935) (apply!252 lt!128922 lt!128935))))

(declare-fun b!256834 () Bool)

(declare-fun e!166481 () Bool)

(assert (=> b!256834 (= e!166481 (= (apply!252 lt!128927 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4577 thiss!1504)))))

(declare-fun bm!24345 () Bool)

(assert (=> bm!24345 (= call!24348 call!24347)))

(declare-fun b!256835 () Bool)

(assert (=> b!256835 (= e!166477 e!166474)))

(declare-fun res!125627 () Bool)

(assert (=> b!256835 (= res!125627 call!24345)))

(assert (=> b!256835 (=> (not res!125627) (not e!166474))))

(declare-fun b!256836 () Bool)

(assert (=> b!256836 (= e!166478 (validKeyInArray!0 (select (arr!5920 lt!128726) #b00000000000000000000000000000000)))))

(declare-fun b!256837 () Bool)

(assert (=> b!256837 (= e!166477 (not call!24345))))

(declare-fun b!256838 () Bool)

(assert (=> b!256838 (= e!166473 e!166481)))

(declare-fun res!125620 () Bool)

(assert (=> b!256838 (= res!125620 call!24343)))

(assert (=> b!256838 (=> (not res!125620) (not e!166481))))

(declare-fun b!256839 () Bool)

(assert (=> b!256839 (= e!166469 e!166473)))

(declare-fun c!43436 () Bool)

(assert (=> b!256839 (= c!43436 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61605 c!43433) b!256821))

(assert (= (and d!61605 (not c!43433)) b!256829))

(assert (= (and b!256829 c!43437) b!256831))

(assert (= (and b!256829 (not c!43437)) b!256830))

(assert (= (and b!256830 c!43434) b!256819))

(assert (= (and b!256830 (not c!43434)) b!256822))

(assert (= (or b!256819 b!256822) bm!24341))

(assert (= (or b!256831 bm!24341) bm!24345))

(assert (= (or b!256831 b!256819) bm!24339))

(assert (= (or b!256821 bm!24345) bm!24344))

(assert (= (or b!256821 bm!24339) bm!24343))

(assert (= (and d!61605 res!125625) b!256836))

(assert (= (and d!61605 c!43432) b!256833))

(assert (= (and d!61605 (not c!43432)) b!256825))

(assert (= (and d!61605 res!125622) b!256823))

(assert (= (and b!256823 res!125624) b!256828))

(assert (= (and b!256823 (not res!125621)) b!256827))

(assert (= (and b!256827 res!125619) b!256832))

(assert (= (and b!256823 res!125623) b!256820))

(assert (= (and b!256820 c!43435) b!256835))

(assert (= (and b!256820 (not c!43435)) b!256837))

(assert (= (and b!256835 res!125627) b!256826))

(assert (= (or b!256835 b!256837) bm!24340))

(assert (= (and b!256820 res!125626) b!256839))

(assert (= (and b!256839 c!43436) b!256838))

(assert (= (and b!256839 (not c!43436)) b!256824))

(assert (= (and b!256838 res!125620) b!256834))

(assert (= (or b!256838 b!256824) bm!24342))

(declare-fun b_lambda!8153 () Bool)

(assert (=> (not b_lambda!8153) (not b!256832)))

(declare-fun t!8820 () Bool)

(declare-fun tb!3009 () Bool)

(assert (=> (and b!256516 (= (defaultEntry!4736 thiss!1504) (defaultEntry!4736 thiss!1504)) t!8820) tb!3009))

(declare-fun result!5365 () Bool)

(assert (=> tb!3009 (= result!5365 tp_is_empty!6583)))

(assert (=> b!256832 t!8820))

(declare-fun b_and!13763 () Bool)

(assert (= b_and!13757 (and (=> t!8820 result!5365) b_and!13763)))

(assert (=> b!256832 m!271621))

(declare-fun m!271675 () Bool)

(assert (=> b!256832 m!271675))

(declare-fun m!271677 () Bool)

(assert (=> b!256832 m!271677))

(declare-fun m!271679 () Bool)

(assert (=> b!256832 m!271679))

(declare-fun m!271681 () Bool)

(assert (=> b!256832 m!271681))

(assert (=> b!256832 m!271621))

(assert (=> b!256832 m!271679))

(assert (=> b!256832 m!271677))

(assert (=> b!256828 m!271621))

(assert (=> b!256828 m!271621))

(assert (=> b!256828 m!271623))

(declare-fun m!271683 () Bool)

(assert (=> bm!24344 m!271683))

(declare-fun m!271685 () Bool)

(assert (=> b!256826 m!271685))

(assert (=> d!61605 m!271587))

(declare-fun m!271687 () Bool)

(assert (=> bm!24340 m!271687))

(declare-fun m!271689 () Bool)

(assert (=> b!256821 m!271689))

(assert (=> b!256836 m!271621))

(assert (=> b!256836 m!271621))

(assert (=> b!256836 m!271623))

(declare-fun m!271691 () Bool)

(assert (=> b!256833 m!271691))

(assert (=> b!256833 m!271683))

(declare-fun m!271693 () Bool)

(assert (=> b!256833 m!271693))

(declare-fun m!271695 () Bool)

(assert (=> b!256833 m!271695))

(declare-fun m!271697 () Bool)

(assert (=> b!256833 m!271697))

(declare-fun m!271699 () Bool)

(assert (=> b!256833 m!271699))

(declare-fun m!271701 () Bool)

(assert (=> b!256833 m!271701))

(assert (=> b!256833 m!271621))

(declare-fun m!271703 () Bool)

(assert (=> b!256833 m!271703))

(declare-fun m!271705 () Bool)

(assert (=> b!256833 m!271705))

(declare-fun m!271707 () Bool)

(assert (=> b!256833 m!271707))

(assert (=> b!256833 m!271699))

(declare-fun m!271709 () Bool)

(assert (=> b!256833 m!271709))

(assert (=> b!256833 m!271695))

(declare-fun m!271711 () Bool)

(assert (=> b!256833 m!271711))

(declare-fun m!271713 () Bool)

(assert (=> b!256833 m!271713))

(declare-fun m!271715 () Bool)

(assert (=> b!256833 m!271715))

(declare-fun m!271717 () Bool)

(assert (=> b!256833 m!271717))

(assert (=> b!256833 m!271709))

(declare-fun m!271719 () Bool)

(assert (=> b!256833 m!271719))

(assert (=> b!256833 m!271713))

(declare-fun m!271721 () Bool)

(assert (=> bm!24343 m!271721))

(declare-fun m!271723 () Bool)

(assert (=> b!256834 m!271723))

(declare-fun m!271725 () Bool)

(assert (=> bm!24342 m!271725))

(assert (=> b!256827 m!271621))

(assert (=> b!256827 m!271621))

(declare-fun m!271727 () Bool)

(assert (=> b!256827 m!271727))

(assert (=> b!256527 d!61605))

(declare-fun c!43443 () Bool)

(declare-fun lt!128943 () SeekEntryResult!1161)

(declare-fun bm!24350 () Bool)

(declare-fun call!24354 () Bool)

(assert (=> bm!24350 (= call!24354 (inRange!0 (ite c!43443 (index!6814 lt!128943) (index!6817 lt!128943)) (mask!11013 thiss!1504)))))

(declare-fun d!61607 () Bool)

(declare-fun e!166493 () Bool)

(assert (=> d!61607 e!166493))

(assert (=> d!61607 (= c!43443 ((_ is MissingZero!1161) lt!128943))))

(assert (=> d!61607 (= lt!128943 (seekEntryOrOpen!0 key!932 (_keys!6899 thiss!1504) (mask!11013 thiss!1504)))))

(declare-fun lt!128942 () Unit!7929)

(declare-fun choose!1242 (array!12501 array!12499 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7929)

(assert (=> d!61607 (= lt!128942 (choose!1242 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> d!61607 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61607 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!427 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)) lt!128942)))

(declare-fun b!256858 () Bool)

(declare-fun e!166490 () Bool)

(assert (=> b!256858 (= e!166493 e!166490)))

(declare-fun c!43442 () Bool)

(assert (=> b!256858 (= c!43442 ((_ is MissingVacant!1161) lt!128943))))

(declare-fun b!256859 () Bool)

(declare-fun e!166492 () Bool)

(declare-fun call!24353 () Bool)

(assert (=> b!256859 (= e!166492 (not call!24353))))

(declare-fun b!256860 () Bool)

(declare-fun e!166491 () Bool)

(assert (=> b!256860 (= e!166491 (not call!24353))))

(declare-fun b!256861 () Bool)

(assert (=> b!256861 (and (bvsge (index!6814 lt!128943) #b00000000000000000000000000000000) (bvslt (index!6814 lt!128943) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun res!125637 () Bool)

(assert (=> b!256861 (= res!125637 (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6814 lt!128943)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256861 (=> (not res!125637) (not e!166491))))

(declare-fun b!256862 () Bool)

(declare-fun res!125639 () Bool)

(assert (=> b!256862 (=> (not res!125639) (not e!166492))))

(assert (=> b!256862 (= res!125639 (= (select (arr!5920 (_keys!6899 thiss!1504)) (index!6817 lt!128943)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256862 (and (bvsge (index!6817 lt!128943) #b00000000000000000000000000000000) (bvslt (index!6817 lt!128943) (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256863 () Bool)

(assert (=> b!256863 (= e!166490 ((_ is Undefined!1161) lt!128943))))

(declare-fun b!256864 () Bool)

(assert (=> b!256864 (= e!166493 e!166491)))

(declare-fun res!125638 () Bool)

(assert (=> b!256864 (= res!125638 call!24354)))

(assert (=> b!256864 (=> (not res!125638) (not e!166491))))

(declare-fun b!256865 () Bool)

(declare-fun res!125636 () Bool)

(assert (=> b!256865 (=> (not res!125636) (not e!166492))))

(assert (=> b!256865 (= res!125636 call!24354)))

(assert (=> b!256865 (= e!166490 e!166492)))

(declare-fun bm!24351 () Bool)

(assert (=> bm!24351 (= call!24353 (arrayContainsKey!0 (_keys!6899 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!61607 c!43443) b!256864))

(assert (= (and d!61607 (not c!43443)) b!256858))

(assert (= (and b!256864 res!125638) b!256861))

(assert (= (and b!256861 res!125637) b!256860))

(assert (= (and b!256858 c!43442) b!256865))

(assert (= (and b!256858 (not c!43442)) b!256863))

(assert (= (and b!256865 res!125636) b!256862))

(assert (= (and b!256862 res!125639) b!256859))

(assert (= (or b!256864 b!256865) bm!24350))

(assert (= (or b!256860 b!256859) bm!24351))

(declare-fun m!271729 () Bool)

(assert (=> b!256861 m!271729))

(assert (=> bm!24351 m!271403))

(declare-fun m!271731 () Bool)

(assert (=> bm!24350 m!271731))

(declare-fun m!271733 () Bool)

(assert (=> b!256862 m!271733))

(assert (=> d!61607 m!271405))

(declare-fun m!271735 () Bool)

(assert (=> d!61607 m!271735))

(assert (=> d!61607 m!271587))

(assert (=> b!256519 d!61607))

(declare-fun d!61609 () Bool)

(assert (=> d!61609 (= (inRange!0 (ite c!43369 (index!6814 lt!128734) (index!6817 lt!128734)) (mask!11013 thiss!1504)) (and (bvsge (ite c!43369 (index!6814 lt!128734) (index!6817 lt!128734)) #b00000000000000000000000000000000) (bvslt (ite c!43369 (index!6814 lt!128734) (index!6817 lt!128734)) (bvadd (mask!11013 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24302 d!61609))

(declare-fun d!61611 () Bool)

(assert (=> d!61611 (= (inRange!0 index!297 (mask!11013 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11013 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256522 d!61611))

(declare-fun d!61613 () Bool)

(declare-fun e!166499 () Bool)

(assert (=> d!61613 e!166499))

(declare-fun res!125642 () Bool)

(assert (=> d!61613 (=> res!125642 e!166499)))

(declare-fun lt!128953 () Bool)

(assert (=> d!61613 (= res!125642 (not lt!128953))))

(declare-fun lt!128952 () Bool)

(assert (=> d!61613 (= lt!128953 lt!128952)))

(declare-fun lt!128955 () Unit!7929)

(declare-fun e!166498 () Unit!7929)

(assert (=> d!61613 (= lt!128955 e!166498)))

(declare-fun c!43446 () Bool)

(assert (=> d!61613 (= c!43446 lt!128952)))

(declare-fun containsKey!300 (List!3765 (_ BitVec 64)) Bool)

(assert (=> d!61613 (= lt!128952 (containsKey!300 (toList!1899 lt!128732) key!932))))

(assert (=> d!61613 (= (contains!1843 lt!128732 key!932) lt!128953)))

(declare-fun b!256872 () Bool)

(declare-fun lt!128954 () Unit!7929)

(assert (=> b!256872 (= e!166498 lt!128954)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!249 (List!3765 (_ BitVec 64)) Unit!7929)

(assert (=> b!256872 (= lt!128954 (lemmaContainsKeyImpliesGetValueByKeyDefined!249 (toList!1899 lt!128732) key!932))))

(declare-fun isDefined!250 (Option!314) Bool)

(assert (=> b!256872 (isDefined!250 (getValueByKey!308 (toList!1899 lt!128732) key!932))))

(declare-fun b!256873 () Bool)

(declare-fun Unit!7944 () Unit!7929)

(assert (=> b!256873 (= e!166498 Unit!7944)))

(declare-fun b!256874 () Bool)

(assert (=> b!256874 (= e!166499 (isDefined!250 (getValueByKey!308 (toList!1899 lt!128732) key!932)))))

(assert (= (and d!61613 c!43446) b!256872))

(assert (= (and d!61613 (not c!43446)) b!256873))

(assert (= (and d!61613 (not res!125642)) b!256874))

(declare-fun m!271737 () Bool)

(assert (=> d!61613 m!271737))

(declare-fun m!271739 () Bool)

(assert (=> b!256872 m!271739))

(declare-fun m!271741 () Bool)

(assert (=> b!256872 m!271741))

(assert (=> b!256872 m!271741))

(declare-fun m!271743 () Bool)

(assert (=> b!256872 m!271743))

(assert (=> b!256874 m!271741))

(assert (=> b!256874 m!271741))

(assert (=> b!256874 m!271743))

(assert (=> b!256522 d!61613))

(declare-fun bm!24352 () Bool)

(declare-fun call!24355 () ListLongMap!3767)

(declare-fun call!24357 () ListLongMap!3767)

(assert (=> bm!24352 (= call!24355 call!24357)))

(declare-fun b!256875 () Bool)

(declare-fun e!166507 () ListLongMap!3767)

(assert (=> b!256875 (= e!166507 call!24355)))

(declare-fun b!256876 () Bool)

(declare-fun res!125650 () Bool)

(declare-fun e!166500 () Bool)

(assert (=> b!256876 (=> (not res!125650) (not e!166500))))

(declare-fun e!166508 () Bool)

(assert (=> b!256876 (= res!125650 e!166508)))

(declare-fun c!43450 () Bool)

(assert (=> b!256876 (= c!43450 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24354 () Bool)

(declare-fun call!24359 () ListLongMap!3767)

(declare-fun call!24361 () ListLongMap!3767)

(assert (=> bm!24354 (= call!24359 call!24361)))

(declare-fun bm!24355 () Bool)

(declare-fun call!24356 () Bool)

(declare-fun lt!128967 () ListLongMap!3767)

(assert (=> bm!24355 (= call!24356 (contains!1843 lt!128967 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256877 () Bool)

(declare-fun e!166510 () ListLongMap!3767)

(assert (=> b!256877 (= e!166510 (+!689 call!24357 (tuple2!4865 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504))))))

(declare-fun b!256878 () Bool)

(assert (=> b!256878 (= e!166507 call!24359)))

(declare-fun b!256879 () Bool)

(declare-fun res!125647 () Bool)

(assert (=> b!256879 (=> (not res!125647) (not e!166500))))

(declare-fun e!166502 () Bool)

(assert (=> b!256879 (= res!125647 e!166502)))

(declare-fun res!125645 () Bool)

(assert (=> b!256879 (=> res!125645 e!166502)))

(declare-fun e!166503 () Bool)

(assert (=> b!256879 (= res!125645 (not e!166503))))

(declare-fun res!125648 () Bool)

(assert (=> b!256879 (=> (not res!125648) (not e!166503))))

(assert (=> b!256879 (= res!125648 (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256880 () Bool)

(declare-fun e!166504 () Bool)

(assert (=> b!256880 (= e!166504 (not call!24356))))

(declare-fun b!256881 () Bool)

(declare-fun e!166511 () Unit!7929)

(declare-fun Unit!7945 () Unit!7929)

(assert (=> b!256881 (= e!166511 Unit!7945)))

(declare-fun b!256882 () Bool)

(declare-fun e!166505 () Bool)

(assert (=> b!256882 (= e!166505 (= (apply!252 lt!128967 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4577 thiss!1504)))))

(declare-fun b!256883 () Bool)

(declare-fun e!166506 () Bool)

(assert (=> b!256883 (= e!166502 e!166506)))

(declare-fun res!125643 () Bool)

(assert (=> b!256883 (=> (not res!125643) (not e!166506))))

(assert (=> b!256883 (= res!125643 (contains!1843 lt!128967 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun b!256884 () Bool)

(assert (=> b!256884 (= e!166503 (validKeyInArray!0 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256885 () Bool)

(declare-fun e!166501 () ListLongMap!3767)

(assert (=> b!256885 (= e!166510 e!166501)))

(declare-fun c!43452 () Bool)

(assert (=> b!256885 (= c!43452 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256886 () Bool)

(declare-fun c!43449 () Bool)

(assert (=> b!256886 (= c!43449 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!256886 (= e!166501 e!166507)))

(declare-fun b!256887 () Bool)

(assert (=> b!256887 (= e!166501 call!24355)))

(declare-fun b!256888 () Bool)

(assert (=> b!256888 (= e!166506 (= (apply!252 lt!128967 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)) (get!3041 (select (arr!5919 (_values!4719 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!586 (defaultEntry!4736 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6267 (_values!4719 thiss!1504))))))

(assert (=> b!256888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(declare-fun c!43448 () Bool)

(declare-fun bm!24356 () Bool)

(declare-fun call!24360 () ListLongMap!3767)

(assert (=> bm!24356 (= call!24357 (+!689 (ite c!43448 call!24360 (ite c!43452 call!24361 call!24359)) (ite (or c!43448 c!43452) (tuple2!4865 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4577 thiss!1504)) (tuple2!4865 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4577 thiss!1504)))))))

(declare-fun d!61615 () Bool)

(assert (=> d!61615 e!166500))

(declare-fun res!125646 () Bool)

(assert (=> d!61615 (=> (not res!125646) (not e!166500))))

(assert (=> d!61615 (= res!125646 (or (bvsge #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))))

(declare-fun lt!128963 () ListLongMap!3767)

(assert (=> d!61615 (= lt!128967 lt!128963)))

(declare-fun lt!128970 () Unit!7929)

(assert (=> d!61615 (= lt!128970 e!166511)))

(declare-fun c!43447 () Bool)

(declare-fun e!166509 () Bool)

(assert (=> d!61615 (= c!43447 e!166509)))

(declare-fun res!125649 () Bool)

(assert (=> d!61615 (=> (not res!125649) (not e!166509))))

(assert (=> d!61615 (= res!125649 (bvslt #b00000000000000000000000000000000 (size!6268 (_keys!6899 thiss!1504))))))

(assert (=> d!61615 (= lt!128963 e!166510)))

(assert (=> d!61615 (= c!43448 (and (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61615 (validMask!0 (mask!11013 thiss!1504))))

(assert (=> d!61615 (= (getCurrentListMap!1408 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)) lt!128967)))

(declare-fun bm!24353 () Bool)

(declare-fun call!24358 () Bool)

(assert (=> bm!24353 (= call!24358 (contains!1843 lt!128967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24357 () Bool)

(assert (=> bm!24357 (= call!24360 (getCurrentListMapNoExtraKeys!568 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256889 () Bool)

(declare-fun lt!128974 () Unit!7929)

(assert (=> b!256889 (= e!166511 lt!128974)))

(declare-fun lt!128958 () ListLongMap!3767)

(assert (=> b!256889 (= lt!128958 (getCurrentListMapNoExtraKeys!568 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128964 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128965 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128965 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128976 () Unit!7929)

(assert (=> b!256889 (= lt!128976 (addStillContains!228 lt!128958 lt!128964 (zeroValue!4577 thiss!1504) lt!128965))))

(assert (=> b!256889 (contains!1843 (+!689 lt!128958 (tuple2!4865 lt!128964 (zeroValue!4577 thiss!1504))) lt!128965)))

(declare-fun lt!128973 () Unit!7929)

(assert (=> b!256889 (= lt!128973 lt!128976)))

(declare-fun lt!128956 () ListLongMap!3767)

(assert (=> b!256889 (= lt!128956 (getCurrentListMapNoExtraKeys!568 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128961 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128961 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128968 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128968 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128957 () Unit!7929)

(assert (=> b!256889 (= lt!128957 (addApplyDifferent!228 lt!128956 lt!128961 (minValue!4577 thiss!1504) lt!128968))))

(assert (=> b!256889 (= (apply!252 (+!689 lt!128956 (tuple2!4865 lt!128961 (minValue!4577 thiss!1504))) lt!128968) (apply!252 lt!128956 lt!128968))))

(declare-fun lt!128966 () Unit!7929)

(assert (=> b!256889 (= lt!128966 lt!128957)))

(declare-fun lt!128977 () ListLongMap!3767)

(assert (=> b!256889 (= lt!128977 (getCurrentListMapNoExtraKeys!568 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128969 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128960 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128960 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128972 () Unit!7929)

(assert (=> b!256889 (= lt!128972 (addApplyDifferent!228 lt!128977 lt!128969 (zeroValue!4577 thiss!1504) lt!128960))))

(assert (=> b!256889 (= (apply!252 (+!689 lt!128977 (tuple2!4865 lt!128969 (zeroValue!4577 thiss!1504))) lt!128960) (apply!252 lt!128977 lt!128960))))

(declare-fun lt!128959 () Unit!7929)

(assert (=> b!256889 (= lt!128959 lt!128972)))

(declare-fun lt!128962 () ListLongMap!3767)

(assert (=> b!256889 (= lt!128962 (getCurrentListMapNoExtraKeys!568 (_keys!6899 thiss!1504) (_values!4719 thiss!1504) (mask!11013 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun lt!128971 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128975 () (_ BitVec 64))

(assert (=> b!256889 (= lt!128975 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256889 (= lt!128974 (addApplyDifferent!228 lt!128962 lt!128971 (minValue!4577 thiss!1504) lt!128975))))

(assert (=> b!256889 (= (apply!252 (+!689 lt!128962 (tuple2!4865 lt!128971 (minValue!4577 thiss!1504))) lt!128975) (apply!252 lt!128962 lt!128975))))

(declare-fun b!256890 () Bool)

(declare-fun e!166512 () Bool)

(assert (=> b!256890 (= e!166512 (= (apply!252 lt!128967 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4577 thiss!1504)))))

(declare-fun bm!24358 () Bool)

(assert (=> bm!24358 (= call!24361 call!24360)))

(declare-fun b!256891 () Bool)

(assert (=> b!256891 (= e!166508 e!166505)))

(declare-fun res!125651 () Bool)

(assert (=> b!256891 (= res!125651 call!24358)))

(assert (=> b!256891 (=> (not res!125651) (not e!166505))))

(declare-fun b!256892 () Bool)

(assert (=> b!256892 (= e!166509 (validKeyInArray!0 (select (arr!5920 (_keys!6899 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256893 () Bool)

(assert (=> b!256893 (= e!166508 (not call!24358))))

(declare-fun b!256894 () Bool)

(assert (=> b!256894 (= e!166504 e!166512)))

(declare-fun res!125644 () Bool)

(assert (=> b!256894 (= res!125644 call!24356)))

(assert (=> b!256894 (=> (not res!125644) (not e!166512))))

(declare-fun b!256895 () Bool)

(assert (=> b!256895 (= e!166500 e!166504)))

(declare-fun c!43451 () Bool)

(assert (=> b!256895 (= c!43451 (not (= (bvand (extraKeys!4473 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61615 c!43448) b!256877))

(assert (= (and d!61615 (not c!43448)) b!256885))

(assert (= (and b!256885 c!43452) b!256887))

(assert (= (and b!256885 (not c!43452)) b!256886))

(assert (= (and b!256886 c!43449) b!256875))

(assert (= (and b!256886 (not c!43449)) b!256878))

(assert (= (or b!256875 b!256878) bm!24354))

(assert (= (or b!256887 bm!24354) bm!24358))

(assert (= (or b!256887 b!256875) bm!24352))

(assert (= (or b!256877 bm!24358) bm!24357))

(assert (= (or b!256877 bm!24352) bm!24356))

(assert (= (and d!61615 res!125649) b!256892))

(assert (= (and d!61615 c!43447) b!256889))

(assert (= (and d!61615 (not c!43447)) b!256881))

(assert (= (and d!61615 res!125646) b!256879))

(assert (= (and b!256879 res!125648) b!256884))

(assert (= (and b!256879 (not res!125645)) b!256883))

(assert (= (and b!256883 res!125643) b!256888))

(assert (= (and b!256879 res!125647) b!256876))

(assert (= (and b!256876 c!43450) b!256891))

(assert (= (and b!256876 (not c!43450)) b!256893))

(assert (= (and b!256891 res!125651) b!256882))

(assert (= (or b!256891 b!256893) bm!24353))

(assert (= (and b!256876 res!125650) b!256895))

(assert (= (and b!256895 c!43451) b!256894))

(assert (= (and b!256895 (not c!43451)) b!256880))

(assert (= (and b!256894 res!125644) b!256890))

(assert (= (or b!256894 b!256880) bm!24355))

(declare-fun b_lambda!8155 () Bool)

(assert (=> (not b_lambda!8155) (not b!256888)))

(assert (=> b!256888 t!8820))

(declare-fun b_and!13765 () Bool)

(assert (= b_and!13763 (and (=> t!8820 result!5365) b_and!13765)))

(assert (=> b!256888 m!271627))

(declare-fun m!271745 () Bool)

(assert (=> b!256888 m!271745))

(declare-fun m!271747 () Bool)

(assert (=> b!256888 m!271747))

(assert (=> b!256888 m!271679))

(declare-fun m!271749 () Bool)

(assert (=> b!256888 m!271749))

(assert (=> b!256888 m!271627))

(assert (=> b!256888 m!271679))

(assert (=> b!256888 m!271747))

(assert (=> b!256884 m!271627))

(assert (=> b!256884 m!271627))

(assert (=> b!256884 m!271629))

(declare-fun m!271751 () Bool)

(assert (=> bm!24357 m!271751))

(declare-fun m!271753 () Bool)

(assert (=> b!256882 m!271753))

(assert (=> d!61615 m!271587))

(declare-fun m!271755 () Bool)

(assert (=> bm!24353 m!271755))

(declare-fun m!271757 () Bool)

(assert (=> b!256877 m!271757))

(assert (=> b!256892 m!271627))

(assert (=> b!256892 m!271627))

(assert (=> b!256892 m!271629))

(declare-fun m!271759 () Bool)

(assert (=> b!256889 m!271759))

(assert (=> b!256889 m!271751))

(declare-fun m!271761 () Bool)

(assert (=> b!256889 m!271761))

(declare-fun m!271763 () Bool)

(assert (=> b!256889 m!271763))

(declare-fun m!271765 () Bool)

(assert (=> b!256889 m!271765))

(declare-fun m!271767 () Bool)

(assert (=> b!256889 m!271767))

(declare-fun m!271769 () Bool)

(assert (=> b!256889 m!271769))

(assert (=> b!256889 m!271627))

(declare-fun m!271771 () Bool)

(assert (=> b!256889 m!271771))

(declare-fun m!271773 () Bool)

(assert (=> b!256889 m!271773))

(declare-fun m!271775 () Bool)

(assert (=> b!256889 m!271775))

(assert (=> b!256889 m!271767))

(declare-fun m!271777 () Bool)

(assert (=> b!256889 m!271777))

(assert (=> b!256889 m!271763))

(declare-fun m!271779 () Bool)

(assert (=> b!256889 m!271779))

(declare-fun m!271781 () Bool)

(assert (=> b!256889 m!271781))

(declare-fun m!271783 () Bool)

(assert (=> b!256889 m!271783))

(declare-fun m!271785 () Bool)

(assert (=> b!256889 m!271785))

(assert (=> b!256889 m!271777))

(declare-fun m!271787 () Bool)

(assert (=> b!256889 m!271787))

(assert (=> b!256889 m!271781))

(declare-fun m!271789 () Bool)

(assert (=> bm!24356 m!271789))

(declare-fun m!271791 () Bool)

(assert (=> b!256890 m!271791))

(declare-fun m!271793 () Bool)

(assert (=> bm!24355 m!271793))

(assert (=> b!256883 m!271627))

(assert (=> b!256883 m!271627))

(declare-fun m!271795 () Bool)

(assert (=> b!256883 m!271795))

(assert (=> b!256522 d!61615))

(assert (=> bm!24301 d!61595))

(declare-fun d!61617 () Bool)

(assert (=> d!61617 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256529 d!61617))

(declare-fun b!256902 () Bool)

(declare-fun e!166517 () Bool)

(assert (=> b!256902 (= e!166517 tp_is_empty!6583)))

(declare-fun condMapEmpty!11214 () Bool)

(declare-fun mapDefault!11214 () ValueCell!2948)

(assert (=> mapNonEmpty!11205 (= condMapEmpty!11214 (= mapRest!11205 ((as const (Array (_ BitVec 32) ValueCell!2948)) mapDefault!11214)))))

(declare-fun e!166518 () Bool)

(declare-fun mapRes!11214 () Bool)

(assert (=> mapNonEmpty!11205 (= tp!23466 (and e!166518 mapRes!11214))))

(declare-fun mapNonEmpty!11214 () Bool)

(declare-fun tp!23481 () Bool)

(assert (=> mapNonEmpty!11214 (= mapRes!11214 (and tp!23481 e!166517))))

(declare-fun mapKey!11214 () (_ BitVec 32))

(declare-fun mapValue!11214 () ValueCell!2948)

(declare-fun mapRest!11214 () (Array (_ BitVec 32) ValueCell!2948))

(assert (=> mapNonEmpty!11214 (= mapRest!11205 (store mapRest!11214 mapKey!11214 mapValue!11214))))

(declare-fun b!256903 () Bool)

(assert (=> b!256903 (= e!166518 tp_is_empty!6583)))

(declare-fun mapIsEmpty!11214 () Bool)

(assert (=> mapIsEmpty!11214 mapRes!11214))

(assert (= (and mapNonEmpty!11205 condMapEmpty!11214) mapIsEmpty!11214))

(assert (= (and mapNonEmpty!11205 (not condMapEmpty!11214)) mapNonEmpty!11214))

(assert (= (and mapNonEmpty!11214 ((_ is ValueCellFull!2948) mapValue!11214)) b!256902))

(assert (= (and mapNonEmpty!11205 ((_ is ValueCellFull!2948) mapDefault!11214)) b!256903))

(declare-fun m!271797 () Bool)

(assert (=> mapNonEmpty!11214 m!271797))

(declare-fun b_lambda!8157 () Bool)

(assert (= b_lambda!8153 (or (and b!256516 b_free!6721) b_lambda!8157)))

(declare-fun b_lambda!8159 () Bool)

(assert (= b_lambda!8155 (or (and b!256516 b_free!6721) b_lambda!8159)))

(check-sat (not b!256691) (not b!256726) (not d!61597) (not b!256773) (not bm!24321) (not b_lambda!8159) (not b!256877) (not d!61607) (not b!256747) (not b!256755) (not b!256697) (not d!61601) (not d!61587) (not b!256833) (not bm!24343) (not b!256690) (not b!256729) (not b!256892) (not b!256874) (not b!256826) (not bm!24350) (not b!256775) (not d!61593) (not b!256776) (not b!256692) (not d!61615) (not b!256682) (not b!256708) (not bm!24318) (not bm!24353) tp_is_empty!6583 (not b_next!6721) (not d!61577) (not b!256828) (not bm!24357) (not b!256761) (not bm!24324) (not b!256827) (not b!256884) (not b!256707) (not b!256832) (not b!256834) (not b!256722) (not bm!24342) (not d!61599) (not b_lambda!8157) (not b!256740) (not b!256836) (not b!256883) (not d!61613) (not b!256752) (not b!256872) (not bm!24356) b_and!13765 (not bm!24340) (not b!256882) (not bm!24355) (not d!61569) (not bm!24351) (not bm!24344) (not d!61581) (not b!256821) (not d!61579) (not mapNonEmpty!11214) (not b!256889) (not b!256760) (not bm!24317) (not d!61571) (not b!256888) (not b!256890) (not b!256738) (not b!256750) (not d!61605) (not b!256710))
(check-sat b_and!13765 (not b_next!6721))
