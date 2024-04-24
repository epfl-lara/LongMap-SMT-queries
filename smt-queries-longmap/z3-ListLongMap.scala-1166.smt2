; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24764 () Bool)

(assert start!24764)

(declare-fun b!258803 () Bool)

(declare-fun b_free!6745 () Bool)

(declare-fun b_next!6745 () Bool)

(assert (=> b!258803 (= b_free!6745 (not b_next!6745))))

(declare-fun tp!23550 () Bool)

(declare-fun b_and!13847 () Bool)

(assert (=> b!258803 (= tp!23550 b_and!13847)))

(declare-fun mapIsEmpty!11254 () Bool)

(declare-fun mapRes!11254 () Bool)

(assert (=> mapIsEmpty!11254 mapRes!11254))

(declare-fun b!258801 () Bool)

(declare-fun e!167736 () Bool)

(declare-fun e!167734 () Bool)

(assert (=> b!258801 (= e!167736 e!167734)))

(declare-fun res!126541 () Bool)

(assert (=> b!258801 (=> (not res!126541) (not e!167734))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8457 0))(
  ( (V!8458 (val!3348 Int)) )
))
(declare-datatypes ((ValueCell!2960 0))(
  ( (ValueCellFull!2960 (v!5453 V!8457)) (EmptyCell!2960) )
))
(declare-datatypes ((array!12561 0))(
  ( (array!12562 (arr!5947 (Array (_ BitVec 32) ValueCell!2960)) (size!6295 (_ BitVec 32))) )
))
(declare-datatypes ((array!12563 0))(
  ( (array!12564 (arr!5948 (Array (_ BitVec 32) (_ BitVec 64))) (size!6296 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3820 0))(
  ( (LongMapFixedSize!3821 (defaultEntry!4773 Int) (mask!11081 (_ BitVec 32)) (extraKeys!4510 (_ BitVec 32)) (zeroValue!4614 V!8457) (minValue!4614 V!8457) (_size!1959 (_ BitVec 32)) (_keys!6947 array!12563) (_values!4756 array!12561) (_vacant!1959 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3820)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258801 (= res!126541 (inRange!0 index!297 (mask!11081 thiss!1504)))))

(declare-datatypes ((Unit!8017 0))(
  ( (Unit!8018) )
))
(declare-fun lt!130346 () Unit!8017)

(declare-fun e!167739 () Unit!8017)

(assert (=> b!258801 (= lt!130346 e!167739)))

(declare-fun c!43884 () Bool)

(declare-datatypes ((tuple2!4848 0))(
  ( (tuple2!4849 (_1!2435 (_ BitVec 64)) (_2!2435 V!8457)) )
))
(declare-datatypes ((List!3726 0))(
  ( (Nil!3723) (Cons!3722 (h!4385 tuple2!4848) (t!8783 List!3726)) )
))
(declare-datatypes ((ListLongMap!3763 0))(
  ( (ListLongMap!3764 (toList!1897 List!3726)) )
))
(declare-fun lt!130348 () ListLongMap!3763)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1858 (ListLongMap!3763 (_ BitVec 64)) Bool)

(assert (=> b!258801 (= c!43884 (contains!1858 lt!130348 key!932))))

(declare-fun getCurrentListMap!1429 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) Int) ListLongMap!3763)

(assert (=> b!258801 (= lt!130348 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!258802 () Bool)

(declare-fun e!167746 () Unit!8017)

(declare-fun Unit!8019 () Unit!8017)

(assert (=> b!258802 (= e!167746 Unit!8019)))

(declare-fun lt!130339 () Unit!8017)

(declare-fun lemmaArrayContainsKeyThenInListMap!252 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) (_ BitVec 32) Int) Unit!8017)

(assert (=> b!258802 (= lt!130339 (lemmaArrayContainsKeyThenInListMap!252 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258802 false))

(declare-fun e!167743 () Bool)

(declare-fun tp_is_empty!6607 () Bool)

(declare-fun e!167744 () Bool)

(declare-fun array_inv!3917 (array!12563) Bool)

(declare-fun array_inv!3918 (array!12561) Bool)

(assert (=> b!258803 (= e!167743 (and tp!23550 tp_is_empty!6607 (array_inv!3917 (_keys!6947 thiss!1504)) (array_inv!3918 (_values!4756 thiss!1504)) e!167744))))

(declare-fun b!258804 () Bool)

(declare-fun res!126543 () Bool)

(declare-datatypes ((SeekEntryResult!1144 0))(
  ( (MissingZero!1144 (index!6746 (_ BitVec 32))) (Found!1144 (index!6747 (_ BitVec 32))) (Intermediate!1144 (undefined!1956 Bool) (index!6748 (_ BitVec 32)) (x!25038 (_ BitVec 32))) (Undefined!1144) (MissingVacant!1144 (index!6749 (_ BitVec 32))) )
))
(declare-fun lt!130342 () SeekEntryResult!1144)

(assert (=> b!258804 (= res!126543 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6749 lt!130342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167733 () Bool)

(assert (=> b!258804 (=> (not res!126543) (not e!167733))))

(declare-fun b!258805 () Bool)

(declare-fun lt!130345 () Unit!8017)

(assert (=> b!258805 (= e!167739 lt!130345)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!426 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8017)

(assert (=> b!258805 (= lt!130345 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!426 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(declare-fun c!43886 () Bool)

(get-info :version)

(assert (=> b!258805 (= c!43886 ((_ is MissingZero!1144) lt!130342))))

(declare-fun e!167738 () Bool)

(assert (=> b!258805 e!167738))

(declare-fun b!258806 () Bool)

(declare-fun e!167745 () Bool)

(assert (=> b!258806 (= e!167745 tp_is_empty!6607)))

(declare-fun b!258807 () Bool)

(assert (=> b!258807 (= e!167744 (and e!167745 mapRes!11254))))

(declare-fun condMapEmpty!11254 () Bool)

(declare-fun mapDefault!11254 () ValueCell!2960)

(assert (=> b!258807 (= condMapEmpty!11254 (= (arr!5947 (_values!4756 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11254)))))

(declare-fun mapNonEmpty!11254 () Bool)

(declare-fun tp!23551 () Bool)

(declare-fun e!167742 () Bool)

(assert (=> mapNonEmpty!11254 (= mapRes!11254 (and tp!23551 e!167742))))

(declare-fun mapRest!11254 () (Array (_ BitVec 32) ValueCell!2960))

(declare-fun mapKey!11254 () (_ BitVec 32))

(declare-fun mapValue!11254 () ValueCell!2960)

(assert (=> mapNonEmpty!11254 (= (arr!5947 (_values!4756 thiss!1504)) (store mapRest!11254 mapKey!11254 mapValue!11254))))

(declare-fun b!258808 () Bool)

(declare-fun res!126544 () Bool)

(declare-fun e!167735 () Bool)

(assert (=> b!258808 (=> (not res!126544) (not e!167735))))

(assert (=> b!258808 (= res!126544 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6746 lt!130342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258809 () Bool)

(declare-fun e!167740 () Bool)

(assert (=> b!258809 (= e!167740 (or (not (= (size!6295 (_values!4756 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11081 thiss!1504)))) (= (size!6296 (_keys!6947 thiss!1504)) (size!6295 (_values!4756 thiss!1504)))))))

(declare-fun res!126545 () Bool)

(declare-fun e!167737 () Bool)

(assert (=> start!24764 (=> (not res!126545) (not e!167737))))

(declare-fun valid!1499 (LongMapFixedSize!3820) Bool)

(assert (=> start!24764 (= res!126545 (valid!1499 thiss!1504))))

(assert (=> start!24764 e!167737))

(assert (=> start!24764 e!167743))

(assert (=> start!24764 true))

(assert (=> start!24764 tp_is_empty!6607))

(declare-fun b!258810 () Bool)

(assert (=> b!258810 (= e!167742 tp_is_empty!6607)))

(declare-fun b!258811 () Bool)

(assert (=> b!258811 (= e!167734 (not e!167740))))

(declare-fun res!126548 () Bool)

(assert (=> b!258811 (=> res!126548 e!167740)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258811 (= res!126548 (not (validMask!0 (mask!11081 thiss!1504))))))

(declare-fun lt!130349 () array!12563)

(declare-fun arrayCountValidKeys!0 (array!12563 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258811 (= (arrayCountValidKeys!0 lt!130349 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130351 () Unit!8017)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12563 (_ BitVec 32)) Unit!8017)

(assert (=> b!258811 (= lt!130351 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130349 index!297))))

(declare-fun arrayContainsKey!0 (array!12563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!258811 (arrayContainsKey!0 lt!130349 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130350 () Unit!8017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12563 (_ BitVec 64) (_ BitVec 32)) Unit!8017)

(assert (=> b!258811 (= lt!130350 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130349 key!932 index!297))))

(declare-fun v!346 () V!8457)

(declare-fun +!694 (ListLongMap!3763 tuple2!4848) ListLongMap!3763)

(assert (=> b!258811 (= (+!694 lt!130348 (tuple2!4849 key!932 v!346)) (getCurrentListMap!1429 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130340 () Unit!8017)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!109 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) (_ BitVec 64) V!8457 Int) Unit!8017)

(assert (=> b!258811 (= lt!130340 (lemmaAddValidKeyToArrayThenAddPairToListMap!109 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12563 (_ BitVec 32)) Bool)

(assert (=> b!258811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130349 (mask!11081 thiss!1504))))

(declare-fun lt!130343 () Unit!8017)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12563 (_ BitVec 32) (_ BitVec 32)) Unit!8017)

(assert (=> b!258811 (= lt!130343 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) index!297 (mask!11081 thiss!1504)))))

(assert (=> b!258811 (= (arrayCountValidKeys!0 lt!130349 #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504)))))))

(declare-fun lt!130347 () Unit!8017)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12563 (_ BitVec 32) (_ BitVec 64)) Unit!8017)

(assert (=> b!258811 (= lt!130347 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6947 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3727 0))(
  ( (Nil!3724) (Cons!3723 (h!4386 (_ BitVec 64)) (t!8784 List!3727)) )
))
(declare-fun arrayNoDuplicates!0 (array!12563 (_ BitVec 32) List!3727) Bool)

(assert (=> b!258811 (arrayNoDuplicates!0 lt!130349 #b00000000000000000000000000000000 Nil!3724)))

(assert (=> b!258811 (= lt!130349 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun lt!130341 () Unit!8017)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3727) Unit!8017)

(assert (=> b!258811 (= lt!130341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6947 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3724))))

(declare-fun lt!130352 () Unit!8017)

(assert (=> b!258811 (= lt!130352 e!167746)))

(declare-fun c!43885 () Bool)

(assert (=> b!258811 (= c!43885 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258812 () Bool)

(declare-fun res!126542 () Bool)

(assert (=> b!258812 (=> (not res!126542) (not e!167735))))

(declare-fun call!24605 () Bool)

(assert (=> b!258812 (= res!126542 call!24605)))

(assert (=> b!258812 (= e!167738 e!167735)))

(declare-fun bm!24601 () Bool)

(declare-fun call!24604 () Bool)

(assert (=> bm!24601 (= call!24604 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258813 () Bool)

(declare-fun res!126540 () Bool)

(assert (=> b!258813 (=> (not res!126540) (not e!167737))))

(assert (=> b!258813 (= res!126540 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258814 () Bool)

(assert (=> b!258814 (= e!167735 (not call!24604))))

(declare-fun b!258815 () Bool)

(assert (=> b!258815 (= e!167733 (not call!24604))))

(declare-fun b!258816 () Bool)

(declare-fun e!167741 () Bool)

(assert (=> b!258816 (= e!167741 e!167733)))

(declare-fun res!126546 () Bool)

(assert (=> b!258816 (= res!126546 call!24605)))

(assert (=> b!258816 (=> (not res!126546) (not e!167733))))

(declare-fun b!258817 () Bool)

(declare-fun Unit!8020 () Unit!8017)

(assert (=> b!258817 (= e!167746 Unit!8020)))

(declare-fun bm!24602 () Bool)

(assert (=> bm!24602 (= call!24605 (inRange!0 (ite c!43886 (index!6746 lt!130342) (index!6749 lt!130342)) (mask!11081 thiss!1504)))))

(declare-fun b!258818 () Bool)

(assert (=> b!258818 (= e!167737 e!167736)))

(declare-fun res!126547 () Bool)

(assert (=> b!258818 (=> (not res!126547) (not e!167736))))

(assert (=> b!258818 (= res!126547 (or (= lt!130342 (MissingZero!1144 index!297)) (= lt!130342 (MissingVacant!1144 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12563 (_ BitVec 32)) SeekEntryResult!1144)

(assert (=> b!258818 (= lt!130342 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!258819 () Bool)

(declare-fun Unit!8021 () Unit!8017)

(assert (=> b!258819 (= e!167739 Unit!8021)))

(declare-fun lt!130344 () Unit!8017)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8017)

(assert (=> b!258819 (= lt!130344 (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258819 false))

(declare-fun b!258820 () Bool)

(assert (=> b!258820 (= e!167741 ((_ is Undefined!1144) lt!130342))))

(declare-fun b!258821 () Bool)

(declare-fun c!43883 () Bool)

(assert (=> b!258821 (= c!43883 ((_ is MissingVacant!1144) lt!130342))))

(assert (=> b!258821 (= e!167738 e!167741)))

(assert (= (and start!24764 res!126545) b!258813))

(assert (= (and b!258813 res!126540) b!258818))

(assert (= (and b!258818 res!126547) b!258801))

(assert (= (and b!258801 c!43884) b!258819))

(assert (= (and b!258801 (not c!43884)) b!258805))

(assert (= (and b!258805 c!43886) b!258812))

(assert (= (and b!258805 (not c!43886)) b!258821))

(assert (= (and b!258812 res!126542) b!258808))

(assert (= (and b!258808 res!126544) b!258814))

(assert (= (and b!258821 c!43883) b!258816))

(assert (= (and b!258821 (not c!43883)) b!258820))

(assert (= (and b!258816 res!126546) b!258804))

(assert (= (and b!258804 res!126543) b!258815))

(assert (= (or b!258812 b!258816) bm!24602))

(assert (= (or b!258814 b!258815) bm!24601))

(assert (= (and b!258801 res!126541) b!258811))

(assert (= (and b!258811 c!43885) b!258802))

(assert (= (and b!258811 (not c!43885)) b!258817))

(assert (= (and b!258811 (not res!126548)) b!258809))

(assert (= (and b!258807 condMapEmpty!11254) mapIsEmpty!11254))

(assert (= (and b!258807 (not condMapEmpty!11254)) mapNonEmpty!11254))

(assert (= (and mapNonEmpty!11254 ((_ is ValueCellFull!2960) mapValue!11254)) b!258810))

(assert (= (and b!258807 ((_ is ValueCellFull!2960) mapDefault!11254)) b!258806))

(assert (= b!258803 b!258807))

(assert (= start!24764 b!258803))

(declare-fun m!274439 () Bool)

(assert (=> b!258818 m!274439))

(declare-fun m!274441 () Bool)

(assert (=> b!258804 m!274441))

(declare-fun m!274443 () Bool)

(assert (=> bm!24601 m!274443))

(declare-fun m!274445 () Bool)

(assert (=> b!258811 m!274445))

(assert (=> b!258811 m!274443))

(declare-fun m!274447 () Bool)

(assert (=> b!258811 m!274447))

(declare-fun m!274449 () Bool)

(assert (=> b!258811 m!274449))

(declare-fun m!274451 () Bool)

(assert (=> b!258811 m!274451))

(declare-fun m!274453 () Bool)

(assert (=> b!258811 m!274453))

(declare-fun m!274455 () Bool)

(assert (=> b!258811 m!274455))

(declare-fun m!274457 () Bool)

(assert (=> b!258811 m!274457))

(declare-fun m!274459 () Bool)

(assert (=> b!258811 m!274459))

(declare-fun m!274461 () Bool)

(assert (=> b!258811 m!274461))

(declare-fun m!274463 () Bool)

(assert (=> b!258811 m!274463))

(declare-fun m!274465 () Bool)

(assert (=> b!258811 m!274465))

(declare-fun m!274467 () Bool)

(assert (=> b!258811 m!274467))

(declare-fun m!274469 () Bool)

(assert (=> b!258811 m!274469))

(declare-fun m!274471 () Bool)

(assert (=> b!258811 m!274471))

(declare-fun m!274473 () Bool)

(assert (=> b!258811 m!274473))

(declare-fun m!274475 () Bool)

(assert (=> b!258811 m!274475))

(declare-fun m!274477 () Bool)

(assert (=> b!258811 m!274477))

(declare-fun m!274479 () Bool)

(assert (=> b!258803 m!274479))

(declare-fun m!274481 () Bool)

(assert (=> b!258803 m!274481))

(declare-fun m!274483 () Bool)

(assert (=> mapNonEmpty!11254 m!274483))

(declare-fun m!274485 () Bool)

(assert (=> bm!24602 m!274485))

(declare-fun m!274487 () Bool)

(assert (=> b!258801 m!274487))

(declare-fun m!274489 () Bool)

(assert (=> b!258801 m!274489))

(declare-fun m!274491 () Bool)

(assert (=> b!258801 m!274491))

(declare-fun m!274493 () Bool)

(assert (=> b!258805 m!274493))

(declare-fun m!274495 () Bool)

(assert (=> b!258808 m!274495))

(declare-fun m!274497 () Bool)

(assert (=> b!258802 m!274497))

(declare-fun m!274499 () Bool)

(assert (=> start!24764 m!274499))

(declare-fun m!274501 () Bool)

(assert (=> b!258819 m!274501))

(check-sat (not b!258819) (not bm!24602) (not start!24764) b_and!13847 (not b!258805) (not b!258811) (not b!258802) (not b!258803) (not mapNonEmpty!11254) (not b_next!6745) (not b!258818) (not b!258801) (not bm!24601) tp_is_empty!6607)
(check-sat b_and!13847 (not b_next!6745))
(get-model)

(declare-fun d!62209 () Bool)

(declare-fun e!167840 () Bool)

(assert (=> d!62209 e!167840))

(declare-fun res!126607 () Bool)

(assert (=> d!62209 (=> (not res!126607) (not e!167840))))

(declare-fun lt!130441 () SeekEntryResult!1144)

(assert (=> d!62209 (= res!126607 ((_ is Found!1144) lt!130441))))

(assert (=> d!62209 (= lt!130441 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun lt!130442 () Unit!8017)

(declare-fun choose!1259 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8017)

(assert (=> d!62209 (= lt!130442 (choose!1259 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62209 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62209 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) lt!130442)))

(declare-fun b!258952 () Bool)

(declare-fun res!126608 () Bool)

(assert (=> b!258952 (=> (not res!126608) (not e!167840))))

(assert (=> b!258952 (= res!126608 (inRange!0 (index!6747 lt!130441) (mask!11081 thiss!1504)))))

(declare-fun b!258953 () Bool)

(assert (=> b!258953 (= e!167840 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6747 lt!130441)) key!932))))

(assert (=> b!258953 (and (bvsge (index!6747 lt!130441) #b00000000000000000000000000000000) (bvslt (index!6747 lt!130441) (size!6296 (_keys!6947 thiss!1504))))))

(assert (= (and d!62209 res!126607) b!258952))

(assert (= (and b!258952 res!126608) b!258953))

(assert (=> d!62209 m!274439))

(declare-fun m!274631 () Bool)

(assert (=> d!62209 m!274631))

(assert (=> d!62209 m!274445))

(declare-fun m!274633 () Bool)

(assert (=> b!258952 m!274633))

(declare-fun m!274635 () Bool)

(assert (=> b!258953 m!274635))

(assert (=> b!258819 d!62209))

(declare-fun lt!130450 () SeekEntryResult!1144)

(declare-fun b!258966 () Bool)

(declare-fun e!167849 () SeekEntryResult!1144)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12563 (_ BitVec 32)) SeekEntryResult!1144)

(assert (=> b!258966 (= e!167849 (seekKeyOrZeroReturnVacant!0 (x!25038 lt!130450) (index!6748 lt!130450) (index!6748 lt!130450) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!258967 () Bool)

(declare-fun c!43918 () Bool)

(declare-fun lt!130449 () (_ BitVec 64))

(assert (=> b!258967 (= c!43918 (= lt!130449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167848 () SeekEntryResult!1144)

(assert (=> b!258967 (= e!167848 e!167849)))

(declare-fun b!258968 () Bool)

(assert (=> b!258968 (= e!167849 (MissingZero!1144 (index!6748 lt!130450)))))

(declare-fun b!258969 () Bool)

(declare-fun e!167847 () SeekEntryResult!1144)

(assert (=> b!258969 (= e!167847 e!167848)))

(assert (=> b!258969 (= lt!130449 (select (arr!5948 (_keys!6947 thiss!1504)) (index!6748 lt!130450)))))

(declare-fun c!43917 () Bool)

(assert (=> b!258969 (= c!43917 (= lt!130449 key!932))))

(declare-fun d!62211 () Bool)

(declare-fun lt!130451 () SeekEntryResult!1144)

(assert (=> d!62211 (and (or ((_ is Undefined!1144) lt!130451) (not ((_ is Found!1144) lt!130451)) (and (bvsge (index!6747 lt!130451) #b00000000000000000000000000000000) (bvslt (index!6747 lt!130451) (size!6296 (_keys!6947 thiss!1504))))) (or ((_ is Undefined!1144) lt!130451) ((_ is Found!1144) lt!130451) (not ((_ is MissingZero!1144) lt!130451)) (and (bvsge (index!6746 lt!130451) #b00000000000000000000000000000000) (bvslt (index!6746 lt!130451) (size!6296 (_keys!6947 thiss!1504))))) (or ((_ is Undefined!1144) lt!130451) ((_ is Found!1144) lt!130451) ((_ is MissingZero!1144) lt!130451) (not ((_ is MissingVacant!1144) lt!130451)) (and (bvsge (index!6749 lt!130451) #b00000000000000000000000000000000) (bvslt (index!6749 lt!130451) (size!6296 (_keys!6947 thiss!1504))))) (or ((_ is Undefined!1144) lt!130451) (ite ((_ is Found!1144) lt!130451) (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6747 lt!130451)) key!932) (ite ((_ is MissingZero!1144) lt!130451) (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6746 lt!130451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1144) lt!130451) (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6749 lt!130451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62211 (= lt!130451 e!167847)))

(declare-fun c!43919 () Bool)

(assert (=> d!62211 (= c!43919 (and ((_ is Intermediate!1144) lt!130450) (undefined!1956 lt!130450)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12563 (_ BitVec 32)) SeekEntryResult!1144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62211 (= lt!130450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11081 thiss!1504)) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(assert (=> d!62211 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62211 (= (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)) lt!130451)))

(declare-fun b!258970 () Bool)

(assert (=> b!258970 (= e!167848 (Found!1144 (index!6748 lt!130450)))))

(declare-fun b!258971 () Bool)

(assert (=> b!258971 (= e!167847 Undefined!1144)))

(assert (= (and d!62211 c!43919) b!258971))

(assert (= (and d!62211 (not c!43919)) b!258969))

(assert (= (and b!258969 c!43917) b!258970))

(assert (= (and b!258969 (not c!43917)) b!258967))

(assert (= (and b!258967 c!43918) b!258968))

(assert (= (and b!258967 (not c!43918)) b!258966))

(declare-fun m!274637 () Bool)

(assert (=> b!258966 m!274637))

(declare-fun m!274639 () Bool)

(assert (=> b!258969 m!274639))

(declare-fun m!274641 () Bool)

(assert (=> d!62211 m!274641))

(declare-fun m!274643 () Bool)

(assert (=> d!62211 m!274643))

(assert (=> d!62211 m!274641))

(declare-fun m!274645 () Bool)

(assert (=> d!62211 m!274645))

(declare-fun m!274647 () Bool)

(assert (=> d!62211 m!274647))

(assert (=> d!62211 m!274445))

(declare-fun m!274649 () Bool)

(assert (=> d!62211 m!274649))

(assert (=> b!258818 d!62211))

(declare-fun b!258988 () Bool)

(declare-fun e!167859 () Bool)

(declare-fun e!167860 () Bool)

(assert (=> b!258988 (= e!167859 e!167860)))

(declare-fun res!126618 () Bool)

(declare-fun call!24622 () Bool)

(assert (=> b!258988 (= res!126618 call!24622)))

(assert (=> b!258988 (=> (not res!126618) (not e!167860))))

(declare-fun b!258989 () Bool)

(declare-fun res!126620 () Bool)

(declare-fun e!167858 () Bool)

(assert (=> b!258989 (=> (not res!126620) (not e!167858))))

(declare-fun lt!130457 () SeekEntryResult!1144)

(assert (=> b!258989 (= res!126620 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6749 lt!130457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258989 (and (bvsge (index!6749 lt!130457) #b00000000000000000000000000000000) (bvslt (index!6749 lt!130457) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun b!258990 () Bool)

(declare-fun call!24623 () Bool)

(assert (=> b!258990 (= e!167860 (not call!24623))))

(declare-fun d!62213 () Bool)

(assert (=> d!62213 e!167859))

(declare-fun c!43924 () Bool)

(assert (=> d!62213 (= c!43924 ((_ is MissingZero!1144) lt!130457))))

(assert (=> d!62213 (= lt!130457 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun lt!130456 () Unit!8017)

(declare-fun choose!1260 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8017)

(assert (=> d!62213 (= lt!130456 (choose!1260 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62213 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62213 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!426 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) lt!130456)))

(declare-fun b!258991 () Bool)

(declare-fun e!167861 () Bool)

(assert (=> b!258991 (= e!167859 e!167861)))

(declare-fun c!43925 () Bool)

(assert (=> b!258991 (= c!43925 ((_ is MissingVacant!1144) lt!130457))))

(declare-fun bm!24619 () Bool)

(assert (=> bm!24619 (= call!24622 (inRange!0 (ite c!43924 (index!6746 lt!130457) (index!6749 lt!130457)) (mask!11081 thiss!1504)))))

(declare-fun b!258992 () Bool)

(assert (=> b!258992 (= e!167861 ((_ is Undefined!1144) lt!130457))))

(declare-fun bm!24620 () Bool)

(assert (=> bm!24620 (= call!24623 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258993 () Bool)

(assert (=> b!258993 (= e!167858 (not call!24623))))

(declare-fun b!258994 () Bool)

(declare-fun res!126617 () Bool)

(assert (=> b!258994 (=> (not res!126617) (not e!167858))))

(assert (=> b!258994 (= res!126617 call!24622)))

(assert (=> b!258994 (= e!167861 e!167858)))

(declare-fun b!258995 () Bool)

(assert (=> b!258995 (and (bvsge (index!6746 lt!130457) #b00000000000000000000000000000000) (bvslt (index!6746 lt!130457) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun res!126619 () Bool)

(assert (=> b!258995 (= res!126619 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6746 lt!130457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258995 (=> (not res!126619) (not e!167860))))

(assert (= (and d!62213 c!43924) b!258988))

(assert (= (and d!62213 (not c!43924)) b!258991))

(assert (= (and b!258988 res!126618) b!258995))

(assert (= (and b!258995 res!126619) b!258990))

(assert (= (and b!258991 c!43925) b!258994))

(assert (= (and b!258991 (not c!43925)) b!258992))

(assert (= (and b!258994 res!126617) b!258989))

(assert (= (and b!258989 res!126620) b!258993))

(assert (= (or b!258988 b!258994) bm!24619))

(assert (= (or b!258990 b!258993) bm!24620))

(declare-fun m!274651 () Bool)

(assert (=> bm!24619 m!274651))

(assert (=> d!62213 m!274439))

(declare-fun m!274653 () Bool)

(assert (=> d!62213 m!274653))

(assert (=> d!62213 m!274445))

(declare-fun m!274655 () Bool)

(assert (=> b!258995 m!274655))

(assert (=> bm!24620 m!274443))

(declare-fun m!274657 () Bool)

(assert (=> b!258989 m!274657))

(assert (=> b!258805 d!62213))

(declare-fun d!62215 () Bool)

(assert (=> d!62215 (contains!1858 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932)))

(declare-fun lt!130460 () Unit!8017)

(declare-fun choose!1261 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) (_ BitVec 32) Int) Unit!8017)

(assert (=> d!62215 (= lt!130460 (choose!1261 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62215 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62215 (= (lemmaArrayContainsKeyThenInListMap!252 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130460)))

(declare-fun bs!9143 () Bool)

(assert (= bs!9143 d!62215))

(assert (=> bs!9143 m!274491))

(assert (=> bs!9143 m!274491))

(declare-fun m!274659 () Bool)

(assert (=> bs!9143 m!274659))

(declare-fun m!274661 () Bool)

(assert (=> bs!9143 m!274661))

(assert (=> bs!9143 m!274445))

(assert (=> b!258802 d!62215))

(declare-fun d!62217 () Bool)

(assert (=> d!62217 (= (inRange!0 index!297 (mask!11081 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258801 d!62217))

(declare-fun d!62219 () Bool)

(declare-fun e!167866 () Bool)

(assert (=> d!62219 e!167866))

(declare-fun res!126623 () Bool)

(assert (=> d!62219 (=> res!126623 e!167866)))

(declare-fun lt!130470 () Bool)

(assert (=> d!62219 (= res!126623 (not lt!130470))))

(declare-fun lt!130469 () Bool)

(assert (=> d!62219 (= lt!130470 lt!130469)))

(declare-fun lt!130472 () Unit!8017)

(declare-fun e!167867 () Unit!8017)

(assert (=> d!62219 (= lt!130472 e!167867)))

(declare-fun c!43928 () Bool)

(assert (=> d!62219 (= c!43928 lt!130469)))

(declare-fun containsKey!306 (List!3726 (_ BitVec 64)) Bool)

(assert (=> d!62219 (= lt!130469 (containsKey!306 (toList!1897 lt!130348) key!932))))

(assert (=> d!62219 (= (contains!1858 lt!130348 key!932) lt!130470)))

(declare-fun b!259002 () Bool)

(declare-fun lt!130471 () Unit!8017)

(assert (=> b!259002 (= e!167867 lt!130471)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!254 (List!3726 (_ BitVec 64)) Unit!8017)

(assert (=> b!259002 (= lt!130471 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130348) key!932))))

(declare-datatypes ((Option!321 0))(
  ( (Some!320 (v!5458 V!8457)) (None!319) )
))
(declare-fun isDefined!255 (Option!321) Bool)

(declare-fun getValueByKey!315 (List!3726 (_ BitVec 64)) Option!321)

(assert (=> b!259002 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130348) key!932))))

(declare-fun b!259003 () Bool)

(declare-fun Unit!8030 () Unit!8017)

(assert (=> b!259003 (= e!167867 Unit!8030)))

(declare-fun b!259004 () Bool)

(assert (=> b!259004 (= e!167866 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130348) key!932)))))

(assert (= (and d!62219 c!43928) b!259002))

(assert (= (and d!62219 (not c!43928)) b!259003))

(assert (= (and d!62219 (not res!126623)) b!259004))

(declare-fun m!274663 () Bool)

(assert (=> d!62219 m!274663))

(declare-fun m!274665 () Bool)

(assert (=> b!259002 m!274665))

(declare-fun m!274667 () Bool)

(assert (=> b!259002 m!274667))

(assert (=> b!259002 m!274667))

(declare-fun m!274669 () Bool)

(assert (=> b!259002 m!274669))

(assert (=> b!259004 m!274667))

(assert (=> b!259004 m!274667))

(assert (=> b!259004 m!274669))

(assert (=> b!258801 d!62219))

(declare-fun b!259047 () Bool)

(declare-fun e!167899 () Bool)

(declare-fun e!167896 () Bool)

(assert (=> b!259047 (= e!167899 e!167896)))

(declare-fun res!126642 () Bool)

(declare-fun call!24641 () Bool)

(assert (=> b!259047 (= res!126642 call!24641)))

(assert (=> b!259047 (=> (not res!126642) (not e!167896))))

(declare-fun b!259048 () Bool)

(declare-fun e!167898 () Bool)

(assert (=> b!259048 (= e!167898 e!167899)))

(declare-fun c!43943 () Bool)

(assert (=> b!259048 (= c!43943 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259049 () Bool)

(declare-fun e!167902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!259049 (= e!167902 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259050 () Bool)

(declare-fun res!126648 () Bool)

(assert (=> b!259050 (=> (not res!126648) (not e!167898))))

(declare-fun e!167900 () Bool)

(assert (=> b!259050 (= res!126648 e!167900)))

(declare-fun c!43944 () Bool)

(assert (=> b!259050 (= c!43944 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259051 () Bool)

(declare-fun e!167894 () Bool)

(declare-fun lt!130536 () ListLongMap!3763)

(declare-fun apply!256 (ListLongMap!3763 (_ BitVec 64)) V!8457)

(assert (=> b!259051 (= e!167894 (= (apply!256 lt!130536 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!259052 () Bool)

(declare-fun e!167904 () ListLongMap!3763)

(declare-fun call!24639 () ListLongMap!3763)

(assert (=> b!259052 (= e!167904 call!24639)))

(declare-fun b!259053 () Bool)

(declare-fun call!24640 () Bool)

(assert (=> b!259053 (= e!167900 (not call!24640))))

(declare-fun b!259054 () Bool)

(assert (=> b!259054 (= e!167900 e!167894)))

(declare-fun res!126647 () Bool)

(assert (=> b!259054 (= res!126647 call!24640)))

(assert (=> b!259054 (=> (not res!126647) (not e!167894))))

(declare-fun bm!24635 () Bool)

(declare-fun call!24638 () ListLongMap!3763)

(assert (=> bm!24635 (= call!24639 call!24638)))

(declare-fun b!259055 () Bool)

(assert (=> b!259055 (= e!167896 (= (apply!256 lt!130536 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun c!43941 () Bool)

(declare-fun call!24644 () ListLongMap!3763)

(declare-fun c!43945 () Bool)

(declare-fun call!24642 () ListLongMap!3763)

(declare-fun bm!24636 () Bool)

(assert (=> bm!24636 (= call!24644 (+!694 (ite c!43945 call!24642 (ite c!43941 call!24638 call!24639)) (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun b!259056 () Bool)

(assert (=> b!259056 (= e!167899 (not call!24641))))

(declare-fun bm!24637 () Bool)

(declare-fun call!24643 () ListLongMap!3763)

(assert (=> bm!24637 (= call!24643 call!24644)))

(declare-fun b!259057 () Bool)

(declare-fun c!43946 () Bool)

(assert (=> b!259057 (= c!43946 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167906 () ListLongMap!3763)

(assert (=> b!259057 (= e!167906 e!167904)))

(declare-fun b!259058 () Bool)

(declare-fun res!126643 () Bool)

(assert (=> b!259058 (=> (not res!126643) (not e!167898))))

(declare-fun e!167905 () Bool)

(assert (=> b!259058 (= res!126643 e!167905)))

(declare-fun res!126650 () Bool)

(assert (=> b!259058 (=> res!126650 e!167905)))

(declare-fun e!167903 () Bool)

(assert (=> b!259058 (= res!126650 (not e!167903))))

(declare-fun res!126645 () Bool)

(assert (=> b!259058 (=> (not res!126645) (not e!167903))))

(assert (=> b!259058 (= res!126645 (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun bm!24638 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!572 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) Int) ListLongMap!3763)

(assert (=> bm!24638 (= call!24642 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259059 () Bool)

(declare-fun e!167897 () Unit!8017)

(declare-fun Unit!8031 () Unit!8017)

(assert (=> b!259059 (= e!167897 Unit!8031)))

(declare-fun b!259060 () Bool)

(assert (=> b!259060 (= e!167904 call!24643)))

(declare-fun b!259061 () Bool)

(assert (=> b!259061 (= e!167903 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259062 () Bool)

(assert (=> b!259062 (= e!167906 call!24643)))

(declare-fun b!259063 () Bool)

(declare-fun e!167901 () ListLongMap!3763)

(assert (=> b!259063 (= e!167901 (+!694 call!24644 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun bm!24639 () Bool)

(assert (=> bm!24639 (= call!24640 (contains!1858 lt!130536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259064 () Bool)

(declare-fun e!167895 () Bool)

(declare-fun get!3068 (ValueCell!2960 V!8457) V!8457)

(declare-fun dynLambda!599 (Int (_ BitVec 64)) V!8457)

(assert (=> b!259064 (= e!167895 (= (apply!256 lt!130536 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)) (get!3068 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6295 (_values!4756 thiss!1504))))))

(assert (=> b!259064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun b!259065 () Bool)

(assert (=> b!259065 (= e!167901 e!167906)))

(assert (=> b!259065 (= c!43941 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24640 () Bool)

(assert (=> bm!24640 (= call!24641 (contains!1858 lt!130536 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259066 () Bool)

(assert (=> b!259066 (= e!167905 e!167895)))

(declare-fun res!126646 () Bool)

(assert (=> b!259066 (=> (not res!126646) (not e!167895))))

(assert (=> b!259066 (= res!126646 (contains!1858 lt!130536 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun d!62221 () Bool)

(assert (=> d!62221 e!167898))

(declare-fun res!126649 () Bool)

(assert (=> d!62221 (=> (not res!126649) (not e!167898))))

(assert (=> d!62221 (= res!126649 (or (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))))

(declare-fun lt!130524 () ListLongMap!3763)

(assert (=> d!62221 (= lt!130536 lt!130524)))

(declare-fun lt!130526 () Unit!8017)

(assert (=> d!62221 (= lt!130526 e!167897)))

(declare-fun c!43942 () Bool)

(assert (=> d!62221 (= c!43942 e!167902)))

(declare-fun res!126644 () Bool)

(assert (=> d!62221 (=> (not res!126644) (not e!167902))))

(assert (=> d!62221 (= res!126644 (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62221 (= lt!130524 e!167901)))

(assert (=> d!62221 (= c!43945 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62221 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62221 (= (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130536)))

(declare-fun bm!24641 () Bool)

(assert (=> bm!24641 (= call!24638 call!24642)))

(declare-fun b!259067 () Bool)

(declare-fun lt!130531 () Unit!8017)

(assert (=> b!259067 (= e!167897 lt!130531)))

(declare-fun lt!130530 () ListLongMap!3763)

(assert (=> b!259067 (= lt!130530 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130525 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130519 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130519 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130532 () Unit!8017)

(declare-fun addStillContains!232 (ListLongMap!3763 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8017)

(assert (=> b!259067 (= lt!130532 (addStillContains!232 lt!130530 lt!130525 (zeroValue!4614 thiss!1504) lt!130519))))

(assert (=> b!259067 (contains!1858 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) lt!130519)))

(declare-fun lt!130521 () Unit!8017)

(assert (=> b!259067 (= lt!130521 lt!130532)))

(declare-fun lt!130518 () ListLongMap!3763)

(assert (=> b!259067 (= lt!130518 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130528 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130528 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130534 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130534 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130533 () Unit!8017)

(declare-fun addApplyDifferent!232 (ListLongMap!3763 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8017)

(assert (=> b!259067 (= lt!130533 (addApplyDifferent!232 lt!130518 lt!130528 (minValue!4614 thiss!1504) lt!130534))))

(assert (=> b!259067 (= (apply!256 (+!694 lt!130518 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) lt!130534) (apply!256 lt!130518 lt!130534))))

(declare-fun lt!130537 () Unit!8017)

(assert (=> b!259067 (= lt!130537 lt!130533)))

(declare-fun lt!130520 () ListLongMap!3763)

(assert (=> b!259067 (= lt!130520 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130522 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130538 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130538 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130517 () Unit!8017)

(assert (=> b!259067 (= lt!130517 (addApplyDifferent!232 lt!130520 lt!130522 (zeroValue!4614 thiss!1504) lt!130538))))

(assert (=> b!259067 (= (apply!256 (+!694 lt!130520 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) lt!130538) (apply!256 lt!130520 lt!130538))))

(declare-fun lt!130523 () Unit!8017)

(assert (=> b!259067 (= lt!130523 lt!130517)))

(declare-fun lt!130529 () ListLongMap!3763)

(assert (=> b!259067 (= lt!130529 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130527 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130527 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130535 () (_ BitVec 64))

(assert (=> b!259067 (= lt!130535 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259067 (= lt!130531 (addApplyDifferent!232 lt!130529 lt!130527 (minValue!4614 thiss!1504) lt!130535))))

(assert (=> b!259067 (= (apply!256 (+!694 lt!130529 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) lt!130535) (apply!256 lt!130529 lt!130535))))

(assert (= (and d!62221 c!43945) b!259063))

(assert (= (and d!62221 (not c!43945)) b!259065))

(assert (= (and b!259065 c!43941) b!259062))

(assert (= (and b!259065 (not c!43941)) b!259057))

(assert (= (and b!259057 c!43946) b!259060))

(assert (= (and b!259057 (not c!43946)) b!259052))

(assert (= (or b!259060 b!259052) bm!24635))

(assert (= (or b!259062 bm!24635) bm!24641))

(assert (= (or b!259062 b!259060) bm!24637))

(assert (= (or b!259063 bm!24641) bm!24638))

(assert (= (or b!259063 bm!24637) bm!24636))

(assert (= (and d!62221 res!126644) b!259049))

(assert (= (and d!62221 c!43942) b!259067))

(assert (= (and d!62221 (not c!43942)) b!259059))

(assert (= (and d!62221 res!126649) b!259058))

(assert (= (and b!259058 res!126645) b!259061))

(assert (= (and b!259058 (not res!126650)) b!259066))

(assert (= (and b!259066 res!126646) b!259064))

(assert (= (and b!259058 res!126643) b!259050))

(assert (= (and b!259050 c!43944) b!259054))

(assert (= (and b!259050 (not c!43944)) b!259053))

(assert (= (and b!259054 res!126647) b!259051))

(assert (= (or b!259054 b!259053) bm!24639))

(assert (= (and b!259050 res!126648) b!259048))

(assert (= (and b!259048 c!43943) b!259047))

(assert (= (and b!259048 (not c!43943)) b!259056))

(assert (= (and b!259047 res!126642) b!259055))

(assert (= (or b!259047 b!259056) bm!24640))

(declare-fun b_lambda!8245 () Bool)

(assert (=> (not b_lambda!8245) (not b!259064)))

(declare-fun t!8788 () Bool)

(declare-fun tb!3017 () Bool)

(assert (=> (and b!258803 (= (defaultEntry!4773 thiss!1504) (defaultEntry!4773 thiss!1504)) t!8788) tb!3017))

(declare-fun result!5389 () Bool)

(assert (=> tb!3017 (= result!5389 tp_is_empty!6607)))

(assert (=> b!259064 t!8788))

(declare-fun b_and!13853 () Bool)

(assert (= b_and!13847 (and (=> t!8788 result!5389) b_and!13853)))

(declare-fun m!274671 () Bool)

(assert (=> b!259049 m!274671))

(assert (=> b!259049 m!274671))

(declare-fun m!274673 () Bool)

(assert (=> b!259049 m!274673))

(declare-fun m!274675 () Bool)

(assert (=> b!259064 m!274675))

(declare-fun m!274677 () Bool)

(assert (=> b!259064 m!274677))

(assert (=> b!259064 m!274675))

(declare-fun m!274679 () Bool)

(assert (=> b!259064 m!274679))

(assert (=> b!259064 m!274671))

(declare-fun m!274681 () Bool)

(assert (=> b!259064 m!274681))

(assert (=> b!259064 m!274677))

(assert (=> b!259064 m!274671))

(declare-fun m!274683 () Bool)

(assert (=> bm!24640 m!274683))

(assert (=> b!259066 m!274671))

(assert (=> b!259066 m!274671))

(declare-fun m!274685 () Bool)

(assert (=> b!259066 m!274685))

(declare-fun m!274687 () Bool)

(assert (=> bm!24638 m!274687))

(assert (=> d!62221 m!274445))

(assert (=> b!259061 m!274671))

(assert (=> b!259061 m!274671))

(assert (=> b!259061 m!274673))

(declare-fun m!274689 () Bool)

(assert (=> b!259063 m!274689))

(declare-fun m!274691 () Bool)

(assert (=> b!259055 m!274691))

(declare-fun m!274693 () Bool)

(assert (=> bm!24639 m!274693))

(declare-fun m!274695 () Bool)

(assert (=> b!259067 m!274695))

(declare-fun m!274697 () Bool)

(assert (=> b!259067 m!274697))

(declare-fun m!274699 () Bool)

(assert (=> b!259067 m!274699))

(declare-fun m!274701 () Bool)

(assert (=> b!259067 m!274701))

(declare-fun m!274703 () Bool)

(assert (=> b!259067 m!274703))

(declare-fun m!274705 () Bool)

(assert (=> b!259067 m!274705))

(declare-fun m!274707 () Bool)

(assert (=> b!259067 m!274707))

(declare-fun m!274709 () Bool)

(assert (=> b!259067 m!274709))

(assert (=> b!259067 m!274671))

(declare-fun m!274711 () Bool)

(assert (=> b!259067 m!274711))

(declare-fun m!274713 () Bool)

(assert (=> b!259067 m!274713))

(declare-fun m!274715 () Bool)

(assert (=> b!259067 m!274715))

(declare-fun m!274717 () Bool)

(assert (=> b!259067 m!274717))

(assert (=> b!259067 m!274715))

(declare-fun m!274719 () Bool)

(assert (=> b!259067 m!274719))

(assert (=> b!259067 m!274711))

(declare-fun m!274721 () Bool)

(assert (=> b!259067 m!274721))

(declare-fun m!274723 () Bool)

(assert (=> b!259067 m!274723))

(assert (=> b!259067 m!274721))

(assert (=> b!259067 m!274687))

(assert (=> b!259067 m!274699))

(declare-fun m!274725 () Bool)

(assert (=> b!259051 m!274725))

(declare-fun m!274727 () Bool)

(assert (=> bm!24636 m!274727))

(assert (=> b!258801 d!62221))

(declare-fun d!62223 () Bool)

(declare-fun res!126658 () Bool)

(declare-fun e!167917 () Bool)

(assert (=> d!62223 (=> res!126658 e!167917)))

(assert (=> d!62223 (= res!126658 (bvsge #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(assert (=> d!62223 (= (arrayNoDuplicates!0 lt!130349 #b00000000000000000000000000000000 Nil!3724) e!167917)))

(declare-fun b!259080 () Bool)

(declare-fun e!167918 () Bool)

(declare-fun e!167915 () Bool)

(assert (=> b!259080 (= e!167918 e!167915)))

(declare-fun c!43949 () Bool)

(assert (=> b!259080 (= c!43949 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259081 () Bool)

(assert (=> b!259081 (= e!167917 e!167918)))

(declare-fun res!126659 () Bool)

(assert (=> b!259081 (=> (not res!126659) (not e!167918))))

(declare-fun e!167916 () Bool)

(assert (=> b!259081 (= res!126659 (not e!167916))))

(declare-fun res!126657 () Bool)

(assert (=> b!259081 (=> (not res!126657) (not e!167916))))

(assert (=> b!259081 (= res!126657 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259082 () Bool)

(declare-fun call!24647 () Bool)

(assert (=> b!259082 (= e!167915 call!24647)))

(declare-fun b!259083 () Bool)

(declare-fun contains!1860 (List!3727 (_ BitVec 64)) Bool)

(assert (=> b!259083 (= e!167916 (contains!1860 Nil!3724 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun bm!24644 () Bool)

(assert (=> bm!24644 (= call!24647 (arrayNoDuplicates!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43949 (Cons!3723 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) Nil!3724) Nil!3724)))))

(declare-fun b!259084 () Bool)

(assert (=> b!259084 (= e!167915 call!24647)))

(assert (= (and d!62223 (not res!126658)) b!259081))

(assert (= (and b!259081 res!126657) b!259083))

(assert (= (and b!259081 res!126659) b!259080))

(assert (= (and b!259080 c!43949) b!259084))

(assert (= (and b!259080 (not c!43949)) b!259082))

(assert (= (or b!259084 b!259082) bm!24644))

(declare-fun m!274729 () Bool)

(assert (=> b!259080 m!274729))

(assert (=> b!259080 m!274729))

(declare-fun m!274731 () Bool)

(assert (=> b!259080 m!274731))

(assert (=> b!259081 m!274729))

(assert (=> b!259081 m!274729))

(assert (=> b!259081 m!274731))

(assert (=> b!259083 m!274729))

(assert (=> b!259083 m!274729))

(declare-fun m!274733 () Bool)

(assert (=> b!259083 m!274733))

(assert (=> bm!24644 m!274729))

(declare-fun m!274735 () Bool)

(assert (=> bm!24644 m!274735))

(assert (=> b!258811 d!62223))

(declare-fun bm!24647 () Bool)

(declare-fun call!24650 () Bool)

(assert (=> bm!24647 (= call!24650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130349 (mask!11081 thiss!1504)))))

(declare-fun b!259093 () Bool)

(declare-fun e!167927 () Bool)

(declare-fun e!167926 () Bool)

(assert (=> b!259093 (= e!167927 e!167926)))

(declare-fun c!43952 () Bool)

(assert (=> b!259093 (= c!43952 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun d!62225 () Bool)

(declare-fun res!126664 () Bool)

(assert (=> d!62225 (=> res!126664 e!167927)))

(assert (=> d!62225 (= res!126664 (bvsge #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(assert (=> d!62225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130349 (mask!11081 thiss!1504)) e!167927)))

(declare-fun b!259094 () Bool)

(declare-fun e!167925 () Bool)

(assert (=> b!259094 (= e!167926 e!167925)))

(declare-fun lt!130546 () (_ BitVec 64))

(assert (=> b!259094 (= lt!130546 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(declare-fun lt!130545 () Unit!8017)

(assert (=> b!259094 (= lt!130545 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130349 lt!130546 #b00000000000000000000000000000000))))

(assert (=> b!259094 (arrayContainsKey!0 lt!130349 lt!130546 #b00000000000000000000000000000000)))

(declare-fun lt!130547 () Unit!8017)

(assert (=> b!259094 (= lt!130547 lt!130545)))

(declare-fun res!126665 () Bool)

(assert (=> b!259094 (= res!126665 (= (seekEntryOrOpen!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) lt!130349 (mask!11081 thiss!1504)) (Found!1144 #b00000000000000000000000000000000)))))

(assert (=> b!259094 (=> (not res!126665) (not e!167925))))

(declare-fun b!259095 () Bool)

(assert (=> b!259095 (= e!167926 call!24650)))

(declare-fun b!259096 () Bool)

(assert (=> b!259096 (= e!167925 call!24650)))

(assert (= (and d!62225 (not res!126664)) b!259093))

(assert (= (and b!259093 c!43952) b!259094))

(assert (= (and b!259093 (not c!43952)) b!259095))

(assert (= (and b!259094 res!126665) b!259096))

(assert (= (or b!259096 b!259095) bm!24647))

(declare-fun m!274737 () Bool)

(assert (=> bm!24647 m!274737))

(assert (=> b!259093 m!274729))

(assert (=> b!259093 m!274729))

(assert (=> b!259093 m!274731))

(assert (=> b!259094 m!274729))

(declare-fun m!274739 () Bool)

(assert (=> b!259094 m!274739))

(declare-fun m!274741 () Bool)

(assert (=> b!259094 m!274741))

(assert (=> b!259094 m!274729))

(declare-fun m!274743 () Bool)

(assert (=> b!259094 m!274743))

(assert (=> b!258811 d!62225))

(declare-fun d!62227 () Bool)

(assert (=> d!62227 (= (validMask!0 (mask!11081 thiss!1504)) (and (or (= (mask!11081 thiss!1504) #b00000000000000000000000000000111) (= (mask!11081 thiss!1504) #b00000000000000000000000000001111) (= (mask!11081 thiss!1504) #b00000000000000000000000000011111) (= (mask!11081 thiss!1504) #b00000000000000000000000000111111) (= (mask!11081 thiss!1504) #b00000000000000000000000001111111) (= (mask!11081 thiss!1504) #b00000000000000000000000011111111) (= (mask!11081 thiss!1504) #b00000000000000000000000111111111) (= (mask!11081 thiss!1504) #b00000000000000000000001111111111) (= (mask!11081 thiss!1504) #b00000000000000000000011111111111) (= (mask!11081 thiss!1504) #b00000000000000000000111111111111) (= (mask!11081 thiss!1504) #b00000000000000000001111111111111) (= (mask!11081 thiss!1504) #b00000000000000000011111111111111) (= (mask!11081 thiss!1504) #b00000000000000000111111111111111) (= (mask!11081 thiss!1504) #b00000000000000001111111111111111) (= (mask!11081 thiss!1504) #b00000000000000011111111111111111) (= (mask!11081 thiss!1504) #b00000000000000111111111111111111) (= (mask!11081 thiss!1504) #b00000000000001111111111111111111) (= (mask!11081 thiss!1504) #b00000000000011111111111111111111) (= (mask!11081 thiss!1504) #b00000000000111111111111111111111) (= (mask!11081 thiss!1504) #b00000000001111111111111111111111) (= (mask!11081 thiss!1504) #b00000000011111111111111111111111) (= (mask!11081 thiss!1504) #b00000000111111111111111111111111) (= (mask!11081 thiss!1504) #b00000001111111111111111111111111) (= (mask!11081 thiss!1504) #b00000011111111111111111111111111) (= (mask!11081 thiss!1504) #b00000111111111111111111111111111) (= (mask!11081 thiss!1504) #b00001111111111111111111111111111) (= (mask!11081 thiss!1504) #b00011111111111111111111111111111) (= (mask!11081 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11081 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!258811 d!62227))

(declare-fun b!259097 () Bool)

(declare-fun e!167933 () Bool)

(declare-fun e!167930 () Bool)

(assert (=> b!259097 (= e!167933 e!167930)))

(declare-fun res!126666 () Bool)

(declare-fun call!24654 () Bool)

(assert (=> b!259097 (= res!126666 call!24654)))

(assert (=> b!259097 (=> (not res!126666) (not e!167930))))

(declare-fun b!259098 () Bool)

(declare-fun e!167932 () Bool)

(assert (=> b!259098 (= e!167932 e!167933)))

(declare-fun c!43955 () Bool)

(assert (=> b!259098 (= c!43955 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259099 () Bool)

(declare-fun e!167936 () Bool)

(assert (=> b!259099 (= e!167936 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259100 () Bool)

(declare-fun res!126672 () Bool)

(assert (=> b!259100 (=> (not res!126672) (not e!167932))))

(declare-fun e!167934 () Bool)

(assert (=> b!259100 (= res!126672 e!167934)))

(declare-fun c!43956 () Bool)

(assert (=> b!259100 (= c!43956 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259101 () Bool)

(declare-fun e!167928 () Bool)

(declare-fun lt!130567 () ListLongMap!3763)

(assert (=> b!259101 (= e!167928 (= (apply!256 lt!130567 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!259102 () Bool)

(declare-fun e!167938 () ListLongMap!3763)

(declare-fun call!24652 () ListLongMap!3763)

(assert (=> b!259102 (= e!167938 call!24652)))

(declare-fun b!259103 () Bool)

(declare-fun call!24653 () Bool)

(assert (=> b!259103 (= e!167934 (not call!24653))))

(declare-fun b!259104 () Bool)

(assert (=> b!259104 (= e!167934 e!167928)))

(declare-fun res!126671 () Bool)

(assert (=> b!259104 (= res!126671 call!24653)))

(assert (=> b!259104 (=> (not res!126671) (not e!167928))))

(declare-fun bm!24648 () Bool)

(declare-fun call!24651 () ListLongMap!3763)

(assert (=> bm!24648 (= call!24652 call!24651)))

(declare-fun b!259105 () Bool)

(assert (=> b!259105 (= e!167930 (= (apply!256 lt!130567 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun c!43953 () Bool)

(declare-fun bm!24649 () Bool)

(declare-fun call!24655 () ListLongMap!3763)

(declare-fun c!43957 () Bool)

(declare-fun call!24657 () ListLongMap!3763)

(assert (=> bm!24649 (= call!24657 (+!694 (ite c!43957 call!24655 (ite c!43953 call!24651 call!24652)) (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun b!259106 () Bool)

(assert (=> b!259106 (= e!167933 (not call!24654))))

(declare-fun bm!24650 () Bool)

(declare-fun call!24656 () ListLongMap!3763)

(assert (=> bm!24650 (= call!24656 call!24657)))

(declare-fun b!259107 () Bool)

(declare-fun c!43958 () Bool)

(assert (=> b!259107 (= c!43958 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167940 () ListLongMap!3763)

(assert (=> b!259107 (= e!167940 e!167938)))

(declare-fun b!259108 () Bool)

(declare-fun res!126667 () Bool)

(assert (=> b!259108 (=> (not res!126667) (not e!167932))))

(declare-fun e!167939 () Bool)

(assert (=> b!259108 (= res!126667 e!167939)))

(declare-fun res!126674 () Bool)

(assert (=> b!259108 (=> res!126674 e!167939)))

(declare-fun e!167937 () Bool)

(assert (=> b!259108 (= res!126674 (not e!167937))))

(declare-fun res!126669 () Bool)

(assert (=> b!259108 (=> (not res!126669) (not e!167937))))

(assert (=> b!259108 (= res!126669 (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun bm!24651 () Bool)

(assert (=> bm!24651 (= call!24655 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259109 () Bool)

(declare-fun e!167931 () Unit!8017)

(declare-fun Unit!8032 () Unit!8017)

(assert (=> b!259109 (= e!167931 Unit!8032)))

(declare-fun b!259110 () Bool)

(assert (=> b!259110 (= e!167938 call!24656)))

(declare-fun b!259111 () Bool)

(assert (=> b!259111 (= e!167937 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259112 () Bool)

(assert (=> b!259112 (= e!167940 call!24656)))

(declare-fun b!259113 () Bool)

(declare-fun e!167935 () ListLongMap!3763)

(assert (=> b!259113 (= e!167935 (+!694 call!24657 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun bm!24652 () Bool)

(assert (=> bm!24652 (= call!24653 (contains!1858 lt!130567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259114 () Bool)

(declare-fun e!167929 () Bool)

(assert (=> b!259114 (= e!167929 (= (apply!256 lt!130567 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6295 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))))))))

(assert (=> b!259114 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun b!259115 () Bool)

(assert (=> b!259115 (= e!167935 e!167940)))

(assert (=> b!259115 (= c!43953 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24653 () Bool)

(assert (=> bm!24653 (= call!24654 (contains!1858 lt!130567 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259116 () Bool)

(assert (=> b!259116 (= e!167939 e!167929)))

(declare-fun res!126670 () Bool)

(assert (=> b!259116 (=> (not res!126670) (not e!167929))))

(assert (=> b!259116 (= res!126670 (contains!1858 lt!130567 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (=> b!259116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun d!62229 () Bool)

(assert (=> d!62229 e!167932))

(declare-fun res!126673 () Bool)

(assert (=> d!62229 (=> (not res!126673) (not e!167932))))

(assert (=> d!62229 (= res!126673 (or (bvsge #b00000000000000000000000000000000 (size!6296 lt!130349)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))))

(declare-fun lt!130555 () ListLongMap!3763)

(assert (=> d!62229 (= lt!130567 lt!130555)))

(declare-fun lt!130557 () Unit!8017)

(assert (=> d!62229 (= lt!130557 e!167931)))

(declare-fun c!43954 () Bool)

(assert (=> d!62229 (= c!43954 e!167936)))

(declare-fun res!126668 () Bool)

(assert (=> d!62229 (=> (not res!126668) (not e!167936))))

(assert (=> d!62229 (= res!126668 (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(assert (=> d!62229 (= lt!130555 e!167935)))

(assert (=> d!62229 (= c!43957 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62229 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62229 (= (getCurrentListMap!1429 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130567)))

(declare-fun bm!24654 () Bool)

(assert (=> bm!24654 (= call!24651 call!24655)))

(declare-fun b!259117 () Bool)

(declare-fun lt!130562 () Unit!8017)

(assert (=> b!259117 (= e!167931 lt!130562)))

(declare-fun lt!130561 () ListLongMap!3763)

(assert (=> b!259117 (= lt!130561 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130556 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130550 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130550 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(declare-fun lt!130563 () Unit!8017)

(assert (=> b!259117 (= lt!130563 (addStillContains!232 lt!130561 lt!130556 (zeroValue!4614 thiss!1504) lt!130550))))

(assert (=> b!259117 (contains!1858 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) lt!130550)))

(declare-fun lt!130552 () Unit!8017)

(assert (=> b!259117 (= lt!130552 lt!130563)))

(declare-fun lt!130549 () ListLongMap!3763)

(assert (=> b!259117 (= lt!130549 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130559 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130565 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130565 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(declare-fun lt!130564 () Unit!8017)

(assert (=> b!259117 (= lt!130564 (addApplyDifferent!232 lt!130549 lt!130559 (minValue!4614 thiss!1504) lt!130565))))

(assert (=> b!259117 (= (apply!256 (+!694 lt!130549 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) lt!130565) (apply!256 lt!130549 lt!130565))))

(declare-fun lt!130568 () Unit!8017)

(assert (=> b!259117 (= lt!130568 lt!130564)))

(declare-fun lt!130551 () ListLongMap!3763)

(assert (=> b!259117 (= lt!130551 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130553 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130569 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130569 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(declare-fun lt!130548 () Unit!8017)

(assert (=> b!259117 (= lt!130548 (addApplyDifferent!232 lt!130551 lt!130553 (zeroValue!4614 thiss!1504) lt!130569))))

(assert (=> b!259117 (= (apply!256 (+!694 lt!130551 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) lt!130569) (apply!256 lt!130551 lt!130569))))

(declare-fun lt!130554 () Unit!8017)

(assert (=> b!259117 (= lt!130554 lt!130548)))

(declare-fun lt!130560 () ListLongMap!3763)

(assert (=> b!259117 (= lt!130560 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130558 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130566 () (_ BitVec 64))

(assert (=> b!259117 (= lt!130566 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(assert (=> b!259117 (= lt!130562 (addApplyDifferent!232 lt!130560 lt!130558 (minValue!4614 thiss!1504) lt!130566))))

(assert (=> b!259117 (= (apply!256 (+!694 lt!130560 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) lt!130566) (apply!256 lt!130560 lt!130566))))

(assert (= (and d!62229 c!43957) b!259113))

(assert (= (and d!62229 (not c!43957)) b!259115))

(assert (= (and b!259115 c!43953) b!259112))

(assert (= (and b!259115 (not c!43953)) b!259107))

(assert (= (and b!259107 c!43958) b!259110))

(assert (= (and b!259107 (not c!43958)) b!259102))

(assert (= (or b!259110 b!259102) bm!24648))

(assert (= (or b!259112 bm!24648) bm!24654))

(assert (= (or b!259112 b!259110) bm!24650))

(assert (= (or b!259113 bm!24654) bm!24651))

(assert (= (or b!259113 bm!24650) bm!24649))

(assert (= (and d!62229 res!126668) b!259099))

(assert (= (and d!62229 c!43954) b!259117))

(assert (= (and d!62229 (not c!43954)) b!259109))

(assert (= (and d!62229 res!126673) b!259108))

(assert (= (and b!259108 res!126669) b!259111))

(assert (= (and b!259108 (not res!126674)) b!259116))

(assert (= (and b!259116 res!126670) b!259114))

(assert (= (and b!259108 res!126667) b!259100))

(assert (= (and b!259100 c!43956) b!259104))

(assert (= (and b!259100 (not c!43956)) b!259103))

(assert (= (and b!259104 res!126671) b!259101))

(assert (= (or b!259104 b!259103) bm!24652))

(assert (= (and b!259100 res!126672) b!259098))

(assert (= (and b!259098 c!43955) b!259097))

(assert (= (and b!259098 (not c!43955)) b!259106))

(assert (= (and b!259097 res!126666) b!259105))

(assert (= (or b!259097 b!259106) bm!24653))

(declare-fun b_lambda!8247 () Bool)

(assert (=> (not b_lambda!8247) (not b!259114)))

(assert (=> b!259114 t!8788))

(declare-fun b_and!13855 () Bool)

(assert (= b_and!13853 (and (=> t!8788 result!5389) b_and!13855)))

(assert (=> b!259099 m!274729))

(assert (=> b!259099 m!274729))

(assert (=> b!259099 m!274731))

(assert (=> b!259114 m!274675))

(declare-fun m!274745 () Bool)

(assert (=> b!259114 m!274745))

(assert (=> b!259114 m!274675))

(declare-fun m!274747 () Bool)

(assert (=> b!259114 m!274747))

(assert (=> b!259114 m!274729))

(declare-fun m!274749 () Bool)

(assert (=> b!259114 m!274749))

(assert (=> b!259114 m!274745))

(assert (=> b!259114 m!274729))

(declare-fun m!274751 () Bool)

(assert (=> bm!24653 m!274751))

(assert (=> b!259116 m!274729))

(assert (=> b!259116 m!274729))

(declare-fun m!274753 () Bool)

(assert (=> b!259116 m!274753))

(declare-fun m!274755 () Bool)

(assert (=> bm!24651 m!274755))

(assert (=> d!62229 m!274445))

(assert (=> b!259111 m!274729))

(assert (=> b!259111 m!274729))

(assert (=> b!259111 m!274731))

(declare-fun m!274757 () Bool)

(assert (=> b!259113 m!274757))

(declare-fun m!274759 () Bool)

(assert (=> b!259105 m!274759))

(declare-fun m!274761 () Bool)

(assert (=> bm!24652 m!274761))

(declare-fun m!274763 () Bool)

(assert (=> b!259117 m!274763))

(declare-fun m!274765 () Bool)

(assert (=> b!259117 m!274765))

(declare-fun m!274767 () Bool)

(assert (=> b!259117 m!274767))

(declare-fun m!274769 () Bool)

(assert (=> b!259117 m!274769))

(declare-fun m!274771 () Bool)

(assert (=> b!259117 m!274771))

(declare-fun m!274773 () Bool)

(assert (=> b!259117 m!274773))

(declare-fun m!274775 () Bool)

(assert (=> b!259117 m!274775))

(declare-fun m!274777 () Bool)

(assert (=> b!259117 m!274777))

(assert (=> b!259117 m!274729))

(declare-fun m!274779 () Bool)

(assert (=> b!259117 m!274779))

(declare-fun m!274781 () Bool)

(assert (=> b!259117 m!274781))

(declare-fun m!274783 () Bool)

(assert (=> b!259117 m!274783))

(declare-fun m!274785 () Bool)

(assert (=> b!259117 m!274785))

(assert (=> b!259117 m!274783))

(declare-fun m!274787 () Bool)

(assert (=> b!259117 m!274787))

(assert (=> b!259117 m!274779))

(declare-fun m!274789 () Bool)

(assert (=> b!259117 m!274789))

(declare-fun m!274791 () Bool)

(assert (=> b!259117 m!274791))

(assert (=> b!259117 m!274789))

(assert (=> b!259117 m!274755))

(assert (=> b!259117 m!274767))

(declare-fun m!274793 () Bool)

(assert (=> b!259101 m!274793))

(declare-fun m!274795 () Bool)

(assert (=> bm!24649 m!274795))

(assert (=> b!258811 d!62229))

(declare-fun d!62231 () Bool)

(assert (=> d!62231 (= (arrayCountValidKeys!0 lt!130349 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130572 () Unit!8017)

(declare-fun choose!2 (array!12563 (_ BitVec 32)) Unit!8017)

(assert (=> d!62231 (= lt!130572 (choose!2 lt!130349 index!297))))

(declare-fun e!167943 () Bool)

(assert (=> d!62231 e!167943))

(declare-fun res!126679 () Bool)

(assert (=> d!62231 (=> (not res!126679) (not e!167943))))

(assert (=> d!62231 (= res!126679 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 lt!130349))))))

(assert (=> d!62231 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130349 index!297) lt!130572)))

(declare-fun b!259122 () Bool)

(declare-fun res!126680 () Bool)

(assert (=> b!259122 (=> (not res!126680) (not e!167943))))

(assert (=> b!259122 (= res!126680 (validKeyInArray!0 (select (arr!5948 lt!130349) index!297)))))

(declare-fun b!259123 () Bool)

(assert (=> b!259123 (= e!167943 (bvslt (size!6296 lt!130349) #b01111111111111111111111111111111))))

(assert (= (and d!62231 res!126679) b!259122))

(assert (= (and b!259122 res!126680) b!259123))

(declare-fun m!274797 () Bool)

(assert (=> d!62231 m!274797))

(declare-fun m!274799 () Bool)

(assert (=> d!62231 m!274799))

(declare-fun m!274801 () Bool)

(assert (=> b!259122 m!274801))

(assert (=> b!259122 m!274801))

(declare-fun m!274803 () Bool)

(assert (=> b!259122 m!274803))

(assert (=> b!258811 d!62231))

(declare-fun bm!24657 () Bool)

(declare-fun call!24660 () (_ BitVec 32))

(assert (=> bm!24657 (= call!24660 (arrayCountValidKeys!0 lt!130349 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62233 () Bool)

(declare-fun lt!130575 () (_ BitVec 32))

(assert (=> d!62233 (and (bvsge lt!130575 #b00000000000000000000000000000000) (bvsle lt!130575 (bvsub (size!6296 lt!130349) index!297)))))

(declare-fun e!167948 () (_ BitVec 32))

(assert (=> d!62233 (= lt!130575 e!167948)))

(declare-fun c!43963 () Bool)

(assert (=> d!62233 (= c!43963 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62233 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6296 lt!130349)))))

(assert (=> d!62233 (= (arrayCountValidKeys!0 lt!130349 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130575)))

(declare-fun b!259132 () Bool)

(declare-fun e!167949 () (_ BitVec 32))

(assert (=> b!259132 (= e!167949 call!24660)))

(declare-fun b!259133 () Bool)

(assert (=> b!259133 (= e!167949 (bvadd #b00000000000000000000000000000001 call!24660))))

(declare-fun b!259134 () Bool)

(assert (=> b!259134 (= e!167948 #b00000000000000000000000000000000)))

(declare-fun b!259135 () Bool)

(assert (=> b!259135 (= e!167948 e!167949)))

(declare-fun c!43964 () Bool)

(assert (=> b!259135 (= c!43964 (validKeyInArray!0 (select (arr!5948 lt!130349) index!297)))))

(assert (= (and d!62233 c!43963) b!259134))

(assert (= (and d!62233 (not c!43963)) b!259135))

(assert (= (and b!259135 c!43964) b!259133))

(assert (= (and b!259135 (not c!43964)) b!259132))

(assert (= (or b!259133 b!259132) bm!24657))

(declare-fun m!274805 () Bool)

(assert (=> bm!24657 m!274805))

(assert (=> b!259135 m!274801))

(assert (=> b!259135 m!274801))

(assert (=> b!259135 m!274803))

(assert (=> b!258811 d!62233))

(declare-fun d!62235 () Bool)

(declare-fun e!167952 () Bool)

(assert (=> d!62235 e!167952))

(declare-fun res!126683 () Bool)

(assert (=> d!62235 (=> (not res!126683) (not e!167952))))

(assert (=> d!62235 (= res!126683 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 (_keys!6947 thiss!1504)))))))

(declare-fun lt!130578 () Unit!8017)

(declare-fun choose!41 (array!12563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3727) Unit!8017)

(assert (=> d!62235 (= lt!130578 (choose!41 (_keys!6947 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3724))))

(assert (=> d!62235 (bvslt (size!6296 (_keys!6947 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62235 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6947 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3724) lt!130578)))

(declare-fun b!259138 () Bool)

(assert (=> b!259138 (= e!167952 (arrayNoDuplicates!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 Nil!3724))))

(assert (= (and d!62235 res!126683) b!259138))

(declare-fun m!274807 () Bool)

(assert (=> d!62235 m!274807))

(assert (=> b!259138 m!274453))

(declare-fun m!274809 () Bool)

(assert (=> b!259138 m!274809))

(assert (=> b!258811 d!62235))

(declare-fun bm!24658 () Bool)

(declare-fun call!24661 () (_ BitVec 32))

(assert (=> bm!24658 (= call!24661 (arrayCountValidKeys!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun d!62237 () Bool)

(declare-fun lt!130579 () (_ BitVec 32))

(assert (=> d!62237 (and (bvsge lt!130579 #b00000000000000000000000000000000) (bvsle lt!130579 (bvsub (size!6296 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun e!167953 () (_ BitVec 32))

(assert (=> d!62237 (= lt!130579 e!167953)))

(declare-fun c!43965 () Bool)

(assert (=> d!62237 (= c!43965 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62237 (and (bvsle #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6296 (_keys!6947 thiss!1504)) (size!6296 lt!130349)))))

(assert (=> d!62237 (= (arrayCountValidKeys!0 lt!130349 #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) lt!130579)))

(declare-fun b!259139 () Bool)

(declare-fun e!167954 () (_ BitVec 32))

(assert (=> b!259139 (= e!167954 call!24661)))

(declare-fun b!259140 () Bool)

(assert (=> b!259140 (= e!167954 (bvadd #b00000000000000000000000000000001 call!24661))))

(declare-fun b!259141 () Bool)

(assert (=> b!259141 (= e!167953 #b00000000000000000000000000000000)))

(declare-fun b!259142 () Bool)

(assert (=> b!259142 (= e!167953 e!167954)))

(declare-fun c!43966 () Bool)

(assert (=> b!259142 (= c!43966 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (= (and d!62237 c!43965) b!259141))

(assert (= (and d!62237 (not c!43965)) b!259142))

(assert (= (and b!259142 c!43966) b!259140))

(assert (= (and b!259142 (not c!43966)) b!259139))

(assert (= (or b!259140 b!259139) bm!24658))

(declare-fun m!274811 () Bool)

(assert (=> bm!24658 m!274811))

(assert (=> b!259142 m!274729))

(assert (=> b!259142 m!274729))

(assert (=> b!259142 m!274731))

(assert (=> b!258811 d!62237))

(declare-fun b!259151 () Bool)

(declare-fun res!126695 () Bool)

(declare-fun e!167959 () Bool)

(assert (=> b!259151 (=> (not res!126695) (not e!167959))))

(assert (=> b!259151 (= res!126695 (not (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) index!297))))))

(declare-fun b!259153 () Bool)

(assert (=> b!259153 (= e!167959 (bvslt (size!6296 (_keys!6947 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!259152 () Bool)

(declare-fun res!126694 () Bool)

(assert (=> b!259152 (=> (not res!126694) (not e!167959))))

(assert (=> b!259152 (= res!126694 (validKeyInArray!0 key!932))))

(declare-fun b!259154 () Bool)

(declare-fun e!167960 () Bool)

(assert (=> b!259154 (= e!167960 (= (arrayCountValidKeys!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!62239 () Bool)

(assert (=> d!62239 e!167960))

(declare-fun res!126692 () Bool)

(assert (=> d!62239 (=> (not res!126692) (not e!167960))))

(assert (=> d!62239 (= res!126692 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 (_keys!6947 thiss!1504)))))))

(declare-fun lt!130582 () Unit!8017)

(declare-fun choose!1 (array!12563 (_ BitVec 32) (_ BitVec 64)) Unit!8017)

(assert (=> d!62239 (= lt!130582 (choose!1 (_keys!6947 thiss!1504) index!297 key!932))))

(assert (=> d!62239 e!167959))

(declare-fun res!126693 () Bool)

(assert (=> d!62239 (=> (not res!126693) (not e!167959))))

(assert (=> d!62239 (= res!126693 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 (_keys!6947 thiss!1504)))))))

(assert (=> d!62239 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6947 thiss!1504) index!297 key!932) lt!130582)))

(assert (= (and d!62239 res!126693) b!259151))

(assert (= (and b!259151 res!126695) b!259152))

(assert (= (and b!259152 res!126694) b!259153))

(assert (= (and d!62239 res!126692) b!259154))

(declare-fun m!274813 () Bool)

(assert (=> b!259151 m!274813))

(assert (=> b!259151 m!274813))

(declare-fun m!274815 () Bool)

(assert (=> b!259151 m!274815))

(declare-fun m!274817 () Bool)

(assert (=> b!259152 m!274817))

(assert (=> b!259154 m!274453))

(declare-fun m!274819 () Bool)

(assert (=> b!259154 m!274819))

(assert (=> b!259154 m!274475))

(declare-fun m!274821 () Bool)

(assert (=> d!62239 m!274821))

(assert (=> b!258811 d!62239))

(declare-fun d!62241 () Bool)

(declare-fun e!167963 () Bool)

(assert (=> d!62241 e!167963))

(declare-fun res!126701 () Bool)

(assert (=> d!62241 (=> (not res!126701) (not e!167963))))

(declare-fun lt!130591 () ListLongMap!3763)

(assert (=> d!62241 (= res!126701 (contains!1858 lt!130591 (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lt!130593 () List!3726)

(assert (=> d!62241 (= lt!130591 (ListLongMap!3764 lt!130593))))

(declare-fun lt!130592 () Unit!8017)

(declare-fun lt!130594 () Unit!8017)

(assert (=> d!62241 (= lt!130592 lt!130594)))

(assert (=> d!62241 (= (getValueByKey!315 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346))) (Some!320 (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!171 (List!3726 (_ BitVec 64) V!8457) Unit!8017)

(assert (=> d!62241 (= lt!130594 (lemmaContainsTupThenGetReturnValue!171 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun insertStrictlySorted!174 (List!3726 (_ BitVec 64) V!8457) List!3726)

(assert (=> d!62241 (= lt!130593 (insertStrictlySorted!174 (toList!1897 lt!130348) (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!62241 (= (+!694 lt!130348 (tuple2!4849 key!932 v!346)) lt!130591)))

(declare-fun b!259159 () Bool)

(declare-fun res!126700 () Bool)

(assert (=> b!259159 (=> (not res!126700) (not e!167963))))

(assert (=> b!259159 (= res!126700 (= (getValueByKey!315 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346))) (Some!320 (_2!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun b!259160 () Bool)

(declare-fun contains!1861 (List!3726 tuple2!4848) Bool)

(assert (=> b!259160 (= e!167963 (contains!1861 (toList!1897 lt!130591) (tuple2!4849 key!932 v!346)))))

(assert (= (and d!62241 res!126701) b!259159))

(assert (= (and b!259159 res!126700) b!259160))

(declare-fun m!274823 () Bool)

(assert (=> d!62241 m!274823))

(declare-fun m!274825 () Bool)

(assert (=> d!62241 m!274825))

(declare-fun m!274827 () Bool)

(assert (=> d!62241 m!274827))

(declare-fun m!274829 () Bool)

(assert (=> d!62241 m!274829))

(declare-fun m!274831 () Bool)

(assert (=> b!259159 m!274831))

(declare-fun m!274833 () Bool)

(assert (=> b!259160 m!274833))

(assert (=> b!258811 d!62241))

(declare-fun d!62243 () Bool)

(declare-fun res!126706 () Bool)

(declare-fun e!167968 () Bool)

(assert (=> d!62243 (=> res!126706 e!167968)))

(assert (=> d!62243 (= res!126706 (= (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62243 (= (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000) e!167968)))

(declare-fun b!259165 () Bool)

(declare-fun e!167969 () Bool)

(assert (=> b!259165 (= e!167968 e!167969)))

(declare-fun res!126707 () Bool)

(assert (=> b!259165 (=> (not res!126707) (not e!167969))))

(assert (=> b!259165 (= res!126707 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun b!259166 () Bool)

(assert (=> b!259166 (= e!167969 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62243 (not res!126706)) b!259165))

(assert (= (and b!259165 res!126707) b!259166))

(assert (=> d!62243 m!274671))

(declare-fun m!274835 () Bool)

(assert (=> b!259166 m!274835))

(assert (=> b!258811 d!62243))

(declare-fun d!62245 () Bool)

(declare-fun e!167972 () Bool)

(assert (=> d!62245 e!167972))

(declare-fun res!126710 () Bool)

(assert (=> d!62245 (=> (not res!126710) (not e!167972))))

(assert (=> d!62245 (= res!126710 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 (_keys!6947 thiss!1504)))))))

(declare-fun lt!130597 () Unit!8017)

(declare-fun choose!102 ((_ BitVec 64) array!12563 (_ BitVec 32) (_ BitVec 32)) Unit!8017)

(assert (=> d!62245 (= lt!130597 (choose!102 key!932 (_keys!6947 thiss!1504) index!297 (mask!11081 thiss!1504)))))

(assert (=> d!62245 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62245 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) index!297 (mask!11081 thiss!1504)) lt!130597)))

(declare-fun b!259169 () Bool)

(assert (=> b!259169 (= e!167972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (mask!11081 thiss!1504)))))

(assert (= (and d!62245 res!126710) b!259169))

(declare-fun m!274837 () Bool)

(assert (=> d!62245 m!274837))

(assert (=> d!62245 m!274445))

(assert (=> b!259169 m!274453))

(declare-fun m!274839 () Bool)

(assert (=> b!259169 m!274839))

(assert (=> b!258811 d!62245))

(declare-fun d!62247 () Bool)

(declare-fun res!126711 () Bool)

(declare-fun e!167973 () Bool)

(assert (=> d!62247 (=> res!126711 e!167973)))

(assert (=> d!62247 (= res!126711 (= (select (arr!5948 lt!130349) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62247 (= (arrayContainsKey!0 lt!130349 key!932 #b00000000000000000000000000000000) e!167973)))

(declare-fun b!259170 () Bool)

(declare-fun e!167974 () Bool)

(assert (=> b!259170 (= e!167973 e!167974)))

(declare-fun res!126712 () Bool)

(assert (=> b!259170 (=> (not res!126712) (not e!167974))))

(assert (=> b!259170 (= res!126712 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(declare-fun b!259171 () Bool)

(assert (=> b!259171 (= e!167974 (arrayContainsKey!0 lt!130349 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62247 (not res!126711)) b!259170))

(assert (= (and b!259170 res!126712) b!259171))

(assert (=> d!62247 m!274729))

(declare-fun m!274841 () Bool)

(assert (=> b!259171 m!274841))

(assert (=> b!258811 d!62247))

(declare-fun bm!24659 () Bool)

(declare-fun call!24662 () (_ BitVec 32))

(assert (=> bm!24659 (= call!24662 (arrayCountValidKeys!0 (_keys!6947 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun d!62249 () Bool)

(declare-fun lt!130598 () (_ BitVec 32))

(assert (=> d!62249 (and (bvsge lt!130598 #b00000000000000000000000000000000) (bvsle lt!130598 (bvsub (size!6296 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167975 () (_ BitVec 32))

(assert (=> d!62249 (= lt!130598 e!167975)))

(declare-fun c!43967 () Bool)

(assert (=> d!62249 (= c!43967 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62249 (and (bvsle #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6296 (_keys!6947 thiss!1504)) (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62249 (= (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) lt!130598)))

(declare-fun b!259172 () Bool)

(declare-fun e!167976 () (_ BitVec 32))

(assert (=> b!259172 (= e!167976 call!24662)))

(declare-fun b!259173 () Bool)

(assert (=> b!259173 (= e!167976 (bvadd #b00000000000000000000000000000001 call!24662))))

(declare-fun b!259174 () Bool)

(assert (=> b!259174 (= e!167975 #b00000000000000000000000000000000)))

(declare-fun b!259175 () Bool)

(assert (=> b!259175 (= e!167975 e!167976)))

(declare-fun c!43968 () Bool)

(assert (=> b!259175 (= c!43968 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62249 c!43967) b!259174))

(assert (= (and d!62249 (not c!43967)) b!259175))

(assert (= (and b!259175 c!43968) b!259173))

(assert (= (and b!259175 (not c!43968)) b!259172))

(assert (= (or b!259173 b!259172) bm!24659))

(declare-fun m!274843 () Bool)

(assert (=> bm!24659 m!274843))

(assert (=> b!259175 m!274671))

(assert (=> b!259175 m!274671))

(assert (=> b!259175 m!274673))

(assert (=> b!258811 d!62249))

(declare-fun d!62251 () Bool)

(declare-fun e!167979 () Bool)

(assert (=> d!62251 e!167979))

(declare-fun res!126715 () Bool)

(assert (=> d!62251 (=> (not res!126715) (not e!167979))))

(assert (=> d!62251 (= res!126715 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6296 (_keys!6947 thiss!1504))) (bvslt index!297 (size!6295 (_values!4756 thiss!1504)))))))

(declare-fun lt!130601 () Unit!8017)

(declare-fun choose!1262 (array!12563 array!12561 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) (_ BitVec 64) V!8457 Int) Unit!8017)

(assert (=> d!62251 (= lt!130601 (choose!1262 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62251 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62251 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!109 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)) lt!130601)))

(declare-fun b!259178 () Bool)

(assert (=> b!259178 (= e!167979 (= (+!694 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4849 key!932 v!346)) (getCurrentListMap!1429 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))))))

(assert (= (and d!62251 res!126715) b!259178))

(declare-fun m!274845 () Bool)

(assert (=> d!62251 m!274845))

(assert (=> d!62251 m!274445))

(assert (=> b!259178 m!274491))

(declare-fun m!274847 () Bool)

(assert (=> b!259178 m!274847))

(assert (=> b!259178 m!274469))

(assert (=> b!259178 m!274491))

(declare-fun m!274849 () Bool)

(assert (=> b!259178 m!274849))

(assert (=> b!259178 m!274453))

(assert (=> b!258811 d!62251))

(declare-fun d!62253 () Bool)

(assert (=> d!62253 (arrayContainsKey!0 lt!130349 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130604 () Unit!8017)

(declare-fun choose!13 (array!12563 (_ BitVec 64) (_ BitVec 32)) Unit!8017)

(assert (=> d!62253 (= lt!130604 (choose!13 lt!130349 key!932 index!297))))

(assert (=> d!62253 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62253 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130349 key!932 index!297) lt!130604)))

(declare-fun bs!9144 () Bool)

(assert (= bs!9144 d!62253))

(assert (=> bs!9144 m!274459))

(declare-fun m!274851 () Bool)

(assert (=> bs!9144 m!274851))

(assert (=> b!258811 d!62253))

(declare-fun d!62255 () Bool)

(assert (=> d!62255 (= (array_inv!3917 (_keys!6947 thiss!1504)) (bvsge (size!6296 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258803 d!62255))

(declare-fun d!62257 () Bool)

(assert (=> d!62257 (= (array_inv!3918 (_values!4756 thiss!1504)) (bvsge (size!6295 (_values!4756 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258803 d!62257))

(assert (=> bm!24601 d!62243))

(declare-fun d!62259 () Bool)

(declare-fun res!126722 () Bool)

(declare-fun e!167982 () Bool)

(assert (=> d!62259 (=> (not res!126722) (not e!167982))))

(declare-fun simpleValid!279 (LongMapFixedSize!3820) Bool)

(assert (=> d!62259 (= res!126722 (simpleValid!279 thiss!1504))))

(assert (=> d!62259 (= (valid!1499 thiss!1504) e!167982)))

(declare-fun b!259185 () Bool)

(declare-fun res!126723 () Bool)

(assert (=> b!259185 (=> (not res!126723) (not e!167982))))

(assert (=> b!259185 (= res!126723 (= (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (_size!1959 thiss!1504)))))

(declare-fun b!259186 () Bool)

(declare-fun res!126724 () Bool)

(assert (=> b!259186 (=> (not res!126724) (not e!167982))))

(assert (=> b!259186 (= res!126724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!259187 () Bool)

(assert (=> b!259187 (= e!167982 (arrayNoDuplicates!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 Nil!3724))))

(assert (= (and d!62259 res!126722) b!259185))

(assert (= (and b!259185 res!126723) b!259186))

(assert (= (and b!259186 res!126724) b!259187))

(declare-fun m!274853 () Bool)

(assert (=> d!62259 m!274853))

(assert (=> b!259185 m!274475))

(declare-fun m!274855 () Bool)

(assert (=> b!259186 m!274855))

(declare-fun m!274857 () Bool)

(assert (=> b!259187 m!274857))

(assert (=> start!24764 d!62259))

(declare-fun d!62261 () Bool)

(assert (=> d!62261 (= (inRange!0 (ite c!43886 (index!6746 lt!130342) (index!6749 lt!130342)) (mask!11081 thiss!1504)) (and (bvsge (ite c!43886 (index!6746 lt!130342) (index!6749 lt!130342)) #b00000000000000000000000000000000) (bvslt (ite c!43886 (index!6746 lt!130342) (index!6749 lt!130342)) (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24602 d!62261))

(declare-fun condMapEmpty!11263 () Bool)

(declare-fun mapDefault!11263 () ValueCell!2960)

(assert (=> mapNonEmpty!11254 (= condMapEmpty!11263 (= mapRest!11254 ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11263)))))

(declare-fun e!167988 () Bool)

(declare-fun mapRes!11263 () Bool)

(assert (=> mapNonEmpty!11254 (= tp!23551 (and e!167988 mapRes!11263))))

(declare-fun mapNonEmpty!11263 () Bool)

(declare-fun tp!23566 () Bool)

(declare-fun e!167987 () Bool)

(assert (=> mapNonEmpty!11263 (= mapRes!11263 (and tp!23566 e!167987))))

(declare-fun mapRest!11263 () (Array (_ BitVec 32) ValueCell!2960))

(declare-fun mapValue!11263 () ValueCell!2960)

(declare-fun mapKey!11263 () (_ BitVec 32))

(assert (=> mapNonEmpty!11263 (= mapRest!11254 (store mapRest!11263 mapKey!11263 mapValue!11263))))

(declare-fun mapIsEmpty!11263 () Bool)

(assert (=> mapIsEmpty!11263 mapRes!11263))

(declare-fun b!259194 () Bool)

(assert (=> b!259194 (= e!167987 tp_is_empty!6607)))

(declare-fun b!259195 () Bool)

(assert (=> b!259195 (= e!167988 tp_is_empty!6607)))

(assert (= (and mapNonEmpty!11254 condMapEmpty!11263) mapIsEmpty!11263))

(assert (= (and mapNonEmpty!11254 (not condMapEmpty!11263)) mapNonEmpty!11263))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2960) mapValue!11263)) b!259194))

(assert (= (and mapNonEmpty!11254 ((_ is ValueCellFull!2960) mapDefault!11263)) b!259195))

(declare-fun m!274859 () Bool)

(assert (=> mapNonEmpty!11263 m!274859))

(declare-fun b_lambda!8249 () Bool)

(assert (= b_lambda!8245 (or (and b!258803 b_free!6745) b_lambda!8249)))

(declare-fun b_lambda!8251 () Bool)

(assert (= b_lambda!8247 (or (and b!258803 b_free!6745) b_lambda!8251)))

(check-sat (not bm!24658) (not d!62219) (not b!259067) (not b!259135) (not b!259151) (not bm!24636) (not d!62251) (not b!259002) (not d!62215) (not d!62209) (not b!259080) (not b!259160) (not bm!24649) (not bm!24651) (not b!259055) (not b!259152) (not b!259081) (not bm!24619) (not bm!24653) (not d!62221) (not b!259063) (not b!259186) (not b!259138) (not b!259113) (not b!259105) (not d!62213) (not b!259101) (not b!259159) (not b!259094) (not b!259171) (not b!259166) (not d!62239) (not bm!24639) (not b!259093) (not bm!24638) (not bm!24640) (not d!62241) (not b!259099) (not b!259117) (not d!62245) (not b!259004) b_and!13855 (not b!259083) (not d!62253) (not b!259066) (not b!259175) (not b!258966) (not b_lambda!8249) (not b!258952) (not b!259051) (not bm!24647) (not d!62235) (not b!259064) (not d!62259) (not b!259142) (not b!259154) (not bm!24620) (not d!62229) (not b!259185) (not b!259111) (not b_lambda!8251) (not bm!24644) tp_is_empty!6607 (not d!62231) (not bm!24652) (not b!259049) (not b!259116) (not b!259061) (not b!259169) (not b_next!6745) (not d!62211) (not mapNonEmpty!11263) (not bm!24657) (not bm!24659) (not b!259187) (not b!259114) (not b!259122) (not b!259178))
(check-sat b_and!13855 (not b_next!6745))
(get-model)

(declare-fun d!62263 () Bool)

(declare-fun e!167989 () Bool)

(assert (=> d!62263 e!167989))

(declare-fun res!126725 () Bool)

(assert (=> d!62263 (=> res!126725 e!167989)))

(declare-fun lt!130606 () Bool)

(assert (=> d!62263 (= res!126725 (not lt!130606))))

(declare-fun lt!130605 () Bool)

(assert (=> d!62263 (= lt!130606 lt!130605)))

(declare-fun lt!130608 () Unit!8017)

(declare-fun e!167990 () Unit!8017)

(assert (=> d!62263 (= lt!130608 e!167990)))

(declare-fun c!43969 () Bool)

(assert (=> d!62263 (= c!43969 lt!130605)))

(assert (=> d!62263 (= lt!130605 (containsKey!306 (toList!1897 lt!130536) (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62263 (= (contains!1858 lt!130536 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)) lt!130606)))

(declare-fun b!259196 () Bool)

(declare-fun lt!130607 () Unit!8017)

(assert (=> b!259196 (= e!167990 lt!130607)))

(assert (=> b!259196 (= lt!130607 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130536) (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259196 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259197 () Bool)

(declare-fun Unit!8033 () Unit!8017)

(assert (=> b!259197 (= e!167990 Unit!8033)))

(declare-fun b!259198 () Bool)

(assert (=> b!259198 (= e!167989 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62263 c!43969) b!259196))

(assert (= (and d!62263 (not c!43969)) b!259197))

(assert (= (and d!62263 (not res!126725)) b!259198))

(assert (=> d!62263 m!274671))

(declare-fun m!274861 () Bool)

(assert (=> d!62263 m!274861))

(assert (=> b!259196 m!274671))

(declare-fun m!274863 () Bool)

(assert (=> b!259196 m!274863))

(assert (=> b!259196 m!274671))

(declare-fun m!274865 () Bool)

(assert (=> b!259196 m!274865))

(assert (=> b!259196 m!274865))

(declare-fun m!274867 () Bool)

(assert (=> b!259196 m!274867))

(assert (=> b!259198 m!274671))

(assert (=> b!259198 m!274865))

(assert (=> b!259198 m!274865))

(assert (=> b!259198 m!274867))

(assert (=> b!259066 d!62263))

(declare-fun b!259223 () Bool)

(declare-fun e!168008 () Bool)

(declare-fun e!168007 () Bool)

(assert (=> b!259223 (= e!168008 e!168007)))

(declare-fun c!43980 () Bool)

(assert (=> b!259223 (= c!43980 (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun b!259224 () Bool)

(declare-fun e!168006 () ListLongMap!3763)

(assert (=> b!259224 (= e!168006 (ListLongMap!3764 Nil!3723))))

(declare-fun b!259225 () Bool)

(assert (=> b!259225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(assert (=> b!259225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6295 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))))))))

(declare-fun e!168011 () Bool)

(declare-fun lt!130623 () ListLongMap!3763)

(assert (=> b!259225 (= e!168011 (= (apply!256 lt!130623 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!62265 () Bool)

(declare-fun e!168005 () Bool)

(assert (=> d!62265 e!168005))

(declare-fun res!126736 () Bool)

(assert (=> d!62265 (=> (not res!126736) (not e!168005))))

(assert (=> d!62265 (= res!126736 (not (contains!1858 lt!130623 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62265 (= lt!130623 e!168006)))

(declare-fun c!43979 () Bool)

(assert (=> d!62265 (= c!43979 (bvsge #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(assert (=> d!62265 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62265 (= (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130623)))

(declare-fun b!259226 () Bool)

(declare-fun lt!130626 () Unit!8017)

(declare-fun lt!130629 () Unit!8017)

(assert (=> b!259226 (= lt!130626 lt!130629)))

(declare-fun lt!130624 () (_ BitVec 64))

(declare-fun lt!130625 () V!8457)

(declare-fun lt!130628 () (_ BitVec 64))

(declare-fun lt!130627 () ListLongMap!3763)

(assert (=> b!259226 (not (contains!1858 (+!694 lt!130627 (tuple2!4849 lt!130628 lt!130625)) lt!130624))))

(declare-fun addStillNotContains!128 (ListLongMap!3763 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8017)

(assert (=> b!259226 (= lt!130629 (addStillNotContains!128 lt!130627 lt!130628 lt!130625 lt!130624))))

(assert (=> b!259226 (= lt!130624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259226 (= lt!130625 (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259226 (= lt!130628 (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))

(declare-fun call!24665 () ListLongMap!3763)

(assert (=> b!259226 (= lt!130627 call!24665)))

(declare-fun e!168009 () ListLongMap!3763)

(assert (=> b!259226 (= e!168009 (+!694 call!24665 (tuple2!4849 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259227 () Bool)

(declare-fun res!126735 () Bool)

(assert (=> b!259227 (=> (not res!126735) (not e!168005))))

(assert (=> b!259227 (= res!126735 (not (contains!1858 lt!130623 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259228 () Bool)

(assert (=> b!259228 (= e!168006 e!168009)))

(declare-fun c!43978 () Bool)

(assert (=> b!259228 (= c!43978 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259229 () Bool)

(declare-fun e!168010 () Bool)

(assert (=> b!259229 (= e!168010 (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (=> b!259229 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259230 () Bool)

(assert (=> b!259230 (= e!168007 (= lt!130623 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504))))))

(declare-fun b!259231 () Bool)

(assert (=> b!259231 (= e!168005 e!168008)))

(declare-fun c!43981 () Bool)

(assert (=> b!259231 (= c!43981 e!168010)))

(declare-fun res!126734 () Bool)

(assert (=> b!259231 (=> (not res!126734) (not e!168010))))

(assert (=> b!259231 (= res!126734 (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun bm!24662 () Bool)

(assert (=> bm!24662 (= call!24665 (getCurrentListMapNoExtraKeys!572 lt!130349 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259232 () Bool)

(assert (=> b!259232 (= e!168008 e!168011)))

(assert (=> b!259232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 lt!130349)))))

(declare-fun res!126737 () Bool)

(assert (=> b!259232 (= res!126737 (contains!1858 lt!130623 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (=> b!259232 (=> (not res!126737) (not e!168011))))

(declare-fun b!259233 () Bool)

(assert (=> b!259233 (= e!168009 call!24665)))

(declare-fun b!259234 () Bool)

(declare-fun isEmpty!540 (ListLongMap!3763) Bool)

(assert (=> b!259234 (= e!168007 (isEmpty!540 lt!130623))))

(assert (= (and d!62265 c!43979) b!259224))

(assert (= (and d!62265 (not c!43979)) b!259228))

(assert (= (and b!259228 c!43978) b!259226))

(assert (= (and b!259228 (not c!43978)) b!259233))

(assert (= (or b!259226 b!259233) bm!24662))

(assert (= (and d!62265 res!126736) b!259227))

(assert (= (and b!259227 res!126735) b!259231))

(assert (= (and b!259231 res!126734) b!259229))

(assert (= (and b!259231 c!43981) b!259232))

(assert (= (and b!259231 (not c!43981)) b!259223))

(assert (= (and b!259232 res!126737) b!259225))

(assert (= (and b!259223 c!43980) b!259230))

(assert (= (and b!259223 (not c!43980)) b!259234))

(declare-fun b_lambda!8253 () Bool)

(assert (=> (not b_lambda!8253) (not b!259225)))

(assert (=> b!259225 t!8788))

(declare-fun b_and!13857 () Bool)

(assert (= b_and!13855 (and (=> t!8788 result!5389) b_and!13857)))

(declare-fun b_lambda!8255 () Bool)

(assert (=> (not b_lambda!8255) (not b!259226)))

(assert (=> b!259226 t!8788))

(declare-fun b_and!13859 () Bool)

(assert (= b_and!13857 (and (=> t!8788 result!5389) b_and!13859)))

(declare-fun m!274869 () Bool)

(assert (=> d!62265 m!274869))

(assert (=> d!62265 m!274445))

(declare-fun m!274871 () Bool)

(assert (=> b!259234 m!274871))

(assert (=> b!259226 m!274745))

(assert (=> b!259226 m!274675))

(assert (=> b!259226 m!274747))

(assert (=> b!259226 m!274729))

(declare-fun m!274873 () Bool)

(assert (=> b!259226 m!274873))

(assert (=> b!259226 m!274873))

(declare-fun m!274875 () Bool)

(assert (=> b!259226 m!274875))

(declare-fun m!274877 () Bool)

(assert (=> b!259226 m!274877))

(declare-fun m!274879 () Bool)

(assert (=> b!259226 m!274879))

(assert (=> b!259226 m!274745))

(assert (=> b!259226 m!274675))

(declare-fun m!274881 () Bool)

(assert (=> b!259227 m!274881))

(declare-fun m!274883 () Bool)

(assert (=> b!259230 m!274883))

(assert (=> b!259229 m!274729))

(assert (=> b!259229 m!274729))

(assert (=> b!259229 m!274731))

(assert (=> b!259225 m!274745))

(assert (=> b!259225 m!274675))

(assert (=> b!259225 m!274747))

(assert (=> b!259225 m!274729))

(assert (=> b!259225 m!274729))

(declare-fun m!274885 () Bool)

(assert (=> b!259225 m!274885))

(assert (=> b!259225 m!274745))

(assert (=> b!259225 m!274675))

(assert (=> b!259228 m!274729))

(assert (=> b!259228 m!274729))

(assert (=> b!259228 m!274731))

(assert (=> b!259232 m!274729))

(assert (=> b!259232 m!274729))

(declare-fun m!274887 () Bool)

(assert (=> b!259232 m!274887))

(assert (=> bm!24662 m!274883))

(assert (=> bm!24651 d!62265))

(declare-fun d!62267 () Bool)

(declare-fun res!126739 () Bool)

(declare-fun e!168014 () Bool)

(assert (=> d!62267 (=> res!126739 e!168014)))

(assert (=> d!62267 (= res!126739 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(assert (=> d!62267 (= (arrayNoDuplicates!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43949 (Cons!3723 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) Nil!3724) Nil!3724)) e!168014)))

(declare-fun b!259235 () Bool)

(declare-fun e!168015 () Bool)

(declare-fun e!168012 () Bool)

(assert (=> b!259235 (= e!168015 e!168012)))

(declare-fun c!43982 () Bool)

(assert (=> b!259235 (= c!43982 (validKeyInArray!0 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259236 () Bool)

(assert (=> b!259236 (= e!168014 e!168015)))

(declare-fun res!126740 () Bool)

(assert (=> b!259236 (=> (not res!126740) (not e!168015))))

(declare-fun e!168013 () Bool)

(assert (=> b!259236 (= res!126740 (not e!168013))))

(declare-fun res!126738 () Bool)

(assert (=> b!259236 (=> (not res!126738) (not e!168013))))

(assert (=> b!259236 (= res!126738 (validKeyInArray!0 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259237 () Bool)

(declare-fun call!24666 () Bool)

(assert (=> b!259237 (= e!168012 call!24666)))

(declare-fun b!259238 () Bool)

(assert (=> b!259238 (= e!168013 (contains!1860 (ite c!43949 (Cons!3723 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) Nil!3724) Nil!3724) (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24663 () Bool)

(assert (=> bm!24663 (= call!24666 (arrayNoDuplicates!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43982 (Cons!3723 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43949 (Cons!3723 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) Nil!3724) Nil!3724)) (ite c!43949 (Cons!3723 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) Nil!3724) Nil!3724))))))

(declare-fun b!259239 () Bool)

(assert (=> b!259239 (= e!168012 call!24666)))

(assert (= (and d!62267 (not res!126739)) b!259236))

(assert (= (and b!259236 res!126738) b!259238))

(assert (= (and b!259236 res!126740) b!259235))

(assert (= (and b!259235 c!43982) b!259239))

(assert (= (and b!259235 (not c!43982)) b!259237))

(assert (= (or b!259239 b!259237) bm!24663))

(declare-fun m!274889 () Bool)

(assert (=> b!259235 m!274889))

(assert (=> b!259235 m!274889))

(declare-fun m!274891 () Bool)

(assert (=> b!259235 m!274891))

(assert (=> b!259236 m!274889))

(assert (=> b!259236 m!274889))

(assert (=> b!259236 m!274891))

(assert (=> b!259238 m!274889))

(assert (=> b!259238 m!274889))

(declare-fun m!274893 () Bool)

(assert (=> b!259238 m!274893))

(assert (=> bm!24663 m!274889))

(declare-fun m!274895 () Bool)

(assert (=> bm!24663 m!274895))

(assert (=> bm!24644 d!62267))

(declare-fun d!62269 () Bool)

(declare-fun get!3069 (Option!321) V!8457)

(assert (=> d!62269 (= (apply!256 lt!130536 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)) (get!3069 (getValueByKey!315 (toList!1897 lt!130536) (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9145 () Bool)

(assert (= bs!9145 d!62269))

(assert (=> bs!9145 m!274671))

(assert (=> bs!9145 m!274865))

(assert (=> bs!9145 m!274865))

(declare-fun m!274897 () Bool)

(assert (=> bs!9145 m!274897))

(assert (=> b!259064 d!62269))

(declare-fun d!62271 () Bool)

(declare-fun c!43985 () Bool)

(assert (=> d!62271 (= c!43985 ((_ is ValueCellFull!2960) (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168018 () V!8457)

(assert (=> d!62271 (= (get!3068 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168018)))

(declare-fun b!259244 () Bool)

(declare-fun get!3070 (ValueCell!2960 V!8457) V!8457)

(assert (=> b!259244 (= e!168018 (get!3070 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259245 () Bool)

(declare-fun get!3071 (ValueCell!2960 V!8457) V!8457)

(assert (=> b!259245 (= e!168018 (get!3071 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62271 c!43985) b!259244))

(assert (= (and d!62271 (not c!43985)) b!259245))

(assert (=> b!259244 m!274677))

(assert (=> b!259244 m!274675))

(declare-fun m!274899 () Bool)

(assert (=> b!259244 m!274899))

(assert (=> b!259245 m!274677))

(assert (=> b!259245 m!274675))

(declare-fun m!274901 () Bool)

(assert (=> b!259245 m!274901))

(assert (=> b!259064 d!62271))

(assert (=> d!62213 d!62211))

(declare-fun b!259262 () Bool)

(declare-fun res!126749 () Bool)

(declare-fun e!168028 () Bool)

(assert (=> b!259262 (=> (not res!126749) (not e!168028))))

(declare-fun call!24672 () Bool)

(assert (=> b!259262 (= res!126749 call!24672)))

(declare-fun e!168030 () Bool)

(assert (=> b!259262 (= e!168030 e!168028)))

(declare-fun b!259263 () Bool)

(declare-fun lt!130632 () SeekEntryResult!1144)

(assert (=> b!259263 (= e!168030 ((_ is Undefined!1144) lt!130632))))

(declare-fun c!43991 () Bool)

(declare-fun bm!24668 () Bool)

(assert (=> bm!24668 (= call!24672 (inRange!0 (ite c!43991 (index!6746 lt!130632) (index!6749 lt!130632)) (mask!11081 thiss!1504)))))

(declare-fun b!259264 () Bool)

(declare-fun e!168029 () Bool)

(assert (=> b!259264 (= e!168029 e!168030)))

(declare-fun c!43990 () Bool)

(assert (=> b!259264 (= c!43990 ((_ is MissingVacant!1144) lt!130632))))

(declare-fun bm!24669 () Bool)

(declare-fun call!24671 () Bool)

(assert (=> bm!24669 (= call!24671 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259265 () Bool)

(assert (=> b!259265 (= e!168028 (not call!24671))))

(declare-fun b!259266 () Bool)

(declare-fun e!168027 () Bool)

(assert (=> b!259266 (= e!168029 e!168027)))

(declare-fun res!126750 () Bool)

(assert (=> b!259266 (= res!126750 call!24672)))

(assert (=> b!259266 (=> (not res!126750) (not e!168027))))

(declare-fun b!259267 () Bool)

(declare-fun res!126752 () Bool)

(assert (=> b!259267 (=> (not res!126752) (not e!168028))))

(assert (=> b!259267 (= res!126752 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6749 lt!130632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!62273 () Bool)

(assert (=> d!62273 e!168029))

(assert (=> d!62273 (= c!43991 ((_ is MissingZero!1144) lt!130632))))

(assert (=> d!62273 (= lt!130632 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(assert (=> d!62273 true))

(declare-fun _$34!1122 () Unit!8017)

(assert (=> d!62273 (= (choose!1260 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) _$34!1122)))

(declare-fun b!259268 () Bool)

(declare-fun res!126751 () Bool)

(assert (=> b!259268 (= res!126751 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6746 lt!130632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259268 (=> (not res!126751) (not e!168027))))

(declare-fun b!259269 () Bool)

(assert (=> b!259269 (= e!168027 (not call!24671))))

(assert (= (and d!62273 c!43991) b!259266))

(assert (= (and d!62273 (not c!43991)) b!259264))

(assert (= (and b!259266 res!126750) b!259268))

(assert (= (and b!259268 res!126751) b!259269))

(assert (= (and b!259264 c!43990) b!259262))

(assert (= (and b!259264 (not c!43990)) b!259263))

(assert (= (and b!259262 res!126749) b!259267))

(assert (= (and b!259267 res!126752) b!259265))

(assert (= (or b!259266 b!259262) bm!24668))

(assert (= (or b!259269 b!259265) bm!24669))

(assert (=> bm!24669 m!274443))

(declare-fun m!274903 () Bool)

(assert (=> b!259267 m!274903))

(declare-fun m!274905 () Bool)

(assert (=> b!259268 m!274905))

(assert (=> d!62273 m!274439))

(declare-fun m!274907 () Bool)

(assert (=> bm!24668 m!274907))

(assert (=> d!62213 d!62273))

(assert (=> d!62213 d!62227))

(declare-fun b!259282 () Bool)

(declare-fun e!168039 () SeekEntryResult!1144)

(declare-fun e!168037 () SeekEntryResult!1144)

(assert (=> b!259282 (= e!168039 e!168037)))

(declare-fun c!44000 () Bool)

(declare-fun lt!130637 () (_ BitVec 64))

(assert (=> b!259282 (= c!44000 (= lt!130637 key!932))))

(declare-fun lt!130638 () SeekEntryResult!1144)

(declare-fun d!62275 () Bool)

(assert (=> d!62275 (and (or ((_ is Undefined!1144) lt!130638) (not ((_ is Found!1144) lt!130638)) (and (bvsge (index!6747 lt!130638) #b00000000000000000000000000000000) (bvslt (index!6747 lt!130638) (size!6296 (_keys!6947 thiss!1504))))) (or ((_ is Undefined!1144) lt!130638) ((_ is Found!1144) lt!130638) (not ((_ is MissingVacant!1144) lt!130638)) (not (= (index!6749 lt!130638) (index!6748 lt!130450))) (and (bvsge (index!6749 lt!130638) #b00000000000000000000000000000000) (bvslt (index!6749 lt!130638) (size!6296 (_keys!6947 thiss!1504))))) (or ((_ is Undefined!1144) lt!130638) (ite ((_ is Found!1144) lt!130638) (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6747 lt!130638)) key!932) (and ((_ is MissingVacant!1144) lt!130638) (= (index!6749 lt!130638) (index!6748 lt!130450)) (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6749 lt!130638)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62275 (= lt!130638 e!168039)))

(declare-fun c!43999 () Bool)

(assert (=> d!62275 (= c!43999 (bvsge (x!25038 lt!130450) #b01111111111111111111111111111110))))

(assert (=> d!62275 (= lt!130637 (select (arr!5948 (_keys!6947 thiss!1504)) (index!6748 lt!130450)))))

(assert (=> d!62275 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62275 (= (seekKeyOrZeroReturnVacant!0 (x!25038 lt!130450) (index!6748 lt!130450) (index!6748 lt!130450) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)) lt!130638)))

(declare-fun b!259283 () Bool)

(declare-fun e!168038 () SeekEntryResult!1144)

(assert (=> b!259283 (= e!168038 (MissingVacant!1144 (index!6748 lt!130450)))))

(declare-fun b!259284 () Bool)

(declare-fun c!43998 () Bool)

(assert (=> b!259284 (= c!43998 (= lt!130637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259284 (= e!168037 e!168038)))

(declare-fun b!259285 () Bool)

(assert (=> b!259285 (= e!168039 Undefined!1144)))

(declare-fun b!259286 () Bool)

(assert (=> b!259286 (= e!168037 (Found!1144 (index!6748 lt!130450)))))

(declare-fun b!259287 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259287 (= e!168038 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25038 lt!130450) #b00000000000000000000000000000001) (nextIndex!0 (index!6748 lt!130450) (bvadd (x!25038 lt!130450) #b00000000000000000000000000000001) (mask!11081 thiss!1504)) (index!6748 lt!130450) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(assert (= (and d!62275 c!43999) b!259285))

(assert (= (and d!62275 (not c!43999)) b!259282))

(assert (= (and b!259282 c!44000) b!259286))

(assert (= (and b!259282 (not c!44000)) b!259284))

(assert (= (and b!259284 c!43998) b!259283))

(assert (= (and b!259284 (not c!43998)) b!259287))

(declare-fun m!274909 () Bool)

(assert (=> d!62275 m!274909))

(declare-fun m!274911 () Bool)

(assert (=> d!62275 m!274911))

(assert (=> d!62275 m!274639))

(assert (=> d!62275 m!274445))

(declare-fun m!274913 () Bool)

(assert (=> b!259287 m!274913))

(assert (=> b!259287 m!274913))

(declare-fun m!274915 () Bool)

(assert (=> b!259287 m!274915))

(assert (=> b!258966 d!62275))

(declare-fun d!62277 () Bool)

(declare-fun e!168040 () Bool)

(assert (=> d!62277 e!168040))

(declare-fun res!126753 () Bool)

(assert (=> d!62277 (=> res!126753 e!168040)))

(declare-fun lt!130640 () Bool)

(assert (=> d!62277 (= res!126753 (not lt!130640))))

(declare-fun lt!130639 () Bool)

(assert (=> d!62277 (= lt!130640 lt!130639)))

(declare-fun lt!130642 () Unit!8017)

(declare-fun e!168041 () Unit!8017)

(assert (=> d!62277 (= lt!130642 e!168041)))

(declare-fun c!44001 () Bool)

(assert (=> d!62277 (= c!44001 lt!130639)))

(assert (=> d!62277 (= lt!130639 (containsKey!306 (toList!1897 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(assert (=> d!62277 (= (contains!1858 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932) lt!130640)))

(declare-fun b!259288 () Bool)

(declare-fun lt!130641 () Unit!8017)

(assert (=> b!259288 (= e!168041 lt!130641)))

(assert (=> b!259288 (= lt!130641 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(assert (=> b!259288 (isDefined!255 (getValueByKey!315 (toList!1897 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(declare-fun b!259289 () Bool)

(declare-fun Unit!8034 () Unit!8017)

(assert (=> b!259289 (= e!168041 Unit!8034)))

(declare-fun b!259290 () Bool)

(assert (=> b!259290 (= e!168040 (isDefined!255 (getValueByKey!315 (toList!1897 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932)))))

(assert (= (and d!62277 c!44001) b!259288))

(assert (= (and d!62277 (not c!44001)) b!259289))

(assert (= (and d!62277 (not res!126753)) b!259290))

(declare-fun m!274917 () Bool)

(assert (=> d!62277 m!274917))

(declare-fun m!274919 () Bool)

(assert (=> b!259288 m!274919))

(declare-fun m!274921 () Bool)

(assert (=> b!259288 m!274921))

(assert (=> b!259288 m!274921))

(declare-fun m!274923 () Bool)

(assert (=> b!259288 m!274923))

(assert (=> b!259290 m!274921))

(assert (=> b!259290 m!274921))

(assert (=> b!259290 m!274923))

(assert (=> d!62215 d!62277))

(assert (=> d!62215 d!62221))

(declare-fun d!62279 () Bool)

(assert (=> d!62279 (contains!1858 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932)))

(assert (=> d!62279 true))

(declare-fun _$17!86 () Unit!8017)

(assert (=> d!62279 (= (choose!1261 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) _$17!86)))

(declare-fun bs!9146 () Bool)

(assert (= bs!9146 d!62279))

(assert (=> bs!9146 m!274491))

(assert (=> bs!9146 m!274491))

(assert (=> bs!9146 m!274659))

(assert (=> d!62215 d!62279))

(assert (=> d!62215 d!62227))

(declare-fun bm!24670 () Bool)

(declare-fun call!24673 () (_ BitVec 32))

(assert (=> bm!24670 (= call!24673 (arrayCountValidKeys!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun d!62281 () Bool)

(declare-fun lt!130643 () (_ BitVec 32))

(assert (=> d!62281 (and (bvsge lt!130643 #b00000000000000000000000000000000) (bvsle lt!130643 (bvsub (size!6296 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168042 () (_ BitVec 32))

(assert (=> d!62281 (= lt!130643 e!168042)))

(declare-fun c!44002 () Bool)

(assert (=> d!62281 (= c!44002 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62281 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6296 (_keys!6947 thiss!1504)) (size!6296 lt!130349)))))

(assert (=> d!62281 (= (arrayCountValidKeys!0 lt!130349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))) lt!130643)))

(declare-fun b!259291 () Bool)

(declare-fun e!168043 () (_ BitVec 32))

(assert (=> b!259291 (= e!168043 call!24673)))

(declare-fun b!259292 () Bool)

(assert (=> b!259292 (= e!168043 (bvadd #b00000000000000000000000000000001 call!24673))))

(declare-fun b!259293 () Bool)

(assert (=> b!259293 (= e!168042 #b00000000000000000000000000000000)))

(declare-fun b!259294 () Bool)

(assert (=> b!259294 (= e!168042 e!168043)))

(declare-fun c!44003 () Bool)

(assert (=> b!259294 (= c!44003 (validKeyInArray!0 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62281 c!44002) b!259293))

(assert (= (and d!62281 (not c!44002)) b!259294))

(assert (= (and b!259294 c!44003) b!259292))

(assert (= (and b!259294 (not c!44003)) b!259291))

(assert (= (or b!259292 b!259291) bm!24670))

(declare-fun m!274925 () Bool)

(assert (=> bm!24670 m!274925))

(assert (=> b!259294 m!274889))

(assert (=> b!259294 m!274889))

(assert (=> b!259294 m!274891))

(assert (=> bm!24658 d!62281))

(declare-fun d!62283 () Bool)

(declare-fun res!126762 () Bool)

(declare-fun e!168046 () Bool)

(assert (=> d!62283 (=> (not res!126762) (not e!168046))))

(assert (=> d!62283 (= res!126762 (validMask!0 (mask!11081 thiss!1504)))))

(assert (=> d!62283 (= (simpleValid!279 thiss!1504) e!168046)))

(declare-fun b!259306 () Bool)

(assert (=> b!259306 (= e!168046 (and (bvsge (extraKeys!4510 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4510 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1959 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!259304 () Bool)

(declare-fun res!126763 () Bool)

(assert (=> b!259304 (=> (not res!126763) (not e!168046))))

(declare-fun size!6301 (LongMapFixedSize!3820) (_ BitVec 32))

(assert (=> b!259304 (= res!126763 (bvsge (size!6301 thiss!1504) (_size!1959 thiss!1504)))))

(declare-fun b!259305 () Bool)

(declare-fun res!126764 () Bool)

(assert (=> b!259305 (=> (not res!126764) (not e!168046))))

(assert (=> b!259305 (= res!126764 (= (size!6301 thiss!1504) (bvadd (_size!1959 thiss!1504) (bvsdiv (bvadd (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!259303 () Bool)

(declare-fun res!126765 () Bool)

(assert (=> b!259303 (=> (not res!126765) (not e!168046))))

(assert (=> b!259303 (= res!126765 (and (= (size!6295 (_values!4756 thiss!1504)) (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001)) (= (size!6296 (_keys!6947 thiss!1504)) (size!6295 (_values!4756 thiss!1504))) (bvsge (_size!1959 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1959 thiss!1504) (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!62283 res!126762) b!259303))

(assert (= (and b!259303 res!126765) b!259304))

(assert (= (and b!259304 res!126763) b!259305))

(assert (= (and b!259305 res!126764) b!259306))

(assert (=> d!62283 m!274445))

(declare-fun m!274927 () Bool)

(assert (=> b!259304 m!274927))

(assert (=> b!259305 m!274927))

(assert (=> d!62259 d!62283))

(declare-fun d!62285 () Bool)

(assert (=> d!62285 (= (inRange!0 (index!6747 lt!130441) (mask!11081 thiss!1504)) (and (bvsge (index!6747 lt!130441) #b00000000000000000000000000000000) (bvslt (index!6747 lt!130441) (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258952 d!62285))

(declare-fun d!62287 () Bool)

(declare-fun e!168047 () Bool)

(assert (=> d!62287 e!168047))

(declare-fun res!126766 () Bool)

(assert (=> d!62287 (=> res!126766 e!168047)))

(declare-fun lt!130645 () Bool)

(assert (=> d!62287 (= res!126766 (not lt!130645))))

(declare-fun lt!130644 () Bool)

(assert (=> d!62287 (= lt!130645 lt!130644)))

(declare-fun lt!130647 () Unit!8017)

(declare-fun e!168048 () Unit!8017)

(assert (=> d!62287 (= lt!130647 e!168048)))

(declare-fun c!44004 () Bool)

(assert (=> d!62287 (= c!44004 lt!130644)))

(assert (=> d!62287 (= lt!130644 (containsKey!306 (toList!1897 lt!130567) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62287 (= (contains!1858 lt!130567 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130645)))

(declare-fun b!259307 () Bool)

(declare-fun lt!130646 () Unit!8017)

(assert (=> b!259307 (= e!168048 lt!130646)))

(assert (=> b!259307 (= lt!130646 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130567) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259307 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259308 () Bool)

(declare-fun Unit!8035 () Unit!8017)

(assert (=> b!259308 (= e!168048 Unit!8035)))

(declare-fun b!259309 () Bool)

(assert (=> b!259309 (= e!168047 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62287 c!44004) b!259307))

(assert (= (and d!62287 (not c!44004)) b!259308))

(assert (= (and d!62287 (not res!126766)) b!259309))

(declare-fun m!274929 () Bool)

(assert (=> d!62287 m!274929))

(declare-fun m!274931 () Bool)

(assert (=> b!259307 m!274931))

(declare-fun m!274933 () Bool)

(assert (=> b!259307 m!274933))

(assert (=> b!259307 m!274933))

(declare-fun m!274935 () Bool)

(assert (=> b!259307 m!274935))

(assert (=> b!259309 m!274933))

(assert (=> b!259309 m!274933))

(assert (=> b!259309 m!274935))

(assert (=> bm!24652 d!62287))

(declare-fun d!62289 () Bool)

(assert (=> d!62289 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259152 d!62289))

(declare-fun d!62291 () Bool)

(assert (=> d!62291 (= (apply!256 lt!130536 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3069 (getValueByKey!315 (toList!1897 lt!130536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9147 () Bool)

(assert (= bs!9147 d!62291))

(declare-fun m!274937 () Bool)

(assert (=> bs!9147 m!274937))

(assert (=> bs!9147 m!274937))

(declare-fun m!274939 () Bool)

(assert (=> bs!9147 m!274939))

(assert (=> b!259055 d!62291))

(declare-fun bm!24671 () Bool)

(declare-fun call!24674 () Bool)

(assert (=> bm!24671 (= call!24674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!259310 () Bool)

(declare-fun e!168051 () Bool)

(declare-fun e!168050 () Bool)

(assert (=> b!259310 (= e!168051 e!168050)))

(declare-fun c!44005 () Bool)

(assert (=> b!259310 (= c!44005 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62293 () Bool)

(declare-fun res!126767 () Bool)

(assert (=> d!62293 (=> res!126767 e!168051)))

(assert (=> d!62293 (= res!126767 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)) e!168051)))

(declare-fun b!259311 () Bool)

(declare-fun e!168049 () Bool)

(assert (=> b!259311 (= e!168050 e!168049)))

(declare-fun lt!130649 () (_ BitVec 64))

(assert (=> b!259311 (= lt!130649 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130648 () Unit!8017)

(assert (=> b!259311 (= lt!130648 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6947 thiss!1504) lt!130649 #b00000000000000000000000000000000))))

(assert (=> b!259311 (arrayContainsKey!0 (_keys!6947 thiss!1504) lt!130649 #b00000000000000000000000000000000)))

(declare-fun lt!130650 () Unit!8017)

(assert (=> b!259311 (= lt!130650 lt!130648)))

(declare-fun res!126768 () Bool)

(assert (=> b!259311 (= res!126768 (= (seekEntryOrOpen!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) (_keys!6947 thiss!1504) (mask!11081 thiss!1504)) (Found!1144 #b00000000000000000000000000000000)))))

(assert (=> b!259311 (=> (not res!126768) (not e!168049))))

(declare-fun b!259312 () Bool)

(assert (=> b!259312 (= e!168050 call!24674)))

(declare-fun b!259313 () Bool)

(assert (=> b!259313 (= e!168049 call!24674)))

(assert (= (and d!62293 (not res!126767)) b!259310))

(assert (= (and b!259310 c!44005) b!259311))

(assert (= (and b!259310 (not c!44005)) b!259312))

(assert (= (and b!259311 res!126768) b!259313))

(assert (= (or b!259313 b!259312) bm!24671))

(declare-fun m!274941 () Bool)

(assert (=> bm!24671 m!274941))

(assert (=> b!259310 m!274671))

(assert (=> b!259310 m!274671))

(assert (=> b!259310 m!274673))

(assert (=> b!259311 m!274671))

(declare-fun m!274943 () Bool)

(assert (=> b!259311 m!274943))

(declare-fun m!274945 () Bool)

(assert (=> b!259311 m!274945))

(assert (=> b!259311 m!274671))

(declare-fun m!274947 () Bool)

(assert (=> b!259311 m!274947))

(assert (=> b!259186 d!62293))

(declare-fun d!62295 () Bool)

(assert (=> d!62295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (mask!11081 thiss!1504))))

(assert (=> d!62295 true))

(declare-fun _$56!36 () Unit!8017)

(assert (=> d!62295 (= (choose!102 key!932 (_keys!6947 thiss!1504) index!297 (mask!11081 thiss!1504)) _$56!36)))

(declare-fun bs!9148 () Bool)

(assert (= bs!9148 d!62295))

(assert (=> bs!9148 m!274453))

(assert (=> bs!9148 m!274839))

(assert (=> d!62245 d!62295))

(assert (=> d!62245 d!62227))

(declare-fun d!62297 () Bool)

(declare-fun res!126769 () Bool)

(declare-fun e!168052 () Bool)

(assert (=> d!62297 (=> res!126769 e!168052)))

(assert (=> d!62297 (= res!126769 (= (select (arr!5948 (_keys!6947 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62297 (= (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168052)))

(declare-fun b!259314 () Bool)

(declare-fun e!168053 () Bool)

(assert (=> b!259314 (= e!168052 e!168053)))

(declare-fun res!126770 () Bool)

(assert (=> b!259314 (=> (not res!126770) (not e!168053))))

(assert (=> b!259314 (= res!126770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun b!259315 () Bool)

(assert (=> b!259315 (= e!168053 (arrayContainsKey!0 (_keys!6947 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62297 (not res!126769)) b!259314))

(assert (= (and b!259314 res!126770) b!259315))

(declare-fun m!274949 () Bool)

(assert (=> d!62297 m!274949))

(declare-fun m!274951 () Bool)

(assert (=> b!259315 m!274951))

(assert (=> b!259166 d!62297))

(assert (=> d!62253 d!62247))

(declare-fun d!62299 () Bool)

(assert (=> d!62299 (arrayContainsKey!0 lt!130349 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62299 true))

(declare-fun _$60!381 () Unit!8017)

(assert (=> d!62299 (= (choose!13 lt!130349 key!932 index!297) _$60!381)))

(declare-fun bs!9149 () Bool)

(assert (= bs!9149 d!62299))

(assert (=> bs!9149 m!274459))

(assert (=> d!62253 d!62299))

(assert (=> d!62229 d!62227))

(declare-fun d!62301 () Bool)

(declare-fun res!126772 () Bool)

(declare-fun e!168056 () Bool)

(assert (=> d!62301 (=> res!126772 e!168056)))

(assert (=> d!62301 (= res!126772 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62301 (= (arrayNoDuplicates!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 Nil!3724) e!168056)))

(declare-fun b!259316 () Bool)

(declare-fun e!168057 () Bool)

(declare-fun e!168054 () Bool)

(assert (=> b!259316 (= e!168057 e!168054)))

(declare-fun c!44006 () Bool)

(assert (=> b!259316 (= c!44006 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259317 () Bool)

(assert (=> b!259317 (= e!168056 e!168057)))

(declare-fun res!126773 () Bool)

(assert (=> b!259317 (=> (not res!126773) (not e!168057))))

(declare-fun e!168055 () Bool)

(assert (=> b!259317 (= res!126773 (not e!168055))))

(declare-fun res!126771 () Bool)

(assert (=> b!259317 (=> (not res!126771) (not e!168055))))

(assert (=> b!259317 (= res!126771 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259318 () Bool)

(declare-fun call!24675 () Bool)

(assert (=> b!259318 (= e!168054 call!24675)))

(declare-fun b!259319 () Bool)

(assert (=> b!259319 (= e!168055 (contains!1860 Nil!3724 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24672 () Bool)

(assert (=> bm!24672 (= call!24675 (arrayNoDuplicates!0 (_keys!6947 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44006 (Cons!3723 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) Nil!3724) Nil!3724)))))

(declare-fun b!259320 () Bool)

(assert (=> b!259320 (= e!168054 call!24675)))

(assert (= (and d!62301 (not res!126772)) b!259317))

(assert (= (and b!259317 res!126771) b!259319))

(assert (= (and b!259317 res!126773) b!259316))

(assert (= (and b!259316 c!44006) b!259320))

(assert (= (and b!259316 (not c!44006)) b!259318))

(assert (= (or b!259320 b!259318) bm!24672))

(assert (=> b!259316 m!274671))

(assert (=> b!259316 m!274671))

(assert (=> b!259316 m!274673))

(assert (=> b!259317 m!274671))

(assert (=> b!259317 m!274671))

(assert (=> b!259317 m!274673))

(assert (=> b!259319 m!274671))

(assert (=> b!259319 m!274671))

(declare-fun m!274953 () Bool)

(assert (=> b!259319 m!274953))

(assert (=> bm!24672 m!274671))

(declare-fun m!274955 () Bool)

(assert (=> bm!24672 m!274955))

(assert (=> b!259187 d!62301))

(declare-fun d!62303 () Bool)

(declare-fun lt!130653 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!171 (List!3726) (InoxSet tuple2!4848))

(assert (=> d!62303 (= lt!130653 (select (content!171 (toList!1897 lt!130591)) (tuple2!4849 key!932 v!346)))))

(declare-fun e!168063 () Bool)

(assert (=> d!62303 (= lt!130653 e!168063)))

(declare-fun res!126778 () Bool)

(assert (=> d!62303 (=> (not res!126778) (not e!168063))))

(assert (=> d!62303 (= res!126778 ((_ is Cons!3722) (toList!1897 lt!130591)))))

(assert (=> d!62303 (= (contains!1861 (toList!1897 lt!130591) (tuple2!4849 key!932 v!346)) lt!130653)))

(declare-fun b!259325 () Bool)

(declare-fun e!168062 () Bool)

(assert (=> b!259325 (= e!168063 e!168062)))

(declare-fun res!126779 () Bool)

(assert (=> b!259325 (=> res!126779 e!168062)))

(assert (=> b!259325 (= res!126779 (= (h!4385 (toList!1897 lt!130591)) (tuple2!4849 key!932 v!346)))))

(declare-fun b!259326 () Bool)

(assert (=> b!259326 (= e!168062 (contains!1861 (t!8783 (toList!1897 lt!130591)) (tuple2!4849 key!932 v!346)))))

(assert (= (and d!62303 res!126778) b!259325))

(assert (= (and b!259325 (not res!126779)) b!259326))

(declare-fun m!274957 () Bool)

(assert (=> d!62303 m!274957))

(declare-fun m!274959 () Bool)

(assert (=> d!62303 m!274959))

(declare-fun m!274961 () Bool)

(assert (=> b!259326 m!274961))

(assert (=> b!259160 d!62303))

(declare-fun d!62305 () Bool)

(declare-fun e!168064 () Bool)

(assert (=> d!62305 e!168064))

(declare-fun res!126780 () Bool)

(assert (=> d!62305 (=> res!126780 e!168064)))

(declare-fun lt!130655 () Bool)

(assert (=> d!62305 (= res!126780 (not lt!130655))))

(declare-fun lt!130654 () Bool)

(assert (=> d!62305 (= lt!130655 lt!130654)))

(declare-fun lt!130657 () Unit!8017)

(declare-fun e!168065 () Unit!8017)

(assert (=> d!62305 (= lt!130657 e!168065)))

(declare-fun c!44007 () Bool)

(assert (=> d!62305 (= c!44007 lt!130654)))

(assert (=> d!62305 (= lt!130654 (containsKey!306 (toList!1897 lt!130567) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (=> d!62305 (= (contains!1858 lt!130567 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) lt!130655)))

(declare-fun b!259327 () Bool)

(declare-fun lt!130656 () Unit!8017)

(assert (=> b!259327 (= e!168065 lt!130656)))

(assert (=> b!259327 (= lt!130656 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130567) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (=> b!259327 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259328 () Bool)

(declare-fun Unit!8036 () Unit!8017)

(assert (=> b!259328 (= e!168065 Unit!8036)))

(declare-fun b!259329 () Bool)

(assert (=> b!259329 (= e!168064 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))))

(assert (= (and d!62305 c!44007) b!259327))

(assert (= (and d!62305 (not c!44007)) b!259328))

(assert (= (and d!62305 (not res!126780)) b!259329))

(assert (=> d!62305 m!274729))

(declare-fun m!274963 () Bool)

(assert (=> d!62305 m!274963))

(assert (=> b!259327 m!274729))

(declare-fun m!274965 () Bool)

(assert (=> b!259327 m!274965))

(assert (=> b!259327 m!274729))

(declare-fun m!274967 () Bool)

(assert (=> b!259327 m!274967))

(assert (=> b!259327 m!274967))

(declare-fun m!274969 () Bool)

(assert (=> b!259327 m!274969))

(assert (=> b!259329 m!274729))

(assert (=> b!259329 m!274967))

(assert (=> b!259329 m!274967))

(assert (=> b!259329 m!274969))

(assert (=> b!259116 d!62305))

(declare-fun d!62307 () Bool)

(assert (=> d!62307 (= (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259175 d!62307))

(declare-fun d!62309 () Bool)

(declare-fun res!126781 () Bool)

(declare-fun e!168066 () Bool)

(assert (=> d!62309 (=> res!126781 e!168066)))

(assert (=> d!62309 (= res!126781 (= (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62309 (= (arrayContainsKey!0 lt!130349 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168066)))

(declare-fun b!259330 () Bool)

(declare-fun e!168067 () Bool)

(assert (=> b!259330 (= e!168066 e!168067)))

(declare-fun res!126782 () Bool)

(assert (=> b!259330 (=> (not res!126782) (not e!168067))))

(assert (=> b!259330 (= res!126782 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(declare-fun b!259331 () Bool)

(assert (=> b!259331 (= e!168067 (arrayContainsKey!0 lt!130349 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62309 (not res!126781)) b!259330))

(assert (= (and b!259330 res!126782) b!259331))

(assert (=> d!62309 m!274889))

(declare-fun m!274971 () Bool)

(assert (=> b!259331 m!274971))

(assert (=> b!259171 d!62309))

(declare-fun d!62311 () Bool)

(assert (=> d!62311 (arrayContainsKey!0 lt!130349 lt!130546 #b00000000000000000000000000000000)))

(declare-fun lt!130658 () Unit!8017)

(assert (=> d!62311 (= lt!130658 (choose!13 lt!130349 lt!130546 #b00000000000000000000000000000000))))

(assert (=> d!62311 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62311 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130349 lt!130546 #b00000000000000000000000000000000) lt!130658)))

(declare-fun bs!9150 () Bool)

(assert (= bs!9150 d!62311))

(assert (=> bs!9150 m!274741))

(declare-fun m!274973 () Bool)

(assert (=> bs!9150 m!274973))

(assert (=> b!259094 d!62311))

(declare-fun d!62313 () Bool)

(declare-fun res!126783 () Bool)

(declare-fun e!168068 () Bool)

(assert (=> d!62313 (=> res!126783 e!168068)))

(assert (=> d!62313 (= res!126783 (= (select (arr!5948 lt!130349) #b00000000000000000000000000000000) lt!130546))))

(assert (=> d!62313 (= (arrayContainsKey!0 lt!130349 lt!130546 #b00000000000000000000000000000000) e!168068)))

(declare-fun b!259332 () Bool)

(declare-fun e!168069 () Bool)

(assert (=> b!259332 (= e!168068 e!168069)))

(declare-fun res!126784 () Bool)

(assert (=> b!259332 (=> (not res!126784) (not e!168069))))

(assert (=> b!259332 (= res!126784 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(declare-fun b!259333 () Bool)

(assert (=> b!259333 (= e!168069 (arrayContainsKey!0 lt!130349 lt!130546 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62313 (not res!126783)) b!259332))

(assert (= (and b!259332 res!126784) b!259333))

(assert (=> d!62313 m!274729))

(declare-fun m!274975 () Bool)

(assert (=> b!259333 m!274975))

(assert (=> b!259094 d!62313))

(declare-fun lt!130660 () SeekEntryResult!1144)

(declare-fun e!168072 () SeekEntryResult!1144)

(declare-fun b!259334 () Bool)

(assert (=> b!259334 (= e!168072 (seekKeyOrZeroReturnVacant!0 (x!25038 lt!130660) (index!6748 lt!130660) (index!6748 lt!130660) (select (arr!5948 lt!130349) #b00000000000000000000000000000000) lt!130349 (mask!11081 thiss!1504)))))

(declare-fun b!259335 () Bool)

(declare-fun c!44009 () Bool)

(declare-fun lt!130659 () (_ BitVec 64))

(assert (=> b!259335 (= c!44009 (= lt!130659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168071 () SeekEntryResult!1144)

(assert (=> b!259335 (= e!168071 e!168072)))

(declare-fun b!259336 () Bool)

(assert (=> b!259336 (= e!168072 (MissingZero!1144 (index!6748 lt!130660)))))

(declare-fun b!259337 () Bool)

(declare-fun e!168070 () SeekEntryResult!1144)

(assert (=> b!259337 (= e!168070 e!168071)))

(assert (=> b!259337 (= lt!130659 (select (arr!5948 lt!130349) (index!6748 lt!130660)))))

(declare-fun c!44008 () Bool)

(assert (=> b!259337 (= c!44008 (= lt!130659 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun d!62315 () Bool)

(declare-fun lt!130661 () SeekEntryResult!1144)

(assert (=> d!62315 (and (or ((_ is Undefined!1144) lt!130661) (not ((_ is Found!1144) lt!130661)) (and (bvsge (index!6747 lt!130661) #b00000000000000000000000000000000) (bvslt (index!6747 lt!130661) (size!6296 lt!130349)))) (or ((_ is Undefined!1144) lt!130661) ((_ is Found!1144) lt!130661) (not ((_ is MissingZero!1144) lt!130661)) (and (bvsge (index!6746 lt!130661) #b00000000000000000000000000000000) (bvslt (index!6746 lt!130661) (size!6296 lt!130349)))) (or ((_ is Undefined!1144) lt!130661) ((_ is Found!1144) lt!130661) ((_ is MissingZero!1144) lt!130661) (not ((_ is MissingVacant!1144) lt!130661)) (and (bvsge (index!6749 lt!130661) #b00000000000000000000000000000000) (bvslt (index!6749 lt!130661) (size!6296 lt!130349)))) (or ((_ is Undefined!1144) lt!130661) (ite ((_ is Found!1144) lt!130661) (= (select (arr!5948 lt!130349) (index!6747 lt!130661)) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1144) lt!130661) (= (select (arr!5948 lt!130349) (index!6746 lt!130661)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1144) lt!130661) (= (select (arr!5948 lt!130349) (index!6749 lt!130661)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62315 (= lt!130661 e!168070)))

(declare-fun c!44010 () Bool)

(assert (=> d!62315 (= c!44010 (and ((_ is Intermediate!1144) lt!130660) (undefined!1956 lt!130660)))))

(assert (=> d!62315 (= lt!130660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) (mask!11081 thiss!1504)) (select (arr!5948 lt!130349) #b00000000000000000000000000000000) lt!130349 (mask!11081 thiss!1504)))))

(assert (=> d!62315 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62315 (= (seekEntryOrOpen!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000) lt!130349 (mask!11081 thiss!1504)) lt!130661)))

(declare-fun b!259338 () Bool)

(assert (=> b!259338 (= e!168071 (Found!1144 (index!6748 lt!130660)))))

(declare-fun b!259339 () Bool)

(assert (=> b!259339 (= e!168070 Undefined!1144)))

(assert (= (and d!62315 c!44010) b!259339))

(assert (= (and d!62315 (not c!44010)) b!259337))

(assert (= (and b!259337 c!44008) b!259338))

(assert (= (and b!259337 (not c!44008)) b!259335))

(assert (= (and b!259335 c!44009) b!259336))

(assert (= (and b!259335 (not c!44009)) b!259334))

(assert (=> b!259334 m!274729))

(declare-fun m!274977 () Bool)

(assert (=> b!259334 m!274977))

(declare-fun m!274979 () Bool)

(assert (=> b!259337 m!274979))

(assert (=> d!62315 m!274729))

(declare-fun m!274981 () Bool)

(assert (=> d!62315 m!274981))

(declare-fun m!274983 () Bool)

(assert (=> d!62315 m!274983))

(assert (=> d!62315 m!274981))

(assert (=> d!62315 m!274729))

(declare-fun m!274985 () Bool)

(assert (=> d!62315 m!274985))

(declare-fun m!274987 () Bool)

(assert (=> d!62315 m!274987))

(assert (=> d!62315 m!274445))

(declare-fun m!274989 () Bool)

(assert (=> d!62315 m!274989))

(assert (=> b!259094 d!62315))

(declare-fun d!62317 () Bool)

(declare-fun e!168073 () Bool)

(assert (=> d!62317 e!168073))

(declare-fun res!126786 () Bool)

(assert (=> d!62317 (=> (not res!126786) (not e!168073))))

(declare-fun lt!130662 () ListLongMap!3763)

(assert (=> d!62317 (= res!126786 (contains!1858 lt!130662 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130664 () List!3726)

(assert (=> d!62317 (= lt!130662 (ListLongMap!3764 lt!130664))))

(declare-fun lt!130663 () Unit!8017)

(declare-fun lt!130665 () Unit!8017)

(assert (=> d!62317 (= lt!130663 lt!130665)))

(assert (=> d!62317 (= (getValueByKey!315 lt!130664 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62317 (= lt!130665 (lemmaContainsTupThenGetReturnValue!171 lt!130664 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62317 (= lt!130664 (insertStrictlySorted!174 (toList!1897 call!24644) (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62317 (= (+!694 call!24644 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) lt!130662)))

(declare-fun b!259340 () Bool)

(declare-fun res!126785 () Bool)

(assert (=> b!259340 (=> (not res!126785) (not e!168073))))

(assert (=> b!259340 (= res!126785 (= (getValueByKey!315 (toList!1897 lt!130662) (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun b!259341 () Bool)

(assert (=> b!259341 (= e!168073 (contains!1861 (toList!1897 lt!130662) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(assert (= (and d!62317 res!126786) b!259340))

(assert (= (and b!259340 res!126785) b!259341))

(declare-fun m!274991 () Bool)

(assert (=> d!62317 m!274991))

(declare-fun m!274993 () Bool)

(assert (=> d!62317 m!274993))

(declare-fun m!274995 () Bool)

(assert (=> d!62317 m!274995))

(declare-fun m!274997 () Bool)

(assert (=> d!62317 m!274997))

(declare-fun m!274999 () Bool)

(assert (=> b!259340 m!274999))

(declare-fun m!275001 () Bool)

(assert (=> b!259341 m!275001))

(assert (=> b!259063 d!62317))

(declare-fun d!62319 () Bool)

(declare-fun e!168074 () Bool)

(assert (=> d!62319 e!168074))

(declare-fun res!126788 () Bool)

(assert (=> d!62319 (=> (not res!126788) (not e!168074))))

(declare-fun lt!130666 () ListLongMap!3763)

(assert (=> d!62319 (= res!126788 (contains!1858 lt!130666 (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lt!130668 () List!3726)

(assert (=> d!62319 (= lt!130666 (ListLongMap!3764 lt!130668))))

(declare-fun lt!130667 () Unit!8017)

(declare-fun lt!130669 () Unit!8017)

(assert (=> d!62319 (= lt!130667 lt!130669)))

(assert (=> d!62319 (= (getValueByKey!315 lt!130668 (_1!2435 (tuple2!4849 key!932 v!346))) (Some!320 (_2!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!62319 (= lt!130669 (lemmaContainsTupThenGetReturnValue!171 lt!130668 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!62319 (= lt!130668 (insertStrictlySorted!174 (toList!1897 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!62319 (= (+!694 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4849 key!932 v!346)) lt!130666)))

(declare-fun b!259342 () Bool)

(declare-fun res!126787 () Bool)

(assert (=> b!259342 (=> (not res!126787) (not e!168074))))

(assert (=> b!259342 (= res!126787 (= (getValueByKey!315 (toList!1897 lt!130666) (_1!2435 (tuple2!4849 key!932 v!346))) (Some!320 (_2!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun b!259343 () Bool)

(assert (=> b!259343 (= e!168074 (contains!1861 (toList!1897 lt!130666) (tuple2!4849 key!932 v!346)))))

(assert (= (and d!62319 res!126788) b!259342))

(assert (= (and b!259342 res!126787) b!259343))

(declare-fun m!275003 () Bool)

(assert (=> d!62319 m!275003))

(declare-fun m!275005 () Bool)

(assert (=> d!62319 m!275005))

(declare-fun m!275007 () Bool)

(assert (=> d!62319 m!275007))

(declare-fun m!275009 () Bool)

(assert (=> d!62319 m!275009))

(declare-fun m!275011 () Bool)

(assert (=> b!259342 m!275011))

(declare-fun m!275013 () Bool)

(assert (=> b!259343 m!275013))

(assert (=> b!259178 d!62319))

(assert (=> b!259178 d!62221))

(declare-fun b!259344 () Bool)

(declare-fun e!168080 () Bool)

(declare-fun e!168077 () Bool)

(assert (=> b!259344 (= e!168080 e!168077)))

(declare-fun res!126789 () Bool)

(declare-fun call!24679 () Bool)

(assert (=> b!259344 (= res!126789 call!24679)))

(assert (=> b!259344 (=> (not res!126789) (not e!168077))))

(declare-fun b!259345 () Bool)

(declare-fun e!168079 () Bool)

(assert (=> b!259345 (= e!168079 e!168080)))

(declare-fun c!44013 () Bool)

(assert (=> b!259345 (= c!44013 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259346 () Bool)

(declare-fun e!168083 () Bool)

(assert (=> b!259346 (= e!168083 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259347 () Bool)

(declare-fun res!126795 () Bool)

(assert (=> b!259347 (=> (not res!126795) (not e!168079))))

(declare-fun e!168081 () Bool)

(assert (=> b!259347 (= res!126795 e!168081)))

(declare-fun c!44014 () Bool)

(assert (=> b!259347 (= c!44014 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259348 () Bool)

(declare-fun e!168075 () Bool)

(declare-fun lt!130689 () ListLongMap!3763)

(assert (=> b!259348 (= e!168075 (= (apply!256 lt!130689 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!259349 () Bool)

(declare-fun e!168085 () ListLongMap!3763)

(declare-fun call!24677 () ListLongMap!3763)

(assert (=> b!259349 (= e!168085 call!24677)))

(declare-fun b!259350 () Bool)

(declare-fun call!24678 () Bool)

(assert (=> b!259350 (= e!168081 (not call!24678))))

(declare-fun b!259351 () Bool)

(assert (=> b!259351 (= e!168081 e!168075)))

(declare-fun res!126794 () Bool)

(assert (=> b!259351 (= res!126794 call!24678)))

(assert (=> b!259351 (=> (not res!126794) (not e!168075))))

(declare-fun bm!24673 () Bool)

(declare-fun call!24676 () ListLongMap!3763)

(assert (=> bm!24673 (= call!24677 call!24676)))

(declare-fun b!259352 () Bool)

(assert (=> b!259352 (= e!168077 (= (apply!256 lt!130689 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun bm!24674 () Bool)

(declare-fun c!44015 () Bool)

(declare-fun c!44011 () Bool)

(declare-fun call!24680 () ListLongMap!3763)

(declare-fun call!24682 () ListLongMap!3763)

(assert (=> bm!24674 (= call!24682 (+!694 (ite c!44015 call!24680 (ite c!44011 call!24676 call!24677)) (ite (or c!44015 c!44011) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun b!259353 () Bool)

(assert (=> b!259353 (= e!168080 (not call!24679))))

(declare-fun bm!24675 () Bool)

(declare-fun call!24681 () ListLongMap!3763)

(assert (=> bm!24675 (= call!24681 call!24682)))

(declare-fun b!259354 () Bool)

(declare-fun c!44016 () Bool)

(assert (=> b!259354 (= c!44016 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!168087 () ListLongMap!3763)

(assert (=> b!259354 (= e!168087 e!168085)))

(declare-fun b!259355 () Bool)

(declare-fun res!126790 () Bool)

(assert (=> b!259355 (=> (not res!126790) (not e!168079))))

(declare-fun e!168086 () Bool)

(assert (=> b!259355 (= res!126790 e!168086)))

(declare-fun res!126797 () Bool)

(assert (=> b!259355 (=> res!126797 e!168086)))

(declare-fun e!168084 () Bool)

(assert (=> b!259355 (= res!126797 (not e!168084))))

(declare-fun res!126792 () Bool)

(assert (=> b!259355 (=> (not res!126792) (not e!168084))))

(assert (=> b!259355 (= res!126792 (bvslt #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(declare-fun bm!24676 () Bool)

(assert (=> bm!24676 (= call!24680 (getCurrentListMapNoExtraKeys!572 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259356 () Bool)

(declare-fun e!168078 () Unit!8017)

(declare-fun Unit!8037 () Unit!8017)

(assert (=> b!259356 (= e!168078 Unit!8037)))

(declare-fun b!259357 () Bool)

(assert (=> b!259357 (= e!168085 call!24681)))

(declare-fun b!259358 () Bool)

(assert (=> b!259358 (= e!168084 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259359 () Bool)

(assert (=> b!259359 (= e!168087 call!24681)))

(declare-fun b!259360 () Bool)

(declare-fun e!168082 () ListLongMap!3763)

(assert (=> b!259360 (= e!168082 (+!694 call!24682 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun bm!24677 () Bool)

(assert (=> bm!24677 (= call!24678 (contains!1858 lt!130689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259361 () Bool)

(declare-fun e!168076 () Bool)

(assert (=> b!259361 (= e!168076 (= (apply!256 lt!130689 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)) (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6295 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))))))))

(assert (=> b!259361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(declare-fun b!259362 () Bool)

(assert (=> b!259362 (= e!168082 e!168087)))

(assert (=> b!259362 (= c!44011 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24678 () Bool)

(assert (=> bm!24678 (= call!24679 (contains!1858 lt!130689 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259363 () Bool)

(assert (=> b!259363 (= e!168086 e!168076)))

(declare-fun res!126793 () Bool)

(assert (=> b!259363 (=> (not res!126793) (not e!168076))))

(assert (=> b!259363 (= res!126793 (contains!1858 lt!130689 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!259363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(declare-fun d!62321 () Bool)

(assert (=> d!62321 e!168079))

(declare-fun res!126796 () Bool)

(assert (=> d!62321 (=> (not res!126796) (not e!168079))))

(assert (=> d!62321 (= res!126796 (or (bvsge #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))))

(declare-fun lt!130677 () ListLongMap!3763)

(assert (=> d!62321 (= lt!130689 lt!130677)))

(declare-fun lt!130679 () Unit!8017)

(assert (=> d!62321 (= lt!130679 e!168078)))

(declare-fun c!44012 () Bool)

(assert (=> d!62321 (= c!44012 e!168083)))

(declare-fun res!126791 () Bool)

(assert (=> d!62321 (=> (not res!126791) (not e!168083))))

(assert (=> d!62321 (= res!126791 (bvslt #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(assert (=> d!62321 (= lt!130677 e!168082)))

(assert (=> d!62321 (= c!44015 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62321 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62321 (= (getCurrentListMap!1429 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130689)))

(declare-fun bm!24679 () Bool)

(assert (=> bm!24679 (= call!24676 call!24680)))

(declare-fun b!259364 () Bool)

(declare-fun lt!130684 () Unit!8017)

(assert (=> b!259364 (= e!168078 lt!130684)))

(declare-fun lt!130683 () ListLongMap!3763)

(assert (=> b!259364 (= lt!130683 (getCurrentListMapNoExtraKeys!572 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130678 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130672 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130672 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130685 () Unit!8017)

(assert (=> b!259364 (= lt!130685 (addStillContains!232 lt!130683 lt!130678 (zeroValue!4614 thiss!1504) lt!130672))))

(assert (=> b!259364 (contains!1858 (+!694 lt!130683 (tuple2!4849 lt!130678 (zeroValue!4614 thiss!1504))) lt!130672)))

(declare-fun lt!130674 () Unit!8017)

(assert (=> b!259364 (= lt!130674 lt!130685)))

(declare-fun lt!130671 () ListLongMap!3763)

(assert (=> b!259364 (= lt!130671 (getCurrentListMapNoExtraKeys!572 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130681 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130687 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130687 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130686 () Unit!8017)

(assert (=> b!259364 (= lt!130686 (addApplyDifferent!232 lt!130671 lt!130681 (minValue!4614 thiss!1504) lt!130687))))

(assert (=> b!259364 (= (apply!256 (+!694 lt!130671 (tuple2!4849 lt!130681 (minValue!4614 thiss!1504))) lt!130687) (apply!256 lt!130671 lt!130687))))

(declare-fun lt!130690 () Unit!8017)

(assert (=> b!259364 (= lt!130690 lt!130686)))

(declare-fun lt!130673 () ListLongMap!3763)

(assert (=> b!259364 (= lt!130673 (getCurrentListMapNoExtraKeys!572 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130675 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130691 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130691 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130670 () Unit!8017)

(assert (=> b!259364 (= lt!130670 (addApplyDifferent!232 lt!130673 lt!130675 (zeroValue!4614 thiss!1504) lt!130691))))

(assert (=> b!259364 (= (apply!256 (+!694 lt!130673 (tuple2!4849 lt!130675 (zeroValue!4614 thiss!1504))) lt!130691) (apply!256 lt!130673 lt!130691))))

(declare-fun lt!130676 () Unit!8017)

(assert (=> b!259364 (= lt!130676 lt!130670)))

(declare-fun lt!130682 () ListLongMap!3763)

(assert (=> b!259364 (= lt!130682 (getCurrentListMapNoExtraKeys!572 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130680 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130680 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130688 () (_ BitVec 64))

(assert (=> b!259364 (= lt!130688 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!259364 (= lt!130684 (addApplyDifferent!232 lt!130682 lt!130680 (minValue!4614 thiss!1504) lt!130688))))

(assert (=> b!259364 (= (apply!256 (+!694 lt!130682 (tuple2!4849 lt!130680 (minValue!4614 thiss!1504))) lt!130688) (apply!256 lt!130682 lt!130688))))

(assert (= (and d!62321 c!44015) b!259360))

(assert (= (and d!62321 (not c!44015)) b!259362))

(assert (= (and b!259362 c!44011) b!259359))

(assert (= (and b!259362 (not c!44011)) b!259354))

(assert (= (and b!259354 c!44016) b!259357))

(assert (= (and b!259354 (not c!44016)) b!259349))

(assert (= (or b!259357 b!259349) bm!24673))

(assert (= (or b!259359 bm!24673) bm!24679))

(assert (= (or b!259359 b!259357) bm!24675))

(assert (= (or b!259360 bm!24679) bm!24676))

(assert (= (or b!259360 bm!24675) bm!24674))

(assert (= (and d!62321 res!126791) b!259346))

(assert (= (and d!62321 c!44012) b!259364))

(assert (= (and d!62321 (not c!44012)) b!259356))

(assert (= (and d!62321 res!126796) b!259355))

(assert (= (and b!259355 res!126792) b!259358))

(assert (= (and b!259355 (not res!126797)) b!259363))

(assert (= (and b!259363 res!126793) b!259361))

(assert (= (and b!259355 res!126790) b!259347))

(assert (= (and b!259347 c!44014) b!259351))

(assert (= (and b!259347 (not c!44014)) b!259350))

(assert (= (and b!259351 res!126794) b!259348))

(assert (= (or b!259351 b!259350) bm!24677))

(assert (= (and b!259347 res!126795) b!259345))

(assert (= (and b!259345 c!44013) b!259344))

(assert (= (and b!259345 (not c!44013)) b!259353))

(assert (= (and b!259344 res!126789) b!259352))

(assert (= (or b!259344 b!259353) bm!24678))

(declare-fun b_lambda!8257 () Bool)

(assert (=> (not b_lambda!8257) (not b!259361)))

(assert (=> b!259361 t!8788))

(declare-fun b_and!13861 () Bool)

(assert (= b_and!13859 (and (=> t!8788 result!5389) b_and!13861)))

(declare-fun m!275015 () Bool)

(assert (=> b!259346 m!275015))

(assert (=> b!259346 m!275015))

(declare-fun m!275017 () Bool)

(assert (=> b!259346 m!275017))

(assert (=> b!259361 m!274675))

(assert (=> b!259361 m!274745))

(assert (=> b!259361 m!274675))

(assert (=> b!259361 m!274747))

(assert (=> b!259361 m!275015))

(declare-fun m!275019 () Bool)

(assert (=> b!259361 m!275019))

(assert (=> b!259361 m!274745))

(assert (=> b!259361 m!275015))

(declare-fun m!275021 () Bool)

(assert (=> bm!24678 m!275021))

(assert (=> b!259363 m!275015))

(assert (=> b!259363 m!275015))

(declare-fun m!275023 () Bool)

(assert (=> b!259363 m!275023))

(declare-fun m!275025 () Bool)

(assert (=> bm!24676 m!275025))

(assert (=> d!62321 m!274445))

(assert (=> b!259358 m!275015))

(assert (=> b!259358 m!275015))

(assert (=> b!259358 m!275017))

(declare-fun m!275027 () Bool)

(assert (=> b!259360 m!275027))

(declare-fun m!275029 () Bool)

(assert (=> b!259352 m!275029))

(declare-fun m!275031 () Bool)

(assert (=> bm!24677 m!275031))

(declare-fun m!275033 () Bool)

(assert (=> b!259364 m!275033))

(declare-fun m!275035 () Bool)

(assert (=> b!259364 m!275035))

(declare-fun m!275037 () Bool)

(assert (=> b!259364 m!275037))

(declare-fun m!275039 () Bool)

(assert (=> b!259364 m!275039))

(declare-fun m!275041 () Bool)

(assert (=> b!259364 m!275041))

(declare-fun m!275043 () Bool)

(assert (=> b!259364 m!275043))

(declare-fun m!275045 () Bool)

(assert (=> b!259364 m!275045))

(declare-fun m!275047 () Bool)

(assert (=> b!259364 m!275047))

(assert (=> b!259364 m!275015))

(declare-fun m!275049 () Bool)

(assert (=> b!259364 m!275049))

(declare-fun m!275051 () Bool)

(assert (=> b!259364 m!275051))

(declare-fun m!275053 () Bool)

(assert (=> b!259364 m!275053))

(declare-fun m!275055 () Bool)

(assert (=> b!259364 m!275055))

(assert (=> b!259364 m!275053))

(declare-fun m!275057 () Bool)

(assert (=> b!259364 m!275057))

(assert (=> b!259364 m!275049))

(declare-fun m!275059 () Bool)

(assert (=> b!259364 m!275059))

(declare-fun m!275061 () Bool)

(assert (=> b!259364 m!275061))

(assert (=> b!259364 m!275059))

(assert (=> b!259364 m!275025))

(assert (=> b!259364 m!275037))

(declare-fun m!275063 () Bool)

(assert (=> b!259348 m!275063))

(declare-fun m!275065 () Bool)

(assert (=> bm!24674 m!275065))

(assert (=> b!259178 d!62321))

(declare-fun d!62323 () Bool)

(assert (=> d!62323 (= (validKeyInArray!0 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) (and (not (= (select (arr!5948 lt!130349) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5948 lt!130349) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259080 d!62323))

(declare-fun d!62325 () Bool)

(assert (=> d!62325 (= (+!694 (getCurrentListMap!1429 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4849 key!932 v!346)) (getCurrentListMap!1429 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504))) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62325 true))

(declare-fun _$3!58 () Unit!8017)

(assert (=> d!62325 (= (choose!1262 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)) _$3!58)))

(declare-fun bs!9151 () Bool)

(assert (= bs!9151 d!62325))

(assert (=> bs!9151 m!274469))

(assert (=> bs!9151 m!274491))

(assert (=> bs!9151 m!274453))

(assert (=> bs!9151 m!274849))

(assert (=> bs!9151 m!274491))

(assert (=> bs!9151 m!274847))

(assert (=> d!62251 d!62325))

(assert (=> d!62251 d!62227))

(declare-fun bm!24680 () Bool)

(declare-fun call!24683 () Bool)

(assert (=> bm!24680 (= call!24683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!130349 (mask!11081 thiss!1504)))))

(declare-fun b!259365 () Bool)

(declare-fun e!168090 () Bool)

(declare-fun e!168089 () Bool)

(assert (=> b!259365 (= e!168090 e!168089)))

(declare-fun c!44017 () Bool)

(assert (=> b!259365 (= c!44017 (validKeyInArray!0 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62327 () Bool)

(declare-fun res!126798 () Bool)

(assert (=> d!62327 (=> res!126798 e!168090)))

(assert (=> d!62327 (= res!126798 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(assert (=> d!62327 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130349 (mask!11081 thiss!1504)) e!168090)))

(declare-fun b!259366 () Bool)

(declare-fun e!168088 () Bool)

(assert (=> b!259366 (= e!168089 e!168088)))

(declare-fun lt!130693 () (_ BitVec 64))

(assert (=> b!259366 (= lt!130693 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!130692 () Unit!8017)

(assert (=> b!259366 (= lt!130692 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130349 lt!130693 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!259366 (arrayContainsKey!0 lt!130349 lt!130693 #b00000000000000000000000000000000)))

(declare-fun lt!130694 () Unit!8017)

(assert (=> b!259366 (= lt!130694 lt!130692)))

(declare-fun res!126799 () Bool)

(assert (=> b!259366 (= res!126799 (= (seekEntryOrOpen!0 (select (arr!5948 lt!130349) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!130349 (mask!11081 thiss!1504)) (Found!1144 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!259366 (=> (not res!126799) (not e!168088))))

(declare-fun b!259367 () Bool)

(assert (=> b!259367 (= e!168089 call!24683)))

(declare-fun b!259368 () Bool)

(assert (=> b!259368 (= e!168088 call!24683)))

(assert (= (and d!62327 (not res!126798)) b!259365))

(assert (= (and b!259365 c!44017) b!259366))

(assert (= (and b!259365 (not c!44017)) b!259367))

(assert (= (and b!259366 res!126799) b!259368))

(assert (= (or b!259368 b!259367) bm!24680))

(declare-fun m!275067 () Bool)

(assert (=> bm!24680 m!275067))

(assert (=> b!259365 m!274889))

(assert (=> b!259365 m!274889))

(assert (=> b!259365 m!274891))

(assert (=> b!259366 m!274889))

(declare-fun m!275069 () Bool)

(assert (=> b!259366 m!275069))

(declare-fun m!275071 () Bool)

(assert (=> b!259366 m!275071))

(assert (=> b!259366 m!274889))

(declare-fun m!275073 () Bool)

(assert (=> b!259366 m!275073))

(assert (=> bm!24647 d!62327))

(assert (=> b!259061 d!62307))

(assert (=> d!62221 d!62227))

(declare-fun d!62329 () Bool)

(assert (=> d!62329 (= (apply!256 lt!130567 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3069 (getValueByKey!315 (toList!1897 lt!130567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9152 () Bool)

(assert (= bs!9152 d!62329))

(declare-fun m!275075 () Bool)

(assert (=> bs!9152 m!275075))

(assert (=> bs!9152 m!275075))

(declare-fun m!275077 () Bool)

(assert (=> bs!9152 m!275077))

(assert (=> b!259105 d!62329))

(declare-fun b!259387 () Bool)

(declare-fun e!168101 () Bool)

(declare-fun lt!130700 () SeekEntryResult!1144)

(assert (=> b!259387 (= e!168101 (bvsge (x!25038 lt!130700) #b01111111111111111111111111111110))))

(declare-fun b!259388 () Bool)

(assert (=> b!259388 (and (bvsge (index!6748 lt!130700) #b00000000000000000000000000000000) (bvslt (index!6748 lt!130700) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun e!168104 () Bool)

(assert (=> b!259388 (= e!168104 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6748 lt!130700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259389 () Bool)

(declare-fun e!168103 () SeekEntryResult!1144)

(assert (=> b!259389 (= e!168103 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11081 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11081 thiss!1504)) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(declare-fun b!259390 () Bool)

(declare-fun e!168105 () SeekEntryResult!1144)

(assert (=> b!259390 (= e!168105 e!168103)))

(declare-fun c!44025 () Bool)

(declare-fun lt!130699 () (_ BitVec 64))

(assert (=> b!259390 (= c!44025 (or (= lt!130699 key!932) (= (bvadd lt!130699 lt!130699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!62331 () Bool)

(assert (=> d!62331 e!168101))

(declare-fun c!44024 () Bool)

(assert (=> d!62331 (= c!44024 (and ((_ is Intermediate!1144) lt!130700) (undefined!1956 lt!130700)))))

(assert (=> d!62331 (= lt!130700 e!168105)))

(declare-fun c!44026 () Bool)

(assert (=> d!62331 (= c!44026 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!62331 (= lt!130699 (select (arr!5948 (_keys!6947 thiss!1504)) (toIndex!0 key!932 (mask!11081 thiss!1504))))))

(assert (=> d!62331 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11081 thiss!1504)) key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)) lt!130700)))

(declare-fun b!259391 () Bool)

(assert (=> b!259391 (and (bvsge (index!6748 lt!130700) #b00000000000000000000000000000000) (bvslt (index!6748 lt!130700) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun res!126808 () Bool)

(assert (=> b!259391 (= res!126808 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6748 lt!130700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259391 (=> res!126808 e!168104)))

(declare-fun b!259392 () Bool)

(assert (=> b!259392 (and (bvsge (index!6748 lt!130700) #b00000000000000000000000000000000) (bvslt (index!6748 lt!130700) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun res!126806 () Bool)

(assert (=> b!259392 (= res!126806 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6748 lt!130700)) key!932))))

(assert (=> b!259392 (=> res!126806 e!168104)))

(declare-fun e!168102 () Bool)

(assert (=> b!259392 (= e!168102 e!168104)))

(declare-fun b!259393 () Bool)

(assert (=> b!259393 (= e!168103 (Intermediate!1144 false (toIndex!0 key!932 (mask!11081 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!259394 () Bool)

(assert (=> b!259394 (= e!168105 (Intermediate!1144 true (toIndex!0 key!932 (mask!11081 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!259395 () Bool)

(assert (=> b!259395 (= e!168101 e!168102)))

(declare-fun res!126807 () Bool)

(assert (=> b!259395 (= res!126807 (and ((_ is Intermediate!1144) lt!130700) (not (undefined!1956 lt!130700)) (bvslt (x!25038 lt!130700) #b01111111111111111111111111111110) (bvsge (x!25038 lt!130700) #b00000000000000000000000000000000) (bvsge (x!25038 lt!130700) #b00000000000000000000000000000000)))))

(assert (=> b!259395 (=> (not res!126807) (not e!168102))))

(assert (= (and d!62331 c!44026) b!259394))

(assert (= (and d!62331 (not c!44026)) b!259390))

(assert (= (and b!259390 c!44025) b!259393))

(assert (= (and b!259390 (not c!44025)) b!259389))

(assert (= (and d!62331 c!44024) b!259387))

(assert (= (and d!62331 (not c!44024)) b!259395))

(assert (= (and b!259395 res!126807) b!259392))

(assert (= (and b!259392 (not res!126806)) b!259391))

(assert (= (and b!259391 (not res!126808)) b!259388))

(assert (=> b!259389 m!274641))

(declare-fun m!275079 () Bool)

(assert (=> b!259389 m!275079))

(assert (=> b!259389 m!275079))

(declare-fun m!275081 () Bool)

(assert (=> b!259389 m!275081))

(declare-fun m!275083 () Bool)

(assert (=> b!259388 m!275083))

(assert (=> b!259391 m!275083))

(assert (=> b!259392 m!275083))

(assert (=> d!62331 m!274641))

(declare-fun m!275085 () Bool)

(assert (=> d!62331 m!275085))

(assert (=> d!62331 m!274445))

(assert (=> d!62211 d!62331))

(declare-fun d!62333 () Bool)

(declare-fun lt!130706 () (_ BitVec 32))

(declare-fun lt!130705 () (_ BitVec 32))

(assert (=> d!62333 (= lt!130706 (bvmul (bvxor lt!130705 (bvlshr lt!130705 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62333 (= lt!130705 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62333 (and (bvsge (mask!11081 thiss!1504) #b00000000000000000000000000000000) (let ((res!126809 (let ((h!4389 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25057 (bvmul (bvxor h!4389 (bvlshr h!4389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25057 (bvlshr x!25057 #b00000000000000000000000000001101)) (mask!11081 thiss!1504)))))) (and (bvslt res!126809 (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126809 #b00000000000000000000000000000000))))))

(assert (=> d!62333 (= (toIndex!0 key!932 (mask!11081 thiss!1504)) (bvand (bvxor lt!130706 (bvlshr lt!130706 #b00000000000000000000000000001101)) (mask!11081 thiss!1504)))))

(assert (=> d!62211 d!62333))

(assert (=> d!62211 d!62227))

(declare-fun d!62335 () Bool)

(assert (=> d!62335 (= (apply!256 lt!130536 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3069 (getValueByKey!315 (toList!1897 lt!130536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9153 () Bool)

(assert (= bs!9153 d!62335))

(declare-fun m!275087 () Bool)

(assert (=> bs!9153 m!275087))

(assert (=> bs!9153 m!275087))

(declare-fun m!275089 () Bool)

(assert (=> bs!9153 m!275089))

(assert (=> b!259051 d!62335))

(declare-fun d!62337 () Bool)

(declare-fun e!168106 () Bool)

(assert (=> d!62337 e!168106))

(declare-fun res!126810 () Bool)

(assert (=> d!62337 (=> res!126810 e!168106)))

(declare-fun lt!130708 () Bool)

(assert (=> d!62337 (= res!126810 (not lt!130708))))

(declare-fun lt!130707 () Bool)

(assert (=> d!62337 (= lt!130708 lt!130707)))

(declare-fun lt!130710 () Unit!8017)

(declare-fun e!168107 () Unit!8017)

(assert (=> d!62337 (= lt!130710 e!168107)))

(declare-fun c!44027 () Bool)

(assert (=> d!62337 (= c!44027 lt!130707)))

(assert (=> d!62337 (= lt!130707 (containsKey!306 (toList!1897 lt!130536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62337 (= (contains!1858 lt!130536 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130708)))

(declare-fun b!259396 () Bool)

(declare-fun lt!130709 () Unit!8017)

(assert (=> b!259396 (= e!168107 lt!130709)))

(assert (=> b!259396 (= lt!130709 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259396 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259397 () Bool)

(declare-fun Unit!8038 () Unit!8017)

(assert (=> b!259397 (= e!168107 Unit!8038)))

(declare-fun b!259398 () Bool)

(assert (=> b!259398 (= e!168106 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62337 c!44027) b!259396))

(assert (= (and d!62337 (not c!44027)) b!259397))

(assert (= (and d!62337 (not res!126810)) b!259398))

(declare-fun m!275091 () Bool)

(assert (=> d!62337 m!275091))

(declare-fun m!275093 () Bool)

(assert (=> b!259396 m!275093))

(assert (=> b!259396 m!274937))

(assert (=> b!259396 m!274937))

(declare-fun m!275095 () Bool)

(assert (=> b!259396 m!275095))

(assert (=> b!259398 m!274937))

(assert (=> b!259398 m!274937))

(assert (=> b!259398 m!275095))

(assert (=> bm!24640 d!62337))

(assert (=> d!62209 d!62211))

(declare-fun d!62339 () Bool)

(declare-fun e!168110 () Bool)

(assert (=> d!62339 e!168110))

(declare-fun res!126815 () Bool)

(assert (=> d!62339 (=> (not res!126815) (not e!168110))))

(declare-fun lt!130713 () SeekEntryResult!1144)

(assert (=> d!62339 (= res!126815 ((_ is Found!1144) lt!130713))))

(assert (=> d!62339 (= lt!130713 (seekEntryOrOpen!0 key!932 (_keys!6947 thiss!1504) (mask!11081 thiss!1504)))))

(assert (=> d!62339 true))

(declare-fun _$33!177 () Unit!8017)

(assert (=> d!62339 (= (choose!1259 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) _$33!177)))

(declare-fun b!259403 () Bool)

(declare-fun res!126816 () Bool)

(assert (=> b!259403 (=> (not res!126816) (not e!168110))))

(assert (=> b!259403 (= res!126816 (inRange!0 (index!6747 lt!130713) (mask!11081 thiss!1504)))))

(declare-fun b!259404 () Bool)

(assert (=> b!259404 (= e!168110 (= (select (arr!5948 (_keys!6947 thiss!1504)) (index!6747 lt!130713)) key!932))))

(assert (= (and d!62339 res!126815) b!259403))

(assert (= (and b!259403 res!126816) b!259404))

(assert (=> d!62339 m!274439))

(declare-fun m!275097 () Bool)

(assert (=> b!259403 m!275097))

(declare-fun m!275099 () Bool)

(assert (=> b!259404 m!275099))

(assert (=> d!62209 d!62339))

(assert (=> d!62209 d!62227))

(assert (=> b!259081 d!62323))

(declare-fun d!62341 () Bool)

(declare-fun e!168111 () Bool)

(assert (=> d!62341 e!168111))

(declare-fun res!126817 () Bool)

(assert (=> d!62341 (=> res!126817 e!168111)))

(declare-fun lt!130715 () Bool)

(assert (=> d!62341 (= res!126817 (not lt!130715))))

(declare-fun lt!130714 () Bool)

(assert (=> d!62341 (= lt!130715 lt!130714)))

(declare-fun lt!130717 () Unit!8017)

(declare-fun e!168112 () Unit!8017)

(assert (=> d!62341 (= lt!130717 e!168112)))

(declare-fun c!44028 () Bool)

(assert (=> d!62341 (= c!44028 lt!130714)))

(assert (=> d!62341 (= lt!130714 (containsKey!306 (toList!1897 lt!130536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62341 (= (contains!1858 lt!130536 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130715)))

(declare-fun b!259405 () Bool)

(declare-fun lt!130716 () Unit!8017)

(assert (=> b!259405 (= e!168112 lt!130716)))

(assert (=> b!259405 (= lt!130716 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259405 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259406 () Bool)

(declare-fun Unit!8039 () Unit!8017)

(assert (=> b!259406 (= e!168112 Unit!8039)))

(declare-fun b!259407 () Bool)

(assert (=> b!259407 (= e!168111 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62341 c!44028) b!259405))

(assert (= (and d!62341 (not c!44028)) b!259406))

(assert (= (and d!62341 (not res!126817)) b!259407))

(declare-fun m!275101 () Bool)

(assert (=> d!62341 m!275101))

(declare-fun m!275103 () Bool)

(assert (=> b!259405 m!275103))

(assert (=> b!259405 m!275087))

(assert (=> b!259405 m!275087))

(declare-fun m!275105 () Bool)

(assert (=> b!259405 m!275105))

(assert (=> b!259407 m!275087))

(assert (=> b!259407 m!275087))

(assert (=> b!259407 m!275105))

(assert (=> bm!24639 d!62341))

(assert (=> b!259049 d!62307))

(declare-fun d!62343 () Bool)

(declare-fun e!168113 () Bool)

(assert (=> d!62343 e!168113))

(declare-fun res!126818 () Bool)

(assert (=> d!62343 (=> res!126818 e!168113)))

(declare-fun lt!130719 () Bool)

(assert (=> d!62343 (= res!126818 (not lt!130719))))

(declare-fun lt!130718 () Bool)

(assert (=> d!62343 (= lt!130719 lt!130718)))

(declare-fun lt!130721 () Unit!8017)

(declare-fun e!168114 () Unit!8017)

(assert (=> d!62343 (= lt!130721 e!168114)))

(declare-fun c!44029 () Bool)

(assert (=> d!62343 (= c!44029 lt!130718)))

(assert (=> d!62343 (= lt!130718 (containsKey!306 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> d!62343 (= (contains!1858 lt!130591 (_1!2435 (tuple2!4849 key!932 v!346))) lt!130719)))

(declare-fun b!259408 () Bool)

(declare-fun lt!130720 () Unit!8017)

(assert (=> b!259408 (= e!168114 lt!130720)))

(assert (=> b!259408 (= lt!130720 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346))))))

(assert (=> b!259408 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun b!259409 () Bool)

(declare-fun Unit!8040 () Unit!8017)

(assert (=> b!259409 (= e!168114 Unit!8040)))

(declare-fun b!259410 () Bool)

(assert (=> b!259410 (= e!168113 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(assert (= (and d!62343 c!44029) b!259408))

(assert (= (and d!62343 (not c!44029)) b!259409))

(assert (= (and d!62343 (not res!126818)) b!259410))

(declare-fun m!275107 () Bool)

(assert (=> d!62343 m!275107))

(declare-fun m!275109 () Bool)

(assert (=> b!259408 m!275109))

(assert (=> b!259408 m!274831))

(assert (=> b!259408 m!274831))

(declare-fun m!275111 () Bool)

(assert (=> b!259408 m!275111))

(assert (=> b!259410 m!274831))

(assert (=> b!259410 m!274831))

(assert (=> b!259410 m!275111))

(assert (=> d!62241 d!62343))

(declare-fun d!62345 () Bool)

(declare-fun c!44034 () Bool)

(assert (=> d!62345 (= c!44034 (and ((_ is Cons!3722) lt!130593) (= (_1!2435 (h!4385 lt!130593)) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun e!168119 () Option!321)

(assert (=> d!62345 (= (getValueByKey!315 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346))) e!168119)))

(declare-fun b!259420 () Bool)

(declare-fun e!168120 () Option!321)

(assert (=> b!259420 (= e!168119 e!168120)))

(declare-fun c!44035 () Bool)

(assert (=> b!259420 (= c!44035 (and ((_ is Cons!3722) lt!130593) (not (= (_1!2435 (h!4385 lt!130593)) (_1!2435 (tuple2!4849 key!932 v!346))))))))

(declare-fun b!259421 () Bool)

(assert (=> b!259421 (= e!168120 (getValueByKey!315 (t!8783 lt!130593) (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun b!259419 () Bool)

(assert (=> b!259419 (= e!168119 (Some!320 (_2!2435 (h!4385 lt!130593))))))

(declare-fun b!259422 () Bool)

(assert (=> b!259422 (= e!168120 None!319)))

(assert (= (and d!62345 c!44034) b!259419))

(assert (= (and d!62345 (not c!44034)) b!259420))

(assert (= (and b!259420 c!44035) b!259421))

(assert (= (and b!259420 (not c!44035)) b!259422))

(declare-fun m!275113 () Bool)

(assert (=> b!259421 m!275113))

(assert (=> d!62241 d!62345))

(declare-fun d!62347 () Bool)

(assert (=> d!62347 (= (getValueByKey!315 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346))) (Some!320 (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun lt!130724 () Unit!8017)

(declare-fun choose!1263 (List!3726 (_ BitVec 64) V!8457) Unit!8017)

(assert (=> d!62347 (= lt!130724 (choose!1263 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun e!168123 () Bool)

(assert (=> d!62347 e!168123))

(declare-fun res!126823 () Bool)

(assert (=> d!62347 (=> (not res!126823) (not e!168123))))

(declare-fun isStrictlySorted!361 (List!3726) Bool)

(assert (=> d!62347 (= res!126823 (isStrictlySorted!361 lt!130593))))

(assert (=> d!62347 (= (lemmaContainsTupThenGetReturnValue!171 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))) lt!130724)))

(declare-fun b!259427 () Bool)

(declare-fun res!126824 () Bool)

(assert (=> b!259427 (=> (not res!126824) (not e!168123))))

(assert (=> b!259427 (= res!126824 (containsKey!306 lt!130593 (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun b!259428 () Bool)

(assert (=> b!259428 (= e!168123 (contains!1861 lt!130593 (tuple2!4849 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346)))))))

(assert (= (and d!62347 res!126823) b!259427))

(assert (= (and b!259427 res!126824) b!259428))

(assert (=> d!62347 m!274825))

(declare-fun m!275115 () Bool)

(assert (=> d!62347 m!275115))

(declare-fun m!275117 () Bool)

(assert (=> d!62347 m!275117))

(declare-fun m!275119 () Bool)

(assert (=> b!259427 m!275119))

(declare-fun m!275121 () Bool)

(assert (=> b!259428 m!275121))

(assert (=> d!62241 d!62347))

(declare-fun bm!24687 () Bool)

(declare-fun call!24691 () List!3726)

(declare-fun call!24690 () List!3726)

(assert (=> bm!24687 (= call!24691 call!24690)))

(declare-fun bm!24688 () Bool)

(declare-fun call!24692 () List!3726)

(assert (=> bm!24688 (= call!24692 call!24691)))

(declare-fun b!259450 () Bool)

(declare-fun e!168137 () List!3726)

(assert (=> b!259450 (= e!168137 call!24691)))

(declare-fun lt!130727 () List!3726)

(declare-fun b!259451 () Bool)

(declare-fun e!168136 () Bool)

(assert (=> b!259451 (= e!168136 (contains!1861 lt!130727 (tuple2!4849 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun e!168134 () List!3726)

(declare-fun b!259452 () Bool)

(assert (=> b!259452 (= e!168134 (insertStrictlySorted!174 (t!8783 (toList!1897 lt!130348)) (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun c!44047 () Bool)

(declare-fun bm!24689 () Bool)

(declare-fun $colon$colon!104 (List!3726 tuple2!4848) List!3726)

(assert (=> bm!24689 (= call!24690 ($colon$colon!104 e!168134 (ite c!44047 (h!4385 (toList!1897 lt!130348)) (tuple2!4849 (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))))))))

(declare-fun c!44046 () Bool)

(assert (=> bm!24689 (= c!44046 c!44047)))

(declare-fun d!62349 () Bool)

(assert (=> d!62349 e!168136))

(declare-fun res!126830 () Bool)

(assert (=> d!62349 (=> (not res!126830) (not e!168136))))

(assert (=> d!62349 (= res!126830 (isStrictlySorted!361 lt!130727))))

(declare-fun e!168138 () List!3726)

(assert (=> d!62349 (= lt!130727 e!168138)))

(assert (=> d!62349 (= c!44047 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (bvslt (_1!2435 (h!4385 (toList!1897 lt!130348))) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(assert (=> d!62349 (isStrictlySorted!361 (toList!1897 lt!130348))))

(assert (=> d!62349 (= (insertStrictlySorted!174 (toList!1897 lt!130348) (_1!2435 (tuple2!4849 key!932 v!346)) (_2!2435 (tuple2!4849 key!932 v!346))) lt!130727)))

(declare-fun b!259449 () Bool)

(declare-fun e!168135 () List!3726)

(assert (=> b!259449 (= e!168135 call!24692)))

(declare-fun b!259453 () Bool)

(assert (=> b!259453 (= e!168138 call!24690)))

(declare-fun b!259454 () Bool)

(assert (=> b!259454 (= e!168135 call!24692)))

(declare-fun b!259455 () Bool)

(assert (=> b!259455 (= e!168138 e!168137)))

(declare-fun c!44045 () Bool)

(assert (=> b!259455 (= c!44045 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (= (_1!2435 (h!4385 (toList!1897 lt!130348))) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun b!259456 () Bool)

(declare-fun res!126829 () Bool)

(assert (=> b!259456 (=> (not res!126829) (not e!168136))))

(assert (=> b!259456 (= res!126829 (containsKey!306 lt!130727 (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun c!44044 () Bool)

(declare-fun b!259457 () Bool)

(assert (=> b!259457 (= e!168134 (ite c!44045 (t!8783 (toList!1897 lt!130348)) (ite c!44044 (Cons!3722 (h!4385 (toList!1897 lt!130348)) (t!8783 (toList!1897 lt!130348))) Nil!3723)))))

(declare-fun b!259458 () Bool)

(assert (=> b!259458 (= c!44044 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (bvsgt (_1!2435 (h!4385 (toList!1897 lt!130348))) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(assert (=> b!259458 (= e!168137 e!168135)))

(assert (= (and d!62349 c!44047) b!259453))

(assert (= (and d!62349 (not c!44047)) b!259455))

(assert (= (and b!259455 c!44045) b!259450))

(assert (= (and b!259455 (not c!44045)) b!259458))

(assert (= (and b!259458 c!44044) b!259454))

(assert (= (and b!259458 (not c!44044)) b!259449))

(assert (= (or b!259454 b!259449) bm!24688))

(assert (= (or b!259450 bm!24688) bm!24687))

(assert (= (or b!259453 bm!24687) bm!24689))

(assert (= (and bm!24689 c!44046) b!259452))

(assert (= (and bm!24689 (not c!44046)) b!259457))

(assert (= (and d!62349 res!126830) b!259456))

(assert (= (and b!259456 res!126829) b!259451))

(declare-fun m!275123 () Bool)

(assert (=> bm!24689 m!275123))

(declare-fun m!275125 () Bool)

(assert (=> b!259451 m!275125))

(declare-fun m!275127 () Bool)

(assert (=> d!62349 m!275127))

(declare-fun m!275129 () Bool)

(assert (=> d!62349 m!275129))

(declare-fun m!275131 () Bool)

(assert (=> b!259452 m!275131))

(declare-fun m!275133 () Bool)

(assert (=> b!259456 m!275133))

(assert (=> d!62241 d!62349))

(declare-fun d!62351 () Bool)

(declare-fun lt!130730 () Bool)

(declare-fun content!172 (List!3727) (InoxSet (_ BitVec 64)))

(assert (=> d!62351 (= lt!130730 (select (content!172 Nil!3724) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun e!168143 () Bool)

(assert (=> d!62351 (= lt!130730 e!168143)))

(declare-fun res!126836 () Bool)

(assert (=> d!62351 (=> (not res!126836) (not e!168143))))

(assert (=> d!62351 (= res!126836 ((_ is Cons!3723) Nil!3724))))

(assert (=> d!62351 (= (contains!1860 Nil!3724 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) lt!130730)))

(declare-fun b!259463 () Bool)

(declare-fun e!168144 () Bool)

(assert (=> b!259463 (= e!168143 e!168144)))

(declare-fun res!126835 () Bool)

(assert (=> b!259463 (=> res!126835 e!168144)))

(assert (=> b!259463 (= res!126835 (= (h!4386 Nil!3724) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(declare-fun b!259464 () Bool)

(assert (=> b!259464 (= e!168144 (contains!1860 (t!8784 Nil!3724) (select (arr!5948 lt!130349) #b00000000000000000000000000000000)))))

(assert (= (and d!62351 res!126836) b!259463))

(assert (= (and b!259463 (not res!126835)) b!259464))

(declare-fun m!275135 () Bool)

(assert (=> d!62351 m!275135))

(assert (=> d!62351 m!274729))

(declare-fun m!275137 () Bool)

(assert (=> d!62351 m!275137))

(assert (=> b!259464 m!274729))

(declare-fun m!275139 () Bool)

(assert (=> b!259464 m!275139))

(assert (=> b!259083 d!62351))

(declare-fun d!62353 () Bool)

(declare-fun isEmpty!541 (Option!321) Bool)

(assert (=> d!62353 (= (isDefined!255 (getValueByKey!315 (toList!1897 lt!130348) key!932)) (not (isEmpty!541 (getValueByKey!315 (toList!1897 lt!130348) key!932))))))

(declare-fun bs!9154 () Bool)

(assert (= bs!9154 d!62353))

(assert (=> bs!9154 m!274667))

(declare-fun m!275141 () Bool)

(assert (=> bs!9154 m!275141))

(assert (=> b!259004 d!62353))

(declare-fun d!62355 () Bool)

(declare-fun c!44048 () Bool)

(assert (=> d!62355 (= c!44048 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (= (_1!2435 (h!4385 (toList!1897 lt!130348))) key!932)))))

(declare-fun e!168145 () Option!321)

(assert (=> d!62355 (= (getValueByKey!315 (toList!1897 lt!130348) key!932) e!168145)))

(declare-fun b!259466 () Bool)

(declare-fun e!168146 () Option!321)

(assert (=> b!259466 (= e!168145 e!168146)))

(declare-fun c!44049 () Bool)

(assert (=> b!259466 (= c!44049 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (not (= (_1!2435 (h!4385 (toList!1897 lt!130348))) key!932))))))

(declare-fun b!259467 () Bool)

(assert (=> b!259467 (= e!168146 (getValueByKey!315 (t!8783 (toList!1897 lt!130348)) key!932))))

(declare-fun b!259465 () Bool)

(assert (=> b!259465 (= e!168145 (Some!320 (_2!2435 (h!4385 (toList!1897 lt!130348)))))))

(declare-fun b!259468 () Bool)

(assert (=> b!259468 (= e!168146 None!319)))

(assert (= (and d!62355 c!44048) b!259465))

(assert (= (and d!62355 (not c!44048)) b!259466))

(assert (= (and b!259466 c!44049) b!259467))

(assert (= (and b!259466 (not c!44049)) b!259468))

(declare-fun m!275143 () Bool)

(assert (=> b!259467 m!275143))

(assert (=> b!259004 d!62355))

(declare-fun bm!24690 () Bool)

(declare-fun call!24693 () (_ BitVec 32))

(assert (=> bm!24690 (= call!24693 (arrayCountValidKeys!0 (_keys!6947 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun d!62357 () Bool)

(declare-fun lt!130731 () (_ BitVec 32))

(assert (=> d!62357 (and (bvsge lt!130731 #b00000000000000000000000000000000) (bvsle lt!130731 (bvsub (size!6296 (_keys!6947 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168147 () (_ BitVec 32))

(assert (=> d!62357 (= lt!130731 e!168147)))

(declare-fun c!44050 () Bool)

(assert (=> d!62357 (= c!44050 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62357 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6296 (_keys!6947 thiss!1504)) (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62357 (= (arrayCountValidKeys!0 (_keys!6947 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))) lt!130731)))

(declare-fun b!259469 () Bool)

(declare-fun e!168148 () (_ BitVec 32))

(assert (=> b!259469 (= e!168148 call!24693)))

(declare-fun b!259470 () Bool)

(assert (=> b!259470 (= e!168148 (bvadd #b00000000000000000000000000000001 call!24693))))

(declare-fun b!259471 () Bool)

(assert (=> b!259471 (= e!168147 #b00000000000000000000000000000000)))

(declare-fun b!259472 () Bool)

(assert (=> b!259472 (= e!168147 e!168148)))

(declare-fun c!44051 () Bool)

(assert (=> b!259472 (= c!44051 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62357 c!44050) b!259471))

(assert (= (and d!62357 (not c!44050)) b!259472))

(assert (= (and b!259472 c!44051) b!259470))

(assert (= (and b!259472 (not c!44051)) b!259469))

(assert (= (or b!259470 b!259469) bm!24690))

(declare-fun m!275145 () Bool)

(assert (=> bm!24690 m!275145))

(assert (=> b!259472 m!274949))

(assert (=> b!259472 m!274949))

(declare-fun m!275147 () Bool)

(assert (=> b!259472 m!275147))

(assert (=> bm!24659 d!62357))

(declare-fun d!62359 () Bool)

(assert (=> d!62359 (= (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) index!297)) (and (not (= (select (arr!5948 (_keys!6947 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5948 (_keys!6947 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259151 d!62359))

(declare-fun d!62361 () Bool)

(assert (=> d!62361 (= (validKeyInArray!0 (select (arr!5948 lt!130349) index!297)) (and (not (= (select (arr!5948 lt!130349) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5948 lt!130349) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259122 d!62361))

(declare-fun bm!24691 () Bool)

(declare-fun call!24694 () (_ BitVec 32))

(assert (=> bm!24691 (= call!24694 (arrayCountValidKeys!0 lt!130349 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun d!62363 () Bool)

(declare-fun lt!130732 () (_ BitVec 32))

(assert (=> d!62363 (and (bvsge lt!130732 #b00000000000000000000000000000000) (bvsle lt!130732 (bvsub (size!6296 lt!130349) index!297)))))

(declare-fun e!168149 () (_ BitVec 32))

(assert (=> d!62363 (= lt!130732 e!168149)))

(declare-fun c!44052 () Bool)

(assert (=> d!62363 (= c!44052 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62363 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6296 lt!130349)))))

(assert (=> d!62363 (= (arrayCountValidKeys!0 lt!130349 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!130732)))

(declare-fun b!259473 () Bool)

(declare-fun e!168150 () (_ BitVec 32))

(assert (=> b!259473 (= e!168150 call!24694)))

(declare-fun b!259474 () Bool)

(assert (=> b!259474 (= e!168150 (bvadd #b00000000000000000000000000000001 call!24694))))

(declare-fun b!259475 () Bool)

(assert (=> b!259475 (= e!168149 #b00000000000000000000000000000000)))

(declare-fun b!259476 () Bool)

(assert (=> b!259476 (= e!168149 e!168150)))

(declare-fun c!44053 () Bool)

(assert (=> b!259476 (= c!44053 (validKeyInArray!0 (select (arr!5948 lt!130349) index!297)))))

(assert (= (and d!62363 c!44052) b!259475))

(assert (= (and d!62363 (not c!44052)) b!259476))

(assert (= (and b!259476 c!44053) b!259474))

(assert (= (and b!259476 (not c!44053)) b!259473))

(assert (= (or b!259474 b!259473) bm!24691))

(declare-fun m!275149 () Bool)

(assert (=> bm!24691 m!275149))

(assert (=> b!259476 m!274801))

(assert (=> b!259476 m!274801))

(assert (=> b!259476 m!274803))

(assert (=> d!62231 d!62363))

(declare-fun d!62365 () Bool)

(assert (=> d!62365 (= (arrayCountValidKeys!0 lt!130349 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62365 true))

(declare-fun _$85!24 () Unit!8017)

(assert (=> d!62365 (= (choose!2 lt!130349 index!297) _$85!24)))

(declare-fun bs!9155 () Bool)

(assert (= bs!9155 d!62365))

(assert (=> bs!9155 m!274797))

(assert (=> d!62231 d!62365))

(assert (=> b!259185 d!62249))

(declare-fun d!62367 () Bool)

(assert (=> d!62367 (= (apply!256 lt!130567 (select (arr!5948 lt!130349) #b00000000000000000000000000000000)) (get!3069 (getValueByKey!315 (toList!1897 lt!130567) (select (arr!5948 lt!130349) #b00000000000000000000000000000000))))))

(declare-fun bs!9156 () Bool)

(assert (= bs!9156 d!62367))

(assert (=> bs!9156 m!274729))

(assert (=> bs!9156 m!274967))

(assert (=> bs!9156 m!274967))

(declare-fun m!275151 () Bool)

(assert (=> bs!9156 m!275151))

(assert (=> b!259114 d!62367))

(declare-fun c!44054 () Bool)

(declare-fun d!62369 () Bool)

(assert (=> d!62369 (= c!44054 ((_ is ValueCellFull!2960) (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168151 () V!8457)

(assert (=> d!62369 (= (get!3068 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168151)))

(declare-fun b!259477 () Bool)

(assert (=> b!259477 (= e!168151 (get!3070 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259478 () Bool)

(assert (=> b!259478 (= e!168151 (get!3071 (select (arr!5947 (array!12562 (store (arr!5947 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6295 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62369 c!44054) b!259477))

(assert (= (and d!62369 (not c!44054)) b!259478))

(assert (=> b!259477 m!274745))

(assert (=> b!259477 m!274675))

(declare-fun m!275153 () Bool)

(assert (=> b!259477 m!275153))

(assert (=> b!259478 m!274745))

(assert (=> b!259478 m!274675))

(declare-fun m!275155 () Bool)

(assert (=> b!259478 m!275155))

(assert (=> b!259114 d!62369))

(declare-fun d!62371 () Bool)

(declare-fun e!168152 () Bool)

(assert (=> d!62371 e!168152))

(declare-fun res!126838 () Bool)

(assert (=> d!62371 (=> (not res!126838) (not e!168152))))

(declare-fun lt!130733 () ListLongMap!3763)

(assert (=> d!62371 (= res!126838 (contains!1858 lt!130733 (_1!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun lt!130735 () List!3726)

(assert (=> d!62371 (= lt!130733 (ListLongMap!3764 lt!130735))))

(declare-fun lt!130734 () Unit!8017)

(declare-fun lt!130736 () Unit!8017)

(assert (=> d!62371 (= lt!130734 lt!130736)))

(assert (=> d!62371 (= (getValueByKey!315 lt!130735 (_1!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!320 (_2!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62371 (= lt!130736 (lemmaContainsTupThenGetReturnValue!171 lt!130735 (_1!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62371 (= lt!130735 (insertStrictlySorted!174 (toList!1897 (ite c!43945 call!24642 (ite c!43941 call!24638 call!24639))) (_1!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62371 (= (+!694 (ite c!43945 call!24642 (ite c!43941 call!24638 call!24639)) (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) lt!130733)))

(declare-fun b!259479 () Bool)

(declare-fun res!126837 () Bool)

(assert (=> b!259479 (=> (not res!126837) (not e!168152))))

(assert (=> b!259479 (= res!126837 (= (getValueByKey!315 (toList!1897 lt!130733) (_1!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!320 (_2!2435 (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))))

(declare-fun b!259480 () Bool)

(assert (=> b!259480 (= e!168152 (contains!1861 (toList!1897 lt!130733) (ite (or c!43945 c!43941) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (= (and d!62371 res!126838) b!259479))

(assert (= (and b!259479 res!126837) b!259480))

(declare-fun m!275157 () Bool)

(assert (=> d!62371 m!275157))

(declare-fun m!275159 () Bool)

(assert (=> d!62371 m!275159))

(declare-fun m!275161 () Bool)

(assert (=> d!62371 m!275161))

(declare-fun m!275163 () Bool)

(assert (=> d!62371 m!275163))

(declare-fun m!275165 () Bool)

(assert (=> b!259479 m!275165))

(declare-fun m!275167 () Bool)

(assert (=> b!259480 m!275167))

(assert (=> bm!24636 d!62371))

(assert (=> b!259111 d!62323))

(declare-fun d!62373 () Bool)

(assert (=> d!62373 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130348) key!932))))

(declare-fun lt!130739 () Unit!8017)

(declare-fun choose!1264 (List!3726 (_ BitVec 64)) Unit!8017)

(assert (=> d!62373 (= lt!130739 (choose!1264 (toList!1897 lt!130348) key!932))))

(declare-fun e!168155 () Bool)

(assert (=> d!62373 e!168155))

(declare-fun res!126841 () Bool)

(assert (=> d!62373 (=> (not res!126841) (not e!168155))))

(assert (=> d!62373 (= res!126841 (isStrictlySorted!361 (toList!1897 lt!130348)))))

(assert (=> d!62373 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130348) key!932) lt!130739)))

(declare-fun b!259483 () Bool)

(assert (=> b!259483 (= e!168155 (containsKey!306 (toList!1897 lt!130348) key!932))))

(assert (= (and d!62373 res!126841) b!259483))

(assert (=> d!62373 m!274667))

(assert (=> d!62373 m!274667))

(assert (=> d!62373 m!274669))

(declare-fun m!275169 () Bool)

(assert (=> d!62373 m!275169))

(assert (=> d!62373 m!275129))

(assert (=> b!259483 m!274663))

(assert (=> b!259002 d!62373))

(assert (=> b!259002 d!62353))

(assert (=> b!259002 d!62355))

(declare-fun d!62375 () Bool)

(declare-fun e!168156 () Bool)

(assert (=> d!62375 e!168156))

(declare-fun res!126843 () Bool)

(assert (=> d!62375 (=> (not res!126843) (not e!168156))))

(declare-fun lt!130740 () ListLongMap!3763)

(assert (=> d!62375 (= res!126843 (contains!1858 lt!130740 (_1!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130742 () List!3726)

(assert (=> d!62375 (= lt!130740 (ListLongMap!3764 lt!130742))))

(declare-fun lt!130741 () Unit!8017)

(declare-fun lt!130743 () Unit!8017)

(assert (=> d!62375 (= lt!130741 lt!130743)))

(assert (=> d!62375 (= (getValueByKey!315 lt!130742 (_1!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))))))

(assert (=> d!62375 (= lt!130743 (lemmaContainsTupThenGetReturnValue!171 lt!130742 (_1!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))))))

(assert (=> d!62375 (= lt!130742 (insertStrictlySorted!174 (toList!1897 lt!130518) (_1!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))))))

(assert (=> d!62375 (= (+!694 lt!130518 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) lt!130740)))

(declare-fun b!259484 () Bool)

(declare-fun res!126842 () Bool)

(assert (=> b!259484 (=> (not res!126842) (not e!168156))))

(assert (=> b!259484 (= res!126842 (= (getValueByKey!315 (toList!1897 lt!130740) (_1!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))))))))

(declare-fun b!259485 () Bool)

(assert (=> b!259485 (= e!168156 (contains!1861 (toList!1897 lt!130740) (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))))))

(assert (= (and d!62375 res!126843) b!259484))

(assert (= (and b!259484 res!126842) b!259485))

(declare-fun m!275171 () Bool)

(assert (=> d!62375 m!275171))

(declare-fun m!275173 () Bool)

(assert (=> d!62375 m!275173))

(declare-fun m!275175 () Bool)

(assert (=> d!62375 m!275175))

(declare-fun m!275177 () Bool)

(assert (=> d!62375 m!275177))

(declare-fun m!275179 () Bool)

(assert (=> b!259484 m!275179))

(declare-fun m!275181 () Bool)

(assert (=> b!259485 m!275181))

(assert (=> b!259067 d!62375))

(declare-fun d!62377 () Bool)

(assert (=> d!62377 (contains!1858 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) lt!130519)))

(declare-fun lt!130746 () Unit!8017)

(declare-fun choose!1265 (ListLongMap!3763 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8017)

(assert (=> d!62377 (= lt!130746 (choose!1265 lt!130530 lt!130525 (zeroValue!4614 thiss!1504) lt!130519))))

(assert (=> d!62377 (contains!1858 lt!130530 lt!130519)))

(assert (=> d!62377 (= (addStillContains!232 lt!130530 lt!130525 (zeroValue!4614 thiss!1504) lt!130519) lt!130746)))

(declare-fun bs!9157 () Bool)

(assert (= bs!9157 d!62377))

(assert (=> bs!9157 m!274715))

(assert (=> bs!9157 m!274715))

(assert (=> bs!9157 m!274719))

(declare-fun m!275183 () Bool)

(assert (=> bs!9157 m!275183))

(declare-fun m!275185 () Bool)

(assert (=> bs!9157 m!275185))

(assert (=> b!259067 d!62377))

(declare-fun d!62379 () Bool)

(assert (=> d!62379 (= (apply!256 (+!694 lt!130520 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) lt!130538) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130520 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))) lt!130538)))))

(declare-fun bs!9158 () Bool)

(assert (= bs!9158 d!62379))

(declare-fun m!275187 () Bool)

(assert (=> bs!9158 m!275187))

(assert (=> bs!9158 m!275187))

(declare-fun m!275189 () Bool)

(assert (=> bs!9158 m!275189))

(assert (=> b!259067 d!62379))

(declare-fun d!62381 () Bool)

(assert (=> d!62381 (= (apply!256 (+!694 lt!130529 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) lt!130535) (apply!256 lt!130529 lt!130535))))

(declare-fun lt!130749 () Unit!8017)

(declare-fun choose!1266 (ListLongMap!3763 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8017)

(assert (=> d!62381 (= lt!130749 (choose!1266 lt!130529 lt!130527 (minValue!4614 thiss!1504) lt!130535))))

(declare-fun e!168159 () Bool)

(assert (=> d!62381 e!168159))

(declare-fun res!126846 () Bool)

(assert (=> d!62381 (=> (not res!126846) (not e!168159))))

(assert (=> d!62381 (= res!126846 (contains!1858 lt!130529 lt!130535))))

(assert (=> d!62381 (= (addApplyDifferent!232 lt!130529 lt!130527 (minValue!4614 thiss!1504) lt!130535) lt!130749)))

(declare-fun b!259490 () Bool)

(assert (=> b!259490 (= e!168159 (not (= lt!130535 lt!130527)))))

(assert (= (and d!62381 res!126846) b!259490))

(declare-fun m!275191 () Bool)

(assert (=> d!62381 m!275191))

(declare-fun m!275193 () Bool)

(assert (=> d!62381 m!275193))

(assert (=> d!62381 m!274711))

(assert (=> d!62381 m!274713))

(assert (=> d!62381 m!274711))

(assert (=> d!62381 m!274697))

(assert (=> b!259067 d!62381))

(declare-fun d!62383 () Bool)

(assert (=> d!62383 (= (apply!256 (+!694 lt!130529 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) lt!130535) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130529 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))) lt!130535)))))

(declare-fun bs!9159 () Bool)

(assert (= bs!9159 d!62383))

(declare-fun m!275195 () Bool)

(assert (=> bs!9159 m!275195))

(assert (=> bs!9159 m!275195))

(declare-fun m!275197 () Bool)

(assert (=> bs!9159 m!275197))

(assert (=> b!259067 d!62383))

(declare-fun d!62385 () Bool)

(assert (=> d!62385 (= (apply!256 (+!694 lt!130518 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) lt!130534) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130518 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504)))) lt!130534)))))

(declare-fun bs!9160 () Bool)

(assert (= bs!9160 d!62385))

(declare-fun m!275199 () Bool)

(assert (=> bs!9160 m!275199))

(assert (=> bs!9160 m!275199))

(declare-fun m!275201 () Bool)

(assert (=> bs!9160 m!275201))

(assert (=> b!259067 d!62385))

(declare-fun b!259491 () Bool)

(declare-fun e!168163 () Bool)

(declare-fun e!168162 () Bool)

(assert (=> b!259491 (= e!168163 e!168162)))

(declare-fun c!44057 () Bool)

(assert (=> b!259491 (= c!44057 (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun b!259492 () Bool)

(declare-fun e!168161 () ListLongMap!3763)

(assert (=> b!259492 (= e!168161 (ListLongMap!3764 Nil!3723))))

(declare-fun b!259493 () Bool)

(assert (=> b!259493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> b!259493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6295 (_values!4756 thiss!1504))))))

(declare-fun e!168166 () Bool)

(declare-fun lt!130750 () ListLongMap!3763)

(assert (=> b!259493 (= e!168166 (= (apply!256 lt!130750 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)) (get!3068 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!62387 () Bool)

(declare-fun e!168160 () Bool)

(assert (=> d!62387 e!168160))

(declare-fun res!126849 () Bool)

(assert (=> d!62387 (=> (not res!126849) (not e!168160))))

(assert (=> d!62387 (= res!126849 (not (contains!1858 lt!130750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62387 (= lt!130750 e!168161)))

(declare-fun c!44056 () Bool)

(assert (=> d!62387 (= c!44056 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62387 (validMask!0 (mask!11081 thiss!1504))))

(assert (=> d!62387 (= (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130750)))

(declare-fun b!259494 () Bool)

(declare-fun lt!130753 () Unit!8017)

(declare-fun lt!130756 () Unit!8017)

(assert (=> b!259494 (= lt!130753 lt!130756)))

(declare-fun lt!130755 () (_ BitVec 64))

(declare-fun lt!130751 () (_ BitVec 64))

(declare-fun lt!130752 () V!8457)

(declare-fun lt!130754 () ListLongMap!3763)

(assert (=> b!259494 (not (contains!1858 (+!694 lt!130754 (tuple2!4849 lt!130755 lt!130752)) lt!130751))))

(assert (=> b!259494 (= lt!130756 (addStillNotContains!128 lt!130754 lt!130755 lt!130752 lt!130751))))

(assert (=> b!259494 (= lt!130751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259494 (= lt!130752 (get!3068 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259494 (= lt!130755 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!24695 () ListLongMap!3763)

(assert (=> b!259494 (= lt!130754 call!24695)))

(declare-fun e!168164 () ListLongMap!3763)

(assert (=> b!259494 (= e!168164 (+!694 call!24695 (tuple2!4849 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000) (get!3068 (select (arr!5947 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259495 () Bool)

(declare-fun res!126848 () Bool)

(assert (=> b!259495 (=> (not res!126848) (not e!168160))))

(assert (=> b!259495 (= res!126848 (not (contains!1858 lt!130750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259496 () Bool)

(assert (=> b!259496 (= e!168161 e!168164)))

(declare-fun c!44055 () Bool)

(assert (=> b!259496 (= c!44055 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259497 () Bool)

(declare-fun e!168165 () Bool)

(assert (=> b!259497 (= e!168165 (validKeyInArray!0 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259497 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259498 () Bool)

(assert (=> b!259498 (= e!168162 (= lt!130750 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504))))))

(declare-fun b!259499 () Bool)

(assert (=> b!259499 (= e!168160 e!168163)))

(declare-fun c!44058 () Bool)

(assert (=> b!259499 (= c!44058 e!168165)))

(declare-fun res!126847 () Bool)

(assert (=> b!259499 (=> (not res!126847) (not e!168165))))

(assert (=> b!259499 (= res!126847 (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun bm!24692 () Bool)

(assert (=> bm!24692 (= call!24695 (getCurrentListMapNoExtraKeys!572 (_keys!6947 thiss!1504) (_values!4756 thiss!1504) (mask!11081 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259500 () Bool)

(assert (=> b!259500 (= e!168163 e!168166)))

(assert (=> b!259500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun res!126850 () Bool)

(assert (=> b!259500 (= res!126850 (contains!1858 lt!130750 (select (arr!5948 (_keys!6947 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259500 (=> (not res!126850) (not e!168166))))

(declare-fun b!259501 () Bool)

(assert (=> b!259501 (= e!168164 call!24695)))

(declare-fun b!259502 () Bool)

(assert (=> b!259502 (= e!168162 (isEmpty!540 lt!130750))))

(assert (= (and d!62387 c!44056) b!259492))

(assert (= (and d!62387 (not c!44056)) b!259496))

(assert (= (and b!259496 c!44055) b!259494))

(assert (= (and b!259496 (not c!44055)) b!259501))

(assert (= (or b!259494 b!259501) bm!24692))

(assert (= (and d!62387 res!126849) b!259495))

(assert (= (and b!259495 res!126848) b!259499))

(assert (= (and b!259499 res!126847) b!259497))

(assert (= (and b!259499 c!44058) b!259500))

(assert (= (and b!259499 (not c!44058)) b!259491))

(assert (= (and b!259500 res!126850) b!259493))

(assert (= (and b!259491 c!44057) b!259498))

(assert (= (and b!259491 (not c!44057)) b!259502))

(declare-fun b_lambda!8259 () Bool)

(assert (=> (not b_lambda!8259) (not b!259493)))

(assert (=> b!259493 t!8788))

(declare-fun b_and!13863 () Bool)

(assert (= b_and!13861 (and (=> t!8788 result!5389) b_and!13863)))

(declare-fun b_lambda!8261 () Bool)

(assert (=> (not b_lambda!8261) (not b!259494)))

(assert (=> b!259494 t!8788))

(declare-fun b_and!13865 () Bool)

(assert (= b_and!13863 (and (=> t!8788 result!5389) b_and!13865)))

(declare-fun m!275203 () Bool)

(assert (=> d!62387 m!275203))

(assert (=> d!62387 m!274445))

(declare-fun m!275205 () Bool)

(assert (=> b!259502 m!275205))

(assert (=> b!259494 m!274677))

(assert (=> b!259494 m!274675))

(assert (=> b!259494 m!274679))

(assert (=> b!259494 m!274671))

(declare-fun m!275207 () Bool)

(assert (=> b!259494 m!275207))

(assert (=> b!259494 m!275207))

(declare-fun m!275209 () Bool)

(assert (=> b!259494 m!275209))

(declare-fun m!275211 () Bool)

(assert (=> b!259494 m!275211))

(declare-fun m!275213 () Bool)

(assert (=> b!259494 m!275213))

(assert (=> b!259494 m!274677))

(assert (=> b!259494 m!274675))

(declare-fun m!275215 () Bool)

(assert (=> b!259495 m!275215))

(declare-fun m!275217 () Bool)

(assert (=> b!259498 m!275217))

(assert (=> b!259497 m!274671))

(assert (=> b!259497 m!274671))

(assert (=> b!259497 m!274673))

(assert (=> b!259493 m!274677))

(assert (=> b!259493 m!274675))

(assert (=> b!259493 m!274679))

(assert (=> b!259493 m!274671))

(assert (=> b!259493 m!274671))

(declare-fun m!275219 () Bool)

(assert (=> b!259493 m!275219))

(assert (=> b!259493 m!274677))

(assert (=> b!259493 m!274675))

(assert (=> b!259496 m!274671))

(assert (=> b!259496 m!274671))

(assert (=> b!259496 m!274673))

(assert (=> b!259500 m!274671))

(assert (=> b!259500 m!274671))

(declare-fun m!275221 () Bool)

(assert (=> b!259500 m!275221))

(assert (=> bm!24692 m!275217))

(assert (=> b!259067 d!62387))

(declare-fun d!62389 () Bool)

(assert (=> d!62389 (= (apply!256 lt!130529 lt!130535) (get!3069 (getValueByKey!315 (toList!1897 lt!130529) lt!130535)))))

(declare-fun bs!9161 () Bool)

(assert (= bs!9161 d!62389))

(declare-fun m!275223 () Bool)

(assert (=> bs!9161 m!275223))

(assert (=> bs!9161 m!275223))

(declare-fun m!275225 () Bool)

(assert (=> bs!9161 m!275225))

(assert (=> b!259067 d!62389))

(declare-fun d!62391 () Bool)

(assert (=> d!62391 (= (apply!256 lt!130520 lt!130538) (get!3069 (getValueByKey!315 (toList!1897 lt!130520) lt!130538)))))

(declare-fun bs!9162 () Bool)

(assert (= bs!9162 d!62391))

(declare-fun m!275227 () Bool)

(assert (=> bs!9162 m!275227))

(assert (=> bs!9162 m!275227))

(declare-fun m!275229 () Bool)

(assert (=> bs!9162 m!275229))

(assert (=> b!259067 d!62391))

(declare-fun d!62393 () Bool)

(assert (=> d!62393 (= (apply!256 lt!130518 lt!130534) (get!3069 (getValueByKey!315 (toList!1897 lt!130518) lt!130534)))))

(declare-fun bs!9163 () Bool)

(assert (= bs!9163 d!62393))

(declare-fun m!275231 () Bool)

(assert (=> bs!9163 m!275231))

(assert (=> bs!9163 m!275231))

(declare-fun m!275233 () Bool)

(assert (=> bs!9163 m!275233))

(assert (=> b!259067 d!62393))

(declare-fun d!62395 () Bool)

(declare-fun e!168167 () Bool)

(assert (=> d!62395 e!168167))

(declare-fun res!126852 () Bool)

(assert (=> d!62395 (=> (not res!126852) (not e!168167))))

(declare-fun lt!130757 () ListLongMap!3763)

(assert (=> d!62395 (= res!126852 (contains!1858 lt!130757 (_1!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130759 () List!3726)

(assert (=> d!62395 (= lt!130757 (ListLongMap!3764 lt!130759))))

(declare-fun lt!130758 () Unit!8017)

(declare-fun lt!130760 () Unit!8017)

(assert (=> d!62395 (= lt!130758 lt!130760)))

(assert (=> d!62395 (= (getValueByKey!315 lt!130759 (_1!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62395 (= lt!130760 (lemmaContainsTupThenGetReturnValue!171 lt!130759 (_1!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62395 (= lt!130759 (insertStrictlySorted!174 (toList!1897 lt!130530) (_1!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62395 (= (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) lt!130757)))

(declare-fun b!259503 () Bool)

(declare-fun res!126851 () Bool)

(assert (=> b!259503 (=> (not res!126851) (not e!168167))))

(assert (=> b!259503 (= res!126851 (= (getValueByKey!315 (toList!1897 lt!130757) (_1!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259504 () Bool)

(assert (=> b!259504 (= e!168167 (contains!1861 (toList!1897 lt!130757) (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62395 res!126852) b!259503))

(assert (= (and b!259503 res!126851) b!259504))

(declare-fun m!275235 () Bool)

(assert (=> d!62395 m!275235))

(declare-fun m!275237 () Bool)

(assert (=> d!62395 m!275237))

(declare-fun m!275239 () Bool)

(assert (=> d!62395 m!275239))

(declare-fun m!275241 () Bool)

(assert (=> d!62395 m!275241))

(declare-fun m!275243 () Bool)

(assert (=> b!259503 m!275243))

(declare-fun m!275245 () Bool)

(assert (=> b!259504 m!275245))

(assert (=> b!259067 d!62395))

(declare-fun d!62397 () Bool)

(declare-fun e!168168 () Bool)

(assert (=> d!62397 e!168168))

(declare-fun res!126854 () Bool)

(assert (=> d!62397 (=> (not res!126854) (not e!168168))))

(declare-fun lt!130761 () ListLongMap!3763)

(assert (=> d!62397 (= res!126854 (contains!1858 lt!130761 (_1!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130763 () List!3726)

(assert (=> d!62397 (= lt!130761 (ListLongMap!3764 lt!130763))))

(declare-fun lt!130762 () Unit!8017)

(declare-fun lt!130764 () Unit!8017)

(assert (=> d!62397 (= lt!130762 lt!130764)))

(assert (=> d!62397 (= (getValueByKey!315 lt!130763 (_1!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))))))

(assert (=> d!62397 (= lt!130764 (lemmaContainsTupThenGetReturnValue!171 lt!130763 (_1!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))))))

(assert (=> d!62397 (= lt!130763 (insertStrictlySorted!174 (toList!1897 lt!130529) (_1!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))))))

(assert (=> d!62397 (= (+!694 lt!130529 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))) lt!130761)))

(declare-fun b!259505 () Bool)

(declare-fun res!126853 () Bool)

(assert (=> b!259505 (=> (not res!126853) (not e!168168))))

(assert (=> b!259505 (= res!126853 (= (getValueByKey!315 (toList!1897 lt!130761) (_1!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))))))))

(declare-fun b!259506 () Bool)

(assert (=> b!259506 (= e!168168 (contains!1861 (toList!1897 lt!130761) (tuple2!4849 lt!130527 (minValue!4614 thiss!1504))))))

(assert (= (and d!62397 res!126854) b!259505))

(assert (= (and b!259505 res!126853) b!259506))

(declare-fun m!275247 () Bool)

(assert (=> d!62397 m!275247))

(declare-fun m!275249 () Bool)

(assert (=> d!62397 m!275249))

(declare-fun m!275251 () Bool)

(assert (=> d!62397 m!275251))

(declare-fun m!275253 () Bool)

(assert (=> d!62397 m!275253))

(declare-fun m!275255 () Bool)

(assert (=> b!259505 m!275255))

(declare-fun m!275257 () Bool)

(assert (=> b!259506 m!275257))

(assert (=> b!259067 d!62397))

(declare-fun d!62399 () Bool)

(assert (=> d!62399 (= (apply!256 (+!694 lt!130518 (tuple2!4849 lt!130528 (minValue!4614 thiss!1504))) lt!130534) (apply!256 lt!130518 lt!130534))))

(declare-fun lt!130765 () Unit!8017)

(assert (=> d!62399 (= lt!130765 (choose!1266 lt!130518 lt!130528 (minValue!4614 thiss!1504) lt!130534))))

(declare-fun e!168169 () Bool)

(assert (=> d!62399 e!168169))

(declare-fun res!126855 () Bool)

(assert (=> d!62399 (=> (not res!126855) (not e!168169))))

(assert (=> d!62399 (= res!126855 (contains!1858 lt!130518 lt!130534))))

(assert (=> d!62399 (= (addApplyDifferent!232 lt!130518 lt!130528 (minValue!4614 thiss!1504) lt!130534) lt!130765)))

(declare-fun b!259507 () Bool)

(assert (=> b!259507 (= e!168169 (not (= lt!130534 lt!130528)))))

(assert (= (and d!62399 res!126855) b!259507))

(declare-fun m!275259 () Bool)

(assert (=> d!62399 m!275259))

(declare-fun m!275261 () Bool)

(assert (=> d!62399 m!275261))

(assert (=> d!62399 m!274699))

(assert (=> d!62399 m!274701))

(assert (=> d!62399 m!274699))

(assert (=> d!62399 m!274709))

(assert (=> b!259067 d!62399))

(declare-fun d!62401 () Bool)

(declare-fun e!168170 () Bool)

(assert (=> d!62401 e!168170))

(declare-fun res!126857 () Bool)

(assert (=> d!62401 (=> (not res!126857) (not e!168170))))

(declare-fun lt!130766 () ListLongMap!3763)

(assert (=> d!62401 (= res!126857 (contains!1858 lt!130766 (_1!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130768 () List!3726)

(assert (=> d!62401 (= lt!130766 (ListLongMap!3764 lt!130768))))

(declare-fun lt!130767 () Unit!8017)

(declare-fun lt!130769 () Unit!8017)

(assert (=> d!62401 (= lt!130767 lt!130769)))

(assert (=> d!62401 (= (getValueByKey!315 lt!130768 (_1!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62401 (= lt!130769 (lemmaContainsTupThenGetReturnValue!171 lt!130768 (_1!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62401 (= lt!130768 (insertStrictlySorted!174 (toList!1897 lt!130520) (_1!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62401 (= (+!694 lt!130520 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) lt!130766)))

(declare-fun b!259508 () Bool)

(declare-fun res!126856 () Bool)

(assert (=> b!259508 (=> (not res!126856) (not e!168170))))

(assert (=> b!259508 (= res!126856 (= (getValueByKey!315 (toList!1897 lt!130766) (_1!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259509 () Bool)

(assert (=> b!259509 (= e!168170 (contains!1861 (toList!1897 lt!130766) (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62401 res!126857) b!259508))

(assert (= (and b!259508 res!126856) b!259509))

(declare-fun m!275263 () Bool)

(assert (=> d!62401 m!275263))

(declare-fun m!275265 () Bool)

(assert (=> d!62401 m!275265))

(declare-fun m!275267 () Bool)

(assert (=> d!62401 m!275267))

(declare-fun m!275269 () Bool)

(assert (=> d!62401 m!275269))

(declare-fun m!275271 () Bool)

(assert (=> b!259508 m!275271))

(declare-fun m!275273 () Bool)

(assert (=> b!259509 m!275273))

(assert (=> b!259067 d!62401))

(declare-fun d!62403 () Bool)

(declare-fun e!168171 () Bool)

(assert (=> d!62403 e!168171))

(declare-fun res!126858 () Bool)

(assert (=> d!62403 (=> res!126858 e!168171)))

(declare-fun lt!130771 () Bool)

(assert (=> d!62403 (= res!126858 (not lt!130771))))

(declare-fun lt!130770 () Bool)

(assert (=> d!62403 (= lt!130771 lt!130770)))

(declare-fun lt!130773 () Unit!8017)

(declare-fun e!168172 () Unit!8017)

(assert (=> d!62403 (= lt!130773 e!168172)))

(declare-fun c!44059 () Bool)

(assert (=> d!62403 (= c!44059 lt!130770)))

(assert (=> d!62403 (= lt!130770 (containsKey!306 (toList!1897 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) lt!130519))))

(assert (=> d!62403 (= (contains!1858 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504))) lt!130519) lt!130771)))

(declare-fun b!259510 () Bool)

(declare-fun lt!130772 () Unit!8017)

(assert (=> b!259510 (= e!168172 lt!130772)))

(assert (=> b!259510 (= lt!130772 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) lt!130519))))

(assert (=> b!259510 (isDefined!255 (getValueByKey!315 (toList!1897 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) lt!130519))))

(declare-fun b!259511 () Bool)

(declare-fun Unit!8041 () Unit!8017)

(assert (=> b!259511 (= e!168172 Unit!8041)))

(declare-fun b!259512 () Bool)

(assert (=> b!259512 (= e!168171 (isDefined!255 (getValueByKey!315 (toList!1897 (+!694 lt!130530 (tuple2!4849 lt!130525 (zeroValue!4614 thiss!1504)))) lt!130519)))))

(assert (= (and d!62403 c!44059) b!259510))

(assert (= (and d!62403 (not c!44059)) b!259511))

(assert (= (and d!62403 (not res!126858)) b!259512))

(declare-fun m!275275 () Bool)

(assert (=> d!62403 m!275275))

(declare-fun m!275277 () Bool)

(assert (=> b!259510 m!275277))

(declare-fun m!275279 () Bool)

(assert (=> b!259510 m!275279))

(assert (=> b!259510 m!275279))

(declare-fun m!275281 () Bool)

(assert (=> b!259510 m!275281))

(assert (=> b!259512 m!275279))

(assert (=> b!259512 m!275279))

(assert (=> b!259512 m!275281))

(assert (=> b!259067 d!62403))

(declare-fun d!62405 () Bool)

(assert (=> d!62405 (= (apply!256 (+!694 lt!130520 (tuple2!4849 lt!130522 (zeroValue!4614 thiss!1504))) lt!130538) (apply!256 lt!130520 lt!130538))))

(declare-fun lt!130774 () Unit!8017)

(assert (=> d!62405 (= lt!130774 (choose!1266 lt!130520 lt!130522 (zeroValue!4614 thiss!1504) lt!130538))))

(declare-fun e!168173 () Bool)

(assert (=> d!62405 e!168173))

(declare-fun res!126859 () Bool)

(assert (=> d!62405 (=> (not res!126859) (not e!168173))))

(assert (=> d!62405 (= res!126859 (contains!1858 lt!130520 lt!130538))))

(assert (=> d!62405 (= (addApplyDifferent!232 lt!130520 lt!130522 (zeroValue!4614 thiss!1504) lt!130538) lt!130774)))

(declare-fun b!259513 () Bool)

(assert (=> b!259513 (= e!168173 (not (= lt!130538 lt!130522)))))

(assert (= (and d!62405 res!126859) b!259513))

(declare-fun m!275283 () Bool)

(assert (=> d!62405 m!275283))

(declare-fun m!275285 () Bool)

(assert (=> d!62405 m!275285))

(assert (=> d!62405 m!274721))

(assert (=> d!62405 m!274723))

(assert (=> d!62405 m!274721))

(assert (=> d!62405 m!274717))

(assert (=> b!259067 d!62405))

(declare-fun bm!24693 () Bool)

(declare-fun call!24696 () Bool)

(assert (=> bm!24693 (= call!24696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (mask!11081 thiss!1504)))))

(declare-fun b!259514 () Bool)

(declare-fun e!168176 () Bool)

(declare-fun e!168175 () Bool)

(assert (=> b!259514 (= e!168176 e!168175)))

(declare-fun c!44060 () Bool)

(assert (=> b!259514 (= c!44060 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62407 () Bool)

(declare-fun res!126860 () Bool)

(assert (=> d!62407 (=> res!126860 e!168176)))

(assert (=> d!62407 (= res!126860 (bvsge #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(assert (=> d!62407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (mask!11081 thiss!1504)) e!168176)))

(declare-fun b!259515 () Bool)

(declare-fun e!168174 () Bool)

(assert (=> b!259515 (= e!168175 e!168174)))

(declare-fun lt!130776 () (_ BitVec 64))

(assert (=> b!259515 (= lt!130776 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130775 () Unit!8017)

(assert (=> b!259515 (= lt!130775 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) lt!130776 #b00000000000000000000000000000000))))

(assert (=> b!259515 (arrayContainsKey!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) lt!130776 #b00000000000000000000000000000000)))

(declare-fun lt!130777 () Unit!8017)

(assert (=> b!259515 (= lt!130777 lt!130775)))

(declare-fun res!126861 () Bool)

(assert (=> b!259515 (= res!126861 (= (seekEntryOrOpen!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000) (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (mask!11081 thiss!1504)) (Found!1144 #b00000000000000000000000000000000)))))

(assert (=> b!259515 (=> (not res!126861) (not e!168174))))

(declare-fun b!259516 () Bool)

(assert (=> b!259516 (= e!168175 call!24696)))

(declare-fun b!259517 () Bool)

(assert (=> b!259517 (= e!168174 call!24696)))

(assert (= (and d!62407 (not res!126860)) b!259514))

(assert (= (and b!259514 c!44060) b!259515))

(assert (= (and b!259514 (not c!44060)) b!259516))

(assert (= (and b!259515 res!126861) b!259517))

(assert (= (or b!259517 b!259516) bm!24693))

(declare-fun m!275287 () Bool)

(assert (=> bm!24693 m!275287))

(assert (=> b!259514 m!275015))

(assert (=> b!259514 m!275015))

(assert (=> b!259514 m!275017))

(assert (=> b!259515 m!275015))

(declare-fun m!275289 () Bool)

(assert (=> b!259515 m!275289))

(declare-fun m!275291 () Bool)

(assert (=> b!259515 m!275291))

(assert (=> b!259515 m!275015))

(declare-fun m!275293 () Bool)

(assert (=> b!259515 m!275293))

(assert (=> b!259169 d!62407))

(declare-fun d!62409 () Bool)

(declare-fun e!168177 () Bool)

(assert (=> d!62409 e!168177))

(declare-fun res!126863 () Bool)

(assert (=> d!62409 (=> (not res!126863) (not e!168177))))

(declare-fun lt!130778 () ListLongMap!3763)

(assert (=> d!62409 (= res!126863 (contains!1858 lt!130778 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130780 () List!3726)

(assert (=> d!62409 (= lt!130778 (ListLongMap!3764 lt!130780))))

(declare-fun lt!130779 () Unit!8017)

(declare-fun lt!130781 () Unit!8017)

(assert (=> d!62409 (= lt!130779 lt!130781)))

(assert (=> d!62409 (= (getValueByKey!315 lt!130780 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62409 (= lt!130781 (lemmaContainsTupThenGetReturnValue!171 lt!130780 (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62409 (= lt!130780 (insertStrictlySorted!174 (toList!1897 call!24657) (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62409 (= (+!694 call!24657 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) lt!130778)))

(declare-fun b!259518 () Bool)

(declare-fun res!126862 () Bool)

(assert (=> b!259518 (=> (not res!126862) (not e!168177))))

(assert (=> b!259518 (= res!126862 (= (getValueByKey!315 (toList!1897 lt!130778) (_1!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun b!259519 () Bool)

(assert (=> b!259519 (= e!168177 (contains!1861 (toList!1897 lt!130778) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(assert (= (and d!62409 res!126863) b!259518))

(assert (= (and b!259518 res!126862) b!259519))

(declare-fun m!275295 () Bool)

(assert (=> d!62409 m!275295))

(declare-fun m!275297 () Bool)

(assert (=> d!62409 m!275297))

(declare-fun m!275299 () Bool)

(assert (=> d!62409 m!275299))

(declare-fun m!275301 () Bool)

(assert (=> d!62409 m!275301))

(declare-fun m!275303 () Bool)

(assert (=> b!259518 m!275303))

(declare-fun m!275305 () Bool)

(assert (=> b!259519 m!275305))

(assert (=> b!259113 d!62409))

(declare-fun d!62411 () Bool)

(declare-fun res!126868 () Bool)

(declare-fun e!168182 () Bool)

(assert (=> d!62411 (=> res!126868 e!168182)))

(assert (=> d!62411 (= res!126868 (and ((_ is Cons!3722) (toList!1897 lt!130348)) (= (_1!2435 (h!4385 (toList!1897 lt!130348))) key!932)))))

(assert (=> d!62411 (= (containsKey!306 (toList!1897 lt!130348) key!932) e!168182)))

(declare-fun b!259524 () Bool)

(declare-fun e!168183 () Bool)

(assert (=> b!259524 (= e!168182 e!168183)))

(declare-fun res!126869 () Bool)

(assert (=> b!259524 (=> (not res!126869) (not e!168183))))

(assert (=> b!259524 (= res!126869 (and (or (not ((_ is Cons!3722) (toList!1897 lt!130348))) (bvsle (_1!2435 (h!4385 (toList!1897 lt!130348))) key!932)) ((_ is Cons!3722) (toList!1897 lt!130348)) (bvslt (_1!2435 (h!4385 (toList!1897 lt!130348))) key!932)))))

(declare-fun b!259525 () Bool)

(assert (=> b!259525 (= e!168183 (containsKey!306 (t!8783 (toList!1897 lt!130348)) key!932))))

(assert (= (and d!62411 (not res!126868)) b!259524))

(assert (= (and b!259524 res!126869) b!259525))

(declare-fun m!275307 () Bool)

(assert (=> b!259525 m!275307))

(assert (=> d!62219 d!62411))

(assert (=> b!259135 d!62361))

(declare-fun d!62413 () Bool)

(declare-fun e!168184 () Bool)

(assert (=> d!62413 e!168184))

(declare-fun res!126871 () Bool)

(assert (=> d!62413 (=> (not res!126871) (not e!168184))))

(declare-fun lt!130782 () ListLongMap!3763)

(assert (=> d!62413 (= res!126871 (contains!1858 lt!130782 (_1!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130784 () List!3726)

(assert (=> d!62413 (= lt!130782 (ListLongMap!3764 lt!130784))))

(declare-fun lt!130783 () Unit!8017)

(declare-fun lt!130785 () Unit!8017)

(assert (=> d!62413 (= lt!130783 lt!130785)))

(assert (=> d!62413 (= (getValueByKey!315 lt!130784 (_1!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))))))

(assert (=> d!62413 (= lt!130785 (lemmaContainsTupThenGetReturnValue!171 lt!130784 (_1!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))))))

(assert (=> d!62413 (= lt!130784 (insertStrictlySorted!174 (toList!1897 lt!130549) (_1!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))))))

(assert (=> d!62413 (= (+!694 lt!130549 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) lt!130782)))

(declare-fun b!259526 () Bool)

(declare-fun res!126870 () Bool)

(assert (=> b!259526 (=> (not res!126870) (not e!168184))))

(assert (=> b!259526 (= res!126870 (= (getValueByKey!315 (toList!1897 lt!130782) (_1!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))))))))

(declare-fun b!259527 () Bool)

(assert (=> b!259527 (= e!168184 (contains!1861 (toList!1897 lt!130782) (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))))))

(assert (= (and d!62413 res!126871) b!259526))

(assert (= (and b!259526 res!126870) b!259527))

(declare-fun m!275309 () Bool)

(assert (=> d!62413 m!275309))

(declare-fun m!275311 () Bool)

(assert (=> d!62413 m!275311))

(declare-fun m!275313 () Bool)

(assert (=> d!62413 m!275313))

(declare-fun m!275315 () Bool)

(assert (=> d!62413 m!275315))

(declare-fun m!275317 () Bool)

(assert (=> b!259526 m!275317))

(declare-fun m!275319 () Bool)

(assert (=> b!259527 m!275319))

(assert (=> b!259117 d!62413))

(declare-fun d!62415 () Bool)

(assert (=> d!62415 (= (apply!256 lt!130551 lt!130569) (get!3069 (getValueByKey!315 (toList!1897 lt!130551) lt!130569)))))

(declare-fun bs!9164 () Bool)

(assert (= bs!9164 d!62415))

(declare-fun m!275321 () Bool)

(assert (=> bs!9164 m!275321))

(assert (=> bs!9164 m!275321))

(declare-fun m!275323 () Bool)

(assert (=> bs!9164 m!275323))

(assert (=> b!259117 d!62415))

(declare-fun d!62417 () Bool)

(declare-fun e!168185 () Bool)

(assert (=> d!62417 e!168185))

(declare-fun res!126873 () Bool)

(assert (=> d!62417 (=> (not res!126873) (not e!168185))))

(declare-fun lt!130786 () ListLongMap!3763)

(assert (=> d!62417 (= res!126873 (contains!1858 lt!130786 (_1!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130788 () List!3726)

(assert (=> d!62417 (= lt!130786 (ListLongMap!3764 lt!130788))))

(declare-fun lt!130787 () Unit!8017)

(declare-fun lt!130789 () Unit!8017)

(assert (=> d!62417 (= lt!130787 lt!130789)))

(assert (=> d!62417 (= (getValueByKey!315 lt!130788 (_1!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62417 (= lt!130789 (lemmaContainsTupThenGetReturnValue!171 lt!130788 (_1!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62417 (= lt!130788 (insertStrictlySorted!174 (toList!1897 lt!130551) (_1!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62417 (= (+!694 lt!130551 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) lt!130786)))

(declare-fun b!259528 () Bool)

(declare-fun res!126872 () Bool)

(assert (=> b!259528 (=> (not res!126872) (not e!168185))))

(assert (=> b!259528 (= res!126872 (= (getValueByKey!315 (toList!1897 lt!130786) (_1!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259529 () Bool)

(assert (=> b!259529 (= e!168185 (contains!1861 (toList!1897 lt!130786) (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62417 res!126873) b!259528))

(assert (= (and b!259528 res!126872) b!259529))

(declare-fun m!275325 () Bool)

(assert (=> d!62417 m!275325))

(declare-fun m!275327 () Bool)

(assert (=> d!62417 m!275327))

(declare-fun m!275329 () Bool)

(assert (=> d!62417 m!275329))

(declare-fun m!275331 () Bool)

(assert (=> d!62417 m!275331))

(declare-fun m!275333 () Bool)

(assert (=> b!259528 m!275333))

(declare-fun m!275335 () Bool)

(assert (=> b!259529 m!275335))

(assert (=> b!259117 d!62417))

(declare-fun d!62419 () Bool)

(assert (=> d!62419 (= (apply!256 (+!694 lt!130551 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) lt!130569) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130551 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504)))) lt!130569)))))

(declare-fun bs!9165 () Bool)

(assert (= bs!9165 d!62419))

(declare-fun m!275337 () Bool)

(assert (=> bs!9165 m!275337))

(assert (=> bs!9165 m!275337))

(declare-fun m!275339 () Bool)

(assert (=> bs!9165 m!275339))

(assert (=> b!259117 d!62419))

(declare-fun d!62421 () Bool)

(assert (=> d!62421 (= (apply!256 (+!694 lt!130560 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) lt!130566) (apply!256 lt!130560 lt!130566))))

(declare-fun lt!130790 () Unit!8017)

(assert (=> d!62421 (= lt!130790 (choose!1266 lt!130560 lt!130558 (minValue!4614 thiss!1504) lt!130566))))

(declare-fun e!168186 () Bool)

(assert (=> d!62421 e!168186))

(declare-fun res!126874 () Bool)

(assert (=> d!62421 (=> (not res!126874) (not e!168186))))

(assert (=> d!62421 (= res!126874 (contains!1858 lt!130560 lt!130566))))

(assert (=> d!62421 (= (addApplyDifferent!232 lt!130560 lt!130558 (minValue!4614 thiss!1504) lt!130566) lt!130790)))

(declare-fun b!259530 () Bool)

(assert (=> b!259530 (= e!168186 (not (= lt!130566 lt!130558)))))

(assert (= (and d!62421 res!126874) b!259530))

(declare-fun m!275341 () Bool)

(assert (=> d!62421 m!275341))

(declare-fun m!275343 () Bool)

(assert (=> d!62421 m!275343))

(assert (=> d!62421 m!274779))

(assert (=> d!62421 m!274781))

(assert (=> d!62421 m!274779))

(assert (=> d!62421 m!274765))

(assert (=> b!259117 d!62421))

(declare-fun d!62423 () Bool)

(declare-fun e!168187 () Bool)

(assert (=> d!62423 e!168187))

(declare-fun res!126876 () Bool)

(assert (=> d!62423 (=> (not res!126876) (not e!168187))))

(declare-fun lt!130791 () ListLongMap!3763)

(assert (=> d!62423 (= res!126876 (contains!1858 lt!130791 (_1!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130793 () List!3726)

(assert (=> d!62423 (= lt!130791 (ListLongMap!3764 lt!130793))))

(declare-fun lt!130792 () Unit!8017)

(declare-fun lt!130794 () Unit!8017)

(assert (=> d!62423 (= lt!130792 lt!130794)))

(assert (=> d!62423 (= (getValueByKey!315 lt!130793 (_1!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))))))

(assert (=> d!62423 (= lt!130794 (lemmaContainsTupThenGetReturnValue!171 lt!130793 (_1!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))))))

(assert (=> d!62423 (= lt!130793 (insertStrictlySorted!174 (toList!1897 lt!130560) (_1!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))))))

(assert (=> d!62423 (= (+!694 lt!130560 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) lt!130791)))

(declare-fun b!259531 () Bool)

(declare-fun res!126875 () Bool)

(assert (=> b!259531 (=> (not res!126875) (not e!168187))))

(assert (=> b!259531 (= res!126875 (= (getValueByKey!315 (toList!1897 lt!130791) (_1!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))))))))

(declare-fun b!259532 () Bool)

(assert (=> b!259532 (= e!168187 (contains!1861 (toList!1897 lt!130791) (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))))))

(assert (= (and d!62423 res!126876) b!259531))

(assert (= (and b!259531 res!126875) b!259532))

(declare-fun m!275345 () Bool)

(assert (=> d!62423 m!275345))

(declare-fun m!275347 () Bool)

(assert (=> d!62423 m!275347))

(declare-fun m!275349 () Bool)

(assert (=> d!62423 m!275349))

(declare-fun m!275351 () Bool)

(assert (=> d!62423 m!275351))

(declare-fun m!275353 () Bool)

(assert (=> b!259531 m!275353))

(declare-fun m!275355 () Bool)

(assert (=> b!259532 m!275355))

(assert (=> b!259117 d!62423))

(declare-fun d!62425 () Bool)

(assert (=> d!62425 (= (apply!256 lt!130560 lt!130566) (get!3069 (getValueByKey!315 (toList!1897 lt!130560) lt!130566)))))

(declare-fun bs!9166 () Bool)

(assert (= bs!9166 d!62425))

(declare-fun m!275357 () Bool)

(assert (=> bs!9166 m!275357))

(assert (=> bs!9166 m!275357))

(declare-fun m!275359 () Bool)

(assert (=> bs!9166 m!275359))

(assert (=> b!259117 d!62425))

(assert (=> b!259117 d!62265))

(declare-fun d!62427 () Bool)

(assert (=> d!62427 (= (apply!256 (+!694 lt!130549 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) lt!130565) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130549 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504)))) lt!130565)))))

(declare-fun bs!9167 () Bool)

(assert (= bs!9167 d!62427))

(declare-fun m!275361 () Bool)

(assert (=> bs!9167 m!275361))

(assert (=> bs!9167 m!275361))

(declare-fun m!275363 () Bool)

(assert (=> bs!9167 m!275363))

(assert (=> b!259117 d!62427))

(declare-fun d!62429 () Bool)

(assert (=> d!62429 (= (apply!256 (+!694 lt!130549 (tuple2!4849 lt!130559 (minValue!4614 thiss!1504))) lt!130565) (apply!256 lt!130549 lt!130565))))

(declare-fun lt!130795 () Unit!8017)

(assert (=> d!62429 (= lt!130795 (choose!1266 lt!130549 lt!130559 (minValue!4614 thiss!1504) lt!130565))))

(declare-fun e!168188 () Bool)

(assert (=> d!62429 e!168188))

(declare-fun res!126877 () Bool)

(assert (=> d!62429 (=> (not res!126877) (not e!168188))))

(assert (=> d!62429 (= res!126877 (contains!1858 lt!130549 lt!130565))))

(assert (=> d!62429 (= (addApplyDifferent!232 lt!130549 lt!130559 (minValue!4614 thiss!1504) lt!130565) lt!130795)))

(declare-fun b!259533 () Bool)

(assert (=> b!259533 (= e!168188 (not (= lt!130565 lt!130559)))))

(assert (= (and d!62429 res!126877) b!259533))

(declare-fun m!275365 () Bool)

(assert (=> d!62429 m!275365))

(declare-fun m!275367 () Bool)

(assert (=> d!62429 m!275367))

(assert (=> d!62429 m!274767))

(assert (=> d!62429 m!274769))

(assert (=> d!62429 m!274767))

(assert (=> d!62429 m!274777))

(assert (=> b!259117 d!62429))

(declare-fun d!62431 () Bool)

(declare-fun e!168189 () Bool)

(assert (=> d!62431 e!168189))

(declare-fun res!126879 () Bool)

(assert (=> d!62431 (=> (not res!126879) (not e!168189))))

(declare-fun lt!130796 () ListLongMap!3763)

(assert (=> d!62431 (= res!126879 (contains!1858 lt!130796 (_1!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130798 () List!3726)

(assert (=> d!62431 (= lt!130796 (ListLongMap!3764 lt!130798))))

(declare-fun lt!130797 () Unit!8017)

(declare-fun lt!130799 () Unit!8017)

(assert (=> d!62431 (= lt!130797 lt!130799)))

(assert (=> d!62431 (= (getValueByKey!315 lt!130798 (_1!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62431 (= lt!130799 (lemmaContainsTupThenGetReturnValue!171 lt!130798 (_1!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62431 (= lt!130798 (insertStrictlySorted!174 (toList!1897 lt!130561) (_1!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) (_2!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62431 (= (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) lt!130796)))

(declare-fun b!259534 () Bool)

(declare-fun res!126878 () Bool)

(assert (=> b!259534 (=> (not res!126878) (not e!168189))))

(assert (=> b!259534 (= res!126878 (= (getValueByKey!315 (toList!1897 lt!130796) (_1!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) (Some!320 (_2!2435 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259535 () Bool)

(assert (=> b!259535 (= e!168189 (contains!1861 (toList!1897 lt!130796) (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62431 res!126879) b!259534))

(assert (= (and b!259534 res!126878) b!259535))

(declare-fun m!275369 () Bool)

(assert (=> d!62431 m!275369))

(declare-fun m!275371 () Bool)

(assert (=> d!62431 m!275371))

(declare-fun m!275373 () Bool)

(assert (=> d!62431 m!275373))

(declare-fun m!275375 () Bool)

(assert (=> d!62431 m!275375))

(declare-fun m!275377 () Bool)

(assert (=> b!259534 m!275377))

(declare-fun m!275379 () Bool)

(assert (=> b!259535 m!275379))

(assert (=> b!259117 d!62431))

(declare-fun d!62433 () Bool)

(assert (=> d!62433 (= (apply!256 (+!694 lt!130551 (tuple2!4849 lt!130553 (zeroValue!4614 thiss!1504))) lt!130569) (apply!256 lt!130551 lt!130569))))

(declare-fun lt!130800 () Unit!8017)

(assert (=> d!62433 (= lt!130800 (choose!1266 lt!130551 lt!130553 (zeroValue!4614 thiss!1504) lt!130569))))

(declare-fun e!168190 () Bool)

(assert (=> d!62433 e!168190))

(declare-fun res!126880 () Bool)

(assert (=> d!62433 (=> (not res!126880) (not e!168190))))

(assert (=> d!62433 (= res!126880 (contains!1858 lt!130551 lt!130569))))

(assert (=> d!62433 (= (addApplyDifferent!232 lt!130551 lt!130553 (zeroValue!4614 thiss!1504) lt!130569) lt!130800)))

(declare-fun b!259536 () Bool)

(assert (=> b!259536 (= e!168190 (not (= lt!130569 lt!130553)))))

(assert (= (and d!62433 res!126880) b!259536))

(declare-fun m!275381 () Bool)

(assert (=> d!62433 m!275381))

(declare-fun m!275383 () Bool)

(assert (=> d!62433 m!275383))

(assert (=> d!62433 m!274789))

(assert (=> d!62433 m!274791))

(assert (=> d!62433 m!274789))

(assert (=> d!62433 m!274785))

(assert (=> b!259117 d!62433))

(declare-fun d!62435 () Bool)

(assert (=> d!62435 (= (apply!256 lt!130549 lt!130565) (get!3069 (getValueByKey!315 (toList!1897 lt!130549) lt!130565)))))

(declare-fun bs!9168 () Bool)

(assert (= bs!9168 d!62435))

(declare-fun m!275385 () Bool)

(assert (=> bs!9168 m!275385))

(assert (=> bs!9168 m!275385))

(declare-fun m!275387 () Bool)

(assert (=> bs!9168 m!275387))

(assert (=> b!259117 d!62435))

(declare-fun d!62437 () Bool)

(assert (=> d!62437 (contains!1858 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) lt!130550)))

(declare-fun lt!130801 () Unit!8017)

(assert (=> d!62437 (= lt!130801 (choose!1265 lt!130561 lt!130556 (zeroValue!4614 thiss!1504) lt!130550))))

(assert (=> d!62437 (contains!1858 lt!130561 lt!130550)))

(assert (=> d!62437 (= (addStillContains!232 lt!130561 lt!130556 (zeroValue!4614 thiss!1504) lt!130550) lt!130801)))

(declare-fun bs!9169 () Bool)

(assert (= bs!9169 d!62437))

(assert (=> bs!9169 m!274783))

(assert (=> bs!9169 m!274783))

(assert (=> bs!9169 m!274787))

(declare-fun m!275389 () Bool)

(assert (=> bs!9169 m!275389))

(declare-fun m!275391 () Bool)

(assert (=> bs!9169 m!275391))

(assert (=> b!259117 d!62437))

(declare-fun d!62439 () Bool)

(assert (=> d!62439 (= (apply!256 (+!694 lt!130560 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504))) lt!130566) (get!3069 (getValueByKey!315 (toList!1897 (+!694 lt!130560 (tuple2!4849 lt!130558 (minValue!4614 thiss!1504)))) lt!130566)))))

(declare-fun bs!9170 () Bool)

(assert (= bs!9170 d!62439))

(declare-fun m!275393 () Bool)

(assert (=> bs!9170 m!275393))

(assert (=> bs!9170 m!275393))

(declare-fun m!275395 () Bool)

(assert (=> bs!9170 m!275395))

(assert (=> b!259117 d!62439))

(declare-fun d!62441 () Bool)

(declare-fun e!168191 () Bool)

(assert (=> d!62441 e!168191))

(declare-fun res!126881 () Bool)

(assert (=> d!62441 (=> res!126881 e!168191)))

(declare-fun lt!130803 () Bool)

(assert (=> d!62441 (= res!126881 (not lt!130803))))

(declare-fun lt!130802 () Bool)

(assert (=> d!62441 (= lt!130803 lt!130802)))

(declare-fun lt!130805 () Unit!8017)

(declare-fun e!168192 () Unit!8017)

(assert (=> d!62441 (= lt!130805 e!168192)))

(declare-fun c!44061 () Bool)

(assert (=> d!62441 (= c!44061 lt!130802)))

(assert (=> d!62441 (= lt!130802 (containsKey!306 (toList!1897 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) lt!130550))))

(assert (=> d!62441 (= (contains!1858 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504))) lt!130550) lt!130803)))

(declare-fun b!259537 () Bool)

(declare-fun lt!130804 () Unit!8017)

(assert (=> b!259537 (= e!168192 lt!130804)))

(assert (=> b!259537 (= lt!130804 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) lt!130550))))

(assert (=> b!259537 (isDefined!255 (getValueByKey!315 (toList!1897 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) lt!130550))))

(declare-fun b!259538 () Bool)

(declare-fun Unit!8042 () Unit!8017)

(assert (=> b!259538 (= e!168192 Unit!8042)))

(declare-fun b!259539 () Bool)

(assert (=> b!259539 (= e!168191 (isDefined!255 (getValueByKey!315 (toList!1897 (+!694 lt!130561 (tuple2!4849 lt!130556 (zeroValue!4614 thiss!1504)))) lt!130550)))))

(assert (= (and d!62441 c!44061) b!259537))

(assert (= (and d!62441 (not c!44061)) b!259538))

(assert (= (and d!62441 (not res!126881)) b!259539))

(declare-fun m!275397 () Bool)

(assert (=> d!62441 m!275397))

(declare-fun m!275399 () Bool)

(assert (=> b!259537 m!275399))

(declare-fun m!275401 () Bool)

(assert (=> b!259537 m!275401))

(assert (=> b!259537 m!275401))

(declare-fun m!275403 () Bool)

(assert (=> b!259537 m!275403))

(assert (=> b!259539 m!275401))

(assert (=> b!259539 m!275401))

(assert (=> b!259539 m!275403))

(assert (=> b!259117 d!62441))

(declare-fun d!62443 () Bool)

(assert (=> d!62443 (= (inRange!0 (ite c!43924 (index!6746 lt!130457) (index!6749 lt!130457)) (mask!11081 thiss!1504)) (and (bvsge (ite c!43924 (index!6746 lt!130457) (index!6749 lt!130457)) #b00000000000000000000000000000000) (bvslt (ite c!43924 (index!6746 lt!130457) (index!6749 lt!130457)) (bvadd (mask!11081 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24619 d!62443))

(assert (=> bm!24638 d!62387))

(declare-fun c!44062 () Bool)

(declare-fun d!62445 () Bool)

(assert (=> d!62445 (= c!44062 (and ((_ is Cons!3722) (toList!1897 lt!130591)) (= (_1!2435 (h!4385 (toList!1897 lt!130591))) (_1!2435 (tuple2!4849 key!932 v!346)))))))

(declare-fun e!168193 () Option!321)

(assert (=> d!62445 (= (getValueByKey!315 (toList!1897 lt!130591) (_1!2435 (tuple2!4849 key!932 v!346))) e!168193)))

(declare-fun b!259541 () Bool)

(declare-fun e!168194 () Option!321)

(assert (=> b!259541 (= e!168193 e!168194)))

(declare-fun c!44063 () Bool)

(assert (=> b!259541 (= c!44063 (and ((_ is Cons!3722) (toList!1897 lt!130591)) (not (= (_1!2435 (h!4385 (toList!1897 lt!130591))) (_1!2435 (tuple2!4849 key!932 v!346))))))))

(declare-fun b!259542 () Bool)

(assert (=> b!259542 (= e!168194 (getValueByKey!315 (t!8783 (toList!1897 lt!130591)) (_1!2435 (tuple2!4849 key!932 v!346))))))

(declare-fun b!259540 () Bool)

(assert (=> b!259540 (= e!168193 (Some!320 (_2!2435 (h!4385 (toList!1897 lt!130591)))))))

(declare-fun b!259543 () Bool)

(assert (=> b!259543 (= e!168194 None!319)))

(assert (= (and d!62445 c!44062) b!259540))

(assert (= (and d!62445 (not c!44062)) b!259541))

(assert (= (and b!259541 c!44063) b!259542))

(assert (= (and b!259541 (not c!44063)) b!259543))

(declare-fun m!275405 () Bool)

(assert (=> b!259542 m!275405))

(assert (=> b!259159 d!62445))

(declare-fun bm!24694 () Bool)

(declare-fun call!24697 () (_ BitVec 32))

(assert (=> bm!24694 (= call!24697 (arrayCountValidKeys!0 lt!130349 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62447 () Bool)

(declare-fun lt!130806 () (_ BitVec 32))

(assert (=> d!62447 (and (bvsge lt!130806 #b00000000000000000000000000000000) (bvsle lt!130806 (bvsub (size!6296 lt!130349) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!168195 () (_ BitVec 32))

(assert (=> d!62447 (= lt!130806 e!168195)))

(declare-fun c!44064 () Bool)

(assert (=> d!62447 (= c!44064 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62447 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6296 lt!130349)))))

(assert (=> d!62447 (= (arrayCountValidKeys!0 lt!130349 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!130806)))

(declare-fun b!259544 () Bool)

(declare-fun e!168196 () (_ BitVec 32))

(assert (=> b!259544 (= e!168196 call!24697)))

(declare-fun b!259545 () Bool)

(assert (=> b!259545 (= e!168196 (bvadd #b00000000000000000000000000000001 call!24697))))

(declare-fun b!259546 () Bool)

(assert (=> b!259546 (= e!168195 #b00000000000000000000000000000000)))

(declare-fun b!259547 () Bool)

(assert (=> b!259547 (= e!168195 e!168196)))

(declare-fun c!44065 () Bool)

(assert (=> b!259547 (= c!44065 (validKeyInArray!0 (select (arr!5948 lt!130349) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (= (and d!62447 c!44064) b!259546))

(assert (= (and d!62447 (not c!44064)) b!259547))

(assert (= (and b!259547 c!44065) b!259545))

(assert (= (and b!259547 (not c!44065)) b!259544))

(assert (= (or b!259545 b!259544) bm!24694))

(declare-fun m!275407 () Bool)

(assert (=> bm!24694 m!275407))

(declare-fun m!275409 () Bool)

(assert (=> b!259547 m!275409))

(assert (=> b!259547 m!275409))

(declare-fun m!275411 () Bool)

(assert (=> b!259547 m!275411))

(assert (=> bm!24657 d!62447))

(assert (=> b!259099 d!62323))

(declare-fun call!24698 () (_ BitVec 32))

(declare-fun bm!24695 () Bool)

(assert (=> bm!24695 (= call!24698 (arrayCountValidKeys!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6296 (_keys!6947 thiss!1504))))))

(declare-fun lt!130807 () (_ BitVec 32))

(declare-fun d!62449 () Bool)

(assert (=> d!62449 (and (bvsge lt!130807 #b00000000000000000000000000000000) (bvsle lt!130807 (bvsub (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168197 () (_ BitVec 32))

(assert (=> d!62449 (= lt!130807 e!168197)))

(declare-fun c!44066 () Bool)

(assert (=> d!62449 (= c!44066 (bvsge #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))))))

(assert (=> d!62449 (and (bvsle #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6296 (_keys!6947 thiss!1504)) (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(assert (=> d!62449 (= (arrayCountValidKeys!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) lt!130807)))

(declare-fun b!259548 () Bool)

(declare-fun e!168198 () (_ BitVec 32))

(assert (=> b!259548 (= e!168198 call!24698)))

(declare-fun b!259549 () Bool)

(assert (=> b!259549 (= e!168198 (bvadd #b00000000000000000000000000000001 call!24698))))

(declare-fun b!259550 () Bool)

(assert (=> b!259550 (= e!168197 #b00000000000000000000000000000000)))

(declare-fun b!259551 () Bool)

(assert (=> b!259551 (= e!168197 e!168198)))

(declare-fun c!44067 () Bool)

(assert (=> b!259551 (= c!44067 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62449 c!44066) b!259550))

(assert (= (and d!62449 (not c!44066)) b!259551))

(assert (= (and b!259551 c!44067) b!259549))

(assert (= (and b!259551 (not c!44067)) b!259548))

(assert (= (or b!259549 b!259548) bm!24695))

(declare-fun m!275413 () Bool)

(assert (=> bm!24695 m!275413))

(assert (=> b!259551 m!275015))

(assert (=> b!259551 m!275015))

(assert (=> b!259551 m!275017))

(assert (=> b!259154 d!62449))

(assert (=> b!259154 d!62249))

(assert (=> b!259142 d!62323))

(declare-fun d!62451 () Bool)

(declare-fun e!168199 () Bool)

(assert (=> d!62451 e!168199))

(declare-fun res!126882 () Bool)

(assert (=> d!62451 (=> res!126882 e!168199)))

(declare-fun lt!130809 () Bool)

(assert (=> d!62451 (= res!126882 (not lt!130809))))

(declare-fun lt!130808 () Bool)

(assert (=> d!62451 (= lt!130809 lt!130808)))

(declare-fun lt!130811 () Unit!8017)

(declare-fun e!168200 () Unit!8017)

(assert (=> d!62451 (= lt!130811 e!168200)))

(declare-fun c!44068 () Bool)

(assert (=> d!62451 (= c!44068 lt!130808)))

(assert (=> d!62451 (= lt!130808 (containsKey!306 (toList!1897 lt!130567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62451 (= (contains!1858 lt!130567 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130809)))

(declare-fun b!259552 () Bool)

(declare-fun lt!130810 () Unit!8017)

(assert (=> b!259552 (= e!168200 lt!130810)))

(assert (=> b!259552 (= lt!130810 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1897 lt!130567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259552 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259553 () Bool)

(declare-fun Unit!8043 () Unit!8017)

(assert (=> b!259553 (= e!168200 Unit!8043)))

(declare-fun b!259554 () Bool)

(assert (=> b!259554 (= e!168199 (isDefined!255 (getValueByKey!315 (toList!1897 lt!130567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62451 c!44068) b!259552))

(assert (= (and d!62451 (not c!44068)) b!259553))

(assert (= (and d!62451 (not res!126882)) b!259554))

(declare-fun m!275415 () Bool)

(assert (=> d!62451 m!275415))

(declare-fun m!275417 () Bool)

(assert (=> b!259552 m!275417))

(assert (=> b!259552 m!275075))

(assert (=> b!259552 m!275075))

(declare-fun m!275419 () Bool)

(assert (=> b!259552 m!275419))

(assert (=> b!259554 m!275075))

(assert (=> b!259554 m!275075))

(assert (=> b!259554 m!275419))

(assert (=> bm!24653 d!62451))

(declare-fun d!62453 () Bool)

(assert (=> d!62453 (= (apply!256 lt!130567 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3069 (getValueByKey!315 (toList!1897 lt!130567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9171 () Bool)

(assert (= bs!9171 d!62453))

(assert (=> bs!9171 m!274933))

(assert (=> bs!9171 m!274933))

(declare-fun m!275421 () Bool)

(assert (=> bs!9171 m!275421))

(assert (=> b!259101 d!62453))

(declare-fun d!62455 () Bool)

(assert (=> d!62455 (arrayNoDuplicates!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 Nil!3724)))

(assert (=> d!62455 true))

(declare-fun _$65!89 () Unit!8017)

(assert (=> d!62455 (= (choose!41 (_keys!6947 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3724) _$65!89)))

(declare-fun bs!9172 () Bool)

(assert (= bs!9172 d!62455))

(assert (=> bs!9172 m!274453))

(assert (=> bs!9172 m!274809))

(assert (=> d!62235 d!62455))

(declare-fun d!62457 () Bool)

(declare-fun e!168201 () Bool)

(assert (=> d!62457 e!168201))

(declare-fun res!126884 () Bool)

(assert (=> d!62457 (=> (not res!126884) (not e!168201))))

(declare-fun lt!130812 () ListLongMap!3763)

(assert (=> d!62457 (= res!126884 (contains!1858 lt!130812 (_1!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun lt!130814 () List!3726)

(assert (=> d!62457 (= lt!130812 (ListLongMap!3764 lt!130814))))

(declare-fun lt!130813 () Unit!8017)

(declare-fun lt!130815 () Unit!8017)

(assert (=> d!62457 (= lt!130813 lt!130815)))

(assert (=> d!62457 (= (getValueByKey!315 lt!130814 (_1!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!320 (_2!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62457 (= lt!130815 (lemmaContainsTupThenGetReturnValue!171 lt!130814 (_1!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62457 (= lt!130814 (insertStrictlySorted!174 (toList!1897 (ite c!43957 call!24655 (ite c!43953 call!24651 call!24652))) (_1!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62457 (= (+!694 (ite c!43957 call!24655 (ite c!43953 call!24651 call!24652)) (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) lt!130812)))

(declare-fun b!259555 () Bool)

(declare-fun res!126883 () Bool)

(assert (=> b!259555 (=> (not res!126883) (not e!168201))))

(assert (=> b!259555 (= res!126883 (= (getValueByKey!315 (toList!1897 lt!130812) (_1!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!320 (_2!2435 (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))))

(declare-fun b!259556 () Bool)

(assert (=> b!259556 (= e!168201 (contains!1861 (toList!1897 lt!130812) (ite (or c!43957 c!43953) (tuple2!4849 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4849 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (= (and d!62457 res!126884) b!259555))

(assert (= (and b!259555 res!126883) b!259556))

(declare-fun m!275423 () Bool)

(assert (=> d!62457 m!275423))

(declare-fun m!275425 () Bool)

(assert (=> d!62457 m!275425))

(declare-fun m!275427 () Bool)

(assert (=> d!62457 m!275427))

(declare-fun m!275429 () Bool)

(assert (=> d!62457 m!275429))

(declare-fun m!275431 () Bool)

(assert (=> b!259555 m!275431))

(declare-fun m!275433 () Bool)

(assert (=> b!259556 m!275433))

(assert (=> bm!24649 d!62457))

(declare-fun d!62459 () Bool)

(assert (=> d!62459 (= (arrayCountValidKeys!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6947 thiss!1504) #b00000000000000000000000000000000 (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62459 true))

(declare-fun _$84!39 () Unit!8017)

(assert (=> d!62459 (= (choose!1 (_keys!6947 thiss!1504) index!297 key!932) _$84!39)))

(declare-fun bs!9173 () Bool)

(assert (= bs!9173 d!62459))

(assert (=> bs!9173 m!274453))

(assert (=> bs!9173 m!274819))

(assert (=> bs!9173 m!274475))

(assert (=> d!62239 d!62459))

(declare-fun d!62461 () Bool)

(declare-fun res!126886 () Bool)

(declare-fun e!168204 () Bool)

(assert (=> d!62461 (=> res!126886 e!168204)))

(assert (=> d!62461 (= res!126886 (bvsge #b00000000000000000000000000000000 (size!6296 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))))))))

(assert (=> d!62461 (= (arrayNoDuplicates!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) #b00000000000000000000000000000000 Nil!3724) e!168204)))

(declare-fun b!259557 () Bool)

(declare-fun e!168205 () Bool)

(declare-fun e!168202 () Bool)

(assert (=> b!259557 (= e!168205 e!168202)))

(declare-fun c!44069 () Bool)

(assert (=> b!259557 (= c!44069 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259558 () Bool)

(assert (=> b!259558 (= e!168204 e!168205)))

(declare-fun res!126887 () Bool)

(assert (=> b!259558 (=> (not res!126887) (not e!168205))))

(declare-fun e!168203 () Bool)

(assert (=> b!259558 (= res!126887 (not e!168203))))

(declare-fun res!126885 () Bool)

(assert (=> b!259558 (=> (not res!126885) (not e!168203))))

(assert (=> b!259558 (= res!126885 (validKeyInArray!0 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259559 () Bool)

(declare-fun call!24699 () Bool)

(assert (=> b!259559 (= e!168202 call!24699)))

(declare-fun b!259560 () Bool)

(assert (=> b!259560 (= e!168203 (contains!1860 Nil!3724 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24696 () Bool)

(assert (=> bm!24696 (= call!24699 (arrayNoDuplicates!0 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44069 (Cons!3723 (select (arr!5948 (array!12564 (store (arr!5948 (_keys!6947 thiss!1504)) index!297 key!932) (size!6296 (_keys!6947 thiss!1504)))) #b00000000000000000000000000000000) Nil!3724) Nil!3724)))))

(declare-fun b!259561 () Bool)

(assert (=> b!259561 (= e!168202 call!24699)))

(assert (= (and d!62461 (not res!126886)) b!259558))

(assert (= (and b!259558 res!126885) b!259560))

(assert (= (and b!259558 res!126887) b!259557))

(assert (= (and b!259557 c!44069) b!259561))

(assert (= (and b!259557 (not c!44069)) b!259559))

(assert (= (or b!259561 b!259559) bm!24696))

(assert (=> b!259557 m!275015))

(assert (=> b!259557 m!275015))

(assert (=> b!259557 m!275017))

(assert (=> b!259558 m!275015))

(assert (=> b!259558 m!275015))

(assert (=> b!259558 m!275017))

(assert (=> b!259560 m!275015))

(assert (=> b!259560 m!275015))

(declare-fun m!275435 () Bool)

(assert (=> b!259560 m!275435))

(assert (=> bm!24696 m!275015))

(declare-fun m!275437 () Bool)

(assert (=> bm!24696 m!275437))

(assert (=> b!259138 d!62461))

(assert (=> bm!24620 d!62243))

(assert (=> b!259093 d!62323))

(declare-fun condMapEmpty!11264 () Bool)

(declare-fun mapDefault!11264 () ValueCell!2960)

(assert (=> mapNonEmpty!11263 (= condMapEmpty!11264 (= mapRest!11263 ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11264)))))

(declare-fun e!168207 () Bool)

(declare-fun mapRes!11264 () Bool)

(assert (=> mapNonEmpty!11263 (= tp!23566 (and e!168207 mapRes!11264))))

(declare-fun mapNonEmpty!11264 () Bool)

(declare-fun tp!23567 () Bool)

(declare-fun e!168206 () Bool)

(assert (=> mapNonEmpty!11264 (= mapRes!11264 (and tp!23567 e!168206))))

(declare-fun mapKey!11264 () (_ BitVec 32))

(declare-fun mapValue!11264 () ValueCell!2960)

(declare-fun mapRest!11264 () (Array (_ BitVec 32) ValueCell!2960))

(assert (=> mapNonEmpty!11264 (= mapRest!11263 (store mapRest!11264 mapKey!11264 mapValue!11264))))

(declare-fun mapIsEmpty!11264 () Bool)

(assert (=> mapIsEmpty!11264 mapRes!11264))

(declare-fun b!259562 () Bool)

(assert (=> b!259562 (= e!168206 tp_is_empty!6607)))

(declare-fun b!259563 () Bool)

(assert (=> b!259563 (= e!168207 tp_is_empty!6607)))

(assert (= (and mapNonEmpty!11263 condMapEmpty!11264) mapIsEmpty!11264))

(assert (= (and mapNonEmpty!11263 (not condMapEmpty!11264)) mapNonEmpty!11264))

(assert (= (and mapNonEmpty!11264 ((_ is ValueCellFull!2960) mapValue!11264)) b!259562))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2960) mapDefault!11264)) b!259563))

(declare-fun m!275439 () Bool)

(assert (=> mapNonEmpty!11264 m!275439))

(declare-fun b_lambda!8263 () Bool)

(assert (= b_lambda!8255 (or (and b!258803 b_free!6745) b_lambda!8263)))

(declare-fun b_lambda!8265 () Bool)

(assert (= b_lambda!8259 (or (and b!258803 b_free!6745) b_lambda!8265)))

(declare-fun b_lambda!8267 () Bool)

(assert (= b_lambda!8257 (or (and b!258803 b_free!6745) b_lambda!8267)))

(declare-fun b_lambda!8269 () Bool)

(assert (= b_lambda!8253 (or (and b!258803 b_free!6745) b_lambda!8269)))

(declare-fun b_lambda!8271 () Bool)

(assert (= b_lambda!8261 (or (and b!258803 b_free!6745) b_lambda!8271)))

(check-sat (not b!259361) (not b!259480) (not d!62393) (not d!62311) (not bm!24678) (not d!62337) (not b!259532) (not bm!24668) (not b!259509) (not d!62295) (not d!62315) (not bm!24696) (not d!62365) (not b!259527) (not d!62275) (not d!62325) (not b!259408) (not b!259290) (not d!62389) (not d!62431) (not bm!24674) (not d!62459) (not b!259405) (not b!259484) (not d!62425) (not b!259310) (not b!259366) (not b!259547) (not bm!24694) (not b!259472) (not d!62265) (not d!62457) (not b!259483) (not b!259234) (not d!62335) (not b!259421) (not b_lambda!8265) (not b!259554) (not b_lambda!8271) (not bm!24677) (not b!259542) (not d!62441) (not b!259531) (not b!259294) (not b!259196) (not d!62387) (not d!62415) (not b!259327) (not b!259456) (not b!259403) (not d!62377) (not bm!24695) (not d!62379) (not b!259235) (not b!259479) (not b!259508) (not b!259225) (not b!259476) (not b!259244) (not b!259363) (not b!259498) (not d!62303) (not b!259229) (not b!259389) (not b!259360) (not b!259535) (not b!259410) (not b!259331) (not b!259526) (not bm!24672) (not b!259502) (not b!259428) (not b!259478) (not b!259287) (not d!62435) (not d!62277) (not d!62421) (not d!62263) (not d!62299) (not d!62319) (not d!62455) (not b!259506) (not b_lambda!8269) (not b!259510) (not b!259236) (not b!259539) (not d!62397) (not b!259505) (not d!62409) (not b!259537) (not b!259467) (not d!62273) (not d!62381) (not b!259519) (not d!62287) (not b!259500) (not d!62339) (not b!259515) (not d!62353) (not b!259227) (not bm!24680) (not d!62291) (not bm!24690) (not b!259514) (not b!259464) (not d!62385) (not d!62391) (not b!259305) (not d!62419) (not bm!24671) (not b!259551) (not b!259333) (not b!259326) (not d!62341) (not d!62283) (not b!259198) (not d!62405) (not b!259485) (not bm!24689) (not b!259560) (not b!259529) (not bm!24662) (not bm!24670) (not d!62375) (not b!259477) (not b_lambda!8267) (not b!259358) (not d!62429) (not b!259304) (not b!259558) (not b_lambda!8249) (not d!62343) (not b!259452) (not b!259228) (not b!259311) (not mapNonEmpty!11264) (not b!259343) (not b!259407) (not d!62349) (not d!62395) (not d!62347) (not d!62351) (not d!62433) (not b!259309) (not b!259334) (not b!259398) (not b!259316) b_and!13865 (not d!62383) (not b!259496) (not b!259348) (not d!62451) (not b!259288) (not b_lambda!8251) (not b!259365) (not b!259364) (not d!62399) (not b!259230) (not d!62401) (not b!259315) (not d!62423) (not b!259556) (not b!259494) (not b!259534) (not d!62373) (not b!259346) (not b!259552) (not b!259319) (not b!259497) (not b!259342) (not d!62305) (not bm!24663) (not b!259557) (not d!62453) (not b!259340) (not b!259504) tp_is_empty!6607 (not b!259341) (not d!62371) (not d!62269) (not d!62437) (not b!259396) (not b!259307) (not bm!24692) (not b!259427) (not b!259245) (not b!259495) (not bm!24693) (not b!259512) (not b!259525) (not b!259555) (not b!259238) (not bm!24691) (not b!259528) (not b!259493) (not d!62413) (not b_next!6745) (not b!259226) (not b!259503) (not d!62367) (not d!62317) (not bm!24676) (not b_lambda!8263) (not d!62321) (not d!62329) (not bm!24669) (not d!62427) (not b!259232) (not d!62279) (not b!259317) (not d!62331) (not d!62417) (not b!259329) (not b!259451) (not d!62403) (not b!259518) (not d!62439) (not b!259352))
(check-sat b_and!13865 (not b_next!6745))
