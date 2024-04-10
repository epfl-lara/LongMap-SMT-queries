; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78120 () Bool)

(assert start!78120)

(declare-fun b_free!16631 () Bool)

(declare-fun b_next!16631 () Bool)

(assert (=> start!78120 (= b_free!16631 (not b_next!16631))))

(declare-fun tp!58167 () Bool)

(declare-fun b_and!27205 () Bool)

(assert (=> start!78120 (= tp!58167 b_and!27205)))

(declare-fun b!911767 () Bool)

(declare-fun res!615111 () Bool)

(declare-fun e!511390 () Bool)

(assert (=> b!911767 (=> (not res!615111) (not e!511390))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54098 0))(
  ( (array!54099 (arr!26004 (Array (_ BitVec 32) (_ BitVec 64))) (size!26463 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54098)

(declare-datatypes ((V!30363 0))(
  ( (V!30364 (val!9575 Int)) )
))
(declare-datatypes ((ValueCell!9043 0))(
  ( (ValueCellFull!9043 (v!12085 V!30363)) (EmptyCell!9043) )
))
(declare-datatypes ((array!54100 0))(
  ( (array!54101 (arr!26005 (Array (_ BitVec 32) ValueCell!9043)) (size!26464 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54100)

(assert (=> b!911767 (= res!615111 (and (= (size!26464 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26463 _keys!1386) (size!26464 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615114 () Bool)

(assert (=> start!78120 (=> (not res!615114) (not e!511390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78120 (= res!615114 (validMask!0 mask!1756))))

(assert (=> start!78120 e!511390))

(declare-fun e!511389 () Bool)

(declare-fun array_inv!20326 (array!54100) Bool)

(assert (=> start!78120 (and (array_inv!20326 _values!1152) e!511389)))

(assert (=> start!78120 tp!58167))

(assert (=> start!78120 true))

(declare-fun tp_is_empty!19049 () Bool)

(assert (=> start!78120 tp_is_empty!19049))

(declare-fun array_inv!20327 (array!54098) Bool)

(assert (=> start!78120 (array_inv!20327 _keys!1386)))

(declare-fun b!911768 () Bool)

(declare-fun res!615112 () Bool)

(assert (=> b!911768 (=> (not res!615112) (not e!511390))))

(declare-datatypes ((List!18266 0))(
  ( (Nil!18263) (Cons!18262 (h!19408 (_ BitVec 64)) (t!25853 List!18266)) )
))
(declare-fun arrayNoDuplicates!0 (array!54098 (_ BitVec 32) List!18266) Bool)

(assert (=> b!911768 (= res!615112 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18263))))

(declare-fun b!911769 () Bool)

(declare-fun e!511388 () Bool)

(assert (=> b!911769 (= e!511388 tp_is_empty!19049)))

(declare-fun mapIsEmpty!30298 () Bool)

(declare-fun mapRes!30298 () Bool)

(assert (=> mapIsEmpty!30298 mapRes!30298))

(declare-fun b!911770 () Bool)

(declare-fun e!511392 () Bool)

(assert (=> b!911770 (= e!511389 (and e!511392 mapRes!30298))))

(declare-fun condMapEmpty!30298 () Bool)

(declare-fun mapDefault!30298 () ValueCell!9043)

