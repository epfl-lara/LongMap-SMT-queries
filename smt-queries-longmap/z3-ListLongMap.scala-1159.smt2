; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24382 () Bool)

(assert start!24382)

(declare-fun b!255454 () Bool)

(declare-fun b_free!6703 () Bool)

(declare-fun b_next!6703 () Bool)

(assert (=> b!255454 (= b_free!6703 (not b_next!6703))))

(declare-fun tp!23402 () Bool)

(declare-fun b_and!13767 () Bool)

(assert (=> b!255454 (= tp!23402 b_and!13767)))

(declare-fun b!255443 () Bool)

(declare-fun e!165583 () Bool)

(declare-fun call!24131 () Bool)

(assert (=> b!255443 (= e!165583 (not call!24131))))

(declare-fun b!255444 () Bool)

(declare-fun e!165580 () Bool)

(assert (=> b!255444 (= e!165580 (not call!24131))))

(declare-fun b!255445 () Bool)

(declare-fun res!125009 () Bool)

(declare-datatypes ((V!8401 0))(
  ( (V!8402 (val!3327 Int)) )
))
(declare-datatypes ((ValueCell!2939 0))(
  ( (ValueCellFull!2939 (v!5408 V!8401)) (EmptyCell!2939) )
))
(declare-datatypes ((array!12463 0))(
  ( (array!12464 (arr!5905 (Array (_ BitVec 32) ValueCell!2939)) (size!6252 (_ BitVec 32))) )
))
(declare-datatypes ((array!12465 0))(
  ( (array!12466 (arr!5906 (Array (_ BitVec 32) (_ BitVec 64))) (size!6253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3778 0))(
  ( (LongMapFixedSize!3779 (defaultEntry!4712 Int) (mask!10972 (_ BitVec 32)) (extraKeys!4449 (_ BitVec 32)) (zeroValue!4553 V!8401) (minValue!4553 V!8401) (_size!1938 (_ BitVec 32)) (_keys!6870 array!12465) (_values!4695 array!12463) (_vacant!1938 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3778)

(declare-datatypes ((SeekEntryResult!1123 0))(
  ( (MissingZero!1123 (index!6662 (_ BitVec 32))) (Found!1123 (index!6663 (_ BitVec 32))) (Intermediate!1123 (undefined!1935 Bool) (index!6664 (_ BitVec 32)) (x!24883 (_ BitVec 32))) (Undefined!1123) (MissingVacant!1123 (index!6665 (_ BitVec 32))) )
))
(declare-fun lt!128164 () SeekEntryResult!1123)

(assert (=> b!255445 (= res!125009 (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6665 lt!128164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255445 (=> (not res!125009) (not e!165583))))

(declare-fun c!43132 () Bool)

(declare-fun bm!24127 () Bool)

(declare-fun call!24130 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24127 (= call!24130 (inRange!0 (ite c!43132 (index!6662 lt!128164) (index!6665 lt!128164)) (mask!10972 thiss!1504)))))

(declare-fun b!255446 () Bool)

(declare-fun e!165572 () Bool)

(get-info :version)

(assert (=> b!255446 (= e!165572 ((_ is Undefined!1123) lt!128164))))

(declare-fun b!255447 () Bool)

(declare-fun res!125014 () Bool)

(declare-fun e!165581 () Bool)

(assert (=> b!255447 (=> (not res!125014) (not e!165581))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!255447 (= res!125014 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255448 () Bool)

(declare-fun e!165570 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255448 (= e!165570 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504))))))))

(declare-fun lt!128156 () array!12465)

(declare-fun v!346 () V!8401)

(declare-datatypes ((tuple2!4814 0))(
  ( (tuple2!4815 (_1!2418 (_ BitVec 64)) (_2!2418 V!8401)) )
))
(declare-datatypes ((List!3693 0))(
  ( (Nil!3690) (Cons!3689 (h!4351 tuple2!4814) (t!8736 List!3693)) )
))
(declare-datatypes ((ListLongMap!3729 0))(
  ( (ListLongMap!3730 (toList!1880 List!3693)) )
))
(declare-fun lt!128157 () ListLongMap!3729)

(declare-fun +!678 (ListLongMap!3729 tuple2!4814) ListLongMap!3729)

(declare-fun getCurrentListMap!1412 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) Int) ListLongMap!3729)

(assert (=> b!255448 (= (+!678 lt!128157 (tuple2!4815 key!932 v!346)) (getCurrentListMap!1412 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-datatypes ((Unit!7896 0))(
  ( (Unit!7897) )
))
(declare-fun lt!128154 () Unit!7896)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!93 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) (_ BitVec 64) V!8401 Int) Unit!7896)

(assert (=> b!255448 (= lt!128154 (lemmaAddValidKeyToArrayThenAddPairToListMap!93 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12465 (_ BitVec 32)) Bool)

(assert (=> b!255448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128156 (mask!10972 thiss!1504))))

(declare-fun lt!128158 () Unit!7896)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12465 (_ BitVec 32) (_ BitVec 32)) Unit!7896)

