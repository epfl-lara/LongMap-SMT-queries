; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15566 () Bool)

(assert start!15566)

(declare-fun b!154875 () Bool)

(declare-fun b_free!3233 () Bool)

(declare-fun b_next!3233 () Bool)

(assert (=> b!154875 (= b_free!3233 (not b_next!3233))))

(declare-fun tp!12224 () Bool)

(declare-fun b_and!9647 () Bool)

(assert (=> b!154875 (= tp!12224 b_and!9647)))

(declare-fun b!154869 () Bool)

(declare-fun e!101172 () Bool)

(declare-fun e!101170 () Bool)

(declare-fun mapRes!5195 () Bool)

(assert (=> b!154869 (= e!101172 (and e!101170 mapRes!5195))))

(declare-fun condMapEmpty!5195 () Bool)

(declare-datatypes ((V!3693 0))(
  ( (V!3694 (val!1562 Int)) )
))
(declare-datatypes ((ValueCell!1174 0))(
  ( (ValueCellFull!1174 (v!3427 V!3693)) (EmptyCell!1174) )
))
(declare-datatypes ((array!5123 0))(
  ( (array!5124 (arr!2419 (Array (_ BitVec 32) (_ BitVec 64))) (size!2697 (_ BitVec 32))) )
))
(declare-datatypes ((array!5125 0))(
  ( (array!5126 (arr!2420 (Array (_ BitVec 32) ValueCell!1174)) (size!2698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1256 0))(
  ( (LongMapFixedSize!1257 (defaultEntry!3070 Int) (mask!7479 (_ BitVec 32)) (extraKeys!2811 (_ BitVec 32)) (zeroValue!2913 V!3693) (minValue!2913 V!3693) (_size!677 (_ BitVec 32)) (_keys!4845 array!5123) (_values!3053 array!5125) (_vacant!677 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1256)

(declare-fun mapDefault!5195 () ValueCell!1174)

