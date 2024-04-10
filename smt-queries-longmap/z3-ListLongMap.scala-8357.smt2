; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101726 () Bool)

(assert start!101726)

(declare-fun b_free!26415 () Bool)

(declare-fun b_next!26415 () Bool)

(assert (=> start!101726 (= b_free!26415 (not b_next!26415))))

(declare-fun tp!92290 () Bool)

(declare-fun b_and!44091 () Bool)

(assert (=> start!101726 (= tp!92290 b_and!44091)))

(declare-fun b!1224301 () Bool)

(declare-fun e!695345 () Bool)

(declare-fun e!695347 () Bool)

(assert (=> b!1224301 (= e!695345 (not e!695347))))

(declare-fun res!813532 () Bool)

(assert (=> b!1224301 (=> res!813532 e!695347)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224301 (= res!813532 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79021 0))(
  ( (array!79022 (arr!38137 (Array (_ BitVec 32) (_ BitVec 64))) (size!38673 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79021)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224301 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40565 0))(
  ( (Unit!40566) )
))
(declare-fun lt!557429 () Unit!40565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79021 (_ BitVec 64) (_ BitVec 32)) Unit!40565)

(assert (=> b!1224301 (= lt!557429 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224302 () Bool)

(declare-fun res!813536 () Bool)

(declare-fun e!695348 () Bool)

(assert (=> b!1224302 (=> (not res!813536) (not e!695348))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79021 (_ BitVec 32)) Bool)

(assert (=> b!1224302 (= res!813536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224303 () Bool)

(declare-fun e!695346 () Bool)

(declare-fun tp_is_empty!31119 () Bool)

(assert (=> b!1224303 (= e!695346 tp_is_empty!31119)))

(declare-fun b!1224304 () Bool)

(declare-fun e!695350 () Bool)

(declare-datatypes ((V!46619 0))(
  ( (V!46620 (val!15616 Int)) )
))
(declare-datatypes ((ValueCell!14850 0))(
  ( (ValueCellFull!14850 (v!18278 V!46619)) (EmptyCell!14850) )
))
(declare-datatypes ((array!79023 0))(
  ( (array!79024 (arr!38138 (Array (_ BitVec 32) ValueCell!14850)) (size!38674 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79023)

(assert (=> b!1224304 (= e!695350 (bvslt from!1455 (size!38674 _values!996)))))

(declare-fun e!695349 () Bool)

(assert (=> b!1224304 e!695349))

(declare-fun res!813526 () Bool)

(assert (=> b!1224304 (=> (not res!813526) (not e!695349))))

(assert (=> b!1224304 (= res!813526 (not (= (select (arr!38137 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557437 () Unit!40565)

(declare-fun e!695356 () Unit!40565)

(assert (=> b!1224304 (= lt!557437 e!695356)))

(declare-fun c!120443 () Bool)

(assert (=> b!1224304 (= c!120443 (= (select (arr!38137 _keys!1208) from!1455) k0!934))))

(declare-fun e!695352 () Bool)

(assert (=> b!1224304 e!695352))

(declare-fun res!813527 () Bool)

(assert (=> b!1224304 (=> (not res!813527) (not e!695352))))

(declare-datatypes ((tuple2!20124 0))(
  ( (tuple2!20125 (_1!10073 (_ BitVec 64)) (_2!10073 V!46619)) )
))
(declare-datatypes ((List!26924 0))(
  ( (Nil!26921) (Cons!26920 (h!28129 tuple2!20124) (t!40319 List!26924)) )
))
(declare-datatypes ((ListLongMap!18093 0))(
  ( (ListLongMap!18094 (toList!9062 List!26924)) )
))
(declare-fun lt!557435 () ListLongMap!18093)

(declare-fun lt!557439 () ListLongMap!18093)

(declare-fun lt!557438 () tuple2!20124)

(declare-fun +!4119 (ListLongMap!18093 tuple2!20124) ListLongMap!18093)

(assert (=> b!1224304 (= res!813527 (= lt!557439 (+!4119 lt!557435 lt!557438)))))

(declare-fun lt!557434 () V!46619)

(declare-fun get!19478 (ValueCell!14850 V!46619) V!46619)

(assert (=> b!1224304 (= lt!557438 (tuple2!20125 (select (arr!38137 _keys!1208) from!1455) (get!19478 (select (arr!38138 _values!996) from!1455) lt!557434)))))

(declare-fun mapNonEmpty!48577 () Bool)

(declare-fun mapRes!48577 () Bool)

(declare-fun tp!92291 () Bool)

(declare-fun e!695344 () Bool)

(assert (=> mapNonEmpty!48577 (= mapRes!48577 (and tp!92291 e!695344))))

(declare-fun mapValue!48577 () ValueCell!14850)

(declare-fun mapRest!48577 () (Array (_ BitVec 32) ValueCell!14850))

(declare-fun mapKey!48577 () (_ BitVec 32))

(assert (=> mapNonEmpty!48577 (= (arr!38138 _values!996) (store mapRest!48577 mapKey!48577 mapValue!48577))))

(declare-fun b!1224305 () Bool)

(declare-fun e!695354 () Bool)

(assert (=> b!1224305 (= e!695354 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224306 () Bool)

(assert (=> b!1224306 (= e!695352 e!695354)))

(declare-fun res!813528 () Bool)

(assert (=> b!1224306 (=> res!813528 e!695354)))

(assert (=> b!1224306 (= res!813528 (not (= (select (arr!38137 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224307 () Bool)

(declare-fun e!695351 () Bool)

(assert (=> b!1224307 (= e!695351 e!695350)))

(declare-fun res!813534 () Bool)

(assert (=> b!1224307 (=> res!813534 e!695350)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224307 (= res!813534 (not (validKeyInArray!0 (select (arr!38137 _keys!1208) from!1455))))))

(declare-fun lt!557441 () ListLongMap!18093)

(assert (=> b!1224307 (= lt!557441 lt!557435)))

(declare-fun lt!557428 () ListLongMap!18093)

(declare-fun -!1964 (ListLongMap!18093 (_ BitVec 64)) ListLongMap!18093)

(assert (=> b!1224307 (= lt!557435 (-!1964 lt!557428 k0!934))))

(declare-fun zeroValue!944 () V!46619)

(declare-fun lt!557430 () array!79021)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557427 () array!79023)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46619)

(declare-fun getCurrentListMapNoExtraKeys!5484 (array!79021 array!79023 (_ BitVec 32) (_ BitVec 32) V!46619 V!46619 (_ BitVec 32) Int) ListLongMap!18093)

(assert (=> b!1224307 (= lt!557441 (getCurrentListMapNoExtraKeys!5484 lt!557430 lt!557427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224307 (= lt!557428 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557440 () Unit!40565)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1171 (array!79021 array!79023 (_ BitVec 32) (_ BitVec 32) V!46619 V!46619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40565)

(assert (=> b!1224307 (= lt!557440 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224308 () Bool)

(assert (=> b!1224308 (= e!695344 tp_is_empty!31119)))

(declare-fun b!1224309 () Bool)

(assert (=> b!1224309 (= e!695348 e!695345)))

(declare-fun res!813525 () Bool)

(assert (=> b!1224309 (=> (not res!813525) (not e!695345))))

(assert (=> b!1224309 (= res!813525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557430 mask!1564))))

(assert (=> b!1224309 (= lt!557430 (array!79022 (store (arr!38137 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38673 _keys!1208)))))

(declare-fun mapIsEmpty!48577 () Bool)

(assert (=> mapIsEmpty!48577 mapRes!48577))

(declare-fun b!1224311 () Bool)

(declare-fun e!695353 () Bool)

(assert (=> b!1224311 (= e!695353 (and e!695346 mapRes!48577))))

(declare-fun condMapEmpty!48577 () Bool)

(declare-fun mapDefault!48577 () ValueCell!14850)

(assert (=> b!1224311 (= condMapEmpty!48577 (= (arr!38138 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14850)) mapDefault!48577)))))

(declare-fun b!1224312 () Bool)

(declare-fun res!813522 () Bool)

(assert (=> b!1224312 (=> (not res!813522) (not e!695348))))

(assert (=> b!1224312 (= res!813522 (and (= (size!38674 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38673 _keys!1208) (size!38674 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224313 () Bool)

(declare-fun res!813535 () Bool)

(assert (=> b!1224313 (=> (not res!813535) (not e!695345))))

(declare-datatypes ((List!26925 0))(
  ( (Nil!26922) (Cons!26921 (h!28130 (_ BitVec 64)) (t!40320 List!26925)) )
))
(declare-fun arrayNoDuplicates!0 (array!79021 (_ BitVec 32) List!26925) Bool)

(assert (=> b!1224313 (= res!813535 (arrayNoDuplicates!0 lt!557430 #b00000000000000000000000000000000 Nil!26922))))

(declare-fun b!1224314 () Bool)

(declare-fun res!813524 () Bool)

(assert (=> b!1224314 (=> (not res!813524) (not e!695349))))

(declare-fun lt!557432 () ListLongMap!18093)

(assert (=> b!1224314 (= res!813524 (= lt!557432 (+!4119 lt!557428 lt!557438)))))

(declare-fun b!1224315 () Bool)

(declare-fun res!813533 () Bool)

(assert (=> b!1224315 (=> (not res!813533) (not e!695348))))

(assert (=> b!1224315 (= res!813533 (validKeyInArray!0 k0!934))))

(declare-fun b!1224316 () Bool)

(assert (=> b!1224316 (= e!695349 (= lt!557435 lt!557441))))

(declare-fun b!1224317 () Bool)

(declare-fun Unit!40567 () Unit!40565)

(assert (=> b!1224317 (= e!695356 Unit!40567)))

(declare-fun lt!557431 () Unit!40565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79021 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40565)

(assert (=> b!1224317 (= lt!557431 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557436 () Unit!40565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79021 (_ BitVec 32) (_ BitVec 32)) Unit!40565)

(assert (=> b!1224317 (= lt!557436 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224317 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26922)))

(declare-fun lt!557433 () Unit!40565)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79021 (_ BitVec 64) (_ BitVec 32) List!26925) Unit!40565)

(assert (=> b!1224317 (= lt!557433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26922))))

(assert (=> b!1224317 false))

(declare-fun b!1224318 () Bool)

(assert (=> b!1224318 (= e!695347 e!695351)))

(declare-fun res!813531 () Bool)

(assert (=> b!1224318 (=> res!813531 e!695351)))

(assert (=> b!1224318 (= res!813531 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224318 (= lt!557439 (getCurrentListMapNoExtraKeys!5484 lt!557430 lt!557427 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224318 (= lt!557427 (array!79024 (store (arr!38138 _values!996) i!673 (ValueCellFull!14850 lt!557434)) (size!38674 _values!996)))))

(declare-fun dynLambda!3357 (Int (_ BitVec 64)) V!46619)

(assert (=> b!1224318 (= lt!557434 (dynLambda!3357 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224318 (= lt!557432 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224319 () Bool)

(declare-fun res!813530 () Bool)

(assert (=> b!1224319 (=> (not res!813530) (not e!695348))))

(assert (=> b!1224319 (= res!813530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26922))))

(declare-fun b!1224320 () Bool)

(declare-fun res!813529 () Bool)

(assert (=> b!1224320 (=> (not res!813529) (not e!695348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224320 (= res!813529 (validMask!0 mask!1564))))

(declare-fun res!813537 () Bool)

(assert (=> start!101726 (=> (not res!813537) (not e!695348))))

(assert (=> start!101726 (= res!813537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38673 _keys!1208))))))

(assert (=> start!101726 e!695348))

(assert (=> start!101726 tp_is_empty!31119))

(declare-fun array_inv!29010 (array!79021) Bool)

(assert (=> start!101726 (array_inv!29010 _keys!1208)))

(assert (=> start!101726 true))

(assert (=> start!101726 tp!92290))

(declare-fun array_inv!29011 (array!79023) Bool)

(assert (=> start!101726 (and (array_inv!29011 _values!996) e!695353)))

(declare-fun b!1224310 () Bool)

(declare-fun res!813538 () Bool)

(assert (=> b!1224310 (=> (not res!813538) (not e!695348))))

(assert (=> b!1224310 (= res!813538 (= (select (arr!38137 _keys!1208) i!673) k0!934))))

(declare-fun b!1224321 () Bool)

(declare-fun Unit!40568 () Unit!40565)

(assert (=> b!1224321 (= e!695356 Unit!40568)))

(declare-fun b!1224322 () Bool)

(declare-fun res!813523 () Bool)

(assert (=> b!1224322 (=> (not res!813523) (not e!695348))))

(assert (=> b!1224322 (= res!813523 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38673 _keys!1208))))))

(assert (= (and start!101726 res!813537) b!1224320))

(assert (= (and b!1224320 res!813529) b!1224312))

(assert (= (and b!1224312 res!813522) b!1224302))

(assert (= (and b!1224302 res!813536) b!1224319))

(assert (= (and b!1224319 res!813530) b!1224322))

(assert (= (and b!1224322 res!813523) b!1224315))

(assert (= (and b!1224315 res!813533) b!1224310))

(assert (= (and b!1224310 res!813538) b!1224309))

(assert (= (and b!1224309 res!813525) b!1224313))

(assert (= (and b!1224313 res!813535) b!1224301))

(assert (= (and b!1224301 (not res!813532)) b!1224318))

(assert (= (and b!1224318 (not res!813531)) b!1224307))

(assert (= (and b!1224307 (not res!813534)) b!1224304))

(assert (= (and b!1224304 res!813527) b!1224306))

(assert (= (and b!1224306 (not res!813528)) b!1224305))

(assert (= (and b!1224304 c!120443) b!1224317))

(assert (= (and b!1224304 (not c!120443)) b!1224321))

(assert (= (and b!1224304 res!813526) b!1224314))

(assert (= (and b!1224314 res!813524) b!1224316))

(assert (= (and b!1224311 condMapEmpty!48577) mapIsEmpty!48577))

(assert (= (and b!1224311 (not condMapEmpty!48577)) mapNonEmpty!48577))

(get-info :version)

(assert (= (and mapNonEmpty!48577 ((_ is ValueCellFull!14850) mapValue!48577)) b!1224308))

(assert (= (and b!1224311 ((_ is ValueCellFull!14850) mapDefault!48577)) b!1224303))

(assert (= start!101726 b!1224311))

(declare-fun b_lambda!22395 () Bool)

(assert (=> (not b_lambda!22395) (not b!1224318)))

(declare-fun t!40318 () Bool)

(declare-fun tb!11215 () Bool)

(assert (=> (and start!101726 (= defaultEntry!1004 defaultEntry!1004) t!40318) tb!11215))

(declare-fun result!23043 () Bool)

(assert (=> tb!11215 (= result!23043 tp_is_empty!31119)))

(assert (=> b!1224318 t!40318))

(declare-fun b_and!44093 () Bool)

(assert (= b_and!44091 (and (=> t!40318 result!23043) b_and!44093)))

(declare-fun m!1129307 () Bool)

(assert (=> b!1224319 m!1129307))

(declare-fun m!1129309 () Bool)

(assert (=> b!1224304 m!1129309))

(declare-fun m!1129311 () Bool)

(assert (=> b!1224304 m!1129311))

(declare-fun m!1129313 () Bool)

(assert (=> b!1224304 m!1129313))

(assert (=> b!1224304 m!1129313))

(declare-fun m!1129315 () Bool)

(assert (=> b!1224304 m!1129315))

(declare-fun m!1129317 () Bool)

(assert (=> b!1224307 m!1129317))

(declare-fun m!1129319 () Bool)

(assert (=> b!1224307 m!1129319))

(assert (=> b!1224307 m!1129309))

(declare-fun m!1129321 () Bool)

(assert (=> b!1224307 m!1129321))

(assert (=> b!1224307 m!1129309))

(declare-fun m!1129323 () Bool)

(assert (=> b!1224307 m!1129323))

(declare-fun m!1129325 () Bool)

(assert (=> b!1224307 m!1129325))

(declare-fun m!1129327 () Bool)

(assert (=> b!1224301 m!1129327))

(declare-fun m!1129329 () Bool)

(assert (=> b!1224301 m!1129329))

(declare-fun m!1129331 () Bool)

(assert (=> b!1224320 m!1129331))

(declare-fun m!1129333 () Bool)

(assert (=> b!1224310 m!1129333))

(declare-fun m!1129335 () Bool)

(assert (=> b!1224318 m!1129335))

(declare-fun m!1129337 () Bool)

(assert (=> b!1224318 m!1129337))

(declare-fun m!1129339 () Bool)

(assert (=> b!1224318 m!1129339))

(declare-fun m!1129341 () Bool)

(assert (=> b!1224318 m!1129341))

(declare-fun m!1129343 () Bool)

(assert (=> mapNonEmpty!48577 m!1129343))

(declare-fun m!1129345 () Bool)

(assert (=> b!1224313 m!1129345))

(declare-fun m!1129347 () Bool)

(assert (=> b!1224305 m!1129347))

(declare-fun m!1129349 () Bool)

(assert (=> b!1224309 m!1129349))

(declare-fun m!1129351 () Bool)

(assert (=> b!1224309 m!1129351))

(declare-fun m!1129353 () Bool)

(assert (=> start!101726 m!1129353))

(declare-fun m!1129355 () Bool)

(assert (=> start!101726 m!1129355))

(declare-fun m!1129357 () Bool)

(assert (=> b!1224302 m!1129357))

(declare-fun m!1129359 () Bool)

(assert (=> b!1224315 m!1129359))

(assert (=> b!1224306 m!1129309))

(declare-fun m!1129361 () Bool)

(assert (=> b!1224317 m!1129361))

(declare-fun m!1129363 () Bool)

(assert (=> b!1224317 m!1129363))

(declare-fun m!1129365 () Bool)

(assert (=> b!1224317 m!1129365))

(declare-fun m!1129367 () Bool)

(assert (=> b!1224317 m!1129367))

(declare-fun m!1129369 () Bool)

(assert (=> b!1224317 m!1129369))

(declare-fun m!1129371 () Bool)

(assert (=> b!1224314 m!1129371))

(check-sat (not b!1224309) (not b!1224305) (not start!101726) (not b!1224319) (not b!1224317) (not b!1224318) (not b!1224320) (not b!1224302) (not b_lambda!22395) (not b!1224304) (not b!1224314) b_and!44093 (not b_next!26415) (not mapNonEmpty!48577) (not b!1224313) tp_is_empty!31119 (not b!1224301) (not b!1224315) (not b!1224307))
(check-sat b_and!44093 (not b_next!26415))
