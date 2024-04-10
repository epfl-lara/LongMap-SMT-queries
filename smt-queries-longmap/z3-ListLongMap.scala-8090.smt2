; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99408 () Bool)

(assert start!99408)

(declare-fun b_free!24987 () Bool)

(declare-fun b_next!24987 () Bool)

(assert (=> start!99408 (= b_free!24987 (not b_next!24987))))

(declare-fun tp!87675 () Bool)

(declare-fun b_and!40841 () Bool)

(assert (=> start!99408 (= tp!87675 b_and!40841)))

(declare-fun b!1173541 () Bool)

(declare-fun e!667047 () Bool)

(declare-fun tp_is_empty!29517 () Bool)

(assert (=> b!1173541 (= e!667047 tp_is_empty!29517)))

(declare-fun b!1173542 () Bool)

(declare-datatypes ((Unit!38702 0))(
  ( (Unit!38703) )
))
(declare-fun e!667052 () Unit!38702)

(declare-fun Unit!38704 () Unit!38702)

(assert (=> b!1173542 (= e!667052 Unit!38704)))

(declare-fun b!1173543 () Bool)

(declare-fun res!779276 () Bool)

(declare-fun e!667053 () Bool)

(assert (=> b!1173543 (=> (not res!779276) (not e!667053))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173543 (= res!779276 (validKeyInArray!0 k0!934))))

(declare-fun b!1173544 () Bool)

(declare-fun res!779273 () Bool)

(declare-fun e!667044 () Bool)

(assert (=> b!1173544 (=> (not res!779273) (not e!667044))))

(declare-datatypes ((array!75845 0))(
  ( (array!75846 (arr!36572 (Array (_ BitVec 32) (_ BitVec 64))) (size!37108 (_ BitVec 32))) )
))
(declare-fun lt!529002 () array!75845)

(declare-datatypes ((List!25671 0))(
  ( (Nil!25668) (Cons!25667 (h!26876 (_ BitVec 64)) (t!37650 List!25671)) )
))
(declare-fun arrayNoDuplicates!0 (array!75845 (_ BitVec 32) List!25671) Bool)

(assert (=> b!1173544 (= res!779273 (arrayNoDuplicates!0 lt!529002 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1173545 () Bool)

(declare-fun e!667054 () Bool)

(declare-fun e!667051 () Bool)

(assert (=> b!1173545 (= e!667054 e!667051)))

(declare-fun res!779272 () Bool)

(assert (=> b!1173545 (=> res!779272 e!667051)))

(declare-fun _keys!1208 () array!75845)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173545 (= res!779272 (not (validKeyInArray!0 (select (arr!36572 _keys!1208) from!1455))))))

(declare-datatypes ((V!44483 0))(
  ( (V!44484 (val!14815 Int)) )
))
(declare-datatypes ((tuple2!18932 0))(
  ( (tuple2!18933 (_1!9477 (_ BitVec 64)) (_2!9477 V!44483)) )
))
(declare-datatypes ((List!25672 0))(
  ( (Nil!25669) (Cons!25668 (h!26877 tuple2!18932) (t!37651 List!25672)) )
))
(declare-datatypes ((ListLongMap!16901 0))(
  ( (ListLongMap!16902 (toList!8466 List!25672)) )
))
(declare-fun lt!528995 () ListLongMap!16901)

(declare-fun lt!529001 () ListLongMap!16901)

(assert (=> b!1173545 (= lt!528995 lt!529001)))

(declare-fun lt!529004 () ListLongMap!16901)

(declare-fun -!1529 (ListLongMap!16901 (_ BitVec 64)) ListLongMap!16901)

(assert (=> b!1173545 (= lt!529001 (-!1529 lt!529004 k0!934))))

(declare-fun zeroValue!944 () V!44483)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14049 0))(
  ( (ValueCellFull!14049 (v!17453 V!44483)) (EmptyCell!14049) )
))
(declare-datatypes ((array!75847 0))(
  ( (array!75848 (arr!36573 (Array (_ BitVec 32) ValueCell!14049)) (size!37109 (_ BitVec 32))) )
))
(declare-fun lt!529005 () array!75847)

(declare-fun defaultEntry!1004 () Int)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!44483)

(declare-fun getCurrentListMapNoExtraKeys!4928 (array!75845 array!75847 (_ BitVec 32) (_ BitVec 32) V!44483 V!44483 (_ BitVec 32) Int) ListLongMap!16901)

