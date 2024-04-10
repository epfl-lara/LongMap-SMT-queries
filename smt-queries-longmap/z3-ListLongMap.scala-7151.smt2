; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90934 () Bool)

(assert start!90934)

(declare-fun b!1038992 () Bool)

(declare-fun b_free!20961 () Bool)

(declare-fun b_next!20961 () Bool)

(assert (=> b!1038992 (= b_free!20961 (not b_next!20961))))

(declare-fun tp!74054 () Bool)

(declare-fun b_and!33493 () Bool)

(assert (=> b!1038992 (= tp!74054 b_and!33493)))

(declare-fun b!1038987 () Bool)

(declare-fun e!587977 () Bool)

(declare-fun e!587980 () Bool)

(assert (=> b!1038987 (= e!587977 e!587980)))

(declare-fun res!692974 () Bool)

(assert (=> b!1038987 (=> (not res!692974) (not e!587980))))

(declare-datatypes ((SeekEntryResult!9778 0))(
  ( (MissingZero!9778 (index!41483 (_ BitVec 32))) (Found!9778 (index!41484 (_ BitVec 32))) (Intermediate!9778 (undefined!10590 Bool) (index!41485 (_ BitVec 32)) (x!92722 (_ BitVec 32))) (Undefined!9778) (MissingVacant!9778 (index!41486 (_ BitVec 32))) )
))
(declare-fun lt!457941 () SeekEntryResult!9778)

(get-info :version)

