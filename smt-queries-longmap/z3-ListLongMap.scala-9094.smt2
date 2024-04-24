; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109572 () Bool)

(assert start!109572)

(declare-fun b_free!28837 () Bool)

(declare-fun b_next!28837 () Bool)

(assert (=> start!109572 (= b_free!28837 (not b_next!28837))))

(declare-fun tp!101629 () Bool)

(declare-fun b_and!46929 () Bool)

(assert (=> start!109572 (= tp!101629 b_and!46929)))

(declare-fun b!1295544 () Bool)

(declare-fun e!739406 () Bool)

(declare-fun e!739407 () Bool)

(declare-fun mapRes!53276 () Bool)

(assert (=> b!1295544 (= e!739406 (and e!739407 mapRes!53276))))

(declare-fun condMapEmpty!53276 () Bool)

(declare-datatypes ((V!51073 0))(
  ( (V!51074 (val!17313 Int)) )
))
(declare-datatypes ((ValueCell!16340 0))(
  ( (ValueCellFull!16340 (v!19911 V!51073)) (EmptyCell!16340) )
))
(declare-datatypes ((array!86009 0))(
  ( (array!86010 (arr!41501 (Array (_ BitVec 32) ValueCell!16340)) (size!42052 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86009)

(declare-fun mapDefault!53276 () ValueCell!16340)

(assert (=> b!1295544 (= condMapEmpty!53276 (= (arr!41501 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16340)) mapDefault!53276)))))

(declare-fun b!1295545 () Bool)

(declare-fun res!860612 () Bool)

(declare-fun e!739409 () Bool)

(assert (=> b!1295545 (=> (not res!860612) (not e!739409))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86011 0))(
  ( (array!86012 (arr!41502 (Array (_ BitVec 32) (_ BitVec 64))) (size!42053 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86011)

(assert (=> b!1295545 (= res!860612 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42053 _keys!1741))))))

(declare-fun b!1295546 () Bool)

(declare-fun res!860611 () Bool)

(assert (=> b!1295546 (=> (not res!860611) (not e!739409))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86011 (_ BitVec 32)) Bool)

(assert (=> b!1295546 (= res!860611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53276 () Bool)

(assert (=> mapIsEmpty!53276 mapRes!53276))

(declare-fun b!1295547 () Bool)

(declare-fun res!860616 () Bool)

(assert (=> b!1295547 (=> (not res!860616) (not e!739409))))

(declare-datatypes ((List!29461 0))(
  ( (Nil!29458) (Cons!29457 (h!30675 (_ BitVec 64)) (t!43017 List!29461)) )
))
(declare-fun arrayNoDuplicates!0 (array!86011 (_ BitVec 32) List!29461) Bool)

(assert (=> b!1295547 (= res!860616 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29458))))

(declare-fun b!1295549 () Bool)

(declare-fun res!860615 () Bool)

(assert (=> b!1295549 (=> (not res!860615) (not e!739409))))

(assert (=> b!1295549 (= res!860615 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42053 _keys!1741))))))

(declare-fun b!1295550 () Bool)

(declare-fun res!860610 () Bool)

