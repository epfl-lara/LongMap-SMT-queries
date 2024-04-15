; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91890 () Bool)

(assert start!91890)

(declare-fun b!1045084 () Bool)

(declare-fun b_free!21133 () Bool)

(declare-fun b_next!21133 () Bool)

(assert (=> b!1045084 (= b_free!21133 (not b_next!21133))))

(declare-fun tp!74654 () Bool)

(declare-fun b_and!33719 () Bool)

(assert (=> b!1045084 (= tp!74654 b_and!33719)))

(declare-fun b!1045079 () Bool)

(declare-fun res!695938 () Bool)

(declare-fun e!592368 () Bool)

(assert (=> b!1045079 (=> (not res!695938) (not e!592368))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1045079 (= res!695938 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38918 () Bool)

(declare-fun mapRes!38918 () Bool)

(declare-fun tp!74655 () Bool)

(declare-fun e!592372 () Bool)

(assert (=> mapNonEmpty!38918 (= mapRes!38918 (and tp!74655 e!592372))))

(declare-datatypes ((V!38011 0))(
  ( (V!38012 (val!12477 Int)) )
))
(declare-datatypes ((ValueCell!11723 0))(
  ( (ValueCellFull!11723 (v!15071 V!38011)) (EmptyCell!11723) )
))
(declare-fun mapRest!38918 () (Array (_ BitVec 32) ValueCell!11723))

(declare-fun mapKey!38918 () (_ BitVec 32))

(declare-datatypes ((array!65819 0))(
  ( (array!65820 (arr!31656 (Array (_ BitVec 32) (_ BitVec 64))) (size!32193 (_ BitVec 32))) )
))
(declare-datatypes ((array!65821 0))(
  ( (array!65822 (arr!31657 (Array (_ BitVec 32) ValueCell!11723)) (size!32194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6040 0))(
  ( (LongMapFixedSize!6041 (defaultEntry!6414 Int) (mask!30534 (_ BitVec 32)) (extraKeys!6142 (_ BitVec 32)) (zeroValue!6248 V!38011) (minValue!6248 V!38011) (_size!3075 (_ BitVec 32)) (_keys!11680 array!65819) (_values!6437 array!65821) (_vacant!3075 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6040)

(declare-fun mapValue!38918 () ValueCell!11723)

(assert (=> mapNonEmpty!38918 (= (arr!31657 (_values!6437 thiss!1427)) (store mapRest!38918 mapKey!38918 mapValue!38918))))

(declare-fun b!1045080 () Bool)

(declare-fun res!695936 () Bool)

(declare-fun e!592373 () Bool)

(assert (=> b!1045080 (=> res!695936 e!592373)))

(declare-datatypes ((Unit!34023 0))(
  ( (Unit!34024) )
))
(declare-datatypes ((tuple2!15854 0))(
  ( (tuple2!15855 (_1!7938 Unit!34023) (_2!7938 LongMapFixedSize!6040)) )
))
(declare-fun lt!461146 () tuple2!15854)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045080 (= res!695936 (not (validMask!0 (mask!30534 (_2!7938 lt!461146)))))))

(declare-fun b!1045081 () Bool)

(declare-fun e!592369 () Bool)

(assert (=> b!1045081 (= e!592369 (not e!592373))))

(declare-fun res!695937 () Bool)

(assert (=> b!1045081 (=> res!695937 e!592373)))

(declare-datatypes ((tuple2!15856 0))(
  ( (tuple2!15857 (_1!7939 (_ BitVec 64)) (_2!7939 V!38011)) )
))
(declare-datatypes ((List!22052 0))(
  ( (Nil!22049) (Cons!22048 (h!23256 tuple2!15856) (t!31303 List!22052)) )
))
(declare-datatypes ((ListLongMap!13859 0))(
  ( (ListLongMap!13860 (toList!6945 List!22052)) )
))
(declare-fun contains!6057 (ListLongMap!13859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3911 (array!65819 array!65821 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) Int) ListLongMap!13859)

(assert (=> b!1045081 (= res!695937 (not (contains!6057 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))) key!909)))))

(declare-fun lt!461149 () array!65821)

(declare-fun lt!461154 () array!65819)

(declare-fun Unit!34025 () Unit!34023)

(declare-fun Unit!34026 () Unit!34023)

(assert (=> b!1045081 (= lt!461146 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3075 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15855 Unit!34025 (LongMapFixedSize!6041 (defaultEntry!6414 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (bvsub (_size!3075 thiss!1427) #b00000000000000000000000000000001) lt!461154 lt!461149 (bvadd #b00000000000000000000000000000001 (_vacant!3075 thiss!1427)))) (tuple2!15855 Unit!34026 (LongMapFixedSize!6041 (defaultEntry!6414 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (bvsub (_size!3075 thiss!1427) #b00000000000000000000000000000001) lt!461154 lt!461149 (_vacant!3075 thiss!1427)))))))

(declare-fun -!537 (ListLongMap!13859 (_ BitVec 64)) ListLongMap!13859)

(assert (=> b!1045081 (= (-!537 (getCurrentListMap!3911 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) (getCurrentListMap!3911 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9846 0))(
  ( (MissingZero!9846 (index!41755 (_ BitVec 32))) (Found!9846 (index!41756 (_ BitVec 32))) (Intermediate!9846 (undefined!10658 Bool) (index!41757 (_ BitVec 32)) (x!93353 (_ BitVec 32))) (Undefined!9846) (MissingVacant!9846 (index!41758 (_ BitVec 32))) )
))
(declare-fun lt!461151 () SeekEntryResult!9846)

(declare-fun dynLambda!1998 (Int (_ BitVec 64)) V!38011)

(assert (=> b!1045081 (= lt!461149 (array!65822 (store (arr!31657 (_values!6437 thiss!1427)) (index!41756 lt!461151) (ValueCellFull!11723 (dynLambda!1998 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32194 (_values!6437 thiss!1427))))))

(declare-fun lt!461150 () Unit!34023)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (array!65819 array!65821 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) (_ BitVec 64) Int) Unit!34023)

(assert (=> b!1045081 (= lt!461150 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41756 lt!461151) key!909 (defaultEntry!6414 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045081 (not (arrayContainsKey!0 lt!461154 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461152 () Unit!34023)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65819 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> b!1045081 (= lt!461152 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65819 (_ BitVec 32)) Bool)

(assert (=> b!1045081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461154 (mask!30534 thiss!1427))))

(declare-fun lt!461153 () Unit!34023)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65819 (_ BitVec 32) (_ BitVec 32)) Unit!34023)

(assert (=> b!1045081 (= lt!461153 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) (mask!30534 thiss!1427)))))

(declare-datatypes ((List!22053 0))(
  ( (Nil!22050) (Cons!22049 (h!23257 (_ BitVec 64)) (t!31304 List!22053)) )
))
(declare-fun arrayNoDuplicates!0 (array!65819 (_ BitVec 32) List!22053) Bool)

(assert (=> b!1045081 (arrayNoDuplicates!0 lt!461154 #b00000000000000000000000000000000 Nil!22050)))

(declare-fun lt!461148 () Unit!34023)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65819 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22053) Unit!34023)

(assert (=> b!1045081 (= lt!461148 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461151) #b00000000000000000000000000000000 Nil!22050))))

(declare-fun arrayCountValidKeys!0 (array!65819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045081 (= (arrayCountValidKeys!0 lt!461154 #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045081 (= lt!461154 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun lt!461147 () Unit!34023)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65819 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> b!1045081 (= lt!461147 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045082 () Bool)

(assert (=> b!1045082 (= e!592368 e!592369)))

(declare-fun res!695935 () Bool)

(assert (=> b!1045082 (=> (not res!695935) (not e!592369))))

(get-info :version)

(assert (=> b!1045082 (= res!695935 ((_ is Found!9846) lt!461151))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65819 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045082 (= lt!461151 (seekEntry!0 key!909 (_keys!11680 thiss!1427) (mask!30534 thiss!1427)))))

(declare-fun b!1045083 () Bool)

(declare-fun e!592370 () Bool)

(declare-fun e!592367 () Bool)

(assert (=> b!1045083 (= e!592370 (and e!592367 mapRes!38918))))

(declare-fun condMapEmpty!38918 () Bool)

(declare-fun mapDefault!38918 () ValueCell!11723)

(assert (=> b!1045083 (= condMapEmpty!38918 (= (arr!31657 (_values!6437 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11723)) mapDefault!38918)))))

(declare-fun mapIsEmpty!38918 () Bool)

(assert (=> mapIsEmpty!38918 mapRes!38918))

(declare-fun res!695939 () Bool)

(assert (=> start!91890 (=> (not res!695939) (not e!592368))))

(declare-fun valid!2261 (LongMapFixedSize!6040) Bool)

(assert (=> start!91890 (= res!695939 (valid!2261 thiss!1427))))

(assert (=> start!91890 e!592368))

(declare-fun e!592374 () Bool)

(assert (=> start!91890 e!592374))

(assert (=> start!91890 true))

(declare-fun tp_is_empty!24853 () Bool)

(declare-fun array_inv!24461 (array!65819) Bool)

(declare-fun array_inv!24462 (array!65821) Bool)

(assert (=> b!1045084 (= e!592374 (and tp!74654 tp_is_empty!24853 (array_inv!24461 (_keys!11680 thiss!1427)) (array_inv!24462 (_values!6437 thiss!1427)) e!592370))))

(declare-fun b!1045085 () Bool)

(assert (=> b!1045085 (= e!592372 tp_is_empty!24853)))

(declare-fun b!1045086 () Bool)

(assert (=> b!1045086 (= e!592367 tp_is_empty!24853)))

(declare-fun b!1045087 () Bool)

(assert (=> b!1045087 (= e!592373 (or (not (= (size!32194 (_values!6437 (_2!7938 lt!461146))) (bvadd #b00000000000000000000000000000001 (mask!30534 (_2!7938 lt!461146))))) (not (= (size!32193 (_keys!11680 (_2!7938 lt!461146))) (size!32194 (_values!6437 (_2!7938 lt!461146))))) (bvslt (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000000000000) (bvsge (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000000)))))

(assert (= (and start!91890 res!695939) b!1045079))

(assert (= (and b!1045079 res!695938) b!1045082))

(assert (= (and b!1045082 res!695935) b!1045081))

(assert (= (and b!1045081 (not res!695937)) b!1045080))

(assert (= (and b!1045080 (not res!695936)) b!1045087))

(assert (= (and b!1045083 condMapEmpty!38918) mapIsEmpty!38918))

(assert (= (and b!1045083 (not condMapEmpty!38918)) mapNonEmpty!38918))

(assert (= (and mapNonEmpty!38918 ((_ is ValueCellFull!11723) mapValue!38918)) b!1045085))

(assert (= (and b!1045083 ((_ is ValueCellFull!11723) mapDefault!38918)) b!1045086))

(assert (= b!1045084 b!1045083))

(assert (= start!91890 b!1045084))

(declare-fun b_lambda!16263 () Bool)

(assert (=> (not b_lambda!16263) (not b!1045081)))

(declare-fun t!31302 () Bool)

(declare-fun tb!7073 () Bool)

(assert (=> (and b!1045084 (= (defaultEntry!6414 thiss!1427) (defaultEntry!6414 thiss!1427)) t!31302) tb!7073))

(declare-fun result!14579 () Bool)

(assert (=> tb!7073 (= result!14579 tp_is_empty!24853)))

(assert (=> b!1045081 t!31302))

(declare-fun b_and!33721 () Bool)

(assert (= b_and!33719 (and (=> t!31302 result!14579) b_and!33721)))

(declare-fun m!964251 () Bool)

(assert (=> b!1045080 m!964251))

(declare-fun m!964253 () Bool)

(assert (=> b!1045082 m!964253))

(declare-fun m!964255 () Bool)

(assert (=> mapNonEmpty!38918 m!964255))

(declare-fun m!964257 () Bool)

(assert (=> b!1045084 m!964257))

(declare-fun m!964259 () Bool)

(assert (=> b!1045084 m!964259))

(declare-fun m!964261 () Bool)

(assert (=> b!1045081 m!964261))

(declare-fun m!964263 () Bool)

(assert (=> b!1045081 m!964263))

(declare-fun m!964265 () Bool)

(assert (=> b!1045081 m!964265))

(declare-fun m!964267 () Bool)

(assert (=> b!1045081 m!964267))

(declare-fun m!964269 () Bool)

(assert (=> b!1045081 m!964269))

(declare-fun m!964271 () Bool)

(assert (=> b!1045081 m!964271))

(declare-fun m!964273 () Bool)

(assert (=> b!1045081 m!964273))

(declare-fun m!964275 () Bool)

(assert (=> b!1045081 m!964275))

(declare-fun m!964277 () Bool)

(assert (=> b!1045081 m!964277))

(declare-fun m!964279 () Bool)

(assert (=> b!1045081 m!964279))

(declare-fun m!964281 () Bool)

(assert (=> b!1045081 m!964281))

(declare-fun m!964283 () Bool)

(assert (=> b!1045081 m!964283))

(declare-fun m!964285 () Bool)

(assert (=> b!1045081 m!964285))

(assert (=> b!1045081 m!964283))

(declare-fun m!964287 () Bool)

(assert (=> b!1045081 m!964287))

(assert (=> b!1045081 m!964281))

(declare-fun m!964289 () Bool)

(assert (=> b!1045081 m!964289))

(declare-fun m!964291 () Bool)

(assert (=> b!1045081 m!964291))

(declare-fun m!964293 () Bool)

(assert (=> b!1045081 m!964293))

(declare-fun m!964295 () Bool)

(assert (=> b!1045081 m!964295))

(declare-fun m!964297 () Bool)

(assert (=> start!91890 m!964297))

(check-sat (not b!1045081) (not b!1045080) tp_is_empty!24853 (not b_lambda!16263) (not start!91890) (not b!1045084) b_and!33721 (not b!1045082) (not b_next!21133) (not mapNonEmpty!38918))
(check-sat b_and!33721 (not b_next!21133))
(get-model)

(declare-fun b_lambda!16269 () Bool)

(assert (= b_lambda!16263 (or (and b!1045084 b_free!21133) b_lambda!16269)))

(check-sat (not b!1045081) (not b!1045080) tp_is_empty!24853 (not start!91890) (not b!1045084) b_and!33721 (not b_next!21133) (not mapNonEmpty!38918) (not b!1045082) (not b_lambda!16269))
(check-sat b_and!33721 (not b_next!21133))
(get-model)

(declare-fun b!1045160 () Bool)

(declare-fun e!592431 () SeekEntryResult!9846)

(declare-fun e!592429 () SeekEntryResult!9846)

(assert (=> b!1045160 (= e!592431 e!592429)))

(declare-fun lt!461217 () (_ BitVec 64))

(declare-fun lt!461220 () SeekEntryResult!9846)

(assert (=> b!1045160 (= lt!461217 (select (arr!31656 (_keys!11680 thiss!1427)) (index!41757 lt!461220)))))

(declare-fun c!106218 () Bool)

(assert (=> b!1045160 (= c!106218 (= lt!461217 key!909))))

(declare-fun b!1045161 () Bool)

(declare-fun e!592430 () SeekEntryResult!9846)

(declare-fun lt!461219 () SeekEntryResult!9846)

(assert (=> b!1045161 (= e!592430 (ite ((_ is MissingVacant!9846) lt!461219) (MissingZero!9846 (index!41758 lt!461219)) lt!461219))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65819 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045161 (= lt!461219 (seekKeyOrZeroReturnVacant!0 (x!93353 lt!461220) (index!41757 lt!461220) (index!41757 lt!461220) key!909 (_keys!11680 thiss!1427) (mask!30534 thiss!1427)))))

(declare-fun b!1045162 () Bool)

(assert (=> b!1045162 (= e!592431 Undefined!9846)))

(declare-fun b!1045163 () Bool)

(assert (=> b!1045163 (= e!592429 (Found!9846 (index!41757 lt!461220)))))

(declare-fun b!1045164 () Bool)

(assert (=> b!1045164 (= e!592430 (MissingZero!9846 (index!41757 lt!461220)))))

(declare-fun d!126351 () Bool)

(declare-fun lt!461218 () SeekEntryResult!9846)

(assert (=> d!126351 (and (or ((_ is MissingVacant!9846) lt!461218) (not ((_ is Found!9846) lt!461218)) (and (bvsge (index!41756 lt!461218) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461218) (size!32193 (_keys!11680 thiss!1427))))) (not ((_ is MissingVacant!9846) lt!461218)) (or (not ((_ is Found!9846) lt!461218)) (= (select (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461218)) key!909)))))

(assert (=> d!126351 (= lt!461218 e!592431)))

(declare-fun c!106219 () Bool)

(assert (=> d!126351 (= c!106219 (and ((_ is Intermediate!9846) lt!461220) (undefined!10658 lt!461220)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65819 (_ BitVec 32)) SeekEntryResult!9846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126351 (= lt!461220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30534 thiss!1427)) key!909 (_keys!11680 thiss!1427) (mask!30534 thiss!1427)))))

(assert (=> d!126351 (validMask!0 (mask!30534 thiss!1427))))

(assert (=> d!126351 (= (seekEntry!0 key!909 (_keys!11680 thiss!1427) (mask!30534 thiss!1427)) lt!461218)))

(declare-fun b!1045165 () Bool)

(declare-fun c!106220 () Bool)

(assert (=> b!1045165 (= c!106220 (= lt!461217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1045165 (= e!592429 e!592430)))

(assert (= (and d!126351 c!106219) b!1045162))

(assert (= (and d!126351 (not c!106219)) b!1045160))

(assert (= (and b!1045160 c!106218) b!1045163))

(assert (= (and b!1045160 (not c!106218)) b!1045165))

(assert (= (and b!1045165 c!106220) b!1045164))

(assert (= (and b!1045165 (not c!106220)) b!1045161))

(declare-fun m!964395 () Bool)

(assert (=> b!1045160 m!964395))

(declare-fun m!964397 () Bool)

(assert (=> b!1045161 m!964397))

(declare-fun m!964399 () Bool)

(assert (=> d!126351 m!964399))

(declare-fun m!964401 () Bool)

(assert (=> d!126351 m!964401))

(assert (=> d!126351 m!964401))

(declare-fun m!964403 () Bool)

(assert (=> d!126351 m!964403))

(declare-fun m!964405 () Bool)

(assert (=> d!126351 m!964405))

(assert (=> b!1045082 d!126351))

(declare-fun d!126353 () Bool)

(declare-fun e!592436 () Bool)

(assert (=> d!126353 e!592436))

(declare-fun res!695972 () Bool)

(assert (=> d!126353 (=> res!695972 e!592436)))

(declare-fun lt!461232 () Bool)

(assert (=> d!126353 (= res!695972 (not lt!461232))))

(declare-fun lt!461229 () Bool)

(assert (=> d!126353 (= lt!461232 lt!461229)))

(declare-fun lt!461231 () Unit!34023)

(declare-fun e!592437 () Unit!34023)

(assert (=> d!126353 (= lt!461231 e!592437)))

(declare-fun c!106223 () Bool)

(assert (=> d!126353 (= c!106223 lt!461229)))

(declare-fun containsKey!569 (List!22052 (_ BitVec 64)) Bool)

(assert (=> d!126353 (= lt!461229 (containsKey!569 (toList!6945 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146)))) key!909))))

(assert (=> d!126353 (= (contains!6057 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))) key!909) lt!461232)))

(declare-fun b!1045172 () Bool)

(declare-fun lt!461230 () Unit!34023)

(assert (=> b!1045172 (= e!592437 lt!461230)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!401 (List!22052 (_ BitVec 64)) Unit!34023)

(assert (=> b!1045172 (= lt!461230 (lemmaContainsKeyImpliesGetValueByKeyDefined!401 (toList!6945 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146)))) key!909))))

(declare-datatypes ((Option!647 0))(
  ( (Some!646 (v!15074 V!38011)) (None!645) )
))
(declare-fun isDefined!444 (Option!647) Bool)

(declare-fun getValueByKey!596 (List!22052 (_ BitVec 64)) Option!647)

(assert (=> b!1045172 (isDefined!444 (getValueByKey!596 (toList!6945 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146)))) key!909))))

(declare-fun b!1045173 () Bool)

(declare-fun Unit!34029 () Unit!34023)

(assert (=> b!1045173 (= e!592437 Unit!34029)))

(declare-fun b!1045174 () Bool)

(assert (=> b!1045174 (= e!592436 (isDefined!444 (getValueByKey!596 (toList!6945 (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146)))) key!909)))))

(assert (= (and d!126353 c!106223) b!1045172))

(assert (= (and d!126353 (not c!106223)) b!1045173))

(assert (= (and d!126353 (not res!695972)) b!1045174))

(declare-fun m!964407 () Bool)

(assert (=> d!126353 m!964407))

(declare-fun m!964409 () Bool)

(assert (=> b!1045172 m!964409))

(declare-fun m!964411 () Bool)

(assert (=> b!1045172 m!964411))

(assert (=> b!1045172 m!964411))

(declare-fun m!964413 () Bool)

(assert (=> b!1045172 m!964413))

(assert (=> b!1045174 m!964411))

(assert (=> b!1045174 m!964411))

(assert (=> b!1045174 m!964413))

(assert (=> b!1045081 d!126353))

(declare-fun bm!44467 () Bool)

(declare-fun call!44475 () Bool)

(declare-fun lt!461285 () ListLongMap!13859)

(assert (=> bm!44467 (= call!44475 (contains!6057 lt!461285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045217 () Bool)

(declare-fun e!592472 () Bool)

(declare-fun apply!907 (ListLongMap!13859 (_ BitVec 64)) V!38011)

(assert (=> b!1045217 (= e!592472 (= (apply!907 lt!461285 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 (_2!7938 lt!461146))))))

(declare-fun b!1045218 () Bool)

(declare-fun res!695994 () Bool)

(declare-fun e!592465 () Bool)

(assert (=> b!1045218 (=> (not res!695994) (not e!592465))))

(declare-fun e!592471 () Bool)

(assert (=> b!1045218 (= res!695994 e!592471)))

(declare-fun c!106241 () Bool)

(assert (=> b!1045218 (= c!106241 (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045219 () Bool)

(declare-fun e!592476 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045219 (= e!592476 (validKeyInArray!0 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000)))))

(declare-fun b!1045221 () Bool)

(declare-fun e!592474 () ListLongMap!13859)

(declare-fun call!44470 () ListLongMap!13859)

(declare-fun +!3138 (ListLongMap!13859 tuple2!15856) ListLongMap!13859)

(assert (=> b!1045221 (= e!592474 (+!3138 call!44470 (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 (_2!7938 lt!461146)))))))

(declare-fun b!1045222 () Bool)

(declare-fun e!592475 () Unit!34023)

(declare-fun Unit!34030 () Unit!34023)

(assert (=> b!1045222 (= e!592475 Unit!34030)))

(declare-fun b!1045223 () Bool)

(declare-fun res!695995 () Bool)

(assert (=> b!1045223 (=> (not res!695995) (not e!592465))))

(declare-fun e!592467 () Bool)

(assert (=> b!1045223 (= res!695995 e!592467)))

(declare-fun res!695992 () Bool)

(assert (=> b!1045223 (=> res!695992 e!592467)))

(assert (=> b!1045223 (= res!695992 (not e!592476))))

(declare-fun res!695993 () Bool)

(assert (=> b!1045223 (=> (not res!695993) (not e!592476))))

(assert (=> b!1045223 (= res!695993 (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))))))

(declare-fun b!1045224 () Bool)

(declare-fun c!106240 () Bool)

(assert (=> b!1045224 (= c!106240 (and (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592469 () ListLongMap!13859)

(declare-fun e!592468 () ListLongMap!13859)

(assert (=> b!1045224 (= e!592469 e!592468)))

(declare-fun b!1045225 () Bool)

(assert (=> b!1045225 (= e!592471 e!592472)))

(declare-fun res!695991 () Bool)

(declare-fun call!44472 () Bool)

(assert (=> b!1045225 (= res!695991 call!44472)))

(assert (=> b!1045225 (=> (not res!695991) (not e!592472))))

(declare-fun b!1045226 () Bool)

(declare-fun e!592466 () Bool)

(assert (=> b!1045226 (= e!592465 e!592466)))

(declare-fun c!106237 () Bool)

(assert (=> b!1045226 (= c!106237 (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045227 () Bool)

(declare-fun e!592470 () Bool)

(assert (=> b!1045227 (= e!592470 (= (apply!907 lt!461285 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 (_2!7938 lt!461146))))))

(declare-fun bm!44468 () Bool)

(declare-fun call!44474 () ListLongMap!13859)

(declare-fun call!44473 () ListLongMap!13859)

(assert (=> bm!44468 (= call!44474 call!44473)))

(declare-fun b!1045228 () Bool)

(assert (=> b!1045228 (= e!592471 (not call!44472))))

(declare-fun b!1045229 () Bool)

(assert (=> b!1045229 (= e!592466 e!592470)))

(declare-fun res!695996 () Bool)

(assert (=> b!1045229 (= res!695996 call!44475)))

(assert (=> b!1045229 (=> (not res!695996) (not e!592470))))

(declare-fun b!1045230 () Bool)

(declare-fun e!592473 () Bool)

(assert (=> b!1045230 (= e!592473 (validKeyInArray!0 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000)))))

(declare-fun b!1045231 () Bool)

(declare-fun call!44476 () ListLongMap!13859)

(assert (=> b!1045231 (= e!592468 call!44476)))

(declare-fun b!1045232 () Bool)

(declare-fun lt!461277 () Unit!34023)

(assert (=> b!1045232 (= e!592475 lt!461277)))

(declare-fun lt!461297 () ListLongMap!13859)

(declare-fun getCurrentListMapNoExtraKeys!3573 (array!65819 array!65821 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) Int) ListLongMap!13859)

(assert (=> b!1045232 (= lt!461297 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))))))

(declare-fun lt!461298 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461289 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461289 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000))))

(declare-fun lt!461290 () Unit!34023)

(declare-fun addStillContains!626 (ListLongMap!13859 (_ BitVec 64) V!38011 (_ BitVec 64)) Unit!34023)

(assert (=> b!1045232 (= lt!461290 (addStillContains!626 lt!461297 lt!461298 (zeroValue!6248 (_2!7938 lt!461146)) lt!461289))))

(assert (=> b!1045232 (contains!6057 (+!3138 lt!461297 (tuple2!15857 lt!461298 (zeroValue!6248 (_2!7938 lt!461146)))) lt!461289)))

(declare-fun lt!461278 () Unit!34023)

(assert (=> b!1045232 (= lt!461278 lt!461290)))

(declare-fun lt!461296 () ListLongMap!13859)

(assert (=> b!1045232 (= lt!461296 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))))))

(declare-fun lt!461281 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461286 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461286 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000))))

(declare-fun lt!461292 () Unit!34023)

(declare-fun addApplyDifferent!482 (ListLongMap!13859 (_ BitVec 64) V!38011 (_ BitVec 64)) Unit!34023)

(assert (=> b!1045232 (= lt!461292 (addApplyDifferent!482 lt!461296 lt!461281 (minValue!6248 (_2!7938 lt!461146)) lt!461286))))

(assert (=> b!1045232 (= (apply!907 (+!3138 lt!461296 (tuple2!15857 lt!461281 (minValue!6248 (_2!7938 lt!461146)))) lt!461286) (apply!907 lt!461296 lt!461286))))

(declare-fun lt!461287 () Unit!34023)

(assert (=> b!1045232 (= lt!461287 lt!461292)))

(declare-fun lt!461291 () ListLongMap!13859)

(assert (=> b!1045232 (= lt!461291 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))))))

