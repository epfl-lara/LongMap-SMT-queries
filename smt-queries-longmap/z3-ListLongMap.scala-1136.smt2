; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23450 () Bool)

(assert start!23450)

(declare-fun b!246340 () Bool)

(declare-fun b_free!6567 () Bool)

(declare-fun b_next!6567 () Bool)

(assert (=> b!246340 (= b_free!6567 (not b_next!6567))))

(declare-fun tp!22940 () Bool)

(declare-fun b_and!13563 () Bool)

(assert (=> b!246340 (= tp!22940 b_and!13563)))

(declare-fun b!246329 () Bool)

(declare-datatypes ((Unit!7606 0))(
  ( (Unit!7607) )
))
(declare-fun e!159807 () Unit!7606)

(declare-fun Unit!7608 () Unit!7606)

(assert (=> b!246329 (= e!159807 Unit!7608)))

(declare-fun b!246330 () Bool)

(declare-fun res!120785 () Bool)

(declare-fun e!159808 () Bool)

(assert (=> b!246330 (=> (not res!120785) (not e!159808))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!246330 (= res!120785 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246331 () Bool)

(declare-fun res!120787 () Bool)

(declare-fun e!159802 () Bool)

(assert (=> b!246331 (=> (not res!120787) (not e!159802))))

(declare-datatypes ((V!8219 0))(
  ( (V!8220 (val!3259 Int)) )
))
(declare-datatypes ((ValueCell!2871 0))(
  ( (ValueCellFull!2871 (v!5314 V!8219)) (EmptyCell!2871) )
))
(declare-datatypes ((array!12159 0))(
  ( (array!12160 (arr!5770 (Array (_ BitVec 32) ValueCell!2871)) (size!6113 (_ BitVec 32))) )
))
(declare-datatypes ((array!12161 0))(
  ( (array!12162 (arr!5771 (Array (_ BitVec 32) (_ BitVec 64))) (size!6114 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3642 0))(
  ( (LongMapFixedSize!3643 (defaultEntry!4558 Int) (mask!10681 (_ BitVec 32)) (extraKeys!4295 (_ BitVec 32)) (zeroValue!4399 V!8219) (minValue!4399 V!8219) (_size!1870 (_ BitVec 32)) (_keys!6677 array!12161) (_values!4541 array!12159) (_vacant!1870 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3642)

(declare-datatypes ((SeekEntryResult!1094 0))(
  ( (MissingZero!1094 (index!6546 (_ BitVec 32))) (Found!1094 (index!6547 (_ BitVec 32))) (Intermediate!1094 (undefined!1906 Bool) (index!6548 (_ BitVec 32)) (x!24468 (_ BitVec 32))) (Undefined!1094) (MissingVacant!1094 (index!6549 (_ BitVec 32))) )
))
(declare-fun lt!123374 () SeekEntryResult!1094)

(assert (=> b!246331 (= res!120787 (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6546 lt!123374)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!120789 () Bool)

(assert (=> start!23450 (=> (not res!120789) (not e!159808))))

(declare-fun valid!1426 (LongMapFixedSize!3642) Bool)

(assert (=> start!23450 (= res!120789 (valid!1426 thiss!1504))))

(assert (=> start!23450 e!159808))

(declare-fun e!159803 () Bool)

(assert (=> start!23450 e!159803))

(assert (=> start!23450 true))

(declare-fun call!23021 () Bool)

(declare-fun bm!23017 () Bool)

(declare-fun c!41188 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23017 (= call!23021 (inRange!0 (ite c!41188 (index!6546 lt!123374) (index!6549 lt!123374)) (mask!10681 thiss!1504)))))

(declare-fun b!246332 () Bool)

(declare-fun call!23020 () Bool)

(assert (=> b!246332 (= e!159802 (not call!23020))))

(declare-fun b!246333 () Bool)

(declare-fun e!159812 () Bool)

(assert (=> b!246333 (= e!159812 (not call!23020))))

(declare-fun b!246334 () Bool)

(declare-fun e!159804 () Bool)

(assert (=> b!246334 (= e!159804 e!159812)))

(declare-fun res!120793 () Bool)

(assert (=> b!246334 (= res!120793 call!23021)))

(assert (=> b!246334 (=> (not res!120793) (not e!159812))))

(declare-fun b!246335 () Bool)

(declare-fun e!159810 () Unit!7606)

(declare-fun Unit!7609 () Unit!7606)

(assert (=> b!246335 (= e!159810 Unit!7609)))

(declare-fun lt!123367 () Unit!7606)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) Int) Unit!7606)

(assert (=> b!246335 (= lt!123367 (lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)))))

(assert (=> b!246335 false))

(declare-fun b!246336 () Bool)

(declare-fun Unit!7610 () Unit!7606)

(assert (=> b!246336 (= e!159807 Unit!7610)))

(declare-fun lt!123368 () Unit!7606)

(declare-fun lemmaArrayContainsKeyThenInListMap!178 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) (_ BitVec 32) Int) Unit!7606)

(assert (=> b!246336 (= lt!123368 (lemmaArrayContainsKeyThenInListMap!178 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(assert (=> b!246336 false))

(declare-fun b!246337 () Bool)

(declare-fun res!120790 () Bool)

(assert (=> b!246337 (= res!120790 (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6549 lt!123374)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246337 (=> (not res!120790) (not e!159812))))

(declare-fun b!246338 () Bool)

(declare-fun e!159809 () Bool)

(declare-fun e!159813 () Bool)

(declare-fun mapRes!10910 () Bool)

(assert (=> b!246338 (= e!159809 (and e!159813 mapRes!10910))))

(declare-fun condMapEmpty!10910 () Bool)

(declare-fun mapDefault!10910 () ValueCell!2871)

(assert (=> b!246338 (= condMapEmpty!10910 (= (arr!5770 (_values!4541 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2871)) mapDefault!10910)))))

(declare-fun b!246339 () Bool)

(declare-fun lt!123371 () Unit!7606)

(assert (=> b!246339 (= e!159810 lt!123371)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) Int) Unit!7606)

(assert (=> b!246339 (= lt!123371 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)))))

(get-info :version)

(assert (=> b!246339 (= c!41188 ((_ is MissingZero!1094) lt!123374))))

(declare-fun e!159801 () Bool)

(assert (=> b!246339 e!159801))

(declare-fun mapNonEmpty!10910 () Bool)

(declare-fun tp!22939 () Bool)

(declare-fun e!159800 () Bool)

(assert (=> mapNonEmpty!10910 (= mapRes!10910 (and tp!22939 e!159800))))

(declare-fun mapValue!10910 () ValueCell!2871)

(declare-fun mapKey!10910 () (_ BitVec 32))

(declare-fun mapRest!10910 () (Array (_ BitVec 32) ValueCell!2871))

(assert (=> mapNonEmpty!10910 (= (arr!5770 (_values!4541 thiss!1504)) (store mapRest!10910 mapKey!10910 mapValue!10910))))

(declare-fun bm!23018 () Bool)

(declare-fun arrayContainsKey!0 (array!12161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23018 (= call!23020 (arrayContainsKey!0 (_keys!6677 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6429 () Bool)

(declare-fun array_inv!3813 (array!12161) Bool)

(declare-fun array_inv!3814 (array!12159) Bool)

(assert (=> b!246340 (= e!159803 (and tp!22940 tp_is_empty!6429 (array_inv!3813 (_keys!6677 thiss!1504)) (array_inv!3814 (_values!4541 thiss!1504)) e!159809))))

(declare-fun b!246341 () Bool)

(declare-fun e!159805 () Bool)

(assert (=> b!246341 (= e!159808 e!159805)))

(declare-fun res!120788 () Bool)

(assert (=> b!246341 (=> (not res!120788) (not e!159805))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246341 (= res!120788 (or (= lt!123374 (MissingZero!1094 index!297)) (= lt!123374 (MissingVacant!1094 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12161 (_ BitVec 32)) SeekEntryResult!1094)

(assert (=> b!246341 (= lt!123374 (seekEntryOrOpen!0 key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(declare-fun b!246342 () Bool)

(assert (=> b!246342 (= e!159804 ((_ is Undefined!1094) lt!123374))))

(declare-fun b!246343 () Bool)

(assert (=> b!246343 (= e!159800 tp_is_empty!6429)))

(declare-fun b!246344 () Bool)

(declare-fun e!159806 () Bool)

(assert (=> b!246344 (= e!159805 e!159806)))

(declare-fun res!120791 () Bool)

(assert (=> b!246344 (=> (not res!120791) (not e!159806))))

(assert (=> b!246344 (= res!120791 (inRange!0 index!297 (mask!10681 thiss!1504)))))

(declare-fun lt!123370 () Unit!7606)

(assert (=> b!246344 (= lt!123370 e!159810)))

(declare-fun c!41187 () Bool)

(declare-datatypes ((tuple2!4796 0))(
  ( (tuple2!4797 (_1!2409 (_ BitVec 64)) (_2!2409 V!8219)) )
))
(declare-datatypes ((List!3678 0))(
  ( (Nil!3675) (Cons!3674 (h!4332 tuple2!4796) (t!8695 List!3678)) )
))
(declare-datatypes ((ListLongMap!3709 0))(
  ( (ListLongMap!3710 (toList!1870 List!3678)) )
))
(declare-fun contains!1781 (ListLongMap!3709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1398 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 32) Int) ListLongMap!3709)

(assert (=> b!246344 (= c!41187 (contains!1781 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)) key!932))))

(declare-fun b!246345 () Bool)

(declare-fun res!120792 () Bool)

(assert (=> b!246345 (=> (not res!120792) (not e!159802))))

(assert (=> b!246345 (= res!120792 call!23021)))

(assert (=> b!246345 (= e!159801 e!159802)))

(declare-fun b!246346 () Bool)

(assert (=> b!246346 (= e!159813 tp_is_empty!6429)))

(declare-fun b!246347 () Bool)

(declare-fun e!159799 () Bool)

(assert (=> b!246347 (= e!159799 (or (not (= (size!6114 (_keys!6677 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10681 thiss!1504)))) (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!10910 () Bool)

(assert (=> mapIsEmpty!10910 mapRes!10910))

(declare-fun b!246348 () Bool)

(declare-fun c!41186 () Bool)

(assert (=> b!246348 (= c!41186 ((_ is MissingVacant!1094) lt!123374))))

(assert (=> b!246348 (= e!159801 e!159804)))

(declare-fun b!246349 () Bool)

(assert (=> b!246349 (= e!159806 (not e!159799))))

(declare-fun res!120786 () Bool)

(assert (=> b!246349 (=> res!120786 e!159799)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246349 (= res!120786 (not (validMask!0 (mask!10681 thiss!1504))))))

(declare-fun lt!123375 () array!12161)

(declare-fun arrayCountValidKeys!0 (array!12161 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246349 (= (arrayCountValidKeys!0 lt!123375 #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6677 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504)))))))

(declare-fun lt!123369 () Unit!7606)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12161 (_ BitVec 32) (_ BitVec 64)) Unit!7606)

(assert (=> b!246349 (= lt!123369 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6677 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3679 0))(
  ( (Nil!3676) (Cons!3675 (h!4333 (_ BitVec 64)) (t!8696 List!3679)) )
))
(declare-fun arrayNoDuplicates!0 (array!12161 (_ BitVec 32) List!3679) Bool)

(assert (=> b!246349 (arrayNoDuplicates!0 lt!123375 #b00000000000000000000000000000000 Nil!3676)))

(assert (=> b!246349 (= lt!123375 (array!12162 (store (arr!5771 (_keys!6677 thiss!1504)) index!297 key!932) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun lt!123372 () Unit!7606)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3679) Unit!7606)

(assert (=> b!246349 (= lt!123372 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6677 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3676))))

(declare-fun lt!123373 () Unit!7606)

(assert (=> b!246349 (= lt!123373 e!159807)))

(declare-fun c!41189 () Bool)

(assert (=> b!246349 (= c!41189 (arrayContainsKey!0 (_keys!6677 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23450 res!120789) b!246330))

(assert (= (and b!246330 res!120785) b!246341))

(assert (= (and b!246341 res!120788) b!246344))

(assert (= (and b!246344 c!41187) b!246335))

(assert (= (and b!246344 (not c!41187)) b!246339))

(assert (= (and b!246339 c!41188) b!246345))

(assert (= (and b!246339 (not c!41188)) b!246348))

(assert (= (and b!246345 res!120792) b!246331))

(assert (= (and b!246331 res!120787) b!246332))

(assert (= (and b!246348 c!41186) b!246334))

(assert (= (and b!246348 (not c!41186)) b!246342))

(assert (= (and b!246334 res!120793) b!246337))

(assert (= (and b!246337 res!120790) b!246333))

(assert (= (or b!246345 b!246334) bm!23017))

(assert (= (or b!246332 b!246333) bm!23018))

(assert (= (and b!246344 res!120791) b!246349))

(assert (= (and b!246349 c!41189) b!246336))

(assert (= (and b!246349 (not c!41189)) b!246329))

(assert (= (and b!246349 (not res!120786)) b!246347))

(assert (= (and b!246338 condMapEmpty!10910) mapIsEmpty!10910))

(assert (= (and b!246338 (not condMapEmpty!10910)) mapNonEmpty!10910))

(assert (= (and mapNonEmpty!10910 ((_ is ValueCellFull!2871) mapValue!10910)) b!246343))

(assert (= (and b!246338 ((_ is ValueCellFull!2871) mapDefault!10910)) b!246346))

(assert (= b!246340 b!246338))

(assert (= start!23450 b!246340))

(declare-fun m!263741 () Bool)

(assert (=> b!246331 m!263741))

(declare-fun m!263743 () Bool)

(assert (=> bm!23018 m!263743))

(declare-fun m!263745 () Bool)

(assert (=> start!23450 m!263745))

(declare-fun m!263747 () Bool)

(assert (=> b!246336 m!263747))

(declare-fun m!263749 () Bool)

(assert (=> b!246339 m!263749))

(declare-fun m!263751 () Bool)

(assert (=> b!246344 m!263751))

(declare-fun m!263753 () Bool)

(assert (=> b!246344 m!263753))

(assert (=> b!246344 m!263753))

(declare-fun m!263755 () Bool)

(assert (=> b!246344 m!263755))

(declare-fun m!263757 () Bool)

(assert (=> b!246349 m!263757))

(assert (=> b!246349 m!263743))

(declare-fun m!263759 () Bool)

(assert (=> b!246349 m!263759))

(declare-fun m!263761 () Bool)

(assert (=> b!246349 m!263761))

(declare-fun m!263763 () Bool)

(assert (=> b!246349 m!263763))

(declare-fun m!263765 () Bool)

(assert (=> b!246349 m!263765))

(declare-fun m!263767 () Bool)

(assert (=> b!246349 m!263767))

(declare-fun m!263769 () Bool)

(assert (=> b!246349 m!263769))

(declare-fun m!263771 () Bool)

(assert (=> bm!23017 m!263771))

(declare-fun m!263773 () Bool)

(assert (=> mapNonEmpty!10910 m!263773))

(declare-fun m!263775 () Bool)

(assert (=> b!246340 m!263775))

(declare-fun m!263777 () Bool)

(assert (=> b!246340 m!263777))

(declare-fun m!263779 () Bool)

(assert (=> b!246337 m!263779))

(declare-fun m!263781 () Bool)

(assert (=> b!246341 m!263781))

(declare-fun m!263783 () Bool)

(assert (=> b!246335 m!263783))

(check-sat (not start!23450) (not b!246340) (not b!246344) (not b!246341) (not b!246349) (not b!246336) (not bm!23017) b_and!13563 (not b!246335) (not bm!23018) (not mapNonEmpty!10910) (not b_next!6567) tp_is_empty!6429 (not b!246339))
(check-sat b_and!13563 (not b_next!6567))
(get-model)

(declare-fun d!60363 () Bool)

(declare-fun e!159861 () Bool)

(assert (=> d!60363 e!159861))

(declare-fun res!120825 () Bool)

(assert (=> d!60363 (=> (not res!120825) (not e!159861))))

(declare-fun lt!123408 () SeekEntryResult!1094)

(assert (=> d!60363 (= res!120825 ((_ is Found!1094) lt!123408))))

(assert (=> d!60363 (= lt!123408 (seekEntryOrOpen!0 key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(declare-fun lt!123407 () Unit!7606)

(declare-fun choose!1155 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) Int) Unit!7606)

(assert (=> d!60363 (= lt!123407 (choose!1155 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)))))

(assert (=> d!60363 (validMask!0 (mask!10681 thiss!1504))))

(assert (=> d!60363 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)) lt!123407)))

(declare-fun b!246417 () Bool)

(declare-fun res!120826 () Bool)

(assert (=> b!246417 (=> (not res!120826) (not e!159861))))

(assert (=> b!246417 (= res!120826 (inRange!0 (index!6547 lt!123408) (mask!10681 thiss!1504)))))

(declare-fun b!246418 () Bool)

(assert (=> b!246418 (= e!159861 (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6547 lt!123408)) key!932))))

(assert (=> b!246418 (and (bvsge (index!6547 lt!123408) #b00000000000000000000000000000000) (bvslt (index!6547 lt!123408) (size!6114 (_keys!6677 thiss!1504))))))

(assert (= (and d!60363 res!120825) b!246417))

(assert (= (and b!246417 res!120826) b!246418))

(assert (=> d!60363 m!263781))

(declare-fun m!263829 () Bool)

(assert (=> d!60363 m!263829))

(assert (=> d!60363 m!263757))

(declare-fun m!263831 () Bool)

(assert (=> b!246417 m!263831))

(declare-fun m!263833 () Bool)

(assert (=> b!246418 m!263833))

(assert (=> b!246335 d!60363))

(declare-fun d!60365 () Bool)

(assert (=> d!60365 (= (inRange!0 (ite c!41188 (index!6546 lt!123374) (index!6549 lt!123374)) (mask!10681 thiss!1504)) (and (bvsge (ite c!41188 (index!6546 lt!123374) (index!6549 lt!123374)) #b00000000000000000000000000000000) (bvslt (ite c!41188 (index!6546 lt!123374) (index!6549 lt!123374)) (bvadd (mask!10681 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23017 d!60365))

(declare-fun d!60367 () Bool)

(declare-fun e!159866 () Bool)

(assert (=> d!60367 e!159866))

(declare-fun res!120835 () Bool)

(assert (=> d!60367 (=> (not res!120835) (not e!159866))))

(assert (=> d!60367 (= res!120835 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6677 thiss!1504)))))))

(declare-fun lt!123411 () Unit!7606)

(declare-fun choose!1 (array!12161 (_ BitVec 32) (_ BitVec 64)) Unit!7606)

(assert (=> d!60367 (= lt!123411 (choose!1 (_keys!6677 thiss!1504) index!297 key!932))))

(declare-fun e!159867 () Bool)

(assert (=> d!60367 e!159867))

(declare-fun res!120838 () Bool)

(assert (=> d!60367 (=> (not res!120838) (not e!159867))))

(assert (=> d!60367 (= res!120838 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6677 thiss!1504)))))))

(assert (=> d!60367 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6677 thiss!1504) index!297 key!932) lt!123411)))

(declare-fun b!246427 () Bool)

(declare-fun res!120837 () Bool)

(assert (=> b!246427 (=> (not res!120837) (not e!159867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246427 (= res!120837 (not (validKeyInArray!0 (select (arr!5771 (_keys!6677 thiss!1504)) index!297))))))

(declare-fun b!246429 () Bool)

(assert (=> b!246429 (= e!159867 (bvslt (size!6114 (_keys!6677 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!246428 () Bool)

(declare-fun res!120836 () Bool)

(assert (=> b!246428 (=> (not res!120836) (not e!159867))))

(assert (=> b!246428 (= res!120836 (validKeyInArray!0 key!932))))

(declare-fun b!246430 () Bool)

(assert (=> b!246430 (= e!159866 (= (arrayCountValidKeys!0 (array!12162 (store (arr!5771 (_keys!6677 thiss!1504)) index!297 key!932) (size!6114 (_keys!6677 thiss!1504))) #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6677 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!60367 res!120838) b!246427))

(assert (= (and b!246427 res!120837) b!246428))

(assert (= (and b!246428 res!120836) b!246429))

(assert (= (and d!60367 res!120835) b!246430))

(declare-fun m!263835 () Bool)

(assert (=> d!60367 m!263835))

(declare-fun m!263837 () Bool)

(assert (=> b!246427 m!263837))

(assert (=> b!246427 m!263837))

(declare-fun m!263839 () Bool)

(assert (=> b!246427 m!263839))

(declare-fun m!263841 () Bool)

(assert (=> b!246428 m!263841))

(assert (=> b!246430 m!263765))

(declare-fun m!263843 () Bool)

(assert (=> b!246430 m!263843))

(assert (=> b!246430 m!263767))

(assert (=> b!246349 d!60367))

(declare-fun b!246441 () Bool)

(declare-fun e!159878 () Bool)

(declare-fun e!159876 () Bool)

(assert (=> b!246441 (= e!159878 e!159876)))

(declare-fun res!120847 () Bool)

(assert (=> b!246441 (=> (not res!120847) (not e!159876))))

(declare-fun e!159877 () Bool)

(assert (=> b!246441 (= res!120847 (not e!159877))))

(declare-fun res!120845 () Bool)

(assert (=> b!246441 (=> (not res!120845) (not e!159877))))

(assert (=> b!246441 (= res!120845 (validKeyInArray!0 (select (arr!5771 lt!123375) #b00000000000000000000000000000000)))))

(declare-fun b!246442 () Bool)

(declare-fun e!159879 () Bool)

(assert (=> b!246442 (= e!159876 e!159879)))

(declare-fun c!41204 () Bool)

(assert (=> b!246442 (= c!41204 (validKeyInArray!0 (select (arr!5771 lt!123375) #b00000000000000000000000000000000)))))

(declare-fun bm!23027 () Bool)

(declare-fun call!23030 () Bool)

(assert (=> bm!23027 (= call!23030 (arrayNoDuplicates!0 lt!123375 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41204 (Cons!3675 (select (arr!5771 lt!123375) #b00000000000000000000000000000000) Nil!3676) Nil!3676)))))

(declare-fun b!246443 () Bool)

(declare-fun contains!1782 (List!3679 (_ BitVec 64)) Bool)

(assert (=> b!246443 (= e!159877 (contains!1782 Nil!3676 (select (arr!5771 lt!123375) #b00000000000000000000000000000000)))))

(declare-fun d!60369 () Bool)

(declare-fun res!120846 () Bool)

(assert (=> d!60369 (=> res!120846 e!159878)))

(assert (=> d!60369 (= res!120846 (bvsge #b00000000000000000000000000000000 (size!6114 lt!123375)))))

(assert (=> d!60369 (= (arrayNoDuplicates!0 lt!123375 #b00000000000000000000000000000000 Nil!3676) e!159878)))

(declare-fun b!246444 () Bool)

(assert (=> b!246444 (= e!159879 call!23030)))

(declare-fun b!246445 () Bool)

(assert (=> b!246445 (= e!159879 call!23030)))

(assert (= (and d!60369 (not res!120846)) b!246441))

(assert (= (and b!246441 res!120845) b!246443))

(assert (= (and b!246441 res!120847) b!246442))

(assert (= (and b!246442 c!41204) b!246444))

(assert (= (and b!246442 (not c!41204)) b!246445))

(assert (= (or b!246444 b!246445) bm!23027))

(declare-fun m!263845 () Bool)

(assert (=> b!246441 m!263845))

(assert (=> b!246441 m!263845))

(declare-fun m!263847 () Bool)

(assert (=> b!246441 m!263847))

(assert (=> b!246442 m!263845))

(assert (=> b!246442 m!263845))

(assert (=> b!246442 m!263847))

(assert (=> bm!23027 m!263845))

(declare-fun m!263849 () Bool)

(assert (=> bm!23027 m!263849))

(assert (=> b!246443 m!263845))

(assert (=> b!246443 m!263845))

(declare-fun m!263851 () Bool)

(assert (=> b!246443 m!263851))

(assert (=> b!246349 d!60369))

(declare-fun d!60371 () Bool)

(declare-fun res!120852 () Bool)

(declare-fun e!159884 () Bool)

(assert (=> d!60371 (=> res!120852 e!159884)))

(assert (=> d!60371 (= res!120852 (= (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60371 (= (arrayContainsKey!0 (_keys!6677 thiss!1504) key!932 #b00000000000000000000000000000000) e!159884)))

(declare-fun b!246450 () Bool)

(declare-fun e!159885 () Bool)

(assert (=> b!246450 (= e!159884 e!159885)))

(declare-fun res!120853 () Bool)

(assert (=> b!246450 (=> (not res!120853) (not e!159885))))

(assert (=> b!246450 (= res!120853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246451 () Bool)

(assert (=> b!246451 (= e!159885 (arrayContainsKey!0 (_keys!6677 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60371 (not res!120852)) b!246450))

(assert (= (and b!246450 res!120853) b!246451))

(declare-fun m!263853 () Bool)

(assert (=> d!60371 m!263853))

(declare-fun m!263855 () Bool)

(assert (=> b!246451 m!263855))

(assert (=> b!246349 d!60371))

(declare-fun b!246460 () Bool)

(declare-fun e!159890 () (_ BitVec 32))

(declare-fun call!23033 () (_ BitVec 32))

(assert (=> b!246460 (= e!159890 call!23033)))

(declare-fun d!60373 () Bool)

(declare-fun lt!123414 () (_ BitVec 32))

(assert (=> d!60373 (and (bvsge lt!123414 #b00000000000000000000000000000000) (bvsle lt!123414 (bvsub (size!6114 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159891 () (_ BitVec 32))

(assert (=> d!60373 (= lt!123414 e!159891)))

(declare-fun c!41210 () Bool)

(assert (=> d!60373 (= c!41210 (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(assert (=> d!60373 (and (bvsle #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6114 (_keys!6677 thiss!1504)) (size!6114 (_keys!6677 thiss!1504))))))

(assert (=> d!60373 (= (arrayCountValidKeys!0 (_keys!6677 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) lt!123414)))

(declare-fun bm!23030 () Bool)

(assert (=> bm!23030 (= call!23033 (arrayCountValidKeys!0 (_keys!6677 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246461 () Bool)

(assert (=> b!246461 (= e!159891 #b00000000000000000000000000000000)))

(declare-fun b!246462 () Bool)

(assert (=> b!246462 (= e!159890 (bvadd #b00000000000000000000000000000001 call!23033))))

(declare-fun b!246463 () Bool)

(assert (=> b!246463 (= e!159891 e!159890)))

(declare-fun c!41209 () Bool)

(assert (=> b!246463 (= c!41209 (validKeyInArray!0 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60373 c!41210) b!246461))

(assert (= (and d!60373 (not c!41210)) b!246463))

(assert (= (and b!246463 c!41209) b!246462))

(assert (= (and b!246463 (not c!41209)) b!246460))

(assert (= (or b!246462 b!246460) bm!23030))

(declare-fun m!263857 () Bool)

(assert (=> bm!23030 m!263857))

(assert (=> b!246463 m!263853))

(assert (=> b!246463 m!263853))

(declare-fun m!263859 () Bool)

(assert (=> b!246463 m!263859))

(assert (=> b!246349 d!60373))

(declare-fun d!60375 () Bool)

(assert (=> d!60375 (= (validMask!0 (mask!10681 thiss!1504)) (and (or (= (mask!10681 thiss!1504) #b00000000000000000000000000000111) (= (mask!10681 thiss!1504) #b00000000000000000000000000001111) (= (mask!10681 thiss!1504) #b00000000000000000000000000011111) (= (mask!10681 thiss!1504) #b00000000000000000000000000111111) (= (mask!10681 thiss!1504) #b00000000000000000000000001111111) (= (mask!10681 thiss!1504) #b00000000000000000000000011111111) (= (mask!10681 thiss!1504) #b00000000000000000000000111111111) (= (mask!10681 thiss!1504) #b00000000000000000000001111111111) (= (mask!10681 thiss!1504) #b00000000000000000000011111111111) (= (mask!10681 thiss!1504) #b00000000000000000000111111111111) (= (mask!10681 thiss!1504) #b00000000000000000001111111111111) (= (mask!10681 thiss!1504) #b00000000000000000011111111111111) (= (mask!10681 thiss!1504) #b00000000000000000111111111111111) (= (mask!10681 thiss!1504) #b00000000000000001111111111111111) (= (mask!10681 thiss!1504) #b00000000000000011111111111111111) (= (mask!10681 thiss!1504) #b00000000000000111111111111111111) (= (mask!10681 thiss!1504) #b00000000000001111111111111111111) (= (mask!10681 thiss!1504) #b00000000000011111111111111111111) (= (mask!10681 thiss!1504) #b00000000000111111111111111111111) (= (mask!10681 thiss!1504) #b00000000001111111111111111111111) (= (mask!10681 thiss!1504) #b00000000011111111111111111111111) (= (mask!10681 thiss!1504) #b00000000111111111111111111111111) (= (mask!10681 thiss!1504) #b00000001111111111111111111111111) (= (mask!10681 thiss!1504) #b00000011111111111111111111111111) (= (mask!10681 thiss!1504) #b00000111111111111111111111111111) (= (mask!10681 thiss!1504) #b00001111111111111111111111111111) (= (mask!10681 thiss!1504) #b00011111111111111111111111111111) (= (mask!10681 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10681 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246349 d!60375))

(declare-fun b!246464 () Bool)

(declare-fun e!159892 () (_ BitVec 32))

(declare-fun call!23034 () (_ BitVec 32))

(assert (=> b!246464 (= e!159892 call!23034)))

(declare-fun d!60377 () Bool)

(declare-fun lt!123415 () (_ BitVec 32))

(assert (=> d!60377 (and (bvsge lt!123415 #b00000000000000000000000000000000) (bvsle lt!123415 (bvsub (size!6114 lt!123375) #b00000000000000000000000000000000)))))

(declare-fun e!159893 () (_ BitVec 32))

(assert (=> d!60377 (= lt!123415 e!159893)))

(declare-fun c!41212 () Bool)

(assert (=> d!60377 (= c!41212 (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(assert (=> d!60377 (and (bvsle #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6114 (_keys!6677 thiss!1504)) (size!6114 lt!123375)))))

(assert (=> d!60377 (= (arrayCountValidKeys!0 lt!123375 #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) lt!123415)))

(declare-fun bm!23031 () Bool)

(assert (=> bm!23031 (= call!23034 (arrayCountValidKeys!0 lt!123375 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246465 () Bool)

(assert (=> b!246465 (= e!159893 #b00000000000000000000000000000000)))

(declare-fun b!246466 () Bool)

(assert (=> b!246466 (= e!159892 (bvadd #b00000000000000000000000000000001 call!23034))))

(declare-fun b!246467 () Bool)

(assert (=> b!246467 (= e!159893 e!159892)))

(declare-fun c!41211 () Bool)

(assert (=> b!246467 (= c!41211 (validKeyInArray!0 (select (arr!5771 lt!123375) #b00000000000000000000000000000000)))))

(assert (= (and d!60377 c!41212) b!246465))

(assert (= (and d!60377 (not c!41212)) b!246467))

(assert (= (and b!246467 c!41211) b!246466))

(assert (= (and b!246467 (not c!41211)) b!246464))

(assert (= (or b!246466 b!246464) bm!23031))

(declare-fun m!263861 () Bool)

(assert (=> bm!23031 m!263861))

(assert (=> b!246467 m!263845))

(assert (=> b!246467 m!263845))

(assert (=> b!246467 m!263847))

(assert (=> b!246349 d!60377))

(declare-fun d!60379 () Bool)

(declare-fun e!159896 () Bool)

(assert (=> d!60379 e!159896))

(declare-fun res!120856 () Bool)

(assert (=> d!60379 (=> (not res!120856) (not e!159896))))

(assert (=> d!60379 (= res!120856 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6114 (_keys!6677 thiss!1504)))))))

(declare-fun lt!123418 () Unit!7606)

(declare-fun choose!41 (array!12161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3679) Unit!7606)

(assert (=> d!60379 (= lt!123418 (choose!41 (_keys!6677 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3676))))

(assert (=> d!60379 (bvslt (size!6114 (_keys!6677 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60379 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6677 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3676) lt!123418)))

(declare-fun b!246470 () Bool)

(assert (=> b!246470 (= e!159896 (arrayNoDuplicates!0 (array!12162 (store (arr!5771 (_keys!6677 thiss!1504)) index!297 key!932) (size!6114 (_keys!6677 thiss!1504))) #b00000000000000000000000000000000 Nil!3676))))

(assert (= (and d!60379 res!120856) b!246470))

(declare-fun m!263863 () Bool)

(assert (=> d!60379 m!263863))

(assert (=> b!246470 m!263765))

(declare-fun m!263865 () Bool)

(assert (=> b!246470 m!263865))

(assert (=> b!246349 d!60379))

(declare-fun d!60381 () Bool)

(assert (=> d!60381 (contains!1781 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)) key!932)))

(declare-fun lt!123421 () Unit!7606)

(declare-fun choose!1156 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) (_ BitVec 32) Int) Unit!7606)

(assert (=> d!60381 (= lt!123421 (choose!1156 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(assert (=> d!60381 (validMask!0 (mask!10681 thiss!1504))))

(assert (=> d!60381 (= (lemmaArrayContainsKeyThenInListMap!178 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)) lt!123421)))

(declare-fun bs!8913 () Bool)

(assert (= bs!8913 d!60381))

(assert (=> bs!8913 m!263753))

(assert (=> bs!8913 m!263753))

(assert (=> bs!8913 m!263755))

(declare-fun m!263867 () Bool)

(assert (=> bs!8913 m!263867))

(assert (=> bs!8913 m!263757))

(assert (=> b!246336 d!60381))

(assert (=> bm!23018 d!60371))

(declare-fun d!60383 () Bool)

(assert (=> d!60383 (= (inRange!0 index!297 (mask!10681 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10681 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246344 d!60383))

(declare-fun d!60385 () Bool)

(declare-fun e!159902 () Bool)

(assert (=> d!60385 e!159902))

(declare-fun res!120859 () Bool)

(assert (=> d!60385 (=> res!120859 e!159902)))

(declare-fun lt!123431 () Bool)

(assert (=> d!60385 (= res!120859 (not lt!123431))))

(declare-fun lt!123432 () Bool)

(assert (=> d!60385 (= lt!123431 lt!123432)))

(declare-fun lt!123430 () Unit!7606)

(declare-fun e!159901 () Unit!7606)

(assert (=> d!60385 (= lt!123430 e!159901)))

(declare-fun c!41215 () Bool)

(assert (=> d!60385 (= c!41215 lt!123432)))

(declare-fun containsKey!282 (List!3678 (_ BitVec 64)) Bool)

(assert (=> d!60385 (= lt!123432 (containsKey!282 (toList!1870 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504))) key!932))))

(assert (=> d!60385 (= (contains!1781 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)) key!932) lt!123431)))

(declare-fun b!246477 () Bool)

(declare-fun lt!123433 () Unit!7606)

(assert (=> b!246477 (= e!159901 lt!123433)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!230 (List!3678 (_ BitVec 64)) Unit!7606)

(assert (=> b!246477 (= lt!123433 (lemmaContainsKeyImpliesGetValueByKeyDefined!230 (toList!1870 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504))) key!932))))

(declare-datatypes ((Option!296 0))(
  ( (Some!295 (v!5316 V!8219)) (None!294) )
))
(declare-fun isDefined!231 (Option!296) Bool)

(declare-fun getValueByKey!290 (List!3678 (_ BitVec 64)) Option!296)

(assert (=> b!246477 (isDefined!231 (getValueByKey!290 (toList!1870 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504))) key!932))))

(declare-fun b!246478 () Bool)

(declare-fun Unit!7614 () Unit!7606)

(assert (=> b!246478 (= e!159901 Unit!7614)))

(declare-fun b!246479 () Bool)

(assert (=> b!246479 (= e!159902 (isDefined!231 (getValueByKey!290 (toList!1870 (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504))) key!932)))))

(assert (= (and d!60385 c!41215) b!246477))

(assert (= (and d!60385 (not c!41215)) b!246478))

(assert (= (and d!60385 (not res!120859)) b!246479))

(declare-fun m!263869 () Bool)

(assert (=> d!60385 m!263869))

(declare-fun m!263871 () Bool)

(assert (=> b!246477 m!263871))

(declare-fun m!263873 () Bool)

(assert (=> b!246477 m!263873))

(assert (=> b!246477 m!263873))

(declare-fun m!263875 () Bool)

(assert (=> b!246477 m!263875))

(assert (=> b!246479 m!263873))

(assert (=> b!246479 m!263873))

(assert (=> b!246479 m!263875))

(assert (=> b!246344 d!60385))

(declare-fun b!246522 () Bool)

(declare-fun e!159938 () Bool)

(declare-fun call!23054 () Bool)

(assert (=> b!246522 (= e!159938 (not call!23054))))

(declare-fun b!246523 () Bool)

(declare-fun e!159941 () ListLongMap!3709)

(declare-fun e!159937 () ListLongMap!3709)

(assert (=> b!246523 (= e!159941 e!159937)))

(declare-fun c!41233 () Bool)

(assert (=> b!246523 (= c!41233 (and (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23046 () Bool)

(declare-fun lt!123484 () ListLongMap!3709)

(assert (=> bm!23046 (= call!23054 (contains!1781 lt!123484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246524 () Bool)

(declare-fun res!120884 () Bool)

(declare-fun e!159934 () Bool)

(assert (=> b!246524 (=> (not res!120884) (not e!159934))))

(assert (=> b!246524 (= res!120884 e!159938)))

(declare-fun c!41228 () Bool)

(assert (=> b!246524 (= c!41228 (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246525 () Bool)

(declare-fun e!159930 () Bool)

(declare-fun e!159932 () Bool)

(assert (=> b!246525 (= e!159930 e!159932)))

(declare-fun res!120883 () Bool)

(assert (=> b!246525 (=> (not res!120883) (not e!159932))))

(assert (=> b!246525 (= res!120883 (contains!1781 lt!123484 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246527 () Bool)

(declare-fun e!159935 () Bool)

(declare-fun apply!232 (ListLongMap!3709 (_ BitVec 64)) V!8219)

(assert (=> b!246527 (= e!159935 (= (apply!232 lt!123484 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4399 thiss!1504)))))

(declare-fun bm!23047 () Bool)

(declare-fun call!23052 () ListLongMap!3709)

(declare-fun call!23053 () ListLongMap!3709)

(assert (=> bm!23047 (= call!23052 call!23053)))

(declare-fun b!246528 () Bool)

(declare-fun e!159940 () Unit!7606)

(declare-fun Unit!7615 () Unit!7606)

(assert (=> b!246528 (= e!159940 Unit!7615)))

(declare-fun b!246529 () Bool)

(declare-fun call!23050 () ListLongMap!3709)

(declare-fun +!659 (ListLongMap!3709 tuple2!4796) ListLongMap!3709)

(assert (=> b!246529 (= e!159941 (+!659 call!23050 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4399 thiss!1504))))))

(declare-fun bm!23048 () Bool)

(declare-fun call!23055 () ListLongMap!3709)

(assert (=> bm!23048 (= call!23055 call!23050)))

(declare-fun b!246530 () Bool)

(declare-fun e!159939 () Bool)

(assert (=> b!246530 (= e!159939 (validKeyInArray!0 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23049 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!554 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 32) Int) ListLongMap!3709)

(assert (=> bm!23049 (= call!23053 (getCurrentListMapNoExtraKeys!554 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(declare-fun b!246531 () Bool)

(declare-fun e!159929 () Bool)

(assert (=> b!246531 (= e!159929 (validKeyInArray!0 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246532 () Bool)

(declare-fun e!159931 () Bool)

(assert (=> b!246532 (= e!159934 e!159931)))

(declare-fun c!41232 () Bool)

(assert (=> b!246532 (= c!41232 (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246533 () Bool)

(declare-fun get!2963 (ValueCell!2871 V!8219) V!8219)

(declare-fun dynLambda!575 (Int (_ BitVec 64)) V!8219)

(assert (=> b!246533 (= e!159932 (= (apply!232 lt!123484 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000)) (get!2963 (select (arr!5770 (_values!4541 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4558 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6113 (_values!4541 thiss!1504))))))

(assert (=> b!246533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246534 () Bool)

(declare-fun e!159936 () Bool)

(assert (=> b!246534 (= e!159938 e!159936)))

(declare-fun res!120880 () Bool)

(assert (=> b!246534 (= res!120880 call!23054)))

(assert (=> b!246534 (=> (not res!120880) (not e!159936))))

(declare-fun b!246535 () Bool)

(assert (=> b!246535 (= e!159936 (= (apply!232 lt!123484 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4399 thiss!1504)))))

(declare-fun b!246536 () Bool)

(assert (=> b!246536 (= e!159937 call!23055)))

(declare-fun d!60387 () Bool)

(assert (=> d!60387 e!159934))

(declare-fun res!120878 () Bool)

(assert (=> d!60387 (=> (not res!120878) (not e!159934))))

(assert (=> d!60387 (= res!120878 (or (bvsge #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))))

(declare-fun lt!123493 () ListLongMap!3709)

(assert (=> d!60387 (= lt!123484 lt!123493)))

(declare-fun lt!123494 () Unit!7606)

(assert (=> d!60387 (= lt!123494 e!159940)))

(declare-fun c!41231 () Bool)

(assert (=> d!60387 (= c!41231 e!159939)))

(declare-fun res!120879 () Bool)

(assert (=> d!60387 (=> (not res!120879) (not e!159939))))

(assert (=> d!60387 (= res!120879 (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(assert (=> d!60387 (= lt!123493 e!159941)))

(declare-fun c!41229 () Bool)

(assert (=> d!60387 (= c!41229 (and (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60387 (validMask!0 (mask!10681 thiss!1504))))

(assert (=> d!60387 (= (getCurrentListMap!1398 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)) lt!123484)))

(declare-fun b!246526 () Bool)

(declare-fun e!159933 () ListLongMap!3709)

(declare-fun call!23051 () ListLongMap!3709)

(assert (=> b!246526 (= e!159933 call!23051)))

(declare-fun bm!23050 () Bool)

(assert (=> bm!23050 (= call!23050 (+!659 (ite c!41229 call!23053 (ite c!41233 call!23052 call!23051)) (ite (or c!41229 c!41233) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4399 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4399 thiss!1504)))))))

(declare-fun bm!23051 () Bool)

(assert (=> bm!23051 (= call!23051 call!23052)))

(declare-fun b!246537 () Bool)

(declare-fun lt!123491 () Unit!7606)

(assert (=> b!246537 (= e!159940 lt!123491)))

(declare-fun lt!123490 () ListLongMap!3709)

(assert (=> b!246537 (= lt!123490 (getCurrentListMapNoExtraKeys!554 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(declare-fun lt!123496 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123486 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123486 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123485 () Unit!7606)

(declare-fun addStillContains!208 (ListLongMap!3709 (_ BitVec 64) V!8219 (_ BitVec 64)) Unit!7606)

(assert (=> b!246537 (= lt!123485 (addStillContains!208 lt!123490 lt!123496 (zeroValue!4399 thiss!1504) lt!123486))))

(assert (=> b!246537 (contains!1781 (+!659 lt!123490 (tuple2!4797 lt!123496 (zeroValue!4399 thiss!1504))) lt!123486)))

(declare-fun lt!123495 () Unit!7606)

(assert (=> b!246537 (= lt!123495 lt!123485)))

(declare-fun lt!123482 () ListLongMap!3709)

(assert (=> b!246537 (= lt!123482 (getCurrentListMapNoExtraKeys!554 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(declare-fun lt!123487 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123483 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123483 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123489 () Unit!7606)

(declare-fun addApplyDifferent!208 (ListLongMap!3709 (_ BitVec 64) V!8219 (_ BitVec 64)) Unit!7606)

(assert (=> b!246537 (= lt!123489 (addApplyDifferent!208 lt!123482 lt!123487 (minValue!4399 thiss!1504) lt!123483))))

(assert (=> b!246537 (= (apply!232 (+!659 lt!123482 (tuple2!4797 lt!123487 (minValue!4399 thiss!1504))) lt!123483) (apply!232 lt!123482 lt!123483))))

(declare-fun lt!123498 () Unit!7606)

(assert (=> b!246537 (= lt!123498 lt!123489)))

(declare-fun lt!123480 () ListLongMap!3709)

(assert (=> b!246537 (= lt!123480 (getCurrentListMapNoExtraKeys!554 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(declare-fun lt!123479 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123499 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123499 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123492 () Unit!7606)

(assert (=> b!246537 (= lt!123492 (addApplyDifferent!208 lt!123480 lt!123479 (zeroValue!4399 thiss!1504) lt!123499))))

(assert (=> b!246537 (= (apply!232 (+!659 lt!123480 (tuple2!4797 lt!123479 (zeroValue!4399 thiss!1504))) lt!123499) (apply!232 lt!123480 lt!123499))))

(declare-fun lt!123478 () Unit!7606)

(assert (=> b!246537 (= lt!123478 lt!123492)))

(declare-fun lt!123497 () ListLongMap!3709)

(assert (=> b!246537 (= lt!123497 (getCurrentListMapNoExtraKeys!554 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4558 thiss!1504)))))

(declare-fun lt!123488 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123488 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123481 () (_ BitVec 64))

(assert (=> b!246537 (= lt!123481 (select (arr!5771 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246537 (= lt!123491 (addApplyDifferent!208 lt!123497 lt!123488 (minValue!4399 thiss!1504) lt!123481))))

(assert (=> b!246537 (= (apply!232 (+!659 lt!123497 (tuple2!4797 lt!123488 (minValue!4399 thiss!1504))) lt!123481) (apply!232 lt!123497 lt!123481))))

(declare-fun b!246538 () Bool)

(assert (=> b!246538 (= e!159931 e!159935)))

(declare-fun res!120886 () Bool)

(declare-fun call!23049 () Bool)

(assert (=> b!246538 (= res!120886 call!23049)))

(assert (=> b!246538 (=> (not res!120886) (not e!159935))))

(declare-fun b!246539 () Bool)

(declare-fun res!120881 () Bool)

(assert (=> b!246539 (=> (not res!120881) (not e!159934))))

(assert (=> b!246539 (= res!120881 e!159930)))

(declare-fun res!120885 () Bool)

(assert (=> b!246539 (=> res!120885 e!159930)))

(assert (=> b!246539 (= res!120885 (not e!159929))))

(declare-fun res!120882 () Bool)

(assert (=> b!246539 (=> (not res!120882) (not e!159929))))

(assert (=> b!246539 (= res!120882 (bvslt #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun b!246540 () Bool)

(assert (=> b!246540 (= e!159931 (not call!23049))))

(declare-fun bm!23052 () Bool)

(assert (=> bm!23052 (= call!23049 (contains!1781 lt!123484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246541 () Bool)

(declare-fun c!41230 () Bool)

(assert (=> b!246541 (= c!41230 (and (not (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4295 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246541 (= e!159937 e!159933)))

(declare-fun b!246542 () Bool)

(assert (=> b!246542 (= e!159933 call!23055)))

(assert (= (and d!60387 c!41229) b!246529))

(assert (= (and d!60387 (not c!41229)) b!246523))

(assert (= (and b!246523 c!41233) b!246536))

(assert (= (and b!246523 (not c!41233)) b!246541))

(assert (= (and b!246541 c!41230) b!246542))

(assert (= (and b!246541 (not c!41230)) b!246526))

(assert (= (or b!246542 b!246526) bm!23051))

(assert (= (or b!246536 bm!23051) bm!23047))

(assert (= (or b!246536 b!246542) bm!23048))

(assert (= (or b!246529 bm!23047) bm!23049))

(assert (= (or b!246529 bm!23048) bm!23050))

(assert (= (and d!60387 res!120879) b!246530))

(assert (= (and d!60387 c!41231) b!246537))

(assert (= (and d!60387 (not c!41231)) b!246528))

(assert (= (and d!60387 res!120878) b!246539))

(assert (= (and b!246539 res!120882) b!246531))

(assert (= (and b!246539 (not res!120885)) b!246525))

(assert (= (and b!246525 res!120883) b!246533))

(assert (= (and b!246539 res!120881) b!246524))

(assert (= (and b!246524 c!41228) b!246534))

(assert (= (and b!246524 (not c!41228)) b!246522))

(assert (= (and b!246534 res!120880) b!246535))

(assert (= (or b!246534 b!246522) bm!23046))

(assert (= (and b!246524 res!120884) b!246532))

(assert (= (and b!246532 c!41232) b!246538))

(assert (= (and b!246532 (not c!41232)) b!246540))

(assert (= (and b!246538 res!120886) b!246527))

(assert (= (or b!246538 b!246540) bm!23052))

(declare-fun b_lambda!8039 () Bool)

(assert (=> (not b_lambda!8039) (not b!246533)))

(declare-fun t!8698 () Bool)

(declare-fun tb!2977 () Bool)

(assert (=> (and b!246340 (= (defaultEntry!4558 thiss!1504) (defaultEntry!4558 thiss!1504)) t!8698) tb!2977))

(declare-fun result!5253 () Bool)

(assert (=> tb!2977 (= result!5253 tp_is_empty!6429)))

(assert (=> b!246533 t!8698))

(declare-fun b_and!13567 () Bool)

(assert (= b_and!13563 (and (=> t!8698 result!5253) b_and!13567)))

(declare-fun m!263877 () Bool)

(assert (=> b!246527 m!263877))

(declare-fun m!263879 () Bool)

(assert (=> b!246529 m!263879))

(assert (=> b!246530 m!263853))

(assert (=> b!246530 m!263853))

(assert (=> b!246530 m!263859))

(declare-fun m!263881 () Bool)

(assert (=> bm!23049 m!263881))

(declare-fun m!263883 () Bool)

(assert (=> bm!23046 m!263883))

(assert (=> b!246531 m!263853))

(assert (=> b!246531 m!263853))

(assert (=> b!246531 m!263859))

(assert (=> b!246525 m!263853))

(assert (=> b!246525 m!263853))

(declare-fun m!263885 () Bool)

(assert (=> b!246525 m!263885))

(declare-fun m!263887 () Bool)

(assert (=> bm!23052 m!263887))

(declare-fun m!263889 () Bool)

(assert (=> b!246537 m!263889))

(declare-fun m!263891 () Bool)

(assert (=> b!246537 m!263891))

(declare-fun m!263893 () Bool)

(assert (=> b!246537 m!263893))

(declare-fun m!263895 () Bool)

(assert (=> b!246537 m!263895))

(declare-fun m!263897 () Bool)

(assert (=> b!246537 m!263897))

(declare-fun m!263899 () Bool)

(assert (=> b!246537 m!263899))

(declare-fun m!263901 () Bool)

(assert (=> b!246537 m!263901))

(declare-fun m!263903 () Bool)

(assert (=> b!246537 m!263903))

(declare-fun m!263905 () Bool)

(assert (=> b!246537 m!263905))

(assert (=> b!246537 m!263897))

(declare-fun m!263907 () Bool)

(assert (=> b!246537 m!263907))

(declare-fun m!263909 () Bool)

(assert (=> b!246537 m!263909))

(declare-fun m!263911 () Bool)

(assert (=> b!246537 m!263911))

(assert (=> b!246537 m!263901))

(declare-fun m!263913 () Bool)

(assert (=> b!246537 m!263913))

(assert (=> b!246537 m!263913))

(declare-fun m!263915 () Bool)

(assert (=> b!246537 m!263915))

(assert (=> b!246537 m!263905))

(declare-fun m!263917 () Bool)

(assert (=> b!246537 m!263917))

(assert (=> b!246537 m!263881))

(assert (=> b!246537 m!263853))

(declare-fun m!263919 () Bool)

(assert (=> b!246533 m!263919))

(declare-fun m!263921 () Bool)

(assert (=> b!246533 m!263921))

(declare-fun m!263923 () Bool)

(assert (=> b!246533 m!263923))

(assert (=> b!246533 m!263919))

(assert (=> b!246533 m!263921))

(assert (=> b!246533 m!263853))

(declare-fun m!263925 () Bool)

(assert (=> b!246533 m!263925))

(assert (=> b!246533 m!263853))

(declare-fun m!263927 () Bool)

(assert (=> bm!23050 m!263927))

(assert (=> d!60387 m!263757))

(declare-fun m!263929 () Bool)

(assert (=> b!246535 m!263929))

(assert (=> b!246344 d!60387))

(declare-fun b!246557 () Bool)

(declare-fun e!159950 () SeekEntryResult!1094)

(declare-fun lt!123507 () SeekEntryResult!1094)

(assert (=> b!246557 (= e!159950 (Found!1094 (index!6548 lt!123507)))))

(declare-fun b!246558 () Bool)

(declare-fun e!159948 () SeekEntryResult!1094)

(assert (=> b!246558 (= e!159948 (MissingZero!1094 (index!6548 lt!123507)))))

(declare-fun b!246559 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12161 (_ BitVec 32)) SeekEntryResult!1094)

(assert (=> b!246559 (= e!159948 (seekKeyOrZeroReturnVacant!0 (x!24468 lt!123507) (index!6548 lt!123507) (index!6548 lt!123507) key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(declare-fun d!60389 () Bool)

(declare-fun lt!123506 () SeekEntryResult!1094)

(assert (=> d!60389 (and (or ((_ is Undefined!1094) lt!123506) (not ((_ is Found!1094) lt!123506)) (and (bvsge (index!6547 lt!123506) #b00000000000000000000000000000000) (bvslt (index!6547 lt!123506) (size!6114 (_keys!6677 thiss!1504))))) (or ((_ is Undefined!1094) lt!123506) ((_ is Found!1094) lt!123506) (not ((_ is MissingZero!1094) lt!123506)) (and (bvsge (index!6546 lt!123506) #b00000000000000000000000000000000) (bvslt (index!6546 lt!123506) (size!6114 (_keys!6677 thiss!1504))))) (or ((_ is Undefined!1094) lt!123506) ((_ is Found!1094) lt!123506) ((_ is MissingZero!1094) lt!123506) (not ((_ is MissingVacant!1094) lt!123506)) (and (bvsge (index!6549 lt!123506) #b00000000000000000000000000000000) (bvslt (index!6549 lt!123506) (size!6114 (_keys!6677 thiss!1504))))) (or ((_ is Undefined!1094) lt!123506) (ite ((_ is Found!1094) lt!123506) (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6547 lt!123506)) key!932) (ite ((_ is MissingZero!1094) lt!123506) (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6546 lt!123506)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1094) lt!123506) (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6549 lt!123506)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159949 () SeekEntryResult!1094)

(assert (=> d!60389 (= lt!123506 e!159949)))

(declare-fun c!41242 () Bool)

(assert (=> d!60389 (= c!41242 (and ((_ is Intermediate!1094) lt!123507) (undefined!1906 lt!123507)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12161 (_ BitVec 32)) SeekEntryResult!1094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60389 (= lt!123507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10681 thiss!1504)) key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(assert (=> d!60389 (validMask!0 (mask!10681 thiss!1504))))

(assert (=> d!60389 (= (seekEntryOrOpen!0 key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)) lt!123506)))

(declare-fun b!246560 () Bool)

(assert (=> b!246560 (= e!159949 Undefined!1094)))

(declare-fun b!246561 () Bool)

(assert (=> b!246561 (= e!159949 e!159950)))

(declare-fun lt!123508 () (_ BitVec 64))

(assert (=> b!246561 (= lt!123508 (select (arr!5771 (_keys!6677 thiss!1504)) (index!6548 lt!123507)))))

(declare-fun c!41240 () Bool)

(assert (=> b!246561 (= c!41240 (= lt!123508 key!932))))

(declare-fun b!246562 () Bool)

(declare-fun c!41241 () Bool)

(assert (=> b!246562 (= c!41241 (= lt!123508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246562 (= e!159950 e!159948)))

(assert (= (and d!60389 c!41242) b!246560))

(assert (= (and d!60389 (not c!41242)) b!246561))

(assert (= (and b!246561 c!41240) b!246557))

(assert (= (and b!246561 (not c!41240)) b!246562))

(assert (= (and b!246562 c!41241) b!246558))

(assert (= (and b!246562 (not c!41241)) b!246559))

(declare-fun m!263931 () Bool)

(assert (=> b!246559 m!263931))

(declare-fun m!263933 () Bool)

(assert (=> d!60389 m!263933))

(assert (=> d!60389 m!263757))

(declare-fun m!263935 () Bool)

(assert (=> d!60389 m!263935))

(declare-fun m!263937 () Bool)

(assert (=> d!60389 m!263937))

(assert (=> d!60389 m!263937))

(declare-fun m!263939 () Bool)

(assert (=> d!60389 m!263939))

(declare-fun m!263941 () Bool)

(assert (=> d!60389 m!263941))

(declare-fun m!263943 () Bool)

(assert (=> b!246561 m!263943))

(assert (=> b!246341 d!60389))

(declare-fun d!60391 () Bool)

(assert (=> d!60391 (= (array_inv!3813 (_keys!6677 thiss!1504)) (bvsge (size!6114 (_keys!6677 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246340 d!60391))

(declare-fun d!60393 () Bool)

(assert (=> d!60393 (= (array_inv!3814 (_values!4541 thiss!1504)) (bvsge (size!6113 (_values!4541 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246340 d!60393))

(declare-fun d!60395 () Bool)

(declare-fun res!120893 () Bool)

(declare-fun e!159953 () Bool)

(assert (=> d!60395 (=> (not res!120893) (not e!159953))))

(declare-fun simpleValid!255 (LongMapFixedSize!3642) Bool)

(assert (=> d!60395 (= res!120893 (simpleValid!255 thiss!1504))))

(assert (=> d!60395 (= (valid!1426 thiss!1504) e!159953)))

(declare-fun b!246569 () Bool)

(declare-fun res!120894 () Bool)

(assert (=> b!246569 (=> (not res!120894) (not e!159953))))

(assert (=> b!246569 (= res!120894 (= (arrayCountValidKeys!0 (_keys!6677 thiss!1504) #b00000000000000000000000000000000 (size!6114 (_keys!6677 thiss!1504))) (_size!1870 thiss!1504)))))

(declare-fun b!246570 () Bool)

(declare-fun res!120895 () Bool)

(assert (=> b!246570 (=> (not res!120895) (not e!159953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12161 (_ BitVec 32)) Bool)

(assert (=> b!246570 (= res!120895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(declare-fun b!246571 () Bool)

(assert (=> b!246571 (= e!159953 (arrayNoDuplicates!0 (_keys!6677 thiss!1504) #b00000000000000000000000000000000 Nil!3676))))

(assert (= (and d!60395 res!120893) b!246569))

(assert (= (and b!246569 res!120894) b!246570))

(assert (= (and b!246570 res!120895) b!246571))

(declare-fun m!263945 () Bool)

(assert (=> d!60395 m!263945))

(assert (=> b!246569 m!263767))

(declare-fun m!263947 () Bool)

(assert (=> b!246570 m!263947))

(declare-fun m!263949 () Bool)

(assert (=> b!246571 m!263949))

(assert (=> start!23450 d!60395))

(declare-fun bm!23057 () Bool)

(declare-fun call!23060 () Bool)

(assert (=> bm!23057 (= call!23060 (arrayContainsKey!0 (_keys!6677 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246588 () Bool)

(declare-fun lt!123514 () SeekEntryResult!1094)

(assert (=> b!246588 (and (bvsge (index!6546 lt!123514) #b00000000000000000000000000000000) (bvslt (index!6546 lt!123514) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun res!120905 () Bool)

(assert (=> b!246588 (= res!120905 (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6546 lt!123514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159965 () Bool)

(assert (=> b!246588 (=> (not res!120905) (not e!159965))))

(declare-fun b!246589 () Bool)

(declare-fun res!120904 () Bool)

(declare-fun e!159962 () Bool)

(assert (=> b!246589 (=> (not res!120904) (not e!159962))))

(declare-fun call!23061 () Bool)

(assert (=> b!246589 (= res!120904 call!23061)))

(declare-fun e!159963 () Bool)

(assert (=> b!246589 (= e!159963 e!159962)))

(declare-fun b!246591 () Bool)

(assert (=> b!246591 (= e!159965 (not call!23060))))

(declare-fun b!246592 () Bool)

(declare-fun res!120907 () Bool)

(assert (=> b!246592 (=> (not res!120907) (not e!159962))))

(assert (=> b!246592 (= res!120907 (= (select (arr!5771 (_keys!6677 thiss!1504)) (index!6549 lt!123514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246592 (and (bvsge (index!6549 lt!123514) #b00000000000000000000000000000000) (bvslt (index!6549 lt!123514) (size!6114 (_keys!6677 thiss!1504))))))

(declare-fun d!60397 () Bool)

(declare-fun e!159964 () Bool)

(assert (=> d!60397 e!159964))

(declare-fun c!41247 () Bool)

(assert (=> d!60397 (= c!41247 ((_ is MissingZero!1094) lt!123514))))

(assert (=> d!60397 (= lt!123514 (seekEntryOrOpen!0 key!932 (_keys!6677 thiss!1504) (mask!10681 thiss!1504)))))

(declare-fun lt!123513 () Unit!7606)

(declare-fun choose!1157 (array!12161 array!12159 (_ BitVec 32) (_ BitVec 32) V!8219 V!8219 (_ BitVec 64) Int) Unit!7606)

(assert (=> d!60397 (= lt!123513 (choose!1157 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)))))

(assert (=> d!60397 (validMask!0 (mask!10681 thiss!1504))))

(assert (=> d!60397 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6677 thiss!1504) (_values!4541 thiss!1504) (mask!10681 thiss!1504) (extraKeys!4295 thiss!1504) (zeroValue!4399 thiss!1504) (minValue!4399 thiss!1504) key!932 (defaultEntry!4558 thiss!1504)) lt!123513)))

(declare-fun b!246590 () Bool)

(assert (=> b!246590 (= e!159962 (not call!23060))))

(declare-fun b!246593 () Bool)

(assert (=> b!246593 (= e!159964 e!159965)))

(declare-fun res!120906 () Bool)

(assert (=> b!246593 (= res!120906 call!23061)))

(assert (=> b!246593 (=> (not res!120906) (not e!159965))))

(declare-fun bm!23058 () Bool)

(assert (=> bm!23058 (= call!23061 (inRange!0 (ite c!41247 (index!6546 lt!123514) (index!6549 lt!123514)) (mask!10681 thiss!1504)))))

(declare-fun b!246594 () Bool)

(assert (=> b!246594 (= e!159964 e!159963)))

(declare-fun c!41248 () Bool)

(assert (=> b!246594 (= c!41248 ((_ is MissingVacant!1094) lt!123514))))

(declare-fun b!246595 () Bool)

(assert (=> b!246595 (= e!159963 ((_ is Undefined!1094) lt!123514))))

(assert (= (and d!60397 c!41247) b!246593))

(assert (= (and d!60397 (not c!41247)) b!246594))

(assert (= (and b!246593 res!120906) b!246588))

(assert (= (and b!246588 res!120905) b!246591))

(assert (= (and b!246594 c!41248) b!246589))

(assert (= (and b!246594 (not c!41248)) b!246595))

(assert (= (and b!246589 res!120904) b!246592))

(assert (= (and b!246592 res!120907) b!246590))

(assert (= (or b!246593 b!246589) bm!23058))

(assert (= (or b!246591 b!246590) bm!23057))

(declare-fun m!263951 () Bool)

(assert (=> b!246588 m!263951))

(assert (=> d!60397 m!263781))

(declare-fun m!263953 () Bool)

(assert (=> d!60397 m!263953))

(assert (=> d!60397 m!263757))

(declare-fun m!263955 () Bool)

(assert (=> bm!23058 m!263955))

(declare-fun m!263957 () Bool)

(assert (=> b!246592 m!263957))

(assert (=> bm!23057 m!263743))

(assert (=> b!246339 d!60397))

(declare-fun mapIsEmpty!10916 () Bool)

(declare-fun mapRes!10916 () Bool)

(assert (=> mapIsEmpty!10916 mapRes!10916))

(declare-fun b!246602 () Bool)

(declare-fun e!159971 () Bool)

(assert (=> b!246602 (= e!159971 tp_is_empty!6429)))

(declare-fun mapNonEmpty!10916 () Bool)

(declare-fun tp!22949 () Bool)

(assert (=> mapNonEmpty!10916 (= mapRes!10916 (and tp!22949 e!159971))))

(declare-fun mapValue!10916 () ValueCell!2871)

(declare-fun mapRest!10916 () (Array (_ BitVec 32) ValueCell!2871))

(declare-fun mapKey!10916 () (_ BitVec 32))

(assert (=> mapNonEmpty!10916 (= mapRest!10910 (store mapRest!10916 mapKey!10916 mapValue!10916))))

(declare-fun b!246603 () Bool)

(declare-fun e!159970 () Bool)

(assert (=> b!246603 (= e!159970 tp_is_empty!6429)))

(declare-fun condMapEmpty!10916 () Bool)

(declare-fun mapDefault!10916 () ValueCell!2871)

(assert (=> mapNonEmpty!10910 (= condMapEmpty!10916 (= mapRest!10910 ((as const (Array (_ BitVec 32) ValueCell!2871)) mapDefault!10916)))))

(assert (=> mapNonEmpty!10910 (= tp!22939 (and e!159970 mapRes!10916))))

(assert (= (and mapNonEmpty!10910 condMapEmpty!10916) mapIsEmpty!10916))

(assert (= (and mapNonEmpty!10910 (not condMapEmpty!10916)) mapNonEmpty!10916))

(assert (= (and mapNonEmpty!10916 ((_ is ValueCellFull!2871) mapValue!10916)) b!246602))

(assert (= (and mapNonEmpty!10910 ((_ is ValueCellFull!2871) mapDefault!10916)) b!246603))

(declare-fun m!263959 () Bool)

(assert (=> mapNonEmpty!10916 m!263959))

(declare-fun b_lambda!8041 () Bool)

(assert (= b_lambda!8039 (or (and b!246340 b_free!6567) b_lambda!8041)))

(check-sat (not b!246537) (not d!60381) (not b!246417) (not b!246569) (not bm!23049) (not b!246527) (not d!60389) b_and!13567 (not b!246529) (not bm!23027) (not b!246530) (not d!60385) (not b_lambda!8041) (not b!246470) (not bm!23058) (not d!60367) (not b!246525) (not d!60379) (not b!246430) (not b!246441) (not b!246570) (not b!246571) (not bm!23057) (not bm!23046) (not b!246535) (not b!246463) (not bm!23030) (not b!246467) (not d!60397) (not b!246451) (not b!246427) (not b!246533) (not bm!23052) (not bm!23050) (not d!60387) (not b_next!6567) (not mapNonEmpty!10916) (not b!246428) (not d!60363) (not b!246531) (not b!246477) tp_is_empty!6429 (not b!246479) (not d!60395) (not b!246442) (not bm!23031) (not b!246443) (not b!246559))
(check-sat b_and!13567 (not b_next!6567))
