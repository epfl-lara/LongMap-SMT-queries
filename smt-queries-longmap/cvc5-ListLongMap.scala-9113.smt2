; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109462 () Bool)

(assert start!109462)

(declare-fun b_free!28951 () Bool)

(declare-fun b_next!28951 () Bool)

(assert (=> start!109462 (= b_free!28951 (not b_next!28951))))

(declare-fun tp!101971 () Bool)

(declare-fun b_and!47041 () Bool)

(assert (=> start!109462 (= tp!101971 b_and!47041)))

(declare-fun mapNonEmpty!53447 () Bool)

(declare-fun mapRes!53447 () Bool)

(declare-fun tp!101972 () Bool)

(declare-fun e!739561 () Bool)

(assert (=> mapNonEmpty!53447 (= mapRes!53447 (and tp!101972 e!739561))))

(declare-datatypes ((V!51225 0))(
  ( (V!51226 (val!17370 Int)) )
))
(declare-datatypes ((ValueCell!16397 0))(
  ( (ValueCellFull!16397 (v!19973 V!51225)) (EmptyCell!16397) )
))
(declare-fun mapValue!53447 () ValueCell!16397)

(declare-fun mapKey!53447 () (_ BitVec 32))

(declare-datatypes ((array!86200 0))(
  ( (array!86201 (arr!41601 (Array (_ BitVec 32) ValueCell!16397)) (size!42151 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86200)

(declare-fun mapRest!53447 () (Array (_ BitVec 32) ValueCell!16397))

(assert (=> mapNonEmpty!53447 (= (arr!41601 _values!1445) (store mapRest!53447 mapKey!53447 mapValue!53447))))

(declare-fun bm!63315 () Bool)

(declare-datatypes ((tuple2!22372 0))(
  ( (tuple2!22373 (_1!11197 (_ BitVec 64)) (_2!11197 V!51225)) )
))
(declare-datatypes ((List!29514 0))(
  ( (Nil!29511) (Cons!29510 (h!30719 tuple2!22372) (t!43078 List!29514)) )
))
(declare-datatypes ((ListLongMap!20029 0))(
  ( (ListLongMap!20030 (toList!10030 List!29514)) )
))
(declare-fun call!63326 () ListLongMap!20029)

(declare-fun call!63325 () ListLongMap!20029)

(assert (=> bm!63315 (= call!63326 call!63325)))

(declare-fun bm!63316 () Bool)

(declare-datatypes ((Unit!42941 0))(
  ( (Unit!42942) )
))
(declare-fun call!63321 () Unit!42941)

(declare-fun call!63320 () Unit!42941)

(assert (=> bm!63316 (= call!63321 call!63320)))

(declare-fun b!1296294 () Bool)

(declare-fun e!739556 () Unit!42941)

(declare-fun lt!580255 () Unit!42941)

(assert (=> b!1296294 (= e!739556 lt!580255)))

(declare-fun lt!580241 () ListLongMap!20029)

(declare-fun call!63328 () ListLongMap!20029)

(assert (=> b!1296294 (= lt!580241 call!63328)))

(declare-fun lt!580243 () Unit!42941)

(declare-fun call!63327 () Unit!42941)

(assert (=> b!1296294 (= lt!580243 call!63327)))

(declare-fun lt!580245 () ListLongMap!20029)

(assert (=> b!1296294 (= lt!580245 call!63325)))

(declare-fun call!63324 () Bool)

(assert (=> b!1296294 (not call!63324)))

(declare-fun minValue!1387 () V!51225)

(declare-fun lt!580253 () Unit!42941)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun addStillNotContains!451 (ListLongMap!20029 (_ BitVec 64) V!51225 (_ BitVec 64)) Unit!42941)

(assert (=> b!1296294 (= lt!580253 (addStillNotContains!451 lt!580241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun contains!8148 (ListLongMap!20029 (_ BitVec 64)) Bool)

(declare-fun +!4433 (ListLongMap!20029 tuple2!22372) ListLongMap!20029)

(assert (=> b!1296294 (not (contains!8148 (+!4433 lt!580241 (tuple2!22373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!580249 () Unit!42941)

(assert (=> b!1296294 (= lt!580249 call!63320)))

(assert (=> b!1296294 false))

(declare-fun zeroValue!1387 () V!51225)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!68 ((_ BitVec 64) (_ BitVec 64) V!51225 ListLongMap!20029) Unit!42941)

(assert (=> b!1296294 (= lt!580255 (lemmaInListMapAfterAddingDiffThenInBefore!68 k!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!580241))))

(declare-fun lt!580256 () Bool)

(declare-fun call!63322 () Bool)

(assert (=> b!1296294 (= lt!580256 call!63322)))

(declare-fun b!1296295 () Bool)

(declare-fun res!861570 () Bool)

(declare-fun e!739555 () Bool)

(assert (=> b!1296295 (=> (not res!861570) (not e!739555))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86202 0))(
  ( (array!86203 (arr!41602 (Array (_ BitVec 32) (_ BitVec 64))) (size!42152 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86202)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!5062 (array!86202 array!86200 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> b!1296295 (= res!861570 (contains!8148 (getCurrentListMap!5062 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296297 () Bool)

(declare-fun tp_is_empty!34591 () Bool)

(assert (=> b!1296297 (= e!739561 tp_is_empty!34591)))

(declare-fun mapIsEmpty!53447 () Bool)

(assert (=> mapIsEmpty!53447 mapRes!53447))

(declare-fun bm!63317 () Bool)

(declare-fun call!63318 () Bool)

(assert (=> bm!63317 (= call!63318 call!63322)))

(declare-fun b!1296298 () Bool)

(assert (=> b!1296298 (= e!739555 (not true))))

(declare-fun lt!580248 () Unit!42941)

(assert (=> b!1296298 (= lt!580248 e!739556)))

(declare-fun c!124368 () Bool)

(declare-fun lt!580244 () Bool)

(assert (=> b!1296298 (= c!124368 (and (not lt!580244) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296298 (= lt!580244 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296298 (not (contains!8148 (ListLongMap!20030 Nil!29511) k!1205))))

(declare-fun lt!580246 () Unit!42941)

(declare-fun emptyContainsNothing!188 ((_ BitVec 64)) Unit!42941)

(assert (=> b!1296298 (= lt!580246 (emptyContainsNothing!188 k!1205))))

(declare-fun b!1296299 () Bool)

(declare-fun e!739559 () Unit!42941)

(declare-fun lt!580254 () Unit!42941)

(assert (=> b!1296299 (= e!739559 lt!580254)))

(declare-fun lt!580247 () ListLongMap!20029)

(declare-fun call!63329 () ListLongMap!20029)

(assert (=> b!1296299 (= lt!580247 call!63329)))

(declare-fun lt!580251 () Unit!42941)

(declare-fun call!63319 () Unit!42941)

(assert (=> b!1296299 (= lt!580251 call!63319)))

(assert (=> b!1296299 (not call!63318)))

(assert (=> b!1296299 (= lt!580254 call!63321)))

(declare-fun call!63323 () Bool)

(assert (=> b!1296299 call!63323))

(declare-fun b!1296300 () Bool)

(declare-fun res!861571 () Bool)

(assert (=> b!1296300 (=> (not res!861571) (not e!739555))))

(assert (=> b!1296300 (= res!861571 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42152 _keys!1741))))))

(declare-fun bm!63318 () Bool)

(declare-fun c!124369 () Bool)

(declare-fun lt!580252 () ListLongMap!20029)

(assert (=> bm!63318 (= call!63327 (addStillNotContains!451 (ite c!124368 lt!580241 (ite c!124369 lt!580252 lt!580247)) (ite (or c!124368 c!124369) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124368 c!124369) zeroValue!1387 minValue!1387) k!1205))))

(declare-fun b!1296301 () Bool)

(declare-fun res!861568 () Bool)

(assert (=> b!1296301 (=> (not res!861568) (not e!739555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296301 (= res!861568 (not (validKeyInArray!0 (select (arr!41602 _keys!1741) from!2144))))))

(declare-fun b!1296302 () Bool)

(declare-fun res!861567 () Bool)

(assert (=> b!1296302 (=> (not res!861567) (not e!739555))))

(assert (=> b!1296302 (= res!861567 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42152 _keys!1741))))))

(declare-fun bm!63319 () Bool)

(assert (=> bm!63319 (= call!63320 (lemmaInListMapAfterAddingDiffThenInBefore!68 k!1205 (ite c!124368 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124369 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124368 minValue!1387 (ite c!124369 zeroValue!1387 minValue!1387)) (ite c!124368 lt!580245 (ite c!124369 lt!580252 lt!580247))))))

(declare-fun b!1296303 () Bool)

(declare-fun e!739560 () Bool)

(assert (=> b!1296303 (= e!739560 tp_is_empty!34591)))

(declare-fun bm!63320 () Bool)

(assert (=> bm!63320 (= call!63324 (contains!8148 (ite c!124368 lt!580245 (ite c!124369 lt!580252 lt!580247)) k!1205))))

(declare-fun b!1296296 () Bool)

(declare-fun res!861573 () Bool)

(assert (=> b!1296296 (=> (not res!861573) (not e!739555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86202 (_ BitVec 32)) Bool)

(assert (=> b!1296296 (= res!861573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!861569 () Bool)

(assert (=> start!109462 (=> (not res!861569) (not e!739555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109462 (= res!861569 (validMask!0 mask!2175))))

(assert (=> start!109462 e!739555))

(assert (=> start!109462 tp_is_empty!34591))

(assert (=> start!109462 true))

(declare-fun e!739558 () Bool)

(declare-fun array_inv!31491 (array!86200) Bool)

(assert (=> start!109462 (and (array_inv!31491 _values!1445) e!739558)))

(declare-fun array_inv!31492 (array!86202) Bool)

(assert (=> start!109462 (array_inv!31492 _keys!1741)))

(assert (=> start!109462 tp!101971))

(declare-fun bm!63321 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6065 (array!86202 array!86200 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> bm!63321 (= call!63328 (getCurrentListMapNoExtraKeys!6065 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296304 () Bool)

(assert (=> b!1296304 call!63323))

(declare-fun lt!580242 () Unit!42941)

(assert (=> b!1296304 (= lt!580242 call!63321)))

(assert (=> b!1296304 (not call!63318)))

(declare-fun lt!580250 () Unit!42941)

(assert (=> b!1296304 (= lt!580250 call!63319)))

(assert (=> b!1296304 (= lt!580252 call!63329)))

(declare-fun e!739557 () Unit!42941)

(assert (=> b!1296304 (= e!739557 lt!580242)))

(declare-fun b!1296305 () Bool)

(declare-fun Unit!42943 () Unit!42941)

(assert (=> b!1296305 (= e!739559 Unit!42943)))

(declare-fun b!1296306 () Bool)

(assert (=> b!1296306 (= e!739556 e!739557)))

(assert (=> b!1296306 (= c!124369 (and (not lt!580244) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1296307 () Bool)

(assert (=> b!1296307 (= e!739558 (and e!739560 mapRes!53447))))

(declare-fun condMapEmpty!53447 () Bool)

(declare-fun mapDefault!53447 () ValueCell!16397)

