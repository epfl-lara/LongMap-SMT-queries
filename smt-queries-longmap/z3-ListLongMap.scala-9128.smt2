; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109554 () Bool)

(assert start!109554)

(declare-fun b_free!29043 () Bool)

(declare-fun b_next!29043 () Bool)

(assert (=> start!109554 (= b_free!29043 (not b_next!29043))))

(declare-fun tp!102248 () Bool)

(declare-fun b_and!47133 () Bool)

(assert (=> start!109554 (= tp!102248 b_and!47133)))

(declare-fun mapNonEmpty!53585 () Bool)

(declare-fun mapRes!53585 () Bool)

(declare-fun tp!102247 () Bool)

(declare-fun e!740296 () Bool)

(assert (=> mapNonEmpty!53585 (= mapRes!53585 (and tp!102247 e!740296))))

(declare-datatypes ((V!51347 0))(
  ( (V!51348 (val!17416 Int)) )
))
(declare-datatypes ((ValueCell!16443 0))(
  ( (ValueCellFull!16443 (v!20019 V!51347)) (EmptyCell!16443) )
))
(declare-fun mapRest!53585 () (Array (_ BitVec 32) ValueCell!16443))

(declare-datatypes ((array!86376 0))(
  ( (array!86377 (arr!41689 (Array (_ BitVec 32) ValueCell!16443)) (size!42239 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86376)

(declare-fun mapValue!53585 () ValueCell!16443)

(declare-fun mapKey!53585 () (_ BitVec 32))

(assert (=> mapNonEmpty!53585 (= (arr!41689 _values!1445) (store mapRest!53585 mapKey!53585 mapValue!53585))))

(declare-fun b!1297551 () Bool)

(declare-fun res!862313 () Bool)

(declare-fun e!740297 () Bool)

(assert (=> b!1297551 (=> (not res!862313) (not e!740297))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86378 0))(
  ( (array!86379 (arr!41690 (Array (_ BitVec 32) (_ BitVec 64))) (size!42240 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86378)

(assert (=> b!1297551 (= res!862313 (and (= (size!42239 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42240 _keys!1741) (size!42239 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297552 () Bool)

(declare-fun res!862316 () Bool)

(assert (=> b!1297552 (=> (not res!862316) (not e!740297))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297552 (= res!862316 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42240 _keys!1741))))))

(declare-fun mapIsEmpty!53585 () Bool)

(assert (=> mapIsEmpty!53585 mapRes!53585))

(declare-fun b!1297553 () Bool)

(declare-fun e!740295 () Bool)

(declare-fun e!740294 () Bool)

(assert (=> b!1297553 (= e!740295 (and e!740294 mapRes!53585))))

(declare-fun condMapEmpty!53585 () Bool)

(declare-fun mapDefault!53585 () ValueCell!16443)

(assert (=> b!1297553 (= condMapEmpty!53585 (= (arr!41689 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16443)) mapDefault!53585)))))

(declare-fun b!1297554 () Bool)

(declare-fun tp_is_empty!34683 () Bool)

(assert (=> b!1297554 (= e!740294 tp_is_empty!34683)))

(declare-fun b!1297555 () Bool)

(declare-fun res!862317 () Bool)

(assert (=> b!1297555 (=> (not res!862317) (not e!740297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86378 (_ BitVec 32)) Bool)

(assert (=> b!1297555 (= res!862317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297556 () Bool)

(assert (=> b!1297556 (= e!740297 false)))

(declare-fun minValue!1387 () V!51347)

(declare-fun zeroValue!1387 () V!51347)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580610 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22442 0))(
  ( (tuple2!22443 (_1!11232 (_ BitVec 64)) (_2!11232 V!51347)) )
))
(declare-datatypes ((List!29577 0))(
  ( (Nil!29574) (Cons!29573 (h!30782 tuple2!22442) (t!43141 List!29577)) )
))
(declare-datatypes ((ListLongMap!20099 0))(
  ( (ListLongMap!20100 (toList!10065 List!29577)) )
))
(declare-fun contains!8183 (ListLongMap!20099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5094 (array!86378 array!86376 (_ BitVec 32) (_ BitVec 32) V!51347 V!51347 (_ BitVec 32) Int) ListLongMap!20099)

(assert (=> b!1297556 (= lt!580610 (contains!8183 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862315 () Bool)

(assert (=> start!109554 (=> (not res!862315) (not e!740297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109554 (= res!862315 (validMask!0 mask!2175))))

(assert (=> start!109554 e!740297))

(assert (=> start!109554 tp_is_empty!34683))

(assert (=> start!109554 true))

(declare-fun array_inv!31553 (array!86376) Bool)

(assert (=> start!109554 (and (array_inv!31553 _values!1445) e!740295)))

(declare-fun array_inv!31554 (array!86378) Bool)

(assert (=> start!109554 (array_inv!31554 _keys!1741)))

(assert (=> start!109554 tp!102248))

(declare-fun b!1297557 () Bool)

(declare-fun res!862314 () Bool)

(assert (=> b!1297557 (=> (not res!862314) (not e!740297))))

(declare-datatypes ((List!29578 0))(
  ( (Nil!29575) (Cons!29574 (h!30783 (_ BitVec 64)) (t!43142 List!29578)) )
))
(declare-fun arrayNoDuplicates!0 (array!86378 (_ BitVec 32) List!29578) Bool)

(assert (=> b!1297557 (= res!862314 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29575))))

(declare-fun b!1297558 () Bool)

(assert (=> b!1297558 (= e!740296 tp_is_empty!34683)))

(assert (= (and start!109554 res!862315) b!1297551))

(assert (= (and b!1297551 res!862313) b!1297555))

(assert (= (and b!1297555 res!862317) b!1297557))

(assert (= (and b!1297557 res!862314) b!1297552))

(assert (= (and b!1297552 res!862316) b!1297556))

(assert (= (and b!1297553 condMapEmpty!53585) mapIsEmpty!53585))

(assert (= (and b!1297553 (not condMapEmpty!53585)) mapNonEmpty!53585))

(get-info :version)

(assert (= (and mapNonEmpty!53585 ((_ is ValueCellFull!16443) mapValue!53585)) b!1297558))

(assert (= (and b!1297553 ((_ is ValueCellFull!16443) mapDefault!53585)) b!1297554))

(assert (= start!109554 b!1297553))

(declare-fun m!1189107 () Bool)

(assert (=> b!1297556 m!1189107))

(assert (=> b!1297556 m!1189107))

(declare-fun m!1189109 () Bool)

(assert (=> b!1297556 m!1189109))

(declare-fun m!1189111 () Bool)

(assert (=> mapNonEmpty!53585 m!1189111))

(declare-fun m!1189113 () Bool)

(assert (=> b!1297557 m!1189113))

(declare-fun m!1189115 () Bool)

(assert (=> b!1297555 m!1189115))

(declare-fun m!1189117 () Bool)

(assert (=> start!109554 m!1189117))

(declare-fun m!1189119 () Bool)

(assert (=> start!109554 m!1189119))

(declare-fun m!1189121 () Bool)

(assert (=> start!109554 m!1189121))

(check-sat tp_is_empty!34683 (not b_next!29043) (not b!1297555) (not mapNonEmpty!53585) (not b!1297557) (not start!109554) b_and!47133 (not b!1297556))
(check-sat b_and!47133 (not b_next!29043))
