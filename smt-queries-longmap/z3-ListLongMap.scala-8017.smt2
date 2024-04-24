; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99178 () Bool)

(assert start!99178)

(declare-fun b_free!24547 () Bool)

(declare-fun b_next!24547 () Bool)

(assert (=> start!99178 (= b_free!24547 (not b_next!24547))))

(declare-fun tp!86351 () Bool)

(declare-fun b_and!39945 () Bool)

(assert (=> start!99178 (= tp!86351 b_and!39945)))

(declare-fun b!1161463 () Bool)

(declare-fun e!660577 () Bool)

(declare-fun tp_is_empty!29077 () Bool)

(assert (=> b!1161463 (= e!660577 tp_is_empty!29077)))

(declare-fun b!1161464 () Bool)

(declare-fun res!770491 () Bool)

(declare-fun e!660580 () Bool)

(assert (=> b!1161464 (=> (not res!770491) (not e!660580))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161464 (= res!770491 (validMask!0 mask!1564))))

(declare-fun b!1161465 () Bool)

(declare-fun e!660567 () Bool)

(declare-fun e!660579 () Bool)

(assert (=> b!1161465 (= e!660567 (not e!660579))))

(declare-fun res!770489 () Bool)

(assert (=> b!1161465 (=> res!770489 e!660579)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161465 (= res!770489 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75043 0))(
  ( (array!75044 (arr!36166 (Array (_ BitVec 32) (_ BitVec 64))) (size!36703 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75043)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161465 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38234 0))(
  ( (Unit!38235) )
))
(declare-fun lt!522273 () Unit!38234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75043 (_ BitVec 64) (_ BitVec 32)) Unit!38234)

(assert (=> b!1161465 (= lt!522273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161466 () Bool)

(declare-fun res!770486 () Bool)

(assert (=> b!1161466 (=> (not res!770486) (not e!660580))))

(declare-datatypes ((List!25352 0))(
  ( (Nil!25349) (Cons!25348 (h!26566 (_ BitVec 64)) (t!36883 List!25352)) )
))
(declare-fun arrayNoDuplicates!0 (array!75043 (_ BitVec 32) List!25352) Bool)

(assert (=> b!1161466 (= res!770486 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25349))))

(declare-datatypes ((V!43897 0))(
  ( (V!43898 (val!14595 Int)) )
))
(declare-fun zeroValue!944 () V!43897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!522285 () array!75043)

(declare-datatypes ((ValueCell!13829 0))(
  ( (ValueCellFull!13829 (v!17228 V!43897)) (EmptyCell!13829) )
))
(declare-datatypes ((array!75045 0))(
  ( (array!75046 (arr!36167 (Array (_ BitVec 32) ValueCell!13829)) (size!36704 (_ BitVec 32))) )
))
(declare-fun lt!522274 () array!75045)

(declare-fun e!660565 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18614 0))(
  ( (tuple2!18615 (_1!9318 (_ BitVec 64)) (_2!9318 V!43897)) )
))
(declare-datatypes ((List!25353 0))(
  ( (Nil!25350) (Cons!25349 (h!26567 tuple2!18614) (t!36884 List!25353)) )
))
(declare-datatypes ((ListLongMap!16591 0))(
  ( (ListLongMap!16592 (toList!8311 List!25353)) )
))
(declare-fun lt!522275 () ListLongMap!16591)

(declare-fun b!1161467 () Bool)

(declare-fun minValue!944 () V!43897)

(declare-fun getCurrentListMapNoExtraKeys!4803 (array!75043 array!75045 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 32) Int) ListLongMap!16591)

