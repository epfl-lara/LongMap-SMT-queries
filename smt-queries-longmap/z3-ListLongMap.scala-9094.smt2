; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109350 () Bool)

(assert start!109350)

(declare-fun b_free!28839 () Bool)

(declare-fun b_next!28839 () Bool)

(assert (=> start!109350 (= b_free!28839 (not b_next!28839))))

(declare-fun tp!101636 () Bool)

(declare-fun b_and!46929 () Bool)

(assert (=> start!109350 (= tp!101636 b_and!46929)))

(declare-fun b!1294272 () Bool)

(declare-fun e!738575 () Bool)

(assert (=> b!1294272 (= e!738575 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51075 0))(
  ( (V!51076 (val!17314 Int)) )
))
(declare-datatypes ((tuple2!22286 0))(
  ( (tuple2!22287 (_1!11154 (_ BitVec 64)) (_2!11154 V!51075)) )
))
(declare-datatypes ((List!29430 0))(
  ( (Nil!29427) (Cons!29426 (h!30635 tuple2!22286) (t!42994 List!29430)) )
))
(declare-datatypes ((ListLongMap!19943 0))(
  ( (ListLongMap!19944 (toList!9987 List!29430)) )
))
(declare-fun contains!8105 (ListLongMap!19943 (_ BitVec 64)) Bool)

(assert (=> b!1294272 (not (contains!8105 (ListLongMap!19944 Nil!29427) k0!1205))))

(declare-datatypes ((Unit!42866 0))(
  ( (Unit!42867) )
))
(declare-fun lt!579701 () Unit!42866)

(declare-fun emptyContainsNothing!154 ((_ BitVec 64)) Unit!42866)

(assert (=> b!1294272 (= lt!579701 (emptyContainsNothing!154 k0!1205))))

(declare-fun b!1294273 () Bool)

(declare-fun res!860114 () Bool)

(assert (=> b!1294273 (=> (not res!860114) (not e!738575))))

