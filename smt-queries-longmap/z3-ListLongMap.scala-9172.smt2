; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110260 () Bool)

(assert start!110260)

(declare-fun b_free!29307 () Bool)

(declare-fun b_next!29307 () Bool)

(assert (=> start!110260 (= b_free!29307 (not b_next!29307))))

(declare-fun tp!103086 () Bool)

(declare-fun b_and!47503 () Bool)

(assert (=> start!110260 (= tp!103086 b_and!47503)))

(declare-fun mapIsEmpty!54027 () Bool)

(declare-fun mapRes!54027 () Bool)

(assert (=> mapIsEmpty!54027 mapRes!54027))

(declare-fun b!1305236 () Bool)

(declare-fun call!64402 () Bool)

(assert (=> b!1305236 call!64402))

(declare-datatypes ((Unit!43227 0))(
  ( (Unit!43228) )
))
(declare-fun lt!584288 () Unit!43227)

(declare-fun call!64404 () Unit!43227)

(assert (=> b!1305236 (= lt!584288 call!64404)))

(declare-fun call!64399 () Bool)

(assert (=> b!1305236 (not call!64399)))

(declare-fun lt!584290 () Unit!43227)

(declare-fun call!64398 () Unit!43227)

(assert (=> b!1305236 (= lt!584290 call!64398)))

(declare-datatypes ((V!51699 0))(
  ( (V!51700 (val!17548 Int)) )
))
(declare-datatypes ((tuple2!22654 0))(
  ( (tuple2!22655 (_1!11338 (_ BitVec 64)) (_2!11338 V!51699)) )
))
(declare-datatypes ((List!29774 0))(
  ( (Nil!29771) (Cons!29770 (h!30979 tuple2!22654) (t!43376 List!29774)) )
))
(declare-datatypes ((ListLongMap!20311 0))(
  ( (ListLongMap!20312 (toList!10171 List!29774)) )
))
(declare-fun lt!584291 () ListLongMap!20311)

(declare-fun call!64401 () ListLongMap!20311)

(assert (=> b!1305236 (= lt!584291 call!64401)))

(declare-fun e!744513 () Unit!43227)

(assert (=> b!1305236 (= e!744513 lt!584288)))

(declare-fun bm!64390 () Bool)

(declare-fun call!64396 () Unit!43227)

(assert (=> bm!64390 (= call!64404 call!64396)))

(declare-fun b!1305237 () Bool)

(declare-fun e!744515 () Unit!43227)

(declare-fun lt!584299 () Unit!43227)

(assert (=> b!1305237 (= e!744515 lt!584299)))

(declare-fun lt!584289 () ListLongMap!20311)

(declare-fun call!64403 () ListLongMap!20311)

(assert (=> b!1305237 (= lt!584289 call!64403)))

(declare-fun lt!584292 () Unit!43227)

(declare-fun call!64395 () Unit!43227)

(assert (=> b!1305237 (= lt!584292 call!64395)))

(declare-fun lt!584294 () ListLongMap!20311)

(declare-fun call!64397 () ListLongMap!20311)

(assert (=> b!1305237 (= lt!584294 call!64397)))

(declare-fun call!64394 () Bool)

(assert (=> b!1305237 (not call!64394)))

(declare-fun minValue!1387 () V!51699)

