; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105724 () Bool)

(assert start!105724)

(declare-fun b_free!27309 () Bool)

(declare-fun b_next!27309 () Bool)

(assert (=> start!105724 (= b_free!27309 (not b_next!27309))))

(declare-fun tp!95452 () Bool)

(declare-fun b_and!45193 () Bool)

(assert (=> start!105724 (= tp!95452 b_and!45193)))

(declare-fun b!1259392 () Bool)

(declare-fun res!839353 () Bool)

(declare-fun e!716445 () Bool)

(assert (=> b!1259392 (=> (not res!839353) (not e!716445))))

(declare-datatypes ((array!82040 0))(
  ( (array!82041 (arr!39575 (Array (_ BitVec 32) (_ BitVec 64))) (size!40111 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82040)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82040 (_ BitVec 32)) Bool)

(assert (=> b!1259392 (= res!839353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259393 () Bool)

(declare-fun e!716450 () Bool)

(declare-fun tp_is_empty!32211 () Bool)

(assert (=> b!1259393 (= e!716450 tp_is_empty!32211)))

(declare-fun b!1259394 () Bool)

(declare-fun res!839351 () Bool)

(assert (=> b!1259394 (=> (not res!839351) (not e!716445))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48313 0))(
  ( (V!48314 (val!16168 Int)) )
))
(declare-datatypes ((ValueCell!15342 0))(
  ( (ValueCellFull!15342 (v!18870 V!48313)) (EmptyCell!15342) )
))
(declare-datatypes ((array!82042 0))(
  ( (array!82043 (arr!39576 (Array (_ BitVec 32) ValueCell!15342)) (size!40112 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82042)

(assert (=> b!1259394 (= res!839351 (and (= (size!40112 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40111 _keys!1118) (size!40112 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20898 0))(
  ( (tuple2!20899 (_1!10460 (_ BitVec 64)) (_2!10460 V!48313)) )
))
(declare-datatypes ((List!28106 0))(
  ( (Nil!28103) (Cons!28102 (h!29311 tuple2!20898) (t!41601 List!28106)) )
))
(declare-datatypes ((ListLongMap!18771 0))(
  ( (ListLongMap!18772 (toList!9401 List!28106)) )
))
(declare-fun lt!570023 () ListLongMap!18771)

(declare-fun lt!570021 () tuple2!20898)

(declare-fun b!1259395 () Bool)

(declare-fun lt!570020 () ListLongMap!18771)

(declare-fun e!716447 () Bool)

(declare-fun +!4206 (ListLongMap!18771 tuple2!20898) ListLongMap!18771)

(assert (=> b!1259395 (= e!716447 (= lt!570020 (+!4206 lt!570023 lt!570021)))))

(declare-fun b!1259396 () Bool)

(declare-fun e!716449 () Bool)

(assert (=> b!1259396 (= e!716449 true)))

(declare-fun lt!570019 () ListLongMap!18771)

(declare-fun lt!570024 () ListLongMap!18771)

(declare-fun -!2108 (ListLongMap!18771 (_ BitVec 64)) ListLongMap!18771)

(assert (=> b!1259396 (= lt!570019 (-!2108 lt!570024 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570017 () ListLongMap!18771)

(declare-fun lt!570018 () ListLongMap!18771)

(assert (=> b!1259396 (= (-!2108 lt!570017 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570018)))

(declare-datatypes ((Unit!41985 0))(
  ( (Unit!41986) )
))
(declare-fun lt!570022 () Unit!41985)

(declare-fun minValueBefore!43 () V!48313)

(declare-fun addThenRemoveForNewKeyIsSame!345 (ListLongMap!18771 (_ BitVec 64) V!48313) Unit!41985)

(assert (=> b!1259396 (= lt!570022 (addThenRemoveForNewKeyIsSame!345 lt!570018 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259396 e!716447))

(declare-fun res!839355 () Bool)

(assert (=> b!1259396 (=> (not res!839355) (not e!716447))))

(assert (=> b!1259396 (= res!839355 (= lt!570024 lt!570017))))

(assert (=> b!1259396 (= lt!570017 (+!4206 lt!570018 (tuple2!20899 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570026 () ListLongMap!18771)

(assert (=> b!1259396 (= lt!570018 (+!4206 lt!570026 lt!570021))))

(declare-fun zeroValue!871 () V!48313)

(assert (=> b!1259396 (= lt!570021 (tuple2!20899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48313)

(declare-fun getCurrentListMap!4599 (array!82040 array!82042 (_ BitVec 32) (_ BitVec 32) V!48313 V!48313 (_ BitVec 32) Int) ListLongMap!18771)

(assert (=> b!1259396 (= lt!570020 (getCurrentListMap!4599 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259396 (= lt!570024 (getCurrentListMap!4599 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839350 () Bool)

(assert (=> start!105724 (=> (not res!839350) (not e!716445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105724 (= res!839350 (validMask!0 mask!1466))))

(assert (=> start!105724 e!716445))

(assert (=> start!105724 true))

(assert (=> start!105724 tp!95452))

(assert (=> start!105724 tp_is_empty!32211))

(declare-fun array_inv!30131 (array!82040) Bool)

(assert (=> start!105724 (array_inv!30131 _keys!1118)))

(declare-fun e!716446 () Bool)

(declare-fun array_inv!30132 (array!82042) Bool)

(assert (=> start!105724 (and (array_inv!30132 _values!914) e!716446)))

(declare-fun mapIsEmpty!50113 () Bool)

(declare-fun mapRes!50113 () Bool)

(assert (=> mapIsEmpty!50113 mapRes!50113))

(declare-fun b!1259397 () Bool)

(declare-fun res!839354 () Bool)

(assert (=> b!1259397 (=> (not res!839354) (not e!716445))))

(declare-datatypes ((List!28107 0))(
  ( (Nil!28104) (Cons!28103 (h!29312 (_ BitVec 64)) (t!41602 List!28107)) )
))
(declare-fun arrayNoDuplicates!0 (array!82040 (_ BitVec 32) List!28107) Bool)

(assert (=> b!1259397 (= res!839354 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28104))))

(declare-fun mapNonEmpty!50113 () Bool)

(declare-fun tp!95453 () Bool)

(assert (=> mapNonEmpty!50113 (= mapRes!50113 (and tp!95453 e!716450))))

(declare-fun mapKey!50113 () (_ BitVec 32))

(declare-fun mapRest!50113 () (Array (_ BitVec 32) ValueCell!15342))

(declare-fun mapValue!50113 () ValueCell!15342)

(assert (=> mapNonEmpty!50113 (= (arr!39576 _values!914) (store mapRest!50113 mapKey!50113 mapValue!50113))))

(declare-fun b!1259398 () Bool)

(assert (=> b!1259398 (= e!716445 (not e!716449))))

(declare-fun res!839352 () Bool)

(assert (=> b!1259398 (=> res!839352 e!716449)))

(assert (=> b!1259398 (= res!839352 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259398 (= lt!570026 lt!570023)))

(declare-fun lt!570025 () Unit!41985)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1141 (array!82040 array!82042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48313 V!48313 V!48313 V!48313 (_ BitVec 32) Int) Unit!41985)

(assert (=> b!1259398 (= lt!570025 (lemmaNoChangeToArrayThenSameMapNoExtras!1141 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5777 (array!82040 array!82042 (_ BitVec 32) (_ BitVec 32) V!48313 V!48313 (_ BitVec 32) Int) ListLongMap!18771)

(assert (=> b!1259398 (= lt!570023 (getCurrentListMapNoExtraKeys!5777 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259398 (= lt!570026 (getCurrentListMapNoExtraKeys!5777 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259399 () Bool)

(declare-fun e!716448 () Bool)

(assert (=> b!1259399 (= e!716446 (and e!716448 mapRes!50113))))

(declare-fun condMapEmpty!50113 () Bool)

(declare-fun mapDefault!50113 () ValueCell!15342)

(assert (=> b!1259399 (= condMapEmpty!50113 (= (arr!39576 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15342)) mapDefault!50113)))))

(declare-fun b!1259400 () Bool)

(assert (=> b!1259400 (= e!716448 tp_is_empty!32211)))

(assert (= (and start!105724 res!839350) b!1259394))

(assert (= (and b!1259394 res!839351) b!1259392))

(assert (= (and b!1259392 res!839353) b!1259397))

(assert (= (and b!1259397 res!839354) b!1259398))

(assert (= (and b!1259398 (not res!839352)) b!1259396))

(assert (= (and b!1259396 res!839355) b!1259395))

(assert (= (and b!1259399 condMapEmpty!50113) mapIsEmpty!50113))

(assert (= (and b!1259399 (not condMapEmpty!50113)) mapNonEmpty!50113))

(get-info :version)

(assert (= (and mapNonEmpty!50113 ((_ is ValueCellFull!15342) mapValue!50113)) b!1259393))

(assert (= (and b!1259399 ((_ is ValueCellFull!15342) mapDefault!50113)) b!1259400))

(assert (= start!105724 b!1259399))

(declare-fun m!1159855 () Bool)

(assert (=> b!1259396 m!1159855))

(declare-fun m!1159857 () Bool)

(assert (=> b!1259396 m!1159857))

(declare-fun m!1159859 () Bool)

(assert (=> b!1259396 m!1159859))

(declare-fun m!1159861 () Bool)

(assert (=> b!1259396 m!1159861))

(declare-fun m!1159863 () Bool)

(assert (=> b!1259396 m!1159863))

(declare-fun m!1159865 () Bool)

(assert (=> b!1259396 m!1159865))

(declare-fun m!1159867 () Bool)

(assert (=> b!1259396 m!1159867))

(declare-fun m!1159869 () Bool)

(assert (=> b!1259398 m!1159869))

(declare-fun m!1159871 () Bool)

(assert (=> b!1259398 m!1159871))

(declare-fun m!1159873 () Bool)

(assert (=> b!1259398 m!1159873))

(declare-fun m!1159875 () Bool)

(assert (=> b!1259397 m!1159875))

(declare-fun m!1159877 () Bool)

(assert (=> start!105724 m!1159877))

(declare-fun m!1159879 () Bool)

(assert (=> start!105724 m!1159879))

(declare-fun m!1159881 () Bool)

(assert (=> start!105724 m!1159881))

(declare-fun m!1159883 () Bool)

(assert (=> b!1259395 m!1159883))

(declare-fun m!1159885 () Bool)

(assert (=> mapNonEmpty!50113 m!1159885))

(declare-fun m!1159887 () Bool)

(assert (=> b!1259392 m!1159887))

(check-sat tp_is_empty!32211 (not b!1259392) (not start!105724) b_and!45193 (not b!1259398) (not b!1259396) (not b!1259397) (not b_next!27309) (not mapNonEmpty!50113) (not b!1259395))
(check-sat b_and!45193 (not b_next!27309))
