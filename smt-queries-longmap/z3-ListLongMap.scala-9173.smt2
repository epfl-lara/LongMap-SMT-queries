; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110328 () Bool)

(assert start!110328)

(declare-fun b_free!29311 () Bool)

(declare-fun b_next!29311 () Bool)

(assert (=> start!110328 (= b_free!29311 (not b_next!29311))))

(declare-fun tp!103102 () Bool)

(declare-fun b_and!47499 () Bool)

(assert (=> start!110328 (= tp!103102 b_and!47499)))

(declare-datatypes ((V!51705 0))(
  ( (V!51706 (val!17550 Int)) )
))
(declare-fun minValue!1387 () V!51705)

(declare-fun zeroValue!1387 () V!51705)

(declare-fun bm!64488 () Bool)

(declare-fun c!125472 () Bool)

(declare-datatypes ((tuple2!22722 0))(
  ( (tuple2!22723 (_1!11372 (_ BitVec 64)) (_2!11372 V!51705)) )
))
(declare-datatypes ((List!29825 0))(
  ( (Nil!29822) (Cons!29821 (h!31030 tuple2!22722) (t!43421 List!29825)) )
))
(declare-datatypes ((ListLongMap!20379 0))(
  ( (ListLongMap!20380 (toList!10205 List!29825)) )
))
(declare-fun lt!584518 () ListLongMap!20379)

(declare-fun lt!584506 () ListLongMap!20379)

(declare-fun lt!584514 () ListLongMap!20379)

(declare-fun c!125471 () Bool)

(declare-fun call!64498 () ListLongMap!20379)

(declare-fun +!4525 (ListLongMap!20379 tuple2!22722) ListLongMap!20379)

