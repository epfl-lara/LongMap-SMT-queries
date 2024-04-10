; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78184 () Bool)

(assert start!78184)

(declare-fun b_free!16675 () Bool)

(declare-fun b_next!16675 () Bool)

(assert (=> start!78184 (= b_free!16675 (not b_next!16675))))

(declare-fun tp!58302 () Bool)

(declare-fun b_and!27251 () Bool)

(assert (=> start!78184 (= tp!58302 b_and!27251)))

(declare-fun b!912383 () Bool)

(declare-fun e!511803 () Bool)

(declare-fun e!511801 () Bool)

(declare-fun mapRes!30367 () Bool)

(assert (=> b!912383 (= e!511803 (and e!511801 mapRes!30367))))

(declare-fun condMapEmpty!30367 () Bool)

(declare-datatypes ((V!30423 0))(
  ( (V!30424 (val!9597 Int)) )
))
(declare-datatypes ((ValueCell!9065 0))(
  ( (ValueCellFull!9065 (v!12108 V!30423)) (EmptyCell!9065) )
))
(declare-datatypes ((array!54182 0))(
  ( (array!54183 (arr!26045 (Array (_ BitVec 32) ValueCell!9065)) (size!26504 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54182)

(declare-fun mapDefault!30367 () ValueCell!9065)

