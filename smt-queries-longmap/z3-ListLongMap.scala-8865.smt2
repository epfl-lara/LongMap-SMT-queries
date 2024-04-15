; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107588 () Bool)

(assert start!107588)

(declare-fun b!1273522 () Bool)

(declare-fun b_free!27733 () Bool)

(declare-fun b_next!27733 () Bool)

(assert (=> b!1273522 (= b_free!27733 (not b_next!27733))))

(declare-fun tp!97754 () Bool)

(declare-fun b_and!45771 () Bool)

(assert (=> b!1273522 (= tp!97754 b_and!45771)))

(declare-fun b!1273520 () Bool)

(declare-fun res!846871 () Bool)

(declare-fun e!726636 () Bool)

(assert (=> b!1273520 (=> (not res!846871) (not e!726636))))

(declare-datatypes ((V!49331 0))(
  ( (V!49332 (val!16626 Int)) )
))
(declare-datatypes ((ValueCell!15698 0))(
  ( (ValueCellFull!15698 (v!19262 V!49331)) (EmptyCell!15698) )
))
(declare-datatypes ((array!83381 0))(
  ( (array!83382 (arr!40214 (Array (_ BitVec 32) ValueCell!15698)) (size!40760 (_ BitVec 32))) )
))
(declare-datatypes ((array!83383 0))(
  ( (array!83384 (arr!40215 (Array (_ BitVec 32) (_ BitVec 64))) (size!40761 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6160 0))(
  ( (LongMapFixedSize!6161 (defaultEntry!6726 Int) (mask!34508 (_ BitVec 32)) (extraKeys!6405 (_ BitVec 32)) (zeroValue!6511 V!49331) (minValue!6511 V!49331) (_size!3135 (_ BitVec 32)) (_keys!12136 array!83383) (_values!6749 array!83381) (_vacant!3135 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6160)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273520 (= res!846871 (validMask!0 (mask!34508 thiss!1551)))))

(declare-fun b!1273521 () Bool)

(declare-fun e!726641 () Bool)

(declare-fun tp_is_empty!33103 () Bool)

(assert (=> b!1273521 (= e!726641 tp_is_empty!33103)))

(declare-fun mapIsEmpty!51283 () Bool)

(declare-fun mapRes!51283 () Bool)

(assert (=> mapIsEmpty!51283 mapRes!51283))

(declare-fun e!726639 () Bool)

(declare-fun e!726638 () Bool)

(declare-fun array_inv!30729 (array!83383) Bool)

(declare-fun array_inv!30730 (array!83381) Bool)

(assert (=> b!1273522 (= e!726639 (and tp!97754 tp_is_empty!33103 (array_inv!30729 (_keys!12136 thiss!1551)) (array_inv!30730 (_values!6749 thiss!1551)) e!726638))))

(declare-fun b!1273523 () Bool)

(declare-fun e!726640 () Bool)

(assert (=> b!1273523 (= e!726640 tp_is_empty!33103)))

(declare-fun mapNonEmpty!51283 () Bool)

(declare-fun tp!97753 () Bool)

(assert (=> mapNonEmpty!51283 (= mapRes!51283 (and tp!97753 e!726641))))

(declare-fun mapValue!51283 () ValueCell!15698)

(declare-fun mapRest!51283 () (Array (_ BitVec 32) ValueCell!15698))

(declare-fun mapKey!51283 () (_ BitVec 32))

(assert (=> mapNonEmpty!51283 (= (arr!40214 (_values!6749 thiss!1551)) (store mapRest!51283 mapKey!51283 mapValue!51283))))

(declare-fun b!1273525 () Bool)

(assert (=> b!1273525 (= e!726638 (and e!726640 mapRes!51283))))

(declare-fun condMapEmpty!51283 () Bool)

(declare-fun mapDefault!51283 () ValueCell!15698)

(assert (=> b!1273525 (= condMapEmpty!51283 (= (arr!40214 (_values!6749 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15698)) mapDefault!51283)))))

(declare-fun b!1273526 () Bool)

(assert (=> b!1273526 (= e!726636 (not (= (size!40761 (_keys!12136 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34508 thiss!1551)))))))

(declare-fun b!1273524 () Bool)

(declare-fun res!846872 () Bool)

(assert (=> b!1273524 (=> (not res!846872) (not e!726636))))

(declare-fun arrayCountValidKeys!0 (array!83383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273524 (= res!846872 (= (arrayCountValidKeys!0 (_keys!12136 thiss!1551) #b00000000000000000000000000000000 (size!40761 (_keys!12136 thiss!1551))) (_size!3135 thiss!1551)))))

(declare-fun res!846873 () Bool)

(assert (=> start!107588 (=> (not res!846873) (not e!726636))))

(declare-fun simpleValid!471 (LongMapFixedSize!6160) Bool)

(assert (=> start!107588 (= res!846873 (simpleValid!471 thiss!1551))))

(assert (=> start!107588 e!726636))

(assert (=> start!107588 e!726639))

(assert (= (and start!107588 res!846873) b!1273524))

(assert (= (and b!1273524 res!846872) b!1273520))

(assert (= (and b!1273520 res!846871) b!1273526))

(assert (= (and b!1273525 condMapEmpty!51283) mapIsEmpty!51283))

(assert (= (and b!1273525 (not condMapEmpty!51283)) mapNonEmpty!51283))

(get-info :version)

(assert (= (and mapNonEmpty!51283 ((_ is ValueCellFull!15698) mapValue!51283)) b!1273521))

(assert (= (and b!1273525 ((_ is ValueCellFull!15698) mapDefault!51283)) b!1273523))

(assert (= b!1273522 b!1273525))

(assert (= start!107588 b!1273522))

(declare-fun m!1170201 () Bool)

(assert (=> start!107588 m!1170201))

(declare-fun m!1170203 () Bool)

(assert (=> b!1273520 m!1170203))

(declare-fun m!1170205 () Bool)

(assert (=> mapNonEmpty!51283 m!1170205))

(declare-fun m!1170207 () Bool)

(assert (=> b!1273522 m!1170207))

(declare-fun m!1170209 () Bool)

(assert (=> b!1273522 m!1170209))

(declare-fun m!1170211 () Bool)

(assert (=> b!1273524 m!1170211))

(check-sat tp_is_empty!33103 (not b!1273520) (not b!1273524) (not mapNonEmpty!51283) (not b_next!27733) (not start!107588) b_and!45771 (not b!1273522))
(check-sat b_and!45771 (not b_next!27733))
(get-model)

(declare-fun d!139905 () Bool)

(assert (=> d!139905 (= (validMask!0 (mask!34508 thiss!1551)) (and (or (= (mask!34508 thiss!1551) #b00000000000000000000000000000111) (= (mask!34508 thiss!1551) #b00000000000000000000000000001111) (= (mask!34508 thiss!1551) #b00000000000000000000000000011111) (= (mask!34508 thiss!1551) #b00000000000000000000000000111111) (= (mask!34508 thiss!1551) #b00000000000000000000000001111111) (= (mask!34508 thiss!1551) #b00000000000000000000000011111111) (= (mask!34508 thiss!1551) #b00000000000000000000000111111111) (= (mask!34508 thiss!1551) #b00000000000000000000001111111111) (= (mask!34508 thiss!1551) #b00000000000000000000011111111111) (= (mask!34508 thiss!1551) #b00000000000000000000111111111111) (= (mask!34508 thiss!1551) #b00000000000000000001111111111111) (= (mask!34508 thiss!1551) #b00000000000000000011111111111111) (= (mask!34508 thiss!1551) #b00000000000000000111111111111111) (= (mask!34508 thiss!1551) #b00000000000000001111111111111111) (= (mask!34508 thiss!1551) #b00000000000000011111111111111111) (= (mask!34508 thiss!1551) #b00000000000000111111111111111111) (= (mask!34508 thiss!1551) #b00000000000001111111111111111111) (= (mask!34508 thiss!1551) #b00000000000011111111111111111111) (= (mask!34508 thiss!1551) #b00000000000111111111111111111111) (= (mask!34508 thiss!1551) #b00000000001111111111111111111111) (= (mask!34508 thiss!1551) #b00000000011111111111111111111111) (= (mask!34508 thiss!1551) #b00000000111111111111111111111111) (= (mask!34508 thiss!1551) #b00000001111111111111111111111111) (= (mask!34508 thiss!1551) #b00000011111111111111111111111111) (= (mask!34508 thiss!1551) #b00000111111111111111111111111111) (= (mask!34508 thiss!1551) #b00001111111111111111111111111111) (= (mask!34508 thiss!1551) #b00011111111111111111111111111111) (= (mask!34508 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34508 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273520 d!139905))

(declare-fun bm!62581 () Bool)

(declare-fun call!62584 () (_ BitVec 32))

(assert (=> bm!62581 (= call!62584 (arrayCountValidKeys!0 (_keys!12136 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40761 (_keys!12136 thiss!1551))))))

(declare-fun b!1273577 () Bool)

(declare-fun e!726682 () (_ BitVec 32))

(declare-fun e!726683 () (_ BitVec 32))

(assert (=> b!1273577 (= e!726682 e!726683)))

(declare-fun c!123755 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273577 (= c!123755 (validKeyInArray!0 (select (arr!40215 (_keys!12136 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273578 () Bool)

(assert (=> b!1273578 (= e!726683 call!62584)))

(declare-fun b!1273579 () Bool)

(assert (=> b!1273579 (= e!726683 (bvadd #b00000000000000000000000000000001 call!62584))))

(declare-fun d!139907 () Bool)

(declare-fun lt!574959 () (_ BitVec 32))

(assert (=> d!139907 (and (bvsge lt!574959 #b00000000000000000000000000000000) (bvsle lt!574959 (bvsub (size!40761 (_keys!12136 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139907 (= lt!574959 e!726682)))

(declare-fun c!123754 () Bool)

(assert (=> d!139907 (= c!123754 (bvsge #b00000000000000000000000000000000 (size!40761 (_keys!12136 thiss!1551))))))

(assert (=> d!139907 (and (bvsle #b00000000000000000000000000000000 (size!40761 (_keys!12136 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40761 (_keys!12136 thiss!1551)) (size!40761 (_keys!12136 thiss!1551))))))

(assert (=> d!139907 (= (arrayCountValidKeys!0 (_keys!12136 thiss!1551) #b00000000000000000000000000000000 (size!40761 (_keys!12136 thiss!1551))) lt!574959)))

(declare-fun b!1273580 () Bool)

(assert (=> b!1273580 (= e!726682 #b00000000000000000000000000000000)))

(assert (= (and d!139907 c!123754) b!1273580))

(assert (= (and d!139907 (not c!123754)) b!1273577))

(assert (= (and b!1273577 c!123755) b!1273579))

(assert (= (and b!1273577 (not c!123755)) b!1273578))

(assert (= (or b!1273579 b!1273578) bm!62581))

(declare-fun m!1170237 () Bool)

(assert (=> bm!62581 m!1170237))

(declare-fun m!1170239 () Bool)

(assert (=> b!1273577 m!1170239))

(assert (=> b!1273577 m!1170239))

(declare-fun m!1170241 () Bool)

(assert (=> b!1273577 m!1170241))

(assert (=> b!1273524 d!139907))

(declare-fun d!139909 () Bool)

(assert (=> d!139909 (= (array_inv!30729 (_keys!12136 thiss!1551)) (bvsge (size!40761 (_keys!12136 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273522 d!139909))

(declare-fun d!139911 () Bool)

(assert (=> d!139911 (= (array_inv!30730 (_values!6749 thiss!1551)) (bvsge (size!40760 (_values!6749 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273522 d!139911))

(declare-fun b!1273592 () Bool)

(declare-fun e!726686 () Bool)

(assert (=> b!1273592 (= e!726686 (and (bvsge (extraKeys!6405 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6405 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3135 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273590 () Bool)

(declare-fun res!846903 () Bool)

(assert (=> b!1273590 (=> (not res!846903) (not e!726686))))

(declare-fun size!40766 (LongMapFixedSize!6160) (_ BitVec 32))

(assert (=> b!1273590 (= res!846903 (bvsge (size!40766 thiss!1551) (_size!3135 thiss!1551)))))

(declare-fun d!139913 () Bool)

(declare-fun res!846902 () Bool)

(assert (=> d!139913 (=> (not res!846902) (not e!726686))))

(assert (=> d!139913 (= res!846902 (validMask!0 (mask!34508 thiss!1551)))))

(assert (=> d!139913 (= (simpleValid!471 thiss!1551) e!726686)))

(declare-fun b!1273589 () Bool)

(declare-fun res!846900 () Bool)

(assert (=> b!1273589 (=> (not res!846900) (not e!726686))))

(assert (=> b!1273589 (= res!846900 (and (= (size!40760 (_values!6749 thiss!1551)) (bvadd (mask!34508 thiss!1551) #b00000000000000000000000000000001)) (= (size!40761 (_keys!12136 thiss!1551)) (size!40760 (_values!6749 thiss!1551))) (bvsge (_size!3135 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3135 thiss!1551) (bvadd (mask!34508 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273591 () Bool)

(declare-fun res!846901 () Bool)

(assert (=> b!1273591 (=> (not res!846901) (not e!726686))))

(assert (=> b!1273591 (= res!846901 (= (size!40766 thiss!1551) (bvadd (_size!3135 thiss!1551) (bvsdiv (bvadd (extraKeys!6405 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!139913 res!846902) b!1273589))

(assert (= (and b!1273589 res!846900) b!1273590))

(assert (= (and b!1273590 res!846903) b!1273591))

(assert (= (and b!1273591 res!846901) b!1273592))

(declare-fun m!1170243 () Bool)

(assert (=> b!1273590 m!1170243))

(assert (=> d!139913 m!1170203))

(assert (=> b!1273591 m!1170243))

(assert (=> start!107588 d!139913))

(declare-fun mapNonEmpty!51292 () Bool)

(declare-fun mapRes!51292 () Bool)

(declare-fun tp!97769 () Bool)

(declare-fun e!726691 () Bool)

(assert (=> mapNonEmpty!51292 (= mapRes!51292 (and tp!97769 e!726691))))

(declare-fun mapKey!51292 () (_ BitVec 32))

(declare-fun mapRest!51292 () (Array (_ BitVec 32) ValueCell!15698))

(declare-fun mapValue!51292 () ValueCell!15698)

(assert (=> mapNonEmpty!51292 (= mapRest!51283 (store mapRest!51292 mapKey!51292 mapValue!51292))))

(declare-fun b!1273599 () Bool)

(assert (=> b!1273599 (= e!726691 tp_is_empty!33103)))

(declare-fun condMapEmpty!51292 () Bool)

(declare-fun mapDefault!51292 () ValueCell!15698)

(assert (=> mapNonEmpty!51283 (= condMapEmpty!51292 (= mapRest!51283 ((as const (Array (_ BitVec 32) ValueCell!15698)) mapDefault!51292)))))

(declare-fun e!726692 () Bool)

(assert (=> mapNonEmpty!51283 (= tp!97753 (and e!726692 mapRes!51292))))

(declare-fun mapIsEmpty!51292 () Bool)

(assert (=> mapIsEmpty!51292 mapRes!51292))

(declare-fun b!1273600 () Bool)

(assert (=> b!1273600 (= e!726692 tp_is_empty!33103)))

(assert (= (and mapNonEmpty!51283 condMapEmpty!51292) mapIsEmpty!51292))

(assert (= (and mapNonEmpty!51283 (not condMapEmpty!51292)) mapNonEmpty!51292))

(assert (= (and mapNonEmpty!51292 ((_ is ValueCellFull!15698) mapValue!51292)) b!1273599))

(assert (= (and mapNonEmpty!51283 ((_ is ValueCellFull!15698) mapDefault!51292)) b!1273600))

(declare-fun m!1170245 () Bool)

(assert (=> mapNonEmpty!51292 m!1170245))

(check-sat tp_is_empty!33103 (not mapNonEmpty!51292) (not b!1273577) (not d!139913) (not b!1273591) (not bm!62581) b_and!45771 (not b!1273590) (not b_next!27733))
(check-sat b_and!45771 (not b_next!27733))
