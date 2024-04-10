; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91582 () Bool)

(assert start!91582)

(declare-fun b!1042896 () Bool)

(declare-fun b_free!21075 () Bool)

(declare-fun b_next!21075 () Bool)

(assert (=> b!1042896 (= b_free!21075 (not b_next!21075))))

(declare-fun tp!74456 () Bool)

(declare-fun b_and!33607 () Bool)

(assert (=> b!1042896 (= tp!74456 b_and!33607)))

(declare-fun b!1042890 () Bool)

(declare-fun res!694850 () Bool)

(declare-fun e!590823 () Bool)

(assert (=> b!1042890 (=> res!694850 e!590823)))

(declare-datatypes ((SeekEntryResult!9821 0))(
  ( (MissingZero!9821 (index!41655 (_ BitVec 32))) (Found!9821 (index!41656 (_ BitVec 32))) (Intermediate!9821 (undefined!10633 Bool) (index!41657 (_ BitVec 32)) (x!93105 (_ BitVec 32))) (Undefined!9821) (MissingVacant!9821 (index!41658 (_ BitVec 32))) )
))
(declare-fun lt!459674 () SeekEntryResult!9821)

(declare-datatypes ((V!37933 0))(
  ( (V!37934 (val!12448 Int)) )
))
(declare-datatypes ((ValueCell!11694 0))(
  ( (ValueCellFull!11694 (v!15039 V!37933)) (EmptyCell!11694) )
))
(declare-datatypes ((array!65748 0))(
  ( (array!65749 (arr!31629 (Array (_ BitVec 32) (_ BitVec 64))) (size!32164 (_ BitVec 32))) )
))
(declare-datatypes ((array!65750 0))(
  ( (array!65751 (arr!31630 (Array (_ BitVec 32) ValueCell!11694)) (size!32165 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5982 0))(
  ( (LongMapFixedSize!5983 (defaultEntry!6373 Int) (mask!30448 (_ BitVec 32)) (extraKeys!6101 (_ BitVec 32)) (zeroValue!6207 V!37933) (minValue!6207 V!37933) (_size!3046 (_ BitVec 32)) (_keys!11627 array!65748) (_values!6396 array!65750) (_vacant!3046 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5982)

(assert (=> b!1042890 (= res!694850 (or (bvslt (index!41656 lt!459674) #b00000000000000000000000000000000) (bvsge (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427)))))))

(declare-fun res!694847 () Bool)

(declare-fun e!590816 () Bool)

(assert (=> start!91582 (=> (not res!694847) (not e!590816))))

(declare-fun valid!2246 (LongMapFixedSize!5982) Bool)

(assert (=> start!91582 (= res!694847 (valid!2246 thiss!1427))))

(assert (=> start!91582 e!590816))

(declare-fun e!590818 () Bool)

(assert (=> start!91582 e!590818))

(assert (=> start!91582 true))

(declare-fun mapIsEmpty!38807 () Bool)

(declare-fun mapRes!38807 () Bool)

(assert (=> mapIsEmpty!38807 mapRes!38807))

(declare-fun b!1042891 () Bool)

(declare-fun res!694848 () Bool)

(assert (=> b!1042891 (=> (not res!694848) (not e!590816))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042891 (= res!694848 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042892 () Bool)

(declare-fun res!694851 () Bool)

(assert (=> b!1042892 (=> res!694851 e!590823)))

(assert (=> b!1042892 (= res!694851 (or (not (= (size!32165 (_values!6396 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30448 thiss!1427)))) (not (= (size!32164 (_keys!11627 thiss!1427)) (size!32165 (_values!6396 thiss!1427)))) (bvslt (mask!30448 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6101 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6101 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042893 () Bool)

(declare-fun e!590819 () Bool)

(declare-fun tp_is_empty!24795 () Bool)

(assert (=> b!1042893 (= e!590819 tp_is_empty!24795)))

(declare-fun b!1042894 () Bool)

(declare-fun e!590820 () Bool)

(assert (=> b!1042894 (= e!590820 (not e!590823))))

(declare-fun res!694852 () Bool)

(assert (=> b!1042894 (=> res!694852 e!590823)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042894 (= res!694852 (not (validMask!0 (mask!30448 thiss!1427))))))

(declare-fun lt!459673 () array!65748)

(declare-fun arrayContainsKey!0 (array!65748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042894 (not (arrayContainsKey!0 lt!459673 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34055 0))(
  ( (Unit!34056) )
))
(declare-fun lt!459672 () Unit!34055)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65748 (_ BitVec 32) (_ BitVec 64)) Unit!34055)

(assert (=> b!1042894 (= lt!459672 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65748 (_ BitVec 32)) Bool)

(assert (=> b!1042894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459673 (mask!30448 thiss!1427))))

(declare-fun lt!459676 () Unit!34055)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65748 (_ BitVec 32) (_ BitVec 32)) Unit!34055)

(assert (=> b!1042894 (= lt!459676 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) (mask!30448 thiss!1427)))))

(declare-datatypes ((List!21979 0))(
  ( (Nil!21976) (Cons!21975 (h!23183 (_ BitVec 64)) (t!31193 List!21979)) )
))
(declare-fun arrayNoDuplicates!0 (array!65748 (_ BitVec 32) List!21979) Bool)

(assert (=> b!1042894 (arrayNoDuplicates!0 lt!459673 #b00000000000000000000000000000000 Nil!21976)))

(declare-fun lt!459677 () Unit!34055)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21979) Unit!34055)

(assert (=> b!1042894 (= lt!459677 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459674) #b00000000000000000000000000000000 Nil!21976))))

(declare-fun arrayCountValidKeys!0 (array!65748 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042894 (= (arrayCountValidKeys!0 lt!459673 #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042894 (= lt!459673 (array!65749 (store (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32164 (_keys!11627 thiss!1427))))))

(declare-fun lt!459675 () Unit!34055)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65748 (_ BitVec 32) (_ BitVec 64)) Unit!34055)

(assert (=> b!1042894 (= lt!459675 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042895 () Bool)

(declare-fun res!694846 () Bool)

(assert (=> b!1042895 (=> res!694846 e!590823)))

(assert (=> b!1042895 (= res!694846 (not (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!21976)))))

(declare-fun e!590822 () Bool)

(declare-fun array_inv!24437 (array!65748) Bool)

(declare-fun array_inv!24438 (array!65750) Bool)

(assert (=> b!1042896 (= e!590818 (and tp!74456 tp_is_empty!24795 (array_inv!24437 (_keys!11627 thiss!1427)) (array_inv!24438 (_values!6396 thiss!1427)) e!590822))))

(declare-fun b!1042897 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042897 (= e!590823 (validKeyInArray!0 key!909))))

(declare-fun b!1042898 () Bool)

(assert (=> b!1042898 (= e!590816 e!590820)))

(declare-fun res!694853 () Bool)

(assert (=> b!1042898 (=> (not res!694853) (not e!590820))))

(get-info :version)

(assert (=> b!1042898 (= res!694853 ((_ is Found!9821) lt!459674))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65748 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1042898 (= lt!459674 (seekEntry!0 key!909 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)))))

(declare-fun mapNonEmpty!38807 () Bool)

(declare-fun tp!74457 () Bool)

(assert (=> mapNonEmpty!38807 (= mapRes!38807 (and tp!74457 e!590819))))

(declare-fun mapRest!38807 () (Array (_ BitVec 32) ValueCell!11694))

(declare-fun mapKey!38807 () (_ BitVec 32))

(declare-fun mapValue!38807 () ValueCell!11694)

(assert (=> mapNonEmpty!38807 (= (arr!31630 (_values!6396 thiss!1427)) (store mapRest!38807 mapKey!38807 mapValue!38807))))

(declare-fun b!1042899 () Bool)

(declare-fun res!694849 () Bool)

(assert (=> b!1042899 (=> res!694849 e!590823)))

(assert (=> b!1042899 (= res!694849 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30448 thiss!1427))))))

(declare-fun b!1042900 () Bool)

(declare-fun e!590817 () Bool)

(assert (=> b!1042900 (= e!590822 (and e!590817 mapRes!38807))))

(declare-fun condMapEmpty!38807 () Bool)

(declare-fun mapDefault!38807 () ValueCell!11694)

(assert (=> b!1042900 (= condMapEmpty!38807 (= (arr!31630 (_values!6396 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11694)) mapDefault!38807)))))

(declare-fun b!1042901 () Bool)

(assert (=> b!1042901 (= e!590817 tp_is_empty!24795)))

(assert (= (and start!91582 res!694847) b!1042891))

(assert (= (and b!1042891 res!694848) b!1042898))

(assert (= (and b!1042898 res!694853) b!1042894))

(assert (= (and b!1042894 (not res!694852)) b!1042892))

(assert (= (and b!1042892 (not res!694851)) b!1042899))

(assert (= (and b!1042899 (not res!694849)) b!1042895))

(assert (= (and b!1042895 (not res!694846)) b!1042890))

(assert (= (and b!1042890 (not res!694850)) b!1042897))

(assert (= (and b!1042900 condMapEmpty!38807) mapIsEmpty!38807))

(assert (= (and b!1042900 (not condMapEmpty!38807)) mapNonEmpty!38807))

(assert (= (and mapNonEmpty!38807 ((_ is ValueCellFull!11694) mapValue!38807)) b!1042893))

(assert (= (and b!1042900 ((_ is ValueCellFull!11694) mapDefault!38807)) b!1042901))

(assert (= b!1042896 b!1042900))

(assert (= start!91582 b!1042896))

(declare-fun m!962141 () Bool)

(assert (=> b!1042898 m!962141))

(declare-fun m!962143 () Bool)

(assert (=> b!1042897 m!962143))

(declare-fun m!962145 () Bool)

(assert (=> b!1042894 m!962145))

(declare-fun m!962147 () Bool)

(assert (=> b!1042894 m!962147))

(declare-fun m!962149 () Bool)

(assert (=> b!1042894 m!962149))

(declare-fun m!962151 () Bool)

(assert (=> b!1042894 m!962151))

(declare-fun m!962153 () Bool)

(assert (=> b!1042894 m!962153))

(declare-fun m!962155 () Bool)

(assert (=> b!1042894 m!962155))

(declare-fun m!962157 () Bool)

(assert (=> b!1042894 m!962157))

(declare-fun m!962159 () Bool)

(assert (=> b!1042894 m!962159))

(declare-fun m!962161 () Bool)

(assert (=> b!1042894 m!962161))

(declare-fun m!962163 () Bool)

(assert (=> b!1042894 m!962163))

(declare-fun m!962165 () Bool)

(assert (=> b!1042894 m!962165))

(declare-fun m!962167 () Bool)

(assert (=> b!1042896 m!962167))

(declare-fun m!962169 () Bool)

(assert (=> b!1042896 m!962169))

(declare-fun m!962171 () Bool)

(assert (=> mapNonEmpty!38807 m!962171))

(declare-fun m!962173 () Bool)

(assert (=> start!91582 m!962173))

(declare-fun m!962175 () Bool)

(assert (=> b!1042895 m!962175))

(declare-fun m!962177 () Bool)

(assert (=> b!1042899 m!962177))

(check-sat (not start!91582) (not b!1042897) (not b!1042894) (not b!1042899) (not b!1042895) (not b_next!21075) b_and!33607 tp_is_empty!24795 (not b!1042896) (not b!1042898) (not mapNonEmpty!38807))
(check-sat b_and!33607 (not b_next!21075))
(get-model)

(declare-fun b!1042948 () Bool)

(declare-fun e!590857 () Bool)

(declare-fun e!590858 () Bool)

(assert (=> b!1042948 (= e!590857 e!590858)))

(declare-fun res!694886 () Bool)

(assert (=> b!1042948 (=> (not res!694886) (not e!590858))))

(declare-fun e!590856 () Bool)

(assert (=> b!1042948 (= res!694886 (not e!590856))))

(declare-fun res!694885 () Bool)

(assert (=> b!1042948 (=> (not res!694885) (not e!590856))))

(assert (=> b!1042948 (= res!694885 (validKeyInArray!0 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042949 () Bool)

(declare-fun e!590859 () Bool)

(declare-fun call!44201 () Bool)

(assert (=> b!1042949 (= e!590859 call!44201)))

(declare-fun bm!44198 () Bool)

(declare-fun c!105885 () Bool)

(assert (=> bm!44198 (= call!44201 (arrayNoDuplicates!0 (_keys!11627 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105885 (Cons!21975 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000) Nil!21976) Nil!21976)))))

(declare-fun d!126185 () Bool)

(declare-fun res!694884 () Bool)

(assert (=> d!126185 (=> res!694884 e!590857)))

(assert (=> d!126185 (= res!694884 (bvsge #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))))))

(assert (=> d!126185 (= (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!21976) e!590857)))

(declare-fun b!1042950 () Bool)

(assert (=> b!1042950 (= e!590858 e!590859)))

(assert (=> b!1042950 (= c!105885 (validKeyInArray!0 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042951 () Bool)

(assert (=> b!1042951 (= e!590859 call!44201)))

(declare-fun b!1042952 () Bool)

(declare-fun contains!6060 (List!21979 (_ BitVec 64)) Bool)

(assert (=> b!1042952 (= e!590856 (contains!6060 Nil!21976 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126185 (not res!694884)) b!1042948))

(assert (= (and b!1042948 res!694885) b!1042952))

(assert (= (and b!1042948 res!694886) b!1042950))

(assert (= (and b!1042950 c!105885) b!1042951))

(assert (= (and b!1042950 (not c!105885)) b!1042949))

(assert (= (or b!1042951 b!1042949) bm!44198))

(declare-fun m!962217 () Bool)

(assert (=> b!1042948 m!962217))

(assert (=> b!1042948 m!962217))

(declare-fun m!962219 () Bool)

(assert (=> b!1042948 m!962219))

(assert (=> bm!44198 m!962217))

(declare-fun m!962221 () Bool)

(assert (=> bm!44198 m!962221))

(assert (=> b!1042950 m!962217))

(assert (=> b!1042950 m!962217))

(assert (=> b!1042950 m!962219))

(assert (=> b!1042952 m!962217))

(assert (=> b!1042952 m!962217))

(declare-fun m!962223 () Bool)

(assert (=> b!1042952 m!962223))

(assert (=> b!1042895 d!126185))

(declare-fun d!126187 () Bool)

(assert (=> d!126187 (= (array_inv!24437 (_keys!11627 thiss!1427)) (bvsge (size!32164 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042896 d!126187))

(declare-fun d!126189 () Bool)

(assert (=> d!126189 (= (array_inv!24438 (_values!6396 thiss!1427)) (bvsge (size!32165 (_values!6396 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042896 d!126189))

(declare-fun d!126191 () Bool)

(declare-fun res!694893 () Bool)

(declare-fun e!590862 () Bool)

(assert (=> d!126191 (=> (not res!694893) (not e!590862))))

(declare-fun simpleValid!444 (LongMapFixedSize!5982) Bool)

(assert (=> d!126191 (= res!694893 (simpleValid!444 thiss!1427))))

(assert (=> d!126191 (= (valid!2246 thiss!1427) e!590862)))

(declare-fun b!1042959 () Bool)

(declare-fun res!694894 () Bool)

(assert (=> b!1042959 (=> (not res!694894) (not e!590862))))

(assert (=> b!1042959 (= res!694894 (= (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) (_size!3046 thiss!1427)))))

(declare-fun b!1042960 () Bool)

(declare-fun res!694895 () Bool)

(assert (=> b!1042960 (=> (not res!694895) (not e!590862))))

(assert (=> b!1042960 (= res!694895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)))))

(declare-fun b!1042961 () Bool)

(assert (=> b!1042961 (= e!590862 (arrayNoDuplicates!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 Nil!21976))))

(assert (= (and d!126191 res!694893) b!1042959))

(assert (= (and b!1042959 res!694894) b!1042960))

(assert (= (and b!1042960 res!694895) b!1042961))

(declare-fun m!962225 () Bool)

(assert (=> d!126191 m!962225))

(assert (=> b!1042959 m!962153))

(assert (=> b!1042960 m!962177))

(assert (=> b!1042961 m!962175))

(assert (=> start!91582 d!126191))

(declare-fun d!126193 () Bool)

(declare-fun res!694900 () Bool)

(declare-fun e!590867 () Bool)

(assert (=> d!126193 (=> res!694900 e!590867)))

(assert (=> d!126193 (= res!694900 (= (select (arr!31629 lt!459673) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126193 (= (arrayContainsKey!0 lt!459673 key!909 #b00000000000000000000000000000000) e!590867)))

(declare-fun b!1042966 () Bool)

(declare-fun e!590868 () Bool)

(assert (=> b!1042966 (= e!590867 e!590868)))

(declare-fun res!694901 () Bool)

(assert (=> b!1042966 (=> (not res!694901) (not e!590868))))

(assert (=> b!1042966 (= res!694901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32164 lt!459673)))))

(declare-fun b!1042967 () Bool)

(assert (=> b!1042967 (= e!590868 (arrayContainsKey!0 lt!459673 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126193 (not res!694900)) b!1042966))

(assert (= (and b!1042966 res!694901) b!1042967))

(declare-fun m!962227 () Bool)

(assert (=> d!126193 m!962227))

(declare-fun m!962229 () Bool)

(assert (=> b!1042967 m!962229))

(assert (=> b!1042894 d!126193))

(declare-fun d!126195 () Bool)

(declare-fun res!694907 () Bool)

(declare-fun e!590876 () Bool)

(assert (=> d!126195 (=> res!694907 e!590876)))

(assert (=> d!126195 (= res!694907 (bvsge #b00000000000000000000000000000000 (size!32164 lt!459673)))))

(assert (=> d!126195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459673 (mask!30448 thiss!1427)) e!590876)))

(declare-fun b!1042976 () Bool)

(declare-fun e!590877 () Bool)

(assert (=> b!1042976 (= e!590876 e!590877)))

(declare-fun c!105888 () Bool)

(assert (=> b!1042976 (= c!105888 (validKeyInArray!0 (select (arr!31629 lt!459673) #b00000000000000000000000000000000)))))

(declare-fun b!1042977 () Bool)

(declare-fun e!590875 () Bool)

(assert (=> b!1042977 (= e!590877 e!590875)))

(declare-fun lt!459702 () (_ BitVec 64))

(assert (=> b!1042977 (= lt!459702 (select (arr!31629 lt!459673) #b00000000000000000000000000000000))))

(declare-fun lt!459703 () Unit!34055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65748 (_ BitVec 64) (_ BitVec 32)) Unit!34055)

(assert (=> b!1042977 (= lt!459703 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459673 lt!459702 #b00000000000000000000000000000000))))

(assert (=> b!1042977 (arrayContainsKey!0 lt!459673 lt!459702 #b00000000000000000000000000000000)))

(declare-fun lt!459704 () Unit!34055)

(assert (=> b!1042977 (= lt!459704 lt!459703)))

(declare-fun res!694906 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65748 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1042977 (= res!694906 (= (seekEntryOrOpen!0 (select (arr!31629 lt!459673) #b00000000000000000000000000000000) lt!459673 (mask!30448 thiss!1427)) (Found!9821 #b00000000000000000000000000000000)))))

(assert (=> b!1042977 (=> (not res!694906) (not e!590875))))

(declare-fun b!1042978 () Bool)

(declare-fun call!44204 () Bool)

(assert (=> b!1042978 (= e!590877 call!44204)))

(declare-fun bm!44201 () Bool)

(assert (=> bm!44201 (= call!44204 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459673 (mask!30448 thiss!1427)))))

(declare-fun b!1042979 () Bool)

(assert (=> b!1042979 (= e!590875 call!44204)))

(assert (= (and d!126195 (not res!694907)) b!1042976))

(assert (= (and b!1042976 c!105888) b!1042977))

(assert (= (and b!1042976 (not c!105888)) b!1042978))

(assert (= (and b!1042977 res!694906) b!1042979))

(assert (= (or b!1042979 b!1042978) bm!44201))

(assert (=> b!1042976 m!962227))

(assert (=> b!1042976 m!962227))

(declare-fun m!962231 () Bool)

(assert (=> b!1042976 m!962231))

(assert (=> b!1042977 m!962227))

(declare-fun m!962233 () Bool)

(assert (=> b!1042977 m!962233))

(declare-fun m!962235 () Bool)

(assert (=> b!1042977 m!962235))

(assert (=> b!1042977 m!962227))

(declare-fun m!962237 () Bool)

(assert (=> b!1042977 m!962237))

(declare-fun m!962239 () Bool)

(assert (=> bm!44201 m!962239))

(assert (=> b!1042894 d!126195))

(declare-fun bm!44204 () Bool)

(declare-fun call!44207 () (_ BitVec 32))

(assert (=> bm!44204 (= call!44207 (arrayCountValidKeys!0 lt!459673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32164 (_keys!11627 thiss!1427))))))

(declare-fun b!1042988 () Bool)

(declare-fun e!590883 () (_ BitVec 32))

(declare-fun e!590882 () (_ BitVec 32))

(assert (=> b!1042988 (= e!590883 e!590882)))

(declare-fun c!105893 () Bool)

(assert (=> b!1042988 (= c!105893 (validKeyInArray!0 (select (arr!31629 lt!459673) #b00000000000000000000000000000000)))))

(declare-fun b!1042989 () Bool)

(assert (=> b!1042989 (= e!590882 call!44207)))

(declare-fun b!1042990 () Bool)

(assert (=> b!1042990 (= e!590883 #b00000000000000000000000000000000)))

(declare-fun b!1042991 () Bool)

(assert (=> b!1042991 (= e!590882 (bvadd #b00000000000000000000000000000001 call!44207))))

(declare-fun d!126197 () Bool)

(declare-fun lt!459707 () (_ BitVec 32))

(assert (=> d!126197 (and (bvsge lt!459707 #b00000000000000000000000000000000) (bvsle lt!459707 (bvsub (size!32164 lt!459673) #b00000000000000000000000000000000)))))

(assert (=> d!126197 (= lt!459707 e!590883)))

(declare-fun c!105894 () Bool)

(assert (=> d!126197 (= c!105894 (bvsge #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))))))

(assert (=> d!126197 (and (bvsle #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32164 (_keys!11627 thiss!1427)) (size!32164 lt!459673)))))

(assert (=> d!126197 (= (arrayCountValidKeys!0 lt!459673 #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) lt!459707)))

(assert (= (and d!126197 c!105894) b!1042990))

(assert (= (and d!126197 (not c!105894)) b!1042988))

(assert (= (and b!1042988 c!105893) b!1042991))

(assert (= (and b!1042988 (not c!105893)) b!1042989))

(assert (= (or b!1042991 b!1042989) bm!44204))

(declare-fun m!962241 () Bool)

(assert (=> bm!44204 m!962241))

(assert (=> b!1042988 m!962227))

(assert (=> b!1042988 m!962227))

(assert (=> b!1042988 m!962231))

(assert (=> b!1042894 d!126197))

(declare-fun d!126199 () Bool)

(assert (=> d!126199 (= (validMask!0 (mask!30448 thiss!1427)) (and (or (= (mask!30448 thiss!1427) #b00000000000000000000000000000111) (= (mask!30448 thiss!1427) #b00000000000000000000000000001111) (= (mask!30448 thiss!1427) #b00000000000000000000000000011111) (= (mask!30448 thiss!1427) #b00000000000000000000000000111111) (= (mask!30448 thiss!1427) #b00000000000000000000000001111111) (= (mask!30448 thiss!1427) #b00000000000000000000000011111111) (= (mask!30448 thiss!1427) #b00000000000000000000000111111111) (= (mask!30448 thiss!1427) #b00000000000000000000001111111111) (= (mask!30448 thiss!1427) #b00000000000000000000011111111111) (= (mask!30448 thiss!1427) #b00000000000000000000111111111111) (= (mask!30448 thiss!1427) #b00000000000000000001111111111111) (= (mask!30448 thiss!1427) #b00000000000000000011111111111111) (= (mask!30448 thiss!1427) #b00000000000000000111111111111111) (= (mask!30448 thiss!1427) #b00000000000000001111111111111111) (= (mask!30448 thiss!1427) #b00000000000000011111111111111111) (= (mask!30448 thiss!1427) #b00000000000000111111111111111111) (= (mask!30448 thiss!1427) #b00000000000001111111111111111111) (= (mask!30448 thiss!1427) #b00000000000011111111111111111111) (= (mask!30448 thiss!1427) #b00000000000111111111111111111111) (= (mask!30448 thiss!1427) #b00000000001111111111111111111111) (= (mask!30448 thiss!1427) #b00000000011111111111111111111111) (= (mask!30448 thiss!1427) #b00000000111111111111111111111111) (= (mask!30448 thiss!1427) #b00000001111111111111111111111111) (= (mask!30448 thiss!1427) #b00000011111111111111111111111111) (= (mask!30448 thiss!1427) #b00000111111111111111111111111111) (= (mask!30448 thiss!1427) #b00001111111111111111111111111111) (= (mask!30448 thiss!1427) #b00011111111111111111111111111111) (= (mask!30448 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30448 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042894 d!126199))

(declare-fun b!1043003 () Bool)

(declare-fun e!590888 () Bool)

(assert (=> b!1043003 (= e!590888 (= (arrayCountValidKeys!0 (array!65749 (store (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32164 (_keys!11627 thiss!1427))) #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1043000 () Bool)

(declare-fun res!694919 () Bool)

(declare-fun e!590889 () Bool)

(assert (=> b!1043000 (=> (not res!694919) (not e!590889))))

(assert (=> b!1043000 (= res!694919 (validKeyInArray!0 (select (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674))))))

(declare-fun b!1043001 () Bool)

(declare-fun res!694917 () Bool)

(assert (=> b!1043001 (=> (not res!694917) (not e!590889))))

(assert (=> b!1043001 (= res!694917 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126201 () Bool)

(assert (=> d!126201 e!590888))

(declare-fun res!694916 () Bool)

(assert (=> d!126201 (=> (not res!694916) (not e!590888))))

(assert (=> d!126201 (= res!694916 (and (bvsge (index!41656 lt!459674) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459710 () Unit!34055)

(declare-fun choose!82 (array!65748 (_ BitVec 32) (_ BitVec 64)) Unit!34055)

(assert (=> d!126201 (= lt!459710 (choose!82 (_keys!11627 thiss!1427) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126201 e!590889))

(declare-fun res!694918 () Bool)

(assert (=> d!126201 (=> (not res!694918) (not e!590889))))

(assert (=> d!126201 (= res!694918 (and (bvsge (index!41656 lt!459674) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427)))))))

(assert (=> d!126201 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459710)))

(declare-fun b!1043002 () Bool)

(assert (=> b!1043002 (= e!590889 (bvslt (size!32164 (_keys!11627 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126201 res!694918) b!1043000))

(assert (= (and b!1043000 res!694919) b!1043001))

(assert (= (and b!1043001 res!694917) b!1043002))

(assert (= (and d!126201 res!694916) b!1043003))

(assert (=> b!1043003 m!962151))

(declare-fun m!962243 () Bool)

(assert (=> b!1043003 m!962243))

(assert (=> b!1043003 m!962153))

(declare-fun m!962245 () Bool)

(assert (=> b!1043000 m!962245))

(assert (=> b!1043000 m!962245))

(declare-fun m!962247 () Bool)

(assert (=> b!1043000 m!962247))

(declare-fun m!962249 () Bool)

(assert (=> b!1043001 m!962249))

(declare-fun m!962251 () Bool)

(assert (=> d!126201 m!962251))

(assert (=> b!1042894 d!126201))

(declare-fun d!126203 () Bool)

(declare-fun e!590892 () Bool)

(assert (=> d!126203 e!590892))

(declare-fun res!694922 () Bool)

(assert (=> d!126203 (=> (not res!694922) (not e!590892))))

(assert (=> d!126203 (= res!694922 (bvslt (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427))))))

(declare-fun lt!459713 () Unit!34055)

(declare-fun choose!121 (array!65748 (_ BitVec 32) (_ BitVec 64)) Unit!34055)

(assert (=> d!126203 (= lt!459713 (choose!121 (_keys!11627 thiss!1427) (index!41656 lt!459674) key!909))))

(assert (=> d!126203 (bvsge (index!41656 lt!459674) #b00000000000000000000000000000000)))

(assert (=> d!126203 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) key!909) lt!459713)))

(declare-fun b!1043006 () Bool)

(assert (=> b!1043006 (= e!590892 (not (arrayContainsKey!0 (array!65749 (store (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32164 (_keys!11627 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126203 res!694922) b!1043006))

(declare-fun m!962253 () Bool)

(assert (=> d!126203 m!962253))

(assert (=> b!1043006 m!962151))

(declare-fun m!962255 () Bool)

(assert (=> b!1043006 m!962255))

(assert (=> b!1042894 d!126203))

(declare-fun bm!44205 () Bool)

(declare-fun call!44208 () (_ BitVec 32))

(assert (=> bm!44205 (= call!44208 (arrayCountValidKeys!0 (_keys!11627 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32164 (_keys!11627 thiss!1427))))))

(declare-fun b!1043007 () Bool)

(declare-fun e!590894 () (_ BitVec 32))

(declare-fun e!590893 () (_ BitVec 32))

(assert (=> b!1043007 (= e!590894 e!590893)))

(declare-fun c!105895 () Bool)

(assert (=> b!1043007 (= c!105895 (validKeyInArray!0 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043008 () Bool)

(assert (=> b!1043008 (= e!590893 call!44208)))

(declare-fun b!1043009 () Bool)

(assert (=> b!1043009 (= e!590894 #b00000000000000000000000000000000)))

(declare-fun b!1043010 () Bool)

(assert (=> b!1043010 (= e!590893 (bvadd #b00000000000000000000000000000001 call!44208))))

(declare-fun d!126205 () Bool)

(declare-fun lt!459714 () (_ BitVec 32))

(assert (=> d!126205 (and (bvsge lt!459714 #b00000000000000000000000000000000) (bvsle lt!459714 (bvsub (size!32164 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126205 (= lt!459714 e!590894)))

(declare-fun c!105896 () Bool)

(assert (=> d!126205 (= c!105896 (bvsge #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))))))

(assert (=> d!126205 (and (bvsle #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32164 (_keys!11627 thiss!1427)) (size!32164 (_keys!11627 thiss!1427))))))

(assert (=> d!126205 (= (arrayCountValidKeys!0 (_keys!11627 thiss!1427) #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))) lt!459714)))

(assert (= (and d!126205 c!105896) b!1043009))

(assert (= (and d!126205 (not c!105896)) b!1043007))

(assert (= (and b!1043007 c!105895) b!1043010))

(assert (= (and b!1043007 (not c!105895)) b!1043008))

(assert (= (or b!1043010 b!1043008) bm!44205))

(declare-fun m!962257 () Bool)

(assert (=> bm!44205 m!962257))

(assert (=> b!1043007 m!962217))

(assert (=> b!1043007 m!962217))

(assert (=> b!1043007 m!962219))

(assert (=> b!1042894 d!126205))

(declare-fun d!126207 () Bool)

(declare-fun e!590897 () Bool)

(assert (=> d!126207 e!590897))

(declare-fun res!694925 () Bool)

(assert (=> d!126207 (=> (not res!694925) (not e!590897))))

(assert (=> d!126207 (= res!694925 (and (bvsge (index!41656 lt!459674) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459717 () Unit!34055)

(declare-fun choose!53 (array!65748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21979) Unit!34055)

(assert (=> d!126207 (= lt!459717 (choose!53 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459674) #b00000000000000000000000000000000 Nil!21976))))

(assert (=> d!126207 (bvslt (size!32164 (_keys!11627 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126207 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11627 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459674) #b00000000000000000000000000000000 Nil!21976) lt!459717)))

(declare-fun b!1043013 () Bool)

(assert (=> b!1043013 (= e!590897 (arrayNoDuplicates!0 (array!65749 (store (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32164 (_keys!11627 thiss!1427))) #b00000000000000000000000000000000 Nil!21976))))

(assert (= (and d!126207 res!694925) b!1043013))

(declare-fun m!962259 () Bool)

(assert (=> d!126207 m!962259))

(assert (=> b!1043013 m!962151))

(declare-fun m!962261 () Bool)

(assert (=> b!1043013 m!962261))

(assert (=> b!1042894 d!126207))

(declare-fun b!1043014 () Bool)

(declare-fun e!590899 () Bool)

(declare-fun e!590900 () Bool)

(assert (=> b!1043014 (= e!590899 e!590900)))

(declare-fun res!694928 () Bool)

(assert (=> b!1043014 (=> (not res!694928) (not e!590900))))

(declare-fun e!590898 () Bool)

(assert (=> b!1043014 (= res!694928 (not e!590898))))

(declare-fun res!694927 () Bool)

(assert (=> b!1043014 (=> (not res!694927) (not e!590898))))

(assert (=> b!1043014 (= res!694927 (validKeyInArray!0 (select (arr!31629 lt!459673) #b00000000000000000000000000000000)))))

(declare-fun b!1043015 () Bool)

(declare-fun e!590901 () Bool)

(declare-fun call!44209 () Bool)

(assert (=> b!1043015 (= e!590901 call!44209)))

(declare-fun bm!44206 () Bool)

(declare-fun c!105897 () Bool)

(assert (=> bm!44206 (= call!44209 (arrayNoDuplicates!0 lt!459673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105897 (Cons!21975 (select (arr!31629 lt!459673) #b00000000000000000000000000000000) Nil!21976) Nil!21976)))))

(declare-fun d!126209 () Bool)

(declare-fun res!694926 () Bool)

(assert (=> d!126209 (=> res!694926 e!590899)))

(assert (=> d!126209 (= res!694926 (bvsge #b00000000000000000000000000000000 (size!32164 lt!459673)))))

(assert (=> d!126209 (= (arrayNoDuplicates!0 lt!459673 #b00000000000000000000000000000000 Nil!21976) e!590899)))

(declare-fun b!1043016 () Bool)

(assert (=> b!1043016 (= e!590900 e!590901)))

(assert (=> b!1043016 (= c!105897 (validKeyInArray!0 (select (arr!31629 lt!459673) #b00000000000000000000000000000000)))))

(declare-fun b!1043017 () Bool)

(assert (=> b!1043017 (= e!590901 call!44209)))

(declare-fun b!1043018 () Bool)

(assert (=> b!1043018 (= e!590898 (contains!6060 Nil!21976 (select (arr!31629 lt!459673) #b00000000000000000000000000000000)))))

(assert (= (and d!126209 (not res!694926)) b!1043014))

(assert (= (and b!1043014 res!694927) b!1043018))

(assert (= (and b!1043014 res!694928) b!1043016))

(assert (= (and b!1043016 c!105897) b!1043017))

(assert (= (and b!1043016 (not c!105897)) b!1043015))

(assert (= (or b!1043017 b!1043015) bm!44206))

(assert (=> b!1043014 m!962227))

(assert (=> b!1043014 m!962227))

(assert (=> b!1043014 m!962231))

(assert (=> bm!44206 m!962227))

(declare-fun m!962263 () Bool)

(assert (=> bm!44206 m!962263))

(assert (=> b!1043016 m!962227))

(assert (=> b!1043016 m!962227))

(assert (=> b!1043016 m!962231))

(assert (=> b!1043018 m!962227))

(assert (=> b!1043018 m!962227))

(declare-fun m!962265 () Bool)

(assert (=> b!1043018 m!962265))

(assert (=> b!1042894 d!126209))

(declare-fun d!126211 () Bool)

(declare-fun e!590904 () Bool)

(assert (=> d!126211 e!590904))

(declare-fun res!694931 () Bool)

(assert (=> d!126211 (=> (not res!694931) (not e!590904))))

(assert (=> d!126211 (= res!694931 (and (bvsge (index!41656 lt!459674) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459674) (size!32164 (_keys!11627 thiss!1427)))))))

(declare-fun lt!459720 () Unit!34055)

(declare-fun choose!25 (array!65748 (_ BitVec 32) (_ BitVec 32)) Unit!34055)

(assert (=> d!126211 (= lt!459720 (choose!25 (_keys!11627 thiss!1427) (index!41656 lt!459674) (mask!30448 thiss!1427)))))

(assert (=> d!126211 (validMask!0 (mask!30448 thiss!1427))))

(assert (=> d!126211 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11627 thiss!1427) (index!41656 lt!459674) (mask!30448 thiss!1427)) lt!459720)))

(declare-fun b!1043021 () Bool)

(assert (=> b!1043021 (= e!590904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65749 (store (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459674) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32164 (_keys!11627 thiss!1427))) (mask!30448 thiss!1427)))))

(assert (= (and d!126211 res!694931) b!1043021))

(declare-fun m!962267 () Bool)

(assert (=> d!126211 m!962267))

(assert (=> d!126211 m!962145))

(assert (=> b!1043021 m!962151))

(declare-fun m!962269 () Bool)

(assert (=> b!1043021 m!962269))

(assert (=> b!1042894 d!126211))

(declare-fun d!126213 () Bool)

(declare-fun res!694933 () Bool)

(declare-fun e!590906 () Bool)

(assert (=> d!126213 (=> res!694933 e!590906)))

(assert (=> d!126213 (= res!694933 (bvsge #b00000000000000000000000000000000 (size!32164 (_keys!11627 thiss!1427))))))

(assert (=> d!126213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)) e!590906)))

(declare-fun b!1043022 () Bool)

(declare-fun e!590907 () Bool)

(assert (=> b!1043022 (= e!590906 e!590907)))

(declare-fun c!105898 () Bool)

(assert (=> b!1043022 (= c!105898 (validKeyInArray!0 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043023 () Bool)

(declare-fun e!590905 () Bool)

(assert (=> b!1043023 (= e!590907 e!590905)))

(declare-fun lt!459721 () (_ BitVec 64))

(assert (=> b!1043023 (= lt!459721 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459722 () Unit!34055)

(assert (=> b!1043023 (= lt!459722 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11627 thiss!1427) lt!459721 #b00000000000000000000000000000000))))

(assert (=> b!1043023 (arrayContainsKey!0 (_keys!11627 thiss!1427) lt!459721 #b00000000000000000000000000000000)))

(declare-fun lt!459723 () Unit!34055)

(assert (=> b!1043023 (= lt!459723 lt!459722)))

(declare-fun res!694932 () Bool)

(assert (=> b!1043023 (= res!694932 (= (seekEntryOrOpen!0 (select (arr!31629 (_keys!11627 thiss!1427)) #b00000000000000000000000000000000) (_keys!11627 thiss!1427) (mask!30448 thiss!1427)) (Found!9821 #b00000000000000000000000000000000)))))

(assert (=> b!1043023 (=> (not res!694932) (not e!590905))))

(declare-fun b!1043024 () Bool)

(declare-fun call!44210 () Bool)

(assert (=> b!1043024 (= e!590907 call!44210)))

(declare-fun bm!44207 () Bool)

(assert (=> bm!44207 (= call!44210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11627 thiss!1427) (mask!30448 thiss!1427)))))

(declare-fun b!1043025 () Bool)

(assert (=> b!1043025 (= e!590905 call!44210)))

(assert (= (and d!126213 (not res!694933)) b!1043022))

(assert (= (and b!1043022 c!105898) b!1043023))

(assert (= (and b!1043022 (not c!105898)) b!1043024))

(assert (= (and b!1043023 res!694932) b!1043025))

(assert (= (or b!1043025 b!1043024) bm!44207))

(assert (=> b!1043022 m!962217))

(assert (=> b!1043022 m!962217))

(assert (=> b!1043022 m!962219))

(assert (=> b!1043023 m!962217))

(declare-fun m!962271 () Bool)

(assert (=> b!1043023 m!962271))

(declare-fun m!962273 () Bool)

(assert (=> b!1043023 m!962273))

(assert (=> b!1043023 m!962217))

(declare-fun m!962275 () Bool)

(assert (=> b!1043023 m!962275))

(declare-fun m!962277 () Bool)

(assert (=> bm!44207 m!962277))

(assert (=> b!1042899 d!126213))

(declare-fun b!1043038 () Bool)

(declare-fun e!590914 () SeekEntryResult!9821)

(assert (=> b!1043038 (= e!590914 Undefined!9821)))

(declare-fun b!1043039 () Bool)

(declare-fun e!590916 () SeekEntryResult!9821)

(declare-fun lt!459735 () SeekEntryResult!9821)

(assert (=> b!1043039 (= e!590916 (MissingZero!9821 (index!41657 lt!459735)))))

(declare-fun b!1043040 () Bool)

(declare-fun e!590915 () SeekEntryResult!9821)

(assert (=> b!1043040 (= e!590915 (Found!9821 (index!41657 lt!459735)))))

(declare-fun b!1043042 () Bool)

(declare-fun lt!459732 () SeekEntryResult!9821)

(assert (=> b!1043042 (= e!590916 (ite ((_ is MissingVacant!9821) lt!459732) (MissingZero!9821 (index!41658 lt!459732)) lt!459732))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65748 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1043042 (= lt!459732 (seekKeyOrZeroReturnVacant!0 (x!93105 lt!459735) (index!41657 lt!459735) (index!41657 lt!459735) key!909 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)))))

(declare-fun b!1043043 () Bool)

(assert (=> b!1043043 (= e!590914 e!590915)))

(declare-fun lt!459734 () (_ BitVec 64))

(assert (=> b!1043043 (= lt!459734 (select (arr!31629 (_keys!11627 thiss!1427)) (index!41657 lt!459735)))))

(declare-fun c!105906 () Bool)

(assert (=> b!1043043 (= c!105906 (= lt!459734 key!909))))

(declare-fun b!1043041 () Bool)

(declare-fun c!105907 () Bool)

(assert (=> b!1043041 (= c!105907 (= lt!459734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043041 (= e!590915 e!590916)))

(declare-fun d!126215 () Bool)

(declare-fun lt!459733 () SeekEntryResult!9821)

(assert (=> d!126215 (and (or ((_ is MissingVacant!9821) lt!459733) (not ((_ is Found!9821) lt!459733)) (and (bvsge (index!41656 lt!459733) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459733) (size!32164 (_keys!11627 thiss!1427))))) (not ((_ is MissingVacant!9821) lt!459733)) (or (not ((_ is Found!9821) lt!459733)) (= (select (arr!31629 (_keys!11627 thiss!1427)) (index!41656 lt!459733)) key!909)))))

(assert (=> d!126215 (= lt!459733 e!590914)))

(declare-fun c!105905 () Bool)

(assert (=> d!126215 (= c!105905 (and ((_ is Intermediate!9821) lt!459735) (undefined!10633 lt!459735)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65748 (_ BitVec 32)) SeekEntryResult!9821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126215 (= lt!459735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30448 thiss!1427)) key!909 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)))))

(assert (=> d!126215 (validMask!0 (mask!30448 thiss!1427))))

(assert (=> d!126215 (= (seekEntry!0 key!909 (_keys!11627 thiss!1427) (mask!30448 thiss!1427)) lt!459733)))

(assert (= (and d!126215 c!105905) b!1043038))

(assert (= (and d!126215 (not c!105905)) b!1043043))

(assert (= (and b!1043043 c!105906) b!1043040))

(assert (= (and b!1043043 (not c!105906)) b!1043041))

(assert (= (and b!1043041 c!105907) b!1043039))

(assert (= (and b!1043041 (not c!105907)) b!1043042))

(declare-fun m!962279 () Bool)

(assert (=> b!1043042 m!962279))

(declare-fun m!962281 () Bool)

(assert (=> b!1043043 m!962281))

(declare-fun m!962283 () Bool)

(assert (=> d!126215 m!962283))

(declare-fun m!962285 () Bool)

(assert (=> d!126215 m!962285))

(assert (=> d!126215 m!962285))

(declare-fun m!962287 () Bool)

(assert (=> d!126215 m!962287))

(assert (=> d!126215 m!962145))

(assert (=> b!1042898 d!126215))

(declare-fun d!126217 () Bool)

(assert (=> d!126217 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042897 d!126217))

(declare-fun b!1043050 () Bool)

(declare-fun e!590922 () Bool)

(assert (=> b!1043050 (= e!590922 tp_is_empty!24795)))

(declare-fun condMapEmpty!38813 () Bool)

(declare-fun mapDefault!38813 () ValueCell!11694)

(assert (=> mapNonEmpty!38807 (= condMapEmpty!38813 (= mapRest!38807 ((as const (Array (_ BitVec 32) ValueCell!11694)) mapDefault!38813)))))

(declare-fun e!590921 () Bool)

(declare-fun mapRes!38813 () Bool)

(assert (=> mapNonEmpty!38807 (= tp!74457 (and e!590921 mapRes!38813))))

(declare-fun b!1043051 () Bool)

(assert (=> b!1043051 (= e!590921 tp_is_empty!24795)))

(declare-fun mapIsEmpty!38813 () Bool)

(assert (=> mapIsEmpty!38813 mapRes!38813))

(declare-fun mapNonEmpty!38813 () Bool)

(declare-fun tp!74466 () Bool)

(assert (=> mapNonEmpty!38813 (= mapRes!38813 (and tp!74466 e!590922))))

(declare-fun mapRest!38813 () (Array (_ BitVec 32) ValueCell!11694))

(declare-fun mapKey!38813 () (_ BitVec 32))

(declare-fun mapValue!38813 () ValueCell!11694)

(assert (=> mapNonEmpty!38813 (= mapRest!38807 (store mapRest!38813 mapKey!38813 mapValue!38813))))

(assert (= (and mapNonEmpty!38807 condMapEmpty!38813) mapIsEmpty!38813))

(assert (= (and mapNonEmpty!38807 (not condMapEmpty!38813)) mapNonEmpty!38813))

(assert (= (and mapNonEmpty!38813 ((_ is ValueCellFull!11694) mapValue!38813)) b!1043050))

(assert (= (and mapNonEmpty!38807 ((_ is ValueCellFull!11694) mapDefault!38813)) b!1043051))

(declare-fun m!962289 () Bool)

(assert (=> mapNonEmpty!38813 m!962289))

(check-sat (not b!1043006) (not bm!44204) (not b!1043014) (not d!126203) (not bm!44201) (not b!1042960) (not bm!44207) (not b!1042948) (not bm!44198) (not b!1042967) (not b_next!21075) (not b!1042988) (not d!126191) tp_is_empty!24795 (not d!126215) (not d!126211) (not b!1042959) (not b!1043003) (not bm!44205) (not d!126201) (not b!1043001) (not b!1043042) (not b!1043018) (not b!1042977) (not mapNonEmpty!38813) (not b!1043021) (not b!1042952) (not b!1043023) (not b!1043000) (not b!1042961) b_and!33607 (not b!1043007) (not b!1043016) (not b!1042950) (not b!1043022) (not b!1043013) (not b!1042976) (not bm!44206) (not d!126207))
(check-sat b_and!33607 (not b_next!21075))
