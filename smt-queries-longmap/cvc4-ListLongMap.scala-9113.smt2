; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109466 () Bool)

(assert start!109466)

(declare-fun b_free!28955 () Bool)

(declare-fun b_next!28955 () Bool)

(assert (=> start!109466 (= b_free!28955 (not b_next!28955))))

(declare-fun tp!101984 () Bool)

(declare-fun b_and!47045 () Bool)

(assert (=> start!109466 (= tp!101984 b_and!47045)))

(declare-fun mapIsEmpty!53453 () Bool)

(declare-fun mapRes!53453 () Bool)

(assert (=> mapIsEmpty!53453 mapRes!53453))

(declare-datatypes ((V!51229 0))(
  ( (V!51230 (val!17372 Int)) )
))
(declare-datatypes ((tuple2!22376 0))(
  ( (tuple2!22377 (_1!11199 (_ BitVec 64)) (_2!11199 V!51229)) )
))
(declare-datatypes ((List!29517 0))(
  ( (Nil!29514) (Cons!29513 (h!30722 tuple2!22376) (t!43081 List!29517)) )
))
(declare-datatypes ((ListLongMap!20033 0))(
  ( (ListLongMap!20034 (toList!10032 List!29517)) )
))
(declare-fun call!63401 () ListLongMap!20033)

(declare-fun c!124387 () Bool)

(declare-fun call!63398 () Bool)

(declare-fun bm!63387 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580346 () ListLongMap!20033)

(declare-fun contains!8150 (ListLongMap!20033 (_ BitVec 64)) Bool)

(assert (=> bm!63387 (= call!63398 (contains!8150 (ite c!124387 lt!580346 call!63401) k!1205))))

(declare-fun b!1296396 () Bool)

(declare-fun e!739610 () Bool)

(declare-fun tp_is_empty!34595 () Bool)

(assert (=> b!1296396 (= e!739610 tp_is_empty!34595)))

(declare-fun minValue!1387 () V!51229)

(declare-fun zeroValue!1387 () V!51229)

(declare-fun lt!580340 () ListLongMap!20033)

(declare-datatypes ((Unit!42947 0))(
  ( (Unit!42948) )
))
(declare-fun call!63392 () Unit!42947)

(declare-fun c!124385 () Bool)

(declare-fun lt!580343 () ListLongMap!20033)

(declare-fun lt!580345 () ListLongMap!20033)

(declare-fun bm!63388 () Bool)

(declare-fun addStillNotContains!453 (ListLongMap!20033 (_ BitVec 64) V!51229 (_ BitVec 64)) Unit!42947)

(assert (=> bm!63388 (= call!63392 (addStillNotContains!453 (ite c!124387 lt!580340 (ite c!124385 lt!580343 lt!580345)) (ite c!124387 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124385 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124387 minValue!1387 (ite c!124385 zeroValue!1387 minValue!1387)) k!1205))))

(declare-fun bm!63389 () Bool)

(declare-fun call!63396 () Bool)

(assert (=> bm!63389 (= call!63396 call!63398)))

(declare-fun mapNonEmpty!53453 () Bool)

(declare-fun tp!101983 () Bool)

(declare-fun e!739608 () Bool)

(assert (=> mapNonEmpty!53453 (= mapRes!53453 (and tp!101983 e!739608))))

(declare-fun mapKey!53453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16399 0))(
  ( (ValueCellFull!16399 (v!19975 V!51229)) (EmptyCell!16399) )
))
(declare-fun mapValue!53453 () ValueCell!16399)

