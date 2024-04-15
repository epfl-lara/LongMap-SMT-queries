; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109630 () Bool)

(assert start!109630)

(declare-fun b_free!29119 () Bool)

(declare-fun b_next!29119 () Bool)

(assert (=> start!109630 (= b_free!29119 (not b_next!29119))))

(declare-fun tp!102477 () Bool)

(declare-fun b_and!47191 () Bool)

(assert (=> start!109630 (= tp!102477 b_and!47191)))

(declare-fun mapNonEmpty!53699 () Bool)

(declare-fun mapRes!53699 () Bool)

(declare-fun tp!102476 () Bool)

(declare-fun e!740837 () Bool)

(assert (=> mapNonEmpty!53699 (= mapRes!53699 (and tp!102476 e!740837))))

(declare-fun mapKey!53699 () (_ BitVec 32))

(declare-datatypes ((V!51449 0))(
  ( (V!51450 (val!17454 Int)) )
))
(declare-datatypes ((ValueCell!16481 0))(
  ( (ValueCellFull!16481 (v!20056 V!51449)) (EmptyCell!16481) )
))
(declare-fun mapValue!53699 () ValueCell!16481)

(declare-fun mapRest!53699 () (Array (_ BitVec 32) ValueCell!16481))

(declare-datatypes ((array!86419 0))(
  ( (array!86420 (arr!41711 (Array (_ BitVec 32) ValueCell!16481)) (size!42263 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86419)

(assert (=> mapNonEmpty!53699 (= (arr!41711 _values!1445) (store mapRest!53699 mapKey!53699 mapValue!53699))))

(declare-fun b!1298584 () Bool)

(declare-fun e!740834 () Bool)

(declare-fun e!740835 () Bool)

(assert (=> b!1298584 (= e!740834 (and e!740835 mapRes!53699))))

(declare-fun condMapEmpty!53699 () Bool)

(declare-fun mapDefault!53699 () ValueCell!16481)

(assert (=> b!1298584 (= condMapEmpty!53699 (= (arr!41711 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16481)) mapDefault!53699)))))

(declare-fun b!1298585 () Bool)

(declare-fun res!863043 () Bool)

(declare-fun e!740836 () Bool)

(assert (=> b!1298585 (=> (not res!863043) (not e!740836))))

(declare-datatypes ((array!86421 0))(
  ( (array!86422 (arr!41712 (Array (_ BitVec 32) (_ BitVec 64))) (size!42264 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86421)

(declare-datatypes ((List!29674 0))(
  ( (Nil!29671) (Cons!29670 (h!30879 (_ BitVec 64)) (t!43230 List!29674)) )
))
(declare-fun arrayNoDuplicates!0 (array!86421 (_ BitVec 32) List!29674) Bool)

(assert (=> b!1298585 (= res!863043 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29671))))

(declare-fun b!1298586 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298586 (= e!740836 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvsub (size!42264 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) (bvsub (size!42264 _keys!1741) from!2144)))))))

(declare-fun minValue!1387 () V!51449)

(declare-fun zeroValue!1387 () V!51449)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22552 0))(
  ( (tuple2!22553 (_1!11287 (_ BitVec 64)) (_2!11287 V!51449)) )
))
(declare-datatypes ((List!29675 0))(
  ( (Nil!29672) (Cons!29671 (h!30880 tuple2!22552) (t!43231 List!29675)) )
))
(declare-datatypes ((ListLongMap!20209 0))(
  ( (ListLongMap!20210 (toList!10120 List!29675)) )
))
(declare-fun contains!8168 (ListLongMap!20209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5036 (array!86421 array!86419 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 32) Int) ListLongMap!20209)

(assert (=> b!1298586 (contains!8168 (getCurrentListMap!5036 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42844 0))(
  ( (Unit!42845) )
))
(declare-fun lt!580546 () Unit!42844)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 (array!86421 array!86419 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 64) (_ BitVec 32) Int) Unit!42844)

