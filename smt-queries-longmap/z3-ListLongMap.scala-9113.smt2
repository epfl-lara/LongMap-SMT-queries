; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109462 () Bool)

(assert start!109462)

(declare-fun b_free!28951 () Bool)

(declare-fun b_next!28951 () Bool)

(assert (=> start!109462 (= b_free!28951 (not b_next!28951))))

(declare-fun tp!101972 () Bool)

(declare-fun b_and!47023 () Bool)

(assert (=> start!109462 (= tp!101972 b_and!47023)))

(declare-fun b!1296230 () Bool)

(declare-datatypes ((Unit!42787 0))(
  ( (Unit!42788) )
))
(declare-fun e!739527 () Unit!42787)

(declare-fun lt!580064 () Unit!42787)

(assert (=> b!1296230 (= e!739527 lt!580064)))

(declare-datatypes ((V!51225 0))(
  ( (V!51226 (val!17370 Int)) )
))
(declare-datatypes ((tuple2!22430 0))(
  ( (tuple2!22431 (_1!11226 (_ BitVec 64)) (_2!11226 V!51225)) )
))
(declare-datatypes ((List!29559 0))(
  ( (Nil!29556) (Cons!29555 (h!30764 tuple2!22430) (t!43115 List!29559)) )
))
(declare-datatypes ((ListLongMap!20087 0))(
  ( (ListLongMap!20088 (toList!10059 List!29559)) )
))
(declare-fun lt!580075 () ListLongMap!20087)

(declare-fun call!63304 () ListLongMap!20087)

(assert (=> b!1296230 (= lt!580075 call!63304)))

(declare-fun lt!580067 () Unit!42787)

(declare-fun call!63299 () Unit!42787)

(assert (=> b!1296230 (= lt!580067 call!63299)))

(declare-fun call!63307 () Bool)

(assert (=> b!1296230 (not call!63307)))

(declare-fun call!63301 () Unit!42787)

(assert (=> b!1296230 (= lt!580064 call!63301)))

(declare-fun call!63306 () Bool)

(assert (=> b!1296230 call!63306))

(declare-fun mapIsEmpty!53447 () Bool)

(declare-fun mapRes!53447 () Bool)

(assert (=> mapIsEmpty!53447 mapRes!53447))

(declare-fun b!1296231 () Bool)

(declare-fun e!739529 () Bool)

(declare-fun e!739532 () Bool)

(assert (=> b!1296231 (= e!739529 (and e!739532 mapRes!53447))))

(declare-fun condMapEmpty!53447 () Bool)

