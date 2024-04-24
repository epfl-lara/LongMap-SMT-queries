; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105922 () Bool)

(assert start!105922)

(declare-fun b_free!27283 () Bool)

(declare-fun b_next!27283 () Bool)

(assert (=> start!105922 (= b_free!27283 (not b_next!27283))))

(declare-fun tp!95374 () Bool)

(declare-fun b_and!45169 () Bool)

(assert (=> start!105922 (= tp!95374 b_and!45169)))

(declare-fun b!1260346 () Bool)

(declare-fun res!839641 () Bool)

(declare-fun e!717024 () Bool)

(assert (=> b!1260346 (=> (not res!839641) (not e!717024))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82045 0))(
  ( (array!82046 (arr!39573 (Array (_ BitVec 32) (_ BitVec 64))) (size!40110 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82045)

(declare-datatypes ((V!48279 0))(
  ( (V!48280 (val!16155 Int)) )
))
(declare-datatypes ((ValueCell!15329 0))(
  ( (ValueCellFull!15329 (v!18853 V!48279)) (EmptyCell!15329) )
))
(declare-datatypes ((array!82047 0))(
  ( (array!82048 (arr!39574 (Array (_ BitVec 32) ValueCell!15329)) (size!40111 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82047)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260346 (= res!839641 (and (= (size!40111 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40110 _keys!1118) (size!40111 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260347 () Bool)

(declare-fun res!839636 () Bool)

(assert (=> b!1260347 (=> (not res!839636) (not e!717024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82045 (_ BitVec 32)) Bool)

(assert (=> b!1260347 (= res!839636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260348 () Bool)

(declare-fun e!717020 () Bool)

(declare-fun e!717022 () Bool)

(declare-fun mapRes!50074 () Bool)

(assert (=> b!1260348 (= e!717020 (and e!717022 mapRes!50074))))

(declare-fun condMapEmpty!50074 () Bool)

(declare-fun mapDefault!50074 () ValueCell!15329)

(assert (=> b!1260348 (= condMapEmpty!50074 (= (arr!39574 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15329)) mapDefault!50074)))))

(declare-fun b!1260349 () Bool)

(declare-fun e!717023 () Bool)

(declare-fun tp_is_empty!32185 () Bool)

(assert (=> b!1260349 (= e!717023 tp_is_empty!32185)))

(declare-fun b!1260350 () Bool)

(declare-fun res!839639 () Bool)

(assert (=> b!1260350 (=> (not res!839639) (not e!717024))))

(declare-datatypes ((List!28130 0))(
  ( (Nil!28127) (Cons!28126 (h!29344 (_ BitVec 64)) (t!41617 List!28130)) )
))
(declare-fun arrayNoDuplicates!0 (array!82045 (_ BitVec 32) List!28130) Bool)

(assert (=> b!1260350 (= res!839639 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28127))))

(declare-fun mapIsEmpty!50074 () Bool)

(assert (=> mapIsEmpty!50074 mapRes!50074))

(declare-fun mapNonEmpty!50074 () Bool)

(declare-fun tp!95375 () Bool)

(assert (=> mapNonEmpty!50074 (= mapRes!50074 (and tp!95375 e!717023))))

(declare-fun mapKey!50074 () (_ BitVec 32))

(declare-fun mapRest!50074 () (Array (_ BitVec 32) ValueCell!15329))

(declare-fun mapValue!50074 () ValueCell!15329)

(assert (=> mapNonEmpty!50074 (= (arr!39574 _values!914) (store mapRest!50074 mapKey!50074 mapValue!50074))))

(declare-fun b!1260351 () Bool)

(declare-fun e!717019 () Bool)

(assert (=> b!1260351 (= e!717019 true)))

(declare-datatypes ((tuple2!20902 0))(
  ( (tuple2!20903 (_1!10462 (_ BitVec 64)) (_2!10462 V!48279)) )
))
(declare-datatypes ((List!28131 0))(
  ( (Nil!28128) (Cons!28127 (h!29345 tuple2!20902) (t!41618 List!28131)) )
))
(declare-datatypes ((ListLongMap!18783 0))(
  ( (ListLongMap!18784 (toList!9407 List!28131)) )
))
(declare-fun lt!570115 () ListLongMap!18783)

(declare-fun lt!570111 () ListLongMap!18783)

(declare-fun -!2080 (ListLongMap!18783 (_ BitVec 64)) ListLongMap!18783)

(assert (=> b!1260351 (= lt!570115 (-!2080 lt!570111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570114 () ListLongMap!18783)

(declare-fun lt!570112 () ListLongMap!18783)

(assert (=> b!1260351 (= (-!2080 lt!570114 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570112)))

(declare-datatypes ((Unit!41954 0))(
  ( (Unit!41955) )
))
(declare-fun lt!570117 () Unit!41954)

(declare-fun minValueBefore!43 () V!48279)

(declare-fun addThenRemoveForNewKeyIsSame!334 (ListLongMap!18783 (_ BitVec 64) V!48279) Unit!41954)

(assert (=> b!1260351 (= lt!570117 (addThenRemoveForNewKeyIsSame!334 lt!570112 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717025 () Bool)

(assert (=> b!1260351 e!717025))

(declare-fun res!839637 () Bool)

(assert (=> b!1260351 (=> (not res!839637) (not e!717025))))

(assert (=> b!1260351 (= res!839637 (= lt!570111 lt!570114))))

(declare-fun +!4248 (ListLongMap!18783 tuple2!20902) ListLongMap!18783)

(assert (=> b!1260351 (= lt!570114 (+!4248 lt!570112 (tuple2!20903 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570116 () ListLongMap!18783)

(declare-fun lt!570119 () tuple2!20902)

(assert (=> b!1260351 (= lt!570112 (+!4248 lt!570116 lt!570119))))

(declare-fun zeroValue!871 () V!48279)

(assert (=> b!1260351 (= lt!570119 (tuple2!20903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!570113 () ListLongMap!18783)

(declare-fun minValueAfter!43 () V!48279)

(declare-fun getCurrentListMap!4592 (array!82045 array!82047 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18783)

(assert (=> b!1260351 (= lt!570113 (getCurrentListMap!4592 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260351 (= lt!570111 (getCurrentListMap!4592 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260352 () Bool)

(declare-fun lt!570120 () ListLongMap!18783)

(assert (=> b!1260352 (= e!717025 (= lt!570113 (+!4248 lt!570120 lt!570119)))))

(declare-fun res!839638 () Bool)

(assert (=> start!105922 (=> (not res!839638) (not e!717024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105922 (= res!839638 (validMask!0 mask!1466))))

(assert (=> start!105922 e!717024))

(assert (=> start!105922 true))

(assert (=> start!105922 tp!95374))

(assert (=> start!105922 tp_is_empty!32185))

(declare-fun array_inv!30279 (array!82045) Bool)

(assert (=> start!105922 (array_inv!30279 _keys!1118)))

(declare-fun array_inv!30280 (array!82047) Bool)

(assert (=> start!105922 (and (array_inv!30280 _values!914) e!717020)))

(declare-fun b!1260353 () Bool)

(assert (=> b!1260353 (= e!717024 (not e!717019))))

(declare-fun res!839640 () Bool)

(assert (=> b!1260353 (=> res!839640 e!717019)))

(assert (=> b!1260353 (= res!839640 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260353 (= lt!570116 lt!570120)))

(declare-fun lt!570118 () Unit!41954)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1134 (array!82045 array!82047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 V!48279 V!48279 (_ BitVec 32) Int) Unit!41954)

(assert (=> b!1260353 (= lt!570118 (lemmaNoChangeToArrayThenSameMapNoExtras!1134 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5820 (array!82045 array!82047 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18783)

(assert (=> b!1260353 (= lt!570120 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260353 (= lt!570116 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260354 () Bool)

(assert (=> b!1260354 (= e!717022 tp_is_empty!32185)))

(assert (= (and start!105922 res!839638) b!1260346))

(assert (= (and b!1260346 res!839641) b!1260347))

(assert (= (and b!1260347 res!839636) b!1260350))

(assert (= (and b!1260350 res!839639) b!1260353))

(assert (= (and b!1260353 (not res!839640)) b!1260351))

(assert (= (and b!1260351 res!839637) b!1260352))

(assert (= (and b!1260348 condMapEmpty!50074) mapIsEmpty!50074))

(assert (= (and b!1260348 (not condMapEmpty!50074)) mapNonEmpty!50074))

(get-info :version)

(assert (= (and mapNonEmpty!50074 ((_ is ValueCellFull!15329) mapValue!50074)) b!1260349))

(assert (= (and b!1260348 ((_ is ValueCellFull!15329) mapDefault!50074)) b!1260354))

(assert (= start!105922 b!1260348))

(declare-fun m!1161025 () Bool)

(assert (=> b!1260353 m!1161025))

(declare-fun m!1161027 () Bool)

(assert (=> b!1260353 m!1161027))

(declare-fun m!1161029 () Bool)

(assert (=> b!1260353 m!1161029))

(declare-fun m!1161031 () Bool)

(assert (=> b!1260347 m!1161031))

(declare-fun m!1161033 () Bool)

(assert (=> mapNonEmpty!50074 m!1161033))

(declare-fun m!1161035 () Bool)

(assert (=> b!1260352 m!1161035))

(declare-fun m!1161037 () Bool)

(assert (=> b!1260351 m!1161037))

(declare-fun m!1161039 () Bool)

(assert (=> b!1260351 m!1161039))

(declare-fun m!1161041 () Bool)

(assert (=> b!1260351 m!1161041))

(declare-fun m!1161043 () Bool)

(assert (=> b!1260351 m!1161043))

(declare-fun m!1161045 () Bool)

(assert (=> b!1260351 m!1161045))

(declare-fun m!1161047 () Bool)

(assert (=> b!1260351 m!1161047))

(declare-fun m!1161049 () Bool)

(assert (=> b!1260351 m!1161049))

(declare-fun m!1161051 () Bool)

(assert (=> start!105922 m!1161051))

(declare-fun m!1161053 () Bool)

(assert (=> start!105922 m!1161053))

(declare-fun m!1161055 () Bool)

(assert (=> start!105922 m!1161055))

(declare-fun m!1161057 () Bool)

(assert (=> b!1260350 m!1161057))

(check-sat (not mapNonEmpty!50074) (not b!1260350) (not b!1260352) (not b!1260351) (not start!105922) (not b!1260347) (not b!1260353) tp_is_empty!32185 (not b_next!27283) b_and!45169)
(check-sat b_and!45169 (not b_next!27283))
