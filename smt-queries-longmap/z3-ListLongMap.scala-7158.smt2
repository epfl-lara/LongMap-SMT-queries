; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91112 () Bool)

(assert start!91112)

(declare-fun b!1039978 () Bool)

(declare-fun b_free!21001 () Bool)

(declare-fun b_next!21001 () Bool)

(assert (=> b!1039978 (= b_free!21001 (not b_next!21001))))

(declare-fun tp!74195 () Bool)

(declare-fun b_and!33507 () Bool)

(assert (=> b!1039978 (= tp!74195 b_and!33507)))

(declare-fun b!1039977 () Bool)

(declare-fun e!588725 () Bool)

(declare-fun e!588723 () Bool)

(assert (=> b!1039977 (= e!588725 (not e!588723))))

(declare-fun res!693442 () Bool)

(assert (=> b!1039977 (=> res!693442 e!588723)))

(declare-datatypes ((SeekEntryResult!9788 0))(
  ( (MissingZero!9788 (index!41523 (_ BitVec 32))) (Found!9788 (index!41524 (_ BitVec 32))) (Intermediate!9788 (undefined!10600 Bool) (index!41525 (_ BitVec 32)) (x!92841 (_ BitVec 32))) (Undefined!9788) (MissingVacant!9788 (index!41526 (_ BitVec 32))) )
))
(declare-fun lt!458210 () SeekEntryResult!9788)

