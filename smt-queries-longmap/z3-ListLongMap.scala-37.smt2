; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!656 () Bool)

(assert start!656)

(declare-fun b_free!129 () Bool)

(declare-fun b_next!129 () Bool)

(assert (=> start!656 (= b_free!129 (not b_next!129))))

(declare-fun tp!604 () Bool)

(declare-fun b_and!267 () Bool)

(assert (=> start!656 (= tp!604 b_and!267)))

(declare-fun b!4344 () Bool)

(declare-fun res!5686 () Bool)

(declare-fun e!2282 () Bool)

(assert (=> b!4344 (=> (not res!5686) (not e!2282))))

(declare-datatypes ((array!345 0))(
  ( (array!346 (arr!165 (Array (_ BitVec 32) (_ BitVec 64))) (size!227 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!345)

(declare-datatypes ((List!103 0))(
  ( (Nil!100) (Cons!99 (h!665 (_ BitVec 64)) (t!2230 List!103)) )
))
(declare-fun arrayNoDuplicates!0 (array!345 (_ BitVec 32) List!103) Bool)

(assert (=> b!4344 (= res!5686 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!100))))

(declare-fun b!4345 () Bool)

(declare-fun e!2281 () Bool)

(declare-fun tp_is_empty!207 () Bool)

(assert (=> b!4345 (= e!2281 tp_is_empty!207)))

(declare-fun b!4346 () Bool)

(assert (=> b!4346 (= e!2282 (not (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806))))))

(declare-fun e!2280 () Bool)

(assert (=> b!4346 e!2280))

(declare-fun c!206 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!4346 (= c!206 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!453 0))(
  ( (V!454 (val!109 Int)) )
))
(declare-datatypes ((ValueCell!87 0))(
  ( (ValueCellFull!87 (v!1196 V!453)) (EmptyCell!87) )
))
(declare-datatypes ((array!347 0))(
  ( (array!348 (arr!166 (Array (_ BitVec 32) ValueCell!87)) (size!228 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!347)

(declare-fun minValue!1434 () V!453)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((Unit!37 0))(
  ( (Unit!38) )
))
(declare-fun lt!594 () Unit!37)

(declare-fun zeroValue!1434 () V!453)

(declare-fun lemmaKeyInListMapIsInArray!8 (array!345 array!347 (_ BitVec 32) (_ BitVec 32) V!453 V!453 (_ BitVec 64) Int) Unit!37)

(assert (=> b!4346 (= lt!594 (lemmaKeyInListMapIsInArray!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4347 () Bool)

(declare-fun res!5681 () Bool)

(assert (=> b!4347 (=> (not res!5681) (not e!2282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!345 (_ BitVec 32)) Bool)

(assert (=> b!4347 (= res!5681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!269 () Bool)

(declare-fun mapRes!269 () Bool)

(declare-fun tp!605 () Bool)

(declare-fun e!2284 () Bool)

(assert (=> mapNonEmpty!269 (= mapRes!269 (and tp!605 e!2284))))

(declare-fun mapRest!269 () (Array (_ BitVec 32) ValueCell!87))

(declare-fun mapKey!269 () (_ BitVec 32))

(declare-fun mapValue!269 () ValueCell!87)

(assert (=> mapNonEmpty!269 (= (arr!166 _values!1492) (store mapRest!269 mapKey!269 mapValue!269))))

(declare-fun b!4348 () Bool)

(assert (=> b!4348 (= e!2284 tp_is_empty!207)))

(declare-fun mapIsEmpty!269 () Bool)

(assert (=> mapIsEmpty!269 mapRes!269))

(declare-fun res!5682 () Bool)

(assert (=> start!656 (=> (not res!5682) (not e!2282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!656 (= res!5682 (validMask!0 mask!2250))))

(assert (=> start!656 e!2282))

(assert (=> start!656 tp!604))

(assert (=> start!656 true))

(declare-fun e!2283 () Bool)

(declare-fun array_inv!119 (array!347) Bool)

(assert (=> start!656 (and (array_inv!119 _values!1492) e!2283)))

(assert (=> start!656 tp_is_empty!207))

(declare-fun array_inv!120 (array!345) Bool)

(assert (=> start!656 (array_inv!120 _keys!1806)))

(declare-fun b!4349 () Bool)

(declare-fun res!5684 () Bool)

(assert (=> b!4349 (=> (not res!5684) (not e!2282))))

(declare-datatypes ((tuple2!94 0))(
  ( (tuple2!95 (_1!47 (_ BitVec 64)) (_2!47 V!453)) )
))
(declare-datatypes ((List!104 0))(
  ( (Nil!101) (Cons!100 (h!666 tuple2!94) (t!2231 List!104)) )
))
(declare-datatypes ((ListLongMap!99 0))(
  ( (ListLongMap!100 (toList!65 List!104)) )
))
(declare-fun contains!35 (ListLongMap!99 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!24 (array!345 array!347 (_ BitVec 32) (_ BitVec 32) V!453 V!453 (_ BitVec 32) Int) ListLongMap!99)

(assert (=> b!4349 (= res!5684 (contains!35 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4350 () Bool)

(assert (=> b!4350 (= e!2283 (and e!2281 mapRes!269))))

(declare-fun condMapEmpty!269 () Bool)

(declare-fun mapDefault!269 () ValueCell!87)

(assert (=> b!4350 (= condMapEmpty!269 (= (arr!166 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!87)) mapDefault!269)))))

(declare-fun b!4351 () Bool)

(declare-fun res!5683 () Bool)

(assert (=> b!4351 (=> (not res!5683) (not e!2282))))

(assert (=> b!4351 (= res!5683 (and (= (size!228 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!227 _keys!1806) (size!228 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4352 () Bool)

(declare-fun res!5685 () Bool)

(assert (=> b!4352 (=> (not res!5685) (not e!2282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4352 (= res!5685 (validKeyInArray!0 k0!1278))))

(declare-fun b!4353 () Bool)

(declare-fun arrayContainsKey!0 (array!345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4353 (= e!2280 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4354 () Bool)

(assert (=> b!4354 (= e!2280 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!656 res!5682) b!4351))

(assert (= (and b!4351 res!5683) b!4347))

(assert (= (and b!4347 res!5681) b!4344))

(assert (= (and b!4344 res!5686) b!4349))

(assert (= (and b!4349 res!5684) b!4352))

(assert (= (and b!4352 res!5685) b!4346))

(assert (= (and b!4346 c!206) b!4353))

(assert (= (and b!4346 (not c!206)) b!4354))

(assert (= (and b!4350 condMapEmpty!269) mapIsEmpty!269))

(assert (= (and b!4350 (not condMapEmpty!269)) mapNonEmpty!269))

(get-info :version)

(assert (= (and mapNonEmpty!269 ((_ is ValueCellFull!87) mapValue!269)) b!4348))

(assert (= (and b!4350 ((_ is ValueCellFull!87) mapDefault!269)) b!4345))

(assert (= start!656 b!4350))

(declare-fun m!2295 () Bool)

(assert (=> b!4346 m!2295))

(declare-fun m!2297 () Bool)

(assert (=> mapNonEmpty!269 m!2297))

(declare-fun m!2299 () Bool)

(assert (=> start!656 m!2299))

(declare-fun m!2301 () Bool)

(assert (=> start!656 m!2301))

(declare-fun m!2303 () Bool)

(assert (=> start!656 m!2303))

(declare-fun m!2305 () Bool)

(assert (=> b!4352 m!2305))

(declare-fun m!2307 () Bool)

(assert (=> b!4349 m!2307))

(assert (=> b!4349 m!2307))

(declare-fun m!2309 () Bool)

(assert (=> b!4349 m!2309))

(declare-fun m!2311 () Bool)

(assert (=> b!4347 m!2311))

(declare-fun m!2313 () Bool)

(assert (=> b!4353 m!2313))

(declare-fun m!2315 () Bool)

(assert (=> b!4344 m!2315))

(check-sat b_and!267 (not b!4353) tp_is_empty!207 (not mapNonEmpty!269) (not start!656) (not b!4349) (not b_next!129) (not b!4347) (not b!4346) (not b!4344) (not b!4352))
(check-sat b_and!267 (not b_next!129))
(get-model)

(declare-fun d!669 () Bool)

(declare-fun res!5709 () Bool)

(declare-fun e!2308 () Bool)

(assert (=> d!669 (=> res!5709 e!2308)))

(assert (=> d!669 (= res!5709 (= (select (arr!165 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!669 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2308)))

(declare-fun b!4392 () Bool)

(declare-fun e!2309 () Bool)

(assert (=> b!4392 (= e!2308 e!2309)))

(declare-fun res!5710 () Bool)

(assert (=> b!4392 (=> (not res!5710) (not e!2309))))

(assert (=> b!4392 (= res!5710 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!227 _keys!1806)))))

(declare-fun b!4393 () Bool)

(assert (=> b!4393 (= e!2309 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!669 (not res!5709)) b!4392))

(assert (= (and b!4392 res!5710) b!4393))

(declare-fun m!2339 () Bool)

(assert (=> d!669 m!2339))

(declare-fun m!2341 () Bool)

(assert (=> b!4393 m!2341))

(assert (=> b!4353 d!669))

(declare-fun b!4404 () Bool)

(declare-fun e!2318 () Bool)

(declare-fun call!50 () Bool)

(assert (=> b!4404 (= e!2318 call!50)))

(declare-fun b!4405 () Bool)

(declare-fun e!2320 () Bool)

(declare-fun e!2321 () Bool)

(assert (=> b!4405 (= e!2320 e!2321)))

(declare-fun res!5718 () Bool)

(assert (=> b!4405 (=> (not res!5718) (not e!2321))))

(declare-fun e!2319 () Bool)

(assert (=> b!4405 (= res!5718 (not e!2319))))

(declare-fun res!5719 () Bool)

(assert (=> b!4405 (=> (not res!5719) (not e!2319))))

(assert (=> b!4405 (= res!5719 (validKeyInArray!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!671 () Bool)

(declare-fun res!5717 () Bool)

(assert (=> d!671 (=> res!5717 e!2320)))

(assert (=> d!671 (= res!5717 (bvsge #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(assert (=> d!671 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!100) e!2320)))

(declare-fun bm!47 () Bool)

(declare-fun c!212 () Bool)

(assert (=> bm!47 (= call!50 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!212 (Cons!99 (select (arr!165 _keys!1806) #b00000000000000000000000000000000) Nil!100) Nil!100)))))

(declare-fun b!4406 () Bool)

(assert (=> b!4406 (= e!2318 call!50)))

(declare-fun b!4407 () Bool)

(declare-fun contains!37 (List!103 (_ BitVec 64)) Bool)

(assert (=> b!4407 (= e!2319 (contains!37 Nil!100 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4408 () Bool)

(assert (=> b!4408 (= e!2321 e!2318)))

(assert (=> b!4408 (= c!212 (validKeyInArray!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!671 (not res!5717)) b!4405))

(assert (= (and b!4405 res!5719) b!4407))

(assert (= (and b!4405 res!5718) b!4408))

(assert (= (and b!4408 c!212) b!4406))

(assert (= (and b!4408 (not c!212)) b!4404))

(assert (= (or b!4406 b!4404) bm!47))

(assert (=> b!4405 m!2339))

(assert (=> b!4405 m!2339))

(declare-fun m!2343 () Bool)

(assert (=> b!4405 m!2343))

(assert (=> bm!47 m!2339))

(declare-fun m!2345 () Bool)

(assert (=> bm!47 m!2345))

(assert (=> b!4407 m!2339))

(assert (=> b!4407 m!2339))

(declare-fun m!2347 () Bool)

(assert (=> b!4407 m!2347))

(assert (=> b!4408 m!2339))

(assert (=> b!4408 m!2339))

(assert (=> b!4408 m!2343))

(assert (=> b!4344 d!671))

(declare-fun d!673 () Bool)

(assert (=> d!673 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4352 d!673))

(declare-fun d!675 () Bool)

(declare-fun e!2327 () Bool)

(assert (=> d!675 e!2327))

(declare-fun res!5722 () Bool)

(assert (=> d!675 (=> res!5722 e!2327)))

(declare-fun lt!609 () Bool)

(assert (=> d!675 (= res!5722 (not lt!609))))

(declare-fun lt!606 () Bool)

(assert (=> d!675 (= lt!609 lt!606)))

(declare-fun lt!607 () Unit!37)

(declare-fun e!2326 () Unit!37)

(assert (=> d!675 (= lt!607 e!2326)))

(declare-fun c!215 () Bool)

(assert (=> d!675 (= c!215 lt!606)))

(declare-fun containsKey!1 (List!104 (_ BitVec 64)) Bool)

(assert (=> d!675 (= lt!606 (containsKey!1 (toList!65 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!675 (= (contains!35 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!609)))

(declare-fun b!4415 () Bool)

(declare-fun lt!608 () Unit!37)

(assert (=> b!4415 (= e!2326 lt!608)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!1 (List!104 (_ BitVec 64)) Unit!37)

(assert (=> b!4415 (= lt!608 (lemmaContainsKeyImpliesGetValueByKeyDefined!1 (toList!65 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!13 0))(
  ( (Some!12 (v!1198 V!453)) (None!11) )
))
(declare-fun isDefined!2 (Option!13) Bool)

(declare-fun getValueByKey!7 (List!104 (_ BitVec 64)) Option!13)

(assert (=> b!4415 (isDefined!2 (getValueByKey!7 (toList!65 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!4416 () Bool)

(declare-fun Unit!41 () Unit!37)

(assert (=> b!4416 (= e!2326 Unit!41)))

(declare-fun b!4417 () Bool)

(assert (=> b!4417 (= e!2327 (isDefined!2 (getValueByKey!7 (toList!65 (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!675 c!215) b!4415))

(assert (= (and d!675 (not c!215)) b!4416))

(assert (= (and d!675 (not res!5722)) b!4417))

(declare-fun m!2349 () Bool)

(assert (=> d!675 m!2349))

(declare-fun m!2351 () Bool)

(assert (=> b!4415 m!2351))

(declare-fun m!2353 () Bool)

(assert (=> b!4415 m!2353))

(assert (=> b!4415 m!2353))

(declare-fun m!2355 () Bool)

(assert (=> b!4415 m!2355))

(assert (=> b!4417 m!2353))

(assert (=> b!4417 m!2353))

(assert (=> b!4417 m!2355))

(assert (=> b!4349 d!675))

(declare-fun b!4460 () Bool)

(declare-fun res!5746 () Bool)

(declare-fun e!2362 () Bool)

(assert (=> b!4460 (=> (not res!5746) (not e!2362))))

(declare-fun e!2360 () Bool)

(assert (=> b!4460 (= res!5746 e!2360)))

(declare-fun c!233 () Bool)

(assert (=> b!4460 (= c!233 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62 () Bool)

(declare-fun call!67 () ListLongMap!99)

(declare-fun call!68 () ListLongMap!99)

(assert (=> bm!62 (= call!67 call!68)))

(declare-fun b!4461 () Bool)

(declare-fun e!2364 () ListLongMap!99)

(declare-fun call!65 () ListLongMap!99)

(assert (=> b!4461 (= e!2364 call!65)))

(declare-fun c!231 () Bool)

(declare-fun call!66 () ListLongMap!99)

(declare-fun c!232 () Bool)

(declare-fun bm!63 () Bool)

(declare-fun call!71 () ListLongMap!99)

(declare-fun +!4 (ListLongMap!99 tuple2!94) ListLongMap!99)

(assert (=> bm!63 (= call!66 (+!4 (ite c!232 call!71 (ite c!231 call!68 call!67)) (ite (or c!232 c!231) (tuple2!95 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!95 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun bm!64 () Bool)

(assert (=> bm!64 (= call!65 call!66)))

(declare-fun b!4462 () Bool)

(declare-fun e!2363 () Bool)

(declare-fun lt!670 () ListLongMap!99)

(declare-fun apply!17 (ListLongMap!99 (_ BitVec 64)) V!453)

(assert (=> b!4462 (= e!2363 (= (apply!17 lt!670 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!4463 () Bool)

(declare-fun e!2366 () Bool)

(assert (=> b!4463 (= e!2366 e!2363)))

(declare-fun res!5749 () Bool)

(declare-fun call!70 () Bool)

(assert (=> b!4463 (= res!5749 call!70)))

(assert (=> b!4463 (=> (not res!5749) (not e!2363))))

(declare-fun b!4464 () Bool)

(declare-fun e!2356 () Bool)

(declare-fun get!87 (ValueCell!87 V!453) V!453)

(declare-fun dynLambda!39 (Int (_ BitVec 64)) V!453)

(assert (=> b!4464 (= e!2356 (= (apply!17 lt!670 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)) (get!87 (select (arr!166 _values!1492) #b00000000000000000000000000000000) (dynLambda!39 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4464 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!228 _values!1492)))))

(assert (=> b!4464 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(declare-fun b!4465 () Bool)

(declare-fun e!2361 () Bool)

(assert (=> b!4465 (= e!2361 (validKeyInArray!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!65 () Bool)

(assert (=> bm!65 (= call!68 call!71)))

(declare-fun b!4466 () Bool)

(declare-fun e!2359 () Bool)

(assert (=> b!4466 (= e!2359 (= (apply!17 lt!670 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!4467 () Bool)

(declare-fun call!69 () Bool)

(assert (=> b!4467 (= e!2360 (not call!69))))

(declare-fun b!4468 () Bool)

(declare-fun e!2358 () ListLongMap!99)

(assert (=> b!4468 (= e!2358 call!65)))

(declare-fun bm!66 () Bool)

(assert (=> bm!66 (= call!70 (contains!35 lt!670 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4469 () Bool)

(declare-fun e!2355 () ListLongMap!99)

(assert (=> b!4469 (= e!2355 e!2358)))

(assert (=> b!4469 (= c!231 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!4470 () Bool)

(assert (=> b!4470 (= e!2364 call!67)))

(declare-fun b!4471 () Bool)

(declare-fun e!2357 () Bool)

(assert (=> b!4471 (= e!2357 (validKeyInArray!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!67 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1 (array!345 array!347 (_ BitVec 32) (_ BitVec 32) V!453 V!453 (_ BitVec 32) Int) ListLongMap!99)

(assert (=> bm!67 (= call!71 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!4472 () Bool)

(assert (=> b!4472 (= e!2360 e!2359)))

(declare-fun res!5747 () Bool)

(assert (=> b!4472 (= res!5747 call!69)))

(assert (=> b!4472 (=> (not res!5747) (not e!2359))))

(declare-fun b!4473 () Bool)

(declare-fun c!228 () Bool)

(assert (=> b!4473 (= c!228 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!4473 (= e!2358 e!2364)))

(declare-fun b!4474 () Bool)

(declare-fun e!2365 () Bool)

(assert (=> b!4474 (= e!2365 e!2356)))

(declare-fun res!5741 () Bool)

(assert (=> b!4474 (=> (not res!5741) (not e!2356))))

(assert (=> b!4474 (= res!5741 (contains!35 lt!670 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!4474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(declare-fun b!4475 () Bool)

(assert (=> b!4475 (= e!2355 (+!4 call!66 (tuple2!95 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!4476 () Bool)

(declare-fun e!2354 () Unit!37)

(declare-fun lt!675 () Unit!37)

(assert (=> b!4476 (= e!2354 lt!675)))

(declare-fun lt!671 () ListLongMap!99)

(assert (=> b!4476 (= lt!671 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!663 () (_ BitVec 64))

(assert (=> b!4476 (= lt!663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!661 () (_ BitVec 64))

(assert (=> b!4476 (= lt!661 (select (arr!165 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!665 () Unit!37)

(declare-fun addStillContains!2 (ListLongMap!99 (_ BitVec 64) V!453 (_ BitVec 64)) Unit!37)

(assert (=> b!4476 (= lt!665 (addStillContains!2 lt!671 lt!663 zeroValue!1434 lt!661))))

(assert (=> b!4476 (contains!35 (+!4 lt!671 (tuple2!95 lt!663 zeroValue!1434)) lt!661)))

(declare-fun lt!662 () Unit!37)

(assert (=> b!4476 (= lt!662 lt!665)))

(declare-fun lt!656 () ListLongMap!99)

(assert (=> b!4476 (= lt!656 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!658 () (_ BitVec 64))

(assert (=> b!4476 (= lt!658 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!660 () (_ BitVec 64))

(assert (=> b!4476 (= lt!660 (select (arr!165 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!664 () Unit!37)

(declare-fun addApplyDifferent!2 (ListLongMap!99 (_ BitVec 64) V!453 (_ BitVec 64)) Unit!37)

(assert (=> b!4476 (= lt!664 (addApplyDifferent!2 lt!656 lt!658 minValue!1434 lt!660))))

(assert (=> b!4476 (= (apply!17 (+!4 lt!656 (tuple2!95 lt!658 minValue!1434)) lt!660) (apply!17 lt!656 lt!660))))

(declare-fun lt!666 () Unit!37)

(assert (=> b!4476 (= lt!666 lt!664)))

(declare-fun lt!674 () ListLongMap!99)

(assert (=> b!4476 (= lt!674 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!672 () (_ BitVec 64))

(assert (=> b!4476 (= lt!672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!654 () (_ BitVec 64))

(assert (=> b!4476 (= lt!654 (select (arr!165 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!655 () Unit!37)

(assert (=> b!4476 (= lt!655 (addApplyDifferent!2 lt!674 lt!672 zeroValue!1434 lt!654))))

(assert (=> b!4476 (= (apply!17 (+!4 lt!674 (tuple2!95 lt!672 zeroValue!1434)) lt!654) (apply!17 lt!674 lt!654))))

(declare-fun lt!657 () Unit!37)

(assert (=> b!4476 (= lt!657 lt!655)))

(declare-fun lt!673 () ListLongMap!99)

(assert (=> b!4476 (= lt!673 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!669 () (_ BitVec 64))

(assert (=> b!4476 (= lt!669 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!659 () (_ BitVec 64))

(assert (=> b!4476 (= lt!659 (select (arr!165 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!4476 (= lt!675 (addApplyDifferent!2 lt!673 lt!669 minValue!1434 lt!659))))

(assert (=> b!4476 (= (apply!17 (+!4 lt!673 (tuple2!95 lt!669 minValue!1434)) lt!659) (apply!17 lt!673 lt!659))))

(declare-fun b!4477 () Bool)

(declare-fun res!5744 () Bool)

(assert (=> b!4477 (=> (not res!5744) (not e!2362))))

(assert (=> b!4477 (= res!5744 e!2365)))

(declare-fun res!5743 () Bool)

(assert (=> b!4477 (=> res!5743 e!2365)))

(assert (=> b!4477 (= res!5743 (not e!2361))))

(declare-fun res!5748 () Bool)

(assert (=> b!4477 (=> (not res!5748) (not e!2361))))

(assert (=> b!4477 (= res!5748 (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(declare-fun d!677 () Bool)

(assert (=> d!677 e!2362))

(declare-fun res!5745 () Bool)

(assert (=> d!677 (=> (not res!5745) (not e!2362))))

(assert (=> d!677 (= res!5745 (or (bvsge #b00000000000000000000000000000000 (size!227 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806)))))))

(declare-fun lt!667 () ListLongMap!99)

(assert (=> d!677 (= lt!670 lt!667)))

(declare-fun lt!668 () Unit!37)

(assert (=> d!677 (= lt!668 e!2354)))

(declare-fun c!229 () Bool)

(assert (=> d!677 (= c!229 e!2357)))

(declare-fun res!5742 () Bool)

(assert (=> d!677 (=> (not res!5742) (not e!2357))))

(assert (=> d!677 (= res!5742 (bvslt #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(assert (=> d!677 (= lt!667 e!2355)))

(assert (=> d!677 (= c!232 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!677 (validMask!0 mask!2250)))

(assert (=> d!677 (= (getCurrentListMap!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!670)))

(declare-fun b!4478 () Bool)

(declare-fun Unit!42 () Unit!37)

(assert (=> b!4478 (= e!2354 Unit!42)))

(declare-fun b!4479 () Bool)

(assert (=> b!4479 (= e!2362 e!2366)))

(declare-fun c!230 () Bool)

(assert (=> b!4479 (= c!230 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68 () Bool)

(assert (=> bm!68 (= call!69 (contains!35 lt!670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4480 () Bool)

(assert (=> b!4480 (= e!2366 (not call!70))))

(assert (= (and d!677 c!232) b!4475))

(assert (= (and d!677 (not c!232)) b!4469))

(assert (= (and b!4469 c!231) b!4468))

(assert (= (and b!4469 (not c!231)) b!4473))

(assert (= (and b!4473 c!228) b!4461))

(assert (= (and b!4473 (not c!228)) b!4470))

(assert (= (or b!4461 b!4470) bm!62))

(assert (= (or b!4468 bm!62) bm!65))

(assert (= (or b!4468 b!4461) bm!64))

(assert (= (or b!4475 bm!65) bm!67))

(assert (= (or b!4475 bm!64) bm!63))

(assert (= (and d!677 res!5742) b!4471))

(assert (= (and d!677 c!229) b!4476))

(assert (= (and d!677 (not c!229)) b!4478))

(assert (= (and d!677 res!5745) b!4477))

(assert (= (and b!4477 res!5748) b!4465))

(assert (= (and b!4477 (not res!5743)) b!4474))

(assert (= (and b!4474 res!5741) b!4464))

(assert (= (and b!4477 res!5744) b!4460))

(assert (= (and b!4460 c!233) b!4472))

(assert (= (and b!4460 (not c!233)) b!4467))

(assert (= (and b!4472 res!5747) b!4466))

(assert (= (or b!4472 b!4467) bm!68))

(assert (= (and b!4460 res!5746) b!4479))

(assert (= (and b!4479 c!230) b!4463))

(assert (= (and b!4479 (not c!230)) b!4480))

(assert (= (and b!4463 res!5749) b!4462))

(assert (= (or b!4463 b!4480) bm!66))

(declare-fun b_lambda!319 () Bool)

(assert (=> (not b_lambda!319) (not b!4464)))

(declare-fun t!2235 () Bool)

(declare-fun tb!127 () Bool)

(assert (=> (and start!656 (= defaultEntry!1495 defaultEntry!1495) t!2235) tb!127))

(declare-fun result!183 () Bool)

(assert (=> tb!127 (= result!183 tp_is_empty!207)))

(assert (=> b!4464 t!2235))

(declare-fun b_and!271 () Bool)

(assert (= b_and!267 (and (=> t!2235 result!183) b_and!271)))

(declare-fun m!2357 () Bool)

(assert (=> bm!68 m!2357))

(assert (=> d!677 m!2299))

(declare-fun m!2359 () Bool)

(assert (=> bm!66 m!2359))

(assert (=> b!4464 m!2339))

(declare-fun m!2361 () Bool)

(assert (=> b!4464 m!2361))

(declare-fun m!2363 () Bool)

(assert (=> b!4464 m!2363))

(declare-fun m!2365 () Bool)

(assert (=> b!4464 m!2365))

(assert (=> b!4464 m!2363))

(assert (=> b!4464 m!2339))

(declare-fun m!2367 () Bool)

(assert (=> b!4464 m!2367))

(assert (=> b!4464 m!2361))

(declare-fun m!2369 () Bool)

(assert (=> b!4462 m!2369))

(declare-fun m!2371 () Bool)

(assert (=> b!4475 m!2371))

(assert (=> b!4465 m!2339))

(assert (=> b!4465 m!2339))

(assert (=> b!4465 m!2343))

(declare-fun m!2373 () Bool)

(assert (=> b!4466 m!2373))

(assert (=> b!4474 m!2339))

(assert (=> b!4474 m!2339))

(declare-fun m!2375 () Bool)

(assert (=> b!4474 m!2375))

(assert (=> b!4471 m!2339))

(assert (=> b!4471 m!2339))

(assert (=> b!4471 m!2343))

(assert (=> b!4476 m!2339))

(declare-fun m!2377 () Bool)

(assert (=> b!4476 m!2377))

(declare-fun m!2379 () Bool)

(assert (=> b!4476 m!2379))

(declare-fun m!2381 () Bool)

(assert (=> b!4476 m!2381))

(declare-fun m!2383 () Bool)

(assert (=> b!4476 m!2383))

(declare-fun m!2385 () Bool)

(assert (=> b!4476 m!2385))

(declare-fun m!2387 () Bool)

(assert (=> b!4476 m!2387))

(declare-fun m!2389 () Bool)

(assert (=> b!4476 m!2389))

(declare-fun m!2391 () Bool)

(assert (=> b!4476 m!2391))

(declare-fun m!2393 () Bool)

(assert (=> b!4476 m!2393))

(declare-fun m!2395 () Bool)

(assert (=> b!4476 m!2395))

(declare-fun m!2397 () Bool)

(assert (=> b!4476 m!2397))

(declare-fun m!2399 () Bool)

(assert (=> b!4476 m!2399))

(declare-fun m!2401 () Bool)

(assert (=> b!4476 m!2401))

(assert (=> b!4476 m!2387))

(assert (=> b!4476 m!2391))

(assert (=> b!4476 m!2381))

(declare-fun m!2403 () Bool)

(assert (=> b!4476 m!2403))

(declare-fun m!2405 () Bool)

(assert (=> b!4476 m!2405))

(assert (=> b!4476 m!2399))

(declare-fun m!2407 () Bool)

(assert (=> b!4476 m!2407))

(declare-fun m!2409 () Bool)

(assert (=> bm!63 m!2409))

(assert (=> bm!67 m!2397))

(assert (=> b!4349 d!677))

(declare-fun d!679 () Bool)

(assert (=> d!679 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!656 d!679))

(declare-fun d!681 () Bool)

(assert (=> d!681 (= (array_inv!119 _values!1492) (bvsge (size!228 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!656 d!681))

(declare-fun d!683 () Bool)

(assert (=> d!683 (= (array_inv!120 _keys!1806) (bvsge (size!227 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!656 d!683))

(declare-fun bm!71 () Bool)

(declare-fun call!74 () Bool)

(assert (=> bm!71 (= call!74 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!4491 () Bool)

(declare-fun e!2374 () Bool)

(declare-fun e!2373 () Bool)

(assert (=> b!4491 (= e!2374 e!2373)))

(declare-fun c!236 () Bool)

(assert (=> b!4491 (= c!236 (validKeyInArray!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4492 () Bool)

(declare-fun e!2375 () Bool)

(assert (=> b!4492 (= e!2375 call!74)))

(declare-fun b!4493 () Bool)

(assert (=> b!4493 (= e!2373 e!2375)))

(declare-fun lt!683 () (_ BitVec 64))

(assert (=> b!4493 (= lt!683 (select (arr!165 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!682 () Unit!37)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!345 (_ BitVec 64) (_ BitVec 32)) Unit!37)

(assert (=> b!4493 (= lt!682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!683 #b00000000000000000000000000000000))))

(assert (=> b!4493 (arrayContainsKey!0 _keys!1806 lt!683 #b00000000000000000000000000000000)))

(declare-fun lt!684 () Unit!37)

(assert (=> b!4493 (= lt!684 lt!682)))

(declare-fun res!5755 () Bool)

(declare-datatypes ((SeekEntryResult!10 0))(
  ( (MissingZero!10 (index!2159 (_ BitVec 32))) (Found!10 (index!2160 (_ BitVec 32))) (Intermediate!10 (undefined!822 Bool) (index!2161 (_ BitVec 32)) (x!2366 (_ BitVec 32))) (Undefined!10) (MissingVacant!10 (index!2162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!345 (_ BitVec 32)) SeekEntryResult!10)

(assert (=> b!4493 (= res!5755 (= (seekEntryOrOpen!0 (select (arr!165 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!10 #b00000000000000000000000000000000)))))

(assert (=> b!4493 (=> (not res!5755) (not e!2375))))

(declare-fun d!685 () Bool)

(declare-fun res!5754 () Bool)

(assert (=> d!685 (=> res!5754 e!2374)))

(assert (=> d!685 (= res!5754 (bvsge #b00000000000000000000000000000000 (size!227 _keys!1806)))))

(assert (=> d!685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2374)))

(declare-fun b!4494 () Bool)

(assert (=> b!4494 (= e!2373 call!74)))

(assert (= (and d!685 (not res!5754)) b!4491))

(assert (= (and b!4491 c!236) b!4493))

(assert (= (and b!4491 (not c!236)) b!4494))

(assert (= (and b!4493 res!5755) b!4492))

(assert (= (or b!4492 b!4494) bm!71))

(declare-fun m!2411 () Bool)

(assert (=> bm!71 m!2411))

(assert (=> b!4491 m!2339))

(assert (=> b!4491 m!2339))

(assert (=> b!4491 m!2343))

(assert (=> b!4493 m!2339))

(declare-fun m!2413 () Bool)

(assert (=> b!4493 m!2413))

(declare-fun m!2415 () Bool)

(assert (=> b!4493 m!2415))

(assert (=> b!4493 m!2339))

(declare-fun m!2417 () Bool)

(assert (=> b!4493 m!2417))

(assert (=> b!4347 d!685))

(declare-fun d!687 () Bool)

(declare-fun e!2378 () Bool)

(assert (=> d!687 e!2378))

(declare-fun c!239 () Bool)

(assert (=> d!687 (= c!239 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!687 () Unit!37)

(declare-fun choose!134 (array!345 array!347 (_ BitVec 32) (_ BitVec 32) V!453 V!453 (_ BitVec 64) Int) Unit!37)

(assert (=> d!687 (= lt!687 (choose!134 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!687 (validMask!0 mask!2250)))

(assert (=> d!687 (= (lemmaKeyInListMapIsInArray!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!687)))

(declare-fun b!4499 () Bool)

(assert (=> b!4499 (= e!2378 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4500 () Bool)

(assert (=> b!4500 (= e!2378 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!687 c!239) b!4499))

(assert (= (and d!687 (not c!239)) b!4500))

(declare-fun m!2419 () Bool)

(assert (=> d!687 m!2419))

(assert (=> d!687 m!2299))

(assert (=> b!4499 m!2313))

(assert (=> b!4346 d!687))

(declare-fun b!4508 () Bool)

(declare-fun e!2383 () Bool)

(assert (=> b!4508 (= e!2383 tp_is_empty!207)))

(declare-fun b!4507 () Bool)

(declare-fun e!2384 () Bool)

(assert (=> b!4507 (= e!2384 tp_is_empty!207)))

(declare-fun mapNonEmpty!275 () Bool)

(declare-fun mapRes!275 () Bool)

(declare-fun tp!614 () Bool)

(assert (=> mapNonEmpty!275 (= mapRes!275 (and tp!614 e!2384))))

(declare-fun mapValue!275 () ValueCell!87)

(declare-fun mapKey!275 () (_ BitVec 32))

(declare-fun mapRest!275 () (Array (_ BitVec 32) ValueCell!87))

(assert (=> mapNonEmpty!275 (= mapRest!269 (store mapRest!275 mapKey!275 mapValue!275))))

(declare-fun condMapEmpty!275 () Bool)

(declare-fun mapDefault!275 () ValueCell!87)

(assert (=> mapNonEmpty!269 (= condMapEmpty!275 (= mapRest!269 ((as const (Array (_ BitVec 32) ValueCell!87)) mapDefault!275)))))

(assert (=> mapNonEmpty!269 (= tp!605 (and e!2383 mapRes!275))))

(declare-fun mapIsEmpty!275 () Bool)

(assert (=> mapIsEmpty!275 mapRes!275))

(assert (= (and mapNonEmpty!269 condMapEmpty!275) mapIsEmpty!275))

(assert (= (and mapNonEmpty!269 (not condMapEmpty!275)) mapNonEmpty!275))

(assert (= (and mapNonEmpty!275 ((_ is ValueCellFull!87) mapValue!275)) b!4507))

(assert (= (and mapNonEmpty!269 ((_ is ValueCellFull!87) mapDefault!275)) b!4508))

(declare-fun m!2421 () Bool)

(assert (=> mapNonEmpty!275 m!2421))

(declare-fun b_lambda!321 () Bool)

(assert (= b_lambda!319 (or (and start!656 b_free!129) b_lambda!321)))

(check-sat (not bm!67) (not b!4462) (not b!4407) (not d!687) (not b!4405) (not mapNonEmpty!275) (not b!4471) (not bm!66) (not d!675) (not b!4408) (not b_lambda!321) (not b!4415) (not b!4466) (not b!4475) b_and!271 (not d!677) (not b!4393) (not bm!68) (not bm!47) (not b!4417) (not b!4465) (not b!4491) (not b!4499) (not b_next!129) (not b!4493) tp_is_empty!207 (not b!4464) (not bm!71) (not b!4474) (not b!4476) (not bm!63))
(check-sat b_and!271 (not b_next!129))
