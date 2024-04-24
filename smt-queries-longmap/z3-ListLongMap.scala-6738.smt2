; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84584 () Bool)

(assert start!84584)

(declare-fun b_free!19987 () Bool)

(declare-fun b_next!19987 () Bool)

(assert (=> start!84584 (= b_free!19987 (not b_next!19987))))

(declare-fun tp!69740 () Bool)

(declare-fun b_and!32047 () Bool)

(assert (=> start!84584 (= tp!69740 b_and!32047)))

(declare-fun b!988309 () Bool)

(declare-fun e!557368 () Bool)

(declare-datatypes ((array!62408 0))(
  ( (array!62409 (arr!30056 (Array (_ BitVec 32) (_ BitVec 64))) (size!30536 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62408)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988309 (= e!557368 (not (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30056 _keys!1544) from!1932)))))))

(declare-datatypes ((V!35921 0))(
  ( (V!35922 (val!11652 Int)) )
))
(declare-datatypes ((tuple2!14862 0))(
  ( (tuple2!14863 (_1!7442 (_ BitVec 64)) (_2!7442 V!35921)) )
))
(declare-datatypes ((List!20770 0))(
  ( (Nil!20767) (Cons!20766 (h!21934 tuple2!14862) (t!29677 List!20770)) )
))
(declare-datatypes ((ListLongMap!13561 0))(
  ( (ListLongMap!13562 (toList!6796 List!20770)) )
))
(declare-fun lt!438086 () ListLongMap!13561)

(declare-fun lt!438084 () tuple2!14862)

(declare-fun lt!438083 () tuple2!14862)

(declare-fun +!3095 (ListLongMap!13561 tuple2!14862) ListLongMap!13561)

(assert (=> b!988309 (= (+!3095 (+!3095 lt!438086 lt!438084) lt!438083) (+!3095 (+!3095 lt!438086 lt!438083) lt!438084))))

(declare-fun lt!438087 () V!35921)

(assert (=> b!988309 (= lt!438083 (tuple2!14863 (select (arr!30056 _keys!1544) from!1932) lt!438087))))

(declare-fun minValue!1220 () V!35921)

(assert (=> b!988309 (= lt!438084 (tuple2!14863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32764 0))(
  ( (Unit!32765) )
))
(declare-fun lt!438085 () Unit!32764)

(declare-fun addCommutativeForDiffKeys!698 (ListLongMap!13561 (_ BitVec 64) V!35921 (_ BitVec 64) V!35921) Unit!32764)

(assert (=> b!988309 (= lt!438085 (addCommutativeForDiffKeys!698 lt!438086 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30056 _keys!1544) from!1932) lt!438087))))

