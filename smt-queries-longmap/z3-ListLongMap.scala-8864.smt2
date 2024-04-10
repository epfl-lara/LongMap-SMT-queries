; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107574 () Bool)

(assert start!107574)

(declare-fun b!1273514 () Bool)

(declare-fun b_free!27729 () Bool)

(declare-fun b_next!27729 () Bool)

(assert (=> b!1273514 (= b_free!27729 (not b_next!27729))))

(declare-fun tp!97738 () Bool)

(declare-fun b_and!45785 () Bool)

(assert (=> b!1273514 (= tp!97738 b_and!45785)))

(declare-fun mapNonEmpty!51274 () Bool)

(declare-fun mapRes!51274 () Bool)

(declare-fun tp!97737 () Bool)

(declare-fun e!726614 () Bool)

(assert (=> mapNonEmpty!51274 (= mapRes!51274 (and tp!97737 e!726614))))

(declare-datatypes ((V!49325 0))(
  ( (V!49326 (val!16624 Int)) )
))
(declare-datatypes ((ValueCell!15696 0))(
  ( (ValueCellFull!15696 (v!19261 V!49325)) (EmptyCell!15696) )
))
(declare-fun mapRest!51274 () (Array (_ BitVec 32) ValueCell!15696))

(declare-fun mapValue!51274 () ValueCell!15696)

(declare-fun mapKey!51274 () (_ BitVec 32))

