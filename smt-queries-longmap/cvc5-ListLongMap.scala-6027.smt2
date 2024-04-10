; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78046 () Bool)

(assert start!78046)

(declare-fun b_free!16573 () Bool)

(declare-fun b_next!16573 () Bool)

(assert (=> start!78046 (= b_free!16573 (not b_next!16573))))

(declare-fun tp!57990 () Bool)

(declare-fun b_and!27145 () Bool)

(assert (=> start!78046 (= tp!57990 b_and!27145)))

(declare-fun b!911031 () Bool)

(declare-fun e!510883 () Bool)

(declare-fun e!510882 () Bool)

(declare-fun mapRes!30208 () Bool)

(assert (=> b!911031 (= e!510883 (and e!510882 mapRes!30208))))

(declare-fun condMapEmpty!30208 () Bool)

(declare-datatypes ((V!30287 0))(
  ( (V!30288 (val!9546 Int)) )
))
(declare-datatypes ((ValueCell!9014 0))(
  ( (ValueCellFull!9014 (v!12055 V!30287)) (EmptyCell!9014) )
))
(declare-datatypes ((array!53988 0))(
  ( (array!53989 (arr!25950 (Array (_ BitVec 32) ValueCell!9014)) (size!26409 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53988)

(declare-fun mapDefault!30208 () ValueCell!9014)