(assert (=> bm!64488 (= call!64498 (+!4525 (ite c!125472 lt!584518 (ite c!125471 lt!584514 lt!584506)) (ite c!125472 (tuple2!22723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!125471 (tuple2!22723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305693 () Bool)

(declare-datatypes ((Unit!43096 0))(
  ( (Unit!43097) )
))
(declare-fun e!744801 () Unit!43096)

(declare-fun e!744797 () Unit!43096)

(assert (=> b!1305693 (= e!744801 e!744797)))

(declare-fun lt!584509 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305693 (= c!125471 (and (not lt!584509) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305694 () Bool)

(declare-fun res!866960 () Bool)

(declare-fun e!744798 () Bool)

(assert (=> b!1305694 (=> (not res!866960) (not e!744798))))

(declare-datatypes ((array!86827 0))(
  ( (array!86828 (arr!41900 (Array (_ BitVec 32) (_ BitVec 64))) (size!42452 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86827)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86827 (_ BitVec 32)) Bool)

(assert (=> b!1305694 (= res!866960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!64489 () Bool)

(declare-datatypes ((ValueCell!16577 0))(
  ( (ValueCellFull!16577 (v!20174 V!51705)) (EmptyCell!16577) )
))
(declare-datatypes ((array!86829 0))(
  ( (array!86830 (arr!41901 (Array (_ BitVec 32) ValueCell!16577)) (size!42453 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86829)

(declare-fun defaultEntry!1448 () Int)

(declare-fun call!64492 () ListLongMap!20379)

(declare-fun getCurrentListMapNoExtraKeys!6160 (array!86827 array!86829 (_ BitVec 32) (_ BitVec 32) V!51705 V!51705 (_ BitVec 32) Int) ListLongMap!20379)

(assert (=> bm!64489 (= call!64492 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305695 () Bool)

(declare-fun res!866953 () Bool)

(assert (=> b!1305695 (=> (not res!866953) (not e!744798))))

(assert (=> b!1305695 (= res!866953 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42452 _keys!1741))))))

(declare-fun b!1305696 () Bool)

(assert (=> b!1305696 (= e!744798 (not true))))

(declare-fun lt!584516 () Unit!43096)

(assert (=> b!1305696 (= lt!584516 e!744801)))

(assert (=> b!1305696 (= c!125472 (and (not lt!584509) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305696 (= lt!584509 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8278 (ListLongMap!20379 (_ BitVec 64)) Bool)

(assert (=> b!1305696 (not (contains!8278 (ListLongMap!20380 Nil!29822) k0!1205))))

(declare-fun lt!584504 () Unit!43096)

(declare-fun emptyContainsNothing!229 ((_ BitVec 64)) Unit!43096)

(assert (=> b!1305696 (= lt!584504 (emptyContainsNothing!229 k0!1205))))

(declare-fun b!1305697 () Bool)

(declare-fun e!744799 () Bool)

(declare-fun tp_is_empty!34951 () Bool)

(assert (=> b!1305697 (= e!744799 tp_is_empty!34951)))

(declare-fun b!1305698 () Bool)

(declare-fun e!744804 () Bool)

(declare-fun e!744800 () Bool)

(declare-fun mapRes!54037 () Bool)

(assert (=> b!1305698 (= e!744804 (and e!744800 mapRes!54037))))

(declare-fun condMapEmpty!54037 () Bool)

(declare-fun mapDefault!54037 () ValueCell!16577)

(assert (=> b!1305698 (= condMapEmpty!54037 (= (arr!41901 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16577)) mapDefault!54037)))))

(declare-fun bm!64491 () Bool)

(declare-fun call!64497 () Bool)

(declare-fun call!64499 () Bool)

(assert (=> bm!64491 (= call!64497 call!64499)))

(declare-fun b!1305699 () Bool)

(declare-fun res!866957 () Bool)

(assert (=> b!1305699 (=> (not res!866957) (not e!744798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305699 (= res!866957 (not (validKeyInArray!0 (select (arr!41900 _keys!1741) from!2144))))))

(declare-fun bm!64492 () Bool)

(declare-fun call!64493 () Unit!43096)

(declare-fun call!64502 () Unit!43096)

(assert (=> bm!64492 (= call!64493 call!64502)))

(declare-fun b!1305700 () Bool)

(assert (=> b!1305700 (= e!744800 tp_is_empty!34951)))

(declare-fun b!1305701 () Bool)

(declare-fun res!866954 () Bool)

(assert (=> b!1305701 (=> (not res!866954) (not e!744798))))

(assert (=> b!1305701 (= res!866954 (and (= (size!42453 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42452 _keys!1741) (size!42453 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!64493 () Bool)

(declare-fun call!64501 () Bool)

(declare-fun call!64494 () Bool)

(assert (=> bm!64493 (= call!64501 call!64494)))

(declare-fun bm!64494 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!97 ((_ BitVec 64) (_ BitVec 64) V!51705 ListLongMap!20379) Unit!43096)

(assert (=> bm!64494 (= call!64502 (lemmaInListMapAfterAddingDiffThenInBefore!97 k0!1205 (ite (or c!125472 c!125471) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125472 c!125471) zeroValue!1387 minValue!1387) (ite c!125472 lt!584518 (ite c!125471 lt!584514 lt!584506))))))

(declare-fun b!1305702 () Bool)

(declare-fun e!744803 () Unit!43096)

(declare-fun Unit!43098 () Unit!43096)

(assert (=> b!1305702 (= e!744803 Unit!43098)))

(declare-fun b!1305703 () Bool)

(assert (=> b!1305703 call!64497))

(declare-fun lt!584505 () Unit!43096)

(assert (=> b!1305703 (= lt!584505 call!64493)))

(assert (=> b!1305703 (not call!64501)))

(declare-fun lt!584519 () Unit!43096)

(declare-fun call!64495 () Unit!43096)

(assert (=> b!1305703 (= lt!584519 call!64495)))

(declare-fun call!64491 () ListLongMap!20379)

(assert (=> b!1305703 (= lt!584514 call!64491)))

(assert (=> b!1305703 (= e!744797 lt!584505)))

(declare-fun b!1305704 () Bool)

(declare-fun res!866958 () Bool)

(assert (=> b!1305704 (=> (not res!866958) (not e!744798))))

(declare-fun getCurrentListMap!5102 (array!86827 array!86829 (_ BitVec 32) (_ BitVec 32) V!51705 V!51705 (_ BitVec 32) Int) ListLongMap!20379)

(assert (=> b!1305704 (= res!866958 (contains!8278 (getCurrentListMap!5102 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun lt!584508 () ListLongMap!20379)

(declare-fun call!64500 () ListLongMap!20379)

(declare-fun bm!64490 () Bool)

(assert (=> bm!64490 (= call!64494 (contains!8278 (ite c!125472 lt!584508 call!64500) k0!1205))))

(declare-fun res!866956 () Bool)

(assert (=> start!110328 (=> (not res!866956) (not e!744798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110328 (= res!866956 (validMask!0 mask!2175))))

(assert (=> start!110328 e!744798))

(assert (=> start!110328 tp_is_empty!34951))

(assert (=> start!110328 true))

(declare-fun array_inv!31867 (array!86829) Bool)

(assert (=> start!110328 (and (array_inv!31867 _values!1445) e!744804)))

(declare-fun array_inv!31868 (array!86827) Bool)

(assert (=> start!110328 (array_inv!31868 _keys!1741)))

(assert (=> start!110328 tp!103102))

(declare-fun b!1305705 () Bool)

(declare-fun lt!584513 () Unit!43096)

(assert (=> b!1305705 (= e!744803 lt!584513)))

(assert (=> b!1305705 (= lt!584506 call!64491)))

(declare-fun lt!584517 () Unit!43096)

(assert (=> b!1305705 (= lt!584517 call!64495)))

(assert (=> b!1305705 (not call!64501)))

(assert (=> b!1305705 (= lt!584513 call!64493)))

(assert (=> b!1305705 call!64497))

(declare-fun mapIsEmpty!54037 () Bool)

(assert (=> mapIsEmpty!54037 mapRes!54037))

(declare-fun mapNonEmpty!54037 () Bool)

(declare-fun tp!103103 () Bool)

(assert (=> mapNonEmpty!54037 (= mapRes!54037 (and tp!103103 e!744799))))

(declare-fun mapKey!54037 () (_ BitVec 32))

(declare-fun mapRest!54037 () (Array (_ BitVec 32) ValueCell!16577))

(declare-fun mapValue!54037 () ValueCell!16577)

(assert (=> mapNonEmpty!54037 (= (arr!41901 _values!1445) (store mapRest!54037 mapKey!54037 mapValue!54037))))

(declare-fun b!1305706 () Bool)

(declare-fun lt!584512 () Unit!43096)

(assert (=> b!1305706 (= e!744801 lt!584512)))

(assert (=> b!1305706 (= lt!584518 call!64492)))

(declare-fun lt!584511 () Unit!43096)

(declare-fun call!64496 () Unit!43096)

(assert (=> b!1305706 (= lt!584511 call!64496)))

(assert (=> b!1305706 (= lt!584508 (+!4525 lt!584518 (tuple2!22723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1305706 (not call!64494)))

(declare-fun lt!584510 () Unit!43096)

(declare-fun addStillNotContains!478 (ListLongMap!20379 (_ BitVec 64) V!51705 (_ BitVec 64)) Unit!43096)

(assert (=> b!1305706 (= lt!584510 (addStillNotContains!478 lt!584518 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1305706 (not (contains!8278 call!64498 k0!1205))))

(declare-fun lt!584515 () Unit!43096)

(assert (=> b!1305706 (= lt!584515 (lemmaInListMapAfterAddingDiffThenInBefore!97 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!584508))))

(assert (=> b!1305706 false))

(assert (=> b!1305706 (= lt!584512 call!64502)))

(declare-fun lt!584507 () Bool)

(assert (=> b!1305706 (= lt!584507 call!64499)))

(declare-fun bm!64495 () Bool)

(assert (=> bm!64495 (= call!64495 call!64496)))

(declare-fun bm!64496 () Bool)

(assert (=> bm!64496 (= call!64491 call!64492)))

(declare-fun bm!64497 () Bool)

(assert (=> bm!64497 (= call!64496 (addStillNotContains!478 (ite c!125472 lt!584518 (ite c!125471 lt!584514 lt!584506)) (ite (or c!125472 c!125471) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125472 c!125471) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1305707 () Bool)

(declare-fun c!125470 () Bool)

(assert (=> b!1305707 (= c!125470 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584509))))

(assert (=> b!1305707 (= e!744797 e!744803)))

(declare-fun b!1305708 () Bool)

(declare-fun res!866959 () Bool)

(assert (=> b!1305708 (=> (not res!866959) (not e!744798))))

(declare-datatypes ((List!29826 0))(
  ( (Nil!29823) (Cons!29822 (h!31031 (_ BitVec 64)) (t!43422 List!29826)) )
))
(declare-fun arrayNoDuplicates!0 (array!86827 (_ BitVec 32) List!29826) Bool)

(assert (=> b!1305708 (= res!866959 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29823))))

(declare-fun b!1305709 () Bool)

(declare-fun res!866955 () Bool)

(assert (=> b!1305709 (=> (not res!866955) (not e!744798))))

(assert (=> b!1305709 (= res!866955 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42452 _keys!1741))))))

(declare-fun bm!64498 () Bool)

(assert (=> bm!64498 (= call!64499 (contains!8278 (ite c!125472 lt!584518 (ite c!125471 lt!584514 lt!584506)) k0!1205))))

(declare-fun bm!64499 () Bool)

(assert (=> bm!64499 (= call!64500 call!64498)))

(assert (= (and start!110328 res!866956) b!1305701))

(assert (= (and b!1305701 res!866954) b!1305694))

(assert (= (and b!1305694 res!866960) b!1305708))

(assert (= (and b!1305708 res!866959) b!1305695))

(assert (= (and b!1305695 res!866953) b!1305704))

(assert (= (and b!1305704 res!866958) b!1305709))

(assert (= (and b!1305709 res!866955) b!1305699))

(assert (= (and b!1305699 res!866957) b!1305696))

(assert (= (and b!1305696 c!125472) b!1305706))

(assert (= (and b!1305696 (not c!125472)) b!1305693))

(assert (= (and b!1305693 c!125471) b!1305703))

(assert (= (and b!1305693 (not c!125471)) b!1305707))

(assert (= (and b!1305707 c!125470) b!1305705))

(assert (= (and b!1305707 (not c!125470)) b!1305702))

(assert (= (or b!1305703 b!1305705) bm!64499))

(assert (= (or b!1305703 b!1305705) bm!64492))

(assert (= (or b!1305703 b!1305705) bm!64496))

(assert (= (or b!1305703 b!1305705) bm!64491))

(assert (= (or b!1305703 b!1305705) bm!64495))

(assert (= (or b!1305703 b!1305705) bm!64493))

(assert (= (or b!1305706 bm!64491) bm!64498))

(assert (= (or b!1305706 bm!64496) bm!64489))

(assert (= (or b!1305706 bm!64499) bm!64488))

(assert (= (or b!1305706 bm!64495) bm!64497))

(assert (= (or b!1305706 bm!64492) bm!64494))

(assert (= (or b!1305706 bm!64493) bm!64490))

(assert (= (and b!1305698 condMapEmpty!54037) mapIsEmpty!54037))

(assert (= (and b!1305698 (not condMapEmpty!54037)) mapNonEmpty!54037))

(get-info :version)

(assert (= (and mapNonEmpty!54037 ((_ is ValueCellFull!16577) mapValue!54037)) b!1305697))

(assert (= (and b!1305698 ((_ is ValueCellFull!16577) mapDefault!54037)) b!1305700))

(assert (= start!110328 b!1305698))

(declare-fun m!1196477 () Bool)

(assert (=> b!1305706 m!1196477))

(declare-fun m!1196479 () Bool)

(assert (=> b!1305706 m!1196479))

(declare-fun m!1196481 () Bool)

(assert (=> b!1305706 m!1196481))

(declare-fun m!1196483 () Bool)

(assert (=> b!1305706 m!1196483))

(declare-fun m!1196485 () Bool)

(assert (=> mapNonEmpty!54037 m!1196485))

(declare-fun m!1196487 () Bool)

(assert (=> bm!64488 m!1196487))

(declare-fun m!1196489 () Bool)

(assert (=> b!1305699 m!1196489))

(assert (=> b!1305699 m!1196489))

(declare-fun m!1196491 () Bool)

(assert (=> b!1305699 m!1196491))

(declare-fun m!1196493 () Bool)

(assert (=> bm!64497 m!1196493))

(declare-fun m!1196495 () Bool)

(assert (=> bm!64490 m!1196495))

(declare-fun m!1196497 () Bool)

(assert (=> bm!64489 m!1196497))

(declare-fun m!1196499 () Bool)

(assert (=> b!1305708 m!1196499))

(declare-fun m!1196501 () Bool)

(assert (=> bm!64494 m!1196501))

(declare-fun m!1196503 () Bool)

(assert (=> b!1305696 m!1196503))

(declare-fun m!1196505 () Bool)

(assert (=> b!1305696 m!1196505))

(declare-fun m!1196507 () Bool)

(assert (=> b!1305694 m!1196507))

(declare-fun m!1196509 () Bool)

(assert (=> start!110328 m!1196509))

(declare-fun m!1196511 () Bool)

(assert (=> start!110328 m!1196511))

(declare-fun m!1196513 () Bool)

(assert (=> start!110328 m!1196513))

(declare-fun m!1196515 () Bool)

(assert (=> b!1305704 m!1196515))

(assert (=> b!1305704 m!1196515))

(declare-fun m!1196517 () Bool)

(assert (=> b!1305704 m!1196517))

(declare-fun m!1196519 () Bool)

(assert (=> bm!64498 m!1196519))

(check-sat (not b!1305706) (not b!1305708) (not b_next!29311) (not b!1305699) (not mapNonEmpty!54037) (not bm!64494) (not b!1305704) (not bm!64489) (not b!1305696) (not b!1305694) (not bm!64498) (not bm!64488) tp_is_empty!34951 (not bm!64497) (not bm!64490) b_and!47499 (not start!110328))
(check-sat b_and!47499 (not b_next!29311))
