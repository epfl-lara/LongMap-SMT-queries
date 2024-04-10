; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107612 () Bool)

(assert start!107612)

(declare-fun b!1273745 () Bool)

(declare-fun b_free!27747 () Bool)

(declare-fun b_next!27747 () Bool)

(assert (=> b!1273745 (= b_free!27747 (not b_next!27747))))

(declare-fun tp!97798 () Bool)

(declare-fun b_and!45803 () Bool)

(assert (=> b!1273745 (= tp!97798 b_and!45803)))

(declare-fun e!726811 () Bool)

(declare-fun e!726806 () Bool)

(declare-datatypes ((V!49349 0))(
  ( (V!49350 (val!16633 Int)) )
))
(declare-datatypes ((ValueCell!15705 0))(
  ( (ValueCellFull!15705 (v!19270 V!49349)) (EmptyCell!15705) )
))
(declare-datatypes ((array!83512 0))(
  ( (array!83513 (arr!40278 (Array (_ BitVec 32) ValueCell!15705)) (size!40823 (_ BitVec 32))) )
))
(declare-datatypes ((array!83514 0))(
  ( (array!83515 (arr!40279 (Array (_ BitVec 32) (_ BitVec 64))) (size!40824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6174 0))(
  ( (LongMapFixedSize!6175 (defaultEntry!6733 Int) (mask!34525 (_ BitVec 32)) (extraKeys!6412 (_ BitVec 32)) (zeroValue!6518 V!49349) (minValue!6518 V!49349) (_size!3142 (_ BitVec 32)) (_keys!12147 array!83514) (_values!6756 array!83512) (_vacant!3142 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6174)

(declare-fun tp_is_empty!33117 () Bool)

(declare-fun array_inv!30619 (array!83514) Bool)

(declare-fun array_inv!30620 (array!83512) Bool)

(assert (=> b!1273745 (= e!726811 (and tp!97798 tp_is_empty!33117 (array_inv!30619 (_keys!12147 thiss!1551)) (array_inv!30620 (_values!6756 thiss!1551)) e!726806))))

(declare-fun b!1273746 () Bool)

(declare-fun res!846957 () Bool)

(declare-fun e!726807 () Bool)

(assert (=> b!1273746 (=> (not res!846957) (not e!726807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273746 (= res!846957 (validMask!0 (mask!34525 thiss!1551)))))

(declare-fun b!1273747 () Bool)

(declare-fun e!726808 () Bool)

(declare-fun mapRes!51307 () Bool)

(assert (=> b!1273747 (= e!726806 (and e!726808 mapRes!51307))))

(declare-fun condMapEmpty!51307 () Bool)

(declare-fun mapDefault!51307 () ValueCell!15705)

(assert (=> b!1273747 (= condMapEmpty!51307 (= (arr!40278 (_values!6756 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15705)) mapDefault!51307)))))

(declare-fun b!1273748 () Bool)

(assert (=> b!1273748 (= e!726807 (and (= (size!40824 (_keys!12147 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34525 thiss!1551))) (bvsgt #b00000000000000000000000000000000 (size!40824 (_keys!12147 thiss!1551)))))))

(declare-fun mapIsEmpty!51307 () Bool)

(assert (=> mapIsEmpty!51307 mapRes!51307))

(declare-fun b!1273750 () Bool)

(declare-fun res!846955 () Bool)

(assert (=> b!1273750 (=> (not res!846955) (not e!726807))))

(declare-fun arrayCountValidKeys!0 (array!83514 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273750 (= res!846955 (= (arrayCountValidKeys!0 (_keys!12147 thiss!1551) #b00000000000000000000000000000000 (size!40824 (_keys!12147 thiss!1551))) (_size!3142 thiss!1551)))))

(declare-fun b!1273751 () Bool)

(declare-fun e!726810 () Bool)

(assert (=> b!1273751 (= e!726810 tp_is_empty!33117)))

(declare-fun mapNonEmpty!51307 () Bool)

(declare-fun tp!97797 () Bool)

(assert (=> mapNonEmpty!51307 (= mapRes!51307 (and tp!97797 e!726810))))

(declare-fun mapValue!51307 () ValueCell!15705)

(declare-fun mapKey!51307 () (_ BitVec 32))

(declare-fun mapRest!51307 () (Array (_ BitVec 32) ValueCell!15705))

(assert (=> mapNonEmpty!51307 (= (arr!40278 (_values!6756 thiss!1551)) (store mapRest!51307 mapKey!51307 mapValue!51307))))

(declare-fun b!1273749 () Bool)

(assert (=> b!1273749 (= e!726808 tp_is_empty!33117)))

(declare-fun res!846956 () Bool)

(assert (=> start!107612 (=> (not res!846956) (not e!726807))))

(declare-fun simpleValid!475 (LongMapFixedSize!6174) Bool)

(assert (=> start!107612 (= res!846956 (simpleValid!475 thiss!1551))))

(assert (=> start!107612 e!726807))

(assert (=> start!107612 e!726811))

(assert (= (and start!107612 res!846956) b!1273750))

(assert (= (and b!1273750 res!846955) b!1273746))

(assert (= (and b!1273746 res!846957) b!1273748))

(assert (= (and b!1273747 condMapEmpty!51307) mapIsEmpty!51307))

(assert (= (and b!1273747 (not condMapEmpty!51307)) mapNonEmpty!51307))

(get-info :version)

(assert (= (and mapNonEmpty!51307 ((_ is ValueCellFull!15705) mapValue!51307)) b!1273751))

(assert (= (and b!1273747 ((_ is ValueCellFull!15705) mapDefault!51307)) b!1273749))

(assert (= b!1273745 b!1273747))

(assert (= start!107612 b!1273745))

(declare-fun m!1170789 () Bool)

(assert (=> b!1273750 m!1170789))

(declare-fun m!1170791 () Bool)

(assert (=> start!107612 m!1170791))

(declare-fun m!1170793 () Bool)

(assert (=> mapNonEmpty!51307 m!1170793))

(declare-fun m!1170795 () Bool)

(assert (=> b!1273746 m!1170795))

(declare-fun m!1170797 () Bool)

(assert (=> b!1273745 m!1170797))

(declare-fun m!1170799 () Bool)

(assert (=> b!1273745 m!1170799))

(check-sat (not b_next!27747) (not b!1273750) (not mapNonEmpty!51307) tp_is_empty!33117 (not b!1273746) b_and!45803 (not start!107612) (not b!1273745))
(check-sat b_and!45803 (not b_next!27747))
(get-model)

(declare-fun d!140031 () Bool)

(assert (=> d!140031 (= (validMask!0 (mask!34525 thiss!1551)) (and (or (= (mask!34525 thiss!1551) #b00000000000000000000000000000111) (= (mask!34525 thiss!1551) #b00000000000000000000000000001111) (= (mask!34525 thiss!1551) #b00000000000000000000000000011111) (= (mask!34525 thiss!1551) #b00000000000000000000000000111111) (= (mask!34525 thiss!1551) #b00000000000000000000000001111111) (= (mask!34525 thiss!1551) #b00000000000000000000000011111111) (= (mask!34525 thiss!1551) #b00000000000000000000000111111111) (= (mask!34525 thiss!1551) #b00000000000000000000001111111111) (= (mask!34525 thiss!1551) #b00000000000000000000011111111111) (= (mask!34525 thiss!1551) #b00000000000000000000111111111111) (= (mask!34525 thiss!1551) #b00000000000000000001111111111111) (= (mask!34525 thiss!1551) #b00000000000000000011111111111111) (= (mask!34525 thiss!1551) #b00000000000000000111111111111111) (= (mask!34525 thiss!1551) #b00000000000000001111111111111111) (= (mask!34525 thiss!1551) #b00000000000000011111111111111111) (= (mask!34525 thiss!1551) #b00000000000000111111111111111111) (= (mask!34525 thiss!1551) #b00000000000001111111111111111111) (= (mask!34525 thiss!1551) #b00000000000011111111111111111111) (= (mask!34525 thiss!1551) #b00000000000111111111111111111111) (= (mask!34525 thiss!1551) #b00000000001111111111111111111111) (= (mask!34525 thiss!1551) #b00000000011111111111111111111111) (= (mask!34525 thiss!1551) #b00000000111111111111111111111111) (= (mask!34525 thiss!1551) #b00000001111111111111111111111111) (= (mask!34525 thiss!1551) #b00000011111111111111111111111111) (= (mask!34525 thiss!1551) #b00000111111111111111111111111111) (= (mask!34525 thiss!1551) #b00001111111111111111111111111111) (= (mask!34525 thiss!1551) #b00011111111111111111111111111111) (= (mask!34525 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34525 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273746 d!140031))

(declare-fun b!1273781 () Bool)

(declare-fun e!726835 () (_ BitVec 32))

(declare-fun e!726834 () (_ BitVec 32))

(assert (=> b!1273781 (= e!726835 e!726834)))

(declare-fun c!123776 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273781 (= c!123776 (validKeyInArray!0 (select (arr!40279 (_keys!12147 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273782 () Bool)

(declare-fun call!62606 () (_ BitVec 32))

(assert (=> b!1273782 (= e!726834 (bvadd #b00000000000000000000000000000001 call!62606))))

(declare-fun b!1273783 () Bool)

(assert (=> b!1273783 (= e!726834 call!62606)))

(declare-fun d!140033 () Bool)

(declare-fun lt!575149 () (_ BitVec 32))

(assert (=> d!140033 (and (bvsge lt!575149 #b00000000000000000000000000000000) (bvsle lt!575149 (bvsub (size!40824 (_keys!12147 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140033 (= lt!575149 e!726835)))

(declare-fun c!123777 () Bool)

(assert (=> d!140033 (= c!123777 (bvsge #b00000000000000000000000000000000 (size!40824 (_keys!12147 thiss!1551))))))

(assert (=> d!140033 (and (bvsle #b00000000000000000000000000000000 (size!40824 (_keys!12147 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40824 (_keys!12147 thiss!1551)) (size!40824 (_keys!12147 thiss!1551))))))

(assert (=> d!140033 (= (arrayCountValidKeys!0 (_keys!12147 thiss!1551) #b00000000000000000000000000000000 (size!40824 (_keys!12147 thiss!1551))) lt!575149)))

(declare-fun b!1273784 () Bool)

(assert (=> b!1273784 (= e!726835 #b00000000000000000000000000000000)))

(declare-fun bm!62603 () Bool)

(assert (=> bm!62603 (= call!62606 (arrayCountValidKeys!0 (_keys!12147 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40824 (_keys!12147 thiss!1551))))))

(assert (= (and d!140033 c!123777) b!1273784))

(assert (= (and d!140033 (not c!123777)) b!1273781))

(assert (= (and b!1273781 c!123776) b!1273782))

(assert (= (and b!1273781 (not c!123776)) b!1273783))

(assert (= (or b!1273782 b!1273783) bm!62603))

(declare-fun m!1170813 () Bool)

(assert (=> b!1273781 m!1170813))

(assert (=> b!1273781 m!1170813))

(declare-fun m!1170815 () Bool)

(assert (=> b!1273781 m!1170815))

(declare-fun m!1170817 () Bool)

(assert (=> bm!62603 m!1170817))

(assert (=> b!1273750 d!140033))

(declare-fun d!140035 () Bool)

(assert (=> d!140035 (= (array_inv!30619 (_keys!12147 thiss!1551)) (bvsge (size!40824 (_keys!12147 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273745 d!140035))

(declare-fun d!140037 () Bool)

(assert (=> d!140037 (= (array_inv!30620 (_values!6756 thiss!1551)) (bvsge (size!40823 (_values!6756 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273745 d!140037))

(declare-fun d!140039 () Bool)

(declare-fun res!846978 () Bool)

(declare-fun e!726838 () Bool)

(assert (=> d!140039 (=> (not res!846978) (not e!726838))))

(assert (=> d!140039 (= res!846978 (validMask!0 (mask!34525 thiss!1551)))))

(assert (=> d!140039 (= (simpleValid!475 thiss!1551) e!726838)))

(declare-fun b!1273794 () Bool)

(declare-fun res!846977 () Bool)

(assert (=> b!1273794 (=> (not res!846977) (not e!726838))))

(declare-fun size!40827 (LongMapFixedSize!6174) (_ BitVec 32))

(assert (=> b!1273794 (= res!846977 (bvsge (size!40827 thiss!1551) (_size!3142 thiss!1551)))))

(declare-fun b!1273795 () Bool)

(declare-fun res!846976 () Bool)

(assert (=> b!1273795 (=> (not res!846976) (not e!726838))))

(assert (=> b!1273795 (= res!846976 (= (size!40827 thiss!1551) (bvadd (_size!3142 thiss!1551) (bvsdiv (bvadd (extraKeys!6412 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273796 () Bool)

(assert (=> b!1273796 (= e!726838 (and (bvsge (extraKeys!6412 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6412 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3142 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273793 () Bool)

(declare-fun res!846975 () Bool)

(assert (=> b!1273793 (=> (not res!846975) (not e!726838))))

(assert (=> b!1273793 (= res!846975 (and (= (size!40823 (_values!6756 thiss!1551)) (bvadd (mask!34525 thiss!1551) #b00000000000000000000000000000001)) (= (size!40824 (_keys!12147 thiss!1551)) (size!40823 (_values!6756 thiss!1551))) (bvsge (_size!3142 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3142 thiss!1551) (bvadd (mask!34525 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140039 res!846978) b!1273793))

(assert (= (and b!1273793 res!846975) b!1273794))

(assert (= (and b!1273794 res!846977) b!1273795))

(assert (= (and b!1273795 res!846976) b!1273796))

(assert (=> d!140039 m!1170795))

(declare-fun m!1170819 () Bool)

(assert (=> b!1273794 m!1170819))

(assert (=> b!1273795 m!1170819))

(assert (=> start!107612 d!140039))

(declare-fun b!1273803 () Bool)

(declare-fun e!726843 () Bool)

(assert (=> b!1273803 (= e!726843 tp_is_empty!33117)))

(declare-fun condMapEmpty!51313 () Bool)

(declare-fun mapDefault!51313 () ValueCell!15705)

(assert (=> mapNonEmpty!51307 (= condMapEmpty!51313 (= mapRest!51307 ((as const (Array (_ BitVec 32) ValueCell!15705)) mapDefault!51313)))))

(declare-fun e!726844 () Bool)

(declare-fun mapRes!51313 () Bool)

(assert (=> mapNonEmpty!51307 (= tp!97797 (and e!726844 mapRes!51313))))

(declare-fun mapIsEmpty!51313 () Bool)

(assert (=> mapIsEmpty!51313 mapRes!51313))

(declare-fun b!1273804 () Bool)

(assert (=> b!1273804 (= e!726844 tp_is_empty!33117)))

(declare-fun mapNonEmpty!51313 () Bool)

(declare-fun tp!97807 () Bool)

(assert (=> mapNonEmpty!51313 (= mapRes!51313 (and tp!97807 e!726843))))

(declare-fun mapKey!51313 () (_ BitVec 32))

(declare-fun mapRest!51313 () (Array (_ BitVec 32) ValueCell!15705))

(declare-fun mapValue!51313 () ValueCell!15705)

(assert (=> mapNonEmpty!51313 (= mapRest!51307 (store mapRest!51313 mapKey!51313 mapValue!51313))))

(assert (= (and mapNonEmpty!51307 condMapEmpty!51313) mapIsEmpty!51313))

(assert (= (and mapNonEmpty!51307 (not condMapEmpty!51313)) mapNonEmpty!51313))

(assert (= (and mapNonEmpty!51313 ((_ is ValueCellFull!15705) mapValue!51313)) b!1273803))

(assert (= (and mapNonEmpty!51307 ((_ is ValueCellFull!15705) mapDefault!51313)) b!1273804))

(declare-fun m!1170821 () Bool)

(assert (=> mapNonEmpty!51313 m!1170821))

(check-sat (not b!1273795) (not b_next!27747) (not bm!62603) (not d!140039) tp_is_empty!33117 b_and!45803 (not b!1273781) (not b!1273794) (not mapNonEmpty!51313))
(check-sat b_and!45803 (not b_next!27747))
