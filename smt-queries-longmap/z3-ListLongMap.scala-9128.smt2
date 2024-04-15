; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109552 () Bool)

(assert start!109552)

(declare-fun b_free!29041 () Bool)

(declare-fun b_next!29041 () Bool)

(assert (=> start!109552 (= b_free!29041 (not b_next!29041))))

(declare-fun tp!102243 () Bool)

(declare-fun b_and!47113 () Bool)

(assert (=> start!109552 (= tp!102243 b_and!47113)))

(declare-fun b!1297463 () Bool)

(declare-fun res!862273 () Bool)

(declare-fun e!740249 () Bool)

(assert (=> b!1297463 (=> (not res!862273) (not e!740249))))

(declare-datatypes ((array!86267 0))(
  ( (array!86268 (arr!41635 (Array (_ BitVec 32) (_ BitVec 64))) (size!42187 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86267)

(declare-datatypes ((List!29621 0))(
  ( (Nil!29618) (Cons!29617 (h!30826 (_ BitVec 64)) (t!43177 List!29621)) )
))
(declare-fun arrayNoDuplicates!0 (array!86267 (_ BitVec 32) List!29621) Bool)

(assert (=> b!1297463 (= res!862273 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29618))))

(declare-fun b!1297464 () Bool)

(declare-fun res!862271 () Bool)

(assert (=> b!1297464 (=> (not res!862271) (not e!740249))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86267 (_ BitVec 32)) Bool)

(assert (=> b!1297464 (= res!862271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!862272 () Bool)

(assert (=> start!109552 (=> (not res!862272) (not e!740249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109552 (= res!862272 (validMask!0 mask!2175))))

(assert (=> start!109552 e!740249))

(declare-fun tp_is_empty!34681 () Bool)

(assert (=> start!109552 tp_is_empty!34681))

(assert (=> start!109552 true))

(declare-datatypes ((V!51345 0))(
  ( (V!51346 (val!17415 Int)) )
))
(declare-datatypes ((ValueCell!16442 0))(
  ( (ValueCellFull!16442 (v!20017 V!51345)) (EmptyCell!16442) )
))
(declare-datatypes ((array!86269 0))(
  ( (array!86270 (arr!41636 (Array (_ BitVec 32) ValueCell!16442)) (size!42188 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86269)

(declare-fun e!740253 () Bool)

(declare-fun array_inv!31675 (array!86269) Bool)

(assert (=> start!109552 (and (array_inv!31675 _values!1445) e!740253)))

(declare-fun array_inv!31676 (array!86267) Bool)

(assert (=> start!109552 (array_inv!31676 _keys!1741)))

(assert (=> start!109552 tp!102243))

(declare-fun mapIsEmpty!53582 () Bool)

(declare-fun mapRes!53582 () Bool)

(assert (=> mapIsEmpty!53582 mapRes!53582))

(declare-fun b!1297465 () Bool)

(declare-fun e!740251 () Bool)

(assert (=> b!1297465 (= e!740253 (and e!740251 mapRes!53582))))

(declare-fun condMapEmpty!53582 () Bool)

(declare-fun mapDefault!53582 () ValueCell!16442)

(assert (=> b!1297465 (= condMapEmpty!53582 (= (arr!41636 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16442)) mapDefault!53582)))))

(declare-fun mapNonEmpty!53582 () Bool)

(declare-fun tp!102242 () Bool)

(declare-fun e!740252 () Bool)

(assert (=> mapNonEmpty!53582 (= mapRes!53582 (and tp!102242 e!740252))))

(declare-fun mapValue!53582 () ValueCell!16442)

(declare-fun mapKey!53582 () (_ BitVec 32))

(declare-fun mapRest!53582 () (Array (_ BitVec 32) ValueCell!16442))

(assert (=> mapNonEmpty!53582 (= (arr!41636 _values!1445) (store mapRest!53582 mapKey!53582 mapValue!53582))))

(declare-fun b!1297466 () Bool)

(declare-fun res!862274 () Bool)

(assert (=> b!1297466 (=> (not res!862274) (not e!740249))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297466 (= res!862274 (and (= (size!42188 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42187 _keys!1741) (size!42188 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297467 () Bool)

(assert (=> b!1297467 (= e!740252 tp_is_empty!34681)))

(declare-fun b!1297468 () Bool)

(assert (=> b!1297468 (= e!740251 tp_is_empty!34681)))

(declare-fun b!1297469 () Bool)

(assert (=> b!1297469 (= e!740249 false)))

(declare-fun minValue!1387 () V!51345)

(declare-fun zeroValue!1387 () V!51345)

(declare-fun lt!580429 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22494 0))(
  ( (tuple2!22495 (_1!11258 (_ BitVec 64)) (_2!11258 V!51345)) )
))
(declare-datatypes ((List!29622 0))(
  ( (Nil!29619) (Cons!29618 (h!30827 tuple2!22494) (t!43178 List!29622)) )
))
(declare-datatypes ((ListLongMap!20151 0))(
  ( (ListLongMap!20152 (toList!10091 List!29622)) )
))
(declare-fun contains!8139 (ListLongMap!20151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5007 (array!86267 array!86269 (_ BitVec 32) (_ BitVec 32) V!51345 V!51345 (_ BitVec 32) Int) ListLongMap!20151)

(assert (=> b!1297469 (= lt!580429 (contains!8139 (getCurrentListMap!5007 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297470 () Bool)

(declare-fun res!862275 () Bool)

(assert (=> b!1297470 (=> (not res!862275) (not e!740249))))

(assert (=> b!1297470 (= res!862275 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42187 _keys!1741))))))

(assert (= (and start!109552 res!862272) b!1297466))

(assert (= (and b!1297466 res!862274) b!1297464))

(assert (= (and b!1297464 res!862271) b!1297463))

(assert (= (and b!1297463 res!862273) b!1297470))

(assert (= (and b!1297470 res!862275) b!1297469))

(assert (= (and b!1297465 condMapEmpty!53582) mapIsEmpty!53582))

(assert (= (and b!1297465 (not condMapEmpty!53582)) mapNonEmpty!53582))

(get-info :version)

(assert (= (and mapNonEmpty!53582 ((_ is ValueCellFull!16442) mapValue!53582)) b!1297467))

(assert (= (and b!1297465 ((_ is ValueCellFull!16442) mapDefault!53582)) b!1297468))

(assert (= start!109552 b!1297465))

(declare-fun m!1188591 () Bool)

(assert (=> start!109552 m!1188591))

(declare-fun m!1188593 () Bool)

(assert (=> start!109552 m!1188593))

(declare-fun m!1188595 () Bool)

(assert (=> start!109552 m!1188595))

(declare-fun m!1188597 () Bool)

(assert (=> b!1297464 m!1188597))

(declare-fun m!1188599 () Bool)

(assert (=> mapNonEmpty!53582 m!1188599))

(declare-fun m!1188601 () Bool)

(assert (=> b!1297469 m!1188601))

(assert (=> b!1297469 m!1188601))

(declare-fun m!1188603 () Bool)

(assert (=> b!1297469 m!1188603))

(declare-fun m!1188605 () Bool)

(assert (=> b!1297463 m!1188605))

(check-sat tp_is_empty!34681 (not mapNonEmpty!53582) b_and!47113 (not start!109552) (not b!1297463) (not b!1297464) (not b_next!29041) (not b!1297469))
(check-sat b_and!47113 (not b_next!29041))
