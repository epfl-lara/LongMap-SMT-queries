; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99178 () Bool)

(assert start!99178)

(declare-fun b_free!24783 () Bool)

(declare-fun b_next!24783 () Bool)

(assert (=> start!99178 (= b_free!24783 (not b_next!24783))))

(declare-fun tp!87060 () Bool)

(declare-fun b_and!40415 () Bool)

(assert (=> start!99178 (= tp!87060 b_and!40415)))

(declare-fun b!1167454 () Bool)

(declare-fun res!774471 () Bool)

(declare-fun e!663560 () Bool)

(assert (=> b!1167454 (=> (not res!774471) (not e!663560))))

(declare-datatypes ((array!75453 0))(
  ( (array!75454 (arr!36377 (Array (_ BitVec 32) (_ BitVec 64))) (size!36913 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75453)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44211 0))(
  ( (V!44212 (val!14713 Int)) )
))
(declare-datatypes ((ValueCell!13947 0))(
  ( (ValueCellFull!13947 (v!17350 V!44211)) (EmptyCell!13947) )
))
(declare-datatypes ((array!75455 0))(
  ( (array!75456 (arr!36378 (Array (_ BitVec 32) ValueCell!13947)) (size!36914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75455)

(assert (=> b!1167454 (= res!774471 (and (= (size!36914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36913 _keys!1208) (size!36914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45794 () Bool)

(declare-fun mapRes!45794 () Bool)

(assert (=> mapIsEmpty!45794 mapRes!45794))

(declare-fun b!1167455 () Bool)

(declare-fun e!663556 () Bool)

(declare-fun e!663558 () Bool)

(assert (=> b!1167455 (= e!663556 e!663558)))

(declare-fun res!774473 () Bool)

(assert (=> b!1167455 (=> res!774473 e!663558)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167455 (= res!774473 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44211)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525640 () array!75455)

(declare-datatypes ((tuple2!18770 0))(
  ( (tuple2!18771 (_1!9396 (_ BitVec 64)) (_2!9396 V!44211)) )
))
(declare-datatypes ((List!25510 0))(
  ( (Nil!25507) (Cons!25506 (h!26715 tuple2!18770) (t!37285 List!25510)) )
))
(declare-datatypes ((ListLongMap!16739 0))(
  ( (ListLongMap!16740 (toList!8385 List!25510)) )
))
(declare-fun lt!525641 () ListLongMap!16739)

(declare-fun lt!525644 () array!75453)

(declare-fun minValue!944 () V!44211)

(declare-fun getCurrentListMapNoExtraKeys!4849 (array!75453 array!75455 (_ BitVec 32) (_ BitVec 32) V!44211 V!44211 (_ BitVec 32) Int) ListLongMap!16739)

(assert (=> b!1167455 (= lt!525641 (getCurrentListMapNoExtraKeys!4849 lt!525644 lt!525640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2831 (Int (_ BitVec 64)) V!44211)

(assert (=> b!1167455 (= lt!525640 (array!75456 (store (arr!36378 _values!996) i!673 (ValueCellFull!13947 (dynLambda!2831 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36914 _values!996)))))

(declare-fun lt!525645 () ListLongMap!16739)

(assert (=> b!1167455 (= lt!525645 (getCurrentListMapNoExtraKeys!4849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167456 () Bool)

(declare-fun res!774468 () Bool)

(assert (=> b!1167456 (=> (not res!774468) (not e!663560))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167456 (= res!774468 (validKeyInArray!0 k0!934))))

(declare-fun b!1167457 () Bool)

(declare-fun res!774475 () Bool)

(assert (=> b!1167457 (=> (not res!774475) (not e!663560))))

(assert (=> b!1167457 (= res!774475 (= (select (arr!36377 _keys!1208) i!673) k0!934))))

(declare-fun b!1167458 () Bool)

(declare-fun e!663554 () Bool)

(declare-fun tp_is_empty!29313 () Bool)

(assert (=> b!1167458 (= e!663554 tp_is_empty!29313)))

(declare-fun b!1167459 () Bool)

(declare-fun res!774474 () Bool)

(assert (=> b!1167459 (=> (not res!774474) (not e!663560))))

(assert (=> b!1167459 (= res!774474 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36913 _keys!1208))))))

(declare-fun b!1167460 () Bool)

(declare-fun res!774470 () Bool)

(assert (=> b!1167460 (=> (not res!774470) (not e!663560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167460 (= res!774470 (validMask!0 mask!1564))))

(declare-fun res!774469 () Bool)

(assert (=> start!99178 (=> (not res!774469) (not e!663560))))

(assert (=> start!99178 (= res!774469 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36913 _keys!1208))))))

(assert (=> start!99178 e!663560))

(assert (=> start!99178 tp_is_empty!29313))

(declare-fun array_inv!27810 (array!75453) Bool)

(assert (=> start!99178 (array_inv!27810 _keys!1208)))

(assert (=> start!99178 true))

(assert (=> start!99178 tp!87060))

(declare-fun e!663557 () Bool)

(declare-fun array_inv!27811 (array!75455) Bool)

(assert (=> start!99178 (and (array_inv!27811 _values!996) e!663557)))

(declare-fun b!1167461 () Bool)

(declare-fun e!663561 () Bool)

(assert (=> b!1167461 (= e!663560 e!663561)))

(declare-fun res!774472 () Bool)

(assert (=> b!1167461 (=> (not res!774472) (not e!663561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75453 (_ BitVec 32)) Bool)

(assert (=> b!1167461 (= res!774472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525644 mask!1564))))

(assert (=> b!1167461 (= lt!525644 (array!75454 (store (arr!36377 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36913 _keys!1208)))))

(declare-fun b!1167462 () Bool)

(declare-fun res!774476 () Bool)

(assert (=> b!1167462 (=> (not res!774476) (not e!663560))))

(assert (=> b!1167462 (= res!774476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167463 () Bool)

(assert (=> b!1167463 (= e!663558 true)))

(declare-fun -!1460 (ListLongMap!16739 (_ BitVec 64)) ListLongMap!16739)

(assert (=> b!1167463 (= (getCurrentListMapNoExtraKeys!4849 lt!525644 lt!525640 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1460 (getCurrentListMapNoExtraKeys!4849 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38522 0))(
  ( (Unit!38523) )
))
(declare-fun lt!525643 () Unit!38522)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!687 (array!75453 array!75455 (_ BitVec 32) (_ BitVec 32) V!44211 V!44211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38522)

(assert (=> b!1167463 (= lt!525643 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!687 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167464 () Bool)

(declare-fun e!663559 () Bool)

(assert (=> b!1167464 (= e!663559 tp_is_empty!29313)))

(declare-fun b!1167465 () Bool)

(declare-fun res!774479 () Bool)

(assert (=> b!1167465 (=> (not res!774479) (not e!663560))))

(declare-datatypes ((List!25511 0))(
  ( (Nil!25508) (Cons!25507 (h!26716 (_ BitVec 64)) (t!37286 List!25511)) )
))
(declare-fun arrayNoDuplicates!0 (array!75453 (_ BitVec 32) List!25511) Bool)

(assert (=> b!1167465 (= res!774479 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25508))))

(declare-fun b!1167466 () Bool)

(declare-fun res!774477 () Bool)

(assert (=> b!1167466 (=> (not res!774477) (not e!663561))))

(assert (=> b!1167466 (= res!774477 (arrayNoDuplicates!0 lt!525644 #b00000000000000000000000000000000 Nil!25508))))

(declare-fun mapNonEmpty!45794 () Bool)

(declare-fun tp!87059 () Bool)

(assert (=> mapNonEmpty!45794 (= mapRes!45794 (and tp!87059 e!663559))))

(declare-fun mapRest!45794 () (Array (_ BitVec 32) ValueCell!13947))

(declare-fun mapValue!45794 () ValueCell!13947)

(declare-fun mapKey!45794 () (_ BitVec 32))

(assert (=> mapNonEmpty!45794 (= (arr!36378 _values!996) (store mapRest!45794 mapKey!45794 mapValue!45794))))

(declare-fun b!1167467 () Bool)

(assert (=> b!1167467 (= e!663561 (not e!663556))))

(declare-fun res!774478 () Bool)

(assert (=> b!1167467 (=> res!774478 e!663556)))

(assert (=> b!1167467 (= res!774478 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167467 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525642 () Unit!38522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75453 (_ BitVec 64) (_ BitVec 32)) Unit!38522)

(assert (=> b!1167467 (= lt!525642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167468 () Bool)

(assert (=> b!1167468 (= e!663557 (and e!663554 mapRes!45794))))

(declare-fun condMapEmpty!45794 () Bool)

(declare-fun mapDefault!45794 () ValueCell!13947)

(assert (=> b!1167468 (= condMapEmpty!45794 (= (arr!36378 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13947)) mapDefault!45794)))))

(assert (= (and start!99178 res!774469) b!1167460))

(assert (= (and b!1167460 res!774470) b!1167454))

(assert (= (and b!1167454 res!774471) b!1167462))

(assert (= (and b!1167462 res!774476) b!1167465))

(assert (= (and b!1167465 res!774479) b!1167459))

(assert (= (and b!1167459 res!774474) b!1167456))

(assert (= (and b!1167456 res!774468) b!1167457))

(assert (= (and b!1167457 res!774475) b!1167461))

(assert (= (and b!1167461 res!774472) b!1167466))

(assert (= (and b!1167466 res!774477) b!1167467))

(assert (= (and b!1167467 (not res!774478)) b!1167455))

(assert (= (and b!1167455 (not res!774473)) b!1167463))

(assert (= (and b!1167468 condMapEmpty!45794) mapIsEmpty!45794))

(assert (= (and b!1167468 (not condMapEmpty!45794)) mapNonEmpty!45794))

(get-info :version)

(assert (= (and mapNonEmpty!45794 ((_ is ValueCellFull!13947) mapValue!45794)) b!1167464))

(assert (= (and b!1167468 ((_ is ValueCellFull!13947) mapDefault!45794)) b!1167458))

(assert (= start!99178 b!1167468))

(declare-fun b_lambda!19889 () Bool)

(assert (=> (not b_lambda!19889) (not b!1167455)))

(declare-fun t!37284 () Bool)

(declare-fun tb!9595 () Bool)

(assert (=> (and start!99178 (= defaultEntry!1004 defaultEntry!1004) t!37284) tb!9595))

(declare-fun result!19755 () Bool)

(assert (=> tb!9595 (= result!19755 tp_is_empty!29313)))

(assert (=> b!1167455 t!37284))

(declare-fun b_and!40417 () Bool)

(assert (= b_and!40415 (and (=> t!37284 result!19755) b_and!40417)))

(declare-fun m!1075385 () Bool)

(assert (=> b!1167457 m!1075385))

(declare-fun m!1075387 () Bool)

(assert (=> b!1167467 m!1075387))

(declare-fun m!1075389 () Bool)

(assert (=> b!1167467 m!1075389))

(declare-fun m!1075391 () Bool)

(assert (=> b!1167463 m!1075391))

(declare-fun m!1075393 () Bool)

(assert (=> b!1167463 m!1075393))

(assert (=> b!1167463 m!1075393))

(declare-fun m!1075395 () Bool)

(assert (=> b!1167463 m!1075395))

(declare-fun m!1075397 () Bool)

(assert (=> b!1167463 m!1075397))

(declare-fun m!1075399 () Bool)

(assert (=> b!1167460 m!1075399))

(declare-fun m!1075401 () Bool)

(assert (=> b!1167455 m!1075401))

(declare-fun m!1075403 () Bool)

(assert (=> b!1167455 m!1075403))

(declare-fun m!1075405 () Bool)

(assert (=> b!1167455 m!1075405))

(declare-fun m!1075407 () Bool)

(assert (=> b!1167455 m!1075407))

(declare-fun m!1075409 () Bool)

(assert (=> b!1167462 m!1075409))

(declare-fun m!1075411 () Bool)

(assert (=> mapNonEmpty!45794 m!1075411))

(declare-fun m!1075413 () Bool)

(assert (=> b!1167456 m!1075413))

(declare-fun m!1075415 () Bool)

(assert (=> b!1167465 m!1075415))

(declare-fun m!1075417 () Bool)

(assert (=> b!1167461 m!1075417))

(declare-fun m!1075419 () Bool)

(assert (=> b!1167461 m!1075419))

(declare-fun m!1075421 () Bool)

(assert (=> start!99178 m!1075421))

(declare-fun m!1075423 () Bool)

(assert (=> start!99178 m!1075423))

(declare-fun m!1075425 () Bool)

(assert (=> b!1167466 m!1075425))

(check-sat (not b!1167462) tp_is_empty!29313 (not b!1167467) (not b!1167463) (not b_lambda!19889) (not b!1167456) (not b!1167465) b_and!40417 (not start!99178) (not b!1167461) (not mapNonEmpty!45794) (not b!1167455) (not b!1167460) (not b!1167466) (not b_next!24783))
(check-sat b_and!40417 (not b_next!24783))