(declare-datatypes ((V!37835 0))(
  ( (V!37836 (val!12411 Int)) )
))
(declare-datatypes ((ValueCell!11657 0))(
  ( (ValueCellFull!11657 (v!14997 V!37835)) (EmptyCell!11657) )
))
(declare-datatypes ((array!65515 0))(
  ( (array!65516 (arr!31524 (Array (_ BitVec 32) (_ BitVec 64))) (size!32057 (_ BitVec 32))) )
))
(declare-datatypes ((array!65517 0))(
  ( (array!65518 (arr!31525 (Array (_ BitVec 32) ValueCell!11657)) (size!32058 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5908 0))(
  ( (LongMapFixedSize!5909 (defaultEntry!6336 Int) (mask!30317 (_ BitVec 32)) (extraKeys!6064 (_ BitVec 32)) (zeroValue!6170 V!37835) (minValue!6170 V!37835) (_size!3009 (_ BitVec 32)) (_keys!11550 array!65515) (_values!6359 array!65517) (_vacant!3009 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5908)

(assert (=> b!1039977 (= res!693442 (or (bvslt (index!41524 lt!458210) #b00000000000000000000000000000000) (bvsge (index!41524 lt!458210) (size!32057 (_keys!11550 thiss!1427))) (bvsge (size!32057 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458209 () array!65515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65515 (_ BitVec 32)) Bool)

(assert (=> b!1039977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458209 (mask!30317 thiss!1427))))

(declare-datatypes ((Unit!33893 0))(
  ( (Unit!33894) )
))
(declare-fun lt!458207 () Unit!33893)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65515 (_ BitVec 32) (_ BitVec 32)) Unit!33893)

(assert (=> b!1039977 (= lt!458207 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11550 thiss!1427) (index!41524 lt!458210) (mask!30317 thiss!1427)))))

(declare-datatypes ((List!21991 0))(
  ( (Nil!21988) (Cons!21987 (h!23191 (_ BitVec 64)) (t!31196 List!21991)) )
))
(declare-fun arrayNoDuplicates!0 (array!65515 (_ BitVec 32) List!21991) Bool)

(assert (=> b!1039977 (arrayNoDuplicates!0 lt!458209 #b00000000000000000000000000000000 Nil!21988)))

(declare-fun lt!458208 () Unit!33893)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21991) Unit!33893)

(assert (=> b!1039977 (= lt!458208 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!458210) #b00000000000000000000000000000000 Nil!21988))))

(declare-fun arrayCountValidKeys!0 (array!65515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039977 (= (arrayCountValidKeys!0 lt!458209 #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039977 (= lt!458209 (array!65516 (store (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11550 thiss!1427))))))

(declare-fun lt!458211 () Unit!33893)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65515 (_ BitVec 32) (_ BitVec 64)) Unit!33893)

(assert (=> b!1039977 (= lt!458211 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11550 thiss!1427) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24721 () Bool)

(declare-fun e!588721 () Bool)

(declare-fun e!588720 () Bool)

(declare-fun array_inv!24371 (array!65515) Bool)

(declare-fun array_inv!24372 (array!65517) Bool)

(assert (=> b!1039978 (= e!588720 (and tp!74195 tp_is_empty!24721 (array_inv!24371 (_keys!11550 thiss!1427)) (array_inv!24372 (_values!6359 thiss!1427)) e!588721))))

(declare-fun b!1039979 () Bool)

(declare-fun e!588724 () Bool)

(assert (=> b!1039979 (= e!588724 tp_is_empty!24721)))

(declare-fun b!1039980 () Bool)

(assert (=> b!1039980 (= e!588723 (arrayNoDuplicates!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 Nil!21988))))

(declare-fun b!1039981 () Bool)

(declare-fun e!588722 () Bool)

(assert (=> b!1039981 (= e!588722 tp_is_empty!24721)))

(declare-fun b!1039982 () Bool)

(declare-fun mapRes!38656 () Bool)

(assert (=> b!1039982 (= e!588721 (and e!588724 mapRes!38656))))

(declare-fun condMapEmpty!38656 () Bool)

(declare-fun mapDefault!38656 () ValueCell!11657)

(assert (=> b!1039982 (= condMapEmpty!38656 (= (arr!31525 (_values!6359 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11657)) mapDefault!38656)))))

(declare-fun b!1039983 () Bool)

(declare-fun e!588726 () Bool)

(assert (=> b!1039983 (= e!588726 e!588725)))

(declare-fun res!693444 () Bool)

(assert (=> b!1039983 (=> (not res!693444) (not e!588725))))

(get-info :version)

(assert (=> b!1039983 (= res!693444 ((_ is Found!9788) lt!458210))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65515 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1039983 (= lt!458210 (seekEntry!0 key!909 (_keys!11550 thiss!1427) (mask!30317 thiss!1427)))))

(declare-fun mapNonEmpty!38656 () Bool)

(declare-fun tp!74194 () Bool)

(assert (=> mapNonEmpty!38656 (= mapRes!38656 (and tp!74194 e!588722))))

(declare-fun mapValue!38656 () ValueCell!11657)

(declare-fun mapRest!38656 () (Array (_ BitVec 32) ValueCell!11657))

(declare-fun mapKey!38656 () (_ BitVec 32))

(assert (=> mapNonEmpty!38656 (= (arr!31525 (_values!6359 thiss!1427)) (store mapRest!38656 mapKey!38656 mapValue!38656))))

(declare-fun b!1039984 () Bool)

(declare-fun res!693441 () Bool)

(assert (=> b!1039984 (=> (not res!693441) (not e!588726))))

(assert (=> b!1039984 (= res!693441 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38656 () Bool)

(assert (=> mapIsEmpty!38656 mapRes!38656))

(declare-fun res!693443 () Bool)

(assert (=> start!91112 (=> (not res!693443) (not e!588726))))

(declare-fun valid!2210 (LongMapFixedSize!5908) Bool)

(assert (=> start!91112 (= res!693443 (valid!2210 thiss!1427))))

(assert (=> start!91112 e!588726))

(assert (=> start!91112 e!588720))

(assert (=> start!91112 true))

(assert (= (and start!91112 res!693443) b!1039984))

(assert (= (and b!1039984 res!693441) b!1039983))

(assert (= (and b!1039983 res!693444) b!1039977))

(assert (= (and b!1039977 (not res!693442)) b!1039980))

(assert (= (and b!1039982 condMapEmpty!38656) mapIsEmpty!38656))

(assert (= (and b!1039982 (not condMapEmpty!38656)) mapNonEmpty!38656))

(assert (= (and mapNonEmpty!38656 ((_ is ValueCellFull!11657) mapValue!38656)) b!1039981))

(assert (= (and b!1039982 ((_ is ValueCellFull!11657) mapDefault!38656)) b!1039979))

(assert (= b!1039978 b!1039982))

(assert (= start!91112 b!1039978))

(declare-fun m!959105 () Bool)

(assert (=> b!1039977 m!959105))

(declare-fun m!959107 () Bool)

(assert (=> b!1039977 m!959107))

(declare-fun m!959109 () Bool)

(assert (=> b!1039977 m!959109))

(declare-fun m!959111 () Bool)

(assert (=> b!1039977 m!959111))

(declare-fun m!959113 () Bool)

(assert (=> b!1039977 m!959113))

(declare-fun m!959115 () Bool)

(assert (=> b!1039977 m!959115))

(declare-fun m!959117 () Bool)

(assert (=> b!1039977 m!959117))

(declare-fun m!959119 () Bool)

(assert (=> b!1039977 m!959119))

(declare-fun m!959121 () Bool)

(assert (=> b!1039978 m!959121))

(declare-fun m!959123 () Bool)

(assert (=> b!1039978 m!959123))

(declare-fun m!959125 () Bool)

(assert (=> b!1039980 m!959125))

(declare-fun m!959127 () Bool)

(assert (=> b!1039983 m!959127))

(declare-fun m!959129 () Bool)

(assert (=> start!91112 m!959129))

(declare-fun m!959131 () Bool)

(assert (=> mapNonEmpty!38656 m!959131))

(check-sat (not b!1039980) (not b_next!21001) (not b!1039977) (not b!1039983) b_and!33507 (not mapNonEmpty!38656) tp_is_empty!24721 (not b!1039978) (not start!91112))
(check-sat b_and!33507 (not b_next!21001))
(get-model)

(declare-fun d!125457 () Bool)

(declare-fun e!588778 () Bool)

(assert (=> d!125457 e!588778))

(declare-fun res!693471 () Bool)

(assert (=> d!125457 (=> (not res!693471) (not e!588778))))

(assert (=> d!125457 (= res!693471 (and (bvsge (index!41524 lt!458210) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458210) (size!32057 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458244 () Unit!33893)

(declare-fun choose!25 (array!65515 (_ BitVec 32) (_ BitVec 32)) Unit!33893)

(assert (=> d!125457 (= lt!458244 (choose!25 (_keys!11550 thiss!1427) (index!41524 lt!458210) (mask!30317 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125457 (validMask!0 (mask!30317 thiss!1427))))

(assert (=> d!125457 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11550 thiss!1427) (index!41524 lt!458210) (mask!30317 thiss!1427)) lt!458244)))

(declare-fun b!1040035 () Bool)

(assert (=> b!1040035 (= e!588778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65516 (store (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11550 thiss!1427))) (mask!30317 thiss!1427)))))

(assert (= (and d!125457 res!693471) b!1040035))

(declare-fun m!959189 () Bool)

(assert (=> d!125457 m!959189))

(declare-fun m!959191 () Bool)

(assert (=> d!125457 m!959191))

(assert (=> b!1040035 m!959105))

(declare-fun m!959193 () Bool)

(assert (=> b!1040035 m!959193))

(assert (=> b!1039977 d!125457))

(declare-fun d!125459 () Bool)

(declare-fun e!588781 () Bool)

(assert (=> d!125459 e!588781))

(declare-fun res!693474 () Bool)

(assert (=> d!125459 (=> (not res!693474) (not e!588781))))

(assert (=> d!125459 (= res!693474 (and (bvsge (index!41524 lt!458210) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458210) (size!32057 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458247 () Unit!33893)

(declare-fun choose!53 (array!65515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21991) Unit!33893)

(assert (=> d!125459 (= lt!458247 (choose!53 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!458210) #b00000000000000000000000000000000 Nil!21988))))

(assert (=> d!125459 (bvslt (size!32057 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125459 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11550 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!458210) #b00000000000000000000000000000000 Nil!21988) lt!458247)))

(declare-fun b!1040038 () Bool)

(assert (=> b!1040038 (= e!588781 (arrayNoDuplicates!0 (array!65516 (store (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11550 thiss!1427))) #b00000000000000000000000000000000 Nil!21988))))

(assert (= (and d!125459 res!693474) b!1040038))

(declare-fun m!959195 () Bool)

(assert (=> d!125459 m!959195))

(assert (=> b!1040038 m!959105))

(declare-fun m!959197 () Bool)

(assert (=> b!1040038 m!959197))

(assert (=> b!1039977 d!125459))

(declare-fun b!1040047 () Bool)

(declare-fun e!588787 () (_ BitVec 32))

(declare-fun e!588786 () (_ BitVec 32))

(assert (=> b!1040047 (= e!588787 e!588786)))

(declare-fun c!105408 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040047 (= c!105408 (validKeyInArray!0 (select (arr!31524 lt!458209) #b00000000000000000000000000000000)))))

(declare-fun d!125461 () Bool)

(declare-fun lt!458250 () (_ BitVec 32))

(assert (=> d!125461 (and (bvsge lt!458250 #b00000000000000000000000000000000) (bvsle lt!458250 (bvsub (size!32057 lt!458209) #b00000000000000000000000000000000)))))

(assert (=> d!125461 (= lt!458250 e!588787)))

(declare-fun c!105409 () Bool)

(assert (=> d!125461 (= c!105409 (bvsge #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))))))

(assert (=> d!125461 (and (bvsle #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32057 (_keys!11550 thiss!1427)) (size!32057 lt!458209)))))

(assert (=> d!125461 (= (arrayCountValidKeys!0 lt!458209 #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) lt!458250)))

(declare-fun b!1040048 () Bool)

(declare-fun call!44014 () (_ BitVec 32))

(assert (=> b!1040048 (= e!588786 (bvadd #b00000000000000000000000000000001 call!44014))))

(declare-fun bm!44011 () Bool)

(assert (=> bm!44011 (= call!44014 (arrayCountValidKeys!0 lt!458209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32057 (_keys!11550 thiss!1427))))))

(declare-fun b!1040049 () Bool)

(assert (=> b!1040049 (= e!588786 call!44014)))

(declare-fun b!1040050 () Bool)

(assert (=> b!1040050 (= e!588787 #b00000000000000000000000000000000)))

(assert (= (and d!125461 c!105409) b!1040050))

(assert (= (and d!125461 (not c!105409)) b!1040047))

(assert (= (and b!1040047 c!105408) b!1040048))

(assert (= (and b!1040047 (not c!105408)) b!1040049))

(assert (= (or b!1040048 b!1040049) bm!44011))

(declare-fun m!959199 () Bool)

(assert (=> b!1040047 m!959199))

(assert (=> b!1040047 m!959199))

(declare-fun m!959201 () Bool)

(assert (=> b!1040047 m!959201))

(declare-fun m!959203 () Bool)

(assert (=> bm!44011 m!959203))

(assert (=> b!1039977 d!125461))

(declare-fun b!1040062 () Bool)

(declare-fun e!588792 () Bool)

(assert (=> b!1040062 (= e!588792 (= (arrayCountValidKeys!0 (array!65516 (store (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11550 thiss!1427))) #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040059 () Bool)

(declare-fun res!693483 () Bool)

(declare-fun e!588793 () Bool)

(assert (=> b!1040059 (=> (not res!693483) (not e!588793))))

(assert (=> b!1040059 (= res!693483 (validKeyInArray!0 (select (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458210))))))

(declare-fun d!125463 () Bool)

(assert (=> d!125463 e!588792))

(declare-fun res!693486 () Bool)

(assert (=> d!125463 (=> (not res!693486) (not e!588792))))

(assert (=> d!125463 (= res!693486 (and (bvsge (index!41524 lt!458210) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458210) (size!32057 (_keys!11550 thiss!1427)))))))

(declare-fun lt!458253 () Unit!33893)

(declare-fun choose!82 (array!65515 (_ BitVec 32) (_ BitVec 64)) Unit!33893)

(assert (=> d!125463 (= lt!458253 (choose!82 (_keys!11550 thiss!1427) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125463 e!588793))

(declare-fun res!693485 () Bool)

(assert (=> d!125463 (=> (not res!693485) (not e!588793))))

(assert (=> d!125463 (= res!693485 (and (bvsge (index!41524 lt!458210) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458210) (size!32057 (_keys!11550 thiss!1427)))))))

(assert (=> d!125463 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11550 thiss!1427) (index!41524 lt!458210) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458253)))

(declare-fun b!1040060 () Bool)

(declare-fun res!693484 () Bool)

(assert (=> b!1040060 (=> (not res!693484) (not e!588793))))

(assert (=> b!1040060 (= res!693484 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040061 () Bool)

(assert (=> b!1040061 (= e!588793 (bvslt (size!32057 (_keys!11550 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125463 res!693485) b!1040059))

(assert (= (and b!1040059 res!693483) b!1040060))

(assert (= (and b!1040060 res!693484) b!1040061))

(assert (= (and d!125463 res!693486) b!1040062))

(assert (=> b!1040062 m!959105))

(declare-fun m!959205 () Bool)

(assert (=> b!1040062 m!959205))

(assert (=> b!1040062 m!959117))

(declare-fun m!959207 () Bool)

(assert (=> b!1040059 m!959207))

(assert (=> b!1040059 m!959207))

(declare-fun m!959209 () Bool)

(assert (=> b!1040059 m!959209))

(declare-fun m!959211 () Bool)

(assert (=> d!125463 m!959211))

(declare-fun m!959213 () Bool)

(assert (=> b!1040060 m!959213))

(assert (=> b!1039977 d!125463))

(declare-fun b!1040073 () Bool)

(declare-fun e!588802 () Bool)

(declare-fun contains!6028 (List!21991 (_ BitVec 64)) Bool)

(assert (=> b!1040073 (= e!588802 (contains!6028 Nil!21988 (select (arr!31524 lt!458209) #b00000000000000000000000000000000)))))

(declare-fun b!1040074 () Bool)

(declare-fun e!588803 () Bool)

(declare-fun e!588805 () Bool)

(assert (=> b!1040074 (= e!588803 e!588805)))

(declare-fun c!105412 () Bool)

(assert (=> b!1040074 (= c!105412 (validKeyInArray!0 (select (arr!31524 lt!458209) #b00000000000000000000000000000000)))))

(declare-fun d!125465 () Bool)

(declare-fun res!693494 () Bool)

(declare-fun e!588804 () Bool)

(assert (=> d!125465 (=> res!693494 e!588804)))

(assert (=> d!125465 (= res!693494 (bvsge #b00000000000000000000000000000000 (size!32057 lt!458209)))))

(assert (=> d!125465 (= (arrayNoDuplicates!0 lt!458209 #b00000000000000000000000000000000 Nil!21988) e!588804)))

(declare-fun b!1040075 () Bool)

(assert (=> b!1040075 (= e!588804 e!588803)))

(declare-fun res!693495 () Bool)

(assert (=> b!1040075 (=> (not res!693495) (not e!588803))))

(assert (=> b!1040075 (= res!693495 (not e!588802))))

(declare-fun res!693493 () Bool)

(assert (=> b!1040075 (=> (not res!693493) (not e!588802))))

(assert (=> b!1040075 (= res!693493 (validKeyInArray!0 (select (arr!31524 lt!458209) #b00000000000000000000000000000000)))))

(declare-fun b!1040076 () Bool)

(declare-fun call!44017 () Bool)

(assert (=> b!1040076 (= e!588805 call!44017)))

(declare-fun bm!44014 () Bool)

(assert (=> bm!44014 (= call!44017 (arrayNoDuplicates!0 lt!458209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105412 (Cons!21987 (select (arr!31524 lt!458209) #b00000000000000000000000000000000) Nil!21988) Nil!21988)))))

(declare-fun b!1040077 () Bool)

(assert (=> b!1040077 (= e!588805 call!44017)))

(assert (= (and d!125465 (not res!693494)) b!1040075))

(assert (= (and b!1040075 res!693493) b!1040073))

(assert (= (and b!1040075 res!693495) b!1040074))

(assert (= (and b!1040074 c!105412) b!1040076))

(assert (= (and b!1040074 (not c!105412)) b!1040077))

(assert (= (or b!1040076 b!1040077) bm!44014))

(assert (=> b!1040073 m!959199))

(assert (=> b!1040073 m!959199))

(declare-fun m!959215 () Bool)

(assert (=> b!1040073 m!959215))

(assert (=> b!1040074 m!959199))

(assert (=> b!1040074 m!959199))

(assert (=> b!1040074 m!959201))

(assert (=> b!1040075 m!959199))

(assert (=> b!1040075 m!959199))

(assert (=> b!1040075 m!959201))

(assert (=> bm!44014 m!959199))

(declare-fun m!959217 () Bool)

(assert (=> bm!44014 m!959217))

(assert (=> b!1039977 d!125465))

(declare-fun b!1040078 () Bool)

(declare-fun e!588807 () (_ BitVec 32))

(declare-fun e!588806 () (_ BitVec 32))

(assert (=> b!1040078 (= e!588807 e!588806)))

(declare-fun c!105413 () Bool)

(assert (=> b!1040078 (= c!105413 (validKeyInArray!0 (select (arr!31524 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125467 () Bool)

(declare-fun lt!458254 () (_ BitVec 32))

(assert (=> d!125467 (and (bvsge lt!458254 #b00000000000000000000000000000000) (bvsle lt!458254 (bvsub (size!32057 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125467 (= lt!458254 e!588807)))

(declare-fun c!105414 () Bool)

(assert (=> d!125467 (= c!105414 (bvsge #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))))))

(assert (=> d!125467 (and (bvsle #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32057 (_keys!11550 thiss!1427)) (size!32057 (_keys!11550 thiss!1427))))))

(assert (=> d!125467 (= (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) lt!458254)))

(declare-fun b!1040079 () Bool)

(declare-fun call!44018 () (_ BitVec 32))

(assert (=> b!1040079 (= e!588806 (bvadd #b00000000000000000000000000000001 call!44018))))

(declare-fun bm!44015 () Bool)

(assert (=> bm!44015 (= call!44018 (arrayCountValidKeys!0 (_keys!11550 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32057 (_keys!11550 thiss!1427))))))

(declare-fun b!1040080 () Bool)

(assert (=> b!1040080 (= e!588806 call!44018)))

(declare-fun b!1040081 () Bool)

(assert (=> b!1040081 (= e!588807 #b00000000000000000000000000000000)))

(assert (= (and d!125467 c!105414) b!1040081))

(assert (= (and d!125467 (not c!105414)) b!1040078))

(assert (= (and b!1040078 c!105413) b!1040079))

(assert (= (and b!1040078 (not c!105413)) b!1040080))

(assert (= (or b!1040079 b!1040080) bm!44015))

(declare-fun m!959219 () Bool)

(assert (=> b!1040078 m!959219))

(assert (=> b!1040078 m!959219))

(declare-fun m!959221 () Bool)

(assert (=> b!1040078 m!959221))

(declare-fun m!959223 () Bool)

(assert (=> bm!44015 m!959223))

(assert (=> b!1039977 d!125467))

(declare-fun b!1040090 () Bool)

(declare-fun e!588814 () Bool)

(declare-fun call!44021 () Bool)

(assert (=> b!1040090 (= e!588814 call!44021)))

(declare-fun b!1040091 () Bool)

(declare-fun e!588815 () Bool)

(declare-fun e!588816 () Bool)

(assert (=> b!1040091 (= e!588815 e!588816)))

(declare-fun c!105417 () Bool)

(assert (=> b!1040091 (= c!105417 (validKeyInArray!0 (select (arr!31524 lt!458209) #b00000000000000000000000000000000)))))

(declare-fun d!125469 () Bool)

(declare-fun res!693500 () Bool)

(assert (=> d!125469 (=> res!693500 e!588815)))

(assert (=> d!125469 (= res!693500 (bvsge #b00000000000000000000000000000000 (size!32057 lt!458209)))))

(assert (=> d!125469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458209 (mask!30317 thiss!1427)) e!588815)))

(declare-fun b!1040092 () Bool)

(assert (=> b!1040092 (= e!588816 call!44021)))

(declare-fun bm!44018 () Bool)

(assert (=> bm!44018 (= call!44021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458209 (mask!30317 thiss!1427)))))

(declare-fun b!1040093 () Bool)

(assert (=> b!1040093 (= e!588816 e!588814)))

(declare-fun lt!458262 () (_ BitVec 64))

(assert (=> b!1040093 (= lt!458262 (select (arr!31524 lt!458209) #b00000000000000000000000000000000))))

(declare-fun lt!458261 () Unit!33893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65515 (_ BitVec 64) (_ BitVec 32)) Unit!33893)

(assert (=> b!1040093 (= lt!458261 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458209 lt!458262 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040093 (arrayContainsKey!0 lt!458209 lt!458262 #b00000000000000000000000000000000)))

(declare-fun lt!458263 () Unit!33893)

(assert (=> b!1040093 (= lt!458263 lt!458261)))

(declare-fun res!693501 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65515 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1040093 (= res!693501 (= (seekEntryOrOpen!0 (select (arr!31524 lt!458209) #b00000000000000000000000000000000) lt!458209 (mask!30317 thiss!1427)) (Found!9788 #b00000000000000000000000000000000)))))

(assert (=> b!1040093 (=> (not res!693501) (not e!588814))))

(assert (= (and d!125469 (not res!693500)) b!1040091))

(assert (= (and b!1040091 c!105417) b!1040093))

(assert (= (and b!1040091 (not c!105417)) b!1040092))

(assert (= (and b!1040093 res!693501) b!1040090))

(assert (= (or b!1040090 b!1040092) bm!44018))

(assert (=> b!1040091 m!959199))

(assert (=> b!1040091 m!959199))

(assert (=> b!1040091 m!959201))

(declare-fun m!959225 () Bool)

(assert (=> bm!44018 m!959225))

(assert (=> b!1040093 m!959199))

(declare-fun m!959227 () Bool)

(assert (=> b!1040093 m!959227))

(declare-fun m!959229 () Bool)

(assert (=> b!1040093 m!959229))

(assert (=> b!1040093 m!959199))

(declare-fun m!959231 () Bool)

(assert (=> b!1040093 m!959231))

(assert (=> b!1039977 d!125469))

(declare-fun d!125471 () Bool)

(declare-fun res!693508 () Bool)

(declare-fun e!588819 () Bool)

(assert (=> d!125471 (=> (not res!693508) (not e!588819))))

(declare-fun simpleValid!432 (LongMapFixedSize!5908) Bool)

(assert (=> d!125471 (= res!693508 (simpleValid!432 thiss!1427))))

(assert (=> d!125471 (= (valid!2210 thiss!1427) e!588819)))

(declare-fun b!1040100 () Bool)

(declare-fun res!693509 () Bool)

(assert (=> b!1040100 (=> (not res!693509) (not e!588819))))

(assert (=> b!1040100 (= res!693509 (= (arrayCountValidKeys!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))) (_size!3009 thiss!1427)))))

(declare-fun b!1040101 () Bool)

(declare-fun res!693510 () Bool)

(assert (=> b!1040101 (=> (not res!693510) (not e!588819))))

(assert (=> b!1040101 (= res!693510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11550 thiss!1427) (mask!30317 thiss!1427)))))

(declare-fun b!1040102 () Bool)

(assert (=> b!1040102 (= e!588819 (arrayNoDuplicates!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 Nil!21988))))

(assert (= (and d!125471 res!693508) b!1040100))

(assert (= (and b!1040100 res!693509) b!1040101))

(assert (= (and b!1040101 res!693510) b!1040102))

(declare-fun m!959233 () Bool)

(assert (=> d!125471 m!959233))

(assert (=> b!1040100 m!959117))

(declare-fun m!959235 () Bool)

(assert (=> b!1040101 m!959235))

(assert (=> b!1040102 m!959125))

(assert (=> start!91112 d!125471))

(declare-fun b!1040103 () Bool)

(declare-fun e!588820 () Bool)

(assert (=> b!1040103 (= e!588820 (contains!6028 Nil!21988 (select (arr!31524 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040104 () Bool)

(declare-fun e!588821 () Bool)

(declare-fun e!588823 () Bool)

(assert (=> b!1040104 (= e!588821 e!588823)))

(declare-fun c!105418 () Bool)

(assert (=> b!1040104 (= c!105418 (validKeyInArray!0 (select (arr!31524 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125473 () Bool)

(declare-fun res!693512 () Bool)

(declare-fun e!588822 () Bool)

(assert (=> d!125473 (=> res!693512 e!588822)))

(assert (=> d!125473 (= res!693512 (bvsge #b00000000000000000000000000000000 (size!32057 (_keys!11550 thiss!1427))))))

(assert (=> d!125473 (= (arrayNoDuplicates!0 (_keys!11550 thiss!1427) #b00000000000000000000000000000000 Nil!21988) e!588822)))

(declare-fun b!1040105 () Bool)

(assert (=> b!1040105 (= e!588822 e!588821)))

(declare-fun res!693513 () Bool)

(assert (=> b!1040105 (=> (not res!693513) (not e!588821))))

(assert (=> b!1040105 (= res!693513 (not e!588820))))

(declare-fun res!693511 () Bool)

(assert (=> b!1040105 (=> (not res!693511) (not e!588820))))

(assert (=> b!1040105 (= res!693511 (validKeyInArray!0 (select (arr!31524 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040106 () Bool)

(declare-fun call!44022 () Bool)

(assert (=> b!1040106 (= e!588823 call!44022)))

(declare-fun bm!44019 () Bool)

(assert (=> bm!44019 (= call!44022 (arrayNoDuplicates!0 (_keys!11550 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105418 (Cons!21987 (select (arr!31524 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000) Nil!21988) Nil!21988)))))

(declare-fun b!1040107 () Bool)

(assert (=> b!1040107 (= e!588823 call!44022)))

(assert (= (and d!125473 (not res!693512)) b!1040105))

(assert (= (and b!1040105 res!693511) b!1040103))

(assert (= (and b!1040105 res!693513) b!1040104))

(assert (= (and b!1040104 c!105418) b!1040106))

(assert (= (and b!1040104 (not c!105418)) b!1040107))

(assert (= (or b!1040106 b!1040107) bm!44019))

(assert (=> b!1040103 m!959219))

(assert (=> b!1040103 m!959219))

(declare-fun m!959237 () Bool)

(assert (=> b!1040103 m!959237))

(assert (=> b!1040104 m!959219))

(assert (=> b!1040104 m!959219))

(assert (=> b!1040104 m!959221))

(assert (=> b!1040105 m!959219))

(assert (=> b!1040105 m!959219))

(assert (=> b!1040105 m!959221))

(assert (=> bm!44019 m!959219))

(declare-fun m!959239 () Bool)

(assert (=> bm!44019 m!959239))

(assert (=> b!1039980 d!125473))

(declare-fun d!125475 () Bool)

(assert (=> d!125475 (= (array_inv!24371 (_keys!11550 thiss!1427)) (bvsge (size!32057 (_keys!11550 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039978 d!125475))

(declare-fun d!125477 () Bool)

(assert (=> d!125477 (= (array_inv!24372 (_values!6359 thiss!1427)) (bvsge (size!32058 (_values!6359 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039978 d!125477))

(declare-fun b!1040120 () Bool)

(declare-fun e!588831 () SeekEntryResult!9788)

(declare-fun lt!458274 () SeekEntryResult!9788)

(assert (=> b!1040120 (= e!588831 (Found!9788 (index!41525 lt!458274)))))

(declare-fun b!1040121 () Bool)

(declare-fun c!105427 () Bool)

(declare-fun lt!458272 () (_ BitVec 64))

(assert (=> b!1040121 (= c!105427 (= lt!458272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588832 () SeekEntryResult!9788)

(assert (=> b!1040121 (= e!588831 e!588832)))

(declare-fun b!1040122 () Bool)

(declare-fun e!588830 () SeekEntryResult!9788)

(assert (=> b!1040122 (= e!588830 Undefined!9788)))

(declare-fun d!125479 () Bool)

(declare-fun lt!458275 () SeekEntryResult!9788)

(assert (=> d!125479 (and (or ((_ is MissingVacant!9788) lt!458275) (not ((_ is Found!9788) lt!458275)) (and (bvsge (index!41524 lt!458275) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458275) (size!32057 (_keys!11550 thiss!1427))))) (not ((_ is MissingVacant!9788) lt!458275)) (or (not ((_ is Found!9788) lt!458275)) (= (select (arr!31524 (_keys!11550 thiss!1427)) (index!41524 lt!458275)) key!909)))))

(assert (=> d!125479 (= lt!458275 e!588830)))

(declare-fun c!105426 () Bool)

(assert (=> d!125479 (= c!105426 (and ((_ is Intermediate!9788) lt!458274) (undefined!10600 lt!458274)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65515 (_ BitVec 32)) SeekEntryResult!9788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125479 (= lt!458274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30317 thiss!1427)) key!909 (_keys!11550 thiss!1427) (mask!30317 thiss!1427)))))

(assert (=> d!125479 (validMask!0 (mask!30317 thiss!1427))))

(assert (=> d!125479 (= (seekEntry!0 key!909 (_keys!11550 thiss!1427) (mask!30317 thiss!1427)) lt!458275)))

(declare-fun b!1040123 () Bool)

(assert (=> b!1040123 (= e!588830 e!588831)))

(assert (=> b!1040123 (= lt!458272 (select (arr!31524 (_keys!11550 thiss!1427)) (index!41525 lt!458274)))))

(declare-fun c!105425 () Bool)

(assert (=> b!1040123 (= c!105425 (= lt!458272 key!909))))

(declare-fun b!1040124 () Bool)

(assert (=> b!1040124 (= e!588832 (MissingZero!9788 (index!41525 lt!458274)))))

(declare-fun b!1040125 () Bool)

(declare-fun lt!458273 () SeekEntryResult!9788)

(assert (=> b!1040125 (= e!588832 (ite ((_ is MissingVacant!9788) lt!458273) (MissingZero!9788 (index!41526 lt!458273)) lt!458273))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65515 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1040125 (= lt!458273 (seekKeyOrZeroReturnVacant!0 (x!92841 lt!458274) (index!41525 lt!458274) (index!41525 lt!458274) key!909 (_keys!11550 thiss!1427) (mask!30317 thiss!1427)))))

(assert (= (and d!125479 c!105426) b!1040122))

(assert (= (and d!125479 (not c!105426)) b!1040123))

(assert (= (and b!1040123 c!105425) b!1040120))

(assert (= (and b!1040123 (not c!105425)) b!1040121))

(assert (= (and b!1040121 c!105427) b!1040124))

(assert (= (and b!1040121 (not c!105427)) b!1040125))

(declare-fun m!959241 () Bool)

(assert (=> d!125479 m!959241))

(declare-fun m!959243 () Bool)

(assert (=> d!125479 m!959243))

(assert (=> d!125479 m!959243))

(declare-fun m!959245 () Bool)

(assert (=> d!125479 m!959245))

(assert (=> d!125479 m!959191))

(declare-fun m!959247 () Bool)

(assert (=> b!1040123 m!959247))

(declare-fun m!959249 () Bool)

(assert (=> b!1040125 m!959249))

(assert (=> b!1039983 d!125479))

(declare-fun mapIsEmpty!38665 () Bool)

(declare-fun mapRes!38665 () Bool)

(assert (=> mapIsEmpty!38665 mapRes!38665))

(declare-fun b!1040132 () Bool)

(declare-fun e!588838 () Bool)

(assert (=> b!1040132 (= e!588838 tp_is_empty!24721)))

(declare-fun mapNonEmpty!38665 () Bool)

(declare-fun tp!74210 () Bool)

(assert (=> mapNonEmpty!38665 (= mapRes!38665 (and tp!74210 e!588838))))

(declare-fun mapValue!38665 () ValueCell!11657)

(declare-fun mapRest!38665 () (Array (_ BitVec 32) ValueCell!11657))

(declare-fun mapKey!38665 () (_ BitVec 32))

(assert (=> mapNonEmpty!38665 (= mapRest!38656 (store mapRest!38665 mapKey!38665 mapValue!38665))))

(declare-fun condMapEmpty!38665 () Bool)

(declare-fun mapDefault!38665 () ValueCell!11657)

(assert (=> mapNonEmpty!38656 (= condMapEmpty!38665 (= mapRest!38656 ((as const (Array (_ BitVec 32) ValueCell!11657)) mapDefault!38665)))))

(declare-fun e!588837 () Bool)

(assert (=> mapNonEmpty!38656 (= tp!74194 (and e!588837 mapRes!38665))))

(declare-fun b!1040133 () Bool)

(assert (=> b!1040133 (= e!588837 tp_is_empty!24721)))

(assert (= (and mapNonEmpty!38656 condMapEmpty!38665) mapIsEmpty!38665))

(assert (= (and mapNonEmpty!38656 (not condMapEmpty!38665)) mapNonEmpty!38665))

(assert (= (and mapNonEmpty!38665 ((_ is ValueCellFull!11657) mapValue!38665)) b!1040132))

(assert (= (and mapNonEmpty!38656 ((_ is ValueCellFull!11657) mapDefault!38665)) b!1040133))

(declare-fun m!959251 () Bool)

(assert (=> mapNonEmpty!38665 m!959251))

(check-sat (not b!1040060) (not bm!44014) (not bm!44019) (not b!1040059) (not b!1040035) (not d!125479) (not b!1040093) (not bm!44011) (not b!1040125) (not b!1040091) (not b!1040101) b_and!33507 (not d!125459) (not b!1040102) (not b!1040078) (not b!1040103) (not b!1040105) (not b!1040100) (not bm!44015) (not d!125471) (not b!1040038) (not b_next!21001) (not b!1040074) (not mapNonEmpty!38665) (not d!125457) (not bm!44018) tp_is_empty!24721 (not b!1040073) (not b!1040104) (not d!125463) (not b!1040047) (not b!1040062) (not b!1040075))
(check-sat b_and!33507 (not b_next!21001))
