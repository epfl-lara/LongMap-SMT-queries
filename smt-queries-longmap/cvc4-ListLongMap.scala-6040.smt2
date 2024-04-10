; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78144 () Bool)

(assert start!78144)

(declare-fun b_free!16655 () Bool)

(declare-fun b_next!16655 () Bool)

(assert (=> start!78144 (= b_free!16655 (not b_next!16655))))

(declare-fun tp!58239 () Bool)

(declare-fun b_and!27229 () Bool)

(assert (=> start!78144 (= tp!58239 b_and!27229)))

(declare-fun b!912019 () Bool)

(declare-fun e!511568 () Bool)

(declare-fun tp_is_empty!19073 () Bool)

(assert (=> b!912019 (= e!511568 tp_is_empty!19073)))

(declare-fun b!912020 () Bool)

(declare-fun e!511571 () Bool)

(declare-fun e!511569 () Bool)

(declare-fun mapRes!30334 () Bool)

(assert (=> b!912020 (= e!511571 (and e!511569 mapRes!30334))))

(declare-fun condMapEmpty!30334 () Bool)

(declare-datatypes ((V!30395 0))(
  ( (V!30396 (val!9587 Int)) )
))
(declare-datatypes ((ValueCell!9055 0))(
  ( (ValueCellFull!9055 (v!12097 V!30395)) (EmptyCell!9055) )
))
(declare-datatypes ((array!54146 0))(
  ( (array!54147 (arr!26028 (Array (_ BitVec 32) ValueCell!9055)) (size!26487 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54146)

(declare-fun mapDefault!30334 () ValueCell!9055)