(declare-datatypes ((array!83472 0))(
  ( (array!83473 (arr!40260 (Array (_ BitVec 32) ValueCell!15696)) (size!40803 (_ BitVec 32))) )
))
(declare-datatypes ((array!83474 0))(
  ( (array!83475 (arr!40261 (Array (_ BitVec 32) (_ BitVec 64))) (size!40804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6156 0))(
  ( (LongMapFixedSize!6157 (defaultEntry!6724 Int) (mask!34508 (_ BitVec 32)) (extraKeys!6403 (_ BitVec 32)) (zeroValue!6509 V!49325) (minValue!6509 V!49325) (_size!3133 (_ BitVec 32)) (_keys!12138 array!83474) (_values!6747 array!83472) (_vacant!3133 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6156)

(assert (=> mapNonEmpty!51274 (= (arr!40260 (_values!6747 thiss!1551)) (store mapRest!51274 mapKey!51274 mapValue!51274))))

(declare-fun tp_is_empty!33099 () Bool)

(declare-fun e!726615 () Bool)

(declare-fun e!726619 () Bool)

(declare-fun array_inv!30611 (array!83474) Bool)

(declare-fun array_inv!30612 (array!83472) Bool)

(assert (=> b!1273514 (= e!726615 (and tp!97738 tp_is_empty!33099 (array_inv!30611 (_keys!12138 thiss!1551)) (array_inv!30612 (_values!6747 thiss!1551)) e!726619))))

(declare-fun b!1273515 () Bool)

(assert (=> b!1273515 (= e!726614 tp_is_empty!33099)))

(declare-fun b!1273517 () Bool)

(declare-fun res!846873 () Bool)

(declare-fun e!726618 () Bool)

(assert (=> b!1273517 (=> (not res!846873) (not e!726618))))

(declare-fun arrayCountValidKeys!0 (array!83474 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273517 (= res!846873 (= (arrayCountValidKeys!0 (_keys!12138 thiss!1551) #b00000000000000000000000000000000 (size!40804 (_keys!12138 thiss!1551))) (_size!3133 thiss!1551)))))

(declare-fun b!1273518 () Bool)

(declare-fun e!726617 () Bool)

(assert (=> b!1273518 (= e!726619 (and e!726617 mapRes!51274))))

(declare-fun condMapEmpty!51274 () Bool)

(declare-fun mapDefault!51274 () ValueCell!15696)

(assert (=> b!1273518 (= condMapEmpty!51274 (= (arr!40260 (_values!6747 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15696)) mapDefault!51274)))))

(declare-fun b!1273519 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273519 (= e!726618 (not (validMask!0 (mask!34508 thiss!1551))))))

(declare-fun mapIsEmpty!51274 () Bool)

(assert (=> mapIsEmpty!51274 mapRes!51274))

(declare-fun res!846872 () Bool)

(assert (=> start!107574 (=> (not res!846872) (not e!726618))))

(declare-fun simpleValid!468 (LongMapFixedSize!6156) Bool)

(assert (=> start!107574 (= res!846872 (simpleValid!468 thiss!1551))))

(assert (=> start!107574 e!726618))

(assert (=> start!107574 e!726615))

(declare-fun b!1273516 () Bool)

(assert (=> b!1273516 (= e!726617 tp_is_empty!33099)))

(assert (= (and start!107574 res!846872) b!1273517))

(assert (= (and b!1273517 res!846873) b!1273519))

(assert (= (and b!1273518 condMapEmpty!51274) mapIsEmpty!51274))

(assert (= (and b!1273518 (not condMapEmpty!51274)) mapNonEmpty!51274))

(get-info :version)

(assert (= (and mapNonEmpty!51274 ((_ is ValueCellFull!15696) mapValue!51274)) b!1273515))

(assert (= (and b!1273518 ((_ is ValueCellFull!15696) mapDefault!51274)) b!1273516))

(assert (= b!1273514 b!1273518))

(assert (= start!107574 b!1273514))

(declare-fun m!1170667 () Bool)

(assert (=> mapNonEmpty!51274 m!1170667))

(declare-fun m!1170669 () Bool)

(assert (=> start!107574 m!1170669))

(declare-fun m!1170671 () Bool)

(assert (=> b!1273519 m!1170671))

(declare-fun m!1170673 () Bool)

(assert (=> b!1273517 m!1170673))

(declare-fun m!1170675 () Bool)

(assert (=> b!1273514 m!1170675))

(declare-fun m!1170677 () Bool)

(assert (=> b!1273514 m!1170677))

(check-sat tp_is_empty!33099 (not mapNonEmpty!51274) (not b!1273517) b_and!45785 (not start!107574) (not b!1273519) (not b_next!27729) (not b!1273514))
(check-sat b_and!45785 (not b_next!27729))
(get-model)

(declare-fun b!1273546 () Bool)

(declare-fun res!846891 () Bool)

(declare-fun e!726640 () Bool)

(assert (=> b!1273546 (=> (not res!846891) (not e!726640))))

(assert (=> b!1273546 (= res!846891 (and (= (size!40803 (_values!6747 thiss!1551)) (bvadd (mask!34508 thiss!1551) #b00000000000000000000000000000001)) (= (size!40804 (_keys!12138 thiss!1551)) (size!40803 (_values!6747 thiss!1551))) (bvsge (_size!3133 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3133 thiss!1551) (bvadd (mask!34508 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273549 () Bool)

(assert (=> b!1273549 (= e!726640 (and (bvsge (extraKeys!6403 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6403 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3133 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273548 () Bool)

(declare-fun res!846888 () Bool)

(assert (=> b!1273548 (=> (not res!846888) (not e!726640))))

(declare-fun size!40807 (LongMapFixedSize!6156) (_ BitVec 32))

(assert (=> b!1273548 (= res!846888 (= (size!40807 thiss!1551) (bvadd (_size!3133 thiss!1551) (bvsdiv (bvadd (extraKeys!6403 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273547 () Bool)

(declare-fun res!846890 () Bool)

(assert (=> b!1273547 (=> (not res!846890) (not e!726640))))

(assert (=> b!1273547 (= res!846890 (bvsge (size!40807 thiss!1551) (_size!3133 thiss!1551)))))

(declare-fun d!140005 () Bool)

(declare-fun res!846889 () Bool)

(assert (=> d!140005 (=> (not res!846889) (not e!726640))))

(assert (=> d!140005 (= res!846889 (validMask!0 (mask!34508 thiss!1551)))))

(assert (=> d!140005 (= (simpleValid!468 thiss!1551) e!726640)))

(assert (= (and d!140005 res!846889) b!1273546))

(assert (= (and b!1273546 res!846891) b!1273547))

(assert (= (and b!1273547 res!846890) b!1273548))

(assert (= (and b!1273548 res!846888) b!1273549))

(declare-fun m!1170691 () Bool)

(assert (=> b!1273548 m!1170691))

(assert (=> b!1273547 m!1170691))

(assert (=> d!140005 m!1170671))

(assert (=> start!107574 d!140005))

(declare-fun d!140007 () Bool)

(assert (=> d!140007 (= (validMask!0 (mask!34508 thiss!1551)) (and (or (= (mask!34508 thiss!1551) #b00000000000000000000000000000111) (= (mask!34508 thiss!1551) #b00000000000000000000000000001111) (= (mask!34508 thiss!1551) #b00000000000000000000000000011111) (= (mask!34508 thiss!1551) #b00000000000000000000000000111111) (= (mask!34508 thiss!1551) #b00000000000000000000000001111111) (= (mask!34508 thiss!1551) #b00000000000000000000000011111111) (= (mask!34508 thiss!1551) #b00000000000000000000000111111111) (= (mask!34508 thiss!1551) #b00000000000000000000001111111111) (= (mask!34508 thiss!1551) #b00000000000000000000011111111111) (= (mask!34508 thiss!1551) #b00000000000000000000111111111111) (= (mask!34508 thiss!1551) #b00000000000000000001111111111111) (= (mask!34508 thiss!1551) #b00000000000000000011111111111111) (= (mask!34508 thiss!1551) #b00000000000000000111111111111111) (= (mask!34508 thiss!1551) #b00000000000000001111111111111111) (= (mask!34508 thiss!1551) #b00000000000000011111111111111111) (= (mask!34508 thiss!1551) #b00000000000000111111111111111111) (= (mask!34508 thiss!1551) #b00000000000001111111111111111111) (= (mask!34508 thiss!1551) #b00000000000011111111111111111111) (= (mask!34508 thiss!1551) #b00000000000111111111111111111111) (= (mask!34508 thiss!1551) #b00000000001111111111111111111111) (= (mask!34508 thiss!1551) #b00000000011111111111111111111111) (= (mask!34508 thiss!1551) #b00000000111111111111111111111111) (= (mask!34508 thiss!1551) #b00000001111111111111111111111111) (= (mask!34508 thiss!1551) #b00000011111111111111111111111111) (= (mask!34508 thiss!1551) #b00000111111111111111111111111111) (= (mask!34508 thiss!1551) #b00001111111111111111111111111111) (= (mask!34508 thiss!1551) #b00011111111111111111111111111111) (= (mask!34508 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34508 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273519 d!140007))

(declare-fun d!140009 () Bool)

(assert (=> d!140009 (= (array_inv!30611 (_keys!12138 thiss!1551)) (bvsge (size!40804 (_keys!12138 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273514 d!140009))

(declare-fun d!140011 () Bool)

(assert (=> d!140011 (= (array_inv!30612 (_values!6747 thiss!1551)) (bvsge (size!40803 (_values!6747 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273514 d!140011))

(declare-fun d!140013 () Bool)

(declare-fun lt!575134 () (_ BitVec 32))

(assert (=> d!140013 (and (bvsge lt!575134 #b00000000000000000000000000000000) (bvsle lt!575134 (bvsub (size!40804 (_keys!12138 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!726646 () (_ BitVec 32))

(assert (=> d!140013 (= lt!575134 e!726646)))

(declare-fun c!123765 () Bool)

(assert (=> d!140013 (= c!123765 (bvsge #b00000000000000000000000000000000 (size!40804 (_keys!12138 thiss!1551))))))

(assert (=> d!140013 (and (bvsle #b00000000000000000000000000000000 (size!40804 (_keys!12138 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40804 (_keys!12138 thiss!1551)) (size!40804 (_keys!12138 thiss!1551))))))

(assert (=> d!140013 (= (arrayCountValidKeys!0 (_keys!12138 thiss!1551) #b00000000000000000000000000000000 (size!40804 (_keys!12138 thiss!1551))) lt!575134)))

(declare-fun b!1273558 () Bool)

(assert (=> b!1273558 (= e!726646 #b00000000000000000000000000000000)))

(declare-fun b!1273559 () Bool)

(declare-fun e!726645 () (_ BitVec 32))

(assert (=> b!1273559 (= e!726646 e!726645)))

(declare-fun c!123764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273559 (= c!123764 (validKeyInArray!0 (select (arr!40261 (_keys!12138 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273560 () Bool)

(declare-fun call!62600 () (_ BitVec 32))

(assert (=> b!1273560 (= e!726645 (bvadd #b00000000000000000000000000000001 call!62600))))

(declare-fun bm!62597 () Bool)

(assert (=> bm!62597 (= call!62600 (arrayCountValidKeys!0 (_keys!12138 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40804 (_keys!12138 thiss!1551))))))

(declare-fun b!1273561 () Bool)

(assert (=> b!1273561 (= e!726645 call!62600)))

(assert (= (and d!140013 c!123765) b!1273558))

(assert (= (and d!140013 (not c!123765)) b!1273559))

(assert (= (and b!1273559 c!123764) b!1273560))

(assert (= (and b!1273559 (not c!123764)) b!1273561))

(assert (= (or b!1273560 b!1273561) bm!62597))

(declare-fun m!1170693 () Bool)

(assert (=> b!1273559 m!1170693))

(assert (=> b!1273559 m!1170693))

(declare-fun m!1170695 () Bool)

(assert (=> b!1273559 m!1170695))

(declare-fun m!1170697 () Bool)

(assert (=> bm!62597 m!1170697))

(assert (=> b!1273517 d!140013))

(declare-fun mapNonEmpty!51280 () Bool)

(declare-fun mapRes!51280 () Bool)

(declare-fun tp!97747 () Bool)

(declare-fun e!726652 () Bool)

(assert (=> mapNonEmpty!51280 (= mapRes!51280 (and tp!97747 e!726652))))

(declare-fun mapValue!51280 () ValueCell!15696)

(declare-fun mapKey!51280 () (_ BitVec 32))

(declare-fun mapRest!51280 () (Array (_ BitVec 32) ValueCell!15696))

(assert (=> mapNonEmpty!51280 (= mapRest!51274 (store mapRest!51280 mapKey!51280 mapValue!51280))))

(declare-fun mapIsEmpty!51280 () Bool)

(assert (=> mapIsEmpty!51280 mapRes!51280))

(declare-fun b!1273569 () Bool)

(declare-fun e!726651 () Bool)

(assert (=> b!1273569 (= e!726651 tp_is_empty!33099)))

(declare-fun b!1273568 () Bool)

(assert (=> b!1273568 (= e!726652 tp_is_empty!33099)))

(declare-fun condMapEmpty!51280 () Bool)

(declare-fun mapDefault!51280 () ValueCell!15696)

(assert (=> mapNonEmpty!51274 (= condMapEmpty!51280 (= mapRest!51274 ((as const (Array (_ BitVec 32) ValueCell!15696)) mapDefault!51280)))))

(assert (=> mapNonEmpty!51274 (= tp!97737 (and e!726651 mapRes!51280))))

(assert (= (and mapNonEmpty!51274 condMapEmpty!51280) mapIsEmpty!51280))

(assert (= (and mapNonEmpty!51274 (not condMapEmpty!51280)) mapNonEmpty!51280))

(assert (= (and mapNonEmpty!51280 ((_ is ValueCellFull!15696) mapValue!51280)) b!1273568))

(assert (= (and mapNonEmpty!51274 ((_ is ValueCellFull!15696) mapDefault!51280)) b!1273569))

(declare-fun m!1170699 () Bool)

(assert (=> mapNonEmpty!51280 m!1170699))

(check-sat tp_is_empty!33099 (not b!1273548) b_and!45785 (not bm!62597) (not d!140005) (not b!1273547) (not b!1273559) (not b_next!27729) (not mapNonEmpty!51280))
(check-sat b_and!45785 (not b_next!27729))
