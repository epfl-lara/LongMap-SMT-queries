; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108888 () Bool)

(assert start!108888)

(declare-fun b_free!28401 () Bool)

(declare-fun b_next!28401 () Bool)

(assert (=> start!108888 (= b_free!28401 (not b_next!28401))))

(declare-fun tp!100319 () Bool)

(declare-fun b_and!46467 () Bool)

(assert (=> start!108888 (= tp!100319 b_and!46467)))

(declare-datatypes ((V!50491 0))(
  ( (V!50492 (val!17095 Int)) )
))
(declare-fun zeroValue!1387 () V!50491)

(declare-datatypes ((tuple2!21918 0))(
  ( (tuple2!21919 (_1!10970 (_ BitVec 64)) (_2!10970 V!50491)) )
))
(declare-datatypes ((List!29105 0))(
  ( (Nil!29102) (Cons!29101 (h!30310 tuple2!21918) (t!42649 List!29105)) )
))
(declare-datatypes ((ListLongMap!19575 0))(
  ( (ListLongMap!19576 (toList!9803 List!29105)) )
))
(declare-fun lt!577028 () ListLongMap!19575)

(declare-datatypes ((Unit!42512 0))(
  ( (Unit!42513) )
))
(declare-fun call!62812 () Unit!42512)

(declare-fun minValue!1387 () V!50491)

(declare-fun lt!577026 () ListLongMap!19575)

(declare-fun c!124119 () Bool)

(declare-fun bm!62805 () Bool)

(declare-fun c!124118 () Bool)

(declare-fun lt!577020 () ListLongMap!19575)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!26 ((_ BitVec 64) (_ BitVec 64) V!50491 ListLongMap!19575) Unit!42512)

(assert (=> bm!62805 (= call!62812 (lemmaInListMapAfterAddingDiffThenInBefore!26 k0!1205 (ite (or c!124118 c!124119) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124118 c!124119) zeroValue!1387 minValue!1387) (ite c!124118 lt!577028 (ite c!124119 lt!577020 lt!577026))))))

(declare-fun b!1286087 () Bool)

(declare-fun e!734586 () Unit!42512)

(declare-fun Unit!42514 () Unit!42512)

(assert (=> b!1286087 (= e!734586 Unit!42514)))

(declare-fun b!1286088 () Bool)

(declare-fun res!854363 () Bool)

(declare-fun e!734584 () Bool)

