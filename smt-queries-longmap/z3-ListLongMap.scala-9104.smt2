; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109408 () Bool)

(assert start!109408)

(declare-fun b_free!28897 () Bool)

(declare-fun b_next!28897 () Bool)

(assert (=> start!109408 (= b_free!28897 (not b_next!28897))))

(declare-fun tp!101811 () Bool)

(declare-fun b_and!46969 () Bool)

(assert (=> start!109408 (= tp!101811 b_and!46969)))

(declare-fun b!1295203 () Bool)

(declare-fun e!739021 () Bool)

(assert (=> b!1295203 (= e!739021 true)))

(declare-datatypes ((V!51153 0))(
  ( (V!51154 (val!17343 Int)) )
))
(declare-datatypes ((tuple2!22382 0))(
  ( (tuple2!22383 (_1!11202 (_ BitVec 64)) (_2!11202 V!51153)) )
))
(declare-datatypes ((List!29516 0))(
  ( (Nil!29513) (Cons!29512 (h!30721 tuple2!22382) (t!43072 List!29516)) )
))
(declare-datatypes ((ListLongMap!20039 0))(
  ( (ListLongMap!20040 (toList!10035 List!29516)) )
))
(declare-fun lt!579679 () ListLongMap!20039)

(declare-fun minValue!1387 () V!51153)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8083 (ListLongMap!20039 (_ BitVec 64)) Bool)

(declare-fun +!4451 (ListLongMap!20039 tuple2!22382) ListLongMap!20039)

