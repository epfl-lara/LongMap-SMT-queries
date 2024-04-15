; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105178 () Bool)

(assert start!105178)

(declare-fun b_free!26899 () Bool)

(declare-fun b_next!26899 () Bool)

(assert (=> start!105178 (= b_free!26899 (not b_next!26899))))

(declare-fun tp!94201 () Bool)

(declare-fun b_and!44695 () Bool)

(assert (=> start!105178 (= tp!94201 b_and!44695)))

(declare-fun res!835770 () Bool)

(declare-fun e!712014 () Bool)

(assert (=> start!105178 (=> (not res!835770) (not e!712014))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105178 (= res!835770 (validMask!0 mask!1466))))

(assert (=> start!105178 e!712014))

(assert (=> start!105178 true))

(assert (=> start!105178 tp!94201))

(declare-fun tp_is_empty!31801 () Bool)

(assert (=> start!105178 tp_is_empty!31801))

(declare-datatypes ((array!81187 0))(
  ( (array!81188 (arr!39156 (Array (_ BitVec 32) (_ BitVec 64))) (size!39694 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81187)

(declare-fun array_inv!29979 (array!81187) Bool)

(assert (=> start!105178 (array_inv!29979 _keys!1118)))

(declare-datatypes ((V!47767 0))(
  ( (V!47768 (val!15963 Int)) )
))
(declare-datatypes ((ValueCell!15137 0))(
  ( (ValueCellFull!15137 (v!18660 V!47767)) (EmptyCell!15137) )
))
(declare-datatypes ((array!81189 0))(
  ( (array!81190 (arr!39157 (Array (_ BitVec 32) ValueCell!15137)) (size!39695 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81189)

(declare-fun e!712011 () Bool)

(declare-fun array_inv!29980 (array!81189) Bool)

(assert (=> start!105178 (and (array_inv!29980 _values!914) e!712011)))

(declare-fun mapIsEmpty!49477 () Bool)

(declare-fun mapRes!49477 () Bool)

(assert (=> mapIsEmpty!49477 mapRes!49477))

(declare-fun b!1253331 () Bool)

(declare-fun e!712010 () Bool)

(assert (=> b!1253331 (= e!712010 tp_is_empty!31801)))

(declare-fun b!1253332 () Bool)

(declare-fun e!712012 () Bool)

(assert (=> b!1253332 (= e!712012 true)))

(declare-datatypes ((tuple2!20688 0))(
  ( (tuple2!20689 (_1!10355 (_ BitVec 64)) (_2!10355 V!47767)) )
))
(declare-datatypes ((List!27901 0))(
  ( (Nil!27898) (Cons!27897 (h!29106 tuple2!20688) (t!41373 List!27901)) )
))
(declare-datatypes ((ListLongMap!18561 0))(
  ( (ListLongMap!18562 (toList!9296 List!27901)) )
))
(declare-fun lt!565766 () ListLongMap!18561)

(declare-fun lt!565770 () ListLongMap!18561)

(declare-fun -!1992 (ListLongMap!18561 (_ BitVec 64)) ListLongMap!18561)

(assert (=> b!1253332 (= lt!565766 (-!1992 lt!565770 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565771 () ListLongMap!18561)

(declare-fun lt!565764 () ListLongMap!18561)

(assert (=> b!1253332 (= (-!1992 lt!565771 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565764)))

(declare-datatypes ((Unit!41555 0))(
  ( (Unit!41556) )
))
(declare-fun lt!565769 () Unit!41555)

(declare-fun minValueBefore!43 () V!47767)

(declare-fun addThenRemoveForNewKeyIsSame!281 (ListLongMap!18561 (_ BitVec 64) V!47767) Unit!41555)

(assert (=> b!1253332 (= lt!565769 (addThenRemoveForNewKeyIsSame!281 lt!565764 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565765 () ListLongMap!18561)

(declare-fun lt!565767 () ListLongMap!18561)

(assert (=> b!1253332 (and (= lt!565770 lt!565771) (= lt!565765 lt!565767))))

(declare-fun +!4195 (ListLongMap!18561 tuple2!20688) ListLongMap!18561)

(assert (=> b!1253332 (= lt!565771 (+!4195 lt!565764 (tuple2!20689 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47767)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47767)

(declare-fun getCurrentListMap!4431 (array!81187 array!81189 (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 (_ BitVec 32) Int) ListLongMap!18561)

(assert (=> b!1253332 (= lt!565765 (getCurrentListMap!4431 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253332 (= lt!565770 (getCurrentListMap!4431 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253333 () Bool)

(declare-fun res!835771 () Bool)

(assert (=> b!1253333 (=> (not res!835771) (not e!712014))))

(assert (=> b!1253333 (= res!835771 (and (= (size!39695 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39694 _keys!1118) (size!39695 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49477 () Bool)

(declare-fun tp!94202 () Bool)

(declare-fun e!712009 () Bool)

(assert (=> mapNonEmpty!49477 (= mapRes!49477 (and tp!94202 e!712009))))

(declare-fun mapKey!49477 () (_ BitVec 32))

(declare-fun mapRest!49477 () (Array (_ BitVec 32) ValueCell!15137))

(declare-fun mapValue!49477 () ValueCell!15137)

(assert (=> mapNonEmpty!49477 (= (arr!39157 _values!914) (store mapRest!49477 mapKey!49477 mapValue!49477))))

(declare-fun b!1253334 () Bool)

(assert (=> b!1253334 (= e!712011 (and e!712010 mapRes!49477))))

(declare-fun condMapEmpty!49477 () Bool)

(declare-fun mapDefault!49477 () ValueCell!15137)

(assert (=> b!1253334 (= condMapEmpty!49477 (= (arr!39157 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15137)) mapDefault!49477)))))

(declare-fun b!1253335 () Bool)

(declare-fun res!835774 () Bool)

(assert (=> b!1253335 (=> (not res!835774) (not e!712014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81187 (_ BitVec 32)) Bool)

(assert (=> b!1253335 (= res!835774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253336 () Bool)

(assert (=> b!1253336 (= e!712009 tp_is_empty!31801)))

(declare-fun b!1253337 () Bool)

(declare-fun res!835772 () Bool)

(assert (=> b!1253337 (=> (not res!835772) (not e!712014))))

(declare-datatypes ((List!27902 0))(
  ( (Nil!27899) (Cons!27898 (h!29107 (_ BitVec 64)) (t!41374 List!27902)) )
))
(declare-fun arrayNoDuplicates!0 (array!81187 (_ BitVec 32) List!27902) Bool)

(assert (=> b!1253337 (= res!835772 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27899))))

(declare-fun b!1253338 () Bool)

(assert (=> b!1253338 (= e!712014 (not e!712012))))

(declare-fun res!835773 () Bool)

(assert (=> b!1253338 (=> res!835773 e!712012)))

(assert (=> b!1253338 (= res!835773 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253338 (= lt!565764 lt!565767)))

(declare-fun lt!565768 () Unit!41555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1019 (array!81187 array!81189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 V!47767 V!47767 (_ BitVec 32) Int) Unit!41555)

(assert (=> b!1253338 (= lt!565768 (lemmaNoChangeToArrayThenSameMapNoExtras!1019 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5697 (array!81187 array!81189 (_ BitVec 32) (_ BitVec 32) V!47767 V!47767 (_ BitVec 32) Int) ListLongMap!18561)

(assert (=> b!1253338 (= lt!565767 (getCurrentListMapNoExtraKeys!5697 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253338 (= lt!565764 (getCurrentListMapNoExtraKeys!5697 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105178 res!835770) b!1253333))

(assert (= (and b!1253333 res!835771) b!1253335))

(assert (= (and b!1253335 res!835774) b!1253337))

(assert (= (and b!1253337 res!835772) b!1253338))

(assert (= (and b!1253338 (not res!835773)) b!1253332))

(assert (= (and b!1253334 condMapEmpty!49477) mapIsEmpty!49477))

(assert (= (and b!1253334 (not condMapEmpty!49477)) mapNonEmpty!49477))

(get-info :version)

(assert (= (and mapNonEmpty!49477 ((_ is ValueCellFull!15137) mapValue!49477)) b!1253336))

(assert (= (and b!1253334 ((_ is ValueCellFull!15137) mapDefault!49477)) b!1253331))

(assert (= start!105178 b!1253334))

(declare-fun m!1153415 () Bool)

(assert (=> b!1253335 m!1153415))

(declare-fun m!1153417 () Bool)

(assert (=> b!1253338 m!1153417))

(declare-fun m!1153419 () Bool)

(assert (=> b!1253338 m!1153419))

(declare-fun m!1153421 () Bool)

(assert (=> b!1253338 m!1153421))

(declare-fun m!1153423 () Bool)

(assert (=> start!105178 m!1153423))

(declare-fun m!1153425 () Bool)

(assert (=> start!105178 m!1153425))

(declare-fun m!1153427 () Bool)

(assert (=> start!105178 m!1153427))

(declare-fun m!1153429 () Bool)

(assert (=> b!1253332 m!1153429))

(declare-fun m!1153431 () Bool)

(assert (=> b!1253332 m!1153431))

(declare-fun m!1153433 () Bool)

(assert (=> b!1253332 m!1153433))

(declare-fun m!1153435 () Bool)

(assert (=> b!1253332 m!1153435))

(declare-fun m!1153437 () Bool)

(assert (=> b!1253332 m!1153437))

(declare-fun m!1153439 () Bool)

(assert (=> b!1253332 m!1153439))

(declare-fun m!1153441 () Bool)

(assert (=> mapNonEmpty!49477 m!1153441))

(declare-fun m!1153443 () Bool)

(assert (=> b!1253337 m!1153443))

(check-sat (not b_next!26899) (not start!105178) tp_is_empty!31801 (not b!1253335) (not b!1253332) b_and!44695 (not mapNonEmpty!49477) (not b!1253337) (not b!1253338))
(check-sat b_and!44695 (not b_next!26899))
