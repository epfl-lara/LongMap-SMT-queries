; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108920 () Bool)

(assert start!108920)

(declare-fun b_free!28433 () Bool)

(declare-fun b_next!28433 () Bool)

(assert (=> start!108920 (= b_free!28433 (not b_next!28433))))

(declare-fun tp!100414 () Bool)

(declare-fun b_and!46517 () Bool)

(assert (=> start!108920 (= tp!100414 b_and!46517)))

(declare-fun bm!63093 () Bool)

(declare-fun c!124262 () Bool)

(declare-fun c!124263 () Bool)

(declare-datatypes ((V!50533 0))(
  ( (V!50534 (val!17111 Int)) )
))
(declare-datatypes ((tuple2!21946 0))(
  ( (tuple2!21947 (_1!10984 (_ BitVec 64)) (_2!10984 V!50533)) )
))
(declare-datatypes ((List!29130 0))(
  ( (Nil!29127) (Cons!29126 (h!30335 tuple2!21946) (t!42692 List!29130)) )
))
(declare-datatypes ((ListLongMap!19603 0))(
  ( (ListLongMap!19604 (toList!9817 List!29130)) )
))
(declare-fun lt!577607 () ListLongMap!19603)

(declare-fun lt!577605 () ListLongMap!19603)

(declare-fun lt!577604 () ListLongMap!19603)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun call!63097 () Bool)

(declare-fun contains!7933 (ListLongMap!19603 (_ BitVec 64)) Bool)

(assert (=> bm!63093 (= call!63097 (contains!7933 (ite c!124263 lt!577605 (ite c!124262 lt!577604 lt!577607)) k!1205))))

(declare-fun b!1286948 () Bool)

(declare-datatypes ((Unit!42554 0))(
  ( (Unit!42555) )
))
(declare-fun e!734999 () Unit!42554)

(declare-fun Unit!42556 () Unit!42554)

(assert (=> b!1286948 (= e!734999 Unit!42556)))

(declare-fun b!1286949 () Bool)

(declare-fun e!734995 () Bool)

(declare-fun tp_is_empty!34073 () Bool)

(assert (=> b!1286949 (= e!734995 tp_is_empty!34073)))

(declare-fun b!1286950 () Bool)

(declare-fun res!854778 () Bool)

(declare-fun e!734993 () Bool)

