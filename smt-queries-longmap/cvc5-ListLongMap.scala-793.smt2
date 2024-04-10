; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18904 () Bool)

(assert start!18904)

(declare-fun b!186615 () Bool)

(declare-fun b_free!4597 () Bool)

(declare-fun b_next!4597 () Bool)

(assert (=> b!186615 (= b_free!4597 (not b_next!4597))))

(declare-fun tp!16597 () Bool)

(declare-fun b_and!11207 () Bool)

(assert (=> b!186615 (= tp!16597 b_and!11207)))

(declare-fun b!186608 () Bool)

(declare-fun e!122808 () Bool)

(declare-fun e!122809 () Bool)

(declare-fun mapRes!7522 () Bool)

(assert (=> b!186608 (= e!122808 (and e!122809 mapRes!7522))))

(declare-fun condMapEmpty!7522 () Bool)

(declare-datatypes ((V!5473 0))(
  ( (V!5474 (val!2229 Int)) )
))
(declare-datatypes ((ValueCell!1841 0))(
  ( (ValueCellFull!1841 (v!4142 V!5473)) (EmptyCell!1841) )
))
(declare-datatypes ((array!7951 0))(
  ( (array!7952 (arr!3753 (Array (_ BitVec 32) (_ BitVec 64))) (size!4070 (_ BitVec 32))) )
))
(declare-datatypes ((array!7953 0))(
  ( (array!7954 (arr!3754 (Array (_ BitVec 32) ValueCell!1841)) (size!4071 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2590 0))(
  ( (LongMapFixedSize!2591 (defaultEntry!3806 Int) (mask!8937 (_ BitVec 32)) (extraKeys!3543 (_ BitVec 32)) (zeroValue!3647 V!5473) (minValue!3647 V!5473) (_size!1344 (_ BitVec 32)) (_keys!5752 array!7951) (_values!3789 array!7953) (_vacant!1344 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2590)

(declare-fun mapDefault!7522 () ValueCell!1841)

