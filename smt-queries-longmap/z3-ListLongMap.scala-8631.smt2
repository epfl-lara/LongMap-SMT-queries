; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105076 () Bool)

(assert start!105076)

(declare-fun b_free!26823 () Bool)

(declare-fun b_next!26823 () Bool)

(assert (=> start!105076 (= b_free!26823 (not b_next!26823))))

(declare-fun tp!93968 () Bool)

(declare-fun b_and!44619 () Bool)

(assert (=> start!105076 (= tp!93968 b_and!44619)))

(declare-fun b!1252263 () Bool)

(declare-fun e!711218 () Bool)

(declare-fun tp_is_empty!31725 () Bool)

(assert (=> b!1252263 (= e!711218 tp_is_empty!31725)))

(declare-fun mapIsEmpty!49357 () Bool)

(declare-fun mapRes!49357 () Bool)

(assert (=> mapIsEmpty!49357 mapRes!49357))

(declare-fun mapNonEmpty!49357 () Bool)

(declare-fun tp!93967 () Bool)

(declare-fun e!711216 () Bool)

(assert (=> mapNonEmpty!49357 (= mapRes!49357 (and tp!93967 e!711216))))

(declare-fun mapKey!49357 () (_ BitVec 32))

(declare-datatypes ((V!47665 0))(
  ( (V!47666 (val!15925 Int)) )
))
(declare-datatypes ((ValueCell!15099 0))(
  ( (ValueCellFull!15099 (v!18623 V!47665)) (EmptyCell!15099) )
))
(declare-fun mapRest!49357 () (Array (_ BitVec 32) ValueCell!15099))

(declare-datatypes ((array!81110 0))(
  ( (array!81111 (arr!39119 (Array (_ BitVec 32) ValueCell!15099)) (size!39655 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81110)

(declare-fun mapValue!49357 () ValueCell!15099)

(assert (=> mapNonEmpty!49357 (= (arr!39119 _values!914) (store mapRest!49357 mapKey!49357 mapValue!49357))))

(declare-fun res!835147 () Bool)

(declare-fun e!711220 () Bool)

(assert (=> start!105076 (=> (not res!835147) (not e!711220))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105076 (= res!835147 (validMask!0 mask!1466))))

(assert (=> start!105076 e!711220))

(assert (=> start!105076 true))

(assert (=> start!105076 tp!93968))

(assert (=> start!105076 tp_is_empty!31725))

(declare-datatypes ((array!81112 0))(
  ( (array!81113 (arr!39120 (Array (_ BitVec 32) (_ BitVec 64))) (size!39656 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81112)

(declare-fun array_inv!29835 (array!81112) Bool)

(assert (=> start!105076 (array_inv!29835 _keys!1118)))

(declare-fun e!711219 () Bool)

(declare-fun array_inv!29836 (array!81110) Bool)

(assert (=> start!105076 (and (array_inv!29836 _values!914) e!711219)))

(declare-fun b!1252264 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252264 (= e!711220 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!39656 _keys!1118)))))))

(declare-datatypes ((tuple2!20540 0))(
  ( (tuple2!20541 (_1!10281 (_ BitVec 64)) (_2!10281 V!47665)) )
))
(declare-datatypes ((List!27772 0))(
  ( (Nil!27769) (Cons!27768 (h!28977 tuple2!20540) (t!41249 List!27772)) )
))
(declare-datatypes ((ListLongMap!18413 0))(
  ( (ListLongMap!18414 (toList!9222 List!27772)) )
))
(declare-fun lt!565247 () ListLongMap!18413)

(declare-fun lt!565249 () ListLongMap!18413)

(assert (=> b!1252264 (= lt!565247 lt!565249)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41633 0))(
  ( (Unit!41634) )
))
(declare-fun lt!565248 () Unit!41633)

(declare-fun minValueAfter!43 () V!47665)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47665)

(declare-fun minValueBefore!43 () V!47665)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!982 (array!81112 array!81110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47665 V!47665 V!47665 V!47665 (_ BitVec 32) Int) Unit!41633)

