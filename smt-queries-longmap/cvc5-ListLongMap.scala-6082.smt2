; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78600 () Bool)

(assert start!78600)

(declare-fun b_free!16813 () Bool)

(declare-fun b_next!16813 () Bool)

(assert (=> start!78600 (= b_free!16813 (not b_next!16813))))

(declare-fun tp!58879 () Bool)

(declare-fun b_and!27435 () Bool)

(assert (=> start!78600 (= tp!58879 b_and!27435)))

(declare-fun b!916251 () Bool)

(declare-fun e!514320 () Bool)

(declare-fun e!514321 () Bool)

(declare-fun mapRes!30738 () Bool)

(assert (=> b!916251 (= e!514320 (and e!514321 mapRes!30738))))

(declare-fun condMapEmpty!30738 () Bool)

(declare-datatypes ((V!30727 0))(
  ( (V!30728 (val!9711 Int)) )
))
(declare-datatypes ((ValueCell!9179 0))(
  ( (ValueCellFull!9179 (v!12229 V!30727)) (EmptyCell!9179) )
))
(declare-datatypes ((array!54634 0))(
  ( (array!54635 (arr!26262 (Array (_ BitVec 32) ValueCell!9179)) (size!26721 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54634)

(declare-fun mapDefault!30738 () ValueCell!9179)

