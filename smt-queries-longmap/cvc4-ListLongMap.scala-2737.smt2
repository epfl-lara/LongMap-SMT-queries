; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40244 () Bool)

(assert start!40244)

(declare-fun b_free!10511 () Bool)

(declare-fun b_next!10511 () Bool)

(assert (=> start!40244 (= b_free!10511 (not b_next!10511))))

(declare-fun tp!37061 () Bool)

(declare-fun b_and!18479 () Bool)

(assert (=> start!40244 (= tp!37061 b_and!18479)))

(declare-fun b!441620 () Bool)

(declare-fun e!260010 () Bool)

(declare-fun e!260012 () Bool)

(declare-fun mapRes!19116 () Bool)

(assert (=> b!441620 (= e!260010 (and e!260012 mapRes!19116))))

(declare-fun condMapEmpty!19116 () Bool)

(declare-datatypes ((V!16655 0))(
  ( (V!16656 (val!5876 Int)) )
))
(declare-datatypes ((ValueCell!5488 0))(
  ( (ValueCellFull!5488 (v!8123 V!16655)) (EmptyCell!5488) )
))
(declare-datatypes ((array!27139 0))(
  ( (array!27140 (arr!13019 (Array (_ BitVec 32) ValueCell!5488)) (size!13371 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27139)

(declare-fun mapDefault!19116 () ValueCell!5488)

