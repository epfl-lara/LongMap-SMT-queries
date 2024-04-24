; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91296 () Bool)

(assert start!91296)

(declare-fun b!1041126 () Bool)

(declare-fun b_free!20989 () Bool)

(declare-fun b_next!20989 () Bool)

(assert (=> b!1041126 (= b_free!20989 (not b_next!20989))))

(declare-fun tp!74152 () Bool)

(declare-fun b_and!33531 () Bool)

(assert (=> b!1041126 (= tp!74152 b_and!33531)))

(declare-fun b!1041123 () Bool)

(declare-fun e!589408 () Bool)

(declare-fun tp_is_empty!24709 () Bool)

(assert (=> b!1041123 (= e!589408 tp_is_empty!24709)))

(declare-fun mapNonEmpty!38632 () Bool)

(declare-fun mapRes!38632 () Bool)

(declare-fun tp!74153 () Bool)

(declare-fun e!589414 () Bool)

(assert (=> mapNonEmpty!38632 (= mapRes!38632 (and tp!74153 e!589414))))

(declare-fun mapKey!38632 () (_ BitVec 32))

(declare-datatypes ((V!37819 0))(
  ( (V!37820 (val!12405 Int)) )
))
(declare-datatypes ((ValueCell!11651 0))(
  ( (ValueCellFull!11651 (v!14988 V!37819)) (EmptyCell!11651) )
))
(declare-datatypes ((array!65597 0))(
  ( (array!65598 (arr!31561 (Array (_ BitVec 32) (_ BitVec 64))) (size!32093 (_ BitVec 32))) )
))
(declare-datatypes ((array!65599 0))(
  ( (array!65600 (arr!31562 (Array (_ BitVec 32) ValueCell!11651)) (size!32094 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5896 0))(
  ( (LongMapFixedSize!5897 (defaultEntry!6330 Int) (mask!30366 (_ BitVec 32)) (extraKeys!6058 (_ BitVec 32)) (zeroValue!6164 V!37819) (minValue!6164 V!37819) (_size!3003 (_ BitVec 32)) (_keys!11582 array!65597) (_values!6353 array!65599) (_vacant!3003 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5896)

(declare-fun mapRest!38632 () (Array (_ BitVec 32) ValueCell!11651))

(declare-fun mapValue!38632 () ValueCell!11651)

(assert (=> mapNonEmpty!38632 (= (arr!31562 (_values!6353 thiss!1427)) (store mapRest!38632 mapKey!38632 mapValue!38632))))

(declare-fun b!1041124 () Bool)

(declare-fun e!589413 () Bool)

(declare-datatypes ((SeekEntryResult!9743 0))(
  ( (MissingZero!9743 (index!41343 (_ BitVec 32))) (Found!9743 (index!41344 (_ BitVec 32))) (Intermediate!9743 (undefined!10555 Bool) (index!41345 (_ BitVec 32)) (x!92789 (_ BitVec 32))) (Undefined!9743) (MissingVacant!9743 (index!41346 (_ BitVec 32))) )
))
(declare-fun lt!458767 () SeekEntryResult!9743)

(assert (=> b!1041124 (= e!589413 (not (or (bvslt (index!41344 lt!458767) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458767) (size!32093 (_keys!11582 thiss!1427))))))))

(declare-fun lt!458765 () array!65597)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65597 (_ BitVec 32)) Bool)

(assert (=> b!1041124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458765 (mask!30366 thiss!1427))))

(declare-datatypes ((Unit!34005 0))(
  ( (Unit!34006) )
))
(declare-fun lt!458764 () Unit!34005)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65597 (_ BitVec 32) (_ BitVec 32)) Unit!34005)

(assert (=> b!1041124 (= lt!458764 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11582 thiss!1427) (index!41344 lt!458767) (mask!30366 thiss!1427)))))

(declare-datatypes ((List!21939 0))(
  ( (Nil!21936) (Cons!21935 (h!23148 (_ BitVec 64)) (t!31145 List!21939)) )
))
(declare-fun arrayNoDuplicates!0 (array!65597 (_ BitVec 32) List!21939) Bool)