(declare-fun lt!461282 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461295 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461295 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000))))

(declare-fun lt!461280 () Unit!34023)

(assert (=> b!1045232 (= lt!461280 (addApplyDifferent!482 lt!461291 lt!461282 (zeroValue!6248 (_2!7938 lt!461146)) lt!461295))))

(assert (=> b!1045232 (= (apply!907 (+!3138 lt!461291 (tuple2!15857 lt!461282 (zeroValue!6248 (_2!7938 lt!461146)))) lt!461295) (apply!907 lt!461291 lt!461295))))

(declare-fun lt!461283 () Unit!34023)

(assert (=> b!1045232 (= lt!461283 lt!461280)))

(declare-fun lt!461279 () ListLongMap!13859)

(assert (=> b!1045232 (= lt!461279 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))))))

(declare-fun lt!461294 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461293 () (_ BitVec 64))

(assert (=> b!1045232 (= lt!461293 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000))))

(assert (=> b!1045232 (= lt!461277 (addApplyDifferent!482 lt!461279 lt!461294 (minValue!6248 (_2!7938 lt!461146)) lt!461293))))

(assert (=> b!1045232 (= (apply!907 (+!3138 lt!461279 (tuple2!15857 lt!461294 (minValue!6248 (_2!7938 lt!461146)))) lt!461293) (apply!907 lt!461279 lt!461293))))

