; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109038 () Bool)

(assert start!109038)

(declare-fun b_free!28327 () Bool)

(declare-fun b_next!28327 () Bool)

(assert (=> start!109038 (= b_free!28327 (not b_next!28327))))

(declare-fun tp!100096 () Bool)

(declare-fun b_and!46395 () Bool)

(assert (=> start!109038 (= tp!100096 b_and!46395)))

(declare-fun b!1286332 () Bool)

(declare-fun res!854187 () Bool)

(declare-fun e!734860 () Bool)

(assert (=> b!1286332 (=> (not res!854187) (not e!734860))))

(declare-datatypes ((V!50393 0))(
  ( (V!50394 (val!17058 Int)) )
))
(declare-fun minValue!1387 () V!50393)

(declare-fun zeroValue!1387 () V!50393)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16085 0))(
  ( (ValueCellFull!16085 (v!19655 V!50393)) (EmptyCell!16085) )
))
(declare-datatypes ((array!85021 0))(
  ( (array!85022 (arr!41008 (Array (_ BitVec 32) ValueCell!16085)) (size!41559 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85021)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85023 0))(
  ( (array!85024 (arr!41009 (Array (_ BitVec 32) (_ BitVec 64))) (size!41560 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85023)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21882 0))(
  ( (tuple2!21883 (_1!10952 (_ BitVec 64)) (_2!10952 V!50393)) )
))
(declare-datatypes ((List!29083 0))(
  ( (Nil!29080) (Cons!29079 (h!30297 tuple2!21882) (t!42619 List!29083)) )
))
(declare-datatypes ((ListLongMap!19547 0))(
  ( (ListLongMap!19548 (toList!9789 List!29083)) )
))
(declare-fun contains!7920 (ListLongMap!19547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4853 (array!85023 array!85021 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19547)

(assert (=> b!1286332 (= res!854187 (contains!7920 (getCurrentListMap!4853 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854185 () Bool)

(assert (=> start!109038 (=> (not res!854185) (not e!734860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109038 (= res!854185 (validMask!0 mask!2175))))

(assert (=> start!109038 e!734860))

(declare-fun tp_is_empty!33967 () Bool)

(assert (=> start!109038 tp_is_empty!33967))

(assert (=> start!109038 true))

(declare-fun e!734862 () Bool)

(declare-fun array_inv!31319 (array!85021) Bool)

(assert (=> start!109038 (and (array_inv!31319 _values!1445) e!734862)))

(declare-fun array_inv!31320 (array!85023) Bool)

(assert (=> start!109038 (array_inv!31320 _keys!1741)))

(assert (=> start!109038 tp!100096))

(declare-fun b!1286333 () Bool)

(declare-fun res!854191 () Bool)

(assert (=> b!1286333 (=> (not res!854191) (not e!734860))))

(assert (=> b!1286333 (= res!854191 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41560 _keys!1741))))))

(declare-fun b!1286334 () Bool)

(declare-fun e!734861 () Bool)

(assert (=> b!1286334 (= e!734861 tp_is_empty!33967)))

(declare-fun b!1286335 () Bool)

(declare-fun res!854188 () Bool)

(assert (=> b!1286335 (=> (not res!854188) (not e!734860))))

(declare-datatypes ((List!29084 0))(
  ( (Nil!29081) (Cons!29080 (h!30298 (_ BitVec 64)) (t!42620 List!29084)) )
))
(declare-fun arrayNoDuplicates!0 (array!85023 (_ BitVec 32) List!29084) Bool)

(assert (=> b!1286335 (= res!854188 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29081))))

(declare-fun mapIsEmpty!52508 () Bool)

(declare-fun mapRes!52508 () Bool)

(assert (=> mapIsEmpty!52508 mapRes!52508))

(declare-fun mapNonEmpty!52508 () Bool)

(declare-fun tp!100097 () Bool)

(assert (=> mapNonEmpty!52508 (= mapRes!52508 (and tp!100097 e!734861))))

(declare-fun mapValue!52508 () ValueCell!16085)

(declare-fun mapKey!52508 () (_ BitVec 32))

(declare-fun mapRest!52508 () (Array (_ BitVec 32) ValueCell!16085))

(assert (=> mapNonEmpty!52508 (= (arr!41008 _values!1445) (store mapRest!52508 mapKey!52508 mapValue!52508))))

(declare-fun b!1286336 () Bool)

(declare-fun e!734858 () Bool)

(assert (=> b!1286336 (= e!734862 (and e!734858 mapRes!52508))))

(declare-fun condMapEmpty!52508 () Bool)

(declare-fun mapDefault!52508 () ValueCell!16085)

(assert (=> b!1286336 (= condMapEmpty!52508 (= (arr!41008 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16085)) mapDefault!52508)))))

(declare-fun b!1286337 () Bool)

(declare-fun res!854190 () Bool)

(assert (=> b!1286337 (=> (not res!854190) (not e!734860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286337 (= res!854190 (validKeyInArray!0 (select (arr!41009 _keys!1741) from!2144)))))

(declare-fun b!1286338 () Bool)

(declare-fun res!854183 () Bool)

(assert (=> b!1286338 (=> (not res!854183) (not e!734860))))

(assert (=> b!1286338 (= res!854183 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41560 _keys!1741))))))

(declare-fun b!1286339 () Bool)

(assert (=> b!1286339 (= e!734858 tp_is_empty!33967)))

(declare-fun b!1286340 () Bool)

(declare-fun res!854186 () Bool)

(assert (=> b!1286340 (=> (not res!854186) (not e!734860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85023 (_ BitVec 32)) Bool)

(assert (=> b!1286340 (= res!854186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286341 () Bool)

(declare-fun res!854189 () Bool)

(assert (=> b!1286341 (=> (not res!854189) (not e!734860))))

(assert (=> b!1286341 (= res!854189 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1286342 () Bool)

(declare-fun res!854184 () Bool)

(assert (=> b!1286342 (=> (not res!854184) (not e!734860))))

(assert (=> b!1286342 (= res!854184 (and (= (size!41559 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41560 _keys!1741) (size!41559 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286343 () Bool)

(assert (=> b!1286343 (= e!734860 false)))

(declare-fun lt!577352 () Bool)

(declare-fun +!4350 (ListLongMap!19547 tuple2!21882) ListLongMap!19547)

(declare-fun getCurrentListMapNoExtraKeys!5982 (array!85023 array!85021 (_ BitVec 32) (_ BitVec 32) V!50393 V!50393 (_ BitVec 32) Int) ListLongMap!19547)

(assert (=> b!1286343 (= lt!577352 (contains!7920 (+!4350 (getCurrentListMapNoExtraKeys!5982 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(assert (= (and start!109038 res!854185) b!1286342))

(assert (= (and b!1286342 res!854184) b!1286340))

(assert (= (and b!1286340 res!854186) b!1286335))

(assert (= (and b!1286335 res!854188) b!1286338))

(assert (= (and b!1286338 res!854183) b!1286332))

(assert (= (and b!1286332 res!854187) b!1286333))

(assert (= (and b!1286333 res!854191) b!1286337))

(assert (= (and b!1286337 res!854190) b!1286341))

(assert (= (and b!1286341 res!854189) b!1286343))

(assert (= (and b!1286336 condMapEmpty!52508) mapIsEmpty!52508))

(assert (= (and b!1286336 (not condMapEmpty!52508)) mapNonEmpty!52508))

(get-info :version)

(assert (= (and mapNonEmpty!52508 ((_ is ValueCellFull!16085) mapValue!52508)) b!1286334))

(assert (= (and b!1286336 ((_ is ValueCellFull!16085) mapDefault!52508)) b!1286339))

(assert (= start!109038 b!1286336))

(declare-fun m!1180123 () Bool)

(assert (=> b!1286337 m!1180123))

(assert (=> b!1286337 m!1180123))

(declare-fun m!1180125 () Bool)

(assert (=> b!1286337 m!1180125))

(declare-fun m!1180127 () Bool)

(assert (=> start!109038 m!1180127))

(declare-fun m!1180129 () Bool)

(assert (=> start!109038 m!1180129))

(declare-fun m!1180131 () Bool)

(assert (=> start!109038 m!1180131))

(declare-fun m!1180133 () Bool)

(assert (=> mapNonEmpty!52508 m!1180133))

(declare-fun m!1180135 () Bool)

(assert (=> b!1286340 m!1180135))

(declare-fun m!1180137 () Bool)

(assert (=> b!1286332 m!1180137))

(assert (=> b!1286332 m!1180137))

(declare-fun m!1180139 () Bool)

(assert (=> b!1286332 m!1180139))

(declare-fun m!1180141 () Bool)

(assert (=> b!1286343 m!1180141))

(assert (=> b!1286343 m!1180141))

(declare-fun m!1180143 () Bool)

(assert (=> b!1286343 m!1180143))

(assert (=> b!1286343 m!1180143))

(declare-fun m!1180145 () Bool)

(assert (=> b!1286343 m!1180145))

(declare-fun m!1180147 () Bool)

(assert (=> b!1286335 m!1180147))

(check-sat (not mapNonEmpty!52508) (not b!1286337) (not start!109038) (not b!1286335) (not b!1286343) b_and!46395 (not b!1286340) tp_is_empty!33967 (not b_next!28327) (not b!1286332))
(check-sat b_and!46395 (not b_next!28327))
