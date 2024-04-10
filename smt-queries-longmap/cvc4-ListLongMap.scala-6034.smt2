; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78108 () Bool)

(assert start!78108)

(declare-fun b_free!16619 () Bool)

(declare-fun b_next!16619 () Bool)

(assert (=> start!78108 (= b_free!16619 (not b_next!16619))))

(declare-fun tp!58130 () Bool)

(declare-fun b_and!27193 () Bool)

(assert (=> start!78108 (= tp!58130 b_and!27193)))

(declare-fun b!911641 () Bool)

(declare-fun e!511302 () Bool)

(declare-fun e!511301 () Bool)

(declare-fun mapRes!30280 () Bool)

(assert (=> b!911641 (= e!511302 (and e!511301 mapRes!30280))))

(declare-fun condMapEmpty!30280 () Bool)

(declare-datatypes ((V!30347 0))(
  ( (V!30348 (val!9569 Int)) )
))
(declare-datatypes ((ValueCell!9037 0))(
  ( (ValueCellFull!9037 (v!12079 V!30347)) (EmptyCell!9037) )
))
(declare-datatypes ((array!54076 0))(
  ( (array!54077 (arr!25993 (Array (_ BitVec 32) ValueCell!9037)) (size!26452 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54076)

(declare-fun mapDefault!30280 () ValueCell!9037)

