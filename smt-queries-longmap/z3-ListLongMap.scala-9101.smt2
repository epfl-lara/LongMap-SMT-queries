; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109390 () Bool)

(assert start!109390)

(declare-fun b_free!28879 () Bool)

(declare-fun b_next!28879 () Bool)

(assert (=> start!109390 (= b_free!28879 (not b_next!28879))))

(declare-fun tp!101757 () Bool)

(declare-fun b_and!46951 () Bool)

(assert (=> start!109390 (= tp!101757 b_and!46951)))

(declare-fun b!1294879 () Bool)

(declare-fun e!738861 () Bool)

(assert (=> b!1294879 (= e!738861 true)))

(declare-datatypes ((V!51129 0))(
  ( (V!51130 (val!17334 Int)) )
))
(declare-datatypes ((tuple2!22368 0))(
  ( (tuple2!22369 (_1!11195 (_ BitVec 64)) (_2!11195 V!51129)) )
))
(declare-datatypes ((List!29506 0))(
  ( (Nil!29503) (Cons!29502 (h!30711 tuple2!22368) (t!43062 List!29506)) )
))
(declare-datatypes ((ListLongMap!20025 0))(
  ( (ListLongMap!20026 (toList!10028 List!29506)) )
))
(declare-fun lt!579597 () ListLongMap!20025)

(declare-fun minValue!1387 () V!51129)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8076 (ListLongMap!20025 (_ BitVec 64)) Bool)

(declare-fun +!4445 (ListLongMap!20025 tuple2!22368) ListLongMap!20025)

