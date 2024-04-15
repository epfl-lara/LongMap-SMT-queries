; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24660 () Bool)

(assert start!24660)

(declare-fun b!257816 () Bool)

(declare-fun b_free!6739 () Bool)

(declare-fun b_next!6739 () Bool)

(assert (=> b!257816 (= b_free!6739 (not b_next!6739))))

(declare-fun tp!23528 () Bool)

(declare-fun b_and!13787 () Bool)

(assert (=> b!257816 (= tp!23528 b_and!13787)))

(declare-fun b!257802 () Bool)

(declare-fun e!167114 () Bool)

(declare-fun e!167107 () Bool)

(assert (=> b!257802 (= e!167114 (not e!167107))))

(declare-fun res!126063 () Bool)

(assert (=> b!257802 (=> res!126063 e!167107)))

(declare-datatypes ((V!8449 0))(
  ( (V!8450 (val!3345 Int)) )
))
(declare-datatypes ((ValueCell!2957 0))(
  ( (ValueCellFull!2957 (v!5437 V!8449)) (EmptyCell!2957) )
))
(declare-datatypes ((array!12541 0))(
  ( (array!12542 (arr!5937 (Array (_ BitVec 32) ValueCell!2957)) (size!6285 (_ BitVec 32))) )
))
(declare-datatypes ((array!12543 0))(
  ( (array!12544 (arr!5938 (Array (_ BitVec 32) (_ BitVec 64))) (size!6286 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3814 0))(
  ( (LongMapFixedSize!3815 (defaultEntry!4760 Int) (mask!11056 (_ BitVec 32)) (extraKeys!4497 (_ BitVec 32)) (zeroValue!4601 V!8449) (minValue!4601 V!8449) (_size!1956 (_ BitVec 32)) (_keys!6929 array!12543) (_values!4743 array!12541) (_vacant!1956 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3814)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257802 (= res!126063 (not (validMask!0 (mask!11056 thiss!1504))))))

(declare-fun lt!129603 () array!12543)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257802 (= (arrayCountValidKeys!0 lt!129603 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7978 0))(
  ( (Unit!7979) )
))
(declare-fun lt!129597 () Unit!7978)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12543 (_ BitVec 32)) Unit!7978)

(assert (=> b!257802 (= lt!129597 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129603 index!297))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!257802 (arrayContainsKey!0 lt!129603 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129598 () Unit!7978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12543 (_ BitVec 64) (_ BitVec 32)) Unit!7978)

(assert (=> b!257802 (= lt!129598 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129603 key!932 index!297))))

(declare-fun v!346 () V!8449)

(declare-datatypes ((tuple2!4880 0))(
  ( (tuple2!4881 (_1!2451 (_ BitVec 64)) (_2!2451 V!8449)) )
))
(declare-datatypes ((List!3779 0))(
  ( (Nil!3776) (Cons!3775 (h!4437 tuple2!4880) (t!8833 List!3779)) )
))
(declare-datatypes ((ListLongMap!3783 0))(
  ( (ListLongMap!3784 (toList!1907 List!3779)) )
))
(declare-fun lt!129600 () ListLongMap!3783)

(declare-fun +!695 (ListLongMap!3783 tuple2!4880) ListLongMap!3783)

(declare-fun getCurrentListMap!1416 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) Int) ListLongMap!3783)

(assert (=> b!257802 (= (+!695 lt!129600 (tuple2!4881 key!932 v!346)) (getCurrentListMap!1416 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129605 () Unit!7978)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!106 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) (_ BitVec 64) V!8449 Int) Unit!7978)

(assert (=> b!257802 (= lt!129605 (lemmaAddValidKeyToArrayThenAddPairToListMap!106 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12543 (_ BitVec 32)) Bool)

(assert (=> b!257802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129603 (mask!11056 thiss!1504))))

(declare-fun lt!129606 () Unit!7978)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12543 (_ BitVec 32) (_ BitVec 32)) Unit!7978)

(assert (=> b!257802 (= lt!129606 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) index!297 (mask!11056 thiss!1504)))))

