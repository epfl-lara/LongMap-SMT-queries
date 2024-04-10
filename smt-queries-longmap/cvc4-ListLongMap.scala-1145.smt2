; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23794 () Bool)

(assert start!23794)

(declare-fun b!249804 () Bool)

(declare-fun b_free!6623 () Bool)

(declare-fun b_next!6623 () Bool)

(assert (=> b!249804 (= b_free!6623 (not b_next!6623))))

(declare-fun tp!23129 () Bool)

(declare-fun b_and!13637 () Bool)

(assert (=> b!249804 (= tp!23129 b_and!13637)))

(declare-fun b!249803 () Bool)

(declare-fun e!162025 () Bool)

(declare-fun e!162022 () Bool)

(declare-fun mapRes!11016 () Bool)

(assert (=> b!249803 (= e!162025 (and e!162022 mapRes!11016))))

(declare-fun condMapEmpty!11016 () Bool)

(declare-datatypes ((V!8293 0))(
  ( (V!8294 (val!3287 Int)) )
))
(declare-datatypes ((ValueCell!2899 0))(
  ( (ValueCellFull!2899 (v!5350 V!8293)) (EmptyCell!2899) )
))
(declare-datatypes ((array!12285 0))(
  ( (array!12286 (arr!5826 (Array (_ BitVec 32) ValueCell!2899)) (size!6170 (_ BitVec 32))) )
))
(declare-datatypes ((array!12287 0))(
  ( (array!12288 (arr!5827 (Array (_ BitVec 32) (_ BitVec 64))) (size!6171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3698 0))(
  ( (LongMapFixedSize!3699 (defaultEntry!4618 Int) (mask!10790 (_ BitVec 32)) (extraKeys!4355 (_ BitVec 32)) (zeroValue!4459 V!8293) (minValue!4459 V!8293) (_size!1898 (_ BitVec 32)) (_keys!6750 array!12287) (_values!4601 array!12285) (_vacant!1898 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3698)

(declare-fun mapDefault!11016 () ValueCell!2899)

