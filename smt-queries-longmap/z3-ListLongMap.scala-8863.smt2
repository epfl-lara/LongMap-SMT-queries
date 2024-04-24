; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107780 () Bool)

(assert start!107780)

(declare-fun b!1274735 () Bool)

(declare-fun b_free!27721 () Bool)

(declare-fun b_next!27721 () Bool)

(assert (=> b!1274735 (= b_free!27721 (not b_next!27721))))

(declare-fun tp!97709 () Bool)

(declare-fun b_and!45779 () Bool)

(assert (=> b!1274735 (= tp!97709 b_and!45779)))

(declare-fun mapNonEmpty!51258 () Bool)

(declare-fun mapRes!51258 () Bool)

(declare-fun tp!97710 () Bool)

(declare-fun e!727383 () Bool)

(assert (=> mapNonEmpty!51258 (= mapRes!51258 (and tp!97710 e!727383))))

(declare-fun mapKey!51258 () (_ BitVec 32))

(declare-datatypes ((V!49315 0))(
  ( (V!49316 (val!16620 Int)) )
))
(declare-datatypes ((ValueCell!15692 0))(
  ( (ValueCellFull!15692 (v!19252 V!49315)) (EmptyCell!15692) )
))
(declare-fun mapRest!51258 () (Array (_ BitVec 32) ValueCell!15692))