(assert (=> b!1038987 (= res!692974 ((_ is Found!9778) lt!457941))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37781 0))(
  ( (V!37782 (val!12391 Int)) )
))
(declare-datatypes ((ValueCell!11637 0))(
  ( (ValueCellFull!11637 (v!14978 V!37781)) (EmptyCell!11637) )
))
(declare-datatypes ((array!65482 0))(
  ( (array!65483 (arr!31515 (Array (_ BitVec 32) (_ BitVec 64))) (size!32046 (_ BitVec 32))) )
))
(declare-datatypes ((array!65484 0))(
  ( (array!65485 (arr!31516 (Array (_ BitVec 32) ValueCell!11637)) (size!32047 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5868 0))(
  ( (LongMapFixedSize!5869 (defaultEntry!6316 Int) (mask!30270 (_ BitVec 32)) (extraKeys!6044 (_ BitVec 32)) (zeroValue!6150 V!37781) (minValue!6150 V!37781) (_size!2989 (_ BitVec 32)) (_keys!11523 array!65482) (_values!6339 array!65484) (_vacant!2989 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5868)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65482 (_ BitVec 32)) SeekEntryResult!9778)

(assert (=> b!1038987 (= lt!457941 (seekEntry!0 key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun b!1038988 () Bool)

(declare-fun e!587976 () Bool)

(declare-fun tp_is_empty!24681 () Bool)

(assert (=> b!1038988 (= e!587976 tp_is_empty!24681)))

(declare-fun b!1038989 () Bool)

(declare-fun res!692973 () Bool)

(assert (=> b!1038989 (=> (not res!692973) (not e!587977))))

(assert (=> b!1038989 (= res!692973 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038990 () Bool)

(declare-fun e!587983 () Bool)

(assert (=> b!1038990 (= e!587983 tp_is_empty!24681)))

(declare-fun res!692971 () Bool)

(assert (=> start!90934 (=> (not res!692971) (not e!587977))))

(declare-fun valid!2205 (LongMapFixedSize!5868) Bool)

(assert (=> start!90934 (= res!692971 (valid!2205 thiss!1427))))

(assert (=> start!90934 e!587977))

(declare-fun e!587982 () Bool)

(assert (=> start!90934 e!587982))

(assert (=> start!90934 true))

(declare-fun mapNonEmpty!38575 () Bool)

(declare-fun mapRes!38575 () Bool)

(declare-fun tp!74053 () Bool)

(assert (=> mapNonEmpty!38575 (= mapRes!38575 (and tp!74053 e!587983))))

(declare-fun mapKey!38575 () (_ BitVec 32))

(declare-fun mapValue!38575 () ValueCell!11637)

(declare-fun mapRest!38575 () (Array (_ BitVec 32) ValueCell!11637))

(assert (=> mapNonEmpty!38575 (= (arr!31516 (_values!6339 thiss!1427)) (store mapRest!38575 mapKey!38575 mapValue!38575))))

(declare-fun b!1038991 () Bool)

(declare-fun e!587979 () Bool)

(assert (=> b!1038991 (= e!587980 (not e!587979))))

(declare-fun res!692972 () Bool)

(assert (=> b!1038991 (=> res!692972 e!587979)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038991 (= res!692972 (not (validMask!0 (mask!30270 thiss!1427))))))

(declare-fun lt!457942 () array!65482)

(declare-datatypes ((List!21942 0))(
  ( (Nil!21939) (Cons!21938 (h!23142 (_ BitVec 64)) (t!31156 List!21942)) )
))
(declare-fun arrayNoDuplicates!0 (array!65482 (_ BitVec 32) List!21942) Bool)

(assert (=> b!1038991 (arrayNoDuplicates!0 lt!457942 #b00000000000000000000000000000000 Nil!21939)))

(declare-datatypes ((Unit!33987 0))(
  ( (Unit!33988) )
))
(declare-fun lt!457940 () Unit!33987)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21942) Unit!33987)

(assert (=> b!1038991 (= lt!457940 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11523 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!457941) #b00000000000000000000000000000000 Nil!21939))))

(declare-fun arrayCountValidKeys!0 (array!65482 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038991 (= (arrayCountValidKeys!0 lt!457942 #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038991 (= lt!457942 (array!65483 (store (arr!31515 (_keys!11523 thiss!1427)) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32046 (_keys!11523 thiss!1427))))))

(declare-fun lt!457939 () Unit!33987)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65482 (_ BitVec 32) (_ BitVec 64)) Unit!33987)

(assert (=> b!1038991 (= lt!457939 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11523 thiss!1427) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587978 () Bool)

(declare-fun array_inv!24367 (array!65482) Bool)

(declare-fun array_inv!24368 (array!65484) Bool)

(assert (=> b!1038992 (= e!587982 (and tp!74054 tp_is_empty!24681 (array_inv!24367 (_keys!11523 thiss!1427)) (array_inv!24368 (_values!6339 thiss!1427)) e!587978))))

(declare-fun mapIsEmpty!38575 () Bool)

(assert (=> mapIsEmpty!38575 mapRes!38575))

(declare-fun b!1038993 () Bool)

(assert (=> b!1038993 (= e!587978 (and e!587976 mapRes!38575))))

(declare-fun condMapEmpty!38575 () Bool)

(declare-fun mapDefault!38575 () ValueCell!11637)

(assert (=> b!1038993 (= condMapEmpty!38575 (= (arr!31516 (_values!6339 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11637)) mapDefault!38575)))))

(declare-fun b!1038994 () Bool)

(assert (=> b!1038994 (= e!587979 (or (not (= (size!32046 (_keys!11523 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30270 thiss!1427)))) (bvslt (index!41484 lt!457941) #b00000000000000000000000000000000) (bvslt (index!41484 lt!457941) (size!32046 (_keys!11523 thiss!1427)))))))

(assert (= (and start!90934 res!692971) b!1038989))

(assert (= (and b!1038989 res!692973) b!1038987))

(assert (= (and b!1038987 res!692974) b!1038991))

(assert (= (and b!1038991 (not res!692972)) b!1038994))

(assert (= (and b!1038993 condMapEmpty!38575) mapIsEmpty!38575))

(assert (= (and b!1038993 (not condMapEmpty!38575)) mapNonEmpty!38575))

(assert (= (and mapNonEmpty!38575 ((_ is ValueCellFull!11637) mapValue!38575)) b!1038990))

(assert (= (and b!1038993 ((_ is ValueCellFull!11637) mapDefault!38575)) b!1038988))

(assert (= b!1038992 b!1038993))

(assert (= start!90934 b!1038992))

(declare-fun m!958797 () Bool)

(assert (=> start!90934 m!958797))

(declare-fun m!958799 () Bool)

(assert (=> b!1038992 m!958799))

(declare-fun m!958801 () Bool)

(assert (=> b!1038992 m!958801))

(declare-fun m!958803 () Bool)

(assert (=> mapNonEmpty!38575 m!958803))

(declare-fun m!958805 () Bool)

(assert (=> b!1038987 m!958805))

(declare-fun m!958807 () Bool)

(assert (=> b!1038991 m!958807))

(declare-fun m!958809 () Bool)

(assert (=> b!1038991 m!958809))

(declare-fun m!958811 () Bool)

(assert (=> b!1038991 m!958811))

(declare-fun m!958813 () Bool)

(assert (=> b!1038991 m!958813))

(declare-fun m!958815 () Bool)

(assert (=> b!1038991 m!958815))

(declare-fun m!958817 () Bool)

(assert (=> b!1038991 m!958817))

(declare-fun m!958819 () Bool)

(assert (=> b!1038991 m!958819))

(check-sat (not b!1038987) (not b!1038991) tp_is_empty!24681 (not b!1038992) (not mapNonEmpty!38575) (not start!90934) (not b_next!20961) b_and!33493)
(check-sat b_and!33493 (not b_next!20961))
(get-model)

(declare-fun d!125435 () Bool)

(assert (=> d!125435 (= (array_inv!24367 (_keys!11523 thiss!1427)) (bvsge (size!32046 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038992 d!125435))

(declare-fun d!125437 () Bool)

(assert (=> d!125437 (= (array_inv!24368 (_values!6339 thiss!1427)) (bvsge (size!32047 (_values!6339 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038992 d!125437))

(declare-fun d!125439 () Bool)

(declare-fun res!692993 () Bool)

(declare-fun e!588010 () Bool)

(assert (=> d!125439 (=> (not res!692993) (not e!588010))))

(declare-fun simpleValid!425 (LongMapFixedSize!5868) Bool)

(assert (=> d!125439 (= res!692993 (simpleValid!425 thiss!1427))))

(assert (=> d!125439 (= (valid!2205 thiss!1427) e!588010)))

(declare-fun b!1039025 () Bool)

(declare-fun res!692994 () Bool)

(assert (=> b!1039025 (=> (not res!692994) (not e!588010))))

(assert (=> b!1039025 (= res!692994 (= (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) (_size!2989 thiss!1427)))))

(declare-fun b!1039026 () Bool)

(declare-fun res!692995 () Bool)

(assert (=> b!1039026 (=> (not res!692995) (not e!588010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65482 (_ BitVec 32)) Bool)

(assert (=> b!1039026 (= res!692995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun b!1039027 () Bool)

(assert (=> b!1039027 (= e!588010 (arrayNoDuplicates!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 Nil!21939))))

(assert (= (and d!125439 res!692993) b!1039025))

(assert (= (and b!1039025 res!692994) b!1039026))

(assert (= (and b!1039026 res!692995) b!1039027))

(declare-fun m!958845 () Bool)

(assert (=> d!125439 m!958845))

(assert (=> b!1039025 m!958819))

(declare-fun m!958847 () Bool)

(assert (=> b!1039026 m!958847))

(declare-fun m!958849 () Bool)

(assert (=> b!1039027 m!958849))

(assert (=> start!90934 d!125439))

(declare-fun b!1039036 () Bool)

(declare-fun e!588015 () (_ BitVec 32))

(declare-fun call!43974 () (_ BitVec 32))

(assert (=> b!1039036 (= e!588015 call!43974)))

(declare-fun b!1039037 () Bool)

(declare-fun e!588016 () (_ BitVec 32))

(assert (=> b!1039037 (= e!588016 #b00000000000000000000000000000000)))

(declare-fun bm!43971 () Bool)

(assert (=> bm!43971 (= call!43974 (arrayCountValidKeys!0 lt!457942 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32046 (_keys!11523 thiss!1427))))))

(declare-fun b!1039038 () Bool)

(assert (=> b!1039038 (= e!588015 (bvadd #b00000000000000000000000000000001 call!43974))))

(declare-fun b!1039039 () Bool)

(assert (=> b!1039039 (= e!588016 e!588015)))

(declare-fun c!105293 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039039 (= c!105293 (validKeyInArray!0 (select (arr!31515 lt!457942) #b00000000000000000000000000000000)))))

(declare-fun d!125441 () Bool)

(declare-fun lt!457957 () (_ BitVec 32))

(assert (=> d!125441 (and (bvsge lt!457957 #b00000000000000000000000000000000) (bvsle lt!457957 (bvsub (size!32046 lt!457942) #b00000000000000000000000000000000)))))

(assert (=> d!125441 (= lt!457957 e!588016)))

(declare-fun c!105294 () Bool)

(assert (=> d!125441 (= c!105294 (bvsge #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))))))

(assert (=> d!125441 (and (bvsle #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32046 (_keys!11523 thiss!1427)) (size!32046 lt!457942)))))

(assert (=> d!125441 (= (arrayCountValidKeys!0 lt!457942 #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) lt!457957)))

(assert (= (and d!125441 c!105294) b!1039037))

(assert (= (and d!125441 (not c!105294)) b!1039039))

(assert (= (and b!1039039 c!105293) b!1039038))

(assert (= (and b!1039039 (not c!105293)) b!1039036))

(assert (= (or b!1039038 b!1039036) bm!43971))

(declare-fun m!958851 () Bool)

(assert (=> bm!43971 m!958851))

(declare-fun m!958853 () Bool)

(assert (=> b!1039039 m!958853))

(assert (=> b!1039039 m!958853))

(declare-fun m!958855 () Bool)

(assert (=> b!1039039 m!958855))

(assert (=> b!1038991 d!125441))

(declare-fun d!125443 () Bool)

(assert (=> d!125443 (= (validMask!0 (mask!30270 thiss!1427)) (and (or (= (mask!30270 thiss!1427) #b00000000000000000000000000000111) (= (mask!30270 thiss!1427) #b00000000000000000000000000001111) (= (mask!30270 thiss!1427) #b00000000000000000000000000011111) (= (mask!30270 thiss!1427) #b00000000000000000000000000111111) (= (mask!30270 thiss!1427) #b00000000000000000000000001111111) (= (mask!30270 thiss!1427) #b00000000000000000000000011111111) (= (mask!30270 thiss!1427) #b00000000000000000000000111111111) (= (mask!30270 thiss!1427) #b00000000000000000000001111111111) (= (mask!30270 thiss!1427) #b00000000000000000000011111111111) (= (mask!30270 thiss!1427) #b00000000000000000000111111111111) (= (mask!30270 thiss!1427) #b00000000000000000001111111111111) (= (mask!30270 thiss!1427) #b00000000000000000011111111111111) (= (mask!30270 thiss!1427) #b00000000000000000111111111111111) (= (mask!30270 thiss!1427) #b00000000000000001111111111111111) (= (mask!30270 thiss!1427) #b00000000000000011111111111111111) (= (mask!30270 thiss!1427) #b00000000000000111111111111111111) (= (mask!30270 thiss!1427) #b00000000000001111111111111111111) (= (mask!30270 thiss!1427) #b00000000000011111111111111111111) (= (mask!30270 thiss!1427) #b00000000000111111111111111111111) (= (mask!30270 thiss!1427) #b00000000001111111111111111111111) (= (mask!30270 thiss!1427) #b00000000011111111111111111111111) (= (mask!30270 thiss!1427) #b00000000111111111111111111111111) (= (mask!30270 thiss!1427) #b00000001111111111111111111111111) (= (mask!30270 thiss!1427) #b00000011111111111111111111111111) (= (mask!30270 thiss!1427) #b00000111111111111111111111111111) (= (mask!30270 thiss!1427) #b00001111111111111111111111111111) (= (mask!30270 thiss!1427) #b00011111111111111111111111111111) (= (mask!30270 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30270 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038991 d!125443))

(declare-fun d!125445 () Bool)

(declare-fun e!588019 () Bool)

(assert (=> d!125445 e!588019))

(declare-fun res!692998 () Bool)

(assert (=> d!125445 (=> (not res!692998) (not e!588019))))

(assert (=> d!125445 (= res!692998 (and (bvsge (index!41484 lt!457941) #b00000000000000000000000000000000) (bvslt (index!41484 lt!457941) (size!32046 (_keys!11523 thiss!1427)))))))

(declare-fun lt!457960 () Unit!33987)

(declare-fun choose!53 (array!65482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21942) Unit!33987)

(assert (=> d!125445 (= lt!457960 (choose!53 (_keys!11523 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!457941) #b00000000000000000000000000000000 Nil!21939))))

(assert (=> d!125445 (bvslt (size!32046 (_keys!11523 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125445 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11523 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41484 lt!457941) #b00000000000000000000000000000000 Nil!21939) lt!457960)))

(declare-fun b!1039042 () Bool)

(assert (=> b!1039042 (= e!588019 (arrayNoDuplicates!0 (array!65483 (store (arr!31515 (_keys!11523 thiss!1427)) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32046 (_keys!11523 thiss!1427))) #b00000000000000000000000000000000 Nil!21939))))

(assert (= (and d!125445 res!692998) b!1039042))

(declare-fun m!958857 () Bool)

(assert (=> d!125445 m!958857))

(assert (=> b!1039042 m!958811))

(declare-fun m!958859 () Bool)

(assert (=> b!1039042 m!958859))

(assert (=> b!1038991 d!125445))

(declare-fun bm!43974 () Bool)

(declare-fun call!43977 () Bool)

(declare-fun c!105297 () Bool)

(assert (=> bm!43974 (= call!43977 (arrayNoDuplicates!0 lt!457942 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105297 (Cons!21938 (select (arr!31515 lt!457942) #b00000000000000000000000000000000) Nil!21939) Nil!21939)))))

(declare-fun d!125447 () Bool)

(declare-fun res!693007 () Bool)

(declare-fun e!588030 () Bool)

(assert (=> d!125447 (=> res!693007 e!588030)))

(assert (=> d!125447 (= res!693007 (bvsge #b00000000000000000000000000000000 (size!32046 lt!457942)))))

(assert (=> d!125447 (= (arrayNoDuplicates!0 lt!457942 #b00000000000000000000000000000000 Nil!21939) e!588030)))

(declare-fun b!1039053 () Bool)

(declare-fun e!588028 () Bool)

(assert (=> b!1039053 (= e!588030 e!588028)))

(declare-fun res!693005 () Bool)

(assert (=> b!1039053 (=> (not res!693005) (not e!588028))))

(declare-fun e!588031 () Bool)

(assert (=> b!1039053 (= res!693005 (not e!588031))))

(declare-fun res!693006 () Bool)

(assert (=> b!1039053 (=> (not res!693006) (not e!588031))))

(assert (=> b!1039053 (= res!693006 (validKeyInArray!0 (select (arr!31515 lt!457942) #b00000000000000000000000000000000)))))

(declare-fun b!1039054 () Bool)

(declare-fun e!588029 () Bool)

(assert (=> b!1039054 (= e!588029 call!43977)))

(declare-fun b!1039055 () Bool)

(assert (=> b!1039055 (= e!588028 e!588029)))

(assert (=> b!1039055 (= c!105297 (validKeyInArray!0 (select (arr!31515 lt!457942) #b00000000000000000000000000000000)))))

(declare-fun b!1039056 () Bool)

(declare-fun contains!6041 (List!21942 (_ BitVec 64)) Bool)

(assert (=> b!1039056 (= e!588031 (contains!6041 Nil!21939 (select (arr!31515 lt!457942) #b00000000000000000000000000000000)))))

(declare-fun b!1039057 () Bool)

(assert (=> b!1039057 (= e!588029 call!43977)))

(assert (= (and d!125447 (not res!693007)) b!1039053))

(assert (= (and b!1039053 res!693006) b!1039056))

(assert (= (and b!1039053 res!693005) b!1039055))

(assert (= (and b!1039055 c!105297) b!1039054))

(assert (= (and b!1039055 (not c!105297)) b!1039057))

(assert (= (or b!1039054 b!1039057) bm!43974))

(assert (=> bm!43974 m!958853))

(declare-fun m!958861 () Bool)

(assert (=> bm!43974 m!958861))

(assert (=> b!1039053 m!958853))

(assert (=> b!1039053 m!958853))

(assert (=> b!1039053 m!958855))

(assert (=> b!1039055 m!958853))

(assert (=> b!1039055 m!958853))

(assert (=> b!1039055 m!958855))

(assert (=> b!1039056 m!958853))

(assert (=> b!1039056 m!958853))

(declare-fun m!958863 () Bool)

(assert (=> b!1039056 m!958863))

(assert (=> b!1038991 d!125447))

(declare-fun d!125449 () Bool)

(declare-fun e!588036 () Bool)

(assert (=> d!125449 e!588036))

(declare-fun res!693017 () Bool)

(assert (=> d!125449 (=> (not res!693017) (not e!588036))))

(assert (=> d!125449 (= res!693017 (and (bvsge (index!41484 lt!457941) #b00000000000000000000000000000000) (bvslt (index!41484 lt!457941) (size!32046 (_keys!11523 thiss!1427)))))))

(declare-fun lt!457963 () Unit!33987)

(declare-fun choose!82 (array!65482 (_ BitVec 32) (_ BitVec 64)) Unit!33987)

(assert (=> d!125449 (= lt!457963 (choose!82 (_keys!11523 thiss!1427) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588037 () Bool)

(assert (=> d!125449 e!588037))

(declare-fun res!693019 () Bool)

(assert (=> d!125449 (=> (not res!693019) (not e!588037))))

(assert (=> d!125449 (= res!693019 (and (bvsge (index!41484 lt!457941) #b00000000000000000000000000000000) (bvslt (index!41484 lt!457941) (size!32046 (_keys!11523 thiss!1427)))))))

(assert (=> d!125449 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11523 thiss!1427) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457963)))

(declare-fun b!1039066 () Bool)

(declare-fun res!693016 () Bool)

(assert (=> b!1039066 (=> (not res!693016) (not e!588037))))

(assert (=> b!1039066 (= res!693016 (validKeyInArray!0 (select (arr!31515 (_keys!11523 thiss!1427)) (index!41484 lt!457941))))))

(declare-fun b!1039069 () Bool)

(assert (=> b!1039069 (= e!588036 (= (arrayCountValidKeys!0 (array!65483 (store (arr!31515 (_keys!11523 thiss!1427)) (index!41484 lt!457941) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32046 (_keys!11523 thiss!1427))) #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039067 () Bool)

(declare-fun res!693018 () Bool)

(assert (=> b!1039067 (=> (not res!693018) (not e!588037))))

(assert (=> b!1039067 (= res!693018 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039068 () Bool)

(assert (=> b!1039068 (= e!588037 (bvslt (size!32046 (_keys!11523 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125449 res!693019) b!1039066))

(assert (= (and b!1039066 res!693016) b!1039067))

(assert (= (and b!1039067 res!693018) b!1039068))

(assert (= (and d!125449 res!693017) b!1039069))

(declare-fun m!958865 () Bool)

(assert (=> d!125449 m!958865))

(declare-fun m!958867 () Bool)

(assert (=> b!1039066 m!958867))

(assert (=> b!1039066 m!958867))

(declare-fun m!958869 () Bool)

(assert (=> b!1039066 m!958869))

(assert (=> b!1039069 m!958811))

(declare-fun m!958871 () Bool)

(assert (=> b!1039069 m!958871))

(assert (=> b!1039069 m!958819))

(declare-fun m!958873 () Bool)

(assert (=> b!1039067 m!958873))

(assert (=> b!1038991 d!125449))

(declare-fun b!1039070 () Bool)

(declare-fun e!588038 () (_ BitVec 32))

(declare-fun call!43978 () (_ BitVec 32))

(assert (=> b!1039070 (= e!588038 call!43978)))

(declare-fun b!1039071 () Bool)

(declare-fun e!588039 () (_ BitVec 32))

(assert (=> b!1039071 (= e!588039 #b00000000000000000000000000000000)))

(declare-fun bm!43975 () Bool)

(assert (=> bm!43975 (= call!43978 (arrayCountValidKeys!0 (_keys!11523 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32046 (_keys!11523 thiss!1427))))))

(declare-fun b!1039072 () Bool)

(assert (=> b!1039072 (= e!588038 (bvadd #b00000000000000000000000000000001 call!43978))))

(declare-fun b!1039073 () Bool)

(assert (=> b!1039073 (= e!588039 e!588038)))

(declare-fun c!105298 () Bool)

(assert (=> b!1039073 (= c!105298 (validKeyInArray!0 (select (arr!31515 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125451 () Bool)

(declare-fun lt!457964 () (_ BitVec 32))

(assert (=> d!125451 (and (bvsge lt!457964 #b00000000000000000000000000000000) (bvsle lt!457964 (bvsub (size!32046 (_keys!11523 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125451 (= lt!457964 e!588039)))

(declare-fun c!105299 () Bool)

(assert (=> d!125451 (= c!105299 (bvsge #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))))))

(assert (=> d!125451 (and (bvsle #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32046 (_keys!11523 thiss!1427)) (size!32046 (_keys!11523 thiss!1427))))))

(assert (=> d!125451 (= (arrayCountValidKeys!0 (_keys!11523 thiss!1427) #b00000000000000000000000000000000 (size!32046 (_keys!11523 thiss!1427))) lt!457964)))

(assert (= (and d!125451 c!105299) b!1039071))

(assert (= (and d!125451 (not c!105299)) b!1039073))

(assert (= (and b!1039073 c!105298) b!1039072))

(assert (= (and b!1039073 (not c!105298)) b!1039070))

(assert (= (or b!1039072 b!1039070) bm!43975))

(declare-fun m!958875 () Bool)

(assert (=> bm!43975 m!958875))

(declare-fun m!958877 () Bool)

(assert (=> b!1039073 m!958877))

(assert (=> b!1039073 m!958877))

(declare-fun m!958879 () Bool)

(assert (=> b!1039073 m!958879))

(assert (=> b!1038991 d!125451))

(declare-fun b!1039087 () Bool)

(declare-fun e!588048 () SeekEntryResult!9778)

(declare-fun lt!457976 () SeekEntryResult!9778)

(assert (=> b!1039087 (= e!588048 (Found!9778 (index!41485 lt!457976)))))

(declare-fun b!1039088 () Bool)

(declare-fun e!588046 () SeekEntryResult!9778)

(assert (=> b!1039088 (= e!588046 e!588048)))

(declare-fun lt!457973 () (_ BitVec 64))

(assert (=> b!1039088 (= lt!457973 (select (arr!31515 (_keys!11523 thiss!1427)) (index!41485 lt!457976)))))

(declare-fun c!105308 () Bool)

(assert (=> b!1039088 (= c!105308 (= lt!457973 key!909))))

(declare-fun b!1039089 () Bool)

(declare-fun e!588047 () SeekEntryResult!9778)

(assert (=> b!1039089 (= e!588047 (MissingZero!9778 (index!41485 lt!457976)))))

(declare-fun b!1039090 () Bool)

(declare-fun c!105307 () Bool)

(assert (=> b!1039090 (= c!105307 (= lt!457973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039090 (= e!588048 e!588047)))

(declare-fun b!1039091 () Bool)

(declare-fun lt!457974 () SeekEntryResult!9778)

(assert (=> b!1039091 (= e!588047 (ite ((_ is MissingVacant!9778) lt!457974) (MissingZero!9778 (index!41486 lt!457974)) lt!457974))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65482 (_ BitVec 32)) SeekEntryResult!9778)

(assert (=> b!1039091 (= lt!457974 (seekKeyOrZeroReturnVacant!0 (x!92722 lt!457976) (index!41485 lt!457976) (index!41485 lt!457976) key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(declare-fun b!1039086 () Bool)

(assert (=> b!1039086 (= e!588046 Undefined!9778)))

(declare-fun d!125453 () Bool)

(declare-fun lt!457975 () SeekEntryResult!9778)

(assert (=> d!125453 (and (or ((_ is MissingVacant!9778) lt!457975) (not ((_ is Found!9778) lt!457975)) (and (bvsge (index!41484 lt!457975) #b00000000000000000000000000000000) (bvslt (index!41484 lt!457975) (size!32046 (_keys!11523 thiss!1427))))) (not ((_ is MissingVacant!9778) lt!457975)) (or (not ((_ is Found!9778) lt!457975)) (= (select (arr!31515 (_keys!11523 thiss!1427)) (index!41484 lt!457975)) key!909)))))

(assert (=> d!125453 (= lt!457975 e!588046)))

(declare-fun c!105306 () Bool)

(assert (=> d!125453 (= c!105306 (and ((_ is Intermediate!9778) lt!457976) (undefined!10590 lt!457976)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65482 (_ BitVec 32)) SeekEntryResult!9778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125453 (= lt!457976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30270 thiss!1427)) key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)))))

(assert (=> d!125453 (validMask!0 (mask!30270 thiss!1427))))

(assert (=> d!125453 (= (seekEntry!0 key!909 (_keys!11523 thiss!1427) (mask!30270 thiss!1427)) lt!457975)))

(assert (= (and d!125453 c!105306) b!1039086))

(assert (= (and d!125453 (not c!105306)) b!1039088))

(assert (= (and b!1039088 c!105308) b!1039087))

(assert (= (and b!1039088 (not c!105308)) b!1039090))

(assert (= (and b!1039090 c!105307) b!1039089))

(assert (= (and b!1039090 (not c!105307)) b!1039091))

(declare-fun m!958881 () Bool)

(assert (=> b!1039088 m!958881))

(declare-fun m!958883 () Bool)

(assert (=> b!1039091 m!958883))

(declare-fun m!958885 () Bool)

(assert (=> d!125453 m!958885))

(declare-fun m!958887 () Bool)

(assert (=> d!125453 m!958887))

(assert (=> d!125453 m!958887))

(declare-fun m!958889 () Bool)

(assert (=> d!125453 m!958889))

(assert (=> d!125453 m!958813))

(assert (=> b!1038987 d!125453))

(declare-fun mapNonEmpty!38581 () Bool)

(declare-fun mapRes!38581 () Bool)

(declare-fun tp!74063 () Bool)

(declare-fun e!588054 () Bool)

(assert (=> mapNonEmpty!38581 (= mapRes!38581 (and tp!74063 e!588054))))

(declare-fun mapRest!38581 () (Array (_ BitVec 32) ValueCell!11637))

(declare-fun mapKey!38581 () (_ BitVec 32))

(declare-fun mapValue!38581 () ValueCell!11637)

(assert (=> mapNonEmpty!38581 (= mapRest!38575 (store mapRest!38581 mapKey!38581 mapValue!38581))))

(declare-fun mapIsEmpty!38581 () Bool)

(assert (=> mapIsEmpty!38581 mapRes!38581))

(declare-fun b!1039099 () Bool)

(declare-fun e!588053 () Bool)

(assert (=> b!1039099 (= e!588053 tp_is_empty!24681)))

(declare-fun b!1039098 () Bool)

(assert (=> b!1039098 (= e!588054 tp_is_empty!24681)))

(declare-fun condMapEmpty!38581 () Bool)

(declare-fun mapDefault!38581 () ValueCell!11637)

(assert (=> mapNonEmpty!38575 (= condMapEmpty!38581 (= mapRest!38575 ((as const (Array (_ BitVec 32) ValueCell!11637)) mapDefault!38581)))))

(assert (=> mapNonEmpty!38575 (= tp!74053 (and e!588053 mapRes!38581))))

(assert (= (and mapNonEmpty!38575 condMapEmpty!38581) mapIsEmpty!38581))

(assert (= (and mapNonEmpty!38575 (not condMapEmpty!38581)) mapNonEmpty!38581))

(assert (= (and mapNonEmpty!38581 ((_ is ValueCellFull!11637) mapValue!38581)) b!1039098))

(assert (= (and mapNonEmpty!38575 ((_ is ValueCellFull!11637) mapDefault!38581)) b!1039099))

(declare-fun m!958891 () Bool)

(assert (=> mapNonEmpty!38581 m!958891))

(check-sat (not d!125445) (not d!125453) (not bm!43971) (not b!1039026) (not b!1039042) (not b!1039039) (not b!1039067) (not b!1039091) (not b!1039069) (not b!1039027) (not b!1039025) (not b!1039053) (not bm!43974) tp_is_empty!24681 (not b!1039056) (not b_next!20961) b_and!33493 (not b!1039073) (not d!125439) (not b!1039066) (not mapNonEmpty!38581) (not bm!43975) (not d!125449) (not b!1039055))
(check-sat b_and!33493 (not b_next!20961))
