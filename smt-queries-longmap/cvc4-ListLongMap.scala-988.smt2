; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21320 () Bool)

(assert start!21320)

(declare-fun b!214511 () Bool)

(declare-fun b_free!5681 () Bool)

(declare-fun b_next!5681 () Bool)

(assert (=> b!214511 (= b_free!5681 (not b_next!5681))))

(declare-fun tp!20134 () Bool)

(declare-fun b_and!12571 () Bool)

(assert (=> b!214511 (= tp!20134 b_and!12571)))

(declare-fun mapIsEmpty!9433 () Bool)

(declare-fun mapRes!9433 () Bool)

(assert (=> mapIsEmpty!9433 mapRes!9433))

(declare-datatypes ((V!7037 0))(
  ( (V!7038 (val!2816 Int)) )
))
(declare-datatypes ((ValueCell!2428 0))(
  ( (ValueCellFull!2428 (v!4834 V!7037)) (EmptyCell!2428) )
))
(declare-datatypes ((array!10299 0))(
  ( (array!10300 (arr!4884 (Array (_ BitVec 32) ValueCell!2428)) (size!5211 (_ BitVec 32))) )
))
(declare-datatypes ((array!10301 0))(
  ( (array!10302 (arr!4885 (Array (_ BitVec 32) (_ BitVec 64))) (size!5212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2756 0))(
  ( (LongMapFixedSize!2757 (defaultEntry!4028 Int) (mask!9690 (_ BitVec 32)) (extraKeys!3765 (_ BitVec 32)) (zeroValue!3869 V!7037) (minValue!3869 V!7037) (_size!1427 (_ BitVec 32)) (_keys!6046 array!10301) (_values!4011 array!10299) (_vacant!1427 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2756)

(declare-fun tp_is_empty!5543 () Bool)

(declare-fun e!139522 () Bool)

(declare-fun e!139524 () Bool)

(declare-fun array_inv!3229 (array!10301) Bool)

(declare-fun array_inv!3230 (array!10299) Bool)

(assert (=> b!214511 (= e!139524 (and tp!20134 tp_is_empty!5543 (array_inv!3229 (_keys!6046 thiss!1504)) (array_inv!3230 (_values!4011 thiss!1504)) e!139522))))

(declare-fun mapNonEmpty!9433 () Bool)

(declare-fun tp!20133 () Bool)

(declare-fun e!139525 () Bool)

(assert (=> mapNonEmpty!9433 (= mapRes!9433 (and tp!20133 e!139525))))

(declare-fun mapValue!9433 () ValueCell!2428)

(declare-fun mapKey!9433 () (_ BitVec 32))

(declare-fun mapRest!9433 () (Array (_ BitVec 32) ValueCell!2428))

(assert (=> mapNonEmpty!9433 (= (arr!4884 (_values!4011 thiss!1504)) (store mapRest!9433 mapKey!9433 mapValue!9433))))

(declare-fun b!214512 () Bool)

(declare-fun e!139527 () Bool)

(assert (=> b!214512 (= e!139527 tp_is_empty!5543)))

(declare-fun b!214513 () Bool)

(assert (=> b!214513 (= e!139522 (and e!139527 mapRes!9433))))

(declare-fun condMapEmpty!9433 () Bool)

(declare-fun mapDefault!9433 () ValueCell!2428)

