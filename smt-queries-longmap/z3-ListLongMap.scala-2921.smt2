; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41682 () Bool)

(assert start!41682)

(declare-fun b_free!11335 () Bool)

(declare-fun b_next!11335 () Bool)

(assert (=> start!41682 (= b_free!11335 (not b_next!11335))))

(declare-fun tp!40009 () Bool)

(declare-fun b_and!19701 () Bool)

(assert (=> start!41682 (= tp!40009 b_and!19701)))

(declare-fun b!465493 () Bool)

(declare-fun res!278276 () Bool)

(declare-fun e!272049 () Bool)

(assert (=> b!465493 (=> (not res!278276) (not e!272049))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29308 0))(
  ( (array!29309 (arr!14083 (Array (_ BitVec 32) (_ BitVec 64))) (size!14435 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29308)

(declare-datatypes ((V!18123 0))(
  ( (V!18124 (val!6426 Int)) )
))
(declare-datatypes ((ValueCell!6038 0))(
  ( (ValueCellFull!6038 (v!8714 V!18123)) (EmptyCell!6038) )
))
(declare-datatypes ((array!29310 0))(
  ( (array!29311 (arr!14084 (Array (_ BitVec 32) ValueCell!6038)) (size!14436 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29310)

(assert (=> b!465493 (= res!278276 (and (= (size!14436 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14435 _keys!1025) (size!14436 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465494 () Bool)

(declare-fun e!272053 () Bool)

(declare-fun tp_is_empty!12763 () Bool)

(assert (=> b!465494 (= e!272053 tp_is_empty!12763)))

(declare-fun b!465495 () Bool)

(declare-fun e!272050 () Bool)

(assert (=> b!465495 (= e!272050 tp_is_empty!12763)))

(declare-fun mapIsEmpty!20827 () Bool)

(declare-fun mapRes!20827 () Bool)

(assert (=> mapIsEmpty!20827 mapRes!20827))

(declare-fun b!465496 () Bool)

(declare-fun res!278280 () Bool)

(assert (=> b!465496 (=> (not res!278280) (not e!272049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29308 (_ BitVec 32)) Bool)

(assert (=> b!465496 (= res!278280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278278 () Bool)

(assert (=> start!41682 (=> (not res!278278) (not e!272049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41682 (= res!278278 (validMask!0 mask!1365))))

(assert (=> start!41682 e!272049))

(assert (=> start!41682 tp_is_empty!12763))

(assert (=> start!41682 tp!40009))

(assert (=> start!41682 true))

(declare-fun array_inv!10252 (array!29308) Bool)

(assert (=> start!41682 (array_inv!10252 _keys!1025)))

(declare-fun e!272052 () Bool)

(declare-fun array_inv!10253 (array!29310) Bool)

(assert (=> start!41682 (and (array_inv!10253 _values!833) e!272052)))

(declare-fun b!465497 () Bool)

(declare-fun e!272051 () Bool)

(assert (=> b!465497 (= e!272049 (not e!272051))))

(declare-fun res!278277 () Bool)

(assert (=> b!465497 (=> res!278277 e!272051)))

(assert (=> b!465497 (= res!278277 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8356 0))(
  ( (tuple2!8357 (_1!4189 (_ BitVec 64)) (_2!4189 V!18123)) )
))
(declare-datatypes ((List!8444 0))(
  ( (Nil!8441) (Cons!8440 (h!9296 tuple2!8356) (t!14386 List!8444)) )
))
(declare-datatypes ((ListLongMap!7271 0))(
  ( (ListLongMap!7272 (toList!3651 List!8444)) )
))
(declare-fun lt!210246 () ListLongMap!7271)

(declare-fun lt!210244 () ListLongMap!7271)

(assert (=> b!465497 (= lt!210246 lt!210244)))

(declare-fun minValueBefore!38 () V!18123)

(declare-fun zeroValue!794 () V!18123)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13520 0))(
  ( (Unit!13521) )
))
(declare-fun lt!210245 () Unit!13520)

(declare-fun minValueAfter!38 () V!18123)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!38 (array!29308 array!29310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 V!18123 V!18123 (_ BitVec 32) Int) Unit!13520)

(assert (=> b!465497 (= lt!210245 (lemmaNoChangeToArrayThenSameMapNoExtras!38 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1878 (array!29308 array!29310 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7271)

(assert (=> b!465497 (= lt!210244 (getCurrentListMapNoExtraKeys!1878 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465497 (= lt!210246 (getCurrentListMapNoExtraKeys!1878 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465498 () Bool)

(assert (=> b!465498 (= e!272051 true)))

(declare-fun lt!210247 () ListLongMap!7271)

(declare-fun getCurrentListMap!2104 (array!29308 array!29310 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7271)

(assert (=> b!465498 (= lt!210247 (getCurrentListMap!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210243 () ListLongMap!7271)

(declare-fun +!1653 (ListLongMap!7271 tuple2!8356) ListLongMap!7271)

(assert (=> b!465498 (= lt!210243 (+!1653 (getCurrentListMap!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8357 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465499 () Bool)

(assert (=> b!465499 (= e!272052 (and e!272050 mapRes!20827))))

(declare-fun condMapEmpty!20827 () Bool)

(declare-fun mapDefault!20827 () ValueCell!6038)

(assert (=> b!465499 (= condMapEmpty!20827 (= (arr!14084 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6038)) mapDefault!20827)))))

(declare-fun b!465500 () Bool)

(declare-fun res!278279 () Bool)

(assert (=> b!465500 (=> (not res!278279) (not e!272049))))

(declare-datatypes ((List!8445 0))(
  ( (Nil!8442) (Cons!8441 (h!9297 (_ BitVec 64)) (t!14387 List!8445)) )
))
(declare-fun arrayNoDuplicates!0 (array!29308 (_ BitVec 32) List!8445) Bool)

(assert (=> b!465500 (= res!278279 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8442))))

(declare-fun mapNonEmpty!20827 () Bool)

(declare-fun tp!40008 () Bool)

(assert (=> mapNonEmpty!20827 (= mapRes!20827 (and tp!40008 e!272053))))

(declare-fun mapRest!20827 () (Array (_ BitVec 32) ValueCell!6038))

(declare-fun mapKey!20827 () (_ BitVec 32))

(declare-fun mapValue!20827 () ValueCell!6038)

(assert (=> mapNonEmpty!20827 (= (arr!14084 _values!833) (store mapRest!20827 mapKey!20827 mapValue!20827))))

(assert (= (and start!41682 res!278278) b!465493))

(assert (= (and b!465493 res!278276) b!465496))

(assert (= (and b!465496 res!278280) b!465500))

(assert (= (and b!465500 res!278279) b!465497))

(assert (= (and b!465497 (not res!278277)) b!465498))

(assert (= (and b!465499 condMapEmpty!20827) mapIsEmpty!20827))

(assert (= (and b!465499 (not condMapEmpty!20827)) mapNonEmpty!20827))

(get-info :version)

(assert (= (and mapNonEmpty!20827 ((_ is ValueCellFull!6038) mapValue!20827)) b!465494))

(assert (= (and b!465499 ((_ is ValueCellFull!6038) mapDefault!20827)) b!465495))

(assert (= start!41682 b!465499))

(declare-fun m!447967 () Bool)

(assert (=> start!41682 m!447967))

(declare-fun m!447969 () Bool)

(assert (=> start!41682 m!447969))

(declare-fun m!447971 () Bool)

(assert (=> start!41682 m!447971))

(declare-fun m!447973 () Bool)

(assert (=> b!465500 m!447973))

(declare-fun m!447975 () Bool)

(assert (=> b!465498 m!447975))

(declare-fun m!447977 () Bool)

(assert (=> b!465498 m!447977))

(assert (=> b!465498 m!447977))

(declare-fun m!447979 () Bool)

(assert (=> b!465498 m!447979))

(declare-fun m!447981 () Bool)

(assert (=> b!465497 m!447981))

(declare-fun m!447983 () Bool)

(assert (=> b!465497 m!447983))

(declare-fun m!447985 () Bool)

(assert (=> b!465497 m!447985))

(declare-fun m!447987 () Bool)

(assert (=> mapNonEmpty!20827 m!447987))

(declare-fun m!447989 () Bool)

(assert (=> b!465496 m!447989))

(check-sat (not b!465497) (not b_next!11335) (not b!465500) b_and!19701 tp_is_empty!12763 (not b!465496) (not start!41682) (not b!465498) (not mapNonEmpty!20827))
(check-sat b_and!19701 (not b_next!11335))
