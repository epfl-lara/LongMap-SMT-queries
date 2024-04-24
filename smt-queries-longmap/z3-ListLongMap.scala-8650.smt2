; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105442 () Bool)

(assert start!105442)

(declare-fun b_free!26935 () Bool)

(declare-fun b_next!26935 () Bool)

(assert (=> start!105442 (= b_free!26935 (not b_next!26935))))

(declare-fun tp!94309 () Bool)

(declare-fun b_and!44751 () Bool)

(assert (=> start!105442 (= tp!94309 b_and!44751)))

(declare-fun b!1255152 () Bool)

(declare-fun res!836605 () Bool)

(declare-fun e!713232 () Bool)

(assert (=> b!1255152 (=> (not res!836605) (not e!713232))))

(declare-datatypes ((array!81375 0))(
  ( (array!81376 (arr!39245 (Array (_ BitVec 32) (_ BitVec 64))) (size!39782 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81375)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81375 (_ BitVec 32)) Bool)

(assert (=> b!1255152 (= res!836605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255153 () Bool)

(declare-fun e!713230 () Bool)

(declare-fun tp_is_empty!31837 () Bool)

(assert (=> b!1255153 (= e!713230 tp_is_empty!31837)))

(declare-fun b!1255154 () Bool)

(declare-fun e!713231 () Bool)

(assert (=> b!1255154 (= e!713232 (not e!713231))))

(declare-fun res!836604 () Bool)

(assert (=> b!1255154 (=> res!836604 e!713231)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255154 (= res!836604 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47815 0))(
  ( (V!47816 (val!15981 Int)) )
))
(declare-datatypes ((tuple2!20648 0))(
  ( (tuple2!20649 (_1!10335 (_ BitVec 64)) (_2!10335 V!47815)) )
))
(declare-datatypes ((List!27887 0))(
  ( (Nil!27884) (Cons!27883 (h!29101 tuple2!20648) (t!41360 List!27887)) )
))
(declare-datatypes ((ListLongMap!18529 0))(
  ( (ListLongMap!18530 (toList!9280 List!27887)) )
))
(declare-fun lt!566861 () ListLongMap!18529)

(declare-fun lt!566862 () ListLongMap!18529)

(assert (=> b!1255154 (= lt!566861 lt!566862)))

(declare-fun minValueAfter!43 () V!47815)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47815)

(declare-datatypes ((ValueCell!15155 0))(
  ( (ValueCellFull!15155 (v!18675 V!47815)) (EmptyCell!15155) )
))
(declare-datatypes ((array!81377 0))(
  ( (array!81378 (arr!39246 (Array (_ BitVec 32) ValueCell!15155)) (size!39783 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81377)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueBefore!43 () V!47815)

(declare-datatypes ((Unit!41697 0))(
  ( (Unit!41698) )
))
(declare-fun lt!566863 () Unit!41697)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1019 (array!81375 array!81377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 V!47815 V!47815 (_ BitVec 32) Int) Unit!41697)

(assert (=> b!1255154 (= lt!566863 (lemmaNoChangeToArrayThenSameMapNoExtras!1019 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5705 (array!81375 array!81377 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1255154 (= lt!566862 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255154 (= lt!566861 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49531 () Bool)

(declare-fun mapRes!49531 () Bool)

(declare-fun tp!94310 () Bool)

(declare-fun e!713228 () Bool)

(assert (=> mapNonEmpty!49531 (= mapRes!49531 (and tp!94310 e!713228))))

(declare-fun mapKey!49531 () (_ BitVec 32))

(declare-fun mapRest!49531 () (Array (_ BitVec 32) ValueCell!15155))

(declare-fun mapValue!49531 () ValueCell!15155)

(assert (=> mapNonEmpty!49531 (= (arr!39246 _values!914) (store mapRest!49531 mapKey!49531 mapValue!49531))))

(declare-fun res!836606 () Bool)

(assert (=> start!105442 (=> (not res!836606) (not e!713232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105442 (= res!836606 (validMask!0 mask!1466))))

(assert (=> start!105442 e!713232))

(assert (=> start!105442 true))

(assert (=> start!105442 tp!94309))

(assert (=> start!105442 tp_is_empty!31837))

(declare-fun array_inv!30037 (array!81375) Bool)

(assert (=> start!105442 (array_inv!30037 _keys!1118)))

(declare-fun e!713227 () Bool)

(declare-fun array_inv!30038 (array!81377) Bool)

(assert (=> start!105442 (and (array_inv!30038 _values!914) e!713227)))

(declare-fun b!1255155 () Bool)

(declare-fun res!836607 () Bool)

(assert (=> b!1255155 (=> (not res!836607) (not e!713232))))

(declare-datatypes ((List!27888 0))(
  ( (Nil!27885) (Cons!27884 (h!29102 (_ BitVec 64)) (t!41361 List!27888)) )
))
(declare-fun arrayNoDuplicates!0 (array!81375 (_ BitVec 32) List!27888) Bool)

(assert (=> b!1255155 (= res!836607 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27885))))

(declare-fun b!1255156 () Bool)

(declare-fun res!836603 () Bool)

(assert (=> b!1255156 (=> (not res!836603) (not e!713232))))

(assert (=> b!1255156 (= res!836603 (and (= (size!39783 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39782 _keys!1118) (size!39783 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255157 () Bool)

(assert (=> b!1255157 (= e!713228 tp_is_empty!31837)))

(declare-fun b!1255158 () Bool)

(assert (=> b!1255158 (= e!713227 (and e!713230 mapRes!49531))))

(declare-fun condMapEmpty!49531 () Bool)

(declare-fun mapDefault!49531 () ValueCell!15155)

(assert (=> b!1255158 (= condMapEmpty!49531 (= (arr!39246 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15155)) mapDefault!49531)))))

(declare-fun b!1255159 () Bool)

(declare-fun e!713229 () Bool)

(assert (=> b!1255159 (= e!713231 e!713229)))

(declare-fun res!836602 () Bool)

(assert (=> b!1255159 (=> res!836602 e!713229)))

(declare-fun lt!566858 () ListLongMap!18529)

(declare-fun lt!566857 () ListLongMap!18529)

(declare-fun -!2020 (ListLongMap!18529 (_ BitVec 64)) ListLongMap!18529)

(assert (=> b!1255159 (= res!836602 (not (= (-!2020 lt!566858 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566857)))))

(declare-fun lt!566860 () ListLongMap!18529)

(assert (=> b!1255159 (= (-!2020 lt!566860 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566861)))

(declare-fun lt!566859 () Unit!41697)

(declare-fun addThenRemoveForNewKeyIsSame!310 (ListLongMap!18529 (_ BitVec 64) V!47815) Unit!41697)

(assert (=> b!1255159 (= lt!566859 (addThenRemoveForNewKeyIsSame!310 lt!566861 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1255159 (and (= lt!566858 lt!566860) (= lt!566857 lt!566862))))

(declare-fun +!4216 (ListLongMap!18529 tuple2!20648) ListLongMap!18529)

(assert (=> b!1255159 (= lt!566860 (+!4216 lt!566861 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4513 (array!81375 array!81377 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18529)

(assert (=> b!1255159 (= lt!566857 (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255159 (= lt!566858 (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255160 () Bool)

(assert (=> b!1255160 (= e!713229 (bvsle #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun mapIsEmpty!49531 () Bool)

(assert (=> mapIsEmpty!49531 mapRes!49531))

(assert (= (and start!105442 res!836606) b!1255156))

(assert (= (and b!1255156 res!836603) b!1255152))

(assert (= (and b!1255152 res!836605) b!1255155))

(assert (= (and b!1255155 res!836607) b!1255154))

(assert (= (and b!1255154 (not res!836604)) b!1255159))

(assert (= (and b!1255159 (not res!836602)) b!1255160))

(assert (= (and b!1255158 condMapEmpty!49531) mapIsEmpty!49531))

(assert (= (and b!1255158 (not condMapEmpty!49531)) mapNonEmpty!49531))

(get-info :version)

(assert (= (and mapNonEmpty!49531 ((_ is ValueCellFull!15155) mapValue!49531)) b!1255157))

(assert (= (and b!1255158 ((_ is ValueCellFull!15155) mapDefault!49531)) b!1255153))

(assert (= start!105442 b!1255158))

(declare-fun m!1156087 () Bool)

(assert (=> start!105442 m!1156087))

(declare-fun m!1156089 () Bool)

(assert (=> start!105442 m!1156089))

(declare-fun m!1156091 () Bool)

(assert (=> start!105442 m!1156091))

(declare-fun m!1156093 () Bool)

(assert (=> b!1255155 m!1156093))

(declare-fun m!1156095 () Bool)

(assert (=> b!1255159 m!1156095))

(declare-fun m!1156097 () Bool)

(assert (=> b!1255159 m!1156097))

(declare-fun m!1156099 () Bool)

(assert (=> b!1255159 m!1156099))

(declare-fun m!1156101 () Bool)

(assert (=> b!1255159 m!1156101))

(declare-fun m!1156103 () Bool)

(assert (=> b!1255159 m!1156103))

(declare-fun m!1156105 () Bool)

(assert (=> b!1255159 m!1156105))

(declare-fun m!1156107 () Bool)

(assert (=> b!1255152 m!1156107))

(declare-fun m!1156109 () Bool)

(assert (=> b!1255154 m!1156109))

(declare-fun m!1156111 () Bool)

(assert (=> b!1255154 m!1156111))

(declare-fun m!1156113 () Bool)

(assert (=> b!1255154 m!1156113))

(declare-fun m!1156115 () Bool)

(assert (=> mapNonEmpty!49531 m!1156115))

(check-sat tp_is_empty!31837 b_and!44751 (not b!1255154) (not b_next!26935) (not mapNonEmpty!49531) (not b!1255155) (not start!105442) (not b!1255152) (not b!1255159))
(check-sat b_and!44751 (not b_next!26935))
(get-model)

(declare-fun d!138505 () Bool)

(assert (=> d!138505 (= (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566908 () Unit!41697)

(declare-fun choose!1857 (array!81375 array!81377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 V!47815 V!47815 (_ BitVec 32) Int) Unit!41697)

(assert (=> d!138505 (= lt!566908 (choose!1857 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138505 (validMask!0 mask!1466)))

(assert (=> d!138505 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1019 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566908)))

(declare-fun bs!35442 () Bool)

(assert (= bs!35442 d!138505))

(assert (=> bs!35442 m!1156113))

(assert (=> bs!35442 m!1156111))

(declare-fun m!1156177 () Bool)

(assert (=> bs!35442 m!1156177))

(assert (=> bs!35442 m!1156087))

(assert (=> b!1255154 d!138505))

(declare-fun b!1255239 () Bool)

(declare-fun e!713291 () Bool)

(declare-fun e!713292 () Bool)

(assert (=> b!1255239 (= e!713291 e!713292)))

(declare-fun c!122704 () Bool)

(declare-fun e!713295 () Bool)

(assert (=> b!1255239 (= c!122704 e!713295)))

(declare-fun res!836655 () Bool)

(assert (=> b!1255239 (=> (not res!836655) (not e!713295))))

(assert (=> b!1255239 (= res!836655 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun b!1255240 () Bool)

(declare-fun e!713290 () ListLongMap!18529)

(declare-fun e!713296 () ListLongMap!18529)

(assert (=> b!1255240 (= e!713290 e!713296)))

(declare-fun c!122706 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1255240 (= c!122706 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61756 () Bool)

(declare-fun call!61759 () ListLongMap!18529)

(assert (=> bm!61756 (= call!61759 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1255241 () Bool)

(declare-fun e!713294 () Bool)

(assert (=> b!1255241 (= e!713292 e!713294)))

(assert (=> b!1255241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun res!836652 () Bool)

(declare-fun lt!566928 () ListLongMap!18529)

(declare-fun contains!7548 (ListLongMap!18529 (_ BitVec 64)) Bool)

(assert (=> b!1255241 (= res!836652 (contains!7548 lt!566928 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255241 (=> (not res!836652) (not e!713294))))

(declare-fun b!1255242 () Bool)

(declare-fun lt!566926 () Unit!41697)

(declare-fun lt!566927 () Unit!41697)

(assert (=> b!1255242 (= lt!566926 lt!566927)))

(declare-fun lt!566929 () ListLongMap!18529)

(declare-fun lt!566923 () (_ BitVec 64))

(declare-fun lt!566925 () (_ BitVec 64))

(declare-fun lt!566924 () V!47815)

(assert (=> b!1255242 (not (contains!7548 (+!4216 lt!566929 (tuple2!20649 lt!566923 lt!566924)) lt!566925))))

(declare-fun addStillNotContains!315 (ListLongMap!18529 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41697)

(assert (=> b!1255242 (= lt!566927 (addStillNotContains!315 lt!566929 lt!566923 lt!566924 lt!566925))))

(assert (=> b!1255242 (= lt!566925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20133 (ValueCell!15155 V!47815) V!47815)

(declare-fun dynLambda!3446 (Int (_ BitVec 64)) V!47815)

(assert (=> b!1255242 (= lt!566924 (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255242 (= lt!566923 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255242 (= lt!566929 call!61759)))

(assert (=> b!1255242 (= e!713296 (+!4216 call!61759 (tuple2!20649 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255243 () Bool)

(assert (=> b!1255243 (= e!713296 call!61759)))

(declare-fun b!1255244 () Bool)

(assert (=> b!1255244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> b!1255244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39783 _values!914)))))

(declare-fun apply!994 (ListLongMap!18529 (_ BitVec 64)) V!47815)

(assert (=> b!1255244 (= e!713294 (= (apply!994 lt!566928 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138507 () Bool)

(assert (=> d!138507 e!713291))

(declare-fun res!836653 () Bool)

(assert (=> d!138507 (=> (not res!836653) (not e!713291))))

(assert (=> d!138507 (= res!836653 (not (contains!7548 lt!566928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138507 (= lt!566928 e!713290)))

(declare-fun c!122703 () Bool)

(assert (=> d!138507 (= c!122703 (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138507 (validMask!0 mask!1466)))

(assert (=> d!138507 (= (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566928)))

(declare-fun b!1255245 () Bool)

(declare-fun e!713293 () Bool)

(assert (=> b!1255245 (= e!713293 (= lt!566928 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255246 () Bool)

(assert (=> b!1255246 (= e!713292 e!713293)))

(declare-fun c!122705 () Bool)

(assert (=> b!1255246 (= c!122705 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun b!1255247 () Bool)

(declare-fun isEmpty!1031 (ListLongMap!18529) Bool)

(assert (=> b!1255247 (= e!713293 (isEmpty!1031 lt!566928))))

(declare-fun b!1255248 () Bool)

(assert (=> b!1255248 (= e!713290 (ListLongMap!18530 Nil!27884))))

(declare-fun b!1255249 () Bool)

(declare-fun res!836654 () Bool)

(assert (=> b!1255249 (=> (not res!836654) (not e!713291))))

(assert (=> b!1255249 (= res!836654 (not (contains!7548 lt!566928 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255250 () Bool)

(assert (=> b!1255250 (= e!713295 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255250 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138507 c!122703) b!1255248))

(assert (= (and d!138507 (not c!122703)) b!1255240))

(assert (= (and b!1255240 c!122706) b!1255242))

(assert (= (and b!1255240 (not c!122706)) b!1255243))

(assert (= (or b!1255242 b!1255243) bm!61756))

(assert (= (and d!138507 res!836653) b!1255249))

(assert (= (and b!1255249 res!836654) b!1255239))

(assert (= (and b!1255239 res!836655) b!1255250))

(assert (= (and b!1255239 c!122704) b!1255241))

(assert (= (and b!1255239 (not c!122704)) b!1255246))

(assert (= (and b!1255241 res!836652) b!1255244))

(assert (= (and b!1255246 c!122705) b!1255245))

(assert (= (and b!1255246 (not c!122705)) b!1255247))

(declare-fun b_lambda!22597 () Bool)

(assert (=> (not b_lambda!22597) (not b!1255242)))

(declare-fun t!41366 () Bool)

(declare-fun tb!11289 () Bool)

(assert (=> (and start!105442 (= defaultEntry!922 defaultEntry!922) t!41366) tb!11289))

(declare-fun result!23291 () Bool)

(assert (=> tb!11289 (= result!23291 tp_is_empty!31837)))

(assert (=> b!1255242 t!41366))

(declare-fun b_and!44757 () Bool)

(assert (= b_and!44751 (and (=> t!41366 result!23291) b_and!44757)))

(declare-fun b_lambda!22599 () Bool)

(assert (=> (not b_lambda!22599) (not b!1255244)))

(assert (=> b!1255244 t!41366))

(declare-fun b_and!44759 () Bool)

(assert (= b_and!44757 (and (=> t!41366 result!23291) b_and!44759)))

(declare-fun m!1156179 () Bool)

(assert (=> b!1255242 m!1156179))

(declare-fun m!1156181 () Bool)

(assert (=> b!1255242 m!1156181))

(declare-fun m!1156183 () Bool)

(assert (=> b!1255242 m!1156183))

(declare-fun m!1156185 () Bool)

(assert (=> b!1255242 m!1156185))

(assert (=> b!1255242 m!1156181))

(declare-fun m!1156187 () Bool)

(assert (=> b!1255242 m!1156187))

(assert (=> b!1255242 m!1156179))

(declare-fun m!1156189 () Bool)

(assert (=> b!1255242 m!1156189))

(declare-fun m!1156191 () Bool)

(assert (=> b!1255242 m!1156191))

(assert (=> b!1255242 m!1156183))

(declare-fun m!1156193 () Bool)

(assert (=> b!1255242 m!1156193))

(assert (=> b!1255250 m!1156193))

(assert (=> b!1255250 m!1156193))

(declare-fun m!1156195 () Bool)

(assert (=> b!1255250 m!1156195))

(assert (=> b!1255241 m!1156193))

(assert (=> b!1255241 m!1156193))

(declare-fun m!1156197 () Bool)

(assert (=> b!1255241 m!1156197))

(declare-fun m!1156199 () Bool)

(assert (=> b!1255249 m!1156199))

(declare-fun m!1156201 () Bool)

(assert (=> b!1255247 m!1156201))

(declare-fun m!1156203 () Bool)

(assert (=> b!1255245 m!1156203))

(assert (=> b!1255240 m!1156193))

(assert (=> b!1255240 m!1156193))

(assert (=> b!1255240 m!1156195))

(declare-fun m!1156205 () Bool)

(assert (=> d!138507 m!1156205))

(assert (=> d!138507 m!1156087))

(assert (=> bm!61756 m!1156203))

(assert (=> b!1255244 m!1156181))

(assert (=> b!1255244 m!1156183))

(assert (=> b!1255244 m!1156185))

(assert (=> b!1255244 m!1156181))

(assert (=> b!1255244 m!1156183))

(assert (=> b!1255244 m!1156193))

(assert (=> b!1255244 m!1156193))

(declare-fun m!1156207 () Bool)

(assert (=> b!1255244 m!1156207))

(assert (=> b!1255154 d!138507))

(declare-fun b!1255253 () Bool)

(declare-fun e!713298 () Bool)

(declare-fun e!713299 () Bool)

(assert (=> b!1255253 (= e!713298 e!713299)))

(declare-fun c!122708 () Bool)

(declare-fun e!713302 () Bool)

(assert (=> b!1255253 (= c!122708 e!713302)))

(declare-fun res!836659 () Bool)

(assert (=> b!1255253 (=> (not res!836659) (not e!713302))))

(assert (=> b!1255253 (= res!836659 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun b!1255254 () Bool)

(declare-fun e!713297 () ListLongMap!18529)

(declare-fun e!713303 () ListLongMap!18529)

(assert (=> b!1255254 (= e!713297 e!713303)))

(declare-fun c!122710 () Bool)

(assert (=> b!1255254 (= c!122710 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61757 () Bool)

(declare-fun call!61760 () ListLongMap!18529)

(assert (=> bm!61757 (= call!61760 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1255255 () Bool)

(declare-fun e!713301 () Bool)

(assert (=> b!1255255 (= e!713299 e!713301)))

(assert (=> b!1255255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun res!836656 () Bool)

(declare-fun lt!566935 () ListLongMap!18529)

(assert (=> b!1255255 (= res!836656 (contains!7548 lt!566935 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255255 (=> (not res!836656) (not e!713301))))

(declare-fun b!1255256 () Bool)

(declare-fun lt!566933 () Unit!41697)

(declare-fun lt!566934 () Unit!41697)

(assert (=> b!1255256 (= lt!566933 lt!566934)))

(declare-fun lt!566931 () V!47815)

(declare-fun lt!566932 () (_ BitVec 64))

(declare-fun lt!566930 () (_ BitVec 64))

(declare-fun lt!566936 () ListLongMap!18529)

(assert (=> b!1255256 (not (contains!7548 (+!4216 lt!566936 (tuple2!20649 lt!566930 lt!566931)) lt!566932))))

(assert (=> b!1255256 (= lt!566934 (addStillNotContains!315 lt!566936 lt!566930 lt!566931 lt!566932))))

(assert (=> b!1255256 (= lt!566932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1255256 (= lt!566931 (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1255256 (= lt!566930 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255256 (= lt!566936 call!61760)))

(assert (=> b!1255256 (= e!713303 (+!4216 call!61760 (tuple2!20649 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1255257 () Bool)

(assert (=> b!1255257 (= e!713303 call!61760)))

(declare-fun b!1255258 () Bool)

(assert (=> b!1255258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> b!1255258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39783 _values!914)))))

(assert (=> b!1255258 (= e!713301 (= (apply!994 lt!566935 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138509 () Bool)

(assert (=> d!138509 e!713298))

(declare-fun res!836657 () Bool)

(assert (=> d!138509 (=> (not res!836657) (not e!713298))))

(assert (=> d!138509 (= res!836657 (not (contains!7548 lt!566935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138509 (= lt!566935 e!713297)))

(declare-fun c!122707 () Bool)

(assert (=> d!138509 (= c!122707 (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138509 (validMask!0 mask!1466)))

(assert (=> d!138509 (= (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566935)))

(declare-fun b!1255259 () Bool)

(declare-fun e!713300 () Bool)

(assert (=> b!1255259 (= e!713300 (= lt!566935 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1255260 () Bool)

(assert (=> b!1255260 (= e!713299 e!713300)))

(declare-fun c!122709 () Bool)

(assert (=> b!1255260 (= c!122709 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun b!1255261 () Bool)

(assert (=> b!1255261 (= e!713300 (isEmpty!1031 lt!566935))))

(declare-fun b!1255262 () Bool)

(assert (=> b!1255262 (= e!713297 (ListLongMap!18530 Nil!27884))))

(declare-fun b!1255263 () Bool)

(declare-fun res!836658 () Bool)

(assert (=> b!1255263 (=> (not res!836658) (not e!713298))))

(assert (=> b!1255263 (= res!836658 (not (contains!7548 lt!566935 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1255264 () Bool)

(assert (=> b!1255264 (= e!713302 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255264 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138509 c!122707) b!1255262))

(assert (= (and d!138509 (not c!122707)) b!1255254))

(assert (= (and b!1255254 c!122710) b!1255256))

(assert (= (and b!1255254 (not c!122710)) b!1255257))

(assert (= (or b!1255256 b!1255257) bm!61757))

(assert (= (and d!138509 res!836657) b!1255263))

(assert (= (and b!1255263 res!836658) b!1255253))

(assert (= (and b!1255253 res!836659) b!1255264))

(assert (= (and b!1255253 c!122708) b!1255255))

(assert (= (and b!1255253 (not c!122708)) b!1255260))

(assert (= (and b!1255255 res!836656) b!1255258))

(assert (= (and b!1255260 c!122709) b!1255259))

(assert (= (and b!1255260 (not c!122709)) b!1255261))

(declare-fun b_lambda!22601 () Bool)

(assert (=> (not b_lambda!22601) (not b!1255256)))

(assert (=> b!1255256 t!41366))

(declare-fun b_and!44761 () Bool)

(assert (= b_and!44759 (and (=> t!41366 result!23291) b_and!44761)))

(declare-fun b_lambda!22603 () Bool)

(assert (=> (not b_lambda!22603) (not b!1255258)))

(assert (=> b!1255258 t!41366))

(declare-fun b_and!44763 () Bool)

(assert (= b_and!44761 (and (=> t!41366 result!23291) b_and!44763)))

(declare-fun m!1156209 () Bool)

(assert (=> b!1255256 m!1156209))

(assert (=> b!1255256 m!1156181))

(assert (=> b!1255256 m!1156183))

(assert (=> b!1255256 m!1156185))

(assert (=> b!1255256 m!1156181))

(declare-fun m!1156211 () Bool)

(assert (=> b!1255256 m!1156211))

(assert (=> b!1255256 m!1156209))

(declare-fun m!1156213 () Bool)

(assert (=> b!1255256 m!1156213))

(declare-fun m!1156215 () Bool)

(assert (=> b!1255256 m!1156215))

(assert (=> b!1255256 m!1156183))

(assert (=> b!1255256 m!1156193))

(assert (=> b!1255264 m!1156193))

(assert (=> b!1255264 m!1156193))

(assert (=> b!1255264 m!1156195))

(assert (=> b!1255255 m!1156193))

(assert (=> b!1255255 m!1156193))

(declare-fun m!1156217 () Bool)

(assert (=> b!1255255 m!1156217))

(declare-fun m!1156219 () Bool)

(assert (=> b!1255263 m!1156219))

(declare-fun m!1156221 () Bool)

(assert (=> b!1255261 m!1156221))

(declare-fun m!1156223 () Bool)

(assert (=> b!1255259 m!1156223))

(assert (=> b!1255254 m!1156193))

(assert (=> b!1255254 m!1156193))

(assert (=> b!1255254 m!1156195))

(declare-fun m!1156225 () Bool)

(assert (=> d!138509 m!1156225))

(assert (=> d!138509 m!1156087))

(assert (=> bm!61757 m!1156223))

(assert (=> b!1255258 m!1156181))

(assert (=> b!1255258 m!1156183))

(assert (=> b!1255258 m!1156185))

(assert (=> b!1255258 m!1156181))

(assert (=> b!1255258 m!1156183))

(assert (=> b!1255258 m!1156193))

(assert (=> b!1255258 m!1156193))

(declare-fun m!1156227 () Bool)

(assert (=> b!1255258 m!1156227))

(assert (=> b!1255154 d!138509))

(declare-fun d!138511 () Bool)

(declare-fun lt!566939 () ListLongMap!18529)

(assert (=> d!138511 (not (contains!7548 lt!566939 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!137 (List!27887 (_ BitVec 64)) List!27887)

(assert (=> d!138511 (= lt!566939 (ListLongMap!18530 (removeStrictlySorted!137 (toList!9280 lt!566858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138511 (= (-!2020 lt!566858 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566939)))

(declare-fun bs!35443 () Bool)

(assert (= bs!35443 d!138511))

(declare-fun m!1156229 () Bool)

(assert (=> bs!35443 m!1156229))

(declare-fun m!1156231 () Bool)

(assert (=> bs!35443 m!1156231))

(assert (=> b!1255159 d!138511))

(declare-fun d!138513 () Bool)

(declare-fun lt!566940 () ListLongMap!18529)

(assert (=> d!138513 (not (contains!7548 lt!566940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138513 (= lt!566940 (ListLongMap!18530 (removeStrictlySorted!137 (toList!9280 lt!566860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138513 (= (-!2020 lt!566860 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566940)))

(declare-fun bs!35444 () Bool)

(assert (= bs!35444 d!138513))

(declare-fun m!1156233 () Bool)

(assert (=> bs!35444 m!1156233))

(declare-fun m!1156235 () Bool)

(assert (=> bs!35444 m!1156235))

(assert (=> b!1255159 d!138513))

(declare-fun d!138515 () Bool)

(declare-fun e!713306 () Bool)

(assert (=> d!138515 e!713306))

(declare-fun res!836664 () Bool)

(assert (=> d!138515 (=> (not res!836664) (not e!713306))))

(declare-fun lt!566952 () ListLongMap!18529)

(assert (=> d!138515 (= res!836664 (contains!7548 lt!566952 (_1!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!566951 () List!27887)

(assert (=> d!138515 (= lt!566952 (ListLongMap!18530 lt!566951))))

(declare-fun lt!566950 () Unit!41697)

(declare-fun lt!566949 () Unit!41697)

(assert (=> d!138515 (= lt!566950 lt!566949)))

(declare-datatypes ((Option!701 0))(
  ( (Some!700 (v!18678 V!47815)) (None!699) )
))
(declare-fun getValueByKey!650 (List!27887 (_ BitVec 64)) Option!701)

(assert (=> d!138515 (= (getValueByKey!650 lt!566951 (_1!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!700 (_2!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!330 (List!27887 (_ BitVec 64) V!47815) Unit!41697)

(assert (=> d!138515 (= lt!566949 (lemmaContainsTupThenGetReturnValue!330 lt!566951 (_1!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!444 (List!27887 (_ BitVec 64) V!47815) List!27887)

(assert (=> d!138515 (= lt!566951 (insertStrictlySorted!444 (toList!9280 lt!566861) (_1!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138515 (= (+!4216 lt!566861 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!566952)))

(declare-fun b!1255269 () Bool)

(declare-fun res!836665 () Bool)

(assert (=> b!1255269 (=> (not res!836665) (not e!713306))))

(assert (=> b!1255269 (= res!836665 (= (getValueByKey!650 (toList!9280 lt!566952) (_1!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!700 (_2!10335 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1255270 () Bool)

(declare-fun contains!7549 (List!27887 tuple2!20648) Bool)

(assert (=> b!1255270 (= e!713306 (contains!7549 (toList!9280 lt!566952) (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138515 res!836664) b!1255269))

(assert (= (and b!1255269 res!836665) b!1255270))

(declare-fun m!1156237 () Bool)

(assert (=> d!138515 m!1156237))

(declare-fun m!1156239 () Bool)

(assert (=> d!138515 m!1156239))

(declare-fun m!1156241 () Bool)

(assert (=> d!138515 m!1156241))

(declare-fun m!1156243 () Bool)

(assert (=> d!138515 m!1156243))

(declare-fun m!1156245 () Bool)

(assert (=> b!1255269 m!1156245))

(declare-fun m!1156247 () Bool)

(assert (=> b!1255270 m!1156247))

(assert (=> b!1255159 d!138515))

(declare-fun b!1255313 () Bool)

(declare-fun e!713337 () Bool)

(declare-fun e!713345 () Bool)

(assert (=> b!1255313 (= e!713337 e!713345)))

(declare-fun c!122725 () Bool)

(assert (=> b!1255313 (= c!122725 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255314 () Bool)

(declare-fun call!61780 () Bool)

(assert (=> b!1255314 (= e!713345 (not call!61780))))

(declare-fun bm!61772 () Bool)

(declare-fun call!61778 () Bool)

(declare-fun lt!566997 () ListLongMap!18529)

(assert (=> bm!61772 (= call!61778 (contains!7548 lt!566997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255315 () Bool)

(declare-fun e!713334 () ListLongMap!18529)

(declare-fun call!61775 () ListLongMap!18529)

(assert (=> b!1255315 (= e!713334 (+!4216 call!61775 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1255316 () Bool)

(declare-fun c!122728 () Bool)

(assert (=> b!1255316 (= c!122728 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!713344 () ListLongMap!18529)

(declare-fun e!713333 () ListLongMap!18529)

(assert (=> b!1255316 (= e!713344 e!713333)))

(declare-fun b!1255317 () Bool)

(assert (=> b!1255317 (= e!713334 e!713344)))

(declare-fun c!122726 () Bool)

(assert (=> b!1255317 (= c!122726 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255318 () Bool)

(declare-fun res!836689 () Bool)

(assert (=> b!1255318 (=> (not res!836689) (not e!713337))))

(declare-fun e!713338 () Bool)

(assert (=> b!1255318 (= res!836689 e!713338)))

(declare-fun c!122723 () Bool)

(assert (=> b!1255318 (= c!122723 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1255319 () Bool)

(declare-fun call!61777 () ListLongMap!18529)

(assert (=> b!1255319 (= e!713333 call!61777)))

(declare-fun bm!61773 () Bool)

(declare-fun call!61776 () ListLongMap!18529)

(assert (=> bm!61773 (= call!61776 call!61775)))

(declare-fun call!61779 () ListLongMap!18529)

(declare-fun bm!61774 () Bool)

(assert (=> bm!61774 (= call!61779 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61775 () Bool)

(declare-fun call!61781 () ListLongMap!18529)

(declare-fun c!122727 () Bool)

(assert (=> bm!61775 (= call!61775 (+!4216 (ite c!122727 call!61779 (ite c!122726 call!61781 call!61777)) (ite (or c!122727 c!122726) (tuple2!20649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1255320 () Bool)

(declare-fun e!713339 () Bool)

(assert (=> b!1255320 (= e!713339 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255321 () Bool)

(declare-fun e!713340 () Bool)

(assert (=> b!1255321 (= e!713340 (= (apply!994 lt!566997 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1255322 () Bool)

(declare-fun e!713335 () Bool)

(assert (=> b!1255322 (= e!713345 e!713335)))

(declare-fun res!836690 () Bool)

(assert (=> b!1255322 (= res!836690 call!61780)))

(assert (=> b!1255322 (=> (not res!836690) (not e!713335))))

(declare-fun b!1255323 () Bool)

(declare-fun e!713343 () Bool)

(declare-fun e!713342 () Bool)

(assert (=> b!1255323 (= e!713343 e!713342)))

(declare-fun res!836685 () Bool)

(assert (=> b!1255323 (=> (not res!836685) (not e!713342))))

(assert (=> b!1255323 (= res!836685 (contains!7548 lt!566997 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61777 () Bool)

(assert (=> bm!61777 (= call!61777 call!61781)))

(declare-fun b!1255324 () Bool)

(assert (=> b!1255324 (= e!713338 (not call!61778))))

(declare-fun b!1255325 () Bool)

(declare-fun e!713336 () Unit!41697)

(declare-fun lt!567017 () Unit!41697)

(assert (=> b!1255325 (= e!713336 lt!567017)))

(declare-fun lt!567004 () ListLongMap!18529)

(assert (=> b!1255325 (= lt!567004 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567007 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567012 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567012 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567011 () Unit!41697)

(declare-fun addStillContains!1086 (ListLongMap!18529 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41697)

(assert (=> b!1255325 (= lt!567011 (addStillContains!1086 lt!567004 lt!567007 zeroValue!871 lt!567012))))

(assert (=> b!1255325 (contains!7548 (+!4216 lt!567004 (tuple2!20649 lt!567007 zeroValue!871)) lt!567012)))

(declare-fun lt!567009 () Unit!41697)

(assert (=> b!1255325 (= lt!567009 lt!567011)))

(declare-fun lt!567016 () ListLongMap!18529)

(assert (=> b!1255325 (= lt!567016 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567013 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567000 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567000 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566999 () Unit!41697)

(declare-fun addApplyDifferent!528 (ListLongMap!18529 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41697)

(assert (=> b!1255325 (= lt!566999 (addApplyDifferent!528 lt!567016 lt!567013 minValueBefore!43 lt!567000))))

(assert (=> b!1255325 (= (apply!994 (+!4216 lt!567016 (tuple2!20649 lt!567013 minValueBefore!43)) lt!567000) (apply!994 lt!567016 lt!567000))))

(declare-fun lt!567010 () Unit!41697)

(assert (=> b!1255325 (= lt!567010 lt!566999)))

(declare-fun lt!567003 () ListLongMap!18529)

(assert (=> b!1255325 (= lt!567003 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567014 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567006 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567006 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567018 () Unit!41697)

(assert (=> b!1255325 (= lt!567018 (addApplyDifferent!528 lt!567003 lt!567014 zeroValue!871 lt!567006))))

(assert (=> b!1255325 (= (apply!994 (+!4216 lt!567003 (tuple2!20649 lt!567014 zeroValue!871)) lt!567006) (apply!994 lt!567003 lt!567006))))

(declare-fun lt!567015 () Unit!41697)

(assert (=> b!1255325 (= lt!567015 lt!567018)))

(declare-fun lt!567008 () ListLongMap!18529)

(assert (=> b!1255325 (= lt!567008 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567002 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!567002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566998 () (_ BitVec 64))

(assert (=> b!1255325 (= lt!566998 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255325 (= lt!567017 (addApplyDifferent!528 lt!567008 lt!567002 minValueBefore!43 lt!566998))))

(assert (=> b!1255325 (= (apply!994 (+!4216 lt!567008 (tuple2!20649 lt!567002 minValueBefore!43)) lt!566998) (apply!994 lt!567008 lt!566998))))

(declare-fun b!1255326 () Bool)

(assert (=> b!1255326 (= e!713338 e!713340)))

(declare-fun res!836692 () Bool)

(assert (=> b!1255326 (= res!836692 call!61778)))

(assert (=> b!1255326 (=> (not res!836692) (not e!713340))))

(declare-fun b!1255327 () Bool)

(assert (=> b!1255327 (= e!713333 call!61776)))

(declare-fun b!1255328 () Bool)

(declare-fun Unit!41703 () Unit!41697)

(assert (=> b!1255328 (= e!713336 Unit!41703)))

(declare-fun b!1255329 () Bool)

(assert (=> b!1255329 (= e!713335 (= (apply!994 lt!566997 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1255330 () Bool)

(assert (=> b!1255330 (= e!713344 call!61776)))

(declare-fun b!1255331 () Bool)

(declare-fun e!713341 () Bool)

(assert (=> b!1255331 (= e!713341 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255332 () Bool)

(assert (=> b!1255332 (= e!713342 (= (apply!994 lt!566997 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1255332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39783 _values!914)))))

(assert (=> b!1255332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61776 () Bool)

(assert (=> bm!61776 (= call!61781 call!61779)))

(declare-fun d!138517 () Bool)

(assert (=> d!138517 e!713337))

(declare-fun res!836686 () Bool)

(assert (=> d!138517 (=> (not res!836686) (not e!713337))))

(assert (=> d!138517 (= res!836686 (or (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))))

(declare-fun lt!567005 () ListLongMap!18529)

(assert (=> d!138517 (= lt!566997 lt!567005)))

(declare-fun lt!567001 () Unit!41697)

(assert (=> d!138517 (= lt!567001 e!713336)))

(declare-fun c!122724 () Bool)

(assert (=> d!138517 (= c!122724 e!713339)))

(declare-fun res!836688 () Bool)

(assert (=> d!138517 (=> (not res!836688) (not e!713339))))

(assert (=> d!138517 (= res!836688 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138517 (= lt!567005 e!713334)))

(assert (=> d!138517 (= c!122727 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138517 (validMask!0 mask!1466)))

(assert (=> d!138517 (= (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566997)))

(declare-fun b!1255333 () Bool)

(declare-fun res!836684 () Bool)

(assert (=> b!1255333 (=> (not res!836684) (not e!713337))))

(assert (=> b!1255333 (= res!836684 e!713343)))

(declare-fun res!836687 () Bool)

(assert (=> b!1255333 (=> res!836687 e!713343)))

(assert (=> b!1255333 (= res!836687 (not e!713341))))

(declare-fun res!836691 () Bool)

(assert (=> b!1255333 (=> (not res!836691) (not e!713341))))

(assert (=> b!1255333 (= res!836691 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61778 () Bool)

(assert (=> bm!61778 (= call!61780 (contains!7548 lt!566997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138517 c!122727) b!1255315))

(assert (= (and d!138517 (not c!122727)) b!1255317))

(assert (= (and b!1255317 c!122726) b!1255330))

(assert (= (and b!1255317 (not c!122726)) b!1255316))

(assert (= (and b!1255316 c!122728) b!1255327))

(assert (= (and b!1255316 (not c!122728)) b!1255319))

(assert (= (or b!1255327 b!1255319) bm!61777))

(assert (= (or b!1255330 bm!61777) bm!61776))

(assert (= (or b!1255330 b!1255327) bm!61773))

(assert (= (or b!1255315 bm!61776) bm!61774))

(assert (= (or b!1255315 bm!61773) bm!61775))

(assert (= (and d!138517 res!836688) b!1255320))

(assert (= (and d!138517 c!122724) b!1255325))

(assert (= (and d!138517 (not c!122724)) b!1255328))

(assert (= (and d!138517 res!836686) b!1255333))

(assert (= (and b!1255333 res!836691) b!1255331))

(assert (= (and b!1255333 (not res!836687)) b!1255323))

(assert (= (and b!1255323 res!836685) b!1255332))

(assert (= (and b!1255333 res!836684) b!1255318))

(assert (= (and b!1255318 c!122723) b!1255326))

(assert (= (and b!1255318 (not c!122723)) b!1255324))

(assert (= (and b!1255326 res!836692) b!1255321))

(assert (= (or b!1255326 b!1255324) bm!61772))

(assert (= (and b!1255318 res!836689) b!1255313))

(assert (= (and b!1255313 c!122725) b!1255322))

(assert (= (and b!1255313 (not c!122725)) b!1255314))

(assert (= (and b!1255322 res!836690) b!1255329))

(assert (= (or b!1255322 b!1255314) bm!61778))

(declare-fun b_lambda!22605 () Bool)

(assert (=> (not b_lambda!22605) (not b!1255332)))

(assert (=> b!1255332 t!41366))

(declare-fun b_and!44765 () Bool)

(assert (= b_and!44763 (and (=> t!41366 result!23291) b_and!44765)))

(assert (=> b!1255323 m!1156193))

(assert (=> b!1255323 m!1156193))

(declare-fun m!1156249 () Bool)

(assert (=> b!1255323 m!1156249))

(declare-fun m!1156251 () Bool)

(assert (=> b!1255325 m!1156251))

(declare-fun m!1156253 () Bool)

(assert (=> b!1255325 m!1156253))

(declare-fun m!1156255 () Bool)

(assert (=> b!1255325 m!1156255))

(declare-fun m!1156257 () Bool)

(assert (=> b!1255325 m!1156257))

(declare-fun m!1156259 () Bool)

(assert (=> b!1255325 m!1156259))

(declare-fun m!1156261 () Bool)

(assert (=> b!1255325 m!1156261))

(declare-fun m!1156263 () Bool)

(assert (=> b!1255325 m!1156263))

(declare-fun m!1156265 () Bool)

(assert (=> b!1255325 m!1156265))

(assert (=> b!1255325 m!1156251))

(declare-fun m!1156267 () Bool)

(assert (=> b!1255325 m!1156267))

(assert (=> b!1255325 m!1156255))

(declare-fun m!1156269 () Bool)

(assert (=> b!1255325 m!1156269))

(declare-fun m!1156271 () Bool)

(assert (=> b!1255325 m!1156271))

(declare-fun m!1156273 () Bool)

(assert (=> b!1255325 m!1156273))

(assert (=> b!1255325 m!1156113))

(assert (=> b!1255325 m!1156193))

(declare-fun m!1156275 () Bool)

(assert (=> b!1255325 m!1156275))

(assert (=> b!1255325 m!1156261))

(declare-fun m!1156277 () Bool)

(assert (=> b!1255325 m!1156277))

(assert (=> b!1255325 m!1156271))

(declare-fun m!1156279 () Bool)

(assert (=> b!1255325 m!1156279))

(assert (=> b!1255332 m!1156193))

(assert (=> b!1255332 m!1156181))

(assert (=> b!1255332 m!1156183))

(assert (=> b!1255332 m!1156181))

(assert (=> b!1255332 m!1156183))

(assert (=> b!1255332 m!1156185))

(assert (=> b!1255332 m!1156193))

(declare-fun m!1156281 () Bool)

(assert (=> b!1255332 m!1156281))

(declare-fun m!1156283 () Bool)

(assert (=> b!1255321 m!1156283))

(declare-fun m!1156285 () Bool)

(assert (=> bm!61775 m!1156285))

(declare-fun m!1156287 () Bool)

(assert (=> b!1255315 m!1156287))

(assert (=> d!138517 m!1156087))

(declare-fun m!1156289 () Bool)

(assert (=> bm!61772 m!1156289))

(assert (=> bm!61774 m!1156113))

(assert (=> b!1255331 m!1156193))

(assert (=> b!1255331 m!1156193))

(assert (=> b!1255331 m!1156195))

(declare-fun m!1156291 () Bool)

(assert (=> bm!61778 m!1156291))

(declare-fun m!1156293 () Bool)

(assert (=> b!1255329 m!1156293))

(assert (=> b!1255320 m!1156193))

(assert (=> b!1255320 m!1156193))

(assert (=> b!1255320 m!1156195))

(assert (=> b!1255159 d!138517))

(declare-fun b!1255334 () Bool)

(declare-fun e!713350 () Bool)

(declare-fun e!713358 () Bool)

(assert (=> b!1255334 (= e!713350 e!713358)))

(declare-fun c!122731 () Bool)

(assert (=> b!1255334 (= c!122731 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255335 () Bool)

(declare-fun call!61787 () Bool)

(assert (=> b!1255335 (= e!713358 (not call!61787))))

(declare-fun bm!61779 () Bool)

(declare-fun call!61785 () Bool)

(declare-fun lt!567019 () ListLongMap!18529)

(assert (=> bm!61779 (= call!61785 (contains!7548 lt!567019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255336 () Bool)

(declare-fun e!713347 () ListLongMap!18529)

(declare-fun call!61782 () ListLongMap!18529)

(assert (=> b!1255336 (= e!713347 (+!4216 call!61782 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1255337 () Bool)

(declare-fun c!122734 () Bool)

(assert (=> b!1255337 (= c!122734 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!713357 () ListLongMap!18529)

(declare-fun e!713346 () ListLongMap!18529)

(assert (=> b!1255337 (= e!713357 e!713346)))

(declare-fun b!1255338 () Bool)

(assert (=> b!1255338 (= e!713347 e!713357)))

(declare-fun c!122732 () Bool)

(assert (=> b!1255338 (= c!122732 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255339 () Bool)

(declare-fun res!836698 () Bool)

(assert (=> b!1255339 (=> (not res!836698) (not e!713350))))

(declare-fun e!713351 () Bool)

(assert (=> b!1255339 (= res!836698 e!713351)))

(declare-fun c!122729 () Bool)

(assert (=> b!1255339 (= c!122729 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1255340 () Bool)

(declare-fun call!61784 () ListLongMap!18529)

(assert (=> b!1255340 (= e!713346 call!61784)))

(declare-fun bm!61780 () Bool)

(declare-fun call!61783 () ListLongMap!18529)

(assert (=> bm!61780 (= call!61783 call!61782)))

(declare-fun call!61786 () ListLongMap!18529)

(declare-fun bm!61781 () Bool)

(assert (=> bm!61781 (= call!61786 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61782 () Bool)

(declare-fun c!122733 () Bool)

(declare-fun call!61788 () ListLongMap!18529)

(assert (=> bm!61782 (= call!61782 (+!4216 (ite c!122733 call!61786 (ite c!122732 call!61788 call!61784)) (ite (or c!122733 c!122732) (tuple2!20649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1255341 () Bool)

(declare-fun e!713352 () Bool)

(assert (=> b!1255341 (= e!713352 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255342 () Bool)

(declare-fun e!713353 () Bool)

(assert (=> b!1255342 (= e!713353 (= (apply!994 lt!567019 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1255343 () Bool)

(declare-fun e!713348 () Bool)

(assert (=> b!1255343 (= e!713358 e!713348)))

(declare-fun res!836699 () Bool)

(assert (=> b!1255343 (= res!836699 call!61787)))

(assert (=> b!1255343 (=> (not res!836699) (not e!713348))))

(declare-fun b!1255344 () Bool)

(declare-fun e!713356 () Bool)

(declare-fun e!713355 () Bool)

(assert (=> b!1255344 (= e!713356 e!713355)))

(declare-fun res!836694 () Bool)

(assert (=> b!1255344 (=> (not res!836694) (not e!713355))))

(assert (=> b!1255344 (= res!836694 (contains!7548 lt!567019 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1255344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61784 () Bool)

(assert (=> bm!61784 (= call!61784 call!61788)))

(declare-fun b!1255345 () Bool)

(assert (=> b!1255345 (= e!713351 (not call!61785))))

(declare-fun b!1255346 () Bool)

(declare-fun e!713349 () Unit!41697)

(declare-fun lt!567039 () Unit!41697)

(assert (=> b!1255346 (= e!713349 lt!567039)))

(declare-fun lt!567026 () ListLongMap!18529)

(assert (=> b!1255346 (= lt!567026 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567029 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567034 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567034 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567033 () Unit!41697)

(assert (=> b!1255346 (= lt!567033 (addStillContains!1086 lt!567026 lt!567029 zeroValue!871 lt!567034))))

(assert (=> b!1255346 (contains!7548 (+!4216 lt!567026 (tuple2!20649 lt!567029 zeroValue!871)) lt!567034)))

(declare-fun lt!567031 () Unit!41697)

(assert (=> b!1255346 (= lt!567031 lt!567033)))

(declare-fun lt!567038 () ListLongMap!18529)

(assert (=> b!1255346 (= lt!567038 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567035 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567022 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567022 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567021 () Unit!41697)

(assert (=> b!1255346 (= lt!567021 (addApplyDifferent!528 lt!567038 lt!567035 minValueAfter!43 lt!567022))))

(assert (=> b!1255346 (= (apply!994 (+!4216 lt!567038 (tuple2!20649 lt!567035 minValueAfter!43)) lt!567022) (apply!994 lt!567038 lt!567022))))

(declare-fun lt!567032 () Unit!41697)

(assert (=> b!1255346 (= lt!567032 lt!567021)))

(declare-fun lt!567025 () ListLongMap!18529)

(assert (=> b!1255346 (= lt!567025 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567036 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567028 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567028 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567040 () Unit!41697)

(assert (=> b!1255346 (= lt!567040 (addApplyDifferent!528 lt!567025 lt!567036 zeroValue!871 lt!567028))))

(assert (=> b!1255346 (= (apply!994 (+!4216 lt!567025 (tuple2!20649 lt!567036 zeroValue!871)) lt!567028) (apply!994 lt!567025 lt!567028))))

(declare-fun lt!567037 () Unit!41697)

(assert (=> b!1255346 (= lt!567037 lt!567040)))

(declare-fun lt!567030 () ListLongMap!18529)

(assert (=> b!1255346 (= lt!567030 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567024 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567020 () (_ BitVec 64))

(assert (=> b!1255346 (= lt!567020 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1255346 (= lt!567039 (addApplyDifferent!528 lt!567030 lt!567024 minValueAfter!43 lt!567020))))

(assert (=> b!1255346 (= (apply!994 (+!4216 lt!567030 (tuple2!20649 lt!567024 minValueAfter!43)) lt!567020) (apply!994 lt!567030 lt!567020))))

(declare-fun b!1255347 () Bool)

(assert (=> b!1255347 (= e!713351 e!713353)))

(declare-fun res!836701 () Bool)

(assert (=> b!1255347 (= res!836701 call!61785)))

(assert (=> b!1255347 (=> (not res!836701) (not e!713353))))

(declare-fun b!1255348 () Bool)

(assert (=> b!1255348 (= e!713346 call!61783)))

(declare-fun b!1255349 () Bool)

(declare-fun Unit!41704 () Unit!41697)

(assert (=> b!1255349 (= e!713349 Unit!41704)))

(declare-fun b!1255350 () Bool)

(assert (=> b!1255350 (= e!713348 (= (apply!994 lt!567019 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1255351 () Bool)

(assert (=> b!1255351 (= e!713357 call!61783)))

(declare-fun b!1255352 () Bool)

(declare-fun e!713354 () Bool)

(assert (=> b!1255352 (= e!713354 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255353 () Bool)

(assert (=> b!1255353 (= e!713355 (= (apply!994 lt!567019 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)) (get!20133 (select (arr!39246 _values!914) #b00000000000000000000000000000000) (dynLambda!3446 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1255353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39783 _values!914)))))

(assert (=> b!1255353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61783 () Bool)

(assert (=> bm!61783 (= call!61788 call!61786)))

(declare-fun d!138519 () Bool)

(assert (=> d!138519 e!713350))

(declare-fun res!836695 () Bool)

(assert (=> d!138519 (=> (not res!836695) (not e!713350))))

(assert (=> d!138519 (= res!836695 (or (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))))

(declare-fun lt!567027 () ListLongMap!18529)

(assert (=> d!138519 (= lt!567019 lt!567027)))

(declare-fun lt!567023 () Unit!41697)

(assert (=> d!138519 (= lt!567023 e!713349)))

(declare-fun c!122730 () Bool)

(assert (=> d!138519 (= c!122730 e!713352)))

(declare-fun res!836697 () Bool)

(assert (=> d!138519 (=> (not res!836697) (not e!713352))))

(assert (=> d!138519 (= res!836697 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138519 (= lt!567027 e!713347)))

(assert (=> d!138519 (= c!122733 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138519 (validMask!0 mask!1466)))

(assert (=> d!138519 (= (getCurrentListMap!4513 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567019)))

(declare-fun b!1255354 () Bool)

(declare-fun res!836693 () Bool)

(assert (=> b!1255354 (=> (not res!836693) (not e!713350))))

(assert (=> b!1255354 (= res!836693 e!713356)))

(declare-fun res!836696 () Bool)

(assert (=> b!1255354 (=> res!836696 e!713356)))

(assert (=> b!1255354 (= res!836696 (not e!713354))))

(declare-fun res!836700 () Bool)

(assert (=> b!1255354 (=> (not res!836700) (not e!713354))))

(assert (=> b!1255354 (= res!836700 (bvslt #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(declare-fun bm!61785 () Bool)

(assert (=> bm!61785 (= call!61787 (contains!7548 lt!567019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138519 c!122733) b!1255336))

(assert (= (and d!138519 (not c!122733)) b!1255338))

(assert (= (and b!1255338 c!122732) b!1255351))

(assert (= (and b!1255338 (not c!122732)) b!1255337))

(assert (= (and b!1255337 c!122734) b!1255348))

(assert (= (and b!1255337 (not c!122734)) b!1255340))

(assert (= (or b!1255348 b!1255340) bm!61784))

(assert (= (or b!1255351 bm!61784) bm!61783))

(assert (= (or b!1255351 b!1255348) bm!61780))

(assert (= (or b!1255336 bm!61783) bm!61781))

(assert (= (or b!1255336 bm!61780) bm!61782))

(assert (= (and d!138519 res!836697) b!1255341))

(assert (= (and d!138519 c!122730) b!1255346))

(assert (= (and d!138519 (not c!122730)) b!1255349))

(assert (= (and d!138519 res!836695) b!1255354))

(assert (= (and b!1255354 res!836700) b!1255352))

(assert (= (and b!1255354 (not res!836696)) b!1255344))

(assert (= (and b!1255344 res!836694) b!1255353))

(assert (= (and b!1255354 res!836693) b!1255339))

(assert (= (and b!1255339 c!122729) b!1255347))

(assert (= (and b!1255339 (not c!122729)) b!1255345))

(assert (= (and b!1255347 res!836701) b!1255342))

(assert (= (or b!1255347 b!1255345) bm!61779))

(assert (= (and b!1255339 res!836698) b!1255334))

(assert (= (and b!1255334 c!122731) b!1255343))

(assert (= (and b!1255334 (not c!122731)) b!1255335))

(assert (= (and b!1255343 res!836699) b!1255350))

(assert (= (or b!1255343 b!1255335) bm!61785))

(declare-fun b_lambda!22607 () Bool)

(assert (=> (not b_lambda!22607) (not b!1255353)))

(assert (=> b!1255353 t!41366))

(declare-fun b_and!44767 () Bool)

(assert (= b_and!44765 (and (=> t!41366 result!23291) b_and!44767)))

(assert (=> b!1255344 m!1156193))

(assert (=> b!1255344 m!1156193))

(declare-fun m!1156295 () Bool)

(assert (=> b!1255344 m!1156295))

(declare-fun m!1156297 () Bool)

(assert (=> b!1255346 m!1156297))

(declare-fun m!1156299 () Bool)

(assert (=> b!1255346 m!1156299))

(declare-fun m!1156301 () Bool)

(assert (=> b!1255346 m!1156301))

(declare-fun m!1156303 () Bool)

(assert (=> b!1255346 m!1156303))

(declare-fun m!1156305 () Bool)

(assert (=> b!1255346 m!1156305))

(declare-fun m!1156307 () Bool)

(assert (=> b!1255346 m!1156307))

(declare-fun m!1156309 () Bool)

(assert (=> b!1255346 m!1156309))

(declare-fun m!1156311 () Bool)

(assert (=> b!1255346 m!1156311))

(assert (=> b!1255346 m!1156297))

(declare-fun m!1156313 () Bool)

(assert (=> b!1255346 m!1156313))

(assert (=> b!1255346 m!1156301))

(declare-fun m!1156315 () Bool)

(assert (=> b!1255346 m!1156315))

(declare-fun m!1156317 () Bool)

(assert (=> b!1255346 m!1156317))

(declare-fun m!1156319 () Bool)

(assert (=> b!1255346 m!1156319))

(assert (=> b!1255346 m!1156111))

(assert (=> b!1255346 m!1156193))

(declare-fun m!1156321 () Bool)

(assert (=> b!1255346 m!1156321))

(assert (=> b!1255346 m!1156307))

(declare-fun m!1156323 () Bool)

(assert (=> b!1255346 m!1156323))

(assert (=> b!1255346 m!1156317))

(declare-fun m!1156325 () Bool)

(assert (=> b!1255346 m!1156325))

(assert (=> b!1255353 m!1156193))

(assert (=> b!1255353 m!1156181))

(assert (=> b!1255353 m!1156183))

(assert (=> b!1255353 m!1156181))

(assert (=> b!1255353 m!1156183))

(assert (=> b!1255353 m!1156185))

(assert (=> b!1255353 m!1156193))

(declare-fun m!1156327 () Bool)

(assert (=> b!1255353 m!1156327))

(declare-fun m!1156329 () Bool)

(assert (=> b!1255342 m!1156329))

(declare-fun m!1156331 () Bool)

(assert (=> bm!61782 m!1156331))

(declare-fun m!1156333 () Bool)

(assert (=> b!1255336 m!1156333))

(assert (=> d!138519 m!1156087))

(declare-fun m!1156335 () Bool)

(assert (=> bm!61779 m!1156335))

(assert (=> bm!61781 m!1156111))

(assert (=> b!1255352 m!1156193))

(assert (=> b!1255352 m!1156193))

(assert (=> b!1255352 m!1156195))

(declare-fun m!1156337 () Bool)

(assert (=> bm!61785 m!1156337))

(declare-fun m!1156339 () Bool)

(assert (=> b!1255350 m!1156339))

(assert (=> b!1255341 m!1156193))

(assert (=> b!1255341 m!1156193))

(assert (=> b!1255341 m!1156195))

(assert (=> b!1255159 d!138519))

(declare-fun d!138521 () Bool)

(assert (=> d!138521 (= (-!2020 (+!4216 lt!566861 (tuple2!20649 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!566861)))

(declare-fun lt!567043 () Unit!41697)

(declare-fun choose!1858 (ListLongMap!18529 (_ BitVec 64) V!47815) Unit!41697)

(assert (=> d!138521 (= lt!567043 (choose!1858 lt!566861 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138521 (not (contains!7548 lt!566861 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138521 (= (addThenRemoveForNewKeyIsSame!310 lt!566861 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!567043)))

(declare-fun bs!35445 () Bool)

(assert (= bs!35445 d!138521))

(assert (=> bs!35445 m!1156101))

(assert (=> bs!35445 m!1156101))

(declare-fun m!1156341 () Bool)

(assert (=> bs!35445 m!1156341))

(declare-fun m!1156343 () Bool)

(assert (=> bs!35445 m!1156343))

(declare-fun m!1156345 () Bool)

(assert (=> bs!35445 m!1156345))

(assert (=> b!1255159 d!138521))

(declare-fun d!138523 () Bool)

(assert (=> d!138523 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105442 d!138523))

(declare-fun d!138525 () Bool)

(assert (=> d!138525 (= (array_inv!30037 _keys!1118) (bvsge (size!39782 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105442 d!138525))

(declare-fun d!138527 () Bool)

(assert (=> d!138527 (= (array_inv!30038 _values!914) (bvsge (size!39783 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105442 d!138527))

(declare-fun bm!61788 () Bool)

(declare-fun call!61791 () Bool)

(declare-fun c!122737 () Bool)

(assert (=> bm!61788 (= call!61791 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122737 (Cons!27884 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000) Nil!27885) Nil!27885)))))

(declare-fun b!1255365 () Bool)

(declare-fun e!713368 () Bool)

(declare-fun contains!7550 (List!27888 (_ BitVec 64)) Bool)

(assert (=> b!1255365 (= e!713368 (contains!7550 Nil!27885 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138529 () Bool)

(declare-fun res!836709 () Bool)

(declare-fun e!713367 () Bool)

(assert (=> d!138529 (=> res!836709 e!713367)))

(assert (=> d!138529 (= res!836709 (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138529 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27885) e!713367)))

(declare-fun b!1255366 () Bool)

(declare-fun e!713369 () Bool)

(assert (=> b!1255366 (= e!713369 call!61791)))

(declare-fun b!1255367 () Bool)

(declare-fun e!713370 () Bool)

(assert (=> b!1255367 (= e!713367 e!713370)))

(declare-fun res!836708 () Bool)

(assert (=> b!1255367 (=> (not res!836708) (not e!713370))))

(assert (=> b!1255367 (= res!836708 (not e!713368))))

(declare-fun res!836710 () Bool)

(assert (=> b!1255367 (=> (not res!836710) (not e!713368))))

(assert (=> b!1255367 (= res!836710 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255368 () Bool)

(assert (=> b!1255368 (= e!713369 call!61791)))

(declare-fun b!1255369 () Bool)

(assert (=> b!1255369 (= e!713370 e!713369)))

(assert (=> b!1255369 (= c!122737 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138529 (not res!836709)) b!1255367))

(assert (= (and b!1255367 res!836710) b!1255365))

(assert (= (and b!1255367 res!836708) b!1255369))

(assert (= (and b!1255369 c!122737) b!1255366))

(assert (= (and b!1255369 (not c!122737)) b!1255368))

(assert (= (or b!1255366 b!1255368) bm!61788))

(assert (=> bm!61788 m!1156193))

(declare-fun m!1156347 () Bool)

(assert (=> bm!61788 m!1156347))

(assert (=> b!1255365 m!1156193))

(assert (=> b!1255365 m!1156193))

(declare-fun m!1156349 () Bool)

(assert (=> b!1255365 m!1156349))

(assert (=> b!1255367 m!1156193))

(assert (=> b!1255367 m!1156193))

(assert (=> b!1255367 m!1156195))

(assert (=> b!1255369 m!1156193))

(assert (=> b!1255369 m!1156193))

(assert (=> b!1255369 m!1156195))

(assert (=> b!1255155 d!138529))

(declare-fun bm!61791 () Bool)

(declare-fun call!61794 () Bool)

(assert (=> bm!61791 (= call!61794 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1255379 () Bool)

(declare-fun e!713377 () Bool)

(assert (=> b!1255379 (= e!713377 call!61794)))

(declare-fun b!1255380 () Bool)

(declare-fun e!713379 () Bool)

(assert (=> b!1255380 (= e!713377 e!713379)))

(declare-fun lt!567052 () (_ BitVec 64))

(assert (=> b!1255380 (= lt!567052 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567050 () Unit!41697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81375 (_ BitVec 64) (_ BitVec 32)) Unit!41697)

(assert (=> b!1255380 (= lt!567050 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567052 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1255380 (arrayContainsKey!0 _keys!1118 lt!567052 #b00000000000000000000000000000000)))

(declare-fun lt!567051 () Unit!41697)

(assert (=> b!1255380 (= lt!567051 lt!567050)))

(declare-fun res!836715 () Bool)

(declare-datatypes ((SeekEntryResult!9919 0))(
  ( (MissingZero!9919 (index!42047 (_ BitVec 32))) (Found!9919 (index!42048 (_ BitVec 32))) (Intermediate!9919 (undefined!10731 Bool) (index!42049 (_ BitVec 32)) (x!110351 (_ BitVec 32))) (Undefined!9919) (MissingVacant!9919 (index!42050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81375 (_ BitVec 32)) SeekEntryResult!9919)

(assert (=> b!1255380 (= res!836715 (= (seekEntryOrOpen!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9919 #b00000000000000000000000000000000)))))

(assert (=> b!1255380 (=> (not res!836715) (not e!713379))))

(declare-fun b!1255381 () Bool)

(declare-fun e!713378 () Bool)

(assert (=> b!1255381 (= e!713378 e!713377)))

(declare-fun c!122740 () Bool)

(assert (=> b!1255381 (= c!122740 (validKeyInArray!0 (select (arr!39245 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1255378 () Bool)

(assert (=> b!1255378 (= e!713379 call!61794)))

(declare-fun d!138531 () Bool)

(declare-fun res!836716 () Bool)

(assert (=> d!138531 (=> res!836716 e!713378)))

(assert (=> d!138531 (= res!836716 (bvsge #b00000000000000000000000000000000 (size!39782 _keys!1118)))))

(assert (=> d!138531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713378)))

(assert (= (and d!138531 (not res!836716)) b!1255381))

(assert (= (and b!1255381 c!122740) b!1255380))

(assert (= (and b!1255381 (not c!122740)) b!1255379))

(assert (= (and b!1255380 res!836715) b!1255378))

(assert (= (or b!1255378 b!1255379) bm!61791))

(declare-fun m!1156351 () Bool)

(assert (=> bm!61791 m!1156351))

(assert (=> b!1255380 m!1156193))

(declare-fun m!1156353 () Bool)

(assert (=> b!1255380 m!1156353))

(declare-fun m!1156355 () Bool)

(assert (=> b!1255380 m!1156355))

(assert (=> b!1255380 m!1156193))

(declare-fun m!1156357 () Bool)

(assert (=> b!1255380 m!1156357))

(assert (=> b!1255381 m!1156193))

(assert (=> b!1255381 m!1156193))

(assert (=> b!1255381 m!1156195))

(assert (=> b!1255152 d!138531))

(declare-fun condMapEmpty!49540 () Bool)

(declare-fun mapDefault!49540 () ValueCell!15155)

(assert (=> mapNonEmpty!49531 (= condMapEmpty!49540 (= mapRest!49531 ((as const (Array (_ BitVec 32) ValueCell!15155)) mapDefault!49540)))))

(declare-fun e!713384 () Bool)

(declare-fun mapRes!49540 () Bool)

(assert (=> mapNonEmpty!49531 (= tp!94310 (and e!713384 mapRes!49540))))

(declare-fun b!1255389 () Bool)

(assert (=> b!1255389 (= e!713384 tp_is_empty!31837)))

(declare-fun mapIsEmpty!49540 () Bool)

(assert (=> mapIsEmpty!49540 mapRes!49540))

(declare-fun mapNonEmpty!49540 () Bool)

(declare-fun tp!94325 () Bool)

(declare-fun e!713385 () Bool)

(assert (=> mapNonEmpty!49540 (= mapRes!49540 (and tp!94325 e!713385))))

(declare-fun mapRest!49540 () (Array (_ BitVec 32) ValueCell!15155))

(declare-fun mapKey!49540 () (_ BitVec 32))

(declare-fun mapValue!49540 () ValueCell!15155)

(assert (=> mapNonEmpty!49540 (= mapRest!49531 (store mapRest!49540 mapKey!49540 mapValue!49540))))

(declare-fun b!1255388 () Bool)

(assert (=> b!1255388 (= e!713385 tp_is_empty!31837)))

(assert (= (and mapNonEmpty!49531 condMapEmpty!49540) mapIsEmpty!49540))

(assert (= (and mapNonEmpty!49531 (not condMapEmpty!49540)) mapNonEmpty!49540))

(assert (= (and mapNonEmpty!49540 ((_ is ValueCellFull!15155) mapValue!49540)) b!1255388))

(assert (= (and mapNonEmpty!49531 ((_ is ValueCellFull!15155) mapDefault!49540)) b!1255389))

(declare-fun m!1156359 () Bool)

(assert (=> mapNonEmpty!49540 m!1156359))

(declare-fun b_lambda!22609 () Bool)

(assert (= b_lambda!22597 (or (and start!105442 b_free!26935) b_lambda!22609)))

(declare-fun b_lambda!22611 () Bool)

(assert (= b_lambda!22605 (or (and start!105442 b_free!26935) b_lambda!22611)))

(declare-fun b_lambda!22613 () Bool)

(assert (= b_lambda!22601 (or (and start!105442 b_free!26935) b_lambda!22613)))

(declare-fun b_lambda!22615 () Bool)

(assert (= b_lambda!22599 (or (and start!105442 b_free!26935) b_lambda!22615)))

(declare-fun b_lambda!22617 () Bool)

(assert (= b_lambda!22603 (or (and start!105442 b_free!26935) b_lambda!22617)))

(declare-fun b_lambda!22619 () Bool)

(assert (= b_lambda!22607 (or (and start!105442 b_free!26935) b_lambda!22619)))

(check-sat (not b!1255381) (not b_lambda!22615) (not bm!61757) (not b!1255261) (not b!1255346) (not b!1255240) (not bm!61791) (not b!1255264) (not mapNonEmpty!49540) (not b!1255325) (not b!1255331) (not b!1255332) (not b!1255315) (not d!138513) (not b!1255250) (not b!1255259) (not b!1255323) tp_is_empty!31837 (not b!1255258) (not b!1255241) (not b_lambda!22613) (not b!1255341) (not b!1255270) (not b!1255380) (not b!1255352) (not b!1255269) (not bm!61775) (not b!1255256) (not b!1255336) (not b!1255244) (not b!1255342) (not d!138505) (not b!1255245) (not bm!61756) (not bm!61772) (not d!138521) (not b!1255255) (not b!1255367) (not b!1255329) (not b!1255321) (not b!1255353) (not bm!61788) (not b_lambda!22611) (not b!1255249) (not bm!61785) (not d!138509) (not d!138507) (not b!1255263) (not b!1255344) (not d!138511) (not b_lambda!22619) b_and!44767 (not d!138517) (not b!1255350) (not b!1255247) (not bm!61782) (not b_next!26935) (not bm!61778) (not bm!61781) (not b!1255242) (not d!138515) (not bm!61779) (not b_lambda!22617) (not b!1255320) (not b_lambda!22609) (not d!138519) (not b!1255254) (not bm!61774) (not b!1255365) (not b!1255369))
(check-sat b_and!44767 (not b_next!26935))
