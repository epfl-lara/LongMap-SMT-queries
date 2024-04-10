; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98686 () Bool)

(assert start!98686)

(declare-fun b_free!24291 () Bool)

(declare-fun b_next!24291 () Bool)

(assert (=> start!98686 (= b_free!24291 (not b_next!24291))))

(declare-fun tp!85584 () Bool)

(declare-fun b_and!39431 () Bool)

(assert (=> start!98686 (= tp!85584 b_and!39431)))

(declare-datatypes ((array!74489 0))(
  ( (array!74490 (arr!35895 (Array (_ BitVec 32) (_ BitVec 64))) (size!36431 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74489)

(declare-fun e!653215 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1148398 () Bool)

(declare-fun arrayContainsKey!0 (array!74489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148398 (= e!653215 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148399 () Bool)

(declare-fun res!764228 () Bool)

(declare-fun e!653214 () Bool)

(assert (=> b!1148399 (=> (not res!764228) (not e!653214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148399 (= res!764228 (validKeyInArray!0 k0!934))))

(declare-fun b!1148400 () Bool)

(declare-fun e!653216 () Bool)

(declare-fun e!653213 () Bool)

(assert (=> b!1148400 (= e!653216 e!653213)))

(declare-fun res!764223 () Bool)

(assert (=> b!1148400 (=> res!764223 e!653213)))

(assert (=> b!1148400 (= res!764223 (not (= (select (arr!35895 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653207 () Bool)

(assert (=> b!1148400 e!653207))

(declare-fun c!113481 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148400 (= c!113481 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43555 0))(
  ( (V!43556 (val!14467 Int)) )
))
(declare-fun zeroValue!944 () V!43555)

(declare-datatypes ((Unit!37736 0))(
  ( (Unit!37737) )
))
(declare-fun lt!513358 () Unit!37736)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43555)

(declare-datatypes ((ValueCell!13701 0))(
  ( (ValueCellFull!13701 (v!17104 V!43555)) (EmptyCell!13701) )
))
(declare-datatypes ((array!74491 0))(
  ( (array!74492 (arr!35896 (Array (_ BitVec 32) ValueCell!13701)) (size!36432 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74491)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!546 (array!74489 array!74491 (_ BitVec 32) (_ BitVec 32) V!43555 V!43555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37736)

(assert (=> b!1148400 (= lt!513358 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!546 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53032 () Bool)

(declare-fun call!53039 () Unit!37736)

(declare-fun call!53035 () Unit!37736)

(assert (=> bm!53032 (= call!53039 call!53035)))

(declare-fun c!113482 () Bool)

(declare-datatypes ((tuple2!18346 0))(
  ( (tuple2!18347 (_1!9184 (_ BitVec 64)) (_2!9184 V!43555)) )
))
(declare-datatypes ((List!25097 0))(
  ( (Nil!25094) (Cons!25093 (h!26302 tuple2!18346) (t!36380 List!25097)) )
))
(declare-datatypes ((ListLongMap!16315 0))(
  ( (ListLongMap!16316 (toList!8173 List!25097)) )
))
(declare-fun lt!513369 () ListLongMap!16315)

(declare-fun bm!53033 () Bool)

(declare-fun c!113479 () Bool)

(declare-fun addStillContains!845 (ListLongMap!16315 (_ BitVec 64) V!43555 (_ BitVec 64)) Unit!37736)

(assert (=> bm!53033 (= call!53035 (addStillContains!845 lt!513369 (ite (or c!113482 c!113479) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113482 c!113479) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148401 () Bool)

(assert (=> b!1148401 (= e!653213 true)))

(declare-fun e!653219 () Bool)

(assert (=> b!1148401 e!653219))

(declare-fun res!764220 () Bool)

(assert (=> b!1148401 (=> (not res!764220) (not e!653219))))

(declare-fun lt!513375 () V!43555)

(declare-fun -!1308 (ListLongMap!16315 (_ BitVec 64)) ListLongMap!16315)

(declare-fun +!3595 (ListLongMap!16315 tuple2!18346) ListLongMap!16315)

(assert (=> b!1148401 (= res!764220 (= (-!1308 (+!3595 lt!513369 (tuple2!18347 (select (arr!35895 _keys!1208) from!1455) lt!513375)) (select (arr!35895 _keys!1208) from!1455)) lt!513369))))

(declare-fun lt!513359 () Unit!37736)

(declare-fun addThenRemoveForNewKeyIsSame!153 (ListLongMap!16315 (_ BitVec 64) V!43555) Unit!37736)

(assert (=> b!1148401 (= lt!513359 (addThenRemoveForNewKeyIsSame!153 lt!513369 (select (arr!35895 _keys!1208) from!1455) lt!513375))))

(declare-fun lt!513361 () V!43555)

(declare-fun get!18263 (ValueCell!13701 V!43555) V!43555)

(assert (=> b!1148401 (= lt!513375 (get!18263 (select (arr!35896 _values!996) from!1455) lt!513361))))

(declare-fun lt!513377 () Unit!37736)

(declare-fun e!653210 () Unit!37736)

(assert (=> b!1148401 (= lt!513377 e!653210)))

(declare-fun c!113478 () Bool)

(declare-fun contains!6696 (ListLongMap!16315 (_ BitVec 64)) Bool)

(assert (=> b!1148401 (= c!113478 (contains!6696 lt!513369 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4646 (array!74489 array!74491 (_ BitVec 32) (_ BitVec 32) V!43555 V!43555 (_ BitVec 32) Int) ListLongMap!16315)

(assert (=> b!1148401 (= lt!513369 (getCurrentListMapNoExtraKeys!4646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53034 () Bool)

(declare-fun call!53037 () ListLongMap!16315)

(declare-fun call!53040 () ListLongMap!16315)

(assert (=> bm!53034 (= call!53037 call!53040)))

(declare-fun mapNonEmpty!45056 () Bool)

(declare-fun mapRes!45056 () Bool)

(declare-fun tp!85583 () Bool)

(declare-fun e!653209 () Bool)

(assert (=> mapNonEmpty!45056 (= mapRes!45056 (and tp!85583 e!653209))))

(declare-fun mapValue!45056 () ValueCell!13701)

(declare-fun mapRest!45056 () (Array (_ BitVec 32) ValueCell!13701))

(declare-fun mapKey!45056 () (_ BitVec 32))

(assert (=> mapNonEmpty!45056 (= (arr!35896 _values!996) (store mapRest!45056 mapKey!45056 mapValue!45056))))

(declare-fun b!1148402 () Bool)

(declare-fun tp_is_empty!28821 () Bool)

(assert (=> b!1148402 (= e!653209 tp_is_empty!28821)))

(declare-fun b!1148403 () Bool)

(declare-fun e!653206 () Unit!37736)

(declare-fun e!653208 () Unit!37736)

(assert (=> b!1148403 (= e!653206 e!653208)))

(declare-fun c!113477 () Bool)

(declare-fun lt!513370 () Bool)

(assert (=> b!1148403 (= c!113477 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513370))))

(declare-fun b!1148404 () Bool)

(assert (=> b!1148404 (= c!113479 (and (not lt!513370) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653204 () Unit!37736)

(assert (=> b!1148404 (= e!653204 e!653206)))

(declare-fun mapIsEmpty!45056 () Bool)

(assert (=> mapIsEmpty!45056 mapRes!45056))

(declare-fun lt!513378 () array!74489)

(declare-fun call!53041 () ListLongMap!16315)

(declare-fun bm!53035 () Bool)

(declare-fun lt!513374 () array!74491)

(assert (=> bm!53035 (= call!53041 (getCurrentListMapNoExtraKeys!4646 lt!513378 lt!513374 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148405 () Bool)

(declare-fun e!653205 () Bool)

(assert (=> b!1148405 (= e!653214 e!653205)))

(declare-fun res!764222 () Bool)

(assert (=> b!1148405 (=> (not res!764222) (not e!653205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74489 (_ BitVec 32)) Bool)

(assert (=> b!1148405 (= res!764222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513378 mask!1564))))

(assert (=> b!1148405 (= lt!513378 (array!74490 (store (arr!35895 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36431 _keys!1208)))))

(declare-fun b!1148406 () Bool)

(declare-fun e!653220 () Bool)

(assert (=> b!1148406 (= e!653205 (not e!653220))))

(declare-fun res!764224 () Bool)

(assert (=> b!1148406 (=> res!764224 e!653220)))

(assert (=> b!1148406 (= res!764224 (bvsgt from!1455 i!673))))

(assert (=> b!1148406 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513371 () Unit!37736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74489 (_ BitVec 64) (_ BitVec 32)) Unit!37736)

(assert (=> b!1148406 (= lt!513371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!653217 () Bool)

(declare-fun b!1148407 () Bool)

(assert (=> b!1148407 (= e!653217 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513370) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148408 () Bool)

(declare-fun lt!513363 () Unit!37736)

(assert (=> b!1148408 (= e!653206 lt!513363)))

(assert (=> b!1148408 (= lt!513363 call!53039)))

(declare-fun call!53034 () Bool)

(assert (=> b!1148408 call!53034))

(declare-fun b!1148409 () Bool)

(declare-fun res!764227 () Bool)

(assert (=> b!1148409 (=> (not res!764227) (not e!653214))))

(declare-datatypes ((List!25098 0))(
  ( (Nil!25095) (Cons!25094 (h!26303 (_ BitVec 64)) (t!36381 List!25098)) )
))
(declare-fun arrayNoDuplicates!0 (array!74489 (_ BitVec 32) List!25098) Bool)

(assert (=> b!1148409 (= res!764227 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25095))))

(declare-fun b!1148410 () Bool)

(declare-fun e!653212 () Bool)

(assert (=> b!1148410 (= e!653212 tp_is_empty!28821)))

(declare-fun res!764217 () Bool)

(assert (=> start!98686 (=> (not res!764217) (not e!653214))))

(assert (=> start!98686 (= res!764217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36431 _keys!1208))))))

(assert (=> start!98686 e!653214))

(assert (=> start!98686 tp_is_empty!28821))

(declare-fun array_inv!27494 (array!74489) Bool)

(assert (=> start!98686 (array_inv!27494 _keys!1208)))

(assert (=> start!98686 true))

(assert (=> start!98686 tp!85584))

(declare-fun e!653211 () Bool)

(declare-fun array_inv!27495 (array!74491) Bool)

(assert (=> start!98686 (and (array_inv!27495 _values!996) e!653211)))

(declare-fun bm!53031 () Bool)

(assert (=> bm!53031 (= call!53040 (+!3595 lt!513369 (ite (or c!113482 c!113479) (tuple2!18347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1148411 () Bool)

(declare-fun res!764219 () Bool)

(assert (=> b!1148411 (=> (not res!764219) (not e!653214))))

(assert (=> b!1148411 (= res!764219 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36431 _keys!1208))))))

(declare-fun b!1148412 () Bool)

(assert (=> b!1148412 (= e!653220 e!653216)))

(declare-fun res!764226 () Bool)

(assert (=> b!1148412 (=> res!764226 e!653216)))

(assert (=> b!1148412 (= res!764226 (not (= from!1455 i!673)))))

(declare-fun lt!513373 () ListLongMap!16315)

(assert (=> b!1148412 (= lt!513373 (getCurrentListMapNoExtraKeys!4646 lt!513378 lt!513374 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148412 (= lt!513374 (array!74492 (store (arr!35896 _values!996) i!673 (ValueCellFull!13701 lt!513361)) (size!36432 _values!996)))))

(declare-fun dynLambda!2674 (Int (_ BitVec 64)) V!43555)

(assert (=> b!1148412 (= lt!513361 (dynLambda!2674 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513362 () ListLongMap!16315)

(assert (=> b!1148412 (= lt!513362 (getCurrentListMapNoExtraKeys!4646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53036 () Bool)

(declare-fun call!53038 () ListLongMap!16315)

(assert (=> bm!53036 (= call!53038 (getCurrentListMapNoExtraKeys!4646 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148413 () Bool)

(declare-fun Unit!37738 () Unit!37736)

(assert (=> b!1148413 (= e!653210 Unit!37738)))

(assert (=> b!1148413 (= lt!513370 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148413 (= c!113482 (and (not lt!513370) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513364 () Unit!37736)

(assert (=> b!1148413 (= lt!513364 e!653204)))

(declare-fun lt!513368 () Unit!37736)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!441 (array!74489 array!74491 (_ BitVec 32) (_ BitVec 32) V!43555 V!43555 (_ BitVec 64) (_ BitVec 32) Int) Unit!37736)

(assert (=> b!1148413 (= lt!513368 (lemmaListMapContainsThenArrayContainsFrom!441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113480 () Bool)

(assert (=> b!1148413 (= c!113480 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764215 () Bool)

(assert (=> b!1148413 (= res!764215 e!653217)))

(assert (=> b!1148413 (=> (not res!764215) (not e!653215))))

(assert (=> b!1148413 e!653215))

(declare-fun lt!513376 () Unit!37736)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74489 (_ BitVec 32) (_ BitVec 32)) Unit!37736)

(assert (=> b!1148413 (= lt!513376 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148413 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25095)))

(declare-fun lt!513366 () Unit!37736)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74489 (_ BitVec 64) (_ BitVec 32) List!25098) Unit!37736)

(assert (=> b!1148413 (= lt!513366 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25095))))

(assert (=> b!1148413 false))

(declare-fun b!1148414 () Bool)

(assert (=> b!1148414 (= e!653211 (and e!653212 mapRes!45056))))

(declare-fun condMapEmpty!45056 () Bool)

(declare-fun mapDefault!45056 () ValueCell!13701)

(assert (=> b!1148414 (= condMapEmpty!45056 (= (arr!35896 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13701)) mapDefault!45056)))))

(declare-fun lt!513365 () ListLongMap!16315)

(declare-fun bm!53037 () Bool)

(declare-fun call!53036 () Bool)

(assert (=> bm!53037 (= call!53036 (contains!6696 (ite c!113482 lt!513365 call!53037) k0!934))))

(declare-fun b!1148415 () Bool)

(assert (=> b!1148415 (= e!653207 (= call!53041 (-!1308 call!53038 k0!934)))))

(declare-fun b!1148416 () Bool)

(assert (=> b!1148416 (contains!6696 (+!3595 lt!513365 (tuple2!18347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513372 () Unit!37736)

(assert (=> b!1148416 (= lt!513372 (addStillContains!845 lt!513365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1148416 call!53036))

(assert (=> b!1148416 (= lt!513365 call!53040)))

(declare-fun lt!513360 () Unit!37736)

(assert (=> b!1148416 (= lt!513360 call!53035)))

(assert (=> b!1148416 (= e!653204 lt!513372)))

(declare-fun b!1148417 () Bool)

(declare-fun Unit!37739 () Unit!37736)

(assert (=> b!1148417 (= e!653208 Unit!37739)))

(declare-fun b!1148418 () Bool)

(declare-fun res!764216 () Bool)

(assert (=> b!1148418 (=> (not res!764216) (not e!653214))))

(assert (=> b!1148418 (= res!764216 (= (select (arr!35895 _keys!1208) i!673) k0!934))))

(declare-fun b!1148419 () Bool)

(declare-fun res!764225 () Bool)

(assert (=> b!1148419 (=> (not res!764225) (not e!653214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148419 (= res!764225 (validMask!0 mask!1564))))

(declare-fun b!1148420 () Bool)

(assert (=> b!1148420 (= e!653207 (= call!53041 call!53038))))

(declare-fun b!1148421 () Bool)

(declare-fun res!764218 () Bool)

(assert (=> b!1148421 (=> (not res!764218) (not e!653214))))

(assert (=> b!1148421 (= res!764218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148422 () Bool)

(assert (=> b!1148422 (= e!653219 (= (-!1308 lt!513362 k0!934) lt!513369))))

(declare-fun b!1148423 () Bool)

(declare-fun res!764221 () Bool)

(assert (=> b!1148423 (=> (not res!764221) (not e!653214))))

(assert (=> b!1148423 (= res!764221 (and (= (size!36432 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36431 _keys!1208) (size!36432 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148424 () Bool)

(declare-fun res!764214 () Bool)

(assert (=> b!1148424 (=> (not res!764214) (not e!653205))))

(assert (=> b!1148424 (= res!764214 (arrayNoDuplicates!0 lt!513378 #b00000000000000000000000000000000 Nil!25095))))

(declare-fun b!1148425 () Bool)

(assert (=> b!1148425 call!53034))

(declare-fun lt!513367 () Unit!37736)

(assert (=> b!1148425 (= lt!513367 call!53039)))

(assert (=> b!1148425 (= e!653208 lt!513367)))

(declare-fun b!1148426 () Bool)

(declare-fun Unit!37740 () Unit!37736)

(assert (=> b!1148426 (= e!653210 Unit!37740)))

(declare-fun b!1148427 () Bool)

(assert (=> b!1148427 (= e!653217 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53038 () Bool)

(assert (=> bm!53038 (= call!53034 call!53036)))

(assert (= (and start!98686 res!764217) b!1148419))

(assert (= (and b!1148419 res!764225) b!1148423))

(assert (= (and b!1148423 res!764221) b!1148421))

(assert (= (and b!1148421 res!764218) b!1148409))

(assert (= (and b!1148409 res!764227) b!1148411))

(assert (= (and b!1148411 res!764219) b!1148399))

(assert (= (and b!1148399 res!764228) b!1148418))

(assert (= (and b!1148418 res!764216) b!1148405))

(assert (= (and b!1148405 res!764222) b!1148424))

(assert (= (and b!1148424 res!764214) b!1148406))

(assert (= (and b!1148406 (not res!764224)) b!1148412))

(assert (= (and b!1148412 (not res!764226)) b!1148400))

(assert (= (and b!1148400 c!113481) b!1148415))

(assert (= (and b!1148400 (not c!113481)) b!1148420))

(assert (= (or b!1148415 b!1148420) bm!53035))

(assert (= (or b!1148415 b!1148420) bm!53036))

(assert (= (and b!1148400 (not res!764223)) b!1148401))

(assert (= (and b!1148401 c!113478) b!1148413))

(assert (= (and b!1148401 (not c!113478)) b!1148426))

(assert (= (and b!1148413 c!113482) b!1148416))

(assert (= (and b!1148413 (not c!113482)) b!1148404))

(assert (= (and b!1148404 c!113479) b!1148408))

(assert (= (and b!1148404 (not c!113479)) b!1148403))

(assert (= (and b!1148403 c!113477) b!1148425))

(assert (= (and b!1148403 (not c!113477)) b!1148417))

(assert (= (or b!1148408 b!1148425) bm!53032))

(assert (= (or b!1148408 b!1148425) bm!53034))

(assert (= (or b!1148408 b!1148425) bm!53038))

(assert (= (or b!1148416 bm!53038) bm!53037))

(assert (= (or b!1148416 bm!53032) bm!53033))

(assert (= (or b!1148416 bm!53034) bm!53031))

(assert (= (and b!1148413 c!113480) b!1148427))

(assert (= (and b!1148413 (not c!113480)) b!1148407))

(assert (= (and b!1148413 res!764215) b!1148398))

(assert (= (and b!1148401 res!764220) b!1148422))

(assert (= (and b!1148414 condMapEmpty!45056) mapIsEmpty!45056))

(assert (= (and b!1148414 (not condMapEmpty!45056)) mapNonEmpty!45056))

(get-info :version)

(assert (= (and mapNonEmpty!45056 ((_ is ValueCellFull!13701) mapValue!45056)) b!1148402))

(assert (= (and b!1148414 ((_ is ValueCellFull!13701) mapDefault!45056)) b!1148410))

(assert (= start!98686 b!1148414))

(declare-fun b_lambda!19397 () Bool)

(assert (=> (not b_lambda!19397) (not b!1148412)))

(declare-fun t!36379 () Bool)

(declare-fun tb!9103 () Bool)

(assert (=> (and start!98686 (= defaultEntry!1004 defaultEntry!1004) t!36379) tb!9103))

(declare-fun result!18771 () Bool)

(assert (=> tb!9103 (= result!18771 tp_is_empty!28821)))

(assert (=> b!1148412 t!36379))

(declare-fun b_and!39433 () Bool)

(assert (= b_and!39431 (and (=> t!36379 result!18771) b_and!39433)))

(declare-fun m!1058901 () Bool)

(assert (=> b!1148409 m!1058901))

(declare-fun m!1058903 () Bool)

(assert (=> b!1148421 m!1058903))

(declare-fun m!1058905 () Bool)

(assert (=> mapNonEmpty!45056 m!1058905))

(declare-fun m!1058907 () Bool)

(assert (=> b!1148401 m!1058907))

(declare-fun m!1058909 () Bool)

(assert (=> b!1148401 m!1058909))

(declare-fun m!1058911 () Bool)

(assert (=> b!1148401 m!1058911))

(declare-fun m!1058913 () Bool)

(assert (=> b!1148401 m!1058913))

(declare-fun m!1058915 () Bool)

(assert (=> b!1148401 m!1058915))

(assert (=> b!1148401 m!1058909))

(declare-fun m!1058917 () Bool)

(assert (=> b!1148401 m!1058917))

(declare-fun m!1058919 () Bool)

(assert (=> b!1148401 m!1058919))

(assert (=> b!1148401 m!1058913))

(declare-fun m!1058921 () Bool)

(assert (=> b!1148401 m!1058921))

(assert (=> b!1148401 m!1058911))

(assert (=> b!1148401 m!1058913))

(declare-fun m!1058923 () Bool)

(assert (=> b!1148413 m!1058923))

(declare-fun m!1058925 () Bool)

(assert (=> b!1148413 m!1058925))

(declare-fun m!1058927 () Bool)

(assert (=> b!1148413 m!1058927))

(declare-fun m!1058929 () Bool)

(assert (=> b!1148413 m!1058929))

(declare-fun m!1058931 () Bool)

(assert (=> start!98686 m!1058931))

(declare-fun m!1058933 () Bool)

(assert (=> start!98686 m!1058933))

(declare-fun m!1058935 () Bool)

(assert (=> b!1148427 m!1058935))

(declare-fun m!1058937 () Bool)

(assert (=> b!1148399 m!1058937))

(assert (=> b!1148400 m!1058913))

(declare-fun m!1058939 () Bool)

(assert (=> b!1148400 m!1058939))

(declare-fun m!1058941 () Bool)

(assert (=> b!1148412 m!1058941))

(declare-fun m!1058943 () Bool)

(assert (=> b!1148412 m!1058943))

(declare-fun m!1058945 () Bool)

(assert (=> b!1148412 m!1058945))

(declare-fun m!1058947 () Bool)

(assert (=> b!1148412 m!1058947))

(declare-fun m!1058949 () Bool)

(assert (=> bm!53035 m!1058949))

(declare-fun m!1058951 () Bool)

(assert (=> b!1148422 m!1058951))

(declare-fun m!1058953 () Bool)

(assert (=> b!1148416 m!1058953))

(assert (=> b!1148416 m!1058953))

(declare-fun m!1058955 () Bool)

(assert (=> b!1148416 m!1058955))

(declare-fun m!1058957 () Bool)

(assert (=> b!1148416 m!1058957))

(assert (=> b!1148398 m!1058935))

(declare-fun m!1058959 () Bool)

(assert (=> bm!53033 m!1058959))

(declare-fun m!1058961 () Bool)

(assert (=> bm!53037 m!1058961))

(assert (=> bm!53036 m!1058907))

(declare-fun m!1058963 () Bool)

(assert (=> b!1148415 m!1058963))

(declare-fun m!1058965 () Bool)

(assert (=> b!1148419 m!1058965))

(declare-fun m!1058967 () Bool)

(assert (=> b!1148424 m!1058967))

(declare-fun m!1058969 () Bool)

(assert (=> b!1148405 m!1058969))

(declare-fun m!1058971 () Bool)

(assert (=> b!1148405 m!1058971))

(declare-fun m!1058973 () Bool)

(assert (=> bm!53031 m!1058973))

(declare-fun m!1058975 () Bool)

(assert (=> b!1148418 m!1058975))

(declare-fun m!1058977 () Bool)

(assert (=> b!1148406 m!1058977))

(declare-fun m!1058979 () Bool)

(assert (=> b!1148406 m!1058979))

(check-sat (not b_lambda!19397) (not bm!53036) (not b!1148424) (not b!1148421) (not b!1148398) (not b!1148406) (not b!1148427) (not b!1148400) (not b!1148399) (not bm!53035) (not mapNonEmpty!45056) (not bm!53037) (not b!1148412) (not b!1148409) (not b_next!24291) (not bm!53033) (not b!1148416) (not b!1148413) tp_is_empty!28821 b_and!39433 (not b!1148401) (not start!98686) (not bm!53031) (not b!1148405) (not b!1148419) (not b!1148422) (not b!1148415))
(check-sat b_and!39433 (not b_next!24291))
