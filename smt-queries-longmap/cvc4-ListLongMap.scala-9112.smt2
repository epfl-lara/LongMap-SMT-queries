; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109460 () Bool)

(assert start!109460)

(declare-fun b_free!28949 () Bool)

(declare-fun b_next!28949 () Bool)

(assert (=> start!109460 (= b_free!28949 (not b_next!28949))))

(declare-fun tp!101965 () Bool)

(declare-fun b_and!47039 () Bool)

(assert (=> start!109460 (= tp!101965 b_and!47039)))

(declare-fun b!1296243 () Bool)

(declare-fun call!63287 () Bool)

(assert (=> b!1296243 call!63287))

(declare-datatypes ((Unit!42938 0))(
  ( (Unit!42939) )
))
(declare-fun lt!580193 () Unit!42938)

(declare-fun call!63292 () Unit!42938)

(assert (=> b!1296243 (= lt!580193 call!63292)))

(declare-fun call!63293 () Bool)

(assert (=> b!1296243 (not call!63293)))

(declare-fun lt!580200 () Unit!42938)

(declare-fun call!63289 () Unit!42938)

(assert (=> b!1296243 (= lt!580200 call!63289)))

(declare-datatypes ((V!51221 0))(
  ( (V!51222 (val!17369 Int)) )
))
(declare-datatypes ((tuple2!22370 0))(
  ( (tuple2!22371 (_1!11196 (_ BitVec 64)) (_2!11196 V!51221)) )
))
(declare-datatypes ((List!29512 0))(
  ( (Nil!29509) (Cons!29508 (h!30717 tuple2!22370) (t!43076 List!29512)) )
))
(declare-datatypes ((ListLongMap!20027 0))(
  ( (ListLongMap!20028 (toList!10029 List!29512)) )
))
(declare-fun lt!580201 () ListLongMap!20027)

(declare-fun call!63282 () ListLongMap!20027)

(assert (=> b!1296243 (= lt!580201 call!63282)))

(declare-fun e!739537 () Unit!42938)

(assert (=> b!1296243 (= e!739537 lt!580193)))

(declare-fun bm!63280 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580194 () ListLongMap!20027)

(declare-fun c!124360 () Bool)

(declare-fun call!63291 () Bool)

(declare-fun call!63284 () ListLongMap!20027)

(declare-fun contains!8147 (ListLongMap!20027 (_ BitVec 64)) Bool)

(assert (=> bm!63280 (= call!63291 (contains!8147 (ite c!124360 lt!580194 call!63284) k!1205))))

(declare-fun b!1296244 () Bool)

(declare-fun e!739531 () Bool)

(declare-fun tp_is_empty!34589 () Bool)

(assert (=> b!1296244 (= e!739531 tp_is_empty!34589)))

(declare-fun b!1296245 () Bool)

(declare-fun res!861546 () Bool)

(declare-fun e!739532 () Bool)

(assert (=> b!1296245 (=> (not res!861546) (not e!739532))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86196 0))(
  ( (array!86197 (arr!41599 (Array (_ BitVec 32) (_ BitVec 64))) (size!42149 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86196)

(assert (=> b!1296245 (= res!861546 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42149 _keys!1741))))))

(declare-fun b!1296246 () Bool)

(declare-fun res!861548 () Bool)

(assert (=> b!1296246 (=> (not res!861548) (not e!739532))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86196 (_ BitVec 32)) Bool)

(assert (=> b!1296246 (= res!861548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun minValue!1387 () V!51221)

(declare-fun lt!580208 () ListLongMap!20027)

(declare-fun c!124359 () Bool)

(declare-fun bm!63281 () Bool)

(declare-fun zeroValue!1387 () V!51221)

(declare-fun call!63290 () Unit!42938)

(declare-fun lt!580206 () ListLongMap!20027)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!67 ((_ BitVec 64) (_ BitVec 64) V!51221 ListLongMap!20027) Unit!42938)

(assert (=> bm!63281 (= call!63290 (lemmaInListMapAfterAddingDiffThenInBefore!67 k!1205 (ite (or c!124360 c!124359) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124360 c!124359) zeroValue!1387 minValue!1387) (ite c!124360 lt!580208 (ite c!124359 lt!580201 lt!580206))))))

