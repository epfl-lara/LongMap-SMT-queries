; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91894 () Bool)

(assert start!91894)

(declare-fun b!1045265 () Bool)

(declare-fun b_free!21135 () Bool)

(declare-fun b_next!21135 () Bool)

(assert (=> b!1045265 (= b_free!21135 (not b_next!21135))))

(declare-fun tp!74661 () Bool)

(declare-fun b_and!33749 () Bool)

(assert (=> b!1045265 (= tp!74661 b_and!33749)))

(declare-fun b!1045259 () Bool)

(declare-fun e!592489 () Bool)

(declare-fun e!592487 () Bool)

(assert (=> b!1045259 (= e!592489 (not e!592487))))

(declare-fun res!696018 () Bool)

(assert (=> b!1045259 (=> res!696018 e!592487)))

(declare-datatypes ((V!38013 0))(
  ( (V!38014 (val!12478 Int)) )
))
(declare-datatypes ((ValueCell!11724 0))(
  ( (ValueCellFull!11724 (v!15073 V!38013)) (EmptyCell!11724) )
))
(declare-datatypes ((Unit!34139 0))(
  ( (Unit!34140) )
))
(declare-datatypes ((array!65884 0))(
  ( (array!65885 (arr!31689 (Array (_ BitVec 32) (_ BitVec 64))) (size!32224 (_ BitVec 32))) )
))
(declare-datatypes ((array!65886 0))(
  ( (array!65887 (arr!31690 (Array (_ BitVec 32) ValueCell!11724)) (size!32225 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6042 0))(
  ( (LongMapFixedSize!6043 (defaultEntry!6415 Int) (mask!30540 (_ BitVec 32)) (extraKeys!6143 (_ BitVec 32)) (zeroValue!6249 V!38013) (minValue!6249 V!38013) (_size!3076 (_ BitVec 32)) (_keys!11685 array!65884) (_values!6438 array!65886) (_vacant!3076 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15784 0))(
  ( (tuple2!15785 (_1!7903 Unit!34139) (_2!7903 LongMapFixedSize!6042)) )
))
(declare-fun lt!461377 () tuple2!15784)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15786 0))(
  ( (tuple2!15787 (_1!7904 (_ BitVec 64)) (_2!7904 V!38013)) )
))
(declare-datatypes ((List!22016 0))(
  ( (Nil!22013) (Cons!22012 (h!23220 tuple2!15786) (t!31278 List!22016)) )
))
(declare-datatypes ((ListLongMap!13791 0))(
  ( (ListLongMap!13792 (toList!6911 List!22016)) )
))
(declare-fun contains!6079 (ListLongMap!13791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3959 (array!65884 array!65886 (_ BitVec 32) (_ BitVec 32) V!38013 V!38013 (_ BitVec 32) Int) ListLongMap!13791)

(assert (=> b!1045259 (= res!696018 (not (contains!6079 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))) key!909)))))

(declare-fun thiss!1427 () LongMapFixedSize!6042)

(declare-fun lt!461376 () array!65886)

(declare-fun lt!461378 () array!65884)

(declare-fun Unit!34141 () Unit!34139)

(declare-fun Unit!34142 () Unit!34139)

