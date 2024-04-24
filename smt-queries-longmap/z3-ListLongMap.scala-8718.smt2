; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106004 () Bool)

(assert start!106004)

(declare-fun b_free!27343 () Bool)

(declare-fun b_next!27343 () Bool)

(assert (=> start!106004 (= b_free!27343 (not b_next!27343))))

(declare-fun tp!95558 () Bool)

(declare-fun b_and!45241 () Bool)

(assert (=> start!106004 (= tp!95558 b_and!45241)))

(declare-fun res!840266 () Bool)

(declare-fun e!717770 () Bool)

(assert (=> start!106004 (=> (not res!840266) (not e!717770))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106004 (= res!840266 (validMask!0 mask!1466))))

(assert (=> start!106004 e!717770))

(assert (=> start!106004 true))

(assert (=> start!106004 tp!95558))

(declare-fun tp_is_empty!32245 () Bool)

(assert (=> start!106004 tp_is_empty!32245))

(declare-datatypes ((array!82161 0))(
  ( (array!82162 (arr!39630 (Array (_ BitVec 32) (_ BitVec 64))) (size!40167 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82161)

(declare-fun array_inv!30317 (array!82161) Bool)

(assert (=> start!106004 (array_inv!30317 _keys!1118)))

(declare-datatypes ((V!48359 0))(
  ( (V!48360 (val!16185 Int)) )
))
(declare-datatypes ((ValueCell!15359 0))(
  ( (ValueCellFull!15359 (v!18884 V!48359)) (EmptyCell!15359) )
))
(declare-datatypes ((array!82163 0))(
  ( (array!82164 (arr!39631 (Array (_ BitVec 32) ValueCell!15359)) (size!40168 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82163)

(declare-fun e!717771 () Bool)

(declare-fun array_inv!30318 (array!82163) Bool)

(assert (=> start!106004 (and (array_inv!30318 _values!914) e!717771)))

(declare-fun mapIsEmpty!50167 () Bool)

(declare-fun mapRes!50167 () Bool)

(assert (=> mapIsEmpty!50167 mapRes!50167))

(declare-fun b!1261344 () Bool)

(declare-fun res!840263 () Bool)

(assert (=> b!1261344 (=> (not res!840263) (not e!717770))))

(declare-datatypes ((List!28172 0))(
  ( (Nil!28169) (Cons!28168 (h!29386 (_ BitVec 64)) (t!41661 List!28172)) )
))
(declare-fun arrayNoDuplicates!0 (array!82161 (_ BitVec 32) List!28172) Bool)

(assert (=> b!1261344 (= res!840263 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28169))))

(declare-fun b!1261345 () Bool)

(declare-fun e!717773 () Bool)

(assert (=> b!1261345 (= e!717773 tp_is_empty!32245)))

(declare-fun b!1261346 () Bool)

(declare-fun e!717775 () Bool)

(assert (=> b!1261346 (= e!717771 (and e!717775 mapRes!50167))))

(declare-fun condMapEmpty!50167 () Bool)

(declare-fun mapDefault!50167 () ValueCell!15359)

(assert (=> b!1261346 (= condMapEmpty!50167 (= (arr!39631 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15359)) mapDefault!50167)))))

(declare-fun e!717772 () Bool)

(declare-fun b!1261347 () Bool)

(declare-datatypes ((tuple2!20948 0))(
  ( (tuple2!20949 (_1!10485 (_ BitVec 64)) (_2!10485 V!48359)) )
))
(declare-datatypes ((List!28173 0))(
  ( (Nil!28170) (Cons!28169 (h!29387 tuple2!20948) (t!41662 List!28173)) )
))
(declare-datatypes ((ListLongMap!18829 0))(
  ( (ListLongMap!18830 (toList!9430 List!28173)) )
))
(declare-fun lt!571161 () ListLongMap!18829)

(declare-fun lt!571160 () tuple2!20948)

(declare-fun lt!571158 () ListLongMap!18829)

(declare-fun +!4269 (ListLongMap!18829 tuple2!20948) ListLongMap!18829)

(assert (=> b!1261347 (= e!717772 (= lt!571158 (+!4269 lt!571161 lt!571160)))))

(declare-fun b!1261348 () Bool)

(assert (=> b!1261348 (= e!717775 tp_is_empty!32245)))

(declare-fun b!1261349 () Bool)

(declare-fun e!717774 () Bool)

(assert (=> b!1261349 (= e!717774 true)))

(declare-fun lt!571159 () ListLongMap!18829)

(declare-fun lt!571166 () ListLongMap!18829)

(declare-fun -!2097 (ListLongMap!18829 (_ BitVec 64)) ListLongMap!18829)

(assert (=> b!1261349 (= lt!571159 (-!2097 lt!571166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571165 () ListLongMap!18829)

(declare-fun lt!571157 () ListLongMap!18829)

(assert (=> b!1261349 (= (-!2097 lt!571165 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571157)))

(declare-datatypes ((Unit!41996 0))(
  ( (Unit!41997) )
))
(declare-fun lt!571163 () Unit!41996)

(declare-fun minValueBefore!43 () V!48359)

(declare-fun addThenRemoveForNewKeyIsSame!351 (ListLongMap!18829 (_ BitVec 64) V!48359) Unit!41996)

(assert (=> b!1261349 (= lt!571163 (addThenRemoveForNewKeyIsSame!351 lt!571157 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1261349 e!717772))

(declare-fun res!840262 () Bool)

(assert (=> b!1261349 (=> (not res!840262) (not e!717772))))

(assert (=> b!1261349 (= res!840262 (= lt!571166 lt!571165))))

(assert (=> b!1261349 (= lt!571165 (+!4269 lt!571157 (tuple2!20949 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571164 () ListLongMap!18829)

(assert (=> b!1261349 (= lt!571157 (+!4269 lt!571164 lt!571160))))

(declare-fun zeroValue!871 () V!48359)

(assert (=> b!1261349 (= lt!571160 (tuple2!20949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48359)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4609 (array!82161 array!82163 (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1261349 (= lt!571158 (getCurrentListMap!4609 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261349 (= lt!571166 (getCurrentListMap!4609 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261350 () Bool)

(assert (=> b!1261350 (= e!717770 (not e!717774))))

(declare-fun res!840265 () Bool)

(assert (=> b!1261350 (=> res!840265 e!717774)))

(assert (=> b!1261350 (= res!840265 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1261350 (= lt!571164 lt!571161)))

(declare-fun lt!571162 () Unit!41996)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1153 (array!82161 array!82163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 V!48359 V!48359 (_ BitVec 32) Int) Unit!41996)

(assert (=> b!1261350 (= lt!571162 (lemmaNoChangeToArrayThenSameMapNoExtras!1153 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5839 (array!82161 array!82163 (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1261350 (= lt!571161 (getCurrentListMapNoExtraKeys!5839 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261350 (= lt!571164 (getCurrentListMapNoExtraKeys!5839 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261351 () Bool)

(declare-fun res!840267 () Bool)

(assert (=> b!1261351 (=> (not res!840267) (not e!717770))))

(assert (=> b!1261351 (= res!840267 (and (= (size!40168 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40167 _keys!1118) (size!40168 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261352 () Bool)

(declare-fun res!840264 () Bool)

(assert (=> b!1261352 (=> (not res!840264) (not e!717770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82161 (_ BitVec 32)) Bool)

(assert (=> b!1261352 (= res!840264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50167 () Bool)

(declare-fun tp!95557 () Bool)

(assert (=> mapNonEmpty!50167 (= mapRes!50167 (and tp!95557 e!717773))))

(declare-fun mapRest!50167 () (Array (_ BitVec 32) ValueCell!15359))

(declare-fun mapKey!50167 () (_ BitVec 32))

(declare-fun mapValue!50167 () ValueCell!15359)

(assert (=> mapNonEmpty!50167 (= (arr!39631 _values!914) (store mapRest!50167 mapKey!50167 mapValue!50167))))

(assert (= (and start!106004 res!840266) b!1261351))

(assert (= (and b!1261351 res!840267) b!1261352))

(assert (= (and b!1261352 res!840264) b!1261344))

(assert (= (and b!1261344 res!840263) b!1261350))

(assert (= (and b!1261350 (not res!840265)) b!1261349))

(assert (= (and b!1261349 res!840262) b!1261347))

(assert (= (and b!1261346 condMapEmpty!50167) mapIsEmpty!50167))

(assert (= (and b!1261346 (not condMapEmpty!50167)) mapNonEmpty!50167))

(get-info :version)

(assert (= (and mapNonEmpty!50167 ((_ is ValueCellFull!15359) mapValue!50167)) b!1261345))

(assert (= (and b!1261346 ((_ is ValueCellFull!15359) mapDefault!50167)) b!1261348))

(assert (= start!106004 b!1261346))

(declare-fun m!1162253 () Bool)

(assert (=> b!1261352 m!1162253))

(declare-fun m!1162255 () Bool)

(assert (=> b!1261344 m!1162255))

(declare-fun m!1162257 () Bool)

(assert (=> mapNonEmpty!50167 m!1162257))

(declare-fun m!1162259 () Bool)

(assert (=> b!1261350 m!1162259))

(declare-fun m!1162261 () Bool)

(assert (=> b!1261350 m!1162261))

(declare-fun m!1162263 () Bool)

(assert (=> b!1261350 m!1162263))

(declare-fun m!1162265 () Bool)

(assert (=> b!1261347 m!1162265))

(declare-fun m!1162267 () Bool)

(assert (=> start!106004 m!1162267))

(declare-fun m!1162269 () Bool)

(assert (=> start!106004 m!1162269))

(declare-fun m!1162271 () Bool)

(assert (=> start!106004 m!1162271))

(declare-fun m!1162273 () Bool)

(assert (=> b!1261349 m!1162273))

(declare-fun m!1162275 () Bool)

(assert (=> b!1261349 m!1162275))

(declare-fun m!1162277 () Bool)

(assert (=> b!1261349 m!1162277))

(declare-fun m!1162279 () Bool)

(assert (=> b!1261349 m!1162279))

(declare-fun m!1162281 () Bool)

(assert (=> b!1261349 m!1162281))

(declare-fun m!1162283 () Bool)

(assert (=> b!1261349 m!1162283))

(declare-fun m!1162285 () Bool)

(assert (=> b!1261349 m!1162285))

(check-sat (not b!1261350) (not b!1261347) (not mapNonEmpty!50167) tp_is_empty!32245 (not b_next!27343) (not b!1261344) b_and!45241 (not b!1261349) (not start!106004) (not b!1261352))
(check-sat b_and!45241 (not b_next!27343))
