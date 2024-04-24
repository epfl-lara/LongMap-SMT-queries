; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91242 () Bool)

(assert start!91242)

(declare-fun b!1040775 () Bool)

(declare-fun b_free!20977 () Bool)

(declare-fun b_next!20977 () Bool)

(assert (=> b!1040775 (= b_free!20977 (not b_next!20977))))

(declare-fun tp!74111 () Bool)

(declare-fun b_and!33519 () Bool)

(assert (=> b!1040775 (= tp!74111 b_and!33519)))

(declare-fun e!589158 () Bool)

(declare-datatypes ((V!37803 0))(
  ( (V!37804 (val!12399 Int)) )
))
(declare-datatypes ((ValueCell!11645 0))(
  ( (ValueCellFull!11645 (v!14982 V!37803)) (EmptyCell!11645) )
))
(declare-datatypes ((array!65569 0))(
  ( (array!65570 (arr!31549 (Array (_ BitVec 32) (_ BitVec 64))) (size!32081 (_ BitVec 32))) )
))
(declare-datatypes ((array!65571 0))(
  ( (array!65572 (arr!31550 (Array (_ BitVec 32) ValueCell!11645)) (size!32082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5884 0))(
  ( (LongMapFixedSize!5885 (defaultEntry!6324 Int) (mask!30350 (_ BitVec 32)) (extraKeys!6052 (_ BitVec 32)) (zeroValue!6158 V!37803) (minValue!6158 V!37803) (_size!2997 (_ BitVec 32)) (_keys!11572 array!65569) (_values!6347 array!65571) (_vacant!2997 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5884)

(declare-fun e!589160 () Bool)

(declare-fun tp_is_empty!24697 () Bool)

(declare-fun array_inv!24397 (array!65569) Bool)

(declare-fun array_inv!24398 (array!65571) Bool)

(assert (=> b!1040775 (= e!589158 (and tp!74111 tp_is_empty!24697 (array_inv!24397 (_keys!11572 thiss!1427)) (array_inv!24398 (_values!6347 thiss!1427)) e!589160))))

(declare-fun b!1040776 () Bool)

(declare-fun res!693714 () Bool)

(declare-fun e!589161 () Bool)

(assert (=> b!1040776 (=> res!693714 e!589161)))

(declare-datatypes ((List!21935 0))(
  ( (Nil!21932) (Cons!21931 (h!23144 (_ BitVec 64)) (t!31141 List!21935)) )
))
(declare-fun arrayNoDuplicates!0 (array!65569 (_ BitVec 32) List!21935) Bool)

(assert (=> b!1040776 (= res!693714 (not (arrayNoDuplicates!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 Nil!21932)))))

(declare-fun b!1040777 () Bool)

(declare-fun e!589162 () Bool)

(declare-fun mapRes!38608 () Bool)

(assert (=> b!1040777 (= e!589160 (and e!589162 mapRes!38608))))

(declare-fun condMapEmpty!38608 () Bool)

(declare-fun mapDefault!38608 () ValueCell!11645)

(assert (=> b!1040777 (= condMapEmpty!38608 (= (arr!31550 (_values!6347 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11645)) mapDefault!38608)))))

(declare-fun mapNonEmpty!38608 () Bool)

(declare-fun tp!74110 () Bool)

(declare-fun e!589159 () Bool)

(assert (=> mapNonEmpty!38608 (= mapRes!38608 (and tp!74110 e!589159))))

(declare-fun mapKey!38608 () (_ BitVec 32))

(declare-fun mapValue!38608 () ValueCell!11645)

(declare-fun mapRest!38608 () (Array (_ BitVec 32) ValueCell!11645))

(assert (=> mapNonEmpty!38608 (= (arr!31550 (_values!6347 thiss!1427)) (store mapRest!38608 mapKey!38608 mapValue!38608))))

(declare-fun res!693713 () Bool)

(declare-fun e!589157 () Bool)

(assert (=> start!91242 (=> (not res!693713) (not e!589157))))

(declare-fun valid!2222 (LongMapFixedSize!5884) Bool)

(assert (=> start!91242 (= res!693713 (valid!2222 thiss!1427))))

(assert (=> start!91242 e!589157))

(assert (=> start!91242 e!589158))

(assert (=> start!91242 true))

(declare-fun b!1040778 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65569 (_ BitVec 32)) Bool)

(assert (=> b!1040778 (= e!589161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040779 () Bool)

(declare-fun e!589156 () Bool)

(assert (=> b!1040779 (= e!589157 e!589156)))

(declare-fun res!693712 () Bool)

(assert (=> b!1040779 (=> (not res!693712) (not e!589156))))

(declare-datatypes ((SeekEntryResult!9738 0))(
  ( (MissingZero!9738 (index!41323 (_ BitVec 32))) (Found!9738 (index!41324 (_ BitVec 32))) (Intermediate!9738 (undefined!10550 Bool) (index!41325 (_ BitVec 32)) (x!92752 (_ BitVec 32))) (Undefined!9738) (MissingVacant!9738 (index!41326 (_ BitVec 32))) )
))
(declare-fun lt!458619 () SeekEntryResult!9738)

(get-info :version)

(assert (=> b!1040779 (= res!693712 ((_ is Found!9738) lt!458619))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65569 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1040779 (= lt!458619 (seekEntry!0 key!909 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun mapIsEmpty!38608 () Bool)

(assert (=> mapIsEmpty!38608 mapRes!38608))

(declare-fun b!1040780 () Bool)

(declare-fun res!693716 () Bool)

(assert (=> b!1040780 (=> res!693716 e!589161)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040780 (= res!693716 (not (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619)))))))

(declare-fun b!1040781 () Bool)

(assert (=> b!1040781 (= e!589162 tp_is_empty!24697)))

(declare-fun b!1040782 () Bool)

(assert (=> b!1040782 (= e!589156 (not e!589161))))

(declare-fun res!693717 () Bool)

(assert (=> b!1040782 (=> res!693717 e!589161)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040782 (= res!693717 (not (validMask!0 (mask!30350 thiss!1427))))))

(declare-fun lt!458617 () array!65569)

(assert (=> b!1040782 (arrayNoDuplicates!0 lt!458617 #b00000000000000000000000000000000 Nil!21932)))

(declare-datatypes ((Unit!33997 0))(
  ( (Unit!33998) )
))
(declare-fun lt!458616 () Unit!33997)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21935) Unit!33997)

(assert (=> b!1040782 (= lt!458616 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11572 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41324 lt!458619) #b00000000000000000000000000000000 Nil!21932))))

(declare-fun arrayCountValidKeys!0 (array!65569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040782 (= (arrayCountValidKeys!0 lt!458617 #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040782 (= lt!458617 (array!65570 (store (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11572 thiss!1427))))))

(declare-fun lt!458618 () Unit!33997)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65569 (_ BitVec 32) (_ BitVec 64)) Unit!33997)

(assert (=> b!1040782 (= lt!458618 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11572 thiss!1427) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040783 () Bool)

(assert (=> b!1040783 (= e!589159 tp_is_empty!24697)))

(declare-fun b!1040784 () Bool)

(declare-fun res!693715 () Bool)

(assert (=> b!1040784 (=> (not res!693715) (not e!589157))))

(assert (=> b!1040784 (= res!693715 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040785 () Bool)

(declare-fun res!693718 () Bool)

(assert (=> b!1040785 (=> res!693718 e!589161)))

(assert (=> b!1040785 (= res!693718 (or (not (= (size!32081 (_keys!11572 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30350 thiss!1427)))) (bvslt (index!41324 lt!458619) #b00000000000000000000000000000000) (bvsge (index!41324 lt!458619) (size!32081 (_keys!11572 thiss!1427)))))))

(assert (= (and start!91242 res!693713) b!1040784))

(assert (= (and b!1040784 res!693715) b!1040779))

(assert (= (and b!1040779 res!693712) b!1040782))

(assert (= (and b!1040782 (not res!693717)) b!1040785))

(assert (= (and b!1040785 (not res!693718)) b!1040780))

(assert (= (and b!1040780 (not res!693716)) b!1040776))

(assert (= (and b!1040776 (not res!693714)) b!1040778))

(assert (= (and b!1040777 condMapEmpty!38608) mapIsEmpty!38608))

(assert (= (and b!1040777 (not condMapEmpty!38608)) mapNonEmpty!38608))

(assert (= (and mapNonEmpty!38608 ((_ is ValueCellFull!11645) mapValue!38608)) b!1040783))

(assert (= (and b!1040777 ((_ is ValueCellFull!11645) mapDefault!38608)) b!1040781))

(assert (= b!1040775 b!1040777))

(assert (= start!91242 b!1040775))

(declare-fun m!960821 () Bool)

(assert (=> b!1040775 m!960821))

(declare-fun m!960823 () Bool)

(assert (=> b!1040775 m!960823))

(declare-fun m!960825 () Bool)

(assert (=> b!1040778 m!960825))

(declare-fun m!960827 () Bool)

(assert (=> start!91242 m!960827))

(declare-fun m!960829 () Bool)

(assert (=> mapNonEmpty!38608 m!960829))

(declare-fun m!960831 () Bool)

(assert (=> b!1040776 m!960831))

(declare-fun m!960833 () Bool)

(assert (=> b!1040780 m!960833))

(assert (=> b!1040780 m!960833))

(declare-fun m!960835 () Bool)

(assert (=> b!1040780 m!960835))

(declare-fun m!960837 () Bool)

(assert (=> b!1040779 m!960837))

(declare-fun m!960839 () Bool)

(assert (=> b!1040782 m!960839))

(declare-fun m!960841 () Bool)

(assert (=> b!1040782 m!960841))

(declare-fun m!960843 () Bool)

(assert (=> b!1040782 m!960843))

(declare-fun m!960845 () Bool)

(assert (=> b!1040782 m!960845))

(declare-fun m!960847 () Bool)

(assert (=> b!1040782 m!960847))

(declare-fun m!960849 () Bool)

(assert (=> b!1040782 m!960849))

(declare-fun m!960851 () Bool)

(assert (=> b!1040782 m!960851))

(check-sat (not start!91242) (not b_next!20977) (not b!1040780) (not b!1040775) tp_is_empty!24697 (not b!1040779) (not b!1040778) (not b!1040776) (not b!1040782) b_and!33519 (not mapNonEmpty!38608))
(check-sat b_and!33519 (not b_next!20977))
(get-model)

(declare-fun b!1040862 () Bool)

(declare-fun e!589222 () Bool)

(declare-fun e!589223 () Bool)

(assert (=> b!1040862 (= e!589222 e!589223)))

(declare-fun res!693768 () Bool)

(assert (=> b!1040862 (=> (not res!693768) (not e!589223))))

(declare-fun e!589220 () Bool)

(assert (=> b!1040862 (= res!693768 (not e!589220))))

(declare-fun res!693769 () Bool)

(assert (=> b!1040862 (=> (not res!693769) (not e!589220))))

(assert (=> b!1040862 (= res!693769 (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040863 () Bool)

(declare-fun e!589221 () Bool)

(assert (=> b!1040863 (= e!589223 e!589221)))

(declare-fun c!105762 () Bool)

(assert (=> b!1040863 (= c!105762 (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125969 () Bool)

(declare-fun res!693767 () Bool)

(assert (=> d!125969 (=> res!693767 e!589222)))

(assert (=> d!125969 (= res!693767 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))))))

(assert (=> d!125969 (= (arrayNoDuplicates!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 Nil!21932) e!589222)))

(declare-fun b!1040864 () Bool)

(declare-fun contains!6070 (List!21935 (_ BitVec 64)) Bool)

(assert (=> b!1040864 (= e!589220 (contains!6070 Nil!21932 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44060 () Bool)

(declare-fun call!44063 () Bool)

(assert (=> bm!44060 (= call!44063 (arrayNoDuplicates!0 (_keys!11572 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105762 (Cons!21931 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000) Nil!21932) Nil!21932)))))

(declare-fun b!1040865 () Bool)

(assert (=> b!1040865 (= e!589221 call!44063)))

(declare-fun b!1040866 () Bool)

(assert (=> b!1040866 (= e!589221 call!44063)))

(assert (= (and d!125969 (not res!693767)) b!1040862))

(assert (= (and b!1040862 res!693769) b!1040864))

(assert (= (and b!1040862 res!693768) b!1040863))

(assert (= (and b!1040863 c!105762) b!1040866))

(assert (= (and b!1040863 (not c!105762)) b!1040865))

(assert (= (or b!1040866 b!1040865) bm!44060))

(declare-fun m!960917 () Bool)

(assert (=> b!1040862 m!960917))

(assert (=> b!1040862 m!960917))

(declare-fun m!960919 () Bool)

(assert (=> b!1040862 m!960919))

(assert (=> b!1040863 m!960917))

(assert (=> b!1040863 m!960917))

(assert (=> b!1040863 m!960919))

(assert (=> b!1040864 m!960917))

(assert (=> b!1040864 m!960917))

(declare-fun m!960921 () Bool)

(assert (=> b!1040864 m!960921))

(assert (=> bm!44060 m!960917))

(declare-fun m!960923 () Bool)

(assert (=> bm!44060 m!960923))

(assert (=> b!1040776 d!125969))

(declare-fun d!125971 () Bool)

(assert (=> d!125971 (= (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619))) (and (not (= (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040780 d!125971))

(declare-fun d!125973 () Bool)

(declare-fun res!693776 () Bool)

(declare-fun e!589226 () Bool)

(assert (=> d!125973 (=> (not res!693776) (not e!589226))))

(declare-fun simpleValid!428 (LongMapFixedSize!5884) Bool)

(assert (=> d!125973 (= res!693776 (simpleValid!428 thiss!1427))))

(assert (=> d!125973 (= (valid!2222 thiss!1427) e!589226)))

(declare-fun b!1040873 () Bool)

(declare-fun res!693777 () Bool)

(assert (=> b!1040873 (=> (not res!693777) (not e!589226))))

(assert (=> b!1040873 (= res!693777 (= (arrayCountValidKeys!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) (_size!2997 thiss!1427)))))

(declare-fun b!1040874 () Bool)

(declare-fun res!693778 () Bool)

(assert (=> b!1040874 (=> (not res!693778) (not e!589226))))

(assert (=> b!1040874 (= res!693778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040875 () Bool)

(assert (=> b!1040875 (= e!589226 (arrayNoDuplicates!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 Nil!21932))))

(assert (= (and d!125973 res!693776) b!1040873))

(assert (= (and b!1040873 res!693777) b!1040874))

(assert (= (and b!1040874 res!693778) b!1040875))

(declare-fun m!960925 () Bool)

(assert (=> d!125973 m!960925))

(assert (=> b!1040873 m!960847))

(assert (=> b!1040874 m!960825))

(assert (=> b!1040875 m!960831))

(assert (=> start!91242 d!125973))

(declare-fun b!1040888 () Bool)

(declare-fun e!589234 () SeekEntryResult!9738)

(declare-fun lt!458652 () SeekEntryResult!9738)

(assert (=> b!1040888 (= e!589234 (MissingZero!9738 (index!41325 lt!458652)))))

(declare-fun b!1040889 () Bool)

(declare-fun c!105771 () Bool)

(declare-fun lt!458655 () (_ BitVec 64))

(assert (=> b!1040889 (= c!105771 (= lt!458655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589235 () SeekEntryResult!9738)

(assert (=> b!1040889 (= e!589235 e!589234)))

(declare-fun b!1040891 () Bool)

(assert (=> b!1040891 (= e!589235 (Found!9738 (index!41325 lt!458652)))))

(declare-fun b!1040892 () Bool)

(declare-fun lt!458653 () SeekEntryResult!9738)

(assert (=> b!1040892 (= e!589234 (ite ((_ is MissingVacant!9738) lt!458653) (MissingZero!9738 (index!41326 lt!458653)) lt!458653))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65569 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1040892 (= lt!458653 (seekKeyOrZeroReturnVacant!0 (x!92752 lt!458652) (index!41325 lt!458652) (index!41325 lt!458652) key!909 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040893 () Bool)

(declare-fun e!589233 () SeekEntryResult!9738)

(assert (=> b!1040893 (= e!589233 e!589235)))

(assert (=> b!1040893 (= lt!458655 (select (arr!31549 (_keys!11572 thiss!1427)) (index!41325 lt!458652)))))

(declare-fun c!105769 () Bool)

(assert (=> b!1040893 (= c!105769 (= lt!458655 key!909))))

(declare-fun d!125975 () Bool)

(declare-fun lt!458654 () SeekEntryResult!9738)

(assert (=> d!125975 (and (or ((_ is MissingVacant!9738) lt!458654) (not ((_ is Found!9738) lt!458654)) (and (bvsge (index!41324 lt!458654) #b00000000000000000000000000000000) (bvslt (index!41324 lt!458654) (size!32081 (_keys!11572 thiss!1427))))) (not ((_ is MissingVacant!9738) lt!458654)) (or (not ((_ is Found!9738) lt!458654)) (= (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458654)) key!909)))))

(assert (=> d!125975 (= lt!458654 e!589233)))

(declare-fun c!105770 () Bool)

(assert (=> d!125975 (= c!105770 (and ((_ is Intermediate!9738) lt!458652) (undefined!10550 lt!458652)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65569 (_ BitVec 32)) SeekEntryResult!9738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125975 (= lt!458652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30350 thiss!1427)) key!909 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(assert (=> d!125975 (validMask!0 (mask!30350 thiss!1427))))

(assert (=> d!125975 (= (seekEntry!0 key!909 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)) lt!458654)))

(declare-fun b!1040890 () Bool)

(assert (=> b!1040890 (= e!589233 Undefined!9738)))

(assert (= (and d!125975 c!105770) b!1040890))

(assert (= (and d!125975 (not c!105770)) b!1040893))

(assert (= (and b!1040893 c!105769) b!1040891))

(assert (= (and b!1040893 (not c!105769)) b!1040889))

(assert (= (and b!1040889 c!105771) b!1040888))

(assert (= (and b!1040889 (not c!105771)) b!1040892))

(declare-fun m!960927 () Bool)

(assert (=> b!1040892 m!960927))

(declare-fun m!960929 () Bool)

(assert (=> b!1040893 m!960929))

(declare-fun m!960931 () Bool)

(assert (=> d!125975 m!960931))

(declare-fun m!960933 () Bool)

(assert (=> d!125975 m!960933))

(assert (=> d!125975 m!960933))

(declare-fun m!960935 () Bool)

(assert (=> d!125975 m!960935))

(assert (=> d!125975 m!960839))

(assert (=> b!1040779 d!125975))

(declare-fun d!125977 () Bool)

(assert (=> d!125977 (= (array_inv!24397 (_keys!11572 thiss!1427)) (bvsge (size!32081 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040775 d!125977))

(declare-fun d!125979 () Bool)

(assert (=> d!125979 (= (array_inv!24398 (_values!6347 thiss!1427)) (bvsge (size!32082 (_values!6347 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040775 d!125979))

(declare-fun b!1040894 () Bool)

(declare-fun e!589238 () Bool)

(declare-fun e!589239 () Bool)

(assert (=> b!1040894 (= e!589238 e!589239)))

(declare-fun res!693780 () Bool)

(assert (=> b!1040894 (=> (not res!693780) (not e!589239))))

(declare-fun e!589236 () Bool)

(assert (=> b!1040894 (= res!693780 (not e!589236))))

(declare-fun res!693781 () Bool)

(assert (=> b!1040894 (=> (not res!693781) (not e!589236))))

(assert (=> b!1040894 (= res!693781 (validKeyInArray!0 (select (arr!31549 lt!458617) #b00000000000000000000000000000000)))))

(declare-fun b!1040895 () Bool)

(declare-fun e!589237 () Bool)

(assert (=> b!1040895 (= e!589239 e!589237)))

(declare-fun c!105772 () Bool)

(assert (=> b!1040895 (= c!105772 (validKeyInArray!0 (select (arr!31549 lt!458617) #b00000000000000000000000000000000)))))

(declare-fun d!125981 () Bool)

(declare-fun res!693779 () Bool)

(assert (=> d!125981 (=> res!693779 e!589238)))

(assert (=> d!125981 (= res!693779 (bvsge #b00000000000000000000000000000000 (size!32081 lt!458617)))))

(assert (=> d!125981 (= (arrayNoDuplicates!0 lt!458617 #b00000000000000000000000000000000 Nil!21932) e!589238)))

(declare-fun b!1040896 () Bool)

(assert (=> b!1040896 (= e!589236 (contains!6070 Nil!21932 (select (arr!31549 lt!458617) #b00000000000000000000000000000000)))))

(declare-fun bm!44061 () Bool)

(declare-fun call!44064 () Bool)

(assert (=> bm!44061 (= call!44064 (arrayNoDuplicates!0 lt!458617 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105772 (Cons!21931 (select (arr!31549 lt!458617) #b00000000000000000000000000000000) Nil!21932) Nil!21932)))))

(declare-fun b!1040897 () Bool)

(assert (=> b!1040897 (= e!589237 call!44064)))

(declare-fun b!1040898 () Bool)

(assert (=> b!1040898 (= e!589237 call!44064)))

(assert (= (and d!125981 (not res!693779)) b!1040894))

(assert (= (and b!1040894 res!693781) b!1040896))

(assert (= (and b!1040894 res!693780) b!1040895))

(assert (= (and b!1040895 c!105772) b!1040898))

(assert (= (and b!1040895 (not c!105772)) b!1040897))

(assert (= (or b!1040898 b!1040897) bm!44061))

(declare-fun m!960937 () Bool)

(assert (=> b!1040894 m!960937))

(assert (=> b!1040894 m!960937))

(declare-fun m!960939 () Bool)

(assert (=> b!1040894 m!960939))

(assert (=> b!1040895 m!960937))

(assert (=> b!1040895 m!960937))

(assert (=> b!1040895 m!960939))

(assert (=> b!1040896 m!960937))

(assert (=> b!1040896 m!960937))

(declare-fun m!960941 () Bool)

(assert (=> b!1040896 m!960941))

(assert (=> bm!44061 m!960937))

(declare-fun m!960943 () Bool)

(assert (=> bm!44061 m!960943))

(assert (=> b!1040782 d!125981))

(declare-fun d!125983 () Bool)

(declare-fun e!589244 () Bool)

(assert (=> d!125983 e!589244))

(declare-fun res!693792 () Bool)

(assert (=> d!125983 (=> (not res!693792) (not e!589244))))

(assert (=> d!125983 (= res!693792 (and (bvsge (index!41324 lt!458619) #b00000000000000000000000000000000) (bvslt (index!41324 lt!458619) (size!32081 (_keys!11572 thiss!1427)))))))

(declare-fun lt!458658 () Unit!33997)

(declare-fun choose!82 (array!65569 (_ BitVec 32) (_ BitVec 64)) Unit!33997)

(assert (=> d!125983 (= lt!458658 (choose!82 (_keys!11572 thiss!1427) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589245 () Bool)

(assert (=> d!125983 e!589245))

(declare-fun res!693791 () Bool)

(assert (=> d!125983 (=> (not res!693791) (not e!589245))))

(assert (=> d!125983 (= res!693791 (and (bvsge (index!41324 lt!458619) #b00000000000000000000000000000000) (bvslt (index!41324 lt!458619) (size!32081 (_keys!11572 thiss!1427)))))))

(assert (=> d!125983 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11572 thiss!1427) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458658)))

(declare-fun b!1040907 () Bool)

(declare-fun res!693793 () Bool)

(assert (=> b!1040907 (=> (not res!693793) (not e!589245))))

(assert (=> b!1040907 (= res!693793 (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619))))))

(declare-fun b!1040909 () Bool)

(assert (=> b!1040909 (= e!589245 (bvslt (size!32081 (_keys!11572 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040910 () Bool)

(assert (=> b!1040910 (= e!589244 (= (arrayCountValidKeys!0 (array!65570 (store (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11572 thiss!1427))) #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040908 () Bool)

(declare-fun res!693790 () Bool)

(assert (=> b!1040908 (=> (not res!693790) (not e!589245))))

(assert (=> b!1040908 (= res!693790 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125983 res!693791) b!1040907))

(assert (= (and b!1040907 res!693793) b!1040908))

(assert (= (and b!1040908 res!693790) b!1040909))

(assert (= (and d!125983 res!693792) b!1040910))

(declare-fun m!960945 () Bool)

(assert (=> d!125983 m!960945))

(assert (=> b!1040907 m!960833))

(assert (=> b!1040907 m!960833))

(assert (=> b!1040907 m!960835))

(assert (=> b!1040910 m!960845))

(declare-fun m!960947 () Bool)

(assert (=> b!1040910 m!960947))

(assert (=> b!1040910 m!960847))

(declare-fun m!960949 () Bool)

(assert (=> b!1040908 m!960949))

(assert (=> b!1040782 d!125983))

(declare-fun b!1040919 () Bool)

(declare-fun e!589250 () (_ BitVec 32))

(assert (=> b!1040919 (= e!589250 #b00000000000000000000000000000000)))

(declare-fun b!1040920 () Bool)

(declare-fun e!589251 () (_ BitVec 32))

(declare-fun call!44067 () (_ BitVec 32))

(assert (=> b!1040920 (= e!589251 call!44067)))

(declare-fun b!1040921 () Bool)

(assert (=> b!1040921 (= e!589251 (bvadd #b00000000000000000000000000000001 call!44067))))

(declare-fun d!125985 () Bool)

(declare-fun lt!458661 () (_ BitVec 32))

(assert (=> d!125985 (and (bvsge lt!458661 #b00000000000000000000000000000000) (bvsle lt!458661 (bvsub (size!32081 lt!458617) #b00000000000000000000000000000000)))))

(assert (=> d!125985 (= lt!458661 e!589250)))

(declare-fun c!105777 () Bool)

(assert (=> d!125985 (= c!105777 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))))))

(assert (=> d!125985 (and (bvsle #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11572 thiss!1427)) (size!32081 lt!458617)))))

(assert (=> d!125985 (= (arrayCountValidKeys!0 lt!458617 #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) lt!458661)))

(declare-fun b!1040922 () Bool)

(assert (=> b!1040922 (= e!589250 e!589251)))

(declare-fun c!105778 () Bool)

(assert (=> b!1040922 (= c!105778 (validKeyInArray!0 (select (arr!31549 lt!458617) #b00000000000000000000000000000000)))))

(declare-fun bm!44064 () Bool)

(assert (=> bm!44064 (= call!44067 (arrayCountValidKeys!0 lt!458617 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11572 thiss!1427))))))

(assert (= (and d!125985 c!105777) b!1040919))

(assert (= (and d!125985 (not c!105777)) b!1040922))

(assert (= (and b!1040922 c!105778) b!1040921))

(assert (= (and b!1040922 (not c!105778)) b!1040920))

(assert (= (or b!1040921 b!1040920) bm!44064))

(assert (=> b!1040922 m!960937))

(assert (=> b!1040922 m!960937))

(assert (=> b!1040922 m!960939))

(declare-fun m!960951 () Bool)

(assert (=> bm!44064 m!960951))

(assert (=> b!1040782 d!125985))

(declare-fun d!125987 () Bool)

(assert (=> d!125987 (= (validMask!0 (mask!30350 thiss!1427)) (and (or (= (mask!30350 thiss!1427) #b00000000000000000000000000000111) (= (mask!30350 thiss!1427) #b00000000000000000000000000001111) (= (mask!30350 thiss!1427) #b00000000000000000000000000011111) (= (mask!30350 thiss!1427) #b00000000000000000000000000111111) (= (mask!30350 thiss!1427) #b00000000000000000000000001111111) (= (mask!30350 thiss!1427) #b00000000000000000000000011111111) (= (mask!30350 thiss!1427) #b00000000000000000000000111111111) (= (mask!30350 thiss!1427) #b00000000000000000000001111111111) (= (mask!30350 thiss!1427) #b00000000000000000000011111111111) (= (mask!30350 thiss!1427) #b00000000000000000000111111111111) (= (mask!30350 thiss!1427) #b00000000000000000001111111111111) (= (mask!30350 thiss!1427) #b00000000000000000011111111111111) (= (mask!30350 thiss!1427) #b00000000000000000111111111111111) (= (mask!30350 thiss!1427) #b00000000000000001111111111111111) (= (mask!30350 thiss!1427) #b00000000000000011111111111111111) (= (mask!30350 thiss!1427) #b00000000000000111111111111111111) (= (mask!30350 thiss!1427) #b00000000000001111111111111111111) (= (mask!30350 thiss!1427) #b00000000000011111111111111111111) (= (mask!30350 thiss!1427) #b00000000000111111111111111111111) (= (mask!30350 thiss!1427) #b00000000001111111111111111111111) (= (mask!30350 thiss!1427) #b00000000011111111111111111111111) (= (mask!30350 thiss!1427) #b00000000111111111111111111111111) (= (mask!30350 thiss!1427) #b00000001111111111111111111111111) (= (mask!30350 thiss!1427) #b00000011111111111111111111111111) (= (mask!30350 thiss!1427) #b00000111111111111111111111111111) (= (mask!30350 thiss!1427) #b00001111111111111111111111111111) (= (mask!30350 thiss!1427) #b00011111111111111111111111111111) (= (mask!30350 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30350 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040782 d!125987))

(declare-fun d!125989 () Bool)

(declare-fun e!589254 () Bool)

(assert (=> d!125989 e!589254))

(declare-fun res!693796 () Bool)

(assert (=> d!125989 (=> (not res!693796) (not e!589254))))

(assert (=> d!125989 (= res!693796 (and (bvsge (index!41324 lt!458619) #b00000000000000000000000000000000) (bvslt (index!41324 lt!458619) (size!32081 (_keys!11572 thiss!1427)))))))

(declare-fun lt!458664 () Unit!33997)

(declare-fun choose!53 (array!65569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21935) Unit!33997)

(assert (=> d!125989 (= lt!458664 (choose!53 (_keys!11572 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41324 lt!458619) #b00000000000000000000000000000000 Nil!21932))))

(assert (=> d!125989 (bvslt (size!32081 (_keys!11572 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125989 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11572 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41324 lt!458619) #b00000000000000000000000000000000 Nil!21932) lt!458664)))

(declare-fun b!1040925 () Bool)

(assert (=> b!1040925 (= e!589254 (arrayNoDuplicates!0 (array!65570 (store (arr!31549 (_keys!11572 thiss!1427)) (index!41324 lt!458619) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32081 (_keys!11572 thiss!1427))) #b00000000000000000000000000000000 Nil!21932))))

(assert (= (and d!125989 res!693796) b!1040925))

(declare-fun m!960953 () Bool)

(assert (=> d!125989 m!960953))

(assert (=> b!1040925 m!960845))

(declare-fun m!960955 () Bool)

(assert (=> b!1040925 m!960955))

(assert (=> b!1040782 d!125989))

(declare-fun b!1040926 () Bool)

(declare-fun e!589255 () (_ BitVec 32))

(assert (=> b!1040926 (= e!589255 #b00000000000000000000000000000000)))

(declare-fun b!1040927 () Bool)

(declare-fun e!589256 () (_ BitVec 32))

(declare-fun call!44068 () (_ BitVec 32))

(assert (=> b!1040927 (= e!589256 call!44068)))

(declare-fun b!1040928 () Bool)

(assert (=> b!1040928 (= e!589256 (bvadd #b00000000000000000000000000000001 call!44068))))

(declare-fun d!125991 () Bool)

(declare-fun lt!458665 () (_ BitVec 32))

(assert (=> d!125991 (and (bvsge lt!458665 #b00000000000000000000000000000000) (bvsle lt!458665 (bvsub (size!32081 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125991 (= lt!458665 e!589255)))

(declare-fun c!105779 () Bool)

(assert (=> d!125991 (= c!105779 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))))))

(assert (=> d!125991 (and (bvsle #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32081 (_keys!11572 thiss!1427)) (size!32081 (_keys!11572 thiss!1427))))))

(assert (=> d!125991 (= (arrayCountValidKeys!0 (_keys!11572 thiss!1427) #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))) lt!458665)))

(declare-fun b!1040929 () Bool)

(assert (=> b!1040929 (= e!589255 e!589256)))

(declare-fun c!105780 () Bool)

(assert (=> b!1040929 (= c!105780 (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44065 () Bool)

(assert (=> bm!44065 (= call!44068 (arrayCountValidKeys!0 (_keys!11572 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32081 (_keys!11572 thiss!1427))))))

(assert (= (and d!125991 c!105779) b!1040926))

(assert (= (and d!125991 (not c!105779)) b!1040929))

(assert (= (and b!1040929 c!105780) b!1040928))

(assert (= (and b!1040929 (not c!105780)) b!1040927))

(assert (= (or b!1040928 b!1040927) bm!44065))

(assert (=> b!1040929 m!960917))

(assert (=> b!1040929 m!960917))

(assert (=> b!1040929 m!960919))

(declare-fun m!960957 () Bool)

(assert (=> bm!44065 m!960957))

(assert (=> b!1040782 d!125991))

(declare-fun b!1040938 () Bool)

(declare-fun e!589264 () Bool)

(declare-fun e!589263 () Bool)

(assert (=> b!1040938 (= e!589264 e!589263)))

(declare-fun c!105783 () Bool)

(assert (=> b!1040938 (= c!105783 (validKeyInArray!0 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44068 () Bool)

(declare-fun call!44071 () Bool)

(assert (=> bm!44068 (= call!44071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11572 thiss!1427) (mask!30350 thiss!1427)))))

(declare-fun b!1040939 () Bool)

(declare-fun e!589265 () Bool)

(assert (=> b!1040939 (= e!589265 call!44071)))

(declare-fun b!1040940 () Bool)

(assert (=> b!1040940 (= e!589263 call!44071)))

(declare-fun b!1040941 () Bool)

(assert (=> b!1040941 (= e!589263 e!589265)))

(declare-fun lt!458672 () (_ BitVec 64))

(assert (=> b!1040941 (= lt!458672 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458673 () Unit!33997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65569 (_ BitVec 64) (_ BitVec 32)) Unit!33997)

(assert (=> b!1040941 (= lt!458673 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11572 thiss!1427) lt!458672 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040941 (arrayContainsKey!0 (_keys!11572 thiss!1427) lt!458672 #b00000000000000000000000000000000)))

(declare-fun lt!458674 () Unit!33997)

(assert (=> b!1040941 (= lt!458674 lt!458673)))

(declare-fun res!693801 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65569 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1040941 (= res!693801 (= (seekEntryOrOpen!0 (select (arr!31549 (_keys!11572 thiss!1427)) #b00000000000000000000000000000000) (_keys!11572 thiss!1427) (mask!30350 thiss!1427)) (Found!9738 #b00000000000000000000000000000000)))))

(assert (=> b!1040941 (=> (not res!693801) (not e!589265))))

(declare-fun d!125993 () Bool)

(declare-fun res!693802 () Bool)

(assert (=> d!125993 (=> res!693802 e!589264)))

(assert (=> d!125993 (= res!693802 (bvsge #b00000000000000000000000000000000 (size!32081 (_keys!11572 thiss!1427))))))

(assert (=> d!125993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11572 thiss!1427) (mask!30350 thiss!1427)) e!589264)))

(assert (= (and d!125993 (not res!693802)) b!1040938))

(assert (= (and b!1040938 c!105783) b!1040941))

(assert (= (and b!1040938 (not c!105783)) b!1040940))

(assert (= (and b!1040941 res!693801) b!1040939))

(assert (= (or b!1040939 b!1040940) bm!44068))

(assert (=> b!1040938 m!960917))

(assert (=> b!1040938 m!960917))

(assert (=> b!1040938 m!960919))

(declare-fun m!960959 () Bool)

(assert (=> bm!44068 m!960959))

(assert (=> b!1040941 m!960917))

(declare-fun m!960961 () Bool)

(assert (=> b!1040941 m!960961))

(declare-fun m!960963 () Bool)

(assert (=> b!1040941 m!960963))

(assert (=> b!1040941 m!960917))

(declare-fun m!960965 () Bool)

(assert (=> b!1040941 m!960965))

(assert (=> b!1040778 d!125993))

(declare-fun condMapEmpty!38617 () Bool)

(declare-fun mapDefault!38617 () ValueCell!11645)

(assert (=> mapNonEmpty!38608 (= condMapEmpty!38617 (= mapRest!38608 ((as const (Array (_ BitVec 32) ValueCell!11645)) mapDefault!38617)))))

(declare-fun e!589270 () Bool)

(declare-fun mapRes!38617 () Bool)

(assert (=> mapNonEmpty!38608 (= tp!74110 (and e!589270 mapRes!38617))))

(declare-fun b!1040948 () Bool)

(declare-fun e!589271 () Bool)

(assert (=> b!1040948 (= e!589271 tp_is_empty!24697)))

(declare-fun mapNonEmpty!38617 () Bool)

(declare-fun tp!74126 () Bool)

(assert (=> mapNonEmpty!38617 (= mapRes!38617 (and tp!74126 e!589271))))

(declare-fun mapRest!38617 () (Array (_ BitVec 32) ValueCell!11645))

(declare-fun mapKey!38617 () (_ BitVec 32))

(declare-fun mapValue!38617 () ValueCell!11645)

(assert (=> mapNonEmpty!38617 (= mapRest!38608 (store mapRest!38617 mapKey!38617 mapValue!38617))))

(declare-fun mapIsEmpty!38617 () Bool)

(assert (=> mapIsEmpty!38617 mapRes!38617))

(declare-fun b!1040949 () Bool)

(assert (=> b!1040949 (= e!589270 tp_is_empty!24697)))

(assert (= (and mapNonEmpty!38608 condMapEmpty!38617) mapIsEmpty!38617))

(assert (= (and mapNonEmpty!38608 (not condMapEmpty!38617)) mapNonEmpty!38617))

(assert (= (and mapNonEmpty!38617 ((_ is ValueCellFull!11645) mapValue!38617)) b!1040948))

(assert (= (and mapNonEmpty!38608 ((_ is ValueCellFull!11645) mapDefault!38617)) b!1040949))

(declare-fun m!960967 () Bool)

(assert (=> mapNonEmpty!38617 m!960967))

(check-sat (not b!1040874) (not b!1040864) (not b_next!20977) (not b!1040929) (not b!1040907) (not b!1040892) (not mapNonEmpty!38617) (not b!1040894) (not d!125983) (not b!1040895) (not b!1040922) (not b!1040862) (not b!1040896) (not b!1040908) (not d!125989) (not b!1040925) (not bm!44068) (not b!1040875) (not d!125975) (not b!1040941) (not bm!44064) (not d!125973) (not b!1040910) (not b!1040938) (not bm!44060) (not b!1040863) b_and!33519 (not b!1040873) (not bm!44061) (not bm!44065) tp_is_empty!24697)
(check-sat b_and!33519 (not b_next!20977))
