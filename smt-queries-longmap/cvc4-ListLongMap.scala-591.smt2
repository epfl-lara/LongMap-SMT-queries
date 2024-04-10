; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15692 () Bool)

(assert start!15692)

(declare-fun b!156459 () Bool)

(declare-fun b_free!3359 () Bool)

(declare-fun b_next!3359 () Bool)

(assert (=> b!156459 (= b_free!3359 (not b_next!3359))))

(declare-fun tp!12602 () Bool)

(declare-fun b_and!9773 () Bool)

(assert (=> b!156459 (= tp!12602 b_and!9773)))

(declare-fun b!156453 () Bool)

(declare-fun e!102323 () Bool)

(declare-fun e!102327 () Bool)

(declare-fun mapRes!5384 () Bool)

(assert (=> b!156453 (= e!102323 (and e!102327 mapRes!5384))))

(declare-fun condMapEmpty!5384 () Bool)

(declare-datatypes ((V!3861 0))(
  ( (V!3862 (val!1625 Int)) )
))
(declare-datatypes ((ValueCell!1237 0))(
  ( (ValueCellFull!1237 (v!3490 V!3861)) (EmptyCell!1237) )
))
(declare-datatypes ((array!5375 0))(
  ( (array!5376 (arr!2545 (Array (_ BitVec 32) (_ BitVec 64))) (size!2823 (_ BitVec 32))) )
))
(declare-datatypes ((array!5377 0))(
  ( (array!5378 (arr!2546 (Array (_ BitVec 32) ValueCell!1237)) (size!2824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1382 0))(
  ( (LongMapFixedSize!1383 (defaultEntry!3133 Int) (mask!7584 (_ BitVec 32)) (extraKeys!2874 (_ BitVec 32)) (zeroValue!2976 V!3861) (minValue!2976 V!3861) (_size!740 (_ BitVec 32)) (_keys!4908 array!5375) (_values!3116 array!5377) (_vacant!740 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1382)

(declare-fun mapDefault!5384 () ValueCell!1237)

