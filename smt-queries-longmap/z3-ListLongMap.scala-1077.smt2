; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22148 () Bool)

(assert start!22148)

(declare-fun b!231066 () Bool)

(declare-fun b_free!6211 () Bool)

(declare-fun b_next!6211 () Bool)

(assert (=> b!231066 (= b_free!6211 (not b_next!6211))))

(declare-fun tp!21774 () Bool)

(declare-fun b_and!13123 () Bool)

(assert (=> b!231066 (= tp!21774 b_and!13123)))

(declare-fun b!231047 () Bool)

(declare-fun e!149964 () Bool)

(declare-fun e!149968 () Bool)

(assert (=> b!231047 (= e!149964 e!149968)))

(declare-fun res!113584 () Bool)

(declare-fun call!21455 () Bool)

(assert (=> b!231047 (= res!113584 call!21455)))

(assert (=> b!231047 (=> (not res!113584) (not e!149968))))

(declare-fun b!231048 () Bool)

(declare-fun res!113583 () Bool)

(declare-fun e!149971 () Bool)

(assert (=> b!231048 (=> (not res!113583) (not e!149971))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!231048 (= res!113583 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231049 () Bool)

(declare-fun e!149967 () Bool)

(declare-fun e!149965 () Bool)

(declare-fun mapRes!10279 () Bool)

(assert (=> b!231049 (= e!149967 (and e!149965 mapRes!10279))))

(declare-fun condMapEmpty!10279 () Bool)

(declare-datatypes ((V!7745 0))(
  ( (V!7746 (val!3081 Int)) )
))
(declare-datatypes ((ValueCell!2693 0))(
  ( (ValueCellFull!2693 (v!5102 V!7745)) (EmptyCell!2693) )
))
(declare-datatypes ((array!11387 0))(
  ( (array!11388 (arr!5413 (Array (_ BitVec 32) ValueCell!2693)) (size!5746 (_ BitVec 32))) )
))
(declare-datatypes ((array!11389 0))(
  ( (array!11390 (arr!5414 (Array (_ BitVec 32) (_ BitVec 64))) (size!5747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3286 0))(
  ( (LongMapFixedSize!3287 (defaultEntry!4302 Int) (mask!10200 (_ BitVec 32)) (extraKeys!4039 (_ BitVec 32)) (zeroValue!4143 V!7745) (minValue!4143 V!7745) (_size!1692 (_ BitVec 32)) (_keys!6356 array!11389) (_values!4285 array!11387) (_vacant!1692 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3286)

(declare-fun mapDefault!10279 () ValueCell!2693)

(assert (=> b!231049 (= condMapEmpty!10279 (= (arr!5413 (_values!4285 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2693)) mapDefault!10279)))))

(declare-fun b!231050 () Bool)

(declare-datatypes ((Unit!7075 0))(
  ( (Unit!7076) )
))
(declare-fun e!149962 () Unit!7075)

(declare-fun Unit!7077 () Unit!7075)

(assert (=> b!231050 (= e!149962 Unit!7077)))

(declare-fun lt!116422 () Unit!7075)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (array!11389 array!11387 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) Int) Unit!7075)

(assert (=> b!231050 (= lt!116422 (lemmaInListMapThenSeekEntryOrOpenFindsIt!300 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!231050 false))

(declare-fun b!231051 () Bool)

(declare-fun res!113589 () Bool)

(declare-fun e!149966 () Bool)

(assert (=> b!231051 (=> (not res!113589) (not e!149966))))

(assert (=> b!231051 (= res!113589 call!21455)))

(declare-fun e!149963 () Bool)

(assert (=> b!231051 (= e!149963 e!149966)))

(declare-fun b!231052 () Bool)

(declare-fun call!21456 () Bool)

(assert (=> b!231052 (= e!149968 (not call!21456))))

(declare-fun b!231053 () Bool)

(declare-fun res!113585 () Bool)

(declare-datatypes ((SeekEntryResult!912 0))(
  ( (MissingZero!912 (index!5818 (_ BitVec 32))) (Found!912 (index!5819 (_ BitVec 32))) (Intermediate!912 (undefined!1724 Bool) (index!5820 (_ BitVec 32)) (x!23444 (_ BitVec 32))) (Undefined!912) (MissingVacant!912 (index!5821 (_ BitVec 32))) )
))
(declare-fun lt!116421 () SeekEntryResult!912)

(assert (=> b!231053 (= res!113585 (= (select (arr!5414 (_keys!6356 thiss!1504)) (index!5821 lt!116421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231053 (=> (not res!113585) (not e!149968))))

(declare-fun bm!21452 () Bool)

(declare-fun c!38377 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21452 (= call!21455 (inRange!0 (ite c!38377 (index!5818 lt!116421) (index!5821 lt!116421)) (mask!10200 thiss!1504)))))

(declare-fun b!231054 () Bool)

(declare-fun tp_is_empty!6073 () Bool)

(assert (=> b!231054 (= e!149965 tp_is_empty!6073)))

(declare-fun b!231055 () Bool)

(declare-fun lt!116431 () Unit!7075)

(assert (=> b!231055 (= e!149962 lt!116431)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!293 (array!11389 array!11387 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) Int) Unit!7075)

(assert (=> b!231055 (= lt!116431 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!293 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 (defaultEntry!4302 thiss!1504)))))

(get-info :version)

(assert (=> b!231055 (= c!38377 ((_ is MissingZero!912) lt!116421))))

(assert (=> b!231055 e!149963))

(declare-fun b!231056 () Bool)

(declare-fun e!149961 () Bool)

(declare-fun e!149969 () Bool)

(assert (=> b!231056 (= e!149961 e!149969)))

(declare-fun res!113588 () Bool)

(assert (=> b!231056 (=> (not res!113588) (not e!149969))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231056 (= res!113588 (inRange!0 index!297 (mask!10200 thiss!1504)))))

(declare-fun lt!116424 () Unit!7075)

(assert (=> b!231056 (= lt!116424 e!149962)))

(declare-fun c!38375 () Bool)

(declare-datatypes ((tuple2!4470 0))(
  ( (tuple2!4471 (_1!2246 (_ BitVec 64)) (_2!2246 V!7745)) )
))
(declare-datatypes ((List!3383 0))(
  ( (Nil!3380) (Cons!3379 (h!4027 tuple2!4470) (t!8334 List!3383)) )
))
(declare-datatypes ((ListLongMap!3385 0))(
  ( (ListLongMap!3386 (toList!1708 List!3383)) )
))
(declare-fun lt!116430 () ListLongMap!3385)

(declare-fun contains!1596 (ListLongMap!3385 (_ BitVec 64)) Bool)

(assert (=> b!231056 (= c!38375 (contains!1596 lt!116430 key!932))))

(declare-fun getCurrentListMap!1240 (array!11389 array!11387 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) Int) ListLongMap!3385)

(assert (=> b!231056 (= lt!116430 (getCurrentListMap!1240 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun b!231058 () Bool)

(assert (=> b!231058 (= e!149971 e!149961)))

(declare-fun res!113586 () Bool)

(assert (=> b!231058 (=> (not res!113586) (not e!149961))))

(assert (=> b!231058 (= res!113586 (or (= lt!116421 (MissingZero!912 index!297)) (= lt!116421 (MissingVacant!912 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11389 (_ BitVec 32)) SeekEntryResult!912)

(assert (=> b!231058 (= lt!116421 (seekEntryOrOpen!0 key!932 (_keys!6356 thiss!1504) (mask!10200 thiss!1504)))))

(declare-fun b!231059 () Bool)

(declare-fun res!113587 () Bool)

(assert (=> b!231059 (=> (not res!113587) (not e!149966))))

(assert (=> b!231059 (= res!113587 (= (select (arr!5414 (_keys!6356 thiss!1504)) (index!5818 lt!116421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231060 () Bool)

(assert (=> b!231060 (= e!149964 ((_ is Undefined!912) lt!116421))))

(declare-fun b!231061 () Bool)

(assert (=> b!231061 (= e!149966 (not call!21456))))

(declare-fun mapIsEmpty!10279 () Bool)

(assert (=> mapIsEmpty!10279 mapRes!10279))

(declare-fun b!231062 () Bool)

(declare-fun c!38376 () Bool)

(assert (=> b!231062 (= c!38376 ((_ is MissingVacant!912) lt!116421))))

(assert (=> b!231062 (= e!149963 e!149964)))

(declare-fun b!231063 () Bool)

(declare-fun e!149970 () Bool)

(assert (=> b!231063 (= e!149970 tp_is_empty!6073)))

(declare-fun b!231064 () Bool)

(declare-fun e!149960 () Unit!7075)

(declare-fun Unit!7078 () Unit!7075)

(assert (=> b!231064 (= e!149960 Unit!7078)))

(declare-fun lt!116428 () Unit!7075)

(declare-fun lemmaArrayContainsKeyThenInListMap!137 (array!11389 array!11387 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) (_ BitVec 32) Int) Unit!7075)

(assert (=> b!231064 (= lt!116428 (lemmaArrayContainsKeyThenInListMap!137 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!231064 false))

(declare-fun bm!21453 () Bool)

(declare-fun arrayContainsKey!0 (array!11389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21453 (= call!21456 (arrayContainsKey!0 (_keys!6356 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10279 () Bool)

(declare-fun tp!21775 () Bool)

(assert (=> mapNonEmpty!10279 (= mapRes!10279 (and tp!21775 e!149970))))

(declare-fun mapRest!10279 () (Array (_ BitVec 32) ValueCell!2693))

(declare-fun mapValue!10279 () ValueCell!2693)

(declare-fun mapKey!10279 () (_ BitVec 32))

(assert (=> mapNonEmpty!10279 (= (arr!5413 (_values!4285 thiss!1504)) (store mapRest!10279 mapKey!10279 mapValue!10279))))

(declare-fun b!231065 () Bool)

(declare-fun Unit!7079 () Unit!7075)

(assert (=> b!231065 (= e!149960 Unit!7079)))

(declare-fun e!149972 () Bool)

(declare-fun array_inv!3553 (array!11389) Bool)

(declare-fun array_inv!3554 (array!11387) Bool)

(assert (=> b!231066 (= e!149972 (and tp!21774 tp_is_empty!6073 (array_inv!3553 (_keys!6356 thiss!1504)) (array_inv!3554 (_values!4285 thiss!1504)) e!149967))))

(declare-fun b!231057 () Bool)

(assert (=> b!231057 (= e!149969 (not true))))

(declare-fun lt!116427 () array!11389)

(declare-fun arrayCountValidKeys!0 (array!11389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231057 (= (arrayCountValidKeys!0 lt!116427 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116419 () Unit!7075)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11389 (_ BitVec 32)) Unit!7075)

(assert (=> b!231057 (= lt!116419 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116427 index!297))))

(assert (=> b!231057 (arrayContainsKey!0 lt!116427 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116426 () Unit!7075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11389 (_ BitVec 64) (_ BitVec 32)) Unit!7075)

(assert (=> b!231057 (= lt!116426 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116427 key!932 index!297))))

(declare-fun v!346 () V!7745)

(declare-fun +!607 (ListLongMap!3385 tuple2!4470) ListLongMap!3385)

(assert (=> b!231057 (= (+!607 lt!116430 (tuple2!4471 key!932 v!346)) (getCurrentListMap!1240 lt!116427 (array!11388 (store (arr!5413 (_values!4285 thiss!1504)) index!297 (ValueCellFull!2693 v!346)) (size!5746 (_values!4285 thiss!1504))) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun lt!116420 () Unit!7075)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!66 (array!11389 array!11387 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) (_ BitVec 64) V!7745 Int) Unit!7075)

(assert (=> b!231057 (= lt!116420 (lemmaAddValidKeyToArrayThenAddPairToListMap!66 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) index!297 key!932 v!346 (defaultEntry!4302 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11389 (_ BitVec 32)) Bool)

(assert (=> b!231057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116427 (mask!10200 thiss!1504))))

(declare-fun lt!116429 () Unit!7075)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11389 (_ BitVec 32) (_ BitVec 32)) Unit!7075)

(assert (=> b!231057 (= lt!116429 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6356 thiss!1504) index!297 (mask!10200 thiss!1504)))))

(assert (=> b!231057 (= (arrayCountValidKeys!0 lt!116427 #b00000000000000000000000000000000 (size!5747 (_keys!6356 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6356 thiss!1504) #b00000000000000000000000000000000 (size!5747 (_keys!6356 thiss!1504)))))))

(declare-fun lt!116418 () Unit!7075)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11389 (_ BitVec 32) (_ BitVec 64)) Unit!7075)

(assert (=> b!231057 (= lt!116418 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6356 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3384 0))(
  ( (Nil!3381) (Cons!3380 (h!4028 (_ BitVec 64)) (t!8335 List!3384)) )
))
(declare-fun arrayNoDuplicates!0 (array!11389 (_ BitVec 32) List!3384) Bool)

(assert (=> b!231057 (arrayNoDuplicates!0 lt!116427 #b00000000000000000000000000000000 Nil!3381)))

(assert (=> b!231057 (= lt!116427 (array!11390 (store (arr!5414 (_keys!6356 thiss!1504)) index!297 key!932) (size!5747 (_keys!6356 thiss!1504))))))

(declare-fun lt!116425 () Unit!7075)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3384) Unit!7075)

(assert (=> b!231057 (= lt!116425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6356 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3381))))

(declare-fun lt!116423 () Unit!7075)

(assert (=> b!231057 (= lt!116423 e!149960)))

(declare-fun c!38374 () Bool)

(assert (=> b!231057 (= c!38374 (arrayContainsKey!0 (_keys!6356 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113590 () Bool)

(assert (=> start!22148 (=> (not res!113590) (not e!149971))))

(declare-fun valid!1320 (LongMapFixedSize!3286) Bool)

(assert (=> start!22148 (= res!113590 (valid!1320 thiss!1504))))

(assert (=> start!22148 e!149971))

(assert (=> start!22148 e!149972))

(assert (=> start!22148 true))

(assert (=> start!22148 tp_is_empty!6073))

(assert (= (and start!22148 res!113590) b!231048))

(assert (= (and b!231048 res!113583) b!231058))

(assert (= (and b!231058 res!113586) b!231056))

(assert (= (and b!231056 c!38375) b!231050))

(assert (= (and b!231056 (not c!38375)) b!231055))

(assert (= (and b!231055 c!38377) b!231051))

(assert (= (and b!231055 (not c!38377)) b!231062))

(assert (= (and b!231051 res!113589) b!231059))

(assert (= (and b!231059 res!113587) b!231061))

(assert (= (and b!231062 c!38376) b!231047))

(assert (= (and b!231062 (not c!38376)) b!231060))

(assert (= (and b!231047 res!113584) b!231053))

(assert (= (and b!231053 res!113585) b!231052))

(assert (= (or b!231051 b!231047) bm!21452))

(assert (= (or b!231061 b!231052) bm!21453))

(assert (= (and b!231056 res!113588) b!231057))

(assert (= (and b!231057 c!38374) b!231064))

(assert (= (and b!231057 (not c!38374)) b!231065))

(assert (= (and b!231049 condMapEmpty!10279) mapIsEmpty!10279))

(assert (= (and b!231049 (not condMapEmpty!10279)) mapNonEmpty!10279))

(assert (= (and mapNonEmpty!10279 ((_ is ValueCellFull!2693) mapValue!10279)) b!231063))

(assert (= (and b!231049 ((_ is ValueCellFull!2693) mapDefault!10279)) b!231054))

(assert (= b!231066 b!231049))

(assert (= start!22148 b!231066))

(declare-fun m!252559 () Bool)

(assert (=> b!231057 m!252559))

(declare-fun m!252561 () Bool)

(assert (=> b!231057 m!252561))

(declare-fun m!252563 () Bool)

(assert (=> b!231057 m!252563))

(declare-fun m!252565 () Bool)

(assert (=> b!231057 m!252565))

(declare-fun m!252567 () Bool)

(assert (=> b!231057 m!252567))

(declare-fun m!252569 () Bool)

(assert (=> b!231057 m!252569))

(declare-fun m!252571 () Bool)

(assert (=> b!231057 m!252571))

(declare-fun m!252573 () Bool)

(assert (=> b!231057 m!252573))

(declare-fun m!252575 () Bool)

(assert (=> b!231057 m!252575))

(declare-fun m!252577 () Bool)

(assert (=> b!231057 m!252577))

(declare-fun m!252579 () Bool)

(assert (=> b!231057 m!252579))

(declare-fun m!252581 () Bool)

(assert (=> b!231057 m!252581))

(declare-fun m!252583 () Bool)

(assert (=> b!231057 m!252583))

(declare-fun m!252585 () Bool)

(assert (=> b!231057 m!252585))

(declare-fun m!252587 () Bool)

(assert (=> b!231057 m!252587))

(declare-fun m!252589 () Bool)

(assert (=> b!231057 m!252589))

(declare-fun m!252591 () Bool)

(assert (=> b!231057 m!252591))

(declare-fun m!252593 () Bool)

(assert (=> b!231058 m!252593))

(declare-fun m!252595 () Bool)

(assert (=> b!231050 m!252595))

(declare-fun m!252597 () Bool)

(assert (=> b!231059 m!252597))

(declare-fun m!252599 () Bool)

(assert (=> b!231064 m!252599))

(declare-fun m!252601 () Bool)

(assert (=> b!231055 m!252601))

(declare-fun m!252603 () Bool)

(assert (=> mapNonEmpty!10279 m!252603))

(declare-fun m!252605 () Bool)

(assert (=> b!231066 m!252605))

(declare-fun m!252607 () Bool)

(assert (=> b!231066 m!252607))

(assert (=> bm!21453 m!252569))

(declare-fun m!252609 () Bool)

(assert (=> b!231056 m!252609))

(declare-fun m!252611 () Bool)

(assert (=> b!231056 m!252611))

(declare-fun m!252613 () Bool)

(assert (=> b!231056 m!252613))

(declare-fun m!252615 () Bool)

(assert (=> bm!21452 m!252615))

(declare-fun m!252617 () Bool)

(assert (=> start!22148 m!252617))

(declare-fun m!252619 () Bool)

(assert (=> b!231053 m!252619))

(check-sat (not mapNonEmpty!10279) (not b!231064) (not bm!21453) (not b!231058) (not b!231050) (not b_next!6211) tp_is_empty!6073 (not start!22148) b_and!13123 (not b!231057) (not bm!21452) (not b!231066) (not b!231055) (not b!231056))
(check-sat b_and!13123 (not b_next!6211))
