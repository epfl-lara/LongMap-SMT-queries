; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105208 () Bool)

(assert start!105208)

(declare-fun b_free!26925 () Bool)

(declare-fun b_next!26925 () Bool)

(assert (=> start!105208 (= b_free!26925 (not b_next!26925))))

(declare-fun tp!94280 () Bool)

(declare-fun b_and!44739 () Bool)

(assert (=> start!105208 (= tp!94280 b_and!44739)))

(declare-fun b!1253725 () Bool)

(declare-fun res!836007 () Bool)

(declare-fun e!712293 () Bool)

(assert (=> b!1253725 (=> (not res!836007) (not e!712293))))

(declare-datatypes ((array!81312 0))(
  ( (array!81313 (arr!39218 (Array (_ BitVec 32) (_ BitVec 64))) (size!39754 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81312)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81312 (_ BitVec 32)) Bool)

(assert (=> b!1253725 (= res!836007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836006 () Bool)

(assert (=> start!105208 (=> (not res!836006) (not e!712293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105208 (= res!836006 (validMask!0 mask!1466))))

(assert (=> start!105208 e!712293))

(assert (=> start!105208 true))

(assert (=> start!105208 tp!94280))

(declare-fun tp_is_empty!31827 () Bool)

(assert (=> start!105208 tp_is_empty!31827))

(declare-fun array_inv!29897 (array!81312) Bool)

(assert (=> start!105208 (array_inv!29897 _keys!1118)))

(declare-datatypes ((V!47801 0))(
  ( (V!47802 (val!15976 Int)) )
))
(declare-datatypes ((ValueCell!15150 0))(
  ( (ValueCellFull!15150 (v!18674 V!47801)) (EmptyCell!15150) )
))
(declare-datatypes ((array!81314 0))(
  ( (array!81315 (arr!39219 (Array (_ BitVec 32) ValueCell!15150)) (size!39755 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81314)

(declare-fun e!712291 () Bool)

(declare-fun array_inv!29898 (array!81314) Bool)

(assert (=> start!105208 (and (array_inv!29898 _values!914) e!712291)))

(declare-fun mapIsEmpty!49516 () Bool)

(declare-fun mapRes!49516 () Bool)

(assert (=> mapIsEmpty!49516 mapRes!49516))

(declare-fun b!1253726 () Bool)

(declare-fun e!712288 () Bool)

(assert (=> b!1253726 (= e!712288 tp_is_empty!31827)))

(declare-fun b!1253727 () Bool)

(declare-fun res!836005 () Bool)

(assert (=> b!1253727 (=> (not res!836005) (not e!712293))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253727 (= res!836005 (and (= (size!39755 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39754 _keys!1118) (size!39755 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253728 () Bool)

(declare-fun e!712289 () Bool)

(assert (=> b!1253728 (= e!712291 (and e!712289 mapRes!49516))))

(declare-fun condMapEmpty!49516 () Bool)

(declare-fun mapDefault!49516 () ValueCell!15150)

(assert (=> b!1253728 (= condMapEmpty!49516 (= (arr!39219 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15150)) mapDefault!49516)))))

(declare-fun b!1253729 () Bool)

(assert (=> b!1253729 (= e!712289 tp_is_empty!31827)))

(declare-fun b!1253730 () Bool)

(declare-fun res!836008 () Bool)

(assert (=> b!1253730 (=> (not res!836008) (not e!712293))))

(declare-datatypes ((List!27849 0))(
  ( (Nil!27846) (Cons!27845 (h!29054 (_ BitVec 64)) (t!41330 List!27849)) )
))
(declare-fun arrayNoDuplicates!0 (array!81312 (_ BitVec 32) List!27849) Bool)

(assert (=> b!1253730 (= res!836008 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27846))))

(declare-fun mapNonEmpty!49516 () Bool)

(declare-fun tp!94279 () Bool)

(assert (=> mapNonEmpty!49516 (= mapRes!49516 (and tp!94279 e!712288))))

(declare-fun mapKey!49516 () (_ BitVec 32))

(declare-fun mapValue!49516 () ValueCell!15150)

(declare-fun mapRest!49516 () (Array (_ BitVec 32) ValueCell!15150))

(assert (=> mapNonEmpty!49516 (= (arr!39219 _values!914) (store mapRest!49516 mapKey!49516 mapValue!49516))))

(declare-fun b!1253731 () Bool)

(declare-fun e!712292 () Bool)

(assert (=> b!1253731 (= e!712293 (not e!712292))))

(declare-fun res!836009 () Bool)

(assert (=> b!1253731 (=> res!836009 e!712292)))

(assert (=> b!1253731 (= res!836009 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20620 0))(
  ( (tuple2!20621 (_1!10321 (_ BitVec 64)) (_2!10321 V!47801)) )
))
(declare-datatypes ((List!27850 0))(
  ( (Nil!27847) (Cons!27846 (h!29055 tuple2!20620) (t!41331 List!27850)) )
))
(declare-datatypes ((ListLongMap!18493 0))(
  ( (ListLongMap!18494 (toList!9262 List!27850)) )
))
(declare-fun lt!566258 () ListLongMap!18493)

(declare-fun lt!566255 () ListLongMap!18493)

(assert (=> b!1253731 (= lt!566258 lt!566255)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47801)

(declare-fun minValueBefore!43 () V!47801)

(declare-fun zeroValue!871 () V!47801)

(declare-datatypes ((Unit!41706 0))(
  ( (Unit!41707) )
))
(declare-fun lt!566261 () Unit!41706)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1016 (array!81312 array!81314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47801 V!47801 V!47801 V!47801 (_ BitVec 32) Int) Unit!41706)

(assert (=> b!1253731 (= lt!566261 (lemmaNoChangeToArrayThenSameMapNoExtras!1016 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5652 (array!81312 array!81314 (_ BitVec 32) (_ BitVec 32) V!47801 V!47801 (_ BitVec 32) Int) ListLongMap!18493)

(assert (=> b!1253731 (= lt!566255 (getCurrentListMapNoExtraKeys!5652 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253731 (= lt!566258 (getCurrentListMapNoExtraKeys!5652 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253732 () Bool)

(assert (=> b!1253732 (= e!712292 true)))

(declare-fun lt!566259 () ListLongMap!18493)

(declare-fun lt!566256 () ListLongMap!18493)

(declare-fun -!2035 (ListLongMap!18493 (_ BitVec 64)) ListLongMap!18493)

(assert (=> b!1253732 (= lt!566259 (-!2035 lt!566256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566257 () ListLongMap!18493)

(assert (=> b!1253732 (= (-!2035 lt!566257 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566258)))

(declare-fun lt!566262 () Unit!41706)

(declare-fun addThenRemoveForNewKeyIsSame!305 (ListLongMap!18493 (_ BitVec 64) V!47801) Unit!41706)

(assert (=> b!1253732 (= lt!566262 (addThenRemoveForNewKeyIsSame!305 lt!566258 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566260 () ListLongMap!18493)

(assert (=> b!1253732 (and (= lt!566256 lt!566257) (= lt!566260 lt!566255))))

(declare-fun +!4158 (ListLongMap!18493 tuple2!20620) ListLongMap!18493)

(assert (=> b!1253732 (= lt!566257 (+!4158 lt!566258 (tuple2!20621 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4506 (array!81312 array!81314 (_ BitVec 32) (_ BitVec 32) V!47801 V!47801 (_ BitVec 32) Int) ListLongMap!18493)

(assert (=> b!1253732 (= lt!566260 (getCurrentListMap!4506 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253732 (= lt!566256 (getCurrentListMap!4506 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105208 res!836006) b!1253727))

(assert (= (and b!1253727 res!836005) b!1253725))

(assert (= (and b!1253725 res!836007) b!1253730))

(assert (= (and b!1253730 res!836008) b!1253731))

(assert (= (and b!1253731 (not res!836009)) b!1253732))

(assert (= (and b!1253728 condMapEmpty!49516) mapIsEmpty!49516))

(assert (= (and b!1253728 (not condMapEmpty!49516)) mapNonEmpty!49516))

(get-info :version)

(assert (= (and mapNonEmpty!49516 ((_ is ValueCellFull!15150) mapValue!49516)) b!1253726))

(assert (= (and b!1253728 ((_ is ValueCellFull!15150) mapDefault!49516)) b!1253729))

(assert (= start!105208 b!1253728))

(declare-fun m!1154325 () Bool)

(assert (=> b!1253730 m!1154325))

(declare-fun m!1154327 () Bool)

(assert (=> b!1253725 m!1154327))

(declare-fun m!1154329 () Bool)

(assert (=> b!1253731 m!1154329))

(declare-fun m!1154331 () Bool)

(assert (=> b!1253731 m!1154331))

(declare-fun m!1154333 () Bool)

(assert (=> b!1253731 m!1154333))

(declare-fun m!1154335 () Bool)

(assert (=> b!1253732 m!1154335))

(declare-fun m!1154337 () Bool)

(assert (=> b!1253732 m!1154337))

(declare-fun m!1154339 () Bool)

(assert (=> b!1253732 m!1154339))

(declare-fun m!1154341 () Bool)

(assert (=> b!1253732 m!1154341))

(declare-fun m!1154343 () Bool)

(assert (=> b!1253732 m!1154343))

(declare-fun m!1154345 () Bool)

(assert (=> b!1253732 m!1154345))

(declare-fun m!1154347 () Bool)

(assert (=> mapNonEmpty!49516 m!1154347))

(declare-fun m!1154349 () Bool)

(assert (=> start!105208 m!1154349))

(declare-fun m!1154351 () Bool)

(assert (=> start!105208 m!1154351))

(declare-fun m!1154353 () Bool)

(assert (=> start!105208 m!1154353))

(check-sat (not b!1253725) (not start!105208) b_and!44739 (not mapNonEmpty!49516) (not b!1253731) (not b_next!26925) (not b!1253730) (not b!1253732) tp_is_empty!31827)
(check-sat b_and!44739 (not b_next!26925))
