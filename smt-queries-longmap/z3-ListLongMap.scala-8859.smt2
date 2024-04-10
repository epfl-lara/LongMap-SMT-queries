; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107494 () Bool)

(assert start!107494)

(declare-fun b!1273059 () Bool)

(declare-fun b_free!27699 () Bool)

(declare-fun b_next!27699 () Bool)

(assert (=> b!1273059 (= b_free!27699 (not b_next!27699))))

(declare-fun tp!97631 () Bool)

(declare-fun b_and!45755 () Bool)

(assert (=> b!1273059 (= tp!97631 b_and!45755)))

(declare-fun mapIsEmpty!51213 () Bool)

(declare-fun mapRes!51213 () Bool)

(assert (=> mapIsEmpty!51213 mapRes!51213))

(declare-fun res!846665 () Bool)

(declare-fun e!726250 () Bool)

(assert (=> start!107494 (=> (not res!846665) (not e!726250))))

(declare-datatypes ((V!49285 0))(
  ( (V!49286 (val!16609 Int)) )
))
(declare-datatypes ((ValueCell!15681 0))(
  ( (ValueCellFull!15681 (v!19246 V!49285)) (EmptyCell!15681) )
))
(declare-datatypes ((array!83402 0))(
  ( (array!83403 (arr!40230 (Array (_ BitVec 32) ValueCell!15681)) (size!40771 (_ BitVec 32))) )
))
(declare-datatypes ((array!83404 0))(
  ( (array!83405 (arr!40231 (Array (_ BitVec 32) (_ BitVec 64))) (size!40772 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6126 0))(
  ( (LongMapFixedSize!6127 (defaultEntry!6709 Int) (mask!34476 (_ BitVec 32)) (extraKeys!6388 (_ BitVec 32)) (zeroValue!6494 V!49285) (minValue!6494 V!49285) (_size!3118 (_ BitVec 32)) (_keys!12120 array!83404) (_values!6732 array!83402) (_vacant!3118 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6126)

(declare-fun valid!2298 (LongMapFixedSize!6126) Bool)

(assert (=> start!107494 (= res!846665 (valid!2298 thiss!1559))))

(assert (=> start!107494 e!726250))

(declare-fun e!726251 () Bool)

(assert (=> start!107494 e!726251))

(declare-fun b!1273054 () Bool)

(declare-fun res!846664 () Bool)

(assert (=> b!1273054 (=> (not res!846664) (not e!726250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273054 (= res!846664 (validMask!0 (mask!34476 thiss!1559)))))

(declare-fun b!1273055 () Bool)

(declare-fun e!726246 () Bool)

(declare-fun e!726249 () Bool)

(assert (=> b!1273055 (= e!726246 (and e!726249 mapRes!51213))))

(declare-fun condMapEmpty!51213 () Bool)

(declare-fun mapDefault!51213 () ValueCell!15681)

(assert (=> b!1273055 (= condMapEmpty!51213 (= (arr!40230 (_values!6732 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15681)) mapDefault!51213)))))

(declare-fun b!1273056 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83404 (_ BitVec 32)) Bool)

(assert (=> b!1273056 (= e!726250 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12120 thiss!1559) (mask!34476 thiss!1559))))))

(declare-fun b!1273057 () Bool)

(declare-fun res!846666 () Bool)

(assert (=> b!1273057 (=> (not res!846666) (not e!726250))))

(assert (=> b!1273057 (= res!846666 (and (= (size!40771 (_values!6732 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34476 thiss!1559))) (= (size!40772 (_keys!12120 thiss!1559)) (size!40771 (_values!6732 thiss!1559))) (bvsge (mask!34476 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6388 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6388 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273058 () Bool)

(declare-fun e!726248 () Bool)

(declare-fun tp_is_empty!33069 () Bool)

(assert (=> b!1273058 (= e!726248 tp_is_empty!33069)))

(declare-fun array_inv!30593 (array!83404) Bool)

(declare-fun array_inv!30594 (array!83402) Bool)

(assert (=> b!1273059 (= e!726251 (and tp!97631 tp_is_empty!33069 (array_inv!30593 (_keys!12120 thiss!1559)) (array_inv!30594 (_values!6732 thiss!1559)) e!726246))))

(declare-fun mapNonEmpty!51213 () Bool)

(declare-fun tp!97632 () Bool)

(assert (=> mapNonEmpty!51213 (= mapRes!51213 (and tp!97632 e!726248))))

(declare-fun mapRest!51213 () (Array (_ BitVec 32) ValueCell!15681))

(declare-fun mapKey!51213 () (_ BitVec 32))

(declare-fun mapValue!51213 () ValueCell!15681)

(assert (=> mapNonEmpty!51213 (= (arr!40230 (_values!6732 thiss!1559)) (store mapRest!51213 mapKey!51213 mapValue!51213))))

(declare-fun b!1273060 () Bool)

(assert (=> b!1273060 (= e!726249 tp_is_empty!33069)))

(assert (= (and start!107494 res!846665) b!1273054))

(assert (= (and b!1273054 res!846664) b!1273057))

(assert (= (and b!1273057 res!846666) b!1273056))

(assert (= (and b!1273055 condMapEmpty!51213) mapIsEmpty!51213))

(assert (= (and b!1273055 (not condMapEmpty!51213)) mapNonEmpty!51213))

(get-info :version)

(assert (= (and mapNonEmpty!51213 ((_ is ValueCellFull!15681) mapValue!51213)) b!1273058))

(assert (= (and b!1273055 ((_ is ValueCellFull!15681) mapDefault!51213)) b!1273060))

(assert (= b!1273059 b!1273055))

(assert (= start!107494 b!1273059))

(declare-fun m!1170421 () Bool)

(assert (=> b!1273056 m!1170421))

(declare-fun m!1170423 () Bool)

(assert (=> b!1273059 m!1170423))

(declare-fun m!1170425 () Bool)

(assert (=> b!1273059 m!1170425))

(declare-fun m!1170427 () Bool)

(assert (=> b!1273054 m!1170427))

(declare-fun m!1170429 () Bool)

(assert (=> start!107494 m!1170429))

(declare-fun m!1170431 () Bool)

(assert (=> mapNonEmpty!51213 m!1170431))

(check-sat (not b!1273056) (not b_next!27699) (not mapNonEmpty!51213) tp_is_empty!33069 (not b!1273054) (not b!1273059) b_and!45755 (not start!107494))
(check-sat b_and!45755 (not b_next!27699))
(get-model)

(declare-fun d!139945 () Bool)

(assert (=> d!139945 (= (array_inv!30593 (_keys!12120 thiss!1559)) (bvsge (size!40772 (_keys!12120 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273059 d!139945))

(declare-fun d!139947 () Bool)

(assert (=> d!139947 (= (array_inv!30594 (_values!6732 thiss!1559)) (bvsge (size!40771 (_values!6732 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273059 d!139947))

(declare-fun d!139949 () Bool)

(assert (=> d!139949 (= (validMask!0 (mask!34476 thiss!1559)) (and (or (= (mask!34476 thiss!1559) #b00000000000000000000000000000111) (= (mask!34476 thiss!1559) #b00000000000000000000000000001111) (= (mask!34476 thiss!1559) #b00000000000000000000000000011111) (= (mask!34476 thiss!1559) #b00000000000000000000000000111111) (= (mask!34476 thiss!1559) #b00000000000000000000000001111111) (= (mask!34476 thiss!1559) #b00000000000000000000000011111111) (= (mask!34476 thiss!1559) #b00000000000000000000000111111111) (= (mask!34476 thiss!1559) #b00000000000000000000001111111111) (= (mask!34476 thiss!1559) #b00000000000000000000011111111111) (= (mask!34476 thiss!1559) #b00000000000000000000111111111111) (= (mask!34476 thiss!1559) #b00000000000000000001111111111111) (= (mask!34476 thiss!1559) #b00000000000000000011111111111111) (= (mask!34476 thiss!1559) #b00000000000000000111111111111111) (= (mask!34476 thiss!1559) #b00000000000000001111111111111111) (= (mask!34476 thiss!1559) #b00000000000000011111111111111111) (= (mask!34476 thiss!1559) #b00000000000000111111111111111111) (= (mask!34476 thiss!1559) #b00000000000001111111111111111111) (= (mask!34476 thiss!1559) #b00000000000011111111111111111111) (= (mask!34476 thiss!1559) #b00000000000111111111111111111111) (= (mask!34476 thiss!1559) #b00000000001111111111111111111111) (= (mask!34476 thiss!1559) #b00000000011111111111111111111111) (= (mask!34476 thiss!1559) #b00000000111111111111111111111111) (= (mask!34476 thiss!1559) #b00000001111111111111111111111111) (= (mask!34476 thiss!1559) #b00000011111111111111111111111111) (= (mask!34476 thiss!1559) #b00000111111111111111111111111111) (= (mask!34476 thiss!1559) #b00001111111111111111111111111111) (= (mask!34476 thiss!1559) #b00011111111111111111111111111111) (= (mask!34476 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34476 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273054 d!139949))

(declare-fun d!139951 () Bool)

(declare-fun res!846682 () Bool)

(declare-fun e!726272 () Bool)

(assert (=> d!139951 (=> (not res!846682) (not e!726272))))

(declare-fun simpleValid!461 (LongMapFixedSize!6126) Bool)

(assert (=> d!139951 (= res!846682 (simpleValid!461 thiss!1559))))

(assert (=> d!139951 (= (valid!2298 thiss!1559) e!726272)))

(declare-fun b!1273088 () Bool)

(declare-fun res!846683 () Bool)

(assert (=> b!1273088 (=> (not res!846683) (not e!726272))))

(declare-fun arrayCountValidKeys!0 (array!83404 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273088 (= res!846683 (= (arrayCountValidKeys!0 (_keys!12120 thiss!1559) #b00000000000000000000000000000000 (size!40772 (_keys!12120 thiss!1559))) (_size!3118 thiss!1559)))))

(declare-fun b!1273089 () Bool)

(declare-fun res!846684 () Bool)

(assert (=> b!1273089 (=> (not res!846684) (not e!726272))))

(assert (=> b!1273089 (= res!846684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12120 thiss!1559) (mask!34476 thiss!1559)))))

(declare-fun b!1273090 () Bool)

(declare-datatypes ((List!28564 0))(
  ( (Nil!28561) (Cons!28560 (h!29769 (_ BitVec 64)) (t!42097 List!28564)) )
))
(declare-fun arrayNoDuplicates!0 (array!83404 (_ BitVec 32) List!28564) Bool)

(assert (=> b!1273090 (= e!726272 (arrayNoDuplicates!0 (_keys!12120 thiss!1559) #b00000000000000000000000000000000 Nil!28561))))

(assert (= (and d!139951 res!846682) b!1273088))

(assert (= (and b!1273088 res!846683) b!1273089))

(assert (= (and b!1273089 res!846684) b!1273090))

(declare-fun m!1170445 () Bool)

(assert (=> d!139951 m!1170445))

(declare-fun m!1170447 () Bool)

(assert (=> b!1273088 m!1170447))

(assert (=> b!1273089 m!1170421))

(declare-fun m!1170449 () Bool)

(assert (=> b!1273090 m!1170449))

(assert (=> start!107494 d!139951))

(declare-fun b!1273099 () Bool)

(declare-fun e!726281 () Bool)

(declare-fun call!62585 () Bool)

(assert (=> b!1273099 (= e!726281 call!62585)))

(declare-fun b!1273100 () Bool)

(declare-fun e!726280 () Bool)

(assert (=> b!1273100 (= e!726281 e!726280)))

(declare-fun lt!575113 () (_ BitVec 64))

(assert (=> b!1273100 (= lt!575113 (select (arr!40231 (_keys!12120 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42328 0))(
  ( (Unit!42329) )
))
(declare-fun lt!575112 () Unit!42328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83404 (_ BitVec 64) (_ BitVec 32)) Unit!42328)

(assert (=> b!1273100 (= lt!575112 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12120 thiss!1559) lt!575113 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273100 (arrayContainsKey!0 (_keys!12120 thiss!1559) lt!575113 #b00000000000000000000000000000000)))

(declare-fun lt!575111 () Unit!42328)

(assert (=> b!1273100 (= lt!575111 lt!575112)))

(declare-fun res!846690 () Bool)

(declare-datatypes ((SeekEntryResult!9994 0))(
  ( (MissingZero!9994 (index!42347 (_ BitVec 32))) (Found!9994 (index!42348 (_ BitVec 32))) (Intermediate!9994 (undefined!10806 Bool) (index!42349 (_ BitVec 32)) (x!112535 (_ BitVec 32))) (Undefined!9994) (MissingVacant!9994 (index!42350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83404 (_ BitVec 32)) SeekEntryResult!9994)

(assert (=> b!1273100 (= res!846690 (= (seekEntryOrOpen!0 (select (arr!40231 (_keys!12120 thiss!1559)) #b00000000000000000000000000000000) (_keys!12120 thiss!1559) (mask!34476 thiss!1559)) (Found!9994 #b00000000000000000000000000000000)))))

(assert (=> b!1273100 (=> (not res!846690) (not e!726280))))

(declare-fun b!1273101 () Bool)

(declare-fun e!726279 () Bool)

(assert (=> b!1273101 (= e!726279 e!726281)))

(declare-fun c!123747 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273101 (= c!123747 (validKeyInArray!0 (select (arr!40231 (_keys!12120 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62582 () Bool)

(assert (=> bm!62582 (= call!62585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12120 thiss!1559) (mask!34476 thiss!1559)))))

(declare-fun b!1273102 () Bool)

(assert (=> b!1273102 (= e!726280 call!62585)))

(declare-fun d!139953 () Bool)

(declare-fun res!846689 () Bool)

(assert (=> d!139953 (=> res!846689 e!726279)))

(assert (=> d!139953 (= res!846689 (bvsge #b00000000000000000000000000000000 (size!40772 (_keys!12120 thiss!1559))))))

(assert (=> d!139953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12120 thiss!1559) (mask!34476 thiss!1559)) e!726279)))

(assert (= (and d!139953 (not res!846689)) b!1273101))

(assert (= (and b!1273101 c!123747) b!1273100))

(assert (= (and b!1273101 (not c!123747)) b!1273099))

(assert (= (and b!1273100 res!846690) b!1273102))

(assert (= (or b!1273102 b!1273099) bm!62582))

(declare-fun m!1170451 () Bool)

(assert (=> b!1273100 m!1170451))

(declare-fun m!1170453 () Bool)

(assert (=> b!1273100 m!1170453))

(declare-fun m!1170455 () Bool)

(assert (=> b!1273100 m!1170455))

(assert (=> b!1273100 m!1170451))

(declare-fun m!1170457 () Bool)

(assert (=> b!1273100 m!1170457))

(assert (=> b!1273101 m!1170451))

(assert (=> b!1273101 m!1170451))

(declare-fun m!1170459 () Bool)

(assert (=> b!1273101 m!1170459))

(declare-fun m!1170461 () Bool)

(assert (=> bm!62582 m!1170461))

(assert (=> b!1273056 d!139953))

(declare-fun b!1273110 () Bool)

(declare-fun e!726286 () Bool)

(assert (=> b!1273110 (= e!726286 tp_is_empty!33069)))

(declare-fun mapIsEmpty!51219 () Bool)

(declare-fun mapRes!51219 () Bool)

(assert (=> mapIsEmpty!51219 mapRes!51219))

(declare-fun b!1273109 () Bool)

(declare-fun e!726287 () Bool)

(assert (=> b!1273109 (= e!726287 tp_is_empty!33069)))

(declare-fun mapNonEmpty!51219 () Bool)

(declare-fun tp!97641 () Bool)

(assert (=> mapNonEmpty!51219 (= mapRes!51219 (and tp!97641 e!726287))))

(declare-fun mapRest!51219 () (Array (_ BitVec 32) ValueCell!15681))

(declare-fun mapKey!51219 () (_ BitVec 32))

(declare-fun mapValue!51219 () ValueCell!15681)

(assert (=> mapNonEmpty!51219 (= mapRest!51213 (store mapRest!51219 mapKey!51219 mapValue!51219))))

(declare-fun condMapEmpty!51219 () Bool)

(declare-fun mapDefault!51219 () ValueCell!15681)

(assert (=> mapNonEmpty!51213 (= condMapEmpty!51219 (= mapRest!51213 ((as const (Array (_ BitVec 32) ValueCell!15681)) mapDefault!51219)))))

(assert (=> mapNonEmpty!51213 (= tp!97632 (and e!726286 mapRes!51219))))

(assert (= (and mapNonEmpty!51213 condMapEmpty!51219) mapIsEmpty!51219))

(assert (= (and mapNonEmpty!51213 (not condMapEmpty!51219)) mapNonEmpty!51219))

(assert (= (and mapNonEmpty!51219 ((_ is ValueCellFull!15681) mapValue!51219)) b!1273109))

(assert (= (and mapNonEmpty!51213 ((_ is ValueCellFull!15681) mapDefault!51219)) b!1273110))

(declare-fun m!1170463 () Bool)

(assert (=> mapNonEmpty!51219 m!1170463))

(check-sat (not mapNonEmpty!51219) (not b!1273089) (not b!1273088) (not b_next!27699) (not b!1273100) tp_is_empty!33069 b_and!45755 (not bm!62582) (not b!1273090) (not b!1273101) (not d!139951))
(check-sat b_and!45755 (not b_next!27699))
