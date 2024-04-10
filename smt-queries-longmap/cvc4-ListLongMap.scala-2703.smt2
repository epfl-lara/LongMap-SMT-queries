; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40040 () Bool)

(assert start!40040)

(declare-fun b_free!10307 () Bool)

(declare-fun b_next!10307 () Bool)

(assert (=> start!40040 (= b_free!10307 (not b_next!10307))))

(declare-fun tp!36450 () Bool)

(declare-fun b_and!18273 () Bool)

(assert (=> start!40040 (= tp!36450 b_and!18273)))

(declare-fun b!436718 () Bool)

(declare-fun e!257868 () Bool)

(declare-fun e!257862 () Bool)

(declare-fun mapRes!18810 () Bool)

(assert (=> b!436718 (= e!257868 (and e!257862 mapRes!18810))))

(declare-fun condMapEmpty!18810 () Bool)

(declare-datatypes ((V!16383 0))(
  ( (V!16384 (val!5774 Int)) )
))
(declare-datatypes ((ValueCell!5386 0))(
  ( (ValueCellFull!5386 (v!8021 V!16383)) (EmptyCell!5386) )
))
(declare-datatypes ((array!26743 0))(
  ( (array!26744 (arr!12821 (Array (_ BitVec 32) ValueCell!5386)) (size!13173 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26743)

(declare-fun mapDefault!18810 () ValueCell!5386)

