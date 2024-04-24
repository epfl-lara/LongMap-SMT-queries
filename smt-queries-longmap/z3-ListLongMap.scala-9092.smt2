; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109560 () Bool)

(assert start!109560)

(declare-fun b_free!28825 () Bool)

(declare-fun b_next!28825 () Bool)

(assert (=> start!109560 (= b_free!28825 (not b_next!28825))))

(declare-fun tp!101593 () Bool)

(declare-fun b_and!46917 () Bool)

(assert (=> start!109560 (= tp!101593 b_and!46917)))

(declare-fun b!1295346 () Bool)

(declare-fun e!739319 () Bool)

(declare-fun tp_is_empty!34465 () Bool)

(assert (=> b!1295346 (= e!739319 tp_is_empty!34465)))

(declare-fun b!1295347 () Bool)

(declare-fun res!860470 () Bool)

(declare-fun e!739316 () Bool)

(assert (=> b!1295347 (=> (not res!860470) (not e!739316))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85985 0))(
  ( (array!85986 (arr!41489 (Array (_ BitVec 32) (_ BitVec 64))) (size!42040 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85985)

(assert (=> b!1295347 (= res!860470 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42040 _keys!1741))))))

(declare-fun b!1295348 () Bool)

(declare-fun res!860473 () Bool)

(assert (=> b!1295348 (=> (not res!860473) (not e!739316))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295348 (= res!860473 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42040 _keys!1741))))))

(declare-fun b!1295349 () Bool)

(declare-fun res!860466 () Bool)

