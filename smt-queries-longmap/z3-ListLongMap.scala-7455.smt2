; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94860 () Bool)

(assert start!94860)

(declare-fun b_free!21907 () Bool)

(declare-fun b_next!21907 () Bool)

(assert (=> start!94860 (= b_free!21907 (not b_next!21907))))

(declare-fun tp!77174 () Bool)

(declare-fun b_and!34729 () Bool)

(assert (=> start!94860 (= tp!77174 b_and!34729)))

(declare-fun mapIsEmpty!40276 () Bool)

(declare-fun mapRes!40276 () Bool)

(assert (=> mapIsEmpty!40276 mapRes!40276))

(declare-fun res!714342 () Bool)

(declare-fun e!611513 () Bool)

(assert (=> start!94860 (=> (not res!714342) (not e!611513))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94860 (= res!714342 (validMask!0 mask!1515))))

(assert (=> start!94860 e!611513))

(assert (=> start!94860 true))

(declare-fun tp_is_empty!25717 () Bool)

(assert (=> start!94860 tp_is_empty!25717))

(declare-datatypes ((V!39425 0))(
  ( (V!39426 (val!12909 Int)) )
))
(declare-datatypes ((ValueCell!12155 0))(
  ( (ValueCellFull!12155 (v!15521 V!39425)) (EmptyCell!12155) )
))
(declare-datatypes ((array!68447 0))(
  ( (array!68448 (arr!32915 (Array (_ BitVec 32) ValueCell!12155)) (size!33452 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68447)

(declare-fun e!611517 () Bool)

(declare-fun array_inv!25492 (array!68447) Bool)

(assert (=> start!94860 (and (array_inv!25492 _values!955) e!611517)))

(assert (=> start!94860 tp!77174))

(declare-datatypes ((array!68449 0))(
  ( (array!68450 (arr!32916 (Array (_ BitVec 32) (_ BitVec 64))) (size!33453 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68449)

(declare-fun array_inv!25493 (array!68449) Bool)

(assert (=> start!94860 (array_inv!25493 _keys!1163)))

(declare-fun b!1071238 () Bool)

(declare-fun e!611515 () Bool)

(assert (=> b!1071238 (= e!611515 tp_is_empty!25717)))

(declare-fun b!1071239 () Bool)

(declare-fun res!714341 () Bool)

(assert (=> b!1071239 (=> (not res!714341) (not e!611513))))

(declare-datatypes ((List!22947 0))(
  ( (Nil!22944) (Cons!22943 (h!24161 (_ BitVec 64)) (t!32268 List!22947)) )
))
(declare-fun arrayNoDuplicates!0 (array!68449 (_ BitVec 32) List!22947) Bool)

(assert (=> b!1071239 (= res!714341 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22944))))

(declare-fun b!1071240 () Bool)

(declare-fun res!714344 () Bool)

(assert (=> b!1071240 (=> (not res!714344) (not e!611513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68449 (_ BitVec 32)) Bool)

(assert (=> b!1071240 (= res!714344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40276 () Bool)

(declare-fun tp!77173 () Bool)

(declare-fun e!611514 () Bool)

(assert (=> mapNonEmpty!40276 (= mapRes!40276 (and tp!77173 e!611514))))

(declare-fun mapKey!40276 () (_ BitVec 32))

(declare-fun mapRest!40276 () (Array (_ BitVec 32) ValueCell!12155))

(declare-fun mapValue!40276 () ValueCell!12155)

(assert (=> mapNonEmpty!40276 (= (arr!32915 _values!955) (store mapRest!40276 mapKey!40276 mapValue!40276))))

(declare-fun b!1071241 () Bool)

(assert (=> b!1071241 (= e!611514 tp_is_empty!25717)))

(declare-fun b!1071242 () Bool)

(assert (=> b!1071242 (= e!611517 (and e!611515 mapRes!40276))))

(declare-fun condMapEmpty!40276 () Bool)

(declare-fun mapDefault!40276 () ValueCell!12155)

(assert (=> b!1071242 (= condMapEmpty!40276 (= (arr!32915 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12155)) mapDefault!40276)))))

(declare-fun b!1071243 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071243 (= e!611513 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33453 _keys!1163)))))))

(declare-datatypes ((tuple2!16378 0))(
  ( (tuple2!16379 (_1!8200 (_ BitVec 64)) (_2!8200 V!39425)) )
))
(declare-datatypes ((List!22948 0))(
  ( (Nil!22945) (Cons!22944 (h!24162 tuple2!16378) (t!32269 List!22948)) )
))
(declare-datatypes ((ListLongMap!14355 0))(
  ( (ListLongMap!14356 (toList!7193 List!22948)) )
))
(declare-fun lt!473328 () ListLongMap!14355)

(declare-fun lt!473329 () ListLongMap!14355)

(assert (=> b!1071243 (= lt!473328 lt!473329)))

(declare-fun zeroValueBefore!47 () V!39425)

(declare-fun minValue!907 () V!39425)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35180 0))(
  ( (Unit!35181) )
))
(declare-fun lt!473330 () Unit!35180)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39425)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!808 (array!68449 array!68447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 V!39425 V!39425 (_ BitVec 32) Int) Unit!35180)

