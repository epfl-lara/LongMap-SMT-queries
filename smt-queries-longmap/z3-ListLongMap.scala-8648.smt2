; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105202 () Bool)

(assert start!105202)

(declare-fun b_free!26923 () Bool)

(declare-fun b_next!26923 () Bool)

(assert (=> start!105202 (= b_free!26923 (not b_next!26923))))

(declare-fun tp!94274 () Bool)

(declare-fun b_and!44719 () Bool)

(assert (=> start!105202 (= tp!94274 b_and!44719)))

(declare-fun b!1253619 () Bool)

(declare-fun e!712230 () Bool)

(declare-fun e!712228 () Bool)

(assert (=> b!1253619 (= e!712230 (not e!712228))))

(declare-fun res!835954 () Bool)

(assert (=> b!1253619 (=> res!835954 e!712228)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253619 (= res!835954 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47799 0))(
  ( (V!47800 (val!15975 Int)) )
))
(declare-datatypes ((tuple2!20706 0))(
  ( (tuple2!20707 (_1!10364 (_ BitVec 64)) (_2!10364 V!47799)) )
))
(declare-datatypes ((List!27918 0))(
  ( (Nil!27915) (Cons!27914 (h!29123 tuple2!20706) (t!41390 List!27918)) )
))
(declare-datatypes ((ListLongMap!18579 0))(
  ( (ListLongMap!18580 (toList!9305 List!27918)) )
))
(declare-fun lt!566058 () ListLongMap!18579)

(declare-fun lt!566054 () ListLongMap!18579)

(assert (=> b!1253619 (= lt!566058 lt!566054)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47799)

(declare-datatypes ((Unit!41573 0))(
  ( (Unit!41574) )
))
(declare-fun lt!566057 () Unit!41573)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47799)

