; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105440 () Bool)

(assert start!105440)

(declare-fun b_free!27099 () Bool)

(declare-fun b_next!27099 () Bool)

(assert (=> start!105440 (= b_free!27099 (not b_next!27099))))

(declare-fun tp!94811 () Bool)

(declare-fun b_and!44945 () Bool)

(assert (=> start!105440 (= tp!94811 b_and!44945)))

(declare-fun b!1256253 () Bool)

(declare-fun res!837496 () Bool)

(declare-fun e!714139 () Bool)

(assert (=> b!1256253 (=> (not res!837496) (not e!714139))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81642 0))(
  ( (array!81643 (arr!39380 (Array (_ BitVec 32) (_ BitVec 64))) (size!39916 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81642)

(declare-datatypes ((V!48033 0))(
  ( (V!48034 (val!16063 Int)) )
))
(declare-datatypes ((ValueCell!15237 0))(
  ( (ValueCellFull!15237 (v!18763 V!48033)) (EmptyCell!15237) )
))
(declare-datatypes ((array!81644 0))(
  ( (array!81645 (arr!39381 (Array (_ BitVec 32) ValueCell!15237)) (size!39917 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81644)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1256253 (= res!837496 (and (= (size!39917 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39916 _keys!1118) (size!39917 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49786 () Bool)

(declare-fun mapRes!49786 () Bool)

(assert (=> mapIsEmpty!49786 mapRes!49786))

(declare-fun b!1256254 () Bool)

(declare-fun e!714134 () Bool)

(assert (=> b!1256254 (= e!714134 true)))

(declare-datatypes ((tuple2!20750 0))(
  ( (tuple2!20751 (_1!10386 (_ BitVec 64)) (_2!10386 V!48033)) )
))
(declare-datatypes ((List!27967 0))(
  ( (Nil!27964) (Cons!27963 (h!29172 tuple2!20750) (t!41454 List!27967)) )
))
(declare-datatypes ((ListLongMap!18623 0))(
  ( (ListLongMap!18624 (toList!9327 List!27967)) )
))
(declare-fun lt!568014 () ListLongMap!18623)

(declare-fun -!2078 (ListLongMap!18623 (_ BitVec 64)) ListLongMap!18623)

(assert (=> b!1256254 (= (-!2078 lt!568014 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568014)))

(declare-datatypes ((Unit!41838 0))(
  ( (Unit!41839) )
))
(declare-fun lt!568016 () Unit!41838)

(declare-fun removeNotPresentStillSame!131 (ListLongMap!18623 (_ BitVec 64)) Unit!41838)

(assert (=> b!1256254 (= lt!568016 (removeNotPresentStillSame!131 lt!568014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837497 () Bool)

(assert (=> start!105440 (=> (not res!837497) (not e!714139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105440 (= res!837497 (validMask!0 mask!1466))))

(assert (=> start!105440 e!714139))

(assert (=> start!105440 true))

(assert (=> start!105440 tp!94811))

(declare-fun tp_is_empty!32001 () Bool)

(assert (=> start!105440 tp_is_empty!32001))

(declare-fun array_inv!29999 (array!81642) Bool)

(assert (=> start!105440 (array_inv!29999 _keys!1118)))

(declare-fun e!714136 () Bool)

(declare-fun array_inv!30000 (array!81644) Bool)

(assert (=> start!105440 (and (array_inv!30000 _values!914) e!714136)))

(declare-fun b!1256255 () Bool)

(declare-fun e!714140 () Bool)

(assert (=> b!1256255 (= e!714136 (and e!714140 mapRes!49786))))

(declare-fun condMapEmpty!49786 () Bool)

(declare-fun mapDefault!49786 () ValueCell!15237)

(assert (=> b!1256255 (= condMapEmpty!49786 (= (arr!39381 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15237)) mapDefault!49786)))))

(declare-fun b!1256256 () Bool)

(declare-fun e!714135 () Bool)

(assert (=> b!1256256 (= e!714135 tp_is_empty!32001)))

(declare-fun b!1256257 () Bool)

(declare-fun res!837495 () Bool)

(assert (=> b!1256257 (=> (not res!837495) (not e!714139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81642 (_ BitVec 32)) Bool)

(assert (=> b!1256257 (= res!837495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256258 () Bool)

(declare-fun res!837492 () Bool)

(assert (=> b!1256258 (=> (not res!837492) (not e!714139))))

(declare-datatypes ((List!27968 0))(
  ( (Nil!27965) (Cons!27964 (h!29173 (_ BitVec 64)) (t!41455 List!27968)) )
))
(declare-fun arrayNoDuplicates!0 (array!81642 (_ BitVec 32) List!27968) Bool)

(assert (=> b!1256258 (= res!837492 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27965))))

(declare-fun b!1256259 () Bool)

(assert (=> b!1256259 (= e!714140 tp_is_empty!32001)))

(declare-fun b!1256260 () Bool)

(declare-fun e!714137 () Bool)

(assert (=> b!1256260 (= e!714139 (not e!714137))))

(declare-fun res!837494 () Bool)

(assert (=> b!1256260 (=> res!837494 e!714137)))

(assert (=> b!1256260 (= res!837494 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568017 () ListLongMap!18623)

(declare-fun lt!568018 () ListLongMap!18623)

(assert (=> b!1256260 (= lt!568017 lt!568018)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!568015 () Unit!41838)

(declare-fun zeroValue!871 () V!48033)

(declare-fun minValueBefore!43 () V!48033)

(declare-fun minValueAfter!43 () V!48033)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1074 (array!81642 array!81644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48033 V!48033 V!48033 V!48033 (_ BitVec 32) Int) Unit!41838)

(assert (=> b!1256260 (= lt!568015 (lemmaNoChangeToArrayThenSameMapNoExtras!1074 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5710 (array!81642 array!81644 (_ BitVec 32) (_ BitVec 32) V!48033 V!48033 (_ BitVec 32) Int) ListLongMap!18623)

(assert (=> b!1256260 (= lt!568018 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256260 (= lt!568017 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256261 () Bool)

(assert (=> b!1256261 (= e!714137 e!714134)))

(declare-fun res!837493 () Bool)

(assert (=> b!1256261 (=> res!837493 e!714134)))

(declare-fun contains!7544 (ListLongMap!18623 (_ BitVec 64)) Bool)

(assert (=> b!1256261 (= res!837493 (contains!7544 lt!568014 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4550 (array!81642 array!81644 (_ BitVec 32) (_ BitVec 32) V!48033 V!48033 (_ BitVec 32) Int) ListLongMap!18623)

(assert (=> b!1256261 (= lt!568014 (getCurrentListMap!4550 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49786 () Bool)

(declare-fun tp!94810 () Bool)

(assert (=> mapNonEmpty!49786 (= mapRes!49786 (and tp!94810 e!714135))))

(declare-fun mapValue!49786 () ValueCell!15237)

(declare-fun mapKey!49786 () (_ BitVec 32))

(declare-fun mapRest!49786 () (Array (_ BitVec 32) ValueCell!15237))

(assert (=> mapNonEmpty!49786 (= (arr!39381 _values!914) (store mapRest!49786 mapKey!49786 mapValue!49786))))

(assert (= (and start!105440 res!837497) b!1256253))

(assert (= (and b!1256253 res!837496) b!1256257))

(assert (= (and b!1256257 res!837495) b!1256258))

(assert (= (and b!1256258 res!837492) b!1256260))

(assert (= (and b!1256260 (not res!837494)) b!1256261))

(assert (= (and b!1256261 (not res!837493)) b!1256254))

(assert (= (and b!1256255 condMapEmpty!49786) mapIsEmpty!49786))

(assert (= (and b!1256255 (not condMapEmpty!49786)) mapNonEmpty!49786))

(get-info :version)

(assert (= (and mapNonEmpty!49786 ((_ is ValueCellFull!15237) mapValue!49786)) b!1256256))

(assert (= (and b!1256255 ((_ is ValueCellFull!15237) mapDefault!49786)) b!1256259))

(assert (= start!105440 b!1256255))

(declare-fun m!1156933 () Bool)

(assert (=> b!1256260 m!1156933))

(declare-fun m!1156935 () Bool)

(assert (=> b!1256260 m!1156935))

(declare-fun m!1156937 () Bool)

(assert (=> b!1256260 m!1156937))

(declare-fun m!1156939 () Bool)

(assert (=> mapNonEmpty!49786 m!1156939))

(declare-fun m!1156941 () Bool)

(assert (=> b!1256254 m!1156941))

(declare-fun m!1156943 () Bool)

(assert (=> b!1256254 m!1156943))

(declare-fun m!1156945 () Bool)

(assert (=> b!1256257 m!1156945))

(declare-fun m!1156947 () Bool)

(assert (=> b!1256261 m!1156947))

(declare-fun m!1156949 () Bool)

(assert (=> b!1256261 m!1156949))

(declare-fun m!1156951 () Bool)

(assert (=> b!1256258 m!1156951))

(declare-fun m!1156953 () Bool)

(assert (=> start!105440 m!1156953))

(declare-fun m!1156955 () Bool)

(assert (=> start!105440 m!1156955))

(declare-fun m!1156957 () Bool)

(assert (=> start!105440 m!1156957))

(check-sat (not b!1256257) (not mapNonEmpty!49786) b_and!44945 (not b!1256258) (not b!1256260) (not b!1256261) (not start!105440) tp_is_empty!32001 (not b!1256254) (not b_next!27099))
(check-sat b_and!44945 (not b_next!27099))
