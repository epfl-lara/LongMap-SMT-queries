; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41862 () Bool)

(assert start!41862)

(declare-fun b_free!11479 () Bool)

(declare-fun b_next!11479 () Bool)

(assert (=> start!41862 (= b_free!11479 (not b_next!11479))))

(declare-fun tp!40447 () Bool)

(declare-fun b_and!19833 () Bool)

(assert (=> start!41862 (= tp!40447 b_and!19833)))

(declare-fun res!279325 () Bool)

(declare-fun e!273358 () Bool)

(assert (=> start!41862 (=> (not res!279325) (not e!273358))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41862 (= res!279325 (validMask!0 mask!1365))))

(assert (=> start!41862 e!273358))

(declare-fun tp_is_empty!12907 () Bool)

(assert (=> start!41862 tp_is_empty!12907))

(assert (=> start!41862 tp!40447))

(assert (=> start!41862 true))

(declare-datatypes ((array!29581 0))(
  ( (array!29582 (arr!14218 (Array (_ BitVec 32) (_ BitVec 64))) (size!14571 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29581)

(declare-fun array_inv!10346 (array!29581) Bool)

(assert (=> start!41862 (array_inv!10346 _keys!1025)))

(declare-datatypes ((V!18315 0))(
  ( (V!18316 (val!6498 Int)) )
))
(declare-datatypes ((ValueCell!6110 0))(
  ( (ValueCellFull!6110 (v!8781 V!18315)) (EmptyCell!6110) )
))
(declare-datatypes ((array!29583 0))(
  ( (array!29584 (arr!14219 (Array (_ BitVec 32) ValueCell!6110)) (size!14572 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29583)

(declare-fun e!273360 () Bool)

(declare-fun array_inv!10347 (array!29583) Bool)

(assert (=> start!41862 (and (array_inv!10347 _values!833) e!273360)))

(declare-fun b!467305 () Bool)

(declare-fun e!273356 () Bool)

(assert (=> b!467305 (= e!273356 tp_is_empty!12907)))

(declare-fun b!467306 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467306 (= e!273358 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14571 _keys!1025)))))))

(declare-datatypes ((tuple2!8570 0))(
  ( (tuple2!8571 (_1!4296 (_ BitVec 64)) (_2!4296 V!18315)) )
))
(declare-datatypes ((List!8650 0))(
  ( (Nil!8647) (Cons!8646 (h!9502 tuple2!8570) (t!14595 List!8650)) )
))
(declare-datatypes ((ListLongMap!7473 0))(
  ( (ListLongMap!7474 (toList!3752 List!8650)) )
))
(declare-fun lt!211175 () ListLongMap!7473)

(declare-fun lt!211174 () ListLongMap!7473)

(assert (=> b!467306 (= lt!211175 lt!211174)))

(declare-fun minValueBefore!38 () V!18315)

(declare-fun zeroValue!794 () V!18315)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13608 0))(
  ( (Unit!13609) )
))
(declare-fun lt!211173 () Unit!13608)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18315)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!93 (array!29581 array!29583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 V!18315 V!18315 (_ BitVec 32) Int) Unit!13608)

