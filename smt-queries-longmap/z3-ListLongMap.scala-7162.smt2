; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91226 () Bool)

(assert start!91226)

(declare-fun b!1040696 () Bool)

(declare-fun b_free!21025 () Bool)

(declare-fun b_next!21025 () Bool)

(assert (=> b!1040696 (= b_free!21025 (not b_next!21025))))

(declare-fun tp!74279 () Bool)

(declare-fun b_and!33531 () Bool)

(assert (=> b!1040696 (= tp!74279 b_and!33531)))

(declare-fun b!1040691 () Bool)

(declare-fun e!589260 () Bool)

(declare-fun tp_is_empty!24745 () Bool)

(assert (=> b!1040691 (= e!589260 tp_is_empty!24745)))

(declare-fun b!1040692 () Bool)

(declare-fun res!693792 () Bool)

(declare-fun e!589257 () Bool)

(assert (=> b!1040692 (=> (not res!693792) (not e!589257))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040692 (= res!693792 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040693 () Bool)

(declare-fun e!589261 () Bool)

(declare-datatypes ((V!37867 0))(
  ( (V!37868 (val!12423 Int)) )
))
(declare-datatypes ((ValueCell!11669 0))(
  ( (ValueCellFull!11669 (v!15009 V!37867)) (EmptyCell!11669) )
))
(declare-datatypes ((array!65571 0))(
  ( (array!65572 (arr!31548 (Array (_ BitVec 32) (_ BitVec 64))) (size!32081 (_ BitVec 32))) )
))
(declare-datatypes ((array!65573 0))(
  ( (array!65574 (arr!31549 (Array (_ BitVec 32) ValueCell!11669)) (size!32082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5932 0))(
  ( (LongMapFixedSize!5933 (defaultEntry!6348 Int) (mask!30350 (_ BitVec 32)) (extraKeys!6076 (_ BitVec 32)) (zeroValue!6182 V!37867) (minValue!6182 V!37867) (_size!3021 (_ BitVec 32)) (_keys!11570 array!65571) (_values!6371 array!65573) (_vacant!3021 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5932)

(assert (=> b!1040693 (= e!589261 (= (size!32082 (_values!6371 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30350 thiss!1427))))))

(declare-fun mapIsEmpty!38704 () Bool)

(declare-fun mapRes!38704 () Bool)

(assert (=> mapIsEmpty!38704 mapRes!38704))

(declare-fun b!1040695 () Bool)

(declare-fun e!589262 () Bool)

(assert (=> b!1040695 (= e!589262 tp_is_empty!24745)))

(declare-fun e!589259 () Bool)

(declare-fun e!589263 () Bool)

(declare-fun array_inv!24387 (array!65571) Bool)

(declare-fun array_inv!24388 (array!65573) Bool)

(assert (=> b!1040696 (= e!589263 (and tp!74279 tp_is_empty!24745 (array_inv!24387 (_keys!11570 thiss!1427)) (array_inv!24388 (_values!6371 thiss!1427)) e!589259))))

(declare-fun b!1040697 () Bool)

(declare-fun e!589258 () Bool)

(assert (=> b!1040697 (= e!589257 e!589258)))

(declare-fun res!693791 () Bool)

(assert (=> b!1040697 (=> (not res!693791) (not e!589258))))

(declare-datatypes ((SeekEntryResult!9798 0))(
  ( (MissingZero!9798 (index!41563 (_ BitVec 32))) (Found!9798 (index!41564 (_ BitVec 32))) (Intermediate!9798 (undefined!10610 Bool) (index!41565 (_ BitVec 32)) (x!92915 (_ BitVec 32))) (Undefined!9798) (MissingVacant!9798 (index!41566 (_ BitVec 32))) )
))
(declare-fun lt!458542 () SeekEntryResult!9798)

(get-info :version)

(assert (=> b!1040697 (= res!693791 ((_ is Found!9798) lt!458542))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65571 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1040697 (= lt!458542 (seekEntry!0 key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun mapNonEmpty!38704 () Bool)

(declare-fun tp!74278 () Bool)

(assert (=> mapNonEmpty!38704 (= mapRes!38704 (and tp!74278 e!589262))))

(declare-fun mapRest!38704 () (Array (_ BitVec 32) ValueCell!11669))

(declare-fun mapKey!38704 () (_ BitVec 32))

(declare-fun mapValue!38704 () ValueCell!11669)

(assert (=> mapNonEmpty!38704 (= (arr!31549 (_values!6371 thiss!1427)) (store mapRest!38704 mapKey!38704 mapValue!38704))))

(declare-fun b!1040698 () Bool)

(assert (=> b!1040698 (= e!589258 (not e!589261))))

(declare-fun res!693790 () Bool)

(assert (=> b!1040698 (=> res!693790 e!589261)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040698 (= res!693790 (not (validMask!0 (mask!30350 thiss!1427))))))

(declare-fun lt!458540 () array!65571)

(declare-fun arrayContainsKey!0 (array!65571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040698 (not (arrayContainsKey!0 lt!458540 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33907 0))(
  ( (Unit!33908) )
))
(declare-fun lt!458537 () Unit!33907)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65571 (_ BitVec 32) (_ BitVec 64)) Unit!33907)

(assert (=> b!1040698 (= lt!458537 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65571 (_ BitVec 32)) Bool)

(assert (=> b!1040698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458540 (mask!30350 thiss!1427))))

(declare-fun lt!458541 () Unit!33907)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65571 (_ BitVec 32) (_ BitVec 32)) Unit!33907)

(assert (=> b!1040698 (= lt!458541 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) (mask!30350 thiss!1427)))))

(declare-datatypes ((List!21999 0))(
  ( (Nil!21996) (Cons!21995 (h!23199 (_ BitVec 64)) (t!31204 List!21999)) )
))
(declare-fun arrayNoDuplicates!0 (array!65571 (_ BitVec 32) List!21999) Bool)

(assert (=> b!1040698 (arrayNoDuplicates!0 lt!458540 #b00000000000000000000000000000000 Nil!21996)))

(declare-fun lt!458538 () Unit!33907)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21999) Unit!33907)

(assert (=> b!1040698 (= lt!458538 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!458542) #b00000000000000000000000000000000 Nil!21996))))

(declare-fun arrayCountValidKeys!0 (array!65571 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040698 (= (arrayCountValidKeys!0 lt!458540 #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040698 (= lt!458540 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun lt!458539 () Unit!33907)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65571 (_ BitVec 32) (_ BitVec 64)) Unit!33907)

(assert (=> b!1040698 (= lt!458539 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!693789 () Bool)

(assert (=> start!91226 (=> (not res!693789) (not e!589257))))

(declare-fun valid!2217 (LongMapFixedSize!5932) Bool)

(assert (=> start!91226 (= res!693789 (valid!2217 thiss!1427))))

(assert (=> start!91226 e!589257))

(assert (=> start!91226 e!589263))

(assert (=> start!91226 true))

(declare-fun b!1040694 () Bool)

(assert (=> b!1040694 (= e!589259 (and e!589260 mapRes!38704))))

(declare-fun condMapEmpty!38704 () Bool)

(declare-fun mapDefault!38704 () ValueCell!11669)

(assert (=> b!1040694 (= condMapEmpty!38704 (= (arr!31549 (_values!6371 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38704)))))

(assert (= (and start!91226 res!693789) b!1040692))

(assert (= (and b!1040692 res!693792) b!1040697))

(assert (= (and b!1040697 res!693791) b!1040698))

(assert (= (and b!1040698 (not res!693790)) b!1040693))

(assert (= (and b!1040694 condMapEmpty!38704) mapIsEmpty!38704))

(assert (= (and b!1040694 (not condMapEmpty!38704)) mapNonEmpty!38704))

(assert (= (and mapNonEmpty!38704 ((_ is ValueCellFull!11669) mapValue!38704)) b!1040695))

(assert (= (and b!1040694 ((_ is ValueCellFull!11669) mapDefault!38704)) b!1040691))

(assert (= b!1040696 b!1040694))

(assert (= start!91226 b!1040696))

(declare-fun m!959727 () Bool)

(assert (=> mapNonEmpty!38704 m!959727))

(declare-fun m!959729 () Bool)

(assert (=> b!1040698 m!959729))

(declare-fun m!959731 () Bool)

(assert (=> b!1040698 m!959731))

(declare-fun m!959733 () Bool)

(assert (=> b!1040698 m!959733))

(declare-fun m!959735 () Bool)

(assert (=> b!1040698 m!959735))

(declare-fun m!959737 () Bool)

(assert (=> b!1040698 m!959737))

(declare-fun m!959739 () Bool)

(assert (=> b!1040698 m!959739))

(declare-fun m!959741 () Bool)

(assert (=> b!1040698 m!959741))

(declare-fun m!959743 () Bool)

(assert (=> b!1040698 m!959743))

(declare-fun m!959745 () Bool)

(assert (=> b!1040698 m!959745))

(declare-fun m!959747 () Bool)

(assert (=> b!1040698 m!959747))

(declare-fun m!959749 () Bool)

(assert (=> b!1040698 m!959749))

(declare-fun m!959751 () Bool)

(assert (=> start!91226 m!959751))

(declare-fun m!959753 () Bool)

(assert (=> b!1040696 m!959753))

(declare-fun m!959755 () Bool)

(assert (=> b!1040696 m!959755))

(declare-fun m!959757 () Bool)

(assert (=> b!1040697 m!959757))

(check-sat b_and!33531 (not mapNonEmpty!38704) (not b_next!21025) tp_is_empty!24745 (not b!1040696) (not b!1040697) (not b!1040698) (not start!91226))
(check-sat b_and!33531 (not b_next!21025))
(get-model)

(declare-fun b!1040759 () Bool)

(declare-fun e!589318 () SeekEntryResult!9798)

(declare-fun lt!458588 () SeekEntryResult!9798)

(assert (=> b!1040759 (= e!589318 (ite ((_ is MissingVacant!9798) lt!458588) (MissingZero!9798 (index!41566 lt!458588)) lt!458588))))

(declare-fun lt!458589 () SeekEntryResult!9798)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65571 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1040759 (= lt!458588 (seekKeyOrZeroReturnVacant!0 (x!92915 lt!458589) (index!41565 lt!458589) (index!41565 lt!458589) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040760 () Bool)

(declare-fun e!589319 () SeekEntryResult!9798)

(declare-fun e!589320 () SeekEntryResult!9798)

(assert (=> b!1040760 (= e!589319 e!589320)))

(declare-fun lt!458590 () (_ BitVec 64))

(assert (=> b!1040760 (= lt!458590 (select (arr!31548 (_keys!11570 thiss!1427)) (index!41565 lt!458589)))))

(declare-fun c!105505 () Bool)

(assert (=> b!1040760 (= c!105505 (= lt!458590 key!909))))

(declare-fun b!1040761 () Bool)

(declare-fun c!105507 () Bool)

(assert (=> b!1040761 (= c!105507 (= lt!458590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040761 (= e!589320 e!589318)))

(declare-fun d!125569 () Bool)

(declare-fun lt!458587 () SeekEntryResult!9798)

(assert (=> d!125569 (and (or ((_ is MissingVacant!9798) lt!458587) (not ((_ is Found!9798) lt!458587)) (and (bvsge (index!41564 lt!458587) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458587) (size!32081 (_keys!11570 thiss!1427))))) (not ((_ is MissingVacant!9798) lt!458587)) (or (not ((_ is Found!9798) lt!458587)) (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458587)) key!909)))))

(assert (=> d!125569 (= lt!458587 e!589319)))

(declare-fun c!105506 () Bool)

(assert (=> d!125569 (= c!105506 (and ((_ is Intermediate!9798) lt!458589) (undefined!10610 lt!458589)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65571 (_ BitVec 32)) SeekEntryResult!9798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125569 (= lt!458589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30350 thiss!1427)) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(assert (=> d!125569 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125569 (= (seekEntry!0 key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)) lt!458587)))

(declare-fun b!1040762 () Bool)

(assert (=> b!1040762 (= e!589319 Undefined!9798)))

(declare-fun b!1040763 () Bool)

(assert (=> b!1040763 (= e!589320 (Found!9798 (index!41565 lt!458589)))))

(declare-fun b!1040764 () Bool)

(assert (=> b!1040764 (= e!589318 (MissingZero!9798 (index!41565 lt!458589)))))

(assert (= (and d!125569 c!105506) b!1040762))

(assert (= (and d!125569 (not c!105506)) b!1040760))

(assert (= (and b!1040760 c!105505) b!1040763))

(assert (= (and b!1040760 (not c!105505)) b!1040761))

(assert (= (and b!1040761 c!105507) b!1040764))

(assert (= (and b!1040761 (not c!105507)) b!1040759))

(declare-fun m!959823 () Bool)

(assert (=> b!1040759 m!959823))

(declare-fun m!959825 () Bool)

(assert (=> b!1040760 m!959825))

(declare-fun m!959827 () Bool)

(assert (=> d!125569 m!959827))

(declare-fun m!959829 () Bool)

(assert (=> d!125569 m!959829))

(assert (=> d!125569 m!959829))

(declare-fun m!959831 () Bool)

(assert (=> d!125569 m!959831))

(assert (=> d!125569 m!959731))

(assert (=> b!1040697 d!125569))

(declare-fun b!1040775 () Bool)

(declare-fun e!589331 () Bool)

(declare-fun e!589332 () Bool)

(assert (=> b!1040775 (= e!589331 e!589332)))

(declare-fun c!105510 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040775 (= c!105510 (validKeyInArray!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun b!1040776 () Bool)

(declare-fun e!589330 () Bool)

(declare-fun contains!6032 (List!21999 (_ BitVec 64)) Bool)

(assert (=> b!1040776 (= e!589330 (contains!6032 Nil!21996 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun b!1040777 () Bool)

(declare-fun call!44057 () Bool)

(assert (=> b!1040777 (= e!589332 call!44057)))

(declare-fun b!1040778 () Bool)

(assert (=> b!1040778 (= e!589332 call!44057)))

(declare-fun bm!44054 () Bool)

(assert (=> bm!44054 (= call!44057 (arrayNoDuplicates!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105510 (Cons!21995 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) Nil!21996) Nil!21996)))))

(declare-fun b!1040779 () Bool)

(declare-fun e!589329 () Bool)

(assert (=> b!1040779 (= e!589329 e!589331)))

(declare-fun res!693824 () Bool)

(assert (=> b!1040779 (=> (not res!693824) (not e!589331))))

(assert (=> b!1040779 (= res!693824 (not e!589330))))

(declare-fun res!693823 () Bool)

(assert (=> b!1040779 (=> (not res!693823) (not e!589330))))

(assert (=> b!1040779 (= res!693823 (validKeyInArray!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun d!125571 () Bool)

(declare-fun res!693825 () Bool)

(assert (=> d!125571 (=> res!693825 e!589329)))

(assert (=> d!125571 (= res!693825 (bvsge #b00000000000000000000000000000000 (size!32081 lt!458540)))))

(assert (=> d!125571 (= (arrayNoDuplicates!0 lt!458540 #b00000000000000000000000000000000 Nil!21996) e!589329)))

(assert (= (and d!125571 (not res!693825)) b!1040779))

(assert (= (and b!1040779 res!693823) b!1040776))

(assert (= (and b!1040779 res!693824) b!1040775))

(assert (= (and b!1040775 c!105510) b!1040778))

(assert (= (and b!1040775 (not c!105510)) b!1040777))

(assert (= (or b!1040778 b!1040777) bm!44054))

(declare-fun m!959833 () Bool)

(assert (=> b!1040775 m!959833))

(assert (=> b!1040775 m!959833))

(declare-fun m!959835 () Bool)

(assert (=> b!1040775 m!959835))

(assert (=> b!1040776 m!959833))

(assert (=> b!1040776 m!959833))

(declare-fun m!959837 () Bool)

(assert (=> b!1040776 m!959837))

(assert (=> bm!44054 m!959833))

(declare-fun m!959839 () Bool)

(assert (=> bm!44054 m!959839))

(assert (=> b!1040779 m!959833))

(assert (=> b!1040779 m!959833))

(assert (=> b!1040779 m!959835))

(assert (=> b!1040698 d!125571))

(declare-fun d!125573 () Bool)

(declare-fun e!589335 () Bool)

(assert (=> d!125573 e!589335))

(declare-fun res!693828 () Bool)

(assert (=> d!125573 (=> (not res!693828) (not e!589335))))

(assert (=> d!125573 (= res!693828 (and (bvsge (index!41564 lt!458542) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458542) (size!32081 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458593 () Unit!33907)

(declare-fun choose!25 (array!65571 (_ BitVec 32) (_ BitVec 32)) Unit!33907)

(assert (=> d!125573 (= lt!458593 (choose!25 (_keys!11570 thiss!1427) (index!41564 lt!458542) (mask!30350 thiss!1427)))))

(assert (=> d!125573 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125573 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) (mask!30350 thiss!1427)) lt!458593)))

(declare-fun b!1040782 () Bool)

(assert (=> b!1040782 (= e!589335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (mask!30350 thiss!1427)))))

(assert (= (and d!125573 res!693828) b!1040782))

(declare-fun m!959841 () Bool)

(assert (=> d!125573 m!959841))

(assert (=> d!125573 m!959731))

(assert (=> b!1040782 m!959735))

(declare-fun m!959843 () Bool)

(assert (=> b!1040782 m!959843))

(assert (=> b!1040698 d!125573))

(declare-fun b!1040791 () Bool)

(declare-fun e!589340 () (_ BitVec 32))

(assert (=> b!1040791 (= e!589340 #b00000000000000000000000000000000)))

(declare-fun b!1040792 () Bool)

(declare-fun e!589341 () (_ BitVec 32))

(declare-fun call!44060 () (_ BitVec 32))

(assert (=> b!1040792 (= e!589341 call!44060)))

(declare-fun bm!44057 () Bool)

(assert (=> bm!44057 (= call!44060 (arrayCountValidKeys!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun b!1040793 () Bool)

(assert (=> b!1040793 (= e!589341 (bvadd #b00000000000000000000000000000001 call!44060))))

(declare-fun b!1040794 () Bool)

(assert (=> b!1040794 (= e!589340 e!589341)))

(declare-fun c!105516 () Bool)

(assert (=> b!1040794 (= c!105516 (validKeyInArray!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun d!125575 () Bool)

(declare-fun lt!458596 () (_ BitVec 32))

(assert (=> d!125575 (and (bvsge lt!458596 #b00000000000000000000000000000000) (bvsle lt!458596 (bvsub (size!32081 lt!458540) #b00000000000000000000000000000000)))))

(assert (=> d!125575 (= lt!458596 e!589340)))

(declare-fun c!105515 () Bool)

(assert (=> d!125575 (= c!105515 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125575 (and (bvsle #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11570 thiss!1427)) (size!32081 lt!458540)))))

(assert (=> d!125575 (= (arrayCountValidKeys!0 lt!458540 #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) lt!458596)))

(assert (= (and d!125575 c!105515) b!1040791))

(assert (= (and d!125575 (not c!105515)) b!1040794))

(assert (= (and b!1040794 c!105516) b!1040793))

(assert (= (and b!1040794 (not c!105516)) b!1040792))

(assert (= (or b!1040793 b!1040792) bm!44057))

(declare-fun m!959845 () Bool)

(assert (=> bm!44057 m!959845))

(assert (=> b!1040794 m!959833))

(assert (=> b!1040794 m!959833))

(assert (=> b!1040794 m!959835))

(assert (=> b!1040698 d!125575))

(declare-fun d!125577 () Bool)

(declare-fun e!589344 () Bool)

(assert (=> d!125577 e!589344))

(declare-fun res!693831 () Bool)

(assert (=> d!125577 (=> (not res!693831) (not e!589344))))

(assert (=> d!125577 (= res!693831 (bvslt (index!41564 lt!458542) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun lt!458599 () Unit!33907)

(declare-fun choose!121 (array!65571 (_ BitVec 32) (_ BitVec 64)) Unit!33907)

(assert (=> d!125577 (= lt!458599 (choose!121 (_keys!11570 thiss!1427) (index!41564 lt!458542) key!909))))

(assert (=> d!125577 (bvsge (index!41564 lt!458542) #b00000000000000000000000000000000)))

(assert (=> d!125577 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) key!909) lt!458599)))

(declare-fun b!1040797 () Bool)

(assert (=> b!1040797 (= e!589344 (not (arrayContainsKey!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125577 res!693831) b!1040797))

(declare-fun m!959847 () Bool)

(assert (=> d!125577 m!959847))

(assert (=> b!1040797 m!959735))

(declare-fun m!959849 () Bool)

(assert (=> b!1040797 m!959849))

(assert (=> b!1040698 d!125577))

(declare-fun d!125579 () Bool)

(assert (=> d!125579 (= (validMask!0 (mask!30350 thiss!1427)) (and (or (= (mask!30350 thiss!1427) #b00000000000000000000000000000111) (= (mask!30350 thiss!1427) #b00000000000000000000000000001111) (= (mask!30350 thiss!1427) #b00000000000000000000000000011111) (= (mask!30350 thiss!1427) #b00000000000000000000000000111111) (= (mask!30350 thiss!1427) #b00000000000000000000000001111111) (= (mask!30350 thiss!1427) #b00000000000000000000000011111111) (= (mask!30350 thiss!1427) #b00000000000000000000000111111111) (= (mask!30350 thiss!1427) #b00000000000000000000001111111111) (= (mask!30350 thiss!1427) #b00000000000000000000011111111111) (= (mask!30350 thiss!1427) #b00000000000000000000111111111111) (= (mask!30350 thiss!1427) #b00000000000000000001111111111111) (= (mask!30350 thiss!1427) #b00000000000000000011111111111111) (= (mask!30350 thiss!1427) #b00000000000000000111111111111111) (= (mask!30350 thiss!1427) #b00000000000000001111111111111111) (= (mask!30350 thiss!1427) #b00000000000000011111111111111111) (= (mask!30350 thiss!1427) #b00000000000000111111111111111111) (= (mask!30350 thiss!1427) #b00000000000001111111111111111111) (= (mask!30350 thiss!1427) #b00000000000011111111111111111111) (= (mask!30350 thiss!1427) #b00000000000111111111111111111111) (= (mask!30350 thiss!1427) #b00000000001111111111111111111111) (= (mask!30350 thiss!1427) #b00000000011111111111111111111111) (= (mask!30350 thiss!1427) #b00000000111111111111111111111111) (= (mask!30350 thiss!1427) #b00000001111111111111111111111111) (= (mask!30350 thiss!1427) #b00000011111111111111111111111111) (= (mask!30350 thiss!1427) #b00000111111111111111111111111111) (= (mask!30350 thiss!1427) #b00001111111111111111111111111111) (= (mask!30350 thiss!1427) #b00011111111111111111111111111111) (= (mask!30350 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30350 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040698 d!125579))

(declare-fun d!125581 () Bool)

(declare-fun e!589347 () Bool)

(assert (=> d!125581 e!589347))

(declare-fun res!693834 () Bool)

(assert (=> d!125581 (=> (not res!693834) (not e!589347))))

(assert (=> d!125581 (= res!693834 (and (bvsge (index!41564 lt!458542) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458542) (size!32081 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458602 () Unit!33907)

(declare-fun choose!53 (array!65571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21999) Unit!33907)

(assert (=> d!125581 (= lt!458602 (choose!53 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!458542) #b00000000000000000000000000000000 Nil!21996))))

(assert (=> d!125581 (bvslt (size!32081 (_keys!11570 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125581 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!458542) #b00000000000000000000000000000000 Nil!21996) lt!458602)))

(declare-fun b!1040800 () Bool)

(assert (=> b!1040800 (= e!589347 (arrayNoDuplicates!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 Nil!21996))))

(assert (= (and d!125581 res!693834) b!1040800))

(declare-fun m!959851 () Bool)

(assert (=> d!125581 m!959851))

(assert (=> b!1040800 m!959735))

(declare-fun m!959853 () Bool)

(assert (=> b!1040800 m!959853))

(assert (=> b!1040698 d!125581))

(declare-fun b!1040809 () Bool)

(declare-fun e!589356 () Bool)

(declare-fun call!44063 () Bool)

(assert (=> b!1040809 (= e!589356 call!44063)))

(declare-fun bm!44060 () Bool)

(assert (=> bm!44060 (= call!44063 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458540 (mask!30350 thiss!1427)))))

(declare-fun b!1040810 () Bool)

(declare-fun e!589355 () Bool)

(declare-fun e!589354 () Bool)

(assert (=> b!1040810 (= e!589355 e!589354)))

(declare-fun c!105519 () Bool)

(assert (=> b!1040810 (= c!105519 (validKeyInArray!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun b!1040811 () Bool)

(assert (=> b!1040811 (= e!589354 e!589356)))

(declare-fun lt!458609 () (_ BitVec 64))

(assert (=> b!1040811 (= lt!458609 (select (arr!31548 lt!458540) #b00000000000000000000000000000000))))

(declare-fun lt!458611 () Unit!33907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65571 (_ BitVec 64) (_ BitVec 32)) Unit!33907)

(assert (=> b!1040811 (= lt!458611 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458540 lt!458609 #b00000000000000000000000000000000))))

(assert (=> b!1040811 (arrayContainsKey!0 lt!458540 lt!458609 #b00000000000000000000000000000000)))

(declare-fun lt!458610 () Unit!33907)

(assert (=> b!1040811 (= lt!458610 lt!458611)))

(declare-fun res!693840 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65571 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1040811 (= res!693840 (= (seekEntryOrOpen!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) lt!458540 (mask!30350 thiss!1427)) (Found!9798 #b00000000000000000000000000000000)))))

(assert (=> b!1040811 (=> (not res!693840) (not e!589356))))

(declare-fun b!1040812 () Bool)

(assert (=> b!1040812 (= e!589354 call!44063)))

(declare-fun d!125583 () Bool)

(declare-fun res!693839 () Bool)

(assert (=> d!125583 (=> res!693839 e!589355)))

(assert (=> d!125583 (= res!693839 (bvsge #b00000000000000000000000000000000 (size!32081 lt!458540)))))

(assert (=> d!125583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458540 (mask!30350 thiss!1427)) e!589355)))

(assert (= (and d!125583 (not res!693839)) b!1040810))

(assert (= (and b!1040810 c!105519) b!1040811))

(assert (= (and b!1040810 (not c!105519)) b!1040812))

(assert (= (and b!1040811 res!693840) b!1040809))

(assert (= (or b!1040809 b!1040812) bm!44060))

(declare-fun m!959855 () Bool)

(assert (=> bm!44060 m!959855))

(assert (=> b!1040810 m!959833))

(assert (=> b!1040810 m!959833))

(assert (=> b!1040810 m!959835))

(assert (=> b!1040811 m!959833))

(declare-fun m!959857 () Bool)

(assert (=> b!1040811 m!959857))

(declare-fun m!959859 () Bool)

(assert (=> b!1040811 m!959859))

(assert (=> b!1040811 m!959833))

(declare-fun m!959861 () Bool)

(assert (=> b!1040811 m!959861))

(assert (=> b!1040698 d!125583))

(declare-fun b!1040813 () Bool)

(declare-fun e!589357 () (_ BitVec 32))

(assert (=> b!1040813 (= e!589357 #b00000000000000000000000000000000)))

(declare-fun b!1040814 () Bool)

(declare-fun e!589358 () (_ BitVec 32))

(declare-fun call!44064 () (_ BitVec 32))

(assert (=> b!1040814 (= e!589358 call!44064)))

(declare-fun bm!44061 () Bool)

(assert (=> bm!44061 (= call!44064 (arrayCountValidKeys!0 (_keys!11570 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun b!1040815 () Bool)

(assert (=> b!1040815 (= e!589358 (bvadd #b00000000000000000000000000000001 call!44064))))

(declare-fun b!1040816 () Bool)

(assert (=> b!1040816 (= e!589357 e!589358)))

(declare-fun c!105521 () Bool)

(assert (=> b!1040816 (= c!105521 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125585 () Bool)

(declare-fun lt!458612 () (_ BitVec 32))

(assert (=> d!125585 (and (bvsge lt!458612 #b00000000000000000000000000000000) (bvsle lt!458612 (bvsub (size!32081 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125585 (= lt!458612 e!589357)))

(declare-fun c!105520 () Bool)

(assert (=> d!125585 (= c!105520 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125585 (and (bvsle #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11570 thiss!1427)) (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125585 (= (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) lt!458612)))

(assert (= (and d!125585 c!105520) b!1040813))

(assert (= (and d!125585 (not c!105520)) b!1040816))

(assert (= (and b!1040816 c!105521) b!1040815))

(assert (= (and b!1040816 (not c!105521)) b!1040814))

(assert (= (or b!1040815 b!1040814) bm!44061))

(declare-fun m!959863 () Bool)

(assert (=> bm!44061 m!959863))

(declare-fun m!959865 () Bool)

(assert (=> b!1040816 m!959865))

(assert (=> b!1040816 m!959865))

(declare-fun m!959867 () Bool)

(assert (=> b!1040816 m!959867))

(assert (=> b!1040698 d!125585))

(declare-fun b!1040828 () Bool)

(declare-fun e!589364 () Bool)

(assert (=> b!1040828 (= e!589364 (= (arrayCountValidKeys!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125587 () Bool)

(assert (=> d!125587 e!589364))

(declare-fun res!693851 () Bool)

(assert (=> d!125587 (=> (not res!693851) (not e!589364))))

(assert (=> d!125587 (= res!693851 (and (bvsge (index!41564 lt!458542) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458542) (size!32081 (_keys!11570 thiss!1427)))))))

(declare-fun lt!458615 () Unit!33907)

(declare-fun choose!82 (array!65571 (_ BitVec 32) (_ BitVec 64)) Unit!33907)

(assert (=> d!125587 (= lt!458615 (choose!82 (_keys!11570 thiss!1427) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589363 () Bool)

(assert (=> d!125587 e!589363))

(declare-fun res!693852 () Bool)

(assert (=> d!125587 (=> (not res!693852) (not e!589363))))

(assert (=> d!125587 (= res!693852 (and (bvsge (index!41564 lt!458542) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458542) (size!32081 (_keys!11570 thiss!1427)))))))

(assert (=> d!125587 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11570 thiss!1427) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458615)))

(declare-fun b!1040825 () Bool)

(declare-fun res!693850 () Bool)

(assert (=> b!1040825 (=> (not res!693850) (not e!589363))))

(assert (=> b!1040825 (= res!693850 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542))))))

(declare-fun b!1040826 () Bool)

(declare-fun res!693849 () Bool)

(assert (=> b!1040826 (=> (not res!693849) (not e!589363))))

(assert (=> b!1040826 (= res!693849 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040827 () Bool)

(assert (=> b!1040827 (= e!589363 (bvslt (size!32081 (_keys!11570 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125587 res!693852) b!1040825))

(assert (= (and b!1040825 res!693850) b!1040826))

(assert (= (and b!1040826 res!693849) b!1040827))

(assert (= (and d!125587 res!693851) b!1040828))

(assert (=> b!1040828 m!959735))

(declare-fun m!959869 () Bool)

(assert (=> b!1040828 m!959869))

(assert (=> b!1040828 m!959739))

(declare-fun m!959871 () Bool)

(assert (=> d!125587 m!959871))

(declare-fun m!959873 () Bool)

(assert (=> b!1040825 m!959873))

(assert (=> b!1040825 m!959873))

(declare-fun m!959875 () Bool)

(assert (=> b!1040825 m!959875))

(declare-fun m!959877 () Bool)

(assert (=> b!1040826 m!959877))

(assert (=> b!1040698 d!125587))

(declare-fun d!125589 () Bool)

(declare-fun res!693857 () Bool)

(declare-fun e!589369 () Bool)

(assert (=> d!125589 (=> res!693857 e!589369)))

(assert (=> d!125589 (= res!693857 (= (select (arr!31548 lt!458540) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125589 (= (arrayContainsKey!0 lt!458540 key!909 #b00000000000000000000000000000000) e!589369)))

(declare-fun b!1040833 () Bool)

(declare-fun e!589370 () Bool)

(assert (=> b!1040833 (= e!589369 e!589370)))

(declare-fun res!693858 () Bool)

(assert (=> b!1040833 (=> (not res!693858) (not e!589370))))

(assert (=> b!1040833 (= res!693858 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 lt!458540)))))

(declare-fun b!1040834 () Bool)

(assert (=> b!1040834 (= e!589370 (arrayContainsKey!0 lt!458540 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125589 (not res!693857)) b!1040833))

(assert (= (and b!1040833 res!693858) b!1040834))

(assert (=> d!125589 m!959833))

(declare-fun m!959879 () Bool)

(assert (=> b!1040834 m!959879))

(assert (=> b!1040698 d!125589))

(declare-fun d!125591 () Bool)

(declare-fun res!693865 () Bool)

(declare-fun e!589373 () Bool)

(assert (=> d!125591 (=> (not res!693865) (not e!589373))))

(declare-fun simpleValid!436 (LongMapFixedSize!5932) Bool)

(assert (=> d!125591 (= res!693865 (simpleValid!436 thiss!1427))))

(assert (=> d!125591 (= (valid!2217 thiss!1427) e!589373)))

(declare-fun b!1040841 () Bool)

(declare-fun res!693866 () Bool)

(assert (=> b!1040841 (=> (not res!693866) (not e!589373))))

(assert (=> b!1040841 (= res!693866 (= (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (_size!3021 thiss!1427)))))

(declare-fun b!1040842 () Bool)

(declare-fun res!693867 () Bool)

(assert (=> b!1040842 (=> (not res!693867) (not e!589373))))

(assert (=> b!1040842 (= res!693867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040843 () Bool)

(assert (=> b!1040843 (= e!589373 (arrayNoDuplicates!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 Nil!21996))))

(assert (= (and d!125591 res!693865) b!1040841))

(assert (= (and b!1040841 res!693866) b!1040842))

(assert (= (and b!1040842 res!693867) b!1040843))

(declare-fun m!959881 () Bool)

(assert (=> d!125591 m!959881))

(assert (=> b!1040841 m!959739))

(declare-fun m!959883 () Bool)

(assert (=> b!1040842 m!959883))

(declare-fun m!959885 () Bool)

(assert (=> b!1040843 m!959885))

(assert (=> start!91226 d!125591))

(declare-fun d!125593 () Bool)

(assert (=> d!125593 (= (array_inv!24387 (_keys!11570 thiss!1427)) (bvsge (size!32081 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040696 d!125593))

(declare-fun d!125595 () Bool)

(assert (=> d!125595 (= (array_inv!24388 (_values!6371 thiss!1427)) (bvsge (size!32082 (_values!6371 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040696 d!125595))

(declare-fun b!1040851 () Bool)

(declare-fun e!589379 () Bool)

(assert (=> b!1040851 (= e!589379 tp_is_empty!24745)))

(declare-fun mapNonEmpty!38713 () Bool)

(declare-fun mapRes!38713 () Bool)

(declare-fun tp!74294 () Bool)

(declare-fun e!589378 () Bool)

(assert (=> mapNonEmpty!38713 (= mapRes!38713 (and tp!74294 e!589378))))

(declare-fun mapValue!38713 () ValueCell!11669)

(declare-fun mapKey!38713 () (_ BitVec 32))

(declare-fun mapRest!38713 () (Array (_ BitVec 32) ValueCell!11669))

(assert (=> mapNonEmpty!38713 (= mapRest!38704 (store mapRest!38713 mapKey!38713 mapValue!38713))))

(declare-fun condMapEmpty!38713 () Bool)

(declare-fun mapDefault!38713 () ValueCell!11669)

(assert (=> mapNonEmpty!38704 (= condMapEmpty!38713 (= mapRest!38704 ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38713)))))

(assert (=> mapNonEmpty!38704 (= tp!74278 (and e!589379 mapRes!38713))))

(declare-fun b!1040850 () Bool)

(assert (=> b!1040850 (= e!589378 tp_is_empty!24745)))

(declare-fun mapIsEmpty!38713 () Bool)

(assert (=> mapIsEmpty!38713 mapRes!38713))

(assert (= (and mapNonEmpty!38704 condMapEmpty!38713) mapIsEmpty!38713))

(assert (= (and mapNonEmpty!38704 (not condMapEmpty!38713)) mapNonEmpty!38713))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11669) mapValue!38713)) b!1040850))

(assert (= (and mapNonEmpty!38704 ((_ is ValueCellFull!11669) mapDefault!38713)) b!1040851))

(declare-fun m!959887 () Bool)

(assert (=> mapNonEmpty!38713 m!959887))

(check-sat b_and!33531 (not b!1040828) (not b!1040816) (not b!1040826) (not d!125581) (not b_next!21025) (not b!1040834) (not bm!44057) (not b!1040797) (not b!1040775) (not d!125573) tp_is_empty!24745 (not b!1040842) (not mapNonEmpty!38713) (not d!125587) (not b!1040825) (not b!1040800) (not b!1040811) (not bm!44060) (not b!1040779) (not b!1040759) (not b!1040776) (not bm!44061) (not b!1040782) (not d!125591) (not d!125569) (not b!1040810) (not b!1040794) (not b!1040843) (not b!1040841) (not d!125577) (not bm!44054))
(check-sat b_and!33531 (not b_next!21025))
(get-model)

(declare-fun d!125597 () Bool)

(assert (=> d!125597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (mask!30350 thiss!1427))))

(assert (=> d!125597 true))

(declare-fun _$44!21 () Unit!33907)

(assert (=> d!125597 (= (choose!25 (_keys!11570 thiss!1427) (index!41564 lt!458542) (mask!30350 thiss!1427)) _$44!21)))

(declare-fun bs!30418 () Bool)

(assert (= bs!30418 d!125597))

(assert (=> bs!30418 m!959735))

(assert (=> bs!30418 m!959843))

(assert (=> d!125573 d!125597))

(assert (=> d!125573 d!125579))

(declare-fun b!1040852 () Bool)

(declare-fun e!589382 () Bool)

(declare-fun e!589383 () Bool)

(assert (=> b!1040852 (= e!589382 e!589383)))

(declare-fun c!105522 () Bool)

(assert (=> b!1040852 (= c!105522 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040853 () Bool)

(declare-fun e!589381 () Bool)

(assert (=> b!1040853 (= e!589381 (contains!6032 Nil!21996 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040854 () Bool)

(declare-fun call!44065 () Bool)

(assert (=> b!1040854 (= e!589383 call!44065)))

(declare-fun b!1040855 () Bool)

(assert (=> b!1040855 (= e!589383 call!44065)))

(declare-fun bm!44062 () Bool)

(assert (=> bm!44062 (= call!44065 (arrayNoDuplicates!0 (_keys!11570 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105522 (Cons!21995 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000) Nil!21996) Nil!21996)))))

(declare-fun b!1040856 () Bool)

(declare-fun e!589380 () Bool)

(assert (=> b!1040856 (= e!589380 e!589382)))

(declare-fun res!693869 () Bool)

(assert (=> b!1040856 (=> (not res!693869) (not e!589382))))

(assert (=> b!1040856 (= res!693869 (not e!589381))))

(declare-fun res!693868 () Bool)

(assert (=> b!1040856 (=> (not res!693868) (not e!589381))))

(assert (=> b!1040856 (= res!693868 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125599 () Bool)

(declare-fun res!693870 () Bool)

(assert (=> d!125599 (=> res!693870 e!589380)))

(assert (=> d!125599 (= res!693870 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125599 (= (arrayNoDuplicates!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 Nil!21996) e!589380)))

(assert (= (and d!125599 (not res!693870)) b!1040856))

(assert (= (and b!1040856 res!693868) b!1040853))

(assert (= (and b!1040856 res!693869) b!1040852))

(assert (= (and b!1040852 c!105522) b!1040855))

(assert (= (and b!1040852 (not c!105522)) b!1040854))

(assert (= (or b!1040855 b!1040854) bm!44062))

(assert (=> b!1040852 m!959865))

(assert (=> b!1040852 m!959865))

(assert (=> b!1040852 m!959867))

(assert (=> b!1040853 m!959865))

(assert (=> b!1040853 m!959865))

(declare-fun m!959889 () Bool)

(assert (=> b!1040853 m!959889))

(assert (=> bm!44062 m!959865))

(declare-fun m!959891 () Bool)

(assert (=> bm!44062 m!959891))

(assert (=> b!1040856 m!959865))

(assert (=> b!1040856 m!959865))

(assert (=> b!1040856 m!959867))

(assert (=> b!1040843 d!125599))

(declare-fun b!1040857 () Bool)

(declare-fun e!589384 () (_ BitVec 32))

(assert (=> b!1040857 (= e!589384 #b00000000000000000000000000000000)))

(declare-fun b!1040858 () Bool)

(declare-fun e!589385 () (_ BitVec 32))

(declare-fun call!44066 () (_ BitVec 32))

(assert (=> b!1040858 (= e!589385 call!44066)))

(declare-fun bm!44063 () Bool)

(assert (=> bm!44063 (= call!44066 (arrayCountValidKeys!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun b!1040859 () Bool)

(assert (=> b!1040859 (= e!589385 (bvadd #b00000000000000000000000000000001 call!44066))))

(declare-fun b!1040860 () Bool)

(assert (=> b!1040860 (= e!589384 e!589385)))

(declare-fun c!105524 () Bool)

(assert (=> b!1040860 (= c!105524 (validKeyInArray!0 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125601 () Bool)

(declare-fun lt!458616 () (_ BitVec 32))

(assert (=> d!125601 (and (bvsge lt!458616 #b00000000000000000000000000000000) (bvsle lt!458616 (bvsub (size!32081 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125601 (= lt!458616 e!589384)))

(declare-fun c!105523 () Bool)

(assert (=> d!125601 (= c!105523 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125601 (and (bvsle #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11570 thiss!1427)) (size!32081 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))))))))

(assert (=> d!125601 (= (arrayCountValidKeys!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) lt!458616)))

(assert (= (and d!125601 c!105523) b!1040857))

(assert (= (and d!125601 (not c!105523)) b!1040860))

(assert (= (and b!1040860 c!105524) b!1040859))

(assert (= (and b!1040860 (not c!105524)) b!1040858))

(assert (= (or b!1040859 b!1040858) bm!44063))

(declare-fun m!959893 () Bool)

(assert (=> bm!44063 m!959893))

(declare-fun m!959895 () Bool)

(assert (=> b!1040860 m!959895))

(assert (=> b!1040860 m!959895))

(declare-fun m!959897 () Bool)

(assert (=> b!1040860 m!959897))

(assert (=> b!1040828 d!125601))

(assert (=> b!1040828 d!125585))

(declare-fun d!125603 () Bool)

(assert (=> d!125603 (not (arrayContainsKey!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125603 true))

(declare-fun _$59!23 () Unit!33907)

(assert (=> d!125603 (= (choose!121 (_keys!11570 thiss!1427) (index!41564 lt!458542) key!909) _$59!23)))

(declare-fun bs!30419 () Bool)

(assert (= bs!30419 d!125603))

(assert (=> bs!30419 m!959735))

(assert (=> bs!30419 m!959849))

(assert (=> d!125577 d!125603))

(declare-fun b!1040879 () Bool)

(declare-fun e!589397 () SeekEntryResult!9798)

(assert (=> b!1040879 (= e!589397 (Intermediate!9798 true (toIndex!0 key!909 (mask!30350 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1040880 () Bool)

(declare-fun e!589398 () SeekEntryResult!9798)

(assert (=> b!1040880 (= e!589397 e!589398)))

(declare-fun c!105531 () Bool)

(declare-fun lt!458622 () (_ BitVec 64))

(assert (=> b!1040880 (= c!105531 (or (= lt!458622 key!909) (= (bvadd lt!458622 lt!458622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040881 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040881 (= e!589398 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30350 thiss!1427)) #b00000000000000000000000000000000 (mask!30350 thiss!1427)) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040882 () Bool)

(declare-fun lt!458621 () SeekEntryResult!9798)

(assert (=> b!1040882 (and (bvsge (index!41565 lt!458621) #b00000000000000000000000000000000) (bvslt (index!41565 lt!458621) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun e!589399 () Bool)

(assert (=> b!1040882 (= e!589399 (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41565 lt!458621)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040883 () Bool)

(assert (=> b!1040883 (= e!589398 (Intermediate!9798 false (toIndex!0 key!909 (mask!30350 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!125605 () Bool)

(declare-fun e!589400 () Bool)

(assert (=> d!125605 e!589400))

(declare-fun c!105532 () Bool)

(assert (=> d!125605 (= c!105532 (and ((_ is Intermediate!9798) lt!458621) (undefined!10610 lt!458621)))))

(assert (=> d!125605 (= lt!458621 e!589397)))

(declare-fun c!105533 () Bool)

(assert (=> d!125605 (= c!105533 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125605 (= lt!458622 (select (arr!31548 (_keys!11570 thiss!1427)) (toIndex!0 key!909 (mask!30350 thiss!1427))))))

(assert (=> d!125605 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30350 thiss!1427)) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)) lt!458621)))

(declare-fun b!1040884 () Bool)

(assert (=> b!1040884 (and (bvsge (index!41565 lt!458621) #b00000000000000000000000000000000) (bvslt (index!41565 lt!458621) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun res!693878 () Bool)

(assert (=> b!1040884 (= res!693878 (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41565 lt!458621)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040884 (=> res!693878 e!589399)))

(declare-fun b!1040885 () Bool)

(assert (=> b!1040885 (and (bvsge (index!41565 lt!458621) #b00000000000000000000000000000000) (bvslt (index!41565 lt!458621) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun res!693877 () Bool)

(assert (=> b!1040885 (= res!693877 (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41565 lt!458621)) key!909))))

(assert (=> b!1040885 (=> res!693877 e!589399)))

(declare-fun e!589396 () Bool)

(assert (=> b!1040885 (= e!589396 e!589399)))

(declare-fun b!1040886 () Bool)

(assert (=> b!1040886 (= e!589400 (bvsge (x!92915 lt!458621) #b01111111111111111111111111111110))))

(declare-fun b!1040887 () Bool)

(assert (=> b!1040887 (= e!589400 e!589396)))

(declare-fun res!693879 () Bool)

(assert (=> b!1040887 (= res!693879 (and ((_ is Intermediate!9798) lt!458621) (not (undefined!10610 lt!458621)) (bvslt (x!92915 lt!458621) #b01111111111111111111111111111110) (bvsge (x!92915 lt!458621) #b00000000000000000000000000000000) (bvsge (x!92915 lt!458621) #b00000000000000000000000000000000)))))

(assert (=> b!1040887 (=> (not res!693879) (not e!589396))))

(assert (= (and d!125605 c!105533) b!1040879))

(assert (= (and d!125605 (not c!105533)) b!1040880))

(assert (= (and b!1040880 c!105531) b!1040883))

(assert (= (and b!1040880 (not c!105531)) b!1040881))

(assert (= (and d!125605 c!105532) b!1040886))

(assert (= (and d!125605 (not c!105532)) b!1040887))

(assert (= (and b!1040887 res!693879) b!1040885))

(assert (= (and b!1040885 (not res!693877)) b!1040884))

(assert (= (and b!1040884 (not res!693878)) b!1040882))

(declare-fun m!959899 () Bool)

(assert (=> b!1040882 m!959899))

(assert (=> b!1040885 m!959899))

(assert (=> b!1040884 m!959899))

(assert (=> b!1040881 m!959829))

(declare-fun m!959901 () Bool)

(assert (=> b!1040881 m!959901))

(assert (=> b!1040881 m!959901))

(declare-fun m!959903 () Bool)

(assert (=> b!1040881 m!959903))

(assert (=> d!125605 m!959829))

(declare-fun m!959905 () Bool)

(assert (=> d!125605 m!959905))

(assert (=> d!125605 m!959731))

(assert (=> d!125569 d!125605))

(declare-fun d!125607 () Bool)

(declare-fun lt!458628 () (_ BitVec 32))

(declare-fun lt!458627 () (_ BitVec 32))

(assert (=> d!125607 (= lt!458628 (bvmul (bvxor lt!458627 (bvlshr lt!458627 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125607 (= lt!458627 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125607 (and (bvsge (mask!30350 thiss!1427) #b00000000000000000000000000000000) (let ((res!693880 (let ((h!23201 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92933 (bvmul (bvxor h!23201 (bvlshr h!23201 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92933 (bvlshr x!92933 #b00000000000000000000000000001101)) (mask!30350 thiss!1427)))))) (and (bvslt res!693880 (bvadd (mask!30350 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!693880 #b00000000000000000000000000000000))))))

(assert (=> d!125607 (= (toIndex!0 key!909 (mask!30350 thiss!1427)) (bvand (bvxor lt!458628 (bvlshr lt!458628 #b00000000000000000000000000001101)) (mask!30350 thiss!1427)))))

(assert (=> d!125569 d!125607))

(assert (=> d!125569 d!125579))

(declare-fun b!1040888 () Bool)

(declare-fun e!589403 () Bool)

(declare-fun call!44067 () Bool)

(assert (=> b!1040888 (= e!589403 call!44067)))

(declare-fun bm!44064 () Bool)

(assert (=> bm!44064 (= call!44067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!458540 (mask!30350 thiss!1427)))))

(declare-fun b!1040889 () Bool)

(declare-fun e!589402 () Bool)

(declare-fun e!589401 () Bool)

(assert (=> b!1040889 (= e!589402 e!589401)))

(declare-fun c!105534 () Bool)

(assert (=> b!1040889 (= c!105534 (validKeyInArray!0 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1040890 () Bool)

(assert (=> b!1040890 (= e!589401 e!589403)))

(declare-fun lt!458629 () (_ BitVec 64))

(assert (=> b!1040890 (= lt!458629 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!458631 () Unit!33907)

(assert (=> b!1040890 (= lt!458631 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458540 lt!458629 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1040890 (arrayContainsKey!0 lt!458540 lt!458629 #b00000000000000000000000000000000)))

(declare-fun lt!458630 () Unit!33907)

(assert (=> b!1040890 (= lt!458630 lt!458631)))

(declare-fun res!693882 () Bool)

(assert (=> b!1040890 (= res!693882 (= (seekEntryOrOpen!0 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!458540 (mask!30350 thiss!1427)) (Found!9798 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1040890 (=> (not res!693882) (not e!589403))))

(declare-fun b!1040891 () Bool)

(assert (=> b!1040891 (= e!589401 call!44067)))

(declare-fun d!125609 () Bool)

(declare-fun res!693881 () Bool)

(assert (=> d!125609 (=> res!693881 e!589402)))

(assert (=> d!125609 (= res!693881 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 lt!458540)))))

(assert (=> d!125609 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458540 (mask!30350 thiss!1427)) e!589402)))

(assert (= (and d!125609 (not res!693881)) b!1040889))

(assert (= (and b!1040889 c!105534) b!1040890))

(assert (= (and b!1040889 (not c!105534)) b!1040891))

(assert (= (and b!1040890 res!693882) b!1040888))

(assert (= (or b!1040888 b!1040891) bm!44064))

(declare-fun m!959907 () Bool)

(assert (=> bm!44064 m!959907))

(declare-fun m!959909 () Bool)

(assert (=> b!1040889 m!959909))

(assert (=> b!1040889 m!959909))

(declare-fun m!959911 () Bool)

(assert (=> b!1040889 m!959911))

(assert (=> b!1040890 m!959909))

(declare-fun m!959913 () Bool)

(assert (=> b!1040890 m!959913))

(declare-fun m!959915 () Bool)

(assert (=> b!1040890 m!959915))

(assert (=> b!1040890 m!959909))

(declare-fun m!959917 () Bool)

(assert (=> b!1040890 m!959917))

(assert (=> bm!44060 d!125609))

(declare-fun b!1040892 () Bool)

(declare-fun e!589404 () (_ BitVec 32))

(assert (=> b!1040892 (= e!589404 #b00000000000000000000000000000000)))

(declare-fun b!1040893 () Bool)

(declare-fun e!589405 () (_ BitVec 32))

(declare-fun call!44068 () (_ BitVec 32))

(assert (=> b!1040893 (= e!589405 call!44068)))

(declare-fun bm!44065 () Bool)

(assert (=> bm!44065 (= call!44068 (arrayCountValidKeys!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun b!1040894 () Bool)

(assert (=> b!1040894 (= e!589405 (bvadd #b00000000000000000000000000000001 call!44068))))

(declare-fun b!1040895 () Bool)

(assert (=> b!1040895 (= e!589404 e!589405)))

(declare-fun c!105536 () Bool)

(assert (=> b!1040895 (= c!105536 (validKeyInArray!0 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125611 () Bool)

(declare-fun lt!458632 () (_ BitVec 32))

(assert (=> d!125611 (and (bvsge lt!458632 #b00000000000000000000000000000000) (bvsle lt!458632 (bvsub (size!32081 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125611 (= lt!458632 e!589404)))

(declare-fun c!105535 () Bool)

(assert (=> d!125611 (= c!105535 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125611 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11570 thiss!1427)) (size!32081 lt!458540)))))

(assert (=> d!125611 (= (arrayCountValidKeys!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))) lt!458632)))

(assert (= (and d!125611 c!105535) b!1040892))

(assert (= (and d!125611 (not c!105535)) b!1040895))

(assert (= (and b!1040895 c!105536) b!1040894))

(assert (= (and b!1040895 (not c!105536)) b!1040893))

(assert (= (or b!1040894 b!1040893) bm!44065))

(declare-fun m!959919 () Bool)

(assert (=> bm!44065 m!959919))

(assert (=> b!1040895 m!959909))

(assert (=> b!1040895 m!959909))

(assert (=> b!1040895 m!959911))

(assert (=> bm!44057 d!125611))

(declare-fun b!1040896 () Bool)

(declare-fun e!589406 () (_ BitVec 32))

(assert (=> b!1040896 (= e!589406 #b00000000000000000000000000000000)))

(declare-fun b!1040897 () Bool)

(declare-fun e!589407 () (_ BitVec 32))

(declare-fun call!44069 () (_ BitVec 32))

(assert (=> b!1040897 (= e!589407 call!44069)))

(declare-fun bm!44066 () Bool)

(assert (=> bm!44066 (= call!44069 (arrayCountValidKeys!0 (_keys!11570 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(declare-fun b!1040898 () Bool)

(assert (=> b!1040898 (= e!589407 (bvadd #b00000000000000000000000000000001 call!44069))))

(declare-fun b!1040899 () Bool)

(assert (=> b!1040899 (= e!589406 e!589407)))

(declare-fun c!105538 () Bool)

(assert (=> b!1040899 (= c!105538 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125613 () Bool)

(declare-fun lt!458633 () (_ BitVec 32))

(assert (=> d!125613 (and (bvsge lt!458633 #b00000000000000000000000000000000) (bvsle lt!458633 (bvsub (size!32081 (_keys!11570 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!125613 (= lt!458633 e!589406)))

(declare-fun c!105537 () Bool)

(assert (=> d!125613 (= c!105537 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125613 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11570 thiss!1427)) (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125613 (= (arrayCountValidKeys!0 (_keys!11570 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11570 thiss!1427))) lt!458633)))

(assert (= (and d!125613 c!105537) b!1040896))

(assert (= (and d!125613 (not c!105537)) b!1040899))

(assert (= (and b!1040899 c!105538) b!1040898))

(assert (= (and b!1040899 (not c!105538)) b!1040897))

(assert (= (or b!1040898 b!1040897) bm!44066))

(declare-fun m!959921 () Bool)

(assert (=> bm!44066 m!959921))

(declare-fun m!959923 () Bool)

(assert (=> b!1040899 m!959923))

(assert (=> b!1040899 m!959923))

(declare-fun m!959925 () Bool)

(assert (=> b!1040899 m!959925))

(assert (=> bm!44061 d!125613))

(declare-fun d!125615 () Bool)

(assert (=> d!125615 (= (validKeyInArray!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)) (and (not (= (select (arr!31548 lt!458540) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31548 lt!458540) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040810 d!125615))

(declare-fun d!125617 () Bool)

(assert (=> d!125617 (arrayContainsKey!0 lt!458540 lt!458609 #b00000000000000000000000000000000)))

(declare-fun lt!458636 () Unit!33907)

(declare-fun choose!13 (array!65571 (_ BitVec 64) (_ BitVec 32)) Unit!33907)

(assert (=> d!125617 (= lt!458636 (choose!13 lt!458540 lt!458609 #b00000000000000000000000000000000))))

(assert (=> d!125617 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125617 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458540 lt!458609 #b00000000000000000000000000000000) lt!458636)))

(declare-fun bs!30420 () Bool)

(assert (= bs!30420 d!125617))

(assert (=> bs!30420 m!959859))

(declare-fun m!959927 () Bool)

(assert (=> bs!30420 m!959927))

(assert (=> b!1040811 d!125617))

(declare-fun d!125619 () Bool)

(declare-fun res!693883 () Bool)

(declare-fun e!589408 () Bool)

(assert (=> d!125619 (=> res!693883 e!589408)))

(assert (=> d!125619 (= res!693883 (= (select (arr!31548 lt!458540) #b00000000000000000000000000000000) lt!458609))))

(assert (=> d!125619 (= (arrayContainsKey!0 lt!458540 lt!458609 #b00000000000000000000000000000000) e!589408)))

(declare-fun b!1040900 () Bool)

(declare-fun e!589409 () Bool)

(assert (=> b!1040900 (= e!589408 e!589409)))

(declare-fun res!693884 () Bool)

(assert (=> b!1040900 (=> (not res!693884) (not e!589409))))

(assert (=> b!1040900 (= res!693884 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 lt!458540)))))

(declare-fun b!1040901 () Bool)

(assert (=> b!1040901 (= e!589409 (arrayContainsKey!0 lt!458540 lt!458609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125619 (not res!693883)) b!1040900))

(assert (= (and b!1040900 res!693884) b!1040901))

(assert (=> d!125619 m!959833))

(declare-fun m!959929 () Bool)

(assert (=> b!1040901 m!959929))

(assert (=> b!1040811 d!125619))

(declare-fun b!1040914 () Bool)

(declare-fun e!589418 () SeekEntryResult!9798)

(declare-fun lt!458644 () SeekEntryResult!9798)

(assert (=> b!1040914 (= e!589418 (MissingZero!9798 (index!41565 lt!458644)))))

(declare-fun b!1040915 () Bool)

(declare-fun e!589416 () SeekEntryResult!9798)

(assert (=> b!1040915 (= e!589416 (Found!9798 (index!41565 lt!458644)))))

(declare-fun b!1040916 () Bool)

(assert (=> b!1040916 (= e!589418 (seekKeyOrZeroReturnVacant!0 (x!92915 lt!458644) (index!41565 lt!458644) (index!41565 lt!458644) (select (arr!31548 lt!458540) #b00000000000000000000000000000000) lt!458540 (mask!30350 thiss!1427)))))

(declare-fun b!1040917 () Bool)

(declare-fun e!589417 () SeekEntryResult!9798)

(assert (=> b!1040917 (= e!589417 e!589416)))

(declare-fun lt!458645 () (_ BitVec 64))

(assert (=> b!1040917 (= lt!458645 (select (arr!31548 lt!458540) (index!41565 lt!458644)))))

(declare-fun c!105546 () Bool)

(assert (=> b!1040917 (= c!105546 (= lt!458645 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun d!125621 () Bool)

(declare-fun lt!458643 () SeekEntryResult!9798)

(assert (=> d!125621 (and (or ((_ is Undefined!9798) lt!458643) (not ((_ is Found!9798) lt!458643)) (and (bvsge (index!41564 lt!458643) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458643) (size!32081 lt!458540)))) (or ((_ is Undefined!9798) lt!458643) ((_ is Found!9798) lt!458643) (not ((_ is MissingZero!9798) lt!458643)) (and (bvsge (index!41563 lt!458643) #b00000000000000000000000000000000) (bvslt (index!41563 lt!458643) (size!32081 lt!458540)))) (or ((_ is Undefined!9798) lt!458643) ((_ is Found!9798) lt!458643) ((_ is MissingZero!9798) lt!458643) (not ((_ is MissingVacant!9798) lt!458643)) (and (bvsge (index!41566 lt!458643) #b00000000000000000000000000000000) (bvslt (index!41566 lt!458643) (size!32081 lt!458540)))) (or ((_ is Undefined!9798) lt!458643) (ite ((_ is Found!9798) lt!458643) (= (select (arr!31548 lt!458540) (index!41564 lt!458643)) (select (arr!31548 lt!458540) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9798) lt!458643) (= (select (arr!31548 lt!458540) (index!41563 lt!458643)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9798) lt!458643) (= (select (arr!31548 lt!458540) (index!41566 lt!458643)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125621 (= lt!458643 e!589417)))

(declare-fun c!105547 () Bool)

(assert (=> d!125621 (= c!105547 (and ((_ is Intermediate!9798) lt!458644) (undefined!10610 lt!458644)))))

(assert (=> d!125621 (= lt!458644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) (mask!30350 thiss!1427)) (select (arr!31548 lt!458540) #b00000000000000000000000000000000) lt!458540 (mask!30350 thiss!1427)))))

(assert (=> d!125621 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125621 (= (seekEntryOrOpen!0 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) lt!458540 (mask!30350 thiss!1427)) lt!458643)))

(declare-fun b!1040918 () Bool)

(assert (=> b!1040918 (= e!589417 Undefined!9798)))

(declare-fun b!1040919 () Bool)

(declare-fun c!105545 () Bool)

(assert (=> b!1040919 (= c!105545 (= lt!458645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040919 (= e!589416 e!589418)))

(assert (= (and d!125621 c!105547) b!1040918))

(assert (= (and d!125621 (not c!105547)) b!1040917))

(assert (= (and b!1040917 c!105546) b!1040915))

(assert (= (and b!1040917 (not c!105546)) b!1040919))

(assert (= (and b!1040919 c!105545) b!1040914))

(assert (= (and b!1040919 (not c!105545)) b!1040916))

(assert (=> b!1040916 m!959833))

(declare-fun m!959931 () Bool)

(assert (=> b!1040916 m!959931))

(declare-fun m!959933 () Bool)

(assert (=> b!1040917 m!959933))

(declare-fun m!959935 () Bool)

(assert (=> d!125621 m!959935))

(declare-fun m!959937 () Bool)

(assert (=> d!125621 m!959937))

(assert (=> d!125621 m!959833))

(declare-fun m!959939 () Bool)

(assert (=> d!125621 m!959939))

(assert (=> d!125621 m!959731))

(assert (=> d!125621 m!959939))

(assert (=> d!125621 m!959833))

(declare-fun m!959941 () Bool)

(assert (=> d!125621 m!959941))

(declare-fun m!959943 () Bool)

(assert (=> d!125621 m!959943))

(assert (=> b!1040811 d!125621))

(declare-fun b!1040920 () Bool)

(declare-fun e!589421 () Bool)

(declare-fun call!44070 () Bool)

(assert (=> b!1040920 (= e!589421 call!44070)))

(declare-fun bm!44067 () Bool)

(assert (=> bm!44067 (= call!44070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (mask!30350 thiss!1427)))))

(declare-fun b!1040921 () Bool)

(declare-fun e!589420 () Bool)

(declare-fun e!589419 () Bool)

(assert (=> b!1040921 (= e!589420 e!589419)))

(declare-fun c!105548 () Bool)

(assert (=> b!1040921 (= c!105548 (validKeyInArray!0 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1040922 () Bool)

(assert (=> b!1040922 (= e!589419 e!589421)))

(declare-fun lt!458646 () (_ BitVec 64))

(assert (=> b!1040922 (= lt!458646 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!458648 () Unit!33907)

(assert (=> b!1040922 (= lt!458648 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) lt!458646 #b00000000000000000000000000000000))))

(assert (=> b!1040922 (arrayContainsKey!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) lt!458646 #b00000000000000000000000000000000)))

(declare-fun lt!458647 () Unit!33907)

(assert (=> b!1040922 (= lt!458647 lt!458648)))

(declare-fun res!693886 () Bool)

(assert (=> b!1040922 (= res!693886 (= (seekEntryOrOpen!0 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000) (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (mask!30350 thiss!1427)) (Found!9798 #b00000000000000000000000000000000)))))

(assert (=> b!1040922 (=> (not res!693886) (not e!589421))))

(declare-fun b!1040923 () Bool)

(assert (=> b!1040923 (= e!589419 call!44070)))

(declare-fun d!125623 () Bool)

(declare-fun res!693885 () Bool)

(assert (=> d!125623 (=> res!693885 e!589420)))

(assert (=> d!125623 (= res!693885 (bvsge #b00000000000000000000000000000000 (size!32081 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))))))))

(assert (=> d!125623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (mask!30350 thiss!1427)) e!589420)))

(assert (= (and d!125623 (not res!693885)) b!1040921))

(assert (= (and b!1040921 c!105548) b!1040922))

(assert (= (and b!1040921 (not c!105548)) b!1040923))

(assert (= (and b!1040922 res!693886) b!1040920))

(assert (= (or b!1040920 b!1040923) bm!44067))

(declare-fun m!959945 () Bool)

(assert (=> bm!44067 m!959945))

(assert (=> b!1040921 m!959895))

(assert (=> b!1040921 m!959895))

(assert (=> b!1040921 m!959897))

(assert (=> b!1040922 m!959895))

(declare-fun m!959947 () Bool)

(assert (=> b!1040922 m!959947))

(declare-fun m!959949 () Bool)

(assert (=> b!1040922 m!959949))

(assert (=> b!1040922 m!959895))

(declare-fun m!959951 () Bool)

(assert (=> b!1040922 m!959951))

(assert (=> b!1040782 d!125623))

(declare-fun d!125625 () Bool)

(assert (=> d!125625 (= (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040816 d!125625))

(declare-fun d!125627 () Bool)

(declare-fun res!693898 () Bool)

(declare-fun e!589424 () Bool)

(assert (=> d!125627 (=> (not res!693898) (not e!589424))))

(assert (=> d!125627 (= res!693898 (validMask!0 (mask!30350 thiss!1427)))))

(assert (=> d!125627 (= (simpleValid!436 thiss!1427) e!589424)))

(declare-fun b!1040933 () Bool)

(declare-fun res!693895 () Bool)

(assert (=> b!1040933 (=> (not res!693895) (not e!589424))))

(declare-fun size!32087 (LongMapFixedSize!5932) (_ BitVec 32))

(assert (=> b!1040933 (= res!693895 (bvsge (size!32087 thiss!1427) (_size!3021 thiss!1427)))))

(declare-fun b!1040935 () Bool)

(assert (=> b!1040935 (= e!589424 (and (bvsge (extraKeys!6076 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6076 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3021 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1040932 () Bool)

(declare-fun res!693896 () Bool)

(assert (=> b!1040932 (=> (not res!693896) (not e!589424))))

(assert (=> b!1040932 (= res!693896 (and (= (size!32082 (_values!6371 thiss!1427)) (bvadd (mask!30350 thiss!1427) #b00000000000000000000000000000001)) (= (size!32081 (_keys!11570 thiss!1427)) (size!32082 (_values!6371 thiss!1427))) (bvsge (_size!3021 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3021 thiss!1427) (bvadd (mask!30350 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1040934 () Bool)

(declare-fun res!693897 () Bool)

(assert (=> b!1040934 (=> (not res!693897) (not e!589424))))

(assert (=> b!1040934 (= res!693897 (= (size!32087 thiss!1427) (bvadd (_size!3021 thiss!1427) (bvsdiv (bvadd (extraKeys!6076 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!125627 res!693898) b!1040932))

(assert (= (and b!1040932 res!693896) b!1040933))

(assert (= (and b!1040933 res!693895) b!1040934))

(assert (= (and b!1040934 res!693897) b!1040935))

(assert (=> d!125627 m!959731))

(declare-fun m!959953 () Bool)

(assert (=> b!1040933 m!959953))

(assert (=> b!1040934 m!959953))

(assert (=> d!125591 d!125627))

(declare-fun d!125629 () Bool)

(declare-fun res!693899 () Bool)

(declare-fun e!589425 () Bool)

(assert (=> d!125629 (=> res!693899 e!589425)))

(assert (=> d!125629 (= res!693899 (= (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125629 (= (arrayContainsKey!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) key!909 #b00000000000000000000000000000000) e!589425)))

(declare-fun b!1040936 () Bool)

(declare-fun e!589426 () Bool)

(assert (=> b!1040936 (= e!589425 e!589426)))

(declare-fun res!693900 () Bool)

(assert (=> b!1040936 (=> (not res!693900) (not e!589426))))

(assert (=> b!1040936 (= res!693900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))))))))

(declare-fun b!1040937 () Bool)

(assert (=> b!1040937 (= e!589426 (arrayContainsKey!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125629 (not res!693899)) b!1040936))

(assert (= (and b!1040936 res!693900) b!1040937))

(assert (=> d!125629 m!959895))

(declare-fun m!959955 () Bool)

(assert (=> b!1040937 m!959955))

(assert (=> b!1040797 d!125629))

(assert (=> b!1040794 d!125615))

(assert (=> b!1040841 d!125585))

(declare-fun d!125631 () Bool)

(assert (=> d!125631 (= (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542))) (and (not (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040825 d!125631))

(declare-fun b!1040938 () Bool)

(declare-fun e!589429 () Bool)

(declare-fun call!44071 () Bool)

(assert (=> b!1040938 (= e!589429 call!44071)))

(declare-fun bm!44068 () Bool)

(assert (=> bm!44068 (= call!44071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040939 () Bool)

(declare-fun e!589428 () Bool)

(declare-fun e!589427 () Bool)

(assert (=> b!1040939 (= e!589428 e!589427)))

(declare-fun c!105549 () Bool)

(assert (=> b!1040939 (= c!105549 (validKeyInArray!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040940 () Bool)

(assert (=> b!1040940 (= e!589427 e!589429)))

(declare-fun lt!458649 () (_ BitVec 64))

(assert (=> b!1040940 (= lt!458649 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458651 () Unit!33907)

(assert (=> b!1040940 (= lt!458651 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11570 thiss!1427) lt!458649 #b00000000000000000000000000000000))))

(assert (=> b!1040940 (arrayContainsKey!0 (_keys!11570 thiss!1427) lt!458649 #b00000000000000000000000000000000)))

(declare-fun lt!458650 () Unit!33907)

(assert (=> b!1040940 (= lt!458650 lt!458651)))

(declare-fun res!693902 () Bool)

(assert (=> b!1040940 (= res!693902 (= (seekEntryOrOpen!0 (select (arr!31548 (_keys!11570 thiss!1427)) #b00000000000000000000000000000000) (_keys!11570 thiss!1427) (mask!30350 thiss!1427)) (Found!9798 #b00000000000000000000000000000000)))))

(assert (=> b!1040940 (=> (not res!693902) (not e!589429))))

(declare-fun b!1040941 () Bool)

(assert (=> b!1040941 (= e!589427 call!44071)))

(declare-fun d!125633 () Bool)

(declare-fun res!693901 () Bool)

(assert (=> d!125633 (=> res!693901 e!589428)))

(assert (=> d!125633 (= res!693901 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))))))

(assert (=> d!125633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)) e!589428)))

(assert (= (and d!125633 (not res!693901)) b!1040939))

(assert (= (and b!1040939 c!105549) b!1040940))

(assert (= (and b!1040939 (not c!105549)) b!1040941))

(assert (= (and b!1040940 res!693902) b!1040938))

(assert (= (or b!1040938 b!1040941) bm!44068))

(declare-fun m!959957 () Bool)

(assert (=> bm!44068 m!959957))

(assert (=> b!1040939 m!959865))

(assert (=> b!1040939 m!959865))

(assert (=> b!1040939 m!959867))

(assert (=> b!1040940 m!959865))

(declare-fun m!959959 () Bool)

(assert (=> b!1040940 m!959959))

(declare-fun m!959961 () Bool)

(assert (=> b!1040940 m!959961))

(assert (=> b!1040940 m!959865))

(declare-fun m!959963 () Bool)

(assert (=> b!1040940 m!959963))

(assert (=> b!1040842 d!125633))

(declare-fun d!125635 () Bool)

(assert (=> d!125635 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1040826 d!125635))

(declare-fun b!1040942 () Bool)

(declare-fun e!589432 () Bool)

(declare-fun e!589433 () Bool)

(assert (=> b!1040942 (= e!589432 e!589433)))

(declare-fun c!105550 () Bool)

(assert (=> b!1040942 (= c!105550 (validKeyInArray!0 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1040943 () Bool)

(declare-fun e!589431 () Bool)

(assert (=> b!1040943 (= e!589431 (contains!6032 (ite c!105510 (Cons!21995 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) Nil!21996) Nil!21996) (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1040944 () Bool)

(declare-fun call!44072 () Bool)

(assert (=> b!1040944 (= e!589433 call!44072)))

(declare-fun b!1040945 () Bool)

(assert (=> b!1040945 (= e!589433 call!44072)))

(declare-fun bm!44069 () Bool)

(assert (=> bm!44069 (= call!44072 (arrayNoDuplicates!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105550 (Cons!21995 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105510 (Cons!21995 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) Nil!21996) Nil!21996)) (ite c!105510 (Cons!21995 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) Nil!21996) Nil!21996))))))

(declare-fun b!1040946 () Bool)

(declare-fun e!589430 () Bool)

(assert (=> b!1040946 (= e!589430 e!589432)))

(declare-fun res!693904 () Bool)

(assert (=> b!1040946 (=> (not res!693904) (not e!589432))))

(assert (=> b!1040946 (= res!693904 (not e!589431))))

(declare-fun res!693903 () Bool)

(assert (=> b!1040946 (=> (not res!693903) (not e!589431))))

(assert (=> b!1040946 (= res!693903 (validKeyInArray!0 (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125637 () Bool)

(declare-fun res!693905 () Bool)

(assert (=> d!125637 (=> res!693905 e!589430)))

(assert (=> d!125637 (= res!693905 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 lt!458540)))))

(assert (=> d!125637 (= (arrayNoDuplicates!0 lt!458540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105510 (Cons!21995 (select (arr!31548 lt!458540) #b00000000000000000000000000000000) Nil!21996) Nil!21996)) e!589430)))

(assert (= (and d!125637 (not res!693905)) b!1040946))

(assert (= (and b!1040946 res!693903) b!1040943))

(assert (= (and b!1040946 res!693904) b!1040942))

(assert (= (and b!1040942 c!105550) b!1040945))

(assert (= (and b!1040942 (not c!105550)) b!1040944))

(assert (= (or b!1040945 b!1040944) bm!44069))

(assert (=> b!1040942 m!959909))

(assert (=> b!1040942 m!959909))

(assert (=> b!1040942 m!959911))

(assert (=> b!1040943 m!959909))

(assert (=> b!1040943 m!959909))

(declare-fun m!959965 () Bool)

(assert (=> b!1040943 m!959965))

(assert (=> bm!44069 m!959909))

(declare-fun m!959967 () Bool)

(assert (=> bm!44069 m!959967))

(assert (=> b!1040946 m!959909))

(assert (=> b!1040946 m!959909))

(assert (=> b!1040946 m!959911))

(assert (=> bm!44054 d!125637))

(assert (=> b!1040779 d!125615))

(declare-fun d!125639 () Bool)

(declare-fun res!693906 () Bool)

(declare-fun e!589434 () Bool)

(assert (=> d!125639 (=> res!693906 e!589434)))

(assert (=> d!125639 (= res!693906 (= (select (arr!31548 lt!458540) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125639 (= (arrayContainsKey!0 lt!458540 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!589434)))

(declare-fun b!1040947 () Bool)

(declare-fun e!589435 () Bool)

(assert (=> b!1040947 (= e!589434 e!589435)))

(declare-fun res!693907 () Bool)

(assert (=> b!1040947 (=> (not res!693907) (not e!589435))))

(assert (=> b!1040947 (= res!693907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32081 lt!458540)))))

(declare-fun b!1040948 () Bool)

(assert (=> b!1040948 (= e!589435 (arrayContainsKey!0 lt!458540 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125639 (not res!693906)) b!1040947))

(assert (= (and b!1040947 res!693907) b!1040948))

(assert (=> d!125639 m!959909))

(declare-fun m!959969 () Bool)

(assert (=> b!1040948 m!959969))

(assert (=> b!1040834 d!125639))

(declare-fun b!1040949 () Bool)

(declare-fun e!589438 () Bool)

(declare-fun e!589439 () Bool)

(assert (=> b!1040949 (= e!589438 e!589439)))

(declare-fun c!105551 () Bool)

(assert (=> b!1040949 (= c!105551 (validKeyInArray!0 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1040950 () Bool)

(declare-fun e!589437 () Bool)

(assert (=> b!1040950 (= e!589437 (contains!6032 Nil!21996 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1040951 () Bool)

(declare-fun call!44073 () Bool)

(assert (=> b!1040951 (= e!589439 call!44073)))

(declare-fun b!1040952 () Bool)

(assert (=> b!1040952 (= e!589439 call!44073)))

(declare-fun bm!44070 () Bool)

(assert (=> bm!44070 (= call!44073 (arrayNoDuplicates!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105551 (Cons!21995 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000) Nil!21996) Nil!21996)))))

(declare-fun b!1040953 () Bool)

(declare-fun e!589436 () Bool)

(assert (=> b!1040953 (= e!589436 e!589438)))

(declare-fun res!693909 () Bool)

(assert (=> b!1040953 (=> (not res!693909) (not e!589438))))

(assert (=> b!1040953 (= res!693909 (not e!589437))))

(declare-fun res!693908 () Bool)

(assert (=> b!1040953 (=> (not res!693908) (not e!589437))))

(assert (=> b!1040953 (= res!693908 (validKeyInArray!0 (select (arr!31548 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125641 () Bool)

(declare-fun res!693910 () Bool)

(assert (=> d!125641 (=> res!693910 e!589436)))

(assert (=> d!125641 (= res!693910 (bvsge #b00000000000000000000000000000000 (size!32081 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))))))))

(assert (=> d!125641 (= (arrayNoDuplicates!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 Nil!21996) e!589436)))

(assert (= (and d!125641 (not res!693910)) b!1040953))

(assert (= (and b!1040953 res!693908) b!1040950))

(assert (= (and b!1040953 res!693909) b!1040949))

(assert (= (and b!1040949 c!105551) b!1040952))

(assert (= (and b!1040949 (not c!105551)) b!1040951))

(assert (= (or b!1040952 b!1040951) bm!44070))

(assert (=> b!1040949 m!959895))

(assert (=> b!1040949 m!959895))

(assert (=> b!1040949 m!959897))

(assert (=> b!1040950 m!959895))

(assert (=> b!1040950 m!959895))

(declare-fun m!959971 () Bool)

(assert (=> b!1040950 m!959971))

(assert (=> bm!44070 m!959895))

(declare-fun m!959973 () Bool)

(assert (=> bm!44070 m!959973))

(assert (=> b!1040953 m!959895))

(assert (=> b!1040953 m!959895))

(assert (=> b!1040953 m!959897))

(assert (=> b!1040800 d!125641))

(declare-fun d!125643 () Bool)

(assert (=> d!125643 (= (arrayCountValidKeys!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11570 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125643 true))

(declare-fun _$79!23 () Unit!33907)

(assert (=> d!125643 (= (choose!82 (_keys!11570 thiss!1427) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!23)))

(declare-fun bs!30421 () Bool)

(assert (= bs!30421 d!125643))

(assert (=> bs!30421 m!959735))

(assert (=> bs!30421 m!959869))

(assert (=> bs!30421 m!959739))

(assert (=> d!125587 d!125643))

(assert (=> b!1040775 d!125615))

(declare-fun d!125645 () Bool)

(declare-fun lt!458657 () SeekEntryResult!9798)

(assert (=> d!125645 (and (or ((_ is Undefined!9798) lt!458657) (not ((_ is Found!9798) lt!458657)) (and (bvsge (index!41564 lt!458657) #b00000000000000000000000000000000) (bvslt (index!41564 lt!458657) (size!32081 (_keys!11570 thiss!1427))))) (or ((_ is Undefined!9798) lt!458657) ((_ is Found!9798) lt!458657) (not ((_ is MissingVacant!9798) lt!458657)) (not (= (index!41566 lt!458657) (index!41565 lt!458589))) (and (bvsge (index!41566 lt!458657) #b00000000000000000000000000000000) (bvslt (index!41566 lt!458657) (size!32081 (_keys!11570 thiss!1427))))) (or ((_ is Undefined!9798) lt!458657) (ite ((_ is Found!9798) lt!458657) (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458657)) key!909) (and ((_ is MissingVacant!9798) lt!458657) (= (index!41566 lt!458657) (index!41565 lt!458589)) (= (select (arr!31548 (_keys!11570 thiss!1427)) (index!41566 lt!458657)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!589447 () SeekEntryResult!9798)

(assert (=> d!125645 (= lt!458657 e!589447)))

(declare-fun c!105560 () Bool)

(assert (=> d!125645 (= c!105560 (bvsge (x!92915 lt!458589) #b01111111111111111111111111111110))))

(declare-fun lt!458656 () (_ BitVec 64))

(assert (=> d!125645 (= lt!458656 (select (arr!31548 (_keys!11570 thiss!1427)) (index!41565 lt!458589)))))

(assert (=> d!125645 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125645 (= (seekKeyOrZeroReturnVacant!0 (x!92915 lt!458589) (index!41565 lt!458589) (index!41565 lt!458589) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)) lt!458657)))

(declare-fun e!589448 () SeekEntryResult!9798)

(declare-fun b!1040966 () Bool)

(assert (=> b!1040966 (= e!589448 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92915 lt!458589) #b00000000000000000000000000000001) (nextIndex!0 (index!41565 lt!458589) (x!92915 lt!458589) (mask!30350 thiss!1427)) (index!41565 lt!458589) key!909 (_keys!11570 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040967 () Bool)

(declare-fun c!105559 () Bool)

(assert (=> b!1040967 (= c!105559 (= lt!458656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589446 () SeekEntryResult!9798)

(assert (=> b!1040967 (= e!589446 e!589448)))

(declare-fun b!1040968 () Bool)

(assert (=> b!1040968 (= e!589446 (Found!9798 (index!41565 lt!458589)))))

(declare-fun b!1040969 () Bool)

(assert (=> b!1040969 (= e!589447 Undefined!9798)))

(declare-fun b!1040970 () Bool)

(assert (=> b!1040970 (= e!589448 (MissingVacant!9798 (index!41565 lt!458589)))))

(declare-fun b!1040971 () Bool)

(assert (=> b!1040971 (= e!589447 e!589446)))

(declare-fun c!105558 () Bool)

(assert (=> b!1040971 (= c!105558 (= lt!458656 key!909))))

(assert (= (and d!125645 c!105560) b!1040969))

(assert (= (and d!125645 (not c!105560)) b!1040971))

(assert (= (and b!1040971 c!105558) b!1040968))

(assert (= (and b!1040971 (not c!105558)) b!1040967))

(assert (= (and b!1040967 c!105559) b!1040970))

(assert (= (and b!1040967 (not c!105559)) b!1040966))

(declare-fun m!959975 () Bool)

(assert (=> d!125645 m!959975))

(declare-fun m!959977 () Bool)

(assert (=> d!125645 m!959977))

(assert (=> d!125645 m!959825))

(assert (=> d!125645 m!959731))

(declare-fun m!959979 () Bool)

(assert (=> b!1040966 m!959979))

(assert (=> b!1040966 m!959979))

(declare-fun m!959981 () Bool)

(assert (=> b!1040966 m!959981))

(assert (=> b!1040759 d!125645))

(declare-fun d!125647 () Bool)

(declare-fun lt!458660 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!520 (List!21999) (InoxSet (_ BitVec 64)))

(assert (=> d!125647 (= lt!458660 (select (content!520 Nil!21996) (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun e!589453 () Bool)

(assert (=> d!125647 (= lt!458660 e!589453)))

(declare-fun res!693916 () Bool)

(assert (=> d!125647 (=> (not res!693916) (not e!589453))))

(assert (=> d!125647 (= res!693916 ((_ is Cons!21995) Nil!21996))))

(assert (=> d!125647 (= (contains!6032 Nil!21996 (select (arr!31548 lt!458540) #b00000000000000000000000000000000)) lt!458660)))

(declare-fun b!1040976 () Bool)

(declare-fun e!589454 () Bool)

(assert (=> b!1040976 (= e!589453 e!589454)))

(declare-fun res!693915 () Bool)

(assert (=> b!1040976 (=> res!693915 e!589454)))

(assert (=> b!1040976 (= res!693915 (= (h!23199 Nil!21996) (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(declare-fun b!1040977 () Bool)

(assert (=> b!1040977 (= e!589454 (contains!6032 (t!31204 Nil!21996) (select (arr!31548 lt!458540) #b00000000000000000000000000000000)))))

(assert (= (and d!125647 res!693916) b!1040976))

(assert (= (and b!1040976 (not res!693915)) b!1040977))

(declare-fun m!959983 () Bool)

(assert (=> d!125647 m!959983))

(assert (=> d!125647 m!959833))

(declare-fun m!959985 () Bool)

(assert (=> d!125647 m!959985))

(assert (=> b!1040977 m!959833))

(declare-fun m!959987 () Bool)

(assert (=> b!1040977 m!959987))

(assert (=> b!1040776 d!125647))

(declare-fun d!125649 () Bool)

(assert (=> d!125649 (arrayNoDuplicates!0 (array!65572 (store (arr!31548 (_keys!11570 thiss!1427)) (index!41564 lt!458542) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11570 thiss!1427))) #b00000000000000000000000000000000 Nil!21996)))

(assert (=> d!125649 true))

(declare-fun _$66!47 () Unit!33907)

(assert (=> d!125649 (= (choose!53 (_keys!11570 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!458542) #b00000000000000000000000000000000 Nil!21996) _$66!47)))

(declare-fun bs!30422 () Bool)

(assert (= bs!30422 d!125649))

(assert (=> bs!30422 m!959735))

(assert (=> bs!30422 m!959853))

(assert (=> d!125581 d!125649))

(declare-fun b!1040979 () Bool)

(declare-fun e!589456 () Bool)

(assert (=> b!1040979 (= e!589456 tp_is_empty!24745)))

(declare-fun mapNonEmpty!38714 () Bool)

(declare-fun mapRes!38714 () Bool)

(declare-fun tp!74295 () Bool)

(declare-fun e!589455 () Bool)

(assert (=> mapNonEmpty!38714 (= mapRes!38714 (and tp!74295 e!589455))))

(declare-fun mapValue!38714 () ValueCell!11669)

(declare-fun mapRest!38714 () (Array (_ BitVec 32) ValueCell!11669))

(declare-fun mapKey!38714 () (_ BitVec 32))

(assert (=> mapNonEmpty!38714 (= mapRest!38713 (store mapRest!38714 mapKey!38714 mapValue!38714))))

(declare-fun condMapEmpty!38714 () Bool)

(declare-fun mapDefault!38714 () ValueCell!11669)

(assert (=> mapNonEmpty!38713 (= condMapEmpty!38714 (= mapRest!38713 ((as const (Array (_ BitVec 32) ValueCell!11669)) mapDefault!38714)))))

(assert (=> mapNonEmpty!38713 (= tp!74294 (and e!589456 mapRes!38714))))

(declare-fun b!1040978 () Bool)

(assert (=> b!1040978 (= e!589455 tp_is_empty!24745)))

(declare-fun mapIsEmpty!38714 () Bool)

(assert (=> mapIsEmpty!38714 mapRes!38714))

(assert (= (and mapNonEmpty!38713 condMapEmpty!38714) mapIsEmpty!38714))

(assert (= (and mapNonEmpty!38713 (not condMapEmpty!38714)) mapNonEmpty!38714))

(assert (= (and mapNonEmpty!38714 ((_ is ValueCellFull!11669) mapValue!38714)) b!1040978))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11669) mapDefault!38714)) b!1040979))

(declare-fun m!959989 () Bool)

(assert (=> mapNonEmpty!38714 m!959989))

(check-sat (not b!1040881) (not d!125617) (not d!125645) (not bm!44062) (not b!1040889) (not bm!44065) (not b!1040948) (not b!1040946) (not b!1040939) (not b!1040856) (not bm!44069) (not b!1040921) (not b!1040977) b_and!33531 (not b!1040933) (not d!125605) (not d!125621) (not b!1040953) (not b!1040895) (not b!1040916) (not d!125647) (not b!1040890) (not b!1040949) (not b!1040852) (not bm!44066) (not b!1040922) (not bm!44068) (not b_next!21025) (not b!1040950) (not bm!44070) (not bm!44063) (not d!125627) (not b!1040943) (not d!125643) (not b!1040899) (not bm!44067) (not b!1040901) (not d!125649) (not b!1040934) (not bm!44064) tp_is_empty!24745 (not b!1040966) (not mapNonEmpty!38714) (not b!1040853) (not b!1040937) (not d!125603) (not b!1040860) (not b!1040942) (not d!125597) (not b!1040940))
(check-sat b_and!33531 (not b_next!21025))
