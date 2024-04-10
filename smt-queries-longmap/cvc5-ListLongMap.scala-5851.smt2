; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75626 () Bool)

(assert start!75626)

(declare-fun b!889195 () Bool)

(declare-fun b_free!15607 () Bool)

(declare-fun b_next!15607 () Bool)

(assert (=> b!889195 (= b_free!15607 (not b_next!15607))))

(declare-fun tp!54786 () Bool)

(declare-fun b_and!25847 () Bool)

(assert (=> b!889195 (= tp!54786 b_and!25847)))

(declare-fun mapNonEmpty!28454 () Bool)

(declare-fun mapRes!28454 () Bool)

(declare-fun tp!54787 () Bool)

(declare-fun e!495598 () Bool)

(assert (=> mapNonEmpty!28454 (= mapRes!28454 (and tp!54787 e!495598))))

(declare-datatypes ((array!51848 0))(
  ( (array!51849 (arr!24931 (Array (_ BitVec 32) (_ BitVec 64))) (size!25375 (_ BitVec 32))) )
))
(declare-datatypes ((V!28879 0))(
  ( (V!28880 (val!9018 Int)) )
))
(declare-datatypes ((ValueCell!8486 0))(
  ( (ValueCellFull!8486 (v!11496 V!28879)) (EmptyCell!8486) )
))
(declare-datatypes ((array!51850 0))(
  ( (array!51851 (arr!24932 (Array (_ BitVec 32) ValueCell!8486)) (size!25376 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3988 0))(
  ( (LongMapFixedSize!3989 (defaultEntry!5191 Int) (mask!25633 (_ BitVec 32)) (extraKeys!4885 (_ BitVec 32)) (zeroValue!4989 V!28879) (minValue!4989 V!28879) (_size!2049 (_ BitVec 32)) (_keys!9874 array!51848) (_values!5176 array!51850) (_vacant!2049 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3988)

(declare-fun mapValue!28454 () ValueCell!8486)

(declare-fun mapRest!28454 () (Array (_ BitVec 32) ValueCell!8486))

(declare-fun mapKey!28454 () (_ BitVec 32))

(assert (=> mapNonEmpty!28454 (= (arr!24932 (_values!5176 thiss!1181)) (store mapRest!28454 mapKey!28454 mapValue!28454))))

(declare-fun b!889191 () Bool)

(declare-fun e!495602 () Bool)

(declare-fun tp_is_empty!17935 () Bool)

(assert (=> b!889191 (= e!495602 tp_is_empty!17935)))

(declare-fun b!889192 () Bool)

(assert (=> b!889192 (= e!495598 tp_is_empty!17935)))

(declare-fun mapIsEmpty!28454 () Bool)

(assert (=> mapIsEmpty!28454 mapRes!28454))

(declare-fun b!889193 () Bool)

(declare-fun e!495599 () Bool)

(assert (=> b!889193 (= e!495599 (and e!495602 mapRes!28454))))

(declare-fun condMapEmpty!28454 () Bool)

(declare-fun mapDefault!28454 () ValueCell!8486)

