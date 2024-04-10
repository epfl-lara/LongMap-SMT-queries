; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91142 () Bool)

(assert start!91142)

(declare-fun b!1040338 () Bool)

(declare-fun b_free!21009 () Bool)

(declare-fun b_next!21009 () Bool)

(assert (=> b!1040338 (= b_free!21009 (not b_next!21009))))

(declare-fun tp!74222 () Bool)

(declare-fun b_and!33541 () Bool)

(assert (=> b!1040338 (= tp!74222 b_and!33541)))

(declare-fun b!1040330 () Bool)

(declare-fun e!588977 () Bool)

(declare-fun e!588974 () Bool)

(assert (=> b!1040330 (= e!588977 (not e!588974))))

(declare-fun res!693606 () Bool)

(assert (=> b!1040330 (=> res!693606 e!588974)))

(declare-datatypes ((SeekEntryResult!9795 0))(
  ( (MissingZero!9795 (index!41551 (_ BitVec 32))) (Found!9795 (index!41552 (_ BitVec 32))) (Intermediate!9795 (undefined!10607 Bool) (index!41553 (_ BitVec 32)) (x!92867 (_ BitVec 32))) (Undefined!9795) (MissingVacant!9795 (index!41554 (_ BitVec 32))) )
))
(declare-fun lt!458505 () SeekEntryResult!9795)

