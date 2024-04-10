; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109464 () Bool)

(assert start!109464)

(declare-fun b_free!28953 () Bool)

(declare-fun b_next!28953 () Bool)

(assert (=> start!109464 (= b_free!28953 (not b_next!28953))))

(declare-fun tp!101977 () Bool)

(declare-fun b_and!47043 () Bool)

(assert (=> start!109464 (= tp!101977 b_and!47043)))

(declare-datatypes ((V!51227 0))(
  ( (V!51228 (val!17371 Int)) )
))
(declare-fun minValue!1387 () V!51227)

(declare-fun zeroValue!1387 () V!51227)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16398 0))(
  ( (ValueCellFull!16398 (v!19974 V!51227)) (EmptyCell!16398) )
))
(declare-datatypes ((array!86204 0))(
  ( (array!86205 (arr!41603 (Array (_ BitVec 32) ValueCell!16398)) (size!42153 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86204)

(declare-fun bm!63351 () Bool)

(declare-datatypes ((array!86206 0))(
  ( (array!86207 (arr!41604 (Array (_ BitVec 32) (_ BitVec 64))) (size!42154 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86206)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22374 0))(
  ( (tuple2!22375 (_1!11198 (_ BitVec 64)) (_2!11198 V!51227)) )
))
(declare-datatypes ((List!29515 0))(
  ( (Nil!29512) (Cons!29511 (h!30720 tuple2!22374) (t!43079 List!29515)) )
))
(declare-datatypes ((ListLongMap!20031 0))(
  ( (ListLongMap!20032 (toList!10031 List!29515)) )
))
(declare-fun call!63362 () ListLongMap!20031)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6066 (array!86206 array!86204 (_ BitVec 32) (_ BitVec 32) V!51227 V!51227 (_ BitVec 32) Int) ListLongMap!20031)

(assert (=> bm!63351 (= call!63362 (getCurrentListMapNoExtraKeys!6066 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63352 () Bool)

(declare-fun call!63360 () Bool)

(declare-fun call!63364 () Bool)

(assert (=> bm!63352 (= call!63360 call!63364)))

(declare-fun mapIsEmpty!53450 () Bool)

(declare-fun mapRes!53450 () Bool)

(assert (=> mapIsEmpty!53450 mapRes!53450))

(declare-fun res!861593 () Bool)

(declare-fun e!739584 () Bool)

(assert (=> start!109464 (=> (not res!861593) (not e!739584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109464 (= res!861593 (validMask!0 mask!2175))))

(assert (=> start!109464 e!739584))

(declare-fun tp_is_empty!34593 () Bool)

(assert (=> start!109464 tp_is_empty!34593))

(assert (=> start!109464 true))

(declare-fun e!739582 () Bool)

(declare-fun array_inv!31493 (array!86204) Bool)

(assert (=> start!109464 (and (array_inv!31493 _values!1445) e!739582)))

(declare-fun array_inv!31494 (array!86206) Bool)

(assert (=> start!109464 (array_inv!31494 _keys!1741)))

(assert (=> start!109464 tp!101977))

(declare-fun b!1296345 () Bool)

(declare-fun e!739586 () Bool)

(assert (=> b!1296345 (= e!739582 (and e!739586 mapRes!53450))))

(declare-fun condMapEmpty!53450 () Bool)

(declare-fun mapDefault!53450 () ValueCell!16398)

(assert (=> b!1296345 (= condMapEmpty!53450 (= (arr!41603 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16398)) mapDefault!53450)))))

(declare-fun b!1296346 () Bool)

(declare-fun res!861597 () Bool)

(assert (=> b!1296346 (=> (not res!861597) (not e!739584))))

(assert (=> b!1296346 (= res!861597 (and (= (size!42153 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42154 _keys!1741) (size!42153 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63353 () Bool)

(declare-fun call!63355 () ListLongMap!20031)

(assert (=> bm!63353 (= call!63355 call!63362)))

(declare-fun bm!63354 () Bool)

(declare-fun call!63365 () ListLongMap!20031)

(declare-fun call!63361 () ListLongMap!20031)

(assert (=> bm!63354 (= call!63365 call!63361)))

(declare-fun lt!580293 () ListLongMap!20031)

(declare-fun lt!580304 () ListLongMap!20031)

(declare-fun bm!63355 () Bool)

(declare-fun c!124376 () Bool)

(declare-fun lt!580299 () ListLongMap!20031)

(declare-fun c!124377 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42944 0))(
  ( (Unit!42945) )
))
(declare-fun call!63356 () Unit!42944)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!69 ((_ BitVec 64) (_ BitVec 64) V!51227 ListLongMap!20031) Unit!42944)

(assert (=> bm!63355 (= call!63356 (lemmaInListMapAfterAddingDiffThenInBefore!69 k0!1205 (ite (or c!124376 c!124377) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124376 c!124377) zeroValue!1387 minValue!1387) (ite c!124376 lt!580299 (ite c!124377 lt!580293 lt!580304))))))

(declare-fun b!1296347 () Bool)

(declare-fun e!739585 () Unit!42944)

(declare-fun lt!580294 () Unit!42944)

(assert (=> b!1296347 (= e!739585 lt!580294)))

(assert (=> b!1296347 (= lt!580304 call!63355)))

(declare-fun lt!580300 () Unit!42944)

(declare-fun call!63358 () Unit!42944)

(assert (=> b!1296347 (= lt!580300 call!63358)))

(assert (=> b!1296347 (not call!63360)))

(declare-fun call!63357 () Unit!42944)

(assert (=> b!1296347 (= lt!580294 call!63357)))

(declare-fun call!63363 () Bool)

(assert (=> b!1296347 call!63363))

(declare-fun b!1296348 () Bool)

(declare-fun e!739579 () Bool)

(assert (=> b!1296348 (= e!739579 tp_is_empty!34593)))

(declare-fun bm!63356 () Bool)

(declare-fun lt!580291 () ListLongMap!20031)

(declare-fun contains!8149 (ListLongMap!20031 (_ BitVec 64)) Bool)

(assert (=> bm!63356 (= call!63364 (contains!8149 (ite c!124376 lt!580291 call!63365) k0!1205))))

(declare-fun bm!63357 () Bool)

(assert (=> bm!63357 (= call!63357 call!63356)))

(declare-fun b!1296349 () Bool)

(declare-fun e!739580 () Unit!42944)

(declare-fun e!739583 () Unit!42944)

(assert (=> b!1296349 (= e!739580 e!739583)))

(declare-fun lt!580301 () Bool)

(assert (=> b!1296349 (= c!124377 (and (not lt!580301) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63358 () Bool)

(declare-fun call!63354 () Bool)

(assert (=> bm!63358 (= call!63363 call!63354)))

(declare-fun bm!63359 () Bool)

(assert (=> bm!63359 (= call!63354 (contains!8149 (ite c!124376 lt!580299 (ite c!124377 lt!580293 lt!580304)) k0!1205))))

(declare-fun mapNonEmpty!53450 () Bool)

(declare-fun tp!101978 () Bool)

(assert (=> mapNonEmpty!53450 (= mapRes!53450 (and tp!101978 e!739579))))

(declare-fun mapRest!53450 () (Array (_ BitVec 32) ValueCell!16398))

(declare-fun mapValue!53450 () ValueCell!16398)

(declare-fun mapKey!53450 () (_ BitVec 32))

(assert (=> mapNonEmpty!53450 (= (arr!41603 _values!1445) (store mapRest!53450 mapKey!53450 mapValue!53450))))

(declare-fun b!1296350 () Bool)

(declare-fun res!861595 () Bool)

(assert (=> b!1296350 (=> (not res!861595) (not e!739584))))

(declare-fun getCurrentListMap!5063 (array!86206 array!86204 (_ BitVec 32) (_ BitVec 32) V!51227 V!51227 (_ BitVec 32) Int) ListLongMap!20031)

(assert (=> b!1296350 (= res!861595 (contains!8149 (getCurrentListMap!5063 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296351 () Bool)

(assert (=> b!1296351 (= e!739584 (not true))))

(declare-fun lt!580289 () Unit!42944)

(assert (=> b!1296351 (= lt!580289 e!739580)))

(assert (=> b!1296351 (= c!124376 (and (not lt!580301) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296351 (= lt!580301 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296351 (not (contains!8149 (ListLongMap!20032 Nil!29512) k0!1205))))

(declare-fun lt!580296 () Unit!42944)

(declare-fun emptyContainsNothing!189 ((_ BitVec 64)) Unit!42944)

(assert (=> b!1296351 (= lt!580296 (emptyContainsNothing!189 k0!1205))))

(declare-fun b!1296352 () Bool)

(assert (=> b!1296352 call!63363))

(declare-fun lt!580298 () Unit!42944)

(assert (=> b!1296352 (= lt!580298 call!63357)))

(assert (=> b!1296352 (not call!63360)))

(declare-fun lt!580303 () Unit!42944)

(assert (=> b!1296352 (= lt!580303 call!63358)))

(assert (=> b!1296352 (= lt!580293 call!63355)))

(assert (=> b!1296352 (= e!739583 lt!580298)))

(declare-fun b!1296353 () Bool)

(declare-fun res!861590 () Bool)

(assert (=> b!1296353 (=> (not res!861590) (not e!739584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86206 (_ BitVec 32)) Bool)

(assert (=> b!1296353 (= res!861590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63360 () Bool)

(declare-fun +!4434 (ListLongMap!20031 tuple2!22374) ListLongMap!20031)

(assert (=> bm!63360 (= call!63361 (+!4434 (ite c!124376 lt!580299 (ite c!124377 lt!580293 lt!580304)) (ite c!124376 (tuple2!22375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124377 (tuple2!22375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1296354 () Bool)

(assert (=> b!1296354 (= e!739586 tp_is_empty!34593)))

(declare-fun bm!63361 () Bool)

(declare-fun call!63359 () Unit!42944)

(assert (=> bm!63361 (= call!63358 call!63359)))

(declare-fun b!1296355 () Bool)

(declare-fun res!861591 () Bool)

(assert (=> b!1296355 (=> (not res!861591) (not e!739584))))

(declare-datatypes ((List!29516 0))(
  ( (Nil!29513) (Cons!29512 (h!30721 (_ BitVec 64)) (t!43080 List!29516)) )
))
(declare-fun arrayNoDuplicates!0 (array!86206 (_ BitVec 32) List!29516) Bool)

(assert (=> b!1296355 (= res!861591 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29513))))

(declare-fun bm!63362 () Bool)

(declare-fun addStillNotContains!452 (ListLongMap!20031 (_ BitVec 64) V!51227 (_ BitVec 64)) Unit!42944)

(assert (=> bm!63362 (= call!63359 (addStillNotContains!452 (ite c!124376 lt!580299 (ite c!124377 lt!580293 lt!580304)) (ite (or c!124376 c!124377) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124376 c!124377) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1296356 () Bool)

(declare-fun res!861592 () Bool)

(assert (=> b!1296356 (=> (not res!861592) (not e!739584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296356 (= res!861592 (not (validKeyInArray!0 (select (arr!41604 _keys!1741) from!2144))))))

(declare-fun b!1296357 () Bool)

(declare-fun c!124378 () Bool)

(assert (=> b!1296357 (= c!124378 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580301))))

(assert (=> b!1296357 (= e!739583 e!739585)))

(declare-fun b!1296358 () Bool)

(declare-fun res!861596 () Bool)

(assert (=> b!1296358 (=> (not res!861596) (not e!739584))))

(assert (=> b!1296358 (= res!861596 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42154 _keys!1741))))))

(declare-fun b!1296359 () Bool)

(declare-fun lt!580290 () Unit!42944)

(assert (=> b!1296359 (= e!739580 lt!580290)))

(assert (=> b!1296359 (= lt!580299 call!63362)))

(declare-fun lt!580297 () Unit!42944)

(assert (=> b!1296359 (= lt!580297 call!63359)))

(assert (=> b!1296359 (= lt!580291 (+!4434 lt!580299 (tuple2!22375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1296359 (not call!63364)))

(declare-fun lt!580292 () Unit!42944)

(assert (=> b!1296359 (= lt!580292 (addStillNotContains!452 lt!580299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1296359 (not (contains!8149 call!63361 k0!1205))))

(declare-fun lt!580302 () Unit!42944)

(assert (=> b!1296359 (= lt!580302 (lemmaInListMapAfterAddingDiffThenInBefore!69 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580291))))

(assert (=> b!1296359 false))

(assert (=> b!1296359 (= lt!580290 call!63356)))

(declare-fun lt!580295 () Bool)

(assert (=> b!1296359 (= lt!580295 call!63354)))

(declare-fun b!1296360 () Bool)

(declare-fun res!861594 () Bool)

(assert (=> b!1296360 (=> (not res!861594) (not e!739584))))

(assert (=> b!1296360 (= res!861594 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42154 _keys!1741))))))

(declare-fun b!1296361 () Bool)

(declare-fun Unit!42946 () Unit!42944)

(assert (=> b!1296361 (= e!739585 Unit!42946)))

(assert (= (and start!109464 res!861593) b!1296346))

(assert (= (and b!1296346 res!861597) b!1296353))

(assert (= (and b!1296353 res!861590) b!1296355))

(assert (= (and b!1296355 res!861591) b!1296360))

(assert (= (and b!1296360 res!861594) b!1296350))

(assert (= (and b!1296350 res!861595) b!1296358))

(assert (= (and b!1296358 res!861596) b!1296356))

(assert (= (and b!1296356 res!861592) b!1296351))

(assert (= (and b!1296351 c!124376) b!1296359))

(assert (= (and b!1296351 (not c!124376)) b!1296349))

(assert (= (and b!1296349 c!124377) b!1296352))

(assert (= (and b!1296349 (not c!124377)) b!1296357))

(assert (= (and b!1296357 c!124378) b!1296347))

(assert (= (and b!1296357 (not c!124378)) b!1296361))

(assert (= (or b!1296352 b!1296347) bm!63357))

(assert (= (or b!1296352 b!1296347) bm!63361))

(assert (= (or b!1296352 b!1296347) bm!63358))

(assert (= (or b!1296352 b!1296347) bm!63354))

(assert (= (or b!1296352 b!1296347) bm!63353))

(assert (= (or b!1296352 b!1296347) bm!63352))

(assert (= (or b!1296359 bm!63357) bm!63355))

(assert (= (or b!1296359 bm!63354) bm!63360))

(assert (= (or b!1296359 bm!63358) bm!63359))

(assert (= (or b!1296359 bm!63361) bm!63362))

(assert (= (or b!1296359 bm!63353) bm!63351))

(assert (= (or b!1296359 bm!63352) bm!63356))

(assert (= (and b!1296345 condMapEmpty!53450) mapIsEmpty!53450))

(assert (= (and b!1296345 (not condMapEmpty!53450)) mapNonEmpty!53450))

(get-info :version)

(assert (= (and mapNonEmpty!53450 ((_ is ValueCellFull!16398) mapValue!53450)) b!1296348))

(assert (= (and b!1296345 ((_ is ValueCellFull!16398) mapDefault!53450)) b!1296354))

(assert (= start!109464 b!1296345))

(declare-fun m!1188247 () Bool)

(assert (=> mapNonEmpty!53450 m!1188247))

(declare-fun m!1188249 () Bool)

(assert (=> bm!63356 m!1188249))

(declare-fun m!1188251 () Bool)

(assert (=> bm!63355 m!1188251))

(declare-fun m!1188253 () Bool)

(assert (=> b!1296359 m!1188253))

(declare-fun m!1188255 () Bool)

(assert (=> b!1296359 m!1188255))

(declare-fun m!1188257 () Bool)

(assert (=> b!1296359 m!1188257))

(declare-fun m!1188259 () Bool)

(assert (=> b!1296359 m!1188259))

(declare-fun m!1188261 () Bool)

(assert (=> b!1296355 m!1188261))

(declare-fun m!1188263 () Bool)

(assert (=> b!1296356 m!1188263))

(assert (=> b!1296356 m!1188263))

(declare-fun m!1188265 () Bool)

(assert (=> b!1296356 m!1188265))

(declare-fun m!1188267 () Bool)

(assert (=> bm!63362 m!1188267))

(declare-fun m!1188269 () Bool)

(assert (=> bm!63351 m!1188269))

(declare-fun m!1188271 () Bool)

(assert (=> bm!63359 m!1188271))

(declare-fun m!1188273 () Bool)

(assert (=> start!109464 m!1188273))

(declare-fun m!1188275 () Bool)

(assert (=> start!109464 m!1188275))

(declare-fun m!1188277 () Bool)

(assert (=> start!109464 m!1188277))

(declare-fun m!1188279 () Bool)

(assert (=> b!1296351 m!1188279))

(declare-fun m!1188281 () Bool)

(assert (=> b!1296351 m!1188281))

(declare-fun m!1188283 () Bool)

(assert (=> b!1296353 m!1188283))

(declare-fun m!1188285 () Bool)

(assert (=> bm!63360 m!1188285))

(declare-fun m!1188287 () Bool)

(assert (=> b!1296350 m!1188287))

(assert (=> b!1296350 m!1188287))

(declare-fun m!1188289 () Bool)

(assert (=> b!1296350 m!1188289))

(check-sat (not bm!63359) b_and!47043 (not start!109464) (not bm!63362) (not bm!63355) (not b!1296350) (not bm!63356) (not b!1296359) (not b!1296356) (not bm!63360) (not b_next!28953) (not b!1296353) tp_is_empty!34593 (not bm!63351) (not mapNonEmpty!53450) (not b!1296351) (not b!1296355))
(check-sat b_and!47043 (not b_next!28953))
