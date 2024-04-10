; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40004 () Bool)

(assert start!40004)

(declare-fun b_free!10271 () Bool)

(declare-fun b_next!10271 () Bool)

(assert (=> start!40004 (= b_free!10271 (not b_next!10271))))

(declare-fun tp!36342 () Bool)

(declare-fun b_and!18201 () Bool)

(assert (=> start!40004 (= tp!36342 b_and!18201)))

(declare-fun b!435602 () Bool)

(declare-fun e!257331 () Bool)

(declare-fun e!257327 () Bool)

(declare-fun mapRes!18756 () Bool)

(assert (=> b!435602 (= e!257331 (and e!257327 mapRes!18756))))

(declare-fun condMapEmpty!18756 () Bool)

(declare-datatypes ((V!16335 0))(
  ( (V!16336 (val!5756 Int)) )
))
(declare-datatypes ((ValueCell!5368 0))(
  ( (ValueCellFull!5368 (v!8003 V!16335)) (EmptyCell!5368) )
))
(declare-datatypes ((array!26675 0))(
  ( (array!26676 (arr!12787 (Array (_ BitVec 32) ValueCell!5368)) (size!13139 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26675)

(declare-fun mapDefault!18756 () ValueCell!5368)

