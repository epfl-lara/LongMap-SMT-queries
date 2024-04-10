; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91198 () Bool)

(assert start!91198)

(declare-fun b!1040697 () Bool)

(declare-fun b_free!21021 () Bool)

(declare-fun b_next!21021 () Bool)

(assert (=> b!1040697 (= b_free!21021 (not b_next!21021))))

(declare-fun tp!74263 () Bool)

(declare-fun b_and!33553 () Bool)

(assert (=> b!1040697 (= tp!74263 b_and!33553)))

(declare-fun res!693787 () Bool)

(declare-fun e!589240 () Bool)

(assert (=> start!91198 (=> (not res!693787) (not e!589240))))

(declare-datatypes ((V!37861 0))(
  ( (V!37862 (val!12421 Int)) )
))
(declare-datatypes ((ValueCell!11667 0))(
  ( (ValueCellFull!11667 (v!15008 V!37861)) (EmptyCell!11667) )
))
(declare-datatypes ((array!65622 0))(
  ( (array!65623 (arr!31575 (Array (_ BitVec 32) (_ BitVec 64))) (size!32106 (_ BitVec 32))) )
))
(declare-datatypes ((array!65624 0))(
  ( (array!65625 (arr!31576 (Array (_ BitVec 32) ValueCell!11667)) (size!32107 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5928 0))(
  ( (LongMapFixedSize!5929 (defaultEntry!6346 Int) (mask!30347 (_ BitVec 32)) (extraKeys!6074 (_ BitVec 32)) (zeroValue!6180 V!37861) (minValue!6180 V!37861) (_size!3019 (_ BitVec 32)) (_keys!11570 array!65622) (_values!6369 array!65624) (_vacant!3019 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5928)

(declare-fun valid!2225 (LongMapFixedSize!5928) Bool)

(assert (=> start!91198 (= res!693787 (valid!2225 thiss!1427))))

(assert (=> start!91198 e!589240))

(declare-fun e!589237 () Bool)

(assert (=> start!91198 e!589237))

(assert (=> start!91198 true))

(declare-fun b!1040693 () Bool)

(declare-fun e!589235 () Bool)

(declare-fun tp_is_empty!24741 () Bool)

(assert (=> b!1040693 (= e!589235 tp_is_empty!24741)))

(declare-fun b!1040694 () Bool)

(declare-fun e!589241 () Bool)

(assert (=> b!1040694 (= e!589240 e!589241)))

(declare-fun res!693786 () Bool)

(assert (=> b!1040694 (=> (not res!693786) (not e!589241))))

(declare-datatypes ((SeekEntryResult!9800 0))(
  ( (MissingZero!9800 (index!41571 (_ BitVec 32))) (Found!9800 (index!41572 (_ BitVec 32))) (Intermediate!9800 (undefined!10612 Bool) (index!41573 (_ BitVec 32)) (x!92904 (_ BitVec 32))) (Undefined!9800) (MissingVacant!9800 (index!41574 (_ BitVec 32))) )
))
(declare-fun lt!458667 () SeekEntryResult!9800)

(get-info :version)

(assert (=> b!1040694 (= res!693786 ((_ is Found!9800) lt!458667))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65622 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1040694 (= lt!458667 (seekEntry!0 key!909 (_keys!11570 thiss!1427) (mask!30347 thiss!1427)))))

(declare-fun b!1040695 () Bool)

(declare-fun e!589236 () Bool)

(declare-fun e!589238 () Bool)

(declare-fun mapRes!38695 () Bool)

(assert (=> b!1040695 (= e!589236 (and e!589238 mapRes!38695))))

(declare-fun condMapEmpty!38695 () Bool)

(declare-fun mapDefault!38695 () ValueCell!11667)

(assert (=> b!1040695 (= condMapEmpty!38695 (= (arr!31576 (_values!6369 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11667)) mapDefault!38695)))))

(declare-fun mapNonEmpty!38695 () Bool)

(declare-fun tp!74264 () Bool)

(assert (=> mapNonEmpty!38695 (= mapRes!38695 (and tp!74264 e!589235))))

(declare-fun mapValue!38695 () ValueCell!11667)

(declare-fun mapRest!38695 () (Array (_ BitVec 32) ValueCell!11667))

(declare-fun mapKey!38695 () (_ BitVec 32))

(assert (=> mapNonEmpty!38695 (= (arr!31576 (_values!6369 thiss!1427)) (store mapRest!38695 mapKey!38695 mapValue!38695))))

(declare-fun b!1040696 () Bool)

(assert (=> b!1040696 (= e!589238 tp_is_empty!24741)))

(declare-fun mapIsEmpty!38695 () Bool)

(assert (=> mapIsEmpty!38695 mapRes!38695))

(declare-fun array_inv!24397 (array!65622) Bool)

(declare-fun array_inv!24398 (array!65624) Bool)

(assert (=> b!1040697 (= e!589237 (and tp!74263 tp_is_empty!24741 (array_inv!24397 (_keys!11570 thiss!1427)) (array_inv!24398 (_values!6369 thiss!1427)) e!589236))))

(declare-fun b!1040698 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040698 (= e!589241 (not (validMask!0 (mask!30347 thiss!1427))))))

(declare-fun lt!458666 () array!65622)

(declare-fun arrayContainsKey!0 (array!65622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040698 (not (arrayContainsKey!0 lt!458666 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34021 0))(
  ( (Unit!34022) )
))
(declare-fun lt!458664 () Unit!34021)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65622 (_ BitVec 32) (_ BitVec 64)) Unit!34021)

(assert (=> b!1040698 (= lt!458664 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65622 (_ BitVec 32)) Bool)

(assert (=> b!1040698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458666 (mask!30347 thiss!1427))))

(declare-fun lt!458668 () Unit!34021)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65622 (_ BitVec 32) (_ BitVec 32)) Unit!34021)

(assert (=> b!1040698 (= lt!458668 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) (mask!30347 thiss!1427)))))

