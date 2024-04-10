; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91038 () Bool)

(assert start!91038)

(declare-fun b!1039673 () Bool)

(declare-fun b_free!20985 () Bool)

(declare-fun b_next!20985 () Bool)

(assert (=> b!1039673 (= b_free!20985 (not b_next!20985))))

(declare-fun tp!74137 () Bool)

(declare-fun b_and!33517 () Bool)

(assert (=> b!1039673 (= tp!74137 b_and!33517)))

(declare-fun mapIsEmpty!38623 () Bool)

(declare-fun mapRes!38623 () Bool)

(assert (=> mapIsEmpty!38623 mapRes!38623))

(declare-fun b!1039670 () Bool)

(declare-fun e!588470 () Bool)

(declare-datatypes ((SeekEntryResult!9786 0))(
  ( (MissingZero!9786 (index!41515 (_ BitVec 32))) (Found!9786 (index!41516 (_ BitVec 32))) (Intermediate!9786 (undefined!10598 Bool) (index!41517 (_ BitVec 32)) (x!92794 (_ BitVec 32))) (Undefined!9786) (MissingVacant!9786 (index!41518 (_ BitVec 32))) )
))
(declare-fun lt!458188 () SeekEntryResult!9786)

(assert (=> b!1039670 (= e!588470 (not (bvsge (index!41516 lt!458188) #b00000000000000000000000000000000)))))

(declare-datatypes ((array!65538 0))(
  ( (array!65539 (arr!31539 (Array (_ BitVec 32) (_ BitVec 64))) (size!32070 (_ BitVec 32))) )
))
(declare-fun lt!458185 () array!65538)

(declare-datatypes ((V!37813 0))(
  ( (V!37814 (val!12403 Int)) )
))
(declare-datatypes ((ValueCell!11649 0))(
  ( (ValueCellFull!11649 (v!14990 V!37813)) (EmptyCell!11649) )
))
(declare-datatypes ((array!65540 0))(
  ( (array!65541 (arr!31540 (Array (_ BitVec 32) ValueCell!11649)) (size!32071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5892 0))(
  ( (LongMapFixedSize!5893 (defaultEntry!6328 Int) (mask!30299 (_ BitVec 32)) (extraKeys!6056 (_ BitVec 32)) (zeroValue!6162 V!37813) (minValue!6162 V!37813) (_size!3001 (_ BitVec 32)) (_keys!11540 array!65538) (_values!6351 array!65540) (_vacant!3001 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5892)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65538 (_ BitVec 32)) Bool)

(assert (=> b!1039670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458185 (mask!30299 thiss!1427))))

(declare-datatypes ((Unit!33999 0))(
  ( (Unit!34000) )
))
(declare-fun lt!458189 () Unit!33999)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65538 (_ BitVec 32) (_ BitVec 32)) Unit!33999)

(assert (=> b!1039670 (= lt!458189 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11540 thiss!1427) (index!41516 lt!458188) (mask!30299 thiss!1427)))))

(declare-datatypes ((List!21949 0))(
  ( (Nil!21946) (Cons!21945 (h!23149 (_ BitVec 64)) (t!31163 List!21949)) )
))
(declare-fun arrayNoDuplicates!0 (array!65538 (_ BitVec 32) List!21949) Bool)

(assert (=> b!1039670 (arrayNoDuplicates!0 lt!458185 #b00000000000000000000000000000000 Nil!21946)))

(declare-fun lt!458187 () Unit!33999)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21949) Unit!33999)

(assert (=> b!1039670 (= lt!458187 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41516 lt!458188) #b00000000000000000000000000000000 Nil!21946))))

(declare-fun arrayCountValidKeys!0 (array!65538 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039670 (= (arrayCountValidKeys!0 lt!458185 #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039670 (= lt!458185 (array!65539 (store (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32070 (_keys!11540 thiss!1427))))))

(declare-fun lt!458186 () Unit!33999)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65538 (_ BitVec 32) (_ BitVec 64)) Unit!33999)

(assert (=> b!1039670 (= lt!458186 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11540 thiss!1427) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039671 () Bool)

(declare-fun e!588465 () Bool)

(assert (=> b!1039671 (= e!588465 e!588470)))

(declare-fun res!693309 () Bool)

(assert (=> b!1039671 (=> (not res!693309) (not e!588470))))

(get-info :version)

(assert (=> b!1039671 (= res!693309 ((_ is Found!9786) lt!458188))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65538 (_ BitVec 32)) SeekEntryResult!9786)

(assert (=> b!1039671 (= lt!458188 (seekEntry!0 key!909 (_keys!11540 thiss!1427) (mask!30299 thiss!1427)))))

(declare-fun b!1039672 () Bool)

(declare-fun e!588464 () Bool)

(declare-fun e!588467 () Bool)

(assert (=> b!1039672 (= e!588464 (and e!588467 mapRes!38623))))

(declare-fun condMapEmpty!38623 () Bool)

(declare-fun mapDefault!38623 () ValueCell!11649)

(assert (=> b!1039672 (= condMapEmpty!38623 (= (arr!31540 (_values!6351 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11649)) mapDefault!38623)))))

(declare-fun res!693310 () Bool)

(assert (=> start!91038 (=> (not res!693310) (not e!588465))))

(declare-fun valid!2213 (LongMapFixedSize!5892) Bool)

(assert (=> start!91038 (= res!693310 (valid!2213 thiss!1427))))

(assert (=> start!91038 e!588465))

(declare-fun e!588469 () Bool)

(assert (=> start!91038 e!588469))

(assert (=> start!91038 true))

(declare-fun tp_is_empty!24705 () Bool)

(declare-fun array_inv!24379 (array!65538) Bool)

(declare-fun array_inv!24380 (array!65540) Bool)

(assert (=> b!1039673 (= e!588469 (and tp!74137 tp_is_empty!24705 (array_inv!24379 (_keys!11540 thiss!1427)) (array_inv!24380 (_values!6351 thiss!1427)) e!588464))))

(declare-fun b!1039674 () Bool)

(declare-fun res!693308 () Bool)

(assert (=> b!1039674 (=> (not res!693308) (not e!588465))))

(assert (=> b!1039674 (= res!693308 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039675 () Bool)

(assert (=> b!1039675 (= e!588467 tp_is_empty!24705)))

(declare-fun b!1039676 () Bool)

(declare-fun e!588466 () Bool)

(assert (=> b!1039676 (= e!588466 tp_is_empty!24705)))

(declare-fun mapNonEmpty!38623 () Bool)

(declare-fun tp!74138 () Bool)

(assert (=> mapNonEmpty!38623 (= mapRes!38623 (and tp!74138 e!588466))))

(declare-fun mapRest!38623 () (Array (_ BitVec 32) ValueCell!11649))

(declare-fun mapKey!38623 () (_ BitVec 32))

(declare-fun mapValue!38623 () ValueCell!11649)

(assert (=> mapNonEmpty!38623 (= (arr!31540 (_values!6351 thiss!1427)) (store mapRest!38623 mapKey!38623 mapValue!38623))))

(assert (= (and start!91038 res!693310) b!1039674))

(assert (= (and b!1039674 res!693308) b!1039671))

(assert (= (and b!1039671 res!693309) b!1039670))

(assert (= (and b!1039672 condMapEmpty!38623) mapIsEmpty!38623))

(assert (= (and b!1039672 (not condMapEmpty!38623)) mapNonEmpty!38623))

(assert (= (and mapNonEmpty!38623 ((_ is ValueCellFull!11649) mapValue!38623)) b!1039676))

(assert (= (and b!1039672 ((_ is ValueCellFull!11649) mapDefault!38623)) b!1039675))

(assert (= b!1039673 b!1039672))

(assert (= start!91038 b!1039673))

(declare-fun m!959331 () Bool)

(assert (=> b!1039671 m!959331))

(declare-fun m!959333 () Bool)

(assert (=> mapNonEmpty!38623 m!959333))

(declare-fun m!959335 () Bool)

(assert (=> b!1039670 m!959335))

(declare-fun m!959337 () Bool)

(assert (=> b!1039670 m!959337))

(declare-fun m!959339 () Bool)

(assert (=> b!1039670 m!959339))

(declare-fun m!959341 () Bool)

(assert (=> b!1039670 m!959341))

(declare-fun m!959343 () Bool)

(assert (=> b!1039670 m!959343))

(declare-fun m!959345 () Bool)

(assert (=> b!1039670 m!959345))

(declare-fun m!959347 () Bool)

(assert (=> b!1039670 m!959347))

(declare-fun m!959349 () Bool)

(assert (=> b!1039670 m!959349))

(declare-fun m!959351 () Bool)

(assert (=> start!91038 m!959351))

(declare-fun m!959353 () Bool)

(assert (=> b!1039673 m!959353))

(declare-fun m!959355 () Bool)

(assert (=> b!1039673 m!959355))

(check-sat (not start!91038) (not b!1039673) tp_is_empty!24705 b_and!33517 (not b_next!20985) (not b!1039671) (not b!1039670) (not mapNonEmpty!38623))
(check-sat b_and!33517 (not b_next!20985))
(get-model)

(declare-fun d!125535 () Bool)

(assert (=> d!125535 (= (array_inv!24379 (_keys!11540 thiss!1427)) (bvsge (size!32070 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039673 d!125535))

(declare-fun d!125537 () Bool)

(assert (=> d!125537 (= (array_inv!24380 (_values!6351 thiss!1427)) (bvsge (size!32071 (_values!6351 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039673 d!125537))

(declare-fun d!125539 () Bool)

(declare-fun res!693326 () Bool)

(declare-fun e!588494 () Bool)

(assert (=> d!125539 (=> (not res!693326) (not e!588494))))

(declare-fun simpleValid!429 (LongMapFixedSize!5892) Bool)

(assert (=> d!125539 (= res!693326 (simpleValid!429 thiss!1427))))

(assert (=> d!125539 (= (valid!2213 thiss!1427) e!588494)))

(declare-fun b!1039704 () Bool)

(declare-fun res!693327 () Bool)

(assert (=> b!1039704 (=> (not res!693327) (not e!588494))))

(assert (=> b!1039704 (= res!693327 (= (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) (_size!3001 thiss!1427)))))

(declare-fun b!1039705 () Bool)

(declare-fun res!693328 () Bool)

(assert (=> b!1039705 (=> (not res!693328) (not e!588494))))

(assert (=> b!1039705 (= res!693328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11540 thiss!1427) (mask!30299 thiss!1427)))))

(declare-fun b!1039706 () Bool)

(assert (=> b!1039706 (= e!588494 (arrayNoDuplicates!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 Nil!21946))))

(assert (= (and d!125539 res!693326) b!1039704))

(assert (= (and b!1039704 res!693327) b!1039705))

(assert (= (and b!1039705 res!693328) b!1039706))

(declare-fun m!959383 () Bool)

(assert (=> d!125539 m!959383))

(assert (=> b!1039704 m!959339))

(declare-fun m!959385 () Bool)

(assert (=> b!1039705 m!959385))

(declare-fun m!959387 () Bool)

(assert (=> b!1039706 m!959387))

(assert (=> start!91038 d!125539))

(declare-fun b!1039717 () Bool)

(declare-fun e!588505 () Bool)

(declare-fun call!44007 () Bool)

(assert (=> b!1039717 (= e!588505 call!44007)))

(declare-fun bm!44004 () Bool)

(declare-fun c!105376 () Bool)

(assert (=> bm!44004 (= call!44007 (arrayNoDuplicates!0 lt!458185 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105376 (Cons!21945 (select (arr!31539 lt!458185) #b00000000000000000000000000000000) Nil!21946) Nil!21946)))))

(declare-fun b!1039718 () Bool)

(declare-fun e!588503 () Bool)

(declare-fun e!588506 () Bool)

(assert (=> b!1039718 (= e!588503 e!588506)))

(declare-fun res!693335 () Bool)

(assert (=> b!1039718 (=> (not res!693335) (not e!588506))))

(declare-fun e!588504 () Bool)

(assert (=> b!1039718 (= res!693335 (not e!588504))))

(declare-fun res!693336 () Bool)

(assert (=> b!1039718 (=> (not res!693336) (not e!588504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039718 (= res!693336 (validKeyInArray!0 (select (arr!31539 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun d!125541 () Bool)

(declare-fun res!693337 () Bool)

(assert (=> d!125541 (=> res!693337 e!588503)))

(assert (=> d!125541 (= res!693337 (bvsge #b00000000000000000000000000000000 (size!32070 lt!458185)))))

(assert (=> d!125541 (= (arrayNoDuplicates!0 lt!458185 #b00000000000000000000000000000000 Nil!21946) e!588503)))

(declare-fun b!1039719 () Bool)

(declare-fun contains!6045 (List!21949 (_ BitVec 64)) Bool)

(assert (=> b!1039719 (= e!588504 (contains!6045 Nil!21946 (select (arr!31539 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun b!1039720 () Bool)

(assert (=> b!1039720 (= e!588506 e!588505)))

(assert (=> b!1039720 (= c!105376 (validKeyInArray!0 (select (arr!31539 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun b!1039721 () Bool)

(assert (=> b!1039721 (= e!588505 call!44007)))

(assert (= (and d!125541 (not res!693337)) b!1039718))

(assert (= (and b!1039718 res!693336) b!1039719))

(assert (= (and b!1039718 res!693335) b!1039720))

(assert (= (and b!1039720 c!105376) b!1039721))

(assert (= (and b!1039720 (not c!105376)) b!1039717))

(assert (= (or b!1039721 b!1039717) bm!44004))

(declare-fun m!959389 () Bool)

(assert (=> bm!44004 m!959389))

(declare-fun m!959391 () Bool)

(assert (=> bm!44004 m!959391))

(assert (=> b!1039718 m!959389))

(assert (=> b!1039718 m!959389))

(declare-fun m!959393 () Bool)

(assert (=> b!1039718 m!959393))

(assert (=> b!1039719 m!959389))

(assert (=> b!1039719 m!959389))

(declare-fun m!959395 () Bool)

(assert (=> b!1039719 m!959395))

(assert (=> b!1039720 m!959389))

(assert (=> b!1039720 m!959389))

(assert (=> b!1039720 m!959393))

(assert (=> b!1039670 d!125541))

(declare-fun d!125543 () Bool)

(declare-fun e!588509 () Bool)

(assert (=> d!125543 e!588509))

(declare-fun res!693340 () Bool)

(assert (=> d!125543 (=> (not res!693340) (not e!588509))))

(assert (=> d!125543 (= res!693340 (and (bvsge (index!41516 lt!458188) #b00000000000000000000000000000000) (bvslt (index!41516 lt!458188) (size!32070 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458207 () Unit!33999)

(declare-fun choose!25 (array!65538 (_ BitVec 32) (_ BitVec 32)) Unit!33999)

(assert (=> d!125543 (= lt!458207 (choose!25 (_keys!11540 thiss!1427) (index!41516 lt!458188) (mask!30299 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125543 (validMask!0 (mask!30299 thiss!1427))))

(assert (=> d!125543 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11540 thiss!1427) (index!41516 lt!458188) (mask!30299 thiss!1427)) lt!458207)))

(declare-fun b!1039724 () Bool)

(assert (=> b!1039724 (= e!588509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65539 (store (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32070 (_keys!11540 thiss!1427))) (mask!30299 thiss!1427)))))

(assert (= (and d!125543 res!693340) b!1039724))

(declare-fun m!959397 () Bool)

(assert (=> d!125543 m!959397))

(declare-fun m!959399 () Bool)

(assert (=> d!125543 m!959399))

(assert (=> b!1039724 m!959345))

(declare-fun m!959401 () Bool)

(assert (=> b!1039724 m!959401))

(assert (=> b!1039670 d!125543))

(declare-fun b!1039733 () Bool)

(declare-fun res!693351 () Bool)

(declare-fun e!588515 () Bool)

(assert (=> b!1039733 (=> (not res!693351) (not e!588515))))

(assert (=> b!1039733 (= res!693351 (validKeyInArray!0 (select (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458188))))))

(declare-fun b!1039735 () Bool)

(assert (=> b!1039735 (= e!588515 (bvslt (size!32070 (_keys!11540 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039734 () Bool)

(declare-fun res!693352 () Bool)

(assert (=> b!1039734 (=> (not res!693352) (not e!588515))))

(assert (=> b!1039734 (= res!693352 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125545 () Bool)

(declare-fun e!588514 () Bool)

(assert (=> d!125545 e!588514))

(declare-fun res!693349 () Bool)

(assert (=> d!125545 (=> (not res!693349) (not e!588514))))

(assert (=> d!125545 (= res!693349 (and (bvsge (index!41516 lt!458188) #b00000000000000000000000000000000) (bvslt (index!41516 lt!458188) (size!32070 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458210 () Unit!33999)

(declare-fun choose!82 (array!65538 (_ BitVec 32) (_ BitVec 64)) Unit!33999)

(assert (=> d!125545 (= lt!458210 (choose!82 (_keys!11540 thiss!1427) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125545 e!588515))

(declare-fun res!693350 () Bool)

(assert (=> d!125545 (=> (not res!693350) (not e!588515))))

(assert (=> d!125545 (= res!693350 (and (bvsge (index!41516 lt!458188) #b00000000000000000000000000000000) (bvslt (index!41516 lt!458188) (size!32070 (_keys!11540 thiss!1427)))))))

(assert (=> d!125545 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11540 thiss!1427) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458210)))

(declare-fun b!1039736 () Bool)

(assert (=> b!1039736 (= e!588514 (= (arrayCountValidKeys!0 (array!65539 (store (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32070 (_keys!11540 thiss!1427))) #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!125545 res!693350) b!1039733))

(assert (= (and b!1039733 res!693351) b!1039734))

(assert (= (and b!1039734 res!693352) b!1039735))

(assert (= (and d!125545 res!693349) b!1039736))

(declare-fun m!959403 () Bool)

(assert (=> b!1039733 m!959403))

(assert (=> b!1039733 m!959403))

(declare-fun m!959405 () Bool)

(assert (=> b!1039733 m!959405))

(declare-fun m!959407 () Bool)

(assert (=> b!1039734 m!959407))

(declare-fun m!959409 () Bool)

(assert (=> d!125545 m!959409))

(assert (=> b!1039736 m!959345))

(declare-fun m!959411 () Bool)

(assert (=> b!1039736 m!959411))

(assert (=> b!1039736 m!959339))

(assert (=> b!1039670 d!125545))

(declare-fun d!125547 () Bool)

(declare-fun lt!458213 () (_ BitVec 32))

(assert (=> d!125547 (and (bvsge lt!458213 #b00000000000000000000000000000000) (bvsle lt!458213 (bvsub (size!32070 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588520 () (_ BitVec 32))

(assert (=> d!125547 (= lt!458213 e!588520)))

(declare-fun c!105382 () Bool)

(assert (=> d!125547 (= c!105382 (bvsge #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))))))

(assert (=> d!125547 (and (bvsle #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32070 (_keys!11540 thiss!1427)) (size!32070 (_keys!11540 thiss!1427))))))

(assert (=> d!125547 (= (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) lt!458213)))

(declare-fun bm!44007 () Bool)

(declare-fun call!44010 () (_ BitVec 32))

(assert (=> bm!44007 (= call!44010 (arrayCountValidKeys!0 (_keys!11540 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32070 (_keys!11540 thiss!1427))))))

(declare-fun b!1039745 () Bool)

(declare-fun e!588521 () (_ BitVec 32))

(assert (=> b!1039745 (= e!588520 e!588521)))

(declare-fun c!105381 () Bool)

(assert (=> b!1039745 (= c!105381 (validKeyInArray!0 (select (arr!31539 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039746 () Bool)

(assert (=> b!1039746 (= e!588521 (bvadd #b00000000000000000000000000000001 call!44010))))

(declare-fun b!1039747 () Bool)

(assert (=> b!1039747 (= e!588520 #b00000000000000000000000000000000)))

(declare-fun b!1039748 () Bool)

(assert (=> b!1039748 (= e!588521 call!44010)))

(assert (= (and d!125547 c!105382) b!1039747))

(assert (= (and d!125547 (not c!105382)) b!1039745))

(assert (= (and b!1039745 c!105381) b!1039746))

(assert (= (and b!1039745 (not c!105381)) b!1039748))

(assert (= (or b!1039746 b!1039748) bm!44007))

(declare-fun m!959413 () Bool)

(assert (=> bm!44007 m!959413))

(declare-fun m!959415 () Bool)

(assert (=> b!1039745 m!959415))

(assert (=> b!1039745 m!959415))

(declare-fun m!959417 () Bool)

(assert (=> b!1039745 m!959417))

(assert (=> b!1039670 d!125547))

(declare-fun d!125549 () Bool)

(declare-fun e!588524 () Bool)

(assert (=> d!125549 e!588524))

(declare-fun res!693355 () Bool)

(assert (=> d!125549 (=> (not res!693355) (not e!588524))))

(assert (=> d!125549 (= res!693355 (and (bvsge (index!41516 lt!458188) #b00000000000000000000000000000000) (bvslt (index!41516 lt!458188) (size!32070 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458216 () Unit!33999)

(declare-fun choose!53 (array!65538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21949) Unit!33999)

(assert (=> d!125549 (= lt!458216 (choose!53 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41516 lt!458188) #b00000000000000000000000000000000 Nil!21946))))

(assert (=> d!125549 (bvslt (size!32070 (_keys!11540 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125549 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41516 lt!458188) #b00000000000000000000000000000000 Nil!21946) lt!458216)))

(declare-fun b!1039751 () Bool)

(assert (=> b!1039751 (= e!588524 (arrayNoDuplicates!0 (array!65539 (store (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458188) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32070 (_keys!11540 thiss!1427))) #b00000000000000000000000000000000 Nil!21946))))

(assert (= (and d!125549 res!693355) b!1039751))

(declare-fun m!959419 () Bool)

(assert (=> d!125549 m!959419))

(assert (=> b!1039751 m!959345))

(declare-fun m!959421 () Bool)

(assert (=> b!1039751 m!959421))

(assert (=> b!1039670 d!125549))

(declare-fun d!125551 () Bool)

(declare-fun lt!458217 () (_ BitVec 32))

(assert (=> d!125551 (and (bvsge lt!458217 #b00000000000000000000000000000000) (bvsle lt!458217 (bvsub (size!32070 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun e!588525 () (_ BitVec 32))

(assert (=> d!125551 (= lt!458217 e!588525)))

(declare-fun c!105384 () Bool)

(assert (=> d!125551 (= c!105384 (bvsge #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))))))

(assert (=> d!125551 (and (bvsle #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32070 (_keys!11540 thiss!1427)) (size!32070 lt!458185)))))

(assert (=> d!125551 (= (arrayCountValidKeys!0 lt!458185 #b00000000000000000000000000000000 (size!32070 (_keys!11540 thiss!1427))) lt!458217)))

(declare-fun bm!44008 () Bool)

(declare-fun call!44011 () (_ BitVec 32))

(assert (=> bm!44008 (= call!44011 (arrayCountValidKeys!0 lt!458185 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32070 (_keys!11540 thiss!1427))))))

(declare-fun b!1039752 () Bool)

(declare-fun e!588526 () (_ BitVec 32))

(assert (=> b!1039752 (= e!588525 e!588526)))

(declare-fun c!105383 () Bool)

(assert (=> b!1039752 (= c!105383 (validKeyInArray!0 (select (arr!31539 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun b!1039753 () Bool)

(assert (=> b!1039753 (= e!588526 (bvadd #b00000000000000000000000000000001 call!44011))))

(declare-fun b!1039754 () Bool)

(assert (=> b!1039754 (= e!588525 #b00000000000000000000000000000000)))

(declare-fun b!1039755 () Bool)

(assert (=> b!1039755 (= e!588526 call!44011)))

(assert (= (and d!125551 c!105384) b!1039754))

(assert (= (and d!125551 (not c!105384)) b!1039752))

(assert (= (and b!1039752 c!105383) b!1039753))

(assert (= (and b!1039752 (not c!105383)) b!1039755))

(assert (= (or b!1039753 b!1039755) bm!44008))

(declare-fun m!959423 () Bool)

(assert (=> bm!44008 m!959423))

(assert (=> b!1039752 m!959389))

(assert (=> b!1039752 m!959389))

(assert (=> b!1039752 m!959393))

(assert (=> b!1039670 d!125551))

(declare-fun d!125553 () Bool)

(declare-fun res!693361 () Bool)

(declare-fun e!588535 () Bool)

(assert (=> d!125553 (=> res!693361 e!588535)))

(assert (=> d!125553 (= res!693361 (bvsge #b00000000000000000000000000000000 (size!32070 lt!458185)))))

(assert (=> d!125553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458185 (mask!30299 thiss!1427)) e!588535)))

(declare-fun b!1039764 () Bool)

(declare-fun e!588533 () Bool)

(assert (=> b!1039764 (= e!588535 e!588533)))

(declare-fun c!105387 () Bool)

(assert (=> b!1039764 (= c!105387 (validKeyInArray!0 (select (arr!31539 lt!458185) #b00000000000000000000000000000000)))))

(declare-fun b!1039765 () Bool)

(declare-fun call!44014 () Bool)

(assert (=> b!1039765 (= e!588533 call!44014)))

(declare-fun b!1039766 () Bool)

(declare-fun e!588534 () Bool)

(assert (=> b!1039766 (= e!588534 call!44014)))

(declare-fun b!1039767 () Bool)

(assert (=> b!1039767 (= e!588533 e!588534)))

(declare-fun lt!458224 () (_ BitVec 64))

(assert (=> b!1039767 (= lt!458224 (select (arr!31539 lt!458185) #b00000000000000000000000000000000))))

(declare-fun lt!458225 () Unit!33999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65538 (_ BitVec 64) (_ BitVec 32)) Unit!33999)

(assert (=> b!1039767 (= lt!458225 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458185 lt!458224 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039767 (arrayContainsKey!0 lt!458185 lt!458224 #b00000000000000000000000000000000)))

(declare-fun lt!458226 () Unit!33999)

(assert (=> b!1039767 (= lt!458226 lt!458225)))

(declare-fun res!693360 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65538 (_ BitVec 32)) SeekEntryResult!9786)

(assert (=> b!1039767 (= res!693360 (= (seekEntryOrOpen!0 (select (arr!31539 lt!458185) #b00000000000000000000000000000000) lt!458185 (mask!30299 thiss!1427)) (Found!9786 #b00000000000000000000000000000000)))))

(assert (=> b!1039767 (=> (not res!693360) (not e!588534))))

(declare-fun bm!44011 () Bool)

(assert (=> bm!44011 (= call!44014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458185 (mask!30299 thiss!1427)))))

(assert (= (and d!125553 (not res!693361)) b!1039764))

(assert (= (and b!1039764 c!105387) b!1039767))

(assert (= (and b!1039764 (not c!105387)) b!1039765))

(assert (= (and b!1039767 res!693360) b!1039766))

(assert (= (or b!1039766 b!1039765) bm!44011))

(assert (=> b!1039764 m!959389))

(assert (=> b!1039764 m!959389))

(assert (=> b!1039764 m!959393))

(assert (=> b!1039767 m!959389))

(declare-fun m!959425 () Bool)

(assert (=> b!1039767 m!959425))

(declare-fun m!959427 () Bool)

(assert (=> b!1039767 m!959427))

(assert (=> b!1039767 m!959389))

(declare-fun m!959429 () Bool)

(assert (=> b!1039767 m!959429))

(declare-fun m!959431 () Bool)

(assert (=> bm!44011 m!959431))

(assert (=> b!1039670 d!125553))

(declare-fun b!1039780 () Bool)

(declare-fun e!588543 () SeekEntryResult!9786)

(declare-fun e!588544 () SeekEntryResult!9786)

(assert (=> b!1039780 (= e!588543 e!588544)))

(declare-fun lt!458238 () (_ BitVec 64))

(declare-fun lt!458235 () SeekEntryResult!9786)

(assert (=> b!1039780 (= lt!458238 (select (arr!31539 (_keys!11540 thiss!1427)) (index!41517 lt!458235)))))

(declare-fun c!105395 () Bool)

(assert (=> b!1039780 (= c!105395 (= lt!458238 key!909))))

(declare-fun b!1039781 () Bool)

(assert (=> b!1039781 (= e!588544 (Found!9786 (index!41517 lt!458235)))))

(declare-fun d!125555 () Bool)

(declare-fun lt!458237 () SeekEntryResult!9786)

(assert (=> d!125555 (and (or ((_ is MissingVacant!9786) lt!458237) (not ((_ is Found!9786) lt!458237)) (and (bvsge (index!41516 lt!458237) #b00000000000000000000000000000000) (bvslt (index!41516 lt!458237) (size!32070 (_keys!11540 thiss!1427))))) (not ((_ is MissingVacant!9786) lt!458237)) (or (not ((_ is Found!9786) lt!458237)) (= (select (arr!31539 (_keys!11540 thiss!1427)) (index!41516 lt!458237)) key!909)))))

(assert (=> d!125555 (= lt!458237 e!588543)))

(declare-fun c!105394 () Bool)

(assert (=> d!125555 (= c!105394 (and ((_ is Intermediate!9786) lt!458235) (undefined!10598 lt!458235)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65538 (_ BitVec 32)) SeekEntryResult!9786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125555 (= lt!458235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30299 thiss!1427)) key!909 (_keys!11540 thiss!1427) (mask!30299 thiss!1427)))))

(assert (=> d!125555 (validMask!0 (mask!30299 thiss!1427))))

(assert (=> d!125555 (= (seekEntry!0 key!909 (_keys!11540 thiss!1427) (mask!30299 thiss!1427)) lt!458237)))

(declare-fun b!1039782 () Bool)

(assert (=> b!1039782 (= e!588543 Undefined!9786)))

(declare-fun b!1039783 () Bool)

(declare-fun e!588542 () SeekEntryResult!9786)

(assert (=> b!1039783 (= e!588542 (MissingZero!9786 (index!41517 lt!458235)))))

(declare-fun b!1039784 () Bool)

(declare-fun lt!458236 () SeekEntryResult!9786)

(assert (=> b!1039784 (= e!588542 (ite ((_ is MissingVacant!9786) lt!458236) (MissingZero!9786 (index!41518 lt!458236)) lt!458236))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65538 (_ BitVec 32)) SeekEntryResult!9786)

(assert (=> b!1039784 (= lt!458236 (seekKeyOrZeroReturnVacant!0 (x!92794 lt!458235) (index!41517 lt!458235) (index!41517 lt!458235) key!909 (_keys!11540 thiss!1427) (mask!30299 thiss!1427)))))

(declare-fun b!1039785 () Bool)

(declare-fun c!105396 () Bool)

(assert (=> b!1039785 (= c!105396 (= lt!458238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039785 (= e!588544 e!588542)))

(assert (= (and d!125555 c!105394) b!1039782))

(assert (= (and d!125555 (not c!105394)) b!1039780))

(assert (= (and b!1039780 c!105395) b!1039781))

(assert (= (and b!1039780 (not c!105395)) b!1039785))

(assert (= (and b!1039785 c!105396) b!1039783))

(assert (= (and b!1039785 (not c!105396)) b!1039784))

(declare-fun m!959433 () Bool)

(assert (=> b!1039780 m!959433))

(declare-fun m!959435 () Bool)

(assert (=> d!125555 m!959435))

(declare-fun m!959437 () Bool)

(assert (=> d!125555 m!959437))

(assert (=> d!125555 m!959437))

(declare-fun m!959439 () Bool)

(assert (=> d!125555 m!959439))

(assert (=> d!125555 m!959399))

(declare-fun m!959441 () Bool)

(assert (=> b!1039784 m!959441))

(assert (=> b!1039671 d!125555))

(declare-fun mapNonEmpty!38629 () Bool)

(declare-fun mapRes!38629 () Bool)

(declare-fun tp!74147 () Bool)

(declare-fun e!588550 () Bool)

(assert (=> mapNonEmpty!38629 (= mapRes!38629 (and tp!74147 e!588550))))

(declare-fun mapRest!38629 () (Array (_ BitVec 32) ValueCell!11649))

(declare-fun mapValue!38629 () ValueCell!11649)

(declare-fun mapKey!38629 () (_ BitVec 32))

(assert (=> mapNonEmpty!38629 (= mapRest!38623 (store mapRest!38629 mapKey!38629 mapValue!38629))))

(declare-fun mapIsEmpty!38629 () Bool)

(assert (=> mapIsEmpty!38629 mapRes!38629))

(declare-fun b!1039792 () Bool)

(assert (=> b!1039792 (= e!588550 tp_is_empty!24705)))

(declare-fun condMapEmpty!38629 () Bool)

(declare-fun mapDefault!38629 () ValueCell!11649)

(assert (=> mapNonEmpty!38623 (= condMapEmpty!38629 (= mapRest!38623 ((as const (Array (_ BitVec 32) ValueCell!11649)) mapDefault!38629)))))

(declare-fun e!588549 () Bool)

(assert (=> mapNonEmpty!38623 (= tp!74138 (and e!588549 mapRes!38629))))

(declare-fun b!1039793 () Bool)

(assert (=> b!1039793 (= e!588549 tp_is_empty!24705)))

(assert (= (and mapNonEmpty!38623 condMapEmpty!38629) mapIsEmpty!38629))

(assert (= (and mapNonEmpty!38623 (not condMapEmpty!38629)) mapNonEmpty!38629))

(assert (= (and mapNonEmpty!38629 ((_ is ValueCellFull!11649) mapValue!38629)) b!1039792))

(assert (= (and mapNonEmpty!38623 ((_ is ValueCellFull!11649) mapDefault!38629)) b!1039793))

(declare-fun m!959443 () Bool)

(assert (=> mapNonEmpty!38629 m!959443))

(check-sat (not b!1039724) (not bm!44008) (not b!1039704) (not b!1039718) tp_is_empty!24705 b_and!33517 (not b!1039752) (not b_next!20985) (not b!1039733) (not b!1039736) (not bm!44004) (not d!125539) (not b!1039734) (not d!125549) (not d!125545) (not d!125555) (not b!1039751) (not b!1039705) (not b!1039706) (not b!1039719) (not mapNonEmpty!38629) (not d!125543) (not b!1039764) (not b!1039784) (not b!1039720) (not bm!44011) (not b!1039767) (not b!1039745) (not bm!44007))
(check-sat b_and!33517 (not b_next!20985))
