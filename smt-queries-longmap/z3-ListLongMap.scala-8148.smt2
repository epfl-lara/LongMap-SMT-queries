; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99748 () Bool)

(assert start!99748)

(declare-fun b_free!25333 () Bool)

(declare-fun b_next!25333 () Bool)

(assert (=> start!99748 (= b_free!25333 (not b_next!25333))))

(declare-fun tp!88712 () Bool)

(declare-fun b_and!41511 () Bool)

(assert (=> start!99748 (= tp!88712 b_and!41511)))

(declare-fun b!1184485 () Bool)

(declare-fun e!673448 () Bool)

(assert (=> b!1184485 (= e!673448 true)))

(declare-datatypes ((V!44945 0))(
  ( (V!44946 (val!14988 Int)) )
))
(declare-datatypes ((tuple2!19334 0))(
  ( (tuple2!19335 (_1!9678 (_ BitVec 64)) (_2!9678 V!44945)) )
))
(declare-datatypes ((List!26044 0))(
  ( (Nil!26041) (Cons!26040 (h!27249 tuple2!19334) (t!38360 List!26044)) )
))
(declare-datatypes ((ListLongMap!17303 0))(
  ( (ListLongMap!17304 (toList!8667 List!26044)) )
))
(declare-fun lt!537065 () ListLongMap!17303)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!537056 () ListLongMap!17303)

(declare-fun -!1621 (ListLongMap!17303 (_ BitVec 64)) ListLongMap!17303)

(assert (=> b!1184485 (= (-!1621 lt!537065 k0!934) lt!537056)))

