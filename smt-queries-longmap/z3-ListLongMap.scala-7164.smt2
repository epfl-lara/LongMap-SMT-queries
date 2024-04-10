; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91342 () Bool)

(assert start!91342)

(declare-fun b!1041480 () Bool)

(declare-fun b_free!21039 () Bool)

(declare-fun b_next!21039 () Bool)

(assert (=> b!1041480 (= b_free!21039 (not b_next!21039))))

(declare-fun tp!74328 () Bool)

(declare-fun b_and!33571 () Bool)

(assert (=> b!1041480 (= tp!74328 b_and!33571)))

(declare-fun b!1041476 () Bool)

(declare-fun e!589805 () Bool)

(declare-fun e!589809 () Bool)

(assert (=> b!1041476 (= e!589805 (not e!589809))))

(declare-fun res!694143 () Bool)

(assert (=> b!1041476 (=> res!694143 e!589809)))

(declare-datatypes ((V!37885 0))(
  ( (V!37886 (val!12430 Int)) )
))
(declare-datatypes ((ValueCell!11676 0))(
  ( (ValueCellFull!11676 (v!15019 V!37885)) (EmptyCell!11676) )
))
(declare-datatypes ((array!65664 0))(
  ( (array!65665 (arr!31593 (Array (_ BitVec 32) (_ BitVec 64))) (size!32126 (_ BitVec 32))) )
))
(declare-datatypes ((array!65666 0))(
  ( (array!65667 (arr!31594 (Array (_ BitVec 32) ValueCell!11676)) (size!32127 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5946 0))(
  ( (LongMapFixedSize!5947 (defaultEntry!6355 Int) (mask!30384 (_ BitVec 32)) (extraKeys!6083 (_ BitVec 32)) (zeroValue!6189 V!37885) (minValue!6189 V!37885) (_size!3028 (_ BitVec 32)) (_keys!11591 array!65664) (_values!6378 array!65666) (_vacant!3028 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5946)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041476 (= res!694143 (not (validMask!0 (mask!30384 thiss!1427))))))

(declare-fun lt!459027 () array!65664)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041476 (not (arrayContainsKey!0 lt!459027 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9807 0))(
  ( (MissingZero!9807 (index!41599 (_ BitVec 32))) (Found!9807 (index!41600 (_ BitVec 32))) (Intermediate!9807 (undefined!10619 Bool) (index!41601 (_ BitVec 32)) (x!92977 (_ BitVec 32))) (Undefined!9807) (MissingVacant!9807 (index!41602 (_ BitVec 32))) )
))
(declare-fun lt!459030 () SeekEntryResult!9807)

(declare-datatypes ((Unit!34033 0))(
  ( (Unit!34034) )
))
(declare-fun lt!459028 () Unit!34033)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65664 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> b!1041476 (= lt!459028 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65664 (_ BitVec 32)) Bool)

(assert (=> b!1041476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459027 (mask!30384 thiss!1427))))

(declare-fun lt!459031 () Unit!34033)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65664 (_ BitVec 32) (_ BitVec 32)) Unit!34033)

(assert (=> b!1041476 (= lt!459031 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) (mask!30384 thiss!1427)))))

(declare-datatypes ((List!21968 0))(
  ( (Nil!21965) (Cons!21964 (h!23170 (_ BitVec 64)) (t!31182 List!21968)) )
))
(declare-fun arrayNoDuplicates!0 (array!65664 (_ BitVec 32) List!21968) Bool)

