; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105934 () Bool)

(assert start!105934)

(declare-fun b_free!27295 () Bool)

(declare-fun b_next!27295 () Bool)

(assert (=> start!105934 (= b_free!27295 (not b_next!27295))))

(declare-fun tp!95411 () Bool)

(declare-fun b_and!45181 () Bool)

(assert (=> start!105934 (= tp!95411 b_and!45181)))

(declare-fun b!1260508 () Bool)

(declare-fun res!839744 () Bool)

(declare-fun e!717146 () Bool)

(assert (=> b!1260508 (=> (not res!839744) (not e!717146))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82067 0))(
  ( (array!82068 (arr!39584 (Array (_ BitVec 32) (_ BitVec 64))) (size!40121 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82067)

(declare-datatypes ((V!48295 0))(
  ( (V!48296 (val!16161 Int)) )
))
(declare-datatypes ((ValueCell!15335 0))(
  ( (ValueCellFull!15335 (v!18859 V!48295)) (EmptyCell!15335) )
))
(declare-datatypes ((array!82069 0))(
  ( (array!82070 (arr!39585 (Array (_ BitVec 32) ValueCell!15335)) (size!40122 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82069)

(assert (=> b!1260508 (= res!839744 (and (= (size!40122 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40121 _keys!1118) (size!40122 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260509 () Bool)

(declare-fun e!717148 () Bool)

(declare-fun e!717147 () Bool)

(declare-fun mapRes!50092 () Bool)

(assert (=> b!1260509 (= e!717148 (and e!717147 mapRes!50092))))

(declare-fun condMapEmpty!50092 () Bool)

(declare-fun mapDefault!50092 () ValueCell!15335)

(assert (=> b!1260509 (= condMapEmpty!50092 (= (arr!39585 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15335)) mapDefault!50092)))))

(declare-fun b!1260510 () Bool)

(declare-fun e!717150 () Bool)

(assert (=> b!1260510 (= e!717150 true)))

(declare-datatypes ((tuple2!20912 0))(
  ( (tuple2!20913 (_1!10467 (_ BitVec 64)) (_2!10467 V!48295)) )
))
(declare-datatypes ((List!28138 0))(
  ( (Nil!28135) (Cons!28134 (h!29352 tuple2!20912) (t!41625 List!28138)) )
))
(declare-datatypes ((ListLongMap!18793 0))(
  ( (ListLongMap!18794 (toList!9412 List!28138)) )
))
(declare-fun lt!570295 () ListLongMap!18793)

(declare-fun lt!570293 () ListLongMap!18793)

(declare-fun -!2083 (ListLongMap!18793 (_ BitVec 64)) ListLongMap!18793)

(assert (=> b!1260510 (= lt!570295 (-!2083 lt!570293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570297 () ListLongMap!18793)

(declare-fun lt!570298 () ListLongMap!18793)

(assert (=> b!1260510 (= (-!2083 lt!570297 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570298)))

(declare-datatypes ((Unit!41962 0))(
  ( (Unit!41963) )
))
(declare-fun lt!570299 () Unit!41962)

(declare-fun minValueBefore!43 () V!48295)

(declare-fun addThenRemoveForNewKeyIsSame!337 (ListLongMap!18793 (_ BitVec 64) V!48295) Unit!41962)

(assert (=> b!1260510 (= lt!570299 (addThenRemoveForNewKeyIsSame!337 lt!570298 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717149 () Bool)

(assert (=> b!1260510 e!717149))

(declare-fun res!839748 () Bool)

(assert (=> b!1260510 (=> (not res!839748) (not e!717149))))

(assert (=> b!1260510 (= res!839748 (= lt!570293 lt!570297))))

(declare-fun +!4252 (ListLongMap!18793 tuple2!20912) ListLongMap!18793)

(assert (=> b!1260510 (= lt!570297 (+!4252 lt!570298 (tuple2!20913 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570300 () ListLongMap!18793)

(declare-fun lt!570291 () tuple2!20912)

(assert (=> b!1260510 (= lt!570298 (+!4252 lt!570300 lt!570291))))

(declare-fun zeroValue!871 () V!48295)

(assert (=> b!1260510 (= lt!570291 (tuple2!20913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48295)

(declare-fun lt!570292 () ListLongMap!18793)

(declare-fun getCurrentListMap!4595 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 (_ BitVec 32) Int) ListLongMap!18793)

(assert (=> b!1260510 (= lt!570292 (getCurrentListMap!4595 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260510 (= lt!570293 (getCurrentListMap!4595 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260511 () Bool)

(declare-fun res!839746 () Bool)

(assert (=> b!1260511 (=> (not res!839746) (not e!717146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82067 (_ BitVec 32)) Bool)

(assert (=> b!1260511 (= res!839746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260512 () Bool)

(declare-fun e!717145 () Bool)

(declare-fun tp_is_empty!32197 () Bool)

(assert (=> b!1260512 (= e!717145 tp_is_empty!32197)))

(declare-fun mapNonEmpty!50092 () Bool)

(declare-fun tp!95410 () Bool)

(assert (=> mapNonEmpty!50092 (= mapRes!50092 (and tp!95410 e!717145))))

(declare-fun mapRest!50092 () (Array (_ BitVec 32) ValueCell!15335))

(declare-fun mapKey!50092 () (_ BitVec 32))

(declare-fun mapValue!50092 () ValueCell!15335)

(assert (=> mapNonEmpty!50092 (= (arr!39585 _values!914) (store mapRest!50092 mapKey!50092 mapValue!50092))))

(declare-fun res!839749 () Bool)

(assert (=> start!105934 (=> (not res!839749) (not e!717146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105934 (= res!839749 (validMask!0 mask!1466))))

(assert (=> start!105934 e!717146))

(assert (=> start!105934 true))

(assert (=> start!105934 tp!95411))

(assert (=> start!105934 tp_is_empty!32197))

(declare-fun array_inv!30285 (array!82067) Bool)

(assert (=> start!105934 (array_inv!30285 _keys!1118)))

(declare-fun array_inv!30286 (array!82069) Bool)

(assert (=> start!105934 (and (array_inv!30286 _values!914) e!717148)))

(declare-fun b!1260513 () Bool)

(assert (=> b!1260513 (= e!717146 (not e!717150))))

(declare-fun res!839747 () Bool)

(assert (=> b!1260513 (=> res!839747 e!717150)))

(assert (=> b!1260513 (= res!839747 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570296 () ListLongMap!18793)

(assert (=> b!1260513 (= lt!570300 lt!570296)))

(declare-fun lt!570294 () Unit!41962)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1138 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 V!48295 V!48295 (_ BitVec 32) Int) Unit!41962)

(assert (=> b!1260513 (= lt!570294 (lemmaNoChangeToArrayThenSameMapNoExtras!1138 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5824 (array!82067 array!82069 (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 (_ BitVec 32) Int) ListLongMap!18793)

(assert (=> b!1260513 (= lt!570296 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260513 (= lt!570300 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50092 () Bool)

(assert (=> mapIsEmpty!50092 mapRes!50092))

(declare-fun b!1260514 () Bool)

(assert (=> b!1260514 (= e!717147 tp_is_empty!32197)))

(declare-fun b!1260515 () Bool)

(declare-fun res!839745 () Bool)

(assert (=> b!1260515 (=> (not res!839745) (not e!717146))))

(declare-datatypes ((List!28139 0))(
  ( (Nil!28136) (Cons!28135 (h!29353 (_ BitVec 64)) (t!41626 List!28139)) )
))
(declare-fun arrayNoDuplicates!0 (array!82067 (_ BitVec 32) List!28139) Bool)

(assert (=> b!1260515 (= res!839745 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28136))))

(declare-fun b!1260516 () Bool)

(assert (=> b!1260516 (= e!717149 (= lt!570292 (+!4252 lt!570296 lt!570291)))))

(assert (= (and start!105934 res!839749) b!1260508))

(assert (= (and b!1260508 res!839744) b!1260511))

(assert (= (and b!1260511 res!839746) b!1260515))

(assert (= (and b!1260515 res!839745) b!1260513))

(assert (= (and b!1260513 (not res!839747)) b!1260510))

(assert (= (and b!1260510 res!839748) b!1260516))

(assert (= (and b!1260509 condMapEmpty!50092) mapIsEmpty!50092))

(assert (= (and b!1260509 (not condMapEmpty!50092)) mapNonEmpty!50092))

(get-info :version)

(assert (= (and mapNonEmpty!50092 ((_ is ValueCellFull!15335) mapValue!50092)) b!1260512))

(assert (= (and b!1260509 ((_ is ValueCellFull!15335) mapDefault!50092)) b!1260514))

(assert (= start!105934 b!1260509))

(declare-fun m!1161229 () Bool)

(assert (=> start!105934 m!1161229))

(declare-fun m!1161231 () Bool)

(assert (=> start!105934 m!1161231))

(declare-fun m!1161233 () Bool)

(assert (=> start!105934 m!1161233))

(declare-fun m!1161235 () Bool)

(assert (=> mapNonEmpty!50092 m!1161235))

(declare-fun m!1161237 () Bool)

(assert (=> b!1260513 m!1161237))

(declare-fun m!1161239 () Bool)

(assert (=> b!1260513 m!1161239))

(declare-fun m!1161241 () Bool)

(assert (=> b!1260513 m!1161241))

(declare-fun m!1161243 () Bool)

(assert (=> b!1260515 m!1161243))

(declare-fun m!1161245 () Bool)

(assert (=> b!1260510 m!1161245))

(declare-fun m!1161247 () Bool)

(assert (=> b!1260510 m!1161247))

(declare-fun m!1161249 () Bool)

(assert (=> b!1260510 m!1161249))

(declare-fun m!1161251 () Bool)

(assert (=> b!1260510 m!1161251))

(declare-fun m!1161253 () Bool)

(assert (=> b!1260510 m!1161253))

(declare-fun m!1161255 () Bool)

(assert (=> b!1260510 m!1161255))

(declare-fun m!1161257 () Bool)

(assert (=> b!1260510 m!1161257))

(declare-fun m!1161259 () Bool)

(assert (=> b!1260516 m!1161259))

(declare-fun m!1161261 () Bool)

(assert (=> b!1260511 m!1161261))

(check-sat (not b!1260516) (not mapNonEmpty!50092) tp_is_empty!32197 (not b!1260515) (not start!105934) (not b!1260510) b_and!45181 (not b_next!27295) (not b!1260511) (not b!1260513))
(check-sat b_and!45181 (not b_next!27295))
