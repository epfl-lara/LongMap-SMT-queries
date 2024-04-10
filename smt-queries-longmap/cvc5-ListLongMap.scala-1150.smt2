; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24138 () Bool)

(assert start!24138)

(declare-fun b!252416 () Bool)

(declare-fun b_free!6649 () Bool)

(declare-fun b_next!6649 () Bool)

(assert (=> b!252416 (= b_free!6649 (not b_next!6649))))

(declare-fun tp!23226 () Bool)

(declare-fun b_and!13685 () Bool)

(assert (=> b!252416 (= tp!23226 b_and!13685)))

(declare-fun b!252395 () Bool)

(declare-fun res!123547 () Bool)

(declare-fun e!163676 () Bool)

(assert (=> b!252395 (=> (not res!123547) (not e!163676))))

(declare-fun call!23776 () Bool)

(assert (=> b!252395 (= res!123547 call!23776)))

(declare-fun e!163680 () Bool)

(assert (=> b!252395 (= e!163680 e!163676)))

(declare-fun bm!23772 () Bool)

(declare-fun call!23775 () Bool)

(declare-datatypes ((V!8329 0))(
  ( (V!8330 (val!3300 Int)) )
))
(declare-datatypes ((ValueCell!2912 0))(
  ( (ValueCellFull!2912 (v!5371 V!8329)) (EmptyCell!2912) )
))
(declare-datatypes ((array!12347 0))(
  ( (array!12348 (arr!5852 (Array (_ BitVec 32) ValueCell!2912)) (size!6199 (_ BitVec 32))) )
))
(declare-datatypes ((array!12349 0))(
  ( (array!12350 (arr!5853 (Array (_ BitVec 32) (_ BitVec 64))) (size!6200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3724 0))(
  ( (LongMapFixedSize!3725 (defaultEntry!4663 Int) (mask!10882 (_ BitVec 32)) (extraKeys!4400 (_ BitVec 32)) (zeroValue!4504 V!8329) (minValue!4504 V!8329) (_size!1911 (_ BitVec 32)) (_keys!6811 array!12349) (_values!4646 array!12347) (_vacant!1911 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3724)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23772 (= call!23775 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252396 () Bool)

(declare-fun e!163670 () Bool)

(declare-datatypes ((SeekEntryResult!1132 0))(
  ( (MissingZero!1132 (index!6698 (_ BitVec 32))) (Found!1132 (index!6699 (_ BitVec 32))) (Intermediate!1132 (undefined!1944 Bool) (index!6700 (_ BitVec 32)) (x!24770 (_ BitVec 32))) (Undefined!1132) (MissingVacant!1132 (index!6701 (_ BitVec 32))) )
))
(declare-fun lt!126523 () SeekEntryResult!1132)

(assert (=> b!252396 (= e!163670 (is-Undefined!1132 lt!126523))))

(declare-fun b!252397 () Bool)

(declare-fun res!123553 () Bool)

(declare-fun e!163678 () Bool)

(assert (=> b!252397 (=> res!123553 e!163678)))

(assert (=> b!252397 (= res!123553 (or (not (= (size!6199 (_values!4646 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10882 thiss!1504)))) (not (= (size!6200 (_keys!6811 thiss!1504)) (size!6199 (_values!4646 thiss!1504)))) (bvslt (mask!10882 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4400 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252398 () Bool)

(declare-fun e!163675 () Bool)

(declare-fun e!163673 () Bool)

(assert (=> b!252398 (= e!163675 e!163673)))

(declare-fun res!123548 () Bool)

(assert (=> b!252398 (=> (not res!123548) (not e!163673))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!252398 (= res!123548 (or (= lt!126523 (MissingZero!1132 index!297)) (= lt!126523 (MissingVacant!1132 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12349 (_ BitVec 32)) SeekEntryResult!1132)

(assert (=> b!252398 (= lt!126523 (seekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) (mask!10882 thiss!1504)))))

(declare-fun b!252399 () Bool)

(declare-fun e!163674 () Bool)

(declare-fun tp_is_empty!6511 () Bool)

(assert (=> b!252399 (= e!163674 tp_is_empty!6511)))

(declare-fun b!252400 () Bool)

(declare-fun e!163681 () Bool)

(assert (=> b!252400 (= e!163673 e!163681)))

(declare-fun res!123551 () Bool)

(assert (=> b!252400 (=> (not res!123551) (not e!163681))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252400 (= res!123551 (inRange!0 index!297 (mask!10882 thiss!1504)))))

(declare-datatypes ((Unit!7810 0))(
  ( (Unit!7811) )
))
(declare-fun lt!126522 () Unit!7810)

(declare-fun e!163668 () Unit!7810)

(assert (=> b!252400 (= lt!126522 e!163668)))

(declare-fun c!42527 () Bool)

(declare-datatypes ((tuple2!4860 0))(
  ( (tuple2!4861 (_1!2441 (_ BitVec 64)) (_2!2441 V!8329)) )
))
(declare-datatypes ((List!3740 0))(
  ( (Nil!3737) (Cons!3736 (h!4398 tuple2!4860) (t!8781 List!3740)) )
))
(declare-datatypes ((ListLongMap!3773 0))(
  ( (ListLongMap!3774 (toList!1902 List!3740)) )
))
(declare-fun contains!1829 (ListLongMap!3773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1430 (array!12349 array!12347 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 32) Int) ListLongMap!3773)

(assert (=> b!252400 (= c!42527 (contains!1829 (getCurrentListMap!1430 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)) key!932))))

(declare-fun b!252401 () Bool)

(declare-fun e!163671 () Unit!7810)

(declare-fun Unit!7812 () Unit!7810)

(assert (=> b!252401 (= e!163671 Unit!7812)))

(declare-fun lt!126517 () Unit!7810)

(declare-fun lemmaArrayContainsKeyThenInListMap!210 (array!12349 array!12347 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) (_ BitVec 32) Int) Unit!7810)

(assert (=> b!252401 (= lt!126517 (lemmaArrayContainsKeyThenInListMap!210 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252401 false))

(declare-fun b!252402 () Bool)

(declare-fun res!123546 () Bool)

(assert (=> b!252402 (=> res!123546 e!163678)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12349 (_ BitVec 32)) Bool)

(assert (=> b!252402 (= res!123546 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6811 thiss!1504) (mask!10882 thiss!1504))))))

(declare-fun b!252403 () Bool)

(declare-fun lt!126518 () Unit!7810)

(assert (=> b!252403 (= e!163668 lt!126518)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!409 (array!12349 array!12347 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7810)

(assert (=> b!252403 (= lt!126518 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!409 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(declare-fun c!42529 () Bool)

(assert (=> b!252403 (= c!42529 (is-MissingZero!1132 lt!126523))))

(assert (=> b!252403 e!163680))

(declare-fun b!252404 () Bool)

(declare-fun res!123554 () Bool)

(assert (=> b!252404 (= res!123554 (= (select (arr!5853 (_keys!6811 thiss!1504)) (index!6701 lt!126523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163679 () Bool)

(assert (=> b!252404 (=> (not res!123554) (not e!163679))))

(declare-fun b!252405 () Bool)

(assert (=> b!252405 (= e!163670 e!163679)))

(declare-fun res!123549 () Bool)

(assert (=> b!252405 (= res!123549 call!23776)))

(assert (=> b!252405 (=> (not res!123549) (not e!163679))))

(declare-fun res!123555 () Bool)

(assert (=> start!24138 (=> (not res!123555) (not e!163675))))

(declare-fun valid!1457 (LongMapFixedSize!3724) Bool)

(assert (=> start!24138 (= res!123555 (valid!1457 thiss!1504))))

(assert (=> start!24138 e!163675))

(declare-fun e!163677 () Bool)

(assert (=> start!24138 e!163677))

(assert (=> start!24138 true))

(declare-fun b!252406 () Bool)

(declare-fun c!42530 () Bool)

(assert (=> b!252406 (= c!42530 (is-MissingVacant!1132 lt!126523))))

(assert (=> b!252406 (= e!163680 e!163670)))

(declare-fun mapNonEmpty!11073 () Bool)

(declare-fun mapRes!11073 () Bool)

(declare-fun tp!23225 () Bool)

(assert (=> mapNonEmpty!11073 (= mapRes!11073 (and tp!23225 e!163674))))

(declare-fun mapRest!11073 () (Array (_ BitVec 32) ValueCell!2912))

(declare-fun mapKey!11073 () (_ BitVec 32))

(declare-fun mapValue!11073 () ValueCell!2912)

(assert (=> mapNonEmpty!11073 (= (arr!5852 (_values!4646 thiss!1504)) (store mapRest!11073 mapKey!11073 mapValue!11073))))

(declare-fun b!252407 () Bool)

(declare-fun Unit!7813 () Unit!7810)

(assert (=> b!252407 (= e!163668 Unit!7813)))

(declare-fun lt!126515 () Unit!7810)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!404 (array!12349 array!12347 (_ BitVec 32) (_ BitVec 32) V!8329 V!8329 (_ BitVec 64) Int) Unit!7810)

(assert (=> b!252407 (= lt!126515 (lemmaInListMapThenSeekEntryOrOpenFindsIt!404 (_keys!6811 thiss!1504) (_values!4646 thiss!1504) (mask!10882 thiss!1504) (extraKeys!4400 thiss!1504) (zeroValue!4504 thiss!1504) (minValue!4504 thiss!1504) key!932 (defaultEntry!4663 thiss!1504)))))

(assert (=> b!252407 false))

(declare-fun b!252408 () Bool)

(declare-fun res!123545 () Bool)

(assert (=> b!252408 (=> (not res!123545) (not e!163675))))

(assert (=> b!252408 (= res!123545 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252409 () Bool)

(declare-fun Unit!7814 () Unit!7810)

(assert (=> b!252409 (= e!163671 Unit!7814)))

(declare-fun b!252410 () Bool)

(declare-fun res!123552 () Bool)

(assert (=> b!252410 (=> (not res!123552) (not e!163676))))

(assert (=> b!252410 (= res!123552 (= (select (arr!5853 (_keys!6811 thiss!1504)) (index!6698 lt!126523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11073 () Bool)

(assert (=> mapIsEmpty!11073 mapRes!11073))

(declare-fun b!252411 () Bool)

(declare-fun e!163669 () Bool)

(assert (=> b!252411 (= e!163669 tp_is_empty!6511)))

(declare-fun b!252412 () Bool)

(declare-datatypes ((List!3741 0))(
  ( (Nil!3738) (Cons!3737 (h!4399 (_ BitVec 64)) (t!8782 List!3741)) )
))
(declare-fun arrayNoDuplicates!0 (array!12349 (_ BitVec 32) List!3741) Bool)

(assert (=> b!252412 (= e!163678 (arrayNoDuplicates!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 Nil!3738))))

(declare-fun b!252413 () Bool)

(assert (=> b!252413 (= e!163676 (not call!23775))))

(declare-fun b!252414 () Bool)

(assert (=> b!252414 (= e!163681 (not e!163678))))

(declare-fun res!123550 () Bool)

(assert (=> b!252414 (=> res!123550 e!163678)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252414 (= res!123550 (not (validMask!0 (mask!10882 thiss!1504))))))

(declare-fun lt!126521 () array!12349)

(assert (=> b!252414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126521 (mask!10882 thiss!1504))))

(declare-fun lt!126519 () Unit!7810)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12349 (_ BitVec 32) (_ BitVec 32)) Unit!7810)

(assert (=> b!252414 (= lt!126519 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6811 thiss!1504) index!297 (mask!10882 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12349 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252414 (= (arrayCountValidKeys!0 lt!126521 #b00000000000000000000000000000000 (size!6200 (_keys!6811 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6811 thiss!1504) #b00000000000000000000000000000000 (size!6200 (_keys!6811 thiss!1504)))))))

(declare-fun lt!126516 () Unit!7810)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12349 (_ BitVec 32) (_ BitVec 64)) Unit!7810)

(assert (=> b!252414 (= lt!126516 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6811 thiss!1504) index!297 key!932))))

(assert (=> b!252414 (arrayNoDuplicates!0 lt!126521 #b00000000000000000000000000000000 Nil!3738)))

(assert (=> b!252414 (= lt!126521 (array!12350 (store (arr!5853 (_keys!6811 thiss!1504)) index!297 key!932) (size!6200 (_keys!6811 thiss!1504))))))

(declare-fun lt!126524 () Unit!7810)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3741) Unit!7810)

(assert (=> b!252414 (= lt!126524 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6811 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3738))))

(declare-fun lt!126520 () Unit!7810)

(assert (=> b!252414 (= lt!126520 e!163671)))

(declare-fun c!42528 () Bool)

(assert (=> b!252414 (= c!42528 (arrayContainsKey!0 (_keys!6811 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252415 () Bool)

(declare-fun e!163667 () Bool)

(assert (=> b!252415 (= e!163667 (and e!163669 mapRes!11073))))

(declare-fun condMapEmpty!11073 () Bool)

(declare-fun mapDefault!11073 () ValueCell!2912)

