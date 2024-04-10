; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109560 () Bool)

(assert start!109560)

(declare-fun b_free!29049 () Bool)

(declare-fun b_next!29049 () Bool)

(assert (=> start!109560 (= b_free!29049 (not b_next!29049))))

(declare-fun tp!102266 () Bool)

(declare-fun b_and!47139 () Bool)

(assert (=> start!109560 (= tp!102266 b_and!47139)))

(declare-fun b!1297623 () Bool)

(declare-fun e!740340 () Bool)

(declare-fun tp_is_empty!34689 () Bool)

(assert (=> b!1297623 (= e!740340 tp_is_empty!34689)))

(declare-fun b!1297624 () Bool)

(declare-fun e!740339 () Bool)

(assert (=> b!1297624 (= e!740339 false)))

(declare-datatypes ((V!51355 0))(
  ( (V!51356 (val!17419 Int)) )
))
(declare-fun minValue!1387 () V!51355)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16446 0))(
  ( (ValueCellFull!16446 (v!20022 V!51355)) (EmptyCell!16446) )
))
(declare-datatypes ((array!86388 0))(
  ( (array!86389 (arr!41695 (Array (_ BitVec 32) ValueCell!16446)) (size!42245 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86388)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86390 0))(
  ( (array!86391 (arr!41696 (Array (_ BitVec 32) (_ BitVec 64))) (size!42246 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86390)

(declare-fun lt!580619 () Bool)

(declare-fun zeroValue!1387 () V!51355)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22448 0))(
  ( (tuple2!22449 (_1!11235 (_ BitVec 64)) (_2!11235 V!51355)) )
))
(declare-datatypes ((List!29583 0))(
  ( (Nil!29580) (Cons!29579 (h!30788 tuple2!22448) (t!43147 List!29583)) )
))
(declare-datatypes ((ListLongMap!20105 0))(
  ( (ListLongMap!20106 (toList!10068 List!29583)) )
))
(declare-fun contains!8186 (ListLongMap!20105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5097 (array!86390 array!86388 (_ BitVec 32) (_ BitVec 32) V!51355 V!51355 (_ BitVec 32) Int) ListLongMap!20105)

(assert (=> b!1297624 (= lt!580619 (contains!8186 (getCurrentListMap!5097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862359 () Bool)

(assert (=> start!109560 (=> (not res!862359) (not e!740339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109560 (= res!862359 (validMask!0 mask!2175))))

(assert (=> start!109560 e!740339))

(assert (=> start!109560 tp_is_empty!34689))

(assert (=> start!109560 true))

(declare-fun e!740341 () Bool)

(declare-fun array_inv!31559 (array!86388) Bool)

(assert (=> start!109560 (and (array_inv!31559 _values!1445) e!740341)))

(declare-fun array_inv!31560 (array!86390) Bool)

(assert (=> start!109560 (array_inv!31560 _keys!1741)))

(assert (=> start!109560 tp!102266))

(declare-fun b!1297625 () Bool)

(declare-fun res!862361 () Bool)

(assert (=> b!1297625 (=> (not res!862361) (not e!740339))))

(assert (=> b!1297625 (= res!862361 (and (= (size!42245 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42246 _keys!1741) (size!42245 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297626 () Bool)

(declare-fun res!862360 () Bool)

(assert (=> b!1297626 (=> (not res!862360) (not e!740339))))

(declare-datatypes ((List!29584 0))(
  ( (Nil!29581) (Cons!29580 (h!30789 (_ BitVec 64)) (t!43148 List!29584)) )
))
(declare-fun arrayNoDuplicates!0 (array!86390 (_ BitVec 32) List!29584) Bool)

(assert (=> b!1297626 (= res!862360 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29581))))

(declare-fun b!1297627 () Bool)

(declare-fun e!740338 () Bool)

(declare-fun mapRes!53594 () Bool)

(assert (=> b!1297627 (= e!740341 (and e!740338 mapRes!53594))))

(declare-fun condMapEmpty!53594 () Bool)

(declare-fun mapDefault!53594 () ValueCell!16446)

(assert (=> b!1297627 (= condMapEmpty!53594 (= (arr!41695 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16446)) mapDefault!53594)))))

(declare-fun b!1297628 () Bool)

(declare-fun res!862362 () Bool)

(assert (=> b!1297628 (=> (not res!862362) (not e!740339))))

(assert (=> b!1297628 (= res!862362 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42246 _keys!1741))))))

(declare-fun b!1297629 () Bool)

(declare-fun res!862358 () Bool)

(assert (=> b!1297629 (=> (not res!862358) (not e!740339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86390 (_ BitVec 32)) Bool)

(assert (=> b!1297629 (= res!862358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53594 () Bool)

(declare-fun tp!102265 () Bool)

(assert (=> mapNonEmpty!53594 (= mapRes!53594 (and tp!102265 e!740340))))

(declare-fun mapRest!53594 () (Array (_ BitVec 32) ValueCell!16446))

(declare-fun mapValue!53594 () ValueCell!16446)

(declare-fun mapKey!53594 () (_ BitVec 32))

(assert (=> mapNonEmpty!53594 (= (arr!41695 _values!1445) (store mapRest!53594 mapKey!53594 mapValue!53594))))

(declare-fun b!1297630 () Bool)

(assert (=> b!1297630 (= e!740338 tp_is_empty!34689)))

(declare-fun mapIsEmpty!53594 () Bool)

(assert (=> mapIsEmpty!53594 mapRes!53594))

(assert (= (and start!109560 res!862359) b!1297625))

(assert (= (and b!1297625 res!862361) b!1297629))

(assert (= (and b!1297629 res!862358) b!1297626))

(assert (= (and b!1297626 res!862360) b!1297628))

(assert (= (and b!1297628 res!862362) b!1297624))

(assert (= (and b!1297627 condMapEmpty!53594) mapIsEmpty!53594))

(assert (= (and b!1297627 (not condMapEmpty!53594)) mapNonEmpty!53594))

(get-info :version)

(assert (= (and mapNonEmpty!53594 ((_ is ValueCellFull!16446) mapValue!53594)) b!1297623))

(assert (= (and b!1297627 ((_ is ValueCellFull!16446) mapDefault!53594)) b!1297630))

(assert (= start!109560 b!1297627))

(declare-fun m!1189155 () Bool)

(assert (=> b!1297624 m!1189155))

(assert (=> b!1297624 m!1189155))

(declare-fun m!1189157 () Bool)

(assert (=> b!1297624 m!1189157))

(declare-fun m!1189159 () Bool)

(assert (=> b!1297626 m!1189159))

(declare-fun m!1189161 () Bool)

(assert (=> start!109560 m!1189161))

(declare-fun m!1189163 () Bool)

(assert (=> start!109560 m!1189163))

(declare-fun m!1189165 () Bool)

(assert (=> start!109560 m!1189165))

(declare-fun m!1189167 () Bool)

(assert (=> b!1297629 m!1189167))

(declare-fun m!1189169 () Bool)

(assert (=> mapNonEmpty!53594 m!1189169))

(check-sat b_and!47139 (not b!1297629) (not mapNonEmpty!53594) (not b!1297626) (not b!1297624) tp_is_empty!34689 (not b_next!29049) (not start!109560))
(check-sat b_and!47139 (not b_next!29049))
