; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107436 () Bool)

(assert start!107436)

(declare-fun b!1272731 () Bool)

(declare-fun b_free!27681 () Bool)

(declare-fun b_next!27681 () Bool)

(assert (=> b!1272731 (= b_free!27681 (not b_next!27681))))

(declare-fun tp!97567 () Bool)

(declare-fun b_and!45737 () Bool)

(assert (=> b!1272731 (= tp!97567 b_and!45737)))

(declare-fun b!1272730 () Bool)

(declare-fun e!725994 () Bool)

(declare-fun tp_is_empty!33051 () Bool)

(assert (=> b!1272730 (= e!725994 tp_is_empty!33051)))

(declare-fun e!725996 () Bool)

(declare-datatypes ((V!49261 0))(
  ( (V!49262 (val!16600 Int)) )
))
(declare-datatypes ((ValueCell!15672 0))(
  ( (ValueCellFull!15672 (v!19237 V!49261)) (EmptyCell!15672) )
))
(declare-datatypes ((array!83360 0))(
  ( (array!83361 (arr!40212 (Array (_ BitVec 32) ValueCell!15672)) (size!40751 (_ BitVec 32))) )
))
(declare-datatypes ((array!83362 0))(
  ( (array!83363 (arr!40213 (Array (_ BitVec 32) (_ BitVec 64))) (size!40752 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6108 0))(
  ( (LongMapFixedSize!6109 (defaultEntry!6700 Int) (mask!34456 (_ BitVec 32)) (extraKeys!6379 (_ BitVec 32)) (zeroValue!6485 V!49261) (minValue!6485 V!49261) (_size!3109 (_ BitVec 32)) (_keys!12109 array!83362) (_values!6723 array!83360) (_vacant!3109 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6108)

(declare-fun e!725995 () Bool)

(declare-fun array_inv!30583 (array!83362) Bool)

(declare-fun array_inv!30584 (array!83360) Bool)

(assert (=> b!1272731 (= e!725996 (and tp!97567 tp_is_empty!33051 (array_inv!30583 (_keys!12109 thiss!1559)) (array_inv!30584 (_values!6723 thiss!1559)) e!725995))))

(declare-fun mapIsEmpty!51175 () Bool)

(declare-fun mapRes!51175 () Bool)

(assert (=> mapIsEmpty!51175 mapRes!51175))

(declare-fun res!846525 () Bool)

(declare-fun e!725997 () Bool)

(assert (=> start!107436 (=> (not res!846525) (not e!725997))))

(declare-fun valid!2292 (LongMapFixedSize!6108) Bool)

(assert (=> start!107436 (= res!846525 (valid!2292 thiss!1559))))

(assert (=> start!107436 e!725997))

(assert (=> start!107436 e!725996))

(declare-fun b!1272732 () Bool)

(declare-fun e!725998 () Bool)

(assert (=> b!1272732 (= e!725998 tp_is_empty!33051)))

(declare-fun b!1272733 () Bool)

(assert (=> b!1272733 (= e!725997 (and (= (size!40751 (_values!6723 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34456 thiss!1559))) (= (size!40752 (_keys!12109 thiss!1559)) (size!40751 (_values!6723 thiss!1559))) (bvslt (mask!34456 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272734 () Bool)

(assert (=> b!1272734 (= e!725995 (and e!725994 mapRes!51175))))

(declare-fun condMapEmpty!51175 () Bool)

(declare-fun mapDefault!51175 () ValueCell!15672)

(assert (=> b!1272734 (= condMapEmpty!51175 (= (arr!40212 (_values!6723 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15672)) mapDefault!51175)))))

(declare-fun mapNonEmpty!51175 () Bool)

(declare-fun tp!97566 () Bool)

(assert (=> mapNonEmpty!51175 (= mapRes!51175 (and tp!97566 e!725998))))

(declare-fun mapValue!51175 () ValueCell!15672)

(declare-fun mapKey!51175 () (_ BitVec 32))

(declare-fun mapRest!51175 () (Array (_ BitVec 32) ValueCell!15672))

(assert (=> mapNonEmpty!51175 (= (arr!40212 (_values!6723 thiss!1559)) (store mapRest!51175 mapKey!51175 mapValue!51175))))

(declare-fun b!1272735 () Bool)

(declare-fun res!846524 () Bool)

(assert (=> b!1272735 (=> (not res!846524) (not e!725997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272735 (= res!846524 (validMask!0 (mask!34456 thiss!1559)))))

(assert (= (and start!107436 res!846525) b!1272735))

(assert (= (and b!1272735 res!846524) b!1272733))

(assert (= (and b!1272734 condMapEmpty!51175) mapIsEmpty!51175))

(assert (= (and b!1272734 (not condMapEmpty!51175)) mapNonEmpty!51175))

(get-info :version)

(assert (= (and mapNonEmpty!51175 ((_ is ValueCellFull!15672) mapValue!51175)) b!1272732))

(assert (= (and b!1272734 ((_ is ValueCellFull!15672) mapDefault!51175)) b!1272730))

(assert (= b!1272731 b!1272734))

(assert (= start!107436 b!1272731))

(declare-fun m!1170255 () Bool)

(assert (=> b!1272731 m!1170255))

(declare-fun m!1170257 () Bool)

(assert (=> b!1272731 m!1170257))

(declare-fun m!1170259 () Bool)

(assert (=> start!107436 m!1170259))

(declare-fun m!1170261 () Bool)

(assert (=> mapNonEmpty!51175 m!1170261))

(declare-fun m!1170263 () Bool)

(assert (=> b!1272735 m!1170263))

(check-sat (not b_next!27681) b_and!45737 tp_is_empty!33051 (not b!1272735) (not b!1272731) (not mapNonEmpty!51175) (not start!107436))
(check-sat b_and!45737 (not b_next!27681))
(get-model)

(declare-fun d!139899 () Bool)

(assert (=> d!139899 (= (validMask!0 (mask!34456 thiss!1559)) (and (or (= (mask!34456 thiss!1559) #b00000000000000000000000000000111) (= (mask!34456 thiss!1559) #b00000000000000000000000000001111) (= (mask!34456 thiss!1559) #b00000000000000000000000000011111) (= (mask!34456 thiss!1559) #b00000000000000000000000000111111) (= (mask!34456 thiss!1559) #b00000000000000000000000001111111) (= (mask!34456 thiss!1559) #b00000000000000000000000011111111) (= (mask!34456 thiss!1559) #b00000000000000000000000111111111) (= (mask!34456 thiss!1559) #b00000000000000000000001111111111) (= (mask!34456 thiss!1559) #b00000000000000000000011111111111) (= (mask!34456 thiss!1559) #b00000000000000000000111111111111) (= (mask!34456 thiss!1559) #b00000000000000000001111111111111) (= (mask!34456 thiss!1559) #b00000000000000000011111111111111) (= (mask!34456 thiss!1559) #b00000000000000000111111111111111) (= (mask!34456 thiss!1559) #b00000000000000001111111111111111) (= (mask!34456 thiss!1559) #b00000000000000011111111111111111) (= (mask!34456 thiss!1559) #b00000000000000111111111111111111) (= (mask!34456 thiss!1559) #b00000000000001111111111111111111) (= (mask!34456 thiss!1559) #b00000000000011111111111111111111) (= (mask!34456 thiss!1559) #b00000000000111111111111111111111) (= (mask!34456 thiss!1559) #b00000000001111111111111111111111) (= (mask!34456 thiss!1559) #b00000000011111111111111111111111) (= (mask!34456 thiss!1559) #b00000000111111111111111111111111) (= (mask!34456 thiss!1559) #b00000001111111111111111111111111) (= (mask!34456 thiss!1559) #b00000011111111111111111111111111) (= (mask!34456 thiss!1559) #b00000111111111111111111111111111) (= (mask!34456 thiss!1559) #b00001111111111111111111111111111) (= (mask!34456 thiss!1559) #b00011111111111111111111111111111) (= (mask!34456 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34456 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272735 d!139899))

(declare-fun d!139901 () Bool)

(assert (=> d!139901 (= (array_inv!30583 (_keys!12109 thiss!1559)) (bvsge (size!40752 (_keys!12109 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272731 d!139901))

(declare-fun d!139903 () Bool)

(assert (=> d!139903 (= (array_inv!30584 (_values!6723 thiss!1559)) (bvsge (size!40751 (_values!6723 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272731 d!139903))

(declare-fun d!139905 () Bool)

(declare-fun res!846538 () Bool)

(declare-fun e!726019 () Bool)

(assert (=> d!139905 (=> (not res!846538) (not e!726019))))

(declare-fun simpleValid!458 (LongMapFixedSize!6108) Bool)

(assert (=> d!139905 (= res!846538 (simpleValid!458 thiss!1559))))

(assert (=> d!139905 (= (valid!2292 thiss!1559) e!726019)))

(declare-fun b!1272760 () Bool)

(declare-fun res!846539 () Bool)

(assert (=> b!1272760 (=> (not res!846539) (not e!726019))))

(declare-fun arrayCountValidKeys!0 (array!83362 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272760 (= res!846539 (= (arrayCountValidKeys!0 (_keys!12109 thiss!1559) #b00000000000000000000000000000000 (size!40752 (_keys!12109 thiss!1559))) (_size!3109 thiss!1559)))))

(declare-fun b!1272761 () Bool)

(declare-fun res!846540 () Bool)

(assert (=> b!1272761 (=> (not res!846540) (not e!726019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83362 (_ BitVec 32)) Bool)

(assert (=> b!1272761 (= res!846540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12109 thiss!1559) (mask!34456 thiss!1559)))))

(declare-fun b!1272762 () Bool)

(declare-datatypes ((List!28561 0))(
  ( (Nil!28558) (Cons!28557 (h!29766 (_ BitVec 64)) (t!42094 List!28561)) )
))
(declare-fun arrayNoDuplicates!0 (array!83362 (_ BitVec 32) List!28561) Bool)

(assert (=> b!1272762 (= e!726019 (arrayNoDuplicates!0 (_keys!12109 thiss!1559) #b00000000000000000000000000000000 Nil!28558))))

(assert (= (and d!139905 res!846538) b!1272760))

(assert (= (and b!1272760 res!846539) b!1272761))

(assert (= (and b!1272761 res!846540) b!1272762))

(declare-fun m!1170275 () Bool)

(assert (=> d!139905 m!1170275))

(declare-fun m!1170277 () Bool)

(assert (=> b!1272760 m!1170277))

(declare-fun m!1170279 () Bool)

(assert (=> b!1272761 m!1170279))

(declare-fun m!1170281 () Bool)

(assert (=> b!1272762 m!1170281))

(assert (=> start!107436 d!139905))

(declare-fun condMapEmpty!51181 () Bool)

(declare-fun mapDefault!51181 () ValueCell!15672)

(assert (=> mapNonEmpty!51175 (= condMapEmpty!51181 (= mapRest!51175 ((as const (Array (_ BitVec 32) ValueCell!15672)) mapDefault!51181)))))

(declare-fun e!726025 () Bool)

(declare-fun mapRes!51181 () Bool)

(assert (=> mapNonEmpty!51175 (= tp!97566 (and e!726025 mapRes!51181))))

(declare-fun mapIsEmpty!51181 () Bool)

(assert (=> mapIsEmpty!51181 mapRes!51181))

(declare-fun b!1272770 () Bool)

(assert (=> b!1272770 (= e!726025 tp_is_empty!33051)))

(declare-fun b!1272769 () Bool)

(declare-fun e!726024 () Bool)

(assert (=> b!1272769 (= e!726024 tp_is_empty!33051)))

(declare-fun mapNonEmpty!51181 () Bool)

(declare-fun tp!97576 () Bool)

(assert (=> mapNonEmpty!51181 (= mapRes!51181 (and tp!97576 e!726024))))

(declare-fun mapRest!51181 () (Array (_ BitVec 32) ValueCell!15672))

(declare-fun mapKey!51181 () (_ BitVec 32))

(declare-fun mapValue!51181 () ValueCell!15672)

(assert (=> mapNonEmpty!51181 (= mapRest!51175 (store mapRest!51181 mapKey!51181 mapValue!51181))))

(assert (= (and mapNonEmpty!51175 condMapEmpty!51181) mapIsEmpty!51181))

(assert (= (and mapNonEmpty!51175 (not condMapEmpty!51181)) mapNonEmpty!51181))

(assert (= (and mapNonEmpty!51181 ((_ is ValueCellFull!15672) mapValue!51181)) b!1272769))

(assert (= (and mapNonEmpty!51175 ((_ is ValueCellFull!15672) mapDefault!51181)) b!1272770))

(declare-fun m!1170283 () Bool)

(assert (=> mapNonEmpty!51181 m!1170283))

(check-sat (not b_next!27681) b_and!45737 (not d!139905) tp_is_empty!33051 (not b!1272760) (not b!1272762) (not b!1272761) (not mapNonEmpty!51181))
(check-sat b_and!45737 (not b_next!27681))
