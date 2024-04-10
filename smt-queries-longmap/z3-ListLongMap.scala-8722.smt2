; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105806 () Bool)

(assert start!105806)

(declare-fun b_free!27369 () Bool)

(declare-fun b_next!27369 () Bool)

(assert (=> start!105806 (= b_free!27369 (not b_next!27369))))

(declare-fun tp!95635 () Bool)

(declare-fun b_and!45265 () Bool)

(assert (=> start!105806 (= tp!95635 b_and!45265)))

(declare-fun res!839981 () Bool)

(declare-fun e!717199 () Bool)

(assert (=> start!105806 (=> (not res!839981) (not e!717199))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105806 (= res!839981 (validMask!0 mask!1466))))

(assert (=> start!105806 e!717199))

(assert (=> start!105806 true))

(assert (=> start!105806 tp!95635))

(declare-fun tp_is_empty!32271 () Bool)

(assert (=> start!105806 tp_is_empty!32271))

(declare-datatypes ((array!82160 0))(
  ( (array!82161 (arr!39634 (Array (_ BitVec 32) (_ BitVec 64))) (size!40170 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82160)

(declare-fun array_inv!30175 (array!82160) Bool)

(assert (=> start!105806 (array_inv!30175 _keys!1118)))

(declare-datatypes ((V!48393 0))(
  ( (V!48394 (val!16198 Int)) )
))
(declare-datatypes ((ValueCell!15372 0))(
  ( (ValueCellFull!15372 (v!18901 V!48393)) (EmptyCell!15372) )
))
(declare-datatypes ((array!82162 0))(
  ( (array!82163 (arr!39635 (Array (_ BitVec 32) ValueCell!15372)) (size!40171 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82162)

(declare-fun e!717198 () Bool)

(declare-fun array_inv!30176 (array!82162) Bool)

(assert (=> start!105806 (and (array_inv!30176 _values!914) e!717198)))

(declare-fun b!1260390 () Bool)

(declare-fun e!717202 () Bool)

(assert (=> b!1260390 (= e!717199 (not e!717202))))

(declare-fun res!839980 () Bool)

(assert (=> b!1260390 (=> res!839980 e!717202)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260390 (= res!839980 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20956 0))(
  ( (tuple2!20957 (_1!10489 (_ BitVec 64)) (_2!10489 V!48393)) )
))
(declare-datatypes ((List!28154 0))(
  ( (Nil!28151) (Cons!28150 (h!29359 tuple2!20956) (t!41651 List!28154)) )
))
(declare-datatypes ((ListLongMap!18829 0))(
  ( (ListLongMap!18830 (toList!9430 List!28154)) )
))
(declare-fun lt!571065 () ListLongMap!18829)

(declare-fun lt!571063 () ListLongMap!18829)

(assert (=> b!1260390 (= lt!571065 lt!571063)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48393)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48393)

(declare-fun minValueBefore!43 () V!48393)

(declare-datatypes ((Unit!42043 0))(
  ( (Unit!42044) )
))
(declare-fun lt!571066 () Unit!42043)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1165 (array!82160 array!82162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48393 V!48393 V!48393 V!48393 (_ BitVec 32) Int) Unit!42043)

(assert (=> b!1260390 (= lt!571066 (lemmaNoChangeToArrayThenSameMapNoExtras!1165 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5801 (array!82160 array!82162 (_ BitVec 32) (_ BitVec 32) V!48393 V!48393 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1260390 (= lt!571063 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260390 (= lt!571065 (getCurrentListMapNoExtraKeys!5801 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260391 () Bool)

(declare-fun res!839977 () Bool)

(assert (=> b!1260391 (=> (not res!839977) (not e!717199))))

(declare-datatypes ((List!28155 0))(
  ( (Nil!28152) (Cons!28151 (h!29360 (_ BitVec 64)) (t!41652 List!28155)) )
))
(declare-fun arrayNoDuplicates!0 (array!82160 (_ BitVec 32) List!28155) Bool)

(assert (=> b!1260391 (= res!839977 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28152))))

(declare-fun mapIsEmpty!50206 () Bool)

(declare-fun mapRes!50206 () Bool)

(assert (=> mapIsEmpty!50206 mapRes!50206))

(declare-fun b!1260392 () Bool)

(declare-fun e!717200 () Bool)

(assert (=> b!1260392 (= e!717200 tp_is_empty!32271)))

(declare-fun b!1260393 () Bool)

(declare-fun e!717197 () Bool)

(assert (=> b!1260393 (= e!717197 tp_is_empty!32271)))

(declare-fun b!1260394 () Bool)

(declare-fun res!839976 () Bool)

(assert (=> b!1260394 (=> (not res!839976) (not e!717199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82160 (_ BitVec 32)) Bool)

(assert (=> b!1260394 (= res!839976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun e!717196 () Bool)

(declare-fun b!1260395 () Bool)

(declare-fun lt!571069 () ListLongMap!18829)

(declare-fun lt!571067 () tuple2!20956)

(declare-fun +!4233 (ListLongMap!18829 tuple2!20956) ListLongMap!18829)

(assert (=> b!1260395 (= e!717196 (= lt!571069 (+!4233 lt!571063 lt!571067)))))

(declare-fun b!1260396 () Bool)

(assert (=> b!1260396 (= e!717202 true)))

(declare-fun lt!571071 () ListLongMap!18829)

(declare-fun lt!571070 () ListLongMap!18829)

(declare-fun -!2134 (ListLongMap!18829 (_ BitVec 64)) ListLongMap!18829)

(assert (=> b!1260396 (= lt!571071 (-!2134 lt!571070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571068 () ListLongMap!18829)

(declare-fun lt!571064 () ListLongMap!18829)

(assert (=> b!1260396 (= (-!2134 lt!571068 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571064)))

(declare-fun lt!571072 () Unit!42043)

(declare-fun addThenRemoveForNewKeyIsSame!371 (ListLongMap!18829 (_ BitVec 64) V!48393) Unit!42043)

(assert (=> b!1260396 (= lt!571072 (addThenRemoveForNewKeyIsSame!371 lt!571064 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260396 e!717196))

(declare-fun res!839979 () Bool)

(assert (=> b!1260396 (=> (not res!839979) (not e!717196))))

(assert (=> b!1260396 (= res!839979 (= lt!571070 lt!571068))))

(assert (=> b!1260396 (= lt!571068 (+!4233 lt!571064 (tuple2!20957 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1260396 (= lt!571064 (+!4233 lt!571065 lt!571067))))

(assert (=> b!1260396 (= lt!571067 (tuple2!20957 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4625 (array!82160 array!82162 (_ BitVec 32) (_ BitVec 32) V!48393 V!48393 (_ BitVec 32) Int) ListLongMap!18829)

(assert (=> b!1260396 (= lt!571069 (getCurrentListMap!4625 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260396 (= lt!571070 (getCurrentListMap!4625 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260397 () Bool)

(assert (=> b!1260397 (= e!717198 (and e!717197 mapRes!50206))))

(declare-fun condMapEmpty!50206 () Bool)

(declare-fun mapDefault!50206 () ValueCell!15372)

(assert (=> b!1260397 (= condMapEmpty!50206 (= (arr!39635 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15372)) mapDefault!50206)))))

(declare-fun b!1260398 () Bool)

(declare-fun res!839978 () Bool)

(assert (=> b!1260398 (=> (not res!839978) (not e!717199))))

(assert (=> b!1260398 (= res!839978 (and (= (size!40171 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40170 _keys!1118) (size!40171 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50206 () Bool)

(declare-fun tp!95636 () Bool)

(assert (=> mapNonEmpty!50206 (= mapRes!50206 (and tp!95636 e!717200))))

(declare-fun mapRest!50206 () (Array (_ BitVec 32) ValueCell!15372))

(declare-fun mapValue!50206 () ValueCell!15372)

(declare-fun mapKey!50206 () (_ BitVec 32))

(assert (=> mapNonEmpty!50206 (= (arr!39635 _values!914) (store mapRest!50206 mapKey!50206 mapValue!50206))))

(assert (= (and start!105806 res!839981) b!1260398))

(assert (= (and b!1260398 res!839978) b!1260394))

(assert (= (and b!1260394 res!839976) b!1260391))

(assert (= (and b!1260391 res!839977) b!1260390))

(assert (= (and b!1260390 (not res!839980)) b!1260396))

(assert (= (and b!1260396 res!839979) b!1260395))

(assert (= (and b!1260397 condMapEmpty!50206) mapIsEmpty!50206))

(assert (= (and b!1260397 (not condMapEmpty!50206)) mapNonEmpty!50206))

(get-info :version)

(assert (= (and mapNonEmpty!50206 ((_ is ValueCellFull!15372) mapValue!50206)) b!1260392))

(assert (= (and b!1260397 ((_ is ValueCellFull!15372) mapDefault!50206)) b!1260393))

(assert (= start!105806 b!1260397))

(declare-fun m!1161083 () Bool)

(assert (=> b!1260394 m!1161083))

(declare-fun m!1161085 () Bool)

(assert (=> b!1260395 m!1161085))

(declare-fun m!1161087 () Bool)

(assert (=> b!1260390 m!1161087))

(declare-fun m!1161089 () Bool)

(assert (=> b!1260390 m!1161089))

(declare-fun m!1161091 () Bool)

(assert (=> b!1260390 m!1161091))

(declare-fun m!1161093 () Bool)

(assert (=> mapNonEmpty!50206 m!1161093))

(declare-fun m!1161095 () Bool)

(assert (=> start!105806 m!1161095))

(declare-fun m!1161097 () Bool)

(assert (=> start!105806 m!1161097))

(declare-fun m!1161099 () Bool)

(assert (=> start!105806 m!1161099))

(declare-fun m!1161101 () Bool)

(assert (=> b!1260391 m!1161101))

(declare-fun m!1161103 () Bool)

(assert (=> b!1260396 m!1161103))

(declare-fun m!1161105 () Bool)

(assert (=> b!1260396 m!1161105))

(declare-fun m!1161107 () Bool)

(assert (=> b!1260396 m!1161107))

(declare-fun m!1161109 () Bool)

(assert (=> b!1260396 m!1161109))

(declare-fun m!1161111 () Bool)

(assert (=> b!1260396 m!1161111))

(declare-fun m!1161113 () Bool)

(assert (=> b!1260396 m!1161113))

(declare-fun m!1161115 () Bool)

(assert (=> b!1260396 m!1161115))

(check-sat (not mapNonEmpty!50206) (not b!1260391) (not b!1260394) (not b!1260396) (not start!105806) b_and!45265 (not b!1260395) tp_is_empty!32271 (not b!1260390) (not b_next!27369))
(check-sat b_and!45265 (not b_next!27369))
