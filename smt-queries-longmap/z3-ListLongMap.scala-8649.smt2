; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105208 () Bool)

(assert start!105208)

(declare-fun b_free!26929 () Bool)

(declare-fun b_next!26929 () Bool)

(assert (=> start!105208 (= b_free!26929 (not b_next!26929))))

(declare-fun tp!94292 () Bool)

(declare-fun b_and!44725 () Bool)

(assert (=> start!105208 (= tp!94292 b_and!44725)))

(declare-fun b!1253691 () Bool)

(declare-fun res!835997 () Bool)

(declare-fun e!712282 () Bool)

(assert (=> b!1253691 (=> (not res!835997) (not e!712282))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81245 0))(
  ( (array!81246 (arr!39185 (Array (_ BitVec 32) (_ BitVec 64))) (size!39723 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81245)

(declare-datatypes ((V!47807 0))(
  ( (V!47808 (val!15978 Int)) )
))
(declare-datatypes ((ValueCell!15152 0))(
  ( (ValueCellFull!15152 (v!18675 V!47807)) (EmptyCell!15152) )
))
(declare-datatypes ((array!81247 0))(
  ( (array!81248 (arr!39186 (Array (_ BitVec 32) ValueCell!15152)) (size!39724 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81247)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253691 (= res!835997 (and (= (size!39724 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39723 _keys!1118) (size!39724 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253692 () Bool)

(declare-fun res!835996 () Bool)

(assert (=> b!1253692 (=> (not res!835996) (not e!712282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81245 (_ BitVec 32)) Bool)

(assert (=> b!1253692 (= res!835996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253693 () Bool)

(declare-fun e!712279 () Bool)

(declare-fun tp_is_empty!31831 () Bool)

(assert (=> b!1253693 (= e!712279 tp_is_empty!31831)))

(declare-fun mapIsEmpty!49522 () Bool)

(declare-fun mapRes!49522 () Bool)

(assert (=> mapIsEmpty!49522 mapRes!49522))

(declare-fun b!1253694 () Bool)

(declare-fun e!712284 () Bool)

(declare-fun e!712283 () Bool)

(assert (=> b!1253694 (= e!712284 (and e!712283 mapRes!49522))))

(declare-fun condMapEmpty!49522 () Bool)

(declare-fun mapDefault!49522 () ValueCell!15152)

(assert (=> b!1253694 (= condMapEmpty!49522 (= (arr!39186 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15152)) mapDefault!49522)))))

(declare-fun b!1253695 () Bool)

(declare-fun e!712280 () Bool)

(assert (=> b!1253695 (= e!712280 true)))

(declare-datatypes ((tuple2!20712 0))(
  ( (tuple2!20713 (_1!10367 (_ BitVec 64)) (_2!10367 V!47807)) )
))
(declare-datatypes ((List!27923 0))(
  ( (Nil!27920) (Cons!27919 (h!29128 tuple2!20712) (t!41395 List!27923)) )
))
(declare-datatypes ((ListLongMap!18585 0))(
  ( (ListLongMap!18586 (toList!9308 List!27923)) )
))
(declare-fun lt!566124 () ListLongMap!18585)

(declare-fun lt!566129 () ListLongMap!18585)

(declare-fun -!2002 (ListLongMap!18585 (_ BitVec 64)) ListLongMap!18585)

(assert (=> b!1253695 (= lt!566124 (-!2002 lt!566129 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566125 () ListLongMap!18585)

(declare-fun lt!566128 () ListLongMap!18585)

(assert (=> b!1253695 (= (-!2002 lt!566125 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566128)))

(declare-datatypes ((Unit!41579 0))(
  ( (Unit!41580) )
))
(declare-fun lt!566126 () Unit!41579)

(declare-fun minValueBefore!43 () V!47807)

(declare-fun addThenRemoveForNewKeyIsSame!291 (ListLongMap!18585 (_ BitVec 64) V!47807) Unit!41579)

(assert (=> b!1253695 (= lt!566126 (addThenRemoveForNewKeyIsSame!291 lt!566128 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566127 () ListLongMap!18585)

(declare-fun lt!566130 () ListLongMap!18585)

(assert (=> b!1253695 (and (= lt!566129 lt!566125) (= lt!566130 lt!566127))))

(declare-fun +!4205 (ListLongMap!18585 tuple2!20712) ListLongMap!18585)

(assert (=> b!1253695 (= lt!566125 (+!4205 lt!566128 (tuple2!20713 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47807)

(declare-fun zeroValue!871 () V!47807)

(declare-fun getCurrentListMap!4441 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 (_ BitVec 32) Int) ListLongMap!18585)

(assert (=> b!1253695 (= lt!566130 (getCurrentListMap!4441 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253695 (= lt!566129 (getCurrentListMap!4441 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835998 () Bool)

(assert (=> start!105208 (=> (not res!835998) (not e!712282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105208 (= res!835998 (validMask!0 mask!1466))))

(assert (=> start!105208 e!712282))

(assert (=> start!105208 true))

(assert (=> start!105208 tp!94292))

(assert (=> start!105208 tp_is_empty!31831))

(declare-fun array_inv!30003 (array!81245) Bool)

(assert (=> start!105208 (array_inv!30003 _keys!1118)))

(declare-fun array_inv!30004 (array!81247) Bool)

(assert (=> start!105208 (and (array_inv!30004 _values!914) e!712284)))

(declare-fun b!1253696 () Bool)

(assert (=> b!1253696 (= e!712282 (not e!712280))))

(declare-fun res!835999 () Bool)

(assert (=> b!1253696 (=> res!835999 e!712280)))

(assert (=> b!1253696 (= res!835999 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253696 (= lt!566128 lt!566127)))

(declare-fun lt!566131 () Unit!41579)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1030 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 V!47807 V!47807 (_ BitVec 32) Int) Unit!41579)

(assert (=> b!1253696 (= lt!566131 (lemmaNoChangeToArrayThenSameMapNoExtras!1030 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5708 (array!81245 array!81247 (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 (_ BitVec 32) Int) ListLongMap!18585)

(assert (=> b!1253696 (= lt!566127 (getCurrentListMapNoExtraKeys!5708 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253696 (= lt!566128 (getCurrentListMapNoExtraKeys!5708 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49522 () Bool)

(declare-fun tp!94291 () Bool)

(assert (=> mapNonEmpty!49522 (= mapRes!49522 (and tp!94291 e!712279))))

(declare-fun mapKey!49522 () (_ BitVec 32))

(declare-fun mapValue!49522 () ValueCell!15152)

(declare-fun mapRest!49522 () (Array (_ BitVec 32) ValueCell!15152))

(assert (=> mapNonEmpty!49522 (= (arr!39186 _values!914) (store mapRest!49522 mapKey!49522 mapValue!49522))))

(declare-fun b!1253697 () Bool)

(declare-fun res!835995 () Bool)

(assert (=> b!1253697 (=> (not res!835995) (not e!712282))))

(declare-datatypes ((List!27924 0))(
  ( (Nil!27921) (Cons!27920 (h!29129 (_ BitVec 64)) (t!41396 List!27924)) )
))
(declare-fun arrayNoDuplicates!0 (array!81245 (_ BitVec 32) List!27924) Bool)

(assert (=> b!1253697 (= res!835995 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27921))))

(declare-fun b!1253698 () Bool)

(assert (=> b!1253698 (= e!712283 tp_is_empty!31831)))

(assert (= (and start!105208 res!835998) b!1253691))

(assert (= (and b!1253691 res!835997) b!1253692))

(assert (= (and b!1253692 res!835996) b!1253697))

(assert (= (and b!1253697 res!835995) b!1253696))

(assert (= (and b!1253696 (not res!835999)) b!1253695))

(assert (= (and b!1253694 condMapEmpty!49522) mapIsEmpty!49522))

(assert (= (and b!1253694 (not condMapEmpty!49522)) mapNonEmpty!49522))

(get-info :version)

(assert (= (and mapNonEmpty!49522 ((_ is ValueCellFull!15152) mapValue!49522)) b!1253693))

(assert (= (and b!1253694 ((_ is ValueCellFull!15152) mapDefault!49522)) b!1253698))

(assert (= start!105208 b!1253694))

(declare-fun m!1153865 () Bool)

(assert (=> b!1253692 m!1153865))

(declare-fun m!1153867 () Bool)

(assert (=> b!1253695 m!1153867))

(declare-fun m!1153869 () Bool)

(assert (=> b!1253695 m!1153869))

(declare-fun m!1153871 () Bool)

(assert (=> b!1253695 m!1153871))

(declare-fun m!1153873 () Bool)

(assert (=> b!1253695 m!1153873))

(declare-fun m!1153875 () Bool)

(assert (=> b!1253695 m!1153875))

(declare-fun m!1153877 () Bool)

(assert (=> b!1253695 m!1153877))

(declare-fun m!1153879 () Bool)

(assert (=> b!1253697 m!1153879))

(declare-fun m!1153881 () Bool)

(assert (=> mapNonEmpty!49522 m!1153881))

(declare-fun m!1153883 () Bool)

(assert (=> start!105208 m!1153883))

(declare-fun m!1153885 () Bool)

(assert (=> start!105208 m!1153885))

(declare-fun m!1153887 () Bool)

(assert (=> start!105208 m!1153887))

(declare-fun m!1153889 () Bool)

(assert (=> b!1253696 m!1153889))

(declare-fun m!1153891 () Bool)

(assert (=> b!1253696 m!1153891))

(declare-fun m!1153893 () Bool)

(assert (=> b!1253696 m!1153893))

(check-sat (not b!1253695) tp_is_empty!31831 (not start!105208) (not b!1253692) (not b!1253696) (not mapNonEmpty!49522) (not b_next!26929) (not b!1253697) b_and!44725)
(check-sat b_and!44725 (not b_next!26929))