(declare-datatypes ((array!83471 0))(
  ( (array!83472 (arr!40256 (Array (_ BitVec 32) ValueCell!15692)) (size!40799 (_ BitVec 32))) )
))
(declare-datatypes ((array!83473 0))(
  ( (array!83474 (arr!40257 (Array (_ BitVec 32) (_ BitVec 64))) (size!40800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6148 0))(
  ( (LongMapFixedSize!6149 (defaultEntry!6720 Int) (mask!34561 (_ BitVec 32)) (extraKeys!6399 (_ BitVec 32)) (zeroValue!6505 V!49315) (minValue!6505 V!49315) (_size!3129 (_ BitVec 32)) (_keys!12172 array!83473) (_values!6743 array!83471) (_vacant!3129 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6148)

(declare-fun mapValue!51258 () ValueCell!15692)

(assert (=> mapNonEmpty!51258 (= (arr!40256 (_values!6743 thiss!1551)) (store mapRest!51258 mapKey!51258 mapValue!51258))))

(declare-fun mapIsEmpty!51258 () Bool)

(assert (=> mapIsEmpty!51258 mapRes!51258))

(declare-fun b!1274732 () Bool)

(declare-fun tp_is_empty!33091 () Bool)

(assert (=> b!1274732 (= e!727383 tp_is_empty!33091)))

(declare-fun b!1274733 () Bool)

(declare-fun e!727379 () Bool)

(declare-fun e!727380 () Bool)

(assert (=> b!1274733 (= e!727379 (and e!727380 mapRes!51258))))

(declare-fun condMapEmpty!51258 () Bool)

(declare-fun mapDefault!51258 () ValueCell!15692)

(assert (=> b!1274733 (= condMapEmpty!51258 (= (arr!40256 (_values!6743 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51258)))))

(declare-fun res!847363 () Bool)

(declare-fun e!727382 () Bool)

(assert (=> start!107780 (=> (not res!847363) (not e!727382))))

(declare-fun simpleValid!465 (LongMapFixedSize!6148) Bool)

(assert (=> start!107780 (= res!847363 (simpleValid!465 thiss!1551))))

(assert (=> start!107780 e!727382))

(declare-fun e!727381 () Bool)

(assert (=> start!107780 e!727381))

(declare-fun b!1274734 () Bool)

(assert (=> b!1274734 (= e!727380 tp_is_empty!33091)))

(declare-fun array_inv!30781 (array!83473) Bool)

(declare-fun array_inv!30782 (array!83471) Bool)

(assert (=> b!1274735 (= e!727381 (and tp!97709 tp_is_empty!33091 (array_inv!30781 (_keys!12172 thiss!1551)) (array_inv!30782 (_values!6743 thiss!1551)) e!727379))))

(declare-fun b!1274736 () Bool)

(assert (=> b!1274736 (= e!727382 (and (bvsle #b00000000000000000000000000000000 (size!40800 (_keys!12172 thiss!1551))) (bvsge (size!40800 (_keys!12172 thiss!1551)) #b01111111111111111111111111111111)))))

(assert (= (and start!107780 res!847363) b!1274736))

(assert (= (and b!1274733 condMapEmpty!51258) mapIsEmpty!51258))

(assert (= (and b!1274733 (not condMapEmpty!51258)) mapNonEmpty!51258))

(get-info :version)

(assert (= (and mapNonEmpty!51258 ((_ is ValueCellFull!15692) mapValue!51258)) b!1274732))

(assert (= (and b!1274733 ((_ is ValueCellFull!15692) mapDefault!51258)) b!1274734))

(assert (= b!1274735 b!1274733))

(assert (= start!107780 b!1274735))

(declare-fun m!1172235 () Bool)

(assert (=> mapNonEmpty!51258 m!1172235))

(declare-fun m!1172237 () Bool)

(assert (=> start!107780 m!1172237))

(declare-fun m!1172239 () Bool)

(assert (=> b!1274735 m!1172239))

(declare-fun m!1172241 () Bool)

(assert (=> b!1274735 m!1172241))

(check-sat (not mapNonEmpty!51258) b_and!45779 tp_is_empty!33091 (not b!1274735) (not b_next!27721) (not start!107780))
(check-sat b_and!45779 (not b_next!27721))
(get-model)

(declare-fun d!140441 () Bool)

(assert (=> d!140441 (= (array_inv!30781 (_keys!12172 thiss!1551)) (bvsge (size!40800 (_keys!12172 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274735 d!140441))

(declare-fun d!140443 () Bool)

(assert (=> d!140443 (= (array_inv!30782 (_values!6743 thiss!1551)) (bvsge (size!40799 (_values!6743 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274735 d!140443))

(declare-fun b!1274777 () Bool)

(declare-fun res!847378 () Bool)

(declare-fun e!727422 () Bool)

(assert (=> b!1274777 (=> (not res!847378) (not e!727422))))

(declare-fun size!40805 (LongMapFixedSize!6148) (_ BitVec 32))

(assert (=> b!1274777 (= res!847378 (= (size!40805 thiss!1551) (bvadd (_size!3129 thiss!1551) (bvsdiv (bvadd (extraKeys!6399 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1274776 () Bool)

(declare-fun res!847379 () Bool)

(assert (=> b!1274776 (=> (not res!847379) (not e!727422))))

(assert (=> b!1274776 (= res!847379 (bvsge (size!40805 thiss!1551) (_size!3129 thiss!1551)))))

(declare-fun b!1274778 () Bool)

(assert (=> b!1274778 (= e!727422 (and (bvsge (extraKeys!6399 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6399 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3129 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun d!140445 () Bool)

(declare-fun res!847381 () Bool)

(assert (=> d!140445 (=> (not res!847381) (not e!727422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140445 (= res!847381 (validMask!0 (mask!34561 thiss!1551)))))

(assert (=> d!140445 (= (simpleValid!465 thiss!1551) e!727422)))

(declare-fun b!1274775 () Bool)

(declare-fun res!847380 () Bool)

(assert (=> b!1274775 (=> (not res!847380) (not e!727422))))

(assert (=> b!1274775 (= res!847380 (and (= (size!40799 (_values!6743 thiss!1551)) (bvadd (mask!34561 thiss!1551) #b00000000000000000000000000000001)) (= (size!40800 (_keys!12172 thiss!1551)) (size!40799 (_values!6743 thiss!1551))) (bvsge (_size!3129 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3129 thiss!1551) (bvadd (mask!34561 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140445 res!847381) b!1274775))

(assert (= (and b!1274775 res!847380) b!1274776))

(assert (= (and b!1274776 res!847379) b!1274777))

(assert (= (and b!1274777 res!847378) b!1274778))

(declare-fun m!1172259 () Bool)

(assert (=> b!1274777 m!1172259))

(assert (=> b!1274776 m!1172259))

(declare-fun m!1172261 () Bool)

(assert (=> d!140445 m!1172261))

(assert (=> start!107780 d!140445))

(declare-fun b!1274785 () Bool)

(declare-fun e!727428 () Bool)

(assert (=> b!1274785 (= e!727428 tp_is_empty!33091)))

(declare-fun condMapEmpty!51267 () Bool)

(declare-fun mapDefault!51267 () ValueCell!15692)

(assert (=> mapNonEmpty!51258 (= condMapEmpty!51267 (= mapRest!51258 ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51267)))))

(declare-fun e!727427 () Bool)

(declare-fun mapRes!51267 () Bool)

(assert (=> mapNonEmpty!51258 (= tp!97710 (and e!727427 mapRes!51267))))

(declare-fun mapNonEmpty!51267 () Bool)

(declare-fun tp!97725 () Bool)

(assert (=> mapNonEmpty!51267 (= mapRes!51267 (and tp!97725 e!727428))))

(declare-fun mapRest!51267 () (Array (_ BitVec 32) ValueCell!15692))

(declare-fun mapKey!51267 () (_ BitVec 32))

(declare-fun mapValue!51267 () ValueCell!15692)

(assert (=> mapNonEmpty!51267 (= mapRest!51258 (store mapRest!51267 mapKey!51267 mapValue!51267))))

(declare-fun b!1274786 () Bool)

(assert (=> b!1274786 (= e!727427 tp_is_empty!33091)))

(declare-fun mapIsEmpty!51267 () Bool)

(assert (=> mapIsEmpty!51267 mapRes!51267))

(assert (= (and mapNonEmpty!51258 condMapEmpty!51267) mapIsEmpty!51267))

(assert (= (and mapNonEmpty!51258 (not condMapEmpty!51267)) mapNonEmpty!51267))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15692) mapValue!51267)) b!1274785))

(assert (= (and mapNonEmpty!51258 ((_ is ValueCellFull!15692) mapDefault!51267)) b!1274786))

(declare-fun m!1172263 () Bool)

(assert (=> mapNonEmpty!51267 m!1172263))

(check-sat b_and!45779 (not d!140445) tp_is_empty!33091 (not b!1274777) (not b_next!27721) (not mapNonEmpty!51267) (not b!1274776))
(check-sat b_and!45779 (not b_next!27721))
(get-model)

(declare-fun d!140447 () Bool)

(assert (=> d!140447 (= (size!40805 thiss!1551) (bvadd (_size!3129 thiss!1551) (bvsdiv (bvadd (extraKeys!6399 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1274777 d!140447))

(assert (=> b!1274776 d!140447))

(declare-fun d!140449 () Bool)

(assert (=> d!140449 (= (validMask!0 (mask!34561 thiss!1551)) (and (or (= (mask!34561 thiss!1551) #b00000000000000000000000000000111) (= (mask!34561 thiss!1551) #b00000000000000000000000000001111) (= (mask!34561 thiss!1551) #b00000000000000000000000000011111) (= (mask!34561 thiss!1551) #b00000000000000000000000000111111) (= (mask!34561 thiss!1551) #b00000000000000000000000001111111) (= (mask!34561 thiss!1551) #b00000000000000000000000011111111) (= (mask!34561 thiss!1551) #b00000000000000000000000111111111) (= (mask!34561 thiss!1551) #b00000000000000000000001111111111) (= (mask!34561 thiss!1551) #b00000000000000000000011111111111) (= (mask!34561 thiss!1551) #b00000000000000000000111111111111) (= (mask!34561 thiss!1551) #b00000000000000000001111111111111) (= (mask!34561 thiss!1551) #b00000000000000000011111111111111) (= (mask!34561 thiss!1551) #b00000000000000000111111111111111) (= (mask!34561 thiss!1551) #b00000000000000001111111111111111) (= (mask!34561 thiss!1551) #b00000000000000011111111111111111) (= (mask!34561 thiss!1551) #b00000000000000111111111111111111) (= (mask!34561 thiss!1551) #b00000000000001111111111111111111) (= (mask!34561 thiss!1551) #b00000000000011111111111111111111) (= (mask!34561 thiss!1551) #b00000000000111111111111111111111) (= (mask!34561 thiss!1551) #b00000000001111111111111111111111) (= (mask!34561 thiss!1551) #b00000000011111111111111111111111) (= (mask!34561 thiss!1551) #b00000000111111111111111111111111) (= (mask!34561 thiss!1551) #b00000001111111111111111111111111) (= (mask!34561 thiss!1551) #b00000011111111111111111111111111) (= (mask!34561 thiss!1551) #b00000111111111111111111111111111) (= (mask!34561 thiss!1551) #b00001111111111111111111111111111) (= (mask!34561 thiss!1551) #b00011111111111111111111111111111) (= (mask!34561 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34561 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!140445 d!140449))

(declare-fun b!1274787 () Bool)

(declare-fun e!727430 () Bool)

(assert (=> b!1274787 (= e!727430 tp_is_empty!33091)))

(declare-fun condMapEmpty!51268 () Bool)

(declare-fun mapDefault!51268 () ValueCell!15692)

(assert (=> mapNonEmpty!51267 (= condMapEmpty!51268 (= mapRest!51267 ((as const (Array (_ BitVec 32) ValueCell!15692)) mapDefault!51268)))))

(declare-fun e!727429 () Bool)

(declare-fun mapRes!51268 () Bool)

(assert (=> mapNonEmpty!51267 (= tp!97725 (and e!727429 mapRes!51268))))

(declare-fun mapNonEmpty!51268 () Bool)

(declare-fun tp!97726 () Bool)

(assert (=> mapNonEmpty!51268 (= mapRes!51268 (and tp!97726 e!727430))))

(declare-fun mapValue!51268 () ValueCell!15692)

(declare-fun mapRest!51268 () (Array (_ BitVec 32) ValueCell!15692))

(declare-fun mapKey!51268 () (_ BitVec 32))

(assert (=> mapNonEmpty!51268 (= mapRest!51267 (store mapRest!51268 mapKey!51268 mapValue!51268))))

(declare-fun b!1274788 () Bool)

(assert (=> b!1274788 (= e!727429 tp_is_empty!33091)))

(declare-fun mapIsEmpty!51268 () Bool)

(assert (=> mapIsEmpty!51268 mapRes!51268))

(assert (= (and mapNonEmpty!51267 condMapEmpty!51268) mapIsEmpty!51268))

(assert (= (and mapNonEmpty!51267 (not condMapEmpty!51268)) mapNonEmpty!51268))

(assert (= (and mapNonEmpty!51268 ((_ is ValueCellFull!15692) mapValue!51268)) b!1274787))

(assert (= (and mapNonEmpty!51267 ((_ is ValueCellFull!15692) mapDefault!51268)) b!1274788))

(declare-fun m!1172265 () Bool)

(assert (=> mapNonEmpty!51268 m!1172265))

(check-sat (not mapNonEmpty!51268) tp_is_empty!33091 b_and!45779 (not b_next!27721))
(check-sat b_and!45779 (not b_next!27721))