(declare-fun lt!584298 () Unit!43227)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun addStillNotContains!488 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> b!1305237 (= lt!584298 (addStillNotContains!488 lt!584289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun contains!8315 (ListLongMap!20311 (_ BitVec 64)) Bool)

(declare-fun +!4491 (ListLongMap!20311 tuple2!22654) ListLongMap!20311)

(assert (=> b!1305237 (not (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584301 () Unit!43227)

(assert (=> b!1305237 (= lt!584301 call!64396)))

(assert (=> b!1305237 false))

(declare-fun zeroValue!1387 () V!51699)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!93 ((_ BitVec 64) (_ BitVec 64) V!51699 ListLongMap!20311) Unit!43227)

(assert (=> b!1305237 (= lt!584299 (lemmaInListMapAfterAddingDiffThenInBefore!93 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584289))))

(declare-fun lt!584295 () Bool)

(declare-fun call!64400 () Bool)

(assert (=> b!1305237 (= lt!584295 call!64400)))

(declare-fun b!1305238 () Bool)

(declare-fun e!744511 () Bool)

(declare-fun tp_is_empty!34947 () Bool)

(assert (=> b!1305238 (= e!744511 tp_is_empty!34947)))

(declare-fun bm!64391 () Bool)

(declare-fun call!64393 () ListLongMap!20311)

(assert (=> bm!64391 (= call!64393 call!64397)))

(declare-fun b!1305239 () Bool)

(assert (=> b!1305239 (= e!744515 e!744513)))

(declare-fun c!125356 () Bool)

(declare-fun lt!584300 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305239 (= c!125356 (and (not lt!584300) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305240 () Bool)

(declare-fun res!866753 () Bool)

(declare-fun e!744517 () Bool)

(assert (=> b!1305240 (=> (not res!866753) (not e!744517))))

(declare-datatypes ((array!86910 0))(
  ( (array!86911 (arr!41942 (Array (_ BitVec 32) (_ BitVec 64))) (size!42492 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86910)

(declare-datatypes ((List!29775 0))(
  ( (Nil!29772) (Cons!29771 (h!30980 (_ BitVec 64)) (t!43377 List!29775)) )
))
(declare-fun arrayNoDuplicates!0 (array!86910 (_ BitVec 32) List!29775) Bool)

(assert (=> b!1305240 (= res!866753 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29772))))

(declare-fun bm!64392 () Bool)

(assert (=> bm!64392 (= call!64401 call!64403)))

(declare-fun b!1305241 () Bool)

(declare-fun res!866756 () Bool)

(assert (=> b!1305241 (=> (not res!866756) (not e!744517))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16575 0))(
  ( (ValueCellFull!16575 (v!20170 V!51699)) (EmptyCell!16575) )
))
(declare-datatypes ((array!86912 0))(
  ( (array!86913 (arr!41943 (Array (_ BitVec 32) ValueCell!16575)) (size!42493 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86912)

(assert (=> b!1305241 (= res!866756 (and (= (size!42493 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42492 _keys!1741) (size!42493 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!64393 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6127 (array!86910 array!86912 (_ BitVec 32) (_ BitVec 32) V!51699 V!51699 (_ BitVec 32) Int) ListLongMap!20311)

(assert (=> bm!64393 (= call!64403 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305242 () Bool)

(declare-fun e!744518 () Bool)

(declare-fun e!744514 () Bool)

(assert (=> b!1305242 (= e!744518 (and e!744514 mapRes!54027))))

(declare-fun condMapEmpty!54027 () Bool)

(declare-fun mapDefault!54027 () ValueCell!16575)

(assert (=> b!1305242 (= condMapEmpty!54027 (= (arr!41943 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16575)) mapDefault!54027)))))

(declare-fun res!866754 () Bool)

(assert (=> start!110260 (=> (not res!866754) (not e!744517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110260 (= res!866754 (validMask!0 mask!2175))))

(assert (=> start!110260 e!744517))

(assert (=> start!110260 tp_is_empty!34947))

(assert (=> start!110260 true))

(declare-fun array_inv!31713 (array!86912) Bool)

(assert (=> start!110260 (and (array_inv!31713 _values!1445) e!744518)))

(declare-fun array_inv!31714 (array!86910) Bool)

(assert (=> start!110260 (array_inv!31714 _keys!1741)))

(assert (=> start!110260 tp!103086))

(declare-fun b!1305235 () Bool)

(declare-fun e!744516 () Unit!43227)

(declare-fun Unit!43229 () Unit!43227)

(assert (=> b!1305235 (= e!744516 Unit!43229)))

(declare-fun b!1305243 () Bool)

(assert (=> b!1305243 (= e!744514 tp_is_empty!34947)))

(declare-fun b!1305244 () Bool)

(assert (=> b!1305244 (= e!744517 (not false))))

(declare-fun lt!584293 () Unit!43227)

(assert (=> b!1305244 (= lt!584293 e!744515)))

(declare-fun c!125358 () Bool)

(assert (=> b!1305244 (= c!125358 (and (not lt!584300) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305244 (= lt!584300 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1305244 (not (contains!8315 (ListLongMap!20312 Nil!29771) k0!1205))))

(declare-fun lt!584286 () Unit!43227)

(declare-fun emptyContainsNothing!233 ((_ BitVec 64)) Unit!43227)

(assert (=> b!1305244 (= lt!584286 (emptyContainsNothing!233 k0!1205))))

(declare-fun bm!64394 () Bool)

(assert (=> bm!64394 (= call!64402 call!64394)))

(declare-fun bm!64395 () Bool)

(declare-fun lt!584297 () ListLongMap!20311)

(assert (=> bm!64395 (= call!64396 (lemmaInListMapAfterAddingDiffThenInBefore!93 k0!1205 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)) (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))))

(declare-fun b!1305245 () Bool)

(declare-fun res!866752 () Bool)

(assert (=> b!1305245 (=> (not res!866752) (not e!744517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305245 (= res!866752 (not (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144))))))

(declare-fun bm!64396 () Bool)

(assert (=> bm!64396 (= call!64398 call!64395)))

(declare-fun bm!64397 () Bool)

(assert (=> bm!64397 (= call!64397 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305246 () Bool)

(declare-fun res!866757 () Bool)

(assert (=> b!1305246 (=> (not res!866757) (not e!744517))))

(assert (=> b!1305246 (= res!866757 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741))))))

(declare-fun b!1305247 () Bool)

(declare-fun c!125357 () Bool)

(assert (=> b!1305247 (= c!125357 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584300))))

(assert (=> b!1305247 (= e!744513 e!744516)))

(declare-fun b!1305248 () Bool)

(declare-fun res!866758 () Bool)

(assert (=> b!1305248 (=> (not res!866758) (not e!744517))))

(assert (=> b!1305248 (= res!866758 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42492 _keys!1741))))))

(declare-fun bm!64398 () Bool)

(assert (=> bm!64398 (= call!64394 (contains!8315 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) k0!1205))))

(declare-fun b!1305249 () Bool)

(declare-fun res!866759 () Bool)

(assert (=> b!1305249 (=> (not res!866759) (not e!744517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86910 (_ BitVec 32)) Bool)

(assert (=> b!1305249 (= res!866759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!64399 () Bool)

(assert (=> bm!64399 (= call!64400 (contains!8315 (ite c!125358 lt!584289 call!64393) k0!1205))))

(declare-fun mapNonEmpty!54027 () Bool)

(declare-fun tp!103085 () Bool)

(assert (=> mapNonEmpty!54027 (= mapRes!54027 (and tp!103085 e!744511))))

(declare-fun mapKey!54027 () (_ BitVec 32))

(declare-fun mapRest!54027 () (Array (_ BitVec 32) ValueCell!16575))

(declare-fun mapValue!54027 () ValueCell!16575)

(assert (=> mapNonEmpty!54027 (= (arr!41943 _values!1445) (store mapRest!54027 mapKey!54027 mapValue!54027))))

(declare-fun bm!64400 () Bool)

(assert (=> bm!64400 (= call!64399 call!64400)))

(declare-fun b!1305250 () Bool)

(declare-fun res!866755 () Bool)

(assert (=> b!1305250 (=> (not res!866755) (not e!744517))))

(declare-fun getCurrentListMap!5187 (array!86910 array!86912 (_ BitVec 32) (_ BitVec 32) V!51699 V!51699 (_ BitVec 32) Int) ListLongMap!20311)

(assert (=> b!1305250 (= res!866755 (contains!8315 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!64401 () Bool)

(assert (=> bm!64401 (= call!64395 (addStillNotContains!488 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1305251 () Bool)

(declare-fun lt!584287 () Unit!43227)

(assert (=> b!1305251 (= e!744516 lt!584287)))

(assert (=> b!1305251 (= lt!584297 call!64401)))

(declare-fun lt!584296 () Unit!43227)

(assert (=> b!1305251 (= lt!584296 call!64398)))

(assert (=> b!1305251 (not call!64399)))

(assert (=> b!1305251 (= lt!584287 call!64404)))

(assert (=> b!1305251 call!64402))

(assert (= (and start!110260 res!866754) b!1305241))

(assert (= (and b!1305241 res!866756) b!1305249))

(assert (= (and b!1305249 res!866759) b!1305240))

(assert (= (and b!1305240 res!866753) b!1305246))

(assert (= (and b!1305246 res!866757) b!1305250))

(assert (= (and b!1305250 res!866755) b!1305248))

(assert (= (and b!1305248 res!866758) b!1305245))

(assert (= (and b!1305245 res!866752) b!1305244))

(assert (= (and b!1305244 c!125358) b!1305237))

(assert (= (and b!1305244 (not c!125358)) b!1305239))

(assert (= (and b!1305239 c!125356) b!1305236))

(assert (= (and b!1305239 (not c!125356)) b!1305247))

(assert (= (and b!1305247 c!125357) b!1305251))

(assert (= (and b!1305247 (not c!125357)) b!1305235))

(assert (= (or b!1305236 b!1305251) bm!64392))

(assert (= (or b!1305236 b!1305251) bm!64394))

(assert (= (or b!1305236 b!1305251) bm!64391))

(assert (= (or b!1305236 b!1305251) bm!64390))

(assert (= (or b!1305236 b!1305251) bm!64396))

(assert (= (or b!1305236 b!1305251) bm!64400))

(assert (= (or b!1305237 bm!64400) bm!64399))

(assert (= (or b!1305237 bm!64396) bm!64401))

(assert (= (or b!1305237 bm!64390) bm!64395))

(assert (= (or b!1305237 bm!64392) bm!64393))

(assert (= (or b!1305237 bm!64394) bm!64398))

(assert (= (or b!1305237 bm!64391) bm!64397))

(assert (= (and b!1305242 condMapEmpty!54027) mapIsEmpty!54027))

(assert (= (and b!1305242 (not condMapEmpty!54027)) mapNonEmpty!54027))

(get-info :version)

(assert (= (and mapNonEmpty!54027 ((_ is ValueCellFull!16575) mapValue!54027)) b!1305238))

(assert (= (and b!1305242 ((_ is ValueCellFull!16575) mapDefault!54027)) b!1305243))

(assert (= start!110260 b!1305242))

(declare-fun m!1196239 () Bool)

(assert (=> mapNonEmpty!54027 m!1196239))

(declare-fun m!1196241 () Bool)

(assert (=> b!1305244 m!1196241))

(declare-fun m!1196243 () Bool)

(assert (=> b!1305244 m!1196243))

(declare-fun m!1196245 () Bool)

(assert (=> start!110260 m!1196245))

(declare-fun m!1196247 () Bool)

(assert (=> start!110260 m!1196247))

(declare-fun m!1196249 () Bool)

(assert (=> start!110260 m!1196249))

(declare-fun m!1196251 () Bool)

(assert (=> bm!64395 m!1196251))

(declare-fun m!1196253 () Bool)

(assert (=> bm!64401 m!1196253))

(declare-fun m!1196255 () Bool)

(assert (=> bm!64393 m!1196255))

(declare-fun m!1196257 () Bool)

(assert (=> bm!64398 m!1196257))

(declare-fun m!1196259 () Bool)

(assert (=> b!1305250 m!1196259))

(assert (=> b!1305250 m!1196259))

(declare-fun m!1196261 () Bool)

(assert (=> b!1305250 m!1196261))

(declare-fun m!1196263 () Bool)

(assert (=> b!1305249 m!1196263))

(declare-fun m!1196265 () Bool)

(assert (=> b!1305237 m!1196265))

(declare-fun m!1196267 () Bool)

(assert (=> b!1305237 m!1196267))

(assert (=> b!1305237 m!1196267))

(declare-fun m!1196269 () Bool)

(assert (=> b!1305237 m!1196269))

(declare-fun m!1196271 () Bool)

(assert (=> b!1305237 m!1196271))

(declare-fun m!1196273 () Bool)

(assert (=> bm!64399 m!1196273))

(declare-fun m!1196275 () Bool)

(assert (=> b!1305245 m!1196275))

(assert (=> b!1305245 m!1196275))

(declare-fun m!1196277 () Bool)

(assert (=> b!1305245 m!1196277))

(declare-fun m!1196279 () Bool)

(assert (=> bm!64397 m!1196279))

(declare-fun m!1196281 () Bool)

(assert (=> b!1305240 m!1196281))

(check-sat (not b!1305244) (not b_next!29307) (not bm!64398) (not b!1305240) (not bm!64401) (not b!1305250) b_and!47503 (not mapNonEmpty!54027) (not bm!64397) (not bm!64399) (not bm!64395) (not start!110260) (not b!1305237) (not bm!64393) tp_is_empty!34947 (not b!1305245) (not b!1305249))
(check-sat b_and!47503 (not b_next!29307))
(get-model)

(declare-fun d!141981 () Bool)

(declare-fun e!744547 () Bool)

(assert (=> d!141981 e!744547))

(declare-fun res!866786 () Bool)

(assert (=> d!141981 (=> res!866786 e!744547)))

(declare-fun lt!584361 () Bool)

(assert (=> d!141981 (= res!866786 (not lt!584361))))

(declare-fun lt!584360 () Bool)

(assert (=> d!141981 (= lt!584361 lt!584360)))

(declare-fun lt!584358 () Unit!43227)

(declare-fun e!744548 () Unit!43227)

(assert (=> d!141981 (= lt!584358 e!744548)))

(declare-fun c!125370 () Bool)

(assert (=> d!141981 (= c!125370 lt!584360)))

(declare-fun containsKey!731 (List!29774 (_ BitVec 64)) Bool)

(assert (=> d!141981 (= lt!584360 (containsKey!731 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(assert (=> d!141981 (= (contains!8315 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) k0!1205) lt!584361)))

(declare-fun b!1305309 () Bool)

(declare-fun lt!584359 () Unit!43227)

(assert (=> b!1305309 (= e!744548 lt!584359)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!477 (List!29774 (_ BitVec 64)) Unit!43227)

(assert (=> b!1305309 (= lt!584359 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(declare-datatypes ((Option!761 0))(
  ( (Some!760 (v!20172 V!51699)) (None!759) )
))
(declare-fun isDefined!516 (Option!761) Bool)

(declare-fun getValueByKey!709 (List!29774 (_ BitVec 64)) Option!761)

(assert (=> b!1305309 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(declare-fun b!1305310 () Bool)

(declare-fun Unit!43233 () Unit!43227)

(assert (=> b!1305310 (= e!744548 Unit!43233)))

(declare-fun b!1305311 () Bool)

(assert (=> b!1305311 (= e!744547 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205)))))

(assert (= (and d!141981 c!125370) b!1305309))

(assert (= (and d!141981 (not c!125370)) b!1305310))

(assert (= (and d!141981 (not res!866786)) b!1305311))

(declare-fun m!1196327 () Bool)

(assert (=> d!141981 m!1196327))

(declare-fun m!1196329 () Bool)

(assert (=> b!1305309 m!1196329))

(declare-fun m!1196331 () Bool)

(assert (=> b!1305309 m!1196331))

(assert (=> b!1305309 m!1196331))

(declare-fun m!1196333 () Bool)

(assert (=> b!1305309 m!1196333))

(assert (=> b!1305311 m!1196331))

(assert (=> b!1305311 m!1196331))

(assert (=> b!1305311 m!1196333))

(assert (=> bm!64398 d!141981))

(declare-fun b!1305336 () Bool)

(declare-fun e!744567 () Bool)

(assert (=> b!1305336 (= e!744567 (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> b!1305336 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun bm!64440 () Bool)

(declare-fun call!64443 () ListLongMap!20311)

(assert (=> bm!64440 (= call!64443 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305337 () Bool)

(declare-fun e!744565 () ListLongMap!20311)

(declare-fun e!744563 () ListLongMap!20311)

(assert (=> b!1305337 (= e!744565 e!744563)))

(declare-fun c!125381 () Bool)

(assert (=> b!1305337 (= c!125381 (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144)))))

(declare-fun b!1305338 () Bool)

(declare-fun e!744564 () Bool)

(declare-fun lt!584379 () ListLongMap!20311)

(declare-fun isEmpty!1070 (ListLongMap!20311) Bool)

(assert (=> b!1305338 (= e!744564 (isEmpty!1070 lt!584379))))

(declare-fun b!1305339 () Bool)

(assert (=> b!1305339 (= e!744563 call!64443)))

(declare-fun b!1305340 () Bool)

(declare-fun e!744566 () Bool)

(declare-fun e!744568 () Bool)

(assert (=> b!1305340 (= e!744566 e!744568)))

(assert (=> b!1305340 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun res!866796 () Bool)

(assert (=> b!1305340 (= res!866796 (contains!8315 lt!584379 (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> b!1305340 (=> (not res!866796) (not e!744568))))

(declare-fun d!141983 () Bool)

(declare-fun e!744569 () Bool)

(assert (=> d!141983 e!744569))

(declare-fun res!866798 () Bool)

(assert (=> d!141983 (=> (not res!866798) (not e!744569))))

(assert (=> d!141983 (= res!866798 (not (contains!8315 lt!584379 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141983 (= lt!584379 e!744565)))

(declare-fun c!125380 () Bool)

(assert (=> d!141983 (= c!125380 (bvsge from!2144 (size!42492 _keys!1741)))))

(assert (=> d!141983 (validMask!0 mask!2175)))

(assert (=> d!141983 (= (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584379)))

(declare-fun b!1305341 () Bool)

(assert (=> b!1305341 (= e!744569 e!744566)))

(declare-fun c!125379 () Bool)

(assert (=> b!1305341 (= c!125379 e!744567)))

(declare-fun res!866797 () Bool)

(assert (=> b!1305341 (=> (not res!866797) (not e!744567))))

(assert (=> b!1305341 (= res!866797 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305342 () Bool)

(declare-fun lt!584381 () Unit!43227)

(declare-fun lt!584382 () Unit!43227)

(assert (=> b!1305342 (= lt!584381 lt!584382)))

(declare-fun lt!584378 () (_ BitVec 64))

(declare-fun lt!584377 () ListLongMap!20311)

(declare-fun lt!584380 () (_ BitVec 64))

(declare-fun lt!584376 () V!51699)

(assert (=> b!1305342 (not (contains!8315 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376)) lt!584380))))

(assert (=> b!1305342 (= lt!584382 (addStillNotContains!488 lt!584377 lt!584378 lt!584376 lt!584380))))

(assert (=> b!1305342 (= lt!584380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21188 (ValueCell!16575 V!51699) V!51699)

(declare-fun dynLambda!3433 (Int (_ BitVec 64)) V!51699)

(assert (=> b!1305342 (= lt!584376 (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305342 (= lt!584378 (select (arr!41942 _keys!1741) from!2144))))

(assert (=> b!1305342 (= lt!584377 call!64443)))

(assert (=> b!1305342 (= e!744563 (+!4491 call!64443 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305343 () Bool)

(assert (=> b!1305343 (= e!744566 e!744564)))

(declare-fun c!125382 () Bool)

(assert (=> b!1305343 (= c!125382 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305344 () Bool)

(assert (=> b!1305344 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(assert (=> b!1305344 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42493 _values!1445)))))

(declare-fun apply!1026 (ListLongMap!20311 (_ BitVec 64)) V!51699)

(assert (=> b!1305344 (= e!744568 (= (apply!1026 lt!584379 (select (arr!41942 _keys!1741) from!2144)) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305345 () Bool)

(assert (=> b!1305345 (= e!744565 (ListLongMap!20312 Nil!29771))))

(declare-fun b!1305346 () Bool)

(assert (=> b!1305346 (= e!744564 (= lt!584379 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305347 () Bool)

(declare-fun res!866795 () Bool)

(assert (=> b!1305347 (=> (not res!866795) (not e!744569))))

(assert (=> b!1305347 (= res!866795 (not (contains!8315 lt!584379 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141983 c!125380) b!1305345))

(assert (= (and d!141983 (not c!125380)) b!1305337))

(assert (= (and b!1305337 c!125381) b!1305342))

(assert (= (and b!1305337 (not c!125381)) b!1305339))

(assert (= (or b!1305342 b!1305339) bm!64440))

(assert (= (and d!141983 res!866798) b!1305347))

(assert (= (and b!1305347 res!866795) b!1305341))

(assert (= (and b!1305341 res!866797) b!1305336))

(assert (= (and b!1305341 c!125379) b!1305340))

(assert (= (and b!1305341 (not c!125379)) b!1305343))

(assert (= (and b!1305340 res!866796) b!1305344))

(assert (= (and b!1305343 c!125382) b!1305346))

(assert (= (and b!1305343 (not c!125382)) b!1305338))

(declare-fun b_lambda!23339 () Bool)

(assert (=> (not b_lambda!23339) (not b!1305342)))

(declare-fun t!43381 () Bool)

(declare-fun tb!11407 () Bool)

(assert (=> (and start!110260 (= defaultEntry!1448 defaultEntry!1448) t!43381) tb!11407))

(declare-fun result!23843 () Bool)

(assert (=> tb!11407 (= result!23843 tp_is_empty!34947)))

(assert (=> b!1305342 t!43381))

(declare-fun b_and!47507 () Bool)

(assert (= b_and!47503 (and (=> t!43381 result!23843) b_and!47507)))

(declare-fun b_lambda!23341 () Bool)

(assert (=> (not b_lambda!23341) (not b!1305344)))

(assert (=> b!1305344 t!43381))

(declare-fun b_and!47509 () Bool)

(assert (= b_and!47507 (and (=> t!43381 result!23843) b_and!47509)))

(declare-fun m!1196335 () Bool)

(assert (=> d!141983 m!1196335))

(assert (=> d!141983 m!1196245))

(declare-fun m!1196337 () Bool)

(assert (=> b!1305346 m!1196337))

(assert (=> b!1305344 m!1196275))

(declare-fun m!1196339 () Bool)

(assert (=> b!1305344 m!1196339))

(declare-fun m!1196341 () Bool)

(assert (=> b!1305344 m!1196341))

(assert (=> b!1305344 m!1196275))

(declare-fun m!1196343 () Bool)

(assert (=> b!1305344 m!1196343))

(assert (=> b!1305344 m!1196343))

(assert (=> b!1305344 m!1196341))

(declare-fun m!1196345 () Bool)

(assert (=> b!1305344 m!1196345))

(assert (=> bm!64440 m!1196337))

(assert (=> b!1305336 m!1196275))

(assert (=> b!1305336 m!1196275))

(assert (=> b!1305336 m!1196277))

(assert (=> b!1305340 m!1196275))

(assert (=> b!1305340 m!1196275))

(declare-fun m!1196347 () Bool)

(assert (=> b!1305340 m!1196347))

(declare-fun m!1196349 () Bool)

(assert (=> b!1305342 m!1196349))

(declare-fun m!1196351 () Bool)

(assert (=> b!1305342 m!1196351))

(declare-fun m!1196353 () Bool)

(assert (=> b!1305342 m!1196353))

(assert (=> b!1305342 m!1196351))

(declare-fun m!1196355 () Bool)

(assert (=> b!1305342 m!1196355))

(assert (=> b!1305342 m!1196341))

(assert (=> b!1305342 m!1196275))

(assert (=> b!1305342 m!1196343))

(assert (=> b!1305342 m!1196343))

(assert (=> b!1305342 m!1196341))

(assert (=> b!1305342 m!1196345))

(declare-fun m!1196357 () Bool)

(assert (=> b!1305347 m!1196357))

(assert (=> b!1305337 m!1196275))

(assert (=> b!1305337 m!1196275))

(assert (=> b!1305337 m!1196277))

(declare-fun m!1196359 () Bool)

(assert (=> b!1305338 m!1196359))

(assert (=> bm!64393 d!141983))

(declare-fun d!141985 () Bool)

(assert (=> d!141985 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110260 d!141985))

(declare-fun d!141987 () Bool)

(assert (=> d!141987 (= (array_inv!31713 _values!1445) (bvsge (size!42493 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110260 d!141987))

(declare-fun d!141989 () Bool)

(assert (=> d!141989 (= (array_inv!31714 _keys!1741) (bvsge (size!42492 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110260 d!141989))

(declare-fun d!141991 () Bool)

(declare-fun e!744570 () Bool)

(assert (=> d!141991 e!744570))

(declare-fun res!866799 () Bool)

(assert (=> d!141991 (=> res!866799 e!744570)))

(declare-fun lt!584386 () Bool)

(assert (=> d!141991 (= res!866799 (not lt!584386))))

(declare-fun lt!584385 () Bool)

(assert (=> d!141991 (= lt!584386 lt!584385)))

(declare-fun lt!584383 () Unit!43227)

(declare-fun e!744571 () Unit!43227)

(assert (=> d!141991 (= lt!584383 e!744571)))

(declare-fun c!125383 () Bool)

(assert (=> d!141991 (= c!125383 lt!584385)))

(assert (=> d!141991 (= lt!584385 (containsKey!731 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(assert (=> d!141991 (= (contains!8315 (ite c!125358 lt!584289 call!64393) k0!1205) lt!584386)))

(declare-fun b!1305350 () Bool)

(declare-fun lt!584384 () Unit!43227)

(assert (=> b!1305350 (= e!744571 lt!584384)))

(assert (=> b!1305350 (= lt!584384 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(assert (=> b!1305350 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(declare-fun b!1305351 () Bool)

(declare-fun Unit!43234 () Unit!43227)

(assert (=> b!1305351 (= e!744571 Unit!43234)))

(declare-fun b!1305352 () Bool)

(assert (=> b!1305352 (= e!744570 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205)))))

(assert (= (and d!141991 c!125383) b!1305350))

(assert (= (and d!141991 (not c!125383)) b!1305351))

(assert (= (and d!141991 (not res!866799)) b!1305352))

(declare-fun m!1196361 () Bool)

(assert (=> d!141991 m!1196361))

(declare-fun m!1196363 () Bool)

(assert (=> b!1305350 m!1196363))

(declare-fun m!1196365 () Bool)

(assert (=> b!1305350 m!1196365))

(assert (=> b!1305350 m!1196365))

(declare-fun m!1196367 () Bool)

(assert (=> b!1305350 m!1196367))

(assert (=> b!1305352 m!1196365))

(assert (=> b!1305352 m!1196365))

(assert (=> b!1305352 m!1196367))

(assert (=> bm!64399 d!141991))

(declare-fun d!141993 () Bool)

(assert (=> d!141993 (not (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584389 () Unit!43227)

(declare-fun choose!1935 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> d!141993 (= lt!584389 (choose!1935 lt!584289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!744574 () Bool)

(assert (=> d!141993 e!744574))

(declare-fun res!866802 () Bool)

(assert (=> d!141993 (=> (not res!866802) (not e!744574))))

(assert (=> d!141993 (= res!866802 (not (contains!8315 lt!584289 k0!1205)))))

(assert (=> d!141993 (= (addStillNotContains!488 lt!584289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!584389)))

(declare-fun b!1305356 () Bool)

(assert (=> b!1305356 (= e!744574 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141993 res!866802) b!1305356))

(assert (=> d!141993 m!1196267))

(assert (=> d!141993 m!1196267))

(assert (=> d!141993 m!1196269))

(declare-fun m!1196369 () Bool)

(assert (=> d!141993 m!1196369))

(declare-fun m!1196371 () Bool)

(assert (=> d!141993 m!1196371))

(assert (=> b!1305237 d!141993))

(declare-fun d!141995 () Bool)

(declare-fun e!744575 () Bool)

(assert (=> d!141995 e!744575))

(declare-fun res!866803 () Bool)

(assert (=> d!141995 (=> res!866803 e!744575)))

(declare-fun lt!584393 () Bool)

(assert (=> d!141995 (= res!866803 (not lt!584393))))

(declare-fun lt!584392 () Bool)

(assert (=> d!141995 (= lt!584393 lt!584392)))

(declare-fun lt!584390 () Unit!43227)

(declare-fun e!744576 () Unit!43227)

(assert (=> d!141995 (= lt!584390 e!744576)))

(declare-fun c!125384 () Bool)

(assert (=> d!141995 (= c!125384 lt!584392)))

(assert (=> d!141995 (= lt!584392 (containsKey!731 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141995 (= (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!584393)))

(declare-fun b!1305357 () Bool)

(declare-fun lt!584391 () Unit!43227)

(assert (=> b!1305357 (= e!744576 lt!584391)))

(assert (=> b!1305357 (= lt!584391 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1305357 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1305358 () Bool)

(declare-fun Unit!43235 () Unit!43227)

(assert (=> b!1305358 (= e!744576 Unit!43235)))

(declare-fun b!1305359 () Bool)

(assert (=> b!1305359 (= e!744575 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141995 c!125384) b!1305357))

(assert (= (and d!141995 (not c!125384)) b!1305358))

(assert (= (and d!141995 (not res!866803)) b!1305359))

(declare-fun m!1196373 () Bool)

(assert (=> d!141995 m!1196373))

(declare-fun m!1196375 () Bool)

(assert (=> b!1305357 m!1196375))

(declare-fun m!1196377 () Bool)

(assert (=> b!1305357 m!1196377))

(assert (=> b!1305357 m!1196377))

(declare-fun m!1196379 () Bool)

(assert (=> b!1305357 m!1196379))

(assert (=> b!1305359 m!1196377))

(assert (=> b!1305359 m!1196377))

(assert (=> b!1305359 m!1196379))

(assert (=> b!1305237 d!141995))

(declare-fun d!141997 () Bool)

(declare-fun e!744579 () Bool)

(assert (=> d!141997 e!744579))

(declare-fun res!866809 () Bool)

(assert (=> d!141997 (=> (not res!866809) (not e!744579))))

(declare-fun lt!584403 () ListLongMap!20311)

(assert (=> d!141997 (= res!866809 (contains!8315 lt!584403 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584404 () List!29774)

(assert (=> d!141997 (= lt!584403 (ListLongMap!20312 lt!584404))))

(declare-fun lt!584402 () Unit!43227)

(declare-fun lt!584405 () Unit!43227)

(assert (=> d!141997 (= lt!584402 lt!584405)))

(assert (=> d!141997 (= (getValueByKey!709 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!355 (List!29774 (_ BitVec 64) V!51699) Unit!43227)

(assert (=> d!141997 (= lt!584405 (lemmaContainsTupThenGetReturnValue!355 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!484 (List!29774 (_ BitVec 64) V!51699) List!29774)

(assert (=> d!141997 (= lt!584404 (insertStrictlySorted!484 (toList!10171 lt!584289) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141997 (= (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584403)))

(declare-fun b!1305364 () Bool)

(declare-fun res!866808 () Bool)

(assert (=> b!1305364 (=> (not res!866808) (not e!744579))))

(assert (=> b!1305364 (= res!866808 (= (getValueByKey!709 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305365 () Bool)

(declare-fun contains!8317 (List!29774 tuple2!22654) Bool)

(assert (=> b!1305365 (= e!744579 (contains!8317 (toList!10171 lt!584403) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141997 res!866809) b!1305364))

(assert (= (and b!1305364 res!866808) b!1305365))

(declare-fun m!1196381 () Bool)

(assert (=> d!141997 m!1196381))

(declare-fun m!1196383 () Bool)

(assert (=> d!141997 m!1196383))

(declare-fun m!1196385 () Bool)

(assert (=> d!141997 m!1196385))

(declare-fun m!1196387 () Bool)

(assert (=> d!141997 m!1196387))

(declare-fun m!1196389 () Bool)

(assert (=> b!1305364 m!1196389))

(declare-fun m!1196391 () Bool)

(assert (=> b!1305365 m!1196391))

(assert (=> b!1305237 d!141997))

(declare-fun d!141999 () Bool)

(assert (=> d!141999 (contains!8315 lt!584289 k0!1205)))

(declare-fun lt!584408 () Unit!43227)

(declare-fun choose!1936 ((_ BitVec 64) (_ BitVec 64) V!51699 ListLongMap!20311) Unit!43227)

(assert (=> d!141999 (= lt!584408 (choose!1936 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584289))))

(assert (=> d!141999 (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141999 (= (lemmaInListMapAfterAddingDiffThenInBefore!93 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584289) lt!584408)))

(declare-fun bs!37180 () Bool)

(assert (= bs!37180 d!141999))

(assert (=> bs!37180 m!1196371))

(declare-fun m!1196393 () Bool)

(assert (=> bs!37180 m!1196393))

(declare-fun m!1196395 () Bool)

(assert (=> bs!37180 m!1196395))

(assert (=> bs!37180 m!1196395))

(declare-fun m!1196397 () Bool)

(assert (=> bs!37180 m!1196397))

(assert (=> b!1305237 d!141999))

(declare-fun d!142001 () Bool)

(declare-fun e!744580 () Bool)

(assert (=> d!142001 e!744580))

(declare-fun res!866810 () Bool)

(assert (=> d!142001 (=> res!866810 e!744580)))

(declare-fun lt!584412 () Bool)

(assert (=> d!142001 (= res!866810 (not lt!584412))))

(declare-fun lt!584411 () Bool)

(assert (=> d!142001 (= lt!584412 lt!584411)))

(declare-fun lt!584409 () Unit!43227)

(declare-fun e!744581 () Unit!43227)

(assert (=> d!142001 (= lt!584409 e!744581)))

(declare-fun c!125385 () Bool)

(assert (=> d!142001 (= c!125385 lt!584411)))

(assert (=> d!142001 (= lt!584411 (containsKey!731 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(assert (=> d!142001 (= (contains!8315 (ListLongMap!20312 Nil!29771) k0!1205) lt!584412)))

(declare-fun b!1305366 () Bool)

(declare-fun lt!584410 () Unit!43227)

(assert (=> b!1305366 (= e!744581 lt!584410)))

(assert (=> b!1305366 (= lt!584410 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(assert (=> b!1305366 (isDefined!516 (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(declare-fun b!1305367 () Bool)

(declare-fun Unit!43236 () Unit!43227)

(assert (=> b!1305367 (= e!744581 Unit!43236)))

(declare-fun b!1305368 () Bool)

(assert (=> b!1305368 (= e!744580 (isDefined!516 (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205)))))

(assert (= (and d!142001 c!125385) b!1305366))

(assert (= (and d!142001 (not c!125385)) b!1305367))

(assert (= (and d!142001 (not res!866810)) b!1305368))

(declare-fun m!1196399 () Bool)

(assert (=> d!142001 m!1196399))

(declare-fun m!1196401 () Bool)

(assert (=> b!1305366 m!1196401))

(declare-fun m!1196403 () Bool)

(assert (=> b!1305366 m!1196403))

(assert (=> b!1305366 m!1196403))

(declare-fun m!1196405 () Bool)

(assert (=> b!1305366 m!1196405))

(assert (=> b!1305368 m!1196403))

(assert (=> b!1305368 m!1196403))

(assert (=> b!1305368 m!1196405))

(assert (=> b!1305244 d!142001))

(declare-fun d!142003 () Bool)

(assert (=> d!142003 (not (contains!8315 (ListLongMap!20312 Nil!29771) k0!1205))))

(declare-fun lt!584415 () Unit!43227)

(declare-fun choose!1937 ((_ BitVec 64)) Unit!43227)

(assert (=> d!142003 (= lt!584415 (choose!1937 k0!1205))))

(assert (=> d!142003 (= (emptyContainsNothing!233 k0!1205) lt!584415)))

(declare-fun bs!37181 () Bool)

(assert (= bs!37181 d!142003))

(assert (=> bs!37181 m!1196241))

(declare-fun m!1196407 () Bool)

(assert (=> bs!37181 m!1196407))

(assert (=> b!1305244 d!142003))

(declare-fun bm!64443 () Bool)

(declare-fun call!64446 () Bool)

(assert (=> bm!64443 (= call!64446 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305377 () Bool)

(declare-fun e!744590 () Bool)

(declare-fun e!744589 () Bool)

(assert (=> b!1305377 (= e!744590 e!744589)))

(declare-fun lt!584423 () (_ BitVec 64))

(assert (=> b!1305377 (= lt!584423 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584424 () Unit!43227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86910 (_ BitVec 64) (_ BitVec 32)) Unit!43227)

(assert (=> b!1305377 (= lt!584424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584423 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305377 (arrayContainsKey!0 _keys!1741 lt!584423 #b00000000000000000000000000000000)))

(declare-fun lt!584422 () Unit!43227)

(assert (=> b!1305377 (= lt!584422 lt!584424)))

(declare-fun res!866815 () Bool)

(declare-datatypes ((SeekEntryResult!10029 0))(
  ( (MissingZero!10029 (index!42487 (_ BitVec 32))) (Found!10029 (index!42488 (_ BitVec 32))) (Intermediate!10029 (undefined!10841 Bool) (index!42489 (_ BitVec 32)) (x!115930 (_ BitVec 32))) (Undefined!10029) (MissingVacant!10029 (index!42490 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86910 (_ BitVec 32)) SeekEntryResult!10029)

(assert (=> b!1305377 (= res!866815 (= (seekEntryOrOpen!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10029 #b00000000000000000000000000000000)))))

(assert (=> b!1305377 (=> (not res!866815) (not e!744589))))

(declare-fun d!142005 () Bool)

(declare-fun res!866816 () Bool)

(declare-fun e!744588 () Bool)

(assert (=> d!142005 (=> res!866816 e!744588)))

(assert (=> d!142005 (= res!866816 (bvsge #b00000000000000000000000000000000 (size!42492 _keys!1741)))))

(assert (=> d!142005 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744588)))

(declare-fun b!1305378 () Bool)

(assert (=> b!1305378 (= e!744590 call!64446)))

(declare-fun b!1305379 () Bool)

(assert (=> b!1305379 (= e!744589 call!64446)))

(declare-fun b!1305380 () Bool)

(assert (=> b!1305380 (= e!744588 e!744590)))

(declare-fun c!125388 () Bool)

(assert (=> b!1305380 (= c!125388 (validKeyInArray!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142005 (not res!866816)) b!1305380))

(assert (= (and b!1305380 c!125388) b!1305377))

(assert (= (and b!1305380 (not c!125388)) b!1305378))

(assert (= (and b!1305377 res!866815) b!1305379))

(assert (= (or b!1305379 b!1305378) bm!64443))

(declare-fun m!1196409 () Bool)

(assert (=> bm!64443 m!1196409))

(declare-fun m!1196411 () Bool)

(assert (=> b!1305377 m!1196411))

(declare-fun m!1196413 () Bool)

(assert (=> b!1305377 m!1196413))

(declare-fun m!1196415 () Bool)

(assert (=> b!1305377 m!1196415))

(assert (=> b!1305377 m!1196411))

(declare-fun m!1196417 () Bool)

(assert (=> b!1305377 m!1196417))

(assert (=> b!1305380 m!1196411))

(assert (=> b!1305380 m!1196411))

(declare-fun m!1196419 () Bool)

(assert (=> b!1305380 m!1196419))

(assert (=> b!1305249 d!142005))

(declare-fun d!142007 () Bool)

(assert (=> d!142007 (= (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144)) (and (not (= (select (arr!41942 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41942 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305245 d!142007))

(declare-fun d!142009 () Bool)

(declare-fun e!744591 () Bool)

(assert (=> d!142009 e!744591))

(declare-fun res!866817 () Bool)

(assert (=> d!142009 (=> res!866817 e!744591)))

(declare-fun lt!584428 () Bool)

(assert (=> d!142009 (= res!866817 (not lt!584428))))

(declare-fun lt!584427 () Bool)

(assert (=> d!142009 (= lt!584428 lt!584427)))

(declare-fun lt!584425 () Unit!43227)

(declare-fun e!744592 () Unit!43227)

(assert (=> d!142009 (= lt!584425 e!744592)))

(declare-fun c!125389 () Bool)

(assert (=> d!142009 (= c!125389 lt!584427)))

(assert (=> d!142009 (= lt!584427 (containsKey!731 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142009 (= (contains!8315 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584428)))

(declare-fun b!1305381 () Bool)

(declare-fun lt!584426 () Unit!43227)

(assert (=> b!1305381 (= e!744592 lt!584426)))

(assert (=> b!1305381 (= lt!584426 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1305381 (isDefined!516 (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305382 () Bool)

(declare-fun Unit!43237 () Unit!43227)

(assert (=> b!1305382 (= e!744592 Unit!43237)))

(declare-fun b!1305383 () Bool)

(assert (=> b!1305383 (= e!744591 (isDefined!516 (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142009 c!125389) b!1305381))

(assert (= (and d!142009 (not c!125389)) b!1305382))

(assert (= (and d!142009 (not res!866817)) b!1305383))

(declare-fun m!1196421 () Bool)

(assert (=> d!142009 m!1196421))

(declare-fun m!1196423 () Bool)

(assert (=> b!1305381 m!1196423))

(declare-fun m!1196425 () Bool)

(assert (=> b!1305381 m!1196425))

(assert (=> b!1305381 m!1196425))

(declare-fun m!1196427 () Bool)

(assert (=> b!1305381 m!1196427))

(assert (=> b!1305383 m!1196425))

(assert (=> b!1305383 m!1196425))

(assert (=> b!1305383 m!1196427))

(assert (=> b!1305250 d!142009))

(declare-fun b!1305426 () Bool)

(declare-fun e!744625 () Bool)

(assert (=> b!1305426 (= e!744625 (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144)))))

(declare-fun bm!64458 () Bool)

(declare-fun call!64461 () Bool)

(declare-fun lt!584477 () ListLongMap!20311)

(assert (=> bm!64458 (= call!64461 (contains!8315 lt!584477 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!142011 () Bool)

(declare-fun e!744622 () Bool)

(assert (=> d!142011 e!744622))

(declare-fun res!866837 () Bool)

(assert (=> d!142011 (=> (not res!866837) (not e!744622))))

(assert (=> d!142011 (= res!866837 (or (bvsge from!2144 (size!42492 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))))

(declare-fun lt!584484 () ListLongMap!20311)

(assert (=> d!142011 (= lt!584477 lt!584484)))

(declare-fun lt!584473 () Unit!43227)

(declare-fun e!744631 () Unit!43227)

(assert (=> d!142011 (= lt!584473 e!744631)))

(declare-fun c!125403 () Bool)

(assert (=> d!142011 (= c!125403 e!744625)))

(declare-fun res!866840 () Bool)

(assert (=> d!142011 (=> (not res!866840) (not e!744625))))

(assert (=> d!142011 (= res!866840 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun e!744630 () ListLongMap!20311)

(assert (=> d!142011 (= lt!584484 e!744630)))

(declare-fun c!125406 () Bool)

(assert (=> d!142011 (= c!125406 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142011 (validMask!0 mask!2175)))

(assert (=> d!142011 (= (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584477)))

(declare-fun bm!64459 () Bool)

(declare-fun call!64467 () ListLongMap!20311)

(declare-fun call!64466 () ListLongMap!20311)

(assert (=> bm!64459 (= call!64467 call!64466)))

(declare-fun b!1305427 () Bool)

(declare-fun e!744626 () Bool)

(declare-fun e!744624 () Bool)

(assert (=> b!1305427 (= e!744626 e!744624)))

(declare-fun res!866843 () Bool)

(assert (=> b!1305427 (= res!866843 call!64461)))

(assert (=> b!1305427 (=> (not res!866843) (not e!744624))))

(declare-fun b!1305428 () Bool)

(declare-fun e!744623 () Bool)

(declare-fun e!744619 () Bool)

(assert (=> b!1305428 (= e!744623 e!744619)))

(declare-fun res!866839 () Bool)

(declare-fun call!64462 () Bool)

(assert (=> b!1305428 (= res!866839 call!64462)))

(assert (=> b!1305428 (=> (not res!866839) (not e!744619))))

(declare-fun b!1305429 () Bool)

(declare-fun e!744627 () Bool)

(assert (=> b!1305429 (= e!744627 (validKeyInArray!0 (select (arr!41942 _keys!1741) from!2144)))))

(declare-fun b!1305430 () Bool)

(declare-fun res!866842 () Bool)

(assert (=> b!1305430 (=> (not res!866842) (not e!744622))))

(assert (=> b!1305430 (= res!866842 e!744623)))

(declare-fun c!125404 () Bool)

(assert (=> b!1305430 (= c!125404 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64460 () Bool)

(declare-fun call!64465 () ListLongMap!20311)

(assert (=> bm!64460 (= call!64465 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305431 () Bool)

(assert (=> b!1305431 (= e!744619 (= (apply!1026 lt!584477 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1305432 () Bool)

(assert (=> b!1305432 (= e!744622 e!744626)))

(declare-fun c!125405 () Bool)

(assert (=> b!1305432 (= c!125405 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305433 () Bool)

(declare-fun e!744621 () ListLongMap!20311)

(assert (=> b!1305433 (= e!744621 call!64467)))

(declare-fun b!1305434 () Bool)

(declare-fun e!744628 () Bool)

(assert (=> b!1305434 (= e!744628 (= (apply!1026 lt!584477 (select (arr!41942 _keys!1741) from!2144)) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305434 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42493 _values!1445)))))

(assert (=> b!1305434 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305435 () Bool)

(assert (=> b!1305435 (= e!744623 (not call!64462))))

(declare-fun bm!64461 () Bool)

(declare-fun call!64464 () ListLongMap!20311)

(assert (=> bm!64461 (= call!64464 call!64465)))

(declare-fun b!1305436 () Bool)

(declare-fun e!744620 () Bool)

(assert (=> b!1305436 (= e!744620 e!744628)))

(declare-fun res!866841 () Bool)

(assert (=> b!1305436 (=> (not res!866841) (not e!744628))))

(assert (=> b!1305436 (= res!866841 (contains!8315 lt!584477 (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> b!1305436 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305437 () Bool)

(declare-fun lt!584488 () Unit!43227)

(assert (=> b!1305437 (= e!744631 lt!584488)))

(declare-fun lt!584475 () ListLongMap!20311)

(assert (=> b!1305437 (= lt!584475 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584486 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584489 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584489 (select (arr!41942 _keys!1741) from!2144))))

(declare-fun lt!584481 () Unit!43227)

(declare-fun addStillContains!1114 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> b!1305437 (= lt!584481 (addStillContains!1114 lt!584475 lt!584486 zeroValue!1387 lt!584489))))

(assert (=> b!1305437 (contains!8315 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387)) lt!584489)))

(declare-fun lt!584492 () Unit!43227)

(assert (=> b!1305437 (= lt!584492 lt!584481)))

(declare-fun lt!584493 () ListLongMap!20311)

(assert (=> b!1305437 (= lt!584493 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584491 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584491 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584482 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584482 (select (arr!41942 _keys!1741) from!2144))))

(declare-fun lt!584494 () Unit!43227)

(declare-fun addApplyDifferent!568 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> b!1305437 (= lt!584494 (addApplyDifferent!568 lt!584493 lt!584491 minValue!1387 lt!584482))))

(assert (=> b!1305437 (= (apply!1026 (+!4491 lt!584493 (tuple2!22655 lt!584491 minValue!1387)) lt!584482) (apply!1026 lt!584493 lt!584482))))

(declare-fun lt!584490 () Unit!43227)

(assert (=> b!1305437 (= lt!584490 lt!584494)))

(declare-fun lt!584483 () ListLongMap!20311)

(assert (=> b!1305437 (= lt!584483 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584479 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584476 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584476 (select (arr!41942 _keys!1741) from!2144))))

(declare-fun lt!584480 () Unit!43227)

(assert (=> b!1305437 (= lt!584480 (addApplyDifferent!568 lt!584483 lt!584479 zeroValue!1387 lt!584476))))

(assert (=> b!1305437 (= (apply!1026 (+!4491 lt!584483 (tuple2!22655 lt!584479 zeroValue!1387)) lt!584476) (apply!1026 lt!584483 lt!584476))))

(declare-fun lt!584474 () Unit!43227)

(assert (=> b!1305437 (= lt!584474 lt!584480)))

(declare-fun lt!584485 () ListLongMap!20311)

(assert (=> b!1305437 (= lt!584485 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584478 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584478 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584487 () (_ BitVec 64))

(assert (=> b!1305437 (= lt!584487 (select (arr!41942 _keys!1741) from!2144))))

(assert (=> b!1305437 (= lt!584488 (addApplyDifferent!568 lt!584485 lt!584478 minValue!1387 lt!584487))))

(assert (=> b!1305437 (= (apply!1026 (+!4491 lt!584485 (tuple2!22655 lt!584478 minValue!1387)) lt!584487) (apply!1026 lt!584485 lt!584487))))

(declare-fun b!1305438 () Bool)

(assert (=> b!1305438 (= e!744630 (+!4491 call!64466 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!64462 () Bool)

(declare-fun call!64463 () ListLongMap!20311)

(assert (=> bm!64462 (= call!64463 call!64464)))

(declare-fun b!1305439 () Bool)

(declare-fun Unit!43238 () Unit!43227)

(assert (=> b!1305439 (= e!744631 Unit!43238)))

(declare-fun b!1305440 () Bool)

(declare-fun res!866836 () Bool)

(assert (=> b!1305440 (=> (not res!866836) (not e!744622))))

(assert (=> b!1305440 (= res!866836 e!744620)))

(declare-fun res!866844 () Bool)

(assert (=> b!1305440 (=> res!866844 e!744620)))

(assert (=> b!1305440 (= res!866844 (not e!744627))))

(declare-fun res!866838 () Bool)

(assert (=> b!1305440 (=> (not res!866838) (not e!744627))))

(assert (=> b!1305440 (= res!866838 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305441 () Bool)

(declare-fun c!125407 () Bool)

(assert (=> b!1305441 (= c!125407 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!744629 () ListLongMap!20311)

(assert (=> b!1305441 (= e!744621 e!744629)))

(declare-fun b!1305442 () Bool)

(assert (=> b!1305442 (= e!744629 call!64463)))

(declare-fun b!1305443 () Bool)

(assert (=> b!1305443 (= e!744624 (= (apply!1026 lt!584477 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1305444 () Bool)

(assert (=> b!1305444 (= e!744629 call!64467)))

(declare-fun c!125402 () Bool)

(declare-fun bm!64463 () Bool)

(assert (=> bm!64463 (= call!64466 (+!4491 (ite c!125406 call!64465 (ite c!125402 call!64464 call!64463)) (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305445 () Bool)

(assert (=> b!1305445 (= e!744626 (not call!64461))))

(declare-fun bm!64464 () Bool)

(assert (=> bm!64464 (= call!64462 (contains!8315 lt!584477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305446 () Bool)

(assert (=> b!1305446 (= e!744630 e!744621)))

(assert (=> b!1305446 (= c!125402 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!142011 c!125406) b!1305438))

(assert (= (and d!142011 (not c!125406)) b!1305446))

(assert (= (and b!1305446 c!125402) b!1305433))

(assert (= (and b!1305446 (not c!125402)) b!1305441))

(assert (= (and b!1305441 c!125407) b!1305444))

(assert (= (and b!1305441 (not c!125407)) b!1305442))

(assert (= (or b!1305444 b!1305442) bm!64462))

(assert (= (or b!1305433 bm!64462) bm!64461))

(assert (= (or b!1305433 b!1305444) bm!64459))

(assert (= (or b!1305438 bm!64461) bm!64460))

(assert (= (or b!1305438 bm!64459) bm!64463))

(assert (= (and d!142011 res!866840) b!1305426))

(assert (= (and d!142011 c!125403) b!1305437))

(assert (= (and d!142011 (not c!125403)) b!1305439))

(assert (= (and d!142011 res!866837) b!1305440))

(assert (= (and b!1305440 res!866838) b!1305429))

(assert (= (and b!1305440 (not res!866844)) b!1305436))

(assert (= (and b!1305436 res!866841) b!1305434))

(assert (= (and b!1305440 res!866836) b!1305430))

(assert (= (and b!1305430 c!125404) b!1305428))

(assert (= (and b!1305430 (not c!125404)) b!1305435))

(assert (= (and b!1305428 res!866839) b!1305431))

(assert (= (or b!1305428 b!1305435) bm!64464))

(assert (= (and b!1305430 res!866842) b!1305432))

(assert (= (and b!1305432 c!125405) b!1305427))

(assert (= (and b!1305432 (not c!125405)) b!1305445))

(assert (= (and b!1305427 res!866843) b!1305443))

(assert (= (or b!1305427 b!1305445) bm!64458))

(declare-fun b_lambda!23343 () Bool)

(assert (=> (not b_lambda!23343) (not b!1305434)))

(assert (=> b!1305434 t!43381))

(declare-fun b_and!47511 () Bool)

(assert (= b_and!47509 (and (=> t!43381 result!23843) b_and!47511)))

(declare-fun m!1196429 () Bool)

(assert (=> bm!64458 m!1196429))

(assert (=> bm!64460 m!1196255))

(assert (=> b!1305436 m!1196275))

(assert (=> b!1305436 m!1196275))

(declare-fun m!1196431 () Bool)

(assert (=> b!1305436 m!1196431))

(declare-fun m!1196433 () Bool)

(assert (=> b!1305437 m!1196433))

(declare-fun m!1196435 () Bool)

(assert (=> b!1305437 m!1196435))

(declare-fun m!1196437 () Bool)

(assert (=> b!1305437 m!1196437))

(assert (=> b!1305437 m!1196275))

(declare-fun m!1196439 () Bool)

(assert (=> b!1305437 m!1196439))

(assert (=> b!1305437 m!1196437))

(declare-fun m!1196441 () Bool)

(assert (=> b!1305437 m!1196441))

(declare-fun m!1196443 () Bool)

(assert (=> b!1305437 m!1196443))

(assert (=> b!1305437 m!1196255))

(declare-fun m!1196445 () Bool)

(assert (=> b!1305437 m!1196445))

(declare-fun m!1196447 () Bool)

(assert (=> b!1305437 m!1196447))

(declare-fun m!1196449 () Bool)

(assert (=> b!1305437 m!1196449))

(assert (=> b!1305437 m!1196439))

(declare-fun m!1196451 () Bool)

(assert (=> b!1305437 m!1196451))

(declare-fun m!1196453 () Bool)

(assert (=> b!1305437 m!1196453))

(assert (=> b!1305437 m!1196433))

(declare-fun m!1196455 () Bool)

(assert (=> b!1305437 m!1196455))

(declare-fun m!1196457 () Bool)

(assert (=> b!1305437 m!1196457))

(declare-fun m!1196459 () Bool)

(assert (=> b!1305437 m!1196459))

(assert (=> b!1305437 m!1196449))

(declare-fun m!1196461 () Bool)

(assert (=> b!1305437 m!1196461))

(assert (=> d!142011 m!1196245))

(declare-fun m!1196463 () Bool)

(assert (=> bm!64464 m!1196463))

(assert (=> b!1305429 m!1196275))

(assert (=> b!1305429 m!1196275))

(assert (=> b!1305429 m!1196277))

(declare-fun m!1196465 () Bool)

(assert (=> b!1305438 m!1196465))

(declare-fun m!1196467 () Bool)

(assert (=> bm!64463 m!1196467))

(declare-fun m!1196469 () Bool)

(assert (=> b!1305443 m!1196469))

(declare-fun m!1196471 () Bool)

(assert (=> b!1305431 m!1196471))

(assert (=> b!1305434 m!1196343))

(assert (=> b!1305434 m!1196341))

(assert (=> b!1305434 m!1196345))

(assert (=> b!1305434 m!1196343))

(assert (=> b!1305434 m!1196341))

(assert (=> b!1305434 m!1196275))

(assert (=> b!1305434 m!1196275))

(declare-fun m!1196473 () Bool)

(assert (=> b!1305434 m!1196473))

(assert (=> b!1305426 m!1196275))

(assert (=> b!1305426 m!1196275))

(assert (=> b!1305426 m!1196277))

(assert (=> b!1305250 d!142011))

(declare-fun d!142013 () Bool)

(assert (=> d!142013 (contains!8315 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) k0!1205)))

(declare-fun lt!584495 () Unit!43227)

(assert (=> d!142013 (= lt!584495 (choose!1936 k0!1205 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)) (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))))

(assert (=> d!142013 (contains!8315 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!142013 (= (lemmaInListMapAfterAddingDiffThenInBefore!93 k0!1205 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)) (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) lt!584495)))

(declare-fun bs!37182 () Bool)

(assert (= bs!37182 d!142013))

(assert (=> bs!37182 m!1196257))

(declare-fun m!1196475 () Bool)

(assert (=> bs!37182 m!1196475))

(declare-fun m!1196477 () Bool)

(assert (=> bs!37182 m!1196477))

(assert (=> bs!37182 m!1196477))

(declare-fun m!1196479 () Bool)

(assert (=> bs!37182 m!1196479))

(assert (=> bm!64395 d!142013))

(declare-fun d!142015 () Bool)

(declare-fun e!744632 () Bool)

(assert (=> d!142015 e!744632))

(declare-fun res!866846 () Bool)

(assert (=> d!142015 (=> (not res!866846) (not e!744632))))

(declare-fun lt!584497 () ListLongMap!20311)

(assert (=> d!142015 (= res!866846 (contains!8315 lt!584497 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584498 () List!29774)

(assert (=> d!142015 (= lt!584497 (ListLongMap!20312 lt!584498))))

(declare-fun lt!584496 () Unit!43227)

(declare-fun lt!584499 () Unit!43227)

(assert (=> d!142015 (= lt!584496 lt!584499)))

(assert (=> d!142015 (= (getValueByKey!709 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142015 (= lt!584499 (lemmaContainsTupThenGetReturnValue!355 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142015 (= lt!584498 (insertStrictlySorted!484 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142015 (= (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584497)))

(declare-fun b!1305447 () Bool)

(declare-fun res!866845 () Bool)

(assert (=> b!1305447 (=> (not res!866845) (not e!744632))))

(assert (=> b!1305447 (= res!866845 (= (getValueByKey!709 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305448 () Bool)

(assert (=> b!1305448 (= e!744632 (contains!8317 (toList!10171 lt!584497) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142015 res!866846) b!1305447))

(assert (= (and b!1305447 res!866845) b!1305448))

(declare-fun m!1196481 () Bool)

(assert (=> d!142015 m!1196481))

(declare-fun m!1196483 () Bool)

(assert (=> d!142015 m!1196483))

(declare-fun m!1196485 () Bool)

(assert (=> d!142015 m!1196485))

(declare-fun m!1196487 () Bool)

(assert (=> d!142015 m!1196487))

(declare-fun m!1196489 () Bool)

(assert (=> b!1305447 m!1196489))

(declare-fun m!1196491 () Bool)

(assert (=> b!1305448 m!1196491))

(assert (=> bm!64397 d!142015))

(declare-fun d!142017 () Bool)

(assert (=> d!142017 (not (contains!8315 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) k0!1205))))

(declare-fun lt!584500 () Unit!43227)

(assert (=> d!142017 (= lt!584500 (choose!1935 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun e!744633 () Bool)

(assert (=> d!142017 e!744633))

(declare-fun res!866847 () Bool)

(assert (=> d!142017 (=> (not res!866847) (not e!744633))))

(assert (=> d!142017 (= res!866847 (not (contains!8315 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) k0!1205)))))

(assert (=> d!142017 (= (addStillNotContains!488 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387) k0!1205) lt!584500)))

(declare-fun b!1305449 () Bool)

(assert (=> b!1305449 (= e!744633 (not (= (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) k0!1205)))))

(assert (= (and d!142017 res!866847) b!1305449))

(declare-fun m!1196493 () Bool)

(assert (=> d!142017 m!1196493))

(assert (=> d!142017 m!1196493))

(declare-fun m!1196495 () Bool)

(assert (=> d!142017 m!1196495))

(declare-fun m!1196497 () Bool)

(assert (=> d!142017 m!1196497))

(declare-fun m!1196499 () Bool)

(assert (=> d!142017 m!1196499))

(assert (=> bm!64401 d!142017))

(declare-fun bm!64467 () Bool)

(declare-fun call!64470 () Bool)

(declare-fun c!125410 () Bool)

(assert (=> bm!64467 (= call!64470 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125410 (Cons!29771 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) Nil!29772) Nil!29772)))))

(declare-fun b!1305460 () Bool)

(declare-fun e!744644 () Bool)

(assert (=> b!1305460 (= e!744644 call!64470)))

(declare-fun b!1305461 () Bool)

(declare-fun e!744643 () Bool)

(declare-fun e!744642 () Bool)

(assert (=> b!1305461 (= e!744643 e!744642)))

(declare-fun res!866854 () Bool)

(assert (=> b!1305461 (=> (not res!866854) (not e!744642))))

(declare-fun e!744645 () Bool)

(assert (=> b!1305461 (= res!866854 (not e!744645))))

(declare-fun res!866856 () Bool)

(assert (=> b!1305461 (=> (not res!866856) (not e!744645))))

(assert (=> b!1305461 (= res!866856 (validKeyInArray!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142019 () Bool)

(declare-fun res!866855 () Bool)

(assert (=> d!142019 (=> res!866855 e!744643)))

(assert (=> d!142019 (= res!866855 (bvsge #b00000000000000000000000000000000 (size!42492 _keys!1741)))))

(assert (=> d!142019 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29772) e!744643)))

(declare-fun b!1305462 () Bool)

(declare-fun contains!8318 (List!29775 (_ BitVec 64)) Bool)

(assert (=> b!1305462 (= e!744645 (contains!8318 Nil!29772 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305463 () Bool)

(assert (=> b!1305463 (= e!744644 call!64470)))

(declare-fun b!1305464 () Bool)

(assert (=> b!1305464 (= e!744642 e!744644)))

(assert (=> b!1305464 (= c!125410 (validKeyInArray!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142019 (not res!866855)) b!1305461))

(assert (= (and b!1305461 res!866856) b!1305462))

(assert (= (and b!1305461 res!866854) b!1305464))

(assert (= (and b!1305464 c!125410) b!1305463))

(assert (= (and b!1305464 (not c!125410)) b!1305460))

(assert (= (or b!1305463 b!1305460) bm!64467))

(assert (=> bm!64467 m!1196411))

(declare-fun m!1196501 () Bool)

(assert (=> bm!64467 m!1196501))

(assert (=> b!1305461 m!1196411))

(assert (=> b!1305461 m!1196411))

(assert (=> b!1305461 m!1196419))

(assert (=> b!1305462 m!1196411))

(assert (=> b!1305462 m!1196411))

(declare-fun m!1196503 () Bool)

(assert (=> b!1305462 m!1196503))

(assert (=> b!1305464 m!1196411))

(assert (=> b!1305464 m!1196411))

(assert (=> b!1305464 m!1196419))

(assert (=> b!1305240 d!142019))

(declare-fun b!1305471 () Bool)

(declare-fun e!744651 () Bool)

(assert (=> b!1305471 (= e!744651 tp_is_empty!34947)))

(declare-fun mapIsEmpty!54033 () Bool)

(declare-fun mapRes!54033 () Bool)

(assert (=> mapIsEmpty!54033 mapRes!54033))

(declare-fun condMapEmpty!54033 () Bool)

(declare-fun mapDefault!54033 () ValueCell!16575)

(assert (=> mapNonEmpty!54027 (= condMapEmpty!54033 (= mapRest!54027 ((as const (Array (_ BitVec 32) ValueCell!16575)) mapDefault!54033)))))

(declare-fun e!744650 () Bool)

(assert (=> mapNonEmpty!54027 (= tp!103085 (and e!744650 mapRes!54033))))

(declare-fun b!1305472 () Bool)

(assert (=> b!1305472 (= e!744650 tp_is_empty!34947)))

(declare-fun mapNonEmpty!54033 () Bool)

(declare-fun tp!103095 () Bool)

(assert (=> mapNonEmpty!54033 (= mapRes!54033 (and tp!103095 e!744651))))

(declare-fun mapRest!54033 () (Array (_ BitVec 32) ValueCell!16575))

(declare-fun mapKey!54033 () (_ BitVec 32))

(declare-fun mapValue!54033 () ValueCell!16575)

(assert (=> mapNonEmpty!54033 (= mapRest!54027 (store mapRest!54033 mapKey!54033 mapValue!54033))))

(assert (= (and mapNonEmpty!54027 condMapEmpty!54033) mapIsEmpty!54033))

(assert (= (and mapNonEmpty!54027 (not condMapEmpty!54033)) mapNonEmpty!54033))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16575) mapValue!54033)) b!1305471))

(assert (= (and mapNonEmpty!54027 ((_ is ValueCellFull!16575) mapDefault!54033)) b!1305472))

(declare-fun m!1196505 () Bool)

(assert (=> mapNonEmpty!54033 m!1196505))

(declare-fun b_lambda!23345 () Bool)

(assert (= b_lambda!23339 (or (and start!110260 b_free!29307) b_lambda!23345)))

(declare-fun b_lambda!23347 () Bool)

(assert (= b_lambda!23343 (or (and start!110260 b_free!29307) b_lambda!23347)))

(declare-fun b_lambda!23349 () Bool)

(assert (= b_lambda!23341 (or (and start!110260 b_free!29307) b_lambda!23349)))

(check-sat (not b!1305368) (not bm!64440) (not b!1305438) (not b!1305429) (not b!1305309) (not b!1305383) (not bm!64463) (not d!142015) (not b!1305346) (not b!1305448) (not b!1305436) (not b!1305336) (not bm!64458) (not d!142011) (not bm!64467) (not d!142001) (not d!141999) (not b!1305431) (not b!1305337) (not d!141981) (not b!1305364) (not b!1305426) (not d!141995) (not mapNonEmpty!54033) (not b_next!29307) (not b!1305338) (not b!1305380) (not d!141983) (not b!1305347) (not bm!64464) (not b_lambda!23349) (not b!1305340) (not d!142017) (not d!142003) (not b!1305462) (not b_lambda!23347) (not b_lambda!23345) (not b!1305464) (not d!141997) (not d!142013) b_and!47511 (not b!1305381) (not b!1305437) tp_is_empty!34947 (not bm!64460) (not b!1305359) (not b!1305365) (not d!141993) (not bm!64443) (not b!1305377) (not d!141991) (not b!1305434) (not b!1305443) (not b!1305352) (not b!1305461) (not b!1305344) (not b!1305357) (not d!142009) (not b!1305366) (not b!1305342) (not b!1305447) (not b!1305350) (not b!1305311))
(check-sat b_and!47511 (not b_next!29307))
(get-model)

(assert (=> d!142011 d!141985))

(declare-fun d!142021 () Bool)

(declare-fun res!866861 () Bool)

(declare-fun e!744656 () Bool)

(assert (=> d!142021 (=> res!866861 e!744656)))

(assert (=> d!142021 (= res!866861 (and ((_ is Cons!29770) (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142021 (= (containsKey!731 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744656)))

(declare-fun b!1305477 () Bool)

(declare-fun e!744657 () Bool)

(assert (=> b!1305477 (= e!744656 e!744657)))

(declare-fun res!866862 () Bool)

(assert (=> b!1305477 (=> (not res!866862) (not e!744657))))

(assert (=> b!1305477 (= res!866862 (and (or (not ((_ is Cons!29770) (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29770) (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305478 () Bool)

(assert (=> b!1305478 (= e!744657 (containsKey!731 (t!43376 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142021 (not res!866861)) b!1305477))

(assert (= (and b!1305477 res!866862) b!1305478))

(declare-fun m!1196507 () Bool)

(assert (=> b!1305478 m!1196507))

(assert (=> d!142009 d!142021))

(declare-fun bm!64468 () Bool)

(declare-fun call!64471 () Bool)

(assert (=> bm!64468 (= call!64471 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305479 () Bool)

(declare-fun e!744660 () Bool)

(declare-fun e!744659 () Bool)

(assert (=> b!1305479 (= e!744660 e!744659)))

(declare-fun lt!584502 () (_ BitVec 64))

(assert (=> b!1305479 (= lt!584502 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!584503 () Unit!43227)

(assert (=> b!1305479 (= lt!584503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584502 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1305479 (arrayContainsKey!0 _keys!1741 lt!584502 #b00000000000000000000000000000000)))

(declare-fun lt!584501 () Unit!43227)

(assert (=> b!1305479 (= lt!584501 lt!584503)))

(declare-fun res!866863 () Bool)

(assert (=> b!1305479 (= res!866863 (= (seekEntryOrOpen!0 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10029 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1305479 (=> (not res!866863) (not e!744659))))

(declare-fun d!142023 () Bool)

(declare-fun res!866864 () Bool)

(declare-fun e!744658 () Bool)

(assert (=> d!142023 (=> res!866864 e!744658)))

(assert (=> d!142023 (= res!866864 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142023 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!744658)))

(declare-fun b!1305480 () Bool)

(assert (=> b!1305480 (= e!744660 call!64471)))

(declare-fun b!1305481 () Bool)

(assert (=> b!1305481 (= e!744659 call!64471)))

(declare-fun b!1305482 () Bool)

(assert (=> b!1305482 (= e!744658 e!744660)))

(declare-fun c!125411 () Bool)

(assert (=> b!1305482 (= c!125411 (validKeyInArray!0 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142023 (not res!866864)) b!1305482))

(assert (= (and b!1305482 c!125411) b!1305479))

(assert (= (and b!1305482 (not c!125411)) b!1305480))

(assert (= (and b!1305479 res!866863) b!1305481))

(assert (= (or b!1305481 b!1305480) bm!64468))

(declare-fun m!1196509 () Bool)

(assert (=> bm!64468 m!1196509))

(declare-fun m!1196511 () Bool)

(assert (=> b!1305479 m!1196511))

(declare-fun m!1196513 () Bool)

(assert (=> b!1305479 m!1196513))

(declare-fun m!1196515 () Bool)

(assert (=> b!1305479 m!1196515))

(assert (=> b!1305479 m!1196511))

(declare-fun m!1196517 () Bool)

(assert (=> b!1305479 m!1196517))

(assert (=> b!1305482 m!1196511))

(assert (=> b!1305482 m!1196511))

(declare-fun m!1196519 () Bool)

(assert (=> b!1305482 m!1196519))

(assert (=> bm!64443 d!142023))

(declare-fun d!142025 () Bool)

(declare-fun e!744661 () Bool)

(assert (=> d!142025 e!744661))

(declare-fun res!866865 () Bool)

(assert (=> d!142025 (=> res!866865 e!744661)))

(declare-fun lt!584507 () Bool)

(assert (=> d!142025 (= res!866865 (not lt!584507))))

(declare-fun lt!584506 () Bool)

(assert (=> d!142025 (= lt!584507 lt!584506)))

(declare-fun lt!584504 () Unit!43227)

(declare-fun e!744662 () Unit!43227)

(assert (=> d!142025 (= lt!584504 e!744662)))

(declare-fun c!125412 () Bool)

(assert (=> d!142025 (= c!125412 lt!584506)))

(assert (=> d!142025 (= lt!584506 (containsKey!731 (toList!10171 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376))) lt!584380))))

(assert (=> d!142025 (= (contains!8315 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376)) lt!584380) lt!584507)))

(declare-fun b!1305483 () Bool)

(declare-fun lt!584505 () Unit!43227)

(assert (=> b!1305483 (= e!744662 lt!584505)))

(assert (=> b!1305483 (= lt!584505 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376))) lt!584380))))

(assert (=> b!1305483 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376))) lt!584380))))

(declare-fun b!1305484 () Bool)

(declare-fun Unit!43239 () Unit!43227)

(assert (=> b!1305484 (= e!744662 Unit!43239)))

(declare-fun b!1305485 () Bool)

(assert (=> b!1305485 (= e!744661 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376))) lt!584380)))))

(assert (= (and d!142025 c!125412) b!1305483))

(assert (= (and d!142025 (not c!125412)) b!1305484))

(assert (= (and d!142025 (not res!866865)) b!1305485))

(declare-fun m!1196521 () Bool)

(assert (=> d!142025 m!1196521))

(declare-fun m!1196523 () Bool)

(assert (=> b!1305483 m!1196523))

(declare-fun m!1196525 () Bool)

(assert (=> b!1305483 m!1196525))

(assert (=> b!1305483 m!1196525))

(declare-fun m!1196527 () Bool)

(assert (=> b!1305483 m!1196527))

(assert (=> b!1305485 m!1196525))

(assert (=> b!1305485 m!1196525))

(assert (=> b!1305485 m!1196527))

(assert (=> b!1305342 d!142025))

(declare-fun d!142027 () Bool)

(assert (=> d!142027 (not (contains!8315 (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376)) lt!584380))))

(declare-fun lt!584508 () Unit!43227)

(assert (=> d!142027 (= lt!584508 (choose!1935 lt!584377 lt!584378 lt!584376 lt!584380))))

(declare-fun e!744663 () Bool)

(assert (=> d!142027 e!744663))

(declare-fun res!866866 () Bool)

(assert (=> d!142027 (=> (not res!866866) (not e!744663))))

(assert (=> d!142027 (= res!866866 (not (contains!8315 lt!584377 lt!584380)))))

(assert (=> d!142027 (= (addStillNotContains!488 lt!584377 lt!584378 lt!584376 lt!584380) lt!584508)))

(declare-fun b!1305486 () Bool)

(assert (=> b!1305486 (= e!744663 (not (= lt!584378 lt!584380)))))

(assert (= (and d!142027 res!866866) b!1305486))

(assert (=> d!142027 m!1196351))

(assert (=> d!142027 m!1196351))

(assert (=> d!142027 m!1196355))

(declare-fun m!1196529 () Bool)

(assert (=> d!142027 m!1196529))

(declare-fun m!1196531 () Bool)

(assert (=> d!142027 m!1196531))

(assert (=> b!1305342 d!142027))

(declare-fun d!142029 () Bool)

(declare-fun e!744664 () Bool)

(assert (=> d!142029 e!744664))

(declare-fun res!866868 () Bool)

(assert (=> d!142029 (=> (not res!866868) (not e!744664))))

(declare-fun lt!584510 () ListLongMap!20311)

(assert (=> d!142029 (= res!866868 (contains!8315 lt!584510 (_1!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!584511 () List!29774)

(assert (=> d!142029 (= lt!584510 (ListLongMap!20312 lt!584511))))

(declare-fun lt!584509 () Unit!43227)

(declare-fun lt!584512 () Unit!43227)

(assert (=> d!142029 (= lt!584509 lt!584512)))

(assert (=> d!142029 (= (getValueByKey!709 lt!584511 (_1!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!760 (_2!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142029 (= lt!584512 (lemmaContainsTupThenGetReturnValue!355 lt!584511 (_1!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142029 (= lt!584511 (insertStrictlySorted!484 (toList!10171 call!64443) (_1!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142029 (= (+!4491 call!64443 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!584510)))

(declare-fun b!1305487 () Bool)

(declare-fun res!866867 () Bool)

(assert (=> b!1305487 (=> (not res!866867) (not e!744664))))

(assert (=> b!1305487 (= res!866867 (= (getValueByKey!709 (toList!10171 lt!584510) (_1!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!760 (_2!11338 (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1305488 () Bool)

(assert (=> b!1305488 (= e!744664 (contains!8317 (toList!10171 lt!584510) (tuple2!22655 (select (arr!41942 _keys!1741) from!2144) (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142029 res!866868) b!1305487))

(assert (= (and b!1305487 res!866867) b!1305488))

(declare-fun m!1196533 () Bool)

(assert (=> d!142029 m!1196533))

(declare-fun m!1196535 () Bool)

(assert (=> d!142029 m!1196535))

(declare-fun m!1196537 () Bool)

(assert (=> d!142029 m!1196537))

(declare-fun m!1196539 () Bool)

(assert (=> d!142029 m!1196539))

(declare-fun m!1196541 () Bool)

(assert (=> b!1305487 m!1196541))

(declare-fun m!1196543 () Bool)

(assert (=> b!1305488 m!1196543))

(assert (=> b!1305342 d!142029))

(declare-fun d!142031 () Bool)

(declare-fun e!744665 () Bool)

(assert (=> d!142031 e!744665))

(declare-fun res!866870 () Bool)

(assert (=> d!142031 (=> (not res!866870) (not e!744665))))

(declare-fun lt!584514 () ListLongMap!20311)

(assert (=> d!142031 (= res!866870 (contains!8315 lt!584514 (_1!11338 (tuple2!22655 lt!584378 lt!584376))))))

(declare-fun lt!584515 () List!29774)

(assert (=> d!142031 (= lt!584514 (ListLongMap!20312 lt!584515))))

(declare-fun lt!584513 () Unit!43227)

(declare-fun lt!584516 () Unit!43227)

(assert (=> d!142031 (= lt!584513 lt!584516)))

(assert (=> d!142031 (= (getValueByKey!709 lt!584515 (_1!11338 (tuple2!22655 lt!584378 lt!584376))) (Some!760 (_2!11338 (tuple2!22655 lt!584378 lt!584376))))))

(assert (=> d!142031 (= lt!584516 (lemmaContainsTupThenGetReturnValue!355 lt!584515 (_1!11338 (tuple2!22655 lt!584378 lt!584376)) (_2!11338 (tuple2!22655 lt!584378 lt!584376))))))

(assert (=> d!142031 (= lt!584515 (insertStrictlySorted!484 (toList!10171 lt!584377) (_1!11338 (tuple2!22655 lt!584378 lt!584376)) (_2!11338 (tuple2!22655 lt!584378 lt!584376))))))

(assert (=> d!142031 (= (+!4491 lt!584377 (tuple2!22655 lt!584378 lt!584376)) lt!584514)))

(declare-fun b!1305489 () Bool)

(declare-fun res!866869 () Bool)

(assert (=> b!1305489 (=> (not res!866869) (not e!744665))))

(assert (=> b!1305489 (= res!866869 (= (getValueByKey!709 (toList!10171 lt!584514) (_1!11338 (tuple2!22655 lt!584378 lt!584376))) (Some!760 (_2!11338 (tuple2!22655 lt!584378 lt!584376)))))))

(declare-fun b!1305490 () Bool)

(assert (=> b!1305490 (= e!744665 (contains!8317 (toList!10171 lt!584514) (tuple2!22655 lt!584378 lt!584376)))))

(assert (= (and d!142031 res!866870) b!1305489))

(assert (= (and b!1305489 res!866869) b!1305490))

(declare-fun m!1196545 () Bool)

(assert (=> d!142031 m!1196545))

(declare-fun m!1196547 () Bool)

(assert (=> d!142031 m!1196547))

(declare-fun m!1196549 () Bool)

(assert (=> d!142031 m!1196549))

(declare-fun m!1196551 () Bool)

(assert (=> d!142031 m!1196551))

(declare-fun m!1196553 () Bool)

(assert (=> b!1305489 m!1196553))

(declare-fun m!1196555 () Bool)

(assert (=> b!1305490 m!1196555))

(assert (=> b!1305342 d!142031))

(declare-fun d!142033 () Bool)

(declare-fun c!125415 () Bool)

(assert (=> d!142033 (= c!125415 ((_ is ValueCellFull!16575) (select (arr!41943 _values!1445) from!2144)))))

(declare-fun e!744668 () V!51699)

(assert (=> d!142033 (= (get!21188 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!744668)))

(declare-fun b!1305495 () Bool)

(declare-fun get!21189 (ValueCell!16575 V!51699) V!51699)

(assert (=> b!1305495 (= e!744668 (get!21189 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305496 () Bool)

(declare-fun get!21190 (ValueCell!16575 V!51699) V!51699)

(assert (=> b!1305496 (= e!744668 (get!21190 (select (arr!41943 _values!1445) from!2144) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142033 c!125415) b!1305495))

(assert (= (and d!142033 (not c!125415)) b!1305496))

(assert (=> b!1305495 m!1196343))

(assert (=> b!1305495 m!1196341))

(declare-fun m!1196557 () Bool)

(assert (=> b!1305495 m!1196557))

(assert (=> b!1305496 m!1196343))

(assert (=> b!1305496 m!1196341))

(declare-fun m!1196559 () Bool)

(assert (=> b!1305496 m!1196559))

(assert (=> b!1305342 d!142033))

(declare-fun d!142035 () Bool)

(assert (=> d!142035 (= (validKeyInArray!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305380 d!142035))

(declare-fun d!142037 () Bool)

(declare-fun isEmpty!1071 (Option!761) Bool)

(assert (=> d!142037 (= (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205)) (not (isEmpty!1071 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))))

(declare-fun bs!37183 () Bool)

(assert (= bs!37183 d!142037))

(assert (=> bs!37183 m!1196331))

(declare-fun m!1196561 () Bool)

(assert (=> bs!37183 m!1196561))

(assert (=> b!1305311 d!142037))

(declare-fun e!744674 () Option!761)

(declare-fun b!1305507 () Bool)

(assert (=> b!1305507 (= e!744674 (getValueByKey!709 (t!43376 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) k0!1205))))

(declare-fun b!1305506 () Bool)

(declare-fun e!744673 () Option!761)

(assert (=> b!1305506 (= e!744673 e!744674)))

(declare-fun c!125421 () Bool)

(assert (=> b!1305506 (= c!125421 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) (not (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) k0!1205))))))

(declare-fun b!1305508 () Bool)

(assert (=> b!1305508 (= e!744674 None!759)))

(declare-fun d!142039 () Bool)

(declare-fun c!125420 () Bool)

(assert (=> d!142039 (= c!125420 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) k0!1205)))))

(assert (=> d!142039 (= (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205) e!744673)))

(declare-fun b!1305505 () Bool)

(assert (=> b!1305505 (= e!744673 (Some!760 (_2!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))))))))

(assert (= (and d!142039 c!125420) b!1305505))

(assert (= (and d!142039 (not c!125420)) b!1305506))

(assert (= (and b!1305506 c!125421) b!1305507))

(assert (= (and b!1305506 (not c!125421)) b!1305508))

(declare-fun m!1196563 () Bool)

(assert (=> b!1305507 m!1196563))

(assert (=> b!1305311 d!142039))

(declare-fun b!1305509 () Bool)

(declare-fun e!744679 () Bool)

(assert (=> b!1305509 (= e!744679 (validKeyInArray!0 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305509 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!64469 () Bool)

(declare-fun call!64472 () ListLongMap!20311)

(assert (=> bm!64469 (= call!64472 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305510 () Bool)

(declare-fun e!744677 () ListLongMap!20311)

(declare-fun e!744675 () ListLongMap!20311)

(assert (=> b!1305510 (= e!744677 e!744675)))

(declare-fun c!125424 () Bool)

(assert (=> b!1305510 (= c!125424 (validKeyInArray!0 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1305511 () Bool)

(declare-fun e!744676 () Bool)

(declare-fun lt!584520 () ListLongMap!20311)

(assert (=> b!1305511 (= e!744676 (isEmpty!1070 lt!584520))))

(declare-fun b!1305512 () Bool)

(assert (=> b!1305512 (= e!744675 call!64472)))

(declare-fun b!1305513 () Bool)

(declare-fun e!744678 () Bool)

(declare-fun e!744680 () Bool)

(assert (=> b!1305513 (= e!744678 e!744680)))

(assert (=> b!1305513 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun res!866872 () Bool)

(assert (=> b!1305513 (= res!866872 (contains!8315 lt!584520 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305513 (=> (not res!866872) (not e!744680))))

(declare-fun d!142041 () Bool)

(declare-fun e!744681 () Bool)

(assert (=> d!142041 e!744681))

(declare-fun res!866874 () Bool)

(assert (=> d!142041 (=> (not res!866874) (not e!744681))))

(assert (=> d!142041 (= res!866874 (not (contains!8315 lt!584520 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142041 (= lt!584520 e!744677)))

(declare-fun c!125423 () Bool)

(assert (=> d!142041 (= c!125423 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142041 (validMask!0 mask!2175)))

(assert (=> d!142041 (= (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!584520)))

(declare-fun b!1305514 () Bool)

(assert (=> b!1305514 (= e!744681 e!744678)))

(declare-fun c!125422 () Bool)

(assert (=> b!1305514 (= c!125422 e!744679)))

(declare-fun res!866873 () Bool)

(assert (=> b!1305514 (=> (not res!866873) (not e!744679))))

(assert (=> b!1305514 (= res!866873 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305515 () Bool)

(declare-fun lt!584522 () Unit!43227)

(declare-fun lt!584523 () Unit!43227)

(assert (=> b!1305515 (= lt!584522 lt!584523)))

(declare-fun lt!584518 () ListLongMap!20311)

(declare-fun lt!584521 () (_ BitVec 64))

(declare-fun lt!584517 () V!51699)

(declare-fun lt!584519 () (_ BitVec 64))

(assert (=> b!1305515 (not (contains!8315 (+!4491 lt!584518 (tuple2!22655 lt!584519 lt!584517)) lt!584521))))

(assert (=> b!1305515 (= lt!584523 (addStillNotContains!488 lt!584518 lt!584519 lt!584517 lt!584521))))

(assert (=> b!1305515 (= lt!584521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305515 (= lt!584517 (get!21188 (select (arr!41943 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305515 (= lt!584519 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1305515 (= lt!584518 call!64472)))

(assert (=> b!1305515 (= e!744675 (+!4491 call!64472 (tuple2!22655 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21188 (select (arr!41943 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305516 () Bool)

(assert (=> b!1305516 (= e!744678 e!744676)))

(declare-fun c!125425 () Bool)

(assert (=> b!1305516 (= c!125425 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305517 () Bool)

(assert (=> b!1305517 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> b!1305517 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42493 _values!1445)))))

(assert (=> b!1305517 (= e!744680 (= (apply!1026 lt!584520 (select (arr!41942 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21188 (select (arr!41943 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3433 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305518 () Bool)

(assert (=> b!1305518 (= e!744677 (ListLongMap!20312 Nil!29771))))

(declare-fun b!1305519 () Bool)

(assert (=> b!1305519 (= e!744676 (= lt!584520 (getCurrentListMapNoExtraKeys!6127 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305520 () Bool)

(declare-fun res!866871 () Bool)

(assert (=> b!1305520 (=> (not res!866871) (not e!744681))))

(assert (=> b!1305520 (= res!866871 (not (contains!8315 lt!584520 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142041 c!125423) b!1305518))

(assert (= (and d!142041 (not c!125423)) b!1305510))

(assert (= (and b!1305510 c!125424) b!1305515))

(assert (= (and b!1305510 (not c!125424)) b!1305512))

(assert (= (or b!1305515 b!1305512) bm!64469))

(assert (= (and d!142041 res!866874) b!1305520))

(assert (= (and b!1305520 res!866871) b!1305514))

(assert (= (and b!1305514 res!866873) b!1305509))

(assert (= (and b!1305514 c!125422) b!1305513))

(assert (= (and b!1305514 (not c!125422)) b!1305516))

(assert (= (and b!1305513 res!866872) b!1305517))

(assert (= (and b!1305516 c!125425) b!1305519))

(assert (= (and b!1305516 (not c!125425)) b!1305511))

(declare-fun b_lambda!23351 () Bool)

(assert (=> (not b_lambda!23351) (not b!1305515)))

(assert (=> b!1305515 t!43381))

(declare-fun b_and!47513 () Bool)

(assert (= b_and!47511 (and (=> t!43381 result!23843) b_and!47513)))

(declare-fun b_lambda!23353 () Bool)

(assert (=> (not b_lambda!23353) (not b!1305517)))

(assert (=> b!1305517 t!43381))

(declare-fun b_and!47515 () Bool)

(assert (= b_and!47513 (and (=> t!43381 result!23843) b_and!47515)))

(declare-fun m!1196565 () Bool)

(assert (=> d!142041 m!1196565))

(assert (=> d!142041 m!1196245))

(declare-fun m!1196567 () Bool)

(assert (=> b!1305519 m!1196567))

(declare-fun m!1196569 () Bool)

(assert (=> b!1305517 m!1196569))

(declare-fun m!1196571 () Bool)

(assert (=> b!1305517 m!1196571))

(assert (=> b!1305517 m!1196341))

(assert (=> b!1305517 m!1196569))

(declare-fun m!1196573 () Bool)

(assert (=> b!1305517 m!1196573))

(assert (=> b!1305517 m!1196573))

(assert (=> b!1305517 m!1196341))

(declare-fun m!1196575 () Bool)

(assert (=> b!1305517 m!1196575))

(assert (=> bm!64469 m!1196567))

(assert (=> b!1305509 m!1196569))

(assert (=> b!1305509 m!1196569))

(declare-fun m!1196577 () Bool)

(assert (=> b!1305509 m!1196577))

(assert (=> b!1305513 m!1196569))

(assert (=> b!1305513 m!1196569))

(declare-fun m!1196579 () Bool)

(assert (=> b!1305513 m!1196579))

(declare-fun m!1196581 () Bool)

(assert (=> b!1305515 m!1196581))

(declare-fun m!1196583 () Bool)

(assert (=> b!1305515 m!1196583))

(declare-fun m!1196585 () Bool)

(assert (=> b!1305515 m!1196585))

(assert (=> b!1305515 m!1196583))

(declare-fun m!1196587 () Bool)

(assert (=> b!1305515 m!1196587))

(assert (=> b!1305515 m!1196341))

(assert (=> b!1305515 m!1196569))

(assert (=> b!1305515 m!1196573))

(assert (=> b!1305515 m!1196573))

(assert (=> b!1305515 m!1196341))

(assert (=> b!1305515 m!1196575))

(declare-fun m!1196589 () Bool)

(assert (=> b!1305520 m!1196589))

(assert (=> b!1305510 m!1196569))

(assert (=> b!1305510 m!1196569))

(assert (=> b!1305510 m!1196577))

(declare-fun m!1196591 () Bool)

(assert (=> b!1305511 m!1196591))

(assert (=> b!1305346 d!142041))

(declare-fun d!142043 () Bool)

(assert (=> d!142043 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(declare-fun lt!584526 () Unit!43227)

(declare-fun choose!1938 (List!29774 (_ BitVec 64)) Unit!43227)

(assert (=> d!142043 (= lt!584526 (choose!1938 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(declare-fun e!744684 () Bool)

(assert (=> d!142043 e!744684))

(declare-fun res!866877 () Bool)

(assert (=> d!142043 (=> (not res!866877) (not e!744684))))

(declare-fun isStrictlySorted!874 (List!29774) Bool)

(assert (=> d!142043 (= res!866877 (isStrictlySorted!874 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))))))

(assert (=> d!142043 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205) lt!584526)))

(declare-fun b!1305523 () Bool)

(assert (=> b!1305523 (= e!744684 (containsKey!731 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(assert (= (and d!142043 res!866877) b!1305523))

(assert (=> d!142043 m!1196331))

(assert (=> d!142043 m!1196331))

(assert (=> d!142043 m!1196333))

(declare-fun m!1196593 () Bool)

(assert (=> d!142043 m!1196593))

(declare-fun m!1196595 () Bool)

(assert (=> d!142043 m!1196595))

(assert (=> b!1305523 m!1196327))

(assert (=> b!1305309 d!142043))

(assert (=> b!1305309 d!142037))

(assert (=> b!1305309 d!142039))

(declare-fun d!142045 () Bool)

(declare-fun get!21191 (Option!761) V!51699)

(assert (=> d!142045 (= (apply!1026 lt!584379 (select (arr!41942 _keys!1741) from!2144)) (get!21191 (getValueByKey!709 (toList!10171 lt!584379) (select (arr!41942 _keys!1741) from!2144))))))

(declare-fun bs!37184 () Bool)

(assert (= bs!37184 d!142045))

(assert (=> bs!37184 m!1196275))

(declare-fun m!1196597 () Bool)

(assert (=> bs!37184 m!1196597))

(assert (=> bs!37184 m!1196597))

(declare-fun m!1196599 () Bool)

(assert (=> bs!37184 m!1196599))

(assert (=> b!1305344 d!142045))

(assert (=> b!1305344 d!142033))

(declare-fun d!142047 () Bool)

(declare-fun lt!584529 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!648 (List!29774) (InoxSet tuple2!22654))

(assert (=> d!142047 (= lt!584529 (select (content!648 (toList!10171 lt!584497)) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!744689 () Bool)

(assert (=> d!142047 (= lt!584529 e!744689)))

(declare-fun res!866882 () Bool)

(assert (=> d!142047 (=> (not res!866882) (not e!744689))))

(assert (=> d!142047 (= res!866882 ((_ is Cons!29770) (toList!10171 lt!584497)))))

(assert (=> d!142047 (= (contains!8317 (toList!10171 lt!584497) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584529)))

(declare-fun b!1305528 () Bool)

(declare-fun e!744690 () Bool)

(assert (=> b!1305528 (= e!744689 e!744690)))

(declare-fun res!866883 () Bool)

(assert (=> b!1305528 (=> res!866883 e!744690)))

(assert (=> b!1305528 (= res!866883 (= (h!30979 (toList!10171 lt!584497)) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305529 () Bool)

(assert (=> b!1305529 (= e!744690 (contains!8317 (t!43376 (toList!10171 lt!584497)) (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142047 res!866882) b!1305528))

(assert (= (and b!1305528 (not res!866883)) b!1305529))

(declare-fun m!1196601 () Bool)

(assert (=> d!142047 m!1196601))

(declare-fun m!1196603 () Bool)

(assert (=> d!142047 m!1196603))

(declare-fun m!1196605 () Bool)

(assert (=> b!1305529 m!1196605))

(assert (=> b!1305448 d!142047))

(declare-fun d!142049 () Bool)

(declare-fun isEmpty!1072 (List!29774) Bool)

(assert (=> d!142049 (= (isEmpty!1070 lt!584379) (isEmpty!1072 (toList!10171 lt!584379)))))

(declare-fun bs!37185 () Bool)

(assert (= bs!37185 d!142049))

(declare-fun m!1196607 () Bool)

(assert (=> bs!37185 m!1196607))

(assert (=> b!1305338 d!142049))

(declare-fun d!142051 () Bool)

(assert (=> d!142051 (= (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)) (not (isEmpty!1071 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))))

(declare-fun bs!37186 () Bool)

(assert (= bs!37186 d!142051))

(assert (=> bs!37186 m!1196377))

(declare-fun m!1196609 () Bool)

(assert (=> bs!37186 m!1196609))

(assert (=> b!1305359 d!142051))

(declare-fun b!1305532 () Bool)

(declare-fun e!744692 () Option!761)

(assert (=> b!1305532 (= e!744692 (getValueByKey!709 (t!43376 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(declare-fun b!1305531 () Bool)

(declare-fun e!744691 () Option!761)

(assert (=> b!1305531 (= e!744691 e!744692)))

(declare-fun c!125427 () Bool)

(assert (=> b!1305531 (= c!125427 (and ((_ is Cons!29770) (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (not (= (_1!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205))))))

(declare-fun b!1305533 () Bool)

(assert (=> b!1305533 (= e!744692 None!759)))

(declare-fun c!125426 () Bool)

(declare-fun d!142053 () Bool)

(assert (=> d!142053 (= c!125426 (and ((_ is Cons!29770) (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(assert (=> d!142053 (= (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!744691)))

(declare-fun b!1305530 () Bool)

(assert (=> b!1305530 (= e!744691 (Some!760 (_2!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(assert (= (and d!142053 c!125426) b!1305530))

(assert (= (and d!142053 (not c!125426)) b!1305531))

(assert (= (and b!1305531 c!125427) b!1305532))

(assert (= (and b!1305531 (not c!125427)) b!1305533))

(declare-fun m!1196611 () Bool)

(assert (=> b!1305532 m!1196611))

(assert (=> b!1305359 d!142053))

(assert (=> bm!64440 d!142041))

(declare-fun d!142055 () Bool)

(assert (=> d!142055 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun lt!584530 () Unit!43227)

(assert (=> d!142055 (= lt!584530 (choose!1938 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun e!744693 () Bool)

(assert (=> d!142055 e!744693))

(declare-fun res!866884 () Bool)

(assert (=> d!142055 (=> (not res!866884) (not e!744693))))

(assert (=> d!142055 (= res!866884 (isStrictlySorted!874 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142055 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) lt!584530)))

(declare-fun b!1305534 () Bool)

(assert (=> b!1305534 (= e!744693 (containsKey!731 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (= (and d!142055 res!866884) b!1305534))

(assert (=> d!142055 m!1196377))

(assert (=> d!142055 m!1196377))

(assert (=> d!142055 m!1196379))

(declare-fun m!1196613 () Bool)

(assert (=> d!142055 m!1196613))

(declare-fun m!1196615 () Bool)

(assert (=> d!142055 m!1196615))

(assert (=> b!1305534 m!1196373))

(assert (=> b!1305357 d!142055))

(assert (=> b!1305357 d!142051))

(assert (=> b!1305357 d!142053))

(assert (=> d!142013 d!141981))

(declare-fun d!142057 () Bool)

(assert (=> d!142057 (contains!8315 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) k0!1205)))

(assert (=> d!142057 true))

(declare-fun _$21!124 () Unit!43227)

(assert (=> d!142057 (= (choose!1936 k0!1205 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)) (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) _$21!124)))

(declare-fun bs!37187 () Bool)

(assert (= bs!37187 d!142057))

(assert (=> bs!37187 m!1196257))

(assert (=> d!142013 d!142057))

(declare-fun d!142059 () Bool)

(declare-fun e!744694 () Bool)

(assert (=> d!142059 e!744694))

(declare-fun res!866885 () Bool)

(assert (=> d!142059 (=> res!866885 e!744694)))

(declare-fun lt!584534 () Bool)

(assert (=> d!142059 (= res!866885 (not lt!584534))))

(declare-fun lt!584533 () Bool)

(assert (=> d!142059 (= lt!584534 lt!584533)))

(declare-fun lt!584531 () Unit!43227)

(declare-fun e!744695 () Unit!43227)

(assert (=> d!142059 (= lt!584531 e!744695)))

(declare-fun c!125428 () Bool)

(assert (=> d!142059 (= c!125428 lt!584533)))

(assert (=> d!142059 (= lt!584533 (containsKey!731 (toList!10171 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!142059 (= (contains!8315 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))) k0!1205) lt!584534)))

(declare-fun b!1305535 () Bool)

(declare-fun lt!584532 () Unit!43227)

(assert (=> b!1305535 (= e!744695 lt!584532)))

(assert (=> b!1305535 (= lt!584532 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1305535 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1305536 () Bool)

(declare-fun Unit!43240 () Unit!43227)

(assert (=> b!1305536 (= e!744695 Unit!43240)))

(declare-fun b!1305537 () Bool)

(assert (=> b!1305537 (= e!744694 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!142059 c!125428) b!1305535))

(assert (= (and d!142059 (not c!125428)) b!1305536))

(assert (= (and d!142059 (not res!866885)) b!1305537))

(declare-fun m!1196617 () Bool)

(assert (=> d!142059 m!1196617))

(declare-fun m!1196619 () Bool)

(assert (=> b!1305535 m!1196619))

(declare-fun m!1196621 () Bool)

(assert (=> b!1305535 m!1196621))

(assert (=> b!1305535 m!1196621))

(declare-fun m!1196623 () Bool)

(assert (=> b!1305535 m!1196623))

(assert (=> b!1305537 m!1196621))

(assert (=> b!1305537 m!1196621))

(assert (=> b!1305537 m!1196623))

(assert (=> d!142013 d!142059))

(declare-fun d!142061 () Bool)

(declare-fun e!744696 () Bool)

(assert (=> d!142061 e!744696))

(declare-fun res!866887 () Bool)

(assert (=> d!142061 (=> (not res!866887) (not e!744696))))

(declare-fun lt!584536 () ListLongMap!20311)

(assert (=> d!142061 (= res!866887 (contains!8315 lt!584536 (_1!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!584537 () List!29774)

(assert (=> d!142061 (= lt!584536 (ListLongMap!20312 lt!584537))))

(declare-fun lt!584535 () Unit!43227)

(declare-fun lt!584538 () Unit!43227)

(assert (=> d!142061 (= lt!584535 lt!584538)))

(assert (=> d!142061 (= (getValueByKey!709 lt!584537 (_1!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) (Some!760 (_2!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142061 (= lt!584538 (lemmaContainsTupThenGetReturnValue!355 lt!584537 (_1!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))) (_2!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142061 (= lt!584537 (insertStrictlySorted!484 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) (_1!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))) (_2!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142061 (= (+!4491 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))) lt!584536)))

(declare-fun b!1305538 () Bool)

(declare-fun res!866886 () Bool)

(assert (=> b!1305538 (=> (not res!866886) (not e!744696))))

(assert (=> b!1305538 (= res!866886 (= (getValueByKey!709 (toList!10171 lt!584536) (_1!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387))))) (Some!760 (_2!11338 (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1305539 () Bool)

(assert (=> b!1305539 (= e!744696 (contains!8317 (toList!10171 lt!584536) (tuple2!22655 (ite c!125358 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125356 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125358 minValue!1387 (ite c!125356 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!142061 res!866887) b!1305538))

(assert (= (and b!1305538 res!866886) b!1305539))

(declare-fun m!1196625 () Bool)

(assert (=> d!142061 m!1196625))

(declare-fun m!1196627 () Bool)

(assert (=> d!142061 m!1196627))

(declare-fun m!1196629 () Bool)

(assert (=> d!142061 m!1196629))

(declare-fun m!1196631 () Bool)

(assert (=> d!142061 m!1196631))

(declare-fun m!1196633 () Bool)

(assert (=> b!1305538 m!1196633))

(declare-fun m!1196635 () Bool)

(assert (=> b!1305539 m!1196635))

(assert (=> d!142013 d!142061))

(declare-fun d!142063 () Bool)

(declare-fun e!744697 () Bool)

(assert (=> d!142063 e!744697))

(declare-fun res!866888 () Bool)

(assert (=> d!142063 (=> res!866888 e!744697)))

(declare-fun lt!584542 () Bool)

(assert (=> d!142063 (= res!866888 (not lt!584542))))

(declare-fun lt!584541 () Bool)

(assert (=> d!142063 (= lt!584542 lt!584541)))

(declare-fun lt!584539 () Unit!43227)

(declare-fun e!744698 () Unit!43227)

(assert (=> d!142063 (= lt!584539 e!744698)))

(declare-fun c!125429 () Bool)

(assert (=> d!142063 (= c!125429 lt!584541)))

(assert (=> d!142063 (= lt!584541 (containsKey!731 (toList!10171 lt!584379) (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> d!142063 (= (contains!8315 lt!584379 (select (arr!41942 _keys!1741) from!2144)) lt!584542)))

(declare-fun b!1305540 () Bool)

(declare-fun lt!584540 () Unit!43227)

(assert (=> b!1305540 (= e!744698 lt!584540)))

(assert (=> b!1305540 (= lt!584540 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584379) (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> b!1305540 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) (select (arr!41942 _keys!1741) from!2144)))))

(declare-fun b!1305541 () Bool)

(declare-fun Unit!43241 () Unit!43227)

(assert (=> b!1305541 (= e!744698 Unit!43241)))

(declare-fun b!1305542 () Bool)

(assert (=> b!1305542 (= e!744697 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) (select (arr!41942 _keys!1741) from!2144))))))

(assert (= (and d!142063 c!125429) b!1305540))

(assert (= (and d!142063 (not c!125429)) b!1305541))

(assert (= (and d!142063 (not res!866888)) b!1305542))

(assert (=> d!142063 m!1196275))

(declare-fun m!1196637 () Bool)

(assert (=> d!142063 m!1196637))

(assert (=> b!1305540 m!1196275))

(declare-fun m!1196639 () Bool)

(assert (=> b!1305540 m!1196639))

(assert (=> b!1305540 m!1196275))

(assert (=> b!1305540 m!1196597))

(assert (=> b!1305540 m!1196597))

(declare-fun m!1196641 () Bool)

(assert (=> b!1305540 m!1196641))

(assert (=> b!1305542 m!1196275))

(assert (=> b!1305542 m!1196597))

(assert (=> b!1305542 m!1196597))

(assert (=> b!1305542 m!1196641))

(assert (=> b!1305340 d!142063))

(declare-fun d!142065 () Bool)

(declare-fun e!744699 () Bool)

(assert (=> d!142065 e!744699))

(declare-fun res!866890 () Bool)

(assert (=> d!142065 (=> (not res!866890) (not e!744699))))

(declare-fun lt!584544 () ListLongMap!20311)

(assert (=> d!142065 (= res!866890 (contains!8315 lt!584544 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584545 () List!29774)

(assert (=> d!142065 (= lt!584544 (ListLongMap!20312 lt!584545))))

(declare-fun lt!584543 () Unit!43227)

(declare-fun lt!584546 () Unit!43227)

(assert (=> d!142065 (= lt!584543 lt!584546)))

(assert (=> d!142065 (= (getValueByKey!709 lt!584545 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142065 (= lt!584546 (lemmaContainsTupThenGetReturnValue!355 lt!584545 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142065 (= lt!584545 (insertStrictlySorted!484 (toList!10171 call!64466) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142065 (= (+!4491 call!64466 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584544)))

(declare-fun b!1305543 () Bool)

(declare-fun res!866889 () Bool)

(assert (=> b!1305543 (=> (not res!866889) (not e!744699))))

(assert (=> b!1305543 (= res!866889 (= (getValueByKey!709 (toList!10171 lt!584544) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305544 () Bool)

(assert (=> b!1305544 (= e!744699 (contains!8317 (toList!10171 lt!584544) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142065 res!866890) b!1305543))

(assert (= (and b!1305543 res!866889) b!1305544))

(declare-fun m!1196643 () Bool)

(assert (=> d!142065 m!1196643))

(declare-fun m!1196645 () Bool)

(assert (=> d!142065 m!1196645))

(declare-fun m!1196647 () Bool)

(assert (=> d!142065 m!1196647))

(declare-fun m!1196649 () Bool)

(assert (=> d!142065 m!1196649))

(declare-fun m!1196651 () Bool)

(assert (=> b!1305543 m!1196651))

(declare-fun m!1196653 () Bool)

(assert (=> b!1305544 m!1196653))

(assert (=> b!1305438 d!142065))

(declare-fun d!142067 () Bool)

(declare-fun e!744700 () Bool)

(assert (=> d!142067 e!744700))

(declare-fun res!866891 () Bool)

(assert (=> d!142067 (=> res!866891 e!744700)))

(declare-fun lt!584550 () Bool)

(assert (=> d!142067 (= res!866891 (not lt!584550))))

(declare-fun lt!584549 () Bool)

(assert (=> d!142067 (= lt!584550 lt!584549)))

(declare-fun lt!584547 () Unit!43227)

(declare-fun e!744701 () Unit!43227)

(assert (=> d!142067 (= lt!584547 e!744701)))

(declare-fun c!125430 () Bool)

(assert (=> d!142067 (= c!125430 lt!584549)))

(assert (=> d!142067 (= lt!584549 (containsKey!731 (toList!10171 lt!584477) (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> d!142067 (= (contains!8315 lt!584477 (select (arr!41942 _keys!1741) from!2144)) lt!584550)))

(declare-fun b!1305545 () Bool)

(declare-fun lt!584548 () Unit!43227)

(assert (=> b!1305545 (= e!744701 lt!584548)))

(assert (=> b!1305545 (= lt!584548 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584477) (select (arr!41942 _keys!1741) from!2144)))))

(assert (=> b!1305545 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) (select (arr!41942 _keys!1741) from!2144)))))

(declare-fun b!1305546 () Bool)

(declare-fun Unit!43242 () Unit!43227)

(assert (=> b!1305546 (= e!744701 Unit!43242)))

(declare-fun b!1305547 () Bool)

(assert (=> b!1305547 (= e!744700 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) (select (arr!41942 _keys!1741) from!2144))))))

(assert (= (and d!142067 c!125430) b!1305545))

(assert (= (and d!142067 (not c!125430)) b!1305546))

(assert (= (and d!142067 (not res!866891)) b!1305547))

(assert (=> d!142067 m!1196275))

(declare-fun m!1196655 () Bool)

(assert (=> d!142067 m!1196655))

(assert (=> b!1305545 m!1196275))

(declare-fun m!1196657 () Bool)

(assert (=> b!1305545 m!1196657))

(assert (=> b!1305545 m!1196275))

(declare-fun m!1196659 () Bool)

(assert (=> b!1305545 m!1196659))

(assert (=> b!1305545 m!1196659))

(declare-fun m!1196661 () Bool)

(assert (=> b!1305545 m!1196661))

(assert (=> b!1305547 m!1196275))

(assert (=> b!1305547 m!1196659))

(assert (=> b!1305547 m!1196659))

(assert (=> b!1305547 m!1196661))

(assert (=> b!1305436 d!142067))

(declare-fun d!142069 () Bool)

(assert (=> d!142069 (= (isDefined!516 (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1071 (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37188 () Bool)

(assert (= bs!37188 d!142069))

(assert (=> bs!37188 m!1196425))

(declare-fun m!1196663 () Bool)

(assert (=> bs!37188 m!1196663))

(assert (=> b!1305383 d!142069))

(declare-fun e!744703 () Option!761)

(declare-fun b!1305550 () Bool)

(assert (=> b!1305550 (= e!744703 (getValueByKey!709 (t!43376 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1305549 () Bool)

(declare-fun e!744702 () Option!761)

(assert (=> b!1305549 (= e!744702 e!744703)))

(declare-fun c!125432 () Bool)

(assert (=> b!1305549 (= c!125432 (and ((_ is Cons!29770) (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1305551 () Bool)

(assert (=> b!1305551 (= e!744703 None!759)))

(declare-fun c!125431 () Bool)

(declare-fun d!142071 () Bool)

(assert (=> d!142071 (= c!125431 (and ((_ is Cons!29770) (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142071 (= (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744702)))

(declare-fun b!1305548 () Bool)

(assert (=> b!1305548 (= e!744702 (Some!760 (_2!11338 (h!30979 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!142071 c!125431) b!1305548))

(assert (= (and d!142071 (not c!125431)) b!1305549))

(assert (= (and b!1305549 c!125432) b!1305550))

(assert (= (and b!1305549 (not c!125432)) b!1305551))

(declare-fun m!1196665 () Bool)

(assert (=> b!1305550 m!1196665))

(assert (=> b!1305383 d!142071))

(declare-fun d!142073 () Bool)

(assert (=> d!142073 (= (apply!1026 lt!584477 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21191 (getValueByKey!709 (toList!10171 lt!584477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37189 () Bool)

(assert (= bs!37189 d!142073))

(declare-fun m!1196667 () Bool)

(assert (=> bs!37189 m!1196667))

(assert (=> bs!37189 m!1196667))

(declare-fun m!1196669 () Bool)

(assert (=> bs!37189 m!1196669))

(assert (=> b!1305431 d!142073))

(declare-fun d!142075 () Bool)

(assert (=> d!142075 (isDefined!516 (getValueByKey!709 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584551 () Unit!43227)

(assert (=> d!142075 (= lt!584551 (choose!1938 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744704 () Bool)

(assert (=> d!142075 e!744704))

(declare-fun res!866892 () Bool)

(assert (=> d!142075 (=> (not res!866892) (not e!744704))))

(assert (=> d!142075 (= res!866892 (isStrictlySorted!874 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142075 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584551)))

(declare-fun b!1305552 () Bool)

(assert (=> b!1305552 (= e!744704 (containsKey!731 (toList!10171 (getCurrentListMap!5187 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142075 res!866892) b!1305552))

(assert (=> d!142075 m!1196425))

(assert (=> d!142075 m!1196425))

(assert (=> d!142075 m!1196427))

(declare-fun m!1196671 () Bool)

(assert (=> d!142075 m!1196671))

(declare-fun m!1196673 () Bool)

(assert (=> d!142075 m!1196673))

(assert (=> b!1305552 m!1196421))

(assert (=> b!1305381 d!142075))

(assert (=> b!1305381 d!142069))

(assert (=> b!1305381 d!142071))

(declare-fun b!1305555 () Bool)

(declare-fun e!744706 () Option!761)

(assert (=> b!1305555 (= e!744706 (getValueByKey!709 (t!43376 (toList!10171 lt!584403)) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305554 () Bool)

(declare-fun e!744705 () Option!761)

(assert (=> b!1305554 (= e!744705 e!744706)))

(declare-fun c!125434 () Bool)

(assert (=> b!1305554 (= c!125434 (and ((_ is Cons!29770) (toList!10171 lt!584403)) (not (= (_1!11338 (h!30979 (toList!10171 lt!584403))) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305556 () Bool)

(assert (=> b!1305556 (= e!744706 None!759)))

(declare-fun d!142077 () Bool)

(declare-fun c!125433 () Bool)

(assert (=> d!142077 (= c!125433 (and ((_ is Cons!29770) (toList!10171 lt!584403)) (= (_1!11338 (h!30979 (toList!10171 lt!584403))) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142077 (= (getValueByKey!709 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!744705)))

(declare-fun b!1305553 () Bool)

(assert (=> b!1305553 (= e!744705 (Some!760 (_2!11338 (h!30979 (toList!10171 lt!584403)))))))

(assert (= (and d!142077 c!125433) b!1305553))

(assert (= (and d!142077 (not c!125433)) b!1305554))

(assert (= (and b!1305554 c!125434) b!1305555))

(assert (= (and b!1305554 (not c!125434)) b!1305556))

(declare-fun m!1196675 () Bool)

(assert (=> b!1305555 m!1196675))

(assert (=> b!1305364 d!142077))

(declare-fun d!142079 () Bool)

(declare-fun e!744707 () Bool)

(assert (=> d!142079 e!744707))

(declare-fun res!866893 () Bool)

(assert (=> d!142079 (=> res!866893 e!744707)))

(declare-fun lt!584555 () Bool)

(assert (=> d!142079 (= res!866893 (not lt!584555))))

(declare-fun lt!584554 () Bool)

(assert (=> d!142079 (= lt!584555 lt!584554)))

(declare-fun lt!584552 () Unit!43227)

(declare-fun e!744708 () Unit!43227)

(assert (=> d!142079 (= lt!584552 e!744708)))

(declare-fun c!125435 () Bool)

(assert (=> d!142079 (= c!125435 lt!584554)))

(assert (=> d!142079 (= lt!584554 (containsKey!731 (toList!10171 lt!584379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142079 (= (contains!8315 lt!584379 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584555)))

(declare-fun b!1305557 () Bool)

(declare-fun lt!584553 () Unit!43227)

(assert (=> b!1305557 (= e!744708 lt!584553)))

(assert (=> b!1305557 (= lt!584553 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305557 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305558 () Bool)

(declare-fun Unit!43243 () Unit!43227)

(assert (=> b!1305558 (= e!744708 Unit!43243)))

(declare-fun b!1305559 () Bool)

(assert (=> b!1305559 (= e!744707 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142079 c!125435) b!1305557))

(assert (= (and d!142079 (not c!125435)) b!1305558))

(assert (= (and d!142079 (not res!866893)) b!1305559))

(declare-fun m!1196677 () Bool)

(assert (=> d!142079 m!1196677))

(declare-fun m!1196679 () Bool)

(assert (=> b!1305557 m!1196679))

(declare-fun m!1196681 () Bool)

(assert (=> b!1305557 m!1196681))

(assert (=> b!1305557 m!1196681))

(declare-fun m!1196683 () Bool)

(assert (=> b!1305557 m!1196683))

(assert (=> b!1305559 m!1196681))

(assert (=> b!1305559 m!1196681))

(assert (=> b!1305559 m!1196683))

(assert (=> b!1305347 d!142079))

(assert (=> d!142003 d!142001))

(declare-fun d!142081 () Bool)

(assert (=> d!142081 (not (contains!8315 (ListLongMap!20312 Nil!29771) k0!1205))))

(assert (=> d!142081 true))

(declare-fun _$29!204 () Unit!43227)

(assert (=> d!142081 (= (choose!1937 k0!1205) _$29!204)))

(declare-fun bs!37190 () Bool)

(assert (= bs!37190 d!142081))

(assert (=> bs!37190 m!1196241))

(assert (=> d!142003 d!142081))

(declare-fun d!142083 () Bool)

(declare-fun res!866894 () Bool)

(declare-fun e!744709 () Bool)

(assert (=> d!142083 (=> res!866894 e!744709)))

(assert (=> d!142083 (= res!866894 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) k0!1205)))))

(assert (=> d!142083 (= (containsKey!731 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))) k0!1205) e!744709)))

(declare-fun b!1305560 () Bool)

(declare-fun e!744710 () Bool)

(assert (=> b!1305560 (= e!744709 e!744710)))

(declare-fun res!866895 () Bool)

(assert (=> b!1305560 (=> (not res!866895) (not e!744710))))

(assert (=> b!1305560 (= res!866895 (and (or (not ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) (bvsle (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) k0!1205)) ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) (bvslt (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297))))) k0!1205)))))

(declare-fun b!1305561 () Bool)

(assert (=> b!1305561 (= e!744710 (containsKey!731 (t!43376 (toList!10171 (ite c!125358 lt!584294 (ite c!125356 lt!584291 lt!584297)))) k0!1205))))

(assert (= (and d!142083 (not res!866894)) b!1305560))

(assert (= (and b!1305560 res!866895) b!1305561))

(declare-fun m!1196685 () Bool)

(assert (=> b!1305561 m!1196685))

(assert (=> d!141981 d!142083))

(assert (=> b!1305464 d!142035))

(declare-fun d!142085 () Bool)

(declare-fun lt!584558 () Bool)

(declare-fun content!649 (List!29775) (InoxSet (_ BitVec 64)))

(assert (=> d!142085 (= lt!584558 (select (content!649 Nil!29772) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!744715 () Bool)

(assert (=> d!142085 (= lt!584558 e!744715)))

(declare-fun res!866901 () Bool)

(assert (=> d!142085 (=> (not res!866901) (not e!744715))))

(assert (=> d!142085 (= res!866901 ((_ is Cons!29771) Nil!29772))))

(assert (=> d!142085 (= (contains!8318 Nil!29772 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)) lt!584558)))

(declare-fun b!1305566 () Bool)

(declare-fun e!744716 () Bool)

(assert (=> b!1305566 (= e!744715 e!744716)))

(declare-fun res!866900 () Bool)

(assert (=> b!1305566 (=> res!866900 e!744716)))

(assert (=> b!1305566 (= res!866900 (= (h!30980 Nil!29772) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305567 () Bool)

(assert (=> b!1305567 (= e!744716 (contains!8318 (t!43377 Nil!29772) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142085 res!866901) b!1305566))

(assert (= (and b!1305566 (not res!866900)) b!1305567))

(declare-fun m!1196687 () Bool)

(assert (=> d!142085 m!1196687))

(assert (=> d!142085 m!1196411))

(declare-fun m!1196689 () Bool)

(assert (=> d!142085 m!1196689))

(assert (=> b!1305567 m!1196411))

(declare-fun m!1196691 () Bool)

(assert (=> b!1305567 m!1196691))

(assert (=> b!1305462 d!142085))

(declare-fun d!142087 () Bool)

(declare-fun e!744717 () Bool)

(assert (=> d!142087 e!744717))

(declare-fun res!866902 () Bool)

(assert (=> d!142087 (=> res!866902 e!744717)))

(declare-fun lt!584562 () Bool)

(assert (=> d!142087 (= res!866902 (not lt!584562))))

(declare-fun lt!584561 () Bool)

(assert (=> d!142087 (= lt!584562 lt!584561)))

(declare-fun lt!584559 () Unit!43227)

(declare-fun e!744718 () Unit!43227)

(assert (=> d!142087 (= lt!584559 e!744718)))

(declare-fun c!125436 () Bool)

(assert (=> d!142087 (= c!125436 lt!584561)))

(assert (=> d!142087 (= lt!584561 (containsKey!731 (toList!10171 lt!584289) k0!1205))))

(assert (=> d!142087 (= (contains!8315 lt!584289 k0!1205) lt!584562)))

(declare-fun b!1305568 () Bool)

(declare-fun lt!584560 () Unit!43227)

(assert (=> b!1305568 (= e!744718 lt!584560)))

(assert (=> b!1305568 (= lt!584560 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584289) k0!1205))))

(assert (=> b!1305568 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584289) k0!1205))))

(declare-fun b!1305569 () Bool)

(declare-fun Unit!43244 () Unit!43227)

(assert (=> b!1305569 (= e!744718 Unit!43244)))

(declare-fun b!1305570 () Bool)

(assert (=> b!1305570 (= e!744717 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584289) k0!1205)))))

(assert (= (and d!142087 c!125436) b!1305568))

(assert (= (and d!142087 (not c!125436)) b!1305569))

(assert (= (and d!142087 (not res!866902)) b!1305570))

(declare-fun m!1196693 () Bool)

(assert (=> d!142087 m!1196693))

(declare-fun m!1196695 () Bool)

(assert (=> b!1305568 m!1196695))

(declare-fun m!1196697 () Bool)

(assert (=> b!1305568 m!1196697))

(assert (=> b!1305568 m!1196697))

(declare-fun m!1196699 () Bool)

(assert (=> b!1305568 m!1196699))

(assert (=> b!1305570 m!1196697))

(assert (=> b!1305570 m!1196697))

(assert (=> b!1305570 m!1196699))

(assert (=> d!141999 d!142087))

(declare-fun d!142089 () Bool)

(assert (=> d!142089 (contains!8315 lt!584289 k0!1205)))

(assert (=> d!142089 true))

(declare-fun _$21!125 () Unit!43227)

(assert (=> d!142089 (= (choose!1936 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584289) _$21!125)))

(declare-fun bs!37191 () Bool)

(assert (= bs!37191 d!142089))

(assert (=> bs!37191 m!1196371))

(assert (=> d!141999 d!142089))

(declare-fun d!142091 () Bool)

(declare-fun e!744719 () Bool)

(assert (=> d!142091 e!744719))

(declare-fun res!866903 () Bool)

(assert (=> d!142091 (=> res!866903 e!744719)))

(declare-fun lt!584566 () Bool)

(assert (=> d!142091 (= res!866903 (not lt!584566))))

(declare-fun lt!584565 () Bool)

(assert (=> d!142091 (= lt!584566 lt!584565)))

(declare-fun lt!584563 () Unit!43227)

(declare-fun e!744720 () Unit!43227)

(assert (=> d!142091 (= lt!584563 e!744720)))

(declare-fun c!125437 () Bool)

(assert (=> d!142091 (= c!125437 lt!584565)))

(assert (=> d!142091 (= lt!584565 (containsKey!731 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!142091 (= (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!584566)))

(declare-fun b!1305571 () Bool)

(declare-fun lt!584564 () Unit!43227)

(assert (=> b!1305571 (= e!744720 lt!584564)))

(assert (=> b!1305571 (= lt!584564 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1305571 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1305572 () Bool)

(declare-fun Unit!43245 () Unit!43227)

(assert (=> b!1305572 (= e!744720 Unit!43245)))

(declare-fun b!1305573 () Bool)

(assert (=> b!1305573 (= e!744719 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!142091 c!125437) b!1305571))

(assert (= (and d!142091 (not c!125437)) b!1305572))

(assert (= (and d!142091 (not res!866903)) b!1305573))

(declare-fun m!1196701 () Bool)

(assert (=> d!142091 m!1196701))

(declare-fun m!1196703 () Bool)

(assert (=> b!1305571 m!1196703))

(declare-fun m!1196705 () Bool)

(assert (=> b!1305571 m!1196705))

(assert (=> b!1305571 m!1196705))

(declare-fun m!1196707 () Bool)

(assert (=> b!1305571 m!1196707))

(assert (=> b!1305573 m!1196705))

(assert (=> b!1305573 m!1196705))

(assert (=> b!1305573 m!1196707))

(assert (=> d!141999 d!142091))

(declare-fun d!142093 () Bool)

(declare-fun e!744721 () Bool)

(assert (=> d!142093 e!744721))

(declare-fun res!866905 () Bool)

(assert (=> d!142093 (=> (not res!866905) (not e!744721))))

(declare-fun lt!584568 () ListLongMap!20311)

(assert (=> d!142093 (= res!866905 (contains!8315 lt!584568 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!584569 () List!29774)

(assert (=> d!142093 (= lt!584568 (ListLongMap!20312 lt!584569))))

(declare-fun lt!584567 () Unit!43227)

(declare-fun lt!584570 () Unit!43227)

(assert (=> d!142093 (= lt!584567 lt!584570)))

(assert (=> d!142093 (= (getValueByKey!709 lt!584569 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142093 (= lt!584570 (lemmaContainsTupThenGetReturnValue!355 lt!584569 (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142093 (= lt!584569 (insertStrictlySorted!484 (toList!10171 lt!584289) (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142093 (= (+!4491 lt!584289 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!584568)))

(declare-fun b!1305574 () Bool)

(declare-fun res!866904 () Bool)

(assert (=> b!1305574 (=> (not res!866904) (not e!744721))))

(assert (=> b!1305574 (= res!866904 (= (getValueByKey!709 (toList!10171 lt!584568) (_1!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1305575 () Bool)

(assert (=> b!1305575 (= e!744721 (contains!8317 (toList!10171 lt!584568) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!142093 res!866905) b!1305574))

(assert (= (and b!1305574 res!866904) b!1305575))

(declare-fun m!1196709 () Bool)

(assert (=> d!142093 m!1196709))

(declare-fun m!1196711 () Bool)

(assert (=> d!142093 m!1196711))

(declare-fun m!1196713 () Bool)

(assert (=> d!142093 m!1196713))

(declare-fun m!1196715 () Bool)

(assert (=> d!142093 m!1196715))

(declare-fun m!1196717 () Bool)

(assert (=> b!1305574 m!1196717))

(declare-fun m!1196719 () Bool)

(assert (=> b!1305575 m!1196719))

(assert (=> d!141999 d!142093))

(declare-fun d!142095 () Bool)

(assert (=> d!142095 (arrayContainsKey!0 _keys!1741 lt!584423 #b00000000000000000000000000000000)))

(declare-fun lt!584573 () Unit!43227)

(declare-fun choose!13 (array!86910 (_ BitVec 64) (_ BitVec 32)) Unit!43227)

(assert (=> d!142095 (= lt!584573 (choose!13 _keys!1741 lt!584423 #b00000000000000000000000000000000))))

(assert (=> d!142095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142095 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584423 #b00000000000000000000000000000000) lt!584573)))

(declare-fun bs!37192 () Bool)

(assert (= bs!37192 d!142095))

(assert (=> bs!37192 m!1196415))

(declare-fun m!1196721 () Bool)

(assert (=> bs!37192 m!1196721))

(assert (=> b!1305377 d!142095))

(declare-fun d!142097 () Bool)

(declare-fun res!866910 () Bool)

(declare-fun e!744726 () Bool)

(assert (=> d!142097 (=> res!866910 e!744726)))

(assert (=> d!142097 (= res!866910 (= (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) lt!584423))))

(assert (=> d!142097 (= (arrayContainsKey!0 _keys!1741 lt!584423 #b00000000000000000000000000000000) e!744726)))

(declare-fun b!1305580 () Bool)

(declare-fun e!744727 () Bool)

(assert (=> b!1305580 (= e!744726 e!744727)))

(declare-fun res!866911 () Bool)

(assert (=> b!1305580 (=> (not res!866911) (not e!744727))))

(assert (=> b!1305580 (= res!866911 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305581 () Bool)

(assert (=> b!1305581 (= e!744727 (arrayContainsKey!0 _keys!1741 lt!584423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142097 (not res!866910)) b!1305580))

(assert (= (and b!1305580 res!866911) b!1305581))

(assert (=> d!142097 m!1196411))

(declare-fun m!1196723 () Bool)

(assert (=> b!1305581 m!1196723))

(assert (=> b!1305377 d!142097))

(declare-fun lt!584580 () SeekEntryResult!10029)

(declare-fun b!1305594 () Bool)

(declare-fun e!744736 () SeekEntryResult!10029)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86910 (_ BitVec 32)) SeekEntryResult!10029)

(assert (=> b!1305594 (= e!744736 (seekKeyOrZeroReturnVacant!0 (x!115930 lt!584580) (index!42489 lt!584580) (index!42489 lt!584580) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1305595 () Bool)

(declare-fun e!744735 () SeekEntryResult!10029)

(assert (=> b!1305595 (= e!744735 Undefined!10029)))

(declare-fun d!142099 () Bool)

(declare-fun lt!584581 () SeekEntryResult!10029)

(assert (=> d!142099 (and (or ((_ is Undefined!10029) lt!584581) (not ((_ is Found!10029) lt!584581)) (and (bvsge (index!42488 lt!584581) #b00000000000000000000000000000000) (bvslt (index!42488 lt!584581) (size!42492 _keys!1741)))) (or ((_ is Undefined!10029) lt!584581) ((_ is Found!10029) lt!584581) (not ((_ is MissingZero!10029) lt!584581)) (and (bvsge (index!42487 lt!584581) #b00000000000000000000000000000000) (bvslt (index!42487 lt!584581) (size!42492 _keys!1741)))) (or ((_ is Undefined!10029) lt!584581) ((_ is Found!10029) lt!584581) ((_ is MissingZero!10029) lt!584581) (not ((_ is MissingVacant!10029) lt!584581)) (and (bvsge (index!42490 lt!584581) #b00000000000000000000000000000000) (bvslt (index!42490 lt!584581) (size!42492 _keys!1741)))) (or ((_ is Undefined!10029) lt!584581) (ite ((_ is Found!10029) lt!584581) (= (select (arr!41942 _keys!1741) (index!42488 lt!584581)) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10029) lt!584581) (= (select (arr!41942 _keys!1741) (index!42487 lt!584581)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10029) lt!584581) (= (select (arr!41942 _keys!1741) (index!42490 lt!584581)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142099 (= lt!584581 e!744735)))

(declare-fun c!125446 () Bool)

(assert (=> d!142099 (= c!125446 (and ((_ is Intermediate!10029) lt!584580) (undefined!10841 lt!584580)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86910 (_ BitVec 32)) SeekEntryResult!10029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142099 (= lt!584580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!142099 (validMask!0 mask!2175)))

(assert (=> d!142099 (= (seekEntryOrOpen!0 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!584581)))

(declare-fun b!1305596 () Bool)

(declare-fun e!744734 () SeekEntryResult!10029)

(assert (=> b!1305596 (= e!744734 (Found!10029 (index!42489 lt!584580)))))

(declare-fun b!1305597 () Bool)

(declare-fun c!125445 () Bool)

(declare-fun lt!584582 () (_ BitVec 64))

(assert (=> b!1305597 (= c!125445 (= lt!584582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305597 (= e!744734 e!744736)))

(declare-fun b!1305598 () Bool)

(assert (=> b!1305598 (= e!744735 e!744734)))

(assert (=> b!1305598 (= lt!584582 (select (arr!41942 _keys!1741) (index!42489 lt!584580)))))

(declare-fun c!125444 () Bool)

(assert (=> b!1305598 (= c!125444 (= lt!584582 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305599 () Bool)

(assert (=> b!1305599 (= e!744736 (MissingZero!10029 (index!42489 lt!584580)))))

(assert (= (and d!142099 c!125446) b!1305595))

(assert (= (and d!142099 (not c!125446)) b!1305598))

(assert (= (and b!1305598 c!125444) b!1305596))

(assert (= (and b!1305598 (not c!125444)) b!1305597))

(assert (= (and b!1305597 c!125445) b!1305599))

(assert (= (and b!1305597 (not c!125445)) b!1305594))

(assert (=> b!1305594 m!1196411))

(declare-fun m!1196725 () Bool)

(assert (=> b!1305594 m!1196725))

(declare-fun m!1196727 () Bool)

(assert (=> d!142099 m!1196727))

(assert (=> d!142099 m!1196411))

(declare-fun m!1196729 () Bool)

(assert (=> d!142099 m!1196729))

(assert (=> d!142099 m!1196729))

(assert (=> d!142099 m!1196411))

(declare-fun m!1196731 () Bool)

(assert (=> d!142099 m!1196731))

(declare-fun m!1196733 () Bool)

(assert (=> d!142099 m!1196733))

(assert (=> d!142099 m!1196245))

(declare-fun m!1196735 () Bool)

(assert (=> d!142099 m!1196735))

(declare-fun m!1196737 () Bool)

(assert (=> b!1305598 m!1196737))

(assert (=> b!1305377 d!142099))

(assert (=> d!141993 d!141995))

(assert (=> d!141993 d!141997))

(declare-fun d!142101 () Bool)

(assert (=> d!142101 (not (contains!8315 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(assert (=> d!142101 true))

(declare-fun _$36!381 () Unit!43227)

(assert (=> d!142101 (= (choose!1935 lt!584289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) _$36!381)))

(declare-fun bs!37193 () Bool)

(assert (= bs!37193 d!142101))

(assert (=> bs!37193 m!1196267))

(assert (=> bs!37193 m!1196267))

(assert (=> bs!37193 m!1196269))

(assert (=> d!141993 d!142101))

(assert (=> d!141993 d!142087))

(declare-fun d!142103 () Bool)

(declare-fun res!866912 () Bool)

(declare-fun e!744737 () Bool)

(assert (=> d!142103 (=> res!866912 e!744737)))

(assert (=> d!142103 (= res!866912 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 call!64393))) (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393)))) k0!1205)))))

(assert (=> d!142103 (= (containsKey!731 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205) e!744737)))

(declare-fun b!1305601 () Bool)

(declare-fun e!744738 () Bool)

(assert (=> b!1305601 (= e!744737 e!744738)))

(declare-fun res!866913 () Bool)

(assert (=> b!1305601 (=> (not res!866913) (not e!744738))))

(assert (=> b!1305601 (= res!866913 (and (or (not ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 call!64393)))) (bvsle (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393)))) k0!1205)) ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 call!64393))) (bvslt (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393)))) k0!1205)))))

(declare-fun b!1305602 () Bool)

(assert (=> b!1305602 (= e!744738 (containsKey!731 (t!43376 (toList!10171 (ite c!125358 lt!584289 call!64393))) k0!1205))))

(assert (= (and d!142103 (not res!866912)) b!1305601))

(assert (= (and b!1305601 res!866913) b!1305602))

(declare-fun m!1196739 () Bool)

(assert (=> b!1305602 m!1196739))

(assert (=> d!141991 d!142103))

(assert (=> b!1305426 d!142007))

(declare-fun d!142105 () Bool)

(assert (=> d!142105 (= (isDefined!516 (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205)) (not (isEmpty!1071 (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))))

(declare-fun bs!37194 () Bool)

(assert (= bs!37194 d!142105))

(assert (=> bs!37194 m!1196403))

(declare-fun m!1196741 () Bool)

(assert (=> bs!37194 m!1196741))

(assert (=> b!1305368 d!142105))

(declare-fun b!1305605 () Bool)

(declare-fun e!744740 () Option!761)

(assert (=> b!1305605 (= e!744740 (getValueByKey!709 (t!43376 (toList!10171 (ListLongMap!20312 Nil!29771))) k0!1205))))

(declare-fun b!1305604 () Bool)

(declare-fun e!744739 () Option!761)

(assert (=> b!1305604 (= e!744739 e!744740)))

(declare-fun c!125448 () Bool)

(assert (=> b!1305604 (= c!125448 (and ((_ is Cons!29770) (toList!10171 (ListLongMap!20312 Nil!29771))) (not (= (_1!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771)))) k0!1205))))))

(declare-fun b!1305606 () Bool)

(assert (=> b!1305606 (= e!744740 None!759)))

(declare-fun d!142107 () Bool)

(declare-fun c!125447 () Bool)

(assert (=> d!142107 (= c!125447 (and ((_ is Cons!29770) (toList!10171 (ListLongMap!20312 Nil!29771))) (= (_1!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771)))) k0!1205)))))

(assert (=> d!142107 (= (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205) e!744739)))

(declare-fun b!1305603 () Bool)

(assert (=> b!1305603 (= e!744739 (Some!760 (_2!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771))))))))

(assert (= (and d!142107 c!125447) b!1305603))

(assert (= (and d!142107 (not c!125447)) b!1305604))

(assert (= (and b!1305604 c!125448) b!1305605))

(assert (= (and b!1305604 (not c!125448)) b!1305606))

(declare-fun m!1196743 () Bool)

(assert (=> b!1305605 m!1196743))

(assert (=> b!1305368 d!142107))

(declare-fun d!142109 () Bool)

(declare-fun lt!584583 () Bool)

(assert (=> d!142109 (= lt!584583 (select (content!648 (toList!10171 lt!584403)) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun e!744741 () Bool)

(assert (=> d!142109 (= lt!584583 e!744741)))

(declare-fun res!866914 () Bool)

(assert (=> d!142109 (=> (not res!866914) (not e!744741))))

(assert (=> d!142109 (= res!866914 ((_ is Cons!29770) (toList!10171 lt!584403)))))

(assert (=> d!142109 (= (contains!8317 (toList!10171 lt!584403) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584583)))

(declare-fun b!1305607 () Bool)

(declare-fun e!744742 () Bool)

(assert (=> b!1305607 (= e!744741 e!744742)))

(declare-fun res!866915 () Bool)

(assert (=> b!1305607 (=> res!866915 e!744742)))

(assert (=> b!1305607 (= res!866915 (= (h!30979 (toList!10171 lt!584403)) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305608 () Bool)

(assert (=> b!1305608 (= e!744742 (contains!8317 (t!43376 (toList!10171 lt!584403)) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142109 res!866914) b!1305607))

(assert (= (and b!1305607 (not res!866915)) b!1305608))

(declare-fun m!1196745 () Bool)

(assert (=> d!142109 m!1196745))

(declare-fun m!1196747 () Bool)

(assert (=> d!142109 m!1196747))

(declare-fun m!1196749 () Bool)

(assert (=> b!1305608 m!1196749))

(assert (=> b!1305365 d!142109))

(declare-fun d!142111 () Bool)

(assert (=> d!142111 (= (apply!1026 lt!584477 (select (arr!41942 _keys!1741) from!2144)) (get!21191 (getValueByKey!709 (toList!10171 lt!584477) (select (arr!41942 _keys!1741) from!2144))))))

(declare-fun bs!37195 () Bool)

(assert (= bs!37195 d!142111))

(assert (=> bs!37195 m!1196275))

(assert (=> bs!37195 m!1196659))

(assert (=> bs!37195 m!1196659))

(declare-fun m!1196751 () Bool)

(assert (=> bs!37195 m!1196751))

(assert (=> b!1305434 d!142111))

(assert (=> b!1305434 d!142033))

(assert (=> b!1305337 d!142007))

(declare-fun b!1305611 () Bool)

(declare-fun e!744744 () Option!761)

(assert (=> b!1305611 (= e!744744 (getValueByKey!709 (t!43376 (toList!10171 lt!584497)) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305610 () Bool)

(declare-fun e!744743 () Option!761)

(assert (=> b!1305610 (= e!744743 e!744744)))

(declare-fun c!125450 () Bool)

(assert (=> b!1305610 (= c!125450 (and ((_ is Cons!29770) (toList!10171 lt!584497)) (not (= (_1!11338 (h!30979 (toList!10171 lt!584497))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1305612 () Bool)

(assert (=> b!1305612 (= e!744744 None!759)))

(declare-fun c!125449 () Bool)

(declare-fun d!142113 () Bool)

(assert (=> d!142113 (= c!125449 (and ((_ is Cons!29770) (toList!10171 lt!584497)) (= (_1!11338 (h!30979 (toList!10171 lt!584497))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142113 (= (getValueByKey!709 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!744743)))

(declare-fun b!1305609 () Bool)

(assert (=> b!1305609 (= e!744743 (Some!760 (_2!11338 (h!30979 (toList!10171 lt!584497)))))))

(assert (= (and d!142113 c!125449) b!1305609))

(assert (= (and d!142113 (not c!125449)) b!1305610))

(assert (= (and b!1305610 c!125450) b!1305611))

(assert (= (and b!1305610 (not c!125450)) b!1305612))

(declare-fun m!1196753 () Bool)

(assert (=> b!1305611 m!1196753))

(assert (=> b!1305447 d!142113))

(declare-fun d!142115 () Bool)

(declare-fun e!744745 () Bool)

(assert (=> d!142115 e!744745))

(declare-fun res!866917 () Bool)

(assert (=> d!142115 (=> (not res!866917) (not e!744745))))

(declare-fun lt!584585 () ListLongMap!20311)

(assert (=> d!142115 (= res!866917 (contains!8315 lt!584585 (_1!11338 (tuple2!22655 lt!584491 minValue!1387))))))

(declare-fun lt!584586 () List!29774)

(assert (=> d!142115 (= lt!584585 (ListLongMap!20312 lt!584586))))

(declare-fun lt!584584 () Unit!43227)

(declare-fun lt!584587 () Unit!43227)

(assert (=> d!142115 (= lt!584584 lt!584587)))

(assert (=> d!142115 (= (getValueByKey!709 lt!584586 (_1!11338 (tuple2!22655 lt!584491 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584491 minValue!1387))))))

(assert (=> d!142115 (= lt!584587 (lemmaContainsTupThenGetReturnValue!355 lt!584586 (_1!11338 (tuple2!22655 lt!584491 minValue!1387)) (_2!11338 (tuple2!22655 lt!584491 minValue!1387))))))

(assert (=> d!142115 (= lt!584586 (insertStrictlySorted!484 (toList!10171 lt!584493) (_1!11338 (tuple2!22655 lt!584491 minValue!1387)) (_2!11338 (tuple2!22655 lt!584491 minValue!1387))))))

(assert (=> d!142115 (= (+!4491 lt!584493 (tuple2!22655 lt!584491 minValue!1387)) lt!584585)))

(declare-fun b!1305613 () Bool)

(declare-fun res!866916 () Bool)

(assert (=> b!1305613 (=> (not res!866916) (not e!744745))))

(assert (=> b!1305613 (= res!866916 (= (getValueByKey!709 (toList!10171 lt!584585) (_1!11338 (tuple2!22655 lt!584491 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584491 minValue!1387)))))))

(declare-fun b!1305614 () Bool)

(assert (=> b!1305614 (= e!744745 (contains!8317 (toList!10171 lt!584585) (tuple2!22655 lt!584491 minValue!1387)))))

(assert (= (and d!142115 res!866917) b!1305613))

(assert (= (and b!1305613 res!866916) b!1305614))

(declare-fun m!1196755 () Bool)

(assert (=> d!142115 m!1196755))

(declare-fun m!1196757 () Bool)

(assert (=> d!142115 m!1196757))

(declare-fun m!1196759 () Bool)

(assert (=> d!142115 m!1196759))

(declare-fun m!1196761 () Bool)

(assert (=> d!142115 m!1196761))

(declare-fun m!1196763 () Bool)

(assert (=> b!1305613 m!1196763))

(declare-fun m!1196765 () Bool)

(assert (=> b!1305614 m!1196765))

(assert (=> b!1305437 d!142115))

(declare-fun d!142117 () Bool)

(assert (=> d!142117 (= (apply!1026 lt!584483 lt!584476) (get!21191 (getValueByKey!709 (toList!10171 lt!584483) lt!584476)))))

(declare-fun bs!37196 () Bool)

(assert (= bs!37196 d!142117))

(declare-fun m!1196767 () Bool)

(assert (=> bs!37196 m!1196767))

(assert (=> bs!37196 m!1196767))

(declare-fun m!1196769 () Bool)

(assert (=> bs!37196 m!1196769))

(assert (=> b!1305437 d!142117))

(declare-fun d!142119 () Bool)

(declare-fun e!744746 () Bool)

(assert (=> d!142119 e!744746))

(declare-fun res!866919 () Bool)

(assert (=> d!142119 (=> (not res!866919) (not e!744746))))

(declare-fun lt!584589 () ListLongMap!20311)

(assert (=> d!142119 (= res!866919 (contains!8315 lt!584589 (_1!11338 (tuple2!22655 lt!584479 zeroValue!1387))))))

(declare-fun lt!584590 () List!29774)

(assert (=> d!142119 (= lt!584589 (ListLongMap!20312 lt!584590))))

(declare-fun lt!584588 () Unit!43227)

(declare-fun lt!584591 () Unit!43227)

(assert (=> d!142119 (= lt!584588 lt!584591)))

(assert (=> d!142119 (= (getValueByKey!709 lt!584590 (_1!11338 (tuple2!22655 lt!584479 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584479 zeroValue!1387))))))

(assert (=> d!142119 (= lt!584591 (lemmaContainsTupThenGetReturnValue!355 lt!584590 (_1!11338 (tuple2!22655 lt!584479 zeroValue!1387)) (_2!11338 (tuple2!22655 lt!584479 zeroValue!1387))))))

(assert (=> d!142119 (= lt!584590 (insertStrictlySorted!484 (toList!10171 lt!584483) (_1!11338 (tuple2!22655 lt!584479 zeroValue!1387)) (_2!11338 (tuple2!22655 lt!584479 zeroValue!1387))))))

(assert (=> d!142119 (= (+!4491 lt!584483 (tuple2!22655 lt!584479 zeroValue!1387)) lt!584589)))

(declare-fun b!1305615 () Bool)

(declare-fun res!866918 () Bool)

(assert (=> b!1305615 (=> (not res!866918) (not e!744746))))

(assert (=> b!1305615 (= res!866918 (= (getValueByKey!709 (toList!10171 lt!584589) (_1!11338 (tuple2!22655 lt!584479 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584479 zeroValue!1387)))))))

(declare-fun b!1305616 () Bool)

(assert (=> b!1305616 (= e!744746 (contains!8317 (toList!10171 lt!584589) (tuple2!22655 lt!584479 zeroValue!1387)))))

(assert (= (and d!142119 res!866919) b!1305615))

(assert (= (and b!1305615 res!866918) b!1305616))

(declare-fun m!1196771 () Bool)

(assert (=> d!142119 m!1196771))

(declare-fun m!1196773 () Bool)

(assert (=> d!142119 m!1196773))

(declare-fun m!1196775 () Bool)

(assert (=> d!142119 m!1196775))

(declare-fun m!1196777 () Bool)

(assert (=> d!142119 m!1196777))

(declare-fun m!1196779 () Bool)

(assert (=> b!1305615 m!1196779))

(declare-fun m!1196781 () Bool)

(assert (=> b!1305616 m!1196781))

(assert (=> b!1305437 d!142119))

(declare-fun d!142121 () Bool)

(assert (=> d!142121 (contains!8315 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387)) lt!584489)))

(declare-fun lt!584594 () Unit!43227)

(declare-fun choose!1939 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> d!142121 (= lt!584594 (choose!1939 lt!584475 lt!584486 zeroValue!1387 lt!584489))))

(assert (=> d!142121 (contains!8315 lt!584475 lt!584489)))

(assert (=> d!142121 (= (addStillContains!1114 lt!584475 lt!584486 zeroValue!1387 lt!584489) lt!584594)))

(declare-fun bs!37197 () Bool)

(assert (= bs!37197 d!142121))

(assert (=> bs!37197 m!1196437))

(assert (=> bs!37197 m!1196437))

(assert (=> bs!37197 m!1196441))

(declare-fun m!1196783 () Bool)

(assert (=> bs!37197 m!1196783))

(declare-fun m!1196785 () Bool)

(assert (=> bs!37197 m!1196785))

(assert (=> b!1305437 d!142121))

(declare-fun d!142123 () Bool)

(declare-fun e!744747 () Bool)

(assert (=> d!142123 e!744747))

(declare-fun res!866921 () Bool)

(assert (=> d!142123 (=> (not res!866921) (not e!744747))))

(declare-fun lt!584596 () ListLongMap!20311)

(assert (=> d!142123 (= res!866921 (contains!8315 lt!584596 (_1!11338 (tuple2!22655 lt!584486 zeroValue!1387))))))

(declare-fun lt!584597 () List!29774)

(assert (=> d!142123 (= lt!584596 (ListLongMap!20312 lt!584597))))

(declare-fun lt!584595 () Unit!43227)

(declare-fun lt!584598 () Unit!43227)

(assert (=> d!142123 (= lt!584595 lt!584598)))

(assert (=> d!142123 (= (getValueByKey!709 lt!584597 (_1!11338 (tuple2!22655 lt!584486 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584486 zeroValue!1387))))))

(assert (=> d!142123 (= lt!584598 (lemmaContainsTupThenGetReturnValue!355 lt!584597 (_1!11338 (tuple2!22655 lt!584486 zeroValue!1387)) (_2!11338 (tuple2!22655 lt!584486 zeroValue!1387))))))

(assert (=> d!142123 (= lt!584597 (insertStrictlySorted!484 (toList!10171 lt!584475) (_1!11338 (tuple2!22655 lt!584486 zeroValue!1387)) (_2!11338 (tuple2!22655 lt!584486 zeroValue!1387))))))

(assert (=> d!142123 (= (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387)) lt!584596)))

(declare-fun b!1305618 () Bool)

(declare-fun res!866920 () Bool)

(assert (=> b!1305618 (=> (not res!866920) (not e!744747))))

(assert (=> b!1305618 (= res!866920 (= (getValueByKey!709 (toList!10171 lt!584596) (_1!11338 (tuple2!22655 lt!584486 zeroValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584486 zeroValue!1387)))))))

(declare-fun b!1305619 () Bool)

(assert (=> b!1305619 (= e!744747 (contains!8317 (toList!10171 lt!584596) (tuple2!22655 lt!584486 zeroValue!1387)))))

(assert (= (and d!142123 res!866921) b!1305618))

(assert (= (and b!1305618 res!866920) b!1305619))

(declare-fun m!1196787 () Bool)

(assert (=> d!142123 m!1196787))

(declare-fun m!1196789 () Bool)

(assert (=> d!142123 m!1196789))

(declare-fun m!1196791 () Bool)

(assert (=> d!142123 m!1196791))

(declare-fun m!1196793 () Bool)

(assert (=> d!142123 m!1196793))

(declare-fun m!1196795 () Bool)

(assert (=> b!1305618 m!1196795))

(declare-fun m!1196797 () Bool)

(assert (=> b!1305619 m!1196797))

(assert (=> b!1305437 d!142123))

(declare-fun d!142125 () Bool)

(assert (=> d!142125 (= (apply!1026 lt!584493 lt!584482) (get!21191 (getValueByKey!709 (toList!10171 lt!584493) lt!584482)))))

(declare-fun bs!37198 () Bool)

(assert (= bs!37198 d!142125))

(declare-fun m!1196799 () Bool)

(assert (=> bs!37198 m!1196799))

(assert (=> bs!37198 m!1196799))

(declare-fun m!1196801 () Bool)

(assert (=> bs!37198 m!1196801))

(assert (=> b!1305437 d!142125))

(declare-fun d!142127 () Bool)

(assert (=> d!142127 (= (apply!1026 (+!4491 lt!584493 (tuple2!22655 lt!584491 minValue!1387)) lt!584482) (apply!1026 lt!584493 lt!584482))))

(declare-fun lt!584601 () Unit!43227)

(declare-fun choose!1940 (ListLongMap!20311 (_ BitVec 64) V!51699 (_ BitVec 64)) Unit!43227)

(assert (=> d!142127 (= lt!584601 (choose!1940 lt!584493 lt!584491 minValue!1387 lt!584482))))

(declare-fun e!744750 () Bool)

(assert (=> d!142127 e!744750))

(declare-fun res!866924 () Bool)

(assert (=> d!142127 (=> (not res!866924) (not e!744750))))

(assert (=> d!142127 (= res!866924 (contains!8315 lt!584493 lt!584482))))

(assert (=> d!142127 (= (addApplyDifferent!568 lt!584493 lt!584491 minValue!1387 lt!584482) lt!584601)))

(declare-fun b!1305623 () Bool)

(assert (=> b!1305623 (= e!744750 (not (= lt!584482 lt!584491)))))

(assert (= (and d!142127 res!866924) b!1305623))

(declare-fun m!1196803 () Bool)

(assert (=> d!142127 m!1196803))

(assert (=> d!142127 m!1196459))

(assert (=> d!142127 m!1196433))

(declare-fun m!1196805 () Bool)

(assert (=> d!142127 m!1196805))

(assert (=> d!142127 m!1196433))

(assert (=> d!142127 m!1196435))

(assert (=> b!1305437 d!142127))

(declare-fun d!142129 () Bool)

(assert (=> d!142129 (= (apply!1026 (+!4491 lt!584483 (tuple2!22655 lt!584479 zeroValue!1387)) lt!584476) (get!21191 (getValueByKey!709 (toList!10171 (+!4491 lt!584483 (tuple2!22655 lt!584479 zeroValue!1387))) lt!584476)))))

(declare-fun bs!37199 () Bool)

(assert (= bs!37199 d!142129))

(declare-fun m!1196807 () Bool)

(assert (=> bs!37199 m!1196807))

(assert (=> bs!37199 m!1196807))

(declare-fun m!1196809 () Bool)

(assert (=> bs!37199 m!1196809))

(assert (=> b!1305437 d!142129))

(declare-fun d!142131 () Bool)

(assert (=> d!142131 (= (apply!1026 (+!4491 lt!584485 (tuple2!22655 lt!584478 minValue!1387)) lt!584487) (apply!1026 lt!584485 lt!584487))))

(declare-fun lt!584602 () Unit!43227)

(assert (=> d!142131 (= lt!584602 (choose!1940 lt!584485 lt!584478 minValue!1387 lt!584487))))

(declare-fun e!744751 () Bool)

(assert (=> d!142131 e!744751))

(declare-fun res!866925 () Bool)

(assert (=> d!142131 (=> (not res!866925) (not e!744751))))

(assert (=> d!142131 (= res!866925 (contains!8315 lt!584485 lt!584487))))

(assert (=> d!142131 (= (addApplyDifferent!568 lt!584485 lt!584478 minValue!1387 lt!584487) lt!584602)))

(declare-fun b!1305624 () Bool)

(assert (=> b!1305624 (= e!744751 (not (= lt!584487 lt!584478)))))

(assert (= (and d!142131 res!866925) b!1305624))

(declare-fun m!1196811 () Bool)

(assert (=> d!142131 m!1196811))

(assert (=> d!142131 m!1196445))

(assert (=> d!142131 m!1196449))

(declare-fun m!1196813 () Bool)

(assert (=> d!142131 m!1196813))

(assert (=> d!142131 m!1196449))

(assert (=> d!142131 m!1196461))

(assert (=> b!1305437 d!142131))

(declare-fun d!142133 () Bool)

(declare-fun e!744752 () Bool)

(assert (=> d!142133 e!744752))

(declare-fun res!866927 () Bool)

(assert (=> d!142133 (=> (not res!866927) (not e!744752))))

(declare-fun lt!584604 () ListLongMap!20311)

(assert (=> d!142133 (= res!866927 (contains!8315 lt!584604 (_1!11338 (tuple2!22655 lt!584478 minValue!1387))))))

(declare-fun lt!584605 () List!29774)

(assert (=> d!142133 (= lt!584604 (ListLongMap!20312 lt!584605))))

(declare-fun lt!584603 () Unit!43227)

(declare-fun lt!584606 () Unit!43227)

(assert (=> d!142133 (= lt!584603 lt!584606)))

(assert (=> d!142133 (= (getValueByKey!709 lt!584605 (_1!11338 (tuple2!22655 lt!584478 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584478 minValue!1387))))))

(assert (=> d!142133 (= lt!584606 (lemmaContainsTupThenGetReturnValue!355 lt!584605 (_1!11338 (tuple2!22655 lt!584478 minValue!1387)) (_2!11338 (tuple2!22655 lt!584478 minValue!1387))))))

(assert (=> d!142133 (= lt!584605 (insertStrictlySorted!484 (toList!10171 lt!584485) (_1!11338 (tuple2!22655 lt!584478 minValue!1387)) (_2!11338 (tuple2!22655 lt!584478 minValue!1387))))))

(assert (=> d!142133 (= (+!4491 lt!584485 (tuple2!22655 lt!584478 minValue!1387)) lt!584604)))

(declare-fun b!1305625 () Bool)

(declare-fun res!866926 () Bool)

(assert (=> b!1305625 (=> (not res!866926) (not e!744752))))

(assert (=> b!1305625 (= res!866926 (= (getValueByKey!709 (toList!10171 lt!584604) (_1!11338 (tuple2!22655 lt!584478 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 lt!584478 minValue!1387)))))))

(declare-fun b!1305626 () Bool)

(assert (=> b!1305626 (= e!744752 (contains!8317 (toList!10171 lt!584604) (tuple2!22655 lt!584478 minValue!1387)))))

(assert (= (and d!142133 res!866927) b!1305625))

(assert (= (and b!1305625 res!866926) b!1305626))

(declare-fun m!1196815 () Bool)

(assert (=> d!142133 m!1196815))

(declare-fun m!1196817 () Bool)

(assert (=> d!142133 m!1196817))

(declare-fun m!1196819 () Bool)

(assert (=> d!142133 m!1196819))

(declare-fun m!1196821 () Bool)

(assert (=> d!142133 m!1196821))

(declare-fun m!1196823 () Bool)

(assert (=> b!1305625 m!1196823))

(declare-fun m!1196825 () Bool)

(assert (=> b!1305626 m!1196825))

(assert (=> b!1305437 d!142133))

(declare-fun d!142135 () Bool)

(declare-fun e!744753 () Bool)

(assert (=> d!142135 e!744753))

(declare-fun res!866928 () Bool)

(assert (=> d!142135 (=> res!866928 e!744753)))

(declare-fun lt!584610 () Bool)

(assert (=> d!142135 (= res!866928 (not lt!584610))))

(declare-fun lt!584609 () Bool)

(assert (=> d!142135 (= lt!584610 lt!584609)))

(declare-fun lt!584607 () Unit!43227)

(declare-fun e!744754 () Unit!43227)

(assert (=> d!142135 (= lt!584607 e!744754)))

(declare-fun c!125451 () Bool)

(assert (=> d!142135 (= c!125451 lt!584609)))

(assert (=> d!142135 (= lt!584609 (containsKey!731 (toList!10171 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387))) lt!584489))))

(assert (=> d!142135 (= (contains!8315 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387)) lt!584489) lt!584610)))

(declare-fun b!1305627 () Bool)

(declare-fun lt!584608 () Unit!43227)

(assert (=> b!1305627 (= e!744754 lt!584608)))

(assert (=> b!1305627 (= lt!584608 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387))) lt!584489))))

(assert (=> b!1305627 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387))) lt!584489))))

(declare-fun b!1305628 () Bool)

(declare-fun Unit!43246 () Unit!43227)

(assert (=> b!1305628 (= e!744754 Unit!43246)))

(declare-fun b!1305629 () Bool)

(assert (=> b!1305629 (= e!744753 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 lt!584475 (tuple2!22655 lt!584486 zeroValue!1387))) lt!584489)))))

(assert (= (and d!142135 c!125451) b!1305627))

(assert (= (and d!142135 (not c!125451)) b!1305628))

(assert (= (and d!142135 (not res!866928)) b!1305629))

(declare-fun m!1196827 () Bool)

(assert (=> d!142135 m!1196827))

(declare-fun m!1196829 () Bool)

(assert (=> b!1305627 m!1196829))

(declare-fun m!1196831 () Bool)

(assert (=> b!1305627 m!1196831))

(assert (=> b!1305627 m!1196831))

(declare-fun m!1196833 () Bool)

(assert (=> b!1305627 m!1196833))

(assert (=> b!1305629 m!1196831))

(assert (=> b!1305629 m!1196831))

(assert (=> b!1305629 m!1196833))

(assert (=> b!1305437 d!142135))

(declare-fun d!142137 () Bool)

(assert (=> d!142137 (= (apply!1026 lt!584485 lt!584487) (get!21191 (getValueByKey!709 (toList!10171 lt!584485) lt!584487)))))

(declare-fun bs!37200 () Bool)

(assert (= bs!37200 d!142137))

(declare-fun m!1196835 () Bool)

(assert (=> bs!37200 m!1196835))

(assert (=> bs!37200 m!1196835))

(declare-fun m!1196837 () Bool)

(assert (=> bs!37200 m!1196837))

(assert (=> b!1305437 d!142137))

(assert (=> b!1305437 d!141983))

(declare-fun d!142139 () Bool)

(assert (=> d!142139 (= (apply!1026 (+!4491 lt!584485 (tuple2!22655 lt!584478 minValue!1387)) lt!584487) (get!21191 (getValueByKey!709 (toList!10171 (+!4491 lt!584485 (tuple2!22655 lt!584478 minValue!1387))) lt!584487)))))

(declare-fun bs!37201 () Bool)

(assert (= bs!37201 d!142139))

(declare-fun m!1196839 () Bool)

(assert (=> bs!37201 m!1196839))

(assert (=> bs!37201 m!1196839))

(declare-fun m!1196841 () Bool)

(assert (=> bs!37201 m!1196841))

(assert (=> b!1305437 d!142139))

(declare-fun d!142141 () Bool)

(assert (=> d!142141 (= (apply!1026 (+!4491 lt!584483 (tuple2!22655 lt!584479 zeroValue!1387)) lt!584476) (apply!1026 lt!584483 lt!584476))))

(declare-fun lt!584611 () Unit!43227)

(assert (=> d!142141 (= lt!584611 (choose!1940 lt!584483 lt!584479 zeroValue!1387 lt!584476))))

(declare-fun e!744755 () Bool)

(assert (=> d!142141 e!744755))

(declare-fun res!866929 () Bool)

(assert (=> d!142141 (=> (not res!866929) (not e!744755))))

(assert (=> d!142141 (= res!866929 (contains!8315 lt!584483 lt!584476))))

(assert (=> d!142141 (= (addApplyDifferent!568 lt!584483 lt!584479 zeroValue!1387 lt!584476) lt!584611)))

(declare-fun b!1305630 () Bool)

(assert (=> b!1305630 (= e!744755 (not (= lt!584476 lt!584479)))))

(assert (= (and d!142141 res!866929) b!1305630))

(declare-fun m!1196843 () Bool)

(assert (=> d!142141 m!1196843))

(assert (=> d!142141 m!1196455))

(assert (=> d!142141 m!1196439))

(declare-fun m!1196845 () Bool)

(assert (=> d!142141 m!1196845))

(assert (=> d!142141 m!1196439))

(assert (=> d!142141 m!1196451))

(assert (=> b!1305437 d!142141))

(declare-fun d!142143 () Bool)

(assert (=> d!142143 (= (apply!1026 (+!4491 lt!584493 (tuple2!22655 lt!584491 minValue!1387)) lt!584482) (get!21191 (getValueByKey!709 (toList!10171 (+!4491 lt!584493 (tuple2!22655 lt!584491 minValue!1387))) lt!584482)))))

(declare-fun bs!37202 () Bool)

(assert (= bs!37202 d!142143))

(declare-fun m!1196847 () Bool)

(assert (=> bs!37202 m!1196847))

(assert (=> bs!37202 m!1196847))

(declare-fun m!1196849 () Bool)

(assert (=> bs!37202 m!1196849))

(assert (=> b!1305437 d!142143))

(assert (=> bm!64460 d!141983))

(assert (=> b!1305336 d!142007))

(declare-fun d!142145 () Bool)

(declare-fun e!744756 () Bool)

(assert (=> d!142145 e!744756))

(declare-fun res!866930 () Bool)

(assert (=> d!142145 (=> res!866930 e!744756)))

(declare-fun lt!584615 () Bool)

(assert (=> d!142145 (= res!866930 (not lt!584615))))

(declare-fun lt!584614 () Bool)

(assert (=> d!142145 (= lt!584615 lt!584614)))

(declare-fun lt!584612 () Unit!43227)

(declare-fun e!744757 () Unit!43227)

(assert (=> d!142145 (= lt!584612 e!744757)))

(declare-fun c!125452 () Bool)

(assert (=> d!142145 (= c!125452 lt!584614)))

(assert (=> d!142145 (= lt!584614 (containsKey!731 (toList!10171 lt!584379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142145 (= (contains!8315 lt!584379 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584615)))

(declare-fun b!1305631 () Bool)

(declare-fun lt!584613 () Unit!43227)

(assert (=> b!1305631 (= e!744757 lt!584613)))

(assert (=> b!1305631 (= lt!584613 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305631 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305632 () Bool)

(declare-fun Unit!43247 () Unit!43227)

(assert (=> b!1305632 (= e!744757 Unit!43247)))

(declare-fun b!1305633 () Bool)

(assert (=> b!1305633 (= e!744756 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584379) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142145 c!125452) b!1305631))

(assert (= (and d!142145 (not c!125452)) b!1305632))

(assert (= (and d!142145 (not res!866930)) b!1305633))

(declare-fun m!1196851 () Bool)

(assert (=> d!142145 m!1196851))

(declare-fun m!1196853 () Bool)

(assert (=> b!1305631 m!1196853))

(declare-fun m!1196855 () Bool)

(assert (=> b!1305631 m!1196855))

(assert (=> b!1305631 m!1196855))

(declare-fun m!1196857 () Bool)

(assert (=> b!1305631 m!1196857))

(assert (=> b!1305633 m!1196855))

(assert (=> b!1305633 m!1196855))

(assert (=> b!1305633 m!1196857))

(assert (=> d!141983 d!142145))

(assert (=> d!141983 d!141985))

(declare-fun d!142147 () Bool)

(assert (=> d!142147 (= (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205)) (not (isEmpty!1071 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))))

(declare-fun bs!37203 () Bool)

(assert (= bs!37203 d!142147))

(assert (=> bs!37203 m!1196365))

(declare-fun m!1196859 () Bool)

(assert (=> bs!37203 m!1196859))

(assert (=> b!1305352 d!142147))

(declare-fun e!744759 () Option!761)

(declare-fun b!1305636 () Bool)

(assert (=> b!1305636 (= e!744759 (getValueByKey!709 (t!43376 (toList!10171 (ite c!125358 lt!584289 call!64393))) k0!1205))))

(declare-fun b!1305635 () Bool)

(declare-fun e!744758 () Option!761)

(assert (=> b!1305635 (= e!744758 e!744759)))

(declare-fun c!125454 () Bool)

(assert (=> b!1305635 (= c!125454 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 call!64393))) (not (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393)))) k0!1205))))))

(declare-fun b!1305637 () Bool)

(assert (=> b!1305637 (= e!744759 None!759)))

(declare-fun c!125453 () Bool)

(declare-fun d!142149 () Bool)

(assert (=> d!142149 (= c!125453 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 call!64393))) (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393)))) k0!1205)))))

(assert (=> d!142149 (= (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205) e!744758)))

(declare-fun b!1305634 () Bool)

(assert (=> b!1305634 (= e!744758 (Some!760 (_2!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 call!64393))))))))

(assert (= (and d!142149 c!125453) b!1305634))

(assert (= (and d!142149 (not c!125453)) b!1305635))

(assert (= (and b!1305635 c!125454) b!1305636))

(assert (= (and b!1305635 (not c!125454)) b!1305637))

(declare-fun m!1196861 () Bool)

(assert (=> b!1305636 m!1196861))

(assert (=> b!1305352 d!142149))

(declare-fun d!142151 () Bool)

(assert (=> d!142151 (isDefined!516 (getValueByKey!709 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(declare-fun lt!584616 () Unit!43227)

(assert (=> d!142151 (= lt!584616 (choose!1938 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(declare-fun e!744760 () Bool)

(assert (=> d!142151 e!744760))

(declare-fun res!866931 () Bool)

(assert (=> d!142151 (=> (not res!866931) (not e!744760))))

(assert (=> d!142151 (= res!866931 (isStrictlySorted!874 (toList!10171 (ListLongMap!20312 Nil!29771))))))

(assert (=> d!142151 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205) lt!584616)))

(declare-fun b!1305638 () Bool)

(assert (=> b!1305638 (= e!744760 (containsKey!731 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205))))

(assert (= (and d!142151 res!866931) b!1305638))

(assert (=> d!142151 m!1196403))

(assert (=> d!142151 m!1196403))

(assert (=> d!142151 m!1196405))

(declare-fun m!1196863 () Bool)

(assert (=> d!142151 m!1196863))

(declare-fun m!1196865 () Bool)

(assert (=> d!142151 m!1196865))

(assert (=> b!1305638 m!1196399))

(assert (=> b!1305366 d!142151))

(assert (=> b!1305366 d!142105))

(assert (=> b!1305366 d!142107))

(declare-fun d!142153 () Bool)

(assert (=> d!142153 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(declare-fun lt!584617 () Unit!43227)

(assert (=> d!142153 (= lt!584617 (choose!1938 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(declare-fun e!744761 () Bool)

(assert (=> d!142153 e!744761))

(declare-fun res!866932 () Bool)

(assert (=> d!142153 (=> (not res!866932) (not e!744761))))

(assert (=> d!142153 (= res!866932 (isStrictlySorted!874 (toList!10171 (ite c!125358 lt!584289 call!64393))))))

(assert (=> d!142153 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205) lt!584617)))

(declare-fun b!1305639 () Bool)

(assert (=> b!1305639 (= e!744761 (containsKey!731 (toList!10171 (ite c!125358 lt!584289 call!64393)) k0!1205))))

(assert (= (and d!142153 res!866932) b!1305639))

(assert (=> d!142153 m!1196365))

(assert (=> d!142153 m!1196365))

(assert (=> d!142153 m!1196367))

(declare-fun m!1196867 () Bool)

(assert (=> d!142153 m!1196867))

(declare-fun m!1196869 () Bool)

(assert (=> d!142153 m!1196869))

(assert (=> b!1305639 m!1196361))

(assert (=> b!1305350 d!142153))

(assert (=> b!1305350 d!142147))

(assert (=> b!1305350 d!142149))

(declare-fun d!142155 () Bool)

(declare-fun res!866933 () Bool)

(declare-fun e!744762 () Bool)

(assert (=> d!142155 (=> res!866933 e!744762)))

(assert (=> d!142155 (= res!866933 (and ((_ is Cons!29770) (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(assert (=> d!142155 (= (containsKey!731 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!744762)))

(declare-fun b!1305640 () Bool)

(declare-fun e!744763 () Bool)

(assert (=> b!1305640 (= e!744762 e!744763)))

(declare-fun res!866934 () Bool)

(assert (=> b!1305640 (=> (not res!866934) (not e!744763))))

(assert (=> b!1305640 (= res!866934 (and (or (not ((_ is Cons!29770) (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) (bvsle (_1!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)) ((_ is Cons!29770) (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (bvslt (_1!11338 (h!30979 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(declare-fun b!1305641 () Bool)

(assert (=> b!1305641 (= e!744763 (containsKey!731 (t!43376 (toList!10171 (+!4491 lt!584289 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(assert (= (and d!142155 (not res!866933)) b!1305640))

(assert (= (and b!1305640 res!866934) b!1305641))

(declare-fun m!1196871 () Bool)

(assert (=> b!1305641 m!1196871))

(assert (=> d!141995 d!142155))

(declare-fun d!142157 () Bool)

(declare-fun e!744764 () Bool)

(assert (=> d!142157 e!744764))

(declare-fun res!866935 () Bool)

(assert (=> d!142157 (=> res!866935 e!744764)))

(declare-fun lt!584621 () Bool)

(assert (=> d!142157 (= res!866935 (not lt!584621))))

(declare-fun lt!584620 () Bool)

(assert (=> d!142157 (= lt!584621 lt!584620)))

(declare-fun lt!584618 () Unit!43227)

(declare-fun e!744765 () Unit!43227)

(assert (=> d!142157 (= lt!584618 e!744765)))

(declare-fun c!125455 () Bool)

(assert (=> d!142157 (= c!125455 lt!584620)))

(assert (=> d!142157 (= lt!584620 (containsKey!731 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142157 (= (contains!8315 lt!584403 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584621)))

(declare-fun b!1305642 () Bool)

(declare-fun lt!584619 () Unit!43227)

(assert (=> b!1305642 (= e!744765 lt!584619)))

(assert (=> b!1305642 (= lt!584619 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> b!1305642 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305643 () Bool)

(declare-fun Unit!43248 () Unit!43227)

(assert (=> b!1305643 (= e!744765 Unit!43248)))

(declare-fun b!1305644 () Bool)

(assert (=> b!1305644 (= e!744764 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584403) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142157 c!125455) b!1305642))

(assert (= (and d!142157 (not c!125455)) b!1305643))

(assert (= (and d!142157 (not res!866935)) b!1305644))

(declare-fun m!1196873 () Bool)

(assert (=> d!142157 m!1196873))

(declare-fun m!1196875 () Bool)

(assert (=> b!1305642 m!1196875))

(assert (=> b!1305642 m!1196389))

(assert (=> b!1305642 m!1196389))

(declare-fun m!1196877 () Bool)

(assert (=> b!1305642 m!1196877))

(assert (=> b!1305644 m!1196389))

(assert (=> b!1305644 m!1196389))

(assert (=> b!1305644 m!1196877))

(assert (=> d!141997 d!142157))

(declare-fun b!1305647 () Bool)

(declare-fun e!744767 () Option!761)

(assert (=> b!1305647 (= e!744767 (getValueByKey!709 (t!43376 lt!584404) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305646 () Bool)

(declare-fun e!744766 () Option!761)

(assert (=> b!1305646 (= e!744766 e!744767)))

(declare-fun c!125457 () Bool)

(assert (=> b!1305646 (= c!125457 (and ((_ is Cons!29770) lt!584404) (not (= (_1!11338 (h!30979 lt!584404)) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305648 () Bool)

(assert (=> b!1305648 (= e!744767 None!759)))

(declare-fun d!142159 () Bool)

(declare-fun c!125456 () Bool)

(assert (=> d!142159 (= c!125456 (and ((_ is Cons!29770) lt!584404) (= (_1!11338 (h!30979 lt!584404)) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142159 (= (getValueByKey!709 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!744766)))

(declare-fun b!1305645 () Bool)

(assert (=> b!1305645 (= e!744766 (Some!760 (_2!11338 (h!30979 lt!584404))))))

(assert (= (and d!142159 c!125456) b!1305645))

(assert (= (and d!142159 (not c!125456)) b!1305646))

(assert (= (and b!1305646 c!125457) b!1305647))

(assert (= (and b!1305646 (not c!125457)) b!1305648))

(declare-fun m!1196879 () Bool)

(assert (=> b!1305647 m!1196879))

(assert (=> d!141997 d!142159))

(declare-fun d!142161 () Bool)

(assert (=> d!142161 (= (getValueByKey!709 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584624 () Unit!43227)

(declare-fun choose!1941 (List!29774 (_ BitVec 64) V!51699) Unit!43227)

(assert (=> d!142161 (= lt!584624 (choose!1941 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!744770 () Bool)

(assert (=> d!142161 e!744770))

(declare-fun res!866940 () Bool)

(assert (=> d!142161 (=> (not res!866940) (not e!744770))))

(assert (=> d!142161 (= res!866940 (isStrictlySorted!874 lt!584404))))

(assert (=> d!142161 (= (lemmaContainsTupThenGetReturnValue!355 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584624)))

(declare-fun b!1305653 () Bool)

(declare-fun res!866941 () Bool)

(assert (=> b!1305653 (=> (not res!866941) (not e!744770))))

(assert (=> b!1305653 (= res!866941 (containsKey!731 lt!584404 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305654 () Bool)

(assert (=> b!1305654 (= e!744770 (contains!8317 lt!584404 (tuple2!22655 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142161 res!866940) b!1305653))

(assert (= (and b!1305653 res!866941) b!1305654))

(assert (=> d!142161 m!1196383))

(declare-fun m!1196881 () Bool)

(assert (=> d!142161 m!1196881))

(declare-fun m!1196883 () Bool)

(assert (=> d!142161 m!1196883))

(declare-fun m!1196885 () Bool)

(assert (=> b!1305653 m!1196885))

(declare-fun m!1196887 () Bool)

(assert (=> b!1305654 m!1196887))

(assert (=> d!141997 d!142161))

(declare-fun b!1305675 () Bool)

(declare-fun e!744783 () List!29774)

(declare-fun c!125467 () Bool)

(declare-fun c!125468 () Bool)

(assert (=> b!1305675 (= e!744783 (ite c!125467 (t!43376 (toList!10171 lt!584289)) (ite c!125468 (Cons!29770 (h!30979 (toList!10171 lt!584289)) (t!43376 (toList!10171 lt!584289))) Nil!29771)))))

(declare-fun b!1305676 () Bool)

(assert (=> b!1305676 (= e!744783 (insertStrictlySorted!484 (t!43376 (toList!10171 lt!584289)) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305677 () Bool)

(declare-fun e!744782 () List!29774)

(declare-fun e!744781 () List!29774)

(assert (=> b!1305677 (= e!744782 e!744781)))

(assert (=> b!1305677 (= c!125467 (and ((_ is Cons!29770) (toList!10171 lt!584289)) (= (_1!11338 (h!30979 (toList!10171 lt!584289))) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305679 () Bool)

(declare-fun call!64481 () List!29774)

(assert (=> b!1305679 (= e!744782 call!64481)))

(declare-fun bm!64476 () Bool)

(declare-fun call!64480 () List!29774)

(assert (=> bm!64476 (= call!64480 call!64481)))

(declare-fun bm!64477 () Bool)

(declare-fun call!64479 () List!29774)

(assert (=> bm!64477 (= call!64479 call!64480)))

(declare-fun b!1305680 () Bool)

(declare-fun e!744785 () List!29774)

(assert (=> b!1305680 (= e!744785 call!64479)))

(declare-fun b!1305681 () Bool)

(declare-fun e!744784 () Bool)

(declare-fun lt!584627 () List!29774)

(assert (=> b!1305681 (= e!744784 (contains!8317 lt!584627 (tuple2!22655 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun c!125469 () Bool)

(declare-fun bm!64478 () Bool)

(declare-fun $colon$colon!668 (List!29774 tuple2!22654) List!29774)

(assert (=> bm!64478 (= call!64481 ($colon$colon!668 e!744783 (ite c!125469 (h!30979 (toList!10171 lt!584289)) (tuple2!22655 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun c!125466 () Bool)

(assert (=> bm!64478 (= c!125466 c!125469)))

(declare-fun b!1305682 () Bool)

(assert (=> b!1305682 (= c!125468 (and ((_ is Cons!29770) (toList!10171 lt!584289)) (bvsgt (_1!11338 (h!30979 (toList!10171 lt!584289))) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> b!1305682 (= e!744781 e!744785)))

(declare-fun b!1305683 () Bool)

(declare-fun res!866946 () Bool)

(assert (=> b!1305683 (=> (not res!866946) (not e!744784))))

(assert (=> b!1305683 (= res!866946 (containsKey!731 lt!584627 (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305684 () Bool)

(assert (=> b!1305684 (= e!744785 call!64479)))

(declare-fun d!142163 () Bool)

(assert (=> d!142163 e!744784))

(declare-fun res!866947 () Bool)

(assert (=> d!142163 (=> (not res!866947) (not e!744784))))

(assert (=> d!142163 (= res!866947 (isStrictlySorted!874 lt!584627))))

(assert (=> d!142163 (= lt!584627 e!744782)))

(assert (=> d!142163 (= c!125469 (and ((_ is Cons!29770) (toList!10171 lt!584289)) (bvslt (_1!11338 (h!30979 (toList!10171 lt!584289))) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142163 (isStrictlySorted!874 (toList!10171 lt!584289))))

(assert (=> d!142163 (= (insertStrictlySorted!484 (toList!10171 lt!584289) (_1!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11338 (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584627)))

(declare-fun b!1305678 () Bool)

(assert (=> b!1305678 (= e!744781 call!64480)))

(assert (= (and d!142163 c!125469) b!1305679))

(assert (= (and d!142163 (not c!125469)) b!1305677))

(assert (= (and b!1305677 c!125467) b!1305678))

(assert (= (and b!1305677 (not c!125467)) b!1305682))

(assert (= (and b!1305682 c!125468) b!1305680))

(assert (= (and b!1305682 (not c!125468)) b!1305684))

(assert (= (or b!1305680 b!1305684) bm!64477))

(assert (= (or b!1305678 bm!64477) bm!64476))

(assert (= (or b!1305679 bm!64476) bm!64478))

(assert (= (and bm!64478 c!125466) b!1305676))

(assert (= (and bm!64478 (not c!125466)) b!1305675))

(assert (= (and d!142163 res!866947) b!1305683))

(assert (= (and b!1305683 res!866946) b!1305681))

(declare-fun m!1196889 () Bool)

(assert (=> b!1305683 m!1196889))

(declare-fun m!1196891 () Bool)

(assert (=> b!1305676 m!1196891))

(declare-fun m!1196893 () Bool)

(assert (=> b!1305681 m!1196893))

(declare-fun m!1196895 () Bool)

(assert (=> bm!64478 m!1196895))

(declare-fun m!1196897 () Bool)

(assert (=> d!142163 m!1196897))

(declare-fun m!1196899 () Bool)

(assert (=> d!142163 m!1196899))

(assert (=> d!141997 d!142163))

(assert (=> b!1305461 d!142035))

(declare-fun d!142165 () Bool)

(declare-fun e!744786 () Bool)

(assert (=> d!142165 e!744786))

(declare-fun res!866949 () Bool)

(assert (=> d!142165 (=> (not res!866949) (not e!744786))))

(declare-fun lt!584629 () ListLongMap!20311)

(assert (=> d!142165 (= res!866949 (contains!8315 lt!584629 (_1!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584630 () List!29774)

(assert (=> d!142165 (= lt!584629 (ListLongMap!20312 lt!584630))))

(declare-fun lt!584628 () Unit!43227)

(declare-fun lt!584631 () Unit!43227)

(assert (=> d!142165 (= lt!584628 lt!584631)))

(assert (=> d!142165 (= (getValueByKey!709 lt!584630 (_1!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142165 (= lt!584631 (lemmaContainsTupThenGetReturnValue!355 lt!584630 (_1!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142165 (= lt!584630 (insertStrictlySorted!484 (toList!10171 (ite c!125406 call!64465 (ite c!125402 call!64464 call!64463))) (_1!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142165 (= (+!4491 (ite c!125406 call!64465 (ite c!125402 call!64464 call!64463)) (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584629)))

(declare-fun b!1305685 () Bool)

(declare-fun res!866948 () Bool)

(assert (=> b!1305685 (=> (not res!866948) (not e!744786))))

(assert (=> b!1305685 (= res!866948 (= (getValueByKey!709 (toList!10171 lt!584629) (_1!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11338 (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305686 () Bool)

(assert (=> b!1305686 (= e!744786 (contains!8317 (toList!10171 lt!584629) (ite (or c!125406 c!125402) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142165 res!866949) b!1305685))

(assert (= (and b!1305685 res!866948) b!1305686))

(declare-fun m!1196901 () Bool)

(assert (=> d!142165 m!1196901))

(declare-fun m!1196903 () Bool)

(assert (=> d!142165 m!1196903))

(declare-fun m!1196905 () Bool)

(assert (=> d!142165 m!1196905))

(declare-fun m!1196907 () Bool)

(assert (=> d!142165 m!1196907))

(declare-fun m!1196909 () Bool)

(assert (=> b!1305685 m!1196909))

(declare-fun m!1196911 () Bool)

(assert (=> b!1305686 m!1196911))

(assert (=> bm!64463 d!142165))

(declare-fun d!142167 () Bool)

(declare-fun res!866950 () Bool)

(declare-fun e!744787 () Bool)

(assert (=> d!142167 (=> res!866950 e!744787)))

(assert (=> d!142167 (= res!866950 (and ((_ is Cons!29770) (toList!10171 (ListLongMap!20312 Nil!29771))) (= (_1!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771)))) k0!1205)))))

(assert (=> d!142167 (= (containsKey!731 (toList!10171 (ListLongMap!20312 Nil!29771)) k0!1205) e!744787)))

(declare-fun b!1305687 () Bool)

(declare-fun e!744788 () Bool)

(assert (=> b!1305687 (= e!744787 e!744788)))

(declare-fun res!866951 () Bool)

(assert (=> b!1305687 (=> (not res!866951) (not e!744788))))

(assert (=> b!1305687 (= res!866951 (and (or (not ((_ is Cons!29770) (toList!10171 (ListLongMap!20312 Nil!29771)))) (bvsle (_1!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771)))) k0!1205)) ((_ is Cons!29770) (toList!10171 (ListLongMap!20312 Nil!29771))) (bvslt (_1!11338 (h!30979 (toList!10171 (ListLongMap!20312 Nil!29771)))) k0!1205)))))

(declare-fun b!1305688 () Bool)

(assert (=> b!1305688 (= e!744788 (containsKey!731 (t!43376 (toList!10171 (ListLongMap!20312 Nil!29771))) k0!1205))))

(assert (= (and d!142167 (not res!866950)) b!1305687))

(assert (= (and b!1305687 res!866951) b!1305688))

(declare-fun m!1196913 () Bool)

(assert (=> b!1305688 m!1196913))

(assert (=> d!142001 d!142167))

(declare-fun call!64482 () Bool)

(declare-fun bm!64479 () Bool)

(declare-fun c!125470 () Bool)

(assert (=> bm!64479 (= call!64482 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125470 (Cons!29771 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125410 (Cons!29771 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) Nil!29772) Nil!29772)) (ite c!125410 (Cons!29771 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) Nil!29772) Nil!29772))))))

(declare-fun b!1305689 () Bool)

(declare-fun e!744791 () Bool)

(assert (=> b!1305689 (= e!744791 call!64482)))

(declare-fun b!1305690 () Bool)

(declare-fun e!744790 () Bool)

(declare-fun e!744789 () Bool)

(assert (=> b!1305690 (= e!744790 e!744789)))

(declare-fun res!866952 () Bool)

(assert (=> b!1305690 (=> (not res!866952) (not e!744789))))

(declare-fun e!744792 () Bool)

(assert (=> b!1305690 (= res!866952 (not e!744792))))

(declare-fun res!866954 () Bool)

(assert (=> b!1305690 (=> (not res!866954) (not e!744792))))

(assert (=> b!1305690 (= res!866954 (validKeyInArray!0 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142169 () Bool)

(declare-fun res!866953 () Bool)

(assert (=> d!142169 (=> res!866953 e!744790)))

(assert (=> d!142169 (= res!866953 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142169 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125410 (Cons!29771 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) Nil!29772) Nil!29772)) e!744790)))

(declare-fun b!1305691 () Bool)

(assert (=> b!1305691 (= e!744792 (contains!8318 (ite c!125410 (Cons!29771 (select (arr!41942 _keys!1741) #b00000000000000000000000000000000) Nil!29772) Nil!29772) (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1305692 () Bool)

(assert (=> b!1305692 (= e!744791 call!64482)))

(declare-fun b!1305693 () Bool)

(assert (=> b!1305693 (= e!744789 e!744791)))

(assert (=> b!1305693 (= c!125470 (validKeyInArray!0 (select (arr!41942 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142169 (not res!866953)) b!1305690))

(assert (= (and b!1305690 res!866954) b!1305691))

(assert (= (and b!1305690 res!866952) b!1305693))

(assert (= (and b!1305693 c!125470) b!1305692))

(assert (= (and b!1305693 (not c!125470)) b!1305689))

(assert (= (or b!1305692 b!1305689) bm!64479))

(assert (=> bm!64479 m!1196511))

(declare-fun m!1196915 () Bool)

(assert (=> bm!64479 m!1196915))

(assert (=> b!1305690 m!1196511))

(assert (=> b!1305690 m!1196511))

(assert (=> b!1305690 m!1196519))

(assert (=> b!1305691 m!1196511))

(assert (=> b!1305691 m!1196511))

(declare-fun m!1196917 () Bool)

(assert (=> b!1305691 m!1196917))

(assert (=> b!1305693 m!1196511))

(assert (=> b!1305693 m!1196511))

(assert (=> b!1305693 m!1196519))

(assert (=> bm!64467 d!142169))

(declare-fun d!142171 () Bool)

(assert (=> d!142171 (= (apply!1026 lt!584477 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21191 (getValueByKey!709 (toList!10171 lt!584477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37204 () Bool)

(assert (= bs!37204 d!142171))

(declare-fun m!1196919 () Bool)

(assert (=> bs!37204 m!1196919))

(assert (=> bs!37204 m!1196919))

(declare-fun m!1196921 () Bool)

(assert (=> bs!37204 m!1196921))

(assert (=> b!1305443 d!142171))

(declare-fun d!142173 () Bool)

(declare-fun e!744793 () Bool)

(assert (=> d!142173 e!744793))

(declare-fun res!866955 () Bool)

(assert (=> d!142173 (=> res!866955 e!744793)))

(declare-fun lt!584635 () Bool)

(assert (=> d!142173 (= res!866955 (not lt!584635))))

(declare-fun lt!584634 () Bool)

(assert (=> d!142173 (= lt!584635 lt!584634)))

(declare-fun lt!584632 () Unit!43227)

(declare-fun e!744794 () Unit!43227)

(assert (=> d!142173 (= lt!584632 e!744794)))

(declare-fun c!125471 () Bool)

(assert (=> d!142173 (= c!125471 lt!584634)))

(assert (=> d!142173 (= lt!584634 (containsKey!731 (toList!10171 lt!584477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142173 (= (contains!8315 lt!584477 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584635)))

(declare-fun b!1305694 () Bool)

(declare-fun lt!584633 () Unit!43227)

(assert (=> b!1305694 (= e!744794 lt!584633)))

(assert (=> b!1305694 (= lt!584633 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305694 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305695 () Bool)

(declare-fun Unit!43249 () Unit!43227)

(assert (=> b!1305695 (= e!744794 Unit!43249)))

(declare-fun b!1305696 () Bool)

(assert (=> b!1305696 (= e!744793 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142173 c!125471) b!1305694))

(assert (= (and d!142173 (not c!125471)) b!1305695))

(assert (= (and d!142173 (not res!866955)) b!1305696))

(declare-fun m!1196923 () Bool)

(assert (=> d!142173 m!1196923))

(declare-fun m!1196925 () Bool)

(assert (=> b!1305694 m!1196925))

(assert (=> b!1305694 m!1196919))

(assert (=> b!1305694 m!1196919))

(declare-fun m!1196927 () Bool)

(assert (=> b!1305694 m!1196927))

(assert (=> b!1305696 m!1196919))

(assert (=> b!1305696 m!1196919))

(assert (=> b!1305696 m!1196927))

(assert (=> bm!64458 d!142173))

(declare-fun d!142175 () Bool)

(declare-fun e!744795 () Bool)

(assert (=> d!142175 e!744795))

(declare-fun res!866956 () Bool)

(assert (=> d!142175 (=> res!866956 e!744795)))

(declare-fun lt!584639 () Bool)

(assert (=> d!142175 (= res!866956 (not lt!584639))))

(declare-fun lt!584638 () Bool)

(assert (=> d!142175 (= lt!584639 lt!584638)))

(declare-fun lt!584636 () Unit!43227)

(declare-fun e!744796 () Unit!43227)

(assert (=> d!142175 (= lt!584636 e!744796)))

(declare-fun c!125472 () Bool)

(assert (=> d!142175 (= c!125472 lt!584638)))

(assert (=> d!142175 (= lt!584638 (containsKey!731 (toList!10171 lt!584477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142175 (= (contains!8315 lt!584477 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584639)))

(declare-fun b!1305697 () Bool)

(declare-fun lt!584637 () Unit!43227)

(assert (=> b!1305697 (= e!744796 lt!584637)))

(assert (=> b!1305697 (= lt!584637 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305697 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305698 () Bool)

(declare-fun Unit!43250 () Unit!43227)

(assert (=> b!1305698 (= e!744796 Unit!43250)))

(declare-fun b!1305699 () Bool)

(assert (=> b!1305699 (= e!744795 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142175 c!125472) b!1305697))

(assert (= (and d!142175 (not c!125472)) b!1305698))

(assert (= (and d!142175 (not res!866956)) b!1305699))

(declare-fun m!1196929 () Bool)

(assert (=> d!142175 m!1196929))

(declare-fun m!1196931 () Bool)

(assert (=> b!1305697 m!1196931))

(assert (=> b!1305697 m!1196667))

(assert (=> b!1305697 m!1196667))

(declare-fun m!1196933 () Bool)

(assert (=> b!1305697 m!1196933))

(assert (=> b!1305699 m!1196667))

(assert (=> b!1305699 m!1196667))

(assert (=> b!1305699 m!1196933))

(assert (=> bm!64464 d!142175))

(assert (=> b!1305429 d!142007))

(declare-fun d!142177 () Bool)

(declare-fun e!744797 () Bool)

(assert (=> d!142177 e!744797))

(declare-fun res!866957 () Bool)

(assert (=> d!142177 (=> res!866957 e!744797)))

(declare-fun lt!584643 () Bool)

(assert (=> d!142177 (= res!866957 (not lt!584643))))

(declare-fun lt!584642 () Bool)

(assert (=> d!142177 (= lt!584643 lt!584642)))

(declare-fun lt!584640 () Unit!43227)

(declare-fun e!744798 () Unit!43227)

(assert (=> d!142177 (= lt!584640 e!744798)))

(declare-fun c!125473 () Bool)

(assert (=> d!142177 (= c!125473 lt!584642)))

(assert (=> d!142177 (= lt!584642 (containsKey!731 (toList!10171 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) k0!1205))))

(assert (=> d!142177 (= (contains!8315 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) k0!1205) lt!584643)))

(declare-fun b!1305700 () Bool)

(declare-fun lt!584641 () Unit!43227)

(assert (=> b!1305700 (= e!744798 lt!584641)))

(assert (=> b!1305700 (= lt!584641 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) k0!1205))))

(assert (=> b!1305700 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) k0!1205))))

(declare-fun b!1305701 () Bool)

(declare-fun Unit!43251 () Unit!43227)

(assert (=> b!1305701 (= e!744798 Unit!43251)))

(declare-fun b!1305702 () Bool)

(assert (=> b!1305702 (= e!744797 (isDefined!516 (getValueByKey!709 (toList!10171 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) k0!1205)))))

(assert (= (and d!142177 c!125473) b!1305700))

(assert (= (and d!142177 (not c!125473)) b!1305701))

(assert (= (and d!142177 (not res!866957)) b!1305702))

(declare-fun m!1196935 () Bool)

(assert (=> d!142177 m!1196935))

(declare-fun m!1196937 () Bool)

(assert (=> b!1305700 m!1196937))

(declare-fun m!1196939 () Bool)

(assert (=> b!1305700 m!1196939))

(assert (=> b!1305700 m!1196939))

(declare-fun m!1196941 () Bool)

(assert (=> b!1305700 m!1196941))

(assert (=> b!1305702 m!1196939))

(assert (=> b!1305702 m!1196939))

(assert (=> b!1305702 m!1196941))

(assert (=> d!142017 d!142177))

(declare-fun d!142179 () Bool)

(declare-fun e!744799 () Bool)

(assert (=> d!142179 e!744799))

(declare-fun res!866959 () Bool)

(assert (=> d!142179 (=> (not res!866959) (not e!744799))))

(declare-fun lt!584645 () ListLongMap!20311)

(assert (=> d!142179 (= res!866959 (contains!8315 lt!584645 (_1!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))))))

(declare-fun lt!584646 () List!29774)

(assert (=> d!142179 (= lt!584645 (ListLongMap!20312 lt!584646))))

(declare-fun lt!584644 () Unit!43227)

(declare-fun lt!584647 () Unit!43227)

(assert (=> d!142179 (= lt!584644 lt!584647)))

(assert (=> d!142179 (= (getValueByKey!709 lt!584646 (_1!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) (Some!760 (_2!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142179 (= lt!584647 (lemmaContainsTupThenGetReturnValue!355 lt!584646 (_1!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) (_2!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142179 (= lt!584646 (insertStrictlySorted!484 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) (_1!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) (_2!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142179 (= (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) lt!584645)))

(declare-fun b!1305703 () Bool)

(declare-fun res!866958 () Bool)

(assert (=> b!1305703 (=> (not res!866958) (not e!744799))))

(assert (=> b!1305703 (= res!866958 (= (getValueByKey!709 (toList!10171 lt!584645) (_1!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387)))) (Some!760 (_2!11338 (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))))))))

(declare-fun b!1305704 () Bool)

(assert (=> b!1305704 (= e!744799 (contains!8317 (toList!10171 lt!584645) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))))))

(assert (= (and d!142179 res!866959) b!1305703))

(assert (= (and b!1305703 res!866958) b!1305704))

(declare-fun m!1196943 () Bool)

(assert (=> d!142179 m!1196943))

(declare-fun m!1196945 () Bool)

(assert (=> d!142179 m!1196945))

(declare-fun m!1196947 () Bool)

(assert (=> d!142179 m!1196947))

(declare-fun m!1196949 () Bool)

(assert (=> d!142179 m!1196949))

(declare-fun m!1196951 () Bool)

(assert (=> b!1305703 m!1196951))

(declare-fun m!1196953 () Bool)

(assert (=> b!1305704 m!1196953))

(assert (=> d!142017 d!142179))

(declare-fun d!142181 () Bool)

(assert (=> d!142181 (not (contains!8315 (+!4491 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (tuple2!22655 (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387))) k0!1205))))

(assert (=> d!142181 true))

(declare-fun _$36!382 () Unit!43227)

(assert (=> d!142181 (= (choose!1935 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) (ite (or c!125358 c!125356) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125358 c!125356) zeroValue!1387 minValue!1387) k0!1205) _$36!382)))

(declare-fun bs!37205 () Bool)

(assert (= bs!37205 d!142181))

(assert (=> bs!37205 m!1196493))

(assert (=> bs!37205 m!1196493))

(assert (=> bs!37205 m!1196495))

(assert (=> d!142017 d!142181))

(declare-fun d!142183 () Bool)

(declare-fun e!744800 () Bool)

(assert (=> d!142183 e!744800))

(declare-fun res!866960 () Bool)

(assert (=> d!142183 (=> res!866960 e!744800)))

(declare-fun lt!584651 () Bool)

(assert (=> d!142183 (= res!866960 (not lt!584651))))

(declare-fun lt!584650 () Bool)

(assert (=> d!142183 (= lt!584651 lt!584650)))

(declare-fun lt!584648 () Unit!43227)

(declare-fun e!744801 () Unit!43227)

(assert (=> d!142183 (= lt!584648 e!744801)))

(declare-fun c!125474 () Bool)

(assert (=> d!142183 (= c!125474 lt!584650)))

(assert (=> d!142183 (= lt!584650 (containsKey!731 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(assert (=> d!142183 (= (contains!8315 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)) k0!1205) lt!584651)))

(declare-fun b!1305705 () Bool)

(declare-fun lt!584649 () Unit!43227)

(assert (=> b!1305705 (= e!744801 lt!584649)))

(assert (=> b!1305705 (= lt!584649 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(assert (=> b!1305705 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) k0!1205))))

(declare-fun b!1305706 () Bool)

(declare-fun Unit!43252 () Unit!43227)

(assert (=> b!1305706 (= e!744801 Unit!43252)))

(declare-fun b!1305707 () Bool)

(assert (=> b!1305707 (= e!744800 (isDefined!516 (getValueByKey!709 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) k0!1205)))))

(assert (= (and d!142183 c!125474) b!1305705))

(assert (= (and d!142183 (not c!125474)) b!1305706))

(assert (= (and d!142183 (not res!866960)) b!1305707))

(declare-fun m!1196955 () Bool)

(assert (=> d!142183 m!1196955))

(declare-fun m!1196957 () Bool)

(assert (=> b!1305705 m!1196957))

(declare-fun m!1196959 () Bool)

(assert (=> b!1305705 m!1196959))

(assert (=> b!1305705 m!1196959))

(declare-fun m!1196961 () Bool)

(assert (=> b!1305705 m!1196961))

(assert (=> b!1305707 m!1196959))

(assert (=> b!1305707 m!1196959))

(assert (=> b!1305707 m!1196961))

(assert (=> d!142017 d!142183))

(declare-fun d!142185 () Bool)

(declare-fun e!744802 () Bool)

(assert (=> d!142185 e!744802))

(declare-fun res!866961 () Bool)

(assert (=> d!142185 (=> res!866961 e!744802)))

(declare-fun lt!584655 () Bool)

(assert (=> d!142185 (= res!866961 (not lt!584655))))

(declare-fun lt!584654 () Bool)

(assert (=> d!142185 (= lt!584655 lt!584654)))

(declare-fun lt!584652 () Unit!43227)

(declare-fun e!744803 () Unit!43227)

(assert (=> d!142185 (= lt!584652 e!744803)))

(declare-fun c!125475 () Bool)

(assert (=> d!142185 (= c!125475 lt!584654)))

(assert (=> d!142185 (= lt!584654 (containsKey!731 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142185 (= (contains!8315 lt!584497 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584655)))

(declare-fun b!1305708 () Bool)

(declare-fun lt!584653 () Unit!43227)

(assert (=> b!1305708 (= e!744803 lt!584653)))

(assert (=> b!1305708 (= lt!584653 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> b!1305708 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305709 () Bool)

(declare-fun Unit!43253 () Unit!43227)

(assert (=> b!1305709 (= e!744803 Unit!43253)))

(declare-fun b!1305710 () Bool)

(assert (=> b!1305710 (= e!744802 (isDefined!516 (getValueByKey!709 (toList!10171 lt!584497) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142185 c!125475) b!1305708))

(assert (= (and d!142185 (not c!125475)) b!1305709))

(assert (= (and d!142185 (not res!866961)) b!1305710))

(declare-fun m!1196963 () Bool)

(assert (=> d!142185 m!1196963))

(declare-fun m!1196965 () Bool)

(assert (=> b!1305708 m!1196965))

(assert (=> b!1305708 m!1196489))

(assert (=> b!1305708 m!1196489))

(declare-fun m!1196967 () Bool)

(assert (=> b!1305708 m!1196967))

(assert (=> b!1305710 m!1196489))

(assert (=> b!1305710 m!1196489))

(assert (=> b!1305710 m!1196967))

(assert (=> d!142015 d!142185))

(declare-fun e!744805 () Option!761)

(declare-fun b!1305713 () Bool)

(assert (=> b!1305713 (= e!744805 (getValueByKey!709 (t!43376 lt!584498) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305712 () Bool)

(declare-fun e!744804 () Option!761)

(assert (=> b!1305712 (= e!744804 e!744805)))

(declare-fun c!125477 () Bool)

(assert (=> b!1305712 (= c!125477 (and ((_ is Cons!29770) lt!584498) (not (= (_1!11338 (h!30979 lt!584498)) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1305714 () Bool)

(assert (=> b!1305714 (= e!744805 None!759)))

(declare-fun c!125476 () Bool)

(declare-fun d!142187 () Bool)

(assert (=> d!142187 (= c!125476 (and ((_ is Cons!29770) lt!584498) (= (_1!11338 (h!30979 lt!584498)) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142187 (= (getValueByKey!709 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!744804)))

(declare-fun b!1305711 () Bool)

(assert (=> b!1305711 (= e!744804 (Some!760 (_2!11338 (h!30979 lt!584498))))))

(assert (= (and d!142187 c!125476) b!1305711))

(assert (= (and d!142187 (not c!125476)) b!1305712))

(assert (= (and b!1305712 c!125477) b!1305713))

(assert (= (and b!1305712 (not c!125477)) b!1305714))

(declare-fun m!1196969 () Bool)

(assert (=> b!1305713 m!1196969))

(assert (=> d!142015 d!142187))

(declare-fun d!142189 () Bool)

(assert (=> d!142189 (= (getValueByKey!709 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584656 () Unit!43227)

(assert (=> d!142189 (= lt!584656 (choose!1941 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!744806 () Bool)

(assert (=> d!142189 e!744806))

(declare-fun res!866962 () Bool)

(assert (=> d!142189 (=> (not res!866962) (not e!744806))))

(assert (=> d!142189 (= res!866962 (isStrictlySorted!874 lt!584498))))

(assert (=> d!142189 (= (lemmaContainsTupThenGetReturnValue!355 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584656)))

(declare-fun b!1305715 () Bool)

(declare-fun res!866963 () Bool)

(assert (=> b!1305715 (=> (not res!866963) (not e!744806))))

(assert (=> b!1305715 (= res!866963 (containsKey!731 lt!584498 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305716 () Bool)

(assert (=> b!1305716 (= e!744806 (contains!8317 lt!584498 (tuple2!22655 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142189 res!866962) b!1305715))

(assert (= (and b!1305715 res!866963) b!1305716))

(assert (=> d!142189 m!1196483))

(declare-fun m!1196971 () Bool)

(assert (=> d!142189 m!1196971))

(declare-fun m!1196973 () Bool)

(assert (=> d!142189 m!1196973))

(declare-fun m!1196975 () Bool)

(assert (=> b!1305715 m!1196975))

(declare-fun m!1196977 () Bool)

(assert (=> b!1305716 m!1196977))

(assert (=> d!142015 d!142189))

(declare-fun b!1305717 () Bool)

(declare-fun e!744809 () List!29774)

(declare-fun c!125479 () Bool)

(declare-fun c!125480 () Bool)

(assert (=> b!1305717 (= e!744809 (ite c!125479 (t!43376 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (ite c!125480 (Cons!29770 (h!30979 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (t!43376 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))))) Nil!29771)))))

(declare-fun b!1305718 () Bool)

(assert (=> b!1305718 (= e!744809 (insertStrictlySorted!484 (t!43376 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305719 () Bool)

(declare-fun e!744808 () List!29774)

(declare-fun e!744807 () List!29774)

(assert (=> b!1305719 (= e!744808 e!744807)))

(assert (=> b!1305719 (= c!125479 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (= (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305721 () Bool)

(declare-fun call!64485 () List!29774)

(assert (=> b!1305721 (= e!744808 call!64485)))

(declare-fun bm!64480 () Bool)

(declare-fun call!64484 () List!29774)

(assert (=> bm!64480 (= call!64484 call!64485)))

(declare-fun bm!64481 () Bool)

(declare-fun call!64483 () List!29774)

(assert (=> bm!64481 (= call!64483 call!64484)))

(declare-fun b!1305722 () Bool)

(declare-fun e!744811 () List!29774)

(assert (=> b!1305722 (= e!744811 call!64483)))

(declare-fun e!744810 () Bool)

(declare-fun lt!584657 () List!29774)

(declare-fun b!1305723 () Bool)

(assert (=> b!1305723 (= e!744810 (contains!8317 lt!584657 (tuple2!22655 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun c!125481 () Bool)

(declare-fun bm!64482 () Bool)

(assert (=> bm!64482 (= call!64485 ($colon$colon!668 e!744809 (ite c!125481 (h!30979 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (tuple2!22655 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun c!125478 () Bool)

(assert (=> bm!64482 (= c!125478 c!125481)))

(declare-fun b!1305724 () Bool)

(assert (=> b!1305724 (= c!125480 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (bvsgt (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> b!1305724 (= e!744807 e!744811)))

(declare-fun b!1305725 () Bool)

(declare-fun res!866964 () Bool)

(assert (=> b!1305725 (=> (not res!866964) (not e!744810))))

(assert (=> b!1305725 (= res!866964 (containsKey!731 lt!584657 (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305726 () Bool)

(assert (=> b!1305726 (= e!744811 call!64483)))

(declare-fun d!142191 () Bool)

(assert (=> d!142191 e!744810))

(declare-fun res!866965 () Bool)

(assert (=> d!142191 (=> (not res!866965) (not e!744810))))

(assert (=> d!142191 (= res!866965 (isStrictlySorted!874 lt!584657))))

(assert (=> d!142191 (= lt!584657 e!744808)))

(assert (=> d!142191 (= c!125481 (and ((_ is Cons!29770) (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297)))) (bvslt (_1!11338 (h!30979 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142191 (isStrictlySorted!874 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))))))

(assert (=> d!142191 (= (insertStrictlySorted!484 (toList!10171 (ite c!125358 lt!584289 (ite c!125356 lt!584291 lt!584297))) (_1!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11338 (ite (or c!125358 c!125356) (tuple2!22655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!584657)))

(declare-fun b!1305720 () Bool)

(assert (=> b!1305720 (= e!744807 call!64484)))

(assert (= (and d!142191 c!125481) b!1305721))

(assert (= (and d!142191 (not c!125481)) b!1305719))

(assert (= (and b!1305719 c!125479) b!1305720))

(assert (= (and b!1305719 (not c!125479)) b!1305724))

(assert (= (and b!1305724 c!125480) b!1305722))

(assert (= (and b!1305724 (not c!125480)) b!1305726))

(assert (= (or b!1305722 b!1305726) bm!64481))

(assert (= (or b!1305720 bm!64481) bm!64480))

(assert (= (or b!1305721 bm!64480) bm!64482))

(assert (= (and bm!64482 c!125478) b!1305718))

(assert (= (and bm!64482 (not c!125478)) b!1305717))

(assert (= (and d!142191 res!866965) b!1305725))

(assert (= (and b!1305725 res!866964) b!1305723))

(declare-fun m!1196979 () Bool)

(assert (=> b!1305725 m!1196979))

(declare-fun m!1196981 () Bool)

(assert (=> b!1305718 m!1196981))

(declare-fun m!1196983 () Bool)

(assert (=> b!1305723 m!1196983))

(declare-fun m!1196985 () Bool)

(assert (=> bm!64482 m!1196985))

(declare-fun m!1196987 () Bool)

(assert (=> d!142191 m!1196987))

(declare-fun m!1196989 () Bool)

(assert (=> d!142191 m!1196989))

(assert (=> d!142015 d!142191))

(declare-fun b!1305727 () Bool)

(declare-fun e!744813 () Bool)

(assert (=> b!1305727 (= e!744813 tp_is_empty!34947)))

(declare-fun mapIsEmpty!54034 () Bool)

(declare-fun mapRes!54034 () Bool)

(assert (=> mapIsEmpty!54034 mapRes!54034))

(declare-fun condMapEmpty!54034 () Bool)

(declare-fun mapDefault!54034 () ValueCell!16575)

(assert (=> mapNonEmpty!54033 (= condMapEmpty!54034 (= mapRest!54033 ((as const (Array (_ BitVec 32) ValueCell!16575)) mapDefault!54034)))))

(declare-fun e!744812 () Bool)

(assert (=> mapNonEmpty!54033 (= tp!103095 (and e!744812 mapRes!54034))))

(declare-fun b!1305728 () Bool)

(assert (=> b!1305728 (= e!744812 tp_is_empty!34947)))

(declare-fun mapNonEmpty!54034 () Bool)

(declare-fun tp!103096 () Bool)

(assert (=> mapNonEmpty!54034 (= mapRes!54034 (and tp!103096 e!744813))))

(declare-fun mapValue!54034 () ValueCell!16575)

(declare-fun mapKey!54034 () (_ BitVec 32))

(declare-fun mapRest!54034 () (Array (_ BitVec 32) ValueCell!16575))

(assert (=> mapNonEmpty!54034 (= mapRest!54033 (store mapRest!54034 mapKey!54034 mapValue!54034))))

(assert (= (and mapNonEmpty!54033 condMapEmpty!54034) mapIsEmpty!54034))

(assert (= (and mapNonEmpty!54033 (not condMapEmpty!54034)) mapNonEmpty!54034))

(assert (= (and mapNonEmpty!54034 ((_ is ValueCellFull!16575) mapValue!54034)) b!1305727))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16575) mapDefault!54034)) b!1305728))

(declare-fun m!1196991 () Bool)

(assert (=> mapNonEmpty!54034 m!1196991))

(declare-fun b_lambda!23355 () Bool)

(assert (= b_lambda!23351 (or (and start!110260 b_free!29307) b_lambda!23355)))

(declare-fun b_lambda!23357 () Bool)

(assert (= b_lambda!23353 (or (and start!110260 b_free!29307) b_lambda!23357)))

(check-sat (not d!142171) (not d!142121) (not mapNonEmpty!54034) (not b!1305561) (not b!1305547) (not d!142189) (not d!142163) (not d!142073) (not d!142179) (not d!142027) (not b!1305619) (not d!142063) (not d!142111) (not d!142057) (not b!1305631) (not b!1305691) (not b!1305653) (not b!1305690) (not b_next!29307) (not d!142177) (not b!1305611) (not d!142131) (not b!1305654) (not d!142115) (not b!1305538) (not d!142175) (not b!1305644) (not b!1305642) (not b!1305697) (not bm!64478) (not d!142101) (not b!1305683) (not b!1305639) (not b!1305515) (not b!1305681) (not d!142055) (not d!142095) (not b_lambda!23355) (not d!142045) (not b!1305710) (not b!1305685) (not b!1305626) (not d!142025) (not b!1305618) (not d!142173) (not d!142123) (not b!1305705) (not b!1305570) (not d!142037) (not b!1305529) (not b!1305704) (not b!1305517) (not b!1305707) (not b_lambda!23349) (not b!1305511) (not d!142041) (not d!142183) b_and!47515 (not b!1305574) (not b!1305552) (not b!1305575) (not b!1305699) (not b!1305696) (not d!142157) (not b!1305483) (not b!1305571) (not d!142093) (not bm!64469) (not d!142047) (not b!1305723) (not b!1305488) (not b!1305545) (not bm!64479) (not b!1305614) (not b!1305544) (not b_lambda!23347) (not b_lambda!23345) (not b!1305633) (not d!142137) (not d!142147) (not d!142139) (not b!1305496) (not b!1305519) (not b!1305686) (not d!142099) (not d!142165) (not bm!64468) (not d!142105) (not b!1305509) (not d!142067) (not b!1305602) (not b!1305715) (not d!142085) (not b!1305608) (not b!1305540) (not b!1305700) (not b!1305567) (not d!142065) (not d!142127) (not d!142043) (not d!142135) (not b!1305543) (not b!1305613) (not d!142133) (not d!142151) (not b!1305627) (not b!1305489) (not b!1305550) (not b!1305629) (not b!1305539) (not b!1305702) (not d!142061) (not b!1305513) (not d!142117) (not b!1305688) (not b!1305510) (not d!142181) (not b!1305523) (not b!1305557) (not b!1305615) (not b!1305487) (not b!1305568) (not b!1305594) (not b!1305638) (not d!142031) (not b!1305495) (not b!1305490) (not b!1305542) (not d!142153) (not d!142079) tp_is_empty!34947 (not d!142069) (not b!1305625) (not b!1305507) (not b!1305559) (not d!142119) (not d!142161) (not d!142141) (not d!142191) (not b!1305616) (not d!142051) (not b!1305520) (not b!1305694) (not d!142129) (not d!142109) (not d!142145) (not b!1305703) (not b!1305532) (not b!1305647) (not b!1305555) (not d!142075) (not bm!64482) (not d!142087) (not b!1305605) (not b!1305537) (not d!142089) (not b!1305478) (not b!1305641) (not b!1305718) (not d!142081) (not b!1305708) (not d!142185) (not b!1305713) (not b!1305716) (not b!1305573) (not d!142091) (not d!142125) (not d!142029) (not d!142143) (not b!1305479) (not b!1305581) (not b!1305725) (not b!1305534) (not d!142049) (not b!1305693) (not d!142059) (not b_lambda!23357) (not b!1305535) (not b!1305485) (not b!1305636) (not b!1305482) (not b!1305676))
(check-sat b_and!47515 (not b_next!29307))
