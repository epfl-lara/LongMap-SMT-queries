; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105516 () Bool)

(assert start!105516)

(declare-fun b_free!27157 () Bool)

(declare-fun b_next!27157 () Bool)

(assert (=> start!105516 (= b_free!27157 (not b_next!27157))))

(declare-fun tp!94988 () Bool)

(declare-fun b_and!44995 () Bool)

(assert (=> start!105516 (= tp!94988 b_and!44995)))

(declare-fun b!1257111 () Bool)

(declare-fun res!838037 () Bool)

(declare-fun e!714802 () Bool)

(assert (=> b!1257111 (=> (not res!838037) (not e!714802))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81677 0))(
  ( (array!81678 (arr!39397 (Array (_ BitVec 32) (_ BitVec 64))) (size!39935 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81677)

(declare-datatypes ((V!48111 0))(
  ( (V!48112 (val!16092 Int)) )
))
(declare-datatypes ((ValueCell!15266 0))(
  ( (ValueCellFull!15266 (v!18792 V!48111)) (EmptyCell!15266) )
))
(declare-datatypes ((array!81679 0))(
  ( (array!81680 (arr!39398 (Array (_ BitVec 32) ValueCell!15266)) (size!39936 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81679)

(assert (=> b!1257111 (= res!838037 (and (= (size!39936 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39935 _keys!1118) (size!39936 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257112 () Bool)

(declare-fun res!838039 () Bool)

(assert (=> b!1257112 (=> (not res!838039) (not e!714802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81677 (_ BitVec 32)) Bool)

(assert (=> b!1257112 (= res!838039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49876 () Bool)

(declare-fun mapRes!49876 () Bool)

(assert (=> mapIsEmpty!49876 mapRes!49876))

(declare-fun b!1257113 () Bool)

(declare-fun e!714799 () Bool)

(declare-fun tp_is_empty!32059 () Bool)

(assert (=> b!1257113 (= e!714799 tp_is_empty!32059)))

(declare-fun b!1257114 () Bool)

(declare-fun e!714804 () Bool)

(assert (=> b!1257114 (= e!714804 tp_is_empty!32059)))

(declare-fun b!1257115 () Bool)

(declare-fun e!714801 () Bool)

(assert (=> b!1257115 (= e!714802 (not e!714801))))

(declare-fun res!838038 () Bool)

(assert (=> b!1257115 (=> res!838038 e!714801)))

(assert (=> b!1257115 (= res!838038 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20872 0))(
  ( (tuple2!20873 (_1!10447 (_ BitVec 64)) (_2!10447 V!48111)) )
))
(declare-datatypes ((List!28080 0))(
  ( (Nil!28077) (Cons!28076 (h!29285 tuple2!20872) (t!41560 List!28080)) )
))
(declare-datatypes ((ListLongMap!18745 0))(
  ( (ListLongMap!18746 (toList!9388 List!28080)) )
))
(declare-fun lt!568396 () ListLongMap!18745)

(declare-fun lt!568394 () ListLongMap!18745)

(assert (=> b!1257115 (= lt!568396 lt!568394)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48111)

(declare-fun zeroValue!871 () V!48111)

(declare-fun minValueBefore!43 () V!48111)

(declare-datatypes ((Unit!41733 0))(
  ( (Unit!41734) )
))
(declare-fun lt!568397 () Unit!41733)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1093 (array!81677 array!81679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 V!48111 V!48111 (_ BitVec 32) Int) Unit!41733)

(assert (=> b!1257115 (= lt!568397 (lemmaNoChangeToArrayThenSameMapNoExtras!1093 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5771 (array!81677 array!81679 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1257115 (= lt!568394 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257115 (= lt!568396 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257116 () Bool)

(declare-fun e!714800 () Bool)

(assert (=> b!1257116 (= e!714801 e!714800)))

(declare-fun res!838036 () Bool)

(assert (=> b!1257116 (=> res!838036 e!714800)))

(declare-fun lt!568395 () ListLongMap!18745)

(declare-fun contains!7538 (ListLongMap!18745 (_ BitVec 64)) Bool)

(assert (=> b!1257116 (= res!838036 (contains!7538 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4497 (array!81677 array!81679 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1257116 (= lt!568395 (getCurrentListMap!4497 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257117 () Bool)

(declare-fun e!714803 () Bool)

(assert (=> b!1257117 (= e!714803 (and e!714799 mapRes!49876))))

(declare-fun condMapEmpty!49876 () Bool)

(declare-fun mapDefault!49876 () ValueCell!15266)

(assert (=> b!1257117 (= condMapEmpty!49876 (= (arr!39398 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15266)) mapDefault!49876)))))

(declare-fun b!1257118 () Bool)

(declare-fun res!838040 () Bool)

(assert (=> b!1257118 (=> (not res!838040) (not e!714802))))

(declare-datatypes ((List!28081 0))(
  ( (Nil!28078) (Cons!28077 (h!29286 (_ BitVec 64)) (t!41561 List!28081)) )
))
(declare-fun arrayNoDuplicates!0 (array!81677 (_ BitVec 32) List!28081) Bool)

(assert (=> b!1257118 (= res!838040 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28078))))

(declare-fun b!1257119 () Bool)

(assert (=> b!1257119 (= e!714800 (bvsle #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun -!2051 (ListLongMap!18745 (_ BitVec 64)) ListLongMap!18745)

(assert (=> b!1257119 (= (-!2051 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568395)))

(declare-fun lt!568398 () Unit!41733)

(declare-fun removeNotPresentStillSame!146 (ListLongMap!18745 (_ BitVec 64)) Unit!41733)

(assert (=> b!1257119 (= lt!568398 (removeNotPresentStillSame!146 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!838035 () Bool)

(assert (=> start!105516 (=> (not res!838035) (not e!714802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105516 (= res!838035 (validMask!0 mask!1466))))

(assert (=> start!105516 e!714802))

(assert (=> start!105516 true))

(assert (=> start!105516 tp!94988))

(assert (=> start!105516 tp_is_empty!32059))

(declare-fun array_inv!30143 (array!81677) Bool)

(assert (=> start!105516 (array_inv!30143 _keys!1118)))

(declare-fun array_inv!30144 (array!81679) Bool)

(assert (=> start!105516 (and (array_inv!30144 _values!914) e!714803)))

(declare-fun mapNonEmpty!49876 () Bool)

(declare-fun tp!94987 () Bool)

(assert (=> mapNonEmpty!49876 (= mapRes!49876 (and tp!94987 e!714804))))

(declare-fun mapRest!49876 () (Array (_ BitVec 32) ValueCell!15266))

(declare-fun mapKey!49876 () (_ BitVec 32))

(declare-fun mapValue!49876 () ValueCell!15266)

(assert (=> mapNonEmpty!49876 (= (arr!39398 _values!914) (store mapRest!49876 mapKey!49876 mapValue!49876))))

(assert (= (and start!105516 res!838035) b!1257111))

(assert (= (and b!1257111 res!838037) b!1257112))

(assert (= (and b!1257112 res!838039) b!1257118))

(assert (= (and b!1257118 res!838040) b!1257115))

(assert (= (and b!1257115 (not res!838038)) b!1257116))

(assert (= (and b!1257116 (not res!838036)) b!1257119))

(assert (= (and b!1257117 condMapEmpty!49876) mapIsEmpty!49876))

(assert (= (and b!1257117 (not condMapEmpty!49876)) mapNonEmpty!49876))

(get-info :version)

(assert (= (and mapNonEmpty!49876 ((_ is ValueCellFull!15266) mapValue!49876)) b!1257114))

(assert (= (and b!1257117 ((_ is ValueCellFull!15266) mapDefault!49876)) b!1257113))

(assert (= start!105516 b!1257117))

(declare-fun m!1157293 () Bool)

(assert (=> b!1257116 m!1157293))

(declare-fun m!1157295 () Bool)

(assert (=> b!1257116 m!1157295))

(declare-fun m!1157297 () Bool)

(assert (=> mapNonEmpty!49876 m!1157297))

(declare-fun m!1157299 () Bool)

(assert (=> b!1257115 m!1157299))

(declare-fun m!1157301 () Bool)

(assert (=> b!1257115 m!1157301))

(declare-fun m!1157303 () Bool)

(assert (=> b!1257115 m!1157303))

(declare-fun m!1157305 () Bool)

(assert (=> b!1257119 m!1157305))

(declare-fun m!1157307 () Bool)

(assert (=> b!1257119 m!1157307))

(declare-fun m!1157309 () Bool)

(assert (=> b!1257112 m!1157309))

(declare-fun m!1157311 () Bool)

(assert (=> b!1257118 m!1157311))

(declare-fun m!1157313 () Bool)

(assert (=> start!105516 m!1157313))

(declare-fun m!1157315 () Bool)

(assert (=> start!105516 m!1157315))

(declare-fun m!1157317 () Bool)

(assert (=> start!105516 m!1157317))

(check-sat (not b!1257119) (not start!105516) (not b!1257112) tp_is_empty!32059 (not b!1257118) (not b!1257116) (not b_next!27157) (not b!1257115) (not mapNonEmpty!49876) b_and!44995)
(check-sat b_and!44995 (not b_next!27157))
(get-model)

(declare-fun b!1257182 () Bool)

(declare-fun e!714855 () Bool)

(declare-fun call!61792 () Bool)

(assert (=> b!1257182 (= e!714855 call!61792)))

(declare-fun b!1257183 () Bool)

(declare-fun e!714853 () Bool)

(assert (=> b!1257183 (= e!714853 call!61792)))

(declare-fun b!1257184 () Bool)

(declare-fun e!714854 () Bool)

(assert (=> b!1257184 (= e!714854 e!714853)))

(declare-fun c!122436 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1257184 (= c!122436 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138095 () Bool)

(declare-fun res!838082 () Bool)

(assert (=> d!138095 (=> res!838082 e!714854)))

(assert (=> d!138095 (= res!838082 (bvsge #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> d!138095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!714854)))

(declare-fun bm!61789 () Bool)

(assert (=> bm!61789 (= call!61792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1257185 () Bool)

(assert (=> b!1257185 (= e!714853 e!714855)))

(declare-fun lt!568437 () (_ BitVec 64))

(assert (=> b!1257185 (= lt!568437 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568435 () Unit!41733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81677 (_ BitVec 64) (_ BitVec 32)) Unit!41733)

(assert (=> b!1257185 (= lt!568435 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568437 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1257185 (arrayContainsKey!0 _keys!1118 lt!568437 #b00000000000000000000000000000000)))

(declare-fun lt!568436 () Unit!41733)

(assert (=> b!1257185 (= lt!568436 lt!568435)))

(declare-fun res!838081 () Bool)

(declare-datatypes ((SeekEntryResult!9966 0))(
  ( (MissingZero!9966 (index!42235 (_ BitVec 32))) (Found!9966 (index!42236 (_ BitVec 32))) (Intermediate!9966 (undefined!10778 Bool) (index!42237 (_ BitVec 32)) (x!110713 (_ BitVec 32))) (Undefined!9966) (MissingVacant!9966 (index!42238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81677 (_ BitVec 32)) SeekEntryResult!9966)

(assert (=> b!1257185 (= res!838081 (= (seekEntryOrOpen!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9966 #b00000000000000000000000000000000)))))

(assert (=> b!1257185 (=> (not res!838081) (not e!714855))))

(assert (= (and d!138095 (not res!838082)) b!1257184))

(assert (= (and b!1257184 c!122436) b!1257185))

(assert (= (and b!1257184 (not c!122436)) b!1257183))

(assert (= (and b!1257185 res!838081) b!1257182))

(assert (= (or b!1257182 b!1257183) bm!61789))

(declare-fun m!1157371 () Bool)

(assert (=> b!1257184 m!1157371))

(assert (=> b!1257184 m!1157371))

(declare-fun m!1157373 () Bool)

(assert (=> b!1257184 m!1157373))

(declare-fun m!1157375 () Bool)

(assert (=> bm!61789 m!1157375))

(assert (=> b!1257185 m!1157371))

(declare-fun m!1157377 () Bool)

(assert (=> b!1257185 m!1157377))

(declare-fun m!1157379 () Bool)

(assert (=> b!1257185 m!1157379))

(assert (=> b!1257185 m!1157371))

(declare-fun m!1157381 () Bool)

(assert (=> b!1257185 m!1157381))

(assert (=> b!1257112 d!138095))

(declare-fun d!138097 () Bool)

(declare-fun lt!568440 () ListLongMap!18745)

(assert (=> d!138097 (not (contains!7538 lt!568440 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!141 (List!28080 (_ BitVec 64)) List!28080)

(assert (=> d!138097 (= lt!568440 (ListLongMap!18746 (removeStrictlySorted!141 (toList!9388 lt!568395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138097 (= (-!2051 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568440)))

(declare-fun bs!35521 () Bool)

(assert (= bs!35521 d!138097))

(declare-fun m!1157383 () Bool)

(assert (=> bs!35521 m!1157383))

(declare-fun m!1157385 () Bool)

(assert (=> bs!35521 m!1157385))

(assert (=> b!1257119 d!138097))

(declare-fun d!138099 () Bool)

(assert (=> d!138099 (= (-!2051 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568395)))

(declare-fun lt!568443 () Unit!41733)

(declare-fun choose!1869 (ListLongMap!18745 (_ BitVec 64)) Unit!41733)

(assert (=> d!138099 (= lt!568443 (choose!1869 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138099 (not (contains!7538 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138099 (= (removeNotPresentStillSame!146 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568443)))

(declare-fun bs!35522 () Bool)

(assert (= bs!35522 d!138099))

(assert (=> bs!35522 m!1157305))

(declare-fun m!1157387 () Bool)

(assert (=> bs!35522 m!1157387))

(assert (=> bs!35522 m!1157293))

(assert (=> b!1257119 d!138099))

(declare-fun d!138101 () Bool)

(assert (=> d!138101 (= (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568446 () Unit!41733)

(declare-fun choose!1870 (array!81677 array!81679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 V!48111 V!48111 (_ BitVec 32) Int) Unit!41733)

(assert (=> d!138101 (= lt!568446 (choose!1870 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138101 (validMask!0 mask!1466)))

(assert (=> d!138101 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1093 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568446)))

(declare-fun bs!35523 () Bool)

(assert (= bs!35523 d!138101))

(assert (=> bs!35523 m!1157303))

(assert (=> bs!35523 m!1157301))

(declare-fun m!1157389 () Bool)

(assert (=> bs!35523 m!1157389))

(assert (=> bs!35523 m!1157313))

(assert (=> b!1257115 d!138101))

(declare-fun b!1257210 () Bool)

(declare-fun e!714870 () Bool)

(declare-fun lt!568461 () ListLongMap!18745)

(assert (=> b!1257210 (= e!714870 (= lt!568461 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1257211 () Bool)

(declare-fun e!714873 () Bool)

(declare-fun e!714874 () Bool)

(assert (=> b!1257211 (= e!714873 e!714874)))

(assert (=> b!1257211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun res!838092 () Bool)

(assert (=> b!1257211 (= res!838092 (contains!7538 lt!568461 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257211 (=> (not res!838092) (not e!714874))))

(declare-fun d!138103 () Bool)

(declare-fun e!714871 () Bool)

(assert (=> d!138103 e!714871))

(declare-fun res!838091 () Bool)

(assert (=> d!138103 (=> (not res!838091) (not e!714871))))

(assert (=> d!138103 (= res!838091 (not (contains!7538 lt!568461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!714876 () ListLongMap!18745)

(assert (=> d!138103 (= lt!568461 e!714876)))

(declare-fun c!122445 () Bool)

(assert (=> d!138103 (= c!122445 (bvsge #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> d!138103 (validMask!0 mask!1466)))

(assert (=> d!138103 (= (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568461)))

(declare-fun b!1257212 () Bool)

(assert (=> b!1257212 (= e!714876 (ListLongMap!18746 Nil!28077))))

(declare-fun b!1257213 () Bool)

(declare-fun lt!568463 () Unit!41733)

(declare-fun lt!568467 () Unit!41733)

(assert (=> b!1257213 (= lt!568463 lt!568467)))

(declare-fun lt!568466 () (_ BitVec 64))

(declare-fun lt!568462 () ListLongMap!18745)

(declare-fun lt!568464 () V!48111)

(declare-fun lt!568465 () (_ BitVec 64))

(declare-fun +!4227 (ListLongMap!18745 tuple2!20872) ListLongMap!18745)

(assert (=> b!1257213 (not (contains!7538 (+!4227 lt!568462 (tuple2!20873 lt!568466 lt!568464)) lt!568465))))

(declare-fun addStillNotContains!318 (ListLongMap!18745 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41733)

(assert (=> b!1257213 (= lt!568467 (addStillNotContains!318 lt!568462 lt!568466 lt!568464 lt!568465))))

(assert (=> b!1257213 (= lt!568465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20161 (ValueCell!15266 V!48111) V!48111)

(declare-fun dynLambda!3412 (Int (_ BitVec 64)) V!48111)

(assert (=> b!1257213 (= lt!568464 (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257213 (= lt!568466 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61795 () ListLongMap!18745)

(assert (=> b!1257213 (= lt!568462 call!61795)))

(declare-fun e!714872 () ListLongMap!18745)

(assert (=> b!1257213 (= e!714872 (+!4227 call!61795 (tuple2!20873 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000) (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257214 () Bool)

(assert (=> b!1257214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> b!1257214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39936 _values!914)))))

(declare-fun apply!982 (ListLongMap!18745 (_ BitVec 64)) V!48111)

(assert (=> b!1257214 (= e!714874 (= (apply!982 lt!568461 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)) (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257215 () Bool)

(assert (=> b!1257215 (= e!714872 call!61795)))

(declare-fun bm!61792 () Bool)

(assert (=> bm!61792 (= call!61795 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257216 () Bool)

(declare-fun res!838093 () Bool)

(assert (=> b!1257216 (=> (not res!838093) (not e!714871))))

(assert (=> b!1257216 (= res!838093 (not (contains!7538 lt!568461 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257217 () Bool)

(assert (=> b!1257217 (= e!714873 e!714870)))

(declare-fun c!122446 () Bool)

(assert (=> b!1257217 (= c!122446 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun b!1257218 () Bool)

(assert (=> b!1257218 (= e!714876 e!714872)))

(declare-fun c!122448 () Bool)

(assert (=> b!1257218 (= c!122448 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257219 () Bool)

(declare-fun isEmpty!1037 (ListLongMap!18745) Bool)

(assert (=> b!1257219 (= e!714870 (isEmpty!1037 lt!568461))))

(declare-fun b!1257220 () Bool)

(assert (=> b!1257220 (= e!714871 e!714873)))

(declare-fun c!122447 () Bool)

(declare-fun e!714875 () Bool)

(assert (=> b!1257220 (= c!122447 e!714875)))

(declare-fun res!838094 () Bool)

(assert (=> b!1257220 (=> (not res!838094) (not e!714875))))

(assert (=> b!1257220 (= res!838094 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun b!1257221 () Bool)

(assert (=> b!1257221 (= e!714875 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257221 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138103 c!122445) b!1257212))

(assert (= (and d!138103 (not c!122445)) b!1257218))

(assert (= (and b!1257218 c!122448) b!1257213))

(assert (= (and b!1257218 (not c!122448)) b!1257215))

(assert (= (or b!1257213 b!1257215) bm!61792))

(assert (= (and d!138103 res!838091) b!1257216))

(assert (= (and b!1257216 res!838093) b!1257220))

(assert (= (and b!1257220 res!838094) b!1257221))

(assert (= (and b!1257220 c!122447) b!1257211))

(assert (= (and b!1257220 (not c!122447)) b!1257217))

(assert (= (and b!1257211 res!838092) b!1257214))

(assert (= (and b!1257217 c!122446) b!1257210))

(assert (= (and b!1257217 (not c!122446)) b!1257219))

(declare-fun b_lambda!22677 () Bool)

(assert (=> (not b_lambda!22677) (not b!1257213)))

(declare-fun t!41567 () Bool)

(declare-fun tb!11297 () Bool)

(assert (=> (and start!105516 (= defaultEntry!922 defaultEntry!922) t!41567) tb!11297))

(declare-fun result!23315 () Bool)

(assert (=> tb!11297 (= result!23315 tp_is_empty!32059)))

(assert (=> b!1257213 t!41567))

(declare-fun b_and!45001 () Bool)

(assert (= b_and!44995 (and (=> t!41567 result!23315) b_and!45001)))

(declare-fun b_lambda!22679 () Bool)

(assert (=> (not b_lambda!22679) (not b!1257214)))

(assert (=> b!1257214 t!41567))

(declare-fun b_and!45003 () Bool)

(assert (= b_and!45001 (and (=> t!41567 result!23315) b_and!45003)))

(declare-fun m!1157391 () Bool)

(assert (=> b!1257213 m!1157391))

(declare-fun m!1157393 () Bool)

(assert (=> b!1257213 m!1157393))

(declare-fun m!1157395 () Bool)

(assert (=> b!1257213 m!1157395))

(declare-fun m!1157397 () Bool)

(assert (=> b!1257213 m!1157397))

(declare-fun m!1157399 () Bool)

(assert (=> b!1257213 m!1157399))

(declare-fun m!1157401 () Bool)

(assert (=> b!1257213 m!1157401))

(declare-fun m!1157403 () Bool)

(assert (=> b!1257213 m!1157403))

(assert (=> b!1257213 m!1157371))

(assert (=> b!1257213 m!1157395))

(assert (=> b!1257213 m!1157401))

(assert (=> b!1257213 m!1157393))

(declare-fun m!1157405 () Bool)

(assert (=> d!138103 m!1157405))

(assert (=> d!138103 m!1157313))

(assert (=> b!1257221 m!1157371))

(assert (=> b!1257221 m!1157371))

(assert (=> b!1257221 m!1157373))

(declare-fun m!1157407 () Bool)

(assert (=> b!1257216 m!1157407))

(assert (=> b!1257214 m!1157371))

(declare-fun m!1157409 () Bool)

(assert (=> b!1257214 m!1157409))

(assert (=> b!1257214 m!1157393))

(assert (=> b!1257214 m!1157395))

(assert (=> b!1257214 m!1157397))

(assert (=> b!1257214 m!1157393))

(assert (=> b!1257214 m!1157371))

(assert (=> b!1257214 m!1157395))

(declare-fun m!1157411 () Bool)

(assert (=> bm!61792 m!1157411))

(assert (=> b!1257210 m!1157411))

(assert (=> b!1257218 m!1157371))

(assert (=> b!1257218 m!1157371))

(assert (=> b!1257218 m!1157373))

(assert (=> b!1257211 m!1157371))

(assert (=> b!1257211 m!1157371))

(declare-fun m!1157413 () Bool)

(assert (=> b!1257211 m!1157413))

(declare-fun m!1157415 () Bool)

(assert (=> b!1257219 m!1157415))

(assert (=> b!1257115 d!138103))

(declare-fun b!1257224 () Bool)

(declare-fun lt!568468 () ListLongMap!18745)

(declare-fun e!714877 () Bool)

(assert (=> b!1257224 (= e!714877 (= lt!568468 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1257225 () Bool)

(declare-fun e!714880 () Bool)

(declare-fun e!714881 () Bool)

(assert (=> b!1257225 (= e!714880 e!714881)))

(assert (=> b!1257225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun res!838096 () Bool)

(assert (=> b!1257225 (= res!838096 (contains!7538 lt!568468 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257225 (=> (not res!838096) (not e!714881))))

(declare-fun d!138105 () Bool)

(declare-fun e!714878 () Bool)

(assert (=> d!138105 e!714878))

(declare-fun res!838095 () Bool)

(assert (=> d!138105 (=> (not res!838095) (not e!714878))))

(assert (=> d!138105 (= res!838095 (not (contains!7538 lt!568468 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!714883 () ListLongMap!18745)

(assert (=> d!138105 (= lt!568468 e!714883)))

(declare-fun c!122449 () Bool)

(assert (=> d!138105 (= c!122449 (bvsge #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> d!138105 (validMask!0 mask!1466)))

(assert (=> d!138105 (= (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568468)))

(declare-fun b!1257226 () Bool)

(assert (=> b!1257226 (= e!714883 (ListLongMap!18746 Nil!28077))))

(declare-fun b!1257227 () Bool)

(declare-fun lt!568470 () Unit!41733)

(declare-fun lt!568474 () Unit!41733)

(assert (=> b!1257227 (= lt!568470 lt!568474)))

(declare-fun lt!568469 () ListLongMap!18745)

(declare-fun lt!568472 () (_ BitVec 64))

(declare-fun lt!568471 () V!48111)

(declare-fun lt!568473 () (_ BitVec 64))

(assert (=> b!1257227 (not (contains!7538 (+!4227 lt!568469 (tuple2!20873 lt!568473 lt!568471)) lt!568472))))

(assert (=> b!1257227 (= lt!568474 (addStillNotContains!318 lt!568469 lt!568473 lt!568471 lt!568472))))

(assert (=> b!1257227 (= lt!568472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257227 (= lt!568471 (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257227 (= lt!568473 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61796 () ListLongMap!18745)

(assert (=> b!1257227 (= lt!568469 call!61796)))

(declare-fun e!714879 () ListLongMap!18745)

(assert (=> b!1257227 (= e!714879 (+!4227 call!61796 (tuple2!20873 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000) (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257228 () Bool)

(assert (=> b!1257228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> b!1257228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39936 _values!914)))))

(assert (=> b!1257228 (= e!714881 (= (apply!982 lt!568468 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)) (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257229 () Bool)

(assert (=> b!1257229 (= e!714879 call!61796)))

(declare-fun bm!61793 () Bool)

(assert (=> bm!61793 (= call!61796 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257230 () Bool)

(declare-fun res!838097 () Bool)

(assert (=> b!1257230 (=> (not res!838097) (not e!714878))))

(assert (=> b!1257230 (= res!838097 (not (contains!7538 lt!568468 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257231 () Bool)

(assert (=> b!1257231 (= e!714880 e!714877)))

(declare-fun c!122450 () Bool)

(assert (=> b!1257231 (= c!122450 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun b!1257232 () Bool)

(assert (=> b!1257232 (= e!714883 e!714879)))

(declare-fun c!122452 () Bool)

(assert (=> b!1257232 (= c!122452 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257233 () Bool)

(assert (=> b!1257233 (= e!714877 (isEmpty!1037 lt!568468))))

(declare-fun b!1257234 () Bool)

(assert (=> b!1257234 (= e!714878 e!714880)))

(declare-fun c!122451 () Bool)

(declare-fun e!714882 () Bool)

(assert (=> b!1257234 (= c!122451 e!714882)))

(declare-fun res!838098 () Bool)

(assert (=> b!1257234 (=> (not res!838098) (not e!714882))))

(assert (=> b!1257234 (= res!838098 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun b!1257235 () Bool)

(assert (=> b!1257235 (= e!714882 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257235 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138105 c!122449) b!1257226))

(assert (= (and d!138105 (not c!122449)) b!1257232))

(assert (= (and b!1257232 c!122452) b!1257227))

(assert (= (and b!1257232 (not c!122452)) b!1257229))

(assert (= (or b!1257227 b!1257229) bm!61793))

(assert (= (and d!138105 res!838095) b!1257230))

(assert (= (and b!1257230 res!838097) b!1257234))

(assert (= (and b!1257234 res!838098) b!1257235))

(assert (= (and b!1257234 c!122451) b!1257225))

(assert (= (and b!1257234 (not c!122451)) b!1257231))

(assert (= (and b!1257225 res!838096) b!1257228))

(assert (= (and b!1257231 c!122450) b!1257224))

(assert (= (and b!1257231 (not c!122450)) b!1257233))

(declare-fun b_lambda!22681 () Bool)

(assert (=> (not b_lambda!22681) (not b!1257227)))

(assert (=> b!1257227 t!41567))

(declare-fun b_and!45005 () Bool)

(assert (= b_and!45003 (and (=> t!41567 result!23315) b_and!45005)))

(declare-fun b_lambda!22683 () Bool)

(assert (=> (not b_lambda!22683) (not b!1257228)))

(assert (=> b!1257228 t!41567))

(declare-fun b_and!45007 () Bool)

(assert (= b_and!45005 (and (=> t!41567 result!23315) b_and!45007)))

(declare-fun m!1157417 () Bool)

(assert (=> b!1257227 m!1157417))

(assert (=> b!1257227 m!1157393))

(assert (=> b!1257227 m!1157395))

(assert (=> b!1257227 m!1157397))

(declare-fun m!1157419 () Bool)

(assert (=> b!1257227 m!1157419))

(declare-fun m!1157421 () Bool)

(assert (=> b!1257227 m!1157421))

(declare-fun m!1157423 () Bool)

(assert (=> b!1257227 m!1157423))

(assert (=> b!1257227 m!1157371))

(assert (=> b!1257227 m!1157395))

(assert (=> b!1257227 m!1157421))

(assert (=> b!1257227 m!1157393))

(declare-fun m!1157425 () Bool)

(assert (=> d!138105 m!1157425))

(assert (=> d!138105 m!1157313))

(assert (=> b!1257235 m!1157371))

(assert (=> b!1257235 m!1157371))

(assert (=> b!1257235 m!1157373))

(declare-fun m!1157427 () Bool)

(assert (=> b!1257230 m!1157427))

(assert (=> b!1257228 m!1157371))

(declare-fun m!1157429 () Bool)

(assert (=> b!1257228 m!1157429))

(assert (=> b!1257228 m!1157393))

(assert (=> b!1257228 m!1157395))

(assert (=> b!1257228 m!1157397))

(assert (=> b!1257228 m!1157393))

(assert (=> b!1257228 m!1157371))

(assert (=> b!1257228 m!1157395))

(declare-fun m!1157431 () Bool)

(assert (=> bm!61793 m!1157431))

(assert (=> b!1257224 m!1157431))

(assert (=> b!1257232 m!1157371))

(assert (=> b!1257232 m!1157371))

(assert (=> b!1257232 m!1157373))

(assert (=> b!1257225 m!1157371))

(assert (=> b!1257225 m!1157371))

(declare-fun m!1157433 () Bool)

(assert (=> b!1257225 m!1157433))

(declare-fun m!1157435 () Bool)

(assert (=> b!1257233 m!1157435))

(assert (=> b!1257115 d!138105))

(declare-fun d!138107 () Bool)

(assert (=> d!138107 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105516 d!138107))

(declare-fun d!138109 () Bool)

(assert (=> d!138109 (= (array_inv!30143 _keys!1118) (bvsge (size!39935 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105516 d!138109))

(declare-fun d!138111 () Bool)

(assert (=> d!138111 (= (array_inv!30144 _values!914) (bvsge (size!39936 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105516 d!138111))

(declare-fun b!1257246 () Bool)

(declare-fun e!714895 () Bool)

(declare-fun call!61799 () Bool)

(assert (=> b!1257246 (= e!714895 call!61799)))

(declare-fun b!1257247 () Bool)

(assert (=> b!1257247 (= e!714895 call!61799)))

(declare-fun b!1257248 () Bool)

(declare-fun e!714893 () Bool)

(assert (=> b!1257248 (= e!714893 e!714895)))

(declare-fun c!122455 () Bool)

(assert (=> b!1257248 (= c!122455 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257249 () Bool)

(declare-fun e!714894 () Bool)

(assert (=> b!1257249 (= e!714894 e!714893)))

(declare-fun res!838107 () Bool)

(assert (=> b!1257249 (=> (not res!838107) (not e!714893))))

(declare-fun e!714892 () Bool)

(assert (=> b!1257249 (= res!838107 (not e!714892))))

(declare-fun res!838106 () Bool)

(assert (=> b!1257249 (=> (not res!838106) (not e!714892))))

(assert (=> b!1257249 (= res!838106 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257250 () Bool)

(declare-fun contains!7540 (List!28081 (_ BitVec 64)) Bool)

(assert (=> b!1257250 (= e!714892 (contains!7540 Nil!28078 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61796 () Bool)

(assert (=> bm!61796 (= call!61799 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122455 (Cons!28077 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000) Nil!28078) Nil!28078)))))

(declare-fun d!138113 () Bool)

(declare-fun res!838105 () Bool)

(assert (=> d!138113 (=> res!838105 e!714894)))

(assert (=> d!138113 (= res!838105 (bvsge #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> d!138113 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28078) e!714894)))

(assert (= (and d!138113 (not res!838105)) b!1257249))

(assert (= (and b!1257249 res!838106) b!1257250))

(assert (= (and b!1257249 res!838107) b!1257248))

(assert (= (and b!1257248 c!122455) b!1257246))

(assert (= (and b!1257248 (not c!122455)) b!1257247))

(assert (= (or b!1257246 b!1257247) bm!61796))

(assert (=> b!1257248 m!1157371))

(assert (=> b!1257248 m!1157371))

(assert (=> b!1257248 m!1157373))

(assert (=> b!1257249 m!1157371))

(assert (=> b!1257249 m!1157371))

(assert (=> b!1257249 m!1157373))

(assert (=> b!1257250 m!1157371))

(assert (=> b!1257250 m!1157371))

(declare-fun m!1157437 () Bool)

(assert (=> b!1257250 m!1157437))

(assert (=> bm!61796 m!1157371))

(declare-fun m!1157439 () Bool)

(assert (=> bm!61796 m!1157439))

(assert (=> b!1257118 d!138113))

(declare-fun d!138115 () Bool)

(declare-fun e!714900 () Bool)

(assert (=> d!138115 e!714900))

(declare-fun res!838110 () Bool)

(assert (=> d!138115 (=> res!838110 e!714900)))

(declare-fun lt!568485 () Bool)

(assert (=> d!138115 (= res!838110 (not lt!568485))))

(declare-fun lt!568483 () Bool)

(assert (=> d!138115 (= lt!568485 lt!568483)))

(declare-fun lt!568486 () Unit!41733)

(declare-fun e!714901 () Unit!41733)

(assert (=> d!138115 (= lt!568486 e!714901)))

(declare-fun c!122458 () Bool)

(assert (=> d!138115 (= c!122458 lt!568483)))

(declare-fun containsKey!619 (List!28080 (_ BitVec 64)) Bool)

(assert (=> d!138115 (= lt!568483 (containsKey!619 (toList!9388 lt!568395) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138115 (= (contains!7538 lt!568395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568485)))

(declare-fun b!1257257 () Bool)

(declare-fun lt!568484 () Unit!41733)

(assert (=> b!1257257 (= e!714901 lt!568484)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!429 (List!28080 (_ BitVec 64)) Unit!41733)

(assert (=> b!1257257 (= lt!568484 (lemmaContainsKeyImpliesGetValueByKeyDefined!429 (toList!9388 lt!568395) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!710 0))(
  ( (Some!709 (v!18795 V!48111)) (None!708) )
))
(declare-fun isDefined!472 (Option!710) Bool)

(declare-fun getValueByKey!659 (List!28080 (_ BitVec 64)) Option!710)

(assert (=> b!1257257 (isDefined!472 (getValueByKey!659 (toList!9388 lt!568395) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257258 () Bool)

(declare-fun Unit!41739 () Unit!41733)

(assert (=> b!1257258 (= e!714901 Unit!41739)))

(declare-fun b!1257259 () Bool)

(assert (=> b!1257259 (= e!714900 (isDefined!472 (getValueByKey!659 (toList!9388 lt!568395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138115 c!122458) b!1257257))

(assert (= (and d!138115 (not c!122458)) b!1257258))

(assert (= (and d!138115 (not res!838110)) b!1257259))

(declare-fun m!1157441 () Bool)

(assert (=> d!138115 m!1157441))

(declare-fun m!1157443 () Bool)

(assert (=> b!1257257 m!1157443))

(declare-fun m!1157445 () Bool)

(assert (=> b!1257257 m!1157445))

(assert (=> b!1257257 m!1157445))

(declare-fun m!1157447 () Bool)

(assert (=> b!1257257 m!1157447))

(assert (=> b!1257259 m!1157445))

(assert (=> b!1257259 m!1157445))

(assert (=> b!1257259 m!1157447))

(assert (=> b!1257116 d!138115))

(declare-fun b!1257302 () Bool)

(declare-fun e!714934 () Bool)

(declare-fun lt!568542 () ListLongMap!18745)

(assert (=> b!1257302 (= e!714934 (= (apply!982 lt!568542 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1257303 () Bool)

(declare-fun e!714930 () ListLongMap!18745)

(declare-fun call!61816 () ListLongMap!18745)

(assert (=> b!1257303 (= e!714930 (+!4227 call!61816 (tuple2!20873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1257304 () Bool)

(declare-fun e!714933 () Bool)

(declare-fun e!714935 () Bool)

(assert (=> b!1257304 (= e!714933 e!714935)))

(declare-fun c!122474 () Bool)

(assert (=> b!1257304 (= c!122474 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257305 () Bool)

(declare-fun e!714932 () Bool)

(assert (=> b!1257305 (= e!714932 e!714934)))

(declare-fun res!838129 () Bool)

(declare-fun call!61819 () Bool)

(assert (=> b!1257305 (= res!838129 call!61819)))

(assert (=> b!1257305 (=> (not res!838129) (not e!714934))))

(declare-fun b!1257306 () Bool)

(declare-fun e!714931 () Bool)

(assert (=> b!1257306 (= e!714931 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61811 () Bool)

(declare-fun call!61818 () Bool)

(assert (=> bm!61811 (= call!61818 (contains!7538 lt!568542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!61817 () ListLongMap!18745)

(declare-fun bm!61812 () Bool)

(declare-fun c!122473 () Bool)

(declare-fun call!61814 () ListLongMap!18745)

(declare-fun call!61815 () ListLongMap!18745)

(declare-fun c!122472 () Bool)

(assert (=> bm!61812 (= call!61816 (+!4227 (ite c!122473 call!61817 (ite c!122472 call!61815 call!61814)) (ite (or c!122473 c!122472) (tuple2!20873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1257307 () Bool)

(declare-fun e!714929 () Unit!41733)

(declare-fun lt!568546 () Unit!41733)

(assert (=> b!1257307 (= e!714929 lt!568546)))

(declare-fun lt!568533 () ListLongMap!18745)

(assert (=> b!1257307 (= lt!568533 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568548 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568540 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568540 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568552 () Unit!41733)

(declare-fun addStillContains!1081 (ListLongMap!18745 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41733)

(assert (=> b!1257307 (= lt!568552 (addStillContains!1081 lt!568533 lt!568548 zeroValue!871 lt!568540))))

(assert (=> b!1257307 (contains!7538 (+!4227 lt!568533 (tuple2!20873 lt!568548 zeroValue!871)) lt!568540)))

(declare-fun lt!568547 () Unit!41733)

(assert (=> b!1257307 (= lt!568547 lt!568552)))

(declare-fun lt!568551 () ListLongMap!18745)

(assert (=> b!1257307 (= lt!568551 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568545 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568545 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568543 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568543 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568537 () Unit!41733)

(declare-fun addApplyDifferent!524 (ListLongMap!18745 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41733)

(assert (=> b!1257307 (= lt!568537 (addApplyDifferent!524 lt!568551 lt!568545 minValueBefore!43 lt!568543))))

(assert (=> b!1257307 (= (apply!982 (+!4227 lt!568551 (tuple2!20873 lt!568545 minValueBefore!43)) lt!568543) (apply!982 lt!568551 lt!568543))))

(declare-fun lt!568535 () Unit!41733)

(assert (=> b!1257307 (= lt!568535 lt!568537)))

(declare-fun lt!568531 () ListLongMap!18745)

(assert (=> b!1257307 (= lt!568531 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568532 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568550 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568550 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568544 () Unit!41733)

(assert (=> b!1257307 (= lt!568544 (addApplyDifferent!524 lt!568531 lt!568532 zeroValue!871 lt!568550))))

(assert (=> b!1257307 (= (apply!982 (+!4227 lt!568531 (tuple2!20873 lt!568532 zeroValue!871)) lt!568550) (apply!982 lt!568531 lt!568550))))

(declare-fun lt!568549 () Unit!41733)

(assert (=> b!1257307 (= lt!568549 lt!568544)))

(declare-fun lt!568536 () ListLongMap!18745)

(assert (=> b!1257307 (= lt!568536 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568541 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568541 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568539 () (_ BitVec 64))

(assert (=> b!1257307 (= lt!568539 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1257307 (= lt!568546 (addApplyDifferent!524 lt!568536 lt!568541 minValueBefore!43 lt!568539))))

(assert (=> b!1257307 (= (apply!982 (+!4227 lt!568536 (tuple2!20873 lt!568541 minValueBefore!43)) lt!568539) (apply!982 lt!568536 lt!568539))))

(declare-fun b!1257308 () Bool)

(declare-fun e!714939 () ListLongMap!18745)

(declare-fun call!61820 () ListLongMap!18745)

(assert (=> b!1257308 (= e!714939 call!61820)))

(declare-fun b!1257309 () Bool)

(declare-fun e!714937 () Bool)

(assert (=> b!1257309 (= e!714935 e!714937)))

(declare-fun res!838130 () Bool)

(assert (=> b!1257309 (= res!838130 call!61818)))

(assert (=> b!1257309 (=> (not res!838130) (not e!714937))))

(declare-fun e!714928 () Bool)

(declare-fun b!1257310 () Bool)

(assert (=> b!1257310 (= e!714928 (= (apply!982 lt!568542 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)) (get!20161 (select (arr!39398 _values!914) #b00000000000000000000000000000000) (dynLambda!3412 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1257310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39936 _values!914)))))

(assert (=> b!1257310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun bm!61813 () Bool)

(assert (=> bm!61813 (= call!61819 (contains!7538 lt!568542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61814 () Bool)

(assert (=> bm!61814 (= call!61817 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257312 () Bool)

(declare-fun c!122476 () Bool)

(assert (=> b!1257312 (= c!122476 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!714936 () ListLongMap!18745)

(assert (=> b!1257312 (= e!714936 e!714939)))

(declare-fun b!1257313 () Bool)

(declare-fun res!838136 () Bool)

(assert (=> b!1257313 (=> (not res!838136) (not e!714933))))

(declare-fun e!714940 () Bool)

(assert (=> b!1257313 (= res!838136 e!714940)))

(declare-fun res!838135 () Bool)

(assert (=> b!1257313 (=> res!838135 e!714940)))

(declare-fun e!714938 () Bool)

(assert (=> b!1257313 (= res!838135 (not e!714938))))

(declare-fun res!838134 () Bool)

(assert (=> b!1257313 (=> (not res!838134) (not e!714938))))

(assert (=> b!1257313 (= res!838134 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun bm!61815 () Bool)

(assert (=> bm!61815 (= call!61820 call!61816)))

(declare-fun b!1257314 () Bool)

(assert (=> b!1257314 (= e!714939 call!61814)))

(declare-fun bm!61816 () Bool)

(assert (=> bm!61816 (= call!61814 call!61815)))

(declare-fun b!1257315 () Bool)

(assert (=> b!1257315 (= e!714940 e!714928)))

(declare-fun res!838132 () Bool)

(assert (=> b!1257315 (=> (not res!838132) (not e!714928))))

(assert (=> b!1257315 (= res!838132 (contains!7538 lt!568542 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257315 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(declare-fun b!1257316 () Bool)

(assert (=> b!1257316 (= e!714938 (validKeyInArray!0 (select (arr!39397 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257317 () Bool)

(declare-fun res!838137 () Bool)

(assert (=> b!1257317 (=> (not res!838137) (not e!714933))))

(assert (=> b!1257317 (= res!838137 e!714932)))

(declare-fun c!122475 () Bool)

(assert (=> b!1257317 (= c!122475 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1257318 () Bool)

(declare-fun Unit!41740 () Unit!41733)

(assert (=> b!1257318 (= e!714929 Unit!41740)))

(declare-fun bm!61817 () Bool)

(assert (=> bm!61817 (= call!61815 call!61817)))

(declare-fun b!1257319 () Bool)

(assert (=> b!1257319 (= e!714932 (not call!61819))))

(declare-fun b!1257320 () Bool)

(assert (=> b!1257320 (= e!714930 e!714936)))

(assert (=> b!1257320 (= c!122472 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257321 () Bool)

(assert (=> b!1257321 (= e!714935 (not call!61818))))

(declare-fun b!1257322 () Bool)

(assert (=> b!1257322 (= e!714936 call!61820)))

(declare-fun d!138117 () Bool)

(assert (=> d!138117 e!714933))

(declare-fun res!838133 () Bool)

(assert (=> d!138117 (=> (not res!838133) (not e!714933))))

(assert (=> d!138117 (= res!838133 (or (bvsge #b00000000000000000000000000000000 (size!39935 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))))

(declare-fun lt!568534 () ListLongMap!18745)

(assert (=> d!138117 (= lt!568542 lt!568534)))

(declare-fun lt!568538 () Unit!41733)

(assert (=> d!138117 (= lt!568538 e!714929)))

(declare-fun c!122471 () Bool)

(assert (=> d!138117 (= c!122471 e!714931)))

(declare-fun res!838131 () Bool)

(assert (=> d!138117 (=> (not res!838131) (not e!714931))))

(assert (=> d!138117 (= res!838131 (bvslt #b00000000000000000000000000000000 (size!39935 _keys!1118)))))

(assert (=> d!138117 (= lt!568534 e!714930)))

(assert (=> d!138117 (= c!122473 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138117 (validMask!0 mask!1466)))

(assert (=> d!138117 (= (getCurrentListMap!4497 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568542)))

(declare-fun b!1257311 () Bool)

(assert (=> b!1257311 (= e!714937 (= (apply!982 lt!568542 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(assert (= (and d!138117 c!122473) b!1257303))

(assert (= (and d!138117 (not c!122473)) b!1257320))

(assert (= (and b!1257320 c!122472) b!1257322))

(assert (= (and b!1257320 (not c!122472)) b!1257312))

(assert (= (and b!1257312 c!122476) b!1257308))

(assert (= (and b!1257312 (not c!122476)) b!1257314))

(assert (= (or b!1257308 b!1257314) bm!61816))

(assert (= (or b!1257322 bm!61816) bm!61817))

(assert (= (or b!1257322 b!1257308) bm!61815))

(assert (= (or b!1257303 bm!61817) bm!61814))

(assert (= (or b!1257303 bm!61815) bm!61812))

(assert (= (and d!138117 res!838131) b!1257306))

(assert (= (and d!138117 c!122471) b!1257307))

(assert (= (and d!138117 (not c!122471)) b!1257318))

(assert (= (and d!138117 res!838133) b!1257313))

(assert (= (and b!1257313 res!838134) b!1257316))

(assert (= (and b!1257313 (not res!838135)) b!1257315))

(assert (= (and b!1257315 res!838132) b!1257310))

(assert (= (and b!1257313 res!838136) b!1257317))

(assert (= (and b!1257317 c!122475) b!1257305))

(assert (= (and b!1257317 (not c!122475)) b!1257319))

(assert (= (and b!1257305 res!838129) b!1257302))

(assert (= (or b!1257305 b!1257319) bm!61813))

(assert (= (and b!1257317 res!838137) b!1257304))

(assert (= (and b!1257304 c!122474) b!1257309))

(assert (= (and b!1257304 (not c!122474)) b!1257321))

(assert (= (and b!1257309 res!838130) b!1257311))

(assert (= (or b!1257309 b!1257321) bm!61811))

(declare-fun b_lambda!22685 () Bool)

(assert (=> (not b_lambda!22685) (not b!1257310)))

(assert (=> b!1257310 t!41567))

(declare-fun b_and!45009 () Bool)

(assert (= b_and!45007 (and (=> t!41567 result!23315) b_and!45009)))

(declare-fun m!1157449 () Bool)

(assert (=> bm!61813 m!1157449))

(assert (=> bm!61814 m!1157303))

(declare-fun m!1157451 () Bool)

(assert (=> b!1257302 m!1157451))

(declare-fun m!1157453 () Bool)

(assert (=> bm!61812 m!1157453))

(declare-fun m!1157455 () Bool)

(assert (=> b!1257307 m!1157455))

(assert (=> b!1257307 m!1157455))

(declare-fun m!1157457 () Bool)

(assert (=> b!1257307 m!1157457))

(assert (=> b!1257307 m!1157371))

(declare-fun m!1157459 () Bool)

(assert (=> b!1257307 m!1157459))

(assert (=> b!1257307 m!1157303))

(declare-fun m!1157461 () Bool)

(assert (=> b!1257307 m!1157461))

(assert (=> b!1257307 m!1157459))

(declare-fun m!1157463 () Bool)

(assert (=> b!1257307 m!1157463))

(declare-fun m!1157465 () Bool)

(assert (=> b!1257307 m!1157465))

(declare-fun m!1157467 () Bool)

(assert (=> b!1257307 m!1157467))

(declare-fun m!1157469 () Bool)

(assert (=> b!1257307 m!1157469))

(declare-fun m!1157471 () Bool)

(assert (=> b!1257307 m!1157471))

(declare-fun m!1157473 () Bool)

(assert (=> b!1257307 m!1157473))

(declare-fun m!1157475 () Bool)

(assert (=> b!1257307 m!1157475))

(declare-fun m!1157477 () Bool)

(assert (=> b!1257307 m!1157477))

(declare-fun m!1157479 () Bool)

(assert (=> b!1257307 m!1157479))

(assert (=> b!1257307 m!1157473))

(declare-fun m!1157481 () Bool)

(assert (=> b!1257307 m!1157481))

(assert (=> b!1257307 m!1157467))

(declare-fun m!1157483 () Bool)

(assert (=> b!1257307 m!1157483))

(declare-fun m!1157485 () Bool)

(assert (=> b!1257311 m!1157485))

(assert (=> d!138117 m!1157313))

(declare-fun m!1157487 () Bool)

(assert (=> bm!61811 m!1157487))

(assert (=> b!1257310 m!1157371))

(assert (=> b!1257310 m!1157393))

(assert (=> b!1257310 m!1157371))

(declare-fun m!1157489 () Bool)

(assert (=> b!1257310 m!1157489))

(assert (=> b!1257310 m!1157393))

(assert (=> b!1257310 m!1157395))

(assert (=> b!1257310 m!1157397))

(assert (=> b!1257310 m!1157395))

(declare-fun m!1157491 () Bool)

(assert (=> b!1257303 m!1157491))

(assert (=> b!1257315 m!1157371))

(assert (=> b!1257315 m!1157371))

(declare-fun m!1157493 () Bool)

(assert (=> b!1257315 m!1157493))

(assert (=> b!1257306 m!1157371))

(assert (=> b!1257306 m!1157371))

(assert (=> b!1257306 m!1157373))

(assert (=> b!1257316 m!1157371))

(assert (=> b!1257316 m!1157371))

(assert (=> b!1257316 m!1157373))

(assert (=> b!1257116 d!138117))

(declare-fun condMapEmpty!49885 () Bool)

(declare-fun mapDefault!49885 () ValueCell!15266)

(assert (=> mapNonEmpty!49876 (= condMapEmpty!49885 (= mapRest!49876 ((as const (Array (_ BitVec 32) ValueCell!15266)) mapDefault!49885)))))

(declare-fun e!714945 () Bool)

(declare-fun mapRes!49885 () Bool)

(assert (=> mapNonEmpty!49876 (= tp!94987 (and e!714945 mapRes!49885))))

(declare-fun b!1257329 () Bool)

(declare-fun e!714946 () Bool)

(assert (=> b!1257329 (= e!714946 tp_is_empty!32059)))

(declare-fun b!1257330 () Bool)

(assert (=> b!1257330 (= e!714945 tp_is_empty!32059)))

(declare-fun mapNonEmpty!49885 () Bool)

(declare-fun tp!95003 () Bool)

(assert (=> mapNonEmpty!49885 (= mapRes!49885 (and tp!95003 e!714946))))

(declare-fun mapRest!49885 () (Array (_ BitVec 32) ValueCell!15266))

(declare-fun mapKey!49885 () (_ BitVec 32))

(declare-fun mapValue!49885 () ValueCell!15266)

(assert (=> mapNonEmpty!49885 (= mapRest!49876 (store mapRest!49885 mapKey!49885 mapValue!49885))))

(declare-fun mapIsEmpty!49885 () Bool)

(assert (=> mapIsEmpty!49885 mapRes!49885))

(assert (= (and mapNonEmpty!49876 condMapEmpty!49885) mapIsEmpty!49885))

(assert (= (and mapNonEmpty!49876 (not condMapEmpty!49885)) mapNonEmpty!49885))

(assert (= (and mapNonEmpty!49885 ((_ is ValueCellFull!15266) mapValue!49885)) b!1257329))

(assert (= (and mapNonEmpty!49876 ((_ is ValueCellFull!15266) mapDefault!49885)) b!1257330))

(declare-fun m!1157495 () Bool)

(assert (=> mapNonEmpty!49885 m!1157495))

(declare-fun b_lambda!22687 () Bool)

(assert (= b_lambda!22685 (or (and start!105516 b_free!27157) b_lambda!22687)))

(declare-fun b_lambda!22689 () Bool)

(assert (= b_lambda!22677 (or (and start!105516 b_free!27157) b_lambda!22689)))

(declare-fun b_lambda!22691 () Bool)

(assert (= b_lambda!22679 (or (and start!105516 b_free!27157) b_lambda!22691)))

(declare-fun b_lambda!22693 () Bool)

(assert (= b_lambda!22681 (or (and start!105516 b_free!27157) b_lambda!22693)))

(declare-fun b_lambda!22695 () Bool)

(assert (= b_lambda!22683 (or (and start!105516 b_free!27157) b_lambda!22695)))

(check-sat (not b!1257216) (not b!1257219) (not d!138115) (not mapNonEmpty!49885) (not b!1257228) b_and!45009 (not bm!61813) (not d!138099) (not b!1257303) (not bm!61789) (not b!1257257) (not b!1257230) (not b!1257185) (not d!138117) (not b!1257235) (not b!1257311) (not b!1257210) (not b_lambda!22693) (not b_lambda!22691) (not bm!61811) (not b!1257316) (not d!138103) (not b!1257225) (not d!138105) (not b!1257211) (not b!1257307) (not b!1257248) (not b_lambda!22695) tp_is_empty!32059 (not bm!61792) (not b!1257259) (not bm!61812) (not bm!61796) (not b!1257310) (not b!1257302) (not bm!61793) (not b!1257249) (not d!138101) (not b_next!27157) (not b!1257221) (not b!1257214) (not b!1257218) (not b!1257233) (not b!1257315) (not d!138097) (not b_lambda!22687) (not b!1257227) (not b!1257224) (not b!1257213) (not b!1257306) (not b!1257184) (not b!1257232) (not b!1257250) (not bm!61814) (not b_lambda!22689))
(check-sat b_and!45009 (not b_next!27157))
