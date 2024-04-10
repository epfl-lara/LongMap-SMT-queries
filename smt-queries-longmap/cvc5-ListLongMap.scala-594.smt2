; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15706 () Bool)

(assert start!15706)

(declare-fun b!156643 () Bool)

(declare-fun b_free!3373 () Bool)

(declare-fun b_next!3373 () Bool)

(assert (=> b!156643 (= b_free!3373 (not b_next!3373))))

(declare-fun tp!12643 () Bool)

(declare-fun b_and!9787 () Bool)

(assert (=> b!156643 (= tp!12643 b_and!9787)))

(declare-fun b!156642 () Bool)

(declare-fun res!74028 () Bool)

(declare-fun e!102452 () Bool)

(assert (=> b!156642 (=> (not res!74028) (not e!102452))))

(declare-datatypes ((V!3881 0))(
  ( (V!3882 (val!1632 Int)) )
))
(declare-datatypes ((ValueCell!1244 0))(
  ( (ValueCellFull!1244 (v!3497 V!3881)) (EmptyCell!1244) )
))
(declare-datatypes ((array!5403 0))(
  ( (array!5404 (arr!2559 (Array (_ BitVec 32) (_ BitVec 64))) (size!2837 (_ BitVec 32))) )
))
(declare-datatypes ((array!5405 0))(
  ( (array!5406 (arr!2560 (Array (_ BitVec 32) ValueCell!1244)) (size!2838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1396 0))(
  ( (LongMapFixedSize!1397 (defaultEntry!3140 Int) (mask!7597 (_ BitVec 32)) (extraKeys!2881 (_ BitVec 32)) (zeroValue!2983 V!3881) (minValue!2983 V!3881) (_size!747 (_ BitVec 32)) (_keys!4915 array!5403) (_values!3123 array!5405) (_vacant!747 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1396)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5403 (_ BitVec 32)) Bool)

(assert (=> b!156642 (= res!74028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4915 thiss!1248) (mask!7597 thiss!1248)))))

(declare-fun e!102450 () Bool)

(declare-fun tp_is_empty!3175 () Bool)

(declare-fun e!102453 () Bool)

(declare-fun array_inv!1615 (array!5403) Bool)

(declare-fun array_inv!1616 (array!5405) Bool)

(assert (=> b!156643 (= e!102450 (and tp!12643 tp_is_empty!3175 (array_inv!1615 (_keys!4915 thiss!1248)) (array_inv!1616 (_values!3123 thiss!1248)) e!102453))))

(declare-fun b!156645 () Bool)

(declare-fun res!74031 () Bool)

(assert (=> b!156645 (=> (not res!74031) (not e!102452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156645 (= res!74031 (validMask!0 (mask!7597 thiss!1248)))))

(declare-fun b!156646 () Bool)

(declare-fun res!74030 () Bool)

(assert (=> b!156646 (=> (not res!74030) (not e!102452))))

(assert (=> b!156646 (= res!74030 (and (= (size!2838 (_values!3123 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7597 thiss!1248))) (= (size!2837 (_keys!4915 thiss!1248)) (size!2838 (_values!3123 thiss!1248))) (bvsge (mask!7597 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2881 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2881 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2881 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156647 () Bool)

(declare-fun res!74032 () Bool)

(assert (=> b!156647 (=> (not res!74032) (not e!102452))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156647 (= res!74032 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156648 () Bool)

(declare-fun e!102449 () Bool)

(assert (=> b!156648 (= e!102449 tp_is_empty!3175)))

(declare-fun mapIsEmpty!5405 () Bool)

(declare-fun mapRes!5405 () Bool)

(assert (=> mapIsEmpty!5405 mapRes!5405))

(declare-fun b!156649 () Bool)

(assert (=> b!156649 (= e!102453 (and e!102449 mapRes!5405))))

(declare-fun condMapEmpty!5405 () Bool)

(declare-fun mapDefault!5405 () ValueCell!1244)

