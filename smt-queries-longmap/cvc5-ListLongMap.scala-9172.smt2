; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110258 () Bool)

(assert start!110258)

(declare-fun b_free!29305 () Bool)

(declare-fun b_next!29305 () Bool)

(assert (=> start!110258 (= b_free!29305 (not b_next!29305))))

(declare-fun tp!103080 () Bool)

(declare-fun b_and!47501 () Bool)

(assert (=> start!110258 (= tp!103080 b_and!47501)))

(declare-fun mapIsEmpty!54024 () Bool)

(declare-fun mapRes!54024 () Bool)

(assert (=> mapIsEmpty!54024 mapRes!54024))

(declare-datatypes ((V!51697 0))(
  ( (V!51698 (val!17547 Int)) )
))
(declare-datatypes ((tuple2!22652 0))(
  ( (tuple2!22653 (_1!11337 (_ BitVec 64)) (_2!11337 V!51697)) )
))
(declare-datatypes ((List!29772 0))(
  ( (Nil!29769) (Cons!29768 (h!30977 tuple2!22652) (t!43374 List!29772)) )
))
(declare-datatypes ((ListLongMap!20309 0))(
  ( (ListLongMap!20310 (toList!10170 List!29772)) )
))
(declare-fun lt!584253 () ListLongMap!20309)

(declare-fun c!125349 () Bool)

(declare-fun lt!584246 () ListLongMap!20309)

(declare-fun lt!584251 () ListLongMap!20309)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun bm!64354 () Bool)

(declare-fun c!125348 () Bool)

(declare-fun call!64363 () Bool)

(declare-fun contains!8314 (ListLongMap!20309 (_ BitVec 64)) Bool)

(assert (=> bm!64354 (= call!64363 (contains!8314 (ite c!125349 lt!584246 (ite c!125348 lt!584253 lt!584251)) k!1205))))

(declare-fun minValue!1387 () V!51697)

(declare-fun zeroValue!1387 () V!51697)

(declare-datatypes ((Unit!43224 0))(
  ( (Unit!43225) )
))
(declare-fun call!64357 () Unit!43224)

(declare-fun bm!64355 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!92 ((_ BitVec 64) (_ BitVec 64) V!51697 ListLongMap!20309) Unit!43224)

(assert (=> bm!64355 (= call!64357 (lemmaInListMapAfterAddingDiffThenInBefore!92 k!1205 (ite (or c!125349 c!125348) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125349 c!125348) zeroValue!1387 minValue!1387) (ite c!125349 lt!584246 (ite c!125348 lt!584253 lt!584251))))))

(declare-fun bm!64356 () Bool)

(declare-fun call!64359 () Bool)

(assert (=> bm!64356 (= call!64359 call!64363)))

(declare-fun b!1305184 () Bool)

(declare-fun res!866728 () Bool)

(declare-fun e!744493 () Bool)

(assert (=> b!1305184 (=> (not res!866728) (not e!744493))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16574 0))(
  ( (ValueCellFull!16574 (v!20169 V!51697)) (EmptyCell!16574) )
))
(declare-datatypes ((array!86906 0))(
  ( (array!86907 (arr!41940 (Array (_ BitVec 32) ValueCell!16574)) (size!42490 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86906)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86908 0))(
  ( (array!86909 (arr!41941 (Array (_ BitVec 32) (_ BitVec 64))) (size!42491 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86908)

(assert (=> b!1305184 (= res!866728 (and (= (size!42490 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42491 _keys!1741) (size!42490 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305185 () Bool)

(declare-fun e!744487 () Unit!43224)

(declare-fun e!744490 () Unit!43224)

(assert (=> b!1305185 (= e!744487 e!744490)))

(declare-fun lt!584247 () Bool)

(assert (=> b!1305185 (= c!125348 (and (not lt!584247) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305186 () Bool)

(declare-fun e!744488 () Unit!43224)

(declare-fun Unit!43226 () Unit!43224)

(assert (=> b!1305186 (= e!744488 Unit!43226)))

(declare-fun b!1305187 () Bool)

(declare-fun res!866735 () Bool)

(assert (=> b!1305187 (=> (not res!866735) (not e!744493))))

(declare-datatypes ((List!29773 0))(
  ( (Nil!29770) (Cons!29769 (h!30978 (_ BitVec 64)) (t!43375 List!29773)) )
))
(declare-fun arrayNoDuplicates!0 (array!86908 (_ BitVec 32) List!29773) Bool)

(assert (=> b!1305187 (= res!866735 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29770))))

(declare-fun b!1305188 () Bool)

(declare-fun e!744492 () Bool)

(declare-fun tp_is_empty!34945 () Bool)

(assert (=> b!1305188 (= e!744492 tp_is_empty!34945)))

(declare-fun bm!64357 () Bool)

(declare-fun call!64358 () Bool)

(declare-fun call!64366 () Bool)

(assert (=> bm!64357 (= call!64358 call!64366)))

(declare-fun b!1305189 () Bool)

(declare-fun e!744491 () Bool)

(assert (=> b!1305189 (= e!744491 tp_is_empty!34945)))

(declare-fun b!1305191 () Bool)

(assert (=> b!1305191 call!64359))

(declare-fun lt!584245 () Unit!43224)

(declare-fun call!64365 () Unit!43224)

(assert (=> b!1305191 (= lt!584245 call!64365)))

(assert (=> b!1305191 (not call!64358)))

(declare-fun lt!584248 () Unit!43224)

(declare-fun call!64368 () Unit!43224)

(assert (=> b!1305191 (= lt!584248 call!64368)))

(declare-fun call!64364 () ListLongMap!20309)

(assert (=> b!1305191 (= lt!584253 call!64364)))

(assert (=> b!1305191 (= e!744490 lt!584245)))

(declare-fun bm!64358 () Bool)

(assert (=> bm!64358 (= call!64365 call!64357)))

(declare-fun b!1305192 () Bool)

(declare-fun res!866731 () Bool)

(assert (=> b!1305192 (=> (not res!866731) (not e!744493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86908 (_ BitVec 32)) Bool)

(assert (=> b!1305192 (= res!866731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1305193 () Bool)

(declare-fun e!744489 () Bool)

(assert (=> b!1305193 (= e!744489 (and e!744492 mapRes!54024))))

(declare-fun condMapEmpty!54024 () Bool)

(declare-fun mapDefault!54024 () ValueCell!16574)

