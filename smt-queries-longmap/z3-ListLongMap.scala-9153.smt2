; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109800 () Bool)

(assert start!109800)

(declare-fun b_free!29193 () Bool)

(declare-fun b_next!29193 () Bool)

(assert (=> start!109800 (= b_free!29193 (not b_next!29193))))

(declare-fun tp!102712 () Bool)

(declare-fun b_and!47307 () Bool)

(assert (=> start!109800 (= tp!102712 b_and!47307)))

(declare-fun b!1300653 () Bool)

(declare-fun res!864292 () Bool)

(declare-fun e!741916 () Bool)

(assert (=> b!1300653 (=> (not res!864292) (not e!741916))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86678 0))(
  ( (array!86679 (arr!41835 (Array (_ BitVec 32) (_ BitVec 64))) (size!42385 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86678)

(assert (=> b!1300653 (= res!864292 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42385 _keys!1741))))))

(declare-fun b!1300654 () Bool)

(declare-fun c!124616 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!581467 () Bool)

(assert (=> b!1300654 (= c!124616 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581467))))

(declare-datatypes ((Unit!43042 0))(
  ( (Unit!43043) )
))
(declare-fun e!741914 () Unit!43042)

(declare-fun e!741917 () Unit!43042)

(assert (=> b!1300654 (= e!741914 e!741917)))

(declare-fun b!1300655 () Bool)

(declare-fun e!741920 () Bool)

(declare-fun tp_is_empty!34833 () Bool)

(assert (=> b!1300655 (= e!741920 tp_is_empty!34833)))

(declare-fun bm!63688 () Bool)

(declare-datatypes ((V!51547 0))(
  ( (V!51548 (val!17491 Int)) )
))
(declare-datatypes ((tuple2!22560 0))(
  ( (tuple2!22561 (_1!11291 (_ BitVec 64)) (_2!11291 V!51547)) )
))
(declare-datatypes ((List!29692 0))(
  ( (Nil!29689) (Cons!29688 (h!30897 tuple2!22560) (t!43266 List!29692)) )
))
(declare-datatypes ((ListLongMap!20217 0))(
  ( (ListLongMap!20218 (toList!10124 List!29692)) )
))
(declare-fun call!63694 () ListLongMap!20217)

(declare-fun call!63692 () ListLongMap!20217)

(assert (=> bm!63688 (= call!63694 call!63692)))

(declare-fun zeroValue!1387 () V!51547)

(declare-fun bm!63689 () Bool)

(declare-fun lt!581460 () ListLongMap!20217)

(declare-fun lt!581465 () ListLongMap!20217)

(declare-fun minValue!1387 () V!51547)

(declare-fun c!124614 () Bool)

(declare-fun call!63693 () Unit!43042)

(declare-fun lt!581468 () ListLongMap!20217)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun c!124615 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!76 ((_ BitVec 64) (_ BitVec 64) V!51547 ListLongMap!20217) Unit!43042)

(assert (=> bm!63689 (= call!63693 (lemmaInListMapAfterAddingDiffThenInBefore!76 k0!1205 (ite (or c!124614 c!124615) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124614 c!124615) zeroValue!1387 minValue!1387) (ite c!124614 lt!581465 (ite c!124615 lt!581468 lt!581460))))))

(declare-fun b!1300656 () Bool)

(assert (=> b!1300656 (= e!741916 (not true))))

(declare-fun contains!8250 (ListLongMap!20217 (_ BitVec 64)) Bool)

(assert (=> b!1300656 (not (contains!8250 (ListLongMap!20218 Nil!29689) k0!1205))))

(declare-fun lt!581459 () Unit!43042)

(declare-fun emptyContainsNothing!193 ((_ BitVec 64)) Unit!43042)

(assert (=> b!1300656 (= lt!581459 (emptyContainsNothing!193 k0!1205))))

(declare-fun lt!581458 () Unit!43042)

(declare-fun e!741913 () Unit!43042)

(assert (=> b!1300656 (= lt!581458 e!741913)))

(assert (=> b!1300656 (= c!124614 (and (not lt!581467) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300656 (= lt!581467 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300657 () Bool)

(declare-fun Unit!43044 () Unit!43042)

(assert (=> b!1300657 (= e!741917 Unit!43044)))

(declare-fun b!1300658 () Bool)

(declare-fun res!864297 () Bool)

(assert (=> b!1300658 (=> (not res!864297) (not e!741916))))

(assert (=> b!1300658 (= res!864297 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42385 _keys!1741))))))

(declare-fun mapNonEmpty!53825 () Bool)

(declare-fun mapRes!53825 () Bool)

(declare-fun tp!102713 () Bool)

(declare-fun e!741919 () Bool)

(assert (=> mapNonEmpty!53825 (= mapRes!53825 (and tp!102713 e!741919))))

(declare-fun mapKey!53825 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16518 0))(
  ( (ValueCellFull!16518 (v!20099 V!51547)) (EmptyCell!16518) )
))
(declare-fun mapRest!53825 () (Array (_ BitVec 32) ValueCell!16518))

