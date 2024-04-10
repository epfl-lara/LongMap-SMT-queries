; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99588 () Bool)

(assert start!99588)

(declare-fun b_free!25167 () Bool)

(declare-fun b_next!25167 () Bool)

(assert (=> start!99588 (= b_free!25167 (not b_next!25167))))

(declare-fun tp!88215 () Bool)

(declare-fun b_and!41201 () Bool)

(assert (=> start!99588 (= tp!88215 b_and!41201)))

(declare-fun b!1179270 () Bool)

(declare-fun res!783478 () Bool)

(declare-fun e!670442 () Bool)

(assert (=> b!1179270 (=> (not res!783478) (not e!670442))))

(declare-datatypes ((array!76197 0))(
  ( (array!76198 (arr!36748 (Array (_ BitVec 32) (_ BitVec 64))) (size!37284 (_ BitVec 32))) )
))
(declare-fun lt!532932 () array!76197)

(declare-datatypes ((List!25815 0))(
  ( (Nil!25812) (Cons!25811 (h!27020 (_ BitVec 64)) (t!37974 List!25815)) )
))
(declare-fun arrayNoDuplicates!0 (array!76197 (_ BitVec 32) List!25815) Bool)

(assert (=> b!1179270 (= res!783478 (arrayNoDuplicates!0 lt!532932 #b00000000000000000000000000000000 Nil!25812))))

(declare-fun mapNonEmpty!46373 () Bool)

(declare-fun mapRes!46373 () Bool)

(declare-fun tp!88214 () Bool)

(declare-fun e!670433 () Bool)

(assert (=> mapNonEmpty!46373 (= mapRes!46373 (and tp!88214 e!670433))))

(declare-fun mapKey!46373 () (_ BitVec 32))

(declare-datatypes ((V!44723 0))(
  ( (V!44724 (val!14905 Int)) )
))
(declare-datatypes ((ValueCell!14139 0))(
  ( (ValueCellFull!14139 (v!17543 V!44723)) (EmptyCell!14139) )
))
(declare-fun mapValue!46373 () ValueCell!14139)

(declare-datatypes ((array!76199 0))(
  ( (array!76200 (arr!36749 (Array (_ BitVec 32) ValueCell!14139)) (size!37285 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76199)

(declare-fun mapRest!46373 () (Array (_ BitVec 32) ValueCell!14139))

(assert (=> mapNonEmpty!46373 (= (arr!36749 _values!996) (store mapRest!46373 mapKey!46373 mapValue!46373))))

(declare-datatypes ((tuple2!19078 0))(
  ( (tuple2!19079 (_1!9550 (_ BitVec 64)) (_2!9550 V!44723)) )
))
(declare-datatypes ((List!25816 0))(
  ( (Nil!25813) (Cons!25812 (h!27021 tuple2!19078) (t!37975 List!25816)) )
))
(declare-datatypes ((ListLongMap!17047 0))(
  ( (ListLongMap!17048 (toList!8539 List!25816)) )
))
(declare-fun lt!532928 () ListLongMap!17047)

(declare-fun b!1179271 () Bool)

(declare-fun lt!532935 () ListLongMap!17047)

(declare-fun lt!532930 () tuple2!19078)

(declare-fun e!670440 () Bool)

(declare-fun +!3852 (ListLongMap!17047 tuple2!19078) ListLongMap!17047)

(assert (=> b!1179271 (= e!670440 (= lt!532935 (+!3852 lt!532928 lt!532930)))))

(declare-fun b!1179272 () Bool)

(declare-fun res!783475 () Bool)

(declare-fun e!670439 () Bool)

(assert (=> b!1179272 (=> (not res!783475) (not e!670439))))

(declare-fun _keys!1208 () array!76197)

(assert (=> b!1179272 (= res!783475 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25812))))

(declare-fun b!1179273 () Bool)

(declare-fun res!783469 () Bool)

(assert (=> b!1179273 (=> (not res!783469) (not e!670439))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76197 (_ BitVec 32)) Bool)

(assert (=> b!1179273 (= res!783469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179274 () Bool)

(declare-fun res!783466 () Bool)

(assert (=> b!1179274 (=> (not res!783466) (not e!670439))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1179274 (= res!783466 (and (= (size!37285 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37284 _keys!1208) (size!37285 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179275 () Bool)

(declare-datatypes ((Unit!38966 0))(
  ( (Unit!38967) )
))
(declare-fun e!670435 () Unit!38966)

(declare-fun Unit!38968 () Unit!38966)

(assert (=> b!1179275 (= e!670435 Unit!38968)))

(declare-fun b!1179276 () Bool)

(declare-fun res!783479 () Bool)

(assert (=> b!1179276 (=> (not res!783479) (not e!670439))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1179276 (= res!783479 (= (select (arr!36748 _keys!1208) i!673) k0!934))))

(declare-fun b!1179278 () Bool)

(declare-fun res!783477 () Bool)

(assert (=> b!1179278 (=> (not res!783477) (not e!670439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179278 (= res!783477 (validMask!0 mask!1564))))

(declare-fun b!1179279 () Bool)

(declare-fun e!670436 () Bool)

(declare-fun e!670438 () Bool)

(assert (=> b!1179279 (= e!670436 e!670438)))

(declare-fun res!783481 () Bool)

(assert (=> b!1179279 (=> res!783481 e!670438)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179279 (= res!783481 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44723)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44723)

(declare-fun lt!532938 () array!76199)

(declare-fun lt!532937 () ListLongMap!17047)

(declare-fun getCurrentListMapNoExtraKeys!4994 (array!76197 array!76199 (_ BitVec 32) (_ BitVec 32) V!44723 V!44723 (_ BitVec 32) Int) ListLongMap!17047)

(assert (=> b!1179279 (= lt!532937 (getCurrentListMapNoExtraKeys!4994 lt!532932 lt!532938 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532927 () V!44723)

(assert (=> b!1179279 (= lt!532938 (array!76200 (store (arr!36749 _values!996) i!673 (ValueCellFull!14139 lt!532927)) (size!37285 _values!996)))))

(declare-fun dynLambda!2954 (Int (_ BitVec 64)) V!44723)

(assert (=> b!1179279 (= lt!532927 (dynLambda!2954 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179279 (= lt!532935 (getCurrentListMapNoExtraKeys!4994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179280 () Bool)

(declare-fun e!670444 () Bool)

(declare-fun e!670441 () Bool)

(assert (=> b!1179280 (= e!670444 e!670441)))

(declare-fun res!783480 () Bool)

(assert (=> b!1179280 (=> res!783480 e!670441)))

(assert (=> b!1179280 (= res!783480 (not (= (select (arr!36748 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179281 () Bool)

(declare-fun res!783471 () Bool)

(assert (=> b!1179281 (=> (not res!783471) (not e!670439))))

(assert (=> b!1179281 (= res!783471 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37284 _keys!1208))))))

(declare-fun b!1179282 () Bool)

(declare-fun Unit!38969 () Unit!38966)

(assert (=> b!1179282 (= e!670435 Unit!38969)))

(declare-fun lt!532924 () Unit!38966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38966)

(assert (=> b!1179282 (= lt!532924 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179282 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532931 () Unit!38966)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76197 (_ BitVec 32) (_ BitVec 32)) Unit!38966)

(assert (=> b!1179282 (= lt!532931 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179282 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25812)))

(declare-fun lt!532929 () Unit!38966)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76197 (_ BitVec 64) (_ BitVec 32) List!25815) Unit!38966)

(assert (=> b!1179282 (= lt!532929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25812))))

(assert (=> b!1179282 false))

(declare-fun b!1179283 () Bool)

(declare-fun e!670443 () Bool)

(declare-fun e!670432 () Bool)

(assert (=> b!1179283 (= e!670443 (and e!670432 mapRes!46373))))

(declare-fun condMapEmpty!46373 () Bool)

(declare-fun mapDefault!46373 () ValueCell!14139)

(assert (=> b!1179283 (= condMapEmpty!46373 (= (arr!36749 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14139)) mapDefault!46373)))))

(declare-fun b!1179284 () Bool)

(assert (=> b!1179284 (= e!670439 e!670442)))

(declare-fun res!783473 () Bool)

(assert (=> b!1179284 (=> (not res!783473) (not e!670442))))

(assert (=> b!1179284 (= res!783473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532932 mask!1564))))

(assert (=> b!1179284 (= lt!532932 (array!76198 (store (arr!36748 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37284 _keys!1208)))))

(declare-fun b!1179285 () Bool)

(declare-fun res!783467 () Bool)

(assert (=> b!1179285 (=> (not res!783467) (not e!670439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179285 (= res!783467 (validKeyInArray!0 k0!934))))

(declare-fun b!1179286 () Bool)

(declare-fun e!670434 () Bool)

(assert (=> b!1179286 (= e!670434 true)))

(assert (=> b!1179286 e!670440))

(declare-fun res!783476 () Bool)

(assert (=> b!1179286 (=> (not res!783476) (not e!670440))))

(assert (=> b!1179286 (= res!783476 (not (= (select (arr!36748 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532933 () Unit!38966)

(assert (=> b!1179286 (= lt!532933 e!670435)))

(declare-fun c!116874 () Bool)

(assert (=> b!1179286 (= c!116874 (= (select (arr!36748 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179286 e!670444))

(declare-fun res!783468 () Bool)

(assert (=> b!1179286 (=> (not res!783468) (not e!670444))))

(declare-fun lt!532936 () ListLongMap!17047)

(assert (=> b!1179286 (= res!783468 (= lt!532937 (+!3852 lt!532936 lt!532930)))))

(declare-fun get!18786 (ValueCell!14139 V!44723) V!44723)

(assert (=> b!1179286 (= lt!532930 (tuple2!19079 (select (arr!36748 _keys!1208) from!1455) (get!18786 (select (arr!36749 _values!996) from!1455) lt!532927)))))

(declare-fun b!1179287 () Bool)

(declare-fun tp_is_empty!29697 () Bool)

(assert (=> b!1179287 (= e!670432 tp_is_empty!29697)))

(declare-fun b!1179288 () Bool)

(assert (=> b!1179288 (= e!670441 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179289 () Bool)

(assert (=> b!1179289 (= e!670438 e!670434)))

(declare-fun res!783470 () Bool)

(assert (=> b!1179289 (=> res!783470 e!670434)))

(assert (=> b!1179289 (= res!783470 (not (validKeyInArray!0 (select (arr!36748 _keys!1208) from!1455))))))

(declare-fun lt!532926 () ListLongMap!17047)

(assert (=> b!1179289 (= lt!532926 lt!532936)))

(declare-fun -!1583 (ListLongMap!17047 (_ BitVec 64)) ListLongMap!17047)

(assert (=> b!1179289 (= lt!532936 (-!1583 lt!532928 k0!934))))

(assert (=> b!1179289 (= lt!532926 (getCurrentListMapNoExtraKeys!4994 lt!532932 lt!532938 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179289 (= lt!532928 (getCurrentListMapNoExtraKeys!4994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532934 () Unit!38966)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 (array!76197 array!76199 (_ BitVec 32) (_ BitVec 32) V!44723 V!44723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38966)

(assert (=> b!1179289 (= lt!532934 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179277 () Bool)

(assert (=> b!1179277 (= e!670433 tp_is_empty!29697)))

(declare-fun res!783472 () Bool)

(assert (=> start!99588 (=> (not res!783472) (not e!670439))))

(assert (=> start!99588 (= res!783472 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37284 _keys!1208))))))

(assert (=> start!99588 e!670439))

(assert (=> start!99588 tp_is_empty!29697))

(declare-fun array_inv!28058 (array!76197) Bool)

(assert (=> start!99588 (array_inv!28058 _keys!1208)))

(assert (=> start!99588 true))

(assert (=> start!99588 tp!88215))

(declare-fun array_inv!28059 (array!76199) Bool)

(assert (=> start!99588 (and (array_inv!28059 _values!996) e!670443)))

(declare-fun b!1179290 () Bool)

(assert (=> b!1179290 (= e!670442 (not e!670436))))

(declare-fun res!783474 () Bool)

(assert (=> b!1179290 (=> res!783474 e!670436)))

(assert (=> b!1179290 (= res!783474 (bvsgt from!1455 i!673))))

(assert (=> b!1179290 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532925 () Unit!38966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76197 (_ BitVec 64) (_ BitVec 32)) Unit!38966)

(assert (=> b!1179290 (= lt!532925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46373 () Bool)

(assert (=> mapIsEmpty!46373 mapRes!46373))

(assert (= (and start!99588 res!783472) b!1179278))

(assert (= (and b!1179278 res!783477) b!1179274))

(assert (= (and b!1179274 res!783466) b!1179273))

(assert (= (and b!1179273 res!783469) b!1179272))

(assert (= (and b!1179272 res!783475) b!1179281))

(assert (= (and b!1179281 res!783471) b!1179285))

(assert (= (and b!1179285 res!783467) b!1179276))

(assert (= (and b!1179276 res!783479) b!1179284))

(assert (= (and b!1179284 res!783473) b!1179270))

(assert (= (and b!1179270 res!783478) b!1179290))

(assert (= (and b!1179290 (not res!783474)) b!1179279))

(assert (= (and b!1179279 (not res!783481)) b!1179289))

(assert (= (and b!1179289 (not res!783470)) b!1179286))

(assert (= (and b!1179286 res!783468) b!1179280))

(assert (= (and b!1179280 (not res!783480)) b!1179288))

(assert (= (and b!1179286 c!116874) b!1179282))

(assert (= (and b!1179286 (not c!116874)) b!1179275))

(assert (= (and b!1179286 res!783476) b!1179271))

(assert (= (and b!1179283 condMapEmpty!46373) mapIsEmpty!46373))

(assert (= (and b!1179283 (not condMapEmpty!46373)) mapNonEmpty!46373))

(get-info :version)

(assert (= (and mapNonEmpty!46373 ((_ is ValueCellFull!14139) mapValue!46373)) b!1179277))

(assert (= (and b!1179283 ((_ is ValueCellFull!14139) mapDefault!46373)) b!1179287))

(assert (= start!99588 b!1179283))

(declare-fun b_lambda!20311 () Bool)

(assert (=> (not b_lambda!20311) (not b!1179279)))

(declare-fun t!37973 () Bool)

(declare-fun tb!9979 () Bool)

(assert (=> (and start!99588 (= defaultEntry!1004 defaultEntry!1004) t!37973) tb!9979))

(declare-fun result!20525 () Bool)

(assert (=> tb!9979 (= result!20525 tp_is_empty!29697)))

(assert (=> b!1179279 t!37973))

(declare-fun b_and!41203 () Bool)

(assert (= b_and!41201 (and (=> t!37973 result!20525) b_and!41203)))

(declare-fun m!1087245 () Bool)

(assert (=> b!1179276 m!1087245))

(declare-fun m!1087247 () Bool)

(assert (=> b!1179290 m!1087247))

(declare-fun m!1087249 () Bool)

(assert (=> b!1179290 m!1087249))

(declare-fun m!1087251 () Bool)

(assert (=> b!1179284 m!1087251))

(declare-fun m!1087253 () Bool)

(assert (=> b!1179284 m!1087253))

(declare-fun m!1087255 () Bool)

(assert (=> b!1179270 m!1087255))

(declare-fun m!1087257 () Bool)

(assert (=> b!1179273 m!1087257))

(declare-fun m!1087259 () Bool)

(assert (=> b!1179288 m!1087259))

(declare-fun m!1087261 () Bool)

(assert (=> b!1179285 m!1087261))

(declare-fun m!1087263 () Bool)

(assert (=> b!1179289 m!1087263))

(declare-fun m!1087265 () Bool)

(assert (=> b!1179289 m!1087265))

(declare-fun m!1087267 () Bool)

(assert (=> b!1179289 m!1087267))

(declare-fun m!1087269 () Bool)

(assert (=> b!1179289 m!1087269))

(declare-fun m!1087271 () Bool)

(assert (=> b!1179289 m!1087271))

(declare-fun m!1087273 () Bool)

(assert (=> b!1179289 m!1087273))

(assert (=> b!1179289 m!1087271))

(declare-fun m!1087275 () Bool)

(assert (=> b!1179279 m!1087275))

(declare-fun m!1087277 () Bool)

(assert (=> b!1179279 m!1087277))

(declare-fun m!1087279 () Bool)

(assert (=> b!1179279 m!1087279))

(declare-fun m!1087281 () Bool)

(assert (=> b!1179279 m!1087281))

(assert (=> b!1179286 m!1087271))

(declare-fun m!1087283 () Bool)

(assert (=> b!1179286 m!1087283))

(declare-fun m!1087285 () Bool)

(assert (=> b!1179286 m!1087285))

(assert (=> b!1179286 m!1087285))

(declare-fun m!1087287 () Bool)

(assert (=> b!1179286 m!1087287))

(declare-fun m!1087289 () Bool)

(assert (=> start!99588 m!1087289))

(declare-fun m!1087291 () Bool)

(assert (=> start!99588 m!1087291))

(declare-fun m!1087293 () Bool)

(assert (=> b!1179271 m!1087293))

(declare-fun m!1087295 () Bool)

(assert (=> b!1179282 m!1087295))

(declare-fun m!1087297 () Bool)

(assert (=> b!1179282 m!1087297))

(declare-fun m!1087299 () Bool)

(assert (=> b!1179282 m!1087299))

(declare-fun m!1087301 () Bool)

(assert (=> b!1179282 m!1087301))

(declare-fun m!1087303 () Bool)

(assert (=> b!1179282 m!1087303))

(declare-fun m!1087305 () Bool)

(assert (=> mapNonEmpty!46373 m!1087305))

(declare-fun m!1087307 () Bool)

(assert (=> b!1179278 m!1087307))

(declare-fun m!1087309 () Bool)

(assert (=> b!1179272 m!1087309))

(assert (=> b!1179280 m!1087271))

(check-sat (not b!1179273) (not b!1179279) (not b_lambda!20311) (not b!1179282) (not b!1179272) (not b!1179288) (not b!1179286) (not b!1179285) (not b!1179290) tp_is_empty!29697 (not start!99588) (not b_next!25167) (not b!1179271) (not b!1179289) (not mapNonEmpty!46373) (not b!1179270) (not b!1179284) (not b!1179278) b_and!41203)
(check-sat b_and!41203 (not b_next!25167))
