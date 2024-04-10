; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107528 () Bool)

(assert start!107528)

(declare-fun b!1273277 () Bool)

(declare-fun b_free!27711 () Bool)

(declare-fun b_next!27711 () Bool)

(assert (=> b!1273277 (= b_free!27711 (not b_next!27711))))

(declare-fun tp!97674 () Bool)

(declare-fun b_and!45767 () Bool)

(assert (=> b!1273277 (= tp!97674 b_and!45767)))

(declare-fun b!1273273 () Bool)

(declare-fun res!846776 () Bool)

(declare-fun e!726403 () Bool)

(assert (=> b!1273273 (=> (not res!846776) (not e!726403))))

(declare-datatypes ((V!49301 0))(
  ( (V!49302 (val!16615 Int)) )
))
(declare-datatypes ((ValueCell!15687 0))(
  ( (ValueCellFull!15687 (v!19252 V!49301)) (EmptyCell!15687) )
))
(declare-datatypes ((array!83430 0))(
  ( (array!83431 (arr!40242 (Array (_ BitVec 32) ValueCell!15687)) (size!40783 (_ BitVec 32))) )
))
(declare-datatypes ((array!83432 0))(
  ( (array!83433 (arr!40243 (Array (_ BitVec 32) (_ BitVec 64))) (size!40784 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6138 0))(
  ( (LongMapFixedSize!6139 (defaultEntry!6715 Int) (mask!34490 (_ BitVec 32)) (extraKeys!6394 (_ BitVec 32)) (zeroValue!6500 V!49301) (minValue!6500 V!49301) (_size!3124 (_ BitVec 32)) (_keys!12128 array!83432) (_values!6738 array!83430) (_vacant!3124 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6138)

(declare-datatypes ((List!28567 0))(
  ( (Nil!28564) (Cons!28563 (h!29772 (_ BitVec 64)) (t!42100 List!28567)) )
))
(declare-fun arrayNoDuplicates!0 (array!83432 (_ BitVec 32) List!28567) Bool)

(assert (=> b!1273273 (= res!846776 (arrayNoDuplicates!0 (_keys!12128 thiss!1559) #b00000000000000000000000000000000 Nil!28564))))

(declare-fun mapNonEmpty!51237 () Bool)

(declare-fun mapRes!51237 () Bool)

(declare-fun tp!97673 () Bool)

(declare-fun e!726407 () Bool)

(assert (=> mapNonEmpty!51237 (= mapRes!51237 (and tp!97673 e!726407))))

(declare-fun mapValue!51237 () ValueCell!15687)

(declare-fun mapRest!51237 () (Array (_ BitVec 32) ValueCell!15687))

(declare-fun mapKey!51237 () (_ BitVec 32))

(assert (=> mapNonEmpty!51237 (= (arr!40242 (_values!6738 thiss!1559)) (store mapRest!51237 mapKey!51237 mapValue!51237))))

(declare-fun b!1273274 () Bool)

(declare-fun e!726402 () Bool)

(declare-fun tp_is_empty!33081 () Bool)

(assert (=> b!1273274 (= e!726402 tp_is_empty!33081)))

(declare-fun b!1273275 () Bool)

(declare-fun res!846779 () Bool)

(assert (=> b!1273275 (=> (not res!846779) (not e!726403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83432 (_ BitVec 32)) Bool)

(assert (=> b!1273275 (= res!846779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12128 thiss!1559) (mask!34490 thiss!1559)))))

(declare-fun b!1273276 () Bool)

(declare-fun res!846778 () Bool)

(assert (=> b!1273276 (=> (not res!846778) (not e!726403))))

(assert (=> b!1273276 (= res!846778 (and (= (size!40783 (_values!6738 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34490 thiss!1559))) (= (size!40784 (_keys!12128 thiss!1559)) (size!40783 (_values!6738 thiss!1559))) (bvsge (mask!34490 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6394 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6394 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun e!726404 () Bool)

(declare-fun e!726406 () Bool)

(declare-fun array_inv!30601 (array!83432) Bool)

(declare-fun array_inv!30602 (array!83430) Bool)

(assert (=> b!1273277 (= e!726404 (and tp!97674 tp_is_empty!33081 (array_inv!30601 (_keys!12128 thiss!1559)) (array_inv!30602 (_values!6738 thiss!1559)) e!726406))))

(declare-fun b!1273278 () Bool)

(assert (=> b!1273278 (= e!726407 tp_is_empty!33081)))

(declare-fun mapIsEmpty!51237 () Bool)

(assert (=> mapIsEmpty!51237 mapRes!51237))

(declare-fun b!1273279 () Bool)

(declare-fun res!846780 () Bool)

(assert (=> b!1273279 (=> (not res!846780) (not e!726403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273279 (= res!846780 (validMask!0 (mask!34490 thiss!1559)))))

(declare-fun b!1273280 () Bool)

(assert (=> b!1273280 (= e!726403 (bvsgt #b00000000000000000000000000000000 (size!40784 (_keys!12128 thiss!1559))))))

(declare-fun res!846777 () Bool)

(assert (=> start!107528 (=> (not res!846777) (not e!726403))))

(declare-fun valid!2303 (LongMapFixedSize!6138) Bool)

(assert (=> start!107528 (= res!846777 (valid!2303 thiss!1559))))

(assert (=> start!107528 e!726403))

(assert (=> start!107528 e!726404))

(declare-fun b!1273272 () Bool)

(assert (=> b!1273272 (= e!726406 (and e!726402 mapRes!51237))))

(declare-fun condMapEmpty!51237 () Bool)

(declare-fun mapDefault!51237 () ValueCell!15687)

(assert (=> b!1273272 (= condMapEmpty!51237 (= (arr!40242 (_values!6738 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15687)) mapDefault!51237)))))

(assert (= (and start!107528 res!846777) b!1273279))

(assert (= (and b!1273279 res!846780) b!1273276))

(assert (= (and b!1273276 res!846778) b!1273275))

(assert (= (and b!1273275 res!846779) b!1273273))

(assert (= (and b!1273273 res!846776) b!1273280))

(assert (= (and b!1273272 condMapEmpty!51237) mapIsEmpty!51237))

(assert (= (and b!1273272 (not condMapEmpty!51237)) mapNonEmpty!51237))

(get-info :version)

(assert (= (and mapNonEmpty!51237 ((_ is ValueCellFull!15687) mapValue!51237)) b!1273278))

(assert (= (and b!1273272 ((_ is ValueCellFull!15687) mapDefault!51237)) b!1273274))

(assert (= b!1273277 b!1273272))

(assert (= start!107528 b!1273277))

(declare-fun m!1170543 () Bool)

(assert (=> b!1273273 m!1170543))

(declare-fun m!1170545 () Bool)

(assert (=> b!1273277 m!1170545))

(declare-fun m!1170547 () Bool)

(assert (=> b!1273277 m!1170547))

(declare-fun m!1170549 () Bool)

(assert (=> b!1273279 m!1170549))

(declare-fun m!1170551 () Bool)

(assert (=> start!107528 m!1170551))

(declare-fun m!1170553 () Bool)

(assert (=> b!1273275 m!1170553))

(declare-fun m!1170555 () Bool)

(assert (=> mapNonEmpty!51237 m!1170555))

(check-sat tp_is_empty!33081 (not mapNonEmpty!51237) (not b!1273279) (not b!1273275) (not start!107528) (not b_next!27711) (not b!1273273) b_and!45767 (not b!1273277))
(check-sat b_and!45767 (not b_next!27711))
(get-model)

(declare-fun d!139971 () Bool)

(declare-fun res!846802 () Bool)

(declare-fun e!726428 () Bool)

(assert (=> d!139971 (=> (not res!846802) (not e!726428))))

(declare-fun simpleValid!463 (LongMapFixedSize!6138) Bool)

(assert (=> d!139971 (= res!846802 (simpleValid!463 thiss!1559))))

(assert (=> d!139971 (= (valid!2303 thiss!1559) e!726428)))

(declare-fun b!1273314 () Bool)

(declare-fun res!846803 () Bool)

(assert (=> b!1273314 (=> (not res!846803) (not e!726428))))

(declare-fun arrayCountValidKeys!0 (array!83432 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273314 (= res!846803 (= (arrayCountValidKeys!0 (_keys!12128 thiss!1559) #b00000000000000000000000000000000 (size!40784 (_keys!12128 thiss!1559))) (_size!3124 thiss!1559)))))

(declare-fun b!1273315 () Bool)

(declare-fun res!846804 () Bool)

(assert (=> b!1273315 (=> (not res!846804) (not e!726428))))

(assert (=> b!1273315 (= res!846804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12128 thiss!1559) (mask!34490 thiss!1559)))))

(declare-fun b!1273316 () Bool)

(assert (=> b!1273316 (= e!726428 (arrayNoDuplicates!0 (_keys!12128 thiss!1559) #b00000000000000000000000000000000 Nil!28564))))

(assert (= (and d!139971 res!846802) b!1273314))

(assert (= (and b!1273314 res!846803) b!1273315))

(assert (= (and b!1273315 res!846804) b!1273316))

(declare-fun m!1170571 () Bool)

(assert (=> d!139971 m!1170571))

(declare-fun m!1170573 () Bool)

(assert (=> b!1273314 m!1170573))

(assert (=> b!1273315 m!1170553))

(assert (=> b!1273316 m!1170543))

(assert (=> start!107528 d!139971))

(declare-fun d!139973 () Bool)

(assert (=> d!139973 (= (validMask!0 (mask!34490 thiss!1559)) (and (or (= (mask!34490 thiss!1559) #b00000000000000000000000000000111) (= (mask!34490 thiss!1559) #b00000000000000000000000000001111) (= (mask!34490 thiss!1559) #b00000000000000000000000000011111) (= (mask!34490 thiss!1559) #b00000000000000000000000000111111) (= (mask!34490 thiss!1559) #b00000000000000000000000001111111) (= (mask!34490 thiss!1559) #b00000000000000000000000011111111) (= (mask!34490 thiss!1559) #b00000000000000000000000111111111) (= (mask!34490 thiss!1559) #b00000000000000000000001111111111) (= (mask!34490 thiss!1559) #b00000000000000000000011111111111) (= (mask!34490 thiss!1559) #b00000000000000000000111111111111) (= (mask!34490 thiss!1559) #b00000000000000000001111111111111) (= (mask!34490 thiss!1559) #b00000000000000000011111111111111) (= (mask!34490 thiss!1559) #b00000000000000000111111111111111) (= (mask!34490 thiss!1559) #b00000000000000001111111111111111) (= (mask!34490 thiss!1559) #b00000000000000011111111111111111) (= (mask!34490 thiss!1559) #b00000000000000111111111111111111) (= (mask!34490 thiss!1559) #b00000000000001111111111111111111) (= (mask!34490 thiss!1559) #b00000000000011111111111111111111) (= (mask!34490 thiss!1559) #b00000000000111111111111111111111) (= (mask!34490 thiss!1559) #b00000000001111111111111111111111) (= (mask!34490 thiss!1559) #b00000000011111111111111111111111) (= (mask!34490 thiss!1559) #b00000000111111111111111111111111) (= (mask!34490 thiss!1559) #b00000001111111111111111111111111) (= (mask!34490 thiss!1559) #b00000011111111111111111111111111) (= (mask!34490 thiss!1559) #b00000111111111111111111111111111) (= (mask!34490 thiss!1559) #b00001111111111111111111111111111) (= (mask!34490 thiss!1559) #b00011111111111111111111111111111) (= (mask!34490 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34490 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273279 d!139973))

(declare-fun d!139975 () Bool)

(assert (=> d!139975 (= (array_inv!30601 (_keys!12128 thiss!1559)) (bvsge (size!40784 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273277 d!139975))

(declare-fun d!139977 () Bool)

(assert (=> d!139977 (= (array_inv!30602 (_values!6738 thiss!1559)) (bvsge (size!40783 (_values!6738 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273277 d!139977))

(declare-fun b!1273327 () Bool)

(declare-fun e!726439 () Bool)

(declare-fun call!62594 () Bool)

(assert (=> b!1273327 (= e!726439 call!62594)))

(declare-fun b!1273328 () Bool)

(declare-fun e!726438 () Bool)

(assert (=> b!1273328 (= e!726438 e!726439)))

(declare-fun c!123756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273328 (= c!123756 (validKeyInArray!0 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62591 () Bool)

(assert (=> bm!62591 (= call!62594 (arrayNoDuplicates!0 (_keys!12128 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123756 (Cons!28563 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000) Nil!28564) Nil!28564)))))

(declare-fun b!1273329 () Bool)

(declare-fun e!726437 () Bool)

(declare-fun contains!7674 (List!28567 (_ BitVec 64)) Bool)

(assert (=> b!1273329 (= e!726437 (contains!7674 Nil!28564 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273330 () Bool)

(declare-fun e!726440 () Bool)

(assert (=> b!1273330 (= e!726440 e!726438)))

(declare-fun res!846811 () Bool)

(assert (=> b!1273330 (=> (not res!846811) (not e!726438))))

(assert (=> b!1273330 (= res!846811 (not e!726437))))

(declare-fun res!846813 () Bool)

(assert (=> b!1273330 (=> (not res!846813) (not e!726437))))

(assert (=> b!1273330 (= res!846813 (validKeyInArray!0 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273331 () Bool)

(assert (=> b!1273331 (= e!726439 call!62594)))

(declare-fun d!139979 () Bool)

(declare-fun res!846812 () Bool)

(assert (=> d!139979 (=> res!846812 e!726440)))

(assert (=> d!139979 (= res!846812 (bvsge #b00000000000000000000000000000000 (size!40784 (_keys!12128 thiss!1559))))))

(assert (=> d!139979 (= (arrayNoDuplicates!0 (_keys!12128 thiss!1559) #b00000000000000000000000000000000 Nil!28564) e!726440)))

(assert (= (and d!139979 (not res!846812)) b!1273330))

(assert (= (and b!1273330 res!846813) b!1273329))

(assert (= (and b!1273330 res!846811) b!1273328))

(assert (= (and b!1273328 c!123756) b!1273327))

(assert (= (and b!1273328 (not c!123756)) b!1273331))

(assert (= (or b!1273327 b!1273331) bm!62591))

(declare-fun m!1170575 () Bool)

(assert (=> b!1273328 m!1170575))

(assert (=> b!1273328 m!1170575))

(declare-fun m!1170577 () Bool)

(assert (=> b!1273328 m!1170577))

(assert (=> bm!62591 m!1170575))

(declare-fun m!1170579 () Bool)

(assert (=> bm!62591 m!1170579))

(assert (=> b!1273329 m!1170575))

(assert (=> b!1273329 m!1170575))

(declare-fun m!1170581 () Bool)

(assert (=> b!1273329 m!1170581))

(assert (=> b!1273330 m!1170575))

(assert (=> b!1273330 m!1170575))

(assert (=> b!1273330 m!1170577))

(assert (=> b!1273273 d!139979))

(declare-fun b!1273340 () Bool)

(declare-fun e!726448 () Bool)

(declare-fun call!62597 () Bool)

(assert (=> b!1273340 (= e!726448 call!62597)))

(declare-fun b!1273341 () Bool)

(declare-fun e!726449 () Bool)

(assert (=> b!1273341 (= e!726449 e!726448)))

(declare-fun c!123759 () Bool)

(assert (=> b!1273341 (= c!123759 (validKeyInArray!0 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62594 () Bool)

(assert (=> bm!62594 (= call!62597 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12128 thiss!1559) (mask!34490 thiss!1559)))))

(declare-fun b!1273342 () Bool)

(declare-fun e!726447 () Bool)

(assert (=> b!1273342 (= e!726448 e!726447)))

(declare-fun lt!575129 () (_ BitVec 64))

(assert (=> b!1273342 (= lt!575129 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42332 0))(
  ( (Unit!42333) )
))
(declare-fun lt!575130 () Unit!42332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83432 (_ BitVec 64) (_ BitVec 32)) Unit!42332)

(assert (=> b!1273342 (= lt!575130 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12128 thiss!1559) lt!575129 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273342 (arrayContainsKey!0 (_keys!12128 thiss!1559) lt!575129 #b00000000000000000000000000000000)))

(declare-fun lt!575131 () Unit!42332)

(assert (=> b!1273342 (= lt!575131 lt!575130)))

(declare-fun res!846818 () Bool)

(declare-datatypes ((SeekEntryResult!9996 0))(
  ( (MissingZero!9996 (index!42355 (_ BitVec 32))) (Found!9996 (index!42356 (_ BitVec 32))) (Intermediate!9996 (undefined!10808 Bool) (index!42357 (_ BitVec 32)) (x!112569 (_ BitVec 32))) (Undefined!9996) (MissingVacant!9996 (index!42358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83432 (_ BitVec 32)) SeekEntryResult!9996)

(assert (=> b!1273342 (= res!846818 (= (seekEntryOrOpen!0 (select (arr!40243 (_keys!12128 thiss!1559)) #b00000000000000000000000000000000) (_keys!12128 thiss!1559) (mask!34490 thiss!1559)) (Found!9996 #b00000000000000000000000000000000)))))

(assert (=> b!1273342 (=> (not res!846818) (not e!726447))))

(declare-fun b!1273343 () Bool)

(assert (=> b!1273343 (= e!726447 call!62597)))

(declare-fun d!139981 () Bool)

(declare-fun res!846819 () Bool)

(assert (=> d!139981 (=> res!846819 e!726449)))

(assert (=> d!139981 (= res!846819 (bvsge #b00000000000000000000000000000000 (size!40784 (_keys!12128 thiss!1559))))))

(assert (=> d!139981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12128 thiss!1559) (mask!34490 thiss!1559)) e!726449)))

(assert (= (and d!139981 (not res!846819)) b!1273341))

(assert (= (and b!1273341 c!123759) b!1273342))

(assert (= (and b!1273341 (not c!123759)) b!1273340))

(assert (= (and b!1273342 res!846818) b!1273343))

(assert (= (or b!1273343 b!1273340) bm!62594))

(assert (=> b!1273341 m!1170575))

(assert (=> b!1273341 m!1170575))

(assert (=> b!1273341 m!1170577))

(declare-fun m!1170583 () Bool)

(assert (=> bm!62594 m!1170583))

(assert (=> b!1273342 m!1170575))

(declare-fun m!1170585 () Bool)

(assert (=> b!1273342 m!1170585))

(declare-fun m!1170587 () Bool)

(assert (=> b!1273342 m!1170587))

(assert (=> b!1273342 m!1170575))

(declare-fun m!1170589 () Bool)

(assert (=> b!1273342 m!1170589))

(assert (=> b!1273275 d!139981))

(declare-fun b!1273351 () Bool)

(declare-fun e!726455 () Bool)

(assert (=> b!1273351 (= e!726455 tp_is_empty!33081)))

(declare-fun mapNonEmpty!51243 () Bool)

(declare-fun mapRes!51243 () Bool)

(declare-fun tp!97683 () Bool)

(declare-fun e!726454 () Bool)

(assert (=> mapNonEmpty!51243 (= mapRes!51243 (and tp!97683 e!726454))))

(declare-fun mapValue!51243 () ValueCell!15687)

(declare-fun mapKey!51243 () (_ BitVec 32))

(declare-fun mapRest!51243 () (Array (_ BitVec 32) ValueCell!15687))

(assert (=> mapNonEmpty!51243 (= mapRest!51237 (store mapRest!51243 mapKey!51243 mapValue!51243))))

(declare-fun b!1273350 () Bool)

(assert (=> b!1273350 (= e!726454 tp_is_empty!33081)))

(declare-fun condMapEmpty!51243 () Bool)

(declare-fun mapDefault!51243 () ValueCell!15687)

(assert (=> mapNonEmpty!51237 (= condMapEmpty!51243 (= mapRest!51237 ((as const (Array (_ BitVec 32) ValueCell!15687)) mapDefault!51243)))))

(assert (=> mapNonEmpty!51237 (= tp!97673 (and e!726455 mapRes!51243))))

(declare-fun mapIsEmpty!51243 () Bool)

(assert (=> mapIsEmpty!51243 mapRes!51243))

(assert (= (and mapNonEmpty!51237 condMapEmpty!51243) mapIsEmpty!51243))

(assert (= (and mapNonEmpty!51237 (not condMapEmpty!51243)) mapNonEmpty!51243))

(assert (= (and mapNonEmpty!51243 ((_ is ValueCellFull!15687) mapValue!51243)) b!1273350))

(assert (= (and mapNonEmpty!51237 ((_ is ValueCellFull!15687) mapDefault!51243)) b!1273351))

(declare-fun m!1170591 () Bool)

(assert (=> mapNonEmpty!51243 m!1170591))

(check-sat tp_is_empty!33081 (not bm!62591) (not b!1273330) (not b!1273342) (not bm!62594) (not d!139971) (not b!1273314) (not b!1273341) (not mapNonEmpty!51243) (not b!1273315) (not b!1273328) b_and!45767 (not b!1273329) (not b_next!27711) (not b!1273316))
(check-sat b_and!45767 (not b_next!27711))
