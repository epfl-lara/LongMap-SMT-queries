; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15608 () Bool)

(assert start!15608)

(declare-fun b!155442 () Bool)

(declare-fun b_free!3275 () Bool)

(declare-fun b_next!3275 () Bool)

(assert (=> b!155442 (= b_free!3275 (not b_next!3275))))

(declare-fun tp!12350 () Bool)

(declare-fun b_and!9689 () Bool)

(assert (=> b!155442 (= tp!12350 b_and!9689)))

(declare-fun b!155436 () Bool)

(declare-fun e!101553 () Bool)

(declare-fun e!101548 () Bool)

(declare-fun mapRes!5258 () Bool)

(assert (=> b!155436 (= e!101553 (and e!101548 mapRes!5258))))

(declare-fun condMapEmpty!5258 () Bool)

(declare-datatypes ((V!3749 0))(
  ( (V!3750 (val!1583 Int)) )
))
(declare-datatypes ((ValueCell!1195 0))(
  ( (ValueCellFull!1195 (v!3448 V!3749)) (EmptyCell!1195) )
))
(declare-datatypes ((array!5207 0))(
  ( (array!5208 (arr!2461 (Array (_ BitVec 32) (_ BitVec 64))) (size!2739 (_ BitVec 32))) )
))
(declare-datatypes ((array!5209 0))(
  ( (array!5210 (arr!2462 (Array (_ BitVec 32) ValueCell!1195)) (size!2740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1298 0))(
  ( (LongMapFixedSize!1299 (defaultEntry!3091 Int) (mask!7514 (_ BitVec 32)) (extraKeys!2832 (_ BitVec 32)) (zeroValue!2934 V!3749) (minValue!2934 V!3749) (_size!698 (_ BitVec 32)) (_keys!4866 array!5207) (_values!3074 array!5209) (_vacant!698 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1298)

(declare-fun mapDefault!5258 () ValueCell!1195)