(assert (=> b!1041476 (arrayNoDuplicates!0 lt!459027 #b00000000000000000000000000000000 Nil!21965)))

(declare-fun lt!459029 () Unit!34033)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21968) Unit!34033)

(assert (=> b!1041476 (= lt!459029 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!459030) #b00000000000000000000000000000000 Nil!21965))))

(declare-fun arrayCountValidKeys!0 (array!65664 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041476 (= (arrayCountValidKeys!0 lt!459027 #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041476 (= lt!459027 (array!65665 (store (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32126 (_keys!11591 thiss!1427))))))

(declare-fun lt!459032 () Unit!34033)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65664 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> b!1041476 (= lt!459032 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041477 () Bool)

(assert (=> b!1041477 (= e!589809 (or (not (= (size!32127 (_values!6378 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30384 thiss!1427)))) (not (= (size!32126 (_keys!11591 thiss!1427)) (size!32127 (_values!6378 thiss!1427)))) (bvsge (mask!30384 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1041478 () Bool)

(declare-fun e!589807 () Bool)

(declare-fun e!589806 () Bool)

(declare-fun mapRes!38733 () Bool)

(assert (=> b!1041478 (= e!589807 (and e!589806 mapRes!38733))))

(declare-fun condMapEmpty!38733 () Bool)

(declare-fun mapDefault!38733 () ValueCell!11676)

(assert (=> b!1041478 (= condMapEmpty!38733 (= (arr!31594 (_values!6378 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11676)) mapDefault!38733)))))

(declare-fun b!1041479 () Bool)

(declare-fun e!589810 () Bool)

(assert (=> b!1041479 (= e!589810 e!589805)))

(declare-fun res!694140 () Bool)

(assert (=> b!1041479 (=> (not res!694140) (not e!589805))))

(get-info :version)

(assert (=> b!1041479 (= res!694140 ((_ is Found!9807) lt!459030))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65664 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041479 (= lt!459030 (seekEntry!0 key!909 (_keys!11591 thiss!1427) (mask!30384 thiss!1427)))))

(declare-fun tp_is_empty!24759 () Bool)

(declare-fun e!589811 () Bool)

(declare-fun array_inv!24409 (array!65664) Bool)

(declare-fun array_inv!24410 (array!65666) Bool)

(assert (=> b!1041480 (= e!589811 (and tp!74328 tp_is_empty!24759 (array_inv!24409 (_keys!11591 thiss!1427)) (array_inv!24410 (_values!6378 thiss!1427)) e!589807))))

(declare-fun b!1041481 () Bool)

(declare-fun e!589808 () Bool)

(assert (=> b!1041481 (= e!589808 tp_is_empty!24759)))

(declare-fun b!1041482 () Bool)

(assert (=> b!1041482 (= e!589806 tp_is_empty!24759)))

(declare-fun mapNonEmpty!38733 () Bool)

(declare-fun tp!74329 () Bool)

(assert (=> mapNonEmpty!38733 (= mapRes!38733 (and tp!74329 e!589808))))

(declare-fun mapValue!38733 () ValueCell!11676)

(declare-fun mapRest!38733 () (Array (_ BitVec 32) ValueCell!11676))

(declare-fun mapKey!38733 () (_ BitVec 32))

(assert (=> mapNonEmpty!38733 (= (arr!31594 (_values!6378 thiss!1427)) (store mapRest!38733 mapKey!38733 mapValue!38733))))

(declare-fun res!694142 () Bool)

(assert (=> start!91342 (=> (not res!694142) (not e!589810))))

(declare-fun valid!2233 (LongMapFixedSize!5946) Bool)

(assert (=> start!91342 (= res!694142 (valid!2233 thiss!1427))))

(assert (=> start!91342 e!589810))

(assert (=> start!91342 e!589811))

(assert (=> start!91342 true))

(declare-fun mapIsEmpty!38733 () Bool)

(assert (=> mapIsEmpty!38733 mapRes!38733))

(declare-fun b!1041483 () Bool)

(declare-fun res!694141 () Bool)

(assert (=> b!1041483 (=> (not res!694141) (not e!589810))))

(assert (=> b!1041483 (= res!694141 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91342 res!694142) b!1041483))

(assert (= (and b!1041483 res!694141) b!1041479))

(assert (= (and b!1041479 res!694140) b!1041476))

(assert (= (and b!1041476 (not res!694143)) b!1041477))

(assert (= (and b!1041478 condMapEmpty!38733) mapIsEmpty!38733))

(assert (= (and b!1041478 (not condMapEmpty!38733)) mapNonEmpty!38733))

(assert (= (and mapNonEmpty!38733 ((_ is ValueCellFull!11676) mapValue!38733)) b!1041481))

(assert (= (and b!1041478 ((_ is ValueCellFull!11676) mapDefault!38733)) b!1041482))

(assert (= b!1041480 b!1041478))

(assert (= start!91342 b!1041480))

(declare-fun m!960907 () Bool)

(assert (=> b!1041476 m!960907))

(declare-fun m!960909 () Bool)

(assert (=> b!1041476 m!960909))

(declare-fun m!960911 () Bool)

(assert (=> b!1041476 m!960911))

(declare-fun m!960913 () Bool)

(assert (=> b!1041476 m!960913))

(declare-fun m!960915 () Bool)

(assert (=> b!1041476 m!960915))

(declare-fun m!960917 () Bool)

(assert (=> b!1041476 m!960917))

(declare-fun m!960919 () Bool)

(assert (=> b!1041476 m!960919))

(declare-fun m!960921 () Bool)

(assert (=> b!1041476 m!960921))

(declare-fun m!960923 () Bool)

(assert (=> b!1041476 m!960923))

(declare-fun m!960925 () Bool)

(assert (=> b!1041476 m!960925))

(declare-fun m!960927 () Bool)

(assert (=> b!1041476 m!960927))

(declare-fun m!960929 () Bool)

(assert (=> mapNonEmpty!38733 m!960929))

(declare-fun m!960931 () Bool)

(assert (=> b!1041480 m!960931))

(declare-fun m!960933 () Bool)

(assert (=> b!1041480 m!960933))

(declare-fun m!960935 () Bool)

(assert (=> b!1041479 m!960935))

(declare-fun m!960937 () Bool)

(assert (=> start!91342 m!960937))

(check-sat (not b!1041476) (not b!1041480) tp_is_empty!24759 b_and!33571 (not b_next!21039) (not start!91342) (not mapNonEmpty!38733) (not b!1041479))
(check-sat b_and!33571 (not b_next!21039))
(get-model)

(declare-fun d!125887 () Bool)

(declare-fun res!694162 () Bool)

(declare-fun e!589839 () Bool)

(assert (=> d!125887 (=> (not res!694162) (not e!589839))))

(declare-fun simpleValid!438 (LongMapFixedSize!5946) Bool)

(assert (=> d!125887 (= res!694162 (simpleValid!438 thiss!1427))))

(assert (=> d!125887 (= (valid!2233 thiss!1427) e!589839)))

(declare-fun b!1041514 () Bool)

(declare-fun res!694163 () Bool)

(assert (=> b!1041514 (=> (not res!694163) (not e!589839))))

(assert (=> b!1041514 (= res!694163 (= (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) (_size!3028 thiss!1427)))))

(declare-fun b!1041515 () Bool)

(declare-fun res!694164 () Bool)

(assert (=> b!1041515 (=> (not res!694164) (not e!589839))))

(assert (=> b!1041515 (= res!694164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11591 thiss!1427) (mask!30384 thiss!1427)))))

(declare-fun b!1041516 () Bool)

(assert (=> b!1041516 (= e!589839 (arrayNoDuplicates!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 Nil!21965))))

(assert (= (and d!125887 res!694162) b!1041514))

(assert (= (and b!1041514 res!694163) b!1041515))

(assert (= (and b!1041515 res!694164) b!1041516))

(declare-fun m!960971 () Bool)

(assert (=> d!125887 m!960971))

(assert (=> b!1041514 m!960925))

(declare-fun m!960973 () Bool)

(assert (=> b!1041515 m!960973))

(declare-fun m!960975 () Bool)

(assert (=> b!1041516 m!960975))

(assert (=> start!91342 d!125887))

(declare-fun d!125889 () Bool)

(declare-fun e!589842 () Bool)

(assert (=> d!125889 e!589842))

(declare-fun res!694167 () Bool)

(assert (=> d!125889 (=> (not res!694167) (not e!589842))))

(assert (=> d!125889 (= res!694167 (bvslt (index!41600 lt!459030) (size!32126 (_keys!11591 thiss!1427))))))

(declare-fun lt!459053 () Unit!34033)

(declare-fun choose!121 (array!65664 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> d!125889 (= lt!459053 (choose!121 (_keys!11591 thiss!1427) (index!41600 lt!459030) key!909))))

(assert (=> d!125889 (bvsge (index!41600 lt!459030) #b00000000000000000000000000000000)))

(assert (=> d!125889 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) key!909) lt!459053)))

(declare-fun b!1041519 () Bool)

(assert (=> b!1041519 (= e!589842 (not (arrayContainsKey!0 (array!65665 (store (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32126 (_keys!11591 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125889 res!694167) b!1041519))

(declare-fun m!960977 () Bool)

(assert (=> d!125889 m!960977))

(assert (=> b!1041519 m!960913))

(declare-fun m!960979 () Bool)

(assert (=> b!1041519 m!960979))

(assert (=> b!1041476 d!125889))

(declare-fun bm!44115 () Bool)

(declare-fun call!44118 () Bool)

(assert (=> bm!44115 (= call!44118 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459027 (mask!30384 thiss!1427)))))

(declare-fun b!1041528 () Bool)

(declare-fun e!589849 () Bool)

(assert (=> b!1041528 (= e!589849 call!44118)))

(declare-fun b!1041529 () Bool)

(declare-fun e!589850 () Bool)

(assert (=> b!1041529 (= e!589850 call!44118)))

(declare-fun d!125891 () Bool)

(declare-fun res!694172 () Bool)

(declare-fun e!589851 () Bool)

(assert (=> d!125891 (=> res!694172 e!589851)))

(assert (=> d!125891 (= res!694172 (bvsge #b00000000000000000000000000000000 (size!32126 lt!459027)))))

(assert (=> d!125891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459027 (mask!30384 thiss!1427)) e!589851)))

(declare-fun b!1041530 () Bool)

(assert (=> b!1041530 (= e!589849 e!589850)))

(declare-fun lt!459061 () (_ BitVec 64))

(assert (=> b!1041530 (= lt!459061 (select (arr!31593 lt!459027) #b00000000000000000000000000000000))))

(declare-fun lt!459062 () Unit!34033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65664 (_ BitVec 64) (_ BitVec 32)) Unit!34033)

(assert (=> b!1041530 (= lt!459062 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459027 lt!459061 #b00000000000000000000000000000000))))

(assert (=> b!1041530 (arrayContainsKey!0 lt!459027 lt!459061 #b00000000000000000000000000000000)))

(declare-fun lt!459060 () Unit!34033)

(assert (=> b!1041530 (= lt!459060 lt!459062)))

(declare-fun res!694173 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65664 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041530 (= res!694173 (= (seekEntryOrOpen!0 (select (arr!31593 lt!459027) #b00000000000000000000000000000000) lt!459027 (mask!30384 thiss!1427)) (Found!9807 #b00000000000000000000000000000000)))))

(assert (=> b!1041530 (=> (not res!694173) (not e!589850))))

(declare-fun b!1041531 () Bool)

(assert (=> b!1041531 (= e!589851 e!589849)))

(declare-fun c!105664 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041531 (= c!105664 (validKeyInArray!0 (select (arr!31593 lt!459027) #b00000000000000000000000000000000)))))

(assert (= (and d!125891 (not res!694172)) b!1041531))

(assert (= (and b!1041531 c!105664) b!1041530))

(assert (= (and b!1041531 (not c!105664)) b!1041528))

(assert (= (and b!1041530 res!694173) b!1041529))

(assert (= (or b!1041529 b!1041528) bm!44115))

(declare-fun m!960981 () Bool)

(assert (=> bm!44115 m!960981))

(declare-fun m!960983 () Bool)

(assert (=> b!1041530 m!960983))

(declare-fun m!960985 () Bool)

(assert (=> b!1041530 m!960985))

(declare-fun m!960987 () Bool)

(assert (=> b!1041530 m!960987))

(assert (=> b!1041530 m!960983))

(declare-fun m!960989 () Bool)

(assert (=> b!1041530 m!960989))

(assert (=> b!1041531 m!960983))

(assert (=> b!1041531 m!960983))

(declare-fun m!960991 () Bool)

(assert (=> b!1041531 m!960991))

(assert (=> b!1041476 d!125891))

(declare-fun d!125893 () Bool)

(declare-fun res!694178 () Bool)

(declare-fun e!589856 () Bool)

(assert (=> d!125893 (=> res!694178 e!589856)))

(assert (=> d!125893 (= res!694178 (= (select (arr!31593 lt!459027) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125893 (= (arrayContainsKey!0 lt!459027 key!909 #b00000000000000000000000000000000) e!589856)))

(declare-fun b!1041536 () Bool)

(declare-fun e!589857 () Bool)

(assert (=> b!1041536 (= e!589856 e!589857)))

(declare-fun res!694179 () Bool)

(assert (=> b!1041536 (=> (not res!694179) (not e!589857))))

(assert (=> b!1041536 (= res!694179 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32126 lt!459027)))))

(declare-fun b!1041537 () Bool)

(assert (=> b!1041537 (= e!589857 (arrayContainsKey!0 lt!459027 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125893 (not res!694178)) b!1041536))

(assert (= (and b!1041536 res!694179) b!1041537))

(assert (=> d!125893 m!960983))

(declare-fun m!960993 () Bool)

(assert (=> b!1041537 m!960993))

(assert (=> b!1041476 d!125893))

(declare-fun b!1041546 () Bool)

(declare-fun e!589862 () (_ BitVec 32))

(declare-fun e!589863 () (_ BitVec 32))

(assert (=> b!1041546 (= e!589862 e!589863)))

(declare-fun c!105669 () Bool)

(assert (=> b!1041546 (= c!105669 (validKeyInArray!0 (select (arr!31593 lt!459027) #b00000000000000000000000000000000)))))

(declare-fun bm!44118 () Bool)

(declare-fun call!44121 () (_ BitVec 32))

(assert (=> bm!44118 (= call!44121 (arrayCountValidKeys!0 lt!459027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32126 (_keys!11591 thiss!1427))))))

(declare-fun b!1041547 () Bool)

(assert (=> b!1041547 (= e!589863 (bvadd #b00000000000000000000000000000001 call!44121))))

(declare-fun b!1041548 () Bool)

(assert (=> b!1041548 (= e!589863 call!44121)))

(declare-fun d!125895 () Bool)

(declare-fun lt!459065 () (_ BitVec 32))

(assert (=> d!125895 (and (bvsge lt!459065 #b00000000000000000000000000000000) (bvsle lt!459065 (bvsub (size!32126 lt!459027) #b00000000000000000000000000000000)))))

(assert (=> d!125895 (= lt!459065 e!589862)))

(declare-fun c!105670 () Bool)

(assert (=> d!125895 (= c!105670 (bvsge #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))))))

(assert (=> d!125895 (and (bvsle #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32126 (_keys!11591 thiss!1427)) (size!32126 lt!459027)))))

(assert (=> d!125895 (= (arrayCountValidKeys!0 lt!459027 #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) lt!459065)))

(declare-fun b!1041549 () Bool)

(assert (=> b!1041549 (= e!589862 #b00000000000000000000000000000000)))

(assert (= (and d!125895 c!105670) b!1041549))

(assert (= (and d!125895 (not c!105670)) b!1041546))

(assert (= (and b!1041546 c!105669) b!1041547))

(assert (= (and b!1041546 (not c!105669)) b!1041548))

(assert (= (or b!1041547 b!1041548) bm!44118))

(assert (=> b!1041546 m!960983))

(assert (=> b!1041546 m!960983))

(assert (=> b!1041546 m!960991))

(declare-fun m!960995 () Bool)

(assert (=> bm!44118 m!960995))

(assert (=> b!1041476 d!125895))

(declare-fun d!125897 () Bool)

(declare-fun e!589866 () Bool)

(assert (=> d!125897 e!589866))

(declare-fun res!694182 () Bool)

(assert (=> d!125897 (=> (not res!694182) (not e!589866))))

(assert (=> d!125897 (= res!694182 (and (bvsge (index!41600 lt!459030) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459030) (size!32126 (_keys!11591 thiss!1427)))))))

(declare-fun lt!459068 () Unit!34033)

(declare-fun choose!25 (array!65664 (_ BitVec 32) (_ BitVec 32)) Unit!34033)

(assert (=> d!125897 (= lt!459068 (choose!25 (_keys!11591 thiss!1427) (index!41600 lt!459030) (mask!30384 thiss!1427)))))

(assert (=> d!125897 (validMask!0 (mask!30384 thiss!1427))))

(assert (=> d!125897 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) (mask!30384 thiss!1427)) lt!459068)))

(declare-fun b!1041552 () Bool)

(assert (=> b!1041552 (= e!589866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65665 (store (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32126 (_keys!11591 thiss!1427))) (mask!30384 thiss!1427)))))

(assert (= (and d!125897 res!694182) b!1041552))

(declare-fun m!960997 () Bool)

(assert (=> d!125897 m!960997))

(assert (=> d!125897 m!960911))

(assert (=> b!1041552 m!960913))

(declare-fun m!960999 () Bool)

(assert (=> b!1041552 m!960999))

(assert (=> b!1041476 d!125897))

(declare-fun d!125899 () Bool)

(declare-fun e!589869 () Bool)

(assert (=> d!125899 e!589869))

(declare-fun res!694185 () Bool)

(assert (=> d!125899 (=> (not res!694185) (not e!589869))))

(assert (=> d!125899 (= res!694185 (and (bvsge (index!41600 lt!459030) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459030) (size!32126 (_keys!11591 thiss!1427)))))))

(declare-fun lt!459071 () Unit!34033)

(declare-fun choose!53 (array!65664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21968) Unit!34033)

(assert (=> d!125899 (= lt!459071 (choose!53 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!459030) #b00000000000000000000000000000000 Nil!21965))))

(assert (=> d!125899 (bvslt (size!32126 (_keys!11591 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125899 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!459030) #b00000000000000000000000000000000 Nil!21965) lt!459071)))

(declare-fun b!1041555 () Bool)

(assert (=> b!1041555 (= e!589869 (arrayNoDuplicates!0 (array!65665 (store (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32126 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 Nil!21965))))

(assert (= (and d!125899 res!694185) b!1041555))

(declare-fun m!961001 () Bool)

(assert (=> d!125899 m!961001))

(assert (=> b!1041555 m!960913))

(declare-fun m!961003 () Bool)

(assert (=> b!1041555 m!961003))

(assert (=> b!1041476 d!125899))

(declare-fun d!125901 () Bool)

(assert (=> d!125901 (= (validMask!0 (mask!30384 thiss!1427)) (and (or (= (mask!30384 thiss!1427) #b00000000000000000000000000000111) (= (mask!30384 thiss!1427) #b00000000000000000000000000001111) (= (mask!30384 thiss!1427) #b00000000000000000000000000011111) (= (mask!30384 thiss!1427) #b00000000000000000000000000111111) (= (mask!30384 thiss!1427) #b00000000000000000000000001111111) (= (mask!30384 thiss!1427) #b00000000000000000000000011111111) (= (mask!30384 thiss!1427) #b00000000000000000000000111111111) (= (mask!30384 thiss!1427) #b00000000000000000000001111111111) (= (mask!30384 thiss!1427) #b00000000000000000000011111111111) (= (mask!30384 thiss!1427) #b00000000000000000000111111111111) (= (mask!30384 thiss!1427) #b00000000000000000001111111111111) (= (mask!30384 thiss!1427) #b00000000000000000011111111111111) (= (mask!30384 thiss!1427) #b00000000000000000111111111111111) (= (mask!30384 thiss!1427) #b00000000000000001111111111111111) (= (mask!30384 thiss!1427) #b00000000000000011111111111111111) (= (mask!30384 thiss!1427) #b00000000000000111111111111111111) (= (mask!30384 thiss!1427) #b00000000000001111111111111111111) (= (mask!30384 thiss!1427) #b00000000000011111111111111111111) (= (mask!30384 thiss!1427) #b00000000000111111111111111111111) (= (mask!30384 thiss!1427) #b00000000001111111111111111111111) (= (mask!30384 thiss!1427) #b00000000011111111111111111111111) (= (mask!30384 thiss!1427) #b00000000111111111111111111111111) (= (mask!30384 thiss!1427) #b00000001111111111111111111111111) (= (mask!30384 thiss!1427) #b00000011111111111111111111111111) (= (mask!30384 thiss!1427) #b00000111111111111111111111111111) (= (mask!30384 thiss!1427) #b00001111111111111111111111111111) (= (mask!30384 thiss!1427) #b00011111111111111111111111111111) (= (mask!30384 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30384 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041476 d!125901))

(declare-fun b!1041566 () Bool)

(declare-fun e!589878 () Bool)

(declare-fun contains!6054 (List!21968 (_ BitVec 64)) Bool)

(assert (=> b!1041566 (= e!589878 (contains!6054 Nil!21965 (select (arr!31593 lt!459027) #b00000000000000000000000000000000)))))

(declare-fun d!125903 () Bool)

(declare-fun res!694194 () Bool)

(declare-fun e!589880 () Bool)

(assert (=> d!125903 (=> res!694194 e!589880)))

(assert (=> d!125903 (= res!694194 (bvsge #b00000000000000000000000000000000 (size!32126 lt!459027)))))

(assert (=> d!125903 (= (arrayNoDuplicates!0 lt!459027 #b00000000000000000000000000000000 Nil!21965) e!589880)))

(declare-fun b!1041567 () Bool)

(declare-fun e!589881 () Bool)

(declare-fun call!44124 () Bool)

(assert (=> b!1041567 (= e!589881 call!44124)))

(declare-fun b!1041568 () Bool)

(assert (=> b!1041568 (= e!589881 call!44124)))

(declare-fun b!1041569 () Bool)

(declare-fun e!589879 () Bool)

(assert (=> b!1041569 (= e!589879 e!589881)))

(declare-fun c!105673 () Bool)

(assert (=> b!1041569 (= c!105673 (validKeyInArray!0 (select (arr!31593 lt!459027) #b00000000000000000000000000000000)))))

(declare-fun bm!44121 () Bool)

(assert (=> bm!44121 (= call!44124 (arrayNoDuplicates!0 lt!459027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105673 (Cons!21964 (select (arr!31593 lt!459027) #b00000000000000000000000000000000) Nil!21965) Nil!21965)))))

(declare-fun b!1041570 () Bool)

(assert (=> b!1041570 (= e!589880 e!589879)))

(declare-fun res!694193 () Bool)

(assert (=> b!1041570 (=> (not res!694193) (not e!589879))))

(assert (=> b!1041570 (= res!694193 (not e!589878))))

(declare-fun res!694192 () Bool)

(assert (=> b!1041570 (=> (not res!694192) (not e!589878))))

(assert (=> b!1041570 (= res!694192 (validKeyInArray!0 (select (arr!31593 lt!459027) #b00000000000000000000000000000000)))))

(assert (= (and d!125903 (not res!694194)) b!1041570))

(assert (= (and b!1041570 res!694192) b!1041566))

(assert (= (and b!1041570 res!694193) b!1041569))

(assert (= (and b!1041569 c!105673) b!1041567))

(assert (= (and b!1041569 (not c!105673)) b!1041568))

(assert (= (or b!1041567 b!1041568) bm!44121))

(assert (=> b!1041566 m!960983))

(assert (=> b!1041566 m!960983))

(declare-fun m!961005 () Bool)

(assert (=> b!1041566 m!961005))

(assert (=> b!1041569 m!960983))

(assert (=> b!1041569 m!960983))

(assert (=> b!1041569 m!960991))

(assert (=> bm!44121 m!960983))

(declare-fun m!961007 () Bool)

(assert (=> bm!44121 m!961007))

(assert (=> b!1041570 m!960983))

(assert (=> b!1041570 m!960983))

(assert (=> b!1041570 m!960991))

(assert (=> b!1041476 d!125903))

(declare-fun b!1041571 () Bool)

(declare-fun e!589882 () (_ BitVec 32))

(declare-fun e!589883 () (_ BitVec 32))

(assert (=> b!1041571 (= e!589882 e!589883)))

(declare-fun c!105674 () Bool)

(assert (=> b!1041571 (= c!105674 (validKeyInArray!0 (select (arr!31593 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44122 () Bool)

(declare-fun call!44125 () (_ BitVec 32))

(assert (=> bm!44122 (= call!44125 (arrayCountValidKeys!0 (_keys!11591 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32126 (_keys!11591 thiss!1427))))))

(declare-fun b!1041572 () Bool)

(assert (=> b!1041572 (= e!589883 (bvadd #b00000000000000000000000000000001 call!44125))))

(declare-fun b!1041573 () Bool)

(assert (=> b!1041573 (= e!589883 call!44125)))

(declare-fun d!125905 () Bool)

(declare-fun lt!459072 () (_ BitVec 32))

(assert (=> d!125905 (and (bvsge lt!459072 #b00000000000000000000000000000000) (bvsle lt!459072 (bvsub (size!32126 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125905 (= lt!459072 e!589882)))

(declare-fun c!105675 () Bool)

(assert (=> d!125905 (= c!105675 (bvsge #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))))))

(assert (=> d!125905 (and (bvsle #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32126 (_keys!11591 thiss!1427)) (size!32126 (_keys!11591 thiss!1427))))))

(assert (=> d!125905 (= (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) lt!459072)))

(declare-fun b!1041574 () Bool)

(assert (=> b!1041574 (= e!589882 #b00000000000000000000000000000000)))

(assert (= (and d!125905 c!105675) b!1041574))

(assert (= (and d!125905 (not c!105675)) b!1041571))

(assert (= (and b!1041571 c!105674) b!1041572))

(assert (= (and b!1041571 (not c!105674)) b!1041573))

(assert (= (or b!1041572 b!1041573) bm!44122))

(declare-fun m!961009 () Bool)

(assert (=> b!1041571 m!961009))

(assert (=> b!1041571 m!961009))

(declare-fun m!961011 () Bool)

(assert (=> b!1041571 m!961011))

(declare-fun m!961013 () Bool)

(assert (=> bm!44122 m!961013))

(assert (=> b!1041476 d!125905))

(declare-fun b!1041586 () Bool)

(declare-fun e!589888 () Bool)

(assert (=> b!1041586 (= e!589888 (= (arrayCountValidKeys!0 (array!65665 (store (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32126 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32126 (_keys!11591 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041584 () Bool)

(declare-fun res!694205 () Bool)

(declare-fun e!589889 () Bool)

(assert (=> b!1041584 (=> (not res!694205) (not e!589889))))

(assert (=> b!1041584 (= res!694205 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041585 () Bool)

(assert (=> b!1041585 (= e!589889 (bvslt (size!32126 (_keys!11591 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125907 () Bool)

(assert (=> d!125907 e!589888))

(declare-fun res!694206 () Bool)

(assert (=> d!125907 (=> (not res!694206) (not e!589888))))

(assert (=> d!125907 (= res!694206 (and (bvsge (index!41600 lt!459030) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459030) (size!32126 (_keys!11591 thiss!1427)))))))

(declare-fun lt!459075 () Unit!34033)

(declare-fun choose!82 (array!65664 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> d!125907 (= lt!459075 (choose!82 (_keys!11591 thiss!1427) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125907 e!589889))

(declare-fun res!694203 () Bool)

(assert (=> d!125907 (=> (not res!694203) (not e!589889))))

(assert (=> d!125907 (= res!694203 (and (bvsge (index!41600 lt!459030) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459030) (size!32126 (_keys!11591 thiss!1427)))))))

(assert (=> d!125907 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11591 thiss!1427) (index!41600 lt!459030) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459075)))

(declare-fun b!1041583 () Bool)

(declare-fun res!694204 () Bool)

(assert (=> b!1041583 (=> (not res!694204) (not e!589889))))

(assert (=> b!1041583 (= res!694204 (validKeyInArray!0 (select (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459030))))))

(assert (= (and d!125907 res!694203) b!1041583))

(assert (= (and b!1041583 res!694204) b!1041584))

(assert (= (and b!1041584 res!694205) b!1041585))

(assert (= (and d!125907 res!694206) b!1041586))

(assert (=> b!1041586 m!960913))

(declare-fun m!961015 () Bool)

(assert (=> b!1041586 m!961015))

(assert (=> b!1041586 m!960925))

(declare-fun m!961017 () Bool)

(assert (=> b!1041584 m!961017))

(declare-fun m!961019 () Bool)

(assert (=> d!125907 m!961019))

(declare-fun m!961021 () Bool)

(assert (=> b!1041583 m!961021))

(assert (=> b!1041583 m!961021))

(declare-fun m!961023 () Bool)

(assert (=> b!1041583 m!961023))

(assert (=> b!1041476 d!125907))

(declare-fun b!1041599 () Bool)

(declare-fun e!589897 () SeekEntryResult!9807)

(declare-fun lt!459085 () SeekEntryResult!9807)

(assert (=> b!1041599 (= e!589897 (MissingZero!9807 (index!41601 lt!459085)))))

(declare-fun b!1041600 () Bool)

(declare-fun e!589896 () SeekEntryResult!9807)

(declare-fun e!589898 () SeekEntryResult!9807)

(assert (=> b!1041600 (= e!589896 e!589898)))

(declare-fun lt!459087 () (_ BitVec 64))

(assert (=> b!1041600 (= lt!459087 (select (arr!31593 (_keys!11591 thiss!1427)) (index!41601 lt!459085)))))

(declare-fun c!105684 () Bool)

(assert (=> b!1041600 (= c!105684 (= lt!459087 key!909))))

(declare-fun b!1041601 () Bool)

(assert (=> b!1041601 (= e!589898 (Found!9807 (index!41601 lt!459085)))))

(declare-fun b!1041602 () Bool)

(declare-fun lt!459086 () SeekEntryResult!9807)

(assert (=> b!1041602 (= e!589897 (ite ((_ is MissingVacant!9807) lt!459086) (MissingZero!9807 (index!41602 lt!459086)) lt!459086))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65664 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041602 (= lt!459086 (seekKeyOrZeroReturnVacant!0 (x!92977 lt!459085) (index!41601 lt!459085) (index!41601 lt!459085) key!909 (_keys!11591 thiss!1427) (mask!30384 thiss!1427)))))

(declare-fun b!1041603 () Bool)

(declare-fun c!105683 () Bool)

(assert (=> b!1041603 (= c!105683 (= lt!459087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041603 (= e!589898 e!589897)))

(declare-fun b!1041604 () Bool)

(assert (=> b!1041604 (= e!589896 Undefined!9807)))

(declare-fun d!125909 () Bool)

(declare-fun lt!459084 () SeekEntryResult!9807)

(assert (=> d!125909 (and (or ((_ is MissingVacant!9807) lt!459084) (not ((_ is Found!9807) lt!459084)) (and (bvsge (index!41600 lt!459084) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459084) (size!32126 (_keys!11591 thiss!1427))))) (not ((_ is MissingVacant!9807) lt!459084)) (or (not ((_ is Found!9807) lt!459084)) (= (select (arr!31593 (_keys!11591 thiss!1427)) (index!41600 lt!459084)) key!909)))))

(assert (=> d!125909 (= lt!459084 e!589896)))

(declare-fun c!105682 () Bool)

(assert (=> d!125909 (= c!105682 (and ((_ is Intermediate!9807) lt!459085) (undefined!10619 lt!459085)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65664 (_ BitVec 32)) SeekEntryResult!9807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125909 (= lt!459085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30384 thiss!1427)) key!909 (_keys!11591 thiss!1427) (mask!30384 thiss!1427)))))

(assert (=> d!125909 (validMask!0 (mask!30384 thiss!1427))))

(assert (=> d!125909 (= (seekEntry!0 key!909 (_keys!11591 thiss!1427) (mask!30384 thiss!1427)) lt!459084)))

(assert (= (and d!125909 c!105682) b!1041604))

(assert (= (and d!125909 (not c!105682)) b!1041600))

(assert (= (and b!1041600 c!105684) b!1041601))

(assert (= (and b!1041600 (not c!105684)) b!1041603))

(assert (= (and b!1041603 c!105683) b!1041599))

(assert (= (and b!1041603 (not c!105683)) b!1041602))

(declare-fun m!961025 () Bool)

(assert (=> b!1041600 m!961025))

(declare-fun m!961027 () Bool)

(assert (=> b!1041602 m!961027))

(declare-fun m!961029 () Bool)

(assert (=> d!125909 m!961029))

(declare-fun m!961031 () Bool)

(assert (=> d!125909 m!961031))

(assert (=> d!125909 m!961031))

(declare-fun m!961033 () Bool)

(assert (=> d!125909 m!961033))

(assert (=> d!125909 m!960911))

(assert (=> b!1041479 d!125909))

(declare-fun d!125911 () Bool)

(assert (=> d!125911 (= (array_inv!24409 (_keys!11591 thiss!1427)) (bvsge (size!32126 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041480 d!125911))

(declare-fun d!125913 () Bool)

(assert (=> d!125913 (= (array_inv!24410 (_values!6378 thiss!1427)) (bvsge (size!32127 (_values!6378 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041480 d!125913))

(declare-fun mapNonEmpty!38739 () Bool)

(declare-fun mapRes!38739 () Bool)

(declare-fun tp!74338 () Bool)

(declare-fun e!589904 () Bool)

(assert (=> mapNonEmpty!38739 (= mapRes!38739 (and tp!74338 e!589904))))

(declare-fun mapRest!38739 () (Array (_ BitVec 32) ValueCell!11676))

(declare-fun mapValue!38739 () ValueCell!11676)

(declare-fun mapKey!38739 () (_ BitVec 32))

(assert (=> mapNonEmpty!38739 (= mapRest!38733 (store mapRest!38739 mapKey!38739 mapValue!38739))))

(declare-fun condMapEmpty!38739 () Bool)

(declare-fun mapDefault!38739 () ValueCell!11676)

(assert (=> mapNonEmpty!38733 (= condMapEmpty!38739 (= mapRest!38733 ((as const (Array (_ BitVec 32) ValueCell!11676)) mapDefault!38739)))))

(declare-fun e!589903 () Bool)

(assert (=> mapNonEmpty!38733 (= tp!74329 (and e!589903 mapRes!38739))))

(declare-fun b!1041611 () Bool)

(assert (=> b!1041611 (= e!589904 tp_is_empty!24759)))

(declare-fun b!1041612 () Bool)

(assert (=> b!1041612 (= e!589903 tp_is_empty!24759)))

(declare-fun mapIsEmpty!38739 () Bool)

(assert (=> mapIsEmpty!38739 mapRes!38739))

(assert (= (and mapNonEmpty!38733 condMapEmpty!38739) mapIsEmpty!38739))

(assert (= (and mapNonEmpty!38733 (not condMapEmpty!38739)) mapNonEmpty!38739))

(assert (= (and mapNonEmpty!38739 ((_ is ValueCellFull!11676) mapValue!38739)) b!1041611))

(assert (= (and mapNonEmpty!38733 ((_ is ValueCellFull!11676) mapDefault!38739)) b!1041612))

(declare-fun m!961035 () Bool)

(assert (=> mapNonEmpty!38739 m!961035))

(check-sat (not bm!44121) (not b!1041514) (not d!125899) (not d!125897) (not b!1041555) (not b!1041602) (not b!1041571) (not mapNonEmpty!38739) (not b!1041583) (not b!1041546) (not b!1041530) (not b!1041552) (not d!125909) (not bm!44122) tp_is_empty!24759 (not b!1041516) (not bm!44115) b_and!33571 (not d!125887) (not d!125889) (not b_next!21039) (not b!1041586) (not b!1041569) (not b!1041515) (not b!1041537) (not bm!44118) (not d!125907) (not b!1041519) (not b!1041531) (not b!1041584) (not b!1041570) (not b!1041566))
(check-sat b_and!33571 (not b_next!21039))
