; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15616 () Bool)

(assert start!15616)

(declare-fun b!155546 () Bool)

(declare-fun b_free!3283 () Bool)

(declare-fun b_next!3283 () Bool)

(assert (=> b!155546 (= b_free!3283 (not b_next!3283))))

(declare-fun tp!12373 () Bool)

(declare-fun b_and!9697 () Bool)

(assert (=> b!155546 (= tp!12373 b_and!9697)))

(declare-fun b!155544 () Bool)

(declare-fun res!73471 () Bool)

(declare-fun e!101625 () Bool)

(assert (=> b!155544 (=> (not res!73471) (not e!101625))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155544 (= res!73471 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5270 () Bool)

(declare-fun mapRes!5270 () Bool)

(declare-fun tp!12374 () Bool)

(declare-fun e!101624 () Bool)

(assert (=> mapNonEmpty!5270 (= mapRes!5270 (and tp!12374 e!101624))))

(declare-datatypes ((V!3761 0))(
  ( (V!3762 (val!1587 Int)) )
))
(declare-datatypes ((ValueCell!1199 0))(
  ( (ValueCellFull!1199 (v!3452 V!3761)) (EmptyCell!1199) )
))
(declare-fun mapRest!5270 () (Array (_ BitVec 32) ValueCell!1199))

(declare-fun mapKey!5270 () (_ BitVec 32))

(declare-datatypes ((array!5223 0))(
  ( (array!5224 (arr!2469 (Array (_ BitVec 32) (_ BitVec 64))) (size!2747 (_ BitVec 32))) )
))
(declare-datatypes ((array!5225 0))(
  ( (array!5226 (arr!2470 (Array (_ BitVec 32) ValueCell!1199)) (size!2748 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1306 0))(
  ( (LongMapFixedSize!1307 (defaultEntry!3095 Int) (mask!7522 (_ BitVec 32)) (extraKeys!2836 (_ BitVec 32)) (zeroValue!2938 V!3761) (minValue!2938 V!3761) (_size!702 (_ BitVec 32)) (_keys!4870 array!5223) (_values!3078 array!5225) (_vacant!702 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1306)

(declare-fun mapValue!5270 () ValueCell!1199)

(assert (=> mapNonEmpty!5270 (= (arr!2470 (_values!3078 thiss!1248)) (store mapRest!5270 mapKey!5270 mapValue!5270))))

(declare-fun b!155545 () Bool)

(declare-fun res!73474 () Bool)

(assert (=> b!155545 (=> (not res!73474) (not e!101625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5223 (_ BitVec 32)) Bool)

(assert (=> b!155545 (= res!73474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4870 thiss!1248) (mask!7522 thiss!1248)))))

(declare-fun mapIsEmpty!5270 () Bool)

(assert (=> mapIsEmpty!5270 mapRes!5270))

(declare-fun e!101623 () Bool)

(declare-fun e!101621 () Bool)

(declare-fun tp_is_empty!3085 () Bool)

(declare-fun array_inv!1557 (array!5223) Bool)

(declare-fun array_inv!1558 (array!5225) Bool)

(assert (=> b!155546 (= e!101621 (and tp!12373 tp_is_empty!3085 (array_inv!1557 (_keys!4870 thiss!1248)) (array_inv!1558 (_values!3078 thiss!1248)) e!101623))))

(declare-fun b!155547 () Bool)

(assert (=> b!155547 (= e!101624 tp_is_empty!3085)))

(declare-fun b!155549 () Bool)

(declare-fun res!73470 () Bool)

(assert (=> b!155549 (=> (not res!73470) (not e!101625))))

(assert (=> b!155549 (= res!73470 (and (= (size!2748 (_values!3078 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7522 thiss!1248))) (= (size!2747 (_keys!4870 thiss!1248)) (size!2748 (_values!3078 thiss!1248))) (bvsge (mask!7522 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2836 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2836 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2836 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155550 () Bool)

(declare-fun e!101620 () Bool)

(assert (=> b!155550 (= e!101620 tp_is_empty!3085)))

(declare-fun res!73472 () Bool)

(assert (=> start!15616 (=> (not res!73472) (not e!101625))))

(declare-fun valid!641 (LongMapFixedSize!1306) Bool)

(assert (=> start!15616 (= res!73472 (valid!641 thiss!1248))))

(assert (=> start!15616 e!101625))

(assert (=> start!15616 e!101621))

(assert (=> start!15616 true))

(declare-fun b!155548 () Bool)

(assert (=> b!155548 (= e!101623 (and e!101620 mapRes!5270))))

(declare-fun condMapEmpty!5270 () Bool)

(declare-fun mapDefault!5270 () ValueCell!1199)