(declare-datatypes ((List!21962 0))(
  ( (Nil!21959) (Cons!21958 (h!23162 (_ BitVec 64)) (t!31176 List!21962)) )
))
(declare-fun arrayNoDuplicates!0 (array!65622 (_ BitVec 32) List!21962) Bool)

(assert (=> b!1040698 (arrayNoDuplicates!0 lt!458666 #b00000000000000000000000000000000 Nil!21959)))

(declare-fun lt!458665 () Unit!34021)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21962) Unit!34021)

(assert (=> b!1040698 (= lt!458665 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!458667) #b00000000000000000000000000000000 Nil!21959))))

(declare-fun arrayCountValidKeys!0 (array!65622 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040698 (= (arrayCountValidKeys!0 lt!458666 #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040698 (= lt!458666 (array!65623 (store (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32106 (_keys!11570 thiss!1427))))))

(declare-fun lt!458669 () Unit!34021)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65622 (_ BitVec 32) (_ BitVec 64)) Unit!34021)

(assert (=> b!1040698 (= lt!458669 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040699 () Bool)

(declare-fun res!693785 () Bool)

(assert (=> b!1040699 (=> (not res!693785) (not e!589240))))

(assert (=> b!1040699 (= res!693785 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91198 res!693787) b!1040699))

(assert (= (and b!1040699 res!693785) b!1040694))

(assert (= (and b!1040694 res!693786) b!1040698))

(assert (= (and b!1040695 condMapEmpty!38695) mapIsEmpty!38695))

(assert (= (and b!1040695 (not condMapEmpty!38695)) mapNonEmpty!38695))

(assert (= (and mapNonEmpty!38695 ((_ is ValueCellFull!11667) mapValue!38695)) b!1040693))

(assert (= (and b!1040695 ((_ is ValueCellFull!11667) mapDefault!38695)) b!1040696))

(assert (= b!1040697 b!1040695))

(assert (= start!91198 b!1040697))

(declare-fun m!960217 () Bool)

(assert (=> b!1040694 m!960217))

(declare-fun m!960219 () Bool)

(assert (=> start!91198 m!960219))

(declare-fun m!960221 () Bool)

(assert (=> b!1040698 m!960221))

(declare-fun m!960223 () Bool)

(assert (=> b!1040698 m!960223))

(declare-fun m!960225 () Bool)

(assert (=> b!1040698 m!960225))

(declare-fun m!960227 () Bool)

(assert (=> b!1040698 m!960227))

(declare-fun m!960229 () Bool)

(assert (=> b!1040698 m!960229))

(declare-fun m!960231 () Bool)

(assert (=> b!1040698 m!960231))

(declare-fun m!960233 () Bool)

(assert (=> b!1040698 m!960233))

(declare-fun m!960235 () Bool)

(assert (=> b!1040698 m!960235))

(declare-fun m!960237 () Bool)

(assert (=> b!1040698 m!960237))

(declare-fun m!960239 () Bool)

(assert (=> b!1040698 m!960239))

(declare-fun m!960241 () Bool)

(assert (=> b!1040698 m!960241))

(declare-fun m!960243 () Bool)

(assert (=> b!1040697 m!960243))

(declare-fun m!960245 () Bool)

(assert (=> b!1040697 m!960245))

(declare-fun m!960247 () Bool)

(assert (=> mapNonEmpty!38695 m!960247))

(check-sat (not b!1040694) (not b_next!21021) b_and!33553 (not b!1040698) (not b!1040697) (not mapNonEmpty!38695) (not start!91198) tp_is_empty!24741)
(check-sat b_and!33553 (not b_next!21021))
(get-model)

(declare-fun b!1040729 () Bool)

(declare-fun e!589269 () Bool)

(declare-fun call!44070 () Bool)

(assert (=> b!1040729 (= e!589269 call!44070)))

(declare-fun b!1040730 () Bool)

(declare-fun e!589270 () Bool)

(declare-fun e!589271 () Bool)

(assert (=> b!1040730 (= e!589270 e!589271)))

(declare-fun c!105517 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040730 (= c!105517 (validKeyInArray!0 (select (arr!31575 lt!458666) #b00000000000000000000000000000000)))))

(declare-fun d!125689 () Bool)

(declare-fun res!693801 () Bool)

(assert (=> d!125689 (=> res!693801 e!589270)))

(assert (=> d!125689 (= res!693801 (bvsge #b00000000000000000000000000000000 (size!32106 lt!458666)))))

(assert (=> d!125689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458666 (mask!30347 thiss!1427)) e!589270)))

(declare-fun b!1040731 () Bool)

(assert (=> b!1040731 (= e!589271 call!44070)))

(declare-fun bm!44067 () Bool)

(assert (=> bm!44067 (= call!44070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458666 (mask!30347 thiss!1427)))))

(declare-fun b!1040732 () Bool)

(assert (=> b!1040732 (= e!589271 e!589269)))

(declare-fun lt!458696 () (_ BitVec 64))

(assert (=> b!1040732 (= lt!458696 (select (arr!31575 lt!458666) #b00000000000000000000000000000000))))

(declare-fun lt!458695 () Unit!34021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65622 (_ BitVec 64) (_ BitVec 32)) Unit!34021)

(assert (=> b!1040732 (= lt!458695 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458666 lt!458696 #b00000000000000000000000000000000))))

(assert (=> b!1040732 (arrayContainsKey!0 lt!458666 lt!458696 #b00000000000000000000000000000000)))

(declare-fun lt!458694 () Unit!34021)

(assert (=> b!1040732 (= lt!458694 lt!458695)))

(declare-fun res!693802 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65622 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1040732 (= res!693802 (= (seekEntryOrOpen!0 (select (arr!31575 lt!458666) #b00000000000000000000000000000000) lt!458666 (mask!30347 thiss!1427)) (Found!9800 #b00000000000000000000000000000000)))))

(assert (=> b!1040732 (=> (not res!693802) (not e!589269))))

(assert (= (and d!125689 (not res!693801)) b!1040730))

(assert (= (and b!1040730 c!105517) b!1040732))

(assert (= (and b!1040730 (not c!105517)) b!1040731))

(assert (= (and b!1040732 res!693802) b!1040729))

(assert (= (or b!1040729 b!1040731) bm!44067))

(declare-fun m!960281 () Bool)

(assert (=> b!1040730 m!960281))

(assert (=> b!1040730 m!960281))

(declare-fun m!960283 () Bool)

(assert (=> b!1040730 m!960283))

(declare-fun m!960285 () Bool)

(assert (=> bm!44067 m!960285))

(assert (=> b!1040732 m!960281))

(declare-fun m!960287 () Bool)

(assert (=> b!1040732 m!960287))

(declare-fun m!960289 () Bool)

(assert (=> b!1040732 m!960289))

(assert (=> b!1040732 m!960281))

(declare-fun m!960291 () Bool)

(assert (=> b!1040732 m!960291))

(assert (=> b!1040698 d!125689))

(declare-fun d!125691 () Bool)

(assert (=> d!125691 (= (validMask!0 (mask!30347 thiss!1427)) (and (or (= (mask!30347 thiss!1427) #b00000000000000000000000000000111) (= (mask!30347 thiss!1427) #b00000000000000000000000000001111) (= (mask!30347 thiss!1427) #b00000000000000000000000000011111) (= (mask!30347 thiss!1427) #b00000000000000000000000000111111) (= (mask!30347 thiss!1427) #b00000000000000000000000001111111) (= (mask!30347 thiss!1427) #b00000000000000000000000011111111) (= (mask!30347 thiss!1427) #b00000000000000000000000111111111) (= (mask!30347 thiss!1427) #b00000000000000000000001111111111) (= (mask!30347 thiss!1427) #b00000000000000000000011111111111) (= (mask!30347 thiss!1427) #b00000000000000000000111111111111) (= (mask!30347 thiss!1427) #b00000000000000000001111111111111) (= (mask!30347 thiss!1427) #b00000000000000000011111111111111) (= (mask!30347 thiss!1427) #b00000000000000000111111111111111) (= (mask!30347 thiss!1427) #b00000000000000001111111111111111) (= (mask!30347 thiss!1427) #b00000000000000011111111111111111) (= (mask!30347 thiss!1427) #b00000000000000111111111111111111) (= (mask!30347 thiss!1427) #b00000000000001111111111111111111) (= (mask!30347 thiss!1427) #b00000000000011111111111111111111) (= (mask!30347 thiss!1427) #b00000000000111111111111111111111) (= (mask!30347 thiss!1427) #b00000000001111111111111111111111) (= (mask!30347 thiss!1427) #b00000000011111111111111111111111) (= (mask!30347 thiss!1427) #b00000000111111111111111111111111) (= (mask!30347 thiss!1427) #b00000001111111111111111111111111) (= (mask!30347 thiss!1427) #b00000011111111111111111111111111) (= (mask!30347 thiss!1427) #b00000111111111111111111111111111) (= (mask!30347 thiss!1427) #b00001111111111111111111111111111) (= (mask!30347 thiss!1427) #b00011111111111111111111111111111) (= (mask!30347 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30347 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040698 d!125691))

(declare-fun d!125693 () Bool)

(declare-fun e!589274 () Bool)

(assert (=> d!125693 e!589274))

(declare-fun res!693805 () Bool)

(assert (=> d!125693 (=> (not res!693805) (not e!589274))))

(assert (=> d!125693 (= res!693805 (and (bvsge (index!41572 lt!458667) #b00000000000000000000000000000000) (bvslt (index!41572 lt!458667) (size!32106 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458699 () Unit!34021)

(declare-fun choose!25 (array!65622 (_ BitVec 32) (_ BitVec 32)) Unit!34021)

(assert (=> d!125693 (= lt!458699 (choose!25 (_keys!11570 thiss!1427) (index!41572 lt!458667) (mask!30347 thiss!1427)))))

(assert (=> d!125693 (validMask!0 (mask!30347 thiss!1427))))

(assert (=> d!125693 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) (mask!30347 thiss!1427)) lt!458699)))

(declare-fun b!1040735 () Bool)

(assert (=> b!1040735 (= e!589274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65623 (store (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32106 (_keys!11570 thiss!1427))) (mask!30347 thiss!1427)))))

(assert (= (and d!125693 res!693805) b!1040735))

(declare-fun m!960293 () Bool)

(assert (=> d!125693 m!960293))

(assert (=> d!125693 m!960233))

(assert (=> b!1040735 m!960237))

(declare-fun m!960295 () Bool)

(assert (=> b!1040735 m!960295))

(assert (=> b!1040698 d!125693))

(declare-fun b!1040744 () Bool)

(declare-fun res!693814 () Bool)

(declare-fun e!589279 () Bool)

(assert (=> b!1040744 (=> (not res!693814) (not e!589279))))

(assert (=> b!1040744 (= res!693814 (validKeyInArray!0 (select (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667))))))

(declare-fun d!125695 () Bool)

(declare-fun e!589280 () Bool)

(assert (=> d!125695 e!589280))

(declare-fun res!693817 () Bool)

(assert (=> d!125695 (=> (not res!693817) (not e!589280))))

(assert (=> d!125695 (= res!693817 (and (bvsge (index!41572 lt!458667) #b00000000000000000000000000000000) (bvslt (index!41572 lt!458667) (size!32106 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458702 () Unit!34021)

(declare-fun choose!82 (array!65622 (_ BitVec 32) (_ BitVec 64)) Unit!34021)

(assert (=> d!125695 (= lt!458702 (choose!82 (_keys!11570 thiss!1427) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125695 e!589279))

(declare-fun res!693816 () Bool)

(assert (=> d!125695 (=> (not res!693816) (not e!589279))))

(assert (=> d!125695 (= res!693816 (and (bvsge (index!41572 lt!458667) #b00000000000000000000000000000000) (bvslt (index!41572 lt!458667) (size!32106 (_keys!11570 thiss!1427)))))))

(assert (=> d!125695 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458702)))

(declare-fun b!1040747 () Bool)

(assert (=> b!1040747 (= e!589280 (= (arrayCountValidKeys!0 (array!65623 (store (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32106 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040745 () Bool)

(declare-fun res!693815 () Bool)

(assert (=> b!1040745 (=> (not res!693815) (not e!589279))))

(assert (=> b!1040745 (= res!693815 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040746 () Bool)

(assert (=> b!1040746 (= e!589279 (bvslt (size!32106 (_keys!11570 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125695 res!693816) b!1040744))

(assert (= (and b!1040744 res!693814) b!1040745))

(assert (= (and b!1040745 res!693815) b!1040746))

(assert (= (and d!125695 res!693817) b!1040747))

(declare-fun m!960297 () Bool)

(assert (=> b!1040744 m!960297))

(assert (=> b!1040744 m!960297))

(declare-fun m!960299 () Bool)

(assert (=> b!1040744 m!960299))

(declare-fun m!960301 () Bool)

(assert (=> d!125695 m!960301))

(assert (=> b!1040747 m!960237))

(declare-fun m!960303 () Bool)

(assert (=> b!1040747 m!960303))

(assert (=> b!1040747 m!960235))

(declare-fun m!960305 () Bool)

(assert (=> b!1040745 m!960305))

(assert (=> b!1040698 d!125695))

(declare-fun bm!44070 () Bool)

(declare-fun call!44073 () (_ BitVec 32))

(assert (=> bm!44070 (= call!44073 (arrayCountValidKeys!0 lt!458666 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32106 (_keys!11570 thiss!1427))))))

(declare-fun d!125697 () Bool)

(declare-fun lt!458705 () (_ BitVec 32))

(assert (=> d!125697 (and (bvsge lt!458705 #b00000000000000000000000000000000) (bvsle lt!458705 (bvsub (size!32106 lt!458666) #b00000000000000000000000000000000)))))

(declare-fun e!589286 () (_ BitVec 32))

(assert (=> d!125697 (= lt!458705 e!589286)))

(declare-fun c!105523 () Bool)

(assert (=> d!125697 (= c!105523 (bvsge #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))))))

(assert (=> d!125697 (and (bvsle #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32106 (_keys!11570 thiss!1427)) (size!32106 lt!458666)))))

(assert (=> d!125697 (= (arrayCountValidKeys!0 lt!458666 #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) lt!458705)))

(declare-fun b!1040756 () Bool)

(declare-fun e!589285 () (_ BitVec 32))

(assert (=> b!1040756 (= e!589285 call!44073)))

(declare-fun b!1040757 () Bool)

(assert (=> b!1040757 (= e!589285 (bvadd #b00000000000000000000000000000001 call!44073))))

(declare-fun b!1040758 () Bool)

(assert (=> b!1040758 (= e!589286 e!589285)))

(declare-fun c!105522 () Bool)

(assert (=> b!1040758 (= c!105522 (validKeyInArray!0 (select (arr!31575 lt!458666) #b00000000000000000000000000000000)))))

(declare-fun b!1040759 () Bool)

(assert (=> b!1040759 (= e!589286 #b00000000000000000000000000000000)))

(assert (= (and d!125697 c!105523) b!1040759))

(assert (= (and d!125697 (not c!105523)) b!1040758))

(assert (= (and b!1040758 c!105522) b!1040757))

(assert (= (and b!1040758 (not c!105522)) b!1040756))

(assert (= (or b!1040757 b!1040756) bm!44070))

(declare-fun m!960307 () Bool)

(assert (=> bm!44070 m!960307))

(assert (=> b!1040758 m!960281))

(assert (=> b!1040758 m!960281))

(assert (=> b!1040758 m!960283))

(assert (=> b!1040698 d!125697))

(declare-fun d!125699 () Bool)

(declare-fun e!589289 () Bool)

(assert (=> d!125699 e!589289))

(declare-fun res!693820 () Bool)

(assert (=> d!125699 (=> (not res!693820) (not e!589289))))

(assert (=> d!125699 (= res!693820 (bvslt (index!41572 lt!458667) (size!32106 (_keys!11570 thiss!1427))))))

(declare-fun lt!458708 () Unit!34021)

(declare-fun choose!121 (array!65622 (_ BitVec 32) (_ BitVec 64)) Unit!34021)

(assert (=> d!125699 (= lt!458708 (choose!121 (_keys!11570 thiss!1427) (index!41572 lt!458667) key!909))))

(assert (=> d!125699 (bvsge (index!41572 lt!458667) #b00000000000000000000000000000000)))

(assert (=> d!125699 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11570 thiss!1427) (index!41572 lt!458667) key!909) lt!458708)))

(declare-fun b!1040762 () Bool)

(assert (=> b!1040762 (= e!589289 (not (arrayContainsKey!0 (array!65623 (store (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32106 (_keys!11570 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125699 res!693820) b!1040762))

(declare-fun m!960309 () Bool)

(assert (=> d!125699 m!960309))

(assert (=> b!1040762 m!960237))

(declare-fun m!960311 () Bool)

(assert (=> b!1040762 m!960311))

(assert (=> b!1040698 d!125699))

(declare-fun bm!44071 () Bool)

(declare-fun call!44074 () (_ BitVec 32))

(assert (=> bm!44071 (= call!44074 (arrayCountValidKeys!0 (_keys!11570 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32106 (_keys!11570 thiss!1427))))))

(declare-fun d!125701 () Bool)

(declare-fun lt!458709 () (_ BitVec 32))

(assert (=> d!125701 (and (bvsge lt!458709 #b00000000000000000000000000000000) (bvsle lt!458709 (bvsub (size!32106 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589291 () (_ BitVec 32))

(assert (=> d!125701 (= lt!458709 e!589291)))

(declare-fun c!105525 () Bool)

(assert (=> d!125701 (= c!105525 (bvsge #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))))))

(assert (=> d!125701 (and (bvsle #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32106 (_keys!11570 thiss!1427)) (size!32106 (_keys!11570 thiss!1427))))))

(assert (=> d!125701 (= (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) lt!458709)))

(declare-fun b!1040763 () Bool)

(declare-fun e!589290 () (_ BitVec 32))

(assert (=> b!1040763 (= e!589290 call!44074)))

(declare-fun b!1040764 () Bool)

(assert (=> b!1040764 (= e!589290 (bvadd #b00000000000000000000000000000001 call!44074))))

(declare-fun b!1040765 () Bool)

(assert (=> b!1040765 (= e!589291 e!589290)))

(declare-fun c!105524 () Bool)

(assert (=> b!1040765 (= c!105524 (validKeyInArray!0 (select (arr!31575 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040766 () Bool)

(assert (=> b!1040766 (= e!589291 #b00000000000000000000000000000000)))

(assert (= (and d!125701 c!105525) b!1040766))

(assert (= (and d!125701 (not c!105525)) b!1040765))

(assert (= (and b!1040765 c!105524) b!1040764))

(assert (= (and b!1040765 (not c!105524)) b!1040763))

(assert (= (or b!1040764 b!1040763) bm!44071))

(declare-fun m!960313 () Bool)

(assert (=> bm!44071 m!960313))

(declare-fun m!960315 () Bool)

(assert (=> b!1040765 m!960315))

(assert (=> b!1040765 m!960315))

(declare-fun m!960317 () Bool)

(assert (=> b!1040765 m!960317))

(assert (=> b!1040698 d!125701))

(declare-fun d!125703 () Bool)

(declare-fun e!589294 () Bool)

(assert (=> d!125703 e!589294))

(declare-fun res!693823 () Bool)

(assert (=> d!125703 (=> (not res!693823) (not e!589294))))

(assert (=> d!125703 (= res!693823 (and (bvsge (index!41572 lt!458667) #b00000000000000000000000000000000) (bvslt (index!41572 lt!458667) (size!32106 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458712 () Unit!34021)

(declare-fun choose!53 (array!65622 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21962) Unit!34021)

(assert (=> d!125703 (= lt!458712 (choose!53 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!458667) #b00000000000000000000000000000000 Nil!21959))))

(assert (=> d!125703 (bvslt (size!32106 (_keys!11570 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125703 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41572 lt!458667) #b00000000000000000000000000000000 Nil!21959) lt!458712)))

(declare-fun b!1040769 () Bool)

(assert (=> b!1040769 (= e!589294 (arrayNoDuplicates!0 (array!65623 (store (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458667) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32106 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 Nil!21959))))

(assert (= (and d!125703 res!693823) b!1040769))

(declare-fun m!960319 () Bool)

(assert (=> d!125703 m!960319))

(assert (=> b!1040769 m!960237))

(declare-fun m!960321 () Bool)

(assert (=> b!1040769 m!960321))

(assert (=> b!1040698 d!125703))

(declare-fun b!1040781 () Bool)

(declare-fun e!589306 () Bool)

(declare-fun call!44077 () Bool)

(assert (=> b!1040781 (= e!589306 call!44077)))

(declare-fun b!1040782 () Bool)

(declare-fun e!589305 () Bool)

(declare-fun e!589304 () Bool)

(assert (=> b!1040782 (= e!589305 e!589304)))

(declare-fun res!693832 () Bool)

(assert (=> b!1040782 (=> (not res!693832) (not e!589304))))

(declare-fun e!589303 () Bool)

(assert (=> b!1040782 (= res!693832 (not e!589303))))

(declare-fun res!693831 () Bool)

(assert (=> b!1040782 (=> (not res!693831) (not e!589303))))

(assert (=> b!1040782 (= res!693831 (validKeyInArray!0 (select (arr!31575 lt!458666) #b00000000000000000000000000000000)))))

(declare-fun b!1040783 () Bool)

(assert (=> b!1040783 (= e!589304 e!589306)))

(declare-fun c!105528 () Bool)

(assert (=> b!1040783 (= c!105528 (validKeyInArray!0 (select (arr!31575 lt!458666) #b00000000000000000000000000000000)))))

(declare-fun bm!44074 () Bool)

(assert (=> bm!44074 (= call!44077 (arrayNoDuplicates!0 lt!458666 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105528 (Cons!21958 (select (arr!31575 lt!458666) #b00000000000000000000000000000000) Nil!21959) Nil!21959)))))

(declare-fun b!1040784 () Bool)

(assert (=> b!1040784 (= e!589306 call!44077)))

(declare-fun d!125705 () Bool)

(declare-fun res!693830 () Bool)

(assert (=> d!125705 (=> res!693830 e!589305)))

(assert (=> d!125705 (= res!693830 (bvsge #b00000000000000000000000000000000 (size!32106 lt!458666)))))

(assert (=> d!125705 (= (arrayNoDuplicates!0 lt!458666 #b00000000000000000000000000000000 Nil!21959) e!589305)))

(declare-fun b!1040780 () Bool)

(declare-fun contains!6051 (List!21962 (_ BitVec 64)) Bool)

(assert (=> b!1040780 (= e!589303 (contains!6051 Nil!21959 (select (arr!31575 lt!458666) #b00000000000000000000000000000000)))))

(assert (= (and d!125705 (not res!693830)) b!1040782))

(assert (= (and b!1040782 res!693831) b!1040780))

(assert (= (and b!1040782 res!693832) b!1040783))

(assert (= (and b!1040783 c!105528) b!1040784))

(assert (= (and b!1040783 (not c!105528)) b!1040781))

(assert (= (or b!1040784 b!1040781) bm!44074))

(assert (=> b!1040782 m!960281))

(assert (=> b!1040782 m!960281))

(assert (=> b!1040782 m!960283))

(assert (=> b!1040783 m!960281))

(assert (=> b!1040783 m!960281))

(assert (=> b!1040783 m!960283))

(assert (=> bm!44074 m!960281))

(declare-fun m!960323 () Bool)

(assert (=> bm!44074 m!960323))

(assert (=> b!1040780 m!960281))

(assert (=> b!1040780 m!960281))

(declare-fun m!960325 () Bool)

(assert (=> b!1040780 m!960325))

(assert (=> b!1040698 d!125705))

(declare-fun d!125707 () Bool)

(declare-fun res!693837 () Bool)

(declare-fun e!589311 () Bool)

(assert (=> d!125707 (=> res!693837 e!589311)))

(assert (=> d!125707 (= res!693837 (= (select (arr!31575 lt!458666) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125707 (= (arrayContainsKey!0 lt!458666 key!909 #b00000000000000000000000000000000) e!589311)))

(declare-fun b!1040789 () Bool)

(declare-fun e!589312 () Bool)

(assert (=> b!1040789 (= e!589311 e!589312)))

(declare-fun res!693838 () Bool)

(assert (=> b!1040789 (=> (not res!693838) (not e!589312))))

(assert (=> b!1040789 (= res!693838 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32106 lt!458666)))))

(declare-fun b!1040790 () Bool)

(assert (=> b!1040790 (= e!589312 (arrayContainsKey!0 lt!458666 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125707 (not res!693837)) b!1040789))

(assert (= (and b!1040789 res!693838) b!1040790))

(assert (=> d!125707 m!960281))

(declare-fun m!960327 () Bool)

(assert (=> b!1040790 m!960327))

(assert (=> b!1040698 d!125707))

(declare-fun d!125709 () Bool)

(assert (=> d!125709 (= (array_inv!24397 (_keys!11570 thiss!1427)) (bvsge (size!32106 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040697 d!125709))

(declare-fun d!125711 () Bool)

(assert (=> d!125711 (= (array_inv!24398 (_values!6369 thiss!1427)) (bvsge (size!32107 (_values!6369 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040697 d!125711))

(declare-fun d!125713 () Bool)

(declare-fun lt!458721 () SeekEntryResult!9800)

(assert (=> d!125713 (and (or ((_ is MissingVacant!9800) lt!458721) (not ((_ is Found!9800) lt!458721)) (and (bvsge (index!41572 lt!458721) #b00000000000000000000000000000000) (bvslt (index!41572 lt!458721) (size!32106 (_keys!11570 thiss!1427))))) (not ((_ is MissingVacant!9800) lt!458721)) (or (not ((_ is Found!9800) lt!458721)) (= (select (arr!31575 (_keys!11570 thiss!1427)) (index!41572 lt!458721)) key!909)))))

(declare-fun e!589321 () SeekEntryResult!9800)

(assert (=> d!125713 (= lt!458721 e!589321)))

(declare-fun c!105535 () Bool)

(declare-fun lt!458724 () SeekEntryResult!9800)

(assert (=> d!125713 (= c!105535 (and ((_ is Intermediate!9800) lt!458724) (undefined!10612 lt!458724)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65622 (_ BitVec 32)) SeekEntryResult!9800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125713 (= lt!458724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30347 thiss!1427)) key!909 (_keys!11570 thiss!1427) (mask!30347 thiss!1427)))))

(assert (=> d!125713 (validMask!0 (mask!30347 thiss!1427))))

(assert (=> d!125713 (= (seekEntry!0 key!909 (_keys!11570 thiss!1427) (mask!30347 thiss!1427)) lt!458721)))

(declare-fun b!1040803 () Bool)

(declare-fun e!589319 () SeekEntryResult!9800)

(assert (=> b!1040803 (= e!589319 (MissingZero!9800 (index!41573 lt!458724)))))

(declare-fun b!1040804 () Bool)

(declare-fun lt!458723 () SeekEntryResult!9800)

(assert (=> b!1040804 (= e!589319 (ite ((_ is MissingVacant!9800) lt!458723) (MissingZero!9800 (index!41574 lt!458723)) lt!458723))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65622 (_ BitVec 32)) SeekEntryResult!9800)

(assert (=> b!1040804 (= lt!458723 (seekKeyOrZeroReturnVacant!0 (x!92904 lt!458724) (index!41573 lt!458724) (index!41573 lt!458724) key!909 (_keys!11570 thiss!1427) (mask!30347 thiss!1427)))))

(declare-fun b!1040805 () Bool)

(assert (=> b!1040805 (= e!589321 Undefined!9800)))

(declare-fun b!1040806 () Bool)

(declare-fun e!589320 () SeekEntryResult!9800)

(assert (=> b!1040806 (= e!589321 e!589320)))

(declare-fun lt!458722 () (_ BitVec 64))

(assert (=> b!1040806 (= lt!458722 (select (arr!31575 (_keys!11570 thiss!1427)) (index!41573 lt!458724)))))

(declare-fun c!105537 () Bool)

(assert (=> b!1040806 (= c!105537 (= lt!458722 key!909))))

(declare-fun b!1040807 () Bool)

(assert (=> b!1040807 (= e!589320 (Found!9800 (index!41573 lt!458724)))))

(declare-fun b!1040808 () Bool)

(declare-fun c!105536 () Bool)

(assert (=> b!1040808 (= c!105536 (= lt!458722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040808 (= e!589320 e!589319)))

(assert (= (and d!125713 c!105535) b!1040805))

(assert (= (and d!125713 (not c!105535)) b!1040806))

(assert (= (and b!1040806 c!105537) b!1040807))

(assert (= (and b!1040806 (not c!105537)) b!1040808))

(assert (= (and b!1040808 c!105536) b!1040803))

(assert (= (and b!1040808 (not c!105536)) b!1040804))

(declare-fun m!960329 () Bool)

(assert (=> d!125713 m!960329))

(declare-fun m!960331 () Bool)

(assert (=> d!125713 m!960331))

(assert (=> d!125713 m!960331))

(declare-fun m!960333 () Bool)

(assert (=> d!125713 m!960333))

(assert (=> d!125713 m!960233))

(declare-fun m!960335 () Bool)

(assert (=> b!1040804 m!960335))

(declare-fun m!960337 () Bool)

(assert (=> b!1040806 m!960337))

(assert (=> b!1040694 d!125713))

(declare-fun d!125715 () Bool)

(declare-fun res!693845 () Bool)

(declare-fun e!589324 () Bool)

(assert (=> d!125715 (=> (not res!693845) (not e!589324))))

(declare-fun simpleValid!435 (LongMapFixedSize!5928) Bool)

(assert (=> d!125715 (= res!693845 (simpleValid!435 thiss!1427))))

(assert (=> d!125715 (= (valid!2225 thiss!1427) e!589324)))

(declare-fun b!1040815 () Bool)

(declare-fun res!693846 () Bool)

(assert (=> b!1040815 (=> (not res!693846) (not e!589324))))

(assert (=> b!1040815 (= res!693846 (= (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32106 (_keys!11570 thiss!1427))) (_size!3019 thiss!1427)))))

(declare-fun b!1040816 () Bool)

(declare-fun res!693847 () Bool)

(assert (=> b!1040816 (=> (not res!693847) (not e!589324))))

(assert (=> b!1040816 (= res!693847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11570 thiss!1427) (mask!30347 thiss!1427)))))

(declare-fun b!1040817 () Bool)

(assert (=> b!1040817 (= e!589324 (arrayNoDuplicates!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 Nil!21959))))

(assert (= (and d!125715 res!693845) b!1040815))

(assert (= (and b!1040815 res!693846) b!1040816))

(assert (= (and b!1040816 res!693847) b!1040817))

(declare-fun m!960339 () Bool)

(assert (=> d!125715 m!960339))

(assert (=> b!1040815 m!960235))

(declare-fun m!960341 () Bool)

(assert (=> b!1040816 m!960341))

(declare-fun m!960343 () Bool)

(assert (=> b!1040817 m!960343))

(assert (=> start!91198 d!125715))

(declare-fun mapIsEmpty!38701 () Bool)

(declare-fun mapRes!38701 () Bool)

(assert (=> mapIsEmpty!38701 mapRes!38701))

(declare-fun b!1040824 () Bool)

(declare-fun e!589330 () Bool)

(assert (=> b!1040824 (= e!589330 tp_is_empty!24741)))

(declare-fun mapNonEmpty!38701 () Bool)

(declare-fun tp!74273 () Bool)

(assert (=> mapNonEmpty!38701 (= mapRes!38701 (and tp!74273 e!589330))))

(declare-fun mapValue!38701 () ValueCell!11667)

(declare-fun mapKey!38701 () (_ BitVec 32))

(declare-fun mapRest!38701 () (Array (_ BitVec 32) ValueCell!11667))

(assert (=> mapNonEmpty!38701 (= mapRest!38695 (store mapRest!38701 mapKey!38701 mapValue!38701))))

(declare-fun condMapEmpty!38701 () Bool)

(declare-fun mapDefault!38701 () ValueCell!11667)

(assert (=> mapNonEmpty!38695 (= condMapEmpty!38701 (= mapRest!38695 ((as const (Array (_ BitVec 32) ValueCell!11667)) mapDefault!38701)))))

(declare-fun e!589329 () Bool)

(assert (=> mapNonEmpty!38695 (= tp!74264 (and e!589329 mapRes!38701))))

(declare-fun b!1040825 () Bool)

(assert (=> b!1040825 (= e!589329 tp_is_empty!24741)))

(assert (= (and mapNonEmpty!38695 condMapEmpty!38701) mapIsEmpty!38701))

(assert (= (and mapNonEmpty!38695 (not condMapEmpty!38701)) mapNonEmpty!38701))

(assert (= (and mapNonEmpty!38701 ((_ is ValueCellFull!11667) mapValue!38701)) b!1040824))

(assert (= (and mapNonEmpty!38695 ((_ is ValueCellFull!11667) mapDefault!38701)) b!1040825))

(declare-fun m!960345 () Bool)

(assert (=> mapNonEmpty!38701 m!960345))

(check-sat (not b!1040758) (not b!1040780) tp_is_empty!24741 b_and!33553 (not b!1040744) (not b!1040816) (not b!1040783) (not d!125703) (not b!1040747) (not b!1040735) (not b!1040732) (not d!125695) (not d!125693) (not d!125713) (not b!1040817) (not b!1040782) (not b!1040765) (not mapNonEmpty!38701) (not b_next!21021) (not b!1040730) (not bm!44071) (not b!1040815) (not b!1040762) (not b!1040745) (not bm!44067) (not d!125715) (not bm!44074) (not bm!44070) (not b!1040769) (not d!125699) (not b!1040804) (not b!1040790))
(check-sat b_and!33553 (not b_next!21021))
