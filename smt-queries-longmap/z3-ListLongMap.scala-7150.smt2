; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91142 () Bool)

(assert start!91142)

(declare-fun b!1040125 () Bool)

(declare-fun b_free!20953 () Bool)

(declare-fun b_next!20953 () Bool)

(assert (=> b!1040125 (= b_free!20953 (not b_next!20953))))

(declare-fun tp!74026 () Bool)

(declare-fun b_and!33495 () Bool)

(assert (=> b!1040125 (= tp!74026 b_and!33495)))

(declare-fun res!693402 () Bool)

(declare-fun e!588679 () Bool)

(assert (=> start!91142 (=> (not res!693402) (not e!588679))))

(declare-datatypes ((V!37771 0))(
  ( (V!37772 (val!12387 Int)) )
))
(declare-datatypes ((ValueCell!11633 0))(
  ( (ValueCellFull!11633 (v!14970 V!37771)) (EmptyCell!11633) )
))
(declare-datatypes ((array!65513 0))(
  ( (array!65514 (arr!31525 (Array (_ BitVec 32) (_ BitVec 64))) (size!32057 (_ BitVec 32))) )
))
(declare-datatypes ((array!65515 0))(
  ( (array!65516 (arr!31526 (Array (_ BitVec 32) ValueCell!11633)) (size!32058 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5860 0))(
  ( (LongMapFixedSize!5861 (defaultEntry!6312 Int) (mask!30322 (_ BitVec 32)) (extraKeys!6040 (_ BitVec 32)) (zeroValue!6146 V!37771) (minValue!6146 V!37771) (_size!2985 (_ BitVec 32)) (_keys!11556 array!65513) (_values!6335 array!65515) (_vacant!2985 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5860)

(declare-fun valid!2213 (LongMapFixedSize!5860) Bool)

(assert (=> start!91142 (= res!693402 (valid!2213 thiss!1427))))

(assert (=> start!91142 e!588679))

(declare-fun e!588681 () Bool)

(assert (=> start!91142 e!588681))

(assert (=> start!91142 true))

(declare-fun tp_is_empty!24673 () Bool)

(declare-fun e!588678 () Bool)

(declare-fun array_inv!24387 (array!65513) Bool)

(declare-fun array_inv!24388 (array!65515) Bool)

(assert (=> b!1040125 (= e!588681 (and tp!74026 tp_is_empty!24673 (array_inv!24387 (_keys!11556 thiss!1427)) (array_inv!24388 (_values!6335 thiss!1427)) e!588678))))

(declare-fun b!1040126 () Bool)

(declare-fun e!588683 () Bool)

(assert (=> b!1040126 (= e!588683 tp_is_empty!24673)))

(declare-fun b!1040127 () Bool)

(declare-fun e!588677 () Bool)

(declare-datatypes ((SeekEntryResult!9730 0))(
  ( (MissingZero!9730 (index!41291 (_ BitVec 32))) (Found!9730 (index!41292 (_ BitVec 32))) (Intermediate!9730 (undefined!10542 Bool) (index!41293 (_ BitVec 32)) (x!92680 (_ BitVec 32))) (Undefined!9730) (MissingVacant!9730 (index!41294 (_ BitVec 32))) )
))
(declare-fun lt!458384 () SeekEntryResult!9730)

(assert (=> b!1040127 (= e!588677 (or (not (= (size!32057 (_keys!11556 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30322 thiss!1427)))) (bvsge (index!41292 lt!458384) #b00000000000000000000000000000000)))))

(declare-fun b!1040128 () Bool)

(declare-fun e!588676 () Bool)

(assert (=> b!1040128 (= e!588676 (not e!588677))))

(declare-fun res!693401 () Bool)

(assert (=> b!1040128 (=> res!693401 e!588677)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040128 (= res!693401 (not (validMask!0 (mask!30322 thiss!1427))))))

(declare-fun lt!458385 () array!65513)

(declare-datatypes ((List!21929 0))(
  ( (Nil!21926) (Cons!21925 (h!23138 (_ BitVec 64)) (t!31135 List!21929)) )
))
(declare-fun arrayNoDuplicates!0 (array!65513 (_ BitVec 32) List!21929) Bool)

(assert (=> b!1040128 (arrayNoDuplicates!0 lt!458385 #b00000000000000000000000000000000 Nil!21926)))

(declare-datatypes ((Unit!33985 0))(
  ( (Unit!33986) )
))
(declare-fun lt!458387 () Unit!33985)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21929) Unit!33985)

(assert (=> b!1040128 (= lt!458387 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11556 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41292 lt!458384) #b00000000000000000000000000000000 Nil!21926))))

(declare-fun arrayCountValidKeys!0 (array!65513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040128 (= (arrayCountValidKeys!0 lt!458385 #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11556 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040128 (= lt!458385 (array!65514 (store (arr!31525 (_keys!11556 thiss!1427)) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11556 thiss!1427))))))

(declare-fun lt!458386 () Unit!33985)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65513 (_ BitVec 32) (_ BitVec 64)) Unit!33985)

(assert (=> b!1040128 (= lt!458386 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11556 thiss!1427) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040129 () Bool)

(declare-fun e!588682 () Bool)

(declare-fun mapRes!38560 () Bool)

(assert (=> b!1040129 (= e!588678 (and e!588682 mapRes!38560))))

(declare-fun condMapEmpty!38560 () Bool)

(declare-fun mapDefault!38560 () ValueCell!11633)

(assert (=> b!1040129 (= condMapEmpty!38560 (= (arr!31526 (_values!6335 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11633)) mapDefault!38560)))))

(declare-fun mapNonEmpty!38560 () Bool)

(declare-fun tp!74027 () Bool)

(assert (=> mapNonEmpty!38560 (= mapRes!38560 (and tp!74027 e!588683))))

(declare-fun mapValue!38560 () ValueCell!11633)

(declare-fun mapKey!38560 () (_ BitVec 32))

(declare-fun mapRest!38560 () (Array (_ BitVec 32) ValueCell!11633))

(assert (=> mapNonEmpty!38560 (= (arr!31526 (_values!6335 thiss!1427)) (store mapRest!38560 mapKey!38560 mapValue!38560))))

(declare-fun mapIsEmpty!38560 () Bool)

(assert (=> mapIsEmpty!38560 mapRes!38560))

(declare-fun b!1040130 () Bool)

(assert (=> b!1040130 (= e!588682 tp_is_empty!24673)))

(declare-fun b!1040131 () Bool)

(assert (=> b!1040131 (= e!588679 e!588676)))

(declare-fun res!693403 () Bool)

(assert (=> b!1040131 (=> (not res!693403) (not e!588676))))

(get-info :version)

(assert (=> b!1040131 (= res!693403 ((_ is Found!9730) lt!458384))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65513 (_ BitVec 32)) SeekEntryResult!9730)

(assert (=> b!1040131 (= lt!458384 (seekEntry!0 key!909 (_keys!11556 thiss!1427) (mask!30322 thiss!1427)))))

(declare-fun b!1040132 () Bool)

(declare-fun res!693400 () Bool)

(assert (=> b!1040132 (=> (not res!693400) (not e!588679))))

(assert (=> b!1040132 (= res!693400 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91142 res!693402) b!1040132))

(assert (= (and b!1040132 res!693400) b!1040131))

(assert (= (and b!1040131 res!693403) b!1040128))

(assert (= (and b!1040128 (not res!693401)) b!1040127))

(assert (= (and b!1040129 condMapEmpty!38560) mapIsEmpty!38560))

(assert (= (and b!1040129 (not condMapEmpty!38560)) mapNonEmpty!38560))

(assert (= (and mapNonEmpty!38560 ((_ is ValueCellFull!11633) mapValue!38560)) b!1040126))

(assert (= (and b!1040129 ((_ is ValueCellFull!11633) mapDefault!38560)) b!1040130))

(assert (= b!1040125 b!1040129))

(assert (= start!91142 b!1040125))

(declare-fun m!960317 () Bool)

(assert (=> b!1040128 m!960317))

(declare-fun m!960319 () Bool)

(assert (=> b!1040128 m!960319))

(declare-fun m!960321 () Bool)

(assert (=> b!1040128 m!960321))

(declare-fun m!960323 () Bool)

(assert (=> b!1040128 m!960323))

(declare-fun m!960325 () Bool)

(assert (=> b!1040128 m!960325))

(declare-fun m!960327 () Bool)

(assert (=> b!1040128 m!960327))

(declare-fun m!960329 () Bool)

(assert (=> b!1040128 m!960329))

(declare-fun m!960331 () Bool)

(assert (=> b!1040131 m!960331))

(declare-fun m!960333 () Bool)

(assert (=> mapNonEmpty!38560 m!960333))

(declare-fun m!960335 () Bool)

(assert (=> b!1040125 m!960335))

(declare-fun m!960337 () Bool)

(assert (=> b!1040125 m!960337))

(declare-fun m!960339 () Bool)

(assert (=> start!91142 m!960339))

(check-sat (not b!1040125) (not b_next!20953) (not b!1040131) tp_is_empty!24673 (not start!91142) (not mapNonEmpty!38560) (not b!1040128) b_and!33495)
(check-sat b_and!33495 (not b_next!20953))
(get-model)

(declare-fun d!125875 () Bool)

(declare-fun res!693434 () Bool)

(declare-fun e!588734 () Bool)

(assert (=> d!125875 (=> (not res!693434) (not e!588734))))

(declare-fun simpleValid!424 (LongMapFixedSize!5860) Bool)

(assert (=> d!125875 (= res!693434 (simpleValid!424 thiss!1427))))

(assert (=> d!125875 (= (valid!2213 thiss!1427) e!588734)))

(declare-fun b!1040187 () Bool)

(declare-fun res!693435 () Bool)

(assert (=> b!1040187 (=> (not res!693435) (not e!588734))))

(assert (=> b!1040187 (= res!693435 (= (arrayCountValidKeys!0 (_keys!11556 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) (_size!2985 thiss!1427)))))

(declare-fun b!1040188 () Bool)

(declare-fun res!693436 () Bool)

(assert (=> b!1040188 (=> (not res!693436) (not e!588734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65513 (_ BitVec 32)) Bool)

(assert (=> b!1040188 (= res!693436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11556 thiss!1427) (mask!30322 thiss!1427)))))

(declare-fun b!1040189 () Bool)

(assert (=> b!1040189 (= e!588734 (arrayNoDuplicates!0 (_keys!11556 thiss!1427) #b00000000000000000000000000000000 Nil!21926))))

(assert (= (and d!125875 res!693434) b!1040187))

(assert (= (and b!1040187 res!693435) b!1040188))

(assert (= (and b!1040188 res!693436) b!1040189))

(declare-fun m!960389 () Bool)

(assert (=> d!125875 m!960389))

(assert (=> b!1040187 m!960321))

(declare-fun m!960391 () Bool)

(assert (=> b!1040188 m!960391))

(declare-fun m!960393 () Bool)

(assert (=> b!1040189 m!960393))

(assert (=> start!91142 d!125875))

(declare-fun b!1040202 () Bool)

(declare-fun e!588743 () SeekEntryResult!9730)

(declare-fun lt!458420 () SeekEntryResult!9730)

(assert (=> b!1040202 (= e!588743 (Found!9730 (index!41293 lt!458420)))))

(declare-fun b!1040203 () Bool)

(declare-fun e!588741 () SeekEntryResult!9730)

(assert (=> b!1040203 (= e!588741 e!588743)))

(declare-fun lt!458423 () (_ BitVec 64))

(assert (=> b!1040203 (= lt!458423 (select (arr!31525 (_keys!11556 thiss!1427)) (index!41293 lt!458420)))))

(declare-fun c!105685 () Bool)

(assert (=> b!1040203 (= c!105685 (= lt!458423 key!909))))

(declare-fun b!1040204 () Bool)

(declare-fun e!588742 () SeekEntryResult!9730)

(assert (=> b!1040204 (= e!588742 (MissingZero!9730 (index!41293 lt!458420)))))

(declare-fun d!125877 () Bool)

(declare-fun lt!458421 () SeekEntryResult!9730)

(assert (=> d!125877 (and (or ((_ is MissingVacant!9730) lt!458421) (not ((_ is Found!9730) lt!458421)) (and (bvsge (index!41292 lt!458421) #b00000000000000000000000000000000) (bvslt (index!41292 lt!458421) (size!32057 (_keys!11556 thiss!1427))))) (not ((_ is MissingVacant!9730) lt!458421)) (or (not ((_ is Found!9730) lt!458421)) (= (select (arr!31525 (_keys!11556 thiss!1427)) (index!41292 lt!458421)) key!909)))))

(assert (=> d!125877 (= lt!458421 e!588741)))

(declare-fun c!105686 () Bool)

(assert (=> d!125877 (= c!105686 (and ((_ is Intermediate!9730) lt!458420) (undefined!10542 lt!458420)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65513 (_ BitVec 32)) SeekEntryResult!9730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125877 (= lt!458420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30322 thiss!1427)) key!909 (_keys!11556 thiss!1427) (mask!30322 thiss!1427)))))

(assert (=> d!125877 (validMask!0 (mask!30322 thiss!1427))))

(assert (=> d!125877 (= (seekEntry!0 key!909 (_keys!11556 thiss!1427) (mask!30322 thiss!1427)) lt!458421)))

(declare-fun b!1040205 () Bool)

(assert (=> b!1040205 (= e!588741 Undefined!9730)))

(declare-fun b!1040206 () Bool)

(declare-fun c!105687 () Bool)

(assert (=> b!1040206 (= c!105687 (= lt!458423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040206 (= e!588743 e!588742)))

(declare-fun b!1040207 () Bool)

(declare-fun lt!458422 () SeekEntryResult!9730)

(assert (=> b!1040207 (= e!588742 (ite ((_ is MissingVacant!9730) lt!458422) (MissingZero!9730 (index!41294 lt!458422)) lt!458422))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65513 (_ BitVec 32)) SeekEntryResult!9730)

(assert (=> b!1040207 (= lt!458422 (seekKeyOrZeroReturnVacant!0 (x!92680 lt!458420) (index!41293 lt!458420) (index!41293 lt!458420) key!909 (_keys!11556 thiss!1427) (mask!30322 thiss!1427)))))

(assert (= (and d!125877 c!105686) b!1040205))

(assert (= (and d!125877 (not c!105686)) b!1040203))

(assert (= (and b!1040203 c!105685) b!1040202))

(assert (= (and b!1040203 (not c!105685)) b!1040206))

(assert (= (and b!1040206 c!105687) b!1040204))

(assert (= (and b!1040206 (not c!105687)) b!1040207))

(declare-fun m!960395 () Bool)

(assert (=> b!1040203 m!960395))

(declare-fun m!960397 () Bool)

(assert (=> d!125877 m!960397))

(declare-fun m!960399 () Bool)

(assert (=> d!125877 m!960399))

(assert (=> d!125877 m!960399))

(declare-fun m!960401 () Bool)

(assert (=> d!125877 m!960401))

(assert (=> d!125877 m!960329))

(declare-fun m!960403 () Bool)

(assert (=> b!1040207 m!960403))

(assert (=> b!1040131 d!125877))

(declare-fun b!1040216 () Bool)

(declare-fun res!693448 () Bool)

(declare-fun e!588749 () Bool)

(assert (=> b!1040216 (=> (not res!693448) (not e!588749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040216 (= res!693448 (validKeyInArray!0 (select (arr!31525 (_keys!11556 thiss!1427)) (index!41292 lt!458384))))))

(declare-fun d!125879 () Bool)

(declare-fun e!588748 () Bool)

(assert (=> d!125879 e!588748))

(declare-fun res!693446 () Bool)

(assert (=> d!125879 (=> (not res!693446) (not e!588748))))

(assert (=> d!125879 (= res!693446 (and (bvsge (index!41292 lt!458384) #b00000000000000000000000000000000) (bvslt (index!41292 lt!458384) (size!32057 (_keys!11556 thiss!1427)))))))

(declare-fun lt!458426 () Unit!33985)

(declare-fun choose!82 (array!65513 (_ BitVec 32) (_ BitVec 64)) Unit!33985)

(assert (=> d!125879 (= lt!458426 (choose!82 (_keys!11556 thiss!1427) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125879 e!588749))

(declare-fun res!693447 () Bool)

(assert (=> d!125879 (=> (not res!693447) (not e!588749))))

(assert (=> d!125879 (= res!693447 (and (bvsge (index!41292 lt!458384) #b00000000000000000000000000000000) (bvslt (index!41292 lt!458384) (size!32057 (_keys!11556 thiss!1427)))))))

(assert (=> d!125879 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11556 thiss!1427) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458426)))

(declare-fun b!1040219 () Bool)

(assert (=> b!1040219 (= e!588748 (= (arrayCountValidKeys!0 (array!65514 (store (arr!31525 (_keys!11556 thiss!1427)) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11556 thiss!1427))) #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11556 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040217 () Bool)

(declare-fun res!693445 () Bool)

(assert (=> b!1040217 (=> (not res!693445) (not e!588749))))

(assert (=> b!1040217 (= res!693445 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040218 () Bool)

(assert (=> b!1040218 (= e!588749 (bvslt (size!32057 (_keys!11556 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125879 res!693447) b!1040216))

(assert (= (and b!1040216 res!693448) b!1040217))

(assert (= (and b!1040217 res!693445) b!1040218))

(assert (= (and d!125879 res!693446) b!1040219))

(declare-fun m!960405 () Bool)

(assert (=> b!1040216 m!960405))

(assert (=> b!1040216 m!960405))

(declare-fun m!960407 () Bool)

(assert (=> b!1040216 m!960407))

(declare-fun m!960409 () Bool)

(assert (=> d!125879 m!960409))

(assert (=> b!1040219 m!960325))

(declare-fun m!960411 () Bool)

(assert (=> b!1040219 m!960411))

(assert (=> b!1040219 m!960321))

(declare-fun m!960413 () Bool)

(assert (=> b!1040217 m!960413))

(assert (=> b!1040128 d!125879))

(declare-fun d!125881 () Bool)

(assert (=> d!125881 (= (validMask!0 (mask!30322 thiss!1427)) (and (or (= (mask!30322 thiss!1427) #b00000000000000000000000000000111) (= (mask!30322 thiss!1427) #b00000000000000000000000000001111) (= (mask!30322 thiss!1427) #b00000000000000000000000000011111) (= (mask!30322 thiss!1427) #b00000000000000000000000000111111) (= (mask!30322 thiss!1427) #b00000000000000000000000001111111) (= (mask!30322 thiss!1427) #b00000000000000000000000011111111) (= (mask!30322 thiss!1427) #b00000000000000000000000111111111) (= (mask!30322 thiss!1427) #b00000000000000000000001111111111) (= (mask!30322 thiss!1427) #b00000000000000000000011111111111) (= (mask!30322 thiss!1427) #b00000000000000000000111111111111) (= (mask!30322 thiss!1427) #b00000000000000000001111111111111) (= (mask!30322 thiss!1427) #b00000000000000000011111111111111) (= (mask!30322 thiss!1427) #b00000000000000000111111111111111) (= (mask!30322 thiss!1427) #b00000000000000001111111111111111) (= (mask!30322 thiss!1427) #b00000000000000011111111111111111) (= (mask!30322 thiss!1427) #b00000000000000111111111111111111) (= (mask!30322 thiss!1427) #b00000000000001111111111111111111) (= (mask!30322 thiss!1427) #b00000000000011111111111111111111) (= (mask!30322 thiss!1427) #b00000000000111111111111111111111) (= (mask!30322 thiss!1427) #b00000000001111111111111111111111) (= (mask!30322 thiss!1427) #b00000000011111111111111111111111) (= (mask!30322 thiss!1427) #b00000000111111111111111111111111) (= (mask!30322 thiss!1427) #b00000001111111111111111111111111) (= (mask!30322 thiss!1427) #b00000011111111111111111111111111) (= (mask!30322 thiss!1427) #b00000111111111111111111111111111) (= (mask!30322 thiss!1427) #b00001111111111111111111111111111) (= (mask!30322 thiss!1427) #b00011111111111111111111111111111) (= (mask!30322 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30322 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040128 d!125881))

(declare-fun d!125883 () Bool)

(declare-fun lt!458429 () (_ BitVec 32))

(assert (=> d!125883 (and (bvsge lt!458429 #b00000000000000000000000000000000) (bvsle lt!458429 (bvsub (size!32057 lt!458385) #b00000000000000000000000000000000)))))

(declare-fun e!588754 () (_ BitVec 32))

(assert (=> d!125883 (= lt!458429 e!588754)))

(declare-fun c!105692 () Bool)

(assert (=> d!125883 (= c!105692 (bvsge #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))))))

(assert (=> d!125883 (and (bvsle #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32057 (_keys!11556 thiss!1427)) (size!32057 lt!458385)))))

(assert (=> d!125883 (= (arrayCountValidKeys!0 lt!458385 #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) lt!458429)))

(declare-fun b!1040228 () Bool)

(assert (=> b!1040228 (= e!588754 #b00000000000000000000000000000000)))

(declare-fun b!1040229 () Bool)

(declare-fun e!588755 () (_ BitVec 32))

(declare-fun call!44034 () (_ BitVec 32))

(assert (=> b!1040229 (= e!588755 (bvadd #b00000000000000000000000000000001 call!44034))))

(declare-fun b!1040230 () Bool)

(assert (=> b!1040230 (= e!588755 call!44034)))

(declare-fun b!1040231 () Bool)

(assert (=> b!1040231 (= e!588754 e!588755)))

(declare-fun c!105693 () Bool)

(assert (=> b!1040231 (= c!105693 (validKeyInArray!0 (select (arr!31525 lt!458385) #b00000000000000000000000000000000)))))

(declare-fun bm!44031 () Bool)

(assert (=> bm!44031 (= call!44034 (arrayCountValidKeys!0 lt!458385 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32057 (_keys!11556 thiss!1427))))))

(assert (= (and d!125883 c!105692) b!1040228))

(assert (= (and d!125883 (not c!105692)) b!1040231))

(assert (= (and b!1040231 c!105693) b!1040229))

(assert (= (and b!1040231 (not c!105693)) b!1040230))

(assert (= (or b!1040229 b!1040230) bm!44031))

(declare-fun m!960415 () Bool)

(assert (=> b!1040231 m!960415))

(assert (=> b!1040231 m!960415))

(declare-fun m!960417 () Bool)

(assert (=> b!1040231 m!960417))

(declare-fun m!960419 () Bool)

(assert (=> bm!44031 m!960419))

(assert (=> b!1040128 d!125883))

(declare-fun d!125885 () Bool)

(declare-fun lt!458430 () (_ BitVec 32))

(assert (=> d!125885 (and (bvsge lt!458430 #b00000000000000000000000000000000) (bvsle lt!458430 (bvsub (size!32057 (_keys!11556 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588756 () (_ BitVec 32))

(assert (=> d!125885 (= lt!458430 e!588756)))

(declare-fun c!105694 () Bool)

(assert (=> d!125885 (= c!105694 (bvsge #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))))))

(assert (=> d!125885 (and (bvsle #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32057 (_keys!11556 thiss!1427)) (size!32057 (_keys!11556 thiss!1427))))))

(assert (=> d!125885 (= (arrayCountValidKeys!0 (_keys!11556 thiss!1427) #b00000000000000000000000000000000 (size!32057 (_keys!11556 thiss!1427))) lt!458430)))

(declare-fun b!1040232 () Bool)

(assert (=> b!1040232 (= e!588756 #b00000000000000000000000000000000)))

(declare-fun b!1040233 () Bool)

(declare-fun e!588757 () (_ BitVec 32))

(declare-fun call!44035 () (_ BitVec 32))

(assert (=> b!1040233 (= e!588757 (bvadd #b00000000000000000000000000000001 call!44035))))

(declare-fun b!1040234 () Bool)

(assert (=> b!1040234 (= e!588757 call!44035)))

(declare-fun b!1040235 () Bool)

(assert (=> b!1040235 (= e!588756 e!588757)))

(declare-fun c!105695 () Bool)

(assert (=> b!1040235 (= c!105695 (validKeyInArray!0 (select (arr!31525 (_keys!11556 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44032 () Bool)

(assert (=> bm!44032 (= call!44035 (arrayCountValidKeys!0 (_keys!11556 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32057 (_keys!11556 thiss!1427))))))

(assert (= (and d!125885 c!105694) b!1040232))

(assert (= (and d!125885 (not c!105694)) b!1040235))

(assert (= (and b!1040235 c!105695) b!1040233))

(assert (= (and b!1040235 (not c!105695)) b!1040234))

(assert (= (or b!1040233 b!1040234) bm!44032))

(declare-fun m!960421 () Bool)

(assert (=> b!1040235 m!960421))

(assert (=> b!1040235 m!960421))

(declare-fun m!960423 () Bool)

(assert (=> b!1040235 m!960423))

(declare-fun m!960425 () Bool)

(assert (=> bm!44032 m!960425))

(assert (=> b!1040128 d!125885))

(declare-fun b!1040246 () Bool)

(declare-fun e!588769 () Bool)

(declare-fun e!588766 () Bool)

(assert (=> b!1040246 (= e!588769 e!588766)))

(declare-fun res!693457 () Bool)

(assert (=> b!1040246 (=> (not res!693457) (not e!588766))))

(declare-fun e!588768 () Bool)

(assert (=> b!1040246 (= res!693457 (not e!588768))))

(declare-fun res!693455 () Bool)

(assert (=> b!1040246 (=> (not res!693455) (not e!588768))))

(assert (=> b!1040246 (= res!693455 (validKeyInArray!0 (select (arr!31525 lt!458385) #b00000000000000000000000000000000)))))

(declare-fun b!1040247 () Bool)

(declare-fun e!588767 () Bool)

(declare-fun call!44038 () Bool)

(assert (=> b!1040247 (= e!588767 call!44038)))

(declare-fun b!1040248 () Bool)

(declare-fun contains!6066 (List!21929 (_ BitVec 64)) Bool)

(assert (=> b!1040248 (= e!588768 (contains!6066 Nil!21926 (select (arr!31525 lt!458385) #b00000000000000000000000000000000)))))

(declare-fun b!1040249 () Bool)

(assert (=> b!1040249 (= e!588766 e!588767)))

(declare-fun c!105698 () Bool)

(assert (=> b!1040249 (= c!105698 (validKeyInArray!0 (select (arr!31525 lt!458385) #b00000000000000000000000000000000)))))

(declare-fun d!125887 () Bool)

(declare-fun res!693456 () Bool)

(assert (=> d!125887 (=> res!693456 e!588769)))

(assert (=> d!125887 (= res!693456 (bvsge #b00000000000000000000000000000000 (size!32057 lt!458385)))))

(assert (=> d!125887 (= (arrayNoDuplicates!0 lt!458385 #b00000000000000000000000000000000 Nil!21926) e!588769)))

(declare-fun b!1040250 () Bool)

(assert (=> b!1040250 (= e!588767 call!44038)))

(declare-fun bm!44035 () Bool)

(assert (=> bm!44035 (= call!44038 (arrayNoDuplicates!0 lt!458385 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105698 (Cons!21925 (select (arr!31525 lt!458385) #b00000000000000000000000000000000) Nil!21926) Nil!21926)))))

(assert (= (and d!125887 (not res!693456)) b!1040246))

(assert (= (and b!1040246 res!693455) b!1040248))

(assert (= (and b!1040246 res!693457) b!1040249))

(assert (= (and b!1040249 c!105698) b!1040247))

(assert (= (and b!1040249 (not c!105698)) b!1040250))

(assert (= (or b!1040247 b!1040250) bm!44035))

(assert (=> b!1040246 m!960415))

(assert (=> b!1040246 m!960415))

(assert (=> b!1040246 m!960417))

(assert (=> b!1040248 m!960415))

(assert (=> b!1040248 m!960415))

(declare-fun m!960427 () Bool)

(assert (=> b!1040248 m!960427))

(assert (=> b!1040249 m!960415))

(assert (=> b!1040249 m!960415))

(assert (=> b!1040249 m!960417))

(assert (=> bm!44035 m!960415))

(declare-fun m!960429 () Bool)

(assert (=> bm!44035 m!960429))

(assert (=> b!1040128 d!125887))

(declare-fun d!125889 () Bool)

(declare-fun e!588772 () Bool)

(assert (=> d!125889 e!588772))

(declare-fun res!693460 () Bool)

(assert (=> d!125889 (=> (not res!693460) (not e!588772))))

(assert (=> d!125889 (= res!693460 (and (bvsge (index!41292 lt!458384) #b00000000000000000000000000000000) (bvslt (index!41292 lt!458384) (size!32057 (_keys!11556 thiss!1427)))))))

(declare-fun lt!458433 () Unit!33985)

(declare-fun choose!53 (array!65513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21929) Unit!33985)

(assert (=> d!125889 (= lt!458433 (choose!53 (_keys!11556 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41292 lt!458384) #b00000000000000000000000000000000 Nil!21926))))

(assert (=> d!125889 (bvslt (size!32057 (_keys!11556 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125889 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11556 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41292 lt!458384) #b00000000000000000000000000000000 Nil!21926) lt!458433)))

(declare-fun b!1040253 () Bool)

(assert (=> b!1040253 (= e!588772 (arrayNoDuplicates!0 (array!65514 (store (arr!31525 (_keys!11556 thiss!1427)) (index!41292 lt!458384) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32057 (_keys!11556 thiss!1427))) #b00000000000000000000000000000000 Nil!21926))))

(assert (= (and d!125889 res!693460) b!1040253))

(declare-fun m!960431 () Bool)

(assert (=> d!125889 m!960431))

(assert (=> b!1040253 m!960325))

(declare-fun m!960433 () Bool)

(assert (=> b!1040253 m!960433))

(assert (=> b!1040128 d!125889))

(declare-fun d!125891 () Bool)

(assert (=> d!125891 (= (array_inv!24387 (_keys!11556 thiss!1427)) (bvsge (size!32057 (_keys!11556 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040125 d!125891))

(declare-fun d!125893 () Bool)

(assert (=> d!125893 (= (array_inv!24388 (_values!6335 thiss!1427)) (bvsge (size!32058 (_values!6335 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040125 d!125893))

(declare-fun b!1040260 () Bool)

(declare-fun e!588778 () Bool)

(assert (=> b!1040260 (= e!588778 tp_is_empty!24673)))

(declare-fun mapNonEmpty!38569 () Bool)

(declare-fun mapRes!38569 () Bool)

(declare-fun tp!74042 () Bool)

(assert (=> mapNonEmpty!38569 (= mapRes!38569 (and tp!74042 e!588778))))

(declare-fun mapKey!38569 () (_ BitVec 32))

(declare-fun mapRest!38569 () (Array (_ BitVec 32) ValueCell!11633))

(declare-fun mapValue!38569 () ValueCell!11633)

(assert (=> mapNonEmpty!38569 (= mapRest!38560 (store mapRest!38569 mapKey!38569 mapValue!38569))))

(declare-fun condMapEmpty!38569 () Bool)

(declare-fun mapDefault!38569 () ValueCell!11633)

(assert (=> mapNonEmpty!38560 (= condMapEmpty!38569 (= mapRest!38560 ((as const (Array (_ BitVec 32) ValueCell!11633)) mapDefault!38569)))))

(declare-fun e!588777 () Bool)

(assert (=> mapNonEmpty!38560 (= tp!74027 (and e!588777 mapRes!38569))))

(declare-fun mapIsEmpty!38569 () Bool)

(assert (=> mapIsEmpty!38569 mapRes!38569))

(declare-fun b!1040261 () Bool)

(assert (=> b!1040261 (= e!588777 tp_is_empty!24673)))

(assert (= (and mapNonEmpty!38560 condMapEmpty!38569) mapIsEmpty!38569))

(assert (= (and mapNonEmpty!38560 (not condMapEmpty!38569)) mapNonEmpty!38569))

(assert (= (and mapNonEmpty!38569 ((_ is ValueCellFull!11633) mapValue!38569)) b!1040260))

(assert (= (and mapNonEmpty!38560 ((_ is ValueCellFull!11633) mapDefault!38569)) b!1040261))

(declare-fun m!960435 () Bool)

(assert (=> mapNonEmpty!38569 m!960435))

(check-sat (not b!1040253) (not mapNonEmpty!38569) (not b!1040207) (not d!125889) (not b!1040187) (not b!1040217) (not d!125877) tp_is_empty!24673 (not b!1040248) (not bm!44031) (not b!1040216) (not bm!44032) b_and!33495 (not b!1040249) (not b_next!20953) (not b!1040246) (not b!1040189) (not b!1040231) (not b!1040219) (not d!125875) (not d!125879) (not bm!44035) (not b!1040188) (not b!1040235))
(check-sat b_and!33495 (not b_next!20953))
