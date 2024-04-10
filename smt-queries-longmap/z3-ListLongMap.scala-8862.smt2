; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107546 () Bool)

(assert start!107546)

(declare-fun b!1273381 () Bool)

(declare-fun b_free!27717 () Bool)

(declare-fun b_next!27717 () Bool)

(assert (=> b!1273381 (= b_free!27717 (not b_next!27717))))

(declare-fun tp!97694 () Bool)

(declare-fun b_and!45773 () Bool)

(assert (=> b!1273381 (= tp!97694 b_and!45773)))

(declare-fun b!1273377 () Bool)

(declare-fun e!726491 () Bool)

(declare-fun tp_is_empty!33087 () Bool)

(assert (=> b!1273377 (= e!726491 tp_is_empty!33087)))

(declare-fun b!1273378 () Bool)

(declare-fun e!726490 () Bool)

(declare-fun mapRes!51249 () Bool)

(assert (=> b!1273378 (= e!726490 (and e!726491 mapRes!51249))))

(declare-fun condMapEmpty!51249 () Bool)

(declare-datatypes ((V!49309 0))(
  ( (V!49310 (val!16618 Int)) )
))
(declare-datatypes ((ValueCell!15690 0))(
  ( (ValueCellFull!15690 (v!19255 V!49309)) (EmptyCell!15690) )
))
(declare-datatypes ((array!83444 0))(
  ( (array!83445 (arr!40248 (Array (_ BitVec 32) ValueCell!15690)) (size!40789 (_ BitVec 32))) )
))
(declare-datatypes ((array!83446 0))(
  ( (array!83447 (arr!40249 (Array (_ BitVec 32) (_ BitVec 64))) (size!40790 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6144 0))(
  ( (LongMapFixedSize!6145 (defaultEntry!6718 Int) (mask!34497 (_ BitVec 32)) (extraKeys!6397 (_ BitVec 32)) (zeroValue!6503 V!49309) (minValue!6503 V!49309) (_size!3127 (_ BitVec 32)) (_keys!12132 array!83446) (_values!6741 array!83444) (_vacant!3127 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6144)

(declare-fun mapDefault!51249 () ValueCell!15690)

(assert (=> b!1273378 (= condMapEmpty!51249 (= (arr!40248 (_values!6741 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15690)) mapDefault!51249)))))

(declare-fun b!1273379 () Bool)

(declare-fun e!726486 () Bool)

(assert (=> b!1273379 (= e!726486 (bvsgt #b00000000000000000000000000000000 (size!40790 (_keys!12132 thiss!1551))))))

(declare-fun b!1273380 () Bool)

(declare-fun e!726489 () Bool)

(assert (=> b!1273380 (= e!726489 tp_is_empty!33087)))

(declare-fun res!846825 () Bool)

(assert (=> start!107546 (=> (not res!846825) (not e!726486))))

(declare-fun simpleValid!464 (LongMapFixedSize!6144) Bool)

(assert (=> start!107546 (= res!846825 (simpleValid!464 thiss!1551))))

(assert (=> start!107546 e!726486))

(declare-fun e!726488 () Bool)

(assert (=> start!107546 e!726488))

(declare-fun mapNonEmpty!51249 () Bool)

(declare-fun tp!97695 () Bool)

(assert (=> mapNonEmpty!51249 (= mapRes!51249 (and tp!97695 e!726489))))

(declare-fun mapRest!51249 () (Array (_ BitVec 32) ValueCell!15690))

(declare-fun mapKey!51249 () (_ BitVec 32))

(declare-fun mapValue!51249 () ValueCell!15690)

(assert (=> mapNonEmpty!51249 (= (arr!40248 (_values!6741 thiss!1551)) (store mapRest!51249 mapKey!51249 mapValue!51249))))

(declare-fun array_inv!30603 (array!83446) Bool)

(declare-fun array_inv!30604 (array!83444) Bool)

(assert (=> b!1273381 (= e!726488 (and tp!97694 tp_is_empty!33087 (array_inv!30603 (_keys!12132 thiss!1551)) (array_inv!30604 (_values!6741 thiss!1551)) e!726490))))

(declare-fun mapIsEmpty!51249 () Bool)

(assert (=> mapIsEmpty!51249 mapRes!51249))

(assert (= (and start!107546 res!846825) b!1273379))

(assert (= (and b!1273378 condMapEmpty!51249) mapIsEmpty!51249))

(assert (= (and b!1273378 (not condMapEmpty!51249)) mapNonEmpty!51249))

(get-info :version)

(assert (= (and mapNonEmpty!51249 ((_ is ValueCellFull!15690) mapValue!51249)) b!1273380))

(assert (= (and b!1273378 ((_ is ValueCellFull!15690) mapDefault!51249)) b!1273377))

(assert (= b!1273381 b!1273378))

(assert (= start!107546 b!1273381))

(declare-fun m!1170601 () Bool)

(assert (=> start!107546 m!1170601))

(declare-fun m!1170603 () Bool)

(assert (=> mapNonEmpty!51249 m!1170603))

(declare-fun m!1170605 () Bool)

(assert (=> b!1273381 m!1170605))

(declare-fun m!1170607 () Bool)

(assert (=> b!1273381 m!1170607))

(check-sat (not mapNonEmpty!51249) (not start!107546) (not b_next!27717) b_and!45773 (not b!1273381) tp_is_empty!33087)
(check-sat b_and!45773 (not b_next!27717))
(get-model)

(declare-fun d!139985 () Bool)

(declare-fun res!846839 () Bool)

(declare-fun e!726512 () Bool)

(assert (=> d!139985 (=> (not res!846839) (not e!726512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139985 (= res!846839 (validMask!0 (mask!34497 thiss!1551)))))

(assert (=> d!139985 (= (simpleValid!464 thiss!1551) e!726512)))

(declare-fun b!1273405 () Bool)

(declare-fun res!846838 () Bool)

(assert (=> b!1273405 (=> (not res!846838) (not e!726512))))

(assert (=> b!1273405 (= res!846838 (and (= (size!40789 (_values!6741 thiss!1551)) (bvadd (mask!34497 thiss!1551) #b00000000000000000000000000000001)) (= (size!40790 (_keys!12132 thiss!1551)) (size!40789 (_values!6741 thiss!1551))) (bvsge (_size!3127 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3127 thiss!1551) (bvadd (mask!34497 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273408 () Bool)

(assert (=> b!1273408 (= e!726512 (and (bvsge (extraKeys!6397 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6397 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3127 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273407 () Bool)

(declare-fun res!846840 () Bool)

(assert (=> b!1273407 (=> (not res!846840) (not e!726512))))

(declare-fun size!40793 (LongMapFixedSize!6144) (_ BitVec 32))

(assert (=> b!1273407 (= res!846840 (= (size!40793 thiss!1551) (bvadd (_size!3127 thiss!1551) (bvsdiv (bvadd (extraKeys!6397 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273406 () Bool)

(declare-fun res!846837 () Bool)

(assert (=> b!1273406 (=> (not res!846837) (not e!726512))))

(assert (=> b!1273406 (= res!846837 (bvsge (size!40793 thiss!1551) (_size!3127 thiss!1551)))))

(assert (= (and d!139985 res!846839) b!1273405))

(assert (= (and b!1273405 res!846838) b!1273406))

(assert (= (and b!1273406 res!846837) b!1273407))

(assert (= (and b!1273407 res!846840) b!1273408))

(declare-fun m!1170617 () Bool)

(assert (=> d!139985 m!1170617))

(declare-fun m!1170619 () Bool)

(assert (=> b!1273407 m!1170619))

(assert (=> b!1273406 m!1170619))

(assert (=> start!107546 d!139985))

(declare-fun d!139987 () Bool)

(assert (=> d!139987 (= (array_inv!30603 (_keys!12132 thiss!1551)) (bvsge (size!40790 (_keys!12132 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273381 d!139987))

(declare-fun d!139989 () Bool)

(assert (=> d!139989 (= (array_inv!30604 (_values!6741 thiss!1551)) (bvsge (size!40789 (_values!6741 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273381 d!139989))

(declare-fun mapIsEmpty!51255 () Bool)

(declare-fun mapRes!51255 () Bool)

(assert (=> mapIsEmpty!51255 mapRes!51255))

(declare-fun b!1273416 () Bool)

(declare-fun e!726517 () Bool)

(assert (=> b!1273416 (= e!726517 tp_is_empty!33087)))

(declare-fun condMapEmpty!51255 () Bool)

(declare-fun mapDefault!51255 () ValueCell!15690)

(assert (=> mapNonEmpty!51249 (= condMapEmpty!51255 (= mapRest!51249 ((as const (Array (_ BitVec 32) ValueCell!15690)) mapDefault!51255)))))

(assert (=> mapNonEmpty!51249 (= tp!97695 (and e!726517 mapRes!51255))))

(declare-fun b!1273415 () Bool)

(declare-fun e!726518 () Bool)

(assert (=> b!1273415 (= e!726518 tp_is_empty!33087)))

(declare-fun mapNonEmpty!51255 () Bool)

(declare-fun tp!97704 () Bool)

(assert (=> mapNonEmpty!51255 (= mapRes!51255 (and tp!97704 e!726518))))

(declare-fun mapRest!51255 () (Array (_ BitVec 32) ValueCell!15690))

(declare-fun mapKey!51255 () (_ BitVec 32))

(declare-fun mapValue!51255 () ValueCell!15690)

(assert (=> mapNonEmpty!51255 (= mapRest!51249 (store mapRest!51255 mapKey!51255 mapValue!51255))))

(assert (= (and mapNonEmpty!51249 condMapEmpty!51255) mapIsEmpty!51255))

(assert (= (and mapNonEmpty!51249 (not condMapEmpty!51255)) mapNonEmpty!51255))

(assert (= (and mapNonEmpty!51255 ((_ is ValueCellFull!15690) mapValue!51255)) b!1273415))

(assert (= (and mapNonEmpty!51249 ((_ is ValueCellFull!15690) mapDefault!51255)) b!1273416))

(declare-fun m!1170621 () Bool)

(assert (=> mapNonEmpty!51255 m!1170621))

(check-sat (not d!139985) (not mapNonEmpty!51255) (not b_next!27717) b_and!45773 (not b!1273406) tp_is_empty!33087 (not b!1273407))
(check-sat b_and!45773 (not b_next!27717))
