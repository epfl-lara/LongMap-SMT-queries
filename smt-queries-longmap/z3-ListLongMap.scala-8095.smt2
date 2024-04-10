; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99438 () Bool)

(assert start!99438)

(declare-fun b_free!25017 () Bool)

(declare-fun b_next!25017 () Bool)

(assert (=> start!99438 (= b_free!25017 (not b_next!25017))))

(declare-fun tp!87765 () Bool)

(declare-fun b_and!40901 () Bool)

(assert (=> start!99438 (= tp!87765 b_and!40901)))

(declare-fun b!1174471 () Bool)

(declare-fun e!667589 () Bool)

(declare-fun e!667588 () Bool)

(declare-fun mapRes!46148 () Bool)

(assert (=> b!1174471 (= e!667589 (and e!667588 mapRes!46148))))

(declare-fun condMapEmpty!46148 () Bool)

(declare-datatypes ((V!44523 0))(
  ( (V!44524 (val!14830 Int)) )
))
(declare-datatypes ((ValueCell!14064 0))(
  ( (ValueCellFull!14064 (v!17468 V!44523)) (EmptyCell!14064) )
))
(declare-datatypes ((array!75905 0))(
  ( (array!75906 (arr!36602 (Array (_ BitVec 32) ValueCell!14064)) (size!37138 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75905)

(declare-fun mapDefault!46148 () ValueCell!14064)

(assert (=> b!1174471 (= condMapEmpty!46148 (= (arr!36602 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14064)) mapDefault!46148)))))

(declare-datatypes ((array!75907 0))(
  ( (array!75908 (arr!36603 (Array (_ BitVec 32) (_ BitVec 64))) (size!37139 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75907)

(declare-fun e!667592 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1174473 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174473 (= e!667592 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174474 () Bool)

(declare-datatypes ((Unit!38749 0))(
  ( (Unit!38750) )
))
(declare-fun e!667594 () Unit!38749)

(declare-fun Unit!38751 () Unit!38749)

(assert (=> b!1174474 (= e!667594 Unit!38751)))

(declare-fun b!1174475 () Bool)

(declare-fun res!779945 () Bool)

(declare-fun e!667586 () Bool)

(assert (=> b!1174475 (=> (not res!779945) (not e!667586))))

(declare-datatypes ((List!25696 0))(
  ( (Nil!25693) (Cons!25692 (h!26901 (_ BitVec 64)) (t!37705 List!25696)) )
))
(declare-fun arrayNoDuplicates!0 (array!75907 (_ BitVec 32) List!25696) Bool)

(assert (=> b!1174475 (= res!779945 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25693))))

(declare-fun b!1174476 () Bool)

(declare-fun e!667591 () Bool)

(assert (=> b!1174476 (= e!667591 e!667592)))

(declare-fun res!779946 () Bool)

(assert (=> b!1174476 (=> res!779946 e!667592)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174476 (= res!779946 (not (= (select (arr!36603 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174477 () Bool)

(declare-fun e!667587 () Bool)

(declare-fun tp_is_empty!29547 () Bool)

(assert (=> b!1174477 (= e!667587 tp_is_empty!29547)))

(declare-fun b!1174478 () Bool)

(declare-fun e!667583 () Bool)

(declare-fun e!667593 () Bool)

(assert (=> b!1174478 (= e!667583 (not e!667593))))

(declare-fun res!779952 () Bool)

(assert (=> b!1174478 (=> res!779952 e!667593)))

(assert (=> b!1174478 (= res!779952 (bvsgt from!1455 i!673))))

(assert (=> b!1174478 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529626 () Unit!38749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75907 (_ BitVec 64) (_ BitVec 32)) Unit!38749)

(assert (=> b!1174478 (= lt!529626 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46148 () Bool)

(assert (=> mapIsEmpty!46148 mapRes!46148))

(declare-fun b!1174479 () Bool)

(declare-fun res!779944 () Bool)

(assert (=> b!1174479 (=> (not res!779944) (not e!667586))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1174479 (= res!779944 (and (= (size!37138 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37139 _keys!1208) (size!37138 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174480 () Bool)

(declare-fun res!779955 () Bool)

(assert (=> b!1174480 (=> (not res!779955) (not e!667586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75907 (_ BitVec 32)) Bool)

(assert (=> b!1174480 (= res!779955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174481 () Bool)

(declare-fun res!779956 () Bool)

(assert (=> b!1174481 (=> (not res!779956) (not e!667583))))

(declare-fun lt!529628 () array!75907)

(assert (=> b!1174481 (= res!779956 (arrayNoDuplicates!0 lt!529628 #b00000000000000000000000000000000 Nil!25693))))

(declare-fun b!1174482 () Bool)

(declare-fun res!779954 () Bool)

(assert (=> b!1174482 (=> (not res!779954) (not e!667586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174482 (= res!779954 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46148 () Bool)

(declare-fun tp!87764 () Bool)

(assert (=> mapNonEmpty!46148 (= mapRes!46148 (and tp!87764 e!667587))))

(declare-fun mapKey!46148 () (_ BitVec 32))

(declare-fun mapRest!46148 () (Array (_ BitVec 32) ValueCell!14064))

(declare-fun mapValue!46148 () ValueCell!14064)

(assert (=> mapNonEmpty!46148 (= (arr!36602 _values!996) (store mapRest!46148 mapKey!46148 mapValue!46148))))

(declare-fun b!1174472 () Bool)

(assert (=> b!1174472 (= e!667586 e!667583)))

(declare-fun res!779949 () Bool)

(assert (=> b!1174472 (=> (not res!779949) (not e!667583))))

(assert (=> b!1174472 (= res!779949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529628 mask!1564))))

(assert (=> b!1174472 (= lt!529628 (array!75908 (store (arr!36603 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37139 _keys!1208)))))

(declare-fun res!779950 () Bool)

(assert (=> start!99438 (=> (not res!779950) (not e!667586))))

(assert (=> start!99438 (= res!779950 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37139 _keys!1208))))))

(assert (=> start!99438 e!667586))

(assert (=> start!99438 tp_is_empty!29547))

(declare-fun array_inv!27962 (array!75907) Bool)

(assert (=> start!99438 (array_inv!27962 _keys!1208)))

(assert (=> start!99438 true))

(assert (=> start!99438 tp!87765))

(declare-fun array_inv!27963 (array!75905) Bool)

(assert (=> start!99438 (and (array_inv!27963 _values!996) e!667589)))

(declare-fun b!1174483 () Bool)

(declare-fun res!779951 () Bool)

(assert (=> b!1174483 (=> (not res!779951) (not e!667586))))

(assert (=> b!1174483 (= res!779951 (= (select (arr!36603 _keys!1208) i!673) k0!934))))

(declare-fun b!1174484 () Bool)

(declare-fun e!667590 () Bool)

(declare-fun e!667585 () Bool)

(assert (=> b!1174484 (= e!667590 e!667585)))

(declare-fun res!779947 () Bool)

(assert (=> b!1174484 (=> res!779947 e!667585)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174484 (= res!779947 (not (validKeyInArray!0 (select (arr!36603 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18958 0))(
  ( (tuple2!18959 (_1!9490 (_ BitVec 64)) (_2!9490 V!44523)) )
))
(declare-datatypes ((List!25697 0))(
  ( (Nil!25694) (Cons!25693 (h!26902 tuple2!18958) (t!37706 List!25697)) )
))
(declare-datatypes ((ListLongMap!16927 0))(
  ( (ListLongMap!16928 (toList!8479 List!25697)) )
))
(declare-fun lt!529625 () ListLongMap!16927)

(declare-fun lt!529637 () ListLongMap!16927)

(assert (=> b!1174484 (= lt!529625 lt!529637)))

(declare-fun lt!529635 () ListLongMap!16927)

(declare-fun -!1539 (ListLongMap!16927 (_ BitVec 64)) ListLongMap!16927)

(assert (=> b!1174484 (= lt!529637 (-!1539 lt!529635 k0!934))))

(declare-fun zeroValue!944 () V!44523)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44523)

(declare-fun lt!529636 () array!75905)

(declare-fun getCurrentListMapNoExtraKeys!4940 (array!75907 array!75905 (_ BitVec 32) (_ BitVec 32) V!44523 V!44523 (_ BitVec 32) Int) ListLongMap!16927)

(assert (=> b!1174484 (= lt!529625 (getCurrentListMapNoExtraKeys!4940 lt!529628 lt!529636 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174484 (= lt!529635 (getCurrentListMapNoExtraKeys!4940 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529634 () Unit!38749)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!766 (array!75907 array!75905 (_ BitVec 32) (_ BitVec 32) V!44523 V!44523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38749)

(assert (=> b!1174484 (= lt!529634 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!766 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174485 () Bool)

(declare-fun Unit!38752 () Unit!38749)

(assert (=> b!1174485 (= e!667594 Unit!38752)))

(declare-fun lt!529633 () Unit!38749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75907 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38749)

(assert (=> b!1174485 (= lt!529633 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174485 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529630 () Unit!38749)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75907 (_ BitVec 32) (_ BitVec 32)) Unit!38749)

(assert (=> b!1174485 (= lt!529630 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174485 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25693)))

(declare-fun lt!529632 () Unit!38749)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75907 (_ BitVec 64) (_ BitVec 32) List!25696) Unit!38749)

(assert (=> b!1174485 (= lt!529632 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25693))))

(assert (=> b!1174485 false))

(declare-fun b!1174486 () Bool)

(declare-fun res!779953 () Bool)

(assert (=> b!1174486 (=> (not res!779953) (not e!667586))))

(assert (=> b!1174486 (= res!779953 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37139 _keys!1208))))))

(declare-fun b!1174487 () Bool)

(assert (=> b!1174487 (= e!667593 e!667590)))

(declare-fun res!779942 () Bool)

(assert (=> b!1174487 (=> res!779942 e!667590)))

(assert (=> b!1174487 (= res!779942 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529629 () ListLongMap!16927)

(assert (=> b!1174487 (= lt!529629 (getCurrentListMapNoExtraKeys!4940 lt!529628 lt!529636 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529627 () V!44523)

(assert (=> b!1174487 (= lt!529636 (array!75906 (store (arr!36602 _values!996) i!673 (ValueCellFull!14064 lt!529627)) (size!37138 _values!996)))))

(declare-fun dynLambda!2908 (Int (_ BitVec 64)) V!44523)

(assert (=> b!1174487 (= lt!529627 (dynLambda!2908 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529638 () ListLongMap!16927)

(assert (=> b!1174487 (= lt!529638 (getCurrentListMapNoExtraKeys!4940 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174488 () Bool)

(assert (=> b!1174488 (= e!667588 tp_is_empty!29547)))

(declare-fun b!1174489 () Bool)

(declare-fun res!779943 () Bool)

(assert (=> b!1174489 (=> (not res!779943) (not e!667586))))

(assert (=> b!1174489 (= res!779943 (validKeyInArray!0 k0!934))))

(declare-fun b!1174490 () Bool)

(assert (=> b!1174490 (= e!667585 true)))

(assert (=> b!1174490 (not (= (select (arr!36603 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529631 () Unit!38749)

(assert (=> b!1174490 (= lt!529631 e!667594)))

(declare-fun c!116649 () Bool)

(assert (=> b!1174490 (= c!116649 (= (select (arr!36603 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174490 e!667591))

(declare-fun res!779948 () Bool)

(assert (=> b!1174490 (=> (not res!779948) (not e!667591))))

(declare-fun +!3796 (ListLongMap!16927 tuple2!18958) ListLongMap!16927)

(declare-fun get!18682 (ValueCell!14064 V!44523) V!44523)

(assert (=> b!1174490 (= res!779948 (= lt!529629 (+!3796 lt!529637 (tuple2!18959 (select (arr!36603 _keys!1208) from!1455) (get!18682 (select (arr!36602 _values!996) from!1455) lt!529627)))))))

(assert (= (and start!99438 res!779950) b!1174482))

(assert (= (and b!1174482 res!779954) b!1174479))

(assert (= (and b!1174479 res!779944) b!1174480))

(assert (= (and b!1174480 res!779955) b!1174475))

(assert (= (and b!1174475 res!779945) b!1174486))

(assert (= (and b!1174486 res!779953) b!1174489))

(assert (= (and b!1174489 res!779943) b!1174483))

(assert (= (and b!1174483 res!779951) b!1174472))

(assert (= (and b!1174472 res!779949) b!1174481))

(assert (= (and b!1174481 res!779956) b!1174478))

(assert (= (and b!1174478 (not res!779952)) b!1174487))

(assert (= (and b!1174487 (not res!779942)) b!1174484))

(assert (= (and b!1174484 (not res!779947)) b!1174490))

(assert (= (and b!1174490 res!779948) b!1174476))

(assert (= (and b!1174476 (not res!779946)) b!1174473))

(assert (= (and b!1174490 c!116649) b!1174485))

(assert (= (and b!1174490 (not c!116649)) b!1174474))

(assert (= (and b!1174471 condMapEmpty!46148) mapIsEmpty!46148))

(assert (= (and b!1174471 (not condMapEmpty!46148)) mapNonEmpty!46148))

(get-info :version)

(assert (= (and mapNonEmpty!46148 ((_ is ValueCellFull!14064) mapValue!46148)) b!1174477))

(assert (= (and b!1174471 ((_ is ValueCellFull!14064) mapDefault!46148)) b!1174488))

(assert (= start!99438 b!1174471))

(declare-fun b_lambda!20161 () Bool)

(assert (=> (not b_lambda!20161) (not b!1174487)))

(declare-fun t!37704 () Bool)

(declare-fun tb!9829 () Bool)

(assert (=> (and start!99438 (= defaultEntry!1004 defaultEntry!1004) t!37704) tb!9829))

(declare-fun result!20225 () Bool)

(assert (=> tb!9829 (= result!20225 tp_is_empty!29547)))

(assert (=> b!1174487 t!37704))

(declare-fun b_and!40903 () Bool)

(assert (= b_and!40901 (and (=> t!37704 result!20225) b_and!40903)))

(declare-fun m!1082347 () Bool)

(assert (=> b!1174482 m!1082347))

(declare-fun m!1082349 () Bool)

(assert (=> mapNonEmpty!46148 m!1082349))

(declare-fun m!1082351 () Bool)

(assert (=> b!1174484 m!1082351))

(declare-fun m!1082353 () Bool)

(assert (=> b!1174484 m!1082353))

(declare-fun m!1082355 () Bool)

(assert (=> b!1174484 m!1082355))

(declare-fun m!1082357 () Bool)

(assert (=> b!1174484 m!1082357))

(declare-fun m!1082359 () Bool)

(assert (=> b!1174484 m!1082359))

(declare-fun m!1082361 () Bool)

(assert (=> b!1174484 m!1082361))

(assert (=> b!1174484 m!1082357))

(declare-fun m!1082363 () Bool)

(assert (=> b!1174475 m!1082363))

(declare-fun m!1082365 () Bool)

(assert (=> b!1174478 m!1082365))

(declare-fun m!1082367 () Bool)

(assert (=> b!1174478 m!1082367))

(declare-fun m!1082369 () Bool)

(assert (=> b!1174485 m!1082369))

(declare-fun m!1082371 () Bool)

(assert (=> b!1174485 m!1082371))

(declare-fun m!1082373 () Bool)

(assert (=> b!1174485 m!1082373))

(declare-fun m!1082375 () Bool)

(assert (=> b!1174485 m!1082375))

(declare-fun m!1082377 () Bool)

(assert (=> b!1174485 m!1082377))

(declare-fun m!1082379 () Bool)

(assert (=> b!1174483 m!1082379))

(declare-fun m!1082381 () Bool)

(assert (=> b!1174472 m!1082381))

(declare-fun m!1082383 () Bool)

(assert (=> b!1174472 m!1082383))

(declare-fun m!1082385 () Bool)

(assert (=> b!1174487 m!1082385))

(declare-fun m!1082387 () Bool)

(assert (=> b!1174487 m!1082387))

(declare-fun m!1082389 () Bool)

(assert (=> b!1174487 m!1082389))

(declare-fun m!1082391 () Bool)

(assert (=> b!1174487 m!1082391))

(declare-fun m!1082393 () Bool)

(assert (=> b!1174489 m!1082393))

(declare-fun m!1082395 () Bool)

(assert (=> b!1174473 m!1082395))

(assert (=> b!1174476 m!1082357))

(declare-fun m!1082397 () Bool)

(assert (=> b!1174481 m!1082397))

(declare-fun m!1082399 () Bool)

(assert (=> start!99438 m!1082399))

(declare-fun m!1082401 () Bool)

(assert (=> start!99438 m!1082401))

(assert (=> b!1174490 m!1082357))

(declare-fun m!1082403 () Bool)

(assert (=> b!1174490 m!1082403))

(assert (=> b!1174490 m!1082403))

(declare-fun m!1082405 () Bool)

(assert (=> b!1174490 m!1082405))

(declare-fun m!1082407 () Bool)

(assert (=> b!1174490 m!1082407))

(declare-fun m!1082409 () Bool)

(assert (=> b!1174480 m!1082409))

(check-sat (not b_next!25017) (not b!1174472) (not b!1174478) (not b!1174490) (not b!1174484) b_and!40903 (not b!1174473) (not start!99438) (not b!1174485) (not b!1174481) (not b_lambda!20161) (not mapNonEmpty!46148) (not b!1174482) (not b!1174487) (not b!1174480) (not b!1174489) tp_is_empty!29547 (not b!1174475))
(check-sat b_and!40903 (not b_next!25017))