(declare-fun b!1045220 () Bool)

(declare-fun e!592464 () Bool)

(declare-fun get!16554 (ValueCell!11723 V!38011) V!38011)

(assert (=> b!1045220 (= e!592464 (= (apply!907 lt!461285 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000)) (get!16554 (select (arr!31657 (_values!6437 (_2!7938 lt!461146))) #b00000000000000000000000000000000) (dynLambda!1998 (defaultEntry!6414 (_2!7938 lt!461146)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045220 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 (_values!6437 (_2!7938 lt!461146)))))))

(assert (=> b!1045220 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))))))

(declare-fun d!126355 () Bool)

(assert (=> d!126355 e!592465))

(declare-fun res!695999 () Bool)

(assert (=> d!126355 (=> (not res!695999) (not e!592465))))

(assert (=> d!126355 (= res!695999 (or (bvsge #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))))))))

(declare-fun lt!461288 () ListLongMap!13859)

(assert (=> d!126355 (= lt!461285 lt!461288)))

(declare-fun lt!461284 () Unit!34023)

(assert (=> d!126355 (= lt!461284 e!592475)))

(declare-fun c!106238 () Bool)

(assert (=> d!126355 (= c!106238 e!592473)))

(declare-fun res!695998 () Bool)

(assert (=> d!126355 (=> (not res!695998) (not e!592473))))

(assert (=> d!126355 (= res!695998 (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))))))

(assert (=> d!126355 (= lt!461288 e!592474)))

(declare-fun c!106239 () Bool)

(assert (=> d!126355 (= c!106239 (and (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126355 (validMask!0 (mask!30534 (_2!7938 lt!461146)))))

(assert (=> d!126355 (= (getCurrentListMap!3911 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))) lt!461285)))

(declare-fun bm!44469 () Bool)

(declare-fun call!44471 () ListLongMap!13859)

(assert (=> bm!44469 (= call!44471 call!44470)))

(declare-fun bm!44470 () Bool)

(assert (=> bm!44470 (= call!44472 (contains!6057 lt!461285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045233 () Bool)

(assert (=> b!1045233 (= e!592469 call!44471)))

(declare-fun bm!44471 () Bool)

(declare-fun c!106236 () Bool)

(assert (=> bm!44471 (= call!44470 (+!3138 (ite c!106239 call!44473 (ite c!106236 call!44474 call!44476)) (ite (or c!106239 c!106236) (tuple2!15857 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 (_2!7938 lt!461146))) (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 (_2!7938 lt!461146))))))))

(declare-fun bm!44472 () Bool)

(assert (=> bm!44472 (= call!44476 call!44474)))

(declare-fun b!1045234 () Bool)

(assert (=> b!1045234 (= e!592466 (not call!44475))))

(declare-fun b!1045235 () Bool)

(assert (=> b!1045235 (= e!592467 e!592464)))

(declare-fun res!695997 () Bool)

(assert (=> b!1045235 (=> (not res!695997) (not e!592464))))

(assert (=> b!1045235 (= res!695997 (contains!6057 lt!461285 (select (arr!31656 (_keys!11680 (_2!7938 lt!461146))) #b00000000000000000000000000000000)))))

(assert (=> b!1045235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 (_2!7938 lt!461146)))))))

(declare-fun b!1045236 () Bool)

(assert (=> b!1045236 (= e!592474 e!592469)))

(assert (=> b!1045236 (= c!106236 (and (not (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 (_2!7938 lt!461146)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44473 () Bool)

(assert (=> bm!44473 (= call!44473 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 (_2!7938 lt!461146)) (_values!6437 (_2!7938 lt!461146)) (mask!30534 (_2!7938 lt!461146)) (extraKeys!6142 (_2!7938 lt!461146)) (zeroValue!6248 (_2!7938 lt!461146)) (minValue!6248 (_2!7938 lt!461146)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7938 lt!461146))))))

(declare-fun b!1045237 () Bool)

(assert (=> b!1045237 (= e!592468 call!44471)))

(assert (= (and d!126355 c!106239) b!1045221))

(assert (= (and d!126355 (not c!106239)) b!1045236))

(assert (= (and b!1045236 c!106236) b!1045233))

(assert (= (and b!1045236 (not c!106236)) b!1045224))

(assert (= (and b!1045224 c!106240) b!1045237))

(assert (= (and b!1045224 (not c!106240)) b!1045231))

(assert (= (or b!1045237 b!1045231) bm!44472))

(assert (= (or b!1045233 bm!44472) bm!44468))

(assert (= (or b!1045233 b!1045237) bm!44469))

(assert (= (or b!1045221 bm!44468) bm!44473))

(assert (= (or b!1045221 bm!44469) bm!44471))

(assert (= (and d!126355 res!695998) b!1045230))

(assert (= (and d!126355 c!106238) b!1045232))

(assert (= (and d!126355 (not c!106238)) b!1045222))

(assert (= (and d!126355 res!695999) b!1045223))

(assert (= (and b!1045223 res!695993) b!1045219))

(assert (= (and b!1045223 (not res!695992)) b!1045235))

(assert (= (and b!1045235 res!695997) b!1045220))

(assert (= (and b!1045223 res!695995) b!1045218))

(assert (= (and b!1045218 c!106241) b!1045225))

(assert (= (and b!1045218 (not c!106241)) b!1045228))

(assert (= (and b!1045225 res!695991) b!1045217))

(assert (= (or b!1045225 b!1045228) bm!44470))

(assert (= (and b!1045218 res!695994) b!1045226))

(assert (= (and b!1045226 c!106237) b!1045229))

(assert (= (and b!1045226 (not c!106237)) b!1045234))

(assert (= (and b!1045229 res!695996) b!1045227))

(assert (= (or b!1045229 b!1045234) bm!44467))

(declare-fun b_lambda!16271 () Bool)

(assert (=> (not b_lambda!16271) (not b!1045220)))

(declare-fun tb!7079 () Bool)

(declare-fun t!31310 () Bool)

(assert (=> (and b!1045084 (= (defaultEntry!6414 thiss!1427) (defaultEntry!6414 (_2!7938 lt!461146))) t!31310) tb!7079))

(declare-fun result!14591 () Bool)

(assert (=> tb!7079 (= result!14591 tp_is_empty!24853)))

(assert (=> b!1045220 t!31310))

(declare-fun b_and!33731 () Bool)

(assert (= b_and!33721 (and (=> t!31310 result!14591) b_and!33731)))

(declare-fun m!964415 () Bool)

(assert (=> b!1045227 m!964415))

(declare-fun m!964417 () Bool)

(assert (=> b!1045232 m!964417))

(declare-fun m!964419 () Bool)

(assert (=> b!1045232 m!964419))

(declare-fun m!964421 () Bool)

(assert (=> b!1045232 m!964421))

(declare-fun m!964423 () Bool)

(assert (=> b!1045232 m!964423))

(declare-fun m!964425 () Bool)

(assert (=> b!1045232 m!964425))

(declare-fun m!964427 () Bool)

(assert (=> b!1045232 m!964427))

(declare-fun m!964429 () Bool)

(assert (=> b!1045232 m!964429))

(declare-fun m!964431 () Bool)

(assert (=> b!1045232 m!964431))

(declare-fun m!964433 () Bool)

(assert (=> b!1045232 m!964433))

(declare-fun m!964435 () Bool)

(assert (=> b!1045232 m!964435))

(declare-fun m!964437 () Bool)

(assert (=> b!1045232 m!964437))

(declare-fun m!964439 () Bool)

(assert (=> b!1045232 m!964439))

(declare-fun m!964441 () Bool)

(assert (=> b!1045232 m!964441))

(assert (=> b!1045232 m!964431))

(declare-fun m!964443 () Bool)

(assert (=> b!1045232 m!964443))

(declare-fun m!964445 () Bool)

(assert (=> b!1045232 m!964445))

(declare-fun m!964447 () Bool)

(assert (=> b!1045232 m!964447))

(assert (=> b!1045232 m!964435))

(declare-fun m!964449 () Bool)

(assert (=> b!1045232 m!964449))

(assert (=> b!1045232 m!964419))

(assert (=> b!1045232 m!964439))

(declare-fun m!964451 () Bool)

(assert (=> bm!44470 m!964451))

(declare-fun m!964453 () Bool)

(assert (=> b!1045217 m!964453))

(assert (=> d!126355 m!964251))

(assert (=> b!1045219 m!964427))

(assert (=> b!1045219 m!964427))

(declare-fun m!964455 () Bool)

(assert (=> b!1045219 m!964455))

(assert (=> b!1045235 m!964427))

(assert (=> b!1045235 m!964427))

(declare-fun m!964457 () Bool)

(assert (=> b!1045235 m!964457))

(declare-fun m!964459 () Bool)

(assert (=> bm!44471 m!964459))

(assert (=> bm!44473 m!964425))

(declare-fun m!964461 () Bool)

(assert (=> b!1045221 m!964461))

(declare-fun m!964463 () Bool)

(assert (=> bm!44467 m!964463))

(assert (=> b!1045220 m!964427))

(declare-fun m!964465 () Bool)

(assert (=> b!1045220 m!964465))

(declare-fun m!964467 () Bool)

(assert (=> b!1045220 m!964467))

(declare-fun m!964469 () Bool)

(assert (=> b!1045220 m!964469))

(declare-fun m!964471 () Bool)

(assert (=> b!1045220 m!964471))

(assert (=> b!1045220 m!964469))

(assert (=> b!1045220 m!964427))

(assert (=> b!1045220 m!964467))

(assert (=> b!1045230 m!964427))

(assert (=> b!1045230 m!964427))

(assert (=> b!1045230 m!964455))

(assert (=> b!1045081 d!126355))

(declare-fun bm!44476 () Bool)

(declare-fun call!44479 () Bool)

(declare-fun c!106244 () Bool)

(assert (=> bm!44476 (= call!44479 (arrayNoDuplicates!0 lt!461154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106244 (Cons!22049 (select (arr!31656 lt!461154) #b00000000000000000000000000000000) Nil!22050) Nil!22050)))))

(declare-fun b!1045248 () Bool)

(declare-fun e!592488 () Bool)

(declare-fun e!592486 () Bool)

(assert (=> b!1045248 (= e!592488 e!592486)))

(declare-fun res!696006 () Bool)

(assert (=> b!1045248 (=> (not res!696006) (not e!592486))))

(declare-fun e!592485 () Bool)

(assert (=> b!1045248 (= res!696006 (not e!592485))))

(declare-fun res!696007 () Bool)

(assert (=> b!1045248 (=> (not res!696007) (not e!592485))))

(assert (=> b!1045248 (= res!696007 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun b!1045249 () Bool)

(declare-fun e!592487 () Bool)

(assert (=> b!1045249 (= e!592487 call!44479)))

(declare-fun d!126357 () Bool)

(declare-fun res!696008 () Bool)

(assert (=> d!126357 (=> res!696008 e!592488)))

(assert (=> d!126357 (= res!696008 (bvsge #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(assert (=> d!126357 (= (arrayNoDuplicates!0 lt!461154 #b00000000000000000000000000000000 Nil!22050) e!592488)))

(declare-fun b!1045250 () Bool)

(assert (=> b!1045250 (= e!592487 call!44479)))

(declare-fun b!1045251 () Bool)

(assert (=> b!1045251 (= e!592486 e!592487)))

(assert (=> b!1045251 (= c!106244 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun b!1045252 () Bool)

(declare-fun contains!6058 (List!22053 (_ BitVec 64)) Bool)

(assert (=> b!1045252 (= e!592485 (contains!6058 Nil!22050 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(assert (= (and d!126357 (not res!696008)) b!1045248))

(assert (= (and b!1045248 res!696007) b!1045252))

(assert (= (and b!1045248 res!696006) b!1045251))

(assert (= (and b!1045251 c!106244) b!1045250))

(assert (= (and b!1045251 (not c!106244)) b!1045249))

(assert (= (or b!1045250 b!1045249) bm!44476))

(declare-fun m!964473 () Bool)

(assert (=> bm!44476 m!964473))

(declare-fun m!964475 () Bool)

(assert (=> bm!44476 m!964475))

(assert (=> b!1045248 m!964473))

(assert (=> b!1045248 m!964473))

(declare-fun m!964477 () Bool)

(assert (=> b!1045248 m!964477))

(assert (=> b!1045251 m!964473))

(assert (=> b!1045251 m!964473))

(assert (=> b!1045251 m!964477))

(assert (=> b!1045252 m!964473))

(assert (=> b!1045252 m!964473))

(declare-fun m!964479 () Bool)

(assert (=> b!1045252 m!964479))

(assert (=> b!1045081 d!126357))

(declare-fun bm!44477 () Bool)

(declare-fun call!44485 () Bool)

(declare-fun lt!461307 () ListLongMap!13859)

(assert (=> bm!44477 (= call!44485 (contains!6057 lt!461307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045253 () Bool)

(declare-fun e!592497 () Bool)

(assert (=> b!1045253 (= e!592497 (= (apply!907 lt!461307 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 thiss!1427)))))

(declare-fun b!1045254 () Bool)

(declare-fun res!696012 () Bool)

(declare-fun e!592490 () Bool)

(assert (=> b!1045254 (=> (not res!696012) (not e!592490))))

(declare-fun e!592496 () Bool)

(assert (=> b!1045254 (= res!696012 e!592496)))

(declare-fun c!106250 () Bool)

(assert (=> b!1045254 (= c!106250 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045255 () Bool)

(declare-fun e!592501 () Bool)

(assert (=> b!1045255 (= e!592501 (validKeyInArray!0 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045257 () Bool)

(declare-fun e!592499 () ListLongMap!13859)

(declare-fun call!44480 () ListLongMap!13859)

(assert (=> b!1045257 (= e!592499 (+!3138 call!44480 (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427))))))

(declare-fun b!1045258 () Bool)

(declare-fun e!592500 () Unit!34023)

(declare-fun Unit!34031 () Unit!34023)

(assert (=> b!1045258 (= e!592500 Unit!34031)))

(declare-fun b!1045259 () Bool)

(declare-fun res!696013 () Bool)

(assert (=> b!1045259 (=> (not res!696013) (not e!592490))))

(declare-fun e!592492 () Bool)

(assert (=> b!1045259 (= res!696013 e!592492)))

(declare-fun res!696010 () Bool)

(assert (=> b!1045259 (=> res!696010 e!592492)))

(assert (=> b!1045259 (= res!696010 (not e!592501))))

(declare-fun res!696011 () Bool)

(assert (=> b!1045259 (=> (not res!696011) (not e!592501))))

(assert (=> b!1045259 (= res!696011 (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun b!1045260 () Bool)

(declare-fun c!106249 () Bool)

(assert (=> b!1045260 (= c!106249 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592494 () ListLongMap!13859)

(declare-fun e!592493 () ListLongMap!13859)

(assert (=> b!1045260 (= e!592494 e!592493)))

(declare-fun b!1045261 () Bool)

(assert (=> b!1045261 (= e!592496 e!592497)))

(declare-fun res!696009 () Bool)

(declare-fun call!44482 () Bool)

(assert (=> b!1045261 (= res!696009 call!44482)))

(assert (=> b!1045261 (=> (not res!696009) (not e!592497))))

(declare-fun b!1045262 () Bool)

(declare-fun e!592491 () Bool)

(assert (=> b!1045262 (= e!592490 e!592491)))

(declare-fun c!106246 () Bool)

(assert (=> b!1045262 (= c!106246 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045263 () Bool)

(declare-fun e!592495 () Bool)

(assert (=> b!1045263 (= e!592495 (= (apply!907 lt!461307 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 thiss!1427)))))

(declare-fun bm!44478 () Bool)

(declare-fun call!44484 () ListLongMap!13859)

(declare-fun call!44483 () ListLongMap!13859)

(assert (=> bm!44478 (= call!44484 call!44483)))

(declare-fun b!1045264 () Bool)

(assert (=> b!1045264 (= e!592496 (not call!44482))))

(declare-fun b!1045265 () Bool)

(assert (=> b!1045265 (= e!592491 e!592495)))

(declare-fun res!696014 () Bool)

(assert (=> b!1045265 (= res!696014 call!44485)))

(assert (=> b!1045265 (=> (not res!696014) (not e!592495))))

(declare-fun b!1045266 () Bool)

(declare-fun e!592498 () Bool)

(assert (=> b!1045266 (= e!592498 (validKeyInArray!0 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045267 () Bool)

(declare-fun call!44486 () ListLongMap!13859)

(assert (=> b!1045267 (= e!592493 call!44486)))

(declare-fun b!1045268 () Bool)

(declare-fun lt!461299 () Unit!34023)

(assert (=> b!1045268 (= e!592500 lt!461299)))

(declare-fun lt!461319 () ListLongMap!13859)

(assert (=> b!1045268 (= lt!461319 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461320 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461311 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461311 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461312 () Unit!34023)

(assert (=> b!1045268 (= lt!461312 (addStillContains!626 lt!461319 lt!461320 (zeroValue!6248 thiss!1427) lt!461311))))

(assert (=> b!1045268 (contains!6057 (+!3138 lt!461319 (tuple2!15857 lt!461320 (zeroValue!6248 thiss!1427))) lt!461311)))

(declare-fun lt!461300 () Unit!34023)

(assert (=> b!1045268 (= lt!461300 lt!461312)))

(declare-fun lt!461318 () ListLongMap!13859)

(assert (=> b!1045268 (= lt!461318 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461303 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461308 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461308 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461314 () Unit!34023)

(assert (=> b!1045268 (= lt!461314 (addApplyDifferent!482 lt!461318 lt!461303 (minValue!6248 thiss!1427) lt!461308))))

(assert (=> b!1045268 (= (apply!907 (+!3138 lt!461318 (tuple2!15857 lt!461303 (minValue!6248 thiss!1427))) lt!461308) (apply!907 lt!461318 lt!461308))))

(declare-fun lt!461309 () Unit!34023)

(assert (=> b!1045268 (= lt!461309 lt!461314)))

(declare-fun lt!461313 () ListLongMap!13859)

(assert (=> b!1045268 (= lt!461313 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461304 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461317 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461317 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461302 () Unit!34023)

(assert (=> b!1045268 (= lt!461302 (addApplyDifferent!482 lt!461313 lt!461304 (zeroValue!6248 thiss!1427) lt!461317))))

(assert (=> b!1045268 (= (apply!907 (+!3138 lt!461313 (tuple2!15857 lt!461304 (zeroValue!6248 thiss!1427))) lt!461317) (apply!907 lt!461313 lt!461317))))

(declare-fun lt!461305 () Unit!34023)

(assert (=> b!1045268 (= lt!461305 lt!461302)))

(declare-fun lt!461301 () ListLongMap!13859)

(assert (=> b!1045268 (= lt!461301 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461316 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461315 () (_ BitVec 64))

(assert (=> b!1045268 (= lt!461315 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045268 (= lt!461299 (addApplyDifferent!482 lt!461301 lt!461316 (minValue!6248 thiss!1427) lt!461315))))

(assert (=> b!1045268 (= (apply!907 (+!3138 lt!461301 (tuple2!15857 lt!461316 (minValue!6248 thiss!1427))) lt!461315) (apply!907 lt!461301 lt!461315))))

(declare-fun b!1045256 () Bool)

(declare-fun e!592489 () Bool)

(assert (=> b!1045256 (= e!592489 (= (apply!907 lt!461307 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)) (get!16554 (select (arr!31657 (_values!6437 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1998 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 (_values!6437 thiss!1427))))))

(assert (=> b!1045256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun d!126359 () Bool)

(assert (=> d!126359 e!592490))

(declare-fun res!696017 () Bool)

(assert (=> d!126359 (=> (not res!696017) (not e!592490))))

(assert (=> d!126359 (= res!696017 (or (bvsge #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))))

(declare-fun lt!461310 () ListLongMap!13859)

(assert (=> d!126359 (= lt!461307 lt!461310)))

(declare-fun lt!461306 () Unit!34023)

(assert (=> d!126359 (= lt!461306 e!592500)))

(declare-fun c!106247 () Bool)

(assert (=> d!126359 (= c!106247 e!592498)))

(declare-fun res!696016 () Bool)

(assert (=> d!126359 (=> (not res!696016) (not e!592498))))

(assert (=> d!126359 (= res!696016 (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(assert (=> d!126359 (= lt!461310 e!592499)))

(declare-fun c!106248 () Bool)

(assert (=> d!126359 (= c!106248 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126359 (validMask!0 (mask!30534 thiss!1427))))

(assert (=> d!126359 (= (getCurrentListMap!3911 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) lt!461307)))

(declare-fun bm!44479 () Bool)

(declare-fun call!44481 () ListLongMap!13859)

(assert (=> bm!44479 (= call!44481 call!44480)))

(declare-fun bm!44480 () Bool)

(assert (=> bm!44480 (= call!44482 (contains!6057 lt!461307 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045269 () Bool)

(assert (=> b!1045269 (= e!592494 call!44481)))

(declare-fun c!106245 () Bool)

(declare-fun bm!44481 () Bool)

(assert (=> bm!44481 (= call!44480 (+!3138 (ite c!106248 call!44483 (ite c!106245 call!44484 call!44486)) (ite (or c!106248 c!106245) (tuple2!15857 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 thiss!1427)) (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427)))))))

(declare-fun bm!44482 () Bool)

(assert (=> bm!44482 (= call!44486 call!44484)))

(declare-fun b!1045270 () Bool)

(assert (=> b!1045270 (= e!592491 (not call!44485))))

(declare-fun b!1045271 () Bool)

(assert (=> b!1045271 (= e!592492 e!592489)))

(declare-fun res!696015 () Bool)

(assert (=> b!1045271 (=> (not res!696015) (not e!592489))))

(assert (=> b!1045271 (= res!696015 (contains!6057 lt!461307 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045271 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun b!1045272 () Bool)

(assert (=> b!1045272 (= e!592499 e!592494)))

(assert (=> b!1045272 (= c!106245 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44483 () Bool)

(assert (=> bm!44483 (= call!44483 (getCurrentListMapNoExtraKeys!3573 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun b!1045273 () Bool)

(assert (=> b!1045273 (= e!592493 call!44481)))

(assert (= (and d!126359 c!106248) b!1045257))

(assert (= (and d!126359 (not c!106248)) b!1045272))

(assert (= (and b!1045272 c!106245) b!1045269))

(assert (= (and b!1045272 (not c!106245)) b!1045260))

(assert (= (and b!1045260 c!106249) b!1045273))

(assert (= (and b!1045260 (not c!106249)) b!1045267))

(assert (= (or b!1045273 b!1045267) bm!44482))

(assert (= (or b!1045269 bm!44482) bm!44478))

(assert (= (or b!1045269 b!1045273) bm!44479))

(assert (= (or b!1045257 bm!44478) bm!44483))

(assert (= (or b!1045257 bm!44479) bm!44481))

(assert (= (and d!126359 res!696016) b!1045266))

(assert (= (and d!126359 c!106247) b!1045268))

(assert (= (and d!126359 (not c!106247)) b!1045258))

(assert (= (and d!126359 res!696017) b!1045259))

(assert (= (and b!1045259 res!696011) b!1045255))

(assert (= (and b!1045259 (not res!696010)) b!1045271))

(assert (= (and b!1045271 res!696015) b!1045256))

(assert (= (and b!1045259 res!696013) b!1045254))

(assert (= (and b!1045254 c!106250) b!1045261))

(assert (= (and b!1045254 (not c!106250)) b!1045264))

(assert (= (and b!1045261 res!696009) b!1045253))

(assert (= (or b!1045261 b!1045264) bm!44480))

(assert (= (and b!1045254 res!696012) b!1045262))

(assert (= (and b!1045262 c!106246) b!1045265))

(assert (= (and b!1045262 (not c!106246)) b!1045270))

(assert (= (and b!1045265 res!696014) b!1045263))

(assert (= (or b!1045265 b!1045270) bm!44477))

(declare-fun b_lambda!16273 () Bool)

(assert (=> (not b_lambda!16273) (not b!1045256)))

(assert (=> b!1045256 t!31302))

(declare-fun b_and!33733 () Bool)

(assert (= b_and!33731 (and (=> t!31302 result!14579) b_and!33733)))

(declare-fun m!964481 () Bool)

(assert (=> b!1045263 m!964481))

(declare-fun m!964483 () Bool)

(assert (=> b!1045268 m!964483))

(declare-fun m!964485 () Bool)

(assert (=> b!1045268 m!964485))

(declare-fun m!964487 () Bool)

(assert (=> b!1045268 m!964487))

(declare-fun m!964489 () Bool)

(assert (=> b!1045268 m!964489))

(declare-fun m!964491 () Bool)

(assert (=> b!1045268 m!964491))

(declare-fun m!964493 () Bool)

(assert (=> b!1045268 m!964493))

(declare-fun m!964495 () Bool)

(assert (=> b!1045268 m!964495))

(declare-fun m!964497 () Bool)

(assert (=> b!1045268 m!964497))

(declare-fun m!964499 () Bool)

(assert (=> b!1045268 m!964499))

(declare-fun m!964501 () Bool)

(assert (=> b!1045268 m!964501))

(declare-fun m!964503 () Bool)

(assert (=> b!1045268 m!964503))

(declare-fun m!964505 () Bool)

(assert (=> b!1045268 m!964505))

(declare-fun m!964507 () Bool)

(assert (=> b!1045268 m!964507))

(assert (=> b!1045268 m!964497))

(declare-fun m!964509 () Bool)

(assert (=> b!1045268 m!964509))

(declare-fun m!964511 () Bool)

(assert (=> b!1045268 m!964511))

(declare-fun m!964513 () Bool)

(assert (=> b!1045268 m!964513))

(assert (=> b!1045268 m!964501))

(declare-fun m!964515 () Bool)

(assert (=> b!1045268 m!964515))

(assert (=> b!1045268 m!964485))

(assert (=> b!1045268 m!964505))

(declare-fun m!964517 () Bool)

(assert (=> bm!44480 m!964517))

(declare-fun m!964519 () Bool)

(assert (=> b!1045253 m!964519))

(assert (=> d!126359 m!964405))

(assert (=> b!1045255 m!964493))

(assert (=> b!1045255 m!964493))

(declare-fun m!964521 () Bool)

(assert (=> b!1045255 m!964521))

(assert (=> b!1045271 m!964493))

(assert (=> b!1045271 m!964493))

(declare-fun m!964523 () Bool)

(assert (=> b!1045271 m!964523))

(declare-fun m!964525 () Bool)

(assert (=> bm!44481 m!964525))

(assert (=> bm!44483 m!964491))

(declare-fun m!964527 () Bool)

(assert (=> b!1045257 m!964527))

(declare-fun m!964529 () Bool)

(assert (=> bm!44477 m!964529))

(assert (=> b!1045256 m!964493))

(declare-fun m!964531 () Bool)

(assert (=> b!1045256 m!964531))

(declare-fun m!964533 () Bool)

(assert (=> b!1045256 m!964533))

(assert (=> b!1045256 m!964295))

(declare-fun m!964535 () Bool)

(assert (=> b!1045256 m!964535))

(assert (=> b!1045256 m!964295))

(assert (=> b!1045256 m!964493))

(assert (=> b!1045256 m!964533))

(assert (=> b!1045266 m!964493))

(assert (=> b!1045266 m!964493))

(assert (=> b!1045266 m!964521))

(assert (=> b!1045081 d!126359))

(declare-fun d!126361 () Bool)

(declare-fun lt!461323 () ListLongMap!13859)

(assert (=> d!126361 (not (contains!6057 lt!461323 key!909))))

(declare-fun removeStrictlySorted!64 (List!22052 (_ BitVec 64)) List!22052)

(assert (=> d!126361 (= lt!461323 (ListLongMap!13860 (removeStrictlySorted!64 (toList!6945 (getCurrentListMap!3911 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427))) key!909)))))

(assert (=> d!126361 (= (-!537 (getCurrentListMap!3911 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) lt!461323)))

(declare-fun bs!30498 () Bool)

(assert (= bs!30498 d!126361))

(declare-fun m!964537 () Bool)

(assert (=> bs!30498 m!964537))

(declare-fun m!964539 () Bool)

(assert (=> bs!30498 m!964539))

(assert (=> b!1045081 d!126361))

(declare-fun b!1045282 () Bool)

(declare-fun e!592508 () Bool)

(declare-fun e!592510 () Bool)

(assert (=> b!1045282 (= e!592508 e!592510)))

(declare-fun lt!461330 () (_ BitVec 64))

(assert (=> b!1045282 (= lt!461330 (select (arr!31656 lt!461154) #b00000000000000000000000000000000))))

(declare-fun lt!461332 () Unit!34023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65819 (_ BitVec 64) (_ BitVec 32)) Unit!34023)

(assert (=> b!1045282 (= lt!461332 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461154 lt!461330 #b00000000000000000000000000000000))))

(assert (=> b!1045282 (arrayContainsKey!0 lt!461154 lt!461330 #b00000000000000000000000000000000)))

(declare-fun lt!461331 () Unit!34023)

(assert (=> b!1045282 (= lt!461331 lt!461332)))

(declare-fun res!696023 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65819 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045282 (= res!696023 (= (seekEntryOrOpen!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000) lt!461154 (mask!30534 thiss!1427)) (Found!9846 #b00000000000000000000000000000000)))))

(assert (=> b!1045282 (=> (not res!696023) (not e!592510))))

(declare-fun b!1045283 () Bool)

(declare-fun e!592509 () Bool)

(assert (=> b!1045283 (= e!592509 e!592508)))

(declare-fun c!106253 () Bool)

(assert (=> b!1045283 (= c!106253 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun bm!44486 () Bool)

(declare-fun call!44489 () Bool)

(assert (=> bm!44486 (= call!44489 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461154 (mask!30534 thiss!1427)))))

(declare-fun d!126363 () Bool)

(declare-fun res!696022 () Bool)

(assert (=> d!126363 (=> res!696022 e!592509)))

(assert (=> d!126363 (= res!696022 (bvsge #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(assert (=> d!126363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461154 (mask!30534 thiss!1427)) e!592509)))

(declare-fun b!1045284 () Bool)

(assert (=> b!1045284 (= e!592508 call!44489)))

(declare-fun b!1045285 () Bool)

(assert (=> b!1045285 (= e!592510 call!44489)))

(assert (= (and d!126363 (not res!696022)) b!1045283))

(assert (= (and b!1045283 c!106253) b!1045282))

(assert (= (and b!1045283 (not c!106253)) b!1045284))

(assert (= (and b!1045282 res!696023) b!1045285))

(assert (= (or b!1045285 b!1045284) bm!44486))

(assert (=> b!1045282 m!964473))

(declare-fun m!964541 () Bool)

(assert (=> b!1045282 m!964541))

(declare-fun m!964543 () Bool)

(assert (=> b!1045282 m!964543))

(assert (=> b!1045282 m!964473))

(declare-fun m!964545 () Bool)

(assert (=> b!1045282 m!964545))

(assert (=> b!1045283 m!964473))

(assert (=> b!1045283 m!964473))

(assert (=> b!1045283 m!964477))

(declare-fun m!964547 () Bool)

(assert (=> bm!44486 m!964547))

(assert (=> b!1045081 d!126363))

(declare-fun b!1045294 () Bool)

(declare-fun e!592516 () (_ BitVec 32))

(declare-fun call!44492 () (_ BitVec 32))

(assert (=> b!1045294 (= e!592516 (bvadd #b00000000000000000000000000000001 call!44492))))

(declare-fun b!1045295 () Bool)

(assert (=> b!1045295 (= e!592516 call!44492)))

(declare-fun d!126365 () Bool)

(declare-fun lt!461335 () (_ BitVec 32))

(assert (=> d!126365 (and (bvsge lt!461335 #b00000000000000000000000000000000) (bvsle lt!461335 (bvsub (size!32193 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun e!592515 () (_ BitVec 32))

(assert (=> d!126365 (= lt!461335 e!592515)))

(declare-fun c!106259 () Bool)

(assert (=> d!126365 (= c!106259 (bvsge #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(assert (=> d!126365 (and (bvsle #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32193 (_keys!11680 thiss!1427)) (size!32193 lt!461154)))))

(assert (=> d!126365 (= (arrayCountValidKeys!0 lt!461154 #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) lt!461335)))

(declare-fun bm!44489 () Bool)

(assert (=> bm!44489 (= call!44492 (arrayCountValidKeys!0 lt!461154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun b!1045296 () Bool)

(assert (=> b!1045296 (= e!592515 e!592516)))

(declare-fun c!106258 () Bool)

(assert (=> b!1045296 (= c!106258 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun b!1045297 () Bool)

(assert (=> b!1045297 (= e!592515 #b00000000000000000000000000000000)))

(assert (= (and d!126365 c!106259) b!1045297))

(assert (= (and d!126365 (not c!106259)) b!1045296))

(assert (= (and b!1045296 c!106258) b!1045294))

(assert (= (and b!1045296 (not c!106258)) b!1045295))

(assert (= (or b!1045294 b!1045295) bm!44489))

(declare-fun m!964549 () Bool)

(assert (=> bm!44489 m!964549))

(assert (=> b!1045296 m!964473))

(assert (=> b!1045296 m!964473))

(assert (=> b!1045296 m!964477))

(assert (=> b!1045081 d!126365))

(declare-fun b!1045307 () Bool)

(declare-fun res!696035 () Bool)

(declare-fun e!592521 () Bool)

(assert (=> b!1045307 (=> (not res!696035) (not e!592521))))

(assert (=> b!1045307 (= res!696035 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045306 () Bool)

(declare-fun res!696034 () Bool)

(assert (=> b!1045306 (=> (not res!696034) (not e!592521))))

(assert (=> b!1045306 (= res!696034 (validKeyInArray!0 (select (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151))))))

(declare-fun b!1045308 () Bool)

(assert (=> b!1045308 (= e!592521 (bvslt (size!32193 (_keys!11680 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126367 () Bool)

(declare-fun e!592522 () Bool)

(assert (=> d!126367 e!592522))

(declare-fun res!696033 () Bool)

(assert (=> d!126367 (=> (not res!696033) (not e!592522))))

(assert (=> d!126367 (= res!696033 (and (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427)))))))

(declare-fun lt!461338 () Unit!34023)

(declare-fun choose!82 (array!65819 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> d!126367 (= lt!461338 (choose!82 (_keys!11680 thiss!1427) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126367 e!592521))

(declare-fun res!696032 () Bool)

(assert (=> d!126367 (=> (not res!696032) (not e!592521))))

(assert (=> d!126367 (= res!696032 (and (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427)))))))

(assert (=> d!126367 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461338)))

(declare-fun b!1045309 () Bool)

(assert (=> b!1045309 (= e!592522 (= (arrayCountValidKeys!0 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))) #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126367 res!696032) b!1045306))

(assert (= (and b!1045306 res!696034) b!1045307))

(assert (= (and b!1045307 res!696035) b!1045308))

(assert (= (and d!126367 res!696033) b!1045309))

(declare-fun m!964551 () Bool)

(assert (=> b!1045307 m!964551))

(declare-fun m!964553 () Bool)

(assert (=> b!1045306 m!964553))

(assert (=> b!1045306 m!964553))

(declare-fun m!964555 () Bool)

(assert (=> b!1045306 m!964555))

(declare-fun m!964557 () Bool)

(assert (=> d!126367 m!964557))

(assert (=> b!1045309 m!964265))

(declare-fun m!964559 () Bool)

(assert (=> b!1045309 m!964559))

(assert (=> b!1045309 m!964277))

(assert (=> b!1045081 d!126367))

(declare-fun b!1045310 () Bool)

(declare-fun e!592524 () (_ BitVec 32))

(declare-fun call!44493 () (_ BitVec 32))

(assert (=> b!1045310 (= e!592524 (bvadd #b00000000000000000000000000000001 call!44493))))

(declare-fun b!1045311 () Bool)

(assert (=> b!1045311 (= e!592524 call!44493)))

(declare-fun d!126369 () Bool)

(declare-fun lt!461339 () (_ BitVec 32))

(assert (=> d!126369 (and (bvsge lt!461339 #b00000000000000000000000000000000) (bvsle lt!461339 (bvsub (size!32193 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!592523 () (_ BitVec 32))

(assert (=> d!126369 (= lt!461339 e!592523)))

(declare-fun c!106261 () Bool)

(assert (=> d!126369 (= c!106261 (bvsge #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))))))

(assert (=> d!126369 (and (bvsle #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32193 (_keys!11680 thiss!1427)) (size!32193 (_keys!11680 thiss!1427))))))

(assert (=> d!126369 (= (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) lt!461339)))

(declare-fun bm!44490 () Bool)

(assert (=> bm!44490 (= call!44493 (arrayCountValidKeys!0 (_keys!11680 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun b!1045312 () Bool)

(assert (=> b!1045312 (= e!592523 e!592524)))

(declare-fun c!106260 () Bool)

(assert (=> b!1045312 (= c!106260 (validKeyInArray!0 (select (arr!31656 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045313 () Bool)

(assert (=> b!1045313 (= e!592523 #b00000000000000000000000000000000)))

(assert (= (and d!126369 c!106261) b!1045313))

(assert (= (and d!126369 (not c!106261)) b!1045312))

(assert (= (and b!1045312 c!106260) b!1045310))

(assert (= (and b!1045312 (not c!106260)) b!1045311))

(assert (= (or b!1045310 b!1045311) bm!44490))

(declare-fun m!964561 () Bool)

(assert (=> bm!44490 m!964561))

(assert (=> b!1045312 m!964493))

(assert (=> b!1045312 m!964493))

(assert (=> b!1045312 m!964521))

(assert (=> b!1045081 d!126369))

(declare-fun d!126371 () Bool)

(declare-fun e!592527 () Bool)

(assert (=> d!126371 e!592527))

(declare-fun res!696038 () Bool)

(assert (=> d!126371 (=> (not res!696038) (not e!592527))))

(assert (=> d!126371 (= res!696038 (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427))))))

(declare-fun lt!461342 () Unit!34023)

(declare-fun choose!121 (array!65819 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> d!126371 (= lt!461342 (choose!121 (_keys!11680 thiss!1427) (index!41756 lt!461151) key!909))))

(assert (=> d!126371 (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000)))

(assert (=> d!126371 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) key!909) lt!461342)))

(declare-fun b!1045316 () Bool)

(assert (=> b!1045316 (= e!592527 (not (arrayContainsKey!0 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126371 res!696038) b!1045316))

(declare-fun m!964563 () Bool)

(assert (=> d!126371 m!964563))

(assert (=> b!1045316 m!964265))

(declare-fun m!964565 () Bool)

(assert (=> b!1045316 m!964565))

(assert (=> b!1045081 d!126371))

(declare-fun d!126373 () Bool)

(declare-fun e!592530 () Bool)

(assert (=> d!126373 e!592530))

(declare-fun res!696041 () Bool)

(assert (=> d!126373 (=> (not res!696041) (not e!592530))))

(assert (=> d!126373 (= res!696041 (and (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427)))))))

(declare-fun lt!461345 () Unit!34023)

(declare-fun choose!1721 (array!65819 array!65821 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) (_ BitVec 64) Int) Unit!34023)

(assert (=> d!126373 (= lt!461345 (choose!1721 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41756 lt!461151) key!909 (defaultEntry!6414 thiss!1427)))))

(assert (=> d!126373 (validMask!0 (mask!30534 thiss!1427))))

(assert (=> d!126373 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41756 lt!461151) key!909 (defaultEntry!6414 thiss!1427)) lt!461345)))

(declare-fun b!1045319 () Bool)

(assert (=> b!1045319 (= e!592530 (= (-!537 (getCurrentListMap!3911 (_keys!11680 thiss!1427) (_values!6437 thiss!1427) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) (getCurrentListMap!3911 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))) (array!65822 (store (arr!31657 (_values!6437 thiss!1427)) (index!41756 lt!461151) (ValueCellFull!11723 (dynLambda!1998 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32194 (_values!6437 thiss!1427))) (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427))))))

(assert (=> b!1045319 (bvslt (index!41756 lt!461151) (size!32194 (_values!6437 thiss!1427)))))

(assert (= (and d!126373 res!696041) b!1045319))

(declare-fun b_lambda!16275 () Bool)

(assert (=> (not b_lambda!16275) (not b!1045319)))

(assert (=> b!1045319 t!31302))

(declare-fun b_and!33735 () Bool)

(assert (= b_and!33733 (and (=> t!31302 result!14579) b_and!33735)))

(declare-fun m!964567 () Bool)

(assert (=> d!126373 m!964567))

(assert (=> d!126373 m!964405))

(assert (=> b!1045319 m!964283))

(assert (=> b!1045319 m!964273))

(assert (=> b!1045319 m!964283))

(assert (=> b!1045319 m!964285))

(assert (=> b!1045319 m!964295))

(assert (=> b!1045319 m!964265))

(declare-fun m!964569 () Bool)

(assert (=> b!1045319 m!964569))

(assert (=> b!1045081 d!126373))

(declare-fun bm!44491 () Bool)

(declare-fun call!44499 () Bool)

(declare-fun lt!461354 () ListLongMap!13859)

(assert (=> bm!44491 (= call!44499 (contains!6057 lt!461354 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045320 () Bool)

(declare-fun e!592539 () Bool)

(assert (=> b!1045320 (= e!592539 (= (apply!907 lt!461354 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 thiss!1427)))))

(declare-fun b!1045321 () Bool)

(declare-fun res!696045 () Bool)

(declare-fun e!592532 () Bool)

(assert (=> b!1045321 (=> (not res!696045) (not e!592532))))

(declare-fun e!592538 () Bool)

(assert (=> b!1045321 (= res!696045 e!592538)))

(declare-fun c!106267 () Bool)

(assert (=> b!1045321 (= c!106267 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045322 () Bool)

(declare-fun e!592543 () Bool)

(assert (=> b!1045322 (= e!592543 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun b!1045324 () Bool)

(declare-fun e!592541 () ListLongMap!13859)

(declare-fun call!44494 () ListLongMap!13859)

(assert (=> b!1045324 (= e!592541 (+!3138 call!44494 (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427))))))

(declare-fun b!1045325 () Bool)

(declare-fun e!592542 () Unit!34023)

(declare-fun Unit!34032 () Unit!34023)

(assert (=> b!1045325 (= e!592542 Unit!34032)))

(declare-fun b!1045326 () Bool)

(declare-fun res!696046 () Bool)

(assert (=> b!1045326 (=> (not res!696046) (not e!592532))))

(declare-fun e!592534 () Bool)

(assert (=> b!1045326 (= res!696046 e!592534)))

(declare-fun res!696043 () Bool)

(assert (=> b!1045326 (=> res!696043 e!592534)))

(assert (=> b!1045326 (= res!696043 (not e!592543))))

(declare-fun res!696044 () Bool)

(assert (=> b!1045326 (=> (not res!696044) (not e!592543))))

(assert (=> b!1045326 (= res!696044 (bvslt #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(declare-fun b!1045327 () Bool)

(declare-fun c!106266 () Bool)

(assert (=> b!1045327 (= c!106266 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592536 () ListLongMap!13859)

(declare-fun e!592535 () ListLongMap!13859)

(assert (=> b!1045327 (= e!592536 e!592535)))

(declare-fun b!1045328 () Bool)

(assert (=> b!1045328 (= e!592538 e!592539)))

(declare-fun res!696042 () Bool)

(declare-fun call!44496 () Bool)

(assert (=> b!1045328 (= res!696042 call!44496)))

(assert (=> b!1045328 (=> (not res!696042) (not e!592539))))

(declare-fun b!1045329 () Bool)

(declare-fun e!592533 () Bool)

(assert (=> b!1045329 (= e!592532 e!592533)))

(declare-fun c!106263 () Bool)

(assert (=> b!1045329 (= c!106263 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045330 () Bool)

(declare-fun e!592537 () Bool)

(assert (=> b!1045330 (= e!592537 (= (apply!907 lt!461354 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 thiss!1427)))))

(declare-fun bm!44492 () Bool)

(declare-fun call!44498 () ListLongMap!13859)

(declare-fun call!44497 () ListLongMap!13859)

(assert (=> bm!44492 (= call!44498 call!44497)))

(declare-fun b!1045331 () Bool)

(assert (=> b!1045331 (= e!592538 (not call!44496))))

(declare-fun b!1045332 () Bool)

(assert (=> b!1045332 (= e!592533 e!592537)))

(declare-fun res!696047 () Bool)

(assert (=> b!1045332 (= res!696047 call!44499)))

(assert (=> b!1045332 (=> (not res!696047) (not e!592537))))

(declare-fun b!1045333 () Bool)

(declare-fun e!592540 () Bool)

(assert (=> b!1045333 (= e!592540 (validKeyInArray!0 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(declare-fun b!1045334 () Bool)

(declare-fun call!44500 () ListLongMap!13859)

(assert (=> b!1045334 (= e!592535 call!44500)))

(declare-fun b!1045335 () Bool)

(declare-fun lt!461346 () Unit!34023)

(assert (=> b!1045335 (= e!592542 lt!461346)))

(declare-fun lt!461366 () ListLongMap!13859)

(assert (=> b!1045335 (= lt!461366 (getCurrentListMapNoExtraKeys!3573 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461367 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461358 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461358 (select (arr!31656 lt!461154) #b00000000000000000000000000000000))))

(declare-fun lt!461359 () Unit!34023)

(assert (=> b!1045335 (= lt!461359 (addStillContains!626 lt!461366 lt!461367 (zeroValue!6248 thiss!1427) lt!461358))))

(assert (=> b!1045335 (contains!6057 (+!3138 lt!461366 (tuple2!15857 lt!461367 (zeroValue!6248 thiss!1427))) lt!461358)))

(declare-fun lt!461347 () Unit!34023)

(assert (=> b!1045335 (= lt!461347 lt!461359)))

(declare-fun lt!461365 () ListLongMap!13859)

(assert (=> b!1045335 (= lt!461365 (getCurrentListMapNoExtraKeys!3573 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461350 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461350 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461355 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461355 (select (arr!31656 lt!461154) #b00000000000000000000000000000000))))

(declare-fun lt!461361 () Unit!34023)

(assert (=> b!1045335 (= lt!461361 (addApplyDifferent!482 lt!461365 lt!461350 (minValue!6248 thiss!1427) lt!461355))))

(assert (=> b!1045335 (= (apply!907 (+!3138 lt!461365 (tuple2!15857 lt!461350 (minValue!6248 thiss!1427))) lt!461355) (apply!907 lt!461365 lt!461355))))

(declare-fun lt!461356 () Unit!34023)

(assert (=> b!1045335 (= lt!461356 lt!461361)))

(declare-fun lt!461360 () ListLongMap!13859)

(assert (=> b!1045335 (= lt!461360 (getCurrentListMapNoExtraKeys!3573 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461351 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461351 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461364 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461364 (select (arr!31656 lt!461154) #b00000000000000000000000000000000))))

(declare-fun lt!461349 () Unit!34023)

(assert (=> b!1045335 (= lt!461349 (addApplyDifferent!482 lt!461360 lt!461351 (zeroValue!6248 thiss!1427) lt!461364))))

(assert (=> b!1045335 (= (apply!907 (+!3138 lt!461360 (tuple2!15857 lt!461351 (zeroValue!6248 thiss!1427))) lt!461364) (apply!907 lt!461360 lt!461364))))

(declare-fun lt!461352 () Unit!34023)

(assert (=> b!1045335 (= lt!461352 lt!461349)))

(declare-fun lt!461348 () ListLongMap!13859)

(assert (=> b!1045335 (= lt!461348 (getCurrentListMapNoExtraKeys!3573 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461363 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461363 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461362 () (_ BitVec 64))

(assert (=> b!1045335 (= lt!461362 (select (arr!31656 lt!461154) #b00000000000000000000000000000000))))

(assert (=> b!1045335 (= lt!461346 (addApplyDifferent!482 lt!461348 lt!461363 (minValue!6248 thiss!1427) lt!461362))))

(assert (=> b!1045335 (= (apply!907 (+!3138 lt!461348 (tuple2!15857 lt!461363 (minValue!6248 thiss!1427))) lt!461362) (apply!907 lt!461348 lt!461362))))

(declare-fun e!592531 () Bool)

(declare-fun b!1045323 () Bool)

(assert (=> b!1045323 (= e!592531 (= (apply!907 lt!461354 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)) (get!16554 (select (arr!31657 lt!461149) #b00000000000000000000000000000000) (dynLambda!1998 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 lt!461149)))))

(assert (=> b!1045323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(declare-fun d!126375 () Bool)

(assert (=> d!126375 e!592532))

(declare-fun res!696050 () Bool)

(assert (=> d!126375 (=> (not res!696050) (not e!592532))))

(assert (=> d!126375 (= res!696050 (or (bvsge #b00000000000000000000000000000000 (size!32193 lt!461154)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 lt!461154)))))))

(declare-fun lt!461357 () ListLongMap!13859)

(assert (=> d!126375 (= lt!461354 lt!461357)))

(declare-fun lt!461353 () Unit!34023)

(assert (=> d!126375 (= lt!461353 e!592542)))

(declare-fun c!106264 () Bool)

(assert (=> d!126375 (= c!106264 e!592540)))

(declare-fun res!696049 () Bool)

(assert (=> d!126375 (=> (not res!696049) (not e!592540))))

(assert (=> d!126375 (= res!696049 (bvslt #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(assert (=> d!126375 (= lt!461357 e!592541)))

(declare-fun c!106265 () Bool)

(assert (=> d!126375 (= c!106265 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126375 (validMask!0 (mask!30534 thiss!1427))))

(assert (=> d!126375 (= (getCurrentListMap!3911 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) lt!461354)))

(declare-fun bm!44493 () Bool)

(declare-fun call!44495 () ListLongMap!13859)

(assert (=> bm!44493 (= call!44495 call!44494)))

(declare-fun bm!44494 () Bool)

(assert (=> bm!44494 (= call!44496 (contains!6057 lt!461354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045336 () Bool)

(assert (=> b!1045336 (= e!592536 call!44495)))

(declare-fun bm!44495 () Bool)

(declare-fun c!106262 () Bool)

(assert (=> bm!44495 (= call!44494 (+!3138 (ite c!106265 call!44497 (ite c!106262 call!44498 call!44500)) (ite (or c!106265 c!106262) (tuple2!15857 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 thiss!1427)) (tuple2!15857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427)))))))

(declare-fun bm!44496 () Bool)

(assert (=> bm!44496 (= call!44500 call!44498)))

(declare-fun b!1045337 () Bool)

(assert (=> b!1045337 (= e!592533 (not call!44499))))

(declare-fun b!1045338 () Bool)

(assert (=> b!1045338 (= e!592534 e!592531)))

(declare-fun res!696048 () Bool)

(assert (=> b!1045338 (=> (not res!696048) (not e!592531))))

(assert (=> b!1045338 (= res!696048 (contains!6057 lt!461354 (select (arr!31656 lt!461154) #b00000000000000000000000000000000)))))

(assert (=> b!1045338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32193 lt!461154)))))

(declare-fun b!1045339 () Bool)

(assert (=> b!1045339 (= e!592541 e!592536)))

(assert (=> b!1045339 (= c!106262 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44497 () Bool)

(assert (=> bm!44497 (= call!44497 (getCurrentListMapNoExtraKeys!3573 lt!461154 lt!461149 (mask!30534 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun b!1045340 () Bool)

(assert (=> b!1045340 (= e!592535 call!44495)))

(assert (= (and d!126375 c!106265) b!1045324))

(assert (= (and d!126375 (not c!106265)) b!1045339))

(assert (= (and b!1045339 c!106262) b!1045336))

(assert (= (and b!1045339 (not c!106262)) b!1045327))

(assert (= (and b!1045327 c!106266) b!1045340))

(assert (= (and b!1045327 (not c!106266)) b!1045334))

(assert (= (or b!1045340 b!1045334) bm!44496))

(assert (= (or b!1045336 bm!44496) bm!44492))

(assert (= (or b!1045336 b!1045340) bm!44493))

(assert (= (or b!1045324 bm!44492) bm!44497))

(assert (= (or b!1045324 bm!44493) bm!44495))

(assert (= (and d!126375 res!696049) b!1045333))

(assert (= (and d!126375 c!106264) b!1045335))

(assert (= (and d!126375 (not c!106264)) b!1045325))

(assert (= (and d!126375 res!696050) b!1045326))

(assert (= (and b!1045326 res!696044) b!1045322))

(assert (= (and b!1045326 (not res!696043)) b!1045338))

(assert (= (and b!1045338 res!696048) b!1045323))

(assert (= (and b!1045326 res!696046) b!1045321))

(assert (= (and b!1045321 c!106267) b!1045328))

(assert (= (and b!1045321 (not c!106267)) b!1045331))

(assert (= (and b!1045328 res!696042) b!1045320))

(assert (= (or b!1045328 b!1045331) bm!44494))

(assert (= (and b!1045321 res!696045) b!1045329))

(assert (= (and b!1045329 c!106263) b!1045332))

(assert (= (and b!1045329 (not c!106263)) b!1045337))

(assert (= (and b!1045332 res!696047) b!1045330))

(assert (= (or b!1045332 b!1045337) bm!44491))

(declare-fun b_lambda!16277 () Bool)

(assert (=> (not b_lambda!16277) (not b!1045323)))

(assert (=> b!1045323 t!31302))

(declare-fun b_and!33737 () Bool)

(assert (= b_and!33735 (and (=> t!31302 result!14579) b_and!33737)))

(declare-fun m!964571 () Bool)

(assert (=> b!1045330 m!964571))

(declare-fun m!964573 () Bool)

(assert (=> b!1045335 m!964573))

(declare-fun m!964575 () Bool)

(assert (=> b!1045335 m!964575))

(declare-fun m!964577 () Bool)

(assert (=> b!1045335 m!964577))

(declare-fun m!964579 () Bool)

(assert (=> b!1045335 m!964579))

(declare-fun m!964581 () Bool)

(assert (=> b!1045335 m!964581))

(assert (=> b!1045335 m!964473))

(declare-fun m!964583 () Bool)

(assert (=> b!1045335 m!964583))

(declare-fun m!964585 () Bool)

(assert (=> b!1045335 m!964585))

(declare-fun m!964587 () Bool)

(assert (=> b!1045335 m!964587))

(declare-fun m!964589 () Bool)

(assert (=> b!1045335 m!964589))

(declare-fun m!964591 () Bool)

(assert (=> b!1045335 m!964591))

(declare-fun m!964593 () Bool)

(assert (=> b!1045335 m!964593))

(declare-fun m!964595 () Bool)

(assert (=> b!1045335 m!964595))

(assert (=> b!1045335 m!964585))

(declare-fun m!964597 () Bool)

(assert (=> b!1045335 m!964597))

(declare-fun m!964599 () Bool)

(assert (=> b!1045335 m!964599))

(declare-fun m!964601 () Bool)

(assert (=> b!1045335 m!964601))

(assert (=> b!1045335 m!964589))

(declare-fun m!964603 () Bool)

(assert (=> b!1045335 m!964603))

(assert (=> b!1045335 m!964575))

(assert (=> b!1045335 m!964593))

(declare-fun m!964605 () Bool)

(assert (=> bm!44494 m!964605))

(declare-fun m!964607 () Bool)

(assert (=> b!1045320 m!964607))

(assert (=> d!126375 m!964405))

(assert (=> b!1045322 m!964473))

(assert (=> b!1045322 m!964473))

(assert (=> b!1045322 m!964477))

(assert (=> b!1045338 m!964473))

(assert (=> b!1045338 m!964473))

(declare-fun m!964609 () Bool)

(assert (=> b!1045338 m!964609))

(declare-fun m!964611 () Bool)

(assert (=> bm!44495 m!964611))

(assert (=> bm!44497 m!964581))

(declare-fun m!964613 () Bool)

(assert (=> b!1045324 m!964613))

(declare-fun m!964615 () Bool)

(assert (=> bm!44491 m!964615))

(assert (=> b!1045323 m!964473))

(declare-fun m!964617 () Bool)

(assert (=> b!1045323 m!964617))

(declare-fun m!964619 () Bool)

(assert (=> b!1045323 m!964619))

(assert (=> b!1045323 m!964295))

(declare-fun m!964621 () Bool)

(assert (=> b!1045323 m!964621))

(assert (=> b!1045323 m!964295))

(assert (=> b!1045323 m!964473))

(assert (=> b!1045323 m!964619))

(assert (=> b!1045333 m!964473))

(assert (=> b!1045333 m!964473))

(assert (=> b!1045333 m!964477))

(assert (=> b!1045081 d!126375))

(declare-fun d!126377 () Bool)

(declare-fun e!592546 () Bool)

(assert (=> d!126377 e!592546))

(declare-fun res!696053 () Bool)

(assert (=> d!126377 (=> (not res!696053) (not e!592546))))

(assert (=> d!126377 (= res!696053 (and (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427)))))))

(declare-fun lt!461370 () Unit!34023)

(declare-fun choose!25 (array!65819 (_ BitVec 32) (_ BitVec 32)) Unit!34023)

(assert (=> d!126377 (= lt!461370 (choose!25 (_keys!11680 thiss!1427) (index!41756 lt!461151) (mask!30534 thiss!1427)))))

(assert (=> d!126377 (validMask!0 (mask!30534 thiss!1427))))

(assert (=> d!126377 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11680 thiss!1427) (index!41756 lt!461151) (mask!30534 thiss!1427)) lt!461370)))

(declare-fun b!1045343 () Bool)

(assert (=> b!1045343 (= e!592546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))) (mask!30534 thiss!1427)))))

(assert (= (and d!126377 res!696053) b!1045343))

(declare-fun m!964623 () Bool)

(assert (=> d!126377 m!964623))

(assert (=> d!126377 m!964405))

(assert (=> b!1045343 m!964265))

(declare-fun m!964625 () Bool)

(assert (=> b!1045343 m!964625))

(assert (=> b!1045081 d!126377))

(declare-fun d!126379 () Bool)

(declare-fun e!592549 () Bool)

(assert (=> d!126379 e!592549))

(declare-fun res!696056 () Bool)

(assert (=> d!126379 (=> (not res!696056) (not e!592549))))

(assert (=> d!126379 (= res!696056 (and (bvsge (index!41756 lt!461151) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461151) (size!32193 (_keys!11680 thiss!1427)))))))

(declare-fun lt!461373 () Unit!34023)

(declare-fun choose!53 (array!65819 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22053) Unit!34023)

(assert (=> d!126379 (= lt!461373 (choose!53 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461151) #b00000000000000000000000000000000 Nil!22050))))

(assert (=> d!126379 (bvslt (size!32193 (_keys!11680 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126379 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461151) #b00000000000000000000000000000000 Nil!22050) lt!461373)))

(declare-fun b!1045346 () Bool)

(assert (=> b!1045346 (= e!592549 (arrayNoDuplicates!0 (array!65820 (store (arr!31656 (_keys!11680 thiss!1427)) (index!41756 lt!461151) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11680 thiss!1427))) #b00000000000000000000000000000000 Nil!22050))))

(assert (= (and d!126379 res!696056) b!1045346))

(declare-fun m!964627 () Bool)

(assert (=> d!126379 m!964627))

(assert (=> b!1045346 m!964265))

(declare-fun m!964629 () Bool)

(assert (=> b!1045346 m!964629))

(assert (=> b!1045081 d!126379))

(declare-fun d!126381 () Bool)

(declare-fun res!696061 () Bool)

(declare-fun e!592554 () Bool)

(assert (=> d!126381 (=> res!696061 e!592554)))

(assert (=> d!126381 (= res!696061 (= (select (arr!31656 lt!461154) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126381 (= (arrayContainsKey!0 lt!461154 key!909 #b00000000000000000000000000000000) e!592554)))

(declare-fun b!1045351 () Bool)

(declare-fun e!592555 () Bool)

(assert (=> b!1045351 (= e!592554 e!592555)))

(declare-fun res!696062 () Bool)

(assert (=> b!1045351 (=> (not res!696062) (not e!592555))))

(assert (=> b!1045351 (= res!696062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32193 lt!461154)))))

(declare-fun b!1045352 () Bool)

(assert (=> b!1045352 (= e!592555 (arrayContainsKey!0 lt!461154 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126381 (not res!696061)) b!1045351))

(assert (= (and b!1045351 res!696062) b!1045352))

(assert (=> d!126381 m!964473))

(declare-fun m!964631 () Bool)

(assert (=> b!1045352 m!964631))

(assert (=> b!1045081 d!126381))

(declare-fun d!126383 () Bool)

(declare-fun res!696069 () Bool)

(declare-fun e!592558 () Bool)

(assert (=> d!126383 (=> (not res!696069) (not e!592558))))

(declare-fun simpleValid!452 (LongMapFixedSize!6040) Bool)

(assert (=> d!126383 (= res!696069 (simpleValid!452 thiss!1427))))

(assert (=> d!126383 (= (valid!2261 thiss!1427) e!592558)))

(declare-fun b!1045359 () Bool)

(declare-fun res!696070 () Bool)

(assert (=> b!1045359 (=> (not res!696070) (not e!592558))))

(assert (=> b!1045359 (= res!696070 (= (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32193 (_keys!11680 thiss!1427))) (_size!3075 thiss!1427)))))

(declare-fun b!1045360 () Bool)

(declare-fun res!696071 () Bool)

(assert (=> b!1045360 (=> (not res!696071) (not e!592558))))

(assert (=> b!1045360 (= res!696071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11680 thiss!1427) (mask!30534 thiss!1427)))))

(declare-fun b!1045361 () Bool)

(assert (=> b!1045361 (= e!592558 (arrayNoDuplicates!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 Nil!22050))))

(assert (= (and d!126383 res!696069) b!1045359))

(assert (= (and b!1045359 res!696070) b!1045360))

(assert (= (and b!1045360 res!696071) b!1045361))

(declare-fun m!964633 () Bool)

(assert (=> d!126383 m!964633))

(assert (=> b!1045359 m!964277))

(declare-fun m!964635 () Bool)

(assert (=> b!1045360 m!964635))

(declare-fun m!964637 () Bool)

(assert (=> b!1045361 m!964637))

(assert (=> start!91890 d!126383))

(declare-fun d!126385 () Bool)

(assert (=> d!126385 (= (validMask!0 (mask!30534 (_2!7938 lt!461146))) (and (or (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000000000111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000000001111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000000011111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000000111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000001111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000011111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000000111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000001111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000011111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000000111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000001111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000011111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000000111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000001111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000011111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000000111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000001111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000011111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000000111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000001111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000011111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000000111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000001111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000011111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00000111111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00001111111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00011111111111111111111111111111) (= (mask!30534 (_2!7938 lt!461146)) #b00111111111111111111111111111111)) (bvsle (mask!30534 (_2!7938 lt!461146)) #b00111111111111111111111111111111)))))

(assert (=> b!1045080 d!126385))

(declare-fun d!126387 () Bool)

(assert (=> d!126387 (= (array_inv!24461 (_keys!11680 thiss!1427)) (bvsge (size!32193 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045084 d!126387))

(declare-fun d!126389 () Bool)

(assert (=> d!126389 (= (array_inv!24462 (_values!6437 thiss!1427)) (bvsge (size!32194 (_values!6437 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045084 d!126389))

(declare-fun mapIsEmpty!38927 () Bool)

(declare-fun mapRes!38927 () Bool)

(assert (=> mapIsEmpty!38927 mapRes!38927))

(declare-fun condMapEmpty!38927 () Bool)

(declare-fun mapDefault!38927 () ValueCell!11723)

(assert (=> mapNonEmpty!38918 (= condMapEmpty!38927 (= mapRest!38918 ((as const (Array (_ BitVec 32) ValueCell!11723)) mapDefault!38927)))))

(declare-fun e!592563 () Bool)

(assert (=> mapNonEmpty!38918 (= tp!74655 (and e!592563 mapRes!38927))))

(declare-fun b!1045369 () Bool)

(assert (=> b!1045369 (= e!592563 tp_is_empty!24853)))

(declare-fun b!1045368 () Bool)

(declare-fun e!592564 () Bool)

(assert (=> b!1045368 (= e!592564 tp_is_empty!24853)))

(declare-fun mapNonEmpty!38927 () Bool)

(declare-fun tp!74670 () Bool)

(assert (=> mapNonEmpty!38927 (= mapRes!38927 (and tp!74670 e!592564))))

(declare-fun mapValue!38927 () ValueCell!11723)

(declare-fun mapRest!38927 () (Array (_ BitVec 32) ValueCell!11723))

(declare-fun mapKey!38927 () (_ BitVec 32))

(assert (=> mapNonEmpty!38927 (= mapRest!38918 (store mapRest!38927 mapKey!38927 mapValue!38927))))

(assert (= (and mapNonEmpty!38918 condMapEmpty!38927) mapIsEmpty!38927))

(assert (= (and mapNonEmpty!38918 (not condMapEmpty!38927)) mapNonEmpty!38927))

(assert (= (and mapNonEmpty!38927 ((_ is ValueCellFull!11723) mapValue!38927)) b!1045368))

(assert (= (and mapNonEmpty!38918 ((_ is ValueCellFull!11723) mapDefault!38927)) b!1045369))

(declare-fun m!964639 () Bool)

(assert (=> mapNonEmpty!38927 m!964639))

(declare-fun b_lambda!16279 () Bool)

(assert (= b_lambda!16277 (or (and b!1045084 b_free!21133) b_lambda!16279)))

(declare-fun b_lambda!16281 () Bool)

(assert (= b_lambda!16275 (or (and b!1045084 b_free!21133) b_lambda!16281)))

(declare-fun b_lambda!16283 () Bool)

(assert (= b_lambda!16273 (or (and b!1045084 b_free!21133) b_lambda!16283)))

(check-sat (not d!126377) (not b!1045172) (not b!1045255) (not bm!44483) (not b!1045333) (not b!1045253) (not d!126375) (not b!1045338) (not d!126367) (not bm!44473) (not mapNonEmpty!38927) (not b!1045230) (not b!1045263) (not b_lambda!16279) (not bm!44467) (not b!1045346) (not d!126383) (not b!1045232) (not b!1045282) (not b!1045361) (not b!1045307) (not bm!44476) (not bm!44491) (not b!1045359) (not b!1045320) (not b!1045316) (not b!1045319) tp_is_empty!24853 (not b!1045309) (not b_lambda!16281) (not b!1045235) (not b!1045174) (not bm!44489) (not b!1045161) (not b!1045268) (not b_lambda!16283) (not b!1045221) (not b!1045248) (not b!1045256) (not bm!44471) (not b!1045306) (not b_next!21133) (not b!1045312) (not b!1045283) (not d!126379) (not b!1045330) (not b!1045322) (not b!1045257) (not bm!44494) (not b!1045251) (not bm!44497) (not b!1045360) (not d!126359) (not b!1045252) (not bm!44486) (not d!126353) (not b!1045324) (not d!126371) (not d!126373) (not b!1045323) (not b!1045217) (not b!1045266) (not b!1045227) (not bm!44477) (not b!1045343) (not b!1045296) (not d!126361) (not d!126351) (not b!1045271) (not b_lambda!16269) (not b!1045352) (not b_lambda!16271) (not bm!44495) b_and!33737 (not bm!44480) (not b!1045219) (not b!1045220) (not b!1045335) (not d!126355) (not bm!44481) (not bm!44470) (not bm!44490))
(check-sat b_and!33737 (not b_next!21133))
