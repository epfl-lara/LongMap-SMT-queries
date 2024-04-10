; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41466 () Bool)

(assert start!41466)

(declare-fun b_free!11145 () Bool)

(declare-fun b_next!11145 () Bool)

(assert (=> start!41466 (= b_free!11145 (not b_next!11145))))

(declare-fun tp!39430 () Bool)

(declare-fun b_and!19481 () Bool)

(assert (=> start!41466 (= tp!39430 b_and!19481)))

(declare-fun b!463296 () Bool)

(declare-fun e!270489 () Bool)

(declare-fun e!270485 () Bool)

(declare-fun mapRes!20533 () Bool)

(assert (=> b!463296 (= e!270489 (and e!270485 mapRes!20533))))

(declare-fun condMapEmpty!20533 () Bool)

(declare-datatypes ((V!17869 0))(
  ( (V!17870 (val!6331 Int)) )
))
(declare-datatypes ((ValueCell!5943 0))(
  ( (ValueCellFull!5943 (v!8618 V!17869)) (EmptyCell!5943) )
))
(declare-datatypes ((array!28941 0))(
  ( (array!28942 (arr!13903 (Array (_ BitVec 32) ValueCell!5943)) (size!14255 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28941)

(declare-fun mapDefault!20533 () ValueCell!5943)

(assert (=> b!463296 (= condMapEmpty!20533 (= (arr!13903 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5943)) mapDefault!20533)))))

(declare-fun mapIsEmpty!20533 () Bool)

(assert (=> mapIsEmpty!20533 mapRes!20533))

(declare-fun b!463297 () Bool)

(declare-fun e!270488 () Bool)

(declare-datatypes ((array!28943 0))(
  ( (array!28944 (arr!13904 (Array (_ BitVec 32) (_ BitVec 64))) (size!14256 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28943)

(assert (=> b!463297 (= e!270488 (bvsgt #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(declare-fun minValueBefore!38 () V!17869)

(declare-fun zeroValue!794 () V!17869)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8292 0))(
  ( (tuple2!8293 (_1!4157 (_ BitVec 64)) (_2!4157 V!17869)) )
))
(declare-datatypes ((List!8385 0))(
  ( (Nil!8382) (Cons!8381 (h!9237 tuple2!8292) (t!14329 List!8385)) )
))
(declare-datatypes ((ListLongMap!7205 0))(
  ( (ListLongMap!7206 (toList!3618 List!8385)) )
))
(declare-fun lt!209333 () ListLongMap!7205)

(declare-fun getCurrentListMapNoExtraKeys!1798 (array!28943 array!28941 (_ BitVec 32) (_ BitVec 32) V!17869 V!17869 (_ BitVec 32) Int) ListLongMap!7205)

(assert (=> b!463297 (= lt!209333 (getCurrentListMapNoExtraKeys!1798 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463298 () Bool)

(declare-fun e!270486 () Bool)

(declare-fun tp_is_empty!12573 () Bool)

(assert (=> b!463298 (= e!270486 tp_is_empty!12573)))

(declare-fun b!463299 () Bool)

(assert (=> b!463299 (= e!270485 tp_is_empty!12573)))

(declare-fun b!463300 () Bool)

(declare-fun res!277035 () Bool)

(assert (=> b!463300 (=> (not res!277035) (not e!270488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28943 (_ BitVec 32)) Bool)

(assert (=> b!463300 (= res!277035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463301 () Bool)

(declare-fun res!277034 () Bool)

(assert (=> b!463301 (=> (not res!277034) (not e!270488))))

(declare-datatypes ((List!8386 0))(
  ( (Nil!8383) (Cons!8382 (h!9238 (_ BitVec 64)) (t!14330 List!8386)) )
))
(declare-fun arrayNoDuplicates!0 (array!28943 (_ BitVec 32) List!8386) Bool)

(assert (=> b!463301 (= res!277034 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8383))))

(declare-fun res!277036 () Bool)

(assert (=> start!41466 (=> (not res!277036) (not e!270488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41466 (= res!277036 (validMask!0 mask!1365))))

(assert (=> start!41466 e!270488))

(assert (=> start!41466 tp_is_empty!12573))

(assert (=> start!41466 tp!39430))

(assert (=> start!41466 true))

(declare-fun array_inv!10050 (array!28943) Bool)

(assert (=> start!41466 (array_inv!10050 _keys!1025)))

(declare-fun array_inv!10051 (array!28941) Bool)

(assert (=> start!41466 (and (array_inv!10051 _values!833) e!270489)))

(declare-fun mapNonEmpty!20533 () Bool)

(declare-fun tp!39429 () Bool)

(assert (=> mapNonEmpty!20533 (= mapRes!20533 (and tp!39429 e!270486))))

(declare-fun mapValue!20533 () ValueCell!5943)

(declare-fun mapKey!20533 () (_ BitVec 32))

(declare-fun mapRest!20533 () (Array (_ BitVec 32) ValueCell!5943))

(assert (=> mapNonEmpty!20533 (= (arr!13903 _values!833) (store mapRest!20533 mapKey!20533 mapValue!20533))))

(declare-fun b!463302 () Bool)

(declare-fun res!277037 () Bool)

(assert (=> b!463302 (=> (not res!277037) (not e!270488))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463302 (= res!277037 (and (= (size!14255 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14256 _keys!1025) (size!14255 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41466 res!277036) b!463302))

(assert (= (and b!463302 res!277037) b!463300))

(assert (= (and b!463300 res!277035) b!463301))

(assert (= (and b!463301 res!277034) b!463297))

(assert (= (and b!463296 condMapEmpty!20533) mapIsEmpty!20533))

(assert (= (and b!463296 (not condMapEmpty!20533)) mapNonEmpty!20533))

(get-info :version)

(assert (= (and mapNonEmpty!20533 ((_ is ValueCellFull!5943) mapValue!20533)) b!463298))

(assert (= (and b!463296 ((_ is ValueCellFull!5943) mapDefault!20533)) b!463299))

(assert (= start!41466 b!463296))

(declare-fun m!445937 () Bool)

(assert (=> mapNonEmpty!20533 m!445937))

(declare-fun m!445939 () Bool)

(assert (=> b!463300 m!445939))

(declare-fun m!445941 () Bool)

(assert (=> start!41466 m!445941))

(declare-fun m!445943 () Bool)

(assert (=> start!41466 m!445943))

(declare-fun m!445945 () Bool)

(assert (=> start!41466 m!445945))

(declare-fun m!445947 () Bool)

(assert (=> b!463297 m!445947))

(declare-fun m!445949 () Bool)

(assert (=> b!463301 m!445949))

(check-sat b_and!19481 (not b!463301) (not b_next!11145) (not b!463297) (not b!463300) tp_is_empty!12573 (not start!41466) (not mapNonEmpty!20533))
(check-sat b_and!19481 (not b_next!11145))
(get-model)

(declare-fun d!75003 () Bool)

(declare-fun e!270520 () Bool)

(assert (=> d!75003 e!270520))

(declare-fun res!277059 () Bool)

(assert (=> d!75003 (=> (not res!277059) (not e!270520))))

(declare-fun lt!209353 () ListLongMap!7205)

(declare-fun contains!2518 (ListLongMap!7205 (_ BitVec 64)) Bool)

(assert (=> d!75003 (= res!277059 (not (contains!2518 lt!209353 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!270521 () ListLongMap!7205)

(assert (=> d!75003 (= lt!209353 e!270521)))

(declare-fun c!56643 () Bool)

(assert (=> d!75003 (= c!56643 (bvsge #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(assert (=> d!75003 (validMask!0 mask!1365)))

(assert (=> d!75003 (= (getCurrentListMapNoExtraKeys!1798 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209353)))

(declare-fun b!463348 () Bool)

(assert (=> b!463348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(assert (=> b!463348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14255 _values!833)))))

(declare-fun e!270524 () Bool)

(declare-fun apply!319 (ListLongMap!7205 (_ BitVec 64)) V!17869)

(declare-fun get!6846 (ValueCell!5943 V!17869) V!17869)

(declare-fun dynLambda!912 (Int (_ BitVec 64)) V!17869)

(assert (=> b!463348 (= e!270524 (= (apply!319 lt!209353 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)) (get!6846 (select (arr!13903 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!463349 () Bool)

(declare-fun e!270525 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!463349 (= e!270525 (validKeyInArray!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463349 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!463350 () Bool)

(declare-datatypes ((Unit!13448 0))(
  ( (Unit!13449) )
))
(declare-fun lt!209357 () Unit!13448)

(declare-fun lt!209354 () Unit!13448)

(assert (=> b!463350 (= lt!209357 lt!209354)))

(declare-fun lt!209351 () V!17869)

(declare-fun lt!209356 () (_ BitVec 64))

(declare-fun lt!209352 () (_ BitVec 64))

(declare-fun lt!209355 () ListLongMap!7205)

(declare-fun +!1636 (ListLongMap!7205 tuple2!8292) ListLongMap!7205)

(assert (=> b!463350 (not (contains!2518 (+!1636 lt!209355 (tuple2!8293 lt!209352 lt!209351)) lt!209356))))

(declare-fun addStillNotContains!152 (ListLongMap!7205 (_ BitVec 64) V!17869 (_ BitVec 64)) Unit!13448)

(assert (=> b!463350 (= lt!209354 (addStillNotContains!152 lt!209355 lt!209352 lt!209351 lt!209356))))

(assert (=> b!463350 (= lt!209356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!463350 (= lt!209351 (get!6846 (select (arr!13903 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!463350 (= lt!209352 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30212 () ListLongMap!7205)

(assert (=> b!463350 (= lt!209355 call!30212)))

(declare-fun e!270522 () ListLongMap!7205)

(assert (=> b!463350 (= e!270522 (+!1636 call!30212 (tuple2!8293 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000) (get!6846 (select (arr!13903 _values!833) #b00000000000000000000000000000000) (dynLambda!912 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!463351 () Bool)

(assert (=> b!463351 (= e!270521 (ListLongMap!7206 Nil!8382))))

(declare-fun b!463352 () Bool)

(assert (=> b!463352 (= e!270521 e!270522)))

(declare-fun c!56644 () Bool)

(assert (=> b!463352 (= c!56644 (validKeyInArray!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!463353 () Bool)

(declare-fun e!270519 () Bool)

(assert (=> b!463353 (= e!270519 e!270524)))

(assert (=> b!463353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(declare-fun res!277060 () Bool)

(assert (=> b!463353 (= res!277060 (contains!2518 lt!209353 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463353 (=> (not res!277060) (not e!270524))))

(declare-fun bm!30209 () Bool)

(assert (=> bm!30209 (= call!30212 (getCurrentListMapNoExtraKeys!1798 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!463354 () Bool)

(declare-fun e!270523 () Bool)

(declare-fun isEmpty!566 (ListLongMap!7205) Bool)

(assert (=> b!463354 (= e!270523 (isEmpty!566 lt!209353))))

(declare-fun b!463355 () Bool)

(assert (=> b!463355 (= e!270522 call!30212)))

(declare-fun b!463356 () Bool)

(declare-fun res!277061 () Bool)

(assert (=> b!463356 (=> (not res!277061) (not e!270520))))

(assert (=> b!463356 (= res!277061 (not (contains!2518 lt!209353 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!463357 () Bool)

(assert (=> b!463357 (= e!270523 (= lt!209353 (getCurrentListMapNoExtraKeys!1798 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!463358 () Bool)

(assert (=> b!463358 (= e!270520 e!270519)))

(declare-fun c!56646 () Bool)

(assert (=> b!463358 (= c!56646 e!270525)))

(declare-fun res!277058 () Bool)

(assert (=> b!463358 (=> (not res!277058) (not e!270525))))

(assert (=> b!463358 (= res!277058 (bvslt #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(declare-fun b!463359 () Bool)

(assert (=> b!463359 (= e!270519 e!270523)))

(declare-fun c!56645 () Bool)

(assert (=> b!463359 (= c!56645 (bvslt #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(assert (= (and d!75003 c!56643) b!463351))

(assert (= (and d!75003 (not c!56643)) b!463352))

(assert (= (and b!463352 c!56644) b!463350))

(assert (= (and b!463352 (not c!56644)) b!463355))

(assert (= (or b!463350 b!463355) bm!30209))

(assert (= (and d!75003 res!277059) b!463356))

(assert (= (and b!463356 res!277061) b!463358))

(assert (= (and b!463358 res!277058) b!463349))

(assert (= (and b!463358 c!56646) b!463353))

(assert (= (and b!463358 (not c!56646)) b!463359))

(assert (= (and b!463353 res!277060) b!463348))

(assert (= (and b!463359 c!56645) b!463357))

(assert (= (and b!463359 (not c!56645)) b!463354))

(declare-fun b_lambda!9965 () Bool)

(assert (=> (not b_lambda!9965) (not b!463348)))

(declare-fun t!14334 () Bool)

(declare-fun tb!3903 () Bool)

(assert (=> (and start!41466 (= defaultEntry!841 defaultEntry!841) t!14334) tb!3903))

(declare-fun result!7367 () Bool)

(assert (=> tb!3903 (= result!7367 tp_is_empty!12573)))

(assert (=> b!463348 t!14334))

(declare-fun b_and!19485 () Bool)

(assert (= b_and!19481 (and (=> t!14334 result!7367) b_and!19485)))

(declare-fun b_lambda!9967 () Bool)

(assert (=> (not b_lambda!9967) (not b!463350)))

(assert (=> b!463350 t!14334))

(declare-fun b_and!19487 () Bool)

(assert (= b_and!19485 (and (=> t!14334 result!7367) b_and!19487)))

(declare-fun m!445965 () Bool)

(assert (=> b!463357 m!445965))

(declare-fun m!445967 () Bool)

(assert (=> b!463349 m!445967))

(assert (=> b!463349 m!445967))

(declare-fun m!445969 () Bool)

(assert (=> b!463349 m!445969))

(declare-fun m!445971 () Bool)

(assert (=> b!463350 m!445971))

(assert (=> b!463350 m!445967))

(declare-fun m!445973 () Bool)

(assert (=> b!463350 m!445973))

(declare-fun m!445975 () Bool)

(assert (=> b!463350 m!445975))

(declare-fun m!445977 () Bool)

(assert (=> b!463350 m!445977))

(assert (=> b!463350 m!445971))

(declare-fun m!445979 () Bool)

(assert (=> b!463350 m!445979))

(declare-fun m!445981 () Bool)

(assert (=> b!463350 m!445981))

(assert (=> b!463350 m!445979))

(assert (=> b!463350 m!445973))

(declare-fun m!445983 () Bool)

(assert (=> b!463350 m!445983))

(assert (=> b!463352 m!445967))

(assert (=> b!463352 m!445967))

(assert (=> b!463352 m!445969))

(assert (=> b!463348 m!445971))

(assert (=> b!463348 m!445967))

(assert (=> b!463348 m!445967))

(declare-fun m!445985 () Bool)

(assert (=> b!463348 m!445985))

(assert (=> b!463348 m!445971))

(assert (=> b!463348 m!445979))

(assert (=> b!463348 m!445981))

(assert (=> b!463348 m!445979))

(declare-fun m!445987 () Bool)

(assert (=> d!75003 m!445987))

(assert (=> d!75003 m!445941))

(declare-fun m!445989 () Bool)

(assert (=> b!463354 m!445989))

(assert (=> bm!30209 m!445965))

(declare-fun m!445991 () Bool)

(assert (=> b!463356 m!445991))

(assert (=> b!463353 m!445967))

(assert (=> b!463353 m!445967))

(declare-fun m!445993 () Bool)

(assert (=> b!463353 m!445993))

(assert (=> b!463297 d!75003))

(declare-fun b!463372 () Bool)

(declare-fun e!270534 () Bool)

(declare-fun call!30215 () Bool)

(assert (=> b!463372 (= e!270534 call!30215)))

(declare-fun b!463373 () Bool)

(assert (=> b!463373 (= e!270534 call!30215)))

(declare-fun b!463374 () Bool)

(declare-fun e!270536 () Bool)

(declare-fun e!270537 () Bool)

(assert (=> b!463374 (= e!270536 e!270537)))

(declare-fun res!277069 () Bool)

(assert (=> b!463374 (=> (not res!277069) (not e!270537))))

(declare-fun e!270535 () Bool)

(assert (=> b!463374 (= res!277069 (not e!270535))))

(declare-fun res!277070 () Bool)

(assert (=> b!463374 (=> (not res!277070) (not e!270535))))

(assert (=> b!463374 (= res!277070 (validKeyInArray!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75005 () Bool)

(declare-fun res!277068 () Bool)

(assert (=> d!75005 (=> res!277068 e!270536)))

(assert (=> d!75005 (= res!277068 (bvsge #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(assert (=> d!75005 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8383) e!270536)))

(declare-fun b!463375 () Bool)

(assert (=> b!463375 (= e!270537 e!270534)))

(declare-fun c!56649 () Bool)

(assert (=> b!463375 (= c!56649 (validKeyInArray!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30212 () Bool)

(assert (=> bm!30212 (= call!30215 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56649 (Cons!8382 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000) Nil!8383) Nil!8383)))))

(declare-fun b!463376 () Bool)

(declare-fun contains!2519 (List!8386 (_ BitVec 64)) Bool)

(assert (=> b!463376 (= e!270535 (contains!2519 Nil!8383 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75005 (not res!277068)) b!463374))

(assert (= (and b!463374 res!277070) b!463376))

(assert (= (and b!463374 res!277069) b!463375))

(assert (= (and b!463375 c!56649) b!463372))

(assert (= (and b!463375 (not c!56649)) b!463373))

(assert (= (or b!463372 b!463373) bm!30212))

(assert (=> b!463374 m!445967))

(assert (=> b!463374 m!445967))

(assert (=> b!463374 m!445969))

(assert (=> b!463375 m!445967))

(assert (=> b!463375 m!445967))

(assert (=> b!463375 m!445969))

(assert (=> bm!30212 m!445967))

(declare-fun m!445995 () Bool)

(assert (=> bm!30212 m!445995))

(assert (=> b!463376 m!445967))

(assert (=> b!463376 m!445967))

(declare-fun m!445997 () Bool)

(assert (=> b!463376 m!445997))

(assert (=> b!463301 d!75005))

(declare-fun b!463385 () Bool)

(declare-fun e!270544 () Bool)

(declare-fun e!270546 () Bool)

(assert (=> b!463385 (= e!270544 e!270546)))

(declare-fun c!56652 () Bool)

(assert (=> b!463385 (= c!56652 (validKeyInArray!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!463386 () Bool)

(declare-fun e!270545 () Bool)

(declare-fun call!30218 () Bool)

(assert (=> b!463386 (= e!270545 call!30218)))

(declare-fun b!463387 () Bool)

(assert (=> b!463387 (= e!270546 call!30218)))

(declare-fun b!463388 () Bool)

(assert (=> b!463388 (= e!270546 e!270545)))

(declare-fun lt!209365 () (_ BitVec 64))

(assert (=> b!463388 (= lt!209365 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209366 () Unit!13448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28943 (_ BitVec 64) (_ BitVec 32)) Unit!13448)

(assert (=> b!463388 (= lt!209366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209365 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!463388 (arrayContainsKey!0 _keys!1025 lt!209365 #b00000000000000000000000000000000)))

(declare-fun lt!209364 () Unit!13448)

(assert (=> b!463388 (= lt!209364 lt!209366)))

(declare-fun res!277076 () Bool)

(declare-datatypes ((SeekEntryResult!3543 0))(
  ( (MissingZero!3543 (index!16351 (_ BitVec 32))) (Found!3543 (index!16352 (_ BitVec 32))) (Intermediate!3543 (undefined!4355 Bool) (index!16353 (_ BitVec 32)) (x!43244 (_ BitVec 32))) (Undefined!3543) (MissingVacant!3543 (index!16354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28943 (_ BitVec 32)) SeekEntryResult!3543)

(assert (=> b!463388 (= res!277076 (= (seekEntryOrOpen!0 (select (arr!13904 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3543 #b00000000000000000000000000000000)))))

(assert (=> b!463388 (=> (not res!277076) (not e!270545))))

(declare-fun d!75007 () Bool)

(declare-fun res!277075 () Bool)

(assert (=> d!75007 (=> res!277075 e!270544)))

(assert (=> d!75007 (= res!277075 (bvsge #b00000000000000000000000000000000 (size!14256 _keys!1025)))))

(assert (=> d!75007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!270544)))

(declare-fun bm!30215 () Bool)

(assert (=> bm!30215 (= call!30218 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75007 (not res!277075)) b!463385))

(assert (= (and b!463385 c!56652) b!463388))

(assert (= (and b!463385 (not c!56652)) b!463387))

(assert (= (and b!463388 res!277076) b!463386))

(assert (= (or b!463386 b!463387) bm!30215))

(assert (=> b!463385 m!445967))

(assert (=> b!463385 m!445967))

(assert (=> b!463385 m!445969))

(assert (=> b!463388 m!445967))

(declare-fun m!445999 () Bool)

(assert (=> b!463388 m!445999))

(declare-fun m!446001 () Bool)

(assert (=> b!463388 m!446001))

(assert (=> b!463388 m!445967))

(declare-fun m!446003 () Bool)

(assert (=> b!463388 m!446003))

(declare-fun m!446005 () Bool)

(assert (=> bm!30215 m!446005))

(assert (=> b!463300 d!75007))

(declare-fun d!75009 () Bool)

(assert (=> d!75009 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41466 d!75009))

(declare-fun d!75011 () Bool)

(assert (=> d!75011 (= (array_inv!10050 _keys!1025) (bvsge (size!14256 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41466 d!75011))

(declare-fun d!75013 () Bool)

(assert (=> d!75013 (= (array_inv!10051 _values!833) (bvsge (size!14255 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41466 d!75013))

(declare-fun b!463395 () Bool)

(declare-fun e!270551 () Bool)

(assert (=> b!463395 (= e!270551 tp_is_empty!12573)))

(declare-fun condMapEmpty!20539 () Bool)

(declare-fun mapDefault!20539 () ValueCell!5943)

(assert (=> mapNonEmpty!20533 (= condMapEmpty!20539 (= mapRest!20533 ((as const (Array (_ BitVec 32) ValueCell!5943)) mapDefault!20539)))))

(declare-fun e!270552 () Bool)

(declare-fun mapRes!20539 () Bool)

(assert (=> mapNonEmpty!20533 (= tp!39429 (and e!270552 mapRes!20539))))

(declare-fun mapIsEmpty!20539 () Bool)

(assert (=> mapIsEmpty!20539 mapRes!20539))

(declare-fun b!463396 () Bool)

(assert (=> b!463396 (= e!270552 tp_is_empty!12573)))

(declare-fun mapNonEmpty!20539 () Bool)

(declare-fun tp!39439 () Bool)

(assert (=> mapNonEmpty!20539 (= mapRes!20539 (and tp!39439 e!270551))))

(declare-fun mapValue!20539 () ValueCell!5943)

(declare-fun mapRest!20539 () (Array (_ BitVec 32) ValueCell!5943))

(declare-fun mapKey!20539 () (_ BitVec 32))

(assert (=> mapNonEmpty!20539 (= mapRest!20533 (store mapRest!20539 mapKey!20539 mapValue!20539))))

(assert (= (and mapNonEmpty!20533 condMapEmpty!20539) mapIsEmpty!20539))

(assert (= (and mapNonEmpty!20533 (not condMapEmpty!20539)) mapNonEmpty!20539))

(assert (= (and mapNonEmpty!20539 ((_ is ValueCellFull!5943) mapValue!20539)) b!463395))

(assert (= (and mapNonEmpty!20533 ((_ is ValueCellFull!5943) mapDefault!20539)) b!463396))

(declare-fun m!446007 () Bool)

(assert (=> mapNonEmpty!20539 m!446007))

(declare-fun b_lambda!9969 () Bool)

(assert (= b_lambda!9965 (or (and start!41466 b_free!11145) b_lambda!9969)))

(declare-fun b_lambda!9971 () Bool)

(assert (= b_lambda!9967 (or (and start!41466 b_free!11145) b_lambda!9971)))

(check-sat (not b_lambda!9969) (not b!463348) (not b!463356) (not b!463354) (not bm!30215) (not b_lambda!9971) b_and!19487 (not b!463353) (not b!463374) (not b!463375) (not bm!30209) (not b!463350) (not b!463357) (not b!463376) (not b!463385) (not b!463352) (not b_next!11145) tp_is_empty!12573 (not b!463349) (not d!75003) (not mapNonEmpty!20539) (not b!463388) (not bm!30212))
(check-sat b_and!19487 (not b_next!11145))
