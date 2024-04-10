; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109472 () Bool)

(assert start!109472)

(declare-fun b_free!28961 () Bool)

(declare-fun b_next!28961 () Bool)

(assert (=> start!109472 (= b_free!28961 (not b_next!28961))))

(declare-fun tp!102002 () Bool)

(declare-fun b_and!47051 () Bool)

(assert (=> start!109472 (= tp!102002 b_and!47051)))

(declare-fun b!1296549 () Bool)

(declare-fun res!861689 () Bool)

(declare-fun e!739679 () Bool)

(assert (=> b!1296549 (=> (not res!861689) (not e!739679))))

(declare-datatypes ((array!86220 0))(
  ( (array!86221 (arr!41611 (Array (_ BitVec 32) (_ BitVec 64))) (size!42161 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86220)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86220 (_ BitVec 32)) Bool)

(assert (=> b!1296549 (= res!861689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296550 () Bool)

(declare-fun res!861693 () Bool)

(assert (=> b!1296550 (=> (not res!861693) (not e!739679))))

(declare-datatypes ((V!51237 0))(
  ( (V!51238 (val!17375 Int)) )
))
(declare-datatypes ((ValueCell!16402 0))(
  ( (ValueCellFull!16402 (v!19978 V!51237)) (EmptyCell!16402) )
))
(declare-datatypes ((array!86222 0))(
  ( (array!86223 (arr!41612 (Array (_ BitVec 32) ValueCell!16402)) (size!42162 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86222)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296550 (= res!861693 (and (= (size!42162 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42161 _keys!1741) (size!42162 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296551 () Bool)

(declare-fun res!861687 () Bool)

(assert (=> b!1296551 (=> (not res!861687) (not e!739679))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296551 (= res!861687 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42161 _keys!1741))))))

(declare-fun b!1296552 () Bool)

(declare-datatypes ((Unit!42955 0))(
  ( (Unit!42956) )
))
(declare-fun e!739682 () Unit!42955)

(declare-fun lt!580482 () Unit!42955)

(assert (=> b!1296552 (= e!739682 lt!580482)))

(declare-datatypes ((tuple2!22382 0))(
  ( (tuple2!22383 (_1!11202 (_ BitVec 64)) (_2!11202 V!51237)) )
))
(declare-datatypes ((List!29521 0))(
  ( (Nil!29518) (Cons!29517 (h!30726 tuple2!22382) (t!43085 List!29521)) )
))
(declare-datatypes ((ListLongMap!20039 0))(
  ( (ListLongMap!20040 (toList!10035 List!29521)) )
))
(declare-fun lt!580481 () ListLongMap!20039)

(declare-fun call!63500 () ListLongMap!20039)

(assert (=> b!1296552 (= lt!580481 call!63500)))

(declare-fun lt!580487 () Unit!42955)

(declare-fun call!63498 () Unit!42955)

(assert (=> b!1296552 (= lt!580487 call!63498)))

(declare-fun call!63504 () Bool)

(assert (=> b!1296552 (not call!63504)))

(declare-fun call!63503 () Unit!42955)

(assert (=> b!1296552 (= lt!580482 call!63503)))

(declare-fun call!63501 () Bool)

(assert (=> b!1296552 call!63501))

(declare-fun lt!580483 () ListLongMap!20039)

(declare-fun c!124414 () Bool)

(declare-fun bm!63495 () Bool)

(declare-fun call!63507 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580492 () ListLongMap!20039)

(declare-fun c!124413 () Bool)

(declare-fun contains!8153 (ListLongMap!20039 (_ BitVec 64)) Bool)

(assert (=> bm!63495 (= call!63507 (contains!8153 (ite c!124413 lt!580483 (ite c!124414 lt!580492 lt!580481)) k!1205))))

(declare-fun minValue!1387 () V!51237)

(declare-fun call!63509 () ListLongMap!20039)

(declare-fun bm!63496 () Bool)

(declare-fun lt!580491 () ListLongMap!20039)

(declare-fun zeroValue!1387 () V!51237)

(declare-fun +!4438 (ListLongMap!20039 tuple2!22382) ListLongMap!20039)

(assert (=> bm!63496 (= call!63509 (+!4438 (ite c!124413 lt!580491 (ite c!124414 lt!580492 lt!580481)) (ite (or c!124413 c!124414) (tuple2!22383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1296554 () Bool)

(assert (=> b!1296554 call!63501))

(declare-fun lt!580489 () Unit!42955)

(assert (=> b!1296554 (= lt!580489 call!63503)))

(assert (=> b!1296554 (not call!63504)))

(declare-fun lt!580490 () Unit!42955)

(assert (=> b!1296554 (= lt!580490 call!63498)))

(assert (=> b!1296554 (= lt!580492 call!63500)))

(declare-fun e!739675 () Unit!42955)

(assert (=> b!1296554 (= e!739675 lt!580489)))

(declare-fun bm!63497 () Bool)

(declare-fun call!63502 () ListLongMap!20039)

(assert (=> bm!63497 (= call!63500 call!63502)))

(declare-fun bm!63498 () Bool)

(declare-fun call!63499 () Unit!42955)

(assert (=> bm!63498 (= call!63503 call!63499)))

(declare-fun b!1296555 () Bool)

(declare-fun e!739676 () Bool)

(declare-fun e!739680 () Bool)

(declare-fun mapRes!53462 () Bool)

(assert (=> b!1296555 (= e!739676 (and e!739680 mapRes!53462))))

(declare-fun condMapEmpty!53462 () Bool)

(declare-fun mapDefault!53462 () ValueCell!16402)

