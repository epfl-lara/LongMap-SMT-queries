; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91518 () Bool)

(assert start!91518)

(declare-fun b!1042464 () Bool)

(declare-fun b_free!21063 () Bool)

(declare-fun b_next!21063 () Bool)

(assert (=> b!1042464 (= b_free!21063 (not b_next!21063))))

(declare-fun tp!74415 () Bool)

(declare-fun b_and!33595 () Bool)

(assert (=> b!1042464 (= tp!74415 b_and!33595)))

(declare-fun b!1042463 () Bool)

(declare-fun e!590526 () Bool)

(declare-fun e!590527 () Bool)

(assert (=> b!1042463 (= e!590526 (not e!590527))))

(declare-fun res!694610 () Bool)

(assert (=> b!1042463 (=> res!694610 e!590527)))

(declare-datatypes ((V!37917 0))(
  ( (V!37918 (val!12442 Int)) )
))
(declare-datatypes ((ValueCell!11688 0))(
  ( (ValueCellFull!11688 (v!15033 V!37917)) (EmptyCell!11688) )
))
(declare-datatypes ((array!65720 0))(
  ( (array!65721 (arr!31617 (Array (_ BitVec 32) (_ BitVec 64))) (size!32152 (_ BitVec 32))) )
))
(declare-datatypes ((array!65722 0))(
  ( (array!65723 (arr!31618 (Array (_ BitVec 32) ValueCell!11688)) (size!32153 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5970 0))(
  ( (LongMapFixedSize!5971 (defaultEntry!6367 Int) (mask!30430 (_ BitVec 32)) (extraKeys!6095 (_ BitVec 32)) (zeroValue!6201 V!37917) (minValue!6201 V!37917) (_size!3040 (_ BitVec 32)) (_keys!11617 array!65720) (_values!6390 array!65722) (_vacant!3040 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5970)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042463 (= res!694610 (not (validMask!0 (mask!30430 thiss!1427))))))

(declare-fun lt!459488 () array!65720)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042463 (not (arrayContainsKey!0 lt!459488 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9817 0))(
  ( (MissingZero!9817 (index!41639 (_ BitVec 32))) (Found!9817 (index!41640 (_ BitVec 32))) (Intermediate!9817 (undefined!10629 Bool) (index!41641 (_ BitVec 32)) (x!93069 (_ BitVec 32))) (Undefined!9817) (MissingVacant!9817 (index!41642 (_ BitVec 32))) )
))
(declare-fun lt!459489 () SeekEntryResult!9817)

(declare-datatypes ((Unit!34047 0))(
  ( (Unit!34048) )
))
(declare-fun lt!459487 () Unit!34047)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65720 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> b!1042463 (= lt!459487 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65720 (_ BitVec 32)) Bool)

(assert (=> b!1042463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459488 (mask!30430 thiss!1427))))

(declare-fun lt!459485 () Unit!34047)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65720 (_ BitVec 32) (_ BitVec 32)) Unit!34047)

(assert (=> b!1042463 (= lt!459485 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) (mask!30430 thiss!1427)))))

(declare-datatypes ((List!21975 0))(
  ( (Nil!21972) (Cons!21971 (h!23179 (_ BitVec 64)) (t!31189 List!21975)) )
))
(declare-fun arrayNoDuplicates!0 (array!65720 (_ BitVec 32) List!21975) Bool)