(assert (=> b!1295203 (not (contains!8083 (+!4451 lt!579679 (tuple2!22383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42740 0))(
  ( (Unit!42741) )
))
(declare-fun lt!579677 () Unit!42740)

(declare-fun addStillNotContains!428 (ListLongMap!20039 (_ BitVec 64) V!51153 (_ BitVec 64)) Unit!42740)

(assert (=> b!1295203 (= lt!579677 (addStillNotContains!428 lt!579679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51153)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16370 0))(
  ( (ValueCellFull!16370 (v!19945 V!51153)) (EmptyCell!16370) )
))
(declare-datatypes ((array!85987 0))(
  ( (array!85988 (arr!41495 (Array (_ BitVec 32) ValueCell!16370)) (size!42047 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85987)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85989 0))(
  ( (array!85990 (arr!41496 (Array (_ BitVec 32) (_ BitVec 64))) (size!42048 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85989)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6085 (array!85989 array!85987 (_ BitVec 32) (_ BitVec 32) V!51153 V!51153 (_ BitVec 32) Int) ListLongMap!20039)

(assert (=> b!1295203 (= lt!579679 (getCurrentListMapNoExtraKeys!6085 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295204 () Bool)

(declare-fun res!860824 () Bool)

(declare-fun e!739018 () Bool)

(assert (=> b!1295204 (=> (not res!860824) (not e!739018))))

(assert (=> b!1295204 (= res!860824 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42048 _keys!1741))))))

(declare-fun b!1295205 () Bool)

(declare-fun e!739023 () Bool)

(declare-fun tp_is_empty!34537 () Bool)

(assert (=> b!1295205 (= e!739023 tp_is_empty!34537)))

(declare-fun mapNonEmpty!53366 () Bool)

(declare-fun mapRes!53366 () Bool)

(declare-fun tp!101810 () Bool)

(assert (=> mapNonEmpty!53366 (= mapRes!53366 (and tp!101810 e!739023))))

(declare-fun mapRest!53366 () (Array (_ BitVec 32) ValueCell!16370))

(declare-fun mapValue!53366 () ValueCell!16370)

(declare-fun mapKey!53366 () (_ BitVec 32))

(assert (=> mapNonEmpty!53366 (= (arr!41495 _values!1445) (store mapRest!53366 mapKey!53366 mapValue!53366))))

(declare-fun b!1295207 () Bool)

(declare-fun e!739020 () Bool)

(assert (=> b!1295207 (= e!739020 tp_is_empty!34537)))

(declare-fun b!1295208 () Bool)

(assert (=> b!1295208 (= e!739018 (not e!739021))))

(declare-fun res!860822 () Bool)

(assert (=> b!1295208 (=> res!860822 e!739021)))

(assert (=> b!1295208 (= res!860822 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295208 (not (contains!8083 (ListLongMap!20040 Nil!29513) k0!1205))))

(declare-fun lt!579678 () Unit!42740)

(declare-fun emptyContainsNothing!163 ((_ BitVec 64)) Unit!42740)

(assert (=> b!1295208 (= lt!579678 (emptyContainsNothing!163 k0!1205))))

(declare-fun b!1295209 () Bool)

(declare-fun e!739019 () Bool)

(assert (=> b!1295209 (= e!739019 (and e!739020 mapRes!53366))))

(declare-fun condMapEmpty!53366 () Bool)

(declare-fun mapDefault!53366 () ValueCell!16370)

(assert (=> b!1295209 (= condMapEmpty!53366 (= (arr!41495 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16370)) mapDefault!53366)))))

(declare-fun b!1295210 () Bool)

(declare-fun res!860825 () Bool)

(assert (=> b!1295210 (=> (not res!860825) (not e!739018))))

(declare-fun getCurrentListMap!4961 (array!85989 array!85987 (_ BitVec 32) (_ BitVec 32) V!51153 V!51153 (_ BitVec 32) Int) ListLongMap!20039)

(assert (=> b!1295210 (= res!860825 (contains!8083 (getCurrentListMap!4961 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295211 () Bool)

(declare-fun res!860823 () Bool)

(assert (=> b!1295211 (=> (not res!860823) (not e!739018))))

(assert (=> b!1295211 (= res!860823 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42048 _keys!1741))))))

(declare-fun b!1295212 () Bool)

(declare-fun res!860826 () Bool)

(assert (=> b!1295212 (=> (not res!860826) (not e!739018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85989 (_ BitVec 32)) Bool)

(assert (=> b!1295212 (= res!860826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295213 () Bool)

(declare-fun res!860821 () Bool)

(assert (=> b!1295213 (=> (not res!860821) (not e!739018))))

(assert (=> b!1295213 (= res!860821 (and (= (size!42047 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42048 _keys!1741) (size!42047 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53366 () Bool)

(assert (=> mapIsEmpty!53366 mapRes!53366))

(declare-fun b!1295214 () Bool)

(declare-fun res!860829 () Bool)

(assert (=> b!1295214 (=> (not res!860829) (not e!739018))))

(declare-datatypes ((List!29517 0))(
  ( (Nil!29514) (Cons!29513 (h!30722 (_ BitVec 64)) (t!43073 List!29517)) )
))
(declare-fun arrayNoDuplicates!0 (array!85989 (_ BitVec 32) List!29517) Bool)

(assert (=> b!1295214 (= res!860829 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29514))))

(declare-fun b!1295206 () Bool)

(declare-fun res!860828 () Bool)

(assert (=> b!1295206 (=> (not res!860828) (not e!739018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295206 (= res!860828 (not (validKeyInArray!0 (select (arr!41496 _keys!1741) from!2144))))))

(declare-fun res!860827 () Bool)

(assert (=> start!109408 (=> (not res!860827) (not e!739018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109408 (= res!860827 (validMask!0 mask!2175))))

(assert (=> start!109408 e!739018))

(assert (=> start!109408 tp_is_empty!34537))

(assert (=> start!109408 true))

(declare-fun array_inv!31583 (array!85987) Bool)

(assert (=> start!109408 (and (array_inv!31583 _values!1445) e!739019)))

(declare-fun array_inv!31584 (array!85989) Bool)

(assert (=> start!109408 (array_inv!31584 _keys!1741)))

(assert (=> start!109408 tp!101811))

(assert (= (and start!109408 res!860827) b!1295213))

(assert (= (and b!1295213 res!860821) b!1295212))

(assert (= (and b!1295212 res!860826) b!1295214))

(assert (= (and b!1295214 res!860829) b!1295204))

(assert (= (and b!1295204 res!860824) b!1295210))

(assert (= (and b!1295210 res!860825) b!1295211))

(assert (= (and b!1295211 res!860823) b!1295206))

(assert (= (and b!1295206 res!860828) b!1295208))

(assert (= (and b!1295208 (not res!860822)) b!1295203))

(assert (= (and b!1295209 condMapEmpty!53366) mapIsEmpty!53366))

(assert (= (and b!1295209 (not condMapEmpty!53366)) mapNonEmpty!53366))

(get-info :version)

(assert (= (and mapNonEmpty!53366 ((_ is ValueCellFull!16370) mapValue!53366)) b!1295205))

(assert (= (and b!1295209 ((_ is ValueCellFull!16370) mapDefault!53366)) b!1295207))

(assert (= start!109408 b!1295209))

(declare-fun m!1186803 () Bool)

(assert (=> b!1295206 m!1186803))

(assert (=> b!1295206 m!1186803))

(declare-fun m!1186805 () Bool)

(assert (=> b!1295206 m!1186805))

(declare-fun m!1186807 () Bool)

(assert (=> b!1295210 m!1186807))

(assert (=> b!1295210 m!1186807))

(declare-fun m!1186809 () Bool)

(assert (=> b!1295210 m!1186809))

(declare-fun m!1186811 () Bool)

(assert (=> mapNonEmpty!53366 m!1186811))

(declare-fun m!1186813 () Bool)

(assert (=> b!1295208 m!1186813))

(declare-fun m!1186815 () Bool)

(assert (=> b!1295208 m!1186815))

(declare-fun m!1186817 () Bool)

(assert (=> b!1295212 m!1186817))

(declare-fun m!1186819 () Bool)

(assert (=> b!1295214 m!1186819))

(declare-fun m!1186821 () Bool)

(assert (=> start!109408 m!1186821))

(declare-fun m!1186823 () Bool)

(assert (=> start!109408 m!1186823))

(declare-fun m!1186825 () Bool)

(assert (=> start!109408 m!1186825))

(declare-fun m!1186827 () Bool)

(assert (=> b!1295203 m!1186827))

(assert (=> b!1295203 m!1186827))

(declare-fun m!1186829 () Bool)

(assert (=> b!1295203 m!1186829))

(declare-fun m!1186831 () Bool)

(assert (=> b!1295203 m!1186831))

(declare-fun m!1186833 () Bool)

(assert (=> b!1295203 m!1186833))

(check-sat (not start!109408) (not b!1295212) (not b!1295203) (not mapNonEmpty!53366) (not b!1295214) (not b!1295208) b_and!46969 tp_is_empty!34537 (not b!1295206) (not b_next!28897) (not b!1295210))
(check-sat b_and!46969 (not b_next!28897))
