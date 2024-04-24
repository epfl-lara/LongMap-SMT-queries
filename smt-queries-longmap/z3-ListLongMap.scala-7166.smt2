; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91662 () Bool)

(assert start!91662)

(declare-fun b!1043255 () Bool)

(declare-fun b_free!21049 () Bool)

(declare-fun b_next!21049 () Bool)

(assert (=> b!1043255 (= b_free!21049 (not b_next!21049))))

(declare-fun tp!74366 () Bool)

(declare-fun b_and!33591 () Bool)

(assert (=> b!1043255 (= tp!74366 b_and!33591)))

(declare-fun b!1043249 () Bool)

(declare-fun e!590984 () Bool)

(declare-fun e!590982 () Bool)

(declare-fun mapRes!38755 () Bool)

(assert (=> b!1043249 (= e!590984 (and e!590982 mapRes!38755))))

(declare-fun condMapEmpty!38755 () Bool)

(declare-datatypes ((V!37899 0))(
  ( (V!37900 (val!12435 Int)) )
))
(declare-datatypes ((ValueCell!11681 0))(
  ( (ValueCellFull!11681 (v!15021 V!37899)) (EmptyCell!11681) )
))
(declare-datatypes ((array!65737 0))(
  ( (array!65738 (arr!31621 (Array (_ BitVec 32) (_ BitVec 64))) (size!32156 (_ BitVec 32))) )
))
(declare-datatypes ((array!65739 0))(
  ( (array!65740 (arr!31622 (Array (_ BitVec 32) ValueCell!11681)) (size!32157 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5956 0))(
  ( (LongMapFixedSize!5957 (defaultEntry!6360 Int) (mask!30466 (_ BitVec 32)) (extraKeys!6088 (_ BitVec 32)) (zeroValue!6194 V!37899) (minValue!6194 V!37899) (_size!3033 (_ BitVec 32)) (_keys!11641 array!65737) (_values!6383 array!65739) (_vacant!3033 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5956)

(declare-fun mapDefault!38755 () ValueCell!11681)

(assert (=> b!1043249 (= condMapEmpty!38755 (= (arr!31622 (_values!6383 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38755)))))

(declare-fun b!1043250 () Bool)

(declare-fun e!590981 () Bool)

(assert (=> b!1043250 (= e!590981 (or (not (= (size!32157 (_values!6383 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30466 thiss!1427)))) (not (= (size!32156 (_keys!11641 thiss!1427)) (size!32157 (_values!6383 thiss!1427)))) (bvslt (mask!30466 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6088 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6088 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043251 () Bool)

(declare-fun e!590985 () Bool)

(declare-fun e!590987 () Bool)

(assert (=> b!1043251 (= e!590985 e!590987)))

(declare-fun res!694861 () Bool)

(assert (=> b!1043251 (=> (not res!694861) (not e!590987))))

(declare-datatypes ((SeekEntryResult!9768 0))(
  ( (MissingZero!9768 (index!41443 (_ BitVec 32))) (Found!9768 (index!41444 (_ BitVec 32))) (Intermediate!9768 (undefined!10580 Bool) (index!41445 (_ BitVec 32)) (x!93001 (_ BitVec 32))) (Undefined!9768) (MissingVacant!9768 (index!41446 (_ BitVec 32))) )
))
(declare-fun lt!459756 () SeekEntryResult!9768)

(get-info :version)

(assert (=> b!1043251 (= res!694861 ((_ is Found!9768) lt!459756))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65737 (_ BitVec 32)) SeekEntryResult!9768)

(assert (=> b!1043251 (= lt!459756 (seekEntry!0 key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043252 () Bool)

(declare-fun tp_is_empty!24769 () Bool)

(assert (=> b!1043252 (= e!590982 tp_is_empty!24769)))

(declare-fun b!1043253 () Bool)

(declare-fun res!694864 () Bool)

(assert (=> b!1043253 (=> (not res!694864) (not e!590985))))

(assert (=> b!1043253 (= res!694864 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043254 () Bool)

(declare-fun e!590986 () Bool)

(assert (=> b!1043254 (= e!590986 tp_is_empty!24769)))

(declare-fun mapIsEmpty!38755 () Bool)

(assert (=> mapIsEmpty!38755 mapRes!38755))

(declare-fun e!590983 () Bool)

(declare-fun array_inv!24445 (array!65737) Bool)

(declare-fun array_inv!24446 (array!65739) Bool)

(assert (=> b!1043255 (= e!590983 (and tp!74366 tp_is_empty!24769 (array_inv!24445 (_keys!11641 thiss!1427)) (array_inv!24446 (_values!6383 thiss!1427)) e!590984))))

(declare-fun b!1043256 () Bool)

(assert (=> b!1043256 (= e!590987 (not e!590981))))

(declare-fun res!694863 () Bool)

(assert (=> b!1043256 (=> res!694863 e!590981)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043256 (= res!694863 (not (validMask!0 (mask!30466 thiss!1427))))))

(declare-fun lt!459754 () array!65737)

(declare-fun arrayContainsKey!0 (array!65737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043256 (not (arrayContainsKey!0 lt!459754 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34049 0))(
  ( (Unit!34050) )
))
(declare-fun lt!459752 () Unit!34049)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65737 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> b!1043256 (= lt!459752 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65737 (_ BitVec 32)) Bool)

(assert (=> b!1043256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459754 (mask!30466 thiss!1427))))

(declare-fun lt!459753 () Unit!34049)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65737 (_ BitVec 32) (_ BitVec 32)) Unit!34049)

(assert (=> b!1043256 (= lt!459753 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) (mask!30466 thiss!1427)))))

(declare-datatypes ((List!21962 0))(
  ( (Nil!21959) (Cons!21958 (h!23174 (_ BitVec 64)) (t!31168 List!21962)) )
))
(declare-fun arrayNoDuplicates!0 (array!65737 (_ BitVec 32) List!21962) Bool)

(assert (=> b!1043256 (arrayNoDuplicates!0 lt!459754 #b00000000000000000000000000000000 Nil!21959)))

(declare-fun lt!459751 () Unit!34049)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21962) Unit!34049)

(assert (=> b!1043256 (= lt!459751 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11641 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!459756) #b00000000000000000000000000000000 Nil!21959))))

(declare-fun arrayCountValidKeys!0 (array!65737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043256 (= (arrayCountValidKeys!0 lt!459754 #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043256 (= lt!459754 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun lt!459755 () Unit!34049)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65737 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> b!1043256 (= lt!459755 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!694862 () Bool)

(assert (=> start!91662 (=> (not res!694862) (not e!590985))))

(declare-fun valid!2242 (LongMapFixedSize!5956) Bool)

(assert (=> start!91662 (= res!694862 (valid!2242 thiss!1427))))

(assert (=> start!91662 e!590985))

(assert (=> start!91662 e!590983))

(assert (=> start!91662 true))

(declare-fun mapNonEmpty!38755 () Bool)

(declare-fun tp!74365 () Bool)

(assert (=> mapNonEmpty!38755 (= mapRes!38755 (and tp!74365 e!590986))))

(declare-fun mapRest!38755 () (Array (_ BitVec 32) ValueCell!11681))

(declare-fun mapKey!38755 () (_ BitVec 32))

(declare-fun mapValue!38755 () ValueCell!11681)

(assert (=> mapNonEmpty!38755 (= (arr!31622 (_values!6383 thiss!1427)) (store mapRest!38755 mapKey!38755 mapValue!38755))))

(assert (= (and start!91662 res!694862) b!1043253))

(assert (= (and b!1043253 res!694864) b!1043251))

(assert (= (and b!1043251 res!694861) b!1043256))

(assert (= (and b!1043256 (not res!694863)) b!1043250))

(assert (= (and b!1043249 condMapEmpty!38755) mapIsEmpty!38755))

(assert (= (and b!1043249 (not condMapEmpty!38755)) mapNonEmpty!38755))

(assert (= (and mapNonEmpty!38755 ((_ is ValueCellFull!11681) mapValue!38755)) b!1043254))

(assert (= (and b!1043249 ((_ is ValueCellFull!11681) mapDefault!38755)) b!1043252))

(assert (= b!1043255 b!1043249))

(assert (= start!91662 b!1043255))

(declare-fun m!962965 () Bool)

(assert (=> mapNonEmpty!38755 m!962965))

(declare-fun m!962967 () Bool)

(assert (=> start!91662 m!962967))

(declare-fun m!962969 () Bool)

(assert (=> b!1043256 m!962969))

(declare-fun m!962971 () Bool)

(assert (=> b!1043256 m!962971))

(declare-fun m!962973 () Bool)

(assert (=> b!1043256 m!962973))

(declare-fun m!962975 () Bool)

(assert (=> b!1043256 m!962975))

(declare-fun m!962977 () Bool)

(assert (=> b!1043256 m!962977))

(declare-fun m!962979 () Bool)

(assert (=> b!1043256 m!962979))

(declare-fun m!962981 () Bool)

(assert (=> b!1043256 m!962981))

(declare-fun m!962983 () Bool)

(assert (=> b!1043256 m!962983))

(declare-fun m!962985 () Bool)

(assert (=> b!1043256 m!962985))

(declare-fun m!962987 () Bool)

(assert (=> b!1043256 m!962987))

(declare-fun m!962989 () Bool)

(assert (=> b!1043256 m!962989))

(declare-fun m!962991 () Bool)

(assert (=> b!1043255 m!962991))

(declare-fun m!962993 () Bool)

(assert (=> b!1043255 m!962993))

(declare-fun m!962995 () Bool)

(assert (=> b!1043251 m!962995))

(check-sat (not start!91662) b_and!33591 tp_is_empty!24769 (not b!1043251) (not b!1043256) (not mapNonEmpty!38755) (not b_next!21049) (not b!1043255))
(check-sat b_and!33591 (not b_next!21049))
(get-model)

(declare-fun d!126463 () Bool)

(declare-fun res!694895 () Bool)

(declare-fun e!591039 () Bool)

(assert (=> d!126463 (=> (not res!694895) (not e!591039))))

(declare-fun simpleValid!440 (LongMapFixedSize!5956) Bool)

(assert (=> d!126463 (= res!694895 (simpleValid!440 thiss!1427))))

(assert (=> d!126463 (= (valid!2242 thiss!1427) e!591039)))

(declare-fun b!1043311 () Bool)

(declare-fun res!694896 () Bool)

(assert (=> b!1043311 (=> (not res!694896) (not e!591039))))

(assert (=> b!1043311 (= res!694896 (= (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (_size!3033 thiss!1427)))))

(declare-fun b!1043312 () Bool)

(declare-fun res!694897 () Bool)

(assert (=> b!1043312 (=> (not res!694897) (not e!591039))))

(assert (=> b!1043312 (= res!694897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043313 () Bool)

(assert (=> b!1043313 (= e!591039 (arrayNoDuplicates!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 Nil!21959))))

(assert (= (and d!126463 res!694895) b!1043311))

(assert (= (and b!1043311 res!694896) b!1043312))

(assert (= (and b!1043312 res!694897) b!1043313))

(declare-fun m!963061 () Bool)

(assert (=> d!126463 m!963061))

(assert (=> b!1043311 m!962979))

(declare-fun m!963063 () Bool)

(assert (=> b!1043312 m!963063))

(declare-fun m!963065 () Bool)

(assert (=> b!1043313 m!963065))

(assert (=> start!91662 d!126463))

(declare-fun b!1043324 () Bool)

(declare-fun e!591048 () Bool)

(declare-fun e!591051 () Bool)

(assert (=> b!1043324 (= e!591048 e!591051)))

(declare-fun c!106159 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043324 (= c!106159 (validKeyInArray!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun b!1043325 () Bool)

(declare-fun call!44214 () Bool)

(assert (=> b!1043325 (= e!591051 call!44214)))

(declare-fun b!1043326 () Bool)

(declare-fun e!591049 () Bool)

(assert (=> b!1043326 (= e!591049 e!591048)))

(declare-fun res!694906 () Bool)

(assert (=> b!1043326 (=> (not res!694906) (not e!591048))))

(declare-fun e!591050 () Bool)

(assert (=> b!1043326 (= res!694906 (not e!591050))))

(declare-fun res!694904 () Bool)

(assert (=> b!1043326 (=> (not res!694904) (not e!591050))))

(assert (=> b!1043326 (= res!694904 (validKeyInArray!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun b!1043327 () Bool)

(declare-fun contains!6082 (List!21962 (_ BitVec 64)) Bool)

(assert (=> b!1043327 (= e!591050 (contains!6082 Nil!21959 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun bm!44211 () Bool)

(assert (=> bm!44211 (= call!44214 (arrayNoDuplicates!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106159 (Cons!21958 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) Nil!21959) Nil!21959)))))

(declare-fun d!126465 () Bool)

(declare-fun res!694905 () Bool)

(assert (=> d!126465 (=> res!694905 e!591049)))

(assert (=> d!126465 (= res!694905 (bvsge #b00000000000000000000000000000000 (size!32156 lt!459754)))))

(assert (=> d!126465 (= (arrayNoDuplicates!0 lt!459754 #b00000000000000000000000000000000 Nil!21959) e!591049)))

(declare-fun b!1043328 () Bool)

(assert (=> b!1043328 (= e!591051 call!44214)))

(assert (= (and d!126465 (not res!694905)) b!1043326))

(assert (= (and b!1043326 res!694904) b!1043327))

(assert (= (and b!1043326 res!694906) b!1043324))

(assert (= (and b!1043324 c!106159) b!1043325))

(assert (= (and b!1043324 (not c!106159)) b!1043328))

(assert (= (or b!1043325 b!1043328) bm!44211))

(declare-fun m!963067 () Bool)

(assert (=> b!1043324 m!963067))

(assert (=> b!1043324 m!963067))

(declare-fun m!963069 () Bool)

(assert (=> b!1043324 m!963069))

(assert (=> b!1043326 m!963067))

(assert (=> b!1043326 m!963067))

(assert (=> b!1043326 m!963069))

(assert (=> b!1043327 m!963067))

(assert (=> b!1043327 m!963067))

(declare-fun m!963071 () Bool)

(assert (=> b!1043327 m!963071))

(assert (=> bm!44211 m!963067))

(declare-fun m!963073 () Bool)

(assert (=> bm!44211 m!963073))

(assert (=> b!1043256 d!126465))

(declare-fun b!1043337 () Bool)

(declare-fun e!591060 () Bool)

(declare-fun e!591059 () Bool)

(assert (=> b!1043337 (= e!591060 e!591059)))

(declare-fun c!106162 () Bool)

(assert (=> b!1043337 (= c!106162 (validKeyInArray!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun d!126467 () Bool)

(declare-fun res!694912 () Bool)

(assert (=> d!126467 (=> res!694912 e!591060)))

(assert (=> d!126467 (= res!694912 (bvsge #b00000000000000000000000000000000 (size!32156 lt!459754)))))

(assert (=> d!126467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459754 (mask!30466 thiss!1427)) e!591060)))

(declare-fun b!1043338 () Bool)

(declare-fun e!591058 () Bool)

(assert (=> b!1043338 (= e!591059 e!591058)))

(declare-fun lt!459800 () (_ BitVec 64))

(assert (=> b!1043338 (= lt!459800 (select (arr!31621 lt!459754) #b00000000000000000000000000000000))))

(declare-fun lt!459799 () Unit!34049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65737 (_ BitVec 64) (_ BitVec 32)) Unit!34049)

(assert (=> b!1043338 (= lt!459799 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459754 lt!459800 #b00000000000000000000000000000000))))

(assert (=> b!1043338 (arrayContainsKey!0 lt!459754 lt!459800 #b00000000000000000000000000000000)))

(declare-fun lt!459801 () Unit!34049)

(assert (=> b!1043338 (= lt!459801 lt!459799)))

(declare-fun res!694911 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65737 (_ BitVec 32)) SeekEntryResult!9768)

(assert (=> b!1043338 (= res!694911 (= (seekEntryOrOpen!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) lt!459754 (mask!30466 thiss!1427)) (Found!9768 #b00000000000000000000000000000000)))))

(assert (=> b!1043338 (=> (not res!694911) (not e!591058))))

(declare-fun bm!44214 () Bool)

(declare-fun call!44217 () Bool)

(assert (=> bm!44214 (= call!44217 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459754 (mask!30466 thiss!1427)))))

(declare-fun b!1043339 () Bool)

(assert (=> b!1043339 (= e!591058 call!44217)))

(declare-fun b!1043340 () Bool)

(assert (=> b!1043340 (= e!591059 call!44217)))

(assert (= (and d!126467 (not res!694912)) b!1043337))

(assert (= (and b!1043337 c!106162) b!1043338))

(assert (= (and b!1043337 (not c!106162)) b!1043340))

(assert (= (and b!1043338 res!694911) b!1043339))

(assert (= (or b!1043339 b!1043340) bm!44214))

(assert (=> b!1043337 m!963067))

(assert (=> b!1043337 m!963067))

(assert (=> b!1043337 m!963069))

(assert (=> b!1043338 m!963067))

(declare-fun m!963075 () Bool)

(assert (=> b!1043338 m!963075))

(declare-fun m!963077 () Bool)

(assert (=> b!1043338 m!963077))

(assert (=> b!1043338 m!963067))

(declare-fun m!963079 () Bool)

(assert (=> b!1043338 m!963079))

(declare-fun m!963081 () Bool)

(assert (=> bm!44214 m!963081))

(assert (=> b!1043256 d!126467))

(declare-fun d!126469 () Bool)

(declare-fun e!591063 () Bool)

(assert (=> d!126469 e!591063))

(declare-fun res!694915 () Bool)

(assert (=> d!126469 (=> (not res!694915) (not e!591063))))

(assert (=> d!126469 (= res!694915 (bvslt (index!41444 lt!459756) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun lt!459804 () Unit!34049)

(declare-fun choose!121 (array!65737 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> d!126469 (= lt!459804 (choose!121 (_keys!11641 thiss!1427) (index!41444 lt!459756) key!909))))

(assert (=> d!126469 (bvsge (index!41444 lt!459756) #b00000000000000000000000000000000)))

(assert (=> d!126469 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) key!909) lt!459804)))

(declare-fun b!1043343 () Bool)

(assert (=> b!1043343 (= e!591063 (not (arrayContainsKey!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126469 res!694915) b!1043343))

(declare-fun m!963083 () Bool)

(assert (=> d!126469 m!963083))

(assert (=> b!1043343 m!962989))

(declare-fun m!963085 () Bool)

(assert (=> b!1043343 m!963085))

(assert (=> b!1043256 d!126469))

(declare-fun d!126471 () Bool)

(declare-fun res!694920 () Bool)

(declare-fun e!591068 () Bool)

(assert (=> d!126471 (=> res!694920 e!591068)))

(assert (=> d!126471 (= res!694920 (= (select (arr!31621 lt!459754) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126471 (= (arrayContainsKey!0 lt!459754 key!909 #b00000000000000000000000000000000) e!591068)))

(declare-fun b!1043348 () Bool)

(declare-fun e!591069 () Bool)

(assert (=> b!1043348 (= e!591068 e!591069)))

(declare-fun res!694921 () Bool)

(assert (=> b!1043348 (=> (not res!694921) (not e!591069))))

(assert (=> b!1043348 (= res!694921 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 lt!459754)))))

(declare-fun b!1043349 () Bool)

(assert (=> b!1043349 (= e!591069 (arrayContainsKey!0 lt!459754 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126471 (not res!694920)) b!1043348))

(assert (= (and b!1043348 res!694921) b!1043349))

(assert (=> d!126471 m!963067))

(declare-fun m!963087 () Bool)

(assert (=> b!1043349 m!963087))

(assert (=> b!1043256 d!126471))

(declare-fun d!126473 () Bool)

(declare-fun e!591072 () Bool)

(assert (=> d!126473 e!591072))

(declare-fun res!694924 () Bool)

(assert (=> d!126473 (=> (not res!694924) (not e!591072))))

(assert (=> d!126473 (= res!694924 (and (bvsge (index!41444 lt!459756) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459756) (size!32156 (_keys!11641 thiss!1427)))))))

(declare-fun lt!459807 () Unit!34049)

(declare-fun choose!25 (array!65737 (_ BitVec 32) (_ BitVec 32)) Unit!34049)

(assert (=> d!126473 (= lt!459807 (choose!25 (_keys!11641 thiss!1427) (index!41444 lt!459756) (mask!30466 thiss!1427)))))

(assert (=> d!126473 (validMask!0 (mask!30466 thiss!1427))))

(assert (=> d!126473 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) (mask!30466 thiss!1427)) lt!459807)))

(declare-fun b!1043352 () Bool)

(assert (=> b!1043352 (= e!591072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (mask!30466 thiss!1427)))))

(assert (= (and d!126473 res!694924) b!1043352))

(declare-fun m!963089 () Bool)

(assert (=> d!126473 m!963089))

(assert (=> d!126473 m!962973))

(assert (=> b!1043352 m!962989))

(declare-fun m!963091 () Bool)

(assert (=> b!1043352 m!963091))

(assert (=> b!1043256 d!126473))

(declare-fun b!1043363 () Bool)

(declare-fun e!591078 () Bool)

(assert (=> b!1043363 (= e!591078 (bvslt (size!32156 (_keys!11641 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043362 () Bool)

(declare-fun res!694934 () Bool)

(assert (=> b!1043362 (=> (not res!694934) (not e!591078))))

(assert (=> b!1043362 (= res!694934 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126475 () Bool)

(declare-fun e!591077 () Bool)

(assert (=> d!126475 e!591077))

(declare-fun res!694935 () Bool)

(assert (=> d!126475 (=> (not res!694935) (not e!591077))))

(assert (=> d!126475 (= res!694935 (and (bvsge (index!41444 lt!459756) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459756) (size!32156 (_keys!11641 thiss!1427)))))))

(declare-fun lt!459810 () Unit!34049)

(declare-fun choose!82 (array!65737 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> d!126475 (= lt!459810 (choose!82 (_keys!11641 thiss!1427) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126475 e!591078))

(declare-fun res!694936 () Bool)

(assert (=> d!126475 (=> (not res!694936) (not e!591078))))

(assert (=> d!126475 (= res!694936 (and (bvsge (index!41444 lt!459756) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459756) (size!32156 (_keys!11641 thiss!1427)))))))

(assert (=> d!126475 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11641 thiss!1427) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459810)))

(declare-fun b!1043364 () Bool)

(assert (=> b!1043364 (= e!591077 (= (arrayCountValidKeys!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1043361 () Bool)

(declare-fun res!694933 () Bool)

(assert (=> b!1043361 (=> (not res!694933) (not e!591078))))

(assert (=> b!1043361 (= res!694933 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756))))))

(assert (= (and d!126475 res!694936) b!1043361))

(assert (= (and b!1043361 res!694933) b!1043362))

(assert (= (and b!1043362 res!694934) b!1043363))

(assert (= (and d!126475 res!694935) b!1043364))

(declare-fun m!963093 () Bool)

(assert (=> b!1043362 m!963093))

(declare-fun m!963095 () Bool)

(assert (=> d!126475 m!963095))

(assert (=> b!1043364 m!962989))

(declare-fun m!963097 () Bool)

(assert (=> b!1043364 m!963097))

(assert (=> b!1043364 m!962979))

(declare-fun m!963099 () Bool)

(assert (=> b!1043361 m!963099))

(assert (=> b!1043361 m!963099))

(declare-fun m!963101 () Bool)

(assert (=> b!1043361 m!963101))

(assert (=> b!1043256 d!126475))

(declare-fun d!126477 () Bool)

(declare-fun e!591081 () Bool)

(assert (=> d!126477 e!591081))

(declare-fun res!694939 () Bool)

(assert (=> d!126477 (=> (not res!694939) (not e!591081))))

(assert (=> d!126477 (= res!694939 (and (bvsge (index!41444 lt!459756) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459756) (size!32156 (_keys!11641 thiss!1427)))))))

(declare-fun lt!459813 () Unit!34049)

(declare-fun choose!53 (array!65737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21962) Unit!34049)

(assert (=> d!126477 (= lt!459813 (choose!53 (_keys!11641 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!459756) #b00000000000000000000000000000000 Nil!21959))))

(assert (=> d!126477 (bvslt (size!32156 (_keys!11641 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126477 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11641 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!459756) #b00000000000000000000000000000000 Nil!21959) lt!459813)))

(declare-fun b!1043367 () Bool)

(assert (=> b!1043367 (= e!591081 (arrayNoDuplicates!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 Nil!21959))))

(assert (= (and d!126477 res!694939) b!1043367))

(declare-fun m!963103 () Bool)

(assert (=> d!126477 m!963103))

(assert (=> b!1043367 m!962989))

(declare-fun m!963105 () Bool)

(assert (=> b!1043367 m!963105))

(assert (=> b!1043256 d!126477))

(declare-fun d!126479 () Bool)

(assert (=> d!126479 (= (validMask!0 (mask!30466 thiss!1427)) (and (or (= (mask!30466 thiss!1427) #b00000000000000000000000000000111) (= (mask!30466 thiss!1427) #b00000000000000000000000000001111) (= (mask!30466 thiss!1427) #b00000000000000000000000000011111) (= (mask!30466 thiss!1427) #b00000000000000000000000000111111) (= (mask!30466 thiss!1427) #b00000000000000000000000001111111) (= (mask!30466 thiss!1427) #b00000000000000000000000011111111) (= (mask!30466 thiss!1427) #b00000000000000000000000111111111) (= (mask!30466 thiss!1427) #b00000000000000000000001111111111) (= (mask!30466 thiss!1427) #b00000000000000000000011111111111) (= (mask!30466 thiss!1427) #b00000000000000000000111111111111) (= (mask!30466 thiss!1427) #b00000000000000000001111111111111) (= (mask!30466 thiss!1427) #b00000000000000000011111111111111) (= (mask!30466 thiss!1427) #b00000000000000000111111111111111) (= (mask!30466 thiss!1427) #b00000000000000001111111111111111) (= (mask!30466 thiss!1427) #b00000000000000011111111111111111) (= (mask!30466 thiss!1427) #b00000000000000111111111111111111) (= (mask!30466 thiss!1427) #b00000000000001111111111111111111) (= (mask!30466 thiss!1427) #b00000000000011111111111111111111) (= (mask!30466 thiss!1427) #b00000000000111111111111111111111) (= (mask!30466 thiss!1427) #b00000000001111111111111111111111) (= (mask!30466 thiss!1427) #b00000000011111111111111111111111) (= (mask!30466 thiss!1427) #b00000000111111111111111111111111) (= (mask!30466 thiss!1427) #b00000001111111111111111111111111) (= (mask!30466 thiss!1427) #b00000011111111111111111111111111) (= (mask!30466 thiss!1427) #b00000111111111111111111111111111) (= (mask!30466 thiss!1427) #b00001111111111111111111111111111) (= (mask!30466 thiss!1427) #b00011111111111111111111111111111) (= (mask!30466 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30466 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1043256 d!126479))

(declare-fun b!1043376 () Bool)

(declare-fun e!591087 () (_ BitVec 32))

(declare-fun call!44220 () (_ BitVec 32))

(assert (=> b!1043376 (= e!591087 (bvadd #b00000000000000000000000000000001 call!44220))))

(declare-fun b!1043377 () Bool)

(declare-fun e!591086 () (_ BitVec 32))

(assert (=> b!1043377 (= e!591086 e!591087)))

(declare-fun c!106167 () Bool)

(assert (=> b!1043377 (= c!106167 (validKeyInArray!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun b!1043378 () Bool)

(assert (=> b!1043378 (= e!591087 call!44220)))

(declare-fun b!1043379 () Bool)

(assert (=> b!1043379 (= e!591086 #b00000000000000000000000000000000)))

(declare-fun bm!44217 () Bool)

(assert (=> bm!44217 (= call!44220 (arrayCountValidKeys!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun d!126481 () Bool)

(declare-fun lt!459816 () (_ BitVec 32))

(assert (=> d!126481 (and (bvsge lt!459816 #b00000000000000000000000000000000) (bvsle lt!459816 (bvsub (size!32156 lt!459754) #b00000000000000000000000000000000)))))

(assert (=> d!126481 (= lt!459816 e!591086)))

(declare-fun c!106168 () Bool)

(assert (=> d!126481 (= c!106168 (bvsge #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126481 (and (bvsle #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32156 (_keys!11641 thiss!1427)) (size!32156 lt!459754)))))

(assert (=> d!126481 (= (arrayCountValidKeys!0 lt!459754 #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) lt!459816)))

(assert (= (and d!126481 c!106168) b!1043379))

(assert (= (and d!126481 (not c!106168)) b!1043377))

(assert (= (and b!1043377 c!106167) b!1043376))

(assert (= (and b!1043377 (not c!106167)) b!1043378))

(assert (= (or b!1043376 b!1043378) bm!44217))

(assert (=> b!1043377 m!963067))

(assert (=> b!1043377 m!963067))

(assert (=> b!1043377 m!963069))

(declare-fun m!963107 () Bool)

(assert (=> bm!44217 m!963107))

(assert (=> b!1043256 d!126481))

(declare-fun b!1043380 () Bool)

(declare-fun e!591089 () (_ BitVec 32))

(declare-fun call!44221 () (_ BitVec 32))

(assert (=> b!1043380 (= e!591089 (bvadd #b00000000000000000000000000000001 call!44221))))

(declare-fun b!1043381 () Bool)

(declare-fun e!591088 () (_ BitVec 32))

(assert (=> b!1043381 (= e!591088 e!591089)))

(declare-fun c!106169 () Bool)

(assert (=> b!1043381 (= c!106169 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043382 () Bool)

(assert (=> b!1043382 (= e!591089 call!44221)))

(declare-fun b!1043383 () Bool)

(assert (=> b!1043383 (= e!591088 #b00000000000000000000000000000000)))

(declare-fun bm!44218 () Bool)

(assert (=> bm!44218 (= call!44221 (arrayCountValidKeys!0 (_keys!11641 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun d!126483 () Bool)

(declare-fun lt!459817 () (_ BitVec 32))

(assert (=> d!126483 (and (bvsge lt!459817 #b00000000000000000000000000000000) (bvsle lt!459817 (bvsub (size!32156 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126483 (= lt!459817 e!591088)))

(declare-fun c!106170 () Bool)

(assert (=> d!126483 (= c!106170 (bvsge #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126483 (and (bvsle #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32156 (_keys!11641 thiss!1427)) (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126483 (= (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) lt!459817)))

(assert (= (and d!126483 c!106170) b!1043383))

(assert (= (and d!126483 (not c!106170)) b!1043381))

(assert (= (and b!1043381 c!106169) b!1043380))

(assert (= (and b!1043381 (not c!106169)) b!1043382))

(assert (= (or b!1043380 b!1043382) bm!44218))

(declare-fun m!963109 () Bool)

(assert (=> b!1043381 m!963109))

(assert (=> b!1043381 m!963109))

(declare-fun m!963111 () Bool)

(assert (=> b!1043381 m!963111))

(declare-fun m!963113 () Bool)

(assert (=> bm!44218 m!963113))

(assert (=> b!1043256 d!126483))

(declare-fun b!1043396 () Bool)

(declare-fun e!591098 () SeekEntryResult!9768)

(declare-fun lt!459829 () SeekEntryResult!9768)

(assert (=> b!1043396 (= e!591098 (Found!9768 (index!41445 lt!459829)))))

(declare-fun d!126485 () Bool)

(declare-fun lt!459826 () SeekEntryResult!9768)

(assert (=> d!126485 (and (or ((_ is MissingVacant!9768) lt!459826) (not ((_ is Found!9768) lt!459826)) (and (bvsge (index!41444 lt!459826) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459826) (size!32156 (_keys!11641 thiss!1427))))) (not ((_ is MissingVacant!9768) lt!459826)) (or (not ((_ is Found!9768) lt!459826)) (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459826)) key!909)))))

(declare-fun e!591097 () SeekEntryResult!9768)

(assert (=> d!126485 (= lt!459826 e!591097)))

(declare-fun c!106178 () Bool)

(assert (=> d!126485 (= c!106178 (and ((_ is Intermediate!9768) lt!459829) (undefined!10580 lt!459829)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65737 (_ BitVec 32)) SeekEntryResult!9768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126485 (= lt!459829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30466 thiss!1427)) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(assert (=> d!126485 (validMask!0 (mask!30466 thiss!1427))))

(assert (=> d!126485 (= (seekEntry!0 key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)) lt!459826)))

(declare-fun b!1043397 () Bool)

(assert (=> b!1043397 (= e!591097 e!591098)))

(declare-fun lt!459827 () (_ BitVec 64))

(assert (=> b!1043397 (= lt!459827 (select (arr!31621 (_keys!11641 thiss!1427)) (index!41445 lt!459829)))))

(declare-fun c!106177 () Bool)

(assert (=> b!1043397 (= c!106177 (= lt!459827 key!909))))

(declare-fun b!1043398 () Bool)

(assert (=> b!1043398 (= e!591097 Undefined!9768)))

(declare-fun b!1043399 () Bool)

(declare-fun e!591096 () SeekEntryResult!9768)

(assert (=> b!1043399 (= e!591096 (MissingZero!9768 (index!41445 lt!459829)))))

(declare-fun b!1043400 () Bool)

(declare-fun lt!459828 () SeekEntryResult!9768)

(assert (=> b!1043400 (= e!591096 (ite ((_ is MissingVacant!9768) lt!459828) (MissingZero!9768 (index!41446 lt!459828)) lt!459828))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65737 (_ BitVec 32)) SeekEntryResult!9768)

(assert (=> b!1043400 (= lt!459828 (seekKeyOrZeroReturnVacant!0 (x!93001 lt!459829) (index!41445 lt!459829) (index!41445 lt!459829) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043401 () Bool)

(declare-fun c!106179 () Bool)

(assert (=> b!1043401 (= c!106179 (= lt!459827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043401 (= e!591098 e!591096)))

(assert (= (and d!126485 c!106178) b!1043398))

(assert (= (and d!126485 (not c!106178)) b!1043397))

(assert (= (and b!1043397 c!106177) b!1043396))

(assert (= (and b!1043397 (not c!106177)) b!1043401))

(assert (= (and b!1043401 c!106179) b!1043399))

(assert (= (and b!1043401 (not c!106179)) b!1043400))

(declare-fun m!963115 () Bool)

(assert (=> d!126485 m!963115))

(declare-fun m!963117 () Bool)

(assert (=> d!126485 m!963117))

(assert (=> d!126485 m!963117))

(declare-fun m!963119 () Bool)

(assert (=> d!126485 m!963119))

(assert (=> d!126485 m!962973))

(declare-fun m!963121 () Bool)

(assert (=> b!1043397 m!963121))

(declare-fun m!963123 () Bool)

(assert (=> b!1043400 m!963123))

(assert (=> b!1043251 d!126485))

(declare-fun d!126487 () Bool)

(assert (=> d!126487 (= (array_inv!24445 (_keys!11641 thiss!1427)) (bvsge (size!32156 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043255 d!126487))

(declare-fun d!126489 () Bool)

(assert (=> d!126489 (= (array_inv!24446 (_values!6383 thiss!1427)) (bvsge (size!32157 (_values!6383 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043255 d!126489))

(declare-fun mapIsEmpty!38764 () Bool)

(declare-fun mapRes!38764 () Bool)

(assert (=> mapIsEmpty!38764 mapRes!38764))

(declare-fun b!1043409 () Bool)

(declare-fun e!591104 () Bool)

(assert (=> b!1043409 (= e!591104 tp_is_empty!24769)))

(declare-fun mapNonEmpty!38764 () Bool)

(declare-fun tp!74381 () Bool)

(declare-fun e!591103 () Bool)

(assert (=> mapNonEmpty!38764 (= mapRes!38764 (and tp!74381 e!591103))))

(declare-fun mapKey!38764 () (_ BitVec 32))

(declare-fun mapRest!38764 () (Array (_ BitVec 32) ValueCell!11681))

(declare-fun mapValue!38764 () ValueCell!11681)

(assert (=> mapNonEmpty!38764 (= mapRest!38755 (store mapRest!38764 mapKey!38764 mapValue!38764))))

(declare-fun condMapEmpty!38764 () Bool)

(declare-fun mapDefault!38764 () ValueCell!11681)

(assert (=> mapNonEmpty!38755 (= condMapEmpty!38764 (= mapRest!38755 ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38764)))))

(assert (=> mapNonEmpty!38755 (= tp!74365 (and e!591104 mapRes!38764))))

(declare-fun b!1043408 () Bool)

(assert (=> b!1043408 (= e!591103 tp_is_empty!24769)))

(assert (= (and mapNonEmpty!38755 condMapEmpty!38764) mapIsEmpty!38764))

(assert (= (and mapNonEmpty!38755 (not condMapEmpty!38764)) mapNonEmpty!38764))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11681) mapValue!38764)) b!1043408))

(assert (= (and mapNonEmpty!38755 ((_ is ValueCellFull!11681) mapDefault!38764)) b!1043409))

(declare-fun m!963125 () Bool)

(assert (=> mapNonEmpty!38764 m!963125))

(check-sat (not b!1043311) (not bm!44211) (not b!1043338) (not d!126485) (not b!1043312) (not bm!44214) (not b!1043361) (not d!126469) (not b!1043349) (not b!1043324) (not b!1043326) (not d!126473) (not b!1043313) (not b!1043337) (not d!126463) (not d!126477) (not bm!44218) (not b!1043364) b_and!33591 (not b!1043367) (not d!126475) tp_is_empty!24769 (not b!1043362) (not mapNonEmpty!38764) (not b!1043377) (not b!1043352) (not b_next!21049) (not b!1043343) (not b!1043381) (not b!1043327) (not b!1043400) (not bm!44217))
(check-sat b_and!33591 (not b_next!21049))
(get-model)

(declare-fun b!1043421 () Bool)

(declare-fun e!591107 () Bool)

(assert (=> b!1043421 (= e!591107 (and (bvsge (extraKeys!6088 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6088 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3033 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1043418 () Bool)

(declare-fun res!694948 () Bool)

(assert (=> b!1043418 (=> (not res!694948) (not e!591107))))

(assert (=> b!1043418 (= res!694948 (and (= (size!32157 (_values!6383 thiss!1427)) (bvadd (mask!30466 thiss!1427) #b00000000000000000000000000000001)) (= (size!32156 (_keys!11641 thiss!1427)) (size!32157 (_values!6383 thiss!1427))) (bvsge (_size!3033 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3033 thiss!1427) (bvadd (mask!30466 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1043419 () Bool)

(declare-fun res!694950 () Bool)

(assert (=> b!1043419 (=> (not res!694950) (not e!591107))))

(declare-fun size!32162 (LongMapFixedSize!5956) (_ BitVec 32))

(assert (=> b!1043419 (= res!694950 (bvsge (size!32162 thiss!1427) (_size!3033 thiss!1427)))))

(declare-fun b!1043420 () Bool)

(declare-fun res!694949 () Bool)

(assert (=> b!1043420 (=> (not res!694949) (not e!591107))))

(assert (=> b!1043420 (= res!694949 (= (size!32162 thiss!1427) (bvadd (_size!3033 thiss!1427) (bvsdiv (bvadd (extraKeys!6088 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!126491 () Bool)

(declare-fun res!694951 () Bool)

(assert (=> d!126491 (=> (not res!694951) (not e!591107))))

(assert (=> d!126491 (= res!694951 (validMask!0 (mask!30466 thiss!1427)))))

(assert (=> d!126491 (= (simpleValid!440 thiss!1427) e!591107)))

(assert (= (and d!126491 res!694951) b!1043418))

(assert (= (and b!1043418 res!694948) b!1043419))

(assert (= (and b!1043419 res!694950) b!1043420))

(assert (= (and b!1043420 res!694949) b!1043421))

(declare-fun m!963127 () Bool)

(assert (=> b!1043419 m!963127))

(assert (=> b!1043420 m!963127))

(assert (=> d!126491 m!962973))

(assert (=> d!126463 d!126491))

(declare-fun d!126493 () Bool)

(declare-fun res!694952 () Bool)

(declare-fun e!591108 () Bool)

(assert (=> d!126493 (=> res!694952 e!591108)))

(assert (=> d!126493 (= res!694952 (= (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126493 (= (arrayContainsKey!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) key!909 #b00000000000000000000000000000000) e!591108)))

(declare-fun b!1043422 () Bool)

(declare-fun e!591109 () Bool)

(assert (=> b!1043422 (= e!591108 e!591109)))

(declare-fun res!694953 () Bool)

(assert (=> b!1043422 (=> (not res!694953) (not e!591109))))

(assert (=> b!1043422 (= res!694953 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))))))))

(declare-fun b!1043423 () Bool)

(assert (=> b!1043423 (= e!591109 (arrayContainsKey!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126493 (not res!694952)) b!1043422))

(assert (= (and b!1043422 res!694953) b!1043423))

(declare-fun m!963129 () Bool)

(assert (=> d!126493 m!963129))

(declare-fun m!963131 () Bool)

(assert (=> b!1043423 m!963131))

(assert (=> b!1043343 d!126493))

(declare-fun d!126495 () Bool)

(assert (=> d!126495 (= (validKeyInArray!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)) (and (not (= (select (arr!31621 lt!459754) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31621 lt!459754) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043377 d!126495))

(declare-fun d!126497 () Bool)

(assert (=> d!126497 (not (arrayContainsKey!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!126497 true))

(declare-fun _$59!32 () Unit!34049)

(assert (=> d!126497 (= (choose!121 (_keys!11641 thiss!1427) (index!41444 lt!459756) key!909) _$59!32)))

(declare-fun bs!30494 () Bool)

(assert (= bs!30494 d!126497))

(assert (=> bs!30494 m!962989))

(assert (=> bs!30494 m!963085))

(assert (=> d!126469 d!126497))

(declare-fun b!1043424 () Bool)

(declare-fun e!591110 () Bool)

(declare-fun e!591113 () Bool)

(assert (=> b!1043424 (= e!591110 e!591113)))

(declare-fun c!106180 () Bool)

(assert (=> b!1043424 (= c!106180 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043425 () Bool)

(declare-fun call!44222 () Bool)

(assert (=> b!1043425 (= e!591113 call!44222)))

(declare-fun b!1043426 () Bool)

(declare-fun e!591111 () Bool)

(assert (=> b!1043426 (= e!591111 e!591110)))

(declare-fun res!694956 () Bool)

(assert (=> b!1043426 (=> (not res!694956) (not e!591110))))

(declare-fun e!591112 () Bool)

(assert (=> b!1043426 (= res!694956 (not e!591112))))

(declare-fun res!694954 () Bool)

(assert (=> b!1043426 (=> (not res!694954) (not e!591112))))

(assert (=> b!1043426 (= res!694954 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043427 () Bool)

(assert (=> b!1043427 (= e!591112 (contains!6082 Nil!21959 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44219 () Bool)

(assert (=> bm!44219 (= call!44222 (arrayNoDuplicates!0 (_keys!11641 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106180 (Cons!21958 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000) Nil!21959) Nil!21959)))))

(declare-fun d!126499 () Bool)

(declare-fun res!694955 () Bool)

(assert (=> d!126499 (=> res!694955 e!591111)))

(assert (=> d!126499 (= res!694955 (bvsge #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126499 (= (arrayNoDuplicates!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 Nil!21959) e!591111)))

(declare-fun b!1043428 () Bool)

(assert (=> b!1043428 (= e!591113 call!44222)))

(assert (= (and d!126499 (not res!694955)) b!1043426))

(assert (= (and b!1043426 res!694954) b!1043427))

(assert (= (and b!1043426 res!694956) b!1043424))

(assert (= (and b!1043424 c!106180) b!1043425))

(assert (= (and b!1043424 (not c!106180)) b!1043428))

(assert (= (or b!1043425 b!1043428) bm!44219))

(assert (=> b!1043424 m!963109))

(assert (=> b!1043424 m!963109))

(assert (=> b!1043424 m!963111))

(assert (=> b!1043426 m!963109))

(assert (=> b!1043426 m!963109))

(assert (=> b!1043426 m!963111))

(assert (=> b!1043427 m!963109))

(assert (=> b!1043427 m!963109))

(declare-fun m!963133 () Bool)

(assert (=> b!1043427 m!963133))

(assert (=> bm!44219 m!963109))

(declare-fun m!963135 () Bool)

(assert (=> bm!44219 m!963135))

(assert (=> b!1043313 d!126499))

(assert (=> b!1043311 d!126483))

(declare-fun b!1043429 () Bool)

(declare-fun e!591115 () (_ BitVec 32))

(declare-fun call!44223 () (_ BitVec 32))

(assert (=> b!1043429 (= e!591115 (bvadd #b00000000000000000000000000000001 call!44223))))

(declare-fun b!1043430 () Bool)

(declare-fun e!591114 () (_ BitVec 32))

(assert (=> b!1043430 (= e!591114 e!591115)))

(declare-fun c!106181 () Bool)

(assert (=> b!1043430 (= c!106181 (validKeyInArray!0 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043431 () Bool)

(assert (=> b!1043431 (= e!591115 call!44223)))

(declare-fun b!1043432 () Bool)

(assert (=> b!1043432 (= e!591114 #b00000000000000000000000000000000)))

(declare-fun bm!44220 () Bool)

(assert (=> bm!44220 (= call!44223 (arrayCountValidKeys!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun d!126501 () Bool)

(declare-fun lt!459830 () (_ BitVec 32))

(assert (=> d!126501 (and (bvsge lt!459830 #b00000000000000000000000000000000) (bvsle lt!459830 (bvsub (size!32156 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126501 (= lt!459830 e!591114)))

(declare-fun c!106182 () Bool)

(assert (=> d!126501 (= c!106182 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126501 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32156 (_keys!11641 thiss!1427)) (size!32156 lt!459754)))))

(assert (=> d!126501 (= (arrayCountValidKeys!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))) lt!459830)))

(assert (= (and d!126501 c!106182) b!1043432))

(assert (= (and d!126501 (not c!106182)) b!1043430))

(assert (= (and b!1043430 c!106181) b!1043429))

(assert (= (and b!1043430 (not c!106181)) b!1043431))

(assert (= (or b!1043429 b!1043431) bm!44220))

(declare-fun m!963137 () Bool)

(assert (=> b!1043430 m!963137))

(assert (=> b!1043430 m!963137))

(declare-fun m!963139 () Bool)

(assert (=> b!1043430 m!963139))

(declare-fun m!963141 () Bool)

(assert (=> bm!44220 m!963141))

(assert (=> bm!44217 d!126501))

(declare-fun b!1043433 () Bool)

(declare-fun e!591118 () Bool)

(declare-fun e!591117 () Bool)

(assert (=> b!1043433 (= e!591118 e!591117)))

(declare-fun c!106183 () Bool)

(assert (=> b!1043433 (= c!106183 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126503 () Bool)

(declare-fun res!694958 () Bool)

(assert (=> d!126503 (=> res!694958 e!591118)))

(assert (=> d!126503 (= res!694958 (bvsge #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)) e!591118)))

(declare-fun b!1043434 () Bool)

(declare-fun e!591116 () Bool)

(assert (=> b!1043434 (= e!591117 e!591116)))

(declare-fun lt!459832 () (_ BitVec 64))

(assert (=> b!1043434 (= lt!459832 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459831 () Unit!34049)

(assert (=> b!1043434 (= lt!459831 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11641 thiss!1427) lt!459832 #b00000000000000000000000000000000))))

(assert (=> b!1043434 (arrayContainsKey!0 (_keys!11641 thiss!1427) lt!459832 #b00000000000000000000000000000000)))

(declare-fun lt!459833 () Unit!34049)

(assert (=> b!1043434 (= lt!459833 lt!459831)))

(declare-fun res!694957 () Bool)

(assert (=> b!1043434 (= res!694957 (= (seekEntryOrOpen!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000) (_keys!11641 thiss!1427) (mask!30466 thiss!1427)) (Found!9768 #b00000000000000000000000000000000)))))

(assert (=> b!1043434 (=> (not res!694957) (not e!591116))))

(declare-fun bm!44221 () Bool)

(declare-fun call!44224 () Bool)

(assert (=> bm!44221 (= call!44224 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043435 () Bool)

(assert (=> b!1043435 (= e!591116 call!44224)))

(declare-fun b!1043436 () Bool)

(assert (=> b!1043436 (= e!591117 call!44224)))

(assert (= (and d!126503 (not res!694958)) b!1043433))

(assert (= (and b!1043433 c!106183) b!1043434))

(assert (= (and b!1043433 (not c!106183)) b!1043436))

(assert (= (and b!1043434 res!694957) b!1043435))

(assert (= (or b!1043435 b!1043436) bm!44221))

(assert (=> b!1043433 m!963109))

(assert (=> b!1043433 m!963109))

(assert (=> b!1043433 m!963111))

(assert (=> b!1043434 m!963109))

(declare-fun m!963143 () Bool)

(assert (=> b!1043434 m!963143))

(declare-fun m!963145 () Bool)

(assert (=> b!1043434 m!963145))

(assert (=> b!1043434 m!963109))

(declare-fun m!963147 () Bool)

(assert (=> b!1043434 m!963147))

(declare-fun m!963149 () Bool)

(assert (=> bm!44221 m!963149))

(assert (=> b!1043312 d!126503))

(declare-fun d!126505 () Bool)

(assert (=> d!126505 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1043362 d!126505))

(declare-fun b!1043437 () Bool)

(declare-fun e!591121 () Bool)

(declare-fun e!591120 () Bool)

(assert (=> b!1043437 (= e!591121 e!591120)))

(declare-fun c!106184 () Bool)

(assert (=> b!1043437 (= c!106184 (validKeyInArray!0 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!126507 () Bool)

(declare-fun res!694960 () Bool)

(assert (=> d!126507 (=> res!694960 e!591121)))

(assert (=> d!126507 (= res!694960 (bvsge #b00000000000000000000000000000000 (size!32156 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))))))))

(assert (=> d!126507 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (mask!30466 thiss!1427)) e!591121)))

(declare-fun b!1043438 () Bool)

(declare-fun e!591119 () Bool)

(assert (=> b!1043438 (= e!591120 e!591119)))

(declare-fun lt!459835 () (_ BitVec 64))

(assert (=> b!1043438 (= lt!459835 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459834 () Unit!34049)

(assert (=> b!1043438 (= lt!459834 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) lt!459835 #b00000000000000000000000000000000))))

(assert (=> b!1043438 (arrayContainsKey!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) lt!459835 #b00000000000000000000000000000000)))

(declare-fun lt!459836 () Unit!34049)

(assert (=> b!1043438 (= lt!459836 lt!459834)))

(declare-fun res!694959 () Bool)

(assert (=> b!1043438 (= res!694959 (= (seekEntryOrOpen!0 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000) (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (mask!30466 thiss!1427)) (Found!9768 #b00000000000000000000000000000000)))))

(assert (=> b!1043438 (=> (not res!694959) (not e!591119))))

(declare-fun bm!44222 () Bool)

(declare-fun call!44225 () Bool)

(assert (=> bm!44222 (= call!44225 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (mask!30466 thiss!1427)))))

(declare-fun b!1043439 () Bool)

(assert (=> b!1043439 (= e!591119 call!44225)))

(declare-fun b!1043440 () Bool)

(assert (=> b!1043440 (= e!591120 call!44225)))

(assert (= (and d!126507 (not res!694960)) b!1043437))

(assert (= (and b!1043437 c!106184) b!1043438))

(assert (= (and b!1043437 (not c!106184)) b!1043440))

(assert (= (and b!1043438 res!694959) b!1043439))

(assert (= (or b!1043439 b!1043440) bm!44222))

(assert (=> b!1043437 m!963129))

(assert (=> b!1043437 m!963129))

(declare-fun m!963151 () Bool)

(assert (=> b!1043437 m!963151))

(assert (=> b!1043438 m!963129))

(declare-fun m!963153 () Bool)

(assert (=> b!1043438 m!963153))

(declare-fun m!963155 () Bool)

(assert (=> b!1043438 m!963155))

(assert (=> b!1043438 m!963129))

(declare-fun m!963157 () Bool)

(assert (=> b!1043438 m!963157))

(declare-fun m!963159 () Bool)

(assert (=> bm!44222 m!963159))

(assert (=> b!1043352 d!126507))

(declare-fun b!1043459 () Bool)

(declare-fun e!591134 () Bool)

(declare-fun e!591133 () Bool)

(assert (=> b!1043459 (= e!591134 e!591133)))

(declare-fun res!694967 () Bool)

(declare-fun lt!459842 () SeekEntryResult!9768)

(assert (=> b!1043459 (= res!694967 (and ((_ is Intermediate!9768) lt!459842) (not (undefined!10580 lt!459842)) (bvslt (x!93001 lt!459842) #b01111111111111111111111111111110) (bvsge (x!93001 lt!459842) #b00000000000000000000000000000000) (bvsge (x!93001 lt!459842) #b00000000000000000000000000000000)))))

(assert (=> b!1043459 (=> (not res!694967) (not e!591133))))

(declare-fun b!1043460 () Bool)

(declare-fun e!591135 () SeekEntryResult!9768)

(assert (=> b!1043460 (= e!591135 (Intermediate!9768 true (toIndex!0 key!909 (mask!30466 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1043461 () Bool)

(declare-fun e!591132 () SeekEntryResult!9768)

(assert (=> b!1043461 (= e!591135 e!591132)))

(declare-fun c!106191 () Bool)

(declare-fun lt!459841 () (_ BitVec 64))

(assert (=> b!1043461 (= c!106191 (or (= lt!459841 key!909) (= (bvadd lt!459841 lt!459841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043462 () Bool)

(assert (=> b!1043462 (and (bvsge (index!41445 lt!459842) #b00000000000000000000000000000000) (bvslt (index!41445 lt!459842) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun e!591136 () Bool)

(assert (=> b!1043462 (= e!591136 (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41445 lt!459842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043463 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043463 (= e!591132 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30466 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30466 thiss!1427)) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043464 () Bool)

(assert (=> b!1043464 (= e!591134 (bvsge (x!93001 lt!459842) #b01111111111111111111111111111110))))

(declare-fun b!1043465 () Bool)

(assert (=> b!1043465 (and (bvsge (index!41445 lt!459842) #b00000000000000000000000000000000) (bvslt (index!41445 lt!459842) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun res!694969 () Bool)

(assert (=> b!1043465 (= res!694969 (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41445 lt!459842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043465 (=> res!694969 e!591136)))

(declare-fun b!1043467 () Bool)

(assert (=> b!1043467 (and (bvsge (index!41445 lt!459842) #b00000000000000000000000000000000) (bvslt (index!41445 lt!459842) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun res!694968 () Bool)

(assert (=> b!1043467 (= res!694968 (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41445 lt!459842)) key!909))))

(assert (=> b!1043467 (=> res!694968 e!591136)))

(assert (=> b!1043467 (= e!591133 e!591136)))

(declare-fun d!126509 () Bool)

(assert (=> d!126509 e!591134))

(declare-fun c!106193 () Bool)

(assert (=> d!126509 (= c!106193 (and ((_ is Intermediate!9768) lt!459842) (undefined!10580 lt!459842)))))

(assert (=> d!126509 (= lt!459842 e!591135)))

(declare-fun c!106192 () Bool)

(assert (=> d!126509 (= c!106192 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!126509 (= lt!459841 (select (arr!31621 (_keys!11641 thiss!1427)) (toIndex!0 key!909 (mask!30466 thiss!1427))))))

(assert (=> d!126509 (validMask!0 (mask!30466 thiss!1427))))

(assert (=> d!126509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30466 thiss!1427)) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)) lt!459842)))

(declare-fun b!1043466 () Bool)

(assert (=> b!1043466 (= e!591132 (Intermediate!9768 false (toIndex!0 key!909 (mask!30466 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!126509 c!106192) b!1043460))

(assert (= (and d!126509 (not c!106192)) b!1043461))

(assert (= (and b!1043461 c!106191) b!1043466))

(assert (= (and b!1043461 (not c!106191)) b!1043463))

(assert (= (and d!126509 c!106193) b!1043464))

(assert (= (and d!126509 (not c!106193)) b!1043459))

(assert (= (and b!1043459 res!694967) b!1043467))

(assert (= (and b!1043467 (not res!694968)) b!1043465))

(assert (= (and b!1043465 (not res!694969)) b!1043462))

(declare-fun m!963161 () Bool)

(assert (=> b!1043462 m!963161))

(assert (=> b!1043467 m!963161))

(assert (=> d!126509 m!963117))

(declare-fun m!963163 () Bool)

(assert (=> d!126509 m!963163))

(assert (=> d!126509 m!962973))

(assert (=> b!1043463 m!963117))

(declare-fun m!963165 () Bool)

(assert (=> b!1043463 m!963165))

(assert (=> b!1043463 m!963165))

(declare-fun m!963167 () Bool)

(assert (=> b!1043463 m!963167))

(assert (=> b!1043465 m!963161))

(assert (=> d!126485 d!126509))

(declare-fun d!126511 () Bool)

(declare-fun lt!459848 () (_ BitVec 32))

(declare-fun lt!459847 () (_ BitVec 32))

(assert (=> d!126511 (= lt!459848 (bvmul (bvxor lt!459847 (bvlshr lt!459847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!126511 (= lt!459847 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!126511 (and (bvsge (mask!30466 thiss!1427) #b00000000000000000000000000000000) (let ((res!694970 (let ((h!23176 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!93018 (bvmul (bvxor h!23176 (bvlshr h!23176 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!93018 (bvlshr x!93018 #b00000000000000000000000000001101)) (mask!30466 thiss!1427)))))) (and (bvslt res!694970 (bvadd (mask!30466 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694970 #b00000000000000000000000000000000))))))

(assert (=> d!126511 (= (toIndex!0 key!909 (mask!30466 thiss!1427)) (bvand (bvxor lt!459848 (bvlshr lt!459848 #b00000000000000000000000000001101)) (mask!30466 thiss!1427)))))

(assert (=> d!126485 d!126511))

(assert (=> d!126485 d!126479))

(declare-fun d!126513 () Bool)

(assert (=> d!126513 (= (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756))) (and (not (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043361 d!126513))

(declare-fun d!126515 () Bool)

(declare-fun res!694971 () Bool)

(declare-fun e!591137 () Bool)

(assert (=> d!126515 (=> res!694971 e!591137)))

(assert (=> d!126515 (= res!694971 (= (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!126515 (= (arrayContainsKey!0 lt!459754 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!591137)))

(declare-fun b!1043468 () Bool)

(declare-fun e!591138 () Bool)

(assert (=> b!1043468 (= e!591137 e!591138)))

(declare-fun res!694972 () Bool)

(assert (=> b!1043468 (=> (not res!694972) (not e!591138))))

(assert (=> b!1043468 (= res!694972 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32156 lt!459754)))))

(declare-fun b!1043469 () Bool)

(assert (=> b!1043469 (= e!591138 (arrayContainsKey!0 lt!459754 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!126515 (not res!694971)) b!1043468))

(assert (= (and b!1043468 res!694972) b!1043469))

(assert (=> d!126515 m!963137))

(declare-fun m!963169 () Bool)

(assert (=> b!1043469 m!963169))

(assert (=> b!1043349 d!126515))

(declare-fun b!1043470 () Bool)

(declare-fun e!591140 () (_ BitVec 32))

(declare-fun call!44226 () (_ BitVec 32))

(assert (=> b!1043470 (= e!591140 (bvadd #b00000000000000000000000000000001 call!44226))))

(declare-fun b!1043471 () Bool)

(declare-fun e!591139 () (_ BitVec 32))

(assert (=> b!1043471 (= e!591139 e!591140)))

(declare-fun c!106194 () Bool)

(assert (=> b!1043471 (= c!106194 (validKeyInArray!0 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043472 () Bool)

(assert (=> b!1043472 (= e!591140 call!44226)))

(declare-fun b!1043473 () Bool)

(assert (=> b!1043473 (= e!591139 #b00000000000000000000000000000000)))

(declare-fun bm!44223 () Bool)

(assert (=> bm!44223 (= call!44226 (arrayCountValidKeys!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun d!126517 () Bool)

(declare-fun lt!459849 () (_ BitVec 32))

(assert (=> d!126517 (and (bvsge lt!459849 #b00000000000000000000000000000000) (bvsle lt!459849 (bvsub (size!32156 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!126517 (= lt!459849 e!591139)))

(declare-fun c!106195 () Bool)

(assert (=> d!126517 (= c!106195 (bvsge #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126517 (and (bvsle #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32156 (_keys!11641 thiss!1427)) (size!32156 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))))))))

(assert (=> d!126517 (= (arrayCountValidKeys!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) lt!459849)))

(assert (= (and d!126517 c!106195) b!1043473))

(assert (= (and d!126517 (not c!106195)) b!1043471))

(assert (= (and b!1043471 c!106194) b!1043470))

(assert (= (and b!1043471 (not c!106194)) b!1043472))

(assert (= (or b!1043470 b!1043472) bm!44223))

(assert (=> b!1043471 m!963129))

(assert (=> b!1043471 m!963129))

(assert (=> b!1043471 m!963151))

(declare-fun m!963171 () Bool)

(assert (=> bm!44223 m!963171))

(assert (=> b!1043364 d!126517))

(assert (=> b!1043364 d!126483))

(declare-fun d!126519 () Bool)

(assert (=> d!126519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (mask!30466 thiss!1427))))

(assert (=> d!126519 true))

(declare-fun _$44!30 () Unit!34049)

(assert (=> d!126519 (= (choose!25 (_keys!11641 thiss!1427) (index!41444 lt!459756) (mask!30466 thiss!1427)) _$44!30)))

(declare-fun bs!30495 () Bool)

(assert (= bs!30495 d!126519))

(assert (=> bs!30495 m!962989))

(assert (=> bs!30495 m!963091))

(assert (=> d!126473 d!126519))

(assert (=> d!126473 d!126479))

(assert (=> b!1043337 d!126495))

(declare-fun d!126521 () Bool)

(assert (=> d!126521 (arrayContainsKey!0 lt!459754 lt!459800 #b00000000000000000000000000000000)))

(declare-fun lt!459852 () Unit!34049)

(declare-fun choose!13 (array!65737 (_ BitVec 64) (_ BitVec 32)) Unit!34049)

(assert (=> d!126521 (= lt!459852 (choose!13 lt!459754 lt!459800 #b00000000000000000000000000000000))))

(assert (=> d!126521 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!126521 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459754 lt!459800 #b00000000000000000000000000000000) lt!459852)))

(declare-fun bs!30496 () Bool)

(assert (= bs!30496 d!126521))

(assert (=> bs!30496 m!963077))

(declare-fun m!963173 () Bool)

(assert (=> bs!30496 m!963173))

(assert (=> b!1043338 d!126521))

(declare-fun d!126523 () Bool)

(declare-fun res!694973 () Bool)

(declare-fun e!591141 () Bool)

(assert (=> d!126523 (=> res!694973 e!591141)))

(assert (=> d!126523 (= res!694973 (= (select (arr!31621 lt!459754) #b00000000000000000000000000000000) lt!459800))))

(assert (=> d!126523 (= (arrayContainsKey!0 lt!459754 lt!459800 #b00000000000000000000000000000000) e!591141)))

(declare-fun b!1043474 () Bool)

(declare-fun e!591142 () Bool)

(assert (=> b!1043474 (= e!591141 e!591142)))

(declare-fun res!694974 () Bool)

(assert (=> b!1043474 (=> (not res!694974) (not e!591142))))

(assert (=> b!1043474 (= res!694974 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 lt!459754)))))

(declare-fun b!1043475 () Bool)

(assert (=> b!1043475 (= e!591142 (arrayContainsKey!0 lt!459754 lt!459800 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126523 (not res!694973)) b!1043474))

(assert (= (and b!1043474 res!694974) b!1043475))

(assert (=> d!126523 m!963067))

(declare-fun m!963175 () Bool)

(assert (=> b!1043475 m!963175))

(assert (=> b!1043338 d!126523))

(declare-fun b!1043488 () Bool)

(declare-fun e!591149 () SeekEntryResult!9768)

(assert (=> b!1043488 (= e!591149 Undefined!9768)))

(declare-fun b!1043489 () Bool)

(declare-fun c!106203 () Bool)

(declare-fun lt!459861 () (_ BitVec 64))

(assert (=> b!1043489 (= c!106203 (= lt!459861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591151 () SeekEntryResult!9768)

(declare-fun e!591150 () SeekEntryResult!9768)

(assert (=> b!1043489 (= e!591151 e!591150)))

(declare-fun b!1043490 () Bool)

(assert (=> b!1043490 (= e!591149 e!591151)))

(declare-fun lt!459860 () SeekEntryResult!9768)

(assert (=> b!1043490 (= lt!459861 (select (arr!31621 lt!459754) (index!41445 lt!459860)))))

(declare-fun c!106202 () Bool)

(assert (=> b!1043490 (= c!106202 (= lt!459861 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun b!1043491 () Bool)

(assert (=> b!1043491 (= e!591150 (MissingZero!9768 (index!41445 lt!459860)))))

(declare-fun d!126525 () Bool)

(declare-fun lt!459859 () SeekEntryResult!9768)

(assert (=> d!126525 (and (or ((_ is Undefined!9768) lt!459859) (not ((_ is Found!9768) lt!459859)) (and (bvsge (index!41444 lt!459859) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459859) (size!32156 lt!459754)))) (or ((_ is Undefined!9768) lt!459859) ((_ is Found!9768) lt!459859) (not ((_ is MissingZero!9768) lt!459859)) (and (bvsge (index!41443 lt!459859) #b00000000000000000000000000000000) (bvslt (index!41443 lt!459859) (size!32156 lt!459754)))) (or ((_ is Undefined!9768) lt!459859) ((_ is Found!9768) lt!459859) ((_ is MissingZero!9768) lt!459859) (not ((_ is MissingVacant!9768) lt!459859)) (and (bvsge (index!41446 lt!459859) #b00000000000000000000000000000000) (bvslt (index!41446 lt!459859) (size!32156 lt!459754)))) (or ((_ is Undefined!9768) lt!459859) (ite ((_ is Found!9768) lt!459859) (= (select (arr!31621 lt!459754) (index!41444 lt!459859)) (select (arr!31621 lt!459754) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9768) lt!459859) (= (select (arr!31621 lt!459754) (index!41443 lt!459859)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9768) lt!459859) (= (select (arr!31621 lt!459754) (index!41446 lt!459859)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!126525 (= lt!459859 e!591149)))

(declare-fun c!106204 () Bool)

(assert (=> d!126525 (= c!106204 (and ((_ is Intermediate!9768) lt!459860) (undefined!10580 lt!459860)))))

(assert (=> d!126525 (= lt!459860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) (mask!30466 thiss!1427)) (select (arr!31621 lt!459754) #b00000000000000000000000000000000) lt!459754 (mask!30466 thiss!1427)))))

(assert (=> d!126525 (validMask!0 (mask!30466 thiss!1427))))

(assert (=> d!126525 (= (seekEntryOrOpen!0 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) lt!459754 (mask!30466 thiss!1427)) lt!459859)))

(declare-fun b!1043492 () Bool)

(assert (=> b!1043492 (= e!591151 (Found!9768 (index!41445 lt!459860)))))

(declare-fun b!1043493 () Bool)

(assert (=> b!1043493 (= e!591150 (seekKeyOrZeroReturnVacant!0 (x!93001 lt!459860) (index!41445 lt!459860) (index!41445 lt!459860) (select (arr!31621 lt!459754) #b00000000000000000000000000000000) lt!459754 (mask!30466 thiss!1427)))))

(assert (= (and d!126525 c!106204) b!1043488))

(assert (= (and d!126525 (not c!106204)) b!1043490))

(assert (= (and b!1043490 c!106202) b!1043492))

(assert (= (and b!1043490 (not c!106202)) b!1043489))

(assert (= (and b!1043489 c!106203) b!1043491))

(assert (= (and b!1043489 (not c!106203)) b!1043493))

(declare-fun m!963177 () Bool)

(assert (=> b!1043490 m!963177))

(declare-fun m!963179 () Bool)

(assert (=> d!126525 m!963179))

(assert (=> d!126525 m!962973))

(declare-fun m!963181 () Bool)

(assert (=> d!126525 m!963181))

(assert (=> d!126525 m!963067))

(declare-fun m!963183 () Bool)

(assert (=> d!126525 m!963183))

(assert (=> d!126525 m!963067))

(assert (=> d!126525 m!963181))

(declare-fun m!963185 () Bool)

(assert (=> d!126525 m!963185))

(declare-fun m!963187 () Bool)

(assert (=> d!126525 m!963187))

(assert (=> b!1043493 m!963067))

(declare-fun m!963189 () Bool)

(assert (=> b!1043493 m!963189))

(assert (=> b!1043338 d!126525))

(assert (=> b!1043324 d!126495))

(declare-fun b!1043506 () Bool)

(declare-fun c!106211 () Bool)

(declare-fun lt!459867 () (_ BitVec 64))

(assert (=> b!1043506 (= c!106211 (= lt!459867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591160 () SeekEntryResult!9768)

(declare-fun e!591159 () SeekEntryResult!9768)

(assert (=> b!1043506 (= e!591160 e!591159)))

(declare-fun d!126527 () Bool)

(declare-fun lt!459866 () SeekEntryResult!9768)

(assert (=> d!126527 (and (or ((_ is Undefined!9768) lt!459866) (not ((_ is Found!9768) lt!459866)) (and (bvsge (index!41444 lt!459866) #b00000000000000000000000000000000) (bvslt (index!41444 lt!459866) (size!32156 (_keys!11641 thiss!1427))))) (or ((_ is Undefined!9768) lt!459866) ((_ is Found!9768) lt!459866) (not ((_ is MissingVacant!9768) lt!459866)) (not (= (index!41446 lt!459866) (index!41445 lt!459829))) (and (bvsge (index!41446 lt!459866) #b00000000000000000000000000000000) (bvslt (index!41446 lt!459866) (size!32156 (_keys!11641 thiss!1427))))) (or ((_ is Undefined!9768) lt!459866) (ite ((_ is Found!9768) lt!459866) (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459866)) key!909) (and ((_ is MissingVacant!9768) lt!459866) (= (index!41446 lt!459866) (index!41445 lt!459829)) (= (select (arr!31621 (_keys!11641 thiss!1427)) (index!41446 lt!459866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!591158 () SeekEntryResult!9768)

(assert (=> d!126527 (= lt!459866 e!591158)))

(declare-fun c!106212 () Bool)

(assert (=> d!126527 (= c!106212 (bvsge (x!93001 lt!459829) #b01111111111111111111111111111110))))

(assert (=> d!126527 (= lt!459867 (select (arr!31621 (_keys!11641 thiss!1427)) (index!41445 lt!459829)))))

(assert (=> d!126527 (validMask!0 (mask!30466 thiss!1427))))

(assert (=> d!126527 (= (seekKeyOrZeroReturnVacant!0 (x!93001 lt!459829) (index!41445 lt!459829) (index!41445 lt!459829) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)) lt!459866)))

(declare-fun b!1043507 () Bool)

(assert (=> b!1043507 (= e!591158 Undefined!9768)))

(declare-fun b!1043508 () Bool)

(assert (=> b!1043508 (= e!591159 (MissingVacant!9768 (index!41445 lt!459829)))))

(declare-fun b!1043509 () Bool)

(assert (=> b!1043509 (= e!591159 (seekKeyOrZeroReturnVacant!0 (bvadd (x!93001 lt!459829) #b00000000000000000000000000000001) (nextIndex!0 (index!41445 lt!459829) (bvadd (x!93001 lt!459829) #b00000000000000000000000000000001) (mask!30466 thiss!1427)) (index!41445 lt!459829) key!909 (_keys!11641 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun b!1043510 () Bool)

(assert (=> b!1043510 (= e!591158 e!591160)))

(declare-fun c!106213 () Bool)

(assert (=> b!1043510 (= c!106213 (= lt!459867 key!909))))

(declare-fun b!1043511 () Bool)

(assert (=> b!1043511 (= e!591160 (Found!9768 (index!41445 lt!459829)))))

(assert (= (and d!126527 c!106212) b!1043507))

(assert (= (and d!126527 (not c!106212)) b!1043510))

(assert (= (and b!1043510 c!106213) b!1043511))

(assert (= (and b!1043510 (not c!106213)) b!1043506))

(assert (= (and b!1043506 c!106211) b!1043508))

(assert (= (and b!1043506 (not c!106211)) b!1043509))

(declare-fun m!963191 () Bool)

(assert (=> d!126527 m!963191))

(declare-fun m!963193 () Bool)

(assert (=> d!126527 m!963193))

(assert (=> d!126527 m!963121))

(assert (=> d!126527 m!962973))

(declare-fun m!963195 () Bool)

(assert (=> b!1043509 m!963195))

(assert (=> b!1043509 m!963195))

(declare-fun m!963197 () Bool)

(assert (=> b!1043509 m!963197))

(assert (=> b!1043400 d!126527))

(declare-fun d!126529 () Bool)

(assert (=> d!126529 (= (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31621 (_keys!11641 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043381 d!126529))

(declare-fun d!126531 () Bool)

(assert (=> d!126531 (= (arrayCountValidKeys!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!126531 true))

(declare-fun _$79!32 () Unit!34049)

(assert (=> d!126531 (= (choose!82 (_keys!11641 thiss!1427) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!32)))

(declare-fun bs!30497 () Bool)

(assert (= bs!30497 d!126531))

(assert (=> bs!30497 m!962989))

(assert (=> bs!30497 m!963097))

(assert (=> bs!30497 m!962979))

(assert (=> d!126475 d!126531))

(declare-fun b!1043512 () Bool)

(declare-fun e!591163 () Bool)

(declare-fun e!591162 () Bool)

(assert (=> b!1043512 (= e!591163 e!591162)))

(declare-fun c!106214 () Bool)

(assert (=> b!1043512 (= c!106214 (validKeyInArray!0 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!126533 () Bool)

(declare-fun res!694976 () Bool)

(assert (=> d!126533 (=> res!694976 e!591163)))

(assert (=> d!126533 (= res!694976 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 lt!459754)))))

(assert (=> d!126533 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459754 (mask!30466 thiss!1427)) e!591163)))

(declare-fun b!1043513 () Bool)

(declare-fun e!591161 () Bool)

(assert (=> b!1043513 (= e!591162 e!591161)))

(declare-fun lt!459869 () (_ BitVec 64))

(assert (=> b!1043513 (= lt!459869 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459868 () Unit!34049)

(assert (=> b!1043513 (= lt!459868 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459754 lt!459869 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1043513 (arrayContainsKey!0 lt!459754 lt!459869 #b00000000000000000000000000000000)))

(declare-fun lt!459870 () Unit!34049)

(assert (=> b!1043513 (= lt!459870 lt!459868)))

(declare-fun res!694975 () Bool)

(assert (=> b!1043513 (= res!694975 (= (seekEntryOrOpen!0 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459754 (mask!30466 thiss!1427)) (Found!9768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1043513 (=> (not res!694975) (not e!591161))))

(declare-fun bm!44224 () Bool)

(declare-fun call!44227 () Bool)

(assert (=> bm!44224 (= call!44227 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459754 (mask!30466 thiss!1427)))))

(declare-fun b!1043514 () Bool)

(assert (=> b!1043514 (= e!591161 call!44227)))

(declare-fun b!1043515 () Bool)

(assert (=> b!1043515 (= e!591162 call!44227)))

(assert (= (and d!126533 (not res!694976)) b!1043512))

(assert (= (and b!1043512 c!106214) b!1043513))

(assert (= (and b!1043512 (not c!106214)) b!1043515))

(assert (= (and b!1043513 res!694975) b!1043514))

(assert (= (or b!1043514 b!1043515) bm!44224))

(assert (=> b!1043512 m!963137))

(assert (=> b!1043512 m!963137))

(assert (=> b!1043512 m!963139))

(assert (=> b!1043513 m!963137))

(declare-fun m!963199 () Bool)

(assert (=> b!1043513 m!963199))

(declare-fun m!963201 () Bool)

(assert (=> b!1043513 m!963201))

(assert (=> b!1043513 m!963137))

(declare-fun m!963203 () Bool)

(assert (=> b!1043513 m!963203))

(declare-fun m!963205 () Bool)

(assert (=> bm!44224 m!963205))

(assert (=> bm!44214 d!126533))

(declare-fun d!126535 () Bool)

(declare-fun lt!459873 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!526 (List!21962) (InoxSet (_ BitVec 64)))

(assert (=> d!126535 (= lt!459873 (select (content!526 Nil!21959) (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun e!591168 () Bool)

(assert (=> d!126535 (= lt!459873 e!591168)))

(declare-fun res!694982 () Bool)

(assert (=> d!126535 (=> (not res!694982) (not e!591168))))

(assert (=> d!126535 (= res!694982 ((_ is Cons!21958) Nil!21959))))

(assert (=> d!126535 (= (contains!6082 Nil!21959 (select (arr!31621 lt!459754) #b00000000000000000000000000000000)) lt!459873)))

(declare-fun b!1043520 () Bool)

(declare-fun e!591169 () Bool)

(assert (=> b!1043520 (= e!591168 e!591169)))

(declare-fun res!694981 () Bool)

(assert (=> b!1043520 (=> res!694981 e!591169)))

(assert (=> b!1043520 (= res!694981 (= (h!23174 Nil!21959) (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(declare-fun b!1043521 () Bool)

(assert (=> b!1043521 (= e!591169 (contains!6082 (t!31168 Nil!21959) (select (arr!31621 lt!459754) #b00000000000000000000000000000000)))))

(assert (= (and d!126535 res!694982) b!1043520))

(assert (= (and b!1043520 (not res!694981)) b!1043521))

(declare-fun m!963207 () Bool)

(assert (=> d!126535 m!963207))

(assert (=> d!126535 m!963067))

(declare-fun m!963209 () Bool)

(assert (=> d!126535 m!963209))

(assert (=> b!1043521 m!963067))

(declare-fun m!963211 () Bool)

(assert (=> b!1043521 m!963211))

(assert (=> b!1043327 d!126535))

(assert (=> b!1043326 d!126495))

(declare-fun d!126537 () Bool)

(assert (=> d!126537 (arrayNoDuplicates!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 Nil!21959)))

(assert (=> d!126537 true))

(declare-fun _$66!56 () Unit!34049)

(assert (=> d!126537 (= (choose!53 (_keys!11641 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!459756) #b00000000000000000000000000000000 Nil!21959) _$66!56)))

(declare-fun bs!30498 () Bool)

(assert (= bs!30498 d!126537))

(assert (=> bs!30498 m!962989))

(assert (=> bs!30498 m!963105))

(assert (=> d!126477 d!126537))

(declare-fun b!1043522 () Bool)

(declare-fun e!591171 () (_ BitVec 32))

(declare-fun call!44228 () (_ BitVec 32))

(assert (=> b!1043522 (= e!591171 (bvadd #b00000000000000000000000000000001 call!44228))))

(declare-fun b!1043523 () Bool)

(declare-fun e!591170 () (_ BitVec 32))

(assert (=> b!1043523 (= e!591170 e!591171)))

(declare-fun c!106215 () Bool)

(assert (=> b!1043523 (= c!106215 (validKeyInArray!0 (select (arr!31621 (_keys!11641 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043524 () Bool)

(assert (=> b!1043524 (= e!591171 call!44228)))

(declare-fun b!1043525 () Bool)

(assert (=> b!1043525 (= e!591170 #b00000000000000000000000000000000)))

(declare-fun bm!44225 () Bool)

(assert (=> bm!44225 (= call!44228 (arrayCountValidKeys!0 (_keys!11641 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(declare-fun d!126539 () Bool)

(declare-fun lt!459874 () (_ BitVec 32))

(assert (=> d!126539 (and (bvsge lt!459874 #b00000000000000000000000000000000) (bvsle lt!459874 (bvsub (size!32156 (_keys!11641 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126539 (= lt!459874 e!591170)))

(declare-fun c!106216 () Bool)

(assert (=> d!126539 (= c!106216 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126539 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32156 (_keys!11641 thiss!1427)) (size!32156 (_keys!11641 thiss!1427))))))

(assert (=> d!126539 (= (arrayCountValidKeys!0 (_keys!11641 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 (_keys!11641 thiss!1427))) lt!459874)))

(assert (= (and d!126539 c!106216) b!1043525))

(assert (= (and d!126539 (not c!106216)) b!1043523))

(assert (= (and b!1043523 c!106215) b!1043522))

(assert (= (and b!1043523 (not c!106215)) b!1043524))

(assert (= (or b!1043522 b!1043524) bm!44225))

(declare-fun m!963213 () Bool)

(assert (=> b!1043523 m!963213))

(assert (=> b!1043523 m!963213))

(declare-fun m!963215 () Bool)

(assert (=> b!1043523 m!963215))

(declare-fun m!963217 () Bool)

(assert (=> bm!44225 m!963217))

(assert (=> bm!44218 d!126539))

(declare-fun b!1043526 () Bool)

(declare-fun e!591172 () Bool)

(declare-fun e!591175 () Bool)

(assert (=> b!1043526 (= e!591172 e!591175)))

(declare-fun c!106217 () Bool)

(assert (=> b!1043526 (= c!106217 (validKeyInArray!0 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043527 () Bool)

(declare-fun call!44229 () Bool)

(assert (=> b!1043527 (= e!591175 call!44229)))

(declare-fun b!1043528 () Bool)

(declare-fun e!591173 () Bool)

(assert (=> b!1043528 (= e!591173 e!591172)))

(declare-fun res!694985 () Bool)

(assert (=> b!1043528 (=> (not res!694985) (not e!591172))))

(declare-fun e!591174 () Bool)

(assert (=> b!1043528 (= res!694985 (not e!591174))))

(declare-fun res!694983 () Bool)

(assert (=> b!1043528 (=> (not res!694983) (not e!591174))))

(assert (=> b!1043528 (= res!694983 (validKeyInArray!0 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043529 () Bool)

(assert (=> b!1043529 (= e!591174 (contains!6082 Nil!21959 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44226 () Bool)

(assert (=> bm!44226 (= call!44229 (arrayNoDuplicates!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106217 (Cons!21958 (select (arr!31621 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427)))) #b00000000000000000000000000000000) Nil!21959) Nil!21959)))))

(declare-fun d!126541 () Bool)

(declare-fun res!694984 () Bool)

(assert (=> d!126541 (=> res!694984 e!591173)))

(assert (=> d!126541 (= res!694984 (bvsge #b00000000000000000000000000000000 (size!32156 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))))))))

(assert (=> d!126541 (= (arrayNoDuplicates!0 (array!65738 (store (arr!31621 (_keys!11641 thiss!1427)) (index!41444 lt!459756) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11641 thiss!1427))) #b00000000000000000000000000000000 Nil!21959) e!591173)))

(declare-fun b!1043530 () Bool)

(assert (=> b!1043530 (= e!591175 call!44229)))

(assert (= (and d!126541 (not res!694984)) b!1043528))

(assert (= (and b!1043528 res!694983) b!1043529))

(assert (= (and b!1043528 res!694985) b!1043526))

(assert (= (and b!1043526 c!106217) b!1043527))

(assert (= (and b!1043526 (not c!106217)) b!1043530))

(assert (= (or b!1043527 b!1043530) bm!44226))

(assert (=> b!1043526 m!963129))

(assert (=> b!1043526 m!963129))

(assert (=> b!1043526 m!963151))

(assert (=> b!1043528 m!963129))

(assert (=> b!1043528 m!963129))

(assert (=> b!1043528 m!963151))

(assert (=> b!1043529 m!963129))

(assert (=> b!1043529 m!963129))

(declare-fun m!963219 () Bool)

(assert (=> b!1043529 m!963219))

(assert (=> bm!44226 m!963129))

(declare-fun m!963221 () Bool)

(assert (=> bm!44226 m!963221))

(assert (=> b!1043367 d!126541))

(declare-fun b!1043531 () Bool)

(declare-fun e!591176 () Bool)

(declare-fun e!591179 () Bool)

(assert (=> b!1043531 (= e!591176 e!591179)))

(declare-fun c!106218 () Bool)

(assert (=> b!1043531 (= c!106218 (validKeyInArray!0 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043532 () Bool)

(declare-fun call!44230 () Bool)

(assert (=> b!1043532 (= e!591179 call!44230)))

(declare-fun b!1043533 () Bool)

(declare-fun e!591177 () Bool)

(assert (=> b!1043533 (= e!591177 e!591176)))

(declare-fun res!694988 () Bool)

(assert (=> b!1043533 (=> (not res!694988) (not e!591176))))

(declare-fun e!591178 () Bool)

(assert (=> b!1043533 (= res!694988 (not e!591178))))

(declare-fun res!694986 () Bool)

(assert (=> b!1043533 (=> (not res!694986) (not e!591178))))

(assert (=> b!1043533 (= res!694986 (validKeyInArray!0 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043534 () Bool)

(assert (=> b!1043534 (= e!591178 (contains!6082 (ite c!106159 (Cons!21958 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) Nil!21959) Nil!21959) (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44227 () Bool)

(assert (=> bm!44227 (= call!44230 (arrayNoDuplicates!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!106218 (Cons!21958 (select (arr!31621 lt!459754) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!106159 (Cons!21958 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) Nil!21959) Nil!21959)) (ite c!106159 (Cons!21958 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) Nil!21959) Nil!21959))))))

(declare-fun d!126543 () Bool)

(declare-fun res!694987 () Bool)

(assert (=> d!126543 (=> res!694987 e!591177)))

(assert (=> d!126543 (= res!694987 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32156 lt!459754)))))

(assert (=> d!126543 (= (arrayNoDuplicates!0 lt!459754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106159 (Cons!21958 (select (arr!31621 lt!459754) #b00000000000000000000000000000000) Nil!21959) Nil!21959)) e!591177)))

(declare-fun b!1043535 () Bool)

(assert (=> b!1043535 (= e!591179 call!44230)))

(assert (= (and d!126543 (not res!694987)) b!1043533))

(assert (= (and b!1043533 res!694986) b!1043534))

(assert (= (and b!1043533 res!694988) b!1043531))

(assert (= (and b!1043531 c!106218) b!1043532))

(assert (= (and b!1043531 (not c!106218)) b!1043535))

(assert (= (or b!1043532 b!1043535) bm!44227))

(assert (=> b!1043531 m!963137))

(assert (=> b!1043531 m!963137))

(assert (=> b!1043531 m!963139))

(assert (=> b!1043533 m!963137))

(assert (=> b!1043533 m!963137))

(assert (=> b!1043533 m!963139))

(assert (=> b!1043534 m!963137))

(assert (=> b!1043534 m!963137))

(declare-fun m!963223 () Bool)

(assert (=> b!1043534 m!963223))

(assert (=> bm!44227 m!963137))

(declare-fun m!963225 () Bool)

(assert (=> bm!44227 m!963225))

(assert (=> bm!44211 d!126543))

(declare-fun mapIsEmpty!38765 () Bool)

(declare-fun mapRes!38765 () Bool)

(assert (=> mapIsEmpty!38765 mapRes!38765))

(declare-fun b!1043537 () Bool)

(declare-fun e!591181 () Bool)

(assert (=> b!1043537 (= e!591181 tp_is_empty!24769)))

(declare-fun mapNonEmpty!38765 () Bool)

(declare-fun tp!74382 () Bool)

(declare-fun e!591180 () Bool)

(assert (=> mapNonEmpty!38765 (= mapRes!38765 (and tp!74382 e!591180))))

(declare-fun mapKey!38765 () (_ BitVec 32))

(declare-fun mapValue!38765 () ValueCell!11681)

(declare-fun mapRest!38765 () (Array (_ BitVec 32) ValueCell!11681))

(assert (=> mapNonEmpty!38765 (= mapRest!38764 (store mapRest!38765 mapKey!38765 mapValue!38765))))

(declare-fun condMapEmpty!38765 () Bool)

(declare-fun mapDefault!38765 () ValueCell!11681)

(assert (=> mapNonEmpty!38764 (= condMapEmpty!38765 (= mapRest!38764 ((as const (Array (_ BitVec 32) ValueCell!11681)) mapDefault!38765)))))

(assert (=> mapNonEmpty!38764 (= tp!74381 (and e!591181 mapRes!38765))))

(declare-fun b!1043536 () Bool)

(assert (=> b!1043536 (= e!591180 tp_is_empty!24769)))

(assert (= (and mapNonEmpty!38764 condMapEmpty!38765) mapIsEmpty!38765))

(assert (= (and mapNonEmpty!38764 (not condMapEmpty!38765)) mapNonEmpty!38765))

(assert (= (and mapNonEmpty!38765 ((_ is ValueCellFull!11681) mapValue!38765)) b!1043536))

(assert (= (and mapNonEmpty!38764 ((_ is ValueCellFull!11681) mapDefault!38765)) b!1043537))

(declare-fun m!963227 () Bool)

(assert (=> mapNonEmpty!38765 m!963227))

(check-sat (not b!1043523) (not b!1043427) (not b!1043463) (not b!1043526) (not b!1043509) (not d!126519) (not bm!44219) (not d!126497) (not b!1043475) (not b!1043512) (not b!1043424) (not d!126521) (not b!1043534) (not b!1043419) (not b!1043531) (not d!126527) (not b!1043430) (not b!1043437) (not b!1043471) b_and!33591 (not d!126535) (not bm!44226) tp_is_empty!24769 (not b!1043469) (not b!1043528) (not mapNonEmpty!38765) (not bm!44224) (not d!126531) (not d!126509) (not b!1043426) (not b!1043521) (not b!1043533) (not d!126537) (not d!126491) (not bm!44220) (not d!126525) (not b!1043433) (not bm!44221) (not b!1043434) (not b!1043420) (not bm!44223) (not b_next!21049) (not bm!44222) (not b!1043529) (not b!1043493) (not b!1043423) (not b!1043513) (not bm!44225) (not bm!44227) (not b!1043438))
(check-sat b_and!33591 (not b_next!21049))
