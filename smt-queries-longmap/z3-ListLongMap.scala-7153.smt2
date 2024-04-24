; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91216 () Bool)

(assert start!91216)

(declare-fun b!1040605 () Bool)

(declare-fun b_free!20971 () Bool)

(declare-fun b_next!20971 () Bool)

(assert (=> b!1040605 (= b_free!20971 (not b_next!20971))))

(declare-fun tp!74089 () Bool)

(declare-fun b_and!33513 () Bool)

(assert (=> b!1040605 (= tp!74089 b_and!33513)))

(declare-fun b!1040597 () Bool)

(declare-fun e!589039 () Bool)

(declare-fun tp_is_empty!24691 () Bool)

(assert (=> b!1040597 (= e!589039 tp_is_empty!24691)))

(declare-fun b!1040598 () Bool)

(declare-fun e!589034 () Bool)

(declare-fun e!589033 () Bool)

(assert (=> b!1040598 (= e!589034 e!589033)))

(declare-fun res!693624 () Bool)

(assert (=> b!1040598 (=> (not res!693624) (not e!589033))))

(declare-datatypes ((SeekEntryResult!9737 0))(
  ( (MissingZero!9737 (index!41319 (_ BitVec 32))) (Found!9737 (index!41320 (_ BitVec 32))) (Intermediate!9737 (undefined!10549 Bool) (index!41321 (_ BitVec 32)) (x!92735 (_ BitVec 32))) (Undefined!9737) (MissingVacant!9737 (index!41322 (_ BitVec 32))) )
))
(declare-fun lt!458558 () SeekEntryResult!9737)

(get-info :version)

