; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78178 () Bool)

(assert start!78178)

(declare-fun b_free!16687 () Bool)

(declare-fun b_next!16687 () Bool)

(assert (=> start!78178 (= b_free!16687 (not b_next!16687))))

(declare-fun tp!58339 () Bool)

(declare-fun b_and!27237 () Bool)

(assert (=> start!78178 (= tp!58339 b_and!27237)))

(declare-fun b!912324 () Bool)

(declare-fun e!511743 () Bool)

(declare-fun e!511745 () Bool)

(declare-fun mapRes!30385 () Bool)

(assert (=> b!912324 (= e!511743 (and e!511745 mapRes!30385))))

(declare-fun condMapEmpty!30385 () Bool)

(declare-datatypes ((V!30439 0))(
  ( (V!30440 (val!9603 Int)) )
))
(declare-datatypes ((ValueCell!9071 0))(
  ( (ValueCellFull!9071 (v!12113 V!30439)) (EmptyCell!9071) )
))
(declare-datatypes ((array!54205 0))(
  ( (array!54206 (arr!26057 (Array (_ BitVec 32) ValueCell!9071)) (size!26518 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54205)

(declare-fun mapDefault!30385 () ValueCell!9071)

(assert (=> b!912324 (= condMapEmpty!30385 (= (arr!26057 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9071)) mapDefault!30385)))))

(declare-fun res!615479 () Bool)

(declare-fun e!511742 () Bool)

(assert (=> start!78178 (=> (not res!615479) (not e!511742))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78178 (= res!615479 (validMask!0 mask!1756))))

(assert (=> start!78178 e!511742))

(declare-fun array_inv!20430 (array!54205) Bool)

(assert (=> start!78178 (and (array_inv!20430 _values!1152) e!511743)))

(assert (=> start!78178 tp!58339))

(assert (=> start!78178 true))

(declare-fun tp_is_empty!19105 () Bool)

(assert (=> start!78178 tp_is_empty!19105))

(declare-datatypes ((array!54207 0))(
  ( (array!54208 (arr!26058 (Array (_ BitVec 32) (_ BitVec 64))) (size!26519 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54207)

(declare-fun array_inv!20431 (array!54207) Bool)

(assert (=> start!78178 (array_inv!20431 _keys!1386)))

(declare-fun b!912325 () Bool)

(declare-fun res!615481 () Bool)

(assert (=> b!912325 (=> (not res!615481) (not e!511742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54207 (_ BitVec 32)) Bool)

(assert (=> b!912325 (= res!615481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30385 () Bool)

(declare-fun tp!58338 () Bool)

(declare-fun e!511741 () Bool)

(assert (=> mapNonEmpty!30385 (= mapRes!30385 (and tp!58338 e!511741))))

(declare-fun mapValue!30385 () ValueCell!9071)

(declare-fun mapKey!30385 () (_ BitVec 32))

(declare-fun mapRest!30385 () (Array (_ BitVec 32) ValueCell!9071))

(assert (=> mapNonEmpty!30385 (= (arr!26057 _values!1152) (store mapRest!30385 mapKey!30385 mapValue!30385))))

(declare-fun b!912326 () Bool)

(declare-fun res!615476 () Bool)

(assert (=> b!912326 (=> (not res!615476) (not e!511742))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30439)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30439)

(declare-datatypes ((tuple2!12554 0))(
  ( (tuple2!12555 (_1!6288 (_ BitVec 64)) (_2!6288 V!30439)) )
))
(declare-datatypes ((List!18334 0))(
  ( (Nil!18331) (Cons!18330 (h!19476 tuple2!12554) (t!25914 List!18334)) )
))
(declare-datatypes ((ListLongMap!11241 0))(
  ( (ListLongMap!11242 (toList!5636 List!18334)) )
))
(declare-fun contains!4639 (ListLongMap!11241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2838 (array!54207 array!54205 (_ BitVec 32) (_ BitVec 32) V!30439 V!30439 (_ BitVec 32) Int) ListLongMap!11241)

(assert (=> b!912326 (= res!615476 (contains!4639 (getCurrentListMap!2838 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912327 () Bool)

(assert (=> b!912327 (= e!511742 (not true))))

(declare-fun arrayContainsKey!0 (array!54207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912327 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30806 0))(
  ( (Unit!30807) )
))
(declare-fun lt!410445 () Unit!30806)

(declare-fun lemmaKeyInListMapIsInArray!260 (array!54207 array!54205 (_ BitVec 32) (_ BitVec 32) V!30439 V!30439 (_ BitVec 64) Int) Unit!30806)

(assert (=> b!912327 (= lt!410445 (lemmaKeyInListMapIsInArray!260 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!30385 () Bool)

(assert (=> mapIsEmpty!30385 mapRes!30385))

(declare-fun b!912328 () Bool)

(declare-fun res!615477 () Bool)

(assert (=> b!912328 (=> (not res!615477) (not e!511742))))

(assert (=> b!912328 (= res!615477 (and (= (size!26518 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26519 _keys!1386) (size!26518 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912329 () Bool)

(assert (=> b!912329 (= e!511741 tp_is_empty!19105)))

(declare-fun b!912330 () Bool)

(declare-fun res!615480 () Bool)

(assert (=> b!912330 (=> (not res!615480) (not e!511742))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912330 (= res!615480 (and (= (select (arr!26058 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912331 () Bool)

(assert (=> b!912331 (= e!511745 tp_is_empty!19105)))

(declare-fun b!912332 () Bool)

(declare-fun res!615478 () Bool)

(assert (=> b!912332 (=> (not res!615478) (not e!511742))))

(declare-datatypes ((List!18335 0))(
  ( (Nil!18332) (Cons!18331 (h!19477 (_ BitVec 64)) (t!25915 List!18335)) )
))
(declare-fun arrayNoDuplicates!0 (array!54207 (_ BitVec 32) List!18335) Bool)

(assert (=> b!912332 (= res!615478 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18332))))

(declare-fun b!912333 () Bool)

(declare-fun res!615475 () Bool)

(assert (=> b!912333 (=> (not res!615475) (not e!511742))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912333 (= res!615475 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78178 res!615479) b!912328))

(assert (= (and b!912328 res!615477) b!912325))

(assert (= (and b!912325 res!615481) b!912332))

(assert (= (and b!912332 res!615478) b!912326))

(assert (= (and b!912326 res!615476) b!912333))

(assert (= (and b!912333 res!615475) b!912330))

(assert (= (and b!912330 res!615480) b!912327))

(assert (= (and b!912324 condMapEmpty!30385) mapIsEmpty!30385))

(assert (= (and b!912324 (not condMapEmpty!30385)) mapNonEmpty!30385))

(get-info :version)

(assert (= (and mapNonEmpty!30385 ((_ is ValueCellFull!9071) mapValue!30385)) b!912329))

(assert (= (and b!912324 ((_ is ValueCellFull!9071) mapDefault!30385)) b!912331))

(assert (= start!78178 b!912324))

(declare-fun m!846285 () Bool)

(assert (=> b!912333 m!846285))

(declare-fun m!846287 () Bool)

(assert (=> b!912327 m!846287))

(declare-fun m!846289 () Bool)

(assert (=> b!912327 m!846289))

(declare-fun m!846291 () Bool)

(assert (=> start!78178 m!846291))

(declare-fun m!846293 () Bool)

(assert (=> start!78178 m!846293))

(declare-fun m!846295 () Bool)

(assert (=> start!78178 m!846295))

(declare-fun m!846297 () Bool)

(assert (=> b!912326 m!846297))

(assert (=> b!912326 m!846297))

(declare-fun m!846299 () Bool)

(assert (=> b!912326 m!846299))

(declare-fun m!846301 () Bool)

(assert (=> b!912325 m!846301))

(declare-fun m!846303 () Bool)

(assert (=> mapNonEmpty!30385 m!846303))

(declare-fun m!846305 () Bool)

(assert (=> b!912330 m!846305))

(declare-fun m!846307 () Bool)

(assert (=> b!912332 m!846307))

(check-sat (not b!912332) (not mapNonEmpty!30385) (not b!912326) (not b!912327) (not b!912333) (not b!912325) (not start!78178) tp_is_empty!19105 b_and!27237 (not b_next!16687))
(check-sat b_and!27237 (not b_next!16687))