(assert (=> b!1042463 (arrayNoDuplicates!0 lt!459488 #b00000000000000000000000000000000 Nil!21972)))

(declare-fun lt!459484 () Unit!34047)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21975) Unit!34047)

(assert (=> b!1042463 (= lt!459484 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41640 lt!459489) #b00000000000000000000000000000000 Nil!21972))))

(declare-fun arrayCountValidKeys!0 (array!65720 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042463 (= (arrayCountValidKeys!0 lt!459488 #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042463 (= lt!459488 (array!65721 (store (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32152 (_keys!11617 thiss!1427))))))

(declare-fun lt!459486 () Unit!34047)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65720 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> b!1042463 (= lt!459486 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24783 () Bool)

(declare-fun e!590528 () Bool)

(declare-fun e!590522 () Bool)

(declare-fun array_inv!24429 (array!65720) Bool)

(declare-fun array_inv!24430 (array!65722) Bool)

(assert (=> b!1042464 (= e!590522 (and tp!74415 tp_is_empty!24783 (array_inv!24429 (_keys!11617 thiss!1427)) (array_inv!24430 (_values!6390 thiss!1427)) e!590528))))

(declare-fun b!1042465 () Bool)

(declare-fun e!590523 () Bool)

(assert (=> b!1042465 (= e!590523 e!590526)))

(declare-fun res!694608 () Bool)

(assert (=> b!1042465 (=> (not res!694608) (not e!590526))))

(get-info :version)

(assert (=> b!1042465 (= res!694608 ((_ is Found!9817) lt!459489))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65720 (_ BitVec 32)) SeekEntryResult!9817)

(assert (=> b!1042465 (= lt!459489 (seekEntry!0 key!909 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)))))

(declare-fun b!1042466 () Bool)

(assert (=> b!1042466 (= e!590527 (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!21972))))

(declare-fun mapNonEmpty!38783 () Bool)

(declare-fun mapRes!38783 () Bool)

(declare-fun tp!74414 () Bool)

(declare-fun e!590525 () Bool)

(assert (=> mapNonEmpty!38783 (= mapRes!38783 (and tp!74414 e!590525))))

(declare-fun mapValue!38783 () ValueCell!11688)

(declare-fun mapKey!38783 () (_ BitVec 32))

(declare-fun mapRest!38783 () (Array (_ BitVec 32) ValueCell!11688))

(assert (=> mapNonEmpty!38783 (= (arr!31618 (_values!6390 thiss!1427)) (store mapRest!38783 mapKey!38783 mapValue!38783))))

(declare-fun b!1042467 () Bool)

(declare-fun res!694611 () Bool)

(assert (=> b!1042467 (=> res!694611 e!590527)))

(assert (=> b!1042467 (= res!694611 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30430 thiss!1427))))))

(declare-fun res!694607 () Bool)

(assert (=> start!91518 (=> (not res!694607) (not e!590523))))

(declare-fun valid!2243 (LongMapFixedSize!5970) Bool)

(assert (=> start!91518 (= res!694607 (valid!2243 thiss!1427))))

(assert (=> start!91518 e!590523))

(assert (=> start!91518 e!590522))

(assert (=> start!91518 true))

(declare-fun b!1042468 () Bool)

(declare-fun res!694609 () Bool)

(assert (=> b!1042468 (=> (not res!694609) (not e!590523))))

(assert (=> b!1042468 (= res!694609 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38783 () Bool)

(assert (=> mapIsEmpty!38783 mapRes!38783))

(declare-fun b!1042469 () Bool)

(assert (=> b!1042469 (= e!590525 tp_is_empty!24783)))

(declare-fun b!1042470 () Bool)

(declare-fun res!694612 () Bool)

(assert (=> b!1042470 (=> res!694612 e!590527)))

(assert (=> b!1042470 (= res!694612 (or (not (= (size!32153 (_values!6390 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30430 thiss!1427)))) (not (= (size!32152 (_keys!11617 thiss!1427)) (size!32153 (_values!6390 thiss!1427)))) (bvslt (mask!30430 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6095 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6095 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042471 () Bool)

(declare-fun e!590529 () Bool)

(assert (=> b!1042471 (= e!590528 (and e!590529 mapRes!38783))))

(declare-fun condMapEmpty!38783 () Bool)

(declare-fun mapDefault!38783 () ValueCell!11688)

(assert (=> b!1042471 (= condMapEmpty!38783 (= (arr!31618 (_values!6390 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11688)) mapDefault!38783)))))

(declare-fun b!1042472 () Bool)

(assert (=> b!1042472 (= e!590529 tp_is_empty!24783)))

(assert (= (and start!91518 res!694607) b!1042468))

(assert (= (and b!1042468 res!694609) b!1042465))

(assert (= (and b!1042465 res!694608) b!1042463))

(assert (= (and b!1042463 (not res!694610)) b!1042470))

(assert (= (and b!1042470 (not res!694612)) b!1042467))

(assert (= (and b!1042467 (not res!694611)) b!1042466))

(assert (= (and b!1042471 condMapEmpty!38783) mapIsEmpty!38783))

(assert (= (and b!1042471 (not condMapEmpty!38783)) mapNonEmpty!38783))

(assert (= (and mapNonEmpty!38783 ((_ is ValueCellFull!11688) mapValue!38783)) b!1042469))

(assert (= (and b!1042471 ((_ is ValueCellFull!11688) mapDefault!38783)) b!1042472))

(assert (= b!1042464 b!1042471))

(assert (= start!91518 b!1042464))

(declare-fun m!961775 () Bool)

(assert (=> b!1042464 m!961775))

(declare-fun m!961777 () Bool)

(assert (=> b!1042464 m!961777))

(declare-fun m!961779 () Bool)

(assert (=> mapNonEmpty!38783 m!961779))

(declare-fun m!961781 () Bool)

(assert (=> b!1042465 m!961781))

(declare-fun m!961783 () Bool)

(assert (=> b!1042466 m!961783))

(declare-fun m!961785 () Bool)

(assert (=> start!91518 m!961785))

(declare-fun m!961787 () Bool)

(assert (=> b!1042463 m!961787))

(declare-fun m!961789 () Bool)

(assert (=> b!1042463 m!961789))

(declare-fun m!961791 () Bool)

(assert (=> b!1042463 m!961791))

(declare-fun m!961793 () Bool)

(assert (=> b!1042463 m!961793))

(declare-fun m!961795 () Bool)

(assert (=> b!1042463 m!961795))

(declare-fun m!961797 () Bool)

(assert (=> b!1042463 m!961797))

(declare-fun m!961799 () Bool)

(assert (=> b!1042463 m!961799))

(declare-fun m!961801 () Bool)

(assert (=> b!1042463 m!961801))

(declare-fun m!961803 () Bool)

(assert (=> b!1042463 m!961803))

(declare-fun m!961805 () Bool)

(assert (=> b!1042463 m!961805))

(declare-fun m!961807 () Bool)

(assert (=> b!1042463 m!961807))

(declare-fun m!961809 () Bool)

(assert (=> b!1042467 m!961809))

(check-sat (not b!1042467) (not start!91518) tp_is_empty!24783 b_and!33595 (not b!1042466) (not b!1042464) (not b!1042463) (not b_next!21063) (not b!1042465) (not mapNonEmpty!38783))
(check-sat b_and!33595 (not b_next!21063))
(get-model)

(declare-fun b!1042513 () Bool)

(declare-fun e!590564 () Bool)

(declare-fun e!590563 () Bool)

(assert (=> b!1042513 (= e!590564 e!590563)))

(declare-fun c!105835 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042513 (= c!105835 (validKeyInArray!0 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042514 () Bool)

(declare-fun call!44177 () Bool)

(assert (=> b!1042514 (= e!590563 call!44177)))

(declare-fun d!126117 () Bool)

(declare-fun res!694637 () Bool)

(declare-fun e!590565 () Bool)

(assert (=> d!126117 (=> res!694637 e!590565)))

(assert (=> d!126117 (= res!694637 (bvsge #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))))))

(assert (=> d!126117 (= (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!21972) e!590565)))

(declare-fun b!1042515 () Bool)

(assert (=> b!1042515 (= e!590565 e!590564)))

(declare-fun res!694639 () Bool)

(assert (=> b!1042515 (=> (not res!694639) (not e!590564))))

(declare-fun e!590562 () Bool)

(assert (=> b!1042515 (= res!694639 (not e!590562))))

(declare-fun res!694638 () Bool)

(assert (=> b!1042515 (=> (not res!694638) (not e!590562))))

(assert (=> b!1042515 (= res!694638 (validKeyInArray!0 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042516 () Bool)

(assert (=> b!1042516 (= e!590563 call!44177)))

(declare-fun b!1042517 () Bool)

(declare-fun contains!6058 (List!21975 (_ BitVec 64)) Bool)

(assert (=> b!1042517 (= e!590562 (contains!6058 Nil!21972 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44174 () Bool)

(assert (=> bm!44174 (= call!44177 (arrayNoDuplicates!0 (_keys!11617 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105835 (Cons!21971 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000) Nil!21972) Nil!21972)))))

(assert (= (and d!126117 (not res!694637)) b!1042515))

(assert (= (and b!1042515 res!694638) b!1042517))

(assert (= (and b!1042515 res!694639) b!1042513))

(assert (= (and b!1042513 c!105835) b!1042516))

(assert (= (and b!1042513 (not c!105835)) b!1042514))

(assert (= (or b!1042516 b!1042514) bm!44174))

(declare-fun m!961847 () Bool)

(assert (=> b!1042513 m!961847))

(assert (=> b!1042513 m!961847))

(declare-fun m!961849 () Bool)

(assert (=> b!1042513 m!961849))

(assert (=> b!1042515 m!961847))

(assert (=> b!1042515 m!961847))

(assert (=> b!1042515 m!961849))

(assert (=> b!1042517 m!961847))

(assert (=> b!1042517 m!961847))

(declare-fun m!961851 () Bool)

(assert (=> b!1042517 m!961851))

(assert (=> bm!44174 m!961847))

(declare-fun m!961853 () Bool)

(assert (=> bm!44174 m!961853))

(assert (=> b!1042466 d!126117))

(declare-fun b!1042526 () Bool)

(declare-fun e!590573 () Bool)

(declare-fun call!44180 () Bool)

(assert (=> b!1042526 (= e!590573 call!44180)))

(declare-fun bm!44177 () Bool)

(assert (=> bm!44177 (= call!44180 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11617 thiss!1427) (mask!30430 thiss!1427)))))

(declare-fun b!1042527 () Bool)

(declare-fun e!590574 () Bool)

(assert (=> b!1042527 (= e!590574 call!44180)))

(declare-fun d!126119 () Bool)

(declare-fun res!694644 () Bool)

(declare-fun e!590572 () Bool)

(assert (=> d!126119 (=> res!694644 e!590572)))

(assert (=> d!126119 (= res!694644 (bvsge #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))))))

(assert (=> d!126119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)) e!590572)))

(declare-fun b!1042528 () Bool)

(assert (=> b!1042528 (= e!590572 e!590573)))

(declare-fun c!105838 () Bool)

(assert (=> b!1042528 (= c!105838 (validKeyInArray!0 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042529 () Bool)

(assert (=> b!1042529 (= e!590573 e!590574)))

(declare-fun lt!459515 () (_ BitVec 64))

(assert (=> b!1042529 (= lt!459515 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459516 () Unit!34047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65720 (_ BitVec 64) (_ BitVec 32)) Unit!34047)

(assert (=> b!1042529 (= lt!459516 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11617 thiss!1427) lt!459515 #b00000000000000000000000000000000))))

(assert (=> b!1042529 (arrayContainsKey!0 (_keys!11617 thiss!1427) lt!459515 #b00000000000000000000000000000000)))

(declare-fun lt!459514 () Unit!34047)

(assert (=> b!1042529 (= lt!459514 lt!459516)))

(declare-fun res!694645 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65720 (_ BitVec 32)) SeekEntryResult!9817)

(assert (=> b!1042529 (= res!694645 (= (seekEntryOrOpen!0 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000) (_keys!11617 thiss!1427) (mask!30430 thiss!1427)) (Found!9817 #b00000000000000000000000000000000)))))

(assert (=> b!1042529 (=> (not res!694645) (not e!590574))))

(assert (= (and d!126119 (not res!694644)) b!1042528))

(assert (= (and b!1042528 c!105838) b!1042529))

(assert (= (and b!1042528 (not c!105838)) b!1042526))

(assert (= (and b!1042529 res!694645) b!1042527))

(assert (= (or b!1042527 b!1042526) bm!44177))

(declare-fun m!961855 () Bool)

(assert (=> bm!44177 m!961855))

(assert (=> b!1042528 m!961847))

(assert (=> b!1042528 m!961847))

(assert (=> b!1042528 m!961849))

(assert (=> b!1042529 m!961847))

(declare-fun m!961857 () Bool)

(assert (=> b!1042529 m!961857))

(declare-fun m!961859 () Bool)

(assert (=> b!1042529 m!961859))

(assert (=> b!1042529 m!961847))

(declare-fun m!961861 () Bool)

(assert (=> b!1042529 m!961861))

(assert (=> b!1042467 d!126119))

(declare-fun b!1042530 () Bool)

(declare-fun e!590577 () Bool)

(declare-fun e!590576 () Bool)

(assert (=> b!1042530 (= e!590577 e!590576)))

(declare-fun c!105839 () Bool)

(assert (=> b!1042530 (= c!105839 (validKeyInArray!0 (select (arr!31617 lt!459488) #b00000000000000000000000000000000)))))

(declare-fun b!1042531 () Bool)

(declare-fun call!44181 () Bool)

(assert (=> b!1042531 (= e!590576 call!44181)))

(declare-fun d!126121 () Bool)

(declare-fun res!694646 () Bool)

(declare-fun e!590578 () Bool)

(assert (=> d!126121 (=> res!694646 e!590578)))

(assert (=> d!126121 (= res!694646 (bvsge #b00000000000000000000000000000000 (size!32152 lt!459488)))))

(assert (=> d!126121 (= (arrayNoDuplicates!0 lt!459488 #b00000000000000000000000000000000 Nil!21972) e!590578)))

(declare-fun b!1042532 () Bool)

(assert (=> b!1042532 (= e!590578 e!590577)))

(declare-fun res!694648 () Bool)

(assert (=> b!1042532 (=> (not res!694648) (not e!590577))))

(declare-fun e!590575 () Bool)

(assert (=> b!1042532 (= res!694648 (not e!590575))))

(declare-fun res!694647 () Bool)

(assert (=> b!1042532 (=> (not res!694647) (not e!590575))))

(assert (=> b!1042532 (= res!694647 (validKeyInArray!0 (select (arr!31617 lt!459488) #b00000000000000000000000000000000)))))

(declare-fun b!1042533 () Bool)

(assert (=> b!1042533 (= e!590576 call!44181)))

(declare-fun b!1042534 () Bool)

(assert (=> b!1042534 (= e!590575 (contains!6058 Nil!21972 (select (arr!31617 lt!459488) #b00000000000000000000000000000000)))))

(declare-fun bm!44178 () Bool)

(assert (=> bm!44178 (= call!44181 (arrayNoDuplicates!0 lt!459488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105839 (Cons!21971 (select (arr!31617 lt!459488) #b00000000000000000000000000000000) Nil!21972) Nil!21972)))))

(assert (= (and d!126121 (not res!694646)) b!1042532))

(assert (= (and b!1042532 res!694647) b!1042534))

(assert (= (and b!1042532 res!694648) b!1042530))

(assert (= (and b!1042530 c!105839) b!1042533))

(assert (= (and b!1042530 (not c!105839)) b!1042531))

(assert (= (or b!1042533 b!1042531) bm!44178))

(declare-fun m!961863 () Bool)

(assert (=> b!1042530 m!961863))

(assert (=> b!1042530 m!961863))

(declare-fun m!961865 () Bool)

(assert (=> b!1042530 m!961865))

(assert (=> b!1042532 m!961863))

(assert (=> b!1042532 m!961863))

(assert (=> b!1042532 m!961865))

(assert (=> b!1042534 m!961863))

(assert (=> b!1042534 m!961863))

(declare-fun m!961867 () Bool)

(assert (=> b!1042534 m!961867))

(assert (=> bm!44178 m!961863))

(declare-fun m!961869 () Bool)

(assert (=> bm!44178 m!961869))

(assert (=> b!1042463 d!126121))

(declare-fun b!1042543 () Bool)

(declare-fun e!590584 () (_ BitVec 32))

(assert (=> b!1042543 (= e!590584 #b00000000000000000000000000000000)))

(declare-fun b!1042544 () Bool)

(declare-fun e!590583 () (_ BitVec 32))

(declare-fun call!44184 () (_ BitVec 32))

(assert (=> b!1042544 (= e!590583 (bvadd #b00000000000000000000000000000001 call!44184))))

(declare-fun b!1042545 () Bool)

(assert (=> b!1042545 (= e!590584 e!590583)))

(declare-fun c!105844 () Bool)

(assert (=> b!1042545 (= c!105844 (validKeyInArray!0 (select (arr!31617 lt!459488) #b00000000000000000000000000000000)))))

(declare-fun b!1042546 () Bool)

(assert (=> b!1042546 (= e!590583 call!44184)))

(declare-fun d!126123 () Bool)

(declare-fun lt!459519 () (_ BitVec 32))

(assert (=> d!126123 (and (bvsge lt!459519 #b00000000000000000000000000000000) (bvsle lt!459519 (bvsub (size!32152 lt!459488) #b00000000000000000000000000000000)))))

(assert (=> d!126123 (= lt!459519 e!590584)))

(declare-fun c!105845 () Bool)

(assert (=> d!126123 (= c!105845 (bvsge #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))))))

(assert (=> d!126123 (and (bvsle #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32152 (_keys!11617 thiss!1427)) (size!32152 lt!459488)))))

(assert (=> d!126123 (= (arrayCountValidKeys!0 lt!459488 #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) lt!459519)))

(declare-fun bm!44181 () Bool)

(assert (=> bm!44181 (= call!44184 (arrayCountValidKeys!0 lt!459488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32152 (_keys!11617 thiss!1427))))))

(assert (= (and d!126123 c!105845) b!1042543))

(assert (= (and d!126123 (not c!105845)) b!1042545))

(assert (= (and b!1042545 c!105844) b!1042544))

(assert (= (and b!1042545 (not c!105844)) b!1042546))

(assert (= (or b!1042544 b!1042546) bm!44181))

(assert (=> b!1042545 m!961863))

(assert (=> b!1042545 m!961863))

(assert (=> b!1042545 m!961865))

(declare-fun m!961871 () Bool)

(assert (=> bm!44181 m!961871))

(assert (=> b!1042463 d!126123))

(declare-fun d!126125 () Bool)

(assert (=> d!126125 (= (validMask!0 (mask!30430 thiss!1427)) (and (or (= (mask!30430 thiss!1427) #b00000000000000000000000000000111) (= (mask!30430 thiss!1427) #b00000000000000000000000000001111) (= (mask!30430 thiss!1427) #b00000000000000000000000000011111) (= (mask!30430 thiss!1427) #b00000000000000000000000000111111) (= (mask!30430 thiss!1427) #b00000000000000000000000001111111) (= (mask!30430 thiss!1427) #b00000000000000000000000011111111) (= (mask!30430 thiss!1427) #b00000000000000000000000111111111) (= (mask!30430 thiss!1427) #b00000000000000000000001111111111) (= (mask!30430 thiss!1427) #b00000000000000000000011111111111) (= (mask!30430 thiss!1427) #b00000000000000000000111111111111) (= (mask!30430 thiss!1427) #b00000000000000000001111111111111) (= (mask!30430 thiss!1427) #b00000000000000000011111111111111) (= (mask!30430 thiss!1427) #b00000000000000000111111111111111) (= (mask!30430 thiss!1427) #b00000000000000001111111111111111) (= (mask!30430 thiss!1427) #b00000000000000011111111111111111) (= (mask!30430 thiss!1427) #b00000000000000111111111111111111) (= (mask!30430 thiss!1427) #b00000000000001111111111111111111) (= (mask!30430 thiss!1427) #b00000000000011111111111111111111) (= (mask!30430 thiss!1427) #b00000000000111111111111111111111) (= (mask!30430 thiss!1427) #b00000000001111111111111111111111) (= (mask!30430 thiss!1427) #b00000000011111111111111111111111) (= (mask!30430 thiss!1427) #b00000000111111111111111111111111) (= (mask!30430 thiss!1427) #b00000001111111111111111111111111) (= (mask!30430 thiss!1427) #b00000011111111111111111111111111) (= (mask!30430 thiss!1427) #b00000111111111111111111111111111) (= (mask!30430 thiss!1427) #b00001111111111111111111111111111) (= (mask!30430 thiss!1427) #b00011111111111111111111111111111) (= (mask!30430 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30430 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042463 d!126125))

(declare-fun b!1042547 () Bool)

(declare-fun e!590586 () (_ BitVec 32))

(assert (=> b!1042547 (= e!590586 #b00000000000000000000000000000000)))

(declare-fun b!1042548 () Bool)

(declare-fun e!590585 () (_ BitVec 32))

(declare-fun call!44185 () (_ BitVec 32))

(assert (=> b!1042548 (= e!590585 (bvadd #b00000000000000000000000000000001 call!44185))))

(declare-fun b!1042549 () Bool)

(assert (=> b!1042549 (= e!590586 e!590585)))

(declare-fun c!105846 () Bool)

(assert (=> b!1042549 (= c!105846 (validKeyInArray!0 (select (arr!31617 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042550 () Bool)

(assert (=> b!1042550 (= e!590585 call!44185)))

(declare-fun d!126127 () Bool)

(declare-fun lt!459520 () (_ BitVec 32))

(assert (=> d!126127 (and (bvsge lt!459520 #b00000000000000000000000000000000) (bvsle lt!459520 (bvsub (size!32152 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126127 (= lt!459520 e!590586)))

(declare-fun c!105847 () Bool)

(assert (=> d!126127 (= c!105847 (bvsge #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))))))

(assert (=> d!126127 (and (bvsle #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32152 (_keys!11617 thiss!1427)) (size!32152 (_keys!11617 thiss!1427))))))

(assert (=> d!126127 (= (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) lt!459520)))

(declare-fun bm!44182 () Bool)

(assert (=> bm!44182 (= call!44185 (arrayCountValidKeys!0 (_keys!11617 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32152 (_keys!11617 thiss!1427))))))

(assert (= (and d!126127 c!105847) b!1042547))

(assert (= (and d!126127 (not c!105847)) b!1042549))

(assert (= (and b!1042549 c!105846) b!1042548))

(assert (= (and b!1042549 (not c!105846)) b!1042550))

(assert (= (or b!1042548 b!1042550) bm!44182))

(assert (=> b!1042549 m!961847))

(assert (=> b!1042549 m!961847))

(assert (=> b!1042549 m!961849))

(declare-fun m!961873 () Bool)

(assert (=> bm!44182 m!961873))

(assert (=> b!1042463 d!126127))

(declare-fun d!126129 () Bool)

(declare-fun e!590589 () Bool)

(assert (=> d!126129 e!590589))

(declare-fun res!694651 () Bool)

(assert (=> d!126129 (=> (not res!694651) (not e!590589))))

(assert (=> d!126129 (= res!694651 (and (bvsge (index!41640 lt!459489) #b00000000000000000000000000000000) (bvslt (index!41640 lt!459489) (size!32152 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459523 () Unit!34047)

(declare-fun choose!25 (array!65720 (_ BitVec 32) (_ BitVec 32)) Unit!34047)

(assert (=> d!126129 (= lt!459523 (choose!25 (_keys!11617 thiss!1427) (index!41640 lt!459489) (mask!30430 thiss!1427)))))

(assert (=> d!126129 (validMask!0 (mask!30430 thiss!1427))))

(assert (=> d!126129 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) (mask!30430 thiss!1427)) lt!459523)))

(declare-fun b!1042553 () Bool)

(assert (=> b!1042553 (= e!590589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65721 (store (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32152 (_keys!11617 thiss!1427))) (mask!30430 thiss!1427)))))

(assert (= (and d!126129 res!694651) b!1042553))

(declare-fun m!961875 () Bool)

(assert (=> d!126129 m!961875))

(assert (=> d!126129 m!961789))

(assert (=> b!1042553 m!961795))

(declare-fun m!961877 () Bool)

(assert (=> b!1042553 m!961877))

(assert (=> b!1042463 d!126129))

(declare-fun d!126131 () Bool)

(declare-fun e!590592 () Bool)

(assert (=> d!126131 e!590592))

(declare-fun res!694654 () Bool)

(assert (=> d!126131 (=> (not res!694654) (not e!590592))))

(assert (=> d!126131 (= res!694654 (and (bvsge (index!41640 lt!459489) #b00000000000000000000000000000000) (bvslt (index!41640 lt!459489) (size!32152 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459526 () Unit!34047)

(declare-fun choose!53 (array!65720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21975) Unit!34047)

(assert (=> d!126131 (= lt!459526 (choose!53 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41640 lt!459489) #b00000000000000000000000000000000 Nil!21972))))

(assert (=> d!126131 (bvslt (size!32152 (_keys!11617 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126131 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11617 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41640 lt!459489) #b00000000000000000000000000000000 Nil!21972) lt!459526)))

(declare-fun b!1042556 () Bool)

(assert (=> b!1042556 (= e!590592 (arrayNoDuplicates!0 (array!65721 (store (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32152 (_keys!11617 thiss!1427))) #b00000000000000000000000000000000 Nil!21972))))

(assert (= (and d!126131 res!694654) b!1042556))

(declare-fun m!961879 () Bool)

(assert (=> d!126131 m!961879))

(assert (=> b!1042556 m!961795))

(declare-fun m!961881 () Bool)

(assert (=> b!1042556 m!961881))

(assert (=> b!1042463 d!126131))

(declare-fun b!1042557 () Bool)

(declare-fun e!590594 () Bool)

(declare-fun call!44186 () Bool)

(assert (=> b!1042557 (= e!590594 call!44186)))

(declare-fun bm!44183 () Bool)

(assert (=> bm!44183 (= call!44186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459488 (mask!30430 thiss!1427)))))

(declare-fun b!1042558 () Bool)

(declare-fun e!590595 () Bool)

(assert (=> b!1042558 (= e!590595 call!44186)))

(declare-fun d!126133 () Bool)

(declare-fun res!694655 () Bool)

(declare-fun e!590593 () Bool)

(assert (=> d!126133 (=> res!694655 e!590593)))

(assert (=> d!126133 (= res!694655 (bvsge #b00000000000000000000000000000000 (size!32152 lt!459488)))))

(assert (=> d!126133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459488 (mask!30430 thiss!1427)) e!590593)))

(declare-fun b!1042559 () Bool)

(assert (=> b!1042559 (= e!590593 e!590594)))

(declare-fun c!105848 () Bool)

(assert (=> b!1042559 (= c!105848 (validKeyInArray!0 (select (arr!31617 lt!459488) #b00000000000000000000000000000000)))))

(declare-fun b!1042560 () Bool)

(assert (=> b!1042560 (= e!590594 e!590595)))

(declare-fun lt!459528 () (_ BitVec 64))

(assert (=> b!1042560 (= lt!459528 (select (arr!31617 lt!459488) #b00000000000000000000000000000000))))

(declare-fun lt!459529 () Unit!34047)

(assert (=> b!1042560 (= lt!459529 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459488 lt!459528 #b00000000000000000000000000000000))))

(assert (=> b!1042560 (arrayContainsKey!0 lt!459488 lt!459528 #b00000000000000000000000000000000)))

(declare-fun lt!459527 () Unit!34047)

(assert (=> b!1042560 (= lt!459527 lt!459529)))

(declare-fun res!694656 () Bool)

(assert (=> b!1042560 (= res!694656 (= (seekEntryOrOpen!0 (select (arr!31617 lt!459488) #b00000000000000000000000000000000) lt!459488 (mask!30430 thiss!1427)) (Found!9817 #b00000000000000000000000000000000)))))

(assert (=> b!1042560 (=> (not res!694656) (not e!590595))))

(assert (= (and d!126133 (not res!694655)) b!1042559))

(assert (= (and b!1042559 c!105848) b!1042560))

(assert (= (and b!1042559 (not c!105848)) b!1042557))

(assert (= (and b!1042560 res!694656) b!1042558))

(assert (= (or b!1042558 b!1042557) bm!44183))

(declare-fun m!961883 () Bool)

(assert (=> bm!44183 m!961883))

(assert (=> b!1042559 m!961863))

(assert (=> b!1042559 m!961863))

(assert (=> b!1042559 m!961865))

(assert (=> b!1042560 m!961863))

(declare-fun m!961885 () Bool)

(assert (=> b!1042560 m!961885))

(declare-fun m!961887 () Bool)

(assert (=> b!1042560 m!961887))

(assert (=> b!1042560 m!961863))

(declare-fun m!961889 () Bool)

(assert (=> b!1042560 m!961889))

(assert (=> b!1042463 d!126133))

(declare-fun d!126135 () Bool)

(declare-fun e!590598 () Bool)

(assert (=> d!126135 e!590598))

(declare-fun res!694659 () Bool)

(assert (=> d!126135 (=> (not res!694659) (not e!590598))))

(assert (=> d!126135 (= res!694659 (bvslt (index!41640 lt!459489) (size!32152 (_keys!11617 thiss!1427))))))

(declare-fun lt!459532 () Unit!34047)

(declare-fun choose!121 (array!65720 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> d!126135 (= lt!459532 (choose!121 (_keys!11617 thiss!1427) (index!41640 lt!459489) key!909))))

(assert (=> d!126135 (bvsge (index!41640 lt!459489) #b00000000000000000000000000000000)))

(assert (=> d!126135 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) key!909) lt!459532)))

(declare-fun b!1042563 () Bool)

(assert (=> b!1042563 (= e!590598 (not (arrayContainsKey!0 (array!65721 (store (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32152 (_keys!11617 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126135 res!694659) b!1042563))

(declare-fun m!961891 () Bool)

(assert (=> d!126135 m!961891))

(assert (=> b!1042563 m!961795))

(declare-fun m!961893 () Bool)

(assert (=> b!1042563 m!961893))

(assert (=> b!1042463 d!126135))

(declare-fun d!126137 () Bool)

(declare-fun res!694664 () Bool)

(declare-fun e!590603 () Bool)

(assert (=> d!126137 (=> res!694664 e!590603)))

(assert (=> d!126137 (= res!694664 (= (select (arr!31617 lt!459488) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126137 (= (arrayContainsKey!0 lt!459488 key!909 #b00000000000000000000000000000000) e!590603)))

(declare-fun b!1042568 () Bool)

(declare-fun e!590604 () Bool)

(assert (=> b!1042568 (= e!590603 e!590604)))

(declare-fun res!694665 () Bool)

(assert (=> b!1042568 (=> (not res!694665) (not e!590604))))

(assert (=> b!1042568 (= res!694665 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32152 lt!459488)))))

(declare-fun b!1042569 () Bool)

(assert (=> b!1042569 (= e!590604 (arrayContainsKey!0 lt!459488 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126137 (not res!694664)) b!1042568))

(assert (= (and b!1042568 res!694665) b!1042569))

(assert (=> d!126137 m!961863))

(declare-fun m!961895 () Bool)

(assert (=> b!1042569 m!961895))

(assert (=> b!1042463 d!126137))

(declare-fun b!1042580 () Bool)

(declare-fun e!590610 () Bool)

(assert (=> b!1042580 (= e!590610 (bvslt (size!32152 (_keys!11617 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042581 () Bool)

(declare-fun e!590609 () Bool)

(assert (=> b!1042581 (= e!590609 (= (arrayCountValidKeys!0 (array!65721 (store (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32152 (_keys!11617 thiss!1427))) #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126139 () Bool)

(assert (=> d!126139 e!590609))

(declare-fun res!694674 () Bool)

(assert (=> d!126139 (=> (not res!694674) (not e!590609))))

(assert (=> d!126139 (= res!694674 (and (bvsge (index!41640 lt!459489) #b00000000000000000000000000000000) (bvslt (index!41640 lt!459489) (size!32152 (_keys!11617 thiss!1427)))))))

(declare-fun lt!459535 () Unit!34047)

(declare-fun choose!82 (array!65720 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> d!126139 (= lt!459535 (choose!82 (_keys!11617 thiss!1427) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126139 e!590610))

(declare-fun res!694676 () Bool)

(assert (=> d!126139 (=> (not res!694676) (not e!590610))))

(assert (=> d!126139 (= res!694676 (and (bvsge (index!41640 lt!459489) #b00000000000000000000000000000000) (bvslt (index!41640 lt!459489) (size!32152 (_keys!11617 thiss!1427)))))))

(assert (=> d!126139 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11617 thiss!1427) (index!41640 lt!459489) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459535)))

(declare-fun b!1042578 () Bool)

(declare-fun res!694675 () Bool)

(assert (=> b!1042578 (=> (not res!694675) (not e!590610))))

(assert (=> b!1042578 (= res!694675 (validKeyInArray!0 (select (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459489))))))

(declare-fun b!1042579 () Bool)

(declare-fun res!694677 () Bool)

(assert (=> b!1042579 (=> (not res!694677) (not e!590610))))

(assert (=> b!1042579 (= res!694677 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126139 res!694676) b!1042578))

(assert (= (and b!1042578 res!694675) b!1042579))

(assert (= (and b!1042579 res!694677) b!1042580))

(assert (= (and d!126139 res!694674) b!1042581))

(assert (=> b!1042581 m!961795))

(declare-fun m!961897 () Bool)

(assert (=> b!1042581 m!961897))

(assert (=> b!1042581 m!961805))

(declare-fun m!961899 () Bool)

(assert (=> d!126139 m!961899))

(declare-fun m!961901 () Bool)

(assert (=> b!1042578 m!961901))

(assert (=> b!1042578 m!961901))

(declare-fun m!961903 () Bool)

(assert (=> b!1042578 m!961903))

(declare-fun m!961905 () Bool)

(assert (=> b!1042579 m!961905))

(assert (=> b!1042463 d!126139))

(declare-fun d!126141 () Bool)

(assert (=> d!126141 (= (array_inv!24429 (_keys!11617 thiss!1427)) (bvsge (size!32152 (_keys!11617 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042464 d!126141))

(declare-fun d!126143 () Bool)

(assert (=> d!126143 (= (array_inv!24430 (_values!6390 thiss!1427)) (bvsge (size!32153 (_values!6390 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042464 d!126143))

(declare-fun d!126145 () Bool)

(declare-fun res!694684 () Bool)

(declare-fun e!590613 () Bool)

(assert (=> d!126145 (=> (not res!694684) (not e!590613))))

(declare-fun simpleValid!442 (LongMapFixedSize!5970) Bool)

(assert (=> d!126145 (= res!694684 (simpleValid!442 thiss!1427))))

(assert (=> d!126145 (= (valid!2243 thiss!1427) e!590613)))

(declare-fun b!1042588 () Bool)

(declare-fun res!694685 () Bool)

(assert (=> b!1042588 (=> (not res!694685) (not e!590613))))

(assert (=> b!1042588 (= res!694685 (= (arrayCountValidKeys!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 (size!32152 (_keys!11617 thiss!1427))) (_size!3040 thiss!1427)))))

(declare-fun b!1042589 () Bool)

(declare-fun res!694686 () Bool)

(assert (=> b!1042589 (=> (not res!694686) (not e!590613))))

(assert (=> b!1042589 (= res!694686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)))))

(declare-fun b!1042590 () Bool)

(assert (=> b!1042590 (= e!590613 (arrayNoDuplicates!0 (_keys!11617 thiss!1427) #b00000000000000000000000000000000 Nil!21972))))

(assert (= (and d!126145 res!694684) b!1042588))

(assert (= (and b!1042588 res!694685) b!1042589))

(assert (= (and b!1042589 res!694686) b!1042590))

(declare-fun m!961907 () Bool)

(assert (=> d!126145 m!961907))

(assert (=> b!1042588 m!961805))

(assert (=> b!1042589 m!961809))

(assert (=> b!1042590 m!961783))

(assert (=> start!91518 d!126145))

(declare-fun b!1042604 () Bool)

(declare-fun e!590622 () SeekEntryResult!9817)

(assert (=> b!1042604 (= e!590622 Undefined!9817)))

(declare-fun b!1042605 () Bool)

(declare-fun e!590621 () SeekEntryResult!9817)

(assert (=> b!1042605 (= e!590622 e!590621)))

(declare-fun lt!459546 () (_ BitVec 64))

(declare-fun lt!459544 () SeekEntryResult!9817)

(assert (=> b!1042605 (= lt!459546 (select (arr!31617 (_keys!11617 thiss!1427)) (index!41641 lt!459544)))))

(declare-fun c!105856 () Bool)

(assert (=> b!1042605 (= c!105856 (= lt!459546 key!909))))

(declare-fun b!1042606 () Bool)

(declare-fun e!590620 () SeekEntryResult!9817)

(assert (=> b!1042606 (= e!590620 (MissingZero!9817 (index!41641 lt!459544)))))

(declare-fun b!1042603 () Bool)

(declare-fun lt!459547 () SeekEntryResult!9817)

(assert (=> b!1042603 (= e!590620 (ite ((_ is MissingVacant!9817) lt!459547) (MissingZero!9817 (index!41642 lt!459547)) lt!459547))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65720 (_ BitVec 32)) SeekEntryResult!9817)

(assert (=> b!1042603 (= lt!459547 (seekKeyOrZeroReturnVacant!0 (x!93069 lt!459544) (index!41641 lt!459544) (index!41641 lt!459544) key!909 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)))))

(declare-fun d!126147 () Bool)

(declare-fun lt!459545 () SeekEntryResult!9817)

(assert (=> d!126147 (and (or ((_ is MissingVacant!9817) lt!459545) (not ((_ is Found!9817) lt!459545)) (and (bvsge (index!41640 lt!459545) #b00000000000000000000000000000000) (bvslt (index!41640 lt!459545) (size!32152 (_keys!11617 thiss!1427))))) (not ((_ is MissingVacant!9817) lt!459545)) (or (not ((_ is Found!9817) lt!459545)) (= (select (arr!31617 (_keys!11617 thiss!1427)) (index!41640 lt!459545)) key!909)))))

(assert (=> d!126147 (= lt!459545 e!590622)))

(declare-fun c!105857 () Bool)

(assert (=> d!126147 (= c!105857 (and ((_ is Intermediate!9817) lt!459544) (undefined!10629 lt!459544)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65720 (_ BitVec 32)) SeekEntryResult!9817)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126147 (= lt!459544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30430 thiss!1427)) key!909 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)))))

(assert (=> d!126147 (validMask!0 (mask!30430 thiss!1427))))

(assert (=> d!126147 (= (seekEntry!0 key!909 (_keys!11617 thiss!1427) (mask!30430 thiss!1427)) lt!459545)))

(declare-fun b!1042607 () Bool)

(declare-fun c!105855 () Bool)

(assert (=> b!1042607 (= c!105855 (= lt!459546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042607 (= e!590621 e!590620)))

(declare-fun b!1042608 () Bool)

(assert (=> b!1042608 (= e!590621 (Found!9817 (index!41641 lt!459544)))))

(assert (= (and d!126147 c!105857) b!1042604))

(assert (= (and d!126147 (not c!105857)) b!1042605))

(assert (= (and b!1042605 c!105856) b!1042608))

(assert (= (and b!1042605 (not c!105856)) b!1042607))

(assert (= (and b!1042607 c!105855) b!1042606))

(assert (= (and b!1042607 (not c!105855)) b!1042603))

(declare-fun m!961909 () Bool)

(assert (=> b!1042605 m!961909))

(declare-fun m!961911 () Bool)

(assert (=> b!1042603 m!961911))

(declare-fun m!961913 () Bool)

(assert (=> d!126147 m!961913))

(declare-fun m!961915 () Bool)

(assert (=> d!126147 m!961915))

(assert (=> d!126147 m!961915))

(declare-fun m!961917 () Bool)

(assert (=> d!126147 m!961917))

(assert (=> d!126147 m!961789))

(assert (=> b!1042465 d!126147))

(declare-fun b!1042616 () Bool)

(declare-fun e!590628 () Bool)

(assert (=> b!1042616 (= e!590628 tp_is_empty!24783)))

(declare-fun mapIsEmpty!38789 () Bool)

(declare-fun mapRes!38789 () Bool)

(assert (=> mapIsEmpty!38789 mapRes!38789))

(declare-fun mapNonEmpty!38789 () Bool)

(declare-fun tp!74424 () Bool)

(declare-fun e!590627 () Bool)

(assert (=> mapNonEmpty!38789 (= mapRes!38789 (and tp!74424 e!590627))))

(declare-fun mapValue!38789 () ValueCell!11688)

(declare-fun mapKey!38789 () (_ BitVec 32))

(declare-fun mapRest!38789 () (Array (_ BitVec 32) ValueCell!11688))

(assert (=> mapNonEmpty!38789 (= mapRest!38783 (store mapRest!38789 mapKey!38789 mapValue!38789))))

(declare-fun condMapEmpty!38789 () Bool)

(declare-fun mapDefault!38789 () ValueCell!11688)

(assert (=> mapNonEmpty!38783 (= condMapEmpty!38789 (= mapRest!38783 ((as const (Array (_ BitVec 32) ValueCell!11688)) mapDefault!38789)))))

(assert (=> mapNonEmpty!38783 (= tp!74414 (and e!590628 mapRes!38789))))

(declare-fun b!1042615 () Bool)

(assert (=> b!1042615 (= e!590627 tp_is_empty!24783)))

(assert (= (and mapNonEmpty!38783 condMapEmpty!38789) mapIsEmpty!38789))

(assert (= (and mapNonEmpty!38783 (not condMapEmpty!38789)) mapNonEmpty!38789))

(assert (= (and mapNonEmpty!38789 ((_ is ValueCellFull!11688) mapValue!38789)) b!1042615))

(assert (= (and mapNonEmpty!38783 ((_ is ValueCellFull!11688) mapDefault!38789)) b!1042616))

(declare-fun m!961919 () Bool)

(assert (=> mapNonEmpty!38789 m!961919))

(check-sat (not bm!44174) (not b!1042578) (not d!126131) (not b!1042588) (not b!1042513) b_and!33595 (not bm!44182) (not b!1042529) (not bm!44181) (not b!1042603) (not bm!44178) (not d!126147) (not b!1042534) (not b!1042517) (not bm!44177) (not b!1042532) (not d!126145) (not b!1042579) tp_is_empty!24783 (not b!1042556) (not d!126139) (not b!1042560) (not b!1042559) (not d!126135) (not mapNonEmpty!38789) (not d!126129) (not b!1042549) (not b!1042530) (not b!1042545) (not b!1042581) (not b!1042589) (not b!1042515) (not b!1042569) (not bm!44183) (not b!1042528) (not b!1042590) (not b!1042553) (not b_next!21063) (not b!1042563))
(check-sat b_and!33595 (not b_next!21063))
