; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78194 () Bool)

(assert start!78194)

(declare-fun b_free!16685 () Bool)

(declare-fun b_next!16685 () Bool)

(assert (=> start!78194 (= b_free!16685 (not b_next!16685))))

(declare-fun tp!58331 () Bool)

(declare-fun b_and!27261 () Bool)

(assert (=> start!78194 (= tp!58331 b_and!27261)))

(declare-fun b!912533 () Bool)

(declare-fun e!511876 () Bool)

(declare-fun tp_is_empty!19103 () Bool)

(assert (=> b!912533 (= e!511876 tp_is_empty!19103)))

(declare-fun b!912534 () Bool)

(declare-fun e!511875 () Bool)

(assert (=> b!912534 (= e!511875 tp_is_empty!19103)))

(declare-fun b!912535 () Bool)

(declare-fun res!615568 () Bool)

(declare-fun e!511877 () Bool)

(assert (=> b!912535 (=> (not res!615568) (not e!511877))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54200 0))(
  ( (array!54201 (arr!26054 (Array (_ BitVec 32) (_ BitVec 64))) (size!26513 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54200)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912535 (= res!615568 (and (= (select (arr!26054 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!30382 () Bool)

(declare-fun mapRes!30382 () Bool)

(declare-fun tp!58332 () Bool)

(assert (=> mapNonEmpty!30382 (= mapRes!30382 (and tp!58332 e!511875))))

(declare-datatypes ((V!30435 0))(
  ( (V!30436 (val!9602 Int)) )
))
(declare-datatypes ((ValueCell!9070 0))(
  ( (ValueCellFull!9070 (v!12113 V!30435)) (EmptyCell!9070) )
))
(declare-datatypes ((array!54202 0))(
  ( (array!54203 (arr!26055 (Array (_ BitVec 32) ValueCell!9070)) (size!26514 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54202)

(declare-fun mapValue!30382 () ValueCell!9070)

(declare-fun mapKey!30382 () (_ BitVec 32))

(declare-fun mapRest!30382 () (Array (_ BitVec 32) ValueCell!9070))

(assert (=> mapNonEmpty!30382 (= (arr!26055 _values!1152) (store mapRest!30382 mapKey!30382 mapValue!30382))))

(declare-fun b!912536 () Bool)

(declare-fun res!615569 () Bool)

(assert (=> b!912536 (=> (not res!615569) (not e!511877))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54200 (_ BitVec 32)) Bool)

(assert (=> b!912536 (= res!615569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912537 () Bool)

(assert (=> b!912537 (= e!511877 (not true))))

(declare-fun arrayContainsKey!0 (array!54200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912537 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30435)

(declare-datatypes ((Unit!30878 0))(
  ( (Unit!30879) )
))
(declare-fun lt!410678 () Unit!30878)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30435)

(declare-fun lemmaKeyInListMapIsInArray!264 (array!54200 array!54202 (_ BitVec 32) (_ BitVec 32) V!30435 V!30435 (_ BitVec 64) Int) Unit!30878)

(assert (=> b!912537 (= lt!410678 (lemmaKeyInListMapIsInArray!264 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912538 () Bool)

(declare-fun res!615570 () Bool)

(assert (=> b!912538 (=> (not res!615570) (not e!511877))))

(assert (=> b!912538 (= res!615570 (and (= (size!26514 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26513 _keys!1386) (size!26514 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615564 () Bool)

(assert (=> start!78194 (=> (not res!615564) (not e!511877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78194 (= res!615564 (validMask!0 mask!1756))))

(assert (=> start!78194 e!511877))

(declare-fun e!511878 () Bool)

(declare-fun array_inv!20356 (array!54202) Bool)

(assert (=> start!78194 (and (array_inv!20356 _values!1152) e!511878)))

(assert (=> start!78194 tp!58331))

(assert (=> start!78194 true))

(assert (=> start!78194 tp_is_empty!19103))

(declare-fun array_inv!20357 (array!54200) Bool)

(assert (=> start!78194 (array_inv!20357 _keys!1386)))

(declare-fun b!912539 () Bool)

(declare-fun res!615565 () Bool)

(assert (=> b!912539 (=> (not res!615565) (not e!511877))))

(declare-datatypes ((tuple2!12510 0))(
  ( (tuple2!12511 (_1!6266 (_ BitVec 64)) (_2!6266 V!30435)) )
))
(declare-datatypes ((List!18300 0))(
  ( (Nil!18297) (Cons!18296 (h!19442 tuple2!12510) (t!25889 List!18300)) )
))
(declare-datatypes ((ListLongMap!11207 0))(
  ( (ListLongMap!11208 (toList!5619 List!18300)) )
))
(declare-fun contains!4665 (ListLongMap!11207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2881 (array!54200 array!54202 (_ BitVec 32) (_ BitVec 32) V!30435 V!30435 (_ BitVec 32) Int) ListLongMap!11207)

(assert (=> b!912539 (= res!615565 (contains!4665 (getCurrentListMap!2881 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun mapIsEmpty!30382 () Bool)

(assert (=> mapIsEmpty!30382 mapRes!30382))

(declare-fun b!912540 () Bool)

(declare-fun res!615566 () Bool)

(assert (=> b!912540 (=> (not res!615566) (not e!511877))))

(declare-datatypes ((List!18301 0))(
  ( (Nil!18298) (Cons!18297 (h!19443 (_ BitVec 64)) (t!25890 List!18301)) )
))
(declare-fun arrayNoDuplicates!0 (array!54200 (_ BitVec 32) List!18301) Bool)

(assert (=> b!912540 (= res!615566 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18298))))

(declare-fun b!912541 () Bool)

(assert (=> b!912541 (= e!511878 (and e!511876 mapRes!30382))))

(declare-fun condMapEmpty!30382 () Bool)

(declare-fun mapDefault!30382 () ValueCell!9070)

