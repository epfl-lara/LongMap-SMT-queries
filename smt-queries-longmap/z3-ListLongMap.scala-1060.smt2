; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22044 () Bool)

(assert start!22044)

(declare-fun b!227761 () Bool)

(declare-fun b_free!6111 () Bool)

(declare-fun b_next!6111 () Bool)

(assert (=> b!227761 (= b_free!6111 (not b_next!6111))))

(declare-fun tp!21474 () Bool)

(declare-fun b_and!13009 () Bool)

(assert (=> b!227761 (= tp!21474 b_and!13009)))

(declare-fun b!227745 () Bool)

(declare-fun res!112116 () Bool)

(declare-fun e!147750 () Bool)

(assert (=> b!227745 (=> (not res!112116) (not e!147750))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!227745 (= res!112116 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227746 () Bool)

(declare-datatypes ((Unit!6907 0))(
  ( (Unit!6908) )
))
(declare-fun e!147763 () Unit!6907)

(declare-fun Unit!6909 () Unit!6907)

(assert (=> b!227746 (= e!147763 Unit!6909)))

(declare-fun lt!114598 () Unit!6907)

(declare-datatypes ((V!7611 0))(
  ( (V!7612 (val!3031 Int)) )
))
(declare-datatypes ((ValueCell!2643 0))(
  ( (ValueCellFull!2643 (v!5051 V!7611)) (EmptyCell!2643) )
))
(declare-datatypes ((array!11189 0))(
  ( (array!11190 (arr!5314 (Array (_ BitVec 32) ValueCell!2643)) (size!5647 (_ BitVec 32))) )
))
(declare-datatypes ((array!11191 0))(
  ( (array!11192 (arr!5315 (Array (_ BitVec 32) (_ BitVec 64))) (size!5648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3186 0))(
  ( (LongMapFixedSize!3187 (defaultEntry!4252 Int) (mask!10116 (_ BitVec 32)) (extraKeys!3989 (_ BitVec 32)) (zeroValue!4093 V!7611) (minValue!4093 V!7611) (_size!1642 (_ BitVec 32)) (_keys!6306 array!11191) (_values!4235 array!11189) (_vacant!1642 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3186)

(declare-fun lemmaArrayContainsKeyThenInListMap!104 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7611 V!7611 (_ BitVec 64) (_ BitVec 32) Int) Unit!6907)

(assert (=> b!227746 (= lt!114598 (lemmaArrayContainsKeyThenInListMap!104 (_keys!6306 thiss!1504) (_values!4235 thiss!1504) (mask!10116 thiss!1504) (extraKeys!3989 thiss!1504) (zeroValue!4093 thiss!1504) (minValue!4093 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4252 thiss!1504)))))

(assert (=> b!227746 false))

(declare-fun b!227747 () Bool)

(declare-fun res!112108 () Bool)

(declare-fun e!147764 () Bool)

(assert (=> b!227747 (=> (not res!112108) (not e!147764))))

(declare-fun call!21168 () Bool)

(assert (=> b!227747 (= res!112108 call!21168)))

(declare-fun e!147757 () Bool)

(assert (=> b!227747 (= e!147757 e!147764)))

(declare-fun b!227748 () Bool)

(declare-fun e!147753 () Bool)

(declare-fun call!21167 () Bool)

(assert (=> b!227748 (= e!147753 (not call!21167))))

(declare-fun b!227749 () Bool)

(declare-fun e!147761 () Unit!6907)

(declare-fun Unit!6910 () Unit!6907)

(assert (=> b!227749 (= e!147761 Unit!6910)))

(declare-fun lt!114597 () Unit!6907)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7611 V!7611 (_ BitVec 64) Int) Unit!6907)

(assert (=> b!227749 (= lt!114597 (lemmaInListMapThenSeekEntryOrOpenFindsIt!266 (_keys!6306 thiss!1504) (_values!4235 thiss!1504) (mask!10116 thiss!1504) (extraKeys!3989 thiss!1504) (zeroValue!4093 thiss!1504) (minValue!4093 thiss!1504) key!932 (defaultEntry!4252 thiss!1504)))))

(assert (=> b!227749 false))

(declare-fun b!227750 () Bool)

(declare-fun e!147758 () Bool)

(assert (=> b!227750 (= e!147758 e!147753)))

(declare-fun res!112110 () Bool)

(assert (=> b!227750 (= res!112110 call!21168)))

(assert (=> b!227750 (=> (not res!112110) (not e!147753))))

(declare-fun b!227751 () Bool)

(declare-fun res!112113 () Bool)

(assert (=> b!227751 (=> (not res!112113) (not e!147764))))

(declare-datatypes ((SeekEntryResult!898 0))(
  ( (MissingZero!898 (index!5762 (_ BitVec 32))) (Found!898 (index!5763 (_ BitVec 32))) (Intermediate!898 (undefined!1710 Bool) (index!5764 (_ BitVec 32)) (x!23294 (_ BitVec 32))) (Undefined!898) (MissingVacant!898 (index!5765 (_ BitVec 32))) )
))
(declare-fun lt!114604 () SeekEntryResult!898)

(assert (=> b!227751 (= res!112113 (= (select (arr!5315 (_keys!6306 thiss!1504)) (index!5762 lt!114604)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21164 () Bool)

(declare-fun arrayContainsKey!0 (array!11191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21164 (= call!21167 (arrayContainsKey!0 (_keys!6306 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun c!37762 () Bool)

(declare-fun bm!21165 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21165 (= call!21168 (inRange!0 (ite c!37762 (index!5762 lt!114604) (index!5765 lt!114604)) (mask!10116 thiss!1504)))))

(declare-fun b!227752 () Bool)

(declare-fun e!147751 () Bool)

(declare-fun tp_is_empty!5973 () Bool)

(assert (=> b!227752 (= e!147751 tp_is_empty!5973)))

(declare-fun b!227753 () Bool)

(get-info :version)

(assert (=> b!227753 (= e!147758 ((_ is Undefined!898) lt!114604))))

(declare-fun mapIsEmpty!10129 () Bool)

(declare-fun mapRes!10129 () Bool)

(assert (=> mapIsEmpty!10129 mapRes!10129))

(declare-fun b!227754 () Bool)

(assert (=> b!227754 (= e!147764 (not call!21167))))

(declare-fun b!227755 () Bool)

(declare-fun Unit!6911 () Unit!6907)

(assert (=> b!227755 (= e!147763 Unit!6911)))

(declare-fun res!112109 () Bool)

(assert (=> start!22044 (=> (not res!112109) (not e!147750))))

(declare-fun valid!1277 (LongMapFixedSize!3186) Bool)

(assert (=> start!22044 (= res!112109 (valid!1277 thiss!1504))))

(assert (=> start!22044 e!147750))

(declare-fun e!147759 () Bool)

(assert (=> start!22044 e!147759))

(assert (=> start!22044 true))

(declare-fun b!227756 () Bool)

(declare-fun e!147762 () Bool)

(declare-fun e!147755 () Bool)

(assert (=> b!227756 (= e!147762 e!147755)))

(declare-fun res!112112 () Bool)

(assert (=> b!227756 (=> (not res!112112) (not e!147755))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227756 (= res!112112 (inRange!0 index!297 (mask!10116 thiss!1504)))))

(declare-fun lt!114602 () Unit!6907)

(assert (=> b!227756 (= lt!114602 e!147761)))

(declare-fun c!37764 () Bool)

(declare-datatypes ((tuple2!4476 0))(
  ( (tuple2!4477 (_1!2249 (_ BitVec 64)) (_2!2249 V!7611)) )
))
(declare-datatypes ((List!3396 0))(
  ( (Nil!3393) (Cons!3392 (h!4040 tuple2!4476) (t!8355 List!3396)) )
))
(declare-datatypes ((ListLongMap!3389 0))(
  ( (ListLongMap!3390 (toList!1710 List!3396)) )
))
(declare-fun contains!1584 (ListLongMap!3389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1238 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7611 V!7611 (_ BitVec 32) Int) ListLongMap!3389)

(assert (=> b!227756 (= c!37764 (contains!1584 (getCurrentListMap!1238 (_keys!6306 thiss!1504) (_values!4235 thiss!1504) (mask!10116 thiss!1504) (extraKeys!3989 thiss!1504) (zeroValue!4093 thiss!1504) (minValue!4093 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4252 thiss!1504)) key!932))))

(declare-fun b!227757 () Bool)

(declare-fun e!147752 () Bool)

(assert (=> b!227757 (= e!147752 tp_is_empty!5973)))

(declare-fun b!227758 () Bool)

(declare-fun e!147754 () Bool)

(assert (=> b!227758 (= e!147754 true)))

(declare-fun lt!114595 () Bool)

(declare-datatypes ((List!3397 0))(
  ( (Nil!3394) (Cons!3393 (h!4041 (_ BitVec 64)) (t!8356 List!3397)) )
))
(declare-fun arrayNoDuplicates!0 (array!11191 (_ BitVec 32) List!3397) Bool)

(assert (=> b!227758 (= lt!114595 (arrayNoDuplicates!0 (_keys!6306 thiss!1504) #b00000000000000000000000000000000 Nil!3394))))

(declare-fun b!227759 () Bool)

(assert (=> b!227759 (= e!147755 (not e!147754))))

(declare-fun res!112107 () Bool)

(assert (=> b!227759 (=> res!112107 e!147754)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227759 (= res!112107 (not (validMask!0 (mask!10116 thiss!1504))))))

(declare-fun lt!114600 () array!11191)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11191 (_ BitVec 32)) Bool)

(assert (=> b!227759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114600 (mask!10116 thiss!1504))))

(declare-fun lt!114596 () Unit!6907)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11191 (_ BitVec 32) (_ BitVec 32)) Unit!6907)

(assert (=> b!227759 (= lt!114596 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6306 thiss!1504) index!297 (mask!10116 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227759 (= (arrayCountValidKeys!0 lt!114600 #b00000000000000000000000000000000 (size!5648 (_keys!6306 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6306 thiss!1504) #b00000000000000000000000000000000 (size!5648 (_keys!6306 thiss!1504)))))))

(declare-fun lt!114603 () Unit!6907)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11191 (_ BitVec 32) (_ BitVec 64)) Unit!6907)

(assert (=> b!227759 (= lt!114603 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6306 thiss!1504) index!297 key!932))))

(assert (=> b!227759 (arrayNoDuplicates!0 lt!114600 #b00000000000000000000000000000000 Nil!3394)))

(assert (=> b!227759 (= lt!114600 (array!11192 (store (arr!5315 (_keys!6306 thiss!1504)) index!297 key!932) (size!5648 (_keys!6306 thiss!1504))))))

(declare-fun lt!114601 () Unit!6907)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3397) Unit!6907)

(assert (=> b!227759 (= lt!114601 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6306 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3394))))

(declare-fun lt!114599 () Unit!6907)

(assert (=> b!227759 (= lt!114599 e!147763)))

(declare-fun c!37763 () Bool)

(assert (=> b!227759 (= c!37763 (arrayContainsKey!0 (_keys!6306 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227760 () Bool)

(assert (=> b!227760 (= e!147750 e!147762)))

(declare-fun res!112117 () Bool)

(assert (=> b!227760 (=> (not res!112117) (not e!147762))))

(assert (=> b!227760 (= res!112117 (or (= lt!114604 (MissingZero!898 index!297)) (= lt!114604 (MissingVacant!898 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11191 (_ BitVec 32)) SeekEntryResult!898)

(assert (=> b!227760 (= lt!114604 (seekEntryOrOpen!0 key!932 (_keys!6306 thiss!1504) (mask!10116 thiss!1504)))))

(declare-fun mapNonEmpty!10129 () Bool)

(declare-fun tp!21475 () Bool)

(assert (=> mapNonEmpty!10129 (= mapRes!10129 (and tp!21475 e!147752))))

(declare-fun mapRest!10129 () (Array (_ BitVec 32) ValueCell!2643))

(declare-fun mapKey!10129 () (_ BitVec 32))

(declare-fun mapValue!10129 () ValueCell!2643)

(assert (=> mapNonEmpty!10129 (= (arr!5314 (_values!4235 thiss!1504)) (store mapRest!10129 mapKey!10129 mapValue!10129))))

(declare-fun e!147756 () Bool)

(declare-fun array_inv!3513 (array!11191) Bool)

(declare-fun array_inv!3514 (array!11189) Bool)

(assert (=> b!227761 (= e!147759 (and tp!21474 tp_is_empty!5973 (array_inv!3513 (_keys!6306 thiss!1504)) (array_inv!3514 (_values!4235 thiss!1504)) e!147756))))

(declare-fun b!227762 () Bool)

(declare-fun res!112114 () Bool)

(assert (=> b!227762 (= res!112114 (= (select (arr!5315 (_keys!6306 thiss!1504)) (index!5765 lt!114604)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227762 (=> (not res!112114) (not e!147753))))

(declare-fun b!227763 () Bool)

(declare-fun res!112111 () Bool)

(assert (=> b!227763 (=> res!112111 e!147754)))

(assert (=> b!227763 (= res!112111 (or (not (= (size!5647 (_values!4235 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10116 thiss!1504)))) (not (= (size!5648 (_keys!6306 thiss!1504)) (size!5647 (_values!4235 thiss!1504)))) (bvslt (mask!10116 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3989 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3989 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227764 () Bool)

(declare-fun lt!114605 () Unit!6907)

(assert (=> b!227764 (= e!147761 lt!114605)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!281 (array!11191 array!11189 (_ BitVec 32) (_ BitVec 32) V!7611 V!7611 (_ BitVec 64) Int) Unit!6907)

(assert (=> b!227764 (= lt!114605 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!281 (_keys!6306 thiss!1504) (_values!4235 thiss!1504) (mask!10116 thiss!1504) (extraKeys!3989 thiss!1504) (zeroValue!4093 thiss!1504) (minValue!4093 thiss!1504) key!932 (defaultEntry!4252 thiss!1504)))))

(assert (=> b!227764 (= c!37762 ((_ is MissingZero!898) lt!114604))))

(assert (=> b!227764 e!147757))

(declare-fun b!227765 () Bool)

(declare-fun c!37761 () Bool)

(assert (=> b!227765 (= c!37761 ((_ is MissingVacant!898) lt!114604))))

(assert (=> b!227765 (= e!147757 e!147758)))

(declare-fun b!227766 () Bool)

(assert (=> b!227766 (= e!147756 (and e!147751 mapRes!10129))))

(declare-fun condMapEmpty!10129 () Bool)

(declare-fun mapDefault!10129 () ValueCell!2643)

(assert (=> b!227766 (= condMapEmpty!10129 (= (arr!5314 (_values!4235 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2643)) mapDefault!10129)))))

(declare-fun b!227767 () Bool)

(declare-fun res!112115 () Bool)

(assert (=> b!227767 (=> res!112115 e!147754)))

(assert (=> b!227767 (= res!112115 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6306 thiss!1504) (mask!10116 thiss!1504))))))

(assert (= (and start!22044 res!112109) b!227745))

(assert (= (and b!227745 res!112116) b!227760))

(assert (= (and b!227760 res!112117) b!227756))

(assert (= (and b!227756 c!37764) b!227749))

(assert (= (and b!227756 (not c!37764)) b!227764))

(assert (= (and b!227764 c!37762) b!227747))

(assert (= (and b!227764 (not c!37762)) b!227765))

(assert (= (and b!227747 res!112108) b!227751))

(assert (= (and b!227751 res!112113) b!227754))

(assert (= (and b!227765 c!37761) b!227750))

(assert (= (and b!227765 (not c!37761)) b!227753))

(assert (= (and b!227750 res!112110) b!227762))

(assert (= (and b!227762 res!112114) b!227748))

(assert (= (or b!227747 b!227750) bm!21165))

(assert (= (or b!227754 b!227748) bm!21164))

(assert (= (and b!227756 res!112112) b!227759))

(assert (= (and b!227759 c!37763) b!227746))

(assert (= (and b!227759 (not c!37763)) b!227755))

(assert (= (and b!227759 (not res!112107)) b!227763))

(assert (= (and b!227763 (not res!112111)) b!227767))

(assert (= (and b!227767 (not res!112115)) b!227758))

(assert (= (and b!227766 condMapEmpty!10129) mapIsEmpty!10129))

(assert (= (and b!227766 (not condMapEmpty!10129)) mapNonEmpty!10129))

(assert (= (and mapNonEmpty!10129 ((_ is ValueCellFull!2643) mapValue!10129)) b!227757))

(assert (= (and b!227766 ((_ is ValueCellFull!2643) mapDefault!10129)) b!227752))

(assert (= b!227761 b!227766))

(assert (= start!22044 b!227761))

(declare-fun m!249675 () Bool)

(assert (=> b!227761 m!249675))

(declare-fun m!249677 () Bool)

(assert (=> b!227761 m!249677))

(declare-fun m!249679 () Bool)

(assert (=> b!227767 m!249679))

(declare-fun m!249681 () Bool)

(assert (=> b!227762 m!249681))

(declare-fun m!249683 () Bool)

(assert (=> b!227759 m!249683))

(declare-fun m!249685 () Bool)

(assert (=> b!227759 m!249685))

(declare-fun m!249687 () Bool)

(assert (=> b!227759 m!249687))

(declare-fun m!249689 () Bool)

(assert (=> b!227759 m!249689))

(declare-fun m!249691 () Bool)

(assert (=> b!227759 m!249691))

(declare-fun m!249693 () Bool)

(assert (=> b!227759 m!249693))

(declare-fun m!249695 () Bool)

(assert (=> b!227759 m!249695))

(declare-fun m!249697 () Bool)

(assert (=> b!227759 m!249697))

(declare-fun m!249699 () Bool)

(assert (=> b!227759 m!249699))

(declare-fun m!249701 () Bool)

(assert (=> b!227759 m!249701))

(declare-fun m!249703 () Bool)

(assert (=> b!227764 m!249703))

(declare-fun m!249705 () Bool)

(assert (=> b!227746 m!249705))

(declare-fun m!249707 () Bool)

(assert (=> b!227751 m!249707))

(declare-fun m!249709 () Bool)

(assert (=> start!22044 m!249709))

(assert (=> bm!21164 m!249701))

(declare-fun m!249711 () Bool)

(assert (=> b!227756 m!249711))

(declare-fun m!249713 () Bool)

(assert (=> b!227756 m!249713))

(assert (=> b!227756 m!249713))

(declare-fun m!249715 () Bool)

(assert (=> b!227756 m!249715))

(declare-fun m!249717 () Bool)

(assert (=> b!227760 m!249717))

(declare-fun m!249719 () Bool)

(assert (=> mapNonEmpty!10129 m!249719))

(declare-fun m!249721 () Bool)

(assert (=> bm!21165 m!249721))

(declare-fun m!249723 () Bool)

(assert (=> b!227758 m!249723))

(declare-fun m!249725 () Bool)

(assert (=> b!227749 m!249725))

(check-sat (not start!22044) (not b!227767) (not b!227746) (not b_next!6111) (not b!227761) (not b!227760) (not b!227764) b_and!13009 (not b!227749) (not bm!21164) (not b!227759) (not mapNonEmpty!10129) (not bm!21165) (not b!227756) (not b!227758) tp_is_empty!5973)
(check-sat b_and!13009 (not b_next!6111))
