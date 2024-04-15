; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108904 () Bool)

(assert start!108904)

(declare-fun b_free!28417 () Bool)

(declare-fun b_next!28417 () Bool)

(assert (=> start!108904 (= b_free!28417 (not b_next!28417))))

(declare-fun tp!100368 () Bool)

(declare-fun b_and!46477 () Bool)

(assert (=> start!108904 (= tp!100368 b_and!46477)))

(declare-datatypes ((V!50513 0))(
  ( (V!50514 (val!17103 Int)) )
))
(declare-datatypes ((tuple2!21996 0))(
  ( (tuple2!21997 (_1!11009 (_ BitVec 64)) (_2!11009 V!50513)) )
))
(declare-datatypes ((List!29172 0))(
  ( (Nil!29169) (Cons!29168 (h!30377 tuple2!21996) (t!42722 List!29172)) )
))
(declare-datatypes ((ListLongMap!19653 0))(
  ( (ListLongMap!19654 (toList!9842 List!29172)) )
))
(declare-fun lt!577152 () ListLongMap!19653)

(declare-fun c!124176 () Bool)

(declare-fun lt!577157 () ListLongMap!19653)

(declare-fun call!62935 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun c!124174 () Bool)

(declare-fun lt!577156 () ListLongMap!19653)

(declare-fun bm!62930 () Bool)

(declare-fun contains!7888 (ListLongMap!19653 (_ BitVec 64)) Bool)

(assert (=> bm!62930 (= call!62935 (contains!7888 (ite c!124174 lt!577157 (ite c!124176 lt!577156 lt!577152)) k0!1205))))

(declare-fun minValue!1387 () V!50513)

(declare-fun zeroValue!1387 () V!50513)

(declare-fun bm!62931 () Bool)

(declare-datatypes ((Unit!42376 0))(
  ( (Unit!42377) )
))
(declare-fun call!62936 () Unit!42376)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!34 ((_ BitVec 64) (_ BitVec 64) V!50513 ListLongMap!19653) Unit!42376)

(assert (=> bm!62931 (= call!62936 (lemmaInListMapAfterAddingDiffThenInBefore!34 k0!1205 (ite (or c!124174 c!124176) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124174 c!124176) zeroValue!1387 minValue!1387) (ite c!124174 lt!577157 (ite c!124176 lt!577156 lt!577152))))))

(declare-fun b!1286463 () Bool)

(declare-fun e!734772 () Bool)

(declare-fun tp_is_empty!34057 () Bool)

(assert (=> b!1286463 (= e!734772 tp_is_empty!34057)))

(declare-fun b!1286464 () Bool)

(declare-fun c!124175 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!577154 () Bool)

(assert (=> b!1286464 (= c!124175 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577154))))

(declare-fun e!734764 () Unit!42376)

(declare-fun e!734770 () Unit!42376)

(assert (=> b!1286464 (= e!734764 e!734770)))

(declare-fun bm!62932 () Bool)

(declare-fun call!62933 () ListLongMap!19653)

(declare-fun call!62934 () ListLongMap!19653)

(assert (=> bm!62932 (= call!62933 call!62934)))

(declare-fun bm!62933 () Bool)

(declare-fun call!62938 () Unit!42376)

(assert (=> bm!62933 (= call!62938 call!62936)))

(declare-fun bm!62934 () Bool)

(declare-fun call!62937 () Bool)

(assert (=> bm!62934 (= call!62937 call!62935)))

(declare-fun b!1286466 () Bool)

(declare-fun res!854545 () Bool)

(declare-fun e!734766 () Bool)

(assert (=> b!1286466 (=> (not res!854545) (not e!734766))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85055 0))(
  ( (array!85056 (arr!41030 (Array (_ BitVec 32) (_ BitVec 64))) (size!41582 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85055)

(assert (=> b!1286466 (= res!854545 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41582 _keys!1741))))))

(declare-fun b!1286467 () Bool)

(declare-fun e!734767 () Unit!42376)

(assert (=> b!1286467 (= e!734767 e!734764)))

