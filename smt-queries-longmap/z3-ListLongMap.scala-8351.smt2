; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101892 () Bool)

(assert start!101892)

(declare-fun b_free!26377 () Bool)

(declare-fun b_next!26377 () Bool)

(assert (=> start!101892 (= b_free!26377 (not b_next!26377))))

(declare-fun tp!92174 () Bool)

(declare-fun b_and!43999 () Bool)

(assert (=> start!101892 (= tp!92174 b_and!43999)))

(declare-fun b!1224201 () Bool)

(declare-fun e!695348 () Bool)

(declare-fun e!695358 () Bool)

(assert (=> b!1224201 (= e!695348 e!695358)))

(declare-fun res!813061 () Bool)

(assert (=> b!1224201 (=> res!813061 e!695358)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224201 (= res!813061 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((array!78981 0))(
  ( (array!78982 (arr!38112 (Array (_ BitVec 32) (_ BitVec 64))) (size!38649 (_ BitVec 32))) )
))
(declare-fun lt!556984 () array!78981)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!46569 0))(
  ( (V!46570 (val!15597 Int)) )
))
(declare-datatypes ((tuple2!20104 0))(
  ( (tuple2!20105 (_1!10063 (_ BitVec 64)) (_2!10063 V!46569)) )
))
(declare-datatypes ((List!26915 0))(
  ( (Nil!26912) (Cons!26911 (h!28129 tuple2!20104) (t!40264 List!26915)) )
))
(declare-datatypes ((ListLongMap!18081 0))(
  ( (ListLongMap!18082 (toList!9056 List!26915)) )
))
(declare-fun lt!556976 () ListLongMap!18081)

(declare-fun minValue!944 () V!46569)

(declare-datatypes ((ValueCell!14831 0))(
  ( (ValueCellFull!14831 (v!18254 V!46569)) (EmptyCell!14831) )
))
(declare-datatypes ((array!78983 0))(
  ( (array!78984 (arr!38113 (Array (_ BitVec 32) ValueCell!14831)) (size!38650 (_ BitVec 32))) )
))
(declare-fun lt!556975 () array!78983)

(declare-fun zeroValue!944 () V!46569)

(declare-fun getCurrentListMapNoExtraKeys!5508 (array!78981 array!78983 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) Int) ListLongMap!18081)

