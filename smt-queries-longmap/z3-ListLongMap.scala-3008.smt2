; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42352 () Bool)

(assert start!42352)

(declare-fun b_free!11857 () Bool)

(declare-fun b_next!11857 () Bool)

(assert (=> start!42352 (= b_free!11857 (not b_next!11857))))

(declare-fun tp!41602 () Bool)

(declare-fun b_and!20277 () Bool)

(assert (=> start!42352 (= tp!41602 b_and!20277)))

(declare-fun mapNonEmpty!21637 () Bool)

(declare-fun mapRes!21637 () Bool)

(declare-fun tp!41601 () Bool)

(declare-fun e!277048 () Bool)

(assert (=> mapNonEmpty!21637 (= mapRes!21637 (and tp!41601 e!277048))))

(declare-fun mapKey!21637 () (_ BitVec 32))

(declare-datatypes ((V!18819 0))(
  ( (V!18820 (val!6687 Int)) )
))
(declare-datatypes ((ValueCell!6299 0))(
  ( (ValueCellFull!6299 (v!8972 V!18819)) (EmptyCell!6299) )
))
(declare-datatypes ((array!30311 0))(
  ( (array!30312 (arr!14576 (Array (_ BitVec 32) ValueCell!6299)) (size!14929 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30311)

(declare-fun mapRest!21637 () (Array (_ BitVec 32) ValueCell!6299))

(declare-fun mapValue!21637 () ValueCell!6299)

(assert (=> mapNonEmpty!21637 (= (arr!14576 _values!833) (store mapRest!21637 mapKey!21637 mapValue!21637))))

(declare-fun b!472437 () Bool)

(declare-fun e!277050 () Bool)

(declare-fun e!277051 () Bool)

(assert (=> b!472437 (= e!277050 (and e!277051 mapRes!21637))))

(declare-fun condMapEmpty!21637 () Bool)

(declare-fun mapDefault!21637 () ValueCell!6299)

(assert (=> b!472437 (= condMapEmpty!21637 (= (arr!14576 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6299)) mapDefault!21637)))))

(declare-fun b!472438 () Bool)

(declare-fun e!277049 () Bool)

(declare-fun e!277046 () Bool)

(assert (=> b!472438 (= e!277049 (not e!277046))))

(declare-fun res!282248 () Bool)

(assert (=> b!472438 (=> res!282248 e!277046)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472438 (= res!282248 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8854 0))(
  ( (tuple2!8855 (_1!4438 (_ BitVec 64)) (_2!4438 V!18819)) )
))
(declare-datatypes ((List!8923 0))(
  ( (Nil!8920) (Cons!8919 (h!9775 tuple2!8854) (t!14882 List!8923)) )
))
(declare-datatypes ((ListLongMap!7757 0))(
  ( (ListLongMap!7758 (toList!3894 List!8923)) )
))
(declare-fun lt!214246 () ListLongMap!7757)

(declare-fun lt!214247 () ListLongMap!7757)

(assert (=> b!472438 (= lt!214246 lt!214247)))

(declare-fun minValueBefore!38 () V!18819)

(declare-fun zeroValue!794 () V!18819)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13881 0))(
  ( (Unit!13882) )
))
(declare-fun lt!214245 () Unit!13881)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30313 0))(
  ( (array!30314 (arr!14577 (Array (_ BitVec 32) (_ BitVec 64))) (size!14930 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30313)

(declare-fun minValueAfter!38 () V!18819)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!222 (array!30313 array!30311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 V!18819 V!18819 (_ BitVec 32) Int) Unit!13881)

(assert (=> b!472438 (= lt!214245 (lemmaNoChangeToArrayThenSameMapNoExtras!222 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2065 (array!30313 array!30311 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7757)

(assert (=> b!472438 (= lt!214247 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472438 (= lt!214246 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21637 () Bool)

(assert (=> mapIsEmpty!21637 mapRes!21637))

(declare-fun res!282247 () Bool)

(assert (=> start!42352 (=> (not res!282247) (not e!277049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42352 (= res!282247 (validMask!0 mask!1365))))

(assert (=> start!42352 e!277049))

(declare-fun tp_is_empty!13285 () Bool)

(assert (=> start!42352 tp_is_empty!13285))

(assert (=> start!42352 tp!41602))

(assert (=> start!42352 true))

(declare-fun array_inv!10602 (array!30313) Bool)

(assert (=> start!42352 (array_inv!10602 _keys!1025)))

(declare-fun array_inv!10603 (array!30311) Bool)

(assert (=> start!42352 (and (array_inv!10603 _values!833) e!277050)))

(declare-fun b!472439 () Bool)

(declare-fun res!282245 () Bool)

(assert (=> b!472439 (=> (not res!282245) (not e!277049))))

(assert (=> b!472439 (= res!282245 (and (= (size!14929 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14930 _keys!1025) (size!14929 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472440 () Bool)

(declare-fun res!282246 () Bool)

(assert (=> b!472440 (=> (not res!282246) (not e!277049))))

(declare-datatypes ((List!8924 0))(
  ( (Nil!8921) (Cons!8920 (h!9776 (_ BitVec 64)) (t!14883 List!8924)) )
))
(declare-fun arrayNoDuplicates!0 (array!30313 (_ BitVec 32) List!8924) Bool)

(assert (=> b!472440 (= res!282246 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8921))))

(declare-fun b!472441 () Bool)

(declare-fun res!282249 () Bool)

(assert (=> b!472441 (=> (not res!282249) (not e!277049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30313 (_ BitVec 32)) Bool)

(assert (=> b!472441 (= res!282249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472442 () Bool)

(assert (=> b!472442 (= e!277048 tp_is_empty!13285)))

(declare-fun b!472443 () Bool)

(assert (=> b!472443 (= e!277046 (bvsle #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun lt!214248 () ListLongMap!7757)

(declare-fun getCurrentListMap!2198 (array!30313 array!30311 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7757)

(assert (=> b!472443 (= lt!214248 (getCurrentListMap!2198 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472444 () Bool)

(assert (=> b!472444 (= e!277051 tp_is_empty!13285)))

(assert (= (and start!42352 res!282247) b!472439))

(assert (= (and b!472439 res!282245) b!472441))

(assert (= (and b!472441 res!282249) b!472440))

(assert (= (and b!472440 res!282246) b!472438))

(assert (= (and b!472438 (not res!282248)) b!472443))

(assert (= (and b!472437 condMapEmpty!21637) mapIsEmpty!21637))

(assert (= (and b!472437 (not condMapEmpty!21637)) mapNonEmpty!21637))

(get-info :version)

(assert (= (and mapNonEmpty!21637 ((_ is ValueCellFull!6299) mapValue!21637)) b!472442))

(assert (= (and b!472437 ((_ is ValueCellFull!6299) mapDefault!21637)) b!472444))

(assert (= start!42352 b!472437))

(declare-fun m!453903 () Bool)

(assert (=> b!472441 m!453903))

(declare-fun m!453905 () Bool)

(assert (=> start!42352 m!453905))

(declare-fun m!453907 () Bool)

(assert (=> start!42352 m!453907))

(declare-fun m!453909 () Bool)

(assert (=> start!42352 m!453909))

(declare-fun m!453911 () Bool)

(assert (=> b!472443 m!453911))

(declare-fun m!453913 () Bool)

(assert (=> b!472440 m!453913))

(declare-fun m!453915 () Bool)

(assert (=> mapNonEmpty!21637 m!453915))

(declare-fun m!453917 () Bool)

(assert (=> b!472438 m!453917))

(declare-fun m!453919 () Bool)

(assert (=> b!472438 m!453919))

(declare-fun m!453921 () Bool)

(assert (=> b!472438 m!453921))

(check-sat (not b_next!11857) (not b!472438) (not b!472440) tp_is_empty!13285 (not b!472443) (not start!42352) (not b!472441) (not mapNonEmpty!21637) b_and!20277)
(check-sat b_and!20277 (not b_next!11857))
(get-model)

(declare-fun d!75263 () Bool)

(assert (=> d!75263 (= (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214275 () Unit!13881)

(declare-fun choose!1357 (array!30313 array!30311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 V!18819 V!18819 (_ BitVec 32) Int) Unit!13881)

(assert (=> d!75263 (= lt!214275 (choose!1357 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75263 (validMask!0 mask!1365)))

(assert (=> d!75263 (= (lemmaNoChangeToArrayThenSameMapNoExtras!222 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214275)))

(declare-fun bs!14974 () Bool)

(assert (= bs!14974 d!75263))

(assert (=> bs!14974 m!453921))

(assert (=> bs!14974 m!453919))

(declare-fun m!453963 () Bool)

(assert (=> bs!14974 m!453963))

(assert (=> bs!14974 m!453905))

(assert (=> b!472438 d!75263))

(declare-fun b!472517 () Bool)

(assert (=> b!472517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> b!472517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _values!833)))))

(declare-fun e!277106 () Bool)

(declare-fun lt!214294 () ListLongMap!7757)

(declare-fun apply!331 (ListLongMap!7757 (_ BitVec 64)) V!18819)

(declare-fun get!7102 (ValueCell!6299 V!18819) V!18819)

(declare-fun dynLambda!927 (Int (_ BitVec 64)) V!18819)

(assert (=> b!472517 (= e!277106 (= (apply!331 lt!214294 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30436 () Bool)

(declare-fun call!30439 () ListLongMap!7757)

(assert (=> bm!30436 (= call!30439 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472518 () Bool)

(declare-fun e!277105 () Bool)

(declare-fun isEmpty!582 (ListLongMap!7757) Bool)

(assert (=> b!472518 (= e!277105 (isEmpty!582 lt!214294))))

(declare-fun d!75265 () Bool)

(declare-fun e!277104 () Bool)

(assert (=> d!75265 e!277104))

(declare-fun res!282288 () Bool)

(assert (=> d!75265 (=> (not res!282288) (not e!277104))))

(declare-fun contains!2537 (ListLongMap!7757 (_ BitVec 64)) Bool)

(assert (=> d!75265 (= res!282288 (not (contains!2537 lt!214294 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277107 () ListLongMap!7757)

(assert (=> d!75265 (= lt!214294 e!277107)))

(declare-fun c!56949 () Bool)

(assert (=> d!75265 (= c!56949 (bvsge #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> d!75265 (validMask!0 mask!1365)))

(assert (=> d!75265 (= (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214294)))

(declare-fun b!472519 () Bool)

(declare-fun lt!214295 () Unit!13881)

(declare-fun lt!214290 () Unit!13881)

(assert (=> b!472519 (= lt!214295 lt!214290)))

(declare-fun lt!214292 () ListLongMap!7757)

(declare-fun lt!214291 () (_ BitVec 64))

(declare-fun lt!214296 () (_ BitVec 64))

(declare-fun lt!214293 () V!18819)

(declare-fun +!1747 (ListLongMap!7757 tuple2!8854) ListLongMap!7757)

(assert (=> b!472519 (not (contains!2537 (+!1747 lt!214292 (tuple2!8855 lt!214291 lt!214293)) lt!214296))))

(declare-fun addStillNotContains!165 (ListLongMap!7757 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13881)

(assert (=> b!472519 (= lt!214290 (addStillNotContains!165 lt!214292 lt!214291 lt!214293 lt!214296))))

(assert (=> b!472519 (= lt!214296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472519 (= lt!214293 (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472519 (= lt!214291 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472519 (= lt!214292 call!30439)))

(declare-fun e!277108 () ListLongMap!7757)

(assert (=> b!472519 (= e!277108 (+!1747 call!30439 (tuple2!8855 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472520 () Bool)

(declare-fun e!277102 () Bool)

(assert (=> b!472520 (= e!277102 e!277105)))

(declare-fun c!56947 () Bool)

(assert (=> b!472520 (= c!56947 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun b!472521 () Bool)

(assert (=> b!472521 (= e!277108 call!30439)))

(declare-fun b!472522 () Bool)

(assert (=> b!472522 (= e!277107 e!277108)))

(declare-fun c!56948 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!472522 (= c!56948 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472523 () Bool)

(assert (=> b!472523 (= e!277105 (= lt!214294 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472524 () Bool)

(assert (=> b!472524 (= e!277102 e!277106)))

(assert (=> b!472524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun res!282290 () Bool)

(assert (=> b!472524 (= res!282290 (contains!2537 lt!214294 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472524 (=> (not res!282290) (not e!277106))))

(declare-fun b!472525 () Bool)

(assert (=> b!472525 (= e!277107 (ListLongMap!7758 Nil!8920))))

(declare-fun b!472526 () Bool)

(declare-fun e!277103 () Bool)

(assert (=> b!472526 (= e!277103 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472526 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472527 () Bool)

(declare-fun res!282291 () Bool)

(assert (=> b!472527 (=> (not res!282291) (not e!277104))))

(assert (=> b!472527 (= res!282291 (not (contains!2537 lt!214294 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472528 () Bool)

(assert (=> b!472528 (= e!277104 e!277102)))

(declare-fun c!56946 () Bool)

(assert (=> b!472528 (= c!56946 e!277103)))

(declare-fun res!282289 () Bool)

(assert (=> b!472528 (=> (not res!282289) (not e!277103))))

(assert (=> b!472528 (= res!282289 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (= (and d!75265 c!56949) b!472525))

(assert (= (and d!75265 (not c!56949)) b!472522))

(assert (= (and b!472522 c!56948) b!472519))

(assert (= (and b!472522 (not c!56948)) b!472521))

(assert (= (or b!472519 b!472521) bm!30436))

(assert (= (and d!75265 res!282288) b!472527))

(assert (= (and b!472527 res!282291) b!472528))

(assert (= (and b!472528 res!282289) b!472526))

(assert (= (and b!472528 c!56946) b!472524))

(assert (= (and b!472528 (not c!56946)) b!472520))

(assert (= (and b!472524 res!282290) b!472517))

(assert (= (and b!472520 c!56947) b!472523))

(assert (= (and b!472520 (not c!56947)) b!472518))

(declare-fun b_lambda!10167 () Bool)

(assert (=> (not b_lambda!10167) (not b!472517)))

(declare-fun t!14888 () Bool)

(declare-fun tb!3919 () Bool)

(assert (=> (and start!42352 (= defaultEntry!841 defaultEntry!841) t!14888) tb!3919))

(declare-fun result!7431 () Bool)

(assert (=> tb!3919 (= result!7431 tp_is_empty!13285)))

(assert (=> b!472517 t!14888))

(declare-fun b_and!20283 () Bool)

(assert (= b_and!20277 (and (=> t!14888 result!7431) b_and!20283)))

(declare-fun b_lambda!10169 () Bool)

(assert (=> (not b_lambda!10169) (not b!472519)))

(assert (=> b!472519 t!14888))

(declare-fun b_and!20285 () Bool)

(assert (= b_and!20283 (and (=> t!14888 result!7431) b_and!20285)))

(declare-fun m!453965 () Bool)

(assert (=> b!472526 m!453965))

(assert (=> b!472526 m!453965))

(declare-fun m!453967 () Bool)

(assert (=> b!472526 m!453967))

(declare-fun m!453969 () Bool)

(assert (=> b!472518 m!453969))

(declare-fun m!453971 () Bool)

(assert (=> d!75265 m!453971))

(assert (=> d!75265 m!453905))

(assert (=> b!472522 m!453965))

(assert (=> b!472522 m!453965))

(assert (=> b!472522 m!453967))

(declare-fun m!453973 () Bool)

(assert (=> b!472517 m!453973))

(declare-fun m!453975 () Bool)

(assert (=> b!472517 m!453975))

(declare-fun m!453977 () Bool)

(assert (=> b!472517 m!453977))

(assert (=> b!472517 m!453965))

(declare-fun m!453979 () Bool)

(assert (=> b!472517 m!453979))

(assert (=> b!472517 m!453975))

(assert (=> b!472517 m!453965))

(assert (=> b!472517 m!453973))

(assert (=> b!472524 m!453965))

(assert (=> b!472524 m!453965))

(declare-fun m!453981 () Bool)

(assert (=> b!472524 m!453981))

(assert (=> b!472519 m!453973))

(assert (=> b!472519 m!453975))

(assert (=> b!472519 m!453977))

(assert (=> b!472519 m!453975))

(assert (=> b!472519 m!453973))

(declare-fun m!453983 () Bool)

(assert (=> b!472519 m!453983))

(declare-fun m!453985 () Bool)

(assert (=> b!472519 m!453985))

(assert (=> b!472519 m!453985))

(declare-fun m!453987 () Bool)

(assert (=> b!472519 m!453987))

(declare-fun m!453989 () Bool)

(assert (=> b!472519 m!453989))

(assert (=> b!472519 m!453965))

(declare-fun m!453991 () Bool)

(assert (=> b!472523 m!453991))

(assert (=> bm!30436 m!453991))

(declare-fun m!453993 () Bool)

(assert (=> b!472527 m!453993))

(assert (=> b!472438 d!75265))

(declare-fun b!472531 () Bool)

(assert (=> b!472531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> b!472531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _values!833)))))

(declare-fun lt!214301 () ListLongMap!7757)

(declare-fun e!277113 () Bool)

(assert (=> b!472531 (= e!277113 (= (apply!331 lt!214301 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30437 () Bool)

(declare-fun call!30440 () ListLongMap!7757)

(assert (=> bm!30437 (= call!30440 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472532 () Bool)

(declare-fun e!277112 () Bool)

(assert (=> b!472532 (= e!277112 (isEmpty!582 lt!214301))))

(declare-fun d!75267 () Bool)

(declare-fun e!277111 () Bool)

(assert (=> d!75267 e!277111))

(declare-fun res!282292 () Bool)

(assert (=> d!75267 (=> (not res!282292) (not e!277111))))

(assert (=> d!75267 (= res!282292 (not (contains!2537 lt!214301 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!277114 () ListLongMap!7757)

(assert (=> d!75267 (= lt!214301 e!277114)))

(declare-fun c!56953 () Bool)

(assert (=> d!75267 (= c!56953 (bvsge #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> d!75267 (validMask!0 mask!1365)))

(assert (=> d!75267 (= (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214301)))

(declare-fun b!472533 () Bool)

(declare-fun lt!214302 () Unit!13881)

(declare-fun lt!214297 () Unit!13881)

(assert (=> b!472533 (= lt!214302 lt!214297)))

(declare-fun lt!214299 () ListLongMap!7757)

(declare-fun lt!214298 () (_ BitVec 64))

(declare-fun lt!214300 () V!18819)

(declare-fun lt!214303 () (_ BitVec 64))

(assert (=> b!472533 (not (contains!2537 (+!1747 lt!214299 (tuple2!8855 lt!214298 lt!214300)) lt!214303))))

(assert (=> b!472533 (= lt!214297 (addStillNotContains!165 lt!214299 lt!214298 lt!214300 lt!214303))))

(assert (=> b!472533 (= lt!214303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472533 (= lt!214300 (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472533 (= lt!214298 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472533 (= lt!214299 call!30440)))

(declare-fun e!277115 () ListLongMap!7757)

(assert (=> b!472533 (= e!277115 (+!1747 call!30440 (tuple2!8855 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472534 () Bool)

(declare-fun e!277109 () Bool)

(assert (=> b!472534 (= e!277109 e!277112)))

(declare-fun c!56951 () Bool)

(assert (=> b!472534 (= c!56951 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun b!472535 () Bool)

(assert (=> b!472535 (= e!277115 call!30440)))

(declare-fun b!472536 () Bool)

(assert (=> b!472536 (= e!277114 e!277115)))

(declare-fun c!56952 () Bool)

(assert (=> b!472536 (= c!56952 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472537 () Bool)

(assert (=> b!472537 (= e!277112 (= lt!214301 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472538 () Bool)

(assert (=> b!472538 (= e!277109 e!277113)))

(assert (=> b!472538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun res!282294 () Bool)

(assert (=> b!472538 (= res!282294 (contains!2537 lt!214301 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472538 (=> (not res!282294) (not e!277113))))

(declare-fun b!472539 () Bool)

(assert (=> b!472539 (= e!277114 (ListLongMap!7758 Nil!8920))))

(declare-fun b!472540 () Bool)

(declare-fun e!277110 () Bool)

(assert (=> b!472540 (= e!277110 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472540 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472541 () Bool)

(declare-fun res!282295 () Bool)

(assert (=> b!472541 (=> (not res!282295) (not e!277111))))

(assert (=> b!472541 (= res!282295 (not (contains!2537 lt!214301 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472542 () Bool)

(assert (=> b!472542 (= e!277111 e!277109)))

(declare-fun c!56950 () Bool)

(assert (=> b!472542 (= c!56950 e!277110)))

(declare-fun res!282293 () Bool)

(assert (=> b!472542 (=> (not res!282293) (not e!277110))))

(assert (=> b!472542 (= res!282293 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (= (and d!75267 c!56953) b!472539))

(assert (= (and d!75267 (not c!56953)) b!472536))

(assert (= (and b!472536 c!56952) b!472533))

(assert (= (and b!472536 (not c!56952)) b!472535))

(assert (= (or b!472533 b!472535) bm!30437))

(assert (= (and d!75267 res!282292) b!472541))

(assert (= (and b!472541 res!282295) b!472542))

(assert (= (and b!472542 res!282293) b!472540))

(assert (= (and b!472542 c!56950) b!472538))

(assert (= (and b!472542 (not c!56950)) b!472534))

(assert (= (and b!472538 res!282294) b!472531))

(assert (= (and b!472534 c!56951) b!472537))

(assert (= (and b!472534 (not c!56951)) b!472532))

(declare-fun b_lambda!10171 () Bool)

(assert (=> (not b_lambda!10171) (not b!472531)))

(assert (=> b!472531 t!14888))

(declare-fun b_and!20287 () Bool)

(assert (= b_and!20285 (and (=> t!14888 result!7431) b_and!20287)))

(declare-fun b_lambda!10173 () Bool)

(assert (=> (not b_lambda!10173) (not b!472533)))

(assert (=> b!472533 t!14888))

(declare-fun b_and!20289 () Bool)

(assert (= b_and!20287 (and (=> t!14888 result!7431) b_and!20289)))

(assert (=> b!472540 m!453965))

(assert (=> b!472540 m!453965))

(assert (=> b!472540 m!453967))

(declare-fun m!453995 () Bool)

(assert (=> b!472532 m!453995))

(declare-fun m!453997 () Bool)

(assert (=> d!75267 m!453997))

(assert (=> d!75267 m!453905))

(assert (=> b!472536 m!453965))

(assert (=> b!472536 m!453965))

(assert (=> b!472536 m!453967))

(assert (=> b!472531 m!453973))

(assert (=> b!472531 m!453975))

(assert (=> b!472531 m!453977))

(assert (=> b!472531 m!453965))

(declare-fun m!453999 () Bool)

(assert (=> b!472531 m!453999))

(assert (=> b!472531 m!453975))

(assert (=> b!472531 m!453965))

(assert (=> b!472531 m!453973))

(assert (=> b!472538 m!453965))

(assert (=> b!472538 m!453965))

(declare-fun m!454001 () Bool)

(assert (=> b!472538 m!454001))

(assert (=> b!472533 m!453973))

(assert (=> b!472533 m!453975))

(assert (=> b!472533 m!453977))

(assert (=> b!472533 m!453975))

(assert (=> b!472533 m!453973))

(declare-fun m!454003 () Bool)

(assert (=> b!472533 m!454003))

(declare-fun m!454005 () Bool)

(assert (=> b!472533 m!454005))

(assert (=> b!472533 m!454005))

(declare-fun m!454007 () Bool)

(assert (=> b!472533 m!454007))

(declare-fun m!454009 () Bool)

(assert (=> b!472533 m!454009))

(assert (=> b!472533 m!453965))

(declare-fun m!454011 () Bool)

(assert (=> b!472537 m!454011))

(assert (=> bm!30437 m!454011))

(declare-fun m!454013 () Bool)

(assert (=> b!472541 m!454013))

(assert (=> b!472438 d!75267))

(declare-fun call!30456 () ListLongMap!7757)

(declare-fun c!56969 () Bool)

(declare-fun call!30459 () ListLongMap!7757)

(declare-fun bm!30452 () Bool)

(declare-fun call!30461 () ListLongMap!7757)

(declare-fun call!30457 () ListLongMap!7757)

(declare-fun c!56968 () Bool)

(assert (=> bm!30452 (= call!30456 (+!1747 (ite c!56969 call!30457 (ite c!56968 call!30461 call!30459)) (ite (or c!56969 c!56968) (tuple2!8855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8855 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!472585 () Bool)

(declare-fun e!277150 () ListLongMap!7757)

(declare-fun e!277153 () ListLongMap!7757)

(assert (=> b!472585 (= e!277150 e!277153)))

(assert (=> b!472585 (= c!56968 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!472586 () Bool)

(declare-fun c!56970 () Bool)

(assert (=> b!472586 (= c!56970 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277145 () ListLongMap!7757)

(assert (=> b!472586 (= e!277153 e!277145)))

(declare-fun b!472587 () Bool)

(declare-fun res!282317 () Bool)

(declare-fun e!277146 () Bool)

(assert (=> b!472587 (=> (not res!282317) (not e!277146))))

(declare-fun e!277151 () Bool)

(assert (=> b!472587 (= res!282317 e!277151)))

(declare-fun c!56967 () Bool)

(assert (=> b!472587 (= c!56967 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!472588 () Bool)

(declare-fun e!277152 () Unit!13881)

(declare-fun lt!214356 () Unit!13881)

(assert (=> b!472588 (= e!277152 lt!214356)))

(declare-fun lt!214351 () ListLongMap!7757)

(assert (=> b!472588 (= lt!214351 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214352 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214366 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214366 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214365 () Unit!13881)

(declare-fun addStillContains!290 (ListLongMap!7757 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13881)

(assert (=> b!472588 (= lt!214365 (addStillContains!290 lt!214351 lt!214352 zeroValue!794 lt!214366))))

(assert (=> b!472588 (contains!2537 (+!1747 lt!214351 (tuple2!8855 lt!214352 zeroValue!794)) lt!214366)))

(declare-fun lt!214353 () Unit!13881)

(assert (=> b!472588 (= lt!214353 lt!214365)))

(declare-fun lt!214360 () ListLongMap!7757)

(assert (=> b!472588 (= lt!214360 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214358 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214361 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214361 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214369 () Unit!13881)

(declare-fun addApplyDifferent!290 (ListLongMap!7757 (_ BitVec 64) V!18819 (_ BitVec 64)) Unit!13881)

(assert (=> b!472588 (= lt!214369 (addApplyDifferent!290 lt!214360 lt!214358 minValueBefore!38 lt!214361))))

(assert (=> b!472588 (= (apply!331 (+!1747 lt!214360 (tuple2!8855 lt!214358 minValueBefore!38)) lt!214361) (apply!331 lt!214360 lt!214361))))

(declare-fun lt!214355 () Unit!13881)

(assert (=> b!472588 (= lt!214355 lt!214369)))

(declare-fun lt!214348 () ListLongMap!7757)

(assert (=> b!472588 (= lt!214348 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214359 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214354 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214354 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214362 () Unit!13881)

(assert (=> b!472588 (= lt!214362 (addApplyDifferent!290 lt!214348 lt!214359 zeroValue!794 lt!214354))))

(assert (=> b!472588 (= (apply!331 (+!1747 lt!214348 (tuple2!8855 lt!214359 zeroValue!794)) lt!214354) (apply!331 lt!214348 lt!214354))))

(declare-fun lt!214350 () Unit!13881)

(assert (=> b!472588 (= lt!214350 lt!214362)))

(declare-fun lt!214364 () ListLongMap!7757)

(assert (=> b!472588 (= lt!214364 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214349 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214363 () (_ BitVec 64))

(assert (=> b!472588 (= lt!214363 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472588 (= lt!214356 (addApplyDifferent!290 lt!214364 lt!214349 minValueBefore!38 lt!214363))))

(assert (=> b!472588 (= (apply!331 (+!1747 lt!214364 (tuple2!8855 lt!214349 minValueBefore!38)) lt!214363) (apply!331 lt!214364 lt!214363))))

(declare-fun b!472589 () Bool)

(declare-fun Unit!13885 () Unit!13881)

(assert (=> b!472589 (= e!277152 Unit!13885)))

(declare-fun b!472590 () Bool)

(declare-fun call!30455 () ListLongMap!7757)

(assert (=> b!472590 (= e!277145 call!30455)))

(declare-fun b!472591 () Bool)

(declare-fun e!277142 () Bool)

(declare-fun call!30458 () Bool)

(assert (=> b!472591 (= e!277142 (not call!30458))))

(declare-fun b!472592 () Bool)

(assert (=> b!472592 (= e!277153 call!30455)))

(declare-fun b!472593 () Bool)

(declare-fun e!277154 () Bool)

(assert (=> b!472593 (= e!277142 e!277154)))

(declare-fun res!282316 () Bool)

(assert (=> b!472593 (= res!282316 call!30458)))

(assert (=> b!472593 (=> (not res!282316) (not e!277154))))

(declare-fun e!277149 () Bool)

(declare-fun b!472594 () Bool)

(declare-fun lt!214368 () ListLongMap!7757)

(assert (=> b!472594 (= e!277149 (= (apply!331 lt!214368 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)) (get!7102 (select (arr!14576 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!472594 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14929 _values!833)))))

(assert (=> b!472594 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun b!472595 () Bool)

(declare-fun call!30460 () Bool)

(assert (=> b!472595 (= e!277151 (not call!30460))))

(declare-fun bm!30454 () Bool)

(assert (=> bm!30454 (= call!30460 (contains!2537 lt!214368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30455 () Bool)

(assert (=> bm!30455 (= call!30459 call!30461)))

(declare-fun bm!30456 () Bool)

(assert (=> bm!30456 (= call!30458 (contains!2537 lt!214368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30457 () Bool)

(assert (=> bm!30457 (= call!30455 call!30456)))

(declare-fun bm!30458 () Bool)

(assert (=> bm!30458 (= call!30457 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472596 () Bool)

(assert (=> b!472596 (= e!277150 (+!1747 call!30456 (tuple2!8855 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!472597 () Bool)

(declare-fun e!277147 () Bool)

(assert (=> b!472597 (= e!277147 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472598 () Bool)

(declare-fun e!277143 () Bool)

(assert (=> b!472598 (= e!277143 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472599 () Bool)

(assert (=> b!472599 (= e!277154 (= (apply!331 lt!214368 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!472600 () Bool)

(declare-fun e!277144 () Bool)

(assert (=> b!472600 (= e!277151 e!277144)))

(declare-fun res!282314 () Bool)

(assert (=> b!472600 (= res!282314 call!30460)))

(assert (=> b!472600 (=> (not res!282314) (not e!277144))))

(declare-fun b!472601 () Bool)

(assert (=> b!472601 (= e!277144 (= (apply!331 lt!214368 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!472602 () Bool)

(assert (=> b!472602 (= e!277145 call!30459)))

(declare-fun b!472603 () Bool)

(assert (=> b!472603 (= e!277146 e!277142)))

(declare-fun c!56971 () Bool)

(assert (=> b!472603 (= c!56971 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!472604 () Bool)

(declare-fun e!277148 () Bool)

(assert (=> b!472604 (= e!277148 e!277149)))

(declare-fun res!282315 () Bool)

(assert (=> b!472604 (=> (not res!282315) (not e!277149))))

(assert (=> b!472604 (= res!282315 (contains!2537 lt!214368 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun b!472605 () Bool)

(declare-fun res!282322 () Bool)

(assert (=> b!472605 (=> (not res!282322) (not e!277146))))

(assert (=> b!472605 (= res!282322 e!277148)))

(declare-fun res!282318 () Bool)

(assert (=> b!472605 (=> res!282318 e!277148)))

(assert (=> b!472605 (= res!282318 (not e!277147))))

(declare-fun res!282321 () Bool)

(assert (=> b!472605 (=> (not res!282321) (not e!277147))))

(assert (=> b!472605 (= res!282321 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(declare-fun bm!30453 () Bool)

(assert (=> bm!30453 (= call!30461 call!30457)))

(declare-fun d!75269 () Bool)

(assert (=> d!75269 e!277146))

(declare-fun res!282319 () Bool)

(assert (=> d!75269 (=> (not res!282319) (not e!277146))))

(assert (=> d!75269 (= res!282319 (or (bvsge #b00000000000000000000000000000000 (size!14930 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))))

(declare-fun lt!214367 () ListLongMap!7757)

(assert (=> d!75269 (= lt!214368 lt!214367)))

(declare-fun lt!214357 () Unit!13881)

(assert (=> d!75269 (= lt!214357 e!277152)))

(declare-fun c!56966 () Bool)

(assert (=> d!75269 (= c!56966 e!277143)))

(declare-fun res!282320 () Bool)

(assert (=> d!75269 (=> (not res!282320) (not e!277143))))

(assert (=> d!75269 (= res!282320 (bvslt #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> d!75269 (= lt!214367 e!277150)))

(assert (=> d!75269 (= c!56969 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75269 (validMask!0 mask!1365)))

(assert (=> d!75269 (= (getCurrentListMap!2198 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214368)))

(assert (= (and d!75269 c!56969) b!472596))

(assert (= (and d!75269 (not c!56969)) b!472585))

(assert (= (and b!472585 c!56968) b!472592))

(assert (= (and b!472585 (not c!56968)) b!472586))

(assert (= (and b!472586 c!56970) b!472590))

(assert (= (and b!472586 (not c!56970)) b!472602))

(assert (= (or b!472590 b!472602) bm!30455))

(assert (= (or b!472592 bm!30455) bm!30453))

(assert (= (or b!472592 b!472590) bm!30457))

(assert (= (or b!472596 bm!30453) bm!30458))

(assert (= (or b!472596 bm!30457) bm!30452))

(assert (= (and d!75269 res!282320) b!472598))

(assert (= (and d!75269 c!56966) b!472588))

(assert (= (and d!75269 (not c!56966)) b!472589))

(assert (= (and d!75269 res!282319) b!472605))

(assert (= (and b!472605 res!282321) b!472597))

(assert (= (and b!472605 (not res!282318)) b!472604))

(assert (= (and b!472604 res!282315) b!472594))

(assert (= (and b!472605 res!282322) b!472587))

(assert (= (and b!472587 c!56967) b!472600))

(assert (= (and b!472587 (not c!56967)) b!472595))

(assert (= (and b!472600 res!282314) b!472601))

(assert (= (or b!472600 b!472595) bm!30454))

(assert (= (and b!472587 res!282317) b!472603))

(assert (= (and b!472603 c!56971) b!472593))

(assert (= (and b!472603 (not c!56971)) b!472591))

(assert (= (and b!472593 res!282316) b!472599))

(assert (= (or b!472593 b!472591) bm!30456))

(declare-fun b_lambda!10175 () Bool)

(assert (=> (not b_lambda!10175) (not b!472594)))

(assert (=> b!472594 t!14888))

(declare-fun b_and!20291 () Bool)

(assert (= b_and!20289 (and (=> t!14888 result!7431) b_and!20291)))

(declare-fun m!454015 () Bool)

(assert (=> bm!30454 m!454015))

(assert (=> bm!30458 m!453921))

(declare-fun m!454017 () Bool)

(assert (=> b!472588 m!454017))

(declare-fun m!454019 () Bool)

(assert (=> b!472588 m!454019))

(declare-fun m!454021 () Bool)

(assert (=> b!472588 m!454021))

(declare-fun m!454023 () Bool)

(assert (=> b!472588 m!454023))

(declare-fun m!454025 () Bool)

(assert (=> b!472588 m!454025))

(declare-fun m!454027 () Bool)

(assert (=> b!472588 m!454027))

(declare-fun m!454029 () Bool)

(assert (=> b!472588 m!454029))

(assert (=> b!472588 m!453921))

(declare-fun m!454031 () Bool)

(assert (=> b!472588 m!454031))

(declare-fun m!454033 () Bool)

(assert (=> b!472588 m!454033))

(declare-fun m!454035 () Bool)

(assert (=> b!472588 m!454035))

(declare-fun m!454037 () Bool)

(assert (=> b!472588 m!454037))

(assert (=> b!472588 m!454027))

(declare-fun m!454039 () Bool)

(assert (=> b!472588 m!454039))

(declare-fun m!454041 () Bool)

(assert (=> b!472588 m!454041))

(assert (=> b!472588 m!454033))

(assert (=> b!472588 m!454031))

(declare-fun m!454043 () Bool)

(assert (=> b!472588 m!454043))

(assert (=> b!472588 m!453965))

(assert (=> b!472588 m!454023))

(declare-fun m!454045 () Bool)

(assert (=> b!472588 m!454045))

(declare-fun m!454047 () Bool)

(assert (=> b!472596 m!454047))

(declare-fun m!454049 () Bool)

(assert (=> b!472599 m!454049))

(assert (=> b!472604 m!453965))

(assert (=> b!472604 m!453965))

(declare-fun m!454051 () Bool)

(assert (=> b!472604 m!454051))

(assert (=> b!472598 m!453965))

(assert (=> b!472598 m!453965))

(assert (=> b!472598 m!453967))

(declare-fun m!454053 () Bool)

(assert (=> bm!30456 m!454053))

(declare-fun m!454055 () Bool)

(assert (=> bm!30452 m!454055))

(declare-fun m!454057 () Bool)

(assert (=> b!472601 m!454057))

(assert (=> b!472594 m!453973))

(assert (=> b!472594 m!453975))

(assert (=> b!472594 m!453965))

(declare-fun m!454059 () Bool)

(assert (=> b!472594 m!454059))

(assert (=> b!472594 m!453973))

(assert (=> b!472594 m!453975))

(assert (=> b!472594 m!453977))

(assert (=> b!472594 m!453965))

(assert (=> b!472597 m!453965))

(assert (=> b!472597 m!453965))

(assert (=> b!472597 m!453967))

(assert (=> d!75269 m!453905))

(assert (=> b!472443 d!75269))

(declare-fun b!472614 () Bool)

(declare-fun e!277161 () Bool)

(declare-fun call!30464 () Bool)

(assert (=> b!472614 (= e!277161 call!30464)))

(declare-fun b!472615 () Bool)

(declare-fun e!277163 () Bool)

(assert (=> b!472615 (= e!277161 e!277163)))

(declare-fun lt!214378 () (_ BitVec 64))

(assert (=> b!472615 (= lt!214378 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214377 () Unit!13881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30313 (_ BitVec 64) (_ BitVec 32)) Unit!13881)

(assert (=> b!472615 (= lt!214377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!214378 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!472615 (arrayContainsKey!0 _keys!1025 lt!214378 #b00000000000000000000000000000000)))

(declare-fun lt!214376 () Unit!13881)

(assert (=> b!472615 (= lt!214376 lt!214377)))

(declare-fun res!282327 () Bool)

(declare-datatypes ((SeekEntryResult!3550 0))(
  ( (MissingZero!3550 (index!16379 (_ BitVec 32))) (Found!3550 (index!16380 (_ BitVec 32))) (Intermediate!3550 (undefined!4362 Bool) (index!16381 (_ BitVec 32)) (x!44330 (_ BitVec 32))) (Undefined!3550) (MissingVacant!3550 (index!16382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30313 (_ BitVec 32)) SeekEntryResult!3550)

(assert (=> b!472615 (= res!282327 (= (seekEntryOrOpen!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3550 #b00000000000000000000000000000000)))))

(assert (=> b!472615 (=> (not res!282327) (not e!277163))))

(declare-fun bm!30461 () Bool)

(assert (=> bm!30461 (= call!30464 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!472616 () Bool)

(assert (=> b!472616 (= e!277163 call!30464)))

(declare-fun d!75271 () Bool)

(declare-fun res!282328 () Bool)

(declare-fun e!277162 () Bool)

(assert (=> d!75271 (=> res!282328 e!277162)))

(assert (=> d!75271 (= res!282328 (bvsge #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> d!75271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277162)))

(declare-fun b!472617 () Bool)

(assert (=> b!472617 (= e!277162 e!277161)))

(declare-fun c!56974 () Bool)

(assert (=> b!472617 (= c!56974 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75271 (not res!282328)) b!472617))

(assert (= (and b!472617 c!56974) b!472615))

(assert (= (and b!472617 (not c!56974)) b!472614))

(assert (= (and b!472615 res!282327) b!472616))

(assert (= (or b!472616 b!472614) bm!30461))

(assert (=> b!472615 m!453965))

(declare-fun m!454061 () Bool)

(assert (=> b!472615 m!454061))

(declare-fun m!454063 () Bool)

(assert (=> b!472615 m!454063))

(assert (=> b!472615 m!453965))

(declare-fun m!454065 () Bool)

(assert (=> b!472615 m!454065))

(declare-fun m!454067 () Bool)

(assert (=> bm!30461 m!454067))

(assert (=> b!472617 m!453965))

(assert (=> b!472617 m!453965))

(assert (=> b!472617 m!453967))

(assert (=> b!472441 d!75271))

(declare-fun b!472628 () Bool)

(declare-fun e!277174 () Bool)

(declare-fun call!30467 () Bool)

(assert (=> b!472628 (= e!277174 call!30467)))

(declare-fun b!472629 () Bool)

(declare-fun e!277175 () Bool)

(declare-fun contains!2538 (List!8924 (_ BitVec 64)) Bool)

(assert (=> b!472629 (= e!277175 (contains!2538 Nil!8921 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75273 () Bool)

(declare-fun res!282337 () Bool)

(declare-fun e!277172 () Bool)

(assert (=> d!75273 (=> res!282337 e!277172)))

(assert (=> d!75273 (= res!282337 (bvsge #b00000000000000000000000000000000 (size!14930 _keys!1025)))))

(assert (=> d!75273 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8921) e!277172)))

(declare-fun b!472630 () Bool)

(declare-fun e!277173 () Bool)

(assert (=> b!472630 (= e!277173 e!277174)))

(declare-fun c!56977 () Bool)

(assert (=> b!472630 (= c!56977 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472631 () Bool)

(assert (=> b!472631 (= e!277172 e!277173)))

(declare-fun res!282335 () Bool)

(assert (=> b!472631 (=> (not res!282335) (not e!277173))))

(assert (=> b!472631 (= res!282335 (not e!277175))))

(declare-fun res!282336 () Bool)

(assert (=> b!472631 (=> (not res!282336) (not e!277175))))

(assert (=> b!472631 (= res!282336 (validKeyInArray!0 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30464 () Bool)

(assert (=> bm!30464 (= call!30467 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56977 (Cons!8920 (select (arr!14577 _keys!1025) #b00000000000000000000000000000000) Nil!8921) Nil!8921)))))

(declare-fun b!472632 () Bool)

(assert (=> b!472632 (= e!277174 call!30467)))

(assert (= (and d!75273 (not res!282337)) b!472631))

(assert (= (and b!472631 res!282336) b!472629))

(assert (= (and b!472631 res!282335) b!472630))

(assert (= (and b!472630 c!56977) b!472628))

(assert (= (and b!472630 (not c!56977)) b!472632))

(assert (= (or b!472628 b!472632) bm!30464))

(assert (=> b!472629 m!453965))

(assert (=> b!472629 m!453965))

(declare-fun m!454069 () Bool)

(assert (=> b!472629 m!454069))

(assert (=> b!472630 m!453965))

(assert (=> b!472630 m!453965))

(assert (=> b!472630 m!453967))

(assert (=> b!472631 m!453965))

(assert (=> b!472631 m!453965))

(assert (=> b!472631 m!453967))

(assert (=> bm!30464 m!453965))

(declare-fun m!454071 () Bool)

(assert (=> bm!30464 m!454071))

(assert (=> b!472440 d!75273))

(declare-fun d!75275 () Bool)

(assert (=> d!75275 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42352 d!75275))

(declare-fun d!75277 () Bool)

(assert (=> d!75277 (= (array_inv!10602 _keys!1025) (bvsge (size!14930 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42352 d!75277))

(declare-fun d!75279 () Bool)

(assert (=> d!75279 (= (array_inv!10603 _values!833) (bvsge (size!14929 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42352 d!75279))

(declare-fun b!472639 () Bool)

(declare-fun e!277181 () Bool)

(assert (=> b!472639 (= e!277181 tp_is_empty!13285)))

(declare-fun mapIsEmpty!21646 () Bool)

(declare-fun mapRes!21646 () Bool)

(assert (=> mapIsEmpty!21646 mapRes!21646))

(declare-fun condMapEmpty!21646 () Bool)

(declare-fun mapDefault!21646 () ValueCell!6299)

(assert (=> mapNonEmpty!21637 (= condMapEmpty!21646 (= mapRest!21637 ((as const (Array (_ BitVec 32) ValueCell!6299)) mapDefault!21646)))))

(declare-fun e!277180 () Bool)

(assert (=> mapNonEmpty!21637 (= tp!41601 (and e!277180 mapRes!21646))))

(declare-fun mapNonEmpty!21646 () Bool)

(declare-fun tp!41617 () Bool)

(assert (=> mapNonEmpty!21646 (= mapRes!21646 (and tp!41617 e!277181))))

(declare-fun mapRest!21646 () (Array (_ BitVec 32) ValueCell!6299))

(declare-fun mapValue!21646 () ValueCell!6299)

(declare-fun mapKey!21646 () (_ BitVec 32))

(assert (=> mapNonEmpty!21646 (= mapRest!21637 (store mapRest!21646 mapKey!21646 mapValue!21646))))

(declare-fun b!472640 () Bool)

(assert (=> b!472640 (= e!277180 tp_is_empty!13285)))

(assert (= (and mapNonEmpty!21637 condMapEmpty!21646) mapIsEmpty!21646))

(assert (= (and mapNonEmpty!21637 (not condMapEmpty!21646)) mapNonEmpty!21646))

(assert (= (and mapNonEmpty!21646 ((_ is ValueCellFull!6299) mapValue!21646)) b!472639))

(assert (= (and mapNonEmpty!21637 ((_ is ValueCellFull!6299) mapDefault!21646)) b!472640))

(declare-fun m!454073 () Bool)

(assert (=> mapNonEmpty!21646 m!454073))

(declare-fun b_lambda!10177 () Bool)

(assert (= b_lambda!10167 (or (and start!42352 b_free!11857) b_lambda!10177)))

(declare-fun b_lambda!10179 () Bool)

(assert (= b_lambda!10169 (or (and start!42352 b_free!11857) b_lambda!10179)))

(declare-fun b_lambda!10181 () Bool)

(assert (= b_lambda!10171 (or (and start!42352 b_free!11857) b_lambda!10181)))

(declare-fun b_lambda!10183 () Bool)

(assert (= b_lambda!10175 (or (and start!42352 b_free!11857) b_lambda!10183)))

(declare-fun b_lambda!10185 () Bool)

(assert (= b_lambda!10173 (or (and start!42352 b_free!11857) b_lambda!10185)))

(check-sat (not b!472540) (not b!472522) (not b!472527) (not b_next!11857) (not b_lambda!10185) (not b!472599) (not b!472604) (not b!472629) (not d!75269) (not b!472519) (not b_lambda!10183) (not b!472601) (not bm!30454) (not b!472588) (not b!472598) (not bm!30456) (not b_lambda!10179) (not b!472531) (not b!472597) (not b!472596) (not b!472615) (not b_lambda!10177) (not b!472631) (not b!472594) (not b!472533) (not b!472518) (not b!472538) (not mapNonEmpty!21646) (not d!75263) (not b!472536) (not d!75267) tp_is_empty!13285 (not b!472524) (not bm!30437) (not bm!30436) (not b_lambda!10181) (not b!472537) (not b!472541) (not b!472517) (not bm!30452) (not b!472523) (not d!75265) b_and!20291 (not bm!30458) (not b!472630) (not b!472532) (not bm!30461) (not b!472526) (not bm!30464) (not b!472617))
(check-sat b_and!20291 (not b_next!11857))
