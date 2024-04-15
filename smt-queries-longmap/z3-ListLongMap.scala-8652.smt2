; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105248 () Bool)

(assert start!105248)

(declare-fun b_free!26947 () Bool)

(declare-fun b_next!26947 () Bool)

(assert (=> start!105248 (= b_free!26947 (not b_next!26947))))

(declare-fun tp!94348 () Bool)

(declare-fun b_and!44755 () Bool)

(assert (=> start!105248 (= tp!94348 b_and!44755)))

(declare-fun b!1254091 () Bool)

(declare-fun e!712565 () Bool)

(declare-fun e!712563 () Bool)

(declare-fun mapRes!49552 () Bool)

(assert (=> b!1254091 (= e!712565 (and e!712563 mapRes!49552))))

(declare-fun condMapEmpty!49552 () Bool)

(declare-datatypes ((V!47831 0))(
  ( (V!47832 (val!15987 Int)) )
))
(declare-datatypes ((ValueCell!15161 0))(
  ( (ValueCellFull!15161 (v!18685 V!47831)) (EmptyCell!15161) )
))
(declare-datatypes ((array!81281 0))(
  ( (array!81282 (arr!39202 (Array (_ BitVec 32) ValueCell!15161)) (size!39740 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81281)

(declare-fun mapDefault!49552 () ValueCell!15161)

(assert (=> b!1254091 (= condMapEmpty!49552 (= (arr!39202 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15161)) mapDefault!49552)))))

(declare-fun b!1254092 () Bool)

(declare-fun e!712564 () Bool)

(declare-fun tp_is_empty!31849 () Bool)

(assert (=> b!1254092 (= e!712564 tp_is_empty!31849)))

(declare-fun b!1254093 () Bool)

(declare-fun e!712561 () Bool)

(assert (=> b!1254093 (= e!712561 true)))

(declare-datatypes ((tuple2!20726 0))(
  ( (tuple2!20727 (_1!10374 (_ BitVec 64)) (_2!10374 V!47831)) )
))
(declare-datatypes ((List!27936 0))(
  ( (Nil!27933) (Cons!27932 (h!29141 tuple2!20726) (t!41410 List!27936)) )
))
(declare-datatypes ((ListLongMap!18599 0))(
  ( (ListLongMap!18600 (toList!9315 List!27936)) )
))
(declare-fun lt!566481 () ListLongMap!18599)

(declare-fun lt!566480 () ListLongMap!18599)

(declare-fun -!2008 (ListLongMap!18599 (_ BitVec 64)) ListLongMap!18599)

(assert (=> b!1254093 (= lt!566481 (-!2008 lt!566480 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566483 () ListLongMap!18599)

(declare-fun lt!566478 () ListLongMap!18599)

(assert (=> b!1254093 (= (-!2008 lt!566483 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566478)))

(declare-datatypes ((Unit!41595 0))(
  ( (Unit!41596) )
))
(declare-fun lt!566484 () Unit!41595)

(declare-fun minValueBefore!43 () V!47831)

(declare-fun addThenRemoveForNewKeyIsSame!297 (ListLongMap!18599 (_ BitVec 64) V!47831) Unit!41595)

(assert (=> b!1254093 (= lt!566484 (addThenRemoveForNewKeyIsSame!297 lt!566478 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566485 () ListLongMap!18599)

(declare-fun lt!566479 () ListLongMap!18599)

(assert (=> b!1254093 (and (= lt!566480 lt!566483) (= lt!566479 lt!566485))))

(declare-fun +!4211 (ListLongMap!18599 tuple2!20726) ListLongMap!18599)

(assert (=> b!1254093 (= lt!566483 (+!4211 lt!566478 (tuple2!20727 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47831)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47831)

(declare-datatypes ((array!81283 0))(
  ( (array!81284 (arr!39203 (Array (_ BitVec 32) (_ BitVec 64))) (size!39741 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81283)

(declare-fun getCurrentListMap!4447 (array!81283 array!81281 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18599)

(assert (=> b!1254093 (= lt!566479 (getCurrentListMap!4447 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254093 (= lt!566480 (getCurrentListMap!4447 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254094 () Bool)

(assert (=> b!1254094 (= e!712563 tp_is_empty!31849)))

(declare-fun b!1254095 () Bool)

(declare-fun res!836212 () Bool)

(declare-fun e!712560 () Bool)

(assert (=> b!1254095 (=> (not res!836212) (not e!712560))))

(assert (=> b!1254095 (= res!836212 (and (= (size!39740 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39741 _keys!1118) (size!39740 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254096 () Bool)

(assert (=> b!1254096 (= e!712560 (not e!712561))))

(declare-fun res!836213 () Bool)

(assert (=> b!1254096 (=> res!836213 e!712561)))

(assert (=> b!1254096 (= res!836213 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254096 (= lt!566478 lt!566485)))

(declare-fun lt!566482 () Unit!41595)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1036 (array!81283 array!81281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 V!47831 V!47831 (_ BitVec 32) Int) Unit!41595)

(assert (=> b!1254096 (= lt!566482 (lemmaNoChangeToArrayThenSameMapNoExtras!1036 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5714 (array!81283 array!81281 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18599)

(assert (=> b!1254096 (= lt!566485 (getCurrentListMapNoExtraKeys!5714 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254096 (= lt!566478 (getCurrentListMapNoExtraKeys!5714 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254097 () Bool)

(declare-fun res!836216 () Bool)

(assert (=> b!1254097 (=> (not res!836216) (not e!712560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81283 (_ BitVec 32)) Bool)

(assert (=> b!1254097 (= res!836216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836214 () Bool)

(assert (=> start!105248 (=> (not res!836214) (not e!712560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105248 (= res!836214 (validMask!0 mask!1466))))

(assert (=> start!105248 e!712560))

(assert (=> start!105248 true))

(assert (=> start!105248 tp!94348))

(assert (=> start!105248 tp_is_empty!31849))

(declare-fun array_inv!30013 (array!81283) Bool)

(assert (=> start!105248 (array_inv!30013 _keys!1118)))

(declare-fun array_inv!30014 (array!81281) Bool)

(assert (=> start!105248 (and (array_inv!30014 _values!914) e!712565)))

(declare-fun b!1254098 () Bool)

(declare-fun res!836215 () Bool)

(assert (=> b!1254098 (=> (not res!836215) (not e!712560))))

(declare-datatypes ((List!27937 0))(
  ( (Nil!27934) (Cons!27933 (h!29142 (_ BitVec 64)) (t!41411 List!27937)) )
))
(declare-fun arrayNoDuplicates!0 (array!81283 (_ BitVec 32) List!27937) Bool)

(assert (=> b!1254098 (= res!836215 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27934))))

(declare-fun mapNonEmpty!49552 () Bool)

(declare-fun tp!94349 () Bool)

(assert (=> mapNonEmpty!49552 (= mapRes!49552 (and tp!94349 e!712564))))

(declare-fun mapKey!49552 () (_ BitVec 32))

(declare-fun mapRest!49552 () (Array (_ BitVec 32) ValueCell!15161))

(declare-fun mapValue!49552 () ValueCell!15161)

(assert (=> mapNonEmpty!49552 (= (arr!39202 _values!914) (store mapRest!49552 mapKey!49552 mapValue!49552))))

(declare-fun mapIsEmpty!49552 () Bool)

(assert (=> mapIsEmpty!49552 mapRes!49552))

(assert (= (and start!105248 res!836214) b!1254095))

(assert (= (and b!1254095 res!836212) b!1254097))

(assert (= (and b!1254097 res!836216) b!1254098))

(assert (= (and b!1254098 res!836215) b!1254096))

(assert (= (and b!1254096 (not res!836213)) b!1254093))

(assert (= (and b!1254091 condMapEmpty!49552) mapIsEmpty!49552))

(assert (= (and b!1254091 (not condMapEmpty!49552)) mapNonEmpty!49552))

(get-info :version)

(assert (= (and mapNonEmpty!49552 ((_ is ValueCellFull!15161) mapValue!49552)) b!1254092))

(assert (= (and b!1254091 ((_ is ValueCellFull!15161) mapDefault!49552)) b!1254094))

(assert (= start!105248 b!1254091))

(declare-fun m!1154319 () Bool)

(assert (=> start!105248 m!1154319))

(declare-fun m!1154321 () Bool)

(assert (=> start!105248 m!1154321))

(declare-fun m!1154323 () Bool)

(assert (=> start!105248 m!1154323))

(declare-fun m!1154325 () Bool)

(assert (=> b!1254096 m!1154325))

(declare-fun m!1154327 () Bool)

(assert (=> b!1254096 m!1154327))

(declare-fun m!1154329 () Bool)

(assert (=> b!1254096 m!1154329))

(declare-fun m!1154331 () Bool)

(assert (=> mapNonEmpty!49552 m!1154331))

(declare-fun m!1154333 () Bool)

(assert (=> b!1254098 m!1154333))

(declare-fun m!1154335 () Bool)

(assert (=> b!1254097 m!1154335))

(declare-fun m!1154337 () Bool)

(assert (=> b!1254093 m!1154337))

(declare-fun m!1154339 () Bool)

(assert (=> b!1254093 m!1154339))

(declare-fun m!1154341 () Bool)

(assert (=> b!1254093 m!1154341))

(declare-fun m!1154343 () Bool)

(assert (=> b!1254093 m!1154343))

(declare-fun m!1154345 () Bool)

(assert (=> b!1254093 m!1154345))

(declare-fun m!1154347 () Bool)

(assert (=> b!1254093 m!1154347))

(check-sat b_and!44755 (not b!1254096) (not b!1254093) (not start!105248) (not b!1254097) (not b!1254098) (not b_next!26947) tp_is_empty!31849 (not mapNonEmpty!49552))
(check-sat b_and!44755 (not b_next!26947))
