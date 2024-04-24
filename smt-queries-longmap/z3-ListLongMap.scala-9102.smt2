; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109620 () Bool)

(assert start!109620)

(declare-fun b_free!28885 () Bool)

(declare-fun b_next!28885 () Bool)

(assert (=> start!109620 (= b_free!28885 (not b_next!28885))))

(declare-fun tp!101774 () Bool)

(declare-fun b_and!46977 () Bool)

(assert (=> start!109620 (= tp!101774 b_and!46977)))

(declare-fun b!1296356 () Bool)

(declare-fun e!739788 () Bool)

(declare-fun tp_is_empty!34525 () Bool)

(assert (=> b!1296356 (= e!739788 tp_is_empty!34525)))

(declare-fun b!1296357 () Bool)

(declare-fun e!739791 () Bool)

(assert (=> b!1296357 (= e!739791 tp_is_empty!34525)))

(declare-fun b!1296358 () Bool)

(declare-fun res!861206 () Bool)

(declare-fun e!739789 () Bool)

(assert (=> b!1296358 (=> (not res!861206) (not e!739789))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51137 0))(
  ( (V!51138 (val!17337 Int)) )
))
(declare-datatypes ((ValueCell!16364 0))(
  ( (ValueCellFull!16364 (v!19935 V!51137)) (EmptyCell!16364) )
))
(declare-datatypes ((array!86103 0))(
  ( (array!86104 (arr!41548 (Array (_ BitVec 32) ValueCell!16364)) (size!42099 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86103)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86105 0))(
  ( (array!86106 (arr!41549 (Array (_ BitVec 32) (_ BitVec 64))) (size!42100 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86105)

(assert (=> b!1296358 (= res!861206 (and (= (size!42099 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42100 _keys!1741) (size!42099 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296359 () Bool)

(declare-fun res!861213 () Bool)

(assert (=> b!1296359 (=> (not res!861213) (not e!739789))))

(declare-fun minValue!1387 () V!51137)

(declare-fun zeroValue!1387 () V!51137)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22322 0))(
  ( (tuple2!22323 (_1!11172 (_ BitVec 64)) (_2!11172 V!51137)) )
))
(declare-datatypes ((List!29491 0))(
  ( (Nil!29488) (Cons!29487 (h!30705 tuple2!22322) (t!43047 List!29491)) )
))
(declare-datatypes ((ListLongMap!19987 0))(
  ( (ListLongMap!19988 (toList!10009 List!29491)) )
))
(declare-fun contains!8140 (ListLongMap!19987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5035 (array!86105 array!86103 (_ BitVec 32) (_ BitVec 32) V!51137 V!51137 (_ BitVec 32) Int) ListLongMap!19987)

(assert (=> b!1296359 (= res!861213 (contains!8140 (getCurrentListMap!5035 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53348 () Bool)

(declare-fun mapRes!53348 () Bool)

(assert (=> mapIsEmpty!53348 mapRes!53348))

(declare-fun b!1296360 () Bool)

(declare-fun e!739790 () Bool)

(assert (=> b!1296360 (= e!739790 (and e!739788 mapRes!53348))))

(declare-fun condMapEmpty!53348 () Bool)

(declare-fun mapDefault!53348 () ValueCell!16364)

(assert (=> b!1296360 (= condMapEmpty!53348 (= (arr!41548 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16364)) mapDefault!53348)))))

(declare-fun b!1296361 () Bool)

(declare-fun res!861207 () Bool)

(assert (=> b!1296361 (=> (not res!861207) (not e!739789))))

(assert (=> b!1296361 (= res!861207 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42100 _keys!1741))))))

(declare-fun res!861210 () Bool)

(assert (=> start!109620 (=> (not res!861210) (not e!739789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109620 (= res!861210 (validMask!0 mask!2175))))

(assert (=> start!109620 e!739789))

(assert (=> start!109620 tp_is_empty!34525))

(assert (=> start!109620 true))

(declare-fun array_inv!31691 (array!86103) Bool)

(assert (=> start!109620 (and (array_inv!31691 _values!1445) e!739790)))

(declare-fun array_inv!31692 (array!86105) Bool)

(assert (=> start!109620 (array_inv!31692 _keys!1741)))

(assert (=> start!109620 tp!101774))

(declare-fun b!1296362 () Bool)

(declare-fun e!739787 () Bool)

(assert (=> b!1296362 (= e!739787 true)))

(declare-fun lt!580285 () ListLongMap!19987)

(declare-fun +!4456 (ListLongMap!19987 tuple2!22322) ListLongMap!19987)

(assert (=> b!1296362 (not (contains!8140 (+!4456 lt!580285 (tuple2!22323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42849 0))(
  ( (Unit!42850) )
))
(declare-fun lt!580286 () Unit!42849)

(declare-fun addStillNotContains!432 (ListLongMap!19987 (_ BitVec 64) V!51137 (_ BitVec 64)) Unit!42849)

(assert (=> b!1296362 (= lt!580286 (addStillNotContains!432 lt!580285 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6098 (array!86105 array!86103 (_ BitVec 32) (_ BitVec 32) V!51137 V!51137 (_ BitVec 32) Int) ListLongMap!19987)

(assert (=> b!1296362 (= lt!580285 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296363 () Bool)

(declare-fun res!861209 () Bool)

(assert (=> b!1296363 (=> (not res!861209) (not e!739789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296363 (= res!861209 (not (validKeyInArray!0 (select (arr!41549 _keys!1741) from!2144))))))

(declare-fun b!1296364 () Bool)

(declare-fun res!861211 () Bool)

(assert (=> b!1296364 (=> (not res!861211) (not e!739789))))

(assert (=> b!1296364 (= res!861211 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42100 _keys!1741))))))

(declare-fun b!1296365 () Bool)

(declare-fun res!861214 () Bool)

(assert (=> b!1296365 (=> (not res!861214) (not e!739789))))

(declare-datatypes ((List!29492 0))(
  ( (Nil!29489) (Cons!29488 (h!30706 (_ BitVec 64)) (t!43048 List!29492)) )
))
(declare-fun arrayNoDuplicates!0 (array!86105 (_ BitVec 32) List!29492) Bool)

(assert (=> b!1296365 (= res!861214 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29489))))

(declare-fun b!1296366 () Bool)

(assert (=> b!1296366 (= e!739789 (not e!739787))))

(declare-fun res!861212 () Bool)

(assert (=> b!1296366 (=> res!861212 e!739787)))

(assert (=> b!1296366 (= res!861212 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296366 (not (contains!8140 (ListLongMap!19988 Nil!29488) k0!1205))))

(declare-fun lt!580287 () Unit!42849)

(declare-fun emptyContainsNothing!167 ((_ BitVec 64)) Unit!42849)

(assert (=> b!1296366 (= lt!580287 (emptyContainsNothing!167 k0!1205))))

(declare-fun b!1296367 () Bool)

(declare-fun res!861208 () Bool)

(assert (=> b!1296367 (=> (not res!861208) (not e!739789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86105 (_ BitVec 32)) Bool)

(assert (=> b!1296367 (= res!861208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53348 () Bool)

(declare-fun tp!101773 () Bool)

(assert (=> mapNonEmpty!53348 (= mapRes!53348 (and tp!101773 e!739791))))

(declare-fun mapKey!53348 () (_ BitVec 32))

(declare-fun mapValue!53348 () ValueCell!16364)

(declare-fun mapRest!53348 () (Array (_ BitVec 32) ValueCell!16364))

(assert (=> mapNonEmpty!53348 (= (arr!41548 _values!1445) (store mapRest!53348 mapKey!53348 mapValue!53348))))

(assert (= (and start!109620 res!861210) b!1296358))

(assert (= (and b!1296358 res!861206) b!1296367))

(assert (= (and b!1296367 res!861208) b!1296365))

(assert (= (and b!1296365 res!861214) b!1296364))

(assert (= (and b!1296364 res!861211) b!1296359))

(assert (= (and b!1296359 res!861213) b!1296361))

(assert (= (and b!1296361 res!861207) b!1296363))

(assert (= (and b!1296363 res!861209) b!1296366))

(assert (= (and b!1296366 (not res!861212)) b!1296362))

(assert (= (and b!1296360 condMapEmpty!53348) mapIsEmpty!53348))

(assert (= (and b!1296360 (not condMapEmpty!53348)) mapNonEmpty!53348))

(get-info :version)

(assert (= (and mapNonEmpty!53348 ((_ is ValueCellFull!16364) mapValue!53348)) b!1296357))

(assert (= (and b!1296360 ((_ is ValueCellFull!16364) mapDefault!53348)) b!1296356))

(assert (= start!109620 b!1296360))

(declare-fun m!1188729 () Bool)

(assert (=> b!1296362 m!1188729))

(assert (=> b!1296362 m!1188729))

(declare-fun m!1188731 () Bool)

(assert (=> b!1296362 m!1188731))

(declare-fun m!1188733 () Bool)

(assert (=> b!1296362 m!1188733))

(declare-fun m!1188735 () Bool)

(assert (=> b!1296362 m!1188735))

(declare-fun m!1188737 () Bool)

(assert (=> b!1296363 m!1188737))

(assert (=> b!1296363 m!1188737))

(declare-fun m!1188739 () Bool)

(assert (=> b!1296363 m!1188739))

(declare-fun m!1188741 () Bool)

(assert (=> b!1296367 m!1188741))

(declare-fun m!1188743 () Bool)

(assert (=> mapNonEmpty!53348 m!1188743))

(declare-fun m!1188745 () Bool)

(assert (=> b!1296359 m!1188745))

(assert (=> b!1296359 m!1188745))

(declare-fun m!1188747 () Bool)

(assert (=> b!1296359 m!1188747))

(declare-fun m!1188749 () Bool)

(assert (=> b!1296366 m!1188749))

(declare-fun m!1188751 () Bool)

(assert (=> b!1296366 m!1188751))

(declare-fun m!1188753 () Bool)

(assert (=> start!109620 m!1188753))

(declare-fun m!1188755 () Bool)

(assert (=> start!109620 m!1188755))

(declare-fun m!1188757 () Bool)

(assert (=> start!109620 m!1188757))

(declare-fun m!1188759 () Bool)

(assert (=> b!1296365 m!1188759))

(check-sat (not b!1296366) (not b_next!28885) (not b!1296362) (not b!1296365) tp_is_empty!34525 b_and!46977 (not b!1296363) (not b!1296367) (not mapNonEmpty!53348) (not start!109620) (not b!1296359))
(check-sat b_and!46977 (not b_next!28885))
