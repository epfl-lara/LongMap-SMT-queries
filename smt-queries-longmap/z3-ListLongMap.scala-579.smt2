; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15620 () Bool)

(assert start!15620)

(declare-fun b!155400 () Bool)

(declare-fun b_free!3283 () Bool)

(declare-fun b_next!3283 () Bool)

(assert (=> b!155400 (= b_free!3283 (not b_next!3283))))

(declare-fun tp!12373 () Bool)

(declare-fun b_and!9671 () Bool)

(assert (=> b!155400 (= tp!12373 b_and!9671)))

(declare-fun b!155397 () Bool)

(declare-fun res!73375 () Bool)

(declare-fun e!101521 () Bool)

(assert (=> b!155397 (=> (not res!73375) (not e!101521))))

(declare-datatypes ((V!3761 0))(
  ( (V!3762 (val!1587 Int)) )
))
(declare-datatypes ((ValueCell!1199 0))(
  ( (ValueCellFull!1199 (v!3446 V!3761)) (EmptyCell!1199) )
))
(declare-datatypes ((array!5203 0))(
  ( (array!5204 (arr!2458 (Array (_ BitVec 32) (_ BitVec 64))) (size!2737 (_ BitVec 32))) )
))
(declare-datatypes ((array!5205 0))(
  ( (array!5206 (arr!2459 (Array (_ BitVec 32) ValueCell!1199)) (size!2738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1306 0))(
  ( (LongMapFixedSize!1307 (defaultEntry!3095 Int) (mask!7521 (_ BitVec 32)) (extraKeys!2836 (_ BitVec 32)) (zeroValue!2938 V!3761) (minValue!2938 V!3761) (_size!702 (_ BitVec 32)) (_keys!4869 array!5203) (_values!3078 array!5205) (_vacant!702 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1306)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5203 (_ BitVec 32)) Bool)

(assert (=> b!155397 (= res!73375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4869 thiss!1248) (mask!7521 thiss!1248)))))

(declare-fun mapIsEmpty!5270 () Bool)

(declare-fun mapRes!5270 () Bool)

(assert (=> mapIsEmpty!5270 mapRes!5270))

(declare-fun b!155398 () Bool)

(assert (=> b!155398 (= e!101521 false)))

(declare-fun lt!81195 () Bool)

(declare-datatypes ((List!1829 0))(
  ( (Nil!1826) (Cons!1825 (h!2434 (_ BitVec 64)) (t!6622 List!1829)) )
))
(declare-fun arrayNoDuplicates!0 (array!5203 (_ BitVec 32) List!1829) Bool)

(assert (=> b!155398 (= lt!81195 (arrayNoDuplicates!0 (_keys!4869 thiss!1248) #b00000000000000000000000000000000 Nil!1826))))

(declare-fun b!155399 () Bool)

(declare-fun res!73377 () Bool)

(assert (=> b!155399 (=> (not res!73377) (not e!101521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155399 (= res!73377 (validMask!0 (mask!7521 thiss!1248)))))

(declare-fun tp_is_empty!3085 () Bool)

(declare-fun e!101522 () Bool)

(declare-fun e!101523 () Bool)

(declare-fun array_inv!1575 (array!5203) Bool)

(declare-fun array_inv!1576 (array!5205) Bool)

(assert (=> b!155400 (= e!101522 (and tp!12373 tp_is_empty!3085 (array_inv!1575 (_keys!4869 thiss!1248)) (array_inv!1576 (_values!3078 thiss!1248)) e!101523))))

(declare-fun b!155401 () Bool)

(declare-fun e!101524 () Bool)

(assert (=> b!155401 (= e!101524 tp_is_empty!3085)))

(declare-fun b!155403 () Bool)

(declare-fun res!73379 () Bool)

(assert (=> b!155403 (=> (not res!73379) (not e!101521))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155403 (= res!73379 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5270 () Bool)

(declare-fun tp!12374 () Bool)

(assert (=> mapNonEmpty!5270 (= mapRes!5270 (and tp!12374 e!101524))))

(declare-fun mapRest!5270 () (Array (_ BitVec 32) ValueCell!1199))

(declare-fun mapValue!5270 () ValueCell!1199)

(declare-fun mapKey!5270 () (_ BitVec 32))

(assert (=> mapNonEmpty!5270 (= (arr!2459 (_values!3078 thiss!1248)) (store mapRest!5270 mapKey!5270 mapValue!5270))))

(declare-fun b!155404 () Bool)

(declare-fun e!101520 () Bool)

(assert (=> b!155404 (= e!101523 (and e!101520 mapRes!5270))))

(declare-fun condMapEmpty!5270 () Bool)

(declare-fun mapDefault!5270 () ValueCell!1199)

(assert (=> b!155404 (= condMapEmpty!5270 (= (arr!2459 (_values!3078 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1199)) mapDefault!5270)))))

(declare-fun b!155405 () Bool)

(assert (=> b!155405 (= e!101520 tp_is_empty!3085)))

(declare-fun b!155402 () Bool)

(declare-fun res!73378 () Bool)

(assert (=> b!155402 (=> (not res!73378) (not e!101521))))

(assert (=> b!155402 (= res!73378 (and (= (size!2738 (_values!3078 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7521 thiss!1248))) (= (size!2737 (_keys!4869 thiss!1248)) (size!2738 (_values!3078 thiss!1248))) (bvsge (mask!7521 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2836 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2836 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2836 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!73376 () Bool)

(assert (=> start!15620 (=> (not res!73376) (not e!101521))))

(declare-fun valid!643 (LongMapFixedSize!1306) Bool)

(assert (=> start!15620 (= res!73376 (valid!643 thiss!1248))))

(assert (=> start!15620 e!101521))

(assert (=> start!15620 e!101522))

(assert (=> start!15620 true))

(assert (= (and start!15620 res!73376) b!155403))

(assert (= (and b!155403 res!73379) b!155399))

(assert (= (and b!155399 res!73377) b!155402))

(assert (= (and b!155402 res!73378) b!155397))

(assert (= (and b!155397 res!73375) b!155398))

(assert (= (and b!155404 condMapEmpty!5270) mapIsEmpty!5270))

(assert (= (and b!155404 (not condMapEmpty!5270)) mapNonEmpty!5270))

(get-info :version)

(assert (= (and mapNonEmpty!5270 ((_ is ValueCellFull!1199) mapValue!5270)) b!155401))

(assert (= (and b!155404 ((_ is ValueCellFull!1199) mapDefault!5270)) b!155405))

(assert (= b!155400 b!155404))

(assert (= start!15620 b!155400))

(declare-fun m!188773 () Bool)

(assert (=> b!155400 m!188773))

(declare-fun m!188775 () Bool)

(assert (=> b!155400 m!188775))

(declare-fun m!188777 () Bool)

(assert (=> start!15620 m!188777))

(declare-fun m!188779 () Bool)

(assert (=> b!155397 m!188779))

(declare-fun m!188781 () Bool)

(assert (=> b!155398 m!188781))

(declare-fun m!188783 () Bool)

(assert (=> b!155399 m!188783))

(declare-fun m!188785 () Bool)

(assert (=> mapNonEmpty!5270 m!188785))

(check-sat tp_is_empty!3085 (not mapNonEmpty!5270) (not b!155400) (not b!155397) (not b!155399) (not b_next!3283) b_and!9671 (not start!15620) (not b!155398))
(check-sat b_and!9671 (not b_next!3283))