(assert (=> b!1295349 (=> (not res!860466) (not e!739316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295349 (= res!860466 (not (validKeyInArray!0 (select (arr!41489 _keys!1741) from!2144))))))

(declare-fun res!860469 () Bool)

(assert (=> start!109560 (=> (not res!860469) (not e!739316))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109560 (= res!860469 (validMask!0 mask!2175))))

(assert (=> start!109560 e!739316))

(assert (=> start!109560 tp_is_empty!34465))

(assert (=> start!109560 true))

(declare-datatypes ((V!51057 0))(
  ( (V!51058 (val!17307 Int)) )
))
(declare-datatypes ((ValueCell!16334 0))(
  ( (ValueCellFull!16334 (v!19905 V!51057)) (EmptyCell!16334) )
))
(declare-datatypes ((array!85987 0))(
  ( (array!85988 (arr!41490 (Array (_ BitVec 32) ValueCell!16334)) (size!42041 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85987)

(declare-fun e!739317 () Bool)

(declare-fun array_inv!31655 (array!85987) Bool)

(assert (=> start!109560 (and (array_inv!31655 _values!1445) e!739317)))

(declare-fun array_inv!31656 (array!85985) Bool)

(assert (=> start!109560 (array_inv!31656 _keys!1741)))

(assert (=> start!109560 tp!101593))

(declare-fun mapNonEmpty!53258 () Bool)

(declare-fun mapRes!53258 () Bool)

(declare-fun tp!101594 () Bool)

(assert (=> mapNonEmpty!53258 (= mapRes!53258 (and tp!101594 e!739319))))

(declare-fun mapKey!53258 () (_ BitVec 32))

(declare-fun mapRest!53258 () (Array (_ BitVec 32) ValueCell!16334))

(declare-fun mapValue!53258 () ValueCell!16334)

(assert (=> mapNonEmpty!53258 (= (arr!41490 _values!1445) (store mapRest!53258 mapKey!53258 mapValue!53258))))

(declare-fun b!1295350 () Bool)

(declare-fun res!860471 () Bool)

(assert (=> b!1295350 (=> (not res!860471) (not e!739316))))

(declare-fun minValue!1387 () V!51057)

(declare-fun zeroValue!1387 () V!51057)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22282 0))(
  ( (tuple2!22283 (_1!11152 (_ BitVec 64)) (_2!11152 V!51057)) )
))
(declare-datatypes ((List!29450 0))(
  ( (Nil!29447) (Cons!29446 (h!30664 tuple2!22282) (t!43006 List!29450)) )
))
(declare-datatypes ((ListLongMap!19947 0))(
  ( (ListLongMap!19948 (toList!9989 List!29450)) )
))
(declare-fun contains!8120 (ListLongMap!19947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5017 (array!85985 array!85987 (_ BitVec 32) (_ BitVec 32) V!51057 V!51057 (_ BitVec 32) Int) ListLongMap!19947)

(assert (=> b!1295350 (= res!860471 (contains!8120 (getCurrentListMap!5017 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295351 () Bool)

(declare-fun e!739318 () Bool)

(assert (=> b!1295351 (= e!739318 tp_is_empty!34465)))

(declare-fun b!1295352 () Bool)

(declare-fun res!860468 () Bool)

(assert (=> b!1295352 (=> (not res!860468) (not e!739316))))

(declare-datatypes ((List!29451 0))(
  ( (Nil!29448) (Cons!29447 (h!30665 (_ BitVec 64)) (t!43007 List!29451)) )
))
(declare-fun arrayNoDuplicates!0 (array!85985 (_ BitVec 32) List!29451) Bool)

(assert (=> b!1295352 (= res!860468 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29448))))

(declare-fun b!1295353 () Bool)

(declare-fun res!860467 () Bool)

(assert (=> b!1295353 (=> (not res!860467) (not e!739316))))

(assert (=> b!1295353 (= res!860467 (and (= (size!42041 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42040 _keys!1741) (size!42041 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53258 () Bool)

(assert (=> mapIsEmpty!53258 mapRes!53258))

(declare-fun b!1295354 () Bool)

(assert (=> b!1295354 (= e!739316 (not true))))

(assert (=> b!1295354 (not (contains!8120 (ListLongMap!19948 Nil!29447) k0!1205))))

(declare-datatypes ((Unit!42813 0))(
  ( (Unit!42814) )
))
(declare-fun lt!580164 () Unit!42813)

(declare-fun emptyContainsNothing!149 ((_ BitVec 64)) Unit!42813)

(assert (=> b!1295354 (= lt!580164 (emptyContainsNothing!149 k0!1205))))

(declare-fun b!1295355 () Bool)

(declare-fun res!860472 () Bool)

(assert (=> b!1295355 (=> (not res!860472) (not e!739316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85985 (_ BitVec 32)) Bool)

(assert (=> b!1295355 (= res!860472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295356 () Bool)

(assert (=> b!1295356 (= e!739317 (and e!739318 mapRes!53258))))

(declare-fun condMapEmpty!53258 () Bool)

(declare-fun mapDefault!53258 () ValueCell!16334)

(assert (=> b!1295356 (= condMapEmpty!53258 (= (arr!41490 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16334)) mapDefault!53258)))))

(assert (= (and start!109560 res!860469) b!1295353))

(assert (= (and b!1295353 res!860467) b!1295355))

(assert (= (and b!1295355 res!860472) b!1295352))

(assert (= (and b!1295352 res!860468) b!1295347))

(assert (= (and b!1295347 res!860470) b!1295350))

(assert (= (and b!1295350 res!860471) b!1295348))

(assert (= (and b!1295348 res!860473) b!1295349))

(assert (= (and b!1295349 res!860466) b!1295354))

(assert (= (and b!1295356 condMapEmpty!53258) mapIsEmpty!53258))

(assert (= (and b!1295356 (not condMapEmpty!53258)) mapNonEmpty!53258))

(get-info :version)

(assert (= (and mapNonEmpty!53258 ((_ is ValueCellFull!16334) mapValue!53258)) b!1295346))

(assert (= (and b!1295356 ((_ is ValueCellFull!16334) mapDefault!53258)) b!1295351))

(assert (= start!109560 b!1295356))

(declare-fun m!1187973 () Bool)

(assert (=> b!1295355 m!1187973))

(declare-fun m!1187975 () Bool)

(assert (=> mapNonEmpty!53258 m!1187975))

(declare-fun m!1187977 () Bool)

(assert (=> b!1295352 m!1187977))

(declare-fun m!1187979 () Bool)

(assert (=> start!109560 m!1187979))

(declare-fun m!1187981 () Bool)

(assert (=> start!109560 m!1187981))

(declare-fun m!1187983 () Bool)

(assert (=> start!109560 m!1187983))

(declare-fun m!1187985 () Bool)

(assert (=> b!1295350 m!1187985))

(assert (=> b!1295350 m!1187985))

(declare-fun m!1187987 () Bool)

(assert (=> b!1295350 m!1187987))

(declare-fun m!1187989 () Bool)

(assert (=> b!1295349 m!1187989))

(assert (=> b!1295349 m!1187989))

(declare-fun m!1187991 () Bool)

(assert (=> b!1295349 m!1187991))

(declare-fun m!1187993 () Bool)

(assert (=> b!1295354 m!1187993))

(declare-fun m!1187995 () Bool)

(assert (=> b!1295354 m!1187995))

(check-sat tp_is_empty!34465 (not mapNonEmpty!53258) (not b_next!28825) (not b!1295354) (not start!109560) (not b!1295349) (not b!1295350) b_and!46917 (not b!1295352) (not b!1295355))
(check-sat b_and!46917 (not b_next!28825))
