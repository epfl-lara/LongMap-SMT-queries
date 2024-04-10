; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16066 () Bool)

(assert start!16066)

(declare-fun b!159501 () Bool)

(declare-fun b_free!3527 () Bool)

(declare-fun b_next!3527 () Bool)

(assert (=> b!159501 (= b_free!3527 (not b_next!3527))))

(declare-fun tp!13150 () Bool)

(declare-fun b_and!9941 () Bool)

(assert (=> b!159501 (= tp!13150 b_and!9941)))

(declare-fun b!159495 () Bool)

(declare-fun e!104392 () Bool)

(declare-fun e!104390 () Bool)

(declare-fun mapRes!5681 () Bool)

(assert (=> b!159495 (= e!104392 (and e!104390 mapRes!5681))))

(declare-fun condMapEmpty!5681 () Bool)

(declare-datatypes ((V!4085 0))(
  ( (V!4086 (val!1709 Int)) )
))
(declare-datatypes ((ValueCell!1321 0))(
  ( (ValueCellFull!1321 (v!3574 V!4085)) (EmptyCell!1321) )
))
(declare-datatypes ((array!5737 0))(
  ( (array!5738 (arr!2713 (Array (_ BitVec 32) (_ BitVec 64))) (size!2997 (_ BitVec 32))) )
))
(declare-datatypes ((array!5739 0))(
  ( (array!5740 (arr!2714 (Array (_ BitVec 32) ValueCell!1321)) (size!2998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1550 0))(
  ( (LongMapFixedSize!1551 (defaultEntry!3217 Int) (mask!7767 (_ BitVec 32)) (extraKeys!2958 (_ BitVec 32)) (zeroValue!3060 V!4085) (minValue!3060 V!4085) (_size!824 (_ BitVec 32)) (_keys!5018 array!5737) (_values!3200 array!5739) (_vacant!824 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1550)

(declare-fun mapDefault!5681 () ValueCell!1321)

