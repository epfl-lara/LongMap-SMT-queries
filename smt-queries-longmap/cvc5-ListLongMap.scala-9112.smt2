; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109456 () Bool)

(assert start!109456)

(declare-fun b_free!28945 () Bool)

(declare-fun b_next!28945 () Bool)

(assert (=> start!109456 (= b_free!28945 (not b_next!28945))))

(declare-fun tp!101953 () Bool)

(declare-fun b_and!47035 () Bool)

(assert (=> start!109456 (= tp!101953 b_and!47035)))

(declare-fun b!1296141 () Bool)

(declare-datatypes ((Unit!42932 0))(
  ( (Unit!42933) )
))
(declare-fun e!739483 () Unit!42932)

(declare-fun lt!580107 () Unit!42932)

(assert (=> b!1296141 (= e!739483 lt!580107)))

(declare-datatypes ((V!51217 0))(
  ( (V!51218 (val!17367 Int)) )
))
(declare-datatypes ((tuple2!22366 0))(
  ( (tuple2!22367 (_1!11194 (_ BitVec 64)) (_2!11194 V!51217)) )
))
(declare-datatypes ((List!29508 0))(
  ( (Nil!29505) (Cons!29504 (h!30713 tuple2!22366) (t!43072 List!29508)) )
))
(declare-datatypes ((ListLongMap!20023 0))(
  ( (ListLongMap!20024 (toList!10027 List!29508)) )
))
(declare-fun lt!580110 () ListLongMap!20023)

(declare-fun call!63215 () ListLongMap!20023)

(assert (=> b!1296141 (= lt!580110 call!63215)))

(declare-fun lt!580101 () Unit!42932)

(declare-fun call!63219 () Unit!42932)

(assert (=> b!1296141 (= lt!580101 call!63219)))

(declare-fun call!63217 () Bool)

(assert (=> b!1296141 (not call!63217)))

(declare-fun call!63220 () Unit!42932)

(assert (=> b!1296141 (= lt!580107 call!63220)))

(declare-fun call!63221 () Bool)

(assert (=> b!1296141 call!63221))

(declare-fun b!1296142 () Bool)

(declare-fun res!861501 () Bool)

(declare-fun e!739490 () Bool)

(assert (=> b!1296142 (=> (not res!861501) (not e!739490))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86188 0))(
  ( (array!86189 (arr!41595 (Array (_ BitVec 32) (_ BitVec 64))) (size!42145 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86188)

(assert (=> b!1296142 (= res!861501 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42145 _keys!1741))))))

(declare-fun minValue!1387 () V!51217)

(declare-fun zeroValue!1387 () V!51217)

(declare-fun bm!63207 () Bool)

(declare-fun c!124341 () Bool)

(declare-fun c!124340 () Bool)

(declare-fun lt!580104 () ListLongMap!20023)

(declare-fun lt!580111 () ListLongMap!20023)

(declare-fun call!63212 () Unit!42932)

(declare-fun addStillNotContains!448 (ListLongMap!20023 (_ BitVec 64) V!51217 (_ BitVec 64)) Unit!42932)

(assert (=> bm!63207 (= call!63212 (addStillNotContains!448 (ite c!124341 lt!580104 (ite c!124340 lt!580111 lt!580110)) (ite c!124341 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124340 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124341 minValue!1387 (ite c!124340 zeroValue!1387 minValue!1387)) k!1205))))

(declare-fun bm!63208 () Bool)

(declare-fun call!63218 () Unit!42932)

(assert (=> bm!63208 (= call!63220 call!63218)))

(declare-fun b!1296143 () Bool)

(declare-fun res!861496 () Bool)

(assert (=> b!1296143 (=> (not res!861496) (not e!739490))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86188 (_ BitVec 32)) Bool)

