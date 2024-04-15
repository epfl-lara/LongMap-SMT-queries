; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3192 () Bool)

(assert start!3192)

(declare-fun b!19420 () Bool)

(declare-fun b_free!679 () Bool)

(declare-fun b_next!679 () Bool)

(assert (=> b!19420 (= b_free!679 (not b_next!679))))

(declare-fun tp!3250 () Bool)

(declare-fun b_and!1333 () Bool)

(assert (=> b!19420 (= tp!3250 b_and!1333)))

(declare-fun b!19419 () Bool)

(declare-fun e!12541 () Bool)

(declare-fun tp_is_empty!943 () Bool)

(assert (=> b!19419 (= e!12541 tp_is_empty!943)))

(declare-fun e!12536 () Bool)

(declare-fun e!12534 () Bool)

(declare-datatypes ((V!1083 0))(
  ( (V!1084 (val!498 Int)) )
))
(declare-datatypes ((ValueCell!272 0))(
  ( (ValueCellFull!272 (v!1511 V!1083)) (EmptyCell!272) )
))
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
  ( (Cell!131 (v!1512 LongMapFixedSize!130)) )
))
(declare-datatypes ((LongMap!130 0))(
  ( (LongMap!131 (underlying!76 Cell!130)) )
))
(declare-fun thiss!938 () LongMap!130)

(declare-fun array_inv!365 (array!1085) Bool)

(declare-fun array_inv!366 (array!1083) Bool)

(assert (=> b!19420 (= e!12534 (and tp!3250 tp_is_empty!943 (array_inv!365 (_keys!3112 (v!1512 (underlying!76 thiss!938)))) (array_inv!366 (_values!1680 (v!1512 (underlying!76 thiss!938)))) e!12536))))

(declare-fun b!19421 () Bool)

(declare-fun e!12539 () Bool)

(assert (=> b!19421 (= e!12539 e!12534)))

(declare-fun mapNonEmpty!871 () Bool)

(declare-fun mapRes!871 () Bool)

(declare-fun tp!3249 () Bool)

(assert (=> mapNonEmpty!871 (= mapRes!871 (and tp!3249 e!12541))))

(declare-fun mapValue!871 () ValueCell!272)

(declare-fun mapKey!871 () (_ BitVec 32))

(declare-fun mapRest!871 () (Array (_ BitVec 32) ValueCell!272))

(assert (=> mapNonEmpty!871 (= (arr!518 (_values!1680 (v!1512 (underlying!76 thiss!938)))) (store mapRest!871 mapKey!871 mapValue!871))))

(declare-fun b!19422 () Bool)

(declare-fun e!12538 () Bool)

(assert (=> b!19422 (= e!12536 (and e!12538 mapRes!871))))

(declare-fun condMapEmpty!871 () Bool)

(declare-fun mapDefault!871 () ValueCell!272)

(assert (=> b!19422 (= condMapEmpty!871 (= (arr!518 (_values!1680 (v!1512 (underlying!76 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!272)) mapDefault!871)))))

(declare-fun b!19423 () Bool)

(declare-fun e!12535 () Bool)

(assert (=> b!19423 (= e!12535 e!12539)))

(declare-fun b!19424 () Bool)

(assert (=> b!19424 (= e!12538 tp_is_empty!943)))

(declare-fun b!19425 () Bool)

(declare-fun e!12540 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-fun computeNewMask!4 (LongMap!130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19425 (= e!12540 (not (validMask!0 (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))))))))

(declare-fun mapIsEmpty!871 () Bool)

(assert (=> mapIsEmpty!871 mapRes!871))

(declare-fun res!13178 () Bool)

(assert (=> start!3192 (=> (not res!13178) (not e!12540))))

(declare-fun valid!71 (LongMap!130) Bool)

(assert (=> start!3192 (= res!13178 (valid!71 thiss!938))))

(assert (=> start!3192 e!12540))

(assert (=> start!3192 e!12535))

(assert (= (and start!3192 res!13178) b!19425))

(assert (= (and b!19422 condMapEmpty!871) mapIsEmpty!871))

(assert (= (and b!19422 (not condMapEmpty!871)) mapNonEmpty!871))