(assert (=> b!1071243 (= lt!473330 (lemmaNoChangeToArrayThenSameMapNoExtras!808 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3805 (array!68449 array!68447 (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 (_ BitVec 32) Int) ListLongMap!14355)

(assert (=> b!1071243 (= lt!473329 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071243 (= lt!473328 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071244 () Bool)

(declare-fun res!714343 () Bool)

(assert (=> b!1071244 (=> (not res!714343) (not e!611513))))

(assert (=> b!1071244 (= res!714343 (and (= (size!33452 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33453 _keys!1163) (size!33452 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94860 res!714342) b!1071244))

(assert (= (and b!1071244 res!714343) b!1071240))

(assert (= (and b!1071240 res!714344) b!1071239))

(assert (= (and b!1071239 res!714341) b!1071243))

(assert (= (and b!1071242 condMapEmpty!40276) mapIsEmpty!40276))

(assert (= (and b!1071242 (not condMapEmpty!40276)) mapNonEmpty!40276))

(get-info :version)

(assert (= (and mapNonEmpty!40276 ((_ is ValueCellFull!12155) mapValue!40276)) b!1071241))

(assert (= (and b!1071242 ((_ is ValueCellFull!12155) mapDefault!40276)) b!1071238))

(assert (= start!94860 b!1071242))

(declare-fun m!990025 () Bool)

(assert (=> start!94860 m!990025))

(declare-fun m!990027 () Bool)

(assert (=> start!94860 m!990027))

(declare-fun m!990029 () Bool)

(assert (=> start!94860 m!990029))

(declare-fun m!990031 () Bool)

(assert (=> mapNonEmpty!40276 m!990031))

(declare-fun m!990033 () Bool)

(assert (=> b!1071239 m!990033))

(declare-fun m!990035 () Bool)

(assert (=> b!1071240 m!990035))

(declare-fun m!990037 () Bool)

(assert (=> b!1071243 m!990037))

(declare-fun m!990039 () Bool)

(assert (=> b!1071243 m!990039))

(declare-fun m!990041 () Bool)

(assert (=> b!1071243 m!990041))

(check-sat (not start!94860) b_and!34729 (not mapNonEmpty!40276) (not b_next!21907) (not b!1071243) (not b!1071239) (not b!1071240) tp_is_empty!25717)
(check-sat b_and!34729 (not b_next!21907))
(get-model)

(declare-fun d!129695 () Bool)

(assert (=> d!129695 (= (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473351 () Unit!35180)

(declare-fun choose!1743 (array!68449 array!68447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 V!39425 V!39425 (_ BitVec 32) Int) Unit!35180)

(assert (=> d!129695 (= lt!473351 (choose!1743 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129695 (validMask!0 mask!1515)))

(assert (=> d!129695 (= (lemmaNoChangeToArrayThenSameMapNoExtras!808 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473351)))

(declare-fun bs!31533 () Bool)

(assert (= bs!31533 d!129695))

(assert (=> bs!31533 m!990041))

(assert (=> bs!31533 m!990039))

(declare-fun m!990079 () Bool)

(assert (=> bs!31533 m!990079))

(assert (=> bs!31533 m!990025))

(assert (=> b!1071243 d!129695))

(declare-fun b!1071311 () Bool)

(assert (=> b!1071311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> b!1071311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33452 _values!955)))))

(declare-fun lt!473370 () ListLongMap!14355)

(declare-fun e!611563 () Bool)

(declare-fun apply!937 (ListLongMap!14355 (_ BitVec 64)) V!39425)

(declare-fun get!17155 (ValueCell!12155 V!39425) V!39425)

(declare-fun dynLambda!2052 (Int (_ BitVec 64)) V!39425)

(assert (=> b!1071311 (= e!611563 (= (apply!937 lt!473370 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)) (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45227 () Bool)

(declare-fun call!45230 () ListLongMap!14355)

(assert (=> bm!45227 (= call!45230 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071312 () Bool)

(declare-fun e!611567 () ListLongMap!14355)

(assert (=> b!1071312 (= e!611567 call!45230)))

(declare-fun b!1071313 () Bool)

(declare-fun e!611566 () Bool)

(assert (=> b!1071313 (= e!611566 (= lt!473370 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1071314 () Bool)

(declare-fun isEmpty!950 (ListLongMap!14355) Bool)

(assert (=> b!1071314 (= e!611566 (isEmpty!950 lt!473370))))

(declare-fun d!129697 () Bool)

(declare-fun e!611568 () Bool)

(assert (=> d!129697 e!611568))

(declare-fun res!714378 () Bool)

(assert (=> d!129697 (=> (not res!714378) (not e!611568))))

(declare-fun contains!6339 (ListLongMap!14355 (_ BitVec 64)) Bool)

(assert (=> d!129697 (= res!714378 (not (contains!6339 lt!473370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611564 () ListLongMap!14355)

(assert (=> d!129697 (= lt!473370 e!611564)))

(declare-fun c!108007 () Bool)

(assert (=> d!129697 (= c!108007 (bvsge #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> d!129697 (validMask!0 mask!1515)))

(assert (=> d!129697 (= (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473370)))

(declare-fun b!1071315 () Bool)

(declare-fun lt!473369 () Unit!35180)

(declare-fun lt!473366 () Unit!35180)

(assert (=> b!1071315 (= lt!473369 lt!473366)))

(declare-fun lt!473372 () (_ BitVec 64))

(declare-fun lt!473368 () ListLongMap!14355)

(declare-fun lt!473371 () (_ BitVec 64))

(declare-fun lt!473367 () V!39425)

(declare-fun +!3181 (ListLongMap!14355 tuple2!16378) ListLongMap!14355)

(assert (=> b!1071315 (not (contains!6339 (+!3181 lt!473368 (tuple2!16379 lt!473372 lt!473367)) lt!473371))))

(declare-fun addStillNotContains!258 (ListLongMap!14355 (_ BitVec 64) V!39425 (_ BitVec 64)) Unit!35180)

(assert (=> b!1071315 (= lt!473366 (addStillNotContains!258 lt!473368 lt!473372 lt!473367 lt!473371))))

(assert (=> b!1071315 (= lt!473371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071315 (= lt!473367 (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071315 (= lt!473372 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071315 (= lt!473368 call!45230)))

(assert (=> b!1071315 (= e!611567 (+!3181 call!45230 (tuple2!16379 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000) (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071316 () Bool)

(declare-fun res!714380 () Bool)

(assert (=> b!1071316 (=> (not res!714380) (not e!611568))))

(assert (=> b!1071316 (= res!714380 (not (contains!6339 lt!473370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1071317 () Bool)

(assert (=> b!1071317 (= e!611564 (ListLongMap!14356 Nil!22945))))

(declare-fun b!1071318 () Bool)

(declare-fun e!611565 () Bool)

(assert (=> b!1071318 (= e!611565 e!611563)))

(assert (=> b!1071318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(declare-fun res!714379 () Bool)

(assert (=> b!1071318 (= res!714379 (contains!6339 lt!473370 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071318 (=> (not res!714379) (not e!611563))))

(declare-fun b!1071319 () Bool)

(assert (=> b!1071319 (= e!611565 e!611566)))

(declare-fun c!108008 () Bool)

(assert (=> b!1071319 (= c!108008 (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(declare-fun b!1071320 () Bool)

(declare-fun e!611562 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1071320 (= e!611562 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071320 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1071321 () Bool)

(assert (=> b!1071321 (= e!611564 e!611567)))

(declare-fun c!108009 () Bool)

(assert (=> b!1071321 (= c!108009 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071322 () Bool)

(assert (=> b!1071322 (= e!611568 e!611565)))

(declare-fun c!108006 () Bool)

(assert (=> b!1071322 (= c!108006 e!611562)))

(declare-fun res!714377 () Bool)

(assert (=> b!1071322 (=> (not res!714377) (not e!611562))))

(assert (=> b!1071322 (= res!714377 (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (= (and d!129697 c!108007) b!1071317))

(assert (= (and d!129697 (not c!108007)) b!1071321))

(assert (= (and b!1071321 c!108009) b!1071315))

(assert (= (and b!1071321 (not c!108009)) b!1071312))

(assert (= (or b!1071315 b!1071312) bm!45227))

(assert (= (and d!129697 res!714378) b!1071316))

(assert (= (and b!1071316 res!714380) b!1071322))

(assert (= (and b!1071322 res!714377) b!1071320))

(assert (= (and b!1071322 c!108006) b!1071318))

(assert (= (and b!1071322 (not c!108006)) b!1071319))

(assert (= (and b!1071318 res!714379) b!1071311))

(assert (= (and b!1071319 c!108008) b!1071313))

(assert (= (and b!1071319 (not c!108008)) b!1071314))

(declare-fun b_lambda!16651 () Bool)

(assert (=> (not b_lambda!16651) (not b!1071311)))

(declare-fun t!32275 () Bool)

(declare-fun tb!7143 () Bool)

(assert (=> (and start!94860 (= defaultEntry!963 defaultEntry!963) t!32275) tb!7143))

(declare-fun result!14753 () Bool)

(assert (=> tb!7143 (= result!14753 tp_is_empty!25717)))

(assert (=> b!1071311 t!32275))

(declare-fun b_and!34735 () Bool)

(assert (= b_and!34729 (and (=> t!32275 result!14753) b_and!34735)))

(declare-fun b_lambda!16653 () Bool)

(assert (=> (not b_lambda!16653) (not b!1071315)))

(assert (=> b!1071315 t!32275))

(declare-fun b_and!34737 () Bool)

(assert (= b_and!34735 (and (=> t!32275 result!14753) b_and!34737)))

(declare-fun m!990081 () Bool)

(assert (=> b!1071321 m!990081))

(assert (=> b!1071321 m!990081))

(declare-fun m!990083 () Bool)

(assert (=> b!1071321 m!990083))

(assert (=> b!1071311 m!990081))

(declare-fun m!990085 () Bool)

(assert (=> b!1071311 m!990085))

(declare-fun m!990087 () Bool)

(assert (=> b!1071311 m!990087))

(declare-fun m!990089 () Bool)

(assert (=> b!1071311 m!990089))

(declare-fun m!990091 () Bool)

(assert (=> b!1071311 m!990091))

(assert (=> b!1071311 m!990081))

(assert (=> b!1071311 m!990089))

(assert (=> b!1071311 m!990087))

(declare-fun m!990093 () Bool)

(assert (=> b!1071314 m!990093))

(assert (=> b!1071320 m!990081))

(assert (=> b!1071320 m!990081))

(assert (=> b!1071320 m!990083))

(declare-fun m!990095 () Bool)

(assert (=> bm!45227 m!990095))

(assert (=> b!1071313 m!990095))

(declare-fun m!990097 () Bool)

(assert (=> d!129697 m!990097))

(assert (=> d!129697 m!990025))

(declare-fun m!990099 () Bool)

(assert (=> b!1071316 m!990099))

(declare-fun m!990101 () Bool)

(assert (=> b!1071315 m!990101))

(declare-fun m!990103 () Bool)

(assert (=> b!1071315 m!990103))

(declare-fun m!990105 () Bool)

(assert (=> b!1071315 m!990105))

(assert (=> b!1071315 m!990087))

(assert (=> b!1071315 m!990089))

(assert (=> b!1071315 m!990091))

(assert (=> b!1071315 m!990081))

(declare-fun m!990107 () Bool)

(assert (=> b!1071315 m!990107))

(assert (=> b!1071315 m!990089))

(assert (=> b!1071315 m!990087))

(assert (=> b!1071315 m!990103))

(assert (=> b!1071318 m!990081))

(assert (=> b!1071318 m!990081))

(declare-fun m!990109 () Bool)

(assert (=> b!1071318 m!990109))

(assert (=> b!1071243 d!129697))

(declare-fun b!1071325 () Bool)

(assert (=> b!1071325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> b!1071325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33452 _values!955)))))

(declare-fun e!611570 () Bool)

(declare-fun lt!473377 () ListLongMap!14355)

(assert (=> b!1071325 (= e!611570 (= (apply!937 lt!473377 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)) (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!45228 () Bool)

(declare-fun call!45231 () ListLongMap!14355)

(assert (=> bm!45228 (= call!45231 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1071326 () Bool)

(declare-fun e!611574 () ListLongMap!14355)

(assert (=> b!1071326 (= e!611574 call!45231)))

(declare-fun b!1071327 () Bool)

(declare-fun e!611573 () Bool)

(assert (=> b!1071327 (= e!611573 (= lt!473377 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1071328 () Bool)

(assert (=> b!1071328 (= e!611573 (isEmpty!950 lt!473377))))

(declare-fun d!129699 () Bool)

(declare-fun e!611575 () Bool)

(assert (=> d!129699 e!611575))

(declare-fun res!714382 () Bool)

(assert (=> d!129699 (=> (not res!714382) (not e!611575))))

(assert (=> d!129699 (= res!714382 (not (contains!6339 lt!473377 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611571 () ListLongMap!14355)

(assert (=> d!129699 (= lt!473377 e!611571)))

(declare-fun c!108011 () Bool)

(assert (=> d!129699 (= c!108011 (bvsge #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> d!129699 (validMask!0 mask!1515)))

(assert (=> d!129699 (= (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473377)))

(declare-fun b!1071329 () Bool)

(declare-fun lt!473376 () Unit!35180)

(declare-fun lt!473373 () Unit!35180)

(assert (=> b!1071329 (= lt!473376 lt!473373)))

(declare-fun lt!473379 () (_ BitVec 64))

(declare-fun lt!473378 () (_ BitVec 64))

(declare-fun lt!473375 () ListLongMap!14355)

(declare-fun lt!473374 () V!39425)

(assert (=> b!1071329 (not (contains!6339 (+!3181 lt!473375 (tuple2!16379 lt!473379 lt!473374)) lt!473378))))

(assert (=> b!1071329 (= lt!473373 (addStillNotContains!258 lt!473375 lt!473379 lt!473374 lt!473378))))

(assert (=> b!1071329 (= lt!473378 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1071329 (= lt!473374 (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1071329 (= lt!473379 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1071329 (= lt!473375 call!45231)))

(assert (=> b!1071329 (= e!611574 (+!3181 call!45231 (tuple2!16379 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000) (get!17155 (select (arr!32915 _values!955) #b00000000000000000000000000000000) (dynLambda!2052 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1071330 () Bool)

(declare-fun res!714384 () Bool)

(assert (=> b!1071330 (=> (not res!714384) (not e!611575))))

(assert (=> b!1071330 (= res!714384 (not (contains!6339 lt!473377 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1071331 () Bool)

(assert (=> b!1071331 (= e!611571 (ListLongMap!14356 Nil!22945))))

(declare-fun b!1071332 () Bool)

(declare-fun e!611572 () Bool)

(assert (=> b!1071332 (= e!611572 e!611570)))

(assert (=> b!1071332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(declare-fun res!714383 () Bool)

(assert (=> b!1071332 (= res!714383 (contains!6339 lt!473377 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071332 (=> (not res!714383) (not e!611570))))

(declare-fun b!1071333 () Bool)

(assert (=> b!1071333 (= e!611572 e!611573)))

(declare-fun c!108012 () Bool)

(assert (=> b!1071333 (= c!108012 (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(declare-fun b!1071334 () Bool)

(declare-fun e!611569 () Bool)

(assert (=> b!1071334 (= e!611569 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1071334 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1071335 () Bool)

(assert (=> b!1071335 (= e!611571 e!611574)))

(declare-fun c!108013 () Bool)

(assert (=> b!1071335 (= c!108013 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071336 () Bool)

(assert (=> b!1071336 (= e!611575 e!611572)))

(declare-fun c!108010 () Bool)

(assert (=> b!1071336 (= c!108010 e!611569)))

(declare-fun res!714381 () Bool)

(assert (=> b!1071336 (=> (not res!714381) (not e!611569))))

(assert (=> b!1071336 (= res!714381 (bvslt #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (= (and d!129699 c!108011) b!1071331))

(assert (= (and d!129699 (not c!108011)) b!1071335))

(assert (= (and b!1071335 c!108013) b!1071329))

(assert (= (and b!1071335 (not c!108013)) b!1071326))

(assert (= (or b!1071329 b!1071326) bm!45228))

(assert (= (and d!129699 res!714382) b!1071330))

(assert (= (and b!1071330 res!714384) b!1071336))

(assert (= (and b!1071336 res!714381) b!1071334))

(assert (= (and b!1071336 c!108010) b!1071332))

(assert (= (and b!1071336 (not c!108010)) b!1071333))

(assert (= (and b!1071332 res!714383) b!1071325))

(assert (= (and b!1071333 c!108012) b!1071327))

(assert (= (and b!1071333 (not c!108012)) b!1071328))

(declare-fun b_lambda!16655 () Bool)

(assert (=> (not b_lambda!16655) (not b!1071325)))

(assert (=> b!1071325 t!32275))

(declare-fun b_and!34739 () Bool)

(assert (= b_and!34737 (and (=> t!32275 result!14753) b_and!34739)))

(declare-fun b_lambda!16657 () Bool)

(assert (=> (not b_lambda!16657) (not b!1071329)))

(assert (=> b!1071329 t!32275))

(declare-fun b_and!34741 () Bool)

(assert (= b_and!34739 (and (=> t!32275 result!14753) b_and!34741)))

(assert (=> b!1071335 m!990081))

(assert (=> b!1071335 m!990081))

(assert (=> b!1071335 m!990083))

(assert (=> b!1071325 m!990081))

(declare-fun m!990111 () Bool)

(assert (=> b!1071325 m!990111))

(assert (=> b!1071325 m!990087))

(assert (=> b!1071325 m!990089))

(assert (=> b!1071325 m!990091))

(assert (=> b!1071325 m!990081))

(assert (=> b!1071325 m!990089))

(assert (=> b!1071325 m!990087))

(declare-fun m!990113 () Bool)

(assert (=> b!1071328 m!990113))

(assert (=> b!1071334 m!990081))

(assert (=> b!1071334 m!990081))

(assert (=> b!1071334 m!990083))

(declare-fun m!990115 () Bool)

(assert (=> bm!45228 m!990115))

(assert (=> b!1071327 m!990115))

(declare-fun m!990117 () Bool)

(assert (=> d!129699 m!990117))

(assert (=> d!129699 m!990025))

(declare-fun m!990119 () Bool)

(assert (=> b!1071330 m!990119))

(declare-fun m!990121 () Bool)

(assert (=> b!1071329 m!990121))

(declare-fun m!990123 () Bool)

(assert (=> b!1071329 m!990123))

(declare-fun m!990125 () Bool)

(assert (=> b!1071329 m!990125))

(assert (=> b!1071329 m!990087))

(assert (=> b!1071329 m!990089))

(assert (=> b!1071329 m!990091))

(assert (=> b!1071329 m!990081))

(declare-fun m!990127 () Bool)

(assert (=> b!1071329 m!990127))

(assert (=> b!1071329 m!990089))

(assert (=> b!1071329 m!990087))

(assert (=> b!1071329 m!990123))

(assert (=> b!1071332 m!990081))

(assert (=> b!1071332 m!990081))

(declare-fun m!990129 () Bool)

(assert (=> b!1071332 m!990129))

(assert (=> b!1071243 d!129699))

(declare-fun b!1071347 () Bool)

(declare-fun e!611586 () Bool)

(declare-fun contains!6340 (List!22947 (_ BitVec 64)) Bool)

(assert (=> b!1071347 (= e!611586 (contains!6340 Nil!22944 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071349 () Bool)

(declare-fun e!611587 () Bool)

(declare-fun call!45234 () Bool)

(assert (=> b!1071349 (= e!611587 call!45234)))

(declare-fun bm!45231 () Bool)

(declare-fun c!108016 () Bool)

(assert (=> bm!45231 (= call!45234 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108016 (Cons!22943 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000) Nil!22944) Nil!22944)))))

(declare-fun d!129701 () Bool)

(declare-fun res!714391 () Bool)

(declare-fun e!611585 () Bool)

(assert (=> d!129701 (=> res!714391 e!611585)))

(assert (=> d!129701 (= res!714391 (bvsge #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> d!129701 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22944) e!611585)))

(declare-fun b!1071348 () Bool)

(declare-fun e!611584 () Bool)

(assert (=> b!1071348 (= e!611584 e!611587)))

(assert (=> b!1071348 (= c!108016 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1071350 () Bool)

(assert (=> b!1071350 (= e!611587 call!45234)))

(declare-fun b!1071351 () Bool)

(assert (=> b!1071351 (= e!611585 e!611584)))

(declare-fun res!714392 () Bool)

(assert (=> b!1071351 (=> (not res!714392) (not e!611584))))

(assert (=> b!1071351 (= res!714392 (not e!611586))))

(declare-fun res!714393 () Bool)

(assert (=> b!1071351 (=> (not res!714393) (not e!611586))))

(assert (=> b!1071351 (= res!714393 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129701 (not res!714391)) b!1071351))

(assert (= (and b!1071351 res!714393) b!1071347))

(assert (= (and b!1071351 res!714392) b!1071348))

(assert (= (and b!1071348 c!108016) b!1071349))

(assert (= (and b!1071348 (not c!108016)) b!1071350))

(assert (= (or b!1071349 b!1071350) bm!45231))

(assert (=> b!1071347 m!990081))

(assert (=> b!1071347 m!990081))

(declare-fun m!990131 () Bool)

(assert (=> b!1071347 m!990131))

(assert (=> bm!45231 m!990081))

(declare-fun m!990133 () Bool)

(assert (=> bm!45231 m!990133))

(assert (=> b!1071348 m!990081))

(assert (=> b!1071348 m!990081))

(assert (=> b!1071348 m!990083))

(assert (=> b!1071351 m!990081))

(assert (=> b!1071351 m!990081))

(assert (=> b!1071351 m!990083))

(assert (=> b!1071239 d!129701))

(declare-fun d!129703 () Bool)

(declare-fun res!714399 () Bool)

(declare-fun e!611594 () Bool)

(assert (=> d!129703 (=> res!714399 e!611594)))

(assert (=> d!129703 (= res!714399 (bvsge #b00000000000000000000000000000000 (size!33453 _keys!1163)))))

(assert (=> d!129703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!611594)))

(declare-fun b!1071360 () Bool)

(declare-fun e!611596 () Bool)

(declare-fun e!611595 () Bool)

(assert (=> b!1071360 (= e!611596 e!611595)))

(declare-fun lt!473387 () (_ BitVec 64))

(assert (=> b!1071360 (= lt!473387 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473388 () Unit!35180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68449 (_ BitVec 64) (_ BitVec 32)) Unit!35180)

(assert (=> b!1071360 (= lt!473388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!473387 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1071360 (arrayContainsKey!0 _keys!1163 lt!473387 #b00000000000000000000000000000000)))

(declare-fun lt!473386 () Unit!35180)

(assert (=> b!1071360 (= lt!473386 lt!473388)))

(declare-fun res!714398 () Bool)

(declare-datatypes ((SeekEntryResult!9837 0))(
  ( (MissingZero!9837 (index!41719 (_ BitVec 32))) (Found!9837 (index!41720 (_ BitVec 32))) (Intermediate!9837 (undefined!10649 Bool) (index!41721 (_ BitVec 32)) (x!95828 (_ BitVec 32))) (Undefined!9837) (MissingVacant!9837 (index!41722 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68449 (_ BitVec 32)) SeekEntryResult!9837)

(assert (=> b!1071360 (= res!714398 (= (seekEntryOrOpen!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9837 #b00000000000000000000000000000000)))))

(assert (=> b!1071360 (=> (not res!714398) (not e!611595))))

(declare-fun bm!45234 () Bool)

(declare-fun call!45237 () Bool)

(assert (=> bm!45234 (= call!45237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1071361 () Bool)

(assert (=> b!1071361 (= e!611595 call!45237)))

(declare-fun b!1071362 () Bool)

(assert (=> b!1071362 (= e!611596 call!45237)))

(declare-fun b!1071363 () Bool)

(assert (=> b!1071363 (= e!611594 e!611596)))

(declare-fun c!108019 () Bool)

(assert (=> b!1071363 (= c!108019 (validKeyInArray!0 (select (arr!32916 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129703 (not res!714399)) b!1071363))

(assert (= (and b!1071363 c!108019) b!1071360))

(assert (= (and b!1071363 (not c!108019)) b!1071362))

(assert (= (and b!1071360 res!714398) b!1071361))

(assert (= (or b!1071361 b!1071362) bm!45234))

(assert (=> b!1071360 m!990081))

(declare-fun m!990135 () Bool)

(assert (=> b!1071360 m!990135))

(declare-fun m!990137 () Bool)

(assert (=> b!1071360 m!990137))

(assert (=> b!1071360 m!990081))

(declare-fun m!990139 () Bool)

(assert (=> b!1071360 m!990139))

(declare-fun m!990141 () Bool)

(assert (=> bm!45234 m!990141))

(assert (=> b!1071363 m!990081))

(assert (=> b!1071363 m!990081))

(assert (=> b!1071363 m!990083))

(assert (=> b!1071240 d!129703))

(declare-fun d!129705 () Bool)

(assert (=> d!129705 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94860 d!129705))

(declare-fun d!129707 () Bool)

(assert (=> d!129707 (= (array_inv!25492 _values!955) (bvsge (size!33452 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94860 d!129707))

(declare-fun d!129709 () Bool)

(assert (=> d!129709 (= (array_inv!25493 _keys!1163) (bvsge (size!33453 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94860 d!129709))

(declare-fun b!1071370 () Bool)

(declare-fun e!611602 () Bool)

(assert (=> b!1071370 (= e!611602 tp_is_empty!25717)))

(declare-fun mapNonEmpty!40285 () Bool)

(declare-fun mapRes!40285 () Bool)

(declare-fun tp!77189 () Bool)

(assert (=> mapNonEmpty!40285 (= mapRes!40285 (and tp!77189 e!611602))))

(declare-fun mapKey!40285 () (_ BitVec 32))

(declare-fun mapRest!40285 () (Array (_ BitVec 32) ValueCell!12155))

(declare-fun mapValue!40285 () ValueCell!12155)

(assert (=> mapNonEmpty!40285 (= mapRest!40276 (store mapRest!40285 mapKey!40285 mapValue!40285))))

(declare-fun b!1071371 () Bool)

(declare-fun e!611601 () Bool)

(assert (=> b!1071371 (= e!611601 tp_is_empty!25717)))

(declare-fun condMapEmpty!40285 () Bool)

(declare-fun mapDefault!40285 () ValueCell!12155)

(assert (=> mapNonEmpty!40276 (= condMapEmpty!40285 (= mapRest!40276 ((as const (Array (_ BitVec 32) ValueCell!12155)) mapDefault!40285)))))

(assert (=> mapNonEmpty!40276 (= tp!77173 (and e!611601 mapRes!40285))))

(declare-fun mapIsEmpty!40285 () Bool)

(assert (=> mapIsEmpty!40285 mapRes!40285))

(assert (= (and mapNonEmpty!40276 condMapEmpty!40285) mapIsEmpty!40285))

(assert (= (and mapNonEmpty!40276 (not condMapEmpty!40285)) mapNonEmpty!40285))

(assert (= (and mapNonEmpty!40285 ((_ is ValueCellFull!12155) mapValue!40285)) b!1071370))

(assert (= (and mapNonEmpty!40276 ((_ is ValueCellFull!12155) mapDefault!40285)) b!1071371))

(declare-fun m!990143 () Bool)

(assert (=> mapNonEmpty!40285 m!990143))

(declare-fun b_lambda!16659 () Bool)

(assert (= b_lambda!16655 (or (and start!94860 b_free!21907) b_lambda!16659)))

(declare-fun b_lambda!16661 () Bool)

(assert (= b_lambda!16653 (or (and start!94860 b_free!21907) b_lambda!16661)))

(declare-fun b_lambda!16663 () Bool)

(assert (= b_lambda!16651 (or (and start!94860 b_free!21907) b_lambda!16663)))

(declare-fun b_lambda!16665 () Bool)

(assert (= b_lambda!16657 (or (and start!94860 b_free!21907) b_lambda!16665)))

(check-sat (not b!1071347) (not b!1071321) (not b!1071351) (not b!1071334) (not b!1071325) (not b!1071313) (not b!1071316) (not b!1071329) tp_is_empty!25717 (not d!129697) (not bm!45231) (not b!1071327) (not b!1071318) (not bm!45234) (not d!129695) b_and!34741 (not b!1071360) (not b!1071320) (not b!1071328) (not d!129699) (not b_lambda!16661) (not b_next!21907) (not bm!45227) (not mapNonEmpty!40285) (not b!1071348) (not b!1071314) (not bm!45228) (not b!1071363) (not b!1071330) (not b!1071332) (not b_lambda!16665) (not b!1071335) (not b_lambda!16659) (not b!1071315) (not b_lambda!16663) (not b!1071311))
(check-sat b_and!34741 (not b_next!21907))
