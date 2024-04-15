; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91370 () Bool)

(assert start!91370)

(declare-fun b!1041482 () Bool)

(declare-fun b_free!21043 () Bool)

(declare-fun b_next!21043 () Bool)

(assert (=> b!1041482 (= b_free!21043 (not b_next!21043))))

(declare-fun tp!74343 () Bool)

(declare-fun b_and!33549 () Bool)

(assert (=> b!1041482 (= tp!74343 b_and!33549)))

(declare-fun b!1041478 () Bool)

(declare-fun e!589835 () Bool)

(declare-fun tp_is_empty!24763 () Bool)

(assert (=> b!1041478 (= e!589835 tp_is_empty!24763)))

(declare-fun b!1041479 () Bool)

(declare-fun e!589830 () Bool)

(declare-fun mapRes!38742 () Bool)

(assert (=> b!1041479 (= e!589830 (and e!589835 mapRes!38742))))

(declare-fun condMapEmpty!38742 () Bool)

(declare-datatypes ((V!37891 0))(
  ( (V!37892 (val!12432 Int)) )
))
(declare-datatypes ((ValueCell!11678 0))(
  ( (ValueCellFull!11678 (v!15020 V!37891)) (EmptyCell!11678) )
))
(declare-datatypes ((array!65613 0))(
  ( (array!65614 (arr!31566 (Array (_ BitVec 32) (_ BitVec 64))) (size!32101 (_ BitVec 32))) )
))
(declare-datatypes ((array!65615 0))(
  ( (array!65616 (arr!31567 (Array (_ BitVec 32) ValueCell!11678)) (size!32102 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5950 0))(
  ( (LongMapFixedSize!5951 (defaultEntry!6357 Int) (mask!30387 (_ BitVec 32)) (extraKeys!6085 (_ BitVec 32)) (zeroValue!6191 V!37891) (minValue!6191 V!37891) (_size!3030 (_ BitVec 32)) (_keys!11591 array!65613) (_values!6380 array!65615) (_vacant!3030 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5950)

(declare-fun mapDefault!38742 () ValueCell!11678)

(assert (=> b!1041479 (= condMapEmpty!38742 (= (arr!31567 (_values!6380 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38742)))))

(declare-fun mapNonEmpty!38742 () Bool)

(declare-fun tp!74344 () Bool)

(declare-fun e!589832 () Bool)

(assert (=> mapNonEmpty!38742 (= mapRes!38742 (and tp!74344 e!589832))))

(declare-fun mapRest!38742 () (Array (_ BitVec 32) ValueCell!11678))

(declare-fun mapValue!38742 () ValueCell!11678)

(declare-fun mapKey!38742 () (_ BitVec 32))

(assert (=> mapNonEmpty!38742 (= (arr!31567 (_values!6380 thiss!1427)) (store mapRest!38742 mapKey!38742 mapValue!38742))))

(declare-fun b!1041480 () Bool)

(declare-fun e!589837 () Bool)

(declare-fun e!589833 () Bool)

(assert (=> b!1041480 (= e!589837 e!589833)))

(declare-fun res!694148 () Bool)

(assert (=> b!1041480 (=> (not res!694148) (not e!589833))))

(declare-datatypes ((SeekEntryResult!9807 0))(
  ( (MissingZero!9807 (index!41599 (_ BitVec 32))) (Found!9807 (index!41600 (_ BitVec 32))) (Intermediate!9807 (undefined!10619 Bool) (index!41601 (_ BitVec 32)) (x!92990 (_ BitVec 32))) (Undefined!9807) (MissingVacant!9807 (index!41602 (_ BitVec 32))) )
))
(declare-fun lt!458900 () SeekEntryResult!9807)

(get-info :version)

(assert (=> b!1041480 (= res!694148 ((_ is Found!9807) lt!458900))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65613 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041480 (= lt!458900 (seekEntry!0 key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041481 () Bool)

(declare-fun e!589836 () Bool)

(assert (=> b!1041481 (= e!589833 (not e!589836))))

(declare-fun res!694151 () Bool)

(assert (=> b!1041481 (=> res!694151 e!589836)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041481 (= res!694151 (not (validMask!0 (mask!30387 thiss!1427))))))

(declare-fun lt!458903 () array!65613)

(declare-fun arrayContainsKey!0 (array!65613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041481 (not (arrayContainsKey!0 lt!458903 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33921 0))(
  ( (Unit!33922) )
))
(declare-fun lt!458904 () Unit!33921)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65613 (_ BitVec 32) (_ BitVec 64)) Unit!33921)

(assert (=> b!1041481 (= lt!458904 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65613 (_ BitVec 32)) Bool)

(assert (=> b!1041481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458903 (mask!30387 thiss!1427))))

(declare-fun lt!458901 () Unit!33921)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65613 (_ BitVec 32) (_ BitVec 32)) Unit!33921)

(assert (=> b!1041481 (= lt!458901 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) (mask!30387 thiss!1427)))))

(declare-datatypes ((List!22006 0))(
  ( (Nil!22003) (Cons!22002 (h!23208 (_ BitVec 64)) (t!31211 List!22006)) )
))
(declare-fun arrayNoDuplicates!0 (array!65613 (_ BitVec 32) List!22006) Bool)

(assert (=> b!1041481 (arrayNoDuplicates!0 lt!458903 #b00000000000000000000000000000000 Nil!22003)))

(declare-fun lt!458902 () Unit!33921)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22006) Unit!33921)

(assert (=> b!1041481 (= lt!458902 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!458900) #b00000000000000000000000000000000 Nil!22003))))

(declare-fun arrayCountValidKeys!0 (array!65613 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041481 (= (arrayCountValidKeys!0 lt!458903 #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041481 (= lt!458903 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun lt!458905 () Unit!33921)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65613 (_ BitVec 32) (_ BitVec 64)) Unit!33921)

(assert (=> b!1041481 (= lt!458905 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589834 () Bool)

(declare-fun array_inv!24397 (array!65613) Bool)

(declare-fun array_inv!24398 (array!65615) Bool)

(assert (=> b!1041482 (= e!589834 (and tp!74343 tp_is_empty!24763 (array_inv!24397 (_keys!11591 thiss!1427)) (array_inv!24398 (_values!6380 thiss!1427)) e!589830))))

(declare-fun b!1041483 () Bool)

(assert (=> b!1041483 (= e!589832 tp_is_empty!24763)))

(declare-fun b!1041484 () Bool)

(assert (=> b!1041484 (= e!589836 (or (not (= (size!32102 (_values!6380 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30387 thiss!1427)))) (not (= (size!32101 (_keys!11591 thiss!1427)) (size!32102 (_values!6380 thiss!1427)))) (bvslt (mask!30387 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!6085 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1041485 () Bool)

(declare-fun res!694149 () Bool)

(assert (=> b!1041485 (=> (not res!694149) (not e!589837))))

(assert (=> b!1041485 (= res!694149 (not (= key!909 (bvneg key!909))))))

(declare-fun res!694150 () Bool)

(assert (=> start!91370 (=> (not res!694150) (not e!589837))))

(declare-fun valid!2224 (LongMapFixedSize!5950) Bool)

(assert (=> start!91370 (= res!694150 (valid!2224 thiss!1427))))

(assert (=> start!91370 e!589837))

(assert (=> start!91370 e!589834))

(assert (=> start!91370 true))

(declare-fun mapIsEmpty!38742 () Bool)

(assert (=> mapIsEmpty!38742 mapRes!38742))

(assert (= (and start!91370 res!694150) b!1041485))

(assert (= (and b!1041485 res!694149) b!1041480))

(assert (= (and b!1041480 res!694148) b!1041481))

(assert (= (and b!1041481 (not res!694151)) b!1041484))

(assert (= (and b!1041479 condMapEmpty!38742) mapIsEmpty!38742))

(assert (= (and b!1041479 (not condMapEmpty!38742)) mapNonEmpty!38742))

(assert (= (and mapNonEmpty!38742 ((_ is ValueCellFull!11678) mapValue!38742)) b!1041483))

(assert (= (and b!1041479 ((_ is ValueCellFull!11678) mapDefault!38742)) b!1041478))

(assert (= b!1041482 b!1041479))

(assert (= start!91370 b!1041482))

(declare-fun m!960417 () Bool)

(assert (=> b!1041481 m!960417))

(declare-fun m!960419 () Bool)

(assert (=> b!1041481 m!960419))

(declare-fun m!960421 () Bool)

(assert (=> b!1041481 m!960421))

(declare-fun m!960423 () Bool)

(assert (=> b!1041481 m!960423))

(declare-fun m!960425 () Bool)

(assert (=> b!1041481 m!960425))

(declare-fun m!960427 () Bool)

(assert (=> b!1041481 m!960427))

(declare-fun m!960429 () Bool)

(assert (=> b!1041481 m!960429))

(declare-fun m!960431 () Bool)

(assert (=> b!1041481 m!960431))

(declare-fun m!960433 () Bool)

(assert (=> b!1041481 m!960433))

(declare-fun m!960435 () Bool)

(assert (=> b!1041481 m!960435))

(declare-fun m!960437 () Bool)

(assert (=> b!1041481 m!960437))

(declare-fun m!960439 () Bool)

(assert (=> start!91370 m!960439))

(declare-fun m!960441 () Bool)

(assert (=> mapNonEmpty!38742 m!960441))

(declare-fun m!960443 () Bool)

(assert (=> b!1041480 m!960443))

(declare-fun m!960445 () Bool)

(assert (=> b!1041482 m!960445))

(declare-fun m!960447 () Bool)

(assert (=> b!1041482 m!960447))

(check-sat (not b_next!21043) (not b!1041480) (not mapNonEmpty!38742) (not b!1041482) (not b!1041481) tp_is_empty!24763 (not start!91370) b_and!33549)
(check-sat b_and!33549 (not b_next!21043))
(get-model)

(declare-fun d!125767 () Bool)

(assert (=> d!125767 (= (array_inv!24397 (_keys!11591 thiss!1427)) (bvsge (size!32101 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041482 d!125767))

(declare-fun d!125769 () Bool)

(assert (=> d!125769 (= (array_inv!24398 (_values!6380 thiss!1427)) (bvsge (size!32102 (_values!6380 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041482 d!125769))

(declare-fun d!125771 () Bool)

(declare-fun res!694182 () Bool)

(declare-fun e!589888 () Bool)

(assert (=> d!125771 (=> (not res!694182) (not e!589888))))

(declare-fun simpleValid!439 (LongMapFixedSize!5950) Bool)

(assert (=> d!125771 (= res!694182 (simpleValid!439 thiss!1427))))

(assert (=> d!125771 (= (valid!2224 thiss!1427) e!589888)))

(declare-fun b!1041540 () Bool)

(declare-fun res!694183 () Bool)

(assert (=> b!1041540 (=> (not res!694183) (not e!589888))))

(assert (=> b!1041540 (= res!694183 (= (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (_size!3030 thiss!1427)))))

(declare-fun b!1041541 () Bool)

(declare-fun res!694184 () Bool)

(assert (=> b!1041541 (=> (not res!694184) (not e!589888))))

(assert (=> b!1041541 (= res!694184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041542 () Bool)

(assert (=> b!1041542 (= e!589888 (arrayNoDuplicates!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 Nil!22003))))

(assert (= (and d!125771 res!694182) b!1041540))

(assert (= (and b!1041540 res!694183) b!1041541))

(assert (= (and b!1041541 res!694184) b!1041542))

(declare-fun m!960513 () Bool)

(assert (=> d!125771 m!960513))

(assert (=> b!1041540 m!960423))

(declare-fun m!960515 () Bool)

(assert (=> b!1041541 m!960515))

(declare-fun m!960517 () Bool)

(assert (=> b!1041542 m!960517))

(assert (=> start!91370 d!125771))

(declare-fun d!125773 () Bool)

(declare-fun res!694189 () Bool)

(declare-fun e!589893 () Bool)

(assert (=> d!125773 (=> res!694189 e!589893)))

(assert (=> d!125773 (= res!694189 (= (select (arr!31566 lt!458903) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125773 (= (arrayContainsKey!0 lt!458903 key!909 #b00000000000000000000000000000000) e!589893)))

(declare-fun b!1041547 () Bool)

(declare-fun e!589894 () Bool)

(assert (=> b!1041547 (= e!589893 e!589894)))

(declare-fun res!694190 () Bool)

(assert (=> b!1041547 (=> (not res!694190) (not e!589894))))

(assert (=> b!1041547 (= res!694190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 lt!458903)))))

(declare-fun b!1041548 () Bool)

(assert (=> b!1041548 (= e!589894 (arrayContainsKey!0 lt!458903 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125773 (not res!694189)) b!1041547))

(assert (= (and b!1041547 res!694190) b!1041548))

(declare-fun m!960519 () Bool)

(assert (=> d!125773 m!960519))

(declare-fun m!960521 () Bool)

(assert (=> b!1041548 m!960521))

(assert (=> b!1041481 d!125773))

(declare-fun b!1041557 () Bool)

(declare-fun e!589901 () Bool)

(declare-fun call!44105 () Bool)

(assert (=> b!1041557 (= e!589901 call!44105)))

(declare-fun bm!44102 () Bool)

(assert (=> bm!44102 (= call!44105 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458903 (mask!30387 thiss!1427)))))

(declare-fun b!1041559 () Bool)

(declare-fun e!589903 () Bool)

(assert (=> b!1041559 (= e!589903 call!44105)))

(declare-fun b!1041560 () Bool)

(assert (=> b!1041560 (= e!589901 e!589903)))

(declare-fun lt!458950 () (_ BitVec 64))

(assert (=> b!1041560 (= lt!458950 (select (arr!31566 lt!458903) #b00000000000000000000000000000000))))

(declare-fun lt!458948 () Unit!33921)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65613 (_ BitVec 64) (_ BitVec 32)) Unit!33921)

(assert (=> b!1041560 (= lt!458948 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458903 lt!458950 #b00000000000000000000000000000000))))

(assert (=> b!1041560 (arrayContainsKey!0 lt!458903 lt!458950 #b00000000000000000000000000000000)))

(declare-fun lt!458949 () Unit!33921)

(assert (=> b!1041560 (= lt!458949 lt!458948)))

(declare-fun res!694195 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65613 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041560 (= res!694195 (= (seekEntryOrOpen!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) lt!458903 (mask!30387 thiss!1427)) (Found!9807 #b00000000000000000000000000000000)))))

(assert (=> b!1041560 (=> (not res!694195) (not e!589903))))

(declare-fun b!1041558 () Bool)

(declare-fun e!589902 () Bool)

(assert (=> b!1041558 (= e!589902 e!589901)))

(declare-fun c!105648 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041558 (= c!105648 (validKeyInArray!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun d!125775 () Bool)

(declare-fun res!694196 () Bool)

(assert (=> d!125775 (=> res!694196 e!589902)))

(assert (=> d!125775 (= res!694196 (bvsge #b00000000000000000000000000000000 (size!32101 lt!458903)))))

(assert (=> d!125775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458903 (mask!30387 thiss!1427)) e!589902)))

(assert (= (and d!125775 (not res!694196)) b!1041558))

(assert (= (and b!1041558 c!105648) b!1041560))

(assert (= (and b!1041558 (not c!105648)) b!1041557))

(assert (= (and b!1041560 res!694195) b!1041559))

(assert (= (or b!1041559 b!1041557) bm!44102))

(declare-fun m!960523 () Bool)

(assert (=> bm!44102 m!960523))

(assert (=> b!1041560 m!960519))

(declare-fun m!960525 () Bool)

(assert (=> b!1041560 m!960525))

(declare-fun m!960527 () Bool)

(assert (=> b!1041560 m!960527))

(assert (=> b!1041560 m!960519))

(declare-fun m!960529 () Bool)

(assert (=> b!1041560 m!960529))

(assert (=> b!1041558 m!960519))

(assert (=> b!1041558 m!960519))

(declare-fun m!960531 () Bool)

(assert (=> b!1041558 m!960531))

(assert (=> b!1041481 d!125775))

(declare-fun b!1041571 () Bool)

(declare-fun e!589908 () Bool)

(assert (=> b!1041571 (= e!589908 (bvslt (size!32101 (_keys!11591 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041570 () Bool)

(declare-fun res!694206 () Bool)

(assert (=> b!1041570 (=> (not res!694206) (not e!589908))))

(assert (=> b!1041570 (= res!694206 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041569 () Bool)

(declare-fun res!694208 () Bool)

(assert (=> b!1041569 (=> (not res!694208) (not e!589908))))

(assert (=> b!1041569 (= res!694208 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900))))))

(declare-fun d!125777 () Bool)

(declare-fun e!589909 () Bool)

(assert (=> d!125777 e!589909))

(declare-fun res!694207 () Bool)

(assert (=> d!125777 (=> (not res!694207) (not e!589909))))

(assert (=> d!125777 (= res!694207 (and (bvsge (index!41600 lt!458900) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458900) (size!32101 (_keys!11591 thiss!1427)))))))

(declare-fun lt!458953 () Unit!33921)

(declare-fun choose!82 (array!65613 (_ BitVec 32) (_ BitVec 64)) Unit!33921)

(assert (=> d!125777 (= lt!458953 (choose!82 (_keys!11591 thiss!1427) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125777 e!589908))

(declare-fun res!694205 () Bool)

(assert (=> d!125777 (=> (not res!694205) (not e!589908))))

(assert (=> d!125777 (= res!694205 (and (bvsge (index!41600 lt!458900) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458900) (size!32101 (_keys!11591 thiss!1427)))))))

(assert (=> d!125777 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458953)))

(declare-fun b!1041572 () Bool)

(assert (=> b!1041572 (= e!589909 (= (arrayCountValidKeys!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125777 res!694205) b!1041569))

(assert (= (and b!1041569 res!694208) b!1041570))

(assert (= (and b!1041570 res!694206) b!1041571))

(assert (= (and d!125777 res!694207) b!1041572))

(declare-fun m!960533 () Bool)

(assert (=> b!1041570 m!960533))

(declare-fun m!960535 () Bool)

(assert (=> b!1041569 m!960535))

(assert (=> b!1041569 m!960535))

(declare-fun m!960537 () Bool)

(assert (=> b!1041569 m!960537))

(declare-fun m!960539 () Bool)

(assert (=> d!125777 m!960539))

(assert (=> b!1041572 m!960437))

(declare-fun m!960541 () Bool)

(assert (=> b!1041572 m!960541))

(assert (=> b!1041572 m!960423))

(assert (=> b!1041481 d!125777))

(declare-fun bm!44105 () Bool)

(declare-fun call!44108 () Bool)

(declare-fun c!105651 () Bool)

(assert (=> bm!44105 (= call!44108 (arrayNoDuplicates!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105651 (Cons!22002 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) Nil!22003) Nil!22003)))))

(declare-fun b!1041583 () Bool)

(declare-fun e!589920 () Bool)

(assert (=> b!1041583 (= e!589920 call!44108)))

(declare-fun b!1041584 () Bool)

(assert (=> b!1041584 (= e!589920 call!44108)))

(declare-fun d!125779 () Bool)

(declare-fun res!694217 () Bool)

(declare-fun e!589921 () Bool)

(assert (=> d!125779 (=> res!694217 e!589921)))

(assert (=> d!125779 (= res!694217 (bvsge #b00000000000000000000000000000000 (size!32101 lt!458903)))))

(assert (=> d!125779 (= (arrayNoDuplicates!0 lt!458903 #b00000000000000000000000000000000 Nil!22003) e!589921)))

(declare-fun b!1041585 () Bool)

(declare-fun e!589918 () Bool)

(declare-fun contains!6035 (List!22006 (_ BitVec 64)) Bool)

(assert (=> b!1041585 (= e!589918 (contains!6035 Nil!22003 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun b!1041586 () Bool)

(declare-fun e!589919 () Bool)

(assert (=> b!1041586 (= e!589921 e!589919)))

(declare-fun res!694216 () Bool)

(assert (=> b!1041586 (=> (not res!694216) (not e!589919))))

(assert (=> b!1041586 (= res!694216 (not e!589918))))

(declare-fun res!694215 () Bool)

(assert (=> b!1041586 (=> (not res!694215) (not e!589918))))

(assert (=> b!1041586 (= res!694215 (validKeyInArray!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun b!1041587 () Bool)

(assert (=> b!1041587 (= e!589919 e!589920)))

(assert (=> b!1041587 (= c!105651 (validKeyInArray!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(assert (= (and d!125779 (not res!694217)) b!1041586))

(assert (= (and b!1041586 res!694215) b!1041585))

(assert (= (and b!1041586 res!694216) b!1041587))

(assert (= (and b!1041587 c!105651) b!1041584))

(assert (= (and b!1041587 (not c!105651)) b!1041583))

(assert (= (or b!1041584 b!1041583) bm!44105))

(assert (=> bm!44105 m!960519))

(declare-fun m!960543 () Bool)

(assert (=> bm!44105 m!960543))

(assert (=> b!1041585 m!960519))

(assert (=> b!1041585 m!960519))

(declare-fun m!960545 () Bool)

(assert (=> b!1041585 m!960545))

(assert (=> b!1041586 m!960519))

(assert (=> b!1041586 m!960519))

(assert (=> b!1041586 m!960531))

(assert (=> b!1041587 m!960519))

(assert (=> b!1041587 m!960519))

(assert (=> b!1041587 m!960531))

(assert (=> b!1041481 d!125779))

(declare-fun d!125781 () Bool)

(declare-fun e!589924 () Bool)

(assert (=> d!125781 e!589924))

(declare-fun res!694220 () Bool)

(assert (=> d!125781 (=> (not res!694220) (not e!589924))))

(assert (=> d!125781 (= res!694220 (and (bvsge (index!41600 lt!458900) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458900) (size!32101 (_keys!11591 thiss!1427)))))))

(declare-fun lt!458956 () Unit!33921)

(declare-fun choose!25 (array!65613 (_ BitVec 32) (_ BitVec 32)) Unit!33921)

(assert (=> d!125781 (= lt!458956 (choose!25 (_keys!11591 thiss!1427) (index!41600 lt!458900) (mask!30387 thiss!1427)))))

(assert (=> d!125781 (validMask!0 (mask!30387 thiss!1427))))

(assert (=> d!125781 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) (mask!30387 thiss!1427)) lt!458956)))

(declare-fun b!1041590 () Bool)

(assert (=> b!1041590 (= e!589924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (mask!30387 thiss!1427)))))

(assert (= (and d!125781 res!694220) b!1041590))

(declare-fun m!960547 () Bool)

(assert (=> d!125781 m!960547))

(assert (=> d!125781 m!960419))

(assert (=> b!1041590 m!960437))

(declare-fun m!960549 () Bool)

(assert (=> b!1041590 m!960549))

(assert (=> b!1041481 d!125781))

(declare-fun d!125783 () Bool)

(declare-fun e!589927 () Bool)

(assert (=> d!125783 e!589927))

(declare-fun res!694223 () Bool)

(assert (=> d!125783 (=> (not res!694223) (not e!589927))))

(assert (=> d!125783 (= res!694223 (bvslt (index!41600 lt!458900) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun lt!458959 () Unit!33921)

(declare-fun choose!121 (array!65613 (_ BitVec 32) (_ BitVec 64)) Unit!33921)

(assert (=> d!125783 (= lt!458959 (choose!121 (_keys!11591 thiss!1427) (index!41600 lt!458900) key!909))))

(assert (=> d!125783 (bvsge (index!41600 lt!458900) #b00000000000000000000000000000000)))

(assert (=> d!125783 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11591 thiss!1427) (index!41600 lt!458900) key!909) lt!458959)))

(declare-fun b!1041593 () Bool)

(assert (=> b!1041593 (= e!589927 (not (arrayContainsKey!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125783 res!694223) b!1041593))

(declare-fun m!960551 () Bool)

(assert (=> d!125783 m!960551))

(assert (=> b!1041593 m!960437))

(declare-fun m!960553 () Bool)

(assert (=> b!1041593 m!960553))

(assert (=> b!1041481 d!125783))

(declare-fun b!1041602 () Bool)

(declare-fun e!589933 () (_ BitVec 32))

(assert (=> b!1041602 (= e!589933 #b00000000000000000000000000000000)))

(declare-fun b!1041603 () Bool)

(declare-fun e!589932 () (_ BitVec 32))

(declare-fun call!44111 () (_ BitVec 32))

(assert (=> b!1041603 (= e!589932 call!44111)))

(declare-fun b!1041604 () Bool)

(assert (=> b!1041604 (= e!589932 (bvadd #b00000000000000000000000000000001 call!44111))))

(declare-fun b!1041605 () Bool)

(assert (=> b!1041605 (= e!589933 e!589932)))

(declare-fun c!105656 () Bool)

(assert (=> b!1041605 (= c!105656 (validKeyInArray!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun bm!44108 () Bool)

(assert (=> bm!44108 (= call!44111 (arrayCountValidKeys!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun d!125785 () Bool)

(declare-fun lt!458962 () (_ BitVec 32))

(assert (=> d!125785 (and (bvsge lt!458962 #b00000000000000000000000000000000) (bvsle lt!458962 (bvsub (size!32101 lt!458903) #b00000000000000000000000000000000)))))

(assert (=> d!125785 (= lt!458962 e!589933)))

(declare-fun c!105657 () Bool)

(assert (=> d!125785 (= c!105657 (bvsge #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125785 (and (bvsle #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32101 (_keys!11591 thiss!1427)) (size!32101 lt!458903)))))

(assert (=> d!125785 (= (arrayCountValidKeys!0 lt!458903 #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) lt!458962)))

(assert (= (and d!125785 c!105657) b!1041602))

(assert (= (and d!125785 (not c!105657)) b!1041605))

(assert (= (and b!1041605 c!105656) b!1041604))

(assert (= (and b!1041605 (not c!105656)) b!1041603))

(assert (= (or b!1041604 b!1041603) bm!44108))

(assert (=> b!1041605 m!960519))

(assert (=> b!1041605 m!960519))

(assert (=> b!1041605 m!960531))

(declare-fun m!960555 () Bool)

(assert (=> bm!44108 m!960555))

(assert (=> b!1041481 d!125785))

(declare-fun b!1041606 () Bool)

(declare-fun e!589935 () (_ BitVec 32))

(assert (=> b!1041606 (= e!589935 #b00000000000000000000000000000000)))

(declare-fun b!1041607 () Bool)

(declare-fun e!589934 () (_ BitVec 32))

(declare-fun call!44112 () (_ BitVec 32))

(assert (=> b!1041607 (= e!589934 call!44112)))

(declare-fun b!1041608 () Bool)

(assert (=> b!1041608 (= e!589934 (bvadd #b00000000000000000000000000000001 call!44112))))

(declare-fun b!1041609 () Bool)

(assert (=> b!1041609 (= e!589935 e!589934)))

(declare-fun c!105658 () Bool)

(assert (=> b!1041609 (= c!105658 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44109 () Bool)

(assert (=> bm!44109 (= call!44112 (arrayCountValidKeys!0 (_keys!11591 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun d!125787 () Bool)

(declare-fun lt!458963 () (_ BitVec 32))

(assert (=> d!125787 (and (bvsge lt!458963 #b00000000000000000000000000000000) (bvsle lt!458963 (bvsub (size!32101 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125787 (= lt!458963 e!589935)))

(declare-fun c!105659 () Bool)

(assert (=> d!125787 (= c!105659 (bvsge #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125787 (and (bvsle #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32101 (_keys!11591 thiss!1427)) (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125787 (= (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) lt!458963)))

(assert (= (and d!125787 c!105659) b!1041606))

(assert (= (and d!125787 (not c!105659)) b!1041609))

(assert (= (and b!1041609 c!105658) b!1041608))

(assert (= (and b!1041609 (not c!105658)) b!1041607))

(assert (= (or b!1041608 b!1041607) bm!44109))

(declare-fun m!960557 () Bool)

(assert (=> b!1041609 m!960557))

(assert (=> b!1041609 m!960557))

(declare-fun m!960559 () Bool)

(assert (=> b!1041609 m!960559))

(declare-fun m!960561 () Bool)

(assert (=> bm!44109 m!960561))

(assert (=> b!1041481 d!125787))

(declare-fun d!125789 () Bool)

(assert (=> d!125789 (= (validMask!0 (mask!30387 thiss!1427)) (and (or (= (mask!30387 thiss!1427) #b00000000000000000000000000000111) (= (mask!30387 thiss!1427) #b00000000000000000000000000001111) (= (mask!30387 thiss!1427) #b00000000000000000000000000011111) (= (mask!30387 thiss!1427) #b00000000000000000000000000111111) (= (mask!30387 thiss!1427) #b00000000000000000000000001111111) (= (mask!30387 thiss!1427) #b00000000000000000000000011111111) (= (mask!30387 thiss!1427) #b00000000000000000000000111111111) (= (mask!30387 thiss!1427) #b00000000000000000000001111111111) (= (mask!30387 thiss!1427) #b00000000000000000000011111111111) (= (mask!30387 thiss!1427) #b00000000000000000000111111111111) (= (mask!30387 thiss!1427) #b00000000000000000001111111111111) (= (mask!30387 thiss!1427) #b00000000000000000011111111111111) (= (mask!30387 thiss!1427) #b00000000000000000111111111111111) (= (mask!30387 thiss!1427) #b00000000000000001111111111111111) (= (mask!30387 thiss!1427) #b00000000000000011111111111111111) (= (mask!30387 thiss!1427) #b00000000000000111111111111111111) (= (mask!30387 thiss!1427) #b00000000000001111111111111111111) (= (mask!30387 thiss!1427) #b00000000000011111111111111111111) (= (mask!30387 thiss!1427) #b00000000000111111111111111111111) (= (mask!30387 thiss!1427) #b00000000001111111111111111111111) (= (mask!30387 thiss!1427) #b00000000011111111111111111111111) (= (mask!30387 thiss!1427) #b00000000111111111111111111111111) (= (mask!30387 thiss!1427) #b00000001111111111111111111111111) (= (mask!30387 thiss!1427) #b00000011111111111111111111111111) (= (mask!30387 thiss!1427) #b00000111111111111111111111111111) (= (mask!30387 thiss!1427) #b00001111111111111111111111111111) (= (mask!30387 thiss!1427) #b00011111111111111111111111111111) (= (mask!30387 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30387 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1041481 d!125789))

(declare-fun d!125791 () Bool)

(declare-fun e!589938 () Bool)

(assert (=> d!125791 e!589938))

(declare-fun res!694226 () Bool)

(assert (=> d!125791 (=> (not res!694226) (not e!589938))))

(assert (=> d!125791 (= res!694226 (and (bvsge (index!41600 lt!458900) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458900) (size!32101 (_keys!11591 thiss!1427)))))))

(declare-fun lt!458966 () Unit!33921)

(declare-fun choose!53 (array!65613 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22006) Unit!33921)

(assert (=> d!125791 (= lt!458966 (choose!53 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!458900) #b00000000000000000000000000000000 Nil!22003))))

(assert (=> d!125791 (bvslt (size!32101 (_keys!11591 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125791 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!458900) #b00000000000000000000000000000000 Nil!22003) lt!458966)))

(declare-fun b!1041612 () Bool)

(assert (=> b!1041612 (= e!589938 (arrayNoDuplicates!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 Nil!22003))))

(assert (= (and d!125791 res!694226) b!1041612))

(declare-fun m!960563 () Bool)

(assert (=> d!125791 m!960563))

(assert (=> b!1041612 m!960437))

(declare-fun m!960565 () Bool)

(assert (=> b!1041612 m!960565))

(assert (=> b!1041481 d!125791))

(declare-fun b!1041625 () Bool)

(declare-fun e!589945 () SeekEntryResult!9807)

(declare-fun lt!458976 () SeekEntryResult!9807)

(assert (=> b!1041625 (= e!589945 (ite ((_ is MissingVacant!9807) lt!458976) (MissingZero!9807 (index!41602 lt!458976)) lt!458976))))

(declare-fun lt!458978 () SeekEntryResult!9807)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65613 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1041625 (= lt!458976 (seekKeyOrZeroReturnVacant!0 (x!92990 lt!458978) (index!41601 lt!458978) (index!41601 lt!458978) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041626 () Bool)

(declare-fun e!589947 () SeekEntryResult!9807)

(declare-fun e!589946 () SeekEntryResult!9807)

(assert (=> b!1041626 (= e!589947 e!589946)))

(declare-fun lt!458975 () (_ BitVec 64))

(assert (=> b!1041626 (= lt!458975 (select (arr!31566 (_keys!11591 thiss!1427)) (index!41601 lt!458978)))))

(declare-fun c!105668 () Bool)

(assert (=> b!1041626 (= c!105668 (= lt!458975 key!909))))

(declare-fun b!1041627 () Bool)

(assert (=> b!1041627 (= e!589947 Undefined!9807)))

(declare-fun b!1041628 () Bool)

(assert (=> b!1041628 (= e!589945 (MissingZero!9807 (index!41601 lt!458978)))))

(declare-fun d!125793 () Bool)

(declare-fun lt!458977 () SeekEntryResult!9807)

(assert (=> d!125793 (and (or ((_ is MissingVacant!9807) lt!458977) (not ((_ is Found!9807) lt!458977)) (and (bvsge (index!41600 lt!458977) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458977) (size!32101 (_keys!11591 thiss!1427))))) (not ((_ is MissingVacant!9807) lt!458977)) (or (not ((_ is Found!9807) lt!458977)) (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458977)) key!909)))))

(assert (=> d!125793 (= lt!458977 e!589947)))

(declare-fun c!105666 () Bool)

(assert (=> d!125793 (= c!105666 (and ((_ is Intermediate!9807) lt!458978) (undefined!10619 lt!458978)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65613 (_ BitVec 32)) SeekEntryResult!9807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125793 (= lt!458978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30387 thiss!1427)) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(assert (=> d!125793 (validMask!0 (mask!30387 thiss!1427))))

(assert (=> d!125793 (= (seekEntry!0 key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)) lt!458977)))

(declare-fun b!1041629 () Bool)

(declare-fun c!105667 () Bool)

(assert (=> b!1041629 (= c!105667 (= lt!458975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041629 (= e!589946 e!589945)))

(declare-fun b!1041630 () Bool)

(assert (=> b!1041630 (= e!589946 (Found!9807 (index!41601 lt!458978)))))

(assert (= (and d!125793 c!105666) b!1041627))

(assert (= (and d!125793 (not c!105666)) b!1041626))

(assert (= (and b!1041626 c!105668) b!1041630))

(assert (= (and b!1041626 (not c!105668)) b!1041629))

(assert (= (and b!1041629 c!105667) b!1041628))

(assert (= (and b!1041629 (not c!105667)) b!1041625))

(declare-fun m!960567 () Bool)

(assert (=> b!1041625 m!960567))

(declare-fun m!960569 () Bool)

(assert (=> b!1041626 m!960569))

(declare-fun m!960571 () Bool)

(assert (=> d!125793 m!960571))

(declare-fun m!960573 () Bool)

(assert (=> d!125793 m!960573))

(assert (=> d!125793 m!960573))

(declare-fun m!960575 () Bool)

(assert (=> d!125793 m!960575))

(assert (=> d!125793 m!960419))

(assert (=> b!1041480 d!125793))

(declare-fun condMapEmpty!38751 () Bool)

(declare-fun mapDefault!38751 () ValueCell!11678)

(assert (=> mapNonEmpty!38742 (= condMapEmpty!38751 (= mapRest!38742 ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38751)))))

(declare-fun e!589952 () Bool)

(declare-fun mapRes!38751 () Bool)

(assert (=> mapNonEmpty!38742 (= tp!74344 (and e!589952 mapRes!38751))))

(declare-fun b!1041637 () Bool)

(declare-fun e!589953 () Bool)

(assert (=> b!1041637 (= e!589953 tp_is_empty!24763)))

(declare-fun mapNonEmpty!38751 () Bool)

(declare-fun tp!74359 () Bool)

(assert (=> mapNonEmpty!38751 (= mapRes!38751 (and tp!74359 e!589953))))

(declare-fun mapValue!38751 () ValueCell!11678)

(declare-fun mapKey!38751 () (_ BitVec 32))

(declare-fun mapRest!38751 () (Array (_ BitVec 32) ValueCell!11678))

(assert (=> mapNonEmpty!38751 (= mapRest!38742 (store mapRest!38751 mapKey!38751 mapValue!38751))))

(declare-fun b!1041638 () Bool)

(assert (=> b!1041638 (= e!589952 tp_is_empty!24763)))

(declare-fun mapIsEmpty!38751 () Bool)

(assert (=> mapIsEmpty!38751 mapRes!38751))

(assert (= (and mapNonEmpty!38742 condMapEmpty!38751) mapIsEmpty!38751))

(assert (= (and mapNonEmpty!38742 (not condMapEmpty!38751)) mapNonEmpty!38751))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11678) mapValue!38751)) b!1041637))

(assert (= (and mapNonEmpty!38742 ((_ is ValueCellFull!11678) mapDefault!38751)) b!1041638))

(declare-fun m!960577 () Bool)

(assert (=> mapNonEmpty!38751 m!960577))

(check-sat (not b!1041570) (not b!1041542) (not mapNonEmpty!38751) (not d!125793) (not b!1041586) (not b!1041585) (not b!1041558) (not b!1041560) tp_is_empty!24763 (not b!1041593) (not d!125783) b_and!33549 (not b!1041541) (not b!1041587) (not d!125781) (not bm!44109) (not b!1041572) (not bm!44102) (not b!1041609) (not d!125771) (not d!125777) (not b_next!21043) (not b!1041540) (not b!1041625) (not d!125791) (not bm!44108) (not b!1041569) (not b!1041605) (not b!1041590) (not b!1041548) (not b!1041612) (not bm!44105))
(check-sat b_and!33549 (not b_next!21043))
(get-model)

(declare-fun call!44113 () Bool)

(declare-fun bm!44110 () Bool)

(declare-fun c!105669 () Bool)

(assert (=> bm!44110 (= call!44113 (arrayNoDuplicates!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105669 (Cons!22002 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105651 (Cons!22002 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) Nil!22003) Nil!22003)) (ite c!105651 (Cons!22002 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) Nil!22003) Nil!22003))))))

(declare-fun b!1041639 () Bool)

(declare-fun e!589956 () Bool)

(assert (=> b!1041639 (= e!589956 call!44113)))

(declare-fun b!1041640 () Bool)

(assert (=> b!1041640 (= e!589956 call!44113)))

(declare-fun d!125795 () Bool)

(declare-fun res!694229 () Bool)

(declare-fun e!589957 () Bool)

(assert (=> d!125795 (=> res!694229 e!589957)))

(assert (=> d!125795 (= res!694229 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 lt!458903)))))

(assert (=> d!125795 (= (arrayNoDuplicates!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105651 (Cons!22002 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) Nil!22003) Nil!22003)) e!589957)))

(declare-fun b!1041641 () Bool)

(declare-fun e!589954 () Bool)

(assert (=> b!1041641 (= e!589954 (contains!6035 (ite c!105651 (Cons!22002 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) Nil!22003) Nil!22003) (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041642 () Bool)

(declare-fun e!589955 () Bool)

(assert (=> b!1041642 (= e!589957 e!589955)))

(declare-fun res!694228 () Bool)

(assert (=> b!1041642 (=> (not res!694228) (not e!589955))))

(assert (=> b!1041642 (= res!694228 (not e!589954))))

(declare-fun res!694227 () Bool)

(assert (=> b!1041642 (=> (not res!694227) (not e!589954))))

(assert (=> b!1041642 (= res!694227 (validKeyInArray!0 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041643 () Bool)

(assert (=> b!1041643 (= e!589955 e!589956)))

(assert (=> b!1041643 (= c!105669 (validKeyInArray!0 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125795 (not res!694229)) b!1041642))

(assert (= (and b!1041642 res!694227) b!1041641))

(assert (= (and b!1041642 res!694228) b!1041643))

(assert (= (and b!1041643 c!105669) b!1041640))

(assert (= (and b!1041643 (not c!105669)) b!1041639))

(assert (= (or b!1041640 b!1041639) bm!44110))

(declare-fun m!960579 () Bool)

(assert (=> bm!44110 m!960579))

(declare-fun m!960581 () Bool)

(assert (=> bm!44110 m!960581))

(assert (=> b!1041641 m!960579))

(assert (=> b!1041641 m!960579))

(declare-fun m!960583 () Bool)

(assert (=> b!1041641 m!960583))

(assert (=> b!1041642 m!960579))

(assert (=> b!1041642 m!960579))

(declare-fun m!960585 () Bool)

(assert (=> b!1041642 m!960585))

(assert (=> b!1041643 m!960579))

(assert (=> b!1041643 m!960579))

(assert (=> b!1041643 m!960585))

(assert (=> bm!44105 d!125795))

(declare-fun d!125797 () Bool)

(assert (=> d!125797 (arrayContainsKey!0 lt!458903 lt!458950 #b00000000000000000000000000000000)))

(declare-fun lt!458981 () Unit!33921)

(declare-fun choose!13 (array!65613 (_ BitVec 64) (_ BitVec 32)) Unit!33921)

(assert (=> d!125797 (= lt!458981 (choose!13 lt!458903 lt!458950 #b00000000000000000000000000000000))))

(assert (=> d!125797 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125797 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458903 lt!458950 #b00000000000000000000000000000000) lt!458981)))

(declare-fun bs!30437 () Bool)

(assert (= bs!30437 d!125797))

(assert (=> bs!30437 m!960527))

(declare-fun m!960587 () Bool)

(assert (=> bs!30437 m!960587))

(assert (=> b!1041560 d!125797))

(declare-fun d!125799 () Bool)

(declare-fun res!694230 () Bool)

(declare-fun e!589958 () Bool)

(assert (=> d!125799 (=> res!694230 e!589958)))

(assert (=> d!125799 (= res!694230 (= (select (arr!31566 lt!458903) #b00000000000000000000000000000000) lt!458950))))

(assert (=> d!125799 (= (arrayContainsKey!0 lt!458903 lt!458950 #b00000000000000000000000000000000) e!589958)))

(declare-fun b!1041644 () Bool)

(declare-fun e!589959 () Bool)

(assert (=> b!1041644 (= e!589958 e!589959)))

(declare-fun res!694231 () Bool)

(assert (=> b!1041644 (=> (not res!694231) (not e!589959))))

(assert (=> b!1041644 (= res!694231 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 lt!458903)))))

(declare-fun b!1041645 () Bool)

(assert (=> b!1041645 (= e!589959 (arrayContainsKey!0 lt!458903 lt!458950 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125799 (not res!694230)) b!1041644))

(assert (= (and b!1041644 res!694231) b!1041645))

(assert (=> d!125799 m!960519))

(declare-fun m!960589 () Bool)

(assert (=> b!1041645 m!960589))

(assert (=> b!1041560 d!125799))

(declare-fun b!1041658 () Bool)

(declare-fun e!589966 () SeekEntryResult!9807)

(declare-fun lt!458988 () SeekEntryResult!9807)

(assert (=> b!1041658 (= e!589966 (MissingZero!9807 (index!41601 lt!458988)))))

(declare-fun d!125801 () Bool)

(declare-fun lt!458989 () SeekEntryResult!9807)

(assert (=> d!125801 (and (or ((_ is Undefined!9807) lt!458989) (not ((_ is Found!9807) lt!458989)) (and (bvsge (index!41600 lt!458989) #b00000000000000000000000000000000) (bvslt (index!41600 lt!458989) (size!32101 lt!458903)))) (or ((_ is Undefined!9807) lt!458989) ((_ is Found!9807) lt!458989) (not ((_ is MissingZero!9807) lt!458989)) (and (bvsge (index!41599 lt!458989) #b00000000000000000000000000000000) (bvslt (index!41599 lt!458989) (size!32101 lt!458903)))) (or ((_ is Undefined!9807) lt!458989) ((_ is Found!9807) lt!458989) ((_ is MissingZero!9807) lt!458989) (not ((_ is MissingVacant!9807) lt!458989)) (and (bvsge (index!41602 lt!458989) #b00000000000000000000000000000000) (bvslt (index!41602 lt!458989) (size!32101 lt!458903)))) (or ((_ is Undefined!9807) lt!458989) (ite ((_ is Found!9807) lt!458989) (= (select (arr!31566 lt!458903) (index!41600 lt!458989)) (select (arr!31566 lt!458903) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9807) lt!458989) (= (select (arr!31566 lt!458903) (index!41599 lt!458989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9807) lt!458989) (= (select (arr!31566 lt!458903) (index!41602 lt!458989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!589967 () SeekEntryResult!9807)

(assert (=> d!125801 (= lt!458989 e!589967)))

(declare-fun c!105678 () Bool)

(assert (=> d!125801 (= c!105678 (and ((_ is Intermediate!9807) lt!458988) (undefined!10619 lt!458988)))))

(assert (=> d!125801 (= lt!458988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) (mask!30387 thiss!1427)) (select (arr!31566 lt!458903) #b00000000000000000000000000000000) lt!458903 (mask!30387 thiss!1427)))))

(assert (=> d!125801 (validMask!0 (mask!30387 thiss!1427))))

(assert (=> d!125801 (= (seekEntryOrOpen!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000) lt!458903 (mask!30387 thiss!1427)) lt!458989)))

(declare-fun b!1041659 () Bool)

(assert (=> b!1041659 (= e!589966 (seekKeyOrZeroReturnVacant!0 (x!92990 lt!458988) (index!41601 lt!458988) (index!41601 lt!458988) (select (arr!31566 lt!458903) #b00000000000000000000000000000000) lt!458903 (mask!30387 thiss!1427)))))

(declare-fun b!1041660 () Bool)

(declare-fun c!105677 () Bool)

(declare-fun lt!458990 () (_ BitVec 64))

(assert (=> b!1041660 (= c!105677 (= lt!458990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589968 () SeekEntryResult!9807)

(assert (=> b!1041660 (= e!589968 e!589966)))

(declare-fun b!1041661 () Bool)

(assert (=> b!1041661 (= e!589967 Undefined!9807)))

(declare-fun b!1041662 () Bool)

(assert (=> b!1041662 (= e!589968 (Found!9807 (index!41601 lt!458988)))))

(declare-fun b!1041663 () Bool)

(assert (=> b!1041663 (= e!589967 e!589968)))

(assert (=> b!1041663 (= lt!458990 (select (arr!31566 lt!458903) (index!41601 lt!458988)))))

(declare-fun c!105676 () Bool)

(assert (=> b!1041663 (= c!105676 (= lt!458990 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(assert (= (and d!125801 c!105678) b!1041661))

(assert (= (and d!125801 (not c!105678)) b!1041663))

(assert (= (and b!1041663 c!105676) b!1041662))

(assert (= (and b!1041663 (not c!105676)) b!1041660))

(assert (= (and b!1041660 c!105677) b!1041658))

(assert (= (and b!1041660 (not c!105677)) b!1041659))

(declare-fun m!960591 () Bool)

(assert (=> d!125801 m!960591))

(declare-fun m!960593 () Bool)

(assert (=> d!125801 m!960593))

(assert (=> d!125801 m!960519))

(declare-fun m!960595 () Bool)

(assert (=> d!125801 m!960595))

(assert (=> d!125801 m!960595))

(assert (=> d!125801 m!960519))

(declare-fun m!960597 () Bool)

(assert (=> d!125801 m!960597))

(declare-fun m!960599 () Bool)

(assert (=> d!125801 m!960599))

(assert (=> d!125801 m!960419))

(assert (=> b!1041659 m!960519))

(declare-fun m!960601 () Bool)

(assert (=> b!1041659 m!960601))

(declare-fun m!960603 () Bool)

(assert (=> b!1041663 m!960603))

(assert (=> b!1041560 d!125801))

(declare-fun b!1041682 () Bool)

(declare-fun e!589979 () SeekEntryResult!9807)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041682 (= e!589979 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30387 thiss!1427)) #b00000000000000000000000000000000 (mask!30387 thiss!1427)) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041683 () Bool)

(declare-fun e!589982 () SeekEntryResult!9807)

(assert (=> b!1041683 (= e!589982 e!589979)))

(declare-fun c!105687 () Bool)

(declare-fun lt!458995 () (_ BitVec 64))

(assert (=> b!1041683 (= c!105687 (or (= lt!458995 key!909) (= (bvadd lt!458995 lt!458995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041684 () Bool)

(declare-fun lt!458996 () SeekEntryResult!9807)

(assert (=> b!1041684 (and (bvsge (index!41601 lt!458996) #b00000000000000000000000000000000) (bvslt (index!41601 lt!458996) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun res!694238 () Bool)

(assert (=> b!1041684 (= res!694238 (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41601 lt!458996)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589980 () Bool)

(assert (=> b!1041684 (=> res!694238 e!589980)))

(declare-fun b!1041685 () Bool)

(declare-fun e!589981 () Bool)

(declare-fun e!589983 () Bool)

(assert (=> b!1041685 (= e!589981 e!589983)))

(declare-fun res!694240 () Bool)

(assert (=> b!1041685 (= res!694240 (and ((_ is Intermediate!9807) lt!458996) (not (undefined!10619 lt!458996)) (bvslt (x!92990 lt!458996) #b01111111111111111111111111111110) (bvsge (x!92990 lt!458996) #b00000000000000000000000000000000) (bvsge (x!92990 lt!458996) #b00000000000000000000000000000000)))))

(assert (=> b!1041685 (=> (not res!694240) (not e!589983))))

(declare-fun b!1041686 () Bool)

(assert (=> b!1041686 (= e!589982 (Intermediate!9807 true (toIndex!0 key!909 (mask!30387 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1041687 () Bool)

(assert (=> b!1041687 (= e!589981 (bvsge (x!92990 lt!458996) #b01111111111111111111111111111110))))

(declare-fun b!1041688 () Bool)

(assert (=> b!1041688 (= e!589979 (Intermediate!9807 false (toIndex!0 key!909 (mask!30387 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!125803 () Bool)

(assert (=> d!125803 e!589981))

(declare-fun c!105686 () Bool)

(assert (=> d!125803 (= c!105686 (and ((_ is Intermediate!9807) lt!458996) (undefined!10619 lt!458996)))))

(assert (=> d!125803 (= lt!458996 e!589982)))

(declare-fun c!105685 () Bool)

(assert (=> d!125803 (= c!105685 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125803 (= lt!458995 (select (arr!31566 (_keys!11591 thiss!1427)) (toIndex!0 key!909 (mask!30387 thiss!1427))))))

(assert (=> d!125803 (validMask!0 (mask!30387 thiss!1427))))

(assert (=> d!125803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30387 thiss!1427)) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)) lt!458996)))

(declare-fun b!1041689 () Bool)

(assert (=> b!1041689 (and (bvsge (index!41601 lt!458996) #b00000000000000000000000000000000) (bvslt (index!41601 lt!458996) (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> b!1041689 (= e!589980 (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41601 lt!458996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041690 () Bool)

(assert (=> b!1041690 (and (bvsge (index!41601 lt!458996) #b00000000000000000000000000000000) (bvslt (index!41601 lt!458996) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun res!694239 () Bool)

(assert (=> b!1041690 (= res!694239 (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41601 lt!458996)) key!909))))

(assert (=> b!1041690 (=> res!694239 e!589980)))

(assert (=> b!1041690 (= e!589983 e!589980)))

(assert (= (and d!125803 c!105685) b!1041686))

(assert (= (and d!125803 (not c!105685)) b!1041683))

(assert (= (and b!1041683 c!105687) b!1041688))

(assert (= (and b!1041683 (not c!105687)) b!1041682))

(assert (= (and d!125803 c!105686) b!1041687))

(assert (= (and d!125803 (not c!105686)) b!1041685))

(assert (= (and b!1041685 res!694240) b!1041690))

(assert (= (and b!1041690 (not res!694239)) b!1041684))

(assert (= (and b!1041684 (not res!694238)) b!1041689))

(assert (=> b!1041682 m!960573))

(declare-fun m!960605 () Bool)

(assert (=> b!1041682 m!960605))

(assert (=> b!1041682 m!960605))

(declare-fun m!960607 () Bool)

(assert (=> b!1041682 m!960607))

(declare-fun m!960609 () Bool)

(assert (=> b!1041689 m!960609))

(assert (=> d!125803 m!960573))

(declare-fun m!960611 () Bool)

(assert (=> d!125803 m!960611))

(assert (=> d!125803 m!960419))

(assert (=> b!1041690 m!960609))

(assert (=> b!1041684 m!960609))

(assert (=> d!125793 d!125803))

(declare-fun d!125805 () Bool)

(declare-fun lt!459002 () (_ BitVec 32))

(declare-fun lt!459001 () (_ BitVec 32))

(assert (=> d!125805 (= lt!459002 (bvmul (bvxor lt!459001 (bvlshr lt!459001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125805 (= lt!459001 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125805 (and (bvsge (mask!30387 thiss!1427) #b00000000000000000000000000000000) (let ((res!694241 (let ((h!23211 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!93008 (bvmul (bvxor h!23211 (bvlshr h!23211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!93008 (bvlshr x!93008 #b00000000000000000000000000001101)) (mask!30387 thiss!1427)))))) (and (bvslt res!694241 (bvadd (mask!30387 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694241 #b00000000000000000000000000000000))))))

(assert (=> d!125805 (= (toIndex!0 key!909 (mask!30387 thiss!1427)) (bvand (bvxor lt!459002 (bvlshr lt!459002 #b00000000000000000000000000001101)) (mask!30387 thiss!1427)))))

(assert (=> d!125793 d!125805))

(assert (=> d!125793 d!125789))

(declare-fun b!1041691 () Bool)

(declare-fun e!589984 () Bool)

(declare-fun call!44114 () Bool)

(assert (=> b!1041691 (= e!589984 call!44114)))

(declare-fun bm!44111 () Bool)

(assert (=> bm!44111 (= call!44114 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041693 () Bool)

(declare-fun e!589986 () Bool)

(assert (=> b!1041693 (= e!589986 call!44114)))

(declare-fun b!1041694 () Bool)

(assert (=> b!1041694 (= e!589984 e!589986)))

(declare-fun lt!459005 () (_ BitVec 64))

(assert (=> b!1041694 (= lt!459005 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459003 () Unit!33921)

(assert (=> b!1041694 (= lt!459003 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11591 thiss!1427) lt!459005 #b00000000000000000000000000000000))))

(assert (=> b!1041694 (arrayContainsKey!0 (_keys!11591 thiss!1427) lt!459005 #b00000000000000000000000000000000)))

(declare-fun lt!459004 () Unit!33921)

(assert (=> b!1041694 (= lt!459004 lt!459003)))

(declare-fun res!694242 () Bool)

(assert (=> b!1041694 (= res!694242 (= (seekEntryOrOpen!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000) (_keys!11591 thiss!1427) (mask!30387 thiss!1427)) (Found!9807 #b00000000000000000000000000000000)))))

(assert (=> b!1041694 (=> (not res!694242) (not e!589986))))

(declare-fun b!1041692 () Bool)

(declare-fun e!589985 () Bool)

(assert (=> b!1041692 (= e!589985 e!589984)))

(declare-fun c!105688 () Bool)

(assert (=> b!1041692 (= c!105688 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125807 () Bool)

(declare-fun res!694243 () Bool)

(assert (=> d!125807 (=> res!694243 e!589985)))

(assert (=> d!125807 (= res!694243 (bvsge #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)) e!589985)))

(assert (= (and d!125807 (not res!694243)) b!1041692))

(assert (= (and b!1041692 c!105688) b!1041694))

(assert (= (and b!1041692 (not c!105688)) b!1041691))

(assert (= (and b!1041694 res!694242) b!1041693))

(assert (= (or b!1041693 b!1041691) bm!44111))

(declare-fun m!960613 () Bool)

(assert (=> bm!44111 m!960613))

(assert (=> b!1041694 m!960557))

(declare-fun m!960615 () Bool)

(assert (=> b!1041694 m!960615))

(declare-fun m!960617 () Bool)

(assert (=> b!1041694 m!960617))

(assert (=> b!1041694 m!960557))

(declare-fun m!960619 () Bool)

(assert (=> b!1041694 m!960619))

(assert (=> b!1041692 m!960557))

(assert (=> b!1041692 m!960557))

(assert (=> b!1041692 m!960559))

(assert (=> b!1041541 d!125807))

(declare-fun bm!44112 () Bool)

(declare-fun call!44115 () Bool)

(declare-fun c!105689 () Bool)

(assert (=> bm!44112 (= call!44115 (arrayNoDuplicates!0 (_keys!11591 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105689 (Cons!22002 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000) Nil!22003) Nil!22003)))))

(declare-fun b!1041695 () Bool)

(declare-fun e!589989 () Bool)

(assert (=> b!1041695 (= e!589989 call!44115)))

(declare-fun b!1041696 () Bool)

(assert (=> b!1041696 (= e!589989 call!44115)))

(declare-fun d!125809 () Bool)

(declare-fun res!694246 () Bool)

(declare-fun e!589990 () Bool)

(assert (=> d!125809 (=> res!694246 e!589990)))

(assert (=> d!125809 (= res!694246 (bvsge #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125809 (= (arrayNoDuplicates!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 Nil!22003) e!589990)))

(declare-fun b!1041697 () Bool)

(declare-fun e!589987 () Bool)

(assert (=> b!1041697 (= e!589987 (contains!6035 Nil!22003 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041698 () Bool)

(declare-fun e!589988 () Bool)

(assert (=> b!1041698 (= e!589990 e!589988)))

(declare-fun res!694245 () Bool)

(assert (=> b!1041698 (=> (not res!694245) (not e!589988))))

(assert (=> b!1041698 (= res!694245 (not e!589987))))

(declare-fun res!694244 () Bool)

(assert (=> b!1041698 (=> (not res!694244) (not e!589987))))

(assert (=> b!1041698 (= res!694244 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041699 () Bool)

(assert (=> b!1041699 (= e!589988 e!589989)))

(assert (=> b!1041699 (= c!105689 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125809 (not res!694246)) b!1041698))

(assert (= (and b!1041698 res!694244) b!1041697))

(assert (= (and b!1041698 res!694245) b!1041699))

(assert (= (and b!1041699 c!105689) b!1041696))

(assert (= (and b!1041699 (not c!105689)) b!1041695))

(assert (= (or b!1041696 b!1041695) bm!44112))

(assert (=> bm!44112 m!960557))

(declare-fun m!960621 () Bool)

(assert (=> bm!44112 m!960621))

(assert (=> b!1041697 m!960557))

(assert (=> b!1041697 m!960557))

(declare-fun m!960623 () Bool)

(assert (=> b!1041697 m!960623))

(assert (=> b!1041698 m!960557))

(assert (=> b!1041698 m!960557))

(assert (=> b!1041698 m!960559))

(assert (=> b!1041699 m!960557))

(assert (=> b!1041699 m!960557))

(assert (=> b!1041699 m!960559))

(assert (=> b!1041542 d!125809))

(declare-fun d!125811 () Bool)

(assert (=> d!125811 (= (validKeyInArray!0 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)) (and (not (= (select (arr!31566 lt!458903) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31566 lt!458903) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041558 d!125811))

(assert (=> b!1041540 d!125787))

(declare-fun b!1041700 () Bool)

(declare-fun e!589991 () Bool)

(declare-fun call!44116 () Bool)

(assert (=> b!1041700 (= e!589991 call!44116)))

(declare-fun bm!44113 () Bool)

(assert (=> bm!44113 (= call!44116 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!458903 (mask!30387 thiss!1427)))))

(declare-fun b!1041702 () Bool)

(declare-fun e!589993 () Bool)

(assert (=> b!1041702 (= e!589993 call!44116)))

(declare-fun b!1041703 () Bool)

(assert (=> b!1041703 (= e!589991 e!589993)))

(declare-fun lt!459008 () (_ BitVec 64))

(assert (=> b!1041703 (= lt!459008 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459006 () Unit!33921)

(assert (=> b!1041703 (= lt!459006 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458903 lt!459008 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041703 (arrayContainsKey!0 lt!458903 lt!459008 #b00000000000000000000000000000000)))

(declare-fun lt!459007 () Unit!33921)

(assert (=> b!1041703 (= lt!459007 lt!459006)))

(declare-fun res!694247 () Bool)

(assert (=> b!1041703 (= res!694247 (= (seekEntryOrOpen!0 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!458903 (mask!30387 thiss!1427)) (Found!9807 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041703 (=> (not res!694247) (not e!589993))))

(declare-fun b!1041701 () Bool)

(declare-fun e!589992 () Bool)

(assert (=> b!1041701 (= e!589992 e!589991)))

(declare-fun c!105690 () Bool)

(assert (=> b!1041701 (= c!105690 (validKeyInArray!0 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125813 () Bool)

(declare-fun res!694248 () Bool)

(assert (=> d!125813 (=> res!694248 e!589992)))

(assert (=> d!125813 (= res!694248 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 lt!458903)))))

(assert (=> d!125813 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458903 (mask!30387 thiss!1427)) e!589992)))

(assert (= (and d!125813 (not res!694248)) b!1041701))

(assert (= (and b!1041701 c!105690) b!1041703))

(assert (= (and b!1041701 (not c!105690)) b!1041700))

(assert (= (and b!1041703 res!694247) b!1041702))

(assert (= (or b!1041702 b!1041700) bm!44113))

(declare-fun m!960625 () Bool)

(assert (=> bm!44113 m!960625))

(assert (=> b!1041703 m!960579))

(declare-fun m!960627 () Bool)

(assert (=> b!1041703 m!960627))

(declare-fun m!960629 () Bool)

(assert (=> b!1041703 m!960629))

(assert (=> b!1041703 m!960579))

(declare-fun m!960631 () Bool)

(assert (=> b!1041703 m!960631))

(assert (=> b!1041701 m!960579))

(assert (=> b!1041701 m!960579))

(assert (=> b!1041701 m!960585))

(assert (=> bm!44102 d!125813))

(declare-fun b!1041716 () Bool)

(declare-fun e!590001 () SeekEntryResult!9807)

(assert (=> b!1041716 (= e!590001 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92990 lt!458978) #b00000000000000000000000000000001) (nextIndex!0 (index!41601 lt!458978) (x!92990 lt!458978) (mask!30387 thiss!1427)) (index!41601 lt!458978) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)))))

(declare-fun b!1041717 () Bool)

(declare-fun e!590000 () SeekEntryResult!9807)

(assert (=> b!1041717 (= e!590000 Undefined!9807)))

(declare-fun lt!459013 () SeekEntryResult!9807)

(declare-fun d!125815 () Bool)

(assert (=> d!125815 (and (or ((_ is Undefined!9807) lt!459013) (not ((_ is Found!9807) lt!459013)) (and (bvsge (index!41600 lt!459013) #b00000000000000000000000000000000) (bvslt (index!41600 lt!459013) (size!32101 (_keys!11591 thiss!1427))))) (or ((_ is Undefined!9807) lt!459013) ((_ is Found!9807) lt!459013) (not ((_ is MissingVacant!9807) lt!459013)) (not (= (index!41602 lt!459013) (index!41601 lt!458978))) (and (bvsge (index!41602 lt!459013) #b00000000000000000000000000000000) (bvslt (index!41602 lt!459013) (size!32101 (_keys!11591 thiss!1427))))) (or ((_ is Undefined!9807) lt!459013) (ite ((_ is Found!9807) lt!459013) (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!459013)) key!909) (and ((_ is MissingVacant!9807) lt!459013) (= (index!41602 lt!459013) (index!41601 lt!458978)) (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41602 lt!459013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!125815 (= lt!459013 e!590000)))

(declare-fun c!105697 () Bool)

(assert (=> d!125815 (= c!105697 (bvsge (x!92990 lt!458978) #b01111111111111111111111111111110))))

(declare-fun lt!459014 () (_ BitVec 64))

(assert (=> d!125815 (= lt!459014 (select (arr!31566 (_keys!11591 thiss!1427)) (index!41601 lt!458978)))))

(assert (=> d!125815 (validMask!0 (mask!30387 thiss!1427))))

(assert (=> d!125815 (= (seekKeyOrZeroReturnVacant!0 (x!92990 lt!458978) (index!41601 lt!458978) (index!41601 lt!458978) key!909 (_keys!11591 thiss!1427) (mask!30387 thiss!1427)) lt!459013)))

(declare-fun b!1041718 () Bool)

(assert (=> b!1041718 (= e!590001 (MissingVacant!9807 (index!41601 lt!458978)))))

(declare-fun b!1041719 () Bool)

(declare-fun e!590002 () SeekEntryResult!9807)

(assert (=> b!1041719 (= e!590000 e!590002)))

(declare-fun c!105698 () Bool)

(assert (=> b!1041719 (= c!105698 (= lt!459014 key!909))))

(declare-fun b!1041720 () Bool)

(declare-fun c!105699 () Bool)

(assert (=> b!1041720 (= c!105699 (= lt!459014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041720 (= e!590002 e!590001)))

(declare-fun b!1041721 () Bool)

(assert (=> b!1041721 (= e!590002 (Found!9807 (index!41601 lt!458978)))))

(assert (= (and d!125815 c!105697) b!1041717))

(assert (= (and d!125815 (not c!105697)) b!1041719))

(assert (= (and b!1041719 c!105698) b!1041721))

(assert (= (and b!1041719 (not c!105698)) b!1041720))

(assert (= (and b!1041720 c!105699) b!1041718))

(assert (= (and b!1041720 (not c!105699)) b!1041716))

(declare-fun m!960633 () Bool)

(assert (=> b!1041716 m!960633))

(assert (=> b!1041716 m!960633))

(declare-fun m!960635 () Bool)

(assert (=> b!1041716 m!960635))

(declare-fun m!960637 () Bool)

(assert (=> d!125815 m!960637))

(declare-fun m!960639 () Bool)

(assert (=> d!125815 m!960639))

(assert (=> d!125815 m!960569))

(assert (=> d!125815 m!960419))

(assert (=> b!1041625 d!125815))

(assert (=> b!1041587 d!125811))

(declare-fun d!125817 () Bool)

(assert (=> d!125817 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1041570 d!125817))

(assert (=> b!1041586 d!125811))

(declare-fun d!125819 () Bool)

(assert (=> d!125819 (= (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900))) (and (not (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041569 d!125819))

(declare-fun d!125821 () Bool)

(assert (=> d!125821 (= (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31566 (_keys!11591 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041609 d!125821))

(declare-fun b!1041722 () Bool)

(declare-fun e!590004 () (_ BitVec 32))

(assert (=> b!1041722 (= e!590004 #b00000000000000000000000000000000)))

(declare-fun b!1041723 () Bool)

(declare-fun e!590003 () (_ BitVec 32))

(declare-fun call!44117 () (_ BitVec 32))

(assert (=> b!1041723 (= e!590003 call!44117)))

(declare-fun b!1041724 () Bool)

(assert (=> b!1041724 (= e!590003 (bvadd #b00000000000000000000000000000001 call!44117))))

(declare-fun b!1041725 () Bool)

(assert (=> b!1041725 (= e!590004 e!590003)))

(declare-fun c!105700 () Bool)

(assert (=> b!1041725 (= c!105700 (validKeyInArray!0 (select (arr!31566 (_keys!11591 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44114 () Bool)

(assert (=> bm!44114 (= call!44117 (arrayCountValidKeys!0 (_keys!11591 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun d!125823 () Bool)

(declare-fun lt!459015 () (_ BitVec 32))

(assert (=> d!125823 (and (bvsge lt!459015 #b00000000000000000000000000000000) (bvsle lt!459015 (bvsub (size!32101 (_keys!11591 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125823 (= lt!459015 e!590004)))

(declare-fun c!105701 () Bool)

(assert (=> d!125823 (= c!105701 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125823 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32101 (_keys!11591 thiss!1427)) (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125823 (= (arrayCountValidKeys!0 (_keys!11591 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))) lt!459015)))

(assert (= (and d!125823 c!105701) b!1041722))

(assert (= (and d!125823 (not c!105701)) b!1041725))

(assert (= (and b!1041725 c!105700) b!1041724))

(assert (= (and b!1041725 (not c!105700)) b!1041723))

(assert (= (or b!1041724 b!1041723) bm!44114))

(declare-fun m!960641 () Bool)

(assert (=> b!1041725 m!960641))

(assert (=> b!1041725 m!960641))

(declare-fun m!960643 () Bool)

(assert (=> b!1041725 m!960643))

(declare-fun m!960645 () Bool)

(assert (=> bm!44114 m!960645))

(assert (=> bm!44109 d!125823))

(declare-fun d!125825 () Bool)

(declare-fun lt!459018 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!522 (List!22006) (InoxSet (_ BitVec 64)))

(assert (=> d!125825 (= lt!459018 (select (content!522 Nil!22003) (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun e!590010 () Bool)

(assert (=> d!125825 (= lt!459018 e!590010)))

(declare-fun res!694253 () Bool)

(assert (=> d!125825 (=> (not res!694253) (not e!590010))))

(assert (=> d!125825 (= res!694253 ((_ is Cons!22002) Nil!22003))))

(assert (=> d!125825 (= (contains!6035 Nil!22003 (select (arr!31566 lt!458903) #b00000000000000000000000000000000)) lt!459018)))

(declare-fun b!1041730 () Bool)

(declare-fun e!590009 () Bool)

(assert (=> b!1041730 (= e!590010 e!590009)))

(declare-fun res!694254 () Bool)

(assert (=> b!1041730 (=> res!694254 e!590009)))

(assert (=> b!1041730 (= res!694254 (= (h!23208 Nil!22003) (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(declare-fun b!1041731 () Bool)

(assert (=> b!1041731 (= e!590009 (contains!6035 (t!31211 Nil!22003) (select (arr!31566 lt!458903) #b00000000000000000000000000000000)))))

(assert (= (and d!125825 res!694253) b!1041730))

(assert (= (and b!1041730 (not res!694254)) b!1041731))

(declare-fun m!960647 () Bool)

(assert (=> d!125825 m!960647))

(assert (=> d!125825 m!960519))

(declare-fun m!960649 () Bool)

(assert (=> d!125825 m!960649))

(assert (=> b!1041731 m!960519))

(declare-fun m!960651 () Bool)

(assert (=> b!1041731 m!960651))

(assert (=> b!1041585 d!125825))

(declare-fun d!125827 () Bool)

(assert (=> d!125827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (mask!30387 thiss!1427))))

(assert (=> d!125827 true))

(declare-fun _$44!27 () Unit!33921)

(assert (=> d!125827 (= (choose!25 (_keys!11591 thiss!1427) (index!41600 lt!458900) (mask!30387 thiss!1427)) _$44!27)))

(declare-fun bs!30438 () Bool)

(assert (= bs!30438 d!125827))

(assert (=> bs!30438 m!960437))

(assert (=> bs!30438 m!960549))

(assert (=> d!125781 d!125827))

(assert (=> d!125781 d!125789))

(declare-fun b!1041732 () Bool)

(declare-fun e!590012 () (_ BitVec 32))

(assert (=> b!1041732 (= e!590012 #b00000000000000000000000000000000)))

(declare-fun b!1041733 () Bool)

(declare-fun e!590011 () (_ BitVec 32))

(declare-fun call!44118 () (_ BitVec 32))

(assert (=> b!1041733 (= e!590011 call!44118)))

(declare-fun b!1041734 () Bool)

(assert (=> b!1041734 (= e!590011 (bvadd #b00000000000000000000000000000001 call!44118))))

(declare-fun b!1041735 () Bool)

(assert (=> b!1041735 (= e!590012 e!590011)))

(declare-fun c!105702 () Bool)

(assert (=> b!1041735 (= c!105702 (validKeyInArray!0 (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44115 () Bool)

(assert (=> bm!44115 (= call!44118 (arrayCountValidKeys!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun d!125829 () Bool)

(declare-fun lt!459019 () (_ BitVec 32))

(assert (=> d!125829 (and (bvsge lt!459019 #b00000000000000000000000000000000) (bvsle lt!459019 (bvsub (size!32101 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125829 (= lt!459019 e!590012)))

(declare-fun c!105703 () Bool)

(assert (=> d!125829 (= c!105703 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125829 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32101 (_keys!11591 thiss!1427)) (size!32101 lt!458903)))))

(assert (=> d!125829 (= (arrayCountValidKeys!0 lt!458903 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))) lt!459019)))

(assert (= (and d!125829 c!105703) b!1041732))

(assert (= (and d!125829 (not c!105703)) b!1041735))

(assert (= (and b!1041735 c!105702) b!1041734))

(assert (= (and b!1041735 (not c!105702)) b!1041733))

(assert (= (or b!1041734 b!1041733) bm!44115))

(assert (=> b!1041735 m!960579))

(assert (=> b!1041735 m!960579))

(assert (=> b!1041735 m!960585))

(declare-fun m!960653 () Bool)

(assert (=> bm!44115 m!960653))

(assert (=> bm!44108 d!125829))

(declare-fun d!125831 () Bool)

(declare-fun res!694255 () Bool)

(declare-fun e!590013 () Bool)

(assert (=> d!125831 (=> res!694255 e!590013)))

(assert (=> d!125831 (= res!694255 (= (select (arr!31566 lt!458903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125831 (= (arrayContainsKey!0 lt!458903 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590013)))

(declare-fun b!1041736 () Bool)

(declare-fun e!590014 () Bool)

(assert (=> b!1041736 (= e!590013 e!590014)))

(declare-fun res!694256 () Bool)

(assert (=> b!1041736 (=> (not res!694256) (not e!590014))))

(assert (=> b!1041736 (= res!694256 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32101 lt!458903)))))

(declare-fun b!1041737 () Bool)

(assert (=> b!1041737 (= e!590014 (arrayContainsKey!0 lt!458903 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125831 (not res!694255)) b!1041736))

(assert (= (and b!1041736 res!694256) b!1041737))

(assert (=> d!125831 m!960579))

(declare-fun m!960655 () Bool)

(assert (=> b!1041737 m!960655))

(assert (=> b!1041548 d!125831))

(assert (=> b!1041605 d!125811))

(declare-fun d!125833 () Bool)

(declare-fun res!694257 () Bool)

(declare-fun e!590015 () Bool)

(assert (=> d!125833 (=> res!694257 e!590015)))

(assert (=> d!125833 (= res!694257 (= (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125833 (= (arrayContainsKey!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590015)))

(declare-fun b!1041738 () Bool)

(declare-fun e!590016 () Bool)

(assert (=> b!1041738 (= e!590015 e!590016)))

(declare-fun res!694258 () Bool)

(assert (=> b!1041738 (=> (not res!694258) (not e!590016))))

(assert (=> b!1041738 (= res!694258 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))))))))

(declare-fun b!1041739 () Bool)

(assert (=> b!1041739 (= e!590016 (arrayContainsKey!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125833 (not res!694257)) b!1041738))

(assert (= (and b!1041738 res!694258) b!1041739))

(declare-fun m!960657 () Bool)

(assert (=> d!125833 m!960657))

(declare-fun m!960659 () Bool)

(assert (=> b!1041739 m!960659))

(assert (=> b!1041593 d!125833))

(declare-fun b!1041740 () Bool)

(declare-fun e!590017 () Bool)

(declare-fun call!44119 () Bool)

(assert (=> b!1041740 (= e!590017 call!44119)))

(declare-fun bm!44116 () Bool)

(assert (=> bm!44116 (= call!44119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (mask!30387 thiss!1427)))))

(declare-fun b!1041742 () Bool)

(declare-fun e!590019 () Bool)

(assert (=> b!1041742 (= e!590019 call!44119)))

(declare-fun b!1041743 () Bool)

(assert (=> b!1041743 (= e!590017 e!590019)))

(declare-fun lt!459022 () (_ BitVec 64))

(assert (=> b!1041743 (= lt!459022 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459020 () Unit!33921)

(assert (=> b!1041743 (= lt!459020 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) lt!459022 #b00000000000000000000000000000000))))

(assert (=> b!1041743 (arrayContainsKey!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) lt!459022 #b00000000000000000000000000000000)))

(declare-fun lt!459021 () Unit!33921)

(assert (=> b!1041743 (= lt!459021 lt!459020)))

(declare-fun res!694259 () Bool)

(assert (=> b!1041743 (= res!694259 (= (seekEntryOrOpen!0 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000) (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (mask!30387 thiss!1427)) (Found!9807 #b00000000000000000000000000000000)))))

(assert (=> b!1041743 (=> (not res!694259) (not e!590019))))

(declare-fun b!1041741 () Bool)

(declare-fun e!590018 () Bool)

(assert (=> b!1041741 (= e!590018 e!590017)))

(declare-fun c!105704 () Bool)

(assert (=> b!1041741 (= c!105704 (validKeyInArray!0 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125835 () Bool)

(declare-fun res!694260 () Bool)

(assert (=> d!125835 (=> res!694260 e!590018)))

(assert (=> d!125835 (= res!694260 (bvsge #b00000000000000000000000000000000 (size!32101 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))))))))

(assert (=> d!125835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (mask!30387 thiss!1427)) e!590018)))

(assert (= (and d!125835 (not res!694260)) b!1041741))

(assert (= (and b!1041741 c!105704) b!1041743))

(assert (= (and b!1041741 (not c!105704)) b!1041740))

(assert (= (and b!1041743 res!694259) b!1041742))

(assert (= (or b!1041742 b!1041740) bm!44116))

(declare-fun m!960661 () Bool)

(assert (=> bm!44116 m!960661))

(assert (=> b!1041743 m!960657))

(declare-fun m!960663 () Bool)

(assert (=> b!1041743 m!960663))

(declare-fun m!960665 () Bool)

(assert (=> b!1041743 m!960665))

(assert (=> b!1041743 m!960657))

(declare-fun m!960667 () Bool)

(assert (=> b!1041743 m!960667))

(assert (=> b!1041741 m!960657))

(assert (=> b!1041741 m!960657))

(declare-fun m!960669 () Bool)

(assert (=> b!1041741 m!960669))

(assert (=> b!1041590 d!125835))

(declare-fun b!1041744 () Bool)

(declare-fun e!590021 () (_ BitVec 32))

(assert (=> b!1041744 (= e!590021 #b00000000000000000000000000000000)))

(declare-fun b!1041745 () Bool)

(declare-fun e!590020 () (_ BitVec 32))

(declare-fun call!44120 () (_ BitVec 32))

(assert (=> b!1041745 (= e!590020 call!44120)))

(declare-fun b!1041746 () Bool)

(assert (=> b!1041746 (= e!590020 (bvadd #b00000000000000000000000000000001 call!44120))))

(declare-fun b!1041747 () Bool)

(assert (=> b!1041747 (= e!590021 e!590020)))

(declare-fun c!105705 () Bool)

(assert (=> b!1041747 (= c!105705 (validKeyInArray!0 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44117 () Bool)

(assert (=> bm!44117 (= call!44120 (arrayCountValidKeys!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32101 (_keys!11591 thiss!1427))))))

(declare-fun d!125837 () Bool)

(declare-fun lt!459023 () (_ BitVec 32))

(assert (=> d!125837 (and (bvsge lt!459023 #b00000000000000000000000000000000) (bvsle lt!459023 (bvsub (size!32101 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125837 (= lt!459023 e!590021)))

(declare-fun c!105706 () Bool)

(assert (=> d!125837 (= c!105706 (bvsge #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))))))

(assert (=> d!125837 (and (bvsle #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32101 (_keys!11591 thiss!1427)) (size!32101 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))))))))

(assert (=> d!125837 (= (arrayCountValidKeys!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) lt!459023)))

(assert (= (and d!125837 c!105706) b!1041744))

(assert (= (and d!125837 (not c!105706)) b!1041747))

(assert (= (and b!1041747 c!105705) b!1041746))

(assert (= (and b!1041747 (not c!105705)) b!1041745))

(assert (= (or b!1041746 b!1041745) bm!44117))

(assert (=> b!1041747 m!960657))

(assert (=> b!1041747 m!960657))

(assert (=> b!1041747 m!960669))

(declare-fun m!960671 () Bool)

(assert (=> bm!44117 m!960671))

(assert (=> b!1041572 d!125837))

(assert (=> b!1041572 d!125787))

(declare-fun d!125839 () Bool)

(declare-fun res!694271 () Bool)

(declare-fun e!590024 () Bool)

(assert (=> d!125839 (=> (not res!694271) (not e!590024))))

(assert (=> d!125839 (= res!694271 (validMask!0 (mask!30387 thiss!1427)))))

(assert (=> d!125839 (= (simpleValid!439 thiss!1427) e!590024)))

(declare-fun b!1041758 () Bool)

(declare-fun res!694269 () Bool)

(assert (=> b!1041758 (=> (not res!694269) (not e!590024))))

(declare-fun size!32107 (LongMapFixedSize!5950) (_ BitVec 32))

(assert (=> b!1041758 (= res!694269 (= (size!32107 thiss!1427) (bvadd (_size!3030 thiss!1427) (bvsdiv (bvadd (extraKeys!6085 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1041757 () Bool)

(declare-fun res!694272 () Bool)

(assert (=> b!1041757 (=> (not res!694272) (not e!590024))))

(assert (=> b!1041757 (= res!694272 (bvsge (size!32107 thiss!1427) (_size!3030 thiss!1427)))))

(declare-fun b!1041759 () Bool)

(assert (=> b!1041759 (= e!590024 (and (bvsge (extraKeys!6085 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6085 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3030 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1041756 () Bool)

(declare-fun res!694270 () Bool)

(assert (=> b!1041756 (=> (not res!694270) (not e!590024))))

(assert (=> b!1041756 (= res!694270 (and (= (size!32102 (_values!6380 thiss!1427)) (bvadd (mask!30387 thiss!1427) #b00000000000000000000000000000001)) (= (size!32101 (_keys!11591 thiss!1427)) (size!32102 (_values!6380 thiss!1427))) (bvsge (_size!3030 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3030 thiss!1427) (bvadd (mask!30387 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!125839 res!694271) b!1041756))

(assert (= (and b!1041756 res!694270) b!1041757))

(assert (= (and b!1041757 res!694272) b!1041758))

(assert (= (and b!1041758 res!694269) b!1041759))

(assert (=> d!125839 m!960419))

(declare-fun m!960673 () Bool)

(assert (=> b!1041758 m!960673))

(assert (=> b!1041757 m!960673))

(assert (=> d!125771 d!125839))

(declare-fun d!125841 () Bool)

(assert (=> d!125841 (arrayNoDuplicates!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 Nil!22003)))

(assert (=> d!125841 true))

(declare-fun _$66!53 () Unit!33921)

(assert (=> d!125841 (= (choose!53 (_keys!11591 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!458900) #b00000000000000000000000000000000 Nil!22003) _$66!53)))

(declare-fun bs!30439 () Bool)

(assert (= bs!30439 d!125841))

(assert (=> bs!30439 m!960437))

(assert (=> bs!30439 m!960565))

(assert (=> d!125791 d!125841))

(declare-fun call!44121 () Bool)

(declare-fun bm!44118 () Bool)

(declare-fun c!105707 () Bool)

(assert (=> bm!44118 (= call!44121 (arrayNoDuplicates!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105707 (Cons!22002 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000) Nil!22003) Nil!22003)))))

(declare-fun b!1041760 () Bool)

(declare-fun e!590027 () Bool)

(assert (=> b!1041760 (= e!590027 call!44121)))

(declare-fun b!1041761 () Bool)

(assert (=> b!1041761 (= e!590027 call!44121)))

(declare-fun d!125843 () Bool)

(declare-fun res!694275 () Bool)

(declare-fun e!590028 () Bool)

(assert (=> d!125843 (=> res!694275 e!590028)))

(assert (=> d!125843 (= res!694275 (bvsge #b00000000000000000000000000000000 (size!32101 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))))))))

(assert (=> d!125843 (= (arrayNoDuplicates!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 Nil!22003) e!590028)))

(declare-fun b!1041762 () Bool)

(declare-fun e!590025 () Bool)

(assert (=> b!1041762 (= e!590025 (contains!6035 Nil!22003 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041763 () Bool)

(declare-fun e!590026 () Bool)

(assert (=> b!1041763 (= e!590028 e!590026)))

(declare-fun res!694274 () Bool)

(assert (=> b!1041763 (=> (not res!694274) (not e!590026))))

(assert (=> b!1041763 (= res!694274 (not e!590025))))

(declare-fun res!694273 () Bool)

(assert (=> b!1041763 (=> (not res!694273) (not e!590025))))

(assert (=> b!1041763 (= res!694273 (validKeyInArray!0 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041764 () Bool)

(assert (=> b!1041764 (= e!590026 e!590027)))

(assert (=> b!1041764 (= c!105707 (validKeyInArray!0 (select (arr!31566 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125843 (not res!694275)) b!1041763))

(assert (= (and b!1041763 res!694273) b!1041762))

(assert (= (and b!1041763 res!694274) b!1041764))

(assert (= (and b!1041764 c!105707) b!1041761))

(assert (= (and b!1041764 (not c!105707)) b!1041760))

(assert (= (or b!1041761 b!1041760) bm!44118))

(assert (=> bm!44118 m!960657))

(declare-fun m!960675 () Bool)

(assert (=> bm!44118 m!960675))

(assert (=> b!1041762 m!960657))

(assert (=> b!1041762 m!960657))

(declare-fun m!960677 () Bool)

(assert (=> b!1041762 m!960677))

(assert (=> b!1041763 m!960657))

(assert (=> b!1041763 m!960657))

(assert (=> b!1041763 m!960669))

(assert (=> b!1041764 m!960657))

(assert (=> b!1041764 m!960657))

(assert (=> b!1041764 m!960669))

(assert (=> b!1041612 d!125843))

(declare-fun d!125845 () Bool)

(assert (=> d!125845 (= (arrayCountValidKeys!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11591 thiss!1427) #b00000000000000000000000000000000 (size!32101 (_keys!11591 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125845 true))

(declare-fun _$79!29 () Unit!33921)

(assert (=> d!125845 (= (choose!82 (_keys!11591 thiss!1427) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!29)))

(declare-fun bs!30440 () Bool)

(assert (= bs!30440 d!125845))

(assert (=> bs!30440 m!960437))

(assert (=> bs!30440 m!960541))

(assert (=> bs!30440 m!960423))

(assert (=> d!125777 d!125845))

(declare-fun d!125847 () Bool)

(assert (=> d!125847 (not (arrayContainsKey!0 (array!65614 (store (arr!31566 (_keys!11591 thiss!1427)) (index!41600 lt!458900) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32101 (_keys!11591 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125847 true))

(declare-fun _$59!29 () Unit!33921)

(assert (=> d!125847 (= (choose!121 (_keys!11591 thiss!1427) (index!41600 lt!458900) key!909) _$59!29)))

(declare-fun bs!30441 () Bool)

(assert (= bs!30441 d!125847))

(assert (=> bs!30441 m!960437))

(assert (=> bs!30441 m!960553))

(assert (=> d!125783 d!125847))

(declare-fun condMapEmpty!38752 () Bool)

(declare-fun mapDefault!38752 () ValueCell!11678)

(assert (=> mapNonEmpty!38751 (= condMapEmpty!38752 (= mapRest!38751 ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38752)))))

(declare-fun e!590029 () Bool)

(declare-fun mapRes!38752 () Bool)

(assert (=> mapNonEmpty!38751 (= tp!74359 (and e!590029 mapRes!38752))))

(declare-fun b!1041765 () Bool)

(declare-fun e!590030 () Bool)

(assert (=> b!1041765 (= e!590030 tp_is_empty!24763)))

(declare-fun mapNonEmpty!38752 () Bool)

(declare-fun tp!74360 () Bool)

(assert (=> mapNonEmpty!38752 (= mapRes!38752 (and tp!74360 e!590030))))

(declare-fun mapValue!38752 () ValueCell!11678)

(declare-fun mapRest!38752 () (Array (_ BitVec 32) ValueCell!11678))

(declare-fun mapKey!38752 () (_ BitVec 32))

(assert (=> mapNonEmpty!38752 (= mapRest!38751 (store mapRest!38752 mapKey!38752 mapValue!38752))))

(declare-fun b!1041766 () Bool)

(assert (=> b!1041766 (= e!590029 tp_is_empty!24763)))

(declare-fun mapIsEmpty!38752 () Bool)

(assert (=> mapIsEmpty!38752 mapRes!38752))

(assert (= (and mapNonEmpty!38751 condMapEmpty!38752) mapIsEmpty!38752))

(assert (= (and mapNonEmpty!38751 (not condMapEmpty!38752)) mapNonEmpty!38752))

(assert (= (and mapNonEmpty!38752 ((_ is ValueCellFull!11678) mapValue!38752)) b!1041765))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11678) mapDefault!38752)) b!1041766))

(declare-fun m!960679 () Bool)

(assert (=> mapNonEmpty!38752 m!960679))

(check-sat (not b!1041694) (not bm!44115) (not b!1041737) (not d!125845) (not d!125839) (not b!1041659) tp_is_empty!24763 (not b!1041731) (not bm!44111) (not b!1041716) (not b!1041641) (not b!1041735) (not bm!44118) (not d!125801) (not b!1041725) (not d!125825) (not b_next!21043) (not bm!44114) (not d!125803) (not b!1041757) (not b!1041703) (not b!1041764) (not d!125797) (not b!1041763) (not b!1041739) (not b!1041747) (not bm!44110) (not d!125847) (not b!1041643) (not b!1041741) (not b!1041697) (not b!1041762) (not mapNonEmpty!38752) (not b!1041682) (not bm!44116) (not bm!44113) (not bm!44112) (not b!1041645) (not b!1041701) (not d!125841) (not b!1041698) (not d!125827) (not b!1041692) (not b!1041743) (not d!125815) (not b!1041642) b_and!33549 (not bm!44117) (not b!1041758) (not b!1041699))
(check-sat b_and!33549 (not b_next!21043))