(assert (=> b!255448 (= lt!128158 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) index!297 (mask!10972 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255448 (= (arrayCountValidKeys!0 lt!128156 #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504)))))))

(declare-fun lt!128159 () Unit!7896)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12465 (_ BitVec 32) (_ BitVec 64)) Unit!7896)

(assert (=> b!255448 (= lt!128159 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6870 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3694 0))(
  ( (Nil!3691) (Cons!3690 (h!4352 (_ BitVec 64)) (t!8737 List!3694)) )
))
(declare-fun arrayNoDuplicates!0 (array!12465 (_ BitVec 32) List!3694) Bool)

(assert (=> b!255448 (arrayNoDuplicates!0 lt!128156 #b00000000000000000000000000000000 Nil!3691)))

(assert (=> b!255448 (= lt!128156 (array!12466 (store (arr!5906 (_keys!6870 thiss!1504)) index!297 key!932) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun lt!128163 () Unit!7896)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12465 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3694) Unit!7896)

(assert (=> b!255448 (= lt!128163 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6870 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3691))))

(declare-fun lt!128165 () Unit!7896)

(declare-fun e!165577 () Unit!7896)

(assert (=> b!255448 (= lt!128165 e!165577)))

(declare-fun c!43135 () Bool)

(declare-fun arrayContainsKey!0 (array!12465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!255448 (= c!43135 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255449 () Bool)

(declare-fun Unit!7898 () Unit!7896)

(assert (=> b!255449 (= e!165577 Unit!7898)))

(declare-fun lt!128155 () Unit!7896)

(declare-fun lemmaArrayContainsKeyThenInListMap!235 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) (_ BitVec 32) Int) Unit!7896)

(assert (=> b!255449 (= lt!128155 (lemmaArrayContainsKeyThenInListMap!235 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(assert (=> b!255449 false))

(declare-fun b!255450 () Bool)

(declare-fun e!165571 () Bool)

(assert (=> b!255450 (= e!165581 e!165571)))

(declare-fun res!125016 () Bool)

(assert (=> b!255450 (=> (not res!125016) (not e!165571))))

(assert (=> b!255450 (= res!125016 (or (= lt!128164 (MissingZero!1123 index!297)) (= lt!128164 (MissingVacant!1123 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12465 (_ BitVec 32)) SeekEntryResult!1123)

(assert (=> b!255450 (= lt!128164 (seekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(declare-fun res!125011 () Bool)

(assert (=> start!24382 (=> (not res!125011) (not e!165581))))

(declare-fun valid!1483 (LongMapFixedSize!3778) Bool)

(assert (=> start!24382 (= res!125011 (valid!1483 thiss!1504))))

(assert (=> start!24382 e!165581))

(declare-fun e!165576 () Bool)

(assert (=> start!24382 e!165576))

(assert (=> start!24382 true))

(declare-fun tp_is_empty!6565 () Bool)

(assert (=> start!24382 tp_is_empty!6565))

(declare-fun mapIsEmpty!11169 () Bool)

(declare-fun mapRes!11169 () Bool)

(assert (=> mapIsEmpty!11169 mapRes!11169))

(declare-fun b!255451 () Bool)

(declare-fun res!125013 () Bool)

(assert (=> b!255451 (=> (not res!125013) (not e!165580))))

(assert (=> b!255451 (= res!125013 (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6662 lt!128164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24128 () Bool)

(assert (=> bm!24128 (= call!24131 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255452 () Bool)

(declare-fun c!43133 () Bool)

(assert (=> b!255452 (= c!43133 ((_ is MissingVacant!1123) lt!128164))))

(declare-fun e!165575 () Bool)

(assert (=> b!255452 (= e!165575 e!165572)))

(declare-fun b!255453 () Bool)

(declare-fun e!165579 () Bool)

(assert (=> b!255453 (= e!165579 tp_is_empty!6565)))

(declare-fun e!165573 () Bool)

(declare-fun array_inv!3885 (array!12465) Bool)

(declare-fun array_inv!3886 (array!12463) Bool)

(assert (=> b!255454 (= e!165576 (and tp!23402 tp_is_empty!6565 (array_inv!3885 (_keys!6870 thiss!1504)) (array_inv!3886 (_values!4695 thiss!1504)) e!165573))))

(declare-fun b!255455 () Bool)

(declare-fun Unit!7899 () Unit!7896)

(assert (=> b!255455 (= e!165577 Unit!7899)))

(declare-fun b!255456 () Bool)

(assert (=> b!255456 (= e!165571 e!165570)))

(declare-fun res!125010 () Bool)

(assert (=> b!255456 (=> (not res!125010) (not e!165570))))

(assert (=> b!255456 (= res!125010 (inRange!0 index!297 (mask!10972 thiss!1504)))))

(declare-fun lt!128161 () Unit!7896)

(declare-fun e!165582 () Unit!7896)

(assert (=> b!255456 (= lt!128161 e!165582)))

(declare-fun c!43134 () Bool)

(declare-fun contains!1829 (ListLongMap!3729 (_ BitVec 64)) Bool)

(assert (=> b!255456 (= c!43134 (contains!1829 lt!128157 key!932))))

(assert (=> b!255456 (= lt!128157 (getCurrentListMap!1412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255457 () Bool)

(declare-fun lt!128160 () Unit!7896)

(assert (=> b!255457 (= e!165582 lt!128160)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7896)

(assert (=> b!255457 (= lt!128160 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> b!255457 (= c!43132 ((_ is MissingZero!1123) lt!128164))))

(assert (=> b!255457 e!165575))

(declare-fun b!255458 () Bool)

(declare-fun e!165574 () Bool)

(assert (=> b!255458 (= e!165574 tp_is_empty!6565)))

(declare-fun b!255459 () Bool)

(assert (=> b!255459 (= e!165573 (and e!165579 mapRes!11169))))

(declare-fun condMapEmpty!11169 () Bool)

(declare-fun mapDefault!11169 () ValueCell!2939)

(assert (=> b!255459 (= condMapEmpty!11169 (= (arr!5905 (_values!4695 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2939)) mapDefault!11169)))))

(declare-fun b!255460 () Bool)

(declare-fun Unit!7900 () Unit!7896)

(assert (=> b!255460 (= e!165582 Unit!7900)))

(declare-fun lt!128162 () Unit!7896)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7896)

(assert (=> b!255460 (= lt!128162 (lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> b!255460 false))

(declare-fun b!255461 () Bool)

(declare-fun res!125015 () Bool)

(assert (=> b!255461 (=> (not res!125015) (not e!165580))))

(assert (=> b!255461 (= res!125015 call!24130)))

(assert (=> b!255461 (= e!165575 e!165580)))

(declare-fun b!255462 () Bool)

(assert (=> b!255462 (= e!165572 e!165583)))

(declare-fun res!125012 () Bool)

(assert (=> b!255462 (= res!125012 call!24130)))

(assert (=> b!255462 (=> (not res!125012) (not e!165583))))

(declare-fun mapNonEmpty!11169 () Bool)

(declare-fun tp!23403 () Bool)

(assert (=> mapNonEmpty!11169 (= mapRes!11169 (and tp!23403 e!165574))))

(declare-fun mapValue!11169 () ValueCell!2939)

(declare-fun mapKey!11169 () (_ BitVec 32))

(declare-fun mapRest!11169 () (Array (_ BitVec 32) ValueCell!2939))

(assert (=> mapNonEmpty!11169 (= (arr!5905 (_values!4695 thiss!1504)) (store mapRest!11169 mapKey!11169 mapValue!11169))))

(assert (= (and start!24382 res!125011) b!255447))

(assert (= (and b!255447 res!125014) b!255450))

(assert (= (and b!255450 res!125016) b!255456))

(assert (= (and b!255456 c!43134) b!255460))

(assert (= (and b!255456 (not c!43134)) b!255457))

(assert (= (and b!255457 c!43132) b!255461))

(assert (= (and b!255457 (not c!43132)) b!255452))

(assert (= (and b!255461 res!125015) b!255451))

(assert (= (and b!255451 res!125013) b!255444))

(assert (= (and b!255452 c!43133) b!255462))

(assert (= (and b!255452 (not c!43133)) b!255446))

(assert (= (and b!255462 res!125012) b!255445))

(assert (= (and b!255445 res!125009) b!255443))

(assert (= (or b!255461 b!255462) bm!24127))

(assert (= (or b!255444 b!255443) bm!24128))

(assert (= (and b!255456 res!125010) b!255448))

(assert (= (and b!255448 c!43135) b!255449))

(assert (= (and b!255448 (not c!43135)) b!255455))

(assert (= (and b!255459 condMapEmpty!11169) mapIsEmpty!11169))

(assert (= (and b!255459 (not condMapEmpty!11169)) mapNonEmpty!11169))

(assert (= (and mapNonEmpty!11169 ((_ is ValueCellFull!2939) mapValue!11169)) b!255458))

(assert (= (and b!255459 ((_ is ValueCellFull!2939) mapDefault!11169)) b!255453))

(assert (= b!255454 b!255459))

(assert (= start!24382 b!255454))

(declare-fun m!271047 () Bool)

(assert (=> start!24382 m!271047))

(declare-fun m!271049 () Bool)

(assert (=> bm!24127 m!271049))

(declare-fun m!271051 () Bool)

(assert (=> b!255456 m!271051))

(declare-fun m!271053 () Bool)

(assert (=> b!255456 m!271053))

(declare-fun m!271055 () Bool)

(assert (=> b!255456 m!271055))

(declare-fun m!271057 () Bool)

(assert (=> b!255451 m!271057))

(declare-fun m!271059 () Bool)

(assert (=> bm!24128 m!271059))

(declare-fun m!271061 () Bool)

(assert (=> b!255448 m!271061))

(declare-fun m!271063 () Bool)

(assert (=> b!255448 m!271063))

(declare-fun m!271065 () Bool)

(assert (=> b!255448 m!271065))

(declare-fun m!271067 () Bool)

(assert (=> b!255448 m!271067))

(declare-fun m!271069 () Bool)

(assert (=> b!255448 m!271069))

(declare-fun m!271071 () Bool)

(assert (=> b!255448 m!271071))

(declare-fun m!271073 () Bool)

(assert (=> b!255448 m!271073))

(declare-fun m!271075 () Bool)

(assert (=> b!255448 m!271075))

(declare-fun m!271077 () Bool)

(assert (=> b!255448 m!271077))

(declare-fun m!271079 () Bool)

(assert (=> b!255448 m!271079))

(declare-fun m!271081 () Bool)

(assert (=> b!255448 m!271081))

(declare-fun m!271083 () Bool)

(assert (=> b!255448 m!271083))

(assert (=> b!255448 m!271059))

(declare-fun m!271085 () Bool)

(assert (=> b!255449 m!271085))

(declare-fun m!271087 () Bool)

(assert (=> b!255460 m!271087))

(declare-fun m!271089 () Bool)

(assert (=> b!255457 m!271089))

(declare-fun m!271091 () Bool)

(assert (=> b!255454 m!271091))

(declare-fun m!271093 () Bool)

(assert (=> b!255454 m!271093))

(declare-fun m!271095 () Bool)

(assert (=> b!255445 m!271095))

(declare-fun m!271097 () Bool)

(assert (=> mapNonEmpty!11169 m!271097))

(declare-fun m!271099 () Bool)

(assert (=> b!255450 m!271099))

(check-sat (not b!255450) (not b!255454) (not b!255456) (not start!24382) (not b!255460) (not b!255448) (not b!255457) tp_is_empty!6565 (not b_next!6703) b_and!13767 (not mapNonEmpty!11169) (not bm!24128) (not bm!24127) (not b!255449))
(check-sat b_and!13767 (not b_next!6703))
(get-model)

(declare-fun d!61651 () Bool)

(assert (=> d!61651 (contains!1829 (getCurrentListMap!1412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) key!932)))

(declare-fun lt!128240 () Unit!7896)

(declare-fun choose!1227 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) (_ BitVec 32) Int) Unit!7896)

(assert (=> d!61651 (= lt!128240 (choose!1227 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61651 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61651 (= (lemmaArrayContainsKeyThenInListMap!235 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128240)))

(declare-fun bs!9082 () Bool)

(assert (= bs!9082 d!61651))

(assert (=> bs!9082 m!271055))

(assert (=> bs!9082 m!271055))

(declare-fun m!271209 () Bool)

(assert (=> bs!9082 m!271209))

(declare-fun m!271211 () Bool)

(assert (=> bs!9082 m!271211))

(declare-fun m!271213 () Bool)

(assert (=> bs!9082 m!271213))

(assert (=> b!255449 d!61651))

(declare-fun d!61653 () Bool)

(declare-fun res!125071 () Bool)

(declare-fun e!165670 () Bool)

(assert (=> d!61653 (=> (not res!125071) (not e!165670))))

(declare-fun simpleValid!272 (LongMapFixedSize!3778) Bool)

(assert (=> d!61653 (= res!125071 (simpleValid!272 thiss!1504))))

(assert (=> d!61653 (= (valid!1483 thiss!1504) e!165670)))

(declare-fun b!255589 () Bool)

(declare-fun res!125072 () Bool)

(assert (=> b!255589 (=> (not res!125072) (not e!165670))))

(assert (=> b!255589 (= res!125072 (= (arrayCountValidKeys!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (_size!1938 thiss!1504)))))

(declare-fun b!255590 () Bool)

(declare-fun res!125073 () Bool)

(assert (=> b!255590 (=> (not res!125073) (not e!165670))))

(assert (=> b!255590 (= res!125073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(declare-fun b!255591 () Bool)

(assert (=> b!255591 (= e!165670 (arrayNoDuplicates!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 Nil!3691))))

(assert (= (and d!61653 res!125071) b!255589))

(assert (= (and b!255589 res!125072) b!255590))

(assert (= (and b!255590 res!125073) b!255591))

(declare-fun m!271215 () Bool)

(assert (=> d!61653 m!271215))

(assert (=> b!255589 m!271073))

(declare-fun m!271217 () Bool)

(assert (=> b!255590 m!271217))

(declare-fun m!271219 () Bool)

(assert (=> b!255591 m!271219))

(assert (=> start!24382 d!61653))

(declare-fun b!255604 () Bool)

(declare-fun lt!128248 () SeekEntryResult!1123)

(declare-fun e!165678 () SeekEntryResult!1123)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12465 (_ BitVec 32)) SeekEntryResult!1123)

(assert (=> b!255604 (= e!165678 (seekKeyOrZeroReturnVacant!0 (x!24883 lt!128248) (index!6664 lt!128248) (index!6664 lt!128248) key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(declare-fun d!61655 () Bool)

(declare-fun lt!128247 () SeekEntryResult!1123)

(assert (=> d!61655 (and (or ((_ is Undefined!1123) lt!128247) (not ((_ is Found!1123) lt!128247)) (and (bvsge (index!6663 lt!128247) #b00000000000000000000000000000000) (bvslt (index!6663 lt!128247) (size!6253 (_keys!6870 thiss!1504))))) (or ((_ is Undefined!1123) lt!128247) ((_ is Found!1123) lt!128247) (not ((_ is MissingZero!1123) lt!128247)) (and (bvsge (index!6662 lt!128247) #b00000000000000000000000000000000) (bvslt (index!6662 lt!128247) (size!6253 (_keys!6870 thiss!1504))))) (or ((_ is Undefined!1123) lt!128247) ((_ is Found!1123) lt!128247) ((_ is MissingZero!1123) lt!128247) (not ((_ is MissingVacant!1123) lt!128247)) (and (bvsge (index!6665 lt!128247) #b00000000000000000000000000000000) (bvslt (index!6665 lt!128247) (size!6253 (_keys!6870 thiss!1504))))) (or ((_ is Undefined!1123) lt!128247) (ite ((_ is Found!1123) lt!128247) (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6663 lt!128247)) key!932) (ite ((_ is MissingZero!1123) lt!128247) (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6662 lt!128247)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1123) lt!128247) (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6665 lt!128247)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!165679 () SeekEntryResult!1123)

(assert (=> d!61655 (= lt!128247 e!165679)))

(declare-fun c!43168 () Bool)

(assert (=> d!61655 (= c!43168 (and ((_ is Intermediate!1123) lt!128248) (undefined!1935 lt!128248)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12465 (_ BitVec 32)) SeekEntryResult!1123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61655 (= lt!128248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10972 thiss!1504)) key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(assert (=> d!61655 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61655 (= (seekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)) lt!128247)))

(declare-fun b!255605 () Bool)

(assert (=> b!255605 (= e!165679 Undefined!1123)))

(declare-fun b!255606 () Bool)

(assert (=> b!255606 (= e!165678 (MissingZero!1123 (index!6664 lt!128248)))))

(declare-fun b!255607 () Bool)

(declare-fun c!43167 () Bool)

(declare-fun lt!128249 () (_ BitVec 64))

(assert (=> b!255607 (= c!43167 (= lt!128249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165677 () SeekEntryResult!1123)

(assert (=> b!255607 (= e!165677 e!165678)))

(declare-fun b!255608 () Bool)

(assert (=> b!255608 (= e!165679 e!165677)))

(assert (=> b!255608 (= lt!128249 (select (arr!5906 (_keys!6870 thiss!1504)) (index!6664 lt!128248)))))

(declare-fun c!43166 () Bool)

(assert (=> b!255608 (= c!43166 (= lt!128249 key!932))))

(declare-fun b!255609 () Bool)

(assert (=> b!255609 (= e!165677 (Found!1123 (index!6664 lt!128248)))))

(assert (= (and d!61655 c!43168) b!255605))

(assert (= (and d!61655 (not c!43168)) b!255608))

(assert (= (and b!255608 c!43166) b!255609))

(assert (= (and b!255608 (not c!43166)) b!255607))

(assert (= (and b!255607 c!43167) b!255606))

(assert (= (and b!255607 (not c!43167)) b!255604))

(declare-fun m!271221 () Bool)

(assert (=> b!255604 m!271221))

(declare-fun m!271223 () Bool)

(assert (=> d!61655 m!271223))

(assert (=> d!61655 m!271223))

(declare-fun m!271225 () Bool)

(assert (=> d!61655 m!271225))

(assert (=> d!61655 m!271213))

(declare-fun m!271227 () Bool)

(assert (=> d!61655 m!271227))

(declare-fun m!271229 () Bool)

(assert (=> d!61655 m!271229))

(declare-fun m!271231 () Bool)

(assert (=> d!61655 m!271231))

(declare-fun m!271233 () Bool)

(assert (=> b!255608 m!271233))

(assert (=> b!255450 d!61655))

(declare-fun d!61657 () Bool)

(declare-fun res!125078 () Bool)

(declare-fun e!165684 () Bool)

(assert (=> d!61657 (=> res!125078 e!165684)))

(assert (=> d!61657 (= res!125078 (= (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61657 (= (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000) e!165684)))

(declare-fun b!255614 () Bool)

(declare-fun e!165685 () Bool)

(assert (=> b!255614 (= e!165684 e!165685)))

(declare-fun res!125079 () Bool)

(assert (=> b!255614 (=> (not res!125079) (not e!165685))))

(assert (=> b!255614 (= res!125079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255615 () Bool)

(assert (=> b!255615 (= e!165685 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61657 (not res!125078)) b!255614))

(assert (= (and b!255614 res!125079) b!255615))

(declare-fun m!271235 () Bool)

(assert (=> d!61657 m!271235))

(declare-fun m!271237 () Bool)

(assert (=> b!255615 m!271237))

(assert (=> bm!24128 d!61657))

(declare-fun d!61659 () Bool)

(declare-fun e!165688 () Bool)

(assert (=> d!61659 e!165688))

(declare-fun res!125085 () Bool)

(assert (=> d!61659 (=> (not res!125085) (not e!165688))))

(declare-fun lt!128260 () ListLongMap!3729)

(assert (=> d!61659 (= res!125085 (contains!1829 lt!128260 (_1!2418 (tuple2!4815 key!932 v!346))))))

(declare-fun lt!128258 () List!3693)

(assert (=> d!61659 (= lt!128260 (ListLongMap!3730 lt!128258))))

(declare-fun lt!128261 () Unit!7896)

(declare-fun lt!128259 () Unit!7896)

(assert (=> d!61659 (= lt!128261 lt!128259)))

(declare-datatypes ((Option!314 0))(
  ( (Some!313 (v!5413 V!8401)) (None!312) )
))
(declare-fun getValueByKey!308 (List!3693 (_ BitVec 64)) Option!314)

(assert (=> d!61659 (= (getValueByKey!308 lt!128258 (_1!2418 (tuple2!4815 key!932 v!346))) (Some!313 (_2!2418 (tuple2!4815 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!164 (List!3693 (_ BitVec 64) V!8401) Unit!7896)

(assert (=> d!61659 (= lt!128259 (lemmaContainsTupThenGetReturnValue!164 lt!128258 (_1!2418 (tuple2!4815 key!932 v!346)) (_2!2418 (tuple2!4815 key!932 v!346))))))

(declare-fun insertStrictlySorted!167 (List!3693 (_ BitVec 64) V!8401) List!3693)

(assert (=> d!61659 (= lt!128258 (insertStrictlySorted!167 (toList!1880 lt!128157) (_1!2418 (tuple2!4815 key!932 v!346)) (_2!2418 (tuple2!4815 key!932 v!346))))))

(assert (=> d!61659 (= (+!678 lt!128157 (tuple2!4815 key!932 v!346)) lt!128260)))

(declare-fun b!255620 () Bool)

(declare-fun res!125084 () Bool)

(assert (=> b!255620 (=> (not res!125084) (not e!165688))))

(assert (=> b!255620 (= res!125084 (= (getValueByKey!308 (toList!1880 lt!128260) (_1!2418 (tuple2!4815 key!932 v!346))) (Some!313 (_2!2418 (tuple2!4815 key!932 v!346)))))))

(declare-fun b!255621 () Bool)

(declare-fun contains!1831 (List!3693 tuple2!4814) Bool)

(assert (=> b!255621 (= e!165688 (contains!1831 (toList!1880 lt!128260) (tuple2!4815 key!932 v!346)))))

(assert (= (and d!61659 res!125085) b!255620))

(assert (= (and b!255620 res!125084) b!255621))

(declare-fun m!271239 () Bool)

(assert (=> d!61659 m!271239))

(declare-fun m!271241 () Bool)

(assert (=> d!61659 m!271241))

(declare-fun m!271243 () Bool)

(assert (=> d!61659 m!271243))

(declare-fun m!271245 () Bool)

(assert (=> d!61659 m!271245))

(declare-fun m!271247 () Bool)

(assert (=> b!255620 m!271247))

(declare-fun m!271249 () Bool)

(assert (=> b!255621 m!271249))

(assert (=> b!255448 d!61659))

(declare-fun b!255631 () Bool)

(declare-fun res!125095 () Bool)

(declare-fun e!165694 () Bool)

(assert (=> b!255631 (=> (not res!125095) (not e!165694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!255631 (= res!125095 (validKeyInArray!0 key!932))))

(declare-fun b!255632 () Bool)

(assert (=> b!255632 (= e!165694 (bvslt (size!6253 (_keys!6870 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61661 () Bool)

(declare-fun e!165693 () Bool)

(assert (=> d!61661 e!165693))

(declare-fun res!125094 () Bool)

(assert (=> d!61661 (=> (not res!125094) (not e!165693))))

(assert (=> d!61661 (= res!125094 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504)))))))

(declare-fun lt!128264 () Unit!7896)

(declare-fun choose!1 (array!12465 (_ BitVec 32) (_ BitVec 64)) Unit!7896)

(assert (=> d!61661 (= lt!128264 (choose!1 (_keys!6870 thiss!1504) index!297 key!932))))

(assert (=> d!61661 e!165694))

(declare-fun res!125097 () Bool)

(assert (=> d!61661 (=> (not res!125097) (not e!165694))))

(assert (=> d!61661 (= res!125097 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504)))))))

(assert (=> d!61661 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6870 thiss!1504) index!297 key!932) lt!128264)))

(declare-fun b!255630 () Bool)

(declare-fun res!125096 () Bool)

(assert (=> b!255630 (=> (not res!125096) (not e!165694))))

(assert (=> b!255630 (= res!125096 (not (validKeyInArray!0 (select (arr!5906 (_keys!6870 thiss!1504)) index!297))))))

(declare-fun b!255633 () Bool)

(assert (=> b!255633 (= e!165693 (= (arrayCountValidKeys!0 (array!12466 (store (arr!5906 (_keys!6870 thiss!1504)) index!297 key!932) (size!6253 (_keys!6870 thiss!1504))) #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61661 res!125097) b!255630))

(assert (= (and b!255630 res!125096) b!255631))

(assert (= (and b!255631 res!125095) b!255632))

(assert (= (and d!61661 res!125094) b!255633))

(declare-fun m!271251 () Bool)

(assert (=> b!255631 m!271251))

(declare-fun m!271253 () Bool)

(assert (=> d!61661 m!271253))

(declare-fun m!271255 () Bool)

(assert (=> b!255630 m!271255))

(assert (=> b!255630 m!271255))

(declare-fun m!271257 () Bool)

(assert (=> b!255630 m!271257))

(assert (=> b!255633 m!271071))

(declare-fun m!271259 () Bool)

(assert (=> b!255633 m!271259))

(assert (=> b!255633 m!271073))

(assert (=> b!255448 d!61661))

(declare-fun b!255642 () Bool)

(declare-fun e!165703 () Bool)

(declare-fun call!24146 () Bool)

(assert (=> b!255642 (= e!165703 call!24146)))

(declare-fun b!255644 () Bool)

(declare-fun e!165701 () Bool)

(assert (=> b!255644 (= e!165701 e!165703)))

(declare-fun c!43171 () Bool)

(assert (=> b!255644 (= c!43171 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun bm!24143 () Bool)

(assert (=> bm!24143 (= call!24146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128156 (mask!10972 thiss!1504)))))

(declare-fun b!255645 () Bool)

(declare-fun e!165702 () Bool)

(assert (=> b!255645 (= e!165702 call!24146)))

(declare-fun d!61663 () Bool)

(declare-fun res!125103 () Bool)

(assert (=> d!61663 (=> res!125103 e!165701)))

(assert (=> d!61663 (= res!125103 (bvsge #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(assert (=> d!61663 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128156 (mask!10972 thiss!1504)) e!165701)))

(declare-fun b!255643 () Bool)

(assert (=> b!255643 (= e!165703 e!165702)))

(declare-fun lt!128272 () (_ BitVec 64))

(assert (=> b!255643 (= lt!128272 (select (arr!5906 lt!128156) #b00000000000000000000000000000000))))

(declare-fun lt!128271 () Unit!7896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12465 (_ BitVec 64) (_ BitVec 32)) Unit!7896)

(assert (=> b!255643 (= lt!128271 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128156 lt!128272 #b00000000000000000000000000000000))))

(assert (=> b!255643 (arrayContainsKey!0 lt!128156 lt!128272 #b00000000000000000000000000000000)))

(declare-fun lt!128273 () Unit!7896)

(assert (=> b!255643 (= lt!128273 lt!128271)))

(declare-fun res!125102 () Bool)

(assert (=> b!255643 (= res!125102 (= (seekEntryOrOpen!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000) lt!128156 (mask!10972 thiss!1504)) (Found!1123 #b00000000000000000000000000000000)))))

(assert (=> b!255643 (=> (not res!125102) (not e!165702))))

(assert (= (and d!61663 (not res!125103)) b!255644))

(assert (= (and b!255644 c!43171) b!255643))

(assert (= (and b!255644 (not c!43171)) b!255642))

(assert (= (and b!255643 res!125102) b!255645))

(assert (= (or b!255645 b!255642) bm!24143))

(declare-fun m!271261 () Bool)

(assert (=> b!255644 m!271261))

(assert (=> b!255644 m!271261))

(declare-fun m!271263 () Bool)

(assert (=> b!255644 m!271263))

(declare-fun m!271265 () Bool)

(assert (=> bm!24143 m!271265))

(assert (=> b!255643 m!271261))

(declare-fun m!271267 () Bool)

(assert (=> b!255643 m!271267))

(declare-fun m!271269 () Bool)

(assert (=> b!255643 m!271269))

(assert (=> b!255643 m!271261))

(declare-fun m!271271 () Bool)

(assert (=> b!255643 m!271271))

(assert (=> b!255448 d!61663))

(declare-fun b!255654 () Bool)

(declare-fun e!165708 () (_ BitVec 32))

(declare-fun call!24149 () (_ BitVec 32))

(assert (=> b!255654 (= e!165708 (bvadd #b00000000000000000000000000000001 call!24149))))

(declare-fun d!61665 () Bool)

(declare-fun lt!128276 () (_ BitVec 32))

(assert (=> d!61665 (and (bvsge lt!128276 #b00000000000000000000000000000000) (bvsle lt!128276 (bvsub (size!6253 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165709 () (_ BitVec 32))

(assert (=> d!61665 (= lt!128276 e!165709)))

(declare-fun c!43176 () Bool)

(assert (=> d!61665 (= c!43176 (bvsge #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(assert (=> d!61665 (and (bvsle #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6253 (_keys!6870 thiss!1504)) (size!6253 (_keys!6870 thiss!1504))))))

(assert (=> d!61665 (= (arrayCountValidKeys!0 (_keys!6870 thiss!1504) #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) lt!128276)))

(declare-fun b!255655 () Bool)

(assert (=> b!255655 (= e!165709 #b00000000000000000000000000000000)))

(declare-fun bm!24146 () Bool)

(assert (=> bm!24146 (= call!24149 (arrayCountValidKeys!0 (_keys!6870 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255656 () Bool)

(assert (=> b!255656 (= e!165709 e!165708)))

(declare-fun c!43177 () Bool)

(assert (=> b!255656 (= c!43177 (validKeyInArray!0 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255657 () Bool)

(assert (=> b!255657 (= e!165708 call!24149)))

(assert (= (and d!61665 c!43176) b!255655))

(assert (= (and d!61665 (not c!43176)) b!255656))

(assert (= (and b!255656 c!43177) b!255654))

(assert (= (and b!255656 (not c!43177)) b!255657))

(assert (= (or b!255654 b!255657) bm!24146))

(declare-fun m!271273 () Bool)

(assert (=> bm!24146 m!271273))

(assert (=> b!255656 m!271235))

(assert (=> b!255656 m!271235))

(declare-fun m!271275 () Bool)

(assert (=> b!255656 m!271275))

(assert (=> b!255448 d!61665))

(declare-fun d!61667 () Bool)

(declare-fun e!165712 () Bool)

(assert (=> d!61667 e!165712))

(declare-fun res!125106 () Bool)

(assert (=> d!61667 (=> (not res!125106) (not e!165712))))

(assert (=> d!61667 (= res!125106 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504))) (bvslt index!297 (size!6252 (_values!4695 thiss!1504)))))))

(declare-fun lt!128279 () Unit!7896)

(declare-fun choose!1228 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) (_ BitVec 64) V!8401 Int) Unit!7896)

(assert (=> d!61667 (= lt!128279 (choose!1228 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61667 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61667 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!93 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) index!297 key!932 v!346 (defaultEntry!4712 thiss!1504)) lt!128279)))

(declare-fun b!255660 () Bool)

(assert (=> b!255660 (= e!165712 (= (+!678 (getCurrentListMap!1412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) (tuple2!4815 key!932 v!346)) (getCurrentListMap!1412 (array!12466 (store (arr!5906 (_keys!6870 thiss!1504)) index!297 key!932) (size!6253 (_keys!6870 thiss!1504))) (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504))))))

(assert (= (and d!61667 res!125106) b!255660))

(declare-fun m!271277 () Bool)

(assert (=> d!61667 m!271277))

(assert (=> d!61667 m!271213))

(assert (=> b!255660 m!271055))

(declare-fun m!271279 () Bool)

(assert (=> b!255660 m!271279))

(assert (=> b!255660 m!271071))

(assert (=> b!255660 m!271065))

(assert (=> b!255660 m!271055))

(declare-fun m!271281 () Bool)

(assert (=> b!255660 m!271281))

(assert (=> b!255448 d!61667))

(declare-fun b!255661 () Bool)

(declare-fun e!165713 () (_ BitVec 32))

(declare-fun call!24150 () (_ BitVec 32))

(assert (=> b!255661 (= e!165713 (bvadd #b00000000000000000000000000000001 call!24150))))

(declare-fun d!61669 () Bool)

(declare-fun lt!128280 () (_ BitVec 32))

(assert (=> d!61669 (and (bvsge lt!128280 #b00000000000000000000000000000000) (bvsle lt!128280 (bvsub (size!6253 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun e!165714 () (_ BitVec 32))

(assert (=> d!61669 (= lt!128280 e!165714)))

(declare-fun c!43178 () Bool)

(assert (=> d!61669 (= c!43178 (bvsge #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(assert (=> d!61669 (and (bvsle #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6253 (_keys!6870 thiss!1504)) (size!6253 lt!128156)))))

(assert (=> d!61669 (= (arrayCountValidKeys!0 lt!128156 #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) lt!128280)))

(declare-fun b!255662 () Bool)

(assert (=> b!255662 (= e!165714 #b00000000000000000000000000000000)))

(declare-fun bm!24147 () Bool)

(assert (=> bm!24147 (= call!24150 (arrayCountValidKeys!0 lt!128156 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255663 () Bool)

(assert (=> b!255663 (= e!165714 e!165713)))

(declare-fun c!43179 () Bool)

(assert (=> b!255663 (= c!43179 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun b!255664 () Bool)

(assert (=> b!255664 (= e!165713 call!24150)))

(assert (= (and d!61669 c!43178) b!255662))

(assert (= (and d!61669 (not c!43178)) b!255663))

(assert (= (and b!255663 c!43179) b!255661))

(assert (= (and b!255663 (not c!43179)) b!255664))

(assert (= (or b!255661 b!255664) bm!24147))

(declare-fun m!271283 () Bool)

(assert (=> bm!24147 m!271283))

(assert (=> b!255663 m!271261))

(assert (=> b!255663 m!271261))

(assert (=> b!255663 m!271263))

(assert (=> b!255448 d!61669))

(declare-fun b!255707 () Bool)

(declare-fun e!165745 () ListLongMap!3729)

(declare-fun call!24169 () ListLongMap!3729)

(assert (=> b!255707 (= e!165745 (+!678 call!24169 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504))))))

(declare-fun b!255708 () Bool)

(declare-fun res!125130 () Bool)

(declare-fun e!165751 () Bool)

(assert (=> b!255708 (=> (not res!125130) (not e!165751))))

(declare-fun e!165753 () Bool)

(assert (=> b!255708 (= res!125130 e!165753)))

(declare-fun res!125125 () Bool)

(assert (=> b!255708 (=> res!125125 e!165753)))

(declare-fun e!165746 () Bool)

(assert (=> b!255708 (= res!125125 (not e!165746))))

(declare-fun res!125131 () Bool)

(assert (=> b!255708 (=> (not res!125131) (not e!165746))))

(assert (=> b!255708 (= res!125131 (bvslt #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(declare-fun b!255709 () Bool)

(declare-fun e!165750 () Bool)

(assert (=> b!255709 (= e!165753 e!165750)))

(declare-fun res!125133 () Bool)

(assert (=> b!255709 (=> (not res!125133) (not e!165750))))

(declare-fun lt!128345 () ListLongMap!3729)

(assert (=> b!255709 (= res!125133 (contains!1829 lt!128345 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(assert (=> b!255709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(declare-fun b!255710 () Bool)

(declare-fun e!165752 () Bool)

(declare-fun call!24171 () Bool)

(assert (=> b!255710 (= e!165752 (not call!24171))))

(declare-fun b!255711 () Bool)

(declare-fun e!165742 () ListLongMap!3729)

(assert (=> b!255711 (= e!165745 e!165742)))

(declare-fun c!43196 () Bool)

(assert (=> b!255711 (= c!43196 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!24168 () ListLongMap!3729)

(declare-fun bm!24162 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!565 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 32) Int) ListLongMap!3729)

(assert (=> bm!24162 (= call!24168 (getCurrentListMapNoExtraKeys!565 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255712 () Bool)

(declare-fun e!165743 () ListLongMap!3729)

(declare-fun call!24170 () ListLongMap!3729)

(assert (=> b!255712 (= e!165743 call!24170)))

(declare-fun b!255713 () Bool)

(declare-fun e!165744 () Unit!7896)

(declare-fun lt!128334 () Unit!7896)

(assert (=> b!255713 (= e!165744 lt!128334)))

(declare-fun lt!128339 () ListLongMap!3729)

(assert (=> b!255713 (= lt!128339 (getCurrentListMapNoExtraKeys!565 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128346 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128327 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128327 (select (arr!5906 lt!128156) #b00000000000000000000000000000000))))

(declare-fun lt!128325 () Unit!7896)

(declare-fun addStillContains!225 (ListLongMap!3729 (_ BitVec 64) V!8401 (_ BitVec 64)) Unit!7896)

(assert (=> b!255713 (= lt!128325 (addStillContains!225 lt!128339 lt!128346 (zeroValue!4553 thiss!1504) lt!128327))))

(assert (=> b!255713 (contains!1829 (+!678 lt!128339 (tuple2!4815 lt!128346 (zeroValue!4553 thiss!1504))) lt!128327)))

(declare-fun lt!128328 () Unit!7896)

(assert (=> b!255713 (= lt!128328 lt!128325)))

(declare-fun lt!128333 () ListLongMap!3729)

(assert (=> b!255713 (= lt!128333 (getCurrentListMapNoExtraKeys!565 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128332 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128337 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128337 (select (arr!5906 lt!128156) #b00000000000000000000000000000000))))

(declare-fun lt!128340 () Unit!7896)

(declare-fun addApplyDifferent!225 (ListLongMap!3729 (_ BitVec 64) V!8401 (_ BitVec 64)) Unit!7896)

(assert (=> b!255713 (= lt!128340 (addApplyDifferent!225 lt!128333 lt!128332 (minValue!4553 thiss!1504) lt!128337))))

(declare-fun apply!249 (ListLongMap!3729 (_ BitVec 64)) V!8401)

(assert (=> b!255713 (= (apply!249 (+!678 lt!128333 (tuple2!4815 lt!128332 (minValue!4553 thiss!1504))) lt!128337) (apply!249 lt!128333 lt!128337))))

(declare-fun lt!128341 () Unit!7896)

(assert (=> b!255713 (= lt!128341 lt!128340)))

(declare-fun lt!128343 () ListLongMap!3729)

(assert (=> b!255713 (= lt!128343 (getCurrentListMapNoExtraKeys!565 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128330 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128335 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128335 (select (arr!5906 lt!128156) #b00000000000000000000000000000000))))

(declare-fun lt!128336 () Unit!7896)

(assert (=> b!255713 (= lt!128336 (addApplyDifferent!225 lt!128343 lt!128330 (zeroValue!4553 thiss!1504) lt!128335))))

(assert (=> b!255713 (= (apply!249 (+!678 lt!128343 (tuple2!4815 lt!128330 (zeroValue!4553 thiss!1504))) lt!128335) (apply!249 lt!128343 lt!128335))))

(declare-fun lt!128338 () Unit!7896)

(assert (=> b!255713 (= lt!128338 lt!128336)))

(declare-fun lt!128344 () ListLongMap!3729)

(assert (=> b!255713 (= lt!128344 (getCurrentListMapNoExtraKeys!565 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128342 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128331 () (_ BitVec 64))

(assert (=> b!255713 (= lt!128331 (select (arr!5906 lt!128156) #b00000000000000000000000000000000))))

(assert (=> b!255713 (= lt!128334 (addApplyDifferent!225 lt!128344 lt!128342 (minValue!4553 thiss!1504) lt!128331))))

(assert (=> b!255713 (= (apply!249 (+!678 lt!128344 (tuple2!4815 lt!128342 (minValue!4553 thiss!1504))) lt!128331) (apply!249 lt!128344 lt!128331))))

(declare-fun b!255714 () Bool)

(declare-fun Unit!7906 () Unit!7896)

(assert (=> b!255714 (= e!165744 Unit!7906)))

(declare-fun bm!24163 () Bool)

(assert (=> bm!24163 (= call!24171 (contains!1829 lt!128345 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255715 () Bool)

(declare-fun e!165741 () Bool)

(assert (=> b!255715 (= e!165741 (= (apply!249 lt!128345 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4553 thiss!1504)))))

(declare-fun b!255716 () Bool)

(declare-fun e!165748 () Bool)

(assert (=> b!255716 (= e!165748 (= (apply!249 lt!128345 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4553 thiss!1504)))))

(declare-fun b!255717 () Bool)

(assert (=> b!255717 (= e!165752 e!165748)))

(declare-fun res!125132 () Bool)

(assert (=> b!255717 (= res!125132 call!24171)))

(assert (=> b!255717 (=> (not res!125132) (not e!165748))))

(declare-fun bm!24164 () Bool)

(declare-fun call!24165 () ListLongMap!3729)

(assert (=> bm!24164 (= call!24170 call!24165)))

(declare-fun b!255718 () Bool)

(declare-fun e!165747 () Bool)

(assert (=> b!255718 (= e!165747 e!165741)))

(declare-fun res!125127 () Bool)

(declare-fun call!24167 () Bool)

(assert (=> b!255718 (= res!125127 call!24167)))

(assert (=> b!255718 (=> (not res!125127) (not e!165741))))

(declare-fun c!43197 () Bool)

(declare-fun bm!24165 () Bool)

(assert (=> bm!24165 (= call!24169 (+!678 (ite c!43197 call!24168 (ite c!43196 call!24165 call!24170)) (ite (or c!43197 c!43196) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4553 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504)))))))

(declare-fun bm!24166 () Bool)

(assert (=> bm!24166 (= call!24165 call!24168)))

(declare-fun bm!24167 () Bool)

(declare-fun call!24166 () ListLongMap!3729)

(assert (=> bm!24167 (= call!24166 call!24169)))

(declare-fun b!255719 () Bool)

(assert (=> b!255719 (= e!165747 (not call!24167))))

(declare-fun b!255720 () Bool)

(assert (=> b!255720 (= e!165743 call!24166)))

(declare-fun b!255721 () Bool)

(assert (=> b!255721 (= e!165751 e!165752)))

(declare-fun c!43194 () Bool)

(assert (=> b!255721 (= c!43194 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255722 () Bool)

(declare-fun res!125128 () Bool)

(assert (=> b!255722 (=> (not res!125128) (not e!165751))))

(assert (=> b!255722 (= res!125128 e!165747)))

(declare-fun c!43193 () Bool)

(assert (=> b!255722 (= c!43193 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255723 () Bool)

(declare-fun c!43195 () Bool)

(assert (=> b!255723 (= c!43195 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255723 (= e!165742 e!165743)))

(declare-fun d!61671 () Bool)

(assert (=> d!61671 e!165751))

(declare-fun res!125129 () Bool)

(assert (=> d!61671 (=> (not res!125129) (not e!165751))))

(assert (=> d!61671 (= res!125129 (or (bvsge #b00000000000000000000000000000000 (size!6253 lt!128156)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 lt!128156)))))))

(declare-fun lt!128326 () ListLongMap!3729)

(assert (=> d!61671 (= lt!128345 lt!128326)))

(declare-fun lt!128329 () Unit!7896)

(assert (=> d!61671 (= lt!128329 e!165744)))

(declare-fun c!43192 () Bool)

(declare-fun e!165749 () Bool)

(assert (=> d!61671 (= c!43192 e!165749)))

(declare-fun res!125126 () Bool)

(assert (=> d!61671 (=> (not res!125126) (not e!165749))))

(assert (=> d!61671 (= res!125126 (bvslt #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(assert (=> d!61671 (= lt!128326 e!165745)))

(assert (=> d!61671 (= c!43197 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61671 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61671 (= (getCurrentListMap!1412 lt!128156 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128345)))

(declare-fun b!255724 () Bool)

(declare-fun get!3044 (ValueCell!2939 V!8401) V!8401)

(declare-fun dynLambda!592 (Int (_ BitVec 64)) V!8401)

(assert (=> b!255724 (= e!165750 (= (apply!249 lt!128345 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)) (get!3044 (select (arr!5905 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4712 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6252 (array!12464 (store (arr!5905 (_values!4695 thiss!1504)) index!297 (ValueCellFull!2939 v!346)) (size!6252 (_values!4695 thiss!1504))))))))

(assert (=> b!255724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(declare-fun bm!24168 () Bool)

(assert (=> bm!24168 (= call!24167 (contains!1829 lt!128345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255725 () Bool)

(assert (=> b!255725 (= e!165749 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun b!255726 () Bool)

(assert (=> b!255726 (= e!165746 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun b!255727 () Bool)

(assert (=> b!255727 (= e!165742 call!24166)))

(assert (= (and d!61671 c!43197) b!255707))

(assert (= (and d!61671 (not c!43197)) b!255711))

(assert (= (and b!255711 c!43196) b!255727))

(assert (= (and b!255711 (not c!43196)) b!255723))

(assert (= (and b!255723 c!43195) b!255720))

(assert (= (and b!255723 (not c!43195)) b!255712))

(assert (= (or b!255720 b!255712) bm!24164))

(assert (= (or b!255727 bm!24164) bm!24166))

(assert (= (or b!255727 b!255720) bm!24167))

(assert (= (or b!255707 bm!24166) bm!24162))

(assert (= (or b!255707 bm!24167) bm!24165))

(assert (= (and d!61671 res!125126) b!255725))

(assert (= (and d!61671 c!43192) b!255713))

(assert (= (and d!61671 (not c!43192)) b!255714))

(assert (= (and d!61671 res!125129) b!255708))

(assert (= (and b!255708 res!125131) b!255726))

(assert (= (and b!255708 (not res!125125)) b!255709))

(assert (= (and b!255709 res!125133) b!255724))

(assert (= (and b!255708 res!125130) b!255722))

(assert (= (and b!255722 c!43193) b!255718))

(assert (= (and b!255722 (not c!43193)) b!255719))

(assert (= (and b!255718 res!125127) b!255715))

(assert (= (or b!255718 b!255719) bm!24168))

(assert (= (and b!255722 res!125128) b!255721))

(assert (= (and b!255721 c!43194) b!255717))

(assert (= (and b!255721 (not c!43194)) b!255710))

(assert (= (and b!255717 res!125132) b!255716))

(assert (= (or b!255717 b!255710) bm!24163))

(declare-fun b_lambda!8169 () Bool)

(assert (=> (not b_lambda!8169) (not b!255724)))

(declare-fun t!8741 () Bool)

(declare-fun tb!3003 () Bool)

(assert (=> (and b!255454 (= (defaultEntry!4712 thiss!1504) (defaultEntry!4712 thiss!1504)) t!8741) tb!3003))

(declare-fun result!5347 () Bool)

(assert (=> tb!3003 (= result!5347 tp_is_empty!6565)))

(assert (=> b!255724 t!8741))

(declare-fun b_and!13773 () Bool)

(assert (= b_and!13767 (and (=> t!8741 result!5347) b_and!13773)))

(declare-fun m!271285 () Bool)

(assert (=> b!255707 m!271285))

(declare-fun m!271287 () Bool)

(assert (=> b!255716 m!271287))

(assert (=> b!255726 m!271261))

(assert (=> b!255726 m!271261))

(assert (=> b!255726 m!271263))

(assert (=> b!255709 m!271261))

(assert (=> b!255709 m!271261))

(declare-fun m!271289 () Bool)

(assert (=> b!255709 m!271289))

(declare-fun m!271291 () Bool)

(assert (=> bm!24168 m!271291))

(declare-fun m!271293 () Bool)

(assert (=> b!255713 m!271293))

(declare-fun m!271295 () Bool)

(assert (=> b!255713 m!271295))

(declare-fun m!271297 () Bool)

(assert (=> b!255713 m!271297))

(declare-fun m!271299 () Bool)

(assert (=> b!255713 m!271299))

(declare-fun m!271301 () Bool)

(assert (=> b!255713 m!271301))

(assert (=> b!255713 m!271261))

(declare-fun m!271303 () Bool)

(assert (=> b!255713 m!271303))

(declare-fun m!271305 () Bool)

(assert (=> b!255713 m!271305))

(declare-fun m!271307 () Bool)

(assert (=> b!255713 m!271307))

(assert (=> b!255713 m!271305))

(declare-fun m!271309 () Bool)

(assert (=> b!255713 m!271309))

(declare-fun m!271311 () Bool)

(assert (=> b!255713 m!271311))

(declare-fun m!271313 () Bool)

(assert (=> b!255713 m!271313))

(declare-fun m!271315 () Bool)

(assert (=> b!255713 m!271315))

(declare-fun m!271317 () Bool)

(assert (=> b!255713 m!271317))

(declare-fun m!271319 () Bool)

(assert (=> b!255713 m!271319))

(assert (=> b!255713 m!271299))

(declare-fun m!271321 () Bool)

(assert (=> b!255713 m!271321))

(assert (=> b!255713 m!271321))

(declare-fun m!271323 () Bool)

(assert (=> b!255713 m!271323))

(assert (=> b!255713 m!271317))

(declare-fun m!271325 () Bool)

(assert (=> b!255724 m!271325))

(declare-fun m!271327 () Bool)

(assert (=> b!255724 m!271327))

(declare-fun m!271329 () Bool)

(assert (=> b!255724 m!271329))

(assert (=> b!255724 m!271325))

(assert (=> b!255724 m!271261))

(assert (=> b!255724 m!271327))

(assert (=> b!255724 m!271261))

(declare-fun m!271331 () Bool)

(assert (=> b!255724 m!271331))

(assert (=> bm!24162 m!271311))

(declare-fun m!271333 () Bool)

(assert (=> b!255715 m!271333))

(assert (=> d!61671 m!271213))

(declare-fun m!271335 () Bool)

(assert (=> bm!24165 m!271335))

(assert (=> b!255725 m!271261))

(assert (=> b!255725 m!271261))

(assert (=> b!255725 m!271263))

(declare-fun m!271337 () Bool)

(assert (=> bm!24163 m!271337))

(assert (=> b!255448 d!61671))

(declare-fun d!61673 () Bool)

(declare-fun e!165756 () Bool)

(assert (=> d!61673 e!165756))

(declare-fun res!125136 () Bool)

(assert (=> d!61673 (=> (not res!125136) (not e!165756))))

(assert (=> d!61673 (= res!125136 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504)))))))

(declare-fun lt!128349 () Unit!7896)

(declare-fun choose!41 (array!12465 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3694) Unit!7896)

(assert (=> d!61673 (= lt!128349 (choose!41 (_keys!6870 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3691))))

(assert (=> d!61673 (bvslt (size!6253 (_keys!6870 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61673 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6870 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3691) lt!128349)))

(declare-fun b!255732 () Bool)

(assert (=> b!255732 (= e!165756 (arrayNoDuplicates!0 (array!12466 (store (arr!5906 (_keys!6870 thiss!1504)) index!297 key!932) (size!6253 (_keys!6870 thiss!1504))) #b00000000000000000000000000000000 Nil!3691))))

(assert (= (and d!61673 res!125136) b!255732))

(declare-fun m!271339 () Bool)

(assert (=> d!61673 m!271339))

(assert (=> b!255732 m!271071))

(declare-fun m!271341 () Bool)

(assert (=> b!255732 m!271341))

(assert (=> b!255448 d!61673))

(assert (=> b!255448 d!61657))

(declare-fun b!255743 () Bool)

(declare-fun e!165768 () Bool)

(declare-fun call!24174 () Bool)

(assert (=> b!255743 (= e!165768 call!24174)))

(declare-fun d!61675 () Bool)

(declare-fun res!125145 () Bool)

(declare-fun e!165767 () Bool)

(assert (=> d!61675 (=> res!125145 e!165767)))

(assert (=> d!61675 (= res!125145 (bvsge #b00000000000000000000000000000000 (size!6253 lt!128156)))))

(assert (=> d!61675 (= (arrayNoDuplicates!0 lt!128156 #b00000000000000000000000000000000 Nil!3691) e!165767)))

(declare-fun b!255744 () Bool)

(declare-fun e!165765 () Bool)

(declare-fun contains!1832 (List!3694 (_ BitVec 64)) Bool)

(assert (=> b!255744 (= e!165765 (contains!1832 Nil!3691 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun b!255745 () Bool)

(declare-fun e!165766 () Bool)

(assert (=> b!255745 (= e!165767 e!165766)))

(declare-fun res!125144 () Bool)

(assert (=> b!255745 (=> (not res!125144) (not e!165766))))

(assert (=> b!255745 (= res!125144 (not e!165765))))

(declare-fun res!125143 () Bool)

(assert (=> b!255745 (=> (not res!125143) (not e!165765))))

(assert (=> b!255745 (= res!125143 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun bm!24171 () Bool)

(declare-fun c!43200 () Bool)

(assert (=> bm!24171 (= call!24174 (arrayNoDuplicates!0 lt!128156 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43200 (Cons!3690 (select (arr!5906 lt!128156) #b00000000000000000000000000000000) Nil!3691) Nil!3691)))))

(declare-fun b!255746 () Bool)

(assert (=> b!255746 (= e!165766 e!165768)))

(assert (=> b!255746 (= c!43200 (validKeyInArray!0 (select (arr!5906 lt!128156) #b00000000000000000000000000000000)))))

(declare-fun b!255747 () Bool)

(assert (=> b!255747 (= e!165768 call!24174)))

(assert (= (and d!61675 (not res!125145)) b!255745))

(assert (= (and b!255745 res!125143) b!255744))

(assert (= (and b!255745 res!125144) b!255746))

(assert (= (and b!255746 c!43200) b!255747))

(assert (= (and b!255746 (not c!43200)) b!255743))

(assert (= (or b!255747 b!255743) bm!24171))

(assert (=> b!255744 m!271261))

(assert (=> b!255744 m!271261))

(declare-fun m!271343 () Bool)

(assert (=> b!255744 m!271343))

(assert (=> b!255745 m!271261))

(assert (=> b!255745 m!271261))

(assert (=> b!255745 m!271263))

(assert (=> bm!24171 m!271261))

(declare-fun m!271345 () Bool)

(assert (=> bm!24171 m!271345))

(assert (=> b!255746 m!271261))

(assert (=> b!255746 m!271261))

(assert (=> b!255746 m!271263))

(assert (=> b!255448 d!61675))

(declare-fun d!61677 () Bool)

(declare-fun e!165771 () Bool)

(assert (=> d!61677 e!165771))

(declare-fun res!125148 () Bool)

(assert (=> d!61677 (=> (not res!125148) (not e!165771))))

(assert (=> d!61677 (= res!125148 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6253 (_keys!6870 thiss!1504)))))))

(declare-fun lt!128352 () Unit!7896)

(declare-fun choose!102 ((_ BitVec 64) array!12465 (_ BitVec 32) (_ BitVec 32)) Unit!7896)

(assert (=> d!61677 (= lt!128352 (choose!102 key!932 (_keys!6870 thiss!1504) index!297 (mask!10972 thiss!1504)))))

(assert (=> d!61677 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61677 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) index!297 (mask!10972 thiss!1504)) lt!128352)))

(declare-fun b!255750 () Bool)

(assert (=> b!255750 (= e!165771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12466 (store (arr!5906 (_keys!6870 thiss!1504)) index!297 key!932) (size!6253 (_keys!6870 thiss!1504))) (mask!10972 thiss!1504)))))

(assert (= (and d!61677 res!125148) b!255750))

(declare-fun m!271347 () Bool)

(assert (=> d!61677 m!271347))

(assert (=> d!61677 m!271213))

(assert (=> b!255750 m!271071))

(declare-fun m!271349 () Bool)

(assert (=> b!255750 m!271349))

(assert (=> b!255448 d!61677))

(declare-fun b!255767 () Bool)

(declare-fun e!165782 () Bool)

(declare-fun call!24179 () Bool)

(assert (=> b!255767 (= e!165782 (not call!24179))))

(declare-fun bm!24176 () Bool)

(assert (=> bm!24176 (= call!24179 (arrayContainsKey!0 (_keys!6870 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255768 () Bool)

(declare-fun e!165783 () Bool)

(declare-fun e!165780 () Bool)

(assert (=> b!255768 (= e!165783 e!165780)))

(declare-fun c!43206 () Bool)

(declare-fun lt!128357 () SeekEntryResult!1123)

(assert (=> b!255768 (= c!43206 ((_ is MissingVacant!1123) lt!128357))))

(declare-fun b!255769 () Bool)

(assert (=> b!255769 (= e!165783 e!165782)))

(declare-fun res!125158 () Bool)

(declare-fun call!24180 () Bool)

(assert (=> b!255769 (= res!125158 call!24180)))

(assert (=> b!255769 (=> (not res!125158) (not e!165782))))

(declare-fun b!255770 () Bool)

(declare-fun res!125159 () Bool)

(declare-fun e!165781 () Bool)

(assert (=> b!255770 (=> (not res!125159) (not e!165781))))

(assert (=> b!255770 (= res!125159 (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6665 lt!128357)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255770 (and (bvsge (index!6665 lt!128357) #b00000000000000000000000000000000) (bvslt (index!6665 lt!128357) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255771 () Bool)

(assert (=> b!255771 (= e!165781 (not call!24179))))

(declare-fun b!255772 () Bool)

(declare-fun res!125157 () Bool)

(assert (=> b!255772 (=> (not res!125157) (not e!165781))))

(assert (=> b!255772 (= res!125157 call!24180)))

(assert (=> b!255772 (= e!165780 e!165781)))

(declare-fun b!255773 () Bool)

(assert (=> b!255773 (and (bvsge (index!6662 lt!128357) #b00000000000000000000000000000000) (bvslt (index!6662 lt!128357) (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun res!125160 () Bool)

(assert (=> b!255773 (= res!125160 (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6662 lt!128357)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255773 (=> (not res!125160) (not e!165782))))

(declare-fun d!61679 () Bool)

(assert (=> d!61679 e!165783))

(declare-fun c!43205 () Bool)

(assert (=> d!61679 (= c!43205 ((_ is MissingZero!1123) lt!128357))))

(assert (=> d!61679 (= lt!128357 (seekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(declare-fun lt!128358 () Unit!7896)

(declare-fun choose!1229 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7896)

(assert (=> d!61679 (= lt!128358 (choose!1229 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61679 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61679 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)) lt!128358)))

(declare-fun b!255774 () Bool)

(assert (=> b!255774 (= e!165780 ((_ is Undefined!1123) lt!128357))))

(declare-fun bm!24177 () Bool)

(assert (=> bm!24177 (= call!24180 (inRange!0 (ite c!43205 (index!6662 lt!128357) (index!6665 lt!128357)) (mask!10972 thiss!1504)))))

(assert (= (and d!61679 c!43205) b!255769))

(assert (= (and d!61679 (not c!43205)) b!255768))

(assert (= (and b!255769 res!125158) b!255773))

(assert (= (and b!255773 res!125160) b!255767))

(assert (= (and b!255768 c!43206) b!255772))

(assert (= (and b!255768 (not c!43206)) b!255774))

(assert (= (and b!255772 res!125157) b!255770))

(assert (= (and b!255770 res!125159) b!255771))

(assert (= (or b!255769 b!255772) bm!24177))

(assert (= (or b!255767 b!255771) bm!24176))

(assert (=> d!61679 m!271099))

(declare-fun m!271351 () Bool)

(assert (=> d!61679 m!271351))

(assert (=> d!61679 m!271213))

(declare-fun m!271353 () Bool)

(assert (=> bm!24177 m!271353))

(declare-fun m!271355 () Bool)

(assert (=> b!255770 m!271355))

(assert (=> bm!24176 m!271059))

(declare-fun m!271357 () Bool)

(assert (=> b!255773 m!271357))

(assert (=> b!255457 d!61679))

(declare-fun d!61681 () Bool)

(assert (=> d!61681 (= (inRange!0 index!297 (mask!10972 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10972 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255456 d!61681))

(declare-fun d!61683 () Bool)

(declare-fun e!165788 () Bool)

(assert (=> d!61683 e!165788))

(declare-fun res!125163 () Bool)

(assert (=> d!61683 (=> res!125163 e!165788)))

(declare-fun lt!128369 () Bool)

(assert (=> d!61683 (= res!125163 (not lt!128369))))

(declare-fun lt!128368 () Bool)

(assert (=> d!61683 (= lt!128369 lt!128368)))

(declare-fun lt!128367 () Unit!7896)

(declare-fun e!165789 () Unit!7896)

(assert (=> d!61683 (= lt!128367 e!165789)))

(declare-fun c!43209 () Bool)

(assert (=> d!61683 (= c!43209 lt!128368)))

(declare-fun containsKey!299 (List!3693 (_ BitVec 64)) Bool)

(assert (=> d!61683 (= lt!128368 (containsKey!299 (toList!1880 lt!128157) key!932))))

(assert (=> d!61683 (= (contains!1829 lt!128157 key!932) lt!128369)))

(declare-fun b!255781 () Bool)

(declare-fun lt!128370 () Unit!7896)

(assert (=> b!255781 (= e!165789 lt!128370)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!247 (List!3693 (_ BitVec 64)) Unit!7896)

(assert (=> b!255781 (= lt!128370 (lemmaContainsKeyImpliesGetValueByKeyDefined!247 (toList!1880 lt!128157) key!932))))

(declare-fun isDefined!248 (Option!314) Bool)

(assert (=> b!255781 (isDefined!248 (getValueByKey!308 (toList!1880 lt!128157) key!932))))

(declare-fun b!255782 () Bool)

(declare-fun Unit!7907 () Unit!7896)

(assert (=> b!255782 (= e!165789 Unit!7907)))

(declare-fun b!255783 () Bool)

(assert (=> b!255783 (= e!165788 (isDefined!248 (getValueByKey!308 (toList!1880 lt!128157) key!932)))))

(assert (= (and d!61683 c!43209) b!255781))

(assert (= (and d!61683 (not c!43209)) b!255782))

(assert (= (and d!61683 (not res!125163)) b!255783))

(declare-fun m!271359 () Bool)

(assert (=> d!61683 m!271359))

(declare-fun m!271361 () Bool)

(assert (=> b!255781 m!271361))

(declare-fun m!271363 () Bool)

(assert (=> b!255781 m!271363))

(assert (=> b!255781 m!271363))

(declare-fun m!271365 () Bool)

(assert (=> b!255781 m!271365))

(assert (=> b!255783 m!271363))

(assert (=> b!255783 m!271363))

(assert (=> b!255783 m!271365))

(assert (=> b!255456 d!61683))

(declare-fun b!255784 () Bool)

(declare-fun e!165794 () ListLongMap!3729)

(declare-fun call!24185 () ListLongMap!3729)

(assert (=> b!255784 (= e!165794 (+!678 call!24185 (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504))))))

(declare-fun b!255785 () Bool)

(declare-fun res!125169 () Bool)

(declare-fun e!165800 () Bool)

(assert (=> b!255785 (=> (not res!125169) (not e!165800))))

(declare-fun e!165802 () Bool)

(assert (=> b!255785 (= res!125169 e!165802)))

(declare-fun res!125164 () Bool)

(assert (=> b!255785 (=> res!125164 e!165802)))

(declare-fun e!165795 () Bool)

(assert (=> b!255785 (= res!125164 (not e!165795))))

(declare-fun res!125170 () Bool)

(assert (=> b!255785 (=> (not res!125170) (not e!165795))))

(assert (=> b!255785 (= res!125170 (bvslt #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255786 () Bool)

(declare-fun e!165799 () Bool)

(assert (=> b!255786 (= e!165802 e!165799)))

(declare-fun res!125172 () Bool)

(assert (=> b!255786 (=> (not res!125172) (not e!165799))))

(declare-fun lt!128391 () ListLongMap!3729)

(assert (=> b!255786 (= res!125172 (contains!1829 lt!128391 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!255786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun b!255787 () Bool)

(declare-fun e!165801 () Bool)

(declare-fun call!24187 () Bool)

(assert (=> b!255787 (= e!165801 (not call!24187))))

(declare-fun b!255788 () Bool)

(declare-fun e!165791 () ListLongMap!3729)

(assert (=> b!255788 (= e!165794 e!165791)))

(declare-fun c!43214 () Bool)

(assert (=> b!255788 (= c!43214 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24178 () Bool)

(declare-fun call!24184 () ListLongMap!3729)

(assert (=> bm!24178 (= call!24184 (getCurrentListMapNoExtraKeys!565 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun b!255789 () Bool)

(declare-fun e!165792 () ListLongMap!3729)

(declare-fun call!24186 () ListLongMap!3729)

(assert (=> b!255789 (= e!165792 call!24186)))

(declare-fun b!255790 () Bool)

(declare-fun e!165793 () Unit!7896)

(declare-fun lt!128380 () Unit!7896)

(assert (=> b!255790 (= e!165793 lt!128380)))

(declare-fun lt!128385 () ListLongMap!3729)

(assert (=> b!255790 (= lt!128385 (getCurrentListMapNoExtraKeys!565 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128392 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128373 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128373 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128371 () Unit!7896)

(assert (=> b!255790 (= lt!128371 (addStillContains!225 lt!128385 lt!128392 (zeroValue!4553 thiss!1504) lt!128373))))

(assert (=> b!255790 (contains!1829 (+!678 lt!128385 (tuple2!4815 lt!128392 (zeroValue!4553 thiss!1504))) lt!128373)))

(declare-fun lt!128374 () Unit!7896)

(assert (=> b!255790 (= lt!128374 lt!128371)))

(declare-fun lt!128379 () ListLongMap!3729)

(assert (=> b!255790 (= lt!128379 (getCurrentListMapNoExtraKeys!565 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128378 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128378 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128383 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128383 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128386 () Unit!7896)

(assert (=> b!255790 (= lt!128386 (addApplyDifferent!225 lt!128379 lt!128378 (minValue!4553 thiss!1504) lt!128383))))

(assert (=> b!255790 (= (apply!249 (+!678 lt!128379 (tuple2!4815 lt!128378 (minValue!4553 thiss!1504))) lt!128383) (apply!249 lt!128379 lt!128383))))

(declare-fun lt!128387 () Unit!7896)

(assert (=> b!255790 (= lt!128387 lt!128386)))

(declare-fun lt!128389 () ListLongMap!3729)

(assert (=> b!255790 (= lt!128389 (getCurrentListMapNoExtraKeys!565 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128376 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128381 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128381 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128382 () Unit!7896)

(assert (=> b!255790 (= lt!128382 (addApplyDifferent!225 lt!128389 lt!128376 (zeroValue!4553 thiss!1504) lt!128381))))

(assert (=> b!255790 (= (apply!249 (+!678 lt!128389 (tuple2!4815 lt!128376 (zeroValue!4553 thiss!1504))) lt!128381) (apply!249 lt!128389 lt!128381))))

(declare-fun lt!128384 () Unit!7896)

(assert (=> b!255790 (= lt!128384 lt!128382)))

(declare-fun lt!128390 () ListLongMap!3729)

(assert (=> b!255790 (= lt!128390 (getCurrentListMapNoExtraKeys!565 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)))))

(declare-fun lt!128388 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128388 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128377 () (_ BitVec 64))

(assert (=> b!255790 (= lt!128377 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255790 (= lt!128380 (addApplyDifferent!225 lt!128390 lt!128388 (minValue!4553 thiss!1504) lt!128377))))

(assert (=> b!255790 (= (apply!249 (+!678 lt!128390 (tuple2!4815 lt!128388 (minValue!4553 thiss!1504))) lt!128377) (apply!249 lt!128390 lt!128377))))

(declare-fun b!255791 () Bool)

(declare-fun Unit!7908 () Unit!7896)

(assert (=> b!255791 (= e!165793 Unit!7908)))

(declare-fun bm!24179 () Bool)

(assert (=> bm!24179 (= call!24187 (contains!1829 lt!128391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255792 () Bool)

(declare-fun e!165790 () Bool)

(assert (=> b!255792 (= e!165790 (= (apply!249 lt!128391 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4553 thiss!1504)))))

(declare-fun b!255793 () Bool)

(declare-fun e!165797 () Bool)

(assert (=> b!255793 (= e!165797 (= (apply!249 lt!128391 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4553 thiss!1504)))))

(declare-fun b!255794 () Bool)

(assert (=> b!255794 (= e!165801 e!165797)))

(declare-fun res!125171 () Bool)

(assert (=> b!255794 (= res!125171 call!24187)))

(assert (=> b!255794 (=> (not res!125171) (not e!165797))))

(declare-fun bm!24180 () Bool)

(declare-fun call!24181 () ListLongMap!3729)

(assert (=> bm!24180 (= call!24186 call!24181)))

(declare-fun b!255795 () Bool)

(declare-fun e!165796 () Bool)

(assert (=> b!255795 (= e!165796 e!165790)))

(declare-fun res!125166 () Bool)

(declare-fun call!24183 () Bool)

(assert (=> b!255795 (= res!125166 call!24183)))

(assert (=> b!255795 (=> (not res!125166) (not e!165790))))

(declare-fun bm!24181 () Bool)

(declare-fun c!43215 () Bool)

(assert (=> bm!24181 (= call!24185 (+!678 (ite c!43215 call!24184 (ite c!43214 call!24181 call!24186)) (ite (or c!43215 c!43214) (tuple2!4815 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4553 thiss!1504)) (tuple2!4815 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4553 thiss!1504)))))))

(declare-fun bm!24182 () Bool)

(assert (=> bm!24182 (= call!24181 call!24184)))

(declare-fun bm!24183 () Bool)

(declare-fun call!24182 () ListLongMap!3729)

(assert (=> bm!24183 (= call!24182 call!24185)))

(declare-fun b!255796 () Bool)

(assert (=> b!255796 (= e!165796 (not call!24183))))

(declare-fun b!255797 () Bool)

(assert (=> b!255797 (= e!165792 call!24182)))

(declare-fun b!255798 () Bool)

(assert (=> b!255798 (= e!165800 e!165801)))

(declare-fun c!43212 () Bool)

(assert (=> b!255798 (= c!43212 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!255799 () Bool)

(declare-fun res!125167 () Bool)

(assert (=> b!255799 (=> (not res!125167) (not e!165800))))

(assert (=> b!255799 (= res!125167 e!165796)))

(declare-fun c!43211 () Bool)

(assert (=> b!255799 (= c!43211 (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!255800 () Bool)

(declare-fun c!43213 () Bool)

(assert (=> b!255800 (= c!43213 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!255800 (= e!165791 e!165792)))

(declare-fun d!61685 () Bool)

(assert (=> d!61685 e!165800))

(declare-fun res!125168 () Bool)

(assert (=> d!61685 (=> (not res!125168) (not e!165800))))

(assert (=> d!61685 (= res!125168 (or (bvsge #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))))

(declare-fun lt!128372 () ListLongMap!3729)

(assert (=> d!61685 (= lt!128391 lt!128372)))

(declare-fun lt!128375 () Unit!7896)

(assert (=> d!61685 (= lt!128375 e!165793)))

(declare-fun c!43210 () Bool)

(declare-fun e!165798 () Bool)

(assert (=> d!61685 (= c!43210 e!165798)))

(declare-fun res!125165 () Bool)

(assert (=> d!61685 (=> (not res!125165) (not e!165798))))

(assert (=> d!61685 (= res!125165 (bvslt #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(assert (=> d!61685 (= lt!128372 e!165794)))

(assert (=> d!61685 (= c!43215 (and (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4449 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61685 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61685 (= (getCurrentListMap!1412 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4712 thiss!1504)) lt!128391)))

(declare-fun b!255801 () Bool)

(assert (=> b!255801 (= e!165799 (= (apply!249 lt!128391 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)) (get!3044 (select (arr!5905 (_values!4695 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4712 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!255801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6252 (_values!4695 thiss!1504))))))

(assert (=> b!255801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6253 (_keys!6870 thiss!1504))))))

(declare-fun bm!24184 () Bool)

(assert (=> bm!24184 (= call!24183 (contains!1829 lt!128391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255802 () Bool)

(assert (=> b!255802 (= e!165798 (validKeyInArray!0 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255803 () Bool)

(assert (=> b!255803 (= e!165795 (validKeyInArray!0 (select (arr!5906 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!255804 () Bool)

(assert (=> b!255804 (= e!165791 call!24182)))

(assert (= (and d!61685 c!43215) b!255784))

(assert (= (and d!61685 (not c!43215)) b!255788))

(assert (= (and b!255788 c!43214) b!255804))

(assert (= (and b!255788 (not c!43214)) b!255800))

(assert (= (and b!255800 c!43213) b!255797))

(assert (= (and b!255800 (not c!43213)) b!255789))

(assert (= (or b!255797 b!255789) bm!24180))

(assert (= (or b!255804 bm!24180) bm!24182))

(assert (= (or b!255804 b!255797) bm!24183))

(assert (= (or b!255784 bm!24182) bm!24178))

(assert (= (or b!255784 bm!24183) bm!24181))

(assert (= (and d!61685 res!125165) b!255802))

(assert (= (and d!61685 c!43210) b!255790))

(assert (= (and d!61685 (not c!43210)) b!255791))

(assert (= (and d!61685 res!125168) b!255785))

(assert (= (and b!255785 res!125170) b!255803))

(assert (= (and b!255785 (not res!125164)) b!255786))

(assert (= (and b!255786 res!125172) b!255801))

(assert (= (and b!255785 res!125169) b!255799))

(assert (= (and b!255799 c!43211) b!255795))

(assert (= (and b!255799 (not c!43211)) b!255796))

(assert (= (and b!255795 res!125166) b!255792))

(assert (= (or b!255795 b!255796) bm!24184))

(assert (= (and b!255799 res!125167) b!255798))

(assert (= (and b!255798 c!43212) b!255794))

(assert (= (and b!255798 (not c!43212)) b!255787))

(assert (= (and b!255794 res!125171) b!255793))

(assert (= (or b!255794 b!255787) bm!24179))

(declare-fun b_lambda!8171 () Bool)

(assert (=> (not b_lambda!8171) (not b!255801)))

(assert (=> b!255801 t!8741))

(declare-fun b_and!13775 () Bool)

(assert (= b_and!13773 (and (=> t!8741 result!5347) b_and!13775)))

(declare-fun m!271367 () Bool)

(assert (=> b!255784 m!271367))

(declare-fun m!271369 () Bool)

(assert (=> b!255793 m!271369))

(assert (=> b!255803 m!271235))

(assert (=> b!255803 m!271235))

(assert (=> b!255803 m!271275))

(assert (=> b!255786 m!271235))

(assert (=> b!255786 m!271235))

(declare-fun m!271371 () Bool)

(assert (=> b!255786 m!271371))

(declare-fun m!271373 () Bool)

(assert (=> bm!24184 m!271373))

(declare-fun m!271375 () Bool)

(assert (=> b!255790 m!271375))

(declare-fun m!271377 () Bool)

(assert (=> b!255790 m!271377))

(declare-fun m!271379 () Bool)

(assert (=> b!255790 m!271379))

(declare-fun m!271381 () Bool)

(assert (=> b!255790 m!271381))

(declare-fun m!271383 () Bool)

(assert (=> b!255790 m!271383))

(assert (=> b!255790 m!271235))

(declare-fun m!271385 () Bool)

(assert (=> b!255790 m!271385))

(declare-fun m!271387 () Bool)

(assert (=> b!255790 m!271387))

(declare-fun m!271389 () Bool)

(assert (=> b!255790 m!271389))

(assert (=> b!255790 m!271387))

(declare-fun m!271391 () Bool)

(assert (=> b!255790 m!271391))

(declare-fun m!271393 () Bool)

(assert (=> b!255790 m!271393))

(declare-fun m!271395 () Bool)

(assert (=> b!255790 m!271395))

(declare-fun m!271397 () Bool)

(assert (=> b!255790 m!271397))

(declare-fun m!271399 () Bool)

(assert (=> b!255790 m!271399))

(declare-fun m!271401 () Bool)

(assert (=> b!255790 m!271401))

(assert (=> b!255790 m!271381))

(declare-fun m!271403 () Bool)

(assert (=> b!255790 m!271403))

(assert (=> b!255790 m!271403))

(declare-fun m!271405 () Bool)

(assert (=> b!255790 m!271405))

(assert (=> b!255790 m!271399))

(declare-fun m!271407 () Bool)

(assert (=> b!255801 m!271407))

(assert (=> b!255801 m!271327))

(declare-fun m!271409 () Bool)

(assert (=> b!255801 m!271409))

(assert (=> b!255801 m!271407))

(assert (=> b!255801 m!271235))

(assert (=> b!255801 m!271327))

(assert (=> b!255801 m!271235))

(declare-fun m!271411 () Bool)

(assert (=> b!255801 m!271411))

(assert (=> bm!24178 m!271393))

(declare-fun m!271413 () Bool)

(assert (=> b!255792 m!271413))

(assert (=> d!61685 m!271213))

(declare-fun m!271415 () Bool)

(assert (=> bm!24181 m!271415))

(assert (=> b!255802 m!271235))

(assert (=> b!255802 m!271235))

(assert (=> b!255802 m!271275))

(declare-fun m!271417 () Bool)

(assert (=> bm!24179 m!271417))

(assert (=> b!255456 d!61685))

(declare-fun d!61687 () Bool)

(assert (=> d!61687 (= (inRange!0 (ite c!43132 (index!6662 lt!128164) (index!6665 lt!128164)) (mask!10972 thiss!1504)) (and (bvsge (ite c!43132 (index!6662 lt!128164) (index!6665 lt!128164)) #b00000000000000000000000000000000) (bvslt (ite c!43132 (index!6662 lt!128164) (index!6665 lt!128164)) (bvadd (mask!10972 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24127 d!61687))

(declare-fun d!61689 () Bool)

(assert (=> d!61689 (= (array_inv!3885 (_keys!6870 thiss!1504)) (bvsge (size!6253 (_keys!6870 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255454 d!61689))

(declare-fun d!61691 () Bool)

(assert (=> d!61691 (= (array_inv!3886 (_values!4695 thiss!1504)) (bvsge (size!6252 (_values!4695 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255454 d!61691))

(declare-fun d!61693 () Bool)

(declare-fun e!165805 () Bool)

(assert (=> d!61693 e!165805))

(declare-fun res!125177 () Bool)

(assert (=> d!61693 (=> (not res!125177) (not e!165805))))

(declare-fun lt!128398 () SeekEntryResult!1123)

(assert (=> d!61693 (= res!125177 ((_ is Found!1123) lt!128398))))

(assert (=> d!61693 (= lt!128398 (seekEntryOrOpen!0 key!932 (_keys!6870 thiss!1504) (mask!10972 thiss!1504)))))

(declare-fun lt!128397 () Unit!7896)

(declare-fun choose!1230 (array!12465 array!12463 (_ BitVec 32) (_ BitVec 32) V!8401 V!8401 (_ BitVec 64) Int) Unit!7896)

(assert (=> d!61693 (= lt!128397 (choose!1230 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)))))

(assert (=> d!61693 (validMask!0 (mask!10972 thiss!1504))))

(assert (=> d!61693 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!418 (_keys!6870 thiss!1504) (_values!4695 thiss!1504) (mask!10972 thiss!1504) (extraKeys!4449 thiss!1504) (zeroValue!4553 thiss!1504) (minValue!4553 thiss!1504) key!932 (defaultEntry!4712 thiss!1504)) lt!128397)))

(declare-fun b!255809 () Bool)

(declare-fun res!125178 () Bool)

(assert (=> b!255809 (=> (not res!125178) (not e!165805))))

(assert (=> b!255809 (= res!125178 (inRange!0 (index!6663 lt!128398) (mask!10972 thiss!1504)))))

(declare-fun b!255810 () Bool)

(assert (=> b!255810 (= e!165805 (= (select (arr!5906 (_keys!6870 thiss!1504)) (index!6663 lt!128398)) key!932))))

(assert (=> b!255810 (and (bvsge (index!6663 lt!128398) #b00000000000000000000000000000000) (bvslt (index!6663 lt!128398) (size!6253 (_keys!6870 thiss!1504))))))

(assert (= (and d!61693 res!125177) b!255809))

(assert (= (and b!255809 res!125178) b!255810))

(assert (=> d!61693 m!271099))

(declare-fun m!271419 () Bool)

(assert (=> d!61693 m!271419))

(assert (=> d!61693 m!271213))

(declare-fun m!271421 () Bool)

(assert (=> b!255809 m!271421))

(declare-fun m!271423 () Bool)

(assert (=> b!255810 m!271423))

(assert (=> b!255460 d!61693))

(declare-fun b!255817 () Bool)

(declare-fun e!165810 () Bool)

(assert (=> b!255817 (= e!165810 tp_is_empty!6565)))

(declare-fun mapNonEmpty!11178 () Bool)

(declare-fun mapRes!11178 () Bool)

(declare-fun tp!23418 () Bool)

(assert (=> mapNonEmpty!11178 (= mapRes!11178 (and tp!23418 e!165810))))

(declare-fun mapValue!11178 () ValueCell!2939)

(declare-fun mapKey!11178 () (_ BitVec 32))

(declare-fun mapRest!11178 () (Array (_ BitVec 32) ValueCell!2939))

(assert (=> mapNonEmpty!11178 (= mapRest!11169 (store mapRest!11178 mapKey!11178 mapValue!11178))))

(declare-fun b!255818 () Bool)

(declare-fun e!165811 () Bool)

(assert (=> b!255818 (= e!165811 tp_is_empty!6565)))

(declare-fun condMapEmpty!11178 () Bool)

(declare-fun mapDefault!11178 () ValueCell!2939)

(assert (=> mapNonEmpty!11169 (= condMapEmpty!11178 (= mapRest!11169 ((as const (Array (_ BitVec 32) ValueCell!2939)) mapDefault!11178)))))

(assert (=> mapNonEmpty!11169 (= tp!23403 (and e!165811 mapRes!11178))))

(declare-fun mapIsEmpty!11178 () Bool)

(assert (=> mapIsEmpty!11178 mapRes!11178))

(assert (= (and mapNonEmpty!11169 condMapEmpty!11178) mapIsEmpty!11178))

(assert (= (and mapNonEmpty!11169 (not condMapEmpty!11178)) mapNonEmpty!11178))

(assert (= (and mapNonEmpty!11178 ((_ is ValueCellFull!2939) mapValue!11178)) b!255817))

(assert (= (and mapNonEmpty!11169 ((_ is ValueCellFull!2939) mapDefault!11178)) b!255818))

(declare-fun m!271425 () Bool)

(assert (=> mapNonEmpty!11178 m!271425))

(declare-fun b_lambda!8173 () Bool)

(assert (= b_lambda!8171 (or (and b!255454 b_free!6703) b_lambda!8173)))

(declare-fun b_lambda!8175 () Bool)

(assert (= b_lambda!8169 (or (and b!255454 b_free!6703) b_lambda!8175)))

(check-sat (not bm!24181) (not b!255589) (not bm!24162) (not b!255781) (not b!255802) (not b!255656) (not bm!24179) (not b!255801) (not b!255745) (not bm!24176) (not bm!24184) (not b!255621) (not b!255803) (not b!255663) (not bm!24171) (not b!255790) (not bm!24147) (not b!255615) (not b!255644) (not d!61659) (not b!255725) (not mapNonEmpty!11178) (not bm!24177) (not b!255744) (not b!255783) (not bm!24168) (not b!255707) (not b!255809) (not b!255630) (not b!255716) (not d!61655) (not b!255793) (not d!61667) (not bm!24165) (not d!61671) (not b!255726) (not b!255591) (not d!61653) (not d!61673) (not bm!24178) (not bm!24146) (not d!61651) (not b!255750) (not d!61685) (not b!255604) (not b!255786) (not b!255660) (not b!255715) (not b_lambda!8175) (not d!61661) (not d!61679) (not d!61677) (not b!255732) (not b!255713) tp_is_empty!6565 (not b!255784) (not b!255746) (not bm!24163) (not d!61683) (not b!255792) (not b!255631) b_and!13775 (not b_next!6703) (not d!61693) (not b_lambda!8173) (not b!255643) (not b!255620) (not b!255724) (not bm!24143) (not b!255709) (not b!255633) (not b!255590))
(check-sat b_and!13775 (not b_next!6703))
