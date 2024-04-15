; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109516 () Bool)

(assert start!109516)

(declare-fun b_free!29005 () Bool)

(declare-fun b_next!29005 () Bool)

(assert (=> start!109516 (= b_free!29005 (not b_next!29005))))

(declare-fun tp!102134 () Bool)

(declare-fun b_and!47077 () Bool)

(assert (=> start!109516 (= tp!102134 b_and!47077)))

(declare-fun b!1297031 () Bool)

(declare-fun e!739983 () Bool)

(assert (=> b!1297031 (= e!739983 false)))

(declare-datatypes ((V!51297 0))(
  ( (V!51298 (val!17397 Int)) )
))
(declare-fun minValue!1387 () V!51297)

(declare-fun zeroValue!1387 () V!51297)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16424 0))(
  ( (ValueCellFull!16424 (v!19999 V!51297)) (EmptyCell!16424) )
))
(declare-datatypes ((array!86199 0))(
  ( (array!86200 (arr!41601 (Array (_ BitVec 32) ValueCell!16424)) (size!42153 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86199)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86201 0))(
  ( (array!86202 (arr!41602 (Array (_ BitVec 32) (_ BitVec 64))) (size!42154 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86201)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!580375 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22474 0))(
  ( (tuple2!22475 (_1!11248 (_ BitVec 64)) (_2!11248 V!51297)) )
))
(declare-datatypes ((List!29599 0))(
  ( (Nil!29596) (Cons!29595 (h!30804 tuple2!22474) (t!43155 List!29599)) )
))
(declare-datatypes ((ListLongMap!20131 0))(
  ( (ListLongMap!20132 (toList!10081 List!29599)) )
))
(declare-fun contains!8129 (ListLongMap!20131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4997 (array!86201 array!86199 (_ BitVec 32) (_ BitVec 32) V!51297 V!51297 (_ BitVec 32) Int) ListLongMap!20131)

(assert (=> b!1297031 (= lt!580375 (contains!8129 (getCurrentListMap!4997 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53528 () Bool)

(declare-fun mapRes!53528 () Bool)

(declare-fun tp!102135 () Bool)

(declare-fun e!739980 () Bool)

(assert (=> mapNonEmpty!53528 (= mapRes!53528 (and tp!102135 e!739980))))

(declare-fun mapRest!53528 () (Array (_ BitVec 32) ValueCell!16424))

(declare-fun mapKey!53528 () (_ BitVec 32))

(declare-fun mapValue!53528 () ValueCell!16424)

(assert (=> mapNonEmpty!53528 (= (arr!41601 _values!1445) (store mapRest!53528 mapKey!53528 mapValue!53528))))

(declare-fun b!1297032 () Bool)

(declare-fun res!862005 () Bool)

(assert (=> b!1297032 (=> (not res!862005) (not e!739983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86201 (_ BitVec 32)) Bool)

(assert (=> b!1297032 (= res!862005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297033 () Bool)

(declare-fun tp_is_empty!34645 () Bool)

(assert (=> b!1297033 (= e!739980 tp_is_empty!34645)))

(declare-fun b!1297034 () Bool)

(declare-fun e!739981 () Bool)

(assert (=> b!1297034 (= e!739981 tp_is_empty!34645)))

(declare-fun b!1297036 () Bool)

(declare-fun res!862001 () Bool)

(assert (=> b!1297036 (=> (not res!862001) (not e!739983))))

(declare-datatypes ((List!29600 0))(
  ( (Nil!29597) (Cons!29596 (h!30805 (_ BitVec 64)) (t!43156 List!29600)) )
))
(declare-fun arrayNoDuplicates!0 (array!86201 (_ BitVec 32) List!29600) Bool)

(assert (=> b!1297036 (= res!862001 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29597))))

(declare-fun b!1297037 () Bool)

(declare-fun res!862004 () Bool)

(assert (=> b!1297037 (=> (not res!862004) (not e!739983))))

(assert (=> b!1297037 (= res!862004 (and (= (size!42153 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42154 _keys!1741) (size!42153 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297038 () Bool)

(declare-fun res!862002 () Bool)

(assert (=> b!1297038 (=> (not res!862002) (not e!739983))))

(assert (=> b!1297038 (= res!862002 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42154 _keys!1741))))))

(declare-fun mapIsEmpty!53528 () Bool)

(assert (=> mapIsEmpty!53528 mapRes!53528))

(declare-fun res!862003 () Bool)

(assert (=> start!109516 (=> (not res!862003) (not e!739983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109516 (= res!862003 (validMask!0 mask!2175))))

(assert (=> start!109516 e!739983))

(assert (=> start!109516 tp_is_empty!34645))

(assert (=> start!109516 true))

(declare-fun e!739982 () Bool)

(declare-fun array_inv!31655 (array!86199) Bool)

(assert (=> start!109516 (and (array_inv!31655 _values!1445) e!739982)))

(declare-fun array_inv!31656 (array!86201) Bool)

(assert (=> start!109516 (array_inv!31656 _keys!1741)))

(assert (=> start!109516 tp!102134))

(declare-fun b!1297035 () Bool)

(assert (=> b!1297035 (= e!739982 (and e!739981 mapRes!53528))))

(declare-fun condMapEmpty!53528 () Bool)

(declare-fun mapDefault!53528 () ValueCell!16424)

(assert (=> b!1297035 (= condMapEmpty!53528 (= (arr!41601 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16424)) mapDefault!53528)))))

(assert (= (and start!109516 res!862003) b!1297037))

(assert (= (and b!1297037 res!862004) b!1297032))

(assert (= (and b!1297032 res!862005) b!1297036))

(assert (= (and b!1297036 res!862001) b!1297038))

(assert (= (and b!1297038 res!862002) b!1297031))

(assert (= (and b!1297035 condMapEmpty!53528) mapIsEmpty!53528))

(assert (= (and b!1297035 (not condMapEmpty!53528)) mapNonEmpty!53528))

(get-info :version)

(assert (= (and mapNonEmpty!53528 ((_ is ValueCellFull!16424) mapValue!53528)) b!1297033))

(assert (= (and b!1297035 ((_ is ValueCellFull!16424) mapDefault!53528)) b!1297034))

(assert (= start!109516 b!1297035))

(declare-fun m!1188303 () Bool)

(assert (=> mapNonEmpty!53528 m!1188303))

(declare-fun m!1188305 () Bool)

(assert (=> start!109516 m!1188305))

(declare-fun m!1188307 () Bool)

(assert (=> start!109516 m!1188307))

(declare-fun m!1188309 () Bool)

(assert (=> start!109516 m!1188309))

(declare-fun m!1188311 () Bool)

(assert (=> b!1297036 m!1188311))

(declare-fun m!1188313 () Bool)

(assert (=> b!1297032 m!1188313))

(declare-fun m!1188315 () Bool)

(assert (=> b!1297031 m!1188315))

(assert (=> b!1297031 m!1188315))

(declare-fun m!1188317 () Bool)

(assert (=> b!1297031 m!1188317))

(check-sat (not mapNonEmpty!53528) (not b!1297032) (not start!109516) (not b_next!29005) (not b!1297031) (not b!1297036) b_and!47077 tp_is_empty!34645)
(check-sat b_and!47077 (not b_next!29005))
