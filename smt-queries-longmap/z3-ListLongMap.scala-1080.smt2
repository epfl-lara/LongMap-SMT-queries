; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22164 () Bool)

(assert start!22164)

(declare-fun b!231609 () Bool)

(declare-fun b_free!6231 () Bool)

(declare-fun b_next!6231 () Bool)

(assert (=> b!231609 (= b_free!6231 (not b_next!6231))))

(declare-fun tp!21835 () Bool)

(declare-fun b_and!13129 () Bool)

(assert (=> b!231609 (= tp!21835 b_and!13129)))

(declare-fun b!231600 () Bool)

(declare-fun res!113802 () Bool)

(declare-fun e!150358 () Bool)

(assert (=> b!231600 (=> (not res!113802) (not e!150358))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!231600 (= res!113802 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231601 () Bool)

(declare-datatypes ((Unit!7126 0))(
  ( (Unit!7127) )
))
(declare-fun e!150367 () Unit!7126)

(declare-fun Unit!7128 () Unit!7126)

(assert (=> b!231601 (= e!150367 Unit!7128)))

(declare-fun lt!116786 () Unit!7126)

(declare-datatypes ((V!7771 0))(
  ( (V!7772 (val!3091 Int)) )
))
(declare-datatypes ((ValueCell!2703 0))(
  ( (ValueCellFull!2703 (v!5111 V!7771)) (EmptyCell!2703) )
))
(declare-datatypes ((array!11429 0))(
  ( (array!11430 (arr!5434 (Array (_ BitVec 32) ValueCell!2703)) (size!5767 (_ BitVec 32))) )
))
(declare-datatypes ((array!11431 0))(
  ( (array!11432 (arr!5435 (Array (_ BitVec 32) (_ BitVec 64))) (size!5768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3306 0))(
  ( (LongMapFixedSize!3307 (defaultEntry!4312 Int) (mask!10216 (_ BitVec 32)) (extraKeys!4049 (_ BitVec 32)) (zeroValue!4153 V!7771) (minValue!4153 V!7771) (_size!1702 (_ BitVec 32)) (_keys!6366 array!11431) (_values!4295 array!11429) (_vacant!1702 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3306)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7771 V!7771 (_ BitVec 64) Int) Unit!7126)

(assert (=> b!231601 (= lt!116786 (lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (_keys!6366 thiss!1504) (_values!4295 thiss!1504) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) key!932 (defaultEntry!4312 thiss!1504)))))

(assert (=> b!231601 false))

(declare-fun b!231602 () Bool)

(declare-fun e!150361 () Unit!7126)

(declare-fun Unit!7129 () Unit!7126)

(assert (=> b!231602 (= e!150361 Unit!7129)))

(declare-fun lt!116783 () Unit!7126)

(declare-fun lemmaArrayContainsKeyThenInListMap!137 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7771 V!7771 (_ BitVec 64) (_ BitVec 32) Int) Unit!7126)

(assert (=> b!231602 (= lt!116783 (lemmaArrayContainsKeyThenInListMap!137 (_keys!6366 thiss!1504) (_values!4295 thiss!1504) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4312 thiss!1504)))))

(assert (=> b!231602 false))

(declare-fun b!231603 () Bool)

(declare-fun e!150366 () Bool)

(declare-fun tp_is_empty!6093 () Bool)

(assert (=> b!231603 (= e!150366 tp_is_empty!6093)))

(declare-fun b!231604 () Bool)

(declare-fun c!38484 () Bool)

(declare-datatypes ((SeekEntryResult!953 0))(
  ( (MissingZero!953 (index!5982 (_ BitVec 32))) (Found!953 (index!5983 (_ BitVec 32))) (Intermediate!953 (undefined!1765 Bool) (index!5984 (_ BitVec 32)) (x!23509 (_ BitVec 32))) (Undefined!953) (MissingVacant!953 (index!5985 (_ BitVec 32))) )
))
(declare-fun lt!116787 () SeekEntryResult!953)

(get-info :version)

(assert (=> b!231604 (= c!38484 ((_ is MissingVacant!953) lt!116787))))

(declare-fun e!150355 () Bool)

(declare-fun e!150363 () Bool)

(assert (=> b!231604 (= e!150355 e!150363)))

(declare-fun b!231605 () Bool)

(declare-fun e!150360 () Bool)

(assert (=> b!231605 (= e!150358 e!150360)))

(declare-fun res!113808 () Bool)

(assert (=> b!231605 (=> (not res!113808) (not e!150360))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231605 (= res!113808 (or (= lt!116787 (MissingZero!953 index!297)) (= lt!116787 (MissingVacant!953 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11431 (_ BitVec 32)) SeekEntryResult!953)

(assert (=> b!231605 (= lt!116787 (seekEntryOrOpen!0 key!932 (_keys!6366 thiss!1504) (mask!10216 thiss!1504)))))

(declare-fun b!231606 () Bool)

(declare-fun res!113804 () Bool)

(assert (=> b!231606 (= res!113804 (= (select (arr!5435 (_keys!6366 thiss!1504)) (index!5985 lt!116787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150368 () Bool)

(assert (=> b!231606 (=> (not res!113804) (not e!150368))))

(declare-fun b!231607 () Bool)

(declare-fun Unit!7130 () Unit!7126)

(assert (=> b!231607 (= e!150361 Unit!7130)))

(declare-fun b!231608 () Bool)

(assert (=> b!231608 (= e!150363 e!150368)))

(declare-fun res!113803 () Bool)

(declare-fun call!21528 () Bool)

(assert (=> b!231608 (= res!113803 call!21528)))

(assert (=> b!231608 (=> (not res!113803) (not e!150368))))

(declare-fun e!150357 () Bool)

(declare-fun e!150356 () Bool)

(declare-fun array_inv!3583 (array!11431) Bool)

(declare-fun array_inv!3584 (array!11429) Bool)

(assert (=> b!231609 (= e!150357 (and tp!21835 tp_is_empty!6093 (array_inv!3583 (_keys!6366 thiss!1504)) (array_inv!3584 (_values!4295 thiss!1504)) e!150356))))

(declare-fun b!231610 () Bool)

(declare-fun e!150359 () Bool)

(assert (=> b!231610 (= e!150360 e!150359)))

(declare-fun res!113809 () Bool)

(assert (=> b!231610 (=> (not res!113809) (not e!150359))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231610 (= res!113809 (inRange!0 index!297 (mask!10216 thiss!1504)))))

(declare-fun lt!116780 () Unit!7126)

(assert (=> b!231610 (= lt!116780 e!150367)))

(declare-fun c!38482 () Bool)

(declare-datatypes ((tuple2!4562 0))(
  ( (tuple2!4563 (_1!2292 (_ BitVec 64)) (_2!2292 V!7771)) )
))
(declare-datatypes ((List!3481 0))(
  ( (Nil!3478) (Cons!3477 (h!4125 tuple2!4562) (t!8440 List!3481)) )
))
(declare-datatypes ((ListLongMap!3475 0))(
  ( (ListLongMap!3476 (toList!1753 List!3481)) )
))
(declare-fun lt!116789 () ListLongMap!3475)

(declare-fun contains!1622 (ListLongMap!3475 (_ BitVec 64)) Bool)

(assert (=> b!231610 (= c!38482 (contains!1622 lt!116789 key!932))))

(declare-fun getCurrentListMap!1281 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7771 V!7771 (_ BitVec 32) Int) ListLongMap!3475)

(assert (=> b!231610 (= lt!116789 (getCurrentListMap!1281 (_keys!6366 thiss!1504) (_values!4295 thiss!1504) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4312 thiss!1504)))))

(declare-fun b!231611 () Bool)

(assert (=> b!231611 (= e!150363 ((_ is Undefined!953) lt!116787))))

(declare-fun c!38481 () Bool)

(declare-fun bm!21524 () Bool)

(assert (=> bm!21524 (= call!21528 (inRange!0 (ite c!38481 (index!5982 lt!116787) (index!5985 lt!116787)) (mask!10216 thiss!1504)))))

(declare-fun b!231612 () Bool)

(declare-fun e!150362 () Bool)

(assert (=> b!231612 (= e!150362 tp_is_empty!6093)))

(declare-fun b!231613 () Bool)

(declare-fun call!21527 () Bool)

(assert (=> b!231613 (= e!150368 (not call!21527))))

(declare-fun b!231614 () Bool)

(declare-fun e!150364 () Bool)

(assert (=> b!231614 (= e!150364 (not call!21527))))

(declare-fun mapIsEmpty!10309 () Bool)

(declare-fun mapRes!10309 () Bool)

(assert (=> mapIsEmpty!10309 mapRes!10309))

(declare-fun bm!21525 () Bool)

(declare-fun arrayContainsKey!0 (array!11431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21525 (= call!21527 (arrayContainsKey!0 (_keys!6366 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231615 () Bool)

(assert (=> b!231615 (= e!150359 (not true))))

(declare-fun lt!116792 () array!11431)

(declare-fun arrayCountValidKeys!0 (array!11431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231615 (= (arrayCountValidKeys!0 lt!116792 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116779 () Unit!7126)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11431 (_ BitVec 32)) Unit!7126)

(assert (=> b!231615 (= lt!116779 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116792 index!297))))

(assert (=> b!231615 (arrayContainsKey!0 lt!116792 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116785 () Unit!7126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11431 (_ BitVec 64) (_ BitVec 32)) Unit!7126)

(assert (=> b!231615 (= lt!116785 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116792 key!932 index!297))))

(declare-fun v!346 () V!7771)

(declare-fun +!617 (ListLongMap!3475 tuple2!4562) ListLongMap!3475)

(assert (=> b!231615 (= (+!617 lt!116789 (tuple2!4563 key!932 v!346)) (getCurrentListMap!1281 lt!116792 (array!11430 (store (arr!5434 (_values!4295 thiss!1504)) index!297 (ValueCellFull!2703 v!346)) (size!5767 (_values!4295 thiss!1504))) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4312 thiss!1504)))))

(declare-fun lt!116782 () Unit!7126)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!71 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7771 V!7771 (_ BitVec 32) (_ BitVec 64) V!7771 Int) Unit!7126)

(assert (=> b!231615 (= lt!116782 (lemmaAddValidKeyToArrayThenAddPairToListMap!71 (_keys!6366 thiss!1504) (_values!4295 thiss!1504) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) index!297 key!932 v!346 (defaultEntry!4312 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11431 (_ BitVec 32)) Bool)

(assert (=> b!231615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116792 (mask!10216 thiss!1504))))

(declare-fun lt!116781 () Unit!7126)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11431 (_ BitVec 32) (_ BitVec 32)) Unit!7126)

(assert (=> b!231615 (= lt!116781 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6366 thiss!1504) index!297 (mask!10216 thiss!1504)))))

(assert (=> b!231615 (= (arrayCountValidKeys!0 lt!116792 #b00000000000000000000000000000000 (size!5768 (_keys!6366 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6366 thiss!1504) #b00000000000000000000000000000000 (size!5768 (_keys!6366 thiss!1504)))))))

(declare-fun lt!116790 () Unit!7126)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11431 (_ BitVec 32) (_ BitVec 64)) Unit!7126)

(assert (=> b!231615 (= lt!116790 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6366 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3482 0))(
  ( (Nil!3479) (Cons!3478 (h!4126 (_ BitVec 64)) (t!8441 List!3482)) )
))
(declare-fun arrayNoDuplicates!0 (array!11431 (_ BitVec 32) List!3482) Bool)

(assert (=> b!231615 (arrayNoDuplicates!0 lt!116792 #b00000000000000000000000000000000 Nil!3479)))

(assert (=> b!231615 (= lt!116792 (array!11432 (store (arr!5435 (_keys!6366 thiss!1504)) index!297 key!932) (size!5768 (_keys!6366 thiss!1504))))))

(declare-fun lt!116791 () Unit!7126)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3482) Unit!7126)

(assert (=> b!231615 (= lt!116791 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6366 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3479))))

(declare-fun lt!116788 () Unit!7126)

(assert (=> b!231615 (= lt!116788 e!150361)))

(declare-fun c!38483 () Bool)

(assert (=> b!231615 (= c!38483 (arrayContainsKey!0 (_keys!6366 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231616 () Bool)

(declare-fun res!113805 () Bool)

(assert (=> b!231616 (=> (not res!113805) (not e!150364))))

(assert (=> b!231616 (= res!113805 call!21528)))

(assert (=> b!231616 (= e!150355 e!150364)))

(declare-fun b!231617 () Bool)

(declare-fun res!113806 () Bool)

(assert (=> b!231617 (=> (not res!113806) (not e!150364))))

(assert (=> b!231617 (= res!113806 (= (select (arr!5435 (_keys!6366 thiss!1504)) (index!5982 lt!116787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10309 () Bool)

(declare-fun tp!21834 () Bool)

(assert (=> mapNonEmpty!10309 (= mapRes!10309 (and tp!21834 e!150366))))

(declare-fun mapRest!10309 () (Array (_ BitVec 32) ValueCell!2703))

(declare-fun mapKey!10309 () (_ BitVec 32))

(declare-fun mapValue!10309 () ValueCell!2703)

(assert (=> mapNonEmpty!10309 (= (arr!5434 (_values!4295 thiss!1504)) (store mapRest!10309 mapKey!10309 mapValue!10309))))

(declare-fun b!231618 () Bool)

(declare-fun lt!116784 () Unit!7126)

(assert (=> b!231618 (= e!150367 lt!116784)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!319 (array!11431 array!11429 (_ BitVec 32) (_ BitVec 32) V!7771 V!7771 (_ BitVec 64) Int) Unit!7126)

(assert (=> b!231618 (= lt!116784 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!319 (_keys!6366 thiss!1504) (_values!4295 thiss!1504) (mask!10216 thiss!1504) (extraKeys!4049 thiss!1504) (zeroValue!4153 thiss!1504) (minValue!4153 thiss!1504) key!932 (defaultEntry!4312 thiss!1504)))))

(assert (=> b!231618 (= c!38481 ((_ is MissingZero!953) lt!116787))))

(assert (=> b!231618 e!150355))

(declare-fun res!113807 () Bool)

(assert (=> start!22164 (=> (not res!113807) (not e!150358))))

(declare-fun valid!1311 (LongMapFixedSize!3306) Bool)

(assert (=> start!22164 (= res!113807 (valid!1311 thiss!1504))))

(assert (=> start!22164 e!150358))

(assert (=> start!22164 e!150357))

(assert (=> start!22164 true))

(assert (=> start!22164 tp_is_empty!6093))

(declare-fun b!231619 () Bool)

(assert (=> b!231619 (= e!150356 (and e!150362 mapRes!10309))))

(declare-fun condMapEmpty!10309 () Bool)

(declare-fun mapDefault!10309 () ValueCell!2703)

(assert (=> b!231619 (= condMapEmpty!10309 (= (arr!5434 (_values!4295 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2703)) mapDefault!10309)))))

(assert (= (and start!22164 res!113807) b!231600))

(assert (= (and b!231600 res!113802) b!231605))

(assert (= (and b!231605 res!113808) b!231610))

(assert (= (and b!231610 c!38482) b!231601))

(assert (= (and b!231610 (not c!38482)) b!231618))

(assert (= (and b!231618 c!38481) b!231616))

(assert (= (and b!231618 (not c!38481)) b!231604))

(assert (= (and b!231616 res!113805) b!231617))

(assert (= (and b!231617 res!113806) b!231614))

(assert (= (and b!231604 c!38484) b!231608))

(assert (= (and b!231604 (not c!38484)) b!231611))

(assert (= (and b!231608 res!113803) b!231606))

(assert (= (and b!231606 res!113804) b!231613))

(assert (= (or b!231616 b!231608) bm!21524))

(assert (= (or b!231614 b!231613) bm!21525))

(assert (= (and b!231610 res!113809) b!231615))

(assert (= (and b!231615 c!38483) b!231602))

(assert (= (and b!231615 (not c!38483)) b!231607))

(assert (= (and b!231619 condMapEmpty!10309) mapIsEmpty!10309))

(assert (= (and b!231619 (not condMapEmpty!10309)) mapNonEmpty!10309))

(assert (= (and mapNonEmpty!10309 ((_ is ValueCellFull!2703) mapValue!10309)) b!231603))

(assert (= (and b!231619 ((_ is ValueCellFull!2703) mapDefault!10309)) b!231612))

(assert (= b!231609 b!231619))

(assert (= start!22164 b!231609))

(declare-fun m!252997 () Bool)

(assert (=> b!231606 m!252997))

(declare-fun m!252999 () Bool)

(assert (=> start!22164 m!252999))

(declare-fun m!253001 () Bool)

(assert (=> bm!21525 m!253001))

(declare-fun m!253003 () Bool)

(assert (=> b!231615 m!253003))

(declare-fun m!253005 () Bool)

(assert (=> b!231615 m!253005))

(declare-fun m!253007 () Bool)

(assert (=> b!231615 m!253007))

(declare-fun m!253009 () Bool)

(assert (=> b!231615 m!253009))

(declare-fun m!253011 () Bool)

(assert (=> b!231615 m!253011))

(declare-fun m!253013 () Bool)

(assert (=> b!231615 m!253013))

(declare-fun m!253015 () Bool)

(assert (=> b!231615 m!253015))

(declare-fun m!253017 () Bool)

(assert (=> b!231615 m!253017))

(declare-fun m!253019 () Bool)

(assert (=> b!231615 m!253019))

(declare-fun m!253021 () Bool)

(assert (=> b!231615 m!253021))

(declare-fun m!253023 () Bool)

(assert (=> b!231615 m!253023))

(assert (=> b!231615 m!253001))

(declare-fun m!253025 () Bool)

(assert (=> b!231615 m!253025))

(declare-fun m!253027 () Bool)

(assert (=> b!231615 m!253027))

(declare-fun m!253029 () Bool)

(assert (=> b!231615 m!253029))

(declare-fun m!253031 () Bool)

(assert (=> b!231615 m!253031))

(declare-fun m!253033 () Bool)

(assert (=> b!231615 m!253033))

(declare-fun m!253035 () Bool)

(assert (=> bm!21524 m!253035))

(declare-fun m!253037 () Bool)

(assert (=> b!231602 m!253037))

(declare-fun m!253039 () Bool)

(assert (=> b!231610 m!253039))

(declare-fun m!253041 () Bool)

(assert (=> b!231610 m!253041))

(declare-fun m!253043 () Bool)

(assert (=> b!231610 m!253043))

(declare-fun m!253045 () Bool)

(assert (=> b!231605 m!253045))

(declare-fun m!253047 () Bool)

(assert (=> b!231601 m!253047))

(declare-fun m!253049 () Bool)

(assert (=> b!231617 m!253049))

(declare-fun m!253051 () Bool)

(assert (=> b!231609 m!253051))

(declare-fun m!253053 () Bool)

(assert (=> b!231609 m!253053))

(declare-fun m!253055 () Bool)

(assert (=> mapNonEmpty!10309 m!253055))

(declare-fun m!253057 () Bool)

(assert (=> b!231618 m!253057))

(check-sat b_and!13129 (not mapNonEmpty!10309) tp_is_empty!6093 (not start!22164) (not b!231618) (not b!231602) (not bm!21524) (not b!231609) (not b!231610) (not b!231601) (not b_next!6231) (not b!231615) (not b!231605) (not bm!21525))
(check-sat b_and!13129 (not b_next!6231))
