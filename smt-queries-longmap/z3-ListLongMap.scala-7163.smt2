; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91286 () Bool)

(assert start!91286)

(declare-fun b!1041178 () Bool)

(declare-fun b_free!21033 () Bool)

(declare-fun b_next!21033 () Bool)

(assert (=> b!1041178 (= b_free!21033 (not b_next!21033))))

(declare-fun tp!74306 () Bool)

(declare-fun b_and!33565 () Bool)

(assert (=> b!1041178 (= tp!74306 b_and!33565)))

(declare-fun mapIsEmpty!38720 () Bool)

(declare-fun mapRes!38720 () Bool)

(assert (=> mapIsEmpty!38720 mapRes!38720))

(declare-fun b!1041171 () Bool)

(declare-fun e!589594 () Bool)

(declare-fun e!589588 () Bool)

(assert (=> b!1041171 (= e!589594 (not e!589588))))

(declare-fun res!694007 () Bool)

(assert (=> b!1041171 (=> res!694007 e!589588)))

(declare-datatypes ((V!37877 0))(
  ( (V!37878 (val!12427 Int)) )
))
(declare-datatypes ((ValueCell!11673 0))(
  ( (ValueCellFull!11673 (v!15015 V!37877)) (EmptyCell!11673) )
))
(declare-datatypes ((array!65650 0))(
  ( (array!65651 (arr!31587 (Array (_ BitVec 32) (_ BitVec 64))) (size!32119 (_ BitVec 32))) )
))
(declare-datatypes ((array!65652 0))(
  ( (array!65653 (arr!31588 (Array (_ BitVec 32) ValueCell!11673)) (size!32120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5940 0))(
  ( (LongMapFixedSize!5941 (defaultEntry!6352 Int) (mask!30370 (_ BitVec 32)) (extraKeys!6080 (_ BitVec 32)) (zeroValue!6186 V!37877) (minValue!6186 V!37877) (_size!3025 (_ BitVec 32)) (_keys!11583 array!65650) (_values!6375 array!65652) (_vacant!3025 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5940)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041171 (= res!694007 (not (validMask!0 (mask!30370 thiss!1427))))))

(declare-fun lt!458892 () array!65650)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041171 (not (arrayContainsKey!0 lt!458892 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9805 0))(
  ( (MissingZero!9805 (index!41591 (_ BitVec 32))) (Found!9805 (index!41592 (_ BitVec 32))) (Intermediate!9805 (undefined!10617 Bool) (index!41593 (_ BitVec 32)) (x!92950 (_ BitVec 32))) (Undefined!9805) (MissingVacant!9805 (index!41594 (_ BitVec 32))) )
))
(declare-fun lt!458893 () SeekEntryResult!9805)

(declare-datatypes ((Unit!34031 0))(
  ( (Unit!34032) )
))
(declare-fun lt!458891 () Unit!34031)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65650 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> b!1041171 (= lt!458891 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65650 (_ BitVec 32)) Bool)

(assert (=> b!1041171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458892 (mask!30370 thiss!1427))))

(declare-fun lt!458895 () Unit!34031)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65650 (_ BitVec 32) (_ BitVec 32)) Unit!34031)

(assert (=> b!1041171 (= lt!458895 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) (mask!30370 thiss!1427)))))

(declare-datatypes ((List!21967 0))(
  ( (Nil!21964) (Cons!21963 (h!23168 (_ BitVec 64)) (t!31181 List!21967)) )
))
(declare-fun arrayNoDuplicates!0 (array!65650 (_ BitVec 32) List!21967) Bool)

