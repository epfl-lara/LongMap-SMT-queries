; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108922 () Bool)

(assert start!108922)

(declare-fun b_free!28435 () Bool)

(declare-fun b_next!28435 () Bool)

(assert (=> start!108922 (= b_free!28435 (not b_next!28435))))

(declare-fun tp!100422 () Bool)

(declare-fun b_and!46501 () Bool)

(assert (=> start!108922 (= tp!100422 b_and!46501)))

(declare-fun b!1286935 () Bool)

(declare-fun res!854771 () Bool)

(declare-fun e!734990 () Bool)

(assert (=> b!1286935 (=> (not res!854771) (not e!734990))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50537 0))(
  ( (V!50538 (val!17112 Int)) )
))
(declare-datatypes ((ValueCell!16139 0))(
  ( (ValueCellFull!16139 (v!19713 V!50537)) (EmptyCell!16139) )
))
(declare-datatypes ((array!85089 0))(
  ( (array!85090 (arr!41047 (Array (_ BitVec 32) ValueCell!16139)) (size!41599 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85089)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85091 0))(
  ( (array!85092 (arr!41048 (Array (_ BitVec 32) (_ BitVec 64))) (size!41600 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85091)

(assert (=> b!1286935 (= res!854771 (and (= (size!41599 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41600 _keys!1741) (size!41599 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63092 () Bool)

(declare-datatypes ((tuple2!22012 0))(
  ( (tuple2!22013 (_1!11017 (_ BitVec 64)) (_2!11017 V!50537)) )
))
(declare-datatypes ((List!29187 0))(
  ( (Nil!29184) (Cons!29183 (h!30392 tuple2!22012) (t!42741 List!29187)) )
))
(declare-datatypes ((ListLongMap!19669 0))(
  ( (ListLongMap!19670 (toList!9850 List!29187)) )
))
(declare-fun call!63098 () ListLongMap!19669)

(declare-fun call!63097 () ListLongMap!19669)

(assert (=> bm!63092 (= call!63098 call!63097)))

(declare-fun b!1286936 () Bool)

(declare-fun c!124256 () Bool)

(declare-fun lt!577460 () Bool)

(assert (=> b!1286936 (= c!124256 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577460))))

(declare-datatypes ((Unit!42400 0))(
  ( (Unit!42401) )
))
(declare-fun e!734987 () Unit!42400)

(declare-fun e!734988 () Unit!42400)

(assert (=> b!1286936 (= e!734987 e!734988)))

(declare-fun mapNonEmpty!52670 () Bool)

(declare-fun mapRes!52670 () Bool)

(declare-fun tp!100421 () Bool)

(declare-fun e!734991 () Bool)

(assert (=> mapNonEmpty!52670 (= mapRes!52670 (and tp!100421 e!734991))))

(declare-fun mapValue!52670 () ValueCell!16139)

(declare-fun mapRest!52670 () (Array (_ BitVec 32) ValueCell!16139))

(declare-fun mapKey!52670 () (_ BitVec 32))

(assert (=> mapNonEmpty!52670 (= (arr!41047 _values!1445) (store mapRest!52670 mapKey!52670 mapValue!52670))))

(declare-fun minValue!1387 () V!50537)

(declare-fun zeroValue!1387 () V!50537)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!63093 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5991 (array!85091 array!85089 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19669)

(assert (=> bm!63093 (= call!63097 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63094 () Bool)

(declare-fun call!63095 () Bool)

(declare-fun call!63096 () Bool)

(assert (=> bm!63094 (= call!63095 call!63096)))

(declare-fun b!1286937 () Bool)

(declare-fun e!734989 () Bool)

(declare-fun tp_is_empty!34075 () Bool)

(assert (=> b!1286937 (= e!734989 tp_is_empty!34075)))

(declare-fun b!1286938 () Bool)

(declare-fun res!854769 () Bool)

(assert (=> b!1286938 (=> (not res!854769) (not e!734990))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1286938 (= res!854769 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41600 _keys!1741))))))

(declare-fun b!1286939 () Bool)

(declare-fun res!854774 () Bool)

(assert (=> b!1286939 (=> (not res!854774) (not e!734990))))

(assert (=> b!1286939 (= res!854774 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741))))))

(declare-fun b!1286940 () Bool)

(declare-fun e!734994 () Bool)

(assert (=> b!1286940 (= e!734994 (and e!734989 mapRes!52670))))

(declare-fun condMapEmpty!52670 () Bool)

(declare-fun mapDefault!52670 () ValueCell!16139)

(assert (=> b!1286940 (= condMapEmpty!52670 (= (arr!41047 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16139)) mapDefault!52670)))))

(declare-fun b!1286941 () Bool)

(declare-fun Unit!42402 () Unit!42400)

(assert (=> b!1286941 (= e!734988 Unit!42402)))

(declare-fun bm!63095 () Bool)

(declare-fun call!63100 () Unit!42400)

(declare-fun call!63099 () Unit!42400)

(assert (=> bm!63095 (= call!63100 call!63099)))

(declare-fun b!1286942 () Bool)

(declare-fun res!854775 () Bool)

(assert (=> b!1286942 (=> (not res!854775) (not e!734990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85091 (_ BitVec 32)) Bool)

(assert (=> b!1286942 (= res!854775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun c!124255 () Bool)

(declare-fun lt!577463 () ListLongMap!19669)

(declare-fun lt!577464 () ListLongMap!19669)

(declare-fun lt!577462 () ListLongMap!19669)

(declare-fun bm!63096 () Bool)

(declare-fun c!124257 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!41 ((_ BitVec 64) (_ BitVec 64) V!50537 ListLongMap!19669) Unit!42400)

(assert (=> bm!63096 (= call!63099 (lemmaInListMapAfterAddingDiffThenInBefore!41 k0!1205 (ite c!124255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124257 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124255 minValue!1387 (ite c!124257 zeroValue!1387 minValue!1387)) (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))))))

(declare-fun mapIsEmpty!52670 () Bool)

(assert (=> mapIsEmpty!52670 mapRes!52670))

(declare-fun b!1286943 () Bool)

(declare-fun lt!577457 () Unit!42400)

(assert (=> b!1286943 (= e!734988 lt!577457)))

(assert (=> b!1286943 (= lt!577462 call!63098)))

(assert (=> b!1286943 (= lt!577457 call!63100)))

(assert (=> b!1286943 call!63095))

(declare-fun b!1286944 () Bool)

(declare-fun e!734992 () Unit!42400)

(declare-fun lt!577461 () Unit!42400)

(assert (=> b!1286944 (= e!734992 lt!577461)))

(declare-fun lt!577459 () ListLongMap!19669)

(assert (=> b!1286944 (= lt!577459 call!63097)))

(declare-fun +!4363 (ListLongMap!19669 tuple2!22012) ListLongMap!19669)

(assert (=> b!1286944 (= lt!577464 (+!4363 lt!577459 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577466 () Unit!42400)

(assert (=> b!1286944 (= lt!577466 call!63099)))

(assert (=> b!1286944 call!63096))

(assert (=> b!1286944 (= lt!577461 (lemmaInListMapAfterAddingDiffThenInBefore!41 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577459))))

(declare-fun contains!7896 (ListLongMap!19669 (_ BitVec 64)) Bool)

(assert (=> b!1286944 (contains!7896 lt!577459 k0!1205)))

(declare-fun b!1286945 () Bool)

(assert (=> b!1286945 (= e!734992 e!734987)))

(assert (=> b!1286945 (= c!124257 (and (not lt!577460) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286946 () Bool)

(assert (=> b!1286946 (= e!734990 (not (or (not (= k0!1205 (select (arr!41048 _keys!1741) from!2144))) (bvslt (size!41600 _keys!1741) #b01111111111111111111111111111111))))))

(assert (=> b!1286946 (not (contains!7896 (ListLongMap!19670 Nil!29184) k0!1205))))

(declare-fun lt!577458 () Unit!42400)

(declare-fun emptyContainsNothing!11 ((_ BitVec 64)) Unit!42400)

(assert (=> b!1286946 (= lt!577458 (emptyContainsNothing!11 k0!1205))))

(declare-fun lt!577467 () Unit!42400)

(assert (=> b!1286946 (= lt!577467 e!734992)))

(assert (=> b!1286946 (= c!124255 (and (not lt!577460) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286946 (= lt!577460 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286947 () Bool)

(assert (=> b!1286947 (= e!734991 tp_is_empty!34075)))

(declare-fun res!854770 () Bool)

(assert (=> start!108922 (=> (not res!854770) (not e!734990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108922 (= res!854770 (validMask!0 mask!2175))))

(assert (=> start!108922 e!734990))

(assert (=> start!108922 tp_is_empty!34075))

(assert (=> start!108922 true))

(declare-fun array_inv!31283 (array!85089) Bool)

(assert (=> start!108922 (and (array_inv!31283 _values!1445) e!734994)))

(declare-fun array_inv!31284 (array!85091) Bool)

(assert (=> start!108922 (array_inv!31284 _keys!1741)))

(assert (=> start!108922 tp!100422))

(declare-fun b!1286948 () Bool)

(assert (=> b!1286948 call!63095))

(declare-fun lt!577465 () Unit!42400)

(assert (=> b!1286948 (= lt!577465 call!63100)))

(assert (=> b!1286948 (= lt!577463 call!63098)))

(assert (=> b!1286948 (= e!734987 lt!577465)))

(declare-fun b!1286949 () Bool)

(declare-fun res!854773 () Bool)

(assert (=> b!1286949 (=> (not res!854773) (not e!734990))))

(declare-datatypes ((List!29188 0))(
  ( (Nil!29185) (Cons!29184 (h!30393 (_ BitVec 64)) (t!42742 List!29188)) )
))
(declare-fun arrayNoDuplicates!0 (array!85091 (_ BitVec 32) List!29188) Bool)

(assert (=> b!1286949 (= res!854773 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29185))))

(declare-fun bm!63097 () Bool)

(assert (=> bm!63097 (= call!63096 (contains!7896 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462)) k0!1205))))

(declare-fun b!1286950 () Bool)

(declare-fun res!854768 () Bool)

(assert (=> b!1286950 (=> (not res!854768) (not e!734990))))

(declare-fun getCurrentListMap!4814 (array!85091 array!85089 (_ BitVec 32) (_ BitVec 32) V!50537 V!50537 (_ BitVec 32) Int) ListLongMap!19669)

(assert (=> b!1286950 (= res!854768 (contains!7896 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286951 () Bool)

(declare-fun res!854772 () Bool)

(assert (=> b!1286951 (=> (not res!854772) (not e!734990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286951 (= res!854772 (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)))))

(assert (= (and start!108922 res!854770) b!1286935))

(assert (= (and b!1286935 res!854771) b!1286942))

(assert (= (and b!1286942 res!854775) b!1286949))

(assert (= (and b!1286949 res!854773) b!1286939))

(assert (= (and b!1286939 res!854774) b!1286950))

(assert (= (and b!1286950 res!854768) b!1286938))

(assert (= (and b!1286938 res!854769) b!1286951))

(assert (= (and b!1286951 res!854772) b!1286946))

(assert (= (and b!1286946 c!124255) b!1286944))

(assert (= (and b!1286946 (not c!124255)) b!1286945))

(assert (= (and b!1286945 c!124257) b!1286948))

(assert (= (and b!1286945 (not c!124257)) b!1286936))

(assert (= (and b!1286936 c!124256) b!1286943))

(assert (= (and b!1286936 (not c!124256)) b!1286941))

(assert (= (or b!1286948 b!1286943) bm!63092))

(assert (= (or b!1286948 b!1286943) bm!63095))

(assert (= (or b!1286948 b!1286943) bm!63094))

(assert (= (or b!1286944 bm!63092) bm!63093))

(assert (= (or b!1286944 bm!63095) bm!63096))

(assert (= (or b!1286944 bm!63094) bm!63097))

(assert (= (and b!1286940 condMapEmpty!52670) mapIsEmpty!52670))

(assert (= (and b!1286940 (not condMapEmpty!52670)) mapNonEmpty!52670))

(get-info :version)

(assert (= (and mapNonEmpty!52670 ((_ is ValueCellFull!16139) mapValue!52670)) b!1286947))

(assert (= (and b!1286940 ((_ is ValueCellFull!16139) mapDefault!52670)) b!1286937))

(assert (= start!108922 b!1286940))

(declare-fun m!1179445 () Bool)

(assert (=> b!1286949 m!1179445))

(declare-fun m!1179447 () Bool)

(assert (=> bm!63097 m!1179447))

(declare-fun m!1179449 () Bool)

(assert (=> b!1286950 m!1179449))

(assert (=> b!1286950 m!1179449))

(declare-fun m!1179451 () Bool)

(assert (=> b!1286950 m!1179451))

(declare-fun m!1179453 () Bool)

(assert (=> mapNonEmpty!52670 m!1179453))

(declare-fun m!1179455 () Bool)

(assert (=> b!1286942 m!1179455))

(declare-fun m!1179457 () Bool)

(assert (=> b!1286946 m!1179457))

(declare-fun m!1179459 () Bool)

(assert (=> b!1286946 m!1179459))

(declare-fun m!1179461 () Bool)

(assert (=> b!1286946 m!1179461))

(declare-fun m!1179463 () Bool)

(assert (=> b!1286944 m!1179463))

(declare-fun m!1179465 () Bool)

(assert (=> b!1286944 m!1179465))

(declare-fun m!1179467 () Bool)

(assert (=> b!1286944 m!1179467))

(assert (=> b!1286951 m!1179457))

(assert (=> b!1286951 m!1179457))

(declare-fun m!1179469 () Bool)

(assert (=> b!1286951 m!1179469))

(declare-fun m!1179471 () Bool)

(assert (=> bm!63093 m!1179471))

(declare-fun m!1179473 () Bool)

(assert (=> start!108922 m!1179473))

(declare-fun m!1179475 () Bool)

(assert (=> start!108922 m!1179475))

(declare-fun m!1179477 () Bool)

(assert (=> start!108922 m!1179477))

(declare-fun m!1179479 () Bool)

(assert (=> bm!63096 m!1179479))

(check-sat b_and!46501 (not b_next!28435) (not bm!63093) (not b!1286944) (not bm!63097) (not b!1286942) (not bm!63096) (not mapNonEmpty!52670) (not b!1286951) (not b!1286950) (not b!1286946) (not b!1286949) tp_is_empty!34075 (not start!108922))
(check-sat b_and!46501 (not b_next!28435))
(get-model)

(declare-fun b!1287078 () Bool)

(declare-fun e!735058 () ListLongMap!19669)

(assert (=> b!1287078 (= e!735058 (ListLongMap!19670 Nil!29184))))

(declare-fun b!1287079 () Bool)

(declare-fun e!735060 () Bool)

(declare-fun e!735057 () Bool)

(assert (=> b!1287079 (= e!735060 e!735057)))

(declare-fun c!124285 () Bool)

(declare-fun e!735063 () Bool)

(assert (=> b!1287079 (= c!124285 e!735063)))

(declare-fun res!854834 () Bool)

(assert (=> b!1287079 (=> (not res!854834) (not e!735063))))

(assert (=> b!1287079 (= res!854834 (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun b!1287080 () Bool)

(declare-fun e!735061 () ListLongMap!19669)

(declare-fun call!63139 () ListLongMap!19669)

(assert (=> b!1287080 (= e!735061 call!63139)))

(declare-fun d!140677 () Bool)

(assert (=> d!140677 e!735060))

(declare-fun res!854833 () Bool)

(assert (=> d!140677 (=> (not res!854833) (not e!735060))))

(declare-fun lt!577553 () ListLongMap!19669)

(assert (=> d!140677 (= res!854833 (not (contains!7896 lt!577553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!140677 (= lt!577553 e!735058)))

(declare-fun c!124287 () Bool)

(assert (=> d!140677 (= c!124287 (bvsge from!2144 (size!41600 _keys!1741)))))

(assert (=> d!140677 (validMask!0 mask!2175)))

(assert (=> d!140677 (= (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!577553)))

(declare-fun b!1287081 () Bool)

(declare-fun e!735062 () Bool)

(assert (=> b!1287081 (= e!735057 e!735062)))

(declare-fun c!124286 () Bool)

(assert (=> b!1287081 (= c!124286 (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun b!1287082 () Bool)

(assert (=> b!1287082 (= e!735062 (= lt!577553 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1287083 () Bool)

(declare-fun e!735059 () Bool)

(assert (=> b!1287083 (= e!735057 e!735059)))

(assert (=> b!1287083 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun res!854832 () Bool)

(assert (=> b!1287083 (= res!854832 (contains!7896 lt!577553 (select (arr!41048 _keys!1741) from!2144)))))

(assert (=> b!1287083 (=> (not res!854832) (not e!735059))))

(declare-fun b!1287084 () Bool)

(assert (=> b!1287084 (= e!735063 (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)))))

(assert (=> b!1287084 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1287085 () Bool)

(assert (=> b!1287085 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741)))))

(assert (=> b!1287085 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41599 _values!1445)))))

(declare-fun apply!1004 (ListLongMap!19669 (_ BitVec 64)) V!50537)

(declare-fun get!20868 (ValueCell!16139 V!50537) V!50537)

(declare-fun dynLambda!3439 (Int (_ BitVec 64)) V!50537)

(assert (=> b!1287085 (= e!735059 (= (apply!1004 lt!577553 (select (arr!41048 _keys!1741) from!2144)) (get!20868 (select (arr!41047 _values!1445) from!2144) (dynLambda!3439 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1287086 () Bool)

(declare-fun lt!577554 () Unit!42400)

(declare-fun lt!577549 () Unit!42400)

(assert (=> b!1287086 (= lt!577554 lt!577549)))

(declare-fun lt!577550 () (_ BitVec 64))

(declare-fun lt!577548 () ListLongMap!19669)

(declare-fun lt!577551 () V!50537)

(declare-fun lt!577552 () (_ BitVec 64))

(assert (=> b!1287086 (not (contains!7896 (+!4363 lt!577548 (tuple2!22013 lt!577550 lt!577551)) lt!577552))))

(declare-fun addStillNotContains!341 (ListLongMap!19669 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42400)

(assert (=> b!1287086 (= lt!577549 (addStillNotContains!341 lt!577548 lt!577550 lt!577551 lt!577552))))

(assert (=> b!1287086 (= lt!577552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1287086 (= lt!577551 (get!20868 (select (arr!41047 _values!1445) from!2144) (dynLambda!3439 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1287086 (= lt!577550 (select (arr!41048 _keys!1741) from!2144))))

(assert (=> b!1287086 (= lt!577548 call!63139)))

(assert (=> b!1287086 (= e!735061 (+!4363 call!63139 (tuple2!22013 (select (arr!41048 _keys!1741) from!2144) (get!20868 (select (arr!41047 _values!1445) from!2144) (dynLambda!3439 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1287087 () Bool)

(assert (=> b!1287087 (= e!735058 e!735061)))

(declare-fun c!124284 () Bool)

(assert (=> b!1287087 (= c!124284 (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)))))

(declare-fun bm!63136 () Bool)

(assert (=> bm!63136 (= call!63139 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1287088 () Bool)

(declare-fun isEmpty!1055 (ListLongMap!19669) Bool)

(assert (=> b!1287088 (= e!735062 (isEmpty!1055 lt!577553))))

(declare-fun b!1287089 () Bool)

(declare-fun res!854835 () Bool)

(assert (=> b!1287089 (=> (not res!854835) (not e!735060))))

(assert (=> b!1287089 (= res!854835 (not (contains!7896 lt!577553 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!140677 c!124287) b!1287078))

(assert (= (and d!140677 (not c!124287)) b!1287087))

(assert (= (and b!1287087 c!124284) b!1287086))

(assert (= (and b!1287087 (not c!124284)) b!1287080))

(assert (= (or b!1287086 b!1287080) bm!63136))

(assert (= (and d!140677 res!854833) b!1287089))

(assert (= (and b!1287089 res!854835) b!1287079))

(assert (= (and b!1287079 res!854834) b!1287084))

(assert (= (and b!1287079 c!124285) b!1287083))

(assert (= (and b!1287079 (not c!124285)) b!1287081))

(assert (= (and b!1287083 res!854832) b!1287085))

(assert (= (and b!1287081 c!124286) b!1287082))

(assert (= (and b!1287081 (not c!124286)) b!1287088))

(declare-fun b_lambda!23115 () Bool)

(assert (=> (not b_lambda!23115) (not b!1287085)))

(declare-fun t!42747 () Bool)

(declare-fun tb!11359 () Bool)

(assert (=> (and start!108922 (= defaultEntry!1448 defaultEntry!1448) t!42747) tb!11359))

(declare-fun result!23725 () Bool)

(assert (=> tb!11359 (= result!23725 tp_is_empty!34075)))

(assert (=> b!1287085 t!42747))

(declare-fun b_and!46507 () Bool)

(assert (= b_and!46501 (and (=> t!42747 result!23725) b_and!46507)))

(declare-fun b_lambda!23117 () Bool)

(assert (=> (not b_lambda!23117) (not b!1287086)))

(assert (=> b!1287086 t!42747))

(declare-fun b_and!46509 () Bool)

(assert (= b_and!46507 (and (=> t!42747 result!23725) b_and!46509)))

(declare-fun m!1179553 () Bool)

(assert (=> d!140677 m!1179553))

(assert (=> d!140677 m!1179473))

(declare-fun m!1179555 () Bool)

(assert (=> bm!63136 m!1179555))

(assert (=> b!1287087 m!1179457))

(assert (=> b!1287087 m!1179457))

(assert (=> b!1287087 m!1179469))

(declare-fun m!1179557 () Bool)

(assert (=> b!1287085 m!1179557))

(declare-fun m!1179559 () Bool)

(assert (=> b!1287085 m!1179559))

(declare-fun m!1179561 () Bool)

(assert (=> b!1287085 m!1179561))

(assert (=> b!1287085 m!1179457))

(declare-fun m!1179563 () Bool)

(assert (=> b!1287085 m!1179563))

(assert (=> b!1287085 m!1179559))

(assert (=> b!1287085 m!1179457))

(assert (=> b!1287085 m!1179557))

(assert (=> b!1287084 m!1179457))

(assert (=> b!1287084 m!1179457))

(assert (=> b!1287084 m!1179469))

(assert (=> b!1287086 m!1179557))

(assert (=> b!1287086 m!1179559))

(assert (=> b!1287086 m!1179561))

(declare-fun m!1179565 () Bool)

(assert (=> b!1287086 m!1179565))

(declare-fun m!1179567 () Bool)

(assert (=> b!1287086 m!1179567))

(assert (=> b!1287086 m!1179559))

(assert (=> b!1287086 m!1179567))

(declare-fun m!1179569 () Bool)

(assert (=> b!1287086 m!1179569))

(declare-fun m!1179571 () Bool)

(assert (=> b!1287086 m!1179571))

(assert (=> b!1287086 m!1179457))

(assert (=> b!1287086 m!1179557))

(assert (=> b!1287082 m!1179555))

(declare-fun m!1179573 () Bool)

(assert (=> b!1287088 m!1179573))

(assert (=> b!1287083 m!1179457))

(assert (=> b!1287083 m!1179457))

(declare-fun m!1179575 () Bool)

(assert (=> b!1287083 m!1179575))

(declare-fun m!1179577 () Bool)

(assert (=> b!1287089 m!1179577))

(assert (=> bm!63093 d!140677))

(declare-fun bm!63139 () Bool)

(declare-fun call!63142 () Bool)

(declare-fun c!124290 () Bool)

(assert (=> bm!63139 (= call!63142 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124290 (Cons!29184 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000) Nil!29185) Nil!29185)))))

(declare-fun b!1287102 () Bool)

(declare-fun e!735072 () Bool)

(declare-fun contains!7899 (List!29188 (_ BitVec 64)) Bool)

(assert (=> b!1287102 (= e!735072 (contains!7899 Nil!29185 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1287103 () Bool)

(declare-fun e!735075 () Bool)

(declare-fun e!735073 () Bool)

(assert (=> b!1287103 (= e!735075 e!735073)))

(assert (=> b!1287103 (= c!124290 (validKeyInArray!0 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1287104 () Bool)

(assert (=> b!1287104 (= e!735073 call!63142)))

(declare-fun b!1287105 () Bool)

(assert (=> b!1287105 (= e!735073 call!63142)))

(declare-fun d!140679 () Bool)

(declare-fun res!854843 () Bool)

(declare-fun e!735074 () Bool)

(assert (=> d!140679 (=> res!854843 e!735074)))

(assert (=> d!140679 (= res!854843 (bvsge #b00000000000000000000000000000000 (size!41600 _keys!1741)))))

(assert (=> d!140679 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29185) e!735074)))

(declare-fun b!1287106 () Bool)

(assert (=> b!1287106 (= e!735074 e!735075)))

(declare-fun res!854842 () Bool)

(assert (=> b!1287106 (=> (not res!854842) (not e!735075))))

(assert (=> b!1287106 (= res!854842 (not e!735072))))

(declare-fun res!854844 () Bool)

(assert (=> b!1287106 (=> (not res!854844) (not e!735072))))

(assert (=> b!1287106 (= res!854844 (validKeyInArray!0 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140679 (not res!854843)) b!1287106))

(assert (= (and b!1287106 res!854844) b!1287102))

(assert (= (and b!1287106 res!854842) b!1287103))

(assert (= (and b!1287103 c!124290) b!1287105))

(assert (= (and b!1287103 (not c!124290)) b!1287104))

(assert (= (or b!1287105 b!1287104) bm!63139))

(declare-fun m!1179579 () Bool)

(assert (=> bm!63139 m!1179579))

(declare-fun m!1179581 () Bool)

(assert (=> bm!63139 m!1179581))

(assert (=> b!1287102 m!1179579))

(assert (=> b!1287102 m!1179579))

(declare-fun m!1179583 () Bool)

(assert (=> b!1287102 m!1179583))

(assert (=> b!1287103 m!1179579))

(assert (=> b!1287103 m!1179579))

(declare-fun m!1179585 () Bool)

(assert (=> b!1287103 m!1179585))

(assert (=> b!1287106 m!1179579))

(assert (=> b!1287106 m!1179579))

(assert (=> b!1287106 m!1179585))

(assert (=> b!1286949 d!140679))

(declare-fun d!140681 () Bool)

(declare-fun e!735078 () Bool)

(assert (=> d!140681 e!735078))

(declare-fun res!854850 () Bool)

(assert (=> d!140681 (=> (not res!854850) (not e!735078))))

(declare-fun lt!577566 () ListLongMap!19669)

(assert (=> d!140681 (= res!854850 (contains!7896 lt!577566 (_1!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!577563 () List!29187)

(assert (=> d!140681 (= lt!577566 (ListLongMap!19670 lt!577563))))

(declare-fun lt!577564 () Unit!42400)

(declare-fun lt!577565 () Unit!42400)

(assert (=> d!140681 (= lt!577564 lt!577565)))

(declare-datatypes ((Option!748 0))(
  ( (Some!747 (v!19716 V!50537)) (None!746) )
))
(declare-fun getValueByKey!697 (List!29187 (_ BitVec 64)) Option!748)

(assert (=> d!140681 (= (getValueByKey!697 lt!577563 (_1!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!747 (_2!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!343 (List!29187 (_ BitVec 64) V!50537) Unit!42400)

(assert (=> d!140681 (= lt!577565 (lemmaContainsTupThenGetReturnValue!343 lt!577563 (_1!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!472 (List!29187 (_ BitVec 64) V!50537) List!29187)

(assert (=> d!140681 (= lt!577563 (insertStrictlySorted!472 (toList!9850 lt!577459) (_1!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!140681 (= (+!4363 lt!577459 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!577566)))

(declare-fun b!1287111 () Bool)

(declare-fun res!854849 () Bool)

(assert (=> b!1287111 (=> (not res!854849) (not e!735078))))

(assert (=> b!1287111 (= res!854849 (= (getValueByKey!697 (toList!9850 lt!577566) (_1!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!747 (_2!11017 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1287112 () Bool)

(declare-fun contains!7900 (List!29187 tuple2!22012) Bool)

(assert (=> b!1287112 (= e!735078 (contains!7900 (toList!9850 lt!577566) (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!140681 res!854850) b!1287111))

(assert (= (and b!1287111 res!854849) b!1287112))

(declare-fun m!1179587 () Bool)

(assert (=> d!140681 m!1179587))

(declare-fun m!1179589 () Bool)

(assert (=> d!140681 m!1179589))

(declare-fun m!1179591 () Bool)

(assert (=> d!140681 m!1179591))

(declare-fun m!1179593 () Bool)

(assert (=> d!140681 m!1179593))

(declare-fun m!1179595 () Bool)

(assert (=> b!1287111 m!1179595))

(declare-fun m!1179597 () Bool)

(assert (=> b!1287112 m!1179597))

(assert (=> b!1286944 d!140681))

(declare-fun d!140683 () Bool)

(assert (=> d!140683 (contains!7896 lt!577459 k0!1205)))

(declare-fun lt!577569 () Unit!42400)

(declare-fun choose!1908 ((_ BitVec 64) (_ BitVec 64) V!50537 ListLongMap!19669) Unit!42400)

(assert (=> d!140683 (= lt!577569 (choose!1908 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577459))))

(assert (=> d!140683 (contains!7896 (+!4363 lt!577459 (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!140683 (= (lemmaInListMapAfterAddingDiffThenInBefore!41 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577459) lt!577569)))

(declare-fun bs!36628 () Bool)

(assert (= bs!36628 d!140683))

(assert (=> bs!36628 m!1179467))

(declare-fun m!1179599 () Bool)

(assert (=> bs!36628 m!1179599))

(assert (=> bs!36628 m!1179463))

(assert (=> bs!36628 m!1179463))

(declare-fun m!1179601 () Bool)

(assert (=> bs!36628 m!1179601))

(assert (=> b!1286944 d!140683))

(declare-fun d!140685 () Bool)

(declare-fun e!735084 () Bool)

(assert (=> d!140685 e!735084))

(declare-fun res!854853 () Bool)

(assert (=> d!140685 (=> res!854853 e!735084)))

(declare-fun lt!577580 () Bool)

(assert (=> d!140685 (= res!854853 (not lt!577580))))

(declare-fun lt!577578 () Bool)

(assert (=> d!140685 (= lt!577580 lt!577578)))

(declare-fun lt!577581 () Unit!42400)

(declare-fun e!735083 () Unit!42400)

(assert (=> d!140685 (= lt!577581 e!735083)))

(declare-fun c!124293 () Bool)

(assert (=> d!140685 (= c!124293 lt!577578)))

(declare-fun containsKey!714 (List!29187 (_ BitVec 64)) Bool)

(assert (=> d!140685 (= lt!577578 (containsKey!714 (toList!9850 lt!577459) k0!1205))))

(assert (=> d!140685 (= (contains!7896 lt!577459 k0!1205) lt!577580)))

(declare-fun b!1287119 () Bool)

(declare-fun lt!577579 () Unit!42400)

(assert (=> b!1287119 (= e!735083 lt!577579)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!461 (List!29187 (_ BitVec 64)) Unit!42400)

(assert (=> b!1287119 (= lt!577579 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9850 lt!577459) k0!1205))))

(declare-fun isDefined!504 (Option!748) Bool)

(assert (=> b!1287119 (isDefined!504 (getValueByKey!697 (toList!9850 lt!577459) k0!1205))))

(declare-fun b!1287120 () Bool)

(declare-fun Unit!42409 () Unit!42400)

(assert (=> b!1287120 (= e!735083 Unit!42409)))

(declare-fun b!1287121 () Bool)

(assert (=> b!1287121 (= e!735084 (isDefined!504 (getValueByKey!697 (toList!9850 lt!577459) k0!1205)))))

(assert (= (and d!140685 c!124293) b!1287119))

(assert (= (and d!140685 (not c!124293)) b!1287120))

(assert (= (and d!140685 (not res!854853)) b!1287121))

(declare-fun m!1179603 () Bool)

(assert (=> d!140685 m!1179603))

(declare-fun m!1179605 () Bool)

(assert (=> b!1287119 m!1179605))

(declare-fun m!1179607 () Bool)

(assert (=> b!1287119 m!1179607))

(assert (=> b!1287119 m!1179607))

(declare-fun m!1179609 () Bool)

(assert (=> b!1287119 m!1179609))

(assert (=> b!1287121 m!1179607))

(assert (=> b!1287121 m!1179607))

(assert (=> b!1287121 m!1179609))

(assert (=> b!1286944 d!140685))

(declare-fun d!140687 () Bool)

(assert (=> d!140687 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108922 d!140687))

(declare-fun d!140689 () Bool)

(assert (=> d!140689 (= (array_inv!31283 _values!1445) (bvsge (size!41599 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108922 d!140689))

(declare-fun d!140691 () Bool)

(assert (=> d!140691 (= (array_inv!31284 _keys!1741) (bvsge (size!41600 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108922 d!140691))

(declare-fun d!140693 () Bool)

(declare-fun e!735086 () Bool)

(assert (=> d!140693 e!735086))

(declare-fun res!854854 () Bool)

(assert (=> d!140693 (=> res!854854 e!735086)))

(declare-fun lt!577584 () Bool)

(assert (=> d!140693 (= res!854854 (not lt!577584))))

(declare-fun lt!577582 () Bool)

(assert (=> d!140693 (= lt!577584 lt!577582)))

(declare-fun lt!577585 () Unit!42400)

(declare-fun e!735085 () Unit!42400)

(assert (=> d!140693 (= lt!577585 e!735085)))

(declare-fun c!124294 () Bool)

(assert (=> d!140693 (= c!124294 lt!577582)))

(assert (=> d!140693 (= lt!577582 (containsKey!714 (toList!9850 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))) k0!1205))))

(assert (=> d!140693 (= (contains!7896 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462)) k0!1205) lt!577584)))

(declare-fun b!1287122 () Bool)

(declare-fun lt!577583 () Unit!42400)

(assert (=> b!1287122 (= e!735085 lt!577583)))

(assert (=> b!1287122 (= lt!577583 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9850 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))) k0!1205))))

(assert (=> b!1287122 (isDefined!504 (getValueByKey!697 (toList!9850 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))) k0!1205))))

(declare-fun b!1287123 () Bool)

(declare-fun Unit!42410 () Unit!42400)

(assert (=> b!1287123 (= e!735085 Unit!42410)))

(declare-fun b!1287124 () Bool)

(assert (=> b!1287124 (= e!735086 (isDefined!504 (getValueByKey!697 (toList!9850 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))) k0!1205)))))

(assert (= (and d!140693 c!124294) b!1287122))

(assert (= (and d!140693 (not c!124294)) b!1287123))

(assert (= (and d!140693 (not res!854854)) b!1287124))

(declare-fun m!1179611 () Bool)

(assert (=> d!140693 m!1179611))

(declare-fun m!1179613 () Bool)

(assert (=> b!1287122 m!1179613))

(declare-fun m!1179615 () Bool)

(assert (=> b!1287122 m!1179615))

(assert (=> b!1287122 m!1179615))

(declare-fun m!1179617 () Bool)

(assert (=> b!1287122 m!1179617))

(assert (=> b!1287124 m!1179615))

(assert (=> b!1287124 m!1179615))

(assert (=> b!1287124 m!1179617))

(assert (=> bm!63097 d!140693))

(declare-fun d!140695 () Bool)

(declare-fun e!735088 () Bool)

(assert (=> d!140695 e!735088))

(declare-fun res!854855 () Bool)

(assert (=> d!140695 (=> res!854855 e!735088)))

(declare-fun lt!577588 () Bool)

(assert (=> d!140695 (= res!854855 (not lt!577588))))

(declare-fun lt!577586 () Bool)

(assert (=> d!140695 (= lt!577588 lt!577586)))

(declare-fun lt!577589 () Unit!42400)

(declare-fun e!735087 () Unit!42400)

(assert (=> d!140695 (= lt!577589 e!735087)))

(declare-fun c!124295 () Bool)

(assert (=> d!140695 (= c!124295 lt!577586)))

(assert (=> d!140695 (= lt!577586 (containsKey!714 (toList!9850 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140695 (= (contains!7896 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!577588)))

(declare-fun b!1287125 () Bool)

(declare-fun lt!577587 () Unit!42400)

(assert (=> b!1287125 (= e!735087 lt!577587)))

(assert (=> b!1287125 (= lt!577587 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9850 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1287125 (isDefined!504 (getValueByKey!697 (toList!9850 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1287126 () Bool)

(declare-fun Unit!42411 () Unit!42400)

(assert (=> b!1287126 (= e!735087 Unit!42411)))

(declare-fun b!1287127 () Bool)

(assert (=> b!1287127 (= e!735088 (isDefined!504 (getValueByKey!697 (toList!9850 (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140695 c!124295) b!1287125))

(assert (= (and d!140695 (not c!124295)) b!1287126))

(assert (= (and d!140695 (not res!854855)) b!1287127))

(declare-fun m!1179619 () Bool)

(assert (=> d!140695 m!1179619))

(declare-fun m!1179621 () Bool)

(assert (=> b!1287125 m!1179621))

(declare-fun m!1179623 () Bool)

(assert (=> b!1287125 m!1179623))

(assert (=> b!1287125 m!1179623))

(declare-fun m!1179625 () Bool)

(assert (=> b!1287125 m!1179625))

(assert (=> b!1287127 m!1179623))

(assert (=> b!1287127 m!1179623))

(assert (=> b!1287127 m!1179625))

(assert (=> b!1286950 d!140695))

(declare-fun b!1287170 () Bool)

(declare-fun res!854877 () Bool)

(declare-fun e!735123 () Bool)

(assert (=> b!1287170 (=> (not res!854877) (not e!735123))))

(declare-fun e!735120 () Bool)

(assert (=> b!1287170 (= res!854877 e!735120)))

(declare-fun res!854881 () Bool)

(assert (=> b!1287170 (=> res!854881 e!735120)))

(declare-fun e!735117 () Bool)

(assert (=> b!1287170 (= res!854881 (not e!735117))))

(declare-fun res!854875 () Bool)

(assert (=> b!1287170 (=> (not res!854875) (not e!735117))))

(assert (=> b!1287170 (= res!854875 (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun b!1287171 () Bool)

(declare-fun e!735118 () Unit!42400)

(declare-fun lt!577642 () Unit!42400)

(assert (=> b!1287171 (= e!735118 lt!577642)))

(declare-fun lt!577653 () ListLongMap!19669)

(assert (=> b!1287171 (= lt!577653 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577643 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577636 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577636 (select (arr!41048 _keys!1741) from!2144))))

(declare-fun lt!577647 () Unit!42400)

(declare-fun addStillContains!1099 (ListLongMap!19669 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42400)

(assert (=> b!1287171 (= lt!577647 (addStillContains!1099 lt!577653 lt!577643 zeroValue!1387 lt!577636))))

(assert (=> b!1287171 (contains!7896 (+!4363 lt!577653 (tuple2!22013 lt!577643 zeroValue!1387)) lt!577636)))

(declare-fun lt!577635 () Unit!42400)

(assert (=> b!1287171 (= lt!577635 lt!577647)))

(declare-fun lt!577641 () ListLongMap!19669)

(assert (=> b!1287171 (= lt!577641 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577646 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577646 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577639 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577639 (select (arr!41048 _keys!1741) from!2144))))

(declare-fun lt!577645 () Unit!42400)

(declare-fun addApplyDifferent!542 (ListLongMap!19669 (_ BitVec 64) V!50537 (_ BitVec 64)) Unit!42400)

(assert (=> b!1287171 (= lt!577645 (addApplyDifferent!542 lt!577641 lt!577646 minValue!1387 lt!577639))))

(assert (=> b!1287171 (= (apply!1004 (+!4363 lt!577641 (tuple2!22013 lt!577646 minValue!1387)) lt!577639) (apply!1004 lt!577641 lt!577639))))

(declare-fun lt!577654 () Unit!42400)

(assert (=> b!1287171 (= lt!577654 lt!577645)))

(declare-fun lt!577649 () ListLongMap!19669)

(assert (=> b!1287171 (= lt!577649 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577637 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577651 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577651 (select (arr!41048 _keys!1741) from!2144))))

(declare-fun lt!577652 () Unit!42400)

(assert (=> b!1287171 (= lt!577652 (addApplyDifferent!542 lt!577649 lt!577637 zeroValue!1387 lt!577651))))

(assert (=> b!1287171 (= (apply!1004 (+!4363 lt!577649 (tuple2!22013 lt!577637 zeroValue!1387)) lt!577651) (apply!1004 lt!577649 lt!577651))))

(declare-fun lt!577650 () Unit!42400)

(assert (=> b!1287171 (= lt!577650 lt!577652)))

(declare-fun lt!577640 () ListLongMap!19669)

(assert (=> b!1287171 (= lt!577640 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!577644 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577644 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!577655 () (_ BitVec 64))

(assert (=> b!1287171 (= lt!577655 (select (arr!41048 _keys!1741) from!2144))))

(assert (=> b!1287171 (= lt!577642 (addApplyDifferent!542 lt!577640 lt!577644 minValue!1387 lt!577655))))

(assert (=> b!1287171 (= (apply!1004 (+!4363 lt!577640 (tuple2!22013 lt!577644 minValue!1387)) lt!577655) (apply!1004 lt!577640 lt!577655))))

(declare-fun b!1287172 () Bool)

(declare-fun e!735126 () Bool)

(declare-fun lt!577648 () ListLongMap!19669)

(assert (=> b!1287172 (= e!735126 (= (apply!1004 lt!577648 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1287173 () Bool)

(declare-fun e!735119 () Bool)

(declare-fun e!735125 () Bool)

(assert (=> b!1287173 (= e!735119 e!735125)))

(declare-fun res!854878 () Bool)

(declare-fun call!63163 () Bool)

(assert (=> b!1287173 (= res!854878 call!63163)))

(assert (=> b!1287173 (=> (not res!854878) (not e!735125))))

(declare-fun b!1287174 () Bool)

(declare-fun e!735121 () ListLongMap!19669)

(declare-fun e!735116 () ListLongMap!19669)

(assert (=> b!1287174 (= e!735121 e!735116)))

(declare-fun c!124313 () Bool)

(assert (=> b!1287174 (= c!124313 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63154 () Bool)

(declare-fun call!63159 () ListLongMap!19669)

(declare-fun call!63157 () ListLongMap!19669)

(assert (=> bm!63154 (= call!63159 call!63157)))

(declare-fun bm!63155 () Bool)

(declare-fun call!63161 () ListLongMap!19669)

(assert (=> bm!63155 (= call!63161 call!63159)))

(declare-fun b!1287176 () Bool)

(assert (=> b!1287176 (= e!735117 (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)))))

(declare-fun b!1287177 () Bool)

(declare-fun e!735115 () ListLongMap!19669)

(assert (=> b!1287177 (= e!735115 call!63161)))

(declare-fun b!1287178 () Bool)

(assert (=> b!1287178 (= e!735125 (= (apply!1004 lt!577648 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1287179 () Bool)

(declare-fun e!735124 () Bool)

(assert (=> b!1287179 (= e!735124 (= (apply!1004 lt!577648 (select (arr!41048 _keys!1741) from!2144)) (get!20868 (select (arr!41047 _values!1445) from!2144) (dynLambda!3439 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1287179 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41599 _values!1445)))))

(assert (=> b!1287179 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun b!1287180 () Bool)

(declare-fun call!63160 () ListLongMap!19669)

(assert (=> b!1287180 (= e!735121 (+!4363 call!63160 (tuple2!22013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1287181 () Bool)

(assert (=> b!1287181 (= e!735123 e!735119)))

(declare-fun c!124310 () Bool)

(assert (=> b!1287181 (= c!124310 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287182 () Bool)

(declare-fun Unit!42412 () Unit!42400)

(assert (=> b!1287182 (= e!735118 Unit!42412)))

(declare-fun b!1287183 () Bool)

(assert (=> b!1287183 (= e!735120 e!735124)))

(declare-fun res!854879 () Bool)

(assert (=> b!1287183 (=> (not res!854879) (not e!735124))))

(assert (=> b!1287183 (= res!854879 (contains!7896 lt!577648 (select (arr!41048 _keys!1741) from!2144)))))

(assert (=> b!1287183 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741)))))

(declare-fun b!1287184 () Bool)

(declare-fun res!854874 () Bool)

(assert (=> b!1287184 (=> (not res!854874) (not e!735123))))

(declare-fun e!735127 () Bool)

(assert (=> b!1287184 (= res!854874 e!735127)))

(declare-fun c!124309 () Bool)

(assert (=> b!1287184 (= c!124309 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!63156 () Bool)

(assert (=> bm!63156 (= call!63157 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1287185 () Bool)

(declare-fun call!63162 () ListLongMap!19669)

(assert (=> b!1287185 (= e!735116 call!63162)))

(declare-fun b!1287175 () Bool)

(assert (=> b!1287175 (= e!735115 call!63162)))

(declare-fun d!140697 () Bool)

(assert (=> d!140697 e!735123))

(declare-fun res!854882 () Bool)

(assert (=> d!140697 (=> (not res!854882) (not e!735123))))

(assert (=> d!140697 (= res!854882 (or (bvsge from!2144 (size!41600 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41600 _keys!1741)))))))

(declare-fun lt!577634 () ListLongMap!19669)

(assert (=> d!140697 (= lt!577648 lt!577634)))

(declare-fun lt!577638 () Unit!42400)

(assert (=> d!140697 (= lt!577638 e!735118)))

(declare-fun c!124312 () Bool)

(declare-fun e!735122 () Bool)

(assert (=> d!140697 (= c!124312 e!735122)))

(declare-fun res!854880 () Bool)

(assert (=> d!140697 (=> (not res!854880) (not e!735122))))

(assert (=> d!140697 (= res!854880 (bvslt from!2144 (size!41600 _keys!1741)))))

(assert (=> d!140697 (= lt!577634 e!735121)))

(declare-fun c!124311 () Bool)

(assert (=> d!140697 (= c!124311 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140697 (validMask!0 mask!2175)))

(assert (=> d!140697 (= (getCurrentListMap!4814 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!577648)))

(declare-fun b!1287186 () Bool)

(assert (=> b!1287186 (= e!735119 (not call!63163))))

(declare-fun bm!63157 () Bool)

(assert (=> bm!63157 (= call!63162 call!63160)))

(declare-fun bm!63158 () Bool)

(assert (=> bm!63158 (= call!63160 (+!4363 (ite c!124311 call!63157 (ite c!124313 call!63159 call!63161)) (ite (or c!124311 c!124313) (tuple2!22013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1287187 () Bool)

(assert (=> b!1287187 (= e!735127 e!735126)))

(declare-fun res!854876 () Bool)

(declare-fun call!63158 () Bool)

(assert (=> b!1287187 (= res!854876 call!63158)))

(assert (=> b!1287187 (=> (not res!854876) (not e!735126))))

(declare-fun bm!63159 () Bool)

(assert (=> bm!63159 (= call!63163 (contains!7896 lt!577648 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1287188 () Bool)

(assert (=> b!1287188 (= e!735127 (not call!63158))))

(declare-fun b!1287189 () Bool)

(declare-fun c!124308 () Bool)

(assert (=> b!1287189 (= c!124308 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1287189 (= e!735116 e!735115)))

(declare-fun b!1287190 () Bool)

(assert (=> b!1287190 (= e!735122 (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)))))

(declare-fun bm!63160 () Bool)

(assert (=> bm!63160 (= call!63158 (contains!7896 lt!577648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140697 c!124311) b!1287180))

(assert (= (and d!140697 (not c!124311)) b!1287174))

(assert (= (and b!1287174 c!124313) b!1287185))

(assert (= (and b!1287174 (not c!124313)) b!1287189))

(assert (= (and b!1287189 c!124308) b!1287175))

(assert (= (and b!1287189 (not c!124308)) b!1287177))

(assert (= (or b!1287175 b!1287177) bm!63155))

(assert (= (or b!1287185 bm!63155) bm!63154))

(assert (= (or b!1287185 b!1287175) bm!63157))

(assert (= (or b!1287180 bm!63154) bm!63156))

(assert (= (or b!1287180 bm!63157) bm!63158))

(assert (= (and d!140697 res!854880) b!1287190))

(assert (= (and d!140697 c!124312) b!1287171))

(assert (= (and d!140697 (not c!124312)) b!1287182))

(assert (= (and d!140697 res!854882) b!1287170))

(assert (= (and b!1287170 res!854875) b!1287176))

(assert (= (and b!1287170 (not res!854881)) b!1287183))

(assert (= (and b!1287183 res!854879) b!1287179))

(assert (= (and b!1287170 res!854877) b!1287184))

(assert (= (and b!1287184 c!124309) b!1287187))

(assert (= (and b!1287184 (not c!124309)) b!1287188))

(assert (= (and b!1287187 res!854876) b!1287172))

(assert (= (or b!1287187 b!1287188) bm!63160))

(assert (= (and b!1287184 res!854874) b!1287181))

(assert (= (and b!1287181 c!124310) b!1287173))

(assert (= (and b!1287181 (not c!124310)) b!1287186))

(assert (= (and b!1287173 res!854878) b!1287178))

(assert (= (or b!1287173 b!1287186) bm!63159))

(declare-fun b_lambda!23119 () Bool)

(assert (=> (not b_lambda!23119) (not b!1287179)))

(assert (=> b!1287179 t!42747))

(declare-fun b_and!46511 () Bool)

(assert (= b_and!46509 (and (=> t!42747 result!23725) b_and!46511)))

(assert (=> b!1287183 m!1179457))

(assert (=> b!1287183 m!1179457))

(declare-fun m!1179627 () Bool)

(assert (=> b!1287183 m!1179627))

(assert (=> b!1287179 m!1179557))

(assert (=> b!1287179 m!1179457))

(assert (=> b!1287179 m!1179559))

(assert (=> b!1287179 m!1179457))

(declare-fun m!1179629 () Bool)

(assert (=> b!1287179 m!1179629))

(assert (=> b!1287179 m!1179557))

(assert (=> b!1287179 m!1179559))

(assert (=> b!1287179 m!1179561))

(assert (=> d!140697 m!1179473))

(assert (=> bm!63156 m!1179471))

(assert (=> b!1287176 m!1179457))

(assert (=> b!1287176 m!1179457))

(assert (=> b!1287176 m!1179469))

(declare-fun m!1179631 () Bool)

(assert (=> b!1287178 m!1179631))

(declare-fun m!1179633 () Bool)

(assert (=> b!1287171 m!1179633))

(assert (=> b!1287171 m!1179457))

(declare-fun m!1179635 () Bool)

(assert (=> b!1287171 m!1179635))

(declare-fun m!1179637 () Bool)

(assert (=> b!1287171 m!1179637))

(declare-fun m!1179639 () Bool)

(assert (=> b!1287171 m!1179639))

(declare-fun m!1179641 () Bool)

(assert (=> b!1287171 m!1179641))

(assert (=> b!1287171 m!1179639))

(declare-fun m!1179643 () Bool)

(assert (=> b!1287171 m!1179643))

(declare-fun m!1179645 () Bool)

(assert (=> b!1287171 m!1179645))

(assert (=> b!1287171 m!1179471))

(declare-fun m!1179647 () Bool)

(assert (=> b!1287171 m!1179647))

(declare-fun m!1179649 () Bool)

(assert (=> b!1287171 m!1179649))

(declare-fun m!1179651 () Bool)

(assert (=> b!1287171 m!1179651))

(declare-fun m!1179653 () Bool)

(assert (=> b!1287171 m!1179653))

(declare-fun m!1179655 () Bool)

(assert (=> b!1287171 m!1179655))

(assert (=> b!1287171 m!1179643))

(declare-fun m!1179657 () Bool)

(assert (=> b!1287171 m!1179657))

(assert (=> b!1287171 m!1179653))

(declare-fun m!1179659 () Bool)

(assert (=> b!1287171 m!1179659))

(assert (=> b!1287171 m!1179651))

(declare-fun m!1179661 () Bool)

(assert (=> b!1287171 m!1179661))

(declare-fun m!1179663 () Bool)

(assert (=> b!1287180 m!1179663))

(declare-fun m!1179665 () Bool)

(assert (=> bm!63158 m!1179665))

(declare-fun m!1179667 () Bool)

(assert (=> bm!63159 m!1179667))

(declare-fun m!1179669 () Bool)

(assert (=> b!1287172 m!1179669))

(assert (=> b!1287190 m!1179457))

(assert (=> b!1287190 m!1179457))

(assert (=> b!1287190 m!1179469))

(declare-fun m!1179671 () Bool)

(assert (=> bm!63160 m!1179671))

(assert (=> b!1286950 d!140697))

(declare-fun d!140699 () Bool)

(declare-fun res!854888 () Bool)

(declare-fun e!735136 () Bool)

(assert (=> d!140699 (=> res!854888 e!735136)))

(assert (=> d!140699 (= res!854888 (bvsge #b00000000000000000000000000000000 (size!41600 _keys!1741)))))

(assert (=> d!140699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!735136)))

(declare-fun b!1287199 () Bool)

(declare-fun e!735135 () Bool)

(assert (=> b!1287199 (= e!735136 e!735135)))

(declare-fun c!124316 () Bool)

(assert (=> b!1287199 (= c!124316 (validKeyInArray!0 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1287200 () Bool)

(declare-fun call!63166 () Bool)

(assert (=> b!1287200 (= e!735135 call!63166)))

(declare-fun bm!63163 () Bool)

(assert (=> bm!63163 (= call!63166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1287201 () Bool)

(declare-fun e!735134 () Bool)

(assert (=> b!1287201 (= e!735135 e!735134)))

(declare-fun lt!577664 () (_ BitVec 64))

(assert (=> b!1287201 (= lt!577664 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!577663 () Unit!42400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!85091 (_ BitVec 64) (_ BitVec 32)) Unit!42400)

(assert (=> b!1287201 (= lt!577663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!577664 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!85091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1287201 (arrayContainsKey!0 _keys!1741 lt!577664 #b00000000000000000000000000000000)))

(declare-fun lt!577662 () Unit!42400)

(assert (=> b!1287201 (= lt!577662 lt!577663)))

(declare-fun res!854887 () Bool)

(declare-datatypes ((SeekEntryResult!10013 0))(
  ( (MissingZero!10013 (index!42423 (_ BitVec 32))) (Found!10013 (index!42424 (_ BitVec 32))) (Intermediate!10013 (undefined!10825 Bool) (index!42425 (_ BitVec 32)) (x!114187 (_ BitVec 32))) (Undefined!10013) (MissingVacant!10013 (index!42426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!85091 (_ BitVec 32)) SeekEntryResult!10013)

(assert (=> b!1287201 (= res!854887 (= (seekEntryOrOpen!0 (select (arr!41048 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10013 #b00000000000000000000000000000000)))))

(assert (=> b!1287201 (=> (not res!854887) (not e!735134))))

(declare-fun b!1287202 () Bool)

(assert (=> b!1287202 (= e!735134 call!63166)))

(assert (= (and d!140699 (not res!854888)) b!1287199))

(assert (= (and b!1287199 c!124316) b!1287201))

(assert (= (and b!1287199 (not c!124316)) b!1287200))

(assert (= (and b!1287201 res!854887) b!1287202))

(assert (= (or b!1287202 b!1287200) bm!63163))

(assert (=> b!1287199 m!1179579))

(assert (=> b!1287199 m!1179579))

(assert (=> b!1287199 m!1179585))

(declare-fun m!1179673 () Bool)

(assert (=> bm!63163 m!1179673))

(assert (=> b!1287201 m!1179579))

(declare-fun m!1179675 () Bool)

(assert (=> b!1287201 m!1179675))

(declare-fun m!1179677 () Bool)

(assert (=> b!1287201 m!1179677))

(assert (=> b!1287201 m!1179579))

(declare-fun m!1179679 () Bool)

(assert (=> b!1287201 m!1179679))

(assert (=> b!1286942 d!140699))

(declare-fun d!140701 () Bool)

(assert (=> d!140701 (contains!7896 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462)) k0!1205)))

(declare-fun lt!577665 () Unit!42400)

(assert (=> d!140701 (= lt!577665 (choose!1908 k0!1205 (ite c!124255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124257 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124255 minValue!1387 (ite c!124257 zeroValue!1387 minValue!1387)) (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))))))

(assert (=> d!140701 (contains!7896 (+!4363 (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462)) (tuple2!22013 (ite c!124255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124257 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124255 minValue!1387 (ite c!124257 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!140701 (= (lemmaInListMapAfterAddingDiffThenInBefore!41 k0!1205 (ite c!124255 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124257 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124255 minValue!1387 (ite c!124257 zeroValue!1387 minValue!1387)) (ite c!124255 lt!577464 (ite c!124257 lt!577463 lt!577462))) lt!577665)))

(declare-fun bs!36629 () Bool)

(assert (= bs!36629 d!140701))

(assert (=> bs!36629 m!1179447))

(declare-fun m!1179681 () Bool)

(assert (=> bs!36629 m!1179681))

(declare-fun m!1179683 () Bool)

(assert (=> bs!36629 m!1179683))

(assert (=> bs!36629 m!1179683))

(declare-fun m!1179685 () Bool)

(assert (=> bs!36629 m!1179685))

(assert (=> bm!63096 d!140701))

(declare-fun d!140703 () Bool)

(declare-fun e!735138 () Bool)

(assert (=> d!140703 e!735138))

(declare-fun res!854889 () Bool)

(assert (=> d!140703 (=> res!854889 e!735138)))

(declare-fun lt!577668 () Bool)

(assert (=> d!140703 (= res!854889 (not lt!577668))))

(declare-fun lt!577666 () Bool)

(assert (=> d!140703 (= lt!577668 lt!577666)))

(declare-fun lt!577669 () Unit!42400)

(declare-fun e!735137 () Unit!42400)

(assert (=> d!140703 (= lt!577669 e!735137)))

(declare-fun c!124317 () Bool)

(assert (=> d!140703 (= c!124317 lt!577666)))

(assert (=> d!140703 (= lt!577666 (containsKey!714 (toList!9850 (ListLongMap!19670 Nil!29184)) k0!1205))))

(assert (=> d!140703 (= (contains!7896 (ListLongMap!19670 Nil!29184) k0!1205) lt!577668)))

(declare-fun b!1287203 () Bool)

(declare-fun lt!577667 () Unit!42400)

(assert (=> b!1287203 (= e!735137 lt!577667)))

(assert (=> b!1287203 (= lt!577667 (lemmaContainsKeyImpliesGetValueByKeyDefined!461 (toList!9850 (ListLongMap!19670 Nil!29184)) k0!1205))))

(assert (=> b!1287203 (isDefined!504 (getValueByKey!697 (toList!9850 (ListLongMap!19670 Nil!29184)) k0!1205))))

(declare-fun b!1287204 () Bool)

(declare-fun Unit!42413 () Unit!42400)

(assert (=> b!1287204 (= e!735137 Unit!42413)))

(declare-fun b!1287205 () Bool)

(assert (=> b!1287205 (= e!735138 (isDefined!504 (getValueByKey!697 (toList!9850 (ListLongMap!19670 Nil!29184)) k0!1205)))))

(assert (= (and d!140703 c!124317) b!1287203))

(assert (= (and d!140703 (not c!124317)) b!1287204))

(assert (= (and d!140703 (not res!854889)) b!1287205))

(declare-fun m!1179687 () Bool)

(assert (=> d!140703 m!1179687))

(declare-fun m!1179689 () Bool)

(assert (=> b!1287203 m!1179689))

(declare-fun m!1179691 () Bool)

(assert (=> b!1287203 m!1179691))

(assert (=> b!1287203 m!1179691))

(declare-fun m!1179693 () Bool)

(assert (=> b!1287203 m!1179693))

(assert (=> b!1287205 m!1179691))

(assert (=> b!1287205 m!1179691))

(assert (=> b!1287205 m!1179693))

(assert (=> b!1286946 d!140703))

(declare-fun d!140705 () Bool)

(assert (=> d!140705 (not (contains!7896 (ListLongMap!19670 Nil!29184) k0!1205))))

(declare-fun lt!577672 () Unit!42400)

(declare-fun choose!1909 ((_ BitVec 64)) Unit!42400)

(assert (=> d!140705 (= lt!577672 (choose!1909 k0!1205))))

(assert (=> d!140705 (= (emptyContainsNothing!11 k0!1205) lt!577672)))

(declare-fun bs!36630 () Bool)

(assert (= bs!36630 d!140705))

(assert (=> bs!36630 m!1179459))

(declare-fun m!1179695 () Bool)

(assert (=> bs!36630 m!1179695))

(assert (=> b!1286946 d!140705))

(declare-fun d!140707 () Bool)

(assert (=> d!140707 (= (validKeyInArray!0 (select (arr!41048 _keys!1741) from!2144)) (and (not (= (select (arr!41048 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41048 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1286951 d!140707))

(declare-fun mapIsEmpty!52679 () Bool)

(declare-fun mapRes!52679 () Bool)

(assert (=> mapIsEmpty!52679 mapRes!52679))

(declare-fun condMapEmpty!52679 () Bool)

(declare-fun mapDefault!52679 () ValueCell!16139)

(assert (=> mapNonEmpty!52670 (= condMapEmpty!52679 (= mapRest!52670 ((as const (Array (_ BitVec 32) ValueCell!16139)) mapDefault!52679)))))

(declare-fun e!735143 () Bool)

(assert (=> mapNonEmpty!52670 (= tp!100421 (and e!735143 mapRes!52679))))

(declare-fun b!1287212 () Bool)

(declare-fun e!735144 () Bool)

(assert (=> b!1287212 (= e!735144 tp_is_empty!34075)))

(declare-fun mapNonEmpty!52679 () Bool)

(declare-fun tp!100437 () Bool)

(assert (=> mapNonEmpty!52679 (= mapRes!52679 (and tp!100437 e!735144))))

(declare-fun mapValue!52679 () ValueCell!16139)

(declare-fun mapKey!52679 () (_ BitVec 32))

(declare-fun mapRest!52679 () (Array (_ BitVec 32) ValueCell!16139))

(assert (=> mapNonEmpty!52679 (= mapRest!52670 (store mapRest!52679 mapKey!52679 mapValue!52679))))

(declare-fun b!1287213 () Bool)

(assert (=> b!1287213 (= e!735143 tp_is_empty!34075)))

(assert (= (and mapNonEmpty!52670 condMapEmpty!52679) mapIsEmpty!52679))

(assert (= (and mapNonEmpty!52670 (not condMapEmpty!52679)) mapNonEmpty!52679))

(assert (= (and mapNonEmpty!52679 ((_ is ValueCellFull!16139) mapValue!52679)) b!1287212))

(assert (= (and mapNonEmpty!52670 ((_ is ValueCellFull!16139) mapDefault!52679)) b!1287213))

(declare-fun m!1179697 () Bool)

(assert (=> mapNonEmpty!52679 m!1179697))

(declare-fun b_lambda!23121 () Bool)

(assert (= b_lambda!23119 (or (and start!108922 b_free!28435) b_lambda!23121)))

(declare-fun b_lambda!23123 () Bool)

(assert (= b_lambda!23115 (or (and start!108922 b_free!28435) b_lambda!23123)))

(declare-fun b_lambda!23125 () Bool)

(assert (= b_lambda!23117 (or (and start!108922 b_free!28435) b_lambda!23125)))

(check-sat (not b!1287106) (not b!1287127) (not b!1287102) (not bm!63156) (not d!140677) (not b!1287119) (not d!140703) (not bm!63158) (not b!1287180) (not d!140695) (not b!1287125) (not bm!63139) (not d!140685) b_and!46511 (not d!140693) (not b!1287203) (not b!1287122) (not d!140701) (not bm!63163) (not b!1287103) (not b_lambda!23123) (not b!1287178) (not b!1287085) (not bm!63159) (not b_next!28435) (not d!140705) (not b!1287082) tp_is_empty!34075 (not bm!63136) (not b!1287089) (not b!1287201) (not b!1287183) (not b!1287087) (not b!1287086) (not d!140681) (not b!1287172) (not b!1287176) (not b!1287171) (not b!1287179) (not b!1287190) (not b_lambda!23125) (not bm!63160) (not mapNonEmpty!52679) (not b!1287084) (not d!140697) (not b!1287121) (not b!1287199) (not b!1287111) (not b!1287088) (not b!1287112) (not d!140683) (not b!1287124) (not b_lambda!23121) (not b!1287083) (not b!1287205))
(check-sat b_and!46511 (not b_next!28435))
