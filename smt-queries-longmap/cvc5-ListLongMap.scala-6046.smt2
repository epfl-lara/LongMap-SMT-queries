; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78196 () Bool)

(assert start!78196)

(declare-fun b_free!16687 () Bool)

(declare-fun b_next!16687 () Bool)

(assert (=> start!78196 (= b_free!16687 (not b_next!16687))))

(declare-fun tp!58338 () Bool)

(declare-fun b_and!27263 () Bool)

(assert (=> start!78196 (= tp!58338 b_and!27263)))

(declare-fun b!912563 () Bool)

(declare-fun res!615588 () Bool)

(declare-fun e!511891 () Bool)

(assert (=> b!912563 (=> (not res!615588) (not e!511891))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54204 0))(
  ( (array!54205 (arr!26056 (Array (_ BitVec 32) (_ BitVec 64))) (size!26515 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54204)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912563 (= res!615588 (and (= (select (arr!26056 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912565 () Bool)

(declare-fun e!511890 () Bool)

(declare-fun e!511893 () Bool)

(declare-fun mapRes!30385 () Bool)

(assert (=> b!912565 (= e!511890 (and e!511893 mapRes!30385))))

(declare-fun condMapEmpty!30385 () Bool)

(declare-datatypes ((V!30439 0))(
  ( (V!30440 (val!9603 Int)) )
))
(declare-datatypes ((ValueCell!9071 0))(
  ( (ValueCellFull!9071 (v!12114 V!30439)) (EmptyCell!9071) )
))
(declare-datatypes ((array!54206 0))(
  ( (array!54207 (arr!26057 (Array (_ BitVec 32) ValueCell!9071)) (size!26516 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54206)

(declare-fun mapDefault!30385 () ValueCell!9071)