(assert (=> b!467306 (= lt!211173 (lemmaNoChangeToArrayThenSameMapNoExtras!93 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1936 (array!29581 array!29583 (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 (_ BitVec 32) Int) ListLongMap!7473)

(assert (=> b!467306 (= lt!211174 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467306 (= lt!211175 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21049 () Bool)

(declare-fun mapRes!21049 () Bool)

(declare-fun tp!40446 () Bool)

(assert (=> mapNonEmpty!21049 (= mapRes!21049 (and tp!40446 e!273356))))

(declare-fun mapKey!21049 () (_ BitVec 32))

(declare-fun mapRest!21049 () (Array (_ BitVec 32) ValueCell!6110))

(declare-fun mapValue!21049 () ValueCell!6110)

(assert (=> mapNonEmpty!21049 (= (arr!14219 _values!833) (store mapRest!21049 mapKey!21049 mapValue!21049))))

(declare-fun mapIsEmpty!21049 () Bool)

(assert (=> mapIsEmpty!21049 mapRes!21049))

(declare-fun b!467307 () Bool)

(declare-fun res!279324 () Bool)

(assert (=> b!467307 (=> (not res!279324) (not e!273358))))

(assert (=> b!467307 (= res!279324 (and (= (size!14572 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14571 _keys!1025) (size!14572 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467308 () Bool)

(declare-fun res!279326 () Bool)

(assert (=> b!467308 (=> (not res!279326) (not e!273358))))

(declare-datatypes ((List!8651 0))(
  ( (Nil!8648) (Cons!8647 (h!9503 (_ BitVec 64)) (t!14596 List!8651)) )
))
(declare-fun arrayNoDuplicates!0 (array!29581 (_ BitVec 32) List!8651) Bool)

(assert (=> b!467308 (= res!279326 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8648))))

(declare-fun b!467309 () Bool)

(declare-fun e!273359 () Bool)

(assert (=> b!467309 (= e!273360 (and e!273359 mapRes!21049))))

(declare-fun condMapEmpty!21049 () Bool)

(declare-fun mapDefault!21049 () ValueCell!6110)

(assert (=> b!467309 (= condMapEmpty!21049 (= (arr!14219 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6110)) mapDefault!21049)))))

(declare-fun b!467310 () Bool)

(declare-fun res!279327 () Bool)

(assert (=> b!467310 (=> (not res!279327) (not e!273358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29581 (_ BitVec 32)) Bool)

(assert (=> b!467310 (= res!279327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467311 () Bool)

(assert (=> b!467311 (= e!273359 tp_is_empty!12907)))

(assert (= (and start!41862 res!279325) b!467307))

(assert (= (and b!467307 res!279324) b!467310))

(assert (= (and b!467310 res!279327) b!467308))

(assert (= (and b!467308 res!279326) b!467306))

(assert (= (and b!467309 condMapEmpty!21049) mapIsEmpty!21049))

(assert (= (and b!467309 (not condMapEmpty!21049)) mapNonEmpty!21049))

(get-info :version)

(assert (= (and mapNonEmpty!21049 ((_ is ValueCellFull!6110) mapValue!21049)) b!467305))

(assert (= (and b!467309 ((_ is ValueCellFull!6110) mapDefault!21049)) b!467311))

(assert (= start!41862 b!467309))

(declare-fun m!448975 () Bool)

(assert (=> start!41862 m!448975))

(declare-fun m!448977 () Bool)

(assert (=> start!41862 m!448977))

(declare-fun m!448979 () Bool)

(assert (=> start!41862 m!448979))

(declare-fun m!448981 () Bool)

(assert (=> b!467310 m!448981))

(declare-fun m!448983 () Bool)

(assert (=> mapNonEmpty!21049 m!448983))

(declare-fun m!448985 () Bool)

(assert (=> b!467308 m!448985))

(declare-fun m!448987 () Bool)

(assert (=> b!467306 m!448987))

(declare-fun m!448989 () Bool)

(assert (=> b!467306 m!448989))

(declare-fun m!448991 () Bool)

(assert (=> b!467306 m!448991))

(check-sat (not b!467308) (not mapNonEmpty!21049) (not b_next!11479) b_and!19833 (not b!467306) (not start!41862) tp_is_empty!12907 (not b!467310))
(check-sat b_and!19833 (not b_next!11479))
(get-model)

(declare-fun d!74999 () Bool)

(assert (=> d!74999 (= (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211196 () Unit!13608)

(declare-fun choose!1348 (array!29581 array!29583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18315 V!18315 V!18315 V!18315 (_ BitVec 32) Int) Unit!13608)

(assert (=> d!74999 (= lt!211196 (choose!1348 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!74999 (validMask!0 mask!1365)))

(assert (=> d!74999 (= (lemmaNoChangeToArrayThenSameMapNoExtras!93 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211196)))

(declare-fun bs!14776 () Bool)

(assert (= bs!14776 d!74999))

(assert (=> bs!14776 m!448991))

(assert (=> bs!14776 m!448989))

(declare-fun m!449029 () Bool)

(assert (=> bs!14776 m!449029))

(assert (=> bs!14776 m!448975))

(assert (=> b!467306 d!74999))

(declare-fun b!467378 () Bool)

(declare-fun e!273409 () Bool)

(declare-fun e!273410 () Bool)

(assert (=> b!467378 (= e!273409 e!273410)))

(assert (=> b!467378 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun res!279362 () Bool)

(declare-fun lt!211214 () ListLongMap!7473)

(declare-fun contains!2521 (ListLongMap!7473 (_ BitVec 64)) Bool)

(assert (=> b!467378 (= res!279362 (contains!2521 lt!211214 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467378 (=> (not res!279362) (not e!273410))))

(declare-fun b!467379 () Bool)

(assert (=> b!467379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> b!467379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14572 _values!833)))))

(declare-fun apply!324 (ListLongMap!7473 (_ BitVec 64)) V!18315)

(declare-fun get!6969 (ValueCell!6110 V!18315) V!18315)

(declare-fun dynLambda!920 (Int (_ BitVec 64)) V!18315)

(assert (=> b!467379 (= e!273410 (= (apply!324 lt!211214 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)) (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!75001 () Bool)

(declare-fun e!273408 () Bool)

(assert (=> d!75001 e!273408))

(declare-fun res!279363 () Bool)

(assert (=> d!75001 (=> (not res!279363) (not e!273408))))

(assert (=> d!75001 (= res!279363 (not (contains!2521 lt!211214 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!273405 () ListLongMap!7473)

(assert (=> d!75001 (= lt!211214 e!273405)))

(declare-fun c!56728 () Bool)

(assert (=> d!75001 (= c!56728 (bvsge #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> d!75001 (validMask!0 mask!1365)))

(assert (=> d!75001 (= (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211214)))

(declare-fun b!467380 () Bool)

(declare-fun e!273411 () Bool)

(assert (=> b!467380 (= e!273411 (= lt!211214 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!467381 () Bool)

(assert (=> b!467381 (= e!273409 e!273411)))

(declare-fun c!56727 () Bool)

(assert (=> b!467381 (= c!56727 (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun b!467382 () Bool)

(declare-fun e!273406 () ListLongMap!7473)

(assert (=> b!467382 (= e!273405 e!273406)))

(declare-fun c!56726 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!467382 (= c!56726 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467383 () Bool)

(declare-fun call!30292 () ListLongMap!7473)

(assert (=> b!467383 (= e!273406 call!30292)))

(declare-fun bm!30289 () Bool)

(assert (=> bm!30289 (= call!30292 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467384 () Bool)

(declare-fun e!273407 () Bool)

(assert (=> b!467384 (= e!273407 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467384 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!467385 () Bool)

(declare-fun isEmpty!575 (ListLongMap!7473) Bool)

(assert (=> b!467385 (= e!273411 (isEmpty!575 lt!211214))))

(declare-fun b!467386 () Bool)

(declare-fun res!279361 () Bool)

(assert (=> b!467386 (=> (not res!279361) (not e!273408))))

(assert (=> b!467386 (= res!279361 (not (contains!2521 lt!211214 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467387 () Bool)

(assert (=> b!467387 (= e!273405 (ListLongMap!7474 Nil!8647))))

(declare-fun b!467388 () Bool)

(assert (=> b!467388 (= e!273408 e!273409)))

(declare-fun c!56729 () Bool)

(assert (=> b!467388 (= c!56729 e!273407)))

(declare-fun res!279360 () Bool)

(assert (=> b!467388 (=> (not res!279360) (not e!273407))))

(assert (=> b!467388 (= res!279360 (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun b!467389 () Bool)

(declare-fun lt!211216 () Unit!13608)

(declare-fun lt!211213 () Unit!13608)

(assert (=> b!467389 (= lt!211216 lt!211213)))

(declare-fun lt!211217 () V!18315)

(declare-fun lt!211215 () (_ BitVec 64))

(declare-fun lt!211212 () ListLongMap!7473)

(declare-fun lt!211211 () (_ BitVec 64))

(declare-fun +!1707 (ListLongMap!7473 tuple2!8570) ListLongMap!7473)

(assert (=> b!467389 (not (contains!2521 (+!1707 lt!211212 (tuple2!8571 lt!211215 lt!211217)) lt!211211))))

(declare-fun addStillNotContains!158 (ListLongMap!7473 (_ BitVec 64) V!18315 (_ BitVec 64)) Unit!13608)

(assert (=> b!467389 (= lt!211213 (addStillNotContains!158 lt!211212 lt!211215 lt!211217 lt!211211))))

(assert (=> b!467389 (= lt!211211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!467389 (= lt!211217 (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467389 (= lt!211215 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467389 (= lt!211212 call!30292)))

(assert (=> b!467389 (= e!273406 (+!1707 call!30292 (tuple2!8571 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000) (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75001 c!56728) b!467387))

(assert (= (and d!75001 (not c!56728)) b!467382))

(assert (= (and b!467382 c!56726) b!467389))

(assert (= (and b!467382 (not c!56726)) b!467383))

(assert (= (or b!467389 b!467383) bm!30289))

(assert (= (and d!75001 res!279363) b!467386))

(assert (= (and b!467386 res!279361) b!467388))

(assert (= (and b!467388 res!279360) b!467384))

(assert (= (and b!467388 c!56729) b!467378))

(assert (= (and b!467388 (not c!56729)) b!467381))

(assert (= (and b!467378 res!279362) b!467379))

(assert (= (and b!467381 c!56727) b!467380))

(assert (= (and b!467381 (not c!56727)) b!467385))

(declare-fun b_lambda!10035 () Bool)

(assert (=> (not b_lambda!10035) (not b!467379)))

(declare-fun t!14599 () Bool)

(declare-fun tb!3905 () Bool)

(assert (=> (and start!41862 (= defaultEntry!841 defaultEntry!841) t!14599) tb!3905))

(declare-fun result!7389 () Bool)

(assert (=> tb!3905 (= result!7389 tp_is_empty!12907)))

(assert (=> b!467379 t!14599))

(declare-fun b_and!19839 () Bool)

(assert (= b_and!19833 (and (=> t!14599 result!7389) b_and!19839)))

(declare-fun b_lambda!10037 () Bool)

(assert (=> (not b_lambda!10037) (not b!467389)))

(assert (=> b!467389 t!14599))

(declare-fun b_and!19841 () Bool)

(assert (= b_and!19839 (and (=> t!14599 result!7389) b_and!19841)))

(declare-fun m!449031 () Bool)

(assert (=> b!467380 m!449031))

(declare-fun m!449033 () Bool)

(assert (=> b!467384 m!449033))

(assert (=> b!467384 m!449033))

(declare-fun m!449035 () Bool)

(assert (=> b!467384 m!449035))

(assert (=> b!467382 m!449033))

(assert (=> b!467382 m!449033))

(assert (=> b!467382 m!449035))

(declare-fun m!449037 () Bool)

(assert (=> d!75001 m!449037))

(assert (=> d!75001 m!448975))

(declare-fun m!449039 () Bool)

(assert (=> b!467379 m!449039))

(assert (=> b!467379 m!449033))

(assert (=> b!467379 m!449039))

(declare-fun m!449041 () Bool)

(assert (=> b!467379 m!449041))

(declare-fun m!449043 () Bool)

(assert (=> b!467379 m!449043))

(assert (=> b!467379 m!449041))

(assert (=> b!467379 m!449033))

(declare-fun m!449045 () Bool)

(assert (=> b!467379 m!449045))

(assert (=> bm!30289 m!449031))

(declare-fun m!449047 () Bool)

(assert (=> b!467386 m!449047))

(declare-fun m!449049 () Bool)

(assert (=> b!467389 m!449049))

(assert (=> b!467389 m!449039))

(assert (=> b!467389 m!449033))

(declare-fun m!449051 () Bool)

(assert (=> b!467389 m!449051))

(declare-fun m!449053 () Bool)

(assert (=> b!467389 m!449053))

(assert (=> b!467389 m!449053))

(declare-fun m!449055 () Bool)

(assert (=> b!467389 m!449055))

(assert (=> b!467389 m!449041))

(assert (=> b!467389 m!449039))

(assert (=> b!467389 m!449041))

(assert (=> b!467389 m!449043))

(declare-fun m!449057 () Bool)

(assert (=> b!467385 m!449057))

(assert (=> b!467378 m!449033))

(assert (=> b!467378 m!449033))

(declare-fun m!449059 () Bool)

(assert (=> b!467378 m!449059))

(assert (=> b!467306 d!75001))

(declare-fun b!467392 () Bool)

(declare-fun e!273416 () Bool)

(declare-fun e!273417 () Bool)

(assert (=> b!467392 (= e!273416 e!273417)))

(assert (=> b!467392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun res!279366 () Bool)

(declare-fun lt!211221 () ListLongMap!7473)

(assert (=> b!467392 (= res!279366 (contains!2521 lt!211221 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467392 (=> (not res!279366) (not e!273417))))

(declare-fun b!467393 () Bool)

(assert (=> b!467393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> b!467393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14572 _values!833)))))

(assert (=> b!467393 (= e!273417 (= (apply!324 lt!211221 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)) (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!75003 () Bool)

(declare-fun e!273415 () Bool)

(assert (=> d!75003 e!273415))

(declare-fun res!279367 () Bool)

(assert (=> d!75003 (=> (not res!279367) (not e!273415))))

(assert (=> d!75003 (= res!279367 (not (contains!2521 lt!211221 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!273412 () ListLongMap!7473)

(assert (=> d!75003 (= lt!211221 e!273412)))

(declare-fun c!56732 () Bool)

(assert (=> d!75003 (= c!56732 (bvsge #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> d!75003 (validMask!0 mask!1365)))

(assert (=> d!75003 (= (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211221)))

(declare-fun b!467394 () Bool)

(declare-fun e!273418 () Bool)

(assert (=> b!467394 (= e!273418 (= lt!211221 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!467395 () Bool)

(assert (=> b!467395 (= e!273416 e!273418)))

(declare-fun c!56731 () Bool)

(assert (=> b!467395 (= c!56731 (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun b!467396 () Bool)

(declare-fun e!273413 () ListLongMap!7473)

(assert (=> b!467396 (= e!273412 e!273413)))

(declare-fun c!56730 () Bool)

(assert (=> b!467396 (= c!56730 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467397 () Bool)

(declare-fun call!30293 () ListLongMap!7473)

(assert (=> b!467397 (= e!273413 call!30293)))

(declare-fun bm!30290 () Bool)

(assert (=> bm!30290 (= call!30293 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!467398 () Bool)

(declare-fun e!273414 () Bool)

(assert (=> b!467398 (= e!273414 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!467398 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!467399 () Bool)

(assert (=> b!467399 (= e!273418 (isEmpty!575 lt!211221))))

(declare-fun b!467400 () Bool)

(declare-fun res!279365 () Bool)

(assert (=> b!467400 (=> (not res!279365) (not e!273415))))

(assert (=> b!467400 (= res!279365 (not (contains!2521 lt!211221 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!467401 () Bool)

(assert (=> b!467401 (= e!273412 (ListLongMap!7474 Nil!8647))))

(declare-fun b!467402 () Bool)

(assert (=> b!467402 (= e!273415 e!273416)))

(declare-fun c!56733 () Bool)

(assert (=> b!467402 (= c!56733 e!273414)))

(declare-fun res!279364 () Bool)

(assert (=> b!467402 (=> (not res!279364) (not e!273414))))

(assert (=> b!467402 (= res!279364 (bvslt #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(declare-fun b!467403 () Bool)

(declare-fun lt!211223 () Unit!13608)

(declare-fun lt!211220 () Unit!13608)

(assert (=> b!467403 (= lt!211223 lt!211220)))

(declare-fun lt!211224 () V!18315)

(declare-fun lt!211218 () (_ BitVec 64))

(declare-fun lt!211219 () ListLongMap!7473)

(declare-fun lt!211222 () (_ BitVec 64))

(assert (=> b!467403 (not (contains!2521 (+!1707 lt!211219 (tuple2!8571 lt!211222 lt!211224)) lt!211218))))

(assert (=> b!467403 (= lt!211220 (addStillNotContains!158 lt!211219 lt!211222 lt!211224 lt!211218))))

(assert (=> b!467403 (= lt!211218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!467403 (= lt!211224 (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!467403 (= lt!211222 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!467403 (= lt!211219 call!30293)))

(assert (=> b!467403 (= e!273413 (+!1707 call!30293 (tuple2!8571 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000) (get!6969 (select (arr!14219 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!75003 c!56732) b!467401))

(assert (= (and d!75003 (not c!56732)) b!467396))

(assert (= (and b!467396 c!56730) b!467403))

(assert (= (and b!467396 (not c!56730)) b!467397))

(assert (= (or b!467403 b!467397) bm!30290))

(assert (= (and d!75003 res!279367) b!467400))

(assert (= (and b!467400 res!279365) b!467402))

(assert (= (and b!467402 res!279364) b!467398))

(assert (= (and b!467402 c!56733) b!467392))

(assert (= (and b!467402 (not c!56733)) b!467395))

(assert (= (and b!467392 res!279366) b!467393))

(assert (= (and b!467395 c!56731) b!467394))

(assert (= (and b!467395 (not c!56731)) b!467399))

(declare-fun b_lambda!10039 () Bool)

(assert (=> (not b_lambda!10039) (not b!467393)))

(assert (=> b!467393 t!14599))

(declare-fun b_and!19843 () Bool)

(assert (= b_and!19841 (and (=> t!14599 result!7389) b_and!19843)))

(declare-fun b_lambda!10041 () Bool)

(assert (=> (not b_lambda!10041) (not b!467403)))

(assert (=> b!467403 t!14599))

(declare-fun b_and!19845 () Bool)

(assert (= b_and!19843 (and (=> t!14599 result!7389) b_and!19845)))

(declare-fun m!449061 () Bool)

(assert (=> b!467394 m!449061))

(assert (=> b!467398 m!449033))

(assert (=> b!467398 m!449033))

(assert (=> b!467398 m!449035))

(assert (=> b!467396 m!449033))

(assert (=> b!467396 m!449033))

(assert (=> b!467396 m!449035))

(declare-fun m!449063 () Bool)

(assert (=> d!75003 m!449063))

(assert (=> d!75003 m!448975))

(assert (=> b!467393 m!449039))

(assert (=> b!467393 m!449033))

(assert (=> b!467393 m!449039))

(assert (=> b!467393 m!449041))

(assert (=> b!467393 m!449043))

(assert (=> b!467393 m!449041))

(assert (=> b!467393 m!449033))

(declare-fun m!449065 () Bool)

(assert (=> b!467393 m!449065))

(assert (=> bm!30290 m!449061))

(declare-fun m!449067 () Bool)

(assert (=> b!467400 m!449067))

(declare-fun m!449069 () Bool)

(assert (=> b!467403 m!449069))

(assert (=> b!467403 m!449039))

(assert (=> b!467403 m!449033))

(declare-fun m!449071 () Bool)

(assert (=> b!467403 m!449071))

(declare-fun m!449073 () Bool)

(assert (=> b!467403 m!449073))

(assert (=> b!467403 m!449073))

(declare-fun m!449075 () Bool)

(assert (=> b!467403 m!449075))

(assert (=> b!467403 m!449041))

(assert (=> b!467403 m!449039))

(assert (=> b!467403 m!449041))

(assert (=> b!467403 m!449043))

(declare-fun m!449077 () Bool)

(assert (=> b!467399 m!449077))

(assert (=> b!467392 m!449033))

(assert (=> b!467392 m!449033))

(declare-fun m!449079 () Bool)

(assert (=> b!467392 m!449079))

(assert (=> b!467306 d!75003))

(declare-fun b!467414 () Bool)

(declare-fun e!273428 () Bool)

(declare-fun contains!2522 (List!8651 (_ BitVec 64)) Bool)

(assert (=> b!467414 (= e!273428 (contains!2522 Nil!8648 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!467415 () Bool)

(declare-fun e!273427 () Bool)

(declare-fun e!273430 () Bool)

(assert (=> b!467415 (= e!273427 e!273430)))

(declare-fun c!56736 () Bool)

(assert (=> b!467415 (= c!56736 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30293 () Bool)

(declare-fun call!30296 () Bool)

(assert (=> bm!30293 (= call!30296 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56736 (Cons!8647 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000) Nil!8648) Nil!8648)))))

(declare-fun b!467416 () Bool)

(assert (=> b!467416 (= e!273430 call!30296)))

(declare-fun d!75005 () Bool)

(declare-fun res!279376 () Bool)

(declare-fun e!273429 () Bool)

(assert (=> d!75005 (=> res!279376 e!273429)))

(assert (=> d!75005 (= res!279376 (bvsge #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> d!75005 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8648) e!273429)))

(declare-fun b!467417 () Bool)

(assert (=> b!467417 (= e!273430 call!30296)))

(declare-fun b!467418 () Bool)

(assert (=> b!467418 (= e!273429 e!273427)))

(declare-fun res!279375 () Bool)

(assert (=> b!467418 (=> (not res!279375) (not e!273427))))

(assert (=> b!467418 (= res!279375 (not e!273428))))

(declare-fun res!279374 () Bool)

(assert (=> b!467418 (=> (not res!279374) (not e!273428))))

(assert (=> b!467418 (= res!279374 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75005 (not res!279376)) b!467418))

(assert (= (and b!467418 res!279374) b!467414))

(assert (= (and b!467418 res!279375) b!467415))

(assert (= (and b!467415 c!56736) b!467417))

(assert (= (and b!467415 (not c!56736)) b!467416))

(assert (= (or b!467417 b!467416) bm!30293))

(assert (=> b!467414 m!449033))

(assert (=> b!467414 m!449033))

(declare-fun m!449081 () Bool)

(assert (=> b!467414 m!449081))

(assert (=> b!467415 m!449033))

(assert (=> b!467415 m!449033))

(assert (=> b!467415 m!449035))

(assert (=> bm!30293 m!449033))

(declare-fun m!449083 () Bool)

(assert (=> bm!30293 m!449083))

(assert (=> b!467418 m!449033))

(assert (=> b!467418 m!449033))

(assert (=> b!467418 m!449035))

(assert (=> b!467308 d!75005))

(declare-fun d!75007 () Bool)

(assert (=> d!75007 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41862 d!75007))

(declare-fun d!75009 () Bool)

(assert (=> d!75009 (= (array_inv!10346 _keys!1025) (bvsge (size!14571 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41862 d!75009))

(declare-fun d!75011 () Bool)

(assert (=> d!75011 (= (array_inv!10347 _values!833) (bvsge (size!14572 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41862 d!75011))

(declare-fun b!467427 () Bool)

(declare-fun e!273438 () Bool)

(declare-fun e!273439 () Bool)

(assert (=> b!467427 (= e!273438 e!273439)))

(declare-fun lt!211232 () (_ BitVec 64))

(assert (=> b!467427 (= lt!211232 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211231 () Unit!13608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29581 (_ BitVec 64) (_ BitVec 32)) Unit!13608)

(assert (=> b!467427 (= lt!211231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211232 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!467427 (arrayContainsKey!0 _keys!1025 lt!211232 #b00000000000000000000000000000000)))

(declare-fun lt!211233 () Unit!13608)

(assert (=> b!467427 (= lt!211233 lt!211231)))

(declare-fun res!279382 () Bool)

(declare-datatypes ((SeekEntryResult!3543 0))(
  ( (MissingZero!3543 (index!16351 (_ BitVec 32))) (Found!3543 (index!16352 (_ BitVec 32))) (Intermediate!3543 (undefined!4355 Bool) (index!16353 (_ BitVec 32)) (x!43742 (_ BitVec 32))) (Undefined!3543) (MissingVacant!3543 (index!16354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29581 (_ BitVec 32)) SeekEntryResult!3543)

(assert (=> b!467427 (= res!279382 (= (seekEntryOrOpen!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3543 #b00000000000000000000000000000000)))))

(assert (=> b!467427 (=> (not res!279382) (not e!273439))))

(declare-fun b!467428 () Bool)

(declare-fun call!30299 () Bool)

(assert (=> b!467428 (= e!273438 call!30299)))

(declare-fun b!467429 () Bool)

(assert (=> b!467429 (= e!273439 call!30299)))

(declare-fun b!467430 () Bool)

(declare-fun e!273437 () Bool)

(assert (=> b!467430 (= e!273437 e!273438)))

(declare-fun c!56739 () Bool)

(assert (=> b!467430 (= c!56739 (validKeyInArray!0 (select (arr!14218 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75013 () Bool)

(declare-fun res!279381 () Bool)

(assert (=> d!75013 (=> res!279381 e!273437)))

(assert (=> d!75013 (= res!279381 (bvsge #b00000000000000000000000000000000 (size!14571 _keys!1025)))))

(assert (=> d!75013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!273437)))

(declare-fun bm!30296 () Bool)

(assert (=> bm!30296 (= call!30299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75013 (not res!279381)) b!467430))

(assert (= (and b!467430 c!56739) b!467427))

(assert (= (and b!467430 (not c!56739)) b!467428))

(assert (= (and b!467427 res!279382) b!467429))

(assert (= (or b!467429 b!467428) bm!30296))

(assert (=> b!467427 m!449033))

(declare-fun m!449085 () Bool)

(assert (=> b!467427 m!449085))

(declare-fun m!449087 () Bool)

(assert (=> b!467427 m!449087))

(assert (=> b!467427 m!449033))

(declare-fun m!449089 () Bool)

(assert (=> b!467427 m!449089))

(assert (=> b!467430 m!449033))

(assert (=> b!467430 m!449033))

(assert (=> b!467430 m!449035))

(declare-fun m!449091 () Bool)

(assert (=> bm!30296 m!449091))

(assert (=> b!467310 d!75013))

(declare-fun condMapEmpty!21058 () Bool)

(declare-fun mapDefault!21058 () ValueCell!6110)

(assert (=> mapNonEmpty!21049 (= condMapEmpty!21058 (= mapRest!21049 ((as const (Array (_ BitVec 32) ValueCell!6110)) mapDefault!21058)))))

(declare-fun e!273445 () Bool)

(declare-fun mapRes!21058 () Bool)

(assert (=> mapNonEmpty!21049 (= tp!40446 (and e!273445 mapRes!21058))))

(declare-fun mapIsEmpty!21058 () Bool)

(assert (=> mapIsEmpty!21058 mapRes!21058))

(declare-fun b!467438 () Bool)

(assert (=> b!467438 (= e!273445 tp_is_empty!12907)))

(declare-fun b!467437 () Bool)

(declare-fun e!273444 () Bool)

(assert (=> b!467437 (= e!273444 tp_is_empty!12907)))

(declare-fun mapNonEmpty!21058 () Bool)

(declare-fun tp!40462 () Bool)

(assert (=> mapNonEmpty!21058 (= mapRes!21058 (and tp!40462 e!273444))))

(declare-fun mapValue!21058 () ValueCell!6110)

(declare-fun mapKey!21058 () (_ BitVec 32))

(declare-fun mapRest!21058 () (Array (_ BitVec 32) ValueCell!6110))

(assert (=> mapNonEmpty!21058 (= mapRest!21049 (store mapRest!21058 mapKey!21058 mapValue!21058))))

(assert (= (and mapNonEmpty!21049 condMapEmpty!21058) mapIsEmpty!21058))

(assert (= (and mapNonEmpty!21049 (not condMapEmpty!21058)) mapNonEmpty!21058))

(assert (= (and mapNonEmpty!21058 ((_ is ValueCellFull!6110) mapValue!21058)) b!467437))

(assert (= (and mapNonEmpty!21049 ((_ is ValueCellFull!6110) mapDefault!21058)) b!467438))

(declare-fun m!449093 () Bool)

(assert (=> mapNonEmpty!21058 m!449093))

(declare-fun b_lambda!10043 () Bool)

(assert (= b_lambda!10037 (or (and start!41862 b_free!11479) b_lambda!10043)))

(declare-fun b_lambda!10045 () Bool)

(assert (= b_lambda!10039 (or (and start!41862 b_free!11479) b_lambda!10045)))

(declare-fun b_lambda!10047 () Bool)

(assert (= b_lambda!10041 (or (and start!41862 b_free!11479) b_lambda!10047)))

(declare-fun b_lambda!10049 () Bool)

(assert (= b_lambda!10035 (or (and start!41862 b_free!11479) b_lambda!10049)))

(check-sat (not b!467414) (not b!467384) (not b!467415) (not b!467378) (not bm!30293) (not b!467394) (not b_next!11479) (not b!467403) (not b!467400) (not b!467382) b_and!19845 (not mapNonEmpty!21058) (not b_lambda!10043) (not b_lambda!10047) (not b!467399) (not d!74999) (not bm!30289) (not b!467398) (not b!467380) (not b!467396) (not b!467386) (not b!467389) (not b!467427) (not b!467392) (not b!467393) (not b_lambda!10045) (not d!75003) (not b!467385) (not bm!30296) (not bm!30290) (not b_lambda!10049) (not b!467379) tp_is_empty!12907 (not b!467418) (not d!75001) (not b!467430))
(check-sat b_and!19845 (not b_next!11479))
