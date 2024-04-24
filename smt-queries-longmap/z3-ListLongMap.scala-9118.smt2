; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109716 () Bool)

(assert start!109716)

(declare-fun b_free!28981 () Bool)

(declare-fun b_next!28981 () Bool)

(assert (=> start!109716 (= b_free!28981 (not b_next!28981))))

(declare-fun tp!102061 () Bool)

(declare-fun b_and!47073 () Bool)

(assert (=> start!109716 (= tp!102061 b_and!47073)))

(declare-fun b!1298105 () Bool)

(declare-fun res!862365 () Bool)

(declare-fun e!740676 () Bool)

(assert (=> b!1298105 (=> (not res!862365) (not e!740676))))

(declare-datatypes ((array!86293 0))(
  ( (array!86294 (arr!41643 (Array (_ BitVec 32) (_ BitVec 64))) (size!42194 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86293)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86293 (_ BitVec 32)) Bool)

(assert (=> b!1298105 (= res!862365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298106 () Bool)

(declare-fun res!862361 () Bool)

(assert (=> b!1298106 (=> (not res!862361) (not e!740676))))

(declare-datatypes ((V!51265 0))(
  ( (V!51266 (val!17385 Int)) )
))
(declare-datatypes ((ValueCell!16412 0))(
  ( (ValueCellFull!16412 (v!19983 V!51265)) (EmptyCell!16412) )
))
(declare-datatypes ((array!86295 0))(
  ( (array!86296 (arr!41644 (Array (_ BitVec 32) ValueCell!16412)) (size!42195 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86295)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298106 (= res!862361 (and (= (size!42195 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42194 _keys!1741) (size!42195 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53492 () Bool)

(declare-fun mapRes!53492 () Bool)

(assert (=> mapIsEmpty!53492 mapRes!53492))

(declare-fun b!1298107 () Bool)

(declare-fun e!740675 () Bool)

(declare-fun tp_is_empty!34621 () Bool)

(assert (=> b!1298107 (= e!740675 tp_is_empty!34621)))

(declare-fun b!1298108 () Bool)

(declare-fun res!862364 () Bool)

(assert (=> b!1298108 (=> (not res!862364) (not e!740676))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298108 (= res!862364 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42194 _keys!1741))))))

(declare-fun res!862362 () Bool)

(assert (=> start!109716 (=> (not res!862362) (not e!740676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109716 (= res!862362 (validMask!0 mask!2175))))

(assert (=> start!109716 e!740676))

(assert (=> start!109716 tp_is_empty!34621))

(assert (=> start!109716 true))

(declare-fun e!740679 () Bool)

(declare-fun array_inv!31759 (array!86295) Bool)

(assert (=> start!109716 (and (array_inv!31759 _values!1445) e!740679)))

(declare-fun array_inv!31760 (array!86293) Bool)

(assert (=> start!109716 (array_inv!31760 _keys!1741)))

(assert (=> start!109716 tp!102061))

(declare-fun b!1298109 () Bool)

(assert (=> b!1298109 (= e!740676 (bvslt (bvsub (size!42194 _keys!1741) from!2144) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!53492 () Bool)

(declare-fun tp!102062 () Bool)

(assert (=> mapNonEmpty!53492 (= mapRes!53492 (and tp!102062 e!740675))))

(declare-fun mapValue!53492 () ValueCell!16412)

(declare-fun mapKey!53492 () (_ BitVec 32))

(declare-fun mapRest!53492 () (Array (_ BitVec 32) ValueCell!16412))

(assert (=> mapNonEmpty!53492 (= (arr!41644 _values!1445) (store mapRest!53492 mapKey!53492 mapValue!53492))))

(declare-fun b!1298110 () Bool)

(declare-fun e!740678 () Bool)

(assert (=> b!1298110 (= e!740678 tp_is_empty!34621)))

(declare-fun b!1298111 () Bool)

(declare-fun res!862363 () Bool)

(assert (=> b!1298111 (=> (not res!862363) (not e!740676))))

(declare-fun minValue!1387 () V!51265)

(declare-fun zeroValue!1387 () V!51265)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22406 0))(
  ( (tuple2!22407 (_1!11214 (_ BitVec 64)) (_2!11214 V!51265)) )
))
(declare-datatypes ((List!29570 0))(
  ( (Nil!29567) (Cons!29566 (h!30784 tuple2!22406) (t!43126 List!29570)) )
))
(declare-datatypes ((ListLongMap!20071 0))(
  ( (ListLongMap!20072 (toList!10051 List!29570)) )
))
(declare-fun contains!8181 (ListLongMap!20071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5070 (array!86293 array!86295 (_ BitVec 32) (_ BitVec 32) V!51265 V!51265 (_ BitVec 32) Int) ListLongMap!20071)

(assert (=> b!1298111 (= res!862363 (contains!8181 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298112 () Bool)

(assert (=> b!1298112 (= e!740679 (and e!740678 mapRes!53492))))

(declare-fun condMapEmpty!53492 () Bool)

(declare-fun mapDefault!53492 () ValueCell!16412)

(assert (=> b!1298112 (= condMapEmpty!53492 (= (arr!41644 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16412)) mapDefault!53492)))))

(declare-fun b!1298113 () Bool)

(declare-fun res!862366 () Bool)

(assert (=> b!1298113 (=> (not res!862366) (not e!740676))))

(declare-datatypes ((List!29571 0))(
  ( (Nil!29568) (Cons!29567 (h!30785 (_ BitVec 64)) (t!43127 List!29571)) )
))
(declare-fun arrayNoDuplicates!0 (array!86293 (_ BitVec 32) List!29571) Bool)

(assert (=> b!1298113 (= res!862366 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29568))))

(assert (= (and start!109716 res!862362) b!1298106))

(assert (= (and b!1298106 res!862361) b!1298105))

(assert (= (and b!1298105 res!862365) b!1298113))

(assert (= (and b!1298113 res!862366) b!1298108))

(assert (= (and b!1298108 res!862364) b!1298111))

(assert (= (and b!1298111 res!862363) b!1298109))

(assert (= (and b!1298112 condMapEmpty!53492) mapIsEmpty!53492))

(assert (= (and b!1298112 (not condMapEmpty!53492)) mapNonEmpty!53492))

(get-info :version)

(assert (= (and mapNonEmpty!53492 ((_ is ValueCellFull!16412) mapValue!53492)) b!1298107))

(assert (= (and b!1298112 ((_ is ValueCellFull!16412) mapDefault!53492)) b!1298110))

(assert (= start!109716 b!1298112))

(declare-fun m!1190229 () Bool)

(assert (=> b!1298105 m!1190229))

(declare-fun m!1190231 () Bool)

(assert (=> mapNonEmpty!53492 m!1190231))

(declare-fun m!1190233 () Bool)

(assert (=> start!109716 m!1190233))

(declare-fun m!1190235 () Bool)

(assert (=> start!109716 m!1190235))

(declare-fun m!1190237 () Bool)

(assert (=> start!109716 m!1190237))

(declare-fun m!1190239 () Bool)

(assert (=> b!1298111 m!1190239))

(assert (=> b!1298111 m!1190239))

(declare-fun m!1190241 () Bool)

(assert (=> b!1298111 m!1190241))

(declare-fun m!1190243 () Bool)

(assert (=> b!1298113 m!1190243))

(check-sat (not b!1298105) (not start!109716) tp_is_empty!34621 (not b_next!28981) (not b!1298111) b_and!47073 (not mapNonEmpty!53492) (not b!1298113))
(check-sat b_and!47073 (not b_next!28981))
