; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110262 () Bool)

(assert start!110262)

(declare-fun b_free!29309 () Bool)

(declare-fun b_next!29309 () Bool)

(assert (=> start!110262 (= b_free!29309 (not b_next!29309))))

(declare-fun tp!103092 () Bool)

(declare-fun b_and!47505 () Bool)

(assert (=> start!110262 (= tp!103092 b_and!47505)))

(declare-fun b!1305286 () Bool)

(declare-fun res!866778 () Bool)

(declare-fun e!744541 () Bool)

(assert (=> b!1305286 (=> (not res!866778) (not e!744541))))

(declare-datatypes ((array!86914 0))(
  ( (array!86915 (arr!41944 (Array (_ BitVec 32) (_ BitVec 64))) (size!42494 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86914)

(declare-datatypes ((List!29776 0))(
  ( (Nil!29773) (Cons!29772 (h!30981 (_ BitVec 64)) (t!43378 List!29776)) )
))
(declare-fun arrayNoDuplicates!0 (array!86914 (_ BitVec 32) List!29776) Bool)

(assert (=> b!1305286 (= res!866778 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29773))))

(declare-fun c!125367 () Bool)

(declare-fun bm!64426 () Bool)

(declare-datatypes ((V!51701 0))(
  ( (V!51702 (val!17549 Int)) )
))
(declare-datatypes ((tuple2!22656 0))(
  ( (tuple2!22657 (_1!11339 (_ BitVec 64)) (_2!11339 V!51701)) )
))
(declare-datatypes ((List!29777 0))(
  ( (Nil!29774) (Cons!29773 (h!30982 tuple2!22656) (t!43379 List!29777)) )
))
(declare-datatypes ((ListLongMap!20313 0))(
  ( (ListLongMap!20314 (toList!10172 List!29777)) )
))
(declare-fun lt!584339 () ListLongMap!20313)

(declare-fun lt!584337 () ListLongMap!20313)

(declare-fun call!64437 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun c!125365 () Bool)

(declare-fun lt!584341 () ListLongMap!20313)

(declare-fun contains!8316 (ListLongMap!20313 (_ BitVec 64)) Bool)

(assert (=> bm!64426 (= call!64437 (contains!8316 (ite c!125365 lt!584341 (ite c!125367 lt!584339 lt!584337)) k!1205))))

(declare-fun b!1305287 () Bool)

(assert (=> b!1305287 (= e!744541 (not false))))

(declare-datatypes ((Unit!43230 0))(
  ( (Unit!43231) )
))
(declare-fun lt!584346 () Unit!43230)

(declare-fun e!744542 () Unit!43230)

(assert (=> b!1305287 (= lt!584346 e!744542)))

(declare-fun lt!584335 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305287 (= c!125365 (and (not lt!584335) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305287 (= lt!584335 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1305287 (not (contains!8316 (ListLongMap!20314 Nil!29774) k!1205))))

(declare-fun lt!584338 () Unit!43230)

(declare-fun emptyContainsNothing!234 ((_ BitVec 64)) Unit!43230)

(assert (=> b!1305287 (= lt!584338 (emptyContainsNothing!234 k!1205))))

(declare-fun b!1305288 () Bool)

(declare-fun e!744536 () Unit!43230)

(declare-fun Unit!43232 () Unit!43230)

(assert (=> b!1305288 (= e!744536 Unit!43232)))

(declare-fun bm!64427 () Bool)

(declare-fun lt!584342 () ListLongMap!20313)

(declare-fun call!64432 () Bool)

(declare-fun call!64436 () ListLongMap!20313)

(assert (=> bm!64427 (= call!64432 (contains!8316 (ite c!125365 lt!584342 call!64436) k!1205))))

(declare-fun bm!64428 () Bool)

(declare-fun call!64430 () Unit!43230)

(declare-fun call!64429 () Unit!43230)

(assert (=> bm!64428 (= call!64430 call!64429)))

(declare-fun bm!64429 () Bool)

(declare-fun call!64439 () Bool)

(assert (=> bm!64429 (= call!64439 call!64437)))

(declare-fun minValue!1387 () V!51701)

(declare-fun zeroValue!1387 () V!51701)

(declare-fun bm!64430 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!94 ((_ BitVec 64) (_ BitVec 64) V!51701 ListLongMap!20313) Unit!43230)

(assert (=> bm!64430 (= call!64429 (lemmaInListMapAfterAddingDiffThenInBefore!94 k!1205 (ite c!125365 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125367 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125365 minValue!1387 (ite c!125367 zeroValue!1387 minValue!1387)) (ite c!125365 lt!584342 (ite c!125367 lt!584339 lt!584337))))))

(declare-fun mapIsEmpty!54030 () Bool)

(declare-fun mapRes!54030 () Bool)

(assert (=> mapIsEmpty!54030 mapRes!54030))

(declare-fun b!1305289 () Bool)

(declare-fun res!866779 () Bool)

(assert (=> b!1305289 (=> (not res!866779) (not e!744541))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1305289 (= res!866779 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42494 _keys!1741))))))

(declare-fun b!1305290 () Bool)

(declare-fun res!866780 () Bool)

(assert (=> b!1305290 (=> (not res!866780) (not e!744541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305290 (= res!866780 (not (validKeyInArray!0 (select (arr!41944 _keys!1741) from!2144))))))

(declare-fun bm!64431 () Bool)

(declare-fun call!64433 () Bool)

(assert (=> bm!64431 (= call!64433 call!64432)))

(declare-fun bm!64432 () Bool)

(declare-fun call!64431 () Unit!43230)

(declare-fun call!64434 () Unit!43230)

(assert (=> bm!64432 (= call!64431 call!64434)))

(declare-fun b!1305291 () Bool)

(declare-fun res!866782 () Bool)

(assert (=> b!1305291 (=> (not res!866782) (not e!744541))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86914 (_ BitVec 32)) Bool)

(assert (=> b!1305291 (= res!866782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1305292 () Bool)

(declare-fun e!744540 () Unit!43230)

(assert (=> b!1305292 (= e!744542 e!744540)))

(assert (=> b!1305292 (= c!125367 (and (not lt!584335) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305293 () Bool)

(declare-fun lt!584340 () Unit!43230)

(assert (=> b!1305293 (= e!744542 lt!584340)))

(declare-fun call!64440 () ListLongMap!20313)

(assert (=> b!1305293 (= lt!584341 call!64440)))

(declare-fun lt!584348 () Unit!43230)

(declare-fun addStillNotContains!489 (ListLongMap!20313 (_ BitVec 64) V!51701 (_ BitVec 64)) Unit!43230)

(assert (=> b!1305293 (= lt!584348 (addStillNotContains!489 lt!584341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun call!64435 () ListLongMap!20313)

(assert (=> b!1305293 (= lt!584342 call!64435)))

(assert (=> b!1305293 (not call!64432)))

(declare-fun lt!584344 () Unit!43230)

(assert (=> b!1305293 (= lt!584344 call!64434)))

(declare-fun +!4492 (ListLongMap!20313 tuple2!22656) ListLongMap!20313)

(assert (=> b!1305293 (not (contains!8316 (+!4492 lt!584341 (tuple2!22657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!584345 () Unit!43230)

(assert (=> b!1305293 (= lt!584345 call!64429)))

(assert (=> b!1305293 false))

(assert (=> b!1305293 (= lt!584340 (lemmaInListMapAfterAddingDiffThenInBefore!94 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584341))))

(declare-fun lt!584347 () Bool)

(assert (=> b!1305293 (= lt!584347 call!64437)))

(declare-fun bm!64433 () Bool)

(assert (=> bm!64433 (= call!64435 (+!4492 (ite c!125365 lt!584341 (ite c!125367 lt!584339 lt!584337)) (ite (or c!125365 c!125367) (tuple2!22657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64434 () Bool)

(assert (=> bm!64434 (= call!64436 call!64435)))

(declare-fun b!1305294 () Bool)

(declare-fun c!125366 () Bool)

(assert (=> b!1305294 (= c!125366 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584335))))

(assert (=> b!1305294 (= e!744540 e!744536)))

(declare-fun bm!64435 () Bool)

(assert (=> bm!64435 (= call!64434 (addStillNotContains!489 (ite c!125365 lt!584341 (ite c!125367 lt!584339 lt!584337)) (ite c!125365 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125367 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125365 minValue!1387 (ite c!125367 zeroValue!1387 minValue!1387)) k!1205))))

(declare-fun bm!64436 () Bool)

(declare-fun call!64438 () ListLongMap!20313)

(assert (=> bm!64436 (= call!64438 call!64440)))

(declare-fun b!1305295 () Bool)

(declare-fun res!866777 () Bool)

(assert (=> b!1305295 (=> (not res!866777) (not e!744541))))

(declare-datatypes ((ValueCell!16576 0))(
  ( (ValueCellFull!16576 (v!20171 V!51701)) (EmptyCell!16576) )
))
(declare-datatypes ((array!86916 0))(
  ( (array!86917 (arr!41945 (Array (_ BitVec 32) ValueCell!16576)) (size!42495 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86916)

(assert (=> b!1305295 (= res!866777 (and (= (size!42495 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42494 _keys!1741) (size!42495 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305296 () Bool)

(declare-fun e!744539 () Bool)

(declare-fun tp_is_empty!34949 () Bool)

(assert (=> b!1305296 (= e!744539 tp_is_empty!34949)))

(declare-fun mapNonEmpty!54030 () Bool)

(declare-fun tp!103091 () Bool)

(declare-fun e!744535 () Bool)

(assert (=> mapNonEmpty!54030 (= mapRes!54030 (and tp!103091 e!744535))))

(declare-fun mapKey!54030 () (_ BitVec 32))

(declare-fun mapRest!54030 () (Array (_ BitVec 32) ValueCell!16576))

(declare-fun mapValue!54030 () ValueCell!16576)

(assert (=> mapNonEmpty!54030 (= (arr!41945 _values!1445) (store mapRest!54030 mapKey!54030 mapValue!54030))))

(declare-fun b!1305297 () Bool)

(declare-fun lt!584334 () Unit!43230)

(assert (=> b!1305297 (= e!744536 lt!584334)))

(assert (=> b!1305297 (= lt!584337 call!64438)))

(declare-fun lt!584349 () Unit!43230)

(assert (=> b!1305297 (= lt!584349 call!64431)))

(assert (=> b!1305297 (not call!64433)))

(assert (=> b!1305297 (= lt!584334 call!64430)))

(assert (=> b!1305297 call!64439))

(declare-fun bm!64437 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6128 (array!86914 array!86916 (_ BitVec 32) (_ BitVec 32) V!51701 V!51701 (_ BitVec 32) Int) ListLongMap!20313)

(assert (=> bm!64437 (= call!64440 (getCurrentListMapNoExtraKeys!6128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!866776 () Bool)

(assert (=> start!110262 (=> (not res!866776) (not e!744541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110262 (= res!866776 (validMask!0 mask!2175))))

(assert (=> start!110262 e!744541))

(assert (=> start!110262 tp_is_empty!34949))

(assert (=> start!110262 true))

(declare-fun e!744538 () Bool)

(declare-fun array_inv!31715 (array!86916) Bool)

(assert (=> start!110262 (and (array_inv!31715 _values!1445) e!744538)))

(declare-fun array_inv!31716 (array!86914) Bool)

(assert (=> start!110262 (array_inv!31716 _keys!1741)))

(assert (=> start!110262 tp!103092))

(declare-fun b!1305298 () Bool)

(declare-fun res!866781 () Bool)

(assert (=> b!1305298 (=> (not res!866781) (not e!744541))))

(assert (=> b!1305298 (= res!866781 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42494 _keys!1741))))))

(declare-fun b!1305299 () Bool)

(assert (=> b!1305299 (= e!744535 tp_is_empty!34949)))

(declare-fun b!1305300 () Bool)

(assert (=> b!1305300 call!64439))

(declare-fun lt!584343 () Unit!43230)

(assert (=> b!1305300 (= lt!584343 call!64430)))

(assert (=> b!1305300 (not call!64433)))

(declare-fun lt!584336 () Unit!43230)

(assert (=> b!1305300 (= lt!584336 call!64431)))

(assert (=> b!1305300 (= lt!584339 call!64438)))

(assert (=> b!1305300 (= e!744540 lt!584343)))

(declare-fun b!1305301 () Bool)

(assert (=> b!1305301 (= e!744538 (and e!744539 mapRes!54030))))

(declare-fun condMapEmpty!54030 () Bool)

(declare-fun mapDefault!54030 () ValueCell!16576)