(assert (=> b!1298586 (= lt!580546 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298587 () Bool)

(declare-fun tp_is_empty!34759 () Bool)

(assert (=> b!1298587 (= e!740835 tp_is_empty!34759)))

(declare-fun b!1298588 () Bool)

(declare-fun res!863040 () Bool)

(assert (=> b!1298588 (=> (not res!863040) (not e!740836))))

(assert (=> b!1298588 (= res!863040 (and (= (size!42263 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42264 _keys!1741) (size!42263 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298589 () Bool)

(declare-fun res!863045 () Bool)

(assert (=> b!1298589 (=> (not res!863045) (not e!740836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86421 (_ BitVec 32)) Bool)

(assert (=> b!1298589 (= res!863045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53699 () Bool)

(assert (=> mapIsEmpty!53699 mapRes!53699))

(declare-fun b!1298590 () Bool)

(assert (=> b!1298590 (= e!740837 tp_is_empty!34759)))

(declare-fun b!1298591 () Bool)

(declare-fun res!863044 () Bool)

(assert (=> b!1298591 (=> (not res!863044) (not e!740836))))

(assert (=> b!1298591 (= res!863044 (contains!8168 (getCurrentListMap!5036 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298592 () Bool)

(declare-fun res!863041 () Bool)

(assert (=> b!1298592 (=> (not res!863041) (not e!740836))))

(assert (=> b!1298592 (= res!863041 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42264 _keys!1741)) (not (= (select (arr!41712 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298583 () Bool)

(declare-fun res!863042 () Bool)

(assert (=> b!1298583 (=> (not res!863042) (not e!740836))))

(assert (=> b!1298583 (= res!863042 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42264 _keys!1741))))))

(declare-fun res!863046 () Bool)

(assert (=> start!109630 (=> (not res!863046) (not e!740836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109630 (= res!863046 (validMask!0 mask!2175))))

(assert (=> start!109630 e!740836))

(assert (=> start!109630 tp_is_empty!34759))

(assert (=> start!109630 true))

(declare-fun array_inv!31727 (array!86419) Bool)

(assert (=> start!109630 (and (array_inv!31727 _values!1445) e!740834)))

(declare-fun array_inv!31728 (array!86421) Bool)

(assert (=> start!109630 (array_inv!31728 _keys!1741)))

(assert (=> start!109630 tp!102477))

(assert (= (and start!109630 res!863046) b!1298588))

(assert (= (and b!1298588 res!863040) b!1298589))

(assert (= (and b!1298589 res!863045) b!1298585))

(assert (= (and b!1298585 res!863043) b!1298583))

(assert (= (and b!1298583 res!863042) b!1298591))

(assert (= (and b!1298591 res!863044) b!1298592))

(assert (= (and b!1298592 res!863041) b!1298586))

(assert (= (and b!1298584 condMapEmpty!53699) mapIsEmpty!53699))

(assert (= (and b!1298584 (not condMapEmpty!53699)) mapNonEmpty!53699))

(get-info :version)

(assert (= (and mapNonEmpty!53699 ((_ is ValueCellFull!16481) mapValue!53699)) b!1298590))

(assert (= (and b!1298584 ((_ is ValueCellFull!16481) mapDefault!53699)) b!1298587))

(assert (= start!109630 b!1298584))

(declare-fun m!1189455 () Bool)

(assert (=> start!109630 m!1189455))

(declare-fun m!1189457 () Bool)

(assert (=> start!109630 m!1189457))

(declare-fun m!1189459 () Bool)

(assert (=> start!109630 m!1189459))

(declare-fun m!1189461 () Bool)

(assert (=> mapNonEmpty!53699 m!1189461))

(declare-fun m!1189463 () Bool)

(assert (=> b!1298592 m!1189463))

(declare-fun m!1189465 () Bool)

(assert (=> b!1298591 m!1189465))

(assert (=> b!1298591 m!1189465))

(declare-fun m!1189467 () Bool)

(assert (=> b!1298591 m!1189467))

(declare-fun m!1189469 () Bool)

(assert (=> b!1298589 m!1189469))

(declare-fun m!1189471 () Bool)

(assert (=> b!1298586 m!1189471))

(assert (=> b!1298586 m!1189471))

(declare-fun m!1189473 () Bool)

(assert (=> b!1298586 m!1189473))

(declare-fun m!1189475 () Bool)

(assert (=> b!1298586 m!1189475))

(declare-fun m!1189477 () Bool)

(assert (=> b!1298585 m!1189477))

(check-sat (not b!1298586) (not b_next!29119) b_and!47191 (not b!1298589) (not mapNonEmpty!53699) (not b!1298585) (not start!109630) tp_is_empty!34759 (not b!1298591))
(check-sat b_and!47191 (not b_next!29119))
