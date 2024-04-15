; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90720 () Bool)

(assert start!90720)

(declare-fun b!1037224 () Bool)

(declare-fun b_free!20899 () Bool)

(declare-fun b_next!20899 () Bool)

(assert (=> b!1037224 (= b_free!20899 (not b_next!20899))))

(declare-fun tp!73843 () Bool)

(declare-fun b_and!33405 () Bool)

(assert (=> b!1037224 (= tp!73843 b_and!33405)))

(declare-fun mapIsEmpty!38457 () Bool)

(declare-fun mapRes!38457 () Bool)

(assert (=> mapIsEmpty!38457 mapRes!38457))

(declare-fun e!586714 () Bool)

(declare-fun tp_is_empty!24619 () Bool)

(declare-datatypes ((V!37699 0))(
  ( (V!37700 (val!12360 Int)) )
))
(declare-datatypes ((ValueCell!11606 0))(
  ( (ValueCellFull!11606 (v!14942 V!37699)) (EmptyCell!11606) )
))
(declare-datatypes ((array!65281 0))(
  ( (array!65282 (arr!31422 (Array (_ BitVec 32) (_ BitVec 64))) (size!31954 (_ BitVec 32))) )
))
(declare-datatypes ((array!65283 0))(
  ( (array!65284 (arr!31423 (Array (_ BitVec 32) ValueCell!11606)) (size!31955 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5806 0))(
  ( (LongMapFixedSize!5807 (defaultEntry!6285 Int) (mask!30199 (_ BitVec 32)) (extraKeys!6013 (_ BitVec 32)) (zeroValue!6119 V!37699) (minValue!6119 V!37699) (_size!2958 (_ BitVec 32)) (_keys!11477 array!65281) (_values!6308 array!65283) (_vacant!2958 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5806)

(declare-fun e!586713 () Bool)

(declare-fun array_inv!24301 (array!65281) Bool)

(declare-fun array_inv!24302 (array!65283) Bool)

(assert (=> b!1037224 (= e!586713 (and tp!73843 tp_is_empty!24619 (array_inv!24301 (_keys!11477 thiss!1427)) (array_inv!24302 (_values!6308 thiss!1427)) e!586714))))

(declare-fun res!692092 () Bool)

(declare-fun e!586718 () Bool)

(assert (=> start!90720 (=> (not res!692092) (not e!586718))))

(declare-fun valid!2180 (LongMapFixedSize!5806) Bool)

(assert (=> start!90720 (= res!692092 (valid!2180 thiss!1427))))

(assert (=> start!90720 e!586718))

(assert (=> start!90720 e!586713))

(assert (=> start!90720 true))

(declare-fun b!1037225 () Bool)

(declare-fun e!586716 () Bool)

(assert (=> b!1037225 (= e!586716 (not (or (bvsge (size!31954 (_keys!11477 thiss!1427)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))))))))

(declare-datatypes ((SeekEntryResult!9747 0))(
  ( (MissingZero!9747 (index!41359 (_ BitVec 32))) (Found!9747 (index!41360 (_ BitVec 32))) (Intermediate!9747 (undefined!10559 Bool) (index!41361 (_ BitVec 32)) (x!92535 (_ BitVec 32))) (Undefined!9747) (MissingVacant!9747 (index!41362 (_ BitVec 32))) )
))
(declare-fun lt!457275 () SeekEntryResult!9747)

(declare-fun arrayCountValidKeys!0 (array!65281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037225 (= (arrayCountValidKeys!0 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427))) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11477 thiss!1427) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33833 0))(
  ( (Unit!33834) )
))
(declare-fun lt!457274 () Unit!33833)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65281 (_ BitVec 32) (_ BitVec 64)) Unit!33833)

(assert (=> b!1037225 (= lt!457274 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11477 thiss!1427) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037226 () Bool)

(declare-fun e!586719 () Bool)

(assert (=> b!1037226 (= e!586719 tp_is_empty!24619)))

(declare-fun b!1037227 () Bool)

(assert (=> b!1037227 (= e!586714 (and e!586719 mapRes!38457))))

(declare-fun condMapEmpty!38457 () Bool)

(declare-fun mapDefault!38457 () ValueCell!11606)

(assert (=> b!1037227 (= condMapEmpty!38457 (= (arr!31423 (_values!6308 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11606)) mapDefault!38457)))))

