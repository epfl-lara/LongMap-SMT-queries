; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107556 () Bool)

(assert start!107556)

(declare-fun b!1273365 () Bool)

(declare-fun b_free!27721 () Bool)

(declare-fun b_next!27721 () Bool)

(assert (=> b!1273365 (= b_free!27721 (not b_next!27721))))

(declare-fun tp!97711 () Bool)

(declare-fun b_and!45759 () Bool)

(assert (=> b!1273365 (= tp!97711 b_and!45759)))

(declare-fun b!1273363 () Bool)

(declare-fun e!726504 () Bool)

(declare-fun e!726506 () Bool)

(declare-fun mapRes!51258 () Bool)

(assert (=> b!1273363 (= e!726504 (and e!726506 mapRes!51258))))

(declare-fun condMapEmpty!51258 () Bool)

(declare-datatypes ((V!49315 0))(
  ( (V!49316 (val!16620 Int)) )
))
(declare-datatypes ((ValueCell!15692 0))(
  ( (ValueCellFull!15692 (v!19256 V!49315)) (EmptyCell!15692) )
))
(declare-datatypes ((array!83353 0))(
  ( (array!83354 (arr!40202 (Array (_ BitVec 32) ValueCell!15692)) (size!40746 (_ BitVec 32))) )
))
(declare-datatypes ((array!83355 0))(
  ( (array!83356 (arr!40203 (Array (_ BitVec 32) (_ BitVec 64))) (size!40747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6148 0))(
  ( (LongMapFixedSize!6149 (defaultEntry!6720 Int) (mask!34496 (_ BitVec 32)) (extraKeys!6399 (_ BitVec 32)) (zeroValue!6505 V!49315) (minValue!6505 V!49315) (_size!3129 (_ BitVec 32)) (_keys!12130 array!83355) (_values!6743 array!83353) (_vacant!3129 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6148)

(declare-fun mapDefault!51258 () ValueCell!15692)

(assert (=> b!1273363 (= condMapEmpty!51258 (= (arr!40202 (_values!6743 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51258)))))

(declare-fun res!846816 () Bool)

(declare-fun e!726502 () Bool)

(assert (=> start!107556 (=> (not res!846816) (not e!726502))))

(declare-fun simpleValid!466 (LongMapFixedSize!6148) Bool)

(assert (=> start!107556 (= res!846816 (simpleValid!466 thiss!1551))))

(assert (=> start!107556 e!726502))

(declare-fun e!726507 () Bool)

(assert (=> start!107556 e!726507))

(declare-fun b!1273364 () Bool)

(declare-fun e!726505 () Bool)

(declare-fun tp_is_empty!33091 () Bool)

(assert (=> b!1273364 (= e!726505 tp_is_empty!33091)))

(declare-fun mapNonEmpty!51258 () Bool)

(declare-fun tp!97710 () Bool)

(assert (=> mapNonEmpty!51258 (= mapRes!51258 (and tp!97710 e!726505))))

(declare-fun mapValue!51258 () ValueCell!15692)

(declare-fun mapRest!51258 () (Array (_ BitVec 32) ValueCell!15692))

(declare-fun mapKey!51258 () (_ BitVec 32))

(assert (=> mapNonEmpty!51258 (= (arr!40202 (_values!6743 thiss!1551)) (store mapRest!51258 mapKey!51258 mapValue!51258))))

(declare-fun array_inv!30719 (array!83355) Bool)

(declare-fun array_inv!30720 (array!83353) Bool)

(assert (=> b!1273365 (= e!726507 (and tp!97711 tp_is_empty!33091 (array_inv!30719 (_keys!12130 thiss!1551)) (array_inv!30720 (_values!6743 thiss!1551)) e!726504))))

(declare-fun b!1273366 () Bool)

(assert (=> b!1273366 (= e!726502 (and (bvsle #b00000000000000000000000000000000 (size!40747 (_keys!12130 thiss!1551))) (bvsge (size!40747 (_keys!12130 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!51258 () Bool)

(assert (=> mapIsEmpty!51258 mapRes!51258))

(declare-fun b!1273367 () Bool)

(assert (=> b!1273367 (= e!726506 tp_is_empty!33091)))

(assert (= (and start!107556 res!846816) b!1273366))

(assert (= (and b!1273363 condMapEmpty!51258) mapIsEmpty!51258))

(assert (= (and b!1273363 (not condMapEmpty!51258)) mapNonEmpty!51258))

(get-info :version)

(assert (= (and mapNonEmpty!51258 ((_ is ValueCellFull!15692) mapValue!51258)) b!1273364))

(assert (= (and b!1273363 ((_ is ValueCellFull!15692) mapDefault!51258)) b!1273367))

(assert (= b!1273365 b!1273363))

(assert (= start!107556 b!1273365))

(declare-fun m!1170123 () Bool)

(assert (=> start!107556 m!1170123))

(declare-fun m!1170125 () Bool)

(assert (=> mapNonEmpty!51258 m!1170125))

(declare-fun m!1170127 () Bool)

(assert (=> b!1273365 m!1170127))

(declare-fun m!1170129 () Bool)

(assert (=> b!1273365 m!1170129))

(check-sat (not mapNonEmpty!51258) tp_is_empty!33091 (not b_next!27721) b_and!45759 (not b!1273365) (not start!107556))
(check-sat b_and!45759 (not b_next!27721))
(get-model)

(declare-fun b!1273406 () Bool)

(declare-fun res!846831 () Bool)

(declare-fun e!726546 () Bool)

(assert (=> b!1273406 (=> (not res!846831) (not e!726546))))

(assert (=> b!1273406 (= res!846831 (and (= (size!40746 (_values!6743 thiss!1551)) (bvadd (mask!34496 thiss!1551) #b00000000000000000000000000000001)) (= (size!40747 (_keys!12130 thiss!1551)) (size!40746 (_values!6743 thiss!1551))) (bvsge (_size!3129 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3129 thiss!1551) (bvadd (mask!34496 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273407 () Bool)

(declare-fun res!846834 () Bool)

(assert (=> b!1273407 (=> (not res!846834) (not e!726546))))

(declare-fun size!40752 (LongMapFixedSize!6148) (_ BitVec 32))

(assert (=> b!1273407 (= res!846834 (bvsge (size!40752 thiss!1551) (_size!3129 thiss!1551)))))

(declare-fun b!1273408 () Bool)

(declare-fun res!846832 () Bool)

(assert (=> b!1273408 (=> (not res!846832) (not e!726546))))

(assert (=> b!1273408 (= res!846832 (= (size!40752 thiss!1551) (bvadd (_size!3129 thiss!1551) (bvsdiv (bvadd (extraKeys!6399 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!139881 () Bool)

(declare-fun res!846833 () Bool)

(assert (=> d!139881 (=> (not res!846833) (not e!726546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139881 (= res!846833 (validMask!0 (mask!34496 thiss!1551)))))

(assert (=> d!139881 (= (simpleValid!466 thiss!1551) e!726546)))

(declare-fun b!1273409 () Bool)

(assert (=> b!1273409 (= e!726546 (and (bvsge (extraKeys!6399 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6399 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3129 thiss!1551) #b00000000000000000000000000000000)))))

(assert (= (and d!139881 res!846833) b!1273406))

(assert (= (and b!1273406 res!846831) b!1273407))

(assert (= (and b!1273407 res!846834) b!1273408))

(assert (= (and b!1273408 res!846832) b!1273409))

(declare-fun m!1170147 () Bool)

(assert (=> b!1273407 m!1170147))

(assert (=> b!1273408 m!1170147))

(declare-fun m!1170149 () Bool)

(assert (=> d!139881 m!1170149))

(assert (=> start!107556 d!139881))

(declare-fun d!139883 () Bool)

(assert (=> d!139883 (= (array_inv!30719 (_keys!12130 thiss!1551)) (bvsge (size!40747 (_keys!12130 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273365 d!139883))

(declare-fun d!139885 () Bool)

(assert (=> d!139885 (= (array_inv!30720 (_values!6743 thiss!1551)) (bvsge (size!40746 (_values!6743 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273365 d!139885))

(declare-fun b!1273417 () Bool)

(declare-fun e!726552 () Bool)

(assert (=> b!1273417 (= e!726552 tp_is_empty!33091)))

(declare-fun condMapEmpty!51267 () Bool)

(declare-fun mapDefault!51267 () ValueCell!15692)

(assert (=> mapNonEmpty!51258 (= condMapEmpty!51267 (= mapRest!51258 ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51267)))))

(declare-fun mapRes!51267 () Bool)

(assert (=> mapNonEmpty!51258 (= tp!97710 (and e!726552 mapRes!51267))))

(declare-fun mapNonEmpty!51267 () Bool)

(declare-fun tp!97726 () Bool)

(declare-fun e!726551 () Bool)

(assert (=> mapNonEmpty!51267 (= mapRes!51267 (and tp!97726 e!726551))))

(declare-fun mapKey!51267 () (_ BitVec 32))

(declare-fun mapValue!51267 () ValueCell!15692)

(declare-fun mapRest!51267 () (Array (_ BitVec 32) ValueCell!15692))

(assert (=> mapNonEmpty!51267 (= mapRest!51258 (store mapRest!51267 mapKey!51267 mapValue!51267))))

(declare-fun mapIsEmpty!51267 () Bool)

(assert (=> mapIsEmpty!51267 mapRes!51267))

(declare-fun b!1273416 () Bool)

(assert (=> b!1273416 (= e!726551 tp_is_empty!33091)))

(assert (= (and mapNonEmpty!51258 condMapEmpty!51267) mapIsEmpty!51267))

(assert (= (and mapNonEmpty!51258 (not condMapEmpty!51267)) mapNonEmpty!51267))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15692) mapValue!51267)) b!1273416))

(assert (= (and mapNonEmpty!51258 ((_ is ValueCellFull!15692) mapDefault!51267)) b!1273417))

(declare-fun m!1170151 () Bool)

(assert (=> mapNonEmpty!51267 m!1170151))

(check-sat (not d!139881) (not b!1273407) tp_is_empty!33091 (not b_next!27721) b_and!45759 (not mapNonEmpty!51267) (not b!1273408))
(check-sat b_and!45759 (not b_next!27721))
(get-model)

(declare-fun d!139887 () Bool)

(assert (=> d!139887 (= (size!40752 thiss!1551) (bvadd (_size!3129 thiss!1551) (bvsdiv (bvadd (extraKeys!6399 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1273408 d!139887))

(assert (=> b!1273407 d!139887))

(declare-fun d!139889 () Bool)

(assert (=> d!139889 (= (validMask!0 (mask!34496 thiss!1551)) (and (or (= (mask!34496 thiss!1551) #b00000000000000000000000000000111) (= (mask!34496 thiss!1551) #b00000000000000000000000000001111) (= (mask!34496 thiss!1551) #b00000000000000000000000000011111) (= (mask!34496 thiss!1551) #b00000000000000000000000000111111) (= (mask!34496 thiss!1551) #b00000000000000000000000001111111) (= (mask!34496 thiss!1551) #b00000000000000000000000011111111) (= (mask!34496 thiss!1551) #b00000000000000000000000111111111) (= (mask!34496 thiss!1551) #b00000000000000000000001111111111) (= (mask!34496 thiss!1551) #b00000000000000000000011111111111) (= (mask!34496 thiss!1551) #b00000000000000000000111111111111) (= (mask!34496 thiss!1551) #b00000000000000000001111111111111) (= (mask!34496 thiss!1551) #b00000000000000000011111111111111) (= (mask!34496 thiss!1551) #b00000000000000000111111111111111) (= (mask!34496 thiss!1551) #b00000000000000001111111111111111) (= (mask!34496 thiss!1551) #b00000000000000011111111111111111) (= (mask!34496 thiss!1551) #b00000000000000111111111111111111) (= (mask!34496 thiss!1551) #b00000000000001111111111111111111) (= (mask!34496 thiss!1551) #b00000000000011111111111111111111) (= (mask!34496 thiss!1551) #b00000000000111111111111111111111) (= (mask!34496 thiss!1551) #b00000000001111111111111111111111) (= (mask!34496 thiss!1551) #b00000000011111111111111111111111) (= (mask!34496 thiss!1551) #b00000000111111111111111111111111) (= (mask!34496 thiss!1551) #b00000001111111111111111111111111) (= (mask!34496 thiss!1551) #b00000011111111111111111111111111) (= (mask!34496 thiss!1551) #b00000111111111111111111111111111) (= (mask!34496 thiss!1551) #b00001111111111111111111111111111) (= (mask!34496 thiss!1551) #b00011111111111111111111111111111) (= (mask!34496 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34496 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!139881 d!139889))

(declare-fun b!1273419 () Bool)

(declare-fun e!726554 () Bool)

(assert (=> b!1273419 (= e!726554 tp_is_empty!33091)))

(declare-fun condMapEmpty!51268 () Bool)

(declare-fun mapDefault!51268 () ValueCell!15692)

(assert (=> mapNonEmpty!51267 (= condMapEmpty!51268 (= mapRest!51267 ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51268)))))

(declare-fun mapRes!51268 () Bool)

(assert (=> mapNonEmpty!51267 (= tp!97726 (and e!726554 mapRes!51268))))

(declare-fun mapNonEmpty!51268 () Bool)

(declare-fun tp!97727 () Bool)

(declare-fun e!726553 () Bool)

(assert (=> mapNonEmpty!51268 (= mapRes!51268 (and tp!97727 e!726553))))

(declare-fun mapKey!51268 () (_ BitVec 32))

(declare-fun mapRest!51268 () (Array (_ BitVec 32) ValueCell!15692))

(declare-fun mapValue!51268 () ValueCell!15692)

(assert (=> mapNonEmpty!51268 (= mapRest!51267 (store mapRest!51268 mapKey!51268 mapValue!51268))))

(declare-fun mapIsEmpty!51268 () Bool)

(assert (=> mapIsEmpty!51268 mapRes!51268))

(declare-fun b!1273418 () Bool)

(assert (=> b!1273418 (= e!726553 tp_is_empty!33091)))

(assert (= (and mapNonEmpty!51267 condMapEmpty!51268) mapIsEmpty!51268))

(assert (= (and mapNonEmpty!51267 (not condMapEmpty!51268)) mapNonEmpty!51268))

(assert (= (and mapNonEmpty!51268 ((_ is ValueCellFull!15692) mapValue!51268)) b!1273418))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15692) mapDefault!51268)) b!1273419))

(declare-fun m!1170153 () Bool)

(assert (=> mapNonEmpty!51268 m!1170153))

(check-sat (not mapNonEmpty!51268) tp_is_empty!33091 b_and!45759 (not b_next!27721))
(check-sat b_and!45759 (not b_next!27721))