(declare-datatypes ((array!86680 0))(
  ( (array!86681 (arr!41836 (Array (_ BitVec 32) ValueCell!16518)) (size!42386 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86680)

(declare-fun mapValue!53825 () ValueCell!16518)

(assert (=> mapNonEmpty!53825 (= (arr!41836 _values!1445) (store mapRest!53825 mapKey!53825 mapValue!53825))))

(declare-fun b!1300659 () Bool)

(declare-fun res!864294 () Bool)

(assert (=> b!1300659 (=> (not res!864294) (not e!741916))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1300659 (= res!864294 (and (= (size!42386 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42385 _keys!1741) (size!42386 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300660 () Bool)

(declare-fun e!741915 () Bool)

(assert (=> b!1300660 (= e!741915 (and e!741920 mapRes!53825))))

(declare-fun condMapEmpty!53825 () Bool)

(declare-fun mapDefault!53825 () ValueCell!16518)

(assert (=> b!1300660 (= condMapEmpty!53825 (= (arr!41836 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16518)) mapDefault!53825)))))

(declare-fun call!63696 () Bool)

(declare-fun bm!63690 () Bool)

(assert (=> bm!63690 (= call!63696 (contains!8250 (ite c!124614 lt!581465 (ite c!124615 lt!581468 lt!581460)) k0!1205))))

(declare-fun b!1300661 () Bool)

(declare-fun lt!581461 () Unit!43042)

(assert (=> b!1300661 (= e!741917 lt!581461)))

(assert (=> b!1300661 (= lt!581460 call!63694)))

(declare-fun call!63695 () Unit!43042)

(assert (=> b!1300661 (= lt!581461 call!63695)))

(declare-fun call!63691 () Bool)

(assert (=> b!1300661 call!63691))

(declare-fun b!1300662 () Bool)

(assert (=> b!1300662 (= e!741919 tp_is_empty!34833)))

(declare-fun bm!63691 () Bool)

(assert (=> bm!63691 (= call!63695 call!63693)))

(declare-fun b!1300664 () Bool)

(declare-fun res!864296 () Bool)

(assert (=> b!1300664 (=> (not res!864296) (not e!741916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300664 (= res!864296 (validKeyInArray!0 (select (arr!41835 _keys!1741) from!2144)))))

(declare-fun bm!63692 () Bool)

(assert (=> bm!63692 (= call!63691 call!63696)))

(declare-fun b!1300665 () Bool)

(declare-fun res!864293 () Bool)

(assert (=> b!1300665 (=> (not res!864293) (not e!741916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86678 (_ BitVec 32)) Bool)

(assert (=> b!1300665 (= res!864293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300666 () Bool)

(assert (=> b!1300666 (= e!741913 e!741914)))

(assert (=> b!1300666 (= c!124615 (and (not lt!581467) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!53825 () Bool)

(assert (=> mapIsEmpty!53825 mapRes!53825))

(declare-fun bm!63693 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6084 (array!86678 array!86680 (_ BitVec 32) (_ BitVec 32) V!51547 V!51547 (_ BitVec 32) Int) ListLongMap!20217)

(assert (=> bm!63693 (= call!63692 (getCurrentListMapNoExtraKeys!6084 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300667 () Bool)

(declare-fun res!864295 () Bool)

(assert (=> b!1300667 (=> (not res!864295) (not e!741916))))

(declare-fun getCurrentListMap!5151 (array!86678 array!86680 (_ BitVec 32) (_ BitVec 32) V!51547 V!51547 (_ BitVec 32) Int) ListLongMap!20217)

(assert (=> b!1300667 (= res!864295 (contains!8250 (getCurrentListMap!5151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300668 () Bool)

(assert (=> b!1300668 call!63691))

(declare-fun lt!581464 () Unit!43042)

(assert (=> b!1300668 (= lt!581464 call!63695)))

(assert (=> b!1300668 (= lt!581468 call!63694)))

(assert (=> b!1300668 (= e!741914 lt!581464)))

(declare-fun b!1300669 () Bool)

(declare-fun res!864298 () Bool)

(assert (=> b!1300669 (=> (not res!864298) (not e!741916))))

(declare-datatypes ((List!29693 0))(
  ( (Nil!29690) (Cons!29689 (h!30898 (_ BitVec 64)) (t!43267 List!29693)) )
))
(declare-fun arrayNoDuplicates!0 (array!86678 (_ BitVec 32) List!29693) Bool)

(assert (=> b!1300669 (= res!864298 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29690))))

(declare-fun res!864299 () Bool)

(assert (=> start!109800 (=> (not res!864299) (not e!741916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109800 (= res!864299 (validMask!0 mask!2175))))

(assert (=> start!109800 e!741916))

(assert (=> start!109800 tp_is_empty!34833))

(assert (=> start!109800 true))

(declare-fun array_inv!31653 (array!86680) Bool)

(assert (=> start!109800 (and (array_inv!31653 _values!1445) e!741915)))

(declare-fun array_inv!31654 (array!86678) Bool)

(assert (=> start!109800 (array_inv!31654 _keys!1741)))

(assert (=> start!109800 tp!102712))

(declare-fun b!1300663 () Bool)

(declare-fun lt!581462 () Unit!43042)

(assert (=> b!1300663 (= e!741913 lt!581462)))

(assert (=> b!1300663 (= lt!581465 call!63692)))

(declare-fun lt!581466 () ListLongMap!20217)

(declare-fun +!4454 (ListLongMap!20217 tuple2!22560) ListLongMap!20217)

(assert (=> b!1300663 (= lt!581466 (+!4454 lt!581465 (tuple2!22561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581463 () Unit!43042)

(assert (=> b!1300663 (= lt!581463 (lemmaInListMapAfterAddingDiffThenInBefore!76 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581466))))

(assert (=> b!1300663 (contains!8250 lt!581466 k0!1205)))

(assert (=> b!1300663 (= lt!581462 call!63693)))

(assert (=> b!1300663 call!63696))

(assert (= (and start!109800 res!864299) b!1300659))

(assert (= (and b!1300659 res!864294) b!1300665))

(assert (= (and b!1300665 res!864293) b!1300669))

(assert (= (and b!1300669 res!864298) b!1300653))

(assert (= (and b!1300653 res!864292) b!1300667))

(assert (= (and b!1300667 res!864295) b!1300658))

(assert (= (and b!1300658 res!864297) b!1300664))

(assert (= (and b!1300664 res!864296) b!1300656))

(assert (= (and b!1300656 c!124614) b!1300663))

(assert (= (and b!1300656 (not c!124614)) b!1300666))

(assert (= (and b!1300666 c!124615) b!1300668))

(assert (= (and b!1300666 (not c!124615)) b!1300654))

(assert (= (and b!1300654 c!124616) b!1300661))

(assert (= (and b!1300654 (not c!124616)) b!1300657))

(assert (= (or b!1300668 b!1300661) bm!63688))

(assert (= (or b!1300668 b!1300661) bm!63691))

(assert (= (or b!1300668 b!1300661) bm!63692))

(assert (= (or b!1300663 bm!63688) bm!63693))

(assert (= (or b!1300663 bm!63691) bm!63689))

(assert (= (or b!1300663 bm!63692) bm!63690))

(assert (= (and b!1300660 condMapEmpty!53825) mapIsEmpty!53825))

(assert (= (and b!1300660 (not condMapEmpty!53825)) mapNonEmpty!53825))

(get-info :version)

(assert (= (and mapNonEmpty!53825 ((_ is ValueCellFull!16518) mapValue!53825)) b!1300662))

(assert (= (and b!1300660 ((_ is ValueCellFull!16518) mapDefault!53825)) b!1300655))

(assert (= start!109800 b!1300660))

(declare-fun m!1191517 () Bool)

(assert (=> b!1300667 m!1191517))

(assert (=> b!1300667 m!1191517))

(declare-fun m!1191519 () Bool)

(assert (=> b!1300667 m!1191519))

(declare-fun m!1191521 () Bool)

(assert (=> bm!63690 m!1191521))

(declare-fun m!1191523 () Bool)

(assert (=> start!109800 m!1191523))

(declare-fun m!1191525 () Bool)

(assert (=> start!109800 m!1191525))

(declare-fun m!1191527 () Bool)

(assert (=> start!109800 m!1191527))

(declare-fun m!1191529 () Bool)

(assert (=> bm!63693 m!1191529))

(declare-fun m!1191531 () Bool)

(assert (=> b!1300665 m!1191531))

(declare-fun m!1191533 () Bool)

(assert (=> mapNonEmpty!53825 m!1191533))

(declare-fun m!1191535 () Bool)

(assert (=> b!1300663 m!1191535))

(declare-fun m!1191537 () Bool)

(assert (=> b!1300663 m!1191537))

(declare-fun m!1191539 () Bool)

(assert (=> b!1300663 m!1191539))

(declare-fun m!1191541 () Bool)

(assert (=> b!1300669 m!1191541))

(declare-fun m!1191543 () Bool)

(assert (=> b!1300656 m!1191543))

(declare-fun m!1191545 () Bool)

(assert (=> b!1300656 m!1191545))

(declare-fun m!1191547 () Bool)

(assert (=> bm!63689 m!1191547))

(declare-fun m!1191549 () Bool)

(assert (=> b!1300664 m!1191549))

(assert (=> b!1300664 m!1191549))

(declare-fun m!1191551 () Bool)

(assert (=> b!1300664 m!1191551))

(check-sat (not b!1300665) b_and!47307 (not mapNonEmpty!53825) (not bm!63693) (not b!1300664) (not b!1300667) (not start!109800) (not b!1300656) (not bm!63689) (not b!1300669) (not b!1300663) (not bm!63690) tp_is_empty!34833 (not b_next!29193))
(check-sat b_and!47307 (not b_next!29193))
