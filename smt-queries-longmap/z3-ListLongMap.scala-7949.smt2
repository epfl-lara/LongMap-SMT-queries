; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98528 () Bool)

(assert start!98528)

(declare-fun b_free!24139 () Bool)

(declare-fun b_next!24139 () Bool)

(assert (=> start!98528 (= b_free!24139 (not b_next!24139))))

(declare-fun tp!85127 () Bool)

(declare-fun b_and!39105 () Bool)

(assert (=> start!98528 (= tp!85127 b_and!39105)))

(declare-fun b!1141370 () Bool)

(declare-fun e!649353 () Bool)

(declare-fun e!649351 () Bool)

(declare-fun mapRes!44828 () Bool)

(assert (=> b!1141370 (= e!649353 (and e!649351 mapRes!44828))))

(declare-fun condMapEmpty!44828 () Bool)

(declare-datatypes ((V!43353 0))(
  ( (V!43354 (val!14391 Int)) )
))
(declare-datatypes ((ValueCell!13625 0))(
  ( (ValueCellFull!13625 (v!17027 V!43353)) (EmptyCell!13625) )
))
(declare-datatypes ((array!74120 0))(
  ( (array!74121 (arr!35711 (Array (_ BitVec 32) ValueCell!13625)) (size!36249 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74120)

(declare-fun mapDefault!44828 () ValueCell!13625)

(assert (=> b!1141370 (= condMapEmpty!44828 (= (arr!35711 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13625)) mapDefault!44828)))))

(declare-fun b!1141371 () Bool)

(declare-fun e!649341 () Bool)

(declare-fun e!649342 () Bool)

(assert (=> b!1141371 (= e!649341 (not e!649342))))

(declare-fun res!760828 () Bool)

(assert (=> b!1141371 (=> res!760828 e!649342)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141371 (= res!760828 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74122 0))(
  ( (array!74123 (arr!35712 (Array (_ BitVec 32) (_ BitVec 64))) (size!36250 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74122)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141371 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37296 0))(
  ( (Unit!37297) )
))
(declare-fun lt!508382 () Unit!37296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74122 (_ BitVec 64) (_ BitVec 32)) Unit!37296)

(assert (=> b!1141371 (= lt!508382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141372 () Bool)

(declare-fun res!760822 () Bool)

(assert (=> b!1141372 (=> (not res!760822) (not e!649341))))

(declare-fun lt!508390 () array!74122)

(declare-datatypes ((List!25033 0))(
  ( (Nil!25030) (Cons!25029 (h!26238 (_ BitVec 64)) (t!36155 List!25033)) )
))
(declare-fun arrayNoDuplicates!0 (array!74122 (_ BitVec 32) List!25033) Bool)

(assert (=> b!1141372 (= res!760822 (arrayNoDuplicates!0 lt!508390 #b00000000000000000000000000000000 Nil!25030))))

(declare-fun zeroValue!944 () V!43353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18294 0))(
  ( (tuple2!18295 (_1!9158 (_ BitVec 64)) (_2!9158 V!43353)) )
))
(declare-datatypes ((List!25034 0))(
  ( (Nil!25031) (Cons!25030 (h!26239 tuple2!18294) (t!36156 List!25034)) )
))
(declare-datatypes ((ListLongMap!16263 0))(
  ( (ListLongMap!16264 (toList!8147 List!25034)) )
))
(declare-fun call!51187 () ListLongMap!16263)

(declare-fun minValue!944 () V!43353)

(declare-fun bm!51184 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4640 (array!74122 array!74120 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 32) Int) ListLongMap!16263)

(assert (=> bm!51184 (= call!51187 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141373 () Bool)

(declare-fun c!112086 () Bool)

(declare-fun lt!508381 () Bool)

(assert (=> b!1141373 (= c!112086 (and (not lt!508381) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649352 () Unit!37296)

(declare-fun e!649340 () Unit!37296)

(assert (=> b!1141373 (= e!649352 e!649340)))

(declare-fun lt!508394 () array!74120)

(declare-fun bm!51185 () Bool)

(declare-fun call!51194 () ListLongMap!16263)

(assert (=> bm!51185 (= call!51194 (getCurrentListMapNoExtraKeys!4640 lt!508390 lt!508394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44828 () Bool)

(assert (=> mapIsEmpty!44828 mapRes!44828))

(declare-fun b!1141374 () Bool)

(declare-fun res!760819 () Bool)

(declare-fun e!649345 () Bool)

(assert (=> b!1141374 (=> (not res!760819) (not e!649345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141374 (= res!760819 (validMask!0 mask!1564))))

(declare-fun b!1141375 () Bool)

(declare-fun e!649338 () Bool)

(declare-fun -!1232 (ListLongMap!16263 (_ BitVec 64)) ListLongMap!16263)

(assert (=> b!1141375 (= e!649338 (= call!51194 (-!1232 call!51187 k0!934)))))

(declare-fun lt!508398 () ListLongMap!16263)

(declare-fun bm!51186 () Bool)

(declare-fun call!51192 () ListLongMap!16263)

(declare-fun c!112083 () Bool)

(declare-fun call!51191 () Bool)

(declare-fun contains!6618 (ListLongMap!16263 (_ BitVec 64)) Bool)

(assert (=> bm!51186 (= call!51191 (contains!6618 (ite c!112083 lt!508398 call!51192) k0!934))))

(declare-fun b!1141376 () Bool)

(declare-fun res!760827 () Bool)

(assert (=> b!1141376 (=> (not res!760827) (not e!649345))))

(assert (=> b!1141376 (= res!760827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25030))))

(declare-fun b!1141377 () Bool)

(declare-fun res!760817 () Bool)

(assert (=> b!1141377 (=> (not res!760817) (not e!649345))))

(assert (=> b!1141377 (= res!760817 (and (= (size!36249 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36250 _keys!1208) (size!36249 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141378 () Bool)

(declare-fun e!649343 () Bool)

(assert (=> b!1141378 (= e!649343 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51187 () Bool)

(declare-fun call!51189 () ListLongMap!16263)

(assert (=> bm!51187 (= call!51192 call!51189)))

(declare-fun b!1141379 () Bool)

(assert (=> b!1141379 (contains!6618 call!51189 k0!934)))

(declare-fun lt!508389 () Unit!37296)

(declare-fun addStillContains!788 (ListLongMap!16263 (_ BitVec 64) V!43353 (_ BitVec 64)) Unit!37296)

(assert (=> b!1141379 (= lt!508389 (addStillContains!788 lt!508398 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141379 call!51191))

(declare-fun lt!508383 () ListLongMap!16263)

(declare-fun +!3574 (ListLongMap!16263 tuple2!18294) ListLongMap!16263)

(assert (=> b!1141379 (= lt!508398 (+!3574 lt!508383 (tuple2!18295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508393 () Unit!37296)

(declare-fun call!51190 () Unit!37296)

(assert (=> b!1141379 (= lt!508393 call!51190)))

(assert (=> b!1141379 (= e!649352 lt!508389)))

(declare-fun bm!51188 () Bool)

(declare-fun call!51193 () Unit!37296)

(assert (=> bm!51188 (= call!51193 call!51190)))

(declare-fun bm!51189 () Bool)

(assert (=> bm!51189 (= call!51190 (addStillContains!788 lt!508383 (ite (or c!112083 c!112086) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112083 c!112086) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapNonEmpty!44828 () Bool)

(declare-fun tp!85128 () Bool)

(declare-fun e!649344 () Bool)

(assert (=> mapNonEmpty!44828 (= mapRes!44828 (and tp!85128 e!649344))))

(declare-fun mapValue!44828 () ValueCell!13625)

(declare-fun mapRest!44828 () (Array (_ BitVec 32) ValueCell!13625))

(declare-fun mapKey!44828 () (_ BitVec 32))

(assert (=> mapNonEmpty!44828 (= (arr!35711 _values!996) (store mapRest!44828 mapKey!44828 mapValue!44828))))

(declare-fun b!1141380 () Bool)

(declare-fun e!649339 () Unit!37296)

(declare-fun Unit!37298 () Unit!37296)

(assert (=> b!1141380 (= e!649339 Unit!37298)))

(declare-fun b!1141381 () Bool)

(declare-fun e!649346 () Unit!37296)

(declare-fun Unit!37299 () Unit!37296)

(assert (=> b!1141381 (= e!649346 Unit!37299)))

(declare-fun b!1141382 () Bool)

(declare-fun res!760816 () Bool)

(assert (=> b!1141382 (=> (not res!760816) (not e!649345))))

(assert (=> b!1141382 (= res!760816 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36250 _keys!1208))))))

(declare-fun b!1141383 () Bool)

(declare-fun e!649347 () Bool)

(assert (=> b!1141383 (= e!649342 e!649347)))

(declare-fun res!760829 () Bool)

(assert (=> b!1141383 (=> res!760829 e!649347)))

(assert (=> b!1141383 (= res!760829 (not (= from!1455 i!673)))))

(declare-fun lt!508388 () ListLongMap!16263)

(assert (=> b!1141383 (= lt!508388 (getCurrentListMapNoExtraKeys!4640 lt!508390 lt!508394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508391 () V!43353)

(assert (=> b!1141383 (= lt!508394 (array!74121 (store (arr!35711 _values!996) i!673 (ValueCellFull!13625 lt!508391)) (size!36249 _values!996)))))

(declare-fun dynLambda!2621 (Int (_ BitVec 64)) V!43353)

(assert (=> b!1141383 (= lt!508391 (dynLambda!2621 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508378 () ListLongMap!16263)

(assert (=> b!1141383 (= lt!508378 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141384 () Bool)

(assert (=> b!1141384 (= e!649338 (= call!51194 call!51187))))

(declare-fun res!760823 () Bool)

(assert (=> start!98528 (=> (not res!760823) (not e!649345))))

(assert (=> start!98528 (= res!760823 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36250 _keys!1208))))))

(assert (=> start!98528 e!649345))

(declare-fun tp_is_empty!28669 () Bool)

(assert (=> start!98528 tp_is_empty!28669))

(declare-fun array_inv!27446 (array!74122) Bool)

(assert (=> start!98528 (array_inv!27446 _keys!1208)))

(assert (=> start!98528 true))

(assert (=> start!98528 tp!85127))

(declare-fun array_inv!27447 (array!74120) Bool)

(assert (=> start!98528 (and (array_inv!27447 _values!996) e!649353)))

(declare-fun b!1141385 () Bool)

(assert (=> b!1141385 (= e!649343 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508381) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51190 () Bool)

(assert (=> bm!51190 (= call!51189 (+!3574 (ite c!112083 lt!508398 lt!508383) (ite c!112083 (tuple2!18295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112086 (tuple2!18295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141386 () Bool)

(declare-fun res!760818 () Bool)

(assert (=> b!1141386 (=> (not res!760818) (not e!649345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141386 (= res!760818 (validKeyInArray!0 k0!934))))

(declare-fun b!1141387 () Bool)

(assert (=> b!1141387 (= e!649345 e!649341)))

(declare-fun res!760825 () Bool)

(assert (=> b!1141387 (=> (not res!760825) (not e!649341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74122 (_ BitVec 32)) Bool)

(assert (=> b!1141387 (= res!760825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508390 mask!1564))))

(assert (=> b!1141387 (= lt!508390 (array!74123 (store (arr!35712 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36250 _keys!1208)))))

(declare-fun b!1141388 () Bool)

(declare-fun call!51188 () Bool)

(assert (=> b!1141388 call!51188))

(declare-fun lt!508380 () Unit!37296)

(assert (=> b!1141388 (= lt!508380 call!51193)))

(assert (=> b!1141388 (= e!649346 lt!508380)))

(declare-fun b!1141389 () Bool)

(declare-fun e!649350 () Bool)

(assert (=> b!1141389 (= e!649347 e!649350)))

(declare-fun res!760824 () Bool)

(assert (=> b!1141389 (=> res!760824 e!649350)))

(assert (=> b!1141389 (= res!760824 (not (= (select (arr!35712 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1141389 e!649338))

(declare-fun c!112087 () Bool)

(assert (=> b!1141389 (= c!112087 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508387 () Unit!37296)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 (array!74122 array!74120 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37296)

(assert (=> b!1141389 (= lt!508387 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141390 () Bool)

(declare-fun e!649348 () Bool)

(assert (=> b!1141390 (= e!649348 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141391 () Bool)

(assert (=> b!1141391 (= e!649340 e!649346)))

(declare-fun c!112084 () Bool)

(assert (=> b!1141391 (= c!112084 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508381))))

(declare-fun b!1141392 () Bool)

(declare-fun res!760826 () Bool)

(assert (=> b!1141392 (=> (not res!760826) (not e!649345))))

(assert (=> b!1141392 (= res!760826 (= (select (arr!35712 _keys!1208) i!673) k0!934))))

(declare-fun b!1141393 () Bool)

(declare-fun res!760820 () Bool)

(assert (=> b!1141393 (=> (not res!760820) (not e!649345))))

(assert (=> b!1141393 (= res!760820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141394 () Bool)

(declare-fun lt!508385 () Unit!37296)

(assert (=> b!1141394 (= e!649340 lt!508385)))

(assert (=> b!1141394 (= lt!508385 call!51193)))

(assert (=> b!1141394 call!51188))

(declare-fun b!1141395 () Bool)

(declare-fun Unit!37300 () Unit!37296)

(assert (=> b!1141395 (= e!649339 Unit!37300)))

(assert (=> b!1141395 (= lt!508381 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141395 (= c!112083 (and (not lt!508381) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508397 () Unit!37296)

(assert (=> b!1141395 (= lt!508397 e!649352)))

(declare-fun lt!508395 () Unit!37296)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!389 (array!74122 array!74120 (_ BitVec 32) (_ BitVec 32) V!43353 V!43353 (_ BitVec 64) (_ BitVec 32) Int) Unit!37296)

(assert (=> b!1141395 (= lt!508395 (lemmaListMapContainsThenArrayContainsFrom!389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112085 () Bool)

(assert (=> b!1141395 (= c!112085 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760821 () Bool)

(assert (=> b!1141395 (= res!760821 e!649343)))

(assert (=> b!1141395 (=> (not res!760821) (not e!649348))))

(assert (=> b!1141395 e!649348))

(declare-fun lt!508386 () Unit!37296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74122 (_ BitVec 32) (_ BitVec 32)) Unit!37296)

(assert (=> b!1141395 (= lt!508386 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141395 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25030)))

(declare-fun lt!508384 () Unit!37296)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74122 (_ BitVec 64) (_ BitVec 32) List!25033) Unit!37296)

(assert (=> b!1141395 (= lt!508384 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25030))))

(assert (=> b!1141395 false))

(declare-fun b!1141396 () Bool)

(assert (=> b!1141396 (= e!649351 tp_is_empty!28669)))

(declare-fun bm!51191 () Bool)

(assert (=> bm!51191 (= call!51188 call!51191)))

(declare-fun b!1141397 () Bool)

(assert (=> b!1141397 (= e!649350 true)))

(declare-fun lt!508379 () V!43353)

(assert (=> b!1141397 (= (-!1232 (+!3574 lt!508383 (tuple2!18295 (select (arr!35712 _keys!1208) from!1455) lt!508379)) (select (arr!35712 _keys!1208) from!1455)) lt!508383)))

(declare-fun lt!508392 () Unit!37296)

(declare-fun addThenRemoveForNewKeyIsSame!98 (ListLongMap!16263 (_ BitVec 64) V!43353) Unit!37296)

(assert (=> b!1141397 (= lt!508392 (addThenRemoveForNewKeyIsSame!98 lt!508383 (select (arr!35712 _keys!1208) from!1455) lt!508379))))

(declare-fun get!18158 (ValueCell!13625 V!43353) V!43353)

(assert (=> b!1141397 (= lt!508379 (get!18158 (select (arr!35711 _values!996) from!1455) lt!508391))))

(declare-fun lt!508396 () Unit!37296)

(assert (=> b!1141397 (= lt!508396 e!649339)))

(declare-fun c!112088 () Bool)

(assert (=> b!1141397 (= c!112088 (contains!6618 lt!508383 k0!934))))

(assert (=> b!1141397 (= lt!508383 (getCurrentListMapNoExtraKeys!4640 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141398 () Bool)

(assert (=> b!1141398 (= e!649344 tp_is_empty!28669)))

(assert (= (and start!98528 res!760823) b!1141374))

(assert (= (and b!1141374 res!760819) b!1141377))

(assert (= (and b!1141377 res!760817) b!1141393))

(assert (= (and b!1141393 res!760820) b!1141376))

(assert (= (and b!1141376 res!760827) b!1141382))

(assert (= (and b!1141382 res!760816) b!1141386))

(assert (= (and b!1141386 res!760818) b!1141392))

(assert (= (and b!1141392 res!760826) b!1141387))

(assert (= (and b!1141387 res!760825) b!1141372))

(assert (= (and b!1141372 res!760822) b!1141371))

(assert (= (and b!1141371 (not res!760828)) b!1141383))

(assert (= (and b!1141383 (not res!760829)) b!1141389))

(assert (= (and b!1141389 c!112087) b!1141375))

(assert (= (and b!1141389 (not c!112087)) b!1141384))

(assert (= (or b!1141375 b!1141384) bm!51185))

(assert (= (or b!1141375 b!1141384) bm!51184))

(assert (= (and b!1141389 (not res!760824)) b!1141397))

(assert (= (and b!1141397 c!112088) b!1141395))

(assert (= (and b!1141397 (not c!112088)) b!1141380))

(assert (= (and b!1141395 c!112083) b!1141379))

(assert (= (and b!1141395 (not c!112083)) b!1141373))

(assert (= (and b!1141373 c!112086) b!1141394))

(assert (= (and b!1141373 (not c!112086)) b!1141391))

(assert (= (and b!1141391 c!112084) b!1141388))

(assert (= (and b!1141391 (not c!112084)) b!1141381))

(assert (= (or b!1141394 b!1141388) bm!51188))

(assert (= (or b!1141394 b!1141388) bm!51187))

(assert (= (or b!1141394 b!1141388) bm!51191))

(assert (= (or b!1141379 bm!51191) bm!51186))

(assert (= (or b!1141379 bm!51188) bm!51189))

(assert (= (or b!1141379 bm!51187) bm!51190))

(assert (= (and b!1141395 c!112085) b!1141378))

(assert (= (and b!1141395 (not c!112085)) b!1141385))

(assert (= (and b!1141395 res!760821) b!1141390))

(assert (= (and b!1141370 condMapEmpty!44828) mapIsEmpty!44828))

(assert (= (and b!1141370 (not condMapEmpty!44828)) mapNonEmpty!44828))

(get-info :version)

(assert (= (and mapNonEmpty!44828 ((_ is ValueCellFull!13625) mapValue!44828)) b!1141398))

(assert (= (and b!1141370 ((_ is ValueCellFull!13625) mapDefault!44828)) b!1141396))

(assert (= start!98528 b!1141370))

(declare-fun b_lambda!19227 () Bool)

(assert (=> (not b_lambda!19227) (not b!1141383)))

(declare-fun t!36154 () Bool)

(declare-fun tb!8943 () Bool)

(assert (=> (and start!98528 (= defaultEntry!1004 defaultEntry!1004) t!36154) tb!8943))

(declare-fun result!18459 () Bool)

(assert (=> tb!8943 (= result!18459 tp_is_empty!28669)))

(assert (=> b!1141383 t!36154))

(declare-fun b_and!39107 () Bool)

(assert (= b_and!39105 (and (=> t!36154 result!18459) b_and!39107)))

(declare-fun m!1052275 () Bool)

(assert (=> bm!51190 m!1052275))

(declare-fun m!1052277 () Bool)

(assert (=> bm!51184 m!1052277))

(declare-fun m!1052279 () Bool)

(assert (=> b!1141379 m!1052279))

(declare-fun m!1052281 () Bool)

(assert (=> b!1141379 m!1052281))

(declare-fun m!1052283 () Bool)

(assert (=> b!1141379 m!1052283))

(declare-fun m!1052285 () Bool)

(assert (=> b!1141387 m!1052285))

(declare-fun m!1052287 () Bool)

(assert (=> b!1141387 m!1052287))

(declare-fun m!1052289 () Bool)

(assert (=> b!1141378 m!1052289))

(declare-fun m!1052291 () Bool)

(assert (=> b!1141374 m!1052291))

(declare-fun m!1052293 () Bool)

(assert (=> b!1141392 m!1052293))

(declare-fun m!1052295 () Bool)

(assert (=> bm!51186 m!1052295))

(declare-fun m!1052297 () Bool)

(assert (=> bm!51185 m!1052297))

(declare-fun m!1052299 () Bool)

(assert (=> b!1141393 m!1052299))

(declare-fun m!1052301 () Bool)

(assert (=> bm!51189 m!1052301))

(declare-fun m!1052303 () Bool)

(assert (=> b!1141395 m!1052303))

(declare-fun m!1052305 () Bool)

(assert (=> b!1141395 m!1052305))

(declare-fun m!1052307 () Bool)

(assert (=> b!1141395 m!1052307))

(declare-fun m!1052309 () Bool)

(assert (=> b!1141395 m!1052309))

(declare-fun m!1052311 () Bool)

(assert (=> b!1141372 m!1052311))

(declare-fun m!1052313 () Bool)

(assert (=> b!1141375 m!1052313))

(declare-fun m!1052315 () Bool)

(assert (=> b!1141376 m!1052315))

(declare-fun m!1052317 () Bool)

(assert (=> mapNonEmpty!44828 m!1052317))

(declare-fun m!1052319 () Bool)

(assert (=> b!1141397 m!1052319))

(declare-fun m!1052321 () Bool)

(assert (=> b!1141397 m!1052321))

(assert (=> b!1141397 m!1052277))

(assert (=> b!1141397 m!1052319))

(declare-fun m!1052323 () Bool)

(assert (=> b!1141397 m!1052323))

(declare-fun m!1052325 () Bool)

(assert (=> b!1141397 m!1052325))

(declare-fun m!1052327 () Bool)

(assert (=> b!1141397 m!1052327))

(declare-fun m!1052329 () Bool)

(assert (=> b!1141397 m!1052329))

(assert (=> b!1141397 m!1052325))

(assert (=> b!1141397 m!1052327))

(declare-fun m!1052331 () Bool)

(assert (=> b!1141397 m!1052331))

(assert (=> b!1141397 m!1052327))

(declare-fun m!1052333 () Bool)

(assert (=> b!1141386 m!1052333))

(declare-fun m!1052335 () Bool)

(assert (=> b!1141371 m!1052335))

(declare-fun m!1052337 () Bool)

(assert (=> b!1141371 m!1052337))

(assert (=> b!1141389 m!1052327))

(declare-fun m!1052339 () Bool)

(assert (=> b!1141389 m!1052339))

(declare-fun m!1052341 () Bool)

(assert (=> start!98528 m!1052341))

(declare-fun m!1052343 () Bool)

(assert (=> start!98528 m!1052343))

(declare-fun m!1052345 () Bool)

(assert (=> b!1141383 m!1052345))

(declare-fun m!1052347 () Bool)

(assert (=> b!1141383 m!1052347))

(declare-fun m!1052349 () Bool)

(assert (=> b!1141383 m!1052349))

(declare-fun m!1052351 () Bool)

(assert (=> b!1141383 m!1052351))

(assert (=> b!1141390 m!1052289))

(check-sat (not b_lambda!19227) (not bm!51186) (not b!1141376) (not start!98528) (not bm!51190) (not b!1141393) (not b!1141389) (not b!1141390) (not b!1141387) (not b!1141375) (not b!1141374) (not b!1141379) (not b!1141371) b_and!39107 tp_is_empty!28669 (not b!1141378) (not b!1141372) (not mapNonEmpty!44828) (not bm!51189) (not b!1141383) (not b!1141395) (not b!1141397) (not bm!51185) (not bm!51184) (not b_next!24139) (not b!1141386))
(check-sat b_and!39107 (not b_next!24139))
