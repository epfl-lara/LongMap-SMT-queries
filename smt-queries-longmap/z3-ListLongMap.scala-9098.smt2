; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109372 () Bool)

(assert start!109372)

(declare-fun b_free!28861 () Bool)

(declare-fun b_next!28861 () Bool)

(assert (=> start!109372 (= b_free!28861 (not b_next!28861))))

(declare-fun tp!101703 () Bool)

(declare-fun b_and!46933 () Bool)

(assert (=> start!109372 (= tp!101703 b_and!46933)))

(declare-fun res!860358 () Bool)

(declare-fun e!738713 () Bool)

(assert (=> start!109372 (=> (not res!860358) (not e!738713))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109372 (= res!860358 (validMask!0 mask!2175))))

(assert (=> start!109372 e!738713))

(declare-fun tp_is_empty!34501 () Bool)

(assert (=> start!109372 tp_is_empty!34501))

(assert (=> start!109372 true))

(declare-datatypes ((V!51105 0))(
  ( (V!51106 (val!17325 Int)) )
))
(declare-datatypes ((ValueCell!16352 0))(
  ( (ValueCellFull!16352 (v!19927 V!51105)) (EmptyCell!16352) )
))
(declare-datatypes ((array!85915 0))(
  ( (array!85916 (arr!41459 (Array (_ BitVec 32) ValueCell!16352)) (size!42011 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85915)

(declare-fun e!738710 () Bool)

(declare-fun array_inv!31557 (array!85915) Bool)

(assert (=> start!109372 (and (array_inv!31557 _values!1445) e!738710)))

(declare-datatypes ((array!85917 0))(
  ( (array!85918 (arr!41460 (Array (_ BitVec 32) (_ BitVec 64))) (size!42012 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85917)

(declare-fun array_inv!31558 (array!85917) Bool)

(assert (=> start!109372 (array_inv!31558 _keys!1741)))

(assert (=> start!109372 tp!101703))

(declare-fun mapIsEmpty!53312 () Bool)

(declare-fun mapRes!53312 () Bool)

(assert (=> mapIsEmpty!53312 mapRes!53312))

(declare-fun b!1294571 () Bool)

(declare-fun res!860351 () Bool)

(assert (=> b!1294571 (=> (not res!860351) (not e!738713))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1294571 (= res!860351 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42012 _keys!1741))))))

(declare-fun b!1294572 () Bool)

(declare-fun res!860354 () Bool)

(assert (=> b!1294572 (=> (not res!860354) (not e!738713))))

(declare-fun minValue!1387 () V!51105)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51105)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22350 0))(
  ( (tuple2!22351 (_1!11186 (_ BitVec 64)) (_2!11186 V!51105)) )
))
(declare-datatypes ((List!29489 0))(
  ( (Nil!29486) (Cons!29485 (h!30694 tuple2!22350) (t!43045 List!29489)) )
))
(declare-datatypes ((ListLongMap!20007 0))(
  ( (ListLongMap!20008 (toList!10019 List!29489)) )
))
(declare-fun contains!8067 (ListLongMap!20007 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4948 (array!85917 array!85915 (_ BitVec 32) (_ BitVec 32) V!51105 V!51105 (_ BitVec 32) Int) ListLongMap!20007)

(assert (=> b!1294572 (= res!860354 (contains!8067 (getCurrentListMap!4948 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294573 () Bool)

(declare-fun res!860355 () Bool)

(assert (=> b!1294573 (=> (not res!860355) (not e!738713))))

(assert (=> b!1294573 (= res!860355 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42012 _keys!1741))))))

(declare-fun b!1294574 () Bool)

(declare-fun e!738712 () Bool)

(assert (=> b!1294574 (= e!738710 (and e!738712 mapRes!53312))))

(declare-fun condMapEmpty!53312 () Bool)

(declare-fun mapDefault!53312 () ValueCell!16352)

(assert (=> b!1294574 (= condMapEmpty!53312 (= (arr!41459 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16352)) mapDefault!53312)))))

(declare-fun b!1294575 () Bool)

(declare-fun e!738711 () Bool)

(assert (=> b!1294575 (= e!738711 tp_is_empty!34501)))

(declare-fun mapNonEmpty!53312 () Bool)

(declare-fun tp!101702 () Bool)

(assert (=> mapNonEmpty!53312 (= mapRes!53312 (and tp!101702 e!738711))))

(declare-fun mapValue!53312 () ValueCell!16352)

(declare-fun mapRest!53312 () (Array (_ BitVec 32) ValueCell!16352))

(declare-fun mapKey!53312 () (_ BitVec 32))

(assert (=> mapNonEmpty!53312 (= (arr!41459 _values!1445) (store mapRest!53312 mapKey!53312 mapValue!53312))))

(declare-fun b!1294576 () Bool)

(assert (=> b!1294576 (= e!738712 tp_is_empty!34501)))

(declare-fun b!1294577 () Bool)

(declare-fun res!860357 () Bool)

(assert (=> b!1294577 (=> (not res!860357) (not e!738713))))

(declare-datatypes ((List!29490 0))(
  ( (Nil!29487) (Cons!29486 (h!30695 (_ BitVec 64)) (t!43046 List!29490)) )
))
(declare-fun arrayNoDuplicates!0 (array!85917 (_ BitVec 32) List!29490) Bool)

(assert (=> b!1294577 (= res!860357 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29487))))

