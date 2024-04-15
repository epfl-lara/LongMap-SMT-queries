; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109522 () Bool)

(assert start!109522)

(declare-fun b_free!29011 () Bool)

(declare-fun b_next!29011 () Bool)

(assert (=> start!109522 (= b_free!29011 (not b_next!29011))))

(declare-fun tp!102152 () Bool)

(declare-fun b_and!47083 () Bool)

(assert (=> start!109522 (= tp!102152 b_and!47083)))

(declare-fun res!862048 () Bool)

(declare-fun e!740027 () Bool)

(assert (=> start!109522 (=> (not res!862048) (not e!740027))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109522 (= res!862048 (validMask!0 mask!2175))))

(assert (=> start!109522 e!740027))

(declare-fun tp_is_empty!34651 () Bool)

(assert (=> start!109522 tp_is_empty!34651))

(assert (=> start!109522 true))

(declare-datatypes ((V!51305 0))(
  ( (V!51306 (val!17400 Int)) )
))
(declare-datatypes ((ValueCell!16427 0))(
  ( (ValueCellFull!16427 (v!20002 V!51305)) (EmptyCell!16427) )
))
(declare-datatypes ((array!86211 0))(
  ( (array!86212 (arr!41607 (Array (_ BitVec 32) ValueCell!16427)) (size!42159 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86211)

(declare-fun e!740028 () Bool)

(declare-fun array_inv!31659 (array!86211) Bool)

(assert (=> start!109522 (and (array_inv!31659 _values!1445) e!740028)))

(declare-datatypes ((array!86213 0))(
  ( (array!86214 (arr!41608 (Array (_ BitVec 32) (_ BitVec 64))) (size!42160 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86213)

(declare-fun array_inv!31660 (array!86213) Bool)

(assert (=> start!109522 (array_inv!31660 _keys!1741)))

(assert (=> start!109522 tp!102152))

(declare-fun mapIsEmpty!53537 () Bool)

(declare-fun mapRes!53537 () Bool)

(assert (=> mapIsEmpty!53537 mapRes!53537))

(declare-fun b!1297103 () Bool)

(declare-fun res!862047 () Bool)

(assert (=> b!1297103 (=> (not res!862047) (not e!740027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86213 (_ BitVec 32)) Bool)

(assert (=> b!1297103 (= res!862047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297104 () Bool)

(declare-fun res!862049 () Bool)

(assert (=> b!1297104 (=> (not res!862049) (not e!740027))))

(declare-datatypes ((List!29605 0))(
  ( (Nil!29602) (Cons!29601 (h!30810 (_ BitVec 64)) (t!43161 List!29605)) )
))
(declare-fun arrayNoDuplicates!0 (array!86213 (_ BitVec 32) List!29605) Bool)

(assert (=> b!1297104 (= res!862049 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29602))))

(declare-fun b!1297105 () Bool)

(declare-fun e!740024 () Bool)

(assert (=> b!1297105 (= e!740024 tp_is_empty!34651)))

(declare-fun b!1297106 () Bool)

(assert (=> b!1297106 (= e!740028 (and e!740024 mapRes!53537))))

(declare-fun condMapEmpty!53537 () Bool)

(declare-fun mapDefault!53537 () ValueCell!16427)

(assert (=> b!1297106 (= condMapEmpty!53537 (= (arr!41607 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16427)) mapDefault!53537)))))

(declare-fun b!1297107 () Bool)

(declare-fun res!862050 () Bool)

(assert (=> b!1297107 (=> (not res!862050) (not e!740027))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297107 (= res!862050 (and (= (size!42159 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42160 _keys!1741) (size!42159 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297108 () Bool)

(declare-fun res!862046 () Bool)

(assert (=> b!1297108 (=> (not res!862046) (not e!740027))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297108 (= res!862046 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42160 _keys!1741))))))

(declare-fun b!1297109 () Bool)

(assert (=> b!1297109 (= e!740027 false)))

(declare-fun minValue!1387 () V!51305)

(declare-fun zeroValue!1387 () V!51305)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580384 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22480 0))(
  ( (tuple2!22481 (_1!11251 (_ BitVec 64)) (_2!11251 V!51305)) )
))
(declare-datatypes ((List!29606 0))(
  ( (Nil!29603) (Cons!29602 (h!30811 tuple2!22480) (t!43162 List!29606)) )
))
(declare-datatypes ((ListLongMap!20137 0))(
  ( (ListLongMap!20138 (toList!10084 List!29606)) )
))
(declare-fun contains!8132 (ListLongMap!20137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5000 (array!86213 array!86211 (_ BitVec 32) (_ BitVec 32) V!51305 V!51305 (_ BitVec 32) Int) ListLongMap!20137)

(assert (=> b!1297109 (= lt!580384 (contains!8132 (getCurrentListMap!5000 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53537 () Bool)

(declare-fun tp!102153 () Bool)

(declare-fun e!740025 () Bool)

(assert (=> mapNonEmpty!53537 (= mapRes!53537 (and tp!102153 e!740025))))

(declare-fun mapValue!53537 () ValueCell!16427)

(declare-fun mapRest!53537 () (Array (_ BitVec 32) ValueCell!16427))

(declare-fun mapKey!53537 () (_ BitVec 32))

(assert (=> mapNonEmpty!53537 (= (arr!41607 _values!1445) (store mapRest!53537 mapKey!53537 mapValue!53537))))

(declare-fun b!1297110 () Bool)

(assert (=> b!1297110 (= e!740025 tp_is_empty!34651)))

(assert (= (and start!109522 res!862048) b!1297107))

(assert (= (and b!1297107 res!862050) b!1297103))

(assert (= (and b!1297103 res!862047) b!1297104))

(assert (= (and b!1297104 res!862049) b!1297108))

(assert (= (and b!1297108 res!862046) b!1297109))

(assert (= (and b!1297106 condMapEmpty!53537) mapIsEmpty!53537))

(assert (= (and b!1297106 (not condMapEmpty!53537)) mapNonEmpty!53537))

(get-info :version)

(assert (= (and mapNonEmpty!53537 ((_ is ValueCellFull!16427) mapValue!53537)) b!1297110))

(assert (= (and b!1297106 ((_ is ValueCellFull!16427) mapDefault!53537)) b!1297105))

(assert (= start!109522 b!1297106))

(declare-fun m!1188351 () Bool)

(assert (=> b!1297103 m!1188351))

(declare-fun m!1188353 () Bool)

(assert (=> b!1297104 m!1188353))

(declare-fun m!1188355 () Bool)

(assert (=> start!109522 m!1188355))

(declare-fun m!1188357 () Bool)

(assert (=> start!109522 m!1188357))

(declare-fun m!1188359 () Bool)

(assert (=> start!109522 m!1188359))

(declare-fun m!1188361 () Bool)

(assert (=> mapNonEmpty!53537 m!1188361))

(declare-fun m!1188363 () Bool)

(assert (=> b!1297109 m!1188363))

(assert (=> b!1297109 m!1188363))

(declare-fun m!1188365 () Bool)

(assert (=> b!1297109 m!1188365))

(check-sat (not start!109522) (not b!1297103) b_and!47083 (not mapNonEmpty!53537) tp_is_empty!34651 (not b!1297109) (not b_next!29011) (not b!1297104))
(check-sat b_and!47083 (not b_next!29011))
