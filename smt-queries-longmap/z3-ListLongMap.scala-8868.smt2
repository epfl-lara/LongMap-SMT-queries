; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107626 () Bool)

(assert start!107626)

(declare-fun b!1273759 () Bool)

(declare-fun b_free!27751 () Bool)

(declare-fun b_next!27751 () Bool)

(assert (=> b!1273759 (= b_free!27751 (not b_next!27751))))

(declare-fun tp!97814 () Bool)

(declare-fun b_and!45789 () Bool)

(assert (=> b!1273759 (= tp!97814 b_and!45789)))

(declare-fun b!1273755 () Bool)

(declare-fun e!726833 () Bool)

(declare-fun tp_is_empty!33121 () Bool)

(assert (=> b!1273755 (= e!726833 tp_is_empty!33121)))

(declare-fun b!1273756 () Bool)

(declare-fun res!846958 () Bool)

(declare-fun e!726828 () Bool)

(assert (=> b!1273756 (=> (not res!846958) (not e!726828))))

(declare-datatypes ((V!49355 0))(
  ( (V!49356 (val!16635 Int)) )
))
(declare-datatypes ((ValueCell!15707 0))(
  ( (ValueCellFull!15707 (v!19271 V!49355)) (EmptyCell!15707) )
))
(declare-datatypes ((array!83421 0))(
  ( (array!83422 (arr!40232 (Array (_ BitVec 32) ValueCell!15707)) (size!40780 (_ BitVec 32))) )
))
(declare-datatypes ((array!83423 0))(
  ( (array!83424 (arr!40233 (Array (_ BitVec 32) (_ BitVec 64))) (size!40781 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6178 0))(
  ( (LongMapFixedSize!6179 (defaultEntry!6735 Int) (mask!34525 (_ BitVec 32)) (extraKeys!6414 (_ BitVec 32)) (zeroValue!6520 V!49355) (minValue!6520 V!49355) (_size!3144 (_ BitVec 32)) (_keys!12145 array!83423) (_values!6758 array!83421) (_vacant!3144 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6178)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83423 (_ BitVec 32)) Bool)

(assert (=> b!1273756 (= res!846958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12145 thiss!1551) (mask!34525 thiss!1551)))))

(declare-fun b!1273757 () Bool)

(declare-fun res!846960 () Bool)

(assert (=> b!1273757 (=> (not res!846960) (not e!726828))))

(declare-fun arrayCountValidKeys!0 (array!83423 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273757 (= res!846960 (= (arrayCountValidKeys!0 (_keys!12145 thiss!1551) #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))) (_size!3144 thiss!1551)))))

(declare-fun b!1273758 () Bool)

(declare-fun e!726829 () Bool)

(declare-fun e!726831 () Bool)

(declare-fun mapRes!51316 () Bool)

(assert (=> b!1273758 (= e!726829 (and e!726831 mapRes!51316))))

(declare-fun condMapEmpty!51316 () Bool)

(declare-fun mapDefault!51316 () ValueCell!15707)

(assert (=> b!1273758 (= condMapEmpty!51316 (= (arr!40232 (_values!6758 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15707)) mapDefault!51316)))))

(declare-fun mapIsEmpty!51316 () Bool)

(assert (=> mapIsEmpty!51316 mapRes!51316))

(declare-fun e!726832 () Bool)

(declare-fun array_inv!30739 (array!83423) Bool)

(declare-fun array_inv!30740 (array!83421) Bool)

(assert (=> b!1273759 (= e!726832 (and tp!97814 tp_is_empty!33121 (array_inv!30739 (_keys!12145 thiss!1551)) (array_inv!30740 (_values!6758 thiss!1551)) e!726829))))

(declare-fun res!846959 () Bool)

(assert (=> start!107626 (=> (not res!846959) (not e!726828))))

(declare-fun simpleValid!475 (LongMapFixedSize!6178) Bool)

(assert (=> start!107626 (= res!846959 (simpleValid!475 thiss!1551))))

(assert (=> start!107626 e!726828))

(assert (=> start!107626 e!726832))

(declare-fun b!1273760 () Bool)

(assert (=> b!1273760 (= e!726828 (bvsgt #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))))))

(declare-fun mapNonEmpty!51316 () Bool)

(declare-fun tp!97813 () Bool)

(assert (=> mapNonEmpty!51316 (= mapRes!51316 (and tp!97813 e!726833))))

(declare-fun mapKey!51316 () (_ BitVec 32))

(declare-fun mapValue!51316 () ValueCell!15707)

(declare-fun mapRest!51316 () (Array (_ BitVec 32) ValueCell!15707))

(assert (=> mapNonEmpty!51316 (= (arr!40232 (_values!6758 thiss!1551)) (store mapRest!51316 mapKey!51316 mapValue!51316))))

(declare-fun b!1273761 () Bool)

(assert (=> b!1273761 (= e!726831 tp_is_empty!33121)))

(assert (= (and start!107626 res!846959) b!1273757))

(assert (= (and b!1273757 res!846960) b!1273756))

(assert (= (and b!1273756 res!846958) b!1273760))

(assert (= (and b!1273758 condMapEmpty!51316) mapIsEmpty!51316))

(assert (= (and b!1273758 (not condMapEmpty!51316)) mapNonEmpty!51316))

(get-info :version)

(assert (= (and mapNonEmpty!51316 ((_ is ValueCellFull!15707) mapValue!51316)) b!1273755))

(assert (= (and b!1273758 ((_ is ValueCellFull!15707) mapDefault!51316)) b!1273761))

(assert (= b!1273759 b!1273758))

(assert (= start!107626 b!1273759))

(declare-fun m!1170323 () Bool)

(assert (=> b!1273757 m!1170323))

(declare-fun m!1170325 () Bool)

(assert (=> b!1273756 m!1170325))

(declare-fun m!1170327 () Bool)

(assert (=> mapNonEmpty!51316 m!1170327))

(declare-fun m!1170329 () Bool)

(assert (=> start!107626 m!1170329))

(declare-fun m!1170331 () Bool)

(assert (=> b!1273759 m!1170331))

(declare-fun m!1170333 () Bool)

(assert (=> b!1273759 m!1170333))

(check-sat (not mapNonEmpty!51316) (not start!107626) tp_is_empty!33121 (not b!1273759) (not b_next!27751) (not b!1273757) b_and!45789 (not b!1273756))
(check-sat b_and!45789 (not b_next!27751))
(get-model)

(declare-fun b!1273812 () Bool)

(declare-fun e!726877 () Bool)

(declare-fun e!726876 () Bool)

(assert (=> b!1273812 (= e!726877 e!726876)))

(declare-fun lt!574980 () (_ BitVec 64))

(assert (=> b!1273812 (= lt!574980 (select (arr!40233 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42180 0))(
  ( (Unit!42181) )
))
(declare-fun lt!574979 () Unit!42180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83423 (_ BitVec 64) (_ BitVec 32)) Unit!42180)

(assert (=> b!1273812 (= lt!574979 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12145 thiss!1551) lt!574980 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273812 (arrayContainsKey!0 (_keys!12145 thiss!1551) lt!574980 #b00000000000000000000000000000000)))

(declare-fun lt!574978 () Unit!42180)

(assert (=> b!1273812 (= lt!574978 lt!574979)))

(declare-fun res!846983 () Bool)

(declare-datatypes ((SeekEntryResult!9996 0))(
  ( (MissingZero!9996 (index!42355 (_ BitVec 32))) (Found!9996 (index!42356 (_ BitVec 32))) (Intermediate!9996 (undefined!10808 Bool) (index!42357 (_ BitVec 32)) (x!112676 (_ BitVec 32))) (Undefined!9996) (MissingVacant!9996 (index!42358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83423 (_ BitVec 32)) SeekEntryResult!9996)

(assert (=> b!1273812 (= res!846983 (= (seekEntryOrOpen!0 (select (arr!40233 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000) (_keys!12145 thiss!1551) (mask!34525 thiss!1551)) (Found!9996 #b00000000000000000000000000000000)))))

(assert (=> b!1273812 (=> (not res!846983) (not e!726876))))

(declare-fun bm!62587 () Bool)

(declare-fun call!62590 () Bool)

(assert (=> bm!62587 (= call!62590 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12145 thiss!1551) (mask!34525 thiss!1551)))))

(declare-fun b!1273813 () Bool)

(declare-fun e!726878 () Bool)

(assert (=> b!1273813 (= e!726878 e!726877)))

(declare-fun c!123764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273813 (= c!123764 (validKeyInArray!0 (select (arr!40233 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!139931 () Bool)

(declare-fun res!846984 () Bool)

(assert (=> d!139931 (=> res!846984 e!726878)))

(assert (=> d!139931 (= res!846984 (bvsge #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))))))

(assert (=> d!139931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12145 thiss!1551) (mask!34525 thiss!1551)) e!726878)))

(declare-fun b!1273814 () Bool)

(assert (=> b!1273814 (= e!726876 call!62590)))

(declare-fun b!1273815 () Bool)

(assert (=> b!1273815 (= e!726877 call!62590)))

(assert (= (and d!139931 (not res!846984)) b!1273813))

(assert (= (and b!1273813 c!123764) b!1273812))

(assert (= (and b!1273813 (not c!123764)) b!1273815))

(assert (= (and b!1273812 res!846983) b!1273814))

(assert (= (or b!1273814 b!1273815) bm!62587))

(declare-fun m!1170359 () Bool)

(assert (=> b!1273812 m!1170359))

(declare-fun m!1170361 () Bool)

(assert (=> b!1273812 m!1170361))

(declare-fun m!1170363 () Bool)

(assert (=> b!1273812 m!1170363))

(assert (=> b!1273812 m!1170359))

(declare-fun m!1170365 () Bool)

(assert (=> b!1273812 m!1170365))

(declare-fun m!1170367 () Bool)

(assert (=> bm!62587 m!1170367))

(assert (=> b!1273813 m!1170359))

(assert (=> b!1273813 m!1170359))

(declare-fun m!1170369 () Bool)

(assert (=> b!1273813 m!1170369))

(assert (=> b!1273756 d!139931))

(declare-fun b!1273827 () Bool)

(declare-fun e!726881 () Bool)

(assert (=> b!1273827 (= e!726881 (and (bvsge (extraKeys!6414 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6414 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3144 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273826 () Bool)

(declare-fun res!846993 () Bool)

(assert (=> b!1273826 (=> (not res!846993) (not e!726881))))

(declare-fun size!40786 (LongMapFixedSize!6178) (_ BitVec 32))

(assert (=> b!1273826 (= res!846993 (= (size!40786 thiss!1551) (bvadd (_size!3144 thiss!1551) (bvsdiv (bvadd (extraKeys!6414 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273824 () Bool)

(declare-fun res!846994 () Bool)

(assert (=> b!1273824 (=> (not res!846994) (not e!726881))))

(assert (=> b!1273824 (= res!846994 (and (= (size!40780 (_values!6758 thiss!1551)) (bvadd (mask!34525 thiss!1551) #b00000000000000000000000000000001)) (= (size!40781 (_keys!12145 thiss!1551)) (size!40780 (_values!6758 thiss!1551))) (bvsge (_size!3144 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3144 thiss!1551) (bvadd (mask!34525 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273825 () Bool)

(declare-fun res!846996 () Bool)

(assert (=> b!1273825 (=> (not res!846996) (not e!726881))))

(assert (=> b!1273825 (= res!846996 (bvsge (size!40786 thiss!1551) (_size!3144 thiss!1551)))))

(declare-fun d!139933 () Bool)

(declare-fun res!846995 () Bool)

(assert (=> d!139933 (=> (not res!846995) (not e!726881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139933 (= res!846995 (validMask!0 (mask!34525 thiss!1551)))))

(assert (=> d!139933 (= (simpleValid!475 thiss!1551) e!726881)))

(assert (= (and d!139933 res!846995) b!1273824))

(assert (= (and b!1273824 res!846994) b!1273825))

(assert (= (and b!1273825 res!846996) b!1273826))

(assert (= (and b!1273826 res!846993) b!1273827))

(declare-fun m!1170371 () Bool)

(assert (=> b!1273826 m!1170371))

(assert (=> b!1273825 m!1170371))

(declare-fun m!1170373 () Bool)

(assert (=> d!139933 m!1170373))

(assert (=> start!107626 d!139933))

(declare-fun b!1273836 () Bool)

(declare-fun e!726887 () (_ BitVec 32))

(declare-fun call!62593 () (_ BitVec 32))

(assert (=> b!1273836 (= e!726887 (bvadd #b00000000000000000000000000000001 call!62593))))

(declare-fun b!1273837 () Bool)

(assert (=> b!1273837 (= e!726887 call!62593)))

(declare-fun d!139935 () Bool)

(declare-fun lt!574983 () (_ BitVec 32))

(assert (=> d!139935 (and (bvsge lt!574983 #b00000000000000000000000000000000) (bvsle lt!574983 (bvsub (size!40781 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!726886 () (_ BitVec 32))

(assert (=> d!139935 (= lt!574983 e!726886)))

(declare-fun c!123769 () Bool)

(assert (=> d!139935 (= c!123769 (bvsge #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))))))

(assert (=> d!139935 (and (bvsle #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40781 (_keys!12145 thiss!1551)) (size!40781 (_keys!12145 thiss!1551))))))

(assert (=> d!139935 (= (arrayCountValidKeys!0 (_keys!12145 thiss!1551) #b00000000000000000000000000000000 (size!40781 (_keys!12145 thiss!1551))) lt!574983)))

(declare-fun b!1273838 () Bool)

(assert (=> b!1273838 (= e!726886 e!726887)))

(declare-fun c!123770 () Bool)

(assert (=> b!1273838 (= c!123770 (validKeyInArray!0 (select (arr!40233 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273839 () Bool)

(assert (=> b!1273839 (= e!726886 #b00000000000000000000000000000000)))

(declare-fun bm!62590 () Bool)

(assert (=> bm!62590 (= call!62593 (arrayCountValidKeys!0 (_keys!12145 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40781 (_keys!12145 thiss!1551))))))

(assert (= (and d!139935 c!123769) b!1273839))

(assert (= (and d!139935 (not c!123769)) b!1273838))

(assert (= (and b!1273838 c!123770) b!1273836))

(assert (= (and b!1273838 (not c!123770)) b!1273837))

(assert (= (or b!1273836 b!1273837) bm!62590))

(assert (=> b!1273838 m!1170359))

(assert (=> b!1273838 m!1170359))

(assert (=> b!1273838 m!1170369))

(declare-fun m!1170375 () Bool)

(assert (=> bm!62590 m!1170375))

(assert (=> b!1273757 d!139935))

(declare-fun d!139937 () Bool)

(assert (=> d!139937 (= (array_inv!30739 (_keys!12145 thiss!1551)) (bvsge (size!40781 (_keys!12145 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273759 d!139937))

(declare-fun d!139939 () Bool)

(assert (=> d!139939 (= (array_inv!30740 (_values!6758 thiss!1551)) (bvsge (size!40780 (_values!6758 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273759 d!139939))

(declare-fun b!1273846 () Bool)

(declare-fun e!726892 () Bool)

(assert (=> b!1273846 (= e!726892 tp_is_empty!33121)))

(declare-fun condMapEmpty!51325 () Bool)

(declare-fun mapDefault!51325 () ValueCell!15707)

(assert (=> mapNonEmpty!51316 (= condMapEmpty!51325 (= mapRest!51316 ((as const (Array (_ BitVec 32) ValueCell!15707)) mapDefault!51325)))))

(declare-fun e!726893 () Bool)

(declare-fun mapRes!51325 () Bool)

(assert (=> mapNonEmpty!51316 (= tp!97813 (and e!726893 mapRes!51325))))

(declare-fun mapIsEmpty!51325 () Bool)

(assert (=> mapIsEmpty!51325 mapRes!51325))

(declare-fun b!1273847 () Bool)

(assert (=> b!1273847 (= e!726893 tp_is_empty!33121)))

(declare-fun mapNonEmpty!51325 () Bool)

(declare-fun tp!97829 () Bool)

(assert (=> mapNonEmpty!51325 (= mapRes!51325 (and tp!97829 e!726892))))

(declare-fun mapValue!51325 () ValueCell!15707)

(declare-fun mapRest!51325 () (Array (_ BitVec 32) ValueCell!15707))

(declare-fun mapKey!51325 () (_ BitVec 32))

(assert (=> mapNonEmpty!51325 (= mapRest!51316 (store mapRest!51325 mapKey!51325 mapValue!51325))))

(assert (= (and mapNonEmpty!51316 condMapEmpty!51325) mapIsEmpty!51325))

(assert (= (and mapNonEmpty!51316 (not condMapEmpty!51325)) mapNonEmpty!51325))

(assert (= (and mapNonEmpty!51325 ((_ is ValueCellFull!15707) mapValue!51325)) b!1273846))

(assert (= (and mapNonEmpty!51316 ((_ is ValueCellFull!15707) mapDefault!51325)) b!1273847))

(declare-fun m!1170377 () Bool)

(assert (=> mapNonEmpty!51325 m!1170377))

(check-sat (not bm!62587) (not b!1273825) (not b!1273826) (not d!139933) (not b!1273813) (not b!1273812) (not b!1273838) (not bm!62590) (not b_next!27751) tp_is_empty!33121 b_and!45789 (not mapNonEmpty!51325))
(check-sat b_and!45789 (not b_next!27751))
