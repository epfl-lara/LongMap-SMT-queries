; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78150 () Bool)

(assert start!78150)

(declare-fun b_free!16661 () Bool)

(declare-fun b_next!16661 () Bool)

(assert (=> start!78150 (= b_free!16661 (not b_next!16661))))

(declare-fun tp!58257 () Bool)

(declare-fun b_and!27235 () Bool)

(assert (=> start!78150 (= tp!58257 b_and!27235)))

(declare-fun b!912082 () Bool)

(declare-fun e!511613 () Bool)

(declare-fun e!511614 () Bool)

(declare-fun mapRes!30343 () Bool)

(assert (=> b!912082 (= e!511613 (and e!511614 mapRes!30343))))

(declare-fun condMapEmpty!30343 () Bool)

(declare-datatypes ((V!30403 0))(
  ( (V!30404 (val!9590 Int)) )
))
(declare-datatypes ((ValueCell!9058 0))(
  ( (ValueCellFull!9058 (v!12100 V!30403)) (EmptyCell!9058) )
))
(declare-datatypes ((array!54156 0))(
  ( (array!54157 (arr!26033 (Array (_ BitVec 32) ValueCell!9058)) (size!26492 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54156)

(declare-fun mapDefault!30343 () ValueCell!9058)

