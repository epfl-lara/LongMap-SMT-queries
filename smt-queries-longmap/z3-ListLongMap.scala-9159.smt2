; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110126 () Bool)

(assert start!110126)

(declare-fun b_free!29227 () Bool)

(declare-fun b_next!29227 () Bool)

(assert (=> start!110126 (= b_free!29227 (not b_next!29227))))

(declare-fun tp!102819 () Bool)

(declare-fun b_and!47365 () Bool)

(assert (=> start!110126 (= tp!102819 b_and!47365)))

(declare-fun b!1303267 () Bool)

(declare-fun res!865422 () Bool)

(declare-fun e!743457 () Bool)

(assert (=> b!1303267 (=> (not res!865422) (not e!743457))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86783 0))(
  ( (array!86784 (arr!41882 (Array (_ BitVec 32) (_ BitVec 64))) (size!42433 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86783)

(assert (=> b!1303267 (= res!865422 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741))))))

(declare-fun b!1303268 () Bool)

(declare-datatypes ((Unit!43071 0))(
  ( (Unit!43072) )
))
(declare-fun e!743453 () Unit!43071)

(declare-fun lt!582831 () Unit!43071)

(assert (=> b!1303268 (= e!743453 lt!582831)))

(declare-datatypes ((V!51593 0))(
  ( (V!51594 (val!17508 Int)) )
))
(declare-datatypes ((tuple2!22608 0))(
  ( (tuple2!22609 (_1!11315 (_ BitVec 64)) (_2!11315 V!51593)) )
))
(declare-datatypes ((List!29759 0))(
  ( (Nil!29756) (Cons!29755 (h!30973 tuple2!22608) (t!43337 List!29759)) )
))
(declare-datatypes ((ListLongMap!20273 0))(
  ( (ListLongMap!20274 (toList!10152 List!29759)) )
))
(declare-fun lt!582836 () ListLongMap!20273)

(declare-fun call!64110 () ListLongMap!20273)

(assert (=> b!1303268 (= lt!582836 call!64110)))

(declare-fun call!64109 () Unit!43071)

(assert (=> b!1303268 (= lt!582831 call!64109)))

(declare-fun call!64107 () Bool)

(assert (=> b!1303268 call!64107))

(declare-fun b!1303269 () Bool)

(declare-fun res!865418 () Bool)

(assert (=> b!1303269 (=> (not res!865418) (not e!743457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303269 (= res!865418 (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)))))

(declare-fun b!1303270 () Bool)

(declare-fun res!865420 () Bool)

(assert (=> b!1303270 (=> (not res!865420) (not e!743457))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1303270 (= res!865420 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42433 _keys!1741))))))

(declare-fun b!1303271 () Bool)

(declare-fun res!865421 () Bool)

(assert (=> b!1303271 (=> (not res!865421) (not e!743457))))

(declare-datatypes ((List!29760 0))(
  ( (Nil!29757) (Cons!29756 (h!30974 (_ BitVec 64)) (t!43338 List!29760)) )
))
(declare-fun arrayNoDuplicates!0 (array!86783 (_ BitVec 32) List!29760) Bool)

(assert (=> b!1303271 (= res!865421 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29757))))

(declare-fun minValue!1387 () V!51593)

(declare-fun bm!64104 () Bool)

(declare-fun call!64111 () Unit!43071)

(declare-fun lt!582833 () ListLongMap!20273)

(declare-fun c!125278 () Bool)

(declare-fun c!125280 () Bool)

(declare-fun zeroValue!1387 () V!51593)

(declare-fun lt!582828 () ListLongMap!20273)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!91 ((_ BitVec 64) (_ BitVec 64) V!51593 ListLongMap!20273) Unit!43071)

(assert (=> bm!64104 (= call!64111 (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 (ite (or c!125280 c!125278) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125280 c!125278) zeroValue!1387 minValue!1387) (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))))))

(declare-fun bm!64105 () Bool)

