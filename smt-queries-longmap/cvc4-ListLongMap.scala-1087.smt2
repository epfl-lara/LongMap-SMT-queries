; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22208 () Bool)

(assert start!22208)

(declare-fun b!232947 () Bool)

(declare-fun b_free!6275 () Bool)

(declare-fun b_next!6275 () Bool)

(assert (=> b!232947 (= b_free!6275 (not b_next!6275))))

(declare-fun tp!21966 () Bool)

(declare-fun b_and!13173 () Bool)

(assert (=> b!232947 (= tp!21966 b_and!13173)))

(declare-fun b!232937 () Bool)

(declare-fun e!151302 () Bool)

(declare-fun e!151307 () Bool)

(declare-fun mapRes!10375 () Bool)

(assert (=> b!232937 (= e!151302 (and e!151307 mapRes!10375))))

(declare-fun condMapEmpty!10375 () Bool)

(declare-datatypes ((V!7829 0))(
  ( (V!7830 (val!3113 Int)) )
))
(declare-datatypes ((ValueCell!2725 0))(
  ( (ValueCellFull!2725 (v!5133 V!7829)) (EmptyCell!2725) )
))
(declare-datatypes ((array!11517 0))(
  ( (array!11518 (arr!5478 (Array (_ BitVec 32) ValueCell!2725)) (size!5811 (_ BitVec 32))) )
))
(declare-datatypes ((array!11519 0))(
  ( (array!11520 (arr!5479 (Array (_ BitVec 32) (_ BitVec 64))) (size!5812 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3350 0))(
  ( (LongMapFixedSize!3351 (defaultEntry!4334 Int) (mask!10252 (_ BitVec 32)) (extraKeys!4071 (_ BitVec 32)) (zeroValue!4175 V!7829) (minValue!4175 V!7829) (_size!1724 (_ BitVec 32)) (_keys!6388 array!11519) (_values!4317 array!11517) (_vacant!1724 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3350)

(declare-fun mapDefault!10375 () ValueCell!2725)