(declare-datatypes ((ValueCell!11120 0))(
  ( (ValueCellFull!11120 (v!14212 V!35921)) (EmptyCell!11120) )
))
(declare-datatypes ((array!62410 0))(
  ( (array!62411 (arr!30057 (Array (_ BitVec 32) ValueCell!11120)) (size!30537 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62410)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15612 (ValueCell!11120 V!35921) V!35921)

(declare-fun dynLambda!1879 (Int (_ BitVec 64)) V!35921)

(assert (=> b!988309 (= lt!438087 (get!15612 (select (arr!30057 _values!1278) from!1932) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35921)

(declare-fun getCurrentListMapNoExtraKeys!3525 (array!62408 array!62410 (_ BitVec 32) (_ BitVec 32) V!35921 V!35921 (_ BitVec 32) Int) ListLongMap!13561)

(assert (=> b!988309 (= lt!438086 (+!3095 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!36836 () Bool)

(declare-fun mapRes!36836 () Bool)

(declare-fun tp!69739 () Bool)

(declare-fun e!557370 () Bool)

(assert (=> mapNonEmpty!36836 (= mapRes!36836 (and tp!69739 e!557370))))

(declare-fun mapRest!36836 () (Array (_ BitVec 32) ValueCell!11120))

(declare-fun mapKey!36836 () (_ BitVec 32))

(declare-fun mapValue!36836 () ValueCell!11120)

(assert (=> mapNonEmpty!36836 (= (arr!30057 _values!1278) (store mapRest!36836 mapKey!36836 mapValue!36836))))

(declare-fun b!988310 () Bool)

(declare-fun res!660915 () Bool)

(assert (=> b!988310 (=> (not res!660915) (not e!557368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988310 (= res!660915 (validKeyInArray!0 (select (arr!30056 _keys!1544) from!1932)))))

(declare-fun b!988311 () Bool)

(declare-fun e!557369 () Bool)

(declare-fun tp_is_empty!23203 () Bool)

(assert (=> b!988311 (= e!557369 tp_is_empty!23203)))

(declare-fun b!988312 () Bool)

(assert (=> b!988312 (= e!557370 tp_is_empty!23203)))

(declare-fun b!988313 () Bool)

(declare-fun res!660918 () Bool)

(assert (=> b!988313 (=> (not res!660918) (not e!557368))))

(assert (=> b!988313 (= res!660918 (and (= (size!30537 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30536 _keys!1544) (size!30537 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!660913 () Bool)

(assert (=> start!84584 (=> (not res!660913) (not e!557368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84584 (= res!660913 (validMask!0 mask!1948))))

(assert (=> start!84584 e!557368))

(assert (=> start!84584 true))

(assert (=> start!84584 tp_is_empty!23203))

(declare-fun e!557366 () Bool)

(declare-fun array_inv!23245 (array!62410) Bool)

(assert (=> start!84584 (and (array_inv!23245 _values!1278) e!557366)))

(assert (=> start!84584 tp!69740))

(declare-fun array_inv!23246 (array!62408) Bool)

(assert (=> start!84584 (array_inv!23246 _keys!1544)))

(declare-fun b!988314 () Bool)

(declare-fun res!660919 () Bool)

(assert (=> b!988314 (=> (not res!660919) (not e!557368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62408 (_ BitVec 32)) Bool)

(assert (=> b!988314 (= res!660919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988315 () Bool)

(declare-fun res!660916 () Bool)

(assert (=> b!988315 (=> (not res!660916) (not e!557368))))

(assert (=> b!988315 (= res!660916 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30536 _keys!1544))))))

(declare-fun b!988316 () Bool)

(declare-fun res!660914 () Bool)

(assert (=> b!988316 (=> (not res!660914) (not e!557368))))

(assert (=> b!988316 (= res!660914 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!988317 () Bool)

(assert (=> b!988317 (= e!557366 (and e!557369 mapRes!36836))))

(declare-fun condMapEmpty!36836 () Bool)

(declare-fun mapDefault!36836 () ValueCell!11120)

(assert (=> b!988317 (= condMapEmpty!36836 (= (arr!30057 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11120)) mapDefault!36836)))))

(declare-fun mapIsEmpty!36836 () Bool)

(assert (=> mapIsEmpty!36836 mapRes!36836))

(declare-fun b!988318 () Bool)

(declare-fun res!660917 () Bool)

(assert (=> b!988318 (=> (not res!660917) (not e!557368))))

(declare-datatypes ((List!20771 0))(
  ( (Nil!20768) (Cons!20767 (h!21935 (_ BitVec 64)) (t!29678 List!20771)) )
))
(declare-fun arrayNoDuplicates!0 (array!62408 (_ BitVec 32) List!20771) Bool)

(assert (=> b!988318 (= res!660917 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20768))))

(assert (= (and start!84584 res!660913) b!988313))

(assert (= (and b!988313 res!660918) b!988314))

(assert (= (and b!988314 res!660919) b!988318))

(assert (= (and b!988318 res!660917) b!988315))

(assert (= (and b!988315 res!660916) b!988310))

(assert (= (and b!988310 res!660915) b!988316))

(assert (= (and b!988316 res!660914) b!988309))

(assert (= (and b!988317 condMapEmpty!36836) mapIsEmpty!36836))

(assert (= (and b!988317 (not condMapEmpty!36836)) mapNonEmpty!36836))

(get-info :version)

(assert (= (and mapNonEmpty!36836 ((_ is ValueCellFull!11120) mapValue!36836)) b!988312))

(assert (= (and b!988317 ((_ is ValueCellFull!11120) mapDefault!36836)) b!988311))

(assert (= start!84584 b!988317))

(declare-fun b_lambda!15023 () Bool)

(assert (=> (not b_lambda!15023) (not b!988309)))

(declare-fun t!29676 () Bool)

(declare-fun tb!6757 () Bool)

(assert (=> (and start!84584 (= defaultEntry!1281 defaultEntry!1281) t!29676) tb!6757))

(declare-fun result!13513 () Bool)

(assert (=> tb!6757 (= result!13513 tp_is_empty!23203)))

(assert (=> b!988309 t!29676))

(declare-fun b_and!32049 () Bool)

(assert (= b_and!32047 (and (=> t!29676 result!13513) b_and!32049)))

(declare-fun m!915293 () Bool)

(assert (=> b!988318 m!915293))

(declare-fun m!915295 () Bool)

(assert (=> b!988314 m!915295))

(declare-fun m!915297 () Bool)

(assert (=> b!988310 m!915297))

(assert (=> b!988310 m!915297))

(declare-fun m!915299 () Bool)

(assert (=> b!988310 m!915299))

(declare-fun m!915301 () Bool)

(assert (=> mapNonEmpty!36836 m!915301))

(declare-fun m!915303 () Bool)

(assert (=> start!84584 m!915303))

(declare-fun m!915305 () Bool)

(assert (=> start!84584 m!915305))

(declare-fun m!915307 () Bool)

(assert (=> start!84584 m!915307))

(declare-fun m!915309 () Bool)

(assert (=> b!988309 m!915309))

(declare-fun m!915311 () Bool)

(assert (=> b!988309 m!915311))

(declare-fun m!915313 () Bool)

(assert (=> b!988309 m!915313))

(assert (=> b!988309 m!915309))

(declare-fun m!915315 () Bool)

(assert (=> b!988309 m!915315))

(declare-fun m!915317 () Bool)

(assert (=> b!988309 m!915317))

(assert (=> b!988309 m!915297))

(declare-fun m!915319 () Bool)

(assert (=> b!988309 m!915319))

(assert (=> b!988309 m!915317))

(declare-fun m!915321 () Bool)

(assert (=> b!988309 m!915321))

(assert (=> b!988309 m!915297))

(assert (=> b!988309 m!915315))

(declare-fun m!915323 () Bool)

(assert (=> b!988309 m!915323))

(declare-fun m!915325 () Bool)

(assert (=> b!988309 m!915325))

(assert (=> b!988309 m!915313))

(assert (=> b!988309 m!915325))

(declare-fun m!915327 () Bool)

(assert (=> b!988309 m!915327))

(check-sat (not b!988310) (not start!84584) (not b!988314) b_and!32049 (not b_lambda!15023) (not mapNonEmpty!36836) (not b_next!19987) tp_is_empty!23203 (not b!988309) (not b!988318))
(check-sat b_and!32049 (not b_next!19987))
(get-model)

(declare-fun b_lambda!15029 () Bool)

(assert (= b_lambda!15023 (or (and start!84584 b_free!19987) b_lambda!15029)))

(check-sat (not b!988310) (not start!84584) (not b!988314) b_and!32049 (not mapNonEmpty!36836) (not b_next!19987) (not b_lambda!15029) tp_is_empty!23203 (not b!988309) (not b!988318))
(check-sat b_and!32049 (not b_next!19987))
(get-model)

(declare-fun d!117247 () Bool)

(assert (=> d!117247 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84584 d!117247))

(declare-fun d!117249 () Bool)

(assert (=> d!117249 (= (array_inv!23245 _values!1278) (bvsge (size!30537 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84584 d!117249))

(declare-fun d!117251 () Bool)

(assert (=> d!117251 (= (array_inv!23246 _keys!1544) (bvsge (size!30536 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84584 d!117251))

(declare-fun d!117253 () Bool)

(declare-fun e!557403 () Bool)

(assert (=> d!117253 e!557403))

(declare-fun res!660967 () Bool)

(assert (=> d!117253 (=> (not res!660967) (not e!557403))))

(declare-fun lt!438127 () ListLongMap!13561)

(declare-fun contains!5732 (ListLongMap!13561 (_ BitVec 64)) Bool)

(assert (=> d!117253 (= res!660967 (contains!5732 lt!438127 (_1!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438129 () List!20770)

(assert (=> d!117253 (= lt!438127 (ListLongMap!13562 lt!438129))))

(declare-fun lt!438128 () Unit!32764)

(declare-fun lt!438126 () Unit!32764)

(assert (=> d!117253 (= lt!438128 lt!438126)))

(declare-datatypes ((Option!515 0))(
  ( (Some!514 (v!14215 V!35921)) (None!513) )
))
(declare-fun getValueByKey!509 (List!20770 (_ BitVec 64)) Option!515)

(assert (=> d!117253 (= (getValueByKey!509 lt!438129 (_1!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!514 (_2!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lemmaContainsTupThenGetReturnValue!271 (List!20770 (_ BitVec 64) V!35921) Unit!32764)

(assert (=> d!117253 (= lt!438126 (lemmaContainsTupThenGetReturnValue!271 lt!438129 (_1!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun insertStrictlySorted!328 (List!20770 (_ BitVec 64) V!35921) List!20770)

(assert (=> d!117253 (= lt!438129 (insertStrictlySorted!328 (toList!6796 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117253 (= (+!3095 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438127)))

(declare-fun b!988389 () Bool)

(declare-fun res!660966 () Bool)

(assert (=> b!988389 (=> (not res!660966) (not e!557403))))

(assert (=> b!988389 (= res!660966 (= (getValueByKey!509 (toList!6796 lt!438127) (_1!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!514 (_2!7442 (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!988390 () Bool)

(declare-fun contains!5733 (List!20770 tuple2!14862) Bool)

(assert (=> b!988390 (= e!557403 (contains!5733 (toList!6796 lt!438127) (tuple2!14863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117253 res!660967) b!988389))

(assert (= (and b!988389 res!660966) b!988390))

(declare-fun m!915401 () Bool)

(assert (=> d!117253 m!915401))

(declare-fun m!915403 () Bool)

(assert (=> d!117253 m!915403))

(declare-fun m!915405 () Bool)

(assert (=> d!117253 m!915405))

(declare-fun m!915407 () Bool)

(assert (=> d!117253 m!915407))

(declare-fun m!915409 () Bool)

(assert (=> b!988389 m!915409))

(declare-fun m!915411 () Bool)

(assert (=> b!988390 m!915411))

(assert (=> b!988309 d!117253))

(declare-fun d!117255 () Bool)

(declare-fun c!100325 () Bool)

(assert (=> d!117255 (= c!100325 ((_ is ValueCellFull!11120) (select (arr!30057 _values!1278) from!1932)))))

(declare-fun e!557406 () V!35921)

(assert (=> d!117255 (= (get!15612 (select (arr!30057 _values!1278) from!1932) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557406)))

(declare-fun b!988395 () Bool)

(declare-fun get!15615 (ValueCell!11120 V!35921) V!35921)

(assert (=> b!988395 (= e!557406 (get!15615 (select (arr!30057 _values!1278) from!1932) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988396 () Bool)

(declare-fun get!15616 (ValueCell!11120 V!35921) V!35921)

(assert (=> b!988396 (= e!557406 (get!15616 (select (arr!30057 _values!1278) from!1932) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117255 c!100325) b!988395))

(assert (= (and d!117255 (not c!100325)) b!988396))

(assert (=> b!988395 m!915313))

(assert (=> b!988395 m!915325))

(declare-fun m!915413 () Bool)

(assert (=> b!988395 m!915413))

(assert (=> b!988396 m!915313))

(assert (=> b!988396 m!915325))

(declare-fun m!915415 () Bool)

(assert (=> b!988396 m!915415))

(assert (=> b!988309 d!117255))

(declare-fun d!117257 () Bool)

(declare-fun e!557407 () Bool)

(assert (=> d!117257 e!557407))

(declare-fun res!660969 () Bool)

(assert (=> d!117257 (=> (not res!660969) (not e!557407))))

(declare-fun lt!438131 () ListLongMap!13561)

(assert (=> d!117257 (= res!660969 (contains!5732 lt!438131 (_1!7442 lt!438083)))))

(declare-fun lt!438133 () List!20770)

(assert (=> d!117257 (= lt!438131 (ListLongMap!13562 lt!438133))))

(declare-fun lt!438132 () Unit!32764)

(declare-fun lt!438130 () Unit!32764)

(assert (=> d!117257 (= lt!438132 lt!438130)))

(assert (=> d!117257 (= (getValueByKey!509 lt!438133 (_1!7442 lt!438083)) (Some!514 (_2!7442 lt!438083)))))

(assert (=> d!117257 (= lt!438130 (lemmaContainsTupThenGetReturnValue!271 lt!438133 (_1!7442 lt!438083) (_2!7442 lt!438083)))))

(assert (=> d!117257 (= lt!438133 (insertStrictlySorted!328 (toList!6796 lt!438086) (_1!7442 lt!438083) (_2!7442 lt!438083)))))

(assert (=> d!117257 (= (+!3095 lt!438086 lt!438083) lt!438131)))

(declare-fun b!988397 () Bool)

(declare-fun res!660968 () Bool)

(assert (=> b!988397 (=> (not res!660968) (not e!557407))))

(assert (=> b!988397 (= res!660968 (= (getValueByKey!509 (toList!6796 lt!438131) (_1!7442 lt!438083)) (Some!514 (_2!7442 lt!438083))))))

(declare-fun b!988398 () Bool)

(assert (=> b!988398 (= e!557407 (contains!5733 (toList!6796 lt!438131) lt!438083))))

(assert (= (and d!117257 res!660969) b!988397))

(assert (= (and b!988397 res!660968) b!988398))

(declare-fun m!915417 () Bool)

(assert (=> d!117257 m!915417))

(declare-fun m!915419 () Bool)

(assert (=> d!117257 m!915419))

(declare-fun m!915421 () Bool)

(assert (=> d!117257 m!915421))

(declare-fun m!915423 () Bool)

(assert (=> d!117257 m!915423))

(declare-fun m!915425 () Bool)

(assert (=> b!988397 m!915425))

(declare-fun m!915427 () Bool)

(assert (=> b!988398 m!915427))

(assert (=> b!988309 d!117257))

(declare-fun d!117259 () Bool)

(declare-fun e!557408 () Bool)

(assert (=> d!117259 e!557408))

(declare-fun res!660971 () Bool)

(assert (=> d!117259 (=> (not res!660971) (not e!557408))))

(declare-fun lt!438135 () ListLongMap!13561)

(assert (=> d!117259 (= res!660971 (contains!5732 lt!438135 (_1!7442 lt!438084)))))

(declare-fun lt!438137 () List!20770)

(assert (=> d!117259 (= lt!438135 (ListLongMap!13562 lt!438137))))

(declare-fun lt!438136 () Unit!32764)

(declare-fun lt!438134 () Unit!32764)

(assert (=> d!117259 (= lt!438136 lt!438134)))

(assert (=> d!117259 (= (getValueByKey!509 lt!438137 (_1!7442 lt!438084)) (Some!514 (_2!7442 lt!438084)))))

(assert (=> d!117259 (= lt!438134 (lemmaContainsTupThenGetReturnValue!271 lt!438137 (_1!7442 lt!438084) (_2!7442 lt!438084)))))

(assert (=> d!117259 (= lt!438137 (insertStrictlySorted!328 (toList!6796 lt!438086) (_1!7442 lt!438084) (_2!7442 lt!438084)))))

(assert (=> d!117259 (= (+!3095 lt!438086 lt!438084) lt!438135)))

(declare-fun b!988399 () Bool)

(declare-fun res!660970 () Bool)

(assert (=> b!988399 (=> (not res!660970) (not e!557408))))

(assert (=> b!988399 (= res!660970 (= (getValueByKey!509 (toList!6796 lt!438135) (_1!7442 lt!438084)) (Some!514 (_2!7442 lt!438084))))))

(declare-fun b!988400 () Bool)

(assert (=> b!988400 (= e!557408 (contains!5733 (toList!6796 lt!438135) lt!438084))))

(assert (= (and d!117259 res!660971) b!988399))

(assert (= (and b!988399 res!660970) b!988400))

(declare-fun m!915429 () Bool)

(assert (=> d!117259 m!915429))

(declare-fun m!915431 () Bool)

(assert (=> d!117259 m!915431))

(declare-fun m!915433 () Bool)

(assert (=> d!117259 m!915433))

(declare-fun m!915435 () Bool)

(assert (=> d!117259 m!915435))

(declare-fun m!915437 () Bool)

(assert (=> b!988399 m!915437))

(declare-fun m!915439 () Bool)

(assert (=> b!988400 m!915439))

(assert (=> b!988309 d!117259))

(declare-fun d!117261 () Bool)

(declare-fun e!557409 () Bool)

(assert (=> d!117261 e!557409))

(declare-fun res!660973 () Bool)

(assert (=> d!117261 (=> (not res!660973) (not e!557409))))

(declare-fun lt!438139 () ListLongMap!13561)

(assert (=> d!117261 (= res!660973 (contains!5732 lt!438139 (_1!7442 lt!438083)))))

(declare-fun lt!438141 () List!20770)

(assert (=> d!117261 (= lt!438139 (ListLongMap!13562 lt!438141))))

(declare-fun lt!438140 () Unit!32764)

(declare-fun lt!438138 () Unit!32764)

(assert (=> d!117261 (= lt!438140 lt!438138)))

(assert (=> d!117261 (= (getValueByKey!509 lt!438141 (_1!7442 lt!438083)) (Some!514 (_2!7442 lt!438083)))))

(assert (=> d!117261 (= lt!438138 (lemmaContainsTupThenGetReturnValue!271 lt!438141 (_1!7442 lt!438083) (_2!7442 lt!438083)))))

(assert (=> d!117261 (= lt!438141 (insertStrictlySorted!328 (toList!6796 (+!3095 lt!438086 lt!438084)) (_1!7442 lt!438083) (_2!7442 lt!438083)))))

(assert (=> d!117261 (= (+!3095 (+!3095 lt!438086 lt!438084) lt!438083) lt!438139)))

(declare-fun b!988401 () Bool)

(declare-fun res!660972 () Bool)

(assert (=> b!988401 (=> (not res!660972) (not e!557409))))

(assert (=> b!988401 (= res!660972 (= (getValueByKey!509 (toList!6796 lt!438139) (_1!7442 lt!438083)) (Some!514 (_2!7442 lt!438083))))))

(declare-fun b!988402 () Bool)

(assert (=> b!988402 (= e!557409 (contains!5733 (toList!6796 lt!438139) lt!438083))))

(assert (= (and d!117261 res!660973) b!988401))

(assert (= (and b!988401 res!660972) b!988402))

(declare-fun m!915441 () Bool)

(assert (=> d!117261 m!915441))

(declare-fun m!915443 () Bool)

(assert (=> d!117261 m!915443))

(declare-fun m!915445 () Bool)

(assert (=> d!117261 m!915445))

(declare-fun m!915447 () Bool)

(assert (=> d!117261 m!915447))

(declare-fun m!915449 () Bool)

(assert (=> b!988401 m!915449))

(declare-fun m!915451 () Bool)

(assert (=> b!988402 m!915451))

(assert (=> b!988309 d!117261))

(declare-fun d!117263 () Bool)

(declare-fun e!557410 () Bool)

(assert (=> d!117263 e!557410))

(declare-fun res!660975 () Bool)

(assert (=> d!117263 (=> (not res!660975) (not e!557410))))

(declare-fun lt!438143 () ListLongMap!13561)

(assert (=> d!117263 (= res!660975 (contains!5732 lt!438143 (_1!7442 lt!438084)))))

(declare-fun lt!438145 () List!20770)

(assert (=> d!117263 (= lt!438143 (ListLongMap!13562 lt!438145))))

(declare-fun lt!438144 () Unit!32764)

(declare-fun lt!438142 () Unit!32764)

(assert (=> d!117263 (= lt!438144 lt!438142)))

(assert (=> d!117263 (= (getValueByKey!509 lt!438145 (_1!7442 lt!438084)) (Some!514 (_2!7442 lt!438084)))))

(assert (=> d!117263 (= lt!438142 (lemmaContainsTupThenGetReturnValue!271 lt!438145 (_1!7442 lt!438084) (_2!7442 lt!438084)))))

(assert (=> d!117263 (= lt!438145 (insertStrictlySorted!328 (toList!6796 (+!3095 lt!438086 lt!438083)) (_1!7442 lt!438084) (_2!7442 lt!438084)))))

(assert (=> d!117263 (= (+!3095 (+!3095 lt!438086 lt!438083) lt!438084) lt!438143)))

(declare-fun b!988403 () Bool)

(declare-fun res!660974 () Bool)

(assert (=> b!988403 (=> (not res!660974) (not e!557410))))

(assert (=> b!988403 (= res!660974 (= (getValueByKey!509 (toList!6796 lt!438143) (_1!7442 lt!438084)) (Some!514 (_2!7442 lt!438084))))))

(declare-fun b!988404 () Bool)

(assert (=> b!988404 (= e!557410 (contains!5733 (toList!6796 lt!438143) lt!438084))))

(assert (= (and d!117263 res!660975) b!988403))

(assert (= (and b!988403 res!660974) b!988404))

(declare-fun m!915453 () Bool)

(assert (=> d!117263 m!915453))

(declare-fun m!915455 () Bool)

(assert (=> d!117263 m!915455))

(declare-fun m!915457 () Bool)

(assert (=> d!117263 m!915457))

(declare-fun m!915459 () Bool)

(assert (=> d!117263 m!915459))

(declare-fun m!915461 () Bool)

(assert (=> b!988403 m!915461))

(declare-fun m!915463 () Bool)

(assert (=> b!988404 m!915463))

(assert (=> b!988309 d!117263))

(declare-fun d!117265 () Bool)

(assert (=> d!117265 (= (+!3095 (+!3095 lt!438086 (tuple2!14863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14863 (select (arr!30056 _keys!1544) from!1932) lt!438087)) (+!3095 (+!3095 lt!438086 (tuple2!14863 (select (arr!30056 _keys!1544) from!1932) lt!438087)) (tuple2!14863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!438148 () Unit!32764)

(declare-fun choose!1610 (ListLongMap!13561 (_ BitVec 64) V!35921 (_ BitVec 64) V!35921) Unit!32764)

(assert (=> d!117265 (= lt!438148 (choose!1610 lt!438086 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30056 _keys!1544) from!1932) lt!438087))))

(assert (=> d!117265 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30056 _keys!1544) from!1932)))))

(assert (=> d!117265 (= (addCommutativeForDiffKeys!698 lt!438086 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30056 _keys!1544) from!1932) lt!438087) lt!438148)))

(declare-fun bs!28034 () Bool)

(assert (= bs!28034 d!117265))

(assert (=> bs!28034 m!915297))

(declare-fun m!915465 () Bool)

(assert (=> bs!28034 m!915465))

(declare-fun m!915467 () Bool)

(assert (=> bs!28034 m!915467))

(declare-fun m!915469 () Bool)

(assert (=> bs!28034 m!915469))

(declare-fun m!915471 () Bool)

(assert (=> bs!28034 m!915471))

(assert (=> bs!28034 m!915469))

(assert (=> bs!28034 m!915467))

(declare-fun m!915473 () Bool)

(assert (=> bs!28034 m!915473))

(assert (=> b!988309 d!117265))

(declare-fun b!988429 () Bool)

(declare-fun e!557428 () ListLongMap!13561)

(assert (=> b!988429 (= e!557428 (ListLongMap!13562 Nil!20767))))

(declare-fun b!988430 () Bool)

(declare-fun e!557431 () Bool)

(assert (=> b!988430 (= e!557431 (validKeyInArray!0 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988430 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!988431 () Bool)

(declare-fun res!660984 () Bool)

(declare-fun e!557425 () Bool)

(assert (=> b!988431 (=> (not res!660984) (not e!557425))))

(declare-fun lt!438164 () ListLongMap!13561)

(assert (=> b!988431 (= res!660984 (not (contains!5732 lt!438164 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988432 () Bool)

(declare-fun lt!438167 () Unit!32764)

(declare-fun lt!438166 () Unit!32764)

(assert (=> b!988432 (= lt!438167 lt!438166)))

(declare-fun lt!438163 () (_ BitVec 64))

(declare-fun lt!438165 () V!35921)

(declare-fun lt!438168 () (_ BitVec 64))

(declare-fun lt!438169 () ListLongMap!13561)

(assert (=> b!988432 (not (contains!5732 (+!3095 lt!438169 (tuple2!14863 lt!438163 lt!438165)) lt!438168))))

(declare-fun addStillNotContains!233 (ListLongMap!13561 (_ BitVec 64) V!35921 (_ BitVec 64)) Unit!32764)

(assert (=> b!988432 (= lt!438166 (addStillNotContains!233 lt!438169 lt!438163 lt!438165 lt!438168))))

(assert (=> b!988432 (= lt!438168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988432 (= lt!438165 (get!15612 (select (arr!30057 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988432 (= lt!438163 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!41850 () ListLongMap!13561)

(assert (=> b!988432 (= lt!438169 call!41850)))

(declare-fun e!557426 () ListLongMap!13561)

(assert (=> b!988432 (= e!557426 (+!3095 call!41850 (tuple2!14863 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15612 (select (arr!30057 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988433 () Bool)

(declare-fun e!557429 () Bool)

(declare-fun isEmpty!725 (ListLongMap!13561) Bool)

(assert (=> b!988433 (= e!557429 (isEmpty!725 lt!438164))))

(declare-fun b!988434 () Bool)

(declare-fun e!557430 () Bool)

(assert (=> b!988434 (= e!557430 e!557429)))

(declare-fun c!100335 () Bool)

(assert (=> b!988434 (= c!100335 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30536 _keys!1544)))))

(declare-fun b!988435 () Bool)

(declare-fun e!557427 () Bool)

(assert (=> b!988435 (= e!557430 e!557427)))

(assert (=> b!988435 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30536 _keys!1544)))))

(declare-fun res!660987 () Bool)

(assert (=> b!988435 (= res!660987 (contains!5732 lt!438164 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988435 (=> (not res!660987) (not e!557427))))

(declare-fun b!988436 () Bool)

(assert (=> b!988436 (= e!557425 e!557430)))

(declare-fun c!100336 () Bool)

(assert (=> b!988436 (= c!100336 e!557431)))

(declare-fun res!660985 () Bool)

(assert (=> b!988436 (=> (not res!660985) (not e!557431))))

(assert (=> b!988436 (= res!660985 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30536 _keys!1544)))))

(declare-fun d!117267 () Bool)

(assert (=> d!117267 e!557425))

(declare-fun res!660986 () Bool)

(assert (=> d!117267 (=> (not res!660986) (not e!557425))))

(assert (=> d!117267 (= res!660986 (not (contains!5732 lt!438164 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117267 (= lt!438164 e!557428)))

(declare-fun c!100337 () Bool)

(assert (=> d!117267 (= c!100337 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30536 _keys!1544)))))

(assert (=> d!117267 (validMask!0 mask!1948)))

(assert (=> d!117267 (= (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438164)))

(declare-fun b!988437 () Bool)

(assert (=> b!988437 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30536 _keys!1544)))))

(assert (=> b!988437 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30537 _values!1278)))))

(declare-fun apply!901 (ListLongMap!13561 (_ BitVec 64)) V!35921)

(assert (=> b!988437 (= e!557427 (= (apply!901 lt!438164 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15612 (select (arr!30057 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1879 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988438 () Bool)

(assert (=> b!988438 (= e!557428 e!557426)))

(declare-fun c!100334 () Bool)

(assert (=> b!988438 (= c!100334 (validKeyInArray!0 (select (arr!30056 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988439 () Bool)

(assert (=> b!988439 (= e!557429 (= lt!438164 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!988440 () Bool)

(assert (=> b!988440 (= e!557426 call!41850)))

(declare-fun bm!41847 () Bool)

(assert (=> bm!41847 (= call!41850 (getCurrentListMapNoExtraKeys!3525 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117267 c!100337) b!988429))

(assert (= (and d!117267 (not c!100337)) b!988438))

(assert (= (and b!988438 c!100334) b!988432))

(assert (= (and b!988438 (not c!100334)) b!988440))

(assert (= (or b!988432 b!988440) bm!41847))

(assert (= (and d!117267 res!660986) b!988431))

(assert (= (and b!988431 res!660984) b!988436))

(assert (= (and b!988436 res!660985) b!988430))

(assert (= (and b!988436 c!100336) b!988435))

(assert (= (and b!988436 (not c!100336)) b!988434))

(assert (= (and b!988435 res!660987) b!988437))

(assert (= (and b!988434 c!100335) b!988439))

(assert (= (and b!988434 (not c!100335)) b!988433))

(declare-fun b_lambda!15031 () Bool)

(assert (=> (not b_lambda!15031) (not b!988432)))

(assert (=> b!988432 t!29676))

(declare-fun b_and!32059 () Bool)

(assert (= b_and!32049 (and (=> t!29676 result!13513) b_and!32059)))

(declare-fun b_lambda!15033 () Bool)

(assert (=> (not b_lambda!15033) (not b!988437)))

(assert (=> b!988437 t!29676))

(declare-fun b_and!32061 () Bool)

(assert (= b_and!32059 (and (=> t!29676 result!13513) b_and!32061)))

(declare-fun m!915475 () Bool)

(assert (=> b!988431 m!915475))

(declare-fun m!915477 () Bool)

(assert (=> b!988439 m!915477))

(declare-fun m!915479 () Bool)

(assert (=> d!117267 m!915479))

(assert (=> d!117267 m!915303))

(declare-fun m!915481 () Bool)

(assert (=> b!988437 m!915481))

(assert (=> b!988437 m!915325))

(declare-fun m!915483 () Bool)

(assert (=> b!988437 m!915483))

(declare-fun m!915485 () Bool)

(assert (=> b!988437 m!915485))

(assert (=> b!988437 m!915481))

(assert (=> b!988437 m!915325))

(declare-fun m!915487 () Bool)

(assert (=> b!988437 m!915487))

(assert (=> b!988437 m!915483))

(assert (=> bm!41847 m!915477))

(declare-fun m!915489 () Bool)

(assert (=> b!988433 m!915489))

(assert (=> b!988430 m!915483))

(assert (=> b!988430 m!915483))

(declare-fun m!915491 () Bool)

(assert (=> b!988430 m!915491))

(assert (=> b!988435 m!915483))

(assert (=> b!988435 m!915483))

(declare-fun m!915493 () Bool)

(assert (=> b!988435 m!915493))

(declare-fun m!915495 () Bool)

(assert (=> b!988432 m!915495))

(declare-fun m!915497 () Bool)

(assert (=> b!988432 m!915497))

(declare-fun m!915499 () Bool)

(assert (=> b!988432 m!915499))

(assert (=> b!988432 m!915481))

(assert (=> b!988432 m!915325))

(assert (=> b!988432 m!915497))

(assert (=> b!988432 m!915481))

(assert (=> b!988432 m!915325))

(assert (=> b!988432 m!915487))

(declare-fun m!915501 () Bool)

(assert (=> b!988432 m!915501))

(assert (=> b!988432 m!915483))

(assert (=> b!988438 m!915483))

(assert (=> b!988438 m!915483))

(assert (=> b!988438 m!915491))

(assert (=> b!988309 d!117267))

(declare-fun b!988451 () Bool)

(declare-fun e!557440 () Bool)

(declare-fun contains!5734 (List!20771 (_ BitVec 64)) Bool)

(assert (=> b!988451 (= e!557440 (contains!5734 Nil!20768 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117269 () Bool)

(declare-fun res!660995 () Bool)

(declare-fun e!557443 () Bool)

(assert (=> d!117269 (=> res!660995 e!557443)))

(assert (=> d!117269 (= res!660995 (bvsge #b00000000000000000000000000000000 (size!30536 _keys!1544)))))

(assert (=> d!117269 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20768) e!557443)))

(declare-fun b!988452 () Bool)

(declare-fun e!557442 () Bool)

(declare-fun call!41853 () Bool)

(assert (=> b!988452 (= e!557442 call!41853)))

(declare-fun b!988453 () Bool)

(declare-fun e!557441 () Bool)

(assert (=> b!988453 (= e!557441 e!557442)))

(declare-fun c!100340 () Bool)

(assert (=> b!988453 (= c!100340 (validKeyInArray!0 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988454 () Bool)

(assert (=> b!988454 (= e!557443 e!557441)))

(declare-fun res!660994 () Bool)

(assert (=> b!988454 (=> (not res!660994) (not e!557441))))

(assert (=> b!988454 (= res!660994 (not e!557440))))

(declare-fun res!660996 () Bool)

(assert (=> b!988454 (=> (not res!660996) (not e!557440))))

(assert (=> b!988454 (= res!660996 (validKeyInArray!0 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41850 () Bool)

(assert (=> bm!41850 (= call!41853 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100340 (Cons!20767 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000) Nil!20768) Nil!20768)))))

(declare-fun b!988455 () Bool)

(assert (=> b!988455 (= e!557442 call!41853)))

(assert (= (and d!117269 (not res!660995)) b!988454))

(assert (= (and b!988454 res!660996) b!988451))

(assert (= (and b!988454 res!660994) b!988453))

(assert (= (and b!988453 c!100340) b!988455))

(assert (= (and b!988453 (not c!100340)) b!988452))

(assert (= (or b!988455 b!988452) bm!41850))

(declare-fun m!915503 () Bool)

(assert (=> b!988451 m!915503))

(assert (=> b!988451 m!915503))

(declare-fun m!915505 () Bool)

(assert (=> b!988451 m!915505))

(assert (=> b!988453 m!915503))

(assert (=> b!988453 m!915503))

(declare-fun m!915507 () Bool)

(assert (=> b!988453 m!915507))

(assert (=> b!988454 m!915503))

(assert (=> b!988454 m!915503))

(assert (=> b!988454 m!915507))

(assert (=> bm!41850 m!915503))

(declare-fun m!915509 () Bool)

(assert (=> bm!41850 m!915509))

(assert (=> b!988318 d!117269))

(declare-fun b!988464 () Bool)

(declare-fun e!557452 () Bool)

(declare-fun e!557450 () Bool)

(assert (=> b!988464 (= e!557452 e!557450)))

(declare-fun lt!438176 () (_ BitVec 64))

(assert (=> b!988464 (= lt!438176 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438177 () Unit!32764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62408 (_ BitVec 64) (_ BitVec 32)) Unit!32764)

(assert (=> b!988464 (= lt!438177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438176 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!988464 (arrayContainsKey!0 _keys!1544 lt!438176 #b00000000000000000000000000000000)))

(declare-fun lt!438178 () Unit!32764)

(assert (=> b!988464 (= lt!438178 lt!438177)))

(declare-fun res!661002 () Bool)

(declare-datatypes ((SeekEntryResult!9162 0))(
  ( (MissingZero!9162 (index!39019 (_ BitVec 32))) (Found!9162 (index!39020 (_ BitVec 32))) (Intermediate!9162 (undefined!9974 Bool) (index!39021 (_ BitVec 32)) (x!85913 (_ BitVec 32))) (Undefined!9162) (MissingVacant!9162 (index!39022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62408 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!988464 (= res!661002 (= (seekEntryOrOpen!0 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9162 #b00000000000000000000000000000000)))))

(assert (=> b!988464 (=> (not res!661002) (not e!557450))))

(declare-fun b!988465 () Bool)

(declare-fun call!41856 () Bool)

(assert (=> b!988465 (= e!557450 call!41856)))

(declare-fun b!988466 () Bool)

(declare-fun e!557451 () Bool)

(assert (=> b!988466 (= e!557451 e!557452)))

(declare-fun c!100343 () Bool)

(assert (=> b!988466 (= c!100343 (validKeyInArray!0 (select (arr!30056 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988467 () Bool)

(assert (=> b!988467 (= e!557452 call!41856)))

(declare-fun bm!41853 () Bool)

(assert (=> bm!41853 (= call!41856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!117271 () Bool)

(declare-fun res!661001 () Bool)

(assert (=> d!117271 (=> res!661001 e!557451)))

(assert (=> d!117271 (= res!661001 (bvsge #b00000000000000000000000000000000 (size!30536 _keys!1544)))))

(assert (=> d!117271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557451)))

(assert (= (and d!117271 (not res!661001)) b!988466))

(assert (= (and b!988466 c!100343) b!988464))

(assert (= (and b!988466 (not c!100343)) b!988467))

(assert (= (and b!988464 res!661002) b!988465))

(assert (= (or b!988465 b!988467) bm!41853))

(assert (=> b!988464 m!915503))

(declare-fun m!915511 () Bool)

(assert (=> b!988464 m!915511))

(declare-fun m!915513 () Bool)

(assert (=> b!988464 m!915513))

(assert (=> b!988464 m!915503))

(declare-fun m!915515 () Bool)

(assert (=> b!988464 m!915515))

(assert (=> b!988466 m!915503))

(assert (=> b!988466 m!915503))

(assert (=> b!988466 m!915507))

(declare-fun m!915517 () Bool)

(assert (=> bm!41853 m!915517))

(assert (=> b!988314 d!117271))

(declare-fun d!117273 () Bool)

(assert (=> d!117273 (= (validKeyInArray!0 (select (arr!30056 _keys!1544) from!1932)) (and (not (= (select (arr!30056 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30056 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988310 d!117273))

(declare-fun b!988474 () Bool)

(declare-fun e!557458 () Bool)

(assert (=> b!988474 (= e!557458 tp_is_empty!23203)))

(declare-fun condMapEmpty!36845 () Bool)

(declare-fun mapDefault!36845 () ValueCell!11120)

(assert (=> mapNonEmpty!36836 (= condMapEmpty!36845 (= mapRest!36836 ((as const (Array (_ BitVec 32) ValueCell!11120)) mapDefault!36845)))))

(declare-fun e!557457 () Bool)

(declare-fun mapRes!36845 () Bool)

(assert (=> mapNonEmpty!36836 (= tp!69739 (and e!557457 mapRes!36845))))

(declare-fun mapNonEmpty!36845 () Bool)

(declare-fun tp!69755 () Bool)

(assert (=> mapNonEmpty!36845 (= mapRes!36845 (and tp!69755 e!557458))))

(declare-fun mapRest!36845 () (Array (_ BitVec 32) ValueCell!11120))

(declare-fun mapValue!36845 () ValueCell!11120)

(declare-fun mapKey!36845 () (_ BitVec 32))

(assert (=> mapNonEmpty!36845 (= mapRest!36836 (store mapRest!36845 mapKey!36845 mapValue!36845))))

(declare-fun mapIsEmpty!36845 () Bool)

(assert (=> mapIsEmpty!36845 mapRes!36845))

(declare-fun b!988475 () Bool)

(assert (=> b!988475 (= e!557457 tp_is_empty!23203)))

(assert (= (and mapNonEmpty!36836 condMapEmpty!36845) mapIsEmpty!36845))

(assert (= (and mapNonEmpty!36836 (not condMapEmpty!36845)) mapNonEmpty!36845))

(assert (= (and mapNonEmpty!36845 ((_ is ValueCellFull!11120) mapValue!36845)) b!988474))

(assert (= (and mapNonEmpty!36836 ((_ is ValueCellFull!11120) mapDefault!36845)) b!988475))

(declare-fun m!915519 () Bool)

(assert (=> mapNonEmpty!36845 m!915519))

(declare-fun b_lambda!15035 () Bool)

(assert (= b_lambda!15033 (or (and start!84584 b_free!19987) b_lambda!15035)))

(declare-fun b_lambda!15037 () Bool)

(assert (= b_lambda!15031 (or (and start!84584 b_free!19987) b_lambda!15037)))

(check-sat (not b!988402) (not b!988437) (not b!988439) (not b!988435) (not bm!41853) (not d!117257) (not b!988401) (not b!988395) tp_is_empty!23203 (not b!988390) (not bm!41847) (not b!988432) (not mapNonEmpty!36845) (not b!988438) (not b!988430) (not d!117261) (not b!988454) (not b_lambda!15037) (not b!988451) (not b!988464) (not b!988389) (not b!988398) (not d!117265) (not b_lambda!15035) (not b_next!19987) (not b!988403) (not bm!41850) b_and!32061 (not d!117253) (not b!988404) (not d!117267) (not b!988431) (not b_lambda!15029) (not d!117263) (not d!117259) (not b!988399) (not b!988466) (not b!988396) (not b!988433) (not b!988397) (not b!988453) (not b!988400))
(check-sat b_and!32061 (not b_next!19987))