(assert (=> b!1286467 (= c!124176 (and (not lt!577154) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286468 () Bool)

(declare-fun res!854553 () Bool)

(assert (=> b!1286468 (=> (not res!854553) (not e!734766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286468 (= res!854553 (validKeyInArray!0 (select (arr!41030 _keys!1741) from!2144)))))

(declare-fun b!1286469 () Bool)

(assert (=> b!1286469 call!62937))

(declare-fun lt!577149 () Unit!42376)

(assert (=> b!1286469 (= lt!577149 call!62938)))

(assert (=> b!1286469 (= lt!577156 call!62933)))

(assert (=> b!1286469 (= e!734764 lt!577149)))

(declare-fun b!1286470 () Bool)

(declare-fun res!854549 () Bool)

(assert (=> b!1286470 (=> (not res!854549) (not e!734766))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16130 0))(
  ( (ValueCellFull!16130 (v!19704 V!50513)) (EmptyCell!16130) )
))
(declare-datatypes ((array!85057 0))(
  ( (array!85058 (arr!41031 (Array (_ BitVec 32) ValueCell!16130)) (size!41583 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85057)

(declare-fun getCurrentListMap!4809 (array!85055 array!85057 (_ BitVec 32) (_ BitVec 32) V!50513 V!50513 (_ BitVec 32) Int) ListLongMap!19653)

(assert (=> b!1286470 (= res!854549 (contains!7888 (getCurrentListMap!4809 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286471 () Bool)

(declare-fun e!734768 () Bool)

(assert (=> b!1286471 (= e!734768 tp_is_empty!34057)))

(declare-fun b!1286472 () Bool)

(declare-fun Unit!42378 () Unit!42376)

(assert (=> b!1286472 (= e!734770 Unit!42378)))

(declare-fun b!1286473 () Bool)

(declare-fun e!734765 () Bool)

(assert (=> b!1286473 (= e!734765 true)))

(declare-fun lt!577146 () V!50513)

(declare-fun +!4356 (ListLongMap!19653 tuple2!21996) ListLongMap!19653)

(assert (=> b!1286473 (not (contains!7888 (+!4356 (ListLongMap!19654 Nil!29169) (tuple2!21997 (select (arr!41030 _keys!1741) from!2144) lt!577146)) k0!1205))))

(declare-fun lt!577158 () Unit!42376)

(declare-fun addStillNotContains!340 (ListLongMap!19653 (_ BitVec 64) V!50513 (_ BitVec 64)) Unit!42376)

(assert (=> b!1286473 (= lt!577158 (addStillNotContains!340 (ListLongMap!19654 Nil!29169) (select (arr!41030 _keys!1741) from!2144) lt!577146 k0!1205))))

(declare-fun get!20861 (ValueCell!16130 V!50513) V!50513)

(declare-fun dynLambda!3438 (Int (_ BitVec 64)) V!50513)

(assert (=> b!1286473 (= lt!577146 (get!20861 (select (arr!41031 _values!1445) from!2144) (dynLambda!3438 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!52643 () Bool)

(declare-fun mapRes!52643 () Bool)

(assert (=> mapIsEmpty!52643 mapRes!52643))

(declare-fun b!1286474 () Bool)

(declare-fun res!854546 () Bool)

(assert (=> b!1286474 (=> (not res!854546) (not e!734766))))

(assert (=> b!1286474 (= res!854546 (and (= (size!41583 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41582 _keys!1741) (size!41583 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286475 () Bool)

(assert (=> b!1286475 (= e!734766 (not e!734765))))

(declare-fun res!854550 () Bool)

(assert (=> b!1286475 (=> res!854550 e!734765)))

(assert (=> b!1286475 (= res!854550 (= k0!1205 (select (arr!41030 _keys!1741) from!2144)))))

(assert (=> b!1286475 (not (contains!7888 (ListLongMap!19654 Nil!29169) k0!1205))))

(declare-fun lt!577148 () Unit!42376)

(declare-fun emptyContainsNothing!6 ((_ BitVec 64)) Unit!42376)

(assert (=> b!1286475 (= lt!577148 (emptyContainsNothing!6 k0!1205))))

(declare-fun lt!577155 () Unit!42376)

(assert (=> b!1286475 (= lt!577155 e!734767)))

(assert (=> b!1286475 (= c!124174 (and (not lt!577154) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286475 (= lt!577154 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!62935 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5986 (array!85055 array!85057 (_ BitVec 32) (_ BitVec 32) V!50513 V!50513 (_ BitVec 32) Int) ListLongMap!19653)

(assert (=> bm!62935 (= call!62934 (getCurrentListMapNoExtraKeys!5986 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286465 () Bool)

(declare-fun res!854551 () Bool)

(assert (=> b!1286465 (=> (not res!854551) (not e!734766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85055 (_ BitVec 32)) Bool)

(assert (=> b!1286465 (= res!854551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!854547 () Bool)

(assert (=> start!108904 (=> (not res!854547) (not e!734766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108904 (= res!854547 (validMask!0 mask!2175))))

(assert (=> start!108904 e!734766))

(assert (=> start!108904 tp_is_empty!34057))

(assert (=> start!108904 true))

(declare-fun e!734771 () Bool)

(declare-fun array_inv!31273 (array!85057) Bool)

(assert (=> start!108904 (and (array_inv!31273 _values!1445) e!734771)))

(declare-fun array_inv!31274 (array!85055) Bool)

(assert (=> start!108904 (array_inv!31274 _keys!1741)))

(assert (=> start!108904 tp!100368))

(declare-fun mapNonEmpty!52643 () Bool)

(declare-fun tp!100367 () Bool)

(assert (=> mapNonEmpty!52643 (= mapRes!52643 (and tp!100367 e!734768))))

(declare-fun mapKey!52643 () (_ BitVec 32))

(declare-fun mapValue!52643 () ValueCell!16130)

(declare-fun mapRest!52643 () (Array (_ BitVec 32) ValueCell!16130))

(assert (=> mapNonEmpty!52643 (= (arr!41031 _values!1445) (store mapRest!52643 mapKey!52643 mapValue!52643))))

(declare-fun b!1286476 () Bool)

(declare-fun lt!577147 () Unit!42376)

(assert (=> b!1286476 (= e!734770 lt!577147)))

(assert (=> b!1286476 (= lt!577152 call!62933)))

(assert (=> b!1286476 (= lt!577147 call!62938)))

(assert (=> b!1286476 call!62937))

(declare-fun b!1286477 () Bool)

(declare-fun res!854548 () Bool)

(assert (=> b!1286477 (=> (not res!854548) (not e!734766))))

(assert (=> b!1286477 (= res!854548 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41582 _keys!1741))))))

(declare-fun b!1286478 () Bool)

(declare-fun lt!577153 () Unit!42376)

(assert (=> b!1286478 (= e!734767 lt!577153)))

(assert (=> b!1286478 (= lt!577157 call!62934)))

(declare-fun lt!577151 () ListLongMap!19653)

(assert (=> b!1286478 (= lt!577151 (+!4356 lt!577157 (tuple2!21997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577150 () Unit!42376)

(assert (=> b!1286478 (= lt!577150 (lemmaInListMapAfterAddingDiffThenInBefore!34 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577151))))

(assert (=> b!1286478 (contains!7888 lt!577151 k0!1205)))

(assert (=> b!1286478 (= lt!577153 call!62936)))

(assert (=> b!1286478 call!62935))

(declare-fun b!1286479 () Bool)

(assert (=> b!1286479 (= e!734771 (and e!734772 mapRes!52643))))

(declare-fun condMapEmpty!52643 () Bool)

(declare-fun mapDefault!52643 () ValueCell!16130)

(assert (=> b!1286479 (= condMapEmpty!52643 (= (arr!41031 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16130)) mapDefault!52643)))))

(declare-fun b!1286480 () Bool)

(declare-fun res!854552 () Bool)

(assert (=> b!1286480 (=> (not res!854552) (not e!734766))))

(declare-datatypes ((List!29173 0))(
  ( (Nil!29170) (Cons!29169 (h!30378 (_ BitVec 64)) (t!42723 List!29173)) )
))
(declare-fun arrayNoDuplicates!0 (array!85055 (_ BitVec 32) List!29173) Bool)

(assert (=> b!1286480 (= res!854552 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29170))))

(assert (= (and start!108904 res!854547) b!1286474))

(assert (= (and b!1286474 res!854546) b!1286465))

(assert (= (and b!1286465 res!854551) b!1286480))

(assert (= (and b!1286480 res!854552) b!1286477))

(assert (= (and b!1286477 res!854548) b!1286470))

(assert (= (and b!1286470 res!854549) b!1286466))

(assert (= (and b!1286466 res!854545) b!1286468))

(assert (= (and b!1286468 res!854553) b!1286475))

(assert (= (and b!1286475 c!124174) b!1286478))

(assert (= (and b!1286475 (not c!124174)) b!1286467))

(assert (= (and b!1286467 c!124176) b!1286469))

(assert (= (and b!1286467 (not c!124176)) b!1286464))

(assert (= (and b!1286464 c!124175) b!1286476))

(assert (= (and b!1286464 (not c!124175)) b!1286472))

(assert (= (or b!1286469 b!1286476) bm!62932))

(assert (= (or b!1286469 b!1286476) bm!62933))

(assert (= (or b!1286469 b!1286476) bm!62934))

(assert (= (or b!1286478 bm!62932) bm!62935))

(assert (= (or b!1286478 bm!62933) bm!62931))

(assert (= (or b!1286478 bm!62934) bm!62930))

(assert (= (and b!1286475 (not res!854550)) b!1286473))

(assert (= (and b!1286479 condMapEmpty!52643) mapIsEmpty!52643))

(assert (= (and b!1286479 (not condMapEmpty!52643)) mapNonEmpty!52643))

(get-info :version)

(assert (= (and mapNonEmpty!52643 ((_ is ValueCellFull!16130) mapValue!52643)) b!1286471))

(assert (= (and b!1286479 ((_ is ValueCellFull!16130) mapDefault!52643)) b!1286463))

(assert (= start!108904 b!1286479))

(declare-fun b_lambda!23109 () Bool)

(assert (=> (not b_lambda!23109) (not b!1286473)))

(declare-fun t!42721 () Bool)

(declare-fun tb!11353 () Bool)

(assert (=> (and start!108904 (= defaultEntry!1448 defaultEntry!1448) t!42721) tb!11353))

(declare-fun result!23713 () Bool)

(assert (=> tb!11353 (= result!23713 tp_is_empty!34057)))

(assert (=> b!1286473 t!42721))

(declare-fun b_and!46479 () Bool)

(assert (= b_and!46477 (and (=> t!42721 result!23713) b_and!46479)))

(declare-fun m!1179085 () Bool)

(assert (=> b!1286465 m!1179085))

(declare-fun m!1179087 () Bool)

(assert (=> b!1286468 m!1179087))

(assert (=> b!1286468 m!1179087))

(declare-fun m!1179089 () Bool)

(assert (=> b!1286468 m!1179089))

(assert (=> b!1286475 m!1179087))

(declare-fun m!1179091 () Bool)

(assert (=> b!1286475 m!1179091))

(declare-fun m!1179093 () Bool)

(assert (=> b!1286475 m!1179093))

(declare-fun m!1179095 () Bool)

(assert (=> bm!62930 m!1179095))

(declare-fun m!1179097 () Bool)

(assert (=> mapNonEmpty!52643 m!1179097))

(declare-fun m!1179099 () Bool)

(assert (=> bm!62931 m!1179099))

(declare-fun m!1179101 () Bool)

(assert (=> b!1286473 m!1179101))

(declare-fun m!1179103 () Bool)

(assert (=> b!1286473 m!1179103))

(declare-fun m!1179105 () Bool)

(assert (=> b!1286473 m!1179105))

(declare-fun m!1179107 () Bool)

(assert (=> b!1286473 m!1179107))

(assert (=> b!1286473 m!1179087))

(declare-fun m!1179109 () Bool)

(assert (=> b!1286473 m!1179109))

(assert (=> b!1286473 m!1179103))

(assert (=> b!1286473 m!1179101))

(declare-fun m!1179111 () Bool)

(assert (=> b!1286473 m!1179111))

(assert (=> b!1286473 m!1179105))

(assert (=> b!1286473 m!1179087))

(declare-fun m!1179113 () Bool)

(assert (=> start!108904 m!1179113))

(declare-fun m!1179115 () Bool)

(assert (=> start!108904 m!1179115))

(declare-fun m!1179117 () Bool)

(assert (=> start!108904 m!1179117))

(declare-fun m!1179119 () Bool)

(assert (=> b!1286470 m!1179119))

(assert (=> b!1286470 m!1179119))

(declare-fun m!1179121 () Bool)

(assert (=> b!1286470 m!1179121))

(declare-fun m!1179123 () Bool)

(assert (=> bm!62935 m!1179123))

(declare-fun m!1179125 () Bool)

(assert (=> b!1286480 m!1179125))

(declare-fun m!1179127 () Bool)

(assert (=> b!1286478 m!1179127))

(declare-fun m!1179129 () Bool)

(assert (=> b!1286478 m!1179129))

(declare-fun m!1179131 () Bool)

(assert (=> b!1286478 m!1179131))

(check-sat (not b_next!28417) (not b!1286473) (not start!108904) tp_is_empty!34057 (not b!1286470) (not bm!62935) (not b!1286480) (not bm!62931) (not b_lambda!23109) (not b!1286475) b_and!46479 (not b!1286468) (not mapNonEmpty!52643) (not b!1286465) (not b!1286478) (not bm!62930))
(check-sat b_and!46479 (not b_next!28417))
