; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109248 () Bool)

(assert start!109248)

(declare-fun b_free!28513 () Bool)

(declare-fun b_next!28513 () Bool)

(assert (=> start!109248 (= b_free!28513 (not b_next!28513))))

(declare-fun tp!100657 () Bool)

(declare-fun b_and!46605 () Bool)

(assert (=> start!109248 (= tp!100657 b_and!46605)))

(declare-fun b!1289822 () Bool)

(declare-fun res!856351 () Bool)

(declare-fun e!736604 () Bool)

(assert (=> b!1289822 (=> (not res!856351) (not e!736604))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50641 0))(
  ( (V!50642 (val!17151 Int)) )
))
(declare-datatypes ((ValueCell!16178 0))(
  ( (ValueCellFull!16178 (v!19749 V!50641)) (EmptyCell!16178) )
))
(declare-datatypes ((array!85387 0))(
  ( (array!85388 (arr!41190 (Array (_ BitVec 32) ValueCell!16178)) (size!41741 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85387)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85389 0))(
  ( (array!85390 (arr!41191 (Array (_ BitVec 32) (_ BitVec 64))) (size!41742 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85389)

(assert (=> b!1289822 (= res!856351 (and (= (size!41741 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41742 _keys!1741) (size!41741 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289823 () Bool)

(declare-fun res!856354 () Bool)

(assert (=> b!1289823 (=> (not res!856354) (not e!736604))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1289823 (= res!856354 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41742 _keys!1741))))))

(declare-fun b!1289824 () Bool)

(declare-fun res!856353 () Bool)

(assert (=> b!1289824 (=> (not res!856353) (not e!736604))))

(assert (=> b!1289824 (= res!856353 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41742 _keys!1741))))))

(declare-fun mapIsEmpty!52790 () Bool)

(declare-fun mapRes!52790 () Bool)

(assert (=> mapIsEmpty!52790 mapRes!52790))

(declare-fun b!1289825 () Bool)

(declare-fun res!856349 () Bool)

(assert (=> b!1289825 (=> (not res!856349) (not e!736604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289825 (= res!856349 (not (validKeyInArray!0 (select (arr!41191 _keys!1741) from!2144))))))

(declare-fun b!1289826 () Bool)

(declare-fun e!736601 () Bool)

(assert (=> b!1289826 (= e!736604 (not e!736601))))

(declare-fun res!856346 () Bool)

(assert (=> b!1289826 (=> res!856346 e!736601)))

(assert (=> b!1289826 (= res!856346 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22034 0))(
  ( (tuple2!22035 (_1!11028 (_ BitVec 64)) (_2!11028 V!50641)) )
))
(declare-datatypes ((List!29219 0))(
  ( (Nil!29216) (Cons!29215 (h!30433 tuple2!22034) (t!42775 List!29219)) )
))
(declare-datatypes ((ListLongMap!19699 0))(
  ( (ListLongMap!19700 (toList!9865 List!29219)) )
))
(declare-fun contains!7996 (ListLongMap!19699 (_ BitVec 64)) Bool)

(assert (=> b!1289826 (not (contains!7996 (ListLongMap!19700 Nil!29216) k0!1205))))

(declare-datatypes ((Unit!42579 0))(
  ( (Unit!42580) )
))
(declare-fun lt!578496 () Unit!42579)

(declare-fun emptyContainsNothing!43 ((_ BitVec 64)) Unit!42579)

(assert (=> b!1289826 (= lt!578496 (emptyContainsNothing!43 k0!1205))))

(declare-fun mapNonEmpty!52790 () Bool)

(declare-fun tp!100658 () Bool)

(declare-fun e!736602 () Bool)

(assert (=> mapNonEmpty!52790 (= mapRes!52790 (and tp!100658 e!736602))))

(declare-fun mapKey!52790 () (_ BitVec 32))

(declare-fun mapRest!52790 () (Array (_ BitVec 32) ValueCell!16178))

(declare-fun mapValue!52790 () ValueCell!16178)

(assert (=> mapNonEmpty!52790 (= (arr!41190 _values!1445) (store mapRest!52790 mapKey!52790 mapValue!52790))))

(declare-fun b!1289828 () Bool)

(assert (=> b!1289828 (= e!736601 true)))

(declare-fun lt!578494 () ListLongMap!19699)

(declare-fun zeroValue!1387 () V!50641)

(declare-fun +!4372 (ListLongMap!19699 tuple2!22034) ListLongMap!19699)

(assert (=> b!1289828 (not (contains!7996 (+!4372 lt!578494 (tuple2!22035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578495 () Unit!42579)

(declare-fun addStillNotContains!348 (ListLongMap!19699 (_ BitVec 64) V!50641 (_ BitVec 64)) Unit!42579)

(assert (=> b!1289828 (= lt!578495 (addStillNotContains!348 lt!578494 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50641)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6010 (array!85389 array!85387 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19699)

(assert (=> b!1289828 (= lt!578494 (getCurrentListMapNoExtraKeys!6010 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289829 () Bool)

(declare-fun res!856347 () Bool)

(assert (=> b!1289829 (=> (not res!856347) (not e!736604))))

(declare-datatypes ((List!29220 0))(
  ( (Nil!29217) (Cons!29216 (h!30434 (_ BitVec 64)) (t!42776 List!29220)) )
))
(declare-fun arrayNoDuplicates!0 (array!85389 (_ BitVec 32) List!29220) Bool)

(assert (=> b!1289829 (= res!856347 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29217))))

(declare-fun b!1289830 () Bool)

(declare-fun e!736605 () Bool)

(declare-fun e!736603 () Bool)

(assert (=> b!1289830 (= e!736605 (and e!736603 mapRes!52790))))

(declare-fun condMapEmpty!52790 () Bool)

(declare-fun mapDefault!52790 () ValueCell!16178)

(assert (=> b!1289830 (= condMapEmpty!52790 (= (arr!41190 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16178)) mapDefault!52790)))))

(declare-fun b!1289831 () Bool)

(declare-fun res!856348 () Bool)

(assert (=> b!1289831 (=> (not res!856348) (not e!736604))))

(declare-fun getCurrentListMap!4914 (array!85389 array!85387 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19699)

(assert (=> b!1289831 (= res!856348 (contains!7996 (getCurrentListMap!4914 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289827 () Bool)

(declare-fun tp_is_empty!34153 () Bool)

(assert (=> b!1289827 (= e!736603 tp_is_empty!34153)))

(declare-fun res!856350 () Bool)

(assert (=> start!109248 (=> (not res!856350) (not e!736604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109248 (= res!856350 (validMask!0 mask!2175))))

(assert (=> start!109248 e!736604))

(assert (=> start!109248 tp_is_empty!34153))

(assert (=> start!109248 true))

(declare-fun array_inv!31439 (array!85387) Bool)

(assert (=> start!109248 (and (array_inv!31439 _values!1445) e!736605)))

(declare-fun array_inv!31440 (array!85389) Bool)

(assert (=> start!109248 (array_inv!31440 _keys!1741)))

(assert (=> start!109248 tp!100657))

(declare-fun b!1289832 () Bool)

(assert (=> b!1289832 (= e!736602 tp_is_empty!34153)))

(declare-fun b!1289833 () Bool)

(declare-fun res!856352 () Bool)

(assert (=> b!1289833 (=> (not res!856352) (not e!736604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85389 (_ BitVec 32)) Bool)

(assert (=> b!1289833 (= res!856352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109248 res!856350) b!1289822))

(assert (= (and b!1289822 res!856351) b!1289833))

(assert (= (and b!1289833 res!856352) b!1289829))

(assert (= (and b!1289829 res!856347) b!1289824))

(assert (= (and b!1289824 res!856353) b!1289831))

(assert (= (and b!1289831 res!856348) b!1289823))

(assert (= (and b!1289823 res!856354) b!1289825))

(assert (= (and b!1289825 res!856349) b!1289826))

(assert (= (and b!1289826 (not res!856346)) b!1289828))

(assert (= (and b!1289830 condMapEmpty!52790) mapIsEmpty!52790))

(assert (= (and b!1289830 (not condMapEmpty!52790)) mapNonEmpty!52790))

(get-info :version)

(assert (= (and mapNonEmpty!52790 ((_ is ValueCellFull!16178) mapValue!52790)) b!1289832))

(assert (= (and b!1289830 ((_ is ValueCellFull!16178) mapDefault!52790)) b!1289827))

(assert (= start!109248 b!1289830))

(declare-fun m!1182741 () Bool)

(assert (=> b!1289826 m!1182741))

(declare-fun m!1182743 () Bool)

(assert (=> b!1289826 m!1182743))

(declare-fun m!1182745 () Bool)

(assert (=> b!1289831 m!1182745))

(assert (=> b!1289831 m!1182745))

(declare-fun m!1182747 () Bool)

(assert (=> b!1289831 m!1182747))

(declare-fun m!1182749 () Bool)

(assert (=> b!1289825 m!1182749))

(assert (=> b!1289825 m!1182749))

(declare-fun m!1182751 () Bool)

(assert (=> b!1289825 m!1182751))

(declare-fun m!1182753 () Bool)

(assert (=> b!1289833 m!1182753))

(declare-fun m!1182755 () Bool)

(assert (=> b!1289829 m!1182755))

(declare-fun m!1182757 () Bool)

(assert (=> mapNonEmpty!52790 m!1182757))

(declare-fun m!1182759 () Bool)

(assert (=> start!109248 m!1182759))

(declare-fun m!1182761 () Bool)

(assert (=> start!109248 m!1182761))

(declare-fun m!1182763 () Bool)

(assert (=> start!109248 m!1182763))

(declare-fun m!1182765 () Bool)

(assert (=> b!1289828 m!1182765))

(assert (=> b!1289828 m!1182765))

(declare-fun m!1182767 () Bool)

(assert (=> b!1289828 m!1182767))

(declare-fun m!1182769 () Bool)

(assert (=> b!1289828 m!1182769))

(declare-fun m!1182771 () Bool)

(assert (=> b!1289828 m!1182771))

(check-sat (not b!1289831) (not b!1289826) (not b!1289828) (not b!1289833) b_and!46605 (not start!109248) (not b!1289825) (not b!1289829) (not mapNonEmpty!52790) tp_is_empty!34153 (not b_next!28513))
(check-sat b_and!46605 (not b_next!28513))
