; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91270 () Bool)

(assert start!91270)

(declare-fun b!1040970 () Bool)

(declare-fun b_free!20983 () Bool)

(declare-fun b_next!20983 () Bool)

(assert (=> b!1040970 (= b_free!20983 (not b_next!20983))))

(declare-fun tp!74131 () Bool)

(declare-fun b_and!33525 () Bool)

(assert (=> b!1040970 (= tp!74131 b_and!33525)))

(declare-fun b!1040964 () Bool)

(declare-fun e!589287 () Bool)

(declare-fun tp_is_empty!24703 () Bool)

(assert (=> b!1040964 (= e!589287 tp_is_empty!24703)))

(declare-fun b!1040965 () Bool)

(declare-fun res!693810 () Bool)

(declare-fun e!589286 () Bool)

(assert (=> b!1040965 (=> (not res!693810) (not e!589286))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040965 (= res!693810 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040966 () Bool)

(declare-fun e!589289 () Bool)

(assert (=> b!1040966 (= e!589286 e!589289)))

(declare-fun res!693809 () Bool)

(assert (=> b!1040966 (=> (not res!693809) (not e!589289))))

(declare-datatypes ((SeekEntryResult!9740 0))(
  ( (MissingZero!9740 (index!41331 (_ BitVec 32))) (Found!9740 (index!41332 (_ BitVec 32))) (Intermediate!9740 (undefined!10552 Bool) (index!41333 (_ BitVec 32)) (x!92770 (_ BitVec 32))) (Undefined!9740) (MissingVacant!9740 (index!41334 (_ BitVec 32))) )
))
(declare-fun lt!458685 () SeekEntryResult!9740)

(get-info :version)

(assert (=> b!1040966 (= res!693809 ((_ is Found!9740) lt!458685))))

(declare-datatypes ((V!37811 0))(
  ( (V!37812 (val!12402 Int)) )
))
(declare-datatypes ((ValueCell!11648 0))(
  ( (ValueCellFull!11648 (v!14985 V!37811)) (EmptyCell!11648) )
))
(declare-datatypes ((array!65583 0))(
  ( (array!65584 (arr!31555 (Array (_ BitVec 32) (_ BitVec 64))) (size!32087 (_ BitVec 32))) )
))
(declare-datatypes ((array!65585 0))(
  ( (array!65586 (arr!31556 (Array (_ BitVec 32) ValueCell!11648)) (size!32088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5890 0))(
  ( (LongMapFixedSize!5891 (defaultEntry!6327 Int) (mask!30358 (_ BitVec 32)) (extraKeys!6055 (_ BitVec 32)) (zeroValue!6161 V!37811) (minValue!6161 V!37811) (_size!3000 (_ BitVec 32)) (_keys!11577 array!65583) (_values!6350 array!65585) (_vacant!3000 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5890)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65583 (_ BitVec 32)) SeekEntryResult!9740)

(assert (=> b!1040966 (= lt!458685 (seekEntry!0 key!909 (_keys!11577 thiss!1427) (mask!30358 thiss!1427)))))

(declare-fun mapNonEmpty!38620 () Bool)

(declare-fun mapRes!38620 () Bool)

(declare-fun tp!74132 () Bool)

(assert (=> mapNonEmpty!38620 (= mapRes!38620 (and tp!74132 e!589287))))

(declare-fun mapValue!38620 () ValueCell!11648)

(declare-fun mapRest!38620 () (Array (_ BitVec 32) ValueCell!11648))

(declare-fun mapKey!38620 () (_ BitVec 32))

(assert (=> mapNonEmpty!38620 (= (arr!31556 (_values!6350 thiss!1427)) (store mapRest!38620 mapKey!38620 mapValue!38620))))

(declare-fun b!1040967 () Bool)

(declare-fun e!589291 () Bool)

(assert (=> b!1040967 (= e!589291 tp_is_empty!24703)))

(declare-fun mapIsEmpty!38620 () Bool)

(assert (=> mapIsEmpty!38620 mapRes!38620))

(declare-fun b!1040968 () Bool)

(assert (=> b!1040968 (= e!589289 (not (bvsge (index!41332 lt!458685) #b00000000000000000000000000000000)))))

(declare-fun lt!458686 () array!65583)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65583 (_ BitVec 32)) Bool)

(assert (=> b!1040968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458686 (mask!30358 thiss!1427))))

(declare-datatypes ((Unit!34001 0))(
  ( (Unit!34002) )
))
(declare-fun lt!458687 () Unit!34001)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65583 (_ BitVec 32) (_ BitVec 32)) Unit!34001)

(assert (=> b!1040968 (= lt!458687 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11577 thiss!1427) (index!41332 lt!458685) (mask!30358 thiss!1427)))))

(declare-datatypes ((List!21937 0))(
  ( (Nil!21934) (Cons!21933 (h!23146 (_ BitVec 64)) (t!31143 List!21937)) )
))
(declare-fun arrayNoDuplicates!0 (array!65583 (_ BitVec 32) List!21937) Bool)

(assert (=> b!1040968 (arrayNoDuplicates!0 lt!458686 #b00000000000000000000000000000000 Nil!21934)))

(declare-fun lt!458689 () Unit!34001)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21937) Unit!34001)

(assert (=> b!1040968 (= lt!458689 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11577 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41332 lt!458685) #b00000000000000000000000000000000 Nil!21934))))

(declare-fun arrayCountValidKeys!0 (array!65583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040968 (= (arrayCountValidKeys!0 lt!458686 #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11577 thiss!1427) #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040968 (= lt!458686 (array!65584 (store (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32087 (_keys!11577 thiss!1427))))))

(declare-fun lt!458688 () Unit!34001)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65583 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> b!1040968 (= lt!458688 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11577 thiss!1427) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040969 () Bool)

(declare-fun e!589288 () Bool)

(assert (=> b!1040969 (= e!589288 (and e!589291 mapRes!38620))))

(declare-fun condMapEmpty!38620 () Bool)

(declare-fun mapDefault!38620 () ValueCell!11648)

(assert (=> b!1040969 (= condMapEmpty!38620 (= (arr!31556 (_values!6350 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11648)) mapDefault!38620)))))

(declare-fun e!589290 () Bool)

(declare-fun array_inv!24401 (array!65583) Bool)

(declare-fun array_inv!24402 (array!65585) Bool)

(assert (=> b!1040970 (= e!589290 (and tp!74131 tp_is_empty!24703 (array_inv!24401 (_keys!11577 thiss!1427)) (array_inv!24402 (_values!6350 thiss!1427)) e!589288))))

(declare-fun res!693811 () Bool)

(assert (=> start!91270 (=> (not res!693811) (not e!589286))))

(declare-fun valid!2224 (LongMapFixedSize!5890) Bool)

(assert (=> start!91270 (= res!693811 (valid!2224 thiss!1427))))

(assert (=> start!91270 e!589286))

(assert (=> start!91270 e!589290))

(assert (=> start!91270 true))

(assert (= (and start!91270 res!693811) b!1040965))

(assert (= (and b!1040965 res!693810) b!1040966))

(assert (= (and b!1040966 res!693809) b!1040968))

(assert (= (and b!1040969 condMapEmpty!38620) mapIsEmpty!38620))

(assert (= (and b!1040969 (not condMapEmpty!38620)) mapNonEmpty!38620))

(assert (= (and mapNonEmpty!38620 ((_ is ValueCellFull!11648) mapValue!38620)) b!1040964))

(assert (= (and b!1040969 ((_ is ValueCellFull!11648) mapDefault!38620)) b!1040967))

(assert (= b!1040970 b!1040969))

(assert (= start!91270 b!1040970))

(declare-fun m!960969 () Bool)

(assert (=> b!1040970 m!960969))

(declare-fun m!960971 () Bool)

(assert (=> b!1040970 m!960971))

(declare-fun m!960973 () Bool)

(assert (=> b!1040968 m!960973))

(declare-fun m!960975 () Bool)

(assert (=> b!1040968 m!960975))

(declare-fun m!960977 () Bool)

(assert (=> b!1040968 m!960977))

(declare-fun m!960979 () Bool)

(assert (=> b!1040968 m!960979))

(declare-fun m!960981 () Bool)

(assert (=> b!1040968 m!960981))

(declare-fun m!960983 () Bool)

(assert (=> b!1040968 m!960983))

(declare-fun m!960985 () Bool)

(assert (=> b!1040968 m!960985))

(declare-fun m!960987 () Bool)

(assert (=> b!1040968 m!960987))

(declare-fun m!960989 () Bool)

(assert (=> b!1040966 m!960989))

(declare-fun m!960991 () Bool)

(assert (=> start!91270 m!960991))

(declare-fun m!960993 () Bool)

(assert (=> mapNonEmpty!38620 m!960993))

(check-sat (not b!1040968) (not b!1040970) (not b_next!20983) (not start!91270) (not mapNonEmpty!38620) tp_is_empty!24703 (not b!1040966) b_and!33525)
(check-sat b_and!33525 (not b_next!20983))
(get-model)

(declare-fun b!1041022 () Bool)

(declare-fun res!693841 () Bool)

(declare-fun e!589339 () Bool)

(assert (=> b!1041022 (=> (not res!693841) (not e!589339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041022 (= res!693841 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125997 () Bool)

(declare-fun e!589340 () Bool)

(assert (=> d!125997 e!589340))

(declare-fun res!693840 () Bool)

(assert (=> d!125997 (=> (not res!693840) (not e!589340))))

(assert (=> d!125997 (= res!693840 (and (bvsge (index!41332 lt!458685) #b00000000000000000000000000000000) (bvslt (index!41332 lt!458685) (size!32087 (_keys!11577 thiss!1427)))))))

(declare-fun lt!458722 () Unit!34001)

(declare-fun choose!82 (array!65583 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> d!125997 (= lt!458722 (choose!82 (_keys!11577 thiss!1427) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125997 e!589339))

(declare-fun res!693838 () Bool)

(assert (=> d!125997 (=> (not res!693838) (not e!589339))))

(assert (=> d!125997 (= res!693838 (and (bvsge (index!41332 lt!458685) #b00000000000000000000000000000000) (bvslt (index!41332 lt!458685) (size!32087 (_keys!11577 thiss!1427)))))))

(assert (=> d!125997 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11577 thiss!1427) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458722)))

(declare-fun b!1041021 () Bool)

(declare-fun res!693839 () Bool)

(assert (=> b!1041021 (=> (not res!693839) (not e!589339))))

(assert (=> b!1041021 (= res!693839 (validKeyInArray!0 (select (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458685))))))

(declare-fun b!1041023 () Bool)

(assert (=> b!1041023 (= e!589339 (bvslt (size!32087 (_keys!11577 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041024 () Bool)

(assert (=> b!1041024 (= e!589340 (= (arrayCountValidKeys!0 (array!65584 (store (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32087 (_keys!11577 thiss!1427))) #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11577 thiss!1427) #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125997 res!693838) b!1041021))

(assert (= (and b!1041021 res!693839) b!1041022))

(assert (= (and b!1041022 res!693841) b!1041023))

(assert (= (and d!125997 res!693840) b!1041024))

(declare-fun m!961047 () Bool)

(assert (=> b!1041022 m!961047))

(declare-fun m!961049 () Bool)

(assert (=> d!125997 m!961049))

(declare-fun m!961051 () Bool)

(assert (=> b!1041021 m!961051))

(assert (=> b!1041021 m!961051))

(declare-fun m!961053 () Bool)

(assert (=> b!1041021 m!961053))

(assert (=> b!1041024 m!960979))

(declare-fun m!961055 () Bool)

(assert (=> b!1041024 m!961055))

(assert (=> b!1041024 m!960987))

(assert (=> b!1040968 d!125997))

(declare-fun b!1041033 () Bool)

(declare-fun e!589348 () Bool)

(declare-fun e!589349 () Bool)

(assert (=> b!1041033 (= e!589348 e!589349)))

(declare-fun lt!458731 () (_ BitVec 64))

(assert (=> b!1041033 (= lt!458731 (select (arr!31555 lt!458686) #b00000000000000000000000000000000))))

(declare-fun lt!458729 () Unit!34001)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65583 (_ BitVec 64) (_ BitVec 32)) Unit!34001)

(assert (=> b!1041033 (= lt!458729 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458686 lt!458731 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041033 (arrayContainsKey!0 lt!458686 lt!458731 #b00000000000000000000000000000000)))

(declare-fun lt!458730 () Unit!34001)

(assert (=> b!1041033 (= lt!458730 lt!458729)))

(declare-fun res!693846 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65583 (_ BitVec 32)) SeekEntryResult!9740)

(assert (=> b!1041033 (= res!693846 (= (seekEntryOrOpen!0 (select (arr!31555 lt!458686) #b00000000000000000000000000000000) lt!458686 (mask!30358 thiss!1427)) (Found!9740 #b00000000000000000000000000000000)))))

(assert (=> b!1041033 (=> (not res!693846) (not e!589349))))

(declare-fun b!1041034 () Bool)

(declare-fun call!44074 () Bool)

(assert (=> b!1041034 (= e!589348 call!44074)))

(declare-fun bm!44071 () Bool)

(assert (=> bm!44071 (= call!44074 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458686 (mask!30358 thiss!1427)))))

(declare-fun d!125999 () Bool)

(declare-fun res!693847 () Bool)

(declare-fun e!589347 () Bool)

(assert (=> d!125999 (=> res!693847 e!589347)))

(assert (=> d!125999 (= res!693847 (bvsge #b00000000000000000000000000000000 (size!32087 lt!458686)))))

(assert (=> d!125999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458686 (mask!30358 thiss!1427)) e!589347)))

(declare-fun b!1041035 () Bool)

(assert (=> b!1041035 (= e!589347 e!589348)))

(declare-fun c!105786 () Bool)

(assert (=> b!1041035 (= c!105786 (validKeyInArray!0 (select (arr!31555 lt!458686) #b00000000000000000000000000000000)))))

(declare-fun b!1041036 () Bool)

(assert (=> b!1041036 (= e!589349 call!44074)))

(assert (= (and d!125999 (not res!693847)) b!1041035))

(assert (= (and b!1041035 c!105786) b!1041033))

(assert (= (and b!1041035 (not c!105786)) b!1041034))

(assert (= (and b!1041033 res!693846) b!1041036))

(assert (= (or b!1041036 b!1041034) bm!44071))

(declare-fun m!961057 () Bool)

(assert (=> b!1041033 m!961057))

(declare-fun m!961059 () Bool)

(assert (=> b!1041033 m!961059))

(declare-fun m!961061 () Bool)

(assert (=> b!1041033 m!961061))

(assert (=> b!1041033 m!961057))

(declare-fun m!961063 () Bool)

(assert (=> b!1041033 m!961063))

(declare-fun m!961065 () Bool)

(assert (=> bm!44071 m!961065))

(assert (=> b!1041035 m!961057))

(assert (=> b!1041035 m!961057))

(declare-fun m!961067 () Bool)

(assert (=> b!1041035 m!961067))

(assert (=> b!1040968 d!125999))

(declare-fun d!126001 () Bool)

(declare-fun lt!458734 () (_ BitVec 32))

(assert (=> d!126001 (and (bvsge lt!458734 #b00000000000000000000000000000000) (bvsle lt!458734 (bvsub (size!32087 lt!458686) #b00000000000000000000000000000000)))))

(declare-fun e!589355 () (_ BitVec 32))

(assert (=> d!126001 (= lt!458734 e!589355)))

(declare-fun c!105792 () Bool)

(assert (=> d!126001 (= c!105792 (bvsge #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))))))

(assert (=> d!126001 (and (bvsle #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32087 (_keys!11577 thiss!1427)) (size!32087 lt!458686)))))

(assert (=> d!126001 (= (arrayCountValidKeys!0 lt!458686 #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) lt!458734)))

(declare-fun b!1041045 () Bool)

(assert (=> b!1041045 (= e!589355 #b00000000000000000000000000000000)))

(declare-fun b!1041046 () Bool)

(declare-fun e!589354 () (_ BitVec 32))

(declare-fun call!44077 () (_ BitVec 32))

(assert (=> b!1041046 (= e!589354 (bvadd #b00000000000000000000000000000001 call!44077))))

(declare-fun bm!44074 () Bool)

(assert (=> bm!44074 (= call!44077 (arrayCountValidKeys!0 lt!458686 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32087 (_keys!11577 thiss!1427))))))

(declare-fun b!1041047 () Bool)

(assert (=> b!1041047 (= e!589354 call!44077)))

(declare-fun b!1041048 () Bool)

(assert (=> b!1041048 (= e!589355 e!589354)))

(declare-fun c!105791 () Bool)

(assert (=> b!1041048 (= c!105791 (validKeyInArray!0 (select (arr!31555 lt!458686) #b00000000000000000000000000000000)))))

(assert (= (and d!126001 c!105792) b!1041045))

(assert (= (and d!126001 (not c!105792)) b!1041048))

(assert (= (and b!1041048 c!105791) b!1041046))

(assert (= (and b!1041048 (not c!105791)) b!1041047))

(assert (= (or b!1041046 b!1041047) bm!44074))

(declare-fun m!961069 () Bool)

(assert (=> bm!44074 m!961069))

(assert (=> b!1041048 m!961057))

(assert (=> b!1041048 m!961057))

(assert (=> b!1041048 m!961067))

(assert (=> b!1040968 d!126001))

(declare-fun d!126003 () Bool)

(declare-fun e!589358 () Bool)

(assert (=> d!126003 e!589358))

(declare-fun res!693850 () Bool)

(assert (=> d!126003 (=> (not res!693850) (not e!589358))))

(assert (=> d!126003 (= res!693850 (and (bvsge (index!41332 lt!458685) #b00000000000000000000000000000000) (bvslt (index!41332 lt!458685) (size!32087 (_keys!11577 thiss!1427)))))))

(declare-fun lt!458737 () Unit!34001)

(declare-fun choose!25 (array!65583 (_ BitVec 32) (_ BitVec 32)) Unit!34001)

(assert (=> d!126003 (= lt!458737 (choose!25 (_keys!11577 thiss!1427) (index!41332 lt!458685) (mask!30358 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126003 (validMask!0 (mask!30358 thiss!1427))))

(assert (=> d!126003 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11577 thiss!1427) (index!41332 lt!458685) (mask!30358 thiss!1427)) lt!458737)))

(declare-fun b!1041051 () Bool)

(assert (=> b!1041051 (= e!589358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65584 (store (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32087 (_keys!11577 thiss!1427))) (mask!30358 thiss!1427)))))

(assert (= (and d!126003 res!693850) b!1041051))

(declare-fun m!961071 () Bool)

(assert (=> d!126003 m!961071))

(declare-fun m!961073 () Bool)

(assert (=> d!126003 m!961073))

(assert (=> b!1041051 m!960979))

(declare-fun m!961075 () Bool)

(assert (=> b!1041051 m!961075))

(assert (=> b!1040968 d!126003))

(declare-fun d!126005 () Bool)

(declare-fun lt!458738 () (_ BitVec 32))

(assert (=> d!126005 (and (bvsge lt!458738 #b00000000000000000000000000000000) (bvsle lt!458738 (bvsub (size!32087 (_keys!11577 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589360 () (_ BitVec 32))

(assert (=> d!126005 (= lt!458738 e!589360)))

(declare-fun c!105794 () Bool)

(assert (=> d!126005 (= c!105794 (bvsge #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))))))

(assert (=> d!126005 (and (bvsle #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32087 (_keys!11577 thiss!1427)) (size!32087 (_keys!11577 thiss!1427))))))

(assert (=> d!126005 (= (arrayCountValidKeys!0 (_keys!11577 thiss!1427) #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) lt!458738)))

(declare-fun b!1041052 () Bool)

(assert (=> b!1041052 (= e!589360 #b00000000000000000000000000000000)))

(declare-fun b!1041053 () Bool)

(declare-fun e!589359 () (_ BitVec 32))

(declare-fun call!44078 () (_ BitVec 32))

(assert (=> b!1041053 (= e!589359 (bvadd #b00000000000000000000000000000001 call!44078))))

(declare-fun bm!44075 () Bool)

(assert (=> bm!44075 (= call!44078 (arrayCountValidKeys!0 (_keys!11577 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32087 (_keys!11577 thiss!1427))))))

(declare-fun b!1041054 () Bool)

(assert (=> b!1041054 (= e!589359 call!44078)))

(declare-fun b!1041055 () Bool)

(assert (=> b!1041055 (= e!589360 e!589359)))

(declare-fun c!105793 () Bool)

(assert (=> b!1041055 (= c!105793 (validKeyInArray!0 (select (arr!31555 (_keys!11577 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126005 c!105794) b!1041052))

(assert (= (and d!126005 (not c!105794)) b!1041055))

(assert (= (and b!1041055 c!105793) b!1041053))

(assert (= (and b!1041055 (not c!105793)) b!1041054))

(assert (= (or b!1041053 b!1041054) bm!44075))

(declare-fun m!961077 () Bool)

(assert (=> bm!44075 m!961077))

(declare-fun m!961079 () Bool)

(assert (=> b!1041055 m!961079))

(assert (=> b!1041055 m!961079))

(declare-fun m!961081 () Bool)

(assert (=> b!1041055 m!961081))

(assert (=> b!1040968 d!126005))

(declare-fun b!1041066 () Bool)

(declare-fun e!589371 () Bool)

(declare-fun e!589372 () Bool)

(assert (=> b!1041066 (= e!589371 e!589372)))

(declare-fun c!105797 () Bool)

(assert (=> b!1041066 (= c!105797 (validKeyInArray!0 (select (arr!31555 lt!458686) #b00000000000000000000000000000000)))))

(declare-fun b!1041067 () Bool)

(declare-fun call!44081 () Bool)

(assert (=> b!1041067 (= e!589372 call!44081)))

(declare-fun bm!44078 () Bool)

(assert (=> bm!44078 (= call!44081 (arrayNoDuplicates!0 lt!458686 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105797 (Cons!21933 (select (arr!31555 lt!458686) #b00000000000000000000000000000000) Nil!21934) Nil!21934)))))

(declare-fun d!126007 () Bool)

(declare-fun res!693857 () Bool)

(declare-fun e!589369 () Bool)

(assert (=> d!126007 (=> res!693857 e!589369)))

(assert (=> d!126007 (= res!693857 (bvsge #b00000000000000000000000000000000 (size!32087 lt!458686)))))

(assert (=> d!126007 (= (arrayNoDuplicates!0 lt!458686 #b00000000000000000000000000000000 Nil!21934) e!589369)))

(declare-fun b!1041068 () Bool)

(assert (=> b!1041068 (= e!589372 call!44081)))

(declare-fun b!1041069 () Bool)

(assert (=> b!1041069 (= e!589369 e!589371)))

(declare-fun res!693858 () Bool)

(assert (=> b!1041069 (=> (not res!693858) (not e!589371))))

(declare-fun e!589370 () Bool)

(assert (=> b!1041069 (= res!693858 (not e!589370))))

(declare-fun res!693859 () Bool)

(assert (=> b!1041069 (=> (not res!693859) (not e!589370))))

(assert (=> b!1041069 (= res!693859 (validKeyInArray!0 (select (arr!31555 lt!458686) #b00000000000000000000000000000000)))))

(declare-fun b!1041070 () Bool)

(declare-fun contains!6071 (List!21937 (_ BitVec 64)) Bool)

(assert (=> b!1041070 (= e!589370 (contains!6071 Nil!21934 (select (arr!31555 lt!458686) #b00000000000000000000000000000000)))))

(assert (= (and d!126007 (not res!693857)) b!1041069))

(assert (= (and b!1041069 res!693859) b!1041070))

(assert (= (and b!1041069 res!693858) b!1041066))

(assert (= (and b!1041066 c!105797) b!1041068))

(assert (= (and b!1041066 (not c!105797)) b!1041067))

(assert (= (or b!1041068 b!1041067) bm!44078))

(assert (=> b!1041066 m!961057))

(assert (=> b!1041066 m!961057))

(assert (=> b!1041066 m!961067))

(assert (=> bm!44078 m!961057))

(declare-fun m!961083 () Bool)

(assert (=> bm!44078 m!961083))

(assert (=> b!1041069 m!961057))

(assert (=> b!1041069 m!961057))

(assert (=> b!1041069 m!961067))

(assert (=> b!1041070 m!961057))

(assert (=> b!1041070 m!961057))

(declare-fun m!961085 () Bool)

(assert (=> b!1041070 m!961085))

(assert (=> b!1040968 d!126007))

(declare-fun d!126009 () Bool)

(declare-fun e!589375 () Bool)

(assert (=> d!126009 e!589375))

(declare-fun res!693862 () Bool)

(assert (=> d!126009 (=> (not res!693862) (not e!589375))))

(assert (=> d!126009 (= res!693862 (and (bvsge (index!41332 lt!458685) #b00000000000000000000000000000000) (bvslt (index!41332 lt!458685) (size!32087 (_keys!11577 thiss!1427)))))))

(declare-fun lt!458741 () Unit!34001)

(declare-fun choose!53 (array!65583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21937) Unit!34001)

(assert (=> d!126009 (= lt!458741 (choose!53 (_keys!11577 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41332 lt!458685) #b00000000000000000000000000000000 Nil!21934))))

(assert (=> d!126009 (bvslt (size!32087 (_keys!11577 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126009 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11577 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41332 lt!458685) #b00000000000000000000000000000000 Nil!21934) lt!458741)))

(declare-fun b!1041073 () Bool)

(assert (=> b!1041073 (= e!589375 (arrayNoDuplicates!0 (array!65584 (store (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458685) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32087 (_keys!11577 thiss!1427))) #b00000000000000000000000000000000 Nil!21934))))

(assert (= (and d!126009 res!693862) b!1041073))

(declare-fun m!961087 () Bool)

(assert (=> d!126009 m!961087))

(assert (=> b!1041073 m!960979))

(declare-fun m!961089 () Bool)

(assert (=> b!1041073 m!961089))

(assert (=> b!1040968 d!126009))

(declare-fun d!126011 () Bool)

(declare-fun res!693869 () Bool)

(declare-fun e!589378 () Bool)

(assert (=> d!126011 (=> (not res!693869) (not e!589378))))

(declare-fun simpleValid!429 (LongMapFixedSize!5890) Bool)

(assert (=> d!126011 (= res!693869 (simpleValid!429 thiss!1427))))

(assert (=> d!126011 (= (valid!2224 thiss!1427) e!589378)))

(declare-fun b!1041080 () Bool)

(declare-fun res!693870 () Bool)

(assert (=> b!1041080 (=> (not res!693870) (not e!589378))))

(assert (=> b!1041080 (= res!693870 (= (arrayCountValidKeys!0 (_keys!11577 thiss!1427) #b00000000000000000000000000000000 (size!32087 (_keys!11577 thiss!1427))) (_size!3000 thiss!1427)))))

(declare-fun b!1041081 () Bool)

(declare-fun res!693871 () Bool)

(assert (=> b!1041081 (=> (not res!693871) (not e!589378))))

(assert (=> b!1041081 (= res!693871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11577 thiss!1427) (mask!30358 thiss!1427)))))

(declare-fun b!1041082 () Bool)

(assert (=> b!1041082 (= e!589378 (arrayNoDuplicates!0 (_keys!11577 thiss!1427) #b00000000000000000000000000000000 Nil!21934))))

(assert (= (and d!126011 res!693869) b!1041080))

(assert (= (and b!1041080 res!693870) b!1041081))

(assert (= (and b!1041081 res!693871) b!1041082))

(declare-fun m!961091 () Bool)

(assert (=> d!126011 m!961091))

(assert (=> b!1041080 m!960987))

(declare-fun m!961093 () Bool)

(assert (=> b!1041081 m!961093))

(declare-fun m!961095 () Bool)

(assert (=> b!1041082 m!961095))

(assert (=> start!91270 d!126011))

(declare-fun d!126013 () Bool)

(assert (=> d!126013 (= (array_inv!24401 (_keys!11577 thiss!1427)) (bvsge (size!32087 (_keys!11577 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040970 d!126013))

(declare-fun d!126015 () Bool)

(assert (=> d!126015 (= (array_inv!24402 (_values!6350 thiss!1427)) (bvsge (size!32088 (_values!6350 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040970 d!126015))

(declare-fun b!1041095 () Bool)

(declare-fun e!589387 () SeekEntryResult!9740)

(declare-fun lt!458753 () SeekEntryResult!9740)

(assert (=> b!1041095 (= e!589387 (MissingZero!9740 (index!41333 lt!458753)))))

(declare-fun b!1041096 () Bool)

(declare-fun e!589386 () SeekEntryResult!9740)

(assert (=> b!1041096 (= e!589386 Undefined!9740)))

(declare-fun b!1041097 () Bool)

(declare-fun e!589385 () SeekEntryResult!9740)

(assert (=> b!1041097 (= e!589385 (Found!9740 (index!41333 lt!458753)))))

(declare-fun d!126017 () Bool)

(declare-fun lt!458750 () SeekEntryResult!9740)

(assert (=> d!126017 (and (or ((_ is MissingVacant!9740) lt!458750) (not ((_ is Found!9740) lt!458750)) (and (bvsge (index!41332 lt!458750) #b00000000000000000000000000000000) (bvslt (index!41332 lt!458750) (size!32087 (_keys!11577 thiss!1427))))) (not ((_ is MissingVacant!9740) lt!458750)) (or (not ((_ is Found!9740) lt!458750)) (= (select (arr!31555 (_keys!11577 thiss!1427)) (index!41332 lt!458750)) key!909)))))

(assert (=> d!126017 (= lt!458750 e!589386)))

(declare-fun c!105806 () Bool)

(assert (=> d!126017 (= c!105806 (and ((_ is Intermediate!9740) lt!458753) (undefined!10552 lt!458753)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65583 (_ BitVec 32)) SeekEntryResult!9740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126017 (= lt!458753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30358 thiss!1427)) key!909 (_keys!11577 thiss!1427) (mask!30358 thiss!1427)))))

(assert (=> d!126017 (validMask!0 (mask!30358 thiss!1427))))

(assert (=> d!126017 (= (seekEntry!0 key!909 (_keys!11577 thiss!1427) (mask!30358 thiss!1427)) lt!458750)))

(declare-fun b!1041098 () Bool)

(assert (=> b!1041098 (= e!589386 e!589385)))

(declare-fun lt!458751 () (_ BitVec 64))

(assert (=> b!1041098 (= lt!458751 (select (arr!31555 (_keys!11577 thiss!1427)) (index!41333 lt!458753)))))

(declare-fun c!105805 () Bool)

(assert (=> b!1041098 (= c!105805 (= lt!458751 key!909))))

(declare-fun b!1041099 () Bool)

(declare-fun c!105804 () Bool)

(assert (=> b!1041099 (= c!105804 (= lt!458751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041099 (= e!589385 e!589387)))

(declare-fun b!1041100 () Bool)

(declare-fun lt!458752 () SeekEntryResult!9740)

(assert (=> b!1041100 (= e!589387 (ite ((_ is MissingVacant!9740) lt!458752) (MissingZero!9740 (index!41334 lt!458752)) lt!458752))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65583 (_ BitVec 32)) SeekEntryResult!9740)

(assert (=> b!1041100 (= lt!458752 (seekKeyOrZeroReturnVacant!0 (x!92770 lt!458753) (index!41333 lt!458753) (index!41333 lt!458753) key!909 (_keys!11577 thiss!1427) (mask!30358 thiss!1427)))))

(assert (= (and d!126017 c!105806) b!1041096))

(assert (= (and d!126017 (not c!105806)) b!1041098))

(assert (= (and b!1041098 c!105805) b!1041097))

(assert (= (and b!1041098 (not c!105805)) b!1041099))

(assert (= (and b!1041099 c!105804) b!1041095))

(assert (= (and b!1041099 (not c!105804)) b!1041100))

(declare-fun m!961097 () Bool)

(assert (=> d!126017 m!961097))

(declare-fun m!961099 () Bool)

(assert (=> d!126017 m!961099))

(assert (=> d!126017 m!961099))

(declare-fun m!961101 () Bool)

(assert (=> d!126017 m!961101))

(assert (=> d!126017 m!961073))

(declare-fun m!961103 () Bool)

(assert (=> b!1041098 m!961103))

(declare-fun m!961105 () Bool)

(assert (=> b!1041100 m!961105))

(assert (=> b!1040966 d!126017))

(declare-fun b!1041108 () Bool)

(declare-fun e!589393 () Bool)

(assert (=> b!1041108 (= e!589393 tp_is_empty!24703)))

(declare-fun mapIsEmpty!38629 () Bool)

(declare-fun mapRes!38629 () Bool)

(assert (=> mapIsEmpty!38629 mapRes!38629))

(declare-fun condMapEmpty!38629 () Bool)

(declare-fun mapDefault!38629 () ValueCell!11648)

(assert (=> mapNonEmpty!38620 (= condMapEmpty!38629 (= mapRest!38620 ((as const (Array (_ BitVec 32) ValueCell!11648)) mapDefault!38629)))))

(assert (=> mapNonEmpty!38620 (= tp!74132 (and e!589393 mapRes!38629))))

(declare-fun mapNonEmpty!38629 () Bool)

(declare-fun tp!74147 () Bool)

(declare-fun e!589392 () Bool)

(assert (=> mapNonEmpty!38629 (= mapRes!38629 (and tp!74147 e!589392))))

(declare-fun mapRest!38629 () (Array (_ BitVec 32) ValueCell!11648))

(declare-fun mapKey!38629 () (_ BitVec 32))

(declare-fun mapValue!38629 () ValueCell!11648)

(assert (=> mapNonEmpty!38629 (= mapRest!38620 (store mapRest!38629 mapKey!38629 mapValue!38629))))

(declare-fun b!1041107 () Bool)

(assert (=> b!1041107 (= e!589392 tp_is_empty!24703)))

(assert (= (and mapNonEmpty!38620 condMapEmpty!38629) mapIsEmpty!38629))

(assert (= (and mapNonEmpty!38620 (not condMapEmpty!38629)) mapNonEmpty!38629))

(assert (= (and mapNonEmpty!38629 ((_ is ValueCellFull!11648) mapValue!38629)) b!1041107))

(assert (= (and mapNonEmpty!38620 ((_ is ValueCellFull!11648) mapDefault!38629)) b!1041108))

(declare-fun m!961107 () Bool)

(assert (=> mapNonEmpty!38629 m!961107))

(check-sat (not b!1041081) (not bm!44078) (not b!1041022) (not b!1041048) (not d!126003) (not b_next!20983) (not d!126011) (not b!1041082) (not b!1041035) (not b!1041080) (not d!126009) (not d!125997) tp_is_empty!24703 b_and!33525 (not bm!44074) (not b!1041021) (not b!1041069) (not b!1041024) (not b!1041051) (not b!1041073) (not b!1041033) (not d!126017) (not b!1041100) (not b!1041070) (not b!1041066) (not mapNonEmpty!38629) (not bm!44071) (not bm!44075) (not b!1041055))
(check-sat b_and!33525 (not b_next!20983))
