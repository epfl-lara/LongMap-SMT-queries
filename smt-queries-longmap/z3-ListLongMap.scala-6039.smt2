; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78136 () Bool)

(assert start!78136)

(declare-fun b_free!16647 () Bool)

(declare-fun b_next!16647 () Bool)

(assert (=> start!78136 (= b_free!16647 (not b_next!16647))))

(declare-fun tp!58215 () Bool)

(declare-fun b_and!27221 () Bool)

(assert (=> start!78136 (= tp!58215 b_and!27221)))

(declare-fun res!615209 () Bool)

(declare-fun e!511508 () Bool)

(assert (=> start!78136 (=> (not res!615209) (not e!511508))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78136 (= res!615209 (validMask!0 mask!1756))))

(assert (=> start!78136 e!511508))

(declare-datatypes ((V!30385 0))(
  ( (V!30386 (val!9583 Int)) )
))
(declare-datatypes ((ValueCell!9051 0))(
  ( (ValueCellFull!9051 (v!12093 V!30385)) (EmptyCell!9051) )
))
(declare-datatypes ((array!54130 0))(
  ( (array!54131 (arr!26020 (Array (_ BitVec 32) ValueCell!9051)) (size!26479 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54130)

(declare-fun e!511511 () Bool)

(declare-fun array_inv!20336 (array!54130) Bool)

(assert (=> start!78136 (and (array_inv!20336 _values!1152) e!511511)))

(assert (=> start!78136 tp!58215))

(assert (=> start!78136 true))

(declare-fun tp_is_empty!19065 () Bool)

(assert (=> start!78136 tp_is_empty!19065))

(declare-datatypes ((array!54132 0))(
  ( (array!54133 (arr!26021 (Array (_ BitVec 32) (_ BitVec 64))) (size!26480 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54132)

(declare-fun array_inv!20337 (array!54132) Bool)

(assert (=> start!78136 (array_inv!20337 _keys!1386)))

(declare-fun b!911935 () Bool)

(assert (=> b!911935 (= e!511508 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30385)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410531 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30385)

(declare-datatypes ((tuple2!12484 0))(
  ( (tuple2!12485 (_1!6253 (_ BitVec 64)) (_2!6253 V!30385)) )
))
(declare-datatypes ((List!18275 0))(
  ( (Nil!18272) (Cons!18271 (h!19417 tuple2!12484) (t!25862 List!18275)) )
))
(declare-datatypes ((ListLongMap!11181 0))(
  ( (ListLongMap!11182 (toList!5606 List!18275)) )
))
(declare-fun contains!4651 (ListLongMap!11181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2868 (array!54132 array!54130 (_ BitVec 32) (_ BitVec 32) V!30385 V!30385 (_ BitVec 32) Int) ListLongMap!11181)

(assert (=> b!911935 (= lt!410531 (contains!4651 (getCurrentListMap!2868 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911936 () Bool)

(declare-fun e!511509 () Bool)

(assert (=> b!911936 (= e!511509 tp_is_empty!19065)))

(declare-fun b!911937 () Bool)

(declare-fun res!615210 () Bool)

(assert (=> b!911937 (=> (not res!615210) (not e!511508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54132 (_ BitVec 32)) Bool)

(assert (=> b!911937 (= res!615210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911938 () Bool)

(declare-fun res!615208 () Bool)

(assert (=> b!911938 (=> (not res!615208) (not e!511508))))

(assert (=> b!911938 (= res!615208 (and (= (size!26479 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26480 _keys!1386) (size!26479 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911939 () Bool)

(declare-fun e!511510 () Bool)

(assert (=> b!911939 (= e!511510 tp_is_empty!19065)))

(declare-fun b!911940 () Bool)

(declare-fun mapRes!30322 () Bool)

(assert (=> b!911940 (= e!511511 (and e!511509 mapRes!30322))))

(declare-fun condMapEmpty!30322 () Bool)

(declare-fun mapDefault!30322 () ValueCell!9051)

(assert (=> b!911940 (= condMapEmpty!30322 (= (arr!26020 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9051)) mapDefault!30322)))))

(declare-fun mapIsEmpty!30322 () Bool)

(assert (=> mapIsEmpty!30322 mapRes!30322))

(declare-fun mapNonEmpty!30322 () Bool)

(declare-fun tp!58214 () Bool)

(assert (=> mapNonEmpty!30322 (= mapRes!30322 (and tp!58214 e!511510))))

(declare-fun mapRest!30322 () (Array (_ BitVec 32) ValueCell!9051))

(declare-fun mapKey!30322 () (_ BitVec 32))

(declare-fun mapValue!30322 () ValueCell!9051)

(assert (=> mapNonEmpty!30322 (= (arr!26020 _values!1152) (store mapRest!30322 mapKey!30322 mapValue!30322))))

(declare-fun b!911941 () Bool)

(declare-fun res!615207 () Bool)

(assert (=> b!911941 (=> (not res!615207) (not e!511508))))

(declare-datatypes ((List!18276 0))(
  ( (Nil!18273) (Cons!18272 (h!19418 (_ BitVec 64)) (t!25863 List!18276)) )
))
(declare-fun arrayNoDuplicates!0 (array!54132 (_ BitVec 32) List!18276) Bool)

(assert (=> b!911941 (= res!615207 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18273))))

(assert (= (and start!78136 res!615209) b!911938))

(assert (= (and b!911938 res!615208) b!911937))

(assert (= (and b!911937 res!615210) b!911941))

(assert (= (and b!911941 res!615207) b!911935))

(assert (= (and b!911940 condMapEmpty!30322) mapIsEmpty!30322))

(assert (= (and b!911940 (not condMapEmpty!30322)) mapNonEmpty!30322))

(get-info :version)

(assert (= (and mapNonEmpty!30322 ((_ is ValueCellFull!9051) mapValue!30322)) b!911939))

(assert (= (and b!911940 ((_ is ValueCellFull!9051) mapDefault!30322)) b!911936))

(assert (= start!78136 b!911940))

(declare-fun m!846567 () Bool)

(assert (=> mapNonEmpty!30322 m!846567))

(declare-fun m!846569 () Bool)

(assert (=> start!78136 m!846569))

(declare-fun m!846571 () Bool)

(assert (=> start!78136 m!846571))

(declare-fun m!846573 () Bool)

(assert (=> start!78136 m!846573))

(declare-fun m!846575 () Bool)

(assert (=> b!911941 m!846575))

(declare-fun m!846577 () Bool)

(assert (=> b!911935 m!846577))

(assert (=> b!911935 m!846577))

(declare-fun m!846579 () Bool)

(assert (=> b!911935 m!846579))

(declare-fun m!846581 () Bool)

(assert (=> b!911937 m!846581))

(check-sat (not start!78136) (not b!911935) (not mapNonEmpty!30322) b_and!27221 (not b!911937) (not b_next!16647) (not b!911941) tp_is_empty!19065)
(check-sat b_and!27221 (not b_next!16647))