(declare-datatypes ((ValueCell!16535 0))(
  ( (ValueCellFull!16535 (v!20114 V!51593)) (EmptyCell!16535) )
))
(declare-datatypes ((array!86785 0))(
  ( (array!86786 (arr!41883 (Array (_ BitVec 32) ValueCell!16535)) (size!42434 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86785)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun call!64108 () ListLongMap!20273)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6155 (array!86783 array!86785 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20273)

(assert (=> bm!64105 (= call!64108 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64106 () Bool)

(assert (=> bm!64106 (= call!64109 call!64111)))

(declare-fun mapNonEmpty!53880 () Bool)

(declare-fun mapRes!53880 () Bool)

(declare-fun tp!102818 () Bool)

(declare-fun e!743450 () Bool)

(assert (=> mapNonEmpty!53880 (= mapRes!53880 (and tp!102818 e!743450))))

(declare-fun mapRest!53880 () (Array (_ BitVec 32) ValueCell!16535))

(declare-fun mapValue!53880 () ValueCell!16535)

(declare-fun mapKey!53880 () (_ BitVec 32))

(assert (=> mapNonEmpty!53880 (= (arr!41883 _values!1445) (store mapRest!53880 mapKey!53880 mapValue!53880))))

(declare-fun b!1303272 () Bool)

(declare-fun e!743458 () Bool)

(assert (=> b!1303272 (= e!743457 (not e!743458))))

(declare-fun res!865419 () Bool)

(assert (=> b!1303272 (=> res!865419 e!743458)))

(assert (=> b!1303272 (= res!865419 (not (= k0!1205 (select (arr!41882 _keys!1741) from!2144))))))

(declare-fun contains!8292 (ListLongMap!20273 (_ BitVec 64)) Bool)

(assert (=> b!1303272 (not (contains!8292 (ListLongMap!20274 Nil!29756) k0!1205))))

(declare-fun lt!582830 () Unit!43071)

(declare-fun emptyContainsNothing!209 ((_ BitVec 64)) Unit!43071)

(assert (=> b!1303272 (= lt!582830 (emptyContainsNothing!209 k0!1205))))

(declare-fun lt!582835 () Unit!43071)

(declare-fun e!743454 () Unit!43071)

(assert (=> b!1303272 (= lt!582835 e!743454)))

(declare-fun lt!582827 () Bool)

(assert (=> b!1303272 (= c!125280 (and (not lt!582827) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1303272 (= lt!582827 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1303273 () Bool)

(declare-fun tp_is_empty!34867 () Bool)

(assert (=> b!1303273 (= e!743450 tp_is_empty!34867)))

(declare-fun bm!64107 () Bool)

(declare-fun call!64112 () Bool)

(assert (=> bm!64107 (= call!64107 call!64112)))

(declare-fun b!1303274 () Bool)

(declare-fun res!865416 () Bool)

(assert (=> b!1303274 (=> (not res!865416) (not e!743457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86783 (_ BitVec 32)) Bool)

(assert (=> b!1303274 (= res!865416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303275 () Bool)

(declare-fun e!743456 () Bool)

(declare-fun e!743452 () Bool)

(assert (=> b!1303275 (= e!743456 (and e!743452 mapRes!53880))))

(declare-fun condMapEmpty!53880 () Bool)

(declare-fun mapDefault!53880 () ValueCell!16535)

(assert (=> b!1303275 (= condMapEmpty!53880 (= (arr!41883 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16535)) mapDefault!53880)))))

(declare-fun mapIsEmpty!53880 () Bool)

(assert (=> mapIsEmpty!53880 mapRes!53880))

(declare-fun b!1303276 () Bool)

(declare-fun res!865415 () Bool)

(assert (=> b!1303276 (=> (not res!865415) (not e!743457))))

(assert (=> b!1303276 (= res!865415 (and (= (size!42434 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42433 _keys!1741) (size!42434 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303277 () Bool)

(declare-fun c!125279 () Bool)

(assert (=> b!1303277 (= c!125279 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582827))))

(declare-fun e!743451 () Unit!43071)

(assert (=> b!1303277 (= e!743451 e!743453)))

(declare-fun b!1303278 () Bool)

(declare-fun Unit!43073 () Unit!43071)

(assert (=> b!1303278 (= e!743453 Unit!43073)))

(declare-fun bm!64108 () Bool)

(assert (=> bm!64108 (= call!64112 (contains!8292 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836)) k0!1205))))

(declare-fun b!1303279 () Bool)

(declare-fun arrayContainsKey!0 (array!86783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303279 (= e!743458 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(declare-fun res!865414 () Bool)

(assert (=> start!110126 (=> (not res!865414) (not e!743457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110126 (= res!865414 (validMask!0 mask!2175))))

(assert (=> start!110126 e!743457))

(assert (=> start!110126 tp_is_empty!34867))

(assert (=> start!110126 true))

(declare-fun array_inv!31927 (array!86785) Bool)

(assert (=> start!110126 (and (array_inv!31927 _values!1445) e!743456)))

(declare-fun array_inv!31928 (array!86783) Bool)

(assert (=> start!110126 (array_inv!31928 _keys!1741)))

(assert (=> start!110126 tp!102819))

(declare-fun b!1303280 () Bool)

(declare-fun lt!582826 () Unit!43071)

(assert (=> b!1303280 (= e!743454 lt!582826)))

(assert (=> b!1303280 (= lt!582828 call!64108)))

(declare-fun lt!582834 () ListLongMap!20273)

(declare-fun +!4517 (ListLongMap!20273 tuple2!22608) ListLongMap!20273)

(assert (=> b!1303280 (= lt!582834 (+!4517 lt!582828 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582829 () Unit!43071)

(assert (=> b!1303280 (= lt!582829 (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582834))))

(assert (=> b!1303280 (contains!8292 lt!582834 k0!1205)))

(assert (=> b!1303280 (= lt!582826 call!64111)))

(assert (=> b!1303280 call!64112))

(declare-fun b!1303281 () Bool)

(declare-fun res!865417 () Bool)

(assert (=> b!1303281 (=> (not res!865417) (not e!743457))))

(declare-fun getCurrentListMap!5164 (array!86783 array!86785 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20273)

(assert (=> b!1303281 (= res!865417 (contains!8292 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!64109 () Bool)

(assert (=> bm!64109 (= call!64110 call!64108)))

(declare-fun b!1303282 () Bool)

(assert (=> b!1303282 (= e!743452 tp_is_empty!34867)))

(declare-fun b!1303283 () Bool)

(assert (=> b!1303283 (= e!743454 e!743451)))

(assert (=> b!1303283 (= c!125278 (and (not lt!582827) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303284 () Bool)

(assert (=> b!1303284 call!64107))

(declare-fun lt!582832 () Unit!43071)

(assert (=> b!1303284 (= lt!582832 call!64109)))

(assert (=> b!1303284 (= lt!582833 call!64110)))

(assert (=> b!1303284 (= e!743451 lt!582832)))

(assert (= (and start!110126 res!865414) b!1303276))

(assert (= (and b!1303276 res!865415) b!1303274))

(assert (= (and b!1303274 res!865416) b!1303271))

(assert (= (and b!1303271 res!865421) b!1303267))

(assert (= (and b!1303267 res!865422) b!1303281))

(assert (= (and b!1303281 res!865417) b!1303270))

(assert (= (and b!1303270 res!865420) b!1303269))

(assert (= (and b!1303269 res!865418) b!1303272))

(assert (= (and b!1303272 c!125280) b!1303280))

(assert (= (and b!1303272 (not c!125280)) b!1303283))

(assert (= (and b!1303283 c!125278) b!1303284))

(assert (= (and b!1303283 (not c!125278)) b!1303277))

(assert (= (and b!1303277 c!125279) b!1303268))

(assert (= (and b!1303277 (not c!125279)) b!1303278))

(assert (= (or b!1303284 b!1303268) bm!64109))

(assert (= (or b!1303284 b!1303268) bm!64106))

(assert (= (or b!1303284 b!1303268) bm!64107))

(assert (= (or b!1303280 bm!64109) bm!64105))

(assert (= (or b!1303280 bm!64106) bm!64104))

(assert (= (or b!1303280 bm!64107) bm!64108))

(assert (= (and b!1303272 (not res!865419)) b!1303279))

(assert (= (and b!1303275 condMapEmpty!53880) mapIsEmpty!53880))

(assert (= (and b!1303275 (not condMapEmpty!53880)) mapNonEmpty!53880))

(get-info :version)

(assert (= (and mapNonEmpty!53880 ((_ is ValueCellFull!16535) mapValue!53880)) b!1303273))

(assert (= (and b!1303275 ((_ is ValueCellFull!16535) mapDefault!53880)) b!1303282))

(assert (= start!110126 b!1303275))

(declare-fun m!1194415 () Bool)

(assert (=> bm!64108 m!1194415))

(declare-fun m!1194417 () Bool)

(assert (=> b!1303274 m!1194417))

(declare-fun m!1194419 () Bool)

(assert (=> bm!64105 m!1194419))

(declare-fun m!1194421 () Bool)

(assert (=> bm!64104 m!1194421))

(declare-fun m!1194423 () Bool)

(assert (=> start!110126 m!1194423))

(declare-fun m!1194425 () Bool)

(assert (=> start!110126 m!1194425))

(declare-fun m!1194427 () Bool)

(assert (=> start!110126 m!1194427))

(declare-fun m!1194429 () Bool)

(assert (=> mapNonEmpty!53880 m!1194429))

(declare-fun m!1194431 () Bool)

(assert (=> b!1303280 m!1194431))

(declare-fun m!1194433 () Bool)

(assert (=> b!1303280 m!1194433))

(declare-fun m!1194435 () Bool)

(assert (=> b!1303280 m!1194435))

(declare-fun m!1194437 () Bool)

(assert (=> b!1303281 m!1194437))

(assert (=> b!1303281 m!1194437))

(declare-fun m!1194439 () Bool)

(assert (=> b!1303281 m!1194439))

(declare-fun m!1194441 () Bool)

(assert (=> b!1303269 m!1194441))

(assert (=> b!1303269 m!1194441))

(declare-fun m!1194443 () Bool)

(assert (=> b!1303269 m!1194443))

(declare-fun m!1194445 () Bool)

(assert (=> b!1303279 m!1194445))

(declare-fun m!1194447 () Bool)

(assert (=> b!1303271 m!1194447))

(assert (=> b!1303272 m!1194441))

(declare-fun m!1194449 () Bool)

(assert (=> b!1303272 m!1194449))

(declare-fun m!1194451 () Bool)

(assert (=> b!1303272 m!1194451))

(check-sat (not start!110126) (not b!1303274) (not b!1303279) (not b_next!29227) (not bm!64104) (not b!1303269) b_and!47365 (not b!1303271) (not bm!64108) (not mapNonEmpty!53880) (not bm!64105) (not b!1303281) (not b!1303272) tp_is_empty!34867 (not b!1303280))
(check-sat b_and!47365 (not b_next!29227))
(get-model)

(declare-fun d!141845 () Bool)

(declare-fun e!743515 () Bool)

(assert (=> d!141845 e!743515))

(declare-fun res!865482 () Bool)

(assert (=> d!141845 (=> (not res!865482) (not e!743515))))

(declare-fun lt!582914 () ListLongMap!20273)

(assert (=> d!141845 (= res!865482 (contains!8292 lt!582914 (_1!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582913 () List!29759)

(assert (=> d!141845 (= lt!582914 (ListLongMap!20274 lt!582913))))

(declare-fun lt!582911 () Unit!43071)

(declare-fun lt!582912 () Unit!43071)

(assert (=> d!141845 (= lt!582911 lt!582912)))

(declare-datatypes ((Option!748 0))(
  ( (Some!747 (v!20117 V!51593)) (None!746) )
))
(declare-fun getValueByKey!697 (List!29759 (_ BitVec 64)) Option!748)

(assert (=> d!141845 (= (getValueByKey!697 lt!582913 (_1!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!747 (_2!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!348 (List!29759 (_ BitVec 64) V!51593) Unit!43071)

(assert (=> d!141845 (= lt!582912 (lemmaContainsTupThenGetReturnValue!348 lt!582913 (_1!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!477 (List!29759 (_ BitVec 64) V!51593) List!29759)

(assert (=> d!141845 (= lt!582913 (insertStrictlySorted!477 (toList!10152 lt!582828) (_1!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141845 (= (+!4517 lt!582828 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582914)))

(declare-fun b!1303397 () Bool)

(declare-fun res!865481 () Bool)

(assert (=> b!1303397 (=> (not res!865481) (not e!743515))))

(assert (=> b!1303397 (= res!865481 (= (getValueByKey!697 (toList!10152 lt!582914) (_1!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!747 (_2!11315 (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1303398 () Bool)

(declare-fun contains!8295 (List!29759 tuple2!22608) Bool)

(assert (=> b!1303398 (= e!743515 (contains!8295 (toList!10152 lt!582914) (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141845 res!865482) b!1303397))

(assert (= (and b!1303397 res!865481) b!1303398))

(declare-fun m!1194529 () Bool)

(assert (=> d!141845 m!1194529))

(declare-fun m!1194531 () Bool)

(assert (=> d!141845 m!1194531))

(declare-fun m!1194533 () Bool)

(assert (=> d!141845 m!1194533))

(declare-fun m!1194535 () Bool)

(assert (=> d!141845 m!1194535))

(declare-fun m!1194537 () Bool)

(assert (=> b!1303397 m!1194537))

(declare-fun m!1194539 () Bool)

(assert (=> b!1303398 m!1194539))

(assert (=> b!1303280 d!141845))

(declare-fun d!141847 () Bool)

(assert (=> d!141847 (contains!8292 lt!582834 k0!1205)))

(declare-fun lt!582917 () Unit!43071)

(declare-fun choose!1913 ((_ BitVec 64) (_ BitVec 64) V!51593 ListLongMap!20273) Unit!43071)

(assert (=> d!141847 (= lt!582917 (choose!1913 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582834))))

(assert (=> d!141847 (contains!8292 (+!4517 lt!582834 (tuple2!22609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))

(assert (=> d!141847 (= (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582834) lt!582917)))

(declare-fun bs!37096 () Bool)

(assert (= bs!37096 d!141847))

(assert (=> bs!37096 m!1194435))

(declare-fun m!1194541 () Bool)

(assert (=> bs!37096 m!1194541))

(declare-fun m!1194543 () Bool)

(assert (=> bs!37096 m!1194543))

(assert (=> bs!37096 m!1194543))

(declare-fun m!1194545 () Bool)

(assert (=> bs!37096 m!1194545))

(assert (=> b!1303280 d!141847))

(declare-fun d!141849 () Bool)

(declare-fun e!743520 () Bool)

(assert (=> d!141849 e!743520))

(declare-fun res!865485 () Bool)

(assert (=> d!141849 (=> res!865485 e!743520)))

(declare-fun lt!582926 () Bool)

(assert (=> d!141849 (= res!865485 (not lt!582926))))

(declare-fun lt!582928 () Bool)

(assert (=> d!141849 (= lt!582926 lt!582928)))

(declare-fun lt!582927 () Unit!43071)

(declare-fun e!743521 () Unit!43071)

(assert (=> d!141849 (= lt!582927 e!743521)))

(declare-fun c!125301 () Bool)

(assert (=> d!141849 (= c!125301 lt!582928)))

(declare-fun containsKey!723 (List!29759 (_ BitVec 64)) Bool)

(assert (=> d!141849 (= lt!582928 (containsKey!723 (toList!10152 lt!582834) k0!1205))))

(assert (=> d!141849 (= (contains!8292 lt!582834 k0!1205) lt!582926)))

(declare-fun b!1303405 () Bool)

(declare-fun lt!582929 () Unit!43071)

(assert (=> b!1303405 (= e!743521 lt!582929)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!469 (List!29759 (_ BitVec 64)) Unit!43071)

(assert (=> b!1303405 (= lt!582929 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10152 lt!582834) k0!1205))))

(declare-fun isDefined!506 (Option!748) Bool)

(assert (=> b!1303405 (isDefined!506 (getValueByKey!697 (toList!10152 lt!582834) k0!1205))))

(declare-fun b!1303406 () Bool)

(declare-fun Unit!43080 () Unit!43071)

(assert (=> b!1303406 (= e!743521 Unit!43080)))

(declare-fun b!1303407 () Bool)

(assert (=> b!1303407 (= e!743520 (isDefined!506 (getValueByKey!697 (toList!10152 lt!582834) k0!1205)))))

(assert (= (and d!141849 c!125301) b!1303405))

(assert (= (and d!141849 (not c!125301)) b!1303406))

(assert (= (and d!141849 (not res!865485)) b!1303407))

(declare-fun m!1194547 () Bool)

(assert (=> d!141849 m!1194547))

(declare-fun m!1194549 () Bool)

(assert (=> b!1303405 m!1194549))

(declare-fun m!1194551 () Bool)

(assert (=> b!1303405 m!1194551))

(assert (=> b!1303405 m!1194551))

(declare-fun m!1194553 () Bool)

(assert (=> b!1303405 m!1194553))

(assert (=> b!1303407 m!1194551))

(assert (=> b!1303407 m!1194551))

(assert (=> b!1303407 m!1194553))

(assert (=> b!1303280 d!141849))

(declare-fun d!141851 () Bool)

(declare-fun e!743522 () Bool)

(assert (=> d!141851 e!743522))

(declare-fun res!865486 () Bool)

(assert (=> d!141851 (=> res!865486 e!743522)))

(declare-fun lt!582930 () Bool)

(assert (=> d!141851 (= res!865486 (not lt!582930))))

(declare-fun lt!582932 () Bool)

(assert (=> d!141851 (= lt!582930 lt!582932)))

(declare-fun lt!582931 () Unit!43071)

(declare-fun e!743523 () Unit!43071)

(assert (=> d!141851 (= lt!582931 e!743523)))

(declare-fun c!125302 () Bool)

(assert (=> d!141851 (= c!125302 lt!582932)))

(assert (=> d!141851 (= lt!582932 (containsKey!723 (toList!10152 (ListLongMap!20274 Nil!29756)) k0!1205))))

(assert (=> d!141851 (= (contains!8292 (ListLongMap!20274 Nil!29756) k0!1205) lt!582930)))

(declare-fun b!1303408 () Bool)

(declare-fun lt!582933 () Unit!43071)

(assert (=> b!1303408 (= e!743523 lt!582933)))

(assert (=> b!1303408 (= lt!582933 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10152 (ListLongMap!20274 Nil!29756)) k0!1205))))

(assert (=> b!1303408 (isDefined!506 (getValueByKey!697 (toList!10152 (ListLongMap!20274 Nil!29756)) k0!1205))))

(declare-fun b!1303409 () Bool)

(declare-fun Unit!43081 () Unit!43071)

(assert (=> b!1303409 (= e!743523 Unit!43081)))

(declare-fun b!1303410 () Bool)

(assert (=> b!1303410 (= e!743522 (isDefined!506 (getValueByKey!697 (toList!10152 (ListLongMap!20274 Nil!29756)) k0!1205)))))

(assert (= (and d!141851 c!125302) b!1303408))

(assert (= (and d!141851 (not c!125302)) b!1303409))

(assert (= (and d!141851 (not res!865486)) b!1303410))

(declare-fun m!1194555 () Bool)

(assert (=> d!141851 m!1194555))

(declare-fun m!1194557 () Bool)

(assert (=> b!1303408 m!1194557))

(declare-fun m!1194559 () Bool)

(assert (=> b!1303408 m!1194559))

(assert (=> b!1303408 m!1194559))

(declare-fun m!1194561 () Bool)

(assert (=> b!1303408 m!1194561))

(assert (=> b!1303410 m!1194559))

(assert (=> b!1303410 m!1194559))

(assert (=> b!1303410 m!1194561))

(assert (=> b!1303272 d!141851))

(declare-fun d!141853 () Bool)

(assert (=> d!141853 (not (contains!8292 (ListLongMap!20274 Nil!29756) k0!1205))))

(declare-fun lt!582936 () Unit!43071)

(declare-fun choose!1914 ((_ BitVec 64)) Unit!43071)

(assert (=> d!141853 (= lt!582936 (choose!1914 k0!1205))))

(assert (=> d!141853 (= (emptyContainsNothing!209 k0!1205) lt!582936)))

(declare-fun bs!37097 () Bool)

(assert (= bs!37097 d!141853))

(assert (=> bs!37097 m!1194449))

(declare-fun m!1194563 () Bool)

(assert (=> bs!37097 m!1194563))

(assert (=> b!1303272 d!141853))

(declare-fun d!141855 () Bool)

(declare-fun e!743524 () Bool)

(assert (=> d!141855 e!743524))

(declare-fun res!865487 () Bool)

(assert (=> d!141855 (=> res!865487 e!743524)))

(declare-fun lt!582937 () Bool)

(assert (=> d!141855 (= res!865487 (not lt!582937))))

(declare-fun lt!582939 () Bool)

(assert (=> d!141855 (= lt!582937 lt!582939)))

(declare-fun lt!582938 () Unit!43071)

(declare-fun e!743525 () Unit!43071)

(assert (=> d!141855 (= lt!582938 e!743525)))

(declare-fun c!125303 () Bool)

(assert (=> d!141855 (= c!125303 lt!582939)))

(assert (=> d!141855 (= lt!582939 (containsKey!723 (toList!10152 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141855 (= (contains!8292 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582937)))

(declare-fun b!1303411 () Bool)

(declare-fun lt!582940 () Unit!43071)

(assert (=> b!1303411 (= e!743525 lt!582940)))

(assert (=> b!1303411 (= lt!582940 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10152 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303411 (isDefined!506 (getValueByKey!697 (toList!10152 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303412 () Bool)

(declare-fun Unit!43082 () Unit!43071)

(assert (=> b!1303412 (= e!743525 Unit!43082)))

(declare-fun b!1303413 () Bool)

(assert (=> b!1303413 (= e!743524 (isDefined!506 (getValueByKey!697 (toList!10152 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141855 c!125303) b!1303411))

(assert (= (and d!141855 (not c!125303)) b!1303412))

(assert (= (and d!141855 (not res!865487)) b!1303413))

(declare-fun m!1194565 () Bool)

(assert (=> d!141855 m!1194565))

(declare-fun m!1194567 () Bool)

(assert (=> b!1303411 m!1194567))

(declare-fun m!1194569 () Bool)

(assert (=> b!1303411 m!1194569))

(assert (=> b!1303411 m!1194569))

(declare-fun m!1194571 () Bool)

(assert (=> b!1303411 m!1194571))

(assert (=> b!1303413 m!1194569))

(assert (=> b!1303413 m!1194569))

(assert (=> b!1303413 m!1194571))

(assert (=> b!1303281 d!141855))

(declare-fun bm!64160 () Bool)

(declare-fun call!64164 () ListLongMap!20273)

(assert (=> bm!64160 (= call!64164 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303456 () Bool)

(declare-fun e!743554 () Bool)

(declare-fun e!743560 () Bool)

(assert (=> b!1303456 (= e!743554 e!743560)))

(declare-fun res!865511 () Bool)

(assert (=> b!1303456 (=> (not res!865511) (not e!743560))))

(declare-fun lt!583003 () ListLongMap!20273)

(assert (=> b!1303456 (= res!865511 (contains!8292 lt!583003 (select (arr!41882 _keys!1741) from!2144)))))

(assert (=> b!1303456 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741)))))

(declare-fun b!1303457 () Bool)

(declare-fun e!743558 () ListLongMap!20273)

(declare-fun e!743562 () ListLongMap!20273)

(assert (=> b!1303457 (= e!743558 e!743562)))

(declare-fun c!125317 () Bool)

(assert (=> b!1303457 (= c!125317 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1303458 () Bool)

(declare-fun e!743552 () Unit!43071)

(declare-fun lt!583001 () Unit!43071)

(assert (=> b!1303458 (= e!743552 lt!583001)))

(declare-fun lt!583005 () ListLongMap!20273)

(assert (=> b!1303458 (= lt!583005 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582993 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583006 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!583006 (select (arr!41882 _keys!1741) from!2144))))

(declare-fun lt!583004 () Unit!43071)

(declare-fun addStillContains!1114 (ListLongMap!20273 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!43071)

(assert (=> b!1303458 (= lt!583004 (addStillContains!1114 lt!583005 lt!582993 zeroValue!1387 lt!583006))))

(assert (=> b!1303458 (contains!8292 (+!4517 lt!583005 (tuple2!22609 lt!582993 zeroValue!1387)) lt!583006)))

(declare-fun lt!583000 () Unit!43071)

(assert (=> b!1303458 (= lt!583000 lt!583004)))

(declare-fun lt!582994 () ListLongMap!20273)

(assert (=> b!1303458 (= lt!582994 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583002 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!583002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582999 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582999 (select (arr!41882 _keys!1741) from!2144))))

(declare-fun lt!582992 () Unit!43071)

(declare-fun addApplyDifferent!556 (ListLongMap!20273 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!43071)

(assert (=> b!1303458 (= lt!582992 (addApplyDifferent!556 lt!582994 lt!583002 minValue!1387 lt!582999))))

(declare-fun apply!1027 (ListLongMap!20273 (_ BitVec 64)) V!51593)

(assert (=> b!1303458 (= (apply!1027 (+!4517 lt!582994 (tuple2!22609 lt!583002 minValue!1387)) lt!582999) (apply!1027 lt!582994 lt!582999))))

(declare-fun lt!582988 () Unit!43071)

(assert (=> b!1303458 (= lt!582988 lt!582992)))

(declare-fun lt!582985 () ListLongMap!20273)

(assert (=> b!1303458 (= lt!582985 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582989 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582996 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582996 (select (arr!41882 _keys!1741) from!2144))))

(declare-fun lt!582986 () Unit!43071)

(assert (=> b!1303458 (= lt!582986 (addApplyDifferent!556 lt!582985 lt!582989 zeroValue!1387 lt!582996))))

(assert (=> b!1303458 (= (apply!1027 (+!4517 lt!582985 (tuple2!22609 lt!582989 zeroValue!1387)) lt!582996) (apply!1027 lt!582985 lt!582996))))

(declare-fun lt!582995 () Unit!43071)

(assert (=> b!1303458 (= lt!582995 lt!582986)))

(declare-fun lt!582991 () ListLongMap!20273)

(assert (=> b!1303458 (= lt!582991 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582998 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582998 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582990 () (_ BitVec 64))

(assert (=> b!1303458 (= lt!582990 (select (arr!41882 _keys!1741) from!2144))))

(assert (=> b!1303458 (= lt!583001 (addApplyDifferent!556 lt!582991 lt!582998 minValue!1387 lt!582990))))

(assert (=> b!1303458 (= (apply!1027 (+!4517 lt!582991 (tuple2!22609 lt!582998 minValue!1387)) lt!582990) (apply!1027 lt!582991 lt!582990))))

(declare-fun b!1303459 () Bool)

(declare-fun e!743563 () Bool)

(declare-fun call!64165 () Bool)

(assert (=> b!1303459 (= e!743563 (not call!64165))))

(declare-fun bm!64161 () Bool)

(declare-fun call!64169 () ListLongMap!20273)

(declare-fun call!64167 () ListLongMap!20273)

(assert (=> bm!64161 (= call!64169 call!64167)))

(declare-fun b!1303460 () Bool)

(declare-fun e!743555 () Bool)

(assert (=> b!1303460 (= e!743555 (= (apply!1027 lt!583003 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1303461 () Bool)

(declare-fun e!743556 () ListLongMap!20273)

(declare-fun call!64163 () ListLongMap!20273)

(assert (=> b!1303461 (= e!743556 call!64163)))

(declare-fun b!1303463 () Bool)

(declare-fun e!743553 () Bool)

(assert (=> b!1303463 (= e!743553 (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)))))

(declare-fun b!1303464 () Bool)

(declare-fun e!743559 () Bool)

(declare-fun e!743564 () Bool)

(assert (=> b!1303464 (= e!743559 e!743564)))

(declare-fun c!125319 () Bool)

(assert (=> b!1303464 (= c!125319 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!125320 () Bool)

(declare-fun bm!64162 () Bool)

(declare-fun call!64166 () ListLongMap!20273)

(assert (=> bm!64162 (= call!64167 (+!4517 (ite c!125320 call!64164 (ite c!125317 call!64166 call!64163)) (ite (or c!125320 c!125317) (tuple2!22609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1303465 () Bool)

(declare-fun e!743561 () Bool)

(assert (=> b!1303465 (= e!743561 (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)))))

(declare-fun bm!64163 () Bool)

(assert (=> bm!64163 (= call!64166 call!64164)))

(declare-fun b!1303466 () Bool)

(assert (=> b!1303466 (= e!743564 e!743555)))

(declare-fun res!865514 () Bool)

(declare-fun call!64168 () Bool)

(assert (=> b!1303466 (= res!865514 call!64168)))

(assert (=> b!1303466 (=> (not res!865514) (not e!743555))))

(declare-fun b!1303467 () Bool)

(declare-fun Unit!43083 () Unit!43071)

(assert (=> b!1303467 (= e!743552 Unit!43083)))

(declare-fun b!1303468 () Bool)

(assert (=> b!1303468 (= e!743562 call!64169)))

(declare-fun b!1303469 () Bool)

(assert (=> b!1303469 (= e!743558 (+!4517 call!64167 (tuple2!22609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1303470 () Bool)

(declare-fun get!21196 (ValueCell!16535 V!51593) V!51593)

(declare-fun dynLambda!3488 (Int (_ BitVec 64)) V!51593)

(assert (=> b!1303470 (= e!743560 (= (apply!1027 lt!583003 (select (arr!41882 _keys!1741) from!2144)) (get!21196 (select (arr!41883 _values!1445) from!2144) (dynLambda!3488 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303470 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42434 _values!1445)))))

(assert (=> b!1303470 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741)))))

(declare-fun b!1303471 () Bool)

(assert (=> b!1303471 (= e!743556 call!64169)))

(declare-fun b!1303472 () Bool)

(declare-fun e!743557 () Bool)

(assert (=> b!1303472 (= e!743557 (= (apply!1027 lt!583003 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1303473 () Bool)

(assert (=> b!1303473 (= e!743564 (not call!64168))))

(declare-fun bm!64164 () Bool)

(assert (=> bm!64164 (= call!64165 (contains!8292 lt!583003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303474 () Bool)

(assert (=> b!1303474 (= e!743563 e!743557)))

(declare-fun res!865507 () Bool)

(assert (=> b!1303474 (= res!865507 call!64165)))

(assert (=> b!1303474 (=> (not res!865507) (not e!743557))))

(declare-fun bm!64165 () Bool)

(assert (=> bm!64165 (= call!64163 call!64166)))

(declare-fun d!141857 () Bool)

(assert (=> d!141857 e!743559))

(declare-fun res!865508 () Bool)

(assert (=> d!141857 (=> (not res!865508) (not e!743559))))

(assert (=> d!141857 (= res!865508 (or (bvsge from!2144 (size!42433 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741)))))))

(declare-fun lt!582997 () ListLongMap!20273)

(assert (=> d!141857 (= lt!583003 lt!582997)))

(declare-fun lt!582987 () Unit!43071)

(assert (=> d!141857 (= lt!582987 e!743552)))

(declare-fun c!125321 () Bool)

(assert (=> d!141857 (= c!125321 e!743561)))

(declare-fun res!865510 () Bool)

(assert (=> d!141857 (=> (not res!865510) (not e!743561))))

(assert (=> d!141857 (= res!865510 (bvslt from!2144 (size!42433 _keys!1741)))))

(assert (=> d!141857 (= lt!582997 e!743558)))

(assert (=> d!141857 (= c!125320 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141857 (validMask!0 mask!2175)))

(assert (=> d!141857 (= (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583003)))

(declare-fun b!1303462 () Bool)

(declare-fun c!125318 () Bool)

(assert (=> b!1303462 (= c!125318 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303462 (= e!743562 e!743556)))

(declare-fun b!1303475 () Bool)

(declare-fun res!865513 () Bool)

(assert (=> b!1303475 (=> (not res!865513) (not e!743559))))

(assert (=> b!1303475 (= res!865513 e!743563)))

(declare-fun c!125316 () Bool)

(assert (=> b!1303475 (= c!125316 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64166 () Bool)

(assert (=> bm!64166 (= call!64168 (contains!8292 lt!583003 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303476 () Bool)

(declare-fun res!865512 () Bool)

(assert (=> b!1303476 (=> (not res!865512) (not e!743559))))

(assert (=> b!1303476 (= res!865512 e!743554)))

(declare-fun res!865509 () Bool)

(assert (=> b!1303476 (=> res!865509 e!743554)))

(assert (=> b!1303476 (= res!865509 (not e!743553))))

(declare-fun res!865506 () Bool)

(assert (=> b!1303476 (=> (not res!865506) (not e!743553))))

(assert (=> b!1303476 (= res!865506 (bvslt from!2144 (size!42433 _keys!1741)))))

(assert (= (and d!141857 c!125320) b!1303469))

(assert (= (and d!141857 (not c!125320)) b!1303457))

(assert (= (and b!1303457 c!125317) b!1303468))

(assert (= (and b!1303457 (not c!125317)) b!1303462))

(assert (= (and b!1303462 c!125318) b!1303471))

(assert (= (and b!1303462 (not c!125318)) b!1303461))

(assert (= (or b!1303471 b!1303461) bm!64165))

(assert (= (or b!1303468 bm!64165) bm!64163))

(assert (= (or b!1303468 b!1303471) bm!64161))

(assert (= (or b!1303469 bm!64163) bm!64160))

(assert (= (or b!1303469 bm!64161) bm!64162))

(assert (= (and d!141857 res!865510) b!1303465))

(assert (= (and d!141857 c!125321) b!1303458))

(assert (= (and d!141857 (not c!125321)) b!1303467))

(assert (= (and d!141857 res!865508) b!1303476))

(assert (= (and b!1303476 res!865506) b!1303463))

(assert (= (and b!1303476 (not res!865509)) b!1303456))

(assert (= (and b!1303456 res!865511) b!1303470))

(assert (= (and b!1303476 res!865512) b!1303475))

(assert (= (and b!1303475 c!125316) b!1303474))

(assert (= (and b!1303475 (not c!125316)) b!1303459))

(assert (= (and b!1303474 res!865507) b!1303472))

(assert (= (or b!1303474 b!1303459) bm!64164))

(assert (= (and b!1303475 res!865513) b!1303464))

(assert (= (and b!1303464 c!125319) b!1303466))

(assert (= (and b!1303464 (not c!125319)) b!1303473))

(assert (= (and b!1303466 res!865514) b!1303460))

(assert (= (or b!1303466 b!1303473) bm!64166))

(declare-fun b_lambda!23213 () Bool)

(assert (=> (not b_lambda!23213) (not b!1303470)))

(declare-fun t!43344 () Bool)

(declare-fun tb!11383 () Bool)

(assert (=> (and start!110126 (= defaultEntry!1448 defaultEntry!1448) t!43344) tb!11383))

(declare-fun result!23787 () Bool)

(assert (=> tb!11383 (= result!23787 tp_is_empty!34867)))

(assert (=> b!1303470 t!43344))

(declare-fun b_and!47371 () Bool)

(assert (= b_and!47365 (and (=> t!43344 result!23787) b_and!47371)))

(declare-fun m!1194573 () Bool)

(assert (=> b!1303458 m!1194573))

(declare-fun m!1194575 () Bool)

(assert (=> b!1303458 m!1194575))

(declare-fun m!1194577 () Bool)

(assert (=> b!1303458 m!1194577))

(declare-fun m!1194579 () Bool)

(assert (=> b!1303458 m!1194579))

(declare-fun m!1194581 () Bool)

(assert (=> b!1303458 m!1194581))

(assert (=> b!1303458 m!1194573))

(declare-fun m!1194583 () Bool)

(assert (=> b!1303458 m!1194583))

(assert (=> b!1303458 m!1194441))

(assert (=> b!1303458 m!1194581))

(declare-fun m!1194585 () Bool)

(assert (=> b!1303458 m!1194585))

(declare-fun m!1194587 () Bool)

(assert (=> b!1303458 m!1194587))

(declare-fun m!1194589 () Bool)

(assert (=> b!1303458 m!1194589))

(declare-fun m!1194591 () Bool)

(assert (=> b!1303458 m!1194591))

(assert (=> b!1303458 m!1194419))

(declare-fun m!1194593 () Bool)

(assert (=> b!1303458 m!1194593))

(declare-fun m!1194595 () Bool)

(assert (=> b!1303458 m!1194595))

(assert (=> b!1303458 m!1194577))

(declare-fun m!1194597 () Bool)

(assert (=> b!1303458 m!1194597))

(assert (=> b!1303458 m!1194589))

(declare-fun m!1194599 () Bool)

(assert (=> b!1303458 m!1194599))

(declare-fun m!1194601 () Bool)

(assert (=> b!1303458 m!1194601))

(declare-fun m!1194603 () Bool)

(assert (=> b!1303460 m!1194603))

(assert (=> b!1303456 m!1194441))

(assert (=> b!1303456 m!1194441))

(declare-fun m!1194605 () Bool)

(assert (=> b!1303456 m!1194605))

(declare-fun m!1194607 () Bool)

(assert (=> b!1303472 m!1194607))

(assert (=> bm!64160 m!1194419))

(assert (=> b!1303465 m!1194441))

(assert (=> b!1303465 m!1194441))

(assert (=> b!1303465 m!1194443))

(declare-fun m!1194609 () Bool)

(assert (=> b!1303469 m!1194609))

(assert (=> b!1303470 m!1194441))

(declare-fun m!1194611 () Bool)

(assert (=> b!1303470 m!1194611))

(declare-fun m!1194613 () Bool)

(assert (=> b!1303470 m!1194613))

(declare-fun m!1194615 () Bool)

(assert (=> b!1303470 m!1194615))

(declare-fun m!1194617 () Bool)

(assert (=> b!1303470 m!1194617))

(assert (=> b!1303470 m!1194441))

(assert (=> b!1303470 m!1194615))

(assert (=> b!1303470 m!1194613))

(assert (=> d!141857 m!1194423))

(declare-fun m!1194619 () Bool)

(assert (=> bm!64162 m!1194619))

(declare-fun m!1194621 () Bool)

(assert (=> bm!64164 m!1194621))

(assert (=> b!1303463 m!1194441))

(assert (=> b!1303463 m!1194441))

(assert (=> b!1303463 m!1194443))

(declare-fun m!1194623 () Bool)

(assert (=> bm!64166 m!1194623))

(assert (=> b!1303281 d!141857))

(declare-fun d!141859 () Bool)

(assert (=> d!141859 (= (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)) (and (not (= (select (arr!41882 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41882 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303269 d!141859))

(declare-fun b!1303487 () Bool)

(declare-fun e!743571 () Bool)

(declare-fun e!743573 () Bool)

(assert (=> b!1303487 (= e!743571 e!743573)))

(declare-fun c!125324 () Bool)

(assert (=> b!1303487 (= c!125324 (validKeyInArray!0 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303488 () Bool)

(declare-fun e!743572 () Bool)

(declare-fun call!64172 () Bool)

(assert (=> b!1303488 (= e!743572 call!64172)))

(declare-fun d!141861 () Bool)

(declare-fun res!865519 () Bool)

(assert (=> d!141861 (=> res!865519 e!743571)))

(assert (=> d!141861 (= res!865519 (bvsge #b00000000000000000000000000000000 (size!42433 _keys!1741)))))

(assert (=> d!141861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743571)))

(declare-fun b!1303489 () Bool)

(assert (=> b!1303489 (= e!743573 call!64172)))

(declare-fun b!1303490 () Bool)

(assert (=> b!1303490 (= e!743573 e!743572)))

(declare-fun lt!583014 () (_ BitVec 64))

(assert (=> b!1303490 (= lt!583014 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583015 () Unit!43071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86783 (_ BitVec 64) (_ BitVec 32)) Unit!43071)

(assert (=> b!1303490 (= lt!583015 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583014 #b00000000000000000000000000000000))))

(assert (=> b!1303490 (arrayContainsKey!0 _keys!1741 lt!583014 #b00000000000000000000000000000000)))

(declare-fun lt!583013 () Unit!43071)

(assert (=> b!1303490 (= lt!583013 lt!583015)))

(declare-fun res!865520 () Bool)

(declare-datatypes ((SeekEntryResult!9977 0))(
  ( (MissingZero!9977 (index!42279 (_ BitVec 32))) (Found!9977 (index!42280 (_ BitVec 32))) (Intermediate!9977 (undefined!10789 Bool) (index!42281 (_ BitVec 32)) (x!115629 (_ BitVec 32))) (Undefined!9977) (MissingVacant!9977 (index!42282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86783 (_ BitVec 32)) SeekEntryResult!9977)

(assert (=> b!1303490 (= res!865520 (= (seekEntryOrOpen!0 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9977 #b00000000000000000000000000000000)))))

(assert (=> b!1303490 (=> (not res!865520) (not e!743572))))

(declare-fun bm!64169 () Bool)

(assert (=> bm!64169 (= call!64172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141861 (not res!865519)) b!1303487))

(assert (= (and b!1303487 c!125324) b!1303490))

(assert (= (and b!1303487 (not c!125324)) b!1303489))

(assert (= (and b!1303490 res!865520) b!1303488))

(assert (= (or b!1303488 b!1303489) bm!64169))

(declare-fun m!1194625 () Bool)

(assert (=> b!1303487 m!1194625))

(assert (=> b!1303487 m!1194625))

(declare-fun m!1194627 () Bool)

(assert (=> b!1303487 m!1194627))

(assert (=> b!1303490 m!1194625))

(declare-fun m!1194629 () Bool)

(assert (=> b!1303490 m!1194629))

(declare-fun m!1194631 () Bool)

(assert (=> b!1303490 m!1194631))

(assert (=> b!1303490 m!1194625))

(declare-fun m!1194633 () Bool)

(assert (=> b!1303490 m!1194633))

(declare-fun m!1194635 () Bool)

(assert (=> bm!64169 m!1194635))

(assert (=> b!1303274 d!141861))

(declare-fun bm!64172 () Bool)

(declare-fun call!64175 () Bool)

(declare-fun c!125327 () Bool)

(assert (=> bm!64172 (= call!64175 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125327 (Cons!29756 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000) Nil!29757) Nil!29757)))))

(declare-fun d!141863 () Bool)

(declare-fun res!865527 () Bool)

(declare-fun e!743584 () Bool)

(assert (=> d!141863 (=> res!865527 e!743584)))

(assert (=> d!141863 (= res!865527 (bvsge #b00000000000000000000000000000000 (size!42433 _keys!1741)))))

(assert (=> d!141863 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29757) e!743584)))

(declare-fun b!1303501 () Bool)

(declare-fun e!743583 () Bool)

(assert (=> b!1303501 (= e!743584 e!743583)))

(declare-fun res!865529 () Bool)

(assert (=> b!1303501 (=> (not res!865529) (not e!743583))))

(declare-fun e!743585 () Bool)

(assert (=> b!1303501 (= res!865529 (not e!743585))))

(declare-fun res!865528 () Bool)

(assert (=> b!1303501 (=> (not res!865528) (not e!743585))))

(assert (=> b!1303501 (= res!865528 (validKeyInArray!0 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303502 () Bool)

(declare-fun e!743582 () Bool)

(assert (=> b!1303502 (= e!743582 call!64175)))

(declare-fun b!1303503 () Bool)

(declare-fun contains!8296 (List!29760 (_ BitVec 64)) Bool)

(assert (=> b!1303503 (= e!743585 (contains!8296 Nil!29757 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303504 () Bool)

(assert (=> b!1303504 (= e!743583 e!743582)))

(assert (=> b!1303504 (= c!125327 (validKeyInArray!0 (select (arr!41882 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303505 () Bool)

(assert (=> b!1303505 (= e!743582 call!64175)))

(assert (= (and d!141863 (not res!865527)) b!1303501))

(assert (= (and b!1303501 res!865528) b!1303503))

(assert (= (and b!1303501 res!865529) b!1303504))

(assert (= (and b!1303504 c!125327) b!1303502))

(assert (= (and b!1303504 (not c!125327)) b!1303505))

(assert (= (or b!1303502 b!1303505) bm!64172))

(assert (=> bm!64172 m!1194625))

(declare-fun m!1194637 () Bool)

(assert (=> bm!64172 m!1194637))

(assert (=> b!1303501 m!1194625))

(assert (=> b!1303501 m!1194625))

(assert (=> b!1303501 m!1194627))

(assert (=> b!1303503 m!1194625))

(assert (=> b!1303503 m!1194625))

(declare-fun m!1194639 () Bool)

(assert (=> b!1303503 m!1194639))

(assert (=> b!1303504 m!1194625))

(assert (=> b!1303504 m!1194625))

(assert (=> b!1303504 m!1194627))

(assert (=> b!1303271 d!141863))

(declare-fun b!1303530 () Bool)

(declare-fun e!743603 () ListLongMap!20273)

(assert (=> b!1303530 (= e!743603 (ListLongMap!20274 Nil!29756))))

(declare-fun b!1303532 () Bool)

(declare-fun e!743605 () ListLongMap!20273)

(declare-fun call!64178 () ListLongMap!20273)

(assert (=> b!1303532 (= e!743605 call!64178)))

(declare-fun b!1303533 () Bool)

(declare-fun res!865540 () Bool)

(declare-fun e!743606 () Bool)

(assert (=> b!1303533 (=> (not res!865540) (not e!743606))))

(declare-fun lt!583031 () ListLongMap!20273)

(assert (=> b!1303533 (= res!865540 (not (contains!8292 lt!583031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303534 () Bool)

(declare-fun e!743602 () Bool)

(assert (=> b!1303534 (= e!743602 (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)))))

(assert (=> b!1303534 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303535 () Bool)

(declare-fun e!743604 () Bool)

(declare-fun isEmpty!1060 (ListLongMap!20273) Bool)

(assert (=> b!1303535 (= e!743604 (isEmpty!1060 lt!583031))))

(declare-fun b!1303536 () Bool)

(assert (=> b!1303536 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741)))))

(assert (=> b!1303536 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42434 _values!1445)))))

(declare-fun e!743601 () Bool)

(assert (=> b!1303536 (= e!743601 (= (apply!1027 lt!583031 (select (arr!41882 _keys!1741) from!2144)) (get!21196 (select (arr!41883 _values!1445) from!2144) (dynLambda!3488 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1303531 () Bool)

(declare-fun e!743600 () Bool)

(assert (=> b!1303531 (= e!743600 e!743601)))

(assert (=> b!1303531 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42433 _keys!1741)))))

(declare-fun res!865538 () Bool)

(assert (=> b!1303531 (= res!865538 (contains!8292 lt!583031 (select (arr!41882 _keys!1741) from!2144)))))

(assert (=> b!1303531 (=> (not res!865538) (not e!743601))))

(declare-fun d!141865 () Bool)

(assert (=> d!141865 e!743606))

(declare-fun res!865541 () Bool)

(assert (=> d!141865 (=> (not res!865541) (not e!743606))))

(assert (=> d!141865 (= res!865541 (not (contains!8292 lt!583031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141865 (= lt!583031 e!743603)))

(declare-fun c!125338 () Bool)

(assert (=> d!141865 (= c!125338 (bvsge from!2144 (size!42433 _keys!1741)))))

(assert (=> d!141865 (validMask!0 mask!2175)))

(assert (=> d!141865 (= (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583031)))

(declare-fun b!1303537 () Bool)

(assert (=> b!1303537 (= e!743600 e!743604)))

(declare-fun c!125337 () Bool)

(assert (=> b!1303537 (= c!125337 (bvslt from!2144 (size!42433 _keys!1741)))))

(declare-fun bm!64175 () Bool)

(assert (=> bm!64175 (= call!64178 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303538 () Bool)

(assert (=> b!1303538 (= e!743604 (= lt!583031 (getCurrentListMapNoExtraKeys!6155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303539 () Bool)

(assert (=> b!1303539 (= e!743603 e!743605)))

(declare-fun c!125336 () Bool)

(assert (=> b!1303539 (= c!125336 (validKeyInArray!0 (select (arr!41882 _keys!1741) from!2144)))))

(declare-fun b!1303540 () Bool)

(declare-fun lt!583036 () Unit!43071)

(declare-fun lt!583034 () Unit!43071)

(assert (=> b!1303540 (= lt!583036 lt!583034)))

(declare-fun lt!583035 () (_ BitVec 64))

(declare-fun lt!583032 () ListLongMap!20273)

(declare-fun lt!583033 () V!51593)

(declare-fun lt!583030 () (_ BitVec 64))

(assert (=> b!1303540 (not (contains!8292 (+!4517 lt!583032 (tuple2!22609 lt!583035 lt!583033)) lt!583030))))

(declare-fun addStillNotContains!470 (ListLongMap!20273 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!43071)

(assert (=> b!1303540 (= lt!583034 (addStillNotContains!470 lt!583032 lt!583035 lt!583033 lt!583030))))

(assert (=> b!1303540 (= lt!583030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303540 (= lt!583033 (get!21196 (select (arr!41883 _values!1445) from!2144) (dynLambda!3488 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303540 (= lt!583035 (select (arr!41882 _keys!1741) from!2144))))

(assert (=> b!1303540 (= lt!583032 call!64178)))

(assert (=> b!1303540 (= e!743605 (+!4517 call!64178 (tuple2!22609 (select (arr!41882 _keys!1741) from!2144) (get!21196 (select (arr!41883 _values!1445) from!2144) (dynLambda!3488 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303541 () Bool)

(assert (=> b!1303541 (= e!743606 e!743600)))

(declare-fun c!125339 () Bool)

(assert (=> b!1303541 (= c!125339 e!743602)))

(declare-fun res!865539 () Bool)

(assert (=> b!1303541 (=> (not res!865539) (not e!743602))))

(assert (=> b!1303541 (= res!865539 (bvslt from!2144 (size!42433 _keys!1741)))))

(assert (= (and d!141865 c!125338) b!1303530))

(assert (= (and d!141865 (not c!125338)) b!1303539))

(assert (= (and b!1303539 c!125336) b!1303540))

(assert (= (and b!1303539 (not c!125336)) b!1303532))

(assert (= (or b!1303540 b!1303532) bm!64175))

(assert (= (and d!141865 res!865541) b!1303533))

(assert (= (and b!1303533 res!865540) b!1303541))

(assert (= (and b!1303541 res!865539) b!1303534))

(assert (= (and b!1303541 c!125339) b!1303531))

(assert (= (and b!1303541 (not c!125339)) b!1303537))

(assert (= (and b!1303531 res!865538) b!1303536))

(assert (= (and b!1303537 c!125337) b!1303538))

(assert (= (and b!1303537 (not c!125337)) b!1303535))

(declare-fun b_lambda!23215 () Bool)

(assert (=> (not b_lambda!23215) (not b!1303536)))

(assert (=> b!1303536 t!43344))

(declare-fun b_and!47373 () Bool)

(assert (= b_and!47371 (and (=> t!43344 result!23787) b_and!47373)))

(declare-fun b_lambda!23217 () Bool)

(assert (=> (not b_lambda!23217) (not b!1303540)))

(assert (=> b!1303540 t!43344))

(declare-fun b_and!47375 () Bool)

(assert (= b_and!47373 (and (=> t!43344 result!23787) b_and!47375)))

(declare-fun m!1194641 () Bool)

(assert (=> d!141865 m!1194641))

(assert (=> d!141865 m!1194423))

(declare-fun m!1194643 () Bool)

(assert (=> b!1303540 m!1194643))

(declare-fun m!1194645 () Bool)

(assert (=> b!1303540 m!1194645))

(declare-fun m!1194647 () Bool)

(assert (=> b!1303540 m!1194647))

(assert (=> b!1303540 m!1194613))

(assert (=> b!1303540 m!1194613))

(assert (=> b!1303540 m!1194615))

(assert (=> b!1303540 m!1194617))

(assert (=> b!1303540 m!1194441))

(assert (=> b!1303540 m!1194643))

(assert (=> b!1303540 m!1194615))

(declare-fun m!1194649 () Bool)

(assert (=> b!1303540 m!1194649))

(declare-fun m!1194651 () Bool)

(assert (=> b!1303533 m!1194651))

(assert (=> b!1303534 m!1194441))

(assert (=> b!1303534 m!1194441))

(assert (=> b!1303534 m!1194443))

(assert (=> b!1303536 m!1194615))

(assert (=> b!1303536 m!1194613))

(assert (=> b!1303536 m!1194613))

(assert (=> b!1303536 m!1194615))

(assert (=> b!1303536 m!1194617))

(assert (=> b!1303536 m!1194441))

(declare-fun m!1194653 () Bool)

(assert (=> b!1303536 m!1194653))

(assert (=> b!1303536 m!1194441))

(declare-fun m!1194655 () Bool)

(assert (=> b!1303538 m!1194655))

(assert (=> bm!64175 m!1194655))

(assert (=> b!1303531 m!1194441))

(assert (=> b!1303531 m!1194441))

(declare-fun m!1194657 () Bool)

(assert (=> b!1303531 m!1194657))

(assert (=> b!1303539 m!1194441))

(assert (=> b!1303539 m!1194441))

(assert (=> b!1303539 m!1194443))

(declare-fun m!1194659 () Bool)

(assert (=> b!1303535 m!1194659))

(assert (=> bm!64105 d!141865))

(declare-fun d!141867 () Bool)

(assert (=> d!141867 (contains!8292 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836)) k0!1205)))

(declare-fun lt!583037 () Unit!43071)

(assert (=> d!141867 (= lt!583037 (choose!1913 k0!1205 (ite (or c!125280 c!125278) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125280 c!125278) zeroValue!1387 minValue!1387) (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))))))

(assert (=> d!141867 (contains!8292 (+!4517 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836)) (tuple2!22609 (ite (or c!125280 c!125278) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125280 c!125278) zeroValue!1387 minValue!1387))) k0!1205)))

(assert (=> d!141867 (= (lemmaInListMapAfterAddingDiffThenInBefore!91 k0!1205 (ite (or c!125280 c!125278) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125280 c!125278) zeroValue!1387 minValue!1387) (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))) lt!583037)))

(declare-fun bs!37098 () Bool)

(assert (= bs!37098 d!141867))

(assert (=> bs!37098 m!1194415))

(declare-fun m!1194661 () Bool)

(assert (=> bs!37098 m!1194661))

(declare-fun m!1194663 () Bool)

(assert (=> bs!37098 m!1194663))

(assert (=> bs!37098 m!1194663))

(declare-fun m!1194665 () Bool)

(assert (=> bs!37098 m!1194665))

(assert (=> bm!64104 d!141867))

(declare-fun d!141869 () Bool)

(declare-fun e!743607 () Bool)

(assert (=> d!141869 e!743607))

(declare-fun res!865542 () Bool)

(assert (=> d!141869 (=> res!865542 e!743607)))

(declare-fun lt!583038 () Bool)

(assert (=> d!141869 (= res!865542 (not lt!583038))))

(declare-fun lt!583040 () Bool)

(assert (=> d!141869 (= lt!583038 lt!583040)))

(declare-fun lt!583039 () Unit!43071)

(declare-fun e!743608 () Unit!43071)

(assert (=> d!141869 (= lt!583039 e!743608)))

(declare-fun c!125340 () Bool)

(assert (=> d!141869 (= c!125340 lt!583040)))

(assert (=> d!141869 (= lt!583040 (containsKey!723 (toList!10152 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))) k0!1205))))

(assert (=> d!141869 (= (contains!8292 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836)) k0!1205) lt!583038)))

(declare-fun b!1303542 () Bool)

(declare-fun lt!583041 () Unit!43071)

(assert (=> b!1303542 (= e!743608 lt!583041)))

(assert (=> b!1303542 (= lt!583041 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10152 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))) k0!1205))))

(assert (=> b!1303542 (isDefined!506 (getValueByKey!697 (toList!10152 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))) k0!1205))))

(declare-fun b!1303543 () Bool)

(declare-fun Unit!43084 () Unit!43071)

(assert (=> b!1303543 (= e!743608 Unit!43084)))

(declare-fun b!1303544 () Bool)

(assert (=> b!1303544 (= e!743607 (isDefined!506 (getValueByKey!697 (toList!10152 (ite c!125280 lt!582828 (ite c!125278 lt!582833 lt!582836))) k0!1205)))))

(assert (= (and d!141869 c!125340) b!1303542))

(assert (= (and d!141869 (not c!125340)) b!1303543))

(assert (= (and d!141869 (not res!865542)) b!1303544))

(declare-fun m!1194667 () Bool)

(assert (=> d!141869 m!1194667))

(declare-fun m!1194669 () Bool)

(assert (=> b!1303542 m!1194669))

(declare-fun m!1194671 () Bool)

(assert (=> b!1303542 m!1194671))

(assert (=> b!1303542 m!1194671))

(declare-fun m!1194673 () Bool)

(assert (=> b!1303542 m!1194673))

(assert (=> b!1303544 m!1194671))

(assert (=> b!1303544 m!1194671))

(assert (=> b!1303544 m!1194673))

(assert (=> bm!64108 d!141869))

(declare-fun d!141871 () Bool)

(assert (=> d!141871 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110126 d!141871))

(declare-fun d!141873 () Bool)

(assert (=> d!141873 (= (array_inv!31927 _values!1445) (bvsge (size!42434 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110126 d!141873))

(declare-fun d!141875 () Bool)

(assert (=> d!141875 (= (array_inv!31928 _keys!1741) (bvsge (size!42433 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110126 d!141875))

(declare-fun d!141877 () Bool)

(declare-fun res!865547 () Bool)

(declare-fun e!743613 () Bool)

(assert (=> d!141877 (=> res!865547 e!743613)))

(assert (=> d!141877 (= res!865547 (= (select (arr!41882 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141877 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!743613)))

(declare-fun b!1303549 () Bool)

(declare-fun e!743614 () Bool)

(assert (=> b!1303549 (= e!743613 e!743614)))

(declare-fun res!865548 () Bool)

(assert (=> b!1303549 (=> (not res!865548) (not e!743614))))

(assert (=> b!1303549 (= res!865548 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42433 _keys!1741)))))

(declare-fun b!1303550 () Bool)

(assert (=> b!1303550 (= e!743614 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141877 (not res!865547)) b!1303549))

(assert (= (and b!1303549 res!865548) b!1303550))

(assert (=> d!141877 m!1194441))

(declare-fun m!1194675 () Bool)

(assert (=> b!1303550 m!1194675))

(assert (=> b!1303279 d!141877))

(declare-fun mapIsEmpty!53889 () Bool)

(declare-fun mapRes!53889 () Bool)

(assert (=> mapIsEmpty!53889 mapRes!53889))

(declare-fun mapNonEmpty!53889 () Bool)

(declare-fun tp!102834 () Bool)

(declare-fun e!743619 () Bool)

(assert (=> mapNonEmpty!53889 (= mapRes!53889 (and tp!102834 e!743619))))

(declare-fun mapRest!53889 () (Array (_ BitVec 32) ValueCell!16535))

(declare-fun mapKey!53889 () (_ BitVec 32))

(declare-fun mapValue!53889 () ValueCell!16535)

(assert (=> mapNonEmpty!53889 (= mapRest!53880 (store mapRest!53889 mapKey!53889 mapValue!53889))))

(declare-fun b!1303557 () Bool)

(assert (=> b!1303557 (= e!743619 tp_is_empty!34867)))

(declare-fun b!1303558 () Bool)

(declare-fun e!743620 () Bool)

(assert (=> b!1303558 (= e!743620 tp_is_empty!34867)))

(declare-fun condMapEmpty!53889 () Bool)

(declare-fun mapDefault!53889 () ValueCell!16535)

(assert (=> mapNonEmpty!53880 (= condMapEmpty!53889 (= mapRest!53880 ((as const (Array (_ BitVec 32) ValueCell!16535)) mapDefault!53889)))))

(assert (=> mapNonEmpty!53880 (= tp!102818 (and e!743620 mapRes!53889))))

(assert (= (and mapNonEmpty!53880 condMapEmpty!53889) mapIsEmpty!53889))

(assert (= (and mapNonEmpty!53880 (not condMapEmpty!53889)) mapNonEmpty!53889))

(assert (= (and mapNonEmpty!53889 ((_ is ValueCellFull!16535) mapValue!53889)) b!1303557))

(assert (= (and mapNonEmpty!53880 ((_ is ValueCellFull!16535) mapDefault!53889)) b!1303558))

(declare-fun m!1194677 () Bool)

(assert (=> mapNonEmpty!53889 m!1194677))

(declare-fun b_lambda!23219 () Bool)

(assert (= b_lambda!23215 (or (and start!110126 b_free!29227) b_lambda!23219)))

(declare-fun b_lambda!23221 () Bool)

(assert (= b_lambda!23217 (or (and start!110126 b_free!29227) b_lambda!23221)))

(declare-fun b_lambda!23223 () Bool)

(assert (= b_lambda!23213 (or (and start!110126 b_free!29227) b_lambda!23223)))

(check-sat (not d!141845) (not b!1303465) (not d!141853) (not bm!64160) (not b!1303536) (not b!1303544) (not bm!64166) (not b!1303460) (not b!1303463) (not d!141869) (not mapNonEmpty!53889) (not b!1303538) (not b!1303504) (not b!1303469) (not bm!64162) (not b!1303472) (not bm!64164) (not d!141857) (not b!1303490) (not d!141865) (not bm!64172) (not d!141847) (not b!1303540) (not d!141855) (not b!1303411) (not bm!64169) (not d!141867) (not b!1303531) (not d!141851) (not b_next!29227) (not b!1303501) (not b!1303405) (not b!1303487) (not b!1303534) (not b_lambda!23219) (not b!1303407) (not bm!64175) (not b!1303539) (not b!1303413) (not d!141849) (not b!1303458) b_and!47375 (not b!1303410) (not b!1303470) (not b!1303398) (not b_lambda!23223) (not b_lambda!23221) (not b!1303542) (not b!1303408) (not b!1303397) (not b!1303550) (not b!1303503) (not b!1303535) tp_is_empty!34867 (not b!1303456) (not b!1303533))
(check-sat b_and!47375 (not b_next!29227))
