; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109060 () Bool)

(assert start!109060)

(declare-fun b_free!28549 () Bool)

(declare-fun b_next!28549 () Bool)

(assert (=> start!109060 (= b_free!28549 (not b_next!28549))))

(declare-fun tp!100766 () Bool)

(declare-fun b_and!46621 () Bool)

(assert (=> start!109060 (= tp!100766 b_and!46621)))

(declare-fun b!1289101 () Bool)

(declare-fun res!856286 () Bool)

(declare-fun e!736051 () Bool)

(assert (=> b!1289101 (=> (not res!856286) (not e!736051))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85309 0))(
  ( (array!85310 (arr!41156 (Array (_ BitVec 32) (_ BitVec 64))) (size!41708 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85309)

(assert (=> b!1289101 (= res!856286 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41708 _keys!1741))))))

(declare-fun b!1289102 () Bool)

(declare-fun res!856292 () Bool)

(assert (=> b!1289102 (=> (not res!856292) (not e!736051))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85309 (_ BitVec 32)) Bool)

(assert (=> b!1289102 (= res!856292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52844 () Bool)

(declare-fun mapRes!52844 () Bool)

(declare-fun tp!100767 () Bool)

(declare-fun e!736048 () Bool)

(assert (=> mapNonEmpty!52844 (= mapRes!52844 (and tp!100767 e!736048))))

(declare-fun mapKey!52844 () (_ BitVec 32))

(declare-datatypes ((V!50689 0))(
  ( (V!50690 (val!17169 Int)) )
))
(declare-datatypes ((ValueCell!16196 0))(
  ( (ValueCellFull!16196 (v!19771 V!50689)) (EmptyCell!16196) )
))
(declare-fun mapValue!52844 () ValueCell!16196)

(declare-datatypes ((array!85311 0))(
  ( (array!85312 (arr!41157 (Array (_ BitVec 32) ValueCell!16196)) (size!41709 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85311)

(declare-fun mapRest!52844 () (Array (_ BitVec 32) ValueCell!16196))

(assert (=> mapNonEmpty!52844 (= (arr!41157 _values!1445) (store mapRest!52844 mapKey!52844 mapValue!52844))))

(declare-fun b!1289103 () Bool)

(declare-fun e!736050 () Bool)

(declare-fun e!736053 () Bool)

(assert (=> b!1289103 (= e!736050 (and e!736053 mapRes!52844))))

(declare-fun condMapEmpty!52844 () Bool)

(declare-fun mapDefault!52844 () ValueCell!16196)

(assert (=> b!1289103 (= condMapEmpty!52844 (= (arr!41157 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16196)) mapDefault!52844)))))

(declare-fun b!1289104 () Bool)

(declare-fun res!856293 () Bool)

(assert (=> b!1289104 (=> (not res!856293) (not e!736051))))

(declare-fun minValue!1387 () V!50689)

(declare-fun zeroValue!1387 () V!50689)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22100 0))(
  ( (tuple2!22101 (_1!11061 (_ BitVec 64)) (_2!11061 V!50689)) )
))
(declare-datatypes ((List!29263 0))(
  ( (Nil!29260) (Cons!29259 (h!30468 tuple2!22100) (t!42819 List!29263)) )
))
(declare-datatypes ((ListLongMap!19757 0))(
  ( (ListLongMap!19758 (toList!9894 List!29263)) )
))
(declare-fun contains!7942 (ListLongMap!19757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4846 (array!85309 array!85311 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19757)

(assert (=> b!1289104 (= res!856293 (contains!7942 (getCurrentListMap!4846 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289105 () Bool)

(declare-fun res!856290 () Bool)

(assert (=> b!1289105 (=> (not res!856290) (not e!736051))))

(assert (=> b!1289105 (= res!856290 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41708 _keys!1741))))))

(declare-fun mapIsEmpty!52844 () Bool)

(assert (=> mapIsEmpty!52844 mapRes!52844))

(declare-fun b!1289107 () Bool)

(declare-fun res!856285 () Bool)

(assert (=> b!1289107 (=> (not res!856285) (not e!736051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289107 (= res!856285 (not (validKeyInArray!0 (select (arr!41156 _keys!1741) from!2144))))))

(declare-fun b!1289108 () Bool)

(declare-fun tp_is_empty!34189 () Bool)

(assert (=> b!1289108 (= e!736053 tp_is_empty!34189)))

(declare-fun b!1289109 () Bool)

(declare-fun e!736052 () Bool)

(assert (=> b!1289109 (= e!736052 (bvsle from!2144 (size!41708 _keys!1741)))))

(declare-fun lt!577994 () ListLongMap!19757)

(declare-fun +!4382 (ListLongMap!19757 tuple2!22100) ListLongMap!19757)

(assert (=> b!1289109 (not (contains!7942 (+!4382 lt!577994 (tuple2!22101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42492 0))(
  ( (Unit!42493) )
))
(declare-fun lt!577996 () Unit!42492)

(declare-fun addStillNotContains!359 (ListLongMap!19757 (_ BitVec 64) V!50689 (_ BitVec 64)) Unit!42492)

(assert (=> b!1289109 (= lt!577996 (addStillNotContains!359 lt!577994 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6013 (array!85309 array!85311 (_ BitVec 32) (_ BitVec 32) V!50689 V!50689 (_ BitVec 32) Int) ListLongMap!19757)

(assert (=> b!1289109 (= lt!577994 (getCurrentListMapNoExtraKeys!6013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289110 () Bool)

(assert (=> b!1289110 (= e!736051 (not e!736052))))

(declare-fun res!856291 () Bool)

(assert (=> b!1289110 (=> res!856291 e!736052)))

(assert (=> b!1289110 (= res!856291 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289110 (not (contains!7942 (ListLongMap!19758 Nil!29260) k0!1205))))

(declare-fun lt!577995 () Unit!42492)

(declare-fun emptyContainsNothing!47 ((_ BitVec 64)) Unit!42492)

(assert (=> b!1289110 (= lt!577995 (emptyContainsNothing!47 k0!1205))))

(declare-fun b!1289111 () Bool)

(declare-fun res!856289 () Bool)

(assert (=> b!1289111 (=> (not res!856289) (not e!736051))))

(assert (=> b!1289111 (= res!856289 (and (= (size!41709 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41708 _keys!1741) (size!41709 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289112 () Bool)

(declare-fun res!856288 () Bool)

(assert (=> b!1289112 (=> (not res!856288) (not e!736051))))

(declare-datatypes ((List!29264 0))(
  ( (Nil!29261) (Cons!29260 (h!30469 (_ BitVec 64)) (t!42820 List!29264)) )
))
(declare-fun arrayNoDuplicates!0 (array!85309 (_ BitVec 32) List!29264) Bool)

(assert (=> b!1289112 (= res!856288 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29261))))

(declare-fun b!1289106 () Bool)

(assert (=> b!1289106 (= e!736048 tp_is_empty!34189)))

(declare-fun res!856287 () Bool)

(assert (=> start!109060 (=> (not res!856287) (not e!736051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109060 (= res!856287 (validMask!0 mask!2175))))

(assert (=> start!109060 e!736051))

(assert (=> start!109060 tp_is_empty!34189))

(assert (=> start!109060 true))

(declare-fun array_inv!31361 (array!85311) Bool)

(assert (=> start!109060 (and (array_inv!31361 _values!1445) e!736050)))

(declare-fun array_inv!31362 (array!85309) Bool)

(assert (=> start!109060 (array_inv!31362 _keys!1741)))

(assert (=> start!109060 tp!100766))

(assert (= (and start!109060 res!856287) b!1289111))

(assert (= (and b!1289111 res!856289) b!1289102))

(assert (= (and b!1289102 res!856292) b!1289112))

(assert (= (and b!1289112 res!856288) b!1289105))

(assert (= (and b!1289105 res!856290) b!1289104))

(assert (= (and b!1289104 res!856293) b!1289101))

(assert (= (and b!1289101 res!856286) b!1289107))

(assert (= (and b!1289107 res!856285) b!1289110))

(assert (= (and b!1289110 (not res!856291)) b!1289109))

(assert (= (and b!1289103 condMapEmpty!52844) mapIsEmpty!52844))

(assert (= (and b!1289103 (not condMapEmpty!52844)) mapNonEmpty!52844))

(get-info :version)

(assert (= (and mapNonEmpty!52844 ((_ is ValueCellFull!16196) mapValue!52844)) b!1289106))

(assert (= (and b!1289103 ((_ is ValueCellFull!16196) mapDefault!52844)) b!1289108))

(assert (= start!109060 b!1289103))

(declare-fun m!1181199 () Bool)

(assert (=> start!109060 m!1181199))

(declare-fun m!1181201 () Bool)

(assert (=> start!109060 m!1181201))

(declare-fun m!1181203 () Bool)

(assert (=> start!109060 m!1181203))

(declare-fun m!1181205 () Bool)

(assert (=> b!1289104 m!1181205))

(assert (=> b!1289104 m!1181205))

(declare-fun m!1181207 () Bool)

(assert (=> b!1289104 m!1181207))

(declare-fun m!1181209 () Bool)

(assert (=> b!1289112 m!1181209))

(declare-fun m!1181211 () Bool)

(assert (=> b!1289102 m!1181211))

(declare-fun m!1181213 () Bool)

(assert (=> b!1289110 m!1181213))

(declare-fun m!1181215 () Bool)

(assert (=> b!1289110 m!1181215))

(declare-fun m!1181217 () Bool)

(assert (=> b!1289107 m!1181217))

(assert (=> b!1289107 m!1181217))

(declare-fun m!1181219 () Bool)

(assert (=> b!1289107 m!1181219))

(declare-fun m!1181221 () Bool)

(assert (=> b!1289109 m!1181221))

(assert (=> b!1289109 m!1181221))

(declare-fun m!1181223 () Bool)

(assert (=> b!1289109 m!1181223))

(declare-fun m!1181225 () Bool)

(assert (=> b!1289109 m!1181225))

(declare-fun m!1181227 () Bool)

(assert (=> b!1289109 m!1181227))

(declare-fun m!1181229 () Bool)

(assert (=> mapNonEmpty!52844 m!1181229))

(check-sat (not b!1289112) (not b!1289107) (not start!109060) tp_is_empty!34189 (not b!1289110) (not b_next!28549) b_and!46621 (not b!1289104) (not b!1289109) (not mapNonEmpty!52844) (not b!1289102))
(check-sat b_and!46621 (not b_next!28549))