(declare-fun bm!63282 () Bool)

(declare-fun call!63285 () ListLongMap!20027)

(assert (=> bm!63282 (= call!63284 call!63285)))

(declare-fun b!1296247 () Bool)

(declare-fun e!739535 () Unit!42938)

(assert (=> b!1296247 (= e!739535 e!739537)))

(declare-fun lt!580199 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296247 (= c!124359 (and (not lt!580199) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1296248 () Bool)

(declare-fun res!861547 () Bool)

(assert (=> b!1296248 (=> (not res!861547) (not e!739532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296248 (= res!861547 (not (validKeyInArray!0 (select (arr!41599 _keys!1741) from!2144))))))

(declare-fun bm!63283 () Bool)

(declare-fun call!63288 () Bool)

(assert (=> bm!63283 (= call!63287 call!63288)))

(declare-fun bm!63284 () Bool)

(declare-fun call!63286 () Unit!42938)

(assert (=> bm!63284 (= call!63289 call!63286)))

(declare-fun b!1296249 () Bool)

(declare-fun res!861543 () Bool)

(assert (=> b!1296249 (=> (not res!861543) (not e!739532))))

(declare-datatypes ((List!29513 0))(
  ( (Nil!29510) (Cons!29509 (h!30718 (_ BitVec 64)) (t!43077 List!29513)) )
))
(declare-fun arrayNoDuplicates!0 (array!86196 (_ BitVec 32) List!29513) Bool)

(assert (=> b!1296249 (= res!861543 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29510))))

(declare-fun bm!63279 () Bool)

(declare-fun +!4432 (ListLongMap!20027 tuple2!22370) ListLongMap!20027)

(assert (=> bm!63279 (= call!63285 (+!4432 (ite c!124360 lt!580208 (ite c!124359 lt!580201 lt!580206)) (ite c!124360 (tuple2!22371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124359 (tuple2!22371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun res!861542 () Bool)

(assert (=> start!109460 (=> (not res!861542) (not e!739532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109460 (= res!861542 (validMask!0 mask!2175))))

(assert (=> start!109460 e!739532))

(assert (=> start!109460 tp_is_empty!34589))

(assert (=> start!109460 true))

(declare-datatypes ((ValueCell!16396 0))(
  ( (ValueCellFull!16396 (v!19972 V!51221)) (EmptyCell!16396) )
))
(declare-datatypes ((array!86198 0))(
  ( (array!86199 (arr!41600 (Array (_ BitVec 32) ValueCell!16396)) (size!42150 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86198)

(declare-fun e!739538 () Bool)

(declare-fun array_inv!31489 (array!86198) Bool)

(assert (=> start!109460 (and (array_inv!31489 _values!1445) e!739538)))

(declare-fun array_inv!31490 (array!86196) Bool)

(assert (=> start!109460 (array_inv!31490 _keys!1741)))

(assert (=> start!109460 tp!101965))

(declare-fun b!1296250 () Bool)

(declare-fun res!861545 () Bool)

(assert (=> b!1296250 (=> (not res!861545) (not e!739532))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5061 (array!86196 array!86198 (_ BitVec 32) (_ BitVec 32) V!51221 V!51221 (_ BitVec 32) Int) ListLongMap!20027)

(assert (=> b!1296250 (= res!861545 (contains!8147 (getCurrentListMap!5061 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun bm!63285 () Bool)

(assert (=> bm!63285 (= call!63293 call!63291)))

(declare-fun b!1296251 () Bool)

(declare-fun res!861544 () Bool)

(assert (=> b!1296251 (=> (not res!861544) (not e!739532))))

(assert (=> b!1296251 (= res!861544 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42149 _keys!1741))))))

(declare-fun b!1296252 () Bool)

(assert (=> b!1296252 (= e!739532 (not true))))

(declare-fun lt!580195 () Unit!42938)

(assert (=> b!1296252 (= lt!580195 e!739535)))

(assert (=> b!1296252 (= c!124360 (and (not lt!580199) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296252 (= lt!580199 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1296252 (not (contains!8147 (ListLongMap!20028 Nil!29509) k!1205))))

(declare-fun lt!580203 () Unit!42938)

(declare-fun emptyContainsNothing!187 ((_ BitVec 64)) Unit!42938)

(assert (=> b!1296252 (= lt!580203 (emptyContainsNothing!187 k!1205))))

(declare-fun bm!63286 () Bool)

(declare-fun call!63283 () ListLongMap!20027)

(declare-fun getCurrentListMapNoExtraKeys!6064 (array!86196 array!86198 (_ BitVec 32) (_ BitVec 32) V!51221 V!51221 (_ BitVec 32) Int) ListLongMap!20027)

(assert (=> bm!63286 (= call!63283 (getCurrentListMapNoExtraKeys!6064 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63287 () Bool)

(assert (=> bm!63287 (= call!63288 (contains!8147 (ite c!124360 lt!580208 (ite c!124359 lt!580201 lt!580206)) k!1205))))

(declare-fun b!1296253 () Bool)

(declare-fun e!739533 () Unit!42938)

(declare-fun Unit!42940 () Unit!42938)

(assert (=> b!1296253 (= e!739533 Unit!42940)))

(declare-fun b!1296254 () Bool)

(declare-fun c!124358 () Bool)

(assert (=> b!1296254 (= c!124358 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580199))))

(assert (=> b!1296254 (= e!739537 e!739533)))

(declare-fun b!1296255 () Bool)

(declare-fun lt!580198 () Unit!42938)

(assert (=> b!1296255 (= e!739535 lt!580198)))

(assert (=> b!1296255 (= lt!580208 call!63283)))

(declare-fun lt!580205 () Unit!42938)

(assert (=> b!1296255 (= lt!580205 call!63286)))

(assert (=> b!1296255 (= lt!580194 (+!4432 lt!580208 (tuple2!22371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1296255 (not call!63291)))

(declare-fun lt!580202 () Unit!42938)

(declare-fun addStillNotContains!450 (ListLongMap!20027 (_ BitVec 64) V!51221 (_ BitVec 64)) Unit!42938)

(assert (=> b!1296255 (= lt!580202 (addStillNotContains!450 lt!580208 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1296255 (not (contains!8147 call!63285 k!1205))))

(declare-fun lt!580204 () Unit!42938)

(assert (=> b!1296255 (= lt!580204 (lemmaInListMapAfterAddingDiffThenInBefore!67 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580194))))

(assert (=> b!1296255 false))

(assert (=> b!1296255 (= lt!580198 call!63290)))

(declare-fun lt!580197 () Bool)

(assert (=> b!1296255 (= lt!580197 call!63288)))

(declare-fun bm!63288 () Bool)

(assert (=> bm!63288 (= call!63282 call!63283)))

(declare-fun b!1296256 () Bool)

(declare-fun res!861549 () Bool)

(assert (=> b!1296256 (=> (not res!861549) (not e!739532))))

(assert (=> b!1296256 (= res!861549 (and (= (size!42150 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42149 _keys!1741) (size!42150 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63289 () Bool)

(assert (=> bm!63289 (= call!63286 (addStillNotContains!450 (ite c!124360 lt!580208 (ite c!124359 lt!580201 lt!580206)) (ite (or c!124360 c!124359) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124360 c!124359) zeroValue!1387 minValue!1387) k!1205))))

(declare-fun mapIsEmpty!53444 () Bool)

(declare-fun mapRes!53444 () Bool)

(assert (=> mapIsEmpty!53444 mapRes!53444))

(declare-fun b!1296257 () Bool)

(declare-fun e!739536 () Bool)

(assert (=> b!1296257 (= e!739536 tp_is_empty!34589)))

(declare-fun bm!63290 () Bool)

(assert (=> bm!63290 (= call!63292 call!63290)))

(declare-fun b!1296258 () Bool)

(assert (=> b!1296258 (= e!739538 (and e!739531 mapRes!53444))))

(declare-fun condMapEmpty!53444 () Bool)

(declare-fun mapDefault!53444 () ValueCell!16396)

