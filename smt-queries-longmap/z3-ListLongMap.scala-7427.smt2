; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94392 () Bool)

(assert start!94392)

(declare-fun b_free!21739 () Bool)

(declare-fun b_next!21739 () Bool)

(assert (=> start!94392 (= b_free!21739 (not b_next!21739))))

(declare-fun tp!76661 () Bool)

(declare-fun b_and!34497 () Bool)

(assert (=> start!94392 (= tp!76661 b_and!34497)))

(declare-fun res!712258 () Bool)

(declare-fun e!608717 () Bool)

(assert (=> start!94392 (=> (not res!712258) (not e!608717))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94392 (= res!712258 (validMask!0 mask!1515))))

(assert (=> start!94392 e!608717))

(assert (=> start!94392 true))

(declare-fun tp_is_empty!25549 () Bool)

(assert (=> start!94392 tp_is_empty!25549))

(declare-datatypes ((V!39201 0))(
  ( (V!39202 (val!12825 Int)) )
))
(declare-datatypes ((ValueCell!12071 0))(
  ( (ValueCellFull!12071 (v!15438 V!39201)) (EmptyCell!12071) )
))
(declare-datatypes ((array!68026 0))(
  ( (array!68027 (arr!32714 (Array (_ BitVec 32) ValueCell!12071)) (size!33252 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68026)

(declare-fun e!608719 () Bool)

(declare-fun array_inv!25322 (array!68026) Bool)

(assert (=> start!94392 (and (array_inv!25322 _values!955) e!608719)))

(assert (=> start!94392 tp!76661))

(declare-datatypes ((array!68028 0))(
  ( (array!68029 (arr!32715 (Array (_ BitVec 32) (_ BitVec 64))) (size!33253 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68028)

(declare-fun array_inv!25323 (array!68028) Bool)

(assert (=> start!94392 (array_inv!25323 _keys!1163)))

(declare-fun b!1067262 () Bool)

(declare-fun res!712257 () Bool)

(assert (=> b!1067262 (=> (not res!712257) (not e!608717))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067262 (= res!712257 (and (= (size!33252 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33253 _keys!1163) (size!33252 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40015 () Bool)

(declare-fun mapRes!40015 () Bool)

(assert (=> mapIsEmpty!40015 mapRes!40015))

(declare-fun b!1067263 () Bool)

(declare-fun e!608720 () Bool)

(assert (=> b!1067263 (= e!608719 (and e!608720 mapRes!40015))))

(declare-fun condMapEmpty!40015 () Bool)

(declare-fun mapDefault!40015 () ValueCell!12071)

(assert (=> b!1067263 (= condMapEmpty!40015 (= (arr!32714 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12071)) mapDefault!40015)))))

(declare-fun b!1067264 () Bool)

(assert (=> b!1067264 (= e!608720 tp_is_empty!25549)))

(declare-fun b!1067265 () Bool)

(declare-fun res!712256 () Bool)

(assert (=> b!1067265 (=> (not res!712256) (not e!608717))))

(declare-datatypes ((List!22875 0))(
  ( (Nil!22872) (Cons!22871 (h!24080 (_ BitVec 64)) (t!32189 List!22875)) )
))
(declare-fun arrayNoDuplicates!0 (array!68028 (_ BitVec 32) List!22875) Bool)

(assert (=> b!1067265 (= res!712256 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22872))))

(declare-fun b!1067266 () Bool)

(declare-fun res!712259 () Bool)

(assert (=> b!1067266 (=> (not res!712259) (not e!608717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68028 (_ BitVec 32)) Bool)

(assert (=> b!1067266 (= res!712259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067267 () Bool)

(assert (=> b!1067267 (= e!608717 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!33253 _keys!1163)))))))

(declare-datatypes ((tuple2!16332 0))(
  ( (tuple2!16333 (_1!8177 (_ BitVec 64)) (_2!8177 V!39201)) )
))
(declare-datatypes ((List!22876 0))(
  ( (Nil!22873) (Cons!22872 (h!24081 tuple2!16332) (t!32190 List!22876)) )
))
(declare-datatypes ((ListLongMap!14301 0))(
  ( (ListLongMap!14302 (toList!7166 List!22876)) )
))
(declare-fun lt!471237 () ListLongMap!14301)

(declare-fun lt!471236 () ListLongMap!14301)

(assert (=> b!1067267 (= lt!471237 lt!471236)))

(declare-fun zeroValueBefore!47 () V!39201)

(declare-datatypes ((Unit!34922 0))(
  ( (Unit!34923) )
))
(declare-fun lt!471238 () Unit!34922)

(declare-fun minValue!907 () V!39201)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39201)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!756 (array!68028 array!68026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 V!39201 V!39201 (_ BitVec 32) Int) Unit!34922)

(assert (=> b!1067267 (= lt!471238 (lemmaNoChangeToArrayThenSameMapNoExtras!756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3762 (array!68028 array!68026 (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 (_ BitVec 32) Int) ListLongMap!14301)

(assert (=> b!1067267 (= lt!471236 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067267 (= lt!471237 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067268 () Bool)

(declare-fun e!608718 () Bool)

(assert (=> b!1067268 (= e!608718 tp_is_empty!25549)))

(declare-fun mapNonEmpty!40015 () Bool)

(declare-fun tp!76660 () Bool)

(assert (=> mapNonEmpty!40015 (= mapRes!40015 (and tp!76660 e!608718))))

(declare-fun mapRest!40015 () (Array (_ BitVec 32) ValueCell!12071))

(declare-fun mapValue!40015 () ValueCell!12071)

(declare-fun mapKey!40015 () (_ BitVec 32))

(assert (=> mapNonEmpty!40015 (= (arr!32714 _values!955) (store mapRest!40015 mapKey!40015 mapValue!40015))))

(assert (= (and start!94392 res!712258) b!1067262))

(assert (= (and b!1067262 res!712257) b!1067266))

(assert (= (and b!1067266 res!712259) b!1067265))

(assert (= (and b!1067265 res!712256) b!1067267))

(assert (= (and b!1067263 condMapEmpty!40015) mapIsEmpty!40015))

(assert (= (and b!1067263 (not condMapEmpty!40015)) mapNonEmpty!40015))

(get-info :version)

(assert (= (and mapNonEmpty!40015 ((_ is ValueCellFull!12071) mapValue!40015)) b!1067268))

(assert (= (and b!1067263 ((_ is ValueCellFull!12071) mapDefault!40015)) b!1067264))

(assert (= start!94392 b!1067263))

(declare-fun m!985453 () Bool)

(assert (=> mapNonEmpty!40015 m!985453))

(declare-fun m!985455 () Bool)

(assert (=> b!1067266 m!985455))

(declare-fun m!985457 () Bool)

(assert (=> b!1067265 m!985457))

(declare-fun m!985459 () Bool)

(assert (=> start!94392 m!985459))

(declare-fun m!985461 () Bool)

(assert (=> start!94392 m!985461))

(declare-fun m!985463 () Bool)

(assert (=> start!94392 m!985463))

(declare-fun m!985465 () Bool)

(assert (=> b!1067267 m!985465))

(declare-fun m!985467 () Bool)

(assert (=> b!1067267 m!985467))

(declare-fun m!985469 () Bool)

(assert (=> b!1067267 m!985469))

(check-sat b_and!34497 (not b_next!21739) (not b!1067265) (not mapNonEmpty!40015) (not b!1067267) (not start!94392) tp_is_empty!25549 (not b!1067266))
(check-sat b_and!34497 (not b_next!21739))
(get-model)

(declare-fun d!128955 () Bool)

(assert (=> d!128955 (= (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471259 () Unit!34922)

(declare-fun choose!1741 (array!68028 array!68026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 V!39201 V!39201 (_ BitVec 32) Int) Unit!34922)

(assert (=> d!128955 (= lt!471259 (choose!1741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128955 (validMask!0 mask!1515)))

(assert (=> d!128955 (= (lemmaNoChangeToArrayThenSameMapNoExtras!756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471259)))

(declare-fun bs!31393 () Bool)

(assert (= bs!31393 d!128955))

(assert (=> bs!31393 m!985469))

(assert (=> bs!31393 m!985467))

(declare-fun m!985507 () Bool)

(assert (=> bs!31393 m!985507))

(assert (=> bs!31393 m!985459))

(assert (=> b!1067267 d!128955))

(declare-fun d!128957 () Bool)

(declare-fun e!608768 () Bool)

(assert (=> d!128957 e!608768))

(declare-fun res!712294 () Bool)

(assert (=> d!128957 (=> (not res!712294) (not e!608768))))

(declare-fun lt!471274 () ListLongMap!14301)

(declare-fun contains!6245 (ListLongMap!14301 (_ BitVec 64)) Bool)

(assert (=> d!128957 (= res!712294 (not (contains!6245 lt!471274 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608766 () ListLongMap!14301)

(assert (=> d!128957 (= lt!471274 e!608766)))

(declare-fun c!107451 () Bool)

(assert (=> d!128957 (= c!107451 (bvsge #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> d!128957 (validMask!0 mask!1515)))

(assert (=> d!128957 (= (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471274)))

(declare-fun b!1067335 () Bool)

(declare-fun res!712292 () Bool)

(assert (=> b!1067335 (=> (not res!712292) (not e!608768))))

(assert (=> b!1067335 (= res!712292 (not (contains!6245 lt!471274 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608767 () Bool)

(declare-fun b!1067336 () Bool)

(assert (=> b!1067336 (= e!608767 (= lt!471274 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067337 () Bool)

(declare-fun e!608770 () ListLongMap!14301)

(assert (=> b!1067337 (= e!608766 e!608770)))

(declare-fun c!107452 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1067337 (= c!107452 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067338 () Bool)

(declare-fun e!608769 () Bool)

(assert (=> b!1067338 (= e!608769 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067338 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1067339 () Bool)

(assert (=> b!1067339 (= e!608766 (ListLongMap!14302 Nil!22873))))

(declare-fun bm!45065 () Bool)

(declare-fun call!45068 () ListLongMap!14301)

(assert (=> bm!45065 (= call!45068 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067340 () Bool)

(declare-fun e!608771 () Bool)

(assert (=> b!1067340 (= e!608771 e!608767)))

(declare-fun c!107450 () Bool)

(assert (=> b!1067340 (= c!107450 (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun b!1067341 () Bool)

(assert (=> b!1067341 (= e!608768 e!608771)))

(declare-fun c!107449 () Bool)

(assert (=> b!1067341 (= c!107449 e!608769)))

(declare-fun res!712295 () Bool)

(assert (=> b!1067341 (=> (not res!712295) (not e!608769))))

(assert (=> b!1067341 (= res!712295 (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun b!1067342 () Bool)

(assert (=> b!1067342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> b!1067342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33252 _values!955)))))

(declare-fun e!608772 () Bool)

(declare-fun apply!918 (ListLongMap!14301 (_ BitVec 64)) V!39201)

(declare-fun get!17062 (ValueCell!12071 V!39201) V!39201)

(declare-fun dynLambda!2017 (Int (_ BitVec 64)) V!39201)

(assert (=> b!1067342 (= e!608772 (= (apply!918 lt!471274 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)) (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067343 () Bool)

(assert (=> b!1067343 (= e!608770 call!45068)))

(declare-fun b!1067344 () Bool)

(declare-fun lt!471278 () Unit!34922)

(declare-fun lt!471275 () Unit!34922)

(assert (=> b!1067344 (= lt!471278 lt!471275)))

(declare-fun lt!471277 () (_ BitVec 64))

(declare-fun lt!471279 () ListLongMap!14301)

(declare-fun lt!471280 () (_ BitVec 64))

(declare-fun lt!471276 () V!39201)

(declare-fun +!3184 (ListLongMap!14301 tuple2!16332) ListLongMap!14301)

(assert (=> b!1067344 (not (contains!6245 (+!3184 lt!471279 (tuple2!16333 lt!471280 lt!471276)) lt!471277))))

(declare-fun addStillNotContains!254 (ListLongMap!14301 (_ BitVec 64) V!39201 (_ BitVec 64)) Unit!34922)

(assert (=> b!1067344 (= lt!471275 (addStillNotContains!254 lt!471279 lt!471280 lt!471276 lt!471277))))

(assert (=> b!1067344 (= lt!471277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067344 (= lt!471276 (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067344 (= lt!471280 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067344 (= lt!471279 call!45068)))

(assert (=> b!1067344 (= e!608770 (+!3184 call!45068 (tuple2!16333 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000) (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067345 () Bool)

(assert (=> b!1067345 (= e!608771 e!608772)))

(assert (=> b!1067345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun res!712293 () Bool)

(assert (=> b!1067345 (= res!712293 (contains!6245 lt!471274 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067345 (=> (not res!712293) (not e!608772))))

(declare-fun b!1067346 () Bool)

(declare-fun isEmpty!948 (ListLongMap!14301) Bool)

(assert (=> b!1067346 (= e!608767 (isEmpty!948 lt!471274))))

(assert (= (and d!128957 c!107451) b!1067339))

(assert (= (and d!128957 (not c!107451)) b!1067337))

(assert (= (and b!1067337 c!107452) b!1067344))

(assert (= (and b!1067337 (not c!107452)) b!1067343))

(assert (= (or b!1067344 b!1067343) bm!45065))

(assert (= (and d!128957 res!712294) b!1067335))

(assert (= (and b!1067335 res!712292) b!1067341))

(assert (= (and b!1067341 res!712295) b!1067338))

(assert (= (and b!1067341 c!107449) b!1067345))

(assert (= (and b!1067341 (not c!107449)) b!1067340))

(assert (= (and b!1067345 res!712293) b!1067342))

(assert (= (and b!1067340 c!107450) b!1067336))

(assert (= (and b!1067340 (not c!107450)) b!1067346))

(declare-fun b_lambda!16563 () Bool)

(assert (=> (not b_lambda!16563) (not b!1067342)))

(declare-fun t!32195 () Bool)

(declare-fun tb!7137 () Bool)

(assert (=> (and start!94392 (= defaultEntry!963 defaultEntry!963) t!32195) tb!7137))

(declare-fun result!14735 () Bool)

(assert (=> tb!7137 (= result!14735 tp_is_empty!25549)))

(assert (=> b!1067342 t!32195))

(declare-fun b_and!34503 () Bool)

(assert (= b_and!34497 (and (=> t!32195 result!14735) b_and!34503)))

(declare-fun b_lambda!16565 () Bool)

(assert (=> (not b_lambda!16565) (not b!1067344)))

(assert (=> b!1067344 t!32195))

(declare-fun b_and!34505 () Bool)

(assert (= b_and!34503 (and (=> t!32195 result!14735) b_and!34505)))

(declare-fun m!985509 () Bool)

(assert (=> b!1067338 m!985509))

(assert (=> b!1067338 m!985509))

(declare-fun m!985511 () Bool)

(assert (=> b!1067338 m!985511))

(declare-fun m!985513 () Bool)

(assert (=> d!128957 m!985513))

(assert (=> d!128957 m!985459))

(assert (=> b!1067337 m!985509))

(assert (=> b!1067337 m!985509))

(assert (=> b!1067337 m!985511))

(declare-fun m!985515 () Bool)

(assert (=> bm!45065 m!985515))

(declare-fun m!985517 () Bool)

(assert (=> b!1067346 m!985517))

(assert (=> b!1067345 m!985509))

(assert (=> b!1067345 m!985509))

(declare-fun m!985519 () Bool)

(assert (=> b!1067345 m!985519))

(assert (=> b!1067336 m!985515))

(declare-fun m!985521 () Bool)

(assert (=> b!1067344 m!985521))

(assert (=> b!1067344 m!985509))

(declare-fun m!985523 () Bool)

(assert (=> b!1067344 m!985523))

(declare-fun m!985525 () Bool)

(assert (=> b!1067344 m!985525))

(declare-fun m!985527 () Bool)

(assert (=> b!1067344 m!985527))

(declare-fun m!985529 () Bool)

(assert (=> b!1067344 m!985529))

(assert (=> b!1067344 m!985527))

(assert (=> b!1067344 m!985525))

(assert (=> b!1067344 m!985523))

(declare-fun m!985531 () Bool)

(assert (=> b!1067344 m!985531))

(declare-fun m!985533 () Bool)

(assert (=> b!1067344 m!985533))

(assert (=> b!1067342 m!985509))

(declare-fun m!985535 () Bool)

(assert (=> b!1067342 m!985535))

(assert (=> b!1067342 m!985509))

(assert (=> b!1067342 m!985525))

(assert (=> b!1067342 m!985523))

(assert (=> b!1067342 m!985531))

(assert (=> b!1067342 m!985523))

(assert (=> b!1067342 m!985525))

(declare-fun m!985537 () Bool)

(assert (=> b!1067335 m!985537))

(assert (=> b!1067267 d!128957))

(declare-fun d!128959 () Bool)

(declare-fun e!608775 () Bool)

(assert (=> d!128959 e!608775))

(declare-fun res!712298 () Bool)

(assert (=> d!128959 (=> (not res!712298) (not e!608775))))

(declare-fun lt!471281 () ListLongMap!14301)

(assert (=> d!128959 (= res!712298 (not (contains!6245 lt!471281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608773 () ListLongMap!14301)

(assert (=> d!128959 (= lt!471281 e!608773)))

(declare-fun c!107455 () Bool)

(assert (=> d!128959 (= c!107455 (bvsge #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> d!128959 (validMask!0 mask!1515)))

(assert (=> d!128959 (= (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471281)))

(declare-fun b!1067349 () Bool)

(declare-fun res!712296 () Bool)

(assert (=> b!1067349 (=> (not res!712296) (not e!608775))))

(assert (=> b!1067349 (= res!712296 (not (contains!6245 lt!471281 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608774 () Bool)

(declare-fun b!1067350 () Bool)

(assert (=> b!1067350 (= e!608774 (= lt!471281 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1067351 () Bool)

(declare-fun e!608777 () ListLongMap!14301)

(assert (=> b!1067351 (= e!608773 e!608777)))

(declare-fun c!107456 () Bool)

(assert (=> b!1067351 (= c!107456 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067352 () Bool)

(declare-fun e!608776 () Bool)

(assert (=> b!1067352 (= e!608776 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067352 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1067353 () Bool)

(assert (=> b!1067353 (= e!608773 (ListLongMap!14302 Nil!22873))))

(declare-fun bm!45066 () Bool)

(declare-fun call!45069 () ListLongMap!14301)

(assert (=> bm!45066 (= call!45069 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1067354 () Bool)

(declare-fun e!608778 () Bool)

(assert (=> b!1067354 (= e!608778 e!608774)))

(declare-fun c!107454 () Bool)

(assert (=> b!1067354 (= c!107454 (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun b!1067355 () Bool)

(assert (=> b!1067355 (= e!608775 e!608778)))

(declare-fun c!107453 () Bool)

(assert (=> b!1067355 (= c!107453 e!608776)))

(declare-fun res!712299 () Bool)

(assert (=> b!1067355 (=> (not res!712299) (not e!608776))))

(assert (=> b!1067355 (= res!712299 (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun b!1067356 () Bool)

(assert (=> b!1067356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> b!1067356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33252 _values!955)))))

(declare-fun e!608779 () Bool)

(assert (=> b!1067356 (= e!608779 (= (apply!918 lt!471281 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)) (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1067357 () Bool)

(assert (=> b!1067357 (= e!608777 call!45069)))

(declare-fun b!1067358 () Bool)

(declare-fun lt!471285 () Unit!34922)

(declare-fun lt!471282 () Unit!34922)

(assert (=> b!1067358 (= lt!471285 lt!471282)))

(declare-fun lt!471287 () (_ BitVec 64))

(declare-fun lt!471283 () V!39201)

(declare-fun lt!471286 () ListLongMap!14301)

(declare-fun lt!471284 () (_ BitVec 64))

(assert (=> b!1067358 (not (contains!6245 (+!3184 lt!471286 (tuple2!16333 lt!471287 lt!471283)) lt!471284))))

(assert (=> b!1067358 (= lt!471282 (addStillNotContains!254 lt!471286 lt!471287 lt!471283 lt!471284))))

(assert (=> b!1067358 (= lt!471284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1067358 (= lt!471283 (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1067358 (= lt!471287 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1067358 (= lt!471286 call!45069)))

(assert (=> b!1067358 (= e!608777 (+!3184 call!45069 (tuple2!16333 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000) (get!17062 (select (arr!32714 _values!955) #b00000000000000000000000000000000) (dynLambda!2017 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1067359 () Bool)

(assert (=> b!1067359 (= e!608778 e!608779)))

(assert (=> b!1067359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(declare-fun res!712297 () Bool)

(assert (=> b!1067359 (= res!712297 (contains!6245 lt!471281 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1067359 (=> (not res!712297) (not e!608779))))

(declare-fun b!1067360 () Bool)

(assert (=> b!1067360 (= e!608774 (isEmpty!948 lt!471281))))

(assert (= (and d!128959 c!107455) b!1067353))

(assert (= (and d!128959 (not c!107455)) b!1067351))

(assert (= (and b!1067351 c!107456) b!1067358))

(assert (= (and b!1067351 (not c!107456)) b!1067357))

(assert (= (or b!1067358 b!1067357) bm!45066))

(assert (= (and d!128959 res!712298) b!1067349))

(assert (= (and b!1067349 res!712296) b!1067355))

(assert (= (and b!1067355 res!712299) b!1067352))

(assert (= (and b!1067355 c!107453) b!1067359))

(assert (= (and b!1067355 (not c!107453)) b!1067354))

(assert (= (and b!1067359 res!712297) b!1067356))

(assert (= (and b!1067354 c!107454) b!1067350))

(assert (= (and b!1067354 (not c!107454)) b!1067360))

(declare-fun b_lambda!16567 () Bool)

(assert (=> (not b_lambda!16567) (not b!1067356)))

(assert (=> b!1067356 t!32195))

(declare-fun b_and!34507 () Bool)

(assert (= b_and!34505 (and (=> t!32195 result!14735) b_and!34507)))

(declare-fun b_lambda!16569 () Bool)

(assert (=> (not b_lambda!16569) (not b!1067358)))

(assert (=> b!1067358 t!32195))

(declare-fun b_and!34509 () Bool)

(assert (= b_and!34507 (and (=> t!32195 result!14735) b_and!34509)))

(assert (=> b!1067352 m!985509))

(assert (=> b!1067352 m!985509))

(assert (=> b!1067352 m!985511))

(declare-fun m!985539 () Bool)

(assert (=> d!128959 m!985539))

(assert (=> d!128959 m!985459))

(assert (=> b!1067351 m!985509))

(assert (=> b!1067351 m!985509))

(assert (=> b!1067351 m!985511))

(declare-fun m!985541 () Bool)

(assert (=> bm!45066 m!985541))

(declare-fun m!985543 () Bool)

(assert (=> b!1067360 m!985543))

(assert (=> b!1067359 m!985509))

(assert (=> b!1067359 m!985509))

(declare-fun m!985545 () Bool)

(assert (=> b!1067359 m!985545))

(assert (=> b!1067350 m!985541))

(declare-fun m!985547 () Bool)

(assert (=> b!1067358 m!985547))

(assert (=> b!1067358 m!985509))

(assert (=> b!1067358 m!985523))

(assert (=> b!1067358 m!985525))

(declare-fun m!985549 () Bool)

(assert (=> b!1067358 m!985549))

(declare-fun m!985551 () Bool)

(assert (=> b!1067358 m!985551))

(assert (=> b!1067358 m!985549))

(assert (=> b!1067358 m!985525))

(assert (=> b!1067358 m!985523))

(assert (=> b!1067358 m!985531))

(declare-fun m!985553 () Bool)

(assert (=> b!1067358 m!985553))

(assert (=> b!1067356 m!985509))

(declare-fun m!985555 () Bool)

(assert (=> b!1067356 m!985555))

(assert (=> b!1067356 m!985509))

(assert (=> b!1067356 m!985525))

(assert (=> b!1067356 m!985523))

(assert (=> b!1067356 m!985531))

(assert (=> b!1067356 m!985523))

(assert (=> b!1067356 m!985525))

(declare-fun m!985557 () Bool)

(assert (=> b!1067349 m!985557))

(assert (=> b!1067267 d!128959))

(declare-fun b!1067369 () Bool)

(declare-fun e!608787 () Bool)

(declare-fun call!45072 () Bool)

(assert (=> b!1067369 (= e!608787 call!45072)))

(declare-fun b!1067370 () Bool)

(declare-fun e!608786 () Bool)

(assert (=> b!1067370 (= e!608786 call!45072)))

(declare-fun b!1067371 () Bool)

(assert (=> b!1067371 (= e!608787 e!608786)))

(declare-fun lt!471295 () (_ BitVec 64))

(assert (=> b!1067371 (= lt!471295 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!471294 () Unit!34922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68028 (_ BitVec 64) (_ BitVec 32)) Unit!34922)

(assert (=> b!1067371 (= lt!471294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!471295 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1067371 (arrayContainsKey!0 _keys!1163 lt!471295 #b00000000000000000000000000000000)))

(declare-fun lt!471296 () Unit!34922)

(assert (=> b!1067371 (= lt!471296 lt!471294)))

(declare-fun res!712304 () Bool)

(declare-datatypes ((SeekEntryResult!9877 0))(
  ( (MissingZero!9877 (index!41879 (_ BitVec 32))) (Found!9877 (index!41880 (_ BitVec 32))) (Intermediate!9877 (undefined!10689 Bool) (index!41881 (_ BitVec 32)) (x!95586 (_ BitVec 32))) (Undefined!9877) (MissingVacant!9877 (index!41882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68028 (_ BitVec 32)) SeekEntryResult!9877)

(assert (=> b!1067371 (= res!712304 (= (seekEntryOrOpen!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9877 #b00000000000000000000000000000000)))))

(assert (=> b!1067371 (=> (not res!712304) (not e!608786))))

(declare-fun bm!45069 () Bool)

(assert (=> bm!45069 (= call!45072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1067372 () Bool)

(declare-fun e!608788 () Bool)

(assert (=> b!1067372 (= e!608788 e!608787)))

(declare-fun c!107459 () Bool)

(assert (=> b!1067372 (= c!107459 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128961 () Bool)

(declare-fun res!712305 () Bool)

(assert (=> d!128961 (=> res!712305 e!608788)))

(assert (=> d!128961 (= res!712305 (bvsge #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> d!128961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!608788)))

(assert (= (and d!128961 (not res!712305)) b!1067372))

(assert (= (and b!1067372 c!107459) b!1067371))

(assert (= (and b!1067372 (not c!107459)) b!1067369))

(assert (= (and b!1067371 res!712304) b!1067370))

(assert (= (or b!1067370 b!1067369) bm!45069))

(assert (=> b!1067371 m!985509))

(declare-fun m!985559 () Bool)

(assert (=> b!1067371 m!985559))

(declare-fun m!985561 () Bool)

(assert (=> b!1067371 m!985561))

(assert (=> b!1067371 m!985509))

(declare-fun m!985563 () Bool)

(assert (=> b!1067371 m!985563))

(declare-fun m!985565 () Bool)

(assert (=> bm!45069 m!985565))

(assert (=> b!1067372 m!985509))

(assert (=> b!1067372 m!985509))

(assert (=> b!1067372 m!985511))

(assert (=> b!1067266 d!128961))

(declare-fun d!128963 () Bool)

(declare-fun res!712312 () Bool)

(declare-fun e!608799 () Bool)

(assert (=> d!128963 (=> res!712312 e!608799)))

(assert (=> d!128963 (= res!712312 (bvsge #b00000000000000000000000000000000 (size!33253 _keys!1163)))))

(assert (=> d!128963 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22872) e!608799)))

(declare-fun b!1067383 () Bool)

(declare-fun e!608797 () Bool)

(declare-fun call!45075 () Bool)

(assert (=> b!1067383 (= e!608797 call!45075)))

(declare-fun b!1067384 () Bool)

(declare-fun e!608800 () Bool)

(declare-fun contains!6246 (List!22875 (_ BitVec 64)) Bool)

(assert (=> b!1067384 (= e!608800 (contains!6246 Nil!22872 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067385 () Bool)

(declare-fun e!608798 () Bool)

(assert (=> b!1067385 (= e!608798 e!608797)))

(declare-fun c!107462 () Bool)

(assert (=> b!1067385 (= c!107462 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1067386 () Bool)

(assert (=> b!1067386 (= e!608797 call!45075)))

(declare-fun b!1067387 () Bool)

(assert (=> b!1067387 (= e!608799 e!608798)))

(declare-fun res!712314 () Bool)

(assert (=> b!1067387 (=> (not res!712314) (not e!608798))))

(assert (=> b!1067387 (= res!712314 (not e!608800))))

(declare-fun res!712313 () Bool)

(assert (=> b!1067387 (=> (not res!712313) (not e!608800))))

(assert (=> b!1067387 (= res!712313 (validKeyInArray!0 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45072 () Bool)

(assert (=> bm!45072 (= call!45075 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107462 (Cons!22871 (select (arr!32715 _keys!1163) #b00000000000000000000000000000000) Nil!22872) Nil!22872)))))

(assert (= (and d!128963 (not res!712312)) b!1067387))

(assert (= (and b!1067387 res!712313) b!1067384))

(assert (= (and b!1067387 res!712314) b!1067385))

(assert (= (and b!1067385 c!107462) b!1067383))

(assert (= (and b!1067385 (not c!107462)) b!1067386))

(assert (= (or b!1067383 b!1067386) bm!45072))

(assert (=> b!1067384 m!985509))

(assert (=> b!1067384 m!985509))

(declare-fun m!985567 () Bool)

(assert (=> b!1067384 m!985567))

(assert (=> b!1067385 m!985509))

(assert (=> b!1067385 m!985509))

(assert (=> b!1067385 m!985511))

(assert (=> b!1067387 m!985509))

(assert (=> b!1067387 m!985509))

(assert (=> b!1067387 m!985511))

(assert (=> bm!45072 m!985509))

(declare-fun m!985569 () Bool)

(assert (=> bm!45072 m!985569))

(assert (=> b!1067265 d!128963))

(declare-fun d!128965 () Bool)

(assert (=> d!128965 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94392 d!128965))

(declare-fun d!128967 () Bool)

(assert (=> d!128967 (= (array_inv!25322 _values!955) (bvsge (size!33252 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94392 d!128967))

(declare-fun d!128969 () Bool)

(assert (=> d!128969 (= (array_inv!25323 _keys!1163) (bvsge (size!33253 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94392 d!128969))

(declare-fun condMapEmpty!40024 () Bool)

(declare-fun mapDefault!40024 () ValueCell!12071)

(assert (=> mapNonEmpty!40015 (= condMapEmpty!40024 (= mapRest!40015 ((as const (Array (_ BitVec 32) ValueCell!12071)) mapDefault!40024)))))

(declare-fun e!608805 () Bool)

(declare-fun mapRes!40024 () Bool)

(assert (=> mapNonEmpty!40015 (= tp!76660 (and e!608805 mapRes!40024))))

(declare-fun b!1067394 () Bool)

(declare-fun e!608806 () Bool)

(assert (=> b!1067394 (= e!608806 tp_is_empty!25549)))

(declare-fun b!1067395 () Bool)

(assert (=> b!1067395 (= e!608805 tp_is_empty!25549)))

(declare-fun mapIsEmpty!40024 () Bool)

(assert (=> mapIsEmpty!40024 mapRes!40024))

(declare-fun mapNonEmpty!40024 () Bool)

(declare-fun tp!76676 () Bool)

(assert (=> mapNonEmpty!40024 (= mapRes!40024 (and tp!76676 e!608806))))

(declare-fun mapRest!40024 () (Array (_ BitVec 32) ValueCell!12071))

(declare-fun mapKey!40024 () (_ BitVec 32))

(declare-fun mapValue!40024 () ValueCell!12071)

(assert (=> mapNonEmpty!40024 (= mapRest!40015 (store mapRest!40024 mapKey!40024 mapValue!40024))))

(assert (= (and mapNonEmpty!40015 condMapEmpty!40024) mapIsEmpty!40024))

(assert (= (and mapNonEmpty!40015 (not condMapEmpty!40024)) mapNonEmpty!40024))

(assert (= (and mapNonEmpty!40024 ((_ is ValueCellFull!12071) mapValue!40024)) b!1067394))

(assert (= (and mapNonEmpty!40015 ((_ is ValueCellFull!12071) mapDefault!40024)) b!1067395))

(declare-fun m!985571 () Bool)

(assert (=> mapNonEmpty!40024 m!985571))

(declare-fun b_lambda!16571 () Bool)

(assert (= b_lambda!16565 (or (and start!94392 b_free!21739) b_lambda!16571)))

(declare-fun b_lambda!16573 () Bool)

(assert (= b_lambda!16567 (or (and start!94392 b_free!21739) b_lambda!16573)))

(declare-fun b_lambda!16575 () Bool)

(assert (= b_lambda!16563 (or (and start!94392 b_free!21739) b_lambda!16575)))

(declare-fun b_lambda!16577 () Bool)

(assert (= b_lambda!16569 (or (and start!94392 b_free!21739) b_lambda!16577)))

(check-sat (not bm!45065) (not b_lambda!16573) (not bm!45072) (not b!1067349) (not b!1067335) (not b!1067359) (not b_next!21739) (not b!1067371) (not b!1067345) (not d!128957) (not bm!45069) (not b!1067372) (not d!128955) (not b!1067337) (not b!1067336) (not b!1067338) (not b_lambda!16577) (not b!1067387) (not b!1067344) (not b!1067352) (not d!128959) tp_is_empty!25549 (not b!1067356) b_and!34509 (not b_lambda!16575) (not b!1067384) (not bm!45066) (not b_lambda!16571) (not b!1067360) (not mapNonEmpty!40024) (not b!1067358) (not b!1067351) (not b!1067385) (not b!1067350) (not b!1067342) (not b!1067346))
(check-sat b_and!34509 (not b_next!21739))
