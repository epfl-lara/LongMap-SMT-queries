; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3198 () Bool)

(assert start!3198)

(declare-fun b!19437 () Bool)

(declare-fun b_free!679 () Bool)

(declare-fun b_next!679 () Bool)

(assert (=> b!19437 (= b_free!679 (not b_next!679))))

(declare-fun tp!3249 () Bool)

(declare-fun b_and!1333 () Bool)

(assert (=> b!19437 (= tp!3249 b_and!1333)))

(declare-fun mapIsEmpty!871 () Bool)

(declare-fun mapRes!871 () Bool)

(assert (=> mapIsEmpty!871 mapRes!871))

(declare-fun b!19438 () Bool)

(declare-fun e!12552 () Bool)

(declare-fun tp_is_empty!943 () Bool)

(assert (=> b!19438 (= e!12552 tp_is_empty!943)))

(declare-fun b!19439 () Bool)

(declare-fun e!12549 () Bool)

(assert (=> b!19439 (= e!12549 tp_is_empty!943)))

(declare-fun b!19440 () Bool)

(declare-fun e!12553 () Bool)

(declare-fun e!12555 () Bool)

(assert (=> b!19440 (= e!12553 e!12555)))

(declare-fun b!19441 () Bool)

(declare-fun e!12550 () Bool)

(assert (=> b!19441 (= e!12555 e!12550)))

(declare-fun mapNonEmpty!871 () Bool)

(declare-fun tp!3250 () Bool)

(assert (=> mapNonEmpty!871 (= mapRes!871 (and tp!3250 e!12552))))

(declare-fun mapKey!871 () (_ BitVec 32))

(declare-datatypes ((V!1083 0))(
  ( (V!1084 (val!498 Int)) )
))
(declare-datatypes ((ValueCell!272 0))(
  ( (ValueCellFull!272 (v!1512 V!1083)) (EmptyCell!272) )
))
(declare-fun mapValue!871 () ValueCell!272)

(declare-fun mapRest!871 () (Array (_ BitVec 32) ValueCell!272))