(assert (=> b!1286088 (=> (not res!854363) (not e!734584))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16122 0))(
  ( (ValueCellFull!16122 (v!19697 V!50491)) (EmptyCell!16122) )
))
(declare-datatypes ((array!85134 0))(
  ( (array!85135 (arr!41069 (Array (_ BitVec 32) ValueCell!16122)) (size!41619 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85134)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85136 0))(
  ( (array!85137 (arr!41070 (Array (_ BitVec 32) (_ BitVec 64))) (size!41620 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85136)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun contains!7920 (ListLongMap!19575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4881 (array!85136 array!85134 (_ BitVec 32) (_ BitVec 32) V!50491 V!50491 (_ BitVec 32) Int) ListLongMap!19575)

(assert (=> b!1286088 (= res!854363 (contains!7920 (getCurrentListMap!4881 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!62806 () Bool)

(declare-fun call!62813 () ListLongMap!19575)

(declare-fun call!62808 () ListLongMap!19575)

(assert (=> bm!62806 (= call!62813 call!62808)))

(declare-fun res!854367 () Bool)

(assert (=> start!108888 (=> (not res!854367) (not e!734584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108888 (= res!854367 (validMask!0 mask!2175))))

(assert (=> start!108888 e!734584))

(declare-fun tp_is_empty!34041 () Bool)

(assert (=> start!108888 tp_is_empty!34041))

(assert (=> start!108888 true))

(declare-fun e!734588 () Bool)

(declare-fun array_inv!31143 (array!85134) Bool)

(assert (=> start!108888 (and (array_inv!31143 _values!1445) e!734588)))

(declare-fun array_inv!31144 (array!85136) Bool)

(assert (=> start!108888 (array_inv!31144 _keys!1741)))

(assert (=> start!108888 tp!100319))

(declare-fun b!1286089 () Bool)

(declare-fun lt!577025 () Unit!42512)

(assert (=> b!1286089 (= e!734586 lt!577025)))

(assert (=> b!1286089 (= lt!577026 call!62813)))

(declare-fun call!62811 () Unit!42512)

(assert (=> b!1286089 (= lt!577025 call!62811)))

(declare-fun call!62810 () Bool)

(assert (=> b!1286089 call!62810))

(declare-fun b!1286090 () Bool)

(declare-fun e!734581 () Bool)

(assert (=> b!1286090 (= e!734581 tp_is_empty!34041)))

(declare-fun bm!62807 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5941 (array!85136 array!85134 (_ BitVec 32) (_ BitVec 32) V!50491 V!50491 (_ BitVec 32) Int) ListLongMap!19575)

(assert (=> bm!62807 (= call!62808 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286091 () Bool)

(declare-fun res!854361 () Bool)

(assert (=> b!1286091 (=> (not res!854361) (not e!734584))))

(declare-datatypes ((List!29106 0))(
  ( (Nil!29103) (Cons!29102 (h!30311 (_ BitVec 64)) (t!42650 List!29106)) )
))
(declare-fun arrayNoDuplicates!0 (array!85136 (_ BitVec 32) List!29106) Bool)

(assert (=> b!1286091 (= res!854361 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29103))))

(declare-fun mapIsEmpty!52619 () Bool)

(declare-fun mapRes!52619 () Bool)

(assert (=> mapIsEmpty!52619 mapRes!52619))

(declare-fun b!1286092 () Bool)

(declare-fun res!854366 () Bool)

(assert (=> b!1286092 (=> (not res!854366) (not e!734584))))

(assert (=> b!1286092 (= res!854366 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41620 _keys!1741))))))

(declare-fun b!1286093 () Bool)

(declare-fun res!854360 () Bool)

(assert (=> b!1286093 (=> (not res!854360) (not e!734584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85136 (_ BitVec 32)) Bool)

(assert (=> b!1286093 (= res!854360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286094 () Bool)

(declare-fun res!854365 () Bool)

(assert (=> b!1286094 (=> (not res!854365) (not e!734584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286094 (= res!854365 (validKeyInArray!0 (select (arr!41070 _keys!1741) from!2144)))))

(declare-fun bm!62808 () Bool)

(assert (=> bm!62808 (= call!62811 call!62812)))

(declare-fun b!1286095 () Bool)

(declare-fun res!854364 () Bool)

(assert (=> b!1286095 (=> (not res!854364) (not e!734584))))

(assert (=> b!1286095 (= res!854364 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41620 _keys!1741))))))

(declare-fun b!1286096 () Bool)

(declare-fun e!734587 () Bool)

(assert (=> b!1286096 (= e!734587 tp_is_empty!34041)))

(declare-fun b!1286097 () Bool)

(declare-fun res!854362 () Bool)

(assert (=> b!1286097 (=> (not res!854362) (not e!734584))))

(assert (=> b!1286097 (= res!854362 (and (= (size!41619 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41620 _keys!1741) (size!41619 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!62809 () Bool)

(declare-fun call!62809 () Bool)

(assert (=> bm!62809 (= call!62809 (contains!7920 (ite c!124118 lt!577028 (ite c!124119 lt!577020 lt!577026)) k0!1205))))

(declare-fun b!1286098 () Bool)

(assert (=> b!1286098 call!62810))

(declare-fun lt!577027 () Unit!42512)

(assert (=> b!1286098 (= lt!577027 call!62811)))

(assert (=> b!1286098 (= lt!577020 call!62813)))

(declare-fun e!734582 () Unit!42512)

(assert (=> b!1286098 (= e!734582 lt!577027)))

(declare-fun b!1286099 () Bool)

(declare-fun e!734583 () Unit!42512)

(assert (=> b!1286099 (= e!734583 e!734582)))

(declare-fun lt!577022 () Bool)

(assert (=> b!1286099 (= c!124119 (and (not lt!577022) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286100 () Bool)

(assert (=> b!1286100 (= e!734588 (and e!734587 mapRes!52619))))

(declare-fun condMapEmpty!52619 () Bool)

(declare-fun mapDefault!52619 () ValueCell!16122)

(assert (=> b!1286100 (= condMapEmpty!52619 (= (arr!41069 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16122)) mapDefault!52619)))))

(declare-fun b!1286101 () Bool)

(declare-fun c!124120 () Bool)

(assert (=> b!1286101 (= c!124120 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577022))))

(assert (=> b!1286101 (= e!734582 e!734586)))

(declare-fun mapNonEmpty!52619 () Bool)

(declare-fun tp!100318 () Bool)

(assert (=> mapNonEmpty!52619 (= mapRes!52619 (and tp!100318 e!734581))))

(declare-fun mapRest!52619 () (Array (_ BitVec 32) ValueCell!16122))

(declare-fun mapValue!52619 () ValueCell!16122)

(declare-fun mapKey!52619 () (_ BitVec 32))

(assert (=> mapNonEmpty!52619 (= (arr!41069 _values!1445) (store mapRest!52619 mapKey!52619 mapValue!52619))))

(declare-fun b!1286102 () Bool)

(declare-fun lt!577023 () Unit!42512)

(assert (=> b!1286102 (= e!734583 lt!577023)))

(assert (=> b!1286102 (= lt!577028 call!62808)))

(declare-fun lt!577024 () ListLongMap!19575)

(declare-fun +!4311 (ListLongMap!19575 tuple2!21918) ListLongMap!19575)

(assert (=> b!1286102 (= lt!577024 (+!4311 lt!577028 (tuple2!21919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577021 () Unit!42512)

(assert (=> b!1286102 (= lt!577021 (lemmaInListMapAfterAddingDiffThenInBefore!26 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577024))))

(assert (=> b!1286102 (contains!7920 lt!577024 k0!1205)))

(assert (=> b!1286102 (= lt!577023 call!62812)))

(assert (=> b!1286102 call!62809))

(declare-fun bm!62810 () Bool)

(assert (=> bm!62810 (= call!62810 call!62809)))

(declare-fun b!1286103 () Bool)

(assert (=> b!1286103 (= e!734584 (not true))))

(assert (=> b!1286103 (not (contains!7920 (ListLongMap!19576 Nil!29102) k0!1205))))

(declare-fun lt!577029 () Unit!42512)

(declare-fun emptyContainsNothing!2 ((_ BitVec 64)) Unit!42512)

(assert (=> b!1286103 (= lt!577029 (emptyContainsNothing!2 k0!1205))))

(declare-fun lt!577030 () Unit!42512)

(assert (=> b!1286103 (= lt!577030 e!734583)))

(assert (=> b!1286103 (= c!124118 (and (not lt!577022) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286103 (= lt!577022 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!108888 res!854367) b!1286097))

(assert (= (and b!1286097 res!854362) b!1286093))

(assert (= (and b!1286093 res!854360) b!1286091))

(assert (= (and b!1286091 res!854361) b!1286095))

(assert (= (and b!1286095 res!854364) b!1286088))

(assert (= (and b!1286088 res!854363) b!1286092))

(assert (= (and b!1286092 res!854366) b!1286094))

(assert (= (and b!1286094 res!854365) b!1286103))

(assert (= (and b!1286103 c!124118) b!1286102))

(assert (= (and b!1286103 (not c!124118)) b!1286099))

(assert (= (and b!1286099 c!124119) b!1286098))

(assert (= (and b!1286099 (not c!124119)) b!1286101))

(assert (= (and b!1286101 c!124120) b!1286089))

(assert (= (and b!1286101 (not c!124120)) b!1286087))

(assert (= (or b!1286098 b!1286089) bm!62806))

(assert (= (or b!1286098 b!1286089) bm!62808))

(assert (= (or b!1286098 b!1286089) bm!62810))

(assert (= (or b!1286102 bm!62806) bm!62807))

(assert (= (or b!1286102 bm!62808) bm!62805))

(assert (= (or b!1286102 bm!62810) bm!62809))

(assert (= (and b!1286100 condMapEmpty!52619) mapIsEmpty!52619))

(assert (= (and b!1286100 (not condMapEmpty!52619)) mapNonEmpty!52619))

(get-info :version)

(assert (= (and mapNonEmpty!52619 ((_ is ValueCellFull!16122) mapValue!52619)) b!1286090))

(assert (= (and b!1286100 ((_ is ValueCellFull!16122) mapDefault!52619)) b!1286096))

(assert (= start!108888 b!1286100))

(declare-fun m!1179225 () Bool)

(assert (=> b!1286093 m!1179225))

(declare-fun m!1179227 () Bool)

(assert (=> b!1286103 m!1179227))

(declare-fun m!1179229 () Bool)

(assert (=> b!1286103 m!1179229))

(declare-fun m!1179231 () Bool)

(assert (=> b!1286091 m!1179231))

(declare-fun m!1179233 () Bool)

(assert (=> start!108888 m!1179233))

(declare-fun m!1179235 () Bool)

(assert (=> start!108888 m!1179235))

(declare-fun m!1179237 () Bool)

(assert (=> start!108888 m!1179237))

(declare-fun m!1179239 () Bool)

(assert (=> mapNonEmpty!52619 m!1179239))

(declare-fun m!1179241 () Bool)

(assert (=> bm!62805 m!1179241))

(declare-fun m!1179243 () Bool)

(assert (=> b!1286102 m!1179243))

(declare-fun m!1179245 () Bool)

(assert (=> b!1286102 m!1179245))

(declare-fun m!1179247 () Bool)

(assert (=> b!1286102 m!1179247))

(declare-fun m!1179249 () Bool)

(assert (=> bm!62807 m!1179249))

(declare-fun m!1179251 () Bool)

(assert (=> b!1286088 m!1179251))

(assert (=> b!1286088 m!1179251))

(declare-fun m!1179253 () Bool)

(assert (=> b!1286088 m!1179253))

(declare-fun m!1179255 () Bool)

(assert (=> bm!62809 m!1179255))

(declare-fun m!1179257 () Bool)

(assert (=> b!1286094 m!1179257))

(assert (=> b!1286094 m!1179257))

(declare-fun m!1179259 () Bool)

(assert (=> b!1286094 m!1179259))

(check-sat (not b_next!28401) b_and!46467 tp_is_empty!34041 (not b!1286091) (not b!1286094) (not bm!62807) (not b!1286102) (not bm!62805) (not b!1286093) (not bm!62809) (not b!1286103) (not mapNonEmpty!52619) (not b!1286088) (not start!108888))
(check-sat b_and!46467 (not b_next!28401))