(assert (=> b!1041124 (arrayNoDuplicates!0 lt!458765 #b00000000000000000000000000000000 Nil!21936)))

(declare-fun lt!458766 () Unit!34005)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21939) Unit!34005)

(assert (=> b!1041124 (= lt!458766 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11582 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41344 lt!458767) #b00000000000000000000000000000000 Nil!21936))))

(declare-fun arrayCountValidKeys!0 (array!65597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041124 (= (arrayCountValidKeys!0 lt!458765 #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041124 (= lt!458765 (array!65598 (store (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32093 (_keys!11582 thiss!1427))))))

(declare-fun lt!458768 () Unit!34005)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65597 (_ BitVec 32) (_ BitVec 64)) Unit!34005)

(assert (=> b!1041124 (= lt!458768 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11582 thiss!1427) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38632 () Bool)

(assert (=> mapIsEmpty!38632 mapRes!38632))

(declare-fun b!1041125 () Bool)

(declare-fun e!589409 () Bool)

(assert (=> b!1041125 (= e!589409 e!589413)))

(declare-fun res!693879 () Bool)

(assert (=> b!1041125 (=> (not res!693879) (not e!589413))))

(get-info :version)

(assert (=> b!1041125 (= res!693879 ((_ is Found!9743) lt!458767))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65597 (_ BitVec 32)) SeekEntryResult!9743)

(assert (=> b!1041125 (= lt!458767 (seekEntry!0 key!909 (_keys!11582 thiss!1427) (mask!30366 thiss!1427)))))

(declare-fun e!589412 () Bool)

(declare-fun e!589411 () Bool)

(declare-fun array_inv!24407 (array!65597) Bool)

(declare-fun array_inv!24408 (array!65599) Bool)

(assert (=> b!1041126 (= e!589411 (and tp!74152 tp_is_empty!24709 (array_inv!24407 (_keys!11582 thiss!1427)) (array_inv!24408 (_values!6353 thiss!1427)) e!589412))))

(declare-fun b!1041127 () Bool)

(assert (=> b!1041127 (= e!589412 (and e!589408 mapRes!38632))))

(declare-fun condMapEmpty!38632 () Bool)

(declare-fun mapDefault!38632 () ValueCell!11651)

(assert (=> b!1041127 (= condMapEmpty!38632 (= (arr!31562 (_values!6353 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11651)) mapDefault!38632)))))

(declare-fun res!693880 () Bool)

(assert (=> start!91296 (=> (not res!693880) (not e!589409))))

(declare-fun valid!2225 (LongMapFixedSize!5896) Bool)

(assert (=> start!91296 (= res!693880 (valid!2225 thiss!1427))))

(assert (=> start!91296 e!589409))

(assert (=> start!91296 e!589411))

(assert (=> start!91296 true))

(declare-fun b!1041128 () Bool)

(declare-fun res!693878 () Bool)

(assert (=> b!1041128 (=> (not res!693878) (not e!589409))))

(assert (=> b!1041128 (= res!693878 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041129 () Bool)

(assert (=> b!1041129 (= e!589414 tp_is_empty!24709)))

(assert (= (and start!91296 res!693880) b!1041128))

(assert (= (and b!1041128 res!693878) b!1041125))

(assert (= (and b!1041125 res!693879) b!1041124))

(assert (= (and b!1041127 condMapEmpty!38632) mapIsEmpty!38632))

(assert (= (and b!1041127 (not condMapEmpty!38632)) mapNonEmpty!38632))

(assert (= (and mapNonEmpty!38632 ((_ is ValueCellFull!11651) mapValue!38632)) b!1041129))

(assert (= (and b!1041127 ((_ is ValueCellFull!11651) mapDefault!38632)) b!1041123))

(assert (= b!1041126 b!1041127))

(assert (= start!91296 b!1041126))

(declare-fun m!961109 () Bool)

(assert (=> b!1041124 m!961109))

(declare-fun m!961111 () Bool)

(assert (=> b!1041124 m!961111))

(declare-fun m!961113 () Bool)

(assert (=> b!1041124 m!961113))

(declare-fun m!961115 () Bool)

(assert (=> b!1041124 m!961115))

(declare-fun m!961117 () Bool)

(assert (=> b!1041124 m!961117))

(declare-fun m!961119 () Bool)

(assert (=> b!1041124 m!961119))

(declare-fun m!961121 () Bool)

(assert (=> b!1041124 m!961121))

(declare-fun m!961123 () Bool)

(assert (=> b!1041124 m!961123))

(declare-fun m!961125 () Bool)

(assert (=> mapNonEmpty!38632 m!961125))

(declare-fun m!961127 () Bool)

(assert (=> b!1041125 m!961127))

(declare-fun m!961129 () Bool)

(assert (=> b!1041126 m!961129))

(declare-fun m!961131 () Bool)

(assert (=> b!1041126 m!961131))

(declare-fun m!961133 () Bool)

(assert (=> start!91296 m!961133))

(check-sat tp_is_empty!24709 (not b_next!20989) (not mapNonEmpty!38632) b_and!33531 (not b!1041124) (not start!91296) (not b!1041126) (not b!1041125))
(check-sat b_and!33531 (not b_next!20989))
(get-model)

(declare-fun d!126021 () Bool)

(assert (=> d!126021 (= (array_inv!24407 (_keys!11582 thiss!1427)) (bvsge (size!32093 (_keys!11582 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041126 d!126021))

(declare-fun d!126023 () Bool)

(assert (=> d!126023 (= (array_inv!24408 (_values!6353 thiss!1427)) (bvsge (size!32094 (_values!6353 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041126 d!126023))

(declare-fun d!126025 () Bool)

(declare-fun res!693905 () Bool)

(declare-fun e!589459 () Bool)

(assert (=> d!126025 (=> (not res!693905) (not e!589459))))

(declare-fun simpleValid!430 (LongMapFixedSize!5896) Bool)

(assert (=> d!126025 (= res!693905 (simpleValid!430 thiss!1427))))

(assert (=> d!126025 (= (valid!2225 thiss!1427) e!589459)))

(declare-fun b!1041178 () Bool)

(declare-fun res!693906 () Bool)

(assert (=> b!1041178 (=> (not res!693906) (not e!589459))))

(assert (=> b!1041178 (= res!693906 (= (arrayCountValidKeys!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) (_size!3003 thiss!1427)))))

(declare-fun b!1041179 () Bool)

(declare-fun res!693907 () Bool)

(assert (=> b!1041179 (=> (not res!693907) (not e!589459))))

(assert (=> b!1041179 (= res!693907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11582 thiss!1427) (mask!30366 thiss!1427)))))

(declare-fun b!1041180 () Bool)

(assert (=> b!1041180 (= e!589459 (arrayNoDuplicates!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 Nil!21936))))

(assert (= (and d!126025 res!693905) b!1041178))

(assert (= (and b!1041178 res!693906) b!1041179))

(assert (= (and b!1041179 res!693907) b!1041180))

(declare-fun m!961187 () Bool)

(assert (=> d!126025 m!961187))

(assert (=> b!1041178 m!961123))

(declare-fun m!961189 () Bool)

(assert (=> b!1041179 m!961189))

(declare-fun m!961191 () Bool)

(assert (=> b!1041180 m!961191))

(assert (=> start!91296 d!126025))

(declare-fun d!126027 () Bool)

(declare-fun e!589462 () Bool)

(assert (=> d!126027 e!589462))

(declare-fun res!693910 () Bool)

(assert (=> d!126027 (=> (not res!693910) (not e!589462))))

(assert (=> d!126027 (= res!693910 (and (bvsge (index!41344 lt!458767) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458767) (size!32093 (_keys!11582 thiss!1427)))))))

(declare-fun lt!458801 () Unit!34005)

(declare-fun choose!53 (array!65597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21939) Unit!34005)

(assert (=> d!126027 (= lt!458801 (choose!53 (_keys!11582 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41344 lt!458767) #b00000000000000000000000000000000 Nil!21936))))

(assert (=> d!126027 (bvslt (size!32093 (_keys!11582 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126027 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11582 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41344 lt!458767) #b00000000000000000000000000000000 Nil!21936) lt!458801)))

(declare-fun b!1041183 () Bool)

(assert (=> b!1041183 (= e!589462 (arrayNoDuplicates!0 (array!65598 (store (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32093 (_keys!11582 thiss!1427))) #b00000000000000000000000000000000 Nil!21936))))

(assert (= (and d!126027 res!693910) b!1041183))

(declare-fun m!961193 () Bool)

(assert (=> d!126027 m!961193))

(assert (=> b!1041183 m!961117))

(declare-fun m!961195 () Bool)

(assert (=> b!1041183 m!961195))

(assert (=> b!1041124 d!126027))

(declare-fun bm!44081 () Bool)

(declare-fun call!44084 () Bool)

(assert (=> bm!44081 (= call!44084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458765 (mask!30366 thiss!1427)))))

(declare-fun b!1041192 () Bool)

(declare-fun e!589469 () Bool)

(assert (=> b!1041192 (= e!589469 call!44084)))

(declare-fun b!1041193 () Bool)

(declare-fun e!589470 () Bool)

(assert (=> b!1041193 (= e!589470 e!589469)))

(declare-fun c!105809 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041193 (= c!105809 (validKeyInArray!0 (select (arr!31561 lt!458765) #b00000000000000000000000000000000)))))

(declare-fun d!126029 () Bool)

(declare-fun res!693915 () Bool)

(assert (=> d!126029 (=> res!693915 e!589470)))

(assert (=> d!126029 (= res!693915 (bvsge #b00000000000000000000000000000000 (size!32093 lt!458765)))))

(assert (=> d!126029 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458765 (mask!30366 thiss!1427)) e!589470)))

(declare-fun b!1041194 () Bool)

(declare-fun e!589471 () Bool)

(assert (=> b!1041194 (= e!589471 call!44084)))

(declare-fun b!1041195 () Bool)

(assert (=> b!1041195 (= e!589469 e!589471)))

(declare-fun lt!458809 () (_ BitVec 64))

(assert (=> b!1041195 (= lt!458809 (select (arr!31561 lt!458765) #b00000000000000000000000000000000))))

(declare-fun lt!458808 () Unit!34005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65597 (_ BitVec 64) (_ BitVec 32)) Unit!34005)

(assert (=> b!1041195 (= lt!458808 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458765 lt!458809 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041195 (arrayContainsKey!0 lt!458765 lt!458809 #b00000000000000000000000000000000)))

(declare-fun lt!458810 () Unit!34005)

(assert (=> b!1041195 (= lt!458810 lt!458808)))

(declare-fun res!693916 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65597 (_ BitVec 32)) SeekEntryResult!9743)

(assert (=> b!1041195 (= res!693916 (= (seekEntryOrOpen!0 (select (arr!31561 lt!458765) #b00000000000000000000000000000000) lt!458765 (mask!30366 thiss!1427)) (Found!9743 #b00000000000000000000000000000000)))))

(assert (=> b!1041195 (=> (not res!693916) (not e!589471))))

(assert (= (and d!126029 (not res!693915)) b!1041193))

(assert (= (and b!1041193 c!105809) b!1041195))

(assert (= (and b!1041193 (not c!105809)) b!1041192))

(assert (= (and b!1041195 res!693916) b!1041194))

(assert (= (or b!1041194 b!1041192) bm!44081))

(declare-fun m!961197 () Bool)

(assert (=> bm!44081 m!961197))

(declare-fun m!961199 () Bool)

(assert (=> b!1041193 m!961199))

(assert (=> b!1041193 m!961199))

(declare-fun m!961201 () Bool)

(assert (=> b!1041193 m!961201))

(assert (=> b!1041195 m!961199))

(declare-fun m!961203 () Bool)

(assert (=> b!1041195 m!961203))

(declare-fun m!961205 () Bool)

(assert (=> b!1041195 m!961205))

(assert (=> b!1041195 m!961199))

(declare-fun m!961207 () Bool)

(assert (=> b!1041195 m!961207))

(assert (=> b!1041124 d!126029))

(declare-fun d!126031 () Bool)

(declare-fun e!589474 () Bool)

(assert (=> d!126031 e!589474))

(declare-fun res!693919 () Bool)

(assert (=> d!126031 (=> (not res!693919) (not e!589474))))

(assert (=> d!126031 (= res!693919 (and (bvsge (index!41344 lt!458767) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458767) (size!32093 (_keys!11582 thiss!1427)))))))

(declare-fun lt!458813 () Unit!34005)

(declare-fun choose!25 (array!65597 (_ BitVec 32) (_ BitVec 32)) Unit!34005)

(assert (=> d!126031 (= lt!458813 (choose!25 (_keys!11582 thiss!1427) (index!41344 lt!458767) (mask!30366 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126031 (validMask!0 (mask!30366 thiss!1427))))

(assert (=> d!126031 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11582 thiss!1427) (index!41344 lt!458767) (mask!30366 thiss!1427)) lt!458813)))

(declare-fun b!1041198 () Bool)

(assert (=> b!1041198 (= e!589474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65598 (store (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32093 (_keys!11582 thiss!1427))) (mask!30366 thiss!1427)))))

(assert (= (and d!126031 res!693919) b!1041198))

(declare-fun m!961209 () Bool)

(assert (=> d!126031 m!961209))

(declare-fun m!961211 () Bool)

(assert (=> d!126031 m!961211))

(assert (=> b!1041198 m!961117))

(declare-fun m!961213 () Bool)

(assert (=> b!1041198 m!961213))

(assert (=> b!1041124 d!126031))

(declare-fun b!1041207 () Bool)

(declare-fun e!589479 () (_ BitVec 32))

(declare-fun e!589480 () (_ BitVec 32))

(assert (=> b!1041207 (= e!589479 e!589480)))

(declare-fun c!105814 () Bool)

(assert (=> b!1041207 (= c!105814 (validKeyInArray!0 (select (arr!31561 lt!458765) #b00000000000000000000000000000000)))))

(declare-fun d!126033 () Bool)

(declare-fun lt!458816 () (_ BitVec 32))

(assert (=> d!126033 (and (bvsge lt!458816 #b00000000000000000000000000000000) (bvsle lt!458816 (bvsub (size!32093 lt!458765) #b00000000000000000000000000000000)))))

(assert (=> d!126033 (= lt!458816 e!589479)))

(declare-fun c!105815 () Bool)

(assert (=> d!126033 (= c!105815 (bvsge #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))))))

(assert (=> d!126033 (and (bvsle #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32093 (_keys!11582 thiss!1427)) (size!32093 lt!458765)))))

(assert (=> d!126033 (= (arrayCountValidKeys!0 lt!458765 #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) lt!458816)))

(declare-fun b!1041208 () Bool)

(assert (=> b!1041208 (= e!589479 #b00000000000000000000000000000000)))

(declare-fun b!1041209 () Bool)

(declare-fun call!44087 () (_ BitVec 32))

(assert (=> b!1041209 (= e!589480 (bvadd #b00000000000000000000000000000001 call!44087))))

(declare-fun bm!44084 () Bool)

(assert (=> bm!44084 (= call!44087 (arrayCountValidKeys!0 lt!458765 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32093 (_keys!11582 thiss!1427))))))

(declare-fun b!1041210 () Bool)

(assert (=> b!1041210 (= e!589480 call!44087)))

(assert (= (and d!126033 c!105815) b!1041208))

(assert (= (and d!126033 (not c!105815)) b!1041207))

(assert (= (and b!1041207 c!105814) b!1041209))

(assert (= (and b!1041207 (not c!105814)) b!1041210))

(assert (= (or b!1041209 b!1041210) bm!44084))

(assert (=> b!1041207 m!961199))

(assert (=> b!1041207 m!961199))

(assert (=> b!1041207 m!961201))

(declare-fun m!961215 () Bool)

(assert (=> bm!44084 m!961215))

(assert (=> b!1041124 d!126033))

(declare-fun b!1041221 () Bool)

(declare-fun e!589491 () Bool)

(declare-fun call!44090 () Bool)

(assert (=> b!1041221 (= e!589491 call!44090)))

(declare-fun b!1041222 () Bool)

(declare-fun e!589492 () Bool)

(declare-fun e!589490 () Bool)

(assert (=> b!1041222 (= e!589492 e!589490)))

(declare-fun res!693926 () Bool)

(assert (=> b!1041222 (=> (not res!693926) (not e!589490))))

(declare-fun e!589489 () Bool)

(assert (=> b!1041222 (= res!693926 (not e!589489))))

(declare-fun res!693927 () Bool)

(assert (=> b!1041222 (=> (not res!693927) (not e!589489))))

(assert (=> b!1041222 (= res!693927 (validKeyInArray!0 (select (arr!31561 lt!458765) #b00000000000000000000000000000000)))))

(declare-fun b!1041223 () Bool)

(assert (=> b!1041223 (= e!589490 e!589491)))

(declare-fun c!105818 () Bool)

(assert (=> b!1041223 (= c!105818 (validKeyInArray!0 (select (arr!31561 lt!458765) #b00000000000000000000000000000000)))))

(declare-fun bm!44087 () Bool)

(assert (=> bm!44087 (= call!44090 (arrayNoDuplicates!0 lt!458765 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105818 (Cons!21935 (select (arr!31561 lt!458765) #b00000000000000000000000000000000) Nil!21936) Nil!21936)))))

(declare-fun b!1041225 () Bool)

(declare-fun contains!6072 (List!21939 (_ BitVec 64)) Bool)

(assert (=> b!1041225 (= e!589489 (contains!6072 Nil!21936 (select (arr!31561 lt!458765) #b00000000000000000000000000000000)))))

(declare-fun b!1041224 () Bool)

(assert (=> b!1041224 (= e!589491 call!44090)))

(declare-fun d!126035 () Bool)

(declare-fun res!693928 () Bool)

(assert (=> d!126035 (=> res!693928 e!589492)))

(assert (=> d!126035 (= res!693928 (bvsge #b00000000000000000000000000000000 (size!32093 lt!458765)))))

(assert (=> d!126035 (= (arrayNoDuplicates!0 lt!458765 #b00000000000000000000000000000000 Nil!21936) e!589492)))

(assert (= (and d!126035 (not res!693928)) b!1041222))

(assert (= (and b!1041222 res!693927) b!1041225))

(assert (= (and b!1041222 res!693926) b!1041223))

(assert (= (and b!1041223 c!105818) b!1041224))

(assert (= (and b!1041223 (not c!105818)) b!1041221))

(assert (= (or b!1041224 b!1041221) bm!44087))

(assert (=> b!1041222 m!961199))

(assert (=> b!1041222 m!961199))

(assert (=> b!1041222 m!961201))

(assert (=> b!1041223 m!961199))

(assert (=> b!1041223 m!961199))

(assert (=> b!1041223 m!961201))

(assert (=> bm!44087 m!961199))

(declare-fun m!961217 () Bool)

(assert (=> bm!44087 m!961217))

(assert (=> b!1041225 m!961199))

(assert (=> b!1041225 m!961199))

(declare-fun m!961219 () Bool)

(assert (=> b!1041225 m!961219))

(assert (=> b!1041124 d!126035))

(declare-fun b!1041234 () Bool)

(declare-fun res!693938 () Bool)

(declare-fun e!589497 () Bool)

(assert (=> b!1041234 (=> (not res!693938) (not e!589497))))

(assert (=> b!1041234 (= res!693938 (validKeyInArray!0 (select (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458767))))))

(declare-fun d!126037 () Bool)

(declare-fun e!589498 () Bool)

(assert (=> d!126037 e!589498))

(declare-fun res!693940 () Bool)

(assert (=> d!126037 (=> (not res!693940) (not e!589498))))

(assert (=> d!126037 (= res!693940 (and (bvsge (index!41344 lt!458767) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458767) (size!32093 (_keys!11582 thiss!1427)))))))

(declare-fun lt!458819 () Unit!34005)

(declare-fun choose!82 (array!65597 (_ BitVec 32) (_ BitVec 64)) Unit!34005)

(assert (=> d!126037 (= lt!458819 (choose!82 (_keys!11582 thiss!1427) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126037 e!589497))

(declare-fun res!693939 () Bool)

(assert (=> d!126037 (=> (not res!693939) (not e!589497))))

(assert (=> d!126037 (= res!693939 (and (bvsge (index!41344 lt!458767) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458767) (size!32093 (_keys!11582 thiss!1427)))))))

(assert (=> d!126037 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11582 thiss!1427) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458819)))

(declare-fun b!1041237 () Bool)

(assert (=> b!1041237 (= e!589498 (= (arrayCountValidKeys!0 (array!65598 (store (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32093 (_keys!11582 thiss!1427))) #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041236 () Bool)

(assert (=> b!1041236 (= e!589497 (bvslt (size!32093 (_keys!11582 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041235 () Bool)

(declare-fun res!693937 () Bool)

(assert (=> b!1041235 (=> (not res!693937) (not e!589497))))

(assert (=> b!1041235 (= res!693937 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126037 res!693939) b!1041234))

(assert (= (and b!1041234 res!693938) b!1041235))

(assert (= (and b!1041235 res!693937) b!1041236))

(assert (= (and d!126037 res!693940) b!1041237))

(declare-fun m!961221 () Bool)

(assert (=> b!1041234 m!961221))

(assert (=> b!1041234 m!961221))

(declare-fun m!961223 () Bool)

(assert (=> b!1041234 m!961223))

(declare-fun m!961225 () Bool)

(assert (=> d!126037 m!961225))

(assert (=> b!1041237 m!961117))

(declare-fun m!961227 () Bool)

(assert (=> b!1041237 m!961227))

(assert (=> b!1041237 m!961123))

(declare-fun m!961229 () Bool)

(assert (=> b!1041235 m!961229))

(assert (=> b!1041124 d!126037))

(declare-fun b!1041238 () Bool)

(declare-fun e!589499 () (_ BitVec 32))

(declare-fun e!589500 () (_ BitVec 32))

(assert (=> b!1041238 (= e!589499 e!589500)))

(declare-fun c!105819 () Bool)

(assert (=> b!1041238 (= c!105819 (validKeyInArray!0 (select (arr!31561 (_keys!11582 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126039 () Bool)

(declare-fun lt!458820 () (_ BitVec 32))

(assert (=> d!126039 (and (bvsge lt!458820 #b00000000000000000000000000000000) (bvsle lt!458820 (bvsub (size!32093 (_keys!11582 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126039 (= lt!458820 e!589499)))

(declare-fun c!105820 () Bool)

(assert (=> d!126039 (= c!105820 (bvsge #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))))))

(assert (=> d!126039 (and (bvsle #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32093 (_keys!11582 thiss!1427)) (size!32093 (_keys!11582 thiss!1427))))))

(assert (=> d!126039 (= (arrayCountValidKeys!0 (_keys!11582 thiss!1427) #b00000000000000000000000000000000 (size!32093 (_keys!11582 thiss!1427))) lt!458820)))

(declare-fun b!1041239 () Bool)

(assert (=> b!1041239 (= e!589499 #b00000000000000000000000000000000)))

(declare-fun b!1041240 () Bool)

(declare-fun call!44091 () (_ BitVec 32))

(assert (=> b!1041240 (= e!589500 (bvadd #b00000000000000000000000000000001 call!44091))))

(declare-fun bm!44088 () Bool)

(assert (=> bm!44088 (= call!44091 (arrayCountValidKeys!0 (_keys!11582 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32093 (_keys!11582 thiss!1427))))))

(declare-fun b!1041241 () Bool)

(assert (=> b!1041241 (= e!589500 call!44091)))

(assert (= (and d!126039 c!105820) b!1041239))

(assert (= (and d!126039 (not c!105820)) b!1041238))

(assert (= (and b!1041238 c!105819) b!1041240))

(assert (= (and b!1041238 (not c!105819)) b!1041241))

(assert (= (or b!1041240 b!1041241) bm!44088))

(declare-fun m!961231 () Bool)

(assert (=> b!1041238 m!961231))

(assert (=> b!1041238 m!961231))

(declare-fun m!961233 () Bool)

(assert (=> b!1041238 m!961233))

(declare-fun m!961235 () Bool)

(assert (=> bm!44088 m!961235))

(assert (=> b!1041124 d!126039))

(declare-fun b!1041254 () Bool)

(declare-fun c!105828 () Bool)

(declare-fun lt!458832 () (_ BitVec 64))

(assert (=> b!1041254 (= c!105828 (= lt!458832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589508 () SeekEntryResult!9743)

(declare-fun e!589509 () SeekEntryResult!9743)

(assert (=> b!1041254 (= e!589508 e!589509)))

(declare-fun b!1041255 () Bool)

(declare-fun lt!458830 () SeekEntryResult!9743)

(assert (=> b!1041255 (= e!589509 (ite ((_ is MissingVacant!9743) lt!458830) (MissingZero!9743 (index!41346 lt!458830)) lt!458830))))

(declare-fun lt!458829 () SeekEntryResult!9743)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65597 (_ BitVec 32)) SeekEntryResult!9743)

(assert (=> b!1041255 (= lt!458830 (seekKeyOrZeroReturnVacant!0 (x!92789 lt!458829) (index!41345 lt!458829) (index!41345 lt!458829) key!909 (_keys!11582 thiss!1427) (mask!30366 thiss!1427)))))

(declare-fun b!1041256 () Bool)

(declare-fun e!589507 () SeekEntryResult!9743)

(assert (=> b!1041256 (= e!589507 e!589508)))

(assert (=> b!1041256 (= lt!458832 (select (arr!31561 (_keys!11582 thiss!1427)) (index!41345 lt!458829)))))

(declare-fun c!105829 () Bool)

(assert (=> b!1041256 (= c!105829 (= lt!458832 key!909))))

(declare-fun b!1041257 () Bool)

(assert (=> b!1041257 (= e!589507 Undefined!9743)))

(declare-fun d!126041 () Bool)

(declare-fun lt!458831 () SeekEntryResult!9743)

(assert (=> d!126041 (and (or ((_ is MissingVacant!9743) lt!458831) (not ((_ is Found!9743) lt!458831)) (and (bvsge (index!41344 lt!458831) #b00000000000000000000000000000000) (bvslt (index!41344 lt!458831) (size!32093 (_keys!11582 thiss!1427))))) (not ((_ is MissingVacant!9743) lt!458831)) (or (not ((_ is Found!9743) lt!458831)) (= (select (arr!31561 (_keys!11582 thiss!1427)) (index!41344 lt!458831)) key!909)))))

(assert (=> d!126041 (= lt!458831 e!589507)))

(declare-fun c!105827 () Bool)

(assert (=> d!126041 (= c!105827 (and ((_ is Intermediate!9743) lt!458829) (undefined!10555 lt!458829)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65597 (_ BitVec 32)) SeekEntryResult!9743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126041 (= lt!458829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30366 thiss!1427)) key!909 (_keys!11582 thiss!1427) (mask!30366 thiss!1427)))))

(assert (=> d!126041 (validMask!0 (mask!30366 thiss!1427))))

(assert (=> d!126041 (= (seekEntry!0 key!909 (_keys!11582 thiss!1427) (mask!30366 thiss!1427)) lt!458831)))

(declare-fun b!1041258 () Bool)

(assert (=> b!1041258 (= e!589508 (Found!9743 (index!41345 lt!458829)))))

(declare-fun b!1041259 () Bool)

(assert (=> b!1041259 (= e!589509 (MissingZero!9743 (index!41345 lt!458829)))))

(assert (= (and d!126041 c!105827) b!1041257))

(assert (= (and d!126041 (not c!105827)) b!1041256))

(assert (= (and b!1041256 c!105829) b!1041258))

(assert (= (and b!1041256 (not c!105829)) b!1041254))

(assert (= (and b!1041254 c!105828) b!1041259))

(assert (= (and b!1041254 (not c!105828)) b!1041255))

(declare-fun m!961237 () Bool)

(assert (=> b!1041255 m!961237))

(declare-fun m!961239 () Bool)

(assert (=> b!1041256 m!961239))

(declare-fun m!961241 () Bool)

(assert (=> d!126041 m!961241))

(declare-fun m!961243 () Bool)

(assert (=> d!126041 m!961243))

(assert (=> d!126041 m!961243))

(declare-fun m!961245 () Bool)

(assert (=> d!126041 m!961245))

(assert (=> d!126041 m!961211))

(assert (=> b!1041125 d!126041))

(declare-fun condMapEmpty!38641 () Bool)

(declare-fun mapDefault!38641 () ValueCell!11651)

(assert (=> mapNonEmpty!38632 (= condMapEmpty!38641 (= mapRest!38632 ((as const (Array (_ BitVec 32) ValueCell!11651)) mapDefault!38641)))))

(declare-fun e!589515 () Bool)

(declare-fun mapRes!38641 () Bool)

(assert (=> mapNonEmpty!38632 (= tp!74153 (and e!589515 mapRes!38641))))

(declare-fun mapNonEmpty!38641 () Bool)

(declare-fun tp!74168 () Bool)

(declare-fun e!589514 () Bool)

(assert (=> mapNonEmpty!38641 (= mapRes!38641 (and tp!74168 e!589514))))

(declare-fun mapKey!38641 () (_ BitVec 32))

(declare-fun mapValue!38641 () ValueCell!11651)

(declare-fun mapRest!38641 () (Array (_ BitVec 32) ValueCell!11651))

(assert (=> mapNonEmpty!38641 (= mapRest!38632 (store mapRest!38641 mapKey!38641 mapValue!38641))))

(declare-fun b!1041267 () Bool)

(assert (=> b!1041267 (= e!589515 tp_is_empty!24709)))

(declare-fun b!1041266 () Bool)

(assert (=> b!1041266 (= e!589514 tp_is_empty!24709)))

(declare-fun mapIsEmpty!38641 () Bool)

(assert (=> mapIsEmpty!38641 mapRes!38641))

(assert (= (and mapNonEmpty!38632 condMapEmpty!38641) mapIsEmpty!38641))

(assert (= (and mapNonEmpty!38632 (not condMapEmpty!38641)) mapNonEmpty!38641))

(assert (= (and mapNonEmpty!38641 ((_ is ValueCellFull!11651) mapValue!38641)) b!1041266))

(assert (= (and mapNonEmpty!38632 ((_ is ValueCellFull!11651) mapDefault!38641)) b!1041267))

(declare-fun m!961247 () Bool)

(assert (=> mapNonEmpty!38641 m!961247))

(check-sat (not d!126025) (not b!1041183) (not bm!44081) tp_is_empty!24709 (not b_next!20989) (not b!1041223) (not b!1041234) (not b!1041180) (not b!1041225) b_and!33531 (not b!1041193) (not mapNonEmpty!38641) (not b!1041178) (not bm!44088) (not d!126031) (not b!1041237) (not b!1041179) (not b!1041255) (not bm!44084) (not b!1041195) (not b!1041238) (not b!1041222) (not b!1041207) (not b!1041198) (not b!1041235) (not d!126027) (not d!126037) (not d!126041) (not bm!44087))
(check-sat b_and!33531 (not b_next!20989))
