; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91482 () Bool)

(assert start!91482)

(declare-fun b!1042091 () Bool)

(declare-fun b_free!21055 () Bool)

(declare-fun b_next!21055 () Bool)

(assert (=> b!1042091 (= b_free!21055 (not b_next!21055))))

(declare-fun tp!74388 () Bool)

(declare-fun b_and!33561 () Bool)

(assert (=> b!1042091 (= tp!74388 b_and!33561)))

(declare-fun mapIsEmpty!38768 () Bool)

(declare-fun mapRes!38768 () Bool)

(assert (=> mapIsEmpty!38768 mapRes!38768))

(declare-fun b!1042090 () Bool)

(declare-fun res!694424 () Bool)

(declare-fun e!590270 () Bool)

(assert (=> b!1042090 (=> res!694424 e!590270)))

(declare-datatypes ((V!37907 0))(
  ( (V!37908 (val!12438 Int)) )
))
(declare-datatypes ((ValueCell!11684 0))(
  ( (ValueCellFull!11684 (v!15028 V!37907)) (EmptyCell!11684) )
))
(declare-datatypes ((array!65641 0))(
  ( (array!65642 (arr!31578 (Array (_ BitVec 32) (_ BitVec 64))) (size!32115 (_ BitVec 32))) )
))
(declare-datatypes ((array!65643 0))(
  ( (array!65644 (arr!31579 (Array (_ BitVec 32) ValueCell!11684)) (size!32116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5962 0))(
  ( (LongMapFixedSize!5963 (defaultEntry!6363 Int) (mask!30415 (_ BitVec 32)) (extraKeys!6091 (_ BitVec 32)) (zeroValue!6197 V!37907) (minValue!6197 V!37907) (_size!3036 (_ BitVec 32)) (_keys!11607 array!65641) (_values!6386 array!65643) (_vacant!3036 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5962)

(assert (=> b!1042090 (= res!694424 (or (not (= (size!32116 (_values!6386 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30415 thiss!1427)))) (not (= (size!32115 (_keys!11607 thiss!1427)) (size!32116 (_values!6386 thiss!1427)))) (bvslt (mask!30415 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6091 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6091 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38768 () Bool)

(declare-fun tp!74387 () Bool)

(declare-fun e!590268 () Bool)

(assert (=> mapNonEmpty!38768 (= mapRes!38768 (and tp!74387 e!590268))))

(declare-fun mapValue!38768 () ValueCell!11684)

(declare-fun mapKey!38768 () (_ BitVec 32))

(declare-fun mapRest!38768 () (Array (_ BitVec 32) ValueCell!11684))

(assert (=> mapNonEmpty!38768 (= (arr!31579 (_values!6386 thiss!1427)) (store mapRest!38768 mapKey!38768 mapValue!38768))))

(declare-fun res!694423 () Bool)

(declare-fun e!590265 () Bool)

(assert (=> start!91482 (=> (not res!694423) (not e!590265))))

(declare-fun valid!2230 (LongMapFixedSize!5962) Bool)

(assert (=> start!91482 (= res!694423 (valid!2230 thiss!1427))))

(assert (=> start!91482 e!590265))

(declare-fun e!590264 () Bool)

(assert (=> start!91482 e!590264))

(assert (=> start!91482 true))

(declare-fun tp_is_empty!24775 () Bool)

(declare-fun e!590271 () Bool)

(declare-fun array_inv!24405 (array!65641) Bool)

(declare-fun array_inv!24406 (array!65643) Bool)

(assert (=> b!1042091 (= e!590264 (and tp!74388 tp_is_empty!24775 (array_inv!24405 (_keys!11607 thiss!1427)) (array_inv!24406 (_values!6386 thiss!1427)) e!590271))))

(declare-fun b!1042092 () Bool)

(declare-fun e!590267 () Bool)

(assert (=> b!1042092 (= e!590267 tp_is_empty!24775)))

(declare-fun b!1042093 () Bool)

(declare-fun e!590269 () Bool)

(assert (=> b!1042093 (= e!590265 e!590269)))

(declare-fun res!694425 () Bool)

(assert (=> b!1042093 (=> (not res!694425) (not e!590269))))

(declare-datatypes ((SeekEntryResult!9813 0))(
  ( (MissingZero!9813 (index!41623 (_ BitVec 32))) (Found!9813 (index!41624 (_ BitVec 32))) (Intermediate!9813 (undefined!10625 Bool) (index!41625 (_ BitVec 32)) (x!93046 (_ BitVec 32))) (Undefined!9813) (MissingVacant!9813 (index!41626 (_ BitVec 32))) )
))
(declare-fun lt!459174 () SeekEntryResult!9813)

(get-info :version)

(assert (=> b!1042093 (= res!694425 ((_ is Found!9813) lt!459174))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65641 (_ BitVec 32)) SeekEntryResult!9813)

(assert (=> b!1042093 (= lt!459174 (seekEntry!0 key!909 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042094 () Bool)

(assert (=> b!1042094 (= e!590268 tp_is_empty!24775)))

(declare-fun b!1042095 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65641 (_ BitVec 32)) Bool)

(assert (=> b!1042095 (= e!590270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042096 () Bool)

(declare-fun res!694426 () Bool)

(assert (=> b!1042096 (=> (not res!694426) (not e!590265))))

(assert (=> b!1042096 (= res!694426 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042097 () Bool)

(assert (=> b!1042097 (= e!590269 (not e!590270))))

(declare-fun res!694422 () Bool)

(assert (=> b!1042097 (=> res!694422 e!590270)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042097 (= res!694422 (not (validMask!0 (mask!30415 thiss!1427))))))

(declare-fun lt!459177 () array!65641)

(declare-fun arrayContainsKey!0 (array!65641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042097 (not (arrayContainsKey!0 lt!459177 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33929 0))(
  ( (Unit!33930) )
))
(declare-fun lt!459175 () Unit!33929)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65641 (_ BitVec 32) (_ BitVec 64)) Unit!33929)

(assert (=> b!1042097 (= lt!459175 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) key!909))))

(assert (=> b!1042097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459177 (mask!30415 thiss!1427))))

(declare-fun lt!459176 () Unit!33929)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65641 (_ BitVec 32) (_ BitVec 32)) Unit!33929)

(assert (=> b!1042097 (= lt!459176 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) (mask!30415 thiss!1427)))))

(declare-datatypes ((List!22010 0))(
  ( (Nil!22007) (Cons!22006 (h!23214 (_ BitVec 64)) (t!31215 List!22010)) )
))
(declare-fun arrayNoDuplicates!0 (array!65641 (_ BitVec 32) List!22010) Bool)

(assert (=> b!1042097 (arrayNoDuplicates!0 lt!459177 #b00000000000000000000000000000000 Nil!22007)))

(declare-fun lt!459172 () Unit!33929)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22010) Unit!33929)

(assert (=> b!1042097 (= lt!459172 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41624 lt!459174) #b00000000000000000000000000000000 Nil!22007))))

(declare-fun arrayCountValidKeys!0 (array!65641 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042097 (= (arrayCountValidKeys!0 lt!459177 #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042097 (= lt!459177 (array!65642 (store (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32115 (_keys!11607 thiss!1427))))))

(declare-fun lt!459173 () Unit!33929)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65641 (_ BitVec 32) (_ BitVec 64)) Unit!33929)

(assert (=> b!1042097 (= lt!459173 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042098 () Bool)

(assert (=> b!1042098 (= e!590271 (and e!590267 mapRes!38768))))

(declare-fun condMapEmpty!38768 () Bool)

(declare-fun mapDefault!38768 () ValueCell!11684)

(assert (=> b!1042098 (= condMapEmpty!38768 (= (arr!31579 (_values!6386 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11684)) mapDefault!38768)))))

(assert (= (and start!91482 res!694423) b!1042096))

(assert (= (and b!1042096 res!694426) b!1042093))

(assert (= (and b!1042093 res!694425) b!1042097))

(assert (= (and b!1042097 (not res!694422)) b!1042090))

(assert (= (and b!1042090 (not res!694424)) b!1042095))

(assert (= (and b!1042098 condMapEmpty!38768) mapIsEmpty!38768))

(assert (= (and b!1042098 (not condMapEmpty!38768)) mapNonEmpty!38768))

(assert (= (and mapNonEmpty!38768 ((_ is ValueCellFull!11684) mapValue!38768)) b!1042094))

(assert (= (and b!1042098 ((_ is ValueCellFull!11684) mapDefault!38768)) b!1042092))

(assert (= b!1042091 b!1042098))

(assert (= start!91482 b!1042091))

(declare-fun m!960945 () Bool)

(assert (=> b!1042097 m!960945))

(declare-fun m!960947 () Bool)

(assert (=> b!1042097 m!960947))

(declare-fun m!960949 () Bool)

(assert (=> b!1042097 m!960949))

(declare-fun m!960951 () Bool)

(assert (=> b!1042097 m!960951))

(declare-fun m!960953 () Bool)

(assert (=> b!1042097 m!960953))

(declare-fun m!960955 () Bool)

(assert (=> b!1042097 m!960955))

(declare-fun m!960957 () Bool)

(assert (=> b!1042097 m!960957))

(declare-fun m!960959 () Bool)

(assert (=> b!1042097 m!960959))

(declare-fun m!960961 () Bool)

(assert (=> b!1042097 m!960961))

(declare-fun m!960963 () Bool)

(assert (=> b!1042097 m!960963))

(declare-fun m!960965 () Bool)

(assert (=> b!1042097 m!960965))

(declare-fun m!960967 () Bool)

(assert (=> b!1042093 m!960967))

(declare-fun m!960969 () Bool)

(assert (=> start!91482 m!960969))

(declare-fun m!960971 () Bool)

(assert (=> b!1042095 m!960971))

(declare-fun m!960973 () Bool)

(assert (=> mapNonEmpty!38768 m!960973))

(declare-fun m!960975 () Bool)

(assert (=> b!1042091 m!960975))

(declare-fun m!960977 () Bool)

(assert (=> b!1042091 m!960977))

(check-sat tp_is_empty!24775 (not mapNonEmpty!38768) (not b!1042093) (not b!1042097) (not b_next!21055) (not b!1042095) (not b!1042091) (not start!91482) b_and!33561)
(check-sat b_and!33561 (not b_next!21055))
(get-model)

(declare-fun b!1042161 () Bool)

(declare-fun e!590328 () Bool)

(declare-fun call!44143 () Bool)

(assert (=> b!1042161 (= e!590328 call!44143)))

(declare-fun d!125935 () Bool)

(declare-fun res!694462 () Bool)

(declare-fun e!590326 () Bool)

(assert (=> d!125935 (=> res!694462 e!590326)))

(assert (=> d!125935 (= res!694462 (bvsge #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))))))

(assert (=> d!125935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)) e!590326)))

(declare-fun bm!44140 () Bool)

(assert (=> bm!44140 (= call!44143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042162 () Bool)

(declare-fun e!590327 () Bool)

(assert (=> b!1042162 (= e!590328 e!590327)))

(declare-fun lt!459222 () (_ BitVec 64))

(assert (=> b!1042162 (= lt!459222 (select (arr!31578 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459220 () Unit!33929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65641 (_ BitVec 64) (_ BitVec 32)) Unit!33929)

(assert (=> b!1042162 (= lt!459220 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11607 thiss!1427) lt!459222 #b00000000000000000000000000000000))))

(assert (=> b!1042162 (arrayContainsKey!0 (_keys!11607 thiss!1427) lt!459222 #b00000000000000000000000000000000)))

(declare-fun lt!459221 () Unit!33929)

(assert (=> b!1042162 (= lt!459221 lt!459220)))

(declare-fun res!694461 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65641 (_ BitVec 32)) SeekEntryResult!9813)

(assert (=> b!1042162 (= res!694461 (= (seekEntryOrOpen!0 (select (arr!31578 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000) (_keys!11607 thiss!1427) (mask!30415 thiss!1427)) (Found!9813 #b00000000000000000000000000000000)))))

(assert (=> b!1042162 (=> (not res!694461) (not e!590327))))

(declare-fun b!1042163 () Bool)

(assert (=> b!1042163 (= e!590326 e!590328)))

(declare-fun c!105772 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042163 (= c!105772 (validKeyInArray!0 (select (arr!31578 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042164 () Bool)

(assert (=> b!1042164 (= e!590327 call!44143)))

(assert (= (and d!125935 (not res!694462)) b!1042163))

(assert (= (and b!1042163 c!105772) b!1042162))

(assert (= (and b!1042163 (not c!105772)) b!1042161))

(assert (= (and b!1042162 res!694461) b!1042164))

(assert (= (or b!1042164 b!1042161) bm!44140))

(declare-fun m!961047 () Bool)

(assert (=> bm!44140 m!961047))

(declare-fun m!961049 () Bool)

(assert (=> b!1042162 m!961049))

(declare-fun m!961051 () Bool)

(assert (=> b!1042162 m!961051))

(declare-fun m!961053 () Bool)

(assert (=> b!1042162 m!961053))

(assert (=> b!1042162 m!961049))

(declare-fun m!961055 () Bool)

(assert (=> b!1042162 m!961055))

(assert (=> b!1042163 m!961049))

(assert (=> b!1042163 m!961049))

(declare-fun m!961057 () Bool)

(assert (=> b!1042163 m!961057))

(assert (=> b!1042095 d!125935))

(declare-fun d!125937 () Bool)

(assert (=> d!125937 (= (array_inv!24405 (_keys!11607 thiss!1427)) (bvsge (size!32115 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042091 d!125937))

(declare-fun d!125939 () Bool)

(assert (=> d!125939 (= (array_inv!24406 (_values!6386 thiss!1427)) (bvsge (size!32116 (_values!6386 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042091 d!125939))

(declare-fun d!125941 () Bool)

(declare-fun res!694471 () Bool)

(declare-fun e!590339 () Bool)

(assert (=> d!125941 (=> res!694471 e!590339)))

(assert (=> d!125941 (= res!694471 (bvsge #b00000000000000000000000000000000 (size!32115 lt!459177)))))

(assert (=> d!125941 (= (arrayNoDuplicates!0 lt!459177 #b00000000000000000000000000000000 Nil!22007) e!590339)))

(declare-fun b!1042175 () Bool)

(declare-fun e!590337 () Bool)

(declare-fun call!44146 () Bool)

(assert (=> b!1042175 (= e!590337 call!44146)))

(declare-fun bm!44143 () Bool)

(declare-fun c!105775 () Bool)

(assert (=> bm!44143 (= call!44146 (arrayNoDuplicates!0 lt!459177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105775 (Cons!22006 (select (arr!31578 lt!459177) #b00000000000000000000000000000000) Nil!22007) Nil!22007)))))

(declare-fun b!1042176 () Bool)

(assert (=> b!1042176 (= e!590337 call!44146)))

(declare-fun b!1042177 () Bool)

(declare-fun e!590340 () Bool)

(declare-fun contains!6037 (List!22010 (_ BitVec 64)) Bool)

(assert (=> b!1042177 (= e!590340 (contains!6037 Nil!22007 (select (arr!31578 lt!459177) #b00000000000000000000000000000000)))))

(declare-fun b!1042178 () Bool)

(declare-fun e!590338 () Bool)

(assert (=> b!1042178 (= e!590339 e!590338)))

(declare-fun res!694469 () Bool)

(assert (=> b!1042178 (=> (not res!694469) (not e!590338))))

(assert (=> b!1042178 (= res!694469 (not e!590340))))

(declare-fun res!694470 () Bool)

(assert (=> b!1042178 (=> (not res!694470) (not e!590340))))

(assert (=> b!1042178 (= res!694470 (validKeyInArray!0 (select (arr!31578 lt!459177) #b00000000000000000000000000000000)))))

(declare-fun b!1042179 () Bool)

(assert (=> b!1042179 (= e!590338 e!590337)))

(assert (=> b!1042179 (= c!105775 (validKeyInArray!0 (select (arr!31578 lt!459177) #b00000000000000000000000000000000)))))

(assert (= (and d!125941 (not res!694471)) b!1042178))

(assert (= (and b!1042178 res!694470) b!1042177))

(assert (= (and b!1042178 res!694469) b!1042179))

(assert (= (and b!1042179 c!105775) b!1042176))

(assert (= (and b!1042179 (not c!105775)) b!1042175))

(assert (= (or b!1042176 b!1042175) bm!44143))

(declare-fun m!961059 () Bool)

(assert (=> bm!44143 m!961059))

(declare-fun m!961061 () Bool)

(assert (=> bm!44143 m!961061))

(assert (=> b!1042177 m!961059))

(assert (=> b!1042177 m!961059))

(declare-fun m!961063 () Bool)

(assert (=> b!1042177 m!961063))

(assert (=> b!1042178 m!961059))

(assert (=> b!1042178 m!961059))

(declare-fun m!961065 () Bool)

(assert (=> b!1042178 m!961065))

(assert (=> b!1042179 m!961059))

(assert (=> b!1042179 m!961059))

(assert (=> b!1042179 m!961065))

(assert (=> b!1042097 d!125941))

(declare-fun b!1042180 () Bool)

(declare-fun e!590343 () Bool)

(declare-fun call!44147 () Bool)

(assert (=> b!1042180 (= e!590343 call!44147)))

(declare-fun d!125943 () Bool)

(declare-fun res!694473 () Bool)

(declare-fun e!590341 () Bool)

(assert (=> d!125943 (=> res!694473 e!590341)))

(assert (=> d!125943 (= res!694473 (bvsge #b00000000000000000000000000000000 (size!32115 lt!459177)))))

(assert (=> d!125943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459177 (mask!30415 thiss!1427)) e!590341)))

(declare-fun bm!44144 () Bool)

(assert (=> bm!44144 (= call!44147 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459177 (mask!30415 thiss!1427)))))

(declare-fun b!1042181 () Bool)

(declare-fun e!590342 () Bool)

(assert (=> b!1042181 (= e!590343 e!590342)))

(declare-fun lt!459225 () (_ BitVec 64))

(assert (=> b!1042181 (= lt!459225 (select (arr!31578 lt!459177) #b00000000000000000000000000000000))))

(declare-fun lt!459223 () Unit!33929)

(assert (=> b!1042181 (= lt!459223 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459177 lt!459225 #b00000000000000000000000000000000))))

(assert (=> b!1042181 (arrayContainsKey!0 lt!459177 lt!459225 #b00000000000000000000000000000000)))

(declare-fun lt!459224 () Unit!33929)

(assert (=> b!1042181 (= lt!459224 lt!459223)))

(declare-fun res!694472 () Bool)

(assert (=> b!1042181 (= res!694472 (= (seekEntryOrOpen!0 (select (arr!31578 lt!459177) #b00000000000000000000000000000000) lt!459177 (mask!30415 thiss!1427)) (Found!9813 #b00000000000000000000000000000000)))))

(assert (=> b!1042181 (=> (not res!694472) (not e!590342))))

(declare-fun b!1042182 () Bool)

(assert (=> b!1042182 (= e!590341 e!590343)))

(declare-fun c!105776 () Bool)

(assert (=> b!1042182 (= c!105776 (validKeyInArray!0 (select (arr!31578 lt!459177) #b00000000000000000000000000000000)))))

(declare-fun b!1042183 () Bool)

(assert (=> b!1042183 (= e!590342 call!44147)))

(assert (= (and d!125943 (not res!694473)) b!1042182))

(assert (= (and b!1042182 c!105776) b!1042181))

(assert (= (and b!1042182 (not c!105776)) b!1042180))

(assert (= (and b!1042181 res!694472) b!1042183))

(assert (= (or b!1042183 b!1042180) bm!44144))

(declare-fun m!961067 () Bool)

(assert (=> bm!44144 m!961067))

(assert (=> b!1042181 m!961059))

(declare-fun m!961069 () Bool)

(assert (=> b!1042181 m!961069))

(declare-fun m!961071 () Bool)

(assert (=> b!1042181 m!961071))

(assert (=> b!1042181 m!961059))

(declare-fun m!961073 () Bool)

(assert (=> b!1042181 m!961073))

(assert (=> b!1042182 m!961059))

(assert (=> b!1042182 m!961059))

(assert (=> b!1042182 m!961065))

(assert (=> b!1042097 d!125943))

(declare-fun b!1042194 () Bool)

(declare-fun e!590348 () Bool)

(assert (=> b!1042194 (= e!590348 (bvslt (size!32115 (_keys!11607 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042195 () Bool)

(declare-fun e!590349 () Bool)

(assert (=> b!1042195 (= e!590349 (= (arrayCountValidKeys!0 (array!65642 (store (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32115 (_keys!11607 thiss!1427))) #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1042193 () Bool)

(declare-fun res!694484 () Bool)

(assert (=> b!1042193 (=> (not res!694484) (not e!590348))))

(assert (=> b!1042193 (= res!694484 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125945 () Bool)

(assert (=> d!125945 e!590349))

(declare-fun res!694483 () Bool)

(assert (=> d!125945 (=> (not res!694483) (not e!590349))))

(assert (=> d!125945 (= res!694483 (and (bvsge (index!41624 lt!459174) #b00000000000000000000000000000000) (bvslt (index!41624 lt!459174) (size!32115 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459228 () Unit!33929)

(declare-fun choose!82 (array!65641 (_ BitVec 32) (_ BitVec 64)) Unit!33929)

(assert (=> d!125945 (= lt!459228 (choose!82 (_keys!11607 thiss!1427) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125945 e!590348))

(declare-fun res!694482 () Bool)

(assert (=> d!125945 (=> (not res!694482) (not e!590348))))

(assert (=> d!125945 (= res!694482 (and (bvsge (index!41624 lt!459174) #b00000000000000000000000000000000) (bvslt (index!41624 lt!459174) (size!32115 (_keys!11607 thiss!1427)))))))

(assert (=> d!125945 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459228)))

(declare-fun b!1042192 () Bool)

(declare-fun res!694485 () Bool)

(assert (=> b!1042192 (=> (not res!694485) (not e!590348))))

(assert (=> b!1042192 (= res!694485 (validKeyInArray!0 (select (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174))))))

(assert (= (and d!125945 res!694482) b!1042192))

(assert (= (and b!1042192 res!694485) b!1042193))

(assert (= (and b!1042193 res!694484) b!1042194))

(assert (= (and d!125945 res!694483) b!1042195))

(assert (=> b!1042195 m!960959))

(declare-fun m!961075 () Bool)

(assert (=> b!1042195 m!961075))

(assert (=> b!1042195 m!960953))

(declare-fun m!961077 () Bool)

(assert (=> b!1042193 m!961077))

(declare-fun m!961079 () Bool)

(assert (=> d!125945 m!961079))

(declare-fun m!961081 () Bool)

(assert (=> b!1042192 m!961081))

(assert (=> b!1042192 m!961081))

(declare-fun m!961083 () Bool)

(assert (=> b!1042192 m!961083))

(assert (=> b!1042097 d!125945))

(declare-fun d!125947 () Bool)

(declare-fun e!590352 () Bool)

(assert (=> d!125947 e!590352))

(declare-fun res!694488 () Bool)

(assert (=> d!125947 (=> (not res!694488) (not e!590352))))

(assert (=> d!125947 (= res!694488 (and (bvsge (index!41624 lt!459174) #b00000000000000000000000000000000) (bvslt (index!41624 lt!459174) (size!32115 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459231 () Unit!33929)

(declare-fun choose!53 (array!65641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22010) Unit!33929)

(assert (=> d!125947 (= lt!459231 (choose!53 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41624 lt!459174) #b00000000000000000000000000000000 Nil!22007))))

(assert (=> d!125947 (bvslt (size!32115 (_keys!11607 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125947 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11607 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41624 lt!459174) #b00000000000000000000000000000000 Nil!22007) lt!459231)))

(declare-fun b!1042198 () Bool)

(assert (=> b!1042198 (= e!590352 (arrayNoDuplicates!0 (array!65642 (store (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32115 (_keys!11607 thiss!1427))) #b00000000000000000000000000000000 Nil!22007))))

(assert (= (and d!125947 res!694488) b!1042198))

(declare-fun m!961085 () Bool)

(assert (=> d!125947 m!961085))

(assert (=> b!1042198 m!960959))

(declare-fun m!961087 () Bool)

(assert (=> b!1042198 m!961087))

(assert (=> b!1042097 d!125947))

(declare-fun d!125949 () Bool)

(assert (=> d!125949 (= (validMask!0 (mask!30415 thiss!1427)) (and (or (= (mask!30415 thiss!1427) #b00000000000000000000000000000111) (= (mask!30415 thiss!1427) #b00000000000000000000000000001111) (= (mask!30415 thiss!1427) #b00000000000000000000000000011111) (= (mask!30415 thiss!1427) #b00000000000000000000000000111111) (= (mask!30415 thiss!1427) #b00000000000000000000000001111111) (= (mask!30415 thiss!1427) #b00000000000000000000000011111111) (= (mask!30415 thiss!1427) #b00000000000000000000000111111111) (= (mask!30415 thiss!1427) #b00000000000000000000001111111111) (= (mask!30415 thiss!1427) #b00000000000000000000011111111111) (= (mask!30415 thiss!1427) #b00000000000000000000111111111111) (= (mask!30415 thiss!1427) #b00000000000000000001111111111111) (= (mask!30415 thiss!1427) #b00000000000000000011111111111111) (= (mask!30415 thiss!1427) #b00000000000000000111111111111111) (= (mask!30415 thiss!1427) #b00000000000000001111111111111111) (= (mask!30415 thiss!1427) #b00000000000000011111111111111111) (= (mask!30415 thiss!1427) #b00000000000000111111111111111111) (= (mask!30415 thiss!1427) #b00000000000001111111111111111111) (= (mask!30415 thiss!1427) #b00000000000011111111111111111111) (= (mask!30415 thiss!1427) #b00000000000111111111111111111111) (= (mask!30415 thiss!1427) #b00000000001111111111111111111111) (= (mask!30415 thiss!1427) #b00000000011111111111111111111111) (= (mask!30415 thiss!1427) #b00000000111111111111111111111111) (= (mask!30415 thiss!1427) #b00000001111111111111111111111111) (= (mask!30415 thiss!1427) #b00000011111111111111111111111111) (= (mask!30415 thiss!1427) #b00000111111111111111111111111111) (= (mask!30415 thiss!1427) #b00001111111111111111111111111111) (= (mask!30415 thiss!1427) #b00011111111111111111111111111111) (= (mask!30415 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30415 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042097 d!125949))

(declare-fun d!125951 () Bool)

(declare-fun res!694493 () Bool)

(declare-fun e!590357 () Bool)

(assert (=> d!125951 (=> res!694493 e!590357)))

(assert (=> d!125951 (= res!694493 (= (select (arr!31578 lt!459177) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125951 (= (arrayContainsKey!0 lt!459177 key!909 #b00000000000000000000000000000000) e!590357)))

(declare-fun b!1042203 () Bool)

(declare-fun e!590358 () Bool)

(assert (=> b!1042203 (= e!590357 e!590358)))

(declare-fun res!694494 () Bool)

(assert (=> b!1042203 (=> (not res!694494) (not e!590358))))

(assert (=> b!1042203 (= res!694494 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32115 lt!459177)))))

(declare-fun b!1042204 () Bool)

(assert (=> b!1042204 (= e!590358 (arrayContainsKey!0 lt!459177 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125951 (not res!694493)) b!1042203))

(assert (= (and b!1042203 res!694494) b!1042204))

(assert (=> d!125951 m!961059))

(declare-fun m!961089 () Bool)

(assert (=> b!1042204 m!961089))

(assert (=> b!1042097 d!125951))

(declare-fun d!125953 () Bool)

(declare-fun e!590361 () Bool)

(assert (=> d!125953 e!590361))

(declare-fun res!694497 () Bool)

(assert (=> d!125953 (=> (not res!694497) (not e!590361))))

(assert (=> d!125953 (= res!694497 (bvslt (index!41624 lt!459174) (size!32115 (_keys!11607 thiss!1427))))))

(declare-fun lt!459234 () Unit!33929)

(declare-fun choose!121 (array!65641 (_ BitVec 32) (_ BitVec 64)) Unit!33929)

(assert (=> d!125953 (= lt!459234 (choose!121 (_keys!11607 thiss!1427) (index!41624 lt!459174) key!909))))

(assert (=> d!125953 (bvsge (index!41624 lt!459174) #b00000000000000000000000000000000)))

(assert (=> d!125953 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) key!909) lt!459234)))

(declare-fun b!1042207 () Bool)

(assert (=> b!1042207 (= e!590361 (not (arrayContainsKey!0 (array!65642 (store (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32115 (_keys!11607 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125953 res!694497) b!1042207))

(declare-fun m!961091 () Bool)

(assert (=> d!125953 m!961091))

(assert (=> b!1042207 m!960959))

(declare-fun m!961093 () Bool)

(assert (=> b!1042207 m!961093))

(assert (=> b!1042097 d!125953))

(declare-fun b!1042216 () Bool)

(declare-fun e!590366 () (_ BitVec 32))

(declare-fun e!590367 () (_ BitVec 32))

(assert (=> b!1042216 (= e!590366 e!590367)))

(declare-fun c!105781 () Bool)

(assert (=> b!1042216 (= c!105781 (validKeyInArray!0 (select (arr!31578 lt!459177) #b00000000000000000000000000000000)))))

(declare-fun b!1042217 () Bool)

(declare-fun call!44150 () (_ BitVec 32))

(assert (=> b!1042217 (= e!590367 call!44150)))

(declare-fun b!1042218 () Bool)

(assert (=> b!1042218 (= e!590367 (bvadd #b00000000000000000000000000000001 call!44150))))

(declare-fun bm!44147 () Bool)

(assert (=> bm!44147 (= call!44150 (arrayCountValidKeys!0 lt!459177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32115 (_keys!11607 thiss!1427))))))

(declare-fun d!125955 () Bool)

(declare-fun lt!459237 () (_ BitVec 32))

(assert (=> d!125955 (and (bvsge lt!459237 #b00000000000000000000000000000000) (bvsle lt!459237 (bvsub (size!32115 lt!459177) #b00000000000000000000000000000000)))))

(assert (=> d!125955 (= lt!459237 e!590366)))

(declare-fun c!105782 () Bool)

(assert (=> d!125955 (= c!105782 (bvsge #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))))))

(assert (=> d!125955 (and (bvsle #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32115 (_keys!11607 thiss!1427)) (size!32115 lt!459177)))))

(assert (=> d!125955 (= (arrayCountValidKeys!0 lt!459177 #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) lt!459237)))

(declare-fun b!1042219 () Bool)

(assert (=> b!1042219 (= e!590366 #b00000000000000000000000000000000)))

(assert (= (and d!125955 c!105782) b!1042219))

(assert (= (and d!125955 (not c!105782)) b!1042216))

(assert (= (and b!1042216 c!105781) b!1042218))

(assert (= (and b!1042216 (not c!105781)) b!1042217))

(assert (= (or b!1042218 b!1042217) bm!44147))

(assert (=> b!1042216 m!961059))

(assert (=> b!1042216 m!961059))

(assert (=> b!1042216 m!961065))

(declare-fun m!961095 () Bool)

(assert (=> bm!44147 m!961095))

(assert (=> b!1042097 d!125955))

(declare-fun b!1042220 () Bool)

(declare-fun e!590368 () (_ BitVec 32))

(declare-fun e!590369 () (_ BitVec 32))

(assert (=> b!1042220 (= e!590368 e!590369)))

(declare-fun c!105783 () Bool)

(assert (=> b!1042220 (= c!105783 (validKeyInArray!0 (select (arr!31578 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042221 () Bool)

(declare-fun call!44151 () (_ BitVec 32))

(assert (=> b!1042221 (= e!590369 call!44151)))

(declare-fun b!1042222 () Bool)

(assert (=> b!1042222 (= e!590369 (bvadd #b00000000000000000000000000000001 call!44151))))

(declare-fun bm!44148 () Bool)

(assert (=> bm!44148 (= call!44151 (arrayCountValidKeys!0 (_keys!11607 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32115 (_keys!11607 thiss!1427))))))

(declare-fun d!125957 () Bool)

(declare-fun lt!459238 () (_ BitVec 32))

(assert (=> d!125957 (and (bvsge lt!459238 #b00000000000000000000000000000000) (bvsle lt!459238 (bvsub (size!32115 (_keys!11607 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125957 (= lt!459238 e!590368)))

(declare-fun c!105784 () Bool)

(assert (=> d!125957 (= c!105784 (bvsge #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))))))

(assert (=> d!125957 (and (bvsle #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32115 (_keys!11607 thiss!1427)) (size!32115 (_keys!11607 thiss!1427))))))

(assert (=> d!125957 (= (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) lt!459238)))

(declare-fun b!1042223 () Bool)

(assert (=> b!1042223 (= e!590368 #b00000000000000000000000000000000)))

(assert (= (and d!125957 c!105784) b!1042223))

(assert (= (and d!125957 (not c!105784)) b!1042220))

(assert (= (and b!1042220 c!105783) b!1042222))

(assert (= (and b!1042220 (not c!105783)) b!1042221))

(assert (= (or b!1042222 b!1042221) bm!44148))

(assert (=> b!1042220 m!961049))

(assert (=> b!1042220 m!961049))

(assert (=> b!1042220 m!961057))

(declare-fun m!961097 () Bool)

(assert (=> bm!44148 m!961097))

(assert (=> b!1042097 d!125957))

(declare-fun d!125959 () Bool)

(declare-fun e!590372 () Bool)

(assert (=> d!125959 e!590372))

(declare-fun res!694500 () Bool)

(assert (=> d!125959 (=> (not res!694500) (not e!590372))))

(assert (=> d!125959 (= res!694500 (and (bvsge (index!41624 lt!459174) #b00000000000000000000000000000000) (bvslt (index!41624 lt!459174) (size!32115 (_keys!11607 thiss!1427)))))))

(declare-fun lt!459241 () Unit!33929)

(declare-fun choose!25 (array!65641 (_ BitVec 32) (_ BitVec 32)) Unit!33929)

(assert (=> d!125959 (= lt!459241 (choose!25 (_keys!11607 thiss!1427) (index!41624 lt!459174) (mask!30415 thiss!1427)))))

(assert (=> d!125959 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!125959 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11607 thiss!1427) (index!41624 lt!459174) (mask!30415 thiss!1427)) lt!459241)))

(declare-fun b!1042226 () Bool)

(assert (=> b!1042226 (= e!590372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65642 (store (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459174) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32115 (_keys!11607 thiss!1427))) (mask!30415 thiss!1427)))))

(assert (= (and d!125959 res!694500) b!1042226))

(declare-fun m!961099 () Bool)

(assert (=> d!125959 m!961099))

(assert (=> d!125959 m!960945))

(assert (=> b!1042226 m!960959))

(declare-fun m!961101 () Bool)

(assert (=> b!1042226 m!961101))

(assert (=> b!1042097 d!125959))

(declare-fun d!125961 () Bool)

(declare-fun res!694507 () Bool)

(declare-fun e!590375 () Bool)

(assert (=> d!125961 (=> (not res!694507) (not e!590375))))

(declare-fun simpleValid!441 (LongMapFixedSize!5962) Bool)

(assert (=> d!125961 (= res!694507 (simpleValid!441 thiss!1427))))

(assert (=> d!125961 (= (valid!2230 thiss!1427) e!590375)))

(declare-fun b!1042233 () Bool)

(declare-fun res!694508 () Bool)

(assert (=> b!1042233 (=> (not res!694508) (not e!590375))))

(assert (=> b!1042233 (= res!694508 (= (arrayCountValidKeys!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 (size!32115 (_keys!11607 thiss!1427))) (_size!3036 thiss!1427)))))

(declare-fun b!1042234 () Bool)

(declare-fun res!694509 () Bool)

(assert (=> b!1042234 (=> (not res!694509) (not e!590375))))

(assert (=> b!1042234 (= res!694509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042235 () Bool)

(assert (=> b!1042235 (= e!590375 (arrayNoDuplicates!0 (_keys!11607 thiss!1427) #b00000000000000000000000000000000 Nil!22007))))

(assert (= (and d!125961 res!694507) b!1042233))

(assert (= (and b!1042233 res!694508) b!1042234))

(assert (= (and b!1042234 res!694509) b!1042235))

(declare-fun m!961103 () Bool)

(assert (=> d!125961 m!961103))

(assert (=> b!1042233 m!960953))

(assert (=> b!1042234 m!960971))

(declare-fun m!961105 () Bool)

(assert (=> b!1042235 m!961105))

(assert (=> start!91482 d!125961))

(declare-fun b!1042248 () Bool)

(declare-fun e!590384 () SeekEntryResult!9813)

(declare-fun lt!459250 () SeekEntryResult!9813)

(assert (=> b!1042248 (= e!590384 (ite ((_ is MissingVacant!9813) lt!459250) (MissingZero!9813 (index!41626 lt!459250)) lt!459250))))

(declare-fun lt!459253 () SeekEntryResult!9813)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65641 (_ BitVec 32)) SeekEntryResult!9813)

(assert (=> b!1042248 (= lt!459250 (seekKeyOrZeroReturnVacant!0 (x!93046 lt!459253) (index!41625 lt!459253) (index!41625 lt!459253) key!909 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(declare-fun b!1042249 () Bool)

(declare-fun e!590382 () SeekEntryResult!9813)

(assert (=> b!1042249 (= e!590382 (Found!9813 (index!41625 lt!459253)))))

(declare-fun d!125963 () Bool)

(declare-fun lt!459251 () SeekEntryResult!9813)

(assert (=> d!125963 (and (or ((_ is MissingVacant!9813) lt!459251) (not ((_ is Found!9813) lt!459251)) (and (bvsge (index!41624 lt!459251) #b00000000000000000000000000000000) (bvslt (index!41624 lt!459251) (size!32115 (_keys!11607 thiss!1427))))) (not ((_ is MissingVacant!9813) lt!459251)) (or (not ((_ is Found!9813) lt!459251)) (= (select (arr!31578 (_keys!11607 thiss!1427)) (index!41624 lt!459251)) key!909)))))

(declare-fun e!590383 () SeekEntryResult!9813)

(assert (=> d!125963 (= lt!459251 e!590383)))

(declare-fun c!105791 () Bool)

(assert (=> d!125963 (= c!105791 (and ((_ is Intermediate!9813) lt!459253) (undefined!10625 lt!459253)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65641 (_ BitVec 32)) SeekEntryResult!9813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125963 (= lt!459253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30415 thiss!1427)) key!909 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)))))

(assert (=> d!125963 (validMask!0 (mask!30415 thiss!1427))))

(assert (=> d!125963 (= (seekEntry!0 key!909 (_keys!11607 thiss!1427) (mask!30415 thiss!1427)) lt!459251)))

(declare-fun b!1042250 () Bool)

(declare-fun c!105793 () Bool)

(declare-fun lt!459252 () (_ BitVec 64))

(assert (=> b!1042250 (= c!105793 (= lt!459252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042250 (= e!590382 e!590384)))

(declare-fun b!1042251 () Bool)

(assert (=> b!1042251 (= e!590383 Undefined!9813)))

(declare-fun b!1042252 () Bool)

(assert (=> b!1042252 (= e!590384 (MissingZero!9813 (index!41625 lt!459253)))))

(declare-fun b!1042253 () Bool)

(assert (=> b!1042253 (= e!590383 e!590382)))

(assert (=> b!1042253 (= lt!459252 (select (arr!31578 (_keys!11607 thiss!1427)) (index!41625 lt!459253)))))

(declare-fun c!105792 () Bool)

(assert (=> b!1042253 (= c!105792 (= lt!459252 key!909))))

(assert (= (and d!125963 c!105791) b!1042251))

(assert (= (and d!125963 (not c!105791)) b!1042253))

(assert (= (and b!1042253 c!105792) b!1042249))

(assert (= (and b!1042253 (not c!105792)) b!1042250))

(assert (= (and b!1042250 c!105793) b!1042252))

(assert (= (and b!1042250 (not c!105793)) b!1042248))

(declare-fun m!961107 () Bool)

(assert (=> b!1042248 m!961107))

(declare-fun m!961109 () Bool)

(assert (=> d!125963 m!961109))

(declare-fun m!961111 () Bool)

(assert (=> d!125963 m!961111))

(assert (=> d!125963 m!961111))

(declare-fun m!961113 () Bool)

(assert (=> d!125963 m!961113))

(assert (=> d!125963 m!960945))

(declare-fun m!961115 () Bool)

(assert (=> b!1042253 m!961115))

(assert (=> b!1042093 d!125963))

(declare-fun b!1042260 () Bool)

(declare-fun e!590389 () Bool)

(assert (=> b!1042260 (= e!590389 tp_is_empty!24775)))

(declare-fun b!1042261 () Bool)

(declare-fun e!590390 () Bool)

(assert (=> b!1042261 (= e!590390 tp_is_empty!24775)))

(declare-fun mapIsEmpty!38777 () Bool)

(declare-fun mapRes!38777 () Bool)

(assert (=> mapIsEmpty!38777 mapRes!38777))

(declare-fun condMapEmpty!38777 () Bool)

(declare-fun mapDefault!38777 () ValueCell!11684)

(assert (=> mapNonEmpty!38768 (= condMapEmpty!38777 (= mapRest!38768 ((as const (Array (_ BitVec 32) ValueCell!11684)) mapDefault!38777)))))

(assert (=> mapNonEmpty!38768 (= tp!74387 (and e!590390 mapRes!38777))))

(declare-fun mapNonEmpty!38777 () Bool)

(declare-fun tp!74403 () Bool)

(assert (=> mapNonEmpty!38777 (= mapRes!38777 (and tp!74403 e!590389))))

(declare-fun mapValue!38777 () ValueCell!11684)

(declare-fun mapRest!38777 () (Array (_ BitVec 32) ValueCell!11684))

(declare-fun mapKey!38777 () (_ BitVec 32))

(assert (=> mapNonEmpty!38777 (= mapRest!38768 (store mapRest!38777 mapKey!38777 mapValue!38777))))

(assert (= (and mapNonEmpty!38768 condMapEmpty!38777) mapIsEmpty!38777))

(assert (= (and mapNonEmpty!38768 (not condMapEmpty!38777)) mapNonEmpty!38777))

(assert (= (and mapNonEmpty!38777 ((_ is ValueCellFull!11684) mapValue!38777)) b!1042260))

(assert (= (and mapNonEmpty!38768 ((_ is ValueCellFull!11684) mapDefault!38777)) b!1042261))

(declare-fun m!961117 () Bool)

(assert (=> mapNonEmpty!38777 m!961117))

(check-sat (not b!1042234) tp_is_empty!24775 (not d!125961) (not d!125963) (not b!1042207) (not b!1042235) (not b_next!21055) (not bm!44144) (not b!1042195) (not bm!44140) (not d!125959) (not bm!44147) (not b!1042179) (not b!1042226) (not d!125945) (not b!1042220) (not b!1042204) (not b!1042182) (not b!1042193) (not bm!44148) (not b!1042163) (not b!1042248) (not b!1042192) b_and!33561 (not b!1042162) (not b!1042198) (not bm!44143) (not b!1042178) (not b!1042216) (not d!125947) (not b!1042177) (not b!1042181) (not mapNonEmpty!38777) (not b!1042233) (not d!125953))
(check-sat b_and!33561 (not b_next!21055))
