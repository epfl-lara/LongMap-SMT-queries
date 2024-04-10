; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78070 () Bool)

(assert start!78070)

(declare-fun b_free!16597 () Bool)

(declare-fun b_next!16597 () Bool)

(assert (=> start!78070 (= b_free!16597 (not b_next!16597))))

(declare-fun tp!58062 () Bool)

(declare-fun b_and!27169 () Bool)

(assert (=> start!78070 (= tp!58062 b_and!27169)))

(declare-fun b!911283 () Bool)

(declare-fun e!511063 () Bool)

(declare-fun e!511062 () Bool)

(declare-fun mapRes!30244 () Bool)

(assert (=> b!911283 (= e!511063 (and e!511062 mapRes!30244))))

(declare-fun condMapEmpty!30244 () Bool)

(declare-datatypes ((V!30319 0))(
  ( (V!30320 (val!9558 Int)) )
))
(declare-datatypes ((ValueCell!9026 0))(
  ( (ValueCellFull!9026 (v!12067 V!30319)) (EmptyCell!9026) )
))
(declare-datatypes ((array!54032 0))(
  ( (array!54033 (arr!25972 (Array (_ BitVec 32) ValueCell!9026)) (size!26431 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54032)

(declare-fun mapDefault!30244 () ValueCell!9026)

