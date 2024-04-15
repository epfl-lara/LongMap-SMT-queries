; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107434 () Bool)

(assert start!107434)

(declare-fun b!1272653 () Bool)

(declare-fun b_free!27679 () Bool)

(declare-fun b_next!27679 () Bool)

(assert (=> b!1272653 (= b_free!27679 (not b_next!27679))))

(declare-fun tp!97562 () Bool)

(declare-fun b_and!45717 () Bool)

(assert (=> b!1272653 (= tp!97562 b_and!45717)))

(declare-fun b!1272648 () Bool)

(declare-fun e!725946 () Bool)

(declare-fun tp_is_empty!33049 () Bool)

(assert (=> b!1272648 (= e!725946 tp_is_empty!33049)))

(declare-fun res!846491 () Bool)

(declare-fun e!725949 () Bool)

(assert (=> start!107434 (=> (not res!846491) (not e!725949))))

(declare-datatypes ((V!49259 0))(
  ( (V!49260 (val!16599 Int)) )
))
(declare-datatypes ((ValueCell!15671 0))(
  ( (ValueCellFull!15671 (v!19235 V!49259)) (EmptyCell!15671) )
))
(declare-datatypes ((array!83255 0))(
  ( (array!83256 (arr!40160 (Array (_ BitVec 32) ValueCell!15671)) (size!40701 (_ BitVec 32))) )
))
(declare-datatypes ((array!83257 0))(
  ( (array!83258 (arr!40161 (Array (_ BitVec 32) (_ BitVec 64))) (size!40702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6106 0))(
  ( (LongMapFixedSize!6107 (defaultEntry!6699 Int) (mask!34450 (_ BitVec 32)) (extraKeys!6378 (_ BitVec 32)) (zeroValue!6484 V!49259) (minValue!6484 V!49259) (_size!3108 (_ BitVec 32)) (_keys!12104 array!83257) (_values!6722 array!83255) (_vacant!3108 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6106)

(declare-fun valid!2284 (LongMapFixedSize!6106) Bool)

(assert (=> start!107434 (= res!846491 (valid!2284 thiss!1559))))

(assert (=> start!107434 e!725949))

(declare-fun e!725948 () Bool)

(assert (=> start!107434 e!725948))

(declare-fun b!1272649 () Bool)

(declare-fun e!725950 () Bool)

(declare-fun mapRes!51172 () Bool)

(assert (=> b!1272649 (= e!725950 (and e!725946 mapRes!51172))))

(declare-fun condMapEmpty!51172 () Bool)

(declare-fun mapDefault!51172 () ValueCell!15671)

(assert (=> b!1272649 (= condMapEmpty!51172 (= (arr!40160 (_values!6722 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15671)) mapDefault!51172)))))

(declare-fun b!1272650 () Bool)

(declare-fun res!846492 () Bool)

(assert (=> b!1272650 (=> (not res!846492) (not e!725949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272650 (= res!846492 (validMask!0 (mask!34450 thiss!1559)))))

(declare-fun b!1272651 () Bool)

(declare-fun e!725947 () Bool)

(assert (=> b!1272651 (= e!725947 tp_is_empty!33049)))

(declare-fun b!1272652 () Bool)

(assert (=> b!1272652 (= e!725949 (and (= (size!40701 (_values!6722 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34450 thiss!1559))) (= (size!40702 (_keys!12104 thiss!1559)) (size!40701 (_values!6722 thiss!1559))) (bvslt (mask!34450 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun array_inv!30697 (array!83257) Bool)

(declare-fun array_inv!30698 (array!83255) Bool)

(assert (=> b!1272653 (= e!725948 (and tp!97562 tp_is_empty!33049 (array_inv!30697 (_keys!12104 thiss!1559)) (array_inv!30698 (_values!6722 thiss!1559)) e!725950))))

(declare-fun mapNonEmpty!51172 () Bool)

(declare-fun tp!97561 () Bool)

(assert (=> mapNonEmpty!51172 (= mapRes!51172 (and tp!97561 e!725947))))

(declare-fun mapValue!51172 () ValueCell!15671)

(declare-fun mapKey!51172 () (_ BitVec 32))

(declare-fun mapRest!51172 () (Array (_ BitVec 32) ValueCell!15671))

(assert (=> mapNonEmpty!51172 (= (arr!40160 (_values!6722 thiss!1559)) (store mapRest!51172 mapKey!51172 mapValue!51172))))

(declare-fun mapIsEmpty!51172 () Bool)

(assert (=> mapIsEmpty!51172 mapRes!51172))

(assert (= (and start!107434 res!846491) b!1272650))

(assert (= (and b!1272650 res!846492) b!1272652))

(assert (= (and b!1272649 condMapEmpty!51172) mapIsEmpty!51172))

(assert (= (and b!1272649 (not condMapEmpty!51172)) mapNonEmpty!51172))

(get-info :version)

(assert (= (and mapNonEmpty!51172 ((_ is ValueCellFull!15671) mapValue!51172)) b!1272651))

(assert (= (and b!1272649 ((_ is ValueCellFull!15671) mapDefault!51172)) b!1272648))

(assert (= b!1272653 b!1272649))

(assert (= start!107434 b!1272653))

(declare-fun m!1169745 () Bool)

(assert (=> start!107434 m!1169745))

(declare-fun m!1169747 () Bool)

(assert (=> b!1272650 m!1169747))

(declare-fun m!1169749 () Bool)

(assert (=> b!1272653 m!1169749))

(declare-fun m!1169751 () Bool)

(assert (=> b!1272653 m!1169751))

(declare-fun m!1169753 () Bool)

(assert (=> mapNonEmpty!51172 m!1169753))

(check-sat (not b!1272650) tp_is_empty!33049 (not mapNonEmpty!51172) (not b!1272653) (not b_next!27679) b_and!45717 (not start!107434))
(check-sat b_and!45717 (not b_next!27679))
(get-model)

(declare-fun d!139787 () Bool)

(assert (=> d!139787 (= (array_inv!30697 (_keys!12104 thiss!1559)) (bvsge (size!40702 (_keys!12104 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272653 d!139787))

(declare-fun d!139789 () Bool)

(assert (=> d!139789 (= (array_inv!30698 (_values!6722 thiss!1559)) (bvsge (size!40701 (_values!6722 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272653 d!139789))

(declare-fun d!139791 () Bool)

(declare-fun res!846511 () Bool)

(declare-fun e!725990 () Bool)

(assert (=> d!139791 (=> (not res!846511) (not e!725990))))

(declare-fun simpleValid!458 (LongMapFixedSize!6106) Bool)

(assert (=> d!139791 (= res!846511 (simpleValid!458 thiss!1559))))

(assert (=> d!139791 (= (valid!2284 thiss!1559) e!725990)))

(declare-fun b!1272696 () Bool)

(declare-fun res!846512 () Bool)

(assert (=> b!1272696 (=> (not res!846512) (not e!725990))))

(declare-fun arrayCountValidKeys!0 (array!83257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272696 (= res!846512 (= (arrayCountValidKeys!0 (_keys!12104 thiss!1559) #b00000000000000000000000000000000 (size!40702 (_keys!12104 thiss!1559))) (_size!3108 thiss!1559)))))

(declare-fun b!1272697 () Bool)

(declare-fun res!846513 () Bool)

(assert (=> b!1272697 (=> (not res!846513) (not e!725990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83257 (_ BitVec 32)) Bool)

(assert (=> b!1272697 (= res!846513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12104 thiss!1559) (mask!34450 thiss!1559)))))

(declare-fun b!1272698 () Bool)

(declare-datatypes ((List!28633 0))(
  ( (Nil!28630) (Cons!28629 (h!29838 (_ BitVec 64)) (t!42158 List!28633)) )
))
(declare-fun arrayNoDuplicates!0 (array!83257 (_ BitVec 32) List!28633) Bool)

(assert (=> b!1272698 (= e!725990 (arrayNoDuplicates!0 (_keys!12104 thiss!1559) #b00000000000000000000000000000000 Nil!28630))))

(assert (= (and d!139791 res!846511) b!1272696))

(assert (= (and b!1272696 res!846512) b!1272697))

(assert (= (and b!1272697 res!846513) b!1272698))

(declare-fun m!1169775 () Bool)

(assert (=> d!139791 m!1169775))

(declare-fun m!1169777 () Bool)

(assert (=> b!1272696 m!1169777))

(declare-fun m!1169779 () Bool)

(assert (=> b!1272697 m!1169779))

(declare-fun m!1169781 () Bool)

(assert (=> b!1272698 m!1169781))

(assert (=> start!107434 d!139791))

(declare-fun d!139793 () Bool)

(assert (=> d!139793 (= (validMask!0 (mask!34450 thiss!1559)) (and (or (= (mask!34450 thiss!1559) #b00000000000000000000000000000111) (= (mask!34450 thiss!1559) #b00000000000000000000000000001111) (= (mask!34450 thiss!1559) #b00000000000000000000000000011111) (= (mask!34450 thiss!1559) #b00000000000000000000000000111111) (= (mask!34450 thiss!1559) #b00000000000000000000000001111111) (= (mask!34450 thiss!1559) #b00000000000000000000000011111111) (= (mask!34450 thiss!1559) #b00000000000000000000000111111111) (= (mask!34450 thiss!1559) #b00000000000000000000001111111111) (= (mask!34450 thiss!1559) #b00000000000000000000011111111111) (= (mask!34450 thiss!1559) #b00000000000000000000111111111111) (= (mask!34450 thiss!1559) #b00000000000000000001111111111111) (= (mask!34450 thiss!1559) #b00000000000000000011111111111111) (= (mask!34450 thiss!1559) #b00000000000000000111111111111111) (= (mask!34450 thiss!1559) #b00000000000000001111111111111111) (= (mask!34450 thiss!1559) #b00000000000000011111111111111111) (= (mask!34450 thiss!1559) #b00000000000000111111111111111111) (= (mask!34450 thiss!1559) #b00000000000001111111111111111111) (= (mask!34450 thiss!1559) #b00000000000011111111111111111111) (= (mask!34450 thiss!1559) #b00000000000111111111111111111111) (= (mask!34450 thiss!1559) #b00000000001111111111111111111111) (= (mask!34450 thiss!1559) #b00000000011111111111111111111111) (= (mask!34450 thiss!1559) #b00000000111111111111111111111111) (= (mask!34450 thiss!1559) #b00000001111111111111111111111111) (= (mask!34450 thiss!1559) #b00000011111111111111111111111111) (= (mask!34450 thiss!1559) #b00000111111111111111111111111111) (= (mask!34450 thiss!1559) #b00001111111111111111111111111111) (= (mask!34450 thiss!1559) #b00011111111111111111111111111111) (= (mask!34450 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34450 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272650 d!139793))

(declare-fun mapNonEmpty!51181 () Bool)

(declare-fun mapRes!51181 () Bool)

(declare-fun tp!97577 () Bool)

(declare-fun e!725996 () Bool)

(assert (=> mapNonEmpty!51181 (= mapRes!51181 (and tp!97577 e!725996))))

(declare-fun mapKey!51181 () (_ BitVec 32))

(declare-fun mapValue!51181 () ValueCell!15671)

(declare-fun mapRest!51181 () (Array (_ BitVec 32) ValueCell!15671))

(assert (=> mapNonEmpty!51181 (= mapRest!51172 (store mapRest!51181 mapKey!51181 mapValue!51181))))

(declare-fun b!1272705 () Bool)

(assert (=> b!1272705 (= e!725996 tp_is_empty!33049)))

(declare-fun mapIsEmpty!51181 () Bool)

(assert (=> mapIsEmpty!51181 mapRes!51181))

(declare-fun condMapEmpty!51181 () Bool)

(declare-fun mapDefault!51181 () ValueCell!15671)

(assert (=> mapNonEmpty!51172 (= condMapEmpty!51181 (= mapRest!51172 ((as const (Array (_ BitVec 32) ValueCell!15671)) mapDefault!51181)))))

(declare-fun e!725995 () Bool)

(assert (=> mapNonEmpty!51172 (= tp!97561 (and e!725995 mapRes!51181))))

(declare-fun b!1272706 () Bool)

(assert (=> b!1272706 (= e!725995 tp_is_empty!33049)))

(assert (= (and mapNonEmpty!51172 condMapEmpty!51181) mapIsEmpty!51181))

(assert (= (and mapNonEmpty!51172 (not condMapEmpty!51181)) mapNonEmpty!51181))

(assert (= (and mapNonEmpty!51181 ((_ is ValueCellFull!15671) mapValue!51181)) b!1272705))

(assert (= (and mapNonEmpty!51172 ((_ is ValueCellFull!15671) mapDefault!51181)) b!1272706))

(declare-fun m!1169783 () Bool)

(assert (=> mapNonEmpty!51181 m!1169783))

(check-sat (not b!1272697) (not b_next!27679) (not mapNonEmpty!51181) (not b!1272698) tp_is_empty!33049 (not b!1272696) (not d!139791) b_and!45717)
(check-sat b_and!45717 (not b_next!27679))
