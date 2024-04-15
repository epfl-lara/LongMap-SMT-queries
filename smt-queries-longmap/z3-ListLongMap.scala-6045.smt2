; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78172 () Bool)

(assert start!78172)

(declare-fun b_free!16681 () Bool)

(declare-fun b_next!16681 () Bool)

(assert (=> start!78172 (= b_free!16681 (not b_next!16681))))

(declare-fun tp!58320 () Bool)

(declare-fun b_and!27231 () Bool)

(assert (=> start!78172 (= tp!58320 b_and!27231)))

(declare-fun b!912234 () Bool)

(declare-fun e!511700 () Bool)

(declare-fun tp_is_empty!19099 () Bool)

(assert (=> b!912234 (= e!511700 tp_is_empty!19099)))

(declare-fun res!615418 () Bool)

(declare-fun e!511699 () Bool)

(assert (=> start!78172 (=> (not res!615418) (not e!511699))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78172 (= res!615418 (validMask!0 mask!1756))))

(assert (=> start!78172 e!511699))

(declare-datatypes ((V!30431 0))(
  ( (V!30432 (val!9600 Int)) )
))
(declare-datatypes ((ValueCell!9068 0))(
  ( (ValueCellFull!9068 (v!12110 V!30431)) (EmptyCell!9068) )
))
(declare-datatypes ((array!54195 0))(
  ( (array!54196 (arr!26052 (Array (_ BitVec 32) ValueCell!9068)) (size!26513 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54195)

(declare-fun e!511697 () Bool)

(declare-fun array_inv!20426 (array!54195) Bool)

(assert (=> start!78172 (and (array_inv!20426 _values!1152) e!511697)))

(assert (=> start!78172 tp!58320))

(assert (=> start!78172 true))

(assert (=> start!78172 tp_is_empty!19099))

(declare-datatypes ((array!54197 0))(
  ( (array!54198 (arr!26053 (Array (_ BitVec 32) (_ BitVec 64))) (size!26514 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54197)

(declare-fun array_inv!20427 (array!54197) Bool)

(assert (=> start!78172 (array_inv!20427 _keys!1386)))

(declare-fun b!912235 () Bool)

(declare-fun mapRes!30376 () Bool)

(assert (=> b!912235 (= e!511697 (and e!511700 mapRes!30376))))

(declare-fun condMapEmpty!30376 () Bool)

(declare-fun mapDefault!30376 () ValueCell!9068)

(assert (=> b!912235 (= condMapEmpty!30376 (= (arr!26052 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9068)) mapDefault!30376)))))

(declare-fun b!912236 () Bool)

(declare-fun res!615412 () Bool)

(assert (=> b!912236 (=> (not res!615412) (not e!511699))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912236 (= res!615412 (and (= (select (arr!26053 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912237 () Bool)

(declare-fun e!511696 () Bool)

(assert (=> b!912237 (= e!511696 tp_is_empty!19099)))

(declare-fun b!912238 () Bool)

(declare-fun res!615415 () Bool)

(assert (=> b!912238 (=> (not res!615415) (not e!511699))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912238 (= res!615415 (and (= (size!26513 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26514 _keys!1386) (size!26513 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912239 () Bool)

(assert (=> b!912239 (= e!511699 (not true))))

(declare-fun arrayContainsKey!0 (array!54197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912239 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30804 0))(
  ( (Unit!30805) )
))
(declare-fun lt!410436 () Unit!30804)

(declare-fun zeroValue!1094 () V!30431)

(declare-fun minValue!1094 () V!30431)

(declare-fun lemmaKeyInListMapIsInArray!259 (array!54197 array!54195 (_ BitVec 32) (_ BitVec 32) V!30431 V!30431 (_ BitVec 64) Int) Unit!30804)

(assert (=> b!912239 (= lt!410436 (lemmaKeyInListMapIsInArray!259 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912240 () Bool)

(declare-fun res!615413 () Bool)

(assert (=> b!912240 (=> (not res!615413) (not e!511699))))

(declare-datatypes ((List!18332 0))(
  ( (Nil!18329) (Cons!18328 (h!19474 (_ BitVec 64)) (t!25912 List!18332)) )
))
(declare-fun arrayNoDuplicates!0 (array!54197 (_ BitVec 32) List!18332) Bool)

(assert (=> b!912240 (= res!615413 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18329))))

(declare-fun mapIsEmpty!30376 () Bool)

(assert (=> mapIsEmpty!30376 mapRes!30376))

(declare-fun b!912241 () Bool)

(declare-fun res!615416 () Bool)

(assert (=> b!912241 (=> (not res!615416) (not e!511699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54197 (_ BitVec 32)) Bool)

(assert (=> b!912241 (= res!615416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912242 () Bool)

(declare-fun res!615414 () Bool)

(assert (=> b!912242 (=> (not res!615414) (not e!511699))))

(declare-datatypes ((tuple2!12552 0))(
  ( (tuple2!12553 (_1!6287 (_ BitVec 64)) (_2!6287 V!30431)) )
))
(declare-datatypes ((List!18333 0))(
  ( (Nil!18330) (Cons!18329 (h!19475 tuple2!12552) (t!25913 List!18333)) )
))
(declare-datatypes ((ListLongMap!11239 0))(
  ( (ListLongMap!11240 (toList!5635 List!18333)) )
))
(declare-fun contains!4638 (ListLongMap!11239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2837 (array!54197 array!54195 (_ BitVec 32) (_ BitVec 32) V!30431 V!30431 (_ BitVec 32) Int) ListLongMap!11239)

(assert (=> b!912242 (= res!615414 (contains!4638 (getCurrentListMap!2837 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30376 () Bool)

(declare-fun tp!58321 () Bool)

(assert (=> mapNonEmpty!30376 (= mapRes!30376 (and tp!58321 e!511696))))

(declare-fun mapRest!30376 () (Array (_ BitVec 32) ValueCell!9068))

(declare-fun mapValue!30376 () ValueCell!9068)

(declare-fun mapKey!30376 () (_ BitVec 32))

(assert (=> mapNonEmpty!30376 (= (arr!26052 _values!1152) (store mapRest!30376 mapKey!30376 mapValue!30376))))

(declare-fun b!912243 () Bool)

(declare-fun res!615417 () Bool)

(assert (=> b!912243 (=> (not res!615417) (not e!511699))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912243 (= res!615417 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78172 res!615418) b!912238))

(assert (= (and b!912238 res!615415) b!912241))

(assert (= (and b!912241 res!615416) b!912240))

(assert (= (and b!912240 res!615413) b!912242))

(assert (= (and b!912242 res!615414) b!912243))

(assert (= (and b!912243 res!615417) b!912236))

(assert (= (and b!912236 res!615412) b!912239))

(assert (= (and b!912235 condMapEmpty!30376) mapIsEmpty!30376))

(assert (= (and b!912235 (not condMapEmpty!30376)) mapNonEmpty!30376))

(get-info :version)

(assert (= (and mapNonEmpty!30376 ((_ is ValueCellFull!9068) mapValue!30376)) b!912237))

(assert (= (and b!912235 ((_ is ValueCellFull!9068) mapDefault!30376)) b!912234))

(assert (= start!78172 b!912235))

(declare-fun m!846213 () Bool)

(assert (=> b!912243 m!846213))

(declare-fun m!846215 () Bool)

(assert (=> b!912241 m!846215))

(declare-fun m!846217 () Bool)

(assert (=> b!912239 m!846217))

(declare-fun m!846219 () Bool)

(assert (=> b!912239 m!846219))

(declare-fun m!846221 () Bool)

(assert (=> b!912240 m!846221))

(declare-fun m!846223 () Bool)

(assert (=> b!912242 m!846223))

(assert (=> b!912242 m!846223))

(declare-fun m!846225 () Bool)

(assert (=> b!912242 m!846225))

(declare-fun m!846227 () Bool)

(assert (=> start!78172 m!846227))

(declare-fun m!846229 () Bool)

(assert (=> start!78172 m!846229))

(declare-fun m!846231 () Bool)

(assert (=> start!78172 m!846231))

(declare-fun m!846233 () Bool)

(assert (=> b!912236 m!846233))

(declare-fun m!846235 () Bool)

(assert (=> mapNonEmpty!30376 m!846235))

(check-sat (not b!912242) (not mapNonEmpty!30376) (not b!912243) (not b!912240) (not b_next!16681) b_and!27231 (not b!912241) (not start!78172) tp_is_empty!19099 (not b!912239))
(check-sat b_and!27231 (not b_next!16681))
