; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109830 () Bool)

(assert start!109830)

(declare-fun b_free!29095 () Bool)

(declare-fun b_next!29095 () Bool)

(assert (=> start!109830 (= b_free!29095 (not b_next!29095))))

(declare-fun tp!102403 () Bool)

(declare-fun b_and!47187 () Bool)

(assert (=> start!109830 (= tp!102403 b_and!47187)))

(declare-fun b!1299593 () Bool)

(declare-fun e!741532 () Bool)

(declare-fun e!741533 () Bool)

(declare-fun mapRes!53663 () Bool)

(assert (=> b!1299593 (= e!741532 (and e!741533 mapRes!53663))))

(declare-fun condMapEmpty!53663 () Bool)

(declare-datatypes ((V!51417 0))(
  ( (V!51418 (val!17442 Int)) )
))
(declare-datatypes ((ValueCell!16469 0))(
  ( (ValueCellFull!16469 (v!20040 V!51417)) (EmptyCell!16469) )
))
(declare-datatypes ((array!86515 0))(
  ( (array!86516 (arr!41754 (Array (_ BitVec 32) ValueCell!16469)) (size!42305 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86515)

(declare-fun mapDefault!53663 () ValueCell!16469)

(assert (=> b!1299593 (= condMapEmpty!53663 (= (arr!41754 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16469)) mapDefault!53663)))))

(declare-fun b!1299594 () Bool)

(declare-fun e!741531 () Bool)

(assert (=> b!1299594 (= e!741531 (not true))))

(declare-fun minValue!1387 () V!51417)

(declare-fun zeroValue!1387 () V!51417)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86517 0))(
  ( (array!86518 (arr!41755 (Array (_ BitVec 32) (_ BitVec 64))) (size!42306 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86517)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22496 0))(
  ( (tuple2!22497 (_1!11259 (_ BitVec 64)) (_2!11259 V!51417)) )
))
(declare-datatypes ((List!29655 0))(
  ( (Nil!29652) (Cons!29651 (h!30869 tuple2!22496) (t!43211 List!29655)) )
))
(declare-datatypes ((ListLongMap!20161 0))(
  ( (ListLongMap!20162 (toList!10096 List!29655)) )
))
(declare-fun contains!8226 (ListLongMap!20161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5115 (array!86517 array!86515 (_ BitVec 32) (_ BitVec 32) V!51417 V!51417 (_ BitVec 32) Int) ListLongMap!20161)

(assert (=> b!1299594 (contains!8226 (getCurrentListMap!5115 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42947 0))(
  ( (Unit!42948) )
))
(declare-fun lt!581172 () Unit!42947)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 (array!86517 array!86515 (_ BitVec 32) (_ BitVec 32) V!51417 V!51417 (_ BitVec 64) (_ BitVec 32) Int) Unit!42947)

(assert (=> b!1299594 (= lt!581172 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!40 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1299595 () Bool)

(declare-fun tp_is_empty!34735 () Bool)

(assert (=> b!1299595 (= e!741533 tp_is_empty!34735)))

(declare-fun b!1299596 () Bool)

(declare-fun res!863339 () Bool)

(assert (=> b!1299596 (=> (not res!863339) (not e!741531))))

(assert (=> b!1299596 (= res!863339 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42306 _keys!1741)) (not (= (select (arr!41755 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1299597 () Bool)

(declare-fun res!863340 () Bool)

(assert (=> b!1299597 (=> (not res!863340) (not e!741531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86517 (_ BitVec 32)) Bool)

(assert (=> b!1299597 (= res!863340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299598 () Bool)

(declare-fun e!741534 () Bool)

(assert (=> b!1299598 (= e!741534 tp_is_empty!34735)))

(declare-fun b!1299599 () Bool)

(declare-fun res!863336 () Bool)

(assert (=> b!1299599 (=> (not res!863336) (not e!741531))))

(declare-datatypes ((List!29656 0))(
  ( (Nil!29653) (Cons!29652 (h!30870 (_ BitVec 64)) (t!43212 List!29656)) )
))
(declare-fun arrayNoDuplicates!0 (array!86517 (_ BitVec 32) List!29656) Bool)

(assert (=> b!1299599 (= res!863336 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29653))))

(declare-fun mapNonEmpty!53663 () Bool)

(declare-fun tp!102404 () Bool)

(assert (=> mapNonEmpty!53663 (= mapRes!53663 (and tp!102404 e!741534))))

(declare-fun mapRest!53663 () (Array (_ BitVec 32) ValueCell!16469))

(declare-fun mapValue!53663 () ValueCell!16469)

(declare-fun mapKey!53663 () (_ BitVec 32))

(assert (=> mapNonEmpty!53663 (= (arr!41754 _values!1445) (store mapRest!53663 mapKey!53663 mapValue!53663))))

(declare-fun b!1299600 () Bool)

(declare-fun res!863335 () Bool)

(assert (=> b!1299600 (=> (not res!863335) (not e!741531))))

(assert (=> b!1299600 (= res!863335 (contains!8226 (getCurrentListMap!5115 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!863341 () Bool)

(assert (=> start!109830 (=> (not res!863341) (not e!741531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109830 (= res!863341 (validMask!0 mask!2175))))

(assert (=> start!109830 e!741531))

(assert (=> start!109830 tp_is_empty!34735))

(assert (=> start!109830 true))

(declare-fun array_inv!31833 (array!86515) Bool)

(assert (=> start!109830 (and (array_inv!31833 _values!1445) e!741532)))

(declare-fun array_inv!31834 (array!86517) Bool)

(assert (=> start!109830 (array_inv!31834 _keys!1741)))

(assert (=> start!109830 tp!102403))

(declare-fun b!1299592 () Bool)

(declare-fun res!863337 () Bool)

(assert (=> b!1299592 (=> (not res!863337) (not e!741531))))

(assert (=> b!1299592 (= res!863337 (and (= (size!42305 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42306 _keys!1741) (size!42305 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53663 () Bool)

(assert (=> mapIsEmpty!53663 mapRes!53663))

(declare-fun b!1299601 () Bool)

(declare-fun res!863338 () Bool)

(assert (=> b!1299601 (=> (not res!863338) (not e!741531))))

(assert (=> b!1299601 (= res!863338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42306 _keys!1741))))))

(assert (= (and start!109830 res!863341) b!1299592))

(assert (= (and b!1299592 res!863337) b!1299597))

(assert (= (and b!1299597 res!863340) b!1299599))

(assert (= (and b!1299599 res!863336) b!1299601))

(assert (= (and b!1299601 res!863338) b!1299600))

(assert (= (and b!1299600 res!863335) b!1299596))

(assert (= (and b!1299596 res!863339) b!1299594))

(assert (= (and b!1299593 condMapEmpty!53663) mapIsEmpty!53663))

(assert (= (and b!1299593 (not condMapEmpty!53663)) mapNonEmpty!53663))

(get-info :version)

(assert (= (and mapNonEmpty!53663 ((_ is ValueCellFull!16469) mapValue!53663)) b!1299598))

(assert (= (and b!1299593 ((_ is ValueCellFull!16469) mapDefault!53663)) b!1299595))

(assert (= start!109830 b!1299593))

(declare-fun m!1191285 () Bool)

(assert (=> mapNonEmpty!53663 m!1191285))

(declare-fun m!1191287 () Bool)

(assert (=> b!1299596 m!1191287))

(declare-fun m!1191289 () Bool)

(assert (=> start!109830 m!1191289))

(declare-fun m!1191291 () Bool)

(assert (=> start!109830 m!1191291))

(declare-fun m!1191293 () Bool)

(assert (=> start!109830 m!1191293))

(declare-fun m!1191295 () Bool)

(assert (=> b!1299599 m!1191295))

(declare-fun m!1191297 () Bool)

(assert (=> b!1299594 m!1191297))

(assert (=> b!1299594 m!1191297))

(declare-fun m!1191299 () Bool)

(assert (=> b!1299594 m!1191299))

(declare-fun m!1191301 () Bool)

(assert (=> b!1299594 m!1191301))

(declare-fun m!1191303 () Bool)

(assert (=> b!1299600 m!1191303))

(assert (=> b!1299600 m!1191303))

(declare-fun m!1191305 () Bool)

(assert (=> b!1299600 m!1191305))

(declare-fun m!1191307 () Bool)

(assert (=> b!1299597 m!1191307))

(check-sat (not start!109830) b_and!47187 tp_is_empty!34735 (not b!1299594) (not mapNonEmpty!53663) (not b!1299600) (not b!1299597) (not b_next!29095) (not b!1299599))
(check-sat b_and!47187 (not b_next!29095))
