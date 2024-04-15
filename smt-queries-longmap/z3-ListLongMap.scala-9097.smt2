; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109366 () Bool)

(assert start!109366)

(declare-fun b_free!28855 () Bool)

(declare-fun b_next!28855 () Bool)

(assert (=> start!109366 (= b_free!28855 (not b_next!28855))))

(declare-fun tp!101685 () Bool)

(declare-fun b_and!46927 () Bool)

(assert (=> start!109366 (= tp!101685 b_and!46927)))

(declare-fun b!1294472 () Bool)

(declare-fun res!860285 () Bool)

(declare-fun e!738669 () Bool)

(assert (=> b!1294472 (=> (not res!860285) (not e!738669))))

(declare-datatypes ((V!51097 0))(
  ( (V!51098 (val!17322 Int)) )
))
(declare-fun minValue!1387 () V!51097)

(declare-fun zeroValue!1387 () V!51097)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16349 0))(
  ( (ValueCellFull!16349 (v!19924 V!51097)) (EmptyCell!16349) )
))
(declare-datatypes ((array!85903 0))(
  ( (array!85904 (arr!41453 (Array (_ BitVec 32) ValueCell!16349)) (size!42005 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85903)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85905 0))(
  ( (array!85906 (arr!41454 (Array (_ BitVec 32) (_ BitVec 64))) (size!42006 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85905)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22344 0))(
  ( (tuple2!22345 (_1!11183 (_ BitVec 64)) (_2!11183 V!51097)) )
))
(declare-datatypes ((List!29484 0))(
  ( (Nil!29481) (Cons!29480 (h!30689 tuple2!22344) (t!43040 List!29484)) )
))
(declare-datatypes ((ListLongMap!20001 0))(
  ( (ListLongMap!20002 (toList!10016 List!29484)) )
))
(declare-fun contains!8064 (ListLongMap!20001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4946 (array!85905 array!85903 (_ BitVec 32) (_ BitVec 32) V!51097 V!51097 (_ BitVec 32) Int) ListLongMap!20001)

(assert (=> b!1294472 (= res!860285 (contains!8064 (getCurrentListMap!4946 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294473 () Bool)

(declare-fun res!860286 () Bool)

(assert (=> b!1294473 (=> (not res!860286) (not e!738669))))

(declare-datatypes ((List!29485 0))(
  ( (Nil!29482) (Cons!29481 (h!30690 (_ BitVec 64)) (t!43041 List!29485)) )
))
(declare-fun arrayNoDuplicates!0 (array!85905 (_ BitVec 32) List!29485) Bool)

(assert (=> b!1294473 (= res!860286 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29482))))

(declare-fun b!1294474 () Bool)

(declare-fun e!738667 () Bool)

(declare-fun e!738668 () Bool)

(declare-fun mapRes!53303 () Bool)

(assert (=> b!1294474 (= e!738667 (and e!738668 mapRes!53303))))

(declare-fun condMapEmpty!53303 () Bool)

(declare-fun mapDefault!53303 () ValueCell!16349)

(assert (=> b!1294474 (= condMapEmpty!53303 (= (arr!41453 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16349)) mapDefault!53303)))))

(declare-fun b!1294475 () Bool)

(declare-fun res!860282 () Bool)

(assert (=> b!1294475 (=> (not res!860282) (not e!738669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294475 (= res!860282 (not (validKeyInArray!0 (select (arr!41454 _keys!1741) from!2144))))))

(declare-fun b!1294477 () Bool)

(declare-fun e!738666 () Bool)

(declare-fun tp_is_empty!34495 () Bool)

(assert (=> b!1294477 (= e!738666 tp_is_empty!34495)))

(declare-fun b!1294478 () Bool)

(declare-fun res!860283 () Bool)

(assert (=> b!1294478 (=> (not res!860283) (not e!738669))))

(assert (=> b!1294478 (= res!860283 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42006 _keys!1741))))))

(declare-fun b!1294479 () Bool)

(assert (=> b!1294479 (= e!738668 tp_is_empty!34495)))

(declare-fun mapIsEmpty!53303 () Bool)

(assert (=> mapIsEmpty!53303 mapRes!53303))

(declare-fun b!1294480 () Bool)

(declare-fun res!860280 () Bool)

(assert (=> b!1294480 (=> (not res!860280) (not e!738669))))

(assert (=> b!1294480 (= res!860280 (and (= (size!42005 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42006 _keys!1741) (size!42005 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53303 () Bool)

(declare-fun tp!101684 () Bool)

(assert (=> mapNonEmpty!53303 (= mapRes!53303 (and tp!101684 e!738666))))

(declare-fun mapKey!53303 () (_ BitVec 32))

(declare-fun mapValue!53303 () ValueCell!16349)

(declare-fun mapRest!53303 () (Array (_ BitVec 32) ValueCell!16349))

(assert (=> mapNonEmpty!53303 (= (arr!41453 _values!1445) (store mapRest!53303 mapKey!53303 mapValue!53303))))

(declare-fun b!1294481 () Bool)

(declare-fun res!860281 () Bool)

(assert (=> b!1294481 (=> (not res!860281) (not e!738669))))

(assert (=> b!1294481 (= res!860281 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42006 _keys!1741))))))

(declare-fun b!1294482 () Bool)

(declare-fun res!860284 () Bool)

(assert (=> b!1294482 (=> (not res!860284) (not e!738669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85905 (_ BitVec 32)) Bool)

(assert (=> b!1294482 (= res!860284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294476 () Bool)

(assert (=> b!1294476 (= e!738669 (not true))))

(assert (=> b!1294476 (not (contains!8064 (ListLongMap!20002 Nil!29481) k0!1205))))

(declare-datatypes ((Unit!42704 0))(
  ( (Unit!42705) )
))
(declare-fun lt!579547 () Unit!42704)

(declare-fun emptyContainsNothing!145 ((_ BitVec 64)) Unit!42704)

(assert (=> b!1294476 (= lt!579547 (emptyContainsNothing!145 k0!1205))))

(declare-fun res!860279 () Bool)

(assert (=> start!109366 (=> (not res!860279) (not e!738669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109366 (= res!860279 (validMask!0 mask!2175))))

(assert (=> start!109366 e!738669))

(assert (=> start!109366 tp_is_empty!34495))

(assert (=> start!109366 true))

(declare-fun array_inv!31553 (array!85903) Bool)

(assert (=> start!109366 (and (array_inv!31553 _values!1445) e!738667)))

(declare-fun array_inv!31554 (array!85905) Bool)

(assert (=> start!109366 (array_inv!31554 _keys!1741)))

(assert (=> start!109366 tp!101685))

(assert (= (and start!109366 res!860279) b!1294480))

(assert (= (and b!1294480 res!860280) b!1294482))

(assert (= (and b!1294482 res!860284) b!1294473))

(assert (= (and b!1294473 res!860286) b!1294481))

(assert (= (and b!1294481 res!860281) b!1294472))

(assert (= (and b!1294472 res!860285) b!1294478))

(assert (= (and b!1294478 res!860283) b!1294475))

(assert (= (and b!1294475 res!860282) b!1294476))

(assert (= (and b!1294474 condMapEmpty!53303) mapIsEmpty!53303))

(assert (= (and b!1294474 (not condMapEmpty!53303)) mapNonEmpty!53303))

(get-info :version)

(assert (= (and mapNonEmpty!53303 ((_ is ValueCellFull!16349) mapValue!53303)) b!1294477))

(assert (= (and b!1294474 ((_ is ValueCellFull!16349) mapDefault!53303)) b!1294479))

(assert (= start!109366 b!1294474))

(declare-fun m!1186215 () Bool)

(assert (=> b!1294473 m!1186215))

(declare-fun m!1186217 () Bool)

(assert (=> b!1294475 m!1186217))

(assert (=> b!1294475 m!1186217))

(declare-fun m!1186219 () Bool)

(assert (=> b!1294475 m!1186219))

(declare-fun m!1186221 () Bool)

(assert (=> b!1294482 m!1186221))

(declare-fun m!1186223 () Bool)

(assert (=> start!109366 m!1186223))

(declare-fun m!1186225 () Bool)

(assert (=> start!109366 m!1186225))

(declare-fun m!1186227 () Bool)

(assert (=> start!109366 m!1186227))

(declare-fun m!1186229 () Bool)

(assert (=> b!1294472 m!1186229))

(assert (=> b!1294472 m!1186229))

(declare-fun m!1186231 () Bool)

(assert (=> b!1294472 m!1186231))

(declare-fun m!1186233 () Bool)

(assert (=> mapNonEmpty!53303 m!1186233))

(declare-fun m!1186235 () Bool)

(assert (=> b!1294476 m!1186235))

(declare-fun m!1186237 () Bool)

(assert (=> b!1294476 m!1186237))

(check-sat (not b!1294482) (not b!1294472) (not mapNonEmpty!53303) (not b_next!28855) (not b!1294476) (not start!109366) b_and!46927 (not b!1294475) (not b!1294473) tp_is_empty!34495)
(check-sat b_and!46927 (not b_next!28855))
