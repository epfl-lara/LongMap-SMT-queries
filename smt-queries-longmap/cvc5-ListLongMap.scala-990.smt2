; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21348 () Bool)

(assert start!21348)

(declare-fun b!214680 () Bool)

(declare-fun b_free!5689 () Bool)

(declare-fun b_next!5689 () Bool)

(assert (=> b!214680 (= b_free!5689 (not b_next!5689))))

(declare-fun tp!20164 () Bool)

(declare-fun b_and!12579 () Bool)

(assert (=> b!214680 (= tp!20164 b_and!12579)))

(declare-fun b!214676 () Bool)

(declare-fun e!139633 () Bool)

(declare-fun tp_is_empty!5551 () Bool)

(assert (=> b!214676 (= e!139633 tp_is_empty!5551)))

(declare-fun b!214677 () Bool)

(declare-fun e!139634 () Bool)

(assert (=> b!214677 (= e!139634 tp_is_empty!5551)))

(declare-fun mapNonEmpty!9451 () Bool)

(declare-fun mapRes!9451 () Bool)

(declare-fun tp!20163 () Bool)

(assert (=> mapNonEmpty!9451 (= mapRes!9451 (and tp!20163 e!139634))))

(declare-datatypes ((V!7049 0))(
  ( (V!7050 (val!2820 Int)) )
))
(declare-datatypes ((ValueCell!2432 0))(
  ( (ValueCellFull!2432 (v!4838 V!7049)) (EmptyCell!2432) )
))
(declare-fun mapValue!9451 () ValueCell!2432)

(declare-fun mapRest!9451 () (Array (_ BitVec 32) ValueCell!2432))

(declare-datatypes ((array!10319 0))(
  ( (array!10320 (arr!4892 (Array (_ BitVec 32) ValueCell!2432)) (size!5219 (_ BitVec 32))) )
))
(declare-datatypes ((array!10321 0))(
  ( (array!10322 (arr!4893 (Array (_ BitVec 32) (_ BitVec 64))) (size!5220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2764 0))(
  ( (LongMapFixedSize!2765 (defaultEntry!4032 Int) (mask!9702 (_ BitVec 32)) (extraKeys!3769 (_ BitVec 32)) (zeroValue!3873 V!7049) (minValue!3873 V!7049) (_size!1431 (_ BitVec 32)) (_keys!6052 array!10321) (_values!4015 array!10319) (_vacant!1431 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2764)

(declare-fun mapKey!9451 () (_ BitVec 32))

(assert (=> mapNonEmpty!9451 (= (arr!4892 (_values!4015 thiss!1504)) (store mapRest!9451 mapKey!9451 mapValue!9451))))

(declare-fun b!214678 () Bool)

(declare-fun e!139630 () Bool)

(assert (=> b!214678 (= e!139630 (and e!139633 mapRes!9451))))

(declare-fun condMapEmpty!9451 () Bool)

(declare-fun mapDefault!9451 () ValueCell!2432)

