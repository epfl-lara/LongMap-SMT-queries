; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21400 () Bool)

(assert start!21400)

(declare-fun b!215038 () Bool)

(declare-fun b_free!5705 () Bool)

(declare-fun b_next!5705 () Bool)

(assert (=> b!215038 (= b_free!5705 (not b_next!5705))))

(declare-fun tp!20218 () Bool)

(declare-fun b_and!12595 () Bool)

(assert (=> b!215038 (= tp!20218 b_and!12595)))

(declare-fun b!215037 () Bool)

(declare-fun e!139877 () Bool)

(declare-fun tp_is_empty!5567 () Bool)

(assert (=> b!215037 (= e!139877 tp_is_empty!5567)))

(declare-fun e!139874 () Bool)

(declare-datatypes ((V!7069 0))(
  ( (V!7070 (val!2828 Int)) )
))
(declare-datatypes ((ValueCell!2440 0))(
  ( (ValueCellFull!2440 (v!4846 V!7069)) (EmptyCell!2440) )
))
(declare-datatypes ((array!10355 0))(
  ( (array!10356 (arr!4908 (Array (_ BitVec 32) ValueCell!2440)) (size!5236 (_ BitVec 32))) )
))
(declare-datatypes ((array!10357 0))(
  ( (array!10358 (arr!4909 (Array (_ BitVec 32) (_ BitVec 64))) (size!5237 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2780 0))(
  ( (LongMapFixedSize!2781 (defaultEntry!4040 Int) (mask!9722 (_ BitVec 32)) (extraKeys!3777 (_ BitVec 32)) (zeroValue!3881 V!7069) (minValue!3881 V!7069) (_size!1439 (_ BitVec 32)) (_keys!6065 array!10357) (_values!4023 array!10355) (_vacant!1439 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2780)

(declare-fun e!139879 () Bool)

(declare-fun array_inv!3251 (array!10357) Bool)

(declare-fun array_inv!3252 (array!10355) Bool)

(assert (=> b!215038 (= e!139874 (and tp!20218 tp_is_empty!5567 (array_inv!3251 (_keys!6065 thiss!1504)) (array_inv!3252 (_values!4023 thiss!1504)) e!139879))))

(declare-fun b!215039 () Bool)

(declare-fun e!139878 () Bool)

(assert (=> b!215039 (= e!139878 tp_is_empty!5567)))

(declare-fun b!215040 () Bool)

(declare-fun e!139880 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215040 (= e!139880 (not (validMask!0 (mask!9722 thiss!1504))))))

(declare-fun b!215041 () Bool)

(declare-fun mapRes!9482 () Bool)

(assert (=> b!215041 (= e!139879 (and e!139877 mapRes!9482))))

(declare-fun condMapEmpty!9482 () Bool)

(declare-fun mapDefault!9482 () ValueCell!2440)

