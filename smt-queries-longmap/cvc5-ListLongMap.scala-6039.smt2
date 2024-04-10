; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78134 () Bool)

(assert start!78134)

(declare-fun b_free!16645 () Bool)

(declare-fun b_next!16645 () Bool)

(assert (=> start!78134 (= b_free!16645 (not b_next!16645))))

(declare-fun tp!58209 () Bool)

(declare-fun b_and!27219 () Bool)

(assert (=> start!78134 (= tp!58209 b_and!27219)))

(declare-fun b!911914 () Bool)

(declare-fun e!511496 () Bool)

(assert (=> b!911914 (= e!511496 false)))

(declare-datatypes ((V!30383 0))(
  ( (V!30384 (val!9582 Int)) )
))
(declare-datatypes ((ValueCell!9050 0))(
  ( (ValueCellFull!9050 (v!12092 V!30383)) (EmptyCell!9050) )
))
(declare-datatypes ((array!54126 0))(
  ( (array!54127 (arr!26018 (Array (_ BitVec 32) ValueCell!9050)) (size!26477 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54126)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30383)

(declare-datatypes ((array!54128 0))(
  ( (array!54129 (arr!26019 (Array (_ BitVec 32) (_ BitVec 64))) (size!26478 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54128)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30383)

(declare-fun lt!410528 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12482 0))(
  ( (tuple2!12483 (_1!6252 (_ BitVec 64)) (_2!6252 V!30383)) )
))
(declare-datatypes ((List!18274 0))(
  ( (Nil!18271) (Cons!18270 (h!19416 tuple2!12482) (t!25861 List!18274)) )
))
(declare-datatypes ((ListLongMap!11179 0))(
  ( (ListLongMap!11180 (toList!5605 List!18274)) )
))
(declare-fun contains!4650 (ListLongMap!11179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2867 (array!54128 array!54126 (_ BitVec 32) (_ BitVec 32) V!30383 V!30383 (_ BitVec 32) Int) ListLongMap!11179)

(assert (=> b!911914 (= lt!410528 (contains!4650 (getCurrentListMap!2867 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapNonEmpty!30319 () Bool)

(declare-fun mapRes!30319 () Bool)

(declare-fun tp!58208 () Bool)

(declare-fun e!511494 () Bool)

(assert (=> mapNonEmpty!30319 (= mapRes!30319 (and tp!58208 e!511494))))

(declare-fun mapValue!30319 () ValueCell!9050)

(declare-fun mapRest!30319 () (Array (_ BitVec 32) ValueCell!9050))

(declare-fun mapKey!30319 () (_ BitVec 32))

(assert (=> mapNonEmpty!30319 (= (arr!26018 _values!1152) (store mapRest!30319 mapKey!30319 mapValue!30319))))

(declare-fun res!615197 () Bool)

(assert (=> start!78134 (=> (not res!615197) (not e!511496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78134 (= res!615197 (validMask!0 mask!1756))))

(assert (=> start!78134 e!511496))

(declare-fun e!511493 () Bool)

(declare-fun array_inv!20334 (array!54126) Bool)

(assert (=> start!78134 (and (array_inv!20334 _values!1152) e!511493)))

(assert (=> start!78134 tp!58209))

(assert (=> start!78134 true))

(declare-fun tp_is_empty!19063 () Bool)

(assert (=> start!78134 tp_is_empty!19063))

(declare-fun array_inv!20335 (array!54128) Bool)

(assert (=> start!78134 (array_inv!20335 _keys!1386)))

(declare-fun mapIsEmpty!30319 () Bool)

(assert (=> mapIsEmpty!30319 mapRes!30319))

(declare-fun b!911915 () Bool)

(declare-fun res!615198 () Bool)

(assert (=> b!911915 (=> (not res!615198) (not e!511496))))

(assert (=> b!911915 (= res!615198 (and (= (size!26477 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26478 _keys!1386) (size!26477 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911916 () Bool)

(declare-fun e!511497 () Bool)

(assert (=> b!911916 (= e!511493 (and e!511497 mapRes!30319))))

(declare-fun condMapEmpty!30319 () Bool)

(declare-fun mapDefault!30319 () ValueCell!9050)

