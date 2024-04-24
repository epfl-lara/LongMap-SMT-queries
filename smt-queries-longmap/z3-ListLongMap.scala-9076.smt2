; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109464 () Bool)

(assert start!109464)

(declare-fun b_free!28729 () Bool)

(declare-fun b_next!28729 () Bool)

(assert (=> start!109464 (= b_free!28729 (not b_next!28729))))

(declare-fun tp!101306 () Bool)

(declare-fun b_and!46821 () Bool)

(assert (=> start!109464 (= tp!101306 b_and!46821)))

(declare-fun mapNonEmpty!53114 () Bool)

(declare-fun mapRes!53114 () Bool)

(declare-fun tp!101305 () Bool)

(declare-fun e!738490 () Bool)

(assert (=> mapNonEmpty!53114 (= mapRes!53114 (and tp!101305 e!738490))))

(declare-datatypes ((V!50929 0))(
  ( (V!50930 (val!17259 Int)) )
))
(declare-datatypes ((ValueCell!16286 0))(
  ( (ValueCellFull!16286 (v!19857 V!50929)) (EmptyCell!16286) )
))
(declare-datatypes ((array!85803 0))(
  ( (array!85804 (arr!41398 (Array (_ BitVec 32) ValueCell!16286)) (size!41949 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85803)

(declare-fun mapValue!53114 () ValueCell!16286)

(declare-fun mapKey!53114 () (_ BitVec 32))

(declare-fun mapRest!53114 () (Array (_ BitVec 32) ValueCell!16286))

(assert (=> mapNonEmpty!53114 (= (arr!41398 _values!1445) (store mapRest!53114 mapKey!53114 mapValue!53114))))

(declare-fun b!1293654 () Bool)

(declare-fun e!738491 () Bool)

(declare-fun e!738492 () Bool)

(assert (=> b!1293654 (= e!738491 (and e!738492 mapRes!53114))))

(declare-fun condMapEmpty!53114 () Bool)

(declare-fun mapDefault!53114 () ValueCell!16286)

(assert (=> b!1293654 (= condMapEmpty!53114 (= (arr!41398 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16286)) mapDefault!53114)))))

(declare-fun b!1293655 () Bool)

(declare-fun tp_is_empty!34369 () Bool)

(assert (=> b!1293655 (= e!738492 tp_is_empty!34369)))

(declare-fun b!1293656 () Bool)

(declare-fun res!859208 () Bool)

(declare-fun e!738489 () Bool)

(assert (=> b!1293656 (=> (not res!859208) (not e!738489))))

(declare-datatypes ((array!85805 0))(
  ( (array!85806 (arr!41399 (Array (_ BitVec 32) (_ BitVec 64))) (size!41950 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85805)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85805 (_ BitVec 32)) Bool)

(assert (=> b!1293656 (= res!859208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293657 () Bool)

(assert (=> b!1293657 (= e!738489 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22218 0))(
  ( (tuple2!22219 (_1!11120 (_ BitVec 64)) (_2!11120 V!50929)) )
))
(declare-datatypes ((List!29386 0))(
  ( (Nil!29383) (Cons!29382 (h!30600 tuple2!22218) (t!42942 List!29386)) )
))
(declare-datatypes ((ListLongMap!19883 0))(
  ( (ListLongMap!19884 (toList!9957 List!29386)) )
))
(declare-fun contains!8088 (ListLongMap!19883 (_ BitVec 64)) Bool)

(assert (=> b!1293657 (not (contains!8088 (ListLongMap!19884 Nil!29383) k0!1205))))

(declare-datatypes ((Unit!42753 0))(
  ( (Unit!42754) )
))
(declare-fun lt!579813 () Unit!42753)

(declare-fun emptyContainsNothing!122 ((_ BitVec 64)) Unit!42753)

(assert (=> b!1293657 (= lt!579813 (emptyContainsNothing!122 k0!1205))))

(declare-fun b!1293658 () Bool)

(assert (=> b!1293658 (= e!738490 tp_is_empty!34369)))

(declare-fun b!1293659 () Bool)

(declare-fun res!859210 () Bool)

(assert (=> b!1293659 (=> (not res!859210) (not e!738489))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1293659 (= res!859210 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41950 _keys!1741))))))

(declare-fun b!1293660 () Bool)

(declare-fun res!859206 () Bool)

(assert (=> b!1293660 (=> (not res!859206) (not e!738489))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293660 (= res!859206 (and (= (size!41949 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41950 _keys!1741) (size!41949 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!859212 () Bool)

(assert (=> start!109464 (=> (not res!859212) (not e!738489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109464 (= res!859212 (validMask!0 mask!2175))))

(assert (=> start!109464 e!738489))

(assert (=> start!109464 tp_is_empty!34369))

(assert (=> start!109464 true))

(declare-fun array_inv!31595 (array!85803) Bool)

(assert (=> start!109464 (and (array_inv!31595 _values!1445) e!738491)))

(declare-fun array_inv!31596 (array!85805) Bool)

(assert (=> start!109464 (array_inv!31596 _keys!1741)))

(assert (=> start!109464 tp!101306))

(declare-fun b!1293661 () Bool)

(declare-fun res!859209 () Bool)

(assert (=> b!1293661 (=> (not res!859209) (not e!738489))))

(assert (=> b!1293661 (= res!859209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41950 _keys!1741))))))

(declare-fun b!1293662 () Bool)

(declare-fun res!859213 () Bool)

(assert (=> b!1293662 (=> (not res!859213) (not e!738489))))

(declare-fun minValue!1387 () V!50929)

(declare-fun zeroValue!1387 () V!50929)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4989 (array!85805 array!85803 (_ BitVec 32) (_ BitVec 32) V!50929 V!50929 (_ BitVec 32) Int) ListLongMap!19883)

(assert (=> b!1293662 (= res!859213 (contains!8088 (getCurrentListMap!4989 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293663 () Bool)

(declare-fun res!859207 () Bool)

(assert (=> b!1293663 (=> (not res!859207) (not e!738489))))

(declare-datatypes ((List!29387 0))(
  ( (Nil!29384) (Cons!29383 (h!30601 (_ BitVec 64)) (t!42943 List!29387)) )
))
(declare-fun arrayNoDuplicates!0 (array!85805 (_ BitVec 32) List!29387) Bool)

(assert (=> b!1293663 (= res!859207 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29384))))

(declare-fun b!1293664 () Bool)

(declare-fun res!859211 () Bool)

(assert (=> b!1293664 (=> (not res!859211) (not e!738489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293664 (= res!859211 (not (validKeyInArray!0 (select (arr!41399 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53114 () Bool)

(assert (=> mapIsEmpty!53114 mapRes!53114))

(assert (= (and start!109464 res!859212) b!1293660))

(assert (= (and b!1293660 res!859206) b!1293656))

(assert (= (and b!1293656 res!859208) b!1293663))

(assert (= (and b!1293663 res!859207) b!1293661))

(assert (= (and b!1293661 res!859209) b!1293662))

(assert (= (and b!1293662 res!859213) b!1293659))

(assert (= (and b!1293659 res!859210) b!1293664))

(assert (= (and b!1293664 res!859211) b!1293657))

(assert (= (and b!1293654 condMapEmpty!53114) mapIsEmpty!53114))

(assert (= (and b!1293654 (not condMapEmpty!53114)) mapNonEmpty!53114))

(get-info :version)

(assert (= (and mapNonEmpty!53114 ((_ is ValueCellFull!16286) mapValue!53114)) b!1293658))

(assert (= (and b!1293654 ((_ is ValueCellFull!16286) mapDefault!53114)) b!1293655))

(assert (= start!109464 b!1293654))

(declare-fun m!1186545 () Bool)

(assert (=> start!109464 m!1186545))

(declare-fun m!1186547 () Bool)

(assert (=> start!109464 m!1186547))

(declare-fun m!1186549 () Bool)

(assert (=> start!109464 m!1186549))

(declare-fun m!1186551 () Bool)

(assert (=> mapNonEmpty!53114 m!1186551))

(declare-fun m!1186553 () Bool)

(assert (=> b!1293662 m!1186553))

(assert (=> b!1293662 m!1186553))

(declare-fun m!1186555 () Bool)

(assert (=> b!1293662 m!1186555))

(declare-fun m!1186557 () Bool)

(assert (=> b!1293664 m!1186557))

(assert (=> b!1293664 m!1186557))

(declare-fun m!1186559 () Bool)

(assert (=> b!1293664 m!1186559))

(declare-fun m!1186561 () Bool)

(assert (=> b!1293657 m!1186561))

(declare-fun m!1186563 () Bool)

(assert (=> b!1293657 m!1186563))

(declare-fun m!1186565 () Bool)

(assert (=> b!1293663 m!1186565))

(declare-fun m!1186567 () Bool)

(assert (=> b!1293656 m!1186567))

(check-sat (not mapNonEmpty!53114) tp_is_empty!34369 (not start!109464) b_and!46821 (not b_next!28729) (not b!1293664) (not b!1293656) (not b!1293657) (not b!1293663) (not b!1293662))
(check-sat b_and!46821 (not b_next!28729))
