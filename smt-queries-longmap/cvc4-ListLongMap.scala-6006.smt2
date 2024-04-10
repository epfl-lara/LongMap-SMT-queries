; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77892 () Bool)

(assert start!77892)

(declare-fun b_free!16451 () Bool)

(declare-fun b_next!16451 () Bool)

(assert (=> start!77892 (= b_free!16451 (not b_next!16451))))

(declare-fun tp!57617 () Bool)

(declare-fun b_and!27019 () Bool)

(assert (=> start!77892 (= tp!57617 b_and!27019)))

(declare-fun b!909496 () Bool)

(declare-fun e!509824 () Bool)

(declare-fun tp_is_empty!18869 () Bool)

(assert (=> b!909496 (= e!509824 tp_is_empty!18869)))

(declare-fun b!909497 () Bool)

(declare-fun res!613844 () Bool)

(declare-fun e!509822 () Bool)

(assert (=> b!909497 (=> (not res!613844) (not e!509822))))

(declare-datatypes ((V!30123 0))(
  ( (V!30124 (val!9485 Int)) )
))
(declare-datatypes ((ValueCell!8953 0))(
  ( (ValueCellFull!8953 (v!11992 V!30123)) (EmptyCell!8953) )
))
(declare-datatypes ((array!53762 0))(
  ( (array!53763 (arr!25839 (Array (_ BitVec 32) ValueCell!8953)) (size!26298 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53762)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53764 0))(
  ( (array!53765 (arr!25840 (Array (_ BitVec 32) (_ BitVec 64))) (size!26299 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53764)

(assert (=> b!909497 (= res!613844 (and (= (size!26298 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26299 _keys!1386) (size!26298 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613843 () Bool)

(assert (=> start!77892 (=> (not res!613843) (not e!509822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77892 (= res!613843 (validMask!0 mask!1756))))

(assert (=> start!77892 e!509822))

(declare-fun e!509823 () Bool)

(declare-fun array_inv!20214 (array!53762) Bool)

(assert (=> start!77892 (and (array_inv!20214 _values!1152) e!509823)))

(assert (=> start!77892 tp!57617))

(assert (=> start!77892 true))

(assert (=> start!77892 tp_is_empty!18869))

(declare-fun array_inv!20215 (array!53764) Bool)

(assert (=> start!77892 (array_inv!20215 _keys!1386)))

(declare-fun b!909498 () Bool)

(declare-fun mapRes!30019 () Bool)

(assert (=> b!909498 (= e!509823 (and e!509824 mapRes!30019))))

(declare-fun condMapEmpty!30019 () Bool)

(declare-fun mapDefault!30019 () ValueCell!8953)