(declare-fun b!1037228 () Bool)

(declare-fun e!586717 () Bool)

(assert (=> b!1037228 (= e!586717 tp_is_empty!24619)))

(declare-fun b!1037229 () Bool)

(assert (=> b!1037229 (= e!586718 e!586716)))

(declare-fun res!692093 () Bool)

(assert (=> b!1037229 (=> (not res!692093) (not e!586716))))

(get-info :version)

(assert (=> b!1037229 (= res!692093 ((_ is Found!9747) lt!457275))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65281 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1037229 (= lt!457275 (seekEntry!0 key!909 (_keys!11477 thiss!1427) (mask!30199 thiss!1427)))))

(declare-fun mapNonEmpty!38457 () Bool)

(declare-fun tp!73842 () Bool)

(assert (=> mapNonEmpty!38457 (= mapRes!38457 (and tp!73842 e!586717))))

(declare-fun mapRest!38457 () (Array (_ BitVec 32) ValueCell!11606))

(declare-fun mapValue!38457 () ValueCell!11606)

(declare-fun mapKey!38457 () (_ BitVec 32))

(assert (=> mapNonEmpty!38457 (= (arr!31423 (_values!6308 thiss!1427)) (store mapRest!38457 mapKey!38457 mapValue!38457))))

(declare-fun b!1037230 () Bool)

(declare-fun res!692091 () Bool)

(assert (=> b!1037230 (=> (not res!692091) (not e!586718))))

(assert (=> b!1037230 (= res!692091 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90720 res!692092) b!1037230))

(assert (= (and b!1037230 res!692091) b!1037229))

(assert (= (and b!1037229 res!692093) b!1037225))

(assert (= (and b!1037227 condMapEmpty!38457) mapIsEmpty!38457))

(assert (= (and b!1037227 (not condMapEmpty!38457)) mapNonEmpty!38457))

(assert (= (and mapNonEmpty!38457 ((_ is ValueCellFull!11606) mapValue!38457)) b!1037228))

(assert (= (and b!1037227 ((_ is ValueCellFull!11606) mapDefault!38457)) b!1037226))

(assert (= b!1037224 b!1037227))

(assert (= start!90720 b!1037224))

(declare-fun m!956981 () Bool)

(assert (=> mapNonEmpty!38457 m!956981))

(declare-fun m!956983 () Bool)

(assert (=> start!90720 m!956983))

(declare-fun m!956985 () Bool)

(assert (=> b!1037229 m!956985))

(declare-fun m!956987 () Bool)

(assert (=> b!1037225 m!956987))

(declare-fun m!956989 () Bool)

(assert (=> b!1037225 m!956989))

(declare-fun m!956991 () Bool)

(assert (=> b!1037225 m!956991))

(declare-fun m!956993 () Bool)

(assert (=> b!1037225 m!956993))

(declare-fun m!956995 () Bool)

(assert (=> b!1037224 m!956995))

(declare-fun m!956997 () Bool)

(assert (=> b!1037224 m!956997))

(check-sat (not start!90720) b_and!33405 (not b!1037224) tp_is_empty!24619 (not mapNonEmpty!38457) (not b_next!20899) (not b!1037229) (not b!1037225))
(check-sat b_and!33405 (not b_next!20899))
(get-model)

(declare-fun bm!43892 () Bool)

(declare-fun call!43895 () (_ BitVec 32))

(assert (=> bm!43892 (= call!43895 (arrayCountValidKeys!0 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31954 (_keys!11477 thiss!1427))))))

(declare-fun b!1037281 () Bool)

(declare-fun e!586766 () (_ BitVec 32))

(declare-fun e!586767 () (_ BitVec 32))

(assert (=> b!1037281 (= e!586766 e!586767)))

