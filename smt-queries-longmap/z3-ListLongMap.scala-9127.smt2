; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109548 () Bool)

(assert start!109548)

(declare-fun b_free!29037 () Bool)

(declare-fun b_next!29037 () Bool)

(assert (=> start!109548 (= b_free!29037 (not b_next!29037))))

(declare-fun tp!102230 () Bool)

(declare-fun b_and!47127 () Bool)

(assert (=> start!109548 (= tp!102230 b_and!47127)))

(declare-fun res!862271 () Bool)

(declare-fun e!740252 () Bool)

(assert (=> start!109548 (=> (not res!862271) (not e!740252))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109548 (= res!862271 (validMask!0 mask!2175))))

(assert (=> start!109548 e!740252))

(declare-fun tp_is_empty!34677 () Bool)

(assert (=> start!109548 tp_is_empty!34677))

(assert (=> start!109548 true))

(declare-datatypes ((V!51339 0))(
  ( (V!51340 (val!17413 Int)) )
))
(declare-datatypes ((ValueCell!16440 0))(
  ( (ValueCellFull!16440 (v!20016 V!51339)) (EmptyCell!16440) )
))
(declare-datatypes ((array!86364 0))(
  ( (array!86365 (arr!41683 (Array (_ BitVec 32) ValueCell!16440)) (size!42233 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86364)

(declare-fun e!740248 () Bool)

(declare-fun array_inv!31547 (array!86364) Bool)

(assert (=> start!109548 (and (array_inv!31547 _values!1445) e!740248)))

(declare-datatypes ((array!86366 0))(
  ( (array!86367 (arr!41684 (Array (_ BitVec 32) (_ BitVec 64))) (size!42234 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86366)

(declare-fun array_inv!31548 (array!86366) Bool)

(assert (=> start!109548 (array_inv!31548 _keys!1741)))

(assert (=> start!109548 tp!102230))

(declare-fun mapIsEmpty!53576 () Bool)

(declare-fun mapRes!53576 () Bool)

(assert (=> mapIsEmpty!53576 mapRes!53576))

(declare-fun b!1297479 () Bool)

(declare-fun res!862268 () Bool)

(assert (=> b!1297479 (=> (not res!862268) (not e!740252))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297479 (= res!862268 (and (= (size!42233 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42234 _keys!1741) (size!42233 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297480 () Bool)

(declare-fun e!740250 () Bool)

(assert (=> b!1297480 (= e!740248 (and e!740250 mapRes!53576))))

(declare-fun condMapEmpty!53576 () Bool)

(declare-fun mapDefault!53576 () ValueCell!16440)

(assert (=> b!1297480 (= condMapEmpty!53576 (= (arr!41683 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16440)) mapDefault!53576)))))

(declare-fun b!1297481 () Bool)

(declare-fun res!862270 () Bool)

(assert (=> b!1297481 (=> (not res!862270) (not e!740252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86366 (_ BitVec 32)) Bool)

(assert (=> b!1297481 (= res!862270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297482 () Bool)

(declare-fun res!862269 () Bool)

(assert (=> b!1297482 (=> (not res!862269) (not e!740252))))

(declare-datatypes ((List!29573 0))(
  ( (Nil!29570) (Cons!29569 (h!30778 (_ BitVec 64)) (t!43137 List!29573)) )
))
(declare-fun arrayNoDuplicates!0 (array!86366 (_ BitVec 32) List!29573) Bool)

(assert (=> b!1297482 (= res!862269 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29570))))

(declare-fun b!1297483 () Bool)

(assert (=> b!1297483 (= e!740250 tp_is_empty!34677)))

(declare-fun b!1297484 () Bool)

(assert (=> b!1297484 (= e!740252 false)))

(declare-fun zeroValue!1387 () V!51339)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!51339)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580601 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22438 0))(
  ( (tuple2!22439 (_1!11230 (_ BitVec 64)) (_2!11230 V!51339)) )
))
(declare-datatypes ((List!29574 0))(
  ( (Nil!29571) (Cons!29570 (h!30779 tuple2!22438) (t!43138 List!29574)) )
))
(declare-datatypes ((ListLongMap!20095 0))(
  ( (ListLongMap!20096 (toList!10063 List!29574)) )
))
(declare-fun contains!8181 (ListLongMap!20095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5092 (array!86366 array!86364 (_ BitVec 32) (_ BitVec 32) V!51339 V!51339 (_ BitVec 32) Int) ListLongMap!20095)

(assert (=> b!1297484 (= lt!580601 (contains!8181 (getCurrentListMap!5092 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297485 () Bool)

(declare-fun e!740251 () Bool)

(assert (=> b!1297485 (= e!740251 tp_is_empty!34677)))

(declare-fun b!1297486 () Bool)

(declare-fun res!862272 () Bool)

(assert (=> b!1297486 (=> (not res!862272) (not e!740252))))

(assert (=> b!1297486 (= res!862272 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42234 _keys!1741))))))

(declare-fun mapNonEmpty!53576 () Bool)

(declare-fun tp!102229 () Bool)

(assert (=> mapNonEmpty!53576 (= mapRes!53576 (and tp!102229 e!740251))))

(declare-fun mapValue!53576 () ValueCell!16440)

(declare-fun mapKey!53576 () (_ BitVec 32))

(declare-fun mapRest!53576 () (Array (_ BitVec 32) ValueCell!16440))

(assert (=> mapNonEmpty!53576 (= (arr!41683 _values!1445) (store mapRest!53576 mapKey!53576 mapValue!53576))))

(assert (= (and start!109548 res!862271) b!1297479))

(assert (= (and b!1297479 res!862268) b!1297481))

(assert (= (and b!1297481 res!862270) b!1297482))

(assert (= (and b!1297482 res!862269) b!1297486))

(assert (= (and b!1297486 res!862272) b!1297484))

(assert (= (and b!1297480 condMapEmpty!53576) mapIsEmpty!53576))

(assert (= (and b!1297480 (not condMapEmpty!53576)) mapNonEmpty!53576))

(get-info :version)

(assert (= (and mapNonEmpty!53576 ((_ is ValueCellFull!16440) mapValue!53576)) b!1297485))

(assert (= (and b!1297480 ((_ is ValueCellFull!16440) mapDefault!53576)) b!1297483))

(assert (= start!109548 b!1297480))

(declare-fun m!1189059 () Bool)

(assert (=> mapNonEmpty!53576 m!1189059))

(declare-fun m!1189061 () Bool)

(assert (=> start!109548 m!1189061))

(declare-fun m!1189063 () Bool)

(assert (=> start!109548 m!1189063))

(declare-fun m!1189065 () Bool)

(assert (=> start!109548 m!1189065))

(declare-fun m!1189067 () Bool)

(assert (=> b!1297481 m!1189067))

(declare-fun m!1189069 () Bool)

(assert (=> b!1297484 m!1189069))

(assert (=> b!1297484 m!1189069))

(declare-fun m!1189071 () Bool)

(assert (=> b!1297484 m!1189071))

(declare-fun m!1189073 () Bool)

(assert (=> b!1297482 m!1189073))

(check-sat (not b!1297482) (not b_next!29037) tp_is_empty!34677 (not b!1297484) (not start!109548) (not mapNonEmpty!53576) (not b!1297481) b_and!47127)
(check-sat b_and!47127 (not b_next!29037))
