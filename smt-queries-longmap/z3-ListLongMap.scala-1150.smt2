; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24140 () Bool)

(assert start!24140)

(declare-fun b!252466 () Bool)

(declare-fun b_free!6651 () Bool)

(declare-fun b_next!6651 () Bool)

(assert (=> b!252466 (= b_free!6651 (not b_next!6651))))

(declare-fun tp!23231 () Bool)

(declare-fun b_and!13687 () Bool)

(assert (=> b!252466 (= tp!23231 b_and!13687)))

(declare-fun b!252464 () Bool)

(declare-fun e!163720 () Bool)

(declare-fun e!163712 () Bool)

(assert (=> b!252464 (= e!163720 e!163712)))

(declare-fun res!123583 () Bool)

(declare-fun call!23781 () Bool)

(assert (=> b!252464 (= res!123583 call!23781)))

(assert (=> b!252464 (=> (not res!123583) (not e!163712))))

(declare-fun res!123580 () Bool)

(declare-fun e!163719 () Bool)

(assert (=> start!24140 (=> (not res!123580) (not e!163719))))

(declare-datatypes ((V!8331 0))(
  ( (V!8332 (val!3301 Int)) )
))
(declare-datatypes ((ValueCell!2913 0))(
  ( (ValueCellFull!2913 (v!5372 V!8331)) (EmptyCell!2913) )
))
(declare-datatypes ((array!12351 0))(
  ( (array!12352 (arr!5854 (Array (_ BitVec 32) ValueCell!2913)) (size!6201 (_ BitVec 32))) )
))
(declare-datatypes ((array!12353 0))(
  ( (array!12354 (arr!5855 (Array (_ BitVec 32) (_ BitVec 64))) (size!6202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3726 0))(
  ( (LongMapFixedSize!3727 (defaultEntry!4664 Int) (mask!10883 (_ BitVec 32)) (extraKeys!4401 (_ BitVec 32)) (zeroValue!4505 V!8331) (minValue!4505 V!8331) (_size!1912 (_ BitVec 32)) (_keys!6812 array!12353) (_values!4647 array!12351) (_vacant!1912 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3726)

(declare-fun valid!1458 (LongMapFixedSize!3726) Bool)

(assert (=> start!24140 (= res!123580 (valid!1458 thiss!1504))))

(assert (=> start!24140 e!163719))

(declare-fun e!163726 () Bool)

(assert (=> start!24140 e!163726))

(assert (=> start!24140 true))

(declare-fun b!252465 () Bool)

(declare-fun e!163724 () Bool)

(declare-fun tp_is_empty!6513 () Bool)

(assert (=> b!252465 (= e!163724 tp_is_empty!6513)))

(declare-fun e!163715 () Bool)

(declare-fun array_inv!3869 (array!12353) Bool)

(declare-fun array_inv!3870 (array!12351) Bool)

(assert (=> b!252466 (= e!163726 (and tp!23231 tp_is_empty!6513 (array_inv!3869 (_keys!6812 thiss!1504)) (array_inv!3870 (_values!4647 thiss!1504)) e!163715))))

(declare-fun b!252467 () Bool)

(declare-fun e!163721 () Bool)

(assert (=> b!252467 (= e!163719 e!163721)))

(declare-fun res!123588 () Bool)

(assert (=> b!252467 (=> (not res!123588) (not e!163721))))

(declare-datatypes ((SeekEntryResult!1133 0))(
  ( (MissingZero!1133 (index!6702 (_ BitVec 32))) (Found!1133 (index!6703 (_ BitVec 32))) (Intermediate!1133 (undefined!1945 Bool) (index!6704 (_ BitVec 32)) (x!24771 (_ BitVec 32))) (Undefined!1133) (MissingVacant!1133 (index!6705 (_ BitVec 32))) )
))
(declare-fun lt!126547 () SeekEntryResult!1133)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252467 (= res!123588 (or (= lt!126547 (MissingZero!1133 index!297)) (= lt!126547 (MissingVacant!1133 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12353 (_ BitVec 32)) SeekEntryResult!1133)

(assert (=> b!252467 (= lt!126547 (seekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun b!252468 () Bool)

(declare-fun e!163718 () Bool)

(declare-datatypes ((List!3742 0))(
  ( (Nil!3739) (Cons!3738 (h!4400 (_ BitVec 64)) (t!8783 List!3742)) )
))
(declare-fun arrayNoDuplicates!0 (array!12353 (_ BitVec 32) List!3742) Bool)

(assert (=> b!252468 (= e!163718 (arrayNoDuplicates!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 Nil!3739))))

(declare-fun mapNonEmpty!11076 () Bool)

(declare-fun mapRes!11076 () Bool)

(declare-fun tp!23232 () Bool)

(assert (=> mapNonEmpty!11076 (= mapRes!11076 (and tp!23232 e!163724))))

(declare-fun mapKey!11076 () (_ BitVec 32))

(declare-fun mapValue!11076 () ValueCell!2913)

(declare-fun mapRest!11076 () (Array (_ BitVec 32) ValueCell!2913))

(assert (=> mapNonEmpty!11076 (= (arr!5854 (_values!4647 thiss!1504)) (store mapRest!11076 mapKey!11076 mapValue!11076))))

(declare-fun b!252469 () Bool)

(declare-datatypes ((Unit!7815 0))(
  ( (Unit!7816) )
))
(declare-fun e!163713 () Unit!7815)

(declare-fun Unit!7817 () Unit!7815)

(assert (=> b!252469 (= e!163713 Unit!7817)))

(declare-fun lt!126551 () Unit!7815)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!405 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) Int) Unit!7815)

(assert (=> b!252469 (= lt!126551 (lemmaInListMapThenSeekEntryOrOpenFindsIt!405 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)))))

(assert (=> b!252469 false))

(declare-fun b!252470 () Bool)

(declare-fun res!123582 () Bool)

(assert (=> b!252470 (=> res!123582 e!163718)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12353 (_ BitVec 32)) Bool)

(assert (=> b!252470 (= res!123582 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6812 thiss!1504) (mask!10883 thiss!1504))))))

(declare-fun b!252471 () Bool)

(declare-fun res!123581 () Bool)

(assert (=> b!252471 (=> (not res!123581) (not e!163719))))

(assert (=> b!252471 (= res!123581 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252472 () Bool)

(declare-fun e!163722 () Bool)

(declare-fun call!23782 () Bool)

(assert (=> b!252472 (= e!163722 (not call!23782))))

(declare-fun b!252473 () Bool)

(declare-fun e!163725 () Bool)

(assert (=> b!252473 (= e!163715 (and e!163725 mapRes!11076))))

(declare-fun condMapEmpty!11076 () Bool)

(declare-fun mapDefault!11076 () ValueCell!2913)

(assert (=> b!252473 (= condMapEmpty!11076 (= (arr!5854 (_values!4647 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2913)) mapDefault!11076)))))

(declare-fun b!252474 () Bool)

(assert (=> b!252474 (= e!163725 tp_is_empty!6513)))

(declare-fun b!252475 () Bool)

(declare-fun res!123587 () Bool)

(assert (=> b!252475 (= res!123587 (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6705 lt!126547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252475 (=> (not res!123587) (not e!163712))))

(declare-fun b!252476 () Bool)

(declare-fun lt!126545 () Unit!7815)

(assert (=> b!252476 (= e!163713 lt!126545)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) Int) Unit!7815)

(assert (=> b!252476 (= lt!126545 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)))))

(declare-fun c!42541 () Bool)

(get-info :version)

(assert (=> b!252476 (= c!42541 ((_ is MissingZero!1133) lt!126547))))

(declare-fun e!163714 () Bool)

(assert (=> b!252476 e!163714))

(declare-fun b!252477 () Bool)

(declare-fun e!163716 () Unit!7815)

(declare-fun Unit!7818 () Unit!7815)

(assert (=> b!252477 (= e!163716 Unit!7818)))

(declare-fun bm!23778 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23778 (= call!23781 (inRange!0 (ite c!42541 (index!6702 lt!126547) (index!6705 lt!126547)) (mask!10883 thiss!1504)))))

(declare-fun b!252478 () Bool)

(declare-fun Unit!7819 () Unit!7815)

(assert (=> b!252478 (= e!163716 Unit!7819)))

(declare-fun lt!126548 () Unit!7815)

(declare-fun lemmaArrayContainsKeyThenInListMap!211 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) (_ BitVec 32) Int) Unit!7815)

(assert (=> b!252478 (= lt!126548 (lemmaArrayContainsKeyThenInListMap!211 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(assert (=> b!252478 false))

(declare-fun b!252479 () Bool)

(declare-fun res!123585 () Bool)

(assert (=> b!252479 (=> (not res!123585) (not e!163722))))

(assert (=> b!252479 (= res!123585 call!23781)))

(assert (=> b!252479 (= e!163714 e!163722)))

(declare-fun b!252480 () Bool)

(declare-fun res!123584 () Bool)

(assert (=> b!252480 (=> res!123584 e!163718)))

(assert (=> b!252480 (= res!123584 (or (not (= (size!6201 (_values!4647 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10883 thiss!1504)))) (not (= (size!6202 (_keys!6812 thiss!1504)) (size!6201 (_values!4647 thiss!1504)))) (bvslt (mask!10883 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4401 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4401 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252481 () Bool)

(declare-fun c!42539 () Bool)

(assert (=> b!252481 (= c!42539 ((_ is MissingVacant!1133) lt!126547))))

(assert (=> b!252481 (= e!163714 e!163720)))

(declare-fun b!252482 () Bool)

(declare-fun e!163717 () Bool)

(assert (=> b!252482 (= e!163717 (not e!163718))))

(declare-fun res!123579 () Bool)

(assert (=> b!252482 (=> res!123579 e!163718)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252482 (= res!123579 (not (validMask!0 (mask!10883 thiss!1504))))))

(declare-fun lt!126554 () array!12353)

(assert (=> b!252482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126554 (mask!10883 thiss!1504))))

(declare-fun lt!126552 () Unit!7815)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12353 (_ BitVec 32) (_ BitVec 32)) Unit!7815)

(assert (=> b!252482 (= lt!126552 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) index!297 (mask!10883 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252482 (= (arrayCountValidKeys!0 lt!126554 #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504)))))))

(declare-fun lt!126546 () Unit!7815)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12353 (_ BitVec 32) (_ BitVec 64)) Unit!7815)

(assert (=> b!252482 (= lt!126546 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6812 thiss!1504) index!297 key!932))))

(assert (=> b!252482 (arrayNoDuplicates!0 lt!126554 #b00000000000000000000000000000000 Nil!3739)))

(assert (=> b!252482 (= lt!126554 (array!12354 (store (arr!5855 (_keys!6812 thiss!1504)) index!297 key!932) (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun lt!126550 () Unit!7815)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3742) Unit!7815)

(assert (=> b!252482 (= lt!126550 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6812 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3739))))

(declare-fun lt!126553 () Unit!7815)

(assert (=> b!252482 (= lt!126553 e!163716)))

(declare-fun c!42540 () Bool)

(declare-fun arrayContainsKey!0 (array!12353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252482 (= c!42540 (arrayContainsKey!0 (_keys!6812 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252483 () Bool)

(assert (=> b!252483 (= e!163720 ((_ is Undefined!1133) lt!126547))))

(declare-fun b!252484 () Bool)

(assert (=> b!252484 (= e!163712 (not call!23782))))

(declare-fun bm!23779 () Bool)

(assert (=> bm!23779 (= call!23782 (arrayContainsKey!0 (_keys!6812 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252485 () Bool)

(assert (=> b!252485 (= e!163721 e!163717)))

(declare-fun res!123578 () Bool)

(assert (=> b!252485 (=> (not res!123578) (not e!163717))))

(assert (=> b!252485 (= res!123578 (inRange!0 index!297 (mask!10883 thiss!1504)))))

(declare-fun lt!126549 () Unit!7815)

(assert (=> b!252485 (= lt!126549 e!163713)))

(declare-fun c!42542 () Bool)

(declare-datatypes ((tuple2!4862 0))(
  ( (tuple2!4863 (_1!2442 (_ BitVec 64)) (_2!2442 V!8331)) )
))
(declare-datatypes ((List!3743 0))(
  ( (Nil!3740) (Cons!3739 (h!4401 tuple2!4862) (t!8784 List!3743)) )
))
(declare-datatypes ((ListLongMap!3775 0))(
  ( (ListLongMap!3776 (toList!1903 List!3743)) )
))
(declare-fun contains!1830 (ListLongMap!3775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1431 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 32) Int) ListLongMap!3775)

(assert (=> b!252485 (= c!42542 (contains!1830 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!11076 () Bool)

(assert (=> mapIsEmpty!11076 mapRes!11076))

(declare-fun b!252486 () Bool)

(declare-fun res!123586 () Bool)

(assert (=> b!252486 (=> (not res!123586) (not e!163722))))

(assert (=> b!252486 (= res!123586 (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6702 lt!126547)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!24140 res!123580) b!252471))

(assert (= (and b!252471 res!123581) b!252467))

(assert (= (and b!252467 res!123588) b!252485))

(assert (= (and b!252485 c!42542) b!252469))

(assert (= (and b!252485 (not c!42542)) b!252476))

(assert (= (and b!252476 c!42541) b!252479))

(assert (= (and b!252476 (not c!42541)) b!252481))

(assert (= (and b!252479 res!123585) b!252486))

(assert (= (and b!252486 res!123586) b!252472))

(assert (= (and b!252481 c!42539) b!252464))

(assert (= (and b!252481 (not c!42539)) b!252483))

(assert (= (and b!252464 res!123583) b!252475))

(assert (= (and b!252475 res!123587) b!252484))

(assert (= (or b!252479 b!252464) bm!23778))

(assert (= (or b!252472 b!252484) bm!23779))

(assert (= (and b!252485 res!123578) b!252482))

(assert (= (and b!252482 c!42540) b!252478))

(assert (= (and b!252482 (not c!42540)) b!252477))

(assert (= (and b!252482 (not res!123579)) b!252480))

(assert (= (and b!252480 (not res!123584)) b!252470))

(assert (= (and b!252470 (not res!123582)) b!252468))

(assert (= (and b!252473 condMapEmpty!11076) mapIsEmpty!11076))

(assert (= (and b!252473 (not condMapEmpty!11076)) mapNonEmpty!11076))

(assert (= (and mapNonEmpty!11076 ((_ is ValueCellFull!2913) mapValue!11076)) b!252465))

(assert (= (and b!252473 ((_ is ValueCellFull!2913) mapDefault!11076)) b!252474))

(assert (= b!252466 b!252473))

(assert (= start!24140 b!252466))

(declare-fun m!268581 () Bool)

(assert (=> b!252478 m!268581))

(declare-fun m!268583 () Bool)

(assert (=> b!252482 m!268583))

(declare-fun m!268585 () Bool)

(assert (=> b!252482 m!268585))

(declare-fun m!268587 () Bool)

(assert (=> b!252482 m!268587))

(declare-fun m!268589 () Bool)

(assert (=> b!252482 m!268589))

(declare-fun m!268591 () Bool)

(assert (=> b!252482 m!268591))

(declare-fun m!268593 () Bool)

(assert (=> b!252482 m!268593))

(declare-fun m!268595 () Bool)

(assert (=> b!252482 m!268595))

(declare-fun m!268597 () Bool)

(assert (=> b!252482 m!268597))

(declare-fun m!268599 () Bool)

(assert (=> b!252482 m!268599))

(declare-fun m!268601 () Bool)

(assert (=> b!252482 m!268601))

(declare-fun m!268603 () Bool)

(assert (=> mapNonEmpty!11076 m!268603))

(declare-fun m!268605 () Bool)

(assert (=> b!252475 m!268605))

(declare-fun m!268607 () Bool)

(assert (=> b!252486 m!268607))

(declare-fun m!268609 () Bool)

(assert (=> b!252469 m!268609))

(declare-fun m!268611 () Bool)

(assert (=> b!252476 m!268611))

(declare-fun m!268613 () Bool)

(assert (=> b!252467 m!268613))

(declare-fun m!268615 () Bool)

(assert (=> b!252470 m!268615))

(assert (=> bm!23779 m!268585))

(declare-fun m!268617 () Bool)

(assert (=> b!252485 m!268617))

(declare-fun m!268619 () Bool)

(assert (=> b!252485 m!268619))

(assert (=> b!252485 m!268619))

(declare-fun m!268621 () Bool)

(assert (=> b!252485 m!268621))

(declare-fun m!268623 () Bool)

(assert (=> b!252468 m!268623))

(declare-fun m!268625 () Bool)

(assert (=> bm!23778 m!268625))

(declare-fun m!268627 () Bool)

(assert (=> start!24140 m!268627))

(declare-fun m!268629 () Bool)

(assert (=> b!252466 m!268629))

(declare-fun m!268631 () Bool)

(assert (=> b!252466 m!268631))

(check-sat (not b!252485) (not b!252466) (not b!252469) (not b_next!6651) (not b!252478) tp_is_empty!6513 (not b!252467) (not b!252482) (not start!24140) (not b!252470) b_and!13687 (not b!252468) (not bm!23779) (not b!252476) (not bm!23778) (not mapNonEmpty!11076))
(check-sat b_and!13687 (not b_next!6651))
(get-model)

(declare-fun d!61337 () Bool)

(declare-fun res!123626 () Bool)

(declare-fun e!163780 () Bool)

(assert (=> d!61337 (=> res!123626 e!163780)))

(assert (=> d!61337 (= res!123626 (bvsge #b00000000000000000000000000000000 (size!6202 lt!126554)))))

(assert (=> d!61337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126554 (mask!10883 thiss!1504)) e!163780)))

(declare-fun b!252564 () Bool)

(declare-fun e!163779 () Bool)

(declare-fun call!23791 () Bool)

(assert (=> b!252564 (= e!163779 call!23791)))

(declare-fun bm!23788 () Bool)

(assert (=> bm!23788 (= call!23791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126554 (mask!10883 thiss!1504)))))

(declare-fun b!252565 () Bool)

(declare-fun e!163778 () Bool)

(assert (=> b!252565 (= e!163779 e!163778)))

(declare-fun lt!126593 () (_ BitVec 64))

(assert (=> b!252565 (= lt!126593 (select (arr!5855 lt!126554) #b00000000000000000000000000000000))))

(declare-fun lt!126592 () Unit!7815)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12353 (_ BitVec 64) (_ BitVec 32)) Unit!7815)

(assert (=> b!252565 (= lt!126592 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126554 lt!126593 #b00000000000000000000000000000000))))

(assert (=> b!252565 (arrayContainsKey!0 lt!126554 lt!126593 #b00000000000000000000000000000000)))

(declare-fun lt!126591 () Unit!7815)

(assert (=> b!252565 (= lt!126591 lt!126592)))

(declare-fun res!123627 () Bool)

(assert (=> b!252565 (= res!123627 (= (seekEntryOrOpen!0 (select (arr!5855 lt!126554) #b00000000000000000000000000000000) lt!126554 (mask!10883 thiss!1504)) (Found!1133 #b00000000000000000000000000000000)))))

(assert (=> b!252565 (=> (not res!123627) (not e!163778))))

(declare-fun b!252566 () Bool)

(assert (=> b!252566 (= e!163778 call!23791)))

(declare-fun b!252567 () Bool)

(assert (=> b!252567 (= e!163780 e!163779)))

(declare-fun c!42557 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252567 (= c!42557 (validKeyInArray!0 (select (arr!5855 lt!126554) #b00000000000000000000000000000000)))))

(assert (= (and d!61337 (not res!123626)) b!252567))

(assert (= (and b!252567 c!42557) b!252565))

(assert (= (and b!252567 (not c!42557)) b!252564))

(assert (= (and b!252565 res!123627) b!252566))

(assert (= (or b!252566 b!252564) bm!23788))

(declare-fun m!268685 () Bool)

(assert (=> bm!23788 m!268685))

(declare-fun m!268687 () Bool)

(assert (=> b!252565 m!268687))

(declare-fun m!268689 () Bool)

(assert (=> b!252565 m!268689))

(declare-fun m!268691 () Bool)

(assert (=> b!252565 m!268691))

(assert (=> b!252565 m!268687))

(declare-fun m!268693 () Bool)

(assert (=> b!252565 m!268693))

(assert (=> b!252567 m!268687))

(assert (=> b!252567 m!268687))

(declare-fun m!268695 () Bool)

(assert (=> b!252567 m!268695))

(assert (=> b!252482 d!61337))

(declare-fun d!61339 () Bool)

(declare-fun e!163785 () Bool)

(assert (=> d!61339 e!163785))

(declare-fun res!123637 () Bool)

(assert (=> d!61339 (=> (not res!123637) (not e!163785))))

(assert (=> d!61339 (= res!123637 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6812 thiss!1504)))))))

(declare-fun lt!126596 () Unit!7815)

(declare-fun choose!1 (array!12353 (_ BitVec 32) (_ BitVec 64)) Unit!7815)

(assert (=> d!61339 (= lt!126596 (choose!1 (_keys!6812 thiss!1504) index!297 key!932))))

(declare-fun e!163786 () Bool)

(assert (=> d!61339 e!163786))

(declare-fun res!123638 () Bool)

(assert (=> d!61339 (=> (not res!123638) (not e!163786))))

(assert (=> d!61339 (= res!123638 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6812 thiss!1504)))))))

(assert (=> d!61339 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6812 thiss!1504) index!297 key!932) lt!126596)))

(declare-fun b!252578 () Bool)

(assert (=> b!252578 (= e!163786 (bvslt (size!6202 (_keys!6812 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!252579 () Bool)

(assert (=> b!252579 (= e!163785 (= (arrayCountValidKeys!0 (array!12354 (store (arr!5855 (_keys!6812 thiss!1504)) index!297 key!932) (size!6202 (_keys!6812 thiss!1504))) #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252577 () Bool)

(declare-fun res!123639 () Bool)

(assert (=> b!252577 (=> (not res!123639) (not e!163786))))

(assert (=> b!252577 (= res!123639 (validKeyInArray!0 key!932))))

(declare-fun b!252576 () Bool)

(declare-fun res!123636 () Bool)

(assert (=> b!252576 (=> (not res!123636) (not e!163786))))

(assert (=> b!252576 (= res!123636 (not (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) index!297))))))

(assert (= (and d!61339 res!123638) b!252576))

(assert (= (and b!252576 res!123636) b!252577))

(assert (= (and b!252577 res!123639) b!252578))

(assert (= (and d!61339 res!123637) b!252579))

(declare-fun m!268697 () Bool)

(assert (=> d!61339 m!268697))

(assert (=> b!252579 m!268597))

(declare-fun m!268699 () Bool)

(assert (=> b!252579 m!268699))

(assert (=> b!252579 m!268599))

(declare-fun m!268701 () Bool)

(assert (=> b!252577 m!268701))

(declare-fun m!268703 () Bool)

(assert (=> b!252576 m!268703))

(assert (=> b!252576 m!268703))

(declare-fun m!268705 () Bool)

(assert (=> b!252576 m!268705))

(assert (=> b!252482 d!61339))

(declare-fun bm!23791 () Bool)

(declare-fun call!23794 () Bool)

(declare-fun c!42560 () Bool)

(assert (=> bm!23791 (= call!23794 (arrayNoDuplicates!0 lt!126554 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42560 (Cons!3738 (select (arr!5855 lt!126554) #b00000000000000000000000000000000) Nil!3739) Nil!3739)))))

(declare-fun b!252590 () Bool)

(declare-fun e!163798 () Bool)

(assert (=> b!252590 (= e!163798 call!23794)))

(declare-fun d!61341 () Bool)

(declare-fun res!123646 () Bool)

(declare-fun e!163797 () Bool)

(assert (=> d!61341 (=> res!123646 e!163797)))

(assert (=> d!61341 (= res!123646 (bvsge #b00000000000000000000000000000000 (size!6202 lt!126554)))))

(assert (=> d!61341 (= (arrayNoDuplicates!0 lt!126554 #b00000000000000000000000000000000 Nil!3739) e!163797)))

(declare-fun b!252591 () Bool)

(assert (=> b!252591 (= e!163798 call!23794)))

(declare-fun b!252592 () Bool)

(declare-fun e!163796 () Bool)

(declare-fun contains!1832 (List!3742 (_ BitVec 64)) Bool)

(assert (=> b!252592 (= e!163796 (contains!1832 Nil!3739 (select (arr!5855 lt!126554) #b00000000000000000000000000000000)))))

(declare-fun b!252593 () Bool)

(declare-fun e!163795 () Bool)

(assert (=> b!252593 (= e!163797 e!163795)))

(declare-fun res!123648 () Bool)

(assert (=> b!252593 (=> (not res!123648) (not e!163795))))

(assert (=> b!252593 (= res!123648 (not e!163796))))

(declare-fun res!123647 () Bool)

(assert (=> b!252593 (=> (not res!123647) (not e!163796))))

(assert (=> b!252593 (= res!123647 (validKeyInArray!0 (select (arr!5855 lt!126554) #b00000000000000000000000000000000)))))

(declare-fun b!252594 () Bool)

(assert (=> b!252594 (= e!163795 e!163798)))

(assert (=> b!252594 (= c!42560 (validKeyInArray!0 (select (arr!5855 lt!126554) #b00000000000000000000000000000000)))))

(assert (= (and d!61341 (not res!123646)) b!252593))

(assert (= (and b!252593 res!123647) b!252592))

(assert (= (and b!252593 res!123648) b!252594))

(assert (= (and b!252594 c!42560) b!252590))

(assert (= (and b!252594 (not c!42560)) b!252591))

(assert (= (or b!252590 b!252591) bm!23791))

(assert (=> bm!23791 m!268687))

(declare-fun m!268707 () Bool)

(assert (=> bm!23791 m!268707))

(assert (=> b!252592 m!268687))

(assert (=> b!252592 m!268687))

(declare-fun m!268709 () Bool)

(assert (=> b!252592 m!268709))

(assert (=> b!252593 m!268687))

(assert (=> b!252593 m!268687))

(assert (=> b!252593 m!268695))

(assert (=> b!252594 m!268687))

(assert (=> b!252594 m!268687))

(assert (=> b!252594 m!268695))

(assert (=> b!252482 d!61341))

(declare-fun b!252603 () Bool)

(declare-fun e!163804 () (_ BitVec 32))

(declare-fun e!163803 () (_ BitVec 32))

(assert (=> b!252603 (= e!163804 e!163803)))

(declare-fun c!42566 () Bool)

(assert (=> b!252603 (= c!42566 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252604 () Bool)

(declare-fun call!23797 () (_ BitVec 32))

(assert (=> b!252604 (= e!163803 (bvadd #b00000000000000000000000000000001 call!23797))))

(declare-fun b!252605 () Bool)

(assert (=> b!252605 (= e!163803 call!23797)))

(declare-fun b!252606 () Bool)

(assert (=> b!252606 (= e!163804 #b00000000000000000000000000000000)))

(declare-fun d!61343 () Bool)

(declare-fun lt!126599 () (_ BitVec 32))

(assert (=> d!61343 (and (bvsge lt!126599 #b00000000000000000000000000000000) (bvsle lt!126599 (bvsub (size!6202 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61343 (= lt!126599 e!163804)))

(declare-fun c!42565 () Bool)

(assert (=> d!61343 (= c!42565 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61343 (and (bvsle #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6202 (_keys!6812 thiss!1504)) (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61343 (= (arrayCountValidKeys!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) lt!126599)))

(declare-fun bm!23794 () Bool)

(assert (=> bm!23794 (= call!23797 (arrayCountValidKeys!0 (_keys!6812 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6812 thiss!1504))))))

(assert (= (and d!61343 c!42565) b!252606))

(assert (= (and d!61343 (not c!42565)) b!252603))

(assert (= (and b!252603 c!42566) b!252604))

(assert (= (and b!252603 (not c!42566)) b!252605))

(assert (= (or b!252604 b!252605) bm!23794))

(declare-fun m!268711 () Bool)

(assert (=> b!252603 m!268711))

(assert (=> b!252603 m!268711))

(declare-fun m!268713 () Bool)

(assert (=> b!252603 m!268713))

(declare-fun m!268715 () Bool)

(assert (=> bm!23794 m!268715))

(assert (=> b!252482 d!61343))

(declare-fun d!61345 () Bool)

(assert (=> d!61345 (= (validMask!0 (mask!10883 thiss!1504)) (and (or (= (mask!10883 thiss!1504) #b00000000000000000000000000000111) (= (mask!10883 thiss!1504) #b00000000000000000000000000001111) (= (mask!10883 thiss!1504) #b00000000000000000000000000011111) (= (mask!10883 thiss!1504) #b00000000000000000000000000111111) (= (mask!10883 thiss!1504) #b00000000000000000000000001111111) (= (mask!10883 thiss!1504) #b00000000000000000000000011111111) (= (mask!10883 thiss!1504) #b00000000000000000000000111111111) (= (mask!10883 thiss!1504) #b00000000000000000000001111111111) (= (mask!10883 thiss!1504) #b00000000000000000000011111111111) (= (mask!10883 thiss!1504) #b00000000000000000000111111111111) (= (mask!10883 thiss!1504) #b00000000000000000001111111111111) (= (mask!10883 thiss!1504) #b00000000000000000011111111111111) (= (mask!10883 thiss!1504) #b00000000000000000111111111111111) (= (mask!10883 thiss!1504) #b00000000000000001111111111111111) (= (mask!10883 thiss!1504) #b00000000000000011111111111111111) (= (mask!10883 thiss!1504) #b00000000000000111111111111111111) (= (mask!10883 thiss!1504) #b00000000000001111111111111111111) (= (mask!10883 thiss!1504) #b00000000000011111111111111111111) (= (mask!10883 thiss!1504) #b00000000000111111111111111111111) (= (mask!10883 thiss!1504) #b00000000001111111111111111111111) (= (mask!10883 thiss!1504) #b00000000011111111111111111111111) (= (mask!10883 thiss!1504) #b00000000111111111111111111111111) (= (mask!10883 thiss!1504) #b00000001111111111111111111111111) (= (mask!10883 thiss!1504) #b00000011111111111111111111111111) (= (mask!10883 thiss!1504) #b00000111111111111111111111111111) (= (mask!10883 thiss!1504) #b00001111111111111111111111111111) (= (mask!10883 thiss!1504) #b00011111111111111111111111111111) (= (mask!10883 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10883 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252482 d!61345))

(declare-fun b!252607 () Bool)

(declare-fun e!163806 () (_ BitVec 32))

(declare-fun e!163805 () (_ BitVec 32))

(assert (=> b!252607 (= e!163806 e!163805)))

(declare-fun c!42568 () Bool)

(assert (=> b!252607 (= c!42568 (validKeyInArray!0 (select (arr!5855 lt!126554) #b00000000000000000000000000000000)))))

(declare-fun b!252608 () Bool)

(declare-fun call!23798 () (_ BitVec 32))

(assert (=> b!252608 (= e!163805 (bvadd #b00000000000000000000000000000001 call!23798))))

(declare-fun b!252609 () Bool)

(assert (=> b!252609 (= e!163805 call!23798)))

(declare-fun b!252610 () Bool)

(assert (=> b!252610 (= e!163806 #b00000000000000000000000000000000)))

(declare-fun d!61347 () Bool)

(declare-fun lt!126600 () (_ BitVec 32))

(assert (=> d!61347 (and (bvsge lt!126600 #b00000000000000000000000000000000) (bvsle lt!126600 (bvsub (size!6202 lt!126554) #b00000000000000000000000000000000)))))

(assert (=> d!61347 (= lt!126600 e!163806)))

(declare-fun c!42567 () Bool)

(assert (=> d!61347 (= c!42567 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61347 (and (bvsle #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6202 (_keys!6812 thiss!1504)) (size!6202 lt!126554)))))

(assert (=> d!61347 (= (arrayCountValidKeys!0 lt!126554 #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) lt!126600)))

(declare-fun bm!23795 () Bool)

(assert (=> bm!23795 (= call!23798 (arrayCountValidKeys!0 lt!126554 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6812 thiss!1504))))))

(assert (= (and d!61347 c!42567) b!252610))

(assert (= (and d!61347 (not c!42567)) b!252607))

(assert (= (and b!252607 c!42568) b!252608))

(assert (= (and b!252607 (not c!42568)) b!252609))

(assert (= (or b!252608 b!252609) bm!23795))

(assert (=> b!252607 m!268687))

(assert (=> b!252607 m!268687))

(assert (=> b!252607 m!268695))

(declare-fun m!268717 () Bool)

(assert (=> bm!23795 m!268717))

(assert (=> b!252482 d!61347))

(declare-fun d!61349 () Bool)

(declare-fun e!163809 () Bool)

(assert (=> d!61349 e!163809))

(declare-fun res!123651 () Bool)

(assert (=> d!61349 (=> (not res!123651) (not e!163809))))

(assert (=> d!61349 (= res!123651 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6812 thiss!1504)))))))

(declare-fun lt!126603 () Unit!7815)

(declare-fun choose!41 (array!12353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3742) Unit!7815)

(assert (=> d!61349 (= lt!126603 (choose!41 (_keys!6812 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3739))))

(assert (=> d!61349 (bvslt (size!6202 (_keys!6812 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61349 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6812 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3739) lt!126603)))

(declare-fun b!252613 () Bool)

(assert (=> b!252613 (= e!163809 (arrayNoDuplicates!0 (array!12354 (store (arr!5855 (_keys!6812 thiss!1504)) index!297 key!932) (size!6202 (_keys!6812 thiss!1504))) #b00000000000000000000000000000000 Nil!3739))))

(assert (= (and d!61349 res!123651) b!252613))

(declare-fun m!268719 () Bool)

(assert (=> d!61349 m!268719))

(assert (=> b!252613 m!268597))

(declare-fun m!268721 () Bool)

(assert (=> b!252613 m!268721))

(assert (=> b!252482 d!61349))

(declare-fun d!61351 () Bool)

(declare-fun res!123656 () Bool)

(declare-fun e!163814 () Bool)

(assert (=> d!61351 (=> res!123656 e!163814)))

(assert (=> d!61351 (= res!123656 (= (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61351 (= (arrayContainsKey!0 (_keys!6812 thiss!1504) key!932 #b00000000000000000000000000000000) e!163814)))

(declare-fun b!252618 () Bool)

(declare-fun e!163815 () Bool)

(assert (=> b!252618 (= e!163814 e!163815)))

(declare-fun res!123657 () Bool)

(assert (=> b!252618 (=> (not res!123657) (not e!163815))))

(assert (=> b!252618 (= res!123657 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun b!252619 () Bool)

(assert (=> b!252619 (= e!163815 (arrayContainsKey!0 (_keys!6812 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61351 (not res!123656)) b!252618))

(assert (= (and b!252618 res!123657) b!252619))

(assert (=> d!61351 m!268711))

(declare-fun m!268723 () Bool)

(assert (=> b!252619 m!268723))

(assert (=> b!252482 d!61351))

(declare-fun d!61353 () Bool)

(declare-fun e!163818 () Bool)

(assert (=> d!61353 e!163818))

(declare-fun res!123660 () Bool)

(assert (=> d!61353 (=> (not res!123660) (not e!163818))))

(assert (=> d!61353 (= res!123660 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6202 (_keys!6812 thiss!1504)))))))

(declare-fun lt!126606 () Unit!7815)

(declare-fun choose!102 ((_ BitVec 64) array!12353 (_ BitVec 32) (_ BitVec 32)) Unit!7815)

(assert (=> d!61353 (= lt!126606 (choose!102 key!932 (_keys!6812 thiss!1504) index!297 (mask!10883 thiss!1504)))))

(assert (=> d!61353 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61353 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) index!297 (mask!10883 thiss!1504)) lt!126606)))

(declare-fun b!252622 () Bool)

(assert (=> b!252622 (= e!163818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12354 (store (arr!5855 (_keys!6812 thiss!1504)) index!297 key!932) (size!6202 (_keys!6812 thiss!1504))) (mask!10883 thiss!1504)))))

(assert (= (and d!61353 res!123660) b!252622))

(declare-fun m!268725 () Bool)

(assert (=> d!61353 m!268725))

(assert (=> d!61353 m!268583))

(assert (=> b!252622 m!268597))

(declare-fun m!268727 () Bool)

(assert (=> b!252622 m!268727))

(assert (=> b!252482 d!61353))

(declare-fun d!61355 () Bool)

(declare-fun e!163821 () Bool)

(assert (=> d!61355 e!163821))

(declare-fun res!123665 () Bool)

(assert (=> d!61355 (=> (not res!123665) (not e!163821))))

(declare-fun lt!126612 () SeekEntryResult!1133)

(assert (=> d!61355 (= res!123665 ((_ is Found!1133) lt!126612))))

(assert (=> d!61355 (= lt!126612 (seekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun lt!126611 () Unit!7815)

(declare-fun choose!1203 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) Int) Unit!7815)

(assert (=> d!61355 (= lt!126611 (choose!1203 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)))))

(assert (=> d!61355 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61355 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!405 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)) lt!126611)))

(declare-fun b!252627 () Bool)

(declare-fun res!123666 () Bool)

(assert (=> b!252627 (=> (not res!123666) (not e!163821))))

(assert (=> b!252627 (= res!123666 (inRange!0 (index!6703 lt!126612) (mask!10883 thiss!1504)))))

(declare-fun b!252628 () Bool)

(assert (=> b!252628 (= e!163821 (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6703 lt!126612)) key!932))))

(assert (=> b!252628 (and (bvsge (index!6703 lt!126612) #b00000000000000000000000000000000) (bvslt (index!6703 lt!126612) (size!6202 (_keys!6812 thiss!1504))))))

(assert (= (and d!61355 res!123665) b!252627))

(assert (= (and b!252627 res!123666) b!252628))

(assert (=> d!61355 m!268613))

(declare-fun m!268729 () Bool)

(assert (=> d!61355 m!268729))

(assert (=> d!61355 m!268583))

(declare-fun m!268731 () Bool)

(assert (=> b!252627 m!268731))

(declare-fun m!268733 () Bool)

(assert (=> b!252628 m!268733))

(assert (=> b!252469 d!61355))

(declare-fun d!61357 () Bool)

(assert (=> d!61357 (contains!1830 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)) key!932)))

(declare-fun lt!126615 () Unit!7815)

(declare-fun choose!1204 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) (_ BitVec 32) Int) Unit!7815)

(assert (=> d!61357 (= lt!126615 (choose!1204 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(assert (=> d!61357 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61357 (= (lemmaArrayContainsKeyThenInListMap!211 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)) lt!126615)))

(declare-fun bs!9031 () Bool)

(assert (= bs!9031 d!61357))

(assert (=> bs!9031 m!268619))

(assert (=> bs!9031 m!268619))

(assert (=> bs!9031 m!268621))

(declare-fun m!268735 () Bool)

(assert (=> bs!9031 m!268735))

(assert (=> bs!9031 m!268583))

(assert (=> b!252478 d!61357))

(declare-fun d!61359 () Bool)

(declare-fun res!123667 () Bool)

(declare-fun e!163824 () Bool)

(assert (=> d!61359 (=> res!123667 e!163824)))

(assert (=> d!61359 (= res!123667 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)) e!163824)))

(declare-fun b!252629 () Bool)

(declare-fun e!163823 () Bool)

(declare-fun call!23799 () Bool)

(assert (=> b!252629 (= e!163823 call!23799)))

(declare-fun bm!23796 () Bool)

(assert (=> bm!23796 (= call!23799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun b!252630 () Bool)

(declare-fun e!163822 () Bool)

(assert (=> b!252630 (= e!163823 e!163822)))

(declare-fun lt!126618 () (_ BitVec 64))

(assert (=> b!252630 (= lt!126618 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126617 () Unit!7815)

(assert (=> b!252630 (= lt!126617 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6812 thiss!1504) lt!126618 #b00000000000000000000000000000000))))

(assert (=> b!252630 (arrayContainsKey!0 (_keys!6812 thiss!1504) lt!126618 #b00000000000000000000000000000000)))

(declare-fun lt!126616 () Unit!7815)

(assert (=> b!252630 (= lt!126616 lt!126617)))

(declare-fun res!123668 () Bool)

(assert (=> b!252630 (= res!123668 (= (seekEntryOrOpen!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000) (_keys!6812 thiss!1504) (mask!10883 thiss!1504)) (Found!1133 #b00000000000000000000000000000000)))))

(assert (=> b!252630 (=> (not res!123668) (not e!163822))))

(declare-fun b!252631 () Bool)

(assert (=> b!252631 (= e!163822 call!23799)))

(declare-fun b!252632 () Bool)

(assert (=> b!252632 (= e!163824 e!163823)))

(declare-fun c!42569 () Bool)

(assert (=> b!252632 (= c!42569 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61359 (not res!123667)) b!252632))

(assert (= (and b!252632 c!42569) b!252630))

(assert (= (and b!252632 (not c!42569)) b!252629))

(assert (= (and b!252630 res!123668) b!252631))

(assert (= (or b!252631 b!252629) bm!23796))

(declare-fun m!268737 () Bool)

(assert (=> bm!23796 m!268737))

(assert (=> b!252630 m!268711))

(declare-fun m!268739 () Bool)

(assert (=> b!252630 m!268739))

(declare-fun m!268741 () Bool)

(assert (=> b!252630 m!268741))

(assert (=> b!252630 m!268711))

(declare-fun m!268743 () Bool)

(assert (=> b!252630 m!268743))

(assert (=> b!252632 m!268711))

(assert (=> b!252632 m!268711))

(assert (=> b!252632 m!268713))

(assert (=> b!252470 d!61359))

(declare-fun d!61361 () Bool)

(declare-fun res!123675 () Bool)

(declare-fun e!163827 () Bool)

(assert (=> d!61361 (=> (not res!123675) (not e!163827))))

(declare-fun simpleValid!267 (LongMapFixedSize!3726) Bool)

(assert (=> d!61361 (= res!123675 (simpleValid!267 thiss!1504))))

(assert (=> d!61361 (= (valid!1458 thiss!1504) e!163827)))

(declare-fun b!252639 () Bool)

(declare-fun res!123676 () Bool)

(assert (=> b!252639 (=> (not res!123676) (not e!163827))))

(assert (=> b!252639 (= res!123676 (= (arrayCountValidKeys!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (_size!1912 thiss!1504)))))

(declare-fun b!252640 () Bool)

(declare-fun res!123677 () Bool)

(assert (=> b!252640 (=> (not res!123677) (not e!163827))))

(assert (=> b!252640 (= res!123677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun b!252641 () Bool)

(assert (=> b!252641 (= e!163827 (arrayNoDuplicates!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 Nil!3739))))

(assert (= (and d!61361 res!123675) b!252639))

(assert (= (and b!252639 res!123676) b!252640))

(assert (= (and b!252640 res!123677) b!252641))

(declare-fun m!268745 () Bool)

(assert (=> d!61361 m!268745))

(assert (=> b!252639 m!268599))

(assert (=> b!252640 m!268615))

(assert (=> b!252641 m!268623))

(assert (=> start!24140 d!61361))

(declare-fun b!252654 () Bool)

(declare-fun e!163836 () SeekEntryResult!1133)

(declare-fun lt!126627 () SeekEntryResult!1133)

(assert (=> b!252654 (= e!163836 (MissingZero!1133 (index!6704 lt!126627)))))

(declare-fun d!61363 () Bool)

(declare-fun lt!126625 () SeekEntryResult!1133)

(assert (=> d!61363 (and (or ((_ is Undefined!1133) lt!126625) (not ((_ is Found!1133) lt!126625)) (and (bvsge (index!6703 lt!126625) #b00000000000000000000000000000000) (bvslt (index!6703 lt!126625) (size!6202 (_keys!6812 thiss!1504))))) (or ((_ is Undefined!1133) lt!126625) ((_ is Found!1133) lt!126625) (not ((_ is MissingZero!1133) lt!126625)) (and (bvsge (index!6702 lt!126625) #b00000000000000000000000000000000) (bvslt (index!6702 lt!126625) (size!6202 (_keys!6812 thiss!1504))))) (or ((_ is Undefined!1133) lt!126625) ((_ is Found!1133) lt!126625) ((_ is MissingZero!1133) lt!126625) (not ((_ is MissingVacant!1133) lt!126625)) (and (bvsge (index!6705 lt!126625) #b00000000000000000000000000000000) (bvslt (index!6705 lt!126625) (size!6202 (_keys!6812 thiss!1504))))) (or ((_ is Undefined!1133) lt!126625) (ite ((_ is Found!1133) lt!126625) (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6703 lt!126625)) key!932) (ite ((_ is MissingZero!1133) lt!126625) (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6702 lt!126625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1133) lt!126625) (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6705 lt!126625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!163834 () SeekEntryResult!1133)

(assert (=> d!61363 (= lt!126625 e!163834)))

(declare-fun c!42577 () Bool)

(assert (=> d!61363 (= c!42577 (and ((_ is Intermediate!1133) lt!126627) (undefined!1945 lt!126627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12353 (_ BitVec 32)) SeekEntryResult!1133)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61363 (= lt!126627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10883 thiss!1504)) key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(assert (=> d!61363 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61363 (= (seekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)) lt!126625)))

(declare-fun b!252655 () Bool)

(declare-fun e!163835 () SeekEntryResult!1133)

(assert (=> b!252655 (= e!163835 (Found!1133 (index!6704 lt!126627)))))

(declare-fun b!252656 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12353 (_ BitVec 32)) SeekEntryResult!1133)

(assert (=> b!252656 (= e!163836 (seekKeyOrZeroReturnVacant!0 (x!24771 lt!126627) (index!6704 lt!126627) (index!6704 lt!126627) key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun b!252657 () Bool)

(assert (=> b!252657 (= e!163834 e!163835)))

(declare-fun lt!126626 () (_ BitVec 64))

(assert (=> b!252657 (= lt!126626 (select (arr!5855 (_keys!6812 thiss!1504)) (index!6704 lt!126627)))))

(declare-fun c!42576 () Bool)

(assert (=> b!252657 (= c!42576 (= lt!126626 key!932))))

(declare-fun b!252658 () Bool)

(declare-fun c!42578 () Bool)

(assert (=> b!252658 (= c!42578 (= lt!126626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252658 (= e!163835 e!163836)))

(declare-fun b!252659 () Bool)

(assert (=> b!252659 (= e!163834 Undefined!1133)))

(assert (= (and d!61363 c!42577) b!252659))

(assert (= (and d!61363 (not c!42577)) b!252657))

(assert (= (and b!252657 c!42576) b!252655))

(assert (= (and b!252657 (not c!42576)) b!252658))

(assert (= (and b!252658 c!42578) b!252654))

(assert (= (and b!252658 (not c!42578)) b!252656))

(declare-fun m!268747 () Bool)

(assert (=> d!61363 m!268747))

(declare-fun m!268749 () Bool)

(assert (=> d!61363 m!268749))

(declare-fun m!268751 () Bool)

(assert (=> d!61363 m!268751))

(declare-fun m!268753 () Bool)

(assert (=> d!61363 m!268753))

(declare-fun m!268755 () Bool)

(assert (=> d!61363 m!268755))

(assert (=> d!61363 m!268583))

(assert (=> d!61363 m!268747))

(declare-fun m!268757 () Bool)

(assert (=> b!252656 m!268757))

(declare-fun m!268759 () Bool)

(assert (=> b!252657 m!268759))

(assert (=> b!252467 d!61363))

(declare-fun d!61365 () Bool)

(assert (=> d!61365 (= (inRange!0 index!297 (mask!10883 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10883 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252485 d!61365))

(declare-fun d!61367 () Bool)

(declare-fun e!163842 () Bool)

(assert (=> d!61367 e!163842))

(declare-fun res!123680 () Bool)

(assert (=> d!61367 (=> res!123680 e!163842)))

(declare-fun lt!126637 () Bool)

(assert (=> d!61367 (= res!123680 (not lt!126637))))

(declare-fun lt!126639 () Bool)

(assert (=> d!61367 (= lt!126637 lt!126639)))

(declare-fun lt!126636 () Unit!7815)

(declare-fun e!163841 () Unit!7815)

(assert (=> d!61367 (= lt!126636 e!163841)))

(declare-fun c!42581 () Bool)

(assert (=> d!61367 (= c!42581 lt!126639)))

(declare-fun containsKey!294 (List!3743 (_ BitVec 64)) Bool)

(assert (=> d!61367 (= lt!126639 (containsKey!294 (toList!1903 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504))) key!932))))

(assert (=> d!61367 (= (contains!1830 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)) key!932) lt!126637)))

(declare-fun b!252666 () Bool)

(declare-fun lt!126638 () Unit!7815)

(assert (=> b!252666 (= e!163841 lt!126638)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!242 (List!3743 (_ BitVec 64)) Unit!7815)

(assert (=> b!252666 (= lt!126638 (lemmaContainsKeyImpliesGetValueByKeyDefined!242 (toList!1903 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504))) key!932))))

(declare-datatypes ((Option!308 0))(
  ( (Some!307 (v!5374 V!8331)) (None!306) )
))
(declare-fun isDefined!243 (Option!308) Bool)

(declare-fun getValueByKey!302 (List!3743 (_ BitVec 64)) Option!308)

(assert (=> b!252666 (isDefined!243 (getValueByKey!302 (toList!1903 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504))) key!932))))

(declare-fun b!252667 () Bool)

(declare-fun Unit!7823 () Unit!7815)

(assert (=> b!252667 (= e!163841 Unit!7823)))

(declare-fun b!252668 () Bool)

(assert (=> b!252668 (= e!163842 (isDefined!243 (getValueByKey!302 (toList!1903 (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504))) key!932)))))

(assert (= (and d!61367 c!42581) b!252666))

(assert (= (and d!61367 (not c!42581)) b!252667))

(assert (= (and d!61367 (not res!123680)) b!252668))

(declare-fun m!268761 () Bool)

(assert (=> d!61367 m!268761))

(declare-fun m!268763 () Bool)

(assert (=> b!252666 m!268763))

(declare-fun m!268765 () Bool)

(assert (=> b!252666 m!268765))

(assert (=> b!252666 m!268765))

(declare-fun m!268767 () Bool)

(assert (=> b!252666 m!268767))

(assert (=> b!252668 m!268765))

(assert (=> b!252668 m!268765))

(assert (=> b!252668 m!268767))

(assert (=> b!252485 d!61367))

(declare-fun call!23814 () ListLongMap!3775)

(declare-fun c!42595 () Bool)

(declare-fun bm!23811 () Bool)

(declare-fun call!23820 () ListLongMap!3775)

(declare-fun call!23817 () ListLongMap!3775)

(declare-fun call!23816 () ListLongMap!3775)

(declare-fun c!42599 () Bool)

(declare-fun +!671 (ListLongMap!3775 tuple2!4862) ListLongMap!3775)

(assert (=> bm!23811 (= call!23820 (+!671 (ite c!42595 call!23817 (ite c!42599 call!23814 call!23816)) (ite (or c!42595 c!42599) (tuple2!4863 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4505 thiss!1504)) (tuple2!4863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4505 thiss!1504)))))))

(declare-fun b!252711 () Bool)

(declare-fun c!42596 () Bool)

(assert (=> b!252711 (= c!42596 (and (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163878 () ListLongMap!3775)

(declare-fun e!163879 () ListLongMap!3775)

(assert (=> b!252711 (= e!163878 e!163879)))

(declare-fun b!252712 () Bool)

(declare-fun e!163869 () Bool)

(declare-fun lt!126700 () ListLongMap!3775)

(declare-fun apply!244 (ListLongMap!3775 (_ BitVec 64)) V!8331)

(assert (=> b!252712 (= e!163869 (= (apply!244 lt!126700 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4505 thiss!1504)))))

(declare-fun b!252713 () Bool)

(declare-fun e!163871 () Unit!7815)

(declare-fun lt!126701 () Unit!7815)

(assert (=> b!252713 (= e!163871 lt!126701)))

(declare-fun lt!126697 () ListLongMap!3775)

(declare-fun getCurrentListMapNoExtraKeys!566 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 32) Int) ListLongMap!3775)

(assert (=> b!252713 (= lt!126697 (getCurrentListMapNoExtraKeys!566 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(declare-fun lt!126687 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126690 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126690 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126686 () Unit!7815)

(declare-fun addStillContains!220 (ListLongMap!3775 (_ BitVec 64) V!8331 (_ BitVec 64)) Unit!7815)

(assert (=> b!252713 (= lt!126686 (addStillContains!220 lt!126697 lt!126687 (zeroValue!4505 thiss!1504) lt!126690))))

(assert (=> b!252713 (contains!1830 (+!671 lt!126697 (tuple2!4863 lt!126687 (zeroValue!4505 thiss!1504))) lt!126690)))

(declare-fun lt!126702 () Unit!7815)

(assert (=> b!252713 (= lt!126702 lt!126686)))

(declare-fun lt!126691 () ListLongMap!3775)

(assert (=> b!252713 (= lt!126691 (getCurrentListMapNoExtraKeys!566 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(declare-fun lt!126685 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126698 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126698 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126689 () Unit!7815)

(declare-fun addApplyDifferent!220 (ListLongMap!3775 (_ BitVec 64) V!8331 (_ BitVec 64)) Unit!7815)

(assert (=> b!252713 (= lt!126689 (addApplyDifferent!220 lt!126691 lt!126685 (minValue!4505 thiss!1504) lt!126698))))

(assert (=> b!252713 (= (apply!244 (+!671 lt!126691 (tuple2!4863 lt!126685 (minValue!4505 thiss!1504))) lt!126698) (apply!244 lt!126691 lt!126698))))

(declare-fun lt!126692 () Unit!7815)

(assert (=> b!252713 (= lt!126692 lt!126689)))

(declare-fun lt!126703 () ListLongMap!3775)

(assert (=> b!252713 (= lt!126703 (getCurrentListMapNoExtraKeys!566 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(declare-fun lt!126695 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126688 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126688 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126705 () Unit!7815)

(assert (=> b!252713 (= lt!126705 (addApplyDifferent!220 lt!126703 lt!126695 (zeroValue!4505 thiss!1504) lt!126688))))

(assert (=> b!252713 (= (apply!244 (+!671 lt!126703 (tuple2!4863 lt!126695 (zeroValue!4505 thiss!1504))) lt!126688) (apply!244 lt!126703 lt!126688))))

(declare-fun lt!126693 () Unit!7815)

(assert (=> b!252713 (= lt!126693 lt!126705)))

(declare-fun lt!126696 () ListLongMap!3775)

(assert (=> b!252713 (= lt!126696 (getCurrentListMapNoExtraKeys!566 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(declare-fun lt!126704 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126704 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126684 () (_ BitVec 64))

(assert (=> b!252713 (= lt!126684 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252713 (= lt!126701 (addApplyDifferent!220 lt!126696 lt!126704 (minValue!4505 thiss!1504) lt!126684))))

(assert (=> b!252713 (= (apply!244 (+!671 lt!126696 (tuple2!4863 lt!126704 (minValue!4505 thiss!1504))) lt!126684) (apply!244 lt!126696 lt!126684))))

(declare-fun b!252714 () Bool)

(declare-fun e!163876 () Bool)

(assert (=> b!252714 (= e!163876 e!163869)))

(declare-fun res!123707 () Bool)

(declare-fun call!23815 () Bool)

(assert (=> b!252714 (= res!123707 call!23815)))

(assert (=> b!252714 (=> (not res!123707) (not e!163869))))

(declare-fun b!252715 () Bool)

(declare-fun res!123701 () Bool)

(declare-fun e!163870 () Bool)

(assert (=> b!252715 (=> (not res!123701) (not e!163870))))

(declare-fun e!163877 () Bool)

(assert (=> b!252715 (= res!123701 e!163877)))

(declare-fun res!123700 () Bool)

(assert (=> b!252715 (=> res!123700 e!163877)))

(declare-fun e!163874 () Bool)

(assert (=> b!252715 (= res!123700 (not e!163874))))

(declare-fun res!123703 () Bool)

(assert (=> b!252715 (=> (not res!123703) (not e!163874))))

(assert (=> b!252715 (= res!123703 (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun b!252716 () Bool)

(declare-fun e!163872 () Bool)

(declare-fun call!23818 () Bool)

(assert (=> b!252716 (= e!163872 (not call!23818))))

(declare-fun b!252717 () Bool)

(declare-fun res!123704 () Bool)

(assert (=> b!252717 (=> (not res!123704) (not e!163870))))

(assert (=> b!252717 (= res!123704 e!163872)))

(declare-fun c!42594 () Bool)

(assert (=> b!252717 (= c!42594 (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!252718 () Bool)

(declare-fun e!163881 () ListLongMap!3775)

(assert (=> b!252718 (= e!163881 e!163878)))

(assert (=> b!252718 (= c!42599 (and (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252719 () Bool)

(assert (=> b!252719 (= e!163876 (not call!23815))))

(declare-fun bm!23813 () Bool)

(assert (=> bm!23813 (= call!23817 (getCurrentListMapNoExtraKeys!566 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)))))

(declare-fun b!252720 () Bool)

(assert (=> b!252720 (= e!163874 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252721 () Bool)

(declare-fun e!163873 () Bool)

(assert (=> b!252721 (= e!163873 (= (apply!244 lt!126700 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4505 thiss!1504)))))

(declare-fun b!252722 () Bool)

(assert (=> b!252722 (= e!163870 e!163876)))

(declare-fun c!42597 () Bool)

(assert (=> b!252722 (= c!42597 (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252723 () Bool)

(declare-fun call!23819 () ListLongMap!3775)

(assert (=> b!252723 (= e!163878 call!23819)))

(declare-fun b!252724 () Bool)

(declare-fun e!163875 () Bool)

(assert (=> b!252724 (= e!163875 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23814 () Bool)

(assert (=> bm!23814 (= call!23818 (contains!1830 lt!126700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23815 () Bool)

(assert (=> bm!23815 (= call!23816 call!23814)))

(declare-fun b!252725 () Bool)

(assert (=> b!252725 (= e!163879 call!23819)))

(declare-fun b!252726 () Bool)

(assert (=> b!252726 (= e!163881 (+!671 call!23820 (tuple2!4863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4505 thiss!1504))))))

(declare-fun d!61369 () Bool)

(assert (=> d!61369 e!163870))

(declare-fun res!123705 () Bool)

(assert (=> d!61369 (=> (not res!123705) (not e!163870))))

(assert (=> d!61369 (= res!123705 (or (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))))

(declare-fun lt!126699 () ListLongMap!3775)

(assert (=> d!61369 (= lt!126700 lt!126699)))

(declare-fun lt!126694 () Unit!7815)

(assert (=> d!61369 (= lt!126694 e!163871)))

(declare-fun c!42598 () Bool)

(assert (=> d!61369 (= c!42598 e!163875)))

(declare-fun res!123706 () Bool)

(assert (=> d!61369 (=> (not res!123706) (not e!163875))))

(assert (=> d!61369 (= res!123706 (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61369 (= lt!126699 e!163881)))

(assert (=> d!61369 (= c!42595 (and (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4401 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61369 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61369 (= (getCurrentListMap!1431 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4664 thiss!1504)) lt!126700)))

(declare-fun bm!23812 () Bool)

(assert (=> bm!23812 (= call!23819 call!23820)))

(declare-fun b!252727 () Bool)

(declare-fun e!163880 () Bool)

(declare-fun get!3015 (ValueCell!2913 V!8331) V!8331)

(declare-fun dynLambda!587 (Int (_ BitVec 64)) V!8331)

(assert (=> b!252727 (= e!163880 (= (apply!244 lt!126700 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)) (get!3015 (select (arr!5854 (_values!4647 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!587 (defaultEntry!4664 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6201 (_values!4647 thiss!1504))))))

(assert (=> b!252727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun b!252728 () Bool)

(assert (=> b!252728 (= e!163872 e!163873)))

(declare-fun res!123702 () Bool)

(assert (=> b!252728 (= res!123702 call!23818)))

(assert (=> b!252728 (=> (not res!123702) (not e!163873))))

(declare-fun b!252729 () Bool)

(assert (=> b!252729 (= e!163879 call!23816)))

(declare-fun b!252730 () Bool)

(assert (=> b!252730 (= e!163877 e!163880)))

(declare-fun res!123699 () Bool)

(assert (=> b!252730 (=> (not res!123699) (not e!163880))))

(assert (=> b!252730 (= res!123699 (contains!1830 lt!126700 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun bm!23816 () Bool)

(assert (=> bm!23816 (= call!23815 (contains!1830 lt!126700 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23817 () Bool)

(assert (=> bm!23817 (= call!23814 call!23817)))

(declare-fun b!252731 () Bool)

(declare-fun Unit!7824 () Unit!7815)

(assert (=> b!252731 (= e!163871 Unit!7824)))

(assert (= (and d!61369 c!42595) b!252726))

(assert (= (and d!61369 (not c!42595)) b!252718))

(assert (= (and b!252718 c!42599) b!252723))

(assert (= (and b!252718 (not c!42599)) b!252711))

(assert (= (and b!252711 c!42596) b!252725))

(assert (= (and b!252711 (not c!42596)) b!252729))

(assert (= (or b!252725 b!252729) bm!23815))

(assert (= (or b!252723 bm!23815) bm!23817))

(assert (= (or b!252723 b!252725) bm!23812))

(assert (= (or b!252726 bm!23817) bm!23813))

(assert (= (or b!252726 bm!23812) bm!23811))

(assert (= (and d!61369 res!123706) b!252724))

(assert (= (and d!61369 c!42598) b!252713))

(assert (= (and d!61369 (not c!42598)) b!252731))

(assert (= (and d!61369 res!123705) b!252715))

(assert (= (and b!252715 res!123703) b!252720))

(assert (= (and b!252715 (not res!123700)) b!252730))

(assert (= (and b!252730 res!123699) b!252727))

(assert (= (and b!252715 res!123701) b!252717))

(assert (= (and b!252717 c!42594) b!252728))

(assert (= (and b!252717 (not c!42594)) b!252716))

(assert (= (and b!252728 res!123702) b!252721))

(assert (= (or b!252728 b!252716) bm!23814))

(assert (= (and b!252717 res!123704) b!252722))

(assert (= (and b!252722 c!42597) b!252714))

(assert (= (and b!252722 (not c!42597)) b!252719))

(assert (= (and b!252714 res!123707) b!252712))

(assert (= (or b!252714 b!252719) bm!23816))

(declare-fun b_lambda!8119 () Bool)

(assert (=> (not b_lambda!8119) (not b!252727)))

(declare-fun t!8788 () Bool)

(declare-fun tb!3001 () Bool)

(assert (=> (and b!252466 (= (defaultEntry!4664 thiss!1504) (defaultEntry!4664 thiss!1504)) t!8788) tb!3001))

(declare-fun result!5325 () Bool)

(assert (=> tb!3001 (= result!5325 tp_is_empty!6513)))

(assert (=> b!252727 t!8788))

(declare-fun b_and!13691 () Bool)

(assert (= b_and!13687 (and (=> t!8788 result!5325) b_and!13691)))

(assert (=> b!252720 m!268711))

(assert (=> b!252720 m!268711))

(assert (=> b!252720 m!268713))

(declare-fun m!268769 () Bool)

(assert (=> b!252726 m!268769))

(assert (=> b!252724 m!268711))

(assert (=> b!252724 m!268711))

(assert (=> b!252724 m!268713))

(assert (=> b!252730 m!268711))

(assert (=> b!252730 m!268711))

(declare-fun m!268771 () Bool)

(assert (=> b!252730 m!268771))

(declare-fun m!268773 () Bool)

(assert (=> bm!23811 m!268773))

(declare-fun m!268775 () Bool)

(assert (=> b!252712 m!268775))

(declare-fun m!268777 () Bool)

(assert (=> bm!23816 m!268777))

(declare-fun m!268779 () Bool)

(assert (=> b!252727 m!268779))

(declare-fun m!268781 () Bool)

(assert (=> b!252727 m!268781))

(declare-fun m!268783 () Bool)

(assert (=> b!252727 m!268783))

(assert (=> b!252727 m!268781))

(assert (=> b!252727 m!268711))

(assert (=> b!252727 m!268711))

(declare-fun m!268785 () Bool)

(assert (=> b!252727 m!268785))

(assert (=> b!252727 m!268779))

(declare-fun m!268787 () Bool)

(assert (=> bm!23814 m!268787))

(declare-fun m!268789 () Bool)

(assert (=> b!252721 m!268789))

(declare-fun m!268791 () Bool)

(assert (=> b!252713 m!268791))

(declare-fun m!268793 () Bool)

(assert (=> b!252713 m!268793))

(assert (=> b!252713 m!268711))

(declare-fun m!268795 () Bool)

(assert (=> b!252713 m!268795))

(declare-fun m!268797 () Bool)

(assert (=> b!252713 m!268797))

(declare-fun m!268799 () Bool)

(assert (=> b!252713 m!268799))

(declare-fun m!268801 () Bool)

(assert (=> b!252713 m!268801))

(declare-fun m!268803 () Bool)

(assert (=> b!252713 m!268803))

(declare-fun m!268805 () Bool)

(assert (=> b!252713 m!268805))

(declare-fun m!268807 () Bool)

(assert (=> b!252713 m!268807))

(declare-fun m!268809 () Bool)

(assert (=> b!252713 m!268809))

(declare-fun m!268811 () Bool)

(assert (=> b!252713 m!268811))

(assert (=> b!252713 m!268805))

(declare-fun m!268813 () Bool)

(assert (=> b!252713 m!268813))

(declare-fun m!268815 () Bool)

(assert (=> b!252713 m!268815))

(assert (=> b!252713 m!268791))

(declare-fun m!268817 () Bool)

(assert (=> b!252713 m!268817))

(declare-fun m!268819 () Bool)

(assert (=> b!252713 m!268819))

(declare-fun m!268821 () Bool)

(assert (=> b!252713 m!268821))

(assert (=> b!252713 m!268799))

(assert (=> b!252713 m!268809))

(assert (=> d!61369 m!268583))

(assert (=> bm!23813 m!268815))

(assert (=> b!252485 d!61369))

(declare-fun b!252750 () Bool)

(declare-fun e!163892 () Bool)

(declare-fun call!23826 () Bool)

(assert (=> b!252750 (= e!163892 (not call!23826))))

(declare-fun b!252751 () Bool)

(declare-fun e!163891 () Bool)

(declare-fun e!163893 () Bool)

(assert (=> b!252751 (= e!163891 e!163893)))

(declare-fun c!42605 () Bool)

(declare-fun lt!126711 () SeekEntryResult!1133)

(assert (=> b!252751 (= c!42605 ((_ is MissingVacant!1133) lt!126711))))

(declare-fun c!42604 () Bool)

(declare-fun call!23825 () Bool)

(declare-fun bm!23822 () Bool)

(assert (=> bm!23822 (= call!23825 (inRange!0 (ite c!42604 (index!6702 lt!126711) (index!6705 lt!126711)) (mask!10883 thiss!1504)))))

(declare-fun b!252752 () Bool)

(declare-fun e!163890 () Bool)

(assert (=> b!252752 (= e!163891 e!163890)))

(declare-fun res!123716 () Bool)

(assert (=> b!252752 (= res!123716 call!23825)))

(assert (=> b!252752 (=> (not res!123716) (not e!163890))))

(declare-fun d!61371 () Bool)

(assert (=> d!61371 e!163891))

(assert (=> d!61371 (= c!42604 ((_ is MissingZero!1133) lt!126711))))

(assert (=> d!61371 (= lt!126711 (seekEntryOrOpen!0 key!932 (_keys!6812 thiss!1504) (mask!10883 thiss!1504)))))

(declare-fun lt!126710 () Unit!7815)

(declare-fun choose!1205 (array!12353 array!12351 (_ BitVec 32) (_ BitVec 32) V!8331 V!8331 (_ BitVec 64) Int) Unit!7815)

(assert (=> d!61371 (= lt!126710 (choose!1205 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)))))

(assert (=> d!61371 (validMask!0 (mask!10883 thiss!1504))))

(assert (=> d!61371 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (_keys!6812 thiss!1504) (_values!4647 thiss!1504) (mask!10883 thiss!1504) (extraKeys!4401 thiss!1504) (zeroValue!4505 thiss!1504) (minValue!4505 thiss!1504) key!932 (defaultEntry!4664 thiss!1504)) lt!126710)))

(declare-fun b!252753 () Bool)

(declare-fun res!123718 () Bool)

(assert (=> b!252753 (=> (not res!123718) (not e!163892))))

(assert (=> b!252753 (= res!123718 (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6705 lt!126711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252753 (and (bvsge (index!6705 lt!126711) #b00000000000000000000000000000000) (bvslt (index!6705 lt!126711) (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun b!252754 () Bool)

(declare-fun res!123717 () Bool)

(assert (=> b!252754 (=> (not res!123717) (not e!163892))))

(assert (=> b!252754 (= res!123717 call!23825)))

(assert (=> b!252754 (= e!163893 e!163892)))

(declare-fun bm!23823 () Bool)

(assert (=> bm!23823 (= call!23826 (arrayContainsKey!0 (_keys!6812 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252755 () Bool)

(assert (=> b!252755 (= e!163890 (not call!23826))))

(declare-fun b!252756 () Bool)

(assert (=> b!252756 (and (bvsge (index!6702 lt!126711) #b00000000000000000000000000000000) (bvslt (index!6702 lt!126711) (size!6202 (_keys!6812 thiss!1504))))))

(declare-fun res!123719 () Bool)

(assert (=> b!252756 (= res!123719 (= (select (arr!5855 (_keys!6812 thiss!1504)) (index!6702 lt!126711)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252756 (=> (not res!123719) (not e!163890))))

(declare-fun b!252757 () Bool)

(assert (=> b!252757 (= e!163893 ((_ is Undefined!1133) lt!126711))))

(assert (= (and d!61371 c!42604) b!252752))

(assert (= (and d!61371 (not c!42604)) b!252751))

(assert (= (and b!252752 res!123716) b!252756))

(assert (= (and b!252756 res!123719) b!252755))

(assert (= (and b!252751 c!42605) b!252754))

(assert (= (and b!252751 (not c!42605)) b!252757))

(assert (= (and b!252754 res!123717) b!252753))

(assert (= (and b!252753 res!123718) b!252750))

(assert (= (or b!252752 b!252754) bm!23822))

(assert (= (or b!252755 b!252750) bm!23823))

(assert (=> bm!23823 m!268585))

(declare-fun m!268823 () Bool)

(assert (=> b!252756 m!268823))

(assert (=> d!61371 m!268613))

(declare-fun m!268825 () Bool)

(assert (=> d!61371 m!268825))

(assert (=> d!61371 m!268583))

(declare-fun m!268827 () Bool)

(assert (=> b!252753 m!268827))

(declare-fun m!268829 () Bool)

(assert (=> bm!23822 m!268829))

(assert (=> b!252476 d!61371))

(declare-fun d!61373 () Bool)

(assert (=> d!61373 (= (inRange!0 (ite c!42541 (index!6702 lt!126547) (index!6705 lt!126547)) (mask!10883 thiss!1504)) (and (bvsge (ite c!42541 (index!6702 lt!126547) (index!6705 lt!126547)) #b00000000000000000000000000000000) (bvslt (ite c!42541 (index!6702 lt!126547) (index!6705 lt!126547)) (bvadd (mask!10883 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23778 d!61373))

(declare-fun bm!23824 () Bool)

(declare-fun call!23827 () Bool)

(declare-fun c!42606 () Bool)

(assert (=> bm!23824 (= call!23827 (arrayNoDuplicates!0 (_keys!6812 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42606 (Cons!3738 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000) Nil!3739) Nil!3739)))))

(declare-fun b!252758 () Bool)

(declare-fun e!163897 () Bool)

(assert (=> b!252758 (= e!163897 call!23827)))

(declare-fun d!61375 () Bool)

(declare-fun res!123720 () Bool)

(declare-fun e!163896 () Bool)

(assert (=> d!61375 (=> res!123720 e!163896)))

(assert (=> d!61375 (= res!123720 (bvsge #b00000000000000000000000000000000 (size!6202 (_keys!6812 thiss!1504))))))

(assert (=> d!61375 (= (arrayNoDuplicates!0 (_keys!6812 thiss!1504) #b00000000000000000000000000000000 Nil!3739) e!163896)))

(declare-fun b!252759 () Bool)

(assert (=> b!252759 (= e!163897 call!23827)))

(declare-fun b!252760 () Bool)

(declare-fun e!163895 () Bool)

(assert (=> b!252760 (= e!163895 (contains!1832 Nil!3739 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252761 () Bool)

(declare-fun e!163894 () Bool)

(assert (=> b!252761 (= e!163896 e!163894)))

(declare-fun res!123722 () Bool)

(assert (=> b!252761 (=> (not res!123722) (not e!163894))))

(assert (=> b!252761 (= res!123722 (not e!163895))))

(declare-fun res!123721 () Bool)

(assert (=> b!252761 (=> (not res!123721) (not e!163895))))

(assert (=> b!252761 (= res!123721 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252762 () Bool)

(assert (=> b!252762 (= e!163894 e!163897)))

(assert (=> b!252762 (= c!42606 (validKeyInArray!0 (select (arr!5855 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61375 (not res!123720)) b!252761))

(assert (= (and b!252761 res!123721) b!252760))

(assert (= (and b!252761 res!123722) b!252762))

(assert (= (and b!252762 c!42606) b!252758))

(assert (= (and b!252762 (not c!42606)) b!252759))

(assert (= (or b!252758 b!252759) bm!23824))

(assert (=> bm!23824 m!268711))

(declare-fun m!268831 () Bool)

(assert (=> bm!23824 m!268831))

(assert (=> b!252760 m!268711))

(assert (=> b!252760 m!268711))

(declare-fun m!268833 () Bool)

(assert (=> b!252760 m!268833))

(assert (=> b!252761 m!268711))

(assert (=> b!252761 m!268711))

(assert (=> b!252761 m!268713))

(assert (=> b!252762 m!268711))

(assert (=> b!252762 m!268711))

(assert (=> b!252762 m!268713))

(assert (=> b!252468 d!61375))

(declare-fun d!61377 () Bool)

(assert (=> d!61377 (= (array_inv!3869 (_keys!6812 thiss!1504)) (bvsge (size!6202 (_keys!6812 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252466 d!61377))

(declare-fun d!61379 () Bool)

(assert (=> d!61379 (= (array_inv!3870 (_values!4647 thiss!1504)) (bvsge (size!6201 (_values!4647 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252466 d!61379))

(assert (=> bm!23779 d!61351))

(declare-fun mapIsEmpty!11082 () Bool)

(declare-fun mapRes!11082 () Bool)

(assert (=> mapIsEmpty!11082 mapRes!11082))

(declare-fun mapNonEmpty!11082 () Bool)

(declare-fun tp!23241 () Bool)

(declare-fun e!163903 () Bool)

(assert (=> mapNonEmpty!11082 (= mapRes!11082 (and tp!23241 e!163903))))

(declare-fun mapKey!11082 () (_ BitVec 32))

(declare-fun mapRest!11082 () (Array (_ BitVec 32) ValueCell!2913))

(declare-fun mapValue!11082 () ValueCell!2913)

(assert (=> mapNonEmpty!11082 (= mapRest!11076 (store mapRest!11082 mapKey!11082 mapValue!11082))))

(declare-fun condMapEmpty!11082 () Bool)

(declare-fun mapDefault!11082 () ValueCell!2913)

(assert (=> mapNonEmpty!11076 (= condMapEmpty!11082 (= mapRest!11076 ((as const (Array (_ BitVec 32) ValueCell!2913)) mapDefault!11082)))))

(declare-fun e!163902 () Bool)

(assert (=> mapNonEmpty!11076 (= tp!23232 (and e!163902 mapRes!11082))))

(declare-fun b!252770 () Bool)

(assert (=> b!252770 (= e!163902 tp_is_empty!6513)))

(declare-fun b!252769 () Bool)

(assert (=> b!252769 (= e!163903 tp_is_empty!6513)))

(assert (= (and mapNonEmpty!11076 condMapEmpty!11082) mapIsEmpty!11082))

(assert (= (and mapNonEmpty!11076 (not condMapEmpty!11082)) mapNonEmpty!11082))

(assert (= (and mapNonEmpty!11082 ((_ is ValueCellFull!2913) mapValue!11082)) b!252769))

(assert (= (and mapNonEmpty!11076 ((_ is ValueCellFull!2913) mapDefault!11082)) b!252770))

(declare-fun m!268835 () Bool)

(assert (=> mapNonEmpty!11082 m!268835))

(declare-fun b_lambda!8121 () Bool)

(assert (= b_lambda!8119 (or (and b!252466 b_free!6651) b_lambda!8121)))

(check-sat (not b!252594) tp_is_empty!6513 (not bm!23823) (not d!61339) (not b!252632) (not b!252668) (not d!61357) (not b!252565) (not bm!23795) (not mapNonEmpty!11082) (not b!252726) (not b!252640) (not bm!23788) (not b!252613) (not b!252666) (not b!252607) (not bm!23814) (not b!252727) (not b_lambda!8121) (not b!252630) (not bm!23822) (not b!252641) (not b!252627) (not b!252577) (not bm!23813) (not d!61363) (not b!252712) (not bm!23824) (not b!252761) (not d!61355) (not d!61369) (not b!252730) (not b!252579) (not b!252720) (not b_next!6651) (not b!252721) (not d!61361) (not d!61367) (not bm!23791) (not d!61371) (not d!61353) (not b!252656) (not b!252567) (not d!61349) (not b!252762) (not b!252593) (not bm!23794) (not bm!23811) b_and!13691 (not b!252592) (not b!252576) (not b!252639) (not b!252619) (not bm!23796) (not b!252603) (not b!252760) (not b!252713) (not b!252622) (not bm!23816) (not b!252724))
(check-sat b_and!13691 (not b_next!6651))
