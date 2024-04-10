; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78028 () Bool)

(assert start!78028)

(declare-fun b_free!16555 () Bool)

(declare-fun b_next!16555 () Bool)

(assert (=> start!78028 (= b_free!16555 (not b_next!16555))))

(declare-fun tp!57936 () Bool)

(declare-fun b_and!27127 () Bool)

(assert (=> start!78028 (= tp!57936 b_and!27127)))

(declare-fun mapIsEmpty!30181 () Bool)

(declare-fun mapRes!30181 () Bool)

(assert (=> mapIsEmpty!30181 mapRes!30181))

(declare-fun b!910842 () Bool)

(declare-fun e!510750 () Bool)

(declare-fun e!510748 () Bool)

(assert (=> b!910842 (= e!510750 (and e!510748 mapRes!30181))))

(declare-fun condMapEmpty!30181 () Bool)

(declare-datatypes ((V!30263 0))(
  ( (V!30264 (val!9537 Int)) )
))
(declare-datatypes ((ValueCell!9005 0))(
  ( (ValueCellFull!9005 (v!12046 V!30263)) (EmptyCell!9005) )
))
(declare-datatypes ((array!53958 0))(
  ( (array!53959 (arr!25935 (Array (_ BitVec 32) ValueCell!9005)) (size!26394 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53958)

(declare-fun mapDefault!30181 () ValueCell!9005)