(assert (=> b!1173545 (= lt!528995 (getCurrentListMapNoExtraKeys!4928 lt!529002 lt!529005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75847)

(assert (=> b!1173545 (= lt!529004 (getCurrentListMapNoExtraKeys!4928 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!529006 () Unit!38702)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!756 (array!75845 array!75847 (_ BitVec 32) (_ BitVec 32) V!44483 V!44483 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38702)

(assert (=> b!1173545 (= lt!529006 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!756 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173546 () Bool)

(declare-fun res!779280 () Bool)

(assert (=> b!1173546 (=> (not res!779280) (not e!667053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173546 (= res!779280 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46103 () Bool)

(declare-fun mapRes!46103 () Bool)

(declare-fun tp!87674 () Bool)

(assert (=> mapNonEmpty!46103 (= mapRes!46103 (and tp!87674 e!667047))))

(declare-fun mapKey!46103 () (_ BitVec 32))

(declare-fun mapRest!46103 () (Array (_ BitVec 32) ValueCell!14049))

(declare-fun mapValue!46103 () ValueCell!14049)

(assert (=> mapNonEmpty!46103 (= (arr!36573 _values!996) (store mapRest!46103 mapKey!46103 mapValue!46103))))

(declare-fun b!1173547 () Bool)

(declare-fun e!667043 () Bool)

(assert (=> b!1173547 (= e!667044 (not e!667043))))

(declare-fun res!779270 () Bool)

(assert (=> b!1173547 (=> res!779270 e!667043)))

(assert (=> b!1173547 (= res!779270 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173547 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528997 () Unit!38702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75845 (_ BitVec 64) (_ BitVec 32)) Unit!38702)

(assert (=> b!1173547 (= lt!528997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173548 () Bool)

(declare-fun res!779275 () Bool)

(assert (=> b!1173548 (=> (not res!779275) (not e!667053))))

(assert (=> b!1173548 (= res!779275 (= (select (arr!36572 _keys!1208) i!673) k0!934))))

(declare-fun res!779269 () Bool)

(assert (=> start!99408 (=> (not res!779269) (not e!667053))))

(assert (=> start!99408 (= res!779269 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37108 _keys!1208))))))

(assert (=> start!99408 e!667053))

(assert (=> start!99408 tp_is_empty!29517))

(declare-fun array_inv!27942 (array!75845) Bool)

(assert (=> start!99408 (array_inv!27942 _keys!1208)))

(assert (=> start!99408 true))

(assert (=> start!99408 tp!87675))

(declare-fun e!667046 () Bool)

(declare-fun array_inv!27943 (array!75847) Bool)

(assert (=> start!99408 (and (array_inv!27943 _values!996) e!667046)))

(declare-fun b!1173549 () Bool)

(declare-fun e!667050 () Bool)

(assert (=> b!1173549 (= e!667050 tp_is_empty!29517)))

(declare-fun b!1173550 () Bool)

(declare-fun res!779281 () Bool)

(assert (=> b!1173550 (=> (not res!779281) (not e!667053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75845 (_ BitVec 32)) Bool)

(assert (=> b!1173550 (= res!779281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46103 () Bool)

(assert (=> mapIsEmpty!46103 mapRes!46103))

(declare-fun b!1173551 () Bool)

(declare-fun e!667048 () Bool)

(assert (=> b!1173551 (= e!667048 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173552 () Bool)

(declare-fun res!779279 () Bool)

(assert (=> b!1173552 (=> (not res!779279) (not e!667053))))

(assert (=> b!1173552 (= res!779279 (and (= (size!37109 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37108 _keys!1208) (size!37109 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173553 () Bool)

(declare-fun Unit!38705 () Unit!38702)

(assert (=> b!1173553 (= e!667052 Unit!38705)))

(declare-fun lt!528996 () Unit!38702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75845 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38702)

(assert (=> b!1173553 (= lt!528996 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173553 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528998 () Unit!38702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75845 (_ BitVec 32) (_ BitVec 32)) Unit!38702)

(assert (=> b!1173553 (= lt!528998 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173553 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25668)))

(declare-fun lt!529000 () Unit!38702)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75845 (_ BitVec 64) (_ BitVec 32) List!25671) Unit!38702)

(assert (=> b!1173553 (= lt!529000 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25668))))

(assert (=> b!1173553 false))

(declare-fun b!1173554 () Bool)

(assert (=> b!1173554 (= e!667043 e!667054)))

(declare-fun res!779268 () Bool)

(assert (=> b!1173554 (=> res!779268 e!667054)))

(assert (=> b!1173554 (= res!779268 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529008 () ListLongMap!16901)

(assert (=> b!1173554 (= lt!529008 (getCurrentListMapNoExtraKeys!4928 lt!529002 lt!529005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529003 () V!44483)

(assert (=> b!1173554 (= lt!529005 (array!75848 (store (arr!36573 _values!996) i!673 (ValueCellFull!14049 lt!529003)) (size!37109 _values!996)))))

(declare-fun dynLambda!2899 (Int (_ BitVec 64)) V!44483)

(assert (=> b!1173554 (= lt!529003 (dynLambda!2899 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529007 () ListLongMap!16901)

(assert (=> b!1173554 (= lt!529007 (getCurrentListMapNoExtraKeys!4928 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173555 () Bool)

(assert (=> b!1173555 (= e!667053 e!667044)))

(declare-fun res!779274 () Bool)

(assert (=> b!1173555 (=> (not res!779274) (not e!667044))))

(assert (=> b!1173555 (= res!779274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529002 mask!1564))))

(assert (=> b!1173555 (= lt!529002 (array!75846 (store (arr!36572 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37108 _keys!1208)))))

(declare-fun b!1173556 () Bool)

(assert (=> b!1173556 (= e!667051 true)))

(assert (=> b!1173556 (not (= (select (arr!36572 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528999 () Unit!38702)

(assert (=> b!1173556 (= lt!528999 e!667052)))

(declare-fun c!116604 () Bool)

(assert (=> b!1173556 (= c!116604 (= (select (arr!36572 _keys!1208) from!1455) k0!934))))

(declare-fun e!667049 () Bool)

(assert (=> b!1173556 e!667049))

(declare-fun res!779271 () Bool)

(assert (=> b!1173556 (=> (not res!779271) (not e!667049))))

(declare-fun +!3785 (ListLongMap!16901 tuple2!18932) ListLongMap!16901)

(declare-fun get!18661 (ValueCell!14049 V!44483) V!44483)

(assert (=> b!1173556 (= res!779271 (= lt!529008 (+!3785 lt!529001 (tuple2!18933 (select (arr!36572 _keys!1208) from!1455) (get!18661 (select (arr!36573 _values!996) from!1455) lt!529003)))))))

(declare-fun b!1173557 () Bool)

(declare-fun res!779278 () Bool)

(assert (=> b!1173557 (=> (not res!779278) (not e!667053))))

(assert (=> b!1173557 (= res!779278 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37108 _keys!1208))))))

(declare-fun b!1173558 () Bool)

(declare-fun res!779267 () Bool)

(assert (=> b!1173558 (=> (not res!779267) (not e!667053))))

(assert (=> b!1173558 (= res!779267 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1173559 () Bool)

(assert (=> b!1173559 (= e!667046 (and e!667050 mapRes!46103))))

(declare-fun condMapEmpty!46103 () Bool)

(declare-fun mapDefault!46103 () ValueCell!14049)

(assert (=> b!1173559 (= condMapEmpty!46103 (= (arr!36573 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14049)) mapDefault!46103)))))

(declare-fun b!1173560 () Bool)

(assert (=> b!1173560 (= e!667049 e!667048)))

(declare-fun res!779277 () Bool)

(assert (=> b!1173560 (=> res!779277 e!667048)))

(assert (=> b!1173560 (= res!779277 (not (= (select (arr!36572 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99408 res!779269) b!1173546))

(assert (= (and b!1173546 res!779280) b!1173552))

(assert (= (and b!1173552 res!779279) b!1173550))

(assert (= (and b!1173550 res!779281) b!1173558))

(assert (= (and b!1173558 res!779267) b!1173557))

(assert (= (and b!1173557 res!779278) b!1173543))

(assert (= (and b!1173543 res!779276) b!1173548))

(assert (= (and b!1173548 res!779275) b!1173555))

(assert (= (and b!1173555 res!779274) b!1173544))

(assert (= (and b!1173544 res!779273) b!1173547))

(assert (= (and b!1173547 (not res!779270)) b!1173554))

(assert (= (and b!1173554 (not res!779268)) b!1173545))

(assert (= (and b!1173545 (not res!779272)) b!1173556))

(assert (= (and b!1173556 res!779271) b!1173560))

(assert (= (and b!1173560 (not res!779277)) b!1173551))

(assert (= (and b!1173556 c!116604) b!1173553))

(assert (= (and b!1173556 (not c!116604)) b!1173542))

(assert (= (and b!1173559 condMapEmpty!46103) mapIsEmpty!46103))

(assert (= (and b!1173559 (not condMapEmpty!46103)) mapNonEmpty!46103))

(get-info :version)

(assert (= (and mapNonEmpty!46103 ((_ is ValueCellFull!14049) mapValue!46103)) b!1173541))

(assert (= (and b!1173559 ((_ is ValueCellFull!14049) mapDefault!46103)) b!1173549))

(assert (= start!99408 b!1173559))

(declare-fun b_lambda!20131 () Bool)

(assert (=> (not b_lambda!20131) (not b!1173554)))

(declare-fun t!37649 () Bool)

(declare-fun tb!9799 () Bool)

(assert (=> (and start!99408 (= defaultEntry!1004 defaultEntry!1004) t!37649) tb!9799))

(declare-fun result!20165 () Bool)

(assert (=> tb!9799 (= result!20165 tp_is_empty!29517)))

(assert (=> b!1173554 t!37649))

(declare-fun b_and!40843 () Bool)

(assert (= b_and!40841 (and (=> t!37649 result!20165) b_and!40843)))

(declare-fun m!1081387 () Bool)

(assert (=> start!99408 m!1081387))

(declare-fun m!1081389 () Bool)

(assert (=> start!99408 m!1081389))

(declare-fun m!1081391 () Bool)

(assert (=> b!1173546 m!1081391))

(declare-fun m!1081393 () Bool)

(assert (=> b!1173545 m!1081393))

(declare-fun m!1081395 () Bool)

(assert (=> b!1173545 m!1081395))

(declare-fun m!1081397 () Bool)

(assert (=> b!1173545 m!1081397))

(declare-fun m!1081399 () Bool)

(assert (=> b!1173545 m!1081399))

(declare-fun m!1081401 () Bool)

(assert (=> b!1173545 m!1081401))

(declare-fun m!1081403 () Bool)

(assert (=> b!1173545 m!1081403))

(assert (=> b!1173545 m!1081401))

(declare-fun m!1081405 () Bool)

(assert (=> b!1173553 m!1081405))

(declare-fun m!1081407 () Bool)

(assert (=> b!1173553 m!1081407))

(declare-fun m!1081409 () Bool)

(assert (=> b!1173553 m!1081409))

(declare-fun m!1081411 () Bool)

(assert (=> b!1173553 m!1081411))

(declare-fun m!1081413 () Bool)

(assert (=> b!1173553 m!1081413))

(declare-fun m!1081415 () Bool)

(assert (=> b!1173550 m!1081415))

(assert (=> b!1173556 m!1081401))

(declare-fun m!1081417 () Bool)

(assert (=> b!1173556 m!1081417))

(assert (=> b!1173556 m!1081417))

(declare-fun m!1081419 () Bool)

(assert (=> b!1173556 m!1081419))

(declare-fun m!1081421 () Bool)

(assert (=> b!1173556 m!1081421))

(declare-fun m!1081423 () Bool)

(assert (=> b!1173548 m!1081423))

(declare-fun m!1081425 () Bool)

(assert (=> b!1173547 m!1081425))

(declare-fun m!1081427 () Bool)

(assert (=> b!1173547 m!1081427))

(declare-fun m!1081429 () Bool)

(assert (=> mapNonEmpty!46103 m!1081429))

(declare-fun m!1081431 () Bool)

(assert (=> b!1173543 m!1081431))

(assert (=> b!1173560 m!1081401))

(declare-fun m!1081433 () Bool)

(assert (=> b!1173555 m!1081433))

(declare-fun m!1081435 () Bool)

(assert (=> b!1173555 m!1081435))

(declare-fun m!1081437 () Bool)

(assert (=> b!1173554 m!1081437))

(declare-fun m!1081439 () Bool)

(assert (=> b!1173554 m!1081439))

(declare-fun m!1081441 () Bool)

(assert (=> b!1173554 m!1081441))

(declare-fun m!1081443 () Bool)

(assert (=> b!1173554 m!1081443))

(declare-fun m!1081445 () Bool)

(assert (=> b!1173558 m!1081445))

(declare-fun m!1081447 () Bool)

(assert (=> b!1173544 m!1081447))

(declare-fun m!1081449 () Bool)

(assert (=> b!1173551 m!1081449))

(check-sat (not b!1173551) (not b!1173544) (not b!1173550) (not b!1173556) (not b!1173558) (not b_next!24987) (not b!1173543) (not b_lambda!20131) (not b!1173545) (not b!1173554) (not b!1173546) (not b!1173547) (not b!1173555) (not mapNonEmpty!46103) (not b!1173553) (not start!99408) b_and!40843 tp_is_empty!29517)
(check-sat b_and!40843 (not b_next!24987))