(declare-fun b!1294578 () Bool)

(assert (=> b!1294578 (= e!738713 (not true))))

(assert (=> b!1294578 (not (contains!8067 (ListLongMap!20008 Nil!29486) k0!1205))))

(declare-datatypes ((Unit!42710 0))(
  ( (Unit!42711) )
))
(declare-fun lt!579556 () Unit!42710)

(declare-fun emptyContainsNothing!148 ((_ BitVec 64)) Unit!42710)

(assert (=> b!1294578 (= lt!579556 (emptyContainsNothing!148 k0!1205))))

(declare-fun b!1294579 () Bool)

(declare-fun res!860356 () Bool)

(assert (=> b!1294579 (=> (not res!860356) (not e!738713))))

(assert (=> b!1294579 (= res!860356 (and (= (size!42011 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42012 _keys!1741) (size!42011 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294580 () Bool)

(declare-fun res!860352 () Bool)

(assert (=> b!1294580 (=> (not res!860352) (not e!738713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294580 (= res!860352 (not (validKeyInArray!0 (select (arr!41460 _keys!1741) from!2144))))))

(declare-fun b!1294581 () Bool)

(declare-fun res!860353 () Bool)

(assert (=> b!1294581 (=> (not res!860353) (not e!738713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85917 (_ BitVec 32)) Bool)

(assert (=> b!1294581 (= res!860353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109372 res!860358) b!1294579))

(assert (= (and b!1294579 res!860356) b!1294581))

(assert (= (and b!1294581 res!860353) b!1294577))

(assert (= (and b!1294577 res!860357) b!1294571))

(assert (= (and b!1294571 res!860351) b!1294572))

(assert (= (and b!1294572 res!860354) b!1294573))

(assert (= (and b!1294573 res!860355) b!1294580))

(assert (= (and b!1294580 res!860352) b!1294578))

(assert (= (and b!1294574 condMapEmpty!53312) mapIsEmpty!53312))

(assert (= (and b!1294574 (not condMapEmpty!53312)) mapNonEmpty!53312))

(get-info :version)

(assert (= (and mapNonEmpty!53312 ((_ is ValueCellFull!16352) mapValue!53312)) b!1294575))

(assert (= (and b!1294574 ((_ is ValueCellFull!16352) mapDefault!53312)) b!1294576))

(assert (= start!109372 b!1294574))

(declare-fun m!1186287 () Bool)

(assert (=> b!1294580 m!1186287))

(assert (=> b!1294580 m!1186287))

(declare-fun m!1186289 () Bool)

(assert (=> b!1294580 m!1186289))

(declare-fun m!1186291 () Bool)

(assert (=> b!1294577 m!1186291))

(declare-fun m!1186293 () Bool)

(assert (=> b!1294578 m!1186293))

(declare-fun m!1186295 () Bool)

(assert (=> b!1294578 m!1186295))

(declare-fun m!1186297 () Bool)

(assert (=> mapNonEmpty!53312 m!1186297))

(declare-fun m!1186299 () Bool)

(assert (=> start!109372 m!1186299))

(declare-fun m!1186301 () Bool)

(assert (=> start!109372 m!1186301))

(declare-fun m!1186303 () Bool)

(assert (=> start!109372 m!1186303))

(declare-fun m!1186305 () Bool)

(assert (=> b!1294581 m!1186305))

(declare-fun m!1186307 () Bool)

(assert (=> b!1294572 m!1186307))

(assert (=> b!1294572 m!1186307))

(declare-fun m!1186309 () Bool)

(assert (=> b!1294572 m!1186309))

(check-sat tp_is_empty!34501 (not b!1294581) (not b_next!28861) (not start!109372) b_and!46933 (not b!1294577) (not mapNonEmpty!53312) (not b!1294580) (not b!1294578) (not b!1294572))
(check-sat b_and!46933 (not b_next!28861))
