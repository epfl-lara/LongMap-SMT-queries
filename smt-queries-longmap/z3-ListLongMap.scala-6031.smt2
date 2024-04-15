; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78052 () Bool)

(assert start!78052)

(declare-fun b_free!16597 () Bool)

(declare-fun b_next!16597 () Bool)

(assert (=> start!78052 (= b_free!16597 (not b_next!16597))))

(declare-fun tp!58063 () Bool)

(declare-fun b_and!27143 () Bool)

(assert (=> start!78052 (= tp!58063 b_and!27143)))

(declare-fun b!911044 () Bool)

(declare-fun res!614736 () Bool)

(declare-fun e!510915 () Bool)

(assert (=> b!911044 (=> (not res!614736) (not e!510915))))

(declare-datatypes ((V!30319 0))(
  ( (V!30320 (val!9558 Int)) )
))
(declare-datatypes ((ValueCell!9026 0))(
  ( (ValueCellFull!9026 (v!12066 V!30319)) (EmptyCell!9026) )
))
(declare-datatypes ((array!54033 0))(
  ( (array!54034 (arr!25973 (Array (_ BitVec 32) ValueCell!9026)) (size!26434 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54033)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54035 0))(
  ( (array!54036 (arr!25974 (Array (_ BitVec 32) (_ BitVec 64))) (size!26435 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54035)

(assert (=> b!911044 (= res!614736 (and (= (size!26434 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26435 _keys!1386) (size!26434 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911045 () Bool)

(declare-fun e!510914 () Bool)

(declare-fun tp_is_empty!19015 () Bool)

(assert (=> b!911045 (= e!510914 tp_is_empty!19015)))

(declare-fun b!911046 () Bool)

(assert (=> b!911046 (= e!510915 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30319)

(declare-fun lt!410142 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30319)

(declare-datatypes ((tuple2!12492 0))(
  ( (tuple2!12493 (_1!6257 (_ BitVec 64)) (_2!6257 V!30319)) )
))
(declare-datatypes ((List!18275 0))(
  ( (Nil!18272) (Cons!18271 (h!19417 tuple2!12492) (t!25851 List!18275)) )
))
(declare-datatypes ((ListLongMap!11179 0))(
  ( (ListLongMap!11180 (toList!5605 List!18275)) )
))
(declare-fun contains!4606 (ListLongMap!11179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2807 (array!54035 array!54033 (_ BitVec 32) (_ BitVec 32) V!30319 V!30319 (_ BitVec 32) Int) ListLongMap!11179)

(assert (=> b!911046 (= lt!410142 (contains!4606 (getCurrentListMap!2807 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30244 () Bool)

(declare-fun mapRes!30244 () Bool)

(declare-fun tp!58062 () Bool)

(declare-fun e!510917 () Bool)

(assert (=> mapNonEmpty!30244 (= mapRes!30244 (and tp!58062 e!510917))))

(declare-fun mapRest!30244 () (Array (_ BitVec 32) ValueCell!9026))

(declare-fun mapKey!30244 () (_ BitVec 32))

(declare-fun mapValue!30244 () ValueCell!9026)

(assert (=> mapNonEmpty!30244 (= (arr!25973 _values!1152) (store mapRest!30244 mapKey!30244 mapValue!30244))))

(declare-fun res!614735 () Bool)

(assert (=> start!78052 (=> (not res!614735) (not e!510915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78052 (= res!614735 (validMask!0 mask!1756))))

(assert (=> start!78052 e!510915))

(declare-fun e!510913 () Bool)

(declare-fun array_inv!20364 (array!54033) Bool)

(assert (=> start!78052 (and (array_inv!20364 _values!1152) e!510913)))

(assert (=> start!78052 tp!58063))

(assert (=> start!78052 true))

(assert (=> start!78052 tp_is_empty!19015))

(declare-fun array_inv!20365 (array!54035) Bool)

(assert (=> start!78052 (array_inv!20365 _keys!1386)))

(declare-fun b!911047 () Bool)

(declare-fun res!614737 () Bool)

(assert (=> b!911047 (=> (not res!614737) (not e!510915))))

(declare-datatypes ((List!18276 0))(
  ( (Nil!18273) (Cons!18272 (h!19418 (_ BitVec 64)) (t!25852 List!18276)) )
))
(declare-fun arrayNoDuplicates!0 (array!54035 (_ BitVec 32) List!18276) Bool)

(assert (=> b!911047 (= res!614737 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18273))))

(declare-fun b!911048 () Bool)

(assert (=> b!911048 (= e!510917 tp_is_empty!19015)))

(declare-fun b!911049 () Bool)

(declare-fun res!614734 () Bool)

(assert (=> b!911049 (=> (not res!614734) (not e!510915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54035 (_ BitVec 32)) Bool)

(assert (=> b!911049 (= res!614734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30244 () Bool)

(assert (=> mapIsEmpty!30244 mapRes!30244))

(declare-fun b!911050 () Bool)

(assert (=> b!911050 (= e!510913 (and e!510914 mapRes!30244))))

(declare-fun condMapEmpty!30244 () Bool)

(declare-fun mapDefault!30244 () ValueCell!9026)

(assert (=> b!911050 (= condMapEmpty!30244 (= (arr!25973 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9026)) mapDefault!30244)))))

(assert (= (and start!78052 res!614735) b!911044))

(assert (= (and b!911044 res!614736) b!911049))

(assert (= (and b!911049 res!614734) b!911047))

(assert (= (and b!911047 res!614737) b!911046))

(assert (= (and b!911050 condMapEmpty!30244) mapIsEmpty!30244))

(assert (= (and b!911050 (not condMapEmpty!30244)) mapNonEmpty!30244))

(get-info :version)

(assert (= (and mapNonEmpty!30244 ((_ is ValueCellFull!9026) mapValue!30244)) b!911048))

(assert (= (and b!911050 ((_ is ValueCellFull!9026) mapDefault!30244)) b!911045))

(assert (= start!78052 b!911050))

(declare-fun m!845323 () Bool)

(assert (=> mapNonEmpty!30244 m!845323))

(declare-fun m!845325 () Bool)

(assert (=> start!78052 m!845325))

(declare-fun m!845327 () Bool)

(assert (=> start!78052 m!845327))

(declare-fun m!845329 () Bool)

(assert (=> start!78052 m!845329))

(declare-fun m!845331 () Bool)

(assert (=> b!911046 m!845331))

(assert (=> b!911046 m!845331))

(declare-fun m!845333 () Bool)

(assert (=> b!911046 m!845333))

(declare-fun m!845335 () Bool)

(assert (=> b!911049 m!845335))

(declare-fun m!845337 () Bool)

(assert (=> b!911047 m!845337))

(check-sat b_and!27143 (not b!911047) (not mapNonEmpty!30244) (not b_next!16597) (not b!911049) (not b!911046) (not start!78052) tp_is_empty!19015)
(check-sat b_and!27143 (not b_next!16597))
