; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91282 () Bool)

(assert start!91282)

(declare-fun b!1040996 () Bool)

(declare-fun b_free!21031 () Bool)

(declare-fun b_next!21031 () Bool)

(assert (=> b!1040996 (= b_free!21031 (not b_next!21031))))

(declare-fun tp!74301 () Bool)

(declare-fun b_and!33537 () Bool)

(assert (=> b!1040996 (= tp!74301 b_and!33537)))

(declare-fun tp_is_empty!24751 () Bool)

(declare-fun e!589473 () Bool)

(declare-fun e!589476 () Bool)

(declare-datatypes ((V!37875 0))(
  ( (V!37876 (val!12426 Int)) )
))
(declare-datatypes ((ValueCell!11672 0))(
  ( (ValueCellFull!11672 (v!15013 V!37875)) (EmptyCell!11672) )
))
(declare-datatypes ((array!65585 0))(
  ( (array!65586 (arr!31554 (Array (_ BitVec 32) (_ BitVec 64))) (size!32088 (_ BitVec 32))) )
))
(declare-datatypes ((array!65587 0))(
  ( (array!65588 (arr!31555 (Array (_ BitVec 32) ValueCell!11672)) (size!32089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5938 0))(
  ( (LongMapFixedSize!5939 (defaultEntry!6351 Int) (mask!30364 (_ BitVec 32)) (extraKeys!6079 (_ BitVec 32)) (zeroValue!6185 V!37875) (minValue!6185 V!37875) (_size!3024 (_ BitVec 32)) (_keys!11578 array!65585) (_values!6374 array!65587) (_vacant!3024 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5938)

(declare-fun array_inv!24389 (array!65585) Bool)

(declare-fun array_inv!24390 (array!65587) Bool)

(assert (=> b!1040996 (= e!589476 (and tp!74301 tp_is_empty!24751 (array_inv!24389 (_keys!11578 thiss!1427)) (array_inv!24390 (_values!6374 thiss!1427)) e!589473))))

(declare-fun mapNonEmpty!38717 () Bool)

(declare-fun mapRes!38717 () Bool)

(declare-fun tp!74300 () Bool)

(declare-fun e!589480 () Bool)

(assert (=> mapNonEmpty!38717 (= mapRes!38717 (and tp!74300 e!589480))))

(declare-fun mapKey!38717 () (_ BitVec 32))

(declare-fun mapValue!38717 () ValueCell!11672)

(declare-fun mapRest!38717 () (Array (_ BitVec 32) ValueCell!11672))

(assert (=> mapNonEmpty!38717 (= (arr!31555 (_values!6374 thiss!1427)) (store mapRest!38717 mapKey!38717 mapValue!38717))))

(declare-fun b!1040997 () Bool)

(declare-fun e!589479 () Bool)

(assert (=> b!1040997 (= e!589479 (or (not (= (size!32089 (_values!6374 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30364 thiss!1427)))) (= (size!32088 (_keys!11578 thiss!1427)) (size!32089 (_values!6374 thiss!1427)))))))

(declare-fun b!1040998 () Bool)

(assert (=> b!1040998 (= e!589480 tp_is_empty!24751)))

(declare-fun res!693925 () Bool)

(declare-fun e!589478 () Bool)

(assert (=> start!91282 (=> (not res!693925) (not e!589478))))

(declare-fun valid!2219 (LongMapFixedSize!5938) Bool)

(assert (=> start!91282 (= res!693925 (valid!2219 thiss!1427))))

(assert (=> start!91282 e!589478))

(assert (=> start!91282 e!589476))

(assert (=> start!91282 true))

(declare-fun b!1040999 () Bool)

(declare-fun e!589474 () Bool)

(assert (=> b!1040999 (= e!589474 tp_is_empty!24751)))

(declare-fun mapIsEmpty!38717 () Bool)

(assert (=> mapIsEmpty!38717 mapRes!38717))

(declare-fun b!1041000 () Bool)

(declare-fun e!589475 () Bool)

(assert (=> b!1041000 (= e!589478 e!589475)))

(declare-fun res!693927 () Bool)

(assert (=> b!1041000 (=> (not res!693927) (not e!589475))))

(declare-datatypes ((SeekEntryResult!9801 0))(
  ( (MissingZero!9801 (index!41575 (_ BitVec 32))) (Found!9801 (index!41576 (_ BitVec 32))) (Intermediate!9801 (undefined!10613 Bool) (index!41577 (_ BitVec 32)) (x!92943 (_ BitVec 32))) (Undefined!9801) (MissingVacant!9801 (index!41578 (_ BitVec 32))) )
))
(declare-fun lt!458677 () SeekEntryResult!9801)

(get-info :version)

(assert (=> b!1041000 (= res!693927 ((_ is Found!9801) lt!458677))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65585 (_ BitVec 32)) SeekEntryResult!9801)

(assert (=> b!1041000 (= lt!458677 (seekEntry!0 key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041001 () Bool)

(assert (=> b!1041001 (= e!589473 (and e!589474 mapRes!38717))))

(declare-fun condMapEmpty!38717 () Bool)

(declare-fun mapDefault!38717 () ValueCell!11672)

(assert (=> b!1041001 (= condMapEmpty!38717 (= (arr!31555 (_values!6374 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38717)))))

(declare-fun b!1041002 () Bool)

(assert (=> b!1041002 (= e!589475 (not e!589479))))

(declare-fun res!693926 () Bool)

(assert (=> b!1041002 (=> res!693926 e!589479)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041002 (= res!693926 (not (validMask!0 (mask!30364 thiss!1427))))))

(declare-fun lt!458676 () array!65585)

(declare-fun arrayContainsKey!0 (array!65585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041002 (not (arrayContainsKey!0 lt!458676 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33911 0))(
  ( (Unit!33912) )
))
(declare-fun lt!458673 () Unit!33911)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65585 (_ BitVec 32) (_ BitVec 64)) Unit!33911)

(assert (=> b!1041002 (= lt!458673 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65585 (_ BitVec 32)) Bool)

(assert (=> b!1041002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458676 (mask!30364 thiss!1427))))

(declare-fun lt!458678 () Unit!33911)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65585 (_ BitVec 32) (_ BitVec 32)) Unit!33911)

(assert (=> b!1041002 (= lt!458678 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) (mask!30364 thiss!1427)))))

(declare-datatypes ((List!22001 0))(
  ( (Nil!21998) (Cons!21997 (h!23202 (_ BitVec 64)) (t!31206 List!22001)) )
))
(declare-fun arrayNoDuplicates!0 (array!65585 (_ BitVec 32) List!22001) Bool)

(assert (=> b!1041002 (arrayNoDuplicates!0 lt!458676 #b00000000000000000000000000000000 Nil!21998)))

(declare-fun lt!458675 () Unit!33911)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22001) Unit!33911)

(assert (=> b!1041002 (= lt!458675 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11578 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41576 lt!458677) #b00000000000000000000000000000000 Nil!21998))))

(declare-fun arrayCountValidKeys!0 (array!65585 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041002 (= (arrayCountValidKeys!0 lt!458676 #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041002 (= lt!458676 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun lt!458674 () Unit!33911)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65585 (_ BitVec 32) (_ BitVec 64)) Unit!33911)

(assert (=> b!1041002 (= lt!458674 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041003 () Bool)

(declare-fun res!693928 () Bool)

(assert (=> b!1041003 (=> (not res!693928) (not e!589478))))

(assert (=> b!1041003 (= res!693928 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91282 res!693925) b!1041003))

(assert (= (and b!1041003 res!693928) b!1041000))

(assert (= (and b!1041000 res!693927) b!1041002))

(assert (= (and b!1041002 (not res!693926)) b!1040997))

(assert (= (and b!1041001 condMapEmpty!38717) mapIsEmpty!38717))

(assert (= (and b!1041001 (not condMapEmpty!38717)) mapNonEmpty!38717))

(assert (= (and mapNonEmpty!38717 ((_ is ValueCellFull!11672) mapValue!38717)) b!1040998))

(assert (= (and b!1041001 ((_ is ValueCellFull!11672) mapDefault!38717)) b!1040999))

(assert (= b!1040996 b!1041001))

(assert (= start!91282 b!1040996))

(declare-fun m!959991 () Bool)

(assert (=> b!1040996 m!959991))

(declare-fun m!959993 () Bool)

(assert (=> b!1040996 m!959993))

(declare-fun m!959995 () Bool)

(assert (=> mapNonEmpty!38717 m!959995))

(declare-fun m!959997 () Bool)

(assert (=> b!1041000 m!959997))

(declare-fun m!959999 () Bool)

(assert (=> start!91282 m!959999))

(declare-fun m!960001 () Bool)

(assert (=> b!1041002 m!960001))

(declare-fun m!960003 () Bool)

(assert (=> b!1041002 m!960003))

(declare-fun m!960005 () Bool)

(assert (=> b!1041002 m!960005))

(declare-fun m!960007 () Bool)

(assert (=> b!1041002 m!960007))

(declare-fun m!960009 () Bool)

(assert (=> b!1041002 m!960009))

(declare-fun m!960011 () Bool)

(assert (=> b!1041002 m!960011))

(declare-fun m!960013 () Bool)

(assert (=> b!1041002 m!960013))

(declare-fun m!960015 () Bool)

(assert (=> b!1041002 m!960015))

(declare-fun m!960017 () Bool)

(assert (=> b!1041002 m!960017))

(declare-fun m!960019 () Bool)

(assert (=> b!1041002 m!960019))

(declare-fun m!960021 () Bool)

(assert (=> b!1041002 m!960021))

(check-sat (not b!1041002) (not start!91282) (not b_next!21031) b_and!33537 (not b!1041000) (not mapNonEmpty!38717) (not b!1040996) tp_is_empty!24751)
(check-sat b_and!33537 (not b_next!21031))
(get-model)

(declare-fun d!125653 () Bool)

(assert (=> d!125653 (= (array_inv!24389 (_keys!11578 thiss!1427)) (bvsge (size!32088 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040996 d!125653))

(declare-fun d!125655 () Bool)

(assert (=> d!125655 (= (array_inv!24390 (_values!6374 thiss!1427)) (bvsge (size!32089 (_values!6374 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040996 d!125655))

(declare-fun d!125657 () Bool)

(declare-fun res!693959 () Bool)

(declare-fun e!589531 () Bool)

(assert (=> d!125657 (=> (not res!693959) (not e!589531))))

(declare-fun simpleValid!437 (LongMapFixedSize!5938) Bool)

(assert (=> d!125657 (= res!693959 (simpleValid!437 thiss!1427))))

(assert (=> d!125657 (= (valid!2219 thiss!1427) e!589531)))

(declare-fun b!1041058 () Bool)

(declare-fun res!693960 () Bool)

(assert (=> b!1041058 (=> (not res!693960) (not e!589531))))

(assert (=> b!1041058 (= res!693960 (= (arrayCountValidKeys!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (_size!3024 thiss!1427)))))

(declare-fun b!1041059 () Bool)

(declare-fun res!693961 () Bool)

(assert (=> b!1041059 (=> (not res!693961) (not e!589531))))

(assert (=> b!1041059 (= res!693961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041060 () Bool)

(assert (=> b!1041060 (= e!589531 (arrayNoDuplicates!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 Nil!21998))))

(assert (= (and d!125657 res!693959) b!1041058))

(assert (= (and b!1041058 res!693960) b!1041059))

(assert (= (and b!1041059 res!693961) b!1041060))

(declare-fun m!960087 () Bool)

(assert (=> d!125657 m!960087))

(assert (=> b!1041058 m!960019))

(declare-fun m!960089 () Bool)

(assert (=> b!1041059 m!960089))

(declare-fun m!960091 () Bool)

(assert (=> b!1041060 m!960091))

(assert (=> start!91282 d!125657))

(declare-fun b!1041073 () Bool)

(declare-fun e!589540 () SeekEntryResult!9801)

(declare-fun e!589539 () SeekEntryResult!9801)

(assert (=> b!1041073 (= e!589540 e!589539)))

(declare-fun lt!458726 () (_ BitVec 64))

(declare-fun lt!458725 () SeekEntryResult!9801)

(assert (=> b!1041073 (= lt!458726 (select (arr!31554 (_keys!11578 thiss!1427)) (index!41577 lt!458725)))))

(declare-fun c!105568 () Bool)

(assert (=> b!1041073 (= c!105568 (= lt!458726 key!909))))

(declare-fun b!1041074 () Bool)

(assert (=> b!1041074 (= e!589539 (Found!9801 (index!41577 lt!458725)))))

(declare-fun d!125659 () Bool)

(declare-fun lt!458724 () SeekEntryResult!9801)

(assert (=> d!125659 (and (or ((_ is MissingVacant!9801) lt!458724) (not ((_ is Found!9801) lt!458724)) (and (bvsge (index!41576 lt!458724) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458724) (size!32088 (_keys!11578 thiss!1427))))) (not ((_ is MissingVacant!9801) lt!458724)) (or (not ((_ is Found!9801) lt!458724)) (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458724)) key!909)))))

(assert (=> d!125659 (= lt!458724 e!589540)))

(declare-fun c!105567 () Bool)

(assert (=> d!125659 (= c!105567 (and ((_ is Intermediate!9801) lt!458725) (undefined!10613 lt!458725)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65585 (_ BitVec 32)) SeekEntryResult!9801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125659 (= lt!458725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30364 thiss!1427)) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(assert (=> d!125659 (validMask!0 (mask!30364 thiss!1427))))

(assert (=> d!125659 (= (seekEntry!0 key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)) lt!458724)))

(declare-fun b!1041075 () Bool)

(declare-fun e!589538 () SeekEntryResult!9801)

(declare-fun lt!458723 () SeekEntryResult!9801)

(assert (=> b!1041075 (= e!589538 (ite ((_ is MissingVacant!9801) lt!458723) (MissingZero!9801 (index!41578 lt!458723)) lt!458723))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65585 (_ BitVec 32)) SeekEntryResult!9801)

(assert (=> b!1041075 (= lt!458723 (seekKeyOrZeroReturnVacant!0 (x!92943 lt!458725) (index!41577 lt!458725) (index!41577 lt!458725) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041076 () Bool)

(declare-fun c!105569 () Bool)

(assert (=> b!1041076 (= c!105569 (= lt!458726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041076 (= e!589539 e!589538)))

(declare-fun b!1041077 () Bool)

(assert (=> b!1041077 (= e!589540 Undefined!9801)))

(declare-fun b!1041078 () Bool)

(assert (=> b!1041078 (= e!589538 (MissingZero!9801 (index!41577 lt!458725)))))

(assert (= (and d!125659 c!105567) b!1041077))

(assert (= (and d!125659 (not c!105567)) b!1041073))

(assert (= (and b!1041073 c!105568) b!1041074))

(assert (= (and b!1041073 (not c!105568)) b!1041076))

(assert (= (and b!1041076 c!105569) b!1041078))

(assert (= (and b!1041076 (not c!105569)) b!1041075))

(declare-fun m!960093 () Bool)

(assert (=> b!1041073 m!960093))

(declare-fun m!960095 () Bool)

(assert (=> d!125659 m!960095))

(declare-fun m!960097 () Bool)

(assert (=> d!125659 m!960097))

(assert (=> d!125659 m!960097))

(declare-fun m!960099 () Bool)

(assert (=> d!125659 m!960099))

(assert (=> d!125659 m!960017))

(declare-fun m!960101 () Bool)

(assert (=> b!1041075 m!960101))

(assert (=> b!1041000 d!125659))

(declare-fun d!125661 () Bool)

(declare-fun e!589543 () Bool)

(assert (=> d!125661 e!589543))

(declare-fun res!693964 () Bool)

(assert (=> d!125661 (=> (not res!693964) (not e!589543))))

(assert (=> d!125661 (= res!693964 (and (bvsge (index!41576 lt!458677) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458677) (size!32088 (_keys!11578 thiss!1427)))))))

(declare-fun lt!458729 () Unit!33911)

(declare-fun choose!53 (array!65585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22001) Unit!33911)

(assert (=> d!125661 (= lt!458729 (choose!53 (_keys!11578 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41576 lt!458677) #b00000000000000000000000000000000 Nil!21998))))

(assert (=> d!125661 (bvslt (size!32088 (_keys!11578 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125661 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11578 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41576 lt!458677) #b00000000000000000000000000000000 Nil!21998) lt!458729)))

(declare-fun b!1041081 () Bool)

(assert (=> b!1041081 (= e!589543 (arrayNoDuplicates!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 Nil!21998))))

(assert (= (and d!125661 res!693964) b!1041081))

(declare-fun m!960103 () Bool)

(assert (=> d!125661 m!960103))

(assert (=> b!1041081 m!960013))

(declare-fun m!960105 () Bool)

(assert (=> b!1041081 m!960105))

(assert (=> b!1041002 d!125661))

(declare-fun bm!44073 () Bool)

(declare-fun call!44076 () Bool)

(assert (=> bm!44073 (= call!44076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458676 (mask!30364 thiss!1427)))))

(declare-fun b!1041091 () Bool)

(declare-fun e!589552 () Bool)

(assert (=> b!1041091 (= e!589552 call!44076)))

(declare-fun b!1041092 () Bool)

(declare-fun e!589550 () Bool)

(assert (=> b!1041092 (= e!589550 call!44076)))

(declare-fun b!1041093 () Bool)

(declare-fun e!589551 () Bool)

(assert (=> b!1041093 (= e!589551 e!589552)))

(declare-fun c!105572 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041093 (= c!105572 (validKeyInArray!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun d!125663 () Bool)

(declare-fun res!693970 () Bool)

(assert (=> d!125663 (=> res!693970 e!589551)))

(assert (=> d!125663 (= res!693970 (bvsge #b00000000000000000000000000000000 (size!32088 lt!458676)))))

(assert (=> d!125663 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458676 (mask!30364 thiss!1427)) e!589551)))

(declare-fun b!1041090 () Bool)

(assert (=> b!1041090 (= e!589552 e!589550)))

(declare-fun lt!458736 () (_ BitVec 64))

(assert (=> b!1041090 (= lt!458736 (select (arr!31554 lt!458676) #b00000000000000000000000000000000))))

(declare-fun lt!458737 () Unit!33911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65585 (_ BitVec 64) (_ BitVec 32)) Unit!33911)

(assert (=> b!1041090 (= lt!458737 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458676 lt!458736 #b00000000000000000000000000000000))))

(assert (=> b!1041090 (arrayContainsKey!0 lt!458676 lt!458736 #b00000000000000000000000000000000)))

(declare-fun lt!458738 () Unit!33911)

(assert (=> b!1041090 (= lt!458738 lt!458737)))

(declare-fun res!693969 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65585 (_ BitVec 32)) SeekEntryResult!9801)

(assert (=> b!1041090 (= res!693969 (= (seekEntryOrOpen!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) lt!458676 (mask!30364 thiss!1427)) (Found!9801 #b00000000000000000000000000000000)))))

(assert (=> b!1041090 (=> (not res!693969) (not e!589550))))

(assert (= (and d!125663 (not res!693970)) b!1041093))

(assert (= (and b!1041093 c!105572) b!1041090))

(assert (= (and b!1041093 (not c!105572)) b!1041091))

(assert (= (and b!1041090 res!693969) b!1041092))

(assert (= (or b!1041092 b!1041091) bm!44073))

(declare-fun m!960107 () Bool)

(assert (=> bm!44073 m!960107))

(declare-fun m!960109 () Bool)

(assert (=> b!1041093 m!960109))

(assert (=> b!1041093 m!960109))

(declare-fun m!960111 () Bool)

(assert (=> b!1041093 m!960111))

(assert (=> b!1041090 m!960109))

(declare-fun m!960113 () Bool)

(assert (=> b!1041090 m!960113))

(declare-fun m!960115 () Bool)

(assert (=> b!1041090 m!960115))

(assert (=> b!1041090 m!960109))

(declare-fun m!960117 () Bool)

(assert (=> b!1041090 m!960117))

(assert (=> b!1041002 d!125663))

(declare-fun d!125665 () Bool)

(declare-fun e!589555 () Bool)

(assert (=> d!125665 e!589555))

(declare-fun res!693973 () Bool)

(assert (=> d!125665 (=> (not res!693973) (not e!589555))))

(assert (=> d!125665 (= res!693973 (bvslt (index!41576 lt!458677) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun lt!458741 () Unit!33911)

(declare-fun choose!121 (array!65585 (_ BitVec 32) (_ BitVec 64)) Unit!33911)

(assert (=> d!125665 (= lt!458741 (choose!121 (_keys!11578 thiss!1427) (index!41576 lt!458677) key!909))))

(assert (=> d!125665 (bvsge (index!41576 lt!458677) #b00000000000000000000000000000000)))

(assert (=> d!125665 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) key!909) lt!458741)))

(declare-fun b!1041096 () Bool)

(assert (=> b!1041096 (= e!589555 (not (arrayContainsKey!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125665 res!693973) b!1041096))

(declare-fun m!960119 () Bool)

(assert (=> d!125665 m!960119))

(assert (=> b!1041096 m!960013))

(declare-fun m!960121 () Bool)

(assert (=> b!1041096 m!960121))

(assert (=> b!1041002 d!125665))

(declare-fun b!1041107 () Bool)

(declare-fun e!589561 () Bool)

(assert (=> b!1041107 (= e!589561 (bvslt (size!32088 (_keys!11578 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041106 () Bool)

(declare-fun res!693985 () Bool)

(assert (=> b!1041106 (=> (not res!693985) (not e!589561))))

(assert (=> b!1041106 (= res!693985 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041108 () Bool)

(declare-fun e!589560 () Bool)

(assert (=> b!1041108 (= e!589560 (= (arrayCountValidKeys!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125667 () Bool)

(assert (=> d!125667 e!589560))

(declare-fun res!693983 () Bool)

(assert (=> d!125667 (=> (not res!693983) (not e!589560))))

(assert (=> d!125667 (= res!693983 (and (bvsge (index!41576 lt!458677) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458677) (size!32088 (_keys!11578 thiss!1427)))))))

(declare-fun lt!458744 () Unit!33911)

(declare-fun choose!82 (array!65585 (_ BitVec 32) (_ BitVec 64)) Unit!33911)

(assert (=> d!125667 (= lt!458744 (choose!82 (_keys!11578 thiss!1427) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125667 e!589561))

(declare-fun res!693982 () Bool)

(assert (=> d!125667 (=> (not res!693982) (not e!589561))))

(assert (=> d!125667 (= res!693982 (and (bvsge (index!41576 lt!458677) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458677) (size!32088 (_keys!11578 thiss!1427)))))))

(assert (=> d!125667 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458744)))

(declare-fun b!1041105 () Bool)

(declare-fun res!693984 () Bool)

(assert (=> b!1041105 (=> (not res!693984) (not e!589561))))

(assert (=> b!1041105 (= res!693984 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677))))))

(assert (= (and d!125667 res!693982) b!1041105))

(assert (= (and b!1041105 res!693984) b!1041106))

(assert (= (and b!1041106 res!693985) b!1041107))

(assert (= (and d!125667 res!693983) b!1041108))

(declare-fun m!960123 () Bool)

(assert (=> b!1041106 m!960123))

(assert (=> b!1041108 m!960013))

(declare-fun m!960125 () Bool)

(assert (=> b!1041108 m!960125))

(assert (=> b!1041108 m!960019))

(declare-fun m!960127 () Bool)

(assert (=> d!125667 m!960127))

(declare-fun m!960129 () Bool)

(assert (=> b!1041105 m!960129))

(assert (=> b!1041105 m!960129))

(declare-fun m!960131 () Bool)

(assert (=> b!1041105 m!960131))

(assert (=> b!1041002 d!125667))

(declare-fun b!1041118 () Bool)

(declare-fun e!589567 () (_ BitVec 32))

(declare-fun e!589566 () (_ BitVec 32))

(assert (=> b!1041118 (= e!589567 e!589566)))

(declare-fun c!105578 () Bool)

(assert (=> b!1041118 (= c!105578 (validKeyInArray!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun bm!44076 () Bool)

(declare-fun call!44079 () (_ BitVec 32))

(assert (=> bm!44076 (= call!44079 (arrayCountValidKeys!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun d!125669 () Bool)

(declare-fun lt!458747 () (_ BitVec 32))

(assert (=> d!125669 (and (bvsge lt!458747 #b00000000000000000000000000000000) (bvsle lt!458747 (bvsub (size!32088 lt!458676) #b00000000000000000000000000000000)))))

(assert (=> d!125669 (= lt!458747 e!589567)))

(declare-fun c!105577 () Bool)

(assert (=> d!125669 (= c!105577 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125669 (and (bvsle #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11578 thiss!1427)) (size!32088 lt!458676)))))

(assert (=> d!125669 (= (arrayCountValidKeys!0 lt!458676 #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) lt!458747)))

(declare-fun b!1041117 () Bool)

(assert (=> b!1041117 (= e!589567 #b00000000000000000000000000000000)))

(declare-fun b!1041119 () Bool)

(assert (=> b!1041119 (= e!589566 call!44079)))

(declare-fun b!1041120 () Bool)

(assert (=> b!1041120 (= e!589566 (bvadd #b00000000000000000000000000000001 call!44079))))

(assert (= (and d!125669 c!105577) b!1041117))

(assert (= (and d!125669 (not c!105577)) b!1041118))

(assert (= (and b!1041118 c!105578) b!1041120))

(assert (= (and b!1041118 (not c!105578)) b!1041119))

(assert (= (or b!1041120 b!1041119) bm!44076))

(assert (=> b!1041118 m!960109))

(assert (=> b!1041118 m!960109))

(assert (=> b!1041118 m!960111))

(declare-fun m!960133 () Bool)

(assert (=> bm!44076 m!960133))

(assert (=> b!1041002 d!125669))

(declare-fun d!125671 () Bool)

(declare-fun e!589570 () Bool)

(assert (=> d!125671 e!589570))

(declare-fun res!693988 () Bool)

(assert (=> d!125671 (=> (not res!693988) (not e!589570))))

(assert (=> d!125671 (= res!693988 (and (bvsge (index!41576 lt!458677) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458677) (size!32088 (_keys!11578 thiss!1427)))))))

(declare-fun lt!458750 () Unit!33911)

(declare-fun choose!25 (array!65585 (_ BitVec 32) (_ BitVec 32)) Unit!33911)

(assert (=> d!125671 (= lt!458750 (choose!25 (_keys!11578 thiss!1427) (index!41576 lt!458677) (mask!30364 thiss!1427)))))

(assert (=> d!125671 (validMask!0 (mask!30364 thiss!1427))))

(assert (=> d!125671 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11578 thiss!1427) (index!41576 lt!458677) (mask!30364 thiss!1427)) lt!458750)))

(declare-fun b!1041123 () Bool)

(assert (=> b!1041123 (= e!589570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (mask!30364 thiss!1427)))))

(assert (= (and d!125671 res!693988) b!1041123))

(declare-fun m!960135 () Bool)

(assert (=> d!125671 m!960135))

(assert (=> d!125671 m!960017))

(assert (=> b!1041123 m!960013))

(declare-fun m!960137 () Bool)

(assert (=> b!1041123 m!960137))

(assert (=> b!1041002 d!125671))

(declare-fun d!125673 () Bool)

(assert (=> d!125673 (= (validMask!0 (mask!30364 thiss!1427)) (and (or (= (mask!30364 thiss!1427) #b00000000000000000000000000000111) (= (mask!30364 thiss!1427) #b00000000000000000000000000001111) (= (mask!30364 thiss!1427) #b00000000000000000000000000011111) (= (mask!30364 thiss!1427) #b00000000000000000000000000111111) (= (mask!30364 thiss!1427) #b00000000000000000000000001111111) (= (mask!30364 thiss!1427) #b00000000000000000000000011111111) (= (mask!30364 thiss!1427) #b00000000000000000000000111111111) (= (mask!30364 thiss!1427) #b00000000000000000000001111111111) (= (mask!30364 thiss!1427) #b00000000000000000000011111111111) (= (mask!30364 thiss!1427) #b00000000000000000000111111111111) (= (mask!30364 thiss!1427) #b00000000000000000001111111111111) (= (mask!30364 thiss!1427) #b00000000000000000011111111111111) (= (mask!30364 thiss!1427) #b00000000000000000111111111111111) (= (mask!30364 thiss!1427) #b00000000000000001111111111111111) (= (mask!30364 thiss!1427) #b00000000000000011111111111111111) (= (mask!30364 thiss!1427) #b00000000000000111111111111111111) (= (mask!30364 thiss!1427) #b00000000000001111111111111111111) (= (mask!30364 thiss!1427) #b00000000000011111111111111111111) (= (mask!30364 thiss!1427) #b00000000000111111111111111111111) (= (mask!30364 thiss!1427) #b00000000001111111111111111111111) (= (mask!30364 thiss!1427) #b00000000011111111111111111111111) (= (mask!30364 thiss!1427) #b00000000111111111111111111111111) (= (mask!30364 thiss!1427) #b00000001111111111111111111111111) (= (mask!30364 thiss!1427) #b00000011111111111111111111111111) (= (mask!30364 thiss!1427) #b00000111111111111111111111111111) (= (mask!30364 thiss!1427) #b00001111111111111111111111111111) (= (mask!30364 thiss!1427) #b00011111111111111111111111111111) (= (mask!30364 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30364 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041002 d!125673))

(declare-fun d!125675 () Bool)

(declare-fun res!693993 () Bool)

(declare-fun e!589575 () Bool)

(assert (=> d!125675 (=> res!693993 e!589575)))

(assert (=> d!125675 (= res!693993 (= (select (arr!31554 lt!458676) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125675 (= (arrayContainsKey!0 lt!458676 key!909 #b00000000000000000000000000000000) e!589575)))

(declare-fun b!1041128 () Bool)

(declare-fun e!589576 () Bool)

(assert (=> b!1041128 (= e!589575 e!589576)))

(declare-fun res!693994 () Bool)

(assert (=> b!1041128 (=> (not res!693994) (not e!589576))))

(assert (=> b!1041128 (= res!693994 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 lt!458676)))))

(declare-fun b!1041129 () Bool)

(assert (=> b!1041129 (= e!589576 (arrayContainsKey!0 lt!458676 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125675 (not res!693993)) b!1041128))

(assert (= (and b!1041128 res!693994) b!1041129))

(assert (=> d!125675 m!960109))

(declare-fun m!960139 () Bool)

(assert (=> b!1041129 m!960139))

(assert (=> b!1041002 d!125675))

(declare-fun b!1041131 () Bool)

(declare-fun e!589578 () (_ BitVec 32))

(declare-fun e!589577 () (_ BitVec 32))

(assert (=> b!1041131 (= e!589578 e!589577)))

(declare-fun c!105580 () Bool)

(assert (=> b!1041131 (= c!105580 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44077 () Bool)

(declare-fun call!44080 () (_ BitVec 32))

(assert (=> bm!44077 (= call!44080 (arrayCountValidKeys!0 (_keys!11578 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun d!125677 () Bool)

(declare-fun lt!458751 () (_ BitVec 32))

(assert (=> d!125677 (and (bvsge lt!458751 #b00000000000000000000000000000000) (bvsle lt!458751 (bvsub (size!32088 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125677 (= lt!458751 e!589578)))

(declare-fun c!105579 () Bool)

(assert (=> d!125677 (= c!105579 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125677 (and (bvsle #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11578 thiss!1427)) (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125677 (= (arrayCountValidKeys!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) lt!458751)))

(declare-fun b!1041130 () Bool)

(assert (=> b!1041130 (= e!589578 #b00000000000000000000000000000000)))

(declare-fun b!1041132 () Bool)

(assert (=> b!1041132 (= e!589577 call!44080)))

(declare-fun b!1041133 () Bool)

(assert (=> b!1041133 (= e!589577 (bvadd #b00000000000000000000000000000001 call!44080))))

(assert (= (and d!125677 c!105579) b!1041130))

(assert (= (and d!125677 (not c!105579)) b!1041131))

(assert (= (and b!1041131 c!105580) b!1041133))

(assert (= (and b!1041131 (not c!105580)) b!1041132))

(assert (= (or b!1041133 b!1041132) bm!44077))

(declare-fun m!960141 () Bool)

(assert (=> b!1041131 m!960141))

(assert (=> b!1041131 m!960141))

(declare-fun m!960143 () Bool)

(assert (=> b!1041131 m!960143))

(declare-fun m!960145 () Bool)

(assert (=> bm!44077 m!960145))

(assert (=> b!1041002 d!125677))

(declare-fun b!1041144 () Bool)

(declare-fun e!589589 () Bool)

(declare-fun call!44083 () Bool)

(assert (=> b!1041144 (= e!589589 call!44083)))

(declare-fun b!1041145 () Bool)

(declare-fun e!589587 () Bool)

(declare-fun contains!6033 (List!22001 (_ BitVec 64)) Bool)

(assert (=> b!1041145 (= e!589587 (contains!6033 Nil!21998 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun b!1041146 () Bool)

(assert (=> b!1041146 (= e!589589 call!44083)))

(declare-fun b!1041147 () Bool)

(declare-fun e!589588 () Bool)

(declare-fun e!589590 () Bool)

(assert (=> b!1041147 (= e!589588 e!589590)))

(declare-fun res!694001 () Bool)

(assert (=> b!1041147 (=> (not res!694001) (not e!589590))))

(assert (=> b!1041147 (= res!694001 (not e!589587))))

(declare-fun res!694002 () Bool)

(assert (=> b!1041147 (=> (not res!694002) (not e!589587))))

(assert (=> b!1041147 (= res!694002 (validKeyInArray!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun d!125679 () Bool)

(declare-fun res!694003 () Bool)

(assert (=> d!125679 (=> res!694003 e!589588)))

(assert (=> d!125679 (= res!694003 (bvsge #b00000000000000000000000000000000 (size!32088 lt!458676)))))

(assert (=> d!125679 (= (arrayNoDuplicates!0 lt!458676 #b00000000000000000000000000000000 Nil!21998) e!589588)))

(declare-fun b!1041148 () Bool)

(assert (=> b!1041148 (= e!589590 e!589589)))

(declare-fun c!105583 () Bool)

(assert (=> b!1041148 (= c!105583 (validKeyInArray!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun bm!44080 () Bool)

(assert (=> bm!44080 (= call!44083 (arrayNoDuplicates!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105583 (Cons!21997 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) Nil!21998) Nil!21998)))))

(assert (= (and d!125679 (not res!694003)) b!1041147))

(assert (= (and b!1041147 res!694002) b!1041145))

(assert (= (and b!1041147 res!694001) b!1041148))

(assert (= (and b!1041148 c!105583) b!1041146))

(assert (= (and b!1041148 (not c!105583)) b!1041144))

(assert (= (or b!1041146 b!1041144) bm!44080))

(assert (=> b!1041145 m!960109))

(assert (=> b!1041145 m!960109))

(declare-fun m!960147 () Bool)

(assert (=> b!1041145 m!960147))

(assert (=> b!1041147 m!960109))

(assert (=> b!1041147 m!960109))

(assert (=> b!1041147 m!960111))

(assert (=> b!1041148 m!960109))

(assert (=> b!1041148 m!960109))

(assert (=> b!1041148 m!960111))

(assert (=> bm!44080 m!960109))

(declare-fun m!960149 () Bool)

(assert (=> bm!44080 m!960149))

(assert (=> b!1041002 d!125679))

(declare-fun condMapEmpty!38726 () Bool)

(declare-fun mapDefault!38726 () ValueCell!11672)

(assert (=> mapNonEmpty!38717 (= condMapEmpty!38726 (= mapRest!38717 ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38726)))))

(declare-fun e!589595 () Bool)

(declare-fun mapRes!38726 () Bool)

(assert (=> mapNonEmpty!38717 (= tp!74300 (and e!589595 mapRes!38726))))

(declare-fun mapIsEmpty!38726 () Bool)

(assert (=> mapIsEmpty!38726 mapRes!38726))

(declare-fun b!1041155 () Bool)

(declare-fun e!589596 () Bool)

(assert (=> b!1041155 (= e!589596 tp_is_empty!24751)))

(declare-fun mapNonEmpty!38726 () Bool)

(declare-fun tp!74316 () Bool)

(assert (=> mapNonEmpty!38726 (= mapRes!38726 (and tp!74316 e!589596))))

(declare-fun mapRest!38726 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapValue!38726 () ValueCell!11672)

(declare-fun mapKey!38726 () (_ BitVec 32))

(assert (=> mapNonEmpty!38726 (= mapRest!38717 (store mapRest!38726 mapKey!38726 mapValue!38726))))

(declare-fun b!1041156 () Bool)

(assert (=> b!1041156 (= e!589595 tp_is_empty!24751)))

(assert (= (and mapNonEmpty!38717 condMapEmpty!38726) mapIsEmpty!38726))

(assert (= (and mapNonEmpty!38717 (not condMapEmpty!38726)) mapNonEmpty!38726))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11672) mapValue!38726)) b!1041155))

(assert (= (and mapNonEmpty!38717 ((_ is ValueCellFull!11672) mapDefault!38726)) b!1041156))

(declare-fun m!960151 () Bool)

(assert (=> mapNonEmpty!38726 m!960151))

(check-sat (not b!1041060) tp_is_empty!24751 (not b!1041147) (not b!1041131) (not bm!44077) (not b!1041059) (not b!1041106) (not b!1041108) (not b!1041118) b_and!33537 (not b!1041148) (not b!1041081) (not d!125667) (not bm!44076) (not d!125659) (not d!125657) (not b!1041093) (not b!1041123) (not d!125661) (not b_next!21031) (not bm!44073) (not d!125665) (not b!1041090) (not b!1041105) (not b!1041145) (not b!1041075) (not b!1041058) (not b!1041129) (not bm!44080) (not mapNonEmpty!38726) (not b!1041096) (not d!125671))
(check-sat b_and!33537 (not b_next!21031))
(get-model)

(declare-fun b!1041175 () Bool)

(declare-fun lt!458757 () SeekEntryResult!9801)

(assert (=> b!1041175 (and (bvsge (index!41577 lt!458757) #b00000000000000000000000000000000) (bvslt (index!41577 lt!458757) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun res!694012 () Bool)

(assert (=> b!1041175 (= res!694012 (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41577 lt!458757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589609 () Bool)

(assert (=> b!1041175 (=> res!694012 e!589609)))

(declare-fun b!1041176 () Bool)

(declare-fun e!589611 () SeekEntryResult!9801)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041176 (= e!589611 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30364 thiss!1427)) #b00000000000000000000000000000000 (mask!30364 thiss!1427)) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041177 () Bool)

(declare-fun e!589610 () Bool)

(assert (=> b!1041177 (= e!589610 (bvsge (x!92943 lt!458757) #b01111111111111111111111111111110))))

(declare-fun d!125681 () Bool)

(assert (=> d!125681 e!589610))

(declare-fun c!105590 () Bool)

(assert (=> d!125681 (= c!105590 (and ((_ is Intermediate!9801) lt!458757) (undefined!10613 lt!458757)))))

(declare-fun e!589608 () SeekEntryResult!9801)

(assert (=> d!125681 (= lt!458757 e!589608)))

(declare-fun c!105592 () Bool)

(assert (=> d!125681 (= c!105592 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!458756 () (_ BitVec 64))

(assert (=> d!125681 (= lt!458756 (select (arr!31554 (_keys!11578 thiss!1427)) (toIndex!0 key!909 (mask!30364 thiss!1427))))))

(assert (=> d!125681 (validMask!0 (mask!30364 thiss!1427))))

(assert (=> d!125681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30364 thiss!1427)) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)) lt!458757)))

(declare-fun b!1041178 () Bool)

(assert (=> b!1041178 (= e!589608 e!589611)))

(declare-fun c!105591 () Bool)

(assert (=> b!1041178 (= c!105591 (or (= lt!458756 key!909) (= (bvadd lt!458756 lt!458756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041179 () Bool)

(assert (=> b!1041179 (= e!589608 (Intermediate!9801 true (toIndex!0 key!909 (mask!30364 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041180 () Bool)

(assert (=> b!1041180 (and (bvsge (index!41577 lt!458757) #b00000000000000000000000000000000) (bvslt (index!41577 lt!458757) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun res!694011 () Bool)

(assert (=> b!1041180 (= res!694011 (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41577 lt!458757)) key!909))))

(assert (=> b!1041180 (=> res!694011 e!589609)))

(declare-fun e!589607 () Bool)

(assert (=> b!1041180 (= e!589607 e!589609)))

(declare-fun b!1041181 () Bool)

(assert (=> b!1041181 (= e!589611 (Intermediate!9801 false (toIndex!0 key!909 (mask!30364 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041182 () Bool)

(assert (=> b!1041182 (= e!589610 e!589607)))

(declare-fun res!694010 () Bool)

(assert (=> b!1041182 (= res!694010 (and ((_ is Intermediate!9801) lt!458757) (not (undefined!10613 lt!458757)) (bvslt (x!92943 lt!458757) #b01111111111111111111111111111110) (bvsge (x!92943 lt!458757) #b00000000000000000000000000000000) (bvsge (x!92943 lt!458757) #b00000000000000000000000000000000)))))

(assert (=> b!1041182 (=> (not res!694010) (not e!589607))))

(declare-fun b!1041183 () Bool)

(assert (=> b!1041183 (and (bvsge (index!41577 lt!458757) #b00000000000000000000000000000000) (bvslt (index!41577 lt!458757) (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> b!1041183 (= e!589609 (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41577 lt!458757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125681 c!105592) b!1041179))

(assert (= (and d!125681 (not c!105592)) b!1041178))

(assert (= (and b!1041178 c!105591) b!1041181))

(assert (= (and b!1041178 (not c!105591)) b!1041176))

(assert (= (and d!125681 c!105590) b!1041177))

(assert (= (and d!125681 (not c!105590)) b!1041182))

(assert (= (and b!1041182 res!694010) b!1041180))

(assert (= (and b!1041180 (not res!694011)) b!1041175))

(assert (= (and b!1041175 (not res!694012)) b!1041183))

(declare-fun m!960153 () Bool)

(assert (=> b!1041175 m!960153))

(assert (=> b!1041176 m!960097))

(declare-fun m!960155 () Bool)

(assert (=> b!1041176 m!960155))

(assert (=> b!1041176 m!960155))

(declare-fun m!960157 () Bool)

(assert (=> b!1041176 m!960157))

(assert (=> d!125681 m!960097))

(declare-fun m!960159 () Bool)

(assert (=> d!125681 m!960159))

(assert (=> d!125681 m!960017))

(assert (=> b!1041180 m!960153))

(assert (=> b!1041183 m!960153))

(assert (=> d!125659 d!125681))

(declare-fun d!125683 () Bool)

(declare-fun lt!458763 () (_ BitVec 32))

(declare-fun lt!458762 () (_ BitVec 32))

(assert (=> d!125683 (= lt!458763 (bvmul (bvxor lt!458762 (bvlshr lt!458762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125683 (= lt!458762 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125683 (and (bvsge (mask!30364 thiss!1427) #b00000000000000000000000000000000) (let ((res!694013 (let ((h!23205 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92961 (bvmul (bvxor h!23205 (bvlshr h!23205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92961 (bvlshr x!92961 #b00000000000000000000000000001101)) (mask!30364 thiss!1427)))))) (and (bvslt res!694013 (bvadd (mask!30364 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694013 #b00000000000000000000000000000000))))))

(assert (=> d!125683 (= (toIndex!0 key!909 (mask!30364 thiss!1427)) (bvand (bvxor lt!458763 (bvlshr lt!458763 #b00000000000000000000000000001101)) (mask!30364 thiss!1427)))))

(assert (=> d!125659 d!125683))

(assert (=> d!125659 d!125673))

(declare-fun d!125685 () Bool)

(assert (=> d!125685 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1041106 d!125685))

(declare-fun d!125687 () Bool)

(declare-fun res!694014 () Bool)

(declare-fun e!589612 () Bool)

(assert (=> d!125687 (=> res!694014 e!589612)))

(assert (=> d!125687 (= res!694014 (= (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125687 (= (arrayContainsKey!0 lt!458676 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!589612)))

(declare-fun b!1041184 () Bool)

(declare-fun e!589613 () Bool)

(assert (=> b!1041184 (= e!589612 e!589613)))

(declare-fun res!694015 () Bool)

(assert (=> b!1041184 (=> (not res!694015) (not e!589613))))

(assert (=> b!1041184 (= res!694015 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32088 lt!458676)))))

(declare-fun b!1041185 () Bool)

(assert (=> b!1041185 (= e!589613 (arrayContainsKey!0 lt!458676 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125687 (not res!694014)) b!1041184))

(assert (= (and b!1041184 res!694015) b!1041185))

(declare-fun m!960161 () Bool)

(assert (=> d!125687 m!960161))

(declare-fun m!960163 () Bool)

(assert (=> b!1041185 m!960163))

(assert (=> b!1041129 d!125687))

(declare-fun d!125689 () Bool)

(declare-fun res!694016 () Bool)

(declare-fun e!589614 () Bool)

(assert (=> d!125689 (=> res!694016 e!589614)))

(assert (=> d!125689 (= res!694016 (= (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125689 (= (arrayContainsKey!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) key!909 #b00000000000000000000000000000000) e!589614)))

(declare-fun b!1041186 () Bool)

(declare-fun e!589615 () Bool)

(assert (=> b!1041186 (= e!589614 e!589615)))

(declare-fun res!694017 () Bool)

(assert (=> b!1041186 (=> (not res!694017) (not e!589615))))

(assert (=> b!1041186 (= res!694017 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))))))))

(declare-fun b!1041187 () Bool)

(assert (=> b!1041187 (= e!589615 (arrayContainsKey!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125689 (not res!694016)) b!1041186))

(assert (= (and b!1041186 res!694017) b!1041187))

(declare-fun m!960165 () Bool)

(assert (=> d!125689 m!960165))

(declare-fun m!960167 () Bool)

(assert (=> b!1041187 m!960167))

(assert (=> b!1041096 d!125689))

(declare-fun d!125691 () Bool)

(assert (=> d!125691 (arrayNoDuplicates!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 Nil!21998)))

(assert (=> d!125691 true))

(declare-fun _$66!50 () Unit!33911)

(assert (=> d!125691 (= (choose!53 (_keys!11578 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41576 lt!458677) #b00000000000000000000000000000000 Nil!21998) _$66!50)))

(declare-fun bs!30426 () Bool)

(assert (= bs!30426 d!125691))

(assert (=> bs!30426 m!960013))

(assert (=> bs!30426 m!960105))

(assert (=> d!125661 d!125691))

(declare-fun b!1041189 () Bool)

(declare-fun e!589617 () (_ BitVec 32))

(declare-fun e!589616 () (_ BitVec 32))

(assert (=> b!1041189 (= e!589617 e!589616)))

(declare-fun c!105594 () Bool)

(assert (=> b!1041189 (= c!105594 (validKeyInArray!0 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44081 () Bool)

(declare-fun call!44084 () (_ BitVec 32))

(assert (=> bm!44081 (= call!44084 (arrayCountValidKeys!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun d!125693 () Bool)

(declare-fun lt!458764 () (_ BitVec 32))

(assert (=> d!125693 (and (bvsge lt!458764 #b00000000000000000000000000000000) (bvsle lt!458764 (bvsub (size!32088 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125693 (= lt!458764 e!589617)))

(declare-fun c!105593 () Bool)

(assert (=> d!125693 (= c!105593 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125693 (and (bvsle #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11578 thiss!1427)) (size!32088 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))))))))

(assert (=> d!125693 (= (arrayCountValidKeys!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) lt!458764)))

(declare-fun b!1041188 () Bool)

(assert (=> b!1041188 (= e!589617 #b00000000000000000000000000000000)))

(declare-fun b!1041190 () Bool)

(assert (=> b!1041190 (= e!589616 call!44084)))

(declare-fun b!1041191 () Bool)

(assert (=> b!1041191 (= e!589616 (bvadd #b00000000000000000000000000000001 call!44084))))

(assert (= (and d!125693 c!105593) b!1041188))

(assert (= (and d!125693 (not c!105593)) b!1041189))

(assert (= (and b!1041189 c!105594) b!1041191))

(assert (= (and b!1041189 (not c!105594)) b!1041190))

(assert (= (or b!1041191 b!1041190) bm!44081))

(assert (=> b!1041189 m!960165))

(assert (=> b!1041189 m!960165))

(declare-fun m!960169 () Bool)

(assert (=> b!1041189 m!960169))

(declare-fun m!960171 () Bool)

(assert (=> bm!44081 m!960171))

(assert (=> b!1041108 d!125693))

(assert (=> b!1041108 d!125677))

(declare-fun d!125695 () Bool)

(assert (=> d!125695 (= (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677))) (and (not (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041105 d!125695))

(declare-fun b!1041192 () Bool)

(declare-fun e!589620 () Bool)

(declare-fun call!44085 () Bool)

(assert (=> b!1041192 (= e!589620 call!44085)))

(declare-fun b!1041193 () Bool)

(declare-fun e!589618 () Bool)

(assert (=> b!1041193 (= e!589618 (contains!6033 Nil!21998 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041194 () Bool)

(assert (=> b!1041194 (= e!589620 call!44085)))

(declare-fun b!1041195 () Bool)

(declare-fun e!589619 () Bool)

(declare-fun e!589621 () Bool)

(assert (=> b!1041195 (= e!589619 e!589621)))

(declare-fun res!694018 () Bool)

(assert (=> b!1041195 (=> (not res!694018) (not e!589621))))

(assert (=> b!1041195 (= res!694018 (not e!589618))))

(declare-fun res!694019 () Bool)

(assert (=> b!1041195 (=> (not res!694019) (not e!589618))))

(assert (=> b!1041195 (= res!694019 (validKeyInArray!0 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125697 () Bool)

(declare-fun res!694020 () Bool)

(assert (=> d!125697 (=> res!694020 e!589619)))

(assert (=> d!125697 (= res!694020 (bvsge #b00000000000000000000000000000000 (size!32088 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))))))))

(assert (=> d!125697 (= (arrayNoDuplicates!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 Nil!21998) e!589619)))

(declare-fun b!1041196 () Bool)

(assert (=> b!1041196 (= e!589621 e!589620)))

(declare-fun c!105595 () Bool)

(assert (=> b!1041196 (= c!105595 (validKeyInArray!0 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44082 () Bool)

(assert (=> bm!44082 (= call!44085 (arrayNoDuplicates!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105595 (Cons!21997 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000) Nil!21998) Nil!21998)))))

(assert (= (and d!125697 (not res!694020)) b!1041195))

(assert (= (and b!1041195 res!694019) b!1041193))

(assert (= (and b!1041195 res!694018) b!1041196))

(assert (= (and b!1041196 c!105595) b!1041194))

(assert (= (and b!1041196 (not c!105595)) b!1041192))

(assert (= (or b!1041194 b!1041192) bm!44082))

(assert (=> b!1041193 m!960165))

(assert (=> b!1041193 m!960165))

(declare-fun m!960173 () Bool)

(assert (=> b!1041193 m!960173))

(assert (=> b!1041195 m!960165))

(assert (=> b!1041195 m!960165))

(assert (=> b!1041195 m!960169))

(assert (=> b!1041196 m!960165))

(assert (=> b!1041196 m!960165))

(assert (=> b!1041196 m!960169))

(assert (=> bm!44082 m!960165))

(declare-fun m!960175 () Bool)

(assert (=> bm!44082 m!960175))

(assert (=> b!1041081 d!125697))

(declare-fun b!1041207 () Bool)

(declare-fun res!694029 () Bool)

(declare-fun e!589624 () Bool)

(assert (=> b!1041207 (=> (not res!694029) (not e!589624))))

(declare-fun size!32094 (LongMapFixedSize!5938) (_ BitVec 32))

(assert (=> b!1041207 (= res!694029 (= (size!32094 thiss!1427) (bvadd (_size!3024 thiss!1427) (bvsdiv (bvadd (extraKeys!6079 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!125699 () Bool)

(declare-fun res!694032 () Bool)

(assert (=> d!125699 (=> (not res!694032) (not e!589624))))

(assert (=> d!125699 (= res!694032 (validMask!0 (mask!30364 thiss!1427)))))

(assert (=> d!125699 (= (simpleValid!437 thiss!1427) e!589624)))

(declare-fun b!1041206 () Bool)

(declare-fun res!694030 () Bool)

(assert (=> b!1041206 (=> (not res!694030) (not e!589624))))

(assert (=> b!1041206 (= res!694030 (bvsge (size!32094 thiss!1427) (_size!3024 thiss!1427)))))

(declare-fun b!1041205 () Bool)

(declare-fun res!694031 () Bool)

(assert (=> b!1041205 (=> (not res!694031) (not e!589624))))

(assert (=> b!1041205 (= res!694031 (and (= (size!32089 (_values!6374 thiss!1427)) (bvadd (mask!30364 thiss!1427) #b00000000000000000000000000000001)) (= (size!32088 (_keys!11578 thiss!1427)) (size!32089 (_values!6374 thiss!1427))) (bvsge (_size!3024 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3024 thiss!1427) (bvadd (mask!30364 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1041208 () Bool)

(assert (=> b!1041208 (= e!589624 (and (bvsge (extraKeys!6079 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6079 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3024 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!125699 res!694032) b!1041205))

(assert (= (and b!1041205 res!694031) b!1041206))

(assert (= (and b!1041206 res!694030) b!1041207))

(assert (= (and b!1041207 res!694029) b!1041208))

(declare-fun m!960177 () Bool)

(assert (=> b!1041207 m!960177))

(assert (=> d!125699 m!960017))

(assert (=> b!1041206 m!960177))

(assert (=> d!125657 d!125699))

(assert (=> b!1041058 d!125677))

(declare-fun bm!44083 () Bool)

(declare-fun call!44086 () Bool)

(assert (=> bm!44083 (= call!44086 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041210 () Bool)

(declare-fun e!589627 () Bool)

(assert (=> b!1041210 (= e!589627 call!44086)))

(declare-fun b!1041211 () Bool)

(declare-fun e!589625 () Bool)

(assert (=> b!1041211 (= e!589625 call!44086)))

(declare-fun b!1041212 () Bool)

(declare-fun e!589626 () Bool)

(assert (=> b!1041212 (= e!589626 e!589627)))

(declare-fun c!105596 () Bool)

(assert (=> b!1041212 (= c!105596 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125701 () Bool)

(declare-fun res!694034 () Bool)

(assert (=> d!125701 (=> res!694034 e!589626)))

(assert (=> d!125701 (= res!694034 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)) e!589626)))

(declare-fun b!1041209 () Bool)

(assert (=> b!1041209 (= e!589627 e!589625)))

(declare-fun lt!458765 () (_ BitVec 64))

(assert (=> b!1041209 (= lt!458765 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458766 () Unit!33911)

(assert (=> b!1041209 (= lt!458766 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11578 thiss!1427) lt!458765 #b00000000000000000000000000000000))))

(assert (=> b!1041209 (arrayContainsKey!0 (_keys!11578 thiss!1427) lt!458765 #b00000000000000000000000000000000)))

(declare-fun lt!458767 () Unit!33911)

(assert (=> b!1041209 (= lt!458767 lt!458766)))

(declare-fun res!694033 () Bool)

(assert (=> b!1041209 (= res!694033 (= (seekEntryOrOpen!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000) (_keys!11578 thiss!1427) (mask!30364 thiss!1427)) (Found!9801 #b00000000000000000000000000000000)))))

(assert (=> b!1041209 (=> (not res!694033) (not e!589625))))

(assert (= (and d!125701 (not res!694034)) b!1041212))

(assert (= (and b!1041212 c!105596) b!1041209))

(assert (= (and b!1041212 (not c!105596)) b!1041210))

(assert (= (and b!1041209 res!694033) b!1041211))

(assert (= (or b!1041211 b!1041210) bm!44083))

(declare-fun m!960179 () Bool)

(assert (=> bm!44083 m!960179))

(assert (=> b!1041212 m!960141))

(assert (=> b!1041212 m!960141))

(assert (=> b!1041212 m!960143))

(assert (=> b!1041209 m!960141))

(declare-fun m!960181 () Bool)

(assert (=> b!1041209 m!960181))

(declare-fun m!960183 () Bool)

(assert (=> b!1041209 m!960183))

(assert (=> b!1041209 m!960141))

(declare-fun m!960185 () Bool)

(assert (=> b!1041209 m!960185))

(assert (=> b!1041059 d!125701))

(declare-fun d!125703 () Bool)

(assert (=> d!125703 (= (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041131 d!125703))

(declare-fun d!125705 () Bool)

(assert (=> d!125705 (= (validKeyInArray!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)) (and (not (= (select (arr!31554 lt!458676) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31554 lt!458676) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041093 d!125705))

(declare-fun b!1041213 () Bool)

(declare-fun e!589630 () Bool)

(declare-fun call!44087 () Bool)

(assert (=> b!1041213 (= e!589630 call!44087)))

(declare-fun b!1041214 () Bool)

(declare-fun e!589628 () Bool)

(assert (=> b!1041214 (= e!589628 (contains!6033 Nil!21998 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041215 () Bool)

(assert (=> b!1041215 (= e!589630 call!44087)))

(declare-fun b!1041216 () Bool)

(declare-fun e!589629 () Bool)

(declare-fun e!589631 () Bool)

(assert (=> b!1041216 (= e!589629 e!589631)))

(declare-fun res!694035 () Bool)

(assert (=> b!1041216 (=> (not res!694035) (not e!589631))))

(assert (=> b!1041216 (= res!694035 (not e!589628))))

(declare-fun res!694036 () Bool)

(assert (=> b!1041216 (=> (not res!694036) (not e!589628))))

(assert (=> b!1041216 (= res!694036 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125707 () Bool)

(declare-fun res!694037 () Bool)

(assert (=> d!125707 (=> res!694037 e!589629)))

(assert (=> d!125707 (= res!694037 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125707 (= (arrayNoDuplicates!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 Nil!21998) e!589629)))

(declare-fun b!1041217 () Bool)

(assert (=> b!1041217 (= e!589631 e!589630)))

(declare-fun c!105597 () Bool)

(assert (=> b!1041217 (= c!105597 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44084 () Bool)

(assert (=> bm!44084 (= call!44087 (arrayNoDuplicates!0 (_keys!11578 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105597 (Cons!21997 (select (arr!31554 (_keys!11578 thiss!1427)) #b00000000000000000000000000000000) Nil!21998) Nil!21998)))))

(assert (= (and d!125707 (not res!694037)) b!1041216))

(assert (= (and b!1041216 res!694036) b!1041214))

(assert (= (and b!1041216 res!694035) b!1041217))

(assert (= (and b!1041217 c!105597) b!1041215))

(assert (= (and b!1041217 (not c!105597)) b!1041213))

(assert (= (or b!1041215 b!1041213) bm!44084))

(assert (=> b!1041214 m!960141))

(assert (=> b!1041214 m!960141))

(declare-fun m!960187 () Bool)

(assert (=> b!1041214 m!960187))

(assert (=> b!1041216 m!960141))

(assert (=> b!1041216 m!960141))

(assert (=> b!1041216 m!960143))

(assert (=> b!1041217 m!960141))

(assert (=> b!1041217 m!960141))

(assert (=> b!1041217 m!960143))

(assert (=> bm!44084 m!960141))

(declare-fun m!960189 () Bool)

(assert (=> bm!44084 m!960189))

(assert (=> b!1041060 d!125707))

(declare-fun b!1041219 () Bool)

(declare-fun e!589633 () (_ BitVec 32))

(declare-fun e!589632 () (_ BitVec 32))

(assert (=> b!1041219 (= e!589633 e!589632)))

(declare-fun c!105599 () Bool)

(assert (=> b!1041219 (= c!105599 (validKeyInArray!0 (select (arr!31554 (_keys!11578 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44085 () Bool)

(declare-fun call!44088 () (_ BitVec 32))

(assert (=> bm!44085 (= call!44088 (arrayCountValidKeys!0 (_keys!11578 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun d!125709 () Bool)

(declare-fun lt!458768 () (_ BitVec 32))

(assert (=> d!125709 (and (bvsge lt!458768 #b00000000000000000000000000000000) (bvsle lt!458768 (bvsub (size!32088 (_keys!11578 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125709 (= lt!458768 e!589633)))

(declare-fun c!105598 () Bool)

(assert (=> d!125709 (= c!105598 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125709 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11578 thiss!1427)) (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125709 (= (arrayCountValidKeys!0 (_keys!11578 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))) lt!458768)))

(declare-fun b!1041218 () Bool)

(assert (=> b!1041218 (= e!589633 #b00000000000000000000000000000000)))

(declare-fun b!1041220 () Bool)

(assert (=> b!1041220 (= e!589632 call!44088)))

(declare-fun b!1041221 () Bool)

(assert (=> b!1041221 (= e!589632 (bvadd #b00000000000000000000000000000001 call!44088))))

(assert (= (and d!125709 c!105598) b!1041218))

(assert (= (and d!125709 (not c!105598)) b!1041219))

(assert (= (and b!1041219 c!105599) b!1041221))

(assert (= (and b!1041219 (not c!105599)) b!1041220))

(assert (= (or b!1041221 b!1041220) bm!44085))

(declare-fun m!960191 () Bool)

(assert (=> b!1041219 m!960191))

(assert (=> b!1041219 m!960191))

(declare-fun m!960193 () Bool)

(assert (=> b!1041219 m!960193))

(declare-fun m!960195 () Bool)

(assert (=> bm!44085 m!960195))

(assert (=> bm!44077 d!125709))

(declare-fun d!125711 () Bool)

(assert (=> d!125711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (mask!30364 thiss!1427))))

(assert (=> d!125711 true))

(declare-fun _$44!24 () Unit!33911)

(assert (=> d!125711 (= (choose!25 (_keys!11578 thiss!1427) (index!41576 lt!458677) (mask!30364 thiss!1427)) _$44!24)))

(declare-fun bs!30427 () Bool)

(assert (= bs!30427 d!125711))

(assert (=> bs!30427 m!960013))

(assert (=> bs!30427 m!960137))

(assert (=> d!125671 d!125711))

(assert (=> d!125671 d!125673))

(declare-fun d!125713 () Bool)

(assert (=> d!125713 (not (arrayContainsKey!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125713 true))

(declare-fun _$59!26 () Unit!33911)

(assert (=> d!125713 (= (choose!121 (_keys!11578 thiss!1427) (index!41576 lt!458677) key!909) _$59!26)))

(declare-fun bs!30428 () Bool)

(assert (= bs!30428 d!125713))

(assert (=> bs!30428 m!960013))

(assert (=> bs!30428 m!960121))

(assert (=> d!125665 d!125713))

(declare-fun d!125715 () Bool)

(declare-fun lt!458771 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!521 (List!22001) (InoxSet (_ BitVec 64)))

(assert (=> d!125715 (= lt!458771 (select (content!521 Nil!21998) (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun e!589639 () Bool)

(assert (=> d!125715 (= lt!458771 e!589639)))

(declare-fun res!694043 () Bool)

(assert (=> d!125715 (=> (not res!694043) (not e!589639))))

(assert (=> d!125715 (= res!694043 ((_ is Cons!21997) Nil!21998))))

(assert (=> d!125715 (= (contains!6033 Nil!21998 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)) lt!458771)))

(declare-fun b!1041226 () Bool)

(declare-fun e!589638 () Bool)

(assert (=> b!1041226 (= e!589639 e!589638)))

(declare-fun res!694042 () Bool)

(assert (=> b!1041226 (=> res!694042 e!589638)))

(assert (=> b!1041226 (= res!694042 (= (h!23202 Nil!21998) (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun b!1041227 () Bool)

(assert (=> b!1041227 (= e!589638 (contains!6033 (t!31206 Nil!21998) (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(assert (= (and d!125715 res!694043) b!1041226))

(assert (= (and b!1041226 (not res!694042)) b!1041227))

(declare-fun m!960197 () Bool)

(assert (=> d!125715 m!960197))

(assert (=> d!125715 m!960109))

(declare-fun m!960199 () Bool)

(assert (=> d!125715 m!960199))

(assert (=> b!1041227 m!960109))

(declare-fun m!960201 () Bool)

(assert (=> b!1041227 m!960201))

(assert (=> b!1041145 d!125715))

(assert (=> b!1041118 d!125705))

(declare-fun d!125717 () Bool)

(assert (=> d!125717 (= (arrayCountValidKeys!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11578 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11578 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125717 true))

(declare-fun _$79!26 () Unit!33911)

(assert (=> d!125717 (= (choose!82 (_keys!11578 thiss!1427) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!26)))

(declare-fun bs!30429 () Bool)

(assert (= bs!30429 d!125717))

(assert (=> bs!30429 m!960013))

(assert (=> bs!30429 m!960125))

(assert (=> bs!30429 m!960019))

(assert (=> d!125667 d!125717))

(assert (=> b!1041147 d!125705))

(declare-fun b!1041229 () Bool)

(declare-fun e!589641 () (_ BitVec 32))

(declare-fun e!589640 () (_ BitVec 32))

(assert (=> b!1041229 (= e!589641 e!589640)))

(declare-fun c!105601 () Bool)

(assert (=> b!1041229 (= c!105601 (validKeyInArray!0 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44086 () Bool)

(declare-fun call!44089 () (_ BitVec 32))

(assert (=> bm!44086 (= call!44089 (arrayCountValidKeys!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(declare-fun d!125719 () Bool)

(declare-fun lt!458772 () (_ BitVec 32))

(assert (=> d!125719 (and (bvsge lt!458772 #b00000000000000000000000000000000) (bvsle lt!458772 (bvsub (size!32088 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125719 (= lt!458772 e!589641)))

(declare-fun c!105600 () Bool)

(assert (=> d!125719 (= c!105600 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))))))

(assert (=> d!125719 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11578 thiss!1427)) (size!32088 lt!458676)))))

(assert (=> d!125719 (= (arrayCountValidKeys!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11578 thiss!1427))) lt!458772)))

(declare-fun b!1041228 () Bool)

(assert (=> b!1041228 (= e!589641 #b00000000000000000000000000000000)))

(declare-fun b!1041230 () Bool)

(assert (=> b!1041230 (= e!589640 call!44089)))

(declare-fun b!1041231 () Bool)

(assert (=> b!1041231 (= e!589640 (bvadd #b00000000000000000000000000000001 call!44089))))

(assert (= (and d!125719 c!105600) b!1041228))

(assert (= (and d!125719 (not c!105600)) b!1041229))

(assert (= (and b!1041229 c!105601) b!1041231))

(assert (= (and b!1041229 (not c!105601)) b!1041230))

(assert (= (or b!1041231 b!1041230) bm!44086))

(assert (=> b!1041229 m!960161))

(assert (=> b!1041229 m!960161))

(declare-fun m!960203 () Bool)

(assert (=> b!1041229 m!960203))

(declare-fun m!960205 () Bool)

(assert (=> bm!44086 m!960205))

(assert (=> bm!44076 d!125719))

(declare-fun b!1041244 () Bool)

(declare-fun e!589648 () SeekEntryResult!9801)

(assert (=> b!1041244 (= e!589648 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92943 lt!458725) #b00000000000000000000000000000001) (nextIndex!0 (index!41577 lt!458725) (x!92943 lt!458725) (mask!30364 thiss!1427)) (index!41577 lt!458725) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)))))

(declare-fun b!1041245 () Bool)

(assert (=> b!1041245 (= e!589648 (MissingVacant!9801 (index!41577 lt!458725)))))

(declare-fun b!1041246 () Bool)

(declare-fun e!589649 () SeekEntryResult!9801)

(assert (=> b!1041246 (= e!589649 Undefined!9801)))

(declare-fun b!1041247 () Bool)

(declare-fun c!105608 () Bool)

(declare-fun lt!458778 () (_ BitVec 64))

(assert (=> b!1041247 (= c!105608 (= lt!458778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589650 () SeekEntryResult!9801)

(assert (=> b!1041247 (= e!589650 e!589648)))

(declare-fun lt!458777 () SeekEntryResult!9801)

(declare-fun d!125721 () Bool)

(assert (=> d!125721 (and (or ((_ is Undefined!9801) lt!458777) (not ((_ is Found!9801) lt!458777)) (and (bvsge (index!41576 lt!458777) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458777) (size!32088 (_keys!11578 thiss!1427))))) (or ((_ is Undefined!9801) lt!458777) ((_ is Found!9801) lt!458777) (not ((_ is MissingVacant!9801) lt!458777)) (not (= (index!41578 lt!458777) (index!41577 lt!458725))) (and (bvsge (index!41578 lt!458777) #b00000000000000000000000000000000) (bvslt (index!41578 lt!458777) (size!32088 (_keys!11578 thiss!1427))))) (or ((_ is Undefined!9801) lt!458777) (ite ((_ is Found!9801) lt!458777) (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458777)) key!909) (and ((_ is MissingVacant!9801) lt!458777) (= (index!41578 lt!458777) (index!41577 lt!458725)) (= (select (arr!31554 (_keys!11578 thiss!1427)) (index!41578 lt!458777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125721 (= lt!458777 e!589649)))

(declare-fun c!105609 () Bool)

(assert (=> d!125721 (= c!105609 (bvsge (x!92943 lt!458725) #b01111111111111111111111111111110))))

(assert (=> d!125721 (= lt!458778 (select (arr!31554 (_keys!11578 thiss!1427)) (index!41577 lt!458725)))))

(assert (=> d!125721 (validMask!0 (mask!30364 thiss!1427))))

(assert (=> d!125721 (= (seekKeyOrZeroReturnVacant!0 (x!92943 lt!458725) (index!41577 lt!458725) (index!41577 lt!458725) key!909 (_keys!11578 thiss!1427) (mask!30364 thiss!1427)) lt!458777)))

(declare-fun b!1041248 () Bool)

(assert (=> b!1041248 (= e!589650 (Found!9801 (index!41577 lt!458725)))))

(declare-fun b!1041249 () Bool)

(assert (=> b!1041249 (= e!589649 e!589650)))

(declare-fun c!105610 () Bool)

(assert (=> b!1041249 (= c!105610 (= lt!458778 key!909))))

(assert (= (and d!125721 c!105609) b!1041246))

(assert (= (and d!125721 (not c!105609)) b!1041249))

(assert (= (and b!1041249 c!105610) b!1041248))

(assert (= (and b!1041249 (not c!105610)) b!1041247))

(assert (= (and b!1041247 c!105608) b!1041245))

(assert (= (and b!1041247 (not c!105608)) b!1041244))

(declare-fun m!960207 () Bool)

(assert (=> b!1041244 m!960207))

(assert (=> b!1041244 m!960207))

(declare-fun m!960209 () Bool)

(assert (=> b!1041244 m!960209))

(declare-fun m!960211 () Bool)

(assert (=> d!125721 m!960211))

(declare-fun m!960213 () Bool)

(assert (=> d!125721 m!960213))

(assert (=> d!125721 m!960093))

(assert (=> d!125721 m!960017))

(assert (=> b!1041075 d!125721))

(assert (=> b!1041148 d!125705))

(declare-fun d!125723 () Bool)

(assert (=> d!125723 (arrayContainsKey!0 lt!458676 lt!458736 #b00000000000000000000000000000000)))

(declare-fun lt!458781 () Unit!33911)

(declare-fun choose!13 (array!65585 (_ BitVec 64) (_ BitVec 32)) Unit!33911)

(assert (=> d!125723 (= lt!458781 (choose!13 lt!458676 lt!458736 #b00000000000000000000000000000000))))

(assert (=> d!125723 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125723 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458676 lt!458736 #b00000000000000000000000000000000) lt!458781)))

(declare-fun bs!30430 () Bool)

(assert (= bs!30430 d!125723))

(assert (=> bs!30430 m!960115))

(declare-fun m!960215 () Bool)

(assert (=> bs!30430 m!960215))

(assert (=> b!1041090 d!125723))

(declare-fun d!125725 () Bool)

(declare-fun res!694044 () Bool)

(declare-fun e!589651 () Bool)

(assert (=> d!125725 (=> res!694044 e!589651)))

(assert (=> d!125725 (= res!694044 (= (select (arr!31554 lt!458676) #b00000000000000000000000000000000) lt!458736))))

(assert (=> d!125725 (= (arrayContainsKey!0 lt!458676 lt!458736 #b00000000000000000000000000000000) e!589651)))

(declare-fun b!1041250 () Bool)

(declare-fun e!589652 () Bool)

(assert (=> b!1041250 (= e!589651 e!589652)))

(declare-fun res!694045 () Bool)

(assert (=> b!1041250 (=> (not res!694045) (not e!589652))))

(assert (=> b!1041250 (= res!694045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 lt!458676)))))

(declare-fun b!1041251 () Bool)

(assert (=> b!1041251 (= e!589652 (arrayContainsKey!0 lt!458676 lt!458736 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125725 (not res!694044)) b!1041250))

(assert (= (and b!1041250 res!694045) b!1041251))

(assert (=> d!125725 m!960109))

(declare-fun m!960217 () Bool)

(assert (=> b!1041251 m!960217))

(assert (=> b!1041090 d!125725))

(declare-fun b!1041264 () Bool)

(declare-fun e!589660 () SeekEntryResult!9801)

(assert (=> b!1041264 (= e!589660 Undefined!9801)))

(declare-fun b!1041265 () Bool)

(declare-fun lt!458788 () SeekEntryResult!9801)

(declare-fun e!589659 () SeekEntryResult!9801)

(assert (=> b!1041265 (= e!589659 (seekKeyOrZeroReturnVacant!0 (x!92943 lt!458788) (index!41577 lt!458788) (index!41577 lt!458788) (select (arr!31554 lt!458676) #b00000000000000000000000000000000) lt!458676 (mask!30364 thiss!1427)))))

(declare-fun b!1041266 () Bool)

(declare-fun c!105618 () Bool)

(declare-fun lt!458789 () (_ BitVec 64))

(assert (=> b!1041266 (= c!105618 (= lt!458789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589661 () SeekEntryResult!9801)

(assert (=> b!1041266 (= e!589661 e!589659)))

(declare-fun b!1041267 () Bool)

(assert (=> b!1041267 (= e!589661 (Found!9801 (index!41577 lt!458788)))))

(declare-fun b!1041268 () Bool)

(assert (=> b!1041268 (= e!589660 e!589661)))

(assert (=> b!1041268 (= lt!458789 (select (arr!31554 lt!458676) (index!41577 lt!458788)))))

(declare-fun c!105619 () Bool)

(assert (=> b!1041268 (= c!105619 (= lt!458789 (select (arr!31554 lt!458676) #b00000000000000000000000000000000)))))

(declare-fun b!1041269 () Bool)

(assert (=> b!1041269 (= e!589659 (MissingZero!9801 (index!41577 lt!458788)))))

(declare-fun d!125727 () Bool)

(declare-fun lt!458790 () SeekEntryResult!9801)

(assert (=> d!125727 (and (or ((_ is Undefined!9801) lt!458790) (not ((_ is Found!9801) lt!458790)) (and (bvsge (index!41576 lt!458790) #b00000000000000000000000000000000) (bvslt (index!41576 lt!458790) (size!32088 lt!458676)))) (or ((_ is Undefined!9801) lt!458790) ((_ is Found!9801) lt!458790) (not ((_ is MissingZero!9801) lt!458790)) (and (bvsge (index!41575 lt!458790) #b00000000000000000000000000000000) (bvslt (index!41575 lt!458790) (size!32088 lt!458676)))) (or ((_ is Undefined!9801) lt!458790) ((_ is Found!9801) lt!458790) ((_ is MissingZero!9801) lt!458790) (not ((_ is MissingVacant!9801) lt!458790)) (and (bvsge (index!41578 lt!458790) #b00000000000000000000000000000000) (bvslt (index!41578 lt!458790) (size!32088 lt!458676)))) (or ((_ is Undefined!9801) lt!458790) (ite ((_ is Found!9801) lt!458790) (= (select (arr!31554 lt!458676) (index!41576 lt!458790)) (select (arr!31554 lt!458676) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9801) lt!458790) (= (select (arr!31554 lt!458676) (index!41575 lt!458790)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9801) lt!458790) (= (select (arr!31554 lt!458676) (index!41578 lt!458790)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125727 (= lt!458790 e!589660)))

(declare-fun c!105617 () Bool)

(assert (=> d!125727 (= c!105617 (and ((_ is Intermediate!9801) lt!458788) (undefined!10613 lt!458788)))))

(assert (=> d!125727 (= lt!458788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) (mask!30364 thiss!1427)) (select (arr!31554 lt!458676) #b00000000000000000000000000000000) lt!458676 (mask!30364 thiss!1427)))))

(assert (=> d!125727 (validMask!0 (mask!30364 thiss!1427))))

(assert (=> d!125727 (= (seekEntryOrOpen!0 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) lt!458676 (mask!30364 thiss!1427)) lt!458790)))

(assert (= (and d!125727 c!105617) b!1041264))

(assert (= (and d!125727 (not c!105617)) b!1041268))

(assert (= (and b!1041268 c!105619) b!1041267))

(assert (= (and b!1041268 (not c!105619)) b!1041266))

(assert (= (and b!1041266 c!105618) b!1041269))

(assert (= (and b!1041266 (not c!105618)) b!1041265))

(assert (=> b!1041265 m!960109))

(declare-fun m!960219 () Bool)

(assert (=> b!1041265 m!960219))

(declare-fun m!960221 () Bool)

(assert (=> b!1041268 m!960221))

(declare-fun m!960223 () Bool)

(assert (=> d!125727 m!960223))

(assert (=> d!125727 m!960109))

(declare-fun m!960225 () Bool)

(assert (=> d!125727 m!960225))

(declare-fun m!960227 () Bool)

(assert (=> d!125727 m!960227))

(declare-fun m!960229 () Bool)

(assert (=> d!125727 m!960229))

(assert (=> d!125727 m!960109))

(assert (=> d!125727 m!960223))

(assert (=> d!125727 m!960017))

(declare-fun m!960231 () Bool)

(assert (=> d!125727 m!960231))

(assert (=> b!1041090 d!125727))

(declare-fun bm!44087 () Bool)

(declare-fun call!44090 () Bool)

(assert (=> bm!44087 (= call!44090 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (mask!30364 thiss!1427)))))

(declare-fun b!1041271 () Bool)

(declare-fun e!589664 () Bool)

(assert (=> b!1041271 (= e!589664 call!44090)))

(declare-fun b!1041272 () Bool)

(declare-fun e!589662 () Bool)

(assert (=> b!1041272 (= e!589662 call!44090)))

(declare-fun b!1041273 () Bool)

(declare-fun e!589663 () Bool)

(assert (=> b!1041273 (= e!589663 e!589664)))

(declare-fun c!105620 () Bool)

(assert (=> b!1041273 (= c!105620 (validKeyInArray!0 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125729 () Bool)

(declare-fun res!694047 () Bool)

(assert (=> d!125729 (=> res!694047 e!589663)))

(assert (=> d!125729 (= res!694047 (bvsge #b00000000000000000000000000000000 (size!32088 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))))))))

(assert (=> d!125729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (mask!30364 thiss!1427)) e!589663)))

(declare-fun b!1041270 () Bool)

(assert (=> b!1041270 (= e!589664 e!589662)))

(declare-fun lt!458791 () (_ BitVec 64))

(assert (=> b!1041270 (= lt!458791 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!458792 () Unit!33911)

(assert (=> b!1041270 (= lt!458792 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) lt!458791 #b00000000000000000000000000000000))))

(assert (=> b!1041270 (arrayContainsKey!0 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) lt!458791 #b00000000000000000000000000000000)))

(declare-fun lt!458793 () Unit!33911)

(assert (=> b!1041270 (= lt!458793 lt!458792)))

(declare-fun res!694046 () Bool)

(assert (=> b!1041270 (= res!694046 (= (seekEntryOrOpen!0 (select (arr!31554 (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427)))) #b00000000000000000000000000000000) (array!65586 (store (arr!31554 (_keys!11578 thiss!1427)) (index!41576 lt!458677) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11578 thiss!1427))) (mask!30364 thiss!1427)) (Found!9801 #b00000000000000000000000000000000)))))

(assert (=> b!1041270 (=> (not res!694046) (not e!589662))))

(assert (= (and d!125729 (not res!694047)) b!1041273))

(assert (= (and b!1041273 c!105620) b!1041270))

(assert (= (and b!1041273 (not c!105620)) b!1041271))

(assert (= (and b!1041270 res!694046) b!1041272))

(assert (= (or b!1041272 b!1041271) bm!44087))

(declare-fun m!960233 () Bool)

(assert (=> bm!44087 m!960233))

(assert (=> b!1041273 m!960165))

(assert (=> b!1041273 m!960165))

(assert (=> b!1041273 m!960169))

(assert (=> b!1041270 m!960165))

(declare-fun m!960235 () Bool)

(assert (=> b!1041270 m!960235))

(declare-fun m!960237 () Bool)

(assert (=> b!1041270 m!960237))

(assert (=> b!1041270 m!960165))

(declare-fun m!960239 () Bool)

(assert (=> b!1041270 m!960239))

(assert (=> b!1041123 d!125729))

(declare-fun b!1041274 () Bool)

(declare-fun e!589667 () Bool)

(declare-fun call!44091 () Bool)

(assert (=> b!1041274 (= e!589667 call!44091)))

(declare-fun b!1041275 () Bool)

(declare-fun e!589665 () Bool)

(assert (=> b!1041275 (= e!589665 (contains!6033 (ite c!105583 (Cons!21997 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) Nil!21998) Nil!21998) (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041276 () Bool)

(assert (=> b!1041276 (= e!589667 call!44091)))

(declare-fun b!1041277 () Bool)

(declare-fun e!589666 () Bool)

(declare-fun e!589668 () Bool)

(assert (=> b!1041277 (= e!589666 e!589668)))

(declare-fun res!694048 () Bool)

(assert (=> b!1041277 (=> (not res!694048) (not e!589668))))

(assert (=> b!1041277 (= res!694048 (not e!589665))))

(declare-fun res!694049 () Bool)

(assert (=> b!1041277 (=> (not res!694049) (not e!589665))))

(assert (=> b!1041277 (= res!694049 (validKeyInArray!0 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125731 () Bool)

(declare-fun res!694050 () Bool)

(assert (=> d!125731 (=> res!694050 e!589666)))

(assert (=> d!125731 (= res!694050 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 lt!458676)))))

(assert (=> d!125731 (= (arrayNoDuplicates!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105583 (Cons!21997 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) Nil!21998) Nil!21998)) e!589666)))

(declare-fun b!1041278 () Bool)

(assert (=> b!1041278 (= e!589668 e!589667)))

(declare-fun c!105621 () Bool)

(assert (=> b!1041278 (= c!105621 (validKeyInArray!0 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44088 () Bool)

(assert (=> bm!44088 (= call!44091 (arrayNoDuplicates!0 lt!458676 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105621 (Cons!21997 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105583 (Cons!21997 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) Nil!21998) Nil!21998)) (ite c!105583 (Cons!21997 (select (arr!31554 lt!458676) #b00000000000000000000000000000000) Nil!21998) Nil!21998))))))

(assert (= (and d!125731 (not res!694050)) b!1041277))

(assert (= (and b!1041277 res!694049) b!1041275))

(assert (= (and b!1041277 res!694048) b!1041278))

(assert (= (and b!1041278 c!105621) b!1041276))

(assert (= (and b!1041278 (not c!105621)) b!1041274))

(assert (= (or b!1041276 b!1041274) bm!44088))

(assert (=> b!1041275 m!960161))

(assert (=> b!1041275 m!960161))

(declare-fun m!960241 () Bool)

(assert (=> b!1041275 m!960241))

(assert (=> b!1041277 m!960161))

(assert (=> b!1041277 m!960161))

(assert (=> b!1041277 m!960203))

(assert (=> b!1041278 m!960161))

(assert (=> b!1041278 m!960161))

(assert (=> b!1041278 m!960203))

(assert (=> bm!44088 m!960161))

(declare-fun m!960243 () Bool)

(assert (=> bm!44088 m!960243))

(assert (=> bm!44080 d!125731))

(declare-fun bm!44089 () Bool)

(declare-fun call!44092 () Bool)

(assert (=> bm!44089 (= call!44092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!458676 (mask!30364 thiss!1427)))))

(declare-fun b!1041280 () Bool)

(declare-fun e!589671 () Bool)

(assert (=> b!1041280 (= e!589671 call!44092)))

(declare-fun b!1041281 () Bool)

(declare-fun e!589669 () Bool)

(assert (=> b!1041281 (= e!589669 call!44092)))

(declare-fun b!1041282 () Bool)

(declare-fun e!589670 () Bool)

(assert (=> b!1041282 (= e!589670 e!589671)))

(declare-fun c!105622 () Bool)

(assert (=> b!1041282 (= c!105622 (validKeyInArray!0 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125733 () Bool)

(declare-fun res!694052 () Bool)

(assert (=> d!125733 (=> res!694052 e!589670)))

(assert (=> d!125733 (= res!694052 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 lt!458676)))))

(assert (=> d!125733 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458676 (mask!30364 thiss!1427)) e!589670)))

(declare-fun b!1041279 () Bool)

(assert (=> b!1041279 (= e!589671 e!589669)))

(declare-fun lt!458794 () (_ BitVec 64))

(assert (=> b!1041279 (= lt!458794 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!458795 () Unit!33911)

(assert (=> b!1041279 (= lt!458795 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458676 lt!458794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041279 (arrayContainsKey!0 lt!458676 lt!458794 #b00000000000000000000000000000000)))

(declare-fun lt!458796 () Unit!33911)

(assert (=> b!1041279 (= lt!458796 lt!458795)))

(declare-fun res!694051 () Bool)

(assert (=> b!1041279 (= res!694051 (= (seekEntryOrOpen!0 (select (arr!31554 lt!458676) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!458676 (mask!30364 thiss!1427)) (Found!9801 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041279 (=> (not res!694051) (not e!589669))))

(assert (= (and d!125733 (not res!694052)) b!1041282))

(assert (= (and b!1041282 c!105622) b!1041279))

(assert (= (and b!1041282 (not c!105622)) b!1041280))

(assert (= (and b!1041279 res!694051) b!1041281))

(assert (= (or b!1041281 b!1041280) bm!44089))

(declare-fun m!960245 () Bool)

(assert (=> bm!44089 m!960245))

(assert (=> b!1041282 m!960161))

(assert (=> b!1041282 m!960161))

(assert (=> b!1041282 m!960203))

(assert (=> b!1041279 m!960161))

(declare-fun m!960247 () Bool)

(assert (=> b!1041279 m!960247))

(declare-fun m!960249 () Bool)

(assert (=> b!1041279 m!960249))

(assert (=> b!1041279 m!960161))

(declare-fun m!960251 () Bool)

(assert (=> b!1041279 m!960251))

(assert (=> bm!44073 d!125733))

(declare-fun condMapEmpty!38727 () Bool)

(declare-fun mapDefault!38727 () ValueCell!11672)

(assert (=> mapNonEmpty!38726 (= condMapEmpty!38727 (= mapRest!38726 ((as const (Array (_ BitVec 32) ValueCell!11672)) mapDefault!38727)))))

(declare-fun e!589672 () Bool)

(declare-fun mapRes!38727 () Bool)

(assert (=> mapNonEmpty!38726 (= tp!74316 (and e!589672 mapRes!38727))))

(declare-fun mapIsEmpty!38727 () Bool)

(assert (=> mapIsEmpty!38727 mapRes!38727))

(declare-fun b!1041283 () Bool)

(declare-fun e!589673 () Bool)

(assert (=> b!1041283 (= e!589673 tp_is_empty!24751)))

(declare-fun mapNonEmpty!38727 () Bool)

(declare-fun tp!74317 () Bool)

(assert (=> mapNonEmpty!38727 (= mapRes!38727 (and tp!74317 e!589673))))

(declare-fun mapKey!38727 () (_ BitVec 32))

(declare-fun mapRest!38727 () (Array (_ BitVec 32) ValueCell!11672))

(declare-fun mapValue!38727 () ValueCell!11672)

(assert (=> mapNonEmpty!38727 (= mapRest!38726 (store mapRest!38727 mapKey!38727 mapValue!38727))))

(declare-fun b!1041284 () Bool)

(assert (=> b!1041284 (= e!589672 tp_is_empty!24751)))

(assert (= (and mapNonEmpty!38726 condMapEmpty!38727) mapIsEmpty!38727))

(assert (= (and mapNonEmpty!38726 (not condMapEmpty!38727)) mapNonEmpty!38727))

(assert (= (and mapNonEmpty!38727 ((_ is ValueCellFull!11672) mapValue!38727)) b!1041283))

(assert (= (and mapNonEmpty!38726 ((_ is ValueCellFull!11672) mapDefault!38727)) b!1041284))

(declare-fun m!960253 () Bool)

(assert (=> mapNonEmpty!38727 m!960253))

(check-sat (not bm!44086) (not b!1041219) (not b!1041282) (not b!1041193) (not b!1041209) (not mapNonEmpty!38727) (not d!125717) (not b!1041216) (not bm!44087) (not b!1041270) (not bm!44088) (not b!1041278) (not b!1041207) (not d!125681) (not d!125711) tp_is_empty!24751 (not b!1041214) (not b!1041187) (not b!1041229) (not b!1041277) (not d!125721) (not b!1041275) (not bm!44081) (not bm!44083) (not bm!44085) (not b_next!21031) (not b!1041185) (not bm!44084) (not b!1041279) (not b!1041195) (not b!1041244) (not d!125723) b_and!33537 (not b!1041227) (not d!125691) (not d!125699) (not b!1041217) (not b!1041196) (not bm!44089) (not b!1041251) (not bm!44082) (not b!1041176) (not b!1041265) (not d!125727) (not d!125715) (not d!125713) (not b!1041206) (not b!1041189) (not b!1041273) (not b!1041212))
(check-sat b_and!33537 (not b_next!21031))
