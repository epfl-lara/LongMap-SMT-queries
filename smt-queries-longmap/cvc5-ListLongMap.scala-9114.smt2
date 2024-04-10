; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109468 () Bool)

(assert start!109468)

(declare-fun b_free!28957 () Bool)

(declare-fun b_next!28957 () Bool)

(assert (=> start!109468 (= b_free!28957 (not b_next!28957))))

(declare-fun tp!101990 () Bool)

(declare-fun b_and!47047 () Bool)

(assert (=> start!109468 (= tp!101990 b_and!47047)))

(declare-fun bm!63423 () Bool)

(declare-datatypes ((Unit!42949 0))(
  ( (Unit!42950) )
))
(declare-fun call!63427 () Unit!42949)

(declare-fun call!63430 () Unit!42949)

(assert (=> bm!63423 (= call!63427 call!63430)))

(declare-fun b!1296447 () Bool)

(declare-fun e!739632 () Unit!42949)

(declare-fun lt!580387 () Unit!42949)

(assert (=> b!1296447 (= e!739632 lt!580387)))

(declare-datatypes ((V!51233 0))(
  ( (V!51234 (val!17373 Int)) )
))
(declare-datatypes ((tuple2!22378 0))(
  ( (tuple2!22379 (_1!11200 (_ BitVec 64)) (_2!11200 V!51233)) )
))
(declare-datatypes ((List!29518 0))(
  ( (Nil!29515) (Cons!29514 (h!30723 tuple2!22378) (t!43082 List!29518)) )
))
(declare-datatypes ((ListLongMap!20035 0))(
  ( (ListLongMap!20036 (toList!10033 List!29518)) )
))
(declare-fun lt!580386 () ListLongMap!20035)

(declare-fun call!63436 () ListLongMap!20035)

(assert (=> b!1296447 (= lt!580386 call!63436)))

(declare-fun zeroValue!1387 () V!51233)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580390 () Unit!42949)

(declare-fun addStillNotContains!454 (ListLongMap!20035 (_ BitVec 64) V!51233 (_ BitVec 64)) Unit!42949)