(declare-datatypes ((array!81233 0))(
  ( (array!81234 (arr!39179 (Array (_ BitVec 32) (_ BitVec 64))) (size!39717 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81233)

(declare-datatypes ((ValueCell!15149 0))(
  ( (ValueCellFull!15149 (v!18672 V!47799)) (EmptyCell!15149) )
))
(declare-datatypes ((array!81235 0))(
  ( (array!81236 (arr!39180 (Array (_ BitVec 32) ValueCell!15149)) (size!39718 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81235)

(declare-fun minValueBefore!43 () V!47799)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1027 (array!81233 array!81235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 V!47799 V!47799 (_ BitVec 32) Int) Unit!41573)

(assert (=> b!1253619 (= lt!566057 (lemmaNoChangeToArrayThenSameMapNoExtras!1027 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5705 (array!81233 array!81235 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18579)

(assert (=> b!1253619 (= lt!566054 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253619 (= lt!566058 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253620 () Bool)

(declare-fun e!712226 () Bool)

(declare-fun e!712225 () Bool)

(declare-fun mapRes!49513 () Bool)

(assert (=> b!1253620 (= e!712226 (and e!712225 mapRes!49513))))

(declare-fun condMapEmpty!49513 () Bool)

(declare-fun mapDefault!49513 () ValueCell!15149)

(assert (=> b!1253620 (= condMapEmpty!49513 (= (arr!39180 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15149)) mapDefault!49513)))))

(declare-fun b!1253621 () Bool)

(assert (=> b!1253621 (= e!712228 true)))

(declare-fun lt!566053 () ListLongMap!18579)

(declare-fun lt!566055 () ListLongMap!18579)

(declare-fun -!2000 (ListLongMap!18579 (_ BitVec 64)) ListLongMap!18579)

(assert (=> b!1253621 (= lt!566053 (-!2000 lt!566055 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566056 () ListLongMap!18579)

(assert (=> b!1253621 (= (-!2000 lt!566056 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566058)))

(declare-fun lt!566052 () Unit!41573)

(declare-fun addThenRemoveForNewKeyIsSame!289 (ListLongMap!18579 (_ BitVec 64) V!47799) Unit!41573)

(assert (=> b!1253621 (= lt!566052 (addThenRemoveForNewKeyIsSame!289 lt!566058 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566059 () ListLongMap!18579)

(assert (=> b!1253621 (and (= lt!566055 lt!566056) (= lt!566059 lt!566054))))

(declare-fun +!4203 (ListLongMap!18579 tuple2!20706) ListLongMap!18579)

(assert (=> b!1253621 (= lt!566056 (+!4203 lt!566058 (tuple2!20707 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4439 (array!81233 array!81235 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18579)

(assert (=> b!1253621 (= lt!566059 (getCurrentListMap!4439 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253621 (= lt!566055 (getCurrentListMap!4439 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835950 () Bool)

(assert (=> start!105202 (=> (not res!835950) (not e!712230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105202 (= res!835950 (validMask!0 mask!1466))))

(assert (=> start!105202 e!712230))

(assert (=> start!105202 true))

(assert (=> start!105202 tp!94274))

(declare-fun tp_is_empty!31825 () Bool)

(assert (=> start!105202 tp_is_empty!31825))

(declare-fun array_inv!29997 (array!81233) Bool)

(assert (=> start!105202 (array_inv!29997 _keys!1118)))

(declare-fun array_inv!29998 (array!81235) Bool)

(assert (=> start!105202 (and (array_inv!29998 _values!914) e!712226)))

(declare-fun mapNonEmpty!49513 () Bool)

(declare-fun tp!94273 () Bool)

(declare-fun e!712227 () Bool)

(assert (=> mapNonEmpty!49513 (= mapRes!49513 (and tp!94273 e!712227))))

(declare-fun mapRest!49513 () (Array (_ BitVec 32) ValueCell!15149))

(declare-fun mapValue!49513 () ValueCell!15149)

(declare-fun mapKey!49513 () (_ BitVec 32))

(assert (=> mapNonEmpty!49513 (= (arr!39180 _values!914) (store mapRest!49513 mapKey!49513 mapValue!49513))))

(declare-fun b!1253622 () Bool)

(assert (=> b!1253622 (= e!712225 tp_is_empty!31825)))

(declare-fun b!1253623 () Bool)

(declare-fun res!835953 () Bool)

(assert (=> b!1253623 (=> (not res!835953) (not e!712230))))

(assert (=> b!1253623 (= res!835953 (and (= (size!39718 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39717 _keys!1118) (size!39718 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49513 () Bool)

(assert (=> mapIsEmpty!49513 mapRes!49513))

(declare-fun b!1253624 () Bool)

(assert (=> b!1253624 (= e!712227 tp_is_empty!31825)))

(declare-fun b!1253625 () Bool)

(declare-fun res!835951 () Bool)

(assert (=> b!1253625 (=> (not res!835951) (not e!712230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81233 (_ BitVec 32)) Bool)

(assert (=> b!1253625 (= res!835951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253626 () Bool)

(declare-fun res!835952 () Bool)

(assert (=> b!1253626 (=> (not res!835952) (not e!712230))))

(declare-datatypes ((List!27919 0))(
  ( (Nil!27916) (Cons!27915 (h!29124 (_ BitVec 64)) (t!41391 List!27919)) )
))
(declare-fun arrayNoDuplicates!0 (array!81233 (_ BitVec 32) List!27919) Bool)

(assert (=> b!1253626 (= res!835952 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27916))))

(assert (= (and start!105202 res!835950) b!1253623))

(assert (= (and b!1253623 res!835953) b!1253625))

(assert (= (and b!1253625 res!835951) b!1253626))

(assert (= (and b!1253626 res!835952) b!1253619))

(assert (= (and b!1253619 (not res!835954)) b!1253621))

(assert (= (and b!1253620 condMapEmpty!49513) mapIsEmpty!49513))

(assert (= (and b!1253620 (not condMapEmpty!49513)) mapNonEmpty!49513))

(get-info :version)

(assert (= (and mapNonEmpty!49513 ((_ is ValueCellFull!15149) mapValue!49513)) b!1253624))

(assert (= (and b!1253620 ((_ is ValueCellFull!15149) mapDefault!49513)) b!1253622))

(assert (= start!105202 b!1253620))

(declare-fun m!1153775 () Bool)

(assert (=> b!1253621 m!1153775))

(declare-fun m!1153777 () Bool)

(assert (=> b!1253621 m!1153777))

(declare-fun m!1153779 () Bool)

(assert (=> b!1253621 m!1153779))

(declare-fun m!1153781 () Bool)

(assert (=> b!1253621 m!1153781))

(declare-fun m!1153783 () Bool)

(assert (=> b!1253621 m!1153783))

(declare-fun m!1153785 () Bool)

(assert (=> b!1253621 m!1153785))

(declare-fun m!1153787 () Bool)

(assert (=> start!105202 m!1153787))

(declare-fun m!1153789 () Bool)

(assert (=> start!105202 m!1153789))

(declare-fun m!1153791 () Bool)

(assert (=> start!105202 m!1153791))

(declare-fun m!1153793 () Bool)

(assert (=> b!1253619 m!1153793))

(declare-fun m!1153795 () Bool)

(assert (=> b!1253619 m!1153795))

(declare-fun m!1153797 () Bool)

(assert (=> b!1253619 m!1153797))

(declare-fun m!1153799 () Bool)

(assert (=> b!1253625 m!1153799))

(declare-fun m!1153801 () Bool)

(assert (=> mapNonEmpty!49513 m!1153801))

(declare-fun m!1153803 () Bool)

(assert (=> b!1253626 m!1153803))

(check-sat (not b!1253621) (not b!1253625) (not b_next!26923) (not b!1253626) b_and!44719 (not b!1253619) tp_is_empty!31825 (not mapNonEmpty!49513) (not start!105202))
(check-sat b_and!44719 (not b_next!26923))
