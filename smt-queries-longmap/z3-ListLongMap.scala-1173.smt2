; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25186 () Bool)

(assert start!25186)

(declare-fun b!262485 () Bool)

(declare-fun b_free!6789 () Bool)

(declare-fun b_next!6789 () Bool)

(assert (=> b!262485 (= b_free!6789 (not b_next!6789))))

(declare-fun tp!23700 () Bool)

(declare-fun b_and!13927 () Bool)

(assert (=> b!262485 (= tp!23700 b_and!13927)))

(declare-fun b!262471 () Bool)

(declare-datatypes ((Unit!8175 0))(
  ( (Unit!8176) )
))
(declare-fun e!170094 () Unit!8175)

(declare-fun Unit!8177 () Unit!8175)

(assert (=> b!262471 (= e!170094 Unit!8177)))

(declare-fun lt!132689 () Unit!8175)

(declare-datatypes ((V!8515 0))(
  ( (V!8516 (val!3370 Int)) )
))
(declare-datatypes ((ValueCell!2982 0))(
  ( (ValueCellFull!2982 (v!5498 V!8515)) (EmptyCell!2982) )
))
(declare-datatypes ((array!12661 0))(
  ( (array!12662 (arr!5992 (Array (_ BitVec 32) ValueCell!2982)) (size!6343 (_ BitVec 32))) )
))
(declare-datatypes ((array!12663 0))(
  ( (array!12664 (arr!5993 (Array (_ BitVec 32) (_ BitVec 64))) (size!6344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3864 0))(
  ( (LongMapFixedSize!3865 (defaultEntry!4835 Int) (mask!11194 (_ BitVec 32)) (extraKeys!4572 (_ BitVec 32)) (zeroValue!4676 V!8515) (minValue!4676 V!8515) (_size!1981 (_ BitVec 32)) (_keys!7025 array!12663) (_values!4818 array!12661) (_vacant!1981 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3864)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!453 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) Int) Unit!8175)

(assert (=> b!262471 (= lt!132689 (lemmaInListMapThenSeekEntryOrOpenFindsIt!453 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)))))

(assert (=> b!262471 false))

(declare-fun b!262472 () Bool)

(declare-fun res!128199 () Bool)

(declare-fun e!170099 () Bool)

(assert (=> b!262472 (=> (not res!128199) (not e!170099))))

(declare-datatypes ((SeekEntryResult!1197 0))(
  ( (MissingZero!1197 (index!6958 (_ BitVec 32))) (Found!1197 (index!6959 (_ BitVec 32))) (Intermediate!1197 (undefined!2009 Bool) (index!6960 (_ BitVec 32)) (x!25221 (_ BitVec 32))) (Undefined!1197) (MissingVacant!1197 (index!6961 (_ BitVec 32))) )
))
(declare-fun lt!132682 () SeekEntryResult!1197)

(assert (=> b!262472 (= res!128199 (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6958 lt!132682)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262473 () Bool)

(declare-fun e!170102 () Bool)

(get-info :version)

(assert (=> b!262473 (= e!170102 ((_ is Undefined!1197) lt!132682))))

(declare-fun b!262474 () Bool)

(declare-fun e!170105 () Bool)

(assert (=> b!262474 (= e!170102 e!170105)))

(declare-fun res!128204 () Bool)

(declare-fun call!25084 () Bool)

(assert (=> b!262474 (= res!128204 call!25084)))

(assert (=> b!262474 (=> (not res!128204) (not e!170105))))

(declare-fun b!262475 () Bool)

(declare-fun res!128208 () Bool)

(declare-fun e!170097 () Bool)

(assert (=> b!262475 (=> res!128208 e!170097)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!262475 (= res!128208 (or (not (= (size!6343 (_values!4818 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11194 thiss!1504)))) (not (= (size!6344 (_keys!7025 thiss!1504)) (size!6343 (_values!4818 thiss!1504)))) (bvslt (mask!11194 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4572 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4572 thiss!1504) #b00000000000000000000000000000011) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6344 (_keys!7025 thiss!1504)))))))

(declare-fun b!262476 () Bool)

(declare-fun res!128205 () Bool)

(assert (=> b!262476 (=> (not res!128205) (not e!170099))))

(assert (=> b!262476 (= res!128205 call!25084)))

(declare-fun e!170107 () Bool)

(assert (=> b!262476 (= e!170107 e!170099)))

(declare-fun b!262477 () Bool)

(declare-fun e!170096 () Unit!8175)

(declare-fun Unit!8178 () Unit!8175)

(assert (=> b!262477 (= e!170096 Unit!8178)))

(declare-fun b!262478 () Bool)

(declare-fun call!25085 () Bool)

(assert (=> b!262478 (= e!170105 (not call!25085))))

(declare-fun b!262479 () Bool)

(declare-fun e!170098 () Bool)

(assert (=> b!262479 (= e!170098 (not e!170097))))

(declare-fun res!128206 () Bool)

(assert (=> b!262479 (=> res!128206 e!170097)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262479 (= res!128206 (not (validMask!0 (mask!11194 thiss!1504))))))

(declare-fun lt!132679 () array!12663)

(declare-fun arrayCountValidKeys!0 (array!12663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262479 (= (arrayCountValidKeys!0 lt!132679 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132684 () Unit!8175)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12663 (_ BitVec 32)) Unit!8175)

(assert (=> b!262479 (= lt!132684 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132679 index!297))))

(declare-fun arrayContainsKey!0 (array!12663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!262479 (arrayContainsKey!0 lt!132679 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132683 () Unit!8175)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12663 (_ BitVec 64) (_ BitVec 32)) Unit!8175)

(assert (=> b!262479 (= lt!132683 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132679 key!932 index!297))))

(declare-fun v!346 () V!8515)

(declare-datatypes ((tuple2!4972 0))(
  ( (tuple2!4973 (_1!2497 (_ BitVec 64)) (_2!2497 V!8515)) )
))
(declare-datatypes ((List!3847 0))(
  ( (Nil!3844) (Cons!3843 (h!4509 tuple2!4972) (t!8922 List!3847)) )
))
(declare-datatypes ((ListLongMap!3885 0))(
  ( (ListLongMap!3886 (toList!1958 List!3847)) )
))
(declare-fun lt!132686 () ListLongMap!3885)

(declare-fun +!708 (ListLongMap!3885 tuple2!4972) ListLongMap!3885)

(declare-fun getCurrentListMap!1486 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 32) Int) ListLongMap!3885)

(assert (=> b!262479 (= (+!708 lt!132686 (tuple2!4973 key!932 v!346)) (getCurrentListMap!1486 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132688 () Unit!8175)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!118 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 32) (_ BitVec 64) V!8515 Int) Unit!8175)

(assert (=> b!262479 (= lt!132688 (lemmaAddValidKeyToArrayThenAddPairToListMap!118 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) index!297 key!932 v!346 (defaultEntry!4835 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12663 (_ BitVec 32)) Bool)

(assert (=> b!262479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132679 (mask!11194 thiss!1504))))

(declare-fun lt!132678 () Unit!8175)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12663 (_ BitVec 32) (_ BitVec 32)) Unit!8175)

(assert (=> b!262479 (= lt!132678 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) index!297 (mask!11194 thiss!1504)))))

(assert (=> b!262479 (= (arrayCountValidKeys!0 lt!132679 #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7025 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504)))))))

(declare-fun lt!132685 () Unit!8175)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12663 (_ BitVec 32) (_ BitVec 64)) Unit!8175)

(assert (=> b!262479 (= lt!132685 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7025 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3848 0))(
  ( (Nil!3845) (Cons!3844 (h!4510 (_ BitVec 64)) (t!8923 List!3848)) )
))
(declare-fun arrayNoDuplicates!0 (array!12663 (_ BitVec 32) List!3848) Bool)

(assert (=> b!262479 (arrayNoDuplicates!0 lt!132679 #b00000000000000000000000000000000 Nil!3845)))

(assert (=> b!262479 (= lt!132679 (array!12664 (store (arr!5993 (_keys!7025 thiss!1504)) index!297 key!932) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun lt!132677 () Unit!8175)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12663 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3848) Unit!8175)

(assert (=> b!262479 (= lt!132677 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7025 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3845))))

(declare-fun lt!132681 () Unit!8175)

(assert (=> b!262479 (= lt!132681 e!170096)))

(declare-fun c!44730 () Bool)

(assert (=> b!262479 (= c!44730 (arrayContainsKey!0 (_keys!7025 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!25081 () Bool)

(declare-fun c!44729 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!25081 (= call!25084 (inRange!0 (ite c!44729 (index!6958 lt!132682) (index!6961 lt!132682)) (mask!11194 thiss!1504)))))

(declare-fun bm!25082 () Bool)

(assert (=> bm!25082 (= call!25085 (arrayContainsKey!0 (_keys!7025 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262480 () Bool)

(assert (=> b!262480 (= e!170099 (not call!25085))))

(declare-fun b!262481 () Bool)

(declare-fun e!170104 () Bool)

(declare-fun e!170106 () Bool)

(declare-fun mapRes!11338 () Bool)

(assert (=> b!262481 (= e!170104 (and e!170106 mapRes!11338))))

(declare-fun condMapEmpty!11338 () Bool)

(declare-fun mapDefault!11338 () ValueCell!2982)

(assert (=> b!262481 (= condMapEmpty!11338 (= (arr!5992 (_values!4818 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2982)) mapDefault!11338)))))

(declare-fun b!262482 () Bool)

(declare-fun Unit!8179 () Unit!8175)

(assert (=> b!262482 (= e!170096 Unit!8179)))

(declare-fun lt!132690 () Unit!8175)

(declare-fun lemmaArrayContainsKeyThenInListMap!260 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) (_ BitVec 32) Int) Unit!8175)

(assert (=> b!262482 (= lt!132690 (lemmaArrayContainsKeyThenInListMap!260 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(assert (=> b!262482 false))

(declare-fun b!262483 () Bool)

(declare-fun res!128202 () Bool)

(declare-fun e!170101 () Bool)

(assert (=> b!262483 (=> (not res!128202) (not e!170101))))

(assert (=> b!262483 (= res!128202 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262484 () Bool)

(declare-fun e!170093 () Bool)

(assert (=> b!262484 (= e!170093 e!170098)))

(declare-fun res!128207 () Bool)

(assert (=> b!262484 (=> (not res!128207) (not e!170098))))

(assert (=> b!262484 (= res!128207 (inRange!0 index!297 (mask!11194 thiss!1504)))))

(declare-fun lt!132680 () Unit!8175)

(assert (=> b!262484 (= lt!132680 e!170094)))

(declare-fun c!44727 () Bool)

(declare-fun contains!1907 (ListLongMap!3885 (_ BitVec 64)) Bool)

(assert (=> b!262484 (= c!44727 (contains!1907 lt!132686 key!932))))

(assert (=> b!262484 (= lt!132686 (getCurrentListMap!1486 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun e!170095 () Bool)

(declare-fun tp_is_empty!6651 () Bool)

(declare-fun array_inv!3959 (array!12663) Bool)

(declare-fun array_inv!3960 (array!12661) Bool)

(assert (=> b!262485 (= e!170095 (and tp!23700 tp_is_empty!6651 (array_inv!3959 (_keys!7025 thiss!1504)) (array_inv!3960 (_values!4818 thiss!1504)) e!170104))))

(declare-fun b!262486 () Bool)

(assert (=> b!262486 (= e!170101 e!170093)))

(declare-fun res!128203 () Bool)

(assert (=> b!262486 (=> (not res!128203) (not e!170093))))

(assert (=> b!262486 (= res!128203 (or (= lt!132682 (MissingZero!1197 index!297)) (= lt!132682 (MissingVacant!1197 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12663 (_ BitVec 32)) SeekEntryResult!1197)

(assert (=> b!262486 (= lt!132682 (seekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(declare-fun b!262487 () Bool)

(declare-fun e!170103 () Bool)

(assert (=> b!262487 (= e!170103 tp_is_empty!6651)))

(declare-fun b!262488 () Bool)

(assert (=> b!262488 (= e!170106 tp_is_empty!6651)))

(declare-fun b!262489 () Bool)

(declare-fun lt!132687 () Unit!8175)

(assert (=> b!262489 (= e!170094 lt!132687)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!453 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) Int) Unit!8175)

(assert (=> b!262489 (= lt!132687 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!453 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)))))

(assert (=> b!262489 (= c!44729 ((_ is MissingZero!1197) lt!132682))))

(assert (=> b!262489 e!170107))

(declare-fun res!128200 () Bool)

(assert (=> start!25186 (=> (not res!128200) (not e!170101))))

(declare-fun valid!1506 (LongMapFixedSize!3864) Bool)

(assert (=> start!25186 (= res!128200 (valid!1506 thiss!1504))))

(assert (=> start!25186 e!170101))

(assert (=> start!25186 e!170095))

(assert (=> start!25186 true))

(assert (=> start!25186 tp_is_empty!6651))

(declare-fun mapIsEmpty!11338 () Bool)

(assert (=> mapIsEmpty!11338 mapRes!11338))

(declare-fun mapNonEmpty!11338 () Bool)

(declare-fun tp!23701 () Bool)

(assert (=> mapNonEmpty!11338 (= mapRes!11338 (and tp!23701 e!170103))))

(declare-fun mapValue!11338 () ValueCell!2982)

(declare-fun mapRest!11338 () (Array (_ BitVec 32) ValueCell!2982))

(declare-fun mapKey!11338 () (_ BitVec 32))

(assert (=> mapNonEmpty!11338 (= (arr!5992 (_values!4818 thiss!1504)) (store mapRest!11338 mapKey!11338 mapValue!11338))))

(declare-fun b!262490 () Bool)

(declare-fun c!44728 () Bool)

(assert (=> b!262490 (= c!44728 ((_ is MissingVacant!1197) lt!132682))))

(assert (=> b!262490 (= e!170107 e!170102)))

(declare-fun b!262491 () Bool)

(declare-fun res!128201 () Bool)

(assert (=> b!262491 (= res!128201 (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6961 lt!132682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262491 (=> (not res!128201) (not e!170105))))

(declare-fun b!262492 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262492 (= e!170097 (validKeyInArray!0 key!932))))

(assert (= (and start!25186 res!128200) b!262483))

(assert (= (and b!262483 res!128202) b!262486))

(assert (= (and b!262486 res!128203) b!262484))

(assert (= (and b!262484 c!44727) b!262471))

(assert (= (and b!262484 (not c!44727)) b!262489))

(assert (= (and b!262489 c!44729) b!262476))

(assert (= (and b!262489 (not c!44729)) b!262490))

(assert (= (and b!262476 res!128205) b!262472))

(assert (= (and b!262472 res!128199) b!262480))

(assert (= (and b!262490 c!44728) b!262474))

(assert (= (and b!262490 (not c!44728)) b!262473))

(assert (= (and b!262474 res!128204) b!262491))

(assert (= (and b!262491 res!128201) b!262478))

(assert (= (or b!262476 b!262474) bm!25081))

(assert (= (or b!262480 b!262478) bm!25082))

(assert (= (and b!262484 res!128207) b!262479))

(assert (= (and b!262479 c!44730) b!262482))

(assert (= (and b!262479 (not c!44730)) b!262477))

(assert (= (and b!262479 (not res!128206)) b!262475))

(assert (= (and b!262475 (not res!128208)) b!262492))

(assert (= (and b!262481 condMapEmpty!11338) mapIsEmpty!11338))

(assert (= (and b!262481 (not condMapEmpty!11338)) mapNonEmpty!11338))

(assert (= (and mapNonEmpty!11338 ((_ is ValueCellFull!2982) mapValue!11338)) b!262487))

(assert (= (and b!262481 ((_ is ValueCellFull!2982) mapDefault!11338)) b!262488))

(assert (= b!262485 b!262481))

(assert (= start!25186 b!262485))

(declare-fun m!278545 () Bool)

(assert (=> b!262485 m!278545))

(declare-fun m!278547 () Bool)

(assert (=> b!262485 m!278547))

(declare-fun m!278549 () Bool)

(assert (=> bm!25082 m!278549))

(declare-fun m!278551 () Bool)

(assert (=> b!262484 m!278551))

(declare-fun m!278553 () Bool)

(assert (=> b!262484 m!278553))

(declare-fun m!278555 () Bool)

(assert (=> b!262484 m!278555))

(assert (=> b!262479 m!278549))

(declare-fun m!278557 () Bool)

(assert (=> b!262479 m!278557))

(declare-fun m!278559 () Bool)

(assert (=> b!262479 m!278559))

(declare-fun m!278561 () Bool)

(assert (=> b!262479 m!278561))

(declare-fun m!278563 () Bool)

(assert (=> b!262479 m!278563))

(declare-fun m!278565 () Bool)

(assert (=> b!262479 m!278565))

(declare-fun m!278567 () Bool)

(assert (=> b!262479 m!278567))

(declare-fun m!278569 () Bool)

(assert (=> b!262479 m!278569))

(declare-fun m!278571 () Bool)

(assert (=> b!262479 m!278571))

(declare-fun m!278573 () Bool)

(assert (=> b!262479 m!278573))

(declare-fun m!278575 () Bool)

(assert (=> b!262479 m!278575))

(declare-fun m!278577 () Bool)

(assert (=> b!262479 m!278577))

(declare-fun m!278579 () Bool)

(assert (=> b!262479 m!278579))

(declare-fun m!278581 () Bool)

(assert (=> b!262479 m!278581))

(declare-fun m!278583 () Bool)

(assert (=> b!262479 m!278583))

(declare-fun m!278585 () Bool)

(assert (=> b!262479 m!278585))

(declare-fun m!278587 () Bool)

(assert (=> b!262479 m!278587))

(declare-fun m!278589 () Bool)

(assert (=> b!262479 m!278589))

(declare-fun m!278591 () Bool)

(assert (=> b!262486 m!278591))

(declare-fun m!278593 () Bool)

(assert (=> bm!25081 m!278593))

(declare-fun m!278595 () Bool)

(assert (=> b!262472 m!278595))

(declare-fun m!278597 () Bool)

(assert (=> b!262482 m!278597))

(declare-fun m!278599 () Bool)

(assert (=> b!262471 m!278599))

(declare-fun m!278601 () Bool)

(assert (=> b!262492 m!278601))

(declare-fun m!278603 () Bool)

(assert (=> b!262491 m!278603))

(declare-fun m!278605 () Bool)

(assert (=> start!25186 m!278605))

(declare-fun m!278607 () Bool)

(assert (=> b!262489 m!278607))

(declare-fun m!278609 () Bool)

(assert (=> mapNonEmpty!11338 m!278609))

(check-sat (not bm!25082) (not bm!25081) (not b!262492) (not b!262485) (not b!262471) (not start!25186) (not b!262479) tp_is_empty!6651 (not b!262482) (not mapNonEmpty!11338) (not b!262486) b_and!13927 (not b!262484) (not b_next!6789) (not b!262489))
(check-sat b_and!13927 (not b_next!6789))
(get-model)

(declare-fun d!63019 () Bool)

(declare-fun e!170158 () Bool)

(assert (=> d!63019 e!170158))

(declare-fun res!128249 () Bool)

(assert (=> d!63019 (=> (not res!128249) (not e!170158))))

(assert (=> d!63019 (= res!128249 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7025 thiss!1504)))))))

(declare-fun lt!132735 () Unit!8175)

(declare-fun choose!1 (array!12663 (_ BitVec 32) (_ BitVec 64)) Unit!8175)

(assert (=> d!63019 (= lt!132735 (choose!1 (_keys!7025 thiss!1504) index!297 key!932))))

(declare-fun e!170157 () Bool)

(assert (=> d!63019 e!170157))

(declare-fun res!128247 () Bool)

(assert (=> d!63019 (=> (not res!128247) (not e!170157))))

(assert (=> d!63019 (= res!128247 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7025 thiss!1504)))))))

(assert (=> d!63019 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7025 thiss!1504) index!297 key!932) lt!132735)))

(declare-fun b!262567 () Bool)

(declare-fun res!128250 () Bool)

(assert (=> b!262567 (=> (not res!128250) (not e!170157))))

(assert (=> b!262567 (= res!128250 (not (validKeyInArray!0 (select (arr!5993 (_keys!7025 thiss!1504)) index!297))))))

(declare-fun b!262570 () Bool)

(assert (=> b!262570 (= e!170158 (= (arrayCountValidKeys!0 (array!12664 (store (arr!5993 (_keys!7025 thiss!1504)) index!297 key!932) (size!6344 (_keys!7025 thiss!1504))) #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7025 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!262568 () Bool)

(declare-fun res!128248 () Bool)

(assert (=> b!262568 (=> (not res!128248) (not e!170157))))

(assert (=> b!262568 (= res!128248 (validKeyInArray!0 key!932))))

(declare-fun b!262569 () Bool)

(assert (=> b!262569 (= e!170157 (bvslt (size!6344 (_keys!7025 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!63019 res!128247) b!262567))

(assert (= (and b!262567 res!128250) b!262568))

(assert (= (and b!262568 res!128248) b!262569))

(assert (= (and d!63019 res!128249) b!262570))

(declare-fun m!278677 () Bool)

(assert (=> d!63019 m!278677))

(declare-fun m!278679 () Bool)

(assert (=> b!262567 m!278679))

(assert (=> b!262567 m!278679))

(declare-fun m!278681 () Bool)

(assert (=> b!262567 m!278681))

(assert (=> b!262570 m!278573))

(declare-fun m!278683 () Bool)

(assert (=> b!262570 m!278683))

(assert (=> b!262570 m!278575))

(assert (=> b!262568 m!278601))

(assert (=> b!262479 d!63019))

(declare-fun d!63021 () Bool)

(assert (=> d!63021 (arrayContainsKey!0 lt!132679 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132738 () Unit!8175)

(declare-fun choose!13 (array!12663 (_ BitVec 64) (_ BitVec 32)) Unit!8175)

(assert (=> d!63021 (= lt!132738 (choose!13 lt!132679 key!932 index!297))))

(assert (=> d!63021 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!63021 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132679 key!932 index!297) lt!132738)))

(declare-fun bs!9242 () Bool)

(assert (= bs!9242 d!63021))

(assert (=> bs!9242 m!278583))

(declare-fun m!278685 () Bool)

(assert (=> bs!9242 m!278685))

(assert (=> b!262479 d!63021))

(declare-fun b!262579 () Bool)

(declare-fun e!170163 () (_ BitVec 32))

(declare-fun call!25094 () (_ BitVec 32))

(assert (=> b!262579 (= e!170163 call!25094)))

(declare-fun bm!25091 () Bool)

(assert (=> bm!25091 (= call!25094 (arrayCountValidKeys!0 (_keys!7025 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun d!63023 () Bool)

(declare-fun lt!132741 () (_ BitVec 32))

(assert (=> d!63023 (and (bvsge lt!132741 #b00000000000000000000000000000000) (bvsle lt!132741 (bvsub (size!6344 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!170164 () (_ BitVec 32))

(assert (=> d!63023 (= lt!132741 e!170164)))

(declare-fun c!44747 () Bool)

(assert (=> d!63023 (= c!44747 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(assert (=> d!63023 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7025 thiss!1504)) (size!6344 (_keys!7025 thiss!1504))))))

(assert (=> d!63023 (= (arrayCountValidKeys!0 (_keys!7025 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) lt!132741)))

(declare-fun b!262580 () Bool)

(assert (=> b!262580 (= e!170164 e!170163)))

(declare-fun c!44748 () Bool)

(assert (=> b!262580 (= c!44748 (validKeyInArray!0 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262581 () Bool)

(assert (=> b!262581 (= e!170164 #b00000000000000000000000000000000)))

(declare-fun b!262582 () Bool)

(assert (=> b!262582 (= e!170163 (bvadd #b00000000000000000000000000000001 call!25094))))

(assert (= (and d!63023 c!44747) b!262581))

(assert (= (and d!63023 (not c!44747)) b!262580))

(assert (= (and b!262580 c!44748) b!262582))

(assert (= (and b!262580 (not c!44748)) b!262579))

(assert (= (or b!262582 b!262579) bm!25091))

(declare-fun m!278687 () Bool)

(assert (=> bm!25091 m!278687))

(declare-fun m!278689 () Bool)

(assert (=> b!262580 m!278689))

(assert (=> b!262580 m!278689))

(declare-fun m!278691 () Bool)

(assert (=> b!262580 m!278691))

(assert (=> b!262479 d!63023))

(declare-fun d!63025 () Bool)

(declare-fun e!170167 () Bool)

(assert (=> d!63025 e!170167))

(declare-fun res!128253 () Bool)

(assert (=> d!63025 (=> (not res!128253) (not e!170167))))

(assert (=> d!63025 (= res!128253 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7025 thiss!1504))) (bvslt index!297 (size!6343 (_values!4818 thiss!1504)))))))

(declare-fun lt!132744 () Unit!8175)

(declare-fun choose!1284 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 32) (_ BitVec 64) V!8515 Int) Unit!8175)

(assert (=> d!63025 (= lt!132744 (choose!1284 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) index!297 key!932 v!346 (defaultEntry!4835 thiss!1504)))))

(assert (=> d!63025 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63025 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!118 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) index!297 key!932 v!346 (defaultEntry!4835 thiss!1504)) lt!132744)))

(declare-fun b!262585 () Bool)

(assert (=> b!262585 (= e!170167 (= (+!708 (getCurrentListMap!1486 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)) (tuple2!4973 key!932 v!346)) (getCurrentListMap!1486 (array!12664 (store (arr!5993 (_keys!7025 thiss!1504)) index!297 key!932) (size!6344 (_keys!7025 thiss!1504))) (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504))))))

(assert (= (and d!63025 res!128253) b!262585))

(declare-fun m!278693 () Bool)

(assert (=> d!63025 m!278693))

(assert (=> d!63025 m!278585))

(declare-fun m!278695 () Bool)

(assert (=> b!262585 m!278695))

(assert (=> b!262585 m!278559))

(assert (=> b!262585 m!278555))

(declare-fun m!278697 () Bool)

(assert (=> b!262585 m!278697))

(assert (=> b!262585 m!278573))

(assert (=> b!262585 m!278555))

(assert (=> b!262479 d!63025))

(declare-fun b!262586 () Bool)

(declare-fun e!170168 () (_ BitVec 32))

(declare-fun call!25095 () (_ BitVec 32))

(assert (=> b!262586 (= e!170168 call!25095)))

(declare-fun bm!25092 () Bool)

(assert (=> bm!25092 (= call!25095 (arrayCountValidKeys!0 lt!132679 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!63027 () Bool)

(declare-fun lt!132745 () (_ BitVec 32))

(assert (=> d!63027 (and (bvsge lt!132745 #b00000000000000000000000000000000) (bvsle lt!132745 (bvsub (size!6344 lt!132679) index!297)))))

(declare-fun e!170169 () (_ BitVec 32))

(assert (=> d!63027 (= lt!132745 e!170169)))

(declare-fun c!44749 () Bool)

(assert (=> d!63027 (= c!44749 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63027 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6344 lt!132679)))))

(assert (=> d!63027 (= (arrayCountValidKeys!0 lt!132679 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132745)))

(declare-fun b!262587 () Bool)

(assert (=> b!262587 (= e!170169 e!170168)))

(declare-fun c!44750 () Bool)

(assert (=> b!262587 (= c!44750 (validKeyInArray!0 (select (arr!5993 lt!132679) index!297)))))

(declare-fun b!262588 () Bool)

(assert (=> b!262588 (= e!170169 #b00000000000000000000000000000000)))

(declare-fun b!262589 () Bool)

(assert (=> b!262589 (= e!170168 (bvadd #b00000000000000000000000000000001 call!25095))))

(assert (= (and d!63027 c!44749) b!262588))

(assert (= (and d!63027 (not c!44749)) b!262587))

(assert (= (and b!262587 c!44750) b!262589))

(assert (= (and b!262587 (not c!44750)) b!262586))

(assert (= (or b!262589 b!262586) bm!25092))

(declare-fun m!278699 () Bool)

(assert (=> bm!25092 m!278699))

(declare-fun m!278701 () Bool)

(assert (=> b!262587 m!278701))

(assert (=> b!262587 m!278701))

(declare-fun m!278703 () Bool)

(assert (=> b!262587 m!278703))

(assert (=> b!262479 d!63027))

(declare-fun d!63029 () Bool)

(assert (=> d!63029 (= (arrayCountValidKeys!0 lt!132679 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132748 () Unit!8175)

(declare-fun choose!2 (array!12663 (_ BitVec 32)) Unit!8175)

(assert (=> d!63029 (= lt!132748 (choose!2 lt!132679 index!297))))

(declare-fun e!170172 () Bool)

(assert (=> d!63029 e!170172))

(declare-fun res!128258 () Bool)

(assert (=> d!63029 (=> (not res!128258) (not e!170172))))

(assert (=> d!63029 (= res!128258 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 lt!132679))))))

(assert (=> d!63029 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132679 index!297) lt!132748)))

(declare-fun b!262594 () Bool)

(declare-fun res!128259 () Bool)

(assert (=> b!262594 (=> (not res!128259) (not e!170172))))

(assert (=> b!262594 (= res!128259 (validKeyInArray!0 (select (arr!5993 lt!132679) index!297)))))

(declare-fun b!262595 () Bool)

(assert (=> b!262595 (= e!170172 (bvslt (size!6344 lt!132679) #b01111111111111111111111111111111))))

(assert (= (and d!63029 res!128258) b!262594))

(assert (= (and b!262594 res!128259) b!262595))

(declare-fun m!278705 () Bool)

(assert (=> d!63029 m!278705))

(declare-fun m!278707 () Bool)

(assert (=> d!63029 m!278707))

(assert (=> b!262594 m!278701))

(assert (=> b!262594 m!278701))

(assert (=> b!262594 m!278703))

(assert (=> b!262479 d!63029))

(declare-fun d!63031 () Bool)

(declare-fun e!170175 () Bool)

(assert (=> d!63031 e!170175))

(declare-fun res!128264 () Bool)

(assert (=> d!63031 (=> (not res!128264) (not e!170175))))

(declare-fun lt!132759 () ListLongMap!3885)

(assert (=> d!63031 (= res!128264 (contains!1907 lt!132759 (_1!2497 (tuple2!4973 key!932 v!346))))))

(declare-fun lt!132757 () List!3847)

(assert (=> d!63031 (= lt!132759 (ListLongMap!3886 lt!132757))))

(declare-fun lt!132760 () Unit!8175)

(declare-fun lt!132758 () Unit!8175)

(assert (=> d!63031 (= lt!132760 lt!132758)))

(declare-datatypes ((Option!325 0))(
  ( (Some!324 (v!5502 V!8515)) (None!323) )
))
(declare-fun getValueByKey!319 (List!3847 (_ BitVec 64)) Option!325)

(assert (=> d!63031 (= (getValueByKey!319 lt!132757 (_1!2497 (tuple2!4973 key!932 v!346))) (Some!324 (_2!2497 (tuple2!4973 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!175 (List!3847 (_ BitVec 64) V!8515) Unit!8175)

(assert (=> d!63031 (= lt!132758 (lemmaContainsTupThenGetReturnValue!175 lt!132757 (_1!2497 (tuple2!4973 key!932 v!346)) (_2!2497 (tuple2!4973 key!932 v!346))))))

(declare-fun insertStrictlySorted!178 (List!3847 (_ BitVec 64) V!8515) List!3847)

(assert (=> d!63031 (= lt!132757 (insertStrictlySorted!178 (toList!1958 lt!132686) (_1!2497 (tuple2!4973 key!932 v!346)) (_2!2497 (tuple2!4973 key!932 v!346))))))

(assert (=> d!63031 (= (+!708 lt!132686 (tuple2!4973 key!932 v!346)) lt!132759)))

(declare-fun b!262600 () Bool)

(declare-fun res!128265 () Bool)

(assert (=> b!262600 (=> (not res!128265) (not e!170175))))

(assert (=> b!262600 (= res!128265 (= (getValueByKey!319 (toList!1958 lt!132759) (_1!2497 (tuple2!4973 key!932 v!346))) (Some!324 (_2!2497 (tuple2!4973 key!932 v!346)))))))

(declare-fun b!262601 () Bool)

(declare-fun contains!1909 (List!3847 tuple2!4972) Bool)

(assert (=> b!262601 (= e!170175 (contains!1909 (toList!1958 lt!132759) (tuple2!4973 key!932 v!346)))))

(assert (= (and d!63031 res!128264) b!262600))

(assert (= (and b!262600 res!128265) b!262601))

(declare-fun m!278709 () Bool)

(assert (=> d!63031 m!278709))

(declare-fun m!278711 () Bool)

(assert (=> d!63031 m!278711))

(declare-fun m!278713 () Bool)

(assert (=> d!63031 m!278713))

(declare-fun m!278715 () Bool)

(assert (=> d!63031 m!278715))

(declare-fun m!278717 () Bool)

(assert (=> b!262600 m!278717))

(declare-fun m!278719 () Bool)

(assert (=> b!262601 m!278719))

(assert (=> b!262479 d!63031))

(declare-fun bm!25095 () Bool)

(declare-fun call!25098 () Bool)

(assert (=> bm!25095 (= call!25098 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132679 (mask!11194 thiss!1504)))))

(declare-fun b!262610 () Bool)

(declare-fun e!170184 () Bool)

(assert (=> b!262610 (= e!170184 call!25098)))

(declare-fun d!63033 () Bool)

(declare-fun res!128270 () Bool)

(declare-fun e!170182 () Bool)

(assert (=> d!63033 (=> res!128270 e!170182)))

(assert (=> d!63033 (= res!128270 (bvsge #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(assert (=> d!63033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132679 (mask!11194 thiss!1504)) e!170182)))

(declare-fun b!262611 () Bool)

(declare-fun e!170183 () Bool)

(assert (=> b!262611 (= e!170182 e!170183)))

(declare-fun c!44753 () Bool)

(assert (=> b!262611 (= c!44753 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262612 () Bool)

(assert (=> b!262612 (= e!170183 call!25098)))

(declare-fun b!262613 () Bool)

(assert (=> b!262613 (= e!170183 e!170184)))

(declare-fun lt!132768 () (_ BitVec 64))

(assert (=> b!262613 (= lt!132768 (select (arr!5993 lt!132679) #b00000000000000000000000000000000))))

(declare-fun lt!132769 () Unit!8175)

(assert (=> b!262613 (= lt!132769 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132679 lt!132768 #b00000000000000000000000000000000))))

(assert (=> b!262613 (arrayContainsKey!0 lt!132679 lt!132768 #b00000000000000000000000000000000)))

(declare-fun lt!132767 () Unit!8175)

(assert (=> b!262613 (= lt!132767 lt!132769)))

(declare-fun res!128271 () Bool)

(assert (=> b!262613 (= res!128271 (= (seekEntryOrOpen!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000) lt!132679 (mask!11194 thiss!1504)) (Found!1197 #b00000000000000000000000000000000)))))

(assert (=> b!262613 (=> (not res!128271) (not e!170184))))

(assert (= (and d!63033 (not res!128270)) b!262611))

(assert (= (and b!262611 c!44753) b!262613))

(assert (= (and b!262611 (not c!44753)) b!262612))

(assert (= (and b!262613 res!128271) b!262610))

(assert (= (or b!262610 b!262612) bm!25095))

(declare-fun m!278721 () Bool)

(assert (=> bm!25095 m!278721))

(declare-fun m!278723 () Bool)

(assert (=> b!262611 m!278723))

(assert (=> b!262611 m!278723))

(declare-fun m!278725 () Bool)

(assert (=> b!262611 m!278725))

(assert (=> b!262613 m!278723))

(declare-fun m!278727 () Bool)

(assert (=> b!262613 m!278727))

(declare-fun m!278729 () Bool)

(assert (=> b!262613 m!278729))

(assert (=> b!262613 m!278723))

(declare-fun m!278731 () Bool)

(assert (=> b!262613 m!278731))

(assert (=> b!262479 d!63033))

(declare-fun d!63035 () Bool)

(declare-fun res!128278 () Bool)

(declare-fun e!170193 () Bool)

(assert (=> d!63035 (=> res!128278 e!170193)))

(assert (=> d!63035 (= res!128278 (bvsge #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(assert (=> d!63035 (= (arrayNoDuplicates!0 lt!132679 #b00000000000000000000000000000000 Nil!3845) e!170193)))

(declare-fun b!262624 () Bool)

(declare-fun e!170194 () Bool)

(declare-fun e!170195 () Bool)

(assert (=> b!262624 (= e!170194 e!170195)))

(declare-fun c!44756 () Bool)

(assert (=> b!262624 (= c!44756 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262625 () Bool)

(declare-fun e!170196 () Bool)

(declare-fun contains!1910 (List!3848 (_ BitVec 64)) Bool)

(assert (=> b!262625 (= e!170196 (contains!1910 Nil!3845 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262626 () Bool)

(declare-fun call!25101 () Bool)

(assert (=> b!262626 (= e!170195 call!25101)))

(declare-fun b!262627 () Bool)

(assert (=> b!262627 (= e!170193 e!170194)))

(declare-fun res!128280 () Bool)

(assert (=> b!262627 (=> (not res!128280) (not e!170194))))

(assert (=> b!262627 (= res!128280 (not e!170196))))

(declare-fun res!128279 () Bool)

(assert (=> b!262627 (=> (not res!128279) (not e!170196))))

(assert (=> b!262627 (= res!128279 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262628 () Bool)

(assert (=> b!262628 (= e!170195 call!25101)))

(declare-fun bm!25098 () Bool)

(assert (=> bm!25098 (= call!25101 (arrayNoDuplicates!0 lt!132679 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44756 (Cons!3844 (select (arr!5993 lt!132679) #b00000000000000000000000000000000) Nil!3845) Nil!3845)))))

(assert (= (and d!63035 (not res!128278)) b!262627))

(assert (= (and b!262627 res!128279) b!262625))

(assert (= (and b!262627 res!128280) b!262624))

(assert (= (and b!262624 c!44756) b!262626))

(assert (= (and b!262624 (not c!44756)) b!262628))

(assert (= (or b!262626 b!262628) bm!25098))

(assert (=> b!262624 m!278723))

(assert (=> b!262624 m!278723))

(assert (=> b!262624 m!278725))

(assert (=> b!262625 m!278723))

(assert (=> b!262625 m!278723))

(declare-fun m!278733 () Bool)

(assert (=> b!262625 m!278733))

(assert (=> b!262627 m!278723))

(assert (=> b!262627 m!278723))

(assert (=> b!262627 m!278725))

(assert (=> bm!25098 m!278723))

(declare-fun m!278735 () Bool)

(assert (=> bm!25098 m!278735))

(assert (=> b!262479 d!63035))

(declare-fun d!63037 () Bool)

(declare-fun e!170199 () Bool)

(assert (=> d!63037 e!170199))

(declare-fun res!128283 () Bool)

(assert (=> d!63037 (=> (not res!128283) (not e!170199))))

(assert (=> d!63037 (= res!128283 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7025 thiss!1504)))))))

(declare-fun lt!132772 () Unit!8175)

(declare-fun choose!41 (array!12663 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3848) Unit!8175)

(assert (=> d!63037 (= lt!132772 (choose!41 (_keys!7025 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3845))))

(assert (=> d!63037 (bvslt (size!6344 (_keys!7025 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!63037 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7025 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3845) lt!132772)))

(declare-fun b!262631 () Bool)

(assert (=> b!262631 (= e!170199 (arrayNoDuplicates!0 (array!12664 (store (arr!5993 (_keys!7025 thiss!1504)) index!297 key!932) (size!6344 (_keys!7025 thiss!1504))) #b00000000000000000000000000000000 Nil!3845))))

(assert (= (and d!63037 res!128283) b!262631))

(declare-fun m!278737 () Bool)

(assert (=> d!63037 m!278737))

(assert (=> b!262631 m!278573))

(declare-fun m!278739 () Bool)

(assert (=> b!262631 m!278739))

(assert (=> b!262479 d!63037))

(declare-fun d!63039 () Bool)

(declare-fun res!128288 () Bool)

(declare-fun e!170204 () Bool)

(assert (=> d!63039 (=> res!128288 e!170204)))

(assert (=> d!63039 (= res!128288 (= (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63039 (= (arrayContainsKey!0 (_keys!7025 thiss!1504) key!932 #b00000000000000000000000000000000) e!170204)))

(declare-fun b!262636 () Bool)

(declare-fun e!170205 () Bool)

(assert (=> b!262636 (= e!170204 e!170205)))

(declare-fun res!128289 () Bool)

(assert (=> b!262636 (=> (not res!128289) (not e!170205))))

(assert (=> b!262636 (= res!128289 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun b!262637 () Bool)

(assert (=> b!262637 (= e!170205 (arrayContainsKey!0 (_keys!7025 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63039 (not res!128288)) b!262636))

(assert (= (and b!262636 res!128289) b!262637))

(assert (=> d!63039 m!278689))

(declare-fun m!278741 () Bool)

(assert (=> b!262637 m!278741))

(assert (=> b!262479 d!63039))

(declare-fun d!63041 () Bool)

(declare-fun e!170208 () Bool)

(assert (=> d!63041 e!170208))

(declare-fun res!128292 () Bool)

(assert (=> d!63041 (=> (not res!128292) (not e!170208))))

(assert (=> d!63041 (= res!128292 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7025 thiss!1504)))))))

(declare-fun lt!132775 () Unit!8175)

(declare-fun choose!102 ((_ BitVec 64) array!12663 (_ BitVec 32) (_ BitVec 32)) Unit!8175)

(assert (=> d!63041 (= lt!132775 (choose!102 key!932 (_keys!7025 thiss!1504) index!297 (mask!11194 thiss!1504)))))

(assert (=> d!63041 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63041 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) index!297 (mask!11194 thiss!1504)) lt!132775)))

(declare-fun b!262640 () Bool)

(assert (=> b!262640 (= e!170208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12664 (store (arr!5993 (_keys!7025 thiss!1504)) index!297 key!932) (size!6344 (_keys!7025 thiss!1504))) (mask!11194 thiss!1504)))))

(assert (= (and d!63041 res!128292) b!262640))

(declare-fun m!278743 () Bool)

(assert (=> d!63041 m!278743))

(assert (=> d!63041 m!278585))

(assert (=> b!262640 m!278573))

(declare-fun m!278745 () Bool)

(assert (=> b!262640 m!278745))

(assert (=> b!262479 d!63041))

(declare-fun d!63043 () Bool)

(assert (=> d!63043 (= (validMask!0 (mask!11194 thiss!1504)) (and (or (= (mask!11194 thiss!1504) #b00000000000000000000000000000111) (= (mask!11194 thiss!1504) #b00000000000000000000000000001111) (= (mask!11194 thiss!1504) #b00000000000000000000000000011111) (= (mask!11194 thiss!1504) #b00000000000000000000000000111111) (= (mask!11194 thiss!1504) #b00000000000000000000000001111111) (= (mask!11194 thiss!1504) #b00000000000000000000000011111111) (= (mask!11194 thiss!1504) #b00000000000000000000000111111111) (= (mask!11194 thiss!1504) #b00000000000000000000001111111111) (= (mask!11194 thiss!1504) #b00000000000000000000011111111111) (= (mask!11194 thiss!1504) #b00000000000000000000111111111111) (= (mask!11194 thiss!1504) #b00000000000000000001111111111111) (= (mask!11194 thiss!1504) #b00000000000000000011111111111111) (= (mask!11194 thiss!1504) #b00000000000000000111111111111111) (= (mask!11194 thiss!1504) #b00000000000000001111111111111111) (= (mask!11194 thiss!1504) #b00000000000000011111111111111111) (= (mask!11194 thiss!1504) #b00000000000000111111111111111111) (= (mask!11194 thiss!1504) #b00000000000001111111111111111111) (= (mask!11194 thiss!1504) #b00000000000011111111111111111111) (= (mask!11194 thiss!1504) #b00000000000111111111111111111111) (= (mask!11194 thiss!1504) #b00000000001111111111111111111111) (= (mask!11194 thiss!1504) #b00000000011111111111111111111111) (= (mask!11194 thiss!1504) #b00000000111111111111111111111111) (= (mask!11194 thiss!1504) #b00000001111111111111111111111111) (= (mask!11194 thiss!1504) #b00000011111111111111111111111111) (= (mask!11194 thiss!1504) #b00000111111111111111111111111111) (= (mask!11194 thiss!1504) #b00001111111111111111111111111111) (= (mask!11194 thiss!1504) #b00011111111111111111111111111111) (= (mask!11194 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11194 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!262479 d!63043))

(declare-fun d!63045 () Bool)

(declare-fun res!128293 () Bool)

(declare-fun e!170209 () Bool)

(assert (=> d!63045 (=> res!128293 e!170209)))

(assert (=> d!63045 (= res!128293 (= (select (arr!5993 lt!132679) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63045 (= (arrayContainsKey!0 lt!132679 key!932 #b00000000000000000000000000000000) e!170209)))

(declare-fun b!262641 () Bool)

(declare-fun e!170210 () Bool)

(assert (=> b!262641 (= e!170209 e!170210)))

(declare-fun res!128294 () Bool)

(assert (=> b!262641 (=> (not res!128294) (not e!170210))))

(assert (=> b!262641 (= res!128294 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132679)))))

(declare-fun b!262642 () Bool)

(assert (=> b!262642 (= e!170210 (arrayContainsKey!0 lt!132679 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63045 (not res!128293)) b!262641))

(assert (= (and b!262641 res!128294) b!262642))

(assert (=> d!63045 m!278723))

(declare-fun m!278747 () Bool)

(assert (=> b!262642 m!278747))

(assert (=> b!262479 d!63045))

(declare-fun b!262643 () Bool)

(declare-fun e!170211 () (_ BitVec 32))

(declare-fun call!25102 () (_ BitVec 32))

(assert (=> b!262643 (= e!170211 call!25102)))

(declare-fun bm!25099 () Bool)

(assert (=> bm!25099 (= call!25102 (arrayCountValidKeys!0 lt!132679 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun d!63047 () Bool)

(declare-fun lt!132776 () (_ BitVec 32))

(assert (=> d!63047 (and (bvsge lt!132776 #b00000000000000000000000000000000) (bvsle lt!132776 (bvsub (size!6344 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun e!170212 () (_ BitVec 32))

(assert (=> d!63047 (= lt!132776 e!170212)))

(declare-fun c!44757 () Bool)

(assert (=> d!63047 (= c!44757 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(assert (=> d!63047 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7025 thiss!1504)) (size!6344 lt!132679)))))

(assert (=> d!63047 (= (arrayCountValidKeys!0 lt!132679 #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) lt!132776)))

(declare-fun b!262644 () Bool)

(assert (=> b!262644 (= e!170212 e!170211)))

(declare-fun c!44758 () Bool)

(assert (=> b!262644 (= c!44758 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262645 () Bool)

(assert (=> b!262645 (= e!170212 #b00000000000000000000000000000000)))

(declare-fun b!262646 () Bool)

(assert (=> b!262646 (= e!170211 (bvadd #b00000000000000000000000000000001 call!25102))))

(assert (= (and d!63047 c!44757) b!262645))

(assert (= (and d!63047 (not c!44757)) b!262644))

(assert (= (and b!262644 c!44758) b!262646))

(assert (= (and b!262644 (not c!44758)) b!262643))

(assert (= (or b!262646 b!262643) bm!25099))

(declare-fun m!278749 () Bool)

(assert (=> bm!25099 m!278749))

(assert (=> b!262644 m!278723))

(assert (=> b!262644 m!278723))

(assert (=> b!262644 m!278725))

(assert (=> b!262479 d!63047))

(declare-fun e!170240 () Bool)

(declare-fun b!262689 () Bool)

(declare-fun lt!132825 () ListLongMap!3885)

(declare-fun apply!261 (ListLongMap!3885 (_ BitVec 64)) V!8515)

(declare-fun get!3090 (ValueCell!2982 V!8515) V!8515)

(declare-fun dynLambda!604 (Int (_ BitVec 64)) V!8515)

(assert (=> b!262689 (= e!170240 (= (apply!261 lt!132825 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)) (get!3090 (select (arr!5992 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!604 (defaultEntry!4835 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))))))))

(assert (=> b!262689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(declare-fun b!262690 () Bool)

(declare-fun e!170244 () ListLongMap!3885)

(declare-fun call!25119 () ListLongMap!3885)

(assert (=> b!262690 (= e!170244 (+!708 call!25119 (tuple2!4973 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4676 thiss!1504))))))

(declare-fun b!262692 () Bool)

(declare-fun res!128318 () Bool)

(declare-fun e!170241 () Bool)

(assert (=> b!262692 (=> (not res!128318) (not e!170241))))

(declare-fun e!170242 () Bool)

(assert (=> b!262692 (= res!128318 e!170242)))

(declare-fun c!44776 () Bool)

(assert (=> b!262692 (= c!44776 (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262693 () Bool)

(declare-fun e!170239 () Bool)

(assert (=> b!262693 (= e!170239 (= (apply!261 lt!132825 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4676 thiss!1504)))))

(declare-fun b!262694 () Bool)

(declare-fun e!170248 () Bool)

(assert (=> b!262694 (= e!170248 (= (apply!261 lt!132825 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4676 thiss!1504)))))

(declare-fun bm!25114 () Bool)

(declare-fun call!25123 () ListLongMap!3885)

(declare-fun call!25121 () ListLongMap!3885)

(assert (=> bm!25114 (= call!25123 call!25121)))

(declare-fun b!262695 () Bool)

(declare-fun e!170243 () Bool)

(declare-fun call!25122 () Bool)

(assert (=> b!262695 (= e!170243 (not call!25122))))

(declare-fun b!262696 () Bool)

(assert (=> b!262696 (= e!170243 e!170248)))

(declare-fun res!128321 () Bool)

(assert (=> b!262696 (= res!128321 call!25122)))

(assert (=> b!262696 (=> (not res!128321) (not e!170248))))

(declare-fun b!262697 () Bool)

(declare-fun e!170246 () ListLongMap!3885)

(assert (=> b!262697 (= e!170244 e!170246)))

(declare-fun c!44771 () Bool)

(assert (=> b!262697 (= c!44771 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!25118 () ListLongMap!3885)

(declare-fun bm!25115 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!583 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 32) Int) ListLongMap!3885)

(assert (=> bm!25115 (= call!25118 (getCurrentListMapNoExtraKeys!583 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun b!262691 () Bool)

(assert (=> b!262691 (= e!170241 e!170243)))

(declare-fun c!44775 () Bool)

(assert (=> b!262691 (= c!44775 (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!63049 () Bool)

(assert (=> d!63049 e!170241))

(declare-fun res!128320 () Bool)

(assert (=> d!63049 (=> (not res!128320) (not e!170241))))

(assert (=> d!63049 (= res!128320 (or (bvsge #b00000000000000000000000000000000 (size!6344 lt!132679)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132679)))))))

(declare-fun lt!132828 () ListLongMap!3885)

(assert (=> d!63049 (= lt!132825 lt!132828)))

(declare-fun lt!132837 () Unit!8175)

(declare-fun e!170247 () Unit!8175)

(assert (=> d!63049 (= lt!132837 e!170247)))

(declare-fun c!44773 () Bool)

(declare-fun e!170250 () Bool)

(assert (=> d!63049 (= c!44773 e!170250)))

(declare-fun res!128315 () Bool)

(assert (=> d!63049 (=> (not res!128315) (not e!170250))))

(assert (=> d!63049 (= res!128315 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(assert (=> d!63049 (= lt!132828 e!170244)))

(declare-fun c!44772 () Bool)

(assert (=> d!63049 (= c!44772 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63049 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63049 (= (getCurrentListMap!1486 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)) lt!132825)))

(declare-fun b!262698 () Bool)

(declare-fun c!44774 () Bool)

(assert (=> b!262698 (= c!44774 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170249 () ListLongMap!3885)

(assert (=> b!262698 (= e!170246 e!170249)))

(declare-fun b!262699 () Bool)

(declare-fun lt!132835 () Unit!8175)

(assert (=> b!262699 (= e!170247 lt!132835)))

(declare-fun lt!132822 () ListLongMap!3885)

(assert (=> b!262699 (= lt!132822 (getCurrentListMapNoExtraKeys!583 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132830 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132842 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132842 (select (arr!5993 lt!132679) #b00000000000000000000000000000000))))

(declare-fun lt!132841 () Unit!8175)

(declare-fun addStillContains!237 (ListLongMap!3885 (_ BitVec 64) V!8515 (_ BitVec 64)) Unit!8175)

(assert (=> b!262699 (= lt!132841 (addStillContains!237 lt!132822 lt!132830 (zeroValue!4676 thiss!1504) lt!132842))))

(assert (=> b!262699 (contains!1907 (+!708 lt!132822 (tuple2!4973 lt!132830 (zeroValue!4676 thiss!1504))) lt!132842)))

(declare-fun lt!132826 () Unit!8175)

(assert (=> b!262699 (= lt!132826 lt!132841)))

(declare-fun lt!132834 () ListLongMap!3885)

(assert (=> b!262699 (= lt!132834 (getCurrentListMapNoExtraKeys!583 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132824 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132836 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132836 (select (arr!5993 lt!132679) #b00000000000000000000000000000000))))

(declare-fun lt!132839 () Unit!8175)

(declare-fun addApplyDifferent!237 (ListLongMap!3885 (_ BitVec 64) V!8515 (_ BitVec 64)) Unit!8175)

(assert (=> b!262699 (= lt!132839 (addApplyDifferent!237 lt!132834 lt!132824 (minValue!4676 thiss!1504) lt!132836))))

(assert (=> b!262699 (= (apply!261 (+!708 lt!132834 (tuple2!4973 lt!132824 (minValue!4676 thiss!1504))) lt!132836) (apply!261 lt!132834 lt!132836))))

(declare-fun lt!132840 () Unit!8175)

(assert (=> b!262699 (= lt!132840 lt!132839)))

(declare-fun lt!132829 () ListLongMap!3885)

(assert (=> b!262699 (= lt!132829 (getCurrentListMapNoExtraKeys!583 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132832 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132827 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132827 (select (arr!5993 lt!132679) #b00000000000000000000000000000000))))

(declare-fun lt!132833 () Unit!8175)

(assert (=> b!262699 (= lt!132833 (addApplyDifferent!237 lt!132829 lt!132832 (zeroValue!4676 thiss!1504) lt!132827))))

(assert (=> b!262699 (= (apply!261 (+!708 lt!132829 (tuple2!4973 lt!132832 (zeroValue!4676 thiss!1504))) lt!132827) (apply!261 lt!132829 lt!132827))))

(declare-fun lt!132838 () Unit!8175)

(assert (=> b!262699 (= lt!132838 lt!132833)))

(declare-fun lt!132821 () ListLongMap!3885)

(assert (=> b!262699 (= lt!132821 (getCurrentListMapNoExtraKeys!583 lt!132679 (array!12662 (store (arr!5992 (_values!4818 thiss!1504)) index!297 (ValueCellFull!2982 v!346)) (size!6343 (_values!4818 thiss!1504))) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132831 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132823 () (_ BitVec 64))

(assert (=> b!262699 (= lt!132823 (select (arr!5993 lt!132679) #b00000000000000000000000000000000))))

(assert (=> b!262699 (= lt!132835 (addApplyDifferent!237 lt!132821 lt!132831 (minValue!4676 thiss!1504) lt!132823))))

(assert (=> b!262699 (= (apply!261 (+!708 lt!132821 (tuple2!4973 lt!132831 (minValue!4676 thiss!1504))) lt!132823) (apply!261 lt!132821 lt!132823))))

(declare-fun b!262700 () Bool)

(assert (=> b!262700 (= e!170249 call!25123)))

(declare-fun b!262701 () Bool)

(assert (=> b!262701 (= e!170242 e!170239)))

(declare-fun res!128313 () Bool)

(declare-fun call!25120 () Bool)

(assert (=> b!262701 (= res!128313 call!25120)))

(assert (=> b!262701 (=> (not res!128313) (not e!170239))))

(declare-fun b!262702 () Bool)

(assert (=> b!262702 (= e!170250 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun b!262703 () Bool)

(declare-fun Unit!8185 () Unit!8175)

(assert (=> b!262703 (= e!170247 Unit!8185)))

(declare-fun b!262704 () Bool)

(declare-fun e!170251 () Bool)

(assert (=> b!262704 (= e!170251 e!170240)))

(declare-fun res!128314 () Bool)

(assert (=> b!262704 (=> (not res!128314) (not e!170240))))

(assert (=> b!262704 (= res!128314 (contains!1907 lt!132825 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(assert (=> b!262704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(declare-fun b!262705 () Bool)

(assert (=> b!262705 (= e!170242 (not call!25120))))

(declare-fun b!262706 () Bool)

(declare-fun e!170245 () Bool)

(assert (=> b!262706 (= e!170245 (validKeyInArray!0 (select (arr!5993 lt!132679) #b00000000000000000000000000000000)))))

(declare-fun bm!25116 () Bool)

(assert (=> bm!25116 (= call!25122 (contains!1907 lt!132825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262707 () Bool)

(declare-fun call!25117 () ListLongMap!3885)

(assert (=> b!262707 (= e!170246 call!25117)))

(declare-fun bm!25117 () Bool)

(assert (=> bm!25117 (= call!25117 call!25119)))

(declare-fun bm!25118 () Bool)

(assert (=> bm!25118 (= call!25119 (+!708 (ite c!44772 call!25118 (ite c!44771 call!25121 call!25123)) (ite (or c!44772 c!44771) (tuple2!4973 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4676 thiss!1504)) (tuple2!4973 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4676 thiss!1504)))))))

(declare-fun b!262708 () Bool)

(declare-fun res!128316 () Bool)

(assert (=> b!262708 (=> (not res!128316) (not e!170241))))

(assert (=> b!262708 (= res!128316 e!170251)))

(declare-fun res!128319 () Bool)

(assert (=> b!262708 (=> res!128319 e!170251)))

(assert (=> b!262708 (= res!128319 (not e!170245))))

(declare-fun res!128317 () Bool)

(assert (=> b!262708 (=> (not res!128317) (not e!170245))))

(assert (=> b!262708 (= res!128317 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132679)))))

(declare-fun bm!25119 () Bool)

(assert (=> bm!25119 (= call!25120 (contains!1907 lt!132825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25120 () Bool)

(assert (=> bm!25120 (= call!25121 call!25118)))

(declare-fun b!262709 () Bool)

(assert (=> b!262709 (= e!170249 call!25117)))

(assert (= (and d!63049 c!44772) b!262690))

(assert (= (and d!63049 (not c!44772)) b!262697))

(assert (= (and b!262697 c!44771) b!262707))

(assert (= (and b!262697 (not c!44771)) b!262698))

(assert (= (and b!262698 c!44774) b!262709))

(assert (= (and b!262698 (not c!44774)) b!262700))

(assert (= (or b!262709 b!262700) bm!25114))

(assert (= (or b!262707 bm!25114) bm!25120))

(assert (= (or b!262707 b!262709) bm!25117))

(assert (= (or b!262690 bm!25120) bm!25115))

(assert (= (or b!262690 bm!25117) bm!25118))

(assert (= (and d!63049 res!128315) b!262702))

(assert (= (and d!63049 c!44773) b!262699))

(assert (= (and d!63049 (not c!44773)) b!262703))

(assert (= (and d!63049 res!128320) b!262708))

(assert (= (and b!262708 res!128317) b!262706))

(assert (= (and b!262708 (not res!128319)) b!262704))

(assert (= (and b!262704 res!128314) b!262689))

(assert (= (and b!262708 res!128316) b!262692))

(assert (= (and b!262692 c!44776) b!262701))

(assert (= (and b!262692 (not c!44776)) b!262705))

(assert (= (and b!262701 res!128313) b!262693))

(assert (= (or b!262701 b!262705) bm!25119))

(assert (= (and b!262692 res!128318) b!262691))

(assert (= (and b!262691 c!44775) b!262696))

(assert (= (and b!262691 (not c!44775)) b!262695))

(assert (= (and b!262696 res!128321) b!262694))

(assert (= (or b!262696 b!262695) bm!25116))

(declare-fun b_lambda!8323 () Bool)

(assert (=> (not b_lambda!8323) (not b!262689)))

(declare-fun t!8927 () Bool)

(declare-fun tb!3035 () Bool)

(assert (=> (and b!262485 (= (defaultEntry!4835 thiss!1504) (defaultEntry!4835 thiss!1504)) t!8927) tb!3035))

(declare-fun result!5427 () Bool)

(assert (=> tb!3035 (= result!5427 tp_is_empty!6651)))

(assert (=> b!262689 t!8927))

(declare-fun b_and!13931 () Bool)

(assert (= b_and!13927 (and (=> t!8927 result!5427) b_and!13931)))

(declare-fun m!278751 () Bool)

(assert (=> bm!25116 m!278751))

(declare-fun m!278753 () Bool)

(assert (=> bm!25115 m!278753))

(declare-fun m!278755 () Bool)

(assert (=> b!262693 m!278755))

(declare-fun m!278757 () Bool)

(assert (=> b!262694 m!278757))

(declare-fun m!278759 () Bool)

(assert (=> bm!25119 m!278759))

(assert (=> b!262706 m!278723))

(assert (=> b!262706 m!278723))

(assert (=> b!262706 m!278725))

(declare-fun m!278761 () Bool)

(assert (=> b!262690 m!278761))

(declare-fun m!278763 () Bool)

(assert (=> b!262699 m!278763))

(declare-fun m!278765 () Bool)

(assert (=> b!262699 m!278765))

(declare-fun m!278767 () Bool)

(assert (=> b!262699 m!278767))

(declare-fun m!278769 () Bool)

(assert (=> b!262699 m!278769))

(declare-fun m!278771 () Bool)

(assert (=> b!262699 m!278771))

(assert (=> b!262699 m!278767))

(assert (=> b!262699 m!278753))

(declare-fun m!278773 () Bool)

(assert (=> b!262699 m!278773))

(assert (=> b!262699 m!278723))

(assert (=> b!262699 m!278771))

(declare-fun m!278775 () Bool)

(assert (=> b!262699 m!278775))

(declare-fun m!278777 () Bool)

(assert (=> b!262699 m!278777))

(declare-fun m!278779 () Bool)

(assert (=> b!262699 m!278779))

(declare-fun m!278781 () Bool)

(assert (=> b!262699 m!278781))

(assert (=> b!262699 m!278779))

(declare-fun m!278783 () Bool)

(assert (=> b!262699 m!278783))

(declare-fun m!278785 () Bool)

(assert (=> b!262699 m!278785))

(declare-fun m!278787 () Bool)

(assert (=> b!262699 m!278787))

(declare-fun m!278789 () Bool)

(assert (=> b!262699 m!278789))

(assert (=> b!262699 m!278787))

(declare-fun m!278791 () Bool)

(assert (=> b!262699 m!278791))

(assert (=> b!262689 m!278723))

(assert (=> b!262689 m!278723))

(declare-fun m!278793 () Bool)

(assert (=> b!262689 m!278793))

(declare-fun m!278795 () Bool)

(assert (=> b!262689 m!278795))

(declare-fun m!278797 () Bool)

(assert (=> b!262689 m!278797))

(assert (=> b!262689 m!278795))

(declare-fun m!278799 () Bool)

(assert (=> b!262689 m!278799))

(assert (=> b!262689 m!278797))

(declare-fun m!278801 () Bool)

(assert (=> bm!25118 m!278801))

(assert (=> b!262704 m!278723))

(assert (=> b!262704 m!278723))

(declare-fun m!278803 () Bool)

(assert (=> b!262704 m!278803))

(assert (=> b!262702 m!278723))

(assert (=> b!262702 m!278723))

(assert (=> b!262702 m!278725))

(assert (=> d!63049 m!278585))

(assert (=> b!262479 d!63049))

(declare-fun d!63051 () Bool)

(assert (=> d!63051 (= (inRange!0 (ite c!44729 (index!6958 lt!132682) (index!6961 lt!132682)) (mask!11194 thiss!1504)) (and (bvsge (ite c!44729 (index!6958 lt!132682) (index!6961 lt!132682)) #b00000000000000000000000000000000) (bvslt (ite c!44729 (index!6958 lt!132682) (index!6961 lt!132682)) (bvadd (mask!11194 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25081 d!63051))

(declare-fun d!63053 () Bool)

(assert (=> d!63053 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262492 d!63053))

(declare-fun d!63055 () Bool)

(assert (=> d!63055 (contains!1907 (getCurrentListMap!1486 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)) key!932)))

(declare-fun lt!132845 () Unit!8175)

(declare-fun choose!1285 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) (_ BitVec 32) Int) Unit!8175)

(assert (=> d!63055 (= lt!132845 (choose!1285 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(assert (=> d!63055 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63055 (= (lemmaArrayContainsKeyThenInListMap!260 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)) lt!132845)))

(declare-fun bs!9243 () Bool)

(assert (= bs!9243 d!63055))

(assert (=> bs!9243 m!278555))

(assert (=> bs!9243 m!278555))

(declare-fun m!278805 () Bool)

(assert (=> bs!9243 m!278805))

(declare-fun m!278807 () Bool)

(assert (=> bs!9243 m!278807))

(assert (=> bs!9243 m!278585))

(assert (=> b!262482 d!63055))

(declare-fun d!63057 () Bool)

(declare-fun e!170254 () Bool)

(assert (=> d!63057 e!170254))

(declare-fun res!128326 () Bool)

(assert (=> d!63057 (=> (not res!128326) (not e!170254))))

(declare-fun lt!132851 () SeekEntryResult!1197)

(assert (=> d!63057 (= res!128326 ((_ is Found!1197) lt!132851))))

(assert (=> d!63057 (= lt!132851 (seekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(declare-fun lt!132850 () Unit!8175)

(declare-fun choose!1286 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) Int) Unit!8175)

(assert (=> d!63057 (= lt!132850 (choose!1286 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)))))

(assert (=> d!63057 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63057 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!453 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)) lt!132850)))

(declare-fun b!262716 () Bool)

(declare-fun res!128327 () Bool)

(assert (=> b!262716 (=> (not res!128327) (not e!170254))))

(assert (=> b!262716 (= res!128327 (inRange!0 (index!6959 lt!132851) (mask!11194 thiss!1504)))))

(declare-fun b!262717 () Bool)

(assert (=> b!262717 (= e!170254 (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6959 lt!132851)) key!932))))

(assert (=> b!262717 (and (bvsge (index!6959 lt!132851) #b00000000000000000000000000000000) (bvslt (index!6959 lt!132851) (size!6344 (_keys!7025 thiss!1504))))))

(assert (= (and d!63057 res!128326) b!262716))

(assert (= (and b!262716 res!128327) b!262717))

(assert (=> d!63057 m!278591))

(declare-fun m!278809 () Bool)

(assert (=> d!63057 m!278809))

(assert (=> d!63057 m!278585))

(declare-fun m!278811 () Bool)

(assert (=> b!262716 m!278811))

(declare-fun m!278813 () Bool)

(assert (=> b!262717 m!278813))

(assert (=> b!262471 d!63057))

(declare-fun d!63059 () Bool)

(assert (=> d!63059 (= (array_inv!3959 (_keys!7025 thiss!1504)) (bvsge (size!6344 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262485 d!63059))

(declare-fun d!63061 () Bool)

(assert (=> d!63061 (= (array_inv!3960 (_values!4818 thiss!1504)) (bvsge (size!6343 (_values!4818 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262485 d!63061))

(declare-fun b!262730 () Bool)

(declare-fun e!170261 () SeekEntryResult!1197)

(declare-fun e!170263 () SeekEntryResult!1197)

(assert (=> b!262730 (= e!170261 e!170263)))

(declare-fun lt!132860 () (_ BitVec 64))

(declare-fun lt!132858 () SeekEntryResult!1197)

(assert (=> b!262730 (= lt!132860 (select (arr!5993 (_keys!7025 thiss!1504)) (index!6960 lt!132858)))))

(declare-fun c!44783 () Bool)

(assert (=> b!262730 (= c!44783 (= lt!132860 key!932))))

(declare-fun b!262731 () Bool)

(assert (=> b!262731 (= e!170263 (Found!1197 (index!6960 lt!132858)))))

(declare-fun b!262733 () Bool)

(declare-fun c!44784 () Bool)

(assert (=> b!262733 (= c!44784 (= lt!132860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170262 () SeekEntryResult!1197)

(assert (=> b!262733 (= e!170263 e!170262)))

(declare-fun b!262734 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12663 (_ BitVec 32)) SeekEntryResult!1197)

(assert (=> b!262734 (= e!170262 (seekKeyOrZeroReturnVacant!0 (x!25221 lt!132858) (index!6960 lt!132858) (index!6960 lt!132858) key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(declare-fun b!262735 () Bool)

(assert (=> b!262735 (= e!170261 Undefined!1197)))

(declare-fun b!262732 () Bool)

(assert (=> b!262732 (= e!170262 (MissingZero!1197 (index!6960 lt!132858)))))

(declare-fun d!63063 () Bool)

(declare-fun lt!132859 () SeekEntryResult!1197)

(assert (=> d!63063 (and (or ((_ is Undefined!1197) lt!132859) (not ((_ is Found!1197) lt!132859)) (and (bvsge (index!6959 lt!132859) #b00000000000000000000000000000000) (bvslt (index!6959 lt!132859) (size!6344 (_keys!7025 thiss!1504))))) (or ((_ is Undefined!1197) lt!132859) ((_ is Found!1197) lt!132859) (not ((_ is MissingZero!1197) lt!132859)) (and (bvsge (index!6958 lt!132859) #b00000000000000000000000000000000) (bvslt (index!6958 lt!132859) (size!6344 (_keys!7025 thiss!1504))))) (or ((_ is Undefined!1197) lt!132859) ((_ is Found!1197) lt!132859) ((_ is MissingZero!1197) lt!132859) (not ((_ is MissingVacant!1197) lt!132859)) (and (bvsge (index!6961 lt!132859) #b00000000000000000000000000000000) (bvslt (index!6961 lt!132859) (size!6344 (_keys!7025 thiss!1504))))) (or ((_ is Undefined!1197) lt!132859) (ite ((_ is Found!1197) lt!132859) (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6959 lt!132859)) key!932) (ite ((_ is MissingZero!1197) lt!132859) (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6958 lt!132859)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1197) lt!132859) (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6961 lt!132859)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63063 (= lt!132859 e!170261)))

(declare-fun c!44785 () Bool)

(assert (=> d!63063 (= c!44785 (and ((_ is Intermediate!1197) lt!132858) (undefined!2009 lt!132858)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12663 (_ BitVec 32)) SeekEntryResult!1197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63063 (= lt!132858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11194 thiss!1504)) key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(assert (=> d!63063 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63063 (= (seekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)) lt!132859)))

(assert (= (and d!63063 c!44785) b!262735))

(assert (= (and d!63063 (not c!44785)) b!262730))

(assert (= (and b!262730 c!44783) b!262731))

(assert (= (and b!262730 (not c!44783)) b!262733))

(assert (= (and b!262733 c!44784) b!262732))

(assert (= (and b!262733 (not c!44784)) b!262734))

(declare-fun m!278815 () Bool)

(assert (=> b!262730 m!278815))

(declare-fun m!278817 () Bool)

(assert (=> b!262734 m!278817))

(declare-fun m!278819 () Bool)

(assert (=> d!63063 m!278819))

(declare-fun m!278821 () Bool)

(assert (=> d!63063 m!278821))

(assert (=> d!63063 m!278821))

(declare-fun m!278823 () Bool)

(assert (=> d!63063 m!278823))

(declare-fun m!278825 () Bool)

(assert (=> d!63063 m!278825))

(assert (=> d!63063 m!278585))

(declare-fun m!278827 () Bool)

(assert (=> d!63063 m!278827))

(assert (=> b!262486 d!63063))

(declare-fun b!262752 () Bool)

(declare-fun e!170274 () Bool)

(declare-fun e!170272 () Bool)

(assert (=> b!262752 (= e!170274 e!170272)))

(declare-fun c!44791 () Bool)

(declare-fun lt!132866 () SeekEntryResult!1197)

(assert (=> b!262752 (= c!44791 ((_ is MissingVacant!1197) lt!132866))))

(declare-fun b!262753 () Bool)

(declare-fun e!170273 () Bool)

(declare-fun call!25129 () Bool)

(assert (=> b!262753 (= e!170273 (not call!25129))))

(declare-fun b!262754 () Bool)

(assert (=> b!262754 (= e!170272 ((_ is Undefined!1197) lt!132866))))

(declare-fun bm!25125 () Bool)

(declare-fun call!25128 () Bool)

(declare-fun c!44790 () Bool)

(assert (=> bm!25125 (= call!25128 (inRange!0 (ite c!44790 (index!6958 lt!132866) (index!6961 lt!132866)) (mask!11194 thiss!1504)))))

(declare-fun b!262755 () Bool)

(declare-fun e!170275 () Bool)

(assert (=> b!262755 (= e!170275 (not call!25129))))

(declare-fun b!262756 () Bool)

(assert (=> b!262756 (= e!170274 e!170273)))

(declare-fun res!128337 () Bool)

(assert (=> b!262756 (= res!128337 call!25128)))

(assert (=> b!262756 (=> (not res!128337) (not e!170273))))

(declare-fun b!262757 () Bool)

(assert (=> b!262757 (and (bvsge (index!6958 lt!132866) #b00000000000000000000000000000000) (bvslt (index!6958 lt!132866) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun res!128339 () Bool)

(assert (=> b!262757 (= res!128339 (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6958 lt!132866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262757 (=> (not res!128339) (not e!170273))))

(declare-fun b!262758 () Bool)

(declare-fun res!128336 () Bool)

(assert (=> b!262758 (=> (not res!128336) (not e!170275))))

(assert (=> b!262758 (= res!128336 (= (select (arr!5993 (_keys!7025 thiss!1504)) (index!6961 lt!132866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262758 (and (bvsge (index!6961 lt!132866) #b00000000000000000000000000000000) (bvslt (index!6961 lt!132866) (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun d!63065 () Bool)

(assert (=> d!63065 e!170274))

(assert (=> d!63065 (= c!44790 ((_ is MissingZero!1197) lt!132866))))

(assert (=> d!63065 (= lt!132866 (seekEntryOrOpen!0 key!932 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(declare-fun lt!132865 () Unit!8175)

(declare-fun choose!1287 (array!12663 array!12661 (_ BitVec 32) (_ BitVec 32) V!8515 V!8515 (_ BitVec 64) Int) Unit!8175)

(assert (=> d!63065 (= lt!132865 (choose!1287 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)))))

(assert (=> d!63065 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63065 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!453 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) key!932 (defaultEntry!4835 thiss!1504)) lt!132865)))

(declare-fun bm!25126 () Bool)

(assert (=> bm!25126 (= call!25129 (arrayContainsKey!0 (_keys!7025 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262759 () Bool)

(declare-fun res!128338 () Bool)

(assert (=> b!262759 (=> (not res!128338) (not e!170275))))

(assert (=> b!262759 (= res!128338 call!25128)))

(assert (=> b!262759 (= e!170272 e!170275)))

(assert (= (and d!63065 c!44790) b!262756))

(assert (= (and d!63065 (not c!44790)) b!262752))

(assert (= (and b!262756 res!128337) b!262757))

(assert (= (and b!262757 res!128339) b!262753))

(assert (= (and b!262752 c!44791) b!262759))

(assert (= (and b!262752 (not c!44791)) b!262754))

(assert (= (and b!262759 res!128338) b!262758))

(assert (= (and b!262758 res!128336) b!262755))

(assert (= (or b!262756 b!262759) bm!25125))

(assert (= (or b!262753 b!262755) bm!25126))

(assert (=> d!63065 m!278591))

(declare-fun m!278829 () Bool)

(assert (=> d!63065 m!278829))

(assert (=> d!63065 m!278585))

(declare-fun m!278831 () Bool)

(assert (=> bm!25125 m!278831))

(declare-fun m!278833 () Bool)

(assert (=> b!262758 m!278833))

(declare-fun m!278835 () Bool)

(assert (=> b!262757 m!278835))

(assert (=> bm!25126 m!278549))

(assert (=> b!262489 d!63065))

(declare-fun d!63067 () Bool)

(assert (=> d!63067 (= (inRange!0 index!297 (mask!11194 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11194 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262484 d!63067))

(declare-fun d!63069 () Bool)

(declare-fun e!170281 () Bool)

(assert (=> d!63069 e!170281))

(declare-fun res!128342 () Bool)

(assert (=> d!63069 (=> res!128342 e!170281)))

(declare-fun lt!132877 () Bool)

(assert (=> d!63069 (= res!128342 (not lt!132877))))

(declare-fun lt!132878 () Bool)

(assert (=> d!63069 (= lt!132877 lt!132878)))

(declare-fun lt!132875 () Unit!8175)

(declare-fun e!170280 () Unit!8175)

(assert (=> d!63069 (= lt!132875 e!170280)))

(declare-fun c!44794 () Bool)

(assert (=> d!63069 (= c!44794 lt!132878)))

(declare-fun containsKey!311 (List!3847 (_ BitVec 64)) Bool)

(assert (=> d!63069 (= lt!132878 (containsKey!311 (toList!1958 lt!132686) key!932))))

(assert (=> d!63069 (= (contains!1907 lt!132686 key!932) lt!132877)))

(declare-fun b!262766 () Bool)

(declare-fun lt!132876 () Unit!8175)

(assert (=> b!262766 (= e!170280 lt!132876)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!259 (List!3847 (_ BitVec 64)) Unit!8175)

(assert (=> b!262766 (= lt!132876 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1958 lt!132686) key!932))))

(declare-fun isDefined!260 (Option!325) Bool)

(assert (=> b!262766 (isDefined!260 (getValueByKey!319 (toList!1958 lt!132686) key!932))))

(declare-fun b!262767 () Bool)

(declare-fun Unit!8186 () Unit!8175)

(assert (=> b!262767 (= e!170280 Unit!8186)))

(declare-fun b!262768 () Bool)

(assert (=> b!262768 (= e!170281 (isDefined!260 (getValueByKey!319 (toList!1958 lt!132686) key!932)))))

(assert (= (and d!63069 c!44794) b!262766))

(assert (= (and d!63069 (not c!44794)) b!262767))

(assert (= (and d!63069 (not res!128342)) b!262768))

(declare-fun m!278837 () Bool)

(assert (=> d!63069 m!278837))

(declare-fun m!278839 () Bool)

(assert (=> b!262766 m!278839))

(declare-fun m!278841 () Bool)

(assert (=> b!262766 m!278841))

(assert (=> b!262766 m!278841))

(declare-fun m!278843 () Bool)

(assert (=> b!262766 m!278843))

(assert (=> b!262768 m!278841))

(assert (=> b!262768 m!278841))

(assert (=> b!262768 m!278843))

(assert (=> b!262484 d!63069))

(declare-fun b!262769 () Bool)

(declare-fun e!170283 () Bool)

(declare-fun lt!132883 () ListLongMap!3885)

(assert (=> b!262769 (= e!170283 (= (apply!261 lt!132883 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)) (get!3090 (select (arr!5992 (_values!4818 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!604 (defaultEntry!4835 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (_values!4818 thiss!1504))))))

(assert (=> b!262769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun b!262770 () Bool)

(declare-fun e!170287 () ListLongMap!3885)

(declare-fun call!25132 () ListLongMap!3885)

(assert (=> b!262770 (= e!170287 (+!708 call!25132 (tuple2!4973 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4676 thiss!1504))))))

(declare-fun b!262772 () Bool)

(declare-fun res!128348 () Bool)

(declare-fun e!170284 () Bool)

(assert (=> b!262772 (=> (not res!128348) (not e!170284))))

(declare-fun e!170285 () Bool)

(assert (=> b!262772 (= res!128348 e!170285)))

(declare-fun c!44800 () Bool)

(assert (=> b!262772 (= c!44800 (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262773 () Bool)

(declare-fun e!170282 () Bool)

(assert (=> b!262773 (= e!170282 (= (apply!261 lt!132883 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4676 thiss!1504)))))

(declare-fun b!262774 () Bool)

(declare-fun e!170291 () Bool)

(assert (=> b!262774 (= e!170291 (= (apply!261 lt!132883 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4676 thiss!1504)))))

(declare-fun bm!25127 () Bool)

(declare-fun call!25136 () ListLongMap!3885)

(declare-fun call!25134 () ListLongMap!3885)

(assert (=> bm!25127 (= call!25136 call!25134)))

(declare-fun b!262775 () Bool)

(declare-fun e!170286 () Bool)

(declare-fun call!25135 () Bool)

(assert (=> b!262775 (= e!170286 (not call!25135))))

(declare-fun b!262776 () Bool)

(assert (=> b!262776 (= e!170286 e!170291)))

(declare-fun res!128351 () Bool)

(assert (=> b!262776 (= res!128351 call!25135)))

(assert (=> b!262776 (=> (not res!128351) (not e!170291))))

(declare-fun b!262777 () Bool)

(declare-fun e!170289 () ListLongMap!3885)

(assert (=> b!262777 (= e!170287 e!170289)))

(declare-fun c!44795 () Bool)

(assert (=> b!262777 (= c!44795 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25128 () Bool)

(declare-fun call!25131 () ListLongMap!3885)

(assert (=> bm!25128 (= call!25131 (getCurrentListMapNoExtraKeys!583 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun b!262771 () Bool)

(assert (=> b!262771 (= e!170284 e!170286)))

(declare-fun c!44799 () Bool)

(assert (=> b!262771 (= c!44799 (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!63071 () Bool)

(assert (=> d!63071 e!170284))

(declare-fun res!128350 () Bool)

(assert (=> d!63071 (=> (not res!128350) (not e!170284))))

(assert (=> d!63071 (= res!128350 (or (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))))

(declare-fun lt!132886 () ListLongMap!3885)

(assert (=> d!63071 (= lt!132883 lt!132886)))

(declare-fun lt!132895 () Unit!8175)

(declare-fun e!170290 () Unit!8175)

(assert (=> d!63071 (= lt!132895 e!170290)))

(declare-fun c!44797 () Bool)

(declare-fun e!170293 () Bool)

(assert (=> d!63071 (= c!44797 e!170293)))

(declare-fun res!128345 () Bool)

(assert (=> d!63071 (=> (not res!128345) (not e!170293))))

(assert (=> d!63071 (= res!128345 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(assert (=> d!63071 (= lt!132886 e!170287)))

(declare-fun c!44796 () Bool)

(assert (=> d!63071 (= c!44796 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63071 (validMask!0 (mask!11194 thiss!1504))))

(assert (=> d!63071 (= (getCurrentListMap!1486 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)) lt!132883)))

(declare-fun b!262778 () Bool)

(declare-fun c!44798 () Bool)

(assert (=> b!262778 (= c!44798 (and (not (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4572 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170292 () ListLongMap!3885)

(assert (=> b!262778 (= e!170289 e!170292)))

(declare-fun b!262779 () Bool)

(declare-fun lt!132893 () Unit!8175)

(assert (=> b!262779 (= e!170290 lt!132893)))

(declare-fun lt!132880 () ListLongMap!3885)

(assert (=> b!262779 (= lt!132880 (getCurrentListMapNoExtraKeys!583 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132888 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132900 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132900 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132899 () Unit!8175)

(assert (=> b!262779 (= lt!132899 (addStillContains!237 lt!132880 lt!132888 (zeroValue!4676 thiss!1504) lt!132900))))

(assert (=> b!262779 (contains!1907 (+!708 lt!132880 (tuple2!4973 lt!132888 (zeroValue!4676 thiss!1504))) lt!132900)))

(declare-fun lt!132884 () Unit!8175)

(assert (=> b!262779 (= lt!132884 lt!132899)))

(declare-fun lt!132892 () ListLongMap!3885)

(assert (=> b!262779 (= lt!132892 (getCurrentListMapNoExtraKeys!583 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132882 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132882 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132894 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132894 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132897 () Unit!8175)

(assert (=> b!262779 (= lt!132897 (addApplyDifferent!237 lt!132892 lt!132882 (minValue!4676 thiss!1504) lt!132894))))

(assert (=> b!262779 (= (apply!261 (+!708 lt!132892 (tuple2!4973 lt!132882 (minValue!4676 thiss!1504))) lt!132894) (apply!261 lt!132892 lt!132894))))

(declare-fun lt!132898 () Unit!8175)

(assert (=> b!262779 (= lt!132898 lt!132897)))

(declare-fun lt!132887 () ListLongMap!3885)

(assert (=> b!262779 (= lt!132887 (getCurrentListMapNoExtraKeys!583 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132890 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132885 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132885 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132891 () Unit!8175)

(assert (=> b!262779 (= lt!132891 (addApplyDifferent!237 lt!132887 lt!132890 (zeroValue!4676 thiss!1504) lt!132885))))

(assert (=> b!262779 (= (apply!261 (+!708 lt!132887 (tuple2!4973 lt!132890 (zeroValue!4676 thiss!1504))) lt!132885) (apply!261 lt!132887 lt!132885))))

(declare-fun lt!132896 () Unit!8175)

(assert (=> b!262779 (= lt!132896 lt!132891)))

(declare-fun lt!132879 () ListLongMap!3885)

(assert (=> b!262779 (= lt!132879 (getCurrentListMapNoExtraKeys!583 (_keys!7025 thiss!1504) (_values!4818 thiss!1504) (mask!11194 thiss!1504) (extraKeys!4572 thiss!1504) (zeroValue!4676 thiss!1504) (minValue!4676 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4835 thiss!1504)))))

(declare-fun lt!132889 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132889 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132881 () (_ BitVec 64))

(assert (=> b!262779 (= lt!132881 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262779 (= lt!132893 (addApplyDifferent!237 lt!132879 lt!132889 (minValue!4676 thiss!1504) lt!132881))))

(assert (=> b!262779 (= (apply!261 (+!708 lt!132879 (tuple2!4973 lt!132889 (minValue!4676 thiss!1504))) lt!132881) (apply!261 lt!132879 lt!132881))))

(declare-fun b!262780 () Bool)

(assert (=> b!262780 (= e!170292 call!25136)))

(declare-fun b!262781 () Bool)

(assert (=> b!262781 (= e!170285 e!170282)))

(declare-fun res!128343 () Bool)

(declare-fun call!25133 () Bool)

(assert (=> b!262781 (= res!128343 call!25133)))

(assert (=> b!262781 (=> (not res!128343) (not e!170282))))

(declare-fun b!262782 () Bool)

(assert (=> b!262782 (= e!170293 (validKeyInArray!0 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262783 () Bool)

(declare-fun Unit!8187 () Unit!8175)

(assert (=> b!262783 (= e!170290 Unit!8187)))

(declare-fun b!262784 () Bool)

(declare-fun e!170294 () Bool)

(assert (=> b!262784 (= e!170294 e!170283)))

(declare-fun res!128344 () Bool)

(assert (=> b!262784 (=> (not res!128344) (not e!170283))))

(assert (=> b!262784 (= res!128344 (contains!1907 lt!132883 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun b!262785 () Bool)

(assert (=> b!262785 (= e!170285 (not call!25133))))

(declare-fun b!262786 () Bool)

(declare-fun e!170288 () Bool)

(assert (=> b!262786 (= e!170288 (validKeyInArray!0 (select (arr!5993 (_keys!7025 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25129 () Bool)

(assert (=> bm!25129 (= call!25135 (contains!1907 lt!132883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262787 () Bool)

(declare-fun call!25130 () ListLongMap!3885)

(assert (=> b!262787 (= e!170289 call!25130)))

(declare-fun bm!25130 () Bool)

(assert (=> bm!25130 (= call!25130 call!25132)))

(declare-fun bm!25131 () Bool)

(assert (=> bm!25131 (= call!25132 (+!708 (ite c!44796 call!25131 (ite c!44795 call!25134 call!25136)) (ite (or c!44796 c!44795) (tuple2!4973 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4676 thiss!1504)) (tuple2!4973 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4676 thiss!1504)))))))

(declare-fun b!262788 () Bool)

(declare-fun res!128346 () Bool)

(assert (=> b!262788 (=> (not res!128346) (not e!170284))))

(assert (=> b!262788 (= res!128346 e!170294)))

(declare-fun res!128349 () Bool)

(assert (=> b!262788 (=> res!128349 e!170294)))

(assert (=> b!262788 (= res!128349 (not e!170288))))

(declare-fun res!128347 () Bool)

(assert (=> b!262788 (=> (not res!128347) (not e!170288))))

(assert (=> b!262788 (= res!128347 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))))))

(declare-fun bm!25132 () Bool)

(assert (=> bm!25132 (= call!25133 (contains!1907 lt!132883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25133 () Bool)

(assert (=> bm!25133 (= call!25134 call!25131)))

(declare-fun b!262789 () Bool)

(assert (=> b!262789 (= e!170292 call!25130)))

(assert (= (and d!63071 c!44796) b!262770))

(assert (= (and d!63071 (not c!44796)) b!262777))

(assert (= (and b!262777 c!44795) b!262787))

(assert (= (and b!262777 (not c!44795)) b!262778))

(assert (= (and b!262778 c!44798) b!262789))

(assert (= (and b!262778 (not c!44798)) b!262780))

(assert (= (or b!262789 b!262780) bm!25127))

(assert (= (or b!262787 bm!25127) bm!25133))

(assert (= (or b!262787 b!262789) bm!25130))

(assert (= (or b!262770 bm!25133) bm!25128))

(assert (= (or b!262770 bm!25130) bm!25131))

(assert (= (and d!63071 res!128345) b!262782))

(assert (= (and d!63071 c!44797) b!262779))

(assert (= (and d!63071 (not c!44797)) b!262783))

(assert (= (and d!63071 res!128350) b!262788))

(assert (= (and b!262788 res!128347) b!262786))

(assert (= (and b!262788 (not res!128349)) b!262784))

(assert (= (and b!262784 res!128344) b!262769))

(assert (= (and b!262788 res!128346) b!262772))

(assert (= (and b!262772 c!44800) b!262781))

(assert (= (and b!262772 (not c!44800)) b!262785))

(assert (= (and b!262781 res!128343) b!262773))

(assert (= (or b!262781 b!262785) bm!25132))

(assert (= (and b!262772 res!128348) b!262771))

(assert (= (and b!262771 c!44799) b!262776))

(assert (= (and b!262771 (not c!44799)) b!262775))

(assert (= (and b!262776 res!128351) b!262774))

(assert (= (or b!262776 b!262775) bm!25129))

(declare-fun b_lambda!8325 () Bool)

(assert (=> (not b_lambda!8325) (not b!262769)))

(assert (=> b!262769 t!8927))

(declare-fun b_and!13933 () Bool)

(assert (= b_and!13931 (and (=> t!8927 result!5427) b_and!13933)))

(declare-fun m!278845 () Bool)

(assert (=> bm!25129 m!278845))

(declare-fun m!278847 () Bool)

(assert (=> bm!25128 m!278847))

(declare-fun m!278849 () Bool)

(assert (=> b!262773 m!278849))

(declare-fun m!278851 () Bool)

(assert (=> b!262774 m!278851))

(declare-fun m!278853 () Bool)

(assert (=> bm!25132 m!278853))

(assert (=> b!262786 m!278689))

(assert (=> b!262786 m!278689))

(assert (=> b!262786 m!278691))

(declare-fun m!278855 () Bool)

(assert (=> b!262770 m!278855))

(declare-fun m!278857 () Bool)

(assert (=> b!262779 m!278857))

(declare-fun m!278859 () Bool)

(assert (=> b!262779 m!278859))

(declare-fun m!278861 () Bool)

(assert (=> b!262779 m!278861))

(declare-fun m!278863 () Bool)

(assert (=> b!262779 m!278863))

(declare-fun m!278865 () Bool)

(assert (=> b!262779 m!278865))

(assert (=> b!262779 m!278861))

(assert (=> b!262779 m!278847))

(declare-fun m!278867 () Bool)

(assert (=> b!262779 m!278867))

(assert (=> b!262779 m!278689))

(assert (=> b!262779 m!278865))

(declare-fun m!278869 () Bool)

(assert (=> b!262779 m!278869))

(declare-fun m!278871 () Bool)

(assert (=> b!262779 m!278871))

(declare-fun m!278873 () Bool)

(assert (=> b!262779 m!278873))

(declare-fun m!278875 () Bool)

(assert (=> b!262779 m!278875))

(assert (=> b!262779 m!278873))

(declare-fun m!278877 () Bool)

(assert (=> b!262779 m!278877))

(declare-fun m!278879 () Bool)

(assert (=> b!262779 m!278879))

(declare-fun m!278881 () Bool)

(assert (=> b!262779 m!278881))

(declare-fun m!278883 () Bool)

(assert (=> b!262779 m!278883))

(assert (=> b!262779 m!278881))

(declare-fun m!278885 () Bool)

(assert (=> b!262779 m!278885))

(assert (=> b!262769 m!278689))

(assert (=> b!262769 m!278689))

(declare-fun m!278887 () Bool)

(assert (=> b!262769 m!278887))

(assert (=> b!262769 m!278795))

(declare-fun m!278889 () Bool)

(assert (=> b!262769 m!278889))

(assert (=> b!262769 m!278795))

(declare-fun m!278891 () Bool)

(assert (=> b!262769 m!278891))

(assert (=> b!262769 m!278889))

(declare-fun m!278893 () Bool)

(assert (=> bm!25131 m!278893))

(assert (=> b!262784 m!278689))

(assert (=> b!262784 m!278689))

(declare-fun m!278895 () Bool)

(assert (=> b!262784 m!278895))

(assert (=> b!262782 m!278689))

(assert (=> b!262782 m!278689))

(assert (=> b!262782 m!278691))

(assert (=> d!63071 m!278585))

(assert (=> b!262484 d!63071))

(assert (=> bm!25082 d!63039))

(declare-fun d!63073 () Bool)

(declare-fun res!128358 () Bool)

(declare-fun e!170297 () Bool)

(assert (=> d!63073 (=> (not res!128358) (not e!170297))))

(declare-fun simpleValid!284 (LongMapFixedSize!3864) Bool)

(assert (=> d!63073 (= res!128358 (simpleValid!284 thiss!1504))))

(assert (=> d!63073 (= (valid!1506 thiss!1504) e!170297)))

(declare-fun b!262796 () Bool)

(declare-fun res!128359 () Bool)

(assert (=> b!262796 (=> (not res!128359) (not e!170297))))

(assert (=> b!262796 (= res!128359 (= (arrayCountValidKeys!0 (_keys!7025 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7025 thiss!1504))) (_size!1981 thiss!1504)))))

(declare-fun b!262797 () Bool)

(declare-fun res!128360 () Bool)

(assert (=> b!262797 (=> (not res!128360) (not e!170297))))

(assert (=> b!262797 (= res!128360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7025 thiss!1504) (mask!11194 thiss!1504)))))

(declare-fun b!262798 () Bool)

(assert (=> b!262798 (= e!170297 (arrayNoDuplicates!0 (_keys!7025 thiss!1504) #b00000000000000000000000000000000 Nil!3845))))

(assert (= (and d!63073 res!128358) b!262796))

(assert (= (and b!262796 res!128359) b!262797))

(assert (= (and b!262797 res!128360) b!262798))

(declare-fun m!278897 () Bool)

(assert (=> d!63073 m!278897))

(assert (=> b!262796 m!278575))

(declare-fun m!278899 () Bool)

(assert (=> b!262797 m!278899))

(declare-fun m!278901 () Bool)

(assert (=> b!262798 m!278901))

(assert (=> start!25186 d!63073))

(declare-fun b!262806 () Bool)

(declare-fun e!170303 () Bool)

(assert (=> b!262806 (= e!170303 tp_is_empty!6651)))

(declare-fun condMapEmpty!11344 () Bool)

(declare-fun mapDefault!11344 () ValueCell!2982)

(assert (=> mapNonEmpty!11338 (= condMapEmpty!11344 (= mapRest!11338 ((as const (Array (_ BitVec 32) ValueCell!2982)) mapDefault!11344)))))

(declare-fun mapRes!11344 () Bool)

(assert (=> mapNonEmpty!11338 (= tp!23701 (and e!170303 mapRes!11344))))

(declare-fun mapIsEmpty!11344 () Bool)

(assert (=> mapIsEmpty!11344 mapRes!11344))

(declare-fun b!262805 () Bool)

(declare-fun e!170302 () Bool)

(assert (=> b!262805 (= e!170302 tp_is_empty!6651)))

(declare-fun mapNonEmpty!11344 () Bool)

(declare-fun tp!23710 () Bool)

(assert (=> mapNonEmpty!11344 (= mapRes!11344 (and tp!23710 e!170302))))

(declare-fun mapKey!11344 () (_ BitVec 32))

(declare-fun mapValue!11344 () ValueCell!2982)

(declare-fun mapRest!11344 () (Array (_ BitVec 32) ValueCell!2982))

(assert (=> mapNonEmpty!11344 (= mapRest!11338 (store mapRest!11344 mapKey!11344 mapValue!11344))))

(assert (= (and mapNonEmpty!11338 condMapEmpty!11344) mapIsEmpty!11344))

(assert (= (and mapNonEmpty!11338 (not condMapEmpty!11344)) mapNonEmpty!11344))

(assert (= (and mapNonEmpty!11344 ((_ is ValueCellFull!2982) mapValue!11344)) b!262805))

(assert (= (and mapNonEmpty!11338 ((_ is ValueCellFull!2982) mapDefault!11344)) b!262806))

(declare-fun m!278903 () Bool)

(assert (=> mapNonEmpty!11344 m!278903))

(declare-fun b_lambda!8327 () Bool)

(assert (= b_lambda!8323 (or (and b!262485 b_free!6789) b_lambda!8327)))

(declare-fun b_lambda!8329 () Bool)

(assert (= b_lambda!8325 (or (and b!262485 b_free!6789) b_lambda!8329)))

(check-sat b_and!13933 (not b!262769) (not b!262587) (not b!262693) (not b_next!6789) (not d!63055) (not b_lambda!8327) (not d!63069) (not bm!25116) (not b!262625) (not d!63049) (not bm!25126) (not b!262642) (not b!262640) (not b!262796) (not b!262594) (not bm!25132) (not mapNonEmpty!11344) (not d!63029) (not bm!25099) (not bm!25131) (not b!262699) (not bm!25095) (not b!262600) (not b!262613) (not bm!25115) (not b!262702) (not b!262580) (not b_lambda!8329) (not b!262585) (not b!262624) (not bm!25118) (not b!262798) (not d!63041) (not b!262568) (not b!262627) tp_is_empty!6651 (not b!262637) (not b!262706) (not b!262734) (not b!262797) (not d!63031) (not bm!25128) (not d!63057) (not d!63063) (not d!63025) (not bm!25091) (not b!262770) (not b!262766) (not d!63065) (not bm!25125) (not b!262689) (not b!262644) (not d!63021) (not b!262611) (not b!262690) (not b!262774) (not bm!25129) (not b!262779) (not b!262773) (not b!262716) (not b!262784) (not b!262694) (not bm!25092) (not b!262631) (not d!63073) (not b!262786) (not b!262570) (not b!262768) (not d!63037) (not d!63071) (not d!63019) (not bm!25119) (not b!262601) (not b!262782) (not b!262567) (not b!262704) (not bm!25098))
(check-sat b_and!13933 (not b_next!6789))
