; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105632 () Bool)

(assert start!105632)

(declare-fun b_free!27067 () Bool)

(declare-fun b_next!27067 () Bool)

(assert (=> start!105632 (= b_free!27067 (not b_next!27067))))

(declare-fun tp!94714 () Bool)

(declare-fun b_and!44915 () Bool)

(assert (=> start!105632 (= tp!94714 b_and!44915)))

(declare-fun b!1257126 () Bool)

(declare-fun e!714650 () Bool)

(declare-fun e!714647 () Bool)

(assert (=> b!1257126 (= e!714650 (not e!714647))))

(declare-fun res!837724 () Bool)

(assert (=> b!1257126 (=> res!837724 e!714647)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257126 (= res!837724 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47991 0))(
  ( (V!47992 (val!16047 Int)) )
))
(declare-datatypes ((tuple2!20742 0))(
  ( (tuple2!20743 (_1!10382 (_ BitVec 64)) (_2!10382 V!47991)) )
))
(declare-datatypes ((List!27975 0))(
  ( (Nil!27972) (Cons!27971 (h!29189 tuple2!20742) (t!41454 List!27975)) )
))
(declare-datatypes ((ListLongMap!18623 0))(
  ( (ListLongMap!18624 (toList!9327 List!27975)) )
))
(declare-fun lt!568262 () ListLongMap!18623)

(declare-fun lt!568260 () ListLongMap!18623)

(assert (=> b!1257126 (= lt!568262 lt!568260)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47991)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47991)

