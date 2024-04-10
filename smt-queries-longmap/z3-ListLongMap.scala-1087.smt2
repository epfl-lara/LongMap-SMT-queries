; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22206 () Bool)

(assert start!22206)

(declare-fun b!232893 () Bool)

(declare-fun b_free!6273 () Bool)

(declare-fun b_next!6273 () Bool)

(assert (=> b!232893 (= b_free!6273 (not b_next!6273))))

(declare-fun tp!21960 () Bool)

(declare-fun b_and!13171 () Bool)

(assert (=> b!232893 (= tp!21960 b_and!13171)))

(declare-fun call!21654 () Bool)

(declare-datatypes ((SeekEntryResult!971 0))(
  ( (MissingZero!971 (index!6054 (_ BitVec 32))) (Found!971 (index!6055 (_ BitVec 32))) (Intermediate!971 (undefined!1783 Bool) (index!6056 (_ BitVec 32)) (x!23583 (_ BitVec 32))) (Undefined!971) (MissingVacant!971 (index!6057 (_ BitVec 32))) )
))
(declare-fun lt!117799 () SeekEntryResult!971)

(declare-fun c!38734 () Bool)

(declare-datatypes ((V!7827 0))(
  ( (V!7828 (val!3112 Int)) )
))
(declare-datatypes ((ValueCell!2724 0))(
  ( (ValueCellFull!2724 (v!5132 V!7827)) (EmptyCell!2724) )
))
(declare-datatypes ((array!11513 0))(
  ( (array!11514 (arr!5476 (Array (_ BitVec 32) ValueCell!2724)) (size!5809 (_ BitVec 32))) )
))
(declare-datatypes ((array!11515 0))(
  ( (array!11516 (arr!5477 (Array (_ BitVec 32) (_ BitVec 64))) (size!5810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3348 0))(
  ( (LongMapFixedSize!3349 (defaultEntry!4333 Int) (mask!10251 (_ BitVec 32)) (extraKeys!4070 (_ BitVec 32)) (zeroValue!4174 V!7827) (minValue!4174 V!7827) (_size!1723 (_ BitVec 32)) (_keys!6387 array!11515) (_values!4316 array!11513) (_vacant!1723 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3348)

(declare-fun bm!21650 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21650 (= call!21654 (inRange!0 (ite c!38734 (index!6054 lt!117799) (index!6057 lt!117799)) (mask!10251 thiss!1504)))))

(declare-fun b!232875 () Bool)

(declare-fun e!151252 () Bool)

(declare-fun e!151261 () Bool)

(assert (=> b!232875 (= e!151252 e!151261)))

(declare-fun res!114321 () Bool)

(assert (=> b!232875 (=> (not res!114321) (not e!151261))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232875 (= res!114321 (or (= lt!117799 (MissingZero!971 index!297)) (= lt!117799 (MissingVacant!971 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11515 (_ BitVec 32)) SeekEntryResult!971)

(assert (=> b!232875 (= lt!117799 (seekEntryOrOpen!0 key!932 (_keys!6387 thiss!1504) (mask!10251 thiss!1504)))))

(declare-fun b!232876 () Bool)

(declare-fun e!151259 () Bool)

(declare-fun call!21653 () Bool)

(assert (=> b!232876 (= e!151259 (not call!21653))))

(declare-fun b!232877 () Bool)

(declare-fun e!151257 () Bool)

(declare-fun e!151265 () Bool)

(assert (=> b!232877 (= e!151257 e!151265)))

(declare-fun res!114325 () Bool)

(assert (=> b!232877 (= res!114325 call!21654)))

(assert (=> b!232877 (=> (not res!114325) (not e!151265))))

(declare-fun b!232878 () Bool)

(get-info :version)

(assert (=> b!232878 (= e!151257 ((_ is Undefined!971) lt!117799))))

(declare-fun b!232879 () Bool)

(declare-fun res!114320 () Bool)

(assert (=> b!232879 (=> (not res!114320) (not e!151252))))

(assert (=> b!232879 (= res!114320 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232880 () Bool)

(declare-fun e!151254 () Bool)

(assert (=> b!232880 (= e!151254 true)))

(declare-fun lt!117807 () Bool)

(declare-fun lt!117806 () LongMapFixedSize!3348)

(declare-datatypes ((tuple2!4594 0))(
  ( (tuple2!4595 (_1!2308 (_ BitVec 64)) (_2!2308 V!7827)) )
))
(declare-datatypes ((List!3509 0))(
  ( (Nil!3506) (Cons!3505 (h!4153 tuple2!4594) (t!8468 List!3509)) )
))
(declare-datatypes ((ListLongMap!3507 0))(
  ( (ListLongMap!3508 (toList!1769 List!3509)) )
))
(declare-fun contains!1637 (ListLongMap!3507 (_ BitVec 64)) Bool)

(declare-fun map!2582 (LongMapFixedSize!3348) ListLongMap!3507)

(assert (=> b!232880 (= lt!117807 (contains!1637 (map!2582 lt!117806) key!932))))

(declare-fun b!232881 () Bool)

(declare-fun c!38733 () Bool)

(assert (=> b!232881 (= c!38733 ((_ is MissingVacant!971) lt!117799))))

(declare-fun e!151251 () Bool)

(assert (=> b!232881 (= e!151251 e!151257)))

(declare-fun b!232882 () Bool)

(declare-datatypes ((Unit!7200 0))(
  ( (Unit!7201) )
))
(declare-fun e!151262 () Unit!7200)

(declare-fun lt!117804 () Unit!7200)

(assert (=> b!232882 (= e!151262 lt!117804)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!330 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 64) Int) Unit!7200)

(assert (=> b!232882 (= lt!117804 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!330 (_keys!6387 thiss!1504) (_values!4316 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) key!932 (defaultEntry!4333 thiss!1504)))))

(assert (=> b!232882 (= c!38734 ((_ is MissingZero!971) lt!117799))))

(assert (=> b!232882 e!151251))

(declare-fun bm!21651 () Bool)

(declare-fun arrayContainsKey!0 (array!11515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21651 (= call!21653 (arrayContainsKey!0 (_keys!6387 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232883 () Bool)

(declare-fun e!151253 () Bool)

(assert (=> b!232883 (= e!151253 (not e!151254))))

(declare-fun res!114327 () Bool)

(assert (=> b!232883 (=> res!114327 e!151254)))

(declare-fun valid!1324 (LongMapFixedSize!3348) Bool)

(assert (=> b!232883 (= res!114327 (not (valid!1324 lt!117806)))))

(declare-fun lt!117809 () ListLongMap!3507)

(assert (=> b!232883 (contains!1637 lt!117809 key!932)))

(declare-fun lt!117793 () array!11515)

(declare-fun lt!117800 () Unit!7200)

(declare-fun lt!117802 () array!11513)

(declare-fun lemmaValidKeyInArrayIsInListMap!151 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 32) Int) Unit!7200)

(assert (=> b!232883 (= lt!117800 (lemmaValidKeyInArrayIsInListMap!151 lt!117793 lt!117802 (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) index!297 (defaultEntry!4333 thiss!1504)))))

(assert (=> b!232883 (= lt!117806 (LongMapFixedSize!3349 (defaultEntry!4333 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1723 thiss!1504)) lt!117793 lt!117802 (_vacant!1723 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232883 (= (arrayCountValidKeys!0 lt!117793 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117797 () Unit!7200)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11515 (_ BitVec 32)) Unit!7200)

(assert (=> b!232883 (= lt!117797 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117793 index!297))))

(assert (=> b!232883 (arrayContainsKey!0 lt!117793 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117805 () Unit!7200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11515 (_ BitVec 64) (_ BitVec 32)) Unit!7200)

(assert (=> b!232883 (= lt!117805 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117793 key!932 index!297))))

(declare-fun lt!117794 () ListLongMap!3507)

(assert (=> b!232883 (= lt!117794 lt!117809)))

(declare-fun getCurrentListMap!1297 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 32) Int) ListLongMap!3507)

(assert (=> b!232883 (= lt!117809 (getCurrentListMap!1297 lt!117793 lt!117802 (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4333 thiss!1504)))))

(declare-fun v!346 () V!7827)

(declare-fun lt!117803 () ListLongMap!3507)

(declare-fun +!629 (ListLongMap!3507 tuple2!4594) ListLongMap!3507)

(assert (=> b!232883 (= lt!117794 (+!629 lt!117803 (tuple2!4595 key!932 v!346)))))

(assert (=> b!232883 (= lt!117802 (array!11514 (store (arr!5476 (_values!4316 thiss!1504)) index!297 (ValueCellFull!2724 v!346)) (size!5809 (_values!4316 thiss!1504))))))

(declare-fun lt!117801 () Unit!7200)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!83 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 32) (_ BitVec 64) V!7827 Int) Unit!7200)

(assert (=> b!232883 (= lt!117801 (lemmaAddValidKeyToArrayThenAddPairToListMap!83 (_keys!6387 thiss!1504) (_values!4316 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) index!297 key!932 v!346 (defaultEntry!4333 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11515 (_ BitVec 32)) Bool)

(assert (=> b!232883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117793 (mask!10251 thiss!1504))))

(declare-fun lt!117792 () Unit!7200)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11515 (_ BitVec 32) (_ BitVec 32)) Unit!7200)

(assert (=> b!232883 (= lt!117792 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6387 thiss!1504) index!297 (mask!10251 thiss!1504)))))

(assert (=> b!232883 (= (arrayCountValidKeys!0 lt!117793 #b00000000000000000000000000000000 (size!5810 (_keys!6387 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6387 thiss!1504) #b00000000000000000000000000000000 (size!5810 (_keys!6387 thiss!1504)))))))

(declare-fun lt!117790 () Unit!7200)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11515 (_ BitVec 32) (_ BitVec 64)) Unit!7200)

(assert (=> b!232883 (= lt!117790 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6387 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3510 0))(
  ( (Nil!3507) (Cons!3506 (h!4154 (_ BitVec 64)) (t!8469 List!3510)) )
))
(declare-fun arrayNoDuplicates!0 (array!11515 (_ BitVec 32) List!3510) Bool)

(assert (=> b!232883 (arrayNoDuplicates!0 lt!117793 #b00000000000000000000000000000000 Nil!3507)))

(assert (=> b!232883 (= lt!117793 (array!11516 (store (arr!5477 (_keys!6387 thiss!1504)) index!297 key!932) (size!5810 (_keys!6387 thiss!1504))))))

(declare-fun lt!117808 () Unit!7200)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3510) Unit!7200)

(assert (=> b!232883 (= lt!117808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6387 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3507))))

(declare-fun lt!117795 () Unit!7200)

(declare-fun e!151260 () Unit!7200)

(assert (=> b!232883 (= lt!117795 e!151260)))

(declare-fun c!38735 () Bool)

(assert (=> b!232883 (= c!38735 (arrayContainsKey!0 (_keys!6387 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10372 () Bool)

(declare-fun mapRes!10372 () Bool)

(assert (=> mapIsEmpty!10372 mapRes!10372))

(declare-fun b!232884 () Bool)

(declare-fun e!151264 () Bool)

(declare-fun e!151263 () Bool)

(assert (=> b!232884 (= e!151264 (and e!151263 mapRes!10372))))

(declare-fun condMapEmpty!10372 () Bool)

(declare-fun mapDefault!10372 () ValueCell!2724)

(assert (=> b!232884 (= condMapEmpty!10372 (= (arr!5476 (_values!4316 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2724)) mapDefault!10372)))))

(declare-fun b!232885 () Bool)

(declare-fun tp_is_empty!6135 () Bool)

(assert (=> b!232885 (= e!151263 tp_is_empty!6135)))

(declare-fun res!114328 () Bool)

(assert (=> start!22206 (=> (not res!114328) (not e!151252))))

(assert (=> start!22206 (= res!114328 (valid!1324 thiss!1504))))

(assert (=> start!22206 e!151252))

(declare-fun e!151255 () Bool)

(assert (=> start!22206 e!151255))

(assert (=> start!22206 true))

(assert (=> start!22206 tp_is_empty!6135))

(declare-fun b!232874 () Bool)

(declare-fun Unit!7202 () Unit!7200)

(assert (=> b!232874 (= e!151260 Unit!7202)))

(declare-fun b!232886 () Bool)

(assert (=> b!232886 (= e!151265 (not call!21653))))

(declare-fun b!232887 () Bool)

(declare-fun e!151256 () Bool)

(assert (=> b!232887 (= e!151256 tp_is_empty!6135)))

(declare-fun b!232888 () Bool)

(declare-fun Unit!7203 () Unit!7200)

(assert (=> b!232888 (= e!151260 Unit!7203)))

(declare-fun lt!117791 () Unit!7200)

(declare-fun lemmaArrayContainsKeyThenInListMap!148 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 64) (_ BitVec 32) Int) Unit!7200)

(assert (=> b!232888 (= lt!117791 (lemmaArrayContainsKeyThenInListMap!148 (_keys!6387 thiss!1504) (_values!4316 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4333 thiss!1504)))))

(assert (=> b!232888 false))

(declare-fun b!232889 () Bool)

(declare-fun res!114322 () Bool)

(assert (=> b!232889 (= res!114322 (= (select (arr!5477 (_keys!6387 thiss!1504)) (index!6057 lt!117799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232889 (=> (not res!114322) (not e!151265))))

(declare-fun b!232890 () Bool)

(assert (=> b!232890 (= e!151261 e!151253)))

(declare-fun res!114323 () Bool)

(assert (=> b!232890 (=> (not res!114323) (not e!151253))))

(assert (=> b!232890 (= res!114323 (inRange!0 index!297 (mask!10251 thiss!1504)))))

(declare-fun lt!117796 () Unit!7200)

(assert (=> b!232890 (= lt!117796 e!151262)))

(declare-fun c!38736 () Bool)

(assert (=> b!232890 (= c!38736 (contains!1637 lt!117803 key!932))))

(assert (=> b!232890 (= lt!117803 (getCurrentListMap!1297 (_keys!6387 thiss!1504) (_values!4316 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4333 thiss!1504)))))

(declare-fun b!232891 () Bool)

(declare-fun Unit!7204 () Unit!7200)

(assert (=> b!232891 (= e!151262 Unit!7204)))

(declare-fun lt!117798 () Unit!7200)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7827 V!7827 (_ BitVec 64) Int) Unit!7200)

(assert (=> b!232891 (= lt!117798 (lemmaInListMapThenSeekEntryOrOpenFindsIt!313 (_keys!6387 thiss!1504) (_values!4316 thiss!1504) (mask!10251 thiss!1504) (extraKeys!4070 thiss!1504) (zeroValue!4174 thiss!1504) (minValue!4174 thiss!1504) key!932 (defaultEntry!4333 thiss!1504)))))

(assert (=> b!232891 false))

(declare-fun b!232892 () Bool)

(declare-fun res!114326 () Bool)

(assert (=> b!232892 (=> (not res!114326) (not e!151259))))

(assert (=> b!232892 (= res!114326 call!21654)))

(assert (=> b!232892 (= e!151251 e!151259)))

(declare-fun array_inv!3611 (array!11515) Bool)

(declare-fun array_inv!3612 (array!11513) Bool)

(assert (=> b!232893 (= e!151255 (and tp!21960 tp_is_empty!6135 (array_inv!3611 (_keys!6387 thiss!1504)) (array_inv!3612 (_values!4316 thiss!1504)) e!151264))))

(declare-fun b!232894 () Bool)

(declare-fun res!114324 () Bool)

(assert (=> b!232894 (=> (not res!114324) (not e!151259))))

(assert (=> b!232894 (= res!114324 (= (select (arr!5477 (_keys!6387 thiss!1504)) (index!6054 lt!117799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10372 () Bool)

(declare-fun tp!21961 () Bool)

(assert (=> mapNonEmpty!10372 (= mapRes!10372 (and tp!21961 e!151256))))

(declare-fun mapValue!10372 () ValueCell!2724)

(declare-fun mapKey!10372 () (_ BitVec 32))

(declare-fun mapRest!10372 () (Array (_ BitVec 32) ValueCell!2724))

(assert (=> mapNonEmpty!10372 (= (arr!5476 (_values!4316 thiss!1504)) (store mapRest!10372 mapKey!10372 mapValue!10372))))

(assert (= (and start!22206 res!114328) b!232879))

(assert (= (and b!232879 res!114320) b!232875))

(assert (= (and b!232875 res!114321) b!232890))

(assert (= (and b!232890 c!38736) b!232891))

(assert (= (and b!232890 (not c!38736)) b!232882))

(assert (= (and b!232882 c!38734) b!232892))

(assert (= (and b!232882 (not c!38734)) b!232881))

(assert (= (and b!232892 res!114326) b!232894))

(assert (= (and b!232894 res!114324) b!232876))

(assert (= (and b!232881 c!38733) b!232877))

(assert (= (and b!232881 (not c!38733)) b!232878))

(assert (= (and b!232877 res!114325) b!232889))

(assert (= (and b!232889 res!114322) b!232886))

(assert (= (or b!232892 b!232877) bm!21650))

(assert (= (or b!232876 b!232886) bm!21651))

(assert (= (and b!232890 res!114323) b!232883))

(assert (= (and b!232883 c!38735) b!232888))

(assert (= (and b!232883 (not c!38735)) b!232874))

(assert (= (and b!232883 (not res!114327)) b!232880))

(assert (= (and b!232884 condMapEmpty!10372) mapIsEmpty!10372))

(assert (= (and b!232884 (not condMapEmpty!10372)) mapNonEmpty!10372))

(assert (= (and mapNonEmpty!10372 ((_ is ValueCellFull!2724) mapValue!10372)) b!232887))

(assert (= (and b!232884 ((_ is ValueCellFull!2724) mapDefault!10372)) b!232885))

(assert (= b!232893 b!232884))

(assert (= start!22206 b!232893))

(declare-fun m!254357 () Bool)

(assert (=> b!232888 m!254357))

(declare-fun m!254359 () Bool)

(assert (=> b!232882 m!254359))

(declare-fun m!254361 () Bool)

(assert (=> mapNonEmpty!10372 m!254361))

(declare-fun m!254363 () Bool)

(assert (=> b!232893 m!254363))

(declare-fun m!254365 () Bool)

(assert (=> b!232893 m!254365))

(declare-fun m!254367 () Bool)

(assert (=> b!232891 m!254367))

(declare-fun m!254369 () Bool)

(assert (=> b!232894 m!254369))

(declare-fun m!254371 () Bool)

(assert (=> b!232875 m!254371))

(declare-fun m!254373 () Bool)

(assert (=> b!232883 m!254373))

(declare-fun m!254375 () Bool)

(assert (=> b!232883 m!254375))

(declare-fun m!254377 () Bool)

(assert (=> b!232883 m!254377))

(declare-fun m!254379 () Bool)

(assert (=> b!232883 m!254379))

(declare-fun m!254381 () Bool)

(assert (=> b!232883 m!254381))

(declare-fun m!254383 () Bool)

(assert (=> b!232883 m!254383))

(declare-fun m!254385 () Bool)

(assert (=> b!232883 m!254385))

(declare-fun m!254387 () Bool)

(assert (=> b!232883 m!254387))

(declare-fun m!254389 () Bool)

(assert (=> b!232883 m!254389))

(declare-fun m!254391 () Bool)

(assert (=> b!232883 m!254391))

(declare-fun m!254393 () Bool)

(assert (=> b!232883 m!254393))

(declare-fun m!254395 () Bool)

(assert (=> b!232883 m!254395))

(declare-fun m!254397 () Bool)

(assert (=> b!232883 m!254397))

(declare-fun m!254399 () Bool)

(assert (=> b!232883 m!254399))

(declare-fun m!254401 () Bool)

(assert (=> b!232883 m!254401))

(declare-fun m!254403 () Bool)

(assert (=> b!232883 m!254403))

(declare-fun m!254405 () Bool)

(assert (=> b!232883 m!254405))

(declare-fun m!254407 () Bool)

(assert (=> b!232883 m!254407))

(declare-fun m!254409 () Bool)

(assert (=> b!232883 m!254409))

(declare-fun m!254411 () Bool)

(assert (=> b!232883 m!254411))

(assert (=> bm!21651 m!254395))

(declare-fun m!254413 () Bool)

(assert (=> b!232880 m!254413))

(assert (=> b!232880 m!254413))

(declare-fun m!254415 () Bool)

(assert (=> b!232880 m!254415))

(declare-fun m!254417 () Bool)

(assert (=> b!232889 m!254417))

(declare-fun m!254419 () Bool)

(assert (=> b!232890 m!254419))

(declare-fun m!254421 () Bool)

(assert (=> b!232890 m!254421))

(declare-fun m!254423 () Bool)

(assert (=> b!232890 m!254423))

(declare-fun m!254425 () Bool)

(assert (=> start!22206 m!254425))

(declare-fun m!254427 () Bool)

(assert (=> bm!21650 m!254427))

(check-sat (not b!232880) (not b!232883) (not b!232893) (not b!232882) (not bm!21650) (not start!22206) (not b!232888) b_and!13171 (not bm!21651) (not b!232891) (not mapNonEmpty!10372) (not b!232890) (not b!232875) tp_is_empty!6135 (not b_next!6273))
(check-sat b_and!13171 (not b_next!6273))
