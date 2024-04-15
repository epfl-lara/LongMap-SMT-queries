; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41582 () Bool)

(assert start!41582)

(declare-fun b_free!11263 () Bool)

(declare-fun b_next!11263 () Bool)

(assert (=> start!41582 (= b_free!11263 (not b_next!11263))))

(declare-fun tp!39787 () Bool)

(declare-fun b_and!19577 () Bool)

(assert (=> start!41582 (= tp!39787 b_and!19577)))

(declare-fun mapIsEmpty!20713 () Bool)

(declare-fun mapRes!20713 () Bool)

(assert (=> mapIsEmpty!20713 mapRes!20713))

(declare-fun b!464337 () Bool)

(declare-fun e!271245 () Bool)

(declare-fun tp_is_empty!12691 () Bool)

(assert (=> b!464337 (= e!271245 tp_is_empty!12691)))

(declare-fun res!277642 () Bool)

(declare-fun e!271244 () Bool)

(assert (=> start!41582 (=> (not res!277642) (not e!271244))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41582 (= res!277642 (validMask!0 mask!1365))))

(assert (=> start!41582 e!271244))

(assert (=> start!41582 tp_is_empty!12691))

(assert (=> start!41582 tp!39787))

(assert (=> start!41582 true))

(declare-datatypes ((array!29165 0))(
  ( (array!29166 (arr!14014 (Array (_ BitVec 32) (_ BitVec 64))) (size!14367 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29165)

(declare-fun array_inv!10202 (array!29165) Bool)

(assert (=> start!41582 (array_inv!10202 _keys!1025)))

(declare-datatypes ((V!18027 0))(
  ( (V!18028 (val!6390 Int)) )
))
(declare-datatypes ((ValueCell!6002 0))(
  ( (ValueCellFull!6002 (v!8671 V!18027)) (EmptyCell!6002) )
))
(declare-datatypes ((array!29167 0))(
  ( (array!29168 (arr!14015 (Array (_ BitVec 32) ValueCell!6002)) (size!14368 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29167)

(declare-fun e!271246 () Bool)

(declare-fun array_inv!10203 (array!29167) Bool)

(assert (=> start!41582 (and (array_inv!10203 _values!833) e!271246)))

(declare-fun b!464338 () Bool)

(declare-fun res!277641 () Bool)

(assert (=> b!464338 (=> (not res!277641) (not e!271244))))

(declare-datatypes ((List!8491 0))(
  ( (Nil!8488) (Cons!8487 (h!9343 (_ BitVec 64)) (t!14428 List!8491)) )
))
(declare-fun arrayNoDuplicates!0 (array!29165 (_ BitVec 32) List!8491) Bool)

(assert (=> b!464338 (= res!277641 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8488))))

(declare-fun b!464339 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464339 (= e!271244 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14367 _keys!1025)))))))

(declare-datatypes ((tuple2!8404 0))(
  ( (tuple2!8405 (_1!4213 (_ BitVec 64)) (_2!4213 V!18027)) )
))
(declare-datatypes ((List!8492 0))(
  ( (Nil!8489) (Cons!8488 (h!9344 tuple2!8404) (t!14429 List!8492)) )
))
(declare-datatypes ((ListLongMap!7307 0))(
  ( (ListLongMap!7308 (toList!3669 List!8492)) )
))
(declare-fun lt!209555 () ListLongMap!7307)

(declare-fun lt!209554 () ListLongMap!7307)

(assert (=> b!464339 (= lt!209555 lt!209554)))

(declare-fun minValueBefore!38 () V!18027)

(declare-fun zeroValue!794 () V!18027)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13454 0))(
  ( (Unit!13455) )
))
(declare-fun lt!209553 () Unit!13454)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18027)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!18 (array!29165 array!29167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 V!18027 V!18027 (_ BitVec 32) Int) Unit!13454)