(declare-datatypes ((V!37845 0))(
  ( (V!37846 (val!12415 Int)) )
))
(declare-datatypes ((ValueCell!11661 0))(
  ( (ValueCellFull!11661 (v!15002 V!37845)) (EmptyCell!11661) )
))
(declare-datatypes ((array!65594 0))(
  ( (array!65595 (arr!31563 (Array (_ BitVec 32) (_ BitVec 64))) (size!32094 (_ BitVec 32))) )
))
(declare-datatypes ((array!65596 0))(
  ( (array!65597 (arr!31564 (Array (_ BitVec 32) ValueCell!11661)) (size!32095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5916 0))(
  ( (LongMapFixedSize!5917 (defaultEntry!6340 Int) (mask!30331 (_ BitVec 32)) (extraKeys!6068 (_ BitVec 32)) (zeroValue!6174 V!37845) (minValue!6174 V!37845) (_size!3013 (_ BitVec 32)) (_keys!11560 array!65594) (_values!6363 array!65596) (_vacant!3013 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5916)

(assert (=> b!1040330 (= res!693606 (or (bvslt (index!41552 lt!458505) #b00000000000000000000000000000000) (bvsge (index!41552 lt!458505) (size!32094 (_keys!11560 thiss!1427))) (bvsge (size!32094 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458502 () array!65594)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65594 (_ BitVec 32)) Bool)

(assert (=> b!1040330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458502 (mask!30331 thiss!1427))))

(declare-datatypes ((Unit!34013 0))(
  ( (Unit!34014) )
))
(declare-fun lt!458503 () Unit!34013)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65594 (_ BitVec 32) (_ BitVec 32)) Unit!34013)

(assert (=> b!1040330 (= lt!458503 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11560 thiss!1427) (index!41552 lt!458505) (mask!30331 thiss!1427)))))

(declare-datatypes ((List!21957 0))(
  ( (Nil!21954) (Cons!21953 (h!23157 (_ BitVec 64)) (t!31171 List!21957)) )
))
(declare-fun arrayNoDuplicates!0 (array!65594 (_ BitVec 32) List!21957) Bool)

(assert (=> b!1040330 (arrayNoDuplicates!0 lt!458502 #b00000000000000000000000000000000 Nil!21954)))

(declare-fun lt!458501 () Unit!34013)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21957) Unit!34013)

(assert (=> b!1040330 (= lt!458501 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458505) #b00000000000000000000000000000000 Nil!21954))))

(declare-fun arrayCountValidKeys!0 (array!65594 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040330 (= (arrayCountValidKeys!0 lt!458502 #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040330 (= lt!458502 (array!65595 (store (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32094 (_keys!11560 thiss!1427))))))

(declare-fun lt!458504 () Unit!34013)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65594 (_ BitVec 32) (_ BitVec 64)) Unit!34013)

(assert (=> b!1040330 (= lt!458504 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040331 () Bool)

(declare-fun e!588972 () Bool)

(declare-fun tp_is_empty!24729 () Bool)

(assert (=> b!1040331 (= e!588972 tp_is_empty!24729)))

(declare-fun b!1040332 () Bool)

(declare-fun e!588970 () Bool)

(assert (=> b!1040332 (= e!588970 e!588977)))

(declare-fun res!693608 () Bool)

(assert (=> b!1040332 (=> (not res!693608) (not e!588977))))

(get-info :version)

(assert (=> b!1040332 (= res!693608 ((_ is Found!9795) lt!458505))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65594 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040332 (= lt!458505 (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30331 thiss!1427)))))

(declare-fun b!1040333 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040333 (= e!588974 (validKeyInArray!0 key!909))))

(declare-fun b!1040334 () Bool)

(declare-fun e!588975 () Bool)

(declare-fun mapRes!38671 () Bool)

(assert (=> b!1040334 (= e!588975 (and e!588972 mapRes!38671))))

(declare-fun condMapEmpty!38671 () Bool)

(declare-fun mapDefault!38671 () ValueCell!11661)

(assert (=> b!1040334 (= condMapEmpty!38671 (= (arr!31564 (_values!6363 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11661)) mapDefault!38671)))))

(declare-fun b!1040335 () Bool)

(declare-fun res!693610 () Bool)

(assert (=> b!1040335 (=> (not res!693610) (not e!588970))))

(assert (=> b!1040335 (= res!693610 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38671 () Bool)

(declare-fun tp!74221 () Bool)

(declare-fun e!588971 () Bool)

(assert (=> mapNonEmpty!38671 (= mapRes!38671 (and tp!74221 e!588971))))

(declare-fun mapValue!38671 () ValueCell!11661)

(declare-fun mapKey!38671 () (_ BitVec 32))

(declare-fun mapRest!38671 () (Array (_ BitVec 32) ValueCell!11661))

(assert (=> mapNonEmpty!38671 (= (arr!31564 (_values!6363 thiss!1427)) (store mapRest!38671 mapKey!38671 mapValue!38671))))

(declare-fun b!1040336 () Bool)

(declare-fun res!693607 () Bool)

(assert (=> b!1040336 (=> res!693607 e!588974)))

(assert (=> b!1040336 (= res!693607 (not (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21954)))))

(declare-fun b!1040337 () Bool)

(assert (=> b!1040337 (= e!588971 tp_is_empty!24729)))

(declare-fun e!588973 () Bool)

(declare-fun array_inv!24393 (array!65594) Bool)

(declare-fun array_inv!24394 (array!65596) Bool)

(assert (=> b!1040338 (= e!588973 (and tp!74222 tp_is_empty!24729 (array_inv!24393 (_keys!11560 thiss!1427)) (array_inv!24394 (_values!6363 thiss!1427)) e!588975))))

(declare-fun res!693609 () Bool)

(assert (=> start!91142 (=> (not res!693609) (not e!588970))))

(declare-fun valid!2221 (LongMapFixedSize!5916) Bool)

(assert (=> start!91142 (= res!693609 (valid!2221 thiss!1427))))

(assert (=> start!91142 e!588970))

(assert (=> start!91142 e!588973))

(assert (=> start!91142 true))

(declare-fun mapIsEmpty!38671 () Bool)

(assert (=> mapIsEmpty!38671 mapRes!38671))

(assert (= (and start!91142 res!693609) b!1040335))

(assert (= (and b!1040335 res!693610) b!1040332))

(assert (= (and b!1040332 res!693608) b!1040330))

(assert (= (and b!1040330 (not res!693606)) b!1040336))

(assert (= (and b!1040336 (not res!693607)) b!1040333))

(assert (= (and b!1040334 condMapEmpty!38671) mapIsEmpty!38671))

(assert (= (and b!1040334 (not condMapEmpty!38671)) mapNonEmpty!38671))

(assert (= (and mapNonEmpty!38671 ((_ is ValueCellFull!11661) mapValue!38671)) b!1040337))

(assert (= (and b!1040334 ((_ is ValueCellFull!11661) mapDefault!38671)) b!1040331))

(assert (= b!1040338 b!1040334))

(assert (= start!91142 b!1040338))

(declare-fun m!959903 () Bool)

(assert (=> b!1040338 m!959903))

(declare-fun m!959905 () Bool)

(assert (=> b!1040338 m!959905))

(declare-fun m!959907 () Bool)

(assert (=> start!91142 m!959907))

(declare-fun m!959909 () Bool)

(assert (=> b!1040330 m!959909))

(declare-fun m!959911 () Bool)

(assert (=> b!1040330 m!959911))

(declare-fun m!959913 () Bool)

(assert (=> b!1040330 m!959913))

(declare-fun m!959915 () Bool)

(assert (=> b!1040330 m!959915))

(declare-fun m!959917 () Bool)

(assert (=> b!1040330 m!959917))

(declare-fun m!959919 () Bool)

(assert (=> b!1040330 m!959919))

(declare-fun m!959921 () Bool)

(assert (=> b!1040330 m!959921))

(declare-fun m!959923 () Bool)

(assert (=> b!1040330 m!959923))

(declare-fun m!959925 () Bool)

(assert (=> mapNonEmpty!38671 m!959925))

(declare-fun m!959927 () Bool)

(assert (=> b!1040332 m!959927))

(declare-fun m!959929 () Bool)

(assert (=> b!1040336 m!959929))

(declare-fun m!959931 () Bool)

(assert (=> b!1040333 m!959931))

(check-sat (not b!1040336) (not b!1040332) (not b_next!21009) (not b!1040338) (not b!1040333) b_and!33541 (not start!91142) tp_is_empty!24729 (not mapNonEmpty!38671) (not b!1040330))
(check-sat b_and!33541 (not b_next!21009))
(get-model)

(declare-fun d!125633 () Bool)

(assert (=> d!125633 (= (array_inv!24393 (_keys!11560 thiss!1427)) (bvsge (size!32094 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040338 d!125633))

(declare-fun d!125635 () Bool)

(assert (=> d!125635 (= (array_inv!24394 (_values!6363 thiss!1427)) (bvsge (size!32095 (_values!6363 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040338 d!125635))

(declare-fun d!125637 () Bool)

(declare-fun e!589004 () Bool)

(assert (=> d!125637 e!589004))

(declare-fun res!693628 () Bool)

(assert (=> d!125637 (=> (not res!693628) (not e!589004))))

(assert (=> d!125637 (= res!693628 (and (bvsge (index!41552 lt!458505) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458505) (size!32094 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458523 () Unit!34013)

(declare-fun choose!25 (array!65594 (_ BitVec 32) (_ BitVec 32)) Unit!34013)

(assert (=> d!125637 (= lt!458523 (choose!25 (_keys!11560 thiss!1427) (index!41552 lt!458505) (mask!30331 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125637 (validMask!0 (mask!30331 thiss!1427))))

(assert (=> d!125637 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11560 thiss!1427) (index!41552 lt!458505) (mask!30331 thiss!1427)) lt!458523)))

(declare-fun b!1040368 () Bool)

(assert (=> b!1040368 (= e!589004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65595 (store (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32094 (_keys!11560 thiss!1427))) (mask!30331 thiss!1427)))))

(assert (= (and d!125637 res!693628) b!1040368))

(declare-fun m!959963 () Bool)

(assert (=> d!125637 m!959963))

(declare-fun m!959965 () Bool)

(assert (=> d!125637 m!959965))

(assert (=> b!1040368 m!959915))

(declare-fun m!959967 () Bool)

(assert (=> b!1040368 m!959967))

(assert (=> b!1040330 d!125637))

(declare-fun bm!44045 () Bool)

(declare-fun call!44048 () Bool)

(assert (=> bm!44045 (= call!44048 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458502 (mask!30331 thiss!1427)))))

(declare-fun b!1040378 () Bool)

(declare-fun e!589012 () Bool)

(assert (=> b!1040378 (= e!589012 call!44048)))

(declare-fun d!125639 () Bool)

(declare-fun res!693633 () Bool)

(declare-fun e!589011 () Bool)

(assert (=> d!125639 (=> res!693633 e!589011)))

(assert (=> d!125639 (= res!693633 (bvsge #b00000000000000000000000000000000 (size!32094 lt!458502)))))

(assert (=> d!125639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458502 (mask!30331 thiss!1427)) e!589011)))

(declare-fun b!1040377 () Bool)

(declare-fun e!589013 () Bool)

(assert (=> b!1040377 (= e!589013 call!44048)))

(declare-fun b!1040379 () Bool)

(assert (=> b!1040379 (= e!589011 e!589012)))

(declare-fun c!105469 () Bool)

(assert (=> b!1040379 (= c!105469 (validKeyInArray!0 (select (arr!31563 lt!458502) #b00000000000000000000000000000000)))))

(declare-fun b!1040380 () Bool)

(assert (=> b!1040380 (= e!589012 e!589013)))

(declare-fun lt!458531 () (_ BitVec 64))

(assert (=> b!1040380 (= lt!458531 (select (arr!31563 lt!458502) #b00000000000000000000000000000000))))

(declare-fun lt!458532 () Unit!34013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65594 (_ BitVec 64) (_ BitVec 32)) Unit!34013)

(assert (=> b!1040380 (= lt!458532 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458502 lt!458531 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040380 (arrayContainsKey!0 lt!458502 lt!458531 #b00000000000000000000000000000000)))

(declare-fun lt!458530 () Unit!34013)

(assert (=> b!1040380 (= lt!458530 lt!458532)))

(declare-fun res!693634 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65594 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040380 (= res!693634 (= (seekEntryOrOpen!0 (select (arr!31563 lt!458502) #b00000000000000000000000000000000) lt!458502 (mask!30331 thiss!1427)) (Found!9795 #b00000000000000000000000000000000)))))

(assert (=> b!1040380 (=> (not res!693634) (not e!589013))))

(assert (= (and d!125639 (not res!693633)) b!1040379))

(assert (= (and b!1040379 c!105469) b!1040380))

(assert (= (and b!1040379 (not c!105469)) b!1040378))

(assert (= (and b!1040380 res!693634) b!1040377))

(assert (= (or b!1040377 b!1040378) bm!44045))

(declare-fun m!959969 () Bool)

(assert (=> bm!44045 m!959969))

(declare-fun m!959971 () Bool)

(assert (=> b!1040379 m!959971))

(assert (=> b!1040379 m!959971))

(declare-fun m!959973 () Bool)

(assert (=> b!1040379 m!959973))

(assert (=> b!1040380 m!959971))

(declare-fun m!959975 () Bool)

(assert (=> b!1040380 m!959975))

(declare-fun m!959977 () Bool)

(assert (=> b!1040380 m!959977))

(assert (=> b!1040380 m!959971))

(declare-fun m!959979 () Bool)

(assert (=> b!1040380 m!959979))

(assert (=> b!1040330 d!125639))

(declare-fun d!125641 () Bool)

(declare-fun lt!458535 () (_ BitVec 32))

(assert (=> d!125641 (and (bvsge lt!458535 #b00000000000000000000000000000000) (bvsle lt!458535 (bvsub (size!32094 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589019 () (_ BitVec 32))

(assert (=> d!125641 (= lt!458535 e!589019)))

(declare-fun c!105475 () Bool)

(assert (=> d!125641 (= c!105475 (bvsge #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))))))

(assert (=> d!125641 (and (bvsle #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32094 (_keys!11560 thiss!1427)) (size!32094 (_keys!11560 thiss!1427))))))

(assert (=> d!125641 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) lt!458535)))

(declare-fun b!1040389 () Bool)

(declare-fun e!589018 () (_ BitVec 32))

(declare-fun call!44051 () (_ BitVec 32))

(assert (=> b!1040389 (= e!589018 call!44051)))

(declare-fun b!1040390 () Bool)

(assert (=> b!1040390 (= e!589019 #b00000000000000000000000000000000)))

(declare-fun b!1040391 () Bool)

(assert (=> b!1040391 (= e!589018 (bvadd #b00000000000000000000000000000001 call!44051))))

(declare-fun b!1040392 () Bool)

(assert (=> b!1040392 (= e!589019 e!589018)))

(declare-fun c!105474 () Bool)

(assert (=> b!1040392 (= c!105474 (validKeyInArray!0 (select (arr!31563 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44048 () Bool)

(assert (=> bm!44048 (= call!44051 (arrayCountValidKeys!0 (_keys!11560 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32094 (_keys!11560 thiss!1427))))))

(assert (= (and d!125641 c!105475) b!1040390))

(assert (= (and d!125641 (not c!105475)) b!1040392))

(assert (= (and b!1040392 c!105474) b!1040391))

(assert (= (and b!1040392 (not c!105474)) b!1040389))

(assert (= (or b!1040391 b!1040389) bm!44048))

(declare-fun m!959981 () Bool)

(assert (=> b!1040392 m!959981))

(assert (=> b!1040392 m!959981))

(declare-fun m!959983 () Bool)

(assert (=> b!1040392 m!959983))

(declare-fun m!959985 () Bool)

(assert (=> bm!44048 m!959985))

(assert (=> b!1040330 d!125641))

(declare-fun d!125643 () Bool)

(declare-fun lt!458536 () (_ BitVec 32))

(assert (=> d!125643 (and (bvsge lt!458536 #b00000000000000000000000000000000) (bvsle lt!458536 (bvsub (size!32094 lt!458502) #b00000000000000000000000000000000)))))

(declare-fun e!589021 () (_ BitVec 32))

(assert (=> d!125643 (= lt!458536 e!589021)))

(declare-fun c!105477 () Bool)

(assert (=> d!125643 (= c!105477 (bvsge #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))))))

(assert (=> d!125643 (and (bvsle #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32094 (_keys!11560 thiss!1427)) (size!32094 lt!458502)))))

(assert (=> d!125643 (= (arrayCountValidKeys!0 lt!458502 #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) lt!458536)))

(declare-fun b!1040393 () Bool)

(declare-fun e!589020 () (_ BitVec 32))

(declare-fun call!44052 () (_ BitVec 32))

(assert (=> b!1040393 (= e!589020 call!44052)))

(declare-fun b!1040394 () Bool)

(assert (=> b!1040394 (= e!589021 #b00000000000000000000000000000000)))

(declare-fun b!1040395 () Bool)

(assert (=> b!1040395 (= e!589020 (bvadd #b00000000000000000000000000000001 call!44052))))

(declare-fun b!1040396 () Bool)

(assert (=> b!1040396 (= e!589021 e!589020)))

(declare-fun c!105476 () Bool)

(assert (=> b!1040396 (= c!105476 (validKeyInArray!0 (select (arr!31563 lt!458502) #b00000000000000000000000000000000)))))

(declare-fun bm!44049 () Bool)

(assert (=> bm!44049 (= call!44052 (arrayCountValidKeys!0 lt!458502 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32094 (_keys!11560 thiss!1427))))))

(assert (= (and d!125643 c!105477) b!1040394))

(assert (= (and d!125643 (not c!105477)) b!1040396))

(assert (= (and b!1040396 c!105476) b!1040395))

(assert (= (and b!1040396 (not c!105476)) b!1040393))

(assert (= (or b!1040395 b!1040393) bm!44049))

(assert (=> b!1040396 m!959971))

(assert (=> b!1040396 m!959971))

(assert (=> b!1040396 m!959973))

(declare-fun m!959987 () Bool)

(assert (=> bm!44049 m!959987))

(assert (=> b!1040330 d!125643))

(declare-fun b!1040407 () Bool)

(declare-fun e!589030 () Bool)

(declare-fun contains!6049 (List!21957 (_ BitVec 64)) Bool)

(assert (=> b!1040407 (= e!589030 (contains!6049 Nil!21954 (select (arr!31563 lt!458502) #b00000000000000000000000000000000)))))

(declare-fun b!1040408 () Bool)

(declare-fun e!589031 () Bool)

(declare-fun call!44055 () Bool)

(assert (=> b!1040408 (= e!589031 call!44055)))

(declare-fun d!125645 () Bool)

(declare-fun res!693641 () Bool)

(declare-fun e!589033 () Bool)

(assert (=> d!125645 (=> res!693641 e!589033)))

(assert (=> d!125645 (= res!693641 (bvsge #b00000000000000000000000000000000 (size!32094 lt!458502)))))

(assert (=> d!125645 (= (arrayNoDuplicates!0 lt!458502 #b00000000000000000000000000000000 Nil!21954) e!589033)))

(declare-fun b!1040409 () Bool)

(assert (=> b!1040409 (= e!589031 call!44055)))

(declare-fun b!1040410 () Bool)

(declare-fun e!589032 () Bool)

(assert (=> b!1040410 (= e!589033 e!589032)))

(declare-fun res!693642 () Bool)

(assert (=> b!1040410 (=> (not res!693642) (not e!589032))))

(assert (=> b!1040410 (= res!693642 (not e!589030))))

(declare-fun res!693643 () Bool)

(assert (=> b!1040410 (=> (not res!693643) (not e!589030))))

(assert (=> b!1040410 (= res!693643 (validKeyInArray!0 (select (arr!31563 lt!458502) #b00000000000000000000000000000000)))))

(declare-fun bm!44052 () Bool)

(declare-fun c!105480 () Bool)

(assert (=> bm!44052 (= call!44055 (arrayNoDuplicates!0 lt!458502 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105480 (Cons!21953 (select (arr!31563 lt!458502) #b00000000000000000000000000000000) Nil!21954) Nil!21954)))))

(declare-fun b!1040411 () Bool)

(assert (=> b!1040411 (= e!589032 e!589031)))

(assert (=> b!1040411 (= c!105480 (validKeyInArray!0 (select (arr!31563 lt!458502) #b00000000000000000000000000000000)))))

(assert (= (and d!125645 (not res!693641)) b!1040410))

(assert (= (and b!1040410 res!693643) b!1040407))

(assert (= (and b!1040410 res!693642) b!1040411))

(assert (= (and b!1040411 c!105480) b!1040408))

(assert (= (and b!1040411 (not c!105480)) b!1040409))

(assert (= (or b!1040408 b!1040409) bm!44052))

(assert (=> b!1040407 m!959971))

(assert (=> b!1040407 m!959971))

(declare-fun m!959989 () Bool)

(assert (=> b!1040407 m!959989))

(assert (=> b!1040410 m!959971))

(assert (=> b!1040410 m!959971))

(assert (=> b!1040410 m!959973))

(assert (=> bm!44052 m!959971))

(declare-fun m!959991 () Bool)

(assert (=> bm!44052 m!959991))

(assert (=> b!1040411 m!959971))

(assert (=> b!1040411 m!959971))

(assert (=> b!1040411 m!959973))

(assert (=> b!1040330 d!125645))

(declare-fun b!1040422 () Bool)

(declare-fun e!589039 () Bool)

(assert (=> b!1040422 (= e!589039 (bvslt (size!32094 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040421 () Bool)

(declare-fun res!693654 () Bool)

(assert (=> b!1040421 (=> (not res!693654) (not e!589039))))

(assert (=> b!1040421 (= res!693654 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040423 () Bool)

(declare-fun e!589038 () Bool)

(assert (=> b!1040423 (= e!589038 (= (arrayCountValidKeys!0 (array!65595 (store (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32094 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125647 () Bool)

(assert (=> d!125647 e!589038))

(declare-fun res!693655 () Bool)

(assert (=> d!125647 (=> (not res!693655) (not e!589038))))

(assert (=> d!125647 (= res!693655 (and (bvsge (index!41552 lt!458505) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458505) (size!32094 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458539 () Unit!34013)

(declare-fun choose!82 (array!65594 (_ BitVec 32) (_ BitVec 64)) Unit!34013)

(assert (=> d!125647 (= lt!458539 (choose!82 (_keys!11560 thiss!1427) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125647 e!589039))

(declare-fun res!693653 () Bool)

(assert (=> d!125647 (=> (not res!693653) (not e!589039))))

(assert (=> d!125647 (= res!693653 (and (bvsge (index!41552 lt!458505) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458505) (size!32094 (_keys!11560 thiss!1427)))))))

(assert (=> d!125647 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11560 thiss!1427) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458539)))

(declare-fun b!1040420 () Bool)

(declare-fun res!693652 () Bool)

(assert (=> b!1040420 (=> (not res!693652) (not e!589039))))

(assert (=> b!1040420 (= res!693652 (validKeyInArray!0 (select (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458505))))))

(assert (= (and d!125647 res!693653) b!1040420))

(assert (= (and b!1040420 res!693652) b!1040421))

(assert (= (and b!1040421 res!693654) b!1040422))

(assert (= (and d!125647 res!693655) b!1040423))

(declare-fun m!959993 () Bool)

(assert (=> b!1040421 m!959993))

(assert (=> b!1040423 m!959915))

(declare-fun m!959995 () Bool)

(assert (=> b!1040423 m!959995))

(assert (=> b!1040423 m!959913))

(declare-fun m!959997 () Bool)

(assert (=> d!125647 m!959997))

(declare-fun m!959999 () Bool)

(assert (=> b!1040420 m!959999))

(assert (=> b!1040420 m!959999))

(declare-fun m!960001 () Bool)

(assert (=> b!1040420 m!960001))

(assert (=> b!1040330 d!125647))

(declare-fun d!125649 () Bool)

(declare-fun e!589042 () Bool)

(assert (=> d!125649 e!589042))

(declare-fun res!693658 () Bool)

(assert (=> d!125649 (=> (not res!693658) (not e!589042))))

(assert (=> d!125649 (= res!693658 (and (bvsge (index!41552 lt!458505) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458505) (size!32094 (_keys!11560 thiss!1427)))))))

(declare-fun lt!458542 () Unit!34013)

(declare-fun choose!53 (array!65594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21957) Unit!34013)

(assert (=> d!125649 (= lt!458542 (choose!53 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458505) #b00000000000000000000000000000000 Nil!21954))))

(assert (=> d!125649 (bvslt (size!32094 (_keys!11560 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125649 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11560 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!458505) #b00000000000000000000000000000000 Nil!21954) lt!458542)))

(declare-fun b!1040426 () Bool)

(assert (=> b!1040426 (= e!589042 (arrayNoDuplicates!0 (array!65595 (store (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458505) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32094 (_keys!11560 thiss!1427))) #b00000000000000000000000000000000 Nil!21954))))

(assert (= (and d!125649 res!693658) b!1040426))

(declare-fun m!960003 () Bool)

(assert (=> d!125649 m!960003))

(assert (=> b!1040426 m!959915))

(declare-fun m!960005 () Bool)

(assert (=> b!1040426 m!960005))

(assert (=> b!1040330 d!125649))

(declare-fun d!125651 () Bool)

(declare-fun res!693665 () Bool)

(declare-fun e!589045 () Bool)

(assert (=> d!125651 (=> (not res!693665) (not e!589045))))

(declare-fun simpleValid!433 (LongMapFixedSize!5916) Bool)

(assert (=> d!125651 (= res!693665 (simpleValid!433 thiss!1427))))

(assert (=> d!125651 (= (valid!2221 thiss!1427) e!589045)))

(declare-fun b!1040433 () Bool)

(declare-fun res!693666 () Bool)

(assert (=> b!1040433 (=> (not res!693666) (not e!589045))))

(assert (=> b!1040433 (= res!693666 (= (arrayCountValidKeys!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))) (_size!3013 thiss!1427)))))

(declare-fun b!1040434 () Bool)

(declare-fun res!693667 () Bool)

(assert (=> b!1040434 (=> (not res!693667) (not e!589045))))

(assert (=> b!1040434 (= res!693667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11560 thiss!1427) (mask!30331 thiss!1427)))))

(declare-fun b!1040435 () Bool)

(assert (=> b!1040435 (= e!589045 (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21954))))

(assert (= (and d!125651 res!693665) b!1040433))

(assert (= (and b!1040433 res!693666) b!1040434))

(assert (= (and b!1040434 res!693667) b!1040435))

(declare-fun m!960007 () Bool)

(assert (=> d!125651 m!960007))

(assert (=> b!1040433 m!959913))

(declare-fun m!960009 () Bool)

(assert (=> b!1040434 m!960009))

(assert (=> b!1040435 m!959929))

(assert (=> start!91142 d!125651))

(declare-fun d!125653 () Bool)

(declare-fun lt!458552 () SeekEntryResult!9795)

(assert (=> d!125653 (and (or ((_ is MissingVacant!9795) lt!458552) (not ((_ is Found!9795) lt!458552)) (and (bvsge (index!41552 lt!458552) #b00000000000000000000000000000000) (bvslt (index!41552 lt!458552) (size!32094 (_keys!11560 thiss!1427))))) (not ((_ is MissingVacant!9795) lt!458552)) (or (not ((_ is Found!9795) lt!458552)) (= (select (arr!31563 (_keys!11560 thiss!1427)) (index!41552 lt!458552)) key!909)))))

(declare-fun e!589053 () SeekEntryResult!9795)

(assert (=> d!125653 (= lt!458552 e!589053)))

(declare-fun c!105487 () Bool)

(declare-fun lt!458554 () SeekEntryResult!9795)

(assert (=> d!125653 (= c!105487 (and ((_ is Intermediate!9795) lt!458554) (undefined!10607 lt!458554)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65594 (_ BitVec 32)) SeekEntryResult!9795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125653 (= lt!458554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30331 thiss!1427)) key!909 (_keys!11560 thiss!1427) (mask!30331 thiss!1427)))))

(assert (=> d!125653 (validMask!0 (mask!30331 thiss!1427))))

(assert (=> d!125653 (= (seekEntry!0 key!909 (_keys!11560 thiss!1427) (mask!30331 thiss!1427)) lt!458552)))

(declare-fun b!1040448 () Bool)

(declare-fun e!589052 () SeekEntryResult!9795)

(declare-fun lt!458553 () SeekEntryResult!9795)

(assert (=> b!1040448 (= e!589052 (ite ((_ is MissingVacant!9795) lt!458553) (MissingZero!9795 (index!41554 lt!458553)) lt!458553))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65594 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1040448 (= lt!458553 (seekKeyOrZeroReturnVacant!0 (x!92867 lt!458554) (index!41553 lt!458554) (index!41553 lt!458554) key!909 (_keys!11560 thiss!1427) (mask!30331 thiss!1427)))))

(declare-fun b!1040449 () Bool)

(declare-fun e!589054 () SeekEntryResult!9795)

(assert (=> b!1040449 (= e!589054 (Found!9795 (index!41553 lt!458554)))))

(declare-fun b!1040450 () Bool)

(assert (=> b!1040450 (= e!589052 (MissingZero!9795 (index!41553 lt!458554)))))

(declare-fun b!1040451 () Bool)

(assert (=> b!1040451 (= e!589053 e!589054)))

(declare-fun lt!458551 () (_ BitVec 64))

(assert (=> b!1040451 (= lt!458551 (select (arr!31563 (_keys!11560 thiss!1427)) (index!41553 lt!458554)))))

(declare-fun c!105489 () Bool)

(assert (=> b!1040451 (= c!105489 (= lt!458551 key!909))))

(declare-fun b!1040452 () Bool)

(declare-fun c!105488 () Bool)

(assert (=> b!1040452 (= c!105488 (= lt!458551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040452 (= e!589054 e!589052)))

(declare-fun b!1040453 () Bool)

(assert (=> b!1040453 (= e!589053 Undefined!9795)))

(assert (= (and d!125653 c!105487) b!1040453))

(assert (= (and d!125653 (not c!105487)) b!1040451))

(assert (= (and b!1040451 c!105489) b!1040449))

(assert (= (and b!1040451 (not c!105489)) b!1040452))

(assert (= (and b!1040452 c!105488) b!1040450))

(assert (= (and b!1040452 (not c!105488)) b!1040448))

(declare-fun m!960011 () Bool)

(assert (=> d!125653 m!960011))

(declare-fun m!960013 () Bool)

(assert (=> d!125653 m!960013))

(assert (=> d!125653 m!960013))

(declare-fun m!960015 () Bool)

(assert (=> d!125653 m!960015))

(assert (=> d!125653 m!959965))

(declare-fun m!960017 () Bool)

(assert (=> b!1040448 m!960017))

(declare-fun m!960019 () Bool)

(assert (=> b!1040451 m!960019))

(assert (=> b!1040332 d!125653))

(declare-fun b!1040454 () Bool)

(declare-fun e!589055 () Bool)

(assert (=> b!1040454 (= e!589055 (contains!6049 Nil!21954 (select (arr!31563 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040455 () Bool)

(declare-fun e!589056 () Bool)

(declare-fun call!44056 () Bool)

(assert (=> b!1040455 (= e!589056 call!44056)))

(declare-fun d!125655 () Bool)

(declare-fun res!693668 () Bool)

(declare-fun e!589058 () Bool)

(assert (=> d!125655 (=> res!693668 e!589058)))

(assert (=> d!125655 (= res!693668 (bvsge #b00000000000000000000000000000000 (size!32094 (_keys!11560 thiss!1427))))))

(assert (=> d!125655 (= (arrayNoDuplicates!0 (_keys!11560 thiss!1427) #b00000000000000000000000000000000 Nil!21954) e!589058)))

(declare-fun b!1040456 () Bool)

(assert (=> b!1040456 (= e!589056 call!44056)))

(declare-fun b!1040457 () Bool)

(declare-fun e!589057 () Bool)

(assert (=> b!1040457 (= e!589058 e!589057)))

(declare-fun res!693669 () Bool)

(assert (=> b!1040457 (=> (not res!693669) (not e!589057))))

(assert (=> b!1040457 (= res!693669 (not e!589055))))

(declare-fun res!693670 () Bool)

(assert (=> b!1040457 (=> (not res!693670) (not e!589055))))

(assert (=> b!1040457 (= res!693670 (validKeyInArray!0 (select (arr!31563 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44053 () Bool)

(declare-fun c!105490 () Bool)

(assert (=> bm!44053 (= call!44056 (arrayNoDuplicates!0 (_keys!11560 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105490 (Cons!21953 (select (arr!31563 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000) Nil!21954) Nil!21954)))))

(declare-fun b!1040458 () Bool)

(assert (=> b!1040458 (= e!589057 e!589056)))

(assert (=> b!1040458 (= c!105490 (validKeyInArray!0 (select (arr!31563 (_keys!11560 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125655 (not res!693668)) b!1040457))

(assert (= (and b!1040457 res!693670) b!1040454))

(assert (= (and b!1040457 res!693669) b!1040458))

(assert (= (and b!1040458 c!105490) b!1040455))

(assert (= (and b!1040458 (not c!105490)) b!1040456))

(assert (= (or b!1040455 b!1040456) bm!44053))

(assert (=> b!1040454 m!959981))

(assert (=> b!1040454 m!959981))

(declare-fun m!960021 () Bool)

(assert (=> b!1040454 m!960021))

(assert (=> b!1040457 m!959981))

(assert (=> b!1040457 m!959981))

(assert (=> b!1040457 m!959983))

(assert (=> bm!44053 m!959981))

(declare-fun m!960023 () Bool)

(assert (=> bm!44053 m!960023))

(assert (=> b!1040458 m!959981))

(assert (=> b!1040458 m!959981))

(assert (=> b!1040458 m!959983))

(assert (=> b!1040336 d!125655))

(declare-fun d!125657 () Bool)

(assert (=> d!125657 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040333 d!125657))

(declare-fun b!1040465 () Bool)

(declare-fun e!589063 () Bool)

(assert (=> b!1040465 (= e!589063 tp_is_empty!24729)))

(declare-fun condMapEmpty!38677 () Bool)

(declare-fun mapDefault!38677 () ValueCell!11661)

(assert (=> mapNonEmpty!38671 (= condMapEmpty!38677 (= mapRest!38671 ((as const (Array (_ BitVec 32) ValueCell!11661)) mapDefault!38677)))))

(declare-fun e!589064 () Bool)

(declare-fun mapRes!38677 () Bool)

(assert (=> mapNonEmpty!38671 (= tp!74221 (and e!589064 mapRes!38677))))

(declare-fun b!1040466 () Bool)

(assert (=> b!1040466 (= e!589064 tp_is_empty!24729)))

(declare-fun mapIsEmpty!38677 () Bool)

(assert (=> mapIsEmpty!38677 mapRes!38677))

(declare-fun mapNonEmpty!38677 () Bool)

(declare-fun tp!74231 () Bool)

(assert (=> mapNonEmpty!38677 (= mapRes!38677 (and tp!74231 e!589063))))

(declare-fun mapRest!38677 () (Array (_ BitVec 32) ValueCell!11661))

(declare-fun mapKey!38677 () (_ BitVec 32))

(declare-fun mapValue!38677 () ValueCell!11661)

(assert (=> mapNonEmpty!38677 (= mapRest!38671 (store mapRest!38677 mapKey!38677 mapValue!38677))))

(assert (= (and mapNonEmpty!38671 condMapEmpty!38677) mapIsEmpty!38677))

(assert (= (and mapNonEmpty!38671 (not condMapEmpty!38677)) mapNonEmpty!38677))

(assert (= (and mapNonEmpty!38677 ((_ is ValueCellFull!11661) mapValue!38677)) b!1040465))

(assert (= (and mapNonEmpty!38671 ((_ is ValueCellFull!11661) mapDefault!38677)) b!1040466))

(declare-fun m!960025 () Bool)

(assert (=> mapNonEmpty!38677 m!960025))

(check-sat (not b!1040433) (not b!1040411) (not b!1040392) (not b_next!21009) (not b!1040448) (not b!1040423) (not bm!44049) (not bm!44045) (not b!1040410) (not d!125651) (not b!1040435) (not b!1040421) (not b!1040368) (not d!125647) (not d!125649) (not b!1040396) (not b!1040454) (not b!1040458) (not mapNonEmpty!38677) (not bm!44053) (not b!1040434) (not b!1040420) (not b!1040379) (not b!1040426) (not b!1040380) (not d!125653) b_and!33541 (not d!125637) (not bm!44048) (not b!1040407) (not b!1040457) tp_is_empty!24729 (not bm!44052))
(check-sat b_and!33541 (not b_next!21009))
