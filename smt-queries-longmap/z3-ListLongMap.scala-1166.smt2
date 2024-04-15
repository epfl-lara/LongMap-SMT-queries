; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24764 () Bool)

(assert start!24764)

(declare-fun b!258608 () Bool)

(declare-fun b_free!6745 () Bool)

(declare-fun b_next!6745 () Bool)

(assert (=> b!258608 (= b_free!6745 (not b_next!6745))))

(declare-fun tp!23550 () Bool)

(declare-fun b_and!13807 () Bool)

(assert (=> b!258608 (= tp!23550 b_and!13807)))

(declare-fun b!258607 () Bool)

(declare-fun e!167611 () Bool)

(declare-datatypes ((V!8457 0))(
  ( (V!8458 (val!3348 Int)) )
))
(declare-datatypes ((ValueCell!2960 0))(
  ( (ValueCellFull!2960 (v!5446 V!8457)) (EmptyCell!2960) )
))
(declare-datatypes ((array!12555 0))(
  ( (array!12556 (arr!5943 (Array (_ BitVec 32) ValueCell!2960)) (size!6292 (_ BitVec 32))) )
))
(declare-datatypes ((array!12557 0))(
  ( (array!12558 (arr!5944 (Array (_ BitVec 32) (_ BitVec 64))) (size!6293 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3820 0))(
  ( (LongMapFixedSize!3821 (defaultEntry!4773 Int) (mask!11080 (_ BitVec 32)) (extraKeys!4510 (_ BitVec 32)) (zeroValue!4614 V!8457) (minValue!4614 V!8457) (_size!1959 (_ BitVec 32)) (_keys!6946 array!12557) (_values!4756 array!12555) (_vacant!1959 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3820)

(assert (=> b!258607 (= e!167611 (or (not (= (size!6292 (_values!4756 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11080 thiss!1504)))) (= (size!6293 (_keys!6946 thiss!1504)) (size!6292 (_values!4756 thiss!1504)))))))

(declare-fun e!167610 () Bool)

(declare-fun tp_is_empty!6607 () Bool)

(declare-fun e!167614 () Bool)

(declare-fun array_inv!3933 (array!12557) Bool)

(declare-fun array_inv!3934 (array!12555) Bool)

(assert (=> b!258608 (= e!167614 (and tp!23550 tp_is_empty!6607 (array_inv!3933 (_keys!6946 thiss!1504)) (array_inv!3934 (_values!4756 thiss!1504)) e!167610))))

(declare-fun mapNonEmpty!11254 () Bool)

(declare-fun mapRes!11254 () Bool)

(declare-fun tp!23551 () Bool)

(declare-fun e!167617 () Bool)

(assert (=> mapNonEmpty!11254 (= mapRes!11254 (and tp!23551 e!167617))))

(declare-fun mapKey!11254 () (_ BitVec 32))

(declare-fun mapRest!11254 () (Array (_ BitVec 32) ValueCell!2960))

(declare-fun mapValue!11254 () ValueCell!2960)

(assert (=> mapNonEmpty!11254 (= (arr!5943 (_values!4756 thiss!1504)) (store mapRest!11254 mapKey!11254 mapValue!11254))))

(declare-fun b!258609 () Bool)

(declare-fun e!167609 () Bool)

(declare-fun call!24592 () Bool)

(assert (=> b!258609 (= e!167609 (not call!24592))))

(declare-fun b!258610 () Bool)

(declare-fun e!167616 () Bool)

(declare-fun e!167620 () Bool)

(assert (=> b!258610 (= e!167616 e!167620)))

(declare-fun res!126428 () Bool)

(declare-fun call!24593 () Bool)

(assert (=> b!258610 (= res!126428 call!24593)))

(assert (=> b!258610 (=> (not res!126428) (not e!167620))))

(declare-fun b!258611 () Bool)

(declare-fun res!126425 () Bool)

(assert (=> b!258611 (=> (not res!126425) (not e!167609))))

(assert (=> b!258611 (= res!126425 call!24593)))

(declare-fun e!167618 () Bool)

(assert (=> b!258611 (= e!167618 e!167609)))

(declare-fun b!258612 () Bool)

(declare-fun e!167612 () Bool)

(assert (=> b!258612 (= e!167610 (and e!167612 mapRes!11254))))

(declare-fun condMapEmpty!11254 () Bool)

(declare-fun mapDefault!11254 () ValueCell!2960)

(assert (=> b!258612 (= condMapEmpty!11254 (= (arr!5943 (_values!4756 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11254)))))

(declare-fun b!258613 () Bool)

(declare-fun res!126432 () Bool)

(declare-fun e!167615 () Bool)

(assert (=> b!258613 (=> (not res!126432) (not e!167615))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!258613 (= res!126432 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!126431 () Bool)

(assert (=> start!24764 (=> (not res!126431) (not e!167615))))

(declare-fun valid!1497 (LongMapFixedSize!3820) Bool)

(assert (=> start!24764 (= res!126431 (valid!1497 thiss!1504))))

(assert (=> start!24764 e!167615))

(assert (=> start!24764 e!167614))

(assert (=> start!24764 true))

(assert (=> start!24764 tp_is_empty!6607))

(declare-fun b!258614 () Bool)

(assert (=> b!258614 (= e!167620 (not call!24592))))

(declare-fun b!258615 () Bool)

(declare-datatypes ((Unit!8002 0))(
  ( (Unit!8003) )
))
(declare-fun e!167608 () Unit!8002)

(declare-fun Unit!8004 () Unit!8002)

(assert (=> b!258615 (= e!167608 Unit!8004)))

(declare-fun b!258616 () Bool)

(declare-fun c!43844 () Bool)

(declare-datatypes ((SeekEntryResult!1172 0))(
  ( (MissingZero!1172 (index!6858 (_ BitVec 32))) (Found!1172 (index!6859 (_ BitVec 32))) (Intermediate!1172 (undefined!1984 Bool) (index!6860 (_ BitVec 32)) (x!25065 (_ BitVec 32))) (Undefined!1172) (MissingVacant!1172 (index!6861 (_ BitVec 32))) )
))
(declare-fun lt!130101 () SeekEntryResult!1172)

(get-info :version)

(assert (=> b!258616 (= c!43844 ((_ is MissingVacant!1172) lt!130101))))

(assert (=> b!258616 (= e!167618 e!167616)))

(declare-fun b!258617 () Bool)

(assert (=> b!258617 (= e!167612 tp_is_empty!6607)))

(declare-fun b!258618 () Bool)

(declare-fun Unit!8005 () Unit!8002)

(assert (=> b!258618 (= e!167608 Unit!8005)))

(declare-fun lt!130103 () Unit!8002)

(declare-fun lemmaArrayContainsKeyThenInListMap!247 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) (_ BitVec 32) Int) Unit!8002)

(assert (=> b!258618 (= lt!130103 (lemmaArrayContainsKeyThenInListMap!247 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258618 false))

(declare-fun b!258619 () Bool)

(declare-fun e!167613 () Unit!8002)

(declare-fun Unit!8006 () Unit!8002)

(assert (=> b!258619 (= e!167613 Unit!8006)))

(declare-fun lt!130100 () Unit!8002)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8002)

(assert (=> b!258619 (= lt!130100 (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> b!258619 false))

(declare-fun b!258620 () Bool)

(declare-fun e!167622 () Bool)

(assert (=> b!258620 (= e!167615 e!167622)))

(declare-fun res!126430 () Bool)

(assert (=> b!258620 (=> (not res!126430) (not e!167622))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!258620 (= res!126430 (or (= lt!130101 (MissingZero!1172 index!297)) (= lt!130101 (MissingVacant!1172 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12557 (_ BitVec 32)) SeekEntryResult!1172)

(assert (=> b!258620 (= lt!130101 (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun b!258621 () Bool)

(declare-fun e!167619 () Bool)

(assert (=> b!258621 (= e!167622 e!167619)))

(declare-fun res!126429 () Bool)

(assert (=> b!258621 (=> (not res!126429) (not e!167619))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258621 (= res!126429 (inRange!0 index!297 (mask!11080 thiss!1504)))))

(declare-fun lt!130110 () Unit!8002)

(assert (=> b!258621 (= lt!130110 e!167613)))

(declare-fun c!43845 () Bool)

(declare-datatypes ((tuple2!4884 0))(
  ( (tuple2!4885 (_1!2453 (_ BitVec 64)) (_2!2453 V!8457)) )
))
(declare-datatypes ((List!3783 0))(
  ( (Nil!3780) (Cons!3779 (h!4442 tuple2!4884) (t!8839 List!3783)) )
))
(declare-datatypes ((ListLongMap!3787 0))(
  ( (ListLongMap!3788 (toList!1909 List!3783)) )
))
(declare-fun lt!130111 () ListLongMap!3787)

(declare-fun contains!1861 (ListLongMap!3787 (_ BitVec 64)) Bool)

(assert (=> b!258621 (= c!43845 (contains!1861 lt!130111 key!932))))

(declare-fun getCurrentListMap!1418 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) Int) ListLongMap!3787)

(assert (=> b!258621 (= lt!130111 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!258622 () Bool)

(assert (=> b!258622 (= e!167619 (not e!167611))))

(declare-fun res!126426 () Bool)

(assert (=> b!258622 (=> res!126426 e!167611)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258622 (= res!126426 (not (validMask!0 (mask!11080 thiss!1504))))))

(declare-fun lt!130102 () array!12557)

(declare-fun arrayCountValidKeys!0 (array!12557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258622 (= (arrayCountValidKeys!0 lt!130102 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130104 () Unit!8002)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12557 (_ BitVec 32)) Unit!8002)

(assert (=> b!258622 (= lt!130104 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130102 index!297))))

(declare-fun arrayContainsKey!0 (array!12557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!258622 (arrayContainsKey!0 lt!130102 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130099 () Unit!8002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12557 (_ BitVec 64) (_ BitVec 32)) Unit!8002)

(assert (=> b!258622 (= lt!130099 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130102 key!932 index!297))))

(declare-fun v!346 () V!8457)

(declare-fun +!697 (ListLongMap!3787 tuple2!4884) ListLongMap!3787)

(assert (=> b!258622 (= (+!697 lt!130111 (tuple2!4885 key!932 v!346)) (getCurrentListMap!1418 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130105 () Unit!8002)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!108 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) (_ BitVec 64) V!8457 Int) Unit!8002)

(assert (=> b!258622 (= lt!130105 (lemmaAddValidKeyToArrayThenAddPairToListMap!108 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12557 (_ BitVec 32)) Bool)

(assert (=> b!258622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130102 (mask!11080 thiss!1504))))

(declare-fun lt!130109 () Unit!8002)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12557 (_ BitVec 32) (_ BitVec 32)) Unit!8002)

(assert (=> b!258622 (= lt!130109 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) index!297 (mask!11080 thiss!1504)))))

(assert (=> b!258622 (= (arrayCountValidKeys!0 lt!130102 #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504)))))))

(declare-fun lt!130112 () Unit!8002)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12557 (_ BitVec 32) (_ BitVec 64)) Unit!8002)

(assert (=> b!258622 (= lt!130112 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6946 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3784 0))(
  ( (Nil!3781) (Cons!3780 (h!4443 (_ BitVec 64)) (t!8840 List!3784)) )
))
(declare-fun arrayNoDuplicates!0 (array!12557 (_ BitVec 32) List!3784) Bool)

(assert (=> b!258622 (arrayNoDuplicates!0 lt!130102 #b00000000000000000000000000000000 Nil!3781)))

(assert (=> b!258622 (= lt!130102 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun lt!130107 () Unit!8002)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3784) Unit!8002)

(assert (=> b!258622 (= lt!130107 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6946 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3781))))

(declare-fun lt!130108 () Unit!8002)

(assert (=> b!258622 (= lt!130108 e!167608)))

(declare-fun c!43847 () Bool)

(assert (=> b!258622 (= c!43847 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258623 () Bool)

(declare-fun res!126424 () Bool)

(assert (=> b!258623 (=> (not res!126424) (not e!167609))))

(assert (=> b!258623 (= res!126424 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6858 lt!130101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11254 () Bool)

(assert (=> mapIsEmpty!11254 mapRes!11254))

(declare-fun b!258624 () Bool)

(assert (=> b!258624 (= e!167617 tp_is_empty!6607)))

(declare-fun b!258625 () Bool)

(declare-fun lt!130106 () Unit!8002)

(assert (=> b!258625 (= e!167613 lt!130106)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!436 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8002)

(assert (=> b!258625 (= lt!130106 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!436 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(declare-fun c!43846 () Bool)

(assert (=> b!258625 (= c!43846 ((_ is MissingZero!1172) lt!130101))))

(assert (=> b!258625 e!167618))

(declare-fun bm!24589 () Bool)

(assert (=> bm!24589 (= call!24592 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258626 () Bool)

(assert (=> b!258626 (= e!167616 ((_ is Undefined!1172) lt!130101))))

(declare-fun b!258627 () Bool)

(declare-fun res!126427 () Bool)

(assert (=> b!258627 (= res!126427 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6861 lt!130101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258627 (=> (not res!126427) (not e!167620))))

(declare-fun bm!24590 () Bool)

(assert (=> bm!24590 (= call!24593 (inRange!0 (ite c!43846 (index!6858 lt!130101) (index!6861 lt!130101)) (mask!11080 thiss!1504)))))

(assert (= (and start!24764 res!126431) b!258613))

(assert (= (and b!258613 res!126432) b!258620))

(assert (= (and b!258620 res!126430) b!258621))

(assert (= (and b!258621 c!43845) b!258619))

(assert (= (and b!258621 (not c!43845)) b!258625))

(assert (= (and b!258625 c!43846) b!258611))

(assert (= (and b!258625 (not c!43846)) b!258616))

(assert (= (and b!258611 res!126425) b!258623))

(assert (= (and b!258623 res!126424) b!258609))

(assert (= (and b!258616 c!43844) b!258610))

(assert (= (and b!258616 (not c!43844)) b!258626))

(assert (= (and b!258610 res!126428) b!258627))

(assert (= (and b!258627 res!126427) b!258614))

(assert (= (or b!258611 b!258610) bm!24590))

(assert (= (or b!258609 b!258614) bm!24589))

(assert (= (and b!258621 res!126429) b!258622))

(assert (= (and b!258622 c!43847) b!258618))

(assert (= (and b!258622 (not c!43847)) b!258615))

(assert (= (and b!258622 (not res!126426)) b!258607))

(assert (= (and b!258612 condMapEmpty!11254) mapIsEmpty!11254))

(assert (= (and b!258612 (not condMapEmpty!11254)) mapNonEmpty!11254))

(assert (= (and mapNonEmpty!11254 ((_ is ValueCellFull!2960) mapValue!11254)) b!258624))

(assert (= (and b!258612 ((_ is ValueCellFull!2960) mapDefault!11254)) b!258617))

(assert (= b!258608 b!258612))

(assert (= start!24764 b!258608))

(declare-fun m!273641 () Bool)

(assert (=> bm!24590 m!273641))

(declare-fun m!273643 () Bool)

(assert (=> start!24764 m!273643))

(declare-fun m!273645 () Bool)

(assert (=> b!258620 m!273645))

(declare-fun m!273647 () Bool)

(assert (=> b!258623 m!273647))

(declare-fun m!273649 () Bool)

(assert (=> b!258627 m!273649))

(declare-fun m!273651 () Bool)

(assert (=> b!258621 m!273651))

(declare-fun m!273653 () Bool)

(assert (=> b!258621 m!273653))

(declare-fun m!273655 () Bool)

(assert (=> b!258621 m!273655))

(declare-fun m!273657 () Bool)

(assert (=> bm!24589 m!273657))

(declare-fun m!273659 () Bool)

(assert (=> b!258619 m!273659))

(declare-fun m!273661 () Bool)

(assert (=> b!258622 m!273661))

(assert (=> b!258622 m!273657))

(declare-fun m!273663 () Bool)

(assert (=> b!258622 m!273663))

(declare-fun m!273665 () Bool)

(assert (=> b!258622 m!273665))

(declare-fun m!273667 () Bool)

(assert (=> b!258622 m!273667))

(declare-fun m!273669 () Bool)

(assert (=> b!258622 m!273669))

(declare-fun m!273671 () Bool)

(assert (=> b!258622 m!273671))

(declare-fun m!273673 () Bool)

(assert (=> b!258622 m!273673))

(declare-fun m!273675 () Bool)

(assert (=> b!258622 m!273675))

(declare-fun m!273677 () Bool)

(assert (=> b!258622 m!273677))

(declare-fun m!273679 () Bool)

(assert (=> b!258622 m!273679))

(declare-fun m!273681 () Bool)

(assert (=> b!258622 m!273681))

(declare-fun m!273683 () Bool)

(assert (=> b!258622 m!273683))

(declare-fun m!273685 () Bool)

(assert (=> b!258622 m!273685))

(declare-fun m!273687 () Bool)

(assert (=> b!258622 m!273687))

(declare-fun m!273689 () Bool)

(assert (=> b!258622 m!273689))

(declare-fun m!273691 () Bool)

(assert (=> b!258622 m!273691))

(declare-fun m!273693 () Bool)

(assert (=> b!258622 m!273693))

(declare-fun m!273695 () Bool)

(assert (=> b!258625 m!273695))

(declare-fun m!273697 () Bool)

(assert (=> b!258618 m!273697))

(declare-fun m!273699 () Bool)

(assert (=> b!258608 m!273699))

(declare-fun m!273701 () Bool)

(assert (=> b!258608 m!273701))

(declare-fun m!273703 () Bool)

(assert (=> mapNonEmpty!11254 m!273703))

(check-sat (not b!258625) (not b_next!6745) (not b!258618) tp_is_empty!6607 (not b!258620) (not start!24764) (not b!258621) (not b!258622) (not b!258608) (not bm!24590) b_and!13807 (not b!258619) (not bm!24589) (not mapNonEmpty!11254))
(check-sat b_and!13807 (not b_next!6745))
(get-model)

(declare-fun d!61987 () Bool)

(declare-fun e!167715 () Bool)

(assert (=> d!61987 e!167715))

(declare-fun res!126492 () Bool)

(assert (=> d!61987 (=> (not res!126492) (not e!167715))))

(declare-fun lt!130207 () ListLongMap!3787)

(assert (=> d!61987 (= res!126492 (contains!1861 lt!130207 (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun lt!130206 () List!3783)

(assert (=> d!61987 (= lt!130207 (ListLongMap!3788 lt!130206))))

(declare-fun lt!130205 () Unit!8002)

(declare-fun lt!130208 () Unit!8002)

(assert (=> d!61987 (= lt!130205 lt!130208)))

(declare-datatypes ((Option!318 0))(
  ( (Some!317 (v!5451 V!8457)) (None!316) )
))
(declare-fun getValueByKey!312 (List!3783 (_ BitVec 64)) Option!318)

(assert (=> d!61987 (= (getValueByKey!312 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346))) (Some!317 (_2!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!171 (List!3783 (_ BitVec 64) V!8457) Unit!8002)

(assert (=> d!61987 (= lt!130208 (lemmaContainsTupThenGetReturnValue!171 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun insertStrictlySorted!174 (List!3783 (_ BitVec 64) V!8457) List!3783)

(assert (=> d!61987 (= lt!130206 (insertStrictlySorted!174 (toList!1909 lt!130111) (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> d!61987 (= (+!697 lt!130111 (tuple2!4885 key!932 v!346)) lt!130207)))

(declare-fun b!258758 () Bool)

(declare-fun res!126491 () Bool)

(assert (=> b!258758 (=> (not res!126491) (not e!167715))))

(assert (=> b!258758 (= res!126491 (= (getValueByKey!312 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346))) (Some!317 (_2!2453 (tuple2!4885 key!932 v!346)))))))

(declare-fun b!258759 () Bool)

(declare-fun contains!1863 (List!3783 tuple2!4884) Bool)

(assert (=> b!258759 (= e!167715 (contains!1863 (toList!1909 lt!130207) (tuple2!4885 key!932 v!346)))))

(assert (= (and d!61987 res!126492) b!258758))

(assert (= (and b!258758 res!126491) b!258759))

(declare-fun m!273833 () Bool)

(assert (=> d!61987 m!273833))

(declare-fun m!273835 () Bool)

(assert (=> d!61987 m!273835))

(declare-fun m!273837 () Bool)

(assert (=> d!61987 m!273837))

(declare-fun m!273839 () Bool)

(assert (=> d!61987 m!273839))

(declare-fun m!273841 () Bool)

(assert (=> b!258758 m!273841))

(declare-fun m!273843 () Bool)

(assert (=> b!258759 m!273843))

(assert (=> b!258622 d!61987))

(declare-fun b!258768 () Bool)

(declare-fun e!167723 () Bool)

(declare-fun e!167722 () Bool)

(assert (=> b!258768 (= e!167723 e!167722)))

(declare-fun lt!130215 () (_ BitVec 64))

(assert (=> b!258768 (= lt!130215 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(declare-fun lt!130217 () Unit!8002)

(assert (=> b!258768 (= lt!130217 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130102 lt!130215 #b00000000000000000000000000000000))))

(assert (=> b!258768 (arrayContainsKey!0 lt!130102 lt!130215 #b00000000000000000000000000000000)))

(declare-fun lt!130216 () Unit!8002)

(assert (=> b!258768 (= lt!130216 lt!130217)))

(declare-fun res!126498 () Bool)

(assert (=> b!258768 (= res!126498 (= (seekEntryOrOpen!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) lt!130102 (mask!11080 thiss!1504)) (Found!1172 #b00000000000000000000000000000000)))))

(assert (=> b!258768 (=> (not res!126498) (not e!167722))))

(declare-fun b!258769 () Bool)

(declare-fun call!24608 () Bool)

(assert (=> b!258769 (= e!167722 call!24608)))

(declare-fun b!258770 () Bool)

(assert (=> b!258770 (= e!167723 call!24608)))

(declare-fun b!258771 () Bool)

(declare-fun e!167724 () Bool)

(assert (=> b!258771 (= e!167724 e!167723)))

(declare-fun c!43874 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!258771 (= c!43874 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun bm!24605 () Bool)

(assert (=> bm!24605 (= call!24608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130102 (mask!11080 thiss!1504)))))

(declare-fun d!61989 () Bool)

(declare-fun res!126497 () Bool)

(assert (=> d!61989 (=> res!126497 e!167724)))

(assert (=> d!61989 (= res!126497 (bvsge #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(assert (=> d!61989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130102 (mask!11080 thiss!1504)) e!167724)))

(assert (= (and d!61989 (not res!126497)) b!258771))

(assert (= (and b!258771 c!43874) b!258768))

(assert (= (and b!258771 (not c!43874)) b!258770))

(assert (= (and b!258768 res!126498) b!258769))

(assert (= (or b!258769 b!258770) bm!24605))

(declare-fun m!273845 () Bool)

(assert (=> b!258768 m!273845))

(declare-fun m!273847 () Bool)

(assert (=> b!258768 m!273847))

(declare-fun m!273849 () Bool)

(assert (=> b!258768 m!273849))

(assert (=> b!258768 m!273845))

(declare-fun m!273851 () Bool)

(assert (=> b!258768 m!273851))

(assert (=> b!258771 m!273845))

(assert (=> b!258771 m!273845))

(declare-fun m!273853 () Bool)

(assert (=> b!258771 m!273853))

(declare-fun m!273855 () Bool)

(assert (=> bm!24605 m!273855))

(assert (=> b!258622 d!61989))

(declare-fun d!61991 () Bool)

(declare-fun lt!130220 () (_ BitVec 32))

(assert (=> d!61991 (and (bvsge lt!130220 #b00000000000000000000000000000000) (bvsle lt!130220 (bvsub (size!6293 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167729 () (_ BitVec 32))

(assert (=> d!61991 (= lt!130220 e!167729)))

(declare-fun c!43880 () Bool)

(assert (=> d!61991 (= c!43880 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!61991 (and (bvsle #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6293 (_keys!6946 thiss!1504)) (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!61991 (= (arrayCountValidKeys!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) lt!130220)))

(declare-fun b!258780 () Bool)

(declare-fun e!167730 () (_ BitVec 32))

(assert (=> b!258780 (= e!167729 e!167730)))

(declare-fun c!43879 () Bool)

(assert (=> b!258780 (= c!43879 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24608 () Bool)

(declare-fun call!24611 () (_ BitVec 32))

(assert (=> bm!24608 (= call!24611 (arrayCountValidKeys!0 (_keys!6946 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258781 () Bool)

(assert (=> b!258781 (= e!167729 #b00000000000000000000000000000000)))

(declare-fun b!258782 () Bool)

(assert (=> b!258782 (= e!167730 (bvadd #b00000000000000000000000000000001 call!24611))))

(declare-fun b!258783 () Bool)

(assert (=> b!258783 (= e!167730 call!24611)))

(assert (= (and d!61991 c!43880) b!258781))

(assert (= (and d!61991 (not c!43880)) b!258780))

(assert (= (and b!258780 c!43879) b!258782))

(assert (= (and b!258780 (not c!43879)) b!258783))

(assert (= (or b!258782 b!258783) bm!24608))

(declare-fun m!273857 () Bool)

(assert (=> b!258780 m!273857))

(assert (=> b!258780 m!273857))

(declare-fun m!273859 () Bool)

(assert (=> b!258780 m!273859))

(declare-fun m!273861 () Bool)

(assert (=> bm!24608 m!273861))

(assert (=> b!258622 d!61991))

(declare-fun d!61993 () Bool)

(declare-fun e!167733 () Bool)

(assert (=> d!61993 e!167733))

(declare-fun res!126501 () Bool)

(assert (=> d!61993 (=> (not res!126501) (not e!167733))))

(assert (=> d!61993 (= res!126501 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 (_keys!6946 thiss!1504))) (bvslt index!297 (size!6292 (_values!4756 thiss!1504)))))))

(declare-fun lt!130223 () Unit!8002)

(declare-fun choose!1259 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) (_ BitVec 64) V!8457 Int) Unit!8002)

(assert (=> d!61993 (= lt!130223 (choose!1259 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!61993 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!61993 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!108 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)) lt!130223)))

(declare-fun b!258786 () Bool)

(assert (=> b!258786 (= e!167733 (= (+!697 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4885 key!932 v!346)) (getCurrentListMap!1418 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))))))

(assert (= (and d!61993 res!126501) b!258786))

(declare-fun m!273863 () Bool)

(assert (=> d!61993 m!273863))

(assert (=> d!61993 m!273661))

(assert (=> b!258786 m!273655))

(assert (=> b!258786 m!273677))

(assert (=> b!258786 m!273667))

(assert (=> b!258786 m!273655))

(declare-fun m!273865 () Bool)

(assert (=> b!258786 m!273865))

(declare-fun m!273867 () Bool)

(assert (=> b!258786 m!273867))

(assert (=> b!258622 d!61993))

(declare-fun d!61995 () Bool)

(assert (=> d!61995 (= (validMask!0 (mask!11080 thiss!1504)) (and (or (= (mask!11080 thiss!1504) #b00000000000000000000000000000111) (= (mask!11080 thiss!1504) #b00000000000000000000000000001111) (= (mask!11080 thiss!1504) #b00000000000000000000000000011111) (= (mask!11080 thiss!1504) #b00000000000000000000000000111111) (= (mask!11080 thiss!1504) #b00000000000000000000000001111111) (= (mask!11080 thiss!1504) #b00000000000000000000000011111111) (= (mask!11080 thiss!1504) #b00000000000000000000000111111111) (= (mask!11080 thiss!1504) #b00000000000000000000001111111111) (= (mask!11080 thiss!1504) #b00000000000000000000011111111111) (= (mask!11080 thiss!1504) #b00000000000000000000111111111111) (= (mask!11080 thiss!1504) #b00000000000000000001111111111111) (= (mask!11080 thiss!1504) #b00000000000000000011111111111111) (= (mask!11080 thiss!1504) #b00000000000000000111111111111111) (= (mask!11080 thiss!1504) #b00000000000000001111111111111111) (= (mask!11080 thiss!1504) #b00000000000000011111111111111111) (= (mask!11080 thiss!1504) #b00000000000000111111111111111111) (= (mask!11080 thiss!1504) #b00000000000001111111111111111111) (= (mask!11080 thiss!1504) #b00000000000011111111111111111111) (= (mask!11080 thiss!1504) #b00000000000111111111111111111111) (= (mask!11080 thiss!1504) #b00000000001111111111111111111111) (= (mask!11080 thiss!1504) #b00000000011111111111111111111111) (= (mask!11080 thiss!1504) #b00000000111111111111111111111111) (= (mask!11080 thiss!1504) #b00000001111111111111111111111111) (= (mask!11080 thiss!1504) #b00000011111111111111111111111111) (= (mask!11080 thiss!1504) #b00000111111111111111111111111111) (= (mask!11080 thiss!1504) #b00001111111111111111111111111111) (= (mask!11080 thiss!1504) #b00011111111111111111111111111111) (= (mask!11080 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11080 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!258622 d!61995))

(declare-fun d!61997 () Bool)

(declare-fun lt!130224 () (_ BitVec 32))

(assert (=> d!61997 (and (bvsge lt!130224 #b00000000000000000000000000000000) (bvsle lt!130224 (bvsub (size!6293 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun e!167734 () (_ BitVec 32))

(assert (=> d!61997 (= lt!130224 e!167734)))

(declare-fun c!43882 () Bool)

(assert (=> d!61997 (= c!43882 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!61997 (and (bvsle #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6293 (_keys!6946 thiss!1504)) (size!6293 lt!130102)))))

(assert (=> d!61997 (= (arrayCountValidKeys!0 lt!130102 #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) lt!130224)))

(declare-fun b!258787 () Bool)

(declare-fun e!167735 () (_ BitVec 32))

(assert (=> b!258787 (= e!167734 e!167735)))

(declare-fun c!43881 () Bool)

(assert (=> b!258787 (= c!43881 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun bm!24609 () Bool)

(declare-fun call!24612 () (_ BitVec 32))

(assert (=> bm!24609 (= call!24612 (arrayCountValidKeys!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258788 () Bool)

(assert (=> b!258788 (= e!167734 #b00000000000000000000000000000000)))

(declare-fun b!258789 () Bool)

(assert (=> b!258789 (= e!167735 (bvadd #b00000000000000000000000000000001 call!24612))))

(declare-fun b!258790 () Bool)

(assert (=> b!258790 (= e!167735 call!24612)))

(assert (= (and d!61997 c!43882) b!258788))

(assert (= (and d!61997 (not c!43882)) b!258787))

(assert (= (and b!258787 c!43881) b!258789))

(assert (= (and b!258787 (not c!43881)) b!258790))

(assert (= (or b!258789 b!258790) bm!24609))

(assert (=> b!258787 m!273845))

(assert (=> b!258787 m!273845))

(assert (=> b!258787 m!273853))

(declare-fun m!273869 () Bool)

(assert (=> bm!24609 m!273869))

(assert (=> b!258622 d!61997))

(declare-fun d!61999 () Bool)

(declare-fun lt!130225 () (_ BitVec 32))

(assert (=> d!61999 (and (bvsge lt!130225 #b00000000000000000000000000000000) (bvsle lt!130225 (bvsub (size!6293 lt!130102) index!297)))))

(declare-fun e!167736 () (_ BitVec 32))

(assert (=> d!61999 (= lt!130225 e!167736)))

(declare-fun c!43884 () Bool)

(assert (=> d!61999 (= c!43884 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61999 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6293 lt!130102)))))

(assert (=> d!61999 (= (arrayCountValidKeys!0 lt!130102 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130225)))

(declare-fun b!258791 () Bool)

(declare-fun e!167737 () (_ BitVec 32))

(assert (=> b!258791 (= e!167736 e!167737)))

(declare-fun c!43883 () Bool)

(assert (=> b!258791 (= c!43883 (validKeyInArray!0 (select (arr!5944 lt!130102) index!297)))))

(declare-fun bm!24610 () Bool)

(declare-fun call!24613 () (_ BitVec 32))

(assert (=> bm!24610 (= call!24613 (arrayCountValidKeys!0 lt!130102 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!258792 () Bool)

(assert (=> b!258792 (= e!167736 #b00000000000000000000000000000000)))

(declare-fun b!258793 () Bool)

(assert (=> b!258793 (= e!167737 (bvadd #b00000000000000000000000000000001 call!24613))))

(declare-fun b!258794 () Bool)

(assert (=> b!258794 (= e!167737 call!24613)))

(assert (= (and d!61999 c!43884) b!258792))

(assert (= (and d!61999 (not c!43884)) b!258791))

(assert (= (and b!258791 c!43883) b!258793))

(assert (= (and b!258791 (not c!43883)) b!258794))

(assert (= (or b!258793 b!258794) bm!24610))

(declare-fun m!273871 () Bool)

(assert (=> b!258791 m!273871))

(assert (=> b!258791 m!273871))

(declare-fun m!273873 () Bool)

(assert (=> b!258791 m!273873))

(declare-fun m!273875 () Bool)

(assert (=> bm!24610 m!273875))

(assert (=> b!258622 d!61999))

(declare-fun d!62001 () Bool)

(assert (=> d!62001 (arrayContainsKey!0 lt!130102 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130228 () Unit!8002)

(declare-fun choose!13 (array!12557 (_ BitVec 64) (_ BitVec 32)) Unit!8002)

(assert (=> d!62001 (= lt!130228 (choose!13 lt!130102 key!932 index!297))))

(assert (=> d!62001 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62001 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130102 key!932 index!297) lt!130228)))

(declare-fun bs!9099 () Bool)

(assert (= bs!9099 d!62001))

(assert (=> bs!9099 m!273693))

(declare-fun m!273877 () Bool)

(assert (=> bs!9099 m!273877))

(assert (=> b!258622 d!62001))

(declare-fun b!258805 () Bool)

(declare-fun e!167746 () Bool)

(declare-fun e!167748 () Bool)

(assert (=> b!258805 (= e!167746 e!167748)))

(declare-fun res!126508 () Bool)

(assert (=> b!258805 (=> (not res!126508) (not e!167748))))

(declare-fun e!167749 () Bool)

(assert (=> b!258805 (= res!126508 (not e!167749))))

(declare-fun res!126509 () Bool)

(assert (=> b!258805 (=> (not res!126509) (not e!167749))))

(assert (=> b!258805 (= res!126509 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!258806 () Bool)

(declare-fun e!167747 () Bool)

(assert (=> b!258806 (= e!167748 e!167747)))

(declare-fun c!43887 () Bool)

(assert (=> b!258806 (= c!43887 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun d!62003 () Bool)

(declare-fun res!126510 () Bool)

(assert (=> d!62003 (=> res!126510 e!167746)))

(assert (=> d!62003 (= res!126510 (bvsge #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(assert (=> d!62003 (= (arrayNoDuplicates!0 lt!130102 #b00000000000000000000000000000000 Nil!3781) e!167746)))

(declare-fun b!258807 () Bool)

(declare-fun call!24616 () Bool)

(assert (=> b!258807 (= e!167747 call!24616)))

(declare-fun b!258808 () Bool)

(declare-fun contains!1864 (List!3784 (_ BitVec 64)) Bool)

(assert (=> b!258808 (= e!167749 (contains!1864 Nil!3781 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!258809 () Bool)

(assert (=> b!258809 (= e!167747 call!24616)))

(declare-fun bm!24613 () Bool)

(assert (=> bm!24613 (= call!24616 (arrayNoDuplicates!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43887 (Cons!3780 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) Nil!3781) Nil!3781)))))

(assert (= (and d!62003 (not res!126510)) b!258805))

(assert (= (and b!258805 res!126509) b!258808))

(assert (= (and b!258805 res!126508) b!258806))

(assert (= (and b!258806 c!43887) b!258809))

(assert (= (and b!258806 (not c!43887)) b!258807))

(assert (= (or b!258809 b!258807) bm!24613))

(assert (=> b!258805 m!273845))

(assert (=> b!258805 m!273845))

(assert (=> b!258805 m!273853))

(assert (=> b!258806 m!273845))

(assert (=> b!258806 m!273845))

(assert (=> b!258806 m!273853))

(assert (=> b!258808 m!273845))

(assert (=> b!258808 m!273845))

(declare-fun m!273879 () Bool)

(assert (=> b!258808 m!273879))

(assert (=> bm!24613 m!273845))

(declare-fun m!273881 () Bool)

(assert (=> bm!24613 m!273881))

(assert (=> b!258622 d!62003))

(declare-fun d!62005 () Bool)

(assert (=> d!62005 (= (arrayCountValidKeys!0 lt!130102 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130231 () Unit!8002)

(declare-fun choose!2 (array!12557 (_ BitVec 32)) Unit!8002)

(assert (=> d!62005 (= lt!130231 (choose!2 lt!130102 index!297))))

(declare-fun e!167752 () Bool)

(assert (=> d!62005 e!167752))

(declare-fun res!126515 () Bool)

(assert (=> d!62005 (=> (not res!126515) (not e!167752))))

(assert (=> d!62005 (= res!126515 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 lt!130102))))))

(assert (=> d!62005 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130102 index!297) lt!130231)))

(declare-fun b!258814 () Bool)

(declare-fun res!126516 () Bool)

(assert (=> b!258814 (=> (not res!126516) (not e!167752))))

(assert (=> b!258814 (= res!126516 (validKeyInArray!0 (select (arr!5944 lt!130102) index!297)))))

(declare-fun b!258815 () Bool)

(assert (=> b!258815 (= e!167752 (bvslt (size!6293 lt!130102) #b01111111111111111111111111111111))))

(assert (= (and d!62005 res!126515) b!258814))

(assert (= (and b!258814 res!126516) b!258815))

(declare-fun m!273883 () Bool)

(assert (=> d!62005 m!273883))

(declare-fun m!273885 () Bool)

(assert (=> d!62005 m!273885))

(assert (=> b!258814 m!273871))

(assert (=> b!258814 m!273871))

(assert (=> b!258814 m!273873))

(assert (=> b!258622 d!62005))

(declare-fun d!62007 () Bool)

(declare-fun res!126521 () Bool)

(declare-fun e!167757 () Bool)

(assert (=> d!62007 (=> res!126521 e!167757)))

(assert (=> d!62007 (= res!126521 (= (select (arr!5944 lt!130102) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62007 (= (arrayContainsKey!0 lt!130102 key!932 #b00000000000000000000000000000000) e!167757)))

(declare-fun b!258820 () Bool)

(declare-fun e!167758 () Bool)

(assert (=> b!258820 (= e!167757 e!167758)))

(declare-fun res!126522 () Bool)

(assert (=> b!258820 (=> (not res!126522) (not e!167758))))

(assert (=> b!258820 (= res!126522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(declare-fun b!258821 () Bool)

(assert (=> b!258821 (= e!167758 (arrayContainsKey!0 lt!130102 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62007 (not res!126521)) b!258820))

(assert (= (and b!258820 res!126522) b!258821))

(assert (=> d!62007 m!273845))

(declare-fun m!273887 () Bool)

(assert (=> b!258821 m!273887))

(assert (=> b!258622 d!62007))

(declare-fun b!258832 () Bool)

(declare-fun e!167763 () Bool)

(assert (=> b!258832 (= e!167763 (bvslt (size!6293 (_keys!6946 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!258831 () Bool)

(declare-fun res!126534 () Bool)

(assert (=> b!258831 (=> (not res!126534) (not e!167763))))

(assert (=> b!258831 (= res!126534 (validKeyInArray!0 key!932))))

(declare-fun b!258830 () Bool)

(declare-fun res!126533 () Bool)

(assert (=> b!258830 (=> (not res!126533) (not e!167763))))

(assert (=> b!258830 (= res!126533 (not (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) index!297))))))

(declare-fun d!62009 () Bool)

(declare-fun e!167764 () Bool)

(assert (=> d!62009 e!167764))

(declare-fun res!126531 () Bool)

(assert (=> d!62009 (=> (not res!126531) (not e!167764))))

(assert (=> d!62009 (= res!126531 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 (_keys!6946 thiss!1504)))))))

(declare-fun lt!130234 () Unit!8002)

(declare-fun choose!1 (array!12557 (_ BitVec 32) (_ BitVec 64)) Unit!8002)

(assert (=> d!62009 (= lt!130234 (choose!1 (_keys!6946 thiss!1504) index!297 key!932))))

(assert (=> d!62009 e!167763))

(declare-fun res!126532 () Bool)

(assert (=> d!62009 (=> (not res!126532) (not e!167763))))

(assert (=> d!62009 (= res!126532 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 (_keys!6946 thiss!1504)))))))

(assert (=> d!62009 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6946 thiss!1504) index!297 key!932) lt!130234)))

(declare-fun b!258833 () Bool)

(assert (=> b!258833 (= e!167764 (= (arrayCountValidKeys!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!62009 res!126532) b!258830))

(assert (= (and b!258830 res!126533) b!258831))

(assert (= (and b!258831 res!126534) b!258832))

(assert (= (and d!62009 res!126531) b!258833))

(declare-fun m!273889 () Bool)

(assert (=> b!258831 m!273889))

(declare-fun m!273891 () Bool)

(assert (=> b!258830 m!273891))

(assert (=> b!258830 m!273891))

(declare-fun m!273893 () Bool)

(assert (=> b!258830 m!273893))

(declare-fun m!273895 () Bool)

(assert (=> d!62009 m!273895))

(assert (=> b!258833 m!273677))

(declare-fun m!273897 () Bool)

(assert (=> b!258833 m!273897))

(assert (=> b!258833 m!273679))

(assert (=> b!258622 d!62009))

(declare-fun d!62011 () Bool)

(declare-fun res!126535 () Bool)

(declare-fun e!167765 () Bool)

(assert (=> d!62011 (=> res!126535 e!167765)))

(assert (=> d!62011 (= res!126535 (= (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62011 (= (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 #b00000000000000000000000000000000) e!167765)))

(declare-fun b!258834 () Bool)

(declare-fun e!167766 () Bool)

(assert (=> b!258834 (= e!167765 e!167766)))

(declare-fun res!126536 () Bool)

(assert (=> b!258834 (=> (not res!126536) (not e!167766))))

(assert (=> b!258834 (= res!126536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258835 () Bool)

(assert (=> b!258835 (= e!167766 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62011 (not res!126535)) b!258834))

(assert (= (and b!258834 res!126536) b!258835))

(assert (=> d!62011 m!273857))

(declare-fun m!273899 () Bool)

(assert (=> b!258835 m!273899))

(assert (=> b!258622 d!62011))

(declare-fun d!62013 () Bool)

(declare-fun e!167769 () Bool)

(assert (=> d!62013 e!167769))

(declare-fun res!126539 () Bool)

(assert (=> d!62013 (=> (not res!126539) (not e!167769))))

(assert (=> d!62013 (= res!126539 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 (_keys!6946 thiss!1504)))))))

(declare-fun lt!130237 () Unit!8002)

(declare-fun choose!102 ((_ BitVec 64) array!12557 (_ BitVec 32) (_ BitVec 32)) Unit!8002)

(assert (=> d!62013 (= lt!130237 (choose!102 key!932 (_keys!6946 thiss!1504) index!297 (mask!11080 thiss!1504)))))

(assert (=> d!62013 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62013 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) index!297 (mask!11080 thiss!1504)) lt!130237)))

(declare-fun b!258838 () Bool)

(assert (=> b!258838 (= e!167769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (mask!11080 thiss!1504)))))

(assert (= (and d!62013 res!126539) b!258838))

(declare-fun m!273901 () Bool)

(assert (=> d!62013 m!273901))

(assert (=> d!62013 m!273661))

(assert (=> b!258838 m!273677))

(declare-fun m!273903 () Bool)

(assert (=> b!258838 m!273903))

(assert (=> b!258622 d!62013))

(declare-fun d!62015 () Bool)

(declare-fun e!167772 () Bool)

(assert (=> d!62015 e!167772))

(declare-fun res!126542 () Bool)

(assert (=> d!62015 (=> (not res!126542) (not e!167772))))

(assert (=> d!62015 (= res!126542 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6293 (_keys!6946 thiss!1504)))))))

(declare-fun lt!130240 () Unit!8002)

(declare-fun choose!41 (array!12557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3784) Unit!8002)

(assert (=> d!62015 (= lt!130240 (choose!41 (_keys!6946 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3781))))

(assert (=> d!62015 (bvslt (size!6293 (_keys!6946 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62015 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6946 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3781) lt!130240)))

(declare-fun b!258841 () Bool)

(assert (=> b!258841 (= e!167772 (arrayNoDuplicates!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 Nil!3781))))

(assert (= (and d!62015 res!126542) b!258841))

(declare-fun m!273905 () Bool)

(assert (=> d!62015 m!273905))

(assert (=> b!258841 m!273677))

(declare-fun m!273907 () Bool)

(assert (=> b!258841 m!273907))

(assert (=> b!258622 d!62015))

(declare-fun lt!130299 () ListLongMap!3787)

(declare-fun e!167806 () Bool)

(declare-fun b!258884 () Bool)

(declare-fun apply!256 (ListLongMap!3787 (_ BitVec 64)) V!8457)

(declare-fun get!3056 (ValueCell!2960 V!8457) V!8457)

(declare-fun dynLambda!590 (Int (_ BitVec 64)) V!8457)

(assert (=> b!258884 (= e!167806 (= (apply!256 lt!130299 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))))))))

(assert (=> b!258884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun b!258885 () Bool)

(declare-fun e!167808 () Bool)

(declare-fun call!24632 () Bool)

(assert (=> b!258885 (= e!167808 (not call!24632))))

(declare-fun b!258886 () Bool)

(declare-fun e!167805 () ListLongMap!3787)

(declare-fun call!24635 () ListLongMap!3787)

(assert (=> b!258886 (= e!167805 (+!697 call!24635 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun b!258887 () Bool)

(declare-fun e!167800 () Bool)

(assert (=> b!258887 (= e!167800 e!167808)))

(declare-fun c!43902 () Bool)

(assert (=> b!258887 (= c!43902 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258888 () Bool)

(declare-fun c!43904 () Bool)

(assert (=> b!258888 (= c!43904 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167802 () ListLongMap!3787)

(declare-fun e!167799 () ListLongMap!3787)

(assert (=> b!258888 (= e!167802 e!167799)))

(declare-fun b!258889 () Bool)

(declare-fun e!167804 () Bool)

(assert (=> b!258889 (= e!167804 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!258890 () Bool)

(declare-fun e!167811 () Bool)

(assert (=> b!258890 (= e!167811 (= (apply!256 lt!130299 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!258891 () Bool)

(declare-fun e!167810 () Unit!8002)

(declare-fun Unit!8010 () Unit!8002)

(assert (=> b!258891 (= e!167810 Unit!8010)))

(declare-fun b!258892 () Bool)

(declare-fun res!126563 () Bool)

(assert (=> b!258892 (=> (not res!126563) (not e!167800))))

(declare-fun e!167803 () Bool)

(assert (=> b!258892 (= res!126563 e!167803)))

(declare-fun res!126562 () Bool)

(assert (=> b!258892 (=> res!126562 e!167803)))

(assert (=> b!258892 (= res!126562 (not e!167804))))

(declare-fun res!126561 () Bool)

(assert (=> b!258892 (=> (not res!126561) (not e!167804))))

(assert (=> b!258892 (= res!126561 (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun bm!24628 () Bool)

(declare-fun call!24636 () ListLongMap!3787)

(declare-fun call!24634 () ListLongMap!3787)

(assert (=> bm!24628 (= call!24636 call!24634)))

(declare-fun b!258893 () Bool)

(assert (=> b!258893 (= e!167803 e!167806)))

(declare-fun res!126569 () Bool)

(assert (=> b!258893 (=> (not res!126569) (not e!167806))))

(assert (=> b!258893 (= res!126569 (contains!1861 lt!130299 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (=> b!258893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun b!258894 () Bool)

(declare-fun e!167801 () Bool)

(assert (=> b!258894 (= e!167801 e!167811)))

(declare-fun res!126567 () Bool)

(declare-fun call!24633 () Bool)

(assert (=> b!258894 (= res!126567 call!24633)))

(assert (=> b!258894 (=> (not res!126567) (not e!167811))))

(declare-fun bm!24629 () Bool)

(declare-fun call!24637 () ListLongMap!3787)

(assert (=> bm!24629 (= call!24634 call!24637)))

(declare-fun bm!24630 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!572 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 32) Int) ListLongMap!3787)

(assert (=> bm!24630 (= call!24637 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!258895 () Bool)

(assert (=> b!258895 (= e!167799 call!24636)))

(declare-fun b!258896 () Bool)

(declare-fun call!24631 () ListLongMap!3787)

(assert (=> b!258896 (= e!167802 call!24631)))

(declare-fun b!258897 () Bool)

(assert (=> b!258897 (= e!167799 call!24631)))

(declare-fun b!258898 () Bool)

(declare-fun e!167809 () Bool)

(assert (=> b!258898 (= e!167809 (= (apply!256 lt!130299 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun b!258899 () Bool)

(declare-fun res!126566 () Bool)

(assert (=> b!258899 (=> (not res!126566) (not e!167800))))

(assert (=> b!258899 (= res!126566 e!167801)))

(declare-fun c!43903 () Bool)

(assert (=> b!258899 (= c!43903 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!258900 () Bool)

(declare-fun lt!130301 () Unit!8002)

(assert (=> b!258900 (= e!167810 lt!130301)))

(declare-fun lt!130285 () ListLongMap!3787)

(assert (=> b!258900 (= lt!130285 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130300 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130290 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130290 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(declare-fun lt!130302 () Unit!8002)

(declare-fun addStillContains!232 (ListLongMap!3787 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8002)

(assert (=> b!258900 (= lt!130302 (addStillContains!232 lt!130285 lt!130300 (zeroValue!4614 thiss!1504) lt!130290))))

(assert (=> b!258900 (contains!1861 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) lt!130290)))

(declare-fun lt!130304 () Unit!8002)

(assert (=> b!258900 (= lt!130304 lt!130302)))

(declare-fun lt!130288 () ListLongMap!3787)

(assert (=> b!258900 (= lt!130288 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130294 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130303 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130303 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(declare-fun lt!130306 () Unit!8002)

(declare-fun addApplyDifferent!232 (ListLongMap!3787 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8002)

(assert (=> b!258900 (= lt!130306 (addApplyDifferent!232 lt!130288 lt!130294 (minValue!4614 thiss!1504) lt!130303))))

(assert (=> b!258900 (= (apply!256 (+!697 lt!130288 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) lt!130303) (apply!256 lt!130288 lt!130303))))

(declare-fun lt!130289 () Unit!8002)

(assert (=> b!258900 (= lt!130289 lt!130306)))

(declare-fun lt!130305 () ListLongMap!3787)

(assert (=> b!258900 (= lt!130305 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130291 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130287 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130287 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(declare-fun lt!130297 () Unit!8002)

(assert (=> b!258900 (= lt!130297 (addApplyDifferent!232 lt!130305 lt!130291 (zeroValue!4614 thiss!1504) lt!130287))))

(assert (=> b!258900 (= (apply!256 (+!697 lt!130305 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) lt!130287) (apply!256 lt!130305 lt!130287))))

(declare-fun lt!130286 () Unit!8002)

(assert (=> b!258900 (= lt!130286 lt!130297)))

(declare-fun lt!130292 () ListLongMap!3787)

(assert (=> b!258900 (= lt!130292 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130296 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130296 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130293 () (_ BitVec 64))

(assert (=> b!258900 (= lt!130293 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(assert (=> b!258900 (= lt!130301 (addApplyDifferent!232 lt!130292 lt!130296 (minValue!4614 thiss!1504) lt!130293))))

(assert (=> b!258900 (= (apply!256 (+!697 lt!130292 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) lt!130293) (apply!256 lt!130292 lt!130293))))

(declare-fun c!43905 () Bool)

(declare-fun c!43901 () Bool)

(declare-fun bm!24631 () Bool)

(assert (=> bm!24631 (= call!24635 (+!697 (ite c!43901 call!24637 (ite c!43905 call!24634 call!24636)) (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun bm!24632 () Bool)

(assert (=> bm!24632 (= call!24631 call!24635)))

(declare-fun bm!24633 () Bool)

(assert (=> bm!24633 (= call!24632 (contains!1861 lt!130299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258901 () Bool)

(declare-fun e!167807 () Bool)

(assert (=> b!258901 (= e!167807 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun d!62017 () Bool)

(assert (=> d!62017 e!167800))

(declare-fun res!126568 () Bool)

(assert (=> d!62017 (=> (not res!126568) (not e!167800))))

(assert (=> d!62017 (= res!126568 (or (bvsge #b00000000000000000000000000000000 (size!6293 lt!130102)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))))

(declare-fun lt!130295 () ListLongMap!3787)

(assert (=> d!62017 (= lt!130299 lt!130295)))

(declare-fun lt!130298 () Unit!8002)

(assert (=> d!62017 (= lt!130298 e!167810)))

(declare-fun c!43900 () Bool)

(assert (=> d!62017 (= c!43900 e!167807)))

(declare-fun res!126564 () Bool)

(assert (=> d!62017 (=> (not res!126564) (not e!167807))))

(assert (=> d!62017 (= res!126564 (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(assert (=> d!62017 (= lt!130295 e!167805)))

(assert (=> d!62017 (= c!43901 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62017 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62017 (= (getCurrentListMap!1418 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130299)))

(declare-fun b!258902 () Bool)

(assert (=> b!258902 (= e!167805 e!167802)))

(assert (=> b!258902 (= c!43905 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24634 () Bool)

(assert (=> bm!24634 (= call!24633 (contains!1861 lt!130299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258903 () Bool)

(assert (=> b!258903 (= e!167808 e!167809)))

(declare-fun res!126565 () Bool)

(assert (=> b!258903 (= res!126565 call!24632)))

(assert (=> b!258903 (=> (not res!126565) (not e!167809))))

(declare-fun b!258904 () Bool)

(assert (=> b!258904 (= e!167801 (not call!24633))))

(assert (= (and d!62017 c!43901) b!258886))

(assert (= (and d!62017 (not c!43901)) b!258902))

(assert (= (and b!258902 c!43905) b!258896))

(assert (= (and b!258902 (not c!43905)) b!258888))

(assert (= (and b!258888 c!43904) b!258897))

(assert (= (and b!258888 (not c!43904)) b!258895))

(assert (= (or b!258897 b!258895) bm!24628))

(assert (= (or b!258896 bm!24628) bm!24629))

(assert (= (or b!258896 b!258897) bm!24632))

(assert (= (or b!258886 bm!24629) bm!24630))

(assert (= (or b!258886 bm!24632) bm!24631))

(assert (= (and d!62017 res!126564) b!258901))

(assert (= (and d!62017 c!43900) b!258900))

(assert (= (and d!62017 (not c!43900)) b!258891))

(assert (= (and d!62017 res!126568) b!258892))

(assert (= (and b!258892 res!126561) b!258889))

(assert (= (and b!258892 (not res!126562)) b!258893))

(assert (= (and b!258893 res!126569) b!258884))

(assert (= (and b!258892 res!126563) b!258899))

(assert (= (and b!258899 c!43903) b!258894))

(assert (= (and b!258899 (not c!43903)) b!258904))

(assert (= (and b!258894 res!126567) b!258890))

(assert (= (or b!258894 b!258904) bm!24634))

(assert (= (and b!258899 res!126566) b!258887))

(assert (= (and b!258887 c!43902) b!258903))

(assert (= (and b!258887 (not c!43902)) b!258885))

(assert (= (and b!258903 res!126565) b!258898))

(assert (= (or b!258903 b!258885) bm!24633))

(declare-fun b_lambda!8205 () Bool)

(assert (=> (not b_lambda!8205) (not b!258884)))

(declare-fun t!8844 () Bool)

(declare-fun tb!3017 () Bool)

(assert (=> (and b!258608 (= (defaultEntry!4773 thiss!1504) (defaultEntry!4773 thiss!1504)) t!8844) tb!3017))

(declare-fun result!5389 () Bool)

(assert (=> tb!3017 (= result!5389 tp_is_empty!6607)))

(assert (=> b!258884 t!8844))

(declare-fun b_and!13813 () Bool)

(assert (= b_and!13807 (and (=> t!8844 result!5389) b_and!13813)))

(declare-fun m!273909 () Bool)

(assert (=> b!258884 m!273909))

(declare-fun m!273911 () Bool)

(assert (=> b!258884 m!273911))

(declare-fun m!273913 () Bool)

(assert (=> b!258884 m!273913))

(assert (=> b!258884 m!273845))

(declare-fun m!273915 () Bool)

(assert (=> b!258884 m!273915))

(assert (=> b!258884 m!273911))

(assert (=> b!258884 m!273909))

(assert (=> b!258884 m!273845))

(assert (=> b!258901 m!273845))

(assert (=> b!258901 m!273845))

(assert (=> b!258901 m!273853))

(declare-fun m!273917 () Bool)

(assert (=> b!258886 m!273917))

(declare-fun m!273919 () Bool)

(assert (=> bm!24634 m!273919))

(assert (=> d!62017 m!273661))

(declare-fun m!273921 () Bool)

(assert (=> bm!24630 m!273921))

(declare-fun m!273923 () Bool)

(assert (=> b!258890 m!273923))

(declare-fun m!273925 () Bool)

(assert (=> b!258900 m!273925))

(declare-fun m!273927 () Bool)

(assert (=> b!258900 m!273927))

(declare-fun m!273929 () Bool)

(assert (=> b!258900 m!273929))

(declare-fun m!273931 () Bool)

(assert (=> b!258900 m!273931))

(declare-fun m!273933 () Bool)

(assert (=> b!258900 m!273933))

(assert (=> b!258900 m!273931))

(declare-fun m!273935 () Bool)

(assert (=> b!258900 m!273935))

(assert (=> b!258900 m!273845))

(declare-fun m!273937 () Bool)

(assert (=> b!258900 m!273937))

(assert (=> b!258900 m!273927))

(declare-fun m!273939 () Bool)

(assert (=> b!258900 m!273939))

(declare-fun m!273941 () Bool)

(assert (=> b!258900 m!273941))

(declare-fun m!273943 () Bool)

(assert (=> b!258900 m!273943))

(declare-fun m!273945 () Bool)

(assert (=> b!258900 m!273945))

(declare-fun m!273947 () Bool)

(assert (=> b!258900 m!273947))

(assert (=> b!258900 m!273921))

(declare-fun m!273949 () Bool)

(assert (=> b!258900 m!273949))

(declare-fun m!273951 () Bool)

(assert (=> b!258900 m!273951))

(assert (=> b!258900 m!273947))

(declare-fun m!273953 () Bool)

(assert (=> b!258900 m!273953))

(assert (=> b!258900 m!273949))

(assert (=> b!258889 m!273845))

(assert (=> b!258889 m!273845))

(assert (=> b!258889 m!273853))

(declare-fun m!273955 () Bool)

(assert (=> b!258898 m!273955))

(assert (=> b!258893 m!273845))

(assert (=> b!258893 m!273845))

(declare-fun m!273957 () Bool)

(assert (=> b!258893 m!273957))

(declare-fun m!273959 () Bool)

(assert (=> bm!24633 m!273959))

(declare-fun m!273961 () Bool)

(assert (=> bm!24631 m!273961))

(assert (=> b!258622 d!62017))

(assert (=> bm!24589 d!62011))

(declare-fun d!62019 () Bool)

(assert (=> d!62019 (contains!1861 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932)))

(declare-fun lt!130309 () Unit!8002)

(declare-fun choose!1260 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) (_ BitVec 32) Int) Unit!8002)

(assert (=> d!62019 (= lt!130309 (choose!1260 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62019 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62019 (= (lemmaArrayContainsKeyThenInListMap!247 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130309)))

(declare-fun bs!9100 () Bool)

(assert (= bs!9100 d!62019))

(assert (=> bs!9100 m!273655))

(assert (=> bs!9100 m!273655))

(declare-fun m!273963 () Bool)

(assert (=> bs!9100 m!273963))

(declare-fun m!273965 () Bool)

(assert (=> bs!9100 m!273965))

(assert (=> bs!9100 m!273661))

(assert (=> b!258618 d!62019))

(declare-fun d!62021 () Bool)

(assert (=> d!62021 (= (array_inv!3933 (_keys!6946 thiss!1504)) (bvsge (size!6293 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258608 d!62021))

(declare-fun d!62023 () Bool)

(assert (=> d!62023 (= (array_inv!3934 (_values!4756 thiss!1504)) (bvsge (size!6292 (_values!4756 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258608 d!62023))

(declare-fun d!62025 () Bool)

(assert (=> d!62025 (= (inRange!0 (ite c!43846 (index!6858 lt!130101) (index!6861 lt!130101)) (mask!11080 thiss!1504)) (and (bvsge (ite c!43846 (index!6858 lt!130101) (index!6861 lt!130101)) #b00000000000000000000000000000000) (bvslt (ite c!43846 (index!6858 lt!130101) (index!6861 lt!130101)) (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24590 d!62025))

(declare-fun d!62027 () Bool)

(declare-fun e!167814 () Bool)

(assert (=> d!62027 e!167814))

(declare-fun res!126575 () Bool)

(assert (=> d!62027 (=> (not res!126575) (not e!167814))))

(declare-fun lt!130314 () SeekEntryResult!1172)

(assert (=> d!62027 (= res!126575 ((_ is Found!1172) lt!130314))))

(assert (=> d!62027 (= lt!130314 (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun lt!130315 () Unit!8002)

(declare-fun choose!1261 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8002)

(assert (=> d!62027 (= lt!130315 (choose!1261 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62027 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62027 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) lt!130315)))

(declare-fun b!258911 () Bool)

(declare-fun res!126574 () Bool)

(assert (=> b!258911 (=> (not res!126574) (not e!167814))))

(assert (=> b!258911 (= res!126574 (inRange!0 (index!6859 lt!130314) (mask!11080 thiss!1504)))))

(declare-fun b!258912 () Bool)

(assert (=> b!258912 (= e!167814 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6859 lt!130314)) key!932))))

(assert (=> b!258912 (and (bvsge (index!6859 lt!130314) #b00000000000000000000000000000000) (bvslt (index!6859 lt!130314) (size!6293 (_keys!6946 thiss!1504))))))

(assert (= (and d!62027 res!126575) b!258911))

(assert (= (and b!258911 res!126574) b!258912))

(assert (=> d!62027 m!273645))

(declare-fun m!273967 () Bool)

(assert (=> d!62027 m!273967))

(assert (=> d!62027 m!273661))

(declare-fun m!273969 () Bool)

(assert (=> b!258911 m!273969))

(declare-fun m!273971 () Bool)

(assert (=> b!258912 m!273971))

(assert (=> b!258619 d!62027))

(declare-fun d!62029 () Bool)

(assert (=> d!62029 (= (inRange!0 index!297 (mask!11080 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258621 d!62029))

(declare-fun d!62031 () Bool)

(declare-fun e!167819 () Bool)

(assert (=> d!62031 e!167819))

(declare-fun res!126578 () Bool)

(assert (=> d!62031 (=> res!126578 e!167819)))

(declare-fun lt!130325 () Bool)

(assert (=> d!62031 (= res!126578 (not lt!130325))))

(declare-fun lt!130327 () Bool)

(assert (=> d!62031 (= lt!130325 lt!130327)))

(declare-fun lt!130324 () Unit!8002)

(declare-fun e!167820 () Unit!8002)

(assert (=> d!62031 (= lt!130324 e!167820)))

(declare-fun c!43908 () Bool)

(assert (=> d!62031 (= c!43908 lt!130327)))

(declare-fun containsKey!304 (List!3783 (_ BitVec 64)) Bool)

(assert (=> d!62031 (= lt!130327 (containsKey!304 (toList!1909 lt!130111) key!932))))

(assert (=> d!62031 (= (contains!1861 lt!130111 key!932) lt!130325)))

(declare-fun b!258919 () Bool)

(declare-fun lt!130326 () Unit!8002)

(assert (=> b!258919 (= e!167820 lt!130326)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!253 (List!3783 (_ BitVec 64)) Unit!8002)

(assert (=> b!258919 (= lt!130326 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130111) key!932))))

(declare-fun isDefined!254 (Option!318) Bool)

(assert (=> b!258919 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130111) key!932))))

(declare-fun b!258920 () Bool)

(declare-fun Unit!8011 () Unit!8002)

(assert (=> b!258920 (= e!167820 Unit!8011)))

(declare-fun b!258921 () Bool)

(assert (=> b!258921 (= e!167819 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130111) key!932)))))

(assert (= (and d!62031 c!43908) b!258919))

(assert (= (and d!62031 (not c!43908)) b!258920))

(assert (= (and d!62031 (not res!126578)) b!258921))

(declare-fun m!273973 () Bool)

(assert (=> d!62031 m!273973))

(declare-fun m!273975 () Bool)

(assert (=> b!258919 m!273975))

(declare-fun m!273977 () Bool)

(assert (=> b!258919 m!273977))

(assert (=> b!258919 m!273977))

(declare-fun m!273979 () Bool)

(assert (=> b!258919 m!273979))

(assert (=> b!258921 m!273977))

(assert (=> b!258921 m!273977))

(assert (=> b!258921 m!273979))

(assert (=> b!258621 d!62031))

(declare-fun b!258922 () Bool)

(declare-fun e!167828 () Bool)

(declare-fun lt!130342 () ListLongMap!3787)

(assert (=> b!258922 (= e!167828 (= (apply!256 lt!130342 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)) (get!3056 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_values!4756 thiss!1504))))))

(assert (=> b!258922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258923 () Bool)

(declare-fun e!167830 () Bool)

(declare-fun call!24639 () Bool)

(assert (=> b!258923 (= e!167830 (not call!24639))))

(declare-fun b!258924 () Bool)

(declare-fun e!167827 () ListLongMap!3787)

(declare-fun call!24642 () ListLongMap!3787)

(assert (=> b!258924 (= e!167827 (+!697 call!24642 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun b!258925 () Bool)

(declare-fun e!167822 () Bool)

(assert (=> b!258925 (= e!167822 e!167830)))

(declare-fun c!43911 () Bool)

(assert (=> b!258925 (= c!43911 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!258926 () Bool)

(declare-fun c!43913 () Bool)

(assert (=> b!258926 (= c!43913 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167824 () ListLongMap!3787)

(declare-fun e!167821 () ListLongMap!3787)

(assert (=> b!258926 (= e!167824 e!167821)))

(declare-fun b!258927 () Bool)

(declare-fun e!167826 () Bool)

(assert (=> b!258927 (= e!167826 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258928 () Bool)

(declare-fun e!167833 () Bool)

(assert (=> b!258928 (= e!167833 (= (apply!256 lt!130342 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!258929 () Bool)

(declare-fun e!167832 () Unit!8002)

(declare-fun Unit!8012 () Unit!8002)

(assert (=> b!258929 (= e!167832 Unit!8012)))

(declare-fun b!258930 () Bool)

(declare-fun res!126581 () Bool)

(assert (=> b!258930 (=> (not res!126581) (not e!167822))))

(declare-fun e!167825 () Bool)

(assert (=> b!258930 (= res!126581 e!167825)))

(declare-fun res!126580 () Bool)

(assert (=> b!258930 (=> res!126580 e!167825)))

(assert (=> b!258930 (= res!126580 (not e!167826))))

(declare-fun res!126579 () Bool)

(assert (=> b!258930 (=> (not res!126579) (not e!167826))))

(assert (=> b!258930 (= res!126579 (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun bm!24635 () Bool)

(declare-fun call!24643 () ListLongMap!3787)

(declare-fun call!24641 () ListLongMap!3787)

(assert (=> bm!24635 (= call!24643 call!24641)))

(declare-fun b!258931 () Bool)

(assert (=> b!258931 (= e!167825 e!167828)))

(declare-fun res!126587 () Bool)

(assert (=> b!258931 (=> (not res!126587) (not e!167828))))

(assert (=> b!258931 (= res!126587 (contains!1861 lt!130342 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258932 () Bool)

(declare-fun e!167823 () Bool)

(assert (=> b!258932 (= e!167823 e!167833)))

(declare-fun res!126585 () Bool)

(declare-fun call!24640 () Bool)

(assert (=> b!258932 (= res!126585 call!24640)))

(assert (=> b!258932 (=> (not res!126585) (not e!167833))))

(declare-fun bm!24636 () Bool)

(declare-fun call!24644 () ListLongMap!3787)

(assert (=> bm!24636 (= call!24641 call!24644)))

(declare-fun bm!24637 () Bool)

(assert (=> bm!24637 (= call!24644 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!258933 () Bool)

(assert (=> b!258933 (= e!167821 call!24643)))

(declare-fun b!258934 () Bool)

(declare-fun call!24638 () ListLongMap!3787)

(assert (=> b!258934 (= e!167824 call!24638)))

(declare-fun b!258935 () Bool)

(assert (=> b!258935 (= e!167821 call!24638)))

(declare-fun b!258936 () Bool)

(declare-fun e!167831 () Bool)

(assert (=> b!258936 (= e!167831 (= (apply!256 lt!130342 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun b!258937 () Bool)

(declare-fun res!126584 () Bool)

(assert (=> b!258937 (=> (not res!126584) (not e!167822))))

(assert (=> b!258937 (= res!126584 e!167823)))

(declare-fun c!43912 () Bool)

(assert (=> b!258937 (= c!43912 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!258938 () Bool)

(declare-fun lt!130344 () Unit!8002)

(assert (=> b!258938 (= e!167832 lt!130344)))

(declare-fun lt!130328 () ListLongMap!3787)

(assert (=> b!258938 (= lt!130328 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130343 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130333 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130333 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130345 () Unit!8002)

(assert (=> b!258938 (= lt!130345 (addStillContains!232 lt!130328 lt!130343 (zeroValue!4614 thiss!1504) lt!130333))))

(assert (=> b!258938 (contains!1861 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) lt!130333)))

(declare-fun lt!130347 () Unit!8002)

(assert (=> b!258938 (= lt!130347 lt!130345)))

(declare-fun lt!130331 () ListLongMap!3787)

(assert (=> b!258938 (= lt!130331 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130337 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130346 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130346 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130349 () Unit!8002)

(assert (=> b!258938 (= lt!130349 (addApplyDifferent!232 lt!130331 lt!130337 (minValue!4614 thiss!1504) lt!130346))))

(assert (=> b!258938 (= (apply!256 (+!697 lt!130331 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) lt!130346) (apply!256 lt!130331 lt!130346))))

(declare-fun lt!130332 () Unit!8002)

(assert (=> b!258938 (= lt!130332 lt!130349)))

(declare-fun lt!130348 () ListLongMap!3787)

(assert (=> b!258938 (= lt!130348 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130334 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130330 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130330 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130340 () Unit!8002)

(assert (=> b!258938 (= lt!130340 (addApplyDifferent!232 lt!130348 lt!130334 (zeroValue!4614 thiss!1504) lt!130330))))

(assert (=> b!258938 (= (apply!256 (+!697 lt!130348 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) lt!130330) (apply!256 lt!130348 lt!130330))))

(declare-fun lt!130329 () Unit!8002)

(assert (=> b!258938 (= lt!130329 lt!130340)))

(declare-fun lt!130335 () ListLongMap!3787)

(assert (=> b!258938 (= lt!130335 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130339 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130339 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130336 () (_ BitVec 64))

(assert (=> b!258938 (= lt!130336 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258938 (= lt!130344 (addApplyDifferent!232 lt!130335 lt!130339 (minValue!4614 thiss!1504) lt!130336))))

(assert (=> b!258938 (= (apply!256 (+!697 lt!130335 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) lt!130336) (apply!256 lt!130335 lt!130336))))

(declare-fun c!43910 () Bool)

(declare-fun bm!24638 () Bool)

(declare-fun c!43914 () Bool)

(assert (=> bm!24638 (= call!24642 (+!697 (ite c!43910 call!24644 (ite c!43914 call!24641 call!24643)) (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun bm!24639 () Bool)

(assert (=> bm!24639 (= call!24638 call!24642)))

(declare-fun bm!24640 () Bool)

(assert (=> bm!24640 (= call!24639 (contains!1861 lt!130342 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258939 () Bool)

(declare-fun e!167829 () Bool)

(assert (=> b!258939 (= e!167829 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62033 () Bool)

(assert (=> d!62033 e!167822))

(declare-fun res!126586 () Bool)

(assert (=> d!62033 (=> (not res!126586) (not e!167822))))

(assert (=> d!62033 (= res!126586 (or (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))))

(declare-fun lt!130338 () ListLongMap!3787)

(assert (=> d!62033 (= lt!130342 lt!130338)))

(declare-fun lt!130341 () Unit!8002)

(assert (=> d!62033 (= lt!130341 e!167832)))

(declare-fun c!43909 () Bool)

(assert (=> d!62033 (= c!43909 e!167829)))

(declare-fun res!126582 () Bool)

(assert (=> d!62033 (=> (not res!126582) (not e!167829))))

(assert (=> d!62033 (= res!126582 (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62033 (= lt!130338 e!167827)))

(assert (=> d!62033 (= c!43910 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62033 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62033 (= (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130342)))

(declare-fun b!258940 () Bool)

(assert (=> b!258940 (= e!167827 e!167824)))

(assert (=> b!258940 (= c!43914 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24641 () Bool)

(assert (=> bm!24641 (= call!24640 (contains!1861 lt!130342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258941 () Bool)

(assert (=> b!258941 (= e!167830 e!167831)))

(declare-fun res!126583 () Bool)

(assert (=> b!258941 (= res!126583 call!24639)))

(assert (=> b!258941 (=> (not res!126583) (not e!167831))))

(declare-fun b!258942 () Bool)

(assert (=> b!258942 (= e!167823 (not call!24640))))

(assert (= (and d!62033 c!43910) b!258924))

(assert (= (and d!62033 (not c!43910)) b!258940))

(assert (= (and b!258940 c!43914) b!258934))

(assert (= (and b!258940 (not c!43914)) b!258926))

(assert (= (and b!258926 c!43913) b!258935))

(assert (= (and b!258926 (not c!43913)) b!258933))

(assert (= (or b!258935 b!258933) bm!24635))

(assert (= (or b!258934 bm!24635) bm!24636))

(assert (= (or b!258934 b!258935) bm!24639))

(assert (= (or b!258924 bm!24636) bm!24637))

(assert (= (or b!258924 bm!24639) bm!24638))

(assert (= (and d!62033 res!126582) b!258939))

(assert (= (and d!62033 c!43909) b!258938))

(assert (= (and d!62033 (not c!43909)) b!258929))

(assert (= (and d!62033 res!126586) b!258930))

(assert (= (and b!258930 res!126579) b!258927))

(assert (= (and b!258930 (not res!126580)) b!258931))

(assert (= (and b!258931 res!126587) b!258922))

(assert (= (and b!258930 res!126581) b!258937))

(assert (= (and b!258937 c!43912) b!258932))

(assert (= (and b!258937 (not c!43912)) b!258942))

(assert (= (and b!258932 res!126585) b!258928))

(assert (= (or b!258932 b!258942) bm!24641))

(assert (= (and b!258937 res!126584) b!258925))

(assert (= (and b!258925 c!43911) b!258941))

(assert (= (and b!258925 (not c!43911)) b!258923))

(assert (= (and b!258941 res!126583) b!258936))

(assert (= (or b!258941 b!258923) bm!24640))

(declare-fun b_lambda!8207 () Bool)

(assert (=> (not b_lambda!8207) (not b!258922)))

(assert (=> b!258922 t!8844))

(declare-fun b_and!13815 () Bool)

(assert (= b_and!13813 (and (=> t!8844 result!5389) b_and!13815)))

(declare-fun m!273981 () Bool)

(assert (=> b!258922 m!273981))

(assert (=> b!258922 m!273911))

(declare-fun m!273983 () Bool)

(assert (=> b!258922 m!273983))

(assert (=> b!258922 m!273857))

(declare-fun m!273985 () Bool)

(assert (=> b!258922 m!273985))

(assert (=> b!258922 m!273911))

(assert (=> b!258922 m!273981))

(assert (=> b!258922 m!273857))

(assert (=> b!258939 m!273857))

(assert (=> b!258939 m!273857))

(assert (=> b!258939 m!273859))

(declare-fun m!273987 () Bool)

(assert (=> b!258924 m!273987))

(declare-fun m!273989 () Bool)

(assert (=> bm!24641 m!273989))

(assert (=> d!62033 m!273661))

(declare-fun m!273991 () Bool)

(assert (=> bm!24637 m!273991))

(declare-fun m!273993 () Bool)

(assert (=> b!258928 m!273993))

(declare-fun m!273995 () Bool)

(assert (=> b!258938 m!273995))

(declare-fun m!273997 () Bool)

(assert (=> b!258938 m!273997))

(declare-fun m!273999 () Bool)

(assert (=> b!258938 m!273999))

(declare-fun m!274001 () Bool)

(assert (=> b!258938 m!274001))

(declare-fun m!274003 () Bool)

(assert (=> b!258938 m!274003))

(assert (=> b!258938 m!274001))

(declare-fun m!274005 () Bool)

(assert (=> b!258938 m!274005))

(assert (=> b!258938 m!273857))

(declare-fun m!274007 () Bool)

(assert (=> b!258938 m!274007))

(assert (=> b!258938 m!273997))

(declare-fun m!274009 () Bool)

(assert (=> b!258938 m!274009))

(declare-fun m!274011 () Bool)

(assert (=> b!258938 m!274011))

(declare-fun m!274013 () Bool)

(assert (=> b!258938 m!274013))

(declare-fun m!274015 () Bool)

(assert (=> b!258938 m!274015))

(declare-fun m!274017 () Bool)

(assert (=> b!258938 m!274017))

(assert (=> b!258938 m!273991))

(declare-fun m!274019 () Bool)

(assert (=> b!258938 m!274019))

(declare-fun m!274021 () Bool)

(assert (=> b!258938 m!274021))

(assert (=> b!258938 m!274017))

(declare-fun m!274023 () Bool)

(assert (=> b!258938 m!274023))

(assert (=> b!258938 m!274019))

(assert (=> b!258927 m!273857))

(assert (=> b!258927 m!273857))

(assert (=> b!258927 m!273859))

(declare-fun m!274025 () Bool)

(assert (=> b!258936 m!274025))

(assert (=> b!258931 m!273857))

(assert (=> b!258931 m!273857))

(declare-fun m!274027 () Bool)

(assert (=> b!258931 m!274027))

(declare-fun m!274029 () Bool)

(assert (=> bm!24640 m!274029))

(declare-fun m!274031 () Bool)

(assert (=> bm!24638 m!274031))

(assert (=> b!258621 d!62033))

(declare-fun d!62035 () Bool)

(declare-fun res!126594 () Bool)

(declare-fun e!167836 () Bool)

(assert (=> d!62035 (=> (not res!126594) (not e!167836))))

(declare-fun simpleValid!279 (LongMapFixedSize!3820) Bool)

(assert (=> d!62035 (= res!126594 (simpleValid!279 thiss!1504))))

(assert (=> d!62035 (= (valid!1497 thiss!1504) e!167836)))

(declare-fun b!258949 () Bool)

(declare-fun res!126595 () Bool)

(assert (=> b!258949 (=> (not res!126595) (not e!167836))))

(assert (=> b!258949 (= res!126595 (= (arrayCountValidKeys!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (_size!1959 thiss!1504)))))

(declare-fun b!258950 () Bool)

(declare-fun res!126596 () Bool)

(assert (=> b!258950 (=> (not res!126596) (not e!167836))))

(assert (=> b!258950 (= res!126596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun b!258951 () Bool)

(assert (=> b!258951 (= e!167836 (arrayNoDuplicates!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 Nil!3781))))

(assert (= (and d!62035 res!126594) b!258949))

(assert (= (and b!258949 res!126595) b!258950))

(assert (= (and b!258950 res!126596) b!258951))

(declare-fun m!274033 () Bool)

(assert (=> d!62035 m!274033))

(assert (=> b!258949 m!273679))

(declare-fun m!274035 () Bool)

(assert (=> b!258950 m!274035))

(declare-fun m!274037 () Bool)

(assert (=> b!258951 m!274037))

(assert (=> start!24764 d!62035))

(declare-fun b!258968 () Bool)

(declare-fun e!167848 () Bool)

(declare-fun e!167845 () Bool)

(assert (=> b!258968 (= e!167848 e!167845)))

(declare-fun res!126607 () Bool)

(declare-fun call!24649 () Bool)

(assert (=> b!258968 (= res!126607 call!24649)))

(assert (=> b!258968 (=> (not res!126607) (not e!167845))))

(declare-fun b!258969 () Bool)

(declare-fun call!24650 () Bool)

(assert (=> b!258969 (= e!167845 (not call!24650))))

(declare-fun b!258971 () Bool)

(declare-fun e!167847 () Bool)

(assert (=> b!258971 (= e!167847 (not call!24650))))

(declare-fun bm!24646 () Bool)

(assert (=> bm!24646 (= call!24650 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258970 () Bool)

(declare-fun lt!130354 () SeekEntryResult!1172)

(assert (=> b!258970 (and (bvsge (index!6858 lt!130354) #b00000000000000000000000000000000) (bvslt (index!6858 lt!130354) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun res!126605 () Bool)

(assert (=> b!258970 (= res!126605 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6858 lt!130354)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258970 (=> (not res!126605) (not e!167845))))

(declare-fun d!62037 () Bool)

(assert (=> d!62037 e!167848))

(declare-fun c!43919 () Bool)

(assert (=> d!62037 (= c!43919 ((_ is MissingZero!1172) lt!130354))))

(assert (=> d!62037 (= lt!130354 (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun lt!130355 () Unit!8002)

(declare-fun choose!1262 (array!12557 array!12555 (_ BitVec 32) (_ BitVec 32) V!8457 V!8457 (_ BitVec 64) Int) Unit!8002)

(assert (=> d!62037 (= lt!130355 (choose!1262 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62037 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62037 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!436 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) lt!130355)))

(declare-fun b!258972 () Bool)

(declare-fun res!126606 () Bool)

(assert (=> b!258972 (=> (not res!126606) (not e!167847))))

(assert (=> b!258972 (= res!126606 call!24649)))

(declare-fun e!167846 () Bool)

(assert (=> b!258972 (= e!167846 e!167847)))

(declare-fun b!258973 () Bool)

(declare-fun res!126608 () Bool)

(assert (=> b!258973 (=> (not res!126608) (not e!167847))))

(assert (=> b!258973 (= res!126608 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6861 lt!130354)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258973 (and (bvsge (index!6861 lt!130354) #b00000000000000000000000000000000) (bvslt (index!6861 lt!130354) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!258974 () Bool)

(assert (=> b!258974 (= e!167848 e!167846)))

(declare-fun c!43920 () Bool)

(assert (=> b!258974 (= c!43920 ((_ is MissingVacant!1172) lt!130354))))

(declare-fun b!258975 () Bool)

(assert (=> b!258975 (= e!167846 ((_ is Undefined!1172) lt!130354))))

(declare-fun bm!24647 () Bool)

(assert (=> bm!24647 (= call!24649 (inRange!0 (ite c!43919 (index!6858 lt!130354) (index!6861 lt!130354)) (mask!11080 thiss!1504)))))

(assert (= (and d!62037 c!43919) b!258968))

(assert (= (and d!62037 (not c!43919)) b!258974))

(assert (= (and b!258968 res!126607) b!258970))

(assert (= (and b!258970 res!126605) b!258969))

(assert (= (and b!258974 c!43920) b!258972))

(assert (= (and b!258974 (not c!43920)) b!258975))

(assert (= (and b!258972 res!126606) b!258973))

(assert (= (and b!258973 res!126608) b!258971))

(assert (= (or b!258968 b!258972) bm!24647))

(assert (= (or b!258969 b!258971) bm!24646))

(declare-fun m!274039 () Bool)

(assert (=> bm!24647 m!274039))

(assert (=> bm!24646 m!273657))

(declare-fun m!274041 () Bool)

(assert (=> b!258973 m!274041))

(declare-fun m!274043 () Bool)

(assert (=> b!258970 m!274043))

(assert (=> d!62037 m!273645))

(declare-fun m!274045 () Bool)

(assert (=> d!62037 m!274045))

(assert (=> d!62037 m!273661))

(assert (=> b!258625 d!62037))

(declare-fun b!258988 () Bool)

(declare-fun e!167856 () SeekEntryResult!1172)

(declare-fun lt!130362 () SeekEntryResult!1172)

(assert (=> b!258988 (= e!167856 (MissingZero!1172 (index!6860 lt!130362)))))

(declare-fun b!258989 () Bool)

(declare-fun e!167857 () SeekEntryResult!1172)

(declare-fun e!167855 () SeekEntryResult!1172)

(assert (=> b!258989 (= e!167857 e!167855)))

(declare-fun lt!130364 () (_ BitVec 64))

(assert (=> b!258989 (= lt!130364 (select (arr!5944 (_keys!6946 thiss!1504)) (index!6860 lt!130362)))))

(declare-fun c!43929 () Bool)

(assert (=> b!258989 (= c!43929 (= lt!130364 key!932))))

(declare-fun b!258990 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12557 (_ BitVec 32)) SeekEntryResult!1172)

(assert (=> b!258990 (= e!167856 (seekKeyOrZeroReturnVacant!0 (x!25065 lt!130362) (index!6860 lt!130362) (index!6860 lt!130362) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun b!258991 () Bool)

(declare-fun c!43927 () Bool)

(assert (=> b!258991 (= c!43927 (= lt!130364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258991 (= e!167855 e!167856)))

(declare-fun d!62039 () Bool)

(declare-fun lt!130363 () SeekEntryResult!1172)

(assert (=> d!62039 (and (or ((_ is Undefined!1172) lt!130363) (not ((_ is Found!1172) lt!130363)) (and (bvsge (index!6859 lt!130363) #b00000000000000000000000000000000) (bvslt (index!6859 lt!130363) (size!6293 (_keys!6946 thiss!1504))))) (or ((_ is Undefined!1172) lt!130363) ((_ is Found!1172) lt!130363) (not ((_ is MissingZero!1172) lt!130363)) (and (bvsge (index!6858 lt!130363) #b00000000000000000000000000000000) (bvslt (index!6858 lt!130363) (size!6293 (_keys!6946 thiss!1504))))) (or ((_ is Undefined!1172) lt!130363) ((_ is Found!1172) lt!130363) ((_ is MissingZero!1172) lt!130363) (not ((_ is MissingVacant!1172) lt!130363)) (and (bvsge (index!6861 lt!130363) #b00000000000000000000000000000000) (bvslt (index!6861 lt!130363) (size!6293 (_keys!6946 thiss!1504))))) (or ((_ is Undefined!1172) lt!130363) (ite ((_ is Found!1172) lt!130363) (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6859 lt!130363)) key!932) (ite ((_ is MissingZero!1172) lt!130363) (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6858 lt!130363)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1172) lt!130363) (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6861 lt!130363)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62039 (= lt!130363 e!167857)))

(declare-fun c!43928 () Bool)

(assert (=> d!62039 (= c!43928 (and ((_ is Intermediate!1172) lt!130362) (undefined!1984 lt!130362)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12557 (_ BitVec 32)) SeekEntryResult!1172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62039 (= lt!130362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11080 thiss!1504)) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(assert (=> d!62039 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62039 (= (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)) lt!130363)))

(declare-fun b!258992 () Bool)

(assert (=> b!258992 (= e!167857 Undefined!1172)))

(declare-fun b!258993 () Bool)

(assert (=> b!258993 (= e!167855 (Found!1172 (index!6860 lt!130362)))))

(assert (= (and d!62039 c!43928) b!258992))

(assert (= (and d!62039 (not c!43928)) b!258989))

(assert (= (and b!258989 c!43929) b!258993))

(assert (= (and b!258989 (not c!43929)) b!258991))

(assert (= (and b!258991 c!43927) b!258988))

(assert (= (and b!258991 (not c!43927)) b!258990))

(declare-fun m!274047 () Bool)

(assert (=> b!258989 m!274047))

(declare-fun m!274049 () Bool)

(assert (=> b!258990 m!274049))

(assert (=> d!62039 m!273661))

(declare-fun m!274051 () Bool)

(assert (=> d!62039 m!274051))

(declare-fun m!274053 () Bool)

(assert (=> d!62039 m!274053))

(declare-fun m!274055 () Bool)

(assert (=> d!62039 m!274055))

(assert (=> d!62039 m!274051))

(declare-fun m!274057 () Bool)

(assert (=> d!62039 m!274057))

(declare-fun m!274059 () Bool)

(assert (=> d!62039 m!274059))

(assert (=> b!258620 d!62039))

(declare-fun b!259000 () Bool)

(declare-fun e!167863 () Bool)

(assert (=> b!259000 (= e!167863 tp_is_empty!6607)))

(declare-fun b!259001 () Bool)

(declare-fun e!167862 () Bool)

(assert (=> b!259001 (= e!167862 tp_is_empty!6607)))

(declare-fun mapIsEmpty!11263 () Bool)

(declare-fun mapRes!11263 () Bool)

(assert (=> mapIsEmpty!11263 mapRes!11263))

(declare-fun condMapEmpty!11263 () Bool)

(declare-fun mapDefault!11263 () ValueCell!2960)

(assert (=> mapNonEmpty!11254 (= condMapEmpty!11263 (= mapRest!11254 ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11263)))))

(assert (=> mapNonEmpty!11254 (= tp!23551 (and e!167862 mapRes!11263))))

(declare-fun mapNonEmpty!11263 () Bool)

(declare-fun tp!23566 () Bool)

(assert (=> mapNonEmpty!11263 (= mapRes!11263 (and tp!23566 e!167863))))

(declare-fun mapRest!11263 () (Array (_ BitVec 32) ValueCell!2960))

(declare-fun mapValue!11263 () ValueCell!2960)

(declare-fun mapKey!11263 () (_ BitVec 32))

(assert (=> mapNonEmpty!11263 (= mapRest!11254 (store mapRest!11263 mapKey!11263 mapValue!11263))))

(assert (= (and mapNonEmpty!11254 condMapEmpty!11263) mapIsEmpty!11263))

(assert (= (and mapNonEmpty!11254 (not condMapEmpty!11263)) mapNonEmpty!11263))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2960) mapValue!11263)) b!259000))

(assert (= (and mapNonEmpty!11254 ((_ is ValueCellFull!2960) mapDefault!11263)) b!259001))

(declare-fun m!274061 () Bool)

(assert (=> mapNonEmpty!11263 m!274061))

(declare-fun b_lambda!8209 () Bool)

(assert (= b_lambda!8205 (or (and b!258608 b_free!6745) b_lambda!8209)))

(declare-fun b_lambda!8211 () Bool)

(assert (= b_lambda!8207 (or (and b!258608 b_free!6745) b_lambda!8211)))

(check-sat (not b!258890) (not bm!24610) (not d!62027) (not d!62031) (not b!258841) (not b!258939) (not b!258884) (not bm!24609) (not b!258771) (not b!258949) (not d!62039) (not b!258922) (not b!258911) (not b!258768) (not bm!24634) (not d!62001) (not b!258893) (not bm!24640) (not bm!24605) (not b!258759) (not b!258950) (not b!258898) (not b!258835) (not b!258833) (not b_next!6745) (not b!258831) (not b!258886) (not b!258758) (not b_lambda!8211) (not b!258786) (not b!258791) (not b!258830) (not d!62005) (not b!258808) (not b!258838) (not b!258921) (not d!62037) (not b!258901) (not bm!24641) (not bm!24646) (not d!62013) (not b!258936) tp_is_empty!6607 (not bm!24613) (not b!258928) (not b!258787) (not bm!24647) (not bm!24633) (not b!258990) (not b!258927) (not mapNonEmpty!11263) (not b!258821) (not b!258805) (not bm!24638) b_and!13815 (not bm!24630) (not b!258889) (not b!258951) (not b!258780) (not b!258924) (not d!62035) (not bm!24608) (not d!62017) (not b_lambda!8209) (not b!258938) (not bm!24631) (not d!62009) (not d!62019) (not d!61993) (not bm!24637) (not b!258900) (not b!258919) (not d!62033) (not d!61987) (not b!258806) (not b!258931) (not b!258814) (not d!62015))
(check-sat b_and!13815 (not b_next!6745))
(get-model)

(declare-fun d!62041 () Bool)

(assert (=> d!62041 (= (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) (and (not (= (select (arr!5944 lt!130102) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5944 lt!130102) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258889 d!62041))

(declare-fun d!62043 () Bool)

(declare-fun get!3057 (Option!318) V!8457)

(assert (=> d!62043 (= (apply!256 lt!130342 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)) (get!3057 (getValueByKey!312 (toList!1909 lt!130342) (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9101 () Bool)

(assert (= bs!9101 d!62043))

(assert (=> bs!9101 m!273857))

(declare-fun m!274063 () Bool)

(assert (=> bs!9101 m!274063))

(assert (=> bs!9101 m!274063))

(declare-fun m!274065 () Bool)

(assert (=> bs!9101 m!274065))

(assert (=> b!258922 d!62043))

(declare-fun d!62045 () Bool)

(declare-fun c!43932 () Bool)

(assert (=> d!62045 (= c!43932 ((_ is ValueCellFull!2960) (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167866 () V!8457)

(assert (=> d!62045 (= (get!3056 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167866)))

(declare-fun b!259006 () Bool)

(declare-fun get!3058 (ValueCell!2960 V!8457) V!8457)

(assert (=> b!259006 (= e!167866 (get!3058 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259007 () Bool)

(declare-fun get!3059 (ValueCell!2960 V!8457) V!8457)

(assert (=> b!259007 (= e!167866 (get!3059 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62045 c!43932) b!259006))

(assert (= (and d!62045 (not c!43932)) b!259007))

(assert (=> b!259006 m!273981))

(assert (=> b!259006 m!273911))

(declare-fun m!274067 () Bool)

(assert (=> b!259006 m!274067))

(assert (=> b!259007 m!273981))

(assert (=> b!259007 m!273911))

(declare-fun m!274069 () Bool)

(assert (=> b!259007 m!274069))

(assert (=> b!258922 d!62045))

(assert (=> b!258949 d!61991))

(declare-fun d!62047 () Bool)

(declare-fun e!167867 () Bool)

(assert (=> d!62047 e!167867))

(declare-fun res!126610 () Bool)

(assert (=> d!62047 (=> (not res!126610) (not e!167867))))

(declare-fun lt!130367 () ListLongMap!3787)

(assert (=> d!62047 (= res!126610 (contains!1861 lt!130367 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130366 () List!3783)

(assert (=> d!62047 (= lt!130367 (ListLongMap!3788 lt!130366))))

(declare-fun lt!130365 () Unit!8002)

(declare-fun lt!130368 () Unit!8002)

(assert (=> d!62047 (= lt!130365 lt!130368)))

(assert (=> d!62047 (= (getValueByKey!312 lt!130366 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62047 (= lt!130368 (lemmaContainsTupThenGetReturnValue!171 lt!130366 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62047 (= lt!130366 (insertStrictlySorted!174 (toList!1909 call!24642) (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62047 (= (+!697 call!24642 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) lt!130367)))

(declare-fun b!259008 () Bool)

(declare-fun res!126609 () Bool)

(assert (=> b!259008 (=> (not res!126609) (not e!167867))))

(assert (=> b!259008 (= res!126609 (= (getValueByKey!312 (toList!1909 lt!130367) (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun b!259009 () Bool)

(assert (=> b!259009 (= e!167867 (contains!1863 (toList!1909 lt!130367) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(assert (= (and d!62047 res!126610) b!259008))

(assert (= (and b!259008 res!126609) b!259009))

(declare-fun m!274071 () Bool)

(assert (=> d!62047 m!274071))

(declare-fun m!274073 () Bool)

(assert (=> d!62047 m!274073))

(declare-fun m!274075 () Bool)

(assert (=> d!62047 m!274075))

(declare-fun m!274077 () Bool)

(assert (=> d!62047 m!274077))

(declare-fun m!274079 () Bool)

(assert (=> b!259008 m!274079))

(declare-fun m!274081 () Bool)

(assert (=> b!259009 m!274081))

(assert (=> b!258924 d!62047))

(declare-fun d!62049 () Bool)

(declare-fun e!167868 () Bool)

(assert (=> d!62049 e!167868))

(declare-fun res!126611 () Bool)

(assert (=> d!62049 (=> res!126611 e!167868)))

(declare-fun lt!130370 () Bool)

(assert (=> d!62049 (= res!126611 (not lt!130370))))

(declare-fun lt!130372 () Bool)

(assert (=> d!62049 (= lt!130370 lt!130372)))

(declare-fun lt!130369 () Unit!8002)

(declare-fun e!167869 () Unit!8002)

(assert (=> d!62049 (= lt!130369 e!167869)))

(declare-fun c!43933 () Bool)

(assert (=> d!62049 (= c!43933 lt!130372)))

(assert (=> d!62049 (= lt!130372 (containsKey!304 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> d!62049 (= (contains!1861 lt!130207 (_1!2453 (tuple2!4885 key!932 v!346))) lt!130370)))

(declare-fun b!259010 () Bool)

(declare-fun lt!130371 () Unit!8002)

(assert (=> b!259010 (= e!167869 lt!130371)))

(assert (=> b!259010 (= lt!130371 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> b!259010 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun b!259011 () Bool)

(declare-fun Unit!8013 () Unit!8002)

(assert (=> b!259011 (= e!167869 Unit!8013)))

(declare-fun b!259012 () Bool)

(assert (=> b!259012 (= e!167868 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(assert (= (and d!62049 c!43933) b!259010))

(assert (= (and d!62049 (not c!43933)) b!259011))

(assert (= (and d!62049 (not res!126611)) b!259012))

(declare-fun m!274083 () Bool)

(assert (=> d!62049 m!274083))

(declare-fun m!274085 () Bool)

(assert (=> b!259010 m!274085))

(assert (=> b!259010 m!273841))

(assert (=> b!259010 m!273841))

(declare-fun m!274087 () Bool)

(assert (=> b!259010 m!274087))

(assert (=> b!259012 m!273841))

(assert (=> b!259012 m!273841))

(assert (=> b!259012 m!274087))

(assert (=> d!61987 d!62049))

(declare-fun b!259023 () Bool)

(declare-fun e!167875 () Option!318)

(assert (=> b!259023 (= e!167875 (getValueByKey!312 (t!8839 lt!130206) (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun b!259022 () Bool)

(declare-fun e!167874 () Option!318)

(assert (=> b!259022 (= e!167874 e!167875)))

(declare-fun c!43939 () Bool)

(assert (=> b!259022 (= c!43939 (and ((_ is Cons!3779) lt!130206) (not (= (_1!2453 (h!4442 lt!130206)) (_1!2453 (tuple2!4885 key!932 v!346))))))))

(declare-fun c!43938 () Bool)

(declare-fun d!62051 () Bool)

(assert (=> d!62051 (= c!43938 (and ((_ is Cons!3779) lt!130206) (= (_1!2453 (h!4442 lt!130206)) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(assert (=> d!62051 (= (getValueByKey!312 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346))) e!167874)))

(declare-fun b!259021 () Bool)

(assert (=> b!259021 (= e!167874 (Some!317 (_2!2453 (h!4442 lt!130206))))))

(declare-fun b!259024 () Bool)

(assert (=> b!259024 (= e!167875 None!316)))

(assert (= (and d!62051 c!43938) b!259021))

(assert (= (and d!62051 (not c!43938)) b!259022))

(assert (= (and b!259022 c!43939) b!259023))

(assert (= (and b!259022 (not c!43939)) b!259024))

(declare-fun m!274089 () Bool)

(assert (=> b!259023 m!274089))

(assert (=> d!61987 d!62051))

(declare-fun d!62053 () Bool)

(assert (=> d!62053 (= (getValueByKey!312 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346))) (Some!317 (_2!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun lt!130375 () Unit!8002)

(declare-fun choose!1263 (List!3783 (_ BitVec 64) V!8457) Unit!8002)

(assert (=> d!62053 (= lt!130375 (choose!1263 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun e!167878 () Bool)

(assert (=> d!62053 e!167878))

(declare-fun res!126616 () Bool)

(assert (=> d!62053 (=> (not res!126616) (not e!167878))))

(declare-fun isStrictlySorted!369 (List!3783) Bool)

(assert (=> d!62053 (= res!126616 (isStrictlySorted!369 lt!130206))))

(assert (=> d!62053 (= (lemmaContainsTupThenGetReturnValue!171 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))) lt!130375)))

(declare-fun b!259029 () Bool)

(declare-fun res!126617 () Bool)

(assert (=> b!259029 (=> (not res!126617) (not e!167878))))

(assert (=> b!259029 (= res!126617 (containsKey!304 lt!130206 (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun b!259030 () Bool)

(assert (=> b!259030 (= e!167878 (contains!1863 lt!130206 (tuple2!4885 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346)))))))

(assert (= (and d!62053 res!126616) b!259029))

(assert (= (and b!259029 res!126617) b!259030))

(assert (=> d!62053 m!273835))

(declare-fun m!274091 () Bool)

(assert (=> d!62053 m!274091))

(declare-fun m!274093 () Bool)

(assert (=> d!62053 m!274093))

(declare-fun m!274095 () Bool)

(assert (=> b!259029 m!274095))

(declare-fun m!274097 () Bool)

(assert (=> b!259030 m!274097))

(assert (=> d!61987 d!62053))

(declare-fun e!167889 () List!3783)

(declare-fun b!259051 () Bool)

(assert (=> b!259051 (= e!167889 (insertStrictlySorted!174 (t!8839 (toList!1909 lt!130111)) (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun b!259052 () Bool)

(declare-fun c!43948 () Bool)

(assert (=> b!259052 (= c!43948 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (bvsgt (_1!2453 (h!4442 (toList!1909 lt!130111))) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(declare-fun e!167892 () List!3783)

(declare-fun e!167891 () List!3783)

(assert (=> b!259052 (= e!167892 e!167891)))

(declare-fun b!259053 () Bool)

(declare-fun e!167890 () List!3783)

(assert (=> b!259053 (= e!167890 e!167892)))

(declare-fun c!43950 () Bool)

(assert (=> b!259053 (= c!43950 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (= (_1!2453 (h!4442 (toList!1909 lt!130111))) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(declare-fun b!259055 () Bool)

(declare-fun res!126623 () Bool)

(declare-fun e!167893 () Bool)

(assert (=> b!259055 (=> (not res!126623) (not e!167893))))

(declare-fun lt!130378 () List!3783)

(assert (=> b!259055 (= res!126623 (containsKey!304 lt!130378 (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun bm!24654 () Bool)

(declare-fun call!24658 () List!3783)

(declare-fun call!24659 () List!3783)

(assert (=> bm!24654 (= call!24658 call!24659)))

(declare-fun b!259056 () Bool)

(assert (=> b!259056 (= e!167889 (ite c!43950 (t!8839 (toList!1909 lt!130111)) (ite c!43948 (Cons!3779 (h!4442 (toList!1909 lt!130111)) (t!8839 (toList!1909 lt!130111))) Nil!3780)))))

(declare-fun bm!24655 () Bool)

(declare-fun call!24657 () List!3783)

(assert (=> bm!24655 (= call!24659 call!24657)))

(declare-fun b!259057 () Bool)

(assert (=> b!259057 (= e!167892 call!24659)))

(declare-fun c!43949 () Bool)

(declare-fun bm!24656 () Bool)

(declare-fun $colon$colon!104 (List!3783 tuple2!4884) List!3783)

(assert (=> bm!24656 (= call!24657 ($colon$colon!104 e!167889 (ite c!43949 (h!4442 (toList!1909 lt!130111)) (tuple2!4885 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))))

(declare-fun c!43951 () Bool)

(assert (=> bm!24656 (= c!43951 c!43949)))

(declare-fun b!259058 () Bool)

(assert (=> b!259058 (= e!167891 call!24658)))

(declare-fun b!259054 () Bool)

(assert (=> b!259054 (= e!167891 call!24658)))

(declare-fun d!62055 () Bool)

(assert (=> d!62055 e!167893))

(declare-fun res!126622 () Bool)

(assert (=> d!62055 (=> (not res!126622) (not e!167893))))

(assert (=> d!62055 (= res!126622 (isStrictlySorted!369 lt!130378))))

(assert (=> d!62055 (= lt!130378 e!167890)))

(assert (=> d!62055 (= c!43949 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (bvslt (_1!2453 (h!4442 (toList!1909 lt!130111))) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(assert (=> d!62055 (isStrictlySorted!369 (toList!1909 lt!130111))))

(assert (=> d!62055 (= (insertStrictlySorted!174 (toList!1909 lt!130111) (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))) lt!130378)))

(declare-fun b!259059 () Bool)

(assert (=> b!259059 (= e!167890 call!24657)))

(declare-fun b!259060 () Bool)

(assert (=> b!259060 (= e!167893 (contains!1863 lt!130378 (tuple2!4885 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346)))))))

(assert (= (and d!62055 c!43949) b!259059))

(assert (= (and d!62055 (not c!43949)) b!259053))

(assert (= (and b!259053 c!43950) b!259057))

(assert (= (and b!259053 (not c!43950)) b!259052))

(assert (= (and b!259052 c!43948) b!259054))

(assert (= (and b!259052 (not c!43948)) b!259058))

(assert (= (or b!259054 b!259058) bm!24654))

(assert (= (or b!259057 bm!24654) bm!24655))

(assert (= (or b!259059 bm!24655) bm!24656))

(assert (= (and bm!24656 c!43951) b!259051))

(assert (= (and bm!24656 (not c!43951)) b!259056))

(assert (= (and d!62055 res!126622) b!259055))

(assert (= (and b!259055 res!126623) b!259060))

(declare-fun m!274099 () Bool)

(assert (=> b!259051 m!274099))

(declare-fun m!274101 () Bool)

(assert (=> bm!24656 m!274101))

(declare-fun m!274103 () Bool)

(assert (=> b!259055 m!274103))

(declare-fun m!274105 () Bool)

(assert (=> b!259060 m!274105))

(declare-fun m!274107 () Bool)

(assert (=> d!62055 m!274107))

(declare-fun m!274109 () Bool)

(assert (=> d!62055 m!274109))

(assert (=> d!61987 d!62055))

(declare-fun d!62057 () Bool)

(declare-fun res!126628 () Bool)

(declare-fun e!167898 () Bool)

(assert (=> d!62057 (=> res!126628 e!167898)))

(assert (=> d!62057 (= res!126628 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (= (_1!2453 (h!4442 (toList!1909 lt!130111))) key!932)))))

(assert (=> d!62057 (= (containsKey!304 (toList!1909 lt!130111) key!932) e!167898)))

(declare-fun b!259065 () Bool)

(declare-fun e!167899 () Bool)

(assert (=> b!259065 (= e!167898 e!167899)))

(declare-fun res!126629 () Bool)

(assert (=> b!259065 (=> (not res!126629) (not e!167899))))

(assert (=> b!259065 (= res!126629 (and (or (not ((_ is Cons!3779) (toList!1909 lt!130111))) (bvsle (_1!2453 (h!4442 (toList!1909 lt!130111))) key!932)) ((_ is Cons!3779) (toList!1909 lt!130111)) (bvslt (_1!2453 (h!4442 (toList!1909 lt!130111))) key!932)))))

(declare-fun b!259066 () Bool)

(assert (=> b!259066 (= e!167899 (containsKey!304 (t!8839 (toList!1909 lt!130111)) key!932))))

(assert (= (and d!62057 (not res!126628)) b!259065))

(assert (= (and b!259065 res!126629) b!259066))

(declare-fun m!274111 () Bool)

(assert (=> b!259066 m!274111))

(assert (=> d!62031 d!62057))

(declare-fun d!62059 () Bool)

(assert (=> d!62059 (= (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258939 d!62059))

(declare-fun d!62061 () Bool)

(declare-fun e!167900 () Bool)

(assert (=> d!62061 e!167900))

(declare-fun res!126631 () Bool)

(assert (=> d!62061 (=> (not res!126631) (not e!167900))))

(declare-fun lt!130381 () ListLongMap!3787)

(assert (=> d!62061 (= res!126631 (contains!1861 lt!130381 (_1!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130380 () List!3783)

(assert (=> d!62061 (= lt!130381 (ListLongMap!3788 lt!130380))))

(declare-fun lt!130379 () Unit!8002)

(declare-fun lt!130382 () Unit!8002)

(assert (=> d!62061 (= lt!130379 lt!130382)))

(assert (=> d!62061 (= (getValueByKey!312 lt!130380 (_1!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))))))

(assert (=> d!62061 (= lt!130382 (lemmaContainsTupThenGetReturnValue!171 lt!130380 (_1!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))))))

(assert (=> d!62061 (= lt!130380 (insertStrictlySorted!174 (toList!1909 lt!130335) (_1!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))))))

(assert (=> d!62061 (= (+!697 lt!130335 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) lt!130381)))

(declare-fun b!259067 () Bool)

(declare-fun res!126630 () Bool)

(assert (=> b!259067 (=> (not res!126630) (not e!167900))))

(assert (=> b!259067 (= res!126630 (= (getValueByKey!312 (toList!1909 lt!130381) (_1!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))))))))

(declare-fun b!259068 () Bool)

(assert (=> b!259068 (= e!167900 (contains!1863 (toList!1909 lt!130381) (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))))))

(assert (= (and d!62061 res!126631) b!259067))

(assert (= (and b!259067 res!126630) b!259068))

(declare-fun m!274113 () Bool)

(assert (=> d!62061 m!274113))

(declare-fun m!274115 () Bool)

(assert (=> d!62061 m!274115))

(declare-fun m!274117 () Bool)

(assert (=> d!62061 m!274117))

(declare-fun m!274119 () Bool)

(assert (=> d!62061 m!274119))

(declare-fun m!274121 () Bool)

(assert (=> b!259067 m!274121))

(declare-fun m!274123 () Bool)

(assert (=> b!259068 m!274123))

(assert (=> b!258938 d!62061))

(declare-fun d!62063 () Bool)

(assert (=> d!62063 (contains!1861 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) lt!130333)))

(declare-fun lt!130385 () Unit!8002)

(declare-fun choose!1264 (ListLongMap!3787 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8002)

(assert (=> d!62063 (= lt!130385 (choose!1264 lt!130328 lt!130343 (zeroValue!4614 thiss!1504) lt!130333))))

(assert (=> d!62063 (contains!1861 lt!130328 lt!130333)))

(assert (=> d!62063 (= (addStillContains!232 lt!130328 lt!130343 (zeroValue!4614 thiss!1504) lt!130333) lt!130385)))

(declare-fun bs!9102 () Bool)

(assert (= bs!9102 d!62063))

(assert (=> bs!9102 m!274017))

(assert (=> bs!9102 m!274017))

(assert (=> bs!9102 m!274023))

(declare-fun m!274125 () Bool)

(assert (=> bs!9102 m!274125))

(declare-fun m!274127 () Bool)

(assert (=> bs!9102 m!274127))

(assert (=> b!258938 d!62063))

(declare-fun d!62065 () Bool)

(assert (=> d!62065 (= (apply!256 lt!130335 lt!130336) (get!3057 (getValueByKey!312 (toList!1909 lt!130335) lt!130336)))))

(declare-fun bs!9103 () Bool)

(assert (= bs!9103 d!62065))

(declare-fun m!274129 () Bool)

(assert (=> bs!9103 m!274129))

(assert (=> bs!9103 m!274129))

(declare-fun m!274131 () Bool)

(assert (=> bs!9103 m!274131))

(assert (=> b!258938 d!62065))

(declare-fun d!62067 () Bool)

(declare-fun e!167901 () Bool)

(assert (=> d!62067 e!167901))

(declare-fun res!126633 () Bool)

(assert (=> d!62067 (=> (not res!126633) (not e!167901))))

(declare-fun lt!130388 () ListLongMap!3787)

(assert (=> d!62067 (= res!126633 (contains!1861 lt!130388 (_1!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130387 () List!3783)

(assert (=> d!62067 (= lt!130388 (ListLongMap!3788 lt!130387))))

(declare-fun lt!130386 () Unit!8002)

(declare-fun lt!130389 () Unit!8002)

(assert (=> d!62067 (= lt!130386 lt!130389)))

(assert (=> d!62067 (= (getValueByKey!312 lt!130387 (_1!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62067 (= lt!130389 (lemmaContainsTupThenGetReturnValue!171 lt!130387 (_1!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62067 (= lt!130387 (insertStrictlySorted!174 (toList!1909 lt!130328) (_1!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62067 (= (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) lt!130388)))

(declare-fun b!259070 () Bool)

(declare-fun res!126632 () Bool)

(assert (=> b!259070 (=> (not res!126632) (not e!167901))))

(assert (=> b!259070 (= res!126632 (= (getValueByKey!312 (toList!1909 lt!130388) (_1!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259071 () Bool)

(assert (=> b!259071 (= e!167901 (contains!1863 (toList!1909 lt!130388) (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62067 res!126633) b!259070))

(assert (= (and b!259070 res!126632) b!259071))

(declare-fun m!274133 () Bool)

(assert (=> d!62067 m!274133))

(declare-fun m!274135 () Bool)

(assert (=> d!62067 m!274135))

(declare-fun m!274137 () Bool)

(assert (=> d!62067 m!274137))

(declare-fun m!274139 () Bool)

(assert (=> d!62067 m!274139))

(declare-fun m!274141 () Bool)

(assert (=> b!259070 m!274141))

(declare-fun m!274143 () Bool)

(assert (=> b!259071 m!274143))

(assert (=> b!258938 d!62067))

(declare-fun d!62069 () Bool)

(assert (=> d!62069 (= (apply!256 (+!697 lt!130331 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) lt!130346) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130331 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))) lt!130346)))))

(declare-fun bs!9104 () Bool)

(assert (= bs!9104 d!62069))

(declare-fun m!274145 () Bool)

(assert (=> bs!9104 m!274145))

(assert (=> bs!9104 m!274145))

(declare-fun m!274147 () Bool)

(assert (=> bs!9104 m!274147))

(assert (=> b!258938 d!62069))

(declare-fun d!62071 () Bool)

(assert (=> d!62071 (= (apply!256 lt!130348 lt!130330) (get!3057 (getValueByKey!312 (toList!1909 lt!130348) lt!130330)))))

(declare-fun bs!9105 () Bool)

(assert (= bs!9105 d!62071))

(declare-fun m!274149 () Bool)

(assert (=> bs!9105 m!274149))

(assert (=> bs!9105 m!274149))

(declare-fun m!274151 () Bool)

(assert (=> bs!9105 m!274151))

(assert (=> b!258938 d!62071))

(declare-fun d!62073 () Bool)

(declare-fun e!167902 () Bool)

(assert (=> d!62073 e!167902))

(declare-fun res!126635 () Bool)

(assert (=> d!62073 (=> (not res!126635) (not e!167902))))

(declare-fun lt!130392 () ListLongMap!3787)

(assert (=> d!62073 (= res!126635 (contains!1861 lt!130392 (_1!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130391 () List!3783)

(assert (=> d!62073 (= lt!130392 (ListLongMap!3788 lt!130391))))

(declare-fun lt!130390 () Unit!8002)

(declare-fun lt!130393 () Unit!8002)

(assert (=> d!62073 (= lt!130390 lt!130393)))

(assert (=> d!62073 (= (getValueByKey!312 lt!130391 (_1!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))))))

(assert (=> d!62073 (= lt!130393 (lemmaContainsTupThenGetReturnValue!171 lt!130391 (_1!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))))))

(assert (=> d!62073 (= lt!130391 (insertStrictlySorted!174 (toList!1909 lt!130331) (_1!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))))))

(assert (=> d!62073 (= (+!697 lt!130331 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) lt!130392)))

(declare-fun b!259072 () Bool)

(declare-fun res!126634 () Bool)

(assert (=> b!259072 (=> (not res!126634) (not e!167902))))

(assert (=> b!259072 (= res!126634 (= (getValueByKey!312 (toList!1909 lt!130392) (_1!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))))))))

(declare-fun b!259073 () Bool)

(assert (=> b!259073 (= e!167902 (contains!1863 (toList!1909 lt!130392) (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))))))

(assert (= (and d!62073 res!126635) b!259072))

(assert (= (and b!259072 res!126634) b!259073))

(declare-fun m!274153 () Bool)

(assert (=> d!62073 m!274153))

(declare-fun m!274155 () Bool)

(assert (=> d!62073 m!274155))

(declare-fun m!274157 () Bool)

(assert (=> d!62073 m!274157))

(declare-fun m!274159 () Bool)

(assert (=> d!62073 m!274159))

(declare-fun m!274161 () Bool)

(assert (=> b!259072 m!274161))

(declare-fun m!274163 () Bool)

(assert (=> b!259073 m!274163))

(assert (=> b!258938 d!62073))

(declare-fun d!62075 () Bool)

(declare-fun e!167903 () Bool)

(assert (=> d!62075 e!167903))

(declare-fun res!126637 () Bool)

(assert (=> d!62075 (=> (not res!126637) (not e!167903))))

(declare-fun lt!130396 () ListLongMap!3787)

(assert (=> d!62075 (= res!126637 (contains!1861 lt!130396 (_1!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130395 () List!3783)

(assert (=> d!62075 (= lt!130396 (ListLongMap!3788 lt!130395))))

(declare-fun lt!130394 () Unit!8002)

(declare-fun lt!130397 () Unit!8002)

(assert (=> d!62075 (= lt!130394 lt!130397)))

(assert (=> d!62075 (= (getValueByKey!312 lt!130395 (_1!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62075 (= lt!130397 (lemmaContainsTupThenGetReturnValue!171 lt!130395 (_1!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62075 (= lt!130395 (insertStrictlySorted!174 (toList!1909 lt!130348) (_1!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62075 (= (+!697 lt!130348 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) lt!130396)))

(declare-fun b!259074 () Bool)

(declare-fun res!126636 () Bool)

(assert (=> b!259074 (=> (not res!126636) (not e!167903))))

(assert (=> b!259074 (= res!126636 (= (getValueByKey!312 (toList!1909 lt!130396) (_1!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259075 () Bool)

(assert (=> b!259075 (= e!167903 (contains!1863 (toList!1909 lt!130396) (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62075 res!126637) b!259074))

(assert (= (and b!259074 res!126636) b!259075))

(declare-fun m!274165 () Bool)

(assert (=> d!62075 m!274165))

(declare-fun m!274167 () Bool)

(assert (=> d!62075 m!274167))

(declare-fun m!274169 () Bool)

(assert (=> d!62075 m!274169))

(declare-fun m!274171 () Bool)

(assert (=> d!62075 m!274171))

(declare-fun m!274173 () Bool)

(assert (=> b!259074 m!274173))

(declare-fun m!274175 () Bool)

(assert (=> b!259075 m!274175))

(assert (=> b!258938 d!62075))

(declare-fun b!259100 () Bool)

(declare-fun e!167919 () Bool)

(assert (=> b!259100 (= e!167919 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259100 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259101 () Bool)

(declare-fun lt!130412 () Unit!8002)

(declare-fun lt!130417 () Unit!8002)

(assert (=> b!259101 (= lt!130412 lt!130417)))

(declare-fun lt!130414 () V!8457)

(declare-fun lt!130418 () ListLongMap!3787)

(declare-fun lt!130413 () (_ BitVec 64))

(declare-fun lt!130416 () (_ BitVec 64))

(assert (=> b!259101 (not (contains!1861 (+!697 lt!130418 (tuple2!4885 lt!130413 lt!130414)) lt!130416))))

(declare-fun addStillNotContains!127 (ListLongMap!3787 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8002)

(assert (=> b!259101 (= lt!130417 (addStillNotContains!127 lt!130418 lt!130413 lt!130414 lt!130416))))

(assert (=> b!259101 (= lt!130416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259101 (= lt!130414 (get!3056 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259101 (= lt!130413 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!24662 () ListLongMap!3787)

(assert (=> b!259101 (= lt!130418 call!24662)))

(declare-fun e!167921 () ListLongMap!3787)

(assert (=> b!259101 (= e!167921 (+!697 call!24662 (tuple2!4885 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) (get!3056 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259102 () Bool)

(declare-fun res!126648 () Bool)

(declare-fun e!167918 () Bool)

(assert (=> b!259102 (=> (not res!126648) (not e!167918))))

(declare-fun lt!130415 () ListLongMap!3787)

(assert (=> b!259102 (= res!126648 (not (contains!1861 lt!130415 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259103 () Bool)

(assert (=> b!259103 (= e!167921 call!24662)))

(declare-fun bm!24659 () Bool)

(assert (=> bm!24659 (= call!24662 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259104 () Bool)

(declare-fun e!167922 () Bool)

(declare-fun e!167923 () Bool)

(assert (=> b!259104 (= e!167922 e!167923)))

(assert (=> b!259104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun res!126646 () Bool)

(assert (=> b!259104 (= res!126646 (contains!1861 lt!130415 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259104 (=> (not res!126646) (not e!167923))))

(declare-fun b!259105 () Bool)

(declare-fun e!167924 () Bool)

(assert (=> b!259105 (= e!167924 (= lt!130415 (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504))))))

(declare-fun b!259106 () Bool)

(assert (=> b!259106 (= e!167922 e!167924)))

(declare-fun c!43960 () Bool)

(assert (=> b!259106 (= c!43960 (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259107 () Bool)

(assert (=> b!259107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> b!259107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (_values!4756 thiss!1504))))))

(assert (=> b!259107 (= e!167923 (= (apply!256 lt!130415 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)) (get!3056 (select (arr!5943 (_values!4756 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!62077 () Bool)

(assert (=> d!62077 e!167918))

(declare-fun res!126649 () Bool)

(assert (=> d!62077 (=> (not res!126649) (not e!167918))))

(assert (=> d!62077 (= res!126649 (not (contains!1861 lt!130415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!167920 () ListLongMap!3787)

(assert (=> d!62077 (= lt!130415 e!167920)))

(declare-fun c!43962 () Bool)

(assert (=> d!62077 (= c!43962 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62077 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62077 (= (getCurrentListMapNoExtraKeys!572 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130415)))

(declare-fun b!259108 () Bool)

(declare-fun isEmpty!538 (ListLongMap!3787) Bool)

(assert (=> b!259108 (= e!167924 (isEmpty!538 lt!130415))))

(declare-fun b!259109 () Bool)

(assert (=> b!259109 (= e!167920 (ListLongMap!3788 Nil!3780))))

(declare-fun b!259110 () Bool)

(assert (=> b!259110 (= e!167918 e!167922)))

(declare-fun c!43963 () Bool)

(assert (=> b!259110 (= c!43963 e!167919)))

(declare-fun res!126647 () Bool)

(assert (=> b!259110 (=> (not res!126647) (not e!167919))))

(assert (=> b!259110 (= res!126647 (bvslt #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259111 () Bool)

(assert (=> b!259111 (= e!167920 e!167921)))

(declare-fun c!43961 () Bool)

(assert (=> b!259111 (= c!43961 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62077 c!43962) b!259109))

(assert (= (and d!62077 (not c!43962)) b!259111))

(assert (= (and b!259111 c!43961) b!259101))

(assert (= (and b!259111 (not c!43961)) b!259103))

(assert (= (or b!259101 b!259103) bm!24659))

(assert (= (and d!62077 res!126649) b!259102))

(assert (= (and b!259102 res!126648) b!259110))

(assert (= (and b!259110 res!126647) b!259100))

(assert (= (and b!259110 c!43963) b!259104))

(assert (= (and b!259110 (not c!43963)) b!259106))

(assert (= (and b!259104 res!126646) b!259107))

(assert (= (and b!259106 c!43960) b!259105))

(assert (= (and b!259106 (not c!43960)) b!259108))

(declare-fun b_lambda!8213 () Bool)

(assert (=> (not b_lambda!8213) (not b!259101)))

(assert (=> b!259101 t!8844))

(declare-fun b_and!13817 () Bool)

(assert (= b_and!13815 (and (=> t!8844 result!5389) b_and!13817)))

(declare-fun b_lambda!8215 () Bool)

(assert (=> (not b_lambda!8215) (not b!259107)))

(assert (=> b!259107 t!8844))

(declare-fun b_and!13819 () Bool)

(assert (= b_and!13817 (and (=> t!8844 result!5389) b_and!13819)))

(declare-fun m!274177 () Bool)

(assert (=> b!259101 m!274177))

(declare-fun m!274179 () Bool)

(assert (=> b!259101 m!274179))

(declare-fun m!274181 () Bool)

(assert (=> b!259101 m!274181))

(assert (=> b!259101 m!273981))

(assert (=> b!259101 m!273911))

(assert (=> b!259101 m!273983))

(assert (=> b!259101 m!273911))

(assert (=> b!259101 m!273857))

(assert (=> b!259101 m!273981))

(assert (=> b!259101 m!274177))

(declare-fun m!274183 () Bool)

(assert (=> b!259101 m!274183))

(declare-fun m!274185 () Bool)

(assert (=> b!259102 m!274185))

(declare-fun m!274187 () Bool)

(assert (=> bm!24659 m!274187))

(assert (=> b!259100 m!273857))

(assert (=> b!259100 m!273857))

(assert (=> b!259100 m!273859))

(assert (=> b!259111 m!273857))

(assert (=> b!259111 m!273857))

(assert (=> b!259111 m!273859))

(assert (=> b!259104 m!273857))

(assert (=> b!259104 m!273857))

(declare-fun m!274189 () Bool)

(assert (=> b!259104 m!274189))

(declare-fun m!274191 () Bool)

(assert (=> b!259108 m!274191))

(assert (=> b!259107 m!273857))

(declare-fun m!274193 () Bool)

(assert (=> b!259107 m!274193))

(assert (=> b!259107 m!273981))

(assert (=> b!259107 m!273911))

(assert (=> b!259107 m!273983))

(assert (=> b!259107 m!273911))

(assert (=> b!259107 m!273857))

(assert (=> b!259107 m!273981))

(assert (=> b!259105 m!274187))

(declare-fun m!274195 () Bool)

(assert (=> d!62077 m!274195))

(assert (=> d!62077 m!273661))

(assert (=> b!258938 d!62077))

(declare-fun d!62079 () Bool)

(declare-fun e!167925 () Bool)

(assert (=> d!62079 e!167925))

(declare-fun res!126650 () Bool)

(assert (=> d!62079 (=> res!126650 e!167925)))

(declare-fun lt!130420 () Bool)

(assert (=> d!62079 (= res!126650 (not lt!130420))))

(declare-fun lt!130422 () Bool)

(assert (=> d!62079 (= lt!130420 lt!130422)))

(declare-fun lt!130419 () Unit!8002)

(declare-fun e!167926 () Unit!8002)

(assert (=> d!62079 (= lt!130419 e!167926)))

(declare-fun c!43964 () Bool)

(assert (=> d!62079 (= c!43964 lt!130422)))

(assert (=> d!62079 (= lt!130422 (containsKey!304 (toList!1909 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) lt!130333))))

(assert (=> d!62079 (= (contains!1861 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504))) lt!130333) lt!130420)))

(declare-fun b!259112 () Bool)

(declare-fun lt!130421 () Unit!8002)

(assert (=> b!259112 (= e!167926 lt!130421)))

(assert (=> b!259112 (= lt!130421 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) lt!130333))))

(assert (=> b!259112 (isDefined!254 (getValueByKey!312 (toList!1909 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) lt!130333))))

(declare-fun b!259113 () Bool)

(declare-fun Unit!8014 () Unit!8002)

(assert (=> b!259113 (= e!167926 Unit!8014)))

(declare-fun b!259114 () Bool)

(assert (=> b!259114 (= e!167925 (isDefined!254 (getValueByKey!312 (toList!1909 (+!697 lt!130328 (tuple2!4885 lt!130343 (zeroValue!4614 thiss!1504)))) lt!130333)))))

(assert (= (and d!62079 c!43964) b!259112))

(assert (= (and d!62079 (not c!43964)) b!259113))

(assert (= (and d!62079 (not res!126650)) b!259114))

(declare-fun m!274197 () Bool)

(assert (=> d!62079 m!274197))

(declare-fun m!274199 () Bool)

(assert (=> b!259112 m!274199))

(declare-fun m!274201 () Bool)

(assert (=> b!259112 m!274201))

(assert (=> b!259112 m!274201))

(declare-fun m!274203 () Bool)

(assert (=> b!259112 m!274203))

(assert (=> b!259114 m!274201))

(assert (=> b!259114 m!274201))

(assert (=> b!259114 m!274203))

(assert (=> b!258938 d!62079))

(declare-fun d!62081 () Bool)

(assert (=> d!62081 (= (apply!256 (+!697 lt!130348 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) lt!130330) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130348 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504)))) lt!130330)))))

(declare-fun bs!9106 () Bool)

(assert (= bs!9106 d!62081))

(declare-fun m!274205 () Bool)

(assert (=> bs!9106 m!274205))

(assert (=> bs!9106 m!274205))

(declare-fun m!274207 () Bool)

(assert (=> bs!9106 m!274207))

(assert (=> b!258938 d!62081))

(declare-fun d!62083 () Bool)

(assert (=> d!62083 (= (apply!256 (+!697 lt!130335 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) lt!130336) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130335 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504)))) lt!130336)))))

(declare-fun bs!9107 () Bool)

(assert (= bs!9107 d!62083))

(declare-fun m!274209 () Bool)

(assert (=> bs!9107 m!274209))

(assert (=> bs!9107 m!274209))

(declare-fun m!274211 () Bool)

(assert (=> bs!9107 m!274211))

(assert (=> b!258938 d!62083))

(declare-fun d!62085 () Bool)

(assert (=> d!62085 (= (apply!256 lt!130331 lt!130346) (get!3057 (getValueByKey!312 (toList!1909 lt!130331) lt!130346)))))

(declare-fun bs!9108 () Bool)

(assert (= bs!9108 d!62085))

(declare-fun m!274213 () Bool)

(assert (=> bs!9108 m!274213))

(assert (=> bs!9108 m!274213))

(declare-fun m!274215 () Bool)

(assert (=> bs!9108 m!274215))

(assert (=> b!258938 d!62085))

(declare-fun d!62087 () Bool)

(assert (=> d!62087 (= (apply!256 (+!697 lt!130348 (tuple2!4885 lt!130334 (zeroValue!4614 thiss!1504))) lt!130330) (apply!256 lt!130348 lt!130330))))

(declare-fun lt!130425 () Unit!8002)

(declare-fun choose!1265 (ListLongMap!3787 (_ BitVec 64) V!8457 (_ BitVec 64)) Unit!8002)

(assert (=> d!62087 (= lt!130425 (choose!1265 lt!130348 lt!130334 (zeroValue!4614 thiss!1504) lt!130330))))

(declare-fun e!167929 () Bool)

(assert (=> d!62087 e!167929))

(declare-fun res!126653 () Bool)

(assert (=> d!62087 (=> (not res!126653) (not e!167929))))

(assert (=> d!62087 (= res!126653 (contains!1861 lt!130348 lt!130330))))

(assert (=> d!62087 (= (addApplyDifferent!232 lt!130348 lt!130334 (zeroValue!4614 thiss!1504) lt!130330) lt!130425)))

(declare-fun b!259118 () Bool)

(assert (=> b!259118 (= e!167929 (not (= lt!130330 lt!130334)))))

(assert (= (and d!62087 res!126653) b!259118))

(declare-fun m!274217 () Bool)

(assert (=> d!62087 m!274217))

(assert (=> d!62087 m!273999))

(assert (=> d!62087 m!274019))

(assert (=> d!62087 m!274021))

(declare-fun m!274219 () Bool)

(assert (=> d!62087 m!274219))

(assert (=> d!62087 m!274019))

(assert (=> b!258938 d!62087))

(declare-fun d!62089 () Bool)

(assert (=> d!62089 (= (apply!256 (+!697 lt!130335 (tuple2!4885 lt!130339 (minValue!4614 thiss!1504))) lt!130336) (apply!256 lt!130335 lt!130336))))

(declare-fun lt!130426 () Unit!8002)

(assert (=> d!62089 (= lt!130426 (choose!1265 lt!130335 lt!130339 (minValue!4614 thiss!1504) lt!130336))))

(declare-fun e!167930 () Bool)

(assert (=> d!62089 e!167930))

(declare-fun res!126654 () Bool)

(assert (=> d!62089 (=> (not res!126654) (not e!167930))))

(assert (=> d!62089 (= res!126654 (contains!1861 lt!130335 lt!130336))))

(assert (=> d!62089 (= (addApplyDifferent!232 lt!130335 lt!130339 (minValue!4614 thiss!1504) lt!130336) lt!130426)))

(declare-fun b!259119 () Bool)

(assert (=> b!259119 (= e!167930 (not (= lt!130336 lt!130339)))))

(assert (= (and d!62089 res!126654) b!259119))

(declare-fun m!274221 () Bool)

(assert (=> d!62089 m!274221))

(assert (=> d!62089 m!274015))

(assert (=> d!62089 m!273997))

(assert (=> d!62089 m!274009))

(declare-fun m!274223 () Bool)

(assert (=> d!62089 m!274223))

(assert (=> d!62089 m!273997))

(assert (=> b!258938 d!62089))

(declare-fun d!62091 () Bool)

(assert (=> d!62091 (= (apply!256 (+!697 lt!130331 (tuple2!4885 lt!130337 (minValue!4614 thiss!1504))) lt!130346) (apply!256 lt!130331 lt!130346))))

(declare-fun lt!130427 () Unit!8002)

(assert (=> d!62091 (= lt!130427 (choose!1265 lt!130331 lt!130337 (minValue!4614 thiss!1504) lt!130346))))

(declare-fun e!167931 () Bool)

(assert (=> d!62091 e!167931))

(declare-fun res!126655 () Bool)

(assert (=> d!62091 (=> (not res!126655) (not e!167931))))

(assert (=> d!62091 (= res!126655 (contains!1861 lt!130331 lt!130346))))

(assert (=> d!62091 (= (addApplyDifferent!232 lt!130331 lt!130337 (minValue!4614 thiss!1504) lt!130346) lt!130427)))

(declare-fun b!259120 () Bool)

(assert (=> b!259120 (= e!167931 (not (= lt!130346 lt!130337)))))

(assert (= (and d!62091 res!126655) b!259120))

(declare-fun m!274225 () Bool)

(assert (=> d!62091 m!274225))

(assert (=> d!62091 m!273995))

(assert (=> d!62091 m!274001))

(assert (=> d!62091 m!274005))

(declare-fun m!274227 () Bool)

(assert (=> d!62091 m!274227))

(assert (=> d!62091 m!274001))

(assert (=> b!258938 d!62091))

(declare-fun d!62093 () Bool)

(assert (=> d!62093 (= (validKeyInArray!0 (select (arr!5944 lt!130102) index!297)) (and (not (= (select (arr!5944 lt!130102) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5944 lt!130102) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258814 d!62093))

(declare-fun d!62095 () Bool)

(declare-fun lt!130428 () (_ BitVec 32))

(assert (=> d!62095 (and (bvsge lt!130428 #b00000000000000000000000000000000) (bvsle lt!130428 (bvsub (size!6293 lt!130102) index!297)))))

(declare-fun e!167932 () (_ BitVec 32))

(assert (=> d!62095 (= lt!130428 e!167932)))

(declare-fun c!43966 () Bool)

(assert (=> d!62095 (= c!43966 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62095 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(assert (=> d!62095 (= (arrayCountValidKeys!0 lt!130102 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!130428)))

(declare-fun b!259121 () Bool)

(declare-fun e!167933 () (_ BitVec 32))

(assert (=> b!259121 (= e!167932 e!167933)))

(declare-fun c!43965 () Bool)

(assert (=> b!259121 (= c!43965 (validKeyInArray!0 (select (arr!5944 lt!130102) index!297)))))

(declare-fun bm!24660 () Bool)

(declare-fun call!24663 () (_ BitVec 32))

(assert (=> bm!24660 (= call!24663 (arrayCountValidKeys!0 lt!130102 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!259122 () Bool)

(assert (=> b!259122 (= e!167932 #b00000000000000000000000000000000)))

(declare-fun b!259123 () Bool)

(assert (=> b!259123 (= e!167933 (bvadd #b00000000000000000000000000000001 call!24663))))

(declare-fun b!259124 () Bool)

(assert (=> b!259124 (= e!167933 call!24663)))

(assert (= (and d!62095 c!43966) b!259122))

(assert (= (and d!62095 (not c!43966)) b!259121))

(assert (= (and b!259121 c!43965) b!259123))

(assert (= (and b!259121 (not c!43965)) b!259124))

(assert (= (or b!259123 b!259124) bm!24660))

(assert (=> b!259121 m!273871))

(assert (=> b!259121 m!273871))

(assert (=> b!259121 m!273873))

(declare-fun m!274229 () Bool)

(assert (=> bm!24660 m!274229))

(assert (=> d!62005 d!62095))

(declare-fun d!62097 () Bool)

(assert (=> d!62097 (= (arrayCountValidKeys!0 lt!130102 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62097 true))

(declare-fun _$85!24 () Unit!8002)

(assert (=> d!62097 (= (choose!2 lt!130102 index!297) _$85!24)))

(declare-fun bs!9109 () Bool)

(assert (= bs!9109 d!62097))

(assert (=> bs!9109 m!273883))

(assert (=> d!62005 d!62097))

(declare-fun d!62099 () Bool)

(assert (=> d!62099 (= (apply!256 lt!130342 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!312 (toList!1909 lt!130342) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9110 () Bool)

(assert (= bs!9110 d!62099))

(declare-fun m!274231 () Bool)

(assert (=> bs!9110 m!274231))

(assert (=> bs!9110 m!274231))

(declare-fun m!274233 () Bool)

(assert (=> bs!9110 m!274233))

(assert (=> b!258928 d!62099))

(declare-fun d!62101 () Bool)

(assert (=> d!62101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (mask!11080 thiss!1504))))

(assert (=> d!62101 true))

(declare-fun _$56!36 () Unit!8002)

(assert (=> d!62101 (= (choose!102 key!932 (_keys!6946 thiss!1504) index!297 (mask!11080 thiss!1504)) _$56!36)))

(declare-fun bs!9111 () Bool)

(assert (= bs!9111 d!62101))

(assert (=> bs!9111 m!273677))

(assert (=> bs!9111 m!273903))

(assert (=> d!62013 d!62101))

(assert (=> d!62013 d!61995))

(declare-fun d!62103 () Bool)

(assert (=> d!62103 (= (+!697 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4885 key!932 v!346)) (getCurrentListMap!1418 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(assert (=> d!62103 true))

(declare-fun _$3!58 () Unit!8002)

(assert (=> d!62103 (= (choose!1259 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) index!297 key!932 v!346 (defaultEntry!4773 thiss!1504)) _$3!58)))

(declare-fun bs!9112 () Bool)

(assert (= bs!9112 d!62103))

(assert (=> bs!9112 m!273677))

(assert (=> bs!9112 m!273667))

(assert (=> bs!9112 m!273655))

(assert (=> bs!9112 m!273867))

(assert (=> bs!9112 m!273655))

(assert (=> bs!9112 m!273865))

(assert (=> d!61993 d!62103))

(assert (=> d!61993 d!61995))

(declare-fun d!62105 () Bool)

(assert (=> d!62105 (= (inRange!0 (ite c!43919 (index!6858 lt!130354) (index!6861 lt!130354)) (mask!11080 thiss!1504)) (and (bvsge (ite c!43919 (index!6858 lt!130354) (index!6861 lt!130354)) #b00000000000000000000000000000000) (bvslt (ite c!43919 (index!6858 lt!130354) (index!6861 lt!130354)) (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24647 d!62105))

(declare-fun d!62107 () Bool)

(declare-fun res!126656 () Bool)

(declare-fun e!167934 () Bool)

(assert (=> d!62107 (=> res!126656 e!167934)))

(assert (=> d!62107 (= res!126656 (= (select (arr!5944 (_keys!6946 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62107 (= (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167934)))

(declare-fun b!259125 () Bool)

(declare-fun e!167935 () Bool)

(assert (=> b!259125 (= e!167934 e!167935)))

(declare-fun res!126657 () Bool)

(assert (=> b!259125 (=> (not res!126657) (not e!167935))))

(assert (=> b!259125 (= res!126657 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259126 () Bool)

(assert (=> b!259126 (= e!167935 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62107 (not res!126656)) b!259125))

(assert (= (and b!259125 res!126657) b!259126))

(declare-fun m!274235 () Bool)

(assert (=> d!62107 m!274235))

(declare-fun m!274237 () Bool)

(assert (=> b!259126 m!274237))

(assert (=> b!258835 d!62107))

(declare-fun d!62109 () Bool)

(assert (=> d!62109 (= (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) index!297)) (and (not (= (select (arr!5944 (_keys!6946 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5944 (_keys!6946 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258830 d!62109))

(declare-fun b!259127 () Bool)

(declare-fun e!167936 () Bool)

(declare-fun e!167938 () Bool)

(assert (=> b!259127 (= e!167936 e!167938)))

(declare-fun res!126658 () Bool)

(assert (=> b!259127 (=> (not res!126658) (not e!167938))))

(declare-fun e!167939 () Bool)

(assert (=> b!259127 (= res!126658 (not e!167939))))

(declare-fun res!126659 () Bool)

(assert (=> b!259127 (=> (not res!126659) (not e!167939))))

(assert (=> b!259127 (= res!126659 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259128 () Bool)

(declare-fun e!167937 () Bool)

(assert (=> b!259128 (= e!167938 e!167937)))

(declare-fun c!43967 () Bool)

(assert (=> b!259128 (= c!43967 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62111 () Bool)

(declare-fun res!126660 () Bool)

(assert (=> d!62111 (=> res!126660 e!167936)))

(assert (=> d!62111 (= res!126660 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62111 (= (arrayNoDuplicates!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 Nil!3781) e!167936)))

(declare-fun b!259129 () Bool)

(declare-fun call!24664 () Bool)

(assert (=> b!259129 (= e!167937 call!24664)))

(declare-fun b!259130 () Bool)

(assert (=> b!259130 (= e!167939 (contains!1864 Nil!3781 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259131 () Bool)

(assert (=> b!259131 (= e!167937 call!24664)))

(declare-fun bm!24661 () Bool)

(assert (=> bm!24661 (= call!24664 (arrayNoDuplicates!0 (_keys!6946 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43967 (Cons!3780 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) Nil!3781) Nil!3781)))))

(assert (= (and d!62111 (not res!126660)) b!259127))

(assert (= (and b!259127 res!126659) b!259130))

(assert (= (and b!259127 res!126658) b!259128))

(assert (= (and b!259128 c!43967) b!259131))

(assert (= (and b!259128 (not c!43967)) b!259129))

(assert (= (or b!259131 b!259129) bm!24661))

(assert (=> b!259127 m!273857))

(assert (=> b!259127 m!273857))

(assert (=> b!259127 m!273859))

(assert (=> b!259128 m!273857))

(assert (=> b!259128 m!273857))

(assert (=> b!259128 m!273859))

(assert (=> b!259130 m!273857))

(assert (=> b!259130 m!273857))

(declare-fun m!274239 () Bool)

(assert (=> b!259130 m!274239))

(assert (=> bm!24661 m!273857))

(declare-fun m!274241 () Bool)

(assert (=> bm!24661 m!274241))

(assert (=> b!258951 d!62111))

(declare-fun d!62113 () Bool)

(declare-fun e!167940 () Bool)

(assert (=> d!62113 e!167940))

(declare-fun res!126661 () Bool)

(assert (=> d!62113 (=> res!126661 e!167940)))

(declare-fun lt!130430 () Bool)

(assert (=> d!62113 (= res!126661 (not lt!130430))))

(declare-fun lt!130432 () Bool)

(assert (=> d!62113 (= lt!130430 lt!130432)))

(declare-fun lt!130429 () Unit!8002)

(declare-fun e!167941 () Unit!8002)

(assert (=> d!62113 (= lt!130429 e!167941)))

(declare-fun c!43968 () Bool)

(assert (=> d!62113 (= c!43968 lt!130432)))

(assert (=> d!62113 (= lt!130432 (containsKey!304 (toList!1909 lt!130342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62113 (= (contains!1861 lt!130342 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130430)))

(declare-fun b!259132 () Bool)

(declare-fun lt!130431 () Unit!8002)

(assert (=> b!259132 (= e!167941 lt!130431)))

(assert (=> b!259132 (= lt!130431 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259132 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259133 () Bool)

(declare-fun Unit!8015 () Unit!8002)

(assert (=> b!259133 (= e!167941 Unit!8015)))

(declare-fun b!259134 () Bool)

(assert (=> b!259134 (= e!167940 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62113 c!43968) b!259132))

(assert (= (and d!62113 (not c!43968)) b!259133))

(assert (= (and d!62113 (not res!126661)) b!259134))

(declare-fun m!274243 () Bool)

(assert (=> d!62113 m!274243))

(declare-fun m!274245 () Bool)

(assert (=> b!259132 m!274245))

(assert (=> b!259132 m!274231))

(assert (=> b!259132 m!274231))

(declare-fun m!274247 () Bool)

(assert (=> b!259132 m!274247))

(assert (=> b!259134 m!274231))

(assert (=> b!259134 m!274231))

(assert (=> b!259134 m!274247))

(assert (=> bm!24641 d!62113))

(declare-fun d!62115 () Bool)

(declare-fun lt!130433 () (_ BitVec 32))

(assert (=> d!62115 (and (bvsge lt!130433 #b00000000000000000000000000000000) (bvsle lt!130433 (bvsub (size!6293 lt!130102) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!167942 () (_ BitVec 32))

(assert (=> d!62115 (= lt!130433 e!167942)))

(declare-fun c!43970 () Bool)

(assert (=> d!62115 (= c!43970 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62115 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6293 lt!130102)))))

(assert (=> d!62115 (= (arrayCountValidKeys!0 lt!130102 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!130433)))

(declare-fun b!259135 () Bool)

(declare-fun e!167943 () (_ BitVec 32))

(assert (=> b!259135 (= e!167942 e!167943)))

(declare-fun c!43969 () Bool)

(assert (=> b!259135 (= c!43969 (validKeyInArray!0 (select (arr!5944 lt!130102) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun bm!24662 () Bool)

(declare-fun call!24665 () (_ BitVec 32))

(assert (=> bm!24662 (= call!24665 (arrayCountValidKeys!0 lt!130102 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!259136 () Bool)

(assert (=> b!259136 (= e!167942 #b00000000000000000000000000000000)))

(declare-fun b!259137 () Bool)

(assert (=> b!259137 (= e!167943 (bvadd #b00000000000000000000000000000001 call!24665))))

(declare-fun b!259138 () Bool)

(assert (=> b!259138 (= e!167943 call!24665)))

(assert (= (and d!62115 c!43970) b!259136))

(assert (= (and d!62115 (not c!43970)) b!259135))

(assert (= (and b!259135 c!43969) b!259137))

(assert (= (and b!259135 (not c!43969)) b!259138))

(assert (= (or b!259137 b!259138) bm!24662))

(declare-fun m!274249 () Bool)

(assert (=> b!259135 m!274249))

(assert (=> b!259135 m!274249))

(declare-fun m!274251 () Bool)

(assert (=> b!259135 m!274251))

(declare-fun m!274253 () Bool)

(assert (=> bm!24662 m!274253))

(assert (=> bm!24610 d!62115))

(declare-fun d!62117 () Bool)

(assert (=> d!62117 (= (arrayCountValidKeys!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6946 thiss!1504) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62117 true))

(declare-fun _$84!39 () Unit!8002)

(assert (=> d!62117 (= (choose!1 (_keys!6946 thiss!1504) index!297 key!932) _$84!39)))

(declare-fun bs!9113 () Bool)

(assert (= bs!9113 d!62117))

(assert (=> bs!9113 m!273677))

(assert (=> bs!9113 m!273897))

(assert (=> bs!9113 m!273679))

(assert (=> d!62009 d!62117))

(declare-fun b!259139 () Bool)

(declare-fun e!167945 () Bool)

(declare-fun e!167944 () Bool)

(assert (=> b!259139 (= e!167945 e!167944)))

(declare-fun lt!130434 () (_ BitVec 64))

(assert (=> b!259139 (= lt!130434 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!130436 () Unit!8002)

(assert (=> b!259139 (= lt!130436 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130102 lt!130434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!259139 (arrayContainsKey!0 lt!130102 lt!130434 #b00000000000000000000000000000000)))

(declare-fun lt!130435 () Unit!8002)

(assert (=> b!259139 (= lt!130435 lt!130436)))

(declare-fun res!126663 () Bool)

(assert (=> b!259139 (= res!126663 (= (seekEntryOrOpen!0 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!130102 (mask!11080 thiss!1504)) (Found!1172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!259139 (=> (not res!126663) (not e!167944))))

(declare-fun b!259140 () Bool)

(declare-fun call!24666 () Bool)

(assert (=> b!259140 (= e!167944 call!24666)))

(declare-fun b!259141 () Bool)

(assert (=> b!259141 (= e!167945 call!24666)))

(declare-fun b!259142 () Bool)

(declare-fun e!167946 () Bool)

(assert (=> b!259142 (= e!167946 e!167945)))

(declare-fun c!43971 () Bool)

(assert (=> b!259142 (= c!43971 (validKeyInArray!0 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24663 () Bool)

(assert (=> bm!24663 (= call!24666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!130102 (mask!11080 thiss!1504)))))

(declare-fun d!62119 () Bool)

(declare-fun res!126662 () Bool)

(assert (=> d!62119 (=> res!126662 e!167946)))

(assert (=> d!62119 (= res!126662 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(assert (=> d!62119 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130102 (mask!11080 thiss!1504)) e!167946)))

(assert (= (and d!62119 (not res!126662)) b!259142))

(assert (= (and b!259142 c!43971) b!259139))

(assert (= (and b!259142 (not c!43971)) b!259141))

(assert (= (and b!259139 res!126663) b!259140))

(assert (= (or b!259140 b!259141) bm!24663))

(declare-fun m!274255 () Bool)

(assert (=> b!259139 m!274255))

(declare-fun m!274257 () Bool)

(assert (=> b!259139 m!274257))

(declare-fun m!274259 () Bool)

(assert (=> b!259139 m!274259))

(assert (=> b!259139 m!274255))

(declare-fun m!274261 () Bool)

(assert (=> b!259139 m!274261))

(assert (=> b!259142 m!274255))

(assert (=> b!259142 m!274255))

(declare-fun m!274263 () Bool)

(assert (=> b!259142 m!274263))

(declare-fun m!274265 () Bool)

(assert (=> bm!24663 m!274265))

(assert (=> bm!24605 d!62119))

(declare-fun d!62121 () Bool)

(declare-fun lt!130439 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!170 (List!3784) (InoxSet (_ BitVec 64)))

(assert (=> d!62121 (= lt!130439 (select (content!170 Nil!3781) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun e!167952 () Bool)

(assert (=> d!62121 (= lt!130439 e!167952)))

(declare-fun res!126669 () Bool)

(assert (=> d!62121 (=> (not res!126669) (not e!167952))))

(assert (=> d!62121 (= res!126669 ((_ is Cons!3780) Nil!3781))))

(assert (=> d!62121 (= (contains!1864 Nil!3781 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) lt!130439)))

(declare-fun b!259147 () Bool)

(declare-fun e!167951 () Bool)

(assert (=> b!259147 (= e!167952 e!167951)))

(declare-fun res!126668 () Bool)

(assert (=> b!259147 (=> res!126668 e!167951)))

(assert (=> b!259147 (= res!126668 (= (h!4443 Nil!3781) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!259148 () Bool)

(assert (=> b!259148 (= e!167951 (contains!1864 (t!8840 Nil!3781) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (= (and d!62121 res!126669) b!259147))

(assert (= (and b!259147 (not res!126668)) b!259148))

(declare-fun m!274267 () Bool)

(assert (=> d!62121 m!274267))

(assert (=> d!62121 m!273845))

(declare-fun m!274269 () Bool)

(assert (=> d!62121 m!274269))

(assert (=> b!259148 m!273845))

(declare-fun m!274271 () Bool)

(assert (=> b!259148 m!274271))

(assert (=> b!258808 d!62121))

(declare-fun d!62123 () Bool)

(assert (=> d!62123 (arrayNoDuplicates!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 Nil!3781)))

(assert (=> d!62123 true))

(declare-fun _$65!89 () Unit!8002)

(assert (=> d!62123 (= (choose!41 (_keys!6946 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3781) _$65!89)))

(declare-fun bs!9114 () Bool)

(assert (= bs!9114 d!62123))

(assert (=> bs!9114 m!273677))

(assert (=> bs!9114 m!273907))

(assert (=> d!62015 d!62123))

(assert (=> b!258806 d!62041))

(declare-fun e!167954 () Option!318)

(declare-fun b!259151 () Bool)

(assert (=> b!259151 (= e!167954 (getValueByKey!312 (t!8839 (toList!1909 lt!130207)) (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun b!259150 () Bool)

(declare-fun e!167953 () Option!318)

(assert (=> b!259150 (= e!167953 e!167954)))

(declare-fun c!43973 () Bool)

(assert (=> b!259150 (= c!43973 (and ((_ is Cons!3779) (toList!1909 lt!130207)) (not (= (_1!2453 (h!4442 (toList!1909 lt!130207))) (_1!2453 (tuple2!4885 key!932 v!346))))))))

(declare-fun c!43972 () Bool)

(declare-fun d!62125 () Bool)

(assert (=> d!62125 (= c!43972 (and ((_ is Cons!3779) (toList!1909 lt!130207)) (= (_1!2453 (h!4442 (toList!1909 lt!130207))) (_1!2453 (tuple2!4885 key!932 v!346)))))))

(assert (=> d!62125 (= (getValueByKey!312 (toList!1909 lt!130207) (_1!2453 (tuple2!4885 key!932 v!346))) e!167953)))

(declare-fun b!259149 () Bool)

(assert (=> b!259149 (= e!167953 (Some!317 (_2!2453 (h!4442 (toList!1909 lt!130207)))))))

(declare-fun b!259152 () Bool)

(assert (=> b!259152 (= e!167954 None!316)))

(assert (= (and d!62125 c!43972) b!259149))

(assert (= (and d!62125 (not c!43972)) b!259150))

(assert (= (and b!259150 c!43973) b!259151))

(assert (= (and b!259150 (not c!43973)) b!259152))

(declare-fun m!274273 () Bool)

(assert (=> b!259151 m!274273))

(assert (=> b!258758 d!62125))

(assert (=> b!258787 d!62041))

(assert (=> b!258780 d!62059))

(declare-fun d!62127 () Bool)

(assert (=> d!62127 (= (apply!256 lt!130342 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!312 (toList!1909 lt!130342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9115 () Bool)

(assert (= bs!9115 d!62127))

(declare-fun m!274275 () Bool)

(assert (=> bs!9115 m!274275))

(assert (=> bs!9115 m!274275))

(declare-fun m!274277 () Bool)

(assert (=> bs!9115 m!274277))

(assert (=> b!258936 d!62127))

(declare-fun d!62129 () Bool)

(declare-fun e!167955 () Bool)

(assert (=> d!62129 e!167955))

(declare-fun res!126670 () Bool)

(assert (=> d!62129 (=> res!126670 e!167955)))

(declare-fun lt!130441 () Bool)

(assert (=> d!62129 (= res!126670 (not lt!130441))))

(declare-fun lt!130443 () Bool)

(assert (=> d!62129 (= lt!130441 lt!130443)))

(declare-fun lt!130440 () Unit!8002)

(declare-fun e!167956 () Unit!8002)

(assert (=> d!62129 (= lt!130440 e!167956)))

(declare-fun c!43974 () Bool)

(assert (=> d!62129 (= c!43974 lt!130443)))

(assert (=> d!62129 (= lt!130443 (containsKey!304 (toList!1909 lt!130299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62129 (= (contains!1861 lt!130299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130441)))

(declare-fun b!259153 () Bool)

(declare-fun lt!130442 () Unit!8002)

(assert (=> b!259153 (= e!167956 lt!130442)))

(assert (=> b!259153 (= lt!130442 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259153 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259154 () Bool)

(declare-fun Unit!8016 () Unit!8002)

(assert (=> b!259154 (= e!167956 Unit!8016)))

(declare-fun b!259155 () Bool)

(assert (=> b!259155 (= e!167955 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62129 c!43974) b!259153))

(assert (= (and d!62129 (not c!43974)) b!259154))

(assert (= (and d!62129 (not res!126670)) b!259155))

(declare-fun m!274279 () Bool)

(assert (=> d!62129 m!274279))

(declare-fun m!274281 () Bool)

(assert (=> b!259153 m!274281))

(declare-fun m!274283 () Bool)

(assert (=> b!259153 m!274283))

(assert (=> b!259153 m!274283))

(declare-fun m!274285 () Bool)

(assert (=> b!259153 m!274285))

(assert (=> b!259155 m!274283))

(assert (=> b!259155 m!274283))

(assert (=> b!259155 m!274285))

(assert (=> bm!24633 d!62129))

(declare-fun b!259156 () Bool)

(declare-fun e!167957 () Bool)

(declare-fun e!167959 () Bool)

(assert (=> b!259156 (= e!167957 e!167959)))

(declare-fun res!126671 () Bool)

(assert (=> b!259156 (=> (not res!126671) (not e!167959))))

(declare-fun e!167960 () Bool)

(assert (=> b!259156 (= res!126671 (not e!167960))))

(declare-fun res!126672 () Bool)

(assert (=> b!259156 (=> (not res!126672) (not e!167960))))

(assert (=> b!259156 (= res!126672 (validKeyInArray!0 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259157 () Bool)

(declare-fun e!167958 () Bool)

(assert (=> b!259157 (= e!167959 e!167958)))

(declare-fun c!43975 () Bool)

(assert (=> b!259157 (= c!43975 (validKeyInArray!0 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62131 () Bool)

(declare-fun res!126673 () Bool)

(assert (=> d!62131 (=> res!126673 e!167957)))

(assert (=> d!62131 (= res!126673 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(assert (=> d!62131 (= (arrayNoDuplicates!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43887 (Cons!3780 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) Nil!3781) Nil!3781)) e!167957)))

(declare-fun b!259158 () Bool)

(declare-fun call!24667 () Bool)

(assert (=> b!259158 (= e!167958 call!24667)))

(declare-fun b!259159 () Bool)

(assert (=> b!259159 (= e!167960 (contains!1864 (ite c!43887 (Cons!3780 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) Nil!3781) Nil!3781) (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259160 () Bool)

(assert (=> b!259160 (= e!167958 call!24667)))

(declare-fun bm!24664 () Bool)

(assert (=> bm!24664 (= call!24667 (arrayNoDuplicates!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43975 (Cons!3780 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43887 (Cons!3780 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) Nil!3781) Nil!3781)) (ite c!43887 (Cons!3780 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) Nil!3781) Nil!3781))))))

(assert (= (and d!62131 (not res!126673)) b!259156))

(assert (= (and b!259156 res!126672) b!259159))

(assert (= (and b!259156 res!126671) b!259157))

(assert (= (and b!259157 c!43975) b!259160))

(assert (= (and b!259157 (not c!43975)) b!259158))

(assert (= (or b!259160 b!259158) bm!24664))

(assert (=> b!259156 m!274255))

(assert (=> b!259156 m!274255))

(assert (=> b!259156 m!274263))

(assert (=> b!259157 m!274255))

(assert (=> b!259157 m!274255))

(assert (=> b!259157 m!274263))

(assert (=> b!259159 m!274255))

(assert (=> b!259159 m!274255))

(declare-fun m!274287 () Bool)

(assert (=> b!259159 m!274287))

(assert (=> bm!24664 m!274255))

(declare-fun m!274289 () Bool)

(assert (=> bm!24664 m!274289))

(assert (=> bm!24613 d!62131))

(assert (=> bm!24637 d!62077))

(assert (=> d!62017 d!61995))

(assert (=> d!62001 d!62007))

(declare-fun d!62133 () Bool)

(assert (=> d!62133 (arrayContainsKey!0 lt!130102 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62133 true))

(declare-fun _$60!378 () Unit!8002)

(assert (=> d!62133 (= (choose!13 lt!130102 key!932 index!297) _$60!378)))

(declare-fun bs!9116 () Bool)

(assert (= bs!9116 d!62133))

(assert (=> bs!9116 m!273693))

(assert (=> d!62001 d!62133))

(declare-fun d!62135 () Bool)

(declare-fun e!167961 () Bool)

(assert (=> d!62135 e!167961))

(declare-fun res!126675 () Bool)

(assert (=> d!62135 (=> (not res!126675) (not e!167961))))

(declare-fun lt!130446 () ListLongMap!3787)

(assert (=> d!62135 (= res!126675 (contains!1861 lt!130446 (_1!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun lt!130445 () List!3783)

(assert (=> d!62135 (= lt!130446 (ListLongMap!3788 lt!130445))))

(declare-fun lt!130444 () Unit!8002)

(declare-fun lt!130447 () Unit!8002)

(assert (=> d!62135 (= lt!130444 lt!130447)))

(assert (=> d!62135 (= (getValueByKey!312 lt!130445 (_1!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!317 (_2!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62135 (= lt!130447 (lemmaContainsTupThenGetReturnValue!171 lt!130445 (_1!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62135 (= lt!130445 (insertStrictlySorted!174 (toList!1909 (ite c!43901 call!24637 (ite c!43905 call!24634 call!24636))) (_1!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62135 (= (+!697 (ite c!43901 call!24637 (ite c!43905 call!24634 call!24636)) (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) lt!130446)))

(declare-fun b!259161 () Bool)

(declare-fun res!126674 () Bool)

(assert (=> b!259161 (=> (not res!126674) (not e!167961))))

(assert (=> b!259161 (= res!126674 (= (getValueByKey!312 (toList!1909 lt!130446) (_1!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!317 (_2!2453 (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))))

(declare-fun b!259162 () Bool)

(assert (=> b!259162 (= e!167961 (contains!1863 (toList!1909 lt!130446) (ite (or c!43901 c!43905) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (= (and d!62135 res!126675) b!259161))

(assert (= (and b!259161 res!126674) b!259162))

(declare-fun m!274291 () Bool)

(assert (=> d!62135 m!274291))

(declare-fun m!274293 () Bool)

(assert (=> d!62135 m!274293))

(declare-fun m!274295 () Bool)

(assert (=> d!62135 m!274295))

(declare-fun m!274297 () Bool)

(assert (=> d!62135 m!274297))

(declare-fun m!274299 () Bool)

(assert (=> b!259161 m!274299))

(declare-fun m!274301 () Bool)

(assert (=> b!259162 m!274301))

(assert (=> bm!24631 d!62135))

(declare-fun b!259174 () Bool)

(declare-fun e!167964 () Bool)

(assert (=> b!259174 (= e!167964 (and (bvsge (extraKeys!4510 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4510 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1959 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!259173 () Bool)

(declare-fun res!126686 () Bool)

(assert (=> b!259173 (=> (not res!126686) (not e!167964))))

(declare-fun size!6298 (LongMapFixedSize!3820) (_ BitVec 32))

(assert (=> b!259173 (= res!126686 (= (size!6298 thiss!1504) (bvadd (_size!1959 thiss!1504) (bvsdiv (bvadd (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!259171 () Bool)

(declare-fun res!126685 () Bool)

(assert (=> b!259171 (=> (not res!126685) (not e!167964))))

(assert (=> b!259171 (= res!126685 (and (= (size!6292 (_values!4756 thiss!1504)) (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001)) (= (size!6293 (_keys!6946 thiss!1504)) (size!6292 (_values!4756 thiss!1504))) (bvsge (_size!1959 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1959 thiss!1504) (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!62137 () Bool)

(declare-fun res!126687 () Bool)

(assert (=> d!62137 (=> (not res!126687) (not e!167964))))

(assert (=> d!62137 (= res!126687 (validMask!0 (mask!11080 thiss!1504)))))

(assert (=> d!62137 (= (simpleValid!279 thiss!1504) e!167964)))

(declare-fun b!259172 () Bool)

(declare-fun res!126684 () Bool)

(assert (=> b!259172 (=> (not res!126684) (not e!167964))))

(assert (=> b!259172 (= res!126684 (bvsge (size!6298 thiss!1504) (_size!1959 thiss!1504)))))

(assert (= (and d!62137 res!126687) b!259171))

(assert (= (and b!259171 res!126685) b!259172))

(assert (= (and b!259172 res!126684) b!259173))

(assert (= (and b!259173 res!126686) b!259174))

(declare-fun m!274303 () Bool)

(assert (=> b!259173 m!274303))

(assert (=> d!62137 m!273661))

(assert (=> b!259172 m!274303))

(assert (=> d!62035 d!62137))

(declare-fun d!62139 () Bool)

(declare-fun e!167965 () Bool)

(assert (=> d!62139 e!167965))

(declare-fun res!126688 () Bool)

(assert (=> d!62139 (=> res!126688 e!167965)))

(declare-fun lt!130449 () Bool)

(assert (=> d!62139 (= res!126688 (not lt!130449))))

(declare-fun lt!130451 () Bool)

(assert (=> d!62139 (= lt!130449 lt!130451)))

(declare-fun lt!130448 () Unit!8002)

(declare-fun e!167966 () Unit!8002)

(assert (=> d!62139 (= lt!130448 e!167966)))

(declare-fun c!43976 () Bool)

(assert (=> d!62139 (= c!43976 lt!130451)))

(assert (=> d!62139 (= lt!130451 (containsKey!304 (toList!1909 lt!130342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62139 (= (contains!1861 lt!130342 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130449)))

(declare-fun b!259175 () Bool)

(declare-fun lt!130450 () Unit!8002)

(assert (=> b!259175 (= e!167966 lt!130450)))

(assert (=> b!259175 (= lt!130450 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259175 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259176 () Bool)

(declare-fun Unit!8017 () Unit!8002)

(assert (=> b!259176 (= e!167966 Unit!8017)))

(declare-fun b!259177 () Bool)

(assert (=> b!259177 (= e!167965 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62139 c!43976) b!259175))

(assert (= (and d!62139 (not c!43976)) b!259176))

(assert (= (and d!62139 (not res!126688)) b!259177))

(declare-fun m!274305 () Bool)

(assert (=> d!62139 m!274305))

(declare-fun m!274307 () Bool)

(assert (=> b!259175 m!274307))

(assert (=> b!259175 m!274275))

(assert (=> b!259175 m!274275))

(declare-fun m!274309 () Bool)

(assert (=> b!259175 m!274309))

(assert (=> b!259177 m!274275))

(assert (=> b!259177 m!274275))

(assert (=> b!259177 m!274309))

(assert (=> bm!24640 d!62139))

(declare-fun b!259178 () Bool)

(declare-fun e!167968 () Bool)

(declare-fun e!167967 () Bool)

(assert (=> b!259178 (= e!167968 e!167967)))

(declare-fun lt!130452 () (_ BitVec 64))

(assert (=> b!259178 (= lt!130452 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130454 () Unit!8002)

(assert (=> b!259178 (= lt!130454 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6946 thiss!1504) lt!130452 #b00000000000000000000000000000000))))

(assert (=> b!259178 (arrayContainsKey!0 (_keys!6946 thiss!1504) lt!130452 #b00000000000000000000000000000000)))

(declare-fun lt!130453 () Unit!8002)

(assert (=> b!259178 (= lt!130453 lt!130454)))

(declare-fun res!126690 () Bool)

(assert (=> b!259178 (= res!126690 (= (seekEntryOrOpen!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000) (_keys!6946 thiss!1504) (mask!11080 thiss!1504)) (Found!1172 #b00000000000000000000000000000000)))))

(assert (=> b!259178 (=> (not res!126690) (not e!167967))))

(declare-fun b!259179 () Bool)

(declare-fun call!24668 () Bool)

(assert (=> b!259179 (= e!167967 call!24668)))

(declare-fun b!259180 () Bool)

(assert (=> b!259180 (= e!167968 call!24668)))

(declare-fun b!259181 () Bool)

(declare-fun e!167969 () Bool)

(assert (=> b!259181 (= e!167969 e!167968)))

(declare-fun c!43977 () Bool)

(assert (=> b!259181 (= c!43977 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24665 () Bool)

(assert (=> bm!24665 (= call!24668 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun d!62141 () Bool)

(declare-fun res!126689 () Bool)

(assert (=> d!62141 (=> res!126689 e!167969)))

(assert (=> d!62141 (= res!126689 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)) e!167969)))

(assert (= (and d!62141 (not res!126689)) b!259181))

(assert (= (and b!259181 c!43977) b!259178))

(assert (= (and b!259181 (not c!43977)) b!259180))

(assert (= (and b!259178 res!126690) b!259179))

(assert (= (or b!259179 b!259180) bm!24665))

(assert (=> b!259178 m!273857))

(declare-fun m!274311 () Bool)

(assert (=> b!259178 m!274311))

(declare-fun m!274313 () Bool)

(assert (=> b!259178 m!274313))

(assert (=> b!259178 m!273857))

(declare-fun m!274315 () Bool)

(assert (=> b!259178 m!274315))

(assert (=> b!259181 m!273857))

(assert (=> b!259181 m!273857))

(assert (=> b!259181 m!273859))

(declare-fun m!274317 () Bool)

(assert (=> bm!24665 m!274317))

(assert (=> b!258950 d!62141))

(assert (=> bm!24646 d!62011))

(declare-fun d!62143 () Bool)

(assert (=> d!62143 (= (apply!256 lt!130299 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!312 (toList!1909 lt!130299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9117 () Bool)

(assert (= bs!9117 d!62143))

(declare-fun m!274319 () Bool)

(assert (=> bs!9117 m!274319))

(assert (=> bs!9117 m!274319))

(declare-fun m!274321 () Bool)

(assert (=> bs!9117 m!274321))

(assert (=> b!258890 d!62143))

(assert (=> b!258901 d!62041))

(declare-fun d!62145 () Bool)

(declare-fun e!167970 () Bool)

(assert (=> d!62145 e!167970))

(declare-fun res!126692 () Bool)

(assert (=> d!62145 (=> (not res!126692) (not e!167970))))

(declare-fun lt!130457 () ListLongMap!3787)

(assert (=> d!62145 (= res!126692 (contains!1861 lt!130457 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130456 () List!3783)

(assert (=> d!62145 (= lt!130457 (ListLongMap!3788 lt!130456))))

(declare-fun lt!130455 () Unit!8002)

(declare-fun lt!130458 () Unit!8002)

(assert (=> d!62145 (= lt!130455 lt!130458)))

(assert (=> d!62145 (= (getValueByKey!312 lt!130456 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62145 (= lt!130458 (lemmaContainsTupThenGetReturnValue!171 lt!130456 (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62145 (= lt!130456 (insertStrictlySorted!174 (toList!1909 call!24635) (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (=> d!62145 (= (+!697 call!24635 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))) lt!130457)))

(declare-fun b!259182 () Bool)

(declare-fun res!126691 () Bool)

(assert (=> b!259182 (=> (not res!126691) (not e!167970))))

(assert (=> b!259182 (= res!126691 (= (getValueByKey!312 (toList!1909 lt!130457) (_1!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun b!259183 () Bool)

(assert (=> b!259183 (= e!167970 (contains!1863 (toList!1909 lt!130457) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(assert (= (and d!62145 res!126692) b!259182))

(assert (= (and b!259182 res!126691) b!259183))

(declare-fun m!274323 () Bool)

(assert (=> d!62145 m!274323))

(declare-fun m!274325 () Bool)

(assert (=> d!62145 m!274325))

(declare-fun m!274327 () Bool)

(assert (=> d!62145 m!274327))

(declare-fun m!274329 () Bool)

(assert (=> d!62145 m!274329))

(declare-fun m!274331 () Bool)

(assert (=> b!259182 m!274331))

(declare-fun m!274333 () Bool)

(assert (=> b!259183 m!274333))

(assert (=> b!258886 d!62145))

(declare-fun d!62147 () Bool)

(declare-fun e!167971 () Bool)

(assert (=> d!62147 e!167971))

(declare-fun res!126693 () Bool)

(assert (=> d!62147 (=> res!126693 e!167971)))

(declare-fun lt!130460 () Bool)

(assert (=> d!62147 (= res!126693 (not lt!130460))))

(declare-fun lt!130462 () Bool)

(assert (=> d!62147 (= lt!130460 lt!130462)))

(declare-fun lt!130459 () Unit!8002)

(declare-fun e!167972 () Unit!8002)

(assert (=> d!62147 (= lt!130459 e!167972)))

(declare-fun c!43978 () Bool)

(assert (=> d!62147 (= c!43978 lt!130462)))

(assert (=> d!62147 (= lt!130462 (containsKey!304 (toList!1909 lt!130299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62147 (= (contains!1861 lt!130299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130460)))

(declare-fun b!259184 () Bool)

(declare-fun lt!130461 () Unit!8002)

(assert (=> b!259184 (= e!167972 lt!130461)))

(assert (=> b!259184 (= lt!130461 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259184 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259185 () Bool)

(declare-fun Unit!8018 () Unit!8002)

(assert (=> b!259185 (= e!167972 Unit!8018)))

(declare-fun b!259186 () Bool)

(assert (=> b!259186 (= e!167971 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62147 c!43978) b!259184))

(assert (= (and d!62147 (not c!43978)) b!259185))

(assert (= (and d!62147 (not res!126693)) b!259186))

(declare-fun m!274335 () Bool)

(assert (=> d!62147 m!274335))

(declare-fun m!274337 () Bool)

(assert (=> b!259184 m!274337))

(assert (=> b!259184 m!274319))

(assert (=> b!259184 m!274319))

(declare-fun m!274339 () Bool)

(assert (=> b!259184 m!274339))

(assert (=> b!259186 m!274319))

(assert (=> b!259186 m!274319))

(assert (=> b!259186 m!274339))

(assert (=> bm!24634 d!62147))

(declare-fun d!62149 () Bool)

(declare-fun e!167973 () Bool)

(assert (=> d!62149 e!167973))

(declare-fun res!126695 () Bool)

(assert (=> d!62149 (=> (not res!126695) (not e!167973))))

(declare-fun lt!130465 () ListLongMap!3787)

(assert (=> d!62149 (= res!126695 (contains!1861 lt!130465 (_1!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(declare-fun lt!130464 () List!3783)

(assert (=> d!62149 (= lt!130465 (ListLongMap!3788 lt!130464))))

(declare-fun lt!130463 () Unit!8002)

(declare-fun lt!130466 () Unit!8002)

(assert (=> d!62149 (= lt!130463 lt!130466)))

(assert (=> d!62149 (= (getValueByKey!312 lt!130464 (_1!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!317 (_2!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62149 (= lt!130466 (lemmaContainsTupThenGetReturnValue!171 lt!130464 (_1!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62149 (= lt!130464 (insertStrictlySorted!174 (toList!1909 (ite c!43910 call!24644 (ite c!43914 call!24641 call!24643))) (_1!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) (_2!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))))

(assert (=> d!62149 (= (+!697 (ite c!43910 call!24644 (ite c!43914 call!24641 call!24643)) (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))) lt!130465)))

(declare-fun b!259187 () Bool)

(declare-fun res!126694 () Bool)

(assert (=> b!259187 (=> (not res!126694) (not e!167973))))

(assert (=> b!259187 (= res!126694 (= (getValueByKey!312 (toList!1909 lt!130465) (_1!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))) (Some!317 (_2!2453 (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))))

(declare-fun b!259188 () Bool)

(assert (=> b!259188 (= e!167973 (contains!1863 (toList!1909 lt!130465) (ite (or c!43910 c!43914) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(assert (= (and d!62149 res!126695) b!259187))

(assert (= (and b!259187 res!126694) b!259188))

(declare-fun m!274341 () Bool)

(assert (=> d!62149 m!274341))

(declare-fun m!274343 () Bool)

(assert (=> d!62149 m!274343))

(declare-fun m!274345 () Bool)

(assert (=> d!62149 m!274345))

(declare-fun m!274347 () Bool)

(assert (=> d!62149 m!274347))

(declare-fun m!274349 () Bool)

(assert (=> b!259187 m!274349))

(declare-fun m!274351 () Bool)

(assert (=> b!259188 m!274351))

(assert (=> bm!24638 d!62149))

(assert (=> b!258927 d!62059))

(assert (=> d!62033 d!61995))

(declare-fun d!62151 () Bool)

(declare-fun e!167974 () Bool)

(assert (=> d!62151 e!167974))

(declare-fun res!126696 () Bool)

(assert (=> d!62151 (=> res!126696 e!167974)))

(declare-fun lt!130468 () Bool)

(assert (=> d!62151 (= res!126696 (not lt!130468))))

(declare-fun lt!130470 () Bool)

(assert (=> d!62151 (= lt!130468 lt!130470)))

(declare-fun lt!130467 () Unit!8002)

(declare-fun e!167975 () Unit!8002)

(assert (=> d!62151 (= lt!130467 e!167975)))

(declare-fun c!43979 () Bool)

(assert (=> d!62151 (= c!43979 lt!130470)))

(assert (=> d!62151 (= lt!130470 (containsKey!304 (toList!1909 lt!130299) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (=> d!62151 (= (contains!1861 lt!130299 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) lt!130468)))

(declare-fun b!259189 () Bool)

(declare-fun lt!130469 () Unit!8002)

(assert (=> b!259189 (= e!167975 lt!130469)))

(assert (=> b!259189 (= lt!130469 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130299) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (=> b!259189 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!259190 () Bool)

(declare-fun Unit!8019 () Unit!8002)

(assert (=> b!259190 (= e!167975 Unit!8019)))

(declare-fun b!259191 () Bool)

(assert (=> b!259191 (= e!167974 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130299) (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))))

(assert (= (and d!62151 c!43979) b!259189))

(assert (= (and d!62151 (not c!43979)) b!259190))

(assert (= (and d!62151 (not res!126696)) b!259191))

(assert (=> d!62151 m!273845))

(declare-fun m!274353 () Bool)

(assert (=> d!62151 m!274353))

(assert (=> b!259189 m!273845))

(declare-fun m!274355 () Bool)

(assert (=> b!259189 m!274355))

(assert (=> b!259189 m!273845))

(declare-fun m!274357 () Bool)

(assert (=> b!259189 m!274357))

(assert (=> b!259189 m!274357))

(declare-fun m!274359 () Bool)

(assert (=> b!259189 m!274359))

(assert (=> b!259191 m!273845))

(assert (=> b!259191 m!274357))

(assert (=> b!259191 m!274357))

(assert (=> b!259191 m!274359))

(assert (=> b!258893 d!62151))

(declare-fun d!62153 () Bool)

(declare-fun res!126697 () Bool)

(declare-fun e!167976 () Bool)

(assert (=> d!62153 (=> res!126697 e!167976)))

(assert (=> d!62153 (= res!126697 (= (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62153 (= (arrayContainsKey!0 lt!130102 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167976)))

(declare-fun b!259192 () Bool)

(declare-fun e!167977 () Bool)

(assert (=> b!259192 (= e!167976 e!167977)))

(declare-fun res!126698 () Bool)

(assert (=> b!259192 (=> (not res!126698) (not e!167977))))

(assert (=> b!259192 (= res!126698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(declare-fun b!259193 () Bool)

(assert (=> b!259193 (= e!167977 (arrayContainsKey!0 lt!130102 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62153 (not res!126697)) b!259192))

(assert (= (and b!259192 res!126698) b!259193))

(assert (=> d!62153 m!274255))

(declare-fun m!274361 () Bool)

(assert (=> b!259193 m!274361))

(assert (=> b!258821 d!62153))

(declare-fun d!62155 () Bool)

(assert (=> d!62155 (arrayContainsKey!0 lt!130102 lt!130215 #b00000000000000000000000000000000)))

(declare-fun lt!130471 () Unit!8002)

(assert (=> d!62155 (= lt!130471 (choose!13 lt!130102 lt!130215 #b00000000000000000000000000000000))))

(assert (=> d!62155 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62155 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130102 lt!130215 #b00000000000000000000000000000000) lt!130471)))

(declare-fun bs!9118 () Bool)

(assert (= bs!9118 d!62155))

(assert (=> bs!9118 m!273849))

(declare-fun m!274363 () Bool)

(assert (=> bs!9118 m!274363))

(assert (=> b!258768 d!62155))

(declare-fun d!62157 () Bool)

(declare-fun res!126699 () Bool)

(declare-fun e!167978 () Bool)

(assert (=> d!62157 (=> res!126699 e!167978)))

(assert (=> d!62157 (= res!126699 (= (select (arr!5944 lt!130102) #b00000000000000000000000000000000) lt!130215))))

(assert (=> d!62157 (= (arrayContainsKey!0 lt!130102 lt!130215 #b00000000000000000000000000000000) e!167978)))

(declare-fun b!259194 () Bool)

(declare-fun e!167979 () Bool)

(assert (=> b!259194 (= e!167978 e!167979)))

(declare-fun res!126700 () Bool)

(assert (=> b!259194 (=> (not res!126700) (not e!167979))))

(assert (=> b!259194 (= res!126700 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 lt!130102)))))

(declare-fun b!259195 () Bool)

(assert (=> b!259195 (= e!167979 (arrayContainsKey!0 lt!130102 lt!130215 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62157 (not res!126699)) b!259194))

(assert (= (and b!259194 res!126700) b!259195))

(assert (=> d!62157 m!273845))

(declare-fun m!274365 () Bool)

(assert (=> b!259195 m!274365))

(assert (=> b!258768 d!62157))

(declare-fun b!259196 () Bool)

(declare-fun e!167981 () SeekEntryResult!1172)

(declare-fun lt!130472 () SeekEntryResult!1172)

(assert (=> b!259196 (= e!167981 (MissingZero!1172 (index!6860 lt!130472)))))

(declare-fun b!259197 () Bool)

(declare-fun e!167982 () SeekEntryResult!1172)

(declare-fun e!167980 () SeekEntryResult!1172)

(assert (=> b!259197 (= e!167982 e!167980)))

(declare-fun lt!130474 () (_ BitVec 64))

(assert (=> b!259197 (= lt!130474 (select (arr!5944 lt!130102) (index!6860 lt!130472)))))

(declare-fun c!43982 () Bool)

(assert (=> b!259197 (= c!43982 (= lt!130474 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(declare-fun b!259198 () Bool)

(assert (=> b!259198 (= e!167981 (seekKeyOrZeroReturnVacant!0 (x!25065 lt!130472) (index!6860 lt!130472) (index!6860 lt!130472) (select (arr!5944 lt!130102) #b00000000000000000000000000000000) lt!130102 (mask!11080 thiss!1504)))))

(declare-fun b!259199 () Bool)

(declare-fun c!43980 () Bool)

(assert (=> b!259199 (= c!43980 (= lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259199 (= e!167980 e!167981)))

(declare-fun d!62159 () Bool)

(declare-fun lt!130473 () SeekEntryResult!1172)

(assert (=> d!62159 (and (or ((_ is Undefined!1172) lt!130473) (not ((_ is Found!1172) lt!130473)) (and (bvsge (index!6859 lt!130473) #b00000000000000000000000000000000) (bvslt (index!6859 lt!130473) (size!6293 lt!130102)))) (or ((_ is Undefined!1172) lt!130473) ((_ is Found!1172) lt!130473) (not ((_ is MissingZero!1172) lt!130473)) (and (bvsge (index!6858 lt!130473) #b00000000000000000000000000000000) (bvslt (index!6858 lt!130473) (size!6293 lt!130102)))) (or ((_ is Undefined!1172) lt!130473) ((_ is Found!1172) lt!130473) ((_ is MissingZero!1172) lt!130473) (not ((_ is MissingVacant!1172) lt!130473)) (and (bvsge (index!6861 lt!130473) #b00000000000000000000000000000000) (bvslt (index!6861 lt!130473) (size!6293 lt!130102)))) (or ((_ is Undefined!1172) lt!130473) (ite ((_ is Found!1172) lt!130473) (= (select (arr!5944 lt!130102) (index!6859 lt!130473)) (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1172) lt!130473) (= (select (arr!5944 lt!130102) (index!6858 lt!130473)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1172) lt!130473) (= (select (arr!5944 lt!130102) (index!6861 lt!130473)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62159 (= lt!130473 e!167982)))

(declare-fun c!43981 () Bool)

(assert (=> d!62159 (= c!43981 (and ((_ is Intermediate!1172) lt!130472) (undefined!1984 lt!130472)))))

(assert (=> d!62159 (= lt!130472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) (mask!11080 thiss!1504)) (select (arr!5944 lt!130102) #b00000000000000000000000000000000) lt!130102 (mask!11080 thiss!1504)))))

(assert (=> d!62159 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62159 (= (seekEntryOrOpen!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) lt!130102 (mask!11080 thiss!1504)) lt!130473)))

(declare-fun b!259200 () Bool)

(assert (=> b!259200 (= e!167982 Undefined!1172)))

(declare-fun b!259201 () Bool)

(assert (=> b!259201 (= e!167980 (Found!1172 (index!6860 lt!130472)))))

(assert (= (and d!62159 c!43981) b!259200))

(assert (= (and d!62159 (not c!43981)) b!259197))

(assert (= (and b!259197 c!43982) b!259201))

(assert (= (and b!259197 (not c!43982)) b!259199))

(assert (= (and b!259199 c!43980) b!259196))

(assert (= (and b!259199 (not c!43980)) b!259198))

(declare-fun m!274367 () Bool)

(assert (=> b!259197 m!274367))

(assert (=> b!259198 m!273845))

(declare-fun m!274369 () Bool)

(assert (=> b!259198 m!274369))

(assert (=> d!62159 m!273661))

(assert (=> d!62159 m!273845))

(declare-fun m!274371 () Bool)

(assert (=> d!62159 m!274371))

(declare-fun m!274373 () Bool)

(assert (=> d!62159 m!274373))

(declare-fun m!274375 () Bool)

(assert (=> d!62159 m!274375))

(assert (=> d!62159 m!274371))

(assert (=> d!62159 m!273845))

(declare-fun m!274377 () Bool)

(assert (=> d!62159 m!274377))

(declare-fun m!274379 () Bool)

(assert (=> d!62159 m!274379))

(assert (=> b!258768 d!62159))

(declare-fun b!259202 () Bool)

(declare-fun e!167983 () Bool)

(declare-fun e!167985 () Bool)

(assert (=> b!259202 (= e!167983 e!167985)))

(declare-fun res!126701 () Bool)

(assert (=> b!259202 (=> (not res!126701) (not e!167985))))

(declare-fun e!167986 () Bool)

(assert (=> b!259202 (= res!126701 (not e!167986))))

(declare-fun res!126702 () Bool)

(assert (=> b!259202 (=> (not res!126702) (not e!167986))))

(assert (=> b!259202 (= res!126702 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259203 () Bool)

(declare-fun e!167984 () Bool)

(assert (=> b!259203 (= e!167985 e!167984)))

(declare-fun c!43983 () Bool)

(assert (=> b!259203 (= c!43983 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62161 () Bool)

(declare-fun res!126703 () Bool)

(assert (=> d!62161 (=> res!126703 e!167983)))

(assert (=> d!62161 (= res!126703 (bvsge #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(assert (=> d!62161 (= (arrayNoDuplicates!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 Nil!3781) e!167983)))

(declare-fun b!259204 () Bool)

(declare-fun call!24669 () Bool)

(assert (=> b!259204 (= e!167984 call!24669)))

(declare-fun b!259205 () Bool)

(assert (=> b!259205 (= e!167986 (contains!1864 Nil!3781 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259206 () Bool)

(assert (=> b!259206 (= e!167984 call!24669)))

(declare-fun bm!24666 () Bool)

(assert (=> bm!24666 (= call!24669 (arrayNoDuplicates!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43983 (Cons!3780 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000) Nil!3781) Nil!3781)))))

(assert (= (and d!62161 (not res!126703)) b!259202))

(assert (= (and b!259202 res!126702) b!259205))

(assert (= (and b!259202 res!126701) b!259203))

(assert (= (and b!259203 c!43983) b!259206))

(assert (= (and b!259203 (not c!43983)) b!259204))

(assert (= (or b!259206 b!259204) bm!24666))

(declare-fun m!274381 () Bool)

(assert (=> b!259202 m!274381))

(assert (=> b!259202 m!274381))

(declare-fun m!274383 () Bool)

(assert (=> b!259202 m!274383))

(assert (=> b!259203 m!274381))

(assert (=> b!259203 m!274381))

(assert (=> b!259203 m!274383))

(assert (=> b!259205 m!274381))

(assert (=> b!259205 m!274381))

(declare-fun m!274385 () Bool)

(assert (=> b!259205 m!274385))

(assert (=> bm!24666 m!274381))

(declare-fun m!274387 () Bool)

(assert (=> bm!24666 m!274387))

(assert (=> b!258841 d!62161))

(declare-fun lt!130475 () (_ BitVec 32))

(declare-fun d!62163 () Bool)

(assert (=> d!62163 (and (bvsge lt!130475 #b00000000000000000000000000000000) (bvsle lt!130475 (bvsub (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!167987 () (_ BitVec 32))

(assert (=> d!62163 (= lt!130475 e!167987)))

(declare-fun c!43985 () Bool)

(assert (=> d!62163 (= c!43985 (bvsge #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62163 (and (bvsle #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6293 (_keys!6946 thiss!1504)) (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(assert (=> d!62163 (= (arrayCountValidKeys!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) #b00000000000000000000000000000000 (size!6293 (_keys!6946 thiss!1504))) lt!130475)))

(declare-fun b!259207 () Bool)

(declare-fun e!167988 () (_ BitVec 32))

(assert (=> b!259207 (= e!167987 e!167988)))

(declare-fun c!43984 () Bool)

(assert (=> b!259207 (= c!43984 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!24670 () (_ BitVec 32))

(declare-fun bm!24667 () Bool)

(assert (=> bm!24667 (= call!24670 (arrayCountValidKeys!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259208 () Bool)

(assert (=> b!259208 (= e!167987 #b00000000000000000000000000000000)))

(declare-fun b!259209 () Bool)

(assert (=> b!259209 (= e!167988 (bvadd #b00000000000000000000000000000001 call!24670))))

(declare-fun b!259210 () Bool)

(assert (=> b!259210 (= e!167988 call!24670)))

(assert (= (and d!62163 c!43985) b!259208))

(assert (= (and d!62163 (not c!43985)) b!259207))

(assert (= (and b!259207 c!43984) b!259209))

(assert (= (and b!259207 (not c!43984)) b!259210))

(assert (= (or b!259209 b!259210) bm!24667))

(assert (=> b!259207 m!274381))

(assert (=> b!259207 m!274381))

(assert (=> b!259207 m!274383))

(declare-fun m!274389 () Bool)

(assert (=> bm!24667 m!274389))

(assert (=> b!258833 d!62163))

(assert (=> b!258833 d!61991))

(assert (=> b!258791 d!62093))

(assert (=> d!62027 d!62039))

(declare-fun d!62165 () Bool)

(declare-fun e!167991 () Bool)

(assert (=> d!62165 e!167991))

(declare-fun res!126708 () Bool)

(assert (=> d!62165 (=> (not res!126708) (not e!167991))))

(declare-fun lt!130478 () SeekEntryResult!1172)

(assert (=> d!62165 (= res!126708 ((_ is Found!1172) lt!130478))))

(assert (=> d!62165 (= lt!130478 (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(assert (=> d!62165 true))

(declare-fun _$33!177 () Unit!8002)

(assert (=> d!62165 (= (choose!1261 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) _$33!177)))

(declare-fun b!259215 () Bool)

(declare-fun res!126709 () Bool)

(assert (=> b!259215 (=> (not res!126709) (not e!167991))))

(assert (=> b!259215 (= res!126709 (inRange!0 (index!6859 lt!130478) (mask!11080 thiss!1504)))))

(declare-fun b!259216 () Bool)

(assert (=> b!259216 (= e!167991 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6859 lt!130478)) key!932))))

(assert (= (and d!62165 res!126708) b!259215))

(assert (= (and b!259215 res!126709) b!259216))

(assert (=> d!62165 m!273645))

(declare-fun m!274391 () Bool)

(assert (=> b!259215 m!274391))

(declare-fun m!274393 () Bool)

(assert (=> b!259216 m!274393))

(assert (=> d!62027 d!62165))

(assert (=> d!62027 d!61995))

(declare-fun b!259229 () Bool)

(declare-fun c!43992 () Bool)

(declare-fun lt!130483 () (_ BitVec 64))

(assert (=> b!259229 (= c!43992 (= lt!130483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167998 () SeekEntryResult!1172)

(declare-fun e!167999 () SeekEntryResult!1172)

(assert (=> b!259229 (= e!167998 e!167999)))

(declare-fun b!259230 () Bool)

(assert (=> b!259230 (= e!167999 (MissingVacant!1172 (index!6860 lt!130362)))))

(declare-fun b!259231 () Bool)

(declare-fun e!168000 () SeekEntryResult!1172)

(assert (=> b!259231 (= e!168000 e!167998)))

(declare-fun c!43993 () Bool)

(assert (=> b!259231 (= c!43993 (= lt!130483 key!932))))

(declare-fun d!62167 () Bool)

(declare-fun lt!130484 () SeekEntryResult!1172)

(assert (=> d!62167 (and (or ((_ is Undefined!1172) lt!130484) (not ((_ is Found!1172) lt!130484)) (and (bvsge (index!6859 lt!130484) #b00000000000000000000000000000000) (bvslt (index!6859 lt!130484) (size!6293 (_keys!6946 thiss!1504))))) (or ((_ is Undefined!1172) lt!130484) ((_ is Found!1172) lt!130484) (not ((_ is MissingVacant!1172) lt!130484)) (not (= (index!6861 lt!130484) (index!6860 lt!130362))) (and (bvsge (index!6861 lt!130484) #b00000000000000000000000000000000) (bvslt (index!6861 lt!130484) (size!6293 (_keys!6946 thiss!1504))))) (or ((_ is Undefined!1172) lt!130484) (ite ((_ is Found!1172) lt!130484) (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6859 lt!130484)) key!932) (and ((_ is MissingVacant!1172) lt!130484) (= (index!6861 lt!130484) (index!6860 lt!130362)) (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6861 lt!130484)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62167 (= lt!130484 e!168000)))

(declare-fun c!43994 () Bool)

(assert (=> d!62167 (= c!43994 (bvsge (x!25065 lt!130362) #b01111111111111111111111111111110))))

(assert (=> d!62167 (= lt!130483 (select (arr!5944 (_keys!6946 thiss!1504)) (index!6860 lt!130362)))))

(assert (=> d!62167 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62167 (= (seekKeyOrZeroReturnVacant!0 (x!25065 lt!130362) (index!6860 lt!130362) (index!6860 lt!130362) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)) lt!130484)))

(declare-fun b!259232 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259232 (= e!167999 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25065 lt!130362) #b00000000000000000000000000000001) (nextIndex!0 (index!6860 lt!130362) (x!25065 lt!130362) (mask!11080 thiss!1504)) (index!6860 lt!130362) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(declare-fun b!259233 () Bool)

(assert (=> b!259233 (= e!168000 Undefined!1172)))

(declare-fun b!259234 () Bool)

(assert (=> b!259234 (= e!167998 (Found!1172 (index!6860 lt!130362)))))

(assert (= (and d!62167 c!43994) b!259233))

(assert (= (and d!62167 (not c!43994)) b!259231))

(assert (= (and b!259231 c!43993) b!259234))

(assert (= (and b!259231 (not c!43993)) b!259229))

(assert (= (and b!259229 c!43992) b!259230))

(assert (= (and b!259229 (not c!43992)) b!259232))

(declare-fun m!274395 () Bool)

(assert (=> d!62167 m!274395))

(declare-fun m!274397 () Bool)

(assert (=> d!62167 m!274397))

(assert (=> d!62167 m!274047))

(assert (=> d!62167 m!273661))

(declare-fun m!274399 () Bool)

(assert (=> b!259232 m!274399))

(assert (=> b!259232 m!274399))

(declare-fun m!274401 () Bool)

(assert (=> b!259232 m!274401))

(assert (=> b!258990 d!62167))

(declare-fun d!62169 () Bool)

(assert (=> d!62169 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258831 d!62169))

(declare-fun b!259235 () Bool)

(declare-fun e!168002 () Bool)

(declare-fun e!168001 () Bool)

(assert (=> b!259235 (= e!168002 e!168001)))

(declare-fun lt!130485 () (_ BitVec 64))

(assert (=> b!259235 (= lt!130485 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130487 () Unit!8002)

(assert (=> b!259235 (= lt!130487 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) lt!130485 #b00000000000000000000000000000000))))

(assert (=> b!259235 (arrayContainsKey!0 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) lt!130485 #b00000000000000000000000000000000)))

(declare-fun lt!130486 () Unit!8002)

(assert (=> b!259235 (= lt!130486 lt!130487)))

(declare-fun res!126711 () Bool)

(assert (=> b!259235 (= res!126711 (= (seekEntryOrOpen!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000) (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (mask!11080 thiss!1504)) (Found!1172 #b00000000000000000000000000000000)))))

(assert (=> b!259235 (=> (not res!126711) (not e!168001))))

(declare-fun b!259236 () Bool)

(declare-fun call!24671 () Bool)

(assert (=> b!259236 (= e!168001 call!24671)))

(declare-fun b!259237 () Bool)

(assert (=> b!259237 (= e!168002 call!24671)))

(declare-fun b!259238 () Bool)

(declare-fun e!168003 () Bool)

(assert (=> b!259238 (= e!168003 e!168002)))

(declare-fun c!43995 () Bool)

(assert (=> b!259238 (= c!43995 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24668 () Bool)

(assert (=> bm!24668 (= call!24671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (mask!11080 thiss!1504)))))

(declare-fun d!62171 () Bool)

(declare-fun res!126710 () Bool)

(assert (=> d!62171 (=> res!126710 e!168003)))

(assert (=> d!62171 (= res!126710 (bvsge #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(assert (=> d!62171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (mask!11080 thiss!1504)) e!168003)))

(assert (= (and d!62171 (not res!126710)) b!259238))

(assert (= (and b!259238 c!43995) b!259235))

(assert (= (and b!259238 (not c!43995)) b!259237))

(assert (= (and b!259235 res!126711) b!259236))

(assert (= (or b!259236 b!259237) bm!24668))

(assert (=> b!259235 m!274381))

(declare-fun m!274403 () Bool)

(assert (=> b!259235 m!274403))

(declare-fun m!274405 () Bool)

(assert (=> b!259235 m!274405))

(assert (=> b!259235 m!274381))

(declare-fun m!274407 () Bool)

(assert (=> b!259235 m!274407))

(assert (=> b!259238 m!274381))

(assert (=> b!259238 m!274381))

(assert (=> b!259238 m!274383))

(declare-fun m!274409 () Bool)

(assert (=> bm!24668 m!274409))

(assert (=> b!258838 d!62171))

(declare-fun lt!130490 () Bool)

(declare-fun d!62173 () Bool)

(declare-fun content!171 (List!3783) (InoxSet tuple2!4884))

(assert (=> d!62173 (= lt!130490 (select (content!171 (toList!1909 lt!130207)) (tuple2!4885 key!932 v!346)))))

(declare-fun e!168008 () Bool)

(assert (=> d!62173 (= lt!130490 e!168008)))

(declare-fun res!126717 () Bool)

(assert (=> d!62173 (=> (not res!126717) (not e!168008))))

(assert (=> d!62173 (= res!126717 ((_ is Cons!3779) (toList!1909 lt!130207)))))

(assert (=> d!62173 (= (contains!1863 (toList!1909 lt!130207) (tuple2!4885 key!932 v!346)) lt!130490)))

(declare-fun b!259243 () Bool)

(declare-fun e!168009 () Bool)

(assert (=> b!259243 (= e!168008 e!168009)))

(declare-fun res!126716 () Bool)

(assert (=> b!259243 (=> res!126716 e!168009)))

(assert (=> b!259243 (= res!126716 (= (h!4442 (toList!1909 lt!130207)) (tuple2!4885 key!932 v!346)))))

(declare-fun b!259244 () Bool)

(assert (=> b!259244 (= e!168009 (contains!1863 (t!8839 (toList!1909 lt!130207)) (tuple2!4885 key!932 v!346)))))

(assert (= (and d!62173 res!126717) b!259243))

(assert (= (and b!259243 (not res!126716)) b!259244))

(declare-fun m!274411 () Bool)

(assert (=> d!62173 m!274411))

(declare-fun m!274413 () Bool)

(assert (=> d!62173 m!274413))

(declare-fun m!274415 () Bool)

(assert (=> b!259244 m!274415))

(assert (=> b!258759 d!62173))

(assert (=> d!62037 d!62039))

(declare-fun b!259261 () Bool)

(declare-fun res!126727 () Bool)

(declare-fun e!168018 () Bool)

(assert (=> b!259261 (=> (not res!126727) (not e!168018))))

(declare-fun lt!130493 () SeekEntryResult!1172)

(assert (=> b!259261 (= res!126727 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6861 lt!130493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259262 () Bool)

(declare-fun res!126729 () Bool)

(assert (=> b!259262 (=> (not res!126729) (not e!168018))))

(declare-fun call!24676 () Bool)

(assert (=> b!259262 (= res!126729 call!24676)))

(declare-fun e!168020 () Bool)

(assert (=> b!259262 (= e!168020 e!168018)))

(declare-fun bm!24673 () Bool)

(declare-fun c!44001 () Bool)

(assert (=> bm!24673 (= call!24676 (inRange!0 (ite c!44001 (index!6858 lt!130493) (index!6861 lt!130493)) (mask!11080 thiss!1504)))))

(declare-fun d!62175 () Bool)

(declare-fun e!168021 () Bool)

(assert (=> d!62175 e!168021))

(assert (=> d!62175 (= c!44001 ((_ is MissingZero!1172) lt!130493))))

(assert (=> d!62175 (= lt!130493 (seekEntryOrOpen!0 key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(assert (=> d!62175 true))

(declare-fun _$34!1122 () Unit!8002)

(assert (=> d!62175 (= (choose!1262 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 (defaultEntry!4773 thiss!1504)) _$34!1122)))

(declare-fun b!259263 () Bool)

(declare-fun call!24677 () Bool)

(assert (=> b!259263 (= e!168018 (not call!24677))))

(declare-fun b!259264 () Bool)

(declare-fun e!168019 () Bool)

(assert (=> b!259264 (= e!168019 (not call!24677))))

(declare-fun b!259265 () Bool)

(declare-fun res!126726 () Bool)

(assert (=> b!259265 (= res!126726 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6858 lt!130493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259265 (=> (not res!126726) (not e!168019))))

(declare-fun b!259266 () Bool)

(assert (=> b!259266 (= e!168020 ((_ is Undefined!1172) lt!130493))))

(declare-fun b!259267 () Bool)

(assert (=> b!259267 (= e!168021 e!168019)))

(declare-fun res!126728 () Bool)

(assert (=> b!259267 (= res!126728 call!24676)))

(assert (=> b!259267 (=> (not res!126728) (not e!168019))))

(declare-fun b!259268 () Bool)

(assert (=> b!259268 (= e!168021 e!168020)))

(declare-fun c!44000 () Bool)

(assert (=> b!259268 (= c!44000 ((_ is MissingVacant!1172) lt!130493))))

(declare-fun bm!24674 () Bool)

(assert (=> bm!24674 (= call!24677 (arrayContainsKey!0 (_keys!6946 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!62175 c!44001) b!259267))

(assert (= (and d!62175 (not c!44001)) b!259268))

(assert (= (and b!259267 res!126728) b!259265))

(assert (= (and b!259265 res!126726) b!259264))

(assert (= (and b!259268 c!44000) b!259262))

(assert (= (and b!259268 (not c!44000)) b!259266))

(assert (= (and b!259262 res!126729) b!259261))

(assert (= (and b!259261 res!126727) b!259263))

(assert (= (or b!259267 b!259262) bm!24673))

(assert (= (or b!259264 b!259263) bm!24674))

(assert (=> d!62175 m!273645))

(assert (=> bm!24674 m!273657))

(declare-fun m!274417 () Bool)

(assert (=> b!259261 m!274417))

(declare-fun m!274419 () Bool)

(assert (=> b!259265 m!274419))

(declare-fun m!274421 () Bool)

(assert (=> bm!24673 m!274421))

(assert (=> d!62037 d!62175))

(assert (=> d!62037 d!61995))

(declare-fun d!62177 () Bool)

(declare-fun lt!130494 () (_ BitVec 32))

(assert (=> d!62177 (and (bvsge lt!130494 #b00000000000000000000000000000000) (bvsle lt!130494 (bvsub (size!6293 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168022 () (_ BitVec 32))

(assert (=> d!62177 (= lt!130494 e!168022)))

(declare-fun c!44003 () Bool)

(assert (=> d!62177 (= c!44003 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62177 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6293 (_keys!6946 thiss!1504)) (size!6293 lt!130102)))))

(assert (=> d!62177 (= (arrayCountValidKeys!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))) lt!130494)))

(declare-fun b!259269 () Bool)

(declare-fun e!168023 () (_ BitVec 32))

(assert (=> b!259269 (= e!168022 e!168023)))

(declare-fun c!44002 () Bool)

(assert (=> b!259269 (= c!44002 (validKeyInArray!0 (select (arr!5944 lt!130102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24675 () Bool)

(declare-fun call!24678 () (_ BitVec 32))

(assert (=> bm!24675 (= call!24678 (arrayCountValidKeys!0 lt!130102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259270 () Bool)

(assert (=> b!259270 (= e!168022 #b00000000000000000000000000000000)))

(declare-fun b!259271 () Bool)

(assert (=> b!259271 (= e!168023 (bvadd #b00000000000000000000000000000001 call!24678))))

(declare-fun b!259272 () Bool)

(assert (=> b!259272 (= e!168023 call!24678)))

(assert (= (and d!62177 c!44003) b!259270))

(assert (= (and d!62177 (not c!44003)) b!259269))

(assert (= (and b!259269 c!44002) b!259271))

(assert (= (and b!259269 (not c!44002)) b!259272))

(assert (= (or b!259271 b!259272) bm!24675))

(assert (=> b!259269 m!274255))

(assert (=> b!259269 m!274255))

(assert (=> b!259269 m!274263))

(declare-fun m!274423 () Bool)

(assert (=> bm!24675 m!274423))

(assert (=> bm!24609 d!62177))

(declare-fun d!62179 () Bool)

(declare-fun e!168024 () Bool)

(assert (=> d!62179 e!168024))

(declare-fun res!126731 () Bool)

(assert (=> d!62179 (=> (not res!126731) (not e!168024))))

(declare-fun lt!130497 () ListLongMap!3787)

(assert (=> d!62179 (= res!126731 (contains!1861 lt!130497 (_1!2453 (tuple2!4885 key!932 v!346))))))

(declare-fun lt!130496 () List!3783)

(assert (=> d!62179 (= lt!130497 (ListLongMap!3788 lt!130496))))

(declare-fun lt!130495 () Unit!8002)

(declare-fun lt!130498 () Unit!8002)

(assert (=> d!62179 (= lt!130495 lt!130498)))

(assert (=> d!62179 (= (getValueByKey!312 lt!130496 (_1!2453 (tuple2!4885 key!932 v!346))) (Some!317 (_2!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> d!62179 (= lt!130498 (lemmaContainsTupThenGetReturnValue!171 lt!130496 (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> d!62179 (= lt!130496 (insertStrictlySorted!174 (toList!1909 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) (_1!2453 (tuple2!4885 key!932 v!346)) (_2!2453 (tuple2!4885 key!932 v!346))))))

(assert (=> d!62179 (= (+!697 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) (tuple2!4885 key!932 v!346)) lt!130497)))

(declare-fun b!259273 () Bool)

(declare-fun res!126730 () Bool)

(assert (=> b!259273 (=> (not res!126730) (not e!168024))))

(assert (=> b!259273 (= res!126730 (= (getValueByKey!312 (toList!1909 lt!130497) (_1!2453 (tuple2!4885 key!932 v!346))) (Some!317 (_2!2453 (tuple2!4885 key!932 v!346)))))))

(declare-fun b!259274 () Bool)

(assert (=> b!259274 (= e!168024 (contains!1863 (toList!1909 lt!130497) (tuple2!4885 key!932 v!346)))))

(assert (= (and d!62179 res!126731) b!259273))

(assert (= (and b!259273 res!126730) b!259274))

(declare-fun m!274425 () Bool)

(assert (=> d!62179 m!274425))

(declare-fun m!274427 () Bool)

(assert (=> d!62179 m!274427))

(declare-fun m!274429 () Bool)

(assert (=> d!62179 m!274429))

(declare-fun m!274431 () Bool)

(assert (=> d!62179 m!274431))

(declare-fun m!274433 () Bool)

(assert (=> b!259273 m!274433))

(declare-fun m!274435 () Bool)

(assert (=> b!259274 m!274435))

(assert (=> b!258786 d!62179))

(assert (=> b!258786 d!62033))

(declare-fun lt!130513 () ListLongMap!3787)

(declare-fun b!259275 () Bool)

(declare-fun e!168032 () Bool)

(assert (=> b!259275 (= e!168032 (= (apply!256 lt!130513 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)) (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))))))))

(assert (=> b!259275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(declare-fun b!259276 () Bool)

(declare-fun e!168034 () Bool)

(declare-fun call!24680 () Bool)

(assert (=> b!259276 (= e!168034 (not call!24680))))

(declare-fun b!259277 () Bool)

(declare-fun e!168031 () ListLongMap!3787)

(declare-fun call!24683 () ListLongMap!3787)

(assert (=> b!259277 (= e!168031 (+!697 call!24683 (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504))))))

(declare-fun b!259278 () Bool)

(declare-fun e!168026 () Bool)

(assert (=> b!259278 (= e!168026 e!168034)))

(declare-fun c!44006 () Bool)

(assert (=> b!259278 (= c!44006 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259279 () Bool)

(declare-fun c!44008 () Bool)

(assert (=> b!259279 (= c!44008 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!168028 () ListLongMap!3787)

(declare-fun e!168025 () ListLongMap!3787)

(assert (=> b!259279 (= e!168028 e!168025)))

(declare-fun e!168030 () Bool)

(declare-fun b!259280 () Bool)

(assert (=> b!259280 (= e!168030 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259281 () Bool)

(declare-fun e!168037 () Bool)

(assert (=> b!259281 (= e!168037 (= (apply!256 lt!130513 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4614 thiss!1504)))))

(declare-fun b!259282 () Bool)

(declare-fun e!168036 () Unit!8002)

(declare-fun Unit!8020 () Unit!8002)

(assert (=> b!259282 (= e!168036 Unit!8020)))

(declare-fun b!259283 () Bool)

(declare-fun res!126734 () Bool)

(assert (=> b!259283 (=> (not res!126734) (not e!168026))))

(declare-fun e!168029 () Bool)

(assert (=> b!259283 (= res!126734 e!168029)))

(declare-fun res!126733 () Bool)

(assert (=> b!259283 (=> res!126733 e!168029)))

(assert (=> b!259283 (= res!126733 (not e!168030))))

(declare-fun res!126732 () Bool)

(assert (=> b!259283 (=> (not res!126732) (not e!168030))))

(assert (=> b!259283 (= res!126732 (bvslt #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(declare-fun bm!24676 () Bool)

(declare-fun call!24684 () ListLongMap!3787)

(declare-fun call!24682 () ListLongMap!3787)

(assert (=> bm!24676 (= call!24684 call!24682)))

(declare-fun b!259284 () Bool)

(assert (=> b!259284 (= e!168029 e!168032)))

(declare-fun res!126740 () Bool)

(assert (=> b!259284 (=> (not res!126740) (not e!168032))))

(assert (=> b!259284 (= res!126740 (contains!1861 lt!130513 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!259284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(declare-fun b!259285 () Bool)

(declare-fun e!168027 () Bool)

(assert (=> b!259285 (= e!168027 e!168037)))

(declare-fun res!126738 () Bool)

(declare-fun call!24681 () Bool)

(assert (=> b!259285 (= res!126738 call!24681)))

(assert (=> b!259285 (=> (not res!126738) (not e!168037))))

(declare-fun bm!24677 () Bool)

(declare-fun call!24685 () ListLongMap!3787)

(assert (=> bm!24677 (= call!24682 call!24685)))

(declare-fun bm!24678 () Bool)

(assert (=> bm!24678 (= call!24685 (getCurrentListMapNoExtraKeys!572 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259286 () Bool)

(assert (=> b!259286 (= e!168025 call!24684)))

(declare-fun b!259287 () Bool)

(declare-fun call!24679 () ListLongMap!3787)

(assert (=> b!259287 (= e!168028 call!24679)))

(declare-fun b!259288 () Bool)

(assert (=> b!259288 (= e!168025 call!24679)))

(declare-fun b!259289 () Bool)

(declare-fun e!168035 () Bool)

(assert (=> b!259289 (= e!168035 (= (apply!256 lt!130513 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4614 thiss!1504)))))

(declare-fun b!259290 () Bool)

(declare-fun res!126737 () Bool)

(assert (=> b!259290 (=> (not res!126737) (not e!168026))))

(assert (=> b!259290 (= res!126737 e!168027)))

(declare-fun c!44007 () Bool)

(assert (=> b!259290 (= c!44007 (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259291 () Bool)

(declare-fun lt!130515 () Unit!8002)

(assert (=> b!259291 (= e!168036 lt!130515)))

(declare-fun lt!130499 () ListLongMap!3787)

(assert (=> b!259291 (= lt!130499 (getCurrentListMapNoExtraKeys!572 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130514 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130504 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130504 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130516 () Unit!8002)

(assert (=> b!259291 (= lt!130516 (addStillContains!232 lt!130499 lt!130514 (zeroValue!4614 thiss!1504) lt!130504))))

(assert (=> b!259291 (contains!1861 (+!697 lt!130499 (tuple2!4885 lt!130514 (zeroValue!4614 thiss!1504))) lt!130504)))

(declare-fun lt!130518 () Unit!8002)

(assert (=> b!259291 (= lt!130518 lt!130516)))

(declare-fun lt!130502 () ListLongMap!3787)

(assert (=> b!259291 (= lt!130502 (getCurrentListMapNoExtraKeys!572 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130508 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130517 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130517 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130520 () Unit!8002)

(assert (=> b!259291 (= lt!130520 (addApplyDifferent!232 lt!130502 lt!130508 (minValue!4614 thiss!1504) lt!130517))))

(assert (=> b!259291 (= (apply!256 (+!697 lt!130502 (tuple2!4885 lt!130508 (minValue!4614 thiss!1504))) lt!130517) (apply!256 lt!130502 lt!130517))))

(declare-fun lt!130503 () Unit!8002)

(assert (=> b!259291 (= lt!130503 lt!130520)))

(declare-fun lt!130519 () ListLongMap!3787)

(assert (=> b!259291 (= lt!130519 (getCurrentListMapNoExtraKeys!572 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130505 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130501 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130501 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130511 () Unit!8002)

(assert (=> b!259291 (= lt!130511 (addApplyDifferent!232 lt!130519 lt!130505 (zeroValue!4614 thiss!1504) lt!130501))))

(assert (=> b!259291 (= (apply!256 (+!697 lt!130519 (tuple2!4885 lt!130505 (zeroValue!4614 thiss!1504))) lt!130501) (apply!256 lt!130519 lt!130501))))

(declare-fun lt!130500 () Unit!8002)

(assert (=> b!259291 (= lt!130500 lt!130511)))

(declare-fun lt!130506 () ListLongMap!3787)

(assert (=> b!259291 (= lt!130506 (getCurrentListMapNoExtraKeys!572 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)))))

(declare-fun lt!130510 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130510 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130507 () (_ BitVec 64))

(assert (=> b!259291 (= lt!130507 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!259291 (= lt!130515 (addApplyDifferent!232 lt!130506 lt!130510 (minValue!4614 thiss!1504) lt!130507))))

(assert (=> b!259291 (= (apply!256 (+!697 lt!130506 (tuple2!4885 lt!130510 (minValue!4614 thiss!1504))) lt!130507) (apply!256 lt!130506 lt!130507))))

(declare-fun c!44009 () Bool)

(declare-fun bm!24679 () Bool)

(declare-fun c!44005 () Bool)

(assert (=> bm!24679 (= call!24683 (+!697 (ite c!44005 call!24685 (ite c!44009 call!24682 call!24684)) (ite (or c!44005 c!44009) (tuple2!4885 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4614 thiss!1504)) (tuple2!4885 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4614 thiss!1504)))))))

(declare-fun bm!24680 () Bool)

(assert (=> bm!24680 (= call!24679 call!24683)))

(declare-fun bm!24681 () Bool)

(assert (=> bm!24681 (= call!24680 (contains!1861 lt!130513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168033 () Bool)

(declare-fun b!259292 () Bool)

(assert (=> b!259292 (= e!168033 (validKeyInArray!0 (select (arr!5944 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62181 () Bool)

(assert (=> d!62181 e!168026))

(declare-fun res!126739 () Bool)

(assert (=> d!62181 (=> (not res!126739) (not e!168026))))

(assert (=> d!62181 (= res!126739 (or (bvsge #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))))

(declare-fun lt!130509 () ListLongMap!3787)

(assert (=> d!62181 (= lt!130513 lt!130509)))

(declare-fun lt!130512 () Unit!8002)

(assert (=> d!62181 (= lt!130512 e!168036)))

(declare-fun c!44004 () Bool)

(assert (=> d!62181 (= c!44004 e!168033)))

(declare-fun res!126735 () Bool)

(assert (=> d!62181 (=> (not res!126735) (not e!168033))))

(assert (=> d!62181 (= res!126735 (bvslt #b00000000000000000000000000000000 (size!6293 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))))))))

(assert (=> d!62181 (= lt!130509 e!168031)))

(assert (=> d!62181 (= c!44005 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62181 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62181 (= (getCurrentListMap!1418 (array!12558 (store (arr!5944 (_keys!6946 thiss!1504)) index!297 key!932) (size!6293 (_keys!6946 thiss!1504))) (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130513)))

(declare-fun b!259293 () Bool)

(assert (=> b!259293 (= e!168031 e!168028)))

(assert (=> b!259293 (= c!44009 (and (not (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4510 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24682 () Bool)

(assert (=> bm!24682 (= call!24681 (contains!1861 lt!130513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259294 () Bool)

(assert (=> b!259294 (= e!168034 e!168035)))

(declare-fun res!126736 () Bool)

(assert (=> b!259294 (= res!126736 call!24680)))

(assert (=> b!259294 (=> (not res!126736) (not e!168035))))

(declare-fun b!259295 () Bool)

(assert (=> b!259295 (= e!168027 (not call!24681))))

(assert (= (and d!62181 c!44005) b!259277))

(assert (= (and d!62181 (not c!44005)) b!259293))

(assert (= (and b!259293 c!44009) b!259287))

(assert (= (and b!259293 (not c!44009)) b!259279))

(assert (= (and b!259279 c!44008) b!259288))

(assert (= (and b!259279 (not c!44008)) b!259286))

(assert (= (or b!259288 b!259286) bm!24676))

(assert (= (or b!259287 bm!24676) bm!24677))

(assert (= (or b!259287 b!259288) bm!24680))

(assert (= (or b!259277 bm!24677) bm!24678))

(assert (= (or b!259277 bm!24680) bm!24679))

(assert (= (and d!62181 res!126735) b!259292))

(assert (= (and d!62181 c!44004) b!259291))

(assert (= (and d!62181 (not c!44004)) b!259282))

(assert (= (and d!62181 res!126739) b!259283))

(assert (= (and b!259283 res!126732) b!259280))

(assert (= (and b!259283 (not res!126733)) b!259284))

(assert (= (and b!259284 res!126740) b!259275))

(assert (= (and b!259283 res!126734) b!259290))

(assert (= (and b!259290 c!44007) b!259285))

(assert (= (and b!259290 (not c!44007)) b!259295))

(assert (= (and b!259285 res!126738) b!259281))

(assert (= (or b!259285 b!259295) bm!24682))

(assert (= (and b!259290 res!126737) b!259278))

(assert (= (and b!259278 c!44006) b!259294))

(assert (= (and b!259278 (not c!44006)) b!259276))

(assert (= (and b!259294 res!126736) b!259289))

(assert (= (or b!259294 b!259276) bm!24681))

(declare-fun b_lambda!8217 () Bool)

(assert (=> (not b_lambda!8217) (not b!259275)))

(assert (=> b!259275 t!8844))

(declare-fun b_and!13821 () Bool)

(assert (= b_and!13819 (and (=> t!8844 result!5389) b_and!13821)))

(assert (=> b!259275 m!273909))

(assert (=> b!259275 m!273911))

(assert (=> b!259275 m!273913))

(assert (=> b!259275 m!274381))

(declare-fun m!274437 () Bool)

(assert (=> b!259275 m!274437))

(assert (=> b!259275 m!273911))

(assert (=> b!259275 m!273909))

(assert (=> b!259275 m!274381))

(assert (=> b!259292 m!274381))

(assert (=> b!259292 m!274381))

(assert (=> b!259292 m!274383))

(declare-fun m!274439 () Bool)

(assert (=> b!259277 m!274439))

(declare-fun m!274441 () Bool)

(assert (=> bm!24682 m!274441))

(assert (=> d!62181 m!273661))

(declare-fun m!274443 () Bool)

(assert (=> bm!24678 m!274443))

(declare-fun m!274445 () Bool)

(assert (=> b!259281 m!274445))

(declare-fun m!274447 () Bool)

(assert (=> b!259291 m!274447))

(declare-fun m!274449 () Bool)

(assert (=> b!259291 m!274449))

(declare-fun m!274451 () Bool)

(assert (=> b!259291 m!274451))

(declare-fun m!274453 () Bool)

(assert (=> b!259291 m!274453))

(declare-fun m!274455 () Bool)

(assert (=> b!259291 m!274455))

(assert (=> b!259291 m!274453))

(declare-fun m!274457 () Bool)

(assert (=> b!259291 m!274457))

(assert (=> b!259291 m!274381))

(declare-fun m!274459 () Bool)

(assert (=> b!259291 m!274459))

(assert (=> b!259291 m!274449))

(declare-fun m!274461 () Bool)

(assert (=> b!259291 m!274461))

(declare-fun m!274463 () Bool)

(assert (=> b!259291 m!274463))

(declare-fun m!274465 () Bool)

(assert (=> b!259291 m!274465))

(declare-fun m!274467 () Bool)

(assert (=> b!259291 m!274467))

(declare-fun m!274469 () Bool)

(assert (=> b!259291 m!274469))

(assert (=> b!259291 m!274443))

(declare-fun m!274471 () Bool)

(assert (=> b!259291 m!274471))

(declare-fun m!274473 () Bool)

(assert (=> b!259291 m!274473))

(assert (=> b!259291 m!274469))

(declare-fun m!274475 () Bool)

(assert (=> b!259291 m!274475))

(assert (=> b!259291 m!274471))

(assert (=> b!259280 m!274381))

(assert (=> b!259280 m!274381))

(assert (=> b!259280 m!274383))

(declare-fun m!274477 () Bool)

(assert (=> b!259289 m!274477))

(assert (=> b!259284 m!274381))

(assert (=> b!259284 m!274381))

(declare-fun m!274479 () Bool)

(assert (=> b!259284 m!274479))

(declare-fun m!274481 () Bool)

(assert (=> bm!24681 m!274481))

(declare-fun m!274483 () Bool)

(assert (=> bm!24679 m!274483))

(assert (=> b!258786 d!62181))

(declare-fun d!62183 () Bool)

(assert (=> d!62183 (= (apply!256 lt!130299 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3057 (getValueByKey!312 (toList!1909 lt!130299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9119 () Bool)

(assert (= bs!9119 d!62183))

(assert (=> bs!9119 m!274283))

(assert (=> bs!9119 m!274283))

(declare-fun m!274485 () Bool)

(assert (=> bs!9119 m!274485))

(assert (=> b!258898 d!62183))

(declare-fun d!62185 () Bool)

(assert (=> d!62185 (= (inRange!0 (index!6859 lt!130314) (mask!11080 thiss!1504)) (and (bvsge (index!6859 lt!130314) #b00000000000000000000000000000000) (bvslt (index!6859 lt!130314) (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258911 d!62185))

(declare-fun b!259296 () Bool)

(declare-fun e!168039 () Bool)

(assert (=> b!259296 (= e!168039 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (=> b!259296 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259297 () Bool)

(declare-fun lt!130521 () Unit!8002)

(declare-fun lt!130526 () Unit!8002)

(assert (=> b!259297 (= lt!130521 lt!130526)))

(declare-fun lt!130527 () ListLongMap!3787)

(declare-fun lt!130523 () V!8457)

(declare-fun lt!130522 () (_ BitVec 64))

(declare-fun lt!130525 () (_ BitVec 64))

(assert (=> b!259297 (not (contains!1861 (+!697 lt!130527 (tuple2!4885 lt!130522 lt!130523)) lt!130525))))

(assert (=> b!259297 (= lt!130526 (addStillNotContains!127 lt!130527 lt!130522 lt!130523 lt!130525))))

(assert (=> b!259297 (= lt!130525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259297 (= lt!130523 (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259297 (= lt!130522 (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))

(declare-fun call!24686 () ListLongMap!3787)

(assert (=> b!259297 (= lt!130527 call!24686)))

(declare-fun e!168041 () ListLongMap!3787)

(assert (=> b!259297 (= e!168041 (+!697 call!24686 (tuple2!4885 (select (arr!5944 lt!130102) #b00000000000000000000000000000000) (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259298 () Bool)

(declare-fun res!126743 () Bool)

(declare-fun e!168038 () Bool)

(assert (=> b!259298 (=> (not res!126743) (not e!168038))))

(declare-fun lt!130524 () ListLongMap!3787)

(assert (=> b!259298 (= res!126743 (not (contains!1861 lt!130524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259299 () Bool)

(assert (=> b!259299 (= e!168041 call!24686)))

(declare-fun bm!24683 () Bool)

(assert (=> bm!24683 (= call!24686 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504)))))

(declare-fun b!259300 () Bool)

(declare-fun e!168042 () Bool)

(declare-fun e!168043 () Bool)

(assert (=> b!259300 (= e!168042 e!168043)))

(assert (=> b!259300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun res!126741 () Bool)

(assert (=> b!259300 (= res!126741 (contains!1861 lt!130524 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (=> b!259300 (=> (not res!126741) (not e!168043))))

(declare-fun b!259301 () Bool)

(declare-fun e!168044 () Bool)

(assert (=> b!259301 (= e!168044 (= lt!130524 (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4773 thiss!1504))))))

(declare-fun b!259302 () Bool)

(assert (=> b!259302 (= e!168042 e!168044)))

(declare-fun c!44010 () Bool)

(assert (=> b!259302 (= c!44010 (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun b!259303 () Bool)

(assert (=> b!259303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(assert (=> b!259303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6292 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))))))))

(assert (=> b!259303 (= e!168043 (= (apply!256 lt!130524 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!62187 () Bool)

(assert (=> d!62187 e!168038))

(declare-fun res!126744 () Bool)

(assert (=> d!62187 (=> (not res!126744) (not e!168038))))

(assert (=> d!62187 (= res!126744 (not (contains!1861 lt!130524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!168040 () ListLongMap!3787)

(assert (=> d!62187 (= lt!130524 e!168040)))

(declare-fun c!44012 () Bool)

(assert (=> d!62187 (= c!44012 (bvsge #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(assert (=> d!62187 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62187 (= (getCurrentListMapNoExtraKeys!572 lt!130102 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504))) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) lt!130524)))

(declare-fun b!259304 () Bool)

(assert (=> b!259304 (= e!168044 (isEmpty!538 lt!130524))))

(declare-fun b!259305 () Bool)

(assert (=> b!259305 (= e!168040 (ListLongMap!3788 Nil!3780))))

(declare-fun b!259306 () Bool)

(assert (=> b!259306 (= e!168038 e!168042)))

(declare-fun c!44013 () Bool)

(assert (=> b!259306 (= c!44013 e!168039)))

(declare-fun res!126742 () Bool)

(assert (=> b!259306 (=> (not res!126742) (not e!168039))))

(assert (=> b!259306 (= res!126742 (bvslt #b00000000000000000000000000000000 (size!6293 lt!130102)))))

(declare-fun b!259307 () Bool)

(assert (=> b!259307 (= e!168040 e!168041)))

(declare-fun c!44011 () Bool)

(assert (=> b!259307 (= c!44011 (validKeyInArray!0 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)))))

(assert (= (and d!62187 c!44012) b!259305))

(assert (= (and d!62187 (not c!44012)) b!259307))

(assert (= (and b!259307 c!44011) b!259297))

(assert (= (and b!259307 (not c!44011)) b!259299))

(assert (= (or b!259297 b!259299) bm!24683))

(assert (= (and d!62187 res!126744) b!259298))

(assert (= (and b!259298 res!126743) b!259306))

(assert (= (and b!259306 res!126742) b!259296))

(assert (= (and b!259306 c!44013) b!259300))

(assert (= (and b!259306 (not c!44013)) b!259302))

(assert (= (and b!259300 res!126741) b!259303))

(assert (= (and b!259302 c!44010) b!259301))

(assert (= (and b!259302 (not c!44010)) b!259304))

(declare-fun b_lambda!8219 () Bool)

(assert (=> (not b_lambda!8219) (not b!259297)))

(assert (=> b!259297 t!8844))

(declare-fun b_and!13823 () Bool)

(assert (= b_and!13821 (and (=> t!8844 result!5389) b_and!13823)))

(declare-fun b_lambda!8221 () Bool)

(assert (=> (not b_lambda!8221) (not b!259303)))

(assert (=> b!259303 t!8844))

(declare-fun b_and!13825 () Bool)

(assert (= b_and!13823 (and (=> t!8844 result!5389) b_and!13825)))

(declare-fun m!274487 () Bool)

(assert (=> b!259297 m!274487))

(declare-fun m!274489 () Bool)

(assert (=> b!259297 m!274489))

(declare-fun m!274491 () Bool)

(assert (=> b!259297 m!274491))

(assert (=> b!259297 m!273909))

(assert (=> b!259297 m!273911))

(assert (=> b!259297 m!273913))

(assert (=> b!259297 m!273911))

(assert (=> b!259297 m!273845))

(assert (=> b!259297 m!273909))

(assert (=> b!259297 m!274487))

(declare-fun m!274493 () Bool)

(assert (=> b!259297 m!274493))

(declare-fun m!274495 () Bool)

(assert (=> b!259298 m!274495))

(declare-fun m!274497 () Bool)

(assert (=> bm!24683 m!274497))

(assert (=> b!259296 m!273845))

(assert (=> b!259296 m!273845))

(assert (=> b!259296 m!273853))

(assert (=> b!259307 m!273845))

(assert (=> b!259307 m!273845))

(assert (=> b!259307 m!273853))

(assert (=> b!259300 m!273845))

(assert (=> b!259300 m!273845))

(declare-fun m!274499 () Bool)

(assert (=> b!259300 m!274499))

(declare-fun m!274501 () Bool)

(assert (=> b!259304 m!274501))

(assert (=> b!259303 m!273845))

(declare-fun m!274503 () Bool)

(assert (=> b!259303 m!274503))

(assert (=> b!259303 m!273909))

(assert (=> b!259303 m!273911))

(assert (=> b!259303 m!273913))

(assert (=> b!259303 m!273911))

(assert (=> b!259303 m!273845))

(assert (=> b!259303 m!273909))

(assert (=> b!259301 m!274497))

(declare-fun m!274505 () Bool)

(assert (=> d!62187 m!274505))

(assert (=> d!62187 m!273661))

(assert (=> bm!24630 d!62187))

(assert (=> b!258771 d!62041))

(declare-fun d!62189 () Bool)

(declare-fun e!168045 () Bool)

(assert (=> d!62189 e!168045))

(declare-fun res!126745 () Bool)

(assert (=> d!62189 (=> res!126745 e!168045)))

(declare-fun lt!130529 () Bool)

(assert (=> d!62189 (= res!126745 (not lt!130529))))

(declare-fun lt!130531 () Bool)

(assert (=> d!62189 (= lt!130529 lt!130531)))

(declare-fun lt!130528 () Unit!8002)

(declare-fun e!168046 () Unit!8002)

(assert (=> d!62189 (= lt!130528 e!168046)))

(declare-fun c!44014 () Bool)

(assert (=> d!62189 (= c!44014 lt!130531)))

(assert (=> d!62189 (= lt!130531 (containsKey!304 (toList!1909 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(assert (=> d!62189 (= (contains!1861 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932) lt!130529)))

(declare-fun b!259308 () Bool)

(declare-fun lt!130530 () Unit!8002)

(assert (=> b!259308 (= e!168046 lt!130530)))

(assert (=> b!259308 (= lt!130530 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(assert (=> b!259308 (isDefined!254 (getValueByKey!312 (toList!1909 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932))))

(declare-fun b!259309 () Bool)

(declare-fun Unit!8021 () Unit!8002)

(assert (=> b!259309 (= e!168046 Unit!8021)))

(declare-fun b!259310 () Bool)

(assert (=> b!259310 (= e!168045 (isDefined!254 (getValueByKey!312 (toList!1909 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504))) key!932)))))

(assert (= (and d!62189 c!44014) b!259308))

(assert (= (and d!62189 (not c!44014)) b!259309))

(assert (= (and d!62189 (not res!126745)) b!259310))

(declare-fun m!274507 () Bool)

(assert (=> d!62189 m!274507))

(declare-fun m!274509 () Bool)

(assert (=> b!259308 m!274509))

(declare-fun m!274511 () Bool)

(assert (=> b!259308 m!274511))

(assert (=> b!259308 m!274511))

(declare-fun m!274513 () Bool)

(assert (=> b!259308 m!274513))

(assert (=> b!259310 m!274511))

(assert (=> b!259310 m!274511))

(assert (=> b!259310 m!274513))

(assert (=> d!62019 d!62189))

(assert (=> d!62019 d!62033))

(declare-fun d!62191 () Bool)

(assert (=> d!62191 (contains!1861 (getCurrentListMap!1418 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) key!932)))

(assert (=> d!62191 true))

(declare-fun _$17!86 () Unit!8002)

(assert (=> d!62191 (= (choose!1260 (_keys!6946 thiss!1504) (_values!4756 thiss!1504) (mask!11080 thiss!1504) (extraKeys!4510 thiss!1504) (zeroValue!4614 thiss!1504) (minValue!4614 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4773 thiss!1504)) _$17!86)))

(declare-fun bs!9120 () Bool)

(assert (= bs!9120 d!62191))

(assert (=> bs!9120 m!273655))

(assert (=> bs!9120 m!273655))

(assert (=> bs!9120 m!273963))

(assert (=> d!62019 d!62191))

(assert (=> d!62019 d!61995))

(assert (=> b!258805 d!62041))

(declare-fun d!62193 () Bool)

(declare-fun e!168047 () Bool)

(assert (=> d!62193 e!168047))

(declare-fun res!126746 () Bool)

(assert (=> d!62193 (=> res!126746 e!168047)))

(declare-fun lt!130533 () Bool)

(assert (=> d!62193 (= res!126746 (not lt!130533))))

(declare-fun lt!130535 () Bool)

(assert (=> d!62193 (= lt!130533 lt!130535)))

(declare-fun lt!130532 () Unit!8002)

(declare-fun e!168048 () Unit!8002)

(assert (=> d!62193 (= lt!130532 e!168048)))

(declare-fun c!44015 () Bool)

(assert (=> d!62193 (= c!44015 lt!130535)))

(assert (=> d!62193 (= lt!130535 (containsKey!304 (toList!1909 lt!130342) (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62193 (= (contains!1861 lt!130342 (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)) lt!130533)))

(declare-fun b!259311 () Bool)

(declare-fun lt!130534 () Unit!8002)

(assert (=> b!259311 (= e!168048 lt!130534)))

(assert (=> b!259311 (= lt!130534 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130342) (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259311 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259312 () Bool)

(declare-fun Unit!8022 () Unit!8002)

(assert (=> b!259312 (= e!168048 Unit!8022)))

(declare-fun b!259313 () Bool)

(assert (=> b!259313 (= e!168047 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130342) (select (arr!5944 (_keys!6946 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62193 c!44015) b!259311))

(assert (= (and d!62193 (not c!44015)) b!259312))

(assert (= (and d!62193 (not res!126746)) b!259313))

(assert (=> d!62193 m!273857))

(declare-fun m!274515 () Bool)

(assert (=> d!62193 m!274515))

(assert (=> b!259311 m!273857))

(declare-fun m!274517 () Bool)

(assert (=> b!259311 m!274517))

(assert (=> b!259311 m!273857))

(assert (=> b!259311 m!274063))

(assert (=> b!259311 m!274063))

(declare-fun m!274519 () Bool)

(assert (=> b!259311 m!274519))

(assert (=> b!259313 m!273857))

(assert (=> b!259313 m!274063))

(assert (=> b!259313 m!274063))

(assert (=> b!259313 m!274519))

(assert (=> b!258931 d!62193))

(declare-fun d!62195 () Bool)

(assert (=> d!62195 (= (apply!256 lt!130299 (select (arr!5944 lt!130102) #b00000000000000000000000000000000)) (get!3057 (getValueByKey!312 (toList!1909 lt!130299) (select (arr!5944 lt!130102) #b00000000000000000000000000000000))))))

(declare-fun bs!9121 () Bool)

(assert (= bs!9121 d!62195))

(assert (=> bs!9121 m!273845))

(assert (=> bs!9121 m!274357))

(assert (=> bs!9121 m!274357))

(declare-fun m!274521 () Bool)

(assert (=> bs!9121 m!274521))

(assert (=> b!258884 d!62195))

(declare-fun c!44016 () Bool)

(declare-fun d!62197 () Bool)

(assert (=> d!62197 (= c!44016 ((_ is ValueCellFull!2960) (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168049 () V!8457)

(assert (=> d!62197 (= (get!3056 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168049)))

(declare-fun b!259314 () Bool)

(assert (=> b!259314 (= e!168049 (get!3058 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259315 () Bool)

(assert (=> b!259315 (= e!168049 (get!3059 (select (arr!5943 (array!12556 (store (arr!5943 (_values!4756 thiss!1504)) index!297 (ValueCellFull!2960 v!346)) (size!6292 (_values!4756 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4773 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62197 c!44016) b!259314))

(assert (= (and d!62197 (not c!44016)) b!259315))

(assert (=> b!259314 m!273909))

(assert (=> b!259314 m!273911))

(declare-fun m!274523 () Bool)

(assert (=> b!259314 m!274523))

(assert (=> b!259315 m!273909))

(assert (=> b!259315 m!273911))

(declare-fun m!274525 () Bool)

(assert (=> b!259315 m!274525))

(assert (=> b!258884 d!62197))

(declare-fun d!62199 () Bool)

(declare-fun isEmpty!539 (Option!318) Bool)

(assert (=> d!62199 (= (isDefined!254 (getValueByKey!312 (toList!1909 lt!130111) key!932)) (not (isEmpty!539 (getValueByKey!312 (toList!1909 lt!130111) key!932))))))

(declare-fun bs!9122 () Bool)

(assert (= bs!9122 d!62199))

(assert (=> bs!9122 m!273977))

(declare-fun m!274527 () Bool)

(assert (=> bs!9122 m!274527))

(assert (=> b!258921 d!62199))

(declare-fun b!259318 () Bool)

(declare-fun e!168051 () Option!318)

(assert (=> b!259318 (= e!168051 (getValueByKey!312 (t!8839 (toList!1909 lt!130111)) key!932))))

(declare-fun b!259317 () Bool)

(declare-fun e!168050 () Option!318)

(assert (=> b!259317 (= e!168050 e!168051)))

(declare-fun c!44018 () Bool)

(assert (=> b!259317 (= c!44018 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (not (= (_1!2453 (h!4442 (toList!1909 lt!130111))) key!932))))))

(declare-fun d!62201 () Bool)

(declare-fun c!44017 () Bool)

(assert (=> d!62201 (= c!44017 (and ((_ is Cons!3779) (toList!1909 lt!130111)) (= (_1!2453 (h!4442 (toList!1909 lt!130111))) key!932)))))

(assert (=> d!62201 (= (getValueByKey!312 (toList!1909 lt!130111) key!932) e!168050)))

(declare-fun b!259316 () Bool)

(assert (=> b!259316 (= e!168050 (Some!317 (_2!2453 (h!4442 (toList!1909 lt!130111)))))))

(declare-fun b!259319 () Bool)

(assert (=> b!259319 (= e!168051 None!316)))

(assert (= (and d!62201 c!44017) b!259316))

(assert (= (and d!62201 (not c!44017)) b!259317))

(assert (= (and b!259317 c!44018) b!259318))

(assert (= (and b!259317 (not c!44018)) b!259319))

(declare-fun m!274529 () Bool)

(assert (=> b!259318 m!274529))

(assert (=> b!258921 d!62201))

(declare-fun b!259339 () Bool)

(declare-fun lt!130540 () SeekEntryResult!1172)

(assert (=> b!259339 (and (bvsge (index!6860 lt!130540) #b00000000000000000000000000000000) (bvslt (index!6860 lt!130540) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun res!126754 () Bool)

(assert (=> b!259339 (= res!126754 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6860 lt!130540)) key!932))))

(declare-fun e!168065 () Bool)

(assert (=> b!259339 (=> res!126754 e!168065)))

(declare-fun e!168062 () Bool)

(assert (=> b!259339 (= e!168062 e!168065)))

(declare-fun b!259340 () Bool)

(declare-fun e!168064 () SeekEntryResult!1172)

(declare-fun e!168063 () SeekEntryResult!1172)

(assert (=> b!259340 (= e!168064 e!168063)))

(declare-fun c!44025 () Bool)

(declare-fun lt!130541 () (_ BitVec 64))

(assert (=> b!259340 (= c!44025 (or (= lt!130541 key!932) (= (bvadd lt!130541 lt!130541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259341 () Bool)

(declare-fun e!168066 () Bool)

(assert (=> b!259341 (= e!168066 (bvsge (x!25065 lt!130540) #b01111111111111111111111111111110))))

(declare-fun b!259342 () Bool)

(assert (=> b!259342 (= e!168063 (Intermediate!1172 false (toIndex!0 key!932 (mask!11080 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!259343 () Bool)

(assert (=> b!259343 (and (bvsge (index!6860 lt!130540) #b00000000000000000000000000000000) (bvslt (index!6860 lt!130540) (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> b!259343 (= e!168065 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6860 lt!130540)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259344 () Bool)

(assert (=> b!259344 (= e!168064 (Intermediate!1172 true (toIndex!0 key!932 (mask!11080 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!62203 () Bool)

(assert (=> d!62203 e!168066))

(declare-fun c!44026 () Bool)

(assert (=> d!62203 (= c!44026 (and ((_ is Intermediate!1172) lt!130540) (undefined!1984 lt!130540)))))

(assert (=> d!62203 (= lt!130540 e!168064)))

(declare-fun c!44027 () Bool)

(assert (=> d!62203 (= c!44027 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!62203 (= lt!130541 (select (arr!5944 (_keys!6946 thiss!1504)) (toIndex!0 key!932 (mask!11080 thiss!1504))))))

(assert (=> d!62203 (validMask!0 (mask!11080 thiss!1504))))

(assert (=> d!62203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11080 thiss!1504)) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)) lt!130540)))

(declare-fun b!259338 () Bool)

(assert (=> b!259338 (= e!168066 e!168062)))

(declare-fun res!126755 () Bool)

(assert (=> b!259338 (= res!126755 (and ((_ is Intermediate!1172) lt!130540) (not (undefined!1984 lt!130540)) (bvslt (x!25065 lt!130540) #b01111111111111111111111111111110) (bvsge (x!25065 lt!130540) #b00000000000000000000000000000000) (bvsge (x!25065 lt!130540) #b00000000000000000000000000000000)))))

(assert (=> b!259338 (=> (not res!126755) (not e!168062))))

(declare-fun b!259345 () Bool)

(assert (=> b!259345 (and (bvsge (index!6860 lt!130540) #b00000000000000000000000000000000) (bvslt (index!6860 lt!130540) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun res!126753 () Bool)

(assert (=> b!259345 (= res!126753 (= (select (arr!5944 (_keys!6946 thiss!1504)) (index!6860 lt!130540)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259345 (=> res!126753 e!168065)))

(declare-fun b!259346 () Bool)

(assert (=> b!259346 (= e!168063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11080 thiss!1504)) #b00000000000000000000000000000000 (mask!11080 thiss!1504)) key!932 (_keys!6946 thiss!1504) (mask!11080 thiss!1504)))))

(assert (= (and d!62203 c!44027) b!259344))

(assert (= (and d!62203 (not c!44027)) b!259340))

(assert (= (and b!259340 c!44025) b!259342))

(assert (= (and b!259340 (not c!44025)) b!259346))

(assert (= (and d!62203 c!44026) b!259341))

(assert (= (and d!62203 (not c!44026)) b!259338))

(assert (= (and b!259338 res!126755) b!259339))

(assert (= (and b!259339 (not res!126754)) b!259345))

(assert (= (and b!259345 (not res!126753)) b!259343))

(declare-fun m!274531 () Bool)

(assert (=> b!259345 m!274531))

(assert (=> d!62203 m!274051))

(declare-fun m!274533 () Bool)

(assert (=> d!62203 m!274533))

(assert (=> d!62203 m!273661))

(assert (=> b!259346 m!274051))

(declare-fun m!274535 () Bool)

(assert (=> b!259346 m!274535))

(assert (=> b!259346 m!274535))

(declare-fun m!274537 () Bool)

(assert (=> b!259346 m!274537))

(assert (=> b!259343 m!274531))

(assert (=> b!259339 m!274531))

(assert (=> d!62039 d!62203))

(declare-fun d!62205 () Bool)

(declare-fun lt!130547 () (_ BitVec 32))

(declare-fun lt!130546 () (_ BitVec 32))

(assert (=> d!62205 (= lt!130547 (bvmul (bvxor lt!130546 (bvlshr lt!130546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62205 (= lt!130546 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62205 (and (bvsge (mask!11080 thiss!1504) #b00000000000000000000000000000000) (let ((res!126756 (let ((h!4446 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25084 (bvmul (bvxor h!4446 (bvlshr h!4446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25084 (bvlshr x!25084 #b00000000000000000000000000001101)) (mask!11080 thiss!1504)))))) (and (bvslt res!126756 (bvadd (mask!11080 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126756 #b00000000000000000000000000000000))))))

(assert (=> d!62205 (= (toIndex!0 key!932 (mask!11080 thiss!1504)) (bvand (bvxor lt!130547 (bvlshr lt!130547 #b00000000000000000000000000001101)) (mask!11080 thiss!1504)))))

(assert (=> d!62039 d!62205))

(assert (=> d!62039 d!61995))

(declare-fun d!62207 () Bool)

(declare-fun lt!130548 () (_ BitVec 32))

(assert (=> d!62207 (and (bvsge lt!130548 #b00000000000000000000000000000000) (bvsle lt!130548 (bvsub (size!6293 (_keys!6946 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168067 () (_ BitVec 32))

(assert (=> d!62207 (= lt!130548 e!168067)))

(declare-fun c!44029 () Bool)

(assert (=> d!62207 (= c!44029 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62207 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6293 (_keys!6946 thiss!1504)) (size!6293 (_keys!6946 thiss!1504))))))

(assert (=> d!62207 (= (arrayCountValidKeys!0 (_keys!6946 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))) lt!130548)))

(declare-fun b!259347 () Bool)

(declare-fun e!168068 () (_ BitVec 32))

(assert (=> b!259347 (= e!168067 e!168068)))

(declare-fun c!44028 () Bool)

(assert (=> b!259347 (= c!44028 (validKeyInArray!0 (select (arr!5944 (_keys!6946 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24684 () Bool)

(declare-fun call!24687 () (_ BitVec 32))

(assert (=> bm!24684 (= call!24687 (arrayCountValidKeys!0 (_keys!6946 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6293 (_keys!6946 thiss!1504))))))

(declare-fun b!259348 () Bool)

(assert (=> b!259348 (= e!168067 #b00000000000000000000000000000000)))

(declare-fun b!259349 () Bool)

(assert (=> b!259349 (= e!168068 (bvadd #b00000000000000000000000000000001 call!24687))))

(declare-fun b!259350 () Bool)

(assert (=> b!259350 (= e!168068 call!24687)))

(assert (= (and d!62207 c!44029) b!259348))

(assert (= (and d!62207 (not c!44029)) b!259347))

(assert (= (and b!259347 c!44028) b!259349))

(assert (= (and b!259347 (not c!44028)) b!259350))

(assert (= (or b!259349 b!259350) bm!24684))

(assert (=> b!259347 m!274235))

(assert (=> b!259347 m!274235))

(declare-fun m!274539 () Bool)

(assert (=> b!259347 m!274539))

(declare-fun m!274541 () Bool)

(assert (=> bm!24684 m!274541))

(assert (=> bm!24608 d!62207))

(declare-fun d!62209 () Bool)

(assert (=> d!62209 (contains!1861 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) lt!130290)))

(declare-fun lt!130549 () Unit!8002)

(assert (=> d!62209 (= lt!130549 (choose!1264 lt!130285 lt!130300 (zeroValue!4614 thiss!1504) lt!130290))))

(assert (=> d!62209 (contains!1861 lt!130285 lt!130290)))

(assert (=> d!62209 (= (addStillContains!232 lt!130285 lt!130300 (zeroValue!4614 thiss!1504) lt!130290) lt!130549)))

(declare-fun bs!9123 () Bool)

(assert (= bs!9123 d!62209))

(assert (=> bs!9123 m!273947))

(assert (=> bs!9123 m!273947))

(assert (=> bs!9123 m!273953))

(declare-fun m!274543 () Bool)

(assert (=> bs!9123 m!274543))

(declare-fun m!274545 () Bool)

(assert (=> bs!9123 m!274545))

(assert (=> b!258900 d!62209))

(declare-fun d!62211 () Bool)

(assert (=> d!62211 (= (apply!256 lt!130305 lt!130287) (get!3057 (getValueByKey!312 (toList!1909 lt!130305) lt!130287)))))

(declare-fun bs!9124 () Bool)

(assert (= bs!9124 d!62211))

(declare-fun m!274547 () Bool)

(assert (=> bs!9124 m!274547))

(assert (=> bs!9124 m!274547))

(declare-fun m!274549 () Bool)

(assert (=> bs!9124 m!274549))

(assert (=> b!258900 d!62211))

(declare-fun d!62213 () Bool)

(declare-fun e!168069 () Bool)

(assert (=> d!62213 e!168069))

(declare-fun res!126758 () Bool)

(assert (=> d!62213 (=> (not res!126758) (not e!168069))))

(declare-fun lt!130552 () ListLongMap!3787)

(assert (=> d!62213 (= res!126758 (contains!1861 lt!130552 (_1!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130551 () List!3783)

(assert (=> d!62213 (= lt!130552 (ListLongMap!3788 lt!130551))))

(declare-fun lt!130550 () Unit!8002)

(declare-fun lt!130553 () Unit!8002)

(assert (=> d!62213 (= lt!130550 lt!130553)))

(assert (=> d!62213 (= (getValueByKey!312 lt!130551 (_1!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62213 (= lt!130553 (lemmaContainsTupThenGetReturnValue!171 lt!130551 (_1!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62213 (= lt!130551 (insertStrictlySorted!174 (toList!1909 lt!130285) (_1!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62213 (= (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) lt!130552)))

(declare-fun b!259351 () Bool)

(declare-fun res!126757 () Bool)

(assert (=> b!259351 (=> (not res!126757) (not e!168069))))

(assert (=> b!259351 (= res!126757 (= (getValueByKey!312 (toList!1909 lt!130552) (_1!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259352 () Bool)

(assert (=> b!259352 (= e!168069 (contains!1863 (toList!1909 lt!130552) (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62213 res!126758) b!259351))

(assert (= (and b!259351 res!126757) b!259352))

(declare-fun m!274551 () Bool)

(assert (=> d!62213 m!274551))

(declare-fun m!274553 () Bool)

(assert (=> d!62213 m!274553))

(declare-fun m!274555 () Bool)

(assert (=> d!62213 m!274555))

(declare-fun m!274557 () Bool)

(assert (=> d!62213 m!274557))

(declare-fun m!274559 () Bool)

(assert (=> b!259351 m!274559))

(declare-fun m!274561 () Bool)

(assert (=> b!259352 m!274561))

(assert (=> b!258900 d!62213))

(declare-fun d!62215 () Bool)

(declare-fun e!168070 () Bool)

(assert (=> d!62215 e!168070))

(declare-fun res!126760 () Bool)

(assert (=> d!62215 (=> (not res!126760) (not e!168070))))

(declare-fun lt!130556 () ListLongMap!3787)

(assert (=> d!62215 (= res!126760 (contains!1861 lt!130556 (_1!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))))))

(declare-fun lt!130555 () List!3783)

(assert (=> d!62215 (= lt!130556 (ListLongMap!3788 lt!130555))))

(declare-fun lt!130554 () Unit!8002)

(declare-fun lt!130557 () Unit!8002)

(assert (=> d!62215 (= lt!130554 lt!130557)))

(assert (=> d!62215 (= (getValueByKey!312 lt!130555 (_1!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62215 (= lt!130557 (lemmaContainsTupThenGetReturnValue!171 lt!130555 (_1!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62215 (= lt!130555 (insertStrictlySorted!174 (toList!1909 lt!130305) (_1!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))))))

(assert (=> d!62215 (= (+!697 lt!130305 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) lt!130556)))

(declare-fun b!259353 () Bool)

(declare-fun res!126759 () Bool)

(assert (=> b!259353 (=> (not res!126759) (not e!168070))))

(assert (=> b!259353 (= res!126759 (= (getValueByKey!312 (toList!1909 lt!130556) (_1!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))))))))

(declare-fun b!259354 () Bool)

(assert (=> b!259354 (= e!168070 (contains!1863 (toList!1909 lt!130556) (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))))))

(assert (= (and d!62215 res!126760) b!259353))

(assert (= (and b!259353 res!126759) b!259354))

(declare-fun m!274563 () Bool)

(assert (=> d!62215 m!274563))

(declare-fun m!274565 () Bool)

(assert (=> d!62215 m!274565))

(declare-fun m!274567 () Bool)

(assert (=> d!62215 m!274567))

(declare-fun m!274569 () Bool)

(assert (=> d!62215 m!274569))

(declare-fun m!274571 () Bool)

(assert (=> b!259353 m!274571))

(declare-fun m!274573 () Bool)

(assert (=> b!259354 m!274573))

(assert (=> b!258900 d!62215))

(declare-fun d!62217 () Bool)

(assert (=> d!62217 (= (apply!256 lt!130288 lt!130303) (get!3057 (getValueByKey!312 (toList!1909 lt!130288) lt!130303)))))

(declare-fun bs!9125 () Bool)

(assert (= bs!9125 d!62217))

(declare-fun m!274575 () Bool)

(assert (=> bs!9125 m!274575))

(assert (=> bs!9125 m!274575))

(declare-fun m!274577 () Bool)

(assert (=> bs!9125 m!274577))

(assert (=> b!258900 d!62217))

(declare-fun d!62219 () Bool)

(declare-fun e!168071 () Bool)

(assert (=> d!62219 e!168071))

(declare-fun res!126762 () Bool)

(assert (=> d!62219 (=> (not res!126762) (not e!168071))))

(declare-fun lt!130560 () ListLongMap!3787)

(assert (=> d!62219 (= res!126762 (contains!1861 lt!130560 (_1!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130559 () List!3783)

(assert (=> d!62219 (= lt!130560 (ListLongMap!3788 lt!130559))))

(declare-fun lt!130558 () Unit!8002)

(declare-fun lt!130561 () Unit!8002)

(assert (=> d!62219 (= lt!130558 lt!130561)))

(assert (=> d!62219 (= (getValueByKey!312 lt!130559 (_1!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))))))

(assert (=> d!62219 (= lt!130561 (lemmaContainsTupThenGetReturnValue!171 lt!130559 (_1!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))))))

(assert (=> d!62219 (= lt!130559 (insertStrictlySorted!174 (toList!1909 lt!130292) (_1!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))))))

(assert (=> d!62219 (= (+!697 lt!130292 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) lt!130560)))

(declare-fun b!259355 () Bool)

(declare-fun res!126761 () Bool)

(assert (=> b!259355 (=> (not res!126761) (not e!168071))))

(assert (=> b!259355 (= res!126761 (= (getValueByKey!312 (toList!1909 lt!130560) (_1!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))))))))

(declare-fun b!259356 () Bool)

(assert (=> b!259356 (= e!168071 (contains!1863 (toList!1909 lt!130560) (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))))))

(assert (= (and d!62219 res!126762) b!259355))

(assert (= (and b!259355 res!126761) b!259356))

(declare-fun m!274579 () Bool)

(assert (=> d!62219 m!274579))

(declare-fun m!274581 () Bool)

(assert (=> d!62219 m!274581))

(declare-fun m!274583 () Bool)

(assert (=> d!62219 m!274583))

(declare-fun m!274585 () Bool)

(assert (=> d!62219 m!274585))

(declare-fun m!274587 () Bool)

(assert (=> b!259355 m!274587))

(declare-fun m!274589 () Bool)

(assert (=> b!259356 m!274589))

(assert (=> b!258900 d!62219))

(declare-fun d!62221 () Bool)

(declare-fun e!168072 () Bool)

(assert (=> d!62221 e!168072))

(declare-fun res!126764 () Bool)

(assert (=> d!62221 (=> (not res!126764) (not e!168072))))

(declare-fun lt!130564 () ListLongMap!3787)

(assert (=> d!62221 (= res!126764 (contains!1861 lt!130564 (_1!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))))))

(declare-fun lt!130563 () List!3783)

(assert (=> d!62221 (= lt!130564 (ListLongMap!3788 lt!130563))))

(declare-fun lt!130562 () Unit!8002)

(declare-fun lt!130565 () Unit!8002)

(assert (=> d!62221 (= lt!130562 lt!130565)))

(assert (=> d!62221 (= (getValueByKey!312 lt!130563 (_1!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))))))

(assert (=> d!62221 (= lt!130565 (lemmaContainsTupThenGetReturnValue!171 lt!130563 (_1!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))))))

(assert (=> d!62221 (= lt!130563 (insertStrictlySorted!174 (toList!1909 lt!130288) (_1!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) (_2!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))))))

(assert (=> d!62221 (= (+!697 lt!130288 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) lt!130564)))

(declare-fun b!259357 () Bool)

(declare-fun res!126763 () Bool)

(assert (=> b!259357 (=> (not res!126763) (not e!168072))))

(assert (=> b!259357 (= res!126763 (= (getValueByKey!312 (toList!1909 lt!130564) (_1!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))) (Some!317 (_2!2453 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))))))))

(declare-fun b!259358 () Bool)

(assert (=> b!259358 (= e!168072 (contains!1863 (toList!1909 lt!130564) (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))))))

(assert (= (and d!62221 res!126764) b!259357))

(assert (= (and b!259357 res!126763) b!259358))

(declare-fun m!274591 () Bool)

(assert (=> d!62221 m!274591))

(declare-fun m!274593 () Bool)

(assert (=> d!62221 m!274593))

(declare-fun m!274595 () Bool)

(assert (=> d!62221 m!274595))

(declare-fun m!274597 () Bool)

(assert (=> d!62221 m!274597))

(declare-fun m!274599 () Bool)

(assert (=> b!259357 m!274599))

(declare-fun m!274601 () Bool)

(assert (=> b!259358 m!274601))

(assert (=> b!258900 d!62221))

(declare-fun d!62223 () Bool)

(assert (=> d!62223 (= (apply!256 (+!697 lt!130292 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) lt!130293) (apply!256 lt!130292 lt!130293))))

(declare-fun lt!130566 () Unit!8002)

(assert (=> d!62223 (= lt!130566 (choose!1265 lt!130292 lt!130296 (minValue!4614 thiss!1504) lt!130293))))

(declare-fun e!168073 () Bool)

(assert (=> d!62223 e!168073))

(declare-fun res!126765 () Bool)

(assert (=> d!62223 (=> (not res!126765) (not e!168073))))

(assert (=> d!62223 (= res!126765 (contains!1861 lt!130292 lt!130293))))

(assert (=> d!62223 (= (addApplyDifferent!232 lt!130292 lt!130296 (minValue!4614 thiss!1504) lt!130293) lt!130566)))

(declare-fun b!259359 () Bool)

(assert (=> b!259359 (= e!168073 (not (= lt!130293 lt!130296)))))

(assert (= (and d!62223 res!126765) b!259359))

(declare-fun m!274603 () Bool)

(assert (=> d!62223 m!274603))

(assert (=> d!62223 m!273945))

(assert (=> d!62223 m!273927))

(assert (=> d!62223 m!273939))

(declare-fun m!274605 () Bool)

(assert (=> d!62223 m!274605))

(assert (=> d!62223 m!273927))

(assert (=> b!258900 d!62223))

(assert (=> b!258900 d!62187))

(declare-fun d!62225 () Bool)

(assert (=> d!62225 (= (apply!256 (+!697 lt!130305 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) lt!130287) (apply!256 lt!130305 lt!130287))))

(declare-fun lt!130567 () Unit!8002)

(assert (=> d!62225 (= lt!130567 (choose!1265 lt!130305 lt!130291 (zeroValue!4614 thiss!1504) lt!130287))))

(declare-fun e!168074 () Bool)

(assert (=> d!62225 e!168074))

(declare-fun res!126766 () Bool)

(assert (=> d!62225 (=> (not res!126766) (not e!168074))))

(assert (=> d!62225 (= res!126766 (contains!1861 lt!130305 lt!130287))))

(assert (=> d!62225 (= (addApplyDifferent!232 lt!130305 lt!130291 (zeroValue!4614 thiss!1504) lt!130287) lt!130567)))

(declare-fun b!259360 () Bool)

(assert (=> b!259360 (= e!168074 (not (= lt!130287 lt!130291)))))

(assert (= (and d!62225 res!126766) b!259360))

(declare-fun m!274607 () Bool)

(assert (=> d!62225 m!274607))

(assert (=> d!62225 m!273929))

(assert (=> d!62225 m!273949))

(assert (=> d!62225 m!273951))

(declare-fun m!274609 () Bool)

(assert (=> d!62225 m!274609))

(assert (=> d!62225 m!273949))

(assert (=> b!258900 d!62225))

(declare-fun d!62227 () Bool)

(assert (=> d!62227 (= (apply!256 (+!697 lt!130292 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504))) lt!130293) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130292 (tuple2!4885 lt!130296 (minValue!4614 thiss!1504)))) lt!130293)))))

(declare-fun bs!9126 () Bool)

(assert (= bs!9126 d!62227))

(declare-fun m!274611 () Bool)

(assert (=> bs!9126 m!274611))

(assert (=> bs!9126 m!274611))

(declare-fun m!274613 () Bool)

(assert (=> bs!9126 m!274613))

(assert (=> b!258900 d!62227))

(declare-fun d!62229 () Bool)

(declare-fun e!168075 () Bool)

(assert (=> d!62229 e!168075))

(declare-fun res!126767 () Bool)

(assert (=> d!62229 (=> res!126767 e!168075)))

(declare-fun lt!130569 () Bool)

(assert (=> d!62229 (= res!126767 (not lt!130569))))

(declare-fun lt!130571 () Bool)

(assert (=> d!62229 (= lt!130569 lt!130571)))

(declare-fun lt!130568 () Unit!8002)

(declare-fun e!168076 () Unit!8002)

(assert (=> d!62229 (= lt!130568 e!168076)))

(declare-fun c!44030 () Bool)

(assert (=> d!62229 (= c!44030 lt!130571)))

(assert (=> d!62229 (= lt!130571 (containsKey!304 (toList!1909 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) lt!130290))))

(assert (=> d!62229 (= (contains!1861 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504))) lt!130290) lt!130569)))

(declare-fun b!259361 () Bool)

(declare-fun lt!130570 () Unit!8002)

(assert (=> b!259361 (= e!168076 lt!130570)))

(assert (=> b!259361 (= lt!130570 (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) lt!130290))))

(assert (=> b!259361 (isDefined!254 (getValueByKey!312 (toList!1909 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) lt!130290))))

(declare-fun b!259362 () Bool)

(declare-fun Unit!8023 () Unit!8002)

(assert (=> b!259362 (= e!168076 Unit!8023)))

(declare-fun b!259363 () Bool)

(assert (=> b!259363 (= e!168075 (isDefined!254 (getValueByKey!312 (toList!1909 (+!697 lt!130285 (tuple2!4885 lt!130300 (zeroValue!4614 thiss!1504)))) lt!130290)))))

(assert (= (and d!62229 c!44030) b!259361))

(assert (= (and d!62229 (not c!44030)) b!259362))

(assert (= (and d!62229 (not res!126767)) b!259363))

(declare-fun m!274615 () Bool)

(assert (=> d!62229 m!274615))

(declare-fun m!274617 () Bool)

(assert (=> b!259361 m!274617))

(declare-fun m!274619 () Bool)

(assert (=> b!259361 m!274619))

(assert (=> b!259361 m!274619))

(declare-fun m!274621 () Bool)

(assert (=> b!259361 m!274621))

(assert (=> b!259363 m!274619))

(assert (=> b!259363 m!274619))

(assert (=> b!259363 m!274621))

(assert (=> b!258900 d!62229))

(declare-fun d!62231 () Bool)

(assert (=> d!62231 (= (apply!256 (+!697 lt!130288 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) lt!130303) (apply!256 lt!130288 lt!130303))))

(declare-fun lt!130572 () Unit!8002)

(assert (=> d!62231 (= lt!130572 (choose!1265 lt!130288 lt!130294 (minValue!4614 thiss!1504) lt!130303))))

(declare-fun e!168077 () Bool)

(assert (=> d!62231 e!168077))

(declare-fun res!126768 () Bool)

(assert (=> d!62231 (=> (not res!126768) (not e!168077))))

(assert (=> d!62231 (= res!126768 (contains!1861 lt!130288 lt!130303))))

(assert (=> d!62231 (= (addApplyDifferent!232 lt!130288 lt!130294 (minValue!4614 thiss!1504) lt!130303) lt!130572)))

(declare-fun b!259364 () Bool)

(assert (=> b!259364 (= e!168077 (not (= lt!130303 lt!130294)))))

(assert (= (and d!62231 res!126768) b!259364))

(declare-fun m!274623 () Bool)

(assert (=> d!62231 m!274623))

(assert (=> d!62231 m!273925))

(assert (=> d!62231 m!273931))

(assert (=> d!62231 m!273935))

(declare-fun m!274625 () Bool)

(assert (=> d!62231 m!274625))

(assert (=> d!62231 m!273931))

(assert (=> b!258900 d!62231))

(declare-fun d!62233 () Bool)

(assert (=> d!62233 (= (apply!256 (+!697 lt!130288 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504))) lt!130303) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130288 (tuple2!4885 lt!130294 (minValue!4614 thiss!1504)))) lt!130303)))))

(declare-fun bs!9127 () Bool)

(assert (= bs!9127 d!62233))

(declare-fun m!274627 () Bool)

(assert (=> bs!9127 m!274627))

(assert (=> bs!9127 m!274627))

(declare-fun m!274629 () Bool)

(assert (=> bs!9127 m!274629))

(assert (=> b!258900 d!62233))

(declare-fun d!62235 () Bool)

(assert (=> d!62235 (= (apply!256 lt!130292 lt!130293) (get!3057 (getValueByKey!312 (toList!1909 lt!130292) lt!130293)))))

(declare-fun bs!9128 () Bool)

(assert (= bs!9128 d!62235))

(declare-fun m!274631 () Bool)

(assert (=> bs!9128 m!274631))

(assert (=> bs!9128 m!274631))

(declare-fun m!274633 () Bool)

(assert (=> bs!9128 m!274633))

(assert (=> b!258900 d!62235))

(declare-fun d!62237 () Bool)

(assert (=> d!62237 (= (apply!256 (+!697 lt!130305 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504))) lt!130287) (get!3057 (getValueByKey!312 (toList!1909 (+!697 lt!130305 (tuple2!4885 lt!130291 (zeroValue!4614 thiss!1504)))) lt!130287)))))

(declare-fun bs!9129 () Bool)

(assert (= bs!9129 d!62237))

(declare-fun m!274635 () Bool)

(assert (=> bs!9129 m!274635))

(assert (=> bs!9129 m!274635))

(declare-fun m!274637 () Bool)

(assert (=> bs!9129 m!274637))

(assert (=> b!258900 d!62237))

(declare-fun d!62239 () Bool)

(assert (=> d!62239 (isDefined!254 (getValueByKey!312 (toList!1909 lt!130111) key!932))))

(declare-fun lt!130575 () Unit!8002)

(declare-fun choose!1266 (List!3783 (_ BitVec 64)) Unit!8002)

(assert (=> d!62239 (= lt!130575 (choose!1266 (toList!1909 lt!130111) key!932))))

(declare-fun e!168080 () Bool)

(assert (=> d!62239 e!168080))

(declare-fun res!126771 () Bool)

(assert (=> d!62239 (=> (not res!126771) (not e!168080))))

(assert (=> d!62239 (= res!126771 (isStrictlySorted!369 (toList!1909 lt!130111)))))

(assert (=> d!62239 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!253 (toList!1909 lt!130111) key!932) lt!130575)))

(declare-fun b!259367 () Bool)

(assert (=> b!259367 (= e!168080 (containsKey!304 (toList!1909 lt!130111) key!932))))

(assert (= (and d!62239 res!126771) b!259367))

(assert (=> d!62239 m!273977))

(assert (=> d!62239 m!273977))

(assert (=> d!62239 m!273979))

(declare-fun m!274639 () Bool)

(assert (=> d!62239 m!274639))

(assert (=> d!62239 m!274109))

(assert (=> b!259367 m!273973))

(assert (=> b!258919 d!62239))

(assert (=> b!258919 d!62199))

(assert (=> b!258919 d!62201))

(declare-fun b!259368 () Bool)

(declare-fun e!168082 () Bool)

(assert (=> b!259368 (= e!168082 tp_is_empty!6607)))

(declare-fun b!259369 () Bool)

(declare-fun e!168081 () Bool)

(assert (=> b!259369 (= e!168081 tp_is_empty!6607)))

(declare-fun mapIsEmpty!11264 () Bool)

(declare-fun mapRes!11264 () Bool)

(assert (=> mapIsEmpty!11264 mapRes!11264))

(declare-fun condMapEmpty!11264 () Bool)

(declare-fun mapDefault!11264 () ValueCell!2960)

(assert (=> mapNonEmpty!11263 (= condMapEmpty!11264 (= mapRest!11263 ((as const (Array (_ BitVec 32) ValueCell!2960)) mapDefault!11264)))))

(assert (=> mapNonEmpty!11263 (= tp!23566 (and e!168081 mapRes!11264))))

(declare-fun mapNonEmpty!11264 () Bool)

(declare-fun tp!23567 () Bool)

(assert (=> mapNonEmpty!11264 (= mapRes!11264 (and tp!23567 e!168082))))

(declare-fun mapValue!11264 () ValueCell!2960)

(declare-fun mapKey!11264 () (_ BitVec 32))

(declare-fun mapRest!11264 () (Array (_ BitVec 32) ValueCell!2960))

(assert (=> mapNonEmpty!11264 (= mapRest!11263 (store mapRest!11264 mapKey!11264 mapValue!11264))))

(assert (= (and mapNonEmpty!11263 condMapEmpty!11264) mapIsEmpty!11264))

(assert (= (and mapNonEmpty!11263 (not condMapEmpty!11264)) mapNonEmpty!11264))

(assert (= (and mapNonEmpty!11264 ((_ is ValueCellFull!2960) mapValue!11264)) b!259368))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2960) mapDefault!11264)) b!259369))

(declare-fun m!274641 () Bool)

(assert (=> mapNonEmpty!11264 m!274641))

(declare-fun b_lambda!8223 () Bool)

(assert (= b_lambda!8219 (or (and b!258608 b_free!6745) b_lambda!8223)))

(declare-fun b_lambda!8225 () Bool)

(assert (= b_lambda!8217 (or (and b!258608 b_free!6745) b_lambda!8225)))

(declare-fun b_lambda!8227 () Bool)

(assert (= b_lambda!8215 (or (and b!258608 b_free!6745) b_lambda!8227)))

(declare-fun b_lambda!8229 () Bool)

(assert (= b_lambda!8213 (or (and b!258608 b_free!6745) b_lambda!8229)))

(declare-fun b_lambda!8231 () Bool)

(assert (= b_lambda!8221 (or (and b!258608 b_free!6745) b_lambda!8231)))

(check-sat (not b!259355) (not bm!24684) (not b!259367) (not d!62155) (not d!62139) (not b!259055) (not d!62069) (not b!259010) (not b!259352) (not b!259074) (not b!259104) (not bm!24664) (not b!259347) (not bm!24682) (not d!62231) (not b!259361) (not b!259244) (not d!62073) (not mapNonEmpty!11264) (not d!62065) (not d!62089) (not b!259153) (not b!259102) (not b!259007) (not d!62193) (not bm!24678) (not b!259162) (not b!259232) (not b!259068) (not b!259111) (not d!62233) (not d!62209) (not b_next!6745) (not bm!24673) (not b!259353) (not d!62237) (not d!62175) (not b!259066) (not b!259075) (not b_lambda!8223) (not b!259188) (not d!62129) (not bm!24667) (not b!259356) (not b!259008) (not b!259023) (not d!62081) (not b!259105) (not b!259070) (not d!62143) (not b!259198) (not b!259159) (not b!259235) (not b!259148) (not b!259274) (not b!259351) (not b!259292) (not b!259358) (not b!259173) (not bm!24661) (not b!259315) (not b_lambda!8211) (not b!259130) (not b!259132) (not d!62097) (not b!259284) (not d!62103) (not b!259121) (not b!259127) (not b!259291) (not b!259161) b_and!13825 (not d!62067) (not b!259357) (not b!259139) (not b!259289) (not b!259203) (not d!62121) (not d!62047) (not b!259281) (not b!259186) (not b!259006) (not bm!24663) (not b!259280) (not d!62159) (not b!259189) (not d!62055) (not d!62189) (not bm!24659) (not b!259273) (not d!62077) (not bm!24662) (not bm!24674) (not b!259184) (not b!259157) tp_is_empty!6607 (not bm!24668) (not b!259142) (not d!62101) (not b!259318) (not b!259156) (not b_lambda!8229) (not d!62227) (not d!62165) (not b!259187) (not bm!24675) (not b!259071) (not b!259298) (not b!259051) (not b!259313) (not b!259072) (not b!259012) (not b!259182) (not b!259112) (not b!259304) (not d!62061) (not d!62219) (not d!62043) (not bm!24683) (not b!259303) (not d!62151) (not b!259128) (not d!62113) (not b!259314) (not d!62211) (not d!62053) (not b!259183) (not d!62133) (not d!62187) (not d!62229) (not d!62063) (not d!62191) (not d!62085) (not bm!24681) (not d!62123) (not d!62213) (not bm!24660) (not d!62149) (not d!62137) (not b!259307) (not d!62145) (not d!62235) (not d!62173) (not bm!24666) (not b!259311) (not b!259300) (not b!259181) (not bm!24679) (not d!62091) (not b!259060) (not d!62127) (not b!259297) (not b!259100) (not b!259175) (not b!259155) (not b!259363) (not d!62215) (not d!62225) (not d!62147) (not b!259346) (not b_lambda!8225) (not b!259277) (not d!62183) (not d!62203) (not b!259275) (not b!259073) (not b!259134) (not b_lambda!8209) (not b!259101) (not d!62071) (not b!259215) (not b_lambda!8227) (not b!259151) (not d!62239) (not b!259354) (not b!259202) (not b!259107) (not b!259029) (not b_lambda!8231) (not b!259301) (not b!259135) (not b!259108) (not d!62079) (not b!259126) (not b!259114) (not d!62075) (not b!259296) (not b!259178) (not b!259195) (not d!62049) (not b!259177) (not b!259238) (not b!259310) (not d!62167) (not b!259269) (not b!259172) (not d!62083) (not b!259191) (not b!259030) (not b!259205) (not d!62221) (not b!259009) (not b!259067) (not d!62199) (not d!62217) (not b!259193) (not bm!24665) (not d!62135) (not b!259308) (not d!62117) (not d!62179) (not d!62181) (not b!259207) (not bm!24656) (not d!62195) (not d!62223) (not d!62099) (not d!62087))
(check-sat b_and!13825 (not b_next!6745))