(get-info :version)

(assert (= (and mapNonEmpty!871 ((_ is ValueCellFull!272) mapValue!871)) b!19419))

(assert (= (and b!19422 ((_ is ValueCellFull!272) mapDefault!871)) b!19424))

(assert (= b!19420 b!19422))

(assert (= b!19421 b!19420))

(assert (= b!19423 b!19421))

(assert (= start!3192 b!19423))

(declare-fun m!13645 () Bool)

(assert (=> b!19420 m!13645))

(declare-fun m!13647 () Bool)

(assert (=> b!19420 m!13647))

(declare-fun m!13649 () Bool)

(assert (=> mapNonEmpty!871 m!13649))

(declare-fun m!13651 () Bool)

(assert (=> b!19425 m!13651))

(assert (=> b!19425 m!13651))

(declare-fun m!13653 () Bool)

(assert (=> b!19425 m!13653))

(declare-fun m!13655 () Bool)

(assert (=> start!3192 m!13655))

(check-sat (not b_next!679) tp_is_empty!943 (not b!19420) (not start!3192) (not mapNonEmpty!871) (not b!19425) b_and!1333)
(check-sat b_and!1333 (not b_next!679))
(get-model)

(declare-fun d!3569 () Bool)

(assert (=> d!3569 (= (validMask!0 (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938))))) (and (or (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000000111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000001111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000011111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000001111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000011111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000001111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000011111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000001111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000011111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000001111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000011111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000000111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000001111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000011111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000000111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000001111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000011111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000000111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000001111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000011111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00000111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00001111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00011111111111111111111111111111) (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00111111111111111111111111111111)) (bvsle (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) #b00111111111111111111111111111111)))))

(assert (=> b!19425 d!3569))

(declare-fun d!3571 () Bool)

(declare-fun e!12595 () Bool)

(assert (=> d!3571 e!12595))

(declare-fun res!13187 () Bool)

(assert (=> d!3571 (=> (not res!13187) (not e!12595))))

(declare-fun lt!5425 () (_ BitVec 32))

(assert (=> d!3571 (= res!13187 (validMask!0 lt!5425))))

(declare-datatypes ((Unit!391 0))(
  ( (Unit!392) )
))
(declare-datatypes ((tuple2!822 0))(
  ( (tuple2!823 (_1!414 Unit!391) (_2!414 (_ BitVec 32))) )
))
(declare-fun e!12594 () tuple2!822)

(assert (=> d!3571 (= lt!5425 (_2!414 e!12594))))

(declare-fun c!2068 () Bool)

(declare-fun lt!5426 () tuple2!822)

(assert (=> d!3571 (= c!2068 (and (bvsgt (_2!414 lt!5426) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!98 (v!1512 (underlying!76 thiss!938)))) (_2!414 lt!5426)) (bvsge (bvadd (bvand (bvashr (_2!414 lt!5426) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!98 (v!1512 (underlying!76 thiss!938))))))))

(declare-fun Unit!393 () Unit!391)

(declare-fun Unit!394 () Unit!391)

(assert (=> d!3571 (= lt!5426 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!98 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))))) (mask!4635 (v!1512 (underlying!76 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!98 (v!1512 (underlying!76 thiss!938)))) (mask!4635 (v!1512 (underlying!76 thiss!938))))) (tuple2!823 Unit!393 (bvand (bvadd (bvshl (mask!4635 (v!1512 (underlying!76 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!823 Unit!394 (mask!4635 (v!1512 (underlying!76 thiss!938))))))))

(assert (=> d!3571 (validMask!0 (mask!4635 (v!1512 (underlying!76 thiss!938))))))

(assert (=> d!3571 (= (computeNewMask!4 thiss!938 (mask!4635 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (_size!98 (v!1512 (underlying!76 thiss!938)))) lt!5425)))

(declare-fun b!19474 () Bool)

(declare-fun computeNewMaskWhile!3 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!822)

(assert (=> b!19474 (= e!12594 (computeNewMaskWhile!3 (_size!98 (v!1512 (underlying!76 thiss!938))) (_vacant!98 (v!1512 (underlying!76 thiss!938))) (mask!4635 (v!1512 (underlying!76 thiss!938))) (_2!414 lt!5426)))))

(declare-fun b!19475 () Bool)

(declare-fun Unit!395 () Unit!391)

(assert (=> b!19475 (= e!12594 (tuple2!823 Unit!395 (_2!414 lt!5426)))))

(declare-fun b!19476 () Bool)

(assert (=> b!19476 (= e!12595 (bvsle (_size!98 (v!1512 (underlying!76 thiss!938))) (bvadd lt!5425 #b00000000000000000000000000000001)))))

(assert (= (and d!3571 c!2068) b!19474))

(assert (= (and d!3571 (not c!2068)) b!19475))

(assert (= (and d!3571 res!13187) b!19476))

(declare-fun m!13681 () Bool)

(assert (=> d!3571 m!13681))

(declare-fun m!13683 () Bool)

(assert (=> d!3571 m!13683))

(declare-fun m!13685 () Bool)

(assert (=> b!19474 m!13685))

(assert (=> b!19425 d!3571))

(declare-fun d!3573 () Bool)

(declare-fun valid!72 (LongMapFixedSize!130) Bool)

(assert (=> d!3573 (= (valid!71 thiss!938) (valid!72 (v!1512 (underlying!76 thiss!938))))))

(declare-fun bs!872 () Bool)

(assert (= bs!872 d!3573))

(declare-fun m!13687 () Bool)

(assert (=> bs!872 m!13687))

(assert (=> start!3192 d!3573))

(declare-fun d!3575 () Bool)

(assert (=> d!3575 (= (array_inv!365 (_keys!3112 (v!1512 (underlying!76 thiss!938)))) (bvsge (size!612 (_keys!3112 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19420 d!3575))

(declare-fun d!3577 () Bool)

(assert (=> d!3577 (= (array_inv!366 (_values!1680 (v!1512 (underlying!76 thiss!938)))) (bvsge (size!611 (_values!1680 (v!1512 (underlying!76 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19420 d!3577))

(declare-fun mapNonEmpty!880 () Bool)

(declare-fun mapRes!880 () Bool)

(declare-fun tp!3265 () Bool)

(declare-fun e!12601 () Bool)

(assert (=> mapNonEmpty!880 (= mapRes!880 (and tp!3265 e!12601))))

(declare-fun mapKey!880 () (_ BitVec 32))

(declare-fun mapRest!880 () (Array (_ BitVec 32) ValueCell!272))

(declare-fun mapValue!880 () ValueCell!272)

(assert (=> mapNonEmpty!880 (= mapRest!871 (store mapRest!880 mapKey!880 mapValue!880))))

(declare-fun b!19484 () Bool)

(declare-fun e!12600 () Bool)

(assert (=> b!19484 (= e!12600 tp_is_empty!943)))

(declare-fun mapIsEmpty!880 () Bool)

(assert (=> mapIsEmpty!880 mapRes!880))

(declare-fun condMapEmpty!880 () Bool)

(declare-fun mapDefault!880 () ValueCell!272)

(assert (=> mapNonEmpty!871 (= condMapEmpty!880 (= mapRest!871 ((as const (Array (_ BitVec 32) ValueCell!272)) mapDefault!880)))))

(assert (=> mapNonEmpty!871 (= tp!3249 (and e!12600 mapRes!880))))

(declare-fun b!19483 () Bool)

(assert (=> b!19483 (= e!12601 tp_is_empty!943)))

(assert (= (and mapNonEmpty!871 condMapEmpty!880) mapIsEmpty!880))

(assert (= (and mapNonEmpty!871 (not condMapEmpty!880)) mapNonEmpty!880))

(assert (= (and mapNonEmpty!880 ((_ is ValueCellFull!272) mapValue!880)) b!19483))

(assert (= (and mapNonEmpty!871 ((_ is ValueCellFull!272) mapDefault!880)) b!19484))

(declare-fun m!13689 () Bool)

(assert (=> mapNonEmpty!880 m!13689))

(check-sat (not b_next!679) tp_is_empty!943 (not b!19474) b_and!1333 (not mapNonEmpty!880) (not d!3573) (not d!3571))
(check-sat b_and!1333 (not b_next!679))
