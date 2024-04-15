; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107572 () Bool)

(assert start!107572)

(declare-fun b!1273432 () Bool)

(declare-fun b_free!27727 () Bool)

(declare-fun b_next!27727 () Bool)

(assert (=> b!1273432 (= b_free!27727 (not b_next!27727))))

(declare-fun tp!97733 () Bool)

(declare-fun b_and!45765 () Bool)

(assert (=> b!1273432 (= tp!97733 b_and!45765)))

(declare-fun mapNonEmpty!51271 () Bool)

(declare-fun mapRes!51271 () Bool)

(declare-fun tp!97732 () Bool)

(declare-fun e!726568 () Bool)

(assert (=> mapNonEmpty!51271 (= mapRes!51271 (and tp!97732 e!726568))))

(declare-datatypes ((V!49323 0))(
  ( (V!49324 (val!16623 Int)) )
))
(declare-datatypes ((ValueCell!15695 0))(
  ( (ValueCellFull!15695 (v!19259 V!49323)) (EmptyCell!15695) )
))
(declare-fun mapValue!51271 () ValueCell!15695)

(declare-fun mapKey!51271 () (_ BitVec 32))

(declare-datatypes ((array!83367 0))(
  ( (array!83368 (arr!40208 (Array (_ BitVec 32) ValueCell!15695)) (size!40753 (_ BitVec 32))) )
))
(declare-datatypes ((array!83369 0))(
  ( (array!83370 (arr!40209 (Array (_ BitVec 32) (_ BitVec 64))) (size!40754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6154 0))(
  ( (LongMapFixedSize!6155 (defaultEntry!6723 Int) (mask!34502 (_ BitVec 32)) (extraKeys!6402 (_ BitVec 32)) (zeroValue!6508 V!49323) (minValue!6508 V!49323) (_size!3132 (_ BitVec 32)) (_keys!12133 array!83369) (_values!6746 array!83367) (_vacant!3132 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6154)

(declare-fun mapRest!51271 () (Array (_ BitVec 32) ValueCell!15695))

(assert (=> mapNonEmpty!51271 (= (arr!40208 (_values!6746 thiss!1551)) (store mapRest!51271 mapKey!51271 mapValue!51271))))

(declare-fun e!726571 () Bool)

(declare-fun tp_is_empty!33097 () Bool)

(declare-fun e!726569 () Bool)

(declare-fun array_inv!30723 (array!83369) Bool)

(declare-fun array_inv!30724 (array!83367) Bool)

(assert (=> b!1273432 (= e!726571 (and tp!97733 tp_is_empty!33097 (array_inv!30723 (_keys!12133 thiss!1551)) (array_inv!30724 (_values!6746 thiss!1551)) e!726569))))

(declare-fun res!846840 () Bool)

(declare-fun e!726572 () Bool)

(assert (=> start!107572 (=> (not res!846840) (not e!726572))))

(declare-fun simpleValid!468 (LongMapFixedSize!6154) Bool)

(assert (=> start!107572 (= res!846840 (simpleValid!468 thiss!1551))))

(assert (=> start!107572 e!726572))

(assert (=> start!107572 e!726571))

(declare-fun b!1273433 () Bool)

(declare-fun e!726567 () Bool)

(assert (=> b!1273433 (= e!726569 (and e!726567 mapRes!51271))))

(declare-fun condMapEmpty!51271 () Bool)

(declare-fun mapDefault!51271 () ValueCell!15695)

(assert (=> b!1273433 (= condMapEmpty!51271 (= (arr!40208 (_values!6746 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15695)) mapDefault!51271)))))

(declare-fun b!1273434 () Bool)

(assert (=> b!1273434 (= e!726568 tp_is_empty!33097)))

(declare-fun mapIsEmpty!51271 () Bool)

(assert (=> mapIsEmpty!51271 mapRes!51271))

(declare-fun b!1273435 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273435 (= e!726572 (not (validMask!0 (mask!34502 thiss!1551))))))

(declare-fun b!1273436 () Bool)

(assert (=> b!1273436 (= e!726567 tp_is_empty!33097)))

(declare-fun b!1273437 () Bool)

(declare-fun res!846839 () Bool)

(assert (=> b!1273437 (=> (not res!846839) (not e!726572))))

(declare-fun arrayCountValidKeys!0 (array!83369 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273437 (= res!846839 (= (arrayCountValidKeys!0 (_keys!12133 thiss!1551) #b00000000000000000000000000000000 (size!40754 (_keys!12133 thiss!1551))) (_size!3132 thiss!1551)))))

(assert (= (and start!107572 res!846840) b!1273437))

(assert (= (and b!1273437 res!846839) b!1273435))

(assert (= (and b!1273433 condMapEmpty!51271) mapIsEmpty!51271))

(assert (= (and b!1273433 (not condMapEmpty!51271)) mapNonEmpty!51271))

(get-info :version)

(assert (= (and mapNonEmpty!51271 ((_ is ValueCellFull!15695) mapValue!51271)) b!1273434))

(assert (= (and b!1273433 ((_ is ValueCellFull!15695) mapDefault!51271)) b!1273436))

(assert (= b!1273432 b!1273433))

(assert (= start!107572 b!1273432))

(declare-fun m!1170155 () Bool)

(assert (=> b!1273435 m!1170155))

(declare-fun m!1170157 () Bool)

(assert (=> mapNonEmpty!51271 m!1170157))

(declare-fun m!1170159 () Bool)

(assert (=> start!107572 m!1170159))

(declare-fun m!1170161 () Bool)

(assert (=> b!1273432 m!1170161))

(declare-fun m!1170163 () Bool)

(assert (=> b!1273432 m!1170163))

(declare-fun m!1170165 () Bool)

(assert (=> b!1273437 m!1170165))

(check-sat b_and!45765 (not b_next!27727) (not b!1273435) (not start!107572) (not mapNonEmpty!51271) (not b!1273432) (not b!1273437) tp_is_empty!33097)
(check-sat b_and!45765 (not b_next!27727))
(get-model)

(declare-fun d!139893 () Bool)

(assert (=> d!139893 (= (array_inv!30723 (_keys!12133 thiss!1551)) (bvsge (size!40754 (_keys!12133 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273432 d!139893))

(declare-fun d!139895 () Bool)

(assert (=> d!139895 (= (array_inv!30724 (_values!6746 thiss!1551)) (bvsge (size!40753 (_values!6746 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273432 d!139895))

(declare-fun b!1273482 () Bool)

(declare-fun e!726614 () (_ BitVec 32))

(declare-fun call!62581 () (_ BitVec 32))

(assert (=> b!1273482 (= e!726614 call!62581)))

(declare-fun b!1273483 () Bool)

(assert (=> b!1273483 (= e!726614 (bvadd #b00000000000000000000000000000001 call!62581))))

(declare-fun b!1273484 () Bool)

(declare-fun e!726613 () (_ BitVec 32))

(assert (=> b!1273484 (= e!726613 e!726614)))

(declare-fun c!123748 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273484 (= c!123748 (validKeyInArray!0 (select (arr!40209 (_keys!12133 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun bm!62578 () Bool)

(assert (=> bm!62578 (= call!62581 (arrayCountValidKeys!0 (_keys!12133 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40754 (_keys!12133 thiss!1551))))))

(declare-fun d!139897 () Bool)

(declare-fun lt!574956 () (_ BitVec 32))

(assert (=> d!139897 (and (bvsge lt!574956 #b00000000000000000000000000000000) (bvsle lt!574956 (bvsub (size!40754 (_keys!12133 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139897 (= lt!574956 e!726613)))

(declare-fun c!123749 () Bool)

(assert (=> d!139897 (= c!123749 (bvsge #b00000000000000000000000000000000 (size!40754 (_keys!12133 thiss!1551))))))

(assert (=> d!139897 (and (bvsle #b00000000000000000000000000000000 (size!40754 (_keys!12133 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40754 (_keys!12133 thiss!1551)) (size!40754 (_keys!12133 thiss!1551))))))

(assert (=> d!139897 (= (arrayCountValidKeys!0 (_keys!12133 thiss!1551) #b00000000000000000000000000000000 (size!40754 (_keys!12133 thiss!1551))) lt!574956)))

(declare-fun b!1273485 () Bool)

(assert (=> b!1273485 (= e!726613 #b00000000000000000000000000000000)))

(assert (= (and d!139897 c!123749) b!1273485))

(assert (= (and d!139897 (not c!123749)) b!1273484))

(assert (= (and b!1273484 c!123748) b!1273483))

(assert (= (and b!1273484 (not c!123748)) b!1273482))

(assert (= (or b!1273483 b!1273482) bm!62578))

(declare-fun m!1170191 () Bool)

(assert (=> b!1273484 m!1170191))

(assert (=> b!1273484 m!1170191))

(declare-fun m!1170193 () Bool)

(assert (=> b!1273484 m!1170193))

(declare-fun m!1170195 () Bool)

(assert (=> bm!62578 m!1170195))

(assert (=> b!1273437 d!139897))

(declare-fun d!139899 () Bool)

(assert (=> d!139899 (= (validMask!0 (mask!34502 thiss!1551)) (and (or (= (mask!34502 thiss!1551) #b00000000000000000000000000000111) (= (mask!34502 thiss!1551) #b00000000000000000000000000001111) (= (mask!34502 thiss!1551) #b00000000000000000000000000011111) (= (mask!34502 thiss!1551) #b00000000000000000000000000111111) (= (mask!34502 thiss!1551) #b00000000000000000000000001111111) (= (mask!34502 thiss!1551) #b00000000000000000000000011111111) (= (mask!34502 thiss!1551) #b00000000000000000000000111111111) (= (mask!34502 thiss!1551) #b00000000000000000000001111111111) (= (mask!34502 thiss!1551) #b00000000000000000000011111111111) (= (mask!34502 thiss!1551) #b00000000000000000000111111111111) (= (mask!34502 thiss!1551) #b00000000000000000001111111111111) (= (mask!34502 thiss!1551) #b00000000000000000011111111111111) (= (mask!34502 thiss!1551) #b00000000000000000111111111111111) (= (mask!34502 thiss!1551) #b00000000000000001111111111111111) (= (mask!34502 thiss!1551) #b00000000000000011111111111111111) (= (mask!34502 thiss!1551) #b00000000000000111111111111111111) (= (mask!34502 thiss!1551) #b00000000000001111111111111111111) (= (mask!34502 thiss!1551) #b00000000000011111111111111111111) (= (mask!34502 thiss!1551) #b00000000000111111111111111111111) (= (mask!34502 thiss!1551) #b00000000001111111111111111111111) (= (mask!34502 thiss!1551) #b00000000011111111111111111111111) (= (mask!34502 thiss!1551) #b00000000111111111111111111111111) (= (mask!34502 thiss!1551) #b00000001111111111111111111111111) (= (mask!34502 thiss!1551) #b00000011111111111111111111111111) (= (mask!34502 thiss!1551) #b00000111111111111111111111111111) (= (mask!34502 thiss!1551) #b00001111111111111111111111111111) (= (mask!34502 thiss!1551) #b00011111111111111111111111111111) (= (mask!34502 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34502 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273435 d!139899))

(declare-fun d!139901 () Bool)

(declare-fun res!846863 () Bool)

(declare-fun e!726617 () Bool)

(assert (=> d!139901 (=> (not res!846863) (not e!726617))))

(assert (=> d!139901 (= res!846863 (validMask!0 (mask!34502 thiss!1551)))))

(assert (=> d!139901 (= (simpleValid!468 thiss!1551) e!726617)))

(declare-fun b!1273496 () Bool)

(declare-fun res!846864 () Bool)

(assert (=> b!1273496 (=> (not res!846864) (not e!726617))))

(declare-fun size!40759 (LongMapFixedSize!6154) (_ BitVec 32))

(assert (=> b!1273496 (= res!846864 (= (size!40759 thiss!1551) (bvadd (_size!3132 thiss!1551) (bvsdiv (bvadd (extraKeys!6402 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273495 () Bool)

(declare-fun res!846862 () Bool)

(assert (=> b!1273495 (=> (not res!846862) (not e!726617))))

(assert (=> b!1273495 (= res!846862 (bvsge (size!40759 thiss!1551) (_size!3132 thiss!1551)))))

(declare-fun b!1273497 () Bool)

(assert (=> b!1273497 (= e!726617 (and (bvsge (extraKeys!6402 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6402 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3132 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273494 () Bool)

(declare-fun res!846861 () Bool)

(assert (=> b!1273494 (=> (not res!846861) (not e!726617))))

(assert (=> b!1273494 (= res!846861 (and (= (size!40753 (_values!6746 thiss!1551)) (bvadd (mask!34502 thiss!1551) #b00000000000000000000000000000001)) (= (size!40754 (_keys!12133 thiss!1551)) (size!40753 (_values!6746 thiss!1551))) (bvsge (_size!3132 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3132 thiss!1551) (bvadd (mask!34502 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!139901 res!846863) b!1273494))

(assert (= (and b!1273494 res!846861) b!1273495))

(assert (= (and b!1273495 res!846862) b!1273496))

(assert (= (and b!1273496 res!846864) b!1273497))

(assert (=> d!139901 m!1170155))

(declare-fun m!1170197 () Bool)

(assert (=> b!1273496 m!1170197))

(assert (=> b!1273495 m!1170197))

(assert (=> start!107572 d!139901))

(declare-fun b!1273505 () Bool)

(declare-fun e!726623 () Bool)

(assert (=> b!1273505 (= e!726623 tp_is_empty!33097)))

(declare-fun mapNonEmpty!51280 () Bool)

(declare-fun mapRes!51280 () Bool)

(declare-fun tp!97748 () Bool)

(declare-fun e!726622 () Bool)

(assert (=> mapNonEmpty!51280 (= mapRes!51280 (and tp!97748 e!726622))))

(declare-fun mapRest!51280 () (Array (_ BitVec 32) ValueCell!15695))

(declare-fun mapKey!51280 () (_ BitVec 32))

(declare-fun mapValue!51280 () ValueCell!15695)

(assert (=> mapNonEmpty!51280 (= mapRest!51271 (store mapRest!51280 mapKey!51280 mapValue!51280))))

(declare-fun b!1273504 () Bool)

(assert (=> b!1273504 (= e!726622 tp_is_empty!33097)))

(declare-fun mapIsEmpty!51280 () Bool)

(assert (=> mapIsEmpty!51280 mapRes!51280))

(declare-fun condMapEmpty!51280 () Bool)

(declare-fun mapDefault!51280 () ValueCell!15695)

(assert (=> mapNonEmpty!51271 (= condMapEmpty!51280 (= mapRest!51271 ((as const (Array (_ BitVec 32) ValueCell!15695)) mapDefault!51280)))))

(assert (=> mapNonEmpty!51271 (= tp!97732 (and e!726623 mapRes!51280))))

(assert (= (and mapNonEmpty!51271 condMapEmpty!51280) mapIsEmpty!51280))

(assert (= (and mapNonEmpty!51271 (not condMapEmpty!51280)) mapNonEmpty!51280))

(assert (= (and mapNonEmpty!51280 ((_ is ValueCellFull!15695) mapValue!51280)) b!1273504))

(assert (= (and mapNonEmpty!51271 ((_ is ValueCellFull!15695) mapDefault!51280)) b!1273505))

(declare-fun m!1170199 () Bool)

(assert (=> mapNonEmpty!51280 m!1170199))

(check-sat (not b_next!27727) (not d!139901) (not b!1273495) (not b!1273496) (not b!1273484) (not mapNonEmpty!51280) tp_is_empty!33097 b_and!45765 (not bm!62578))
(check-sat b_and!45765 (not b_next!27727))
