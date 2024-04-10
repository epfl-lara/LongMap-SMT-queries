; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108898 () Bool)

(assert start!108898)

(declare-fun b_free!28411 () Bool)

(declare-fun b_next!28411 () Bool)

(assert (=> start!108898 (= b_free!28411 (not b_next!28411))))

(declare-fun tp!100348 () Bool)

(declare-fun b_and!46483 () Bool)

(assert (=> start!108898 (= tp!100348 b_and!46483)))

(declare-fun b!1286359 () Bool)

(declare-fun res!854494 () Bool)

(declare-fun e!734717 () Bool)

(assert (=> b!1286359 (=> (not res!854494) (not e!734717))))

(declare-datatypes ((array!85150 0))(
  ( (array!85151 (arr!41077 (Array (_ BitVec 32) (_ BitVec 64))) (size!41627 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85150)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286359 (= res!854494 (validKeyInArray!0 (select (arr!41077 _keys!1741) from!2144)))))

(declare-fun bm!62895 () Bool)

(declare-datatypes ((Unit!42523 0))(
  ( (Unit!42524) )
))
(declare-fun call!62903 () Unit!42523)

(declare-fun call!62899 () Unit!42523)

(assert (=> bm!62895 (= call!62903 call!62899)))

(declare-fun b!1286360 () Bool)

(declare-fun res!854491 () Bool)

(assert (=> b!1286360 (=> (not res!854491) (not e!734717))))

(declare-datatypes ((V!50505 0))(
  ( (V!50506 (val!17100 Int)) )
))
(declare-fun minValue!1387 () V!50505)

(declare-fun zeroValue!1387 () V!50505)

(declare-datatypes ((ValueCell!16127 0))(
  ( (ValueCellFull!16127 (v!19702 V!50505)) (EmptyCell!16127) )
))
(declare-datatypes ((array!85152 0))(
  ( (array!85153 (arr!41078 (Array (_ BitVec 32) ValueCell!16127)) (size!41628 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85152)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21926 0))(
  ( (tuple2!21927 (_1!10974 (_ BitVec 64)) (_2!10974 V!50505)) )
))
(declare-datatypes ((List!29112 0))(
  ( (Nil!29109) (Cons!29108 (h!30317 tuple2!21926) (t!42664 List!29112)) )
))
(declare-datatypes ((ListLongMap!19583 0))(
  ( (ListLongMap!19584 (toList!9807 List!29112)) )
))
(declare-fun contains!7923 (ListLongMap!19583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4884 (array!85150 array!85152 (_ BitVec 32) (_ BitVec 32) V!50505 V!50505 (_ BitVec 32) Int) ListLongMap!19583)

(assert (=> b!1286360 (= res!854491 (contains!7923 (getCurrentListMap!4884 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52634 () Bool)

(declare-fun mapRes!52634 () Bool)

(declare-fun tp!100349 () Bool)

(declare-fun e!734716 () Bool)

(assert (=> mapNonEmpty!52634 (= mapRes!52634 (and tp!100349 e!734716))))

(declare-fun mapRest!52634 () (Array (_ BitVec 32) ValueCell!16127))

(declare-fun mapValue!52634 () ValueCell!16127)

(declare-fun mapKey!52634 () (_ BitVec 32))

(assert (=> mapNonEmpty!52634 (= (arr!41078 _values!1445) (store mapRest!52634 mapKey!52634 mapValue!52634))))

(declare-fun c!124163 () Bool)

(declare-fun lt!577219 () ListLongMap!19583)

(declare-fun c!124164 () Bool)

(declare-fun bm!62896 () Bool)

(declare-fun call!62900 () Bool)

(declare-fun lt!577215 () ListLongMap!19583)

(declare-fun lt!577217 () ListLongMap!19583)

(assert (=> bm!62896 (= call!62900 (contains!7923 (ite c!124163 lt!577219 (ite c!124164 lt!577217 lt!577215)) k!1205))))

(declare-fun mapIsEmpty!52634 () Bool)

(assert (=> mapIsEmpty!52634 mapRes!52634))

(declare-fun b!1286361 () Bool)

(declare-fun e!734714 () Bool)

(assert (=> b!1286361 (= e!734714 true)))

(declare-fun lt!577212 () V!50505)

(declare-fun +!4313 (ListLongMap!19583 tuple2!21926) ListLongMap!19583)

(assert (=> b!1286361 (not (contains!7923 (+!4313 (ListLongMap!19584 Nil!29109) (tuple2!21927 (select (arr!41077 _keys!1741) from!2144) lt!577212)) k!1205))))

(declare-fun lt!577216 () Unit!42523)

(declare-fun addStillNotContains!336 (ListLongMap!19583 (_ BitVec 64) V!50505 (_ BitVec 64)) Unit!42523)

(assert (=> b!1286361 (= lt!577216 (addStillNotContains!336 (ListLongMap!19584 Nil!29109) (select (arr!41077 _keys!1741) from!2144) lt!577212 k!1205))))

(declare-fun get!20855 (ValueCell!16127 V!50505) V!50505)

(declare-fun dynLambda!3410 (Int (_ BitVec 64)) V!50505)

(assert (=> b!1286361 (= lt!577212 (get!20855 (select (arr!41078 _values!1445) from!2144) (dynLambda!3410 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286362 () Bool)

(declare-fun e!734720 () Unit!42523)

(declare-fun lt!577207 () Unit!42523)

(assert (=> b!1286362 (= e!734720 lt!577207)))

(declare-fun call!62901 () ListLongMap!19583)

(assert (=> b!1286362 (= lt!577215 call!62901)))

(assert (=> b!1286362 (= lt!577207 call!62903)))

(declare-fun call!62902 () Bool)

(assert (=> b!1286362 call!62902))

(declare-fun b!1286363 () Bool)

(declare-fun Unit!42525 () Unit!42523)

(assert (=> b!1286363 (= e!734720 Unit!42525)))

(declare-fun res!854493 () Bool)

(assert (=> start!108898 (=> (not res!854493) (not e!734717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108898 (= res!854493 (validMask!0 mask!2175))))

(assert (=> start!108898 e!734717))

(declare-fun tp_is_empty!34051 () Bool)

(assert (=> start!108898 tp_is_empty!34051))

(assert (=> start!108898 true))

(declare-fun e!734718 () Bool)

(declare-fun array_inv!31147 (array!85152) Bool)

(assert (=> start!108898 (and (array_inv!31147 _values!1445) e!734718)))

(declare-fun array_inv!31148 (array!85150) Bool)

(assert (=> start!108898 (array_inv!31148 _keys!1741)))

(assert (=> start!108898 tp!100348))

(declare-fun b!1286364 () Bool)

(declare-fun e!734712 () Unit!42523)

(declare-fun lt!577209 () Unit!42523)

(assert (=> b!1286364 (= e!734712 lt!577209)))

(declare-fun call!62898 () ListLongMap!19583)

(assert (=> b!1286364 (= lt!577219 call!62898)))

(declare-fun lt!577208 () ListLongMap!19583)

(assert (=> b!1286364 (= lt!577208 (+!4313 lt!577219 (tuple2!21927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577213 () Unit!42523)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!29 ((_ BitVec 64) (_ BitVec 64) V!50505 ListLongMap!19583) Unit!42523)

(assert (=> b!1286364 (= lt!577213 (lemmaInListMapAfterAddingDiffThenInBefore!29 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577208))))

(assert (=> b!1286364 (contains!7923 lt!577208 k!1205)))

(assert (=> b!1286364 (= lt!577209 call!62899)))

(assert (=> b!1286364 call!62900))

(declare-fun b!1286365 () Bool)

(declare-fun res!854492 () Bool)

(assert (=> b!1286365 (=> (not res!854492) (not e!734717))))

(assert (=> b!1286365 (= res!854492 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41627 _keys!1741))))))

(declare-fun b!1286366 () Bool)

(declare-fun e!734713 () Unit!42523)

(assert (=> b!1286366 (= e!734712 e!734713)))

(declare-fun lt!577218 () Bool)

(assert (=> b!1286366 (= c!124164 (and (not lt!577218) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286367 () Bool)

(assert (=> b!1286367 call!62902))

(declare-fun lt!577214 () Unit!42523)

(assert (=> b!1286367 (= lt!577214 call!62903)))

(assert (=> b!1286367 (= lt!577217 call!62901)))

(assert (=> b!1286367 (= e!734713 lt!577214)))

(declare-fun b!1286368 () Bool)

(assert (=> b!1286368 (= e!734717 (not e!734714))))

(declare-fun res!854496 () Bool)

(assert (=> b!1286368 (=> res!854496 e!734714)))

(assert (=> b!1286368 (= res!854496 (= k!1205 (select (arr!41077 _keys!1741) from!2144)))))

(assert (=> b!1286368 (not (contains!7923 (ListLongMap!19584 Nil!29109) k!1205))))

(declare-fun lt!577210 () Unit!42523)

(declare-fun emptyContainsNothing!4 ((_ BitVec 64)) Unit!42523)

(assert (=> b!1286368 (= lt!577210 (emptyContainsNothing!4 k!1205))))

(declare-fun lt!577211 () Unit!42523)

(assert (=> b!1286368 (= lt!577211 e!734712)))

(assert (=> b!1286368 (= c!124163 (and (not lt!577218) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286368 (= lt!577218 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286369 () Bool)

(declare-fun e!734719 () Bool)

(assert (=> b!1286369 (= e!734719 tp_is_empty!34051)))

(declare-fun b!1286370 () Bool)

(declare-fun res!854495 () Bool)

(assert (=> b!1286370 (=> (not res!854495) (not e!734717))))

(assert (=> b!1286370 (= res!854495 (and (= (size!41628 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41627 _keys!1741) (size!41628 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!62897 () Bool)

(assert (=> bm!62897 (= call!62899 (lemmaInListMapAfterAddingDiffThenInBefore!29 k!1205 (ite (or c!124163 c!124164) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124163 c!124164) zeroValue!1387 minValue!1387) (ite c!124163 lt!577219 (ite c!124164 lt!577217 lt!577215))))))

(declare-fun b!1286371 () Bool)

(assert (=> b!1286371 (= e!734718 (and e!734719 mapRes!52634))))

(declare-fun condMapEmpty!52634 () Bool)

(declare-fun mapDefault!52634 () ValueCell!16127)

