; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99484 () Bool)

(assert start!99484)

(declare-fun b_free!25069 () Bool)

(declare-fun b_next!25069 () Bool)

(assert (=> start!99484 (= b_free!25069 (not b_next!25069))))

(declare-fun tp!87920 () Bool)

(declare-fun b_and!40983 () Bool)

(assert (=> start!99484 (= tp!87920 b_and!40983)))

(declare-fun b!1175961 () Bool)

(declare-datatypes ((Unit!38654 0))(
  ( (Unit!38655) )
))
(declare-fun e!668454 () Unit!38654)

(declare-fun Unit!38656 () Unit!38654)

(assert (=> b!1175961 (= e!668454 Unit!38656)))

(declare-fun mapIsEmpty!46226 () Bool)

(declare-fun mapRes!46226 () Bool)

(assert (=> mapIsEmpty!46226 mapRes!46226))

(declare-datatypes ((V!44593 0))(
  ( (V!44594 (val!14856 Int)) )
))
(declare-datatypes ((tuple2!19100 0))(
  ( (tuple2!19101 (_1!9561 (_ BitVec 64)) (_2!9561 V!44593)) )
))
(declare-fun lt!530540 () tuple2!19100)

(declare-datatypes ((List!25811 0))(
  ( (Nil!25808) (Cons!25807 (h!27016 tuple2!19100) (t!37863 List!25811)) )
))
(declare-datatypes ((ListLongMap!17069 0))(
  ( (ListLongMap!17070 (toList!8550 List!25811)) )
))
(declare-fun lt!530534 () ListLongMap!17069)

(declare-fun b!1175962 () Bool)

(declare-fun e!668450 () Bool)

(declare-fun lt!530541 () ListLongMap!17069)

(declare-fun +!3854 (ListLongMap!17069 tuple2!19100) ListLongMap!17069)

(assert (=> b!1175962 (= e!668450 (= lt!530534 (+!3854 lt!530541 lt!530540)))))

(declare-fun res!781053 () Bool)

(declare-fun e!668447 () Bool)

(assert (=> start!99484 (=> (not res!781053) (not e!668447))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75938 0))(
  ( (array!75939 (arr!36619 (Array (_ BitVec 32) (_ BitVec 64))) (size!37157 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75938)

(assert (=> start!99484 (= res!781053 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37157 _keys!1208))))))

(assert (=> start!99484 e!668447))

(declare-fun tp_is_empty!29599 () Bool)

(assert (=> start!99484 tp_is_empty!29599))

(declare-fun array_inv!28078 (array!75938) Bool)

(assert (=> start!99484 (array_inv!28078 _keys!1208)))

(assert (=> start!99484 true))

(assert (=> start!99484 tp!87920))