(declare-datatypes ((array!86208 0))(
  ( (array!86209 (arr!41605 (Array (_ BitVec 32) ValueCell!16399)) (size!42155 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86208)

(declare-fun mapRest!53453 () (Array (_ BitVec 32) ValueCell!16399))

(assert (=> mapNonEmpty!53453 (= (arr!41605 _values!1445) (store mapRest!53453 mapKey!53453 mapValue!53453))))

(declare-fun bm!63390 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86210 0))(
  ( (array!86211 (arr!41606 (Array (_ BitVec 32) (_ BitVec 64))) (size!42156 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86210)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun call!63400 () ListLongMap!20033)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6067 (array!86210 array!86208 (_ BitVec 32) (_ BitVec 32) V!51229 V!51229 (_ BitVec 32) Int) ListLongMap!20033)

(assert (=> bm!63390 (= call!63400 (getCurrentListMapNoExtraKeys!6067 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63391 () Bool)

(declare-fun call!63393 () Unit!42947)

(declare-fun call!63391 () Unit!42947)

(assert (=> bm!63391 (= call!63393 call!63391)))

(declare-fun b!1296397 () Bool)

(declare-fun e!739603 () Bool)

(assert (=> b!1296397 (= e!739603 (not true))))

(declare-fun lt!580344 () Unit!42947)

(declare-fun e!739604 () Unit!42947)

(assert (=> b!1296397 (= lt!580344 e!739604)))

(declare-fun lt!580351 () Bool)

(assert (=> b!1296397 (= c!124387 (and (not lt!580351) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296397 (= lt!580351 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296397 (not (contains!8150 (ListLongMap!20034 Nil!29514) k!1205))))

(declare-fun lt!580342 () Unit!42947)

(declare-fun emptyContainsNothing!190 ((_ BitVec 64)) Unit!42947)

(assert (=> b!1296397 (= lt!580342 (emptyContainsNothing!190 k!1205))))

(declare-fun bm!63392 () Bool)

(declare-fun call!63390 () ListLongMap!20033)

(declare-fun +!4435 (ListLongMap!20033 tuple2!22376) ListLongMap!20033)

(assert (=> bm!63392 (= call!63390 (+!4435 (ite c!124387 lt!580340 (ite c!124385 lt!580343 lt!580345)) (ite c!124387 (tuple2!22377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124385 (tuple2!22377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1296398 () Bool)

(declare-fun res!861617 () Bool)

(assert (=> b!1296398 (=> (not res!861617) (not e!739603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296398 (= res!861617 (not (validKeyInArray!0 (select (arr!41606 _keys!1741) from!2144))))))

(declare-fun b!1296399 () Bool)

(declare-fun res!861619 () Bool)

(assert (=> b!1296399 (=> (not res!861619) (not e!739603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86210 (_ BitVec 32)) Bool)

(assert (=> b!1296399 (= res!861619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!861614 () Bool)

(assert (=> start!109466 (=> (not res!861614) (not e!739603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109466 (= res!861614 (validMask!0 mask!2175))))

(assert (=> start!109466 e!739603))

(assert (=> start!109466 tp_is_empty!34595))

(assert (=> start!109466 true))

(declare-fun e!739607 () Bool)

(declare-fun array_inv!31495 (array!86208) Bool)

(assert (=> start!109466 (and (array_inv!31495 _values!1445) e!739607)))

(declare-fun array_inv!31496 (array!86210) Bool)

(assert (=> start!109466 (array_inv!31496 _keys!1741)))

(assert (=> start!109466 tp!101984))

(declare-fun b!1296400 () Bool)

(declare-fun e!739605 () Unit!42947)

(declare-fun lt!580347 () Unit!42947)

(assert (=> b!1296400 (= e!739605 lt!580347)))

(declare-fun call!63395 () ListLongMap!20033)

(assert (=> b!1296400 (= lt!580345 call!63395)))

(declare-fun lt!580352 () Unit!42947)

(declare-fun call!63394 () Unit!42947)

(assert (=> b!1296400 (= lt!580352 call!63394)))

(assert (=> b!1296400 (not call!63396)))

(assert (=> b!1296400 (= lt!580347 call!63393)))

(declare-fun call!63397 () Bool)

(assert (=> b!1296400 call!63397))

(declare-fun b!1296401 () Bool)

(assert (=> b!1296401 (= e!739608 tp_is_empty!34595)))

(declare-fun bm!63393 () Bool)

(assert (=> bm!63393 (= call!63394 call!63392)))

(declare-fun b!1296402 () Bool)

(declare-fun c!124386 () Bool)

(assert (=> b!1296402 (= c!124386 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580351))))

(declare-fun e!739606 () Unit!42947)

(assert (=> b!1296402 (= e!739606 e!739605)))

(declare-fun bm!63394 () Bool)

(declare-fun call!63399 () Bool)

(assert (=> bm!63394 (= call!63397 call!63399)))

(declare-fun bm!63395 () Bool)

(assert (=> bm!63395 (= call!63395 call!63400)))

(declare-fun bm!63396 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!70 ((_ BitVec 64) (_ BitVec 64) V!51229 ListLongMap!20033) Unit!42947)

(assert (=> bm!63396 (= call!63391 (lemmaInListMapAfterAddingDiffThenInBefore!70 k!1205 (ite (or c!124387 c!124385) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124387 c!124385) zeroValue!1387 minValue!1387) (ite c!124387 lt!580340 (ite c!124385 lt!580343 lt!580345))))))

(declare-fun b!1296403 () Bool)

(declare-fun res!861620 () Bool)

(assert (=> b!1296403 (=> (not res!861620) (not e!739603))))

(assert (=> b!1296403 (= res!861620 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42156 _keys!1741))))))

(declare-fun b!1296404 () Bool)

(declare-fun lt!580349 () Unit!42947)

(assert (=> b!1296404 (= e!739604 lt!580349)))

(assert (=> b!1296404 (= lt!580340 call!63400)))

(declare-fun lt!580341 () Unit!42947)

(assert (=> b!1296404 (= lt!580341 (addStillNotContains!453 lt!580340 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(assert (=> b!1296404 (= lt!580346 (+!4435 lt!580340 (tuple2!22377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1296404 (not call!63398)))

(declare-fun lt!580337 () Unit!42947)

(assert (=> b!1296404 (= lt!580337 call!63392)))

(assert (=> b!1296404 (not (contains!8150 call!63390 k!1205))))

(declare-fun lt!580339 () Unit!42947)

(assert (=> b!1296404 (= lt!580339 (lemmaInListMapAfterAddingDiffThenInBefore!70 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580346))))

(assert (=> b!1296404 false))

(assert (=> b!1296404 (= lt!580349 call!63391)))

(declare-fun lt!580338 () Bool)

(assert (=> b!1296404 (= lt!580338 call!63399)))

(declare-fun b!1296405 () Bool)

(assert (=> b!1296405 (= e!739604 e!739606)))

(assert (=> b!1296405 (= c!124385 (and (not lt!580351) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63397 () Bool)

(assert (=> bm!63397 (= call!63401 call!63390)))

(declare-fun b!1296406 () Bool)

(assert (=> b!1296406 (= e!739607 (and e!739610 mapRes!53453))))

(declare-fun condMapEmpty!53453 () Bool)

(declare-fun mapDefault!53453 () ValueCell!16399)

