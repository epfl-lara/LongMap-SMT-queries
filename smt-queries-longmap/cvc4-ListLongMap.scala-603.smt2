; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15764 () Bool)

(assert start!15764)

(declare-fun b!157316 () Bool)

(declare-fun b_free!3431 () Bool)

(declare-fun b_next!3431 () Bool)

(assert (=> b!157316 (= b_free!3431 (not b_next!3431))))

(declare-fun tp!12818 () Bool)

(declare-fun b_and!9845 () Bool)

(assert (=> b!157316 (= tp!12818 b_and!9845)))

(declare-fun b!157311 () Bool)

(declare-fun e!102993 () Bool)

(declare-fun tp_is_empty!3233 () Bool)

(assert (=> b!157311 (= e!102993 tp_is_empty!3233)))

(declare-fun b!157312 () Bool)

(declare-fun e!102991 () Bool)

(assert (=> b!157312 (= e!102991 tp_is_empty!3233)))

(declare-fun mapIsEmpty!5492 () Bool)

(declare-fun mapRes!5492 () Bool)

(assert (=> mapIsEmpty!5492 mapRes!5492))

(declare-fun mapNonEmpty!5492 () Bool)

(declare-fun tp!12817 () Bool)

(assert (=> mapNonEmpty!5492 (= mapRes!5492 (and tp!12817 e!102993))))

(declare-fun mapKey!5492 () (_ BitVec 32))

(declare-datatypes ((V!3957 0))(
  ( (V!3958 (val!1661 Int)) )
))
(declare-datatypes ((ValueCell!1273 0))(
  ( (ValueCellFull!1273 (v!3526 V!3957)) (EmptyCell!1273) )
))
(declare-fun mapValue!5492 () ValueCell!1273)

(declare-datatypes ((array!5519 0))(
  ( (array!5520 (arr!2617 (Array (_ BitVec 32) (_ BitVec 64))) (size!2895 (_ BitVec 32))) )
))
(declare-datatypes ((array!5521 0))(
  ( (array!5522 (arr!2618 (Array (_ BitVec 32) ValueCell!1273)) (size!2896 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1454 0))(
  ( (LongMapFixedSize!1455 (defaultEntry!3169 Int) (mask!7644 (_ BitVec 32)) (extraKeys!2910 (_ BitVec 32)) (zeroValue!3012 V!3957) (minValue!3012 V!3957) (_size!776 (_ BitVec 32)) (_keys!4944 array!5519) (_values!3152 array!5521) (_vacant!776 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1454)

(declare-fun mapRest!5492 () (Array (_ BitVec 32) ValueCell!1273))

(assert (=> mapNonEmpty!5492 (= (arr!2618 (_values!3152 thiss!1248)) (store mapRest!5492 mapKey!5492 mapValue!5492))))

(declare-fun b!157314 () Bool)

(declare-fun e!102990 () Bool)

(assert (=> b!157314 (= e!102990 (and e!102991 mapRes!5492))))

(declare-fun condMapEmpty!5492 () Bool)

(declare-fun mapDefault!5492 () ValueCell!1273)