(declare-datatypes ((ValueCell!14090 0))(
  ( (ValueCellFull!14090 (v!17493 V!44593)) (EmptyCell!14090) )
))
(declare-datatypes ((array!75940 0))(
  ( (array!75941 (arr!36620 (Array (_ BitVec 32) ValueCell!14090)) (size!37158 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75940)

(declare-fun e!668449 () Bool)

(declare-fun array_inv!28079 (array!75940) Bool)

(assert (=> start!99484 (and (array_inv!28079 _values!996) e!668449)))

(declare-fun b!1175963 () Bool)

(declare-fun res!781060 () Bool)

(assert (=> b!1175963 (=> (not res!781060) (not e!668447))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175963 (= res!781060 (validMask!0 mask!1564))))

(declare-fun b!1175964 () Bool)

(declare-fun res!781056 () Bool)

(assert (=> b!1175964 (=> (not res!781056) (not e!668447))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175964 (= res!781056 (validKeyInArray!0 k0!934))))

(declare-fun b!1175965 () Bool)

(declare-fun res!781063 () Bool)

(assert (=> b!1175965 (=> (not res!781063) (not e!668447))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1175965 (= res!781063 (and (= (size!37158 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37157 _keys!1208) (size!37158 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46226 () Bool)

(declare-fun tp!87921 () Bool)

(declare-fun e!668451 () Bool)

(assert (=> mapNonEmpty!46226 (= mapRes!46226 (and tp!87921 e!668451))))

(declare-fun mapRest!46226 () (Array (_ BitVec 32) ValueCell!14090))

(declare-fun mapValue!46226 () ValueCell!14090)

(declare-fun mapKey!46226 () (_ BitVec 32))

(assert (=> mapNonEmpty!46226 (= (arr!36620 _values!996) (store mapRest!46226 mapKey!46226 mapValue!46226))))

(declare-fun b!1175966 () Bool)

(declare-fun e!668446 () Bool)

(declare-fun e!668444 () Bool)

(assert (=> b!1175966 (= e!668446 e!668444)))

(declare-fun res!781061 () Bool)

(assert (=> b!1175966 (=> res!781061 e!668444)))

(assert (=> b!1175966 (= res!781061 (not (validKeyInArray!0 (select (arr!36619 _keys!1208) from!1455))))))

(declare-fun lt!530529 () ListLongMap!17069)

(declare-fun lt!530536 () ListLongMap!17069)

(assert (=> b!1175966 (= lt!530529 lt!530536)))

(declare-fun -!1530 (ListLongMap!17069 (_ BitVec 64)) ListLongMap!17069)

(assert (=> b!1175966 (= lt!530536 (-!1530 lt!530541 k0!934))))

(declare-fun lt!530532 () array!75940)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530537 () array!75938)

(declare-fun minValue!944 () V!44593)

(declare-fun zeroValue!944 () V!44593)

(declare-fun getCurrentListMapNoExtraKeys!5019 (array!75938 array!75940 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) Int) ListLongMap!17069)

(assert (=> b!1175966 (= lt!530529 (getCurrentListMapNoExtraKeys!5019 lt!530537 lt!530532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175966 (= lt!530541 (getCurrentListMapNoExtraKeys!5019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!530535 () Unit!38654)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 (array!75938 array!75940 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38654)

(assert (=> b!1175966 (= lt!530535 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175967 () Bool)

(declare-fun e!668448 () Bool)

(assert (=> b!1175967 (= e!668449 (and e!668448 mapRes!46226))))

(declare-fun condMapEmpty!46226 () Bool)

(declare-fun mapDefault!46226 () ValueCell!14090)

(assert (=> b!1175967 (= condMapEmpty!46226 (= (arr!36620 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14090)) mapDefault!46226)))))

(declare-fun b!1175968 () Bool)

(declare-fun res!781062 () Bool)

(assert (=> b!1175968 (=> (not res!781062) (not e!668447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75938 (_ BitVec 32)) Bool)

(assert (=> b!1175968 (= res!781062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175969 () Bool)

(declare-fun e!668455 () Bool)

(assert (=> b!1175969 (= e!668455 e!668446)))

(declare-fun res!781049 () Bool)

(assert (=> b!1175969 (=> res!781049 e!668446)))

(assert (=> b!1175969 (= res!781049 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!530530 () ListLongMap!17069)

(assert (=> b!1175969 (= lt!530530 (getCurrentListMapNoExtraKeys!5019 lt!530537 lt!530532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530527 () V!44593)

(assert (=> b!1175969 (= lt!530532 (array!75941 (store (arr!36620 _values!996) i!673 (ValueCellFull!14090 lt!530527)) (size!37158 _values!996)))))

(declare-fun dynLambda!2936 (Int (_ BitVec 64)) V!44593)

(assert (=> b!1175969 (= lt!530527 (dynLambda!2936 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1175969 (= lt!530534 (getCurrentListMapNoExtraKeys!5019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175970 () Bool)

(declare-fun e!668443 () Bool)

(declare-fun e!668453 () Bool)

(assert (=> b!1175970 (= e!668443 e!668453)))

(declare-fun res!781052 () Bool)

(assert (=> b!1175970 (=> res!781052 e!668453)))

(assert (=> b!1175970 (= res!781052 (not (= (select (arr!36619 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175971 () Bool)

(declare-fun res!781048 () Bool)

(assert (=> b!1175971 (=> (not res!781048) (not e!668447))))

(assert (=> b!1175971 (= res!781048 (= (select (arr!36619 _keys!1208) i!673) k0!934))))

(declare-fun b!1175972 () Bool)

(declare-fun e!668445 () Bool)

(assert (=> b!1175972 (= e!668445 (not e!668455))))

(declare-fun res!781050 () Bool)

(assert (=> b!1175972 (=> res!781050 e!668455)))

(assert (=> b!1175972 (= res!781050 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175972 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530528 () Unit!38654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75938 (_ BitVec 64) (_ BitVec 32)) Unit!38654)

(assert (=> b!1175972 (= lt!530528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175973 () Bool)

(assert (=> b!1175973 (= e!668453 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175974 () Bool)

(assert (=> b!1175974 (= e!668444 true)))

(assert (=> b!1175974 e!668450))

(declare-fun res!781054 () Bool)

(assert (=> b!1175974 (=> (not res!781054) (not e!668450))))

(assert (=> b!1175974 (= res!781054 (not (= (select (arr!36619 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!530539 () Unit!38654)

(assert (=> b!1175974 (= lt!530539 e!668454)))

(declare-fun c!116701 () Bool)

(assert (=> b!1175974 (= c!116701 (= (select (arr!36619 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175974 e!668443))

(declare-fun res!781059 () Bool)

(assert (=> b!1175974 (=> (not res!781059) (not e!668443))))

(assert (=> b!1175974 (= res!781059 (= lt!530530 (+!3854 lt!530536 lt!530540)))))

(declare-fun get!18710 (ValueCell!14090 V!44593) V!44593)

(assert (=> b!1175974 (= lt!530540 (tuple2!19101 (select (arr!36619 _keys!1208) from!1455) (get!18710 (select (arr!36620 _values!996) from!1455) lt!530527)))))

(declare-fun b!1175975 () Bool)

(assert (=> b!1175975 (= e!668448 tp_is_empty!29599)))

(declare-fun b!1175976 () Bool)

(declare-fun Unit!38657 () Unit!38654)

(assert (=> b!1175976 (= e!668454 Unit!38657)))

(declare-fun lt!530533 () Unit!38654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38654)

(assert (=> b!1175976 (= lt!530533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175976 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530538 () Unit!38654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75938 (_ BitVec 32) (_ BitVec 32)) Unit!38654)

(assert (=> b!1175976 (= lt!530538 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25812 0))(
  ( (Nil!25809) (Cons!25808 (h!27017 (_ BitVec 64)) (t!37864 List!25812)) )
))
(declare-fun arrayNoDuplicates!0 (array!75938 (_ BitVec 32) List!25812) Bool)

(assert (=> b!1175976 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25809)))

(declare-fun lt!530531 () Unit!38654)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75938 (_ BitVec 64) (_ BitVec 32) List!25812) Unit!38654)

(assert (=> b!1175976 (= lt!530531 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25809))))

(assert (=> b!1175976 false))

(declare-fun b!1175977 () Bool)

(declare-fun res!781051 () Bool)

(assert (=> b!1175977 (=> (not res!781051) (not e!668447))))

(assert (=> b!1175977 (= res!781051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37157 _keys!1208))))))

(declare-fun b!1175978 () Bool)

(declare-fun res!781057 () Bool)

(assert (=> b!1175978 (=> (not res!781057) (not e!668445))))

(assert (=> b!1175978 (= res!781057 (arrayNoDuplicates!0 lt!530537 #b00000000000000000000000000000000 Nil!25809))))

(declare-fun b!1175979 () Bool)

(declare-fun res!781055 () Bool)

(assert (=> b!1175979 (=> (not res!781055) (not e!668447))))

(assert (=> b!1175979 (= res!781055 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25809))))

(declare-fun b!1175980 () Bool)

(assert (=> b!1175980 (= e!668451 tp_is_empty!29599)))

(declare-fun b!1175981 () Bool)

(assert (=> b!1175981 (= e!668447 e!668445)))

(declare-fun res!781058 () Bool)

(assert (=> b!1175981 (=> (not res!781058) (not e!668445))))

(assert (=> b!1175981 (= res!781058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530537 mask!1564))))

(assert (=> b!1175981 (= lt!530537 (array!75939 (store (arr!36619 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37157 _keys!1208)))))

(assert (= (and start!99484 res!781053) b!1175963))

(assert (= (and b!1175963 res!781060) b!1175965))

(assert (= (and b!1175965 res!781063) b!1175968))

(assert (= (and b!1175968 res!781062) b!1175979))

(assert (= (and b!1175979 res!781055) b!1175977))

(assert (= (and b!1175977 res!781051) b!1175964))

(assert (= (and b!1175964 res!781056) b!1175971))

(assert (= (and b!1175971 res!781048) b!1175981))

(assert (= (and b!1175981 res!781058) b!1175978))

(assert (= (and b!1175978 res!781057) b!1175972))

(assert (= (and b!1175972 (not res!781050)) b!1175969))

(assert (= (and b!1175969 (not res!781049)) b!1175966))

(assert (= (and b!1175966 (not res!781061)) b!1175974))

(assert (= (and b!1175974 res!781059) b!1175970))

(assert (= (and b!1175970 (not res!781052)) b!1175973))

(assert (= (and b!1175974 c!116701) b!1175976))

(assert (= (and b!1175974 (not c!116701)) b!1175961))

(assert (= (and b!1175974 res!781054) b!1175962))

(assert (= (and b!1175967 condMapEmpty!46226) mapIsEmpty!46226))

(assert (= (and b!1175967 (not condMapEmpty!46226)) mapNonEmpty!46226))

(get-info :version)

(assert (= (and mapNonEmpty!46226 ((_ is ValueCellFull!14090) mapValue!46226)) b!1175980))

(assert (= (and b!1175967 ((_ is ValueCellFull!14090) mapDefault!46226)) b!1175975))

(assert (= start!99484 b!1175967))

(declare-fun b_lambda!20195 () Bool)

(assert (=> (not b_lambda!20195) (not b!1175969)))

(declare-fun t!37862 () Bool)

(declare-fun tb!9873 () Bool)

(assert (=> (and start!99484 (= defaultEntry!1004 defaultEntry!1004) t!37862) tb!9873))

(declare-fun result!20321 () Bool)

(assert (=> tb!9873 (= result!20321 tp_is_empty!29599)))

(assert (=> b!1175969 t!37862))

(declare-fun b_and!40985 () Bool)

(assert (= b_and!40983 (and (=> t!37862 result!20321) b_and!40985)))

(declare-fun m!1083401 () Bool)

(assert (=> b!1175976 m!1083401))

(declare-fun m!1083403 () Bool)

(assert (=> b!1175976 m!1083403))

(declare-fun m!1083405 () Bool)

(assert (=> b!1175976 m!1083405))

(declare-fun m!1083407 () Bool)

(assert (=> b!1175976 m!1083407))

(declare-fun m!1083409 () Bool)

(assert (=> b!1175976 m!1083409))

(declare-fun m!1083411 () Bool)

(assert (=> b!1175974 m!1083411))

(declare-fun m!1083413 () Bool)

(assert (=> b!1175974 m!1083413))

(declare-fun m!1083415 () Bool)

(assert (=> b!1175974 m!1083415))

(assert (=> b!1175974 m!1083415))

(declare-fun m!1083417 () Bool)

(assert (=> b!1175974 m!1083417))

(declare-fun m!1083419 () Bool)

(assert (=> mapNonEmpty!46226 m!1083419))

(declare-fun m!1083421 () Bool)

(assert (=> start!99484 m!1083421))

(declare-fun m!1083423 () Bool)

(assert (=> start!99484 m!1083423))

(declare-fun m!1083425 () Bool)

(assert (=> b!1175966 m!1083425))

(declare-fun m!1083427 () Bool)

(assert (=> b!1175966 m!1083427))

(declare-fun m!1083429 () Bool)

(assert (=> b!1175966 m!1083429))

(declare-fun m!1083431 () Bool)

(assert (=> b!1175966 m!1083431))

(assert (=> b!1175966 m!1083411))

(declare-fun m!1083433 () Bool)

(assert (=> b!1175966 m!1083433))

(assert (=> b!1175966 m!1083411))

(declare-fun m!1083435 () Bool)

(assert (=> b!1175971 m!1083435))

(declare-fun m!1083437 () Bool)

(assert (=> b!1175972 m!1083437))

(declare-fun m!1083439 () Bool)

(assert (=> b!1175972 m!1083439))

(declare-fun m!1083441 () Bool)

(assert (=> b!1175978 m!1083441))

(declare-fun m!1083443 () Bool)

(assert (=> b!1175963 m!1083443))

(declare-fun m!1083445 () Bool)

(assert (=> b!1175969 m!1083445))

(declare-fun m!1083447 () Bool)

(assert (=> b!1175969 m!1083447))

(declare-fun m!1083449 () Bool)

(assert (=> b!1175969 m!1083449))

(declare-fun m!1083451 () Bool)

(assert (=> b!1175969 m!1083451))

(declare-fun m!1083453 () Bool)

(assert (=> b!1175979 m!1083453))

(declare-fun m!1083455 () Bool)

(assert (=> b!1175964 m!1083455))

(declare-fun m!1083457 () Bool)

(assert (=> b!1175962 m!1083457))

(declare-fun m!1083459 () Bool)

(assert (=> b!1175981 m!1083459))

(declare-fun m!1083461 () Bool)

(assert (=> b!1175981 m!1083461))

(declare-fun m!1083463 () Bool)

(assert (=> b!1175973 m!1083463))

(assert (=> b!1175970 m!1083411))

(declare-fun m!1083465 () Bool)

(assert (=> b!1175968 m!1083465))

(check-sat (not b!1175964) (not mapNonEmpty!46226) (not b_next!25069) (not b!1175978) (not b!1175979) (not b!1175972) (not b!1175963) (not b!1175974) (not b!1175976) (not b!1175968) tp_is_empty!29599 (not b!1175981) (not b!1175973) (not start!99484) (not b!1175962) (not b!1175969) (not b_lambda!20195) b_and!40985 (not b!1175966))
(check-sat b_and!40985 (not b_next!25069))
