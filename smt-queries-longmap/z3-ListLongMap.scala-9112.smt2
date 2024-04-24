; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109680 () Bool)

(assert start!109680)

(declare-fun b_free!28945 () Bool)

(declare-fun b_next!28945 () Bool)

(assert (=> start!109680 (= b_free!28945 (not b_next!28945))))

(declare-fun tp!101953 () Bool)

(declare-fun b_and!47037 () Bool)

(assert (=> start!109680 (= tp!101953 b_and!47037)))

(declare-fun b!1297446 () Bool)

(declare-datatypes ((Unit!42899 0))(
  ( (Unit!42900) )
))
(declare-fun e!740333 () Unit!42899)

(declare-fun lt!580586 () Unit!42899)

(assert (=> b!1297446 (= e!740333 lt!580586)))

(declare-datatypes ((V!51217 0))(
  ( (V!51218 (val!17367 Int)) )
))
(declare-datatypes ((tuple2!22374 0))(
  ( (tuple2!22375 (_1!11198 (_ BitVec 64)) (_2!11198 V!51217)) )
))
(declare-datatypes ((List!29540 0))(
  ( (Nil!29537) (Cons!29536 (h!30754 tuple2!22374) (t!43096 List!29540)) )
))
(declare-datatypes ((ListLongMap!20039 0))(
  ( (ListLongMap!20040 (toList!10035 List!29540)) )
))
(declare-fun lt!580583 () ListLongMap!20039)

(declare-fun call!63285 () ListLongMap!20039)

(assert (=> b!1297446 (= lt!580583 call!63285)))

(declare-fun lt!580591 () Unit!42899)

(declare-fun call!63286 () Unit!42899)

(assert (=> b!1297446 (= lt!580591 call!63286)))

(declare-fun call!63283 () Bool)

(assert (=> b!1297446 (not call!63283)))

(declare-fun call!63282 () Unit!42899)

(assert (=> b!1297446 (= lt!580586 call!63282)))

(declare-fun call!63284 () Bool)

(assert (=> b!1297446 call!63284))

(declare-fun b!1297447 () Bool)

(declare-fun c!124742 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!580595 () Bool)

(assert (=> b!1297447 (= c!124742 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580595))))

(declare-fun e!740335 () Unit!42899)

(assert (=> b!1297447 (= e!740335 e!740333)))

(declare-fun b!1297448 () Bool)

(declare-fun e!740330 () Bool)

(declare-fun tp_is_empty!34585 () Bool)

(assert (=> b!1297448 (= e!740330 tp_is_empty!34585)))

(declare-fun mapNonEmpty!53438 () Bool)

(declare-fun mapRes!53438 () Bool)

(declare-fun tp!101954 () Bool)

(assert (=> mapNonEmpty!53438 (= mapRes!53438 (and tp!101954 e!740330))))

(declare-datatypes ((ValueCell!16394 0))(
  ( (ValueCellFull!16394 (v!19965 V!51217)) (EmptyCell!16394) )
))
(declare-fun mapValue!53438 () ValueCell!16394)

