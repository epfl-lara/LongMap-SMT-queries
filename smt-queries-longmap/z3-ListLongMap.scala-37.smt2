; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!654 () Bool)

(assert start!654)

(declare-fun b_free!127 () Bool)

(declare-fun b_next!127 () Bool)

(assert (=> start!654 (= b_free!127 (not b_next!127))))

(declare-fun tp!599 () Bool)

(declare-fun b_and!265 () Bool)

(assert (=> start!654 (= tp!599 b_and!265)))

(declare-fun b!4311 () Bool)

(declare-fun e!2264 () Bool)

(declare-fun tp_is_empty!205 () Bool)

(assert (=> b!4311 (= e!2264 tp_is_empty!205)))

(declare-fun b!4312 () Bool)

(declare-fun e!2266 () Bool)

(declare-datatypes ((array!335 0))(
  ( (array!336 (arr!160 (Array (_ BitVec 32) (_ BitVec 64))) (size!222 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!335)

(assert (=> b!4312 (= e!2266 (not (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806))))))

(declare-fun e!2265 () Bool)

(assert (=> b!4312 e!2265))

(declare-fun c!203 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!4312 (= c!203 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!451 0))(
  ( (V!452 (val!108 Int)) )
))
(declare-datatypes ((ValueCell!86 0))(
  ( (ValueCellFull!86 (v!1195 V!451)) (EmptyCell!86) )
))
(declare-datatypes ((array!337 0))(
  ( (array!338 (arr!161 (Array (_ BitVec 32) ValueCell!86)) (size!223 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!337)

(declare-fun minValue!1434 () V!451)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!451)

(declare-datatypes ((Unit!35 0))(
  ( (Unit!36) )
))
(declare-fun lt!591 () Unit!35)

(declare-fun lemmaKeyInListMapIsInArray!7 (array!335 array!337 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 64) Int) Unit!35)

(assert (=> b!4312 (= lt!591 (lemmaKeyInListMapIsInArray!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4313 () Bool)

(declare-fun res!5667 () Bool)

(assert (=> b!4313 (=> (not res!5667) (not e!2266))))

(declare-datatypes ((tuple2!96 0))(
  ( (tuple2!97 (_1!48 (_ BitVec 64)) (_2!48 V!451)) )
))
(declare-datatypes ((List!102 0))(
  ( (Nil!99) (Cons!98 (h!664 tuple2!96) (t!2229 List!102)) )
))
(declare-datatypes ((ListLongMap!101 0))(
  ( (ListLongMap!102 (toList!66 List!102)) )
))
(declare-fun contains!36 (ListLongMap!101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!25 (array!335 array!337 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 32) Int) ListLongMap!101)

(assert (=> b!4313 (= res!5667 (contains!36 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4314 () Bool)

(declare-fun res!5668 () Bool)

(assert (=> b!4314 (=> (not res!5668) (not e!2266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!335 (_ BitVec 32)) Bool)

(assert (=> b!4314 (= res!5668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4315 () Bool)

(assert (=> b!4315 (= e!2265 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4316 () Bool)

(declare-fun arrayContainsKey!0 (array!335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4316 (= e!2265 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4317 () Bool)

(declare-fun e!2267 () Bool)

(declare-fun e!2262 () Bool)

(declare-fun mapRes!266 () Bool)

(assert (=> b!4317 (= e!2267 (and e!2262 mapRes!266))))

(declare-fun condMapEmpty!266 () Bool)

(declare-fun mapDefault!266 () ValueCell!86)

(assert (=> b!4317 (= condMapEmpty!266 (= (arr!161 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!86)) mapDefault!266)))))

(declare-fun b!4318 () Bool)

(declare-fun res!5665 () Bool)

(assert (=> b!4318 (=> (not res!5665) (not e!2266))))

(assert (=> b!4318 (= res!5665 (and (= (size!223 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!222 _keys!1806) (size!223 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!266 () Bool)

(assert (=> mapIsEmpty!266 mapRes!266))

(declare-fun b!4319 () Bool)

(declare-fun res!5666 () Bool)

(assert (=> b!4319 (=> (not res!5666) (not e!2266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4319 (= res!5666 (validKeyInArray!0 k0!1278))))

(declare-fun mapNonEmpty!266 () Bool)

(declare-fun tp!598 () Bool)

(assert (=> mapNonEmpty!266 (= mapRes!266 (and tp!598 e!2264))))

(declare-fun mapValue!266 () ValueCell!86)

(declare-fun mapRest!266 () (Array (_ BitVec 32) ValueCell!86))

(declare-fun mapKey!266 () (_ BitVec 32))

(assert (=> mapNonEmpty!266 (= (arr!161 _values!1492) (store mapRest!266 mapKey!266 mapValue!266))))

(declare-fun res!5663 () Bool)

(assert (=> start!654 (=> (not res!5663) (not e!2266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!654 (= res!5663 (validMask!0 mask!2250))))

(assert (=> start!654 e!2266))

(assert (=> start!654 tp!599))

(assert (=> start!654 true))

(declare-fun array_inv!111 (array!337) Bool)

(assert (=> start!654 (and (array_inv!111 _values!1492) e!2267)))

(assert (=> start!654 tp_is_empty!205))

(declare-fun array_inv!112 (array!335) Bool)

(assert (=> start!654 (array_inv!112 _keys!1806)))

(declare-fun b!4320 () Bool)

(assert (=> b!4320 (= e!2262 tp_is_empty!205)))

(declare-fun b!4321 () Bool)

(declare-fun res!5664 () Bool)

(assert (=> b!4321 (=> (not res!5664) (not e!2266))))

(declare-datatypes ((List!103 0))(
  ( (Nil!100) (Cons!99 (h!665 (_ BitVec 64)) (t!2230 List!103)) )
))
(declare-fun arrayNoDuplicates!0 (array!335 (_ BitVec 32) List!103) Bool)

(assert (=> b!4321 (= res!5664 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!100))))

(assert (= (and start!654 res!5663) b!4318))

(assert (= (and b!4318 res!5665) b!4314))

(assert (= (and b!4314 res!5668) b!4321))

(assert (= (and b!4321 res!5664) b!4313))

(assert (= (and b!4313 res!5667) b!4319))

(assert (= (and b!4319 res!5666) b!4312))

(assert (= (and b!4312 c!203) b!4316))

(assert (= (and b!4312 (not c!203)) b!4315))

(assert (= (and b!4317 condMapEmpty!266) mapIsEmpty!266))

(assert (= (and b!4317 (not condMapEmpty!266)) mapNonEmpty!266))

(get-info :version)

(assert (= (and mapNonEmpty!266 ((_ is ValueCellFull!86) mapValue!266)) b!4311))

(assert (= (and b!4317 ((_ is ValueCellFull!86) mapDefault!266)) b!4320))

(assert (= start!654 b!4317))

(declare-fun m!2273 () Bool)

(assert (=> b!4312 m!2273))

(declare-fun m!2275 () Bool)

(assert (=> mapNonEmpty!266 m!2275))

(declare-fun m!2277 () Bool)

(assert (=> b!4319 m!2277))

(declare-fun m!2279 () Bool)

(assert (=> start!654 m!2279))

(declare-fun m!2281 () Bool)

(assert (=> start!654 m!2281))

(declare-fun m!2283 () Bool)

(assert (=> start!654 m!2283))

(declare-fun m!2285 () Bool)

(assert (=> b!4314 m!2285))

(declare-fun m!2287 () Bool)

(assert (=> b!4321 m!2287))

(declare-fun m!2289 () Bool)

(assert (=> b!4313 m!2289))

(assert (=> b!4313 m!2289))

(declare-fun m!2291 () Bool)

(assert (=> b!4313 m!2291))

(declare-fun m!2293 () Bool)

(assert (=> b!4316 m!2293))

(check-sat (not b!4321) (not start!654) (not b!4319) (not b!4314) (not b!4313) tp_is_empty!205 b_and!265 (not b!4312) (not mapNonEmpty!266) (not b_next!127) (not b!4316))
(check-sat b_and!265 (not b_next!127))
(get-model)

(declare-fun b!4396 () Bool)

(declare-fun e!2312 () Bool)

(declare-fun e!2311 () Bool)

(assert (=> b!4396 (= e!2312 e!2311)))

(declare-fun c!212 () Bool)

(assert (=> b!4396 (= c!212 (validKeyInArray!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4397 () Bool)

(declare-fun e!2310 () Bool)

(declare-fun call!50 () Bool)

(assert (=> b!4397 (= e!2310 call!50)))

(declare-fun d!669 () Bool)

(declare-fun res!5710 () Bool)

(assert (=> d!669 (=> res!5710 e!2312)))

(assert (=> d!669 (= res!5710 (bvsge #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(assert (=> d!669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!2312)))

(declare-fun b!4398 () Bool)

(assert (=> b!4398 (= e!2311 call!50)))

(declare-fun bm!47 () Bool)

(assert (=> bm!47 (= call!50 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!4399 () Bool)

(assert (=> b!4399 (= e!2311 e!2310)))

(declare-fun lt!604 () (_ BitVec 64))

(assert (=> b!4399 (= lt!604 (select (arr!160 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!606 () Unit!35)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!335 (_ BitVec 64) (_ BitVec 32)) Unit!35)

(assert (=> b!4399 (= lt!606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!604 #b00000000000000000000000000000000))))

(assert (=> b!4399 (arrayContainsKey!0 _keys!1806 lt!604 #b00000000000000000000000000000000)))

(declare-fun lt!605 () Unit!35)

(assert (=> b!4399 (= lt!605 lt!606)))

(declare-fun res!5709 () Bool)

(declare-datatypes ((SeekEntryResult!10 0))(
  ( (MissingZero!10 (index!2159 (_ BitVec 32))) (Found!10 (index!2160 (_ BitVec 32))) (Intermediate!10 (undefined!822 Bool) (index!2161 (_ BitVec 32)) (x!2366 (_ BitVec 32))) (Undefined!10) (MissingVacant!10 (index!2162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!335 (_ BitVec 32)) SeekEntryResult!10)

(assert (=> b!4399 (= res!5709 (= (seekEntryOrOpen!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!10 #b00000000000000000000000000000000)))))

(assert (=> b!4399 (=> (not res!5709) (not e!2310))))

(assert (= (and d!669 (not res!5710)) b!4396))

(assert (= (and b!4396 c!212) b!4399))

(assert (= (and b!4396 (not c!212)) b!4398))

(assert (= (and b!4399 res!5709) b!4397))

(assert (= (or b!4397 b!4398) bm!47))

(declare-fun m!2339 () Bool)

(assert (=> b!4396 m!2339))

(assert (=> b!4396 m!2339))

(declare-fun m!2341 () Bool)

(assert (=> b!4396 m!2341))

(declare-fun m!2343 () Bool)

(assert (=> bm!47 m!2343))

(assert (=> b!4399 m!2339))

(declare-fun m!2345 () Bool)

(assert (=> b!4399 m!2345))

(declare-fun m!2347 () Bool)

(assert (=> b!4399 m!2347))

(assert (=> b!4399 m!2339))

(declare-fun m!2349 () Bool)

(assert (=> b!4399 m!2349))

(assert (=> b!4314 d!669))

(declare-fun d!671 () Bool)

(declare-fun res!5715 () Bool)

(declare-fun e!2317 () Bool)

(assert (=> d!671 (=> res!5715 e!2317)))

(assert (=> d!671 (= res!5715 (= (select (arr!160 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!671 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!2317)))

(declare-fun b!4404 () Bool)

(declare-fun e!2318 () Bool)

(assert (=> b!4404 (= e!2317 e!2318)))

(declare-fun res!5716 () Bool)

(assert (=> b!4404 (=> (not res!5716) (not e!2318))))

(assert (=> b!4404 (= res!5716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!222 _keys!1806)))))

(declare-fun b!4405 () Bool)

(assert (=> b!4405 (= e!2318 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!671 (not res!5715)) b!4404))

(assert (= (and b!4404 res!5716) b!4405))

(assert (=> d!671 m!2339))

(declare-fun m!2351 () Bool)

(assert (=> b!4405 m!2351))

(assert (=> b!4316 d!671))

(declare-fun d!673 () Bool)

(assert (=> d!673 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4319 d!673))

(declare-fun b!4416 () Bool)

(declare-fun e!2330 () Bool)

(declare-fun e!2329 () Bool)

(assert (=> b!4416 (= e!2330 e!2329)))

(declare-fun res!5724 () Bool)

(assert (=> b!4416 (=> (not res!5724) (not e!2329))))

(declare-fun e!2328 () Bool)

(assert (=> b!4416 (= res!5724 (not e!2328))))

(declare-fun res!5725 () Bool)

(assert (=> b!4416 (=> (not res!5725) (not e!2328))))

(assert (=> b!4416 (= res!5725 (validKeyInArray!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4417 () Bool)

(declare-fun e!2327 () Bool)

(assert (=> b!4417 (= e!2329 e!2327)))

(declare-fun c!215 () Bool)

(assert (=> b!4417 (= c!215 (validKeyInArray!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!675 () Bool)

(declare-fun res!5723 () Bool)

(assert (=> d!675 (=> res!5723 e!2330)))

(assert (=> d!675 (= res!5723 (bvsge #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(assert (=> d!675 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!100) e!2330)))

(declare-fun b!4418 () Bool)

(declare-fun call!53 () Bool)

(assert (=> b!4418 (= e!2327 call!53)))

(declare-fun bm!50 () Bool)

(assert (=> bm!50 (= call!53 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!215 (Cons!99 (select (arr!160 _keys!1806) #b00000000000000000000000000000000) Nil!100) Nil!100)))))

(declare-fun b!4419 () Bool)

(assert (=> b!4419 (= e!2327 call!53)))

(declare-fun b!4420 () Bool)

(declare-fun contains!37 (List!103 (_ BitVec 64)) Bool)

(assert (=> b!4420 (= e!2328 (contains!37 Nil!100 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!675 (not res!5723)) b!4416))

(assert (= (and b!4416 res!5725) b!4420))

(assert (= (and b!4416 res!5724) b!4417))

(assert (= (and b!4417 c!215) b!4419))

(assert (= (and b!4417 (not c!215)) b!4418))

(assert (= (or b!4419 b!4418) bm!50))

(assert (=> b!4416 m!2339))

(assert (=> b!4416 m!2339))

(assert (=> b!4416 m!2341))

(assert (=> b!4417 m!2339))

(assert (=> b!4417 m!2339))

(assert (=> b!4417 m!2341))

(assert (=> bm!50 m!2339))

(declare-fun m!2353 () Bool)

(assert (=> bm!50 m!2353))

(assert (=> b!4420 m!2339))

(assert (=> b!4420 m!2339))

(declare-fun m!2355 () Bool)

(assert (=> b!4420 m!2355))

(assert (=> b!4321 d!675))

(declare-fun d!677 () Bool)

(declare-fun e!2333 () Bool)

(assert (=> d!677 e!2333))

(declare-fun c!218 () Bool)

(assert (=> d!677 (= c!218 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!609 () Unit!35)

(declare-fun choose!134 (array!335 array!337 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 64) Int) Unit!35)

(assert (=> d!677 (= lt!609 (choose!134 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!677 (validMask!0 mask!2250)))

(assert (=> d!677 (= (lemmaKeyInListMapIsInArray!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!609)))

(declare-fun b!4425 () Bool)

(assert (=> b!4425 (= e!2333 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4426 () Bool)

(assert (=> b!4426 (= e!2333 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!677 c!218) b!4425))

(assert (= (and d!677 (not c!218)) b!4426))

(declare-fun m!2357 () Bool)

(assert (=> d!677 m!2357))

(assert (=> d!677 m!2279))

(assert (=> b!4425 m!2293))

(assert (=> b!4312 d!677))

(declare-fun d!679 () Bool)

(assert (=> d!679 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!654 d!679))

(declare-fun d!681 () Bool)

(assert (=> d!681 (= (array_inv!111 _values!1492) (bvsge (size!223 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!654 d!681))

(declare-fun d!683 () Bool)

(assert (=> d!683 (= (array_inv!112 _keys!1806) (bvsge (size!222 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!654 d!683))

(declare-fun d!685 () Bool)

(declare-fun e!2339 () Bool)

(assert (=> d!685 e!2339))

(declare-fun res!5728 () Bool)

(assert (=> d!685 (=> res!5728 e!2339)))

(declare-fun lt!621 () Bool)

(assert (=> d!685 (= res!5728 (not lt!621))))

(declare-fun lt!618 () Bool)

(assert (=> d!685 (= lt!621 lt!618)))

(declare-fun lt!620 () Unit!35)

(declare-fun e!2338 () Unit!35)

(assert (=> d!685 (= lt!620 e!2338)))

(declare-fun c!221 () Bool)

(assert (=> d!685 (= c!221 lt!618)))

(declare-fun containsKey!1 (List!102 (_ BitVec 64)) Bool)

(assert (=> d!685 (= lt!618 (containsKey!1 (toList!66 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!685 (= (contains!36 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!621)))

(declare-fun b!4433 () Bool)

(declare-fun lt!619 () Unit!35)

(assert (=> b!4433 (= e!2338 lt!619)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!1 (List!102 (_ BitVec 64)) Unit!35)

(assert (=> b!4433 (= lt!619 (lemmaContainsKeyImpliesGetValueByKeyDefined!1 (toList!66 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!13 0))(
  ( (Some!12 (v!1198 V!451)) (None!11) )
))
(declare-fun isDefined!2 (Option!13) Bool)

(declare-fun getValueByKey!7 (List!102 (_ BitVec 64)) Option!13)

(assert (=> b!4433 (isDefined!2 (getValueByKey!7 (toList!66 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!4434 () Bool)

(declare-fun Unit!39 () Unit!35)

(assert (=> b!4434 (= e!2338 Unit!39)))

(declare-fun b!4435 () Bool)

(assert (=> b!4435 (= e!2339 (isDefined!2 (getValueByKey!7 (toList!66 (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!685 c!221) b!4433))

(assert (= (and d!685 (not c!221)) b!4434))

(assert (= (and d!685 (not res!5728)) b!4435))

(declare-fun m!2359 () Bool)

(assert (=> d!685 m!2359))

(declare-fun m!2361 () Bool)

(assert (=> b!4433 m!2361))

(declare-fun m!2363 () Bool)

(assert (=> b!4433 m!2363))

(assert (=> b!4433 m!2363))

(declare-fun m!2365 () Bool)

(assert (=> b!4433 m!2365))

(assert (=> b!4435 m!2363))

(assert (=> b!4435 m!2363))

(assert (=> b!4435 m!2365))

(assert (=> b!4313 d!685))

(declare-fun call!71 () ListLongMap!101)

(declare-fun c!235 () Bool)

(declare-fun c!234 () Bool)

(declare-fun call!69 () ListLongMap!101)

(declare-fun call!72 () ListLongMap!101)

(declare-fun bm!65 () Bool)

(declare-fun call!73 () ListLongMap!101)

(declare-fun +!4 (ListLongMap!101 tuple2!96) ListLongMap!101)

(assert (=> bm!65 (= call!69 (+!4 (ite c!234 call!71 (ite c!235 call!73 call!72)) (ite (or c!234 c!235) (tuple2!97 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!97 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun d!687 () Bool)

(declare-fun e!2376 () Bool)

(assert (=> d!687 e!2376))

(declare-fun res!5749 () Bool)

(assert (=> d!687 (=> (not res!5749) (not e!2376))))

(assert (=> d!687 (= res!5749 (or (bvsge #b00000000000000000000000000000000 (size!222 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806)))))))

(declare-fun lt!675 () ListLongMap!101)

(declare-fun lt!676 () ListLongMap!101)

(assert (=> d!687 (= lt!675 lt!676)))

(declare-fun lt!668 () Unit!35)

(declare-fun e!2371 () Unit!35)

(assert (=> d!687 (= lt!668 e!2371)))

(declare-fun c!239 () Bool)

(declare-fun e!2370 () Bool)

(assert (=> d!687 (= c!239 e!2370)))

(declare-fun res!5750 () Bool)

(assert (=> d!687 (=> (not res!5750) (not e!2370))))

(assert (=> d!687 (= res!5750 (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(declare-fun e!2372 () ListLongMap!101)

(assert (=> d!687 (= lt!676 e!2372)))

(assert (=> d!687 (= c!234 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!687 (validMask!0 mask!2250)))

(assert (=> d!687 (= (getCurrentListMap!25 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!675)))

(declare-fun b!4478 () Bool)

(declare-fun lt!670 () Unit!35)

(assert (=> b!4478 (= e!2371 lt!670)))

(declare-fun lt!683 () ListLongMap!101)

(declare-fun getCurrentListMapNoExtraKeys!1 (array!335 array!337 (_ BitVec 32) (_ BitVec 32) V!451 V!451 (_ BitVec 32) Int) ListLongMap!101)

(assert (=> b!4478 (= lt!683 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!674 () (_ BitVec 64))

(assert (=> b!4478 (= lt!674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!685 () (_ BitVec 64))

(assert (=> b!4478 (= lt!685 (select (arr!160 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!682 () Unit!35)

(declare-fun addStillContains!2 (ListLongMap!101 (_ BitVec 64) V!451 (_ BitVec 64)) Unit!35)

(assert (=> b!4478 (= lt!682 (addStillContains!2 lt!683 lt!674 zeroValue!1434 lt!685))))

(assert (=> b!4478 (contains!36 (+!4 lt!683 (tuple2!97 lt!674 zeroValue!1434)) lt!685)))

(declare-fun lt!687 () Unit!35)

(assert (=> b!4478 (= lt!687 lt!682)))

(declare-fun lt!666 () ListLongMap!101)

(assert (=> b!4478 (= lt!666 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!671 () (_ BitVec 64))

(assert (=> b!4478 (= lt!671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!681 () (_ BitVec 64))

(assert (=> b!4478 (= lt!681 (select (arr!160 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!684 () Unit!35)

(declare-fun addApplyDifferent!2 (ListLongMap!101 (_ BitVec 64) V!451 (_ BitVec 64)) Unit!35)

(assert (=> b!4478 (= lt!684 (addApplyDifferent!2 lt!666 lt!671 minValue!1434 lt!681))))

(declare-fun apply!17 (ListLongMap!101 (_ BitVec 64)) V!451)

(assert (=> b!4478 (= (apply!17 (+!4 lt!666 (tuple2!97 lt!671 minValue!1434)) lt!681) (apply!17 lt!666 lt!681))))

(declare-fun lt!680 () Unit!35)

(assert (=> b!4478 (= lt!680 lt!684)))

(declare-fun lt!686 () ListLongMap!101)

(assert (=> b!4478 (= lt!686 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!678 () (_ BitVec 64))

(assert (=> b!4478 (= lt!678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!679 () (_ BitVec 64))

(assert (=> b!4478 (= lt!679 (select (arr!160 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!677 () Unit!35)

(assert (=> b!4478 (= lt!677 (addApplyDifferent!2 lt!686 lt!678 zeroValue!1434 lt!679))))

(assert (=> b!4478 (= (apply!17 (+!4 lt!686 (tuple2!97 lt!678 zeroValue!1434)) lt!679) (apply!17 lt!686 lt!679))))

(declare-fun lt!669 () Unit!35)

(assert (=> b!4478 (= lt!669 lt!677)))

(declare-fun lt!672 () ListLongMap!101)

(assert (=> b!4478 (= lt!672 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!673 () (_ BitVec 64))

(assert (=> b!4478 (= lt!673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!667 () (_ BitVec 64))

(assert (=> b!4478 (= lt!667 (select (arr!160 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!4478 (= lt!670 (addApplyDifferent!2 lt!672 lt!673 minValue!1434 lt!667))))

(assert (=> b!4478 (= (apply!17 (+!4 lt!672 (tuple2!97 lt!673 minValue!1434)) lt!667) (apply!17 lt!672 lt!667))))

(declare-fun b!4479 () Bool)

(declare-fun e!2377 () Bool)

(assert (=> b!4479 (= e!2377 (= (apply!17 lt!675 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!4480 () Bool)

(declare-fun e!2373 () ListLongMap!101)

(assert (=> b!4480 (= e!2373 call!72)))

(declare-fun b!4481 () Bool)

(declare-fun e!2374 () Bool)

(assert (=> b!4481 (= e!2374 (validKeyInArray!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4482 () Bool)

(declare-fun call!68 () ListLongMap!101)

(assert (=> b!4482 (= e!2373 call!68)))

(declare-fun b!4483 () Bool)

(declare-fun e!2368 () ListLongMap!101)

(assert (=> b!4483 (= e!2368 call!68)))

(declare-fun b!4484 () Bool)

(assert (=> b!4484 (= e!2370 (validKeyInArray!0 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!4485 () Bool)

(assert (=> b!4485 (= e!2372 (+!4 call!69 (tuple2!97 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun bm!66 () Bool)

(assert (=> bm!66 (= call!68 call!69)))

(declare-fun b!4486 () Bool)

(declare-fun e!2369 () Bool)

(declare-fun call!74 () Bool)

(assert (=> b!4486 (= e!2369 (not call!74))))

(declare-fun bm!67 () Bool)

(assert (=> bm!67 (= call!73 call!71)))

(declare-fun b!4487 () Bool)

(assert (=> b!4487 (= e!2372 e!2368)))

(assert (=> b!4487 (= c!235 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!4488 () Bool)

(declare-fun Unit!40 () Unit!35)

(assert (=> b!4488 (= e!2371 Unit!40)))

(declare-fun bm!68 () Bool)

(assert (=> bm!68 (= call!74 (contains!36 lt!675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4489 () Bool)

(declare-fun e!2366 () Bool)

(assert (=> b!4489 (= e!2369 e!2366)))

(declare-fun res!5754 () Bool)

(assert (=> b!4489 (= res!5754 call!74)))

(assert (=> b!4489 (=> (not res!5754) (not e!2366))))

(declare-fun bm!69 () Bool)

(assert (=> bm!69 (= call!71 (getCurrentListMapNoExtraKeys!1 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!70 () Bool)

(assert (=> bm!70 (= call!72 call!73)))

(declare-fun b!4490 () Bool)

(declare-fun e!2367 () Bool)

(declare-fun call!70 () Bool)

(assert (=> b!4490 (= e!2367 (not call!70))))

(declare-fun b!4491 () Bool)

(assert (=> b!4491 (= e!2376 e!2367)))

(declare-fun c!238 () Bool)

(assert (=> b!4491 (= c!238 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!4492 () Bool)

(declare-fun c!237 () Bool)

(assert (=> b!4492 (= c!237 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!4492 (= e!2368 e!2373)))

(declare-fun b!4493 () Bool)

(assert (=> b!4493 (= e!2366 (= (apply!17 lt!675 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!4494 () Bool)

(declare-fun res!5748 () Bool)

(assert (=> b!4494 (=> (not res!5748) (not e!2376))))

(declare-fun e!2375 () Bool)

(assert (=> b!4494 (= res!5748 e!2375)))

(declare-fun res!5751 () Bool)

(assert (=> b!4494 (=> res!5751 e!2375)))

(assert (=> b!4494 (= res!5751 (not e!2374))))

(declare-fun res!5747 () Bool)

(assert (=> b!4494 (=> (not res!5747) (not e!2374))))

(assert (=> b!4494 (= res!5747 (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(declare-fun b!4495 () Bool)

(declare-fun e!2378 () Bool)

(assert (=> b!4495 (= e!2375 e!2378)))

(declare-fun res!5753 () Bool)

(assert (=> b!4495 (=> (not res!5753) (not e!2378))))

(assert (=> b!4495 (= res!5753 (contains!36 lt!675 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!4495 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(declare-fun b!4496 () Bool)

(declare-fun get!87 (ValueCell!86 V!451) V!451)

(declare-fun dynLambda!39 (Int (_ BitVec 64)) V!451)

(assert (=> b!4496 (= e!2378 (= (apply!17 lt!675 (select (arr!160 _keys!1806) #b00000000000000000000000000000000)) (get!87 (select (arr!161 _values!1492) #b00000000000000000000000000000000) (dynLambda!39 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!4496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!223 _values!1492)))))

(assert (=> b!4496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!222 _keys!1806)))))

(declare-fun bm!71 () Bool)

(assert (=> bm!71 (= call!70 (contains!36 lt!675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!4497 () Bool)

(assert (=> b!4497 (= e!2367 e!2377)))

(declare-fun res!5752 () Bool)

(assert (=> b!4497 (= res!5752 call!70)))

(assert (=> b!4497 (=> (not res!5752) (not e!2377))))

(declare-fun b!4498 () Bool)

(declare-fun res!5755 () Bool)

(assert (=> b!4498 (=> (not res!5755) (not e!2376))))

(assert (=> b!4498 (= res!5755 e!2369)))

(declare-fun c!236 () Bool)

(assert (=> b!4498 (= c!236 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!687 c!234) b!4485))

(assert (= (and d!687 (not c!234)) b!4487))

(assert (= (and b!4487 c!235) b!4483))

(assert (= (and b!4487 (not c!235)) b!4492))

(assert (= (and b!4492 c!237) b!4482))

(assert (= (and b!4492 (not c!237)) b!4480))

(assert (= (or b!4482 b!4480) bm!70))

(assert (= (or b!4483 bm!70) bm!67))

(assert (= (or b!4483 b!4482) bm!66))

(assert (= (or b!4485 bm!67) bm!69))

(assert (= (or b!4485 bm!66) bm!65))

(assert (= (and d!687 res!5750) b!4484))

(assert (= (and d!687 c!239) b!4478))

(assert (= (and d!687 (not c!239)) b!4488))

(assert (= (and d!687 res!5749) b!4494))

(assert (= (and b!4494 res!5747) b!4481))

(assert (= (and b!4494 (not res!5751)) b!4495))

(assert (= (and b!4495 res!5753) b!4496))

(assert (= (and b!4494 res!5748) b!4498))

(assert (= (and b!4498 c!236) b!4489))

(assert (= (and b!4498 (not c!236)) b!4486))

(assert (= (and b!4489 res!5754) b!4493))

(assert (= (or b!4489 b!4486) bm!68))

(assert (= (and b!4498 res!5755) b!4491))

(assert (= (and b!4491 c!238) b!4497))

(assert (= (and b!4491 (not c!238)) b!4490))

(assert (= (and b!4497 res!5752) b!4479))

(assert (= (or b!4497 b!4490) bm!71))

(declare-fun b_lambda!319 () Bool)

(assert (=> (not b_lambda!319) (not b!4496)))

(declare-fun t!2233 () Bool)

(declare-fun tb!127 () Bool)

(assert (=> (and start!654 (= defaultEntry!1495 defaultEntry!1495) t!2233) tb!127))

(declare-fun result!183 () Bool)

(assert (=> tb!127 (= result!183 tp_is_empty!205)))

(assert (=> b!4496 t!2233))

(declare-fun b_and!271 () Bool)

(assert (= b_and!265 (and (=> t!2233 result!183) b_and!271)))

(assert (=> b!4484 m!2339))

(assert (=> b!4484 m!2339))

(assert (=> b!4484 m!2341))

(declare-fun m!2367 () Bool)

(assert (=> b!4478 m!2367))

(declare-fun m!2369 () Bool)

(assert (=> b!4478 m!2369))

(declare-fun m!2371 () Bool)

(assert (=> b!4478 m!2371))

(declare-fun m!2373 () Bool)

(assert (=> b!4478 m!2373))

(declare-fun m!2375 () Bool)

(assert (=> b!4478 m!2375))

(declare-fun m!2377 () Bool)

(assert (=> b!4478 m!2377))

(declare-fun m!2379 () Bool)

(assert (=> b!4478 m!2379))

(declare-fun m!2381 () Bool)

(assert (=> b!4478 m!2381))

(declare-fun m!2383 () Bool)

(assert (=> b!4478 m!2383))

(declare-fun m!2385 () Bool)

(assert (=> b!4478 m!2385))

(declare-fun m!2387 () Bool)

(assert (=> b!4478 m!2387))

(declare-fun m!2389 () Bool)

(assert (=> b!4478 m!2389))

(declare-fun m!2391 () Bool)

(assert (=> b!4478 m!2391))

(assert (=> b!4478 m!2387))

(assert (=> b!4478 m!2381))

(assert (=> b!4478 m!2377))

(declare-fun m!2393 () Bool)

(assert (=> b!4478 m!2393))

(declare-fun m!2395 () Bool)

(assert (=> b!4478 m!2395))

(declare-fun m!2397 () Bool)

(assert (=> b!4478 m!2397))

(assert (=> b!4478 m!2395))

(assert (=> b!4478 m!2339))

(assert (=> bm!69 m!2373))

(declare-fun m!2399 () Bool)

(assert (=> b!4496 m!2399))

(assert (=> b!4496 m!2399))

(declare-fun m!2401 () Bool)

(assert (=> b!4496 m!2401))

(declare-fun m!2403 () Bool)

(assert (=> b!4496 m!2403))

(assert (=> b!4496 m!2339))

(assert (=> b!4496 m!2339))

(declare-fun m!2405 () Bool)

(assert (=> b!4496 m!2405))

(assert (=> b!4496 m!2401))

(declare-fun m!2407 () Bool)

(assert (=> b!4485 m!2407))

(declare-fun m!2409 () Bool)

(assert (=> b!4479 m!2409))

(assert (=> b!4481 m!2339))

(assert (=> b!4481 m!2339))

(assert (=> b!4481 m!2341))

(declare-fun m!2411 () Bool)

(assert (=> bm!71 m!2411))

(assert (=> d!687 m!2279))

(declare-fun m!2413 () Bool)

(assert (=> bm!68 m!2413))

(assert (=> b!4495 m!2339))

(assert (=> b!4495 m!2339))

(declare-fun m!2415 () Bool)

(assert (=> b!4495 m!2415))

(declare-fun m!2417 () Bool)

(assert (=> b!4493 m!2417))

(declare-fun m!2419 () Bool)

(assert (=> bm!65 m!2419))

(assert (=> b!4313 d!687))

(declare-fun b!4508 () Bool)

(declare-fun e!2383 () Bool)

(assert (=> b!4508 (= e!2383 tp_is_empty!205)))

(declare-fun mapIsEmpty!275 () Bool)

(declare-fun mapRes!275 () Bool)

(assert (=> mapIsEmpty!275 mapRes!275))

(declare-fun condMapEmpty!275 () Bool)

(declare-fun mapDefault!275 () ValueCell!86)

(assert (=> mapNonEmpty!266 (= condMapEmpty!275 (= mapRest!266 ((as const (Array (_ BitVec 32) ValueCell!86)) mapDefault!275)))))

(assert (=> mapNonEmpty!266 (= tp!598 (and e!2383 mapRes!275))))

(declare-fun b!4507 () Bool)

(declare-fun e!2384 () Bool)

(assert (=> b!4507 (= e!2384 tp_is_empty!205)))

(declare-fun mapNonEmpty!275 () Bool)

(declare-fun tp!614 () Bool)

(assert (=> mapNonEmpty!275 (= mapRes!275 (and tp!614 e!2384))))

(declare-fun mapKey!275 () (_ BitVec 32))

(declare-fun mapRest!275 () (Array (_ BitVec 32) ValueCell!86))

(declare-fun mapValue!275 () ValueCell!86)

(assert (=> mapNonEmpty!275 (= mapRest!266 (store mapRest!275 mapKey!275 mapValue!275))))

(assert (= (and mapNonEmpty!266 condMapEmpty!275) mapIsEmpty!275))

(assert (= (and mapNonEmpty!266 (not condMapEmpty!275)) mapNonEmpty!275))

(assert (= (and mapNonEmpty!275 ((_ is ValueCellFull!86) mapValue!275)) b!4507))

(assert (= (and mapNonEmpty!266 ((_ is ValueCellFull!86) mapDefault!275)) b!4508))

(declare-fun m!2421 () Bool)

(assert (=> mapNonEmpty!275 m!2421))

(declare-fun b_lambda!321 () Bool)

(assert (= b_lambda!319 (or (and start!654 b_free!127) b_lambda!321)))

(check-sat (not d!685) (not b!4399) (not b!4484) (not b!4420) (not b!4495) b_and!271 (not b!4405) (not b!4478) (not b!4425) (not mapNonEmpty!275) (not b_next!127) (not b!4433) (not bm!69) (not b!4417) (not bm!71) (not b!4493) (not b!4416) (not d!687) (not b!4496) (not bm!50) (not b_lambda!321) (not bm!68) (not b!4485) (not bm!65) (not b!4479) (not b!4481) (not b!4435) (not d!677) (not b!4396) tp_is_empty!205 (not bm!47))
(check-sat b_and!271 (not b_next!127))