(declare-datatypes ((ValueCell!16397 0))(
  ( (ValueCellFull!16397 (v!19972 V!51225)) (EmptyCell!16397) )
))
(declare-datatypes ((array!86093 0))(
  ( (array!86094 (arr!41548 (Array (_ BitVec 32) ValueCell!16397)) (size!42100 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86093)

(declare-fun mapDefault!53447 () ValueCell!16397)

(assert (=> b!1296231 (= condMapEmpty!53447 (= (arr!41548 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16397)) mapDefault!53447)))))

(declare-fun bm!63296 () Bool)

(declare-fun call!63309 () Bool)

(assert (=> bm!63296 (= call!63307 call!63309)))

(declare-fun minValue!1387 () V!51225)

(declare-fun zeroValue!1387 () V!51225)

(declare-fun call!63300 () ListLongMap!20087)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!63297 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86095 0))(
  ( (array!86096 (arr!41549 (Array (_ BitVec 32) (_ BitVec 64))) (size!42101 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86095)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6102 (array!86095 array!86093 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20087)

(assert (=> bm!63297 (= call!63300 (getCurrentListMapNoExtraKeys!6102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296232 () Bool)

(declare-fun res!861541 () Bool)

(declare-fun e!739526 () Bool)

(assert (=> b!1296232 (=> (not res!861541) (not e!739526))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1296232 (= res!861541 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42101 _keys!1741))))))

(declare-fun c!124353 () Bool)

(declare-fun lt!580070 () ListLongMap!20087)

(declare-fun c!124351 () Bool)

(declare-fun call!63308 () Bool)

(declare-fun bm!63298 () Bool)

(declare-fun lt!580066 () ListLongMap!20087)

(declare-fun contains!8107 (ListLongMap!20087 (_ BitVec 64)) Bool)

(assert (=> bm!63298 (= call!63308 (contains!8107 (ite c!124351 lt!580070 (ite c!124353 lt!580066 lt!580075)) k0!1205))))

(declare-fun res!861543 () Bool)

(assert (=> start!109462 (=> (not res!861543) (not e!739526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109462 (= res!861543 (validMask!0 mask!2175))))

(assert (=> start!109462 e!739526))

(declare-fun tp_is_empty!34591 () Bool)

(assert (=> start!109462 tp_is_empty!34591))

(assert (=> start!109462 true))

(declare-fun array_inv!31615 (array!86093) Bool)

(assert (=> start!109462 (and (array_inv!31615 _values!1445) e!739529)))

(declare-fun array_inv!31616 (array!86095) Bool)

(assert (=> start!109462 (array_inv!31616 _keys!1741)))

(assert (=> start!109462 tp!101972))

(declare-fun mapNonEmpty!53447 () Bool)

(declare-fun tp!101973 () Bool)

(declare-fun e!739531 () Bool)

(assert (=> mapNonEmpty!53447 (= mapRes!53447 (and tp!101973 e!739531))))

(declare-fun mapValue!53447 () ValueCell!16397)

(declare-fun mapRest!53447 () (Array (_ BitVec 32) ValueCell!16397))

(declare-fun mapKey!53447 () (_ BitVec 32))

(assert (=> mapNonEmpty!53447 (= (arr!41548 _values!1445) (store mapRest!53447 mapKey!53447 mapValue!53447))))

(declare-fun bm!63299 () Bool)

(declare-fun call!63303 () ListLongMap!20087)

(declare-fun call!63310 () ListLongMap!20087)

(assert (=> bm!63299 (= call!63303 call!63310)))

(declare-fun bm!63300 () Bool)

(declare-fun call!63305 () Unit!42787)

(assert (=> bm!63300 (= call!63299 call!63305)))

(declare-fun bm!63301 () Bool)

(declare-fun call!63302 () Unit!42787)

(assert (=> bm!63301 (= call!63301 call!63302)))

(declare-fun b!1296233 () Bool)

(declare-fun res!861542 () Bool)

(assert (=> b!1296233 (=> (not res!861542) (not e!739526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86095 (_ BitVec 32)) Bool)

(assert (=> b!1296233 (= res!861542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296234 () Bool)

(declare-fun res!861546 () Bool)

(assert (=> b!1296234 (=> (not res!861546) (not e!739526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296234 (= res!861546 (not (validKeyInArray!0 (select (arr!41549 _keys!1741) from!2144))))))

(declare-fun b!1296235 () Bool)

(assert (=> b!1296235 (= e!739532 tp_is_empty!34591)))

(declare-fun bm!63302 () Bool)

(declare-fun addStillNotContains!444 (ListLongMap!20087 (_ BitVec 64) V!51225 (_ BitVec 64)) Unit!42787)

(assert (=> bm!63302 (= call!63305 (addStillNotContains!444 (ite c!124351 lt!580070 (ite c!124353 lt!580066 lt!580075)) (ite (or c!124351 c!124353) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124351 c!124353) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1296236 () Bool)

(declare-fun c!124352 () Bool)

(declare-fun lt!580077 () Bool)

(assert (=> b!1296236 (= c!124352 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580077))))

(declare-fun e!739528 () Unit!42787)

(assert (=> b!1296236 (= e!739528 e!739527)))

(declare-fun bm!63303 () Bool)

(declare-fun +!4468 (ListLongMap!20087 tuple2!22430) ListLongMap!20087)

(assert (=> bm!63303 (= call!63310 (+!4468 (ite c!124351 lt!580070 (ite c!124353 lt!580066 lt!580075)) (ite c!124351 (tuple2!22431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124353 (tuple2!22431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1296237 () Bool)

(assert (=> b!1296237 (= e!739526 (not true))))

(declare-fun lt!580076 () Unit!42787)

(declare-fun e!739530 () Unit!42787)

(assert (=> b!1296237 (= lt!580076 e!739530)))

(assert (=> b!1296237 (= c!124351 (and (not lt!580077) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296237 (= lt!580077 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296237 (not (contains!8107 (ListLongMap!20088 Nil!29556) k0!1205))))

(declare-fun lt!580063 () Unit!42787)

(declare-fun emptyContainsNothing!183 ((_ BitVec 64)) Unit!42787)

(assert (=> b!1296237 (= lt!580063 (emptyContainsNothing!183 k0!1205))))

(declare-fun b!1296238 () Bool)

(declare-fun Unit!42789 () Unit!42787)

(assert (=> b!1296238 (= e!739527 Unit!42789)))

(declare-fun b!1296239 () Bool)

(declare-fun lt!580068 () Unit!42787)

(assert (=> b!1296239 (= e!739530 lt!580068)))

(assert (=> b!1296239 (= lt!580070 call!63300)))

(declare-fun lt!580072 () Unit!42787)

(assert (=> b!1296239 (= lt!580072 call!63305)))

(declare-fun lt!580073 () ListLongMap!20087)

(assert (=> b!1296239 (= lt!580073 (+!4468 lt!580070 (tuple2!22431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1296239 (not call!63309)))

(declare-fun lt!580069 () Unit!42787)

(assert (=> b!1296239 (= lt!580069 (addStillNotContains!444 lt!580070 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1296239 (not (contains!8107 call!63310 k0!1205))))

(declare-fun lt!580074 () Unit!42787)

(assert (=> b!1296239 (= lt!580074 call!63302)))

(assert (=> b!1296239 false))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!67 ((_ BitVec 64) (_ BitVec 64) V!51225 ListLongMap!20087) Unit!42787)

(assert (=> b!1296239 (= lt!580068 (lemmaInListMapAfterAddingDiffThenInBefore!67 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!580070))))

(declare-fun lt!580078 () Bool)

(assert (=> b!1296239 (= lt!580078 call!63308)))

(declare-fun bm!63304 () Bool)

(assert (=> bm!63304 (= call!63304 call!63300)))

(declare-fun bm!63305 () Bool)

(assert (=> bm!63305 (= call!63309 (contains!8107 (ite c!124351 lt!580073 call!63303) k0!1205))))

(declare-fun b!1296240 () Bool)

(declare-fun res!861544 () Bool)

(assert (=> b!1296240 (=> (not res!861544) (not e!739526))))

(declare-datatypes ((List!29560 0))(
  ( (Nil!29557) (Cons!29556 (h!30765 (_ BitVec 64)) (t!43116 List!29560)) )
))
(declare-fun arrayNoDuplicates!0 (array!86095 (_ BitVec 32) List!29560) Bool)

(assert (=> b!1296240 (= res!861544 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29557))))

(declare-fun bm!63306 () Bool)

(assert (=> bm!63306 (= call!63302 (lemmaInListMapAfterAddingDiffThenInBefore!67 k0!1205 (ite c!124351 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124353 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124351 minValue!1387 (ite c!124353 zeroValue!1387 minValue!1387)) (ite c!124351 lt!580073 (ite c!124353 lt!580066 lt!580075))))))

(declare-fun b!1296241 () Bool)

(assert (=> b!1296241 (= e!739530 e!739528)))

(assert (=> b!1296241 (= c!124353 (and (not lt!580077) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63307 () Bool)

(assert (=> bm!63307 (= call!63306 call!63308)))

(declare-fun b!1296242 () Bool)

(declare-fun res!861539 () Bool)

(assert (=> b!1296242 (=> (not res!861539) (not e!739526))))

(declare-fun getCurrentListMap!4978 (array!86095 array!86093 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20087)

(assert (=> b!1296242 (= res!861539 (contains!8107 (getCurrentListMap!4978 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296243 () Bool)

(declare-fun res!861545 () Bool)

(assert (=> b!1296243 (=> (not res!861545) (not e!739526))))

(assert (=> b!1296243 (= res!861545 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42101 _keys!1741))))))

(declare-fun b!1296244 () Bool)

(assert (=> b!1296244 (= e!739531 tp_is_empty!34591)))

(declare-fun b!1296245 () Bool)

(declare-fun res!861540 () Bool)

(assert (=> b!1296245 (=> (not res!861540) (not e!739526))))

(assert (=> b!1296245 (= res!861540 (and (= (size!42100 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42101 _keys!1741) (size!42100 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296246 () Bool)

(assert (=> b!1296246 call!63306))

(declare-fun lt!580071 () Unit!42787)

(assert (=> b!1296246 (= lt!580071 call!63301)))

(assert (=> b!1296246 (not call!63307)))

(declare-fun lt!580065 () Unit!42787)

(assert (=> b!1296246 (= lt!580065 call!63299)))

(assert (=> b!1296246 (= lt!580066 call!63304)))

(assert (=> b!1296246 (= e!739528 lt!580071)))

(assert (= (and start!109462 res!861543) b!1296245))

(assert (= (and b!1296245 res!861540) b!1296233))

(assert (= (and b!1296233 res!861542) b!1296240))

(assert (= (and b!1296240 res!861544) b!1296243))

(assert (= (and b!1296243 res!861545) b!1296242))

(assert (= (and b!1296242 res!861539) b!1296232))

(assert (= (and b!1296232 res!861541) b!1296234))

(assert (= (and b!1296234 res!861546) b!1296237))

(assert (= (and b!1296237 c!124351) b!1296239))

(assert (= (and b!1296237 (not c!124351)) b!1296241))

(assert (= (and b!1296241 c!124353) b!1296246))

(assert (= (and b!1296241 (not c!124353)) b!1296236))

(assert (= (and b!1296236 c!124352) b!1296230))

(assert (= (and b!1296236 (not c!124352)) b!1296238))

(assert (= (or b!1296246 b!1296230) bm!63299))

(assert (= (or b!1296246 b!1296230) bm!63307))

(assert (= (or b!1296246 b!1296230) bm!63301))

(assert (= (or b!1296246 b!1296230) bm!63300))

(assert (= (or b!1296246 b!1296230) bm!63304))

(assert (= (or b!1296246 b!1296230) bm!63296))

(assert (= (or b!1296239 bm!63307) bm!63298))

(assert (= (or b!1296239 bm!63300) bm!63302))

(assert (= (or b!1296239 bm!63301) bm!63306))

(assert (= (or b!1296239 bm!63304) bm!63297))

(assert (= (or b!1296239 bm!63296) bm!63305))

(assert (= (or b!1296239 bm!63299) bm!63303))

(assert (= (and b!1296231 condMapEmpty!53447) mapIsEmpty!53447))

(assert (= (and b!1296231 (not condMapEmpty!53447)) mapNonEmpty!53447))

(get-info :version)

(assert (= (and mapNonEmpty!53447 ((_ is ValueCellFull!16397) mapValue!53447)) b!1296244))

(assert (= (and b!1296231 ((_ is ValueCellFull!16397) mapDefault!53447)) b!1296235))

(assert (= start!109462 b!1296231))

(declare-fun m!1187703 () Bool)

(assert (=> bm!63298 m!1187703))

(declare-fun m!1187705 () Bool)

(assert (=> b!1296240 m!1187705))

(declare-fun m!1187707 () Bool)

(assert (=> b!1296233 m!1187707))

(declare-fun m!1187709 () Bool)

(assert (=> start!109462 m!1187709))

(declare-fun m!1187711 () Bool)

(assert (=> start!109462 m!1187711))

(declare-fun m!1187713 () Bool)

(assert (=> start!109462 m!1187713))

(declare-fun m!1187715 () Bool)

(assert (=> bm!63305 m!1187715))

(declare-fun m!1187717 () Bool)

(assert (=> bm!63303 m!1187717))

(declare-fun m!1187719 () Bool)

(assert (=> bm!63306 m!1187719))

(declare-fun m!1187721 () Bool)

(assert (=> b!1296242 m!1187721))

(assert (=> b!1296242 m!1187721))

(declare-fun m!1187723 () Bool)

(assert (=> b!1296242 m!1187723))

(declare-fun m!1187725 () Bool)

(assert (=> bm!63302 m!1187725))

(declare-fun m!1187727 () Bool)

(assert (=> bm!63297 m!1187727))

(declare-fun m!1187729 () Bool)

(assert (=> b!1296239 m!1187729))

(declare-fun m!1187731 () Bool)

(assert (=> b!1296239 m!1187731))

(declare-fun m!1187733 () Bool)

(assert (=> b!1296239 m!1187733))

(declare-fun m!1187735 () Bool)

(assert (=> b!1296239 m!1187735))

(declare-fun m!1187737 () Bool)

(assert (=> b!1296237 m!1187737))

(declare-fun m!1187739 () Bool)

(assert (=> b!1296237 m!1187739))

(declare-fun m!1187741 () Bool)

(assert (=> b!1296234 m!1187741))

(assert (=> b!1296234 m!1187741))

(declare-fun m!1187743 () Bool)

(assert (=> b!1296234 m!1187743))

(declare-fun m!1187745 () Bool)

(assert (=> mapNonEmpty!53447 m!1187745))

(check-sat (not bm!63306) (not b!1296242) b_and!47023 (not bm!63303) (not mapNonEmpty!53447) tp_is_empty!34591 (not bm!63297) (not b_next!28951) (not bm!63298) (not b!1296233) (not bm!63302) (not bm!63305) (not b!1296234) (not b!1296237) (not b!1296240) (not start!109462) (not b!1296239))
(check-sat b_and!47023 (not b_next!28951))