(assert (=> b!1041171 (arrayNoDuplicates!0 lt!458892 #b00000000000000000000000000000000 Nil!21964)))

(declare-fun lt!458894 () Unit!34031)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21967) Unit!34031)

(assert (=> b!1041171 (= lt!458894 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11583 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41592 lt!458893) #b00000000000000000000000000000000 Nil!21964))))

(declare-fun arrayCountValidKeys!0 (array!65650 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041171 (= (arrayCountValidKeys!0 lt!458892 #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041171 (= lt!458892 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun lt!458896 () Unit!34031)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65650 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> b!1041171 (= lt!458896 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041172 () Bool)

(assert (=> b!1041172 (= e!589588 (or (not (= (size!32120 (_values!6375 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30370 thiss!1427)))) (= (size!32119 (_keys!11583 thiss!1427)) (size!32120 (_values!6375 thiss!1427)))))))

(declare-fun res!694004 () Bool)

(declare-fun e!589592 () Bool)

(assert (=> start!91286 (=> (not res!694004) (not e!589592))))

(declare-fun valid!2231 (LongMapFixedSize!5940) Bool)

(assert (=> start!91286 (= res!694004 (valid!2231 thiss!1427))))

(assert (=> start!91286 e!589592))

(declare-fun e!589591 () Bool)

(assert (=> start!91286 e!589591))

(assert (=> start!91286 true))

(declare-fun b!1041173 () Bool)

(declare-fun e!589593 () Bool)

(declare-fun e!589595 () Bool)

(assert (=> b!1041173 (= e!589593 (and e!589595 mapRes!38720))))

(declare-fun condMapEmpty!38720 () Bool)

(declare-fun mapDefault!38720 () ValueCell!11673)

(assert (=> b!1041173 (= condMapEmpty!38720 (= (arr!31588 (_values!6375 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11673)) mapDefault!38720)))))

(declare-fun b!1041174 () Bool)

(declare-fun tp_is_empty!24753 () Bool)

(assert (=> b!1041174 (= e!589595 tp_is_empty!24753)))

(declare-fun mapNonEmpty!38720 () Bool)

(declare-fun tp!74307 () Bool)

(declare-fun e!589590 () Bool)

(assert (=> mapNonEmpty!38720 (= mapRes!38720 (and tp!74307 e!589590))))

(declare-fun mapRest!38720 () (Array (_ BitVec 32) ValueCell!11673))

(declare-fun mapValue!38720 () ValueCell!11673)

(declare-fun mapKey!38720 () (_ BitVec 32))

(assert (=> mapNonEmpty!38720 (= (arr!31588 (_values!6375 thiss!1427)) (store mapRest!38720 mapKey!38720 mapValue!38720))))

(declare-fun b!1041175 () Bool)

(declare-fun res!694006 () Bool)

(assert (=> b!1041175 (=> (not res!694006) (not e!589592))))

(assert (=> b!1041175 (= res!694006 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041176 () Bool)

(assert (=> b!1041176 (= e!589592 e!589594)))

(declare-fun res!694005 () Bool)

(assert (=> b!1041176 (=> (not res!694005) (not e!589594))))

(get-info :version)

(assert (=> b!1041176 (= res!694005 ((_ is Found!9805) lt!458893))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65650 (_ BitVec 32)) SeekEntryResult!9805)

(assert (=> b!1041176 (= lt!458893 (seekEntry!0 key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(declare-fun b!1041177 () Bool)

(assert (=> b!1041177 (= e!589590 tp_is_empty!24753)))

(declare-fun array_inv!24403 (array!65650) Bool)

(declare-fun array_inv!24404 (array!65652) Bool)

(assert (=> b!1041178 (= e!589591 (and tp!74306 tp_is_empty!24753 (array_inv!24403 (_keys!11583 thiss!1427)) (array_inv!24404 (_values!6375 thiss!1427)) e!589593))))

(assert (= (and start!91286 res!694004) b!1041175))

(assert (= (and b!1041175 res!694006) b!1041176))

(assert (= (and b!1041176 res!694005) b!1041171))

(assert (= (and b!1041171 (not res!694007)) b!1041172))

(assert (= (and b!1041173 condMapEmpty!38720) mapIsEmpty!38720))

(assert (= (and b!1041173 (not condMapEmpty!38720)) mapNonEmpty!38720))

(assert (= (and mapNonEmpty!38720 ((_ is ValueCellFull!11673) mapValue!38720)) b!1041177))

(assert (= (and b!1041173 ((_ is ValueCellFull!11673) mapDefault!38720)) b!1041174))

(assert (= b!1041178 b!1041173))

(assert (= start!91286 b!1041178))

(declare-fun m!960643 () Bool)

(assert (=> mapNonEmpty!38720 m!960643))

(declare-fun m!960645 () Bool)

(assert (=> b!1041171 m!960645))

(declare-fun m!960647 () Bool)

(assert (=> b!1041171 m!960647))

(declare-fun m!960649 () Bool)

(assert (=> b!1041171 m!960649))

(declare-fun m!960651 () Bool)

(assert (=> b!1041171 m!960651))

(declare-fun m!960653 () Bool)

(assert (=> b!1041171 m!960653))

(declare-fun m!960655 () Bool)

(assert (=> b!1041171 m!960655))

(declare-fun m!960657 () Bool)

(assert (=> b!1041171 m!960657))

(declare-fun m!960659 () Bool)

(assert (=> b!1041171 m!960659))

(declare-fun m!960661 () Bool)

(assert (=> b!1041171 m!960661))

(declare-fun m!960663 () Bool)

(assert (=> b!1041171 m!960663))

(declare-fun m!960665 () Bool)

(assert (=> b!1041171 m!960665))

(declare-fun m!960667 () Bool)

(assert (=> b!1041178 m!960667))

(declare-fun m!960669 () Bool)

(assert (=> b!1041178 m!960669))

(declare-fun m!960671 () Bool)

(assert (=> b!1041176 m!960671))

(declare-fun m!960673 () Bool)

(assert (=> start!91286 m!960673))

(check-sat (not b_next!21033) b_and!33565 (not b!1041178) (not b!1041171) tp_is_empty!24753 (not start!91286) (not b!1041176) (not mapNonEmpty!38720))
(check-sat b_and!33565 (not b_next!21033))
(get-model)

(declare-fun d!125803 () Bool)

(declare-fun res!694026 () Bool)

(declare-fun e!589622 () Bool)

(assert (=> d!125803 (=> (not res!694026) (not e!589622))))

(declare-fun simpleValid!437 (LongMapFixedSize!5940) Bool)

(assert (=> d!125803 (= res!694026 (simpleValid!437 thiss!1427))))

(assert (=> d!125803 (= (valid!2231 thiss!1427) e!589622)))

(declare-fun b!1041209 () Bool)

(declare-fun res!694027 () Bool)

(assert (=> b!1041209 (=> (not res!694027) (not e!589622))))

(assert (=> b!1041209 (= res!694027 (= (arrayCountValidKeys!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (_size!3025 thiss!1427)))))

(declare-fun b!1041210 () Bool)

(declare-fun res!694028 () Bool)

(assert (=> b!1041210 (=> (not res!694028) (not e!589622))))

(assert (=> b!1041210 (= res!694028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(declare-fun b!1041211 () Bool)

(assert (=> b!1041211 (= e!589622 (arrayNoDuplicates!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 Nil!21964))))

(assert (= (and d!125803 res!694026) b!1041209))

(assert (= (and b!1041209 res!694027) b!1041210))

(assert (= (and b!1041210 res!694028) b!1041211))

(declare-fun m!960707 () Bool)

(assert (=> d!125803 m!960707))

(assert (=> b!1041209 m!960665))

(declare-fun m!960709 () Bool)

(assert (=> b!1041210 m!960709))

(declare-fun m!960711 () Bool)

(assert (=> b!1041211 m!960711))

(assert (=> start!91286 d!125803))

(declare-fun d!125805 () Bool)

(assert (=> d!125805 (= (array_inv!24403 (_keys!11583 thiss!1427)) (bvsge (size!32119 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041178 d!125805))

(declare-fun d!125807 () Bool)

(assert (=> d!125807 (= (array_inv!24404 (_values!6375 thiss!1427)) (bvsge (size!32120 (_values!6375 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041178 d!125807))

(declare-fun d!125809 () Bool)

(declare-fun lt!458926 () SeekEntryResult!9805)

(assert (=> d!125809 (and (or ((_ is MissingVacant!9805) lt!458926) (not ((_ is Found!9805) lt!458926)) (and (bvsge (index!41592 lt!458926) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458926) (size!32119 (_keys!11583 thiss!1427))))) (not ((_ is MissingVacant!9805) lt!458926)) (or (not ((_ is Found!9805) lt!458926)) (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458926)) key!909)))))

(declare-fun e!589630 () SeekEntryResult!9805)

(assert (=> d!125809 (= lt!458926 e!589630)))

(declare-fun c!105606 () Bool)

(declare-fun lt!458925 () SeekEntryResult!9805)

(assert (=> d!125809 (= c!105606 (and ((_ is Intermediate!9805) lt!458925) (undefined!10617 lt!458925)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65650 (_ BitVec 32)) SeekEntryResult!9805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125809 (= lt!458925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30370 thiss!1427)) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(assert (=> d!125809 (validMask!0 (mask!30370 thiss!1427))))

(assert (=> d!125809 (= (seekEntry!0 key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)) lt!458926)))

(declare-fun b!1041224 () Bool)

(declare-fun e!589629 () SeekEntryResult!9805)

(assert (=> b!1041224 (= e!589630 e!589629)))

(declare-fun lt!458923 () (_ BitVec 64))

(assert (=> b!1041224 (= lt!458923 (select (arr!31587 (_keys!11583 thiss!1427)) (index!41593 lt!458925)))))

(declare-fun c!105608 () Bool)

(assert (=> b!1041224 (= c!105608 (= lt!458923 key!909))))

(declare-fun b!1041225 () Bool)

(declare-fun e!589631 () SeekEntryResult!9805)

(declare-fun lt!458924 () SeekEntryResult!9805)

(assert (=> b!1041225 (= e!589631 (ite ((_ is MissingVacant!9805) lt!458924) (MissingZero!9805 (index!41594 lt!458924)) lt!458924))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65650 (_ BitVec 32)) SeekEntryResult!9805)

(assert (=> b!1041225 (= lt!458924 (seekKeyOrZeroReturnVacant!0 (x!92950 lt!458925) (index!41593 lt!458925) (index!41593 lt!458925) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(declare-fun b!1041226 () Bool)

(assert (=> b!1041226 (= e!589631 (MissingZero!9805 (index!41593 lt!458925)))))

(declare-fun b!1041227 () Bool)

(assert (=> b!1041227 (= e!589630 Undefined!9805)))

(declare-fun b!1041228 () Bool)

(assert (=> b!1041228 (= e!589629 (Found!9805 (index!41593 lt!458925)))))

(declare-fun b!1041229 () Bool)

(declare-fun c!105607 () Bool)

(assert (=> b!1041229 (= c!105607 (= lt!458923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041229 (= e!589629 e!589631)))

(assert (= (and d!125809 c!105606) b!1041227))

(assert (= (and d!125809 (not c!105606)) b!1041224))

(assert (= (and b!1041224 c!105608) b!1041228))

(assert (= (and b!1041224 (not c!105608)) b!1041229))

(assert (= (and b!1041229 c!105607) b!1041226))

(assert (= (and b!1041229 (not c!105607)) b!1041225))

(declare-fun m!960713 () Bool)

(assert (=> d!125809 m!960713))

(declare-fun m!960715 () Bool)

(assert (=> d!125809 m!960715))

(assert (=> d!125809 m!960715))

(declare-fun m!960717 () Bool)

(assert (=> d!125809 m!960717))

(assert (=> d!125809 m!960645))

(declare-fun m!960719 () Bool)

(assert (=> b!1041224 m!960719))

(declare-fun m!960721 () Bool)

(assert (=> b!1041225 m!960721))

(assert (=> b!1041176 d!125809))

(declare-fun d!125811 () Bool)

(declare-fun res!694033 () Bool)

(declare-fun e!589640 () Bool)

(assert (=> d!125811 (=> res!694033 e!589640)))

(assert (=> d!125811 (= res!694033 (bvsge #b00000000000000000000000000000000 (size!32119 lt!458892)))))

(assert (=> d!125811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458892 (mask!30370 thiss!1427)) e!589640)))

(declare-fun bm!44096 () Bool)

(declare-fun call!44099 () Bool)

(assert (=> bm!44096 (= call!44099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458892 (mask!30370 thiss!1427)))))

(declare-fun b!1041238 () Bool)

(declare-fun e!589638 () Bool)

(assert (=> b!1041238 (= e!589640 e!589638)))

(declare-fun c!105611 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041238 (= c!105611 (validKeyInArray!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun b!1041239 () Bool)

(assert (=> b!1041239 (= e!589638 call!44099)))

(declare-fun b!1041240 () Bool)

(declare-fun e!589639 () Bool)

(assert (=> b!1041240 (= e!589639 call!44099)))

(declare-fun b!1041241 () Bool)

(assert (=> b!1041241 (= e!589638 e!589639)))

(declare-fun lt!458933 () (_ BitVec 64))

(assert (=> b!1041241 (= lt!458933 (select (arr!31587 lt!458892) #b00000000000000000000000000000000))))

(declare-fun lt!458934 () Unit!34031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65650 (_ BitVec 64) (_ BitVec 32)) Unit!34031)

(assert (=> b!1041241 (= lt!458934 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458892 lt!458933 #b00000000000000000000000000000000))))

(assert (=> b!1041241 (arrayContainsKey!0 lt!458892 lt!458933 #b00000000000000000000000000000000)))

(declare-fun lt!458935 () Unit!34031)

(assert (=> b!1041241 (= lt!458935 lt!458934)))

(declare-fun res!694034 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65650 (_ BitVec 32)) SeekEntryResult!9805)

(assert (=> b!1041241 (= res!694034 (= (seekEntryOrOpen!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) lt!458892 (mask!30370 thiss!1427)) (Found!9805 #b00000000000000000000000000000000)))))

(assert (=> b!1041241 (=> (not res!694034) (not e!589639))))

(assert (= (and d!125811 (not res!694033)) b!1041238))

(assert (= (and b!1041238 c!105611) b!1041241))

(assert (= (and b!1041238 (not c!105611)) b!1041239))

(assert (= (and b!1041241 res!694034) b!1041240))

(assert (= (or b!1041240 b!1041239) bm!44096))

(declare-fun m!960723 () Bool)

(assert (=> bm!44096 m!960723))

(declare-fun m!960725 () Bool)

(assert (=> b!1041238 m!960725))

(assert (=> b!1041238 m!960725))

(declare-fun m!960727 () Bool)

(assert (=> b!1041238 m!960727))

(assert (=> b!1041241 m!960725))

(declare-fun m!960729 () Bool)

(assert (=> b!1041241 m!960729))

(declare-fun m!960731 () Bool)

(assert (=> b!1041241 m!960731))

(assert (=> b!1041241 m!960725))

(declare-fun m!960733 () Bool)

(assert (=> b!1041241 m!960733))

(assert (=> b!1041171 d!125811))

(declare-fun d!125813 () Bool)

(declare-fun e!589643 () Bool)

(assert (=> d!125813 e!589643))

(declare-fun res!694037 () Bool)

(assert (=> d!125813 (=> (not res!694037) (not e!589643))))

(assert (=> d!125813 (= res!694037 (and (bvsge (index!41592 lt!458893) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458893) (size!32119 (_keys!11583 thiss!1427)))))))

(declare-fun lt!458938 () Unit!34031)

(declare-fun choose!53 (array!65650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21967) Unit!34031)

(assert (=> d!125813 (= lt!458938 (choose!53 (_keys!11583 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41592 lt!458893) #b00000000000000000000000000000000 Nil!21964))))

(assert (=> d!125813 (bvslt (size!32119 (_keys!11583 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125813 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11583 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41592 lt!458893) #b00000000000000000000000000000000 Nil!21964) lt!458938)))

(declare-fun b!1041244 () Bool)

(assert (=> b!1041244 (= e!589643 (arrayNoDuplicates!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 Nil!21964))))

(assert (= (and d!125813 res!694037) b!1041244))

(declare-fun m!960735 () Bool)

(assert (=> d!125813 m!960735))

(assert (=> b!1041244 m!960663))

(declare-fun m!960737 () Bool)

(assert (=> b!1041244 m!960737))

(assert (=> b!1041171 d!125813))

(declare-fun b!1041253 () Bool)

(declare-fun e!589649 () (_ BitVec 32))

(declare-fun call!44102 () (_ BitVec 32))

(assert (=> b!1041253 (= e!589649 (bvadd #b00000000000000000000000000000001 call!44102))))

(declare-fun b!1041254 () Bool)

(declare-fun e!589648 () (_ BitVec 32))

(assert (=> b!1041254 (= e!589648 e!589649)))

(declare-fun c!105616 () Bool)

(assert (=> b!1041254 (= c!105616 (validKeyInArray!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun bm!44099 () Bool)

(assert (=> bm!44099 (= call!44102 (arrayCountValidKeys!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun b!1041255 () Bool)

(assert (=> b!1041255 (= e!589648 #b00000000000000000000000000000000)))

(declare-fun d!125815 () Bool)

(declare-fun lt!458941 () (_ BitVec 32))

(assert (=> d!125815 (and (bvsge lt!458941 #b00000000000000000000000000000000) (bvsle lt!458941 (bvsub (size!32119 lt!458892) #b00000000000000000000000000000000)))))

(assert (=> d!125815 (= lt!458941 e!589648)))

(declare-fun c!105617 () Bool)

(assert (=> d!125815 (= c!105617 (bvsge #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125815 (and (bvsle #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32119 (_keys!11583 thiss!1427)) (size!32119 lt!458892)))))

(assert (=> d!125815 (= (arrayCountValidKeys!0 lt!458892 #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) lt!458941)))

(declare-fun b!1041256 () Bool)

(assert (=> b!1041256 (= e!589649 call!44102)))

(assert (= (and d!125815 c!105617) b!1041255))

(assert (= (and d!125815 (not c!105617)) b!1041254))

(assert (= (and b!1041254 c!105616) b!1041253))

(assert (= (and b!1041254 (not c!105616)) b!1041256))

(assert (= (or b!1041253 b!1041256) bm!44099))

(assert (=> b!1041254 m!960725))

(assert (=> b!1041254 m!960725))

(assert (=> b!1041254 m!960727))

(declare-fun m!960739 () Bool)

(assert (=> bm!44099 m!960739))

(assert (=> b!1041171 d!125815))

(declare-fun d!125817 () Bool)

(declare-fun e!589652 () Bool)

(assert (=> d!125817 e!589652))

(declare-fun res!694040 () Bool)

(assert (=> d!125817 (=> (not res!694040) (not e!589652))))

(assert (=> d!125817 (= res!694040 (and (bvsge (index!41592 lt!458893) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458893) (size!32119 (_keys!11583 thiss!1427)))))))

(declare-fun lt!458944 () Unit!34031)

(declare-fun choose!25 (array!65650 (_ BitVec 32) (_ BitVec 32)) Unit!34031)

(assert (=> d!125817 (= lt!458944 (choose!25 (_keys!11583 thiss!1427) (index!41592 lt!458893) (mask!30370 thiss!1427)))))

(assert (=> d!125817 (validMask!0 (mask!30370 thiss!1427))))

(assert (=> d!125817 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) (mask!30370 thiss!1427)) lt!458944)))

(declare-fun b!1041259 () Bool)

(assert (=> b!1041259 (= e!589652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (mask!30370 thiss!1427)))))

(assert (= (and d!125817 res!694040) b!1041259))

(declare-fun m!960741 () Bool)

(assert (=> d!125817 m!960741))

(assert (=> d!125817 m!960645))

(assert (=> b!1041259 m!960663))

(declare-fun m!960743 () Bool)

(assert (=> b!1041259 m!960743))

(assert (=> b!1041171 d!125817))

(declare-fun d!125819 () Bool)

(declare-fun res!694045 () Bool)

(declare-fun e!589657 () Bool)

(assert (=> d!125819 (=> res!694045 e!589657)))

(assert (=> d!125819 (= res!694045 (= (select (arr!31587 lt!458892) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125819 (= (arrayContainsKey!0 lt!458892 key!909 #b00000000000000000000000000000000) e!589657)))

(declare-fun b!1041264 () Bool)

(declare-fun e!589658 () Bool)

(assert (=> b!1041264 (= e!589657 e!589658)))

(declare-fun res!694046 () Bool)

(assert (=> b!1041264 (=> (not res!694046) (not e!589658))))

(assert (=> b!1041264 (= res!694046 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 lt!458892)))))

(declare-fun b!1041265 () Bool)

(assert (=> b!1041265 (= e!589658 (arrayContainsKey!0 lt!458892 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125819 (not res!694045)) b!1041264))

(assert (= (and b!1041264 res!694046) b!1041265))

(assert (=> d!125819 m!960725))

(declare-fun m!960745 () Bool)

(assert (=> b!1041265 m!960745))

(assert (=> b!1041171 d!125819))

(declare-fun b!1041266 () Bool)

(declare-fun e!589660 () (_ BitVec 32))

(declare-fun call!44103 () (_ BitVec 32))

(assert (=> b!1041266 (= e!589660 (bvadd #b00000000000000000000000000000001 call!44103))))

(declare-fun b!1041267 () Bool)

(declare-fun e!589659 () (_ BitVec 32))

(assert (=> b!1041267 (= e!589659 e!589660)))

(declare-fun c!105618 () Bool)

(assert (=> b!1041267 (= c!105618 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44100 () Bool)

(assert (=> bm!44100 (= call!44103 (arrayCountValidKeys!0 (_keys!11583 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun b!1041268 () Bool)

(assert (=> b!1041268 (= e!589659 #b00000000000000000000000000000000)))

(declare-fun d!125821 () Bool)

(declare-fun lt!458945 () (_ BitVec 32))

(assert (=> d!125821 (and (bvsge lt!458945 #b00000000000000000000000000000000) (bvsle lt!458945 (bvsub (size!32119 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125821 (= lt!458945 e!589659)))

(declare-fun c!105619 () Bool)

(assert (=> d!125821 (= c!105619 (bvsge #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125821 (and (bvsle #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32119 (_keys!11583 thiss!1427)) (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125821 (= (arrayCountValidKeys!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) lt!458945)))

(declare-fun b!1041269 () Bool)

(assert (=> b!1041269 (= e!589660 call!44103)))

(assert (= (and d!125821 c!105619) b!1041268))

(assert (= (and d!125821 (not c!105619)) b!1041267))

(assert (= (and b!1041267 c!105618) b!1041266))

(assert (= (and b!1041267 (not c!105618)) b!1041269))

(assert (= (or b!1041266 b!1041269) bm!44100))

(declare-fun m!960747 () Bool)

(assert (=> b!1041267 m!960747))

(assert (=> b!1041267 m!960747))

(declare-fun m!960749 () Bool)

(assert (=> b!1041267 m!960749))

(declare-fun m!960751 () Bool)

(assert (=> bm!44100 m!960751))

(assert (=> b!1041171 d!125821))

(declare-fun d!125823 () Bool)

(assert (=> d!125823 (= (validMask!0 (mask!30370 thiss!1427)) (and (or (= (mask!30370 thiss!1427) #b00000000000000000000000000000111) (= (mask!30370 thiss!1427) #b00000000000000000000000000001111) (= (mask!30370 thiss!1427) #b00000000000000000000000000011111) (= (mask!30370 thiss!1427) #b00000000000000000000000000111111) (= (mask!30370 thiss!1427) #b00000000000000000000000001111111) (= (mask!30370 thiss!1427) #b00000000000000000000000011111111) (= (mask!30370 thiss!1427) #b00000000000000000000000111111111) (= (mask!30370 thiss!1427) #b00000000000000000000001111111111) (= (mask!30370 thiss!1427) #b00000000000000000000011111111111) (= (mask!30370 thiss!1427) #b00000000000000000000111111111111) (= (mask!30370 thiss!1427) #b00000000000000000001111111111111) (= (mask!30370 thiss!1427) #b00000000000000000011111111111111) (= (mask!30370 thiss!1427) #b00000000000000000111111111111111) (= (mask!30370 thiss!1427) #b00000000000000001111111111111111) (= (mask!30370 thiss!1427) #b00000000000000011111111111111111) (= (mask!30370 thiss!1427) #b00000000000000111111111111111111) (= (mask!30370 thiss!1427) #b00000000000001111111111111111111) (= (mask!30370 thiss!1427) #b00000000000011111111111111111111) (= (mask!30370 thiss!1427) #b00000000000111111111111111111111) (= (mask!30370 thiss!1427) #b00000000001111111111111111111111) (= (mask!30370 thiss!1427) #b00000000011111111111111111111111) (= (mask!30370 thiss!1427) #b00000000111111111111111111111111) (= (mask!30370 thiss!1427) #b00000001111111111111111111111111) (= (mask!30370 thiss!1427) #b00000011111111111111111111111111) (= (mask!30370 thiss!1427) #b00000111111111111111111111111111) (= (mask!30370 thiss!1427) #b00001111111111111111111111111111) (= (mask!30370 thiss!1427) #b00011111111111111111111111111111) (= (mask!30370 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30370 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041171 d!125823))

(declare-fun d!125825 () Bool)

(declare-fun e!589665 () Bool)

(assert (=> d!125825 e!589665))

(declare-fun res!694056 () Bool)

(assert (=> d!125825 (=> (not res!694056) (not e!589665))))

(assert (=> d!125825 (= res!694056 (and (bvsge (index!41592 lt!458893) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458893) (size!32119 (_keys!11583 thiss!1427)))))))

(declare-fun lt!458948 () Unit!34031)

(declare-fun choose!82 (array!65650 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> d!125825 (= lt!458948 (choose!82 (_keys!11583 thiss!1427) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589666 () Bool)

(assert (=> d!125825 e!589666))

(declare-fun res!694057 () Bool)

(assert (=> d!125825 (=> (not res!694057) (not e!589666))))

(assert (=> d!125825 (= res!694057 (and (bvsge (index!41592 lt!458893) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458893) (size!32119 (_keys!11583 thiss!1427)))))))

(assert (=> d!125825 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458948)))

(declare-fun b!1041281 () Bool)

(assert (=> b!1041281 (= e!589665 (= (arrayCountValidKeys!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041279 () Bool)

(declare-fun res!694058 () Bool)

(assert (=> b!1041279 (=> (not res!694058) (not e!589666))))

(assert (=> b!1041279 (= res!694058 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041278 () Bool)

(declare-fun res!694055 () Bool)

(assert (=> b!1041278 (=> (not res!694055) (not e!589666))))

(assert (=> b!1041278 (= res!694055 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893))))))

(declare-fun b!1041280 () Bool)

(assert (=> b!1041280 (= e!589666 (bvslt (size!32119 (_keys!11583 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125825 res!694057) b!1041278))

(assert (= (and b!1041278 res!694055) b!1041279))

(assert (= (and b!1041279 res!694058) b!1041280))

(assert (= (and d!125825 res!694056) b!1041281))

(declare-fun m!960753 () Bool)

(assert (=> d!125825 m!960753))

(assert (=> b!1041281 m!960663))

(declare-fun m!960755 () Bool)

(assert (=> b!1041281 m!960755))

(assert (=> b!1041281 m!960665))

(declare-fun m!960757 () Bool)

(assert (=> b!1041279 m!960757))

(declare-fun m!960759 () Bool)

(assert (=> b!1041278 m!960759))

(assert (=> b!1041278 m!960759))

(declare-fun m!960761 () Bool)

(assert (=> b!1041278 m!960761))

(assert (=> b!1041171 d!125825))

(declare-fun b!1041292 () Bool)

(declare-fun e!589675 () Bool)

(declare-fun e!589676 () Bool)

(assert (=> b!1041292 (= e!589675 e!589676)))

(declare-fun res!694065 () Bool)

(assert (=> b!1041292 (=> (not res!694065) (not e!589676))))

(declare-fun e!589678 () Bool)

(assert (=> b!1041292 (= res!694065 (not e!589678))))

(declare-fun res!694067 () Bool)

(assert (=> b!1041292 (=> (not res!694067) (not e!589678))))

(assert (=> b!1041292 (= res!694067 (validKeyInArray!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun b!1041293 () Bool)

(declare-fun e!589677 () Bool)

(declare-fun call!44106 () Bool)

(assert (=> b!1041293 (= e!589677 call!44106)))

(declare-fun b!1041294 () Bool)

(declare-fun contains!6053 (List!21967 (_ BitVec 64)) Bool)

(assert (=> b!1041294 (= e!589678 (contains!6053 Nil!21964 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun bm!44103 () Bool)

(declare-fun c!105622 () Bool)

(assert (=> bm!44103 (= call!44106 (arrayNoDuplicates!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105622 (Cons!21963 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) Nil!21964) Nil!21964)))))

(declare-fun d!125827 () Bool)

(declare-fun res!694066 () Bool)

(assert (=> d!125827 (=> res!694066 e!589675)))

(assert (=> d!125827 (= res!694066 (bvsge #b00000000000000000000000000000000 (size!32119 lt!458892)))))

(assert (=> d!125827 (= (arrayNoDuplicates!0 lt!458892 #b00000000000000000000000000000000 Nil!21964) e!589675)))

(declare-fun b!1041295 () Bool)

(assert (=> b!1041295 (= e!589677 call!44106)))

(declare-fun b!1041296 () Bool)

(assert (=> b!1041296 (= e!589676 e!589677)))

(assert (=> b!1041296 (= c!105622 (validKeyInArray!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(assert (= (and d!125827 (not res!694066)) b!1041292))

(assert (= (and b!1041292 res!694067) b!1041294))

(assert (= (and b!1041292 res!694065) b!1041296))

(assert (= (and b!1041296 c!105622) b!1041295))

(assert (= (and b!1041296 (not c!105622)) b!1041293))

(assert (= (or b!1041295 b!1041293) bm!44103))

(assert (=> b!1041292 m!960725))

(assert (=> b!1041292 m!960725))

(assert (=> b!1041292 m!960727))

(assert (=> b!1041294 m!960725))

(assert (=> b!1041294 m!960725))

(declare-fun m!960763 () Bool)

(assert (=> b!1041294 m!960763))

(assert (=> bm!44103 m!960725))

(declare-fun m!960765 () Bool)

(assert (=> bm!44103 m!960765))

(assert (=> b!1041296 m!960725))

(assert (=> b!1041296 m!960725))

(assert (=> b!1041296 m!960727))

(assert (=> b!1041171 d!125827))

(declare-fun d!125829 () Bool)

(declare-fun e!589681 () Bool)

(assert (=> d!125829 e!589681))

(declare-fun res!694070 () Bool)

(assert (=> d!125829 (=> (not res!694070) (not e!589681))))

(assert (=> d!125829 (= res!694070 (bvslt (index!41592 lt!458893) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun lt!458951 () Unit!34031)

(declare-fun choose!121 (array!65650 (_ BitVec 32) (_ BitVec 64)) Unit!34031)

(assert (=> d!125829 (= lt!458951 (choose!121 (_keys!11583 thiss!1427) (index!41592 lt!458893) key!909))))

(assert (=> d!125829 (bvsge (index!41592 lt!458893) #b00000000000000000000000000000000)))

(assert (=> d!125829 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11583 thiss!1427) (index!41592 lt!458893) key!909) lt!458951)))

(declare-fun b!1041299 () Bool)

(assert (=> b!1041299 (= e!589681 (not (arrayContainsKey!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125829 res!694070) b!1041299))

(declare-fun m!960767 () Bool)

(assert (=> d!125829 m!960767))

(assert (=> b!1041299 m!960663))

(declare-fun m!960769 () Bool)

(assert (=> b!1041299 m!960769))

(assert (=> b!1041171 d!125829))

(declare-fun condMapEmpty!38726 () Bool)

(declare-fun mapDefault!38726 () ValueCell!11673)

(assert (=> mapNonEmpty!38720 (= condMapEmpty!38726 (= mapRest!38720 ((as const (Array (_ BitVec 32) ValueCell!11673)) mapDefault!38726)))))

(declare-fun e!589687 () Bool)

(declare-fun mapRes!38726 () Bool)

(assert (=> mapNonEmpty!38720 (= tp!74307 (and e!589687 mapRes!38726))))

(declare-fun b!1041306 () Bool)

(declare-fun e!589686 () Bool)

(assert (=> b!1041306 (= e!589686 tp_is_empty!24753)))

(declare-fun mapNonEmpty!38726 () Bool)

(declare-fun tp!74316 () Bool)

(assert (=> mapNonEmpty!38726 (= mapRes!38726 (and tp!74316 e!589686))))

(declare-fun mapValue!38726 () ValueCell!11673)

(declare-fun mapRest!38726 () (Array (_ BitVec 32) ValueCell!11673))

(declare-fun mapKey!38726 () (_ BitVec 32))

(assert (=> mapNonEmpty!38726 (= mapRest!38720 (store mapRest!38726 mapKey!38726 mapValue!38726))))

(declare-fun mapIsEmpty!38726 () Bool)

(assert (=> mapIsEmpty!38726 mapRes!38726))

(declare-fun b!1041307 () Bool)

(assert (=> b!1041307 (= e!589687 tp_is_empty!24753)))

(assert (= (and mapNonEmpty!38720 condMapEmpty!38726) mapIsEmpty!38726))

(assert (= (and mapNonEmpty!38720 (not condMapEmpty!38726)) mapNonEmpty!38726))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11673) mapValue!38726)) b!1041306))

(assert (= (and mapNonEmpty!38720 ((_ is ValueCellFull!11673) mapDefault!38726)) b!1041307))

(declare-fun m!960771 () Bool)

(assert (=> mapNonEmpty!38726 m!960771))

(check-sat (not b_next!21033) (not b!1041278) (not b!1041279) (not b!1041281) (not b!1041254) (not d!125829) (not b!1041210) (not b!1041267) (not b!1041299) (not d!125803) (not b!1041241) (not d!125825) (not d!125813) (not mapNonEmpty!38726) (not b!1041259) (not bm!44103) (not d!125817) b_and!33565 (not b!1041292) (not bm!44096) (not b!1041244) (not b!1041225) tp_is_empty!24753 (not b!1041238) (not bm!44099) (not b!1041211) (not b!1041294) (not b!1041296) (not b!1041265) (not bm!44100) (not d!125809) (not b!1041209))
(check-sat b_and!33565 (not b_next!21033))
(get-model)

(declare-fun d!125831 () Bool)

(assert (=> d!125831 (= (validKeyInArray!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)) (and (not (= (select (arr!31587 lt!458892) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31587 lt!458892) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041254 d!125831))

(declare-fun d!125833 () Bool)

(assert (=> d!125833 (= (arrayCountValidKeys!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125833 true))

(declare-fun _$79!26 () Unit!34031)

(assert (=> d!125833 (= (choose!82 (_keys!11583 thiss!1427) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!26)))

(declare-fun bs!30455 () Bool)

(assert (= bs!30455 d!125833))

(assert (=> bs!30455 m!960663))

(assert (=> bs!30455 m!960755))

(assert (=> bs!30455 m!960665))

(assert (=> d!125825 d!125833))

(assert (=> b!1041292 d!125831))

(declare-fun b!1041308 () Bool)

(declare-fun e!589688 () Bool)

(declare-fun e!589689 () Bool)

(assert (=> b!1041308 (= e!589688 e!589689)))

(declare-fun res!694071 () Bool)

(assert (=> b!1041308 (=> (not res!694071) (not e!589689))))

(declare-fun e!589691 () Bool)

(assert (=> b!1041308 (= res!694071 (not e!589691))))

(declare-fun res!694073 () Bool)

(assert (=> b!1041308 (=> (not res!694073) (not e!589691))))

(assert (=> b!1041308 (= res!694073 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041309 () Bool)

(declare-fun e!589690 () Bool)

(declare-fun call!44107 () Bool)

(assert (=> b!1041309 (= e!589690 call!44107)))

(declare-fun b!1041310 () Bool)

(assert (=> b!1041310 (= e!589691 (contains!6053 Nil!21964 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44104 () Bool)

(declare-fun c!105623 () Bool)

(assert (=> bm!44104 (= call!44107 (arrayNoDuplicates!0 (_keys!11583 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105623 (Cons!21963 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000) Nil!21964) Nil!21964)))))

(declare-fun d!125835 () Bool)

(declare-fun res!694072 () Bool)

(assert (=> d!125835 (=> res!694072 e!589688)))

(assert (=> d!125835 (= res!694072 (bvsge #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125835 (= (arrayNoDuplicates!0 (_keys!11583 thiss!1427) #b00000000000000000000000000000000 Nil!21964) e!589688)))

(declare-fun b!1041311 () Bool)

(assert (=> b!1041311 (= e!589690 call!44107)))

(declare-fun b!1041312 () Bool)

(assert (=> b!1041312 (= e!589689 e!589690)))

(assert (=> b!1041312 (= c!105623 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125835 (not res!694072)) b!1041308))

(assert (= (and b!1041308 res!694073) b!1041310))

(assert (= (and b!1041308 res!694071) b!1041312))

(assert (= (and b!1041312 c!105623) b!1041311))

(assert (= (and b!1041312 (not c!105623)) b!1041309))

(assert (= (or b!1041311 b!1041309) bm!44104))

(assert (=> b!1041308 m!960747))

(assert (=> b!1041308 m!960747))

(assert (=> b!1041308 m!960749))

(assert (=> b!1041310 m!960747))

(assert (=> b!1041310 m!960747))

(declare-fun m!960773 () Bool)

(assert (=> b!1041310 m!960773))

(assert (=> bm!44104 m!960747))

(declare-fun m!960775 () Bool)

(assert (=> bm!44104 m!960775))

(assert (=> b!1041312 m!960747))

(assert (=> b!1041312 m!960747))

(assert (=> b!1041312 m!960749))

(assert (=> b!1041211 d!125835))

(declare-fun d!125837 () Bool)

(declare-fun res!694074 () Bool)

(declare-fun e!589694 () Bool)

(assert (=> d!125837 (=> res!694074 e!589694)))

(assert (=> d!125837 (= res!694074 (bvsge #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)) e!589694)))

(declare-fun bm!44105 () Bool)

(declare-fun call!44108 () Bool)

(assert (=> bm!44105 (= call!44108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(declare-fun b!1041313 () Bool)

(declare-fun e!589692 () Bool)

(assert (=> b!1041313 (= e!589694 e!589692)))

(declare-fun c!105624 () Bool)

(assert (=> b!1041313 (= c!105624 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041314 () Bool)

(assert (=> b!1041314 (= e!589692 call!44108)))

(declare-fun b!1041315 () Bool)

(declare-fun e!589693 () Bool)

(assert (=> b!1041315 (= e!589693 call!44108)))

(declare-fun b!1041316 () Bool)

(assert (=> b!1041316 (= e!589692 e!589693)))

(declare-fun lt!458952 () (_ BitVec 64))

(assert (=> b!1041316 (= lt!458952 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458953 () Unit!34031)

(assert (=> b!1041316 (= lt!458953 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11583 thiss!1427) lt!458952 #b00000000000000000000000000000000))))

(assert (=> b!1041316 (arrayContainsKey!0 (_keys!11583 thiss!1427) lt!458952 #b00000000000000000000000000000000)))

(declare-fun lt!458954 () Unit!34031)

(assert (=> b!1041316 (= lt!458954 lt!458953)))

(declare-fun res!694075 () Bool)

(assert (=> b!1041316 (= res!694075 (= (seekEntryOrOpen!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000) (_keys!11583 thiss!1427) (mask!30370 thiss!1427)) (Found!9805 #b00000000000000000000000000000000)))))

(assert (=> b!1041316 (=> (not res!694075) (not e!589693))))

(assert (= (and d!125837 (not res!694074)) b!1041313))

(assert (= (and b!1041313 c!105624) b!1041316))

(assert (= (and b!1041313 (not c!105624)) b!1041314))

(assert (= (and b!1041316 res!694075) b!1041315))

(assert (= (or b!1041315 b!1041314) bm!44105))

(declare-fun m!960777 () Bool)

(assert (=> bm!44105 m!960777))

(assert (=> b!1041313 m!960747))

(assert (=> b!1041313 m!960747))

(assert (=> b!1041313 m!960749))

(assert (=> b!1041316 m!960747))

(declare-fun m!960779 () Bool)

(assert (=> b!1041316 m!960779))

(declare-fun m!960781 () Bool)

(assert (=> b!1041316 m!960781))

(assert (=> b!1041316 m!960747))

(declare-fun m!960783 () Bool)

(assert (=> b!1041316 m!960783))

(assert (=> b!1041210 d!125837))

(declare-fun d!125839 () Bool)

(assert (=> d!125839 (arrayNoDuplicates!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 Nil!21964)))

(assert (=> d!125839 true))

(declare-fun _$66!50 () Unit!34031)

(assert (=> d!125839 (= (choose!53 (_keys!11583 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41592 lt!458893) #b00000000000000000000000000000000 Nil!21964) _$66!50)))

(declare-fun bs!30456 () Bool)

(assert (= bs!30456 d!125839))

(assert (=> bs!30456 m!960663))

(assert (=> bs!30456 m!960737))

(assert (=> d!125813 d!125839))

(assert (=> b!1041209 d!125821))

(declare-fun d!125841 () Bool)

(declare-fun res!694076 () Bool)

(declare-fun e!589697 () Bool)

(assert (=> d!125841 (=> res!694076 e!589697)))

(assert (=> d!125841 (= res!694076 (bvsge #b00000000000000000000000000000000 (size!32119 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))))))))

(assert (=> d!125841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (mask!30370 thiss!1427)) e!589697)))

(declare-fun bm!44106 () Bool)

(declare-fun call!44109 () Bool)

(assert (=> bm!44106 (= call!44109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (mask!30370 thiss!1427)))))

(declare-fun b!1041317 () Bool)

(declare-fun e!589695 () Bool)

(assert (=> b!1041317 (= e!589697 e!589695)))

(declare-fun c!105625 () Bool)

(assert (=> b!1041317 (= c!105625 (validKeyInArray!0 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041318 () Bool)

(assert (=> b!1041318 (= e!589695 call!44109)))

(declare-fun b!1041319 () Bool)

(declare-fun e!589696 () Bool)

(assert (=> b!1041319 (= e!589696 call!44109)))

(declare-fun b!1041320 () Bool)

(assert (=> b!1041320 (= e!589695 e!589696)))

(declare-fun lt!458955 () (_ BitVec 64))

(assert (=> b!1041320 (= lt!458955 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!458956 () Unit!34031)

(assert (=> b!1041320 (= lt!458956 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) lt!458955 #b00000000000000000000000000000000))))

(assert (=> b!1041320 (arrayContainsKey!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) lt!458955 #b00000000000000000000000000000000)))

(declare-fun lt!458957 () Unit!34031)

(assert (=> b!1041320 (= lt!458957 lt!458956)))

(declare-fun res!694077 () Bool)

(assert (=> b!1041320 (= res!694077 (= (seekEntryOrOpen!0 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000) (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (mask!30370 thiss!1427)) (Found!9805 #b00000000000000000000000000000000)))))

(assert (=> b!1041320 (=> (not res!694077) (not e!589696))))

(assert (= (and d!125841 (not res!694076)) b!1041317))

(assert (= (and b!1041317 c!105625) b!1041320))

(assert (= (and b!1041317 (not c!105625)) b!1041318))

(assert (= (and b!1041320 res!694077) b!1041319))

(assert (= (or b!1041319 b!1041318) bm!44106))

(declare-fun m!960785 () Bool)

(assert (=> bm!44106 m!960785))

(declare-fun m!960787 () Bool)

(assert (=> b!1041317 m!960787))

(assert (=> b!1041317 m!960787))

(declare-fun m!960789 () Bool)

(assert (=> b!1041317 m!960789))

(assert (=> b!1041320 m!960787))

(declare-fun m!960791 () Bool)

(assert (=> b!1041320 m!960791))

(declare-fun m!960793 () Bool)

(assert (=> b!1041320 m!960793))

(assert (=> b!1041320 m!960787))

(declare-fun m!960795 () Bool)

(assert (=> b!1041320 m!960795))

(assert (=> b!1041259 d!125841))

(declare-fun b!1041331 () Bool)

(declare-fun res!694086 () Bool)

(declare-fun e!589700 () Bool)

(assert (=> b!1041331 (=> (not res!694086) (not e!589700))))

(declare-fun size!32123 (LongMapFixedSize!5940) (_ BitVec 32))

(assert (=> b!1041331 (= res!694086 (= (size!32123 thiss!1427) (bvadd (_size!3025 thiss!1427) (bvsdiv (bvadd (extraKeys!6080 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!125843 () Bool)

(declare-fun res!694089 () Bool)

(assert (=> d!125843 (=> (not res!694089) (not e!589700))))

(assert (=> d!125843 (= res!694089 (validMask!0 (mask!30370 thiss!1427)))))

(assert (=> d!125843 (= (simpleValid!437 thiss!1427) e!589700)))

(declare-fun b!1041330 () Bool)

(declare-fun res!694088 () Bool)

(assert (=> b!1041330 (=> (not res!694088) (not e!589700))))

(assert (=> b!1041330 (= res!694088 (bvsge (size!32123 thiss!1427) (_size!3025 thiss!1427)))))

(declare-fun b!1041329 () Bool)

(declare-fun res!694087 () Bool)

(assert (=> b!1041329 (=> (not res!694087) (not e!589700))))

(assert (=> b!1041329 (= res!694087 (and (= (size!32120 (_values!6375 thiss!1427)) (bvadd (mask!30370 thiss!1427) #b00000000000000000000000000000001)) (= (size!32119 (_keys!11583 thiss!1427)) (size!32120 (_values!6375 thiss!1427))) (bvsge (_size!3025 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3025 thiss!1427) (bvadd (mask!30370 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1041332 () Bool)

(assert (=> b!1041332 (= e!589700 (and (bvsge (extraKeys!6080 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6080 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3025 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!125843 res!694089) b!1041329))

(assert (= (and b!1041329 res!694087) b!1041330))

(assert (= (and b!1041330 res!694088) b!1041331))

(assert (= (and b!1041331 res!694086) b!1041332))

(declare-fun m!960797 () Bool)

(assert (=> b!1041331 m!960797))

(assert (=> d!125843 m!960645))

(assert (=> b!1041330 m!960797))

(assert (=> d!125803 d!125843))

(declare-fun b!1041333 () Bool)

(declare-fun e!589702 () (_ BitVec 32))

(declare-fun call!44110 () (_ BitVec 32))

(assert (=> b!1041333 (= e!589702 (bvadd #b00000000000000000000000000000001 call!44110))))

(declare-fun b!1041334 () Bool)

(declare-fun e!589701 () (_ BitVec 32))

(assert (=> b!1041334 (= e!589701 e!589702)))

(declare-fun c!105626 () Bool)

(assert (=> b!1041334 (= c!105626 (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44107 () Bool)

(assert (=> bm!44107 (= call!44110 (arrayCountValidKeys!0 (_keys!11583 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun b!1041335 () Bool)

(assert (=> b!1041335 (= e!589701 #b00000000000000000000000000000000)))

(declare-fun d!125845 () Bool)

(declare-fun lt!458958 () (_ BitVec 32))

(assert (=> d!125845 (and (bvsge lt!458958 #b00000000000000000000000000000000) (bvsle lt!458958 (bvsub (size!32119 (_keys!11583 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125845 (= lt!458958 e!589701)))

(declare-fun c!105627 () Bool)

(assert (=> d!125845 (= c!105627 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125845 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32119 (_keys!11583 thiss!1427)) (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125845 (= (arrayCountValidKeys!0 (_keys!11583 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))) lt!458958)))

(declare-fun b!1041336 () Bool)

(assert (=> b!1041336 (= e!589702 call!44110)))

(assert (= (and d!125845 c!105627) b!1041335))

(assert (= (and d!125845 (not c!105627)) b!1041334))

(assert (= (and b!1041334 c!105626) b!1041333))

(assert (= (and b!1041334 (not c!105626)) b!1041336))

(assert (= (or b!1041333 b!1041336) bm!44107))

(declare-fun m!960799 () Bool)

(assert (=> b!1041334 m!960799))

(assert (=> b!1041334 m!960799))

(declare-fun m!960801 () Bool)

(assert (=> b!1041334 m!960801))

(declare-fun m!960803 () Bool)

(assert (=> bm!44107 m!960803))

(assert (=> bm!44100 d!125845))

(declare-fun b!1041355 () Bool)

(declare-fun e!589717 () Bool)

(declare-fun lt!458963 () SeekEntryResult!9805)

(assert (=> b!1041355 (= e!589717 (bvsge (x!92950 lt!458963) #b01111111111111111111111111111110))))

(declare-fun d!125847 () Bool)

(assert (=> d!125847 e!589717))

(declare-fun c!105634 () Bool)

(assert (=> d!125847 (= c!105634 (and ((_ is Intermediate!9805) lt!458963) (undefined!10617 lt!458963)))))

(declare-fun e!589714 () SeekEntryResult!9805)

(assert (=> d!125847 (= lt!458963 e!589714)))

(declare-fun c!105636 () Bool)

(assert (=> d!125847 (= c!105636 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!458964 () (_ BitVec 64))

(assert (=> d!125847 (= lt!458964 (select (arr!31587 (_keys!11583 thiss!1427)) (toIndex!0 key!909 (mask!30370 thiss!1427))))))

(assert (=> d!125847 (validMask!0 (mask!30370 thiss!1427))))

(assert (=> d!125847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30370 thiss!1427)) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)) lt!458963)))

(declare-fun b!1041356 () Bool)

(declare-fun e!589716 () SeekEntryResult!9805)

(assert (=> b!1041356 (= e!589716 (Intermediate!9805 false (toIndex!0 key!909 (mask!30370 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041357 () Bool)

(assert (=> b!1041357 (= e!589714 e!589716)))

(declare-fun c!105635 () Bool)

(assert (=> b!1041357 (= c!105635 (or (= lt!458964 key!909) (= (bvadd lt!458964 lt!458964) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041358 () Bool)

(declare-fun e!589713 () Bool)

(assert (=> b!1041358 (= e!589717 e!589713)))

(declare-fun res!694096 () Bool)

(assert (=> b!1041358 (= res!694096 (and ((_ is Intermediate!9805) lt!458963) (not (undefined!10617 lt!458963)) (bvslt (x!92950 lt!458963) #b01111111111111111111111111111110) (bvsge (x!92950 lt!458963) #b00000000000000000000000000000000) (bvsge (x!92950 lt!458963) #b00000000000000000000000000000000)))))

(assert (=> b!1041358 (=> (not res!694096) (not e!589713))))

(declare-fun b!1041359 () Bool)

(assert (=> b!1041359 (= e!589714 (Intermediate!9805 true (toIndex!0 key!909 (mask!30370 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041360 () Bool)

(assert (=> b!1041360 (and (bvsge (index!41593 lt!458963) #b00000000000000000000000000000000) (bvslt (index!41593 lt!458963) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun res!694097 () Bool)

(assert (=> b!1041360 (= res!694097 (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41593 lt!458963)) key!909))))

(declare-fun e!589715 () Bool)

(assert (=> b!1041360 (=> res!694097 e!589715)))

(assert (=> b!1041360 (= e!589713 e!589715)))

(declare-fun b!1041361 () Bool)

(assert (=> b!1041361 (and (bvsge (index!41593 lt!458963) #b00000000000000000000000000000000) (bvslt (index!41593 lt!458963) (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> b!1041361 (= e!589715 (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41593 lt!458963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041362 () Bool)

(assert (=> b!1041362 (and (bvsge (index!41593 lt!458963) #b00000000000000000000000000000000) (bvslt (index!41593 lt!458963) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun res!694098 () Bool)

(assert (=> b!1041362 (= res!694098 (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41593 lt!458963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041362 (=> res!694098 e!589715)))

(declare-fun b!1041363 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041363 (= e!589716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30370 thiss!1427)) #b00000000000000000000000000000000 (mask!30370 thiss!1427)) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(assert (= (and d!125847 c!105636) b!1041359))

(assert (= (and d!125847 (not c!105636)) b!1041357))

(assert (= (and b!1041357 c!105635) b!1041356))

(assert (= (and b!1041357 (not c!105635)) b!1041363))

(assert (= (and d!125847 c!105634) b!1041355))

(assert (= (and d!125847 (not c!105634)) b!1041358))

(assert (= (and b!1041358 res!694096) b!1041360))

(assert (= (and b!1041360 (not res!694097)) b!1041362))

(assert (= (and b!1041362 (not res!694098)) b!1041361))

(assert (=> d!125847 m!960715))

(declare-fun m!960805 () Bool)

(assert (=> d!125847 m!960805))

(assert (=> d!125847 m!960645))

(declare-fun m!960807 () Bool)

(assert (=> b!1041361 m!960807))

(assert (=> b!1041360 m!960807))

(assert (=> b!1041362 m!960807))

(assert (=> b!1041363 m!960715))

(declare-fun m!960809 () Bool)

(assert (=> b!1041363 m!960809))

(assert (=> b!1041363 m!960809))

(declare-fun m!960811 () Bool)

(assert (=> b!1041363 m!960811))

(assert (=> d!125809 d!125847))

(declare-fun d!125849 () Bool)

(declare-fun lt!458970 () (_ BitVec 32))

(declare-fun lt!458969 () (_ BitVec 32))

(assert (=> d!125849 (= lt!458970 (bvmul (bvxor lt!458969 (bvlshr lt!458969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125849 (= lt!458969 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125849 (and (bvsge (mask!30370 thiss!1427) #b00000000000000000000000000000000) (let ((res!694099 (let ((h!23169 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92967 (bvmul (bvxor h!23169 (bvlshr h!23169 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92967 (bvlshr x!92967 #b00000000000000000000000000001101)) (mask!30370 thiss!1427)))))) (and (bvslt res!694099 (bvadd (mask!30370 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694099 #b00000000000000000000000000000000))))))

(assert (=> d!125849 (= (toIndex!0 key!909 (mask!30370 thiss!1427)) (bvand (bvxor lt!458970 (bvlshr lt!458970 #b00000000000000000000000000001101)) (mask!30370 thiss!1427)))))

(assert (=> d!125809 d!125849))

(assert (=> d!125809 d!125823))

(declare-fun b!1041364 () Bool)

(declare-fun e!589718 () Bool)

(declare-fun e!589719 () Bool)

(assert (=> b!1041364 (= e!589718 e!589719)))

(declare-fun res!694100 () Bool)

(assert (=> b!1041364 (=> (not res!694100) (not e!589719))))

(declare-fun e!589721 () Bool)

(assert (=> b!1041364 (= res!694100 (not e!589721))))

(declare-fun res!694102 () Bool)

(assert (=> b!1041364 (=> (not res!694102) (not e!589721))))

(assert (=> b!1041364 (= res!694102 (validKeyInArray!0 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041365 () Bool)

(declare-fun e!589720 () Bool)

(declare-fun call!44111 () Bool)

(assert (=> b!1041365 (= e!589720 call!44111)))

(declare-fun b!1041366 () Bool)

(assert (=> b!1041366 (= e!589721 (contains!6053 Nil!21964 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun c!105637 () Bool)

(declare-fun bm!44108 () Bool)

(assert (=> bm!44108 (= call!44111 (arrayNoDuplicates!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105637 (Cons!21963 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000) Nil!21964) Nil!21964)))))

(declare-fun d!125851 () Bool)

(declare-fun res!694101 () Bool)

(assert (=> d!125851 (=> res!694101 e!589718)))

(assert (=> d!125851 (= res!694101 (bvsge #b00000000000000000000000000000000 (size!32119 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))))))))

(assert (=> d!125851 (= (arrayNoDuplicates!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 Nil!21964) e!589718)))

(declare-fun b!1041367 () Bool)

(assert (=> b!1041367 (= e!589720 call!44111)))

(declare-fun b!1041368 () Bool)

(assert (=> b!1041368 (= e!589719 e!589720)))

(assert (=> b!1041368 (= c!105637 (validKeyInArray!0 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125851 (not res!694101)) b!1041364))

(assert (= (and b!1041364 res!694102) b!1041366))

(assert (= (and b!1041364 res!694100) b!1041368))

(assert (= (and b!1041368 c!105637) b!1041367))

(assert (= (and b!1041368 (not c!105637)) b!1041365))

(assert (= (or b!1041367 b!1041365) bm!44108))

(assert (=> b!1041364 m!960787))

(assert (=> b!1041364 m!960787))

(assert (=> b!1041364 m!960789))

(assert (=> b!1041366 m!960787))

(assert (=> b!1041366 m!960787))

(declare-fun m!960813 () Bool)

(assert (=> b!1041366 m!960813))

(assert (=> bm!44108 m!960787))

(declare-fun m!960815 () Bool)

(assert (=> bm!44108 m!960815))

(assert (=> b!1041368 m!960787))

(assert (=> b!1041368 m!960787))

(assert (=> b!1041368 m!960789))

(assert (=> b!1041244 d!125851))

(declare-fun b!1041369 () Bool)

(declare-fun e!589723 () (_ BitVec 32))

(declare-fun call!44112 () (_ BitVec 32))

(assert (=> b!1041369 (= e!589723 (bvadd #b00000000000000000000000000000001 call!44112))))

(declare-fun b!1041370 () Bool)

(declare-fun e!589722 () (_ BitVec 32))

(assert (=> b!1041370 (= e!589722 e!589723)))

(declare-fun c!105638 () Bool)

(assert (=> b!1041370 (= c!105638 (validKeyInArray!0 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44109 () Bool)

(assert (=> bm!44109 (= call!44112 (arrayCountValidKeys!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun b!1041371 () Bool)

(assert (=> b!1041371 (= e!589722 #b00000000000000000000000000000000)))

(declare-fun d!125853 () Bool)

(declare-fun lt!458971 () (_ BitVec 32))

(assert (=> d!125853 (and (bvsge lt!458971 #b00000000000000000000000000000000) (bvsle lt!458971 (bvsub (size!32119 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125853 (= lt!458971 e!589722)))

(declare-fun c!105639 () Bool)

(assert (=> d!125853 (= c!105639 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125853 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32119 (_keys!11583 thiss!1427)) (size!32119 lt!458892)))))

(assert (=> d!125853 (= (arrayCountValidKeys!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))) lt!458971)))

(declare-fun b!1041372 () Bool)

(assert (=> b!1041372 (= e!589723 call!44112)))

(assert (= (and d!125853 c!105639) b!1041371))

(assert (= (and d!125853 (not c!105639)) b!1041370))

(assert (= (and b!1041370 c!105638) b!1041369))

(assert (= (and b!1041370 (not c!105638)) b!1041372))

(assert (= (or b!1041369 b!1041372) bm!44109))

(declare-fun m!960817 () Bool)

(assert (=> b!1041370 m!960817))

(assert (=> b!1041370 m!960817))

(declare-fun m!960819 () Bool)

(assert (=> b!1041370 m!960819))

(declare-fun m!960821 () Bool)

(assert (=> bm!44109 m!960821))

(assert (=> bm!44099 d!125853))

(declare-fun d!125855 () Bool)

(assert (=> d!125855 (= (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31587 (_keys!11583 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041267 d!125855))

(assert (=> b!1041296 d!125831))

(declare-fun d!125857 () Bool)

(assert (=> d!125857 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1041279 d!125857))

(declare-fun d!125859 () Bool)

(declare-fun res!694103 () Bool)

(declare-fun e!589724 () Bool)

(assert (=> d!125859 (=> res!694103 e!589724)))

(assert (=> d!125859 (= res!694103 (= (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125859 (= (arrayContainsKey!0 lt!458892 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!589724)))

(declare-fun b!1041373 () Bool)

(declare-fun e!589725 () Bool)

(assert (=> b!1041373 (= e!589724 e!589725)))

(declare-fun res!694104 () Bool)

(assert (=> b!1041373 (=> (not res!694104) (not e!589725))))

(assert (=> b!1041373 (= res!694104 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32119 lt!458892)))))

(declare-fun b!1041374 () Bool)

(assert (=> b!1041374 (= e!589725 (arrayContainsKey!0 lt!458892 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125859 (not res!694103)) b!1041373))

(assert (= (and b!1041373 res!694104) b!1041374))

(assert (=> d!125859 m!960817))

(declare-fun m!960823 () Bool)

(assert (=> b!1041374 m!960823))

(assert (=> b!1041265 d!125859))

(declare-fun d!125861 () Bool)

(assert (=> d!125861 (= (validKeyInArray!0 (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893))) (and (not (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041278 d!125861))

(declare-fun b!1041387 () Bool)

(declare-fun c!105647 () Bool)

(declare-fun lt!458977 () (_ BitVec 64))

(assert (=> b!1041387 (= c!105647 (= lt!458977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589734 () SeekEntryResult!9805)

(declare-fun e!589733 () SeekEntryResult!9805)

(assert (=> b!1041387 (= e!589734 e!589733)))

(declare-fun lt!458976 () SeekEntryResult!9805)

(declare-fun d!125863 () Bool)

(assert (=> d!125863 (and (or ((_ is Undefined!9805) lt!458976) (not ((_ is Found!9805) lt!458976)) (and (bvsge (index!41592 lt!458976) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458976) (size!32119 (_keys!11583 thiss!1427))))) (or ((_ is Undefined!9805) lt!458976) ((_ is Found!9805) lt!458976) (not ((_ is MissingVacant!9805) lt!458976)) (not (= (index!41594 lt!458976) (index!41593 lt!458925))) (and (bvsge (index!41594 lt!458976) #b00000000000000000000000000000000) (bvslt (index!41594 lt!458976) (size!32119 (_keys!11583 thiss!1427))))) (or ((_ is Undefined!9805) lt!458976) (ite ((_ is Found!9805) lt!458976) (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458976)) key!909) (and ((_ is MissingVacant!9805) lt!458976) (= (index!41594 lt!458976) (index!41593 lt!458925)) (= (select (arr!31587 (_keys!11583 thiss!1427)) (index!41594 lt!458976)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!589732 () SeekEntryResult!9805)

(assert (=> d!125863 (= lt!458976 e!589732)))

(declare-fun c!105648 () Bool)

(assert (=> d!125863 (= c!105648 (bvsge (x!92950 lt!458925) #b01111111111111111111111111111110))))

(assert (=> d!125863 (= lt!458977 (select (arr!31587 (_keys!11583 thiss!1427)) (index!41593 lt!458925)))))

(assert (=> d!125863 (validMask!0 (mask!30370 thiss!1427))))

(assert (=> d!125863 (= (seekKeyOrZeroReturnVacant!0 (x!92950 lt!458925) (index!41593 lt!458925) (index!41593 lt!458925) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)) lt!458976)))

(declare-fun b!1041388 () Bool)

(assert (=> b!1041388 (= e!589732 Undefined!9805)))

(declare-fun b!1041389 () Bool)

(assert (=> b!1041389 (= e!589733 (MissingVacant!9805 (index!41593 lt!458925)))))

(declare-fun b!1041390 () Bool)

(assert (=> b!1041390 (= e!589733 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92950 lt!458925) #b00000000000000000000000000000001) (nextIndex!0 (index!41593 lt!458925) (x!92950 lt!458925) (mask!30370 thiss!1427)) (index!41593 lt!458925) key!909 (_keys!11583 thiss!1427) (mask!30370 thiss!1427)))))

(declare-fun b!1041391 () Bool)

(assert (=> b!1041391 (= e!589732 e!589734)))

(declare-fun c!105646 () Bool)

(assert (=> b!1041391 (= c!105646 (= lt!458977 key!909))))

(declare-fun b!1041392 () Bool)

(assert (=> b!1041392 (= e!589734 (Found!9805 (index!41593 lt!458925)))))

(assert (= (and d!125863 c!105648) b!1041388))

(assert (= (and d!125863 (not c!105648)) b!1041391))

(assert (= (and b!1041391 c!105646) b!1041392))

(assert (= (and b!1041391 (not c!105646)) b!1041387))

(assert (= (and b!1041387 c!105647) b!1041389))

(assert (= (and b!1041387 (not c!105647)) b!1041390))

(declare-fun m!960825 () Bool)

(assert (=> d!125863 m!960825))

(declare-fun m!960827 () Bool)

(assert (=> d!125863 m!960827))

(assert (=> d!125863 m!960719))

(assert (=> d!125863 m!960645))

(declare-fun m!960829 () Bool)

(assert (=> b!1041390 m!960829))

(assert (=> b!1041390 m!960829))

(declare-fun m!960831 () Bool)

(assert (=> b!1041390 m!960831))

(assert (=> b!1041225 d!125863))

(assert (=> b!1041238 d!125831))

(declare-fun b!1041393 () Bool)

(declare-fun e!589735 () Bool)

(declare-fun e!589736 () Bool)

(assert (=> b!1041393 (= e!589735 e!589736)))

(declare-fun res!694105 () Bool)

(assert (=> b!1041393 (=> (not res!694105) (not e!589736))))

(declare-fun e!589738 () Bool)

(assert (=> b!1041393 (= res!694105 (not e!589738))))

(declare-fun res!694107 () Bool)

(assert (=> b!1041393 (=> (not res!694107) (not e!589738))))

(assert (=> b!1041393 (= res!694107 (validKeyInArray!0 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041394 () Bool)

(declare-fun e!589737 () Bool)

(declare-fun call!44113 () Bool)

(assert (=> b!1041394 (= e!589737 call!44113)))

(declare-fun b!1041395 () Bool)

(assert (=> b!1041395 (= e!589738 (contains!6053 (ite c!105622 (Cons!21963 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) Nil!21964) Nil!21964) (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!105649 () Bool)

(declare-fun bm!44110 () Bool)

(assert (=> bm!44110 (= call!44113 (arrayNoDuplicates!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105649 (Cons!21963 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105622 (Cons!21963 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) Nil!21964) Nil!21964)) (ite c!105622 (Cons!21963 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) Nil!21964) Nil!21964))))))

(declare-fun d!125865 () Bool)

(declare-fun res!694106 () Bool)

(assert (=> d!125865 (=> res!694106 e!589735)))

(assert (=> d!125865 (= res!694106 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 lt!458892)))))

(assert (=> d!125865 (= (arrayNoDuplicates!0 lt!458892 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105622 (Cons!21963 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) Nil!21964) Nil!21964)) e!589735)))

(declare-fun b!1041396 () Bool)

(assert (=> b!1041396 (= e!589737 call!44113)))

(declare-fun b!1041397 () Bool)

(assert (=> b!1041397 (= e!589736 e!589737)))

(assert (=> b!1041397 (= c!105649 (validKeyInArray!0 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125865 (not res!694106)) b!1041393))

(assert (= (and b!1041393 res!694107) b!1041395))

(assert (= (and b!1041393 res!694105) b!1041397))

(assert (= (and b!1041397 c!105649) b!1041396))

(assert (= (and b!1041397 (not c!105649)) b!1041394))

(assert (= (or b!1041396 b!1041394) bm!44110))

(assert (=> b!1041393 m!960817))

(assert (=> b!1041393 m!960817))

(assert (=> b!1041393 m!960819))

(assert (=> b!1041395 m!960817))

(assert (=> b!1041395 m!960817))

(declare-fun m!960833 () Bool)

(assert (=> b!1041395 m!960833))

(assert (=> bm!44110 m!960817))

(declare-fun m!960835 () Bool)

(assert (=> bm!44110 m!960835))

(assert (=> b!1041397 m!960817))

(assert (=> b!1041397 m!960817))

(assert (=> b!1041397 m!960819))

(assert (=> bm!44103 d!125865))

(declare-fun d!125867 () Bool)

(declare-fun lt!458980 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!521 (List!21967) (InoxSet (_ BitVec 64)))

(assert (=> d!125867 (= lt!458980 (select (content!521 Nil!21964) (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun e!589743 () Bool)

(assert (=> d!125867 (= lt!458980 e!589743)))

(declare-fun res!694112 () Bool)

(assert (=> d!125867 (=> (not res!694112) (not e!589743))))

(assert (=> d!125867 (= res!694112 ((_ is Cons!21963) Nil!21964))))

(assert (=> d!125867 (= (contains!6053 Nil!21964 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)) lt!458980)))

(declare-fun b!1041402 () Bool)

(declare-fun e!589744 () Bool)

(assert (=> b!1041402 (= e!589743 e!589744)))

(declare-fun res!694113 () Bool)

(assert (=> b!1041402 (=> res!694113 e!589744)))

(assert (=> b!1041402 (= res!694113 (= (h!23168 Nil!21964) (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun b!1041403 () Bool)

(assert (=> b!1041403 (= e!589744 (contains!6053 (t!31181 Nil!21964) (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(assert (= (and d!125867 res!694112) b!1041402))

(assert (= (and b!1041402 (not res!694113)) b!1041403))

(declare-fun m!960837 () Bool)

(assert (=> d!125867 m!960837))

(assert (=> d!125867 m!960725))

(declare-fun m!960839 () Bool)

(assert (=> d!125867 m!960839))

(assert (=> b!1041403 m!960725))

(declare-fun m!960841 () Bool)

(assert (=> b!1041403 m!960841))

(assert (=> b!1041294 d!125867))

(declare-fun d!125869 () Bool)

(declare-fun res!694114 () Bool)

(declare-fun e!589747 () Bool)

(assert (=> d!125869 (=> res!694114 e!589747)))

(assert (=> d!125869 (= res!694114 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 lt!458892)))))

(assert (=> d!125869 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458892 (mask!30370 thiss!1427)) e!589747)))

(declare-fun bm!44111 () Bool)

(declare-fun call!44114 () Bool)

(assert (=> bm!44111 (= call!44114 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!458892 (mask!30370 thiss!1427)))))

(declare-fun b!1041404 () Bool)

(declare-fun e!589745 () Bool)

(assert (=> b!1041404 (= e!589747 e!589745)))

(declare-fun c!105650 () Bool)

(assert (=> b!1041404 (= c!105650 (validKeyInArray!0 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041405 () Bool)

(assert (=> b!1041405 (= e!589745 call!44114)))

(declare-fun b!1041406 () Bool)

(declare-fun e!589746 () Bool)

(assert (=> b!1041406 (= e!589746 call!44114)))

(declare-fun b!1041407 () Bool)

(assert (=> b!1041407 (= e!589745 e!589746)))

(declare-fun lt!458981 () (_ BitVec 64))

(assert (=> b!1041407 (= lt!458981 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!458982 () Unit!34031)

(assert (=> b!1041407 (= lt!458982 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458892 lt!458981 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041407 (arrayContainsKey!0 lt!458892 lt!458981 #b00000000000000000000000000000000)))

(declare-fun lt!458983 () Unit!34031)

(assert (=> b!1041407 (= lt!458983 lt!458982)))

(declare-fun res!694115 () Bool)

(assert (=> b!1041407 (= res!694115 (= (seekEntryOrOpen!0 (select (arr!31587 lt!458892) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!458892 (mask!30370 thiss!1427)) (Found!9805 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041407 (=> (not res!694115) (not e!589746))))

(assert (= (and d!125869 (not res!694114)) b!1041404))

(assert (= (and b!1041404 c!105650) b!1041407))

(assert (= (and b!1041404 (not c!105650)) b!1041405))

(assert (= (and b!1041407 res!694115) b!1041406))

(assert (= (or b!1041406 b!1041405) bm!44111))

(declare-fun m!960843 () Bool)

(assert (=> bm!44111 m!960843))

(assert (=> b!1041404 m!960817))

(assert (=> b!1041404 m!960817))

(assert (=> b!1041404 m!960819))

(assert (=> b!1041407 m!960817))

(declare-fun m!960845 () Bool)

(assert (=> b!1041407 m!960845))

(declare-fun m!960847 () Bool)

(assert (=> b!1041407 m!960847))

(assert (=> b!1041407 m!960817))

(declare-fun m!960849 () Bool)

(assert (=> b!1041407 m!960849))

(assert (=> bm!44096 d!125869))

(declare-fun d!125871 () Bool)

(assert (=> d!125871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (mask!30370 thiss!1427))))

(assert (=> d!125871 true))

(declare-fun _$44!24 () Unit!34031)

(assert (=> d!125871 (= (choose!25 (_keys!11583 thiss!1427) (index!41592 lt!458893) (mask!30370 thiss!1427)) _$44!24)))

(declare-fun bs!30457 () Bool)

(assert (= bs!30457 d!125871))

(assert (=> bs!30457 m!960663))

(assert (=> bs!30457 m!960743))

(assert (=> d!125817 d!125871))

(assert (=> d!125817 d!125823))

(declare-fun d!125873 () Bool)

(assert (=> d!125873 (not (arrayContainsKey!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125873 true))

(declare-fun _$59!26 () Unit!34031)

(assert (=> d!125873 (= (choose!121 (_keys!11583 thiss!1427) (index!41592 lt!458893) key!909) _$59!26)))

(declare-fun bs!30458 () Bool)

(assert (= bs!30458 d!125873))

(assert (=> bs!30458 m!960663))

(assert (=> bs!30458 m!960769))

(assert (=> d!125829 d!125873))

(declare-fun d!125875 () Bool)

(declare-fun res!694116 () Bool)

(declare-fun e!589748 () Bool)

(assert (=> d!125875 (=> res!694116 e!589748)))

(assert (=> d!125875 (= res!694116 (= (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125875 (= (arrayContainsKey!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) key!909 #b00000000000000000000000000000000) e!589748)))

(declare-fun b!1041408 () Bool)

(declare-fun e!589749 () Bool)

(assert (=> b!1041408 (= e!589748 e!589749)))

(declare-fun res!694117 () Bool)

(assert (=> b!1041408 (=> (not res!694117) (not e!589749))))

(assert (=> b!1041408 (= res!694117 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))))))))

(declare-fun b!1041409 () Bool)

(assert (=> b!1041409 (= e!589749 (arrayContainsKey!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125875 (not res!694116)) b!1041408))

(assert (= (and b!1041408 res!694117) b!1041409))

(assert (=> d!125875 m!960787))

(declare-fun m!960851 () Bool)

(assert (=> b!1041409 m!960851))

(assert (=> b!1041299 d!125875))

(declare-fun b!1041410 () Bool)

(declare-fun e!589751 () (_ BitVec 32))

(declare-fun call!44115 () (_ BitVec 32))

(assert (=> b!1041410 (= e!589751 (bvadd #b00000000000000000000000000000001 call!44115))))

(declare-fun b!1041411 () Bool)

(declare-fun e!589750 () (_ BitVec 32))

(assert (=> b!1041411 (= e!589750 e!589751)))

(declare-fun c!105651 () Bool)

(assert (=> b!1041411 (= c!105651 (validKeyInArray!0 (select (arr!31587 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44112 () Bool)

(assert (=> bm!44112 (= call!44115 (arrayCountValidKeys!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 (_keys!11583 thiss!1427))))))

(declare-fun b!1041412 () Bool)

(assert (=> b!1041412 (= e!589750 #b00000000000000000000000000000000)))

(declare-fun d!125877 () Bool)

(declare-fun lt!458984 () (_ BitVec 32))

(assert (=> d!125877 (and (bvsge lt!458984 #b00000000000000000000000000000000) (bvsle lt!458984 (bvsub (size!32119 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125877 (= lt!458984 e!589750)))

(declare-fun c!105652 () Bool)

(assert (=> d!125877 (= c!105652 (bvsge #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))))))

(assert (=> d!125877 (and (bvsle #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32119 (_keys!11583 thiss!1427)) (size!32119 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))))))))

(assert (=> d!125877 (= (arrayCountValidKeys!0 (array!65651 (store (arr!31587 (_keys!11583 thiss!1427)) (index!41592 lt!458893) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32119 (_keys!11583 thiss!1427))) #b00000000000000000000000000000000 (size!32119 (_keys!11583 thiss!1427))) lt!458984)))

(declare-fun b!1041413 () Bool)

(assert (=> b!1041413 (= e!589751 call!44115)))

(assert (= (and d!125877 c!105652) b!1041412))

(assert (= (and d!125877 (not c!105652)) b!1041411))

(assert (= (and b!1041411 c!105651) b!1041410))

(assert (= (and b!1041411 (not c!105651)) b!1041413))

(assert (= (or b!1041410 b!1041413) bm!44112))

(assert (=> b!1041411 m!960787))

(assert (=> b!1041411 m!960787))

(assert (=> b!1041411 m!960789))

(declare-fun m!960853 () Bool)

(assert (=> bm!44112 m!960853))

(assert (=> b!1041281 d!125877))

(assert (=> b!1041281 d!125821))

(declare-fun d!125879 () Bool)

(assert (=> d!125879 (arrayContainsKey!0 lt!458892 lt!458933 #b00000000000000000000000000000000)))

(declare-fun lt!458987 () Unit!34031)

(declare-fun choose!13 (array!65650 (_ BitVec 64) (_ BitVec 32)) Unit!34031)

(assert (=> d!125879 (= lt!458987 (choose!13 lt!458892 lt!458933 #b00000000000000000000000000000000))))

(assert (=> d!125879 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125879 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458892 lt!458933 #b00000000000000000000000000000000) lt!458987)))

(declare-fun bs!30459 () Bool)

(assert (= bs!30459 d!125879))

(assert (=> bs!30459 m!960731))

(declare-fun m!960855 () Bool)

(assert (=> bs!30459 m!960855))

(assert (=> b!1041241 d!125879))

(declare-fun d!125881 () Bool)

(declare-fun res!694118 () Bool)

(declare-fun e!589752 () Bool)

(assert (=> d!125881 (=> res!694118 e!589752)))

(assert (=> d!125881 (= res!694118 (= (select (arr!31587 lt!458892) #b00000000000000000000000000000000) lt!458933))))

(assert (=> d!125881 (= (arrayContainsKey!0 lt!458892 lt!458933 #b00000000000000000000000000000000) e!589752)))

(declare-fun b!1041414 () Bool)

(declare-fun e!589753 () Bool)

(assert (=> b!1041414 (= e!589752 e!589753)))

(declare-fun res!694119 () Bool)

(assert (=> b!1041414 (=> (not res!694119) (not e!589753))))

(assert (=> b!1041414 (= res!694119 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32119 lt!458892)))))

(declare-fun b!1041415 () Bool)

(assert (=> b!1041415 (= e!589753 (arrayContainsKey!0 lt!458892 lt!458933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125881 (not res!694118)) b!1041414))

(assert (= (and b!1041414 res!694119) b!1041415))

(assert (=> d!125881 m!960725))

(declare-fun m!960857 () Bool)

(assert (=> b!1041415 m!960857))

(assert (=> b!1041241 d!125881))

(declare-fun d!125883 () Bool)

(declare-fun lt!458994 () SeekEntryResult!9805)

(assert (=> d!125883 (and (or ((_ is Undefined!9805) lt!458994) (not ((_ is Found!9805) lt!458994)) (and (bvsge (index!41592 lt!458994) #b00000000000000000000000000000000) (bvslt (index!41592 lt!458994) (size!32119 lt!458892)))) (or ((_ is Undefined!9805) lt!458994) ((_ is Found!9805) lt!458994) (not ((_ is MissingZero!9805) lt!458994)) (and (bvsge (index!41591 lt!458994) #b00000000000000000000000000000000) (bvslt (index!41591 lt!458994) (size!32119 lt!458892)))) (or ((_ is Undefined!9805) lt!458994) ((_ is Found!9805) lt!458994) ((_ is MissingZero!9805) lt!458994) (not ((_ is MissingVacant!9805) lt!458994)) (and (bvsge (index!41594 lt!458994) #b00000000000000000000000000000000) (bvslt (index!41594 lt!458994) (size!32119 lt!458892)))) (or ((_ is Undefined!9805) lt!458994) (ite ((_ is Found!9805) lt!458994) (= (select (arr!31587 lt!458892) (index!41592 lt!458994)) (select (arr!31587 lt!458892) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9805) lt!458994) (= (select (arr!31587 lt!458892) (index!41591 lt!458994)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9805) lt!458994) (= (select (arr!31587 lt!458892) (index!41594 lt!458994)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!589762 () SeekEntryResult!9805)

(assert (=> d!125883 (= lt!458994 e!589762)))

(declare-fun c!105661 () Bool)

(declare-fun lt!458995 () SeekEntryResult!9805)

(assert (=> d!125883 (= c!105661 (and ((_ is Intermediate!9805) lt!458995) (undefined!10617 lt!458995)))))

(assert (=> d!125883 (= lt!458995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) (mask!30370 thiss!1427)) (select (arr!31587 lt!458892) #b00000000000000000000000000000000) lt!458892 (mask!30370 thiss!1427)))))

(assert (=> d!125883 (validMask!0 (mask!30370 thiss!1427))))

(assert (=> d!125883 (= (seekEntryOrOpen!0 (select (arr!31587 lt!458892) #b00000000000000000000000000000000) lt!458892 (mask!30370 thiss!1427)) lt!458994)))

(declare-fun b!1041428 () Bool)

(assert (=> b!1041428 (= e!589762 Undefined!9805)))

(declare-fun b!1041429 () Bool)

(declare-fun e!589761 () SeekEntryResult!9805)

(assert (=> b!1041429 (= e!589762 e!589761)))

(declare-fun lt!458996 () (_ BitVec 64))

(assert (=> b!1041429 (= lt!458996 (select (arr!31587 lt!458892) (index!41593 lt!458995)))))

(declare-fun c!105660 () Bool)

(assert (=> b!1041429 (= c!105660 (= lt!458996 (select (arr!31587 lt!458892) #b00000000000000000000000000000000)))))

(declare-fun b!1041430 () Bool)

(declare-fun e!589760 () SeekEntryResult!9805)

(assert (=> b!1041430 (= e!589760 (MissingZero!9805 (index!41593 lt!458995)))))

(declare-fun b!1041431 () Bool)

(assert (=> b!1041431 (= e!589760 (seekKeyOrZeroReturnVacant!0 (x!92950 lt!458995) (index!41593 lt!458995) (index!41593 lt!458995) (select (arr!31587 lt!458892) #b00000000000000000000000000000000) lt!458892 (mask!30370 thiss!1427)))))

(declare-fun b!1041432 () Bool)

(assert (=> b!1041432 (= e!589761 (Found!9805 (index!41593 lt!458995)))))

(declare-fun b!1041433 () Bool)

(declare-fun c!105659 () Bool)

(assert (=> b!1041433 (= c!105659 (= lt!458996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041433 (= e!589761 e!589760)))

(assert (= (and d!125883 c!105661) b!1041428))

(assert (= (and d!125883 (not c!105661)) b!1041429))

(assert (= (and b!1041429 c!105660) b!1041432))

(assert (= (and b!1041429 (not c!105660)) b!1041433))

(assert (= (and b!1041433 c!105659) b!1041430))

(assert (= (and b!1041433 (not c!105659)) b!1041431))

(declare-fun m!960859 () Bool)

(assert (=> d!125883 m!960859))

(declare-fun m!960861 () Bool)

(assert (=> d!125883 m!960861))

(assert (=> d!125883 m!960725))

(declare-fun m!960863 () Bool)

(assert (=> d!125883 m!960863))

(assert (=> d!125883 m!960645))

(assert (=> d!125883 m!960725))

(assert (=> d!125883 m!960861))

(declare-fun m!960865 () Bool)

(assert (=> d!125883 m!960865))

(declare-fun m!960867 () Bool)

(assert (=> d!125883 m!960867))

(declare-fun m!960869 () Bool)

(assert (=> b!1041429 m!960869))

(assert (=> b!1041431 m!960725))

(declare-fun m!960871 () Bool)

(assert (=> b!1041431 m!960871))

(assert (=> b!1041241 d!125883))

(declare-fun condMapEmpty!38727 () Bool)

(declare-fun mapDefault!38727 () ValueCell!11673)

(assert (=> mapNonEmpty!38726 (= condMapEmpty!38727 (= mapRest!38726 ((as const (Array (_ BitVec 32) ValueCell!11673)) mapDefault!38727)))))

(declare-fun e!589764 () Bool)

(declare-fun mapRes!38727 () Bool)

(assert (=> mapNonEmpty!38726 (= tp!74316 (and e!589764 mapRes!38727))))

(declare-fun b!1041434 () Bool)

(declare-fun e!589763 () Bool)

(assert (=> b!1041434 (= e!589763 tp_is_empty!24753)))

(declare-fun mapNonEmpty!38727 () Bool)

(declare-fun tp!74317 () Bool)

(assert (=> mapNonEmpty!38727 (= mapRes!38727 (and tp!74317 e!589763))))

(declare-fun mapKey!38727 () (_ BitVec 32))

(declare-fun mapValue!38727 () ValueCell!11673)

(declare-fun mapRest!38727 () (Array (_ BitVec 32) ValueCell!11673))

(assert (=> mapNonEmpty!38727 (= mapRest!38726 (store mapRest!38727 mapKey!38727 mapValue!38727))))

(declare-fun mapIsEmpty!38727 () Bool)

(assert (=> mapIsEmpty!38727 mapRes!38727))

(declare-fun b!1041435 () Bool)

(assert (=> b!1041435 (= e!589764 tp_is_empty!24753)))

(assert (= (and mapNonEmpty!38726 condMapEmpty!38727) mapIsEmpty!38727))

(assert (= (and mapNonEmpty!38726 (not condMapEmpty!38727)) mapNonEmpty!38727))

(assert (= (and mapNonEmpty!38727 ((_ is ValueCellFull!11673) mapValue!38727)) b!1041434))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11673) mapDefault!38727)) b!1041435))

(declare-fun m!960873 () Bool)

(assert (=> mapNonEmpty!38727 m!960873))

(check-sat (not bm!44112) (not b_next!21033) (not b!1041312) (not b!1041363) (not d!125883) (not b!1041370) (not b!1041366) (not b!1041395) (not b!1041404) (not b!1041368) (not b!1041313) (not b!1041310) (not b!1041415) (not b!1041331) (not b!1041403) (not d!125839) (not bm!44108) b_and!33565 (not d!125871) (not b!1041393) (not b!1041407) (not b!1041431) (not b!1041397) (not bm!44111) (not b!1041317) (not bm!44109) (not b!1041308) (not d!125847) (not b!1041334) (not b!1041374) (not d!125843) (not b!1041330) (not d!125879) (not b!1041409) (not bm!44104) (not bm!44105) (not bm!44107) (not bm!44110) (not b!1041316) (not d!125867) (not bm!44106) tp_is_empty!24753 (not b!1041320) (not b!1041411) (not d!125863) (not b!1041390) (not d!125873) (not b!1041364) (not d!125833) (not mapNonEmpty!38727))
(check-sat b_and!33565 (not b_next!21033))
