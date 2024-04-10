; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16098 () Bool)

(assert start!16098)

(declare-fun b!160033 () Bool)

(declare-fun b_free!3559 () Bool)

(declare-fun b_next!3559 () Bool)

(assert (=> b!160033 (= b_free!3559 (not b_next!3559))))

(declare-fun tp!13247 () Bool)

(declare-fun b_and!9973 () Bool)

(assert (=> b!160033 (= tp!13247 b_and!9973)))

(declare-fun b!160023 () Bool)

(declare-fun e!104679 () Bool)

(declare-fun e!104678 () Bool)

(declare-fun mapRes!5729 () Bool)

(assert (=> b!160023 (= e!104679 (and e!104678 mapRes!5729))))

(declare-fun condMapEmpty!5729 () Bool)

(declare-datatypes ((V!4129 0))(
  ( (V!4130 (val!1725 Int)) )
))
(declare-datatypes ((ValueCell!1337 0))(
  ( (ValueCellFull!1337 (v!3590 V!4129)) (EmptyCell!1337) )
))
(declare-datatypes ((array!5801 0))(
  ( (array!5802 (arr!2745 (Array (_ BitVec 32) (_ BitVec 64))) (size!3029 (_ BitVec 32))) )
))
(declare-datatypes ((array!5803 0))(
  ( (array!5804 (arr!2746 (Array (_ BitVec 32) ValueCell!1337)) (size!3030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1582 0))(
  ( (LongMapFixedSize!1583 (defaultEntry!3233 Int) (mask!7795 (_ BitVec 32)) (extraKeys!2974 (_ BitVec 32)) (zeroValue!3076 V!4129) (minValue!3076 V!4129) (_size!840 (_ BitVec 32)) (_keys!5034 array!5801) (_values!3216 array!5803) (_vacant!840 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1582)

(declare-fun mapDefault!5729 () ValueCell!1337)

