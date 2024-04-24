; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109080 () Bool)

(assert start!109080)

(declare-fun b_free!28369 () Bool)

(declare-fun b_next!28369 () Bool)

(assert (=> start!109080 (= b_free!28369 (not b_next!28369))))

(declare-fun tp!100222 () Bool)

(declare-fun b_and!46437 () Bool)

(assert (=> start!109080 (= tp!100222 b_and!46437)))

(declare-fun b!1286864 () Bool)

(declare-fun res!854530 () Bool)

(declare-fun e!735177 () Bool)

(assert (=> b!1286864 (=> (not res!854530) (not e!735177))))

(declare-datatypes ((array!85103 0))(
  ( (array!85104 (arr!41049 (Array (_ BitVec 32) (_ BitVec 64))) (size!41600 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85103)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85103 (_ BitVec 32)) Bool)

(assert (=> b!1286864 (= res!854530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286865 () Bool)

(declare-fun e!735175 () Bool)

(declare-fun tp_is_empty!34009 () Bool)

(assert (=> b!1286865 (= e!735175 tp_is_empty!34009)))

(declare-fun b!1286866 () Bool)

(declare-fun res!854526 () Bool)

(assert (=> b!1286866 (=> (not res!854526) (not e!735177))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286866 (= res!854526 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741))))))

(declare-fun mapNonEmpty!52571 () Bool)

(declare-fun mapRes!52571 () Bool)

(declare-fun tp!100223 () Bool)

(assert (=> mapNonEmpty!52571 (= mapRes!52571 (and tp!100223 e!735175))))

(declare-datatypes ((V!50449 0))(
  ( (V!50450 (val!17079 Int)) )
))
(declare-datatypes ((ValueCell!16106 0))(
  ( (ValueCellFull!16106 (v!19676 V!50449)) (EmptyCell!16106) )
))
(declare-fun mapValue!52571 () ValueCell!16106)

(declare-fun mapKey!52571 () (_ BitVec 32))

(declare-fun mapRest!52571 () (Array (_ BitVec 32) ValueCell!16106))

(declare-datatypes ((array!85105 0))(
  ( (array!85106 (arr!41050 (Array (_ BitVec 32) ValueCell!16106)) (size!41601 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85105)

(assert (=> mapNonEmpty!52571 (= (arr!41050 _values!1445) (store mapRest!52571 mapKey!52571 mapValue!52571))))

(declare-fun b!1286867 () Bool)

(declare-fun res!854527 () Bool)

(assert (=> b!1286867 (=> (not res!854527) (not e!735177))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286867 (= res!854527 (and (= (size!41601 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41600 _keys!1741) (size!41601 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286868 () Bool)

(assert (=> b!1286868 (= e!735177 false)))

(declare-fun minValue!1387 () V!50449)

(declare-fun zeroValue!1387 () V!50449)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577415 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21914 0))(
  ( (tuple2!21915 (_1!10968 (_ BitVec 64)) (_2!10968 V!50449)) )
))
(declare-datatypes ((List!29114 0))(
  ( (Nil!29111) (Cons!29110 (h!30328 tuple2!21914) (t!42650 List!29114)) )
))
(declare-datatypes ((ListLongMap!19579 0))(
  ( (ListLongMap!19580 (toList!9805 List!29114)) )
))
(declare-fun contains!7936 (ListLongMap!19579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4869 (array!85103 array!85105 (_ BitVec 32) (_ BitVec 32) V!50449 V!50449 (_ BitVec 32) Int) ListLongMap!19579)

(assert (=> b!1286868 (= lt!577415 (contains!7936 (getCurrentListMap!4869 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286869 () Bool)

(declare-fun e!735176 () Bool)

(declare-fun e!735173 () Bool)

(assert (=> b!1286869 (= e!735176 (and e!735173 mapRes!52571))))

(declare-fun condMapEmpty!52571 () Bool)

(declare-fun mapDefault!52571 () ValueCell!16106)

(assert (=> b!1286869 (= condMapEmpty!52571 (= (arr!41050 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16106)) mapDefault!52571)))))

(declare-fun b!1286870 () Bool)

(assert (=> b!1286870 (= e!735173 tp_is_empty!34009)))

(declare-fun b!1286871 () Bool)

(declare-fun res!854528 () Bool)

(assert (=> b!1286871 (=> (not res!854528) (not e!735177))))

(declare-datatypes ((List!29115 0))(
  ( (Nil!29112) (Cons!29111 (h!30329 (_ BitVec 64)) (t!42651 List!29115)) )
))
(declare-fun arrayNoDuplicates!0 (array!85103 (_ BitVec 32) List!29115) Bool)

(assert (=> b!1286871 (= res!854528 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29112))))

(declare-fun res!854529 () Bool)

(assert (=> start!109080 (=> (not res!854529) (not e!735177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109080 (= res!854529 (validMask!0 mask!2175))))

(assert (=> start!109080 e!735177))

(assert (=> start!109080 tp_is_empty!34009))

(assert (=> start!109080 true))

(declare-fun array_inv!31343 (array!85105) Bool)

(assert (=> start!109080 (and (array_inv!31343 _values!1445) e!735176)))

(declare-fun array_inv!31344 (array!85103) Bool)

(assert (=> start!109080 (array_inv!31344 _keys!1741)))

(assert (=> start!109080 tp!100222))

(declare-fun mapIsEmpty!52571 () Bool)

(assert (=> mapIsEmpty!52571 mapRes!52571))

(assert (= (and start!109080 res!854529) b!1286867))

(assert (= (and b!1286867 res!854527) b!1286864))

(assert (= (and b!1286864 res!854530) b!1286871))

(assert (= (and b!1286871 res!854528) b!1286866))

(assert (= (and b!1286866 res!854526) b!1286868))

(assert (= (and b!1286869 condMapEmpty!52571) mapIsEmpty!52571))

(assert (= (and b!1286869 (not condMapEmpty!52571)) mapNonEmpty!52571))

(get-info :version)

(assert (= (and mapNonEmpty!52571 ((_ is ValueCellFull!16106) mapValue!52571)) b!1286865))

(assert (= (and b!1286869 ((_ is ValueCellFull!16106) mapDefault!52571)) b!1286870))

(assert (= start!109080 b!1286869))

(declare-fun m!1180489 () Bool)

(assert (=> b!1286868 m!1180489))

(assert (=> b!1286868 m!1180489))

(declare-fun m!1180491 () Bool)

(assert (=> b!1286868 m!1180491))

(declare-fun m!1180493 () Bool)

(assert (=> b!1286871 m!1180493))

(declare-fun m!1180495 () Bool)

(assert (=> mapNonEmpty!52571 m!1180495))

(declare-fun m!1180497 () Bool)

(assert (=> b!1286864 m!1180497))

(declare-fun m!1180499 () Bool)

(assert (=> start!109080 m!1180499))

(declare-fun m!1180501 () Bool)

(assert (=> start!109080 m!1180501))

(declare-fun m!1180503 () Bool)

(assert (=> start!109080 m!1180503))

(check-sat (not b!1286868) (not start!109080) (not b!1286871) (not mapNonEmpty!52571) (not b!1286864) tp_is_empty!34009 (not b_next!28369) b_and!46437)
(check-sat b_and!46437 (not b_next!28369))