(declare-fun c!105074 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037281 (= c!105074 (validKeyInArray!0 (select (arr!31422 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1037282 () Bool)

(assert (=> b!1037282 (= e!586767 (bvadd #b00000000000000000000000000000001 call!43895))))

(declare-fun b!1037283 () Bool)

(assert (=> b!1037283 (= e!586766 #b00000000000000000000000000000000)))

(declare-fun b!1037284 () Bool)

(assert (=> b!1037284 (= e!586767 call!43895)))

(declare-fun d!125075 () Bool)

(declare-fun lt!457290 () (_ BitVec 32))

(assert (=> d!125075 (and (bvsge lt!457290 #b00000000000000000000000000000000) (bvsle lt!457290 (bvsub (size!31954 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125075 (= lt!457290 e!586766)))

(declare-fun c!105073 () Bool)

(assert (=> d!125075 (= c!105073 (bvsge #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))))))

(assert (=> d!125075 (and (bvsle #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31954 (_keys!11477 thiss!1427)) (size!31954 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427))))))))

(assert (=> d!125075 (= (arrayCountValidKeys!0 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427))) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) lt!457290)))

(assert (= (and d!125075 c!105073) b!1037283))

(assert (= (and d!125075 (not c!105073)) b!1037281))

(assert (= (and b!1037281 c!105074) b!1037282))

(assert (= (and b!1037281 (not c!105074)) b!1037284))

(assert (= (or b!1037282 b!1037284) bm!43892))

(declare-fun m!957035 () Bool)

(assert (=> bm!43892 m!957035))

(declare-fun m!957037 () Bool)

(assert (=> b!1037281 m!957037))

(assert (=> b!1037281 m!957037))

(declare-fun m!957039 () Bool)

(assert (=> b!1037281 m!957039))

(assert (=> b!1037225 d!125075))

(declare-fun bm!43893 () Bool)

(declare-fun call!43896 () (_ BitVec 32))

(assert (=> bm!43893 (= call!43896 (arrayCountValidKeys!0 (_keys!11477 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31954 (_keys!11477 thiss!1427))))))

(declare-fun b!1037285 () Bool)

(declare-fun e!586768 () (_ BitVec 32))

(declare-fun e!586769 () (_ BitVec 32))

(assert (=> b!1037285 (= e!586768 e!586769)))

(declare-fun c!105076 () Bool)

(assert (=> b!1037285 (= c!105076 (validKeyInArray!0 (select (arr!31422 (_keys!11477 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037286 () Bool)

(assert (=> b!1037286 (= e!586769 (bvadd #b00000000000000000000000000000001 call!43896))))

(declare-fun b!1037287 () Bool)

(assert (=> b!1037287 (= e!586768 #b00000000000000000000000000000000)))

(declare-fun b!1037288 () Bool)

(assert (=> b!1037288 (= e!586769 call!43896)))

(declare-fun d!125077 () Bool)

(declare-fun lt!457291 () (_ BitVec 32))

(assert (=> d!125077 (and (bvsge lt!457291 #b00000000000000000000000000000000) (bvsle lt!457291 (bvsub (size!31954 (_keys!11477 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125077 (= lt!457291 e!586768)))

(declare-fun c!105075 () Bool)

(assert (=> d!125077 (= c!105075 (bvsge #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))))))

(assert (=> d!125077 (and (bvsle #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31954 (_keys!11477 thiss!1427)) (size!31954 (_keys!11477 thiss!1427))))))

(assert (=> d!125077 (= (arrayCountValidKeys!0 (_keys!11477 thiss!1427) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) lt!457291)))

(assert (= (and d!125077 c!105075) b!1037287))

(assert (= (and d!125077 (not c!105075)) b!1037285))

(assert (= (and b!1037285 c!105076) b!1037286))

(assert (= (and b!1037285 (not c!105076)) b!1037288))

(assert (= (or b!1037286 b!1037288) bm!43893))

(declare-fun m!957041 () Bool)

(assert (=> bm!43893 m!957041))

(declare-fun m!957043 () Bool)

(assert (=> b!1037285 m!957043))

(assert (=> b!1037285 m!957043))

(declare-fun m!957045 () Bool)

(assert (=> b!1037285 m!957045))

(assert (=> b!1037225 d!125077))

(declare-fun b!1037299 () Bool)

(declare-fun e!586775 () Bool)

(assert (=> b!1037299 (= e!586775 (bvslt (size!31954 (_keys!11477 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1037300 () Bool)

(declare-fun e!586774 () Bool)

(assert (=> b!1037300 (= e!586774 (= (arrayCountValidKeys!0 (array!65282 (store (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31954 (_keys!11477 thiss!1427))) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11477 thiss!1427) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125079 () Bool)

(assert (=> d!125079 e!586774))

(declare-fun res!692120 () Bool)

(assert (=> d!125079 (=> (not res!692120) (not e!586774))))

(assert (=> d!125079 (= res!692120 (and (bvsge (index!41360 lt!457275) #b00000000000000000000000000000000) (bvslt (index!41360 lt!457275) (size!31954 (_keys!11477 thiss!1427)))))))

(declare-fun lt!457294 () Unit!33833)

(declare-fun choose!82 (array!65281 (_ BitVec 32) (_ BitVec 64)) Unit!33833)

(assert (=> d!125079 (= lt!457294 (choose!82 (_keys!11477 thiss!1427) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125079 e!586775))

(declare-fun res!692122 () Bool)

(assert (=> d!125079 (=> (not res!692122) (not e!586775))))

(assert (=> d!125079 (= res!692122 (and (bvsge (index!41360 lt!457275) #b00000000000000000000000000000000) (bvslt (index!41360 lt!457275) (size!31954 (_keys!11477 thiss!1427)))))))

(assert (=> d!125079 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11477 thiss!1427) (index!41360 lt!457275) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457294)))

(declare-fun b!1037297 () Bool)

(declare-fun res!692121 () Bool)

(assert (=> b!1037297 (=> (not res!692121) (not e!586775))))

(assert (=> b!1037297 (= res!692121 (validKeyInArray!0 (select (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457275))))))

(declare-fun b!1037298 () Bool)

(declare-fun res!692123 () Bool)

(assert (=> b!1037298 (=> (not res!692123) (not e!586775))))

(assert (=> b!1037298 (= res!692123 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125079 res!692122) b!1037297))

(assert (= (and b!1037297 res!692121) b!1037298))

(assert (= (and b!1037298 res!692123) b!1037299))

(assert (= (and d!125079 res!692120) b!1037300))

(assert (=> b!1037300 m!956987))

(assert (=> b!1037300 m!956989))

(assert (=> b!1037300 m!956991))

(declare-fun m!957047 () Bool)

(assert (=> d!125079 m!957047))

(declare-fun m!957049 () Bool)

(assert (=> b!1037297 m!957049))

(assert (=> b!1037297 m!957049))

(declare-fun m!957051 () Bool)

(assert (=> b!1037297 m!957051))

(declare-fun m!957053 () Bool)

(assert (=> b!1037298 m!957053))

(assert (=> b!1037225 d!125079))

(declare-fun d!125081 () Bool)

(assert (=> d!125081 (= (array_inv!24301 (_keys!11477 thiss!1427)) (bvsge (size!31954 (_keys!11477 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037224 d!125081))

(declare-fun d!125083 () Bool)

(assert (=> d!125083 (= (array_inv!24302 (_values!6308 thiss!1427)) (bvsge (size!31955 (_values!6308 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037224 d!125083))

(declare-fun b!1037313 () Bool)

(declare-fun e!586782 () SeekEntryResult!9747)

(declare-fun lt!457303 () SeekEntryResult!9747)

(assert (=> b!1037313 (= e!586782 (MissingZero!9747 (index!41361 lt!457303)))))

(declare-fun b!1037314 () Bool)

(declare-fun e!586784 () SeekEntryResult!9747)

(declare-fun e!586783 () SeekEntryResult!9747)

(assert (=> b!1037314 (= e!586784 e!586783)))

(declare-fun lt!457304 () (_ BitVec 64))

(assert (=> b!1037314 (= lt!457304 (select (arr!31422 (_keys!11477 thiss!1427)) (index!41361 lt!457303)))))

(declare-fun c!105083 () Bool)

(assert (=> b!1037314 (= c!105083 (= lt!457304 key!909))))

(declare-fun b!1037315 () Bool)

(assert (=> b!1037315 (= e!586783 (Found!9747 (index!41361 lt!457303)))))

(declare-fun b!1037316 () Bool)

(declare-fun lt!457306 () SeekEntryResult!9747)

(assert (=> b!1037316 (= e!586782 (ite ((_ is MissingVacant!9747) lt!457306) (MissingZero!9747 (index!41362 lt!457306)) lt!457306))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65281 (_ BitVec 32)) SeekEntryResult!9747)

(assert (=> b!1037316 (= lt!457306 (seekKeyOrZeroReturnVacant!0 (x!92535 lt!457303) (index!41361 lt!457303) (index!41361 lt!457303) key!909 (_keys!11477 thiss!1427) (mask!30199 thiss!1427)))))

(declare-fun b!1037318 () Bool)

(declare-fun c!105084 () Bool)

(assert (=> b!1037318 (= c!105084 (= lt!457304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037318 (= e!586783 e!586782)))

(declare-fun d!125085 () Bool)

(declare-fun lt!457305 () SeekEntryResult!9747)

(assert (=> d!125085 (and (or ((_ is MissingVacant!9747) lt!457305) (not ((_ is Found!9747) lt!457305)) (and (bvsge (index!41360 lt!457305) #b00000000000000000000000000000000) (bvslt (index!41360 lt!457305) (size!31954 (_keys!11477 thiss!1427))))) (not ((_ is MissingVacant!9747) lt!457305)) (or (not ((_ is Found!9747) lt!457305)) (= (select (arr!31422 (_keys!11477 thiss!1427)) (index!41360 lt!457305)) key!909)))))

(assert (=> d!125085 (= lt!457305 e!586784)))

(declare-fun c!105085 () Bool)

(assert (=> d!125085 (= c!105085 (and ((_ is Intermediate!9747) lt!457303) (undefined!10559 lt!457303)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65281 (_ BitVec 32)) SeekEntryResult!9747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125085 (= lt!457303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30199 thiss!1427)) key!909 (_keys!11477 thiss!1427) (mask!30199 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125085 (validMask!0 (mask!30199 thiss!1427))))

(assert (=> d!125085 (= (seekEntry!0 key!909 (_keys!11477 thiss!1427) (mask!30199 thiss!1427)) lt!457305)))

(declare-fun b!1037317 () Bool)

(assert (=> b!1037317 (= e!586784 Undefined!9747)))

(assert (= (and d!125085 c!105085) b!1037317))

(assert (= (and d!125085 (not c!105085)) b!1037314))

(assert (= (and b!1037314 c!105083) b!1037315))

(assert (= (and b!1037314 (not c!105083)) b!1037318))

(assert (= (and b!1037318 c!105084) b!1037313))

(assert (= (and b!1037318 (not c!105084)) b!1037316))

(declare-fun m!957055 () Bool)

(assert (=> b!1037314 m!957055))

(declare-fun m!957057 () Bool)

(assert (=> b!1037316 m!957057))

(declare-fun m!957059 () Bool)

(assert (=> d!125085 m!957059))

(declare-fun m!957061 () Bool)

(assert (=> d!125085 m!957061))

(assert (=> d!125085 m!957061))

(declare-fun m!957063 () Bool)

(assert (=> d!125085 m!957063))

(declare-fun m!957065 () Bool)

(assert (=> d!125085 m!957065))

(assert (=> b!1037229 d!125085))

(declare-fun d!125087 () Bool)

(declare-fun res!692130 () Bool)

(declare-fun e!586787 () Bool)

(assert (=> d!125087 (=> (not res!692130) (not e!586787))))

(declare-fun simpleValid!417 (LongMapFixedSize!5806) Bool)

(assert (=> d!125087 (= res!692130 (simpleValid!417 thiss!1427))))

(assert (=> d!125087 (= (valid!2180 thiss!1427) e!586787)))

(declare-fun b!1037325 () Bool)

(declare-fun res!692131 () Bool)

(assert (=> b!1037325 (=> (not res!692131) (not e!586787))))

(assert (=> b!1037325 (= res!692131 (= (arrayCountValidKeys!0 (_keys!11477 thiss!1427) #b00000000000000000000000000000000 (size!31954 (_keys!11477 thiss!1427))) (_size!2958 thiss!1427)))))

(declare-fun b!1037326 () Bool)

(declare-fun res!692132 () Bool)

(assert (=> b!1037326 (=> (not res!692132) (not e!586787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65281 (_ BitVec 32)) Bool)

(assert (=> b!1037326 (= res!692132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11477 thiss!1427) (mask!30199 thiss!1427)))))

(declare-fun b!1037327 () Bool)

(declare-datatypes ((List!21956 0))(
  ( (Nil!21953) (Cons!21952 (h!23155 (_ BitVec 64)) (t!31161 List!21956)) )
))
(declare-fun arrayNoDuplicates!0 (array!65281 (_ BitVec 32) List!21956) Bool)

(assert (=> b!1037327 (= e!586787 (arrayNoDuplicates!0 (_keys!11477 thiss!1427) #b00000000000000000000000000000000 Nil!21953))))

(assert (= (and d!125087 res!692130) b!1037325))

(assert (= (and b!1037325 res!692131) b!1037326))

(assert (= (and b!1037326 res!692132) b!1037327))

(declare-fun m!957067 () Bool)

(assert (=> d!125087 m!957067))

(assert (=> b!1037325 m!956991))

(declare-fun m!957069 () Bool)

(assert (=> b!1037326 m!957069))

(declare-fun m!957071 () Bool)

(assert (=> b!1037327 m!957071))

(assert (=> start!90720 d!125087))

(declare-fun mapNonEmpty!38466 () Bool)

(declare-fun mapRes!38466 () Bool)

(declare-fun tp!73858 () Bool)

(declare-fun e!586793 () Bool)

(assert (=> mapNonEmpty!38466 (= mapRes!38466 (and tp!73858 e!586793))))

(declare-fun mapValue!38466 () ValueCell!11606)

(declare-fun mapRest!38466 () (Array (_ BitVec 32) ValueCell!11606))

(declare-fun mapKey!38466 () (_ BitVec 32))

(assert (=> mapNonEmpty!38466 (= mapRest!38457 (store mapRest!38466 mapKey!38466 mapValue!38466))))

(declare-fun b!1037334 () Bool)

(assert (=> b!1037334 (= e!586793 tp_is_empty!24619)))

(declare-fun condMapEmpty!38466 () Bool)

(declare-fun mapDefault!38466 () ValueCell!11606)

(assert (=> mapNonEmpty!38457 (= condMapEmpty!38466 (= mapRest!38457 ((as const (Array (_ BitVec 32) ValueCell!11606)) mapDefault!38466)))))

(declare-fun e!586792 () Bool)

(assert (=> mapNonEmpty!38457 (= tp!73842 (and e!586792 mapRes!38466))))

(declare-fun b!1037335 () Bool)

(assert (=> b!1037335 (= e!586792 tp_is_empty!24619)))

(declare-fun mapIsEmpty!38466 () Bool)

(assert (=> mapIsEmpty!38466 mapRes!38466))

(assert (= (and mapNonEmpty!38457 condMapEmpty!38466) mapIsEmpty!38466))

(assert (= (and mapNonEmpty!38457 (not condMapEmpty!38466)) mapNonEmpty!38466))

(assert (= (and mapNonEmpty!38466 ((_ is ValueCellFull!11606) mapValue!38466)) b!1037334))

(assert (= (and mapNonEmpty!38457 ((_ is ValueCellFull!11606) mapDefault!38466)) b!1037335))

(declare-fun m!957073 () Bool)

(assert (=> mapNonEmpty!38466 m!957073))

(check-sat (not b!1037327) b_and!33405 (not b!1037316) (not d!125079) (not b!1037281) (not b!1037326) tp_is_empty!24619 (not b_next!20899) (not d!125087) (not d!125085) (not b!1037298) (not bm!43892) (not b!1037325) (not bm!43893) (not b!1037300) (not mapNonEmpty!38466) (not b!1037285) (not b!1037297))
(check-sat b_and!33405 (not b_next!20899))
