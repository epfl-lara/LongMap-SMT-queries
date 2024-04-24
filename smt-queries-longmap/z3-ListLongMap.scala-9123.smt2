; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109746 () Bool)

(assert start!109746)

(declare-fun b_free!29011 () Bool)

(declare-fun b_next!29011 () Bool)

(assert (=> start!109746 (= b_free!29011 (not b_next!29011))))

(declare-fun tp!102151 () Bool)

(declare-fun b_and!47103 () Bool)

(assert (=> start!109746 (= tp!102151 b_and!47103)))

(declare-fun b!1298472 () Bool)

(declare-fun res!862593 () Bool)

(declare-fun e!740901 () Bool)

(assert (=> b!1298472 (=> (not res!862593) (not e!740901))))

(declare-datatypes ((array!86353 0))(
  ( (array!86354 (arr!41673 (Array (_ BitVec 32) (_ BitVec 64))) (size!42224 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86353)

(declare-datatypes ((List!29594 0))(
  ( (Nil!29591) (Cons!29590 (h!30808 (_ BitVec 64)) (t!43150 List!29594)) )
))
(declare-fun arrayNoDuplicates!0 (array!86353 (_ BitVec 32) List!29594) Bool)

(assert (=> b!1298472 (= res!862593 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29591))))

(declare-fun mapIsEmpty!53537 () Bool)

(declare-fun mapRes!53537 () Bool)

(assert (=> mapIsEmpty!53537 mapRes!53537))

(declare-fun b!1298473 () Bool)

(declare-fun e!740902 () Bool)

(declare-fun tp_is_empty!34651 () Bool)

(assert (=> b!1298473 (= e!740902 tp_is_empty!34651)))

(declare-fun b!1298474 () Bool)

(declare-fun res!862594 () Bool)

(assert (=> b!1298474 (=> (not res!862594) (not e!740901))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86353 (_ BitVec 32)) Bool)

(assert (=> b!1298474 (= res!862594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298475 () Bool)

(declare-fun res!862597 () Bool)

(assert (=> b!1298475 (=> (not res!862597) (not e!740901))))

(declare-datatypes ((V!51305 0))(
  ( (V!51306 (val!17400 Int)) )
))
(declare-datatypes ((ValueCell!16427 0))(
  ( (ValueCellFull!16427 (v!19998 V!51305)) (EmptyCell!16427) )
))
(declare-datatypes ((array!86355 0))(
  ( (array!86356 (arr!41674 (Array (_ BitVec 32) ValueCell!16427)) (size!42225 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86355)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298475 (= res!862597 (and (= (size!42225 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42224 _keys!1741) (size!42225 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53537 () Bool)

(declare-fun tp!102152 () Bool)

(declare-fun e!740903 () Bool)

(assert (=> mapNonEmpty!53537 (= mapRes!53537 (and tp!102152 e!740903))))

(declare-fun mapKey!53537 () (_ BitVec 32))

(declare-fun mapValue!53537 () ValueCell!16427)

(declare-fun mapRest!53537 () (Array (_ BitVec 32) ValueCell!16427))

(assert (=> mapNonEmpty!53537 (= (arr!41674 _values!1445) (store mapRest!53537 mapKey!53537 mapValue!53537))))

(declare-fun b!1298477 () Bool)

(assert (=> b!1298477 (= e!740901 false)))

(declare-fun zeroValue!1387 () V!51305)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!51305)

(declare-fun lt!581046 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22430 0))(
  ( (tuple2!22431 (_1!11226 (_ BitVec 64)) (_2!11226 V!51305)) )
))
(declare-datatypes ((List!29595 0))(
  ( (Nil!29592) (Cons!29591 (h!30809 tuple2!22430) (t!43151 List!29595)) )
))
(declare-datatypes ((ListLongMap!20095 0))(
  ( (ListLongMap!20096 (toList!10063 List!29595)) )
))
(declare-fun contains!8193 (ListLongMap!20095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5082 (array!86353 array!86355 (_ BitVec 32) (_ BitVec 32) V!51305 V!51305 (_ BitVec 32) Int) ListLongMap!20095)

(assert (=> b!1298477 (= lt!581046 (contains!8193 (getCurrentListMap!5082 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298478 () Bool)

(assert (=> b!1298478 (= e!740903 tp_is_empty!34651)))

(declare-fun b!1298479 () Bool)

(declare-fun res!862596 () Bool)

(assert (=> b!1298479 (=> (not res!862596) (not e!740901))))

(assert (=> b!1298479 (= res!862596 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42224 _keys!1741))))))

(declare-fun res!862595 () Bool)

(assert (=> start!109746 (=> (not res!862595) (not e!740901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109746 (= res!862595 (validMask!0 mask!2175))))

(assert (=> start!109746 e!740901))

(assert (=> start!109746 tp_is_empty!34651))

(assert (=> start!109746 true))

(declare-fun e!740904 () Bool)

(declare-fun array_inv!31781 (array!86355) Bool)

(assert (=> start!109746 (and (array_inv!31781 _values!1445) e!740904)))

(declare-fun array_inv!31782 (array!86353) Bool)

(assert (=> start!109746 (array_inv!31782 _keys!1741)))

(assert (=> start!109746 tp!102151))

(declare-fun b!1298476 () Bool)

(assert (=> b!1298476 (= e!740904 (and e!740902 mapRes!53537))))

(declare-fun condMapEmpty!53537 () Bool)

(declare-fun mapDefault!53537 () ValueCell!16427)

(assert (=> b!1298476 (= condMapEmpty!53537 (= (arr!41674 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16427)) mapDefault!53537)))))

(assert (= (and start!109746 res!862595) b!1298475))

(assert (= (and b!1298475 res!862597) b!1298474))

(assert (= (and b!1298474 res!862594) b!1298472))

(assert (= (and b!1298472 res!862593) b!1298479))

(assert (= (and b!1298479 res!862596) b!1298477))

(assert (= (and b!1298476 condMapEmpty!53537) mapIsEmpty!53537))

(assert (= (and b!1298476 (not condMapEmpty!53537)) mapNonEmpty!53537))

(get-info :version)

(assert (= (and mapNonEmpty!53537 ((_ is ValueCellFull!16427) mapValue!53537)) b!1298478))

(assert (= (and b!1298476 ((_ is ValueCellFull!16427) mapDefault!53537)) b!1298473))

(assert (= start!109746 b!1298476))

(declare-fun m!1190469 () Bool)

(assert (=> start!109746 m!1190469))

(declare-fun m!1190471 () Bool)

(assert (=> start!109746 m!1190471))

(declare-fun m!1190473 () Bool)

(assert (=> start!109746 m!1190473))

(declare-fun m!1190475 () Bool)

(assert (=> mapNonEmpty!53537 m!1190475))

(declare-fun m!1190477 () Bool)

(assert (=> b!1298472 m!1190477))

(declare-fun m!1190479 () Bool)

(assert (=> b!1298474 m!1190479))

(declare-fun m!1190481 () Bool)

(assert (=> b!1298477 m!1190481))

(assert (=> b!1298477 m!1190481))

(declare-fun m!1190483 () Bool)

(assert (=> b!1298477 m!1190483))

(check-sat (not b_next!29011) (not b!1298477) b_and!47103 (not mapNonEmpty!53537) (not start!109746) tp_is_empty!34651 (not b!1298474) (not b!1298472))
(check-sat b_and!47103 (not b_next!29011))