(assert (=> b!1296143 (= res!861496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296144 () Bool)

(assert (=> b!1296144 (= e!739490 (not true))))

(declare-fun lt!580097 () Unit!42932)

(declare-fun e!739485 () Unit!42932)

(assert (=> b!1296144 (= lt!580097 e!739485)))

(declare-fun lt!580103 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296144 (= c!124341 (and (not lt!580103) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296144 (= lt!580103 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun contains!8145 (ListLongMap!20023 (_ BitVec 64)) Bool)

(assert (=> b!1296144 (not (contains!8145 (ListLongMap!20024 Nil!29505) k!1205))))

(declare-fun lt!580106 () Unit!42932)

(declare-fun emptyContainsNothing!185 ((_ BitVec 64)) Unit!42932)

(assert (=> b!1296144 (= lt!580106 (emptyContainsNothing!185 k!1205))))

(declare-fun b!1296145 () Bool)

(declare-fun e!739486 () Bool)

(declare-fun tp_is_empty!34585 () Bool)

(assert (=> b!1296145 (= e!739486 tp_is_empty!34585)))

(declare-fun bm!63209 () Bool)

(declare-fun call!63211 () ListLongMap!20023)

(assert (=> bm!63209 (= call!63215 call!63211)))

(declare-fun call!63214 () ListLongMap!20023)

(declare-fun bm!63210 () Bool)

(declare-fun +!4430 (ListLongMap!20023 tuple2!22366) ListLongMap!20023)

(assert (=> bm!63210 (= call!63214 (+!4430 (ite c!124341 lt!580104 (ite c!124340 lt!580111 lt!580110)) (ite c!124341 (tuple2!22367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124340 (tuple2!22367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun bm!63211 () Bool)

(declare-fun call!63210 () Bool)

(assert (=> bm!63211 (= call!63210 (contains!8145 (ite c!124341 lt!580104 (ite c!124340 lt!580111 lt!580110)) k!1205))))

(declare-fun bm!63212 () Bool)

(declare-fun call!63216 () Bool)

(declare-fun call!63213 () ListLongMap!20023)

(declare-fun lt!580109 () ListLongMap!20023)

(assert (=> bm!63212 (= call!63216 (contains!8145 (ite c!124341 lt!580109 call!63213) k!1205))))

(declare-fun b!1296147 () Bool)

(declare-fun res!861500 () Bool)

(assert (=> b!1296147 (=> (not res!861500) (not e!739490))))

(declare-datatypes ((List!29509 0))(
  ( (Nil!29506) (Cons!29505 (h!30714 (_ BitVec 64)) (t!43073 List!29509)) )
))
(declare-fun arrayNoDuplicates!0 (array!86188 (_ BitVec 32) List!29509) Bool)

(assert (=> b!1296147 (= res!861500 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29506))))

(declare-fun bm!63213 () Bool)

(assert (=> bm!63213 (= call!63221 call!63210)))

(declare-fun b!1296148 () Bool)

(declare-fun e!739484 () Bool)

(assert (=> b!1296148 (= e!739484 tp_is_empty!34585)))

(declare-fun bm!63214 () Bool)

(assert (=> bm!63214 (= call!63217 call!63216)))

(declare-fun b!1296149 () Bool)

(declare-fun res!861499 () Bool)

(assert (=> b!1296149 (=> (not res!861499) (not e!739490))))

(assert (=> b!1296149 (= res!861499 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42145 _keys!1741))))))

(declare-fun b!1296150 () Bool)

(declare-fun Unit!42934 () Unit!42932)

(assert (=> b!1296150 (= e!739483 Unit!42934)))

(declare-fun b!1296151 () Bool)

(declare-fun res!861497 () Bool)

(assert (=> b!1296151 (=> (not res!861497) (not e!739490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296151 (= res!861497 (not (validKeyInArray!0 (select (arr!41595 _keys!1741) from!2144))))))

(declare-fun b!1296152 () Bool)

(declare-fun c!124342 () Bool)

(assert (=> b!1296152 (= c!124342 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580103))))

(declare-fun e!739487 () Unit!42932)

(assert (=> b!1296152 (= e!739487 e!739483)))

(declare-fun b!1296153 () Bool)

(declare-fun e!739489 () Bool)

(declare-fun mapRes!53438 () Bool)

(assert (=> b!1296153 (= e!739489 (and e!739486 mapRes!53438))))

(declare-fun condMapEmpty!53438 () Bool)

(declare-datatypes ((ValueCell!16394 0))(
  ( (ValueCellFull!16394 (v!19970 V!51217)) (EmptyCell!16394) )
))
(declare-datatypes ((array!86190 0))(
  ( (array!86191 (arr!41596 (Array (_ BitVec 32) ValueCell!16394)) (size!42146 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86190)

(declare-fun mapDefault!53438 () ValueCell!16394)

