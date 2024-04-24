; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109740 () Bool)

(assert start!109740)

(declare-fun b_free!29005 () Bool)

(declare-fun b_next!29005 () Bool)

(assert (=> start!109740 (= b_free!29005 (not b_next!29005))))

(declare-fun tp!102133 () Bool)

(declare-fun b_and!47097 () Bool)

(assert (=> start!109740 (= tp!102133 b_and!47097)))

(declare-fun b!1298400 () Bool)

(declare-fun e!740855 () Bool)

(declare-fun tp_is_empty!34645 () Bool)

(assert (=> b!1298400 (= e!740855 tp_is_empty!34645)))

(declare-fun b!1298401 () Bool)

(declare-fun res!862550 () Bool)

(declare-fun e!740858 () Bool)

(assert (=> b!1298401 (=> (not res!862550) (not e!740858))))

(declare-datatypes ((array!86341 0))(
  ( (array!86342 (arr!41667 (Array (_ BitVec 32) (_ BitVec 64))) (size!42218 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86341)

(declare-datatypes ((List!29589 0))(
  ( (Nil!29586) (Cons!29585 (h!30803 (_ BitVec 64)) (t!43145 List!29589)) )
))
(declare-fun arrayNoDuplicates!0 (array!86341 (_ BitVec 32) List!29589) Bool)

(assert (=> b!1298401 (= res!862550 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29586))))

(declare-fun b!1298402 () Bool)

(declare-fun res!862552 () Bool)

(assert (=> b!1298402 (=> (not res!862552) (not e!740858))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51297 0))(
  ( (V!51298 (val!17397 Int)) )
))
(declare-datatypes ((ValueCell!16424 0))(
  ( (ValueCellFull!16424 (v!19995 V!51297)) (EmptyCell!16424) )
))
(declare-datatypes ((array!86343 0))(
  ( (array!86344 (arr!41668 (Array (_ BitVec 32) ValueCell!16424)) (size!42219 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86343)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298402 (= res!862552 (and (= (size!42219 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42218 _keys!1741) (size!42219 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298403 () Bool)

(declare-fun e!740856 () Bool)

(declare-fun mapRes!53528 () Bool)

(assert (=> b!1298403 (= e!740856 (and e!740855 mapRes!53528))))

(declare-fun condMapEmpty!53528 () Bool)

(declare-fun mapDefault!53528 () ValueCell!16424)

(assert (=> b!1298403 (= condMapEmpty!53528 (= (arr!41668 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16424)) mapDefault!53528)))))

(declare-fun b!1298404 () Bool)

(declare-fun e!740857 () Bool)

(assert (=> b!1298404 (= e!740857 tp_is_empty!34645)))

(declare-fun mapNonEmpty!53528 () Bool)

(declare-fun tp!102134 () Bool)

(assert (=> mapNonEmpty!53528 (= mapRes!53528 (and tp!102134 e!740857))))

(declare-fun mapKey!53528 () (_ BitVec 32))

(declare-fun mapRest!53528 () (Array (_ BitVec 32) ValueCell!16424))

(declare-fun mapValue!53528 () ValueCell!16424)

(assert (=> mapNonEmpty!53528 (= (arr!41668 _values!1445) (store mapRest!53528 mapKey!53528 mapValue!53528))))

(declare-fun b!1298405 () Bool)

(declare-fun res!862549 () Bool)

(assert (=> b!1298405 (=> (not res!862549) (not e!740858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86341 (_ BitVec 32)) Bool)

(assert (=> b!1298405 (= res!862549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298406 () Bool)

(declare-fun res!862548 () Bool)

(assert (=> b!1298406 (=> (not res!862548) (not e!740858))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298406 (= res!862548 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42218 _keys!1741))))))

(declare-fun b!1298407 () Bool)

(assert (=> b!1298407 (= e!740858 false)))

(declare-fun minValue!1387 () V!51297)

(declare-fun zeroValue!1387 () V!51297)

(declare-fun lt!581037 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22424 0))(
  ( (tuple2!22425 (_1!11223 (_ BitVec 64)) (_2!11223 V!51297)) )
))
(declare-datatypes ((List!29590 0))(
  ( (Nil!29587) (Cons!29586 (h!30804 tuple2!22424) (t!43146 List!29590)) )
))
(declare-datatypes ((ListLongMap!20089 0))(
  ( (ListLongMap!20090 (toList!10060 List!29590)) )
))
(declare-fun contains!8190 (ListLongMap!20089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5079 (array!86341 array!86343 (_ BitVec 32) (_ BitVec 32) V!51297 V!51297 (_ BitVec 32) Int) ListLongMap!20089)

(assert (=> b!1298407 (= lt!581037 (contains!8190 (getCurrentListMap!5079 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862551 () Bool)

(assert (=> start!109740 (=> (not res!862551) (not e!740858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109740 (= res!862551 (validMask!0 mask!2175))))

(assert (=> start!109740 e!740858))

(assert (=> start!109740 tp_is_empty!34645))

(assert (=> start!109740 true))

(declare-fun array_inv!31777 (array!86343) Bool)

(assert (=> start!109740 (and (array_inv!31777 _values!1445) e!740856)))

(declare-fun array_inv!31778 (array!86341) Bool)

(assert (=> start!109740 (array_inv!31778 _keys!1741)))

(assert (=> start!109740 tp!102133))

(declare-fun mapIsEmpty!53528 () Bool)

(assert (=> mapIsEmpty!53528 mapRes!53528))

(assert (= (and start!109740 res!862551) b!1298402))

(assert (= (and b!1298402 res!862552) b!1298405))

(assert (= (and b!1298405 res!862549) b!1298401))

(assert (= (and b!1298401 res!862550) b!1298406))

(assert (= (and b!1298406 res!862548) b!1298407))

(assert (= (and b!1298403 condMapEmpty!53528) mapIsEmpty!53528))

(assert (= (and b!1298403 (not condMapEmpty!53528)) mapNonEmpty!53528))

(get-info :version)

(assert (= (and mapNonEmpty!53528 ((_ is ValueCellFull!16424) mapValue!53528)) b!1298404))

(assert (= (and b!1298403 ((_ is ValueCellFull!16424) mapDefault!53528)) b!1298400))

(assert (= start!109740 b!1298403))

(declare-fun m!1190421 () Bool)

(assert (=> mapNonEmpty!53528 m!1190421))

(declare-fun m!1190423 () Bool)

(assert (=> start!109740 m!1190423))

(declare-fun m!1190425 () Bool)

(assert (=> start!109740 m!1190425))

(declare-fun m!1190427 () Bool)

(assert (=> start!109740 m!1190427))

(declare-fun m!1190429 () Bool)

(assert (=> b!1298407 m!1190429))

(assert (=> b!1298407 m!1190429))

(declare-fun m!1190431 () Bool)

(assert (=> b!1298407 m!1190431))

(declare-fun m!1190433 () Bool)

(assert (=> b!1298405 m!1190433))

(declare-fun m!1190435 () Bool)

(assert (=> b!1298401 m!1190435))

(check-sat tp_is_empty!34645 (not b!1298401) b_and!47097 (not b_next!29005) (not mapNonEmpty!53528) (not start!109740) (not b!1298407) (not b!1298405))
(check-sat b_and!47097 (not b_next!29005))
