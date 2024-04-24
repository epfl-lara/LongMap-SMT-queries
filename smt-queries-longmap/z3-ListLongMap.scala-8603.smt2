; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105072 () Bool)

(assert start!105072)

(declare-fun b_free!26653 () Bool)

(declare-fun b_next!26653 () Bool)

(assert (=> start!105072 (= b_free!26653 (not b_next!26653))))

(declare-fun tp!93449 () Bool)

(declare-fun b_and!44423 () Bool)

(assert (=> start!105072 (= tp!93449 b_and!44423)))

(declare-fun b!1251051 () Bool)

(declare-fun res!834162 () Bool)

(declare-fun e!710204 () Bool)

(assert (=> b!1251051 (=> (not res!834162) (not e!710204))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47439 0))(
  ( (V!47440 (val!15840 Int)) )
))
(declare-datatypes ((ValueCell!15014 0))(
  ( (ValueCellFull!15014 (v!18532 V!47439)) (EmptyCell!15014) )
))
(declare-datatypes ((array!80827 0))(
  ( (array!80828 (arr!38976 (Array (_ BitVec 32) ValueCell!15014)) (size!39513 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80827)

(declare-datatypes ((array!80829 0))(
  ( (array!80830 (arr!38977 (Array (_ BitVec 32) (_ BitVec 64))) (size!39514 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80829)

(assert (=> b!1251051 (= res!834162 (and (= (size!39513 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39514 _keys!1118) (size!39513 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!834163 () Bool)

(assert (=> start!105072 (=> (not res!834163) (not e!710204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105072 (= res!834163 (validMask!0 mask!1466))))

(assert (=> start!105072 e!710204))

(assert (=> start!105072 true))

(assert (=> start!105072 tp!93449))

(declare-fun tp_is_empty!31555 () Bool)

(assert (=> start!105072 tp_is_empty!31555))

(declare-fun array_inv!29851 (array!80829) Bool)

(assert (=> start!105072 (array_inv!29851 _keys!1118)))

(declare-fun e!710203 () Bool)

(declare-fun array_inv!29852 (array!80827) Bool)

(assert (=> start!105072 (and (array_inv!29852 _values!914) e!710203)))

(declare-fun b!1251052 () Bool)

(declare-fun res!834161 () Bool)

(assert (=> b!1251052 (=> (not res!834161) (not e!710204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80829 (_ BitVec 32)) Bool)

(assert (=> b!1251052 (= res!834161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49093 () Bool)

(declare-fun mapRes!49093 () Bool)

(declare-fun tp!93448 () Bool)

(declare-fun e!710201 () Bool)

(assert (=> mapNonEmpty!49093 (= mapRes!49093 (and tp!93448 e!710201))))

(declare-fun mapValue!49093 () ValueCell!15014)

(declare-fun mapKey!49093 () (_ BitVec 32))

(declare-fun mapRest!49093 () (Array (_ BitVec 32) ValueCell!15014))

(assert (=> mapNonEmpty!49093 (= (arr!38976 _values!914) (store mapRest!49093 mapKey!49093 mapValue!49093))))

(declare-fun mapIsEmpty!49093 () Bool)

(assert (=> mapIsEmpty!49093 mapRes!49093))

(declare-fun b!1251053 () Bool)

(declare-fun res!834160 () Bool)

(assert (=> b!1251053 (=> (not res!834160) (not e!710204))))

(declare-datatypes ((List!27687 0))(
  ( (Nil!27684) (Cons!27683 (h!28901 (_ BitVec 64)) (t!41150 List!27687)) )
))
(declare-fun arrayNoDuplicates!0 (array!80829 (_ BitVec 32) List!27687) Bool)

(assert (=> b!1251053 (= res!834160 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27684))))

(declare-fun b!1251054 () Bool)

(declare-fun e!710200 () Bool)

(assert (=> b!1251054 (= e!710203 (and e!710200 mapRes!49093))))

(declare-fun condMapEmpty!49093 () Bool)

(declare-fun mapDefault!49093 () ValueCell!15014)

(assert (=> b!1251054 (= condMapEmpty!49093 (= (arr!38976 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15014)) mapDefault!49093)))))

(declare-fun b!1251055 () Bool)

(assert (=> b!1251055 (= e!710200 tp_is_empty!31555)))

(declare-fun b!1251056 () Bool)

(assert (=> b!1251056 (= e!710201 tp_is_empty!31555)))

(declare-fun b!1251057 () Bool)

(assert (=> b!1251057 (= e!710204 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39514 _keys!1118)))))))

(declare-datatypes ((tuple2!20432 0))(
  ( (tuple2!20433 (_1!10227 (_ BitVec 64)) (_2!10227 V!47439)) )
))
(declare-datatypes ((List!27688 0))(
  ( (Nil!27685) (Cons!27684 (h!28902 tuple2!20432) (t!41151 List!27688)) )
))
(declare-datatypes ((ListLongMap!18313 0))(
  ( (ListLongMap!18314 (toList!9172 List!27688)) )
))
(declare-fun lt!564346 () ListLongMap!18313)

(declare-fun lt!564345 () ListLongMap!18313)

(assert (=> b!1251057 (= lt!564346 lt!564345)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41484 0))(
  ( (Unit!41485) )
))
(declare-fun lt!564347 () Unit!41484)

(declare-fun minValueAfter!43 () V!47439)

(declare-fun zeroValue!871 () V!47439)

(declare-fun minValueBefore!43 () V!47439)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!921 (array!80829 array!80827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 V!47439 V!47439 (_ BitVec 32) Int) Unit!41484)

(assert (=> b!1251057 (= lt!564347 (lemmaNoChangeToArrayThenSameMapNoExtras!921 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5607 (array!80829 array!80827 (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 (_ BitVec 32) Int) ListLongMap!18313)

(assert (=> b!1251057 (= lt!564345 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251057 (= lt!564346 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105072 res!834163) b!1251051))

(assert (= (and b!1251051 res!834162) b!1251052))

(assert (= (and b!1251052 res!834161) b!1251053))

(assert (= (and b!1251053 res!834160) b!1251057))

(assert (= (and b!1251054 condMapEmpty!49093) mapIsEmpty!49093))

(assert (= (and b!1251054 (not condMapEmpty!49093)) mapNonEmpty!49093))

(get-info :version)

(assert (= (and mapNonEmpty!49093 ((_ is ValueCellFull!15014) mapValue!49093)) b!1251056))

(assert (= (and b!1251054 ((_ is ValueCellFull!15014) mapDefault!49093)) b!1251055))

(assert (= start!105072 b!1251054))

(declare-fun m!1152243 () Bool)

(assert (=> mapNonEmpty!49093 m!1152243))

(declare-fun m!1152245 () Bool)

(assert (=> start!105072 m!1152245))

(declare-fun m!1152247 () Bool)

(assert (=> start!105072 m!1152247))

(declare-fun m!1152249 () Bool)

(assert (=> start!105072 m!1152249))

(declare-fun m!1152251 () Bool)

(assert (=> b!1251053 m!1152251))

(declare-fun m!1152253 () Bool)

(assert (=> b!1251057 m!1152253))

(declare-fun m!1152255 () Bool)

(assert (=> b!1251057 m!1152255))

(declare-fun m!1152257 () Bool)

(assert (=> b!1251057 m!1152257))

(declare-fun m!1152259 () Bool)

(assert (=> b!1251052 m!1152259))

(check-sat (not b!1251053) tp_is_empty!31555 (not b!1251057) (not b!1251052) (not start!105072) (not mapNonEmpty!49093) b_and!44423 (not b_next!26653))
(check-sat b_and!44423 (not b_next!26653))
(get-model)

(declare-fun b!1251108 () Bool)

(declare-fun e!710241 () Bool)

(declare-fun call!61646 () Bool)

(assert (=> b!1251108 (= e!710241 call!61646)))

(declare-fun d!138313 () Bool)

(declare-fun res!834193 () Bool)

(declare-fun e!710243 () Bool)

(assert (=> d!138313 (=> res!834193 e!710243)))

(assert (=> d!138313 (= res!834193 (bvsge #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> d!138313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!710243)))

(declare-fun b!1251109 () Bool)

(assert (=> b!1251109 (= e!710243 e!710241)))

(declare-fun c!122527 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1251109 (= c!122527 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251110 () Bool)

(declare-fun e!710242 () Bool)

(assert (=> b!1251110 (= e!710241 e!710242)))

(declare-fun lt!564373 () (_ BitVec 64))

(assert (=> b!1251110 (= lt!564373 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564372 () Unit!41484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80829 (_ BitVec 64) (_ BitVec 32)) Unit!41484)

(assert (=> b!1251110 (= lt!564372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!564373 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1251110 (arrayContainsKey!0 _keys!1118 lt!564373 #b00000000000000000000000000000000)))

(declare-fun lt!564374 () Unit!41484)

(assert (=> b!1251110 (= lt!564374 lt!564372)))

(declare-fun res!834192 () Bool)

(declare-datatypes ((SeekEntryResult!9914 0))(
  ( (MissingZero!9914 (index!42027 (_ BitVec 32))) (Found!9914 (index!42028 (_ BitVec 32))) (Intermediate!9914 (undefined!10726 Bool) (index!42029 (_ BitVec 32)) (x!109915 (_ BitVec 32))) (Undefined!9914) (MissingVacant!9914 (index!42030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80829 (_ BitVec 32)) SeekEntryResult!9914)

(assert (=> b!1251110 (= res!834192 (= (seekEntryOrOpen!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9914 #b00000000000000000000000000000000)))))

(assert (=> b!1251110 (=> (not res!834192) (not e!710242))))

(declare-fun bm!61643 () Bool)

(assert (=> bm!61643 (= call!61646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1251111 () Bool)

(assert (=> b!1251111 (= e!710242 call!61646)))

(assert (= (and d!138313 (not res!834193)) b!1251109))

(assert (= (and b!1251109 c!122527) b!1251110))

(assert (= (and b!1251109 (not c!122527)) b!1251108))

(assert (= (and b!1251110 res!834192) b!1251111))

(assert (= (or b!1251111 b!1251108) bm!61643))

(declare-fun m!1152297 () Bool)

(assert (=> b!1251109 m!1152297))

(assert (=> b!1251109 m!1152297))

(declare-fun m!1152299 () Bool)

(assert (=> b!1251109 m!1152299))

(assert (=> b!1251110 m!1152297))

(declare-fun m!1152301 () Bool)

(assert (=> b!1251110 m!1152301))

(declare-fun m!1152303 () Bool)

(assert (=> b!1251110 m!1152303))

(assert (=> b!1251110 m!1152297))

(declare-fun m!1152305 () Bool)

(assert (=> b!1251110 m!1152305))

(declare-fun m!1152307 () Bool)

(assert (=> bm!61643 m!1152307))

(assert (=> b!1251052 d!138313))

(declare-fun d!138315 () Bool)

(assert (=> d!138315 (= (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564377 () Unit!41484)

(declare-fun choose!1850 (array!80829 array!80827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47439 V!47439 V!47439 V!47439 (_ BitVec 32) Int) Unit!41484)

(assert (=> d!138315 (= lt!564377 (choose!1850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138315 (validMask!0 mask!1466)))

(assert (=> d!138315 (= (lemmaNoChangeToArrayThenSameMapNoExtras!921 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564377)))

(declare-fun bs!35292 () Bool)

(assert (= bs!35292 d!138315))

(assert (=> bs!35292 m!1152257))

(assert (=> bs!35292 m!1152255))

(declare-fun m!1152309 () Bool)

(assert (=> bs!35292 m!1152309))

(assert (=> bs!35292 m!1152245))

(assert (=> b!1251057 d!138315))

(declare-fun b!1251136 () Bool)

(declare-fun lt!564393 () Unit!41484)

(declare-fun lt!564396 () Unit!41484)

(assert (=> b!1251136 (= lt!564393 lt!564396)))

(declare-fun lt!564392 () (_ BitVec 64))

(declare-fun lt!564394 () V!47439)

(declare-fun lt!564397 () (_ BitVec 64))

(declare-fun lt!564398 () ListLongMap!18313)

(declare-fun contains!7503 (ListLongMap!18313 (_ BitVec 64)) Bool)

(declare-fun +!4193 (ListLongMap!18313 tuple2!20432) ListLongMap!18313)

(assert (=> b!1251136 (not (contains!7503 (+!4193 lt!564398 (tuple2!20433 lt!564397 lt!564394)) lt!564392))))

(declare-fun addStillNotContains!310 (ListLongMap!18313 (_ BitVec 64) V!47439 (_ BitVec 64)) Unit!41484)

(assert (=> b!1251136 (= lt!564396 (addStillNotContains!310 lt!564398 lt!564397 lt!564394 lt!564392))))

(assert (=> b!1251136 (= lt!564392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20034 (ValueCell!15014 V!47439) V!47439)

(declare-fun dynLambda!3441 (Int (_ BitVec 64)) V!47439)

(assert (=> b!1251136 (= lt!564394 (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251136 (= lt!564397 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61649 () ListLongMap!18313)

(assert (=> b!1251136 (= lt!564398 call!61649)))

(declare-fun e!710258 () ListLongMap!18313)

(assert (=> b!1251136 (= e!710258 (+!4193 call!61649 (tuple2!20433 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1251137 () Bool)

(declare-fun e!710263 () Bool)

(declare-fun lt!564395 () ListLongMap!18313)

(assert (=> b!1251137 (= e!710263 (= lt!564395 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251138 () Bool)

(declare-fun e!710264 () Bool)

(assert (=> b!1251138 (= e!710264 e!710263)))

(declare-fun c!122538 () Bool)

(assert (=> b!1251138 (= c!122538 (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun b!1251139 () Bool)

(declare-fun e!710260 () ListLongMap!18313)

(assert (=> b!1251139 (= e!710260 (ListLongMap!18314 Nil!27685))))

(declare-fun b!1251140 () Bool)

(declare-fun isEmpty!1026 (ListLongMap!18313) Bool)

(assert (=> b!1251140 (= e!710263 (isEmpty!1026 lt!564395))))

(declare-fun b!1251141 () Bool)

(assert (=> b!1251141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> b!1251141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39513 _values!914)))))

(declare-fun e!710261 () Bool)

(declare-fun apply!989 (ListLongMap!18313 (_ BitVec 64)) V!47439)

(assert (=> b!1251141 (= e!710261 (= (apply!989 lt!564395 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)) (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251142 () Bool)

(declare-fun e!710259 () Bool)

(assert (=> b!1251142 (= e!710259 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251142 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138317 () Bool)

(declare-fun e!710262 () Bool)

(assert (=> d!138317 e!710262))

(declare-fun res!834204 () Bool)

(assert (=> d!138317 (=> (not res!834204) (not e!710262))))

(assert (=> d!138317 (= res!834204 (not (contains!7503 lt!564395 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138317 (= lt!564395 e!710260)))

(declare-fun c!122539 () Bool)

(assert (=> d!138317 (= c!122539 (bvsge #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> d!138317 (validMask!0 mask!1466)))

(assert (=> d!138317 (= (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564395)))

(declare-fun b!1251143 () Bool)

(declare-fun res!834203 () Bool)

(assert (=> b!1251143 (=> (not res!834203) (not e!710262))))

(assert (=> b!1251143 (= res!834203 (not (contains!7503 lt!564395 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251144 () Bool)

(assert (=> b!1251144 (= e!710262 e!710264)))

(declare-fun c!122536 () Bool)

(assert (=> b!1251144 (= c!122536 e!710259)))

(declare-fun res!834202 () Bool)

(assert (=> b!1251144 (=> (not res!834202) (not e!710259))))

(assert (=> b!1251144 (= res!834202 (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun b!1251145 () Bool)

(assert (=> b!1251145 (= e!710258 call!61649)))

(declare-fun b!1251146 () Bool)

(assert (=> b!1251146 (= e!710260 e!710258)))

(declare-fun c!122537 () Bool)

(assert (=> b!1251146 (= c!122537 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251147 () Bool)

(assert (=> b!1251147 (= e!710264 e!710261)))

(assert (=> b!1251147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun res!834205 () Bool)

(assert (=> b!1251147 (= res!834205 (contains!7503 lt!564395 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251147 (=> (not res!834205) (not e!710261))))

(declare-fun bm!61646 () Bool)

(assert (=> bm!61646 (= call!61649 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138317 c!122539) b!1251139))

(assert (= (and d!138317 (not c!122539)) b!1251146))

(assert (= (and b!1251146 c!122537) b!1251136))

(assert (= (and b!1251146 (not c!122537)) b!1251145))

(assert (= (or b!1251136 b!1251145) bm!61646))

(assert (= (and d!138317 res!834204) b!1251143))

(assert (= (and b!1251143 res!834203) b!1251144))

(assert (= (and b!1251144 res!834202) b!1251142))

(assert (= (and b!1251144 c!122536) b!1251147))

(assert (= (and b!1251144 (not c!122536)) b!1251138))

(assert (= (and b!1251147 res!834205) b!1251141))

(assert (= (and b!1251138 c!122538) b!1251137))

(assert (= (and b!1251138 (not c!122538)) b!1251140))

(declare-fun b_lambda!22505 () Bool)

(assert (=> (not b_lambda!22505) (not b!1251136)))

(declare-fun t!41155 () Bool)

(declare-fun tb!11279 () Bool)

(assert (=> (and start!105072 (= defaultEntry!922 defaultEntry!922) t!41155) tb!11279))

(declare-fun result!23261 () Bool)

(assert (=> tb!11279 (= result!23261 tp_is_empty!31555)))

(assert (=> b!1251136 t!41155))

(declare-fun b_and!44429 () Bool)

(assert (= b_and!44423 (and (=> t!41155 result!23261) b_and!44429)))

(declare-fun b_lambda!22507 () Bool)

(assert (=> (not b_lambda!22507) (not b!1251141)))

(assert (=> b!1251141 t!41155))

(declare-fun b_and!44431 () Bool)

(assert (= b_and!44429 (and (=> t!41155 result!23261) b_and!44431)))

(declare-fun m!1152311 () Bool)

(assert (=> b!1251140 m!1152311))

(declare-fun m!1152313 () Bool)

(assert (=> d!138317 m!1152313))

(assert (=> d!138317 m!1152245))

(declare-fun m!1152315 () Bool)

(assert (=> b!1251143 m!1152315))

(assert (=> b!1251146 m!1152297))

(assert (=> b!1251146 m!1152297))

(assert (=> b!1251146 m!1152299))

(declare-fun m!1152317 () Bool)

(assert (=> b!1251137 m!1152317))

(declare-fun m!1152319 () Bool)

(assert (=> b!1251136 m!1152319))

(declare-fun m!1152321 () Bool)

(assert (=> b!1251136 m!1152321))

(declare-fun m!1152323 () Bool)

(assert (=> b!1251136 m!1152323))

(declare-fun m!1152325 () Bool)

(assert (=> b!1251136 m!1152325))

(declare-fun m!1152327 () Bool)

(assert (=> b!1251136 m!1152327))

(declare-fun m!1152329 () Bool)

(assert (=> b!1251136 m!1152329))

(assert (=> b!1251136 m!1152321))

(assert (=> b!1251136 m!1152319))

(declare-fun m!1152331 () Bool)

(assert (=> b!1251136 m!1152331))

(assert (=> b!1251136 m!1152327))

(assert (=> b!1251136 m!1152297))

(assert (=> b!1251147 m!1152297))

(assert (=> b!1251147 m!1152297))

(declare-fun m!1152333 () Bool)

(assert (=> b!1251147 m!1152333))

(assert (=> b!1251142 m!1152297))

(assert (=> b!1251142 m!1152297))

(assert (=> b!1251142 m!1152299))

(assert (=> b!1251141 m!1152319))

(assert (=> b!1251141 m!1152321))

(assert (=> b!1251141 m!1152297))

(declare-fun m!1152335 () Bool)

(assert (=> b!1251141 m!1152335))

(assert (=> b!1251141 m!1152321))

(assert (=> b!1251141 m!1152319))

(assert (=> b!1251141 m!1152331))

(assert (=> b!1251141 m!1152297))

(assert (=> bm!61646 m!1152317))

(assert (=> b!1251057 d!138317))

(declare-fun b!1251150 () Bool)

(declare-fun lt!564400 () Unit!41484)

(declare-fun lt!564403 () Unit!41484)

(assert (=> b!1251150 (= lt!564400 lt!564403)))

(declare-fun lt!564399 () (_ BitVec 64))

(declare-fun lt!564404 () (_ BitVec 64))

(declare-fun lt!564401 () V!47439)

(declare-fun lt!564405 () ListLongMap!18313)

(assert (=> b!1251150 (not (contains!7503 (+!4193 lt!564405 (tuple2!20433 lt!564404 lt!564401)) lt!564399))))

(assert (=> b!1251150 (= lt!564403 (addStillNotContains!310 lt!564405 lt!564404 lt!564401 lt!564399))))

(assert (=> b!1251150 (= lt!564399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1251150 (= lt!564401 (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251150 (= lt!564404 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61650 () ListLongMap!18313)

(assert (=> b!1251150 (= lt!564405 call!61650)))

(declare-fun e!710265 () ListLongMap!18313)

(assert (=> b!1251150 (= e!710265 (+!4193 call!61650 (tuple2!20433 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!564402 () ListLongMap!18313)

(declare-fun e!710270 () Bool)

(declare-fun b!1251151 () Bool)

(assert (=> b!1251151 (= e!710270 (= lt!564402 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251152 () Bool)

(declare-fun e!710271 () Bool)

(assert (=> b!1251152 (= e!710271 e!710270)))

(declare-fun c!122542 () Bool)

(assert (=> b!1251152 (= c!122542 (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun b!1251153 () Bool)

(declare-fun e!710267 () ListLongMap!18313)

(assert (=> b!1251153 (= e!710267 (ListLongMap!18314 Nil!27685))))

(declare-fun b!1251154 () Bool)

(assert (=> b!1251154 (= e!710270 (isEmpty!1026 lt!564402))))

(declare-fun b!1251155 () Bool)

(assert (=> b!1251155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> b!1251155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39513 _values!914)))))

(declare-fun e!710268 () Bool)

(assert (=> b!1251155 (= e!710268 (= (apply!989 lt!564402 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)) (get!20034 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3441 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251156 () Bool)

(declare-fun e!710266 () Bool)

(assert (=> b!1251156 (= e!710266 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251156 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138319 () Bool)

(declare-fun e!710269 () Bool)

(assert (=> d!138319 e!710269))

(declare-fun res!834208 () Bool)

(assert (=> d!138319 (=> (not res!834208) (not e!710269))))

(assert (=> d!138319 (= res!834208 (not (contains!7503 lt!564402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138319 (= lt!564402 e!710267)))

(declare-fun c!122543 () Bool)

(assert (=> d!138319 (= c!122543 (bvsge #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> d!138319 (validMask!0 mask!1466)))

(assert (=> d!138319 (= (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564402)))

(declare-fun b!1251157 () Bool)

(declare-fun res!834207 () Bool)

(assert (=> b!1251157 (=> (not res!834207) (not e!710269))))

(assert (=> b!1251157 (= res!834207 (not (contains!7503 lt!564402 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251158 () Bool)

(assert (=> b!1251158 (= e!710269 e!710271)))

(declare-fun c!122540 () Bool)

(assert (=> b!1251158 (= c!122540 e!710266)))

(declare-fun res!834206 () Bool)

(assert (=> b!1251158 (=> (not res!834206) (not e!710266))))

(assert (=> b!1251158 (= res!834206 (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun b!1251159 () Bool)

(assert (=> b!1251159 (= e!710265 call!61650)))

(declare-fun b!1251160 () Bool)

(assert (=> b!1251160 (= e!710267 e!710265)))

(declare-fun c!122541 () Bool)

(assert (=> b!1251160 (= c!122541 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251161 () Bool)

(assert (=> b!1251161 (= e!710271 e!710268)))

(assert (=> b!1251161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(declare-fun res!834209 () Bool)

(assert (=> b!1251161 (= res!834209 (contains!7503 lt!564402 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251161 (=> (not res!834209) (not e!710268))))

(declare-fun bm!61647 () Bool)

(assert (=> bm!61647 (= call!61650 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!138319 c!122543) b!1251153))

(assert (= (and d!138319 (not c!122543)) b!1251160))

(assert (= (and b!1251160 c!122541) b!1251150))

(assert (= (and b!1251160 (not c!122541)) b!1251159))

(assert (= (or b!1251150 b!1251159) bm!61647))

(assert (= (and d!138319 res!834208) b!1251157))

(assert (= (and b!1251157 res!834207) b!1251158))

(assert (= (and b!1251158 res!834206) b!1251156))

(assert (= (and b!1251158 c!122540) b!1251161))

(assert (= (and b!1251158 (not c!122540)) b!1251152))

(assert (= (and b!1251161 res!834209) b!1251155))

(assert (= (and b!1251152 c!122542) b!1251151))

(assert (= (and b!1251152 (not c!122542)) b!1251154))

(declare-fun b_lambda!22509 () Bool)

(assert (=> (not b_lambda!22509) (not b!1251150)))

(assert (=> b!1251150 t!41155))

(declare-fun b_and!44433 () Bool)

(assert (= b_and!44431 (and (=> t!41155 result!23261) b_and!44433)))

(declare-fun b_lambda!22511 () Bool)

(assert (=> (not b_lambda!22511) (not b!1251155)))

(assert (=> b!1251155 t!41155))

(declare-fun b_and!44435 () Bool)

(assert (= b_and!44433 (and (=> t!41155 result!23261) b_and!44435)))

(declare-fun m!1152337 () Bool)

(assert (=> b!1251154 m!1152337))

(declare-fun m!1152339 () Bool)

(assert (=> d!138319 m!1152339))

(assert (=> d!138319 m!1152245))

(declare-fun m!1152341 () Bool)

(assert (=> b!1251157 m!1152341))

(assert (=> b!1251160 m!1152297))

(assert (=> b!1251160 m!1152297))

(assert (=> b!1251160 m!1152299))

(declare-fun m!1152343 () Bool)

(assert (=> b!1251151 m!1152343))

(assert (=> b!1251150 m!1152319))

(assert (=> b!1251150 m!1152321))

(declare-fun m!1152345 () Bool)

(assert (=> b!1251150 m!1152345))

(declare-fun m!1152347 () Bool)

(assert (=> b!1251150 m!1152347))

(declare-fun m!1152349 () Bool)

(assert (=> b!1251150 m!1152349))

(declare-fun m!1152351 () Bool)

(assert (=> b!1251150 m!1152351))

(assert (=> b!1251150 m!1152321))

(assert (=> b!1251150 m!1152319))

(assert (=> b!1251150 m!1152331))

(assert (=> b!1251150 m!1152349))

(assert (=> b!1251150 m!1152297))

(assert (=> b!1251161 m!1152297))

(assert (=> b!1251161 m!1152297))

(declare-fun m!1152353 () Bool)

(assert (=> b!1251161 m!1152353))

(assert (=> b!1251156 m!1152297))

(assert (=> b!1251156 m!1152297))

(assert (=> b!1251156 m!1152299))

(assert (=> b!1251155 m!1152319))

(assert (=> b!1251155 m!1152321))

(assert (=> b!1251155 m!1152297))

(declare-fun m!1152355 () Bool)

(assert (=> b!1251155 m!1152355))

(assert (=> b!1251155 m!1152321))

(assert (=> b!1251155 m!1152319))

(assert (=> b!1251155 m!1152331))

(assert (=> b!1251155 m!1152297))

(assert (=> bm!61647 m!1152343))

(assert (=> b!1251057 d!138319))

(declare-fun bm!61650 () Bool)

(declare-fun call!61653 () Bool)

(declare-fun c!122546 () Bool)

(assert (=> bm!61650 (= call!61653 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122546 (Cons!27683 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) Nil!27684) Nil!27684)))))

(declare-fun b!1251172 () Bool)

(declare-fun e!710283 () Bool)

(declare-fun e!710281 () Bool)

(assert (=> b!1251172 (= e!710283 e!710281)))

(declare-fun res!834218 () Bool)

(assert (=> b!1251172 (=> (not res!834218) (not e!710281))))

(declare-fun e!710280 () Bool)

(assert (=> b!1251172 (= res!834218 (not e!710280))))

(declare-fun res!834216 () Bool)

(assert (=> b!1251172 (=> (not res!834216) (not e!710280))))

(assert (=> b!1251172 (= res!834216 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251173 () Bool)

(declare-fun e!710282 () Bool)

(assert (=> b!1251173 (= e!710281 e!710282)))

(assert (=> b!1251173 (= c!122546 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138321 () Bool)

(declare-fun res!834217 () Bool)

(assert (=> d!138321 (=> res!834217 e!710283)))

(assert (=> d!138321 (= res!834217 (bvsge #b00000000000000000000000000000000 (size!39514 _keys!1118)))))

(assert (=> d!138321 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27684) e!710283)))

(declare-fun b!1251174 () Bool)

(assert (=> b!1251174 (= e!710282 call!61653)))

(declare-fun b!1251175 () Bool)

(declare-fun contains!7504 (List!27687 (_ BitVec 64)) Bool)

(assert (=> b!1251175 (= e!710280 (contains!7504 Nil!27684 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251176 () Bool)

(assert (=> b!1251176 (= e!710282 call!61653)))

(assert (= (and d!138321 (not res!834217)) b!1251172))

(assert (= (and b!1251172 res!834216) b!1251175))

(assert (= (and b!1251172 res!834218) b!1251173))

(assert (= (and b!1251173 c!122546) b!1251174))

(assert (= (and b!1251173 (not c!122546)) b!1251176))

(assert (= (or b!1251174 b!1251176) bm!61650))

(assert (=> bm!61650 m!1152297))

(declare-fun m!1152357 () Bool)

(assert (=> bm!61650 m!1152357))

(assert (=> b!1251172 m!1152297))

(assert (=> b!1251172 m!1152297))

(assert (=> b!1251172 m!1152299))

(assert (=> b!1251173 m!1152297))

(assert (=> b!1251173 m!1152297))

(assert (=> b!1251173 m!1152299))

(assert (=> b!1251175 m!1152297))

(assert (=> b!1251175 m!1152297))

(declare-fun m!1152359 () Bool)

(assert (=> b!1251175 m!1152359))

(assert (=> b!1251053 d!138321))

(declare-fun d!138323 () Bool)

(assert (=> d!138323 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105072 d!138323))

(declare-fun d!138325 () Bool)

(assert (=> d!138325 (= (array_inv!29851 _keys!1118) (bvsge (size!39514 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105072 d!138325))

(declare-fun d!138327 () Bool)

(assert (=> d!138327 (= (array_inv!29852 _values!914) (bvsge (size!39513 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105072 d!138327))

(declare-fun b!1251183 () Bool)

(declare-fun e!710288 () Bool)

(assert (=> b!1251183 (= e!710288 tp_is_empty!31555)))

(declare-fun condMapEmpty!49102 () Bool)

(declare-fun mapDefault!49102 () ValueCell!15014)

(assert (=> mapNonEmpty!49093 (= condMapEmpty!49102 (= mapRest!49093 ((as const (Array (_ BitVec 32) ValueCell!15014)) mapDefault!49102)))))

(declare-fun e!710289 () Bool)

(declare-fun mapRes!49102 () Bool)

(assert (=> mapNonEmpty!49093 (= tp!93448 (and e!710289 mapRes!49102))))

(declare-fun mapNonEmpty!49102 () Bool)

(declare-fun tp!93464 () Bool)

(assert (=> mapNonEmpty!49102 (= mapRes!49102 (and tp!93464 e!710288))))

(declare-fun mapValue!49102 () ValueCell!15014)

(declare-fun mapKey!49102 () (_ BitVec 32))

(declare-fun mapRest!49102 () (Array (_ BitVec 32) ValueCell!15014))

(assert (=> mapNonEmpty!49102 (= mapRest!49093 (store mapRest!49102 mapKey!49102 mapValue!49102))))

(declare-fun b!1251184 () Bool)

(assert (=> b!1251184 (= e!710289 tp_is_empty!31555)))

(declare-fun mapIsEmpty!49102 () Bool)

(assert (=> mapIsEmpty!49102 mapRes!49102))

(assert (= (and mapNonEmpty!49093 condMapEmpty!49102) mapIsEmpty!49102))

(assert (= (and mapNonEmpty!49093 (not condMapEmpty!49102)) mapNonEmpty!49102))

(assert (= (and mapNonEmpty!49102 ((_ is ValueCellFull!15014) mapValue!49102)) b!1251183))

(assert (= (and mapNonEmpty!49093 ((_ is ValueCellFull!15014) mapDefault!49102)) b!1251184))

(declare-fun m!1152361 () Bool)

(assert (=> mapNonEmpty!49102 m!1152361))

(declare-fun b_lambda!22513 () Bool)

(assert (= b_lambda!22511 (or (and start!105072 b_free!26653) b_lambda!22513)))

(declare-fun b_lambda!22515 () Bool)

(assert (= b_lambda!22509 (or (and start!105072 b_free!26653) b_lambda!22515)))

(declare-fun b_lambda!22517 () Bool)

(assert (= b_lambda!22505 (or (and start!105072 b_free!26653) b_lambda!22517)))

(declare-fun b_lambda!22519 () Bool)

(assert (= b_lambda!22507 (or (and start!105072 b_free!26653) b_lambda!22519)))

(check-sat (not b!1251160) (not d!138319) (not b!1251110) (not b_lambda!22513) (not b!1251175) (not b!1251136) (not b!1251172) (not b!1251157) (not b_next!26653) (not b!1251173) (not b_lambda!22519) b_and!44435 (not b!1251161) tp_is_empty!31555 (not bm!61650) (not b!1251137) (not b!1251146) (not b!1251140) (not b!1251150) (not bm!61643) (not b!1251109) (not b!1251155) (not d!138315) (not b!1251141) (not b!1251156) (not b!1251142) (not bm!61647) (not b!1251143) (not bm!61646) (not b_lambda!22517) (not b!1251147) (not b!1251154) (not d!138317) (not b!1251151) (not b_lambda!22515) (not mapNonEmpty!49102))
(check-sat b_and!44435 (not b_next!26653))