(assert (=> b!464339 (= lt!209553 (lemmaNoChangeToArrayThenSameMapNoExtras!18 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1861 (array!29165 array!29167 (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 (_ BitVec 32) Int) ListLongMap!7307)

(assert (=> b!464339 (= lt!209554 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464339 (= lt!209555 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464340 () Bool)

(declare-fun res!277643 () Bool)

(assert (=> b!464340 (=> (not res!277643) (not e!271244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29165 (_ BitVec 32)) Bool)

(assert (=> b!464340 (= res!277643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464341 () Bool)

(declare-fun res!277640 () Bool)

(assert (=> b!464341 (=> (not res!277640) (not e!271244))))

(assert (=> b!464341 (= res!277640 (and (= (size!14368 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14367 _keys!1025) (size!14368 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464342 () Bool)

(declare-fun e!271248 () Bool)

(assert (=> b!464342 (= e!271248 tp_is_empty!12691)))

(declare-fun b!464343 () Bool)

(assert (=> b!464343 (= e!271246 (and e!271245 mapRes!20713))))

(declare-fun condMapEmpty!20713 () Bool)

(declare-fun mapDefault!20713 () ValueCell!6002)

(assert (=> b!464343 (= condMapEmpty!20713 (= (arr!14015 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6002)) mapDefault!20713)))))

(declare-fun mapNonEmpty!20713 () Bool)

(declare-fun tp!39786 () Bool)

(assert (=> mapNonEmpty!20713 (= mapRes!20713 (and tp!39786 e!271248))))

(declare-fun mapRest!20713 () (Array (_ BitVec 32) ValueCell!6002))

(declare-fun mapValue!20713 () ValueCell!6002)

(declare-fun mapKey!20713 () (_ BitVec 32))

(assert (=> mapNonEmpty!20713 (= (arr!14015 _values!833) (store mapRest!20713 mapKey!20713 mapValue!20713))))

(assert (= (and start!41582 res!277642) b!464341))

(assert (= (and b!464341 res!277640) b!464340))

(assert (= (and b!464340 res!277643) b!464338))

(assert (= (and b!464338 res!277641) b!464339))

(assert (= (and b!464343 condMapEmpty!20713) mapIsEmpty!20713))

(assert (= (and b!464343 (not condMapEmpty!20713)) mapNonEmpty!20713))

(get-info :version)

(assert (= (and mapNonEmpty!20713 ((_ is ValueCellFull!6002) mapValue!20713)) b!464342))

(assert (= (and b!464343 ((_ is ValueCellFull!6002) mapDefault!20713)) b!464337))

(assert (= start!41582 b!464343))

(declare-fun m!446235 () Bool)

(assert (=> b!464338 m!446235))

(declare-fun m!446237 () Bool)

(assert (=> b!464339 m!446237))

(declare-fun m!446239 () Bool)

(assert (=> b!464339 m!446239))

(declare-fun m!446241 () Bool)

(assert (=> b!464339 m!446241))

(declare-fun m!446243 () Bool)

(assert (=> b!464340 m!446243))

(declare-fun m!446245 () Bool)

(assert (=> start!41582 m!446245))

(declare-fun m!446247 () Bool)

(assert (=> start!41582 m!446247))

(declare-fun m!446249 () Bool)

(assert (=> start!41582 m!446249))

(declare-fun m!446251 () Bool)

(assert (=> mapNonEmpty!20713 m!446251))

(check-sat (not b!464338) (not b!464340) (not b!464339) b_and!19577 (not start!41582) (not mapNonEmpty!20713) tp_is_empty!12691 (not b_next!11263))
(check-sat b_and!19577 (not b_next!11263))
(get-model)

(declare-fun b!464396 () Bool)

(declare-fun e!271287 () Bool)

(declare-fun e!271288 () Bool)

(assert (=> b!464396 (= e!271287 e!271288)))

(declare-fun res!277676 () Bool)

(assert (=> b!464396 (=> (not res!277676) (not e!271288))))

(declare-fun e!271289 () Bool)

(assert (=> b!464396 (= res!277676 (not e!271289))))

(declare-fun res!277675 () Bool)

(assert (=> b!464396 (=> (not res!277675) (not e!271289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!464396 (= res!277675 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464398 () Bool)

(declare-fun contains!2511 (List!8491 (_ BitVec 64)) Bool)

(assert (=> b!464398 (= e!271289 (contains!2511 Nil!8488 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464399 () Bool)

(declare-fun e!271290 () Bool)

(declare-fun call!30196 () Bool)

(assert (=> b!464399 (= e!271290 call!30196)))

(declare-fun bm!30193 () Bool)

(declare-fun c!56584 () Bool)

(assert (=> bm!30193 (= call!30196 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56584 (Cons!8487 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000) Nil!8488) Nil!8488)))))

(declare-fun b!464400 () Bool)

(assert (=> b!464400 (= e!271288 e!271290)))

(assert (=> b!464400 (= c!56584 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74851 () Bool)

(declare-fun res!277674 () Bool)

(assert (=> d!74851 (=> res!277674 e!271287)))

(assert (=> d!74851 (= res!277674 (bvsge #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> d!74851 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8488) e!271287)))

(declare-fun b!464397 () Bool)

(assert (=> b!464397 (= e!271290 call!30196)))

(assert (= (and d!74851 (not res!277674)) b!464396))

(assert (= (and b!464396 res!277675) b!464398))

(assert (= (and b!464396 res!277676) b!464400))

(assert (= (and b!464400 c!56584) b!464399))

(assert (= (and b!464400 (not c!56584)) b!464397))

(assert (= (or b!464399 b!464397) bm!30193))

(declare-fun m!446289 () Bool)

(assert (=> b!464396 m!446289))

(assert (=> b!464396 m!446289))

(declare-fun m!446291 () Bool)

(assert (=> b!464396 m!446291))

(assert (=> b!464398 m!446289))

(assert (=> b!464398 m!446289))

(declare-fun m!446293 () Bool)

(assert (=> b!464398 m!446293))

(assert (=> bm!30193 m!446289))

(declare-fun m!446295 () Bool)

(assert (=> bm!30193 m!446295))

(assert (=> b!464400 m!446289))

(assert (=> b!464400 m!446289))

(assert (=> b!464400 m!446291))

(assert (=> b!464338 d!74851))

(declare-fun d!74853 () Bool)

(assert (=> d!74853 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41582 d!74853))

(declare-fun d!74855 () Bool)

(assert (=> d!74855 (= (array_inv!10202 _keys!1025) (bvsge (size!14367 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41582 d!74855))

(declare-fun d!74857 () Bool)

(assert (=> d!74857 (= (array_inv!10203 _values!833) (bvsge (size!14368 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41582 d!74857))

(declare-fun b!464409 () Bool)

(declare-fun e!271297 () Bool)

(declare-fun e!271299 () Bool)

(assert (=> b!464409 (= e!271297 e!271299)))

(declare-fun lt!209580 () (_ BitVec 64))

(assert (=> b!464409 (= lt!209580 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209582 () Unit!13454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29165 (_ BitVec 64) (_ BitVec 32)) Unit!13454)

(assert (=> b!464409 (= lt!209582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209580 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!464409 (arrayContainsKey!0 _keys!1025 lt!209580 #b00000000000000000000000000000000)))

(declare-fun lt!209581 () Unit!13454)

(assert (=> b!464409 (= lt!209581 lt!209582)))

(declare-fun res!277681 () Bool)

(declare-datatypes ((SeekEntryResult!3539 0))(
  ( (MissingZero!3539 (index!16335 (_ BitVec 32))) (Found!3539 (index!16336 (_ BitVec 32))) (Intermediate!3539 (undefined!4351 Bool) (index!16337 (_ BitVec 32)) (x!43406 (_ BitVec 32))) (Undefined!3539) (MissingVacant!3539 (index!16338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29165 (_ BitVec 32)) SeekEntryResult!3539)

(assert (=> b!464409 (= res!277681 (= (seekEntryOrOpen!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3539 #b00000000000000000000000000000000)))))

(assert (=> b!464409 (=> (not res!277681) (not e!271299))))

(declare-fun b!464410 () Bool)

(declare-fun e!271298 () Bool)

(assert (=> b!464410 (= e!271298 e!271297)))

(declare-fun c!56587 () Bool)

(assert (=> b!464410 (= c!56587 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464411 () Bool)

(declare-fun call!30199 () Bool)

(assert (=> b!464411 (= e!271299 call!30199)))

(declare-fun b!464412 () Bool)

(assert (=> b!464412 (= e!271297 call!30199)))

(declare-fun bm!30196 () Bool)

(assert (=> bm!30196 (= call!30199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!74859 () Bool)

(declare-fun res!277682 () Bool)

(assert (=> d!74859 (=> res!277682 e!271298)))

(assert (=> d!74859 (= res!277682 (bvsge #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> d!74859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271298)))

(assert (= (and d!74859 (not res!277682)) b!464410))

(assert (= (and b!464410 c!56587) b!464409))

(assert (= (and b!464410 (not c!56587)) b!464412))

(assert (= (and b!464409 res!277681) b!464411))

(assert (= (or b!464411 b!464412) bm!30196))

(assert (=> b!464409 m!446289))

(declare-fun m!446297 () Bool)

(assert (=> b!464409 m!446297))

(declare-fun m!446299 () Bool)

(assert (=> b!464409 m!446299))

(assert (=> b!464409 m!446289))

(declare-fun m!446301 () Bool)

(assert (=> b!464409 m!446301))

(assert (=> b!464410 m!446289))

(assert (=> b!464410 m!446289))

(assert (=> b!464410 m!446291))

(declare-fun m!446303 () Bool)

(assert (=> bm!30196 m!446303))

(assert (=> b!464340 d!74859))

(declare-fun d!74861 () Bool)

(assert (=> d!74861 (= (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209585 () Unit!13454)

(declare-fun choose!1344 (array!29165 array!29167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 V!18027 V!18027 (_ BitVec 32) Int) Unit!13454)

(assert (=> d!74861 (= lt!209585 (choose!1344 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!74861 (validMask!0 mask!1365)))

(assert (=> d!74861 (= (lemmaNoChangeToArrayThenSameMapNoExtras!18 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209585)))

(declare-fun bs!14664 () Bool)

(assert (= bs!14664 d!74861))

(assert (=> bs!14664 m!446241))

(assert (=> bs!14664 m!446239))

(declare-fun m!446305 () Bool)

(assert (=> bs!14664 m!446305))

(assert (=> bs!14664 m!446245))

(assert (=> b!464339 d!74861))

(declare-fun b!464437 () Bool)

(assert (=> b!464437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> b!464437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14368 _values!833)))))

(declare-fun lt!209600 () ListLongMap!7307)

(declare-fun e!271314 () Bool)

(declare-fun apply!320 (ListLongMap!7307 (_ BitVec 64)) V!18027)

(declare-fun get!6893 (ValueCell!6002 V!18027) V!18027)

(declare-fun dynLambda!916 (Int (_ BitVec 64)) V!18027)

(assert (=> b!464437 (= e!271314 (= (apply!320 lt!209600 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)) (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!464438 () Bool)

(declare-fun res!277694 () Bool)

(declare-fun e!271316 () Bool)

(assert (=> b!464438 (=> (not res!277694) (not e!271316))))

(declare-fun contains!2512 (ListLongMap!7307 (_ BitVec 64)) Bool)

(assert (=> b!464438 (= res!277694 (not (contains!2512 lt!209600 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464439 () Bool)

(declare-fun e!271315 () ListLongMap!7307)

(assert (=> b!464439 (= e!271315 (ListLongMap!7308 Nil!8489))))

(declare-fun b!464440 () Bool)

(declare-fun e!271320 () Bool)

(assert (=> b!464440 (= e!271316 e!271320)))

(declare-fun c!56596 () Bool)

(declare-fun e!271319 () Bool)

(assert (=> b!464440 (= c!56596 e!271319)))

(declare-fun res!277691 () Bool)

(assert (=> b!464440 (=> (not res!277691) (not e!271319))))

(assert (=> b!464440 (= res!277691 (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun b!464441 () Bool)

(declare-fun e!271317 () Bool)

(declare-fun isEmpty!571 (ListLongMap!7307) Bool)

(assert (=> b!464441 (= e!271317 (isEmpty!571 lt!209600))))

(declare-fun d!74863 () Bool)

(assert (=> d!74863 e!271316))

(declare-fun res!277692 () Bool)

(assert (=> d!74863 (=> (not res!277692) (not e!271316))))

(assert (=> d!74863 (= res!277692 (not (contains!2512 lt!209600 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74863 (= lt!209600 e!271315)))

(declare-fun c!56598 () Bool)

(assert (=> d!74863 (= c!56598 (bvsge #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> d!74863 (validMask!0 mask!1365)))

(assert (=> d!74863 (= (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209600)))

(declare-fun b!464442 () Bool)

(declare-fun lt!209603 () Unit!13454)

(declare-fun lt!209605 () Unit!13454)

(assert (=> b!464442 (= lt!209603 lt!209605)))

(declare-fun lt!209602 () (_ BitVec 64))

(declare-fun lt!209604 () V!18027)

(declare-fun lt!209606 () (_ BitVec 64))

(declare-fun lt!209601 () ListLongMap!7307)

(declare-fun +!1665 (ListLongMap!7307 tuple2!8404) ListLongMap!7307)

(assert (=> b!464442 (not (contains!2512 (+!1665 lt!209601 (tuple2!8405 lt!209602 lt!209604)) lt!209606))))

(declare-fun addStillNotContains!154 (ListLongMap!7307 (_ BitVec 64) V!18027 (_ BitVec 64)) Unit!13454)

(assert (=> b!464442 (= lt!209605 (addStillNotContains!154 lt!209601 lt!209602 lt!209604 lt!209606))))

(assert (=> b!464442 (= lt!209606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!464442 (= lt!209604 (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464442 (= lt!209602 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30202 () ListLongMap!7307)

(assert (=> b!464442 (= lt!209601 call!30202)))

(declare-fun e!271318 () ListLongMap!7307)

(assert (=> b!464442 (= e!271318 (+!1665 call!30202 (tuple2!8405 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000) (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464443 () Bool)

(assert (=> b!464443 (= e!271320 e!271314)))

(assert (=> b!464443 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun res!277693 () Bool)

(assert (=> b!464443 (= res!277693 (contains!2512 lt!209600 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464443 (=> (not res!277693) (not e!271314))))

(declare-fun b!464444 () Bool)

(assert (=> b!464444 (= e!271315 e!271318)))

(declare-fun c!56599 () Bool)

(assert (=> b!464444 (= c!56599 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464445 () Bool)

(assert (=> b!464445 (= e!271318 call!30202)))

(declare-fun b!464446 () Bool)

(assert (=> b!464446 (= e!271320 e!271317)))

(declare-fun c!56597 () Bool)

(assert (=> b!464446 (= c!56597 (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun b!464447 () Bool)

(assert (=> b!464447 (= e!271317 (= lt!209600 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30199 () Bool)

(assert (=> bm!30199 (= call!30202 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464448 () Bool)

(assert (=> b!464448 (= e!271319 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464448 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!74863 c!56598) b!464439))

(assert (= (and d!74863 (not c!56598)) b!464444))

(assert (= (and b!464444 c!56599) b!464442))

(assert (= (and b!464444 (not c!56599)) b!464445))

(assert (= (or b!464442 b!464445) bm!30199))

(assert (= (and d!74863 res!277692) b!464438))

(assert (= (and b!464438 res!277694) b!464440))

(assert (= (and b!464440 res!277691) b!464448))

(assert (= (and b!464440 c!56596) b!464443))

(assert (= (and b!464440 (not c!56596)) b!464446))

(assert (= (and b!464443 res!277693) b!464437))

(assert (= (and b!464446 c!56597) b!464447))

(assert (= (and b!464446 (not c!56597)) b!464441))

(declare-fun b_lambda!9955 () Bool)

(assert (=> (not b_lambda!9955) (not b!464437)))

(declare-fun t!14435 () Bool)

(declare-fun tb!3897 () Bool)

(assert (=> (and start!41582 (= defaultEntry!841 defaultEntry!841) t!14435) tb!3897))

(declare-fun result!7365 () Bool)

(assert (=> tb!3897 (= result!7365 tp_is_empty!12691)))

(assert (=> b!464437 t!14435))

(declare-fun b_and!19583 () Bool)

(assert (= b_and!19577 (and (=> t!14435 result!7365) b_and!19583)))

(declare-fun b_lambda!9957 () Bool)

(assert (=> (not b_lambda!9957) (not b!464442)))

(assert (=> b!464442 t!14435))

(declare-fun b_and!19585 () Bool)

(assert (= b_and!19583 (and (=> t!14435 result!7365) b_and!19585)))

(assert (=> b!464437 m!446289))

(declare-fun m!446307 () Bool)

(assert (=> b!464437 m!446307))

(assert (=> b!464437 m!446289))

(declare-fun m!446309 () Bool)

(assert (=> b!464437 m!446309))

(declare-fun m!446311 () Bool)

(assert (=> b!464437 m!446311))

(declare-fun m!446313 () Bool)

(assert (=> b!464437 m!446313))

(assert (=> b!464437 m!446309))

(assert (=> b!464437 m!446311))

(declare-fun m!446315 () Bool)

(assert (=> d!74863 m!446315))

(assert (=> d!74863 m!446245))

(declare-fun m!446317 () Bool)

(assert (=> b!464441 m!446317))

(assert (=> b!464443 m!446289))

(assert (=> b!464443 m!446289))

(declare-fun m!446319 () Bool)

(assert (=> b!464443 m!446319))

(declare-fun m!446321 () Bool)

(assert (=> b!464442 m!446321))

(assert (=> b!464442 m!446289))

(assert (=> b!464442 m!446309))

(assert (=> b!464442 m!446311))

(assert (=> b!464442 m!446313))

(assert (=> b!464442 m!446309))

(assert (=> b!464442 m!446311))

(declare-fun m!446323 () Bool)

(assert (=> b!464442 m!446323))

(declare-fun m!446325 () Bool)

(assert (=> b!464442 m!446325))

(assert (=> b!464442 m!446321))

(declare-fun m!446327 () Bool)

(assert (=> b!464442 m!446327))

(assert (=> b!464448 m!446289))

(assert (=> b!464448 m!446289))

(assert (=> b!464448 m!446291))

(declare-fun m!446329 () Bool)

(assert (=> b!464447 m!446329))

(assert (=> bm!30199 m!446329))

(declare-fun m!446331 () Bool)

(assert (=> b!464438 m!446331))

(assert (=> b!464444 m!446289))

(assert (=> b!464444 m!446289))

(assert (=> b!464444 m!446291))

(assert (=> b!464339 d!74863))

(declare-fun b!464451 () Bool)

(assert (=> b!464451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> b!464451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14368 _values!833)))))

(declare-fun lt!209607 () ListLongMap!7307)

(declare-fun e!271321 () Bool)

(assert (=> b!464451 (= e!271321 (= (apply!320 lt!209607 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)) (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!464452 () Bool)

(declare-fun res!277698 () Bool)

(declare-fun e!271323 () Bool)

(assert (=> b!464452 (=> (not res!277698) (not e!271323))))

(assert (=> b!464452 (= res!277698 (not (contains!2512 lt!209607 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464453 () Bool)

(declare-fun e!271322 () ListLongMap!7307)

(assert (=> b!464453 (= e!271322 (ListLongMap!7308 Nil!8489))))

(declare-fun b!464454 () Bool)

(declare-fun e!271327 () Bool)

(assert (=> b!464454 (= e!271323 e!271327)))

(declare-fun c!56600 () Bool)

(declare-fun e!271326 () Bool)

(assert (=> b!464454 (= c!56600 e!271326)))

(declare-fun res!277695 () Bool)

(assert (=> b!464454 (=> (not res!277695) (not e!271326))))

(assert (=> b!464454 (= res!277695 (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun b!464455 () Bool)

(declare-fun e!271324 () Bool)

(assert (=> b!464455 (= e!271324 (isEmpty!571 lt!209607))))

(declare-fun d!74865 () Bool)

(assert (=> d!74865 e!271323))

(declare-fun res!277696 () Bool)

(assert (=> d!74865 (=> (not res!277696) (not e!271323))))

(assert (=> d!74865 (= res!277696 (not (contains!2512 lt!209607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74865 (= lt!209607 e!271322)))

(declare-fun c!56602 () Bool)

(assert (=> d!74865 (= c!56602 (bvsge #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(assert (=> d!74865 (validMask!0 mask!1365)))

(assert (=> d!74865 (= (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209607)))

(declare-fun b!464456 () Bool)

(declare-fun lt!209610 () Unit!13454)

(declare-fun lt!209612 () Unit!13454)

(assert (=> b!464456 (= lt!209610 lt!209612)))

(declare-fun lt!209611 () V!18027)

(declare-fun lt!209608 () ListLongMap!7307)

(declare-fun lt!209613 () (_ BitVec 64))

(declare-fun lt!209609 () (_ BitVec 64))

(assert (=> b!464456 (not (contains!2512 (+!1665 lt!209608 (tuple2!8405 lt!209609 lt!209611)) lt!209613))))

(assert (=> b!464456 (= lt!209612 (addStillNotContains!154 lt!209608 lt!209609 lt!209611 lt!209613))))

(assert (=> b!464456 (= lt!209613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!464456 (= lt!209611 (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464456 (= lt!209609 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30203 () ListLongMap!7307)

(assert (=> b!464456 (= lt!209608 call!30203)))

(declare-fun e!271325 () ListLongMap!7307)

(assert (=> b!464456 (= e!271325 (+!1665 call!30203 (tuple2!8405 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000) (get!6893 (select (arr!14015 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464457 () Bool)

(assert (=> b!464457 (= e!271327 e!271321)))

(assert (=> b!464457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun res!277697 () Bool)

(assert (=> b!464457 (= res!277697 (contains!2512 lt!209607 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464457 (=> (not res!277697) (not e!271321))))

(declare-fun b!464458 () Bool)

(assert (=> b!464458 (= e!271322 e!271325)))

(declare-fun c!56603 () Bool)

(assert (=> b!464458 (= c!56603 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464459 () Bool)

(assert (=> b!464459 (= e!271325 call!30203)))

(declare-fun b!464460 () Bool)

(assert (=> b!464460 (= e!271327 e!271324)))

(declare-fun c!56601 () Bool)

(assert (=> b!464460 (= c!56601 (bvslt #b00000000000000000000000000000000 (size!14367 _keys!1025)))))

(declare-fun b!464461 () Bool)

(assert (=> b!464461 (= e!271324 (= lt!209607 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30200 () Bool)

(assert (=> bm!30200 (= call!30203 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464462 () Bool)

(assert (=> b!464462 (= e!271326 (validKeyInArray!0 (select (arr!14014 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464462 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!74865 c!56602) b!464453))

(assert (= (and d!74865 (not c!56602)) b!464458))

(assert (= (and b!464458 c!56603) b!464456))

(assert (= (and b!464458 (not c!56603)) b!464459))

(assert (= (or b!464456 b!464459) bm!30200))

(assert (= (and d!74865 res!277696) b!464452))

(assert (= (and b!464452 res!277698) b!464454))

(assert (= (and b!464454 res!277695) b!464462))

(assert (= (and b!464454 c!56600) b!464457))

(assert (= (and b!464454 (not c!56600)) b!464460))

(assert (= (and b!464457 res!277697) b!464451))

(assert (= (and b!464460 c!56601) b!464461))

(assert (= (and b!464460 (not c!56601)) b!464455))

(declare-fun b_lambda!9959 () Bool)

(assert (=> (not b_lambda!9959) (not b!464451)))

(assert (=> b!464451 t!14435))

(declare-fun b_and!19587 () Bool)

(assert (= b_and!19585 (and (=> t!14435 result!7365) b_and!19587)))

(declare-fun b_lambda!9961 () Bool)

(assert (=> (not b_lambda!9961) (not b!464456)))

(assert (=> b!464456 t!14435))

(declare-fun b_and!19589 () Bool)

(assert (= b_and!19587 (and (=> t!14435 result!7365) b_and!19589)))

(assert (=> b!464451 m!446289))

(declare-fun m!446333 () Bool)

(assert (=> b!464451 m!446333))

(assert (=> b!464451 m!446289))

(assert (=> b!464451 m!446309))

(assert (=> b!464451 m!446311))

(assert (=> b!464451 m!446313))

(assert (=> b!464451 m!446309))

(assert (=> b!464451 m!446311))

(declare-fun m!446335 () Bool)

(assert (=> d!74865 m!446335))

(assert (=> d!74865 m!446245))

(declare-fun m!446337 () Bool)

(assert (=> b!464455 m!446337))

(assert (=> b!464457 m!446289))

(assert (=> b!464457 m!446289))

(declare-fun m!446339 () Bool)

(assert (=> b!464457 m!446339))

(declare-fun m!446341 () Bool)

(assert (=> b!464456 m!446341))

(assert (=> b!464456 m!446289))

(assert (=> b!464456 m!446309))

(assert (=> b!464456 m!446311))

(assert (=> b!464456 m!446313))

(assert (=> b!464456 m!446309))

(assert (=> b!464456 m!446311))

(declare-fun m!446343 () Bool)

(assert (=> b!464456 m!446343))

(declare-fun m!446345 () Bool)

(assert (=> b!464456 m!446345))

(assert (=> b!464456 m!446341))

(declare-fun m!446347 () Bool)

(assert (=> b!464456 m!446347))

(assert (=> b!464462 m!446289))

(assert (=> b!464462 m!446289))

(assert (=> b!464462 m!446291))

(declare-fun m!446349 () Bool)

(assert (=> b!464461 m!446349))

(assert (=> bm!30200 m!446349))

(declare-fun m!446351 () Bool)

(assert (=> b!464452 m!446351))

(assert (=> b!464458 m!446289))

(assert (=> b!464458 m!446289))

(assert (=> b!464458 m!446291))

(assert (=> b!464339 d!74865))

(declare-fun condMapEmpty!20722 () Bool)

(declare-fun mapDefault!20722 () ValueCell!6002)

(assert (=> mapNonEmpty!20713 (= condMapEmpty!20722 (= mapRest!20713 ((as const (Array (_ BitVec 32) ValueCell!6002)) mapDefault!20722)))))

(declare-fun e!271333 () Bool)

(declare-fun mapRes!20722 () Bool)

(assert (=> mapNonEmpty!20713 (= tp!39786 (and e!271333 mapRes!20722))))

(declare-fun mapNonEmpty!20722 () Bool)

(declare-fun tp!39802 () Bool)

(declare-fun e!271332 () Bool)

(assert (=> mapNonEmpty!20722 (= mapRes!20722 (and tp!39802 e!271332))))

(declare-fun mapRest!20722 () (Array (_ BitVec 32) ValueCell!6002))

(declare-fun mapKey!20722 () (_ BitVec 32))

(declare-fun mapValue!20722 () ValueCell!6002)

(assert (=> mapNonEmpty!20722 (= mapRest!20713 (store mapRest!20722 mapKey!20722 mapValue!20722))))

(declare-fun b!464470 () Bool)

(assert (=> b!464470 (= e!271333 tp_is_empty!12691)))

(declare-fun b!464469 () Bool)

(assert (=> b!464469 (= e!271332 tp_is_empty!12691)))

(declare-fun mapIsEmpty!20722 () Bool)

(assert (=> mapIsEmpty!20722 mapRes!20722))

(assert (= (and mapNonEmpty!20713 condMapEmpty!20722) mapIsEmpty!20722))

(assert (= (and mapNonEmpty!20713 (not condMapEmpty!20722)) mapNonEmpty!20722))

(assert (= (and mapNonEmpty!20722 ((_ is ValueCellFull!6002) mapValue!20722)) b!464469))

(assert (= (and mapNonEmpty!20713 ((_ is ValueCellFull!6002) mapDefault!20722)) b!464470))

(declare-fun m!446353 () Bool)

(assert (=> mapNonEmpty!20722 m!446353))

(declare-fun b_lambda!9963 () Bool)

(assert (= b_lambda!9959 (or (and start!41582 b_free!11263) b_lambda!9963)))

(declare-fun b_lambda!9965 () Bool)

(assert (= b_lambda!9955 (or (and start!41582 b_free!11263) b_lambda!9965)))

(declare-fun b_lambda!9967 () Bool)

(assert (= b_lambda!9961 (or (and start!41582 b_free!11263) b_lambda!9967)))

(declare-fun b_lambda!9969 () Bool)

(assert (= b_lambda!9957 (or (and start!41582 b_free!11263) b_lambda!9969)))

(check-sat (not b!464443) (not b_lambda!9969) (not d!74865) (not b!464452) (not b!464461) (not b!464462) (not b!464441) (not b!464410) b_and!19589 tp_is_empty!12691 (not b!464448) (not b!464438) (not b!464456) (not b_lambda!9965) (not bm!30200) (not b!464437) (not b!464451) (not b!464455) (not b!464458) (not b!464447) (not b!464457) (not bm!30193) (not b!464409) (not bm!30196) (not b_lambda!9963) (not mapNonEmpty!20722) (not b!464400) (not b!464442) (not b!464444) (not d!74863) (not b!464398) (not b_lambda!9967) (not b!464396) (not b_next!11263) (not d!74861) (not bm!30199))
(check-sat b_and!19589 (not b_next!11263))