(assert (=> b!1161467 (= e!660565 (= lt!522275 (getCurrentListMapNoExtraKeys!4803 lt!522285 lt!522274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56168 () Bool)

(declare-fun call!56172 () Bool)

(declare-fun call!56174 () Bool)

(assert (=> bm!56168 (= call!56172 call!56174)))

(declare-fun b!1161468 () Bool)

(declare-fun res!770490 () Bool)

(assert (=> b!1161468 (=> (not res!770490) (not e!660580))))

(declare-fun _values!996 () array!75045)

(assert (=> b!1161468 (= res!770490 (and (= (size!36704 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36703 _keys!1208) (size!36704 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!522268 () ListLongMap!16591)

(declare-fun c!116184 () Bool)

(declare-fun call!56176 () Unit!38234)

(declare-fun bm!56169 () Bool)

(declare-fun c!116180 () Bool)

(declare-fun lt!522284 () ListLongMap!16591)

(declare-fun addStillContains!948 (ListLongMap!16591 (_ BitVec 64) V!43897 (_ BitVec 64)) Unit!38234)

(assert (=> bm!56169 (= call!56176 (addStillContains!948 (ite c!116184 lt!522268 lt!522284) (ite c!116184 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116180 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116184 minValue!944 (ite c!116180 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1161469 () Bool)

(declare-fun e!660573 () Bool)

(assert (=> b!1161469 (= e!660573 tp_is_empty!29077)))

(declare-fun b!1161470 () Bool)

(declare-fun e!660578 () Unit!38234)

(declare-fun lt!522278 () Unit!38234)

(assert (=> b!1161470 (= e!660578 lt!522278)))

(declare-fun call!56175 () Unit!38234)

(assert (=> b!1161470 (= lt!522278 call!56175)))

(assert (=> b!1161470 call!56172))

(declare-fun b!1161471 () Bool)

(declare-fun contains!6830 (ListLongMap!16591 (_ BitVec 64)) Bool)

(declare-fun +!3729 (ListLongMap!16591 tuple2!18614) ListLongMap!16591)

(assert (=> b!1161471 (contains!6830 (+!3729 lt!522268 (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522283 () Unit!38234)

(assert (=> b!1161471 (= lt!522283 call!56176)))

(assert (=> b!1161471 call!56174))

(declare-fun call!56173 () ListLongMap!16591)

(assert (=> b!1161471 (= lt!522268 call!56173)))

(declare-fun lt!522269 () Unit!38234)

(assert (=> b!1161471 (= lt!522269 (addStillContains!948 lt!522284 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!660571 () Unit!38234)

(assert (=> b!1161471 (= e!660571 lt!522283)))

(declare-fun b!1161472 () Bool)

(declare-fun res!770488 () Bool)

(assert (=> b!1161472 (=> (not res!770488) (not e!660580))))

(assert (=> b!1161472 (= res!770488 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36703 _keys!1208))))))

(declare-fun b!1161473 () Bool)

(declare-fun e!660570 () Bool)

(assert (=> b!1161473 (= e!660579 e!660570)))

(declare-fun res!770495 () Bool)

(assert (=> b!1161473 (=> res!770495 e!660570)))

(assert (=> b!1161473 (= res!770495 (not (= from!1455 i!673)))))

(declare-fun lt!522282 () ListLongMap!16591)

(assert (=> b!1161473 (= lt!522282 (getCurrentListMapNoExtraKeys!4803 lt!522285 lt!522274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522280 () V!43897)

(assert (=> b!1161473 (= lt!522274 (array!75046 (store (arr!36167 _values!996) i!673 (ValueCellFull!13829 lt!522280)) (size!36704 _values!996)))))

(declare-fun dynLambda!2806 (Int (_ BitVec 64)) V!43897)

(assert (=> b!1161473 (= lt!522280 (dynLambda!2806 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522271 () ListLongMap!16591)

(assert (=> b!1161473 (= lt!522271 (getCurrentListMapNoExtraKeys!4803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56170 () Bool)

(declare-fun call!56178 () ListLongMap!16591)

(assert (=> bm!56170 (= call!56178 (getCurrentListMapNoExtraKeys!4803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56171 () Bool)

(assert (=> bm!56171 (= call!56173 (+!3729 lt!522284 (ite (or c!116184 c!116180) (tuple2!18615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1161474 () Bool)

(declare-fun e!660576 () Unit!38234)

(assert (=> b!1161474 (= e!660578 e!660576)))

(declare-fun c!116181 () Bool)

(declare-fun lt!522281 () Bool)

(assert (=> b!1161474 (= c!116181 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522281))))

(declare-fun b!1161475 () Bool)

(assert (=> b!1161475 call!56172))

(declare-fun lt!522287 () Unit!38234)

(assert (=> b!1161475 (= lt!522287 call!56175)))

(assert (=> b!1161475 (= e!660576 lt!522287)))

(declare-fun mapIsEmpty!45440 () Bool)

(declare-fun mapRes!45440 () Bool)

(assert (=> mapIsEmpty!45440 mapRes!45440))

(declare-fun b!1161476 () Bool)

(declare-fun e!660566 () Bool)

(assert (=> b!1161476 (= e!660570 e!660566)))

(declare-fun res!770496 () Bool)

(assert (=> b!1161476 (=> res!770496 e!660566)))

(assert (=> b!1161476 (= res!770496 (not (= (select (arr!36166 _keys!1208) from!1455) k0!934)))))

(declare-fun e!660568 () Bool)

(assert (=> b!1161476 e!660568))

(declare-fun c!116179 () Bool)

(assert (=> b!1161476 (= c!116179 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522279 () Unit!38234)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 (array!75043 array!75045 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38234)

(assert (=> b!1161476 (= lt!522279 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161477 () Bool)

(declare-fun res!770485 () Bool)

(assert (=> b!1161477 (=> (not res!770485) (not e!660580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75043 (_ BitVec 32)) Bool)

(assert (=> b!1161477 (= res!770485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!770482 () Bool)

(assert (=> start!99178 (=> (not res!770482) (not e!660580))))

(assert (=> start!99178 (= res!770482 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36703 _keys!1208))))))

(assert (=> start!99178 e!660580))

(assert (=> start!99178 tp_is_empty!29077))

(declare-fun array_inv!27740 (array!75043) Bool)

(assert (=> start!99178 (array_inv!27740 _keys!1208)))

(assert (=> start!99178 true))

(assert (=> start!99178 tp!86351))

(declare-fun e!660574 () Bool)

(declare-fun array_inv!27741 (array!75045) Bool)

(assert (=> start!99178 (and (array_inv!27741 _values!996) e!660574)))

(declare-fun b!1161478 () Bool)

(declare-fun e!660575 () Bool)

(assert (=> b!1161478 (= e!660575 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522281) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161479 () Bool)

(declare-fun call!56171 () ListLongMap!16591)

(assert (=> b!1161479 (= e!660568 (= call!56171 call!56178))))

(declare-fun b!1161480 () Bool)

(assert (=> b!1161480 (= e!660575 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!56177 () ListLongMap!16591)

(declare-fun bm!56172 () Bool)

(assert (=> bm!56172 (= call!56174 (contains!6830 (ite c!116184 lt!522268 call!56177) k0!934))))

(declare-fun b!1161481 () Bool)

(declare-fun Unit!38236 () Unit!38234)

(assert (=> b!1161481 (= e!660576 Unit!38236)))

(declare-fun bm!56173 () Bool)

(assert (=> bm!56173 (= call!56175 call!56176)))

(declare-fun b!1161482 () Bool)

(declare-fun res!770483 () Bool)

(assert (=> b!1161482 (=> (not res!770483) (not e!660580))))

(assert (=> b!1161482 (= res!770483 (= (select (arr!36166 _keys!1208) i!673) k0!934))))

(declare-fun bm!56174 () Bool)

(assert (=> bm!56174 (= call!56177 call!56173)))

(declare-fun b!1161483 () Bool)

(declare-fun res!770494 () Bool)

(assert (=> b!1161483 (=> (not res!770494) (not e!660580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161483 (= res!770494 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45440 () Bool)

(declare-fun tp!86352 () Bool)

(assert (=> mapNonEmpty!45440 (= mapRes!45440 (and tp!86352 e!660577))))

(declare-fun mapRest!45440 () (Array (_ BitVec 32) ValueCell!13829))

(declare-fun mapValue!45440 () ValueCell!13829)

(declare-fun mapKey!45440 () (_ BitVec 32))

(assert (=> mapNonEmpty!45440 (= (arr!36167 _values!996) (store mapRest!45440 mapKey!45440 mapValue!45440))))

(declare-fun b!1161484 () Bool)

(declare-fun e!660572 () Unit!38234)

(declare-fun Unit!38237 () Unit!38234)

(assert (=> b!1161484 (= e!660572 Unit!38237)))

(declare-fun b!1161485 () Bool)

(assert (=> b!1161485 (= c!116180 (and (not lt!522281) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1161485 (= e!660571 e!660578)))

(declare-fun b!1161486 () Bool)

(declare-fun -!1409 (ListLongMap!16591 (_ BitVec 64)) ListLongMap!16591)

(assert (=> b!1161486 (= e!660568 (= call!56171 (-!1409 call!56178 k0!934)))))

(declare-fun b!1161487 () Bool)

(declare-fun Unit!38238 () Unit!38234)

(assert (=> b!1161487 (= e!660572 Unit!38238)))

(assert (=> b!1161487 (= lt!522281 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1161487 (= c!116184 (and (not lt!522281) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522272 () Unit!38234)

(assert (=> b!1161487 (= lt!522272 e!660571)))

(declare-fun lt!522289 () Unit!38234)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!536 (array!75043 array!75045 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 64) (_ BitVec 32) Int) Unit!38234)

(assert (=> b!1161487 (= lt!522289 (lemmaListMapContainsThenArrayContainsFrom!536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116183 () Bool)

(assert (=> b!1161487 (= c!116183 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770487 () Bool)

(assert (=> b!1161487 (= res!770487 e!660575)))

(declare-fun e!660564 () Bool)

(assert (=> b!1161487 (=> (not res!770487) (not e!660564))))

(assert (=> b!1161487 e!660564))

(declare-fun lt!522270 () Unit!38234)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75043 (_ BitVec 32) (_ BitVec 32)) Unit!38234)

(assert (=> b!1161487 (= lt!522270 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161487 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25349)))

(declare-fun lt!522277 () Unit!38234)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75043 (_ BitVec 64) (_ BitVec 32) List!25352) Unit!38234)

(assert (=> b!1161487 (= lt!522277 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25349))))

(assert (=> b!1161487 false))

(declare-fun bm!56175 () Bool)

(assert (=> bm!56175 (= call!56171 (getCurrentListMapNoExtraKeys!4803 lt!522285 lt!522274 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161488 () Bool)

(assert (=> b!1161488 (= e!660566 true)))

(assert (=> b!1161488 e!660565))

(declare-fun res!770493 () Bool)

(assert (=> b!1161488 (=> (not res!770493) (not e!660565))))

(assert (=> b!1161488 (= res!770493 (= lt!522275 lt!522284))))

(assert (=> b!1161488 (= lt!522275 (-!1409 lt!522271 k0!934))))

(declare-fun lt!522276 () V!43897)

(assert (=> b!1161488 (= (-!1409 (+!3729 lt!522284 (tuple2!18615 (select (arr!36166 _keys!1208) from!1455) lt!522276)) (select (arr!36166 _keys!1208) from!1455)) lt!522284)))

(declare-fun lt!522286 () Unit!38234)

(declare-fun addThenRemoveForNewKeyIsSame!239 (ListLongMap!16591 (_ BitVec 64) V!43897) Unit!38234)

(assert (=> b!1161488 (= lt!522286 (addThenRemoveForNewKeyIsSame!239 lt!522284 (select (arr!36166 _keys!1208) from!1455) lt!522276))))

(declare-fun get!18466 (ValueCell!13829 V!43897) V!43897)

(assert (=> b!1161488 (= lt!522276 (get!18466 (select (arr!36167 _values!996) from!1455) lt!522280))))

(declare-fun lt!522288 () Unit!38234)

(assert (=> b!1161488 (= lt!522288 e!660572)))

(declare-fun c!116182 () Bool)

(assert (=> b!1161488 (= c!116182 (contains!6830 lt!522284 k0!934))))

(assert (=> b!1161488 (= lt!522284 (getCurrentListMapNoExtraKeys!4803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161489 () Bool)

(declare-fun res!770492 () Bool)

(assert (=> b!1161489 (=> (not res!770492) (not e!660567))))

(assert (=> b!1161489 (= res!770492 (arrayNoDuplicates!0 lt!522285 #b00000000000000000000000000000000 Nil!25349))))

(declare-fun b!1161490 () Bool)

(assert (=> b!1161490 (= e!660580 e!660567)))

(declare-fun res!770484 () Bool)

(assert (=> b!1161490 (=> (not res!770484) (not e!660567))))

(assert (=> b!1161490 (= res!770484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522285 mask!1564))))

(assert (=> b!1161490 (= lt!522285 (array!75044 (store (arr!36166 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36703 _keys!1208)))))

(declare-fun b!1161491 () Bool)

(assert (=> b!1161491 (= e!660564 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161492 () Bool)

(assert (=> b!1161492 (= e!660574 (and e!660573 mapRes!45440))))

(declare-fun condMapEmpty!45440 () Bool)

(declare-fun mapDefault!45440 () ValueCell!13829)

(assert (=> b!1161492 (= condMapEmpty!45440 (= (arr!36167 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13829)) mapDefault!45440)))))

(assert (= (and start!99178 res!770482) b!1161464))

(assert (= (and b!1161464 res!770491) b!1161468))

(assert (= (and b!1161468 res!770490) b!1161477))

(assert (= (and b!1161477 res!770485) b!1161466))

(assert (= (and b!1161466 res!770486) b!1161472))

(assert (= (and b!1161472 res!770488) b!1161483))

(assert (= (and b!1161483 res!770494) b!1161482))

(assert (= (and b!1161482 res!770483) b!1161490))

(assert (= (and b!1161490 res!770484) b!1161489))

(assert (= (and b!1161489 res!770492) b!1161465))

(assert (= (and b!1161465 (not res!770489)) b!1161473))

(assert (= (and b!1161473 (not res!770495)) b!1161476))

(assert (= (and b!1161476 c!116179) b!1161486))

(assert (= (and b!1161476 (not c!116179)) b!1161479))

(assert (= (or b!1161486 b!1161479) bm!56175))

(assert (= (or b!1161486 b!1161479) bm!56170))

(assert (= (and b!1161476 (not res!770496)) b!1161488))

(assert (= (and b!1161488 c!116182) b!1161487))

(assert (= (and b!1161488 (not c!116182)) b!1161484))

(assert (= (and b!1161487 c!116184) b!1161471))

(assert (= (and b!1161487 (not c!116184)) b!1161485))

(assert (= (and b!1161485 c!116180) b!1161470))

(assert (= (and b!1161485 (not c!116180)) b!1161474))

(assert (= (and b!1161474 c!116181) b!1161475))

(assert (= (and b!1161474 (not c!116181)) b!1161481))

(assert (= (or b!1161470 b!1161475) bm!56173))

(assert (= (or b!1161470 b!1161475) bm!56174))

(assert (= (or b!1161470 b!1161475) bm!56168))

(assert (= (or b!1161471 bm!56168) bm!56172))

(assert (= (or b!1161471 bm!56173) bm!56169))

(assert (= (or b!1161471 bm!56174) bm!56171))

(assert (= (and b!1161487 c!116183) b!1161480))

(assert (= (and b!1161487 (not c!116183)) b!1161478))

(assert (= (and b!1161487 res!770487) b!1161491))

(assert (= (and b!1161488 res!770493) b!1161467))

(assert (= (and b!1161492 condMapEmpty!45440) mapIsEmpty!45440))

(assert (= (and b!1161492 (not condMapEmpty!45440)) mapNonEmpty!45440))

(get-info :version)

(assert (= (and mapNonEmpty!45440 ((_ is ValueCellFull!13829) mapValue!45440)) b!1161463))

(assert (= (and b!1161492 ((_ is ValueCellFull!13829) mapDefault!45440)) b!1161469))

(assert (= start!99178 b!1161492))

(declare-fun b_lambda!19647 () Bool)

(assert (=> (not b_lambda!19647) (not b!1161473)))

(declare-fun t!36882 () Bool)

(declare-fun tb!9351 () Bool)

(assert (=> (and start!99178 (= defaultEntry!1004 defaultEntry!1004) t!36882) tb!9351))

(declare-fun result!19275 () Bool)

(assert (=> tb!9351 (= result!19275 tp_is_empty!29077)))

(assert (=> b!1161473 t!36882))

(declare-fun b_and!39947 () Bool)

(assert (= b_and!39945 (and (=> t!36882 result!19275) b_and!39947)))

(declare-fun m!1070729 () Bool)

(assert (=> b!1161473 m!1070729))

(declare-fun m!1070731 () Bool)

(assert (=> b!1161473 m!1070731))

(declare-fun m!1070733 () Bool)

(assert (=> b!1161473 m!1070733))

(declare-fun m!1070735 () Bool)

(assert (=> b!1161473 m!1070735))

(declare-fun m!1070737 () Bool)

(assert (=> b!1161488 m!1070737))

(declare-fun m!1070739 () Bool)

(assert (=> b!1161488 m!1070739))

(declare-fun m!1070741 () Bool)

(assert (=> b!1161488 m!1070741))

(declare-fun m!1070743 () Bool)

(assert (=> b!1161488 m!1070743))

(assert (=> b!1161488 m!1070743))

(declare-fun m!1070745 () Bool)

(assert (=> b!1161488 m!1070745))

(assert (=> b!1161488 m!1070741))

(declare-fun m!1070747 () Bool)

(assert (=> b!1161488 m!1070747))

(declare-fun m!1070749 () Bool)

(assert (=> b!1161488 m!1070749))

(assert (=> b!1161488 m!1070747))

(declare-fun m!1070751 () Bool)

(assert (=> b!1161488 m!1070751))

(assert (=> b!1161488 m!1070747))

(declare-fun m!1070753 () Bool)

(assert (=> b!1161488 m!1070753))

(declare-fun m!1070755 () Bool)

(assert (=> b!1161490 m!1070755))

(declare-fun m!1070757 () Bool)

(assert (=> b!1161490 m!1070757))

(declare-fun m!1070759 () Bool)

(assert (=> start!99178 m!1070759))

(declare-fun m!1070761 () Bool)

(assert (=> start!99178 m!1070761))

(declare-fun m!1070763 () Bool)

(assert (=> b!1161491 m!1070763))

(declare-fun m!1070765 () Bool)

(assert (=> b!1161489 m!1070765))

(declare-fun m!1070767 () Bool)

(assert (=> b!1161464 m!1070767))

(assert (=> b!1161480 m!1070763))

(declare-fun m!1070769 () Bool)

(assert (=> mapNonEmpty!45440 m!1070769))

(declare-fun m!1070771 () Bool)

(assert (=> bm!56175 m!1070771))

(declare-fun m!1070773 () Bool)

(assert (=> bm!56169 m!1070773))

(declare-fun m!1070775 () Bool)

(assert (=> b!1161487 m!1070775))

(declare-fun m!1070777 () Bool)

(assert (=> b!1161487 m!1070777))

(declare-fun m!1070779 () Bool)

(assert (=> b!1161487 m!1070779))

(declare-fun m!1070781 () Bool)

(assert (=> b!1161487 m!1070781))

(assert (=> b!1161467 m!1070771))

(assert (=> b!1161476 m!1070747))

(declare-fun m!1070783 () Bool)

(assert (=> b!1161476 m!1070783))

(declare-fun m!1070785 () Bool)

(assert (=> b!1161483 m!1070785))

(declare-fun m!1070787 () Bool)

(assert (=> bm!56171 m!1070787))

(declare-fun m!1070789 () Bool)

(assert (=> b!1161466 m!1070789))

(declare-fun m!1070791 () Bool)

(assert (=> b!1161477 m!1070791))

(declare-fun m!1070793 () Bool)

(assert (=> b!1161465 m!1070793))

(declare-fun m!1070795 () Bool)

(assert (=> b!1161465 m!1070795))

(declare-fun m!1070797 () Bool)

(assert (=> b!1161471 m!1070797))

(assert (=> b!1161471 m!1070797))

(declare-fun m!1070799 () Bool)

(assert (=> b!1161471 m!1070799))

(declare-fun m!1070801 () Bool)

(assert (=> b!1161471 m!1070801))

(declare-fun m!1070803 () Bool)

(assert (=> b!1161486 m!1070803))

(declare-fun m!1070805 () Bool)

(assert (=> bm!56172 m!1070805))

(declare-fun m!1070807 () Bool)

(assert (=> b!1161482 m!1070807))

(assert (=> bm!56170 m!1070739))

(check-sat (not b_lambda!19647) (not b!1161473) (not b!1161483) (not bm!56170) (not b!1161467) (not bm!56171) (not b!1161486) (not b!1161477) (not b!1161489) (not b!1161464) b_and!39947 (not b!1161476) (not start!99178) (not b!1161466) (not mapNonEmpty!45440) (not b_next!24547) (not b!1161488) tp_is_empty!29077 (not b!1161480) (not bm!56175) (not bm!56169) (not b!1161491) (not b!1161471) (not b!1161490) (not b!1161465) (not bm!56172) (not b!1161487))
(check-sat b_and!39947 (not b_next!24547))