(declare-datatypes ((array!81627 0))(
  ( (array!81628 (arr!39368 (Array (_ BitVec 32) (_ BitVec 64))) (size!39905 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81627)

(declare-datatypes ((ValueCell!15221 0))(
  ( (ValueCellFull!15221 (v!18743 V!47991)) (EmptyCell!15221) )
))
(declare-datatypes ((array!81629 0))(
  ( (array!81630 (arr!39369 (Array (_ BitVec 32) ValueCell!15221)) (size!39906 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81629)

(declare-fun minValueBefore!43 () V!47991)

(declare-datatypes ((Unit!41795 0))(
  ( (Unit!41796) )
))
(declare-fun lt!568258 () Unit!41795)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1062 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 V!47991 V!47991 (_ BitVec 32) Int) Unit!41795)

(assert (=> b!1257126 (= lt!568258 (lemmaNoChangeToArrayThenSameMapNoExtras!1062 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5748 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 (_ BitVec 32) Int) ListLongMap!18623)

(assert (=> b!1257126 (= lt!568260 (getCurrentListMapNoExtraKeys!5748 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257126 (= lt!568262 (getCurrentListMapNoExtraKeys!5748 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49738 () Bool)

(declare-fun mapRes!49738 () Bool)

(declare-fun tp!94715 () Bool)

(declare-fun e!714645 () Bool)

(assert (=> mapNonEmpty!49738 (= mapRes!49738 (and tp!94715 e!714645))))

(declare-fun mapValue!49738 () ValueCell!15221)

(declare-fun mapKey!49738 () (_ BitVec 32))

(declare-fun mapRest!49738 () (Array (_ BitVec 32) ValueCell!15221))

(assert (=> mapNonEmpty!49738 (= (arr!39369 _values!914) (store mapRest!49738 mapKey!49738 mapValue!49738))))

(declare-fun b!1257127 () Bool)

(declare-fun e!714651 () Bool)

(assert (=> b!1257127 (= e!714647 e!714651)))

(declare-fun res!837725 () Bool)

(assert (=> b!1257127 (=> res!837725 e!714651)))

(declare-fun lt!568261 () ListLongMap!18623)

(declare-fun contains!7561 (ListLongMap!18623 (_ BitVec 64)) Bool)

(assert (=> b!1257127 (= res!837725 (contains!7561 lt!568261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4539 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 (_ BitVec 32) Int) ListLongMap!18623)

(assert (=> b!1257127 (= lt!568261 (getCurrentListMap!4539 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49738 () Bool)

(assert (=> mapIsEmpty!49738 mapRes!49738))

(declare-fun b!1257128 () Bool)

(declare-fun e!714648 () Bool)

(declare-fun tp_is_empty!31969 () Bool)

(assert (=> b!1257128 (= e!714648 tp_is_empty!31969)))

(declare-fun b!1257129 () Bool)

(declare-fun res!837729 () Bool)

(assert (=> b!1257129 (=> (not res!837729) (not e!714650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81627 (_ BitVec 32)) Bool)

(assert (=> b!1257129 (= res!837729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257130 () Bool)

(declare-fun res!837726 () Bool)

(assert (=> b!1257130 (=> (not res!837726) (not e!714650))))

(declare-datatypes ((List!27976 0))(
  ( (Nil!27973) (Cons!27972 (h!29190 (_ BitVec 64)) (t!41455 List!27976)) )
))
(declare-fun arrayNoDuplicates!0 (array!81627 (_ BitVec 32) List!27976) Bool)

(assert (=> b!1257130 (= res!837726 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27973))))

(declare-fun b!1257131 () Bool)

(assert (=> b!1257131 (= e!714645 tp_is_empty!31969)))

(declare-fun b!1257132 () Bool)

(declare-fun e!714646 () Bool)

(assert (=> b!1257132 (= e!714646 (and e!714648 mapRes!49738))))

(declare-fun condMapEmpty!49738 () Bool)

(declare-fun mapDefault!49738 () ValueCell!15221)

(assert (=> b!1257132 (= condMapEmpty!49738 (= (arr!39369 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15221)) mapDefault!49738)))))

(declare-fun b!1257133 () Bool)

(assert (=> b!1257133 (= e!714651 true)))

(declare-fun -!2044 (ListLongMap!18623 (_ BitVec 64)) ListLongMap!18623)

(assert (=> b!1257133 (= (-!2044 lt!568261 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568261)))

(declare-fun lt!568259 () Unit!41795)

(declare-fun removeNotPresentStillSame!116 (ListLongMap!18623 (_ BitVec 64)) Unit!41795)

(assert (=> b!1257133 (= lt!568259 (removeNotPresentStillSame!116 lt!568261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837727 () Bool)

(assert (=> start!105632 (=> (not res!837727) (not e!714650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105632 (= res!837727 (validMask!0 mask!1466))))

(assert (=> start!105632 e!714650))

(assert (=> start!105632 true))

(assert (=> start!105632 tp!94714))

(assert (=> start!105632 tp_is_empty!31969))

(declare-fun array_inv!30125 (array!81627) Bool)

(assert (=> start!105632 (array_inv!30125 _keys!1118)))

(declare-fun array_inv!30126 (array!81629) Bool)

(assert (=> start!105632 (and (array_inv!30126 _values!914) e!714646)))

(declare-fun b!1257134 () Bool)

(declare-fun res!837728 () Bool)

(assert (=> b!1257134 (=> (not res!837728) (not e!714650))))

(assert (=> b!1257134 (= res!837728 (and (= (size!39906 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39905 _keys!1118) (size!39906 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105632 res!837727) b!1257134))

(assert (= (and b!1257134 res!837728) b!1257129))

(assert (= (and b!1257129 res!837729) b!1257130))

(assert (= (and b!1257130 res!837726) b!1257126))

(assert (= (and b!1257126 (not res!837724)) b!1257127))

(assert (= (and b!1257127 (not res!837725)) b!1257133))

(assert (= (and b!1257132 condMapEmpty!49738) mapIsEmpty!49738))

(assert (= (and b!1257132 (not condMapEmpty!49738)) mapNonEmpty!49738))

(get-info :version)

(assert (= (and mapNonEmpty!49738 ((_ is ValueCellFull!15221) mapValue!49738)) b!1257131))

(assert (= (and b!1257132 ((_ is ValueCellFull!15221) mapDefault!49738)) b!1257128))

(assert (= start!105632 b!1257132))

(declare-fun m!1158129 () Bool)

(assert (=> b!1257127 m!1158129))

(declare-fun m!1158131 () Bool)

(assert (=> b!1257127 m!1158131))

(declare-fun m!1158133 () Bool)

(assert (=> mapNonEmpty!49738 m!1158133))

(declare-fun m!1158135 () Bool)

(assert (=> b!1257130 m!1158135))

(declare-fun m!1158137 () Bool)

(assert (=> b!1257129 m!1158137))

(declare-fun m!1158139 () Bool)

(assert (=> b!1257126 m!1158139))

(declare-fun m!1158141 () Bool)

(assert (=> b!1257126 m!1158141))

(declare-fun m!1158143 () Bool)

(assert (=> b!1257126 m!1158143))

(declare-fun m!1158145 () Bool)

(assert (=> start!105632 m!1158145))

(declare-fun m!1158147 () Bool)

(assert (=> start!105632 m!1158147))

(declare-fun m!1158149 () Bool)

(assert (=> start!105632 m!1158149))

(declare-fun m!1158151 () Bool)

(assert (=> b!1257133 m!1158151))

(declare-fun m!1158153 () Bool)

(assert (=> b!1257133 m!1158153))

(check-sat (not b!1257129) b_and!44915 (not start!105632) (not b!1257133) (not b!1257127) (not b!1257130) (not b!1257126) (not mapNonEmpty!49738) tp_is_empty!31969 (not b_next!27067))
(check-sat b_and!44915 (not b_next!27067))
