; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15890 () Bool)

(assert start!15890)

(declare-fun b!158113 () Bool)

(declare-fun b_free!3473 () Bool)

(declare-fun b_next!3473 () Bool)

(assert (=> b!158113 (= b_free!3473 (not b_next!3473))))

(declare-fun tp!12965 () Bool)

(declare-fun b_and!9887 () Bool)

(assert (=> b!158113 (= tp!12965 b_and!9887)))

(declare-fun b!158110 () Bool)

(declare-fun e!103559 () Bool)

(declare-fun tp_is_empty!3275 () Bool)

(assert (=> b!158110 (= e!103559 tp_is_empty!3275)))

(declare-fun mapNonEmpty!5576 () Bool)

(declare-fun mapRes!5576 () Bool)

(declare-fun tp!12964 () Bool)

(assert (=> mapNonEmpty!5576 (= mapRes!5576 (and tp!12964 e!103559))))

(declare-datatypes ((V!4013 0))(
  ( (V!4014 (val!1682 Int)) )
))
(declare-datatypes ((ValueCell!1294 0))(
  ( (ValueCellFull!1294 (v!3547 V!4013)) (EmptyCell!1294) )
))
(declare-fun mapValue!5576 () ValueCell!1294)

(declare-fun mapKey!5576 () (_ BitVec 32))

(declare-fun mapRest!5576 () (Array (_ BitVec 32) ValueCell!1294))

(declare-datatypes ((array!5615 0))(
  ( (array!5616 (arr!2659 (Array (_ BitVec 32) (_ BitVec 64))) (size!2940 (_ BitVec 32))) )
))
(declare-datatypes ((array!5617 0))(
  ( (array!5618 (arr!2660 (Array (_ BitVec 32) ValueCell!1294)) (size!2941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1496 0))(
  ( (LongMapFixedSize!1497 (defaultEntry!3190 Int) (mask!7693 (_ BitVec 32)) (extraKeys!2931 (_ BitVec 32)) (zeroValue!3033 V!4013) (minValue!3033 V!4013) (_size!797 (_ BitVec 32)) (_keys!4972 array!5615) (_values!3173 array!5617) (_vacant!797 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1496)

(assert (=> mapNonEmpty!5576 (= (arr!2660 (_values!3173 thiss!1248)) (store mapRest!5576 mapKey!5576 mapValue!5576))))

(declare-fun b!158111 () Bool)

(declare-fun res!74699 () Bool)

(declare-fun e!103562 () Bool)

(assert (=> b!158111 (=> (not res!74699) (not e!103562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158111 (= res!74699 (validMask!0 (mask!7693 thiss!1248)))))

(declare-fun res!74702 () Bool)

(assert (=> start!15890 (=> (not res!74702) (not e!103562))))

(declare-fun valid!705 (LongMapFixedSize!1496) Bool)

(assert (=> start!15890 (= res!74702 (valid!705 thiss!1248))))

(assert (=> start!15890 e!103562))

(declare-fun e!103558 () Bool)

(assert (=> start!15890 e!103558))

(assert (=> start!15890 true))

(declare-fun b!158112 () Bool)

(declare-fun e!103561 () Bool)

(declare-fun e!103560 () Bool)

(assert (=> b!158112 (= e!103561 (and e!103560 mapRes!5576))))

(declare-fun condMapEmpty!5576 () Bool)

(declare-fun mapDefault!5576 () ValueCell!1294)

