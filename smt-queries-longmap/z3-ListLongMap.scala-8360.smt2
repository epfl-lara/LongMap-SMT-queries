; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101978 () Bool)

(assert start!101978)

(declare-fun b_free!26431 () Bool)

(declare-fun b_next!26431 () Bool)

(assert (=> start!101978 (= b_free!26431 (not b_next!26431))))

(declare-fun tp!92339 () Bool)

(declare-fun b_and!44125 () Bool)

(assert (=> start!101978 (= tp!92339 b_and!44125)))

(declare-fun b!1226110 () Bool)

(declare-fun res!814420 () Bool)

(declare-fun e!696480 () Bool)

(assert (=> b!1226110 (=> (not res!814420) (not e!696480))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46641 0))(
  ( (V!46642 (val!15624 Int)) )
))
(declare-datatypes ((ValueCell!14858 0))(
  ( (ValueCellFull!14858 (v!18282 V!46641)) (EmptyCell!14858) )
))
(declare-datatypes ((array!79091 0))(
  ( (array!79092 (arr!38166 (Array (_ BitVec 32) ValueCell!14858)) (size!38703 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79091)

(declare-datatypes ((array!79093 0))(
  ( (array!79094 (arr!38167 (Array (_ BitVec 32) (_ BitVec 64))) (size!38704 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79093)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1226110 (= res!814420 (and (= (size!38703 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38704 _keys!1208) (size!38703 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226111 () Bool)

(declare-fun res!814418 () Bool)

(assert (=> b!1226111 (=> (not res!814418) (not e!696480))))

(declare-datatypes ((List!26962 0))(
  ( (Nil!26959) (Cons!26958 (h!28176 (_ BitVec 64)) (t!40365 List!26962)) )
))
(declare-fun arrayNoDuplicates!0 (array!79093 (_ BitVec 32) List!26962) Bool)

(assert (=> b!1226111 (= res!814418 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26959))))

(declare-fun b!1226112 () Bool)

(declare-fun res!814424 () Bool)

(assert (=> b!1226112 (=> (not res!814424) (not e!696480))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226112 (= res!814424 (validKeyInArray!0 k0!934))))

(declare-fun b!1226113 () Bool)

(declare-fun e!696479 () Bool)

(declare-fun tp_is_empty!31135 () Bool)

(assert (=> b!1226113 (= e!696479 tp_is_empty!31135)))

(declare-fun b!1226114 () Bool)

(declare-fun e!696486 () Bool)

(declare-fun e!696485 () Bool)

(assert (=> b!1226114 (= e!696486 e!696485)))

(declare-fun res!814423 () Bool)

(assert (=> b!1226114 (=> res!814423 e!696485)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1226114 (= res!814423 (not (validKeyInArray!0 (select (arr!38167 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20150 0))(
  ( (tuple2!20151 (_1!10086 (_ BitVec 64)) (_2!10086 V!46641)) )
))
(declare-datatypes ((List!26963 0))(
  ( (Nil!26960) (Cons!26959 (h!28177 tuple2!20150) (t!40366 List!26963)) )
))
(declare-datatypes ((ListLongMap!18127 0))(
  ( (ListLongMap!18128 (toList!9079 List!26963)) )
))
(declare-fun lt!558327 () ListLongMap!18127)

(declare-fun lt!558311 () ListLongMap!18127)

(assert (=> b!1226114 (= lt!558327 lt!558311)))

(declare-fun lt!558313 () ListLongMap!18127)

(declare-fun -!1950 (ListLongMap!18127 (_ BitVec 64)) ListLongMap!18127)

(assert (=> b!1226114 (= lt!558311 (-!1950 lt!558313 k0!934))))

(declare-fun zeroValue!944 () V!46641)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558322 () array!79091)

(declare-fun lt!558323 () array!79093)

(declare-fun minValue!944 () V!46641)

(declare-fun getCurrentListMapNoExtraKeys!5526 (array!79093 array!79091 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) Int) ListLongMap!18127)

(assert (=> b!1226114 (= lt!558327 (getCurrentListMapNoExtraKeys!5526 lt!558323 lt!558322 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1226114 (= lt!558313 (getCurrentListMapNoExtraKeys!5526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40557 0))(
  ( (Unit!40558) )
))
(declare-fun lt!558324 () Unit!40557)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 (array!79093 array!79091 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40557)

(assert (=> b!1226114 (= lt!558324 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226115 () Bool)

(declare-fun e!696484 () Unit!40557)

(declare-fun Unit!40559 () Unit!40557)

(assert (=> b!1226115 (= e!696484 Unit!40559)))

(declare-fun lt!558325 () Unit!40557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40557)

(assert (=> b!1226115 (= lt!558325 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226115 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558320 () Unit!40557)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79093 (_ BitVec 32) (_ BitVec 32)) Unit!40557)

(assert (=> b!1226115 (= lt!558320 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1226115 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26959)))

(declare-fun lt!558312 () Unit!40557)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79093 (_ BitVec 64) (_ BitVec 32) List!26962) Unit!40557)

(assert (=> b!1226115 (= lt!558312 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26959))))

(assert (=> b!1226115 false))

(declare-fun b!1226116 () Bool)

(declare-fun res!814414 () Bool)

(assert (=> b!1226116 (=> (not res!814414) (not e!696480))))

(assert (=> b!1226116 (= res!814414 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38704 _keys!1208))))))

(declare-fun mapNonEmpty!48601 () Bool)

(declare-fun mapRes!48601 () Bool)

(declare-fun tp!92338 () Bool)

(declare-fun e!696482 () Bool)

(assert (=> mapNonEmpty!48601 (= mapRes!48601 (and tp!92338 e!696482))))

(declare-fun mapRest!48601 () (Array (_ BitVec 32) ValueCell!14858))

(declare-fun mapKey!48601 () (_ BitVec 32))

(declare-fun mapValue!48601 () ValueCell!14858)

(assert (=> mapNonEmpty!48601 (= (arr!38166 _values!996) (store mapRest!48601 mapKey!48601 mapValue!48601))))

(declare-fun b!1226117 () Bool)

(assert (=> b!1226117 (= e!696485 (bvslt i!673 (size!38703 _values!996)))))

(declare-fun lt!558314 () ListLongMap!18127)

(declare-fun lt!558315 () ListLongMap!18127)

(assert (=> b!1226117 (= (-!1950 lt!558314 k0!934) lt!558315)))

(declare-fun lt!558318 () V!46641)

(declare-fun lt!558321 () Unit!40557)

(declare-fun addRemoveCommutativeForDiffKeys!214 (ListLongMap!18127 (_ BitVec 64) V!46641 (_ BitVec 64)) Unit!40557)

(assert (=> b!1226117 (= lt!558321 (addRemoveCommutativeForDiffKeys!214 lt!558313 (select (arr!38167 _keys!1208) from!1455) lt!558318 k0!934))))

(declare-fun lt!558329 () ListLongMap!18127)

(assert (=> b!1226117 (and (= lt!558329 lt!558314) (= lt!558311 lt!558327))))

(declare-fun lt!558319 () tuple2!20150)

(declare-fun +!4179 (ListLongMap!18127 tuple2!20150) ListLongMap!18127)

(assert (=> b!1226117 (= lt!558314 (+!4179 lt!558313 lt!558319))))

(assert (=> b!1226117 (not (= (select (arr!38167 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558316 () Unit!40557)

(assert (=> b!1226117 (= lt!558316 e!696484)))

(declare-fun c!120865 () Bool)

(assert (=> b!1226117 (= c!120865 (= (select (arr!38167 _keys!1208) from!1455) k0!934))))

(declare-fun e!696477 () Bool)

(assert (=> b!1226117 e!696477))

(declare-fun res!814417 () Bool)

(assert (=> b!1226117 (=> (not res!814417) (not e!696477))))

(declare-fun lt!558326 () ListLongMap!18127)

(assert (=> b!1226117 (= res!814417 (= lt!558326 lt!558315))))

(assert (=> b!1226117 (= lt!558315 (+!4179 lt!558311 lt!558319))))

(assert (=> b!1226117 (= lt!558319 (tuple2!20151 (select (arr!38167 _keys!1208) from!1455) lt!558318))))

(declare-fun lt!558317 () V!46641)

(declare-fun get!19537 (ValueCell!14858 V!46641) V!46641)

(assert (=> b!1226117 (= lt!558318 (get!19537 (select (arr!38166 _values!996) from!1455) lt!558317))))

(declare-fun b!1226118 () Bool)

(declare-fun res!814425 () Bool)

(assert (=> b!1226118 (=> (not res!814425) (not e!696480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226118 (= res!814425 (validMask!0 mask!1564))))

(declare-fun b!1226119 () Bool)

(assert (=> b!1226119 (= e!696482 tp_is_empty!31135)))

(declare-fun b!1226120 () Bool)

(declare-fun e!696478 () Bool)

(assert (=> b!1226120 (= e!696478 e!696486)))

(declare-fun res!814419 () Bool)

(assert (=> b!1226120 (=> res!814419 e!696486)))

(assert (=> b!1226120 (= res!814419 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1226120 (= lt!558326 (getCurrentListMapNoExtraKeys!5526 lt!558323 lt!558322 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1226120 (= lt!558322 (array!79092 (store (arr!38166 _values!996) i!673 (ValueCellFull!14858 lt!558317)) (size!38703 _values!996)))))

(declare-fun dynLambda!3424 (Int (_ BitVec 64)) V!46641)

(assert (=> b!1226120 (= lt!558317 (dynLambda!3424 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1226120 (= lt!558329 (getCurrentListMapNoExtraKeys!5526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226121 () Bool)

(declare-fun e!696483 () Bool)

(assert (=> b!1226121 (= e!696483 (not e!696478))))

(declare-fun res!814421 () Bool)

(assert (=> b!1226121 (=> res!814421 e!696478)))

(assert (=> b!1226121 (= res!814421 (bvsgt from!1455 i!673))))

(assert (=> b!1226121 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558328 () Unit!40557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79093 (_ BitVec 64) (_ BitVec 32)) Unit!40557)

(assert (=> b!1226121 (= lt!558328 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226122 () Bool)

(declare-fun e!696476 () Bool)

(assert (=> b!1226122 (= e!696476 (and e!696479 mapRes!48601))))

(declare-fun condMapEmpty!48601 () Bool)

(declare-fun mapDefault!48601 () ValueCell!14858)

(assert (=> b!1226122 (= condMapEmpty!48601 (= (arr!38166 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14858)) mapDefault!48601)))))

(declare-fun e!696487 () Bool)

(declare-fun b!1226123 () Bool)

(assert (=> b!1226123 (= e!696487 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!814428 () Bool)

(assert (=> start!101978 (=> (not res!814428) (not e!696480))))

(assert (=> start!101978 (= res!814428 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38704 _keys!1208))))))

(assert (=> start!101978 e!696480))

(assert (=> start!101978 tp_is_empty!31135))

(declare-fun array_inv!29116 (array!79093) Bool)

(assert (=> start!101978 (array_inv!29116 _keys!1208)))

(assert (=> start!101978 true))

(assert (=> start!101978 tp!92339))

(declare-fun array_inv!29117 (array!79091) Bool)

(assert (=> start!101978 (and (array_inv!29117 _values!996) e!696476)))

(declare-fun mapIsEmpty!48601 () Bool)

(assert (=> mapIsEmpty!48601 mapRes!48601))

(declare-fun b!1226124 () Bool)

(assert (=> b!1226124 (= e!696480 e!696483)))

(declare-fun res!814415 () Bool)

(assert (=> b!1226124 (=> (not res!814415) (not e!696483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79093 (_ BitVec 32)) Bool)

(assert (=> b!1226124 (= res!814415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558323 mask!1564))))

(assert (=> b!1226124 (= lt!558323 (array!79094 (store (arr!38167 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38704 _keys!1208)))))

(declare-fun b!1226125 () Bool)

(declare-fun res!814426 () Bool)

(assert (=> b!1226125 (=> (not res!814426) (not e!696480))))

(assert (=> b!1226125 (= res!814426 (= (select (arr!38167 _keys!1208) i!673) k0!934))))

(declare-fun b!1226126 () Bool)

(assert (=> b!1226126 (= e!696477 e!696487)))

(declare-fun res!814422 () Bool)

(assert (=> b!1226126 (=> res!814422 e!696487)))

(assert (=> b!1226126 (= res!814422 (not (= (select (arr!38167 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1226127 () Bool)

(declare-fun res!814427 () Bool)

(assert (=> b!1226127 (=> (not res!814427) (not e!696480))))

(assert (=> b!1226127 (= res!814427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226128 () Bool)

(declare-fun Unit!40560 () Unit!40557)

(assert (=> b!1226128 (= e!696484 Unit!40560)))

(declare-fun b!1226129 () Bool)

(declare-fun res!814416 () Bool)

(assert (=> b!1226129 (=> (not res!814416) (not e!696483))))

(assert (=> b!1226129 (= res!814416 (arrayNoDuplicates!0 lt!558323 #b00000000000000000000000000000000 Nil!26959))))

(assert (= (and start!101978 res!814428) b!1226118))

(assert (= (and b!1226118 res!814425) b!1226110))

(assert (= (and b!1226110 res!814420) b!1226127))

(assert (= (and b!1226127 res!814427) b!1226111))

(assert (= (and b!1226111 res!814418) b!1226116))

(assert (= (and b!1226116 res!814414) b!1226112))

(assert (= (and b!1226112 res!814424) b!1226125))

(assert (= (and b!1226125 res!814426) b!1226124))

(assert (= (and b!1226124 res!814415) b!1226129))

(assert (= (and b!1226129 res!814416) b!1226121))

(assert (= (and b!1226121 (not res!814421)) b!1226120))

(assert (= (and b!1226120 (not res!814419)) b!1226114))

(assert (= (and b!1226114 (not res!814423)) b!1226117))

(assert (= (and b!1226117 res!814417) b!1226126))

(assert (= (and b!1226126 (not res!814422)) b!1226123))

(assert (= (and b!1226117 c!120865) b!1226115))

(assert (= (and b!1226117 (not c!120865)) b!1226128))

(assert (= (and b!1226122 condMapEmpty!48601) mapIsEmpty!48601))

(assert (= (and b!1226122 (not condMapEmpty!48601)) mapNonEmpty!48601))

(get-info :version)

(assert (= (and mapNonEmpty!48601 ((_ is ValueCellFull!14858) mapValue!48601)) b!1226119))

(assert (= (and b!1226122 ((_ is ValueCellFull!14858) mapDefault!48601)) b!1226113))

(assert (= start!101978 b!1226122))

(declare-fun b_lambda!22405 () Bool)

(assert (=> (not b_lambda!22405) (not b!1226120)))

(declare-fun t!40364 () Bool)

(declare-fun tb!11223 () Bool)

(assert (=> (and start!101978 (= defaultEntry!1004 defaultEntry!1004) t!40364) tb!11223))

(declare-fun result!23067 () Bool)

(assert (=> tb!11223 (= result!23067 tp_is_empty!31135)))

(assert (=> b!1226120 t!40364))

(declare-fun b_and!44127 () Bool)

(assert (= b_and!44125 (and (=> t!40364 result!23067) b_and!44127)))

(declare-fun m!1131437 () Bool)

(assert (=> b!1226117 m!1131437))

(declare-fun m!1131439 () Bool)

(assert (=> b!1226117 m!1131439))

(declare-fun m!1131441 () Bool)

(assert (=> b!1226117 m!1131441))

(declare-fun m!1131443 () Bool)

(assert (=> b!1226117 m!1131443))

(assert (=> b!1226117 m!1131437))

(declare-fun m!1131445 () Bool)

(assert (=> b!1226117 m!1131445))

(declare-fun m!1131447 () Bool)

(assert (=> b!1226117 m!1131447))

(declare-fun m!1131449 () Bool)

(assert (=> b!1226117 m!1131449))

(assert (=> b!1226117 m!1131447))

(declare-fun m!1131451 () Bool)

(assert (=> mapNonEmpty!48601 m!1131451))

(declare-fun m!1131453 () Bool)

(assert (=> b!1226129 m!1131453))

(declare-fun m!1131455 () Bool)

(assert (=> b!1226124 m!1131455))

(declare-fun m!1131457 () Bool)

(assert (=> b!1226124 m!1131457))

(declare-fun m!1131459 () Bool)

(assert (=> b!1226123 m!1131459))

(declare-fun m!1131461 () Bool)

(assert (=> b!1226120 m!1131461))

(declare-fun m!1131463 () Bool)

(assert (=> b!1226120 m!1131463))

(declare-fun m!1131465 () Bool)

(assert (=> b!1226120 m!1131465))

(declare-fun m!1131467 () Bool)

(assert (=> b!1226120 m!1131467))

(declare-fun m!1131469 () Bool)

(assert (=> b!1226114 m!1131469))

(declare-fun m!1131471 () Bool)

(assert (=> b!1226114 m!1131471))

(declare-fun m!1131473 () Bool)

(assert (=> b!1226114 m!1131473))

(declare-fun m!1131475 () Bool)

(assert (=> b!1226114 m!1131475))

(assert (=> b!1226114 m!1131447))

(declare-fun m!1131477 () Bool)

(assert (=> b!1226114 m!1131477))

(assert (=> b!1226114 m!1131447))

(declare-fun m!1131479 () Bool)

(assert (=> b!1226118 m!1131479))

(declare-fun m!1131481 () Bool)

(assert (=> b!1226121 m!1131481))

(declare-fun m!1131483 () Bool)

(assert (=> b!1226121 m!1131483))

(declare-fun m!1131485 () Bool)

(assert (=> b!1226115 m!1131485))

(declare-fun m!1131487 () Bool)

(assert (=> b!1226115 m!1131487))

(declare-fun m!1131489 () Bool)

(assert (=> b!1226115 m!1131489))

(declare-fun m!1131491 () Bool)

(assert (=> b!1226115 m!1131491))

(declare-fun m!1131493 () Bool)

(assert (=> b!1226115 m!1131493))

(declare-fun m!1131495 () Bool)

(assert (=> b!1226112 m!1131495))

(declare-fun m!1131497 () Bool)

(assert (=> start!101978 m!1131497))

(declare-fun m!1131499 () Bool)

(assert (=> start!101978 m!1131499))

(declare-fun m!1131501 () Bool)

(assert (=> b!1226111 m!1131501))

(assert (=> b!1226126 m!1131447))

(declare-fun m!1131503 () Bool)

(assert (=> b!1226127 m!1131503))

(declare-fun m!1131505 () Bool)

(assert (=> b!1226125 m!1131505))

(check-sat (not b!1226124) (not b_next!26431) (not b!1226111) (not b!1226123) (not b!1226118) (not b!1226120) b_and!44127 (not b_lambda!22405) (not mapNonEmpty!48601) (not b!1226127) (not b!1226117) (not b!1226129) (not b!1226114) (not b!1226112) (not b!1226115) tp_is_empty!31135 (not start!101978) (not b!1226121))
(check-sat b_and!44127 (not b_next!26431))