(assert (=> b!1295550 (=> (not res!860610) (not e!739409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295550 (= res!860610 (not (validKeyInArray!0 (select (arr!41502 _keys!1741) from!2144))))))

(declare-fun b!1295551 () Bool)

(declare-fun res!860617 () Bool)

(assert (=> b!1295551 (=> (not res!860617) (not e!739409))))

(declare-fun minValue!1387 () V!51073)

(declare-fun zeroValue!1387 () V!51073)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22294 0))(
  ( (tuple2!22295 (_1!11158 (_ BitVec 64)) (_2!11158 V!51073)) )
))
(declare-datatypes ((List!29462 0))(
  ( (Nil!29459) (Cons!29458 (h!30676 tuple2!22294) (t!43018 List!29462)) )
))
(declare-datatypes ((ListLongMap!19959 0))(
  ( (ListLongMap!19960 (toList!9995 List!29462)) )
))
(declare-fun contains!8126 (ListLongMap!19959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5022 (array!86011 array!86009 (_ BitVec 32) (_ BitVec 32) V!51073 V!51073 (_ BitVec 32) Int) ListLongMap!19959)

(assert (=> b!1295551 (= res!860617 (contains!8126 (getCurrentListMap!5022 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53276 () Bool)

(declare-fun tp!101630 () Bool)

(declare-fun e!739408 () Bool)

(assert (=> mapNonEmpty!53276 (= mapRes!53276 (and tp!101630 e!739408))))

(declare-fun mapKey!53276 () (_ BitVec 32))

(declare-fun mapRest!53276 () (Array (_ BitVec 32) ValueCell!16340))

(declare-fun mapValue!53276 () ValueCell!16340)

(assert (=> mapNonEmpty!53276 (= (arr!41501 _values!1445) (store mapRest!53276 mapKey!53276 mapValue!53276))))

(declare-fun b!1295552 () Bool)

(declare-fun tp_is_empty!34477 () Bool)

(assert (=> b!1295552 (= e!739407 tp_is_empty!34477)))

(declare-fun res!860614 () Bool)

(assert (=> start!109572 (=> (not res!860614) (not e!739409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109572 (= res!860614 (validMask!0 mask!2175))))

(assert (=> start!109572 e!739409))

(assert (=> start!109572 tp_is_empty!34477))

(assert (=> start!109572 true))

(declare-fun array_inv!31665 (array!86009) Bool)

(assert (=> start!109572 (and (array_inv!31665 _values!1445) e!739406)))

(declare-fun array_inv!31666 (array!86011) Bool)

(assert (=> start!109572 (array_inv!31666 _keys!1741)))

(assert (=> start!109572 tp!101629))

(declare-fun b!1295548 () Bool)

(assert (=> b!1295548 (= e!739408 tp_is_empty!34477)))

(declare-fun b!1295553 () Bool)

(declare-fun res!860613 () Bool)

(assert (=> b!1295553 (=> (not res!860613) (not e!739409))))

(assert (=> b!1295553 (= res!860613 (and (= (size!42052 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42053 _keys!1741) (size!42052 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295554 () Bool)

(assert (=> b!1295554 (= e!739409 (not true))))

(assert (=> b!1295554 (not (contains!8126 (ListLongMap!19960 Nil!29459) k0!1205))))

(declare-datatypes ((Unit!42823 0))(
  ( (Unit!42824) )
))
(declare-fun lt!580182 () Unit!42823)

(declare-fun emptyContainsNothing!154 ((_ BitVec 64)) Unit!42823)

(assert (=> b!1295554 (= lt!580182 (emptyContainsNothing!154 k0!1205))))

(assert (= (and start!109572 res!860614) b!1295553))

(assert (= (and b!1295553 res!860613) b!1295546))

(assert (= (and b!1295546 res!860611) b!1295547))

(assert (= (and b!1295547 res!860616) b!1295549))

(assert (= (and b!1295549 res!860615) b!1295551))

(assert (= (and b!1295551 res!860617) b!1295545))

(assert (= (and b!1295545 res!860612) b!1295550))

(assert (= (and b!1295550 res!860610) b!1295554))

(assert (= (and b!1295544 condMapEmpty!53276) mapIsEmpty!53276))

(assert (= (and b!1295544 (not condMapEmpty!53276)) mapNonEmpty!53276))

(get-info :version)

(assert (= (and mapNonEmpty!53276 ((_ is ValueCellFull!16340) mapValue!53276)) b!1295548))

(assert (= (and b!1295544 ((_ is ValueCellFull!16340) mapDefault!53276)) b!1295552))

(assert (= start!109572 b!1295544))

(declare-fun m!1188117 () Bool)

(assert (=> mapNonEmpty!53276 m!1188117))

(declare-fun m!1188119 () Bool)

(assert (=> b!1295550 m!1188119))

(assert (=> b!1295550 m!1188119))

(declare-fun m!1188121 () Bool)

(assert (=> b!1295550 m!1188121))

(declare-fun m!1188123 () Bool)

(assert (=> start!109572 m!1188123))

(declare-fun m!1188125 () Bool)

(assert (=> start!109572 m!1188125))

(declare-fun m!1188127 () Bool)

(assert (=> start!109572 m!1188127))

(declare-fun m!1188129 () Bool)

(assert (=> b!1295547 m!1188129))

(declare-fun m!1188131 () Bool)

(assert (=> b!1295546 m!1188131))

(declare-fun m!1188133 () Bool)

(assert (=> b!1295551 m!1188133))

(assert (=> b!1295551 m!1188133))

(declare-fun m!1188135 () Bool)

(assert (=> b!1295551 m!1188135))

(declare-fun m!1188137 () Bool)

(assert (=> b!1295554 m!1188137))

(declare-fun m!1188139 () Bool)

(assert (=> b!1295554 m!1188139))

(check-sat (not b!1295550) tp_is_empty!34477 (not b_next!28837) (not b!1295547) (not b!1295554) (not b!1295546) (not start!109572) b_and!46929 (not mapNonEmpty!53276) (not b!1295551))
(check-sat b_and!46929 (not b_next!28837))
