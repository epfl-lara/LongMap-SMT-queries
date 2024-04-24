; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105928 () Bool)

(assert start!105928)

(declare-fun b_free!27289 () Bool)

(declare-fun b_next!27289 () Bool)

(assert (=> start!105928 (= b_free!27289 (not b_next!27289))))

(declare-fun tp!95393 () Bool)

(declare-fun b_and!45175 () Bool)

(assert (=> start!105928 (= tp!95393 b_and!45175)))

(declare-fun mapIsEmpty!50083 () Bool)

(declare-fun mapRes!50083 () Bool)

(assert (=> mapIsEmpty!50083 mapRes!50083))

(declare-fun b!1260427 () Bool)

(declare-fun e!717082 () Bool)

(declare-fun e!717083 () Bool)

(assert (=> b!1260427 (= e!717082 (not e!717083))))

(declare-fun res!839694 () Bool)

(assert (=> b!1260427 (=> res!839694 e!717083)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260427 (= res!839694 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48287 0))(
  ( (V!48288 (val!16158 Int)) )
))
(declare-datatypes ((tuple2!20906 0))(
  ( (tuple2!20907 (_1!10464 (_ BitVec 64)) (_2!10464 V!48287)) )
))
(declare-datatypes ((List!28133 0))(
  ( (Nil!28130) (Cons!28129 (h!29347 tuple2!20906) (t!41620 List!28133)) )
))
(declare-datatypes ((ListLongMap!18787 0))(
  ( (ListLongMap!18788 (toList!9409 List!28133)) )
))
(declare-fun lt!570205 () ListLongMap!18787)

(declare-fun lt!570201 () ListLongMap!18787)

(assert (=> b!1260427 (= lt!570205 lt!570201)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48287)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48287)

