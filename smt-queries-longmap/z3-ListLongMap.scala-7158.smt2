; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91116 () Bool)

(assert start!91116)

(declare-fun b!1040153 () Bool)

(declare-fun b_free!21003 () Bool)

(declare-fun b_next!21003 () Bool)

(assert (=> b!1040153 (= b_free!21003 (not b_next!21003))))

(declare-fun tp!74200 () Bool)

(declare-fun b_and!33535 () Bool)

(assert (=> b!1040153 (= tp!74200 b_and!33535)))

(declare-fun res!693522 () Bool)

(declare-fun e!588837 () Bool)

(assert (=> start!91116 (=> (not res!693522) (not e!588837))))

(declare-datatypes ((V!37837 0))(
  ( (V!37838 (val!12412 Int)) )
))
(declare-datatypes ((ValueCell!11658 0))(
  ( (ValueCellFull!11658 (v!14999 V!37837)) (EmptyCell!11658) )
))
(declare-datatypes ((array!65580 0))(
  ( (array!65581 (arr!31557 (Array (_ BitVec 32) (_ BitVec 64))) (size!32088 (_ BitVec 32))) )
))
(declare-datatypes ((array!65582 0))(
  ( (array!65583 (arr!31558 (Array (_ BitVec 32) ValueCell!11658)) (size!32089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5910 0))(
  ( (LongMapFixedSize!5911 (defaultEntry!6337 Int) (mask!30323 (_ BitVec 32)) (extraKeys!6065 (_ BitVec 32)) (zeroValue!6171 V!37837) (minValue!6171 V!37837) (_size!3010 (_ BitVec 32)) (_keys!11555 array!65580) (_values!6360 array!65582) (_vacant!3010 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5910)

(declare-fun valid!2220 (LongMapFixedSize!5910) Bool)

(assert (=> start!91116 (= res!693522 (valid!2220 thiss!1427))))

(assert (=> start!91116 e!588837))

(declare-fun e!588838 () Bool)

(assert (=> start!91116 e!588838))

(assert (=> start!91116 true))

(declare-fun mapNonEmpty!38659 () Bool)

(declare-fun mapRes!38659 () Bool)

(declare-fun tp!74201 () Bool)

(declare-fun e!588842 () Bool)

(assert (=> mapNonEmpty!38659 (= mapRes!38659 (and tp!74201 e!588842))))

(declare-fun mapValue!38659 () ValueCell!11658)

(declare-fun mapKey!38659 () (_ BitVec 32))

(declare-fun mapRest!38659 () (Array (_ BitVec 32) ValueCell!11658))

(assert (=> mapNonEmpty!38659 (= (arr!31558 (_values!6360 thiss!1427)) (store mapRest!38659 mapKey!38659 mapValue!38659))))

(declare-fun b!1040152 () Bool)

(declare-fun tp_is_empty!24723 () Bool)

(assert (=> b!1040152 (= e!588842 tp_is_empty!24723)))

(declare-fun e!588841 () Bool)

(declare-fun array_inv!24389 (array!65580) Bool)

(declare-fun array_inv!24390 (array!65582) Bool)

(assert (=> b!1040153 (= e!588838 (and tp!74200 tp_is_empty!24723 (array_inv!24389 (_keys!11555 thiss!1427)) (array_inv!24390 (_values!6360 thiss!1427)) e!588841))))

(declare-fun mapIsEmpty!38659 () Bool)

(assert (=> mapIsEmpty!38659 mapRes!38659))

(declare-fun b!1040154 () Bool)

(declare-fun res!693521 () Bool)

(assert (=> b!1040154 (=> (not res!693521) (not e!588837))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040154 (= res!693521 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040155 () Bool)

(declare-fun e!588836 () Bool)

(declare-datatypes ((List!21955 0))(
  ( (Nil!21952) (Cons!21951 (h!23155 (_ BitVec 64)) (t!31169 List!21955)) )
))
(declare-fun arrayNoDuplicates!0 (array!65580 (_ BitVec 32) List!21955) Bool)

(assert (=> b!1040155 (= e!588836 (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21952))))

(declare-fun b!1040156 () Bool)

(declare-fun e!588840 () Bool)

(assert (=> b!1040156 (= e!588837 e!588840)))

(declare-fun res!693523 () Bool)

(assert (=> b!1040156 (=> (not res!693523) (not e!588840))))

(declare-datatypes ((SeekEntryResult!9793 0))(
  ( (MissingZero!9793 (index!41543 (_ BitVec 32))) (Found!9793 (index!41544 (_ BitVec 32))) (Intermediate!9793 (undefined!10605 Bool) (index!41545 (_ BitVec 32)) (x!92849 (_ BitVec 32))) (Undefined!9793) (MissingVacant!9793 (index!41546 (_ BitVec 32))) )
))
(declare-fun lt!458422 () SeekEntryResult!9793)

(get-info :version)

(assert (=> b!1040156 (= res!693523 ((_ is Found!9793) lt!458422))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65580 (_ BitVec 32)) SeekEntryResult!9793)

(assert (=> b!1040156 (= lt!458422 (seekEntry!0 key!909 (_keys!11555 thiss!1427) (mask!30323 thiss!1427)))))

(declare-fun b!1040157 () Bool)

(declare-fun e!588839 () Bool)

(assert (=> b!1040157 (= e!588841 (and e!588839 mapRes!38659))))

(declare-fun condMapEmpty!38659 () Bool)

(declare-fun mapDefault!38659 () ValueCell!11658)

(assert (=> b!1040157 (= condMapEmpty!38659 (= (arr!31558 (_values!6360 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11658)) mapDefault!38659)))))

(declare-fun b!1040158 () Bool)

(assert (=> b!1040158 (= e!588840 (not e!588836))))

(declare-fun res!693520 () Bool)

(assert (=> b!1040158 (=> res!693520 e!588836)))

(assert (=> b!1040158 (= res!693520 (or (bvslt (index!41544 lt!458422) #b00000000000000000000000000000000) (bvsge (index!41544 lt!458422) (size!32088 (_keys!11555 thiss!1427))) (bvsge (size!32088 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458423 () array!65580)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65580 (_ BitVec 32)) Bool)

(assert (=> b!1040158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458423 (mask!30323 thiss!1427))))

(declare-datatypes ((Unit!34011 0))(
  ( (Unit!34012) )
))
(declare-fun lt!458426 () Unit!34011)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65580 (_ BitVec 32) (_ BitVec 32)) Unit!34011)

(assert (=> b!1040158 (= lt!458426 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11555 thiss!1427) (index!41544 lt!458422) (mask!30323 thiss!1427)))))

(assert (=> b!1040158 (arrayNoDuplicates!0 lt!458423 #b00000000000000000000000000000000 Nil!21952)))

(declare-fun lt!458425 () Unit!34011)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21955) Unit!34011)

(assert (=> b!1040158 (= lt!458425 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41544 lt!458422) #b00000000000000000000000000000000 Nil!21952))))

(declare-fun arrayCountValidKeys!0 (array!65580 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040158 (= (arrayCountValidKeys!0 lt!458423 #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040158 (= lt!458423 (array!65581 (store (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11555 thiss!1427))))))

(declare-fun lt!458424 () Unit!34011)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65580 (_ BitVec 32) (_ BitVec 64)) Unit!34011)

(assert (=> b!1040158 (= lt!458424 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11555 thiss!1427) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040159 () Bool)

(assert (=> b!1040159 (= e!588839 tp_is_empty!24723)))

(assert (= (and start!91116 res!693522) b!1040154))

(assert (= (and b!1040154 res!693521) b!1040156))

(assert (= (and b!1040156 res!693523) b!1040158))

(assert (= (and b!1040158 (not res!693520)) b!1040155))

(assert (= (and b!1040157 condMapEmpty!38659) mapIsEmpty!38659))

(assert (= (and b!1040157 (not condMapEmpty!38659)) mapNonEmpty!38659))

(assert (= (and mapNonEmpty!38659 ((_ is ValueCellFull!11658) mapValue!38659)) b!1040152))

(assert (= (and b!1040157 ((_ is ValueCellFull!11658) mapDefault!38659)) b!1040159))

(assert (= b!1040153 b!1040157))

(assert (= start!91116 b!1040153))

(declare-fun m!959753 () Bool)

(assert (=> b!1040155 m!959753))

(declare-fun m!959755 () Bool)

(assert (=> start!91116 m!959755))

(declare-fun m!959757 () Bool)

(assert (=> b!1040153 m!959757))

(declare-fun m!959759 () Bool)

(assert (=> b!1040153 m!959759))

(declare-fun m!959761 () Bool)

(assert (=> b!1040156 m!959761))

(declare-fun m!959763 () Bool)

(assert (=> mapNonEmpty!38659 m!959763))

(declare-fun m!959765 () Bool)

(assert (=> b!1040158 m!959765))

(declare-fun m!959767 () Bool)

(assert (=> b!1040158 m!959767))

(declare-fun m!959769 () Bool)

(assert (=> b!1040158 m!959769))

(declare-fun m!959771 () Bool)

(assert (=> b!1040158 m!959771))

(declare-fun m!959773 () Bool)

(assert (=> b!1040158 m!959773))

(declare-fun m!959775 () Bool)

(assert (=> b!1040158 m!959775))

(declare-fun m!959777 () Bool)

(assert (=> b!1040158 m!959777))

(declare-fun m!959779 () Bool)

(assert (=> b!1040158 m!959779))

(check-sat (not b!1040156) (not b!1040153) tp_is_empty!24723 (not mapNonEmpty!38659) (not b_next!21003) (not start!91116) (not b!1040158) b_and!33535 (not b!1040155))
(check-sat b_and!33535 (not b_next!21003))
(get-model)

(declare-fun b!1040196 () Bool)

(declare-fun e!588874 () SeekEntryResult!9793)

(declare-fun lt!458452 () SeekEntryResult!9793)

(assert (=> b!1040196 (= e!588874 (MissingZero!9793 (index!41545 lt!458452)))))

(declare-fun b!1040197 () Bool)

(declare-fun e!588875 () SeekEntryResult!9793)

(assert (=> b!1040197 (= e!588875 (Found!9793 (index!41545 lt!458452)))))

(declare-fun b!1040198 () Bool)

(declare-fun e!588873 () SeekEntryResult!9793)

(assert (=> b!1040198 (= e!588873 Undefined!9793)))

(declare-fun b!1040199 () Bool)

(declare-fun c!105450 () Bool)

(declare-fun lt!458453 () (_ BitVec 64))

(assert (=> b!1040199 (= c!105450 (= lt!458453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040199 (= e!588875 e!588874)))

(declare-fun d!125607 () Bool)

(declare-fun lt!458451 () SeekEntryResult!9793)

(assert (=> d!125607 (and (or ((_ is MissingVacant!9793) lt!458451) (not ((_ is Found!9793) lt!458451)) (and (bvsge (index!41544 lt!458451) #b00000000000000000000000000000000) (bvslt (index!41544 lt!458451) (size!32088 (_keys!11555 thiss!1427))))) (not ((_ is MissingVacant!9793) lt!458451)) (or (not ((_ is Found!9793) lt!458451)) (= (select (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458451)) key!909)))))

(assert (=> d!125607 (= lt!458451 e!588873)))

(declare-fun c!105449 () Bool)

(assert (=> d!125607 (= c!105449 (and ((_ is Intermediate!9793) lt!458452) (undefined!10605 lt!458452)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65580 (_ BitVec 32)) SeekEntryResult!9793)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125607 (= lt!458452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30323 thiss!1427)) key!909 (_keys!11555 thiss!1427) (mask!30323 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125607 (validMask!0 (mask!30323 thiss!1427))))

(assert (=> d!125607 (= (seekEntry!0 key!909 (_keys!11555 thiss!1427) (mask!30323 thiss!1427)) lt!458451)))

(declare-fun b!1040200 () Bool)

(declare-fun lt!458450 () SeekEntryResult!9793)

(assert (=> b!1040200 (= e!588874 (ite ((_ is MissingVacant!9793) lt!458450) (MissingZero!9793 (index!41546 lt!458450)) lt!458450))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65580 (_ BitVec 32)) SeekEntryResult!9793)

(assert (=> b!1040200 (= lt!458450 (seekKeyOrZeroReturnVacant!0 (x!92849 lt!458452) (index!41545 lt!458452) (index!41545 lt!458452) key!909 (_keys!11555 thiss!1427) (mask!30323 thiss!1427)))))

(declare-fun b!1040201 () Bool)

(assert (=> b!1040201 (= e!588873 e!588875)))

(assert (=> b!1040201 (= lt!458453 (select (arr!31557 (_keys!11555 thiss!1427)) (index!41545 lt!458452)))))

(declare-fun c!105451 () Bool)

(assert (=> b!1040201 (= c!105451 (= lt!458453 key!909))))

(assert (= (and d!125607 c!105449) b!1040198))

(assert (= (and d!125607 (not c!105449)) b!1040201))

(assert (= (and b!1040201 c!105451) b!1040197))

(assert (= (and b!1040201 (not c!105451)) b!1040199))

(assert (= (and b!1040199 c!105450) b!1040196))

(assert (= (and b!1040199 (not c!105450)) b!1040200))

(declare-fun m!959809 () Bool)

(assert (=> d!125607 m!959809))

(declare-fun m!959811 () Bool)

(assert (=> d!125607 m!959811))

(assert (=> d!125607 m!959811))

(declare-fun m!959813 () Bool)

(assert (=> d!125607 m!959813))

(declare-fun m!959815 () Bool)

(assert (=> d!125607 m!959815))

(declare-fun m!959817 () Bool)

(assert (=> b!1040200 m!959817))

(declare-fun m!959819 () Bool)

(assert (=> b!1040201 m!959819))

(assert (=> b!1040156 d!125607))

(declare-fun bm!44034 () Bool)

(declare-fun call!44037 () Bool)

(declare-fun c!105454 () Bool)

(assert (=> bm!44034 (= call!44037 (arrayNoDuplicates!0 (_keys!11555 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105454 (Cons!21951 (select (arr!31557 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000) Nil!21952) Nil!21952)))))

(declare-fun b!1040212 () Bool)

(declare-fun e!588884 () Bool)

(assert (=> b!1040212 (= e!588884 call!44037)))

(declare-fun b!1040213 () Bool)

(declare-fun e!588886 () Bool)

(declare-fun e!588887 () Bool)

(assert (=> b!1040213 (= e!588886 e!588887)))

(declare-fun res!693542 () Bool)

(assert (=> b!1040213 (=> (not res!693542) (not e!588887))))

(declare-fun e!588885 () Bool)

(assert (=> b!1040213 (= res!693542 (not e!588885))))

(declare-fun res!693543 () Bool)

(assert (=> b!1040213 (=> (not res!693543) (not e!588885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040213 (= res!693543 (validKeyInArray!0 (select (arr!31557 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040214 () Bool)

(assert (=> b!1040214 (= e!588884 call!44037)))

(declare-fun b!1040215 () Bool)

(declare-fun contains!6048 (List!21955 (_ BitVec 64)) Bool)

(assert (=> b!1040215 (= e!588885 (contains!6048 Nil!21952 (select (arr!31557 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125609 () Bool)

(declare-fun res!693544 () Bool)

(assert (=> d!125609 (=> res!693544 e!588886)))

(assert (=> d!125609 (= res!693544 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))))))

(assert (=> d!125609 (= (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21952) e!588886)))

(declare-fun b!1040216 () Bool)

(assert (=> b!1040216 (= e!588887 e!588884)))

(assert (=> b!1040216 (= c!105454 (validKeyInArray!0 (select (arr!31557 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125609 (not res!693544)) b!1040213))

(assert (= (and b!1040213 res!693543) b!1040215))

(assert (= (and b!1040213 res!693542) b!1040216))

(assert (= (and b!1040216 c!105454) b!1040214))

(assert (= (and b!1040216 (not c!105454)) b!1040212))

(assert (= (or b!1040214 b!1040212) bm!44034))

(declare-fun m!959821 () Bool)

(assert (=> bm!44034 m!959821))

(declare-fun m!959823 () Bool)

(assert (=> bm!44034 m!959823))

(assert (=> b!1040213 m!959821))

(assert (=> b!1040213 m!959821))

(declare-fun m!959825 () Bool)

(assert (=> b!1040213 m!959825))

(assert (=> b!1040215 m!959821))

(assert (=> b!1040215 m!959821))

(declare-fun m!959827 () Bool)

(assert (=> b!1040215 m!959827))

(assert (=> b!1040216 m!959821))

(assert (=> b!1040216 m!959821))

(assert (=> b!1040216 m!959825))

(assert (=> b!1040155 d!125609))

(declare-fun d!125611 () Bool)

(declare-fun res!693551 () Bool)

(declare-fun e!588890 () Bool)

(assert (=> d!125611 (=> (not res!693551) (not e!588890))))

(declare-fun simpleValid!432 (LongMapFixedSize!5910) Bool)

(assert (=> d!125611 (= res!693551 (simpleValid!432 thiss!1427))))

(assert (=> d!125611 (= (valid!2220 thiss!1427) e!588890)))

(declare-fun b!1040223 () Bool)

(declare-fun res!693552 () Bool)

(assert (=> b!1040223 (=> (not res!693552) (not e!588890))))

(assert (=> b!1040223 (= res!693552 (= (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) (_size!3010 thiss!1427)))))

(declare-fun b!1040224 () Bool)

(declare-fun res!693553 () Bool)

(assert (=> b!1040224 (=> (not res!693553) (not e!588890))))

(assert (=> b!1040224 (= res!693553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11555 thiss!1427) (mask!30323 thiss!1427)))))

(declare-fun b!1040225 () Bool)

(assert (=> b!1040225 (= e!588890 (arrayNoDuplicates!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 Nil!21952))))

(assert (= (and d!125611 res!693551) b!1040223))

(assert (= (and b!1040223 res!693552) b!1040224))

(assert (= (and b!1040224 res!693553) b!1040225))

(declare-fun m!959829 () Bool)

(assert (=> d!125611 m!959829))

(assert (=> b!1040223 m!959779))

(declare-fun m!959831 () Bool)

(assert (=> b!1040224 m!959831))

(assert (=> b!1040225 m!959753))

(assert (=> start!91116 d!125611))

(declare-fun d!125613 () Bool)

(assert (=> d!125613 (= (array_inv!24389 (_keys!11555 thiss!1427)) (bvsge (size!32088 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040153 d!125613))

(declare-fun d!125615 () Bool)

(assert (=> d!125615 (= (array_inv!24390 (_values!6360 thiss!1427)) (bvsge (size!32089 (_values!6360 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040153 d!125615))

(declare-fun d!125617 () Bool)

(declare-fun e!588893 () Bool)

(assert (=> d!125617 e!588893))

(declare-fun res!693556 () Bool)

(assert (=> d!125617 (=> (not res!693556) (not e!588893))))

(assert (=> d!125617 (= res!693556 (and (bvsge (index!41544 lt!458422) #b00000000000000000000000000000000) (bvslt (index!41544 lt!458422) (size!32088 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458456 () Unit!34011)

(declare-fun choose!53 (array!65580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21955) Unit!34011)

(assert (=> d!125617 (= lt!458456 (choose!53 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41544 lt!458422) #b00000000000000000000000000000000 Nil!21952))))

(assert (=> d!125617 (bvslt (size!32088 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125617 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11555 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41544 lt!458422) #b00000000000000000000000000000000 Nil!21952) lt!458456)))

(declare-fun b!1040228 () Bool)

(assert (=> b!1040228 (= e!588893 (arrayNoDuplicates!0 (array!65581 (store (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11555 thiss!1427))) #b00000000000000000000000000000000 Nil!21952))))

(assert (= (and d!125617 res!693556) b!1040228))

(declare-fun m!959833 () Bool)

(assert (=> d!125617 m!959833))

(assert (=> b!1040228 m!959767))

(declare-fun m!959835 () Bool)

(assert (=> b!1040228 m!959835))

(assert (=> b!1040158 d!125617))

(declare-fun d!125619 () Bool)

(declare-fun e!588899 () Bool)

(assert (=> d!125619 e!588899))

(declare-fun res!693565 () Bool)

(assert (=> d!125619 (=> (not res!693565) (not e!588899))))

(assert (=> d!125619 (= res!693565 (and (bvsge (index!41544 lt!458422) #b00000000000000000000000000000000) (bvslt (index!41544 lt!458422) (size!32088 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458459 () Unit!34011)

(declare-fun choose!82 (array!65580 (_ BitVec 32) (_ BitVec 64)) Unit!34011)

(assert (=> d!125619 (= lt!458459 (choose!82 (_keys!11555 thiss!1427) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588898 () Bool)

(assert (=> d!125619 e!588898))

(declare-fun res!693567 () Bool)

(assert (=> d!125619 (=> (not res!693567) (not e!588898))))

(assert (=> d!125619 (= res!693567 (and (bvsge (index!41544 lt!458422) #b00000000000000000000000000000000) (bvslt (index!41544 lt!458422) (size!32088 (_keys!11555 thiss!1427)))))))

(assert (=> d!125619 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11555 thiss!1427) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458459)))

(declare-fun b!1040239 () Bool)

(assert (=> b!1040239 (= e!588898 (bvslt (size!32088 (_keys!11555 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040237 () Bool)

(declare-fun res!693566 () Bool)

(assert (=> b!1040237 (=> (not res!693566) (not e!588898))))

(assert (=> b!1040237 (= res!693566 (validKeyInArray!0 (select (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458422))))))

(declare-fun b!1040240 () Bool)

(assert (=> b!1040240 (= e!588899 (= (arrayCountValidKeys!0 (array!65581 (store (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11555 thiss!1427))) #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040238 () Bool)

(declare-fun res!693568 () Bool)

(assert (=> b!1040238 (=> (not res!693568) (not e!588898))))

(assert (=> b!1040238 (= res!693568 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125619 res!693567) b!1040237))

(assert (= (and b!1040237 res!693566) b!1040238))

(assert (= (and b!1040238 res!693568) b!1040239))

(assert (= (and d!125619 res!693565) b!1040240))

(declare-fun m!959837 () Bool)

(assert (=> d!125619 m!959837))

(declare-fun m!959839 () Bool)

(assert (=> b!1040237 m!959839))

(assert (=> b!1040237 m!959839))

(declare-fun m!959841 () Bool)

(assert (=> b!1040237 m!959841))

(assert (=> b!1040240 m!959767))

(declare-fun m!959843 () Bool)

(assert (=> b!1040240 m!959843))

(assert (=> b!1040240 m!959779))

(declare-fun m!959845 () Bool)

(assert (=> b!1040238 m!959845))

(assert (=> b!1040158 d!125619))

(declare-fun b!1040249 () Bool)

(declare-fun e!588908 () Bool)

(declare-fun e!588907 () Bool)

(assert (=> b!1040249 (= e!588908 e!588907)))

(declare-fun c!105457 () Bool)

(assert (=> b!1040249 (= c!105457 (validKeyInArray!0 (select (arr!31557 lt!458423) #b00000000000000000000000000000000)))))

(declare-fun bm!44037 () Bool)

(declare-fun call!44040 () Bool)

(assert (=> bm!44037 (= call!44040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458423 (mask!30323 thiss!1427)))))

(declare-fun d!125621 () Bool)

(declare-fun res!693573 () Bool)

(assert (=> d!125621 (=> res!693573 e!588908)))

(assert (=> d!125621 (= res!693573 (bvsge #b00000000000000000000000000000000 (size!32088 lt!458423)))))

(assert (=> d!125621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458423 (mask!30323 thiss!1427)) e!588908)))

(declare-fun b!1040250 () Bool)

(declare-fun e!588906 () Bool)

(assert (=> b!1040250 (= e!588907 e!588906)))

(declare-fun lt!458466 () (_ BitVec 64))

(assert (=> b!1040250 (= lt!458466 (select (arr!31557 lt!458423) #b00000000000000000000000000000000))))

(declare-fun lt!458468 () Unit!34011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65580 (_ BitVec 64) (_ BitVec 32)) Unit!34011)

(assert (=> b!1040250 (= lt!458468 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458423 lt!458466 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040250 (arrayContainsKey!0 lt!458423 lt!458466 #b00000000000000000000000000000000)))

(declare-fun lt!458467 () Unit!34011)

(assert (=> b!1040250 (= lt!458467 lt!458468)))

(declare-fun res!693574 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65580 (_ BitVec 32)) SeekEntryResult!9793)

(assert (=> b!1040250 (= res!693574 (= (seekEntryOrOpen!0 (select (arr!31557 lt!458423) #b00000000000000000000000000000000) lt!458423 (mask!30323 thiss!1427)) (Found!9793 #b00000000000000000000000000000000)))))

(assert (=> b!1040250 (=> (not res!693574) (not e!588906))))

(declare-fun b!1040251 () Bool)

(assert (=> b!1040251 (= e!588906 call!44040)))

(declare-fun b!1040252 () Bool)

(assert (=> b!1040252 (= e!588907 call!44040)))

(assert (= (and d!125621 (not res!693573)) b!1040249))

(assert (= (and b!1040249 c!105457) b!1040250))

(assert (= (and b!1040249 (not c!105457)) b!1040252))

(assert (= (and b!1040250 res!693574) b!1040251))

(assert (= (or b!1040251 b!1040252) bm!44037))

(declare-fun m!959847 () Bool)

(assert (=> b!1040249 m!959847))

(assert (=> b!1040249 m!959847))

(declare-fun m!959849 () Bool)

(assert (=> b!1040249 m!959849))

(declare-fun m!959851 () Bool)

(assert (=> bm!44037 m!959851))

(assert (=> b!1040250 m!959847))

(declare-fun m!959853 () Bool)

(assert (=> b!1040250 m!959853))

(declare-fun m!959855 () Bool)

(assert (=> b!1040250 m!959855))

(assert (=> b!1040250 m!959847))

(declare-fun m!959857 () Bool)

(assert (=> b!1040250 m!959857))

(assert (=> b!1040158 d!125621))

(declare-fun d!125623 () Bool)

(declare-fun e!588911 () Bool)

(assert (=> d!125623 e!588911))

(declare-fun res!693577 () Bool)

(assert (=> d!125623 (=> (not res!693577) (not e!588911))))

(assert (=> d!125623 (= res!693577 (and (bvsge (index!41544 lt!458422) #b00000000000000000000000000000000) (bvslt (index!41544 lt!458422) (size!32088 (_keys!11555 thiss!1427)))))))

(declare-fun lt!458471 () Unit!34011)

(declare-fun choose!25 (array!65580 (_ BitVec 32) (_ BitVec 32)) Unit!34011)

(assert (=> d!125623 (= lt!458471 (choose!25 (_keys!11555 thiss!1427) (index!41544 lt!458422) (mask!30323 thiss!1427)))))

(assert (=> d!125623 (validMask!0 (mask!30323 thiss!1427))))

(assert (=> d!125623 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11555 thiss!1427) (index!41544 lt!458422) (mask!30323 thiss!1427)) lt!458471)))

(declare-fun b!1040255 () Bool)

(assert (=> b!1040255 (= e!588911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65581 (store (arr!31557 (_keys!11555 thiss!1427)) (index!41544 lt!458422) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32088 (_keys!11555 thiss!1427))) (mask!30323 thiss!1427)))))

(assert (= (and d!125623 res!693577) b!1040255))

(declare-fun m!959859 () Bool)

(assert (=> d!125623 m!959859))

(assert (=> d!125623 m!959815))

(assert (=> b!1040255 m!959767))

(declare-fun m!959861 () Bool)

(assert (=> b!1040255 m!959861))

(assert (=> b!1040158 d!125623))

(declare-fun bm!44038 () Bool)

(declare-fun call!44041 () Bool)

(declare-fun c!105458 () Bool)

(assert (=> bm!44038 (= call!44041 (arrayNoDuplicates!0 lt!458423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105458 (Cons!21951 (select (arr!31557 lt!458423) #b00000000000000000000000000000000) Nil!21952) Nil!21952)))))

(declare-fun b!1040256 () Bool)

(declare-fun e!588912 () Bool)

(assert (=> b!1040256 (= e!588912 call!44041)))

(declare-fun b!1040257 () Bool)

(declare-fun e!588914 () Bool)

(declare-fun e!588915 () Bool)

(assert (=> b!1040257 (= e!588914 e!588915)))

(declare-fun res!693578 () Bool)

(assert (=> b!1040257 (=> (not res!693578) (not e!588915))))

(declare-fun e!588913 () Bool)

(assert (=> b!1040257 (= res!693578 (not e!588913))))

(declare-fun res!693579 () Bool)

(assert (=> b!1040257 (=> (not res!693579) (not e!588913))))

(assert (=> b!1040257 (= res!693579 (validKeyInArray!0 (select (arr!31557 lt!458423) #b00000000000000000000000000000000)))))

(declare-fun b!1040258 () Bool)

(assert (=> b!1040258 (= e!588912 call!44041)))

(declare-fun b!1040259 () Bool)

(assert (=> b!1040259 (= e!588913 (contains!6048 Nil!21952 (select (arr!31557 lt!458423) #b00000000000000000000000000000000)))))

(declare-fun d!125625 () Bool)

(declare-fun res!693580 () Bool)

(assert (=> d!125625 (=> res!693580 e!588914)))

(assert (=> d!125625 (= res!693580 (bvsge #b00000000000000000000000000000000 (size!32088 lt!458423)))))

(assert (=> d!125625 (= (arrayNoDuplicates!0 lt!458423 #b00000000000000000000000000000000 Nil!21952) e!588914)))

(declare-fun b!1040260 () Bool)

(assert (=> b!1040260 (= e!588915 e!588912)))

(assert (=> b!1040260 (= c!105458 (validKeyInArray!0 (select (arr!31557 lt!458423) #b00000000000000000000000000000000)))))

(assert (= (and d!125625 (not res!693580)) b!1040257))

(assert (= (and b!1040257 res!693579) b!1040259))

(assert (= (and b!1040257 res!693578) b!1040260))

(assert (= (and b!1040260 c!105458) b!1040258))

(assert (= (and b!1040260 (not c!105458)) b!1040256))

(assert (= (or b!1040258 b!1040256) bm!44038))

(assert (=> bm!44038 m!959847))

(declare-fun m!959863 () Bool)

(assert (=> bm!44038 m!959863))

(assert (=> b!1040257 m!959847))

(assert (=> b!1040257 m!959847))

(assert (=> b!1040257 m!959849))

(assert (=> b!1040259 m!959847))

(assert (=> b!1040259 m!959847))

(declare-fun m!959865 () Bool)

(assert (=> b!1040259 m!959865))

(assert (=> b!1040260 m!959847))

(assert (=> b!1040260 m!959847))

(assert (=> b!1040260 m!959849))

(assert (=> b!1040158 d!125625))

(declare-fun d!125627 () Bool)

(declare-fun lt!458474 () (_ BitVec 32))

(assert (=> d!125627 (and (bvsge lt!458474 #b00000000000000000000000000000000) (bvsle lt!458474 (bvsub (size!32088 lt!458423) #b00000000000000000000000000000000)))))

(declare-fun e!588920 () (_ BitVec 32))

(assert (=> d!125627 (= lt!458474 e!588920)))

(declare-fun c!105464 () Bool)

(assert (=> d!125627 (= c!105464 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))))))

(assert (=> d!125627 (and (bvsle #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11555 thiss!1427)) (size!32088 lt!458423)))))

(assert (=> d!125627 (= (arrayCountValidKeys!0 lt!458423 #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) lt!458474)))

(declare-fun bm!44041 () Bool)

(declare-fun call!44044 () (_ BitVec 32))

(assert (=> bm!44041 (= call!44044 (arrayCountValidKeys!0 lt!458423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11555 thiss!1427))))))

(declare-fun b!1040269 () Bool)

(declare-fun e!588921 () (_ BitVec 32))

(assert (=> b!1040269 (= e!588920 e!588921)))

(declare-fun c!105463 () Bool)

(assert (=> b!1040269 (= c!105463 (validKeyInArray!0 (select (arr!31557 lt!458423) #b00000000000000000000000000000000)))))

(declare-fun b!1040270 () Bool)

(assert (=> b!1040270 (= e!588920 #b00000000000000000000000000000000)))

(declare-fun b!1040271 () Bool)

(assert (=> b!1040271 (= e!588921 (bvadd #b00000000000000000000000000000001 call!44044))))

(declare-fun b!1040272 () Bool)

(assert (=> b!1040272 (= e!588921 call!44044)))

(assert (= (and d!125627 c!105464) b!1040270))

(assert (= (and d!125627 (not c!105464)) b!1040269))

(assert (= (and b!1040269 c!105463) b!1040271))

(assert (= (and b!1040269 (not c!105463)) b!1040272))

(assert (= (or b!1040271 b!1040272) bm!44041))

(declare-fun m!959867 () Bool)

(assert (=> bm!44041 m!959867))

(assert (=> b!1040269 m!959847))

(assert (=> b!1040269 m!959847))

(assert (=> b!1040269 m!959849))

(assert (=> b!1040158 d!125627))

(declare-fun d!125629 () Bool)

(declare-fun lt!458475 () (_ BitVec 32))

(assert (=> d!125629 (and (bvsge lt!458475 #b00000000000000000000000000000000) (bvsle lt!458475 (bvsub (size!32088 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588922 () (_ BitVec 32))

(assert (=> d!125629 (= lt!458475 e!588922)))

(declare-fun c!105466 () Bool)

(assert (=> d!125629 (= c!105466 (bvsge #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))))))

(assert (=> d!125629 (and (bvsle #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32088 (_keys!11555 thiss!1427)) (size!32088 (_keys!11555 thiss!1427))))))

(assert (=> d!125629 (= (arrayCountValidKeys!0 (_keys!11555 thiss!1427) #b00000000000000000000000000000000 (size!32088 (_keys!11555 thiss!1427))) lt!458475)))

(declare-fun bm!44042 () Bool)

(declare-fun call!44045 () (_ BitVec 32))

(assert (=> bm!44042 (= call!44045 (arrayCountValidKeys!0 (_keys!11555 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32088 (_keys!11555 thiss!1427))))))

(declare-fun b!1040273 () Bool)

(declare-fun e!588923 () (_ BitVec 32))

(assert (=> b!1040273 (= e!588922 e!588923)))

(declare-fun c!105465 () Bool)

(assert (=> b!1040273 (= c!105465 (validKeyInArray!0 (select (arr!31557 (_keys!11555 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040274 () Bool)

(assert (=> b!1040274 (= e!588922 #b00000000000000000000000000000000)))

(declare-fun b!1040275 () Bool)

(assert (=> b!1040275 (= e!588923 (bvadd #b00000000000000000000000000000001 call!44045))))

(declare-fun b!1040276 () Bool)

(assert (=> b!1040276 (= e!588923 call!44045)))

(assert (= (and d!125629 c!105466) b!1040274))

(assert (= (and d!125629 (not c!105466)) b!1040273))

(assert (= (and b!1040273 c!105465) b!1040275))

(assert (= (and b!1040273 (not c!105465)) b!1040276))

(assert (= (or b!1040275 b!1040276) bm!44042))

(declare-fun m!959869 () Bool)

(assert (=> bm!44042 m!959869))

(assert (=> b!1040273 m!959821))

(assert (=> b!1040273 m!959821))

(assert (=> b!1040273 m!959825))

(assert (=> b!1040158 d!125629))

(declare-fun mapIsEmpty!38665 () Bool)

(declare-fun mapRes!38665 () Bool)

(assert (=> mapIsEmpty!38665 mapRes!38665))

(declare-fun condMapEmpty!38665 () Bool)

(declare-fun mapDefault!38665 () ValueCell!11658)

(assert (=> mapNonEmpty!38659 (= condMapEmpty!38665 (= mapRest!38659 ((as const (Array (_ BitVec 32) ValueCell!11658)) mapDefault!38665)))))

(declare-fun e!588929 () Bool)

(assert (=> mapNonEmpty!38659 (= tp!74201 (and e!588929 mapRes!38665))))

(declare-fun mapNonEmpty!38665 () Bool)

(declare-fun tp!74210 () Bool)

(declare-fun e!588928 () Bool)

(assert (=> mapNonEmpty!38665 (= mapRes!38665 (and tp!74210 e!588928))))

(declare-fun mapKey!38665 () (_ BitVec 32))

(declare-fun mapValue!38665 () ValueCell!11658)

(declare-fun mapRest!38665 () (Array (_ BitVec 32) ValueCell!11658))

(assert (=> mapNonEmpty!38665 (= mapRest!38659 (store mapRest!38665 mapKey!38665 mapValue!38665))))

(declare-fun b!1040283 () Bool)

(assert (=> b!1040283 (= e!588928 tp_is_empty!24723)))

(declare-fun b!1040284 () Bool)

(assert (=> b!1040284 (= e!588929 tp_is_empty!24723)))

(assert (= (and mapNonEmpty!38659 condMapEmpty!38665) mapIsEmpty!38665))

(assert (= (and mapNonEmpty!38659 (not condMapEmpty!38665)) mapNonEmpty!38665))

(assert (= (and mapNonEmpty!38665 ((_ is ValueCellFull!11658) mapValue!38665)) b!1040283))

(assert (= (and mapNonEmpty!38659 ((_ is ValueCellFull!11658) mapDefault!38665)) b!1040284))

(declare-fun m!959871 () Bool)

(assert (=> mapNonEmpty!38665 m!959871))

(check-sat (not b!1040259) (not b!1040224) b_and!33535 (not b!1040237) (not bm!44034) tp_is_empty!24723 (not b!1040216) (not b!1040257) (not b!1040223) (not bm!44041) (not b!1040200) (not b!1040273) (not b!1040260) (not b!1040250) (not bm!44037) (not b!1040269) (not bm!44042) (not b!1040249) (not b!1040213) (not b!1040255) (not d!125611) (not mapNonEmpty!38665) (not b!1040238) (not d!125619) (not d!125617) (not d!125623) (not d!125607) (not b!1040215) (not b!1040228) (not b_next!21003) (not b!1040240) (not b!1040225) (not bm!44038))
(check-sat b_and!33535 (not b_next!21003))