(declare-datatypes ((array!85980 0))(
  ( (array!85981 (arr!41491 (Array (_ BitVec 32) (_ BitVec 64))) (size!42041 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85980)

(declare-datatypes ((List!29431 0))(
  ( (Nil!29428) (Cons!29427 (h!30636 (_ BitVec 64)) (t!42995 List!29431)) )
))
(declare-fun arrayNoDuplicates!0 (array!85980 (_ BitVec 32) List!29431) Bool)

(assert (=> b!1294273 (= res!860114 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29428))))

(declare-fun b!1294274 () Bool)

(declare-fun res!860120 () Bool)

(assert (=> b!1294274 (=> (not res!860120) (not e!738575))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16341 0))(
  ( (ValueCellFull!16341 (v!19917 V!51075)) (EmptyCell!16341) )
))
(declare-datatypes ((array!85982 0))(
  ( (array!85983 (arr!41492 (Array (_ BitVec 32) ValueCell!16341)) (size!42042 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85982)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294274 (= res!860120 (and (= (size!42042 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42041 _keys!1741) (size!42042 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294275 () Bool)

(declare-fun res!860117 () Bool)

(assert (=> b!1294275 (=> (not res!860117) (not e!738575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85980 (_ BitVec 32)) Bool)

(assert (=> b!1294275 (= res!860117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294276 () Bool)

(declare-fun res!860115 () Bool)

(assert (=> b!1294276 (=> (not res!860115) (not e!738575))))

(declare-fun minValue!1387 () V!51075)

(declare-fun zeroValue!1387 () V!51075)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5026 (array!85980 array!85982 (_ BitVec 32) (_ BitVec 32) V!51075 V!51075 (_ BitVec 32) Int) ListLongMap!19943)

(assert (=> b!1294276 (= res!860115 (contains!8105 (getCurrentListMap!5026 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!860116 () Bool)

(assert (=> start!109350 (=> (not res!860116) (not e!738575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109350 (= res!860116 (validMask!0 mask!2175))))

(assert (=> start!109350 e!738575))

(declare-fun tp_is_empty!34479 () Bool)

(assert (=> start!109350 tp_is_empty!34479))

(assert (=> start!109350 true))

(declare-fun e!738574 () Bool)

(declare-fun array_inv!31425 (array!85982) Bool)

(assert (=> start!109350 (and (array_inv!31425 _values!1445) e!738574)))

(declare-fun array_inv!31426 (array!85980) Bool)

(assert (=> start!109350 (array_inv!31426 _keys!1741)))

(assert (=> start!109350 tp!101636))

(declare-fun b!1294277 () Bool)

(declare-fun e!738578 () Bool)

(assert (=> b!1294277 (= e!738578 tp_is_empty!34479)))

(declare-fun b!1294278 () Bool)

(declare-fun res!860119 () Bool)

(assert (=> b!1294278 (=> (not res!860119) (not e!738575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294278 (= res!860119 (not (validKeyInArray!0 (select (arr!41491 _keys!1741) from!2144))))))

(declare-fun b!1294279 () Bool)

(declare-fun e!738576 () Bool)

(assert (=> b!1294279 (= e!738576 tp_is_empty!34479)))

(declare-fun b!1294280 () Bool)

(declare-fun res!860118 () Bool)

(assert (=> b!1294280 (=> (not res!860118) (not e!738575))))

(assert (=> b!1294280 (= res!860118 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42041 _keys!1741))))))

(declare-fun mapNonEmpty!53279 () Bool)

(declare-fun mapRes!53279 () Bool)

(declare-fun tp!101635 () Bool)

(assert (=> mapNonEmpty!53279 (= mapRes!53279 (and tp!101635 e!738578))))

(declare-fun mapValue!53279 () ValueCell!16341)

(declare-fun mapRest!53279 () (Array (_ BitVec 32) ValueCell!16341))

(declare-fun mapKey!53279 () (_ BitVec 32))

(assert (=> mapNonEmpty!53279 (= (arr!41492 _values!1445) (store mapRest!53279 mapKey!53279 mapValue!53279))))

(declare-fun b!1294281 () Bool)

(assert (=> b!1294281 (= e!738574 (and e!738576 mapRes!53279))))

(declare-fun condMapEmpty!53279 () Bool)

(declare-fun mapDefault!53279 () ValueCell!16341)

(assert (=> b!1294281 (= condMapEmpty!53279 (= (arr!41492 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16341)) mapDefault!53279)))))

(declare-fun mapIsEmpty!53279 () Bool)

(assert (=> mapIsEmpty!53279 mapRes!53279))

(declare-fun b!1294282 () Bool)

(declare-fun res!860121 () Bool)

(assert (=> b!1294282 (=> (not res!860121) (not e!738575))))

(assert (=> b!1294282 (= res!860121 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42041 _keys!1741))))))

(assert (= (and start!109350 res!860116) b!1294274))

(assert (= (and b!1294274 res!860120) b!1294275))

(assert (= (and b!1294275 res!860117) b!1294273))

(assert (= (and b!1294273 res!860114) b!1294280))

(assert (= (and b!1294280 res!860118) b!1294276))

(assert (= (and b!1294276 res!860115) b!1294282))

(assert (= (and b!1294282 res!860121) b!1294278))

(assert (= (and b!1294278 res!860119) b!1294272))

(assert (= (and b!1294281 condMapEmpty!53279) mapIsEmpty!53279))

(assert (= (and b!1294281 (not condMapEmpty!53279)) mapNonEmpty!53279))

(get-info :version)

(assert (= (and mapNonEmpty!53279 ((_ is ValueCellFull!16341) mapValue!53279)) b!1294277))

(assert (= (and b!1294281 ((_ is ValueCellFull!16341) mapDefault!53279)) b!1294279))

(assert (= start!109350 b!1294281))

(declare-fun m!1186523 () Bool)

(assert (=> b!1294273 m!1186523))

(declare-fun m!1186525 () Bool)

(assert (=> start!109350 m!1186525))

(declare-fun m!1186527 () Bool)

(assert (=> start!109350 m!1186527))

(declare-fun m!1186529 () Bool)

(assert (=> start!109350 m!1186529))

(declare-fun m!1186531 () Bool)

(assert (=> b!1294276 m!1186531))

(assert (=> b!1294276 m!1186531))

(declare-fun m!1186533 () Bool)

(assert (=> b!1294276 m!1186533))

(declare-fun m!1186535 () Bool)

(assert (=> mapNonEmpty!53279 m!1186535))

(declare-fun m!1186537 () Bool)

(assert (=> b!1294275 m!1186537))

(declare-fun m!1186539 () Bool)

(assert (=> b!1294278 m!1186539))

(assert (=> b!1294278 m!1186539))

(declare-fun m!1186541 () Bool)

(assert (=> b!1294278 m!1186541))

(declare-fun m!1186543 () Bool)

(assert (=> b!1294272 m!1186543))

(declare-fun m!1186545 () Bool)

(assert (=> b!1294272 m!1186545))

(check-sat (not b!1294272) (not b!1294273) b_and!46929 (not start!109350) (not b!1294275) (not mapNonEmpty!53279) (not b!1294276) tp_is_empty!34479 (not b_next!28839) (not b!1294278))
(check-sat b_and!46929 (not b_next!28839))