(assert (=> b!1045259 (= lt!461377 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3076 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15785 Unit!34141 (LongMapFixedSize!6043 (defaultEntry!6415 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) (bvsub (_size!3076 thiss!1427) #b00000000000000000000000000000001) lt!461378 lt!461376 (bvadd #b00000000000000000000000000000001 (_vacant!3076 thiss!1427)))) (tuple2!15785 Unit!34142 (LongMapFixedSize!6043 (defaultEntry!6415 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) (bvsub (_size!3076 thiss!1427) #b00000000000000000000000000000001) lt!461378 lt!461376 (_vacant!3076 thiss!1427)))))))

(declare-fun -!538 (ListLongMap!13791 (_ BitVec 64)) ListLongMap!13791)

(assert (=> b!1045259 (= (-!538 (getCurrentListMap!3959 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)) key!909) (getCurrentListMap!3959 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9846 0))(
  ( (MissingZero!9846 (index!41755 (_ BitVec 32))) (Found!9846 (index!41756 (_ BitVec 32))) (Intermediate!9846 (undefined!10658 Bool) (index!41757 (_ BitVec 32)) (x!93358 (_ BitVec 32))) (Undefined!9846) (MissingVacant!9846 (index!41758 (_ BitVec 32))) )
))
(declare-fun lt!461374 () SeekEntryResult!9846)

(declare-fun dynLambda!2008 (Int (_ BitVec 64)) V!38013)

(assert (=> b!1045259 (= lt!461376 (array!65887 (store (arr!31690 (_values!6438 thiss!1427)) (index!41756 lt!461374) (ValueCellFull!11724 (dynLambda!2008 (defaultEntry!6415 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32225 (_values!6438 thiss!1427))))))

(declare-fun lt!461380 () Unit!34139)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (array!65884 array!65886 (_ BitVec 32) (_ BitVec 32) V!38013 V!38013 (_ BitVec 32) (_ BitVec 64) Int) Unit!34139)

(assert (=> b!1045259 (= lt!461380 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) (index!41756 lt!461374) key!909 (defaultEntry!6415 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045259 (not (arrayContainsKey!0 lt!461378 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461381 () Unit!34139)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65884 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> b!1045259 (= lt!461381 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65884 (_ BitVec 32)) Bool)

(assert (=> b!1045259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461378 (mask!30540 thiss!1427))))

(declare-fun lt!461375 () Unit!34139)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65884 (_ BitVec 32) (_ BitVec 32)) Unit!34139)

(assert (=> b!1045259 (= lt!461375 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) (mask!30540 thiss!1427)))))

(declare-datatypes ((List!22017 0))(
  ( (Nil!22014) (Cons!22013 (h!23221 (_ BitVec 64)) (t!31279 List!22017)) )
))
(declare-fun arrayNoDuplicates!0 (array!65884 (_ BitVec 32) List!22017) Bool)

(assert (=> b!1045259 (arrayNoDuplicates!0 lt!461378 #b00000000000000000000000000000000 Nil!22014)))

(declare-fun lt!461373 () Unit!34139)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65884 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22017) Unit!34139)

(assert (=> b!1045259 (= lt!461373 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11685 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461374) #b00000000000000000000000000000000 Nil!22014))))

(declare-fun arrayCountValidKeys!0 (array!65884 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045259 (= (arrayCountValidKeys!0 lt!461378 #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11685 thiss!1427) #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045259 (= lt!461378 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun lt!461379 () Unit!34139)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65884 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> b!1045259 (= lt!461379 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!696021 () Bool)

(declare-fun e!592486 () Bool)

(assert (=> start!91894 (=> (not res!696021) (not e!592486))))

(declare-fun valid!2267 (LongMapFixedSize!6042) Bool)

(assert (=> start!91894 (= res!696021 (valid!2267 thiss!1427))))

(assert (=> start!91894 e!592486))

(declare-fun e!592484 () Bool)

(assert (=> start!91894 e!592484))

(assert (=> start!91894 true))

(declare-fun b!1045260 () Bool)

(declare-fun res!696020 () Bool)

(assert (=> b!1045260 (=> (not res!696020) (not e!592486))))

(assert (=> b!1045260 (= res!696020 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045261 () Bool)

(declare-fun e!592483 () Bool)

(declare-fun e!592482 () Bool)

(declare-fun mapRes!38921 () Bool)

(assert (=> b!1045261 (= e!592483 (and e!592482 mapRes!38921))))

(declare-fun condMapEmpty!38921 () Bool)

(declare-fun mapDefault!38921 () ValueCell!11724)

(assert (=> b!1045261 (= condMapEmpty!38921 (= (arr!31690 (_values!6438 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11724)) mapDefault!38921)))))

(declare-fun mapIsEmpty!38921 () Bool)

(assert (=> mapIsEmpty!38921 mapRes!38921))

(declare-fun b!1045262 () Bool)

(assert (=> b!1045262 (= e!592487 (or (not (= (size!32225 (_values!6438 (_2!7903 lt!461377))) (bvadd #b00000000000000000000000000000001 (mask!30540 (_2!7903 lt!461377))))) (not (= (size!32224 (_keys!11685 (_2!7903 lt!461377))) (size!32225 (_values!6438 (_2!7903 lt!461377))))) (bvslt (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000000000000) (bvsge (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38921 () Bool)

(declare-fun tp!74660 () Bool)

(declare-fun e!592488 () Bool)

(assert (=> mapNonEmpty!38921 (= mapRes!38921 (and tp!74660 e!592488))))

(declare-fun mapRest!38921 () (Array (_ BitVec 32) ValueCell!11724))

(declare-fun mapValue!38921 () ValueCell!11724)

(declare-fun mapKey!38921 () (_ BitVec 32))

(assert (=> mapNonEmpty!38921 (= (arr!31690 (_values!6438 thiss!1427)) (store mapRest!38921 mapKey!38921 mapValue!38921))))

(declare-fun b!1045263 () Bool)

(assert (=> b!1045263 (= e!592486 e!592489)))

(declare-fun res!696017 () Bool)

(assert (=> b!1045263 (=> (not res!696017) (not e!592489))))

(get-info :version)

(assert (=> b!1045263 (= res!696017 ((_ is Found!9846) lt!461374))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65884 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045263 (= lt!461374 (seekEntry!0 key!909 (_keys!11685 thiss!1427) (mask!30540 thiss!1427)))))

(declare-fun b!1045264 () Bool)

(declare-fun tp_is_empty!24855 () Bool)

(assert (=> b!1045264 (= e!592488 tp_is_empty!24855)))

(declare-fun array_inv!24477 (array!65884) Bool)

(declare-fun array_inv!24478 (array!65886) Bool)

(assert (=> b!1045265 (= e!592484 (and tp!74661 tp_is_empty!24855 (array_inv!24477 (_keys!11685 thiss!1427)) (array_inv!24478 (_values!6438 thiss!1427)) e!592483))))

(declare-fun b!1045266 () Bool)

(declare-fun res!696019 () Bool)

(assert (=> b!1045266 (=> res!696019 e!592487)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045266 (= res!696019 (not (validMask!0 (mask!30540 (_2!7903 lt!461377)))))))

(declare-fun b!1045267 () Bool)

(assert (=> b!1045267 (= e!592482 tp_is_empty!24855)))

(assert (= (and start!91894 res!696021) b!1045260))

(assert (= (and b!1045260 res!696020) b!1045263))

(assert (= (and b!1045263 res!696017) b!1045259))

(assert (= (and b!1045259 (not res!696018)) b!1045266))

(assert (= (and b!1045266 (not res!696019)) b!1045262))

(assert (= (and b!1045261 condMapEmpty!38921) mapIsEmpty!38921))

(assert (= (and b!1045261 (not condMapEmpty!38921)) mapNonEmpty!38921))

(assert (= (and mapNonEmpty!38921 ((_ is ValueCellFull!11724) mapValue!38921)) b!1045264))

(assert (= (and b!1045261 ((_ is ValueCellFull!11724) mapDefault!38921)) b!1045267))

(assert (= b!1045265 b!1045261))

(assert (= start!91894 b!1045265))

(declare-fun b_lambda!16287 () Bool)

(assert (=> (not b_lambda!16287) (not b!1045259)))

(declare-fun t!31277 () Bool)

(declare-fun tb!7083 () Bool)

(assert (=> (and b!1045265 (= (defaultEntry!6415 thiss!1427) (defaultEntry!6415 thiss!1427)) t!31277) tb!7083))

(declare-fun result!14591 () Bool)

(assert (=> tb!7083 (= result!14591 tp_is_empty!24855)))

(assert (=> b!1045259 t!31277))

(declare-fun b_and!33751 () Bool)

(assert (= b_and!33749 (and (=> t!31277 result!14591) b_and!33751)))

(declare-fun m!964919 () Bool)

(assert (=> start!91894 m!964919))

(declare-fun m!964921 () Bool)

(assert (=> b!1045263 m!964921))

(declare-fun m!964923 () Bool)

(assert (=> b!1045265 m!964923))

(declare-fun m!964925 () Bool)

(assert (=> b!1045265 m!964925))

(declare-fun m!964927 () Bool)

(assert (=> mapNonEmpty!38921 m!964927))

(declare-fun m!964929 () Bool)

(assert (=> b!1045259 m!964929))

(declare-fun m!964931 () Bool)

(assert (=> b!1045259 m!964931))

(declare-fun m!964933 () Bool)

(assert (=> b!1045259 m!964933))

(declare-fun m!964935 () Bool)

(assert (=> b!1045259 m!964935))

(declare-fun m!964937 () Bool)

(assert (=> b!1045259 m!964937))

(declare-fun m!964939 () Bool)

(assert (=> b!1045259 m!964939))

(declare-fun m!964941 () Bool)

(assert (=> b!1045259 m!964941))

(declare-fun m!964943 () Bool)

(assert (=> b!1045259 m!964943))

(declare-fun m!964945 () Bool)

(assert (=> b!1045259 m!964945))

(declare-fun m!964947 () Bool)

(assert (=> b!1045259 m!964947))

(declare-fun m!964949 () Bool)

(assert (=> b!1045259 m!964949))

(declare-fun m!964951 () Bool)

(assert (=> b!1045259 m!964951))

(declare-fun m!964953 () Bool)

(assert (=> b!1045259 m!964953))

(declare-fun m!964955 () Bool)

(assert (=> b!1045259 m!964955))

(declare-fun m!964957 () Bool)

(assert (=> b!1045259 m!964957))

(declare-fun m!964959 () Bool)

(assert (=> b!1045259 m!964959))

(assert (=> b!1045259 m!964943))

(declare-fun m!964961 () Bool)

(assert (=> b!1045259 m!964961))

(assert (=> b!1045259 m!964957))

(declare-fun m!964963 () Bool)

(assert (=> b!1045259 m!964963))

(declare-fun m!964965 () Bool)

(assert (=> b!1045266 m!964965))

(check-sat (not mapNonEmpty!38921) (not b_next!21135) (not b_lambda!16287) (not b!1045266) b_and!33751 (not start!91894) (not b!1045259) (not b!1045263) (not b!1045265) tp_is_empty!24855)
(check-sat b_and!33751 (not b_next!21135))
(get-model)

(declare-fun b_lambda!16291 () Bool)

(assert (= b_lambda!16287 (or (and b!1045265 b_free!21135) b_lambda!16291)))

(check-sat (not mapNonEmpty!38921) (not b_next!21135) (not b!1045266) b_and!33751 (not start!91894) (not b_lambda!16291) (not b!1045259) (not b!1045263) (not b!1045265) tp_is_empty!24855)
(check-sat b_and!33751 (not b_next!21135))
(get-model)

(declare-fun d!126501 () Bool)

(assert (=> d!126501 (= (validMask!0 (mask!30540 (_2!7903 lt!461377))) (and (or (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000000000111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000000001111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000000011111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000000111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000001111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000011111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000000111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000001111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000011111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000000111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000001111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000011111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000000111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000001111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000011111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000000111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000001111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000011111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000000111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000001111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000011111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000000111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000001111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000011111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00000111111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00001111111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00011111111111111111111111111111) (= (mask!30540 (_2!7903 lt!461377)) #b00111111111111111111111111111111)) (bvsle (mask!30540 (_2!7903 lt!461377)) #b00111111111111111111111111111111)))))

(assert (=> b!1045266 d!126501))

(declare-fun d!126503 () Bool)

(assert (=> d!126503 (= (array_inv!24477 (_keys!11685 thiss!1427)) (bvsge (size!32224 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045265 d!126503))

(declare-fun d!126505 () Bool)

(assert (=> d!126505 (= (array_inv!24478 (_values!6438 thiss!1427)) (bvsge (size!32225 (_values!6438 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045265 d!126505))

(declare-fun d!126507 () Bool)

(declare-fun res!696043 () Bool)

(declare-fun e!592516 () Bool)

(assert (=> d!126507 (=> (not res!696043) (not e!592516))))

(declare-fun simpleValid!452 (LongMapFixedSize!6042) Bool)

(assert (=> d!126507 (= res!696043 (simpleValid!452 thiss!1427))))

(assert (=> d!126507 (= (valid!2267 thiss!1427) e!592516)))

(declare-fun b!1045305 () Bool)

(declare-fun res!696044 () Bool)

(assert (=> b!1045305 (=> (not res!696044) (not e!592516))))

(assert (=> b!1045305 (= res!696044 (= (arrayCountValidKeys!0 (_keys!11685 thiss!1427) #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (_size!3076 thiss!1427)))))

(declare-fun b!1045306 () Bool)

(declare-fun res!696045 () Bool)

(assert (=> b!1045306 (=> (not res!696045) (not e!592516))))

(assert (=> b!1045306 (= res!696045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11685 thiss!1427) (mask!30540 thiss!1427)))))

(declare-fun b!1045307 () Bool)

(assert (=> b!1045307 (= e!592516 (arrayNoDuplicates!0 (_keys!11685 thiss!1427) #b00000000000000000000000000000000 Nil!22014))))

(assert (= (and d!126507 res!696043) b!1045305))

(assert (= (and b!1045305 res!696044) b!1045306))

(assert (= (and b!1045306 res!696045) b!1045307))

(declare-fun m!965015 () Bool)

(assert (=> d!126507 m!965015))

(assert (=> b!1045305 m!964955))

(declare-fun m!965017 () Bool)

(assert (=> b!1045306 m!965017))

(declare-fun m!965019 () Bool)

(assert (=> b!1045307 m!965019))

(assert (=> start!91894 d!126507))

(declare-fun b!1045316 () Bool)

(declare-fun e!592522 () (_ BitVec 32))

(assert (=> b!1045316 (= e!592522 #b00000000000000000000000000000000)))

(declare-fun bm!44478 () Bool)

(declare-fun call!44481 () (_ BitVec 32))

(assert (=> bm!44478 (= call!44481 (arrayCountValidKeys!0 lt!461378 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun b!1045317 () Bool)

(declare-fun e!592521 () (_ BitVec 32))

(assert (=> b!1045317 (= e!592521 (bvadd #b00000000000000000000000000000001 call!44481))))

(declare-fun b!1045318 () Bool)

(assert (=> b!1045318 (= e!592521 call!44481)))

(declare-fun d!126509 () Bool)

(declare-fun lt!461411 () (_ BitVec 32))

(assert (=> d!126509 (and (bvsge lt!461411 #b00000000000000000000000000000000) (bvsle lt!461411 (bvsub (size!32224 lt!461378) #b00000000000000000000000000000000)))))

(assert (=> d!126509 (= lt!461411 e!592522)))

(declare-fun c!106255 () Bool)

(assert (=> d!126509 (= c!106255 (bvsge #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(assert (=> d!126509 (and (bvsle #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32224 (_keys!11685 thiss!1427)) (size!32224 lt!461378)))))

(assert (=> d!126509 (= (arrayCountValidKeys!0 lt!461378 #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) lt!461411)))

(declare-fun b!1045319 () Bool)

(assert (=> b!1045319 (= e!592522 e!592521)))

(declare-fun c!106256 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045319 (= c!106256 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(assert (= (and d!126509 c!106255) b!1045316))

(assert (= (and d!126509 (not c!106255)) b!1045319))

(assert (= (and b!1045319 c!106256) b!1045317))

(assert (= (and b!1045319 (not c!106256)) b!1045318))

(assert (= (or b!1045317 b!1045318) bm!44478))

(declare-fun m!965021 () Bool)

(assert (=> bm!44478 m!965021))

(declare-fun m!965023 () Bool)

(assert (=> b!1045319 m!965023))

(assert (=> b!1045319 m!965023))

(declare-fun m!965025 () Bool)

(assert (=> b!1045319 m!965025))

(assert (=> b!1045259 d!126509))

(declare-fun d!126511 () Bool)

(declare-fun e!592525 () Bool)

(assert (=> d!126511 e!592525))

(declare-fun res!696048 () Bool)

(assert (=> d!126511 (=> (not res!696048) (not e!592525))))

(assert (=> d!126511 (= res!696048 (and (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427)))))))

(declare-fun lt!461414 () Unit!34139)

(declare-fun choose!25 (array!65884 (_ BitVec 32) (_ BitVec 32)) Unit!34139)

(assert (=> d!126511 (= lt!461414 (choose!25 (_keys!11685 thiss!1427) (index!41756 lt!461374) (mask!30540 thiss!1427)))))

(assert (=> d!126511 (validMask!0 (mask!30540 thiss!1427))))

(assert (=> d!126511 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) (mask!30540 thiss!1427)) lt!461414)))

(declare-fun b!1045322 () Bool)

(assert (=> b!1045322 (= e!592525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))) (mask!30540 thiss!1427)))))

(assert (= (and d!126511 res!696048) b!1045322))

(declare-fun m!965027 () Bool)

(assert (=> d!126511 m!965027))

(declare-fun m!965029 () Bool)

(assert (=> d!126511 m!965029))

(assert (=> b!1045322 m!964949))

(declare-fun m!965031 () Bool)

(assert (=> b!1045322 m!965031))

(assert (=> b!1045259 d!126511))

(declare-fun d!126513 () Bool)

(declare-fun e!592528 () Bool)

(assert (=> d!126513 e!592528))

(declare-fun res!696051 () Bool)

(assert (=> d!126513 (=> (not res!696051) (not e!592528))))

(assert (=> d!126513 (= res!696051 (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun lt!461417 () Unit!34139)

(declare-fun choose!121 (array!65884 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> d!126513 (= lt!461417 (choose!121 (_keys!11685 thiss!1427) (index!41756 lt!461374) key!909))))

(assert (=> d!126513 (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000)))

(assert (=> d!126513 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) key!909) lt!461417)))

(declare-fun b!1045325 () Bool)

(assert (=> b!1045325 (= e!592528 (not (arrayContainsKey!0 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126513 res!696051) b!1045325))

(declare-fun m!965033 () Bool)

(assert (=> d!126513 m!965033))

(assert (=> b!1045325 m!964949))

(declare-fun m!965035 () Bool)

(assert (=> b!1045325 m!965035))

(assert (=> b!1045259 d!126513))

(declare-fun d!126515 () Bool)

(declare-fun e!592531 () Bool)

(assert (=> d!126515 e!592531))

(declare-fun res!696054 () Bool)

(assert (=> d!126515 (=> (not res!696054) (not e!592531))))

(assert (=> d!126515 (= res!696054 (and (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427)))))))

(declare-fun lt!461420 () Unit!34139)

(declare-fun choose!1714 (array!65884 array!65886 (_ BitVec 32) (_ BitVec 32) V!38013 V!38013 (_ BitVec 32) (_ BitVec 64) Int) Unit!34139)

(assert (=> d!126515 (= lt!461420 (choose!1714 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) (index!41756 lt!461374) key!909 (defaultEntry!6415 thiss!1427)))))

(assert (=> d!126515 (validMask!0 (mask!30540 thiss!1427))))

(assert (=> d!126515 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) (index!41756 lt!461374) key!909 (defaultEntry!6415 thiss!1427)) lt!461420)))

(declare-fun b!1045328 () Bool)

(assert (=> b!1045328 (= e!592531 (= (-!538 (getCurrentListMap!3959 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)) key!909) (getCurrentListMap!3959 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))) (array!65887 (store (arr!31690 (_values!6438 thiss!1427)) (index!41756 lt!461374) (ValueCellFull!11724 (dynLambda!2008 (defaultEntry!6415 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32225 (_values!6438 thiss!1427))) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427))))))

(assert (=> b!1045328 (bvslt (index!41756 lt!461374) (size!32225 (_values!6438 thiss!1427)))))

(assert (= (and d!126515 res!696054) b!1045328))

(declare-fun b_lambda!16293 () Bool)

(assert (=> (not b_lambda!16293) (not b!1045328)))

(assert (=> b!1045328 t!31277))

(declare-fun b_and!33757 () Bool)

(assert (= b_and!33751 (and (=> t!31277 result!14591) b_and!33757)))

(declare-fun m!965037 () Bool)

(assert (=> d!126515 m!965037))

(assert (=> d!126515 m!965029))

(declare-fun m!965039 () Bool)

(assert (=> b!1045328 m!965039))

(assert (=> b!1045328 m!964937))

(assert (=> b!1045328 m!964949))

(assert (=> b!1045328 m!964957))

(assert (=> b!1045328 m!964959))

(assert (=> b!1045328 m!964957))

(assert (=> b!1045328 m!964947))

(assert (=> b!1045259 d!126515))

(declare-fun b!1045339 () Bool)

(declare-fun e!592537 () Bool)

(assert (=> b!1045339 (= e!592537 (bvslt (size!32224 (_keys!11685 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126517 () Bool)

(declare-fun e!592536 () Bool)

(assert (=> d!126517 e!592536))

(declare-fun res!696066 () Bool)

(assert (=> d!126517 (=> (not res!696066) (not e!592536))))

(assert (=> d!126517 (= res!696066 (and (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427)))))))

(declare-fun lt!461423 () Unit!34139)

(declare-fun choose!82 (array!65884 (_ BitVec 32) (_ BitVec 64)) Unit!34139)

(assert (=> d!126517 (= lt!461423 (choose!82 (_keys!11685 thiss!1427) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126517 e!592537))

(declare-fun res!696065 () Bool)

(assert (=> d!126517 (=> (not res!696065) (not e!592537))))

(assert (=> d!126517 (= res!696065 (and (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427)))))))

(assert (=> d!126517 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11685 thiss!1427) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461423)))

(declare-fun b!1045337 () Bool)

(declare-fun res!696064 () Bool)

(assert (=> b!1045337 (=> (not res!696064) (not e!592537))))

(assert (=> b!1045337 (= res!696064 (validKeyInArray!0 (select (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374))))))

(declare-fun b!1045338 () Bool)

(declare-fun res!696063 () Bool)

(assert (=> b!1045338 (=> (not res!696063) (not e!592537))))

(assert (=> b!1045338 (= res!696063 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045340 () Bool)

(assert (=> b!1045340 (= e!592536 (= (arrayCountValidKeys!0 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))) #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11685 thiss!1427) #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126517 res!696065) b!1045337))

(assert (= (and b!1045337 res!696064) b!1045338))

(assert (= (and b!1045338 res!696063) b!1045339))

(assert (= (and d!126517 res!696066) b!1045340))

(declare-fun m!965041 () Bool)

(assert (=> d!126517 m!965041))

(declare-fun m!965043 () Bool)

(assert (=> b!1045337 m!965043))

(assert (=> b!1045337 m!965043))

(declare-fun m!965045 () Bool)

(assert (=> b!1045337 m!965045))

(declare-fun m!965047 () Bool)

(assert (=> b!1045338 m!965047))

(assert (=> b!1045340 m!964949))

(declare-fun m!965049 () Bool)

(assert (=> b!1045340 m!965049))

(assert (=> b!1045340 m!964955))

(assert (=> b!1045259 d!126517))

(declare-fun b!1045383 () Bool)

(declare-fun c!106271 () Bool)

(assert (=> b!1045383 (= c!106271 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592566 () ListLongMap!13791)

(declare-fun e!592574 () ListLongMap!13791)

(assert (=> b!1045383 (= e!592566 e!592574)))

(declare-fun bm!44493 () Bool)

(declare-fun call!44498 () Bool)

(declare-fun lt!461488 () ListLongMap!13791)

(assert (=> bm!44493 (= call!44498 (contains!6079 lt!461488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045384 () Bool)

(declare-fun e!592567 () ListLongMap!13791)

(assert (=> b!1045384 (= e!592567 e!592566)))

(declare-fun c!106273 () Bool)

(assert (=> b!1045384 (= c!106273 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045385 () Bool)

(declare-fun call!44500 () ListLongMap!13791)

(assert (=> b!1045385 (= e!592574 call!44500)))

(declare-fun call!44497 () ListLongMap!13791)

(declare-fun call!44496 () ListLongMap!13791)

(declare-fun c!106270 () Bool)

(declare-fun bm!44494 () Bool)

(declare-fun call!44502 () ListLongMap!13791)

(declare-fun call!44499 () ListLongMap!13791)

(declare-fun +!3112 (ListLongMap!13791 tuple2!15786) ListLongMap!13791)

(assert (=> bm!44494 (= call!44497 (+!3112 (ite c!106270 call!44499 (ite c!106273 call!44496 call!44502)) (ite (or c!106270 c!106273) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6249 thiss!1427)) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 thiss!1427)))))))

(declare-fun b!1045386 () Bool)

(assert (=> b!1045386 (= e!592567 (+!3112 call!44497 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 thiss!1427))))))

(declare-fun b!1045387 () Bool)

(declare-fun e!592576 () Bool)

(assert (=> b!1045387 (= e!592576 (validKeyInArray!0 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045388 () Bool)

(declare-fun res!696090 () Bool)

(declare-fun e!592572 () Bool)

(assert (=> b!1045388 (=> (not res!696090) (not e!592572))))

(declare-fun e!592568 () Bool)

(assert (=> b!1045388 (= res!696090 e!592568)))

(declare-fun c!106272 () Bool)

(assert (=> b!1045388 (= c!106272 (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045389 () Bool)

(declare-fun e!592569 () Unit!34139)

(declare-fun Unit!34147 () Unit!34139)

(assert (=> b!1045389 (= e!592569 Unit!34147)))

(declare-fun d!126519 () Bool)

(assert (=> d!126519 e!592572))

(declare-fun res!696088 () Bool)

(assert (=> d!126519 (=> (not res!696088) (not e!592572))))

(assert (=> d!126519 (= res!696088 (or (bvsge #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))))

(declare-fun lt!461478 () ListLongMap!13791)

(assert (=> d!126519 (= lt!461488 lt!461478)))

(declare-fun lt!461479 () Unit!34139)

(assert (=> d!126519 (= lt!461479 e!592569)))

(declare-fun c!106274 () Bool)

(declare-fun e!592573 () Bool)

(assert (=> d!126519 (= c!106274 e!592573)))

(declare-fun res!696087 () Bool)

(assert (=> d!126519 (=> (not res!696087) (not e!592573))))

(assert (=> d!126519 (= res!696087 (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(assert (=> d!126519 (= lt!461478 e!592567)))

(assert (=> d!126519 (= c!106270 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126519 (validMask!0 (mask!30540 thiss!1427))))

(assert (=> d!126519 (= (getCurrentListMap!3959 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)) lt!461488)))

(declare-fun bm!44495 () Bool)

(assert (=> bm!44495 (= call!44500 call!44497)))

(declare-fun b!1045390 () Bool)

(declare-fun e!592571 () Bool)

(declare-fun apply!914 (ListLongMap!13791 (_ BitVec 64)) V!38013)

(assert (=> b!1045390 (= e!592571 (= (apply!914 lt!461488 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6249 thiss!1427)))))

(declare-fun b!1045391 () Bool)

(declare-fun e!592564 () Bool)

(assert (=> b!1045391 (= e!592564 (not call!44498))))

(declare-fun b!1045392 () Bool)

(declare-fun e!592570 () Bool)

(assert (=> b!1045392 (= e!592570 (= (apply!914 lt!461488 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6249 thiss!1427)))))

(declare-fun bm!44496 () Bool)

(assert (=> bm!44496 (= call!44502 call!44496)))

(declare-fun b!1045393 () Bool)

(assert (=> b!1045393 (= e!592566 call!44500)))

(declare-fun b!1045394 () Bool)

(assert (=> b!1045394 (= e!592573 (validKeyInArray!0 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045395 () Bool)

(declare-fun res!696085 () Bool)

(assert (=> b!1045395 (=> (not res!696085) (not e!592572))))

(declare-fun e!592565 () Bool)

(assert (=> b!1045395 (= res!696085 e!592565)))

(declare-fun res!696092 () Bool)

(assert (=> b!1045395 (=> res!696092 e!592565)))

(assert (=> b!1045395 (= res!696092 (not e!592576))))

(declare-fun res!696089 () Bool)

(assert (=> b!1045395 (=> (not res!696089) (not e!592576))))

(assert (=> b!1045395 (= res!696089 (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun b!1045396 () Bool)

(assert (=> b!1045396 (= e!592564 e!592570)))

(declare-fun res!696093 () Bool)

(assert (=> b!1045396 (= res!696093 call!44498)))

(assert (=> b!1045396 (=> (not res!696093) (not e!592570))))

(declare-fun bm!44497 () Bool)

(assert (=> bm!44497 (= call!44496 call!44499)))

(declare-fun b!1045397 () Bool)

(declare-fun call!44501 () Bool)

(assert (=> b!1045397 (= e!592568 (not call!44501))))

(declare-fun b!1045398 () Bool)

(assert (=> b!1045398 (= e!592572 e!592564)))

(declare-fun c!106269 () Bool)

(assert (=> b!1045398 (= c!106269 (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44498 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3528 (array!65884 array!65886 (_ BitVec 32) (_ BitVec 32) V!38013 V!38013 (_ BitVec 32) Int) ListLongMap!13791)

(assert (=> bm!44498 (= call!44499 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun b!1045399 () Bool)

(declare-fun lt!461484 () Unit!34139)

(assert (=> b!1045399 (= e!592569 lt!461484)))

(declare-fun lt!461480 () ListLongMap!13791)

(assert (=> b!1045399 (= lt!461480 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461476 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461481 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461481 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461487 () Unit!34139)

(declare-fun addStillContains!633 (ListLongMap!13791 (_ BitVec 64) V!38013 (_ BitVec 64)) Unit!34139)

(assert (=> b!1045399 (= lt!461487 (addStillContains!633 lt!461480 lt!461476 (zeroValue!6249 thiss!1427) lt!461481))))

(assert (=> b!1045399 (contains!6079 (+!3112 lt!461480 (tuple2!15787 lt!461476 (zeroValue!6249 thiss!1427))) lt!461481)))

(declare-fun lt!461469 () Unit!34139)

(assert (=> b!1045399 (= lt!461469 lt!461487)))

(declare-fun lt!461471 () ListLongMap!13791)

(assert (=> b!1045399 (= lt!461471 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461470 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461470 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461474 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461474 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461473 () Unit!34139)

(declare-fun addApplyDifferent!493 (ListLongMap!13791 (_ BitVec 64) V!38013 (_ BitVec 64)) Unit!34139)

(assert (=> b!1045399 (= lt!461473 (addApplyDifferent!493 lt!461471 lt!461470 (minValue!6249 thiss!1427) lt!461474))))

(assert (=> b!1045399 (= (apply!914 (+!3112 lt!461471 (tuple2!15787 lt!461470 (minValue!6249 thiss!1427))) lt!461474) (apply!914 lt!461471 lt!461474))))

(declare-fun lt!461482 () Unit!34139)

(assert (=> b!1045399 (= lt!461482 lt!461473)))

(declare-fun lt!461486 () ListLongMap!13791)

(assert (=> b!1045399 (= lt!461486 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461475 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461489 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461489 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461483 () Unit!34139)

(assert (=> b!1045399 (= lt!461483 (addApplyDifferent!493 lt!461486 lt!461475 (zeroValue!6249 thiss!1427) lt!461489))))

(assert (=> b!1045399 (= (apply!914 (+!3112 lt!461486 (tuple2!15787 lt!461475 (zeroValue!6249 thiss!1427))) lt!461489) (apply!914 lt!461486 lt!461489))))

(declare-fun lt!461468 () Unit!34139)

(assert (=> b!1045399 (= lt!461468 lt!461483)))

(declare-fun lt!461477 () ListLongMap!13791)

(assert (=> b!1045399 (= lt!461477 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461472 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461472 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461485 () (_ BitVec 64))

(assert (=> b!1045399 (= lt!461485 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045399 (= lt!461484 (addApplyDifferent!493 lt!461477 lt!461472 (minValue!6249 thiss!1427) lt!461485))))

(assert (=> b!1045399 (= (apply!914 (+!3112 lt!461477 (tuple2!15787 lt!461472 (minValue!6249 thiss!1427))) lt!461485) (apply!914 lt!461477 lt!461485))))

(declare-fun bm!44499 () Bool)

(assert (=> bm!44499 (= call!44501 (contains!6079 lt!461488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045400 () Bool)

(declare-fun e!592575 () Bool)

(declare-fun get!16559 (ValueCell!11724 V!38013) V!38013)

(assert (=> b!1045400 (= e!592575 (= (apply!914 lt!461488 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)) (get!16559 (select (arr!31690 (_values!6438 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2008 (defaultEntry!6415 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32225 (_values!6438 thiss!1427))))))

(assert (=> b!1045400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun b!1045401 () Bool)

(assert (=> b!1045401 (= e!592574 call!44502)))

(declare-fun b!1045402 () Bool)

(assert (=> b!1045402 (= e!592565 e!592575)))

(declare-fun res!696091 () Bool)

(assert (=> b!1045402 (=> (not res!696091) (not e!592575))))

(assert (=> b!1045402 (= res!696091 (contains!6079 lt!461488 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun b!1045403 () Bool)

(assert (=> b!1045403 (= e!592568 e!592571)))

(declare-fun res!696086 () Bool)

(assert (=> b!1045403 (= res!696086 call!44501)))

(assert (=> b!1045403 (=> (not res!696086) (not e!592571))))

(assert (= (and d!126519 c!106270) b!1045386))

(assert (= (and d!126519 (not c!106270)) b!1045384))

(assert (= (and b!1045384 c!106273) b!1045393))

(assert (= (and b!1045384 (not c!106273)) b!1045383))

(assert (= (and b!1045383 c!106271) b!1045385))

(assert (= (and b!1045383 (not c!106271)) b!1045401))

(assert (= (or b!1045385 b!1045401) bm!44496))

(assert (= (or b!1045393 bm!44496) bm!44497))

(assert (= (or b!1045393 b!1045385) bm!44495))

(assert (= (or b!1045386 bm!44497) bm!44498))

(assert (= (or b!1045386 bm!44495) bm!44494))

(assert (= (and d!126519 res!696087) b!1045394))

(assert (= (and d!126519 c!106274) b!1045399))

(assert (= (and d!126519 (not c!106274)) b!1045389))

(assert (= (and d!126519 res!696088) b!1045395))

(assert (= (and b!1045395 res!696089) b!1045387))

(assert (= (and b!1045395 (not res!696092)) b!1045402))

(assert (= (and b!1045402 res!696091) b!1045400))

(assert (= (and b!1045395 res!696085) b!1045388))

(assert (= (and b!1045388 c!106272) b!1045403))

(assert (= (and b!1045388 (not c!106272)) b!1045397))

(assert (= (and b!1045403 res!696086) b!1045390))

(assert (= (or b!1045403 b!1045397) bm!44499))

(assert (= (and b!1045388 res!696090) b!1045398))

(assert (= (and b!1045398 c!106269) b!1045396))

(assert (= (and b!1045398 (not c!106269)) b!1045391))

(assert (= (and b!1045396 res!696093) b!1045392))

(assert (= (or b!1045396 b!1045391) bm!44493))

(declare-fun b_lambda!16295 () Bool)

(assert (=> (not b_lambda!16295) (not b!1045400)))

(assert (=> b!1045400 t!31277))

(declare-fun b_and!33759 () Bool)

(assert (= b_and!33757 (and (=> t!31277 result!14591) b_and!33759)))

(declare-fun m!965051 () Bool)

(assert (=> b!1045399 m!965051))

(declare-fun m!965053 () Bool)

(assert (=> b!1045399 m!965053))

(declare-fun m!965055 () Bool)

(assert (=> b!1045399 m!965055))

(declare-fun m!965057 () Bool)

(assert (=> b!1045399 m!965057))

(declare-fun m!965059 () Bool)

(assert (=> b!1045399 m!965059))

(declare-fun m!965061 () Bool)

(assert (=> b!1045399 m!965061))

(declare-fun m!965063 () Bool)

(assert (=> b!1045399 m!965063))

(declare-fun m!965065 () Bool)

(assert (=> b!1045399 m!965065))

(declare-fun m!965067 () Bool)

(assert (=> b!1045399 m!965067))

(assert (=> b!1045399 m!965067))

(declare-fun m!965069 () Bool)

(assert (=> b!1045399 m!965069))

(declare-fun m!965071 () Bool)

(assert (=> b!1045399 m!965071))

(declare-fun m!965073 () Bool)

(assert (=> b!1045399 m!965073))

(declare-fun m!965075 () Bool)

(assert (=> b!1045399 m!965075))

(declare-fun m!965077 () Bool)

(assert (=> b!1045399 m!965077))

(declare-fun m!965079 () Bool)

(assert (=> b!1045399 m!965079))

(assert (=> b!1045399 m!965061))

(declare-fun m!965081 () Bool)

(assert (=> b!1045399 m!965081))

(declare-fun m!965083 () Bool)

(assert (=> b!1045399 m!965083))

(assert (=> b!1045399 m!965055))

(assert (=> b!1045399 m!965077))

(assert (=> b!1045402 m!965059))

(assert (=> b!1045402 m!965059))

(declare-fun m!965085 () Bool)

(assert (=> b!1045402 m!965085))

(assert (=> d!126519 m!965029))

(assert (=> b!1045400 m!965059))

(declare-fun m!965087 () Bool)

(assert (=> b!1045400 m!965087))

(assert (=> b!1045400 m!965087))

(assert (=> b!1045400 m!964947))

(declare-fun m!965089 () Bool)

(assert (=> b!1045400 m!965089))

(assert (=> b!1045400 m!965059))

(declare-fun m!965091 () Bool)

(assert (=> b!1045400 m!965091))

(assert (=> b!1045400 m!964947))

(declare-fun m!965093 () Bool)

(assert (=> bm!44494 m!965093))

(declare-fun m!965095 () Bool)

(assert (=> b!1045390 m!965095))

(declare-fun m!965097 () Bool)

(assert (=> bm!44499 m!965097))

(assert (=> b!1045394 m!965059))

(assert (=> b!1045394 m!965059))

(declare-fun m!965099 () Bool)

(assert (=> b!1045394 m!965099))

(declare-fun m!965101 () Bool)

(assert (=> b!1045386 m!965101))

(assert (=> b!1045387 m!965059))

(assert (=> b!1045387 m!965059))

(assert (=> b!1045387 m!965099))

(declare-fun m!965103 () Bool)

(assert (=> bm!44493 m!965103))

(declare-fun m!965105 () Bool)

(assert (=> b!1045392 m!965105))

(assert (=> bm!44498 m!965083))

(assert (=> b!1045259 d!126519))

(declare-fun d!126521 () Bool)

(declare-fun lt!461492 () ListLongMap!13791)

(assert (=> d!126521 (not (contains!6079 lt!461492 key!909))))

(declare-fun removeStrictlySorted!64 (List!22016 (_ BitVec 64)) List!22016)

(assert (=> d!126521 (= lt!461492 (ListLongMap!13792 (removeStrictlySorted!64 (toList!6911 (getCurrentListMap!3959 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427))) key!909)))))

(assert (=> d!126521 (= (-!538 (getCurrentListMap!3959 (_keys!11685 thiss!1427) (_values!6438 thiss!1427) (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)) key!909) lt!461492)))

(declare-fun bs!30527 () Bool)

(assert (= bs!30527 d!126521))

(declare-fun m!965107 () Bool)

(assert (=> bs!30527 m!965107))

(declare-fun m!965109 () Bool)

(assert (=> bs!30527 m!965109))

(assert (=> b!1045259 d!126521))

(declare-fun b!1045404 () Bool)

(declare-fun c!106277 () Bool)

(assert (=> b!1045404 (= c!106277 (and (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592579 () ListLongMap!13791)

(declare-fun e!592587 () ListLongMap!13791)

(assert (=> b!1045404 (= e!592579 e!592587)))

(declare-fun bm!44500 () Bool)

(declare-fun call!44505 () Bool)

(declare-fun lt!461513 () ListLongMap!13791)

(assert (=> bm!44500 (= call!44505 (contains!6079 lt!461513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045405 () Bool)

(declare-fun e!592580 () ListLongMap!13791)

(assert (=> b!1045405 (= e!592580 e!592579)))

(declare-fun c!106279 () Bool)

(assert (=> b!1045405 (= c!106279 (and (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045406 () Bool)

(declare-fun call!44507 () ListLongMap!13791)

(assert (=> b!1045406 (= e!592587 call!44507)))

(declare-fun call!44504 () ListLongMap!13791)

(declare-fun c!106276 () Bool)

(declare-fun call!44506 () ListLongMap!13791)

(declare-fun call!44509 () ListLongMap!13791)

(declare-fun call!44503 () ListLongMap!13791)

(declare-fun bm!44501 () Bool)

(assert (=> bm!44501 (= call!44504 (+!3112 (ite c!106276 call!44506 (ite c!106279 call!44503 call!44509)) (ite (or c!106276 c!106279) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6249 (_2!7903 lt!461377))) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 (_2!7903 lt!461377))))))))

(declare-fun b!1045407 () Bool)

(assert (=> b!1045407 (= e!592580 (+!3112 call!44504 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 (_2!7903 lt!461377)))))))

(declare-fun b!1045408 () Bool)

(declare-fun e!592589 () Bool)

(assert (=> b!1045408 (= e!592589 (validKeyInArray!0 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000)))))

(declare-fun b!1045409 () Bool)

(declare-fun res!696099 () Bool)

(declare-fun e!592585 () Bool)

(assert (=> b!1045409 (=> (not res!696099) (not e!592585))))

(declare-fun e!592581 () Bool)

(assert (=> b!1045409 (= res!696099 e!592581)))

(declare-fun c!106278 () Bool)

(assert (=> b!1045409 (= c!106278 (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045410 () Bool)

(declare-fun e!592582 () Unit!34139)

(declare-fun Unit!34148 () Unit!34139)

(assert (=> b!1045410 (= e!592582 Unit!34148)))

(declare-fun d!126523 () Bool)

(assert (=> d!126523 e!592585))

(declare-fun res!696097 () Bool)

(assert (=> d!126523 (=> (not res!696097) (not e!592585))))

(assert (=> d!126523 (= res!696097 (or (bvsge #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))))))))

(declare-fun lt!461503 () ListLongMap!13791)

(assert (=> d!126523 (= lt!461513 lt!461503)))

(declare-fun lt!461504 () Unit!34139)

(assert (=> d!126523 (= lt!461504 e!592582)))

(declare-fun c!106280 () Bool)

(declare-fun e!592586 () Bool)

(assert (=> d!126523 (= c!106280 e!592586)))

(declare-fun res!696096 () Bool)

(assert (=> d!126523 (=> (not res!696096) (not e!592586))))

(assert (=> d!126523 (= res!696096 (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))))))

(assert (=> d!126523 (= lt!461503 e!592580)))

(assert (=> d!126523 (= c!106276 (and (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126523 (validMask!0 (mask!30540 (_2!7903 lt!461377)))))

(assert (=> d!126523 (= (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))) lt!461513)))

(declare-fun bm!44502 () Bool)

(assert (=> bm!44502 (= call!44507 call!44504)))

(declare-fun b!1045411 () Bool)

(declare-fun e!592584 () Bool)

(assert (=> b!1045411 (= e!592584 (= (apply!914 lt!461513 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6249 (_2!7903 lt!461377))))))

(declare-fun b!1045412 () Bool)

(declare-fun e!592577 () Bool)

(assert (=> b!1045412 (= e!592577 (not call!44505))))

(declare-fun b!1045413 () Bool)

(declare-fun e!592583 () Bool)

(assert (=> b!1045413 (= e!592583 (= (apply!914 lt!461513 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6249 (_2!7903 lt!461377))))))

(declare-fun bm!44503 () Bool)

(assert (=> bm!44503 (= call!44509 call!44503)))

(declare-fun b!1045414 () Bool)

(assert (=> b!1045414 (= e!592579 call!44507)))

(declare-fun b!1045415 () Bool)

(assert (=> b!1045415 (= e!592586 (validKeyInArray!0 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000)))))

(declare-fun b!1045416 () Bool)

(declare-fun res!696094 () Bool)

(assert (=> b!1045416 (=> (not res!696094) (not e!592585))))

(declare-fun e!592578 () Bool)

(assert (=> b!1045416 (= res!696094 e!592578)))

(declare-fun res!696101 () Bool)

(assert (=> b!1045416 (=> res!696101 e!592578)))

(assert (=> b!1045416 (= res!696101 (not e!592589))))

(declare-fun res!696098 () Bool)

(assert (=> b!1045416 (=> (not res!696098) (not e!592589))))

(assert (=> b!1045416 (= res!696098 (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))))))

(declare-fun b!1045417 () Bool)

(assert (=> b!1045417 (= e!592577 e!592583)))

(declare-fun res!696102 () Bool)

(assert (=> b!1045417 (= res!696102 call!44505)))

(assert (=> b!1045417 (=> (not res!696102) (not e!592583))))

(declare-fun bm!44504 () Bool)

(assert (=> bm!44504 (= call!44503 call!44506)))

(declare-fun b!1045418 () Bool)

(declare-fun call!44508 () Bool)

(assert (=> b!1045418 (= e!592581 (not call!44508))))

(declare-fun b!1045419 () Bool)

(assert (=> b!1045419 (= e!592585 e!592577)))

(declare-fun c!106275 () Bool)

(assert (=> b!1045419 (= c!106275 (not (= (bvand (extraKeys!6143 (_2!7903 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44505 () Bool)

(assert (=> bm!44505 (= call!44506 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))))))

(declare-fun b!1045420 () Bool)

(declare-fun lt!461509 () Unit!34139)

(assert (=> b!1045420 (= e!592582 lt!461509)))

(declare-fun lt!461505 () ListLongMap!13791)

(assert (=> b!1045420 (= lt!461505 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))))))

(declare-fun lt!461501 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461506 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461506 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461512 () Unit!34139)

(assert (=> b!1045420 (= lt!461512 (addStillContains!633 lt!461505 lt!461501 (zeroValue!6249 (_2!7903 lt!461377)) lt!461506))))

(assert (=> b!1045420 (contains!6079 (+!3112 lt!461505 (tuple2!15787 lt!461501 (zeroValue!6249 (_2!7903 lt!461377)))) lt!461506)))

(declare-fun lt!461494 () Unit!34139)

(assert (=> b!1045420 (= lt!461494 lt!461512)))

(declare-fun lt!461496 () ListLongMap!13791)

(assert (=> b!1045420 (= lt!461496 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))))))

(declare-fun lt!461495 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461495 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461499 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461499 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461498 () Unit!34139)

(assert (=> b!1045420 (= lt!461498 (addApplyDifferent!493 lt!461496 lt!461495 (minValue!6249 (_2!7903 lt!461377)) lt!461499))))

(assert (=> b!1045420 (= (apply!914 (+!3112 lt!461496 (tuple2!15787 lt!461495 (minValue!6249 (_2!7903 lt!461377)))) lt!461499) (apply!914 lt!461496 lt!461499))))

(declare-fun lt!461507 () Unit!34139)

(assert (=> b!1045420 (= lt!461507 lt!461498)))

(declare-fun lt!461511 () ListLongMap!13791)

(assert (=> b!1045420 (= lt!461511 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))))))

(declare-fun lt!461500 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461514 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461514 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461508 () Unit!34139)

(assert (=> b!1045420 (= lt!461508 (addApplyDifferent!493 lt!461511 lt!461500 (zeroValue!6249 (_2!7903 lt!461377)) lt!461514))))

(assert (=> b!1045420 (= (apply!914 (+!3112 lt!461511 (tuple2!15787 lt!461500 (zeroValue!6249 (_2!7903 lt!461377)))) lt!461514) (apply!914 lt!461511 lt!461514))))

(declare-fun lt!461493 () Unit!34139)

(assert (=> b!1045420 (= lt!461493 lt!461508)))

(declare-fun lt!461502 () ListLongMap!13791)

(assert (=> b!1045420 (= lt!461502 (getCurrentListMapNoExtraKeys!3528 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))))))

(declare-fun lt!461497 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461497 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461510 () (_ BitVec 64))

(assert (=> b!1045420 (= lt!461510 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000))))

(assert (=> b!1045420 (= lt!461509 (addApplyDifferent!493 lt!461502 lt!461497 (minValue!6249 (_2!7903 lt!461377)) lt!461510))))

(assert (=> b!1045420 (= (apply!914 (+!3112 lt!461502 (tuple2!15787 lt!461497 (minValue!6249 (_2!7903 lt!461377)))) lt!461510) (apply!914 lt!461502 lt!461510))))

(declare-fun bm!44506 () Bool)

(assert (=> bm!44506 (= call!44508 (contains!6079 lt!461513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045421 () Bool)

(declare-fun e!592588 () Bool)

(assert (=> b!1045421 (= e!592588 (= (apply!914 lt!461513 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000)) (get!16559 (select (arr!31690 (_values!6438 (_2!7903 lt!461377))) #b00000000000000000000000000000000) (dynLambda!2008 (defaultEntry!6415 (_2!7903 lt!461377)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32225 (_values!6438 (_2!7903 lt!461377)))))))

(assert (=> b!1045421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))))))

(declare-fun b!1045422 () Bool)

(assert (=> b!1045422 (= e!592587 call!44509)))

(declare-fun b!1045423 () Bool)

(assert (=> b!1045423 (= e!592578 e!592588)))

(declare-fun res!696100 () Bool)

(assert (=> b!1045423 (=> (not res!696100) (not e!592588))))

(assert (=> b!1045423 (= res!696100 (contains!6079 lt!461513 (select (arr!31689 (_keys!11685 (_2!7903 lt!461377))) #b00000000000000000000000000000000)))))

(assert (=> b!1045423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_keys!11685 (_2!7903 lt!461377)))))))

(declare-fun b!1045424 () Bool)

(assert (=> b!1045424 (= e!592581 e!592584)))

(declare-fun res!696095 () Bool)

(assert (=> b!1045424 (= res!696095 call!44508)))

(assert (=> b!1045424 (=> (not res!696095) (not e!592584))))

(assert (= (and d!126523 c!106276) b!1045407))

(assert (= (and d!126523 (not c!106276)) b!1045405))

(assert (= (and b!1045405 c!106279) b!1045414))

(assert (= (and b!1045405 (not c!106279)) b!1045404))

(assert (= (and b!1045404 c!106277) b!1045406))

(assert (= (and b!1045404 (not c!106277)) b!1045422))

(assert (= (or b!1045406 b!1045422) bm!44503))

(assert (= (or b!1045414 bm!44503) bm!44504))

(assert (= (or b!1045414 b!1045406) bm!44502))

(assert (= (or b!1045407 bm!44504) bm!44505))

(assert (= (or b!1045407 bm!44502) bm!44501))

(assert (= (and d!126523 res!696096) b!1045415))

(assert (= (and d!126523 c!106280) b!1045420))

(assert (= (and d!126523 (not c!106280)) b!1045410))

(assert (= (and d!126523 res!696097) b!1045416))

(assert (= (and b!1045416 res!696098) b!1045408))

(assert (= (and b!1045416 (not res!696101)) b!1045423))

(assert (= (and b!1045423 res!696100) b!1045421))

(assert (= (and b!1045416 res!696094) b!1045409))

(assert (= (and b!1045409 c!106278) b!1045424))

(assert (= (and b!1045409 (not c!106278)) b!1045418))

(assert (= (and b!1045424 res!696095) b!1045411))

(assert (= (or b!1045424 b!1045418) bm!44506))

(assert (= (and b!1045409 res!696099) b!1045419))

(assert (= (and b!1045419 c!106275) b!1045417))

(assert (= (and b!1045419 (not c!106275)) b!1045412))

(assert (= (and b!1045417 res!696102) b!1045413))

(assert (= (or b!1045417 b!1045412) bm!44500))

(declare-fun b_lambda!16297 () Bool)

(assert (=> (not b_lambda!16297) (not b!1045421)))

(declare-fun t!31285 () Bool)

(declare-fun tb!7087 () Bool)

(assert (=> (and b!1045265 (= (defaultEntry!6415 thiss!1427) (defaultEntry!6415 (_2!7903 lt!461377))) t!31285) tb!7087))

(declare-fun result!14599 () Bool)

(assert (=> tb!7087 (= result!14599 tp_is_empty!24855)))

(assert (=> b!1045421 t!31285))

(declare-fun b_and!33761 () Bool)

(assert (= b_and!33759 (and (=> t!31285 result!14599) b_and!33761)))

(declare-fun m!965111 () Bool)

(assert (=> b!1045420 m!965111))

(declare-fun m!965113 () Bool)

(assert (=> b!1045420 m!965113))

(declare-fun m!965115 () Bool)

(assert (=> b!1045420 m!965115))

(declare-fun m!965117 () Bool)

(assert (=> b!1045420 m!965117))

(declare-fun m!965119 () Bool)

(assert (=> b!1045420 m!965119))

(declare-fun m!965121 () Bool)

(assert (=> b!1045420 m!965121))

(declare-fun m!965123 () Bool)

(assert (=> b!1045420 m!965123))

(declare-fun m!965125 () Bool)

(assert (=> b!1045420 m!965125))

(declare-fun m!965127 () Bool)

(assert (=> b!1045420 m!965127))

(assert (=> b!1045420 m!965127))

(declare-fun m!965129 () Bool)

(assert (=> b!1045420 m!965129))

(declare-fun m!965131 () Bool)

(assert (=> b!1045420 m!965131))

(declare-fun m!965133 () Bool)

(assert (=> b!1045420 m!965133))

(declare-fun m!965135 () Bool)

(assert (=> b!1045420 m!965135))

(declare-fun m!965137 () Bool)

(assert (=> b!1045420 m!965137))

(declare-fun m!965139 () Bool)

(assert (=> b!1045420 m!965139))

(assert (=> b!1045420 m!965121))

(declare-fun m!965141 () Bool)

(assert (=> b!1045420 m!965141))

(declare-fun m!965143 () Bool)

(assert (=> b!1045420 m!965143))

(assert (=> b!1045420 m!965115))

(assert (=> b!1045420 m!965137))

(assert (=> b!1045423 m!965119))

(assert (=> b!1045423 m!965119))

(declare-fun m!965145 () Bool)

(assert (=> b!1045423 m!965145))

(assert (=> d!126523 m!964965))

(assert (=> b!1045421 m!965119))

(declare-fun m!965147 () Bool)

(assert (=> b!1045421 m!965147))

(assert (=> b!1045421 m!965147))

(declare-fun m!965149 () Bool)

(assert (=> b!1045421 m!965149))

(declare-fun m!965151 () Bool)

(assert (=> b!1045421 m!965151))

(assert (=> b!1045421 m!965119))

(declare-fun m!965153 () Bool)

(assert (=> b!1045421 m!965153))

(assert (=> b!1045421 m!965149))

(declare-fun m!965155 () Bool)

(assert (=> bm!44501 m!965155))

(declare-fun m!965157 () Bool)

(assert (=> b!1045411 m!965157))

(declare-fun m!965159 () Bool)

(assert (=> bm!44506 m!965159))

(assert (=> b!1045415 m!965119))

(assert (=> b!1045415 m!965119))

(declare-fun m!965161 () Bool)

(assert (=> b!1045415 m!965161))

(declare-fun m!965163 () Bool)

(assert (=> b!1045407 m!965163))

(assert (=> b!1045408 m!965119))

(assert (=> b!1045408 m!965119))

(assert (=> b!1045408 m!965161))

(declare-fun m!965165 () Bool)

(assert (=> bm!44500 m!965165))

(declare-fun m!965167 () Bool)

(assert (=> b!1045413 m!965167))

(assert (=> bm!44505 m!965143))

(assert (=> b!1045259 d!126523))

(declare-fun b!1045433 () Bool)

(declare-fun e!592596 () Bool)

(declare-fun e!592597 () Bool)

(assert (=> b!1045433 (= e!592596 e!592597)))

(declare-fun c!106283 () Bool)

(assert (=> b!1045433 (= c!106283 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun b!1045434 () Bool)

(declare-fun e!592598 () Bool)

(assert (=> b!1045434 (= e!592597 e!592598)))

(declare-fun lt!461522 () (_ BitVec 64))

(assert (=> b!1045434 (= lt!461522 (select (arr!31689 lt!461378) #b00000000000000000000000000000000))))

(declare-fun lt!461521 () Unit!34139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65884 (_ BitVec 64) (_ BitVec 32)) Unit!34139)

(assert (=> b!1045434 (= lt!461521 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461378 lt!461522 #b00000000000000000000000000000000))))

(assert (=> b!1045434 (arrayContainsKey!0 lt!461378 lt!461522 #b00000000000000000000000000000000)))

(declare-fun lt!461523 () Unit!34139)

(assert (=> b!1045434 (= lt!461523 lt!461521)))

(declare-fun res!696108 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65884 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045434 (= res!696108 (= (seekEntryOrOpen!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000) lt!461378 (mask!30540 thiss!1427)) (Found!9846 #b00000000000000000000000000000000)))))

(assert (=> b!1045434 (=> (not res!696108) (not e!592598))))

(declare-fun b!1045436 () Bool)

(declare-fun call!44512 () Bool)

(assert (=> b!1045436 (= e!592598 call!44512)))

(declare-fun bm!44509 () Bool)

(assert (=> bm!44509 (= call!44512 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461378 (mask!30540 thiss!1427)))))

(declare-fun d!126525 () Bool)

(declare-fun res!696107 () Bool)

(assert (=> d!126525 (=> res!696107 e!592596)))

(assert (=> d!126525 (= res!696107 (bvsge #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(assert (=> d!126525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461378 (mask!30540 thiss!1427)) e!592596)))

(declare-fun b!1045435 () Bool)

(assert (=> b!1045435 (= e!592597 call!44512)))

(assert (= (and d!126525 (not res!696107)) b!1045433))

(assert (= (and b!1045433 c!106283) b!1045434))

(assert (= (and b!1045433 (not c!106283)) b!1045435))

(assert (= (and b!1045434 res!696108) b!1045436))

(assert (= (or b!1045436 b!1045435) bm!44509))

(assert (=> b!1045433 m!965023))

(assert (=> b!1045433 m!965023))

(assert (=> b!1045433 m!965025))

(assert (=> b!1045434 m!965023))

(declare-fun m!965169 () Bool)

(assert (=> b!1045434 m!965169))

(declare-fun m!965171 () Bool)

(assert (=> b!1045434 m!965171))

(assert (=> b!1045434 m!965023))

(declare-fun m!965173 () Bool)

(assert (=> b!1045434 m!965173))

(declare-fun m!965175 () Bool)

(assert (=> bm!44509 m!965175))

(assert (=> b!1045259 d!126525))

(declare-fun d!126527 () Bool)

(declare-fun e!592603 () Bool)

(assert (=> d!126527 e!592603))

(declare-fun res!696111 () Bool)

(assert (=> d!126527 (=> res!696111 e!592603)))

(declare-fun lt!461533 () Bool)

(assert (=> d!126527 (= res!696111 (not lt!461533))))

(declare-fun lt!461532 () Bool)

(assert (=> d!126527 (= lt!461533 lt!461532)))

(declare-fun lt!461535 () Unit!34139)

(declare-fun e!592604 () Unit!34139)

(assert (=> d!126527 (= lt!461535 e!592604)))

(declare-fun c!106286 () Bool)

(assert (=> d!126527 (= c!106286 lt!461532)))

(declare-fun containsKey!569 (List!22016 (_ BitVec 64)) Bool)

(assert (=> d!126527 (= lt!461532 (containsKey!569 (toList!6911 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377)))) key!909))))

(assert (=> d!126527 (= (contains!6079 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377))) key!909) lt!461533)))

(declare-fun b!1045443 () Bool)

(declare-fun lt!461534 () Unit!34139)

(assert (=> b!1045443 (= e!592604 lt!461534)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!402 (List!22016 (_ BitVec 64)) Unit!34139)

(assert (=> b!1045443 (= lt!461534 (lemmaContainsKeyImpliesGetValueByKeyDefined!402 (toList!6911 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377)))) key!909))))

(declare-datatypes ((Option!645 0))(
  ( (Some!644 (v!15075 V!38013)) (None!643) )
))
(declare-fun isDefined!441 (Option!645) Bool)

(declare-fun getValueByKey!594 (List!22016 (_ BitVec 64)) Option!645)

(assert (=> b!1045443 (isDefined!441 (getValueByKey!594 (toList!6911 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377)))) key!909))))

(declare-fun b!1045444 () Bool)

(declare-fun Unit!34149 () Unit!34139)

(assert (=> b!1045444 (= e!592604 Unit!34149)))

(declare-fun b!1045445 () Bool)

(assert (=> b!1045445 (= e!592603 (isDefined!441 (getValueByKey!594 (toList!6911 (getCurrentListMap!3959 (_keys!11685 (_2!7903 lt!461377)) (_values!6438 (_2!7903 lt!461377)) (mask!30540 (_2!7903 lt!461377)) (extraKeys!6143 (_2!7903 lt!461377)) (zeroValue!6249 (_2!7903 lt!461377)) (minValue!6249 (_2!7903 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6415 (_2!7903 lt!461377)))) key!909)))))

(assert (= (and d!126527 c!106286) b!1045443))

(assert (= (and d!126527 (not c!106286)) b!1045444))

(assert (= (and d!126527 (not res!696111)) b!1045445))

(declare-fun m!965177 () Bool)

(assert (=> d!126527 m!965177))

(declare-fun m!965179 () Bool)

(assert (=> b!1045443 m!965179))

(declare-fun m!965181 () Bool)

(assert (=> b!1045443 m!965181))

(assert (=> b!1045443 m!965181))

(declare-fun m!965183 () Bool)

(assert (=> b!1045443 m!965183))

(assert (=> b!1045445 m!965181))

(assert (=> b!1045445 m!965181))

(assert (=> b!1045445 m!965183))

(assert (=> b!1045259 d!126527))

(declare-fun d!126529 () Bool)

(declare-fun e!592607 () Bool)

(assert (=> d!126529 e!592607))

(declare-fun res!696114 () Bool)

(assert (=> d!126529 (=> (not res!696114) (not e!592607))))

(assert (=> d!126529 (= res!696114 (and (bvsge (index!41756 lt!461374) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461374) (size!32224 (_keys!11685 thiss!1427)))))))

(declare-fun lt!461538 () Unit!34139)

(declare-fun choose!53 (array!65884 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22017) Unit!34139)

(assert (=> d!126529 (= lt!461538 (choose!53 (_keys!11685 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461374) #b00000000000000000000000000000000 Nil!22014))))

(assert (=> d!126529 (bvslt (size!32224 (_keys!11685 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126529 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11685 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41756 lt!461374) #b00000000000000000000000000000000 Nil!22014) lt!461538)))

(declare-fun b!1045448 () Bool)

(assert (=> b!1045448 (= e!592607 (arrayNoDuplicates!0 (array!65885 (store (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461374) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32224 (_keys!11685 thiss!1427))) #b00000000000000000000000000000000 Nil!22014))))

(assert (= (and d!126529 res!696114) b!1045448))

(declare-fun m!965185 () Bool)

(assert (=> d!126529 m!965185))

(assert (=> b!1045448 m!964949))

(declare-fun m!965187 () Bool)

(assert (=> b!1045448 m!965187))

(assert (=> b!1045259 d!126529))

(declare-fun b!1045449 () Bool)

(declare-fun c!106289 () Bool)

(assert (=> b!1045449 (= c!106289 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592610 () ListLongMap!13791)

(declare-fun e!592618 () ListLongMap!13791)

(assert (=> b!1045449 (= e!592610 e!592618)))

(declare-fun bm!44510 () Bool)

(declare-fun call!44515 () Bool)

(declare-fun lt!461559 () ListLongMap!13791)

(assert (=> bm!44510 (= call!44515 (contains!6079 lt!461559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045450 () Bool)

(declare-fun e!592611 () ListLongMap!13791)

(assert (=> b!1045450 (= e!592611 e!592610)))

(declare-fun c!106291 () Bool)

(assert (=> b!1045450 (= c!106291 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045451 () Bool)

(declare-fun call!44517 () ListLongMap!13791)

(assert (=> b!1045451 (= e!592618 call!44517)))

(declare-fun bm!44511 () Bool)

(declare-fun c!106288 () Bool)

(declare-fun call!44514 () ListLongMap!13791)

(declare-fun call!44519 () ListLongMap!13791)

(declare-fun call!44513 () ListLongMap!13791)

(declare-fun call!44516 () ListLongMap!13791)

(assert (=> bm!44511 (= call!44514 (+!3112 (ite c!106288 call!44516 (ite c!106291 call!44513 call!44519)) (ite (or c!106288 c!106291) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6249 thiss!1427)) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 thiss!1427)))))))

(declare-fun b!1045452 () Bool)

(assert (=> b!1045452 (= e!592611 (+!3112 call!44514 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6249 thiss!1427))))))

(declare-fun b!1045453 () Bool)

(declare-fun e!592620 () Bool)

(assert (=> b!1045453 (= e!592620 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun b!1045454 () Bool)

(declare-fun res!696120 () Bool)

(declare-fun e!592616 () Bool)

(assert (=> b!1045454 (=> (not res!696120) (not e!592616))))

(declare-fun e!592612 () Bool)

(assert (=> b!1045454 (= res!696120 e!592612)))

(declare-fun c!106290 () Bool)

(assert (=> b!1045454 (= c!106290 (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045455 () Bool)

(declare-fun e!592613 () Unit!34139)

(declare-fun Unit!34150 () Unit!34139)

(assert (=> b!1045455 (= e!592613 Unit!34150)))

(declare-fun d!126531 () Bool)

(assert (=> d!126531 e!592616))

(declare-fun res!696118 () Bool)

(assert (=> d!126531 (=> (not res!696118) (not e!592616))))

(assert (=> d!126531 (= res!696118 (or (bvsge #b00000000000000000000000000000000 (size!32224 lt!461378)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 lt!461378)))))))

(declare-fun lt!461549 () ListLongMap!13791)

(assert (=> d!126531 (= lt!461559 lt!461549)))

(declare-fun lt!461550 () Unit!34139)

(assert (=> d!126531 (= lt!461550 e!592613)))

(declare-fun c!106292 () Bool)

(declare-fun e!592617 () Bool)

(assert (=> d!126531 (= c!106292 e!592617)))

(declare-fun res!696117 () Bool)

(assert (=> d!126531 (=> (not res!696117) (not e!592617))))

(assert (=> d!126531 (= res!696117 (bvslt #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(assert (=> d!126531 (= lt!461549 e!592611)))

(assert (=> d!126531 (= c!106288 (and (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126531 (validMask!0 (mask!30540 thiss!1427))))

(assert (=> d!126531 (= (getCurrentListMap!3959 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)) lt!461559)))

(declare-fun bm!44512 () Bool)

(assert (=> bm!44512 (= call!44517 call!44514)))

(declare-fun b!1045456 () Bool)

(declare-fun e!592615 () Bool)

(assert (=> b!1045456 (= e!592615 (= (apply!914 lt!461559 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6249 thiss!1427)))))

(declare-fun b!1045457 () Bool)

(declare-fun e!592608 () Bool)

(assert (=> b!1045457 (= e!592608 (not call!44515))))

(declare-fun b!1045458 () Bool)

(declare-fun e!592614 () Bool)

(assert (=> b!1045458 (= e!592614 (= (apply!914 lt!461559 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6249 thiss!1427)))))

(declare-fun bm!44513 () Bool)

(assert (=> bm!44513 (= call!44519 call!44513)))

(declare-fun b!1045459 () Bool)

(assert (=> b!1045459 (= e!592610 call!44517)))

(declare-fun b!1045460 () Bool)

(assert (=> b!1045460 (= e!592617 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun b!1045461 () Bool)

(declare-fun res!696115 () Bool)

(assert (=> b!1045461 (=> (not res!696115) (not e!592616))))

(declare-fun e!592609 () Bool)

(assert (=> b!1045461 (= res!696115 e!592609)))

(declare-fun res!696122 () Bool)

(assert (=> b!1045461 (=> res!696122 e!592609)))

(assert (=> b!1045461 (= res!696122 (not e!592620))))

(declare-fun res!696119 () Bool)

(assert (=> b!1045461 (=> (not res!696119) (not e!592620))))

(assert (=> b!1045461 (= res!696119 (bvslt #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(declare-fun b!1045462 () Bool)

(assert (=> b!1045462 (= e!592608 e!592614)))

(declare-fun res!696123 () Bool)

(assert (=> b!1045462 (= res!696123 call!44515)))

(assert (=> b!1045462 (=> (not res!696123) (not e!592614))))

(declare-fun bm!44514 () Bool)

(assert (=> bm!44514 (= call!44513 call!44516)))

(declare-fun b!1045463 () Bool)

(declare-fun call!44518 () Bool)

(assert (=> b!1045463 (= e!592612 (not call!44518))))

(declare-fun b!1045464 () Bool)

(assert (=> b!1045464 (= e!592616 e!592608)))

(declare-fun c!106287 () Bool)

(assert (=> b!1045464 (= c!106287 (not (= (bvand (extraKeys!6143 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44515 () Bool)

(assert (=> bm!44515 (= call!44516 (getCurrentListMapNoExtraKeys!3528 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun b!1045465 () Bool)

(declare-fun lt!461555 () Unit!34139)

(assert (=> b!1045465 (= e!592613 lt!461555)))

(declare-fun lt!461551 () ListLongMap!13791)

(assert (=> b!1045465 (= lt!461551 (getCurrentListMapNoExtraKeys!3528 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461547 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461552 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461552 (select (arr!31689 lt!461378) #b00000000000000000000000000000000))))

(declare-fun lt!461558 () Unit!34139)

(assert (=> b!1045465 (= lt!461558 (addStillContains!633 lt!461551 lt!461547 (zeroValue!6249 thiss!1427) lt!461552))))

(assert (=> b!1045465 (contains!6079 (+!3112 lt!461551 (tuple2!15787 lt!461547 (zeroValue!6249 thiss!1427))) lt!461552)))

(declare-fun lt!461540 () Unit!34139)

(assert (=> b!1045465 (= lt!461540 lt!461558)))

(declare-fun lt!461542 () ListLongMap!13791)

(assert (=> b!1045465 (= lt!461542 (getCurrentListMapNoExtraKeys!3528 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461541 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461541 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461545 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461545 (select (arr!31689 lt!461378) #b00000000000000000000000000000000))))

(declare-fun lt!461544 () Unit!34139)

(assert (=> b!1045465 (= lt!461544 (addApplyDifferent!493 lt!461542 lt!461541 (minValue!6249 thiss!1427) lt!461545))))

(assert (=> b!1045465 (= (apply!914 (+!3112 lt!461542 (tuple2!15787 lt!461541 (minValue!6249 thiss!1427))) lt!461545) (apply!914 lt!461542 lt!461545))))

(declare-fun lt!461553 () Unit!34139)

(assert (=> b!1045465 (= lt!461553 lt!461544)))

(declare-fun lt!461557 () ListLongMap!13791)

(assert (=> b!1045465 (= lt!461557 (getCurrentListMapNoExtraKeys!3528 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461546 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461560 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461560 (select (arr!31689 lt!461378) #b00000000000000000000000000000000))))

(declare-fun lt!461554 () Unit!34139)

(assert (=> b!1045465 (= lt!461554 (addApplyDifferent!493 lt!461557 lt!461546 (zeroValue!6249 thiss!1427) lt!461560))))

(assert (=> b!1045465 (= (apply!914 (+!3112 lt!461557 (tuple2!15787 lt!461546 (zeroValue!6249 thiss!1427))) lt!461560) (apply!914 lt!461557 lt!461560))))

(declare-fun lt!461539 () Unit!34139)

(assert (=> b!1045465 (= lt!461539 lt!461554)))

(declare-fun lt!461548 () ListLongMap!13791)

(assert (=> b!1045465 (= lt!461548 (getCurrentListMapNoExtraKeys!3528 lt!461378 lt!461376 (mask!30540 thiss!1427) (extraKeys!6143 thiss!1427) (zeroValue!6249 thiss!1427) (minValue!6249 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6415 thiss!1427)))))

(declare-fun lt!461543 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461543 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461556 () (_ BitVec 64))

(assert (=> b!1045465 (= lt!461556 (select (arr!31689 lt!461378) #b00000000000000000000000000000000))))

(assert (=> b!1045465 (= lt!461555 (addApplyDifferent!493 lt!461548 lt!461543 (minValue!6249 thiss!1427) lt!461556))))

(assert (=> b!1045465 (= (apply!914 (+!3112 lt!461548 (tuple2!15787 lt!461543 (minValue!6249 thiss!1427))) lt!461556) (apply!914 lt!461548 lt!461556))))

(declare-fun bm!44516 () Bool)

(assert (=> bm!44516 (= call!44518 (contains!6079 lt!461559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045466 () Bool)

(declare-fun e!592619 () Bool)

(assert (=> b!1045466 (= e!592619 (= (apply!914 lt!461559 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)) (get!16559 (select (arr!31690 lt!461376) #b00000000000000000000000000000000) (dynLambda!2008 (defaultEntry!6415 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32225 lt!461376)))))

(assert (=> b!1045466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(declare-fun b!1045467 () Bool)

(assert (=> b!1045467 (= e!592618 call!44519)))

(declare-fun b!1045468 () Bool)

(assert (=> b!1045468 (= e!592609 e!592619)))

(declare-fun res!696121 () Bool)

(assert (=> b!1045468 (=> (not res!696121) (not e!592619))))

(assert (=> b!1045468 (= res!696121 (contains!6079 lt!461559 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(assert (=> b!1045468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(declare-fun b!1045469 () Bool)

(assert (=> b!1045469 (= e!592612 e!592615)))

(declare-fun res!696116 () Bool)

(assert (=> b!1045469 (= res!696116 call!44518)))

(assert (=> b!1045469 (=> (not res!696116) (not e!592615))))

(assert (= (and d!126531 c!106288) b!1045452))

(assert (= (and d!126531 (not c!106288)) b!1045450))

(assert (= (and b!1045450 c!106291) b!1045459))

(assert (= (and b!1045450 (not c!106291)) b!1045449))

(assert (= (and b!1045449 c!106289) b!1045451))

(assert (= (and b!1045449 (not c!106289)) b!1045467))

(assert (= (or b!1045451 b!1045467) bm!44513))

(assert (= (or b!1045459 bm!44513) bm!44514))

(assert (= (or b!1045459 b!1045451) bm!44512))

(assert (= (or b!1045452 bm!44514) bm!44515))

(assert (= (or b!1045452 bm!44512) bm!44511))

(assert (= (and d!126531 res!696117) b!1045460))

(assert (= (and d!126531 c!106292) b!1045465))

(assert (= (and d!126531 (not c!106292)) b!1045455))

(assert (= (and d!126531 res!696118) b!1045461))

(assert (= (and b!1045461 res!696119) b!1045453))

(assert (= (and b!1045461 (not res!696122)) b!1045468))

(assert (= (and b!1045468 res!696121) b!1045466))

(assert (= (and b!1045461 res!696115) b!1045454))

(assert (= (and b!1045454 c!106290) b!1045469))

(assert (= (and b!1045454 (not c!106290)) b!1045463))

(assert (= (and b!1045469 res!696116) b!1045456))

(assert (= (or b!1045469 b!1045463) bm!44516))

(assert (= (and b!1045454 res!696120) b!1045464))

(assert (= (and b!1045464 c!106287) b!1045462))

(assert (= (and b!1045464 (not c!106287)) b!1045457))

(assert (= (and b!1045462 res!696123) b!1045458))

(assert (= (or b!1045462 b!1045457) bm!44510))

(declare-fun b_lambda!16299 () Bool)

(assert (=> (not b_lambda!16299) (not b!1045466)))

(assert (=> b!1045466 t!31277))

(declare-fun b_and!33763 () Bool)

(assert (= b_and!33761 (and (=> t!31277 result!14591) b_and!33763)))

(declare-fun m!965189 () Bool)

(assert (=> b!1045465 m!965189))

(declare-fun m!965191 () Bool)

(assert (=> b!1045465 m!965191))

(declare-fun m!965193 () Bool)

(assert (=> b!1045465 m!965193))

(declare-fun m!965195 () Bool)

(assert (=> b!1045465 m!965195))

(assert (=> b!1045465 m!965023))

(declare-fun m!965197 () Bool)

(assert (=> b!1045465 m!965197))

(declare-fun m!965199 () Bool)

(assert (=> b!1045465 m!965199))

(declare-fun m!965201 () Bool)

(assert (=> b!1045465 m!965201))

(declare-fun m!965203 () Bool)

(assert (=> b!1045465 m!965203))

(assert (=> b!1045465 m!965203))

(declare-fun m!965205 () Bool)

(assert (=> b!1045465 m!965205))

(declare-fun m!965207 () Bool)

(assert (=> b!1045465 m!965207))

(declare-fun m!965209 () Bool)

(assert (=> b!1045465 m!965209))

(declare-fun m!965211 () Bool)

(assert (=> b!1045465 m!965211))

(declare-fun m!965213 () Bool)

(assert (=> b!1045465 m!965213))

(declare-fun m!965215 () Bool)

(assert (=> b!1045465 m!965215))

(assert (=> b!1045465 m!965197))

(declare-fun m!965217 () Bool)

(assert (=> b!1045465 m!965217))

(declare-fun m!965219 () Bool)

(assert (=> b!1045465 m!965219))

(assert (=> b!1045465 m!965193))

(assert (=> b!1045465 m!965213))

(assert (=> b!1045468 m!965023))

(assert (=> b!1045468 m!965023))

(declare-fun m!965221 () Bool)

(assert (=> b!1045468 m!965221))

(assert (=> d!126531 m!965029))

(assert (=> b!1045466 m!965023))

(declare-fun m!965223 () Bool)

(assert (=> b!1045466 m!965223))

(assert (=> b!1045466 m!965223))

(assert (=> b!1045466 m!964947))

(declare-fun m!965225 () Bool)

(assert (=> b!1045466 m!965225))

(assert (=> b!1045466 m!965023))

(declare-fun m!965227 () Bool)

(assert (=> b!1045466 m!965227))

(assert (=> b!1045466 m!964947))

(declare-fun m!965229 () Bool)

(assert (=> bm!44511 m!965229))

(declare-fun m!965231 () Bool)

(assert (=> b!1045456 m!965231))

(declare-fun m!965233 () Bool)

(assert (=> bm!44516 m!965233))

(assert (=> b!1045460 m!965023))

(assert (=> b!1045460 m!965023))

(assert (=> b!1045460 m!965025))

(declare-fun m!965235 () Bool)

(assert (=> b!1045452 m!965235))

(assert (=> b!1045453 m!965023))

(assert (=> b!1045453 m!965023))

(assert (=> b!1045453 m!965025))

(declare-fun m!965237 () Bool)

(assert (=> bm!44510 m!965237))

(declare-fun m!965239 () Bool)

(assert (=> b!1045458 m!965239))

(assert (=> bm!44515 m!965219))

(assert (=> b!1045259 d!126531))

(declare-fun b!1045470 () Bool)

(declare-fun e!592622 () (_ BitVec 32))

(assert (=> b!1045470 (= e!592622 #b00000000000000000000000000000000)))

(declare-fun bm!44517 () Bool)

(declare-fun call!44520 () (_ BitVec 32))

(assert (=> bm!44517 (= call!44520 (arrayCountValidKeys!0 (_keys!11685 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32224 (_keys!11685 thiss!1427))))))

(declare-fun b!1045471 () Bool)

(declare-fun e!592621 () (_ BitVec 32))

(assert (=> b!1045471 (= e!592621 (bvadd #b00000000000000000000000000000001 call!44520))))

(declare-fun b!1045472 () Bool)

(assert (=> b!1045472 (= e!592621 call!44520)))

(declare-fun d!126533 () Bool)

(declare-fun lt!461561 () (_ BitVec 32))

(assert (=> d!126533 (and (bvsge lt!461561 #b00000000000000000000000000000000) (bvsle lt!461561 (bvsub (size!32224 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126533 (= lt!461561 e!592622)))

(declare-fun c!106293 () Bool)

(assert (=> d!126533 (= c!106293 (bvsge #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))))))

(assert (=> d!126533 (and (bvsle #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32224 (_keys!11685 thiss!1427)) (size!32224 (_keys!11685 thiss!1427))))))

(assert (=> d!126533 (= (arrayCountValidKeys!0 (_keys!11685 thiss!1427) #b00000000000000000000000000000000 (size!32224 (_keys!11685 thiss!1427))) lt!461561)))

(declare-fun b!1045473 () Bool)

(assert (=> b!1045473 (= e!592622 e!592621)))

(declare-fun c!106294 () Bool)

(assert (=> b!1045473 (= c!106294 (validKeyInArray!0 (select (arr!31689 (_keys!11685 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126533 c!106293) b!1045470))

(assert (= (and d!126533 (not c!106293)) b!1045473))

(assert (= (and b!1045473 c!106294) b!1045471))

(assert (= (and b!1045473 (not c!106294)) b!1045472))

(assert (= (or b!1045471 b!1045472) bm!44517))

(declare-fun m!965241 () Bool)

(assert (=> bm!44517 m!965241))

(assert (=> b!1045473 m!965059))

(assert (=> b!1045473 m!965059))

(assert (=> b!1045473 m!965099))

(assert (=> b!1045259 d!126533))

(declare-fun bm!44520 () Bool)

(declare-fun call!44523 () Bool)

(declare-fun c!106297 () Bool)

(assert (=> bm!44520 (= call!44523 (arrayNoDuplicates!0 lt!461378 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106297 (Cons!22013 (select (arr!31689 lt!461378) #b00000000000000000000000000000000) Nil!22014) Nil!22014)))))

(declare-fun b!1045484 () Bool)

(declare-fun e!592633 () Bool)

(declare-fun e!592632 () Bool)

(assert (=> b!1045484 (= e!592633 e!592632)))

(declare-fun res!696132 () Bool)

(assert (=> b!1045484 (=> (not res!696132) (not e!592632))))

(declare-fun e!592634 () Bool)

(assert (=> b!1045484 (= res!696132 (not e!592634))))

(declare-fun res!696130 () Bool)

(assert (=> b!1045484 (=> (not res!696130) (not e!592634))))

(assert (=> b!1045484 (= res!696130 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun d!126535 () Bool)

(declare-fun res!696131 () Bool)

(assert (=> d!126535 (=> res!696131 e!592633)))

(assert (=> d!126535 (= res!696131 (bvsge #b00000000000000000000000000000000 (size!32224 lt!461378)))))

(assert (=> d!126535 (= (arrayNoDuplicates!0 lt!461378 #b00000000000000000000000000000000 Nil!22014) e!592633)))

(declare-fun b!1045485 () Bool)

(declare-fun e!592631 () Bool)

(assert (=> b!1045485 (= e!592631 call!44523)))

(declare-fun b!1045486 () Bool)

(declare-fun contains!6081 (List!22017 (_ BitVec 64)) Bool)

(assert (=> b!1045486 (= e!592634 (contains!6081 Nil!22014 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun b!1045487 () Bool)

(assert (=> b!1045487 (= e!592632 e!592631)))

(assert (=> b!1045487 (= c!106297 (validKeyInArray!0 (select (arr!31689 lt!461378) #b00000000000000000000000000000000)))))

(declare-fun b!1045488 () Bool)

(assert (=> b!1045488 (= e!592631 call!44523)))

(assert (= (and d!126535 (not res!696131)) b!1045484))

(assert (= (and b!1045484 res!696130) b!1045486))

(assert (= (and b!1045484 res!696132) b!1045487))

(assert (= (and b!1045487 c!106297) b!1045485))

(assert (= (and b!1045487 (not c!106297)) b!1045488))

(assert (= (or b!1045485 b!1045488) bm!44520))

(assert (=> bm!44520 m!965023))

(declare-fun m!965243 () Bool)

(assert (=> bm!44520 m!965243))

(assert (=> b!1045484 m!965023))

(assert (=> b!1045484 m!965023))

(assert (=> b!1045484 m!965025))

(assert (=> b!1045486 m!965023))

(assert (=> b!1045486 m!965023))

(declare-fun m!965245 () Bool)

(assert (=> b!1045486 m!965245))

(assert (=> b!1045487 m!965023))

(assert (=> b!1045487 m!965023))

(assert (=> b!1045487 m!965025))

(assert (=> b!1045259 d!126535))

(declare-fun d!126537 () Bool)

(declare-fun res!696137 () Bool)

(declare-fun e!592639 () Bool)

(assert (=> d!126537 (=> res!696137 e!592639)))

(assert (=> d!126537 (= res!696137 (= (select (arr!31689 lt!461378) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126537 (= (arrayContainsKey!0 lt!461378 key!909 #b00000000000000000000000000000000) e!592639)))

(declare-fun b!1045493 () Bool)

(declare-fun e!592640 () Bool)

(assert (=> b!1045493 (= e!592639 e!592640)))

(declare-fun res!696138 () Bool)

(assert (=> b!1045493 (=> (not res!696138) (not e!592640))))

(assert (=> b!1045493 (= res!696138 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32224 lt!461378)))))

(declare-fun b!1045494 () Bool)

(assert (=> b!1045494 (= e!592640 (arrayContainsKey!0 lt!461378 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126537 (not res!696137)) b!1045493))

(assert (= (and b!1045493 res!696138) b!1045494))

(assert (=> d!126537 m!965023))

(declare-fun m!965247 () Bool)

(assert (=> b!1045494 m!965247))

(assert (=> b!1045259 d!126537))

(declare-fun b!1045507 () Bool)

(declare-fun e!592647 () SeekEntryResult!9846)

(declare-fun lt!461571 () SeekEntryResult!9846)

(assert (=> b!1045507 (= e!592647 (MissingZero!9846 (index!41757 lt!461571)))))

(declare-fun b!1045508 () Bool)

(declare-fun e!592649 () SeekEntryResult!9846)

(declare-fun e!592648 () SeekEntryResult!9846)

(assert (=> b!1045508 (= e!592649 e!592648)))

(declare-fun lt!461573 () (_ BitVec 64))

(assert (=> b!1045508 (= lt!461573 (select (arr!31689 (_keys!11685 thiss!1427)) (index!41757 lt!461571)))))

(declare-fun c!106305 () Bool)

(assert (=> b!1045508 (= c!106305 (= lt!461573 key!909))))

(declare-fun b!1045509 () Bool)

(assert (=> b!1045509 (= e!592649 Undefined!9846)))

(declare-fun b!1045510 () Bool)

(assert (=> b!1045510 (= e!592648 (Found!9846 (index!41757 lt!461571)))))

(declare-fun d!126539 () Bool)

(declare-fun lt!461572 () SeekEntryResult!9846)

(assert (=> d!126539 (and (or ((_ is MissingVacant!9846) lt!461572) (not ((_ is Found!9846) lt!461572)) (and (bvsge (index!41756 lt!461572) #b00000000000000000000000000000000) (bvslt (index!41756 lt!461572) (size!32224 (_keys!11685 thiss!1427))))) (not ((_ is MissingVacant!9846) lt!461572)) (or (not ((_ is Found!9846) lt!461572)) (= (select (arr!31689 (_keys!11685 thiss!1427)) (index!41756 lt!461572)) key!909)))))

(assert (=> d!126539 (= lt!461572 e!592649)))

(declare-fun c!106306 () Bool)

(assert (=> d!126539 (= c!106306 (and ((_ is Intermediate!9846) lt!461571) (undefined!10658 lt!461571)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65884 (_ BitVec 32)) SeekEntryResult!9846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126539 (= lt!461571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30540 thiss!1427)) key!909 (_keys!11685 thiss!1427) (mask!30540 thiss!1427)))))

(assert (=> d!126539 (validMask!0 (mask!30540 thiss!1427))))

(assert (=> d!126539 (= (seekEntry!0 key!909 (_keys!11685 thiss!1427) (mask!30540 thiss!1427)) lt!461572)))

(declare-fun b!1045511 () Bool)

(declare-fun c!106304 () Bool)

(assert (=> b!1045511 (= c!106304 (= lt!461573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1045511 (= e!592648 e!592647)))

(declare-fun b!1045512 () Bool)

(declare-fun lt!461570 () SeekEntryResult!9846)

(assert (=> b!1045512 (= e!592647 (ite ((_ is MissingVacant!9846) lt!461570) (MissingZero!9846 (index!41758 lt!461570)) lt!461570))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65884 (_ BitVec 32)) SeekEntryResult!9846)

(assert (=> b!1045512 (= lt!461570 (seekKeyOrZeroReturnVacant!0 (x!93358 lt!461571) (index!41757 lt!461571) (index!41757 lt!461571) key!909 (_keys!11685 thiss!1427) (mask!30540 thiss!1427)))))

(assert (= (and d!126539 c!106306) b!1045509))

(assert (= (and d!126539 (not c!106306)) b!1045508))

(assert (= (and b!1045508 c!106305) b!1045510))

(assert (= (and b!1045508 (not c!106305)) b!1045511))

(assert (= (and b!1045511 c!106304) b!1045507))

(assert (= (and b!1045511 (not c!106304)) b!1045512))

(declare-fun m!965249 () Bool)

(assert (=> b!1045508 m!965249))

(declare-fun m!965251 () Bool)

(assert (=> d!126539 m!965251))

(declare-fun m!965253 () Bool)

(assert (=> d!126539 m!965253))

(assert (=> d!126539 m!965253))

(declare-fun m!965255 () Bool)

(assert (=> d!126539 m!965255))

(assert (=> d!126539 m!965029))

(declare-fun m!965257 () Bool)

(assert (=> b!1045512 m!965257))

(assert (=> b!1045263 d!126539))

(declare-fun mapIsEmpty!38927 () Bool)

(declare-fun mapRes!38927 () Bool)

(assert (=> mapIsEmpty!38927 mapRes!38927))

(declare-fun condMapEmpty!38927 () Bool)

(declare-fun mapDefault!38927 () ValueCell!11724)

(assert (=> mapNonEmpty!38921 (= condMapEmpty!38927 (= mapRest!38921 ((as const (Array (_ BitVec 32) ValueCell!11724)) mapDefault!38927)))))

(declare-fun e!592655 () Bool)

(assert (=> mapNonEmpty!38921 (= tp!74660 (and e!592655 mapRes!38927))))

(declare-fun b!1045520 () Bool)

(assert (=> b!1045520 (= e!592655 tp_is_empty!24855)))

(declare-fun mapNonEmpty!38927 () Bool)

(declare-fun tp!74670 () Bool)

(declare-fun e!592654 () Bool)

(assert (=> mapNonEmpty!38927 (= mapRes!38927 (and tp!74670 e!592654))))

(declare-fun mapRest!38927 () (Array (_ BitVec 32) ValueCell!11724))

(declare-fun mapKey!38927 () (_ BitVec 32))

(declare-fun mapValue!38927 () ValueCell!11724)

(assert (=> mapNonEmpty!38927 (= mapRest!38921 (store mapRest!38927 mapKey!38927 mapValue!38927))))

(declare-fun b!1045519 () Bool)

(assert (=> b!1045519 (= e!592654 tp_is_empty!24855)))

(assert (= (and mapNonEmpty!38921 condMapEmpty!38927) mapIsEmpty!38927))

(assert (= (and mapNonEmpty!38921 (not condMapEmpty!38927)) mapNonEmpty!38927))

(assert (= (and mapNonEmpty!38927 ((_ is ValueCellFull!11724) mapValue!38927)) b!1045519))

(assert (= (and mapNonEmpty!38921 ((_ is ValueCellFull!11724) mapDefault!38927)) b!1045520))

(declare-fun m!965259 () Bool)

(assert (=> mapNonEmpty!38927 m!965259))

(declare-fun b_lambda!16301 () Bool)

(assert (= b_lambda!16299 (or (and b!1045265 b_free!21135) b_lambda!16301)))

(declare-fun b_lambda!16303 () Bool)

(assert (= b_lambda!16293 (or (and b!1045265 b_free!21135) b_lambda!16303)))

(declare-fun b_lambda!16305 () Bool)

(assert (= b_lambda!16295 (or (and b!1045265 b_free!21135) b_lambda!16305)))

(check-sat (not b!1045453) (not bm!44493) (not b!1045407) (not b_lambda!16291) (not d!126513) (not d!126517) (not bm!44501) (not b!1045468) (not bm!44510) (not b!1045473) (not b!1045338) (not b_lambda!16305) (not mapNonEmpty!38927) (not b!1045305) (not b!1045466) (not b!1045392) (not d!126531) (not b!1045306) (not b!1045486) tp_is_empty!24855 (not d!126511) (not b!1045413) (not bm!44499) (not b!1045421) (not b!1045325) (not d!126519) (not b_next!21135) (not b!1045458) (not bm!44494) (not b!1045415) (not b_lambda!16297) (not b_lambda!16303) (not b!1045394) (not b!1045465) (not bm!44511) (not b!1045445) (not b!1045322) (not bm!44506) (not bm!44520) (not b!1045337) (not b!1045434) (not b!1045487) (not b!1045340) (not d!126527) (not d!126539) (not b!1045423) (not b!1045484) (not b!1045319) (not b!1045460) (not b!1045456) (not b!1045443) (not bm!44498) (not bm!44516) (not d!126521) (not b!1045433) (not bm!44515) (not bm!44505) (not bm!44517) (not d!126507) (not b!1045408) (not b!1045390) (not d!126515) (not b!1045420) (not b!1045512) (not d!126529) (not b!1045402) (not b!1045328) (not b!1045452) (not b!1045307) (not b_lambda!16301) b_and!33763 (not bm!44509) (not bm!44500) (not b!1045494) (not d!126523) (not b!1045448) (not b!1045400) (not b!1045387) (not b!1045386) (not bm!44478) (not b!1045411) (not b!1045399))
(check-sat b_and!33763 (not b_next!21135))
