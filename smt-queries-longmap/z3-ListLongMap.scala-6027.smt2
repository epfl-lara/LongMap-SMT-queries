; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78214 () Bool)

(assert start!78214)

(declare-fun b_free!16573 () Bool)

(declare-fun b_next!16573 () Bool)

(assert (=> start!78214 (= b_free!16573 (not b_next!16573))))

(declare-fun tp!57991 () Bool)

(declare-fun b_and!27155 () Bool)

(assert (=> start!78214 (= tp!57991 b_and!27155)))

(declare-fun mapIsEmpty!30208 () Bool)

(declare-fun mapRes!30208 () Bool)

(assert (=> mapIsEmpty!30208 mapRes!30208))

(declare-fun res!615046 () Bool)

(declare-fun e!511466 () Bool)

(assert (=> start!78214 (=> (not res!615046) (not e!511466))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78214 (= res!615046 (validMask!0 mask!1756))))

(assert (=> start!78214 e!511466))

(declare-datatypes ((V!30287 0))(
  ( (V!30288 (val!9546 Int)) )
))
(declare-datatypes ((ValueCell!9014 0))(
  ( (ValueCellFull!9014 (v!12052 V!30287)) (EmptyCell!9014) )
))
(declare-datatypes ((array!54049 0))(
  ( (array!54050 (arr!25976 (Array (_ BitVec 32) ValueCell!9014)) (size!26436 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54049)

(declare-fun e!511465 () Bool)

(declare-fun array_inv!20382 (array!54049) Bool)

(assert (=> start!78214 (and (array_inv!20382 _values!1152) e!511465)))

(assert (=> start!78214 tp!57991))

(assert (=> start!78214 true))

(declare-fun tp_is_empty!18991 () Bool)

(assert (=> start!78214 tp_is_empty!18991))

(declare-datatypes ((array!54051 0))(
  ( (array!54052 (arr!25977 (Array (_ BitVec 32) (_ BitVec 64))) (size!26437 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54051)

(declare-fun array_inv!20383 (array!54051) Bool)

(assert (=> start!78214 (array_inv!20383 _keys!1386)))

(declare-fun b!911934 () Bool)

(declare-fun e!511464 () Bool)

(assert (=> b!911934 (= e!511464 tp_is_empty!18991)))

(declare-fun b!911935 () Bool)

(declare-fun res!615045 () Bool)

(assert (=> b!911935 (=> (not res!615045) (not e!511466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54051 (_ BitVec 32)) Bool)

(assert (=> b!911935 (= res!615045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911936 () Bool)

(declare-fun res!615044 () Bool)

(assert (=> b!911936 (=> (not res!615044) (not e!511466))))

(declare-datatypes ((List!18220 0))(
  ( (Nil!18217) (Cons!18216 (h!19368 (_ BitVec 64)) (t!25797 List!18220)) )
))
(declare-fun arrayNoDuplicates!0 (array!54051 (_ BitVec 32) List!18220) Bool)

(assert (=> b!911936 (= res!615044 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18217))))

(declare-fun b!911937 () Bool)

(assert (=> b!911937 (= e!511466 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30287)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun lt!410703 () Bool)

(declare-fun minValue!1094 () V!30287)

(declare-datatypes ((tuple2!12398 0))(
  ( (tuple2!12399 (_1!6210 (_ BitVec 64)) (_2!6210 V!30287)) )
))
(declare-datatypes ((List!18221 0))(
  ( (Nil!18218) (Cons!18217 (h!19369 tuple2!12398) (t!25798 List!18221)) )
))
(declare-datatypes ((ListLongMap!11097 0))(
  ( (ListLongMap!11098 (toList!5564 List!18221)) )
))
(declare-fun contains!4617 (ListLongMap!11097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2825 (array!54051 array!54049 (_ BitVec 32) (_ BitVec 32) V!30287 V!30287 (_ BitVec 32) Int) ListLongMap!11097)

(assert (=> b!911937 (= lt!410703 (contains!4617 (getCurrentListMap!2825 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30208 () Bool)

(declare-fun tp!57990 () Bool)

(assert (=> mapNonEmpty!30208 (= mapRes!30208 (and tp!57990 e!511464))))

(declare-fun mapRest!30208 () (Array (_ BitVec 32) ValueCell!9014))

(declare-fun mapValue!30208 () ValueCell!9014)

(declare-fun mapKey!30208 () (_ BitVec 32))

(assert (=> mapNonEmpty!30208 (= (arr!25976 _values!1152) (store mapRest!30208 mapKey!30208 mapValue!30208))))

(declare-fun b!911938 () Bool)

(declare-fun res!615047 () Bool)

(assert (=> b!911938 (=> (not res!615047) (not e!511466))))

(assert (=> b!911938 (= res!615047 (and (= (size!26436 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26437 _keys!1386) (size!26436 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911939 () Bool)

(declare-fun e!511467 () Bool)

(assert (=> b!911939 (= e!511467 tp_is_empty!18991)))

(declare-fun b!911940 () Bool)

(assert (=> b!911940 (= e!511465 (and e!511467 mapRes!30208))))

(declare-fun condMapEmpty!30208 () Bool)

(declare-fun mapDefault!30208 () ValueCell!9014)

(assert (=> b!911940 (= condMapEmpty!30208 (= (arr!25976 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9014)) mapDefault!30208)))))

(assert (= (and start!78214 res!615046) b!911938))

(assert (= (and b!911938 res!615047) b!911935))

(assert (= (and b!911935 res!615045) b!911936))

(assert (= (and b!911936 res!615044) b!911937))

(assert (= (and b!911940 condMapEmpty!30208) mapIsEmpty!30208))

(assert (= (and b!911940 (not condMapEmpty!30208)) mapNonEmpty!30208))

(get-info :version)

(assert (= (and mapNonEmpty!30208 ((_ is ValueCellFull!9014) mapValue!30208)) b!911934))

(assert (= (and b!911940 ((_ is ValueCellFull!9014) mapDefault!30208)) b!911939))

(assert (= start!78214 b!911940))

(declare-fun m!847183 () Bool)

(assert (=> b!911937 m!847183))

(assert (=> b!911937 m!847183))

(declare-fun m!847185 () Bool)

(assert (=> b!911937 m!847185))

(declare-fun m!847187 () Bool)

(assert (=> start!78214 m!847187))

(declare-fun m!847189 () Bool)

(assert (=> start!78214 m!847189))

(declare-fun m!847191 () Bool)

(assert (=> start!78214 m!847191))

(declare-fun m!847193 () Bool)

(assert (=> b!911935 m!847193))

(declare-fun m!847195 () Bool)

(assert (=> b!911936 m!847195))

(declare-fun m!847197 () Bool)

(assert (=> mapNonEmpty!30208 m!847197))

(check-sat (not b!911935) (not b!911936) (not b!911937) tp_is_empty!18991 (not mapNonEmpty!30208) (not start!78214) b_and!27155 (not b_next!16573))
(check-sat b_and!27155 (not b_next!16573))
