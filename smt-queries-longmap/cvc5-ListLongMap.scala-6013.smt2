; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77946 () Bool)

(assert start!77946)

(declare-fun b_free!16489 () Bool)

(declare-fun b_next!16489 () Bool)

(assert (=> start!77946 (= b_free!16489 (not b_next!16489))))

(declare-fun tp!57734 () Bool)

(declare-fun b_and!27059 () Bool)

(assert (=> start!77946 (= tp!57734 b_and!27059)))

(declare-fun b!910022 () Bool)

(declare-fun e!510183 () Bool)

(declare-fun e!510180 () Bool)

(declare-fun mapRes!30079 () Bool)

(assert (=> b!910022 (= e!510183 (and e!510180 mapRes!30079))))

(declare-fun condMapEmpty!30079 () Bool)

(declare-datatypes ((V!30175 0))(
  ( (V!30176 (val!9504 Int)) )
))
(declare-datatypes ((ValueCell!8972 0))(
  ( (ValueCellFull!8972 (v!12012 V!30175)) (EmptyCell!8972) )
))
(declare-datatypes ((array!53836 0))(
  ( (array!53837 (arr!25875 (Array (_ BitVec 32) ValueCell!8972)) (size!26334 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53836)

(declare-fun mapDefault!30079 () ValueCell!8972)

