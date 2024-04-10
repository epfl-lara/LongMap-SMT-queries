; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78214 () Bool)

(assert start!78214)

(declare-fun b_free!16705 () Bool)

(declare-fun b_next!16705 () Bool)

(assert (=> start!78214 (= b_free!16705 (not b_next!16705))))

(declare-fun tp!58392 () Bool)

(declare-fun b_and!27281 () Bool)

(assert (=> start!78214 (= tp!58392 b_and!27281)))

(declare-fun b!912833 () Bool)

(declare-fun e!512026 () Bool)

(declare-fun tp_is_empty!19123 () Bool)

(assert (=> b!912833 (= e!512026 tp_is_empty!19123)))

(declare-fun b!912834 () Bool)

(declare-fun e!512027 () Bool)

(declare-fun mapRes!30412 () Bool)

(assert (=> b!912834 (= e!512027 (and e!512026 mapRes!30412))))

(declare-fun condMapEmpty!30412 () Bool)

(declare-datatypes ((V!30463 0))(
  ( (V!30464 (val!9612 Int)) )
))
(declare-datatypes ((ValueCell!9080 0))(
  ( (ValueCellFull!9080 (v!12123 V!30463)) (EmptyCell!9080) )
))
(declare-datatypes ((array!54240 0))(
  ( (array!54241 (arr!26074 (Array (_ BitVec 32) ValueCell!9080)) (size!26533 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54240)

(declare-fun mapDefault!30412 () ValueCell!9080)