(assert (=> b!1296447 (= lt!580390 (addStillNotContains!454 lt!580386 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun lt!580394 () ListLongMap!20035)

(declare-fun call!63434 () ListLongMap!20035)

(assert (=> b!1296447 (= lt!580394 call!63434)))

(declare-fun call!63431 () Bool)

(assert (=> b!1296447 (not call!63431)))

(declare-fun lt!580392 () Unit!42949)

(declare-fun call!63429 () Unit!42949)

(assert (=> b!1296447 (= lt!580392 call!63429)))

(declare-fun minValue!1387 () V!51233)

(declare-fun contains!8151 (ListLongMap!20035 (_ BitVec 64)) Bool)

(declare-fun +!4436 (ListLongMap!20035 tuple2!22378) ListLongMap!20035)

(assert (=> b!1296447 (not (contains!8151 (+!4436 lt!580386 (tuple2!22379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!580393 () Unit!42949)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!71 ((_ BitVec 64) (_ BitVec 64) V!51233 ListLongMap!20035) Unit!42949)

(assert (=> b!1296447 (= lt!580393 (lemmaInListMapAfterAddingDiffThenInBefore!71 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580394))))

(assert (=> b!1296447 false))

(assert (=> b!1296447 (= lt!580387 call!63430)))

(declare-fun lt!580388 () Bool)

(declare-fun call!63428 () Bool)

(assert (=> b!1296447 (= lt!580388 call!63428)))

(declare-fun b!1296448 () Bool)

(declare-fun res!861639 () Bool)

(declare-fun e!739631 () Bool)

(assert (=> b!1296448 (=> (not res!861639) (not e!739631))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86212 0))(
  ( (array!86213 (arr!41607 (Array (_ BitVec 32) (_ BitVec 64))) (size!42157 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86212)

(assert (=> b!1296448 (= res!861639 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42157 _keys!1741))))))

(declare-fun b!1296449 () Bool)

(declare-fun c!124395 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!580398 () Bool)

(assert (=> b!1296449 (= c!124395 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580398))))

(declare-fun e!739629 () Unit!42949)

(declare-fun e!739633 () Unit!42949)

(assert (=> b!1296449 (= e!739629 e!739633)))

(declare-fun bm!63424 () Bool)

(declare-fun call!63435 () Bool)

(assert (=> bm!63424 (= call!63435 call!63428)))

(declare-fun b!1296450 () Bool)

(declare-fun lt!580400 () Unit!42949)

(assert (=> b!1296450 (= e!739633 lt!580400)))

(declare-fun lt!580399 () ListLongMap!20035)

(declare-fun call!63432 () ListLongMap!20035)

(assert (=> b!1296450 (= lt!580399 call!63432)))

(declare-fun lt!580395 () Unit!42949)

(declare-fun call!63426 () Unit!42949)

(assert (=> b!1296450 (= lt!580395 call!63426)))

(declare-fun call!63437 () Bool)

(assert (=> b!1296450 (not call!63437)))

(assert (=> b!1296450 (= lt!580400 call!63427)))

(assert (=> b!1296450 call!63435))

(declare-datatypes ((ValueCell!16400 0))(
  ( (ValueCellFull!16400 (v!19976 V!51233)) (EmptyCell!16400) )
))
(declare-datatypes ((array!86214 0))(
  ( (array!86215 (arr!41608 (Array (_ BitVec 32) ValueCell!16400)) (size!42158 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86214)

(declare-fun bm!63425 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6068 (array!86212 array!86214 (_ BitVec 32) (_ BitVec 32) V!51233 V!51233 (_ BitVec 32) Int) ListLongMap!20035)

(assert (=> bm!63425 (= call!63436 (getCurrentListMapNoExtraKeys!6068 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296451 () Bool)

(declare-fun Unit!42951 () Unit!42949)

(assert (=> b!1296451 (= e!739633 Unit!42951)))

(declare-fun lt!580397 () ListLongMap!20035)

(declare-fun c!124396 () Bool)

(declare-fun c!124394 () Bool)

(declare-fun bm!63426 () Bool)

(assert (=> bm!63426 (= call!63430 (lemmaInListMapAfterAddingDiffThenInBefore!71 k!1205 (ite (or c!124396 c!124394) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124396 c!124394) zeroValue!1387 minValue!1387) (ite c!124396 lt!580386 (ite c!124394 lt!580397 lt!580399))))))

(declare-fun b!1296452 () Bool)

(assert (=> b!1296452 (= e!739631 (not true))))

(declare-fun lt!580389 () Unit!42949)

(assert (=> b!1296452 (= lt!580389 e!739632)))

(assert (=> b!1296452 (= c!124396 (and (not lt!580398) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296452 (= lt!580398 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296452 (not (contains!8151 (ListLongMap!20036 Nil!29515) k!1205))))

(declare-fun lt!580385 () Unit!42949)

(declare-fun emptyContainsNothing!191 ((_ BitVec 64)) Unit!42949)

(assert (=> b!1296452 (= lt!580385 (emptyContainsNothing!191 k!1205))))

(declare-fun b!1296453 () Bool)

(declare-fun res!861645 () Bool)

(assert (=> b!1296453 (=> (not res!861645) (not e!739631))))

(assert (=> b!1296453 (= res!861645 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42157 _keys!1741))))))

(declare-fun bm!63427 () Bool)

(assert (=> bm!63427 (= call!63432 call!63436)))

(declare-fun bm!63428 () Bool)

(declare-fun call!63433 () ListLongMap!20035)

(assert (=> bm!63428 (= call!63433 call!63434)))

(declare-fun bm!63429 () Bool)

(assert (=> bm!63429 (= call!63431 (contains!8151 (ite c!124396 lt!580394 call!63433) k!1205))))

(declare-fun res!861644 () Bool)

(assert (=> start!109468 (=> (not res!861644) (not e!739631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109468 (= res!861644 (validMask!0 mask!2175))))

(assert (=> start!109468 e!739631))

(declare-fun tp_is_empty!34597 () Bool)

(assert (=> start!109468 tp_is_empty!34597))

(assert (=> start!109468 true))

(declare-fun e!739630 () Bool)

(declare-fun array_inv!31497 (array!86214) Bool)

(assert (=> start!109468 (and (array_inv!31497 _values!1445) e!739630)))

(declare-fun array_inv!31498 (array!86212) Bool)

(assert (=> start!109468 (array_inv!31498 _keys!1741)))

(assert (=> start!109468 tp!101990))

(declare-fun b!1296454 () Bool)

(declare-fun e!739634 () Bool)

(declare-fun mapRes!53456 () Bool)

(assert (=> b!1296454 (= e!739630 (and e!739634 mapRes!53456))))

(declare-fun condMapEmpty!53456 () Bool)

(declare-fun mapDefault!53456 () ValueCell!16400)