(declare-datatypes ((array!76460 0))(
  ( (array!76461 (arr!36880 (Array (_ BitVec 32) (_ BitVec 64))) (size!37418 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76460)

(declare-fun lt!537060 () ListLongMap!17303)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!537054 () V!44945)

(declare-datatypes ((Unit!39093 0))(
  ( (Unit!39094) )
))
(declare-fun lt!537069 () Unit!39093)

(declare-fun addRemoveCommutativeForDiffKeys!165 (ListLongMap!17303 (_ BitVec 64) V!44945 (_ BitVec 64)) Unit!39093)

(assert (=> b!1184485 (= lt!537069 (addRemoveCommutativeForDiffKeys!165 lt!537060 (select (arr!36880 _keys!1208) from!1455) lt!537054 k0!934))))

(declare-fun lt!537051 () ListLongMap!17303)

(declare-fun lt!537063 () ListLongMap!17303)

(declare-fun lt!537064 () ListLongMap!17303)

(assert (=> b!1184485 (and (= lt!537063 lt!537065) (= lt!537064 lt!537051))))

(declare-fun lt!537066 () tuple2!19334)

(declare-fun +!3951 (ListLongMap!17303 tuple2!19334) ListLongMap!17303)

(assert (=> b!1184485 (= lt!537065 (+!3951 lt!537060 lt!537066))))

(assert (=> b!1184485 (not (= (select (arr!36880 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537068 () Unit!39093)

(declare-fun e!673452 () Unit!39093)

(assert (=> b!1184485 (= lt!537068 e!673452)))

(declare-fun c!117097 () Bool)

(assert (=> b!1184485 (= c!117097 (= (select (arr!36880 _keys!1208) from!1455) k0!934))))

(declare-fun e!673450 () Bool)

(assert (=> b!1184485 e!673450))

(declare-fun res!787342 () Bool)

(assert (=> b!1184485 (=> (not res!787342) (not e!673450))))

(declare-fun lt!537052 () ListLongMap!17303)

(assert (=> b!1184485 (= res!787342 (= lt!537052 lt!537056))))

(assert (=> b!1184485 (= lt!537056 (+!3951 lt!537064 lt!537066))))

(assert (=> b!1184485 (= lt!537066 (tuple2!19335 (select (arr!36880 _keys!1208) from!1455) lt!537054))))

(declare-fun lt!537067 () V!44945)

(declare-datatypes ((ValueCell!14222 0))(
  ( (ValueCellFull!14222 (v!17625 V!44945)) (EmptyCell!14222) )
))
(declare-datatypes ((array!76462 0))(
  ( (array!76463 (arr!36881 (Array (_ BitVec 32) ValueCell!14222)) (size!37419 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76462)

(declare-fun get!18884 (ValueCell!14222 V!44945) V!44945)

(assert (=> b!1184485 (= lt!537054 (get!18884 (select (arr!36881 _values!996) from!1455) lt!537067))))

(declare-fun b!1184486 () Bool)

(declare-fun res!787338 () Bool)

(declare-fun e!673454 () Bool)

(assert (=> b!1184486 (=> (not res!787338) (not e!673454))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184486 (= res!787338 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37418 _keys!1208))))))

(declare-fun mapNonEmpty!46622 () Bool)

(declare-fun mapRes!46622 () Bool)

(declare-fun tp!88713 () Bool)

(declare-fun e!673451 () Bool)

(assert (=> mapNonEmpty!46622 (= mapRes!46622 (and tp!88713 e!673451))))

(declare-fun mapValue!46622 () ValueCell!14222)

(declare-fun mapKey!46622 () (_ BitVec 32))

(declare-fun mapRest!46622 () (Array (_ BitVec 32) ValueCell!14222))

(assert (=> mapNonEmpty!46622 (= (arr!36881 _values!996) (store mapRest!46622 mapKey!46622 mapValue!46622))))

(declare-fun b!1184487 () Bool)

(declare-fun e!673455 () Bool)

(assert (=> b!1184487 (= e!673454 e!673455)))

(declare-fun res!787336 () Bool)

(assert (=> b!1184487 (=> (not res!787336) (not e!673455))))

(declare-fun lt!537062 () array!76460)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76460 (_ BitVec 32)) Bool)

(assert (=> b!1184487 (= res!787336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537062 mask!1564))))

(assert (=> b!1184487 (= lt!537062 (array!76461 (store (arr!36880 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37418 _keys!1208)))))

(declare-fun b!1184488 () Bool)

(declare-fun res!787333 () Bool)

(assert (=> b!1184488 (=> (not res!787333) (not e!673454))))

(assert (=> b!1184488 (= res!787333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184489 () Bool)

(declare-fun res!787328 () Bool)

(assert (=> b!1184489 (=> (not res!787328) (not e!673455))))

(declare-datatypes ((List!26045 0))(
  ( (Nil!26042) (Cons!26041 (h!27250 (_ BitVec 64)) (t!38361 List!26045)) )
))
(declare-fun arrayNoDuplicates!0 (array!76460 (_ BitVec 32) List!26045) Bool)

(assert (=> b!1184489 (= res!787328 (arrayNoDuplicates!0 lt!537062 #b00000000000000000000000000000000 Nil!26042))))

(declare-fun b!1184490 () Bool)

(declare-fun res!787330 () Bool)

(assert (=> b!1184490 (=> (not res!787330) (not e!673454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184490 (= res!787330 (validKeyInArray!0 k0!934))))

(declare-fun b!1184491 () Bool)

(declare-fun tp_is_empty!29863 () Bool)

(assert (=> b!1184491 (= e!673451 tp_is_empty!29863)))

(declare-fun b!1184492 () Bool)

(declare-fun e!673446 () Bool)

(assert (=> b!1184492 (= e!673455 (not e!673446))))

(declare-fun res!787335 () Bool)

(assert (=> b!1184492 (=> res!787335 e!673446)))

(assert (=> b!1184492 (= res!787335 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184492 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537057 () Unit!39093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76460 (_ BitVec 64) (_ BitVec 32)) Unit!39093)

(assert (=> b!1184492 (= lt!537057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!787329 () Bool)

(assert (=> start!99748 (=> (not res!787329) (not e!673454))))

(assert (=> start!99748 (= res!787329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37418 _keys!1208))))))

(assert (=> start!99748 e!673454))

(assert (=> start!99748 tp_is_empty!29863))

(declare-fun array_inv!28258 (array!76460) Bool)

(assert (=> start!99748 (array_inv!28258 _keys!1208)))

(assert (=> start!99748 true))

(assert (=> start!99748 tp!88712))

(declare-fun e!673445 () Bool)

(declare-fun array_inv!28259 (array!76462) Bool)

(assert (=> start!99748 (and (array_inv!28259 _values!996) e!673445)))

(declare-fun b!1184493 () Bool)

(declare-fun res!787337 () Bool)

(assert (=> b!1184493 (=> (not res!787337) (not e!673454))))

(assert (=> b!1184493 (= res!787337 (= (select (arr!36880 _keys!1208) i!673) k0!934))))

(declare-fun b!1184494 () Bool)

(declare-fun e!673456 () Bool)

(assert (=> b!1184494 (= e!673456 e!673448)))

(declare-fun res!787341 () Bool)

(assert (=> b!1184494 (=> res!787341 e!673448)))

(assert (=> b!1184494 (= res!787341 (not (validKeyInArray!0 (select (arr!36880 _keys!1208) from!1455))))))

(assert (=> b!1184494 (= lt!537051 lt!537064)))

(assert (=> b!1184494 (= lt!537064 (-!1621 lt!537060 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537053 () array!76462)

(declare-fun minValue!944 () V!44945)

(declare-fun zeroValue!944 () V!44945)

(declare-fun getCurrentListMapNoExtraKeys!5120 (array!76460 array!76462 (_ BitVec 32) (_ BitVec 32) V!44945 V!44945 (_ BitVec 32) Int) ListLongMap!17303)

(assert (=> b!1184494 (= lt!537051 (getCurrentListMapNoExtraKeys!5120 lt!537062 lt!537053 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184494 (= lt!537060 (getCurrentListMapNoExtraKeys!5120 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537058 () Unit!39093)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!880 (array!76460 array!76462 (_ BitVec 32) (_ BitVec 32) V!44945 V!44945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39093)

(assert (=> b!1184494 (= lt!537058 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!880 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184495 () Bool)

(declare-fun Unit!39095 () Unit!39093)

(assert (=> b!1184495 (= e!673452 Unit!39095)))

(declare-fun lt!537061 () Unit!39093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39093)

(assert (=> b!1184495 (= lt!537061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184495 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537059 () Unit!39093)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76460 (_ BitVec 32) (_ BitVec 32)) Unit!39093)

(assert (=> b!1184495 (= lt!537059 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184495 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26042)))

(declare-fun lt!537055 () Unit!39093)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76460 (_ BitVec 64) (_ BitVec 32) List!26045) Unit!39093)

(assert (=> b!1184495 (= lt!537055 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26042))))

(assert (=> b!1184495 false))

(declare-fun b!1184496 () Bool)

(declare-fun Unit!39096 () Unit!39093)

(assert (=> b!1184496 (= e!673452 Unit!39096)))

(declare-fun b!1184497 () Bool)

(declare-fun e!673453 () Bool)

(assert (=> b!1184497 (= e!673453 tp_is_empty!29863)))

(declare-fun mapIsEmpty!46622 () Bool)

(assert (=> mapIsEmpty!46622 mapRes!46622))

(declare-fun b!1184498 () Bool)

(assert (=> b!1184498 (= e!673446 e!673456)))

(declare-fun res!787340 () Bool)

(assert (=> b!1184498 (=> res!787340 e!673456)))

(assert (=> b!1184498 (= res!787340 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184498 (= lt!537052 (getCurrentListMapNoExtraKeys!5120 lt!537062 lt!537053 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184498 (= lt!537053 (array!76463 (store (arr!36881 _values!996) i!673 (ValueCellFull!14222 lt!537067)) (size!37419 _values!996)))))

(declare-fun dynLambda!3022 (Int (_ BitVec 64)) V!44945)

(assert (=> b!1184498 (= lt!537067 (dynLambda!3022 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184498 (= lt!537063 (getCurrentListMapNoExtraKeys!5120 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184499 () Bool)

(declare-fun res!787331 () Bool)

(assert (=> b!1184499 (=> (not res!787331) (not e!673454))))

(assert (=> b!1184499 (= res!787331 (and (= (size!37419 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37418 _keys!1208) (size!37419 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184500 () Bool)

(declare-fun res!787332 () Bool)

(assert (=> b!1184500 (=> (not res!787332) (not e!673454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184500 (= res!787332 (validMask!0 mask!1564))))

(declare-fun b!1184501 () Bool)

(declare-fun res!787334 () Bool)

(assert (=> b!1184501 (=> (not res!787334) (not e!673454))))

(assert (=> b!1184501 (= res!787334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26042))))

(declare-fun b!1184502 () Bool)

(assert (=> b!1184502 (= e!673445 (and e!673453 mapRes!46622))))

(declare-fun condMapEmpty!46622 () Bool)

(declare-fun mapDefault!46622 () ValueCell!14222)

(assert (=> b!1184502 (= condMapEmpty!46622 (= (arr!36881 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14222)) mapDefault!46622)))))

(declare-fun e!673447 () Bool)

(declare-fun b!1184503 () Bool)

(assert (=> b!1184503 (= e!673447 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184504 () Bool)

(assert (=> b!1184504 (= e!673450 e!673447)))

(declare-fun res!787339 () Bool)

(assert (=> b!1184504 (=> res!787339 e!673447)))

(assert (=> b!1184504 (= res!787339 (not (= (select (arr!36880 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99748 res!787329) b!1184500))

(assert (= (and b!1184500 res!787332) b!1184499))

(assert (= (and b!1184499 res!787331) b!1184488))

(assert (= (and b!1184488 res!787333) b!1184501))

(assert (= (and b!1184501 res!787334) b!1184486))

(assert (= (and b!1184486 res!787338) b!1184490))

(assert (= (and b!1184490 res!787330) b!1184493))

(assert (= (and b!1184493 res!787337) b!1184487))

(assert (= (and b!1184487 res!787336) b!1184489))

(assert (= (and b!1184489 res!787328) b!1184492))

(assert (= (and b!1184492 (not res!787335)) b!1184498))

(assert (= (and b!1184498 (not res!787340)) b!1184494))

(assert (= (and b!1184494 (not res!787341)) b!1184485))

(assert (= (and b!1184485 res!787342) b!1184504))

(assert (= (and b!1184504 (not res!787339)) b!1184503))

(assert (= (and b!1184485 c!117097) b!1184495))

(assert (= (and b!1184485 (not c!117097)) b!1184496))

(assert (= (and b!1184502 condMapEmpty!46622) mapIsEmpty!46622))

(assert (= (and b!1184502 (not condMapEmpty!46622)) mapNonEmpty!46622))

(get-info :version)

(assert (= (and mapNonEmpty!46622 ((_ is ValueCellFull!14222) mapValue!46622)) b!1184491))

(assert (= (and b!1184502 ((_ is ValueCellFull!14222) mapDefault!46622)) b!1184497))

(assert (= start!99748 b!1184502))

(declare-fun b_lambda!20459 () Bool)

(assert (=> (not b_lambda!20459) (not b!1184498)))

(declare-fun t!38359 () Bool)

(declare-fun tb!10137 () Bool)

(assert (=> (and start!99748 (= defaultEntry!1004 defaultEntry!1004) t!38359) tb!10137))

(declare-fun result!20849 () Bool)

(assert (=> tb!10137 (= result!20849 tp_is_empty!29863)))

(assert (=> b!1184498 t!38359))

(declare-fun b_and!41513 () Bool)

(assert (= b_and!41511 (and (=> t!38359 result!20849) b_and!41513)))

(declare-fun m!1092305 () Bool)

(assert (=> b!1184489 m!1092305))

(declare-fun m!1092307 () Bool)

(assert (=> b!1184485 m!1092307))

(declare-fun m!1092309 () Bool)

(assert (=> b!1184485 m!1092309))

(declare-fun m!1092311 () Bool)

(assert (=> b!1184485 m!1092311))

(declare-fun m!1092313 () Bool)

(assert (=> b!1184485 m!1092313))

(declare-fun m!1092315 () Bool)

(assert (=> b!1184485 m!1092315))

(assert (=> b!1184485 m!1092313))

(assert (=> b!1184485 m!1092309))

(declare-fun m!1092317 () Bool)

(assert (=> b!1184485 m!1092317))

(declare-fun m!1092319 () Bool)

(assert (=> b!1184485 m!1092319))

(declare-fun m!1092321 () Bool)

(assert (=> b!1184495 m!1092321))

(declare-fun m!1092323 () Bool)

(assert (=> b!1184495 m!1092323))

(declare-fun m!1092325 () Bool)

(assert (=> b!1184495 m!1092325))

(declare-fun m!1092327 () Bool)

(assert (=> b!1184495 m!1092327))

(declare-fun m!1092329 () Bool)

(assert (=> b!1184495 m!1092329))

(declare-fun m!1092331 () Bool)

(assert (=> b!1184492 m!1092331))

(declare-fun m!1092333 () Bool)

(assert (=> b!1184492 m!1092333))

(declare-fun m!1092335 () Bool)

(assert (=> b!1184501 m!1092335))

(declare-fun m!1092337 () Bool)

(assert (=> b!1184488 m!1092337))

(declare-fun m!1092339 () Bool)

(assert (=> mapNonEmpty!46622 m!1092339))

(declare-fun m!1092341 () Bool)

(assert (=> b!1184487 m!1092341))

(declare-fun m!1092343 () Bool)

(assert (=> b!1184487 m!1092343))

(assert (=> b!1184504 m!1092313))

(declare-fun m!1092345 () Bool)

(assert (=> b!1184490 m!1092345))

(declare-fun m!1092347 () Bool)

(assert (=> b!1184498 m!1092347))

(declare-fun m!1092349 () Bool)

(assert (=> b!1184498 m!1092349))

(declare-fun m!1092351 () Bool)

(assert (=> b!1184498 m!1092351))

(declare-fun m!1092353 () Bool)

(assert (=> b!1184498 m!1092353))

(declare-fun m!1092355 () Bool)

(assert (=> b!1184493 m!1092355))

(declare-fun m!1092357 () Bool)

(assert (=> b!1184494 m!1092357))

(declare-fun m!1092359 () Bool)

(assert (=> b!1184494 m!1092359))

(declare-fun m!1092361 () Bool)

(assert (=> b!1184494 m!1092361))

(assert (=> b!1184494 m!1092313))

(assert (=> b!1184494 m!1092313))

(declare-fun m!1092363 () Bool)

(assert (=> b!1184494 m!1092363))

(declare-fun m!1092365 () Bool)

(assert (=> b!1184494 m!1092365))

(declare-fun m!1092367 () Bool)

(assert (=> b!1184503 m!1092367))

(declare-fun m!1092369 () Bool)

(assert (=> b!1184500 m!1092369))

(declare-fun m!1092371 () Bool)

(assert (=> start!99748 m!1092371))

(declare-fun m!1092373 () Bool)

(assert (=> start!99748 m!1092373))

(check-sat b_and!41513 (not b!1184503) (not b_lambda!20459) (not b!1184489) (not b!1184495) (not b!1184500) (not b!1184485) (not b!1184487) (not b!1184498) (not b!1184488) (not b!1184501) (not b!1184492) (not b!1184494) (not mapNonEmpty!46622) (not b!1184490) tp_is_empty!29863 (not b_next!25333) (not start!99748))
(check-sat b_and!41513 (not b_next!25333))
