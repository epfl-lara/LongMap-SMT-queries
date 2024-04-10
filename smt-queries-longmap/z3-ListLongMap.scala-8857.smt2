; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107450 () Bool)

(assert start!107450)

(declare-fun b!1272803 () Bool)

(declare-fun b_free!27687 () Bool)

(declare-fun b_next!27687 () Bool)

(assert (=> b!1272803 (= b_free!27687 (not b_next!27687))))

(declare-fun tp!97587 () Bool)

(declare-fun b_and!45743 () Bool)

(assert (=> b!1272803 (= tp!97587 b_and!45743)))

(declare-fun b!1272801 () Bool)

(declare-fun e!726060 () Bool)

(declare-datatypes ((V!49269 0))(
  ( (V!49270 (val!16603 Int)) )
))
(declare-datatypes ((ValueCell!15675 0))(
  ( (ValueCellFull!15675 (v!19240 V!49269)) (EmptyCell!15675) )
))
(declare-datatypes ((array!83374 0))(
  ( (array!83375 (arr!40218 (Array (_ BitVec 32) ValueCell!15675)) (size!40757 (_ BitVec 32))) )
))
(declare-datatypes ((array!83376 0))(
  ( (array!83377 (arr!40219 (Array (_ BitVec 32) (_ BitVec 64))) (size!40758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6114 0))(
  ( (LongMapFixedSize!6115 (defaultEntry!6703 Int) (mask!34462 (_ BitVec 32)) (extraKeys!6382 (_ BitVec 32)) (zeroValue!6488 V!49269) (minValue!6488 V!49269) (_size!3112 (_ BitVec 32)) (_keys!12112 array!83376) (_values!6726 array!83374) (_vacant!3112 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6114)

(assert (=> b!1272801 (= e!726060 (and (= (size!40757 (_values!6726 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34462 thiss!1559))) (= (size!40758 (_keys!12112 thiss!1559)) (size!40757 (_values!6726 thiss!1559))) (bvsge (mask!34462 thiss!1559) #b00000000000000000000000000000000) (bvslt (extraKeys!6382 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun res!846552 () Bool)

(assert (=> start!107450 (=> (not res!846552) (not e!726060))))

(declare-fun valid!2294 (LongMapFixedSize!6114) Bool)

(assert (=> start!107450 (= res!846552 (valid!2294 thiss!1559))))

(assert (=> start!107450 e!726060))

(declare-fun e!726057 () Bool)

(assert (=> start!107450 e!726057))

(declare-fun mapIsEmpty!51187 () Bool)

(declare-fun mapRes!51187 () Bool)

(assert (=> mapIsEmpty!51187 mapRes!51187))

(declare-fun mapNonEmpty!51187 () Bool)

(declare-fun tp!97588 () Bool)

(declare-fun e!726058 () Bool)

(assert (=> mapNonEmpty!51187 (= mapRes!51187 (and tp!97588 e!726058))))

(declare-fun mapKey!51187 () (_ BitVec 32))

(declare-fun mapRest!51187 () (Array (_ BitVec 32) ValueCell!15675))

(declare-fun mapValue!51187 () ValueCell!15675)

(assert (=> mapNonEmpty!51187 (= (arr!40218 (_values!6726 thiss!1559)) (store mapRest!51187 mapKey!51187 mapValue!51187))))

(declare-fun b!1272802 () Bool)

(declare-fun e!726061 () Bool)

(declare-fun tp_is_empty!33057 () Bool)

(assert (=> b!1272802 (= e!726061 tp_is_empty!33057)))

(declare-fun e!726059 () Bool)

(declare-fun array_inv!30587 (array!83376) Bool)

(declare-fun array_inv!30588 (array!83374) Bool)

(assert (=> b!1272803 (= e!726057 (and tp!97587 tp_is_empty!33057 (array_inv!30587 (_keys!12112 thiss!1559)) (array_inv!30588 (_values!6726 thiss!1559)) e!726059))))

(declare-fun b!1272804 () Bool)

(declare-fun res!846551 () Bool)

(assert (=> b!1272804 (=> (not res!846551) (not e!726060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272804 (= res!846551 (validMask!0 (mask!34462 thiss!1559)))))

(declare-fun b!1272805 () Bool)

(assert (=> b!1272805 (= e!726058 tp_is_empty!33057)))

(declare-fun b!1272806 () Bool)

(assert (=> b!1272806 (= e!726059 (and e!726061 mapRes!51187))))

(declare-fun condMapEmpty!51187 () Bool)

(declare-fun mapDefault!51187 () ValueCell!15675)

(assert (=> b!1272806 (= condMapEmpty!51187 (= (arr!40218 (_values!6726 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15675)) mapDefault!51187)))))

(assert (= (and start!107450 res!846552) b!1272804))

(assert (= (and b!1272804 res!846551) b!1272801))

(assert (= (and b!1272806 condMapEmpty!51187) mapIsEmpty!51187))

(assert (= (and b!1272806 (not condMapEmpty!51187)) mapNonEmpty!51187))

(get-info :version)

(assert (= (and mapNonEmpty!51187 ((_ is ValueCellFull!15675) mapValue!51187)) b!1272805))

(assert (= (and b!1272806 ((_ is ValueCellFull!15675) mapDefault!51187)) b!1272802))

(assert (= b!1272803 b!1272806))

(assert (= start!107450 b!1272803))

(declare-fun m!1170295 () Bool)

(assert (=> start!107450 m!1170295))

(declare-fun m!1170297 () Bool)

(assert (=> mapNonEmpty!51187 m!1170297))

(declare-fun m!1170299 () Bool)

(assert (=> b!1272803 m!1170299))

(declare-fun m!1170301 () Bool)

(assert (=> b!1272803 m!1170301))

(declare-fun m!1170303 () Bool)

(assert (=> b!1272804 m!1170303))

(check-sat (not b_next!27687) (not b!1272803) tp_is_empty!33057 (not b!1272804) (not mapNonEmpty!51187) b_and!45743 (not start!107450))
(check-sat b_and!45743 (not b_next!27687))
(get-model)

(declare-fun d!139909 () Bool)

(assert (=> d!139909 (= (validMask!0 (mask!34462 thiss!1559)) (and (or (= (mask!34462 thiss!1559) #b00000000000000000000000000000111) (= (mask!34462 thiss!1559) #b00000000000000000000000000001111) (= (mask!34462 thiss!1559) #b00000000000000000000000000011111) (= (mask!34462 thiss!1559) #b00000000000000000000000000111111) (= (mask!34462 thiss!1559) #b00000000000000000000000001111111) (= (mask!34462 thiss!1559) #b00000000000000000000000011111111) (= (mask!34462 thiss!1559) #b00000000000000000000000111111111) (= (mask!34462 thiss!1559) #b00000000000000000000001111111111) (= (mask!34462 thiss!1559) #b00000000000000000000011111111111) (= (mask!34462 thiss!1559) #b00000000000000000000111111111111) (= (mask!34462 thiss!1559) #b00000000000000000001111111111111) (= (mask!34462 thiss!1559) #b00000000000000000011111111111111) (= (mask!34462 thiss!1559) #b00000000000000000111111111111111) (= (mask!34462 thiss!1559) #b00000000000000001111111111111111) (= (mask!34462 thiss!1559) #b00000000000000011111111111111111) (= (mask!34462 thiss!1559) #b00000000000000111111111111111111) (= (mask!34462 thiss!1559) #b00000000000001111111111111111111) (= (mask!34462 thiss!1559) #b00000000000011111111111111111111) (= (mask!34462 thiss!1559) #b00000000000111111111111111111111) (= (mask!34462 thiss!1559) #b00000000001111111111111111111111) (= (mask!34462 thiss!1559) #b00000000011111111111111111111111) (= (mask!34462 thiss!1559) #b00000000111111111111111111111111) (= (mask!34462 thiss!1559) #b00000001111111111111111111111111) (= (mask!34462 thiss!1559) #b00000011111111111111111111111111) (= (mask!34462 thiss!1559) #b00000111111111111111111111111111) (= (mask!34462 thiss!1559) #b00001111111111111111111111111111) (= (mask!34462 thiss!1559) #b00011111111111111111111111111111) (= (mask!34462 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34462 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272804 d!139909))

(declare-fun d!139911 () Bool)

(declare-fun res!846565 () Bool)

(declare-fun e!726082 () Bool)

(assert (=> d!139911 (=> (not res!846565) (not e!726082))))

(declare-fun simpleValid!459 (LongMapFixedSize!6114) Bool)

(assert (=> d!139911 (= res!846565 (simpleValid!459 thiss!1559))))

(assert (=> d!139911 (= (valid!2294 thiss!1559) e!726082)))

(declare-fun b!1272831 () Bool)

(declare-fun res!846566 () Bool)

(assert (=> b!1272831 (=> (not res!846566) (not e!726082))))

(declare-fun arrayCountValidKeys!0 (array!83376 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272831 (= res!846566 (= (arrayCountValidKeys!0 (_keys!12112 thiss!1559) #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))) (_size!3112 thiss!1559)))))

(declare-fun b!1272832 () Bool)

(declare-fun res!846567 () Bool)

(assert (=> b!1272832 (=> (not res!846567) (not e!726082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83376 (_ BitVec 32)) Bool)

(assert (=> b!1272832 (= res!846567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12112 thiss!1559) (mask!34462 thiss!1559)))))

(declare-fun b!1272833 () Bool)

(declare-datatypes ((List!28562 0))(
  ( (Nil!28559) (Cons!28558 (h!29767 (_ BitVec 64)) (t!42095 List!28562)) )
))
(declare-fun arrayNoDuplicates!0 (array!83376 (_ BitVec 32) List!28562) Bool)

(assert (=> b!1272833 (= e!726082 (arrayNoDuplicates!0 (_keys!12112 thiss!1559) #b00000000000000000000000000000000 Nil!28559))))

(assert (= (and d!139911 res!846565) b!1272831))

(assert (= (and b!1272831 res!846566) b!1272832))

(assert (= (and b!1272832 res!846567) b!1272833))

(declare-fun m!1170315 () Bool)

(assert (=> d!139911 m!1170315))

(declare-fun m!1170317 () Bool)

(assert (=> b!1272831 m!1170317))

(declare-fun m!1170319 () Bool)

(assert (=> b!1272832 m!1170319))

(declare-fun m!1170321 () Bool)

(assert (=> b!1272833 m!1170321))

(assert (=> start!107450 d!139911))

(declare-fun d!139913 () Bool)

(assert (=> d!139913 (= (array_inv!30587 (_keys!12112 thiss!1559)) (bvsge (size!40758 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272803 d!139913))

(declare-fun d!139915 () Bool)

(assert (=> d!139915 (= (array_inv!30588 (_values!6726 thiss!1559)) (bvsge (size!40757 (_values!6726 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272803 d!139915))

(declare-fun condMapEmpty!51193 () Bool)

(declare-fun mapDefault!51193 () ValueCell!15675)

(assert (=> mapNonEmpty!51187 (= condMapEmpty!51193 (= mapRest!51187 ((as const (Array (_ BitVec 32) ValueCell!15675)) mapDefault!51193)))))

(declare-fun e!726087 () Bool)

(declare-fun mapRes!51193 () Bool)

(assert (=> mapNonEmpty!51187 (= tp!97588 (and e!726087 mapRes!51193))))

(declare-fun mapIsEmpty!51193 () Bool)

(assert (=> mapIsEmpty!51193 mapRes!51193))

(declare-fun b!1272840 () Bool)

(declare-fun e!726088 () Bool)

(assert (=> b!1272840 (= e!726088 tp_is_empty!33057)))

(declare-fun b!1272841 () Bool)

(assert (=> b!1272841 (= e!726087 tp_is_empty!33057)))

(declare-fun mapNonEmpty!51193 () Bool)

(declare-fun tp!97597 () Bool)

(assert (=> mapNonEmpty!51193 (= mapRes!51193 (and tp!97597 e!726088))))

(declare-fun mapRest!51193 () (Array (_ BitVec 32) ValueCell!15675))

(declare-fun mapKey!51193 () (_ BitVec 32))

(declare-fun mapValue!51193 () ValueCell!15675)

(assert (=> mapNonEmpty!51193 (= mapRest!51187 (store mapRest!51193 mapKey!51193 mapValue!51193))))

(assert (= (and mapNonEmpty!51187 condMapEmpty!51193) mapIsEmpty!51193))

(assert (= (and mapNonEmpty!51187 (not condMapEmpty!51193)) mapNonEmpty!51193))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15675) mapValue!51193)) b!1272840))

(assert (= (and mapNonEmpty!51187 ((_ is ValueCellFull!15675) mapDefault!51193)) b!1272841))

(declare-fun m!1170323 () Bool)

(assert (=> mapNonEmpty!51193 m!1170323))

(check-sat (not b_next!27687) (not d!139911) tp_is_empty!33057 (not b!1272833) (not b!1272831) b_and!45743 (not mapNonEmpty!51193) (not b!1272832))
(check-sat b_and!45743 (not b_next!27687))
(get-model)

(declare-fun b!1272852 () Bool)

(declare-fun res!846576 () Bool)

(declare-fun e!726091 () Bool)

(assert (=> b!1272852 (=> (not res!846576) (not e!726091))))

(declare-fun size!40761 (LongMapFixedSize!6114) (_ BitVec 32))

(assert (=> b!1272852 (= res!846576 (= (size!40761 thiss!1559) (bvadd (_size!3112 thiss!1559) (bvsdiv (bvadd (extraKeys!6382 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272853 () Bool)

(assert (=> b!1272853 (= e!726091 (and (bvsge (extraKeys!6382 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6382 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3112 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272850 () Bool)

(declare-fun res!846578 () Bool)

(assert (=> b!1272850 (=> (not res!846578) (not e!726091))))

(assert (=> b!1272850 (= res!846578 (and (= (size!40757 (_values!6726 thiss!1559)) (bvadd (mask!34462 thiss!1559) #b00000000000000000000000000000001)) (= (size!40758 (_keys!12112 thiss!1559)) (size!40757 (_values!6726 thiss!1559))) (bvsge (_size!3112 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3112 thiss!1559) (bvadd (mask!34462 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272851 () Bool)

(declare-fun res!846579 () Bool)

(assert (=> b!1272851 (=> (not res!846579) (not e!726091))))

(assert (=> b!1272851 (= res!846579 (bvsge (size!40761 thiss!1559) (_size!3112 thiss!1559)))))

(declare-fun d!139917 () Bool)

(declare-fun res!846577 () Bool)

(assert (=> d!139917 (=> (not res!846577) (not e!726091))))

(assert (=> d!139917 (= res!846577 (validMask!0 (mask!34462 thiss!1559)))))

(assert (=> d!139917 (= (simpleValid!459 thiss!1559) e!726091)))

(assert (= (and d!139917 res!846577) b!1272850))

(assert (= (and b!1272850 res!846578) b!1272851))

(assert (= (and b!1272851 res!846579) b!1272852))

(assert (= (and b!1272852 res!846576) b!1272853))

(declare-fun m!1170325 () Bool)

(assert (=> b!1272852 m!1170325))

(assert (=> b!1272851 m!1170325))

(assert (=> d!139917 m!1170303))

(assert (=> d!139911 d!139917))

(declare-fun b!1272862 () Bool)

(declare-fun e!726096 () (_ BitVec 32))

(assert (=> b!1272862 (= e!726096 #b00000000000000000000000000000000)))

(declare-fun b!1272863 () Bool)

(declare-fun e!726097 () (_ BitVec 32))

(declare-fun call!62567 () (_ BitVec 32))

(assert (=> b!1272863 (= e!726097 (bvadd #b00000000000000000000000000000001 call!62567))))

(declare-fun b!1272864 () Bool)

(assert (=> b!1272864 (= e!726096 e!726097)))

(declare-fun c!123725 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272864 (= c!123725 (validKeyInArray!0 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139919 () Bool)

(declare-fun lt!575083 () (_ BitVec 32))

(assert (=> d!139919 (and (bvsge lt!575083 #b00000000000000000000000000000000) (bvsle lt!575083 (bvsub (size!40758 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139919 (= lt!575083 e!726096)))

(declare-fun c!123726 () Bool)

(assert (=> d!139919 (= c!123726 (bvsge #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))))))

(assert (=> d!139919 (and (bvsle #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40758 (_keys!12112 thiss!1559)) (size!40758 (_keys!12112 thiss!1559))))))

(assert (=> d!139919 (= (arrayCountValidKeys!0 (_keys!12112 thiss!1559) #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))) lt!575083)))

(declare-fun bm!62564 () Bool)

(assert (=> bm!62564 (= call!62567 (arrayCountValidKeys!0 (_keys!12112 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40758 (_keys!12112 thiss!1559))))))

(declare-fun b!1272865 () Bool)

(assert (=> b!1272865 (= e!726097 call!62567)))

(assert (= (and d!139919 c!123726) b!1272862))

(assert (= (and d!139919 (not c!123726)) b!1272864))

(assert (= (and b!1272864 c!123725) b!1272863))

(assert (= (and b!1272864 (not c!123725)) b!1272865))

(assert (= (or b!1272863 b!1272865) bm!62564))

(declare-fun m!1170327 () Bool)

(assert (=> b!1272864 m!1170327))

(assert (=> b!1272864 m!1170327))

(declare-fun m!1170329 () Bool)

(assert (=> b!1272864 m!1170329))

(declare-fun m!1170331 () Bool)

(assert (=> bm!62564 m!1170331))

(assert (=> b!1272831 d!139919))

(declare-fun bm!62567 () Bool)

(declare-fun call!62570 () Bool)

(assert (=> bm!62567 (= call!62570 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12112 thiss!1559) (mask!34462 thiss!1559)))))

(declare-fun b!1272874 () Bool)

(declare-fun e!726104 () Bool)

(declare-fun e!726105 () Bool)

(assert (=> b!1272874 (= e!726104 e!726105)))

(declare-fun lt!575091 () (_ BitVec 64))

(assert (=> b!1272874 (= lt!575091 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42324 0))(
  ( (Unit!42325) )
))
(declare-fun lt!575090 () Unit!42324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83376 (_ BitVec 64) (_ BitVec 32)) Unit!42324)

(assert (=> b!1272874 (= lt!575090 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12112 thiss!1559) lt!575091 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272874 (arrayContainsKey!0 (_keys!12112 thiss!1559) lt!575091 #b00000000000000000000000000000000)))

(declare-fun lt!575092 () Unit!42324)

(assert (=> b!1272874 (= lt!575092 lt!575090)))

(declare-fun res!846584 () Bool)

(declare-datatypes ((SeekEntryResult!9992 0))(
  ( (MissingZero!9992 (index!42339 (_ BitVec 32))) (Found!9992 (index!42340 (_ BitVec 32))) (Intermediate!9992 (undefined!10804 Bool) (index!42341 (_ BitVec 32)) (x!112495 (_ BitVec 32))) (Undefined!9992) (MissingVacant!9992 (index!42342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83376 (_ BitVec 32)) SeekEntryResult!9992)

(assert (=> b!1272874 (= res!846584 (= (seekEntryOrOpen!0 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000) (_keys!12112 thiss!1559) (mask!34462 thiss!1559)) (Found!9992 #b00000000000000000000000000000000)))))

(assert (=> b!1272874 (=> (not res!846584) (not e!726105))))

(declare-fun b!1272875 () Bool)

(assert (=> b!1272875 (= e!726105 call!62570)))

(declare-fun d!139921 () Bool)

(declare-fun res!846585 () Bool)

(declare-fun e!726106 () Bool)

(assert (=> d!139921 (=> res!846585 e!726106)))

(assert (=> d!139921 (= res!846585 (bvsge #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))))))

(assert (=> d!139921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12112 thiss!1559) (mask!34462 thiss!1559)) e!726106)))

(declare-fun b!1272876 () Bool)

(assert (=> b!1272876 (= e!726106 e!726104)))

(declare-fun c!123729 () Bool)

(assert (=> b!1272876 (= c!123729 (validKeyInArray!0 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272877 () Bool)

(assert (=> b!1272877 (= e!726104 call!62570)))

(assert (= (and d!139921 (not res!846585)) b!1272876))

(assert (= (and b!1272876 c!123729) b!1272874))

(assert (= (and b!1272876 (not c!123729)) b!1272877))

(assert (= (and b!1272874 res!846584) b!1272875))

(assert (= (or b!1272875 b!1272877) bm!62567))

(declare-fun m!1170333 () Bool)

(assert (=> bm!62567 m!1170333))

(assert (=> b!1272874 m!1170327))

(declare-fun m!1170335 () Bool)

(assert (=> b!1272874 m!1170335))

(declare-fun m!1170337 () Bool)

(assert (=> b!1272874 m!1170337))

(assert (=> b!1272874 m!1170327))

(declare-fun m!1170339 () Bool)

(assert (=> b!1272874 m!1170339))

(assert (=> b!1272876 m!1170327))

(assert (=> b!1272876 m!1170327))

(assert (=> b!1272876 m!1170329))

(assert (=> b!1272832 d!139921))

(declare-fun b!1272888 () Bool)

(declare-fun e!726117 () Bool)

(declare-fun contains!7671 (List!28562 (_ BitVec 64)) Bool)

(assert (=> b!1272888 (= e!726117 (contains!7671 Nil!28559 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62570 () Bool)

(declare-fun call!62573 () Bool)

(declare-fun c!123732 () Bool)

(assert (=> bm!62570 (= call!62573 (arrayNoDuplicates!0 (_keys!12112 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123732 (Cons!28558 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000) Nil!28559) Nil!28559)))))

(declare-fun b!1272889 () Bool)

(declare-fun e!726118 () Bool)

(assert (=> b!1272889 (= e!726118 call!62573)))

(declare-fun d!139923 () Bool)

(declare-fun res!846592 () Bool)

(declare-fun e!726115 () Bool)

(assert (=> d!139923 (=> res!846592 e!726115)))

(assert (=> d!139923 (= res!846592 (bvsge #b00000000000000000000000000000000 (size!40758 (_keys!12112 thiss!1559))))))

(assert (=> d!139923 (= (arrayNoDuplicates!0 (_keys!12112 thiss!1559) #b00000000000000000000000000000000 Nil!28559) e!726115)))

(declare-fun b!1272890 () Bool)

(declare-fun e!726116 () Bool)

(assert (=> b!1272890 (= e!726115 e!726116)))

(declare-fun res!846593 () Bool)

(assert (=> b!1272890 (=> (not res!846593) (not e!726116))))

(assert (=> b!1272890 (= res!846593 (not e!726117))))

(declare-fun res!846594 () Bool)

(assert (=> b!1272890 (=> (not res!846594) (not e!726117))))

(assert (=> b!1272890 (= res!846594 (validKeyInArray!0 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272891 () Bool)

(assert (=> b!1272891 (= e!726118 call!62573)))

(declare-fun b!1272892 () Bool)

(assert (=> b!1272892 (= e!726116 e!726118)))

(assert (=> b!1272892 (= c!123732 (validKeyInArray!0 (select (arr!40219 (_keys!12112 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139923 (not res!846592)) b!1272890))

(assert (= (and b!1272890 res!846594) b!1272888))

(assert (= (and b!1272890 res!846593) b!1272892))

(assert (= (and b!1272892 c!123732) b!1272889))

(assert (= (and b!1272892 (not c!123732)) b!1272891))

(assert (= (or b!1272889 b!1272891) bm!62570))

(assert (=> b!1272888 m!1170327))

(assert (=> b!1272888 m!1170327))

(declare-fun m!1170341 () Bool)

(assert (=> b!1272888 m!1170341))

(assert (=> bm!62570 m!1170327))

(declare-fun m!1170343 () Bool)

(assert (=> bm!62570 m!1170343))

(assert (=> b!1272890 m!1170327))

(assert (=> b!1272890 m!1170327))

(assert (=> b!1272890 m!1170329))

(assert (=> b!1272892 m!1170327))

(assert (=> b!1272892 m!1170327))

(assert (=> b!1272892 m!1170329))

(assert (=> b!1272833 d!139923))

(declare-fun condMapEmpty!51194 () Bool)

(declare-fun mapDefault!51194 () ValueCell!15675)

(assert (=> mapNonEmpty!51193 (= condMapEmpty!51194 (= mapRest!51193 ((as const (Array (_ BitVec 32) ValueCell!15675)) mapDefault!51194)))))

(declare-fun e!726119 () Bool)

(declare-fun mapRes!51194 () Bool)

(assert (=> mapNonEmpty!51193 (= tp!97597 (and e!726119 mapRes!51194))))

(declare-fun mapIsEmpty!51194 () Bool)

(assert (=> mapIsEmpty!51194 mapRes!51194))

(declare-fun b!1272893 () Bool)

(declare-fun e!726120 () Bool)

(assert (=> b!1272893 (= e!726120 tp_is_empty!33057)))

(declare-fun b!1272894 () Bool)

(assert (=> b!1272894 (= e!726119 tp_is_empty!33057)))

(declare-fun mapNonEmpty!51194 () Bool)

(declare-fun tp!97598 () Bool)

(assert (=> mapNonEmpty!51194 (= mapRes!51194 (and tp!97598 e!726120))))

(declare-fun mapRest!51194 () (Array (_ BitVec 32) ValueCell!15675))

(declare-fun mapValue!51194 () ValueCell!15675)

(declare-fun mapKey!51194 () (_ BitVec 32))

(assert (=> mapNonEmpty!51194 (= mapRest!51193 (store mapRest!51194 mapKey!51194 mapValue!51194))))

(assert (= (and mapNonEmpty!51193 condMapEmpty!51194) mapIsEmpty!51194))

(assert (= (and mapNonEmpty!51193 (not condMapEmpty!51194)) mapNonEmpty!51194))

(assert (= (and mapNonEmpty!51194 ((_ is ValueCellFull!15675) mapValue!51194)) b!1272893))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15675) mapDefault!51194)) b!1272894))

(declare-fun m!1170345 () Bool)

(assert (=> mapNonEmpty!51194 m!1170345))

(check-sat (not b!1272851) (not bm!62570) (not b!1272852) b_and!45743 (not bm!62564) (not b!1272888) (not b!1272890) (not bm!62567) (not d!139917) (not b!1272876) (not b_next!27687) (not b!1272892) (not mapNonEmpty!51194) tp_is_empty!33057 (not b!1272864) (not b!1272874))
(check-sat b_and!45743 (not b_next!27687))