(declare-datatypes ((array!86223 0))(
  ( (array!86224 (arr!41608 (Array (_ BitVec 32) ValueCell!16394)) (size!42159 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86223)

(declare-fun mapRest!53438 () (Array (_ BitVec 32) ValueCell!16394))

(declare-fun mapKey!53438 () (_ BitVec 32))

(assert (=> mapNonEmpty!53438 (= (arr!41608 _values!1445) (store mapRest!53438 mapKey!53438 mapValue!53438))))

(declare-fun bm!63272 () Bool)

(declare-fun call!63275 () ListLongMap!20039)

(declare-fun call!63278 () ListLongMap!20039)

(assert (=> bm!63272 (= call!63275 call!63278)))

(declare-fun b!1297450 () Bool)

(declare-fun res!862017 () Bool)

(declare-fun e!740336 () Bool)

(assert (=> b!1297450 (=> (not res!862017) (not e!740336))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!86225 0))(
  ( (array!86226 (arr!41609 (Array (_ BitVec 32) (_ BitVec 64))) (size!42160 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86225)

(assert (=> b!1297450 (= res!862017 (and (= (size!42159 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42160 _keys!1741) (size!42159 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63273 () Bool)

(declare-fun call!63276 () Unit!42899)

(assert (=> bm!63273 (= call!63286 call!63276)))

(declare-fun b!1297451 () Bool)

(declare-fun e!740332 () Bool)

(assert (=> b!1297451 (= e!740332 tp_is_empty!34585)))

(declare-fun b!1297452 () Bool)

(assert (=> b!1297452 (= e!740336 (not true))))

(declare-fun lt!580594 () Unit!42899)

(declare-fun e!740334 () Unit!42899)

(assert (=> b!1297452 (= lt!580594 e!740334)))

(declare-fun c!124741 () Bool)

(assert (=> b!1297452 (= c!124741 (and (not lt!580595) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1297452 (= lt!580595 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8166 (ListLongMap!20039 (_ BitVec 64)) Bool)

(assert (=> b!1297452 (not (contains!8166 (ListLongMap!20040 Nil!29537) k0!1205))))

(declare-fun lt!580589 () Unit!42899)

(declare-fun emptyContainsNothing!190 ((_ BitVec 64)) Unit!42899)

(assert (=> b!1297452 (= lt!580589 (emptyContainsNothing!190 k0!1205))))

(declare-fun b!1297453 () Bool)

(declare-fun res!862019 () Bool)

(assert (=> b!1297453 (=> (not res!862019) (not e!740336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86225 (_ BitVec 32)) Bool)

(assert (=> b!1297453 (= res!862019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun minValue!1387 () V!51217)

(declare-fun zeroValue!1387 () V!51217)

(declare-fun c!124740 () Bool)

(declare-fun lt!580587 () ListLongMap!20039)

(declare-fun bm!63274 () Bool)

(declare-fun lt!580592 () ListLongMap!20039)

(declare-fun +!4478 (ListLongMap!20039 tuple2!22374) ListLongMap!20039)

(assert (=> bm!63274 (= call!63278 (+!4478 (ite c!124741 lt!580587 (ite c!124740 lt!580592 lt!580583)) (ite (or c!124741 c!124740) (tuple2!22375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1297454 () Bool)

(declare-fun res!862015 () Bool)

(assert (=> b!1297454 (=> (not res!862015) (not e!740336))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5056 (array!86225 array!86223 (_ BitVec 32) (_ BitVec 32) V!51217 V!51217 (_ BitVec 32) Int) ListLongMap!20039)

(assert (=> b!1297454 (= res!862015 (contains!8166 (getCurrentListMap!5056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63275 () Bool)

(declare-fun call!63277 () Bool)

(assert (=> bm!63275 (= call!63283 call!63277)))

(declare-fun b!1297455 () Bool)

(declare-fun res!862018 () Bool)

(assert (=> b!1297455 (=> (not res!862018) (not e!740336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297455 (= res!862018 (not (validKeyInArray!0 (select (arr!41609 _keys!1741) from!2144))))))

(declare-fun bm!63276 () Bool)

(declare-fun lt!580581 () ListLongMap!20039)

(assert (=> bm!63276 (= call!63277 (contains!8166 (ite c!124741 lt!580581 call!63275) k0!1205))))

(declare-fun mapIsEmpty!53438 () Bool)

(assert (=> mapIsEmpty!53438 mapRes!53438))

(declare-fun call!63280 () ListLongMap!20039)

(declare-fun bm!63277 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6120 (array!86225 array!86223 (_ BitVec 32) (_ BitVec 32) V!51217 V!51217 (_ BitVec 32) Int) ListLongMap!20039)

(assert (=> bm!63277 (= call!63280 (getCurrentListMapNoExtraKeys!6120 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297456 () Bool)

(assert (=> b!1297456 call!63284))

(declare-fun lt!580590 () Unit!42899)

(assert (=> b!1297456 (= lt!580590 call!63282)))

(assert (=> b!1297456 (not call!63283)))

(declare-fun lt!580585 () Unit!42899)

(assert (=> b!1297456 (= lt!580585 call!63286)))

(assert (=> b!1297456 (= lt!580592 call!63285)))

(assert (=> b!1297456 (= e!740335 lt!580590)))

(declare-fun bm!63278 () Bool)

(declare-fun call!63279 () Bool)

(assert (=> bm!63278 (= call!63284 call!63279)))

(declare-fun bm!63279 () Bool)

(declare-fun call!63281 () Unit!42899)

(assert (=> bm!63279 (= call!63282 call!63281)))

(declare-fun bm!63280 () Bool)

(assert (=> bm!63280 (= call!63279 (contains!8166 (ite c!124741 lt!580587 (ite c!124740 lt!580592 lt!580583)) k0!1205))))

(declare-fun b!1297457 () Bool)

(declare-fun res!862021 () Bool)

(assert (=> b!1297457 (=> (not res!862021) (not e!740336))))

(assert (=> b!1297457 (= res!862021 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42160 _keys!1741))))))

(declare-fun b!1297458 () Bool)

(declare-fun Unit!42901 () Unit!42899)

(assert (=> b!1297458 (= e!740333 Unit!42901)))

(declare-fun b!1297459 () Bool)

(declare-fun res!862014 () Bool)

(assert (=> b!1297459 (=> (not res!862014) (not e!740336))))

(declare-datatypes ((List!29541 0))(
  ( (Nil!29538) (Cons!29537 (h!30755 (_ BitVec 64)) (t!43097 List!29541)) )
))
(declare-fun arrayNoDuplicates!0 (array!86225 (_ BitVec 32) List!29541) Bool)

(assert (=> b!1297459 (= res!862014 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29538))))

(declare-fun b!1297460 () Bool)

(declare-fun e!740331 () Bool)

(assert (=> b!1297460 (= e!740331 (and e!740332 mapRes!53438))))

(declare-fun condMapEmpty!53438 () Bool)

(declare-fun mapDefault!53438 () ValueCell!16394)

(assert (=> b!1297460 (= condMapEmpty!53438 (= (arr!41608 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16394)) mapDefault!53438)))))

(declare-fun res!862020 () Bool)

(assert (=> start!109680 (=> (not res!862020) (not e!740336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109680 (= res!862020 (validMask!0 mask!2175))))

(assert (=> start!109680 e!740336))

(assert (=> start!109680 tp_is_empty!34585))

(assert (=> start!109680 true))

(declare-fun array_inv!31735 (array!86223) Bool)

(assert (=> start!109680 (and (array_inv!31735 _values!1445) e!740331)))

(declare-fun array_inv!31736 (array!86225) Bool)

(assert (=> start!109680 (array_inv!31736 _keys!1741)))

(assert (=> start!109680 tp!101953))

(declare-fun b!1297449 () Bool)

(declare-fun lt!580582 () Unit!42899)

(assert (=> b!1297449 (= e!740334 lt!580582)))

(assert (=> b!1297449 (= lt!580587 call!63280)))

(declare-fun lt!580584 () Unit!42899)

(declare-fun addStillNotContains!454 (ListLongMap!20039 (_ BitVec 64) V!51217 (_ BitVec 64)) Unit!42899)

(assert (=> b!1297449 (= lt!580584 (addStillNotContains!454 lt!580587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(assert (=> b!1297449 (= lt!580581 call!63278)))

(assert (=> b!1297449 (not call!63277)))

(declare-fun lt!580596 () Unit!42899)

(assert (=> b!1297449 (= lt!580596 call!63276)))

(assert (=> b!1297449 (not (contains!8166 (+!4478 lt!580587 (tuple2!22375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580593 () Unit!42899)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!66 ((_ BitVec 64) (_ BitVec 64) V!51217 ListLongMap!20039) Unit!42899)

(assert (=> b!1297449 (= lt!580593 (lemmaInListMapAfterAddingDiffThenInBefore!66 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580581))))

(assert (=> b!1297449 false))

(assert (=> b!1297449 (= lt!580582 call!63281)))

(declare-fun lt!580588 () Bool)

(assert (=> b!1297449 (= lt!580588 call!63279)))

(declare-fun bm!63281 () Bool)

(assert (=> bm!63281 (= call!63281 (lemmaInListMapAfterAddingDiffThenInBefore!66 k0!1205 (ite (or c!124741 c!124740) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124741 c!124740) zeroValue!1387 minValue!1387) (ite c!124741 lt!580587 (ite c!124740 lt!580592 lt!580583))))))

(declare-fun bm!63282 () Bool)

(assert (=> bm!63282 (= call!63285 call!63280)))

(declare-fun b!1297461 () Bool)

(assert (=> b!1297461 (= e!740334 e!740335)))

(assert (=> b!1297461 (= c!124740 (and (not lt!580595) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63283 () Bool)

(assert (=> bm!63283 (= call!63276 (addStillNotContains!454 (ite c!124741 lt!580587 (ite c!124740 lt!580592 lt!580583)) (ite c!124741 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124740 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124741 minValue!1387 (ite c!124740 zeroValue!1387 minValue!1387)) k0!1205))))

(declare-fun b!1297462 () Bool)

(declare-fun res!862016 () Bool)

(assert (=> b!1297462 (=> (not res!862016) (not e!740336))))

(assert (=> b!1297462 (= res!862016 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42160 _keys!1741))))))

(assert (= (and start!109680 res!862020) b!1297450))

(assert (= (and b!1297450 res!862017) b!1297453))

(assert (= (and b!1297453 res!862019) b!1297459))

(assert (= (and b!1297459 res!862014) b!1297462))

(assert (= (and b!1297462 res!862016) b!1297454))

(assert (= (and b!1297454 res!862015) b!1297457))

(assert (= (and b!1297457 res!862021) b!1297455))

(assert (= (and b!1297455 res!862018) b!1297452))

(assert (= (and b!1297452 c!124741) b!1297449))

(assert (= (and b!1297452 (not c!124741)) b!1297461))

(assert (= (and b!1297461 c!124740) b!1297456))

(assert (= (and b!1297461 (not c!124740)) b!1297447))

(assert (= (and b!1297447 c!124742) b!1297446))

(assert (= (and b!1297447 (not c!124742)) b!1297458))

(assert (= (or b!1297456 b!1297446) bm!63279))

(assert (= (or b!1297456 b!1297446) bm!63282))

(assert (= (or b!1297456 b!1297446) bm!63273))

(assert (= (or b!1297456 b!1297446) bm!63272))

(assert (= (or b!1297456 b!1297446) bm!63278))

(assert (= (or b!1297456 b!1297446) bm!63275))

(assert (= (or b!1297449 bm!63275) bm!63276))

(assert (= (or b!1297449 bm!63273) bm!63283))

(assert (= (or b!1297449 bm!63282) bm!63277))

(assert (= (or b!1297449 bm!63272) bm!63274))

(assert (= (or b!1297449 bm!63278) bm!63280))

(assert (= (or b!1297449 bm!63279) bm!63281))

(assert (= (and b!1297460 condMapEmpty!53438) mapIsEmpty!53438))

(assert (= (and b!1297460 (not condMapEmpty!53438)) mapNonEmpty!53438))

(get-info :version)

(assert (= (and mapNonEmpty!53438 ((_ is ValueCellFull!16394) mapValue!53438)) b!1297448))

(assert (= (and b!1297460 ((_ is ValueCellFull!16394) mapDefault!53438)) b!1297451))

(assert (= start!109680 b!1297460))

(declare-fun m!1189689 () Bool)

(assert (=> bm!63277 m!1189689))

(declare-fun m!1189691 () Bool)

(assert (=> bm!63274 m!1189691))

(declare-fun m!1189693 () Bool)

(assert (=> mapNonEmpty!53438 m!1189693))

(declare-fun m!1189695 () Bool)

(assert (=> b!1297455 m!1189695))

(assert (=> b!1297455 m!1189695))

(declare-fun m!1189697 () Bool)

(assert (=> b!1297455 m!1189697))

(declare-fun m!1189699 () Bool)

(assert (=> start!109680 m!1189699))

(declare-fun m!1189701 () Bool)

(assert (=> start!109680 m!1189701))

(declare-fun m!1189703 () Bool)

(assert (=> start!109680 m!1189703))

(declare-fun m!1189705 () Bool)

(assert (=> bm!63276 m!1189705))

(declare-fun m!1189707 () Bool)

(assert (=> b!1297449 m!1189707))

(declare-fun m!1189709 () Bool)

(assert (=> b!1297449 m!1189709))

(assert (=> b!1297449 m!1189709))

(declare-fun m!1189711 () Bool)

(assert (=> b!1297449 m!1189711))

(declare-fun m!1189713 () Bool)

(assert (=> b!1297449 m!1189713))

(declare-fun m!1189715 () Bool)

(assert (=> b!1297453 m!1189715))

(declare-fun m!1189717 () Bool)

(assert (=> b!1297452 m!1189717))

(declare-fun m!1189719 () Bool)

(assert (=> b!1297452 m!1189719))

(declare-fun m!1189721 () Bool)

(assert (=> bm!63281 m!1189721))

(declare-fun m!1189723 () Bool)

(assert (=> b!1297459 m!1189723))

(declare-fun m!1189725 () Bool)

(assert (=> b!1297454 m!1189725))

(assert (=> b!1297454 m!1189725))

(declare-fun m!1189727 () Bool)

(assert (=> b!1297454 m!1189727))

(declare-fun m!1189729 () Bool)

(assert (=> bm!63280 m!1189729))

(declare-fun m!1189731 () Bool)

(assert (=> bm!63283 m!1189731))

(check-sat (not bm!63281) (not b_next!28945) (not bm!63280) tp_is_empty!34585 (not bm!63277) (not bm!63283) (not b!1297459) (not b!1297455) (not b!1297449) (not bm!63276) (not bm!63274) (not b!1297452) (not b!1297454) (not mapNonEmpty!53438) (not start!109680) b_and!47037 (not b!1297453))
(check-sat b_and!47037 (not b_next!28945))
