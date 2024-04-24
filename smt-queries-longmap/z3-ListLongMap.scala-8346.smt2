; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101862 () Bool)

(assert start!101862)

(declare-fun b_free!26347 () Bool)

(declare-fun b_next!26347 () Bool)

(assert (=> start!101862 (= b_free!26347 (not b_next!26347))))

(declare-fun tp!92084 () Bool)

(declare-fun b_and!43939 () Bool)

(assert (=> start!101862 (= tp!92084 b_and!43939)))

(declare-fun b!1223266 () Bool)

(declare-fun e!694802 () Bool)

(assert (=> b!1223266 (= e!694802 true)))

(declare-fun lt!556359 () Bool)

(declare-datatypes ((List!26891 0))(
  ( (Nil!26888) (Cons!26887 (h!28105 (_ BitVec 64)) (t!40210 List!26891)) )
))
(declare-fun contains!7065 (List!26891 (_ BitVec 64)) Bool)

(assert (=> b!1223266 (= lt!556359 (contains!7065 Nil!26888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1223267 () Bool)

(declare-fun e!694811 () Bool)

(declare-fun e!694804 () Bool)

(assert (=> b!1223267 (= e!694811 e!694804)))

(declare-fun res!812343 () Bool)

(assert (=> b!1223267 (=> res!812343 e!694804)))

(declare-datatypes ((array!78923 0))(
  ( (array!78924 (arr!38083 (Array (_ BitVec 32) (_ BitVec 64))) (size!38620 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78923)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223267 (= res!812343 (not (= (select (arr!38083 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223268 () Bool)

(declare-fun res!812352 () Bool)

(declare-fun e!694801 () Bool)

(assert (=> b!1223268 (=> (not res!812352) (not e!694801))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223268 (= res!812352 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48472 () Bool)

(declare-fun mapRes!48472 () Bool)

(assert (=> mapIsEmpty!48472 mapRes!48472))

(declare-fun b!1223269 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223269 (= e!694804 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223271 () Bool)

(declare-fun e!694800 () Bool)

(declare-fun e!694805 () Bool)

(assert (=> b!1223271 (= e!694800 (not e!694805))))

(declare-fun res!812351 () Bool)

(assert (=> b!1223271 (=> res!812351 e!694805)))

(assert (=> b!1223271 (= res!812351 (bvsgt from!1455 i!673))))

(assert (=> b!1223271 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40442 0))(
  ( (Unit!40443) )
))
(declare-fun lt!556369 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78923 (_ BitVec 64) (_ BitVec 32)) Unit!40442)

(assert (=> b!1223271 (= lt!556369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223272 () Bool)

(declare-fun e!694806 () Bool)

(assert (=> b!1223272 (= e!694806 e!694802)))

(declare-fun res!812339 () Bool)

(assert (=> b!1223272 (=> res!812339 e!694802)))

(assert (=> b!1223272 (= res!812339 (or (bvsge (size!38620 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38620 _keys!1208)) (bvsge from!1455 (size!38620 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78923 (_ BitVec 32) List!26891) Bool)

(assert (=> b!1223272 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26888)))

(declare-fun lt!556357 () Unit!40442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78923 (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1223272 (= lt!556357 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223272 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556364 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78923 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1223272 (= lt!556364 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1223273 () Bool)

(declare-fun e!694812 () Bool)

(declare-fun tp_is_empty!31051 () Bool)

(assert (=> b!1223273 (= e!694812 tp_is_empty!31051)))

(declare-fun mapNonEmpty!48472 () Bool)

(declare-fun tp!92083 () Bool)

(assert (=> mapNonEmpty!48472 (= mapRes!48472 (and tp!92083 e!694812))))

(declare-fun mapKey!48472 () (_ BitVec 32))

(declare-datatypes ((V!46529 0))(
  ( (V!46530 (val!15582 Int)) )
))
(declare-datatypes ((ValueCell!14816 0))(
  ( (ValueCellFull!14816 (v!18239 V!46529)) (EmptyCell!14816) )
))
(declare-fun mapRest!48472 () (Array (_ BitVec 32) ValueCell!14816))

(declare-fun mapValue!48472 () ValueCell!14816)

(declare-datatypes ((array!78925 0))(
  ( (array!78926 (arr!38084 (Array (_ BitVec 32) ValueCell!14816)) (size!38621 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78925)

(assert (=> mapNonEmpty!48472 (= (arr!38084 _values!996) (store mapRest!48472 mapKey!48472 mapValue!48472))))

(declare-fun b!1223274 () Bool)

(declare-fun res!812344 () Bool)

(assert (=> b!1223274 (=> (not res!812344) (not e!694801))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1223274 (= res!812344 (and (= (size!38621 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38620 _keys!1208) (size!38621 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223275 () Bool)

(declare-fun res!812340 () Bool)

(assert (=> b!1223275 (=> res!812340 e!694802)))

(assert (=> b!1223275 (= res!812340 (contains!7065 Nil!26888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1223270 () Bool)

(declare-fun res!812342 () Bool)

(assert (=> b!1223270 (=> res!812342 e!694802)))

(declare-fun noDuplicate!1652 (List!26891) Bool)

(assert (=> b!1223270 (= res!812342 (not (noDuplicate!1652 Nil!26888)))))

(declare-fun res!812341 () Bool)

(assert (=> start!101862 (=> (not res!812341) (not e!694801))))

(assert (=> start!101862 (= res!812341 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38620 _keys!1208))))))

(assert (=> start!101862 e!694801))

(assert (=> start!101862 tp_is_empty!31051))

(declare-fun array_inv!29058 (array!78923) Bool)

(assert (=> start!101862 (array_inv!29058 _keys!1208)))

(assert (=> start!101862 true))

(assert (=> start!101862 tp!92084))

(declare-fun e!694808 () Bool)

(declare-fun array_inv!29059 (array!78925) Bool)

(assert (=> start!101862 (and (array_inv!29059 _values!996) e!694808)))

(declare-fun b!1223276 () Bool)

(declare-fun res!812354 () Bool)

(assert (=> b!1223276 (=> (not res!812354) (not e!694801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78923 (_ BitVec 32)) Bool)

(assert (=> b!1223276 (= res!812354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223277 () Bool)

(declare-fun res!812348 () Bool)

(assert (=> b!1223277 (=> (not res!812348) (not e!694801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223277 (= res!812348 (validKeyInArray!0 k0!934))))

(declare-fun b!1223278 () Bool)

(declare-fun e!694809 () Bool)

(declare-fun e!694810 () Bool)

(assert (=> b!1223278 (= e!694809 e!694810)))

(declare-fun res!812346 () Bool)

(assert (=> b!1223278 (=> res!812346 e!694810)))

(assert (=> b!1223278 (= res!812346 (not (validKeyInArray!0 (select (arr!38083 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20080 0))(
  ( (tuple2!20081 (_1!10051 (_ BitVec 64)) (_2!10051 V!46529)) )
))
(declare-datatypes ((List!26892 0))(
  ( (Nil!26889) (Cons!26888 (h!28106 tuple2!20080) (t!40211 List!26892)) )
))
(declare-datatypes ((ListLongMap!18057 0))(
  ( (ListLongMap!18058 (toList!9044 List!26892)) )
))
(declare-fun lt!556365 () ListLongMap!18057)

(declare-fun lt!556367 () ListLongMap!18057)

(assert (=> b!1223278 (= lt!556365 lt!556367)))

(declare-fun lt!556366 () ListLongMap!18057)

(declare-fun -!1925 (ListLongMap!18057 (_ BitVec 64)) ListLongMap!18057)

(assert (=> b!1223278 (= lt!556367 (-!1925 lt!556366 k0!934))))

(declare-fun zeroValue!944 () V!46529)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556363 () array!78923)

(declare-fun minValue!944 () V!46529)

(declare-fun lt!556358 () array!78925)

(declare-fun getCurrentListMapNoExtraKeys!5497 (array!78923 array!78925 (_ BitVec 32) (_ BitVec 32) V!46529 V!46529 (_ BitVec 32) Int) ListLongMap!18057)

(assert (=> b!1223278 (= lt!556365 (getCurrentListMapNoExtraKeys!5497 lt!556363 lt!556358 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223278 (= lt!556366 (getCurrentListMapNoExtraKeys!5497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556361 () Unit!40442)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 (array!78923 array!78925 (_ BitVec 32) (_ BitVec 32) V!46529 V!46529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40442)

(assert (=> b!1223278 (= lt!556361 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223279 () Bool)

(declare-fun res!812338 () Bool)

(assert (=> b!1223279 (=> (not res!812338) (not e!694801))))

(assert (=> b!1223279 (= res!812338 (= (select (arr!38083 _keys!1208) i!673) k0!934))))

(declare-fun b!1223280 () Bool)

(declare-fun e!694807 () Bool)

(assert (=> b!1223280 (= e!694808 (and e!694807 mapRes!48472))))

(declare-fun condMapEmpty!48472 () Bool)

(declare-fun mapDefault!48472 () ValueCell!14816)

(assert (=> b!1223280 (= condMapEmpty!48472 (= (arr!38084 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14816)) mapDefault!48472)))))

(declare-fun b!1223281 () Bool)

(assert (=> b!1223281 (= e!694801 e!694800)))

(declare-fun res!812345 () Bool)

(assert (=> b!1223281 (=> (not res!812345) (not e!694800))))

(assert (=> b!1223281 (= res!812345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556363 mask!1564))))

(assert (=> b!1223281 (= lt!556363 (array!78924 (store (arr!38083 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38620 _keys!1208)))))

(declare-fun b!1223282 () Bool)

(declare-fun res!812349 () Bool)

(assert (=> b!1223282 (=> (not res!812349) (not e!694801))))

(assert (=> b!1223282 (= res!812349 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26888))))

(declare-fun b!1223283 () Bool)

(assert (=> b!1223283 (= e!694805 e!694809)))

(declare-fun res!812350 () Bool)

(assert (=> b!1223283 (=> res!812350 e!694809)))

(assert (=> b!1223283 (= res!812350 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556362 () ListLongMap!18057)

(assert (=> b!1223283 (= lt!556362 (getCurrentListMapNoExtraKeys!5497 lt!556363 lt!556358 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556360 () V!46529)

(assert (=> b!1223283 (= lt!556358 (array!78926 (store (arr!38084 _values!996) i!673 (ValueCellFull!14816 lt!556360)) (size!38621 _values!996)))))

(declare-fun dynLambda!3398 (Int (_ BitVec 64)) V!46529)

(assert (=> b!1223283 (= lt!556360 (dynLambda!3398 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556368 () ListLongMap!18057)

(assert (=> b!1223283 (= lt!556368 (getCurrentListMapNoExtraKeys!5497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223284 () Bool)

(declare-fun res!812356 () Bool)

(assert (=> b!1223284 (=> (not res!812356) (not e!694801))))

(assert (=> b!1223284 (= res!812356 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38620 _keys!1208))))))

(declare-fun b!1223285 () Bool)

(assert (=> b!1223285 (= e!694807 tp_is_empty!31051)))

(declare-fun b!1223286 () Bool)

(declare-fun res!812347 () Bool)

(assert (=> b!1223286 (=> (not res!812347) (not e!694800))))

(assert (=> b!1223286 (= res!812347 (arrayNoDuplicates!0 lt!556363 #b00000000000000000000000000000000 Nil!26888))))

(declare-fun b!1223287 () Bool)

(assert (=> b!1223287 (= e!694810 e!694806)))

(declare-fun res!812355 () Bool)

(assert (=> b!1223287 (=> res!812355 e!694806)))

(assert (=> b!1223287 (= res!812355 (not (= (select (arr!38083 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1223287 e!694811))

(declare-fun res!812353 () Bool)

(assert (=> b!1223287 (=> (not res!812353) (not e!694811))))

(declare-fun +!4149 (ListLongMap!18057 tuple2!20080) ListLongMap!18057)

(declare-fun get!19483 (ValueCell!14816 V!46529) V!46529)

(assert (=> b!1223287 (= res!812353 (= lt!556362 (+!4149 lt!556367 (tuple2!20081 (select (arr!38083 _keys!1208) from!1455) (get!19483 (select (arr!38084 _values!996) from!1455) lt!556360)))))))

(assert (= (and start!101862 res!812341) b!1223268))

(assert (= (and b!1223268 res!812352) b!1223274))

(assert (= (and b!1223274 res!812344) b!1223276))

(assert (= (and b!1223276 res!812354) b!1223282))

(assert (= (and b!1223282 res!812349) b!1223284))

(assert (= (and b!1223284 res!812356) b!1223277))

(assert (= (and b!1223277 res!812348) b!1223279))

(assert (= (and b!1223279 res!812338) b!1223281))

(assert (= (and b!1223281 res!812345) b!1223286))

(assert (= (and b!1223286 res!812347) b!1223271))

(assert (= (and b!1223271 (not res!812351)) b!1223283))

(assert (= (and b!1223283 (not res!812350)) b!1223278))

(assert (= (and b!1223278 (not res!812346)) b!1223287))

(assert (= (and b!1223287 res!812353) b!1223267))

(assert (= (and b!1223267 (not res!812343)) b!1223269))

(assert (= (and b!1223287 (not res!812355)) b!1223272))

(assert (= (and b!1223272 (not res!812339)) b!1223270))

(assert (= (and b!1223270 (not res!812342)) b!1223275))

(assert (= (and b!1223275 (not res!812340)) b!1223266))

(assert (= (and b!1223280 condMapEmpty!48472) mapIsEmpty!48472))

(assert (= (and b!1223280 (not condMapEmpty!48472)) mapNonEmpty!48472))

(get-info :version)

(assert (= (and mapNonEmpty!48472 ((_ is ValueCellFull!14816) mapValue!48472)) b!1223273))

(assert (= (and b!1223280 ((_ is ValueCellFull!14816) mapDefault!48472)) b!1223285))

(assert (= start!101862 b!1223280))

(declare-fun b_lambda!22283 () Bool)

(assert (=> (not b_lambda!22283) (not b!1223283)))

(declare-fun t!40209 () Bool)

(declare-fun tb!11139 () Bool)

(assert (=> (and start!101862 (= defaultEntry!1004 defaultEntry!1004) t!40209) tb!11139))

(declare-fun result!22897 () Bool)

(assert (=> tb!11139 (= result!22897 tp_is_empty!31051)))

(assert (=> b!1223283 t!40209))

(declare-fun b_and!43941 () Bool)

(assert (= b_and!43939 (and (=> t!40209 result!22897) b_and!43941)))

(declare-fun m!1128479 () Bool)

(assert (=> b!1223282 m!1128479))

(declare-fun m!1128481 () Bool)

(assert (=> b!1223276 m!1128481))

(declare-fun m!1128483 () Bool)

(assert (=> b!1223281 m!1128483))

(declare-fun m!1128485 () Bool)

(assert (=> b!1223281 m!1128485))

(declare-fun m!1128487 () Bool)

(assert (=> b!1223286 m!1128487))

(declare-fun m!1128489 () Bool)

(assert (=> b!1223277 m!1128489))

(declare-fun m!1128491 () Bool)

(assert (=> b!1223269 m!1128491))

(declare-fun m!1128493 () Bool)

(assert (=> b!1223279 m!1128493))

(declare-fun m!1128495 () Bool)

(assert (=> b!1223287 m!1128495))

(declare-fun m!1128497 () Bool)

(assert (=> b!1223287 m!1128497))

(assert (=> b!1223287 m!1128497))

(declare-fun m!1128499 () Bool)

(assert (=> b!1223287 m!1128499))

(declare-fun m!1128501 () Bool)

(assert (=> b!1223287 m!1128501))

(declare-fun m!1128503 () Bool)

(assert (=> b!1223268 m!1128503))

(declare-fun m!1128505 () Bool)

(assert (=> start!101862 m!1128505))

(declare-fun m!1128507 () Bool)

(assert (=> start!101862 m!1128507))

(declare-fun m!1128509 () Bool)

(assert (=> b!1223272 m!1128509))

(declare-fun m!1128511 () Bool)

(assert (=> b!1223272 m!1128511))

(declare-fun m!1128513 () Bool)

(assert (=> b!1223272 m!1128513))

(declare-fun m!1128515 () Bool)

(assert (=> b!1223272 m!1128515))

(declare-fun m!1128517 () Bool)

(assert (=> b!1223270 m!1128517))

(declare-fun m!1128519 () Bool)

(assert (=> b!1223266 m!1128519))

(declare-fun m!1128521 () Bool)

(assert (=> b!1223275 m!1128521))

(assert (=> b!1223267 m!1128495))

(declare-fun m!1128523 () Bool)

(assert (=> b!1223278 m!1128523))

(declare-fun m!1128525 () Bool)

(assert (=> b!1223278 m!1128525))

(assert (=> b!1223278 m!1128495))

(declare-fun m!1128527 () Bool)

(assert (=> b!1223278 m!1128527))

(assert (=> b!1223278 m!1128495))

(declare-fun m!1128529 () Bool)

(assert (=> b!1223278 m!1128529))

(declare-fun m!1128531 () Bool)

(assert (=> b!1223278 m!1128531))

(declare-fun m!1128533 () Bool)

(assert (=> mapNonEmpty!48472 m!1128533))

(declare-fun m!1128535 () Bool)

(assert (=> b!1223271 m!1128535))

(declare-fun m!1128537 () Bool)

(assert (=> b!1223271 m!1128537))

(declare-fun m!1128539 () Bool)

(assert (=> b!1223283 m!1128539))

(declare-fun m!1128541 () Bool)

(assert (=> b!1223283 m!1128541))

(declare-fun m!1128543 () Bool)

(assert (=> b!1223283 m!1128543))

(declare-fun m!1128545 () Bool)

(assert (=> b!1223283 m!1128545))

(check-sat (not b!1223277) (not b_lambda!22283) b_and!43941 (not b!1223270) (not b!1223286) tp_is_empty!31051 (not b!1223283) (not start!101862) (not b!1223287) (not mapNonEmpty!48472) (not b!1223268) (not b!1223282) (not b!1223269) (not b!1223275) (not b!1223281) (not b!1223276) (not b!1223271) (not b_next!26347) (not b!1223272) (not b!1223266) (not b!1223278))
(check-sat b_and!43941 (not b_next!26347))