(declare-datatypes ((array!1083 0))(
  ( (array!1084 (arr!518 (Array (_ BitVec 32) ValueCell!272)) (size!611 (_ BitVec 32))) )
))
(declare-datatypes ((array!1085 0))(
  ( (array!1086 (arr!519 (Array (_ BitVec 32) (_ BitVec 64))) (size!612 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!130 0))(
  ( (LongMapFixedSize!131 (defaultEntry!1684 Int) (mask!4635 (_ BitVec 32)) (extraKeys!1594 (_ BitVec 32)) (zeroValue!1618 V!1083) (minValue!1618 V!1083) (_size!98 (_ BitVec 32)) (_keys!3112 array!1085) (_values!1680 array!1083) (_vacant!98 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!130 0))(
  ( (Cell!131 (v!1513 LongMapFixedSize!130)) )
))
(declare-datatypes ((LongMap!130 0))(
  ( (LongMap!131 (underlying!76 Cell!130)) )
))
(declare-fun thiss!938 () LongMap!130)

(assert (=> mapNonEmpty!871 (= (arr!518 (_values!1680 (v!1513 (underlying!76 thiss!938)))) (store mapRest!871 mapKey!871 mapValue!871))))

(declare-fun b!19442 () Bool)

(declare-fun e!12548 () Bool)

(assert (=> b!19442 (= e!12548 (and e!12549 mapRes!871))))

(declare-fun condMapEmpty!871 () Bool)

(declare-fun mapDefault!871 () ValueCell!272)

(assert (=> b!19442 (= condMapEmpty!871 (= (arr!518 (_values!1680 (v!1513 (underlying!76 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!272)) mapDefault!871)))))

(declare-fun b!19443 () Bool)

(declare-fun e!12551 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-fun computeNewMask!4 (LongMap!130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19443 (= e!12551 (not (validMask!0 (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))))))))

(declare-fun array_inv!373 (array!1085) Bool)

(declare-fun array_inv!374 (array!1083) Bool)

(assert (=> b!19437 (= e!12550 (and tp!3249 tp_is_empty!943 (array_inv!373 (_keys!3112 (v!1513 (underlying!76 thiss!938)))) (array_inv!374 (_values!1680 (v!1513 (underlying!76 thiss!938)))) e!12548))))

(declare-fun res!13188 () Bool)

(assert (=> start!3198 (=> (not res!13188) (not e!12551))))

(declare-fun valid!72 (LongMap!130) Bool)

(assert (=> start!3198 (= res!13188 (valid!72 thiss!938))))

(assert (=> start!3198 e!12551))

(assert (=> start!3198 e!12553))

(assert (= (and start!3198 res!13188) b!19443))

(assert (= (and b!19442 condMapEmpty!871) mapIsEmpty!871))

(assert (= (and b!19442 (not condMapEmpty!871)) mapNonEmpty!871))

(get-info :version)

(assert (= (and mapNonEmpty!871 ((_ is ValueCellFull!272) mapValue!871)) b!19438))

(assert (= (and b!19442 ((_ is ValueCellFull!272) mapDefault!871)) b!19439))

(assert (= b!19437 b!19442))

(assert (= b!19441 b!19437))

(assert (= b!19440 b!19441))

(assert (= start!3198 b!19440))

(declare-fun m!13659 () Bool)

(assert (=> mapNonEmpty!871 m!13659))

(declare-fun m!13661 () Bool)

(assert (=> b!19443 m!13661))

(assert (=> b!19443 m!13661))

(declare-fun m!13663 () Bool)

(assert (=> b!19443 m!13663))

(declare-fun m!13665 () Bool)

(assert (=> b!19437 m!13665))

(declare-fun m!13667 () Bool)

(assert (=> b!19437 m!13667))

(declare-fun m!13669 () Bool)

(assert (=> start!3198 m!13669))

(check-sat (not b_next!679) b_and!1333 (not b!19437) (not b!19443) (not mapNonEmpty!871) (not start!3198) tp_is_empty!943)
(check-sat b_and!1333 (not b_next!679))
(get-model)

(declare-fun d!3575 () Bool)

(declare-fun valid!74 (LongMapFixedSize!130) Bool)

(assert (=> d!3575 (= (valid!72 thiss!938) (valid!74 (v!1513 (underlying!76 thiss!938))))))

(declare-fun bs!872 () Bool)

(assert (= bs!872 d!3575))

(declare-fun m!13695 () Bool)

(assert (=> bs!872 m!13695))

(assert (=> start!3198 d!3575))

(declare-fun d!3577 () Bool)

(assert (=> d!3577 (= (validMask!0 (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938))))) (and (or (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> b!19443 d!3577))

(declare-fun d!3579 () Bool)

(declare-fun e!12609 () Bool)

(assert (=> d!3579 e!12609))

(declare-fun res!13197 () Bool)

(assert (=> d!3579 (=> (not res!13197) (not e!12609))))

(declare-fun lt!5430 () (_ BitVec 32))

(assert (=> d!3579 (= res!13197 (validMask!0 lt!5430))))

(declare-datatypes ((Unit!394 0))(
  ( (Unit!395) )
))
(declare-datatypes ((tuple2!824 0))(
  ( (tuple2!825 (_1!415 Unit!394) (_2!415 (_ BitVec 32))) )
))
(declare-fun e!12608 () tuple2!824)

(assert (=> d!3579 (= lt!5430 (_2!415 e!12608))))

(declare-fun c!2072 () Bool)

(declare-fun lt!5429 () tuple2!824)

(assert (=> d!3579 (= c!2072 (and (bvsgt (_2!415 lt!5429) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!98 (v!1513 (underlying!76 thiss!938)))) (_2!415 lt!5429)) (bvsge (bvadd (bvand (bvashr (_2!415 lt!5429) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!98 (v!1513 (underlying!76 thiss!938))))))))

(declare-fun Unit!396 () Unit!394)

(declare-fun Unit!397 () Unit!394)

(assert (=> d!3579 (= lt!5429 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!98 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))))) (mask!4635 (v!1513 (underlying!76 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!98 (v!1513 (underlying!76 thiss!938)))) (mask!4635 (v!1513 (underlying!76 thiss!938))))) (tuple2!825 Unit!396 (bvand (bvadd (bvshl (mask!4635 (v!1513 (underlying!76 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!825 Unit!397 (mask!4635 (v!1513 (underlying!76 thiss!938))))))))

(assert (=> d!3579 (validMask!0 (mask!4635 (v!1513 (underlying!76 thiss!938))))))

(assert (=> d!3579 (= (computeNewMask!4 thiss!938 (mask!4635 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (_size!98 (v!1513 (underlying!76 thiss!938)))) lt!5430)))

(declare-fun b!19492 () Bool)

(declare-fun computeNewMaskWhile!3 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!824)

(assert (=> b!19492 (= e!12608 (computeNewMaskWhile!3 (_size!98 (v!1513 (underlying!76 thiss!938))) (_vacant!98 (v!1513 (underlying!76 thiss!938))) (mask!4635 (v!1513 (underlying!76 thiss!938))) (_2!415 lt!5429)))))

(declare-fun b!19493 () Bool)

(declare-fun Unit!398 () Unit!394)

(assert (=> b!19493 (= e!12608 (tuple2!825 Unit!398 (_2!415 lt!5429)))))

(declare-fun b!19494 () Bool)

(assert (=> b!19494 (= e!12609 (bvsle (_size!98 (v!1513 (underlying!76 thiss!938))) (bvadd lt!5430 #b00000000000000000000000000000001)))))

(assert (= (and d!3579 c!2072) b!19492))

(assert (= (and d!3579 (not c!2072)) b!19493))

(assert (= (and d!3579 res!13197) b!19494))

(declare-fun m!13697 () Bool)

(assert (=> d!3579 m!13697))

(declare-fun m!13699 () Bool)

(assert (=> d!3579 m!13699))

(declare-fun m!13701 () Bool)

(assert (=> b!19492 m!13701))

(assert (=> b!19443 d!3579))

(declare-fun d!3581 () Bool)

(assert (=> d!3581 (= (array_inv!373 (_keys!3112 (v!1513 (underlying!76 thiss!938)))) (bvsge (size!612 (_keys!3112 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19437 d!3581))

(declare-fun d!3583 () Bool)

(assert (=> d!3583 (= (array_inv!374 (_values!1680 (v!1513 (underlying!76 thiss!938)))) (bvsge (size!611 (_values!1680 (v!1513 (underlying!76 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19437 d!3583))

(declare-fun mapNonEmpty!880 () Bool)

(declare-fun mapRes!880 () Bool)

(declare-fun tp!3265 () Bool)

(declare-fun e!12614 () Bool)

(assert (=> mapNonEmpty!880 (= mapRes!880 (and tp!3265 e!12614))))

(declare-fun mapKey!880 () (_ BitVec 32))

(declare-fun mapValue!880 () ValueCell!272)

(declare-fun mapRest!880 () (Array (_ BitVec 32) ValueCell!272))

(assert (=> mapNonEmpty!880 (= mapRest!871 (store mapRest!880 mapKey!880 mapValue!880))))

(declare-fun b!19502 () Bool)

(declare-fun e!12615 () Bool)

(assert (=> b!19502 (= e!12615 tp_is_empty!943)))

(declare-fun mapIsEmpty!880 () Bool)

(assert (=> mapIsEmpty!880 mapRes!880))

(declare-fun b!19501 () Bool)

(assert (=> b!19501 (= e!12614 tp_is_empty!943)))

(declare-fun condMapEmpty!880 () Bool)

(declare-fun mapDefault!880 () ValueCell!272)

(assert (=> mapNonEmpty!871 (= condMapEmpty!880 (= mapRest!871 ((as const (Array (_ BitVec 32) ValueCell!272)) mapDefault!880)))))

(assert (=> mapNonEmpty!871 (= tp!3250 (and e!12615 mapRes!880))))

(assert (= (and mapNonEmpty!871 condMapEmpty!880) mapIsEmpty!880))

(assert (= (and mapNonEmpty!871 (not condMapEmpty!880)) mapNonEmpty!880))

(assert (= (and mapNonEmpty!880 ((_ is ValueCellFull!272) mapValue!880)) b!19501))

(assert (= (and mapNonEmpty!871 ((_ is ValueCellFull!272) mapDefault!880)) b!19502))

(declare-fun m!13703 () Bool)

(assert (=> mapNonEmpty!880 m!13703))

(check-sat (not b_next!679) b_and!1333 (not mapNonEmpty!880) (not b!19492) tp_is_empty!943 (not d!3579) (not d!3575))
(check-sat b_and!1333 (not b_next!679))
