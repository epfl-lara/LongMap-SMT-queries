; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107558 () Bool)

(assert start!107558)

(declare-fun b!1273443 () Bool)

(declare-fun b_free!27723 () Bool)

(declare-fun b_next!27723 () Bool)

(assert (=> b!1273443 (= b_free!27723 (not b_next!27723))))

(declare-fun tp!97715 () Bool)

(declare-fun b_and!45779 () Bool)

(assert (=> b!1273443 (= tp!97715 b_and!45779)))

(declare-fun b!1273442 () Bool)

(declare-fun e!726551 () Bool)

(declare-fun tp_is_empty!33093 () Bool)

(assert (=> b!1273442 (= e!726551 tp_is_empty!33093)))

(declare-fun mapIsEmpty!51261 () Bool)

(declare-fun mapRes!51261 () Bool)

(assert (=> mapIsEmpty!51261 mapRes!51261))

(declare-fun e!726553 () Bool)

(declare-datatypes ((V!49317 0))(
  ( (V!49318 (val!16621 Int)) )
))
(declare-datatypes ((ValueCell!15693 0))(
  ( (ValueCellFull!15693 (v!19258 V!49317)) (EmptyCell!15693) )
))
(declare-datatypes ((array!83458 0))(
  ( (array!83459 (arr!40254 (Array (_ BitVec 32) ValueCell!15693)) (size!40796 (_ BitVec 32))) )
))
(declare-datatypes ((array!83460 0))(
  ( (array!83461 (arr!40255 (Array (_ BitVec 32) (_ BitVec 64))) (size!40797 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6150 0))(
  ( (LongMapFixedSize!6151 (defaultEntry!6721 Int) (mask!34502 (_ BitVec 32)) (extraKeys!6400 (_ BitVec 32)) (zeroValue!6506 V!49317) (minValue!6506 V!49317) (_size!3130 (_ BitVec 32)) (_keys!12135 array!83460) (_values!6744 array!83458) (_vacant!3130 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6150)

(declare-fun e!726549 () Bool)

(declare-fun array_inv!30605 (array!83460) Bool)

(declare-fun array_inv!30606 (array!83458) Bool)

(assert (=> b!1273443 (= e!726549 (and tp!97715 tp_is_empty!33093 (array_inv!30605 (_keys!12135 thiss!1551)) (array_inv!30606 (_values!6744 thiss!1551)) e!726553))))

(declare-fun b!1273444 () Bool)

(declare-fun e!726554 () Bool)

(assert (=> b!1273444 (= e!726554 (and (bvsle #b00000000000000000000000000000000 (size!40797 (_keys!12135 thiss!1551))) (bvsge (size!40797 (_keys!12135 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1273445 () Bool)

(assert (=> b!1273445 (= e!726553 (and e!726551 mapRes!51261))))

(declare-fun condMapEmpty!51261 () Bool)

(declare-fun mapDefault!51261 () ValueCell!15693)

(assert (=> b!1273445 (= condMapEmpty!51261 (= (arr!40254 (_values!6744 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15693)) mapDefault!51261)))))

(declare-fun res!846846 () Bool)

(assert (=> start!107558 (=> (not res!846846) (not e!726554))))

(declare-fun simpleValid!465 (LongMapFixedSize!6150) Bool)

(assert (=> start!107558 (= res!846846 (simpleValid!465 thiss!1551))))

(assert (=> start!107558 e!726554))

(assert (=> start!107558 e!726549))

(declare-fun b!1273446 () Bool)

(declare-fun e!726550 () Bool)

(assert (=> b!1273446 (= e!726550 tp_is_empty!33093)))

(declare-fun mapNonEmpty!51261 () Bool)

(declare-fun tp!97716 () Bool)

(assert (=> mapNonEmpty!51261 (= mapRes!51261 (and tp!97716 e!726550))))

(declare-fun mapKey!51261 () (_ BitVec 32))

(declare-fun mapValue!51261 () ValueCell!15693)

(declare-fun mapRest!51261 () (Array (_ BitVec 32) ValueCell!15693))

(assert (=> mapNonEmpty!51261 (= (arr!40254 (_values!6744 thiss!1551)) (store mapRest!51261 mapKey!51261 mapValue!51261))))

(assert (= (and start!107558 res!846846) b!1273444))

(assert (= (and b!1273445 condMapEmpty!51261) mapIsEmpty!51261))

(assert (= (and b!1273445 (not condMapEmpty!51261)) mapNonEmpty!51261))

(get-info :version)

(assert (= (and mapNonEmpty!51261 ((_ is ValueCellFull!15693) mapValue!51261)) b!1273446))

(assert (= (and b!1273445 ((_ is ValueCellFull!15693) mapDefault!51261)) b!1273442))

(assert (= b!1273443 b!1273445))

(assert (= start!107558 b!1273443))

(declare-fun m!1170631 () Bool)

(assert (=> b!1273443 m!1170631))

(declare-fun m!1170633 () Bool)

(assert (=> b!1273443 m!1170633))

(declare-fun m!1170635 () Bool)

(assert (=> start!107558 m!1170635))

(declare-fun m!1170637 () Bool)

(assert (=> mapNonEmpty!51261 m!1170637))

(check-sat (not b!1273443) b_and!45779 (not b_next!27723) tp_is_empty!33093 (not mapNonEmpty!51261) (not start!107558))
(check-sat b_and!45779 (not b_next!27723))
(get-model)

(declare-fun b!1273472 () Bool)

(declare-fun res!846861 () Bool)

(declare-fun e!726575 () Bool)

(assert (=> b!1273472 (=> (not res!846861) (not e!726575))))

(declare-fun size!40800 (LongMapFixedSize!6150) (_ BitVec 32))

(assert (=> b!1273472 (= res!846861 (= (size!40800 thiss!1551) (bvadd (_size!3130 thiss!1551) (bvsdiv (bvadd (extraKeys!6400 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273471 () Bool)

(declare-fun res!846858 () Bool)

(assert (=> b!1273471 (=> (not res!846858) (not e!726575))))

(assert (=> b!1273471 (= res!846858 (bvsge (size!40800 thiss!1551) (_size!3130 thiss!1551)))))

(declare-fun d!139993 () Bool)

(declare-fun res!846860 () Bool)

(assert (=> d!139993 (=> (not res!846860) (not e!726575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139993 (= res!846860 (validMask!0 (mask!34502 thiss!1551)))))

(assert (=> d!139993 (= (simpleValid!465 thiss!1551) e!726575)))

(declare-fun b!1273473 () Bool)

(assert (=> b!1273473 (= e!726575 (and (bvsge (extraKeys!6400 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6400 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3130 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273470 () Bool)

(declare-fun res!846859 () Bool)

(assert (=> b!1273470 (=> (not res!846859) (not e!726575))))

(assert (=> b!1273470 (= res!846859 (and (= (size!40796 (_values!6744 thiss!1551)) (bvadd (mask!34502 thiss!1551) #b00000000000000000000000000000001)) (= (size!40797 (_keys!12135 thiss!1551)) (size!40796 (_values!6744 thiss!1551))) (bvsge (_size!3130 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3130 thiss!1551) (bvadd (mask!34502 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!139993 res!846860) b!1273470))

(assert (= (and b!1273470 res!846859) b!1273471))

(assert (= (and b!1273471 res!846858) b!1273472))

(assert (= (and b!1273472 res!846861) b!1273473))

(declare-fun m!1170647 () Bool)

(assert (=> b!1273472 m!1170647))

(assert (=> b!1273471 m!1170647))

(declare-fun m!1170649 () Bool)

(assert (=> d!139993 m!1170649))

(assert (=> start!107558 d!139993))

(declare-fun d!139995 () Bool)

(assert (=> d!139995 (= (array_inv!30605 (_keys!12135 thiss!1551)) (bvsge (size!40797 (_keys!12135 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273443 d!139995))

(declare-fun d!139997 () Bool)

(assert (=> d!139997 (= (array_inv!30606 (_values!6744 thiss!1551)) (bvsge (size!40796 (_values!6744 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273443 d!139997))

(declare-fun condMapEmpty!51267 () Bool)

(declare-fun mapDefault!51267 () ValueCell!15693)

(assert (=> mapNonEmpty!51261 (= condMapEmpty!51267 (= mapRest!51261 ((as const (Array (_ BitVec 32) ValueCell!15693)) mapDefault!51267)))))

(declare-fun e!726581 () Bool)

(declare-fun mapRes!51267 () Bool)

(assert (=> mapNonEmpty!51261 (= tp!97716 (and e!726581 mapRes!51267))))

(declare-fun b!1273481 () Bool)

(assert (=> b!1273481 (= e!726581 tp_is_empty!33093)))

(declare-fun b!1273480 () Bool)

(declare-fun e!726580 () Bool)

(assert (=> b!1273480 (= e!726580 tp_is_empty!33093)))

(declare-fun mapIsEmpty!51267 () Bool)

(assert (=> mapIsEmpty!51267 mapRes!51267))

(declare-fun mapNonEmpty!51267 () Bool)

(declare-fun tp!97725 () Bool)

(assert (=> mapNonEmpty!51267 (= mapRes!51267 (and tp!97725 e!726580))))

(declare-fun mapRest!51267 () (Array (_ BitVec 32) ValueCell!15693))

(declare-fun mapKey!51267 () (_ BitVec 32))

(declare-fun mapValue!51267 () ValueCell!15693)

(assert (=> mapNonEmpty!51267 (= mapRest!51261 (store mapRest!51267 mapKey!51267 mapValue!51267))))

(assert (= (and mapNonEmpty!51261 condMapEmpty!51267) mapIsEmpty!51267))

(assert (= (and mapNonEmpty!51261 (not condMapEmpty!51267)) mapNonEmpty!51267))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15693) mapValue!51267)) b!1273480))

(assert (= (and mapNonEmpty!51261 ((_ is ValueCellFull!15693) mapDefault!51267)) b!1273481))

(declare-fun m!1170651 () Bool)

(assert (=> mapNonEmpty!51267 m!1170651))

(check-sat b_and!45779 (not b_next!27723) tp_is_empty!33093 (not mapNonEmpty!51267) (not d!139993) (not b!1273472) (not b!1273471))
(check-sat b_and!45779 (not b_next!27723))
(get-model)

(declare-fun d!139999 () Bool)

(assert (=> d!139999 (= (size!40800 thiss!1551) (bvadd (_size!3130 thiss!1551) (bvsdiv (bvadd (extraKeys!6400 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1273472 d!139999))

(assert (=> b!1273471 d!139999))

(declare-fun d!140001 () Bool)

(assert (=> d!140001 (= (validMask!0 (mask!34502 thiss!1551)) (and (or (= (mask!34502 thiss!1551) #b00000000000000000000000000000111) (= (mask!34502 thiss!1551) #b00000000000000000000000000001111) (= (mask!34502 thiss!1551) #b00000000000000000000000000011111) (= (mask!34502 thiss!1551) #b00000000000000000000000000111111) (= (mask!34502 thiss!1551) #b00000000000000000000000001111111) (= (mask!34502 thiss!1551) #b00000000000000000000000011111111) (= (mask!34502 thiss!1551) #b00000000000000000000000111111111) (= (mask!34502 thiss!1551) #b00000000000000000000001111111111) (= (mask!34502 thiss!1551) #b00000000000000000000011111111111) (= (mask!34502 thiss!1551) #b00000000000000000000111111111111) (= (mask!34502 thiss!1551) #b00000000000000000001111111111111) (= (mask!34502 thiss!1551) #b00000000000000000011111111111111) (= (mask!34502 thiss!1551) #b00000000000000000111111111111111) (= (mask!34502 thiss!1551) #b00000000000000001111111111111111) (= (mask!34502 thiss!1551) #b00000000000000011111111111111111) (= (mask!34502 thiss!1551) #b00000000000000111111111111111111) (= (mask!34502 thiss!1551) #b00000000000001111111111111111111) (= (mask!34502 thiss!1551) #b00000000000011111111111111111111) (= (mask!34502 thiss!1551) #b00000000000111111111111111111111) (= (mask!34502 thiss!1551) #b00000000001111111111111111111111) (= (mask!34502 thiss!1551) #b00000000011111111111111111111111) (= (mask!34502 thiss!1551) #b00000000111111111111111111111111) (= (mask!34502 thiss!1551) #b00000001111111111111111111111111) (= (mask!34502 thiss!1551) #b00000011111111111111111111111111) (= (mask!34502 thiss!1551) #b00000111111111111111111111111111) (= (mask!34502 thiss!1551) #b00001111111111111111111111111111) (= (mask!34502 thiss!1551) #b00011111111111111111111111111111) (= (mask!34502 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34502 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!139993 d!140001))

(declare-fun condMapEmpty!51268 () Bool)

(declare-fun mapDefault!51268 () ValueCell!15693)

(assert (=> mapNonEmpty!51267 (= condMapEmpty!51268 (= mapRest!51267 ((as const (Array (_ BitVec 32) ValueCell!15693)) mapDefault!51268)))))

(declare-fun e!726583 () Bool)

(declare-fun mapRes!51268 () Bool)

(assert (=> mapNonEmpty!51267 (= tp!97725 (and e!726583 mapRes!51268))))

(declare-fun b!1273483 () Bool)

(assert (=> b!1273483 (= e!726583 tp_is_empty!33093)))

(declare-fun b!1273482 () Bool)

(declare-fun e!726582 () Bool)

(assert (=> b!1273482 (= e!726582 tp_is_empty!33093)))

(declare-fun mapIsEmpty!51268 () Bool)

(assert (=> mapIsEmpty!51268 mapRes!51268))

(declare-fun mapNonEmpty!51268 () Bool)

(declare-fun tp!97726 () Bool)

(assert (=> mapNonEmpty!51268 (= mapRes!51268 (and tp!97726 e!726582))))

(declare-fun mapRest!51268 () (Array (_ BitVec 32) ValueCell!15693))

(declare-fun mapKey!51268 () (_ BitVec 32))

(declare-fun mapValue!51268 () ValueCell!15693)

(assert (=> mapNonEmpty!51268 (= mapRest!51267 (store mapRest!51268 mapKey!51268 mapValue!51268))))

(assert (= (and mapNonEmpty!51267 condMapEmpty!51268) mapIsEmpty!51268))

(assert (= (and mapNonEmpty!51267 (not condMapEmpty!51268)) mapNonEmpty!51268))

(assert (= (and mapNonEmpty!51268 ((_ is ValueCellFull!15693) mapValue!51268)) b!1273482))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15693) mapDefault!51268)) b!1273483))

(declare-fun m!1170653 () Bool)

(assert (=> mapNonEmpty!51268 m!1170653))

(check-sat (not mapNonEmpty!51268) tp_is_empty!33093 b_and!45779 (not b_next!27723))
(check-sat b_and!45779 (not b_next!27723))