(assert (=> b!257802 (= (arrayCountValidKeys!0 lt!129603 #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504)))))))

(declare-fun lt!129595 () Unit!7978)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12543 (_ BitVec 32) (_ BitVec 64)) Unit!7978)

(assert (=> b!257802 (= lt!129595 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6929 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3780 0))(
  ( (Nil!3777) (Cons!3776 (h!4438 (_ BitVec 64)) (t!8834 List!3780)) )
))
(declare-fun arrayNoDuplicates!0 (array!12543 (_ BitVec 32) List!3780) Bool)

(assert (=> b!257802 (arrayNoDuplicates!0 lt!129603 #b00000000000000000000000000000000 Nil!3777)))

(assert (=> b!257802 (= lt!129603 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun lt!129602 () Unit!7978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3780) Unit!7978)

(assert (=> b!257802 (= lt!129602 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6929 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3777))))

(declare-fun lt!129607 () Unit!7978)

(declare-fun e!167108 () Unit!7978)

(assert (=> b!257802 (= lt!129607 e!167108)))

(declare-fun c!43649 () Bool)

(assert (=> b!257802 (= c!43649 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257803 () Bool)

(declare-fun e!167113 () Bool)

(declare-fun tp_is_empty!6601 () Bool)

(assert (=> b!257803 (= e!167113 tp_is_empty!6601)))

(declare-fun b!257804 () Bool)

(declare-fun e!167103 () Bool)

(declare-fun e!167109 () Bool)

(assert (=> b!257804 (= e!167103 e!167109)))

(declare-fun res!126066 () Bool)

(assert (=> b!257804 (=> (not res!126066) (not e!167109))))

(declare-datatypes ((SeekEntryResult!1170 0))(
  ( (MissingZero!1170 (index!6850 (_ BitVec 32))) (Found!1170 (index!6851 (_ BitVec 32))) (Intermediate!1170 (undefined!1982 Bool) (index!6852 (_ BitVec 32)) (x!25037 (_ BitVec 32))) (Undefined!1170) (MissingVacant!1170 (index!6853 (_ BitVec 32))) )
))
(declare-fun lt!129599 () SeekEntryResult!1170)

(assert (=> b!257804 (= res!126066 (or (= lt!129599 (MissingZero!1170 index!297)) (= lt!129599 (MissingVacant!1170 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12543 (_ BitVec 32)) SeekEntryResult!1170)

(assert (=> b!257804 (= lt!129599 (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!257805 () Bool)

(assert (=> b!257805 (= e!167109 e!167114)))

(declare-fun res!126060 () Bool)

(assert (=> b!257805 (=> (not res!126060) (not e!167114))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257805 (= res!126060 (inRange!0 index!297 (mask!11056 thiss!1504)))))

(declare-fun lt!129601 () Unit!7978)

(declare-fun e!167104 () Unit!7978)

(assert (=> b!257805 (= lt!129601 e!167104)))

(declare-fun c!43651 () Bool)

(declare-fun contains!1857 (ListLongMap!3783 (_ BitVec 64)) Bool)

(assert (=> b!257805 (= c!43651 (contains!1857 lt!129600 key!932))))

(assert (=> b!257805 (= lt!129600 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun b!257806 () Bool)

(declare-fun Unit!7980 () Unit!7978)

(assert (=> b!257806 (= e!167108 Unit!7980)))

(declare-fun b!257807 () Bool)

(assert (=> b!257807 (= e!167107 (= (size!6285 (_values!4743 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11056 thiss!1504))))))

(declare-fun b!257808 () Bool)

(declare-fun e!167110 () Bool)

(declare-fun mapRes!11241 () Bool)

(assert (=> b!257808 (= e!167110 (and e!167113 mapRes!11241))))

(declare-fun condMapEmpty!11241 () Bool)

(declare-fun mapDefault!11241 () ValueCell!2957)

(assert (=> b!257808 (= condMapEmpty!11241 (= (arr!5937 (_values!4743 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11241)))))

(declare-fun b!257809 () Bool)

(declare-fun e!167116 () Bool)

(declare-fun call!24492 () Bool)

(assert (=> b!257809 (= e!167116 (not call!24492))))

(declare-fun b!257810 () Bool)

(declare-fun res!126065 () Bool)

(declare-fun e!167115 () Bool)

(assert (=> b!257810 (=> (not res!126065) (not e!167115))))

(declare-fun call!24493 () Bool)

(assert (=> b!257810 (= res!126065 call!24493)))

(declare-fun e!167106 () Bool)

(assert (=> b!257810 (= e!167106 e!167115)))

(declare-fun b!257811 () Bool)

(declare-fun res!126064 () Bool)

(assert (=> b!257811 (= res!126064 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6853 lt!129599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257811 (=> (not res!126064) (not e!167116))))

(declare-fun b!257812 () Bool)

(declare-fun res!126062 () Bool)

(assert (=> b!257812 (=> (not res!126062) (not e!167115))))

(assert (=> b!257812 (= res!126062 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6850 lt!129599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24489 () Bool)

(declare-fun c!43652 () Bool)

(assert (=> bm!24489 (= call!24493 (inRange!0 (ite c!43652 (index!6850 lt!129599) (index!6853 lt!129599)) (mask!11056 thiss!1504)))))

(declare-fun b!257813 () Bool)

(assert (=> b!257813 (= e!167115 (not call!24492))))

(declare-fun b!257815 () Bool)

(declare-fun Unit!7981 () Unit!7978)

(assert (=> b!257815 (= e!167108 Unit!7981)))

(declare-fun lt!129604 () Unit!7978)

(declare-fun lemmaArrayContainsKeyThenInListMap!246 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) (_ BitVec 32) Int) Unit!7978)

(assert (=> b!257815 (= lt!129604 (lemmaArrayContainsKeyThenInListMap!246 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> b!257815 false))

(declare-fun e!167111 () Bool)

(declare-fun array_inv!3931 (array!12543) Bool)

(declare-fun array_inv!3932 (array!12541) Bool)

(assert (=> b!257816 (= e!167111 (and tp!23528 tp_is_empty!6601 (array_inv!3931 (_keys!6929 thiss!1504)) (array_inv!3932 (_values!4743 thiss!1504)) e!167110))))

(declare-fun b!257817 () Bool)

(declare-fun lt!129596 () Unit!7978)

(assert (=> b!257817 (= e!167104 lt!129596)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7978)

(assert (=> b!257817 (= lt!129596 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(get-info :version)

(assert (=> b!257817 (= c!43652 ((_ is MissingZero!1170) lt!129599))))

(assert (=> b!257817 e!167106))

(declare-fun b!257818 () Bool)

(declare-fun e!167112 () Bool)

(assert (=> b!257818 (= e!167112 ((_ is Undefined!1170) lt!129599))))

(declare-fun mapNonEmpty!11241 () Bool)

(declare-fun tp!23529 () Bool)

(declare-fun e!167117 () Bool)

(assert (=> mapNonEmpty!11241 (= mapRes!11241 (and tp!23529 e!167117))))

(declare-fun mapValue!11241 () ValueCell!2957)

(declare-fun mapKey!11241 () (_ BitVec 32))

(declare-fun mapRest!11241 () (Array (_ BitVec 32) ValueCell!2957))

(assert (=> mapNonEmpty!11241 (= (arr!5937 (_values!4743 thiss!1504)) (store mapRest!11241 mapKey!11241 mapValue!11241))))

(declare-fun b!257819 () Bool)

(declare-fun c!43650 () Bool)

(assert (=> b!257819 (= c!43650 ((_ is MissingVacant!1170) lt!129599))))

(assert (=> b!257819 (= e!167106 e!167112)))

(declare-fun b!257820 () Bool)

(declare-fun Unit!7982 () Unit!7978)

(assert (=> b!257820 (= e!167104 Unit!7982)))

(declare-fun lt!129594 () Unit!7978)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7978)

(assert (=> b!257820 (= lt!129594 (lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> b!257820 false))

(declare-fun b!257814 () Bool)

(declare-fun res!126061 () Bool)

(assert (=> b!257814 (=> (not res!126061) (not e!167103))))

(assert (=> b!257814 (= res!126061 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!126058 () Bool)

(assert (=> start!24660 (=> (not res!126058) (not e!167103))))

(declare-fun valid!1495 (LongMapFixedSize!3814) Bool)

(assert (=> start!24660 (= res!126058 (valid!1495 thiss!1504))))

(assert (=> start!24660 e!167103))

(assert (=> start!24660 e!167111))

(assert (=> start!24660 true))

(assert (=> start!24660 tp_is_empty!6601))

(declare-fun b!257821 () Bool)

(assert (=> b!257821 (= e!167117 tp_is_empty!6601)))

(declare-fun bm!24490 () Bool)

(assert (=> bm!24490 (= call!24492 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11241 () Bool)

(assert (=> mapIsEmpty!11241 mapRes!11241))

(declare-fun b!257822 () Bool)

(assert (=> b!257822 (= e!167112 e!167116)))

(declare-fun res!126059 () Bool)

(assert (=> b!257822 (= res!126059 call!24493)))

(assert (=> b!257822 (=> (not res!126059) (not e!167116))))

(assert (= (and start!24660 res!126058) b!257814))

(assert (= (and b!257814 res!126061) b!257804))

(assert (= (and b!257804 res!126066) b!257805))

(assert (= (and b!257805 c!43651) b!257820))

(assert (= (and b!257805 (not c!43651)) b!257817))

(assert (= (and b!257817 c!43652) b!257810))

(assert (= (and b!257817 (not c!43652)) b!257819))

(assert (= (and b!257810 res!126065) b!257812))

(assert (= (and b!257812 res!126062) b!257813))

(assert (= (and b!257819 c!43650) b!257822))

(assert (= (and b!257819 (not c!43650)) b!257818))

(assert (= (and b!257822 res!126059) b!257811))

(assert (= (and b!257811 res!126064) b!257809))

(assert (= (or b!257810 b!257822) bm!24489))

(assert (= (or b!257813 b!257809) bm!24490))

(assert (= (and b!257805 res!126060) b!257802))

(assert (= (and b!257802 c!43649) b!257815))

(assert (= (and b!257802 (not c!43649)) b!257806))

(assert (= (and b!257802 (not res!126063)) b!257807))

(assert (= (and b!257808 condMapEmpty!11241) mapIsEmpty!11241))

(assert (= (and b!257808 (not condMapEmpty!11241)) mapNonEmpty!11241))

(assert (= (and mapNonEmpty!11241 ((_ is ValueCellFull!2957) mapValue!11241)) b!257821))

(assert (= (and b!257808 ((_ is ValueCellFull!2957) mapDefault!11241)) b!257803))

(assert (= b!257816 b!257808))

(assert (= start!24660 b!257816))

(declare-fun m!272639 () Bool)

(assert (=> b!257815 m!272639))

(declare-fun m!272641 () Bool)

(assert (=> b!257802 m!272641))

(declare-fun m!272643 () Bool)

(assert (=> b!257802 m!272643))

(declare-fun m!272645 () Bool)

(assert (=> b!257802 m!272645))

(declare-fun m!272647 () Bool)

(assert (=> b!257802 m!272647))

(declare-fun m!272649 () Bool)

(assert (=> b!257802 m!272649))

(declare-fun m!272651 () Bool)

(assert (=> b!257802 m!272651))

(declare-fun m!272653 () Bool)

(assert (=> b!257802 m!272653))

(declare-fun m!272655 () Bool)

(assert (=> b!257802 m!272655))

(declare-fun m!272657 () Bool)

(assert (=> b!257802 m!272657))

(declare-fun m!272659 () Bool)

(assert (=> b!257802 m!272659))

(declare-fun m!272661 () Bool)

(assert (=> b!257802 m!272661))

(declare-fun m!272663 () Bool)

(assert (=> b!257802 m!272663))

(declare-fun m!272665 () Bool)

(assert (=> b!257802 m!272665))

(declare-fun m!272667 () Bool)

(assert (=> b!257802 m!272667))

(declare-fun m!272669 () Bool)

(assert (=> b!257802 m!272669))

(declare-fun m!272671 () Bool)

(assert (=> b!257802 m!272671))

(declare-fun m!272673 () Bool)

(assert (=> b!257802 m!272673))

(declare-fun m!272675 () Bool)

(assert (=> b!257802 m!272675))

(declare-fun m!272677 () Bool)

(assert (=> b!257820 m!272677))

(declare-fun m!272679 () Bool)

(assert (=> b!257811 m!272679))

(declare-fun m!272681 () Bool)

(assert (=> b!257816 m!272681))

(declare-fun m!272683 () Bool)

(assert (=> b!257816 m!272683))

(assert (=> bm!24490 m!272643))

(declare-fun m!272685 () Bool)

(assert (=> b!257817 m!272685))

(declare-fun m!272687 () Bool)

(assert (=> mapNonEmpty!11241 m!272687))

(declare-fun m!272689 () Bool)

(assert (=> start!24660 m!272689))

(declare-fun m!272691 () Bool)

(assert (=> bm!24489 m!272691))

(declare-fun m!272693 () Bool)

(assert (=> b!257805 m!272693))

(declare-fun m!272695 () Bool)

(assert (=> b!257805 m!272695))

(declare-fun m!272697 () Bool)

(assert (=> b!257805 m!272697))

(declare-fun m!272699 () Bool)

(assert (=> b!257812 m!272699))

(declare-fun m!272701 () Bool)

(assert (=> b!257804 m!272701))

(check-sat (not b!257820) (not b!257802) tp_is_empty!6601 (not bm!24490) (not b!257816) b_and!13787 (not b!257817) (not mapNonEmpty!11241) (not b!257805) (not bm!24489) (not b!257804) (not start!24660) (not b!257815) (not b_next!6739))
(check-sat b_and!13787 (not b_next!6739))
(get-model)

(declare-fun b!257961 () Bool)

(declare-fun e!167215 () SeekEntryResult!1170)

(declare-fun lt!129698 () SeekEntryResult!1170)

(assert (=> b!257961 (= e!167215 (Found!1170 (index!6852 lt!129698)))))

(declare-fun b!257962 () Bool)

(declare-fun e!167214 () SeekEntryResult!1170)

(assert (=> b!257962 (= e!167214 e!167215)))

(declare-fun lt!129700 () (_ BitVec 64))

(assert (=> b!257962 (= lt!129700 (select (arr!5938 (_keys!6929 thiss!1504)) (index!6852 lt!129698)))))

(declare-fun c!43684 () Bool)

(assert (=> b!257962 (= c!43684 (= lt!129700 key!932))))

(declare-fun d!61731 () Bool)

(declare-fun lt!129699 () SeekEntryResult!1170)

(assert (=> d!61731 (and (or ((_ is Undefined!1170) lt!129699) (not ((_ is Found!1170) lt!129699)) (and (bvsge (index!6851 lt!129699) #b00000000000000000000000000000000) (bvslt (index!6851 lt!129699) (size!6286 (_keys!6929 thiss!1504))))) (or ((_ is Undefined!1170) lt!129699) ((_ is Found!1170) lt!129699) (not ((_ is MissingZero!1170) lt!129699)) (and (bvsge (index!6850 lt!129699) #b00000000000000000000000000000000) (bvslt (index!6850 lt!129699) (size!6286 (_keys!6929 thiss!1504))))) (or ((_ is Undefined!1170) lt!129699) ((_ is Found!1170) lt!129699) ((_ is MissingZero!1170) lt!129699) (not ((_ is MissingVacant!1170) lt!129699)) (and (bvsge (index!6853 lt!129699) #b00000000000000000000000000000000) (bvslt (index!6853 lt!129699) (size!6286 (_keys!6929 thiss!1504))))) (or ((_ is Undefined!1170) lt!129699) (ite ((_ is Found!1170) lt!129699) (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6851 lt!129699)) key!932) (ite ((_ is MissingZero!1170) lt!129699) (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6850 lt!129699)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1170) lt!129699) (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6853 lt!129699)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61731 (= lt!129699 e!167214)))

(declare-fun c!43683 () Bool)

(assert (=> d!61731 (= c!43683 (and ((_ is Intermediate!1170) lt!129698) (undefined!1982 lt!129698)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12543 (_ BitVec 32)) SeekEntryResult!1170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61731 (= lt!129698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11056 thiss!1504)) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(assert (=> d!61731 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61731 (= (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)) lt!129699)))

(declare-fun e!167216 () SeekEntryResult!1170)

(declare-fun b!257963 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12543 (_ BitVec 32)) SeekEntryResult!1170)

(assert (=> b!257963 (= e!167216 (seekKeyOrZeroReturnVacant!0 (x!25037 lt!129698) (index!6852 lt!129698) (index!6852 lt!129698) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!257964 () Bool)

(assert (=> b!257964 (= e!167214 Undefined!1170)))

(declare-fun b!257965 () Bool)

(declare-fun c!43685 () Bool)

(assert (=> b!257965 (= c!43685 (= lt!129700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257965 (= e!167215 e!167216)))

(declare-fun b!257966 () Bool)

(assert (=> b!257966 (= e!167216 (MissingZero!1170 (index!6852 lt!129698)))))

(assert (= (and d!61731 c!43683) b!257964))

(assert (= (and d!61731 (not c!43683)) b!257962))

(assert (= (and b!257962 c!43684) b!257961))

(assert (= (and b!257962 (not c!43684)) b!257965))

(assert (= (and b!257965 c!43685) b!257966))

(assert (= (and b!257965 (not c!43685)) b!257963))

(declare-fun m!272831 () Bool)

(assert (=> b!257962 m!272831))

(declare-fun m!272833 () Bool)

(assert (=> d!61731 m!272833))

(declare-fun m!272835 () Bool)

(assert (=> d!61731 m!272835))

(declare-fun m!272837 () Bool)

(assert (=> d!61731 m!272837))

(declare-fun m!272839 () Bool)

(assert (=> d!61731 m!272839))

(declare-fun m!272841 () Bool)

(assert (=> d!61731 m!272841))

(assert (=> d!61731 m!272641))

(assert (=> d!61731 m!272833))

(declare-fun m!272843 () Bool)

(assert (=> b!257963 m!272843))

(assert (=> b!257804 d!61731))

(declare-fun d!61733 () Bool)

(declare-fun res!126127 () Bool)

(declare-fun e!167219 () Bool)

(assert (=> d!61733 (=> (not res!126127) (not e!167219))))

(declare-fun simpleValid!278 (LongMapFixedSize!3814) Bool)

(assert (=> d!61733 (= res!126127 (simpleValid!278 thiss!1504))))

(assert (=> d!61733 (= (valid!1495 thiss!1504) e!167219)))

(declare-fun b!257973 () Bool)

(declare-fun res!126128 () Bool)

(assert (=> b!257973 (=> (not res!126128) (not e!167219))))

(assert (=> b!257973 (= res!126128 (= (arrayCountValidKeys!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (_size!1956 thiss!1504)))))

(declare-fun b!257974 () Bool)

(declare-fun res!126129 () Bool)

(assert (=> b!257974 (=> (not res!126129) (not e!167219))))

(assert (=> b!257974 (= res!126129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!257975 () Bool)

(assert (=> b!257975 (= e!167219 (arrayNoDuplicates!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 Nil!3777))))

(assert (= (and d!61733 res!126127) b!257973))

(assert (= (and b!257973 res!126128) b!257974))

(assert (= (and b!257974 res!126129) b!257975))

(declare-fun m!272845 () Bool)

(assert (=> d!61733 m!272845))

(assert (=> b!257973 m!272653))

(declare-fun m!272847 () Bool)

(assert (=> b!257974 m!272847))

(declare-fun m!272849 () Bool)

(assert (=> b!257975 m!272849))

(assert (=> start!24660 d!61733))

(declare-fun d!61735 () Bool)

(declare-fun res!126134 () Bool)

(declare-fun e!167224 () Bool)

(assert (=> d!61735 (=> res!126134 e!167224)))

(assert (=> d!61735 (= res!126134 (= (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61735 (= (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 #b00000000000000000000000000000000) e!167224)))

(declare-fun b!257980 () Bool)

(declare-fun e!167225 () Bool)

(assert (=> b!257980 (= e!167224 e!167225)))

(declare-fun res!126135 () Bool)

(assert (=> b!257980 (=> (not res!126135) (not e!167225))))

(assert (=> b!257980 (= res!126135 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!257981 () Bool)

(assert (=> b!257981 (= e!167225 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61735 (not res!126134)) b!257980))

(assert (= (and b!257980 res!126135) b!257981))

(declare-fun m!272851 () Bool)

(assert (=> d!61735 m!272851))

(declare-fun m!272853 () Bool)

(assert (=> b!257981 m!272853))

(assert (=> bm!24490 d!61735))

(declare-fun d!61737 () Bool)

(assert (=> d!61737 (= (inRange!0 (ite c!43652 (index!6850 lt!129599) (index!6853 lt!129599)) (mask!11056 thiss!1504)) (and (bvsge (ite c!43652 (index!6850 lt!129599) (index!6853 lt!129599)) #b00000000000000000000000000000000) (bvslt (ite c!43652 (index!6850 lt!129599) (index!6853 lt!129599)) (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24489 d!61737))

(declare-fun b!257998 () Bool)

(declare-fun e!167236 () Bool)

(declare-fun e!167235 () Bool)

(assert (=> b!257998 (= e!167236 e!167235)))

(declare-fun res!126144 () Bool)

(declare-fun call!24510 () Bool)

(assert (=> b!257998 (= res!126144 call!24510)))

(assert (=> b!257998 (=> (not res!126144) (not e!167235))))

(declare-fun bm!24507 () Bool)

(declare-fun call!24511 () Bool)

(assert (=> bm!24507 (= call!24511 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258000 () Bool)

(declare-fun e!167237 () Bool)

(assert (=> b!258000 (= e!167237 (not call!24511))))

(declare-fun b!258001 () Bool)

(assert (=> b!258001 (= e!167235 (not call!24511))))

(declare-fun b!258002 () Bool)

(declare-fun res!126145 () Bool)

(assert (=> b!258002 (=> (not res!126145) (not e!167237))))

(declare-fun lt!129706 () SeekEntryResult!1170)

(assert (=> b!258002 (= res!126145 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6853 lt!129706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258002 (and (bvsge (index!6853 lt!129706) #b00000000000000000000000000000000) (bvslt (index!6853 lt!129706) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!258003 () Bool)

(declare-fun res!126146 () Bool)

(assert (=> b!258003 (=> (not res!126146) (not e!167237))))

(assert (=> b!258003 (= res!126146 call!24510)))

(declare-fun e!167234 () Bool)

(assert (=> b!258003 (= e!167234 e!167237)))

(declare-fun c!43691 () Bool)

(declare-fun bm!24508 () Bool)

(assert (=> bm!24508 (= call!24510 (inRange!0 (ite c!43691 (index!6850 lt!129706) (index!6853 lt!129706)) (mask!11056 thiss!1504)))))

(declare-fun b!257999 () Bool)

(assert (=> b!257999 (and (bvsge (index!6850 lt!129706) #b00000000000000000000000000000000) (bvslt (index!6850 lt!129706) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun res!126147 () Bool)

(assert (=> b!257999 (= res!126147 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6850 lt!129706)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257999 (=> (not res!126147) (not e!167235))))

(declare-fun d!61739 () Bool)

(assert (=> d!61739 e!167236))

(assert (=> d!61739 (= c!43691 ((_ is MissingZero!1170) lt!129706))))

(assert (=> d!61739 (= lt!129706 (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun lt!129705 () Unit!7978)

(declare-fun choose!1251 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7978)

(assert (=> d!61739 (= lt!129705 (choose!1251 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61739 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61739 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!434 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) lt!129705)))

(declare-fun b!258004 () Bool)

(assert (=> b!258004 (= e!167236 e!167234)))

(declare-fun c!43690 () Bool)

(assert (=> b!258004 (= c!43690 ((_ is MissingVacant!1170) lt!129706))))

(declare-fun b!258005 () Bool)

(assert (=> b!258005 (= e!167234 ((_ is Undefined!1170) lt!129706))))

(assert (= (and d!61739 c!43691) b!257998))

(assert (= (and d!61739 (not c!43691)) b!258004))

(assert (= (and b!257998 res!126144) b!257999))

(assert (= (and b!257999 res!126147) b!258001))

(assert (= (and b!258004 c!43690) b!258003))

(assert (= (and b!258004 (not c!43690)) b!258005))

(assert (= (and b!258003 res!126146) b!258002))

(assert (= (and b!258002 res!126145) b!258000))

(assert (= (or b!257998 b!258003) bm!24508))

(assert (= (or b!258001 b!258000) bm!24507))

(assert (=> bm!24507 m!272643))

(declare-fun m!272855 () Bool)

(assert (=> bm!24508 m!272855))

(declare-fun m!272857 () Bool)

(assert (=> b!257999 m!272857))

(declare-fun m!272859 () Bool)

(assert (=> b!258002 m!272859))

(assert (=> d!61739 m!272701))

(declare-fun m!272861 () Bool)

(assert (=> d!61739 m!272861))

(assert (=> d!61739 m!272641))

(assert (=> b!257817 d!61739))

(declare-fun d!61741 () Bool)

(assert (=> d!61741 (= (arrayCountValidKeys!0 lt!129603 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129709 () Unit!7978)

(declare-fun choose!2 (array!12543 (_ BitVec 32)) Unit!7978)

(assert (=> d!61741 (= lt!129709 (choose!2 lt!129603 index!297))))

(declare-fun e!167240 () Bool)

(assert (=> d!61741 e!167240))

(declare-fun res!126152 () Bool)

(assert (=> d!61741 (=> (not res!126152) (not e!167240))))

(assert (=> d!61741 (= res!126152 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 lt!129603))))))

(assert (=> d!61741 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129603 index!297) lt!129709)))

(declare-fun b!258010 () Bool)

(declare-fun res!126153 () Bool)

(assert (=> b!258010 (=> (not res!126153) (not e!167240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!258010 (= res!126153 (validKeyInArray!0 (select (arr!5938 lt!129603) index!297)))))

(declare-fun b!258011 () Bool)

(assert (=> b!258011 (= e!167240 (bvslt (size!6286 lt!129603) #b01111111111111111111111111111111))))

(assert (= (and d!61741 res!126152) b!258010))

(assert (= (and b!258010 res!126153) b!258011))

(declare-fun m!272863 () Bool)

(assert (=> d!61741 m!272863))

(declare-fun m!272865 () Bool)

(assert (=> d!61741 m!272865))

(declare-fun m!272867 () Bool)

(assert (=> b!258010 m!272867))

(assert (=> b!258010 m!272867))

(declare-fun m!272869 () Bool)

(assert (=> b!258010 m!272869))

(assert (=> b!257802 d!61741))

(declare-fun b!258022 () Bool)

(declare-fun e!167250 () Bool)

(declare-fun contains!1859 (List!3780 (_ BitVec 64)) Bool)

(assert (=> b!258022 (= e!167250 (contains!1859 Nil!3777 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun bm!24511 () Bool)

(declare-fun call!24514 () Bool)

(declare-fun c!43694 () Bool)

(assert (=> bm!24511 (= call!24514 (arrayNoDuplicates!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43694 (Cons!3776 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) Nil!3777) Nil!3777)))))

(declare-fun d!61743 () Bool)

(declare-fun res!126162 () Bool)

(declare-fun e!167251 () Bool)

(assert (=> d!61743 (=> res!126162 e!167251)))

(assert (=> d!61743 (= res!126162 (bvsge #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(assert (=> d!61743 (= (arrayNoDuplicates!0 lt!129603 #b00000000000000000000000000000000 Nil!3777) e!167251)))

(declare-fun b!258023 () Bool)

(declare-fun e!167249 () Bool)

(declare-fun e!167252 () Bool)

(assert (=> b!258023 (= e!167249 e!167252)))

(assert (=> b!258023 (= c!43694 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258024 () Bool)

(assert (=> b!258024 (= e!167251 e!167249)))

(declare-fun res!126160 () Bool)

(assert (=> b!258024 (=> (not res!126160) (not e!167249))))

(assert (=> b!258024 (= res!126160 (not e!167250))))

(declare-fun res!126161 () Bool)

(assert (=> b!258024 (=> (not res!126161) (not e!167250))))

(assert (=> b!258024 (= res!126161 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258025 () Bool)

(assert (=> b!258025 (= e!167252 call!24514)))

(declare-fun b!258026 () Bool)

(assert (=> b!258026 (= e!167252 call!24514)))

(assert (= (and d!61743 (not res!126162)) b!258024))

(assert (= (and b!258024 res!126161) b!258022))

(assert (= (and b!258024 res!126160) b!258023))

(assert (= (and b!258023 c!43694) b!258026))

(assert (= (and b!258023 (not c!43694)) b!258025))

(assert (= (or b!258026 b!258025) bm!24511))

(declare-fun m!272871 () Bool)

(assert (=> b!258022 m!272871))

(assert (=> b!258022 m!272871))

(declare-fun m!272873 () Bool)

(assert (=> b!258022 m!272873))

(assert (=> bm!24511 m!272871))

(declare-fun m!272875 () Bool)

(assert (=> bm!24511 m!272875))

(assert (=> b!258023 m!272871))

(assert (=> b!258023 m!272871))

(declare-fun m!272877 () Bool)

(assert (=> b!258023 m!272877))

(assert (=> b!258024 m!272871))

(assert (=> b!258024 m!272871))

(assert (=> b!258024 m!272877))

(assert (=> b!257802 d!61743))

(declare-fun d!61745 () Bool)

(assert (=> d!61745 (arrayContainsKey!0 lt!129603 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129712 () Unit!7978)

(declare-fun choose!13 (array!12543 (_ BitVec 64) (_ BitVec 32)) Unit!7978)

(assert (=> d!61745 (= lt!129712 (choose!13 lt!129603 key!932 index!297))))

(assert (=> d!61745 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61745 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129603 key!932 index!297) lt!129712)))

(declare-fun bs!9065 () Bool)

(assert (= bs!9065 d!61745))

(assert (=> bs!9065 m!272663))

(declare-fun m!272879 () Bool)

(assert (=> bs!9065 m!272879))

(assert (=> b!257802 d!61745))

(declare-fun b!258038 () Bool)

(declare-fun e!167257 () Bool)

(assert (=> b!258038 (= e!167257 (= (arrayCountValidKeys!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!258037 () Bool)

(declare-fun e!167258 () Bool)

(assert (=> b!258037 (= e!167258 (bvslt (size!6286 (_keys!6929 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!258036 () Bool)

(declare-fun res!126174 () Bool)

(assert (=> b!258036 (=> (not res!126174) (not e!167258))))

(assert (=> b!258036 (= res!126174 (validKeyInArray!0 key!932))))

(declare-fun d!61747 () Bool)

(assert (=> d!61747 e!167257))

(declare-fun res!126171 () Bool)

(assert (=> d!61747 (=> (not res!126171) (not e!167257))))

(assert (=> d!61747 (= res!126171 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6929 thiss!1504)))))))

(declare-fun lt!129715 () Unit!7978)

(declare-fun choose!1 (array!12543 (_ BitVec 32) (_ BitVec 64)) Unit!7978)

(assert (=> d!61747 (= lt!129715 (choose!1 (_keys!6929 thiss!1504) index!297 key!932))))

(assert (=> d!61747 e!167258))

(declare-fun res!126173 () Bool)

(assert (=> d!61747 (=> (not res!126173) (not e!167258))))

(assert (=> d!61747 (= res!126173 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6929 thiss!1504)))))))

(assert (=> d!61747 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6929 thiss!1504) index!297 key!932) lt!129715)))

(declare-fun b!258035 () Bool)

(declare-fun res!126172 () Bool)

(assert (=> b!258035 (=> (not res!126172) (not e!167258))))

(assert (=> b!258035 (= res!126172 (not (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) index!297))))))

(assert (= (and d!61747 res!126173) b!258035))

(assert (= (and b!258035 res!126172) b!258036))

(assert (= (and b!258036 res!126174) b!258037))

(assert (= (and d!61747 res!126171) b!258038))

(assert (=> b!258038 m!272675))

(declare-fun m!272881 () Bool)

(assert (=> b!258038 m!272881))

(assert (=> b!258038 m!272653))

(declare-fun m!272883 () Bool)

(assert (=> b!258036 m!272883))

(declare-fun m!272885 () Bool)

(assert (=> d!61747 m!272885))

(declare-fun m!272887 () Bool)

(assert (=> b!258035 m!272887))

(assert (=> b!258035 m!272887))

(declare-fun m!272889 () Bool)

(assert (=> b!258035 m!272889))

(assert (=> b!257802 d!61747))

(declare-fun b!258048 () Bool)

(declare-fun e!167264 () (_ BitVec 32))

(assert (=> b!258048 (= e!167264 #b00000000000000000000000000000000)))

(declare-fun b!258049 () Bool)

(declare-fun e!167263 () (_ BitVec 32))

(declare-fun call!24517 () (_ BitVec 32))

(assert (=> b!258049 (= e!167263 call!24517)))

(declare-fun b!258047 () Bool)

(assert (=> b!258047 (= e!167264 e!167263)))

(declare-fun c!43699 () Bool)

(assert (=> b!258047 (= c!43699 (validKeyInArray!0 (select (arr!5938 lt!129603) index!297)))))

(declare-fun d!61749 () Bool)

(declare-fun lt!129718 () (_ BitVec 32))

(assert (=> d!61749 (and (bvsge lt!129718 #b00000000000000000000000000000000) (bvsle lt!129718 (bvsub (size!6286 lt!129603) index!297)))))

(assert (=> d!61749 (= lt!129718 e!167264)))

(declare-fun c!43700 () Bool)

(assert (=> d!61749 (= c!43700 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61749 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6286 lt!129603)))))

(assert (=> d!61749 (= (arrayCountValidKeys!0 lt!129603 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129718)))

(declare-fun b!258050 () Bool)

(assert (=> b!258050 (= e!167263 (bvadd #b00000000000000000000000000000001 call!24517))))

(declare-fun bm!24514 () Bool)

(assert (=> bm!24514 (= call!24517 (arrayCountValidKeys!0 lt!129603 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!61749 c!43700) b!258048))

(assert (= (and d!61749 (not c!43700)) b!258047))

(assert (= (and b!258047 c!43699) b!258050))

(assert (= (and b!258047 (not c!43699)) b!258049))

(assert (= (or b!258050 b!258049) bm!24514))

(assert (=> b!258047 m!272867))

(assert (=> b!258047 m!272867))

(assert (=> b!258047 m!272869))

(declare-fun m!272891 () Bool)

(assert (=> bm!24514 m!272891))

(assert (=> b!257802 d!61749))

(declare-fun b!258052 () Bool)

(declare-fun e!167266 () (_ BitVec 32))

(assert (=> b!258052 (= e!167266 #b00000000000000000000000000000000)))

(declare-fun b!258053 () Bool)

(declare-fun e!167265 () (_ BitVec 32))

(declare-fun call!24518 () (_ BitVec 32))

(assert (=> b!258053 (= e!167265 call!24518)))

(declare-fun b!258051 () Bool)

(assert (=> b!258051 (= e!167266 e!167265)))

(declare-fun c!43701 () Bool)

(assert (=> b!258051 (= c!43701 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61751 () Bool)

(declare-fun lt!129719 () (_ BitVec 32))

(assert (=> d!61751 (and (bvsge lt!129719 #b00000000000000000000000000000000) (bvsle lt!129719 (bvsub (size!6286 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61751 (= lt!129719 e!167266)))

(declare-fun c!43702 () Bool)

(assert (=> d!61751 (= c!43702 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61751 (and (bvsle #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6929 thiss!1504)) (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61751 (= (arrayCountValidKeys!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) lt!129719)))

(declare-fun b!258054 () Bool)

(assert (=> b!258054 (= e!167265 (bvadd #b00000000000000000000000000000001 call!24518))))

(declare-fun bm!24515 () Bool)

(assert (=> bm!24515 (= call!24518 (arrayCountValidKeys!0 (_keys!6929 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61751 c!43702) b!258052))

(assert (= (and d!61751 (not c!43702)) b!258051))

(assert (= (and b!258051 c!43701) b!258054))

(assert (= (and b!258051 (not c!43701)) b!258053))

(assert (= (or b!258054 b!258053) bm!24515))

(assert (=> b!258051 m!272851))

(assert (=> b!258051 m!272851))

(declare-fun m!272893 () Bool)

(assert (=> b!258051 m!272893))

(declare-fun m!272895 () Bool)

(assert (=> bm!24515 m!272895))

(assert (=> b!257802 d!61751))

(declare-fun d!61753 () Bool)

(declare-fun e!167269 () Bool)

(assert (=> d!61753 e!167269))

(declare-fun res!126177 () Bool)

(assert (=> d!61753 (=> (not res!126177) (not e!167269))))

(assert (=> d!61753 (= res!126177 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6929 thiss!1504))) (bvslt index!297 (size!6285 (_values!4743 thiss!1504)))))))

(declare-fun lt!129722 () Unit!7978)

(declare-fun choose!1252 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) (_ BitVec 64) V!8449 Int) Unit!7978)

(assert (=> d!61753 (= lt!129722 (choose!1252 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61753 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61753 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!106 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)) lt!129722)))

(declare-fun b!258057 () Bool)

(assert (=> b!258057 (= e!167269 (= (+!695 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4881 key!932 v!346)) (getCurrentListMap!1416 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))))))

(assert (= (and d!61753 res!126177) b!258057))

(declare-fun m!272897 () Bool)

(assert (=> d!61753 m!272897))

(assert (=> d!61753 m!272641))

(assert (=> b!258057 m!272645))

(assert (=> b!258057 m!272697))

(assert (=> b!258057 m!272697))

(declare-fun m!272899 () Bool)

(assert (=> b!258057 m!272899))

(assert (=> b!258057 m!272675))

(declare-fun m!272901 () Bool)

(assert (=> b!258057 m!272901))

(assert (=> b!257802 d!61753))

(declare-fun d!61755 () Bool)

(assert (=> d!61755 (= (validMask!0 (mask!11056 thiss!1504)) (and (or (= (mask!11056 thiss!1504) #b00000000000000000000000000000111) (= (mask!11056 thiss!1504) #b00000000000000000000000000001111) (= (mask!11056 thiss!1504) #b00000000000000000000000000011111) (= (mask!11056 thiss!1504) #b00000000000000000000000000111111) (= (mask!11056 thiss!1504) #b00000000000000000000000001111111) (= (mask!11056 thiss!1504) #b00000000000000000000000011111111) (= (mask!11056 thiss!1504) #b00000000000000000000000111111111) (= (mask!11056 thiss!1504) #b00000000000000000000001111111111) (= (mask!11056 thiss!1504) #b00000000000000000000011111111111) (= (mask!11056 thiss!1504) #b00000000000000000000111111111111) (= (mask!11056 thiss!1504) #b00000000000000000001111111111111) (= (mask!11056 thiss!1504) #b00000000000000000011111111111111) (= (mask!11056 thiss!1504) #b00000000000000000111111111111111) (= (mask!11056 thiss!1504) #b00000000000000001111111111111111) (= (mask!11056 thiss!1504) #b00000000000000011111111111111111) (= (mask!11056 thiss!1504) #b00000000000000111111111111111111) (= (mask!11056 thiss!1504) #b00000000000001111111111111111111) (= (mask!11056 thiss!1504) #b00000000000011111111111111111111) (= (mask!11056 thiss!1504) #b00000000000111111111111111111111) (= (mask!11056 thiss!1504) #b00000000001111111111111111111111) (= (mask!11056 thiss!1504) #b00000000011111111111111111111111) (= (mask!11056 thiss!1504) #b00000000111111111111111111111111) (= (mask!11056 thiss!1504) #b00000001111111111111111111111111) (= (mask!11056 thiss!1504) #b00000011111111111111111111111111) (= (mask!11056 thiss!1504) #b00000111111111111111111111111111) (= (mask!11056 thiss!1504) #b00001111111111111111111111111111) (= (mask!11056 thiss!1504) #b00011111111111111111111111111111) (= (mask!11056 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11056 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!257802 d!61755))

(declare-fun bm!24518 () Bool)

(declare-fun call!24521 () Bool)

(assert (=> bm!24518 (= call!24521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129603 (mask!11056 thiss!1504)))))

(declare-fun b!258066 () Bool)

(declare-fun e!167277 () Bool)

(assert (=> b!258066 (= e!167277 call!24521)))

(declare-fun b!258067 () Bool)

(declare-fun e!167278 () Bool)

(assert (=> b!258067 (= e!167278 call!24521)))

(declare-fun b!258068 () Bool)

(declare-fun e!167276 () Bool)

(assert (=> b!258068 (= e!167276 e!167277)))

(declare-fun c!43705 () Bool)

(assert (=> b!258068 (= c!43705 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun d!61757 () Bool)

(declare-fun res!126183 () Bool)

(assert (=> d!61757 (=> res!126183 e!167276)))

(assert (=> d!61757 (= res!126183 (bvsge #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(assert (=> d!61757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129603 (mask!11056 thiss!1504)) e!167276)))

(declare-fun b!258069 () Bool)

(assert (=> b!258069 (= e!167277 e!167278)))

(declare-fun lt!129729 () (_ BitVec 64))

(assert (=> b!258069 (= lt!129729 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(declare-fun lt!129730 () Unit!7978)

(assert (=> b!258069 (= lt!129730 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129603 lt!129729 #b00000000000000000000000000000000))))

(assert (=> b!258069 (arrayContainsKey!0 lt!129603 lt!129729 #b00000000000000000000000000000000)))

(declare-fun lt!129731 () Unit!7978)

(assert (=> b!258069 (= lt!129731 lt!129730)))

(declare-fun res!126182 () Bool)

(assert (=> b!258069 (= res!126182 (= (seekEntryOrOpen!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) lt!129603 (mask!11056 thiss!1504)) (Found!1170 #b00000000000000000000000000000000)))))

(assert (=> b!258069 (=> (not res!126182) (not e!167278))))

(assert (= (and d!61757 (not res!126183)) b!258068))

(assert (= (and b!258068 c!43705) b!258069))

(assert (= (and b!258068 (not c!43705)) b!258066))

(assert (= (and b!258069 res!126182) b!258067))

(assert (= (or b!258067 b!258066) bm!24518))

(declare-fun m!272903 () Bool)

(assert (=> bm!24518 m!272903))

(assert (=> b!258068 m!272871))

(assert (=> b!258068 m!272871))

(assert (=> b!258068 m!272877))

(assert (=> b!258069 m!272871))

(declare-fun m!272905 () Bool)

(assert (=> b!258069 m!272905))

(declare-fun m!272907 () Bool)

(assert (=> b!258069 m!272907))

(assert (=> b!258069 m!272871))

(declare-fun m!272909 () Bool)

(assert (=> b!258069 m!272909))

(assert (=> b!257802 d!61757))

(declare-fun d!61759 () Bool)

(declare-fun e!167281 () Bool)

(assert (=> d!61759 e!167281))

(declare-fun res!126189 () Bool)

(assert (=> d!61759 (=> (not res!126189) (not e!167281))))

(declare-fun lt!129742 () ListLongMap!3783)

(assert (=> d!61759 (= res!126189 (contains!1857 lt!129742 (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lt!129743 () List!3779)

(assert (=> d!61759 (= lt!129742 (ListLongMap!3784 lt!129743))))

(declare-fun lt!129740 () Unit!7978)

(declare-fun lt!129741 () Unit!7978)

(assert (=> d!61759 (= lt!129740 lt!129741)))

(declare-datatypes ((Option!317 0))(
  ( (Some!316 (v!5442 V!8449)) (None!315) )
))
(declare-fun getValueByKey!311 (List!3779 (_ BitVec 64)) Option!317)

(assert (=> d!61759 (= (getValueByKey!311 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346))) (Some!316 (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!170 (List!3779 (_ BitVec 64) V!8449) Unit!7978)

(assert (=> d!61759 (= lt!129741 (lemmaContainsTupThenGetReturnValue!170 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun insertStrictlySorted!173 (List!3779 (_ BitVec 64) V!8449) List!3779)

(assert (=> d!61759 (= lt!129743 (insertStrictlySorted!173 (toList!1907 lt!129600) (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!61759 (= (+!695 lt!129600 (tuple2!4881 key!932 v!346)) lt!129742)))

(declare-fun b!258074 () Bool)

(declare-fun res!126188 () Bool)

(assert (=> b!258074 (=> (not res!126188) (not e!167281))))

(assert (=> b!258074 (= res!126188 (= (getValueByKey!311 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346))) (Some!316 (_2!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun b!258075 () Bool)

(declare-fun contains!1860 (List!3779 tuple2!4880) Bool)

(assert (=> b!258075 (= e!167281 (contains!1860 (toList!1907 lt!129742) (tuple2!4881 key!932 v!346)))))

(assert (= (and d!61759 res!126189) b!258074))

(assert (= (and b!258074 res!126188) b!258075))

(declare-fun m!272911 () Bool)

(assert (=> d!61759 m!272911))

(declare-fun m!272913 () Bool)

(assert (=> d!61759 m!272913))

(declare-fun m!272915 () Bool)

(assert (=> d!61759 m!272915))

(declare-fun m!272917 () Bool)

(assert (=> d!61759 m!272917))

(declare-fun m!272919 () Bool)

(assert (=> b!258074 m!272919))

(declare-fun m!272921 () Bool)

(assert (=> b!258075 m!272921))

(assert (=> b!257802 d!61759))

(declare-fun b!258077 () Bool)

(declare-fun e!167283 () (_ BitVec 32))

(assert (=> b!258077 (= e!167283 #b00000000000000000000000000000000)))

(declare-fun b!258078 () Bool)

(declare-fun e!167282 () (_ BitVec 32))

(declare-fun call!24522 () (_ BitVec 32))

(assert (=> b!258078 (= e!167282 call!24522)))

(declare-fun b!258076 () Bool)

(assert (=> b!258076 (= e!167283 e!167282)))

(declare-fun c!43706 () Bool)

(assert (=> b!258076 (= c!43706 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun d!61761 () Bool)

(declare-fun lt!129744 () (_ BitVec 32))

(assert (=> d!61761 (and (bvsge lt!129744 #b00000000000000000000000000000000) (bvsle lt!129744 (bvsub (size!6286 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> d!61761 (= lt!129744 e!167283)))

(declare-fun c!43707 () Bool)

(assert (=> d!61761 (= c!43707 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61761 (and (bvsle #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6929 thiss!1504)) (size!6286 lt!129603)))))

(assert (=> d!61761 (= (arrayCountValidKeys!0 lt!129603 #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) lt!129744)))

(declare-fun b!258079 () Bool)

(assert (=> b!258079 (= e!167282 (bvadd #b00000000000000000000000000000001 call!24522))))

(declare-fun bm!24519 () Bool)

(assert (=> bm!24519 (= call!24522 (arrayCountValidKeys!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61761 c!43707) b!258077))

(assert (= (and d!61761 (not c!43707)) b!258076))

(assert (= (and b!258076 c!43706) b!258079))

(assert (= (and b!258076 (not c!43706)) b!258078))

(assert (= (or b!258079 b!258078) bm!24519))

(assert (=> b!258076 m!272871))

(assert (=> b!258076 m!272871))

(assert (=> b!258076 m!272877))

(declare-fun m!272923 () Bool)

(assert (=> bm!24519 m!272923))

(assert (=> b!257802 d!61761))

(declare-fun d!61763 () Bool)

(declare-fun res!126190 () Bool)

(declare-fun e!167284 () Bool)

(assert (=> d!61763 (=> res!126190 e!167284)))

(assert (=> d!61763 (= res!126190 (= (select (arr!5938 lt!129603) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61763 (= (arrayContainsKey!0 lt!129603 key!932 #b00000000000000000000000000000000) e!167284)))

(declare-fun b!258080 () Bool)

(declare-fun e!167285 () Bool)

(assert (=> b!258080 (= e!167284 e!167285)))

(declare-fun res!126191 () Bool)

(assert (=> b!258080 (=> (not res!126191) (not e!167285))))

(assert (=> b!258080 (= res!126191 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(declare-fun b!258081 () Bool)

(assert (=> b!258081 (= e!167285 (arrayContainsKey!0 lt!129603 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61763 (not res!126190)) b!258080))

(assert (= (and b!258080 res!126191) b!258081))

(assert (=> d!61763 m!272871))

(declare-fun m!272925 () Bool)

(assert (=> b!258081 m!272925))

(assert (=> b!257802 d!61763))

(assert (=> b!257802 d!61735))

(declare-fun d!61765 () Bool)

(declare-fun e!167288 () Bool)

(assert (=> d!61765 e!167288))

(declare-fun res!126194 () Bool)

(assert (=> d!61765 (=> (not res!126194) (not e!167288))))

(assert (=> d!61765 (= res!126194 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6929 thiss!1504)))))))

(declare-fun lt!129747 () Unit!7978)

(declare-fun choose!102 ((_ BitVec 64) array!12543 (_ BitVec 32) (_ BitVec 32)) Unit!7978)

(assert (=> d!61765 (= lt!129747 (choose!102 key!932 (_keys!6929 thiss!1504) index!297 (mask!11056 thiss!1504)))))

(assert (=> d!61765 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61765 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) index!297 (mask!11056 thiss!1504)) lt!129747)))

(declare-fun b!258084 () Bool)

(assert (=> b!258084 (= e!167288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (mask!11056 thiss!1504)))))

(assert (= (and d!61765 res!126194) b!258084))

(declare-fun m!272927 () Bool)

(assert (=> d!61765 m!272927))

(assert (=> d!61765 m!272641))

(assert (=> b!258084 m!272675))

(declare-fun m!272929 () Bool)

(assert (=> b!258084 m!272929))

(assert (=> b!257802 d!61765))

(declare-fun b!258127 () Bool)

(declare-fun e!167327 () ListLongMap!3783)

(declare-fun call!24539 () ListLongMap!3783)

(assert (=> b!258127 (= e!167327 (+!695 call!24539 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258128 () Bool)

(declare-fun e!167320 () Bool)

(declare-fun e!167323 () Bool)

(assert (=> b!258128 (= e!167320 e!167323)))

(declare-fun c!43722 () Bool)

(assert (=> b!258128 (= c!43722 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24534 () Bool)

(declare-fun call!24542 () Bool)

(declare-fun lt!129797 () ListLongMap!3783)

(assert (=> bm!24534 (= call!24542 (contains!1857 lt!129797 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258129 () Bool)

(declare-fun e!167318 () Unit!7978)

(declare-fun lt!129810 () Unit!7978)

(assert (=> b!258129 (= e!167318 lt!129810)))

(declare-fun lt!129811 () ListLongMap!3783)

(declare-fun getCurrentListMapNoExtraKeys!571 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 32) Int) ListLongMap!3783)

(assert (=> b!258129 (= lt!129811 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129798 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129802 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129802 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(declare-fun lt!129793 () Unit!7978)

(declare-fun addStillContains!231 (ListLongMap!3783 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7978)

(assert (=> b!258129 (= lt!129793 (addStillContains!231 lt!129811 lt!129798 (zeroValue!4601 thiss!1504) lt!129802))))

(assert (=> b!258129 (contains!1857 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) lt!129802)))

(declare-fun lt!129806 () Unit!7978)

(assert (=> b!258129 (= lt!129806 lt!129793)))

(declare-fun lt!129805 () ListLongMap!3783)

(assert (=> b!258129 (= lt!129805 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129812 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129796 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129796 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(declare-fun lt!129803 () Unit!7978)

(declare-fun addApplyDifferent!231 (ListLongMap!3783 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7978)

(assert (=> b!258129 (= lt!129803 (addApplyDifferent!231 lt!129805 lt!129812 (minValue!4601 thiss!1504) lt!129796))))

(declare-fun apply!255 (ListLongMap!3783 (_ BitVec 64)) V!8449)

(assert (=> b!258129 (= (apply!255 (+!695 lt!129805 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) lt!129796) (apply!255 lt!129805 lt!129796))))

(declare-fun lt!129801 () Unit!7978)

(assert (=> b!258129 (= lt!129801 lt!129803)))

(declare-fun lt!129809 () ListLongMap!3783)

(assert (=> b!258129 (= lt!129809 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129813 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129794 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129794 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(declare-fun lt!129807 () Unit!7978)

(assert (=> b!258129 (= lt!129807 (addApplyDifferent!231 lt!129809 lt!129813 (zeroValue!4601 thiss!1504) lt!129794))))

(assert (=> b!258129 (= (apply!255 (+!695 lt!129809 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) lt!129794) (apply!255 lt!129809 lt!129794))))

(declare-fun lt!129799 () Unit!7978)

(assert (=> b!258129 (= lt!129799 lt!129807)))

(declare-fun lt!129800 () ListLongMap!3783)

(assert (=> b!258129 (= lt!129800 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129795 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129795 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129808 () (_ BitVec 64))

(assert (=> b!258129 (= lt!129808 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(assert (=> b!258129 (= lt!129810 (addApplyDifferent!231 lt!129800 lt!129795 (minValue!4601 thiss!1504) lt!129808))))

(assert (=> b!258129 (= (apply!255 (+!695 lt!129800 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) lt!129808) (apply!255 lt!129800 lt!129808))))

(declare-fun b!258130 () Bool)

(declare-fun e!167315 () ListLongMap!3783)

(declare-fun call!24541 () ListLongMap!3783)

(assert (=> b!258130 (= e!167315 call!24541)))

(declare-fun bm!24535 () Bool)

(declare-fun call!24538 () ListLongMap!3783)

(assert (=> bm!24535 (= call!24538 call!24539)))

(declare-fun bm!24536 () Bool)

(declare-fun call!24537 () ListLongMap!3783)

(declare-fun call!24540 () ListLongMap!3783)

(assert (=> bm!24536 (= call!24537 call!24540)))

(declare-fun b!258131 () Bool)

(declare-fun res!126215 () Bool)

(assert (=> b!258131 (=> (not res!126215) (not e!167320))))

(declare-fun e!167326 () Bool)

(assert (=> b!258131 (= res!126215 e!167326)))

(declare-fun c!43724 () Bool)

(assert (=> b!258131 (= c!43724 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!61767 () Bool)

(assert (=> d!61767 e!167320))

(declare-fun res!126218 () Bool)

(assert (=> d!61767 (=> (not res!126218) (not e!167320))))

(assert (=> d!61767 (= res!126218 (or (bvsge #b00000000000000000000000000000000 (size!6286 lt!129603)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))))

(declare-fun lt!129792 () ListLongMap!3783)

(assert (=> d!61767 (= lt!129797 lt!129792)))

(declare-fun lt!129804 () Unit!7978)

(assert (=> d!61767 (= lt!129804 e!167318)))

(declare-fun c!43723 () Bool)

(declare-fun e!167324 () Bool)

(assert (=> d!61767 (= c!43723 e!167324)))

(declare-fun res!126216 () Bool)

(assert (=> d!61767 (=> (not res!126216) (not e!167324))))

(assert (=> d!61767 (= res!126216 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(assert (=> d!61767 (= lt!129792 e!167327)))

(declare-fun c!43725 () Bool)

(assert (=> d!61767 (= c!43725 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61767 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61767 (= (getCurrentListMap!1416 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!129797)))

(declare-fun b!258132 () Bool)

(declare-fun e!167321 () Bool)

(declare-fun e!167316 () Bool)

(assert (=> b!258132 (= e!167321 e!167316)))

(declare-fun res!126213 () Bool)

(assert (=> b!258132 (=> (not res!126213) (not e!167316))))

(assert (=> b!258132 (= res!126213 (contains!1857 lt!129797 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> b!258132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun b!258133 () Bool)

(declare-fun Unit!7988 () Unit!7978)

(assert (=> b!258133 (= e!167318 Unit!7988)))

(declare-fun b!258134 () Bool)

(declare-fun get!3050 (ValueCell!2957 V!8449) V!8449)

(declare-fun dynLambda!589 (Int (_ BitVec 64)) V!8449)

(assert (=> b!258134 (= e!167316 (= (apply!255 lt!129797 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))))))))

(assert (=> b!258134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun bm!24537 () Bool)

(declare-fun call!24543 () Bool)

(assert (=> bm!24537 (= call!24543 (contains!1857 lt!129797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258135 () Bool)

(assert (=> b!258135 (= e!167324 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258136 () Bool)

(declare-fun res!126220 () Bool)

(assert (=> b!258136 (=> (not res!126220) (not e!167320))))

(assert (=> b!258136 (= res!126220 e!167321)))

(declare-fun res!126219 () Bool)

(assert (=> b!258136 (=> res!126219 e!167321)))

(declare-fun e!167322 () Bool)

(assert (=> b!258136 (= res!126219 (not e!167322))))

(declare-fun res!126217 () Bool)

(assert (=> b!258136 (=> (not res!126217) (not e!167322))))

(assert (=> b!258136 (= res!126217 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun b!258137 () Bool)

(declare-fun e!167319 () Bool)

(assert (=> b!258137 (= e!167326 e!167319)))

(declare-fun res!126221 () Bool)

(assert (=> b!258137 (= res!126221 call!24543)))

(assert (=> b!258137 (=> (not res!126221) (not e!167319))))

(declare-fun b!258138 () Bool)

(assert (=> b!258138 (= e!167322 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258139 () Bool)

(declare-fun e!167317 () Bool)

(assert (=> b!258139 (= e!167317 (= (apply!255 lt!129797 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun b!258140 () Bool)

(declare-fun e!167325 () ListLongMap!3783)

(assert (=> b!258140 (= e!167327 e!167325)))

(declare-fun c!43721 () Bool)

(assert (=> b!258140 (= c!43721 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24538 () Bool)

(assert (=> bm!24538 (= call!24540 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun bm!24539 () Bool)

(assert (=> bm!24539 (= call!24541 call!24537)))

(declare-fun bm!24540 () Bool)

(assert (=> bm!24540 (= call!24539 (+!695 (ite c!43725 call!24540 (ite c!43721 call!24537 call!24541)) (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun b!258141 () Bool)

(assert (=> b!258141 (= e!167325 call!24538)))

(declare-fun b!258142 () Bool)

(assert (=> b!258142 (= e!167326 (not call!24543))))

(declare-fun b!258143 () Bool)

(assert (=> b!258143 (= e!167323 (not call!24542))))

(declare-fun b!258144 () Bool)

(declare-fun c!43720 () Bool)

(assert (=> b!258144 (= c!43720 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!258144 (= e!167325 e!167315)))

(declare-fun b!258145 () Bool)

(assert (=> b!258145 (= e!167323 e!167317)))

(declare-fun res!126214 () Bool)

(assert (=> b!258145 (= res!126214 call!24542)))

(assert (=> b!258145 (=> (not res!126214) (not e!167317))))

(declare-fun b!258146 () Bool)

(assert (=> b!258146 (= e!167315 call!24538)))

(declare-fun b!258147 () Bool)

(assert (=> b!258147 (= e!167319 (= (apply!255 lt!129797 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(assert (= (and d!61767 c!43725) b!258127))

(assert (= (and d!61767 (not c!43725)) b!258140))

(assert (= (and b!258140 c!43721) b!258141))

(assert (= (and b!258140 (not c!43721)) b!258144))

(assert (= (and b!258144 c!43720) b!258146))

(assert (= (and b!258144 (not c!43720)) b!258130))

(assert (= (or b!258146 b!258130) bm!24539))

(assert (= (or b!258141 bm!24539) bm!24536))

(assert (= (or b!258141 b!258146) bm!24535))

(assert (= (or b!258127 bm!24536) bm!24538))

(assert (= (or b!258127 bm!24535) bm!24540))

(assert (= (and d!61767 res!126216) b!258135))

(assert (= (and d!61767 c!43723) b!258129))

(assert (= (and d!61767 (not c!43723)) b!258133))

(assert (= (and d!61767 res!126218) b!258136))

(assert (= (and b!258136 res!126217) b!258138))

(assert (= (and b!258136 (not res!126219)) b!258132))

(assert (= (and b!258132 res!126213) b!258134))

(assert (= (and b!258136 res!126220) b!258131))

(assert (= (and b!258131 c!43724) b!258137))

(assert (= (and b!258131 (not c!43724)) b!258142))

(assert (= (and b!258137 res!126221) b!258147))

(assert (= (or b!258137 b!258142) bm!24537))

(assert (= (and b!258131 res!126215) b!258128))

(assert (= (and b!258128 c!43722) b!258145))

(assert (= (and b!258128 (not c!43722)) b!258143))

(assert (= (and b!258145 res!126214) b!258139))

(assert (= (or b!258145 b!258143) bm!24534))

(declare-fun b_lambda!8177 () Bool)

(assert (=> (not b_lambda!8177) (not b!258134)))

(declare-fun t!8838 () Bool)

(declare-fun tb!3015 () Bool)

(assert (=> (and b!257816 (= (defaultEntry!4760 thiss!1504) (defaultEntry!4760 thiss!1504)) t!8838) tb!3015))

(declare-fun result!5383 () Bool)

(assert (=> tb!3015 (= result!5383 tp_is_empty!6601)))

(assert (=> b!258134 t!8838))

(declare-fun b_and!13793 () Bool)

(assert (= b_and!13787 (and (=> t!8838 result!5383) b_and!13793)))

(declare-fun m!272931 () Bool)

(assert (=> bm!24540 m!272931))

(declare-fun m!272933 () Bool)

(assert (=> b!258134 m!272933))

(declare-fun m!272935 () Bool)

(assert (=> b!258134 m!272935))

(declare-fun m!272937 () Bool)

(assert (=> b!258134 m!272937))

(assert (=> b!258134 m!272935))

(assert (=> b!258134 m!272871))

(assert (=> b!258134 m!272871))

(declare-fun m!272939 () Bool)

(assert (=> b!258134 m!272939))

(assert (=> b!258134 m!272933))

(declare-fun m!272941 () Bool)

(assert (=> b!258129 m!272941))

(declare-fun m!272943 () Bool)

(assert (=> b!258129 m!272943))

(declare-fun m!272945 () Bool)

(assert (=> b!258129 m!272945))

(declare-fun m!272947 () Bool)

(assert (=> b!258129 m!272947))

(declare-fun m!272949 () Bool)

(assert (=> b!258129 m!272949))

(declare-fun m!272951 () Bool)

(assert (=> b!258129 m!272951))

(declare-fun m!272953 () Bool)

(assert (=> b!258129 m!272953))

(declare-fun m!272955 () Bool)

(assert (=> b!258129 m!272955))

(declare-fun m!272957 () Bool)

(assert (=> b!258129 m!272957))

(declare-fun m!272959 () Bool)

(assert (=> b!258129 m!272959))

(assert (=> b!258129 m!272871))

(declare-fun m!272961 () Bool)

(assert (=> b!258129 m!272961))

(declare-fun m!272963 () Bool)

(assert (=> b!258129 m!272963))

(declare-fun m!272965 () Bool)

(assert (=> b!258129 m!272965))

(assert (=> b!258129 m!272953))

(assert (=> b!258129 m!272951))

(declare-fun m!272967 () Bool)

(assert (=> b!258129 m!272967))

(assert (=> b!258129 m!272961))

(declare-fun m!272969 () Bool)

(assert (=> b!258129 m!272969))

(assert (=> b!258129 m!272941))

(declare-fun m!272971 () Bool)

(assert (=> b!258129 m!272971))

(declare-fun m!272973 () Bool)

(assert (=> b!258127 m!272973))

(assert (=> d!61767 m!272641))

(declare-fun m!272975 () Bool)

(assert (=> b!258147 m!272975))

(assert (=> b!258135 m!272871))

(assert (=> b!258135 m!272871))

(assert (=> b!258135 m!272877))

(assert (=> b!258132 m!272871))

(assert (=> b!258132 m!272871))

(declare-fun m!272977 () Bool)

(assert (=> b!258132 m!272977))

(assert (=> b!258138 m!272871))

(assert (=> b!258138 m!272871))

(assert (=> b!258138 m!272877))

(assert (=> bm!24538 m!272943))

(declare-fun m!272979 () Bool)

(assert (=> b!258139 m!272979))

(declare-fun m!272981 () Bool)

(assert (=> bm!24534 m!272981))

(declare-fun m!272983 () Bool)

(assert (=> bm!24537 m!272983))

(assert (=> b!257802 d!61767))

(declare-fun d!61769 () Bool)

(declare-fun e!167330 () Bool)

(assert (=> d!61769 e!167330))

(declare-fun res!126224 () Bool)

(assert (=> d!61769 (=> (not res!126224) (not e!167330))))

(assert (=> d!61769 (= res!126224 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6929 thiss!1504)))))))

(declare-fun lt!129816 () Unit!7978)

(declare-fun choose!41 (array!12543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3780) Unit!7978)

(assert (=> d!61769 (= lt!129816 (choose!41 (_keys!6929 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3777))))

(assert (=> d!61769 (bvslt (size!6286 (_keys!6929 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61769 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6929 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3777) lt!129816)))

(declare-fun b!258152 () Bool)

(assert (=> b!258152 (= e!167330 (arrayNoDuplicates!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 Nil!3777))))

(assert (= (and d!61769 res!126224) b!258152))

(declare-fun m!272985 () Bool)

(assert (=> d!61769 m!272985))

(assert (=> b!258152 m!272675))

(declare-fun m!272987 () Bool)

(assert (=> b!258152 m!272987))

(assert (=> b!257802 d!61769))

(declare-fun d!61771 () Bool)

(assert (=> d!61771 (= (array_inv!3931 (_keys!6929 thiss!1504)) (bvsge (size!6286 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257816 d!61771))

(declare-fun d!61773 () Bool)

(assert (=> d!61773 (= (array_inv!3932 (_values!4743 thiss!1504)) (bvsge (size!6285 (_values!4743 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257816 d!61773))

(declare-fun d!61775 () Bool)

(declare-fun e!167333 () Bool)

(assert (=> d!61775 e!167333))

(declare-fun res!126229 () Bool)

(assert (=> d!61775 (=> (not res!126229) (not e!167333))))

(declare-fun lt!129822 () SeekEntryResult!1170)

(assert (=> d!61775 (= res!126229 ((_ is Found!1170) lt!129822))))

(assert (=> d!61775 (= lt!129822 (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun lt!129821 () Unit!7978)

(declare-fun choose!1253 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) Int) Unit!7978)

(assert (=> d!61775 (= lt!129821 (choose!1253 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61775 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61775 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!432 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) lt!129821)))

(declare-fun b!258157 () Bool)

(declare-fun res!126230 () Bool)

(assert (=> b!258157 (=> (not res!126230) (not e!167333))))

(assert (=> b!258157 (= res!126230 (inRange!0 (index!6851 lt!129822) (mask!11056 thiss!1504)))))

(declare-fun b!258158 () Bool)

(assert (=> b!258158 (= e!167333 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6851 lt!129822)) key!932))))

(assert (=> b!258158 (and (bvsge (index!6851 lt!129822) #b00000000000000000000000000000000) (bvslt (index!6851 lt!129822) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61775 res!126229) b!258157))

(assert (= (and b!258157 res!126230) b!258158))

(assert (=> d!61775 m!272701))

(declare-fun m!272989 () Bool)

(assert (=> d!61775 m!272989))

(assert (=> d!61775 m!272641))

(declare-fun m!272991 () Bool)

(assert (=> b!258157 m!272991))

(declare-fun m!272993 () Bool)

(assert (=> b!258158 m!272993))

(assert (=> b!257820 d!61775))

(declare-fun d!61777 () Bool)

(assert (=> d!61777 (contains!1857 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932)))

(declare-fun lt!129825 () Unit!7978)

(declare-fun choose!1254 (array!12543 array!12541 (_ BitVec 32) (_ BitVec 32) V!8449 V!8449 (_ BitVec 64) (_ BitVec 32) Int) Unit!7978)

(assert (=> d!61777 (= lt!129825 (choose!1254 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61777 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61777 (= (lemmaArrayContainsKeyThenInListMap!246 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!129825)))

(declare-fun bs!9066 () Bool)

(assert (= bs!9066 d!61777))

(assert (=> bs!9066 m!272697))

(assert (=> bs!9066 m!272697))

(declare-fun m!272995 () Bool)

(assert (=> bs!9066 m!272995))

(declare-fun m!272997 () Bool)

(assert (=> bs!9066 m!272997))

(assert (=> bs!9066 m!272641))

(assert (=> b!257815 d!61777))

(declare-fun d!61779 () Bool)

(assert (=> d!61779 (= (inRange!0 index!297 (mask!11056 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257805 d!61779))

(declare-fun d!61781 () Bool)

(declare-fun e!167339 () Bool)

(assert (=> d!61781 e!167339))

(declare-fun res!126233 () Bool)

(assert (=> d!61781 (=> res!126233 e!167339)))

(declare-fun lt!129834 () Bool)

(assert (=> d!61781 (= res!126233 (not lt!129834))))

(declare-fun lt!129836 () Bool)

(assert (=> d!61781 (= lt!129834 lt!129836)))

(declare-fun lt!129835 () Unit!7978)

(declare-fun e!167338 () Unit!7978)

(assert (=> d!61781 (= lt!129835 e!167338)))

(declare-fun c!43728 () Bool)

(assert (=> d!61781 (= c!43728 lt!129836)))

(declare-fun containsKey!303 (List!3779 (_ BitVec 64)) Bool)

(assert (=> d!61781 (= lt!129836 (containsKey!303 (toList!1907 lt!129600) key!932))))

(assert (=> d!61781 (= (contains!1857 lt!129600 key!932) lt!129834)))

(declare-fun b!258165 () Bool)

(declare-fun lt!129837 () Unit!7978)

(assert (=> b!258165 (= e!167338 lt!129837)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!252 (List!3779 (_ BitVec 64)) Unit!7978)

(assert (=> b!258165 (= lt!129837 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129600) key!932))))

(declare-fun isDefined!253 (Option!317) Bool)

(assert (=> b!258165 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129600) key!932))))

(declare-fun b!258166 () Bool)

(declare-fun Unit!7989 () Unit!7978)

(assert (=> b!258166 (= e!167338 Unit!7989)))

(declare-fun b!258167 () Bool)

(assert (=> b!258167 (= e!167339 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129600) key!932)))))

(assert (= (and d!61781 c!43728) b!258165))

(assert (= (and d!61781 (not c!43728)) b!258166))

(assert (= (and d!61781 (not res!126233)) b!258167))

(declare-fun m!272999 () Bool)

(assert (=> d!61781 m!272999))

(declare-fun m!273001 () Bool)

(assert (=> b!258165 m!273001))

(declare-fun m!273003 () Bool)

(assert (=> b!258165 m!273003))

(assert (=> b!258165 m!273003))

(declare-fun m!273005 () Bool)

(assert (=> b!258165 m!273005))

(assert (=> b!258167 m!273003))

(assert (=> b!258167 m!273003))

(assert (=> b!258167 m!273005))

(assert (=> b!257805 d!61781))

(declare-fun b!258168 () Bool)

(declare-fun e!167352 () ListLongMap!3783)

(declare-fun call!24546 () ListLongMap!3783)

(assert (=> b!258168 (= e!167352 (+!695 call!24546 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258169 () Bool)

(declare-fun e!167345 () Bool)

(declare-fun e!167348 () Bool)

(assert (=> b!258169 (= e!167345 e!167348)))

(declare-fun c!43731 () Bool)

(assert (=> b!258169 (= c!43731 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24541 () Bool)

(declare-fun call!24549 () Bool)

(declare-fun lt!129843 () ListLongMap!3783)

(assert (=> bm!24541 (= call!24549 (contains!1857 lt!129843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258170 () Bool)

(declare-fun e!167343 () Unit!7978)

(declare-fun lt!129856 () Unit!7978)

(assert (=> b!258170 (= e!167343 lt!129856)))

(declare-fun lt!129857 () ListLongMap!3783)

(assert (=> b!258170 (= lt!129857 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129844 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129848 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129848 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129839 () Unit!7978)

(assert (=> b!258170 (= lt!129839 (addStillContains!231 lt!129857 lt!129844 (zeroValue!4601 thiss!1504) lt!129848))))

(assert (=> b!258170 (contains!1857 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) lt!129848)))

(declare-fun lt!129852 () Unit!7978)

(assert (=> b!258170 (= lt!129852 lt!129839)))

(declare-fun lt!129851 () ListLongMap!3783)

(assert (=> b!258170 (= lt!129851 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129858 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129842 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129842 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129849 () Unit!7978)

(assert (=> b!258170 (= lt!129849 (addApplyDifferent!231 lt!129851 lt!129858 (minValue!4601 thiss!1504) lt!129842))))

(assert (=> b!258170 (= (apply!255 (+!695 lt!129851 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) lt!129842) (apply!255 lt!129851 lt!129842))))

(declare-fun lt!129847 () Unit!7978)

(assert (=> b!258170 (= lt!129847 lt!129849)))

(declare-fun lt!129855 () ListLongMap!3783)

(assert (=> b!258170 (= lt!129855 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129859 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129859 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129840 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129840 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129853 () Unit!7978)

(assert (=> b!258170 (= lt!129853 (addApplyDifferent!231 lt!129855 lt!129859 (zeroValue!4601 thiss!1504) lt!129840))))

(assert (=> b!258170 (= (apply!255 (+!695 lt!129855 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) lt!129840) (apply!255 lt!129855 lt!129840))))

(declare-fun lt!129845 () Unit!7978)

(assert (=> b!258170 (= lt!129845 lt!129853)))

(declare-fun lt!129846 () ListLongMap!3783)

(assert (=> b!258170 (= lt!129846 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129841 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129854 () (_ BitVec 64))

(assert (=> b!258170 (= lt!129854 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258170 (= lt!129856 (addApplyDifferent!231 lt!129846 lt!129841 (minValue!4601 thiss!1504) lt!129854))))

(assert (=> b!258170 (= (apply!255 (+!695 lt!129846 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) lt!129854) (apply!255 lt!129846 lt!129854))))

(declare-fun b!258171 () Bool)

(declare-fun e!167340 () ListLongMap!3783)

(declare-fun call!24548 () ListLongMap!3783)

(assert (=> b!258171 (= e!167340 call!24548)))

(declare-fun bm!24542 () Bool)

(declare-fun call!24545 () ListLongMap!3783)

(assert (=> bm!24542 (= call!24545 call!24546)))

(declare-fun bm!24543 () Bool)

(declare-fun call!24544 () ListLongMap!3783)

(declare-fun call!24547 () ListLongMap!3783)

(assert (=> bm!24543 (= call!24544 call!24547)))

(declare-fun b!258172 () Bool)

(declare-fun res!126236 () Bool)

(assert (=> b!258172 (=> (not res!126236) (not e!167345))))

(declare-fun e!167351 () Bool)

(assert (=> b!258172 (= res!126236 e!167351)))

(declare-fun c!43733 () Bool)

(assert (=> b!258172 (= c!43733 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!61783 () Bool)

(assert (=> d!61783 e!167345))

(declare-fun res!126239 () Bool)

(assert (=> d!61783 (=> (not res!126239) (not e!167345))))

(assert (=> d!61783 (= res!126239 (or (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))))

(declare-fun lt!129838 () ListLongMap!3783)

(assert (=> d!61783 (= lt!129843 lt!129838)))

(declare-fun lt!129850 () Unit!7978)

(assert (=> d!61783 (= lt!129850 e!167343)))

(declare-fun c!43732 () Bool)

(declare-fun e!167349 () Bool)

(assert (=> d!61783 (= c!43732 e!167349)))

(declare-fun res!126237 () Bool)

(assert (=> d!61783 (=> (not res!126237) (not e!167349))))

(assert (=> d!61783 (= res!126237 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61783 (= lt!129838 e!167352)))

(declare-fun c!43734 () Bool)

(assert (=> d!61783 (= c!43734 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61783 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61783 (= (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!129843)))

(declare-fun b!258173 () Bool)

(declare-fun e!167346 () Bool)

(declare-fun e!167341 () Bool)

(assert (=> b!258173 (= e!167346 e!167341)))

(declare-fun res!126234 () Bool)

(assert (=> b!258173 (=> (not res!126234) (not e!167341))))

(assert (=> b!258173 (= res!126234 (contains!1857 lt!129843 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!258174 () Bool)

(declare-fun Unit!7990 () Unit!7978)

(assert (=> b!258174 (= e!167343 Unit!7990)))

(declare-fun b!258175 () Bool)

(assert (=> b!258175 (= e!167341 (= (apply!255 lt!129843 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)) (get!3050 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (_values!4743 thiss!1504))))))

(assert (=> b!258175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun bm!24544 () Bool)

(declare-fun call!24550 () Bool)

(assert (=> bm!24544 (= call!24550 (contains!1857 lt!129843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258176 () Bool)

(assert (=> b!258176 (= e!167349 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258177 () Bool)

(declare-fun res!126241 () Bool)

(assert (=> b!258177 (=> (not res!126241) (not e!167345))))

(assert (=> b!258177 (= res!126241 e!167346)))

(declare-fun res!126240 () Bool)

(assert (=> b!258177 (=> res!126240 e!167346)))

(declare-fun e!167347 () Bool)

(assert (=> b!258177 (= res!126240 (not e!167347))))

(declare-fun res!126238 () Bool)

(assert (=> b!258177 (=> (not res!126238) (not e!167347))))

(assert (=> b!258177 (= res!126238 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!258178 () Bool)

(declare-fun e!167344 () Bool)

(assert (=> b!258178 (= e!167351 e!167344)))

(declare-fun res!126242 () Bool)

(assert (=> b!258178 (= res!126242 call!24550)))

(assert (=> b!258178 (=> (not res!126242) (not e!167344))))

(declare-fun b!258179 () Bool)

(assert (=> b!258179 (= e!167347 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258180 () Bool)

(declare-fun e!167342 () Bool)

(assert (=> b!258180 (= e!167342 (= (apply!255 lt!129843 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun b!258181 () Bool)

(declare-fun e!167350 () ListLongMap!3783)

(assert (=> b!258181 (= e!167352 e!167350)))

(declare-fun c!43730 () Bool)

(assert (=> b!258181 (= c!43730 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24545 () Bool)

(assert (=> bm!24545 (= call!24547 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun bm!24546 () Bool)

(assert (=> bm!24546 (= call!24548 call!24544)))

(declare-fun bm!24547 () Bool)

(assert (=> bm!24547 (= call!24546 (+!695 (ite c!43734 call!24547 (ite c!43730 call!24544 call!24548)) (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun b!258182 () Bool)

(assert (=> b!258182 (= e!167350 call!24545)))

(declare-fun b!258183 () Bool)

(assert (=> b!258183 (= e!167351 (not call!24550))))

(declare-fun b!258184 () Bool)

(assert (=> b!258184 (= e!167348 (not call!24549))))

(declare-fun b!258185 () Bool)

(declare-fun c!43729 () Bool)

(assert (=> b!258185 (= c!43729 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!258185 (= e!167350 e!167340)))

(declare-fun b!258186 () Bool)

(assert (=> b!258186 (= e!167348 e!167342)))

(declare-fun res!126235 () Bool)

(assert (=> b!258186 (= res!126235 call!24549)))

(assert (=> b!258186 (=> (not res!126235) (not e!167342))))

(declare-fun b!258187 () Bool)

(assert (=> b!258187 (= e!167340 call!24545)))

(declare-fun b!258188 () Bool)

(assert (=> b!258188 (= e!167344 (= (apply!255 lt!129843 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(assert (= (and d!61783 c!43734) b!258168))

(assert (= (and d!61783 (not c!43734)) b!258181))

(assert (= (and b!258181 c!43730) b!258182))

(assert (= (and b!258181 (not c!43730)) b!258185))

(assert (= (and b!258185 c!43729) b!258187))

(assert (= (and b!258185 (not c!43729)) b!258171))

(assert (= (or b!258187 b!258171) bm!24546))

(assert (= (or b!258182 bm!24546) bm!24543))

(assert (= (or b!258182 b!258187) bm!24542))

(assert (= (or b!258168 bm!24543) bm!24545))

(assert (= (or b!258168 bm!24542) bm!24547))

(assert (= (and d!61783 res!126237) b!258176))

(assert (= (and d!61783 c!43732) b!258170))

(assert (= (and d!61783 (not c!43732)) b!258174))

(assert (= (and d!61783 res!126239) b!258177))

(assert (= (and b!258177 res!126238) b!258179))

(assert (= (and b!258177 (not res!126240)) b!258173))

(assert (= (and b!258173 res!126234) b!258175))

(assert (= (and b!258177 res!126241) b!258172))

(assert (= (and b!258172 c!43733) b!258178))

(assert (= (and b!258172 (not c!43733)) b!258183))

(assert (= (and b!258178 res!126242) b!258188))

(assert (= (or b!258178 b!258183) bm!24544))

(assert (= (and b!258172 res!126236) b!258169))

(assert (= (and b!258169 c!43731) b!258186))

(assert (= (and b!258169 (not c!43731)) b!258184))

(assert (= (and b!258186 res!126235) b!258180))

(assert (= (or b!258186 b!258184) bm!24541))

(declare-fun b_lambda!8179 () Bool)

(assert (=> (not b_lambda!8179) (not b!258175)))

(assert (=> b!258175 t!8838))

(declare-fun b_and!13795 () Bool)

(assert (= b_and!13793 (and (=> t!8838 result!5383) b_and!13795)))

(declare-fun m!273007 () Bool)

(assert (=> bm!24547 m!273007))

(declare-fun m!273009 () Bool)

(assert (=> b!258175 m!273009))

(assert (=> b!258175 m!272935))

(declare-fun m!273011 () Bool)

(assert (=> b!258175 m!273011))

(assert (=> b!258175 m!272935))

(assert (=> b!258175 m!272851))

(assert (=> b!258175 m!272851))

(declare-fun m!273013 () Bool)

(assert (=> b!258175 m!273013))

(assert (=> b!258175 m!273009))

(declare-fun m!273015 () Bool)

(assert (=> b!258170 m!273015))

(declare-fun m!273017 () Bool)

(assert (=> b!258170 m!273017))

(declare-fun m!273019 () Bool)

(assert (=> b!258170 m!273019))

(declare-fun m!273021 () Bool)

(assert (=> b!258170 m!273021))

(declare-fun m!273023 () Bool)

(assert (=> b!258170 m!273023))

(declare-fun m!273025 () Bool)

(assert (=> b!258170 m!273025))

(declare-fun m!273027 () Bool)

(assert (=> b!258170 m!273027))

(declare-fun m!273029 () Bool)

(assert (=> b!258170 m!273029))

(declare-fun m!273031 () Bool)

(assert (=> b!258170 m!273031))

(declare-fun m!273033 () Bool)

(assert (=> b!258170 m!273033))

(assert (=> b!258170 m!272851))

(declare-fun m!273035 () Bool)

(assert (=> b!258170 m!273035))

(declare-fun m!273037 () Bool)

(assert (=> b!258170 m!273037))

(declare-fun m!273039 () Bool)

(assert (=> b!258170 m!273039))

(assert (=> b!258170 m!273027))

(assert (=> b!258170 m!273025))

(declare-fun m!273041 () Bool)

(assert (=> b!258170 m!273041))

(assert (=> b!258170 m!273035))

(declare-fun m!273043 () Bool)

(assert (=> b!258170 m!273043))

(assert (=> b!258170 m!273015))

(declare-fun m!273045 () Bool)

(assert (=> b!258170 m!273045))

(declare-fun m!273047 () Bool)

(assert (=> b!258168 m!273047))

(assert (=> d!61783 m!272641))

(declare-fun m!273049 () Bool)

(assert (=> b!258188 m!273049))

(assert (=> b!258176 m!272851))

(assert (=> b!258176 m!272851))

(assert (=> b!258176 m!272893))

(assert (=> b!258173 m!272851))

(assert (=> b!258173 m!272851))

(declare-fun m!273051 () Bool)

(assert (=> b!258173 m!273051))

(assert (=> b!258179 m!272851))

(assert (=> b!258179 m!272851))

(assert (=> b!258179 m!272893))

(assert (=> bm!24545 m!273017))

(declare-fun m!273053 () Bool)

(assert (=> b!258180 m!273053))

(declare-fun m!273055 () Bool)

(assert (=> bm!24541 m!273055))

(declare-fun m!273057 () Bool)

(assert (=> bm!24544 m!273057))

(assert (=> b!257805 d!61783))

(declare-fun b!258196 () Bool)

(declare-fun e!167357 () Bool)

(assert (=> b!258196 (= e!167357 tp_is_empty!6601)))

(declare-fun b!258195 () Bool)

(declare-fun e!167358 () Bool)

(assert (=> b!258195 (= e!167358 tp_is_empty!6601)))

(declare-fun mapIsEmpty!11250 () Bool)

(declare-fun mapRes!11250 () Bool)

(assert (=> mapIsEmpty!11250 mapRes!11250))

(declare-fun condMapEmpty!11250 () Bool)

(declare-fun mapDefault!11250 () ValueCell!2957)

(assert (=> mapNonEmpty!11241 (= condMapEmpty!11250 (= mapRest!11241 ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11250)))))

(assert (=> mapNonEmpty!11241 (= tp!23529 (and e!167357 mapRes!11250))))

(declare-fun mapNonEmpty!11250 () Bool)

(declare-fun tp!23544 () Bool)

(assert (=> mapNonEmpty!11250 (= mapRes!11250 (and tp!23544 e!167358))))

(declare-fun mapValue!11250 () ValueCell!2957)

(declare-fun mapRest!11250 () (Array (_ BitVec 32) ValueCell!2957))

(declare-fun mapKey!11250 () (_ BitVec 32))

(assert (=> mapNonEmpty!11250 (= mapRest!11241 (store mapRest!11250 mapKey!11250 mapValue!11250))))

(assert (= (and mapNonEmpty!11241 condMapEmpty!11250) mapIsEmpty!11250))

(assert (= (and mapNonEmpty!11241 (not condMapEmpty!11250)) mapNonEmpty!11250))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2957) mapValue!11250)) b!258195))

(assert (= (and mapNonEmpty!11241 ((_ is ValueCellFull!2957) mapDefault!11250)) b!258196))

(declare-fun m!273059 () Bool)

(assert (=> mapNonEmpty!11250 m!273059))

(declare-fun b_lambda!8181 () Bool)

(assert (= b_lambda!8177 (or (and b!257816 b_free!6739) b_lambda!8181)))

(declare-fun b_lambda!8183 () Bool)

(assert (= b_lambda!8179 (or (and b!257816 b_free!6739) b_lambda!8183)))

(check-sat (not b!258176) (not d!61777) (not b!258157) (not b!258175) (not b!258068) (not b!258036) (not d!61759) (not b!258076) (not b!258022) (not bm!24518) (not b!258129) (not d!61783) (not b!258134) tp_is_empty!6601 (not d!61745) (not b!258075) (not b!258139) (not d!61767) (not b!258147) (not bm!24540) (not d!61753) (not b!258069) (not b_next!6739) (not b!258135) (not b!258127) (not bm!24508) (not d!61769) (not bm!24519) (not b!258024) (not mapNonEmpty!11250) (not bm!24514) (not bm!24541) (not b!258035) (not bm!24547) (not b!258023) (not d!61747) (not bm!24545) (not b!257975) (not b_lambda!8181) (not b!258179) (not d!61731) (not bm!24537) (not b!257974) (not b!258038) (not b!258084) (not b_lambda!8183) b_and!13795 (not b!258132) (not bm!24534) (not b!258138) (not b!258173) (not b!258152) (not b!258165) (not bm!24515) (not d!61775) (not b!258047) (not b!258051) (not d!61781) (not b!258180) (not b!258188) (not b!258168) (not b!257973) (not d!61765) (not d!61733) (not d!61739) (not b!258010) (not b!258081) (not b!258167) (not b!258074) (not bm!24511) (not bm!24507) (not b!258057) (not d!61741) (not b!258170) (not bm!24544) (not b!257963) (not b!257981) (not bm!24538))
(check-sat b_and!13795 (not b_next!6739))
(get-model)

(declare-fun d!61785 () Bool)

(assert (=> d!61785 (= (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258176 d!61785))

(declare-fun d!61787 () Bool)

(assert (=> d!61787 (= (validKeyInArray!0 (select (arr!5938 lt!129603) index!297)) (and (not (= (select (arr!5938 lt!129603) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5938 lt!129603) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258047 d!61787))

(declare-fun d!61789 () Bool)

(assert (=> d!61789 (= (inRange!0 (index!6851 lt!129822) (mask!11056 thiss!1504)) (and (bvsge (index!6851 lt!129822) #b00000000000000000000000000000000) (bvslt (index!6851 lt!129822) (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258157 d!61789))

(declare-fun d!61791 () Bool)

(assert (=> d!61791 (arrayNoDuplicates!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 Nil!3777)))

(assert (=> d!61791 true))

(declare-fun _$65!86 () Unit!7978)

(assert (=> d!61791 (= (choose!41 (_keys!6929 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3777) _$65!86)))

(declare-fun bs!9067 () Bool)

(assert (= bs!9067 d!61791))

(assert (=> bs!9067 m!272675))

(assert (=> bs!9067 m!272987))

(assert (=> d!61769 d!61791))

(declare-fun d!61793 () Bool)

(declare-fun get!3051 (Option!317) V!8449)

(assert (=> d!61793 (= (apply!255 lt!129843 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)) (get!3051 (getValueByKey!311 (toList!1907 lt!129843) (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9068 () Bool)

(assert (= bs!9068 d!61793))

(assert (=> bs!9068 m!272851))

(declare-fun m!273061 () Bool)

(assert (=> bs!9068 m!273061))

(assert (=> bs!9068 m!273061))

(declare-fun m!273063 () Bool)

(assert (=> bs!9068 m!273063))

(assert (=> b!258175 d!61793))

(declare-fun d!61795 () Bool)

(declare-fun c!43737 () Bool)

(assert (=> d!61795 (= c!43737 ((_ is ValueCellFull!2957) (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167361 () V!8449)

(assert (=> d!61795 (= (get!3050 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167361)))

(declare-fun b!258201 () Bool)

(declare-fun get!3052 (ValueCell!2957 V!8449) V!8449)

(assert (=> b!258201 (= e!167361 (get!3052 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258202 () Bool)

(declare-fun get!3053 (ValueCell!2957 V!8449) V!8449)

(assert (=> b!258202 (= e!167361 (get!3053 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61795 c!43737) b!258201))

(assert (= (and d!61795 (not c!43737)) b!258202))

(assert (=> b!258201 m!273009))

(assert (=> b!258201 m!272935))

(declare-fun m!273065 () Bool)

(assert (=> b!258201 m!273065))

(assert (=> b!258202 m!273009))

(assert (=> b!258202 m!272935))

(declare-fun m!273067 () Bool)

(assert (=> b!258202 m!273067))

(assert (=> b!258175 d!61795))

(declare-fun b!258204 () Bool)

(declare-fun e!167363 () (_ BitVec 32))

(assert (=> b!258204 (= e!167363 #b00000000000000000000000000000000)))

(declare-fun b!258205 () Bool)

(declare-fun e!167362 () (_ BitVec 32))

(declare-fun call!24551 () (_ BitVec 32))

(assert (=> b!258205 (= e!167362 call!24551)))

(declare-fun b!258203 () Bool)

(assert (=> b!258203 (= e!167363 e!167362)))

(declare-fun c!43738 () Bool)

(assert (=> b!258203 (= c!43738 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!61797 () Bool)

(declare-fun lt!129860 () (_ BitVec 32))

(assert (=> d!61797 (and (bvsge lt!129860 #b00000000000000000000000000000000) (bvsle lt!129860 (bvsub (size!6286 (_keys!6929 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61797 (= lt!129860 e!167363)))

(declare-fun c!43739 () Bool)

(assert (=> d!61797 (= c!43739 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61797 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6929 thiss!1504)) (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61797 (= (arrayCountValidKeys!0 (_keys!6929 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))) lt!129860)))

(declare-fun b!258206 () Bool)

(assert (=> b!258206 (= e!167362 (bvadd #b00000000000000000000000000000001 call!24551))))

(declare-fun bm!24548 () Bool)

(assert (=> bm!24548 (= call!24551 (arrayCountValidKeys!0 (_keys!6929 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61797 c!43739) b!258204))

(assert (= (and d!61797 (not c!43739)) b!258203))

(assert (= (and b!258203 c!43738) b!258206))

(assert (= (and b!258203 (not c!43738)) b!258205))

(assert (= (or b!258206 b!258205) bm!24548))

(declare-fun m!273069 () Bool)

(assert (=> b!258203 m!273069))

(assert (=> b!258203 m!273069))

(declare-fun m!273071 () Bool)

(assert (=> b!258203 m!273071))

(declare-fun m!273073 () Bool)

(assert (=> bm!24548 m!273073))

(assert (=> bm!24515 d!61797))

(declare-fun d!61799 () Bool)

(assert (=> d!61799 (= (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) (and (not (= (select (arr!5938 lt!129603) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5938 lt!129603) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258024 d!61799))

(declare-fun d!61801 () Bool)

(declare-fun e!167365 () Bool)

(assert (=> d!61801 e!167365))

(declare-fun res!126243 () Bool)

(assert (=> d!61801 (=> res!126243 e!167365)))

(declare-fun lt!129861 () Bool)

(assert (=> d!61801 (= res!126243 (not lt!129861))))

(declare-fun lt!129863 () Bool)

(assert (=> d!61801 (= lt!129861 lt!129863)))

(declare-fun lt!129862 () Unit!7978)

(declare-fun e!167364 () Unit!7978)

(assert (=> d!61801 (= lt!129862 e!167364)))

(declare-fun c!43740 () Bool)

(assert (=> d!61801 (= c!43740 lt!129863)))

(assert (=> d!61801 (= lt!129863 (containsKey!303 (toList!1907 lt!129797) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61801 (= (contains!1857 lt!129797 #b0000000000000000000000000000000000000000000000000000000000000000) lt!129861)))

(declare-fun b!258207 () Bool)

(declare-fun lt!129864 () Unit!7978)

(assert (=> b!258207 (= e!167364 lt!129864)))

(assert (=> b!258207 (= lt!129864 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129797) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258207 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258208 () Bool)

(declare-fun Unit!7991 () Unit!7978)

(assert (=> b!258208 (= e!167364 Unit!7991)))

(declare-fun b!258209 () Bool)

(assert (=> b!258209 (= e!167365 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61801 c!43740) b!258207))

(assert (= (and d!61801 (not c!43740)) b!258208))

(assert (= (and d!61801 (not res!126243)) b!258209))

(declare-fun m!273075 () Bool)

(assert (=> d!61801 m!273075))

(declare-fun m!273077 () Bool)

(assert (=> b!258207 m!273077))

(declare-fun m!273079 () Bool)

(assert (=> b!258207 m!273079))

(assert (=> b!258207 m!273079))

(declare-fun m!273081 () Bool)

(assert (=> b!258207 m!273081))

(assert (=> b!258209 m!273079))

(assert (=> b!258209 m!273079))

(assert (=> b!258209 m!273081))

(assert (=> bm!24537 d!61801))

(declare-fun b!258211 () Bool)

(declare-fun e!167367 () (_ BitVec 32))

(assert (=> b!258211 (= e!167367 #b00000000000000000000000000000000)))

(declare-fun b!258212 () Bool)

(declare-fun e!167366 () (_ BitVec 32))

(declare-fun call!24552 () (_ BitVec 32))

(assert (=> b!258212 (= e!167366 call!24552)))

(declare-fun b!258210 () Bool)

(assert (=> b!258210 (= e!167367 e!167366)))

(declare-fun c!43741 () Bool)

(assert (=> b!258210 (= c!43741 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!61803 () Bool)

(declare-fun lt!129865 () (_ BitVec 32))

(assert (=> d!61803 (and (bvsge lt!129865 #b00000000000000000000000000000000) (bvsle lt!129865 (bvsub (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!61803 (= lt!129865 e!167367)))

(declare-fun c!43742 () Bool)

(assert (=> d!61803 (= c!43742 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61803 (and (bvsle #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6929 thiss!1504)) (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(assert (=> d!61803 (= (arrayCountValidKeys!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) lt!129865)))

(declare-fun b!258213 () Bool)

(assert (=> b!258213 (= e!167366 (bvadd #b00000000000000000000000000000001 call!24552))))

(declare-fun bm!24549 () Bool)

(assert (=> bm!24549 (= call!24552 (arrayCountValidKeys!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61803 c!43742) b!258211))

(assert (= (and d!61803 (not c!43742)) b!258210))

(assert (= (and b!258210 c!43741) b!258213))

(assert (= (and b!258210 (not c!43741)) b!258212))

(assert (= (or b!258213 b!258212) bm!24549))

(declare-fun m!273083 () Bool)

(assert (=> b!258210 m!273083))

(assert (=> b!258210 m!273083))

(declare-fun m!273085 () Bool)

(assert (=> b!258210 m!273085))

(declare-fun m!273087 () Bool)

(assert (=> bm!24549 m!273087))

(assert (=> b!258038 d!61803))

(assert (=> b!258038 d!61751))

(declare-fun b!258214 () Bool)

(declare-fun e!167369 () Bool)

(assert (=> b!258214 (= e!167369 (contains!1859 Nil!3777 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!24553 () Bool)

(declare-fun bm!24550 () Bool)

(declare-fun c!43743 () Bool)

(assert (=> bm!24550 (= call!24553 (arrayNoDuplicates!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43743 (Cons!3776 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000) Nil!3777) Nil!3777)))))

(declare-fun d!61805 () Bool)

(declare-fun res!126246 () Bool)

(declare-fun e!167370 () Bool)

(assert (=> d!61805 (=> res!126246 e!167370)))

(assert (=> d!61805 (= res!126246 (bvsge #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(assert (=> d!61805 (= (arrayNoDuplicates!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 Nil!3777) e!167370)))

(declare-fun b!258215 () Bool)

(declare-fun e!167368 () Bool)

(declare-fun e!167371 () Bool)

(assert (=> b!258215 (= e!167368 e!167371)))

(assert (=> b!258215 (= c!43743 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258216 () Bool)

(assert (=> b!258216 (= e!167370 e!167368)))

(declare-fun res!126244 () Bool)

(assert (=> b!258216 (=> (not res!126244) (not e!167368))))

(assert (=> b!258216 (= res!126244 (not e!167369))))

(declare-fun res!126245 () Bool)

(assert (=> b!258216 (=> (not res!126245) (not e!167369))))

(assert (=> b!258216 (= res!126245 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258217 () Bool)

(assert (=> b!258217 (= e!167371 call!24553)))

(declare-fun b!258218 () Bool)

(assert (=> b!258218 (= e!167371 call!24553)))

(assert (= (and d!61805 (not res!126246)) b!258216))

(assert (= (and b!258216 res!126245) b!258214))

(assert (= (and b!258216 res!126244) b!258215))

(assert (= (and b!258215 c!43743) b!258218))

(assert (= (and b!258215 (not c!43743)) b!258217))

(assert (= (or b!258218 b!258217) bm!24550))

(assert (=> b!258214 m!273083))

(assert (=> b!258214 m!273083))

(declare-fun m!273089 () Bool)

(assert (=> b!258214 m!273089))

(assert (=> bm!24550 m!273083))

(declare-fun m!273091 () Bool)

(assert (=> bm!24550 m!273091))

(assert (=> b!258215 m!273083))

(assert (=> b!258215 m!273083))

(assert (=> b!258215 m!273085))

(assert (=> b!258216 m!273083))

(assert (=> b!258216 m!273083))

(assert (=> b!258216 m!273085))

(assert (=> b!258152 d!61805))

(declare-fun d!61807 () Bool)

(declare-fun res!126247 () Bool)

(declare-fun e!167372 () Bool)

(assert (=> d!61807 (=> res!126247 e!167372)))

(assert (=> d!61807 (= res!126247 (= (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61807 (= (arrayContainsKey!0 lt!129603 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167372)))

(declare-fun b!258219 () Bool)

(declare-fun e!167373 () Bool)

(assert (=> b!258219 (= e!167372 e!167373)))

(declare-fun res!126248 () Bool)

(assert (=> b!258219 (=> (not res!126248) (not e!167373))))

(assert (=> b!258219 (= res!126248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(declare-fun b!258220 () Bool)

(assert (=> b!258220 (= e!167373 (arrayContainsKey!0 lt!129603 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61807 (not res!126247)) b!258219))

(assert (= (and b!258219 res!126248) b!258220))

(declare-fun m!273093 () Bool)

(assert (=> d!61807 m!273093))

(declare-fun m!273095 () Bool)

(assert (=> b!258220 m!273095))

(assert (=> b!258081 d!61807))

(assert (=> d!61739 d!61731))

(declare-fun b!258237 () Bool)

(declare-fun res!126257 () Bool)

(declare-fun e!167384 () Bool)

(assert (=> b!258237 (=> (not res!126257) (not e!167384))))

(declare-fun call!24558 () Bool)

(assert (=> b!258237 (= res!126257 call!24558)))

(declare-fun e!167382 () Bool)

(assert (=> b!258237 (= e!167382 e!167384)))

(declare-fun b!258238 () Bool)

(declare-fun res!126260 () Bool)

(declare-fun lt!129868 () SeekEntryResult!1170)

(assert (=> b!258238 (= res!126260 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6850 lt!129868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167385 () Bool)

(assert (=> b!258238 (=> (not res!126260) (not e!167385))))

(declare-fun b!258239 () Bool)

(declare-fun call!24559 () Bool)

(assert (=> b!258239 (= e!167384 (not call!24559))))

(declare-fun b!258240 () Bool)

(assert (=> b!258240 (= e!167385 (not call!24559))))

(declare-fun b!258241 () Bool)

(declare-fun res!126258 () Bool)

(assert (=> b!258241 (=> (not res!126258) (not e!167384))))

(assert (=> b!258241 (= res!126258 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6853 lt!129868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!61809 () Bool)

(declare-fun e!167383 () Bool)

(assert (=> d!61809 e!167383))

(declare-fun c!43749 () Bool)

(assert (=> d!61809 (= c!43749 ((_ is MissingZero!1170) lt!129868))))

(assert (=> d!61809 (= lt!129868 (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(assert (=> d!61809 true))

(declare-fun _$34!1119 () Unit!7978)

(assert (=> d!61809 (= (choose!1251 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) _$34!1119)))

(declare-fun b!258242 () Bool)

(assert (=> b!258242 (= e!167383 e!167382)))

(declare-fun c!43748 () Bool)

(assert (=> b!258242 (= c!43748 ((_ is MissingVacant!1170) lt!129868))))

(declare-fun b!258243 () Bool)

(assert (=> b!258243 (= e!167383 e!167385)))

(declare-fun res!126259 () Bool)

(assert (=> b!258243 (= res!126259 call!24558)))

(assert (=> b!258243 (=> (not res!126259) (not e!167385))))

(declare-fun bm!24555 () Bool)

(assert (=> bm!24555 (= call!24559 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24556 () Bool)

(assert (=> bm!24556 (= call!24558 (inRange!0 (ite c!43749 (index!6850 lt!129868) (index!6853 lt!129868)) (mask!11056 thiss!1504)))))

(declare-fun b!258244 () Bool)

(assert (=> b!258244 (= e!167382 ((_ is Undefined!1170) lt!129868))))

(assert (= (and d!61809 c!43749) b!258243))

(assert (= (and d!61809 (not c!43749)) b!258242))

(assert (= (and b!258243 res!126259) b!258238))

(assert (= (and b!258238 res!126260) b!258240))

(assert (= (and b!258242 c!43748) b!258237))

(assert (= (and b!258242 (not c!43748)) b!258244))

(assert (= (and b!258237 res!126257) b!258241))

(assert (= (and b!258241 res!126258) b!258239))

(assert (= (or b!258243 b!258237) bm!24556))

(assert (= (or b!258240 b!258239) bm!24555))

(declare-fun m!273097 () Bool)

(assert (=> b!258238 m!273097))

(assert (=> bm!24555 m!272643))

(assert (=> d!61809 m!272701))

(declare-fun m!273099 () Bool)

(assert (=> bm!24556 m!273099))

(declare-fun m!273101 () Bool)

(assert (=> b!258241 m!273101))

(assert (=> d!61739 d!61809))

(assert (=> d!61739 d!61755))

(declare-fun d!61811 () Bool)

(declare-fun e!167387 () Bool)

(assert (=> d!61811 e!167387))

(declare-fun res!126261 () Bool)

(assert (=> d!61811 (=> res!126261 e!167387)))

(declare-fun lt!129869 () Bool)

(assert (=> d!61811 (= res!126261 (not lt!129869))))

(declare-fun lt!129871 () Bool)

(assert (=> d!61811 (= lt!129869 lt!129871)))

(declare-fun lt!129870 () Unit!7978)

(declare-fun e!167386 () Unit!7978)

(assert (=> d!61811 (= lt!129870 e!167386)))

(declare-fun c!43750 () Bool)

(assert (=> d!61811 (= c!43750 lt!129871)))

(assert (=> d!61811 (= lt!129871 (containsKey!303 (toList!1907 lt!129843) (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61811 (= (contains!1857 lt!129843 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)) lt!129869)))

(declare-fun b!258245 () Bool)

(declare-fun lt!129872 () Unit!7978)

(assert (=> b!258245 (= e!167386 lt!129872)))

(assert (=> b!258245 (= lt!129872 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129843) (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258245 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258246 () Bool)

(declare-fun Unit!7992 () Unit!7978)

(assert (=> b!258246 (= e!167386 Unit!7992)))

(declare-fun b!258247 () Bool)

(assert (=> b!258247 (= e!167387 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61811 c!43750) b!258245))

(assert (= (and d!61811 (not c!43750)) b!258246))

(assert (= (and d!61811 (not res!126261)) b!258247))

(assert (=> d!61811 m!272851))

(declare-fun m!273103 () Bool)

(assert (=> d!61811 m!273103))

(assert (=> b!258245 m!272851))

(declare-fun m!273105 () Bool)

(assert (=> b!258245 m!273105))

(assert (=> b!258245 m!272851))

(assert (=> b!258245 m!273061))

(assert (=> b!258245 m!273061))

(declare-fun m!273107 () Bool)

(assert (=> b!258245 m!273107))

(assert (=> b!258247 m!272851))

(assert (=> b!258247 m!273061))

(assert (=> b!258247 m!273061))

(assert (=> b!258247 m!273107))

(assert (=> b!258173 d!61811))

(declare-fun b!258260 () Bool)

(declare-fun e!167394 () SeekEntryResult!1170)

(assert (=> b!258260 (= e!167394 (Found!1170 (index!6852 lt!129698)))))

(declare-fun e!167395 () SeekEntryResult!1170)

(declare-fun b!258261 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258261 (= e!167395 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25037 lt!129698) #b00000000000000000000000000000001) (nextIndex!0 (index!6852 lt!129698) (x!25037 lt!129698) (mask!11056 thiss!1504)) (index!6852 lt!129698) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!258262 () Bool)

(declare-fun e!167396 () SeekEntryResult!1170)

(assert (=> b!258262 (= e!167396 e!167394)))

(declare-fun c!43758 () Bool)

(declare-fun lt!129877 () (_ BitVec 64))

(assert (=> b!258262 (= c!43758 (= lt!129877 key!932))))

(declare-fun lt!129878 () SeekEntryResult!1170)

(declare-fun d!61813 () Bool)

(assert (=> d!61813 (and (or ((_ is Undefined!1170) lt!129878) (not ((_ is Found!1170) lt!129878)) (and (bvsge (index!6851 lt!129878) #b00000000000000000000000000000000) (bvslt (index!6851 lt!129878) (size!6286 (_keys!6929 thiss!1504))))) (or ((_ is Undefined!1170) lt!129878) ((_ is Found!1170) lt!129878) (not ((_ is MissingVacant!1170) lt!129878)) (not (= (index!6853 lt!129878) (index!6852 lt!129698))) (and (bvsge (index!6853 lt!129878) #b00000000000000000000000000000000) (bvslt (index!6853 lt!129878) (size!6286 (_keys!6929 thiss!1504))))) (or ((_ is Undefined!1170) lt!129878) (ite ((_ is Found!1170) lt!129878) (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6851 lt!129878)) key!932) (and ((_ is MissingVacant!1170) lt!129878) (= (index!6853 lt!129878) (index!6852 lt!129698)) (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6853 lt!129878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!61813 (= lt!129878 e!167396)))

(declare-fun c!43757 () Bool)

(assert (=> d!61813 (= c!43757 (bvsge (x!25037 lt!129698) #b01111111111111111111111111111110))))

(assert (=> d!61813 (= lt!129877 (select (arr!5938 (_keys!6929 thiss!1504)) (index!6852 lt!129698)))))

(assert (=> d!61813 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61813 (= (seekKeyOrZeroReturnVacant!0 (x!25037 lt!129698) (index!6852 lt!129698) (index!6852 lt!129698) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)) lt!129878)))

(declare-fun b!258263 () Bool)

(assert (=> b!258263 (= e!167396 Undefined!1170)))

(declare-fun b!258264 () Bool)

(declare-fun c!43759 () Bool)

(assert (=> b!258264 (= c!43759 (= lt!129877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258264 (= e!167394 e!167395)))

(declare-fun b!258265 () Bool)

(assert (=> b!258265 (= e!167395 (MissingVacant!1170 (index!6852 lt!129698)))))

(assert (= (and d!61813 c!43757) b!258263))

(assert (= (and d!61813 (not c!43757)) b!258262))

(assert (= (and b!258262 c!43758) b!258260))

(assert (= (and b!258262 (not c!43758)) b!258264))

(assert (= (and b!258264 c!43759) b!258265))

(assert (= (and b!258264 (not c!43759)) b!258261))

(declare-fun m!273109 () Bool)

(assert (=> b!258261 m!273109))

(assert (=> b!258261 m!273109))

(declare-fun m!273111 () Bool)

(assert (=> b!258261 m!273111))

(declare-fun m!273113 () Bool)

(assert (=> d!61813 m!273113))

(declare-fun m!273115 () Bool)

(assert (=> d!61813 m!273115))

(assert (=> d!61813 m!272831))

(assert (=> d!61813 m!272641))

(assert (=> b!257963 d!61813))

(declare-fun b!258266 () Bool)

(declare-fun e!167398 () Bool)

(assert (=> b!258266 (= e!167398 (contains!1859 (ite c!43694 (Cons!3776 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) Nil!3777) Nil!3777) (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!24560 () Bool)

(declare-fun c!43760 () Bool)

(declare-fun bm!24557 () Bool)

(assert (=> bm!24557 (= call!24560 (arrayNoDuplicates!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43760 (Cons!3776 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43694 (Cons!3776 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) Nil!3777) Nil!3777)) (ite c!43694 (Cons!3776 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) Nil!3777) Nil!3777))))))

(declare-fun d!61815 () Bool)

(declare-fun res!126264 () Bool)

(declare-fun e!167399 () Bool)

(assert (=> d!61815 (=> res!126264 e!167399)))

(assert (=> d!61815 (= res!126264 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(assert (=> d!61815 (= (arrayNoDuplicates!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43694 (Cons!3776 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) Nil!3777) Nil!3777)) e!167399)))

(declare-fun b!258267 () Bool)

(declare-fun e!167397 () Bool)

(declare-fun e!167400 () Bool)

(assert (=> b!258267 (= e!167397 e!167400)))

(assert (=> b!258267 (= c!43760 (validKeyInArray!0 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258268 () Bool)

(assert (=> b!258268 (= e!167399 e!167397)))

(declare-fun res!126262 () Bool)

(assert (=> b!258268 (=> (not res!126262) (not e!167397))))

(assert (=> b!258268 (= res!126262 (not e!167398))))

(declare-fun res!126263 () Bool)

(assert (=> b!258268 (=> (not res!126263) (not e!167398))))

(assert (=> b!258268 (= res!126263 (validKeyInArray!0 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!258269 () Bool)

(assert (=> b!258269 (= e!167400 call!24560)))

(declare-fun b!258270 () Bool)

(assert (=> b!258270 (= e!167400 call!24560)))

(assert (= (and d!61815 (not res!126264)) b!258268))

(assert (= (and b!258268 res!126263) b!258266))

(assert (= (and b!258268 res!126262) b!258267))

(assert (= (and b!258267 c!43760) b!258270))

(assert (= (and b!258267 (not c!43760)) b!258269))

(assert (= (or b!258270 b!258269) bm!24557))

(assert (=> b!258266 m!273093))

(assert (=> b!258266 m!273093))

(declare-fun m!273117 () Bool)

(assert (=> b!258266 m!273117))

(assert (=> bm!24557 m!273093))

(declare-fun m!273119 () Bool)

(assert (=> bm!24557 m!273119))

(assert (=> b!258267 m!273093))

(assert (=> b!258267 m!273093))

(declare-fun m!273121 () Bool)

(assert (=> b!258267 m!273121))

(assert (=> b!258268 m!273093))

(assert (=> b!258268 m!273093))

(assert (=> b!258268 m!273121))

(assert (=> bm!24511 d!61815))

(declare-fun d!61817 () Bool)

(declare-fun isEmpty!536 (Option!317) Bool)

(assert (=> d!61817 (= (isDefined!253 (getValueByKey!311 (toList!1907 lt!129600) key!932)) (not (isEmpty!536 (getValueByKey!311 (toList!1907 lt!129600) key!932))))))

(declare-fun bs!9069 () Bool)

(assert (= bs!9069 d!61817))

(assert (=> bs!9069 m!273003))

(declare-fun m!273123 () Bool)

(assert (=> bs!9069 m!273123))

(assert (=> b!258167 d!61817))

(declare-fun d!61819 () Bool)

(declare-fun c!43765 () Bool)

(assert (=> d!61819 (= c!43765 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (= (_1!2451 (h!4437 (toList!1907 lt!129600))) key!932)))))

(declare-fun e!167405 () Option!317)

(assert (=> d!61819 (= (getValueByKey!311 (toList!1907 lt!129600) key!932) e!167405)))

(declare-fun b!258279 () Bool)

(assert (=> b!258279 (= e!167405 (Some!316 (_2!2451 (h!4437 (toList!1907 lt!129600)))))))

(declare-fun b!258280 () Bool)

(declare-fun e!167406 () Option!317)

(assert (=> b!258280 (= e!167405 e!167406)))

(declare-fun c!43766 () Bool)

(assert (=> b!258280 (= c!43766 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (not (= (_1!2451 (h!4437 (toList!1907 lt!129600))) key!932))))))

(declare-fun b!258282 () Bool)

(assert (=> b!258282 (= e!167406 None!315)))

(declare-fun b!258281 () Bool)

(assert (=> b!258281 (= e!167406 (getValueByKey!311 (t!8833 (toList!1907 lt!129600)) key!932))))

(assert (= (and d!61819 c!43765) b!258279))

(assert (= (and d!61819 (not c!43765)) b!258280))

(assert (= (and b!258280 c!43766) b!258281))

(assert (= (and b!258280 (not c!43766)) b!258282))

(declare-fun m!273125 () Bool)

(assert (=> b!258281 m!273125))

(assert (=> b!258167 d!61819))

(declare-fun d!61821 () Bool)

(assert (=> d!61821 (= (apply!255 lt!129843 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3051 (getValueByKey!311 (toList!1907 lt!129843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9070 () Bool)

(assert (= bs!9070 d!61821))

(declare-fun m!273127 () Bool)

(assert (=> bs!9070 m!273127))

(assert (=> bs!9070 m!273127))

(declare-fun m!273129 () Bool)

(assert (=> bs!9070 m!273129))

(assert (=> b!258180 d!61821))

(declare-fun b!258284 () Bool)

(declare-fun e!167408 () (_ BitVec 32))

(assert (=> b!258284 (= e!167408 #b00000000000000000000000000000000)))

(declare-fun b!258285 () Bool)

(declare-fun e!167407 () (_ BitVec 32))

(declare-fun call!24561 () (_ BitVec 32))

(assert (=> b!258285 (= e!167407 call!24561)))

(declare-fun b!258283 () Bool)

(assert (=> b!258283 (= e!167408 e!167407)))

(declare-fun c!43767 () Bool)

(assert (=> b!258283 (= c!43767 (validKeyInArray!0 (select (arr!5938 lt!129603) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun d!61823 () Bool)

(declare-fun lt!129879 () (_ BitVec 32))

(assert (=> d!61823 (and (bvsge lt!129879 #b00000000000000000000000000000000) (bvsle lt!129879 (bvsub (size!6286 lt!129603) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!61823 (= lt!129879 e!167408)))

(declare-fun c!43768 () Bool)

(assert (=> d!61823 (= c!43768 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61823 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6286 lt!129603)))))

(assert (=> d!61823 (= (arrayCountValidKeys!0 lt!129603 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!129879)))

(declare-fun b!258286 () Bool)

(assert (=> b!258286 (= e!167407 (bvadd #b00000000000000000000000000000001 call!24561))))

(declare-fun bm!24558 () Bool)

(assert (=> bm!24558 (= call!24561 (arrayCountValidKeys!0 lt!129603 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!61823 c!43768) b!258284))

(assert (= (and d!61823 (not c!43768)) b!258283))

(assert (= (and b!258283 c!43767) b!258286))

(assert (= (and b!258283 (not c!43767)) b!258285))

(assert (= (or b!258286 b!258285) bm!24558))

(declare-fun m!273131 () Bool)

(assert (=> b!258283 m!273131))

(assert (=> b!258283 m!273131))

(declare-fun m!273133 () Bool)

(assert (=> b!258283 m!273133))

(declare-fun m!273135 () Bool)

(assert (=> bm!24558 m!273135))

(assert (=> bm!24514 d!61823))

(declare-fun d!61825 () Bool)

(assert (=> d!61825 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129600) key!932))))

(declare-fun lt!129882 () Unit!7978)

(declare-fun choose!1255 (List!3779 (_ BitVec 64)) Unit!7978)

(assert (=> d!61825 (= lt!129882 (choose!1255 (toList!1907 lt!129600) key!932))))

(declare-fun e!167411 () Bool)

(assert (=> d!61825 e!167411))

(declare-fun res!126267 () Bool)

(assert (=> d!61825 (=> (not res!126267) (not e!167411))))

(declare-fun isStrictlySorted!368 (List!3779) Bool)

(assert (=> d!61825 (= res!126267 (isStrictlySorted!368 (toList!1907 lt!129600)))))

(assert (=> d!61825 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129600) key!932) lt!129882)))

(declare-fun b!258289 () Bool)

(assert (=> b!258289 (= e!167411 (containsKey!303 (toList!1907 lt!129600) key!932))))

(assert (= (and d!61825 res!126267) b!258289))

(assert (=> d!61825 m!273003))

(assert (=> d!61825 m!273003))

(assert (=> d!61825 m!273005))

(declare-fun m!273137 () Bool)

(assert (=> d!61825 m!273137))

(declare-fun m!273139 () Bool)

(assert (=> d!61825 m!273139))

(assert (=> b!258289 m!272999))

(assert (=> b!258165 d!61825))

(assert (=> b!258165 d!61817))

(assert (=> b!258165 d!61819))

(declare-fun c!43769 () Bool)

(declare-fun d!61827 () Bool)

(assert (=> d!61827 (= c!43769 (and ((_ is Cons!3775) (toList!1907 lt!129742)) (= (_1!2451 (h!4437 (toList!1907 lt!129742))) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun e!167412 () Option!317)

(assert (=> d!61827 (= (getValueByKey!311 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346))) e!167412)))

(declare-fun b!258290 () Bool)

(assert (=> b!258290 (= e!167412 (Some!316 (_2!2451 (h!4437 (toList!1907 lt!129742)))))))

(declare-fun b!258291 () Bool)

(declare-fun e!167413 () Option!317)

(assert (=> b!258291 (= e!167412 e!167413)))

(declare-fun c!43770 () Bool)

(assert (=> b!258291 (= c!43770 (and ((_ is Cons!3775) (toList!1907 lt!129742)) (not (= (_1!2451 (h!4437 (toList!1907 lt!129742))) (_1!2451 (tuple2!4881 key!932 v!346))))))))

(declare-fun b!258293 () Bool)

(assert (=> b!258293 (= e!167413 None!315)))

(declare-fun b!258292 () Bool)

(assert (=> b!258292 (= e!167413 (getValueByKey!311 (t!8833 (toList!1907 lt!129742)) (_1!2451 (tuple2!4881 key!932 v!346))))))

(assert (= (and d!61827 c!43769) b!258290))

(assert (= (and d!61827 (not c!43769)) b!258291))

(assert (= (and b!258291 c!43770) b!258292))

(assert (= (and b!258291 (not c!43770)) b!258293))

(declare-fun m!273141 () Bool)

(assert (=> b!258292 m!273141))

(assert (=> b!258074 d!61827))

(declare-fun d!61829 () Bool)

(assert (=> d!61829 (= (+!695 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4881 key!932 v!346)) (getCurrentListMap!1416 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(assert (=> d!61829 true))

(declare-fun _$3!55 () Unit!7978)

(assert (=> d!61829 (= (choose!1252 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) index!297 key!932 v!346 (defaultEntry!4760 thiss!1504)) _$3!55)))

(declare-fun bs!9071 () Bool)

(assert (= bs!9071 d!61829))

(assert (=> bs!9071 m!272697))

(assert (=> bs!9071 m!272899))

(assert (=> bs!9071 m!272901))

(assert (=> bs!9071 m!272697))

(assert (=> bs!9071 m!272675))

(assert (=> bs!9071 m!272645))

(assert (=> d!61753 d!61829))

(assert (=> d!61753 d!61755))

(assert (=> b!258010 d!61787))

(declare-fun b!258295 () Bool)

(declare-fun e!167415 () (_ BitVec 32))

(assert (=> b!258295 (= e!167415 #b00000000000000000000000000000000)))

(declare-fun b!258296 () Bool)

(declare-fun e!167414 () (_ BitVec 32))

(declare-fun call!24562 () (_ BitVec 32))

(assert (=> b!258296 (= e!167414 call!24562)))

(declare-fun b!258294 () Bool)

(assert (=> b!258294 (= e!167415 e!167414)))

(declare-fun c!43771 () Bool)

(assert (=> b!258294 (= c!43771 (validKeyInArray!0 (select (arr!5938 lt!129603) index!297)))))

(declare-fun d!61831 () Bool)

(declare-fun lt!129883 () (_ BitVec 32))

(assert (=> d!61831 (and (bvsge lt!129883 #b00000000000000000000000000000000) (bvsle lt!129883 (bvsub (size!6286 lt!129603) index!297)))))

(assert (=> d!61831 (= lt!129883 e!167415)))

(declare-fun c!43772 () Bool)

(assert (=> d!61831 (= c!43772 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!61831 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(assert (=> d!61831 (= (arrayCountValidKeys!0 lt!129603 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!129883)))

(declare-fun b!258297 () Bool)

(assert (=> b!258297 (= e!167414 (bvadd #b00000000000000000000000000000001 call!24562))))

(declare-fun bm!24559 () Bool)

(assert (=> bm!24559 (= call!24562 (arrayCountValidKeys!0 lt!129603 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!61831 c!43772) b!258295))

(assert (= (and d!61831 (not c!43772)) b!258294))

(assert (= (and b!258294 c!43771) b!258297))

(assert (= (and b!258294 (not c!43771)) b!258296))

(assert (= (or b!258297 b!258296) bm!24559))

(assert (=> b!258294 m!272867))

(assert (=> b!258294 m!272867))

(assert (=> b!258294 m!272869))

(declare-fun m!273143 () Bool)

(assert (=> bm!24559 m!273143))

(assert (=> d!61741 d!61831))

(declare-fun d!61833 () Bool)

(assert (=> d!61833 (= (arrayCountValidKeys!0 lt!129603 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!61833 true))

(declare-fun _$85!21 () Unit!7978)

(assert (=> d!61833 (= (choose!2 lt!129603 index!297) _$85!21)))

(declare-fun bs!9072 () Bool)

(assert (= bs!9072 d!61833))

(assert (=> bs!9072 m!272863))

(assert (=> d!61741 d!61833))

(declare-fun bm!24560 () Bool)

(declare-fun call!24563 () Bool)

(assert (=> bm!24560 (= call!24563 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!129603 (mask!11056 thiss!1504)))))

(declare-fun b!258298 () Bool)

(declare-fun e!167417 () Bool)

(assert (=> b!258298 (= e!167417 call!24563)))

(declare-fun b!258299 () Bool)

(declare-fun e!167418 () Bool)

(assert (=> b!258299 (= e!167418 call!24563)))

(declare-fun b!258300 () Bool)

(declare-fun e!167416 () Bool)

(assert (=> b!258300 (= e!167416 e!167417)))

(declare-fun c!43773 () Bool)

(assert (=> b!258300 (= c!43773 (validKeyInArray!0 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!61835 () Bool)

(declare-fun res!126269 () Bool)

(assert (=> d!61835 (=> res!126269 e!167416)))

(assert (=> d!61835 (= res!126269 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(assert (=> d!61835 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129603 (mask!11056 thiss!1504)) e!167416)))

(declare-fun b!258301 () Bool)

(assert (=> b!258301 (= e!167417 e!167418)))

(declare-fun lt!129884 () (_ BitVec 64))

(assert (=> b!258301 (= lt!129884 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!129885 () Unit!7978)

(assert (=> b!258301 (= lt!129885 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129603 lt!129884 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!258301 (arrayContainsKey!0 lt!129603 lt!129884 #b00000000000000000000000000000000)))

(declare-fun lt!129886 () Unit!7978)

(assert (=> b!258301 (= lt!129886 lt!129885)))

(declare-fun res!126268 () Bool)

(assert (=> b!258301 (= res!126268 (= (seekEntryOrOpen!0 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!129603 (mask!11056 thiss!1504)) (Found!1170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!258301 (=> (not res!126268) (not e!167418))))

(assert (= (and d!61835 (not res!126269)) b!258300))

(assert (= (and b!258300 c!43773) b!258301))

(assert (= (and b!258300 (not c!43773)) b!258298))

(assert (= (and b!258301 res!126268) b!258299))

(assert (= (or b!258299 b!258298) bm!24560))

(declare-fun m!273145 () Bool)

(assert (=> bm!24560 m!273145))

(assert (=> b!258300 m!273093))

(assert (=> b!258300 m!273093))

(assert (=> b!258300 m!273121))

(assert (=> b!258301 m!273093))

(declare-fun m!273147 () Bool)

(assert (=> b!258301 m!273147))

(declare-fun m!273149 () Bool)

(assert (=> b!258301 m!273149))

(assert (=> b!258301 m!273093))

(declare-fun m!273151 () Bool)

(assert (=> b!258301 m!273151))

(assert (=> bm!24518 d!61835))

(declare-fun d!61837 () Bool)

(assert (=> d!61837 (= (arrayCountValidKeys!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61837 true))

(declare-fun _$84!36 () Unit!7978)

(assert (=> d!61837 (= (choose!1 (_keys!6929 thiss!1504) index!297 key!932) _$84!36)))

(declare-fun bs!9073 () Bool)

(assert (= bs!9073 d!61837))

(assert (=> bs!9073 m!272675))

(assert (=> bs!9073 m!272881))

(assert (=> bs!9073 m!272653))

(assert (=> d!61747 d!61837))

(assert (=> b!258138 d!61799))

(declare-fun d!61839 () Bool)

(assert (=> d!61839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (mask!11056 thiss!1504))))

(assert (=> d!61839 true))

(declare-fun _$56!33 () Unit!7978)

(assert (=> d!61839 (= (choose!102 key!932 (_keys!6929 thiss!1504) index!297 (mask!11056 thiss!1504)) _$56!33)))

(declare-fun bs!9074 () Bool)

(assert (= bs!9074 d!61839))

(assert (=> bs!9074 m!272675))

(assert (=> bs!9074 m!272929))

(assert (=> d!61765 d!61839))

(assert (=> d!61765 d!61755))

(declare-fun d!61841 () Bool)

(declare-fun res!126274 () Bool)

(declare-fun e!167423 () Bool)

(assert (=> d!61841 (=> res!126274 e!167423)))

(assert (=> d!61841 (= res!126274 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (= (_1!2451 (h!4437 (toList!1907 lt!129600))) key!932)))))

(assert (=> d!61841 (= (containsKey!303 (toList!1907 lt!129600) key!932) e!167423)))

(declare-fun b!258306 () Bool)

(declare-fun e!167424 () Bool)

(assert (=> b!258306 (= e!167423 e!167424)))

(declare-fun res!126275 () Bool)

(assert (=> b!258306 (=> (not res!126275) (not e!167424))))

(assert (=> b!258306 (= res!126275 (and (or (not ((_ is Cons!3775) (toList!1907 lt!129600))) (bvsle (_1!2451 (h!4437 (toList!1907 lt!129600))) key!932)) ((_ is Cons!3775) (toList!1907 lt!129600)) (bvslt (_1!2451 (h!4437 (toList!1907 lt!129600))) key!932)))))

(declare-fun b!258307 () Bool)

(assert (=> b!258307 (= e!167424 (containsKey!303 (t!8833 (toList!1907 lt!129600)) key!932))))

(assert (= (and d!61841 (not res!126274)) b!258306))

(assert (= (and b!258306 res!126275) b!258307))

(declare-fun m!273153 () Bool)

(assert (=> b!258307 m!273153))

(assert (=> d!61781 d!61841))

(declare-fun d!61843 () Bool)

(declare-fun e!167425 () Bool)

(assert (=> d!61843 e!167425))

(declare-fun res!126277 () Bool)

(assert (=> d!61843 (=> (not res!126277) (not e!167425))))

(declare-fun lt!129889 () ListLongMap!3783)

(assert (=> d!61843 (= res!126277 (contains!1857 lt!129889 (_1!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))))))

(declare-fun lt!129890 () List!3779)

(assert (=> d!61843 (= lt!129889 (ListLongMap!3784 lt!129890))))

(declare-fun lt!129887 () Unit!7978)

(declare-fun lt!129888 () Unit!7978)

(assert (=> d!61843 (= lt!129887 lt!129888)))

(assert (=> d!61843 (= (getValueByKey!311 lt!129890 (_1!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))))))

(assert (=> d!61843 (= lt!129888 (lemmaContainsTupThenGetReturnValue!170 lt!129890 (_1!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))))))

(assert (=> d!61843 (= lt!129890 (insertStrictlySorted!173 (toList!1907 lt!129805) (_1!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))))))

(assert (=> d!61843 (= (+!695 lt!129805 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) lt!129889)))

(declare-fun b!258308 () Bool)

(declare-fun res!126276 () Bool)

(assert (=> b!258308 (=> (not res!126276) (not e!167425))))

(assert (=> b!258308 (= res!126276 (= (getValueByKey!311 (toList!1907 lt!129889) (_1!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))))))))

(declare-fun b!258309 () Bool)

(assert (=> b!258309 (= e!167425 (contains!1860 (toList!1907 lt!129889) (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))))))

(assert (= (and d!61843 res!126277) b!258308))

(assert (= (and b!258308 res!126276) b!258309))

(declare-fun m!273155 () Bool)

(assert (=> d!61843 m!273155))

(declare-fun m!273157 () Bool)

(assert (=> d!61843 m!273157))

(declare-fun m!273159 () Bool)

(assert (=> d!61843 m!273159))

(declare-fun m!273161 () Bool)

(assert (=> d!61843 m!273161))

(declare-fun m!273163 () Bool)

(assert (=> b!258308 m!273163))

(declare-fun m!273165 () Bool)

(assert (=> b!258309 m!273165))

(assert (=> b!258129 d!61843))

(declare-fun d!61845 () Bool)

(declare-fun e!167426 () Bool)

(assert (=> d!61845 e!167426))

(declare-fun res!126279 () Bool)

(assert (=> d!61845 (=> (not res!126279) (not e!167426))))

(declare-fun lt!129893 () ListLongMap!3783)

(assert (=> d!61845 (= res!126279 (contains!1857 lt!129893 (_1!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!129894 () List!3779)

(assert (=> d!61845 (= lt!129893 (ListLongMap!3784 lt!129894))))

(declare-fun lt!129891 () Unit!7978)

(declare-fun lt!129892 () Unit!7978)

(assert (=> d!61845 (= lt!129891 lt!129892)))

(assert (=> d!61845 (= (getValueByKey!311 lt!129894 (_1!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61845 (= lt!129892 (lemmaContainsTupThenGetReturnValue!170 lt!129894 (_1!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61845 (= lt!129894 (insertStrictlySorted!173 (toList!1907 lt!129811) (_1!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61845 (= (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) lt!129893)))

(declare-fun b!258310 () Bool)

(declare-fun res!126278 () Bool)

(assert (=> b!258310 (=> (not res!126278) (not e!167426))))

(assert (=> b!258310 (= res!126278 (= (getValueByKey!311 (toList!1907 lt!129893) (_1!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258311 () Bool)

(assert (=> b!258311 (= e!167426 (contains!1860 (toList!1907 lt!129893) (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!61845 res!126279) b!258310))

(assert (= (and b!258310 res!126278) b!258311))

(declare-fun m!273167 () Bool)

(assert (=> d!61845 m!273167))

(declare-fun m!273169 () Bool)

(assert (=> d!61845 m!273169))

(declare-fun m!273171 () Bool)

(assert (=> d!61845 m!273171))

(declare-fun m!273173 () Bool)

(assert (=> d!61845 m!273173))

(declare-fun m!273175 () Bool)

(assert (=> b!258310 m!273175))

(declare-fun m!273177 () Bool)

(assert (=> b!258311 m!273177))

(assert (=> b!258129 d!61845))

(declare-fun b!258337 () Bool)

(assert (=> b!258337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(assert (=> b!258337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))))))))

(declare-fun e!167447 () Bool)

(declare-fun lt!129915 () ListLongMap!3783)

(assert (=> b!258337 (= e!167447 (= (apply!255 lt!129915 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258338 () Bool)

(declare-fun e!167444 () Bool)

(assert (=> b!258338 (= e!167444 e!167447)))

(assert (=> b!258338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun res!126290 () Bool)

(assert (=> b!258338 (= res!126290 (contains!1857 lt!129915 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> b!258338 (=> (not res!126290) (not e!167447))))

(declare-fun b!258339 () Bool)

(declare-fun e!167445 () ListLongMap!3783)

(declare-fun call!24566 () ListLongMap!3783)

(assert (=> b!258339 (= e!167445 call!24566)))

(declare-fun b!258340 () Bool)

(declare-fun e!167442 () ListLongMap!3783)

(assert (=> b!258340 (= e!167442 (ListLongMap!3784 Nil!3776))))

(declare-fun b!258341 () Bool)

(declare-fun res!126289 () Bool)

(declare-fun e!167443 () Bool)

(assert (=> b!258341 (=> (not res!126289) (not e!167443))))

(assert (=> b!258341 (= res!126289 (not (contains!1857 lt!129915 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!24563 () Bool)

(assert (=> bm!24563 (= call!24566 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258342 () Bool)

(declare-fun e!167446 () Bool)

(assert (=> b!258342 (= e!167446 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> b!258342 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258343 () Bool)

(assert (=> b!258343 (= e!167442 e!167445)))

(declare-fun c!43785 () Bool)

(assert (=> b!258343 (= c!43785 (validKeyInArray!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258344 () Bool)

(assert (=> b!258344 (= e!167443 e!167444)))

(declare-fun c!43783 () Bool)

(assert (=> b!258344 (= c!43783 e!167446)))

(declare-fun res!126291 () Bool)

(assert (=> b!258344 (=> (not res!126291) (not e!167446))))

(assert (=> b!258344 (= res!126291 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun b!258345 () Bool)

(declare-fun e!167441 () Bool)

(assert (=> b!258345 (= e!167444 e!167441)))

(declare-fun c!43784 () Bool)

(assert (=> b!258345 (= c!43784 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(declare-fun d!61847 () Bool)

(assert (=> d!61847 e!167443))

(declare-fun res!126288 () Bool)

(assert (=> d!61847 (=> (not res!126288) (not e!167443))))

(assert (=> d!61847 (= res!126288 (not (contains!1857 lt!129915 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61847 (= lt!129915 e!167442)))

(declare-fun c!43782 () Bool)

(assert (=> d!61847 (= c!43782 (bvsge #b00000000000000000000000000000000 (size!6286 lt!129603)))))

(assert (=> d!61847 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61847 (= (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!129915)))

(declare-fun b!258336 () Bool)

(assert (=> b!258336 (= e!167441 (= lt!129915 (getCurrentListMapNoExtraKeys!571 lt!129603 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504))))))

(declare-fun b!258346 () Bool)

(declare-fun lt!129912 () Unit!7978)

(declare-fun lt!129909 () Unit!7978)

(assert (=> b!258346 (= lt!129912 lt!129909)))

(declare-fun lt!129914 () (_ BitVec 64))

(declare-fun lt!129913 () ListLongMap!3783)

(declare-fun lt!129911 () (_ BitVec 64))

(declare-fun lt!129910 () V!8449)

(assert (=> b!258346 (not (contains!1857 (+!695 lt!129913 (tuple2!4881 lt!129914 lt!129910)) lt!129911))))

(declare-fun addStillNotContains!126 (ListLongMap!3783 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7978)

(assert (=> b!258346 (= lt!129909 (addStillNotContains!126 lt!129913 lt!129914 lt!129910 lt!129911))))

(assert (=> b!258346 (= lt!129911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258346 (= lt!129910 (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258346 (= lt!129914 (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))

(assert (=> b!258346 (= lt!129913 call!24566)))

(assert (=> b!258346 (= e!167445 (+!695 call!24566 (tuple2!4881 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258347 () Bool)

(declare-fun isEmpty!537 (ListLongMap!3783) Bool)

(assert (=> b!258347 (= e!167441 (isEmpty!537 lt!129915))))

(assert (= (and d!61847 c!43782) b!258340))

(assert (= (and d!61847 (not c!43782)) b!258343))

(assert (= (and b!258343 c!43785) b!258346))

(assert (= (and b!258343 (not c!43785)) b!258339))

(assert (= (or b!258346 b!258339) bm!24563))

(assert (= (and d!61847 res!126288) b!258341))

(assert (= (and b!258341 res!126289) b!258344))

(assert (= (and b!258344 res!126291) b!258342))

(assert (= (and b!258344 c!43783) b!258338))

(assert (= (and b!258344 (not c!43783)) b!258345))

(assert (= (and b!258338 res!126290) b!258337))

(assert (= (and b!258345 c!43784) b!258336))

(assert (= (and b!258345 (not c!43784)) b!258347))

(declare-fun b_lambda!8185 () Bool)

(assert (=> (not b_lambda!8185) (not b!258337)))

(assert (=> b!258337 t!8838))

(declare-fun b_and!13797 () Bool)

(assert (= b_and!13795 (and (=> t!8838 result!5383) b_and!13797)))

(declare-fun b_lambda!8187 () Bool)

(assert (=> (not b_lambda!8187) (not b!258346)))

(assert (=> b!258346 t!8838))

(declare-fun b_and!13799 () Bool)

(assert (= b_and!13797 (and (=> t!8838 result!5383) b_and!13799)))

(assert (=> b!258337 m!272871))

(assert (=> b!258337 m!272871))

(declare-fun m!273179 () Bool)

(assert (=> b!258337 m!273179))

(assert (=> b!258337 m!272933))

(assert (=> b!258337 m!272933))

(assert (=> b!258337 m!272935))

(assert (=> b!258337 m!272937))

(assert (=> b!258337 m!272935))

(assert (=> b!258342 m!272871))

(assert (=> b!258342 m!272871))

(assert (=> b!258342 m!272877))

(declare-fun m!273181 () Bool)

(assert (=> b!258341 m!273181))

(declare-fun m!273183 () Bool)

(assert (=> d!61847 m!273183))

(assert (=> d!61847 m!272641))

(assert (=> b!258338 m!272871))

(assert (=> b!258338 m!272871))

(declare-fun m!273185 () Bool)

(assert (=> b!258338 m!273185))

(declare-fun m!273187 () Bool)

(assert (=> b!258347 m!273187))

(assert (=> b!258343 m!272871))

(assert (=> b!258343 m!272871))

(assert (=> b!258343 m!272877))

(assert (=> b!258346 m!272871))

(assert (=> b!258346 m!272933))

(assert (=> b!258346 m!272933))

(assert (=> b!258346 m!272935))

(assert (=> b!258346 m!272937))

(declare-fun m!273189 () Bool)

(assert (=> b!258346 m!273189))

(assert (=> b!258346 m!272935))

(assert (=> b!258346 m!273189))

(declare-fun m!273191 () Bool)

(assert (=> b!258346 m!273191))

(declare-fun m!273193 () Bool)

(assert (=> b!258346 m!273193))

(declare-fun m!273195 () Bool)

(assert (=> b!258346 m!273195))

(declare-fun m!273197 () Bool)

(assert (=> bm!24563 m!273197))

(assert (=> b!258336 m!273197))

(assert (=> b!258129 d!61847))

(declare-fun d!61849 () Bool)

(assert (=> d!61849 (= (apply!255 lt!129805 lt!129796) (get!3051 (getValueByKey!311 (toList!1907 lt!129805) lt!129796)))))

(declare-fun bs!9075 () Bool)

(assert (= bs!9075 d!61849))

(declare-fun m!273199 () Bool)

(assert (=> bs!9075 m!273199))

(assert (=> bs!9075 m!273199))

(declare-fun m!273201 () Bool)

(assert (=> bs!9075 m!273201))

(assert (=> b!258129 d!61849))

(declare-fun d!61851 () Bool)

(declare-fun e!167448 () Bool)

(assert (=> d!61851 e!167448))

(declare-fun res!126293 () Bool)

(assert (=> d!61851 (=> (not res!126293) (not e!167448))))

(declare-fun lt!129918 () ListLongMap!3783)

(assert (=> d!61851 (= res!126293 (contains!1857 lt!129918 (_1!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!129919 () List!3779)

(assert (=> d!61851 (= lt!129918 (ListLongMap!3784 lt!129919))))

(declare-fun lt!129916 () Unit!7978)

(declare-fun lt!129917 () Unit!7978)

(assert (=> d!61851 (= lt!129916 lt!129917)))

(assert (=> d!61851 (= (getValueByKey!311 lt!129919 (_1!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61851 (= lt!129917 (lemmaContainsTupThenGetReturnValue!170 lt!129919 (_1!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61851 (= lt!129919 (insertStrictlySorted!173 (toList!1907 lt!129809) (_1!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61851 (= (+!695 lt!129809 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) lt!129918)))

(declare-fun b!258348 () Bool)

(declare-fun res!126292 () Bool)

(assert (=> b!258348 (=> (not res!126292) (not e!167448))))

(assert (=> b!258348 (= res!126292 (= (getValueByKey!311 (toList!1907 lt!129918) (_1!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258349 () Bool)

(assert (=> b!258349 (= e!167448 (contains!1860 (toList!1907 lt!129918) (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!61851 res!126293) b!258348))

(assert (= (and b!258348 res!126292) b!258349))

(declare-fun m!273203 () Bool)

(assert (=> d!61851 m!273203))

(declare-fun m!273205 () Bool)

(assert (=> d!61851 m!273205))

(declare-fun m!273207 () Bool)

(assert (=> d!61851 m!273207))

(declare-fun m!273209 () Bool)

(assert (=> d!61851 m!273209))

(declare-fun m!273211 () Bool)

(assert (=> b!258348 m!273211))

(declare-fun m!273213 () Bool)

(assert (=> b!258349 m!273213))

(assert (=> b!258129 d!61851))

(declare-fun d!61853 () Bool)

(declare-fun e!167450 () Bool)

(assert (=> d!61853 e!167450))

(declare-fun res!126294 () Bool)

(assert (=> d!61853 (=> res!126294 e!167450)))

(declare-fun lt!129920 () Bool)

(assert (=> d!61853 (= res!126294 (not lt!129920))))

(declare-fun lt!129922 () Bool)

(assert (=> d!61853 (= lt!129920 lt!129922)))

(declare-fun lt!129921 () Unit!7978)

(declare-fun e!167449 () Unit!7978)

(assert (=> d!61853 (= lt!129921 e!167449)))

(declare-fun c!43786 () Bool)

(assert (=> d!61853 (= c!43786 lt!129922)))

(assert (=> d!61853 (= lt!129922 (containsKey!303 (toList!1907 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) lt!129802))))

(assert (=> d!61853 (= (contains!1857 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) lt!129802) lt!129920)))

(declare-fun b!258350 () Bool)

(declare-fun lt!129923 () Unit!7978)

(assert (=> b!258350 (= e!167449 lt!129923)))

(assert (=> b!258350 (= lt!129923 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) lt!129802))))

(assert (=> b!258350 (isDefined!253 (getValueByKey!311 (toList!1907 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) lt!129802))))

(declare-fun b!258351 () Bool)

(declare-fun Unit!7993 () Unit!7978)

(assert (=> b!258351 (= e!167449 Unit!7993)))

(declare-fun b!258352 () Bool)

(assert (=> b!258352 (= e!167450 (isDefined!253 (getValueByKey!311 (toList!1907 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504)))) lt!129802)))))

(assert (= (and d!61853 c!43786) b!258350))

(assert (= (and d!61853 (not c!43786)) b!258351))

(assert (= (and d!61853 (not res!126294)) b!258352))

(declare-fun m!273215 () Bool)

(assert (=> d!61853 m!273215))

(declare-fun m!273217 () Bool)

(assert (=> b!258350 m!273217))

(declare-fun m!273219 () Bool)

(assert (=> b!258350 m!273219))

(assert (=> b!258350 m!273219))

(declare-fun m!273221 () Bool)

(assert (=> b!258350 m!273221))

(assert (=> b!258352 m!273219))

(assert (=> b!258352 m!273219))

(assert (=> b!258352 m!273221))

(assert (=> b!258129 d!61853))

(declare-fun d!61855 () Bool)

(assert (=> d!61855 (= (apply!255 (+!695 lt!129800 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) lt!129808) (apply!255 lt!129800 lt!129808))))

(declare-fun lt!129926 () Unit!7978)

(declare-fun choose!1256 (ListLongMap!3783 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7978)

(assert (=> d!61855 (= lt!129926 (choose!1256 lt!129800 lt!129795 (minValue!4601 thiss!1504) lt!129808))))

(declare-fun e!167453 () Bool)

(assert (=> d!61855 e!167453))

(declare-fun res!126297 () Bool)

(assert (=> d!61855 (=> (not res!126297) (not e!167453))))

(assert (=> d!61855 (= res!126297 (contains!1857 lt!129800 lt!129808))))

(assert (=> d!61855 (= (addApplyDifferent!231 lt!129800 lt!129795 (minValue!4601 thiss!1504) lt!129808) lt!129926)))

(declare-fun b!258356 () Bool)

(assert (=> b!258356 (= e!167453 (not (= lt!129808 lt!129795)))))

(assert (= (and d!61855 res!126297) b!258356))

(declare-fun m!273223 () Bool)

(assert (=> d!61855 m!273223))

(assert (=> d!61855 m!272957))

(assert (=> d!61855 m!272941))

(assert (=> d!61855 m!272971))

(assert (=> d!61855 m!272941))

(declare-fun m!273225 () Bool)

(assert (=> d!61855 m!273225))

(assert (=> b!258129 d!61855))

(declare-fun d!61857 () Bool)

(assert (=> d!61857 (= (apply!255 lt!129800 lt!129808) (get!3051 (getValueByKey!311 (toList!1907 lt!129800) lt!129808)))))

(declare-fun bs!9076 () Bool)

(assert (= bs!9076 d!61857))

(declare-fun m!273227 () Bool)

(assert (=> bs!9076 m!273227))

(assert (=> bs!9076 m!273227))

(declare-fun m!273229 () Bool)

(assert (=> bs!9076 m!273229))

(assert (=> b!258129 d!61857))

(declare-fun d!61859 () Bool)

(assert (=> d!61859 (contains!1857 (+!695 lt!129811 (tuple2!4881 lt!129798 (zeroValue!4601 thiss!1504))) lt!129802)))

(declare-fun lt!129929 () Unit!7978)

(declare-fun choose!1257 (ListLongMap!3783 (_ BitVec 64) V!8449 (_ BitVec 64)) Unit!7978)

(assert (=> d!61859 (= lt!129929 (choose!1257 lt!129811 lt!129798 (zeroValue!4601 thiss!1504) lt!129802))))

(assert (=> d!61859 (contains!1857 lt!129811 lt!129802)))

(assert (=> d!61859 (= (addStillContains!231 lt!129811 lt!129798 (zeroValue!4601 thiss!1504) lt!129802) lt!129929)))

(declare-fun bs!9077 () Bool)

(assert (= bs!9077 d!61859))

(assert (=> bs!9077 m!272961))

(assert (=> bs!9077 m!272961))

(assert (=> bs!9077 m!272969))

(declare-fun m!273231 () Bool)

(assert (=> bs!9077 m!273231))

(declare-fun m!273233 () Bool)

(assert (=> bs!9077 m!273233))

(assert (=> b!258129 d!61859))

(declare-fun d!61861 () Bool)

(declare-fun e!167454 () Bool)

(assert (=> d!61861 e!167454))

(declare-fun res!126299 () Bool)

(assert (=> d!61861 (=> (not res!126299) (not e!167454))))

(declare-fun lt!129932 () ListLongMap!3783)

(assert (=> d!61861 (= res!126299 (contains!1857 lt!129932 (_1!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))))))

(declare-fun lt!129933 () List!3779)

(assert (=> d!61861 (= lt!129932 (ListLongMap!3784 lt!129933))))

(declare-fun lt!129930 () Unit!7978)

(declare-fun lt!129931 () Unit!7978)

(assert (=> d!61861 (= lt!129930 lt!129931)))

(assert (=> d!61861 (= (getValueByKey!311 lt!129933 (_1!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))))))

(assert (=> d!61861 (= lt!129931 (lemmaContainsTupThenGetReturnValue!170 lt!129933 (_1!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))))))

(assert (=> d!61861 (= lt!129933 (insertStrictlySorted!173 (toList!1907 lt!129800) (_1!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))))))

(assert (=> d!61861 (= (+!695 lt!129800 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) lt!129932)))

(declare-fun b!258358 () Bool)

(declare-fun res!126298 () Bool)

(assert (=> b!258358 (=> (not res!126298) (not e!167454))))

(assert (=> b!258358 (= res!126298 (= (getValueByKey!311 (toList!1907 lt!129932) (_1!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))))))))

(declare-fun b!258359 () Bool)

(assert (=> b!258359 (= e!167454 (contains!1860 (toList!1907 lt!129932) (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))))))

(assert (= (and d!61861 res!126299) b!258358))

(assert (= (and b!258358 res!126298) b!258359))

(declare-fun m!273235 () Bool)

(assert (=> d!61861 m!273235))

(declare-fun m!273237 () Bool)

(assert (=> d!61861 m!273237))

(declare-fun m!273239 () Bool)

(assert (=> d!61861 m!273239))

(declare-fun m!273241 () Bool)

(assert (=> d!61861 m!273241))

(declare-fun m!273243 () Bool)

(assert (=> b!258358 m!273243))

(declare-fun m!273245 () Bool)

(assert (=> b!258359 m!273245))

(assert (=> b!258129 d!61861))

(declare-fun d!61863 () Bool)

(assert (=> d!61863 (= (apply!255 (+!695 lt!129800 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504))) lt!129808) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129800 (tuple2!4881 lt!129795 (minValue!4601 thiss!1504)))) lt!129808)))))

(declare-fun bs!9078 () Bool)

(assert (= bs!9078 d!61863))

(declare-fun m!273247 () Bool)

(assert (=> bs!9078 m!273247))

(assert (=> bs!9078 m!273247))

(declare-fun m!273249 () Bool)

(assert (=> bs!9078 m!273249))

(assert (=> b!258129 d!61863))

(declare-fun d!61865 () Bool)

(assert (=> d!61865 (= (apply!255 (+!695 lt!129805 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) lt!129796) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129805 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504)))) lt!129796)))))

(declare-fun bs!9079 () Bool)

(assert (= bs!9079 d!61865))

(declare-fun m!273251 () Bool)

(assert (=> bs!9079 m!273251))

(assert (=> bs!9079 m!273251))

(declare-fun m!273253 () Bool)

(assert (=> bs!9079 m!273253))

(assert (=> b!258129 d!61865))

(declare-fun d!61867 () Bool)

(assert (=> d!61867 (= (apply!255 (+!695 lt!129809 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) lt!129794) (apply!255 lt!129809 lt!129794))))

(declare-fun lt!129934 () Unit!7978)

(assert (=> d!61867 (= lt!129934 (choose!1256 lt!129809 lt!129813 (zeroValue!4601 thiss!1504) lt!129794))))

(declare-fun e!167455 () Bool)

(assert (=> d!61867 e!167455))

(declare-fun res!126300 () Bool)

(assert (=> d!61867 (=> (not res!126300) (not e!167455))))

(assert (=> d!61867 (= res!126300 (contains!1857 lt!129809 lt!129794))))

(assert (=> d!61867 (= (addApplyDifferent!231 lt!129809 lt!129813 (zeroValue!4601 thiss!1504) lt!129794) lt!129934)))

(declare-fun b!258360 () Bool)

(assert (=> b!258360 (= e!167455 (not (= lt!129794 lt!129813)))))

(assert (= (and d!61867 res!126300) b!258360))

(declare-fun m!273255 () Bool)

(assert (=> d!61867 m!273255))

(assert (=> d!61867 m!272965))

(assert (=> d!61867 m!272951))

(assert (=> d!61867 m!272967))

(assert (=> d!61867 m!272951))

(declare-fun m!273257 () Bool)

(assert (=> d!61867 m!273257))

(assert (=> b!258129 d!61867))

(declare-fun d!61869 () Bool)

(assert (=> d!61869 (= (apply!255 (+!695 lt!129809 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504))) lt!129794) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129809 (tuple2!4881 lt!129813 (zeroValue!4601 thiss!1504)))) lt!129794)))))

(declare-fun bs!9080 () Bool)

(assert (= bs!9080 d!61869))

(declare-fun m!273259 () Bool)

(assert (=> bs!9080 m!273259))

(assert (=> bs!9080 m!273259))

(declare-fun m!273261 () Bool)

(assert (=> bs!9080 m!273261))

(assert (=> b!258129 d!61869))

(declare-fun d!61871 () Bool)

(assert (=> d!61871 (= (apply!255 lt!129809 lt!129794) (get!3051 (getValueByKey!311 (toList!1907 lt!129809) lt!129794)))))

(declare-fun bs!9081 () Bool)

(assert (= bs!9081 d!61871))

(declare-fun m!273263 () Bool)

(assert (=> bs!9081 m!273263))

(assert (=> bs!9081 m!273263))

(declare-fun m!273265 () Bool)

(assert (=> bs!9081 m!273265))

(assert (=> b!258129 d!61871))

(declare-fun d!61873 () Bool)

(assert (=> d!61873 (= (apply!255 (+!695 lt!129805 (tuple2!4881 lt!129812 (minValue!4601 thiss!1504))) lt!129796) (apply!255 lt!129805 lt!129796))))

(declare-fun lt!129935 () Unit!7978)

(assert (=> d!61873 (= lt!129935 (choose!1256 lt!129805 lt!129812 (minValue!4601 thiss!1504) lt!129796))))

(declare-fun e!167456 () Bool)

(assert (=> d!61873 e!167456))

(declare-fun res!126301 () Bool)

(assert (=> d!61873 (=> (not res!126301) (not e!167456))))

(assert (=> d!61873 (= res!126301 (contains!1857 lt!129805 lt!129796))))

(assert (=> d!61873 (= (addApplyDifferent!231 lt!129805 lt!129812 (minValue!4601 thiss!1504) lt!129796) lt!129935)))

(declare-fun b!258361 () Bool)

(assert (=> b!258361 (= e!167456 (not (= lt!129796 lt!129812)))))

(assert (= (and d!61873 res!126301) b!258361))

(declare-fun m!273267 () Bool)

(assert (=> d!61873 m!273267))

(assert (=> d!61873 m!272947))

(assert (=> d!61873 m!272953))

(assert (=> d!61873 m!272955))

(assert (=> d!61873 m!272953))

(declare-fun m!273269 () Bool)

(assert (=> d!61873 m!273269))

(assert (=> b!258129 d!61873))

(declare-fun b!258380 () Bool)

(declare-fun e!167469 () SeekEntryResult!1170)

(assert (=> b!258380 (= e!167469 (Intermediate!1170 false (toIndex!0 key!932 (mask!11056 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!258381 () Bool)

(declare-fun e!167470 () SeekEntryResult!1170)

(assert (=> b!258381 (= e!167470 (Intermediate!1170 true (toIndex!0 key!932 (mask!11056 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!61875 () Bool)

(declare-fun e!167471 () Bool)

(assert (=> d!61875 e!167471))

(declare-fun c!43795 () Bool)

(declare-fun lt!129940 () SeekEntryResult!1170)

(assert (=> d!61875 (= c!43795 (and ((_ is Intermediate!1170) lt!129940) (undefined!1982 lt!129940)))))

(assert (=> d!61875 (= lt!129940 e!167470)))

(declare-fun c!43793 () Bool)

(assert (=> d!61875 (= c!43793 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!129941 () (_ BitVec 64))

(assert (=> d!61875 (= lt!129941 (select (arr!5938 (_keys!6929 thiss!1504)) (toIndex!0 key!932 (mask!11056 thiss!1504))))))

(assert (=> d!61875 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11056 thiss!1504)) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)) lt!129940)))

(declare-fun b!258382 () Bool)

(declare-fun e!167468 () Bool)

(assert (=> b!258382 (= e!167471 e!167468)))

(declare-fun res!126308 () Bool)

(assert (=> b!258382 (= res!126308 (and ((_ is Intermediate!1170) lt!129940) (not (undefined!1982 lt!129940)) (bvslt (x!25037 lt!129940) #b01111111111111111111111111111110) (bvsge (x!25037 lt!129940) #b00000000000000000000000000000000) (bvsge (x!25037 lt!129940) #b00000000000000000000000000000000)))))

(assert (=> b!258382 (=> (not res!126308) (not e!167468))))

(declare-fun b!258383 () Bool)

(assert (=> b!258383 (= e!167470 e!167469)))

(declare-fun c!43794 () Bool)

(assert (=> b!258383 (= c!43794 (or (= lt!129941 key!932) (= (bvadd lt!129941 lt!129941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258384 () Bool)

(assert (=> b!258384 (and (bvsge (index!6852 lt!129940) #b00000000000000000000000000000000) (bvslt (index!6852 lt!129940) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun e!167467 () Bool)

(assert (=> b!258384 (= e!167467 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6852 lt!129940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258385 () Bool)

(assert (=> b!258385 (and (bvsge (index!6852 lt!129940) #b00000000000000000000000000000000) (bvslt (index!6852 lt!129940) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun res!126309 () Bool)

(assert (=> b!258385 (= res!126309 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6852 lt!129940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258385 (=> res!126309 e!167467)))

(declare-fun b!258386 () Bool)

(assert (=> b!258386 (and (bvsge (index!6852 lt!129940) #b00000000000000000000000000000000) (bvslt (index!6852 lt!129940) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun res!126310 () Bool)

(assert (=> b!258386 (= res!126310 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6852 lt!129940)) key!932))))

(assert (=> b!258386 (=> res!126310 e!167467)))

(assert (=> b!258386 (= e!167468 e!167467)))

(declare-fun b!258387 () Bool)

(assert (=> b!258387 (= e!167469 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11056 thiss!1504)) #b00000000000000000000000000000000 (mask!11056 thiss!1504)) key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!258388 () Bool)

(assert (=> b!258388 (= e!167471 (bvsge (x!25037 lt!129940) #b01111111111111111111111111111110))))

(assert (= (and d!61875 c!43793) b!258381))

(assert (= (and d!61875 (not c!43793)) b!258383))

(assert (= (and b!258383 c!43794) b!258380))

(assert (= (and b!258383 (not c!43794)) b!258387))

(assert (= (and d!61875 c!43795) b!258388))

(assert (= (and d!61875 (not c!43795)) b!258382))

(assert (= (and b!258382 res!126308) b!258386))

(assert (= (and b!258386 (not res!126310)) b!258385))

(assert (= (and b!258385 (not res!126309)) b!258384))

(assert (=> b!258387 m!272833))

(declare-fun m!273271 () Bool)

(assert (=> b!258387 m!273271))

(assert (=> b!258387 m!273271))

(declare-fun m!273273 () Bool)

(assert (=> b!258387 m!273273))

(declare-fun m!273275 () Bool)

(assert (=> b!258385 m!273275))

(assert (=> d!61875 m!272833))

(declare-fun m!273277 () Bool)

(assert (=> d!61875 m!273277))

(assert (=> d!61875 m!272641))

(assert (=> b!258384 m!273275))

(assert (=> b!258386 m!273275))

(assert (=> d!61731 d!61875))

(declare-fun d!61877 () Bool)

(declare-fun lt!129947 () (_ BitVec 32))

(declare-fun lt!129946 () (_ BitVec 32))

(assert (=> d!61877 (= lt!129947 (bvmul (bvxor lt!129946 (bvlshr lt!129946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61877 (= lt!129946 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61877 (and (bvsge (mask!11056 thiss!1504) #b00000000000000000000000000000000) (let ((res!126311 (let ((h!4441 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25056 (bvmul (bvxor h!4441 (bvlshr h!4441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25056 (bvlshr x!25056 #b00000000000000000000000000001101)) (mask!11056 thiss!1504)))))) (and (bvslt res!126311 (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126311 #b00000000000000000000000000000000))))))

(assert (=> d!61877 (= (toIndex!0 key!932 (mask!11056 thiss!1504)) (bvand (bvxor lt!129947 (bvlshr lt!129947 #b00000000000000000000000000001101)) (mask!11056 thiss!1504)))))

(assert (=> d!61731 d!61877))

(assert (=> d!61731 d!61755))

(declare-fun d!61879 () Bool)

(declare-fun e!167472 () Bool)

(assert (=> d!61879 e!167472))

(declare-fun res!126313 () Bool)

(assert (=> d!61879 (=> (not res!126313) (not e!167472))))

(declare-fun lt!129950 () ListLongMap!3783)

(assert (=> d!61879 (= res!126313 (contains!1857 lt!129950 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun lt!129951 () List!3779)

(assert (=> d!61879 (= lt!129950 (ListLongMap!3784 lt!129951))))

(declare-fun lt!129948 () Unit!7978)

(declare-fun lt!129949 () Unit!7978)

(assert (=> d!61879 (= lt!129948 lt!129949)))

(assert (=> d!61879 (= (getValueByKey!311 lt!129951 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61879 (= lt!129949 (lemmaContainsTupThenGetReturnValue!170 lt!129951 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61879 (= lt!129951 (insertStrictlySorted!173 (toList!1907 call!24546) (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61879 (= (+!695 call!24546 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) lt!129950)))

(declare-fun b!258389 () Bool)

(declare-fun res!126312 () Bool)

(assert (=> b!258389 (=> (not res!126312) (not e!167472))))

(assert (=> b!258389 (= res!126312 (= (getValueByKey!311 (toList!1907 lt!129950) (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun b!258390 () Bool)

(assert (=> b!258390 (= e!167472 (contains!1860 (toList!1907 lt!129950) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(assert (= (and d!61879 res!126313) b!258389))

(assert (= (and b!258389 res!126312) b!258390))

(declare-fun m!273279 () Bool)

(assert (=> d!61879 m!273279))

(declare-fun m!273281 () Bool)

(assert (=> d!61879 m!273281))

(declare-fun m!273283 () Bool)

(assert (=> d!61879 m!273283))

(declare-fun m!273285 () Bool)

(assert (=> d!61879 m!273285))

(declare-fun m!273287 () Bool)

(assert (=> b!258389 m!273287))

(declare-fun m!273289 () Bool)

(assert (=> b!258390 m!273289))

(assert (=> b!258168 d!61879))

(declare-fun d!61881 () Bool)

(declare-fun e!167474 () Bool)

(assert (=> d!61881 e!167474))

(declare-fun res!126314 () Bool)

(assert (=> d!61881 (=> res!126314 e!167474)))

(declare-fun lt!129952 () Bool)

(assert (=> d!61881 (= res!126314 (not lt!129952))))

(declare-fun lt!129954 () Bool)

(assert (=> d!61881 (= lt!129952 lt!129954)))

(declare-fun lt!129953 () Unit!7978)

(declare-fun e!167473 () Unit!7978)

(assert (=> d!61881 (= lt!129953 e!167473)))

(declare-fun c!43796 () Bool)

(assert (=> d!61881 (= c!43796 lt!129954)))

(assert (=> d!61881 (= lt!129954 (containsKey!303 (toList!1907 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(assert (=> d!61881 (= (contains!1857 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932) lt!129952)))

(declare-fun b!258391 () Bool)

(declare-fun lt!129955 () Unit!7978)

(assert (=> b!258391 (= e!167473 lt!129955)))

(assert (=> b!258391 (= lt!129955 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(assert (=> b!258391 (isDefined!253 (getValueByKey!311 (toList!1907 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932))))

(declare-fun b!258392 () Bool)

(declare-fun Unit!7994 () Unit!7978)

(assert (=> b!258392 (= e!167473 Unit!7994)))

(declare-fun b!258393 () Bool)

(assert (=> b!258393 (= e!167474 (isDefined!253 (getValueByKey!311 (toList!1907 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) key!932)))))

(assert (= (and d!61881 c!43796) b!258391))

(assert (= (and d!61881 (not c!43796)) b!258392))

(assert (= (and d!61881 (not res!126314)) b!258393))

(declare-fun m!273291 () Bool)

(assert (=> d!61881 m!273291))

(declare-fun m!273293 () Bool)

(assert (=> b!258391 m!273293))

(declare-fun m!273295 () Bool)

(assert (=> b!258391 m!273295))

(assert (=> b!258391 m!273295))

(declare-fun m!273297 () Bool)

(assert (=> b!258391 m!273297))

(assert (=> b!258393 m!273295))

(assert (=> b!258393 m!273295))

(assert (=> b!258393 m!273297))

(assert (=> d!61777 d!61881))

(assert (=> d!61777 d!61783))

(declare-fun d!61883 () Bool)

(assert (=> d!61883 (contains!1857 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) key!932)))

(assert (=> d!61883 true))

(declare-fun _$17!83 () Unit!7978)

(assert (=> d!61883 (= (choose!1254 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) _$17!83)))

(declare-fun bs!9082 () Bool)

(assert (= bs!9082 d!61883))

(assert (=> bs!9082 m!272697))

(assert (=> bs!9082 m!272697))

(assert (=> bs!9082 m!272995))

(assert (=> d!61777 d!61883))

(assert (=> d!61777 d!61755))

(declare-fun b!258395 () Bool)

(declare-fun e!167476 () (_ BitVec 32))

(assert (=> b!258395 (= e!167476 #b00000000000000000000000000000000)))

(declare-fun b!258396 () Bool)

(declare-fun e!167475 () (_ BitVec 32))

(declare-fun call!24567 () (_ BitVec 32))

(assert (=> b!258396 (= e!167475 call!24567)))

(declare-fun b!258394 () Bool)

(assert (=> b!258394 (= e!167476 e!167475)))

(declare-fun c!43797 () Bool)

(assert (=> b!258394 (= c!43797 (validKeyInArray!0 (select (arr!5938 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!61885 () Bool)

(declare-fun lt!129956 () (_ BitVec 32))

(assert (=> d!61885 (and (bvsge lt!129956 #b00000000000000000000000000000000) (bvsle lt!129956 (bvsub (size!6286 lt!129603) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61885 (= lt!129956 e!167476)))

(declare-fun c!43798 () Bool)

(assert (=> d!61885 (= c!43798 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61885 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6929 thiss!1504)) (size!6286 lt!129603)))))

(assert (=> d!61885 (= (arrayCountValidKeys!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))) lt!129956)))

(declare-fun b!258397 () Bool)

(assert (=> b!258397 (= e!167475 (bvadd #b00000000000000000000000000000001 call!24567))))

(declare-fun bm!24564 () Bool)

(assert (=> bm!24564 (= call!24567 (arrayCountValidKeys!0 lt!129603 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(assert (= (and d!61885 c!43798) b!258395))

(assert (= (and d!61885 (not c!43798)) b!258394))

(assert (= (and b!258394 c!43797) b!258397))

(assert (= (and b!258394 (not c!43797)) b!258396))

(assert (= (or b!258397 b!258396) bm!24564))

(assert (=> b!258394 m!273093))

(assert (=> b!258394 m!273093))

(assert (=> b!258394 m!273121))

(declare-fun m!273299 () Bool)

(assert (=> bm!24564 m!273299))

(assert (=> bm!24519 d!61885))

(declare-fun bm!24565 () Bool)

(declare-fun call!24568 () Bool)

(assert (=> bm!24565 (= call!24568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(declare-fun b!258398 () Bool)

(declare-fun e!167478 () Bool)

(assert (=> b!258398 (= e!167478 call!24568)))

(declare-fun b!258399 () Bool)

(declare-fun e!167479 () Bool)

(assert (=> b!258399 (= e!167479 call!24568)))

(declare-fun b!258400 () Bool)

(declare-fun e!167477 () Bool)

(assert (=> b!258400 (= e!167477 e!167478)))

(declare-fun c!43799 () Bool)

(assert (=> b!258400 (= c!43799 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61887 () Bool)

(declare-fun res!126316 () Bool)

(assert (=> d!61887 (=> res!126316 e!167477)))

(assert (=> d!61887 (= res!126316 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)) e!167477)))

(declare-fun b!258401 () Bool)

(assert (=> b!258401 (= e!167478 e!167479)))

(declare-fun lt!129957 () (_ BitVec 64))

(assert (=> b!258401 (= lt!129957 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129958 () Unit!7978)

(assert (=> b!258401 (= lt!129958 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6929 thiss!1504) lt!129957 #b00000000000000000000000000000000))))

(assert (=> b!258401 (arrayContainsKey!0 (_keys!6929 thiss!1504) lt!129957 #b00000000000000000000000000000000)))

(declare-fun lt!129959 () Unit!7978)

(assert (=> b!258401 (= lt!129959 lt!129958)))

(declare-fun res!126315 () Bool)

(assert (=> b!258401 (= res!126315 (= (seekEntryOrOpen!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) (_keys!6929 thiss!1504) (mask!11056 thiss!1504)) (Found!1170 #b00000000000000000000000000000000)))))

(assert (=> b!258401 (=> (not res!126315) (not e!167479))))

(assert (= (and d!61887 (not res!126316)) b!258400))

(assert (= (and b!258400 c!43799) b!258401))

(assert (= (and b!258400 (not c!43799)) b!258398))

(assert (= (and b!258401 res!126315) b!258399))

(assert (= (or b!258399 b!258398) bm!24565))

(declare-fun m!273301 () Bool)

(assert (=> bm!24565 m!273301))

(assert (=> b!258400 m!272851))

(assert (=> b!258400 m!272851))

(assert (=> b!258400 m!272893))

(assert (=> b!258401 m!272851))

(declare-fun m!273303 () Bool)

(assert (=> b!258401 m!273303))

(declare-fun m!273305 () Bool)

(assert (=> b!258401 m!273305))

(assert (=> b!258401 m!272851))

(declare-fun m!273307 () Bool)

(assert (=> b!258401 m!273307))

(assert (=> b!257974 d!61887))

(declare-fun d!61889 () Bool)

(assert (=> d!61889 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258036 d!61889))

(declare-fun b!258412 () Bool)

(declare-fun res!126327 () Bool)

(declare-fun e!167482 () Bool)

(assert (=> b!258412 (=> (not res!126327) (not e!167482))))

(declare-fun size!6291 (LongMapFixedSize!3814) (_ BitVec 32))

(assert (=> b!258412 (= res!126327 (= (size!6291 thiss!1504) (bvadd (_size!1956 thiss!1504) (bvsdiv (bvadd (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!258410 () Bool)

(declare-fun res!126326 () Bool)

(assert (=> b!258410 (=> (not res!126326) (not e!167482))))

(assert (=> b!258410 (= res!126326 (and (= (size!6285 (_values!4743 thiss!1504)) (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001)) (= (size!6286 (_keys!6929 thiss!1504)) (size!6285 (_values!4743 thiss!1504))) (bvsge (_size!1956 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1956 thiss!1504) (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!61891 () Bool)

(declare-fun res!126325 () Bool)

(assert (=> d!61891 (=> (not res!126325) (not e!167482))))

(assert (=> d!61891 (= res!126325 (validMask!0 (mask!11056 thiss!1504)))))

(assert (=> d!61891 (= (simpleValid!278 thiss!1504) e!167482)))

(declare-fun b!258411 () Bool)

(declare-fun res!126328 () Bool)

(assert (=> b!258411 (=> (not res!126328) (not e!167482))))

(assert (=> b!258411 (= res!126328 (bvsge (size!6291 thiss!1504) (_size!1956 thiss!1504)))))

(declare-fun b!258413 () Bool)

(assert (=> b!258413 (= e!167482 (and (bvsge (extraKeys!4497 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4497 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1956 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!61891 res!126325) b!258410))

(assert (= (and b!258410 res!126326) b!258411))

(assert (= (and b!258411 res!126328) b!258412))

(assert (= (and b!258412 res!126327) b!258413))

(declare-fun m!273309 () Bool)

(assert (=> b!258412 m!273309))

(assert (=> d!61891 m!272641))

(assert (=> b!258411 m!273309))

(assert (=> d!61733 d!61891))

(declare-fun d!61893 () Bool)

(assert (=> d!61893 (= (apply!255 lt!129843 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3051 (getValueByKey!311 (toList!1907 lt!129843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9083 () Bool)

(assert (= bs!9083 d!61893))

(declare-fun m!273311 () Bool)

(assert (=> bs!9083 m!273311))

(assert (=> bs!9083 m!273311))

(declare-fun m!273313 () Bool)

(assert (=> bs!9083 m!273313))

(assert (=> b!258188 d!61893))

(assert (=> b!258051 d!61785))

(declare-fun d!61895 () Bool)

(assert (=> d!61895 (= (inRange!0 (ite c!43691 (index!6850 lt!129706) (index!6853 lt!129706)) (mask!11056 thiss!1504)) (and (bvsge (ite c!43691 (index!6850 lt!129706) (index!6853 lt!129706)) #b00000000000000000000000000000000) (bvslt (ite c!43691 (index!6850 lt!129706) (index!6853 lt!129706)) (bvadd (mask!11056 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24508 d!61895))

(declare-fun d!61897 () Bool)

(declare-fun e!167484 () Bool)

(assert (=> d!61897 e!167484))

(declare-fun res!126329 () Bool)

(assert (=> d!61897 (=> res!126329 e!167484)))

(declare-fun lt!129960 () Bool)

(assert (=> d!61897 (= res!126329 (not lt!129960))))

(declare-fun lt!129962 () Bool)

(assert (=> d!61897 (= lt!129960 lt!129962)))

(declare-fun lt!129961 () Unit!7978)

(declare-fun e!167483 () Unit!7978)

(assert (=> d!61897 (= lt!129961 e!167483)))

(declare-fun c!43800 () Bool)

(assert (=> d!61897 (= c!43800 lt!129962)))

(assert (=> d!61897 (= lt!129962 (containsKey!303 (toList!1907 lt!129843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61897 (= (contains!1857 lt!129843 #b1000000000000000000000000000000000000000000000000000000000000000) lt!129960)))

(declare-fun b!258414 () Bool)

(declare-fun lt!129963 () Unit!7978)

(assert (=> b!258414 (= e!167483 lt!129963)))

(assert (=> b!258414 (= lt!129963 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258414 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258415 () Bool)

(declare-fun Unit!7995 () Unit!7978)

(assert (=> b!258415 (= e!167483 Unit!7995)))

(declare-fun b!258416 () Bool)

(assert (=> b!258416 (= e!167484 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61897 c!43800) b!258414))

(assert (= (and d!61897 (not c!43800)) b!258415))

(assert (= (and d!61897 (not res!126329)) b!258416))

(declare-fun m!273315 () Bool)

(assert (=> d!61897 m!273315))

(declare-fun m!273317 () Bool)

(assert (=> b!258414 m!273317))

(assert (=> b!258414 m!273127))

(assert (=> b!258414 m!273127))

(declare-fun m!273319 () Bool)

(assert (=> b!258414 m!273319))

(assert (=> b!258416 m!273127))

(assert (=> b!258416 m!273127))

(assert (=> b!258416 m!273319))

(assert (=> bm!24541 d!61897))

(declare-fun d!61899 () Bool)

(declare-fun e!167486 () Bool)

(assert (=> d!61899 e!167486))

(declare-fun res!126330 () Bool)

(assert (=> d!61899 (=> res!126330 e!167486)))

(declare-fun lt!129964 () Bool)

(assert (=> d!61899 (= res!126330 (not lt!129964))))

(declare-fun lt!129966 () Bool)

(assert (=> d!61899 (= lt!129964 lt!129966)))

(declare-fun lt!129965 () Unit!7978)

(declare-fun e!167485 () Unit!7978)

(assert (=> d!61899 (= lt!129965 e!167485)))

(declare-fun c!43801 () Bool)

(assert (=> d!61899 (= c!43801 lt!129966)))

(assert (=> d!61899 (= lt!129966 (containsKey!303 (toList!1907 lt!129843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61899 (= (contains!1857 lt!129843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!129964)))

(declare-fun b!258417 () Bool)

(declare-fun lt!129967 () Unit!7978)

(assert (=> b!258417 (= e!167485 lt!129967)))

(assert (=> b!258417 (= lt!129967 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258417 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258418 () Bool)

(declare-fun Unit!7996 () Unit!7978)

(assert (=> b!258418 (= e!167485 Unit!7996)))

(declare-fun b!258419 () Bool)

(assert (=> b!258419 (= e!167486 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61899 c!43801) b!258417))

(assert (= (and d!61899 (not c!43801)) b!258418))

(assert (= (and d!61899 (not res!126330)) b!258419))

(declare-fun m!273321 () Bool)

(assert (=> d!61899 m!273321))

(declare-fun m!273323 () Bool)

(assert (=> b!258417 m!273323))

(assert (=> b!258417 m!273311))

(assert (=> b!258417 m!273311))

(declare-fun m!273325 () Bool)

(assert (=> b!258417 m!273325))

(assert (=> b!258419 m!273311))

(assert (=> b!258419 m!273311))

(assert (=> b!258419 m!273325))

(assert (=> bm!24544 d!61899))

(assert (=> b!258135 d!61799))

(declare-fun bm!24566 () Bool)

(declare-fun call!24569 () Bool)

(assert (=> bm!24566 (= call!24569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (mask!11056 thiss!1504)))))

(declare-fun b!258420 () Bool)

(declare-fun e!167488 () Bool)

(assert (=> b!258420 (= e!167488 call!24569)))

(declare-fun b!258421 () Bool)

(declare-fun e!167489 () Bool)

(assert (=> b!258421 (= e!167489 call!24569)))

(declare-fun b!258422 () Bool)

(declare-fun e!167487 () Bool)

(assert (=> b!258422 (= e!167487 e!167488)))

(declare-fun c!43802 () Bool)

(assert (=> b!258422 (= c!43802 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!61901 () Bool)

(declare-fun res!126332 () Bool)

(assert (=> d!61901 (=> res!126332 e!167487)))

(assert (=> d!61901 (= res!126332 (bvsge #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(assert (=> d!61901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (mask!11056 thiss!1504)) e!167487)))

(declare-fun b!258423 () Bool)

(assert (=> b!258423 (= e!167488 e!167489)))

(declare-fun lt!129968 () (_ BitVec 64))

(assert (=> b!258423 (= lt!129968 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!129969 () Unit!7978)

(assert (=> b!258423 (= lt!129969 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) lt!129968 #b00000000000000000000000000000000))))

(assert (=> b!258423 (arrayContainsKey!0 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) lt!129968 #b00000000000000000000000000000000)))

(declare-fun lt!129970 () Unit!7978)

(assert (=> b!258423 (= lt!129970 lt!129969)))

(declare-fun res!126331 () Bool)

(assert (=> b!258423 (= res!126331 (= (seekEntryOrOpen!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000) (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (mask!11056 thiss!1504)) (Found!1170 #b00000000000000000000000000000000)))))

(assert (=> b!258423 (=> (not res!126331) (not e!167489))))

(assert (= (and d!61901 (not res!126332)) b!258422))

(assert (= (and b!258422 c!43802) b!258423))

(assert (= (and b!258422 (not c!43802)) b!258420))

(assert (= (and b!258423 res!126331) b!258421))

(assert (= (or b!258421 b!258420) bm!24566))

(declare-fun m!273327 () Bool)

(assert (=> bm!24566 m!273327))

(assert (=> b!258422 m!273083))

(assert (=> b!258422 m!273083))

(assert (=> b!258422 m!273085))

(assert (=> b!258423 m!273083))

(declare-fun m!273329 () Bool)

(assert (=> b!258423 m!273329))

(declare-fun m!273331 () Bool)

(assert (=> b!258423 m!273331))

(assert (=> b!258423 m!273083))

(declare-fun m!273333 () Bool)

(assert (=> b!258423 m!273333))

(assert (=> b!258084 d!61901))

(assert (=> b!258023 d!61799))

(declare-fun b!258424 () Bool)

(declare-fun e!167491 () Bool)

(assert (=> b!258424 (= e!167491 (contains!1859 Nil!3777 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24567 () Bool)

(declare-fun call!24570 () Bool)

(declare-fun c!43803 () Bool)

(assert (=> bm!24567 (= call!24570 (arrayNoDuplicates!0 (_keys!6929 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43803 (Cons!3776 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) Nil!3777) Nil!3777)))))

(declare-fun d!61903 () Bool)

(declare-fun res!126335 () Bool)

(declare-fun e!167492 () Bool)

(assert (=> d!61903 (=> res!126335 e!167492)))

(assert (=> d!61903 (= res!126335 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61903 (= (arrayNoDuplicates!0 (_keys!6929 thiss!1504) #b00000000000000000000000000000000 Nil!3777) e!167492)))

(declare-fun b!258425 () Bool)

(declare-fun e!167490 () Bool)

(declare-fun e!167493 () Bool)

(assert (=> b!258425 (= e!167490 e!167493)))

(assert (=> b!258425 (= c!43803 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258426 () Bool)

(assert (=> b!258426 (= e!167492 e!167490)))

(declare-fun res!126333 () Bool)

(assert (=> b!258426 (=> (not res!126333) (not e!167490))))

(assert (=> b!258426 (= res!126333 (not e!167491))))

(declare-fun res!126334 () Bool)

(assert (=> b!258426 (=> (not res!126334) (not e!167491))))

(assert (=> b!258426 (= res!126334 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258427 () Bool)

(assert (=> b!258427 (= e!167493 call!24570)))

(declare-fun b!258428 () Bool)

(assert (=> b!258428 (= e!167493 call!24570)))

(assert (= (and d!61903 (not res!126335)) b!258426))

(assert (= (and b!258426 res!126334) b!258424))

(assert (= (and b!258426 res!126333) b!258425))

(assert (= (and b!258425 c!43803) b!258428))

(assert (= (and b!258425 (not c!43803)) b!258427))

(assert (= (or b!258428 b!258427) bm!24567))

(assert (=> b!258424 m!272851))

(assert (=> b!258424 m!272851))

(declare-fun m!273335 () Bool)

(assert (=> b!258424 m!273335))

(assert (=> bm!24567 m!272851))

(declare-fun m!273337 () Bool)

(assert (=> bm!24567 m!273337))

(assert (=> b!258425 m!272851))

(assert (=> b!258425 m!272851))

(assert (=> b!258425 m!272893))

(assert (=> b!258426 m!272851))

(assert (=> b!258426 m!272851))

(assert (=> b!258426 m!272893))

(assert (=> b!257975 d!61903))

(declare-fun d!61905 () Bool)

(assert (=> d!61905 (= (apply!255 lt!129797 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) (get!3051 (getValueByKey!311 (toList!1907 lt!129797) (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))))

(declare-fun bs!9084 () Bool)

(assert (= bs!9084 d!61905))

(assert (=> bs!9084 m!272871))

(declare-fun m!273339 () Bool)

(assert (=> bs!9084 m!273339))

(assert (=> bs!9084 m!273339))

(declare-fun m!273341 () Bool)

(assert (=> bs!9084 m!273341))

(assert (=> b!258134 d!61905))

(declare-fun d!61907 () Bool)

(declare-fun c!43804 () Bool)

(assert (=> d!61907 (= c!43804 ((_ is ValueCellFull!2957) (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!167494 () V!8449)

(assert (=> d!61907 (= (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!167494)))

(declare-fun b!258429 () Bool)

(assert (=> b!258429 (= e!167494 (get!3052 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!258430 () Bool)

(assert (=> b!258430 (= e!167494 (get!3053 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61907 c!43804) b!258429))

(assert (= (and d!61907 (not c!43804)) b!258430))

(assert (=> b!258429 m!272933))

(assert (=> b!258429 m!272935))

(declare-fun m!273343 () Bool)

(assert (=> b!258429 m!273343))

(assert (=> b!258430 m!272933))

(assert (=> b!258430 m!272935))

(declare-fun m!273345 () Bool)

(assert (=> b!258430 m!273345))

(assert (=> b!258134 d!61907))

(declare-fun d!61909 () Bool)

(declare-fun res!126336 () Bool)

(declare-fun e!167495 () Bool)

(assert (=> d!61909 (=> res!126336 e!167495)))

(assert (=> d!61909 (= res!126336 (= (select (arr!5938 (_keys!6929 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61909 (= (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!167495)))

(declare-fun b!258431 () Bool)

(declare-fun e!167496 () Bool)

(assert (=> b!258431 (= e!167495 e!167496)))

(declare-fun res!126337 () Bool)

(assert (=> b!258431 (=> (not res!126337) (not e!167496))))

(assert (=> b!258431 (= res!126337 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!258432 () Bool)

(assert (=> b!258432 (= e!167496 (arrayContainsKey!0 (_keys!6929 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61909 (not res!126336)) b!258431))

(assert (= (and b!258431 res!126337) b!258432))

(assert (=> d!61909 m!273069))

(declare-fun m!273347 () Bool)

(assert (=> b!258432 m!273347))

(assert (=> b!257981 d!61909))

(assert (=> b!258068 d!61799))

(declare-fun d!61911 () Bool)

(declare-fun e!167497 () Bool)

(assert (=> d!61911 e!167497))

(declare-fun res!126339 () Bool)

(assert (=> d!61911 (=> (not res!126339) (not e!167497))))

(declare-fun lt!129973 () ListLongMap!3783)

(assert (=> d!61911 (= res!126339 (contains!1857 lt!129973 (_1!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun lt!129974 () List!3779)

(assert (=> d!61911 (= lt!129973 (ListLongMap!3784 lt!129974))))

(declare-fun lt!129971 () Unit!7978)

(declare-fun lt!129972 () Unit!7978)

(assert (=> d!61911 (= lt!129971 lt!129972)))

(assert (=> d!61911 (= (getValueByKey!311 lt!129974 (_1!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!316 (_2!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61911 (= lt!129972 (lemmaContainsTupThenGetReturnValue!170 lt!129974 (_1!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61911 (= lt!129974 (insertStrictlySorted!173 (toList!1907 (ite c!43725 call!24540 (ite c!43721 call!24537 call!24541))) (_1!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61911 (= (+!695 (ite c!43725 call!24540 (ite c!43721 call!24537 call!24541)) (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) lt!129973)))

(declare-fun b!258433 () Bool)

(declare-fun res!126338 () Bool)

(assert (=> b!258433 (=> (not res!126338) (not e!167497))))

(assert (=> b!258433 (= res!126338 (= (getValueByKey!311 (toList!1907 lt!129973) (_1!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!316 (_2!2451 (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))))

(declare-fun b!258434 () Bool)

(assert (=> b!258434 (= e!167497 (contains!1860 (toList!1907 lt!129973) (ite (or c!43725 c!43721) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (= (and d!61911 res!126339) b!258433))

(assert (= (and b!258433 res!126338) b!258434))

(declare-fun m!273349 () Bool)

(assert (=> d!61911 m!273349))

(declare-fun m!273351 () Bool)

(assert (=> d!61911 m!273351))

(declare-fun m!273353 () Bool)

(assert (=> d!61911 m!273353))

(declare-fun m!273355 () Bool)

(assert (=> d!61911 m!273355))

(declare-fun m!273357 () Bool)

(assert (=> b!258433 m!273357))

(declare-fun m!273359 () Bool)

(assert (=> b!258434 m!273359))

(assert (=> bm!24540 d!61911))

(declare-fun lt!129977 () Bool)

(declare-fun d!61913 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!168 (List!3779) (InoxSet tuple2!4880))

(assert (=> d!61913 (= lt!129977 (select (content!168 (toList!1907 lt!129742)) (tuple2!4881 key!932 v!346)))))

(declare-fun e!167502 () Bool)

(assert (=> d!61913 (= lt!129977 e!167502)))

(declare-fun res!126345 () Bool)

(assert (=> d!61913 (=> (not res!126345) (not e!167502))))

(assert (=> d!61913 (= res!126345 ((_ is Cons!3775) (toList!1907 lt!129742)))))

(assert (=> d!61913 (= (contains!1860 (toList!1907 lt!129742) (tuple2!4881 key!932 v!346)) lt!129977)))

(declare-fun b!258439 () Bool)

(declare-fun e!167503 () Bool)

(assert (=> b!258439 (= e!167502 e!167503)))

(declare-fun res!126344 () Bool)

(assert (=> b!258439 (=> res!126344 e!167503)))

(assert (=> b!258439 (= res!126344 (= (h!4437 (toList!1907 lt!129742)) (tuple2!4881 key!932 v!346)))))

(declare-fun b!258440 () Bool)

(assert (=> b!258440 (= e!167503 (contains!1860 (t!8833 (toList!1907 lt!129742)) (tuple2!4881 key!932 v!346)))))

(assert (= (and d!61913 res!126345) b!258439))

(assert (= (and b!258439 (not res!126344)) b!258440))

(declare-fun m!273361 () Bool)

(assert (=> d!61913 m!273361))

(declare-fun m!273363 () Bool)

(assert (=> d!61913 m!273363))

(declare-fun m!273365 () Bool)

(assert (=> b!258440 m!273365))

(assert (=> b!258075 d!61913))

(assert (=> b!258076 d!61799))

(assert (=> bm!24538 d!61847))

(assert (=> d!61767 d!61755))

(assert (=> b!258179 d!61785))

(declare-fun d!61915 () Bool)

(assert (=> d!61915 (= (apply!255 lt!129797 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3051 (getValueByKey!311 (toList!1907 lt!129797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9085 () Bool)

(assert (= bs!9085 d!61915))

(declare-fun m!273367 () Bool)

(assert (=> bs!9085 m!273367))

(assert (=> bs!9085 m!273367))

(declare-fun m!273369 () Bool)

(assert (=> bs!9085 m!273369))

(assert (=> b!258139 d!61915))

(assert (=> d!61745 d!61763))

(declare-fun d!61917 () Bool)

(assert (=> d!61917 (arrayContainsKey!0 lt!129603 key!932 #b00000000000000000000000000000000)))

(assert (=> d!61917 true))

(declare-fun _$60!375 () Unit!7978)

(assert (=> d!61917 (= (choose!13 lt!129603 key!932 index!297) _$60!375)))

(declare-fun bs!9086 () Bool)

(assert (= bs!9086 d!61917))

(assert (=> bs!9086 m!272663))

(assert (=> d!61745 d!61917))

(declare-fun d!61919 () Bool)

(declare-fun e!167505 () Bool)

(assert (=> d!61919 e!167505))

(declare-fun res!126346 () Bool)

(assert (=> d!61919 (=> res!126346 e!167505)))

(declare-fun lt!129978 () Bool)

(assert (=> d!61919 (= res!126346 (not lt!129978))))

(declare-fun lt!129980 () Bool)

(assert (=> d!61919 (= lt!129978 lt!129980)))

(declare-fun lt!129979 () Unit!7978)

(declare-fun e!167504 () Unit!7978)

(assert (=> d!61919 (= lt!129979 e!167504)))

(declare-fun c!43805 () Bool)

(assert (=> d!61919 (= c!43805 lt!129980)))

(assert (=> d!61919 (= lt!129980 (containsKey!303 (toList!1907 lt!129797) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61919 (= (contains!1857 lt!129797 #b1000000000000000000000000000000000000000000000000000000000000000) lt!129978)))

(declare-fun b!258441 () Bool)

(declare-fun lt!129981 () Unit!7978)

(assert (=> b!258441 (= e!167504 lt!129981)))

(assert (=> b!258441 (= lt!129981 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129797) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258441 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258442 () Bool)

(declare-fun Unit!7997 () Unit!7978)

(assert (=> b!258442 (= e!167504 Unit!7997)))

(declare-fun b!258443 () Bool)

(assert (=> b!258443 (= e!167505 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61919 c!43805) b!258441))

(assert (= (and d!61919 (not c!43805)) b!258442))

(assert (= (and d!61919 (not res!126346)) b!258443))

(declare-fun m!273371 () Bool)

(assert (=> d!61919 m!273371))

(declare-fun m!273373 () Bool)

(assert (=> b!258441 m!273373))

(assert (=> b!258441 m!273367))

(assert (=> b!258441 m!273367))

(declare-fun m!273375 () Bool)

(assert (=> b!258441 m!273375))

(assert (=> b!258443 m!273367))

(assert (=> b!258443 m!273367))

(assert (=> b!258443 m!273375))

(assert (=> bm!24534 d!61919))

(declare-fun d!61921 () Bool)

(declare-fun e!167506 () Bool)

(assert (=> d!61921 e!167506))

(declare-fun res!126348 () Bool)

(assert (=> d!61921 (=> (not res!126348) (not e!167506))))

(declare-fun lt!129984 () ListLongMap!3783)

(assert (=> d!61921 (= res!126348 (contains!1857 lt!129984 (_1!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun lt!129985 () List!3779)

(assert (=> d!61921 (= lt!129984 (ListLongMap!3784 lt!129985))))

(declare-fun lt!129982 () Unit!7978)

(declare-fun lt!129983 () Unit!7978)

(assert (=> d!61921 (= lt!129982 lt!129983)))

(assert (=> d!61921 (= (getValueByKey!311 lt!129985 (_1!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!316 (_2!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61921 (= lt!129983 (lemmaContainsTupThenGetReturnValue!170 lt!129985 (_1!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61921 (= lt!129985 (insertStrictlySorted!173 (toList!1907 (ite c!43734 call!24547 (ite c!43730 call!24544 call!24548))) (_1!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (_2!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(assert (=> d!61921 (= (+!695 (ite c!43734 call!24547 (ite c!43730 call!24544 call!24548)) (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) lt!129984)))

(declare-fun b!258444 () Bool)

(declare-fun res!126347 () Bool)

(assert (=> b!258444 (=> (not res!126347) (not e!167506))))

(assert (=> b!258444 (= res!126347 (= (getValueByKey!311 (toList!1907 lt!129984) (_1!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))) (Some!316 (_2!2451 (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))))

(declare-fun b!258445 () Bool)

(assert (=> b!258445 (= e!167506 (contains!1860 (toList!1907 lt!129984) (ite (or c!43734 c!43730) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (= (and d!61921 res!126348) b!258444))

(assert (= (and b!258444 res!126347) b!258445))

(declare-fun m!273377 () Bool)

(assert (=> d!61921 m!273377))

(declare-fun m!273379 () Bool)

(assert (=> d!61921 m!273379))

(declare-fun m!273381 () Bool)

(assert (=> d!61921 m!273381))

(declare-fun m!273383 () Bool)

(assert (=> d!61921 m!273383))

(declare-fun m!273385 () Bool)

(assert (=> b!258444 m!273385))

(declare-fun m!273387 () Bool)

(assert (=> b!258445 m!273387))

(assert (=> bm!24547 d!61921))

(declare-fun d!61923 () Bool)

(declare-fun e!167507 () Bool)

(assert (=> d!61923 e!167507))

(declare-fun res!126350 () Bool)

(assert (=> d!61923 (=> (not res!126350) (not e!167507))))

(declare-fun lt!129988 () ListLongMap!3783)

(assert (=> d!61923 (= res!126350 (contains!1857 lt!129988 (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lt!129989 () List!3779)

(assert (=> d!61923 (= lt!129988 (ListLongMap!3784 lt!129989))))

(declare-fun lt!129986 () Unit!7978)

(declare-fun lt!129987 () Unit!7978)

(assert (=> d!61923 (= lt!129986 lt!129987)))

(assert (=> d!61923 (= (getValueByKey!311 lt!129989 (_1!2451 (tuple2!4881 key!932 v!346))) (Some!316 (_2!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!61923 (= lt!129987 (lemmaContainsTupThenGetReturnValue!170 lt!129989 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!61923 (= lt!129989 (insertStrictlySorted!173 (toList!1907 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504))) (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!61923 (= (+!695 (getCurrentListMap!1416 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) (tuple2!4881 key!932 v!346)) lt!129988)))

(declare-fun b!258446 () Bool)

(declare-fun res!126349 () Bool)

(assert (=> b!258446 (=> (not res!126349) (not e!167507))))

(assert (=> b!258446 (= res!126349 (= (getValueByKey!311 (toList!1907 lt!129988) (_1!2451 (tuple2!4881 key!932 v!346))) (Some!316 (_2!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun b!258447 () Bool)

(assert (=> b!258447 (= e!167507 (contains!1860 (toList!1907 lt!129988) (tuple2!4881 key!932 v!346)))))

(assert (= (and d!61923 res!126350) b!258446))

(assert (= (and b!258446 res!126349) b!258447))

(declare-fun m!273389 () Bool)

(assert (=> d!61923 m!273389))

(declare-fun m!273391 () Bool)

(assert (=> d!61923 m!273391))

(declare-fun m!273393 () Bool)

(assert (=> d!61923 m!273393))

(declare-fun m!273395 () Bool)

(assert (=> d!61923 m!273395))

(declare-fun m!273397 () Bool)

(assert (=> b!258446 m!273397))

(declare-fun m!273399 () Bool)

(assert (=> b!258447 m!273399))

(assert (=> b!258057 d!61923))

(assert (=> b!258057 d!61783))

(declare-fun b!258448 () Bool)

(declare-fun e!167520 () ListLongMap!3783)

(declare-fun call!24573 () ListLongMap!3783)

(assert (=> b!258448 (= e!167520 (+!695 call!24573 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(declare-fun b!258449 () Bool)

(declare-fun e!167513 () Bool)

(declare-fun e!167516 () Bool)

(assert (=> b!258449 (= e!167513 e!167516)))

(declare-fun c!43808 () Bool)

(assert (=> b!258449 (= c!43808 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24568 () Bool)

(declare-fun call!24576 () Bool)

(declare-fun lt!129995 () ListLongMap!3783)

(assert (=> bm!24568 (= call!24576 (contains!1857 lt!129995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258450 () Bool)

(declare-fun e!167511 () Unit!7978)

(declare-fun lt!130008 () Unit!7978)

(assert (=> b!258450 (= e!167511 lt!130008)))

(declare-fun lt!130009 () ListLongMap!3783)

(assert (=> b!258450 (= lt!130009 (getCurrentListMapNoExtraKeys!571 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129996 () (_ BitVec 64))

(assert (=> b!258450 (= lt!129996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130000 () (_ BitVec 64))

(assert (=> b!258450 (= lt!130000 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!129991 () Unit!7978)

(assert (=> b!258450 (= lt!129991 (addStillContains!231 lt!130009 lt!129996 (zeroValue!4601 thiss!1504) lt!130000))))

(assert (=> b!258450 (contains!1857 (+!695 lt!130009 (tuple2!4881 lt!129996 (zeroValue!4601 thiss!1504))) lt!130000)))

(declare-fun lt!130004 () Unit!7978)

(assert (=> b!258450 (= lt!130004 lt!129991)))

(declare-fun lt!130003 () ListLongMap!3783)

(assert (=> b!258450 (= lt!130003 (getCurrentListMapNoExtraKeys!571 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130010 () (_ BitVec 64))

(assert (=> b!258450 (= lt!130010 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129994 () (_ BitVec 64))

(assert (=> b!258450 (= lt!129994 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130001 () Unit!7978)

(assert (=> b!258450 (= lt!130001 (addApplyDifferent!231 lt!130003 lt!130010 (minValue!4601 thiss!1504) lt!129994))))

(assert (=> b!258450 (= (apply!255 (+!695 lt!130003 (tuple2!4881 lt!130010 (minValue!4601 thiss!1504))) lt!129994) (apply!255 lt!130003 lt!129994))))

(declare-fun lt!129999 () Unit!7978)

(assert (=> b!258450 (= lt!129999 lt!130001)))

(declare-fun lt!130007 () ListLongMap!3783)

(assert (=> b!258450 (= lt!130007 (getCurrentListMapNoExtraKeys!571 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!130011 () (_ BitVec 64))

(assert (=> b!258450 (= lt!130011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129992 () (_ BitVec 64))

(assert (=> b!258450 (= lt!129992 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130005 () Unit!7978)

(assert (=> b!258450 (= lt!130005 (addApplyDifferent!231 lt!130007 lt!130011 (zeroValue!4601 thiss!1504) lt!129992))))

(assert (=> b!258450 (= (apply!255 (+!695 lt!130007 (tuple2!4881 lt!130011 (zeroValue!4601 thiss!1504))) lt!129992) (apply!255 lt!130007 lt!129992))))

(declare-fun lt!129997 () Unit!7978)

(assert (=> b!258450 (= lt!129997 lt!130005)))

(declare-fun lt!129998 () ListLongMap!3783)

(assert (=> b!258450 (= lt!129998 (getCurrentListMapNoExtraKeys!571 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun lt!129993 () (_ BitVec 64))

(assert (=> b!258450 (= lt!129993 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130006 () (_ BitVec 64))

(assert (=> b!258450 (= lt!130006 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!258450 (= lt!130008 (addApplyDifferent!231 lt!129998 lt!129993 (minValue!4601 thiss!1504) lt!130006))))

(assert (=> b!258450 (= (apply!255 (+!695 lt!129998 (tuple2!4881 lt!129993 (minValue!4601 thiss!1504))) lt!130006) (apply!255 lt!129998 lt!130006))))

(declare-fun b!258451 () Bool)

(declare-fun e!167508 () ListLongMap!3783)

(declare-fun call!24575 () ListLongMap!3783)

(assert (=> b!258451 (= e!167508 call!24575)))

(declare-fun bm!24569 () Bool)

(declare-fun call!24572 () ListLongMap!3783)

(assert (=> bm!24569 (= call!24572 call!24573)))

(declare-fun bm!24570 () Bool)

(declare-fun call!24571 () ListLongMap!3783)

(declare-fun call!24574 () ListLongMap!3783)

(assert (=> bm!24570 (= call!24571 call!24574)))

(declare-fun b!258452 () Bool)

(declare-fun res!126353 () Bool)

(assert (=> b!258452 (=> (not res!126353) (not e!167513))))

(declare-fun e!167519 () Bool)

(assert (=> b!258452 (= res!126353 e!167519)))

(declare-fun c!43810 () Bool)

(assert (=> b!258452 (= c!43810 (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!61925 () Bool)

(assert (=> d!61925 e!167513))

(declare-fun res!126356 () Bool)

(assert (=> d!61925 (=> (not res!126356) (not e!167513))))

(assert (=> d!61925 (= res!126356 (or (bvsge #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))))

(declare-fun lt!129990 () ListLongMap!3783)

(assert (=> d!61925 (= lt!129995 lt!129990)))

(declare-fun lt!130002 () Unit!7978)

(assert (=> d!61925 (= lt!130002 e!167511)))

(declare-fun c!43809 () Bool)

(declare-fun e!167517 () Bool)

(assert (=> d!61925 (= c!43809 e!167517)))

(declare-fun res!126354 () Bool)

(assert (=> d!61925 (=> (not res!126354) (not e!167517))))

(assert (=> d!61925 (= res!126354 (bvslt #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(assert (=> d!61925 (= lt!129990 e!167520)))

(declare-fun c!43811 () Bool)

(assert (=> d!61925 (= c!43811 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61925 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61925 (= (getCurrentListMap!1416 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!129995)))

(declare-fun b!258453 () Bool)

(declare-fun e!167514 () Bool)

(declare-fun e!167509 () Bool)

(assert (=> b!258453 (= e!167514 e!167509)))

(declare-fun res!126351 () Bool)

(assert (=> b!258453 (=> (not res!126351) (not e!167509))))

(assert (=> b!258453 (= res!126351 (contains!1857 lt!129995 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!258453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(declare-fun b!258454 () Bool)

(declare-fun Unit!7998 () Unit!7978)

(assert (=> b!258454 (= e!167511 Unit!7998)))

(declare-fun b!258455 () Bool)

(assert (=> b!258455 (= e!167509 (= (apply!255 lt!129995 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)) (get!3050 (select (arr!5937 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))))))))

(assert (=> b!258455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(declare-fun bm!24571 () Bool)

(declare-fun call!24577 () Bool)

(assert (=> bm!24571 (= call!24577 (contains!1857 lt!129995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258456 () Bool)

(assert (=> b!258456 (= e!167517 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258457 () Bool)

(declare-fun res!126358 () Bool)

(assert (=> b!258457 (=> (not res!126358) (not e!167513))))

(assert (=> b!258457 (= res!126358 e!167514)))

(declare-fun res!126357 () Bool)

(assert (=> b!258457 (=> res!126357 e!167514)))

(declare-fun e!167515 () Bool)

(assert (=> b!258457 (= res!126357 (not e!167515))))

(declare-fun res!126355 () Bool)

(assert (=> b!258457 (=> (not res!126355) (not e!167515))))

(assert (=> b!258457 (= res!126355 (bvslt #b00000000000000000000000000000000 (size!6286 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))))))))

(declare-fun b!258458 () Bool)

(declare-fun e!167512 () Bool)

(assert (=> b!258458 (= e!167519 e!167512)))

(declare-fun res!126359 () Bool)

(assert (=> b!258458 (= res!126359 call!24577)))

(assert (=> b!258458 (=> (not res!126359) (not e!167512))))

(declare-fun b!258459 () Bool)

(assert (=> b!258459 (= e!167515 (validKeyInArray!0 (select (arr!5938 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!258460 () Bool)

(declare-fun e!167510 () Bool)

(assert (=> b!258460 (= e!167510 (= (apply!255 lt!129995 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4601 thiss!1504)))))

(declare-fun b!258461 () Bool)

(declare-fun e!167518 () ListLongMap!3783)

(assert (=> b!258461 (= e!167520 e!167518)))

(declare-fun c!43807 () Bool)

(assert (=> b!258461 (= c!43807 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24572 () Bool)

(assert (=> bm!24572 (= call!24574 (getCurrentListMapNoExtraKeys!571 (array!12544 (store (arr!5938 (_keys!6929 thiss!1504)) index!297 key!932) (size!6286 (_keys!6929 thiss!1504))) (array!12542 (store (arr!5937 (_values!4743 thiss!1504)) index!297 (ValueCellFull!2957 v!346)) (size!6285 (_values!4743 thiss!1504))) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)))))

(declare-fun bm!24573 () Bool)

(assert (=> bm!24573 (= call!24575 call!24571)))

(declare-fun bm!24574 () Bool)

(assert (=> bm!24574 (= call!24573 (+!695 (ite c!43811 call!24574 (ite c!43807 call!24571 call!24575)) (ite (or c!43811 c!43807) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4601 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun b!258462 () Bool)

(assert (=> b!258462 (= e!167518 call!24572)))

(declare-fun b!258463 () Bool)

(assert (=> b!258463 (= e!167519 (not call!24577))))

(declare-fun b!258464 () Bool)

(assert (=> b!258464 (= e!167516 (not call!24576))))

(declare-fun b!258465 () Bool)

(declare-fun c!43806 () Bool)

(assert (=> b!258465 (= c!43806 (and (not (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4497 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!258465 (= e!167518 e!167508)))

(declare-fun b!258466 () Bool)

(assert (=> b!258466 (= e!167516 e!167510)))

(declare-fun res!126352 () Bool)

(assert (=> b!258466 (= res!126352 call!24576)))

(assert (=> b!258466 (=> (not res!126352) (not e!167510))))

(declare-fun b!258467 () Bool)

(assert (=> b!258467 (= e!167508 call!24572)))

(declare-fun b!258468 () Bool)

(assert (=> b!258468 (= e!167512 (= (apply!255 lt!129995 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4601 thiss!1504)))))

(assert (= (and d!61925 c!43811) b!258448))

(assert (= (and d!61925 (not c!43811)) b!258461))

(assert (= (and b!258461 c!43807) b!258462))

(assert (= (and b!258461 (not c!43807)) b!258465))

(assert (= (and b!258465 c!43806) b!258467))

(assert (= (and b!258465 (not c!43806)) b!258451))

(assert (= (or b!258467 b!258451) bm!24573))

(assert (= (or b!258462 bm!24573) bm!24570))

(assert (= (or b!258462 b!258467) bm!24569))

(assert (= (or b!258448 bm!24570) bm!24572))

(assert (= (or b!258448 bm!24569) bm!24574))

(assert (= (and d!61925 res!126354) b!258456))

(assert (= (and d!61925 c!43809) b!258450))

(assert (= (and d!61925 (not c!43809)) b!258454))

(assert (= (and d!61925 res!126356) b!258457))

(assert (= (and b!258457 res!126355) b!258459))

(assert (= (and b!258457 (not res!126357)) b!258453))

(assert (= (and b!258453 res!126351) b!258455))

(assert (= (and b!258457 res!126358) b!258452))

(assert (= (and b!258452 c!43810) b!258458))

(assert (= (and b!258452 (not c!43810)) b!258463))

(assert (= (and b!258458 res!126359) b!258468))

(assert (= (or b!258458 b!258463) bm!24571))

(assert (= (and b!258452 res!126353) b!258449))

(assert (= (and b!258449 c!43808) b!258466))

(assert (= (and b!258449 (not c!43808)) b!258464))

(assert (= (and b!258466 res!126352) b!258460))

(assert (= (or b!258466 b!258464) bm!24568))

(declare-fun b_lambda!8189 () Bool)

(assert (=> (not b_lambda!8189) (not b!258455)))

(assert (=> b!258455 t!8838))

(declare-fun b_and!13801 () Bool)

(assert (= b_and!13799 (and (=> t!8838 result!5383) b_and!13801)))

(declare-fun m!273401 () Bool)

(assert (=> bm!24574 m!273401))

(assert (=> b!258455 m!272933))

(assert (=> b!258455 m!272935))

(assert (=> b!258455 m!272937))

(assert (=> b!258455 m!272935))

(assert (=> b!258455 m!273083))

(assert (=> b!258455 m!273083))

(declare-fun m!273403 () Bool)

(assert (=> b!258455 m!273403))

(assert (=> b!258455 m!272933))

(declare-fun m!273405 () Bool)

(assert (=> b!258450 m!273405))

(declare-fun m!273407 () Bool)

(assert (=> b!258450 m!273407))

(declare-fun m!273409 () Bool)

(assert (=> b!258450 m!273409))

(declare-fun m!273411 () Bool)

(assert (=> b!258450 m!273411))

(declare-fun m!273413 () Bool)

(assert (=> b!258450 m!273413))

(declare-fun m!273415 () Bool)

(assert (=> b!258450 m!273415))

(declare-fun m!273417 () Bool)

(assert (=> b!258450 m!273417))

(declare-fun m!273419 () Bool)

(assert (=> b!258450 m!273419))

(declare-fun m!273421 () Bool)

(assert (=> b!258450 m!273421))

(declare-fun m!273423 () Bool)

(assert (=> b!258450 m!273423))

(assert (=> b!258450 m!273083))

(declare-fun m!273425 () Bool)

(assert (=> b!258450 m!273425))

(declare-fun m!273427 () Bool)

(assert (=> b!258450 m!273427))

(declare-fun m!273429 () Bool)

(assert (=> b!258450 m!273429))

(assert (=> b!258450 m!273417))

(assert (=> b!258450 m!273415))

(declare-fun m!273431 () Bool)

(assert (=> b!258450 m!273431))

(assert (=> b!258450 m!273425))

(declare-fun m!273433 () Bool)

(assert (=> b!258450 m!273433))

(assert (=> b!258450 m!273405))

(declare-fun m!273435 () Bool)

(assert (=> b!258450 m!273435))

(declare-fun m!273437 () Bool)

(assert (=> b!258448 m!273437))

(assert (=> d!61925 m!272641))

(declare-fun m!273439 () Bool)

(assert (=> b!258468 m!273439))

(assert (=> b!258456 m!273083))

(assert (=> b!258456 m!273083))

(assert (=> b!258456 m!273085))

(assert (=> b!258453 m!273083))

(assert (=> b!258453 m!273083))

(declare-fun m!273441 () Bool)

(assert (=> b!258453 m!273441))

(assert (=> b!258459 m!273083))

(assert (=> b!258459 m!273083))

(assert (=> b!258459 m!273085))

(assert (=> bm!24572 m!273407))

(declare-fun m!273443 () Bool)

(assert (=> b!258460 m!273443))

(declare-fun m!273445 () Bool)

(assert (=> bm!24568 m!273445))

(declare-fun m!273447 () Bool)

(assert (=> bm!24571 m!273447))

(assert (=> b!258057 d!61925))

(assert (=> bm!24507 d!61735))

(declare-fun d!61927 () Bool)

(declare-fun e!167521 () Bool)

(assert (=> d!61927 e!167521))

(declare-fun res!126361 () Bool)

(assert (=> d!61927 (=> (not res!126361) (not e!167521))))

(declare-fun lt!130014 () ListLongMap!3783)

(assert (=> d!61927 (= res!126361 (contains!1857 lt!130014 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130015 () List!3779)

(assert (=> d!61927 (= lt!130014 (ListLongMap!3784 lt!130015))))

(declare-fun lt!130012 () Unit!7978)

(declare-fun lt!130013 () Unit!7978)

(assert (=> d!61927 (= lt!130012 lt!130013)))

(assert (=> d!61927 (= (getValueByKey!311 lt!130015 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61927 (= lt!130013 (lemmaContainsTupThenGetReturnValue!170 lt!130015 (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61927 (= lt!130015 (insertStrictlySorted!173 (toList!1907 call!24539) (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))))))

(assert (=> d!61927 (= (+!695 call!24539 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))) lt!130014)))

(declare-fun b!258469 () Bool)

(declare-fun res!126360 () Bool)

(assert (=> b!258469 (=> (not res!126360) (not e!167521))))

(assert (=> b!258469 (= res!126360 (= (getValueByKey!311 (toList!1907 lt!130014) (_1!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))))

(declare-fun b!258470 () Bool)

(assert (=> b!258470 (= e!167521 (contains!1860 (toList!1907 lt!130014) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4601 thiss!1504))))))

(assert (= (and d!61927 res!126361) b!258469))

(assert (= (and b!258469 res!126360) b!258470))

(declare-fun m!273449 () Bool)

(assert (=> d!61927 m!273449))

(declare-fun m!273451 () Bool)

(assert (=> d!61927 m!273451))

(declare-fun m!273453 () Bool)

(assert (=> d!61927 m!273453))

(declare-fun m!273455 () Bool)

(assert (=> d!61927 m!273455))

(declare-fun m!273457 () Bool)

(assert (=> b!258469 m!273457))

(declare-fun m!273459 () Bool)

(assert (=> b!258470 m!273459))

(assert (=> b!258127 d!61927))

(declare-fun b!258472 () Bool)

(assert (=> b!258472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> b!258472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (_values!4743 thiss!1504))))))

(declare-fun e!167528 () Bool)

(declare-fun lt!130022 () ListLongMap!3783)

(assert (=> b!258472 (= e!167528 (= (apply!255 lt!130022 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)) (get!3050 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258473 () Bool)

(declare-fun e!167525 () Bool)

(assert (=> b!258473 (= e!167525 e!167528)))

(assert (=> b!258473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun res!126364 () Bool)

(assert (=> b!258473 (= res!126364 (contains!1857 lt!130022 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258473 (=> (not res!126364) (not e!167528))))

(declare-fun b!258474 () Bool)

(declare-fun e!167526 () ListLongMap!3783)

(declare-fun call!24578 () ListLongMap!3783)

(assert (=> b!258474 (= e!167526 call!24578)))

(declare-fun b!258475 () Bool)

(declare-fun e!167523 () ListLongMap!3783)

(assert (=> b!258475 (= e!167523 (ListLongMap!3784 Nil!3776))))

(declare-fun b!258476 () Bool)

(declare-fun res!126363 () Bool)

(declare-fun e!167524 () Bool)

(assert (=> b!258476 (=> (not res!126363) (not e!167524))))

(assert (=> b!258476 (= res!126363 (not (contains!1857 lt!130022 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!24575 () Bool)

(assert (=> bm!24575 (= call!24578 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504)))))

(declare-fun b!258477 () Bool)

(declare-fun e!167527 () Bool)

(assert (=> b!258477 (= e!167527 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!258477 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!258478 () Bool)

(assert (=> b!258478 (= e!167523 e!167526)))

(declare-fun c!43815 () Bool)

(assert (=> b!258478 (= c!43815 (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!258479 () Bool)

(assert (=> b!258479 (= e!167524 e!167525)))

(declare-fun c!43813 () Bool)

(assert (=> b!258479 (= c!43813 e!167527)))

(declare-fun res!126365 () Bool)

(assert (=> b!258479 (=> (not res!126365) (not e!167527))))

(assert (=> b!258479 (= res!126365 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun b!258480 () Bool)

(declare-fun e!167522 () Bool)

(assert (=> b!258480 (= e!167525 e!167522)))

(declare-fun c!43814 () Bool)

(assert (=> b!258480 (= c!43814 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(declare-fun d!61929 () Bool)

(assert (=> d!61929 e!167524))

(declare-fun res!126362 () Bool)

(assert (=> d!61929 (=> (not res!126362) (not e!167524))))

(assert (=> d!61929 (= res!126362 (not (contains!1857 lt!130022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61929 (= lt!130022 e!167523)))

(declare-fun c!43812 () Bool)

(assert (=> d!61929 (= c!43812 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6929 thiss!1504))))))

(assert (=> d!61929 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61929 (= (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4760 thiss!1504)) lt!130022)))

(declare-fun b!258471 () Bool)

(assert (=> b!258471 (= e!167522 (= lt!130022 (getCurrentListMapNoExtraKeys!571 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4760 thiss!1504))))))

(declare-fun b!258481 () Bool)

(declare-fun lt!130019 () Unit!7978)

(declare-fun lt!130016 () Unit!7978)

(assert (=> b!258481 (= lt!130019 lt!130016)))

(declare-fun lt!130021 () (_ BitVec 64))

(declare-fun lt!130020 () ListLongMap!3783)

(declare-fun lt!130017 () V!8449)

(declare-fun lt!130018 () (_ BitVec 64))

(assert (=> b!258481 (not (contains!1857 (+!695 lt!130020 (tuple2!4881 lt!130021 lt!130017)) lt!130018))))

(assert (=> b!258481 (= lt!130016 (addStillNotContains!126 lt!130020 lt!130021 lt!130017 lt!130018))))

(assert (=> b!258481 (= lt!130018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!258481 (= lt!130017 (get!3050 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258481 (= lt!130021 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258481 (= lt!130020 call!24578)))

(assert (=> b!258481 (= e!167526 (+!695 call!24578 (tuple2!4881 (select (arr!5938 (_keys!6929 thiss!1504)) #b00000000000000000000000000000000) (get!3050 (select (arr!5937 (_values!4743 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4760 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258482 () Bool)

(assert (=> b!258482 (= e!167522 (isEmpty!537 lt!130022))))

(assert (= (and d!61929 c!43812) b!258475))

(assert (= (and d!61929 (not c!43812)) b!258478))

(assert (= (and b!258478 c!43815) b!258481))

(assert (= (and b!258478 (not c!43815)) b!258474))

(assert (= (or b!258481 b!258474) bm!24575))

(assert (= (and d!61929 res!126362) b!258476))

(assert (= (and b!258476 res!126363) b!258479))

(assert (= (and b!258479 res!126365) b!258477))

(assert (= (and b!258479 c!43813) b!258473))

(assert (= (and b!258479 (not c!43813)) b!258480))

(assert (= (and b!258473 res!126364) b!258472))

(assert (= (and b!258480 c!43814) b!258471))

(assert (= (and b!258480 (not c!43814)) b!258482))

(declare-fun b_lambda!8191 () Bool)

(assert (=> (not b_lambda!8191) (not b!258472)))

(assert (=> b!258472 t!8838))

(declare-fun b_and!13803 () Bool)

(assert (= b_and!13801 (and (=> t!8838 result!5383) b_and!13803)))

(declare-fun b_lambda!8193 () Bool)

(assert (=> (not b_lambda!8193) (not b!258481)))

(assert (=> b!258481 t!8838))

(declare-fun b_and!13805 () Bool)

(assert (= b_and!13803 (and (=> t!8838 result!5383) b_and!13805)))

(assert (=> b!258472 m!272851))

(assert (=> b!258472 m!272851))

(declare-fun m!273461 () Bool)

(assert (=> b!258472 m!273461))

(assert (=> b!258472 m!273009))

(assert (=> b!258472 m!273009))

(assert (=> b!258472 m!272935))

(assert (=> b!258472 m!273011))

(assert (=> b!258472 m!272935))

(assert (=> b!258477 m!272851))

(assert (=> b!258477 m!272851))

(assert (=> b!258477 m!272893))

(declare-fun m!273463 () Bool)

(assert (=> b!258476 m!273463))

(declare-fun m!273465 () Bool)

(assert (=> d!61929 m!273465))

(assert (=> d!61929 m!272641))

(assert (=> b!258473 m!272851))

(assert (=> b!258473 m!272851))

(declare-fun m!273467 () Bool)

(assert (=> b!258473 m!273467))

(declare-fun m!273469 () Bool)

(assert (=> b!258482 m!273469))

(assert (=> b!258478 m!272851))

(assert (=> b!258478 m!272851))

(assert (=> b!258478 m!272893))

(assert (=> b!258481 m!272851))

(assert (=> b!258481 m!273009))

(assert (=> b!258481 m!273009))

(assert (=> b!258481 m!272935))

(assert (=> b!258481 m!273011))

(declare-fun m!273471 () Bool)

(assert (=> b!258481 m!273471))

(assert (=> b!258481 m!272935))

(assert (=> b!258481 m!273471))

(declare-fun m!273473 () Bool)

(assert (=> b!258481 m!273473))

(declare-fun m!273475 () Bool)

(assert (=> b!258481 m!273475))

(declare-fun m!273477 () Bool)

(assert (=> b!258481 m!273477))

(declare-fun m!273479 () Bool)

(assert (=> bm!24575 m!273479))

(assert (=> b!258471 m!273479))

(assert (=> bm!24545 d!61929))

(declare-fun d!61931 () Bool)

(assert (=> d!61931 (arrayContainsKey!0 lt!129603 lt!129729 #b00000000000000000000000000000000)))

(declare-fun lt!130023 () Unit!7978)

(assert (=> d!61931 (= lt!130023 (choose!13 lt!129603 lt!129729 #b00000000000000000000000000000000))))

(assert (=> d!61931 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61931 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129603 lt!129729 #b00000000000000000000000000000000) lt!130023)))

(declare-fun bs!9087 () Bool)

(assert (= bs!9087 d!61931))

(assert (=> bs!9087 m!272907))

(declare-fun m!273481 () Bool)

(assert (=> bs!9087 m!273481))

(assert (=> b!258069 d!61931))

(declare-fun d!61933 () Bool)

(declare-fun res!126366 () Bool)

(declare-fun e!167529 () Bool)

(assert (=> d!61933 (=> res!126366 e!167529)))

(assert (=> d!61933 (= res!126366 (= (select (arr!5938 lt!129603) #b00000000000000000000000000000000) lt!129729))))

(assert (=> d!61933 (= (arrayContainsKey!0 lt!129603 lt!129729 #b00000000000000000000000000000000) e!167529)))

(declare-fun b!258483 () Bool)

(declare-fun e!167530 () Bool)

(assert (=> b!258483 (= e!167529 e!167530)))

(declare-fun res!126367 () Bool)

(assert (=> b!258483 (=> (not res!126367) (not e!167530))))

(assert (=> b!258483 (= res!126367 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 lt!129603)))))

(declare-fun b!258484 () Bool)

(assert (=> b!258484 (= e!167530 (arrayContainsKey!0 lt!129603 lt!129729 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61933 (not res!126366)) b!258483))

(assert (= (and b!258483 res!126367) b!258484))

(assert (=> d!61933 m!272871))

(declare-fun m!273483 () Bool)

(assert (=> b!258484 m!273483))

(assert (=> b!258069 d!61933))

(declare-fun b!258485 () Bool)

(declare-fun e!167532 () SeekEntryResult!1170)

(declare-fun lt!130024 () SeekEntryResult!1170)

(assert (=> b!258485 (= e!167532 (Found!1170 (index!6852 lt!130024)))))

(declare-fun b!258486 () Bool)

(declare-fun e!167531 () SeekEntryResult!1170)

(assert (=> b!258486 (= e!167531 e!167532)))

(declare-fun lt!130026 () (_ BitVec 64))

(assert (=> b!258486 (= lt!130026 (select (arr!5938 lt!129603) (index!6852 lt!130024)))))

(declare-fun c!43817 () Bool)

(assert (=> b!258486 (= c!43817 (= lt!130026 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun d!61935 () Bool)

(declare-fun lt!130025 () SeekEntryResult!1170)

(assert (=> d!61935 (and (or ((_ is Undefined!1170) lt!130025) (not ((_ is Found!1170) lt!130025)) (and (bvsge (index!6851 lt!130025) #b00000000000000000000000000000000) (bvslt (index!6851 lt!130025) (size!6286 lt!129603)))) (or ((_ is Undefined!1170) lt!130025) ((_ is Found!1170) lt!130025) (not ((_ is MissingZero!1170) lt!130025)) (and (bvsge (index!6850 lt!130025) #b00000000000000000000000000000000) (bvslt (index!6850 lt!130025) (size!6286 lt!129603)))) (or ((_ is Undefined!1170) lt!130025) ((_ is Found!1170) lt!130025) ((_ is MissingZero!1170) lt!130025) (not ((_ is MissingVacant!1170) lt!130025)) (and (bvsge (index!6853 lt!130025) #b00000000000000000000000000000000) (bvslt (index!6853 lt!130025) (size!6286 lt!129603)))) (or ((_ is Undefined!1170) lt!130025) (ite ((_ is Found!1170) lt!130025) (= (select (arr!5938 lt!129603) (index!6851 lt!130025)) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1170) lt!130025) (= (select (arr!5938 lt!129603) (index!6850 lt!130025)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1170) lt!130025) (= (select (arr!5938 lt!129603) (index!6853 lt!130025)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61935 (= lt!130025 e!167531)))

(declare-fun c!43816 () Bool)

(assert (=> d!61935 (= c!43816 (and ((_ is Intermediate!1170) lt!130024) (undefined!1982 lt!130024)))))

(assert (=> d!61935 (= lt!130024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) (mask!11056 thiss!1504)) (select (arr!5938 lt!129603) #b00000000000000000000000000000000) lt!129603 (mask!11056 thiss!1504)))))

(assert (=> d!61935 (validMask!0 (mask!11056 thiss!1504))))

(assert (=> d!61935 (= (seekEntryOrOpen!0 (select (arr!5938 lt!129603) #b00000000000000000000000000000000) lt!129603 (mask!11056 thiss!1504)) lt!130025)))

(declare-fun b!258487 () Bool)

(declare-fun e!167533 () SeekEntryResult!1170)

(assert (=> b!258487 (= e!167533 (seekKeyOrZeroReturnVacant!0 (x!25037 lt!130024) (index!6852 lt!130024) (index!6852 lt!130024) (select (arr!5938 lt!129603) #b00000000000000000000000000000000) lt!129603 (mask!11056 thiss!1504)))))

(declare-fun b!258488 () Bool)

(assert (=> b!258488 (= e!167531 Undefined!1170)))

(declare-fun b!258489 () Bool)

(declare-fun c!43818 () Bool)

(assert (=> b!258489 (= c!43818 (= lt!130026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258489 (= e!167532 e!167533)))

(declare-fun b!258490 () Bool)

(assert (=> b!258490 (= e!167533 (MissingZero!1170 (index!6852 lt!130024)))))

(assert (= (and d!61935 c!43816) b!258488))

(assert (= (and d!61935 (not c!43816)) b!258486))

(assert (= (and b!258486 c!43817) b!258485))

(assert (= (and b!258486 (not c!43817)) b!258489))

(assert (= (and b!258489 c!43818) b!258490))

(assert (= (and b!258489 (not c!43818)) b!258487))

(declare-fun m!273485 () Bool)

(assert (=> b!258486 m!273485))

(declare-fun m!273487 () Bool)

(assert (=> d!61935 m!273487))

(assert (=> d!61935 m!272871))

(declare-fun m!273489 () Bool)

(assert (=> d!61935 m!273489))

(declare-fun m!273491 () Bool)

(assert (=> d!61935 m!273491))

(declare-fun m!273493 () Bool)

(assert (=> d!61935 m!273493))

(declare-fun m!273495 () Bool)

(assert (=> d!61935 m!273495))

(assert (=> d!61935 m!272641))

(assert (=> d!61935 m!272871))

(assert (=> d!61935 m!273487))

(assert (=> b!258487 m!272871))

(declare-fun m!273497 () Bool)

(assert (=> b!258487 m!273497))

(assert (=> b!258069 d!61935))

(declare-fun d!61937 () Bool)

(declare-fun lt!130029 () Bool)

(declare-fun content!169 (List!3780) (InoxSet (_ BitVec 64)))

(assert (=> d!61937 (= lt!130029 (select (content!169 Nil!3777) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun e!167539 () Bool)

(assert (=> d!61937 (= lt!130029 e!167539)))

(declare-fun res!126373 () Bool)

(assert (=> d!61937 (=> (not res!126373) (not e!167539))))

(assert (=> d!61937 (= res!126373 ((_ is Cons!3776) Nil!3777))))

(assert (=> d!61937 (= (contains!1859 Nil!3777 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) lt!130029)))

(declare-fun b!258495 () Bool)

(declare-fun e!167538 () Bool)

(assert (=> b!258495 (= e!167539 e!167538)))

(declare-fun res!126372 () Bool)

(assert (=> b!258495 (=> res!126372 e!167538)))

(assert (=> b!258495 (= res!126372 (= (h!4438 Nil!3777) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258496 () Bool)

(assert (=> b!258496 (= e!167538 (contains!1859 (t!8834 Nil!3777) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (= (and d!61937 res!126373) b!258495))

(assert (= (and b!258495 (not res!126372)) b!258496))

(declare-fun m!273499 () Bool)

(assert (=> d!61937 m!273499))

(assert (=> d!61937 m!272871))

(declare-fun m!273501 () Bool)

(assert (=> d!61937 m!273501))

(assert (=> b!258496 m!272871))

(declare-fun m!273503 () Bool)

(assert (=> b!258496 m!273503))

(assert (=> b!258022 d!61937))

(declare-fun d!61939 () Bool)

(declare-fun e!167541 () Bool)

(assert (=> d!61939 e!167541))

(declare-fun res!126374 () Bool)

(assert (=> d!61939 (=> res!126374 e!167541)))

(declare-fun lt!130030 () Bool)

(assert (=> d!61939 (= res!126374 (not lt!130030))))

(declare-fun lt!130032 () Bool)

(assert (=> d!61939 (= lt!130030 lt!130032)))

(declare-fun lt!130031 () Unit!7978)

(declare-fun e!167540 () Unit!7978)

(assert (=> d!61939 (= lt!130031 e!167540)))

(declare-fun c!43819 () Bool)

(assert (=> d!61939 (= c!43819 lt!130032)))

(assert (=> d!61939 (= lt!130032 (containsKey!303 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!61939 (= (contains!1857 lt!129742 (_1!2451 (tuple2!4881 key!932 v!346))) lt!130030)))

(declare-fun b!258497 () Bool)

(declare-fun lt!130033 () Unit!7978)

(assert (=> b!258497 (= e!167540 lt!130033)))

(assert (=> b!258497 (= lt!130033 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> b!258497 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun b!258498 () Bool)

(declare-fun Unit!7999 () Unit!7978)

(assert (=> b!258498 (= e!167540 Unit!7999)))

(declare-fun b!258499 () Bool)

(assert (=> b!258499 (= e!167541 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129742) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(assert (= (and d!61939 c!43819) b!258497))

(assert (= (and d!61939 (not c!43819)) b!258498))

(assert (= (and d!61939 (not res!126374)) b!258499))

(declare-fun m!273505 () Bool)

(assert (=> d!61939 m!273505))

(declare-fun m!273507 () Bool)

(assert (=> b!258497 m!273507))

(assert (=> b!258497 m!272919))

(assert (=> b!258497 m!272919))

(declare-fun m!273509 () Bool)

(assert (=> b!258497 m!273509))

(assert (=> b!258499 m!272919))

(assert (=> b!258499 m!272919))

(assert (=> b!258499 m!273509))

(assert (=> d!61759 d!61939))

(declare-fun d!61941 () Bool)

(declare-fun c!43820 () Bool)

(assert (=> d!61941 (= c!43820 (and ((_ is Cons!3775) lt!129743) (= (_1!2451 (h!4437 lt!129743)) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun e!167542 () Option!317)

(assert (=> d!61941 (= (getValueByKey!311 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346))) e!167542)))

(declare-fun b!258500 () Bool)

(assert (=> b!258500 (= e!167542 (Some!316 (_2!2451 (h!4437 lt!129743))))))

(declare-fun b!258501 () Bool)

(declare-fun e!167543 () Option!317)

(assert (=> b!258501 (= e!167542 e!167543)))

(declare-fun c!43821 () Bool)

(assert (=> b!258501 (= c!43821 (and ((_ is Cons!3775) lt!129743) (not (= (_1!2451 (h!4437 lt!129743)) (_1!2451 (tuple2!4881 key!932 v!346))))))))

(declare-fun b!258503 () Bool)

(assert (=> b!258503 (= e!167543 None!315)))

(declare-fun b!258502 () Bool)

(assert (=> b!258502 (= e!167543 (getValueByKey!311 (t!8833 lt!129743) (_1!2451 (tuple2!4881 key!932 v!346))))))

(assert (= (and d!61941 c!43820) b!258500))

(assert (= (and d!61941 (not c!43820)) b!258501))

(assert (= (and b!258501 c!43821) b!258502))

(assert (= (and b!258501 (not c!43821)) b!258503))

(declare-fun m!273511 () Bool)

(assert (=> b!258502 m!273511))

(assert (=> d!61759 d!61941))

(declare-fun d!61943 () Bool)

(assert (=> d!61943 (= (getValueByKey!311 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346))) (Some!316 (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lt!130036 () Unit!7978)

(declare-fun choose!1258 (List!3779 (_ BitVec 64) V!8449) Unit!7978)

(assert (=> d!61943 (= lt!130036 (choose!1258 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun e!167546 () Bool)

(assert (=> d!61943 e!167546))

(declare-fun res!126379 () Bool)

(assert (=> d!61943 (=> (not res!126379) (not e!167546))))

(assert (=> d!61943 (= res!126379 (isStrictlySorted!368 lt!129743))))

(assert (=> d!61943 (= (lemmaContainsTupThenGetReturnValue!170 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))) lt!130036)))

(declare-fun b!258508 () Bool)

(declare-fun res!126380 () Bool)

(assert (=> b!258508 (=> (not res!126380) (not e!167546))))

(assert (=> b!258508 (= res!126380 (containsKey!303 lt!129743 (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun b!258509 () Bool)

(assert (=> b!258509 (= e!167546 (contains!1860 lt!129743 (tuple2!4881 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346)))))))

(assert (= (and d!61943 res!126379) b!258508))

(assert (= (and b!258508 res!126380) b!258509))

(assert (=> d!61943 m!272913))

(declare-fun m!273513 () Bool)

(assert (=> d!61943 m!273513))

(declare-fun m!273515 () Bool)

(assert (=> d!61943 m!273515))

(declare-fun m!273517 () Bool)

(assert (=> b!258508 m!273517))

(declare-fun m!273519 () Bool)

(assert (=> b!258509 m!273519))

(assert (=> d!61759 d!61943))

(declare-fun b!258530 () Bool)

(declare-fun e!167557 () List!3779)

(declare-fun e!167560 () List!3779)

(assert (=> b!258530 (= e!167557 e!167560)))

(declare-fun c!43833 () Bool)

(assert (=> b!258530 (= c!43833 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (= (_1!2451 (h!4437 (toList!1907 lt!129600))) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun b!258531 () Bool)

(declare-fun call!24586 () List!3779)

(assert (=> b!258531 (= e!167557 call!24586)))

(declare-fun c!43831 () Bool)

(declare-fun b!258532 () Bool)

(assert (=> b!258532 (= c!43831 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (bvsgt (_1!2451 (h!4437 (toList!1907 lt!129600))) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun e!167559 () List!3779)

(assert (=> b!258532 (= e!167560 e!167559)))

(declare-fun bm!24582 () Bool)

(declare-fun call!24585 () List!3779)

(declare-fun call!24587 () List!3779)

(assert (=> bm!24582 (= call!24585 call!24587)))

(declare-fun b!258533 () Bool)

(declare-fun res!126385 () Bool)

(declare-fun e!167558 () Bool)

(assert (=> b!258533 (=> (not res!126385) (not e!167558))))

(declare-fun lt!130039 () List!3779)

(assert (=> b!258533 (= res!126385 (containsKey!303 lt!130039 (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun b!258534 () Bool)

(assert (=> b!258534 (= e!167559 call!24585)))

(declare-fun b!258535 () Bool)

(assert (=> b!258535 (= e!167558 (contains!1860 lt!130039 (tuple2!4881 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun b!258536 () Bool)

(assert (=> b!258536 (= e!167559 call!24585)))

(declare-fun b!258537 () Bool)

(assert (=> b!258537 (= e!167560 call!24587)))

(declare-fun d!61945 () Bool)

(assert (=> d!61945 e!167558))

(declare-fun res!126386 () Bool)

(assert (=> d!61945 (=> (not res!126386) (not e!167558))))

(assert (=> d!61945 (= res!126386 (isStrictlySorted!368 lt!130039))))

(assert (=> d!61945 (= lt!130039 e!167557)))

(declare-fun c!43830 () Bool)

(assert (=> d!61945 (= c!43830 (and ((_ is Cons!3775) (toList!1907 lt!129600)) (bvslt (_1!2451 (h!4437 (toList!1907 lt!129600))) (_1!2451 (tuple2!4881 key!932 v!346)))))))

(assert (=> d!61945 (isStrictlySorted!368 (toList!1907 lt!129600))))

(assert (=> d!61945 (= (insertStrictlySorted!173 (toList!1907 lt!129600) (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))) lt!130039)))

(declare-fun e!167561 () List!3779)

(declare-fun b!258538 () Bool)

(assert (=> b!258538 (= e!167561 (insertStrictlySorted!173 (t!8833 (toList!1907 lt!129600)) (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun bm!24583 () Bool)

(declare-fun $colon$colon!103 (List!3779 tuple2!4880) List!3779)

(assert (=> bm!24583 (= call!24586 ($colon$colon!103 e!167561 (ite c!43830 (h!4437 (toList!1907 lt!129600)) (tuple2!4881 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))))

(declare-fun c!43832 () Bool)

(assert (=> bm!24583 (= c!43832 c!43830)))

(declare-fun bm!24584 () Bool)

(assert (=> bm!24584 (= call!24587 call!24586)))

(declare-fun b!258539 () Bool)

(assert (=> b!258539 (= e!167561 (ite c!43833 (t!8833 (toList!1907 lt!129600)) (ite c!43831 (Cons!3775 (h!4437 (toList!1907 lt!129600)) (t!8833 (toList!1907 lt!129600))) Nil!3776)))))

(assert (= (and d!61945 c!43830) b!258531))

(assert (= (and d!61945 (not c!43830)) b!258530))

(assert (= (and b!258530 c!43833) b!258537))

(assert (= (and b!258530 (not c!43833)) b!258532))

(assert (= (and b!258532 c!43831) b!258536))

(assert (= (and b!258532 (not c!43831)) b!258534))

(assert (= (or b!258536 b!258534) bm!24582))

(assert (= (or b!258537 bm!24582) bm!24584))

(assert (= (or b!258531 bm!24584) bm!24583))

(assert (= (and bm!24583 c!43832) b!258538))

(assert (= (and bm!24583 (not c!43832)) b!258539))

(assert (= (and d!61945 res!126386) b!258533))

(assert (= (and b!258533 res!126385) b!258535))

(declare-fun m!273521 () Bool)

(assert (=> b!258538 m!273521))

(declare-fun m!273523 () Bool)

(assert (=> b!258533 m!273523))

(declare-fun m!273525 () Bool)

(assert (=> bm!24583 m!273525))

(declare-fun m!273527 () Bool)

(assert (=> b!258535 m!273527))

(declare-fun m!273529 () Bool)

(assert (=> d!61945 m!273529))

(assert (=> d!61945 m!273139))

(assert (=> d!61759 d!61945))

(assert (=> d!61783 d!61755))

(assert (=> b!257973 d!61751))

(declare-fun d!61947 () Bool)

(declare-fun e!167563 () Bool)

(assert (=> d!61947 e!167563))

(declare-fun res!126387 () Bool)

(assert (=> d!61947 (=> res!126387 e!167563)))

(declare-fun lt!130040 () Bool)

(assert (=> d!61947 (= res!126387 (not lt!130040))))

(declare-fun lt!130042 () Bool)

(assert (=> d!61947 (= lt!130040 lt!130042)))

(declare-fun lt!130041 () Unit!7978)

(declare-fun e!167562 () Unit!7978)

(assert (=> d!61947 (= lt!130041 e!167562)))

(declare-fun c!43834 () Bool)

(assert (=> d!61947 (= c!43834 lt!130042)))

(assert (=> d!61947 (= lt!130042 (containsKey!303 (toList!1907 lt!129797) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> d!61947 (= (contains!1857 lt!129797 (select (arr!5938 lt!129603) #b00000000000000000000000000000000)) lt!130040)))

(declare-fun b!258540 () Bool)

(declare-fun lt!130043 () Unit!7978)

(assert (=> b!258540 (= e!167562 lt!130043)))

(assert (=> b!258540 (= lt!130043 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 lt!129797) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(assert (=> b!258540 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) (select (arr!5938 lt!129603) #b00000000000000000000000000000000)))))

(declare-fun b!258541 () Bool)

(declare-fun Unit!8000 () Unit!7978)

(assert (=> b!258541 (= e!167562 Unit!8000)))

(declare-fun b!258542 () Bool)

(assert (=> b!258542 (= e!167563 (isDefined!253 (getValueByKey!311 (toList!1907 lt!129797) (select (arr!5938 lt!129603) #b00000000000000000000000000000000))))))

(assert (= (and d!61947 c!43834) b!258540))

(assert (= (and d!61947 (not c!43834)) b!258541))

(assert (= (and d!61947 (not res!126387)) b!258542))

(assert (=> d!61947 m!272871))

(declare-fun m!273531 () Bool)

(assert (=> d!61947 m!273531))

(assert (=> b!258540 m!272871))

(declare-fun m!273533 () Bool)

(assert (=> b!258540 m!273533))

(assert (=> b!258540 m!272871))

(assert (=> b!258540 m!273339))

(assert (=> b!258540 m!273339))

(declare-fun m!273535 () Bool)

(assert (=> b!258540 m!273535))

(assert (=> b!258542 m!272871))

(assert (=> b!258542 m!273339))

(assert (=> b!258542 m!273339))

(assert (=> b!258542 m!273535))

(assert (=> b!258132 d!61947))

(declare-fun d!61949 () Bool)

(assert (=> d!61949 (= (validKeyInArray!0 (select (arr!5938 (_keys!6929 thiss!1504)) index!297)) (and (not (= (select (arr!5938 (_keys!6929 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5938 (_keys!6929 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258035 d!61949))

(declare-fun d!61951 () Bool)

(assert (=> d!61951 (= (apply!255 lt!129797 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3051 (getValueByKey!311 (toList!1907 lt!129797) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9088 () Bool)

(assert (= bs!9088 d!61951))

(assert (=> bs!9088 m!273079))

(assert (=> bs!9088 m!273079))

(declare-fun m!273537 () Bool)

(assert (=> bs!9088 m!273537))

(assert (=> b!258147 d!61951))

(assert (=> d!61775 d!61731))

(declare-fun d!61953 () Bool)

(declare-fun e!167566 () Bool)

(assert (=> d!61953 e!167566))

(declare-fun res!126393 () Bool)

(assert (=> d!61953 (=> (not res!126393) (not e!167566))))

(declare-fun lt!130046 () SeekEntryResult!1170)

(assert (=> d!61953 (= res!126393 ((_ is Found!1170) lt!130046))))

(assert (=> d!61953 (= lt!130046 (seekEntryOrOpen!0 key!932 (_keys!6929 thiss!1504) (mask!11056 thiss!1504)))))

(assert (=> d!61953 true))

(declare-fun _$33!174 () Unit!7978)

(assert (=> d!61953 (= (choose!1253 (_keys!6929 thiss!1504) (_values!4743 thiss!1504) (mask!11056 thiss!1504) (extraKeys!4497 thiss!1504) (zeroValue!4601 thiss!1504) (minValue!4601 thiss!1504) key!932 (defaultEntry!4760 thiss!1504)) _$33!174)))

(declare-fun b!258547 () Bool)

(declare-fun res!126392 () Bool)

(assert (=> b!258547 (=> (not res!126392) (not e!167566))))

(assert (=> b!258547 (= res!126392 (inRange!0 (index!6851 lt!130046) (mask!11056 thiss!1504)))))

(declare-fun b!258548 () Bool)

(assert (=> b!258548 (= e!167566 (= (select (arr!5938 (_keys!6929 thiss!1504)) (index!6851 lt!130046)) key!932))))

(assert (= (and d!61953 res!126393) b!258547))

(assert (= (and b!258547 res!126392) b!258548))

(assert (=> d!61953 m!272701))

(declare-fun m!273539 () Bool)

(assert (=> b!258547 m!273539))

(declare-fun m!273541 () Bool)

(assert (=> b!258548 m!273541))

(assert (=> d!61775 d!61953))

(assert (=> d!61775 d!61755))

(declare-fun d!61955 () Bool)

(assert (=> d!61955 (= (apply!255 (+!695 lt!129851 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) lt!129842) (apply!255 lt!129851 lt!129842))))

(declare-fun lt!130047 () Unit!7978)

(assert (=> d!61955 (= lt!130047 (choose!1256 lt!129851 lt!129858 (minValue!4601 thiss!1504) lt!129842))))

(declare-fun e!167567 () Bool)

(assert (=> d!61955 e!167567))

(declare-fun res!126394 () Bool)

(assert (=> d!61955 (=> (not res!126394) (not e!167567))))

(assert (=> d!61955 (= res!126394 (contains!1857 lt!129851 lt!129842))))

(assert (=> d!61955 (= (addApplyDifferent!231 lt!129851 lt!129858 (minValue!4601 thiss!1504) lt!129842) lt!130047)))

(declare-fun b!258549 () Bool)

(assert (=> b!258549 (= e!167567 (not (= lt!129842 lt!129858)))))

(assert (= (and d!61955 res!126394) b!258549))

(declare-fun m!273543 () Bool)

(assert (=> d!61955 m!273543))

(assert (=> d!61955 m!273021))

(assert (=> d!61955 m!273027))

(assert (=> d!61955 m!273029))

(assert (=> d!61955 m!273027))

(declare-fun m!273545 () Bool)

(assert (=> d!61955 m!273545))

(assert (=> b!258170 d!61955))

(declare-fun d!61957 () Bool)

(declare-fun e!167569 () Bool)

(assert (=> d!61957 e!167569))

(declare-fun res!126395 () Bool)

(assert (=> d!61957 (=> res!126395 e!167569)))

(declare-fun lt!130048 () Bool)

(assert (=> d!61957 (= res!126395 (not lt!130048))))

(declare-fun lt!130050 () Bool)

(assert (=> d!61957 (= lt!130048 lt!130050)))

(declare-fun lt!130049 () Unit!7978)

(declare-fun e!167568 () Unit!7978)

(assert (=> d!61957 (= lt!130049 e!167568)))

(declare-fun c!43835 () Bool)

(assert (=> d!61957 (= c!43835 lt!130050)))

(assert (=> d!61957 (= lt!130050 (containsKey!303 (toList!1907 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) lt!129848))))

(assert (=> d!61957 (= (contains!1857 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) lt!129848) lt!130048)))

(declare-fun b!258550 () Bool)

(declare-fun lt!130051 () Unit!7978)

(assert (=> b!258550 (= e!167568 lt!130051)))

(assert (=> b!258550 (= lt!130051 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1907 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) lt!129848))))

(assert (=> b!258550 (isDefined!253 (getValueByKey!311 (toList!1907 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) lt!129848))))

(declare-fun b!258551 () Bool)

(declare-fun Unit!8001 () Unit!7978)

(assert (=> b!258551 (= e!167568 Unit!8001)))

(declare-fun b!258552 () Bool)

(assert (=> b!258552 (= e!167569 (isDefined!253 (getValueByKey!311 (toList!1907 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) lt!129848)))))

(assert (= (and d!61957 c!43835) b!258550))

(assert (= (and d!61957 (not c!43835)) b!258551))

(assert (= (and d!61957 (not res!126395)) b!258552))

(declare-fun m!273547 () Bool)

(assert (=> d!61957 m!273547))

(declare-fun m!273549 () Bool)

(assert (=> b!258550 m!273549))

(declare-fun m!273551 () Bool)

(assert (=> b!258550 m!273551))

(assert (=> b!258550 m!273551))

(declare-fun m!273553 () Bool)

(assert (=> b!258550 m!273553))

(assert (=> b!258552 m!273551))

(assert (=> b!258552 m!273551))

(assert (=> b!258552 m!273553))

(assert (=> b!258170 d!61957))

(declare-fun d!61959 () Bool)

(assert (=> d!61959 (contains!1857 (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) lt!129848)))

(declare-fun lt!130052 () Unit!7978)

(assert (=> d!61959 (= lt!130052 (choose!1257 lt!129857 lt!129844 (zeroValue!4601 thiss!1504) lt!129848))))

(assert (=> d!61959 (contains!1857 lt!129857 lt!129848)))

(assert (=> d!61959 (= (addStillContains!231 lt!129857 lt!129844 (zeroValue!4601 thiss!1504) lt!129848) lt!130052)))

(declare-fun bs!9089 () Bool)

(assert (= bs!9089 d!61959))

(assert (=> bs!9089 m!273035))

(assert (=> bs!9089 m!273035))

(assert (=> bs!9089 m!273043))

(declare-fun m!273555 () Bool)

(assert (=> bs!9089 m!273555))

(declare-fun m!273557 () Bool)

(assert (=> bs!9089 m!273557))

(assert (=> b!258170 d!61959))

(declare-fun d!61961 () Bool)

(assert (=> d!61961 (= (apply!255 (+!695 lt!129851 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) lt!129842) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129851 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))) lt!129842)))))

(declare-fun bs!9090 () Bool)

(assert (= bs!9090 d!61961))

(declare-fun m!273559 () Bool)

(assert (=> bs!9090 m!273559))

(assert (=> bs!9090 m!273559))

(declare-fun m!273561 () Bool)

(assert (=> bs!9090 m!273561))

(assert (=> b!258170 d!61961))

(declare-fun d!61963 () Bool)

(declare-fun e!167570 () Bool)

(assert (=> d!61963 e!167570))

(declare-fun res!126397 () Bool)

(assert (=> d!61963 (=> (not res!126397) (not e!167570))))

(declare-fun lt!130055 () ListLongMap!3783)

(assert (=> d!61963 (= res!126397 (contains!1857 lt!130055 (_1!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130056 () List!3779)

(assert (=> d!61963 (= lt!130055 (ListLongMap!3784 lt!130056))))

(declare-fun lt!130053 () Unit!7978)

(declare-fun lt!130054 () Unit!7978)

(assert (=> d!61963 (= lt!130053 lt!130054)))

(assert (=> d!61963 (= (getValueByKey!311 lt!130056 (_1!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61963 (= lt!130054 (lemmaContainsTupThenGetReturnValue!170 lt!130056 (_1!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61963 (= lt!130056 (insertStrictlySorted!173 (toList!1907 lt!129855) (_1!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61963 (= (+!695 lt!129855 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) lt!130055)))

(declare-fun b!258553 () Bool)

(declare-fun res!126396 () Bool)

(assert (=> b!258553 (=> (not res!126396) (not e!167570))))

(assert (=> b!258553 (= res!126396 (= (getValueByKey!311 (toList!1907 lt!130055) (_1!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258554 () Bool)

(assert (=> b!258554 (= e!167570 (contains!1860 (toList!1907 lt!130055) (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!61963 res!126397) b!258553))

(assert (= (and b!258553 res!126396) b!258554))

(declare-fun m!273563 () Bool)

(assert (=> d!61963 m!273563))

(declare-fun m!273565 () Bool)

(assert (=> d!61963 m!273565))

(declare-fun m!273567 () Bool)

(assert (=> d!61963 m!273567))

(declare-fun m!273569 () Bool)

(assert (=> d!61963 m!273569))

(declare-fun m!273571 () Bool)

(assert (=> b!258553 m!273571))

(declare-fun m!273573 () Bool)

(assert (=> b!258554 m!273573))

(assert (=> b!258170 d!61963))

(declare-fun d!61965 () Bool)

(assert (=> d!61965 (= (apply!255 lt!129851 lt!129842) (get!3051 (getValueByKey!311 (toList!1907 lt!129851) lt!129842)))))

(declare-fun bs!9091 () Bool)

(assert (= bs!9091 d!61965))

(declare-fun m!273575 () Bool)

(assert (=> bs!9091 m!273575))

(assert (=> bs!9091 m!273575))

(declare-fun m!273577 () Bool)

(assert (=> bs!9091 m!273577))

(assert (=> b!258170 d!61965))

(declare-fun d!61967 () Bool)

(declare-fun e!167571 () Bool)

(assert (=> d!61967 e!167571))

(declare-fun res!126399 () Bool)

(assert (=> d!61967 (=> (not res!126399) (not e!167571))))

(declare-fun lt!130059 () ListLongMap!3783)

(assert (=> d!61967 (= res!126399 (contains!1857 lt!130059 (_1!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130060 () List!3779)

(assert (=> d!61967 (= lt!130059 (ListLongMap!3784 lt!130060))))

(declare-fun lt!130057 () Unit!7978)

(declare-fun lt!130058 () Unit!7978)

(assert (=> d!61967 (= lt!130057 lt!130058)))

(assert (=> d!61967 (= (getValueByKey!311 lt!130060 (_1!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))))))

(assert (=> d!61967 (= lt!130058 (lemmaContainsTupThenGetReturnValue!170 lt!130060 (_1!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))))))

(assert (=> d!61967 (= lt!130060 (insertStrictlySorted!173 (toList!1907 lt!129851) (_1!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))))))

(assert (=> d!61967 (= (+!695 lt!129851 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))) lt!130059)))

(declare-fun b!258555 () Bool)

(declare-fun res!126398 () Bool)

(assert (=> b!258555 (=> (not res!126398) (not e!167571))))

(assert (=> b!258555 (= res!126398 (= (getValueByKey!311 (toList!1907 lt!130059) (_1!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))))))))

(declare-fun b!258556 () Bool)

(assert (=> b!258556 (= e!167571 (contains!1860 (toList!1907 lt!130059) (tuple2!4881 lt!129858 (minValue!4601 thiss!1504))))))

(assert (= (and d!61967 res!126399) b!258555))

(assert (= (and b!258555 res!126398) b!258556))

(declare-fun m!273579 () Bool)

(assert (=> d!61967 m!273579))

(declare-fun m!273581 () Bool)

(assert (=> d!61967 m!273581))

(declare-fun m!273583 () Bool)

(assert (=> d!61967 m!273583))

(declare-fun m!273585 () Bool)

(assert (=> d!61967 m!273585))

(declare-fun m!273587 () Bool)

(assert (=> b!258555 m!273587))

(declare-fun m!273589 () Bool)

(assert (=> b!258556 m!273589))

(assert (=> b!258170 d!61967))

(declare-fun d!61969 () Bool)

(assert (=> d!61969 (= (apply!255 lt!129855 lt!129840) (get!3051 (getValueByKey!311 (toList!1907 lt!129855) lt!129840)))))

(declare-fun bs!9092 () Bool)

(assert (= bs!9092 d!61969))

(declare-fun m!273591 () Bool)

(assert (=> bs!9092 m!273591))

(assert (=> bs!9092 m!273591))

(declare-fun m!273593 () Bool)

(assert (=> bs!9092 m!273593))

(assert (=> b!258170 d!61969))

(declare-fun d!61971 () Bool)

(assert (=> d!61971 (= (apply!255 (+!695 lt!129855 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) lt!129840) (apply!255 lt!129855 lt!129840))))

(declare-fun lt!130061 () Unit!7978)

(assert (=> d!61971 (= lt!130061 (choose!1256 lt!129855 lt!129859 (zeroValue!4601 thiss!1504) lt!129840))))

(declare-fun e!167572 () Bool)

(assert (=> d!61971 e!167572))

(declare-fun res!126400 () Bool)

(assert (=> d!61971 (=> (not res!126400) (not e!167572))))

(assert (=> d!61971 (= res!126400 (contains!1857 lt!129855 lt!129840))))

(assert (=> d!61971 (= (addApplyDifferent!231 lt!129855 lt!129859 (zeroValue!4601 thiss!1504) lt!129840) lt!130061)))

(declare-fun b!258557 () Bool)

(assert (=> b!258557 (= e!167572 (not (= lt!129840 lt!129859)))))

(assert (= (and d!61971 res!126400) b!258557))

(declare-fun m!273595 () Bool)

(assert (=> d!61971 m!273595))

(assert (=> d!61971 m!273039))

(assert (=> d!61971 m!273025))

(assert (=> d!61971 m!273041))

(assert (=> d!61971 m!273025))

(declare-fun m!273597 () Bool)

(assert (=> d!61971 m!273597))

(assert (=> b!258170 d!61971))

(assert (=> b!258170 d!61929))

(declare-fun d!61973 () Bool)

(assert (=> d!61973 (= (apply!255 lt!129846 lt!129854) (get!3051 (getValueByKey!311 (toList!1907 lt!129846) lt!129854)))))

(declare-fun bs!9093 () Bool)

(assert (= bs!9093 d!61973))

(declare-fun m!273599 () Bool)

(assert (=> bs!9093 m!273599))

(assert (=> bs!9093 m!273599))

(declare-fun m!273601 () Bool)

(assert (=> bs!9093 m!273601))

(assert (=> b!258170 d!61973))

(declare-fun d!61975 () Bool)

(assert (=> d!61975 (= (apply!255 (+!695 lt!129846 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) lt!129854) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129846 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))) lt!129854)))))

(declare-fun bs!9094 () Bool)

(assert (= bs!9094 d!61975))

(declare-fun m!273603 () Bool)

(assert (=> bs!9094 m!273603))

(assert (=> bs!9094 m!273603))

(declare-fun m!273605 () Bool)

(assert (=> bs!9094 m!273605))

(assert (=> b!258170 d!61975))

(declare-fun d!61977 () Bool)

(declare-fun e!167573 () Bool)

(assert (=> d!61977 e!167573))

(declare-fun res!126402 () Bool)

(assert (=> d!61977 (=> (not res!126402) (not e!167573))))

(declare-fun lt!130064 () ListLongMap!3783)

(assert (=> d!61977 (= res!126402 (contains!1857 lt!130064 (_1!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))))))

(declare-fun lt!130065 () List!3779)

(assert (=> d!61977 (= lt!130064 (ListLongMap!3784 lt!130065))))

(declare-fun lt!130062 () Unit!7978)

(declare-fun lt!130063 () Unit!7978)

(assert (=> d!61977 (= lt!130062 lt!130063)))

(assert (=> d!61977 (= (getValueByKey!311 lt!130065 (_1!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))))))

(assert (=> d!61977 (= lt!130063 (lemmaContainsTupThenGetReturnValue!170 lt!130065 (_1!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))))))

(assert (=> d!61977 (= lt!130065 (insertStrictlySorted!173 (toList!1907 lt!129846) (_1!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))))))

(assert (=> d!61977 (= (+!695 lt!129846 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) lt!130064)))

(declare-fun b!258558 () Bool)

(declare-fun res!126401 () Bool)

(assert (=> b!258558 (=> (not res!126401) (not e!167573))))

(assert (=> b!258558 (= res!126401 (= (getValueByKey!311 (toList!1907 lt!130064) (_1!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))))))))

(declare-fun b!258559 () Bool)

(assert (=> b!258559 (= e!167573 (contains!1860 (toList!1907 lt!130064) (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))))))

(assert (= (and d!61977 res!126402) b!258558))

(assert (= (and b!258558 res!126401) b!258559))

(declare-fun m!273607 () Bool)

(assert (=> d!61977 m!273607))

(declare-fun m!273609 () Bool)

(assert (=> d!61977 m!273609))

(declare-fun m!273611 () Bool)

(assert (=> d!61977 m!273611))

(declare-fun m!273613 () Bool)

(assert (=> d!61977 m!273613))

(declare-fun m!273615 () Bool)

(assert (=> b!258558 m!273615))

(declare-fun m!273617 () Bool)

(assert (=> b!258559 m!273617))

(assert (=> b!258170 d!61977))

(declare-fun d!61979 () Bool)

(assert (=> d!61979 (= (apply!255 (+!695 lt!129855 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504))) lt!129840) (get!3051 (getValueByKey!311 (toList!1907 (+!695 lt!129855 (tuple2!4881 lt!129859 (zeroValue!4601 thiss!1504)))) lt!129840)))))

(declare-fun bs!9095 () Bool)

(assert (= bs!9095 d!61979))

(declare-fun m!273619 () Bool)

(assert (=> bs!9095 m!273619))

(assert (=> bs!9095 m!273619))

(declare-fun m!273621 () Bool)

(assert (=> bs!9095 m!273621))

(assert (=> b!258170 d!61979))

(declare-fun d!61981 () Bool)

(declare-fun e!167574 () Bool)

(assert (=> d!61981 e!167574))

(declare-fun res!126404 () Bool)

(assert (=> d!61981 (=> (not res!126404) (not e!167574))))

(declare-fun lt!130068 () ListLongMap!3783)

(assert (=> d!61981 (= res!126404 (contains!1857 lt!130068 (_1!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))))))

(declare-fun lt!130069 () List!3779)

(assert (=> d!61981 (= lt!130068 (ListLongMap!3784 lt!130069))))

(declare-fun lt!130066 () Unit!7978)

(declare-fun lt!130067 () Unit!7978)

(assert (=> d!61981 (= lt!130066 lt!130067)))

(assert (=> d!61981 (= (getValueByKey!311 lt!130069 (_1!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61981 (= lt!130067 (lemmaContainsTupThenGetReturnValue!170 lt!130069 (_1!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61981 (= lt!130069 (insertStrictlySorted!173 (toList!1907 lt!129857) (_1!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) (_2!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))))))

(assert (=> d!61981 (= (+!695 lt!129857 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))) lt!130068)))

(declare-fun b!258560 () Bool)

(declare-fun res!126403 () Bool)

(assert (=> b!258560 (=> (not res!126403) (not e!167574))))

(assert (=> b!258560 (= res!126403 (= (getValueByKey!311 (toList!1907 lt!130068) (_1!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504)))) (Some!316 (_2!2451 (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))))))))

(declare-fun b!258561 () Bool)

(assert (=> b!258561 (= e!167574 (contains!1860 (toList!1907 lt!130068) (tuple2!4881 lt!129844 (zeroValue!4601 thiss!1504))))))

(assert (= (and d!61981 res!126404) b!258560))

(assert (= (and b!258560 res!126403) b!258561))

(declare-fun m!273623 () Bool)

(assert (=> d!61981 m!273623))

(declare-fun m!273625 () Bool)

(assert (=> d!61981 m!273625))

(declare-fun m!273627 () Bool)

(assert (=> d!61981 m!273627))

(declare-fun m!273629 () Bool)

(assert (=> d!61981 m!273629))

(declare-fun m!273631 () Bool)

(assert (=> b!258560 m!273631))

(declare-fun m!273633 () Bool)

(assert (=> b!258561 m!273633))

(assert (=> b!258170 d!61981))

(declare-fun d!61983 () Bool)

(assert (=> d!61983 (= (apply!255 (+!695 lt!129846 (tuple2!4881 lt!129841 (minValue!4601 thiss!1504))) lt!129854) (apply!255 lt!129846 lt!129854))))

(declare-fun lt!130070 () Unit!7978)

(assert (=> d!61983 (= lt!130070 (choose!1256 lt!129846 lt!129841 (minValue!4601 thiss!1504) lt!129854))))

(declare-fun e!167575 () Bool)

(assert (=> d!61983 e!167575))

(declare-fun res!126405 () Bool)

(assert (=> d!61983 (=> (not res!126405) (not e!167575))))

(assert (=> d!61983 (= res!126405 (contains!1857 lt!129846 lt!129854))))

(assert (=> d!61983 (= (addApplyDifferent!231 lt!129846 lt!129841 (minValue!4601 thiss!1504) lt!129854) lt!130070)))

(declare-fun b!258562 () Bool)

(assert (=> b!258562 (= e!167575 (not (= lt!129854 lt!129841)))))

(assert (= (and d!61983 res!126405) b!258562))

(declare-fun m!273635 () Bool)

(assert (=> d!61983 m!273635))

(assert (=> d!61983 m!273031))

(assert (=> d!61983 m!273015))

(assert (=> d!61983 m!273045))

(assert (=> d!61983 m!273015))

(declare-fun m!273637 () Bool)

(assert (=> d!61983 m!273637))

(assert (=> b!258170 d!61983))

(declare-fun b!258564 () Bool)

(declare-fun e!167576 () Bool)

(assert (=> b!258564 (= e!167576 tp_is_empty!6601)))

(declare-fun b!258563 () Bool)

(declare-fun e!167577 () Bool)

(assert (=> b!258563 (= e!167577 tp_is_empty!6601)))

(declare-fun mapIsEmpty!11251 () Bool)

(declare-fun mapRes!11251 () Bool)

(assert (=> mapIsEmpty!11251 mapRes!11251))

(declare-fun condMapEmpty!11251 () Bool)

(declare-fun mapDefault!11251 () ValueCell!2957)

(assert (=> mapNonEmpty!11250 (= condMapEmpty!11251 (= mapRest!11250 ((as const (Array (_ BitVec 32) ValueCell!2957)) mapDefault!11251)))))

(assert (=> mapNonEmpty!11250 (= tp!23544 (and e!167576 mapRes!11251))))

(declare-fun mapNonEmpty!11251 () Bool)

(declare-fun tp!23545 () Bool)

(assert (=> mapNonEmpty!11251 (= mapRes!11251 (and tp!23545 e!167577))))

(declare-fun mapValue!11251 () ValueCell!2957)

(declare-fun mapRest!11251 () (Array (_ BitVec 32) ValueCell!2957))

(declare-fun mapKey!11251 () (_ BitVec 32))

(assert (=> mapNonEmpty!11251 (= mapRest!11250 (store mapRest!11251 mapKey!11251 mapValue!11251))))

(assert (= (and mapNonEmpty!11250 condMapEmpty!11251) mapIsEmpty!11251))

(assert (= (and mapNonEmpty!11250 (not condMapEmpty!11251)) mapNonEmpty!11251))

(assert (= (and mapNonEmpty!11251 ((_ is ValueCellFull!2957) mapValue!11251)) b!258563))

(assert (= (and mapNonEmpty!11250 ((_ is ValueCellFull!2957) mapDefault!11251)) b!258564))

(declare-fun m!273639 () Bool)

(assert (=> mapNonEmpty!11251 m!273639))

(declare-fun b_lambda!8195 () Bool)

(assert (= b_lambda!8185 (or (and b!257816 b_free!6739) b_lambda!8195)))

(declare-fun b_lambda!8197 () Bool)

(assert (= b_lambda!8193 (or (and b!257816 b_free!6739) b_lambda!8197)))

(declare-fun b_lambda!8199 () Bool)

(assert (= b_lambda!8189 (or (and b!257816 b_free!6739) b_lambda!8199)))

(declare-fun b_lambda!8201 () Bool)

(assert (= b_lambda!8187 (or (and b!257816 b_free!6739) b_lambda!8201)))

(declare-fun b_lambda!8203 () Bool)

(assert (= b_lambda!8191 (or (and b!257816 b_free!6739) b_lambda!8203)))

(check-sat (not b!258471) (not b!258209) (not b!258220) (not b!258387) (not b!258535) (not b!258215) (not b!258394) (not b!258419) (not b!258455) (not d!61811) (not b!258389) (not d!61937) (not bm!24557) (not b!258202) (not d!61863) (not b!258460) (not d!61875) (not b!258412) (not b!258508) (not b!258556) (not b!258210) (not bm!24567) (not bm!24572) (not d!61951) (not d!61861) (not b!258414) (not d!61963) (not b!258247) (not b!258450) (not b!258555) (not b_lambda!8197) (not b!258434) (not b!258481) (not d!61913) (not b!258540) (not b!258350) (not bm!24560) (not b!258468) (not d!61881) tp_is_empty!6601 (not b!258547) (not d!61849) (not b!258509) (not d!61927) (not b!258216) (not b!258266) (not b!258552) (not d!61793) (not b_lambda!8195) (not d!61817) (not d!61975) (not d!61883) (not b!258423) (not d!61921) (not b!258470) (not bm!24558) (not b_lambda!8203) (not d!61981) (not d!61929) (not bm!24564) (not bm!24549) (not d!61865) (not d!61919) (not mapNonEmpty!11251) (not d!61943) (not d!61959) (not b!258426) (not b_next!6739) (not b!258349) (not d!61969) (not d!61979) (not d!61961) (not d!61893) (not b!258268) (not b!258456) (not b!258309) (not b!258342) (not b!258301) (not d!61983) (not b!258447) (not d!61905) (not b!258203) (not d!61801) (not d!61869) (not d!61891) (not bm!24556) (not bm!24555) (not b!258393) (not d!61839) (not d!61825) (not b!258429) (not bm!24566) (not b!258469) (not b!258446) (not b!258550) (not b!258424) (not b!258359) (not d!61967) (not b!258559) (not b!258444) (not bm!24550) (not d!61923) (not b!258476) (not b!258294) (not d!61947) (not d!61911) (not b!258433) (not b!258496) (not b!258422) (not b_lambda!8181) (not b!258484) (not b!258445) (not b_lambda!8199) (not b!258472) (not d!61873) (not d!61837) (not d!61899) (not d!61813) (not b!258348) (not b!258477) (not bm!24574) (not b!258432) (not b!258542) (not bm!24575) (not bm!24568) (not b!258416) (not b!258533) (not b!258338) (not d!61931) (not d!61879) (not b!258401) (not b!258310) (not d!61955) (not d!61821) (not b!258311) (not b_lambda!8183) (not b!258390) (not b!258443) (not d!61917) (not b!258459) (not d!61897) (not bm!24563) (not bm!24571) (not b!258289) (not d!61859) (not b!258502) (not b!258245) (not d!61857) (not b!258292) (not b!258425) (not d!61843) (not bm!24565) (not b!258558) (not b!258201) (not d!61977) (not d!61851) b_and!13805 (not b!258473) (not b!258561) (not d!61957) (not b!258343) (not d!61855) (not b!258391) (not b!258448) (not d!61867) (not bm!24548) (not bm!24559) (not d!61809) (not d!61939) (not d!61945) (not b!258207) (not b!258336) (not b!258267) (not b!258440) (not b!258441) (not b!258346) (not b!258400) (not b!258499) (not b!258560) (not b!258482) (not b_lambda!8201) (not b!258553) (not d!61973) (not d!61791) (not b!258341) (not d!61853) (not b!258283) (not b!258411) (not d!61871) (not d!61953) (not b!258307) (not d!61935) (not b!258261) (not d!61833) (not d!61847) (not b!258337) (not b!258478) (not d!61971) (not b!258453) (not b!258347) (not d!61845) (not b!258497) (not d!61915) (not b!258300) (not b!258417) (not d!61965) (not b!258487) (not b!258352) (not d!61925) (not d!61829) (not b!258308) (not b!258281) (not b!258554) (not b!258430) (not b!258214) (not b!258358) (not b!258538) (not bm!24583))
(check-sat b_and!13805 (not b_next!6739))