(declare-datatypes ((ValueCell!15332 0))(
  ( (ValueCellFull!15332 (v!18856 V!48287)) (EmptyCell!15332) )
))
(declare-datatypes ((array!82055 0))(
  ( (array!82056 (arr!39578 (Array (_ BitVec 32) ValueCell!15332)) (size!40115 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82055)

(declare-fun minValueBefore!43 () V!48287)

(declare-datatypes ((array!82057 0))(
  ( (array!82058 (arr!39579 (Array (_ BitVec 32) (_ BitVec 64))) (size!40116 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82057)

(declare-datatypes ((Unit!41958 0))(
  ( (Unit!41959) )
))
(declare-fun lt!570207 () Unit!41958)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1136 (array!82057 array!82055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 V!48287 V!48287 (_ BitVec 32) Int) Unit!41958)

(assert (=> b!1260427 (= lt!570207 (lemmaNoChangeToArrayThenSameMapNoExtras!1136 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5822 (array!82057 array!82055 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18787)

(assert (=> b!1260427 (= lt!570201 (getCurrentListMapNoExtraKeys!5822 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260427 (= lt!570205 (getCurrentListMapNoExtraKeys!5822 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839693 () Bool)

(assert (=> start!105928 (=> (not res!839693) (not e!717082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105928 (= res!839693 (validMask!0 mask!1466))))

(assert (=> start!105928 e!717082))

(assert (=> start!105928 true))

(assert (=> start!105928 tp!95393))

(declare-fun tp_is_empty!32191 () Bool)

(assert (=> start!105928 tp_is_empty!32191))

(declare-fun array_inv!30281 (array!82057) Bool)

(assert (=> start!105928 (array_inv!30281 _keys!1118)))

(declare-fun e!717086 () Bool)

(declare-fun array_inv!30282 (array!82055) Bool)

(assert (=> start!105928 (and (array_inv!30282 _values!914) e!717086)))

(declare-fun b!1260428 () Bool)

(declare-fun e!717084 () Bool)

(assert (=> b!1260428 (= e!717086 (and e!717084 mapRes!50083))))

(declare-fun condMapEmpty!50083 () Bool)

(declare-fun mapDefault!50083 () ValueCell!15332)

(assert (=> b!1260428 (= condMapEmpty!50083 (= (arr!39578 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15332)) mapDefault!50083)))))

(declare-fun b!1260429 () Bool)

(declare-fun res!839691 () Bool)

(assert (=> b!1260429 (=> (not res!839691) (not e!717082))))

(declare-datatypes ((List!28134 0))(
  ( (Nil!28131) (Cons!28130 (h!29348 (_ BitVec 64)) (t!41621 List!28134)) )
))
(declare-fun arrayNoDuplicates!0 (array!82057 (_ BitVec 32) List!28134) Bool)

(assert (=> b!1260429 (= res!839691 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28131))))

(declare-fun b!1260430 () Bool)

(assert (=> b!1260430 (= e!717083 true)))

(declare-fun lt!570206 () ListLongMap!18787)

(declare-fun lt!570203 () ListLongMap!18787)

(declare-fun -!2081 (ListLongMap!18787 (_ BitVec 64)) ListLongMap!18787)

(assert (=> b!1260430 (= lt!570206 (-!2081 lt!570203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570209 () ListLongMap!18787)

(declare-fun lt!570202 () ListLongMap!18787)

(assert (=> b!1260430 (= (-!2081 lt!570209 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570202)))

(declare-fun lt!570210 () Unit!41958)

(declare-fun addThenRemoveForNewKeyIsSame!335 (ListLongMap!18787 (_ BitVec 64) V!48287) Unit!41958)

(assert (=> b!1260430 (= lt!570210 (addThenRemoveForNewKeyIsSame!335 lt!570202 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717088 () Bool)

(assert (=> b!1260430 e!717088))

(declare-fun res!839692 () Bool)

(assert (=> b!1260430 (=> (not res!839692) (not e!717088))))

(assert (=> b!1260430 (= res!839692 (= lt!570203 lt!570209))))

(declare-fun +!4249 (ListLongMap!18787 tuple2!20906) ListLongMap!18787)

(assert (=> b!1260430 (= lt!570209 (+!4249 lt!570202 (tuple2!20907 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570208 () tuple2!20906)

(assert (=> b!1260430 (= lt!570202 (+!4249 lt!570205 lt!570208))))

(assert (=> b!1260430 (= lt!570208 (tuple2!20907 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570204 () ListLongMap!18787)

(declare-fun getCurrentListMap!4593 (array!82057 array!82055 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18787)

(assert (=> b!1260430 (= lt!570204 (getCurrentListMap!4593 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260430 (= lt!570203 (getCurrentListMap!4593 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50083 () Bool)

(declare-fun tp!95392 () Bool)

(declare-fun e!717087 () Bool)

(assert (=> mapNonEmpty!50083 (= mapRes!50083 (and tp!95392 e!717087))))

(declare-fun mapValue!50083 () ValueCell!15332)

(declare-fun mapKey!50083 () (_ BitVec 32))

(declare-fun mapRest!50083 () (Array (_ BitVec 32) ValueCell!15332))

(assert (=> mapNonEmpty!50083 (= (arr!39578 _values!914) (store mapRest!50083 mapKey!50083 mapValue!50083))))

(declare-fun b!1260431 () Bool)

(assert (=> b!1260431 (= e!717088 (= lt!570204 (+!4249 lt!570201 lt!570208)))))

(declare-fun b!1260432 () Bool)

(assert (=> b!1260432 (= e!717087 tp_is_empty!32191)))

(declare-fun b!1260433 () Bool)

(assert (=> b!1260433 (= e!717084 tp_is_empty!32191)))

(declare-fun b!1260434 () Bool)

(declare-fun res!839690 () Bool)

(assert (=> b!1260434 (=> (not res!839690) (not e!717082))))

(assert (=> b!1260434 (= res!839690 (and (= (size!40115 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40116 _keys!1118) (size!40115 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260435 () Bool)

(declare-fun res!839695 () Bool)

(assert (=> b!1260435 (=> (not res!839695) (not e!717082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82057 (_ BitVec 32)) Bool)

(assert (=> b!1260435 (= res!839695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105928 res!839693) b!1260434))

(assert (= (and b!1260434 res!839690) b!1260435))

(assert (= (and b!1260435 res!839695) b!1260429))

(assert (= (and b!1260429 res!839691) b!1260427))

(assert (= (and b!1260427 (not res!839694)) b!1260430))

(assert (= (and b!1260430 res!839692) b!1260431))

(assert (= (and b!1260428 condMapEmpty!50083) mapIsEmpty!50083))

(assert (= (and b!1260428 (not condMapEmpty!50083)) mapNonEmpty!50083))

(get-info :version)

(assert (= (and mapNonEmpty!50083 ((_ is ValueCellFull!15332) mapValue!50083)) b!1260432))

(assert (= (and b!1260428 ((_ is ValueCellFull!15332) mapDefault!50083)) b!1260433))

(assert (= start!105928 b!1260428))

(declare-fun m!1161127 () Bool)

(assert (=> b!1260427 m!1161127))

(declare-fun m!1161129 () Bool)

(assert (=> b!1260427 m!1161129))

(declare-fun m!1161131 () Bool)

(assert (=> b!1260427 m!1161131))

(declare-fun m!1161133 () Bool)

(assert (=> b!1260429 m!1161133))

(declare-fun m!1161135 () Bool)

(assert (=> b!1260435 m!1161135))

(declare-fun m!1161137 () Bool)

(assert (=> start!105928 m!1161137))

(declare-fun m!1161139 () Bool)

(assert (=> start!105928 m!1161139))

(declare-fun m!1161141 () Bool)

(assert (=> start!105928 m!1161141))

(declare-fun m!1161143 () Bool)

(assert (=> b!1260431 m!1161143))

(declare-fun m!1161145 () Bool)

(assert (=> b!1260430 m!1161145))

(declare-fun m!1161147 () Bool)

(assert (=> b!1260430 m!1161147))

(declare-fun m!1161149 () Bool)

(assert (=> b!1260430 m!1161149))

(declare-fun m!1161151 () Bool)

(assert (=> b!1260430 m!1161151))

(declare-fun m!1161153 () Bool)

(assert (=> b!1260430 m!1161153))

(declare-fun m!1161155 () Bool)

(assert (=> b!1260430 m!1161155))

(declare-fun m!1161157 () Bool)

(assert (=> b!1260430 m!1161157))

(declare-fun m!1161159 () Bool)

(assert (=> mapNonEmpty!50083 m!1161159))

(check-sat b_and!45175 (not b!1260435) (not b!1260431) (not b!1260429) (not mapNonEmpty!50083) tp_is_empty!32191 (not b!1260430) (not start!105928) (not b!1260427) (not b_next!27289))
(check-sat b_and!45175 (not b_next!27289))
