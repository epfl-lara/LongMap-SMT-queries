; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97492 () Bool)

(assert start!97492)

(declare-fun b_free!23227 () Bool)

(declare-fun b_next!23227 () Bool)

(assert (=> start!97492 (= b_free!23227 (not b_next!23227))))

(declare-fun tp!81980 () Bool)

(declare-fun b_and!37295 () Bool)

(assert (=> start!97492 (= tp!81980 b_and!37295)))

(declare-fun b!1108372 () Bool)

(declare-fun res!739335 () Bool)

(declare-fun e!632514 () Bool)

(assert (=> b!1108372 (=> (not res!739335) (not e!632514))))

(declare-datatypes ((array!71927 0))(
  ( (array!71928 (arr!34610 (Array (_ BitVec 32) (_ BitVec 64))) (size!35147 (_ BitVec 32))) )
))
(declare-fun lt!496073 () array!71927)

(declare-datatypes ((List!24128 0))(
  ( (Nil!24125) (Cons!24124 (h!25342 (_ BitVec 64)) (t!34393 List!24128)) )
))
(declare-fun arrayNoDuplicates!0 (array!71927 (_ BitVec 32) List!24128) Bool)

(assert (=> b!1108372 (= res!739335 (arrayNoDuplicates!0 lt!496073 #b00000000000000000000000000000000 Nil!24125))))

(declare-datatypes ((V!41777 0))(
  ( (V!41778 (val!13800 Int)) )
))
(declare-fun zeroValue!944 () V!41777)

(declare-fun _keys!1208 () array!71927)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17440 0))(
  ( (tuple2!17441 (_1!8731 (_ BitVec 64)) (_2!8731 V!41777)) )
))
(declare-datatypes ((List!24129 0))(
  ( (Nil!24126) (Cons!24125 (h!25343 tuple2!17440) (t!34394 List!24129)) )
))
(declare-datatypes ((ListLongMap!15417 0))(
  ( (ListLongMap!15418 (toList!7724 List!24129)) )
))
(declare-fun call!46445 () ListLongMap!15417)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46441 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13034 0))(
  ( (ValueCellFull!13034 (v!16429 V!41777)) (EmptyCell!13034) )
))
(declare-datatypes ((array!71929 0))(
  ( (array!71930 (arr!34611 (Array (_ BitVec 32) ValueCell!13034)) (size!35148 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71929)

(declare-fun minValue!944 () V!41777)

(declare-fun getCurrentListMapNoExtraKeys!4262 (array!71927 array!71929 (_ BitVec 32) (_ BitVec 32) V!41777 V!41777 (_ BitVec 32) Int) ListLongMap!15417)

(assert (=> bm!46441 (= call!46445 (getCurrentListMapNoExtraKeys!4262 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108373 () Bool)

(declare-fun res!739339 () Bool)

(declare-fun e!632515 () Bool)

(assert (=> b!1108373 (=> (not res!739339) (not e!632515))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108373 (= res!739339 (validKeyInArray!0 k0!934))))

(declare-fun b!1108374 () Bool)

(declare-fun res!739333 () Bool)

(assert (=> b!1108374 (=> (not res!739333) (not e!632515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71927 (_ BitVec 32)) Bool)

(assert (=> b!1108374 (= res!739333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108375 () Bool)

(declare-fun e!632520 () Bool)

(declare-fun tp_is_empty!27487 () Bool)

(assert (=> b!1108375 (= e!632520 tp_is_empty!27487)))

(declare-fun mapIsEmpty!43048 () Bool)

(declare-fun mapRes!43048 () Bool)

(assert (=> mapIsEmpty!43048 mapRes!43048))

(declare-fun b!1108376 () Bool)

(declare-fun e!632516 () Bool)

(assert (=> b!1108376 (= e!632514 (not e!632516))))

(declare-fun res!739338 () Bool)

(assert (=> b!1108376 (=> res!739338 e!632516)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108376 (= res!739338 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35147 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108376 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36315 0))(
  ( (Unit!36316) )
))
(declare-fun lt!496074 () Unit!36315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71927 (_ BitVec 64) (_ BitVec 32)) Unit!36315)

(assert (=> b!1108376 (= lt!496074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108377 () Bool)

(declare-fun e!632518 () Bool)

(declare-fun call!46444 () ListLongMap!15417)

(assert (=> b!1108377 (= e!632518 (= call!46444 call!46445))))

(declare-fun mapNonEmpty!43048 () Bool)

(declare-fun tp!81979 () Bool)

(assert (=> mapNonEmpty!43048 (= mapRes!43048 (and tp!81979 e!632520))))

(declare-fun mapKey!43048 () (_ BitVec 32))

(declare-fun mapRest!43048 () (Array (_ BitVec 32) ValueCell!13034))

(declare-fun mapValue!43048 () ValueCell!13034)

(assert (=> mapNonEmpty!43048 (= (arr!34611 _values!996) (store mapRest!43048 mapKey!43048 mapValue!43048))))

(declare-fun b!1108378 () Bool)

(declare-fun res!739340 () Bool)

(assert (=> b!1108378 (=> (not res!739340) (not e!632515))))

(assert (=> b!1108378 (= res!739340 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35147 _keys!1208))))))

(declare-fun b!1108379 () Bool)

(declare-fun e!632519 () Bool)

(assert (=> b!1108379 (= e!632519 tp_is_empty!27487)))

(declare-fun b!1108380 () Bool)

(declare-fun res!739341 () Bool)

(assert (=> b!1108380 (=> (not res!739341) (not e!632515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108380 (= res!739341 (validMask!0 mask!1564))))

(declare-fun b!1108381 () Bool)

(assert (=> b!1108381 (= e!632516 true)))

(assert (=> b!1108381 e!632518))

(declare-fun c!109430 () Bool)

(assert (=> b!1108381 (= c!109430 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496075 () Unit!36315)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 (array!71927 array!71929 (_ BitVec 32) (_ BitVec 32) V!41777 V!41777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36315)

(assert (=> b!1108381 (= lt!496075 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!255 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739336 () Bool)

(assert (=> start!97492 (=> (not res!739336) (not e!632515))))

(assert (=> start!97492 (= res!739336 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35147 _keys!1208))))))

(assert (=> start!97492 e!632515))

(assert (=> start!97492 tp_is_empty!27487))

(declare-fun array_inv!26668 (array!71927) Bool)

(assert (=> start!97492 (array_inv!26668 _keys!1208)))

(assert (=> start!97492 true))

(assert (=> start!97492 tp!81980))

(declare-fun e!632513 () Bool)

(declare-fun array_inv!26669 (array!71929) Bool)

(assert (=> start!97492 (and (array_inv!26669 _values!996) e!632513)))

(declare-fun b!1108382 () Bool)

(assert (=> b!1108382 (= e!632515 e!632514)))

(declare-fun res!739334 () Bool)

(assert (=> b!1108382 (=> (not res!739334) (not e!632514))))

(assert (=> b!1108382 (= res!739334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496073 mask!1564))))

(assert (=> b!1108382 (= lt!496073 (array!71928 (store (arr!34610 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35147 _keys!1208)))))

(declare-fun b!1108383 () Bool)

(declare-fun res!739332 () Bool)

(assert (=> b!1108383 (=> (not res!739332) (not e!632515))))

(assert (=> b!1108383 (= res!739332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24125))))

(declare-fun b!1108384 () Bool)

(declare-fun res!739342 () Bool)

(assert (=> b!1108384 (=> (not res!739342) (not e!632515))))

(assert (=> b!1108384 (= res!739342 (= (select (arr!34610 _keys!1208) i!673) k0!934))))

(declare-fun b!1108385 () Bool)

(declare-fun -!987 (ListLongMap!15417 (_ BitVec 64)) ListLongMap!15417)

(assert (=> b!1108385 (= e!632518 (= call!46444 (-!987 call!46445 k0!934)))))

(declare-fun bm!46442 () Bool)

(declare-fun dynLambda!2380 (Int (_ BitVec 64)) V!41777)

(assert (=> bm!46442 (= call!46444 (getCurrentListMapNoExtraKeys!4262 lt!496073 (array!71930 (store (arr!34611 _values!996) i!673 (ValueCellFull!13034 (dynLambda!2380 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35148 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108386 () Bool)

(declare-fun res!739337 () Bool)

(assert (=> b!1108386 (=> (not res!739337) (not e!632515))))

(assert (=> b!1108386 (= res!739337 (and (= (size!35148 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35147 _keys!1208) (size!35148 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108387 () Bool)

(assert (=> b!1108387 (= e!632513 (and e!632519 mapRes!43048))))

(declare-fun condMapEmpty!43048 () Bool)

(declare-fun mapDefault!43048 () ValueCell!13034)

(assert (=> b!1108387 (= condMapEmpty!43048 (= (arr!34611 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13034)) mapDefault!43048)))))

(assert (= (and start!97492 res!739336) b!1108380))

(assert (= (and b!1108380 res!739341) b!1108386))

(assert (= (and b!1108386 res!739337) b!1108374))

(assert (= (and b!1108374 res!739333) b!1108383))

(assert (= (and b!1108383 res!739332) b!1108378))

(assert (= (and b!1108378 res!739340) b!1108373))

(assert (= (and b!1108373 res!739339) b!1108384))

(assert (= (and b!1108384 res!739342) b!1108382))

(assert (= (and b!1108382 res!739334) b!1108372))

(assert (= (and b!1108372 res!739335) b!1108376))

(assert (= (and b!1108376 (not res!739338)) b!1108381))

(assert (= (and b!1108381 c!109430) b!1108385))

(assert (= (and b!1108381 (not c!109430)) b!1108377))

(assert (= (or b!1108385 b!1108377) bm!46442))

(assert (= (or b!1108385 b!1108377) bm!46441))

(assert (= (and b!1108387 condMapEmpty!43048) mapIsEmpty!43048))

(assert (= (and b!1108387 (not condMapEmpty!43048)) mapNonEmpty!43048))

(get-info :version)

(assert (= (and mapNonEmpty!43048 ((_ is ValueCellFull!13034) mapValue!43048)) b!1108375))

(assert (= (and b!1108387 ((_ is ValueCellFull!13034) mapDefault!43048)) b!1108379))

(assert (= start!97492 b!1108387))

(declare-fun b_lambda!18255 () Bool)

(assert (=> (not b_lambda!18255) (not bm!46442)))

(declare-fun t!34392 () Bool)

(declare-fun tb!8085 () Bool)

(assert (=> (and start!97492 (= defaultEntry!1004 defaultEntry!1004) t!34392) tb!8085))

(declare-fun result!16739 () Bool)

(assert (=> tb!8085 (= result!16739 tp_is_empty!27487)))

(assert (=> bm!46442 t!34392))

(declare-fun b_and!37297 () Bool)

(assert (= b_and!37295 (and (=> t!34392 result!16739) b_and!37297)))

(declare-fun m!1027587 () Bool)

(assert (=> b!1108383 m!1027587))

(declare-fun m!1027589 () Bool)

(assert (=> b!1108373 m!1027589))

(declare-fun m!1027591 () Bool)

(assert (=> b!1108372 m!1027591))

(declare-fun m!1027593 () Bool)

(assert (=> b!1108376 m!1027593))

(declare-fun m!1027595 () Bool)

(assert (=> b!1108376 m!1027595))

(declare-fun m!1027597 () Bool)

(assert (=> b!1108374 m!1027597))

(declare-fun m!1027599 () Bool)

(assert (=> bm!46442 m!1027599))

(declare-fun m!1027601 () Bool)

(assert (=> bm!46442 m!1027601))

(declare-fun m!1027603 () Bool)

(assert (=> bm!46442 m!1027603))

(declare-fun m!1027605 () Bool)

(assert (=> b!1108382 m!1027605))

(declare-fun m!1027607 () Bool)

(assert (=> b!1108382 m!1027607))

(declare-fun m!1027609 () Bool)

(assert (=> b!1108385 m!1027609))

(declare-fun m!1027611 () Bool)

(assert (=> b!1108384 m!1027611))

(declare-fun m!1027613 () Bool)

(assert (=> b!1108380 m!1027613))

(declare-fun m!1027615 () Bool)

(assert (=> b!1108381 m!1027615))

(declare-fun m!1027617 () Bool)

(assert (=> bm!46441 m!1027617))

(declare-fun m!1027619 () Bool)

(assert (=> start!97492 m!1027619))

(declare-fun m!1027621 () Bool)

(assert (=> start!97492 m!1027621))

(declare-fun m!1027623 () Bool)

(assert (=> mapNonEmpty!43048 m!1027623))

(check-sat (not bm!46442) (not b!1108380) (not b!1108372) (not b_lambda!18255) (not b!1108382) (not b!1108383) (not b!1108373) b_and!37297 (not start!97492) (not b!1108376) (not b!1108374) (not b!1108381) (not b!1108385) (not mapNonEmpty!43048) (not bm!46441) (not b_next!23227) tp_is_empty!27487)
(check-sat b_and!37297 (not b_next!23227))
