; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15770 () Bool)

(assert start!15770)

(declare-fun b!157367 () Bool)

(declare-fun b_free!3437 () Bool)

(declare-fun b_next!3437 () Bool)

(assert (=> b!157367 (= b_free!3437 (not b_next!3437))))

(declare-fun tp!12835 () Bool)

(declare-fun b_and!9851 () Bool)

(assert (=> b!157367 (= tp!12835 b_and!9851)))

(declare-fun mapNonEmpty!5501 () Bool)

(declare-fun mapRes!5501 () Bool)

(declare-fun tp!12836 () Bool)

(declare-fun e!103044 () Bool)

(assert (=> mapNonEmpty!5501 (= mapRes!5501 (and tp!12836 e!103044))))

(declare-datatypes ((V!3965 0))(
  ( (V!3966 (val!1664 Int)) )
))
(declare-datatypes ((ValueCell!1276 0))(
  ( (ValueCellFull!1276 (v!3529 V!3965)) (EmptyCell!1276) )
))
(declare-fun mapRest!5501 () (Array (_ BitVec 32) ValueCell!1276))

(declare-fun mapKey!5501 () (_ BitVec 32))

(declare-datatypes ((array!5531 0))(
  ( (array!5532 (arr!2623 (Array (_ BitVec 32) (_ BitVec 64))) (size!2901 (_ BitVec 32))) )
))
(declare-datatypes ((array!5533 0))(
  ( (array!5534 (arr!2624 (Array (_ BitVec 32) ValueCell!1276)) (size!2902 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1460 0))(
  ( (LongMapFixedSize!1461 (defaultEntry!3172 Int) (mask!7649 (_ BitVec 32)) (extraKeys!2913 (_ BitVec 32)) (zeroValue!3015 V!3965) (minValue!3015 V!3965) (_size!779 (_ BitVec 32)) (_keys!4947 array!5531) (_values!3155 array!5533) (_vacant!779 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1460)

(declare-fun mapValue!5501 () ValueCell!1276)

(assert (=> mapNonEmpty!5501 (= (arr!2624 (_values!3155 thiss!1248)) (store mapRest!5501 mapKey!5501 mapValue!5501))))

(declare-fun b!157365 () Bool)

(declare-fun e!103046 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157365 (= e!103046 (not (validMask!0 (mask!7649 thiss!1248))))))

(declare-fun b!157366 () Bool)

(declare-fun tp_is_empty!3239 () Bool)

(assert (=> b!157366 (= e!103044 tp_is_empty!3239)))

(declare-fun e!103043 () Bool)

(declare-fun e!103045 () Bool)

(declare-fun array_inv!1663 (array!5531) Bool)

(declare-fun array_inv!1664 (array!5533) Bool)

(assert (=> b!157367 (= e!103043 (and tp!12835 tp_is_empty!3239 (array_inv!1663 (_keys!4947 thiss!1248)) (array_inv!1664 (_values!3155 thiss!1248)) e!103045))))

(declare-fun res!74367 () Bool)

(assert (=> start!15770 (=> (not res!74367) (not e!103046))))

(declare-fun valid!693 (LongMapFixedSize!1460) Bool)

(assert (=> start!15770 (= res!74367 (valid!693 thiss!1248))))

(assert (=> start!15770 e!103046))

(assert (=> start!15770 e!103043))

(assert (=> start!15770 true))

(declare-fun b!157368 () Bool)

(declare-fun e!103047 () Bool)

(assert (=> b!157368 (= e!103045 (and e!103047 mapRes!5501))))

(declare-fun condMapEmpty!5501 () Bool)

(declare-fun mapDefault!5501 () ValueCell!1276)

