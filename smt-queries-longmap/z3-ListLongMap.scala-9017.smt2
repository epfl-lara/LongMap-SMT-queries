; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109086 () Bool)

(assert start!109086)

(declare-fun b_free!28375 () Bool)

(declare-fun b_next!28375 () Bool)

(assert (=> start!109086 (= b_free!28375 (not b_next!28375))))

(declare-fun tp!100241 () Bool)

(declare-fun b_and!46443 () Bool)

(assert (=> start!109086 (= tp!100241 b_and!46443)))

(declare-fun b!1286936 () Bool)

(declare-fun e!735220 () Bool)

(assert (=> b!1286936 (= e!735220 false)))

(declare-datatypes ((V!50457 0))(
  ( (V!50458 (val!17082 Int)) )
))
(declare-fun minValue!1387 () V!50457)

(declare-fun zeroValue!1387 () V!50457)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16109 0))(
  ( (ValueCellFull!16109 (v!19679 V!50457)) (EmptyCell!16109) )
))
(declare-datatypes ((array!85115 0))(
  ( (array!85116 (arr!41055 (Array (_ BitVec 32) ValueCell!16109)) (size!41606 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85115)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577424 () Bool)

(declare-datatypes ((array!85117 0))(
  ( (array!85118 (arr!41056 (Array (_ BitVec 32) (_ BitVec 64))) (size!41607 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85117)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21918 0))(
  ( (tuple2!21919 (_1!10970 (_ BitVec 64)) (_2!10970 V!50457)) )
))
(declare-datatypes ((List!29117 0))(
  ( (Nil!29114) (Cons!29113 (h!30331 tuple2!21918) (t!42653 List!29117)) )
))
(declare-datatypes ((ListLongMap!19583 0))(
  ( (ListLongMap!19584 (toList!9807 List!29117)) )
))
(declare-fun contains!7938 (ListLongMap!19583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4871 (array!85117 array!85115 (_ BitVec 32) (_ BitVec 32) V!50457 V!50457 (_ BitVec 32) Int) ListLongMap!19583)

(assert (=> b!1286936 (= lt!577424 (contains!7938 (getCurrentListMap!4871 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854575 () Bool)

(assert (=> start!109086 (=> (not res!854575) (not e!735220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109086 (= res!854575 (validMask!0 mask!2175))))

(assert (=> start!109086 e!735220))

(declare-fun tp_is_empty!34015 () Bool)

(assert (=> start!109086 tp_is_empty!34015))

(assert (=> start!109086 true))

(declare-fun e!735219 () Bool)

(declare-fun array_inv!31347 (array!85115) Bool)

(assert (=> start!109086 (and (array_inv!31347 _values!1445) e!735219)))

(declare-fun array_inv!31348 (array!85117) Bool)

(assert (=> start!109086 (array_inv!31348 _keys!1741)))

(assert (=> start!109086 tp!100241))

(declare-fun mapIsEmpty!52580 () Bool)

(declare-fun mapRes!52580 () Bool)

(assert (=> mapIsEmpty!52580 mapRes!52580))

(declare-fun b!1286937 () Bool)

(declare-fun res!854573 () Bool)

(assert (=> b!1286937 (=> (not res!854573) (not e!735220))))

(declare-datatypes ((List!29118 0))(
  ( (Nil!29115) (Cons!29114 (h!30332 (_ BitVec 64)) (t!42654 List!29118)) )
))
(declare-fun arrayNoDuplicates!0 (array!85117 (_ BitVec 32) List!29118) Bool)

(assert (=> b!1286937 (= res!854573 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29115))))

(declare-fun b!1286938 () Bool)

(declare-fun e!735222 () Bool)

(assert (=> b!1286938 (= e!735222 tp_is_empty!34015)))

(declare-fun b!1286939 () Bool)

(declare-fun res!854572 () Bool)

(assert (=> b!1286939 (=> (not res!854572) (not e!735220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85117 (_ BitVec 32)) Bool)

(assert (=> b!1286939 (= res!854572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286940 () Bool)

(declare-fun e!735218 () Bool)

(assert (=> b!1286940 (= e!735219 (and e!735218 mapRes!52580))))

(declare-fun condMapEmpty!52580 () Bool)

(declare-fun mapDefault!52580 () ValueCell!16109)

(assert (=> b!1286940 (= condMapEmpty!52580 (= (arr!41055 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16109)) mapDefault!52580)))))

(declare-fun b!1286941 () Bool)

(assert (=> b!1286941 (= e!735218 tp_is_empty!34015)))

(declare-fun b!1286942 () Bool)

(declare-fun res!854571 () Bool)

(assert (=> b!1286942 (=> (not res!854571) (not e!735220))))

(assert (=> b!1286942 (= res!854571 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41607 _keys!1741))))))

(declare-fun mapNonEmpty!52580 () Bool)

(declare-fun tp!100240 () Bool)

(assert (=> mapNonEmpty!52580 (= mapRes!52580 (and tp!100240 e!735222))))

(declare-fun mapValue!52580 () ValueCell!16109)

(declare-fun mapKey!52580 () (_ BitVec 32))

(declare-fun mapRest!52580 () (Array (_ BitVec 32) ValueCell!16109))

(assert (=> mapNonEmpty!52580 (= (arr!41055 _values!1445) (store mapRest!52580 mapKey!52580 mapValue!52580))))

(declare-fun b!1286943 () Bool)

(declare-fun res!854574 () Bool)

(assert (=> b!1286943 (=> (not res!854574) (not e!735220))))

(assert (=> b!1286943 (= res!854574 (and (= (size!41606 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41607 _keys!1741) (size!41606 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109086 res!854575) b!1286943))

(assert (= (and b!1286943 res!854574) b!1286939))

(assert (= (and b!1286939 res!854572) b!1286937))

(assert (= (and b!1286937 res!854573) b!1286942))

(assert (= (and b!1286942 res!854571) b!1286936))

(assert (= (and b!1286940 condMapEmpty!52580) mapIsEmpty!52580))

(assert (= (and b!1286940 (not condMapEmpty!52580)) mapNonEmpty!52580))

(get-info :version)

(assert (= (and mapNonEmpty!52580 ((_ is ValueCellFull!16109) mapValue!52580)) b!1286938))

(assert (= (and b!1286940 ((_ is ValueCellFull!16109) mapDefault!52580)) b!1286941))

(assert (= start!109086 b!1286940))

(declare-fun m!1180537 () Bool)

(assert (=> start!109086 m!1180537))

(declare-fun m!1180539 () Bool)

(assert (=> start!109086 m!1180539))

(declare-fun m!1180541 () Bool)

(assert (=> start!109086 m!1180541))

(declare-fun m!1180543 () Bool)

(assert (=> b!1286939 m!1180543))

(declare-fun m!1180545 () Bool)

(assert (=> b!1286937 m!1180545))

(declare-fun m!1180547 () Bool)

(assert (=> mapNonEmpty!52580 m!1180547))

(declare-fun m!1180549 () Bool)

(assert (=> b!1286936 m!1180549))

(assert (=> b!1286936 m!1180549))

(declare-fun m!1180551 () Bool)

(assert (=> b!1286936 m!1180551))

(check-sat (not b!1286939) (not b_next!28375) tp_is_empty!34015 (not b!1286937) (not b!1286936) b_and!46443 (not start!109086) (not mapNonEmpty!52580))
(check-sat b_and!46443 (not b_next!28375))
