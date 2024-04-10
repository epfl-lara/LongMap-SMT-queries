; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108996 () Bool)

(assert start!108996)

(declare-fun b_free!28485 () Bool)

(declare-fun b_next!28485 () Bool)

(assert (=> start!108996 (= b_free!28485 (not b_next!28485))))

(declare-fun tp!100574 () Bool)

(declare-fun b_and!46575 () Bool)

(assert (=> start!108996 (= tp!100574 b_and!46575)))

(declare-fun b!1288026 () Bool)

(declare-fun res!855465 () Bool)

(declare-fun e!735518 () Bool)

(assert (=> b!1288026 (=> (not res!855465) (not e!735518))))

(declare-datatypes ((V!50603 0))(
  ( (V!50604 (val!17137 Int)) )
))
(declare-fun minValue!1387 () V!50603)

(declare-fun zeroValue!1387 () V!50603)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16164 0))(
  ( (ValueCellFull!16164 (v!19740 V!50603)) (EmptyCell!16164) )
))
(declare-datatypes ((array!85298 0))(
  ( (array!85299 (arr!41150 (Array (_ BitVec 32) ValueCell!16164)) (size!41700 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85298)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85300 0))(
  ( (array!85301 (arr!41151 (Array (_ BitVec 32) (_ BitVec 64))) (size!41701 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85300)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21996 0))(
  ( (tuple2!21997 (_1!11009 (_ BitVec 64)) (_2!11009 V!50603)) )
))
(declare-datatypes ((List!29171 0))(
  ( (Nil!29168) (Cons!29167 (h!30376 tuple2!21996) (t!42735 List!29171)) )
))
(declare-datatypes ((ListLongMap!19653 0))(
  ( (ListLongMap!19654 (toList!9842 List!29171)) )
))
(declare-fun contains!7960 (ListLongMap!19653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4910 (array!85300 array!85298 (_ BitVec 32) (_ BitVec 32) V!50603 V!50603 (_ BitVec 32) Int) ListLongMap!19653)

(assert (=> b!1288026 (= res!855465 (contains!7960 (getCurrentListMap!4910 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!855462 () Bool)

(assert (=> start!108996 (=> (not res!855462) (not e!735518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108996 (= res!855462 (validMask!0 mask!2175))))

(assert (=> start!108996 e!735518))

(declare-fun tp_is_empty!34125 () Bool)

(assert (=> start!108996 tp_is_empty!34125))

(assert (=> start!108996 true))

(declare-fun e!735515 () Bool)

(declare-fun array_inv!31207 (array!85298) Bool)

(assert (=> start!108996 (and (array_inv!31207 _values!1445) e!735515)))

(declare-fun array_inv!31208 (array!85300) Bool)

(assert (=> start!108996 (array_inv!31208 _keys!1741)))

(assert (=> start!108996 tp!100574))

(declare-fun mapNonEmpty!52748 () Bool)

(declare-fun mapRes!52748 () Bool)

(declare-fun tp!100573 () Bool)

(declare-fun e!735516 () Bool)

(assert (=> mapNonEmpty!52748 (= mapRes!52748 (and tp!100573 e!735516))))

(declare-fun mapKey!52748 () (_ BitVec 32))

(declare-fun mapRest!52748 () (Array (_ BitVec 32) ValueCell!16164))

(declare-fun mapValue!52748 () ValueCell!16164)

(assert (=> mapNonEmpty!52748 (= (arr!41150 _values!1445) (store mapRest!52748 mapKey!52748 mapValue!52748))))

(declare-fun b!1288027 () Bool)

(declare-fun res!855468 () Bool)

(assert (=> b!1288027 (=> (not res!855468) (not e!735518))))

(declare-datatypes ((List!29172 0))(
  ( (Nil!29169) (Cons!29168 (h!30377 (_ BitVec 64)) (t!42736 List!29172)) )
))
(declare-fun arrayNoDuplicates!0 (array!85300 (_ BitVec 32) List!29172) Bool)

(assert (=> b!1288027 (= res!855468 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29169))))

(declare-fun b!1288028 () Bool)

(declare-fun res!855466 () Bool)

(assert (=> b!1288028 (=> (not res!855466) (not e!735518))))

(assert (=> b!1288028 (= res!855466 (and (= (size!41700 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41701 _keys!1741) (size!41700 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288029 () Bool)

(declare-fun res!855464 () Bool)

(assert (=> b!1288029 (=> (not res!855464) (not e!735518))))

(assert (=> b!1288029 (= res!855464 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41701 _keys!1741))))))

(declare-fun b!1288030 () Bool)

(assert (=> b!1288030 (= e!735518 (not true))))

(assert (=> b!1288030 (not (contains!7960 (ListLongMap!19654 Nil!29168) k0!1205))))

(declare-datatypes ((Unit!42604 0))(
  ( (Unit!42605) )
))
(declare-fun lt!577919 () Unit!42604)

(declare-fun emptyContainsNothing!31 ((_ BitVec 64)) Unit!42604)

(assert (=> b!1288030 (= lt!577919 (emptyContainsNothing!31 k0!1205))))

(declare-fun b!1288031 () Bool)

(declare-fun res!855463 () Bool)

(assert (=> b!1288031 (=> (not res!855463) (not e!735518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288031 (= res!855463 (not (validKeyInArray!0 (select (arr!41151 _keys!1741) from!2144))))))

(declare-fun b!1288032 () Bool)

(assert (=> b!1288032 (= e!735516 tp_is_empty!34125)))

(declare-fun b!1288033 () Bool)

(declare-fun e!735517 () Bool)

(assert (=> b!1288033 (= e!735515 (and e!735517 mapRes!52748))))

(declare-fun condMapEmpty!52748 () Bool)

(declare-fun mapDefault!52748 () ValueCell!16164)

(assert (=> b!1288033 (= condMapEmpty!52748 (= (arr!41150 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16164)) mapDefault!52748)))))

(declare-fun b!1288034 () Bool)

(assert (=> b!1288034 (= e!735517 tp_is_empty!34125)))

(declare-fun mapIsEmpty!52748 () Bool)

(assert (=> mapIsEmpty!52748 mapRes!52748))

(declare-fun b!1288035 () Bool)

(declare-fun res!855467 () Bool)

(assert (=> b!1288035 (=> (not res!855467) (not e!735518))))

(assert (=> b!1288035 (= res!855467 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41701 _keys!1741))))))

(declare-fun b!1288036 () Bool)

(declare-fun res!855461 () Bool)

(assert (=> b!1288036 (=> (not res!855461) (not e!735518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85300 (_ BitVec 32)) Bool)

(assert (=> b!1288036 (= res!855461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108996 res!855462) b!1288028))

(assert (= (and b!1288028 res!855466) b!1288036))

(assert (= (and b!1288036 res!855461) b!1288027))

(assert (= (and b!1288027 res!855468) b!1288035))

(assert (= (and b!1288035 res!855467) b!1288026))

(assert (= (and b!1288026 res!855465) b!1288029))

(assert (= (and b!1288029 res!855464) b!1288031))

(assert (= (and b!1288031 res!855463) b!1288030))

(assert (= (and b!1288033 condMapEmpty!52748) mapIsEmpty!52748))

(assert (= (and b!1288033 (not condMapEmpty!52748)) mapNonEmpty!52748))

(get-info :version)

(assert (= (and mapNonEmpty!52748 ((_ is ValueCellFull!16164) mapValue!52748)) b!1288032))

(assert (= (and b!1288033 ((_ is ValueCellFull!16164) mapDefault!52748)) b!1288034))

(assert (= start!108996 b!1288033))

(declare-fun m!1180727 () Bool)

(assert (=> b!1288031 m!1180727))

(assert (=> b!1288031 m!1180727))

(declare-fun m!1180729 () Bool)

(assert (=> b!1288031 m!1180729))

(declare-fun m!1180731 () Bool)

(assert (=> mapNonEmpty!52748 m!1180731))

(declare-fun m!1180733 () Bool)

(assert (=> b!1288026 m!1180733))

(assert (=> b!1288026 m!1180733))

(declare-fun m!1180735 () Bool)

(assert (=> b!1288026 m!1180735))

(declare-fun m!1180737 () Bool)

(assert (=> start!108996 m!1180737))

(declare-fun m!1180739 () Bool)

(assert (=> start!108996 m!1180739))

(declare-fun m!1180741 () Bool)

(assert (=> start!108996 m!1180741))

(declare-fun m!1180743 () Bool)

(assert (=> b!1288027 m!1180743))

(declare-fun m!1180745 () Bool)

(assert (=> b!1288030 m!1180745))

(declare-fun m!1180747 () Bool)

(assert (=> b!1288030 m!1180747))

(declare-fun m!1180749 () Bool)

(assert (=> b!1288036 m!1180749))

(check-sat (not b!1288026) (not b!1288027) (not mapNonEmpty!52748) (not b!1288031) (not b!1288036) (not b_next!28485) (not start!108996) tp_is_empty!34125 (not b!1288030) b_and!46575)
(check-sat b_and!46575 (not b_next!28485))
