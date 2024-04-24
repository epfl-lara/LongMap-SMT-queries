; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109044 () Bool)

(assert start!109044)

(declare-fun b_free!28333 () Bool)

(declare-fun b_next!28333 () Bool)

(assert (=> start!109044 (= b_free!28333 (not b_next!28333))))

(declare-fun tp!100115 () Bool)

(declare-fun b_and!46401 () Bool)

(assert (=> start!109044 (= tp!100115 b_and!46401)))

(declare-fun b!1286432 () Bool)

(declare-fun e!734903 () Bool)

(declare-fun tp_is_empty!33973 () Bool)

(assert (=> b!1286432 (= e!734903 tp_is_empty!33973)))

(declare-fun b!1286433 () Bool)

(declare-fun res!854258 () Bool)

(declare-fun e!734907 () Bool)

(assert (=> b!1286433 (=> (not res!854258) (not e!734907))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50401 0))(
  ( (V!50402 (val!17061 Int)) )
))
(declare-datatypes ((ValueCell!16088 0))(
  ( (ValueCellFull!16088 (v!19658 V!50401)) (EmptyCell!16088) )
))
(declare-datatypes ((array!85033 0))(
  ( (array!85034 (arr!41014 (Array (_ BitVec 32) ValueCell!16088)) (size!41565 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85033)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85035 0))(
  ( (array!85036 (arr!41015 (Array (_ BitVec 32) (_ BitVec 64))) (size!41566 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85035)

(assert (=> b!1286433 (= res!854258 (and (= (size!41565 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41566 _keys!1741) (size!41565 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286434 () Bool)

(declare-fun res!854256 () Bool)

(assert (=> b!1286434 (=> (not res!854256) (not e!734907))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286434 (= res!854256 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41566 _keys!1741))))))

(declare-fun b!1286435 () Bool)

(declare-fun res!854257 () Bool)

(assert (=> b!1286435 (=> (not res!854257) (not e!734907))))

(declare-datatypes ((List!29089 0))(
  ( (Nil!29086) (Cons!29085 (h!30303 (_ BitVec 64)) (t!42625 List!29089)) )
))
(declare-fun arrayNoDuplicates!0 (array!85035 (_ BitVec 32) List!29089) Bool)

(assert (=> b!1286435 (= res!854257 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29086))))

(declare-fun b!1286436 () Bool)

(declare-fun e!734906 () Bool)

(declare-fun e!734905 () Bool)

(declare-fun mapRes!52517 () Bool)

(assert (=> b!1286436 (= e!734906 (and e!734905 mapRes!52517))))

(declare-fun condMapEmpty!52517 () Bool)

(declare-fun mapDefault!52517 () ValueCell!16088)

(assert (=> b!1286436 (= condMapEmpty!52517 (= (arr!41014 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16088)) mapDefault!52517)))))

(declare-fun b!1286437 () Bool)

(assert (=> b!1286437 (= e!734907 false)))

(declare-fun minValue!1387 () V!50401)

(declare-fun zeroValue!1387 () V!50401)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577361 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21888 0))(
  ( (tuple2!21889 (_1!10955 (_ BitVec 64)) (_2!10955 V!50401)) )
))
(declare-datatypes ((List!29090 0))(
  ( (Nil!29087) (Cons!29086 (h!30304 tuple2!21888) (t!42626 List!29090)) )
))
(declare-datatypes ((ListLongMap!19553 0))(
  ( (ListLongMap!19554 (toList!9792 List!29090)) )
))
(declare-fun contains!7923 (ListLongMap!19553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4856 (array!85035 array!85033 (_ BitVec 32) (_ BitVec 32) V!50401 V!50401 (_ BitVec 32) Int) ListLongMap!19553)

(assert (=> b!1286437 (= lt!577361 (contains!7923 (getCurrentListMap!4856 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52517 () Bool)

(declare-fun tp!100114 () Bool)

(assert (=> mapNonEmpty!52517 (= mapRes!52517 (and tp!100114 e!734903))))

(declare-fun mapRest!52517 () (Array (_ BitVec 32) ValueCell!16088))

(declare-fun mapValue!52517 () ValueCell!16088)

(declare-fun mapKey!52517 () (_ BitVec 32))

(assert (=> mapNonEmpty!52517 (= (arr!41014 _values!1445) (store mapRest!52517 mapKey!52517 mapValue!52517))))

(declare-fun mapIsEmpty!52517 () Bool)

(assert (=> mapIsEmpty!52517 mapRes!52517))

(declare-fun res!854260 () Bool)

(assert (=> start!109044 (=> (not res!854260) (not e!734907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109044 (= res!854260 (validMask!0 mask!2175))))

(assert (=> start!109044 e!734907))

(assert (=> start!109044 tp_is_empty!33973))

(assert (=> start!109044 true))

(declare-fun array_inv!31323 (array!85033) Bool)

(assert (=> start!109044 (and (array_inv!31323 _values!1445) e!734906)))

(declare-fun array_inv!31324 (array!85035) Bool)

(assert (=> start!109044 (array_inv!31324 _keys!1741)))

(assert (=> start!109044 tp!100115))

(declare-fun b!1286438 () Bool)

(assert (=> b!1286438 (= e!734905 tp_is_empty!33973)))

(declare-fun b!1286439 () Bool)

(declare-fun res!854259 () Bool)

(assert (=> b!1286439 (=> (not res!854259) (not e!734907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85035 (_ BitVec 32)) Bool)

(assert (=> b!1286439 (= res!854259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109044 res!854260) b!1286433))

(assert (= (and b!1286433 res!854258) b!1286439))

(assert (= (and b!1286439 res!854259) b!1286435))

(assert (= (and b!1286435 res!854257) b!1286434))

(assert (= (and b!1286434 res!854256) b!1286437))

(assert (= (and b!1286436 condMapEmpty!52517) mapIsEmpty!52517))

(assert (= (and b!1286436 (not condMapEmpty!52517)) mapNonEmpty!52517))

(get-info :version)

(assert (= (and mapNonEmpty!52517 ((_ is ValueCellFull!16088) mapValue!52517)) b!1286432))

(assert (= (and b!1286436 ((_ is ValueCellFull!16088) mapDefault!52517)) b!1286438))

(assert (= start!109044 b!1286436))

(declare-fun m!1180201 () Bool)

(assert (=> start!109044 m!1180201))

(declare-fun m!1180203 () Bool)

(assert (=> start!109044 m!1180203))

(declare-fun m!1180205 () Bool)

(assert (=> start!109044 m!1180205))

(declare-fun m!1180207 () Bool)

(assert (=> b!1286439 m!1180207))

(declare-fun m!1180209 () Bool)

(assert (=> b!1286437 m!1180209))

(assert (=> b!1286437 m!1180209))

(declare-fun m!1180211 () Bool)

(assert (=> b!1286437 m!1180211))

(declare-fun m!1180213 () Bool)

(assert (=> b!1286435 m!1180213))

(declare-fun m!1180215 () Bool)

(assert (=> mapNonEmpty!52517 m!1180215))

(check-sat (not start!109044) (not b!1286437) tp_is_empty!33973 (not mapNonEmpty!52517) (not b!1286439) b_and!46401 (not b!1286435) (not b_next!28333))
(check-sat b_and!46401 (not b_next!28333))