(assert (=> b!1252264 (= lt!565248 (lemmaNoChangeToArrayThenSameMapNoExtras!982 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5618 (array!81112 array!81110 (_ BitVec 32) (_ BitVec 32) V!47665 V!47665 (_ BitVec 32) Int) ListLongMap!18413)

(assert (=> b!1252264 (= lt!565249 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252264 (= lt!565247 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252265 () Bool)

(assert (=> b!1252265 (= e!711219 (and e!711218 mapRes!49357))))

(declare-fun condMapEmpty!49357 () Bool)

(declare-fun mapDefault!49357 () ValueCell!15099)

(assert (=> b!1252265 (= condMapEmpty!49357 (= (arr!39119 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15099)) mapDefault!49357)))))

(declare-fun b!1252266 () Bool)

(declare-fun res!835149 () Bool)

(assert (=> b!1252266 (=> (not res!835149) (not e!711220))))

(declare-datatypes ((List!27773 0))(
  ( (Nil!27770) (Cons!27769 (h!28978 (_ BitVec 64)) (t!41250 List!27773)) )
))
(declare-fun arrayNoDuplicates!0 (array!81112 (_ BitVec 32) List!27773) Bool)

(assert (=> b!1252266 (= res!835149 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27770))))

(declare-fun b!1252267 () Bool)

(declare-fun res!835148 () Bool)

(assert (=> b!1252267 (=> (not res!835148) (not e!711220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81112 (_ BitVec 32)) Bool)

(assert (=> b!1252267 (= res!835148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252268 () Bool)

(assert (=> b!1252268 (= e!711216 tp_is_empty!31725)))

(declare-fun b!1252269 () Bool)

(declare-fun res!835146 () Bool)

(assert (=> b!1252269 (=> (not res!835146) (not e!711220))))

(assert (=> b!1252269 (= res!835146 (and (= (size!39655 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39656 _keys!1118) (size!39655 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105076 res!835147) b!1252269))

(assert (= (and b!1252269 res!835146) b!1252267))

(assert (= (and b!1252267 res!835148) b!1252266))

(assert (= (and b!1252266 res!835149) b!1252264))

(assert (= (and b!1252265 condMapEmpty!49357) mapIsEmpty!49357))

(assert (= (and b!1252265 (not condMapEmpty!49357)) mapNonEmpty!49357))

(get-info :version)

(assert (= (and mapNonEmpty!49357 ((_ is ValueCellFull!15099) mapValue!49357)) b!1252268))

(assert (= (and b!1252265 ((_ is ValueCellFull!15099) mapDefault!49357)) b!1252263))

(assert (= start!105076 b!1252265))

(declare-fun m!1152923 () Bool)

(assert (=> b!1252267 m!1152923))

(declare-fun m!1152925 () Bool)

(assert (=> b!1252264 m!1152925))

(declare-fun m!1152927 () Bool)

(assert (=> b!1252264 m!1152927))

(declare-fun m!1152929 () Bool)

(assert (=> b!1252264 m!1152929))

(declare-fun m!1152931 () Bool)

(assert (=> mapNonEmpty!49357 m!1152931))

(declare-fun m!1152933 () Bool)

(assert (=> b!1252266 m!1152933))

(declare-fun m!1152935 () Bool)

(assert (=> start!105076 m!1152935))

(declare-fun m!1152937 () Bool)

(assert (=> start!105076 m!1152937))

(declare-fun m!1152939 () Bool)

(assert (=> start!105076 m!1152939))

(check-sat (not b!1252266) (not mapNonEmpty!49357) (not b_next!26823) (not b!1252264) (not start!105076) b_and!44619 (not b!1252267) tp_is_empty!31725)
(check-sat b_and!44619 (not b_next!26823))
(get-model)

(declare-fun d!137985 () Bool)

(assert (=> d!137985 (= (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!565261 () Unit!41633)

(declare-fun choose!1851 (array!81112 array!81110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47665 V!47665 V!47665 V!47665 (_ BitVec 32) Int) Unit!41633)

(assert (=> d!137985 (= lt!565261 (choose!1851 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137985 (validMask!0 mask!1466)))

(assert (=> d!137985 (= (lemmaNoChangeToArrayThenSameMapNoExtras!982 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565261)))

(declare-fun bs!35367 () Bool)

(assert (= bs!35367 d!137985))

(assert (=> bs!35367 m!1152929))

(assert (=> bs!35367 m!1152927))

(declare-fun m!1152959 () Bool)

(assert (=> bs!35367 m!1152959))

(assert (=> bs!35367 m!1152935))

(assert (=> b!1252264 d!137985))

(declare-fun b!1252315 () Bool)

(declare-fun e!711254 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1252315 (= e!711254 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252315 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252316 () Bool)

(declare-fun res!835170 () Bool)

(declare-fun e!711256 () Bool)

(assert (=> b!1252316 (=> (not res!835170) (not e!711256))))

(declare-fun lt!565276 () ListLongMap!18413)

(declare-fun contains!7513 (ListLongMap!18413 (_ BitVec 64)) Bool)

(assert (=> b!1252316 (= res!835170 (not (contains!7513 lt!565276 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!61653 () ListLongMap!18413)

(declare-fun bm!61650 () Bool)

(assert (=> bm!61650 (= call!61653 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252317 () Bool)

(declare-fun e!711252 () Bool)

(declare-fun e!711253 () Bool)

(assert (=> b!1252317 (= e!711252 e!711253)))

(declare-fun c!122244 () Bool)

(assert (=> b!1252317 (= c!122244 (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun b!1252318 () Bool)

(assert (=> b!1252318 (= e!711256 e!711252)))

(declare-fun c!122243 () Bool)

(assert (=> b!1252318 (= c!122243 e!711254)))

(declare-fun res!835171 () Bool)

(assert (=> b!1252318 (=> (not res!835171) (not e!711254))))

(assert (=> b!1252318 (= res!835171 (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun b!1252319 () Bool)

(assert (=> b!1252319 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> b!1252319 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39655 _values!914)))))

(declare-fun e!711250 () Bool)

(declare-fun apply!983 (ListLongMap!18413 (_ BitVec 64)) V!47665)

(declare-fun get!20042 (ValueCell!15099 V!47665) V!47665)

(declare-fun dynLambda!3381 (Int (_ BitVec 64)) V!47665)

(assert (=> b!1252319 (= e!711250 (= (apply!983 lt!565276 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)) (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252320 () Bool)

(declare-fun e!711251 () ListLongMap!18413)

(assert (=> b!1252320 (= e!711251 call!61653)))

(declare-fun d!137987 () Bool)

(assert (=> d!137987 e!711256))

(declare-fun res!835173 () Bool)

(assert (=> d!137987 (=> (not res!835173) (not e!711256))))

(assert (=> d!137987 (= res!835173 (not (contains!7513 lt!565276 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!711255 () ListLongMap!18413)

(assert (=> d!137987 (= lt!565276 e!711255)))

(declare-fun c!122242 () Bool)

(assert (=> d!137987 (= c!122242 (bvsge #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> d!137987 (validMask!0 mask!1466)))

(assert (=> d!137987 (= (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565276)))

(declare-fun b!1252321 () Bool)

(assert (=> b!1252321 (= e!711255 e!711251)))

(declare-fun c!122241 () Bool)

(assert (=> b!1252321 (= c!122241 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252322 () Bool)

(assert (=> b!1252322 (= e!711255 (ListLongMap!18414 Nil!27769))))

(declare-fun b!1252323 () Bool)

(assert (=> b!1252323 (= e!711252 e!711250)))

(assert (=> b!1252323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun res!835172 () Bool)

(assert (=> b!1252323 (= res!835172 (contains!7513 lt!565276 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252323 (=> (not res!835172) (not e!711250))))

(declare-fun b!1252324 () Bool)

(declare-fun lt!565281 () Unit!41633)

(declare-fun lt!565282 () Unit!41633)

(assert (=> b!1252324 (= lt!565281 lt!565282)))

(declare-fun lt!565280 () (_ BitVec 64))

(declare-fun lt!565278 () (_ BitVec 64))

(declare-fun lt!565277 () ListLongMap!18413)

(declare-fun lt!565279 () V!47665)

(declare-fun +!4139 (ListLongMap!18413 tuple2!20540) ListLongMap!18413)

(assert (=> b!1252324 (not (contains!7513 (+!4139 lt!565277 (tuple2!20541 lt!565280 lt!565279)) lt!565278))))

(declare-fun addStillNotContains!311 (ListLongMap!18413 (_ BitVec 64) V!47665 (_ BitVec 64)) Unit!41633)

(assert (=> b!1252324 (= lt!565282 (addStillNotContains!311 lt!565277 lt!565280 lt!565279 lt!565278))))

(assert (=> b!1252324 (= lt!565278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252324 (= lt!565279 (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252324 (= lt!565280 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252324 (= lt!565277 call!61653)))

(assert (=> b!1252324 (= e!711251 (+!4139 call!61653 (tuple2!20541 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000) (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252325 () Bool)

(assert (=> b!1252325 (= e!711253 (= lt!565276 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252326 () Bool)

(declare-fun isEmpty!1025 (ListLongMap!18413) Bool)

(assert (=> b!1252326 (= e!711253 (isEmpty!1025 lt!565276))))

(assert (= (and d!137987 c!122242) b!1252322))

(assert (= (and d!137987 (not c!122242)) b!1252321))

(assert (= (and b!1252321 c!122241) b!1252324))

(assert (= (and b!1252321 (not c!122241)) b!1252320))

(assert (= (or b!1252324 b!1252320) bm!61650))

(assert (= (and d!137987 res!835173) b!1252316))

(assert (= (and b!1252316 res!835170) b!1252318))

(assert (= (and b!1252318 res!835171) b!1252315))

(assert (= (and b!1252318 c!122243) b!1252323))

(assert (= (and b!1252318 (not c!122243)) b!1252317))

(assert (= (and b!1252323 res!835172) b!1252319))

(assert (= (and b!1252317 c!122244) b!1252325))

(assert (= (and b!1252317 (not c!122244)) b!1252326))

(declare-fun b_lambda!22567 () Bool)

(assert (=> (not b_lambda!22567) (not b!1252319)))

(declare-fun t!41254 () Bool)

(declare-fun tb!11293 () Bool)

(assert (=> (and start!105076 (= defaultEntry!922 defaultEntry!922) t!41254) tb!11293))

(declare-fun result!23287 () Bool)

(assert (=> tb!11293 (= result!23287 tp_is_empty!31725)))

(assert (=> b!1252319 t!41254))

(declare-fun b_and!44623 () Bool)

(assert (= b_and!44619 (and (=> t!41254 result!23287) b_and!44623)))

(declare-fun b_lambda!22569 () Bool)

(assert (=> (not b_lambda!22569) (not b!1252324)))

(assert (=> b!1252324 t!41254))

(declare-fun b_and!44625 () Bool)

(assert (= b_and!44623 (and (=> t!41254 result!23287) b_and!44625)))

(declare-fun m!1152961 () Bool)

(assert (=> b!1252325 m!1152961))

(declare-fun m!1152963 () Bool)

(assert (=> b!1252316 m!1152963))

(declare-fun m!1152965 () Bool)

(assert (=> b!1252315 m!1152965))

(assert (=> b!1252315 m!1152965))

(declare-fun m!1152967 () Bool)

(assert (=> b!1252315 m!1152967))

(assert (=> b!1252323 m!1152965))

(assert (=> b!1252323 m!1152965))

(declare-fun m!1152969 () Bool)

(assert (=> b!1252323 m!1152969))

(declare-fun m!1152971 () Bool)

(assert (=> b!1252319 m!1152971))

(declare-fun m!1152973 () Bool)

(assert (=> b!1252319 m!1152973))

(declare-fun m!1152975 () Bool)

(assert (=> b!1252319 m!1152975))

(assert (=> b!1252319 m!1152971))

(assert (=> b!1252319 m!1152965))

(declare-fun m!1152977 () Bool)

(assert (=> b!1252319 m!1152977))

(assert (=> b!1252319 m!1152973))

(assert (=> b!1252319 m!1152965))

(declare-fun m!1152979 () Bool)

(assert (=> b!1252326 m!1152979))

(declare-fun m!1152981 () Bool)

(assert (=> d!137987 m!1152981))

(assert (=> d!137987 m!1152935))

(declare-fun m!1152983 () Bool)

(assert (=> b!1252324 m!1152983))

(declare-fun m!1152985 () Bool)

(assert (=> b!1252324 m!1152985))

(declare-fun m!1152987 () Bool)

(assert (=> b!1252324 m!1152987))

(declare-fun m!1152989 () Bool)

(assert (=> b!1252324 m!1152989))

(assert (=> b!1252324 m!1152971))

(assert (=> b!1252324 m!1152973))

(assert (=> b!1252324 m!1152975))

(assert (=> b!1252324 m!1152971))

(assert (=> b!1252324 m!1152983))

(assert (=> b!1252324 m!1152973))

(assert (=> b!1252324 m!1152965))

(assert (=> bm!61650 m!1152961))

(assert (=> b!1252321 m!1152965))

(assert (=> b!1252321 m!1152965))

(assert (=> b!1252321 m!1152967))

(assert (=> b!1252264 d!137987))

(declare-fun b!1252329 () Bool)

(declare-fun e!711261 () Bool)

(assert (=> b!1252329 (= e!711261 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252329 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252330 () Bool)

(declare-fun res!835174 () Bool)

(declare-fun e!711263 () Bool)

(assert (=> b!1252330 (=> (not res!835174) (not e!711263))))

(declare-fun lt!565283 () ListLongMap!18413)

(assert (=> b!1252330 (= res!835174 (not (contains!7513 lt!565283 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!61651 () Bool)

(declare-fun call!61654 () ListLongMap!18413)

(assert (=> bm!61651 (= call!61654 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252331 () Bool)

(declare-fun e!711259 () Bool)

(declare-fun e!711260 () Bool)

(assert (=> b!1252331 (= e!711259 e!711260)))

(declare-fun c!122248 () Bool)

(assert (=> b!1252331 (= c!122248 (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun b!1252332 () Bool)

(assert (=> b!1252332 (= e!711263 e!711259)))

(declare-fun c!122247 () Bool)

(assert (=> b!1252332 (= c!122247 e!711261)))

(declare-fun res!835175 () Bool)

(assert (=> b!1252332 (=> (not res!835175) (not e!711261))))

(assert (=> b!1252332 (= res!835175 (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun b!1252333 () Bool)

(assert (=> b!1252333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> b!1252333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39655 _values!914)))))

(declare-fun e!711257 () Bool)

(assert (=> b!1252333 (= e!711257 (= (apply!983 lt!565283 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)) (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252334 () Bool)

(declare-fun e!711258 () ListLongMap!18413)

(assert (=> b!1252334 (= e!711258 call!61654)))

(declare-fun d!137989 () Bool)

(assert (=> d!137989 e!711263))

(declare-fun res!835177 () Bool)

(assert (=> d!137989 (=> (not res!835177) (not e!711263))))

(assert (=> d!137989 (= res!835177 (not (contains!7513 lt!565283 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!711262 () ListLongMap!18413)

(assert (=> d!137989 (= lt!565283 e!711262)))

(declare-fun c!122246 () Bool)

(assert (=> d!137989 (= c!122246 (bvsge #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> d!137989 (validMask!0 mask!1466)))

(assert (=> d!137989 (= (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!565283)))

(declare-fun b!1252335 () Bool)

(assert (=> b!1252335 (= e!711262 e!711258)))

(declare-fun c!122245 () Bool)

(assert (=> b!1252335 (= c!122245 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252336 () Bool)

(assert (=> b!1252336 (= e!711262 (ListLongMap!18414 Nil!27769))))

(declare-fun b!1252337 () Bool)

(assert (=> b!1252337 (= e!711259 e!711257)))

(assert (=> b!1252337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(declare-fun res!835176 () Bool)

(assert (=> b!1252337 (= res!835176 (contains!7513 lt!565283 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252337 (=> (not res!835176) (not e!711257))))

(declare-fun b!1252338 () Bool)

(declare-fun lt!565288 () Unit!41633)

(declare-fun lt!565289 () Unit!41633)

(assert (=> b!1252338 (= lt!565288 lt!565289)))

(declare-fun lt!565286 () V!47665)

(declare-fun lt!565284 () ListLongMap!18413)

(declare-fun lt!565285 () (_ BitVec 64))

(declare-fun lt!565287 () (_ BitVec 64))

(assert (=> b!1252338 (not (contains!7513 (+!4139 lt!565284 (tuple2!20541 lt!565287 lt!565286)) lt!565285))))

(assert (=> b!1252338 (= lt!565289 (addStillNotContains!311 lt!565284 lt!565287 lt!565286 lt!565285))))

(assert (=> b!1252338 (= lt!565285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252338 (= lt!565286 (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252338 (= lt!565287 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252338 (= lt!565284 call!61654)))

(assert (=> b!1252338 (= e!711258 (+!4139 call!61654 (tuple2!20541 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000) (get!20042 (select (arr!39119 _values!914) #b00000000000000000000000000000000) (dynLambda!3381 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252339 () Bool)

(assert (=> b!1252339 (= e!711260 (= lt!565283 (getCurrentListMapNoExtraKeys!5618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1252340 () Bool)

(assert (=> b!1252340 (= e!711260 (isEmpty!1025 lt!565283))))

(assert (= (and d!137989 c!122246) b!1252336))

(assert (= (and d!137989 (not c!122246)) b!1252335))

(assert (= (and b!1252335 c!122245) b!1252338))

(assert (= (and b!1252335 (not c!122245)) b!1252334))

(assert (= (or b!1252338 b!1252334) bm!61651))

(assert (= (and d!137989 res!835177) b!1252330))

(assert (= (and b!1252330 res!835174) b!1252332))

(assert (= (and b!1252332 res!835175) b!1252329))

(assert (= (and b!1252332 c!122247) b!1252337))

(assert (= (and b!1252332 (not c!122247)) b!1252331))

(assert (= (and b!1252337 res!835176) b!1252333))

(assert (= (and b!1252331 c!122248) b!1252339))

(assert (= (and b!1252331 (not c!122248)) b!1252340))

(declare-fun b_lambda!22571 () Bool)

(assert (=> (not b_lambda!22571) (not b!1252333)))

(assert (=> b!1252333 t!41254))

(declare-fun b_and!44627 () Bool)

(assert (= b_and!44625 (and (=> t!41254 result!23287) b_and!44627)))

(declare-fun b_lambda!22573 () Bool)

(assert (=> (not b_lambda!22573) (not b!1252338)))

(assert (=> b!1252338 t!41254))

(declare-fun b_and!44629 () Bool)

(assert (= b_and!44627 (and (=> t!41254 result!23287) b_and!44629)))

(declare-fun m!1152991 () Bool)

(assert (=> b!1252339 m!1152991))

(declare-fun m!1152993 () Bool)

(assert (=> b!1252330 m!1152993))

(assert (=> b!1252329 m!1152965))

(assert (=> b!1252329 m!1152965))

(assert (=> b!1252329 m!1152967))

(assert (=> b!1252337 m!1152965))

(assert (=> b!1252337 m!1152965))

(declare-fun m!1152995 () Bool)

(assert (=> b!1252337 m!1152995))

(assert (=> b!1252333 m!1152971))

(assert (=> b!1252333 m!1152973))

(assert (=> b!1252333 m!1152975))

(assert (=> b!1252333 m!1152971))

(assert (=> b!1252333 m!1152965))

(declare-fun m!1152997 () Bool)

(assert (=> b!1252333 m!1152997))

(assert (=> b!1252333 m!1152973))

(assert (=> b!1252333 m!1152965))

(declare-fun m!1152999 () Bool)

(assert (=> b!1252340 m!1152999))

(declare-fun m!1153001 () Bool)

(assert (=> d!137989 m!1153001))

(assert (=> d!137989 m!1152935))

(declare-fun m!1153003 () Bool)

(assert (=> b!1252338 m!1153003))

(declare-fun m!1153005 () Bool)

(assert (=> b!1252338 m!1153005))

(declare-fun m!1153007 () Bool)

(assert (=> b!1252338 m!1153007))

(declare-fun m!1153009 () Bool)

(assert (=> b!1252338 m!1153009))

(assert (=> b!1252338 m!1152971))

(assert (=> b!1252338 m!1152973))

(assert (=> b!1252338 m!1152975))

(assert (=> b!1252338 m!1152971))

(assert (=> b!1252338 m!1153003))

(assert (=> b!1252338 m!1152973))

(assert (=> b!1252338 m!1152965))

(assert (=> bm!61651 m!1152991))

(assert (=> b!1252335 m!1152965))

(assert (=> b!1252335 m!1152965))

(assert (=> b!1252335 m!1152967))

(assert (=> b!1252264 d!137989))

(declare-fun b!1252349 () Bool)

(declare-fun e!711271 () Bool)

(declare-fun e!711270 () Bool)

(assert (=> b!1252349 (= e!711271 e!711270)))

(declare-fun lt!565298 () (_ BitVec 64))

(assert (=> b!1252349 (= lt!565298 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565297 () Unit!41633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81112 (_ BitVec 64) (_ BitVec 32)) Unit!41633)

(assert (=> b!1252349 (= lt!565297 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565298 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1252349 (arrayContainsKey!0 _keys!1118 lt!565298 #b00000000000000000000000000000000)))

(declare-fun lt!565296 () Unit!41633)

(assert (=> b!1252349 (= lt!565296 lt!565297)))

(declare-fun res!835182 () Bool)

(declare-datatypes ((SeekEntryResult!9961 0))(
  ( (MissingZero!9961 (index!42215 (_ BitVec 32))) (Found!9961 (index!42216 (_ BitVec 32))) (Intermediate!9961 (undefined!10773 Bool) (index!42217 (_ BitVec 32)) (x!110197 (_ BitVec 32))) (Undefined!9961) (MissingVacant!9961 (index!42218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81112 (_ BitVec 32)) SeekEntryResult!9961)

(assert (=> b!1252349 (= res!835182 (= (seekEntryOrOpen!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9961 #b00000000000000000000000000000000)))))

(assert (=> b!1252349 (=> (not res!835182) (not e!711270))))

(declare-fun b!1252350 () Bool)

(declare-fun call!61657 () Bool)

(assert (=> b!1252350 (= e!711271 call!61657)))

(declare-fun bm!61654 () Bool)

(assert (=> bm!61654 (= call!61657 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1252351 () Bool)

(assert (=> b!1252351 (= e!711270 call!61657)))

(declare-fun b!1252352 () Bool)

(declare-fun e!711272 () Bool)

(assert (=> b!1252352 (= e!711272 e!711271)))

(declare-fun c!122251 () Bool)

(assert (=> b!1252352 (= c!122251 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137991 () Bool)

(declare-fun res!835183 () Bool)

(assert (=> d!137991 (=> res!835183 e!711272)))

(assert (=> d!137991 (= res!835183 (bvsge #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> d!137991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711272)))

(assert (= (and d!137991 (not res!835183)) b!1252352))

(assert (= (and b!1252352 c!122251) b!1252349))

(assert (= (and b!1252352 (not c!122251)) b!1252350))

(assert (= (and b!1252349 res!835182) b!1252351))

(assert (= (or b!1252351 b!1252350) bm!61654))

(assert (=> b!1252349 m!1152965))

(declare-fun m!1153011 () Bool)

(assert (=> b!1252349 m!1153011))

(declare-fun m!1153013 () Bool)

(assert (=> b!1252349 m!1153013))

(assert (=> b!1252349 m!1152965))

(declare-fun m!1153015 () Bool)

(assert (=> b!1252349 m!1153015))

(declare-fun m!1153017 () Bool)

(assert (=> bm!61654 m!1153017))

(assert (=> b!1252352 m!1152965))

(assert (=> b!1252352 m!1152965))

(assert (=> b!1252352 m!1152967))

(assert (=> b!1252267 d!137991))

(declare-fun b!1252363 () Bool)

(declare-fun e!711284 () Bool)

(declare-fun e!711283 () Bool)

(assert (=> b!1252363 (= e!711284 e!711283)))

(declare-fun c!122254 () Bool)

(assert (=> b!1252363 (= c!122254 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252364 () Bool)

(declare-fun call!61660 () Bool)

(assert (=> b!1252364 (= e!711283 call!61660)))

(declare-fun b!1252365 () Bool)

(assert (=> b!1252365 (= e!711283 call!61660)))

(declare-fun bm!61657 () Bool)

(assert (=> bm!61657 (= call!61660 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122254 (Cons!27769 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000) Nil!27770) Nil!27770)))))

(declare-fun b!1252366 () Bool)

(declare-fun e!711281 () Bool)

(declare-fun contains!7514 (List!27773 (_ BitVec 64)) Bool)

(assert (=> b!1252366 (= e!711281 (contains!7514 Nil!27770 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137993 () Bool)

(declare-fun res!835190 () Bool)

(declare-fun e!711282 () Bool)

(assert (=> d!137993 (=> res!835190 e!711282)))

(assert (=> d!137993 (= res!835190 (bvsge #b00000000000000000000000000000000 (size!39656 _keys!1118)))))

(assert (=> d!137993 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27770) e!711282)))

(declare-fun b!1252367 () Bool)

(assert (=> b!1252367 (= e!711282 e!711284)))

(declare-fun res!835192 () Bool)

(assert (=> b!1252367 (=> (not res!835192) (not e!711284))))

(assert (=> b!1252367 (= res!835192 (not e!711281))))

(declare-fun res!835191 () Bool)

(assert (=> b!1252367 (=> (not res!835191) (not e!711281))))

(assert (=> b!1252367 (= res!835191 (validKeyInArray!0 (select (arr!39120 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137993 (not res!835190)) b!1252367))

(assert (= (and b!1252367 res!835191) b!1252366))

(assert (= (and b!1252367 res!835192) b!1252363))

(assert (= (and b!1252363 c!122254) b!1252365))

(assert (= (and b!1252363 (not c!122254)) b!1252364))

(assert (= (or b!1252365 b!1252364) bm!61657))

(assert (=> b!1252363 m!1152965))

(assert (=> b!1252363 m!1152965))

(assert (=> b!1252363 m!1152967))

(assert (=> bm!61657 m!1152965))

(declare-fun m!1153019 () Bool)

(assert (=> bm!61657 m!1153019))

(assert (=> b!1252366 m!1152965))

(assert (=> b!1252366 m!1152965))

(declare-fun m!1153021 () Bool)

(assert (=> b!1252366 m!1153021))

(assert (=> b!1252367 m!1152965))

(assert (=> b!1252367 m!1152965))

(assert (=> b!1252367 m!1152967))

(assert (=> b!1252266 d!137993))

(declare-fun d!137995 () Bool)

(assert (=> d!137995 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105076 d!137995))

(declare-fun d!137997 () Bool)

(assert (=> d!137997 (= (array_inv!29835 _keys!1118) (bvsge (size!39656 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105076 d!137997))

(declare-fun d!137999 () Bool)

(assert (=> d!137999 (= (array_inv!29836 _values!914) (bvsge (size!39655 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105076 d!137999))

(declare-fun mapIsEmpty!49363 () Bool)

(declare-fun mapRes!49363 () Bool)

(assert (=> mapIsEmpty!49363 mapRes!49363))

(declare-fun b!1252374 () Bool)

(declare-fun e!711290 () Bool)

(assert (=> b!1252374 (= e!711290 tp_is_empty!31725)))

(declare-fun mapNonEmpty!49363 () Bool)

(declare-fun tp!93977 () Bool)

(assert (=> mapNonEmpty!49363 (= mapRes!49363 (and tp!93977 e!711290))))

(declare-fun mapKey!49363 () (_ BitVec 32))

(declare-fun mapValue!49363 () ValueCell!15099)

(declare-fun mapRest!49363 () (Array (_ BitVec 32) ValueCell!15099))

(assert (=> mapNonEmpty!49363 (= mapRest!49357 (store mapRest!49363 mapKey!49363 mapValue!49363))))

(declare-fun b!1252375 () Bool)

(declare-fun e!711289 () Bool)

(assert (=> b!1252375 (= e!711289 tp_is_empty!31725)))

(declare-fun condMapEmpty!49363 () Bool)

(declare-fun mapDefault!49363 () ValueCell!15099)

(assert (=> mapNonEmpty!49357 (= condMapEmpty!49363 (= mapRest!49357 ((as const (Array (_ BitVec 32) ValueCell!15099)) mapDefault!49363)))))

(assert (=> mapNonEmpty!49357 (= tp!93967 (and e!711289 mapRes!49363))))

(assert (= (and mapNonEmpty!49357 condMapEmpty!49363) mapIsEmpty!49363))

(assert (= (and mapNonEmpty!49357 (not condMapEmpty!49363)) mapNonEmpty!49363))

(assert (= (and mapNonEmpty!49363 ((_ is ValueCellFull!15099) mapValue!49363)) b!1252374))

(assert (= (and mapNonEmpty!49357 ((_ is ValueCellFull!15099) mapDefault!49363)) b!1252375))

(declare-fun m!1153023 () Bool)

(assert (=> mapNonEmpty!49363 m!1153023))

(declare-fun b_lambda!22575 () Bool)

(assert (= b_lambda!22571 (or (and start!105076 b_free!26823) b_lambda!22575)))

(declare-fun b_lambda!22577 () Bool)

(assert (= b_lambda!22573 (or (and start!105076 b_free!26823) b_lambda!22577)))

(declare-fun b_lambda!22579 () Bool)

(assert (= b_lambda!22567 (or (and start!105076 b_free!26823) b_lambda!22579)))

(declare-fun b_lambda!22581 () Bool)

(assert (= b_lambda!22569 (or (and start!105076 b_free!26823) b_lambda!22581)))

(check-sat (not b!1252324) (not bm!61657) (not b!1252338) (not b!1252367) (not d!137989) (not b!1252335) (not bm!61650) (not b!1252325) (not bm!61654) (not b!1252366) (not b_lambda!22577) (not b!1252321) (not b!1252319) (not b!1252340) (not d!137985) (not b!1252323) (not b!1252333) (not b_next!26823) (not b!1252326) (not b!1252339) (not mapNonEmpty!49363) (not b!1252330) (not b_lambda!22581) (not d!137987) (not b!1252337) tp_is_empty!31725 (not b!1252329) (not b!1252315) (not b_lambda!22579) (not b!1252316) (not b!1252363) (not b!1252349) (not b_lambda!22575) (not b!1252352) b_and!44629 (not bm!61651))
(check-sat b_and!44629 (not b_next!26823))