(assert (=> b!1040598 (= res!693624 ((_ is Found!9737) lt!458558))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37795 0))(
  ( (V!37796 (val!12396 Int)) )
))
(declare-datatypes ((ValueCell!11642 0))(
  ( (ValueCellFull!11642 (v!14979 V!37795)) (EmptyCell!11642) )
))
(declare-datatypes ((array!65555 0))(
  ( (array!65556 (arr!31543 (Array (_ BitVec 32) (_ BitVec 64))) (size!32075 (_ BitVec 32))) )
))
(declare-datatypes ((array!65557 0))(
  ( (array!65558 (arr!31544 (Array (_ BitVec 32) ValueCell!11642)) (size!32076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5878 0))(
  ( (LongMapFixedSize!5879 (defaultEntry!6321 Int) (mask!30343 (_ BitVec 32)) (extraKeys!6049 (_ BitVec 32)) (zeroValue!6155 V!37795) (minValue!6155 V!37795) (_size!2994 (_ BitVec 32)) (_keys!11568 array!65555) (_values!6344 array!65557) (_vacant!2994 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5878)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65555 (_ BitVec 32)) SeekEntryResult!9737)

(assert (=> b!1040598 (= lt!458558 (seekEntry!0 key!909 (_keys!11568 thiss!1427) (mask!30343 thiss!1427)))))

(declare-fun b!1040599 () Bool)

(declare-fun e!589038 () Bool)

(declare-fun mapRes!38596 () Bool)

(assert (=> b!1040599 (= e!589038 (and e!589039 mapRes!38596))))

(declare-fun condMapEmpty!38596 () Bool)

(declare-fun mapDefault!38596 () ValueCell!11642)

(assert (=> b!1040599 (= condMapEmpty!38596 (= (arr!31544 (_values!6344 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11642)) mapDefault!38596)))))

(declare-fun res!693623 () Bool)

(assert (=> start!91216 (=> (not res!693623) (not e!589034))))

(declare-fun valid!2221 (LongMapFixedSize!5878) Bool)

(assert (=> start!91216 (= res!693623 (valid!2221 thiss!1427))))

(assert (=> start!91216 e!589034))

(declare-fun e!589036 () Bool)

(assert (=> start!91216 e!589036))

(assert (=> start!91216 true))

(declare-fun b!1040600 () Bool)

(declare-fun res!693620 () Bool)

(declare-fun e!589037 () Bool)

(assert (=> b!1040600 (=> res!693620 e!589037)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040600 (= res!693620 (not (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558)))))))

(declare-fun b!1040601 () Bool)

(assert (=> b!1040601 (= e!589033 (not e!589037))))

(declare-fun res!693621 () Bool)

(assert (=> b!1040601 (=> res!693621 e!589037)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040601 (= res!693621 (not (validMask!0 (mask!30343 thiss!1427))))))

(declare-fun lt!458561 () array!65555)

(declare-datatypes ((List!21934 0))(
  ( (Nil!21931) (Cons!21930 (h!23143 (_ BitVec 64)) (t!31140 List!21934)) )
))
(declare-fun arrayNoDuplicates!0 (array!65555 (_ BitVec 32) List!21934) Bool)

(assert (=> b!1040601 (arrayNoDuplicates!0 lt!458561 #b00000000000000000000000000000000 Nil!21931)))

(declare-datatypes ((Unit!33995 0))(
  ( (Unit!33996) )
))
(declare-fun lt!458560 () Unit!33995)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21934) Unit!33995)

(assert (=> b!1040601 (= lt!458560 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11568 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41320 lt!458558) #b00000000000000000000000000000000 Nil!21931))))

(declare-fun arrayCountValidKeys!0 (array!65555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040601 (= (arrayCountValidKeys!0 lt!458561 #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040601 (= lt!458561 (array!65556 (store (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11568 thiss!1427))))))

(declare-fun lt!458559 () Unit!33995)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65555 (_ BitVec 32) (_ BitVec 64)) Unit!33995)

(assert (=> b!1040601 (= lt!458559 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11568 thiss!1427) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040602 () Bool)

(assert (=> b!1040602 (= e!589037 (arrayNoDuplicates!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 Nil!21931))))

(declare-fun b!1040603 () Bool)

(declare-fun res!693622 () Bool)

(assert (=> b!1040603 (=> res!693622 e!589037)))

(assert (=> b!1040603 (= res!693622 (or (not (= (size!32075 (_keys!11568 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30343 thiss!1427)))) (bvslt (index!41320 lt!458558) #b00000000000000000000000000000000) (bvsge (index!41320 lt!458558) (size!32075 (_keys!11568 thiss!1427)))))))

(declare-fun b!1040604 () Bool)

(declare-fun res!693625 () Bool)

(assert (=> b!1040604 (=> (not res!693625) (not e!589034))))

(assert (=> b!1040604 (= res!693625 (not (= key!909 (bvneg key!909))))))

(declare-fun array_inv!24395 (array!65555) Bool)

(declare-fun array_inv!24396 (array!65557) Bool)

(assert (=> b!1040605 (= e!589036 (and tp!74089 tp_is_empty!24691 (array_inv!24395 (_keys!11568 thiss!1427)) (array_inv!24396 (_values!6344 thiss!1427)) e!589038))))

(declare-fun b!1040606 () Bool)

(declare-fun e!589035 () Bool)

(assert (=> b!1040606 (= e!589035 tp_is_empty!24691)))

(declare-fun mapNonEmpty!38596 () Bool)

(declare-fun tp!74090 () Bool)

(assert (=> mapNonEmpty!38596 (= mapRes!38596 (and tp!74090 e!589035))))

(declare-fun mapKey!38596 () (_ BitVec 32))

(declare-fun mapValue!38596 () ValueCell!11642)

(declare-fun mapRest!38596 () (Array (_ BitVec 32) ValueCell!11642))

(assert (=> mapNonEmpty!38596 (= (arr!31544 (_values!6344 thiss!1427)) (store mapRest!38596 mapKey!38596 mapValue!38596))))

(declare-fun mapIsEmpty!38596 () Bool)

(assert (=> mapIsEmpty!38596 mapRes!38596))

(assert (= (and start!91216 res!693623) b!1040604))

(assert (= (and b!1040604 res!693625) b!1040598))

(assert (= (and b!1040598 res!693624) b!1040601))

(assert (= (and b!1040601 (not res!693621)) b!1040603))

(assert (= (and b!1040603 (not res!693622)) b!1040600))

(assert (= (and b!1040600 (not res!693620)) b!1040602))

(assert (= (and b!1040599 condMapEmpty!38596) mapIsEmpty!38596))

(assert (= (and b!1040599 (not condMapEmpty!38596)) mapNonEmpty!38596))

(assert (= (and mapNonEmpty!38596 ((_ is ValueCellFull!11642) mapValue!38596)) b!1040606))

(assert (= (and b!1040599 ((_ is ValueCellFull!11642) mapDefault!38596)) b!1040597))

(assert (= b!1040605 b!1040599))

(assert (= start!91216 b!1040605))

(declare-fun m!960685 () Bool)

(assert (=> start!91216 m!960685))

(declare-fun m!960687 () Bool)

(assert (=> b!1040598 m!960687))

(declare-fun m!960689 () Bool)

(assert (=> b!1040600 m!960689))

(assert (=> b!1040600 m!960689))

(declare-fun m!960691 () Bool)

(assert (=> b!1040600 m!960691))

(declare-fun m!960693 () Bool)

(assert (=> b!1040602 m!960693))

(declare-fun m!960695 () Bool)

(assert (=> b!1040601 m!960695))

(declare-fun m!960697 () Bool)

(assert (=> b!1040601 m!960697))

(declare-fun m!960699 () Bool)

(assert (=> b!1040601 m!960699))

(declare-fun m!960701 () Bool)

(assert (=> b!1040601 m!960701))

(declare-fun m!960703 () Bool)

(assert (=> b!1040601 m!960703))

(declare-fun m!960705 () Bool)

(assert (=> b!1040601 m!960705))

(declare-fun m!960707 () Bool)

(assert (=> b!1040601 m!960707))

(declare-fun m!960709 () Bool)

(assert (=> b!1040605 m!960709))

(declare-fun m!960711 () Bool)

(assert (=> b!1040605 m!960711))

(declare-fun m!960713 () Bool)

(assert (=> mapNonEmpty!38596 m!960713))

(check-sat tp_is_empty!24691 (not b!1040605) b_and!33513 (not b!1040600) (not b!1040601) (not mapNonEmpty!38596) (not b_next!20971) (not b!1040602) (not start!91216) (not b!1040598))
(check-sat b_and!33513 (not b_next!20971))
(get-model)

(declare-fun d!125943 () Bool)

(declare-fun e!589091 () Bool)

(assert (=> d!125943 e!589091))

(declare-fun res!693664 () Bool)

(assert (=> d!125943 (=> (not res!693664) (not e!589091))))

(assert (=> d!125943 (= res!693664 (and (bvsge (index!41320 lt!458558) #b00000000000000000000000000000000) (bvslt (index!41320 lt!458558) (size!32075 (_keys!11568 thiss!1427)))))))

(declare-fun lt!458588 () Unit!33995)

(declare-fun choose!53 (array!65555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21934) Unit!33995)

(assert (=> d!125943 (= lt!458588 (choose!53 (_keys!11568 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41320 lt!458558) #b00000000000000000000000000000000 Nil!21931))))

(assert (=> d!125943 (bvslt (size!32075 (_keys!11568 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125943 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11568 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41320 lt!458558) #b00000000000000000000000000000000 Nil!21931) lt!458588)))

(declare-fun b!1040669 () Bool)

(assert (=> b!1040669 (= e!589091 (arrayNoDuplicates!0 (array!65556 (store (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11568 thiss!1427))) #b00000000000000000000000000000000 Nil!21931))))

(assert (= (and d!125943 res!693664) b!1040669))

(declare-fun m!960775 () Bool)

(assert (=> d!125943 m!960775))

(assert (=> b!1040669 m!960697))

(declare-fun m!960777 () Bool)

(assert (=> b!1040669 m!960777))

(assert (=> b!1040601 d!125943))

(declare-fun d!125945 () Bool)

(declare-fun lt!458591 () (_ BitVec 32))

(assert (=> d!125945 (and (bvsge lt!458591 #b00000000000000000000000000000000) (bvsle lt!458591 (bvsub (size!32075 lt!458561) #b00000000000000000000000000000000)))))

(declare-fun e!589096 () (_ BitVec 32))

(assert (=> d!125945 (= lt!458591 e!589096)))

(declare-fun c!105744 () Bool)

(assert (=> d!125945 (= c!105744 (bvsge #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))))))

(assert (=> d!125945 (and (bvsle #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32075 (_keys!11568 thiss!1427)) (size!32075 lt!458561)))))

(assert (=> d!125945 (= (arrayCountValidKeys!0 lt!458561 #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) lt!458591)))

(declare-fun b!1040678 () Bool)

(assert (=> b!1040678 (= e!589096 #b00000000000000000000000000000000)))

(declare-fun b!1040679 () Bool)

(declare-fun e!589097 () (_ BitVec 32))

(declare-fun call!44055 () (_ BitVec 32))

(assert (=> b!1040679 (= e!589097 (bvadd #b00000000000000000000000000000001 call!44055))))

(declare-fun bm!44052 () Bool)

(assert (=> bm!44052 (= call!44055 (arrayCountValidKeys!0 lt!458561 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32075 (_keys!11568 thiss!1427))))))

(declare-fun b!1040680 () Bool)

(assert (=> b!1040680 (= e!589096 e!589097)))

(declare-fun c!105743 () Bool)

(assert (=> b!1040680 (= c!105743 (validKeyInArray!0 (select (arr!31543 lt!458561) #b00000000000000000000000000000000)))))

(declare-fun b!1040681 () Bool)

(assert (=> b!1040681 (= e!589097 call!44055)))

(assert (= (and d!125945 c!105744) b!1040678))

(assert (= (and d!125945 (not c!105744)) b!1040680))

(assert (= (and b!1040680 c!105743) b!1040679))

(assert (= (and b!1040680 (not c!105743)) b!1040681))

(assert (= (or b!1040679 b!1040681) bm!44052))

(declare-fun m!960779 () Bool)

(assert (=> bm!44052 m!960779))

(declare-fun m!960781 () Bool)

(assert (=> b!1040680 m!960781))

(assert (=> b!1040680 m!960781))

(declare-fun m!960783 () Bool)

(assert (=> b!1040680 m!960783))

(assert (=> b!1040601 d!125945))

(declare-fun b!1040692 () Bool)

(declare-fun e!589107 () Bool)

(declare-fun call!44058 () Bool)

(assert (=> b!1040692 (= e!589107 call!44058)))

(declare-fun b!1040694 () Bool)

(declare-fun e!589106 () Bool)

(declare-fun e!589108 () Bool)

(assert (=> b!1040694 (= e!589106 e!589108)))

(declare-fun res!693671 () Bool)

(assert (=> b!1040694 (=> (not res!693671) (not e!589108))))

(declare-fun e!589109 () Bool)

(assert (=> b!1040694 (= res!693671 (not e!589109))))

(declare-fun res!693673 () Bool)

(assert (=> b!1040694 (=> (not res!693673) (not e!589109))))

(assert (=> b!1040694 (= res!693673 (validKeyInArray!0 (select (arr!31543 lt!458561) #b00000000000000000000000000000000)))))

(declare-fun b!1040695 () Bool)

(assert (=> b!1040695 (= e!589108 e!589107)))

(declare-fun c!105747 () Bool)

(assert (=> b!1040695 (= c!105747 (validKeyInArray!0 (select (arr!31543 lt!458561) #b00000000000000000000000000000000)))))

(declare-fun b!1040696 () Bool)

(assert (=> b!1040696 (= e!589107 call!44058)))

(declare-fun bm!44055 () Bool)

(assert (=> bm!44055 (= call!44058 (arrayNoDuplicates!0 lt!458561 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105747 (Cons!21930 (select (arr!31543 lt!458561) #b00000000000000000000000000000000) Nil!21931) Nil!21931)))))

(declare-fun d!125947 () Bool)

(declare-fun res!693672 () Bool)

(assert (=> d!125947 (=> res!693672 e!589106)))

(assert (=> d!125947 (= res!693672 (bvsge #b00000000000000000000000000000000 (size!32075 lt!458561)))))

(assert (=> d!125947 (= (arrayNoDuplicates!0 lt!458561 #b00000000000000000000000000000000 Nil!21931) e!589106)))

(declare-fun b!1040693 () Bool)

(declare-fun contains!6069 (List!21934 (_ BitVec 64)) Bool)

(assert (=> b!1040693 (= e!589109 (contains!6069 Nil!21931 (select (arr!31543 lt!458561) #b00000000000000000000000000000000)))))

(assert (= (and d!125947 (not res!693672)) b!1040694))

(assert (= (and b!1040694 res!693673) b!1040693))

(assert (= (and b!1040694 res!693671) b!1040695))

(assert (= (and b!1040695 c!105747) b!1040696))

(assert (= (and b!1040695 (not c!105747)) b!1040692))

(assert (= (or b!1040696 b!1040692) bm!44055))

(assert (=> b!1040694 m!960781))

(assert (=> b!1040694 m!960781))

(assert (=> b!1040694 m!960783))

(assert (=> b!1040695 m!960781))

(assert (=> b!1040695 m!960781))

(assert (=> b!1040695 m!960783))

(assert (=> bm!44055 m!960781))

(declare-fun m!960785 () Bool)

(assert (=> bm!44055 m!960785))

(assert (=> b!1040693 m!960781))

(assert (=> b!1040693 m!960781))

(declare-fun m!960787 () Bool)

(assert (=> b!1040693 m!960787))

(assert (=> b!1040601 d!125947))

(declare-fun d!125949 () Bool)

(assert (=> d!125949 (= (validMask!0 (mask!30343 thiss!1427)) (and (or (= (mask!30343 thiss!1427) #b00000000000000000000000000000111) (= (mask!30343 thiss!1427) #b00000000000000000000000000001111) (= (mask!30343 thiss!1427) #b00000000000000000000000000011111) (= (mask!30343 thiss!1427) #b00000000000000000000000000111111) (= (mask!30343 thiss!1427) #b00000000000000000000000001111111) (= (mask!30343 thiss!1427) #b00000000000000000000000011111111) (= (mask!30343 thiss!1427) #b00000000000000000000000111111111) (= (mask!30343 thiss!1427) #b00000000000000000000001111111111) (= (mask!30343 thiss!1427) #b00000000000000000000011111111111) (= (mask!30343 thiss!1427) #b00000000000000000000111111111111) (= (mask!30343 thiss!1427) #b00000000000000000001111111111111) (= (mask!30343 thiss!1427) #b00000000000000000011111111111111) (= (mask!30343 thiss!1427) #b00000000000000000111111111111111) (= (mask!30343 thiss!1427) #b00000000000000001111111111111111) (= (mask!30343 thiss!1427) #b00000000000000011111111111111111) (= (mask!30343 thiss!1427) #b00000000000000111111111111111111) (= (mask!30343 thiss!1427) #b00000000000001111111111111111111) (= (mask!30343 thiss!1427) #b00000000000011111111111111111111) (= (mask!30343 thiss!1427) #b00000000000111111111111111111111) (= (mask!30343 thiss!1427) #b00000000001111111111111111111111) (= (mask!30343 thiss!1427) #b00000000011111111111111111111111) (= (mask!30343 thiss!1427) #b00000000111111111111111111111111) (= (mask!30343 thiss!1427) #b00000001111111111111111111111111) (= (mask!30343 thiss!1427) #b00000011111111111111111111111111) (= (mask!30343 thiss!1427) #b00000111111111111111111111111111) (= (mask!30343 thiss!1427) #b00001111111111111111111111111111) (= (mask!30343 thiss!1427) #b00011111111111111111111111111111) (= (mask!30343 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30343 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040601 d!125949))

(declare-fun d!125951 () Bool)

(declare-fun lt!458592 () (_ BitVec 32))

(assert (=> d!125951 (and (bvsge lt!458592 #b00000000000000000000000000000000) (bvsle lt!458592 (bvsub (size!32075 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589110 () (_ BitVec 32))

(assert (=> d!125951 (= lt!458592 e!589110)))

(declare-fun c!105749 () Bool)

(assert (=> d!125951 (= c!105749 (bvsge #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))))))

(assert (=> d!125951 (and (bvsle #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32075 (_keys!11568 thiss!1427)) (size!32075 (_keys!11568 thiss!1427))))))

(assert (=> d!125951 (= (arrayCountValidKeys!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) lt!458592)))

(declare-fun b!1040697 () Bool)

(assert (=> b!1040697 (= e!589110 #b00000000000000000000000000000000)))

(declare-fun b!1040698 () Bool)

(declare-fun e!589111 () (_ BitVec 32))

(declare-fun call!44059 () (_ BitVec 32))

(assert (=> b!1040698 (= e!589111 (bvadd #b00000000000000000000000000000001 call!44059))))

(declare-fun bm!44056 () Bool)

(assert (=> bm!44056 (= call!44059 (arrayCountValidKeys!0 (_keys!11568 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32075 (_keys!11568 thiss!1427))))))

(declare-fun b!1040699 () Bool)

(assert (=> b!1040699 (= e!589110 e!589111)))

(declare-fun c!105748 () Bool)

(assert (=> b!1040699 (= c!105748 (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040700 () Bool)

(assert (=> b!1040700 (= e!589111 call!44059)))

(assert (= (and d!125951 c!105749) b!1040697))

(assert (= (and d!125951 (not c!105749)) b!1040699))

(assert (= (and b!1040699 c!105748) b!1040698))

(assert (= (and b!1040699 (not c!105748)) b!1040700))

(assert (= (or b!1040698 b!1040700) bm!44056))

(declare-fun m!960789 () Bool)

(assert (=> bm!44056 m!960789))

(declare-fun m!960791 () Bool)

(assert (=> b!1040699 m!960791))

(assert (=> b!1040699 m!960791))

(declare-fun m!960793 () Bool)

(assert (=> b!1040699 m!960793))

(assert (=> b!1040601 d!125951))

(declare-fun b!1040709 () Bool)

(declare-fun res!693685 () Bool)

(declare-fun e!589116 () Bool)

(assert (=> b!1040709 (=> (not res!693685) (not e!589116))))

(assert (=> b!1040709 (= res!693685 (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558))))))

(declare-fun b!1040710 () Bool)

(declare-fun res!693682 () Bool)

(assert (=> b!1040710 (=> (not res!693682) (not e!589116))))

(assert (=> b!1040710 (= res!693682 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040711 () Bool)

(assert (=> b!1040711 (= e!589116 (bvslt (size!32075 (_keys!11568 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040712 () Bool)

(declare-fun e!589117 () Bool)

(assert (=> b!1040712 (= e!589117 (= (arrayCountValidKeys!0 (array!65556 (store (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32075 (_keys!11568 thiss!1427))) #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125953 () Bool)

(assert (=> d!125953 e!589117))

(declare-fun res!693683 () Bool)

(assert (=> d!125953 (=> (not res!693683) (not e!589117))))

(assert (=> d!125953 (= res!693683 (and (bvsge (index!41320 lt!458558) #b00000000000000000000000000000000) (bvslt (index!41320 lt!458558) (size!32075 (_keys!11568 thiss!1427)))))))

(declare-fun lt!458595 () Unit!33995)

(declare-fun choose!82 (array!65555 (_ BitVec 32) (_ BitVec 64)) Unit!33995)

(assert (=> d!125953 (= lt!458595 (choose!82 (_keys!11568 thiss!1427) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125953 e!589116))

(declare-fun res!693684 () Bool)

(assert (=> d!125953 (=> (not res!693684) (not e!589116))))

(assert (=> d!125953 (= res!693684 (and (bvsge (index!41320 lt!458558) #b00000000000000000000000000000000) (bvslt (index!41320 lt!458558) (size!32075 (_keys!11568 thiss!1427)))))))

(assert (=> d!125953 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11568 thiss!1427) (index!41320 lt!458558) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458595)))

(assert (= (and d!125953 res!693684) b!1040709))

(assert (= (and b!1040709 res!693685) b!1040710))

(assert (= (and b!1040710 res!693682) b!1040711))

(assert (= (and d!125953 res!693683) b!1040712))

(assert (=> b!1040709 m!960689))

(assert (=> b!1040709 m!960689))

(assert (=> b!1040709 m!960691))

(declare-fun m!960795 () Bool)

(assert (=> b!1040710 m!960795))

(assert (=> b!1040712 m!960697))

(declare-fun m!960797 () Bool)

(assert (=> b!1040712 m!960797))

(assert (=> b!1040712 m!960705))

(declare-fun m!960799 () Bool)

(assert (=> d!125953 m!960799))

(assert (=> b!1040601 d!125953))

(declare-fun b!1040713 () Bool)

(declare-fun e!589119 () Bool)

(declare-fun call!44060 () Bool)

(assert (=> b!1040713 (= e!589119 call!44060)))

(declare-fun b!1040715 () Bool)

(declare-fun e!589118 () Bool)

(declare-fun e!589120 () Bool)

(assert (=> b!1040715 (= e!589118 e!589120)))

(declare-fun res!693686 () Bool)

(assert (=> b!1040715 (=> (not res!693686) (not e!589120))))

(declare-fun e!589121 () Bool)

(assert (=> b!1040715 (= res!693686 (not e!589121))))

(declare-fun res!693688 () Bool)

(assert (=> b!1040715 (=> (not res!693688) (not e!589121))))

(assert (=> b!1040715 (= res!693688 (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040716 () Bool)

(assert (=> b!1040716 (= e!589120 e!589119)))

(declare-fun c!105750 () Bool)

(assert (=> b!1040716 (= c!105750 (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040717 () Bool)

(assert (=> b!1040717 (= e!589119 call!44060)))

(declare-fun bm!44057 () Bool)

(assert (=> bm!44057 (= call!44060 (arrayNoDuplicates!0 (_keys!11568 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105750 (Cons!21930 (select (arr!31543 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000) Nil!21931) Nil!21931)))))

(declare-fun d!125955 () Bool)

(declare-fun res!693687 () Bool)

(assert (=> d!125955 (=> res!693687 e!589118)))

(assert (=> d!125955 (= res!693687 (bvsge #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))))))

(assert (=> d!125955 (= (arrayNoDuplicates!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 Nil!21931) e!589118)))

(declare-fun b!1040714 () Bool)

(assert (=> b!1040714 (= e!589121 (contains!6069 Nil!21931 (select (arr!31543 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125955 (not res!693687)) b!1040715))

(assert (= (and b!1040715 res!693688) b!1040714))

(assert (= (and b!1040715 res!693686) b!1040716))

(assert (= (and b!1040716 c!105750) b!1040717))

(assert (= (and b!1040716 (not c!105750)) b!1040713))

(assert (= (or b!1040717 b!1040713) bm!44057))

(assert (=> b!1040715 m!960791))

(assert (=> b!1040715 m!960791))

(assert (=> b!1040715 m!960793))

(assert (=> b!1040716 m!960791))

(assert (=> b!1040716 m!960791))

(assert (=> b!1040716 m!960793))

(assert (=> bm!44057 m!960791))

(declare-fun m!960801 () Bool)

(assert (=> bm!44057 m!960801))

(assert (=> b!1040714 m!960791))

(assert (=> b!1040714 m!960791))

(declare-fun m!960803 () Bool)

(assert (=> b!1040714 m!960803))

(assert (=> b!1040602 d!125955))

(declare-fun d!125957 () Bool)

(assert (=> d!125957 (= (validKeyInArray!0 (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558))) (and (not (= (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458558)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040600 d!125957))

(declare-fun d!125959 () Bool)

(assert (=> d!125959 (= (array_inv!24395 (_keys!11568 thiss!1427)) (bvsge (size!32075 (_keys!11568 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040605 d!125959))

(declare-fun d!125961 () Bool)

(assert (=> d!125961 (= (array_inv!24396 (_values!6344 thiss!1427)) (bvsge (size!32076 (_values!6344 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040605 d!125961))

(declare-fun d!125963 () Bool)

(declare-fun res!693695 () Bool)

(declare-fun e!589124 () Bool)

(assert (=> d!125963 (=> (not res!693695) (not e!589124))))

(declare-fun simpleValid!427 (LongMapFixedSize!5878) Bool)

(assert (=> d!125963 (= res!693695 (simpleValid!427 thiss!1427))))

(assert (=> d!125963 (= (valid!2221 thiss!1427) e!589124)))

(declare-fun b!1040724 () Bool)

(declare-fun res!693696 () Bool)

(assert (=> b!1040724 (=> (not res!693696) (not e!589124))))

(assert (=> b!1040724 (= res!693696 (= (arrayCountValidKeys!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 (size!32075 (_keys!11568 thiss!1427))) (_size!2994 thiss!1427)))))

(declare-fun b!1040725 () Bool)

(declare-fun res!693697 () Bool)

(assert (=> b!1040725 (=> (not res!693697) (not e!589124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65555 (_ BitVec 32)) Bool)

(assert (=> b!1040725 (= res!693697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11568 thiss!1427) (mask!30343 thiss!1427)))))

(declare-fun b!1040726 () Bool)

(assert (=> b!1040726 (= e!589124 (arrayNoDuplicates!0 (_keys!11568 thiss!1427) #b00000000000000000000000000000000 Nil!21931))))

(assert (= (and d!125963 res!693695) b!1040724))

(assert (= (and b!1040724 res!693696) b!1040725))

(assert (= (and b!1040725 res!693697) b!1040726))

(declare-fun m!960805 () Bool)

(assert (=> d!125963 m!960805))

(assert (=> b!1040724 m!960705))

(declare-fun m!960807 () Bool)

(assert (=> b!1040725 m!960807))

(assert (=> b!1040726 m!960693))

(assert (=> start!91216 d!125963))

(declare-fun d!125965 () Bool)

(declare-fun lt!458604 () SeekEntryResult!9737)

(assert (=> d!125965 (and (or ((_ is MissingVacant!9737) lt!458604) (not ((_ is Found!9737) lt!458604)) (and (bvsge (index!41320 lt!458604) #b00000000000000000000000000000000) (bvslt (index!41320 lt!458604) (size!32075 (_keys!11568 thiss!1427))))) (not ((_ is MissingVacant!9737) lt!458604)) (or (not ((_ is Found!9737) lt!458604)) (= (select (arr!31543 (_keys!11568 thiss!1427)) (index!41320 lt!458604)) key!909)))))

(declare-fun e!589132 () SeekEntryResult!9737)

(assert (=> d!125965 (= lt!458604 e!589132)))

(declare-fun c!105757 () Bool)

(declare-fun lt!458605 () SeekEntryResult!9737)

(assert (=> d!125965 (= c!105757 (and ((_ is Intermediate!9737) lt!458605) (undefined!10549 lt!458605)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65555 (_ BitVec 32)) SeekEntryResult!9737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125965 (= lt!458605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30343 thiss!1427)) key!909 (_keys!11568 thiss!1427) (mask!30343 thiss!1427)))))

(assert (=> d!125965 (validMask!0 (mask!30343 thiss!1427))))

(assert (=> d!125965 (= (seekEntry!0 key!909 (_keys!11568 thiss!1427) (mask!30343 thiss!1427)) lt!458604)))

(declare-fun b!1040739 () Bool)

(declare-fun e!589133 () SeekEntryResult!9737)

(assert (=> b!1040739 (= e!589133 (MissingZero!9737 (index!41321 lt!458605)))))

(declare-fun b!1040740 () Bool)

(declare-fun e!589131 () SeekEntryResult!9737)

(assert (=> b!1040740 (= e!589132 e!589131)))

(declare-fun lt!458606 () (_ BitVec 64))

(assert (=> b!1040740 (= lt!458606 (select (arr!31543 (_keys!11568 thiss!1427)) (index!41321 lt!458605)))))

(declare-fun c!105758 () Bool)

(assert (=> b!1040740 (= c!105758 (= lt!458606 key!909))))

(declare-fun b!1040741 () Bool)

(declare-fun c!105759 () Bool)

(assert (=> b!1040741 (= c!105759 (= lt!458606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040741 (= e!589131 e!589133)))

(declare-fun b!1040742 () Bool)

(assert (=> b!1040742 (= e!589131 (Found!9737 (index!41321 lt!458605)))))

(declare-fun b!1040743 () Bool)

(declare-fun lt!458607 () SeekEntryResult!9737)

(assert (=> b!1040743 (= e!589133 (ite ((_ is MissingVacant!9737) lt!458607) (MissingZero!9737 (index!41322 lt!458607)) lt!458607))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65555 (_ BitVec 32)) SeekEntryResult!9737)

(assert (=> b!1040743 (= lt!458607 (seekKeyOrZeroReturnVacant!0 (x!92735 lt!458605) (index!41321 lt!458605) (index!41321 lt!458605) key!909 (_keys!11568 thiss!1427) (mask!30343 thiss!1427)))))

(declare-fun b!1040744 () Bool)

(assert (=> b!1040744 (= e!589132 Undefined!9737)))

(assert (= (and d!125965 c!105757) b!1040744))

(assert (= (and d!125965 (not c!105757)) b!1040740))

(assert (= (and b!1040740 c!105758) b!1040742))

(assert (= (and b!1040740 (not c!105758)) b!1040741))

(assert (= (and b!1040741 c!105759) b!1040739))

(assert (= (and b!1040741 (not c!105759)) b!1040743))

(declare-fun m!960809 () Bool)

(assert (=> d!125965 m!960809))

(declare-fun m!960811 () Bool)

(assert (=> d!125965 m!960811))

(assert (=> d!125965 m!960811))

(declare-fun m!960813 () Bool)

(assert (=> d!125965 m!960813))

(assert (=> d!125965 m!960699))

(declare-fun m!960815 () Bool)

(assert (=> b!1040740 m!960815))

(declare-fun m!960817 () Bool)

(assert (=> b!1040743 m!960817))

(assert (=> b!1040598 d!125965))

(declare-fun b!1040751 () Bool)

(declare-fun e!589139 () Bool)

(assert (=> b!1040751 (= e!589139 tp_is_empty!24691)))

(declare-fun condMapEmpty!38605 () Bool)

(declare-fun mapDefault!38605 () ValueCell!11642)

(assert (=> mapNonEmpty!38596 (= condMapEmpty!38605 (= mapRest!38596 ((as const (Array (_ BitVec 32) ValueCell!11642)) mapDefault!38605)))))

(declare-fun e!589138 () Bool)

(declare-fun mapRes!38605 () Bool)

(assert (=> mapNonEmpty!38596 (= tp!74090 (and e!589138 mapRes!38605))))

(declare-fun b!1040752 () Bool)

(assert (=> b!1040752 (= e!589138 tp_is_empty!24691)))

(declare-fun mapNonEmpty!38605 () Bool)

(declare-fun tp!74105 () Bool)

(assert (=> mapNonEmpty!38605 (= mapRes!38605 (and tp!74105 e!589139))))

(declare-fun mapValue!38605 () ValueCell!11642)

(declare-fun mapKey!38605 () (_ BitVec 32))

(declare-fun mapRest!38605 () (Array (_ BitVec 32) ValueCell!11642))

(assert (=> mapNonEmpty!38605 (= mapRest!38596 (store mapRest!38605 mapKey!38605 mapValue!38605))))

(declare-fun mapIsEmpty!38605 () Bool)

(assert (=> mapIsEmpty!38605 mapRes!38605))

(assert (= (and mapNonEmpty!38596 condMapEmpty!38605) mapIsEmpty!38605))

(assert (= (and mapNonEmpty!38596 (not condMapEmpty!38605)) mapNonEmpty!38605))

(assert (= (and mapNonEmpty!38605 ((_ is ValueCellFull!11642) mapValue!38605)) b!1040751))

(assert (= (and mapNonEmpty!38596 ((_ is ValueCellFull!11642) mapDefault!38605)) b!1040752))

(declare-fun m!960819 () Bool)

(assert (=> mapNonEmpty!38605 m!960819))

(check-sat (not b!1040724) tp_is_empty!24691 (not b!1040695) (not d!125965) (not bm!44057) b_and!33513 (not bm!44055) (not b!1040699) (not d!125963) (not b!1040715) (not bm!44056) (not b!1040694) (not b!1040680) (not mapNonEmpty!38605) (not b!1040743) (not b!1040710) (not b!1040669) (not b!1040712) (not b!1040714) (not d!125943) (not b!1040726) (not b_next!20971) (not b!1040725) (not bm!44052) (not b!1040709) (not b!1040693) (not d!125953) (not b!1040716))
(check-sat b_and!33513 (not b_next!20971))