(assert (=> b!1224201 (= lt!556976 (getCurrentListMapNoExtraKeys!5508 lt!556984 lt!556975 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556977 () V!46569)

(declare-fun _values!996 () array!78983)

(assert (=> b!1224201 (= lt!556975 (array!78984 (store (arr!38113 _values!996) i!673 (ValueCellFull!14831 lt!556977)) (size!38650 _values!996)))))

(declare-fun dynLambda!3407 (Int (_ BitVec 64)) V!46569)

(assert (=> b!1224201 (= lt!556977 (dynLambda!3407 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78981)

(declare-fun lt!556973 () ListLongMap!18081)

(assert (=> b!1224201 (= lt!556973 (getCurrentListMapNoExtraKeys!5508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224202 () Bool)

(declare-fun res!813057 () Bool)

(declare-fun e!695347 () Bool)

(assert (=> b!1224202 (=> (not res!813057) (not e!695347))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224202 (= res!813057 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48517 () Bool)

(declare-fun mapRes!48517 () Bool)

(assert (=> mapIsEmpty!48517 mapRes!48517))

(declare-fun b!1224203 () Bool)

(declare-fun res!813054 () Bool)

(assert (=> b!1224203 (=> (not res!813054) (not e!695347))))

(assert (=> b!1224203 (= res!813054 (= (select (arr!38112 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48517 () Bool)

(declare-fun tp!92173 () Bool)

(declare-fun e!695356 () Bool)

(assert (=> mapNonEmpty!48517 (= mapRes!48517 (and tp!92173 e!695356))))

(declare-fun mapRest!48517 () (Array (_ BitVec 32) ValueCell!14831))

(declare-fun mapKey!48517 () (_ BitVec 32))

(declare-fun mapValue!48517 () ValueCell!14831)

(assert (=> mapNonEmpty!48517 (= (arr!38113 _values!996) (store mapRest!48517 mapKey!48517 mapValue!48517))))

(declare-fun b!1224204 () Bool)

(declare-fun e!695351 () Bool)

(declare-fun e!695353 () Bool)

(assert (=> b!1224204 (= e!695351 (and e!695353 mapRes!48517))))

(declare-fun condMapEmpty!48517 () Bool)

(declare-fun mapDefault!48517 () ValueCell!14831)

(assert (=> b!1224204 (= condMapEmpty!48517 (= (arr!38113 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14831)) mapDefault!48517)))))

(declare-fun b!1224205 () Bool)

(declare-fun e!695357 () Bool)

(assert (=> b!1224205 (= e!695357 (not e!695348))))

(declare-fun res!813051 () Bool)

(assert (=> b!1224205 (=> res!813051 e!695348)))

(assert (=> b!1224205 (= res!813051 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224205 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40478 0))(
  ( (Unit!40479) )
))
(declare-fun lt!556980 () Unit!40478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78981 (_ BitVec 64) (_ BitVec 32)) Unit!40478)

(assert (=> b!1224205 (= lt!556980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224206 () Bool)

(declare-fun e!695355 () Bool)

(assert (=> b!1224206 (= e!695355 (bvslt from!1455 (size!38650 _values!996)))))

(assert (=> b!1224206 (not (= (select (arr!38112 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556972 () Unit!40478)

(declare-fun e!695350 () Unit!40478)

(assert (=> b!1224206 (= lt!556972 e!695350)))

(declare-fun c!120745 () Bool)

(assert (=> b!1224206 (= c!120745 (= (select (arr!38112 _keys!1208) from!1455) k0!934))))

(declare-fun e!695354 () Bool)

(assert (=> b!1224206 e!695354))

(declare-fun res!813058 () Bool)

(assert (=> b!1224206 (=> (not res!813058) (not e!695354))))

(declare-fun lt!556978 () ListLongMap!18081)

(declare-fun +!4158 (ListLongMap!18081 tuple2!20104) ListLongMap!18081)

(declare-fun get!19502 (ValueCell!14831 V!46569) V!46569)

(assert (=> b!1224206 (= res!813058 (= lt!556976 (+!4158 lt!556978 (tuple2!20105 (select (arr!38112 _keys!1208) from!1455) (get!19502 (select (arr!38113 _values!996) from!1455) lt!556977)))))))

(declare-fun b!1224207 () Bool)

(declare-fun res!813059 () Bool)

(assert (=> b!1224207 (=> (not res!813059) (not e!695347))))

(declare-datatypes ((List!26916 0))(
  ( (Nil!26913) (Cons!26912 (h!28130 (_ BitVec 64)) (t!40265 List!26916)) )
))
(declare-fun arrayNoDuplicates!0 (array!78981 (_ BitVec 32) List!26916) Bool)

(assert (=> b!1224207 (= res!813059 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26913))))

(declare-fun b!1224208 () Bool)

(declare-fun res!813056 () Bool)

(assert (=> b!1224208 (=> (not res!813056) (not e!695347))))

(assert (=> b!1224208 (= res!813056 (and (= (size!38650 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38649 _keys!1208) (size!38650 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224209 () Bool)

(declare-fun Unit!40480 () Unit!40478)

(assert (=> b!1224209 (= e!695350 Unit!40480)))

(declare-fun lt!556971 () Unit!40478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40478)

(assert (=> b!1224209 (= lt!556971 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224209 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556983 () Unit!40478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78981 (_ BitVec 32) (_ BitVec 32)) Unit!40478)

(assert (=> b!1224209 (= lt!556983 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224209 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26913)))

(declare-fun lt!556982 () Unit!40478)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78981 (_ BitVec 64) (_ BitVec 32) List!26916) Unit!40478)

(assert (=> b!1224209 (= lt!556982 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26913))))

(assert (=> b!1224209 false))

(declare-fun b!1224211 () Bool)

(declare-fun res!813064 () Bool)

(assert (=> b!1224211 (=> (not res!813064) (not e!695347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78981 (_ BitVec 32)) Bool)

(assert (=> b!1224211 (= res!813064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224212 () Bool)

(declare-fun Unit!40481 () Unit!40478)

(assert (=> b!1224212 (= e!695350 Unit!40481)))

(declare-fun b!1224213 () Bool)

(declare-fun e!695352 () Bool)

(assert (=> b!1224213 (= e!695354 e!695352)))

(declare-fun res!813063 () Bool)

(assert (=> b!1224213 (=> res!813063 e!695352)))

(assert (=> b!1224213 (= res!813063 (not (= (select (arr!38112 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224214 () Bool)

(declare-fun tp_is_empty!31081 () Bool)

(assert (=> b!1224214 (= e!695353 tp_is_empty!31081)))

(declare-fun b!1224215 () Bool)

(assert (=> b!1224215 (= e!695356 tp_is_empty!31081)))

(declare-fun b!1224216 () Bool)

(assert (=> b!1224216 (= e!695358 e!695355)))

(declare-fun res!813062 () Bool)

(assert (=> b!1224216 (=> res!813062 e!695355)))

(assert (=> b!1224216 (= res!813062 (not (validKeyInArray!0 (select (arr!38112 _keys!1208) from!1455))))))

(declare-fun lt!556974 () ListLongMap!18081)

(assert (=> b!1224216 (= lt!556974 lt!556978)))

(declare-fun lt!556979 () ListLongMap!18081)

(declare-fun -!1934 (ListLongMap!18081 (_ BitVec 64)) ListLongMap!18081)

(assert (=> b!1224216 (= lt!556978 (-!1934 lt!556979 k0!934))))

(assert (=> b!1224216 (= lt!556974 (getCurrentListMapNoExtraKeys!5508 lt!556984 lt!556975 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224216 (= lt!556979 (getCurrentListMapNoExtraKeys!5508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556981 () Unit!40478)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 (array!78981 array!78983 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40478)

(assert (=> b!1224216 (= lt!556981 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224217 () Bool)

(declare-fun res!813052 () Bool)

(assert (=> b!1224217 (=> (not res!813052) (not e!695357))))

(assert (=> b!1224217 (= res!813052 (arrayNoDuplicates!0 lt!556984 #b00000000000000000000000000000000 Nil!26913))))

(declare-fun b!1224218 () Bool)

(declare-fun res!813053 () Bool)

(assert (=> b!1224218 (=> (not res!813053) (not e!695347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224218 (= res!813053 (validMask!0 mask!1564))))

(declare-fun b!1224219 () Bool)

(declare-fun res!813050 () Bool)

(assert (=> b!1224219 (=> (not res!813050) (not e!695347))))

(assert (=> b!1224219 (= res!813050 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38649 _keys!1208))))))

(declare-fun b!1224220 () Bool)

(assert (=> b!1224220 (= e!695347 e!695357)))

(declare-fun res!813060 () Bool)

(assert (=> b!1224220 (=> (not res!813060) (not e!695357))))

(assert (=> b!1224220 (= res!813060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556984 mask!1564))))

(assert (=> b!1224220 (= lt!556984 (array!78982 (store (arr!38112 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38649 _keys!1208)))))

(declare-fun res!813055 () Bool)

(assert (=> start!101892 (=> (not res!813055) (not e!695347))))

(assert (=> start!101892 (= res!813055 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38649 _keys!1208))))))

(assert (=> start!101892 e!695347))

(assert (=> start!101892 tp_is_empty!31081))

(declare-fun array_inv!29076 (array!78981) Bool)

(assert (=> start!101892 (array_inv!29076 _keys!1208)))

(assert (=> start!101892 true))

(assert (=> start!101892 tp!92174))

(declare-fun array_inv!29077 (array!78983) Bool)

(assert (=> start!101892 (and (array_inv!29077 _values!996) e!695351)))

(declare-fun b!1224210 () Bool)

(assert (=> b!1224210 (= e!695352 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101892 res!813055) b!1224218))

(assert (= (and b!1224218 res!813053) b!1224208))

(assert (= (and b!1224208 res!813056) b!1224211))

(assert (= (and b!1224211 res!813064) b!1224207))

(assert (= (and b!1224207 res!813059) b!1224219))

(assert (= (and b!1224219 res!813050) b!1224202))

(assert (= (and b!1224202 res!813057) b!1224203))

(assert (= (and b!1224203 res!813054) b!1224220))

(assert (= (and b!1224220 res!813060) b!1224217))

(assert (= (and b!1224217 res!813052) b!1224205))

(assert (= (and b!1224205 (not res!813051)) b!1224201))

(assert (= (and b!1224201 (not res!813061)) b!1224216))

(assert (= (and b!1224216 (not res!813062)) b!1224206))

(assert (= (and b!1224206 res!813058) b!1224213))

(assert (= (and b!1224213 (not res!813063)) b!1224210))

(assert (= (and b!1224206 c!120745) b!1224209))

(assert (= (and b!1224206 (not c!120745)) b!1224212))

(assert (= (and b!1224204 condMapEmpty!48517) mapIsEmpty!48517))

(assert (= (and b!1224204 (not condMapEmpty!48517)) mapNonEmpty!48517))

(get-info :version)

(assert (= (and mapNonEmpty!48517 ((_ is ValueCellFull!14831) mapValue!48517)) b!1224215))

(assert (= (and b!1224204 ((_ is ValueCellFull!14831) mapDefault!48517)) b!1224214))

(assert (= start!101892 b!1224204))

(declare-fun b_lambda!22313 () Bool)

(assert (=> (not b_lambda!22313) (not b!1224201)))

(declare-fun t!40263 () Bool)

(declare-fun tb!11169 () Bool)

(assert (=> (and start!101892 (= defaultEntry!1004 defaultEntry!1004) t!40263) tb!11169))

(declare-fun result!22957 () Bool)

(assert (=> tb!11169 (= result!22957 tp_is_empty!31081)))

(assert (=> b!1224201 t!40263))

(declare-fun b_and!44001 () Bool)

(assert (= b_and!43999 (and (=> t!40263 result!22957) b_and!44001)))

(declare-fun m!1129451 () Bool)

(assert (=> b!1224220 m!1129451))

(declare-fun m!1129453 () Bool)

(assert (=> b!1224220 m!1129453))

(declare-fun m!1129455 () Bool)

(assert (=> b!1224202 m!1129455))

(declare-fun m!1129457 () Bool)

(assert (=> b!1224209 m!1129457))

(declare-fun m!1129459 () Bool)

(assert (=> b!1224209 m!1129459))

(declare-fun m!1129461 () Bool)

(assert (=> b!1224209 m!1129461))

(declare-fun m!1129463 () Bool)

(assert (=> b!1224209 m!1129463))

(declare-fun m!1129465 () Bool)

(assert (=> b!1224209 m!1129465))

(declare-fun m!1129467 () Bool)

(assert (=> b!1224201 m!1129467))

(declare-fun m!1129469 () Bool)

(assert (=> b!1224201 m!1129469))

(declare-fun m!1129471 () Bool)

(assert (=> b!1224201 m!1129471))

(declare-fun m!1129473 () Bool)

(assert (=> b!1224201 m!1129473))

(declare-fun m!1129475 () Bool)

(assert (=> b!1224211 m!1129475))

(declare-fun m!1129477 () Bool)

(assert (=> b!1224207 m!1129477))

(declare-fun m!1129479 () Bool)

(assert (=> b!1224218 m!1129479))

(declare-fun m!1129481 () Bool)

(assert (=> b!1224206 m!1129481))

(declare-fun m!1129483 () Bool)

(assert (=> b!1224206 m!1129483))

(assert (=> b!1224206 m!1129483))

(declare-fun m!1129485 () Bool)

(assert (=> b!1224206 m!1129485))

(declare-fun m!1129487 () Bool)

(assert (=> b!1224206 m!1129487))

(declare-fun m!1129489 () Bool)

(assert (=> b!1224203 m!1129489))

(declare-fun m!1129491 () Bool)

(assert (=> b!1224205 m!1129491))

(declare-fun m!1129493 () Bool)

(assert (=> b!1224205 m!1129493))

(declare-fun m!1129495 () Bool)

(assert (=> b!1224216 m!1129495))

(declare-fun m!1129497 () Bool)

(assert (=> b!1224216 m!1129497))

(declare-fun m!1129499 () Bool)

(assert (=> b!1224216 m!1129499))

(declare-fun m!1129501 () Bool)

(assert (=> b!1224216 m!1129501))

(assert (=> b!1224216 m!1129481))

(declare-fun m!1129503 () Bool)

(assert (=> b!1224216 m!1129503))

(assert (=> b!1224216 m!1129481))

(declare-fun m!1129505 () Bool)

(assert (=> b!1224210 m!1129505))

(declare-fun m!1129507 () Bool)

(assert (=> mapNonEmpty!48517 m!1129507))

(assert (=> b!1224213 m!1129481))

(declare-fun m!1129509 () Bool)

(assert (=> start!101892 m!1129509))

(declare-fun m!1129511 () Bool)

(assert (=> start!101892 m!1129511))

(declare-fun m!1129513 () Bool)

(assert (=> b!1224217 m!1129513))

(check-sat b_and!44001 (not b!1224205) (not mapNonEmpty!48517) (not b!1224211) (not b!1224217) tp_is_empty!31081 (not b!1224220) (not b_lambda!22313) (not b!1224216) (not b!1224209) (not start!101892) (not b!1224201) (not b!1224206) (not b!1224207) (not b!1224210) (not b_next!26377) (not b!1224202) (not b!1224218))
(check-sat b_and!44001 (not b_next!26377))
