; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99328 () Bool)

(assert start!99328)

(declare-fun b_free!24913 () Bool)

(declare-fun b_next!24913 () Bool)

(assert (=> start!99328 (= b_free!24913 (not b_next!24913))))

(declare-fun tp!87453 () Bool)

(declare-fun b_and!40671 () Bool)

(assert (=> start!99328 (= tp!87453 b_and!40671)))

(declare-fun mapNonEmpty!45992 () Bool)

(declare-fun mapRes!45992 () Bool)

(declare-fun tp!87452 () Bool)

(declare-fun e!665574 () Bool)

(assert (=> mapNonEmpty!45992 (= mapRes!45992 (and tp!87452 e!665574))))

(declare-datatypes ((V!44385 0))(
  ( (V!44386 (val!14778 Int)) )
))
(declare-datatypes ((ValueCell!14012 0))(
  ( (ValueCellFull!14012 (v!17415 V!44385)) (EmptyCell!14012) )
))
(declare-fun mapRest!45992 () (Array (_ BitVec 32) ValueCell!14012))

(declare-fun mapValue!45992 () ValueCell!14012)

(declare-fun mapKey!45992 () (_ BitVec 32))

(declare-datatypes ((array!75630 0))(
  ( (array!75631 (arr!36465 (Array (_ BitVec 32) ValueCell!14012)) (size!37003 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75630)

(assert (=> mapNonEmpty!45992 (= (arr!36465 _values!996) (store mapRest!45992 mapKey!45992 mapValue!45992))))

(declare-fun b!1170983 () Bool)

(declare-fun res!777260 () Bool)

(declare-fun e!665575 () Bool)

(assert (=> b!1170983 (=> res!777260 e!665575)))

(declare-datatypes ((List!25678 0))(
  ( (Nil!25675) (Cons!25674 (h!26883 (_ BitVec 64)) (t!37574 List!25678)) )
))
(declare-fun contains!6823 (List!25678 (_ BitVec 64)) Bool)

(assert (=> b!1170983 (= res!777260 (contains!6823 Nil!25675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170984 () Bool)

(declare-fun res!777261 () Bool)

(declare-fun e!665568 () Bool)

(assert (=> b!1170984 (=> (not res!777261) (not e!665568))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75632 0))(
  ( (array!75633 (arr!36466 (Array (_ BitVec 32) (_ BitVec 64))) (size!37004 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75632)

(assert (=> b!1170984 (= res!777261 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37004 _keys!1208))))))

(declare-fun b!1170985 () Bool)

(declare-fun e!665567 () Bool)

(declare-fun e!665563 () Bool)

(assert (=> b!1170985 (= e!665567 e!665563)))

(declare-fun res!777273 () Bool)

(assert (=> b!1170985 (=> res!777273 e!665563)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170985 (= res!777273 (not (= (select (arr!36466 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665571 () Bool)

(assert (=> b!1170985 e!665571))

(declare-fun res!777267 () Bool)

(assert (=> b!1170985 (=> (not res!777267) (not e!665571))))

(declare-datatypes ((tuple2!18966 0))(
  ( (tuple2!18967 (_1!9494 (_ BitVec 64)) (_2!9494 V!44385)) )
))
(declare-datatypes ((List!25679 0))(
  ( (Nil!25676) (Cons!25675 (h!26884 tuple2!18966) (t!37575 List!25679)) )
))
(declare-datatypes ((ListLongMap!16935 0))(
  ( (ListLongMap!16936 (toList!8483 List!25679)) )
))
(declare-fun lt!527328 () ListLongMap!16935)

(declare-fun lt!527319 () ListLongMap!16935)

(declare-fun lt!527331 () V!44385)

(declare-fun +!3802 (ListLongMap!16935 tuple2!18966) ListLongMap!16935)

(declare-fun get!18606 (ValueCell!14012 V!44385) V!44385)

(assert (=> b!1170985 (= res!777267 (= lt!527319 (+!3802 lt!527328 (tuple2!18967 (select (arr!36466 _keys!1208) from!1455) (get!18606 (select (arr!36465 _values!996) from!1455) lt!527331)))))))

(declare-fun b!1170986 () Bool)

(declare-fun e!665564 () Bool)

(declare-fun tp_is_empty!29443 () Bool)

(assert (=> b!1170986 (= e!665564 tp_is_empty!29443)))

(declare-fun b!1170987 () Bool)

(declare-fun e!665573 () Bool)

(assert (=> b!1170987 (= e!665573 e!665567)))

(declare-fun res!777266 () Bool)

(assert (=> b!1170987 (=> res!777266 e!665567)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170987 (= res!777266 (not (validKeyInArray!0 (select (arr!36466 _keys!1208) from!1455))))))

(declare-fun lt!527320 () ListLongMap!16935)

(assert (=> b!1170987 (= lt!527320 lt!527328)))

(declare-fun lt!527330 () ListLongMap!16935)

(declare-fun -!1479 (ListLongMap!16935 (_ BitVec 64)) ListLongMap!16935)

(assert (=> b!1170987 (= lt!527328 (-!1479 lt!527330 k0!934))))

(declare-fun zeroValue!944 () V!44385)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44385)

(declare-fun lt!527327 () array!75630)

(declare-fun lt!527325 () array!75632)

(declare-fun getCurrentListMapNoExtraKeys!4958 (array!75632 array!75630 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) Int) ListLongMap!16935)

(assert (=> b!1170987 (= lt!527320 (getCurrentListMapNoExtraKeys!4958 lt!527325 lt!527327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170987 (= lt!527330 (getCurrentListMapNoExtraKeys!4958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38445 0))(
  ( (Unit!38446) )
))
(declare-fun lt!527323 () Unit!38445)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 (array!75632 array!75630 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38445)

(assert (=> b!1170987 (= lt!527323 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170988 () Bool)

(declare-fun e!665570 () Bool)

(assert (=> b!1170988 (= e!665570 e!665573)))

(declare-fun res!777264 () Bool)

(assert (=> b!1170988 (=> res!777264 e!665573)))

(assert (=> b!1170988 (= res!777264 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170988 (= lt!527319 (getCurrentListMapNoExtraKeys!4958 lt!527325 lt!527327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170988 (= lt!527327 (array!75631 (store (arr!36465 _values!996) i!673 (ValueCellFull!14012 lt!527331)) (size!37003 _values!996)))))

(declare-fun dynLambda!2883 (Int (_ BitVec 64)) V!44385)

(assert (=> b!1170988 (= lt!527331 (dynLambda!2883 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527326 () ListLongMap!16935)

(assert (=> b!1170988 (= lt!527326 (getCurrentListMapNoExtraKeys!4958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170989 () Bool)

(declare-fun res!777259 () Bool)

(declare-fun e!665566 () Bool)

(assert (=> b!1170989 (=> (not res!777259) (not e!665566))))

(declare-fun arrayNoDuplicates!0 (array!75632 (_ BitVec 32) List!25678) Bool)

(assert (=> b!1170989 (= res!777259 (arrayNoDuplicates!0 lt!527325 #b00000000000000000000000000000000 Nil!25675))))

(declare-fun b!1170990 () Bool)

(declare-fun res!777263 () Bool)

(assert (=> b!1170990 (=> (not res!777263) (not e!665568))))

(assert (=> b!1170990 (= res!777263 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25675))))

(declare-fun b!1170991 () Bool)

(assert (=> b!1170991 (= e!665563 e!665575)))

(declare-fun res!777257 () Bool)

(assert (=> b!1170991 (=> res!777257 e!665575)))

(assert (=> b!1170991 (= res!777257 (or (bvsge (size!37004 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37004 _keys!1208)) (bvsge from!1455 (size!37004 _keys!1208))))))

(assert (=> b!1170991 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25675)))

(declare-fun lt!527324 () Unit!38445)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75632 (_ BitVec 32) (_ BitVec 32)) Unit!38445)

(assert (=> b!1170991 (= lt!527324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170991 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527321 () Unit!38445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38445)

(assert (=> b!1170991 (= lt!527321 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170992 () Bool)

(declare-fun e!665569 () Bool)

(assert (=> b!1170992 (= e!665569 (and e!665564 mapRes!45992))))

(declare-fun condMapEmpty!45992 () Bool)

(declare-fun mapDefault!45992 () ValueCell!14012)

(assert (=> b!1170992 (= condMapEmpty!45992 (= (arr!36465 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14012)) mapDefault!45992)))))

(declare-fun b!1170993 () Bool)

(declare-fun e!665565 () Bool)

(assert (=> b!1170993 (= e!665571 e!665565)))

(declare-fun res!777265 () Bool)

(assert (=> b!1170993 (=> res!777265 e!665565)))

(assert (=> b!1170993 (= res!777265 (not (= (select (arr!36466 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170994 () Bool)

(declare-fun res!777271 () Bool)

(assert (=> b!1170994 (=> (not res!777271) (not e!665568))))

(assert (=> b!1170994 (= res!777271 (= (select (arr!36466 _keys!1208) i!673) k0!934))))

(declare-fun res!777274 () Bool)

(assert (=> start!99328 (=> (not res!777274) (not e!665568))))

(assert (=> start!99328 (= res!777274 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37004 _keys!1208))))))

(assert (=> start!99328 e!665568))

(assert (=> start!99328 tp_is_empty!29443))

(declare-fun array_inv!27970 (array!75632) Bool)

(assert (=> start!99328 (array_inv!27970 _keys!1208)))

(assert (=> start!99328 true))

(assert (=> start!99328 tp!87453))

(declare-fun array_inv!27971 (array!75630) Bool)

(assert (=> start!99328 (and (array_inv!27971 _values!996) e!665569)))

(declare-fun b!1170995 () Bool)

(declare-fun res!777258 () Bool)

(assert (=> b!1170995 (=> res!777258 e!665575)))

(declare-fun noDuplicate!1620 (List!25678) Bool)

(assert (=> b!1170995 (= res!777258 (not (noDuplicate!1620 Nil!25675)))))

(declare-fun b!1170996 () Bool)

(assert (=> b!1170996 (= e!665568 e!665566)))

(declare-fun res!777269 () Bool)

(assert (=> b!1170996 (=> (not res!777269) (not e!665566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75632 (_ BitVec 32)) Bool)

(assert (=> b!1170996 (= res!777269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527325 mask!1564))))

(assert (=> b!1170996 (= lt!527325 (array!75633 (store (arr!36466 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37004 _keys!1208)))))

(declare-fun b!1170997 () Bool)

(assert (=> b!1170997 (= e!665574 tp_is_empty!29443)))

(declare-fun b!1170998 () Bool)

(declare-fun res!777268 () Bool)

(assert (=> b!1170998 (=> (not res!777268) (not e!665568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170998 (= res!777268 (validMask!0 mask!1564))))

(declare-fun b!1170999 () Bool)

(declare-fun res!777270 () Bool)

(assert (=> b!1170999 (=> (not res!777270) (not e!665568))))

(assert (=> b!1170999 (= res!777270 (validKeyInArray!0 k0!934))))

(declare-fun b!1171000 () Bool)

(assert (=> b!1171000 (= e!665565 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171001 () Bool)

(assert (=> b!1171001 (= e!665575 true)))

(declare-fun lt!527329 () Bool)

(assert (=> b!1171001 (= lt!527329 (contains!6823 Nil!25675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171002 () Bool)

(declare-fun res!777262 () Bool)

(assert (=> b!1171002 (=> (not res!777262) (not e!665568))))

(assert (=> b!1171002 (= res!777262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171003 () Bool)

(declare-fun res!777256 () Bool)

(assert (=> b!1171003 (=> (not res!777256) (not e!665568))))

(assert (=> b!1171003 (= res!777256 (and (= (size!37003 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37004 _keys!1208) (size!37003 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171004 () Bool)

(assert (=> b!1171004 (= e!665566 (not e!665570))))

(declare-fun res!777272 () Bool)

(assert (=> b!1171004 (=> res!777272 e!665570)))

(assert (=> b!1171004 (= res!777272 (bvsgt from!1455 i!673))))

(assert (=> b!1171004 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527322 () Unit!38445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75632 (_ BitVec 64) (_ BitVec 32)) Unit!38445)

(assert (=> b!1171004 (= lt!527322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45992 () Bool)

(assert (=> mapIsEmpty!45992 mapRes!45992))

(assert (= (and start!99328 res!777274) b!1170998))

(assert (= (and b!1170998 res!777268) b!1171003))

(assert (= (and b!1171003 res!777256) b!1171002))

(assert (= (and b!1171002 res!777262) b!1170990))

(assert (= (and b!1170990 res!777263) b!1170984))

(assert (= (and b!1170984 res!777261) b!1170999))

(assert (= (and b!1170999 res!777270) b!1170994))

(assert (= (and b!1170994 res!777271) b!1170996))

(assert (= (and b!1170996 res!777269) b!1170989))

(assert (= (and b!1170989 res!777259) b!1171004))

(assert (= (and b!1171004 (not res!777272)) b!1170988))

(assert (= (and b!1170988 (not res!777264)) b!1170987))

(assert (= (and b!1170987 (not res!777266)) b!1170985))

(assert (= (and b!1170985 res!777267) b!1170993))

(assert (= (and b!1170993 (not res!777265)) b!1171000))

(assert (= (and b!1170985 (not res!777273)) b!1170991))

(assert (= (and b!1170991 (not res!777257)) b!1170995))

(assert (= (and b!1170995 (not res!777258)) b!1170983))

(assert (= (and b!1170983 (not res!777260)) b!1171001))

(assert (= (and b!1170992 condMapEmpty!45992) mapIsEmpty!45992))

(assert (= (and b!1170992 (not condMapEmpty!45992)) mapNonEmpty!45992))

(get-info :version)

(assert (= (and mapNonEmpty!45992 ((_ is ValueCellFull!14012) mapValue!45992)) b!1170997))

(assert (= (and b!1170992 ((_ is ValueCellFull!14012) mapDefault!45992)) b!1170986))

(assert (= start!99328 b!1170992))

(declare-fun b_lambda!20039 () Bool)

(assert (=> (not b_lambda!20039) (not b!1170988)))

(declare-fun t!37573 () Bool)

(declare-fun tb!9717 () Bool)

(assert (=> (and start!99328 (= defaultEntry!1004 defaultEntry!1004) t!37573) tb!9717))

(declare-fun result!20009 () Bool)

(assert (=> tb!9717 (= result!20009 tp_is_empty!29443)))

(assert (=> b!1170988 t!37573))

(declare-fun b_and!40673 () Bool)

(assert (= b_and!40671 (and (=> t!37573 result!20009) b_and!40673)))

(declare-fun m!1078313 () Bool)

(assert (=> b!1171002 m!1078313))

(declare-fun m!1078315 () Bool)

(assert (=> b!1170990 m!1078315))

(declare-fun m!1078317 () Bool)

(assert (=> b!1170991 m!1078317))

(declare-fun m!1078319 () Bool)

(assert (=> b!1170991 m!1078319))

(declare-fun m!1078321 () Bool)

(assert (=> b!1170991 m!1078321))

(declare-fun m!1078323 () Bool)

(assert (=> b!1170991 m!1078323))

(declare-fun m!1078325 () Bool)

(assert (=> b!1170993 m!1078325))

(declare-fun m!1078327 () Bool)

(assert (=> b!1170988 m!1078327))

(declare-fun m!1078329 () Bool)

(assert (=> b!1170988 m!1078329))

(declare-fun m!1078331 () Bool)

(assert (=> b!1170988 m!1078331))

(declare-fun m!1078333 () Bool)

(assert (=> b!1170988 m!1078333))

(declare-fun m!1078335 () Bool)

(assert (=> b!1170987 m!1078335))

(declare-fun m!1078337 () Bool)

(assert (=> b!1170987 m!1078337))

(assert (=> b!1170987 m!1078325))

(declare-fun m!1078339 () Bool)

(assert (=> b!1170987 m!1078339))

(assert (=> b!1170987 m!1078325))

(declare-fun m!1078341 () Bool)

(assert (=> b!1170987 m!1078341))

(declare-fun m!1078343 () Bool)

(assert (=> b!1170987 m!1078343))

(declare-fun m!1078345 () Bool)

(assert (=> b!1170989 m!1078345))

(declare-fun m!1078347 () Bool)

(assert (=> b!1171004 m!1078347))

(declare-fun m!1078349 () Bool)

(assert (=> b!1171004 m!1078349))

(declare-fun m!1078351 () Bool)

(assert (=> mapNonEmpty!45992 m!1078351))

(declare-fun m!1078353 () Bool)

(assert (=> start!99328 m!1078353))

(declare-fun m!1078355 () Bool)

(assert (=> start!99328 m!1078355))

(declare-fun m!1078357 () Bool)

(assert (=> b!1170998 m!1078357))

(declare-fun m!1078359 () Bool)

(assert (=> b!1170996 m!1078359))

(declare-fun m!1078361 () Bool)

(assert (=> b!1170996 m!1078361))

(declare-fun m!1078363 () Bool)

(assert (=> b!1170983 m!1078363))

(declare-fun m!1078365 () Bool)

(assert (=> b!1170994 m!1078365))

(declare-fun m!1078367 () Bool)

(assert (=> b!1171001 m!1078367))

(declare-fun m!1078369 () Bool)

(assert (=> b!1171000 m!1078369))

(assert (=> b!1170985 m!1078325))

(declare-fun m!1078371 () Bool)

(assert (=> b!1170985 m!1078371))

(assert (=> b!1170985 m!1078371))

(declare-fun m!1078373 () Bool)

(assert (=> b!1170985 m!1078373))

(declare-fun m!1078375 () Bool)

(assert (=> b!1170985 m!1078375))

(declare-fun m!1078377 () Bool)

(assert (=> b!1170995 m!1078377))

(declare-fun m!1078379 () Bool)

(assert (=> b!1170999 m!1078379))

(check-sat (not b!1171004) (not b!1170999) (not b!1170996) tp_is_empty!29443 (not b!1170985) (not b!1170998) (not b!1171000) (not b!1170983) (not b!1170995) (not mapNonEmpty!45992) (not b!1171002) (not b!1170989) (not b!1170991) (not start!99328) (not b!1170988) (not b!1170987) (not b_next!24913) (not b_lambda!20039) b_and!40673 (not b!1170990) (not b!1171001))
(check-sat b_and!40673 (not b_next!24913))