(assert (=> b!1294879 (not (contains!8076 (+!4445 lt!579597 (tuple2!22369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42726 0))(
  ( (Unit!42727) )
))
(declare-fun lt!579598 () Unit!42726)

(declare-fun addStillNotContains!422 (ListLongMap!20025 (_ BitVec 64) V!51129 (_ BitVec 64)) Unit!42726)

(assert (=> b!1294879 (= lt!579598 (addStillNotContains!422 lt!579597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51129)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16361 0))(
  ( (ValueCellFull!16361 (v!19936 V!51129)) (EmptyCell!16361) )
))
(declare-datatypes ((array!85951 0))(
  ( (array!85952 (arr!41477 (Array (_ BitVec 32) ValueCell!16361)) (size!42029 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85951)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85953 0))(
  ( (array!85954 (arr!41478 (Array (_ BitVec 32) (_ BitVec 64))) (size!42030 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85953)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6079 (array!85953 array!85951 (_ BitVec 32) (_ BitVec 32) V!51129 V!51129 (_ BitVec 32) Int) ListLongMap!20025)

(assert (=> b!1294879 (= lt!579597 (getCurrentListMapNoExtraKeys!6079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294880 () Bool)

(declare-fun e!738858 () Bool)

(assert (=> b!1294880 (= e!738858 (not e!738861))))

(declare-fun res!860586 () Bool)

(assert (=> b!1294880 (=> res!860586 e!738861)))

(assert (=> b!1294880 (= res!860586 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1294880 (not (contains!8076 (ListLongMap!20026 Nil!29503) k0!1205))))

(declare-fun lt!579596 () Unit!42726)

(declare-fun emptyContainsNothing!156 ((_ BitVec 64)) Unit!42726)

(assert (=> b!1294880 (= lt!579596 (emptyContainsNothing!156 k0!1205))))

(declare-fun b!1294881 () Bool)

(declare-fun res!860579 () Bool)

(assert (=> b!1294881 (=> (not res!860579) (not e!738858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294881 (= res!860579 (not (validKeyInArray!0 (select (arr!41478 _keys!1741) from!2144))))))

(declare-fun res!860581 () Bool)

(assert (=> start!109390 (=> (not res!860581) (not e!738858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109390 (= res!860581 (validMask!0 mask!2175))))

(assert (=> start!109390 e!738858))

(declare-fun tp_is_empty!34519 () Bool)

(assert (=> start!109390 tp_is_empty!34519))

(assert (=> start!109390 true))

(declare-fun e!738857 () Bool)

(declare-fun array_inv!31571 (array!85951) Bool)

(assert (=> start!109390 (and (array_inv!31571 _values!1445) e!738857)))

(declare-fun array_inv!31572 (array!85953) Bool)

(assert (=> start!109390 (array_inv!31572 _keys!1741)))

(assert (=> start!109390 tp!101757))

(declare-fun b!1294882 () Bool)

(declare-fun res!860585 () Bool)

(assert (=> b!1294882 (=> (not res!860585) (not e!738858))))

(assert (=> b!1294882 (= res!860585 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42030 _keys!1741))))))

(declare-fun b!1294883 () Bool)

(declare-fun res!860578 () Bool)

(assert (=> b!1294883 (=> (not res!860578) (not e!738858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85953 (_ BitVec 32)) Bool)

(assert (=> b!1294883 (= res!860578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294884 () Bool)

(declare-fun res!860582 () Bool)

(assert (=> b!1294884 (=> (not res!860582) (not e!738858))))

(assert (=> b!1294884 (= res!860582 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42030 _keys!1741))))))

(declare-fun mapIsEmpty!53339 () Bool)

(declare-fun mapRes!53339 () Bool)

(assert (=> mapIsEmpty!53339 mapRes!53339))

(declare-fun b!1294885 () Bool)

(declare-fun e!738856 () Bool)

(assert (=> b!1294885 (= e!738856 tp_is_empty!34519)))

(declare-fun b!1294886 () Bool)

(declare-fun res!860584 () Bool)

(assert (=> b!1294886 (=> (not res!860584) (not e!738858))))

(declare-fun getCurrentListMap!4956 (array!85953 array!85951 (_ BitVec 32) (_ BitVec 32) V!51129 V!51129 (_ BitVec 32) Int) ListLongMap!20025)

(assert (=> b!1294886 (= res!860584 (contains!8076 (getCurrentListMap!4956 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294887 () Bool)

(declare-fun res!860583 () Bool)

(assert (=> b!1294887 (=> (not res!860583) (not e!738858))))

(assert (=> b!1294887 (= res!860583 (and (= (size!42029 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42030 _keys!1741) (size!42029 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53339 () Bool)

(declare-fun tp!101756 () Bool)

(declare-fun e!738859 () Bool)

(assert (=> mapNonEmpty!53339 (= mapRes!53339 (and tp!101756 e!738859))))

(declare-fun mapValue!53339 () ValueCell!16361)

(declare-fun mapRest!53339 () (Array (_ BitVec 32) ValueCell!16361))

(declare-fun mapKey!53339 () (_ BitVec 32))

(assert (=> mapNonEmpty!53339 (= (arr!41477 _values!1445) (store mapRest!53339 mapKey!53339 mapValue!53339))))

(declare-fun b!1294888 () Bool)

(assert (=> b!1294888 (= e!738857 (and e!738856 mapRes!53339))))

(declare-fun condMapEmpty!53339 () Bool)

(declare-fun mapDefault!53339 () ValueCell!16361)

(assert (=> b!1294888 (= condMapEmpty!53339 (= (arr!41477 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16361)) mapDefault!53339)))))

(declare-fun b!1294889 () Bool)

(declare-fun res!860580 () Bool)

(assert (=> b!1294889 (=> (not res!860580) (not e!738858))))

(declare-datatypes ((List!29507 0))(
  ( (Nil!29504) (Cons!29503 (h!30712 (_ BitVec 64)) (t!43063 List!29507)) )
))
(declare-fun arrayNoDuplicates!0 (array!85953 (_ BitVec 32) List!29507) Bool)

(assert (=> b!1294889 (= res!860580 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29504))))

(declare-fun b!1294890 () Bool)

(assert (=> b!1294890 (= e!738859 tp_is_empty!34519)))

(assert (= (and start!109390 res!860581) b!1294887))

(assert (= (and b!1294887 res!860583) b!1294883))

(assert (= (and b!1294883 res!860578) b!1294889))

(assert (= (and b!1294889 res!860580) b!1294884))

(assert (= (and b!1294884 res!860582) b!1294886))

(assert (= (and b!1294886 res!860584) b!1294882))

(assert (= (and b!1294882 res!860585) b!1294881))

(assert (= (and b!1294881 res!860579) b!1294880))

(assert (= (and b!1294880 (not res!860586)) b!1294879))

(assert (= (and b!1294888 condMapEmpty!53339) mapIsEmpty!53339))

(assert (= (and b!1294888 (not condMapEmpty!53339)) mapNonEmpty!53339))

(get-info :version)

(assert (= (and mapNonEmpty!53339 ((_ is ValueCellFull!16361) mapValue!53339)) b!1294890))

(assert (= (and b!1294888 ((_ is ValueCellFull!16361) mapDefault!53339)) b!1294885))

(assert (= start!109390 b!1294888))

(declare-fun m!1186515 () Bool)

(assert (=> b!1294880 m!1186515))

(declare-fun m!1186517 () Bool)

(assert (=> b!1294880 m!1186517))

(declare-fun m!1186519 () Bool)

(assert (=> b!1294879 m!1186519))

(assert (=> b!1294879 m!1186519))

(declare-fun m!1186521 () Bool)

(assert (=> b!1294879 m!1186521))

(declare-fun m!1186523 () Bool)

(assert (=> b!1294879 m!1186523))

(declare-fun m!1186525 () Bool)

(assert (=> b!1294879 m!1186525))

(declare-fun m!1186527 () Bool)

(assert (=> b!1294883 m!1186527))

(declare-fun m!1186529 () Bool)

(assert (=> b!1294881 m!1186529))

(assert (=> b!1294881 m!1186529))

(declare-fun m!1186531 () Bool)

(assert (=> b!1294881 m!1186531))

(declare-fun m!1186533 () Bool)

(assert (=> mapNonEmpty!53339 m!1186533))

(declare-fun m!1186535 () Bool)

(assert (=> b!1294886 m!1186535))

(assert (=> b!1294886 m!1186535))

(declare-fun m!1186537 () Bool)

(assert (=> b!1294886 m!1186537))

(declare-fun m!1186539 () Bool)

(assert (=> start!109390 m!1186539))

(declare-fun m!1186541 () Bool)

(assert (=> start!109390 m!1186541))

(declare-fun m!1186543 () Bool)

(assert (=> start!109390 m!1186543))

(declare-fun m!1186545 () Bool)

(assert (=> b!1294889 m!1186545))

(check-sat (not b!1294886) b_and!46951 (not b!1294881) (not b!1294880) (not b!1294879) tp_is_empty!34519 (not start!109390) (not mapNonEmpty!53339) (not b!1294883) (not b_next!28879) (not b!1294889))
(check-sat b_and!46951 (not b_next!28879))