(assert (=> b!1286950 (=> (not res!854778) (not e!734993))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16138 0))(
  ( (ValueCellFull!16138 (v!19713 V!50533)) (EmptyCell!16138) )
))
(declare-datatypes ((array!85194 0))(
  ( (array!85195 (arr!41099 (Array (_ BitVec 32) ValueCell!16138)) (size!41649 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85194)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85196 0))(
  ( (array!85197 (arr!41100 (Array (_ BitVec 32) (_ BitVec 64))) (size!41650 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85196)

(assert (=> b!1286950 (= res!854778 (and (= (size!41649 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41650 _keys!1741) (size!41649 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63094 () Bool)

(declare-fun call!63099 () Unit!42554)

(declare-fun call!63098 () Unit!42554)

(assert (=> bm!63094 (= call!63099 call!63098)))

(declare-fun mapIsEmpty!52667 () Bool)

(declare-fun mapRes!52667 () Bool)

(assert (=> mapIsEmpty!52667 mapRes!52667))

(declare-fun mapNonEmpty!52667 () Bool)

(declare-fun tp!100415 () Bool)

(declare-fun e!734994 () Bool)

(assert (=> mapNonEmpty!52667 (= mapRes!52667 (and tp!100415 e!734994))))

(declare-fun mapRest!52667 () (Array (_ BitVec 32) ValueCell!16138))

(declare-fun mapValue!52667 () ValueCell!16138)

(declare-fun mapKey!52667 () (_ BitVec 32))

(assert (=> mapNonEmpty!52667 (= (arr!41099 _values!1445) (store mapRest!52667 mapKey!52667 mapValue!52667))))

(declare-fun b!1286951 () Bool)

(declare-fun c!124264 () Bool)

(declare-fun lt!577612 () Bool)

(assert (=> b!1286951 (= c!124264 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577612))))

(declare-fun e!734998 () Unit!42554)

(assert (=> b!1286951 (= e!734998 e!734999)))

(declare-fun zeroValue!1387 () V!50533)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50533)

(declare-fun call!63101 () ListLongMap!19603)

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!63095 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5950 (array!85196 array!85194 (_ BitVec 32) (_ BitVec 32) V!50533 V!50533 (_ BitVec 32) Int) ListLongMap!19603)

(assert (=> bm!63095 (= call!63101 (getCurrentListMapNoExtraKeys!5950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286952 () Bool)

(declare-fun lt!577603 () Unit!42554)

(assert (=> b!1286952 (= e!734999 lt!577603)))

(declare-fun call!63096 () ListLongMap!19603)

(assert (=> b!1286952 (= lt!577607 call!63096)))

(assert (=> b!1286952 (= lt!577603 call!63099)))

(declare-fun call!63100 () Bool)

(assert (=> b!1286952 call!63100))

(declare-fun lt!577611 () ListLongMap!19603)

(declare-fun bm!63096 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!38 ((_ BitVec 64) (_ BitVec 64) V!50533 ListLongMap!19603) Unit!42554)

(assert (=> bm!63096 (= call!63098 (lemmaInListMapAfterAddingDiffThenInBefore!38 k!1205 (ite (or c!124263 c!124262) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124263 c!124262) zeroValue!1387 minValue!1387) (ite c!124263 lt!577611 (ite c!124262 lt!577604 lt!577607))))))

(declare-fun b!1286954 () Bool)

(assert (=> b!1286954 call!63100))

(declare-fun lt!577602 () Unit!42554)

(assert (=> b!1286954 (= lt!577602 call!63099)))

(assert (=> b!1286954 (= lt!577604 call!63096)))

(assert (=> b!1286954 (= e!734998 lt!577602)))

(declare-fun bm!63097 () Bool)

(assert (=> bm!63097 (= call!63100 call!63097)))

(declare-fun b!1286955 () Bool)

(assert (=> b!1286955 (= e!734993 (not true))))

(assert (=> b!1286955 (not (contains!7933 (ListLongMap!19604 Nil!29127) k!1205))))

(declare-fun lt!577606 () Unit!42554)

(declare-fun emptyContainsNothing!10 ((_ BitVec 64)) Unit!42554)

(assert (=> b!1286955 (= lt!577606 (emptyContainsNothing!10 k!1205))))

(declare-fun lt!577610 () Unit!42554)

(declare-fun e!734996 () Unit!42554)

(assert (=> b!1286955 (= lt!577610 e!734996)))

(assert (=> b!1286955 (= c!124263 (and (not lt!577612) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286955 (= lt!577612 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286956 () Bool)

(assert (=> b!1286956 (= e!734996 e!734998)))

(assert (=> b!1286956 (= c!124262 (and (not lt!577612) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286957 () Bool)

(declare-fun res!854777 () Bool)

(assert (=> b!1286957 (=> (not res!854777) (not e!734993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286957 (= res!854777 (validKeyInArray!0 (select (arr!41100 _keys!1741) from!2144)))))

(declare-fun b!1286958 () Bool)

(declare-fun res!854773 () Bool)

(assert (=> b!1286958 (=> (not res!854773) (not e!734993))))

(declare-fun getCurrentListMap!4892 (array!85196 array!85194 (_ BitVec 32) (_ BitVec 32) V!50533 V!50533 (_ BitVec 32) Int) ListLongMap!19603)

(assert (=> b!1286958 (= res!854773 (contains!7933 (getCurrentListMap!4892 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1286959 () Bool)

(declare-fun res!854774 () Bool)

(assert (=> b!1286959 (=> (not res!854774) (not e!734993))))

(assert (=> b!1286959 (= res!854774 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41650 _keys!1741))))))

(declare-fun b!1286960 () Bool)

(declare-fun e!734992 () Bool)

(assert (=> b!1286960 (= e!734992 (and e!734995 mapRes!52667))))

(declare-fun condMapEmpty!52667 () Bool)

(declare-fun mapDefault!52667 () ValueCell!16138)

