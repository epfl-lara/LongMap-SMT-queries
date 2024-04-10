; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78558 () Bool)

(assert start!78558)

(declare-fun b_free!16771 () Bool)

(declare-fun b_next!16771 () Bool)

(assert (=> start!78558 (= b_free!16771 (not b_next!16771))))

(declare-fun tp!58753 () Bool)

(declare-fun b_and!27393 () Bool)

(assert (=> start!78558 (= tp!58753 b_and!27393)))

(declare-fun b!915745 () Bool)

(declare-fun res!617379 () Bool)

(declare-fun e!514006 () Bool)

(assert (=> b!915745 (=> (not res!617379) (not e!514006))))

(declare-datatypes ((array!54552 0))(
  ( (array!54553 (arr!26221 (Array (_ BitVec 32) (_ BitVec 64))) (size!26680 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54552)

(declare-datatypes ((List!18384 0))(
  ( (Nil!18381) (Cons!18380 (h!19526 (_ BitVec 64)) (t!25997 List!18384)) )
))
(declare-fun arrayNoDuplicates!0 (array!54552 (_ BitVec 32) List!18384) Bool)

(assert (=> b!915745 (= res!617379 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18381))))

(declare-fun b!915746 () Bool)

(declare-fun e!514002 () Bool)

(declare-fun e!514003 () Bool)

(declare-fun mapRes!30675 () Bool)

(assert (=> b!915746 (= e!514002 (and e!514003 mapRes!30675))))

(declare-fun condMapEmpty!30675 () Bool)

(declare-datatypes ((V!30671 0))(
  ( (V!30672 (val!9690 Int)) )
))
(declare-datatypes ((ValueCell!9158 0))(
  ( (ValueCellFull!9158 (v!12208 V!30671)) (EmptyCell!9158) )
))
(declare-datatypes ((array!54554 0))(
  ( (array!54555 (arr!26222 (Array (_ BitVec 32) ValueCell!9158)) (size!26681 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54554)

(declare-fun mapDefault!30675 () ValueCell!9158)

