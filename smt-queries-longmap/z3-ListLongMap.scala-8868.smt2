; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107628 () Bool)

(assert start!107628)

(declare-fun b!1273840 () Bool)

(declare-fun b_free!27753 () Bool)

(declare-fun b_next!27753 () Bool)

(assert (=> b!1273840 (= b_free!27753 (not b_next!27753))))

(declare-fun tp!97818 () Bool)

(declare-fun b_and!45809 () Bool)

(assert (=> b!1273840 (= tp!97818 b_and!45809)))

(declare-fun e!726878 () Bool)

(declare-datatypes ((V!49357 0))(
  ( (V!49358 (val!16636 Int)) )
))
(declare-datatypes ((ValueCell!15708 0))(
  ( (ValueCellFull!15708 (v!19273 V!49357)) (EmptyCell!15708) )
))
(declare-datatypes ((array!83526 0))(
  ( (array!83527 (arr!40284 (Array (_ BitVec 32) ValueCell!15708)) (size!40830 (_ BitVec 32))) )
))
(declare-datatypes ((array!83528 0))(
  ( (array!83529 (arr!40285 (Array (_ BitVec 32) (_ BitVec 64))) (size!40831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6180 0))(
  ( (LongMapFixedSize!6181 (defaultEntry!6736 Int) (mask!34531 (_ BitVec 32)) (extraKeys!6415 (_ BitVec 32)) (zeroValue!6521 V!49357) (minValue!6521 V!49357) (_size!3145 (_ BitVec 32)) (_keys!12150 array!83528) (_values!6759 array!83526) (_vacant!3145 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6180)

(declare-fun e!726880 () Bool)

(declare-fun tp_is_empty!33123 () Bool)

(declare-fun array_inv!30625 (array!83528) Bool)

(declare-fun array_inv!30626 (array!83526) Bool)

(assert (=> b!1273840 (= e!726878 (and tp!97818 tp_is_empty!33123 (array_inv!30625 (_keys!12150 thiss!1551)) (array_inv!30626 (_values!6759 thiss!1551)) e!726880))))

(declare-fun mapNonEmpty!51319 () Bool)

(declare-fun mapRes!51319 () Bool)

(declare-fun tp!97819 () Bool)

(declare-fun e!726875 () Bool)

(assert (=> mapNonEmpty!51319 (= mapRes!51319 (and tp!97819 e!726875))))

(declare-fun mapValue!51319 () ValueCell!15708)

(declare-fun mapRest!51319 () (Array (_ BitVec 32) ValueCell!15708))

(declare-fun mapKey!51319 () (_ BitVec 32))

(assert (=> mapNonEmpty!51319 (= (arr!40284 (_values!6759 thiss!1551)) (store mapRest!51319 mapKey!51319 mapValue!51319))))

(declare-fun b!1273841 () Bool)

(declare-fun e!726876 () Bool)

(assert (=> b!1273841 (= e!726876 (bvsgt #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))))))

(declare-fun b!1273842 () Bool)

(assert (=> b!1273842 (= e!726875 tp_is_empty!33123)))

(declare-fun res!846996 () Bool)

(assert (=> start!107628 (=> (not res!846996) (not e!726876))))

(declare-fun simpleValid!477 (LongMapFixedSize!6180) Bool)

(assert (=> start!107628 (= res!846996 (simpleValid!477 thiss!1551))))

(assert (=> start!107628 e!726876))

(assert (=> start!107628 e!726878))

(declare-fun b!1273843 () Bool)

(declare-fun res!846995 () Bool)

(assert (=> b!1273843 (=> (not res!846995) (not e!726876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83528 (_ BitVec 32)) Bool)

(assert (=> b!1273843 (= res!846995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12150 thiss!1551) (mask!34531 thiss!1551)))))

(declare-fun b!1273844 () Bool)

(declare-fun e!726877 () Bool)

(assert (=> b!1273844 (= e!726880 (and e!726877 mapRes!51319))))

(declare-fun condMapEmpty!51319 () Bool)

(declare-fun mapDefault!51319 () ValueCell!15708)

(assert (=> b!1273844 (= condMapEmpty!51319 (= (arr!40284 (_values!6759 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15708)) mapDefault!51319)))))

(declare-fun b!1273845 () Bool)

(declare-fun res!846994 () Bool)

(assert (=> b!1273845 (=> (not res!846994) (not e!726876))))

(declare-fun arrayCountValidKeys!0 (array!83528 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273845 (= res!846994 (= (arrayCountValidKeys!0 (_keys!12150 thiss!1551) #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))) (_size!3145 thiss!1551)))))

(declare-fun mapIsEmpty!51319 () Bool)

(assert (=> mapIsEmpty!51319 mapRes!51319))

(declare-fun b!1273846 () Bool)

(assert (=> b!1273846 (= e!726877 tp_is_empty!33123)))

(assert (= (and start!107628 res!846996) b!1273845))

(assert (= (and b!1273845 res!846994) b!1273843))

(assert (= (and b!1273843 res!846995) b!1273841))

(assert (= (and b!1273844 condMapEmpty!51319) mapIsEmpty!51319))

(assert (= (and b!1273844 (not condMapEmpty!51319)) mapNonEmpty!51319))

(get-info :version)

(assert (= (and mapNonEmpty!51319 ((_ is ValueCellFull!15708) mapValue!51319)) b!1273842))

(assert (= (and b!1273844 ((_ is ValueCellFull!15708) mapDefault!51319)) b!1273846))

(assert (= b!1273840 b!1273844))

(assert (= start!107628 b!1273840))

(declare-fun m!1170835 () Bool)

(assert (=> b!1273840 m!1170835))

(declare-fun m!1170837 () Bool)

(assert (=> b!1273840 m!1170837))

(declare-fun m!1170839 () Bool)

(assert (=> b!1273843 m!1170839))

(declare-fun m!1170841 () Bool)

(assert (=> b!1273845 m!1170841))

(declare-fun m!1170843 () Bool)

(assert (=> start!107628 m!1170843))

(declare-fun m!1170845 () Bool)

(assert (=> mapNonEmpty!51319 m!1170845))

(check-sat b_and!45809 (not mapNonEmpty!51319) tp_is_empty!33123 (not b!1273845) (not b!1273840) (not start!107628) (not b!1273843) (not b_next!27753))
(check-sat b_and!45809 (not b_next!27753))
(get-model)

(declare-fun b!1273877 () Bool)

(declare-fun res!847017 () Bool)

(declare-fun e!726901 () Bool)

(assert (=> b!1273877 (=> (not res!847017) (not e!726901))))

(declare-fun size!40834 (LongMapFixedSize!6180) (_ BitVec 32))

(assert (=> b!1273877 (= res!847017 (bvsge (size!40834 thiss!1551) (_size!3145 thiss!1551)))))

(declare-fun b!1273876 () Bool)

(declare-fun res!847016 () Bool)

(assert (=> b!1273876 (=> (not res!847016) (not e!726901))))

(assert (=> b!1273876 (= res!847016 (and (= (size!40830 (_values!6759 thiss!1551)) (bvadd (mask!34531 thiss!1551) #b00000000000000000000000000000001)) (= (size!40831 (_keys!12150 thiss!1551)) (size!40830 (_values!6759 thiss!1551))) (bvsge (_size!3145 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3145 thiss!1551) (bvadd (mask!34531 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273878 () Bool)

(declare-fun res!847015 () Bool)

(assert (=> b!1273878 (=> (not res!847015) (not e!726901))))

(assert (=> b!1273878 (= res!847015 (= (size!40834 thiss!1551) (bvadd (_size!3145 thiss!1551) (bvsdiv (bvadd (extraKeys!6415 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!140043 () Bool)

(declare-fun res!847014 () Bool)

(assert (=> d!140043 (=> (not res!847014) (not e!726901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140043 (= res!847014 (validMask!0 (mask!34531 thiss!1551)))))

(assert (=> d!140043 (= (simpleValid!477 thiss!1551) e!726901)))

(declare-fun b!1273879 () Bool)

(assert (=> b!1273879 (= e!726901 (and (bvsge (extraKeys!6415 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6415 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3145 thiss!1551) #b00000000000000000000000000000000)))))

(assert (= (and d!140043 res!847014) b!1273876))

(assert (= (and b!1273876 res!847016) b!1273877))

(assert (= (and b!1273877 res!847017) b!1273878))

(assert (= (and b!1273878 res!847015) b!1273879))

(declare-fun m!1170859 () Bool)

(assert (=> b!1273877 m!1170859))

(assert (=> b!1273878 m!1170859))

(declare-fun m!1170861 () Bool)

(assert (=> d!140043 m!1170861))

(assert (=> start!107628 d!140043))

(declare-fun b!1273888 () Bool)

(declare-fun e!726908 () Bool)

(declare-fun e!726910 () Bool)

(assert (=> b!1273888 (= e!726908 e!726910)))

(declare-fun c!123780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273888 (= c!123780 (validKeyInArray!0 (select (arr!40285 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273889 () Bool)

(declare-fun e!726909 () Bool)

(declare-fun call!62609 () Bool)

(assert (=> b!1273889 (= e!726909 call!62609)))

(declare-fun d!140045 () Bool)

(declare-fun res!847022 () Bool)

(assert (=> d!140045 (=> res!847022 e!726908)))

(assert (=> d!140045 (= res!847022 (bvsge #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))))))

(assert (=> d!140045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12150 thiss!1551) (mask!34531 thiss!1551)) e!726908)))

(declare-fun b!1273890 () Bool)

(assert (=> b!1273890 (= e!726910 call!62609)))

(declare-fun b!1273891 () Bool)

(assert (=> b!1273891 (= e!726910 e!726909)))

(declare-fun lt!575156 () (_ BitVec 64))

(assert (=> b!1273891 (= lt!575156 (select (arr!40285 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42334 0))(
  ( (Unit!42335) )
))
(declare-fun lt!575157 () Unit!42334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83528 (_ BitVec 64) (_ BitVec 32)) Unit!42334)

(assert (=> b!1273891 (= lt!575157 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12150 thiss!1551) lt!575156 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273891 (arrayContainsKey!0 (_keys!12150 thiss!1551) lt!575156 #b00000000000000000000000000000000)))

(declare-fun lt!575158 () Unit!42334)

(assert (=> b!1273891 (= lt!575158 lt!575157)))

(declare-fun res!847023 () Bool)

(declare-datatypes ((SeekEntryResult!9997 0))(
  ( (MissingZero!9997 (index!42359 (_ BitVec 32))) (Found!9997 (index!42360 (_ BitVec 32))) (Intermediate!9997 (undefined!10809 Bool) (index!42361 (_ BitVec 32)) (x!112680 (_ BitVec 32))) (Undefined!9997) (MissingVacant!9997 (index!42362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83528 (_ BitVec 32)) SeekEntryResult!9997)

(assert (=> b!1273891 (= res!847023 (= (seekEntryOrOpen!0 (select (arr!40285 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000) (_keys!12150 thiss!1551) (mask!34531 thiss!1551)) (Found!9997 #b00000000000000000000000000000000)))))

(assert (=> b!1273891 (=> (not res!847023) (not e!726909))))

(declare-fun bm!62606 () Bool)

(assert (=> bm!62606 (= call!62609 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12150 thiss!1551) (mask!34531 thiss!1551)))))

(assert (= (and d!140045 (not res!847022)) b!1273888))

(assert (= (and b!1273888 c!123780) b!1273891))

(assert (= (and b!1273888 (not c!123780)) b!1273890))

(assert (= (and b!1273891 res!847023) b!1273889))

(assert (= (or b!1273889 b!1273890) bm!62606))

(declare-fun m!1170863 () Bool)

(assert (=> b!1273888 m!1170863))

(assert (=> b!1273888 m!1170863))

(declare-fun m!1170865 () Bool)

(assert (=> b!1273888 m!1170865))

(assert (=> b!1273891 m!1170863))

(declare-fun m!1170867 () Bool)

(assert (=> b!1273891 m!1170867))

(declare-fun m!1170869 () Bool)

(assert (=> b!1273891 m!1170869))

(assert (=> b!1273891 m!1170863))

(declare-fun m!1170871 () Bool)

(assert (=> b!1273891 m!1170871))

(declare-fun m!1170873 () Bool)

(assert (=> bm!62606 m!1170873))

(assert (=> b!1273843 d!140045))

(declare-fun b!1273900 () Bool)

(declare-fun e!726915 () (_ BitVec 32))

(assert (=> b!1273900 (= e!726915 #b00000000000000000000000000000000)))

(declare-fun bm!62609 () Bool)

(declare-fun call!62612 () (_ BitVec 32))

(assert (=> bm!62609 (= call!62612 (arrayCountValidKeys!0 (_keys!12150 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40831 (_keys!12150 thiss!1551))))))

(declare-fun b!1273901 () Bool)

(declare-fun e!726916 () (_ BitVec 32))

(assert (=> b!1273901 (= e!726916 call!62612)))

(declare-fun b!1273902 () Bool)

(assert (=> b!1273902 (= e!726916 (bvadd #b00000000000000000000000000000001 call!62612))))

(declare-fun b!1273903 () Bool)

(assert (=> b!1273903 (= e!726915 e!726916)))

(declare-fun c!123786 () Bool)

(assert (=> b!1273903 (= c!123786 (validKeyInArray!0 (select (arr!40285 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!140047 () Bool)

(declare-fun lt!575161 () (_ BitVec 32))

(assert (=> d!140047 (and (bvsge lt!575161 #b00000000000000000000000000000000) (bvsle lt!575161 (bvsub (size!40831 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140047 (= lt!575161 e!726915)))

(declare-fun c!123785 () Bool)

(assert (=> d!140047 (= c!123785 (bvsge #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))))))

(assert (=> d!140047 (and (bvsle #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40831 (_keys!12150 thiss!1551)) (size!40831 (_keys!12150 thiss!1551))))))

(assert (=> d!140047 (= (arrayCountValidKeys!0 (_keys!12150 thiss!1551) #b00000000000000000000000000000000 (size!40831 (_keys!12150 thiss!1551))) lt!575161)))

(assert (= (and d!140047 c!123785) b!1273900))

(assert (= (and d!140047 (not c!123785)) b!1273903))

(assert (= (and b!1273903 c!123786) b!1273902))

(assert (= (and b!1273903 (not c!123786)) b!1273901))

(assert (= (or b!1273902 b!1273901) bm!62609))

(declare-fun m!1170875 () Bool)

(assert (=> bm!62609 m!1170875))

(assert (=> b!1273903 m!1170863))

(assert (=> b!1273903 m!1170863))

(assert (=> b!1273903 m!1170865))

(assert (=> b!1273845 d!140047))

(declare-fun d!140049 () Bool)

(assert (=> d!140049 (= (array_inv!30625 (_keys!12150 thiss!1551)) (bvsge (size!40831 (_keys!12150 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273840 d!140049))

(declare-fun d!140051 () Bool)

(assert (=> d!140051 (= (array_inv!30626 (_values!6759 thiss!1551)) (bvsge (size!40830 (_values!6759 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273840 d!140051))

(declare-fun mapIsEmpty!51325 () Bool)

(declare-fun mapRes!51325 () Bool)

(assert (=> mapIsEmpty!51325 mapRes!51325))

(declare-fun condMapEmpty!51325 () Bool)

(declare-fun mapDefault!51325 () ValueCell!15708)

(assert (=> mapNonEmpty!51319 (= condMapEmpty!51325 (= mapRest!51319 ((as const (Array (_ BitVec 32) ValueCell!15708)) mapDefault!51325)))))

(declare-fun e!726921 () Bool)

(assert (=> mapNonEmpty!51319 (= tp!97819 (and e!726921 mapRes!51325))))

(declare-fun mapNonEmpty!51325 () Bool)

(declare-fun tp!97828 () Bool)

(declare-fun e!726922 () Bool)

(assert (=> mapNonEmpty!51325 (= mapRes!51325 (and tp!97828 e!726922))))

(declare-fun mapRest!51325 () (Array (_ BitVec 32) ValueCell!15708))

(declare-fun mapKey!51325 () (_ BitVec 32))

(declare-fun mapValue!51325 () ValueCell!15708)

(assert (=> mapNonEmpty!51325 (= mapRest!51319 (store mapRest!51325 mapKey!51325 mapValue!51325))))

(declare-fun b!1273910 () Bool)

(assert (=> b!1273910 (= e!726922 tp_is_empty!33123)))

(declare-fun b!1273911 () Bool)

(assert (=> b!1273911 (= e!726921 tp_is_empty!33123)))

(assert (= (and mapNonEmpty!51319 condMapEmpty!51325) mapIsEmpty!51325))

(assert (= (and mapNonEmpty!51319 (not condMapEmpty!51325)) mapNonEmpty!51325))

(assert (= (and mapNonEmpty!51325 ((_ is ValueCellFull!15708) mapValue!51325)) b!1273910))

(assert (= (and mapNonEmpty!51319 ((_ is ValueCellFull!15708) mapDefault!51325)) b!1273911))

(declare-fun m!1170877 () Bool)

(assert (=> mapNonEmpty!51325 m!1170877))

(check-sat b_and!45809 (not d!140043) tp_is_empty!33123 (not b!1273891) (not b!1273888) (not bm!62609) (not b!1273877) (not b!1273878) (not b!1273903) (not bm!62606) (not mapNonEmpty!51325) (not b_next!27753))
(check-sat b_and!45809 (not b_next!27753))
