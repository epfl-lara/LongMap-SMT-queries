; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78116 () Bool)

(assert start!78116)

(declare-fun b_free!16627 () Bool)

(declare-fun b_next!16627 () Bool)

(assert (=> start!78116 (= b_free!16627 (not b_next!16627))))

(declare-fun tp!58155 () Bool)

(declare-fun b_and!27201 () Bool)

(assert (=> start!78116 (= tp!58155 b_and!27201)))

(declare-fun b!911725 () Bool)

(declare-fun res!615089 () Bool)

(declare-fun e!511360 () Bool)

(assert (=> b!911725 (=> (not res!615089) (not e!511360))))

(declare-datatypes ((array!54090 0))(
  ( (array!54091 (arr!26000 (Array (_ BitVec 32) (_ BitVec 64))) (size!26459 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54090)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54090 (_ BitVec 32)) Bool)

(assert (=> b!911725 (= res!615089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30292 () Bool)

(declare-fun mapRes!30292 () Bool)

(assert (=> mapIsEmpty!30292 mapRes!30292))

(declare-fun b!911726 () Bool)

(declare-fun res!615090 () Bool)

(assert (=> b!911726 (=> (not res!615090) (not e!511360))))

(declare-datatypes ((V!30359 0))(
  ( (V!30360 (val!9573 Int)) )
))
(declare-datatypes ((ValueCell!9041 0))(
  ( (ValueCellFull!9041 (v!12083 V!30359)) (EmptyCell!9041) )
))
(declare-datatypes ((array!54092 0))(
  ( (array!54093 (arr!26001 (Array (_ BitVec 32) ValueCell!9041)) (size!26460 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54092)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911726 (= res!615090 (and (= (size!26460 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26459 _keys!1386) (size!26460 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911727 () Bool)

(assert (=> b!911727 (= e!511360 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410501 () Bool)

(declare-fun zeroValue!1094 () V!30359)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30359)

(declare-datatypes ((tuple2!12470 0))(
  ( (tuple2!12471 (_1!6246 (_ BitVec 64)) (_2!6246 V!30359)) )
))
(declare-datatypes ((List!18262 0))(
  ( (Nil!18259) (Cons!18258 (h!19404 tuple2!12470) (t!25849 List!18262)) )
))
(declare-datatypes ((ListLongMap!11167 0))(
  ( (ListLongMap!11168 (toList!5599 List!18262)) )
))
(declare-fun contains!4644 (ListLongMap!11167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2861 (array!54090 array!54092 (_ BitVec 32) (_ BitVec 32) V!30359 V!30359 (_ BitVec 32) Int) ListLongMap!11167)

(assert (=> b!911727 (= lt!410501 (contains!4644 (getCurrentListMap!2861 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911728 () Bool)

(declare-fun res!615088 () Bool)

(assert (=> b!911728 (=> (not res!615088) (not e!511360))))

(declare-datatypes ((List!18263 0))(
  ( (Nil!18260) (Cons!18259 (h!19405 (_ BitVec 64)) (t!25850 List!18263)) )
))
(declare-fun arrayNoDuplicates!0 (array!54090 (_ BitVec 32) List!18263) Bool)

(assert (=> b!911728 (= res!615088 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18260))))

(declare-fun b!911729 () Bool)

(declare-fun e!511362 () Bool)

(declare-fun tp_is_empty!19045 () Bool)

(assert (=> b!911729 (= e!511362 tp_is_empty!19045)))

(declare-fun b!911730 () Bool)

(declare-fun e!511358 () Bool)

(assert (=> b!911730 (= e!511358 (and e!511362 mapRes!30292))))

(declare-fun condMapEmpty!30292 () Bool)

(declare-fun mapDefault!30292 () ValueCell!9041)

