; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110482 () Bool)

(assert start!110482)

(declare-fun b_free!29305 () Bool)

(declare-fun b_next!29305 () Bool)

(assert (=> start!110482 (= b_free!29305 (not b_next!29305))))

(declare-fun tp!103080 () Bool)

(declare-fun b_and!47503 () Bool)

(assert (=> start!110482 (= tp!103080 b_and!47503)))

(declare-fun b!1306483 () Bool)

(declare-fun res!867246 () Bool)

(declare-fun e!745334 () Bool)

(assert (=> b!1306483 (=> (not res!867246) (not e!745334))))

(declare-datatypes ((array!86951 0))(
  ( (array!86952 (arr!41958 (Array (_ BitVec 32) (_ BitVec 64))) (size!42509 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86951)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86951 (_ BitVec 32)) Bool)

(assert (=> b!1306483 (= res!867246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!64419 () Bool)

(declare-datatypes ((V!51697 0))(
  ( (V!51698 (val!17547 Int)) )
))
(declare-datatypes ((tuple2!22676 0))(
  ( (tuple2!22677 (_1!11349 (_ BitVec 64)) (_2!11349 V!51697)) )
))
(declare-datatypes ((List!29819 0))(
  ( (Nil!29816) (Cons!29815 (h!31033 tuple2!22676) (t!43413 List!29819)) )
))
(declare-datatypes ((ListLongMap!20341 0))(
  ( (ListLongMap!20342 (toList!10186 List!29819)) )
))
(declare-fun call!64433 () ListLongMap!20341)

(declare-fun call!64425 () ListLongMap!20341)

(assert (=> bm!64419 (= call!64433 call!64425)))

(declare-fun b!1306484 () Bool)

(declare-datatypes ((Unit!43192 0))(
  ( (Unit!43193) )
))
(declare-fun e!745335 () Unit!43192)

(declare-fun lt!584722 () Unit!43192)

(assert (=> b!1306484 (= e!745335 lt!584722)))

(declare-fun lt!584714 () ListLongMap!20341)

(assert (=> b!1306484 (= lt!584714 call!64433)))

(declare-fun lt!584716 () Unit!43192)

(declare-fun call!64428 () Unit!43192)

(assert (=> b!1306484 (= lt!584716 call!64428)))

(declare-fun call!64427 () Bool)

(assert (=> b!1306484 (not call!64427)))

(declare-fun call!64422 () Unit!43192)

(assert (=> b!1306484 (= lt!584722 call!64422)))

(declare-fun call!64429 () Bool)

(assert (=> b!1306484 call!64429))

(declare-fun bm!64420 () Bool)

(declare-fun call!64430 () Bool)

(assert (=> bm!64420 (= call!64429 call!64430)))

(declare-fun minValue!1387 () V!51697)

(declare-fun zeroValue!1387 () V!51697)

(declare-fun call!64423 () Unit!43192)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun bm!64421 () Bool)

(declare-fun lt!584718 () ListLongMap!20341)

(declare-fun lt!584721 () ListLongMap!20341)

(declare-fun c!125747 () Bool)

(declare-fun c!125746 () Bool)

(declare-fun addStillNotContains!489 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> bm!64421 (= call!64423 (addStillNotContains!489 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun bm!64422 () Bool)

(declare-fun lt!584720 () ListLongMap!20341)

(declare-fun contains!8342 (ListLongMap!20341 (_ BitVec 64)) Bool)

(assert (=> bm!64422 (= call!64430 (contains!8342 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) k0!1205))))

(declare-fun b!1306485 () Bool)

(declare-fun e!745333 () Bool)

(declare-fun e!745337 () Bool)

(declare-fun mapRes!54024 () Bool)

(assert (=> b!1306485 (= e!745333 (and e!745337 mapRes!54024))))

(declare-fun condMapEmpty!54024 () Bool)

(declare-datatypes ((ValueCell!16574 0))(
  ( (ValueCellFull!16574 (v!20164 V!51697)) (EmptyCell!16574) )
))
(declare-datatypes ((array!86953 0))(
  ( (array!86954 (arr!41959 (Array (_ BitVec 32) ValueCell!16574)) (size!42510 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86953)

(declare-fun mapDefault!54024 () ValueCell!16574)

(assert (=> b!1306485 (= condMapEmpty!54024 (= (arr!41959 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54024)))))

(declare-fun bm!64423 () Bool)

(assert (=> bm!64423 (= call!64428 call!64423)))

(declare-fun mapNonEmpty!54024 () Bool)

(declare-fun tp!103079 () Bool)

(declare-fun e!745331 () Bool)

(assert (=> mapNonEmpty!54024 (= mapRes!54024 (and tp!103079 e!745331))))

(declare-fun mapKey!54024 () (_ BitVec 32))

(declare-fun mapValue!54024 () ValueCell!16574)

(declare-fun mapRest!54024 () (Array (_ BitVec 32) ValueCell!16574))

(assert (=> mapNonEmpty!54024 (= (arr!41959 _values!1445) (store mapRest!54024 mapKey!54024 mapValue!54024))))

(declare-fun res!867247 () Bool)

(assert (=> start!110482 (=> (not res!867247) (not e!745334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110482 (= res!867247 (validMask!0 mask!2175))))

(assert (=> start!110482 e!745334))

(declare-fun tp_is_empty!34945 () Bool)

(assert (=> start!110482 tp_is_empty!34945))

(assert (=> start!110482 true))

(declare-fun array_inv!31977 (array!86953) Bool)

(assert (=> start!110482 (and (array_inv!31977 _values!1445) e!745333)))

(declare-fun array_inv!31978 (array!86951) Bool)

(assert (=> start!110482 (array_inv!31978 _keys!1741)))

(assert (=> start!110482 tp!103080))

(declare-fun bm!64424 () Bool)

(declare-fun call!64431 () Bool)

(assert (=> bm!64424 (= call!64427 call!64431)))

(declare-fun b!1306486 () Bool)

(declare-fun res!867248 () Bool)

(assert (=> b!1306486 (=> (not res!867248) (not e!745334))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1306486 (= res!867248 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741))))))

(declare-fun b!1306487 () Bool)

(declare-fun Unit!43194 () Unit!43192)

(assert (=> b!1306487 (= e!745335 Unit!43194)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!64425 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6178 (array!86951 array!86953 (_ BitVec 32) (_ BitVec 32) V!51697 V!51697 (_ BitVec 32) Int) ListLongMap!20341)

(assert (=> bm!64425 (= call!64425 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1306488 () Bool)

(declare-fun res!867253 () Bool)

(assert (=> b!1306488 (=> (not res!867253) (not e!745334))))

(assert (=> b!1306488 (= res!867253 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42509 _keys!1741))))))

(declare-fun b!1306489 () Bool)

(declare-fun e!745332 () Unit!43192)

(declare-fun e!745330 () Unit!43192)

(assert (=> b!1306489 (= e!745332 e!745330)))

(declare-fun lt!584729 () Bool)

(assert (=> b!1306489 (= c!125747 (and (not lt!584729) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!64426 () Unit!43192)

(declare-fun bm!64426 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!99 ((_ BitVec 64) (_ BitVec 64) V!51697 ListLongMap!20341) Unit!43192)

(assert (=> bm!64426 (= call!64426 (lemmaInListMapAfterAddingDiffThenInBefore!99 k0!1205 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)) (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))))

(declare-fun b!1306490 () Bool)

(assert (=> b!1306490 call!64429))

(declare-fun lt!584727 () Unit!43192)

(assert (=> b!1306490 (= lt!584727 call!64422)))

(assert (=> b!1306490 (not call!64427)))

(declare-fun lt!584728 () Unit!43192)

(assert (=> b!1306490 (= lt!584728 call!64428)))

(assert (=> b!1306490 (= lt!584718 call!64433)))

(assert (=> b!1306490 (= e!745330 lt!584727)))

(declare-fun call!64424 () ListLongMap!20341)

(declare-fun bm!64427 () Bool)

(assert (=> bm!64427 (= call!64431 (contains!8342 (ite c!125746 lt!584721 call!64424) k0!1205))))

(declare-fun bm!64428 () Bool)

(assert (=> bm!64428 (= call!64422 call!64426)))

(declare-fun b!1306491 () Bool)

(assert (=> b!1306491 (= e!745331 tp_is_empty!34945)))

(declare-fun b!1306492 () Bool)

(declare-fun c!125745 () Bool)

(assert (=> b!1306492 (= c!125745 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584729))))

(assert (=> b!1306492 (= e!745330 e!745335)))

(declare-fun b!1306493 () Bool)

(assert (=> b!1306493 (= e!745334 (not false))))

(declare-fun lt!584725 () Unit!43192)

(assert (=> b!1306493 (= lt!584725 e!745332)))

(assert (=> b!1306493 (= c!125746 (and (not lt!584729) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1306493 (= lt!584729 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1306493 (not (contains!8342 (ListLongMap!20342 Nil!29816) k0!1205))))

(declare-fun lt!584723 () Unit!43192)

(declare-fun emptyContainsNothing!234 ((_ BitVec 64)) Unit!43192)

(assert (=> b!1306493 (= lt!584723 (emptyContainsNothing!234 k0!1205))))

(declare-fun bm!64429 () Bool)

(declare-fun call!64432 () ListLongMap!20341)

(declare-fun +!4538 (ListLongMap!20341 tuple2!22676) ListLongMap!20341)

(assert (=> bm!64429 (= call!64432 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306494 () Bool)

(declare-fun res!867251 () Bool)

(assert (=> b!1306494 (=> (not res!867251) (not e!745334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306494 (= res!867251 (not (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144))))))

(declare-fun b!1306495 () Bool)

(declare-fun lt!584715 () Unit!43192)

(assert (=> b!1306495 (= e!745332 lt!584715)))

(assert (=> b!1306495 (= lt!584721 call!64425)))

(declare-fun lt!584726 () Unit!43192)

(assert (=> b!1306495 (= lt!584726 call!64423)))

(assert (=> b!1306495 (= lt!584720 call!64432)))

(assert (=> b!1306495 (not call!64430)))

(declare-fun lt!584717 () Unit!43192)

(assert (=> b!1306495 (= lt!584717 (addStillNotContains!489 lt!584721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1306495 (not (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584724 () Unit!43192)

(assert (=> b!1306495 (= lt!584724 call!64426)))

(assert (=> b!1306495 false))

(assert (=> b!1306495 (= lt!584715 (lemmaInListMapAfterAddingDiffThenInBefore!99 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584721))))

(declare-fun lt!584719 () Bool)

(assert (=> b!1306495 (= lt!584719 call!64431)))

(declare-fun b!1306496 () Bool)

(assert (=> b!1306496 (= e!745337 tp_is_empty!34945)))

(declare-fun mapIsEmpty!54024 () Bool)

(assert (=> mapIsEmpty!54024 mapRes!54024))

(declare-fun bm!64430 () Bool)

(assert (=> bm!64430 (= call!64424 call!64432)))

(declare-fun b!1306497 () Bool)

(declare-fun res!867252 () Bool)

(assert (=> b!1306497 (=> (not res!867252) (not e!745334))))

(declare-fun getCurrentListMap!5194 (array!86951 array!86953 (_ BitVec 32) (_ BitVec 32) V!51697 V!51697 (_ BitVec 32) Int) ListLongMap!20341)

(assert (=> b!1306497 (= res!867252 (contains!8342 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1306498 () Bool)

(declare-fun res!867250 () Bool)

(assert (=> b!1306498 (=> (not res!867250) (not e!745334))))

(assert (=> b!1306498 (= res!867250 (and (= (size!42510 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42509 _keys!1741) (size!42510 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1306499 () Bool)

(declare-fun res!867249 () Bool)

(assert (=> b!1306499 (=> (not res!867249) (not e!745334))))

(declare-datatypes ((List!29820 0))(
  ( (Nil!29817) (Cons!29816 (h!31034 (_ BitVec 64)) (t!43414 List!29820)) )
))
(declare-fun arrayNoDuplicates!0 (array!86951 (_ BitVec 32) List!29820) Bool)

(assert (=> b!1306499 (= res!867249 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29817))))

(assert (= (and start!110482 res!867247) b!1306498))

(assert (= (and b!1306498 res!867250) b!1306483))

(assert (= (and b!1306483 res!867246) b!1306499))

(assert (= (and b!1306499 res!867249) b!1306486))

(assert (= (and b!1306486 res!867248) b!1306497))

(assert (= (and b!1306497 res!867252) b!1306488))

(assert (= (and b!1306488 res!867253) b!1306494))

(assert (= (and b!1306494 res!867251) b!1306493))

(assert (= (and b!1306493 c!125746) b!1306495))

(assert (= (and b!1306493 (not c!125746)) b!1306489))

(assert (= (and b!1306489 c!125747) b!1306490))

(assert (= (and b!1306489 (not c!125747)) b!1306492))

(assert (= (and b!1306492 c!125745) b!1306484))

(assert (= (and b!1306492 (not c!125745)) b!1306487))

(assert (= (or b!1306490 b!1306484) bm!64420))

(assert (= (or b!1306490 b!1306484) bm!64428))

(assert (= (or b!1306490 b!1306484) bm!64419))

(assert (= (or b!1306490 b!1306484) bm!64423))

(assert (= (or b!1306490 b!1306484) bm!64430))

(assert (= (or b!1306490 b!1306484) bm!64424))

(assert (= (or b!1306495 bm!64424) bm!64427))

(assert (= (or b!1306495 bm!64423) bm!64421))

(assert (= (or b!1306495 bm!64428) bm!64426))

(assert (= (or b!1306495 bm!64419) bm!64425))

(assert (= (or b!1306495 bm!64420) bm!64422))

(assert (= (or b!1306495 bm!64430) bm!64429))

(assert (= (and b!1306485 condMapEmpty!54024) mapIsEmpty!54024))

(assert (= (and b!1306485 (not condMapEmpty!54024)) mapNonEmpty!54024))

(get-info :version)

(assert (= (and mapNonEmpty!54024 ((_ is ValueCellFull!16574) mapValue!54024)) b!1306491))

(assert (= (and b!1306485 ((_ is ValueCellFull!16574) mapDefault!54024)) b!1306496))

(assert (= start!110482 b!1306485))

(declare-fun m!1197793 () Bool)

(assert (=> bm!64422 m!1197793))

(declare-fun m!1197795 () Bool)

(assert (=> b!1306495 m!1197795))

(declare-fun m!1197797 () Bool)

(assert (=> b!1306495 m!1197797))

(assert (=> b!1306495 m!1197797))

(declare-fun m!1197799 () Bool)

(assert (=> b!1306495 m!1197799))

(declare-fun m!1197801 () Bool)

(assert (=> b!1306495 m!1197801))

(declare-fun m!1197803 () Bool)

(assert (=> b!1306493 m!1197803))

(declare-fun m!1197805 () Bool)

(assert (=> b!1306493 m!1197805))

(declare-fun m!1197807 () Bool)

(assert (=> b!1306494 m!1197807))

(assert (=> b!1306494 m!1197807))

(declare-fun m!1197809 () Bool)

(assert (=> b!1306494 m!1197809))

(declare-fun m!1197811 () Bool)

(assert (=> bm!64421 m!1197811))

(declare-fun m!1197813 () Bool)

(assert (=> b!1306499 m!1197813))

(declare-fun m!1197815 () Bool)

(assert (=> bm!64425 m!1197815))

(declare-fun m!1197817 () Bool)

(assert (=> bm!64427 m!1197817))

(declare-fun m!1197819 () Bool)

(assert (=> mapNonEmpty!54024 m!1197819))

(declare-fun m!1197821 () Bool)

(assert (=> b!1306497 m!1197821))

(assert (=> b!1306497 m!1197821))

(declare-fun m!1197823 () Bool)

(assert (=> b!1306497 m!1197823))

(declare-fun m!1197825 () Bool)

(assert (=> b!1306483 m!1197825))

(declare-fun m!1197827 () Bool)

(assert (=> start!110482 m!1197827))

(declare-fun m!1197829 () Bool)

(assert (=> start!110482 m!1197829))

(declare-fun m!1197831 () Bool)

(assert (=> start!110482 m!1197831))

(declare-fun m!1197833 () Bool)

(assert (=> bm!64426 m!1197833))

(declare-fun m!1197835 () Bool)

(assert (=> bm!64429 m!1197835))

(check-sat (not mapNonEmpty!54024) (not bm!64426) (not b!1306495) (not bm!64429) tp_is_empty!34945 (not bm!64425) (not bm!64421) (not bm!64422) (not start!110482) (not b!1306483) (not b_next!29305) (not b!1306494) b_and!47503 (not bm!64427) (not b!1306499) (not b!1306493) (not b!1306497))
(check-sat b_and!47503 (not b_next!29305))
(get-model)

(declare-fun b!1306612 () Bool)

(declare-fun e!745397 () Bool)

(declare-fun contains!8344 (List!29820 (_ BitVec 64)) Bool)

(assert (=> b!1306612 (= e!745397 (contains!8344 Nil!29817 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64505 () Bool)

(declare-fun call!64508 () Bool)

(declare-fun c!125768 () Bool)

(assert (=> bm!64505 (= call!64508 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125768 (Cons!29816 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) Nil!29817) Nil!29817)))))

(declare-fun b!1306614 () Bool)

(declare-fun e!745396 () Bool)

(declare-fun e!745395 () Bool)

(assert (=> b!1306614 (= e!745396 e!745395)))

(declare-fun res!867309 () Bool)

(assert (=> b!1306614 (=> (not res!867309) (not e!745395))))

(assert (=> b!1306614 (= res!867309 (not e!745397))))

(declare-fun res!867308 () Bool)

(assert (=> b!1306614 (=> (not res!867308) (not e!745397))))

(assert (=> b!1306614 (= res!867308 (validKeyInArray!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306615 () Bool)

(declare-fun e!745394 () Bool)

(assert (=> b!1306615 (= e!745394 call!64508)))

(declare-fun b!1306616 () Bool)

(assert (=> b!1306616 (= e!745395 e!745394)))

(assert (=> b!1306616 (= c!125768 (validKeyInArray!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142425 () Bool)

(declare-fun res!867310 () Bool)

(assert (=> d!142425 (=> res!867310 e!745396)))

(assert (=> d!142425 (= res!867310 (bvsge #b00000000000000000000000000000000 (size!42509 _keys!1741)))))

(assert (=> d!142425 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29817) e!745396)))

(declare-fun b!1306613 () Bool)

(assert (=> b!1306613 (= e!745394 call!64508)))

(assert (= (and d!142425 (not res!867310)) b!1306614))

(assert (= (and b!1306614 res!867308) b!1306612))

(assert (= (and b!1306614 res!867309) b!1306616))

(assert (= (and b!1306616 c!125768) b!1306613))

(assert (= (and b!1306616 (not c!125768)) b!1306615))

(assert (= (or b!1306613 b!1306615) bm!64505))

(declare-fun m!1197925 () Bool)

(assert (=> b!1306612 m!1197925))

(assert (=> b!1306612 m!1197925))

(declare-fun m!1197927 () Bool)

(assert (=> b!1306612 m!1197927))

(assert (=> bm!64505 m!1197925))

(declare-fun m!1197929 () Bool)

(assert (=> bm!64505 m!1197929))

(assert (=> b!1306614 m!1197925))

(assert (=> b!1306614 m!1197925))

(declare-fun m!1197931 () Bool)

(assert (=> b!1306614 m!1197931))

(assert (=> b!1306616 m!1197925))

(assert (=> b!1306616 m!1197925))

(assert (=> b!1306616 m!1197931))

(assert (=> b!1306499 d!142425))

(declare-fun d!142427 () Bool)

(declare-fun e!745403 () Bool)

(assert (=> d!142427 e!745403))

(declare-fun res!867313 () Bool)

(assert (=> d!142427 (=> res!867313 e!745403)))

(declare-fun lt!584835 () Bool)

(assert (=> d!142427 (= res!867313 (not lt!584835))))

(declare-fun lt!584834 () Bool)

(assert (=> d!142427 (= lt!584835 lt!584834)))

(declare-fun lt!584836 () Unit!43192)

(declare-fun e!745402 () Unit!43192)

(assert (=> d!142427 (= lt!584836 e!745402)))

(declare-fun c!125771 () Bool)

(assert (=> d!142427 (= c!125771 lt!584834)))

(declare-fun containsKey!731 (List!29819 (_ BitVec 64)) Bool)

(assert (=> d!142427 (= lt!584834 (containsKey!731 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(assert (=> d!142427 (= (contains!8342 (ListLongMap!20342 Nil!29816) k0!1205) lt!584835)))

(declare-fun b!1306623 () Bool)

(declare-fun lt!584837 () Unit!43192)

(assert (=> b!1306623 (= e!745402 lt!584837)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!477 (List!29819 (_ BitVec 64)) Unit!43192)

(assert (=> b!1306623 (= lt!584837 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(declare-datatypes ((Option!756 0))(
  ( (Some!755 (v!20167 V!51697)) (None!754) )
))
(declare-fun isDefined!514 (Option!756) Bool)

(declare-fun getValueByKey!705 (List!29819 (_ BitVec 64)) Option!756)

(assert (=> b!1306623 (isDefined!514 (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(declare-fun b!1306624 () Bool)

(declare-fun Unit!43200 () Unit!43192)

(assert (=> b!1306624 (= e!745402 Unit!43200)))

(declare-fun b!1306625 () Bool)

(assert (=> b!1306625 (= e!745403 (isDefined!514 (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205)))))

(assert (= (and d!142427 c!125771) b!1306623))

(assert (= (and d!142427 (not c!125771)) b!1306624))

(assert (= (and d!142427 (not res!867313)) b!1306625))

(declare-fun m!1197933 () Bool)

(assert (=> d!142427 m!1197933))

(declare-fun m!1197935 () Bool)

(assert (=> b!1306623 m!1197935))

(declare-fun m!1197937 () Bool)

(assert (=> b!1306623 m!1197937))

(assert (=> b!1306623 m!1197937))

(declare-fun m!1197939 () Bool)

(assert (=> b!1306623 m!1197939))

(assert (=> b!1306625 m!1197937))

(assert (=> b!1306625 m!1197937))

(assert (=> b!1306625 m!1197939))

(assert (=> b!1306493 d!142427))

(declare-fun d!142429 () Bool)

(assert (=> d!142429 (not (contains!8342 (ListLongMap!20342 Nil!29816) k0!1205))))

(declare-fun lt!584840 () Unit!43192)

(declare-fun choose!1938 ((_ BitVec 64)) Unit!43192)

(assert (=> d!142429 (= lt!584840 (choose!1938 k0!1205))))

(assert (=> d!142429 (= (emptyContainsNothing!234 k0!1205) lt!584840)))

(declare-fun bs!37196 () Bool)

(assert (= bs!37196 d!142429))

(assert (=> bs!37196 m!1197803))

(declare-fun m!1197941 () Bool)

(assert (=> bs!37196 m!1197941))

(assert (=> b!1306493 d!142429))

(declare-fun b!1306634 () Bool)

(declare-fun e!745411 () Bool)

(declare-fun call!64511 () Bool)

(assert (=> b!1306634 (= e!745411 call!64511)))

(declare-fun bm!64508 () Bool)

(assert (=> bm!64508 (= call!64511 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!142431 () Bool)

(declare-fun res!867318 () Bool)

(declare-fun e!745412 () Bool)

(assert (=> d!142431 (=> res!867318 e!745412)))

(assert (=> d!142431 (= res!867318 (bvsge #b00000000000000000000000000000000 (size!42509 _keys!1741)))))

(assert (=> d!142431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!745412)))

(declare-fun b!1306635 () Bool)

(declare-fun e!745410 () Bool)

(assert (=> b!1306635 (= e!745410 call!64511)))

(declare-fun b!1306636 () Bool)

(assert (=> b!1306636 (= e!745412 e!745411)))

(declare-fun c!125774 () Bool)

(assert (=> b!1306636 (= c!125774 (validKeyInArray!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306637 () Bool)

(assert (=> b!1306637 (= e!745411 e!745410)))

(declare-fun lt!584849 () (_ BitVec 64))

(assert (=> b!1306637 (= lt!584849 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584848 () Unit!43192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86951 (_ BitVec 64) (_ BitVec 32)) Unit!43192)

(assert (=> b!1306637 (= lt!584848 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584849 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306637 (arrayContainsKey!0 _keys!1741 lt!584849 #b00000000000000000000000000000000)))

(declare-fun lt!584847 () Unit!43192)

(assert (=> b!1306637 (= lt!584847 lt!584848)))

(declare-fun res!867319 () Bool)

(declare-datatypes ((SeekEntryResult!9985 0))(
  ( (MissingZero!9985 (index!42311 (_ BitVec 32))) (Found!9985 (index!42312 (_ BitVec 32))) (Intermediate!9985 (undefined!10797 Bool) (index!42313 (_ BitVec 32)) (x!115908 (_ BitVec 32))) (Undefined!9985) (MissingVacant!9985 (index!42314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86951 (_ BitVec 32)) SeekEntryResult!9985)

(assert (=> b!1306637 (= res!867319 (= (seekEntryOrOpen!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9985 #b00000000000000000000000000000000)))))

(assert (=> b!1306637 (=> (not res!867319) (not e!745410))))

(assert (= (and d!142431 (not res!867318)) b!1306636))

(assert (= (and b!1306636 c!125774) b!1306637))

(assert (= (and b!1306636 (not c!125774)) b!1306634))

(assert (= (and b!1306637 res!867319) b!1306635))

(assert (= (or b!1306635 b!1306634) bm!64508))

(declare-fun m!1197943 () Bool)

(assert (=> bm!64508 m!1197943))

(assert (=> b!1306636 m!1197925))

(assert (=> b!1306636 m!1197925))

(assert (=> b!1306636 m!1197931))

(assert (=> b!1306637 m!1197925))

(declare-fun m!1197945 () Bool)

(assert (=> b!1306637 m!1197945))

(declare-fun m!1197947 () Bool)

(assert (=> b!1306637 m!1197947))

(assert (=> b!1306637 m!1197925))

(declare-fun m!1197949 () Bool)

(assert (=> b!1306637 m!1197949))

(assert (=> b!1306483 d!142431))

(declare-fun d!142433 () Bool)

(declare-fun e!745415 () Bool)

(assert (=> d!142433 e!745415))

(declare-fun res!867324 () Bool)

(assert (=> d!142433 (=> (not res!867324) (not e!745415))))

(declare-fun lt!584859 () ListLongMap!20341)

(assert (=> d!142433 (= res!867324 (contains!8342 lt!584859 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584858 () List!29819)

(assert (=> d!142433 (= lt!584859 (ListLongMap!20342 lt!584858))))

(declare-fun lt!584860 () Unit!43192)

(declare-fun lt!584861 () Unit!43192)

(assert (=> d!142433 (= lt!584860 lt!584861)))

(assert (=> d!142433 (= (getValueByKey!705 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!356 (List!29819 (_ BitVec 64) V!51697) Unit!43192)

(assert (=> d!142433 (= lt!584861 (lemmaContainsTupThenGetReturnValue!356 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun insertStrictlySorted!485 (List!29819 (_ BitVec 64) V!51697) List!29819)

(assert (=> d!142433 (= lt!584858 (insertStrictlySorted!485 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142433 (= (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584859)))

(declare-fun b!1306642 () Bool)

(declare-fun res!867325 () Bool)

(assert (=> b!1306642 (=> (not res!867325) (not e!745415))))

(assert (=> b!1306642 (= res!867325 (= (getValueByKey!705 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1306643 () Bool)

(declare-fun contains!8345 (List!29819 tuple2!22676) Bool)

(assert (=> b!1306643 (= e!745415 (contains!8345 (toList!10186 lt!584859) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142433 res!867324) b!1306642))

(assert (= (and b!1306642 res!867325) b!1306643))

(declare-fun m!1197951 () Bool)

(assert (=> d!142433 m!1197951))

(declare-fun m!1197953 () Bool)

(assert (=> d!142433 m!1197953))

(declare-fun m!1197955 () Bool)

(assert (=> d!142433 m!1197955))

(declare-fun m!1197957 () Bool)

(assert (=> d!142433 m!1197957))

(declare-fun m!1197959 () Bool)

(assert (=> b!1306642 m!1197959))

(declare-fun m!1197961 () Bool)

(assert (=> b!1306643 m!1197961))

(assert (=> bm!64429 d!142433))

(declare-fun b!1306668 () Bool)

(declare-fun e!745436 () Bool)

(declare-fun lt!584878 () ListLongMap!20341)

(declare-fun isEmpty!1074 (ListLongMap!20341) Bool)

(assert (=> b!1306668 (= e!745436 (isEmpty!1074 lt!584878))))

(declare-fun b!1306669 () Bool)

(declare-fun e!745434 () Bool)

(declare-fun e!745433 () Bool)

(assert (=> b!1306669 (= e!745434 e!745433)))

(assert (=> b!1306669 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741)))))

(declare-fun res!867334 () Bool)

(assert (=> b!1306669 (= res!867334 (contains!8342 lt!584878 (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> b!1306669 (=> (not res!867334) (not e!745433))))

(declare-fun b!1306670 () Bool)

(declare-fun e!745431 () ListLongMap!20341)

(declare-fun e!745435 () ListLongMap!20341)

(assert (=> b!1306670 (= e!745431 e!745435)))

(declare-fun c!125786 () Bool)

(assert (=> b!1306670 (= c!125786 (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144)))))

(declare-fun bm!64511 () Bool)

(declare-fun call!64514 () ListLongMap!20341)

(assert (=> bm!64511 (= call!64514 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1306671 () Bool)

(assert (=> b!1306671 (= e!745436 (= lt!584878 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1306672 () Bool)

(assert (=> b!1306672 (= e!745434 e!745436)))

(declare-fun c!125783 () Bool)

(assert (=> b!1306672 (= c!125783 (bvslt from!2144 (size!42509 _keys!1741)))))

(declare-fun b!1306673 () Bool)

(assert (=> b!1306673 (= e!745431 (ListLongMap!20342 Nil!29816))))

(declare-fun d!142435 () Bool)

(declare-fun e!745430 () Bool)

(assert (=> d!142435 e!745430))

(declare-fun res!867337 () Bool)

(assert (=> d!142435 (=> (not res!867337) (not e!745430))))

(assert (=> d!142435 (= res!867337 (not (contains!8342 lt!584878 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142435 (= lt!584878 e!745431)))

(declare-fun c!125784 () Bool)

(assert (=> d!142435 (= c!125784 (bvsge from!2144 (size!42509 _keys!1741)))))

(assert (=> d!142435 (validMask!0 mask!2175)))

(assert (=> d!142435 (= (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584878)))

(declare-fun b!1306674 () Bool)

(assert (=> b!1306674 (= e!745435 call!64514)))

(declare-fun b!1306675 () Bool)

(declare-fun res!867335 () Bool)

(assert (=> b!1306675 (=> (not res!867335) (not e!745430))))

(assert (=> b!1306675 (= res!867335 (not (contains!8342 lt!584878 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1306676 () Bool)

(declare-fun lt!584876 () Unit!43192)

(declare-fun lt!584881 () Unit!43192)

(assert (=> b!1306676 (= lt!584876 lt!584881)))

(declare-fun lt!584880 () V!51697)

(declare-fun lt!584879 () ListLongMap!20341)

(declare-fun lt!584882 () (_ BitVec 64))

(declare-fun lt!584877 () (_ BitVec 64))

(assert (=> b!1306676 (not (contains!8342 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880)) lt!584882))))

(assert (=> b!1306676 (= lt!584881 (addStillNotContains!489 lt!584879 lt!584877 lt!584880 lt!584882))))

(assert (=> b!1306676 (= lt!584882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21239 (ValueCell!16574 V!51697) V!51697)

(declare-fun dynLambda!3496 (Int (_ BitVec 64)) V!51697)

(assert (=> b!1306676 (= lt!584880 (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1306676 (= lt!584877 (select (arr!41958 _keys!1741) from!2144))))

(assert (=> b!1306676 (= lt!584879 call!64514)))

(assert (=> b!1306676 (= e!745435 (+!4538 call!64514 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1306677 () Bool)

(declare-fun e!745432 () Bool)

(assert (=> b!1306677 (= e!745432 (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> b!1306677 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1306678 () Bool)

(assert (=> b!1306678 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741)))))

(assert (=> b!1306678 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42510 _values!1445)))))

(declare-fun apply!1035 (ListLongMap!20341 (_ BitVec 64)) V!51697)

(assert (=> b!1306678 (= e!745433 (= (apply!1035 lt!584878 (select (arr!41958 _keys!1741) from!2144)) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1306679 () Bool)

(assert (=> b!1306679 (= e!745430 e!745434)))

(declare-fun c!125785 () Bool)

(assert (=> b!1306679 (= c!125785 e!745432)))

(declare-fun res!867336 () Bool)

(assert (=> b!1306679 (=> (not res!867336) (not e!745432))))

(assert (=> b!1306679 (= res!867336 (bvslt from!2144 (size!42509 _keys!1741)))))

(assert (= (and d!142435 c!125784) b!1306673))

(assert (= (and d!142435 (not c!125784)) b!1306670))

(assert (= (and b!1306670 c!125786) b!1306676))

(assert (= (and b!1306670 (not c!125786)) b!1306674))

(assert (= (or b!1306676 b!1306674) bm!64511))

(assert (= (and d!142435 res!867337) b!1306675))

(assert (= (and b!1306675 res!867335) b!1306679))

(assert (= (and b!1306679 res!867336) b!1306677))

(assert (= (and b!1306679 c!125785) b!1306669))

(assert (= (and b!1306679 (not c!125785)) b!1306672))

(assert (= (and b!1306669 res!867334) b!1306678))

(assert (= (and b!1306672 c!125783) b!1306671))

(assert (= (and b!1306672 (not c!125783)) b!1306668))

(declare-fun b_lambda!23333 () Bool)

(assert (=> (not b_lambda!23333) (not b!1306676)))

(declare-fun t!43419 () Bool)

(declare-fun tb!11399 () Bool)

(assert (=> (and start!110482 (= defaultEntry!1448 defaultEntry!1448) t!43419) tb!11399))

(declare-fun result!23835 () Bool)

(assert (=> tb!11399 (= result!23835 tp_is_empty!34945)))

(assert (=> b!1306676 t!43419))

(declare-fun b_and!47509 () Bool)

(assert (= b_and!47503 (and (=> t!43419 result!23835) b_and!47509)))

(declare-fun b_lambda!23335 () Bool)

(assert (=> (not b_lambda!23335) (not b!1306678)))

(assert (=> b!1306678 t!43419))

(declare-fun b_and!47511 () Bool)

(assert (= b_and!47509 (and (=> t!43419 result!23835) b_and!47511)))

(declare-fun m!1197963 () Bool)

(assert (=> b!1306678 m!1197963))

(declare-fun m!1197965 () Bool)

(assert (=> b!1306678 m!1197965))

(declare-fun m!1197967 () Bool)

(assert (=> b!1306678 m!1197967))

(assert (=> b!1306678 m!1197807))

(declare-fun m!1197969 () Bool)

(assert (=> b!1306678 m!1197969))

(assert (=> b!1306678 m!1197963))

(assert (=> b!1306678 m!1197807))

(assert (=> b!1306678 m!1197965))

(declare-fun m!1197971 () Bool)

(assert (=> b!1306671 m!1197971))

(declare-fun m!1197973 () Bool)

(assert (=> b!1306676 m!1197973))

(assert (=> b!1306676 m!1197963))

(assert (=> b!1306676 m!1197965))

(assert (=> b!1306676 m!1197967))

(declare-fun m!1197975 () Bool)

(assert (=> b!1306676 m!1197975))

(declare-fun m!1197977 () Bool)

(assert (=> b!1306676 m!1197977))

(assert (=> b!1306676 m!1197963))

(assert (=> b!1306676 m!1197807))

(assert (=> b!1306676 m!1197975))

(declare-fun m!1197979 () Bool)

(assert (=> b!1306676 m!1197979))

(assert (=> b!1306676 m!1197965))

(assert (=> b!1306669 m!1197807))

(assert (=> b!1306669 m!1197807))

(declare-fun m!1197981 () Bool)

(assert (=> b!1306669 m!1197981))

(assert (=> bm!64511 m!1197971))

(assert (=> b!1306670 m!1197807))

(assert (=> b!1306670 m!1197807))

(assert (=> b!1306670 m!1197809))

(assert (=> b!1306677 m!1197807))

(assert (=> b!1306677 m!1197807))

(assert (=> b!1306677 m!1197809))

(declare-fun m!1197983 () Bool)

(assert (=> b!1306668 m!1197983))

(declare-fun m!1197985 () Bool)

(assert (=> b!1306675 m!1197985))

(declare-fun m!1197987 () Bool)

(assert (=> d!142435 m!1197987))

(assert (=> d!142435 m!1197827))

(assert (=> bm!64425 d!142435))

(declare-fun d!142437 () Bool)

(assert (=> d!142437 (= (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144)) (and (not (= (select (arr!41958 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41958 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306494 d!142437))

(declare-fun d!142439 () Bool)

(assert (=> d!142439 (not (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584885 () Unit!43192)

(declare-fun choose!1939 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> d!142439 (= lt!584885 (choose!1939 lt!584721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!745439 () Bool)

(assert (=> d!142439 e!745439))

(declare-fun res!867340 () Bool)

(assert (=> d!142439 (=> (not res!867340) (not e!745439))))

(assert (=> d!142439 (= res!867340 (not (contains!8342 lt!584721 k0!1205)))))

(assert (=> d!142439 (= (addStillNotContains!489 lt!584721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!584885)))

(declare-fun b!1306685 () Bool)

(assert (=> b!1306685 (= e!745439 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142439 res!867340) b!1306685))

(assert (=> d!142439 m!1197797))

(assert (=> d!142439 m!1197797))

(assert (=> d!142439 m!1197799))

(declare-fun m!1197989 () Bool)

(assert (=> d!142439 m!1197989))

(declare-fun m!1197991 () Bool)

(assert (=> d!142439 m!1197991))

(assert (=> b!1306495 d!142439))

(declare-fun d!142441 () Bool)

(declare-fun e!745441 () Bool)

(assert (=> d!142441 e!745441))

(declare-fun res!867341 () Bool)

(assert (=> d!142441 (=> res!867341 e!745441)))

(declare-fun lt!584887 () Bool)

(assert (=> d!142441 (= res!867341 (not lt!584887))))

(declare-fun lt!584886 () Bool)

(assert (=> d!142441 (= lt!584887 lt!584886)))

(declare-fun lt!584888 () Unit!43192)

(declare-fun e!745440 () Unit!43192)

(assert (=> d!142441 (= lt!584888 e!745440)))

(declare-fun c!125787 () Bool)

(assert (=> d!142441 (= c!125787 lt!584886)))

(assert (=> d!142441 (= lt!584886 (containsKey!731 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!142441 (= (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!584887)))

(declare-fun b!1306686 () Bool)

(declare-fun lt!584889 () Unit!43192)

(assert (=> b!1306686 (= e!745440 lt!584889)))

(assert (=> b!1306686 (= lt!584889 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1306686 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1306687 () Bool)

(declare-fun Unit!43201 () Unit!43192)

(assert (=> b!1306687 (= e!745440 Unit!43201)))

(declare-fun b!1306688 () Bool)

(assert (=> b!1306688 (= e!745441 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!142441 c!125787) b!1306686))

(assert (= (and d!142441 (not c!125787)) b!1306687))

(assert (= (and d!142441 (not res!867341)) b!1306688))

(declare-fun m!1197993 () Bool)

(assert (=> d!142441 m!1197993))

(declare-fun m!1197995 () Bool)

(assert (=> b!1306686 m!1197995))

(declare-fun m!1197997 () Bool)

(assert (=> b!1306686 m!1197997))

(assert (=> b!1306686 m!1197997))

(declare-fun m!1197999 () Bool)

(assert (=> b!1306686 m!1197999))

(assert (=> b!1306688 m!1197997))

(assert (=> b!1306688 m!1197997))

(assert (=> b!1306688 m!1197999))

(assert (=> b!1306495 d!142441))

(declare-fun d!142443 () Bool)

(declare-fun e!745442 () Bool)

(assert (=> d!142443 e!745442))

(declare-fun res!867342 () Bool)

(assert (=> d!142443 (=> (not res!867342) (not e!745442))))

(declare-fun lt!584891 () ListLongMap!20341)

(assert (=> d!142443 (= res!867342 (contains!8342 lt!584891 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584890 () List!29819)

(assert (=> d!142443 (= lt!584891 (ListLongMap!20342 lt!584890))))

(declare-fun lt!584892 () Unit!43192)

(declare-fun lt!584893 () Unit!43192)

(assert (=> d!142443 (= lt!584892 lt!584893)))

(assert (=> d!142443 (= (getValueByKey!705 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142443 (= lt!584893 (lemmaContainsTupThenGetReturnValue!356 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142443 (= lt!584890 (insertStrictlySorted!485 (toList!10186 lt!584721) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142443 (= (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584891)))

(declare-fun b!1306689 () Bool)

(declare-fun res!867343 () Bool)

(assert (=> b!1306689 (=> (not res!867343) (not e!745442))))

(assert (=> b!1306689 (= res!867343 (= (getValueByKey!705 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306690 () Bool)

(assert (=> b!1306690 (= e!745442 (contains!8345 (toList!10186 lt!584891) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142443 res!867342) b!1306689))

(assert (= (and b!1306689 res!867343) b!1306690))

(declare-fun m!1198001 () Bool)

(assert (=> d!142443 m!1198001))

(declare-fun m!1198003 () Bool)

(assert (=> d!142443 m!1198003))

(declare-fun m!1198005 () Bool)

(assert (=> d!142443 m!1198005))

(declare-fun m!1198007 () Bool)

(assert (=> d!142443 m!1198007))

(declare-fun m!1198009 () Bool)

(assert (=> b!1306689 m!1198009))

(declare-fun m!1198011 () Bool)

(assert (=> b!1306690 m!1198011))

(assert (=> b!1306495 d!142443))

(declare-fun d!142445 () Bool)

(assert (=> d!142445 (contains!8342 lt!584721 k0!1205)))

(declare-fun lt!584896 () Unit!43192)

(declare-fun choose!1940 ((_ BitVec 64) (_ BitVec 64) V!51697 ListLongMap!20341) Unit!43192)

(assert (=> d!142445 (= lt!584896 (choose!1940 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584721))))

(assert (=> d!142445 (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!142445 (= (lemmaInListMapAfterAddingDiffThenInBefore!99 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584721) lt!584896)))

(declare-fun bs!37197 () Bool)

(assert (= bs!37197 d!142445))

(assert (=> bs!37197 m!1197991))

(declare-fun m!1198013 () Bool)

(assert (=> bs!37197 m!1198013))

(declare-fun m!1198015 () Bool)

(assert (=> bs!37197 m!1198015))

(assert (=> bs!37197 m!1198015))

(declare-fun m!1198017 () Bool)

(assert (=> bs!37197 m!1198017))

(assert (=> b!1306495 d!142445))

(declare-fun d!142447 () Bool)

(assert (=> d!142447 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110482 d!142447))

(declare-fun d!142449 () Bool)

(assert (=> d!142449 (= (array_inv!31977 _values!1445) (bvsge (size!42510 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110482 d!142449))

(declare-fun d!142451 () Bool)

(assert (=> d!142451 (= (array_inv!31978 _keys!1741) (bvsge (size!42509 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110482 d!142451))

(declare-fun d!142453 () Bool)

(assert (=> d!142453 (not (contains!8342 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) k0!1205))))

(declare-fun lt!584897 () Unit!43192)

(assert (=> d!142453 (= lt!584897 (choose!1939 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun e!745443 () Bool)

(assert (=> d!142453 e!745443))

(declare-fun res!867344 () Bool)

(assert (=> d!142453 (=> (not res!867344) (not e!745443))))

(assert (=> d!142453 (= res!867344 (not (contains!8342 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) k0!1205)))))

(assert (=> d!142453 (= (addStillNotContains!489 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387) k0!1205) lt!584897)))

(declare-fun b!1306691 () Bool)

(assert (=> b!1306691 (= e!745443 (not (= (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) k0!1205)))))

(assert (= (and d!142453 res!867344) b!1306691))

(declare-fun m!1198019 () Bool)

(assert (=> d!142453 m!1198019))

(assert (=> d!142453 m!1198019))

(declare-fun m!1198021 () Bool)

(assert (=> d!142453 m!1198021))

(declare-fun m!1198023 () Bool)

(assert (=> d!142453 m!1198023))

(declare-fun m!1198025 () Bool)

(assert (=> d!142453 m!1198025))

(assert (=> bm!64421 d!142453))

(declare-fun d!142455 () Bool)

(assert (=> d!142455 (contains!8342 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) k0!1205)))

(declare-fun lt!584898 () Unit!43192)

(assert (=> d!142455 (= lt!584898 (choose!1940 k0!1205 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)) (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))))

(assert (=> d!142455 (contains!8342 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!142455 (= (lemmaInListMapAfterAddingDiffThenInBefore!99 k0!1205 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)) (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) lt!584898)))

(declare-fun bs!37198 () Bool)

(assert (= bs!37198 d!142455))

(assert (=> bs!37198 m!1197793))

(declare-fun m!1198027 () Bool)

(assert (=> bs!37198 m!1198027))

(declare-fun m!1198029 () Bool)

(assert (=> bs!37198 m!1198029))

(assert (=> bs!37198 m!1198029))

(declare-fun m!1198031 () Bool)

(assert (=> bs!37198 m!1198031))

(assert (=> bm!64426 d!142455))

(declare-fun d!142457 () Bool)

(declare-fun e!745445 () Bool)

(assert (=> d!142457 e!745445))

(declare-fun res!867345 () Bool)

(assert (=> d!142457 (=> res!867345 e!745445)))

(declare-fun lt!584900 () Bool)

(assert (=> d!142457 (= res!867345 (not lt!584900))))

(declare-fun lt!584899 () Bool)

(assert (=> d!142457 (= lt!584900 lt!584899)))

(declare-fun lt!584901 () Unit!43192)

(declare-fun e!745444 () Unit!43192)

(assert (=> d!142457 (= lt!584901 e!745444)))

(declare-fun c!125788 () Bool)

(assert (=> d!142457 (= c!125788 lt!584899)))

(assert (=> d!142457 (= lt!584899 (containsKey!731 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(assert (=> d!142457 (= (contains!8342 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) k0!1205) lt!584900)))

(declare-fun b!1306692 () Bool)

(declare-fun lt!584902 () Unit!43192)

(assert (=> b!1306692 (= e!745444 lt!584902)))

(assert (=> b!1306692 (= lt!584902 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(assert (=> b!1306692 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(declare-fun b!1306693 () Bool)

(declare-fun Unit!43202 () Unit!43192)

(assert (=> b!1306693 (= e!745444 Unit!43202)))

(declare-fun b!1306694 () Bool)

(assert (=> b!1306694 (= e!745445 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205)))))

(assert (= (and d!142457 c!125788) b!1306692))

(assert (= (and d!142457 (not c!125788)) b!1306693))

(assert (= (and d!142457 (not res!867345)) b!1306694))

(declare-fun m!1198033 () Bool)

(assert (=> d!142457 m!1198033))

(declare-fun m!1198035 () Bool)

(assert (=> b!1306692 m!1198035))

(declare-fun m!1198037 () Bool)

(assert (=> b!1306692 m!1198037))

(assert (=> b!1306692 m!1198037))

(declare-fun m!1198039 () Bool)

(assert (=> b!1306692 m!1198039))

(assert (=> b!1306694 m!1198037))

(assert (=> b!1306694 m!1198037))

(assert (=> b!1306694 m!1198039))

(assert (=> bm!64422 d!142457))

(declare-fun d!142459 () Bool)

(declare-fun e!745447 () Bool)

(assert (=> d!142459 e!745447))

(declare-fun res!867346 () Bool)

(assert (=> d!142459 (=> res!867346 e!745447)))

(declare-fun lt!584904 () Bool)

(assert (=> d!142459 (= res!867346 (not lt!584904))))

(declare-fun lt!584903 () Bool)

(assert (=> d!142459 (= lt!584904 lt!584903)))

(declare-fun lt!584905 () Unit!43192)

(declare-fun e!745446 () Unit!43192)

(assert (=> d!142459 (= lt!584905 e!745446)))

(declare-fun c!125789 () Bool)

(assert (=> d!142459 (= c!125789 lt!584903)))

(assert (=> d!142459 (= lt!584903 (containsKey!731 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(assert (=> d!142459 (= (contains!8342 (ite c!125746 lt!584721 call!64424) k0!1205) lt!584904)))

(declare-fun b!1306695 () Bool)

(declare-fun lt!584906 () Unit!43192)

(assert (=> b!1306695 (= e!745446 lt!584906)))

(assert (=> b!1306695 (= lt!584906 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(assert (=> b!1306695 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(declare-fun b!1306696 () Bool)

(declare-fun Unit!43203 () Unit!43192)

(assert (=> b!1306696 (= e!745446 Unit!43203)))

(declare-fun b!1306697 () Bool)

(assert (=> b!1306697 (= e!745447 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205)))))

(assert (= (and d!142459 c!125789) b!1306695))

(assert (= (and d!142459 (not c!125789)) b!1306696))

(assert (= (and d!142459 (not res!867346)) b!1306697))

(declare-fun m!1198041 () Bool)

(assert (=> d!142459 m!1198041))

(declare-fun m!1198043 () Bool)

(assert (=> b!1306695 m!1198043))

(declare-fun m!1198045 () Bool)

(assert (=> b!1306695 m!1198045))

(assert (=> b!1306695 m!1198045))

(declare-fun m!1198047 () Bool)

(assert (=> b!1306695 m!1198047))

(assert (=> b!1306697 m!1198045))

(assert (=> b!1306697 m!1198045))

(assert (=> b!1306697 m!1198047))

(assert (=> bm!64427 d!142459))

(declare-fun d!142461 () Bool)

(declare-fun e!745449 () Bool)

(assert (=> d!142461 e!745449))

(declare-fun res!867347 () Bool)

(assert (=> d!142461 (=> res!867347 e!745449)))

(declare-fun lt!584908 () Bool)

(assert (=> d!142461 (= res!867347 (not lt!584908))))

(declare-fun lt!584907 () Bool)

(assert (=> d!142461 (= lt!584908 lt!584907)))

(declare-fun lt!584909 () Unit!43192)

(declare-fun e!745448 () Unit!43192)

(assert (=> d!142461 (= lt!584909 e!745448)))

(declare-fun c!125790 () Bool)

(assert (=> d!142461 (= c!125790 lt!584907)))

(assert (=> d!142461 (= lt!584907 (containsKey!731 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142461 (= (contains!8342 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584908)))

(declare-fun b!1306698 () Bool)

(declare-fun lt!584910 () Unit!43192)

(assert (=> b!1306698 (= e!745448 lt!584910)))

(assert (=> b!1306698 (= lt!584910 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1306698 (isDefined!514 (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1306699 () Bool)

(declare-fun Unit!43204 () Unit!43192)

(assert (=> b!1306699 (= e!745448 Unit!43204)))

(declare-fun b!1306700 () Bool)

(assert (=> b!1306700 (= e!745449 (isDefined!514 (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142461 c!125790) b!1306698))

(assert (= (and d!142461 (not c!125790)) b!1306699))

(assert (= (and d!142461 (not res!867347)) b!1306700))

(declare-fun m!1198049 () Bool)

(assert (=> d!142461 m!1198049))

(declare-fun m!1198051 () Bool)

(assert (=> b!1306698 m!1198051))

(declare-fun m!1198053 () Bool)

(assert (=> b!1306698 m!1198053))

(assert (=> b!1306698 m!1198053))

(declare-fun m!1198055 () Bool)

(assert (=> b!1306698 m!1198055))

(assert (=> b!1306700 m!1198053))

(assert (=> b!1306700 m!1198053))

(assert (=> b!1306700 m!1198055))

(assert (=> b!1306497 d!142461))

(declare-fun b!1306743 () Bool)

(declare-fun e!745488 () Bool)

(declare-fun e!745479 () Bool)

(assert (=> b!1306743 (= e!745488 e!745479)))

(declare-fun c!125806 () Bool)

(assert (=> b!1306743 (= c!125806 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64526 () Bool)

(declare-fun call!64535 () ListLongMap!20341)

(declare-fun call!64532 () ListLongMap!20341)

(assert (=> bm!64526 (= call!64535 call!64532)))

(declare-fun b!1306744 () Bool)

(declare-fun e!745481 () Bool)

(assert (=> b!1306744 (= e!745481 (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144)))))

(declare-fun b!1306745 () Bool)

(declare-fun res!867367 () Bool)

(assert (=> b!1306745 (=> (not res!867367) (not e!745488))))

(declare-fun e!745486 () Bool)

(assert (=> b!1306745 (= res!867367 e!745486)))

(declare-fun res!867371 () Bool)

(assert (=> b!1306745 (=> res!867371 e!745486)))

(declare-fun e!745485 () Bool)

(assert (=> b!1306745 (= res!867371 (not e!745485))))

(declare-fun res!867373 () Bool)

(assert (=> b!1306745 (=> (not res!867373) (not e!745485))))

(assert (=> b!1306745 (= res!867373 (bvslt from!2144 (size!42509 _keys!1741)))))

(declare-fun b!1306746 () Bool)

(declare-fun e!745480 () Unit!43192)

(declare-fun lt!584960 () Unit!43192)

(assert (=> b!1306746 (= e!745480 lt!584960)))

(declare-fun lt!584966 () ListLongMap!20341)

(assert (=> b!1306746 (= lt!584966 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584971 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584956 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584956 (select (arr!41958 _keys!1741) from!2144))))

(declare-fun lt!584955 () Unit!43192)

(declare-fun addStillContains!1122 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> b!1306746 (= lt!584955 (addStillContains!1122 lt!584966 lt!584971 zeroValue!1387 lt!584956))))

(assert (=> b!1306746 (contains!8342 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387)) lt!584956)))

(declare-fun lt!584967 () Unit!43192)

(assert (=> b!1306746 (= lt!584967 lt!584955)))

(declare-fun lt!584959 () ListLongMap!20341)

(assert (=> b!1306746 (= lt!584959 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584961 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584961 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584958 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584958 (select (arr!41958 _keys!1741) from!2144))))

(declare-fun lt!584957 () Unit!43192)

(declare-fun addApplyDifferent!564 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> b!1306746 (= lt!584957 (addApplyDifferent!564 lt!584959 lt!584961 minValue!1387 lt!584958))))

(assert (=> b!1306746 (= (apply!1035 (+!4538 lt!584959 (tuple2!22677 lt!584961 minValue!1387)) lt!584958) (apply!1035 lt!584959 lt!584958))))

(declare-fun lt!584962 () Unit!43192)

(assert (=> b!1306746 (= lt!584962 lt!584957)))

(declare-fun lt!584969 () ListLongMap!20341)

(assert (=> b!1306746 (= lt!584969 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584968 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584972 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584972 (select (arr!41958 _keys!1741) from!2144))))

(declare-fun lt!584970 () Unit!43192)

(assert (=> b!1306746 (= lt!584970 (addApplyDifferent!564 lt!584969 lt!584968 zeroValue!1387 lt!584972))))

(assert (=> b!1306746 (= (apply!1035 (+!4538 lt!584969 (tuple2!22677 lt!584968 zeroValue!1387)) lt!584972) (apply!1035 lt!584969 lt!584972))))

(declare-fun lt!584974 () Unit!43192)

(assert (=> b!1306746 (= lt!584974 lt!584970)))

(declare-fun lt!584963 () ListLongMap!20341)

(assert (=> b!1306746 (= lt!584963 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584964 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584965 () (_ BitVec 64))

(assert (=> b!1306746 (= lt!584965 (select (arr!41958 _keys!1741) from!2144))))

(assert (=> b!1306746 (= lt!584960 (addApplyDifferent!564 lt!584963 lt!584964 minValue!1387 lt!584965))))

(assert (=> b!1306746 (= (apply!1035 (+!4538 lt!584963 (tuple2!22677 lt!584964 minValue!1387)) lt!584965) (apply!1035 lt!584963 lt!584965))))

(declare-fun b!1306747 () Bool)

(declare-fun e!745477 () ListLongMap!20341)

(assert (=> b!1306747 (= e!745477 call!64535)))

(declare-fun call!64530 () ListLongMap!20341)

(declare-fun bm!64527 () Bool)

(assert (=> bm!64527 (= call!64530 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64528 () Bool)

(declare-fun call!64531 () ListLongMap!20341)

(declare-fun call!64529 () ListLongMap!20341)

(assert (=> bm!64528 (= call!64531 call!64529)))

(declare-fun bm!64529 () Bool)

(declare-fun c!125804 () Bool)

(declare-fun c!125807 () Bool)

(assert (=> bm!64529 (= call!64529 (+!4538 (ite c!125804 call!64530 (ite c!125807 call!64532 call!64535)) (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306748 () Bool)

(declare-fun e!745484 () Bool)

(declare-fun e!745482 () Bool)

(assert (=> b!1306748 (= e!745484 e!745482)))

(declare-fun res!867374 () Bool)

(declare-fun call!64533 () Bool)

(assert (=> b!1306748 (= res!867374 call!64533)))

(assert (=> b!1306748 (=> (not res!867374) (not e!745482))))

(declare-fun b!1306749 () Bool)

(declare-fun lt!584976 () ListLongMap!20341)

(assert (=> b!1306749 (= e!745482 (= (apply!1035 lt!584976 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64530 () Bool)

(assert (=> bm!64530 (= call!64532 call!64530)))

(declare-fun b!1306750 () Bool)

(declare-fun e!745487 () Bool)

(assert (=> b!1306750 (= e!745487 (= (apply!1035 lt!584976 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1306751 () Bool)

(assert (=> b!1306751 (= e!745477 call!64531)))

(declare-fun b!1306752 () Bool)

(assert (=> b!1306752 (= e!745479 e!745487)))

(declare-fun res!867369 () Bool)

(declare-fun call!64534 () Bool)

(assert (=> b!1306752 (= res!867369 call!64534)))

(assert (=> b!1306752 (=> (not res!867369) (not e!745487))))

(declare-fun b!1306753 () Bool)

(declare-fun e!745478 () ListLongMap!20341)

(declare-fun e!745476 () ListLongMap!20341)

(assert (=> b!1306753 (= e!745478 e!745476)))

(assert (=> b!1306753 (= c!125807 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1306754 () Bool)

(declare-fun e!745483 () Bool)

(assert (=> b!1306754 (= e!745486 e!745483)))

(declare-fun res!867366 () Bool)

(assert (=> b!1306754 (=> (not res!867366) (not e!745483))))

(assert (=> b!1306754 (= res!867366 (contains!8342 lt!584976 (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> b!1306754 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741)))))

(declare-fun b!1306755 () Bool)

(declare-fun Unit!43205 () Unit!43192)

(assert (=> b!1306755 (= e!745480 Unit!43205)))

(declare-fun b!1306756 () Bool)

(assert (=> b!1306756 (= e!745476 call!64531)))

(declare-fun bm!64531 () Bool)

(assert (=> bm!64531 (= call!64533 (contains!8342 lt!584976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306757 () Bool)

(assert (=> b!1306757 (= e!745478 (+!4538 call!64529 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1306758 () Bool)

(declare-fun c!125808 () Bool)

(assert (=> b!1306758 (= c!125808 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1306758 (= e!745476 e!745477)))

(declare-fun bm!64532 () Bool)

(assert (=> bm!64532 (= call!64534 (contains!8342 lt!584976 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306759 () Bool)

(declare-fun res!867370 () Bool)

(assert (=> b!1306759 (=> (not res!867370) (not e!745488))))

(assert (=> b!1306759 (= res!867370 e!745484)))

(declare-fun c!125803 () Bool)

(assert (=> b!1306759 (= c!125803 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1306760 () Bool)

(assert (=> b!1306760 (= e!745479 (not call!64534))))

(declare-fun d!142463 () Bool)

(assert (=> d!142463 e!745488))

(declare-fun res!867368 () Bool)

(assert (=> d!142463 (=> (not res!867368) (not e!745488))))

(assert (=> d!142463 (= res!867368 (or (bvsge from!2144 (size!42509 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741)))))))

(declare-fun lt!584975 () ListLongMap!20341)

(assert (=> d!142463 (= lt!584976 lt!584975)))

(declare-fun lt!584973 () Unit!43192)

(assert (=> d!142463 (= lt!584973 e!745480)))

(declare-fun c!125805 () Bool)

(assert (=> d!142463 (= c!125805 e!745481)))

(declare-fun res!867372 () Bool)

(assert (=> d!142463 (=> (not res!867372) (not e!745481))))

(assert (=> d!142463 (= res!867372 (bvslt from!2144 (size!42509 _keys!1741)))))

(assert (=> d!142463 (= lt!584975 e!745478)))

(assert (=> d!142463 (= c!125804 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142463 (validMask!0 mask!2175)))

(assert (=> d!142463 (= (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584976)))

(declare-fun b!1306761 () Bool)

(assert (=> b!1306761 (= e!745484 (not call!64533))))

(declare-fun b!1306762 () Bool)

(assert (=> b!1306762 (= e!745485 (validKeyInArray!0 (select (arr!41958 _keys!1741) from!2144)))))

(declare-fun b!1306763 () Bool)

(assert (=> b!1306763 (= e!745483 (= (apply!1035 lt!584976 (select (arr!41958 _keys!1741) from!2144)) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306763 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42510 _values!1445)))))

(assert (=> b!1306763 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42509 _keys!1741)))))

(assert (= (and d!142463 c!125804) b!1306757))

(assert (= (and d!142463 (not c!125804)) b!1306753))

(assert (= (and b!1306753 c!125807) b!1306756))

(assert (= (and b!1306753 (not c!125807)) b!1306758))

(assert (= (and b!1306758 c!125808) b!1306751))

(assert (= (and b!1306758 (not c!125808)) b!1306747))

(assert (= (or b!1306751 b!1306747) bm!64526))

(assert (= (or b!1306756 bm!64526) bm!64530))

(assert (= (or b!1306756 b!1306751) bm!64528))

(assert (= (or b!1306757 bm!64530) bm!64527))

(assert (= (or b!1306757 bm!64528) bm!64529))

(assert (= (and d!142463 res!867372) b!1306744))

(assert (= (and d!142463 c!125805) b!1306746))

(assert (= (and d!142463 (not c!125805)) b!1306755))

(assert (= (and d!142463 res!867368) b!1306745))

(assert (= (and b!1306745 res!867373) b!1306762))

(assert (= (and b!1306745 (not res!867371)) b!1306754))

(assert (= (and b!1306754 res!867366) b!1306763))

(assert (= (and b!1306745 res!867367) b!1306759))

(assert (= (and b!1306759 c!125803) b!1306748))

(assert (= (and b!1306759 (not c!125803)) b!1306761))

(assert (= (and b!1306748 res!867374) b!1306749))

(assert (= (or b!1306748 b!1306761) bm!64531))

(assert (= (and b!1306759 res!867370) b!1306743))

(assert (= (and b!1306743 c!125806) b!1306752))

(assert (= (and b!1306743 (not c!125806)) b!1306760))

(assert (= (and b!1306752 res!867369) b!1306750))

(assert (= (or b!1306752 b!1306760) bm!64532))

(declare-fun b_lambda!23337 () Bool)

(assert (=> (not b_lambda!23337) (not b!1306763)))

(assert (=> b!1306763 t!43419))

(declare-fun b_and!47513 () Bool)

(assert (= b_and!47511 (and (=> t!43419 result!23835) b_and!47513)))

(declare-fun m!1198057 () Bool)

(assert (=> b!1306757 m!1198057))

(assert (=> d!142463 m!1197827))

(assert (=> b!1306763 m!1197963))

(assert (=> b!1306763 m!1197965))

(assert (=> b!1306763 m!1197967))

(assert (=> b!1306763 m!1197965))

(assert (=> b!1306763 m!1197963))

(assert (=> b!1306763 m!1197807))

(assert (=> b!1306763 m!1197807))

(declare-fun m!1198059 () Bool)

(assert (=> b!1306763 m!1198059))

(declare-fun m!1198061 () Bool)

(assert (=> b!1306750 m!1198061))

(assert (=> bm!64527 m!1197815))

(assert (=> b!1306754 m!1197807))

(assert (=> b!1306754 m!1197807))

(declare-fun m!1198063 () Bool)

(assert (=> b!1306754 m!1198063))

(declare-fun m!1198065 () Bool)

(assert (=> bm!64531 m!1198065))

(declare-fun m!1198067 () Bool)

(assert (=> bm!64529 m!1198067))

(assert (=> b!1306762 m!1197807))

(assert (=> b!1306762 m!1197807))

(assert (=> b!1306762 m!1197809))

(declare-fun m!1198069 () Bool)

(assert (=> bm!64532 m!1198069))

(assert (=> b!1306744 m!1197807))

(assert (=> b!1306744 m!1197807))

(assert (=> b!1306744 m!1197809))

(declare-fun m!1198071 () Bool)

(assert (=> b!1306746 m!1198071))

(declare-fun m!1198073 () Bool)

(assert (=> b!1306746 m!1198073))

(declare-fun m!1198075 () Bool)

(assert (=> b!1306746 m!1198075))

(assert (=> b!1306746 m!1198071))

(declare-fun m!1198077 () Bool)

(assert (=> b!1306746 m!1198077))

(declare-fun m!1198079 () Bool)

(assert (=> b!1306746 m!1198079))

(declare-fun m!1198081 () Bool)

(assert (=> b!1306746 m!1198081))

(declare-fun m!1198083 () Bool)

(assert (=> b!1306746 m!1198083))

(assert (=> b!1306746 m!1198073))

(declare-fun m!1198085 () Bool)

(assert (=> b!1306746 m!1198085))

(declare-fun m!1198087 () Bool)

(assert (=> b!1306746 m!1198087))

(declare-fun m!1198089 () Bool)

(assert (=> b!1306746 m!1198089))

(declare-fun m!1198091 () Bool)

(assert (=> b!1306746 m!1198091))

(assert (=> b!1306746 m!1198089))

(declare-fun m!1198093 () Bool)

(assert (=> b!1306746 m!1198093))

(declare-fun m!1198095 () Bool)

(assert (=> b!1306746 m!1198095))

(assert (=> b!1306746 m!1197815))

(assert (=> b!1306746 m!1197807))

(declare-fun m!1198097 () Bool)

(assert (=> b!1306746 m!1198097))

(assert (=> b!1306746 m!1198079))

(declare-fun m!1198099 () Bool)

(assert (=> b!1306746 m!1198099))

(declare-fun m!1198101 () Bool)

(assert (=> b!1306749 m!1198101))

(assert (=> b!1306497 d!142463))

(declare-fun condMapEmpty!54033 () Bool)

(declare-fun mapDefault!54033 () ValueCell!16574)

(assert (=> mapNonEmpty!54024 (= condMapEmpty!54033 (= mapRest!54024 ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54033)))))

(declare-fun e!745493 () Bool)

(declare-fun mapRes!54033 () Bool)

(assert (=> mapNonEmpty!54024 (= tp!103079 (and e!745493 mapRes!54033))))

(declare-fun b!1306770 () Bool)

(declare-fun e!745494 () Bool)

(assert (=> b!1306770 (= e!745494 tp_is_empty!34945)))

(declare-fun mapIsEmpty!54033 () Bool)

(assert (=> mapIsEmpty!54033 mapRes!54033))

(declare-fun b!1306771 () Bool)

(assert (=> b!1306771 (= e!745493 tp_is_empty!34945)))

(declare-fun mapNonEmpty!54033 () Bool)

(declare-fun tp!103095 () Bool)

(assert (=> mapNonEmpty!54033 (= mapRes!54033 (and tp!103095 e!745494))))

(declare-fun mapRest!54033 () (Array (_ BitVec 32) ValueCell!16574))

(declare-fun mapKey!54033 () (_ BitVec 32))

(declare-fun mapValue!54033 () ValueCell!16574)

(assert (=> mapNonEmpty!54033 (= mapRest!54024 (store mapRest!54033 mapKey!54033 mapValue!54033))))

(assert (= (and mapNonEmpty!54024 condMapEmpty!54033) mapIsEmpty!54033))

(assert (= (and mapNonEmpty!54024 (not condMapEmpty!54033)) mapNonEmpty!54033))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16574) mapValue!54033)) b!1306770))

(assert (= (and mapNonEmpty!54024 ((_ is ValueCellFull!16574) mapDefault!54033)) b!1306771))

(declare-fun m!1198103 () Bool)

(assert (=> mapNonEmpty!54033 m!1198103))

(declare-fun b_lambda!23339 () Bool)

(assert (= b_lambda!23337 (or (and start!110482 b_free!29305) b_lambda!23339)))

(declare-fun b_lambda!23341 () Bool)

(assert (= b_lambda!23335 (or (and start!110482 b_free!29305) b_lambda!23341)))

(declare-fun b_lambda!23343 () Bool)

(assert (= b_lambda!23333 (or (and start!110482 b_free!29305) b_lambda!23343)))

(check-sat (not bm!64511) (not bm!64508) (not b!1306688) (not b!1306686) (not b!1306637) (not b!1306616) (not bm!64532) (not d!142427) (not b!1306677) (not bm!64531) (not d!142457) (not b!1306698) (not d!142453) (not b!1306676) (not b!1306675) (not bm!64505) (not d!142443) (not b!1306612) (not d!142433) (not b!1306670) (not d!142429) (not b!1306689) (not b_lambda!23341) (not b!1306671) tp_is_empty!34945 (not b!1306669) (not b!1306692) (not b!1306763) (not d!142463) (not b!1306697) (not b!1306749) (not b!1306694) (not b!1306678) (not d!142441) (not d!142461) (not b!1306643) (not b!1306625) (not b!1306642) (not b!1306762) (not mapNonEmpty!54033) (not b!1306750) (not b!1306700) (not b!1306614) (not d!142435) (not d!142439) (not d!142445) (not b!1306757) (not b!1306623) (not b_next!29305) (not d!142459) (not d!142455) (not b!1306668) (not b!1306746) (not b!1306695) (not b!1306744) b_and!47513 (not b!1306690) (not b!1306636) (not b_lambda!23343) (not b_lambda!23339) (not bm!64527) (not b!1306754) (not bm!64529))
(check-sat b_and!47513 (not b_next!29305))
(get-model)

(declare-fun d!142465 () Bool)

(declare-fun lt!584979 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!647 (List!29820) (InoxSet (_ BitVec 64)))

(assert (=> d!142465 (= lt!584979 (select (content!647 Nil!29817) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!745499 () Bool)

(assert (=> d!142465 (= lt!584979 e!745499)))

(declare-fun res!867379 () Bool)

(assert (=> d!142465 (=> (not res!867379) (not e!745499))))

(assert (=> d!142465 (= res!867379 ((_ is Cons!29816) Nil!29817))))

(assert (=> d!142465 (= (contains!8344 Nil!29817 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)) lt!584979)))

(declare-fun b!1306776 () Bool)

(declare-fun e!745500 () Bool)

(assert (=> b!1306776 (= e!745499 e!745500)))

(declare-fun res!867380 () Bool)

(assert (=> b!1306776 (=> res!867380 e!745500)))

(assert (=> b!1306776 (= res!867380 (= (h!31034 Nil!29817) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306777 () Bool)

(assert (=> b!1306777 (= e!745500 (contains!8344 (t!43414 Nil!29817) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142465 res!867379) b!1306776))

(assert (= (and b!1306776 (not res!867380)) b!1306777))

(declare-fun m!1198105 () Bool)

(assert (=> d!142465 m!1198105))

(assert (=> d!142465 m!1197925))

(declare-fun m!1198107 () Bool)

(assert (=> d!142465 m!1198107))

(assert (=> b!1306777 m!1197925))

(declare-fun m!1198109 () Bool)

(assert (=> b!1306777 m!1198109))

(assert (=> b!1306612 d!142465))

(declare-fun d!142467 () Bool)

(declare-fun c!125813 () Bool)

(assert (=> d!142467 (= c!125813 (and ((_ is Cons!29815) (toList!10186 lt!584891)) (= (_1!11349 (h!31033 (toList!10186 lt!584891))) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!745505 () Option!756)

(assert (=> d!142467 (= (getValueByKey!705 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!745505)))

(declare-fun b!1306787 () Bool)

(declare-fun e!745506 () Option!756)

(assert (=> b!1306787 (= e!745505 e!745506)))

(declare-fun c!125814 () Bool)

(assert (=> b!1306787 (= c!125814 (and ((_ is Cons!29815) (toList!10186 lt!584891)) (not (= (_1!11349 (h!31033 (toList!10186 lt!584891))) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1306789 () Bool)

(assert (=> b!1306789 (= e!745506 None!754)))

(declare-fun b!1306788 () Bool)

(assert (=> b!1306788 (= e!745506 (getValueByKey!705 (t!43413 (toList!10186 lt!584891)) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306786 () Bool)

(assert (=> b!1306786 (= e!745505 (Some!755 (_2!11349 (h!31033 (toList!10186 lt!584891)))))))

(assert (= (and d!142467 c!125813) b!1306786))

(assert (= (and d!142467 (not c!125813)) b!1306787))

(assert (= (and b!1306787 c!125814) b!1306788))

(assert (= (and b!1306787 (not c!125814)) b!1306789))

(declare-fun m!1198111 () Bool)

(assert (=> b!1306788 m!1198111))

(assert (=> b!1306689 d!142467))

(declare-fun d!142469 () Bool)

(declare-fun get!21240 (Option!756) V!51697)

(assert (=> d!142469 (= (apply!1035 lt!584878 (select (arr!41958 _keys!1741) from!2144)) (get!21240 (getValueByKey!705 (toList!10186 lt!584878) (select (arr!41958 _keys!1741) from!2144))))))

(declare-fun bs!37199 () Bool)

(assert (= bs!37199 d!142469))

(assert (=> bs!37199 m!1197807))

(declare-fun m!1198113 () Bool)

(assert (=> bs!37199 m!1198113))

(assert (=> bs!37199 m!1198113))

(declare-fun m!1198115 () Bool)

(assert (=> bs!37199 m!1198115))

(assert (=> b!1306678 d!142469))

(declare-fun d!142471 () Bool)

(declare-fun c!125817 () Bool)

(assert (=> d!142471 (= c!125817 ((_ is ValueCellFull!16574) (select (arr!41959 _values!1445) from!2144)))))

(declare-fun e!745509 () V!51697)

(assert (=> d!142471 (= (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!745509)))

(declare-fun b!1306794 () Bool)

(declare-fun get!21241 (ValueCell!16574 V!51697) V!51697)

(assert (=> b!1306794 (= e!745509 (get!21241 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1306795 () Bool)

(declare-fun get!21242 (ValueCell!16574 V!51697) V!51697)

(assert (=> b!1306795 (= e!745509 (get!21242 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142471 c!125817) b!1306794))

(assert (= (and d!142471 (not c!125817)) b!1306795))

(assert (=> b!1306794 m!1197963))

(assert (=> b!1306794 m!1197965))

(declare-fun m!1198117 () Bool)

(assert (=> b!1306794 m!1198117))

(assert (=> b!1306795 m!1197963))

(assert (=> b!1306795 m!1197965))

(declare-fun m!1198119 () Bool)

(assert (=> b!1306795 m!1198119))

(assert (=> b!1306678 d!142471))

(assert (=> d!142429 d!142427))

(declare-fun d!142473 () Bool)

(assert (=> d!142473 (not (contains!8342 (ListLongMap!20342 Nil!29816) k0!1205))))

(assert (=> d!142473 true))

(declare-fun _$29!204 () Unit!43192)

(assert (=> d!142473 (= (choose!1938 k0!1205) _$29!204)))

(declare-fun bs!37200 () Bool)

(assert (= bs!37200 d!142473))

(assert (=> bs!37200 m!1197803))

(assert (=> d!142429 d!142473))

(declare-fun d!142475 () Bool)

(declare-fun e!745510 () Bool)

(assert (=> d!142475 e!745510))

(declare-fun res!867381 () Bool)

(assert (=> d!142475 (=> (not res!867381) (not e!745510))))

(declare-fun lt!584981 () ListLongMap!20341)

(assert (=> d!142475 (= res!867381 (contains!8342 lt!584981 (_1!11349 (tuple2!22677 lt!584877 lt!584880))))))

(declare-fun lt!584980 () List!29819)

(assert (=> d!142475 (= lt!584981 (ListLongMap!20342 lt!584980))))

(declare-fun lt!584982 () Unit!43192)

(declare-fun lt!584983 () Unit!43192)

(assert (=> d!142475 (= lt!584982 lt!584983)))

(assert (=> d!142475 (= (getValueByKey!705 lt!584980 (_1!11349 (tuple2!22677 lt!584877 lt!584880))) (Some!755 (_2!11349 (tuple2!22677 lt!584877 lt!584880))))))

(assert (=> d!142475 (= lt!584983 (lemmaContainsTupThenGetReturnValue!356 lt!584980 (_1!11349 (tuple2!22677 lt!584877 lt!584880)) (_2!11349 (tuple2!22677 lt!584877 lt!584880))))))

(assert (=> d!142475 (= lt!584980 (insertStrictlySorted!485 (toList!10186 lt!584879) (_1!11349 (tuple2!22677 lt!584877 lt!584880)) (_2!11349 (tuple2!22677 lt!584877 lt!584880))))))

(assert (=> d!142475 (= (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880)) lt!584981)))

(declare-fun b!1306796 () Bool)

(declare-fun res!867382 () Bool)

(assert (=> b!1306796 (=> (not res!867382) (not e!745510))))

(assert (=> b!1306796 (= res!867382 (= (getValueByKey!705 (toList!10186 lt!584981) (_1!11349 (tuple2!22677 lt!584877 lt!584880))) (Some!755 (_2!11349 (tuple2!22677 lt!584877 lt!584880)))))))

(declare-fun b!1306797 () Bool)

(assert (=> b!1306797 (= e!745510 (contains!8345 (toList!10186 lt!584981) (tuple2!22677 lt!584877 lt!584880)))))

(assert (= (and d!142475 res!867381) b!1306796))

(assert (= (and b!1306796 res!867382) b!1306797))

(declare-fun m!1198121 () Bool)

(assert (=> d!142475 m!1198121))

(declare-fun m!1198123 () Bool)

(assert (=> d!142475 m!1198123))

(declare-fun m!1198125 () Bool)

(assert (=> d!142475 m!1198125))

(declare-fun m!1198127 () Bool)

(assert (=> d!142475 m!1198127))

(declare-fun m!1198129 () Bool)

(assert (=> b!1306796 m!1198129))

(declare-fun m!1198131 () Bool)

(assert (=> b!1306797 m!1198131))

(assert (=> b!1306676 d!142475))

(declare-fun d!142477 () Bool)

(assert (=> d!142477 (not (contains!8342 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880)) lt!584882))))

(declare-fun lt!584984 () Unit!43192)

(assert (=> d!142477 (= lt!584984 (choose!1939 lt!584879 lt!584877 lt!584880 lt!584882))))

(declare-fun e!745511 () Bool)

(assert (=> d!142477 e!745511))

(declare-fun res!867383 () Bool)

(assert (=> d!142477 (=> (not res!867383) (not e!745511))))

(assert (=> d!142477 (= res!867383 (not (contains!8342 lt!584879 lt!584882)))))

(assert (=> d!142477 (= (addStillNotContains!489 lt!584879 lt!584877 lt!584880 lt!584882) lt!584984)))

(declare-fun b!1306798 () Bool)

(assert (=> b!1306798 (= e!745511 (not (= lt!584877 lt!584882)))))

(assert (= (and d!142477 res!867383) b!1306798))

(assert (=> d!142477 m!1197975))

(assert (=> d!142477 m!1197975))

(assert (=> d!142477 m!1197977))

(declare-fun m!1198133 () Bool)

(assert (=> d!142477 m!1198133))

(declare-fun m!1198135 () Bool)

(assert (=> d!142477 m!1198135))

(assert (=> b!1306676 d!142477))

(declare-fun d!142479 () Bool)

(declare-fun e!745512 () Bool)

(assert (=> d!142479 e!745512))

(declare-fun res!867384 () Bool)

(assert (=> d!142479 (=> (not res!867384) (not e!745512))))

(declare-fun lt!584986 () ListLongMap!20341)

(assert (=> d!142479 (= res!867384 (contains!8342 lt!584986 (_1!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!584985 () List!29819)

(assert (=> d!142479 (= lt!584986 (ListLongMap!20342 lt!584985))))

(declare-fun lt!584987 () Unit!43192)

(declare-fun lt!584988 () Unit!43192)

(assert (=> d!142479 (= lt!584987 lt!584988)))

(assert (=> d!142479 (= (getValueByKey!705 lt!584985 (_1!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!755 (_2!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142479 (= lt!584988 (lemmaContainsTupThenGetReturnValue!356 lt!584985 (_1!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142479 (= lt!584985 (insertStrictlySorted!485 (toList!10186 call!64514) (_1!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142479 (= (+!4538 call!64514 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!584986)))

(declare-fun b!1306799 () Bool)

(declare-fun res!867385 () Bool)

(assert (=> b!1306799 (=> (not res!867385) (not e!745512))))

(assert (=> b!1306799 (= res!867385 (= (getValueByKey!705 (toList!10186 lt!584986) (_1!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!755 (_2!11349 (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1306800 () Bool)

(assert (=> b!1306800 (= e!745512 (contains!8345 (toList!10186 lt!584986) (tuple2!22677 (select (arr!41958 _keys!1741) from!2144) (get!21239 (select (arr!41959 _values!1445) from!2144) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142479 res!867384) b!1306799))

(assert (= (and b!1306799 res!867385) b!1306800))

(declare-fun m!1198137 () Bool)

(assert (=> d!142479 m!1198137))

(declare-fun m!1198139 () Bool)

(assert (=> d!142479 m!1198139))

(declare-fun m!1198141 () Bool)

(assert (=> d!142479 m!1198141))

(declare-fun m!1198143 () Bool)

(assert (=> d!142479 m!1198143))

(declare-fun m!1198145 () Bool)

(assert (=> b!1306799 m!1198145))

(declare-fun m!1198147 () Bool)

(assert (=> b!1306800 m!1198147))

(assert (=> b!1306676 d!142479))

(declare-fun d!142481 () Bool)

(declare-fun e!745514 () Bool)

(assert (=> d!142481 e!745514))

(declare-fun res!867386 () Bool)

(assert (=> d!142481 (=> res!867386 e!745514)))

(declare-fun lt!584990 () Bool)

(assert (=> d!142481 (= res!867386 (not lt!584990))))

(declare-fun lt!584989 () Bool)

(assert (=> d!142481 (= lt!584990 lt!584989)))

(declare-fun lt!584991 () Unit!43192)

(declare-fun e!745513 () Unit!43192)

(assert (=> d!142481 (= lt!584991 e!745513)))

(declare-fun c!125818 () Bool)

(assert (=> d!142481 (= c!125818 lt!584989)))

(assert (=> d!142481 (= lt!584989 (containsKey!731 (toList!10186 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880))) lt!584882))))

(assert (=> d!142481 (= (contains!8342 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880)) lt!584882) lt!584990)))

(declare-fun b!1306801 () Bool)

(declare-fun lt!584992 () Unit!43192)

(assert (=> b!1306801 (= e!745513 lt!584992)))

(assert (=> b!1306801 (= lt!584992 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880))) lt!584882))))

(assert (=> b!1306801 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880))) lt!584882))))

(declare-fun b!1306802 () Bool)

(declare-fun Unit!43206 () Unit!43192)

(assert (=> b!1306802 (= e!745513 Unit!43206)))

(declare-fun b!1306803 () Bool)

(assert (=> b!1306803 (= e!745514 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584879 (tuple2!22677 lt!584877 lt!584880))) lt!584882)))))

(assert (= (and d!142481 c!125818) b!1306801))

(assert (= (and d!142481 (not c!125818)) b!1306802))

(assert (= (and d!142481 (not res!867386)) b!1306803))

(declare-fun m!1198149 () Bool)

(assert (=> d!142481 m!1198149))

(declare-fun m!1198151 () Bool)

(assert (=> b!1306801 m!1198151))

(declare-fun m!1198153 () Bool)

(assert (=> b!1306801 m!1198153))

(assert (=> b!1306801 m!1198153))

(declare-fun m!1198155 () Bool)

(assert (=> b!1306801 m!1198155))

(assert (=> b!1306803 m!1198153))

(assert (=> b!1306803 m!1198153))

(assert (=> b!1306803 m!1198155))

(assert (=> b!1306676 d!142481))

(assert (=> b!1306676 d!142471))

(declare-fun d!142483 () Bool)

(declare-fun e!745516 () Bool)

(assert (=> d!142483 e!745516))

(declare-fun res!867387 () Bool)

(assert (=> d!142483 (=> res!867387 e!745516)))

(declare-fun lt!584994 () Bool)

(assert (=> d!142483 (= res!867387 (not lt!584994))))

(declare-fun lt!584993 () Bool)

(assert (=> d!142483 (= lt!584994 lt!584993)))

(declare-fun lt!584995 () Unit!43192)

(declare-fun e!745515 () Unit!43192)

(assert (=> d!142483 (= lt!584995 e!745515)))

(declare-fun c!125819 () Bool)

(assert (=> d!142483 (= c!125819 lt!584993)))

(assert (=> d!142483 (= lt!584993 (containsKey!731 (toList!10186 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) k0!1205))))

(assert (=> d!142483 (= (contains!8342 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) k0!1205) lt!584994)))

(declare-fun b!1306804 () Bool)

(declare-fun lt!584996 () Unit!43192)

(assert (=> b!1306804 (= e!745515 lt!584996)))

(assert (=> b!1306804 (= lt!584996 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) k0!1205))))

(assert (=> b!1306804 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) k0!1205))))

(declare-fun b!1306805 () Bool)

(declare-fun Unit!43207 () Unit!43192)

(assert (=> b!1306805 (= e!745515 Unit!43207)))

(declare-fun b!1306806 () Bool)

(assert (=> b!1306806 (= e!745516 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) k0!1205)))))

(assert (= (and d!142483 c!125819) b!1306804))

(assert (= (and d!142483 (not c!125819)) b!1306805))

(assert (= (and d!142483 (not res!867387)) b!1306806))

(declare-fun m!1198157 () Bool)

(assert (=> d!142483 m!1198157))

(declare-fun m!1198159 () Bool)

(assert (=> b!1306804 m!1198159))

(declare-fun m!1198161 () Bool)

(assert (=> b!1306804 m!1198161))

(assert (=> b!1306804 m!1198161))

(declare-fun m!1198163 () Bool)

(assert (=> b!1306804 m!1198163))

(assert (=> b!1306806 m!1198161))

(assert (=> b!1306806 m!1198161))

(assert (=> b!1306806 m!1198163))

(assert (=> d!142453 d!142483))

(declare-fun d!142485 () Bool)

(declare-fun e!745517 () Bool)

(assert (=> d!142485 e!745517))

(declare-fun res!867388 () Bool)

(assert (=> d!142485 (=> (not res!867388) (not e!745517))))

(declare-fun lt!584998 () ListLongMap!20341)

(assert (=> d!142485 (= res!867388 (contains!8342 lt!584998 (_1!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))))))

(declare-fun lt!584997 () List!29819)

(assert (=> d!142485 (= lt!584998 (ListLongMap!20342 lt!584997))))

(declare-fun lt!584999 () Unit!43192)

(declare-fun lt!585000 () Unit!43192)

(assert (=> d!142485 (= lt!584999 lt!585000)))

(assert (=> d!142485 (= (getValueByKey!705 lt!584997 (_1!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) (Some!755 (_2!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142485 (= lt!585000 (lemmaContainsTupThenGetReturnValue!356 lt!584997 (_1!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) (_2!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142485 (= lt!584997 (insertStrictlySorted!485 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) (_1!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) (_2!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))))))

(assert (=> d!142485 (= (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) lt!584998)))

(declare-fun b!1306807 () Bool)

(declare-fun res!867389 () Bool)

(assert (=> b!1306807 (=> (not res!867389) (not e!745517))))

(assert (=> b!1306807 (= res!867389 (= (getValueByKey!705 (toList!10186 lt!584998) (_1!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387)))) (Some!755 (_2!11349 (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))))))))

(declare-fun b!1306808 () Bool)

(assert (=> b!1306808 (= e!745517 (contains!8345 (toList!10186 lt!584998) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))))))

(assert (= (and d!142485 res!867388) b!1306807))

(assert (= (and b!1306807 res!867389) b!1306808))

(declare-fun m!1198165 () Bool)

(assert (=> d!142485 m!1198165))

(declare-fun m!1198167 () Bool)

(assert (=> d!142485 m!1198167))

(declare-fun m!1198169 () Bool)

(assert (=> d!142485 m!1198169))

(declare-fun m!1198171 () Bool)

(assert (=> d!142485 m!1198171))

(declare-fun m!1198173 () Bool)

(assert (=> b!1306807 m!1198173))

(declare-fun m!1198175 () Bool)

(assert (=> b!1306808 m!1198175))

(assert (=> d!142453 d!142485))

(declare-fun d!142487 () Bool)

(assert (=> d!142487 (not (contains!8342 (+!4538 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387))) k0!1205))))

(assert (=> d!142487 true))

(declare-fun _$36!381 () Unit!43192)

(assert (=> d!142487 (= (choose!1939 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) (ite (or c!125746 c!125747) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125746 c!125747) zeroValue!1387 minValue!1387) k0!1205) _$36!381)))

(declare-fun bs!37201 () Bool)

(assert (= bs!37201 d!142487))

(assert (=> bs!37201 m!1198019))

(assert (=> bs!37201 m!1198019))

(assert (=> bs!37201 m!1198021))

(assert (=> d!142453 d!142487))

(declare-fun d!142489 () Bool)

(declare-fun e!745519 () Bool)

(assert (=> d!142489 e!745519))

(declare-fun res!867390 () Bool)

(assert (=> d!142489 (=> res!867390 e!745519)))

(declare-fun lt!585002 () Bool)

(assert (=> d!142489 (= res!867390 (not lt!585002))))

(declare-fun lt!585001 () Bool)

(assert (=> d!142489 (= lt!585002 lt!585001)))

(declare-fun lt!585003 () Unit!43192)

(declare-fun e!745518 () Unit!43192)

(assert (=> d!142489 (= lt!585003 e!745518)))

(declare-fun c!125820 () Bool)

(assert (=> d!142489 (= c!125820 lt!585001)))

(assert (=> d!142489 (= lt!585001 (containsKey!731 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(assert (=> d!142489 (= (contains!8342 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)) k0!1205) lt!585002)))

(declare-fun b!1306810 () Bool)

(declare-fun lt!585004 () Unit!43192)

(assert (=> b!1306810 (= e!745518 lt!585004)))

(assert (=> b!1306810 (= lt!585004 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(assert (=> b!1306810 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(declare-fun b!1306811 () Bool)

(declare-fun Unit!43208 () Unit!43192)

(assert (=> b!1306811 (= e!745518 Unit!43208)))

(declare-fun b!1306812 () Bool)

(assert (=> b!1306812 (= e!745519 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) k0!1205)))))

(assert (= (and d!142489 c!125820) b!1306810))

(assert (= (and d!142489 (not c!125820)) b!1306811))

(assert (= (and d!142489 (not res!867390)) b!1306812))

(declare-fun m!1198177 () Bool)

(assert (=> d!142489 m!1198177))

(declare-fun m!1198179 () Bool)

(assert (=> b!1306810 m!1198179))

(declare-fun m!1198181 () Bool)

(assert (=> b!1306810 m!1198181))

(assert (=> b!1306810 m!1198181))

(declare-fun m!1198183 () Bool)

(assert (=> b!1306810 m!1198183))

(assert (=> b!1306812 m!1198181))

(assert (=> b!1306812 m!1198181))

(assert (=> b!1306812 m!1198183))

(assert (=> d!142453 d!142489))

(declare-fun b!1306813 () Bool)

(declare-fun e!745523 () Bool)

(assert (=> b!1306813 (= e!745523 (contains!8344 (ite c!125768 (Cons!29816 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) Nil!29817) Nil!29817) (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!64536 () Bool)

(declare-fun bm!64533 () Bool)

(declare-fun c!125821 () Bool)

(assert (=> bm!64533 (= call!64536 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125821 (Cons!29816 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125768 (Cons!29816 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) Nil!29817) Nil!29817)) (ite c!125768 (Cons!29816 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) Nil!29817) Nil!29817))))))

(declare-fun b!1306815 () Bool)

(declare-fun e!745522 () Bool)

(declare-fun e!745521 () Bool)

(assert (=> b!1306815 (= e!745522 e!745521)))

(declare-fun res!867392 () Bool)

(assert (=> b!1306815 (=> (not res!867392) (not e!745521))))

(assert (=> b!1306815 (= res!867392 (not e!745523))))

(declare-fun res!867391 () Bool)

(assert (=> b!1306815 (=> (not res!867391) (not e!745523))))

(assert (=> b!1306815 (= res!867391 (validKeyInArray!0 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1306816 () Bool)

(declare-fun e!745520 () Bool)

(assert (=> b!1306816 (= e!745520 call!64536)))

(declare-fun b!1306817 () Bool)

(assert (=> b!1306817 (= e!745521 e!745520)))

(assert (=> b!1306817 (= c!125821 (validKeyInArray!0 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142491 () Bool)

(declare-fun res!867393 () Bool)

(assert (=> d!142491 (=> res!867393 e!745522)))

(assert (=> d!142491 (= res!867393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(assert (=> d!142491 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125768 (Cons!29816 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) Nil!29817) Nil!29817)) e!745522)))

(declare-fun b!1306814 () Bool)

(assert (=> b!1306814 (= e!745520 call!64536)))

(assert (= (and d!142491 (not res!867393)) b!1306815))

(assert (= (and b!1306815 res!867391) b!1306813))

(assert (= (and b!1306815 res!867392) b!1306817))

(assert (= (and b!1306817 c!125821) b!1306814))

(assert (= (and b!1306817 (not c!125821)) b!1306816))

(assert (= (or b!1306814 b!1306816) bm!64533))

(declare-fun m!1198185 () Bool)

(assert (=> b!1306813 m!1198185))

(assert (=> b!1306813 m!1198185))

(declare-fun m!1198187 () Bool)

(assert (=> b!1306813 m!1198187))

(assert (=> bm!64533 m!1198185))

(declare-fun m!1198189 () Bool)

(assert (=> bm!64533 m!1198189))

(assert (=> b!1306815 m!1198185))

(assert (=> b!1306815 m!1198185))

(declare-fun m!1198191 () Bool)

(assert (=> b!1306815 m!1198191))

(assert (=> b!1306817 m!1198185))

(assert (=> b!1306817 m!1198185))

(assert (=> b!1306817 m!1198191))

(assert (=> bm!64505 d!142491))

(declare-fun d!142493 () Bool)

(declare-fun e!745525 () Bool)

(assert (=> d!142493 e!745525))

(declare-fun res!867394 () Bool)

(assert (=> d!142493 (=> res!867394 e!745525)))

(declare-fun lt!585006 () Bool)

(assert (=> d!142493 (= res!867394 (not lt!585006))))

(declare-fun lt!585005 () Bool)

(assert (=> d!142493 (= lt!585006 lt!585005)))

(declare-fun lt!585007 () Unit!43192)

(declare-fun e!745524 () Unit!43192)

(assert (=> d!142493 (= lt!585007 e!745524)))

(declare-fun c!125822 () Bool)

(assert (=> d!142493 (= c!125822 lt!585005)))

(assert (=> d!142493 (= lt!585005 (containsKey!731 (toList!10186 lt!584976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142493 (= (contains!8342 lt!584976 #b1000000000000000000000000000000000000000000000000000000000000000) lt!585006)))

(declare-fun b!1306818 () Bool)

(declare-fun lt!585008 () Unit!43192)

(assert (=> b!1306818 (= e!745524 lt!585008)))

(assert (=> b!1306818 (= lt!585008 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306818 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306819 () Bool)

(declare-fun Unit!43209 () Unit!43192)

(assert (=> b!1306819 (= e!745524 Unit!43209)))

(declare-fun b!1306820 () Bool)

(assert (=> b!1306820 (= e!745525 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142493 c!125822) b!1306818))

(assert (= (and d!142493 (not c!125822)) b!1306819))

(assert (= (and d!142493 (not res!867394)) b!1306820))

(declare-fun m!1198193 () Bool)

(assert (=> d!142493 m!1198193))

(declare-fun m!1198195 () Bool)

(assert (=> b!1306818 m!1198195))

(declare-fun m!1198197 () Bool)

(assert (=> b!1306818 m!1198197))

(assert (=> b!1306818 m!1198197))

(declare-fun m!1198199 () Bool)

(assert (=> b!1306818 m!1198199))

(assert (=> b!1306820 m!1198197))

(assert (=> b!1306820 m!1198197))

(assert (=> b!1306820 m!1198199))

(assert (=> bm!64532 d!142493))

(declare-fun d!142495 () Bool)

(declare-fun e!745527 () Bool)

(assert (=> d!142495 e!745527))

(declare-fun res!867395 () Bool)

(assert (=> d!142495 (=> res!867395 e!745527)))

(declare-fun lt!585010 () Bool)

(assert (=> d!142495 (= res!867395 (not lt!585010))))

(declare-fun lt!585009 () Bool)

(assert (=> d!142495 (= lt!585010 lt!585009)))

(declare-fun lt!585011 () Unit!43192)

(declare-fun e!745526 () Unit!43192)

(assert (=> d!142495 (= lt!585011 e!745526)))

(declare-fun c!125823 () Bool)

(assert (=> d!142495 (= c!125823 lt!585009)))

(assert (=> d!142495 (= lt!585009 (containsKey!731 (toList!10186 lt!584878) (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> d!142495 (= (contains!8342 lt!584878 (select (arr!41958 _keys!1741) from!2144)) lt!585010)))

(declare-fun b!1306821 () Bool)

(declare-fun lt!585012 () Unit!43192)

(assert (=> b!1306821 (= e!745526 lt!585012)))

(assert (=> b!1306821 (= lt!585012 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584878) (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> b!1306821 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) (select (arr!41958 _keys!1741) from!2144)))))

(declare-fun b!1306822 () Bool)

(declare-fun Unit!43210 () Unit!43192)

(assert (=> b!1306822 (= e!745526 Unit!43210)))

(declare-fun b!1306823 () Bool)

(assert (=> b!1306823 (= e!745527 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) (select (arr!41958 _keys!1741) from!2144))))))

(assert (= (and d!142495 c!125823) b!1306821))

(assert (= (and d!142495 (not c!125823)) b!1306822))

(assert (= (and d!142495 (not res!867395)) b!1306823))

(assert (=> d!142495 m!1197807))

(declare-fun m!1198201 () Bool)

(assert (=> d!142495 m!1198201))

(assert (=> b!1306821 m!1197807))

(declare-fun m!1198203 () Bool)

(assert (=> b!1306821 m!1198203))

(assert (=> b!1306821 m!1197807))

(assert (=> b!1306821 m!1198113))

(assert (=> b!1306821 m!1198113))

(declare-fun m!1198205 () Bool)

(assert (=> b!1306821 m!1198205))

(assert (=> b!1306823 m!1197807))

(assert (=> b!1306823 m!1198113))

(assert (=> b!1306823 m!1198113))

(assert (=> b!1306823 m!1198205))

(assert (=> b!1306669 d!142495))

(declare-fun d!142497 () Bool)

(declare-fun isEmpty!1075 (Option!756) Bool)

(assert (=> d!142497 (= (isDefined!514 (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205)) (not (isEmpty!1075 (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))))

(declare-fun bs!37202 () Bool)

(assert (= bs!37202 d!142497))

(assert (=> bs!37202 m!1197937))

(declare-fun m!1198207 () Bool)

(assert (=> bs!37202 m!1198207))

(assert (=> b!1306625 d!142497))

(declare-fun d!142499 () Bool)

(declare-fun c!125824 () Bool)

(assert (=> d!142499 (= c!125824 (and ((_ is Cons!29815) (toList!10186 (ListLongMap!20342 Nil!29816))) (= (_1!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816)))) k0!1205)))))

(declare-fun e!745528 () Option!756)

(assert (=> d!142499 (= (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205) e!745528)))

(declare-fun b!1306825 () Bool)

(declare-fun e!745529 () Option!756)

(assert (=> b!1306825 (= e!745528 e!745529)))

(declare-fun c!125825 () Bool)

(assert (=> b!1306825 (= c!125825 (and ((_ is Cons!29815) (toList!10186 (ListLongMap!20342 Nil!29816))) (not (= (_1!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816)))) k0!1205))))))

(declare-fun b!1306827 () Bool)

(assert (=> b!1306827 (= e!745529 None!754)))

(declare-fun b!1306826 () Bool)

(assert (=> b!1306826 (= e!745529 (getValueByKey!705 (t!43413 (toList!10186 (ListLongMap!20342 Nil!29816))) k0!1205))))

(declare-fun b!1306824 () Bool)

(assert (=> b!1306824 (= e!745528 (Some!755 (_2!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816))))))))

(assert (= (and d!142499 c!125824) b!1306824))

(assert (= (and d!142499 (not c!125824)) b!1306825))

(assert (= (and b!1306825 c!125825) b!1306826))

(assert (= (and b!1306825 (not c!125825)) b!1306827))

(declare-fun m!1198209 () Bool)

(assert (=> b!1306826 m!1198209))

(assert (=> b!1306625 d!142499))

(declare-fun d!142501 () Bool)

(declare-fun e!745530 () Bool)

(assert (=> d!142501 e!745530))

(declare-fun res!867396 () Bool)

(assert (=> d!142501 (=> (not res!867396) (not e!745530))))

(declare-fun lt!585014 () ListLongMap!20341)

(assert (=> d!142501 (= res!867396 (contains!8342 lt!585014 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!585013 () List!29819)

(assert (=> d!142501 (= lt!585014 (ListLongMap!20342 lt!585013))))

(declare-fun lt!585015 () Unit!43192)

(declare-fun lt!585016 () Unit!43192)

(assert (=> d!142501 (= lt!585015 lt!585016)))

(assert (=> d!142501 (= (getValueByKey!705 lt!585013 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142501 (= lt!585016 (lemmaContainsTupThenGetReturnValue!356 lt!585013 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142501 (= lt!585013 (insertStrictlySorted!485 (toList!10186 call!64529) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142501 (= (+!4538 call!64529 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!585014)))

(declare-fun b!1306828 () Bool)

(declare-fun res!867397 () Bool)

(assert (=> b!1306828 (=> (not res!867397) (not e!745530))))

(assert (=> b!1306828 (= res!867397 (= (getValueByKey!705 (toList!10186 lt!585014) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306829 () Bool)

(assert (=> b!1306829 (= e!745530 (contains!8345 (toList!10186 lt!585014) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142501 res!867396) b!1306828))

(assert (= (and b!1306828 res!867397) b!1306829))

(declare-fun m!1198211 () Bool)

(assert (=> d!142501 m!1198211))

(declare-fun m!1198213 () Bool)

(assert (=> d!142501 m!1198213))

(declare-fun m!1198215 () Bool)

(assert (=> d!142501 m!1198215))

(declare-fun m!1198217 () Bool)

(assert (=> d!142501 m!1198217))

(declare-fun m!1198219 () Bool)

(assert (=> b!1306828 m!1198219))

(declare-fun m!1198221 () Bool)

(assert (=> b!1306829 m!1198221))

(assert (=> b!1306757 d!142501))

(declare-fun d!142503 () Bool)

(assert (=> d!142503 (isDefined!514 (getValueByKey!705 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(declare-fun lt!585019 () Unit!43192)

(declare-fun choose!1941 (List!29819 (_ BitVec 64)) Unit!43192)

(assert (=> d!142503 (= lt!585019 (choose!1941 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(declare-fun e!745533 () Bool)

(assert (=> d!142503 e!745533))

(declare-fun res!867400 () Bool)

(assert (=> d!142503 (=> (not res!867400) (not e!745533))))

(declare-fun isStrictlySorted!863 (List!29819) Bool)

(assert (=> d!142503 (= res!867400 (isStrictlySorted!863 (toList!10186 (ListLongMap!20342 Nil!29816))))))

(assert (=> d!142503 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205) lt!585019)))

(declare-fun b!1306832 () Bool)

(assert (=> b!1306832 (= e!745533 (containsKey!731 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205))))

(assert (= (and d!142503 res!867400) b!1306832))

(assert (=> d!142503 m!1197937))

(assert (=> d!142503 m!1197937))

(assert (=> d!142503 m!1197939))

(declare-fun m!1198223 () Bool)

(assert (=> d!142503 m!1198223))

(declare-fun m!1198225 () Bool)

(assert (=> d!142503 m!1198225))

(assert (=> b!1306832 m!1197933))

(assert (=> b!1306623 d!142503))

(assert (=> b!1306623 d!142497))

(assert (=> b!1306623 d!142499))

(declare-fun d!142505 () Bool)

(declare-fun res!867405 () Bool)

(declare-fun e!745538 () Bool)

(assert (=> d!142505 (=> res!867405 e!745538)))

(assert (=> d!142505 (= res!867405 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) k0!1205)))))

(assert (=> d!142505 (= (containsKey!731 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205) e!745538)))

(declare-fun b!1306837 () Bool)

(declare-fun e!745539 () Bool)

(assert (=> b!1306837 (= e!745538 e!745539)))

(declare-fun res!867406 () Bool)

(assert (=> b!1306837 (=> (not res!867406) (not e!745539))))

(assert (=> b!1306837 (= res!867406 (and (or (not ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) (bvsle (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) k0!1205)) ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) (bvslt (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) k0!1205)))))

(declare-fun b!1306838 () Bool)

(assert (=> b!1306838 (= e!745539 (containsKey!731 (t!43413 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) k0!1205))))

(assert (= (and d!142505 (not res!867405)) b!1306837))

(assert (= (and b!1306837 res!867406) b!1306838))

(declare-fun m!1198227 () Bool)

(assert (=> b!1306838 m!1198227))

(assert (=> d!142457 d!142505))

(declare-fun d!142507 () Bool)

(declare-fun res!867407 () Bool)

(declare-fun e!745540 () Bool)

(assert (=> d!142507 (=> res!867407 e!745540)))

(assert (=> d!142507 (= res!867407 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 call!64424))) (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424)))) k0!1205)))))

(assert (=> d!142507 (= (containsKey!731 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205) e!745540)))

(declare-fun b!1306839 () Bool)

(declare-fun e!745541 () Bool)

(assert (=> b!1306839 (= e!745540 e!745541)))

(declare-fun res!867408 () Bool)

(assert (=> b!1306839 (=> (not res!867408) (not e!745541))))

(assert (=> b!1306839 (= res!867408 (and (or (not ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 call!64424)))) (bvsle (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424)))) k0!1205)) ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 call!64424))) (bvslt (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424)))) k0!1205)))))

(declare-fun b!1306840 () Bool)

(assert (=> b!1306840 (= e!745541 (containsKey!731 (t!43413 (toList!10186 (ite c!125746 lt!584721 call!64424))) k0!1205))))

(assert (= (and d!142507 (not res!867407)) b!1306839))

(assert (= (and b!1306839 res!867408) b!1306840))

(declare-fun m!1198229 () Bool)

(assert (=> b!1306840 m!1198229))

(assert (=> d!142459 d!142507))

(declare-fun d!142509 () Bool)

(assert (=> d!142509 (= (validKeyInArray!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306636 d!142509))

(declare-fun d!142511 () Bool)

(declare-fun lt!585022 () Bool)

(declare-fun content!648 (List!29819) (InoxSet tuple2!22676))

(assert (=> d!142511 (= lt!585022 (select (content!648 (toList!10186 lt!584859)) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!745547 () Bool)

(assert (=> d!142511 (= lt!585022 e!745547)))

(declare-fun res!867413 () Bool)

(assert (=> d!142511 (=> (not res!867413) (not e!745547))))

(assert (=> d!142511 (= res!867413 ((_ is Cons!29815) (toList!10186 lt!584859)))))

(assert (=> d!142511 (= (contains!8345 (toList!10186 lt!584859) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!585022)))

(declare-fun b!1306845 () Bool)

(declare-fun e!745546 () Bool)

(assert (=> b!1306845 (= e!745547 e!745546)))

(declare-fun res!867414 () Bool)

(assert (=> b!1306845 (=> res!867414 e!745546)))

(assert (=> b!1306845 (= res!867414 (= (h!31033 (toList!10186 lt!584859)) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306846 () Bool)

(assert (=> b!1306846 (= e!745546 (contains!8345 (t!43413 (toList!10186 lt!584859)) (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142511 res!867413) b!1306845))

(assert (= (and b!1306845 (not res!867414)) b!1306846))

(declare-fun m!1198231 () Bool)

(assert (=> d!142511 m!1198231))

(declare-fun m!1198233 () Bool)

(assert (=> d!142511 m!1198233))

(declare-fun m!1198235 () Bool)

(assert (=> b!1306846 m!1198235))

(assert (=> b!1306643 d!142511))

(declare-fun b!1306847 () Bool)

(declare-fun e!745549 () Bool)

(declare-fun call!64537 () Bool)

(assert (=> b!1306847 (= e!745549 call!64537)))

(declare-fun bm!64534 () Bool)

(assert (=> bm!64534 (= call!64537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!142513 () Bool)

(declare-fun res!867415 () Bool)

(declare-fun e!745550 () Bool)

(assert (=> d!142513 (=> res!867415 e!745550)))

(assert (=> d!142513 (= res!867415 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(assert (=> d!142513 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!745550)))

(declare-fun b!1306848 () Bool)

(declare-fun e!745548 () Bool)

(assert (=> b!1306848 (= e!745548 call!64537)))

(declare-fun b!1306849 () Bool)

(assert (=> b!1306849 (= e!745550 e!745549)))

(declare-fun c!125826 () Bool)

(assert (=> b!1306849 (= c!125826 (validKeyInArray!0 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1306850 () Bool)

(assert (=> b!1306850 (= e!745549 e!745548)))

(declare-fun lt!585025 () (_ BitVec 64))

(assert (=> b!1306850 (= lt!585025 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!585024 () Unit!43192)

(assert (=> b!1306850 (= lt!585024 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!585025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1306850 (arrayContainsKey!0 _keys!1741 lt!585025 #b00000000000000000000000000000000)))

(declare-fun lt!585023 () Unit!43192)

(assert (=> b!1306850 (= lt!585023 lt!585024)))

(declare-fun res!867416 () Bool)

(assert (=> b!1306850 (= res!867416 (= (seekEntryOrOpen!0 (select (arr!41958 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!9985 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1306850 (=> (not res!867416) (not e!745548))))

(assert (= (and d!142513 (not res!867415)) b!1306849))

(assert (= (and b!1306849 c!125826) b!1306850))

(assert (= (and b!1306849 (not c!125826)) b!1306847))

(assert (= (and b!1306850 res!867416) b!1306848))

(assert (= (or b!1306848 b!1306847) bm!64534))

(declare-fun m!1198237 () Bool)

(assert (=> bm!64534 m!1198237))

(assert (=> b!1306849 m!1198185))

(assert (=> b!1306849 m!1198185))

(assert (=> b!1306849 m!1198191))

(assert (=> b!1306850 m!1198185))

(declare-fun m!1198239 () Bool)

(assert (=> b!1306850 m!1198239))

(declare-fun m!1198241 () Bool)

(assert (=> b!1306850 m!1198241))

(assert (=> b!1306850 m!1198185))

(declare-fun m!1198243 () Bool)

(assert (=> b!1306850 m!1198243))

(assert (=> bm!64508 d!142513))

(declare-fun d!142515 () Bool)

(declare-fun res!867417 () Bool)

(declare-fun e!745551 () Bool)

(assert (=> d!142515 (=> res!867417 e!745551)))

(assert (=> d!142515 (= res!867417 (and ((_ is Cons!29815) (toList!10186 (ListLongMap!20342 Nil!29816))) (= (_1!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816)))) k0!1205)))))

(assert (=> d!142515 (= (containsKey!731 (toList!10186 (ListLongMap!20342 Nil!29816)) k0!1205) e!745551)))

(declare-fun b!1306851 () Bool)

(declare-fun e!745552 () Bool)

(assert (=> b!1306851 (= e!745551 e!745552)))

(declare-fun res!867418 () Bool)

(assert (=> b!1306851 (=> (not res!867418) (not e!745552))))

(assert (=> b!1306851 (= res!867418 (and (or (not ((_ is Cons!29815) (toList!10186 (ListLongMap!20342 Nil!29816)))) (bvsle (_1!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816)))) k0!1205)) ((_ is Cons!29815) (toList!10186 (ListLongMap!20342 Nil!29816))) (bvslt (_1!11349 (h!31033 (toList!10186 (ListLongMap!20342 Nil!29816)))) k0!1205)))))

(declare-fun b!1306852 () Bool)

(assert (=> b!1306852 (= e!745552 (containsKey!731 (t!43413 (toList!10186 (ListLongMap!20342 Nil!29816))) k0!1205))))

(assert (= (and d!142515 (not res!867417)) b!1306851))

(assert (= (and b!1306851 res!867418) b!1306852))

(declare-fun m!1198245 () Bool)

(assert (=> b!1306852 m!1198245))

(assert (=> d!142427 d!142515))

(assert (=> b!1306762 d!142437))

(declare-fun d!142517 () Bool)

(declare-fun e!745554 () Bool)

(assert (=> d!142517 e!745554))

(declare-fun res!867419 () Bool)

(assert (=> d!142517 (=> res!867419 e!745554)))

(declare-fun lt!585027 () Bool)

(assert (=> d!142517 (= res!867419 (not lt!585027))))

(declare-fun lt!585026 () Bool)

(assert (=> d!142517 (= lt!585027 lt!585026)))

(declare-fun lt!585028 () Unit!43192)

(declare-fun e!745553 () Unit!43192)

(assert (=> d!142517 (= lt!585028 e!745553)))

(declare-fun c!125827 () Bool)

(assert (=> d!142517 (= c!125827 lt!585026)))

(assert (=> d!142517 (= lt!585026 (containsKey!731 (toList!10186 lt!584721) k0!1205))))

(assert (=> d!142517 (= (contains!8342 lt!584721 k0!1205) lt!585027)))

(declare-fun b!1306853 () Bool)

(declare-fun lt!585029 () Unit!43192)

(assert (=> b!1306853 (= e!745553 lt!585029)))

(assert (=> b!1306853 (= lt!585029 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584721) k0!1205))))

(assert (=> b!1306853 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584721) k0!1205))))

(declare-fun b!1306854 () Bool)

(declare-fun Unit!43211 () Unit!43192)

(assert (=> b!1306854 (= e!745553 Unit!43211)))

(declare-fun b!1306855 () Bool)

(assert (=> b!1306855 (= e!745554 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584721) k0!1205)))))

(assert (= (and d!142517 c!125827) b!1306853))

(assert (= (and d!142517 (not c!125827)) b!1306854))

(assert (= (and d!142517 (not res!867419)) b!1306855))

(declare-fun m!1198247 () Bool)

(assert (=> d!142517 m!1198247))

(declare-fun m!1198249 () Bool)

(assert (=> b!1306853 m!1198249))

(declare-fun m!1198251 () Bool)

(assert (=> b!1306853 m!1198251))

(assert (=> b!1306853 m!1198251))

(declare-fun m!1198253 () Bool)

(assert (=> b!1306853 m!1198253))

(assert (=> b!1306855 m!1198251))

(assert (=> b!1306855 m!1198251))

(assert (=> b!1306855 m!1198253))

(assert (=> d!142445 d!142517))

(declare-fun d!142519 () Bool)

(assert (=> d!142519 (contains!8342 lt!584721 k0!1205)))

(assert (=> d!142519 true))

(declare-fun _$21!124 () Unit!43192)

(assert (=> d!142519 (= (choose!1940 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584721) _$21!124)))

(declare-fun bs!37203 () Bool)

(assert (= bs!37203 d!142519))

(assert (=> bs!37203 m!1197991))

(assert (=> d!142445 d!142519))

(declare-fun d!142521 () Bool)

(declare-fun e!745556 () Bool)

(assert (=> d!142521 e!745556))

(declare-fun res!867420 () Bool)

(assert (=> d!142521 (=> res!867420 e!745556)))

(declare-fun lt!585031 () Bool)

(assert (=> d!142521 (= res!867420 (not lt!585031))))

(declare-fun lt!585030 () Bool)

(assert (=> d!142521 (= lt!585031 lt!585030)))

(declare-fun lt!585032 () Unit!43192)

(declare-fun e!745555 () Unit!43192)

(assert (=> d!142521 (= lt!585032 e!745555)))

(declare-fun c!125828 () Bool)

(assert (=> d!142521 (= c!125828 lt!585030)))

(assert (=> d!142521 (= lt!585030 (containsKey!731 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!142521 (= (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!585031)))

(declare-fun b!1306856 () Bool)

(declare-fun lt!585033 () Unit!43192)

(assert (=> b!1306856 (= e!745555 lt!585033)))

(assert (=> b!1306856 (= lt!585033 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1306856 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1306857 () Bool)

(declare-fun Unit!43212 () Unit!43192)

(assert (=> b!1306857 (= e!745555 Unit!43212)))

(declare-fun b!1306858 () Bool)

(assert (=> b!1306858 (= e!745556 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!142521 c!125828) b!1306856))

(assert (= (and d!142521 (not c!125828)) b!1306857))

(assert (= (and d!142521 (not res!867420)) b!1306858))

(declare-fun m!1198255 () Bool)

(assert (=> d!142521 m!1198255))

(declare-fun m!1198257 () Bool)

(assert (=> b!1306856 m!1198257))

(declare-fun m!1198259 () Bool)

(assert (=> b!1306856 m!1198259))

(assert (=> b!1306856 m!1198259))

(declare-fun m!1198261 () Bool)

(assert (=> b!1306856 m!1198261))

(assert (=> b!1306858 m!1198259))

(assert (=> b!1306858 m!1198259))

(assert (=> b!1306858 m!1198261))

(assert (=> d!142445 d!142521))

(declare-fun d!142523 () Bool)

(declare-fun e!745557 () Bool)

(assert (=> d!142523 e!745557))

(declare-fun res!867421 () Bool)

(assert (=> d!142523 (=> (not res!867421) (not e!745557))))

(declare-fun lt!585035 () ListLongMap!20341)

(assert (=> d!142523 (= res!867421 (contains!8342 lt!585035 (_1!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!585034 () List!29819)

(assert (=> d!142523 (= lt!585035 (ListLongMap!20342 lt!585034))))

(declare-fun lt!585036 () Unit!43192)

(declare-fun lt!585037 () Unit!43192)

(assert (=> d!142523 (= lt!585036 lt!585037)))

(assert (=> d!142523 (= (getValueByKey!705 lt!585034 (_1!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142523 (= lt!585037 (lemmaContainsTupThenGetReturnValue!356 lt!585034 (_1!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142523 (= lt!585034 (insertStrictlySorted!485 (toList!10186 lt!584721) (_1!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142523 (= (+!4538 lt!584721 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!585035)))

(declare-fun b!1306859 () Bool)

(declare-fun res!867422 () Bool)

(assert (=> b!1306859 (=> (not res!867422) (not e!745557))))

(assert (=> b!1306859 (= res!867422 (= (getValueByKey!705 (toList!10186 lt!585035) (_1!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1306860 () Bool)

(assert (=> b!1306860 (= e!745557 (contains!8345 (toList!10186 lt!585035) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!142523 res!867421) b!1306859))

(assert (= (and b!1306859 res!867422) b!1306860))

(declare-fun m!1198263 () Bool)

(assert (=> d!142523 m!1198263))

(declare-fun m!1198265 () Bool)

(assert (=> d!142523 m!1198265))

(declare-fun m!1198267 () Bool)

(assert (=> d!142523 m!1198267))

(declare-fun m!1198269 () Bool)

(assert (=> d!142523 m!1198269))

(declare-fun m!1198271 () Bool)

(assert (=> b!1306859 m!1198271))

(declare-fun m!1198273 () Bool)

(assert (=> b!1306860 m!1198273))

(assert (=> d!142445 d!142523))

(declare-fun d!142525 () Bool)

(declare-fun res!867423 () Bool)

(declare-fun e!745558 () Bool)

(assert (=> d!142525 (=> res!867423 e!745558)))

(assert (=> d!142525 (= res!867423 (and ((_ is Cons!29815) (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(assert (=> d!142525 (= (containsKey!731 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!745558)))

(declare-fun b!1306861 () Bool)

(declare-fun e!745559 () Bool)

(assert (=> b!1306861 (= e!745558 e!745559)))

(declare-fun res!867424 () Bool)

(assert (=> b!1306861 (=> (not res!867424) (not e!745559))))

(assert (=> b!1306861 (= res!867424 (and (or (not ((_ is Cons!29815) (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) (bvsle (_1!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)) ((_ is Cons!29815) (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (bvslt (_1!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(declare-fun b!1306862 () Bool)

(assert (=> b!1306862 (= e!745559 (containsKey!731 (t!43413 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(assert (= (and d!142525 (not res!867423)) b!1306861))

(assert (= (and b!1306861 res!867424) b!1306862))

(declare-fun m!1198275 () Bool)

(assert (=> b!1306862 m!1198275))

(assert (=> d!142441 d!142525))

(declare-fun d!142527 () Bool)

(declare-fun e!745561 () Bool)

(assert (=> d!142527 e!745561))

(declare-fun res!867425 () Bool)

(assert (=> d!142527 (=> res!867425 e!745561)))

(declare-fun lt!585039 () Bool)

(assert (=> d!142527 (= res!867425 (not lt!585039))))

(declare-fun lt!585038 () Bool)

(assert (=> d!142527 (= lt!585039 lt!585038)))

(declare-fun lt!585040 () Unit!43192)

(declare-fun e!745560 () Unit!43192)

(assert (=> d!142527 (= lt!585040 e!745560)))

(declare-fun c!125829 () Bool)

(assert (=> d!142527 (= c!125829 lt!585038)))

(assert (=> d!142527 (= lt!585038 (containsKey!731 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142527 (= (contains!8342 lt!584891 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!585039)))

(declare-fun b!1306863 () Bool)

(declare-fun lt!585041 () Unit!43192)

(assert (=> b!1306863 (= e!745560 lt!585041)))

(assert (=> b!1306863 (= lt!585041 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> b!1306863 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306864 () Bool)

(declare-fun Unit!43213 () Unit!43192)

(assert (=> b!1306864 (= e!745560 Unit!43213)))

(declare-fun b!1306865 () Bool)

(assert (=> b!1306865 (= e!745561 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584891) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142527 c!125829) b!1306863))

(assert (= (and d!142527 (not c!125829)) b!1306864))

(assert (= (and d!142527 (not res!867425)) b!1306865))

(declare-fun m!1198277 () Bool)

(assert (=> d!142527 m!1198277))

(declare-fun m!1198279 () Bool)

(assert (=> b!1306863 m!1198279))

(assert (=> b!1306863 m!1198009))

(assert (=> b!1306863 m!1198009))

(declare-fun m!1198281 () Bool)

(assert (=> b!1306863 m!1198281))

(assert (=> b!1306865 m!1198009))

(assert (=> b!1306865 m!1198009))

(assert (=> b!1306865 m!1198281))

(assert (=> d!142443 d!142527))

(declare-fun d!142529 () Bool)

(declare-fun c!125830 () Bool)

(assert (=> d!142529 (= c!125830 (and ((_ is Cons!29815) lt!584890) (= (_1!11349 (h!31033 lt!584890)) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!745562 () Option!756)

(assert (=> d!142529 (= (getValueByKey!705 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) e!745562)))

(declare-fun b!1306867 () Bool)

(declare-fun e!745563 () Option!756)

(assert (=> b!1306867 (= e!745562 e!745563)))

(declare-fun c!125831 () Bool)

(assert (=> b!1306867 (= c!125831 (and ((_ is Cons!29815) lt!584890) (not (= (_1!11349 (h!31033 lt!584890)) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1306869 () Bool)

(assert (=> b!1306869 (= e!745563 None!754)))

(declare-fun b!1306868 () Bool)

(assert (=> b!1306868 (= e!745563 (getValueByKey!705 (t!43413 lt!584890) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306866 () Bool)

(assert (=> b!1306866 (= e!745562 (Some!755 (_2!11349 (h!31033 lt!584890))))))

(assert (= (and d!142529 c!125830) b!1306866))

(assert (= (and d!142529 (not c!125830)) b!1306867))

(assert (= (and b!1306867 c!125831) b!1306868))

(assert (= (and b!1306867 (not c!125831)) b!1306869))

(declare-fun m!1198283 () Bool)

(assert (=> b!1306868 m!1198283))

(assert (=> d!142443 d!142529))

(declare-fun d!142531 () Bool)

(assert (=> d!142531 (= (getValueByKey!705 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!585044 () Unit!43192)

(declare-fun choose!1942 (List!29819 (_ BitVec 64) V!51697) Unit!43192)

(assert (=> d!142531 (= lt!585044 (choose!1942 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun e!745566 () Bool)

(assert (=> d!142531 e!745566))

(declare-fun res!867430 () Bool)

(assert (=> d!142531 (=> (not res!867430) (not e!745566))))

(assert (=> d!142531 (= res!867430 (isStrictlySorted!863 lt!584890))))

(assert (=> d!142531 (= (lemmaContainsTupThenGetReturnValue!356 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!585044)))

(declare-fun b!1306874 () Bool)

(declare-fun res!867431 () Bool)

(assert (=> b!1306874 (=> (not res!867431) (not e!745566))))

(assert (=> b!1306874 (= res!867431 (containsKey!731 lt!584890 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306875 () Bool)

(assert (=> b!1306875 (= e!745566 (contains!8345 lt!584890 (tuple2!22677 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142531 res!867430) b!1306874))

(assert (= (and b!1306874 res!867431) b!1306875))

(assert (=> d!142531 m!1198003))

(declare-fun m!1198285 () Bool)

(assert (=> d!142531 m!1198285))

(declare-fun m!1198287 () Bool)

(assert (=> d!142531 m!1198287))

(declare-fun m!1198289 () Bool)

(assert (=> b!1306874 m!1198289))

(declare-fun m!1198291 () Bool)

(assert (=> b!1306875 m!1198291))

(assert (=> d!142443 d!142531))

(declare-fun bm!64541 () Bool)

(declare-fun call!64545 () List!29819)

(declare-fun call!64544 () List!29819)

(assert (=> bm!64541 (= call!64545 call!64544)))

(declare-fun bm!64542 () Bool)

(declare-fun c!125842 () Bool)

(declare-fun e!745578 () List!29819)

(declare-fun $colon$colon!667 (List!29819 tuple2!22676) List!29819)

(assert (=> bm!64542 (= call!64544 ($colon$colon!667 e!745578 (ite c!125842 (h!31033 (toList!10186 lt!584721)) (tuple2!22677 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun c!125843 () Bool)

(assert (=> bm!64542 (= c!125843 c!125842)))

(declare-fun b!1306896 () Bool)

(declare-fun c!125841 () Bool)

(assert (=> b!1306896 (= c!125841 (and ((_ is Cons!29815) (toList!10186 lt!584721)) (bvsgt (_1!11349 (h!31033 (toList!10186 lt!584721))) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!745579 () List!29819)

(declare-fun e!745581 () List!29819)

(assert (=> b!1306896 (= e!745579 e!745581)))

(declare-fun bm!64543 () Bool)

(declare-fun call!64546 () List!29819)

(assert (=> bm!64543 (= call!64546 call!64545)))

(declare-fun b!1306897 () Bool)

(declare-fun e!745577 () List!29819)

(assert (=> b!1306897 (= e!745577 e!745579)))

(declare-fun c!125840 () Bool)

(assert (=> b!1306897 (= c!125840 (and ((_ is Cons!29815) (toList!10186 lt!584721)) (= (_1!11349 (h!31033 (toList!10186 lt!584721))) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun d!142533 () Bool)

(declare-fun e!745580 () Bool)

(assert (=> d!142533 e!745580))

(declare-fun res!867437 () Bool)

(assert (=> d!142533 (=> (not res!867437) (not e!745580))))

(declare-fun lt!585047 () List!29819)

(assert (=> d!142533 (= res!867437 (isStrictlySorted!863 lt!585047))))

(assert (=> d!142533 (= lt!585047 e!745577)))

(assert (=> d!142533 (= c!125842 (and ((_ is Cons!29815) (toList!10186 lt!584721)) (bvslt (_1!11349 (h!31033 (toList!10186 lt!584721))) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142533 (isStrictlySorted!863 (toList!10186 lt!584721))))

(assert (=> d!142533 (= (insertStrictlySorted!485 (toList!10186 lt!584721) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!585047)))

(declare-fun b!1306898 () Bool)

(assert (=> b!1306898 (= e!745578 (ite c!125840 (t!43413 (toList!10186 lt!584721)) (ite c!125841 (Cons!29815 (h!31033 (toList!10186 lt!584721)) (t!43413 (toList!10186 lt!584721))) Nil!29816)))))

(declare-fun b!1306899 () Bool)

(assert (=> b!1306899 (= e!745577 call!64544)))

(declare-fun b!1306900 () Bool)

(assert (=> b!1306900 (= e!745579 call!64545)))

(declare-fun b!1306901 () Bool)

(assert (=> b!1306901 (= e!745581 call!64546)))

(declare-fun b!1306902 () Bool)

(assert (=> b!1306902 (= e!745578 (insertStrictlySorted!485 (t!43413 (toList!10186 lt!584721)) (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306903 () Bool)

(declare-fun res!867436 () Bool)

(assert (=> b!1306903 (=> (not res!867436) (not e!745580))))

(assert (=> b!1306903 (= res!867436 (containsKey!731 lt!585047 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306904 () Bool)

(assert (=> b!1306904 (= e!745581 call!64546)))

(declare-fun b!1306905 () Bool)

(assert (=> b!1306905 (= e!745580 (contains!8345 lt!585047 (tuple2!22677 (_1!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11349 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (= (and d!142533 c!125842) b!1306899))

(assert (= (and d!142533 (not c!125842)) b!1306897))

(assert (= (and b!1306897 c!125840) b!1306900))

(assert (= (and b!1306897 (not c!125840)) b!1306896))

(assert (= (and b!1306896 c!125841) b!1306904))

(assert (= (and b!1306896 (not c!125841)) b!1306901))

(assert (= (or b!1306904 b!1306901) bm!64543))

(assert (= (or b!1306900 bm!64543) bm!64541))

(assert (= (or b!1306899 bm!64541) bm!64542))

(assert (= (and bm!64542 c!125843) b!1306902))

(assert (= (and bm!64542 (not c!125843)) b!1306898))

(assert (= (and d!142533 res!867437) b!1306903))

(assert (= (and b!1306903 res!867436) b!1306905))

(declare-fun m!1198293 () Bool)

(assert (=> bm!64542 m!1198293))

(declare-fun m!1198295 () Bool)

(assert (=> b!1306905 m!1198295))

(declare-fun m!1198297 () Bool)

(assert (=> b!1306903 m!1198297))

(declare-fun m!1198299 () Bool)

(assert (=> b!1306902 m!1198299))

(declare-fun m!1198301 () Bool)

(assert (=> d!142533 m!1198301))

(declare-fun m!1198303 () Bool)

(assert (=> d!142533 m!1198303))

(assert (=> d!142443 d!142533))

(declare-fun b!1306906 () Bool)

(declare-fun e!745588 () Bool)

(declare-fun lt!585050 () ListLongMap!20341)

(assert (=> b!1306906 (= e!745588 (isEmpty!1074 lt!585050))))

(declare-fun b!1306907 () Bool)

(declare-fun e!745586 () Bool)

(declare-fun e!745585 () Bool)

(assert (=> b!1306907 (= e!745586 e!745585)))

(assert (=> b!1306907 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(declare-fun res!867438 () Bool)

(assert (=> b!1306907 (= res!867438 (contains!8342 lt!585050 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1306907 (=> (not res!867438) (not e!745585))))

(declare-fun b!1306908 () Bool)

(declare-fun e!745583 () ListLongMap!20341)

(declare-fun e!745587 () ListLongMap!20341)

(assert (=> b!1306908 (= e!745583 e!745587)))

(declare-fun c!125847 () Bool)

(assert (=> b!1306908 (= c!125847 (validKeyInArray!0 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun bm!64544 () Bool)

(declare-fun call!64547 () ListLongMap!20341)

(assert (=> bm!64544 (= call!64547 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1306909 () Bool)

(assert (=> b!1306909 (= e!745588 (= lt!585050 (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1306910 () Bool)

(assert (=> b!1306910 (= e!745586 e!745588)))

(declare-fun c!125844 () Bool)

(assert (=> b!1306910 (= c!125844 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(declare-fun b!1306911 () Bool)

(assert (=> b!1306911 (= e!745583 (ListLongMap!20342 Nil!29816))))

(declare-fun d!142535 () Bool)

(declare-fun e!745582 () Bool)

(assert (=> d!142535 e!745582))

(declare-fun res!867441 () Bool)

(assert (=> d!142535 (=> (not res!867441) (not e!745582))))

(assert (=> d!142535 (= res!867441 (not (contains!8342 lt!585050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142535 (= lt!585050 e!745583)))

(declare-fun c!125845 () Bool)

(assert (=> d!142535 (= c!125845 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(assert (=> d!142535 (validMask!0 mask!2175)))

(assert (=> d!142535 (= (getCurrentListMapNoExtraKeys!6178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!585050)))

(declare-fun b!1306912 () Bool)

(assert (=> b!1306912 (= e!745587 call!64547)))

(declare-fun b!1306913 () Bool)

(declare-fun res!867439 () Bool)

(assert (=> b!1306913 (=> (not res!867439) (not e!745582))))

(assert (=> b!1306913 (= res!867439 (not (contains!8342 lt!585050 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1306914 () Bool)

(declare-fun lt!585048 () Unit!43192)

(declare-fun lt!585053 () Unit!43192)

(assert (=> b!1306914 (= lt!585048 lt!585053)))

(declare-fun lt!585049 () (_ BitVec 64))

(declare-fun lt!585054 () (_ BitVec 64))

(declare-fun lt!585052 () V!51697)

(declare-fun lt!585051 () ListLongMap!20341)

(assert (=> b!1306914 (not (contains!8342 (+!4538 lt!585051 (tuple2!22677 lt!585049 lt!585052)) lt!585054))))

(assert (=> b!1306914 (= lt!585053 (addStillNotContains!489 lt!585051 lt!585049 lt!585052 lt!585054))))

(assert (=> b!1306914 (= lt!585054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1306914 (= lt!585052 (get!21239 (select (arr!41959 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1306914 (= lt!585049 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1306914 (= lt!585051 call!64547)))

(assert (=> b!1306914 (= e!745587 (+!4538 call!64547 (tuple2!22677 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21239 (select (arr!41959 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1306915 () Bool)

(declare-fun e!745584 () Bool)

(assert (=> b!1306915 (= e!745584 (validKeyInArray!0 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1306915 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1306916 () Bool)

(assert (=> b!1306916 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(assert (=> b!1306916 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42510 _values!1445)))))

(assert (=> b!1306916 (= e!745585 (= (apply!1035 lt!585050 (select (arr!41958 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21239 (select (arr!41959 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3496 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1306917 () Bool)

(assert (=> b!1306917 (= e!745582 e!745586)))

(declare-fun c!125846 () Bool)

(assert (=> b!1306917 (= c!125846 e!745584)))

(declare-fun res!867440 () Bool)

(assert (=> b!1306917 (=> (not res!867440) (not e!745584))))

(assert (=> b!1306917 (= res!867440 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(assert (= (and d!142535 c!125845) b!1306911))

(assert (= (and d!142535 (not c!125845)) b!1306908))

(assert (= (and b!1306908 c!125847) b!1306914))

(assert (= (and b!1306908 (not c!125847)) b!1306912))

(assert (= (or b!1306914 b!1306912) bm!64544))

(assert (= (and d!142535 res!867441) b!1306913))

(assert (= (and b!1306913 res!867439) b!1306917))

(assert (= (and b!1306917 res!867440) b!1306915))

(assert (= (and b!1306917 c!125846) b!1306907))

(assert (= (and b!1306917 (not c!125846)) b!1306910))

(assert (= (and b!1306907 res!867438) b!1306916))

(assert (= (and b!1306910 c!125844) b!1306909))

(assert (= (and b!1306910 (not c!125844)) b!1306906))

(declare-fun b_lambda!23345 () Bool)

(assert (=> (not b_lambda!23345) (not b!1306914)))

(assert (=> b!1306914 t!43419))

(declare-fun b_and!47515 () Bool)

(assert (= b_and!47513 (and (=> t!43419 result!23835) b_and!47515)))

(declare-fun b_lambda!23347 () Bool)

(assert (=> (not b_lambda!23347) (not b!1306916)))

(assert (=> b!1306916 t!43419))

(declare-fun b_and!47517 () Bool)

(assert (= b_and!47515 (and (=> t!43419 result!23835) b_and!47517)))

(declare-fun m!1198305 () Bool)

(assert (=> b!1306916 m!1198305))

(assert (=> b!1306916 m!1197965))

(declare-fun m!1198307 () Bool)

(assert (=> b!1306916 m!1198307))

(declare-fun m!1198309 () Bool)

(assert (=> b!1306916 m!1198309))

(declare-fun m!1198311 () Bool)

(assert (=> b!1306916 m!1198311))

(assert (=> b!1306916 m!1198305))

(assert (=> b!1306916 m!1198309))

(assert (=> b!1306916 m!1197965))

(declare-fun m!1198313 () Bool)

(assert (=> b!1306909 m!1198313))

(declare-fun m!1198315 () Bool)

(assert (=> b!1306914 m!1198315))

(assert (=> b!1306914 m!1198305))

(assert (=> b!1306914 m!1197965))

(assert (=> b!1306914 m!1198307))

(declare-fun m!1198317 () Bool)

(assert (=> b!1306914 m!1198317))

(declare-fun m!1198319 () Bool)

(assert (=> b!1306914 m!1198319))

(assert (=> b!1306914 m!1198305))

(assert (=> b!1306914 m!1198309))

(assert (=> b!1306914 m!1198317))

(declare-fun m!1198321 () Bool)

(assert (=> b!1306914 m!1198321))

(assert (=> b!1306914 m!1197965))

(assert (=> b!1306907 m!1198309))

(assert (=> b!1306907 m!1198309))

(declare-fun m!1198323 () Bool)

(assert (=> b!1306907 m!1198323))

(assert (=> bm!64544 m!1198313))

(assert (=> b!1306908 m!1198309))

(assert (=> b!1306908 m!1198309))

(declare-fun m!1198325 () Bool)

(assert (=> b!1306908 m!1198325))

(assert (=> b!1306915 m!1198309))

(assert (=> b!1306915 m!1198309))

(assert (=> b!1306915 m!1198325))

(declare-fun m!1198327 () Bool)

(assert (=> b!1306906 m!1198327))

(declare-fun m!1198329 () Bool)

(assert (=> b!1306913 m!1198329))

(declare-fun m!1198331 () Bool)

(assert (=> d!142535 m!1198331))

(assert (=> d!142535 m!1197827))

(assert (=> bm!64511 d!142535))

(declare-fun d!142537 () Bool)

(assert (=> d!142537 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun lt!585055 () Unit!43192)

(assert (=> d!142537 (= lt!585055 (choose!1941 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun e!745589 () Bool)

(assert (=> d!142537 e!745589))

(declare-fun res!867442 () Bool)

(assert (=> d!142537 (=> (not res!867442) (not e!745589))))

(assert (=> d!142537 (= res!867442 (isStrictlySorted!863 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142537 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) lt!585055)))

(declare-fun b!1306918 () Bool)

(assert (=> b!1306918 (= e!745589 (containsKey!731 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (= (and d!142537 res!867442) b!1306918))

(assert (=> d!142537 m!1197997))

(assert (=> d!142537 m!1197997))

(assert (=> d!142537 m!1197999))

(declare-fun m!1198333 () Bool)

(assert (=> d!142537 m!1198333))

(declare-fun m!1198335 () Bool)

(assert (=> d!142537 m!1198335))

(assert (=> b!1306918 m!1197993))

(assert (=> b!1306686 d!142537))

(declare-fun d!142539 () Bool)

(assert (=> d!142539 (= (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)) (not (isEmpty!1075 (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))))

(declare-fun bs!37204 () Bool)

(assert (= bs!37204 d!142539))

(assert (=> bs!37204 m!1197997))

(declare-fun m!1198337 () Bool)

(assert (=> bs!37204 m!1198337))

(assert (=> b!1306686 d!142539))

(declare-fun d!142541 () Bool)

(declare-fun c!125848 () Bool)

(assert (=> d!142541 (= c!125848 (and ((_ is Cons!29815) (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (= (_1!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205)))))

(declare-fun e!745590 () Option!756)

(assert (=> d!142541 (= (getValueByKey!705 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205) e!745590)))

(declare-fun b!1306920 () Bool)

(declare-fun e!745591 () Option!756)

(assert (=> b!1306920 (= e!745590 e!745591)))

(declare-fun c!125849 () Bool)

(assert (=> b!1306920 (= c!125849 (and ((_ is Cons!29815) (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (not (= (_1!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))) k0!1205))))))

(declare-fun b!1306922 () Bool)

(assert (=> b!1306922 (= e!745591 None!754)))

(declare-fun b!1306921 () Bool)

(assert (=> b!1306921 (= e!745591 (getValueByKey!705 (t!43413 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) k0!1205))))

(declare-fun b!1306919 () Bool)

(assert (=> b!1306919 (= e!745590 (Some!755 (_2!11349 (h!31033 (toList!10186 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(assert (= (and d!142541 c!125848) b!1306919))

(assert (= (and d!142541 (not c!125848)) b!1306920))

(assert (= (and b!1306920 c!125849) b!1306921))

(assert (= (and b!1306920 (not c!125849)) b!1306922))

(declare-fun m!1198339 () Bool)

(assert (=> b!1306921 m!1198339))

(assert (=> b!1306686 d!142541))

(declare-fun d!142543 () Bool)

(assert (=> d!142543 (= (apply!1035 lt!584976 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21240 (getValueByKey!705 (toList!10186 lt!584976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37205 () Bool)

(assert (= bs!37205 d!142543))

(assert (=> bs!37205 m!1198197))

(assert (=> bs!37205 m!1198197))

(declare-fun m!1198341 () Bool)

(assert (=> bs!37205 m!1198341))

(assert (=> b!1306750 d!142543))

(declare-fun d!142545 () Bool)

(declare-fun lt!585056 () Bool)

(assert (=> d!142545 (= lt!585056 (select (content!648 (toList!10186 lt!584891)) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun e!745593 () Bool)

(assert (=> d!142545 (= lt!585056 e!745593)))

(declare-fun res!867443 () Bool)

(assert (=> d!142545 (=> (not res!867443) (not e!745593))))

(assert (=> d!142545 (= res!867443 ((_ is Cons!29815) (toList!10186 lt!584891)))))

(assert (=> d!142545 (= (contains!8345 (toList!10186 lt!584891) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!585056)))

(declare-fun b!1306923 () Bool)

(declare-fun e!745592 () Bool)

(assert (=> b!1306923 (= e!745593 e!745592)))

(declare-fun res!867444 () Bool)

(assert (=> b!1306923 (=> res!867444 e!745592)))

(assert (=> b!1306923 (= res!867444 (= (h!31033 (toList!10186 lt!584891)) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1306924 () Bool)

(assert (=> b!1306924 (= e!745592 (contains!8345 (t!43413 (toList!10186 lt!584891)) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142545 res!867443) b!1306923))

(assert (= (and b!1306923 (not res!867444)) b!1306924))

(declare-fun m!1198343 () Bool)

(assert (=> d!142545 m!1198343))

(declare-fun m!1198345 () Bool)

(assert (=> d!142545 m!1198345))

(declare-fun m!1198347 () Bool)

(assert (=> b!1306924 m!1198347))

(assert (=> b!1306690 d!142545))

(declare-fun d!142547 () Bool)

(assert (=> d!142547 (= (apply!1035 lt!584976 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21240 (getValueByKey!705 (toList!10186 lt!584976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37206 () Bool)

(assert (= bs!37206 d!142547))

(declare-fun m!1198349 () Bool)

(assert (=> bs!37206 m!1198349))

(assert (=> bs!37206 m!1198349))

(declare-fun m!1198351 () Bool)

(assert (=> bs!37206 m!1198351))

(assert (=> b!1306749 d!142547))

(assert (=> b!1306677 d!142437))

(assert (=> d!142455 d!142457))

(declare-fun d!142549 () Bool)

(assert (=> d!142549 (contains!8342 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) k0!1205)))

(assert (=> d!142549 true))

(declare-fun _$21!125 () Unit!43192)

(assert (=> d!142549 (= (choose!1940 k0!1205 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)) (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) _$21!125)))

(declare-fun bs!37207 () Bool)

(assert (= bs!37207 d!142549))

(assert (=> bs!37207 m!1197793))

(assert (=> d!142455 d!142549))

(declare-fun d!142551 () Bool)

(declare-fun e!745595 () Bool)

(assert (=> d!142551 e!745595))

(declare-fun res!867445 () Bool)

(assert (=> d!142551 (=> res!867445 e!745595)))

(declare-fun lt!585058 () Bool)

(assert (=> d!142551 (= res!867445 (not lt!585058))))

(declare-fun lt!585057 () Bool)

(assert (=> d!142551 (= lt!585058 lt!585057)))

(declare-fun lt!585059 () Unit!43192)

(declare-fun e!745594 () Unit!43192)

(assert (=> d!142551 (= lt!585059 e!745594)))

(declare-fun c!125850 () Bool)

(assert (=> d!142551 (= c!125850 lt!585057)))

(assert (=> d!142551 (= lt!585057 (containsKey!731 (toList!10186 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!142551 (= (contains!8342 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))) k0!1205) lt!585058)))

(declare-fun b!1306925 () Bool)

(declare-fun lt!585060 () Unit!43192)

(assert (=> b!1306925 (= e!745594 lt!585060)))

(assert (=> b!1306925 (= lt!585060 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1306925 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1306926 () Bool)

(declare-fun Unit!43214 () Unit!43192)

(assert (=> b!1306926 (= e!745594 Unit!43214)))

(declare-fun b!1306927 () Bool)

(assert (=> b!1306927 (= e!745595 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!142551 c!125850) b!1306925))

(assert (= (and d!142551 (not c!125850)) b!1306926))

(assert (= (and d!142551 (not res!867445)) b!1306927))

(declare-fun m!1198353 () Bool)

(assert (=> d!142551 m!1198353))

(declare-fun m!1198355 () Bool)

(assert (=> b!1306925 m!1198355))

(declare-fun m!1198357 () Bool)

(assert (=> b!1306925 m!1198357))

(assert (=> b!1306925 m!1198357))

(declare-fun m!1198359 () Bool)

(assert (=> b!1306925 m!1198359))

(assert (=> b!1306927 m!1198357))

(assert (=> b!1306927 m!1198357))

(assert (=> b!1306927 m!1198359))

(assert (=> d!142455 d!142551))

(declare-fun d!142553 () Bool)

(declare-fun e!745596 () Bool)

(assert (=> d!142553 e!745596))

(declare-fun res!867446 () Bool)

(assert (=> d!142553 (=> (not res!867446) (not e!745596))))

(declare-fun lt!585062 () ListLongMap!20341)

(assert (=> d!142553 (= res!867446 (contains!8342 lt!585062 (_1!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!585061 () List!29819)

(assert (=> d!142553 (= lt!585062 (ListLongMap!20342 lt!585061))))

(declare-fun lt!585063 () Unit!43192)

(declare-fun lt!585064 () Unit!43192)

(assert (=> d!142553 (= lt!585063 lt!585064)))

(assert (=> d!142553 (= (getValueByKey!705 lt!585061 (_1!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) (Some!755 (_2!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142553 (= lt!585064 (lemmaContainsTupThenGetReturnValue!356 lt!585061 (_1!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))) (_2!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142553 (= lt!585061 (insertStrictlySorted!485 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) (_1!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))) (_2!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))))))

(assert (=> d!142553 (= (+!4538 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))) lt!585062)))

(declare-fun b!1306928 () Bool)

(declare-fun res!867447 () Bool)

(assert (=> b!1306928 (=> (not res!867447) (not e!745596))))

(assert (=> b!1306928 (= res!867447 (= (getValueByKey!705 (toList!10186 lt!585062) (_1!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387))))) (Some!755 (_2!11349 (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1306929 () Bool)

(assert (=> b!1306929 (= e!745596 (contains!8345 (toList!10186 lt!585062) (tuple2!22677 (ite c!125746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125747 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125746 minValue!1387 (ite c!125747 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!142553 res!867446) b!1306928))

(assert (= (and b!1306928 res!867447) b!1306929))

(declare-fun m!1198361 () Bool)

(assert (=> d!142553 m!1198361))

(declare-fun m!1198363 () Bool)

(assert (=> d!142553 m!1198363))

(declare-fun m!1198365 () Bool)

(assert (=> d!142553 m!1198365))

(declare-fun m!1198367 () Bool)

(assert (=> d!142553 m!1198367))

(declare-fun m!1198369 () Bool)

(assert (=> b!1306928 m!1198369))

(declare-fun m!1198371 () Bool)

(assert (=> b!1306929 m!1198371))

(assert (=> d!142455 d!142553))

(declare-fun d!142555 () Bool)

(assert (=> d!142555 (= (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205)) (not (isEmpty!1075 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))))

(declare-fun bs!37208 () Bool)

(assert (= bs!37208 d!142555))

(assert (=> bs!37208 m!1198037))

(declare-fun m!1198373 () Bool)

(assert (=> bs!37208 m!1198373))

(assert (=> b!1306694 d!142555))

(declare-fun c!125851 () Bool)

(declare-fun d!142557 () Bool)

(assert (=> d!142557 (= c!125851 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) k0!1205)))))

(declare-fun e!745597 () Option!756)

(assert (=> d!142557 (= (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205) e!745597)))

(declare-fun b!1306931 () Bool)

(declare-fun e!745598 () Option!756)

(assert (=> b!1306931 (= e!745597 e!745598)))

(declare-fun c!125852 () Bool)

(assert (=> b!1306931 (= c!125852 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) (not (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))))) k0!1205))))))

(declare-fun b!1306933 () Bool)

(assert (=> b!1306933 (= e!745598 None!754)))

(declare-fun b!1306932 () Bool)

(assert (=> b!1306932 (= e!745598 (getValueByKey!705 (t!43413 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))) k0!1205))))

(declare-fun b!1306930 () Bool)

(assert (=> b!1306930 (= e!745597 (Some!755 (_2!11349 (h!31033 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))))))))

(assert (= (and d!142557 c!125851) b!1306930))

(assert (= (and d!142557 (not c!125851)) b!1306931))

(assert (= (and b!1306931 c!125852) b!1306932))

(assert (= (and b!1306931 (not c!125852)) b!1306933))

(declare-fun m!1198375 () Bool)

(assert (=> b!1306932 m!1198375))

(assert (=> b!1306694 d!142557))

(declare-fun d!142559 () Bool)

(assert (=> d!142559 (arrayContainsKey!0 _keys!1741 lt!584849 #b00000000000000000000000000000000)))

(declare-fun lt!585067 () Unit!43192)

(declare-fun choose!13 (array!86951 (_ BitVec 64) (_ BitVec 32)) Unit!43192)

(assert (=> d!142559 (= lt!585067 (choose!13 _keys!1741 lt!584849 #b00000000000000000000000000000000))))

(assert (=> d!142559 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142559 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584849 #b00000000000000000000000000000000) lt!585067)))

(declare-fun bs!37209 () Bool)

(assert (= bs!37209 d!142559))

(assert (=> bs!37209 m!1197947))

(declare-fun m!1198377 () Bool)

(assert (=> bs!37209 m!1198377))

(assert (=> b!1306637 d!142559))

(declare-fun d!142561 () Bool)

(declare-fun res!867452 () Bool)

(declare-fun e!745603 () Bool)

(assert (=> d!142561 (=> res!867452 e!745603)))

(assert (=> d!142561 (= res!867452 (= (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) lt!584849))))

(assert (=> d!142561 (= (arrayContainsKey!0 _keys!1741 lt!584849 #b00000000000000000000000000000000) e!745603)))

(declare-fun b!1306938 () Bool)

(declare-fun e!745604 () Bool)

(assert (=> b!1306938 (= e!745603 e!745604)))

(declare-fun res!867453 () Bool)

(assert (=> b!1306938 (=> (not res!867453) (not e!745604))))

(assert (=> b!1306938 (= res!867453 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42509 _keys!1741)))))

(declare-fun b!1306939 () Bool)

(assert (=> b!1306939 (= e!745604 (arrayContainsKey!0 _keys!1741 lt!584849 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142561 (not res!867452)) b!1306938))

(assert (= (and b!1306938 res!867453) b!1306939))

(assert (=> d!142561 m!1197925))

(declare-fun m!1198379 () Bool)

(assert (=> b!1306939 m!1198379))

(assert (=> b!1306637 d!142561))

(declare-fun b!1306952 () Bool)

(declare-fun c!125859 () Bool)

(declare-fun lt!585076 () (_ BitVec 64))

(assert (=> b!1306952 (= c!125859 (= lt!585076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!745611 () SeekEntryResult!9985)

(declare-fun e!745613 () SeekEntryResult!9985)

(assert (=> b!1306952 (= e!745611 e!745613)))

(declare-fun b!1306953 () Bool)

(declare-fun lt!585075 () SeekEntryResult!9985)

(assert (=> b!1306953 (= e!745613 (MissingZero!9985 (index!42313 lt!585075)))))

(declare-fun b!1306954 () Bool)

(declare-fun e!745612 () SeekEntryResult!9985)

(assert (=> b!1306954 (= e!745612 e!745611)))

(assert (=> b!1306954 (= lt!585076 (select (arr!41958 _keys!1741) (index!42313 lt!585075)))))

(declare-fun c!125860 () Bool)

(assert (=> b!1306954 (= c!125860 (= lt!585076 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306955 () Bool)

(assert (=> b!1306955 (= e!745611 (Found!9985 (index!42313 lt!585075)))))

(declare-fun b!1306956 () Bool)

(assert (=> b!1306956 (= e!745612 Undefined!9985)))

(declare-fun b!1306957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86951 (_ BitVec 32)) SeekEntryResult!9985)

(assert (=> b!1306957 (= e!745613 (seekKeyOrZeroReturnVacant!0 (x!115908 lt!585075) (index!42313 lt!585075) (index!42313 lt!585075) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun d!142563 () Bool)

(declare-fun lt!585074 () SeekEntryResult!9985)

(assert (=> d!142563 (and (or ((_ is Undefined!9985) lt!585074) (not ((_ is Found!9985) lt!585074)) (and (bvsge (index!42312 lt!585074) #b00000000000000000000000000000000) (bvslt (index!42312 lt!585074) (size!42509 _keys!1741)))) (or ((_ is Undefined!9985) lt!585074) ((_ is Found!9985) lt!585074) (not ((_ is MissingZero!9985) lt!585074)) (and (bvsge (index!42311 lt!585074) #b00000000000000000000000000000000) (bvslt (index!42311 lt!585074) (size!42509 _keys!1741)))) (or ((_ is Undefined!9985) lt!585074) ((_ is Found!9985) lt!585074) ((_ is MissingZero!9985) lt!585074) (not ((_ is MissingVacant!9985) lt!585074)) (and (bvsge (index!42314 lt!585074) #b00000000000000000000000000000000) (bvslt (index!42314 lt!585074) (size!42509 _keys!1741)))) (or ((_ is Undefined!9985) lt!585074) (ite ((_ is Found!9985) lt!585074) (= (select (arr!41958 _keys!1741) (index!42312 lt!585074)) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9985) lt!585074) (= (select (arr!41958 _keys!1741) (index!42311 lt!585074)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9985) lt!585074) (= (select (arr!41958 _keys!1741) (index!42314 lt!585074)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142563 (= lt!585074 e!745612)))

(declare-fun c!125861 () Bool)

(assert (=> d!142563 (= c!125861 (and ((_ is Intermediate!9985) lt!585075) (undefined!10797 lt!585075)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86951 (_ BitVec 32)) SeekEntryResult!9985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142563 (= lt!585075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!142563 (validMask!0 mask!2175)))

(assert (=> d!142563 (= (seekEntryOrOpen!0 (select (arr!41958 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!585074)))

(assert (= (and d!142563 c!125861) b!1306956))

(assert (= (and d!142563 (not c!125861)) b!1306954))

(assert (= (and b!1306954 c!125860) b!1306955))

(assert (= (and b!1306954 (not c!125860)) b!1306952))

(assert (= (and b!1306952 c!125859) b!1306953))

(assert (= (and b!1306952 (not c!125859)) b!1306957))

(declare-fun m!1198381 () Bool)

(assert (=> b!1306954 m!1198381))

(assert (=> b!1306957 m!1197925))

(declare-fun m!1198383 () Bool)

(assert (=> b!1306957 m!1198383))

(declare-fun m!1198385 () Bool)

(assert (=> d!142563 m!1198385))

(assert (=> d!142563 m!1197925))

(declare-fun m!1198387 () Bool)

(assert (=> d!142563 m!1198387))

(declare-fun m!1198389 () Bool)

(assert (=> d!142563 m!1198389))

(declare-fun m!1198391 () Bool)

(assert (=> d!142563 m!1198391))

(assert (=> d!142563 m!1197827))

(declare-fun m!1198393 () Bool)

(assert (=> d!142563 m!1198393))

(assert (=> d!142563 m!1197925))

(assert (=> d!142563 m!1198385))

(assert (=> b!1306637 d!142563))

(declare-fun d!142565 () Bool)

(assert (=> d!142565 (= (isDefined!514 (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1075 (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37210 () Bool)

(assert (= bs!37210 d!142565))

(assert (=> bs!37210 m!1198053))

(declare-fun m!1198395 () Bool)

(assert (=> bs!37210 m!1198395))

(assert (=> b!1306700 d!142565))

(declare-fun d!142567 () Bool)

(declare-fun c!125862 () Bool)

(assert (=> d!142567 (= c!125862 (and ((_ is Cons!29815) (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!745614 () Option!756)

(assert (=> d!142567 (= (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745614)))

(declare-fun b!1306959 () Bool)

(declare-fun e!745615 () Option!756)

(assert (=> b!1306959 (= e!745614 e!745615)))

(declare-fun c!125863 () Bool)

(assert (=> b!1306959 (= c!125863 (and ((_ is Cons!29815) (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1306961 () Bool)

(assert (=> b!1306961 (= e!745615 None!754)))

(declare-fun b!1306960 () Bool)

(assert (=> b!1306960 (= e!745615 (getValueByKey!705 (t!43413 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1306958 () Bool)

(assert (=> b!1306958 (= e!745614 (Some!755 (_2!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!142567 c!125862) b!1306958))

(assert (= (and d!142567 (not c!125862)) b!1306959))

(assert (= (and b!1306959 c!125863) b!1306960))

(assert (= (and b!1306959 (not c!125863)) b!1306961))

(declare-fun m!1198397 () Bool)

(assert (=> b!1306960 m!1198397))

(assert (=> b!1306700 d!142567))

(declare-fun d!142569 () Bool)

(declare-fun e!745616 () Bool)

(assert (=> d!142569 e!745616))

(declare-fun res!867454 () Bool)

(assert (=> d!142569 (=> (not res!867454) (not e!745616))))

(declare-fun lt!585078 () ListLongMap!20341)

(assert (=> d!142569 (= res!867454 (contains!8342 lt!585078 (_1!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!585077 () List!29819)

(assert (=> d!142569 (= lt!585078 (ListLongMap!20342 lt!585077))))

(declare-fun lt!585079 () Unit!43192)

(declare-fun lt!585080 () Unit!43192)

(assert (=> d!142569 (= lt!585079 lt!585080)))

(assert (=> d!142569 (= (getValueByKey!705 lt!585077 (_1!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142569 (= lt!585080 (lemmaContainsTupThenGetReturnValue!356 lt!585077 (_1!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142569 (= lt!585077 (insertStrictlySorted!485 (toList!10186 (ite c!125804 call!64530 (ite c!125807 call!64532 call!64535))) (_1!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142569 (= (+!4538 (ite c!125804 call!64530 (ite c!125807 call!64532 call!64535)) (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!585078)))

(declare-fun b!1306962 () Bool)

(declare-fun res!867455 () Bool)

(assert (=> b!1306962 (=> (not res!867455) (not e!745616))))

(assert (=> b!1306962 (= res!867455 (= (getValueByKey!705 (toList!10186 lt!585078) (_1!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11349 (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1306963 () Bool)

(assert (=> b!1306963 (= e!745616 (contains!8345 (toList!10186 lt!585078) (ite (or c!125804 c!125807) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142569 res!867454) b!1306962))

(assert (= (and b!1306962 res!867455) b!1306963))

(declare-fun m!1198399 () Bool)

(assert (=> d!142569 m!1198399))

(declare-fun m!1198401 () Bool)

(assert (=> d!142569 m!1198401))

(declare-fun m!1198403 () Bool)

(assert (=> d!142569 m!1198403))

(declare-fun m!1198405 () Bool)

(assert (=> d!142569 m!1198405))

(declare-fun m!1198407 () Bool)

(assert (=> b!1306962 m!1198407))

(declare-fun m!1198409 () Bool)

(assert (=> b!1306963 m!1198409))

(assert (=> bm!64529 d!142569))

(declare-fun d!142571 () Bool)

(assert (=> d!142571 (= (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205)) (not (isEmpty!1075 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))))

(declare-fun bs!37211 () Bool)

(assert (= bs!37211 d!142571))

(assert (=> bs!37211 m!1198045))

(declare-fun m!1198411 () Bool)

(assert (=> bs!37211 m!1198411))

(assert (=> b!1306697 d!142571))

(declare-fun c!125864 () Bool)

(declare-fun d!142573 () Bool)

(assert (=> d!142573 (= c!125864 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 call!64424))) (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424)))) k0!1205)))))

(declare-fun e!745617 () Option!756)

(assert (=> d!142573 (= (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205) e!745617)))

(declare-fun b!1306965 () Bool)

(declare-fun e!745618 () Option!756)

(assert (=> b!1306965 (= e!745617 e!745618)))

(declare-fun c!125865 () Bool)

(assert (=> b!1306965 (= c!125865 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 call!64424))) (not (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424)))) k0!1205))))))

(declare-fun b!1306967 () Bool)

(assert (=> b!1306967 (= e!745618 None!754)))

(declare-fun b!1306966 () Bool)

(assert (=> b!1306966 (= e!745618 (getValueByKey!705 (t!43413 (toList!10186 (ite c!125746 lt!584721 call!64424))) k0!1205))))

(declare-fun b!1306964 () Bool)

(assert (=> b!1306964 (= e!745617 (Some!755 (_2!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 call!64424))))))))

(assert (= (and d!142573 c!125864) b!1306964))

(assert (= (and d!142573 (not c!125864)) b!1306965))

(assert (= (and b!1306965 c!125865) b!1306966))

(assert (= (and b!1306965 (not c!125865)) b!1306967))

(declare-fun m!1198413 () Bool)

(assert (=> b!1306966 m!1198413))

(assert (=> b!1306697 d!142573))

(declare-fun d!142575 () Bool)

(declare-fun e!745620 () Bool)

(assert (=> d!142575 e!745620))

(declare-fun res!867456 () Bool)

(assert (=> d!142575 (=> res!867456 e!745620)))

(declare-fun lt!585082 () Bool)

(assert (=> d!142575 (= res!867456 (not lt!585082))))

(declare-fun lt!585081 () Bool)

(assert (=> d!142575 (= lt!585082 lt!585081)))

(declare-fun lt!585083 () Unit!43192)

(declare-fun e!745619 () Unit!43192)

(assert (=> d!142575 (= lt!585083 e!745619)))

(declare-fun c!125866 () Bool)

(assert (=> d!142575 (= c!125866 lt!585081)))

(assert (=> d!142575 (= lt!585081 (containsKey!731 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142575 (= (contains!8342 lt!584859 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!585082)))

(declare-fun b!1306968 () Bool)

(declare-fun lt!585084 () Unit!43192)

(assert (=> b!1306968 (= e!745619 lt!585084)))

(assert (=> b!1306968 (= lt!585084 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> b!1306968 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306969 () Bool)

(declare-fun Unit!43215 () Unit!43192)

(assert (=> b!1306969 (= e!745619 Unit!43215)))

(declare-fun b!1306970 () Bool)

(assert (=> b!1306970 (= e!745620 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142575 c!125866) b!1306968))

(assert (= (and d!142575 (not c!125866)) b!1306969))

(assert (= (and d!142575 (not res!867456)) b!1306970))

(declare-fun m!1198415 () Bool)

(assert (=> d!142575 m!1198415))

(declare-fun m!1198417 () Bool)

(assert (=> b!1306968 m!1198417))

(assert (=> b!1306968 m!1197959))

(assert (=> b!1306968 m!1197959))

(declare-fun m!1198419 () Bool)

(assert (=> b!1306968 m!1198419))

(assert (=> b!1306970 m!1197959))

(assert (=> b!1306970 m!1197959))

(assert (=> b!1306970 m!1198419))

(assert (=> d!142433 d!142575))

(declare-fun d!142577 () Bool)

(declare-fun c!125867 () Bool)

(assert (=> d!142577 (= c!125867 (and ((_ is Cons!29815) lt!584858) (= (_1!11349 (h!31033 lt!584858)) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun e!745621 () Option!756)

(assert (=> d!142577 (= (getValueByKey!705 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!745621)))

(declare-fun b!1306972 () Bool)

(declare-fun e!745622 () Option!756)

(assert (=> b!1306972 (= e!745621 e!745622)))

(declare-fun c!125868 () Bool)

(assert (=> b!1306972 (= c!125868 (and ((_ is Cons!29815) lt!584858) (not (= (_1!11349 (h!31033 lt!584858)) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1306974 () Bool)

(assert (=> b!1306974 (= e!745622 None!754)))

(declare-fun b!1306973 () Bool)

(assert (=> b!1306973 (= e!745622 (getValueByKey!705 (t!43413 lt!584858) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306971 () Bool)

(assert (=> b!1306971 (= e!745621 (Some!755 (_2!11349 (h!31033 lt!584858))))))

(assert (= (and d!142577 c!125867) b!1306971))

(assert (= (and d!142577 (not c!125867)) b!1306972))

(assert (= (and b!1306972 c!125868) b!1306973))

(assert (= (and b!1306972 (not c!125868)) b!1306974))

(declare-fun m!1198421 () Bool)

(assert (=> b!1306973 m!1198421))

(assert (=> d!142433 d!142577))

(declare-fun d!142579 () Bool)

(assert (=> d!142579 (= (getValueByKey!705 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!585085 () Unit!43192)

(assert (=> d!142579 (= lt!585085 (choose!1942 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun e!745623 () Bool)

(assert (=> d!142579 e!745623))

(declare-fun res!867457 () Bool)

(assert (=> d!142579 (=> (not res!867457) (not e!745623))))

(assert (=> d!142579 (= res!867457 (isStrictlySorted!863 lt!584858))))

(assert (=> d!142579 (= (lemmaContainsTupThenGetReturnValue!356 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!585085)))

(declare-fun b!1306975 () Bool)

(declare-fun res!867458 () Bool)

(assert (=> b!1306975 (=> (not res!867458) (not e!745623))))

(assert (=> b!1306975 (= res!867458 (containsKey!731 lt!584858 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306976 () Bool)

(assert (=> b!1306976 (= e!745623 (contains!8345 lt!584858 (tuple2!22677 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142579 res!867457) b!1306975))

(assert (= (and b!1306975 res!867458) b!1306976))

(assert (=> d!142579 m!1197953))

(declare-fun m!1198423 () Bool)

(assert (=> d!142579 m!1198423))

(declare-fun m!1198425 () Bool)

(assert (=> d!142579 m!1198425))

(declare-fun m!1198427 () Bool)

(assert (=> b!1306975 m!1198427))

(declare-fun m!1198429 () Bool)

(assert (=> b!1306976 m!1198429))

(assert (=> d!142433 d!142579))

(declare-fun bm!64545 () Bool)

(declare-fun call!64549 () List!29819)

(declare-fun call!64548 () List!29819)

(assert (=> bm!64545 (= call!64549 call!64548)))

(declare-fun bm!64546 () Bool)

(declare-fun e!745625 () List!29819)

(declare-fun c!125871 () Bool)

(assert (=> bm!64546 (= call!64548 ($colon$colon!667 e!745625 (ite c!125871 (h!31033 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (tuple2!22677 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun c!125872 () Bool)

(assert (=> bm!64546 (= c!125872 c!125871)))

(declare-fun c!125870 () Bool)

(declare-fun b!1306977 () Bool)

(assert (=> b!1306977 (= c!125870 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (bvsgt (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun e!745626 () List!29819)

(declare-fun e!745628 () List!29819)

(assert (=> b!1306977 (= e!745626 e!745628)))

(declare-fun bm!64547 () Bool)

(declare-fun call!64550 () List!29819)

(assert (=> bm!64547 (= call!64550 call!64549)))

(declare-fun b!1306978 () Bool)

(declare-fun e!745624 () List!29819)

(assert (=> b!1306978 (= e!745624 e!745626)))

(declare-fun c!125869 () Bool)

(assert (=> b!1306978 (= c!125869 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (= (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun d!142581 () Bool)

(declare-fun e!745627 () Bool)

(assert (=> d!142581 e!745627))

(declare-fun res!867460 () Bool)

(assert (=> d!142581 (=> (not res!867460) (not e!745627))))

(declare-fun lt!585086 () List!29819)

(assert (=> d!142581 (= res!867460 (isStrictlySorted!863 lt!585086))))

(assert (=> d!142581 (= lt!585086 e!745624)))

(assert (=> d!142581 (= c!125871 (and ((_ is Cons!29815) (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (bvslt (_1!11349 (h!31033 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (=> d!142581 (isStrictlySorted!863 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))))))

(assert (=> d!142581 (= (insertStrictlySorted!485 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) lt!585086)))

(declare-fun b!1306979 () Bool)

(assert (=> b!1306979 (= e!745625 (ite c!125869 (t!43413 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (ite c!125870 (Cons!29815 (h!31033 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (t!43413 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714))))) Nil!29816)))))

(declare-fun b!1306980 () Bool)

(assert (=> b!1306980 (= e!745624 call!64548)))

(declare-fun b!1306981 () Bool)

(assert (=> b!1306981 (= e!745626 call!64549)))

(declare-fun b!1306982 () Bool)

(assert (=> b!1306982 (= e!745628 call!64550)))

(declare-fun b!1306983 () Bool)

(assert (=> b!1306983 (= e!745625 (insertStrictlySorted!485 (t!43413 (toList!10186 (ite c!125746 lt!584721 (ite c!125747 lt!584718 lt!584714)))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306984 () Bool)

(declare-fun res!867459 () Bool)

(assert (=> b!1306984 (=> (not res!867459) (not e!745627))))

(assert (=> b!1306984 (= res!867459 (containsKey!731 lt!585086 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1306985 () Bool)

(assert (=> b!1306985 (= e!745628 call!64550)))

(declare-fun b!1306986 () Bool)

(assert (=> b!1306986 (= e!745627 (contains!8345 lt!585086 (tuple2!22677 (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(assert (= (and d!142581 c!125871) b!1306980))

(assert (= (and d!142581 (not c!125871)) b!1306978))

(assert (= (and b!1306978 c!125869) b!1306981))

(assert (= (and b!1306978 (not c!125869)) b!1306977))

(assert (= (and b!1306977 c!125870) b!1306985))

(assert (= (and b!1306977 (not c!125870)) b!1306982))

(assert (= (or b!1306985 b!1306982) bm!64547))

(assert (= (or b!1306981 bm!64547) bm!64545))

(assert (= (or b!1306980 bm!64545) bm!64546))

(assert (= (and bm!64546 c!125872) b!1306983))

(assert (= (and bm!64546 (not c!125872)) b!1306979))

(assert (= (and d!142581 res!867460) b!1306984))

(assert (= (and b!1306984 res!867459) b!1306986))

(declare-fun m!1198431 () Bool)

(assert (=> bm!64546 m!1198431))

(declare-fun m!1198433 () Bool)

(assert (=> b!1306986 m!1198433))

(declare-fun m!1198435 () Bool)

(assert (=> b!1306984 m!1198435))

(declare-fun m!1198437 () Bool)

(assert (=> b!1306983 m!1198437))

(declare-fun m!1198439 () Bool)

(assert (=> d!142581 m!1198439))

(declare-fun m!1198441 () Bool)

(assert (=> d!142581 m!1198441))

(assert (=> d!142433 d!142581))

(assert (=> d!142463 d!142447))

(declare-fun d!142583 () Bool)

(declare-fun res!867461 () Bool)

(declare-fun e!745629 () Bool)

(assert (=> d!142583 (=> res!867461 e!745629)))

(assert (=> d!142583 (= res!867461 (and ((_ is Cons!29815) (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142583 (= (containsKey!731 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745629)))

(declare-fun b!1306987 () Bool)

(declare-fun e!745630 () Bool)

(assert (=> b!1306987 (= e!745629 e!745630)))

(declare-fun res!867462 () Bool)

(assert (=> b!1306987 (=> (not res!867462) (not e!745630))))

(assert (=> b!1306987 (= res!867462 (and (or (not ((_ is Cons!29815) (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29815) (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11349 (h!31033 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1306988 () Bool)

(assert (=> b!1306988 (= e!745630 (containsKey!731 (t!43413 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142583 (not res!867461)) b!1306987))

(assert (= (and b!1306987 res!867462) b!1306988))

(declare-fun m!1198443 () Bool)

(assert (=> b!1306988 m!1198443))

(assert (=> d!142461 d!142583))

(assert (=> b!1306616 d!142509))

(declare-fun d!142585 () Bool)

(declare-fun e!745632 () Bool)

(assert (=> d!142585 e!745632))

(declare-fun res!867463 () Bool)

(assert (=> d!142585 (=> res!867463 e!745632)))

(declare-fun lt!585088 () Bool)

(assert (=> d!142585 (= res!867463 (not lt!585088))))

(declare-fun lt!585087 () Bool)

(assert (=> d!142585 (= lt!585088 lt!585087)))

(declare-fun lt!585089 () Unit!43192)

(declare-fun e!745631 () Unit!43192)

(assert (=> d!142585 (= lt!585089 e!745631)))

(declare-fun c!125873 () Bool)

(assert (=> d!142585 (= c!125873 lt!585087)))

(assert (=> d!142585 (= lt!585087 (containsKey!731 (toList!10186 lt!584976) (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> d!142585 (= (contains!8342 lt!584976 (select (arr!41958 _keys!1741) from!2144)) lt!585088)))

(declare-fun b!1306989 () Bool)

(declare-fun lt!585090 () Unit!43192)

(assert (=> b!1306989 (= e!745631 lt!585090)))

(assert (=> b!1306989 (= lt!585090 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584976) (select (arr!41958 _keys!1741) from!2144)))))

(assert (=> b!1306989 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) (select (arr!41958 _keys!1741) from!2144)))))

(declare-fun b!1306990 () Bool)

(declare-fun Unit!43216 () Unit!43192)

(assert (=> b!1306990 (= e!745631 Unit!43216)))

(declare-fun b!1306991 () Bool)

(assert (=> b!1306991 (= e!745632 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) (select (arr!41958 _keys!1741) from!2144))))))

(assert (= (and d!142585 c!125873) b!1306989))

(assert (= (and d!142585 (not c!125873)) b!1306990))

(assert (= (and d!142585 (not res!867463)) b!1306991))

(assert (=> d!142585 m!1197807))

(declare-fun m!1198445 () Bool)

(assert (=> d!142585 m!1198445))

(assert (=> b!1306989 m!1197807))

(declare-fun m!1198447 () Bool)

(assert (=> b!1306989 m!1198447))

(assert (=> b!1306989 m!1197807))

(declare-fun m!1198449 () Bool)

(assert (=> b!1306989 m!1198449))

(assert (=> b!1306989 m!1198449))

(declare-fun m!1198451 () Bool)

(assert (=> b!1306989 m!1198451))

(assert (=> b!1306991 m!1197807))

(assert (=> b!1306991 m!1198449))

(assert (=> b!1306991 m!1198449))

(assert (=> b!1306991 m!1198451))

(assert (=> b!1306754 d!142585))

(assert (=> b!1306614 d!142509))

(assert (=> b!1306688 d!142539))

(assert (=> b!1306688 d!142541))

(assert (=> b!1306744 d!142437))

(assert (=> b!1306670 d!142437))

(assert (=> d!142439 d!142441))

(assert (=> d!142439 d!142443))

(declare-fun d!142587 () Bool)

(assert (=> d!142587 (not (contains!8342 (+!4538 lt!584721 (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(assert (=> d!142587 true))

(declare-fun _$36!382 () Unit!43192)

(assert (=> d!142587 (= (choose!1939 lt!584721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) _$36!382)))

(declare-fun bs!37212 () Bool)

(assert (= bs!37212 d!142587))

(assert (=> bs!37212 m!1197797))

(assert (=> bs!37212 m!1197797))

(assert (=> bs!37212 m!1197799))

(assert (=> d!142439 d!142587))

(assert (=> d!142439 d!142517))

(declare-fun d!142589 () Bool)

(declare-fun isEmpty!1076 (List!29819) Bool)

(assert (=> d!142589 (= (isEmpty!1074 lt!584878) (isEmpty!1076 (toList!10186 lt!584878)))))

(declare-fun bs!37213 () Bool)

(assert (= bs!37213 d!142589))

(declare-fun m!1198453 () Bool)

(assert (=> bs!37213 m!1198453))

(assert (=> b!1306668 d!142589))

(declare-fun d!142591 () Bool)

(declare-fun e!745634 () Bool)

(assert (=> d!142591 e!745634))

(declare-fun res!867464 () Bool)

(assert (=> d!142591 (=> res!867464 e!745634)))

(declare-fun lt!585092 () Bool)

(assert (=> d!142591 (= res!867464 (not lt!585092))))

(declare-fun lt!585091 () Bool)

(assert (=> d!142591 (= lt!585092 lt!585091)))

(declare-fun lt!585093 () Unit!43192)

(declare-fun e!745633 () Unit!43192)

(assert (=> d!142591 (= lt!585093 e!745633)))

(declare-fun c!125874 () Bool)

(assert (=> d!142591 (= c!125874 lt!585091)))

(assert (=> d!142591 (= lt!585091 (containsKey!731 (toList!10186 lt!584878) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142591 (= (contains!8342 lt!584878 #b0000000000000000000000000000000000000000000000000000000000000000) lt!585092)))

(declare-fun b!1306992 () Bool)

(declare-fun lt!585094 () Unit!43192)

(assert (=> b!1306992 (= e!745633 lt!585094)))

(assert (=> b!1306992 (= lt!585094 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584878) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306992 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306993 () Bool)

(declare-fun Unit!43217 () Unit!43192)

(assert (=> b!1306993 (= e!745633 Unit!43217)))

(declare-fun b!1306994 () Bool)

(assert (=> b!1306994 (= e!745634 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142591 c!125874) b!1306992))

(assert (= (and d!142591 (not c!125874)) b!1306993))

(assert (= (and d!142591 (not res!867464)) b!1306994))

(declare-fun m!1198455 () Bool)

(assert (=> d!142591 m!1198455))

(declare-fun m!1198457 () Bool)

(assert (=> b!1306992 m!1198457))

(declare-fun m!1198459 () Bool)

(assert (=> b!1306992 m!1198459))

(assert (=> b!1306992 m!1198459))

(declare-fun m!1198461 () Bool)

(assert (=> b!1306992 m!1198461))

(assert (=> b!1306994 m!1198459))

(assert (=> b!1306994 m!1198459))

(assert (=> b!1306994 m!1198461))

(assert (=> d!142435 d!142591))

(assert (=> d!142435 d!142447))

(declare-fun d!142593 () Bool)

(declare-fun e!745636 () Bool)

(assert (=> d!142593 e!745636))

(declare-fun res!867465 () Bool)

(assert (=> d!142593 (=> res!867465 e!745636)))

(declare-fun lt!585096 () Bool)

(assert (=> d!142593 (= res!867465 (not lt!585096))))

(declare-fun lt!585095 () Bool)

(assert (=> d!142593 (= lt!585096 lt!585095)))

(declare-fun lt!585097 () Unit!43192)

(declare-fun e!745635 () Unit!43192)

(assert (=> d!142593 (= lt!585097 e!745635)))

(declare-fun c!125875 () Bool)

(assert (=> d!142593 (= c!125875 lt!585095)))

(assert (=> d!142593 (= lt!585095 (containsKey!731 (toList!10186 lt!584976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142593 (= (contains!8342 lt!584976 #b0000000000000000000000000000000000000000000000000000000000000000) lt!585096)))

(declare-fun b!1306995 () Bool)

(declare-fun lt!585098 () Unit!43192)

(assert (=> b!1306995 (= e!745635 lt!585098)))

(assert (=> b!1306995 (= lt!585098 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306995 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306996 () Bool)

(declare-fun Unit!43218 () Unit!43192)

(assert (=> b!1306996 (= e!745635 Unit!43218)))

(declare-fun b!1306997 () Bool)

(assert (=> b!1306997 (= e!745636 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142593 c!125875) b!1306995))

(assert (= (and d!142593 (not c!125875)) b!1306996))

(assert (= (and d!142593 (not res!867465)) b!1306997))

(declare-fun m!1198463 () Bool)

(assert (=> d!142593 m!1198463))

(declare-fun m!1198465 () Bool)

(assert (=> b!1306995 m!1198465))

(assert (=> b!1306995 m!1198349))

(assert (=> b!1306995 m!1198349))

(declare-fun m!1198467 () Bool)

(assert (=> b!1306995 m!1198467))

(assert (=> b!1306997 m!1198349))

(assert (=> b!1306997 m!1198349))

(assert (=> b!1306997 m!1198467))

(assert (=> bm!64531 d!142593))

(declare-fun d!142595 () Bool)

(declare-fun e!745638 () Bool)

(assert (=> d!142595 e!745638))

(declare-fun res!867466 () Bool)

(assert (=> d!142595 (=> res!867466 e!745638)))

(declare-fun lt!585100 () Bool)

(assert (=> d!142595 (= res!867466 (not lt!585100))))

(declare-fun lt!585099 () Bool)

(assert (=> d!142595 (= lt!585100 lt!585099)))

(declare-fun lt!585101 () Unit!43192)

(declare-fun e!745637 () Unit!43192)

(assert (=> d!142595 (= lt!585101 e!745637)))

(declare-fun c!125876 () Bool)

(assert (=> d!142595 (= c!125876 lt!585099)))

(assert (=> d!142595 (= lt!585099 (containsKey!731 (toList!10186 lt!584878) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142595 (= (contains!8342 lt!584878 #b1000000000000000000000000000000000000000000000000000000000000000) lt!585100)))

(declare-fun b!1306998 () Bool)

(declare-fun lt!585102 () Unit!43192)

(assert (=> b!1306998 (= e!745637 lt!585102)))

(assert (=> b!1306998 (= lt!585102 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 lt!584878) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306998 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306999 () Bool)

(declare-fun Unit!43219 () Unit!43192)

(assert (=> b!1306999 (= e!745637 Unit!43219)))

(declare-fun b!1307000 () Bool)

(assert (=> b!1307000 (= e!745638 (isDefined!514 (getValueByKey!705 (toList!10186 lt!584878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142595 c!125876) b!1306998))

(assert (= (and d!142595 (not c!125876)) b!1306999))

(assert (= (and d!142595 (not res!867466)) b!1307000))

(declare-fun m!1198469 () Bool)

(assert (=> d!142595 m!1198469))

(declare-fun m!1198471 () Bool)

(assert (=> b!1306998 m!1198471))

(declare-fun m!1198473 () Bool)

(assert (=> b!1306998 m!1198473))

(assert (=> b!1306998 m!1198473))

(declare-fun m!1198475 () Bool)

(assert (=> b!1306998 m!1198475))

(assert (=> b!1307000 m!1198473))

(assert (=> b!1307000 m!1198473))

(assert (=> b!1307000 m!1198475))

(assert (=> b!1306675 d!142595))

(declare-fun d!142597 () Bool)

(assert (=> d!142597 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(declare-fun lt!585103 () Unit!43192)

(assert (=> d!142597 (= lt!585103 (choose!1941 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(declare-fun e!745639 () Bool)

(assert (=> d!142597 e!745639))

(declare-fun res!867467 () Bool)

(assert (=> d!142597 (=> (not res!867467) (not e!745639))))

(assert (=> d!142597 (= res!867467 (isStrictlySorted!863 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714)))))))

(assert (=> d!142597 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205) lt!585103)))

(declare-fun b!1307001 () Bool)

(assert (=> b!1307001 (= e!745639 (containsKey!731 (toList!10186 (ite c!125746 lt!584720 (ite c!125747 lt!584718 lt!584714))) k0!1205))))

(assert (= (and d!142597 res!867467) b!1307001))

(assert (=> d!142597 m!1198037))

(assert (=> d!142597 m!1198037))

(assert (=> d!142597 m!1198039))

(declare-fun m!1198477 () Bool)

(assert (=> d!142597 m!1198477))

(declare-fun m!1198479 () Bool)

(assert (=> d!142597 m!1198479))

(assert (=> b!1307001 m!1198033))

(assert (=> b!1306692 d!142597))

(assert (=> b!1306692 d!142555))

(assert (=> b!1306692 d!142557))

(declare-fun d!142599 () Bool)

(assert (=> d!142599 (isDefined!514 (getValueByKey!705 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!585104 () Unit!43192)

(assert (=> d!142599 (= lt!585104 (choose!1941 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!745640 () Bool)

(assert (=> d!142599 e!745640))

(declare-fun res!867468 () Bool)

(assert (=> d!142599 (=> (not res!867468) (not e!745640))))

(assert (=> d!142599 (= res!867468 (isStrictlySorted!863 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142599 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!585104)))

(declare-fun b!1307002 () Bool)

(assert (=> b!1307002 (= e!745640 (containsKey!731 (toList!10186 (getCurrentListMap!5194 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142599 res!867468) b!1307002))

(assert (=> d!142599 m!1198053))

(assert (=> d!142599 m!1198053))

(assert (=> d!142599 m!1198055))

(declare-fun m!1198481 () Bool)

(assert (=> d!142599 m!1198481))

(declare-fun m!1198483 () Bool)

(assert (=> d!142599 m!1198483))

(assert (=> b!1307002 m!1198049))

(assert (=> b!1306698 d!142599))

(assert (=> b!1306698 d!142565))

(assert (=> b!1306698 d!142567))

(assert (=> bm!64527 d!142435))

(declare-fun d!142601 () Bool)

(assert (=> d!142601 (isDefined!514 (getValueByKey!705 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(declare-fun lt!585105 () Unit!43192)

(assert (=> d!142601 (= lt!585105 (choose!1941 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(declare-fun e!745641 () Bool)

(assert (=> d!142601 e!745641))

(declare-fun res!867469 () Bool)

(assert (=> d!142601 (=> (not res!867469) (not e!745641))))

(assert (=> d!142601 (= res!867469 (isStrictlySorted!863 (toList!10186 (ite c!125746 lt!584721 call!64424))))))

(assert (=> d!142601 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205) lt!585105)))

(declare-fun b!1307003 () Bool)

(assert (=> b!1307003 (= e!745641 (containsKey!731 (toList!10186 (ite c!125746 lt!584721 call!64424)) k0!1205))))

(assert (= (and d!142601 res!867469) b!1307003))

(assert (=> d!142601 m!1198045))

(assert (=> d!142601 m!1198045))

(assert (=> d!142601 m!1198047))

(declare-fun m!1198485 () Bool)

(assert (=> d!142601 m!1198485))

(declare-fun m!1198487 () Bool)

(assert (=> d!142601 m!1198487))

(assert (=> b!1307003 m!1198041))

(assert (=> b!1306695 d!142601))

(assert (=> b!1306695 d!142571))

(assert (=> b!1306695 d!142573))

(declare-fun c!125877 () Bool)

(declare-fun d!142603 () Bool)

(assert (=> d!142603 (= c!125877 (and ((_ is Cons!29815) (toList!10186 lt!584859)) (= (_1!11349 (h!31033 (toList!10186 lt!584859))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun e!745642 () Option!756)

(assert (=> d!142603 (= (getValueByKey!705 (toList!10186 lt!584859) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) e!745642)))

(declare-fun b!1307005 () Bool)

(declare-fun e!745643 () Option!756)

(assert (=> b!1307005 (= e!745642 e!745643)))

(declare-fun c!125878 () Bool)

(assert (=> b!1307005 (= c!125878 (and ((_ is Cons!29815) (toList!10186 lt!584859)) (not (= (_1!11349 (h!31033 (toList!10186 lt!584859))) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))))

(declare-fun b!1307007 () Bool)

(assert (=> b!1307007 (= e!745643 None!754)))

(declare-fun b!1307006 () Bool)

(assert (=> b!1307006 (= e!745643 (getValueByKey!705 (t!43413 (toList!10186 lt!584859)) (_1!11349 (ite (or c!125746 c!125747) (tuple2!22677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1307004 () Bool)

(assert (=> b!1307004 (= e!745642 (Some!755 (_2!11349 (h!31033 (toList!10186 lt!584859)))))))

(assert (= (and d!142603 c!125877) b!1307004))

(assert (= (and d!142603 (not c!125877)) b!1307005))

(assert (= (and b!1307005 c!125878) b!1307006))

(assert (= (and b!1307005 (not c!125878)) b!1307007))

(declare-fun m!1198489 () Bool)

(assert (=> b!1307006 m!1198489))

(assert (=> b!1306642 d!142603))

(declare-fun d!142605 () Bool)

(assert (=> d!142605 (= (apply!1035 lt!584976 (select (arr!41958 _keys!1741) from!2144)) (get!21240 (getValueByKey!705 (toList!10186 lt!584976) (select (arr!41958 _keys!1741) from!2144))))))

(declare-fun bs!37214 () Bool)

(assert (= bs!37214 d!142605))

(assert (=> bs!37214 m!1197807))

(assert (=> bs!37214 m!1198449))

(assert (=> bs!37214 m!1198449))

(declare-fun m!1198491 () Bool)

(assert (=> bs!37214 m!1198491))

(assert (=> b!1306763 d!142605))

(assert (=> b!1306763 d!142471))

(declare-fun d!142607 () Bool)

(declare-fun e!745644 () Bool)

(assert (=> d!142607 e!745644))

(declare-fun res!867470 () Bool)

(assert (=> d!142607 (=> (not res!867470) (not e!745644))))

(declare-fun lt!585107 () ListLongMap!20341)

(assert (=> d!142607 (= res!867470 (contains!8342 lt!585107 (_1!11349 (tuple2!22677 lt!584971 zeroValue!1387))))))

(declare-fun lt!585106 () List!29819)

(assert (=> d!142607 (= lt!585107 (ListLongMap!20342 lt!585106))))

(declare-fun lt!585108 () Unit!43192)

(declare-fun lt!585109 () Unit!43192)

(assert (=> d!142607 (= lt!585108 lt!585109)))

(assert (=> d!142607 (= (getValueByKey!705 lt!585106 (_1!11349 (tuple2!22677 lt!584971 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584971 zeroValue!1387))))))

(assert (=> d!142607 (= lt!585109 (lemmaContainsTupThenGetReturnValue!356 lt!585106 (_1!11349 (tuple2!22677 lt!584971 zeroValue!1387)) (_2!11349 (tuple2!22677 lt!584971 zeroValue!1387))))))

(assert (=> d!142607 (= lt!585106 (insertStrictlySorted!485 (toList!10186 lt!584966) (_1!11349 (tuple2!22677 lt!584971 zeroValue!1387)) (_2!11349 (tuple2!22677 lt!584971 zeroValue!1387))))))

(assert (=> d!142607 (= (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387)) lt!585107)))

(declare-fun b!1307008 () Bool)

(declare-fun res!867471 () Bool)

(assert (=> b!1307008 (=> (not res!867471) (not e!745644))))

(assert (=> b!1307008 (= res!867471 (= (getValueByKey!705 (toList!10186 lt!585107) (_1!11349 (tuple2!22677 lt!584971 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584971 zeroValue!1387)))))))

(declare-fun b!1307009 () Bool)

(assert (=> b!1307009 (= e!745644 (contains!8345 (toList!10186 lt!585107) (tuple2!22677 lt!584971 zeroValue!1387)))))

(assert (= (and d!142607 res!867470) b!1307008))

(assert (= (and b!1307008 res!867471) b!1307009))

(declare-fun m!1198493 () Bool)

(assert (=> d!142607 m!1198493))

(declare-fun m!1198495 () Bool)

(assert (=> d!142607 m!1198495))

(declare-fun m!1198497 () Bool)

(assert (=> d!142607 m!1198497))

(declare-fun m!1198499 () Bool)

(assert (=> d!142607 m!1198499))

(declare-fun m!1198501 () Bool)

(assert (=> b!1307008 m!1198501))

(declare-fun m!1198503 () Bool)

(assert (=> b!1307009 m!1198503))

(assert (=> b!1306746 d!142607))

(declare-fun d!142609 () Bool)

(declare-fun e!745645 () Bool)

(assert (=> d!142609 e!745645))

(declare-fun res!867472 () Bool)

(assert (=> d!142609 (=> (not res!867472) (not e!745645))))

(declare-fun lt!585111 () ListLongMap!20341)

(assert (=> d!142609 (= res!867472 (contains!8342 lt!585111 (_1!11349 (tuple2!22677 lt!584968 zeroValue!1387))))))

(declare-fun lt!585110 () List!29819)

(assert (=> d!142609 (= lt!585111 (ListLongMap!20342 lt!585110))))

(declare-fun lt!585112 () Unit!43192)

(declare-fun lt!585113 () Unit!43192)

(assert (=> d!142609 (= lt!585112 lt!585113)))

(assert (=> d!142609 (= (getValueByKey!705 lt!585110 (_1!11349 (tuple2!22677 lt!584968 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584968 zeroValue!1387))))))

(assert (=> d!142609 (= lt!585113 (lemmaContainsTupThenGetReturnValue!356 lt!585110 (_1!11349 (tuple2!22677 lt!584968 zeroValue!1387)) (_2!11349 (tuple2!22677 lt!584968 zeroValue!1387))))))

(assert (=> d!142609 (= lt!585110 (insertStrictlySorted!485 (toList!10186 lt!584969) (_1!11349 (tuple2!22677 lt!584968 zeroValue!1387)) (_2!11349 (tuple2!22677 lt!584968 zeroValue!1387))))))

(assert (=> d!142609 (= (+!4538 lt!584969 (tuple2!22677 lt!584968 zeroValue!1387)) lt!585111)))

(declare-fun b!1307010 () Bool)

(declare-fun res!867473 () Bool)

(assert (=> b!1307010 (=> (not res!867473) (not e!745645))))

(assert (=> b!1307010 (= res!867473 (= (getValueByKey!705 (toList!10186 lt!585111) (_1!11349 (tuple2!22677 lt!584968 zeroValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584968 zeroValue!1387)))))))

(declare-fun b!1307011 () Bool)

(assert (=> b!1307011 (= e!745645 (contains!8345 (toList!10186 lt!585111) (tuple2!22677 lt!584968 zeroValue!1387)))))

(assert (= (and d!142609 res!867472) b!1307010))

(assert (= (and b!1307010 res!867473) b!1307011))

(declare-fun m!1198505 () Bool)

(assert (=> d!142609 m!1198505))

(declare-fun m!1198507 () Bool)

(assert (=> d!142609 m!1198507))

(declare-fun m!1198509 () Bool)

(assert (=> d!142609 m!1198509))

(declare-fun m!1198511 () Bool)

(assert (=> d!142609 m!1198511))

(declare-fun m!1198513 () Bool)

(assert (=> b!1307010 m!1198513))

(declare-fun m!1198515 () Bool)

(assert (=> b!1307011 m!1198515))

(assert (=> b!1306746 d!142609))

(declare-fun d!142611 () Bool)

(assert (=> d!142611 (= (apply!1035 lt!584963 lt!584965) (get!21240 (getValueByKey!705 (toList!10186 lt!584963) lt!584965)))))

(declare-fun bs!37215 () Bool)

(assert (= bs!37215 d!142611))

(declare-fun m!1198517 () Bool)

(assert (=> bs!37215 m!1198517))

(assert (=> bs!37215 m!1198517))

(declare-fun m!1198519 () Bool)

(assert (=> bs!37215 m!1198519))

(assert (=> b!1306746 d!142611))

(declare-fun d!142613 () Bool)

(declare-fun e!745647 () Bool)

(assert (=> d!142613 e!745647))

(declare-fun res!867474 () Bool)

(assert (=> d!142613 (=> res!867474 e!745647)))

(declare-fun lt!585115 () Bool)

(assert (=> d!142613 (= res!867474 (not lt!585115))))

(declare-fun lt!585114 () Bool)

(assert (=> d!142613 (= lt!585115 lt!585114)))

(declare-fun lt!585116 () Unit!43192)

(declare-fun e!745646 () Unit!43192)

(assert (=> d!142613 (= lt!585116 e!745646)))

(declare-fun c!125879 () Bool)

(assert (=> d!142613 (= c!125879 lt!585114)))

(assert (=> d!142613 (= lt!585114 (containsKey!731 (toList!10186 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387))) lt!584956))))

(assert (=> d!142613 (= (contains!8342 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387)) lt!584956) lt!585115)))

(declare-fun b!1307012 () Bool)

(declare-fun lt!585117 () Unit!43192)

(assert (=> b!1307012 (= e!745646 lt!585117)))

(assert (=> b!1307012 (= lt!585117 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10186 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387))) lt!584956))))

(assert (=> b!1307012 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387))) lt!584956))))

(declare-fun b!1307013 () Bool)

(declare-fun Unit!43220 () Unit!43192)

(assert (=> b!1307013 (= e!745646 Unit!43220)))

(declare-fun b!1307014 () Bool)

(assert (=> b!1307014 (= e!745647 (isDefined!514 (getValueByKey!705 (toList!10186 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387))) lt!584956)))))

(assert (= (and d!142613 c!125879) b!1307012))

(assert (= (and d!142613 (not c!125879)) b!1307013))

(assert (= (and d!142613 (not res!867474)) b!1307014))

(declare-fun m!1198521 () Bool)

(assert (=> d!142613 m!1198521))

(declare-fun m!1198523 () Bool)

(assert (=> b!1307012 m!1198523))

(declare-fun m!1198525 () Bool)

(assert (=> b!1307012 m!1198525))

(assert (=> b!1307012 m!1198525))

(declare-fun m!1198527 () Bool)

(assert (=> b!1307012 m!1198527))

(assert (=> b!1307014 m!1198525))

(assert (=> b!1307014 m!1198525))

(assert (=> b!1307014 m!1198527))

(assert (=> b!1306746 d!142613))

(declare-fun d!142615 () Bool)

(assert (=> d!142615 (= (apply!1035 (+!4538 lt!584963 (tuple2!22677 lt!584964 minValue!1387)) lt!584965) (get!21240 (getValueByKey!705 (toList!10186 (+!4538 lt!584963 (tuple2!22677 lt!584964 minValue!1387))) lt!584965)))))

(declare-fun bs!37216 () Bool)

(assert (= bs!37216 d!142615))

(declare-fun m!1198529 () Bool)

(assert (=> bs!37216 m!1198529))

(assert (=> bs!37216 m!1198529))

(declare-fun m!1198531 () Bool)

(assert (=> bs!37216 m!1198531))

(assert (=> b!1306746 d!142615))

(declare-fun d!142617 () Bool)

(declare-fun e!745648 () Bool)

(assert (=> d!142617 e!745648))

(declare-fun res!867475 () Bool)

(assert (=> d!142617 (=> (not res!867475) (not e!745648))))

(declare-fun lt!585119 () ListLongMap!20341)

(assert (=> d!142617 (= res!867475 (contains!8342 lt!585119 (_1!11349 (tuple2!22677 lt!584961 minValue!1387))))))

(declare-fun lt!585118 () List!29819)

(assert (=> d!142617 (= lt!585119 (ListLongMap!20342 lt!585118))))

(declare-fun lt!585120 () Unit!43192)

(declare-fun lt!585121 () Unit!43192)

(assert (=> d!142617 (= lt!585120 lt!585121)))

(assert (=> d!142617 (= (getValueByKey!705 lt!585118 (_1!11349 (tuple2!22677 lt!584961 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584961 minValue!1387))))))

(assert (=> d!142617 (= lt!585121 (lemmaContainsTupThenGetReturnValue!356 lt!585118 (_1!11349 (tuple2!22677 lt!584961 minValue!1387)) (_2!11349 (tuple2!22677 lt!584961 minValue!1387))))))

(assert (=> d!142617 (= lt!585118 (insertStrictlySorted!485 (toList!10186 lt!584959) (_1!11349 (tuple2!22677 lt!584961 minValue!1387)) (_2!11349 (tuple2!22677 lt!584961 minValue!1387))))))

(assert (=> d!142617 (= (+!4538 lt!584959 (tuple2!22677 lt!584961 minValue!1387)) lt!585119)))

(declare-fun b!1307015 () Bool)

(declare-fun res!867476 () Bool)

(assert (=> b!1307015 (=> (not res!867476) (not e!745648))))

(assert (=> b!1307015 (= res!867476 (= (getValueByKey!705 (toList!10186 lt!585119) (_1!11349 (tuple2!22677 lt!584961 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584961 minValue!1387)))))))

(declare-fun b!1307016 () Bool)

(assert (=> b!1307016 (= e!745648 (contains!8345 (toList!10186 lt!585119) (tuple2!22677 lt!584961 minValue!1387)))))

(assert (= (and d!142617 res!867475) b!1307015))

(assert (= (and b!1307015 res!867476) b!1307016))

(declare-fun m!1198533 () Bool)

(assert (=> d!142617 m!1198533))

(declare-fun m!1198535 () Bool)

(assert (=> d!142617 m!1198535))

(declare-fun m!1198537 () Bool)

(assert (=> d!142617 m!1198537))

(declare-fun m!1198539 () Bool)

(assert (=> d!142617 m!1198539))

(declare-fun m!1198541 () Bool)

(assert (=> b!1307015 m!1198541))

(declare-fun m!1198543 () Bool)

(assert (=> b!1307016 m!1198543))

(assert (=> b!1306746 d!142617))

(declare-fun d!142619 () Bool)

(assert (=> d!142619 (= (apply!1035 (+!4538 lt!584959 (tuple2!22677 lt!584961 minValue!1387)) lt!584958) (apply!1035 lt!584959 lt!584958))))

(declare-fun lt!585124 () Unit!43192)

(declare-fun choose!1943 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> d!142619 (= lt!585124 (choose!1943 lt!584959 lt!584961 minValue!1387 lt!584958))))

(declare-fun e!745651 () Bool)

(assert (=> d!142619 e!745651))

(declare-fun res!867479 () Bool)

(assert (=> d!142619 (=> (not res!867479) (not e!745651))))

(assert (=> d!142619 (= res!867479 (contains!8342 lt!584959 lt!584958))))

(assert (=> d!142619 (= (addApplyDifferent!564 lt!584959 lt!584961 minValue!1387 lt!584958) lt!585124)))

(declare-fun b!1307020 () Bool)

(assert (=> b!1307020 (= e!745651 (not (= lt!584958 lt!584961)))))

(assert (= (and d!142619 res!867479) b!1307020))

(declare-fun m!1198545 () Bool)

(assert (=> d!142619 m!1198545))

(declare-fun m!1198547 () Bool)

(assert (=> d!142619 m!1198547))

(assert (=> d!142619 m!1198079))

(assert (=> d!142619 m!1198081))

(assert (=> d!142619 m!1198099))

(assert (=> d!142619 m!1198079))

(assert (=> b!1306746 d!142619))

(declare-fun d!142621 () Bool)

(assert (=> d!142621 (= (apply!1035 (+!4538 lt!584969 (tuple2!22677 lt!584968 zeroValue!1387)) lt!584972) (get!21240 (getValueByKey!705 (toList!10186 (+!4538 lt!584969 (tuple2!22677 lt!584968 zeroValue!1387))) lt!584972)))))

(declare-fun bs!37217 () Bool)

(assert (= bs!37217 d!142621))

(declare-fun m!1198549 () Bool)

(assert (=> bs!37217 m!1198549))

(assert (=> bs!37217 m!1198549))

(declare-fun m!1198551 () Bool)

(assert (=> bs!37217 m!1198551))

(assert (=> b!1306746 d!142621))

(declare-fun d!142623 () Bool)

(assert (=> d!142623 (= (apply!1035 lt!584969 lt!584972) (get!21240 (getValueByKey!705 (toList!10186 lt!584969) lt!584972)))))

(declare-fun bs!37218 () Bool)

(assert (= bs!37218 d!142623))

(declare-fun m!1198553 () Bool)

(assert (=> bs!37218 m!1198553))

(assert (=> bs!37218 m!1198553))

(declare-fun m!1198555 () Bool)

(assert (=> bs!37218 m!1198555))

(assert (=> b!1306746 d!142623))

(assert (=> b!1306746 d!142435))

(declare-fun d!142625 () Bool)

(assert (=> d!142625 (= (apply!1035 (+!4538 lt!584959 (tuple2!22677 lt!584961 minValue!1387)) lt!584958) (get!21240 (getValueByKey!705 (toList!10186 (+!4538 lt!584959 (tuple2!22677 lt!584961 minValue!1387))) lt!584958)))))

(declare-fun bs!37219 () Bool)

(assert (= bs!37219 d!142625))

(declare-fun m!1198557 () Bool)

(assert (=> bs!37219 m!1198557))

(assert (=> bs!37219 m!1198557))

(declare-fun m!1198559 () Bool)

(assert (=> bs!37219 m!1198559))

(assert (=> b!1306746 d!142625))

(declare-fun d!142627 () Bool)

(assert (=> d!142627 (= (apply!1035 lt!584959 lt!584958) (get!21240 (getValueByKey!705 (toList!10186 lt!584959) lt!584958)))))

(declare-fun bs!37220 () Bool)

(assert (= bs!37220 d!142627))

(declare-fun m!1198561 () Bool)

(assert (=> bs!37220 m!1198561))

(assert (=> bs!37220 m!1198561))

(declare-fun m!1198563 () Bool)

(assert (=> bs!37220 m!1198563))

(assert (=> b!1306746 d!142627))

(declare-fun d!142629 () Bool)

(assert (=> d!142629 (contains!8342 (+!4538 lt!584966 (tuple2!22677 lt!584971 zeroValue!1387)) lt!584956)))

(declare-fun lt!585127 () Unit!43192)

(declare-fun choose!1944 (ListLongMap!20341 (_ BitVec 64) V!51697 (_ BitVec 64)) Unit!43192)

(assert (=> d!142629 (= lt!585127 (choose!1944 lt!584966 lt!584971 zeroValue!1387 lt!584956))))

(assert (=> d!142629 (contains!8342 lt!584966 lt!584956)))

(assert (=> d!142629 (= (addStillContains!1122 lt!584966 lt!584971 zeroValue!1387 lt!584956) lt!585127)))

(declare-fun bs!37221 () Bool)

(assert (= bs!37221 d!142629))

(assert (=> bs!37221 m!1198071))

(assert (=> bs!37221 m!1198071))

(assert (=> bs!37221 m!1198077))

(declare-fun m!1198565 () Bool)

(assert (=> bs!37221 m!1198565))

(declare-fun m!1198567 () Bool)

(assert (=> bs!37221 m!1198567))

(assert (=> b!1306746 d!142629))

(declare-fun d!142631 () Bool)

(assert (=> d!142631 (= (apply!1035 (+!4538 lt!584969 (tuple2!22677 lt!584968 zeroValue!1387)) lt!584972) (apply!1035 lt!584969 lt!584972))))

(declare-fun lt!585128 () Unit!43192)

(assert (=> d!142631 (= lt!585128 (choose!1943 lt!584969 lt!584968 zeroValue!1387 lt!584972))))

(declare-fun e!745652 () Bool)

(assert (=> d!142631 e!745652))

(declare-fun res!867480 () Bool)

(assert (=> d!142631 (=> (not res!867480) (not e!745652))))

(assert (=> d!142631 (= res!867480 (contains!8342 lt!584969 lt!584972))))

(assert (=> d!142631 (= (addApplyDifferent!564 lt!584969 lt!584968 zeroValue!1387 lt!584972) lt!585128)))

(declare-fun b!1307022 () Bool)

(assert (=> b!1307022 (= e!745652 (not (= lt!584972 lt!584968)))))

(assert (= (and d!142631 res!867480) b!1307022))

(declare-fun m!1198569 () Bool)

(assert (=> d!142631 m!1198569))

(declare-fun m!1198571 () Bool)

(assert (=> d!142631 m!1198571))

(assert (=> d!142631 m!1198089))

(assert (=> d!142631 m!1198093))

(assert (=> d!142631 m!1198075))

(assert (=> d!142631 m!1198089))

(assert (=> b!1306746 d!142631))

(declare-fun d!142633 () Bool)

(assert (=> d!142633 (= (apply!1035 (+!4538 lt!584963 (tuple2!22677 lt!584964 minValue!1387)) lt!584965) (apply!1035 lt!584963 lt!584965))))

(declare-fun lt!585129 () Unit!43192)

(assert (=> d!142633 (= lt!585129 (choose!1943 lt!584963 lt!584964 minValue!1387 lt!584965))))

(declare-fun e!745653 () Bool)

(assert (=> d!142633 e!745653))

(declare-fun res!867481 () Bool)

(assert (=> d!142633 (=> (not res!867481) (not e!745653))))

(assert (=> d!142633 (= res!867481 (contains!8342 lt!584963 lt!584965))))

(assert (=> d!142633 (= (addApplyDifferent!564 lt!584963 lt!584964 minValue!1387 lt!584965) lt!585129)))

(declare-fun b!1307023 () Bool)

(assert (=> b!1307023 (= e!745653 (not (= lt!584965 lt!584964)))))

(assert (= (and d!142633 res!867481) b!1307023))

(declare-fun m!1198573 () Bool)

(assert (=> d!142633 m!1198573))

(declare-fun m!1198575 () Bool)

(assert (=> d!142633 m!1198575))

(assert (=> d!142633 m!1198073))

(assert (=> d!142633 m!1198085))

(assert (=> d!142633 m!1198091))

(assert (=> d!142633 m!1198073))

(assert (=> b!1306746 d!142633))

(declare-fun d!142635 () Bool)

(declare-fun e!745654 () Bool)

(assert (=> d!142635 e!745654))

(declare-fun res!867482 () Bool)

(assert (=> d!142635 (=> (not res!867482) (not e!745654))))

(declare-fun lt!585131 () ListLongMap!20341)

(assert (=> d!142635 (= res!867482 (contains!8342 lt!585131 (_1!11349 (tuple2!22677 lt!584964 minValue!1387))))))

(declare-fun lt!585130 () List!29819)

(assert (=> d!142635 (= lt!585131 (ListLongMap!20342 lt!585130))))

(declare-fun lt!585132 () Unit!43192)

(declare-fun lt!585133 () Unit!43192)

(assert (=> d!142635 (= lt!585132 lt!585133)))

(assert (=> d!142635 (= (getValueByKey!705 lt!585130 (_1!11349 (tuple2!22677 lt!584964 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584964 minValue!1387))))))

(assert (=> d!142635 (= lt!585133 (lemmaContainsTupThenGetReturnValue!356 lt!585130 (_1!11349 (tuple2!22677 lt!584964 minValue!1387)) (_2!11349 (tuple2!22677 lt!584964 minValue!1387))))))

(assert (=> d!142635 (= lt!585130 (insertStrictlySorted!485 (toList!10186 lt!584963) (_1!11349 (tuple2!22677 lt!584964 minValue!1387)) (_2!11349 (tuple2!22677 lt!584964 minValue!1387))))))

(assert (=> d!142635 (= (+!4538 lt!584963 (tuple2!22677 lt!584964 minValue!1387)) lt!585131)))

(declare-fun b!1307024 () Bool)

(declare-fun res!867483 () Bool)

(assert (=> b!1307024 (=> (not res!867483) (not e!745654))))

(assert (=> b!1307024 (= res!867483 (= (getValueByKey!705 (toList!10186 lt!585131) (_1!11349 (tuple2!22677 lt!584964 minValue!1387))) (Some!755 (_2!11349 (tuple2!22677 lt!584964 minValue!1387)))))))

(declare-fun b!1307025 () Bool)

(assert (=> b!1307025 (= e!745654 (contains!8345 (toList!10186 lt!585131) (tuple2!22677 lt!584964 minValue!1387)))))

(assert (= (and d!142635 res!867482) b!1307024))

(assert (= (and b!1307024 res!867483) b!1307025))

(declare-fun m!1198577 () Bool)

(assert (=> d!142635 m!1198577))

(declare-fun m!1198579 () Bool)

(assert (=> d!142635 m!1198579))

(declare-fun m!1198581 () Bool)

(assert (=> d!142635 m!1198581))

(declare-fun m!1198583 () Bool)

(assert (=> d!142635 m!1198583))

(declare-fun m!1198585 () Bool)

(assert (=> b!1307024 m!1198585))

(declare-fun m!1198587 () Bool)

(assert (=> b!1307025 m!1198587))

(assert (=> b!1306746 d!142635))

(assert (=> b!1306671 d!142535))

(declare-fun condMapEmpty!54034 () Bool)

(declare-fun mapDefault!54034 () ValueCell!16574)

(assert (=> mapNonEmpty!54033 (= condMapEmpty!54034 (= mapRest!54033 ((as const (Array (_ BitVec 32) ValueCell!16574)) mapDefault!54034)))))

(declare-fun e!745655 () Bool)

(declare-fun mapRes!54034 () Bool)

(assert (=> mapNonEmpty!54033 (= tp!103095 (and e!745655 mapRes!54034))))

(declare-fun b!1307026 () Bool)

(declare-fun e!745656 () Bool)

(assert (=> b!1307026 (= e!745656 tp_is_empty!34945)))

(declare-fun mapIsEmpty!54034 () Bool)

(assert (=> mapIsEmpty!54034 mapRes!54034))

(declare-fun b!1307027 () Bool)

(assert (=> b!1307027 (= e!745655 tp_is_empty!34945)))

(declare-fun mapNonEmpty!54034 () Bool)

(declare-fun tp!103096 () Bool)

(assert (=> mapNonEmpty!54034 (= mapRes!54034 (and tp!103096 e!745656))))

(declare-fun mapRest!54034 () (Array (_ BitVec 32) ValueCell!16574))

(declare-fun mapValue!54034 () ValueCell!16574)

(declare-fun mapKey!54034 () (_ BitVec 32))

(assert (=> mapNonEmpty!54034 (= mapRest!54033 (store mapRest!54034 mapKey!54034 mapValue!54034))))

(assert (= (and mapNonEmpty!54033 condMapEmpty!54034) mapIsEmpty!54034))

(assert (= (and mapNonEmpty!54033 (not condMapEmpty!54034)) mapNonEmpty!54034))

(assert (= (and mapNonEmpty!54034 ((_ is ValueCellFull!16574) mapValue!54034)) b!1307026))

(assert (= (and mapNonEmpty!54033 ((_ is ValueCellFull!16574) mapDefault!54034)) b!1307027))

(declare-fun m!1198589 () Bool)

(assert (=> mapNonEmpty!54034 m!1198589))

(declare-fun b_lambda!23349 () Bool)

(assert (= b_lambda!23345 (or (and start!110482 b_free!29305) b_lambda!23349)))

(declare-fun b_lambda!23351 () Bool)

(assert (= b_lambda!23347 (or (and start!110482 b_free!29305) b_lambda!23351)))

(check-sat (not b!1306962) (not b!1306929) (not b!1306815) (not b!1306858) (not bm!64533) (not d!142533) (not b!1306928) (not d!142481) (not d!142487) (not d!142475) (not b!1307002) (not b!1306921) (not b!1307014) (not b!1306821) (not b!1306799) (not b!1306807) (not b!1306856) (not d!142611) (not d!142581) (not d!142531) (not d!142589) (not b!1306860) (not d!142503) (not d!142565) (not b!1306939) (not d!142635) (not b!1307001) (not d!142619) (not mapNonEmpty!54034) (not d!142553) (not b!1306806) (not b!1306826) (not d!142551) (not b!1306992) (not b!1306998) (not b!1307012) (not d!142489) (not d!142537) (not b!1306797) (not b!1306997) (not b!1306927) (not b!1306817) (not d!142591) (not b!1306903) (not b!1307016) (not b!1307024) (not d!142621) (not b_lambda!23351) (not d!142571) (not d!142629) (not b!1306975) (not d!142527) (not d!142483) (not b!1306973) (not d!142631) (not d!142623) (not d!142633) (not b_lambda!23349) (not b!1306813) (not d!142613) (not d!142547) (not b!1306820) (not b!1306906) (not b!1306818) (not d!142563) (not b!1306984) (not b!1306859) (not b_lambda!23341) (not b!1306810) (not b!1306794) (not b!1306812) (not d!142569) (not b!1306828) tp_is_empty!34945 (not b!1306988) (not d!142595) (not b!1306862) (not d!142615) (not b!1306902) (not b!1306957) (not d!142469) (not d!142575) (not d!142493) (not d!142625) (not d!142465) (not b!1306924) (not d!142579) (not b!1306838) (not b!1306918) (not d!142593) (not b!1306983) (not b!1307025) (not d!142607) (not b!1306808) (not b!1306823) (not b!1306849) (not b!1307008) (not b!1306991) (not b!1306976) (not d!142519) (not d!142627) (not d!142501) (not b!1306829) (not b!1306905) (not b!1306995) (not d!142555) (not d!142559) (not b!1306850) (not b!1306800) (not d!142511) (not bm!64544) (not d!142517) (not d!142605) (not d!142497) (not d!142477) (not b!1306840) (not b!1306777) (not b!1306968) (not d!142523) (not b!1306796) (not d!142539) b_and!47517 (not b!1306852) (not b!1306803) (not d!142521) (not b!1306846) (not d!142479) (not b!1307011) (not d!142609) (not d!142495) (not b!1307015) (not b!1307003) (not b!1307006) (not b!1306932) (not b!1306913) (not b!1306855) (not b!1306832) (not d!142473) (not b!1306925) (not b!1306916) (not b!1306874) (not b!1306960) (not b!1306804) (not b!1306986) (not b!1306915) (not b_next!29305) (not b!1306795) (not b!1306908) (not d!142599) (not bm!64542) (not b!1307010) (not b!1306994) (not d!142543) (not b!1306914) (not b!1306788) (not d!142617) (not b!1307009) (not d!142485) (not d!142597) (not d!142585) (not bm!64534) (not d!142545) (not b!1306907) (not b!1306963) (not b!1306989) (not d!142587) (not b!1306875) (not b!1307000) (not b!1306909) (not b!1306966) (not d!142601) (not bm!64546) (not b!1306868) (not b!1306801) (not b!1306970) (not b!1306865) (not b_lambda!23343) (not b_lambda!23339) (not b!1306853) (not d!142549) (not d!142535) (not b!1306863))
(check-sat b_and!47517 (not b_next!29305))
