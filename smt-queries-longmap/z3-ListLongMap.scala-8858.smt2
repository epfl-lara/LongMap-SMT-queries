; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107470 () Bool)

(assert start!107470)

(declare-fun b!1272845 () Bool)

(declare-fun b_free!27691 () Bool)

(declare-fun b_next!27691 () Bool)

(assert (=> b!1272845 (= b_free!27691 (not b_next!27691))))

(declare-fun tp!97604 () Bool)

(declare-fun b_and!45729 () Bool)

(assert (=> b!1272845 (= tp!97604 b_and!45729)))

(declare-fun b!1272843 () Bool)

(declare-fun e!726104 () Bool)

(declare-fun tp_is_empty!33061 () Bool)

(assert (=> b!1272843 (= e!726104 tp_is_empty!33061)))

(declare-fun b!1272844 () Bool)

(declare-fun res!846572 () Bool)

(declare-fun e!726108 () Bool)

(assert (=> b!1272844 (=> (not res!846572) (not e!726108))))

(declare-datatypes ((V!49275 0))(
  ( (V!49276 (val!16605 Int)) )
))
(declare-datatypes ((ValueCell!15677 0))(
  ( (ValueCellFull!15677 (v!19241 V!49275)) (EmptyCell!15677) )
))
(declare-datatypes ((array!83283 0))(
  ( (array!83284 (arr!40172 (Array (_ BitVec 32) ValueCell!15677)) (size!40714 (_ BitVec 32))) )
))
(declare-datatypes ((array!83285 0))(
  ( (array!83286 (arr!40173 (Array (_ BitVec 32) (_ BitVec 64))) (size!40715 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6118 0))(
  ( (LongMapFixedSize!6119 (defaultEntry!6705 Int) (mask!34463 (_ BitVec 32)) (extraKeys!6384 (_ BitVec 32)) (zeroValue!6490 V!49275) (minValue!6490 V!49275) (_size!3114 (_ BitVec 32)) (_keys!12111 array!83285) (_values!6728 array!83283) (_vacant!3114 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6118)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272844 (= res!846572 (validMask!0 (mask!34463 thiss!1559)))))

(declare-fun mapIsEmpty!51197 () Bool)

(declare-fun mapRes!51197 () Bool)

(assert (=> mapIsEmpty!51197 mapRes!51197))

(declare-fun e!726109 () Bool)

(declare-fun e!726107 () Bool)

(declare-fun array_inv!30705 (array!83285) Bool)

(declare-fun array_inv!30706 (array!83283) Bool)

(assert (=> b!1272845 (= e!726109 (and tp!97604 tp_is_empty!33061 (array_inv!30705 (_keys!12111 thiss!1559)) (array_inv!30706 (_values!6728 thiss!1559)) e!726107))))

(declare-fun b!1272846 () Bool)

(assert (=> b!1272846 (= e!726108 (and (= (size!40714 (_values!6728 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34463 thiss!1559))) (= (size!40715 (_keys!12111 thiss!1559)) (size!40714 (_values!6728 thiss!1559))) (bvsge (mask!34463 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6384 thiss!1559) #b00000000000000000000000000000000) (bvsgt (extraKeys!6384 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1272847 () Bool)

(declare-fun e!726106 () Bool)

(assert (=> b!1272847 (= e!726106 tp_is_empty!33061)))

(declare-fun mapNonEmpty!51197 () Bool)

(declare-fun tp!97605 () Bool)

(assert (=> mapNonEmpty!51197 (= mapRes!51197 (and tp!97605 e!726104))))

(declare-fun mapRest!51197 () (Array (_ BitVec 32) ValueCell!15677))

(declare-fun mapValue!51197 () ValueCell!15677)

(declare-fun mapKey!51197 () (_ BitVec 32))

(assert (=> mapNonEmpty!51197 (= (arr!40172 (_values!6728 thiss!1559)) (store mapRest!51197 mapKey!51197 mapValue!51197))))

(declare-fun b!1272848 () Bool)

(assert (=> b!1272848 (= e!726107 (and e!726106 mapRes!51197))))

(declare-fun condMapEmpty!51197 () Bool)

(declare-fun mapDefault!51197 () ValueCell!15677)

(assert (=> b!1272848 (= condMapEmpty!51197 (= (arr!40172 (_values!6728 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51197)))))

(declare-fun res!846573 () Bool)

(assert (=> start!107470 (=> (not res!846573) (not e!726108))))

(declare-fun valid!2288 (LongMapFixedSize!6118) Bool)

(assert (=> start!107470 (= res!846573 (valid!2288 thiss!1559))))

(assert (=> start!107470 e!726108))

(assert (=> start!107470 e!726109))

(assert (= (and start!107470 res!846573) b!1272844))

(assert (= (and b!1272844 res!846572) b!1272846))

(assert (= (and b!1272848 condMapEmpty!51197) mapIsEmpty!51197))

(assert (= (and b!1272848 (not condMapEmpty!51197)) mapNonEmpty!51197))

(get-info :version)

(assert (= (and mapNonEmpty!51197 ((_ is ValueCellFull!15677) mapValue!51197)) b!1272843))

(assert (= (and b!1272848 ((_ is ValueCellFull!15677) mapDefault!51197)) b!1272847))

(assert (= b!1272845 b!1272848))

(assert (= start!107470 b!1272845))

(declare-fun m!1169847 () Bool)

(assert (=> b!1272844 m!1169847))

(declare-fun m!1169849 () Bool)

(assert (=> b!1272845 m!1169849))

(declare-fun m!1169851 () Bool)

(assert (=> b!1272845 m!1169851))

(declare-fun m!1169853 () Bool)

(assert (=> mapNonEmpty!51197 m!1169853))

(declare-fun m!1169855 () Bool)

(assert (=> start!107470 m!1169855))

(check-sat b_and!45729 (not b!1272845) (not b_next!27691) (not start!107470) tp_is_empty!33061 (not mapNonEmpty!51197) (not b!1272844))
(check-sat b_and!45729 (not b_next!27691))
(get-model)

(declare-fun d!139815 () Bool)

(declare-fun res!846592 () Bool)

(declare-fun e!726148 () Bool)

(assert (=> d!139815 (=> (not res!846592) (not e!726148))))

(declare-fun simpleValid!460 (LongMapFixedSize!6118) Bool)

(assert (=> d!139815 (= res!846592 (simpleValid!460 thiss!1559))))

(assert (=> d!139815 (= (valid!2288 thiss!1559) e!726148)))

(declare-fun b!1272891 () Bool)

(declare-fun res!846593 () Bool)

(assert (=> b!1272891 (=> (not res!846593) (not e!726148))))

(declare-fun arrayCountValidKeys!0 (array!83285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272891 (= res!846593 (= (arrayCountValidKeys!0 (_keys!12111 thiss!1559) #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))) (_size!3114 thiss!1559)))))

(declare-fun b!1272892 () Bool)

(declare-fun res!846594 () Bool)

(assert (=> b!1272892 (=> (not res!846594) (not e!726148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83285 (_ BitVec 32)) Bool)

(assert (=> b!1272892 (= res!846594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12111 thiss!1559) (mask!34463 thiss!1559)))))

(declare-fun b!1272893 () Bool)

(declare-datatypes ((List!28635 0))(
  ( (Nil!28632) (Cons!28631 (h!29840 (_ BitVec 64)) (t!42160 List!28635)) )
))
(declare-fun arrayNoDuplicates!0 (array!83285 (_ BitVec 32) List!28635) Bool)

(assert (=> b!1272893 (= e!726148 (arrayNoDuplicates!0 (_keys!12111 thiss!1559) #b00000000000000000000000000000000 Nil!28632))))

(assert (= (and d!139815 res!846592) b!1272891))

(assert (= (and b!1272891 res!846593) b!1272892))

(assert (= (and b!1272892 res!846594) b!1272893))

(declare-fun m!1169877 () Bool)

(assert (=> d!139815 m!1169877))

(declare-fun m!1169879 () Bool)

(assert (=> b!1272891 m!1169879))

(declare-fun m!1169881 () Bool)

(assert (=> b!1272892 m!1169881))

(declare-fun m!1169883 () Bool)

(assert (=> b!1272893 m!1169883))

(assert (=> start!107470 d!139815))

(declare-fun d!139817 () Bool)

(assert (=> d!139817 (= (array_inv!30705 (_keys!12111 thiss!1559)) (bvsge (size!40715 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272845 d!139817))

(declare-fun d!139819 () Bool)

(assert (=> d!139819 (= (array_inv!30706 (_values!6728 thiss!1559)) (bvsge (size!40714 (_values!6728 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272845 d!139819))

(declare-fun d!139821 () Bool)

(assert (=> d!139821 (= (validMask!0 (mask!34463 thiss!1559)) (and (or (= (mask!34463 thiss!1559) #b00000000000000000000000000000111) (= (mask!34463 thiss!1559) #b00000000000000000000000000001111) (= (mask!34463 thiss!1559) #b00000000000000000000000000011111) (= (mask!34463 thiss!1559) #b00000000000000000000000000111111) (= (mask!34463 thiss!1559) #b00000000000000000000000001111111) (= (mask!34463 thiss!1559) #b00000000000000000000000011111111) (= (mask!34463 thiss!1559) #b00000000000000000000000111111111) (= (mask!34463 thiss!1559) #b00000000000000000000001111111111) (= (mask!34463 thiss!1559) #b00000000000000000000011111111111) (= (mask!34463 thiss!1559) #b00000000000000000000111111111111) (= (mask!34463 thiss!1559) #b00000000000000000001111111111111) (= (mask!34463 thiss!1559) #b00000000000000000011111111111111) (= (mask!34463 thiss!1559) #b00000000000000000111111111111111) (= (mask!34463 thiss!1559) #b00000000000000001111111111111111) (= (mask!34463 thiss!1559) #b00000000000000011111111111111111) (= (mask!34463 thiss!1559) #b00000000000000111111111111111111) (= (mask!34463 thiss!1559) #b00000000000001111111111111111111) (= (mask!34463 thiss!1559) #b00000000000011111111111111111111) (= (mask!34463 thiss!1559) #b00000000000111111111111111111111) (= (mask!34463 thiss!1559) #b00000000001111111111111111111111) (= (mask!34463 thiss!1559) #b00000000011111111111111111111111) (= (mask!34463 thiss!1559) #b00000000111111111111111111111111) (= (mask!34463 thiss!1559) #b00000001111111111111111111111111) (= (mask!34463 thiss!1559) #b00000011111111111111111111111111) (= (mask!34463 thiss!1559) #b00000111111111111111111111111111) (= (mask!34463 thiss!1559) #b00001111111111111111111111111111) (= (mask!34463 thiss!1559) #b00011111111111111111111111111111) (= (mask!34463 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34463 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272844 d!139821))

(declare-fun mapNonEmpty!51206 () Bool)

(declare-fun mapRes!51206 () Bool)

(declare-fun tp!97620 () Bool)

(declare-fun e!726153 () Bool)

(assert (=> mapNonEmpty!51206 (= mapRes!51206 (and tp!97620 e!726153))))

(declare-fun mapRest!51206 () (Array (_ BitVec 32) ValueCell!15677))

(declare-fun mapKey!51206 () (_ BitVec 32))

(declare-fun mapValue!51206 () ValueCell!15677)

(assert (=> mapNonEmpty!51206 (= mapRest!51197 (store mapRest!51206 mapKey!51206 mapValue!51206))))

(declare-fun condMapEmpty!51206 () Bool)

(declare-fun mapDefault!51206 () ValueCell!15677)

(assert (=> mapNonEmpty!51197 (= condMapEmpty!51206 (= mapRest!51197 ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51206)))))

(declare-fun e!726154 () Bool)

(assert (=> mapNonEmpty!51197 (= tp!97605 (and e!726154 mapRes!51206))))

(declare-fun b!1272901 () Bool)

(assert (=> b!1272901 (= e!726154 tp_is_empty!33061)))

(declare-fun mapIsEmpty!51206 () Bool)

(assert (=> mapIsEmpty!51206 mapRes!51206))

(declare-fun b!1272900 () Bool)

(assert (=> b!1272900 (= e!726153 tp_is_empty!33061)))

(assert (= (and mapNonEmpty!51197 condMapEmpty!51206) mapIsEmpty!51206))

(assert (= (and mapNonEmpty!51197 (not condMapEmpty!51206)) mapNonEmpty!51206))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15677) mapValue!51206)) b!1272900))

(assert (= (and mapNonEmpty!51197 ((_ is ValueCellFull!15677) mapDefault!51206)) b!1272901))

(declare-fun m!1169885 () Bool)

(assert (=> mapNonEmpty!51206 m!1169885))

(check-sat (not b!1272891) b_and!45729 (not b!1272892) (not b!1272893) (not mapNonEmpty!51206) (not b_next!27691) (not d!139815) tp_is_empty!33061)
(check-sat b_and!45729 (not b_next!27691))
(get-model)

(declare-fun b!1272913 () Bool)

(declare-fun e!726157 () Bool)

(assert (=> b!1272913 (= e!726157 (and (bvsge (extraKeys!6384 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6384 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3114 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272911 () Bool)

(declare-fun res!846606 () Bool)

(assert (=> b!1272911 (=> (not res!846606) (not e!726157))))

(declare-fun size!40720 (LongMapFixedSize!6118) (_ BitVec 32))

(assert (=> b!1272911 (= res!846606 (bvsge (size!40720 thiss!1559) (_size!3114 thiss!1559)))))

(declare-fun b!1272910 () Bool)

(declare-fun res!846604 () Bool)

(assert (=> b!1272910 (=> (not res!846604) (not e!726157))))

(assert (=> b!1272910 (= res!846604 (and (= (size!40714 (_values!6728 thiss!1559)) (bvadd (mask!34463 thiss!1559) #b00000000000000000000000000000001)) (= (size!40715 (_keys!12111 thiss!1559)) (size!40714 (_values!6728 thiss!1559))) (bvsge (_size!3114 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3114 thiss!1559) (bvadd (mask!34463 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272912 () Bool)

(declare-fun res!846603 () Bool)

(assert (=> b!1272912 (=> (not res!846603) (not e!726157))))

(assert (=> b!1272912 (= res!846603 (= (size!40720 thiss!1559) (bvadd (_size!3114 thiss!1559) (bvsdiv (bvadd (extraKeys!6384 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!139823 () Bool)

(declare-fun res!846605 () Bool)

(assert (=> d!139823 (=> (not res!846605) (not e!726157))))

(assert (=> d!139823 (= res!846605 (validMask!0 (mask!34463 thiss!1559)))))

(assert (=> d!139823 (= (simpleValid!460 thiss!1559) e!726157)))

(assert (= (and d!139823 res!846605) b!1272910))

(assert (= (and b!1272910 res!846604) b!1272911))

(assert (= (and b!1272911 res!846606) b!1272912))

(assert (= (and b!1272912 res!846603) b!1272913))

(declare-fun m!1169887 () Bool)

(assert (=> b!1272911 m!1169887))

(assert (=> b!1272912 m!1169887))

(assert (=> d!139823 m!1169847))

(assert (=> d!139815 d!139823))

(declare-fun b!1272922 () Bool)

(declare-fun e!726162 () (_ BitVec 32))

(declare-fun call!62557 () (_ BitVec 32))

(assert (=> b!1272922 (= e!726162 (bvadd #b00000000000000000000000000000001 call!62557))))

(declare-fun bm!62554 () Bool)

(assert (=> bm!62554 (= call!62557 (arrayCountValidKeys!0 (_keys!12111 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40715 (_keys!12111 thiss!1559))))))

(declare-fun b!1272923 () Bool)

(assert (=> b!1272923 (= e!726162 call!62557)))

(declare-fun d!139825 () Bool)

(declare-fun lt!574917 () (_ BitVec 32))

(assert (=> d!139825 (and (bvsge lt!574917 #b00000000000000000000000000000000) (bvsle lt!574917 (bvsub (size!40715 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun e!726163 () (_ BitVec 32))

(assert (=> d!139825 (= lt!574917 e!726163)))

(declare-fun c!123722 () Bool)

(assert (=> d!139825 (= c!123722 (bvsge #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))))))

(assert (=> d!139825 (and (bvsle #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40715 (_keys!12111 thiss!1559)) (size!40715 (_keys!12111 thiss!1559))))))

(assert (=> d!139825 (= (arrayCountValidKeys!0 (_keys!12111 thiss!1559) #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))) lt!574917)))

(declare-fun b!1272924 () Bool)

(assert (=> b!1272924 (= e!726163 e!726162)))

(declare-fun c!123721 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272924 (= c!123721 (validKeyInArray!0 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272925 () Bool)

(assert (=> b!1272925 (= e!726163 #b00000000000000000000000000000000)))

(assert (= (and d!139825 c!123722) b!1272925))

(assert (= (and d!139825 (not c!123722)) b!1272924))

(assert (= (and b!1272924 c!123721) b!1272922))

(assert (= (and b!1272924 (not c!123721)) b!1272923))

(assert (= (or b!1272922 b!1272923) bm!62554))

(declare-fun m!1169889 () Bool)

(assert (=> bm!62554 m!1169889))

(declare-fun m!1169891 () Bool)

(assert (=> b!1272924 m!1169891))

(assert (=> b!1272924 m!1169891))

(declare-fun m!1169893 () Bool)

(assert (=> b!1272924 m!1169893))

(assert (=> b!1272891 d!139825))

(declare-fun b!1272934 () Bool)

(declare-fun e!726172 () Bool)

(declare-fun call!62560 () Bool)

(assert (=> b!1272934 (= e!726172 call!62560)))

(declare-fun d!139827 () Bool)

(declare-fun res!846611 () Bool)

(declare-fun e!726170 () Bool)

(assert (=> d!139827 (=> res!846611 e!726170)))

(assert (=> d!139827 (= res!846611 (bvsge #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))))))

(assert (=> d!139827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12111 thiss!1559) (mask!34463 thiss!1559)) e!726170)))

(declare-fun b!1272935 () Bool)

(declare-fun e!726171 () Bool)

(assert (=> b!1272935 (= e!726171 e!726172)))

(declare-fun lt!574924 () (_ BitVec 64))

(assert (=> b!1272935 (= lt!574924 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42172 0))(
  ( (Unit!42173) )
))
(declare-fun lt!574926 () Unit!42172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83285 (_ BitVec 64) (_ BitVec 32)) Unit!42172)

(assert (=> b!1272935 (= lt!574926 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12111 thiss!1559) lt!574924 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272935 (arrayContainsKey!0 (_keys!12111 thiss!1559) lt!574924 #b00000000000000000000000000000000)))

(declare-fun lt!574925 () Unit!42172)

(assert (=> b!1272935 (= lt!574925 lt!574926)))

(declare-fun res!846612 () Bool)

(declare-datatypes ((SeekEntryResult!9992 0))(
  ( (MissingZero!9992 (index!42339 (_ BitVec 32))) (Found!9992 (index!42340 (_ BitVec 32))) (Intermediate!9992 (undefined!10804 Bool) (index!42341 (_ BitVec 32)) (x!112514 (_ BitVec 32))) (Undefined!9992) (MissingVacant!9992 (index!42342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83285 (_ BitVec 32)) SeekEntryResult!9992)

(assert (=> b!1272935 (= res!846612 (= (seekEntryOrOpen!0 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000) (_keys!12111 thiss!1559) (mask!34463 thiss!1559)) (Found!9992 #b00000000000000000000000000000000)))))

(assert (=> b!1272935 (=> (not res!846612) (not e!726172))))

(declare-fun b!1272936 () Bool)

(assert (=> b!1272936 (= e!726171 call!62560)))

(declare-fun b!1272937 () Bool)

(assert (=> b!1272937 (= e!726170 e!726171)))

(declare-fun c!123725 () Bool)

(assert (=> b!1272937 (= c!123725 (validKeyInArray!0 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62557 () Bool)

(assert (=> bm!62557 (= call!62560 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12111 thiss!1559) (mask!34463 thiss!1559)))))

(assert (= (and d!139827 (not res!846611)) b!1272937))

(assert (= (and b!1272937 c!123725) b!1272935))

(assert (= (and b!1272937 (not c!123725)) b!1272936))

(assert (= (and b!1272935 res!846612) b!1272934))

(assert (= (or b!1272934 b!1272936) bm!62557))

(assert (=> b!1272935 m!1169891))

(declare-fun m!1169895 () Bool)

(assert (=> b!1272935 m!1169895))

(declare-fun m!1169897 () Bool)

(assert (=> b!1272935 m!1169897))

(assert (=> b!1272935 m!1169891))

(declare-fun m!1169899 () Bool)

(assert (=> b!1272935 m!1169899))

(assert (=> b!1272937 m!1169891))

(assert (=> b!1272937 m!1169891))

(assert (=> b!1272937 m!1169893))

(declare-fun m!1169901 () Bool)

(assert (=> bm!62557 m!1169901))

(assert (=> b!1272892 d!139827))

(declare-fun b!1272948 () Bool)

(declare-fun e!726182 () Bool)

(declare-fun call!62563 () Bool)

(assert (=> b!1272948 (= e!726182 call!62563)))

(declare-fun bm!62560 () Bool)

(declare-fun c!123728 () Bool)

(assert (=> bm!62560 (= call!62563 (arrayNoDuplicates!0 (_keys!12111 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123728 (Cons!28631 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000) Nil!28632) Nil!28632)))))

(declare-fun d!139829 () Bool)

(declare-fun res!846620 () Bool)

(declare-fun e!726183 () Bool)

(assert (=> d!139829 (=> res!846620 e!726183)))

(assert (=> d!139829 (= res!846620 (bvsge #b00000000000000000000000000000000 (size!40715 (_keys!12111 thiss!1559))))))

(assert (=> d!139829 (= (arrayNoDuplicates!0 (_keys!12111 thiss!1559) #b00000000000000000000000000000000 Nil!28632) e!726183)))

(declare-fun b!1272949 () Bool)

(declare-fun e!726181 () Bool)

(assert (=> b!1272949 (= e!726183 e!726181)))

(declare-fun res!846621 () Bool)

(assert (=> b!1272949 (=> (not res!846621) (not e!726181))))

(declare-fun e!726184 () Bool)

(assert (=> b!1272949 (= res!846621 (not e!726184))))

(declare-fun res!846619 () Bool)

(assert (=> b!1272949 (=> (not res!846619) (not e!726184))))

(assert (=> b!1272949 (= res!846619 (validKeyInArray!0 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272950 () Bool)

(declare-fun contains!7641 (List!28635 (_ BitVec 64)) Bool)

(assert (=> b!1272950 (= e!726184 (contains!7641 Nil!28632 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272951 () Bool)

(assert (=> b!1272951 (= e!726182 call!62563)))

(declare-fun b!1272952 () Bool)

(assert (=> b!1272952 (= e!726181 e!726182)))

(assert (=> b!1272952 (= c!123728 (validKeyInArray!0 (select (arr!40173 (_keys!12111 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139829 (not res!846620)) b!1272949))

(assert (= (and b!1272949 res!846619) b!1272950))

(assert (= (and b!1272949 res!846621) b!1272952))

(assert (= (and b!1272952 c!123728) b!1272951))

(assert (= (and b!1272952 (not c!123728)) b!1272948))

(assert (= (or b!1272951 b!1272948) bm!62560))

(assert (=> bm!62560 m!1169891))

(declare-fun m!1169903 () Bool)

(assert (=> bm!62560 m!1169903))

(assert (=> b!1272949 m!1169891))

(assert (=> b!1272949 m!1169891))

(assert (=> b!1272949 m!1169893))

(assert (=> b!1272950 m!1169891))

(assert (=> b!1272950 m!1169891))

(declare-fun m!1169905 () Bool)

(assert (=> b!1272950 m!1169905))

(assert (=> b!1272952 m!1169891))

(assert (=> b!1272952 m!1169891))

(assert (=> b!1272952 m!1169893))

(assert (=> b!1272893 d!139829))

(declare-fun mapNonEmpty!51207 () Bool)

(declare-fun mapRes!51207 () Bool)

(declare-fun tp!97621 () Bool)

(declare-fun e!726185 () Bool)

(assert (=> mapNonEmpty!51207 (= mapRes!51207 (and tp!97621 e!726185))))

(declare-fun mapRest!51207 () (Array (_ BitVec 32) ValueCell!15677))

(declare-fun mapKey!51207 () (_ BitVec 32))

(declare-fun mapValue!51207 () ValueCell!15677)

(assert (=> mapNonEmpty!51207 (= mapRest!51206 (store mapRest!51207 mapKey!51207 mapValue!51207))))

(declare-fun condMapEmpty!51207 () Bool)

(declare-fun mapDefault!51207 () ValueCell!15677)

(assert (=> mapNonEmpty!51206 (= condMapEmpty!51207 (= mapRest!51206 ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51207)))))

(declare-fun e!726186 () Bool)

(assert (=> mapNonEmpty!51206 (= tp!97620 (and e!726186 mapRes!51207))))

(declare-fun b!1272954 () Bool)

(assert (=> b!1272954 (= e!726186 tp_is_empty!33061)))

(declare-fun mapIsEmpty!51207 () Bool)

(assert (=> mapIsEmpty!51207 mapRes!51207))

(declare-fun b!1272953 () Bool)

(assert (=> b!1272953 (= e!726185 tp_is_empty!33061)))

(assert (= (and mapNonEmpty!51206 condMapEmpty!51207) mapIsEmpty!51207))

(assert (= (and mapNonEmpty!51206 (not condMapEmpty!51207)) mapNonEmpty!51207))

(assert (= (and mapNonEmpty!51207 ((_ is ValueCellFull!15677) mapValue!51207)) b!1272953))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15677) mapDefault!51207)) b!1272954))

(declare-fun m!1169907 () Bool)

(assert (=> mapNonEmpty!51207 m!1169907))

(check-sat (not b!1272924) (not bm!62557) (not b!1272912) (not b!1272949) (not bm!62560) (not b!1272935) (not d!139823) b_and!45729 (not b!1272950) tp_is_empty!33061 (not bm!62554) (not b!1272911) (not mapNonEmpty!51207) (not b!1272952) (not b!1272937) (not b_next!27691))
(check-sat b_and!45729 (not b_next!27691))
