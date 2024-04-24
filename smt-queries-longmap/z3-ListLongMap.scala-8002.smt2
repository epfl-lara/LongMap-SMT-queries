; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99088 () Bool)

(assert start!99088)

(declare-fun b_free!24457 () Bool)

(declare-fun b_next!24457 () Bool)

(assert (=> start!99088 (= b_free!24457 (not b_next!24457))))

(declare-fun tp!86082 () Bool)

(declare-fun b_and!39765 () Bool)

(assert (=> start!99088 (= tp!86082 b_and!39765)))

(declare-datatypes ((array!74865 0))(
  ( (array!74866 (arr!36077 (Array (_ BitVec 32) (_ BitVec 64))) (size!36614 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74865)

(declare-fun b!1157323 () Bool)

(declare-fun e!658270 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157323 (= e!658270 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157324 () Bool)

(declare-fun res!768463 () Bool)

(declare-fun e!658269 () Bool)

(assert (=> b!1157324 (=> (not res!768463) (not e!658269))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157324 (= res!768463 (= (select (arr!36077 _keys!1208) i!673) k0!934))))

(declare-fun bm!55088 () Bool)

(declare-fun call!55093 () Bool)

(declare-fun call!55091 () Bool)

(assert (=> bm!55088 (= call!55093 call!55091)))

(declare-fun lt!519316 () Bool)

(declare-fun b!1157325 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1157325 (= e!658270 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519316) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55089 () Bool)

(declare-datatypes ((Unit!38050 0))(
  ( (Unit!38051) )
))
(declare-fun call!55097 () Unit!38050)

(declare-fun call!55094 () Unit!38050)

(assert (=> bm!55089 (= call!55097 call!55094)))

(declare-fun b!1157326 () Bool)

(declare-fun res!768460 () Bool)

(assert (=> b!1157326 (=> (not res!768460) (not e!658269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157326 (= res!768460 (validKeyInArray!0 k0!934))))

(declare-fun b!1157327 () Bool)

(declare-fun e!658274 () Bool)

(assert (=> b!1157327 (= e!658274 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157328 () Bool)

(declare-fun res!768462 () Bool)

(declare-fun e!658272 () Bool)

(assert (=> b!1157328 (=> (not res!768462) (not e!658272))))

(declare-fun lt!519298 () array!74865)

(declare-datatypes ((List!25269 0))(
  ( (Nil!25266) (Cons!25265 (h!26483 (_ BitVec 64)) (t!36710 List!25269)) )
))
(declare-fun arrayNoDuplicates!0 (array!74865 (_ BitVec 32) List!25269) Bool)

(assert (=> b!1157328 (= res!768462 (arrayNoDuplicates!0 lt!519298 #b00000000000000000000000000000000 Nil!25266))))

(declare-fun b!1157329 () Bool)

(declare-fun e!658284 () Bool)

(declare-fun e!658275 () Bool)

(declare-fun mapRes!45305 () Bool)

(assert (=> b!1157329 (= e!658284 (and e!658275 mapRes!45305))))

(declare-fun condMapEmpty!45305 () Bool)

(declare-datatypes ((V!43777 0))(
  ( (V!43778 (val!14550 Int)) )
))
(declare-datatypes ((ValueCell!13784 0))(
  ( (ValueCellFull!13784 (v!17183 V!43777)) (EmptyCell!13784) )
))
(declare-datatypes ((array!74867 0))(
  ( (array!74868 (arr!36078 (Array (_ BitVec 32) ValueCell!13784)) (size!36615 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74867)

(declare-fun mapDefault!45305 () ValueCell!13784)

(assert (=> b!1157329 (= condMapEmpty!45305 (= (arr!36078 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13784)) mapDefault!45305)))))

(declare-fun b!1157330 () Bool)

(declare-fun e!658282 () Unit!38050)

(declare-fun Unit!38052 () Unit!38050)

(assert (=> b!1157330 (= e!658282 Unit!38052)))

(declare-fun zeroValue!944 () V!43777)

(declare-datatypes ((tuple2!18526 0))(
  ( (tuple2!18527 (_1!9274 (_ BitVec 64)) (_2!9274 V!43777)) )
))
(declare-datatypes ((List!25270 0))(
  ( (Nil!25267) (Cons!25266 (h!26484 tuple2!18526) (t!36711 List!25270)) )
))
(declare-datatypes ((ListLongMap!16503 0))(
  ( (ListLongMap!16504 (toList!8267 List!25270)) )
))
(declare-fun lt!519309 () ListLongMap!16503)

(declare-fun c!115374 () Bool)

(declare-fun bm!55091 () Bool)

(declare-fun c!115373 () Bool)

(declare-fun minValue!944 () V!43777)

(declare-fun addStillContains!913 (ListLongMap!16503 (_ BitVec 64) V!43777 (_ BitVec 64)) Unit!38050)

(assert (=> bm!55091 (= call!55094 (addStillContains!913 lt!519309 (ite (or c!115373 c!115374) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115373 c!115374) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1157331 () Bool)

(declare-fun e!658277 () Unit!38050)

(declare-fun Unit!38053 () Unit!38050)

(assert (=> b!1157331 (= e!658277 Unit!38053)))

(assert (=> b!1157331 (= lt!519316 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157331 (= c!115373 (and (not lt!519316) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519317 () Unit!38050)

(declare-fun e!658276 () Unit!38050)

(assert (=> b!1157331 (= lt!519317 e!658276)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!519300 () Unit!38050)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!504 (array!74865 array!74867 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 64) (_ BitVec 32) Int) Unit!38050)

(assert (=> b!1157331 (= lt!519300 (lemmaListMapContainsThenArrayContainsFrom!504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115372 () Bool)

(assert (=> b!1157331 (= c!115372 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768466 () Bool)

(assert (=> b!1157331 (= res!768466 e!658270)))

(assert (=> b!1157331 (=> (not res!768466) (not e!658274))))

(assert (=> b!1157331 e!658274))

(declare-fun lt!519299 () Unit!38050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74865 (_ BitVec 32) (_ BitVec 32)) Unit!38050)

(assert (=> b!1157331 (= lt!519299 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157331 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25266)))

(declare-fun lt!519307 () Unit!38050)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74865 (_ BitVec 64) (_ BitVec 32) List!25269) Unit!38050)

(assert (=> b!1157331 (= lt!519307 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25266))))

(assert (=> b!1157331 false))

(declare-fun b!1157332 () Bool)

(assert (=> b!1157332 (= c!115374 (and (not lt!519316) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658283 () Unit!38050)

(assert (=> b!1157332 (= e!658276 e!658283)))

(declare-fun b!1157333 () Bool)

(declare-fun e!658273 () Bool)

(declare-fun lt!519313 () ListLongMap!16503)

(declare-fun lt!519304 () array!74867)

(declare-fun getCurrentListMapNoExtraKeys!4761 (array!74865 array!74867 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) Int) ListLongMap!16503)

(assert (=> b!1157333 (= e!658273 (= lt!519313 (getCurrentListMapNoExtraKeys!4761 lt!519298 lt!519304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157334 () Bool)

(declare-fun res!768468 () Bool)

(assert (=> b!1157334 (=> (not res!768468) (not e!658269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74865 (_ BitVec 32)) Bool)

(assert (=> b!1157334 (= res!768468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157335 () Bool)

(declare-fun e!658271 () Bool)

(declare-fun tp_is_empty!28987 () Bool)

(assert (=> b!1157335 (= e!658271 tp_is_empty!28987)))

(declare-fun b!1157336 () Bool)

(declare-fun lt!519305 () ListLongMap!16503)

(declare-fun contains!6791 (ListLongMap!16503 (_ BitVec 64)) Bool)

(declare-fun +!3691 (ListLongMap!16503 tuple2!18526) ListLongMap!16503)

(assert (=> b!1157336 (contains!6791 (+!3691 lt!519305 (tuple2!18527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519306 () Unit!38050)

(assert (=> b!1157336 (= lt!519306 (addStillContains!913 lt!519305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1157336 call!55091))

(declare-fun call!55092 () ListLongMap!16503)

(assert (=> b!1157336 (= lt!519305 call!55092)))

(declare-fun lt!519315 () Unit!38050)

(assert (=> b!1157336 (= lt!519315 call!55094)))

(assert (=> b!1157336 (= e!658276 lt!519306)))

(declare-fun b!1157337 () Bool)

(assert (=> b!1157337 (= e!658283 e!658282)))

(declare-fun c!115369 () Bool)

(assert (=> b!1157337 (= c!115369 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519316))))

(declare-fun b!1157338 () Bool)

(declare-fun res!768467 () Bool)

(assert (=> b!1157338 (=> (not res!768467) (not e!658269))))

(assert (=> b!1157338 (= res!768467 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36614 _keys!1208))))))

(declare-fun b!1157339 () Bool)

(declare-fun res!768457 () Bool)

(assert (=> b!1157339 (=> (not res!768457) (not e!658269))))

(assert (=> b!1157339 (= res!768457 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25266))))

(declare-fun b!1157340 () Bool)

(declare-fun lt!519302 () Unit!38050)

(assert (=> b!1157340 (= e!658283 lt!519302)))

(assert (=> b!1157340 (= lt!519302 call!55097)))

(assert (=> b!1157340 call!55093))

(declare-fun b!1157341 () Bool)

(declare-fun e!658280 () Bool)

(assert (=> b!1157341 (= e!658280 true)))

(assert (=> b!1157341 e!658273))

(declare-fun res!768459 () Bool)

(assert (=> b!1157341 (=> (not res!768459) (not e!658273))))

(assert (=> b!1157341 (= res!768459 (= lt!519313 lt!519309))))

(declare-fun lt!519303 () ListLongMap!16503)

(declare-fun -!1370 (ListLongMap!16503 (_ BitVec 64)) ListLongMap!16503)

(assert (=> b!1157341 (= lt!519313 (-!1370 lt!519303 k0!934))))

(declare-fun lt!519319 () V!43777)

(assert (=> b!1157341 (= (-!1370 (+!3691 lt!519309 (tuple2!18527 (select (arr!36077 _keys!1208) from!1455) lt!519319)) (select (arr!36077 _keys!1208) from!1455)) lt!519309)))

(declare-fun lt!519301 () Unit!38050)

(declare-fun addThenRemoveForNewKeyIsSame!209 (ListLongMap!16503 (_ BitVec 64) V!43777) Unit!38050)

(assert (=> b!1157341 (= lt!519301 (addThenRemoveForNewKeyIsSame!209 lt!519309 (select (arr!36077 _keys!1208) from!1455) lt!519319))))

(declare-fun lt!519310 () V!43777)

(declare-fun get!18406 (ValueCell!13784 V!43777) V!43777)

(assert (=> b!1157341 (= lt!519319 (get!18406 (select (arr!36078 _values!996) from!1455) lt!519310))))

(declare-fun lt!519314 () Unit!38050)

(assert (=> b!1157341 (= lt!519314 e!658277)))

(declare-fun c!115371 () Bool)

(assert (=> b!1157341 (= c!115371 (contains!6791 lt!519309 k0!934))))

(assert (=> b!1157341 (= lt!519309 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157342 () Bool)

(assert (=> b!1157342 (= e!658269 e!658272)))

(declare-fun res!768465 () Bool)

(assert (=> b!1157342 (=> (not res!768465) (not e!658272))))

(assert (=> b!1157342 (= res!768465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519298 mask!1564))))

(assert (=> b!1157342 (= lt!519298 (array!74866 (store (arr!36077 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36614 _keys!1208)))))

(declare-fun bm!55092 () Bool)

(declare-fun call!55098 () ListLongMap!16503)

(assert (=> bm!55092 (= call!55098 (getCurrentListMapNoExtraKeys!4761 lt!519298 lt!519304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157343 () Bool)

(declare-fun e!658281 () Bool)

(assert (=> b!1157343 (= e!658281 e!658280)))

(declare-fun res!768471 () Bool)

(assert (=> b!1157343 (=> res!768471 e!658280)))

(assert (=> b!1157343 (= res!768471 (not (= (select (arr!36077 _keys!1208) from!1455) k0!934)))))

(declare-fun e!658285 () Bool)

(assert (=> b!1157343 e!658285))

(declare-fun c!115370 () Bool)

(assert (=> b!1157343 (= c!115370 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519312 () Unit!38050)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!610 (array!74865 array!74867 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38050)

(assert (=> b!1157343 (= lt!519312 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55096 () ListLongMap!16503)

(declare-fun bm!55090 () Bool)

(assert (=> bm!55090 (= call!55091 (contains!6791 (ite c!115373 lt!519305 call!55096) k0!934))))

(declare-fun res!768470 () Bool)

(assert (=> start!99088 (=> (not res!768470) (not e!658269))))

(assert (=> start!99088 (= res!768470 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36614 _keys!1208))))))

(assert (=> start!99088 e!658269))

(assert (=> start!99088 tp_is_empty!28987))

(declare-fun array_inv!27670 (array!74865) Bool)

(assert (=> start!99088 (array_inv!27670 _keys!1208)))

(assert (=> start!99088 true))

(assert (=> start!99088 tp!86082))

(declare-fun array_inv!27671 (array!74867) Bool)

(assert (=> start!99088 (and (array_inv!27671 _values!996) e!658284)))

(declare-fun b!1157344 () Bool)

(declare-fun call!55095 () ListLongMap!16503)

(assert (=> b!1157344 (= e!658285 (= call!55098 call!55095))))

(declare-fun bm!55093 () Bool)

(assert (=> bm!55093 (= call!55095 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157345 () Bool)

(declare-fun e!658279 () Bool)

(assert (=> b!1157345 (= e!658272 (not e!658279))))

(declare-fun res!768461 () Bool)

(assert (=> b!1157345 (=> res!768461 e!658279)))

(assert (=> b!1157345 (= res!768461 (bvsgt from!1455 i!673))))

(assert (=> b!1157345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519311 () Unit!38050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74865 (_ BitVec 64) (_ BitVec 32)) Unit!38050)

(assert (=> b!1157345 (= lt!519311 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157346 () Bool)

(assert (=> b!1157346 (= e!658285 (= call!55098 (-!1370 call!55095 k0!934)))))

(declare-fun b!1157347 () Bool)

(declare-fun Unit!38054 () Unit!38050)

(assert (=> b!1157347 (= e!658277 Unit!38054)))

(declare-fun b!1157348 () Bool)

(assert (=> b!1157348 (= e!658279 e!658281)))

(declare-fun res!768458 () Bool)

(assert (=> b!1157348 (=> res!768458 e!658281)))

(assert (=> b!1157348 (= res!768458 (not (= from!1455 i!673)))))

(declare-fun lt!519308 () ListLongMap!16503)

(assert (=> b!1157348 (= lt!519308 (getCurrentListMapNoExtraKeys!4761 lt!519298 lt!519304 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157348 (= lt!519304 (array!74868 (store (arr!36078 _values!996) i!673 (ValueCellFull!13784 lt!519310)) (size!36615 _values!996)))))

(declare-fun dynLambda!2775 (Int (_ BitVec 64)) V!43777)

(assert (=> b!1157348 (= lt!519310 (dynLambda!2775 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157348 (= lt!519303 (getCurrentListMapNoExtraKeys!4761 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45305 () Bool)

(assert (=> mapIsEmpty!45305 mapRes!45305))

(declare-fun bm!55094 () Bool)

(assert (=> bm!55094 (= call!55096 call!55092)))

(declare-fun b!1157349 () Bool)

(declare-fun res!768469 () Bool)

(assert (=> b!1157349 (=> (not res!768469) (not e!658269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157349 (= res!768469 (validMask!0 mask!1564))))

(declare-fun b!1157350 () Bool)

(assert (=> b!1157350 call!55093))

(declare-fun lt!519318 () Unit!38050)

(assert (=> b!1157350 (= lt!519318 call!55097)))

(assert (=> b!1157350 (= e!658282 lt!519318)))

(declare-fun bm!55095 () Bool)

(assert (=> bm!55095 (= call!55092 (+!3691 lt!519309 (ite (or c!115373 c!115374) (tuple2!18527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1157351 () Bool)

(declare-fun res!768464 () Bool)

(assert (=> b!1157351 (=> (not res!768464) (not e!658269))))

(assert (=> b!1157351 (= res!768464 (and (= (size!36615 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36614 _keys!1208) (size!36615 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157352 () Bool)

(assert (=> b!1157352 (= e!658275 tp_is_empty!28987)))

(declare-fun mapNonEmpty!45305 () Bool)

(declare-fun tp!86081 () Bool)

(assert (=> mapNonEmpty!45305 (= mapRes!45305 (and tp!86081 e!658271))))

(declare-fun mapKey!45305 () (_ BitVec 32))

(declare-fun mapValue!45305 () ValueCell!13784)

(declare-fun mapRest!45305 () (Array (_ BitVec 32) ValueCell!13784))

(assert (=> mapNonEmpty!45305 (= (arr!36078 _values!996) (store mapRest!45305 mapKey!45305 mapValue!45305))))

(assert (= (and start!99088 res!768470) b!1157349))

(assert (= (and b!1157349 res!768469) b!1157351))

(assert (= (and b!1157351 res!768464) b!1157334))

(assert (= (and b!1157334 res!768468) b!1157339))

(assert (= (and b!1157339 res!768457) b!1157338))

(assert (= (and b!1157338 res!768467) b!1157326))

(assert (= (and b!1157326 res!768460) b!1157324))

(assert (= (and b!1157324 res!768463) b!1157342))

(assert (= (and b!1157342 res!768465) b!1157328))

(assert (= (and b!1157328 res!768462) b!1157345))

(assert (= (and b!1157345 (not res!768461)) b!1157348))

(assert (= (and b!1157348 (not res!768458)) b!1157343))

(assert (= (and b!1157343 c!115370) b!1157346))

(assert (= (and b!1157343 (not c!115370)) b!1157344))

(assert (= (or b!1157346 b!1157344) bm!55092))

(assert (= (or b!1157346 b!1157344) bm!55093))

(assert (= (and b!1157343 (not res!768471)) b!1157341))

(assert (= (and b!1157341 c!115371) b!1157331))

(assert (= (and b!1157341 (not c!115371)) b!1157347))

(assert (= (and b!1157331 c!115373) b!1157336))

(assert (= (and b!1157331 (not c!115373)) b!1157332))

(assert (= (and b!1157332 c!115374) b!1157340))

(assert (= (and b!1157332 (not c!115374)) b!1157337))

(assert (= (and b!1157337 c!115369) b!1157350))

(assert (= (and b!1157337 (not c!115369)) b!1157330))

(assert (= (or b!1157340 b!1157350) bm!55089))

(assert (= (or b!1157340 b!1157350) bm!55094))

(assert (= (or b!1157340 b!1157350) bm!55088))

(assert (= (or b!1157336 bm!55088) bm!55090))

(assert (= (or b!1157336 bm!55089) bm!55091))

(assert (= (or b!1157336 bm!55094) bm!55095))

(assert (= (and b!1157331 c!115372) b!1157323))

(assert (= (and b!1157331 (not c!115372)) b!1157325))

(assert (= (and b!1157331 res!768466) b!1157327))

(assert (= (and b!1157341 res!768459) b!1157333))

(assert (= (and b!1157329 condMapEmpty!45305) mapIsEmpty!45305))

(assert (= (and b!1157329 (not condMapEmpty!45305)) mapNonEmpty!45305))

(get-info :version)

(assert (= (and mapNonEmpty!45305 ((_ is ValueCellFull!13784) mapValue!45305)) b!1157335))

(assert (= (and b!1157329 ((_ is ValueCellFull!13784) mapDefault!45305)) b!1157352))

(assert (= start!99088 b!1157329))

(declare-fun b_lambda!19557 () Bool)

(assert (=> (not b_lambda!19557) (not b!1157348)))

(declare-fun t!36709 () Bool)

(declare-fun tb!9261 () Bool)

(assert (=> (and start!99088 (= defaultEntry!1004 defaultEntry!1004) t!36709) tb!9261))

(declare-fun result!19095 () Bool)

(assert (=> tb!9261 (= result!19095 tp_is_empty!28987)))

(assert (=> b!1157348 t!36709))

(declare-fun b_and!39767 () Bool)

(assert (= b_and!39765 (and (=> t!36709 result!19095) b_and!39767)))

(declare-fun m!1067117 () Bool)

(assert (=> b!1157341 m!1067117))

(declare-fun m!1067119 () Bool)

(assert (=> b!1157341 m!1067119))

(declare-fun m!1067121 () Bool)

(assert (=> b!1157341 m!1067121))

(assert (=> b!1157341 m!1067119))

(declare-fun m!1067123 () Bool)

(assert (=> b!1157341 m!1067123))

(declare-fun m!1067125 () Bool)

(assert (=> b!1157341 m!1067125))

(assert (=> b!1157341 m!1067121))

(declare-fun m!1067127 () Bool)

(assert (=> b!1157341 m!1067127))

(declare-fun m!1067129 () Bool)

(assert (=> b!1157341 m!1067129))

(assert (=> b!1157341 m!1067127))

(assert (=> b!1157341 m!1067127))

(declare-fun m!1067131 () Bool)

(assert (=> b!1157341 m!1067131))

(declare-fun m!1067133 () Bool)

(assert (=> b!1157341 m!1067133))

(declare-fun m!1067135 () Bool)

(assert (=> bm!55095 m!1067135))

(declare-fun m!1067137 () Bool)

(assert (=> b!1157342 m!1067137))

(declare-fun m!1067139 () Bool)

(assert (=> b!1157342 m!1067139))

(assert (=> b!1157343 m!1067127))

(declare-fun m!1067141 () Bool)

(assert (=> b!1157343 m!1067141))

(declare-fun m!1067143 () Bool)

(assert (=> b!1157324 m!1067143))

(declare-fun m!1067145 () Bool)

(assert (=> b!1157333 m!1067145))

(declare-fun m!1067147 () Bool)

(assert (=> b!1157348 m!1067147))

(declare-fun m!1067149 () Bool)

(assert (=> b!1157348 m!1067149))

(declare-fun m!1067151 () Bool)

(assert (=> b!1157348 m!1067151))

(declare-fun m!1067153 () Bool)

(assert (=> b!1157348 m!1067153))

(declare-fun m!1067155 () Bool)

(assert (=> b!1157349 m!1067155))

(declare-fun m!1067157 () Bool)

(assert (=> b!1157345 m!1067157))

(declare-fun m!1067159 () Bool)

(assert (=> b!1157345 m!1067159))

(declare-fun m!1067161 () Bool)

(assert (=> b!1157326 m!1067161))

(declare-fun m!1067163 () Bool)

(assert (=> start!99088 m!1067163))

(declare-fun m!1067165 () Bool)

(assert (=> start!99088 m!1067165))

(declare-fun m!1067167 () Bool)

(assert (=> b!1157334 m!1067167))

(declare-fun m!1067169 () Bool)

(assert (=> b!1157328 m!1067169))

(declare-fun m!1067171 () Bool)

(assert (=> b!1157336 m!1067171))

(assert (=> b!1157336 m!1067171))

(declare-fun m!1067173 () Bool)

(assert (=> b!1157336 m!1067173))

(declare-fun m!1067175 () Bool)

(assert (=> b!1157336 m!1067175))

(assert (=> bm!55092 m!1067145))

(declare-fun m!1067177 () Bool)

(assert (=> b!1157323 m!1067177))

(declare-fun m!1067179 () Bool)

(assert (=> bm!55091 m!1067179))

(assert (=> b!1157327 m!1067177))

(declare-fun m!1067181 () Bool)

(assert (=> b!1157346 m!1067181))

(declare-fun m!1067183 () Bool)

(assert (=> b!1157331 m!1067183))

(declare-fun m!1067185 () Bool)

(assert (=> b!1157331 m!1067185))

(declare-fun m!1067187 () Bool)

(assert (=> b!1157331 m!1067187))

(declare-fun m!1067189 () Bool)

(assert (=> b!1157331 m!1067189))

(declare-fun m!1067191 () Bool)

(assert (=> b!1157339 m!1067191))

(assert (=> bm!55093 m!1067117))

(declare-fun m!1067193 () Bool)

(assert (=> mapNonEmpty!45305 m!1067193))

(declare-fun m!1067195 () Bool)

(assert (=> bm!55090 m!1067195))

(check-sat (not bm!55093) b_and!39767 tp_is_empty!28987 (not b!1157345) (not b!1157333) (not b!1157331) (not b!1157336) (not mapNonEmpty!45305) (not bm!55092) (not b!1157326) (not b!1157349) (not bm!55090) (not b_lambda!19557) (not b!1157328) (not b!1157342) (not b!1157343) (not b!1157341) (not b_next!24457) (not b!1157346) (not b!1157339) (not start!99088) (not b!1157323) (not b!1157348) (not b!1157334) (not bm!55091) (not bm!55095) (not b!1157327))
(check-sat b_and!39767 (not b_next!24457))
