; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98206 () Bool)

(assert start!98206)

(declare-fun b_free!23907 () Bool)

(declare-fun b_next!23907 () Bool)

(assert (=> start!98206 (= b_free!23907 (not b_next!23907))))

(declare-fun tp!84424 () Bool)

(declare-fun b_and!38597 () Bool)

(assert (=> start!98206 (= tp!84424 b_and!38597)))

(declare-fun b!1130476 () Bool)

(declare-datatypes ((Unit!37034 0))(
  ( (Unit!37035) )
))
(declare-fun e!643371 () Unit!37034)

(declare-fun e!643365 () Unit!37034)

(assert (=> b!1130476 (= e!643371 e!643365)))

(declare-fun c!110029 () Bool)

(declare-fun lt!502015 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1130476 (= c!110029 (and (not lt!502015) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130477 () Bool)

(declare-fun e!643372 () Unit!37034)

(declare-fun lt!502008 () Unit!37034)

(assert (=> b!1130477 (= e!643372 lt!502008)))

(declare-fun call!48361 () Unit!37034)

(assert (=> b!1130477 (= lt!502008 call!48361)))

(declare-fun call!48362 () Bool)

(assert (=> b!1130477 call!48362))

(declare-fun b!1130478 () Bool)

(declare-fun c!110031 () Bool)

(assert (=> b!1130478 (= c!110031 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502015))))

(assert (=> b!1130478 (= e!643365 e!643372)))

(declare-fun mapIsEmpty!44473 () Bool)

(declare-fun mapRes!44473 () Bool)

(assert (=> mapIsEmpty!44473 mapRes!44473))

(declare-fun res!755336 () Bool)

(declare-fun e!643364 () Bool)

(assert (=> start!98206 (=> (not res!755336) (not e!643364))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73731 0))(
  ( (array!73732 (arr!35518 (Array (_ BitVec 32) (_ BitVec 64))) (size!36054 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73731)

(assert (=> start!98206 (= res!755336 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36054 _keys!1208))))))

(assert (=> start!98206 e!643364))

(declare-fun tp_is_empty!28437 () Bool)

(assert (=> start!98206 tp_is_empty!28437))

(declare-fun array_inv!27248 (array!73731) Bool)

(assert (=> start!98206 (array_inv!27248 _keys!1208)))

(assert (=> start!98206 true))

(assert (=> start!98206 tp!84424))

(declare-datatypes ((V!43043 0))(
  ( (V!43044 (val!14275 Int)) )
))
(declare-datatypes ((ValueCell!13509 0))(
  ( (ValueCellFull!13509 (v!16908 V!43043)) (EmptyCell!13509) )
))
(declare-datatypes ((array!73733 0))(
  ( (array!73734 (arr!35519 (Array (_ BitVec 32) ValueCell!13509)) (size!36055 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73733)

(declare-fun e!643370 () Bool)

(declare-fun array_inv!27249 (array!73733) Bool)

(assert (=> start!98206 (and (array_inv!27249 _values!996) e!643370)))

(declare-fun b!1130479 () Bool)

(declare-fun lt!502016 () Unit!37034)

(assert (=> b!1130479 (= e!643371 lt!502016)))

(declare-fun zeroValue!944 () V!43043)

(declare-fun lt!502011 () Unit!37034)

(declare-datatypes ((tuple2!17984 0))(
  ( (tuple2!17985 (_1!9003 (_ BitVec 64)) (_2!9003 V!43043)) )
))
(declare-datatypes ((List!24748 0))(
  ( (Nil!24745) (Cons!24744 (h!25953 tuple2!17984) (t!35647 List!24748)) )
))
(declare-datatypes ((ListLongMap!15953 0))(
  ( (ListLongMap!15954 (toList!7992 List!24748)) )
))
(declare-fun lt!502019 () ListLongMap!15953)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!704 (ListLongMap!15953 (_ BitVec 64) V!43043 (_ BitVec 64)) Unit!37034)

(assert (=> b!1130479 (= lt!502011 (addStillContains!704 lt!502019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!502012 () ListLongMap!15953)

(declare-fun call!48363 () ListLongMap!15953)

(assert (=> b!1130479 (= lt!502012 call!48363)))

(declare-fun call!48360 () Bool)

(assert (=> b!1130479 call!48360))

(declare-fun call!48358 () Unit!37034)

(assert (=> b!1130479 (= lt!502016 call!48358)))

(declare-fun minValue!944 () V!43043)

(declare-fun contains!6515 (ListLongMap!15953 (_ BitVec 64)) Bool)

(declare-fun +!3442 (ListLongMap!15953 tuple2!17984) ListLongMap!15953)

(assert (=> b!1130479 (contains!6515 (+!3442 lt!502012 (tuple2!17985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!48354 () Bool)

(assert (=> bm!48354 (= call!48362 call!48360)))

(declare-fun b!1130480 () Bool)

(declare-fun e!643376 () Bool)

(declare-fun e!643373 () Bool)

(assert (=> b!1130480 (= e!643376 e!643373)))

(declare-fun res!755335 () Bool)

(assert (=> b!1130480 (=> res!755335 e!643373)))

(assert (=> b!1130480 (= res!755335 (not (contains!6515 lt!502019 k0!934)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4479 (array!73731 array!73733 (_ BitVec 32) (_ BitVec 32) V!43043 V!43043 (_ BitVec 32) Int) ListLongMap!15953)

(assert (=> b!1130480 (= lt!502019 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110028 () Bool)

(declare-fun bm!48355 () Bool)

(assert (=> bm!48355 (= call!48363 (+!3442 lt!502019 (ite (or c!110028 c!110029) (tuple2!17985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!48356 () Bool)

(assert (=> bm!48356 (= call!48358 (addStillContains!704 (ite c!110028 lt!502012 lt!502019) (ite c!110028 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110029 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110028 minValue!944 (ite c!110029 zeroValue!944 minValue!944)) k0!934))))

(declare-fun call!48357 () ListLongMap!15953)

(declare-fun e!643363 () Bool)

(declare-fun b!1130481 () Bool)

(declare-fun call!48364 () ListLongMap!15953)

(declare-fun -!1171 (ListLongMap!15953 (_ BitVec 64)) ListLongMap!15953)

(assert (=> b!1130481 (= e!643363 (= call!48364 (-!1171 call!48357 k0!934)))))

(declare-fun b!1130482 () Bool)

(declare-fun res!755337 () Bool)

(assert (=> b!1130482 (=> (not res!755337) (not e!643364))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130482 (= res!755337 (= (select (arr!35518 _keys!1208) i!673) k0!934))))

(declare-fun lt!502021 () array!73731)

(declare-fun bm!48357 () Bool)

(declare-fun lt!502017 () array!73733)

(assert (=> bm!48357 (= call!48364 (getCurrentListMapNoExtraKeys!4479 lt!502021 lt!502017 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48358 () Bool)

(assert (=> bm!48358 (= call!48361 call!48358)))

(declare-fun b!1130483 () Bool)

(declare-fun res!755334 () Bool)

(declare-fun e!643377 () Bool)

(assert (=> b!1130483 (=> (not res!755334) (not e!643377))))

(declare-datatypes ((List!24749 0))(
  ( (Nil!24746) (Cons!24745 (h!25954 (_ BitVec 64)) (t!35648 List!24749)) )
))
(declare-fun arrayNoDuplicates!0 (array!73731 (_ BitVec 32) List!24749) Bool)

(assert (=> b!1130483 (= res!755334 (arrayNoDuplicates!0 lt!502021 #b00000000000000000000000000000000 Nil!24746))))

(declare-fun b!1130484 () Bool)

(declare-fun Unit!37036 () Unit!37034)

(assert (=> b!1130484 (= e!643372 Unit!37036)))

(declare-fun b!1130485 () Bool)

(declare-fun e!643368 () Bool)

(assert (=> b!1130485 (= e!643377 (not e!643368))))

(declare-fun res!755333 () Bool)

(assert (=> b!1130485 (=> res!755333 e!643368)))

(assert (=> b!1130485 (= res!755333 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130485 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502022 () Unit!37034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73731 (_ BitVec 64) (_ BitVec 32)) Unit!37034)

(assert (=> b!1130485 (= lt!502022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130486 () Bool)

(assert (=> b!1130486 (= e!643364 e!643377)))

(declare-fun res!755329 () Bool)

(assert (=> b!1130486 (=> (not res!755329) (not e!643377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73731 (_ BitVec 32)) Bool)

(assert (=> b!1130486 (= res!755329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502021 mask!1564))))

(assert (=> b!1130486 (= lt!502021 (array!73732 (store (arr!35518 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36054 _keys!1208)))))

(declare-fun b!1130487 () Bool)

(declare-fun res!755338 () Bool)

(assert (=> b!1130487 (=> (not res!755338) (not e!643364))))

(assert (=> b!1130487 (= res!755338 (and (= (size!36055 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36054 _keys!1208) (size!36055 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44473 () Bool)

(declare-fun tp!84425 () Bool)

(declare-fun e!643366 () Bool)

(assert (=> mapNonEmpty!44473 (= mapRes!44473 (and tp!84425 e!643366))))

(declare-fun mapRest!44473 () (Array (_ BitVec 32) ValueCell!13509))

(declare-fun mapKey!44473 () (_ BitVec 32))

(declare-fun mapValue!44473 () ValueCell!13509)

(assert (=> mapNonEmpty!44473 (= (arr!35519 _values!996) (store mapRest!44473 mapKey!44473 mapValue!44473))))

(declare-fun b!1130488 () Bool)

(declare-fun res!755330 () Bool)

(assert (=> b!1130488 (=> (not res!755330) (not e!643364))))

(assert (=> b!1130488 (= res!755330 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24746))))

(declare-fun b!1130489 () Bool)

(declare-fun e!643374 () Bool)

(assert (=> b!1130489 (= e!643370 (and e!643374 mapRes!44473))))

(declare-fun condMapEmpty!44473 () Bool)

(declare-fun mapDefault!44473 () ValueCell!13509)

(assert (=> b!1130489 (= condMapEmpty!44473 (= (arr!35519 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13509)) mapDefault!44473)))))

(declare-fun b!1130490 () Bool)

(declare-fun res!755324 () Bool)

(assert (=> b!1130490 (=> (not res!755324) (not e!643364))))

(assert (=> b!1130490 (= res!755324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!48359 () Bool)

(declare-fun call!48359 () ListLongMap!15953)

(assert (=> bm!48359 (= call!48359 call!48363)))

(declare-fun bm!48360 () Bool)

(assert (=> bm!48360 (= call!48360 (contains!6515 (ite c!110028 lt!502012 call!48359) k0!934))))

(declare-fun b!1130491 () Bool)

(declare-fun res!755331 () Bool)

(assert (=> b!1130491 (=> (not res!755331) (not e!643364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130491 (= res!755331 (validKeyInArray!0 k0!934))))

(declare-fun bm!48361 () Bool)

(assert (=> bm!48361 (= call!48357 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130492 () Bool)

(assert (=> b!1130492 (= e!643366 tp_is_empty!28437)))

(declare-fun b!1130493 () Bool)

(declare-fun e!643375 () Bool)

(assert (=> b!1130493 (= e!643373 e!643375)))

(declare-fun res!755327 () Bool)

(assert (=> b!1130493 (=> res!755327 e!643375)))

(assert (=> b!1130493 (= res!755327 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36054 _keys!1208))))))

(declare-fun lt!502009 () Unit!37034)

(assert (=> b!1130493 (= lt!502009 e!643371)))

(assert (=> b!1130493 (= c!110028 (and (not lt!502015) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130493 (= lt!502015 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130494 () Bool)

(declare-fun e!643369 () Bool)

(assert (=> b!1130494 (= e!643368 e!643369)))

(declare-fun res!755325 () Bool)

(assert (=> b!1130494 (=> res!755325 e!643369)))

(assert (=> b!1130494 (= res!755325 (not (= from!1455 i!673)))))

(declare-fun lt!502020 () ListLongMap!15953)

(assert (=> b!1130494 (= lt!502020 (getCurrentListMapNoExtraKeys!4479 lt!502021 lt!502017 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2555 (Int (_ BitVec 64)) V!43043)

(assert (=> b!1130494 (= lt!502017 (array!73734 (store (arr!35519 _values!996) i!673 (ValueCellFull!13509 (dynLambda!2555 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36055 _values!996)))))

(declare-fun lt!502010 () ListLongMap!15953)

(assert (=> b!1130494 (= lt!502010 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130495 () Bool)

(assert (=> b!1130495 (= e!643363 (= call!48364 call!48357))))

(declare-fun b!1130496 () Bool)

(declare-fun res!755326 () Bool)

(assert (=> b!1130496 (=> (not res!755326) (not e!643364))))

(assert (=> b!1130496 (= res!755326 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36054 _keys!1208))))))

(declare-fun b!1130497 () Bool)

(assert (=> b!1130497 (= e!643374 tp_is_empty!28437)))

(declare-fun b!1130498 () Bool)

(declare-fun res!755332 () Bool)

(assert (=> b!1130498 (=> (not res!755332) (not e!643364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130498 (= res!755332 (validMask!0 mask!1564))))

(declare-fun b!1130499 () Bool)

(assert (=> b!1130499 (= e!643375 true)))

(declare-fun lt!502014 () Bool)

(declare-fun getCurrentListMap!4425 (array!73731 array!73733 (_ BitVec 32) (_ BitVec 32) V!43043 V!43043 (_ BitVec 32) Int) ListLongMap!15953)

(assert (=> b!1130499 (= lt!502014 (contains!6515 (getCurrentListMap!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130500 () Bool)

(assert (=> b!1130500 (= e!643369 e!643376)))

(declare-fun res!755328 () Bool)

(assert (=> b!1130500 (=> res!755328 e!643376)))

(assert (=> b!1130500 (= res!755328 (not (= (select (arr!35518 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130500 e!643363))

(declare-fun c!110030 () Bool)

(assert (=> b!1130500 (= c!110030 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502013 () Unit!37034)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!424 (array!73731 array!73733 (_ BitVec 32) (_ BitVec 32) V!43043 V!43043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37034)

(assert (=> b!1130500 (= lt!502013 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130501 () Bool)

(assert (=> b!1130501 call!48362))

(declare-fun lt!502018 () Unit!37034)

(assert (=> b!1130501 (= lt!502018 call!48361)))

(assert (=> b!1130501 (= e!643365 lt!502018)))

(assert (= (and start!98206 res!755336) b!1130498))

(assert (= (and b!1130498 res!755332) b!1130487))

(assert (= (and b!1130487 res!755338) b!1130490))

(assert (= (and b!1130490 res!755324) b!1130488))

(assert (= (and b!1130488 res!755330) b!1130496))

(assert (= (and b!1130496 res!755326) b!1130491))

(assert (= (and b!1130491 res!755331) b!1130482))

(assert (= (and b!1130482 res!755337) b!1130486))

(assert (= (and b!1130486 res!755329) b!1130483))

(assert (= (and b!1130483 res!755334) b!1130485))

(assert (= (and b!1130485 (not res!755333)) b!1130494))

(assert (= (and b!1130494 (not res!755325)) b!1130500))

(assert (= (and b!1130500 c!110030) b!1130481))

(assert (= (and b!1130500 (not c!110030)) b!1130495))

(assert (= (or b!1130481 b!1130495) bm!48357))

(assert (= (or b!1130481 b!1130495) bm!48361))

(assert (= (and b!1130500 (not res!755328)) b!1130480))

(assert (= (and b!1130480 (not res!755335)) b!1130493))

(assert (= (and b!1130493 c!110028) b!1130479))

(assert (= (and b!1130493 (not c!110028)) b!1130476))

(assert (= (and b!1130476 c!110029) b!1130501))

(assert (= (and b!1130476 (not c!110029)) b!1130478))

(assert (= (and b!1130478 c!110031) b!1130477))

(assert (= (and b!1130478 (not c!110031)) b!1130484))

(assert (= (or b!1130501 b!1130477) bm!48358))

(assert (= (or b!1130501 b!1130477) bm!48359))

(assert (= (or b!1130501 b!1130477) bm!48354))

(assert (= (or b!1130479 bm!48354) bm!48360))

(assert (= (or b!1130479 bm!48358) bm!48356))

(assert (= (or b!1130479 bm!48359) bm!48355))

(assert (= (and b!1130493 (not res!755327)) b!1130499))

(assert (= (and b!1130489 condMapEmpty!44473) mapIsEmpty!44473))

(assert (= (and b!1130489 (not condMapEmpty!44473)) mapNonEmpty!44473))

(get-info :version)

(assert (= (and mapNonEmpty!44473 ((_ is ValueCellFull!13509) mapValue!44473)) b!1130492))

(assert (= (and b!1130489 ((_ is ValueCellFull!13509) mapDefault!44473)) b!1130497))

(assert (= start!98206 b!1130489))

(declare-fun b_lambda!18877 () Bool)

(assert (=> (not b_lambda!18877) (not b!1130494)))

(declare-fun t!35646 () Bool)

(declare-fun tb!8719 () Bool)

(assert (=> (and start!98206 (= defaultEntry!1004 defaultEntry!1004) t!35646) tb!8719))

(declare-fun result!17999 () Bool)

(assert (=> tb!8719 (= result!17999 tp_is_empty!28437)))

(assert (=> b!1130494 t!35646))

(declare-fun b_and!38599 () Bool)

(assert (= b_and!38597 (and (=> t!35646 result!17999) b_and!38599)))

(declare-fun m!1043623 () Bool)

(assert (=> b!1130490 m!1043623))

(declare-fun m!1043625 () Bool)

(assert (=> b!1130480 m!1043625))

(declare-fun m!1043627 () Bool)

(assert (=> b!1130480 m!1043627))

(declare-fun m!1043629 () Bool)

(assert (=> b!1130482 m!1043629))

(declare-fun m!1043631 () Bool)

(assert (=> b!1130483 m!1043631))

(declare-fun m!1043633 () Bool)

(assert (=> b!1130479 m!1043633))

(declare-fun m!1043635 () Bool)

(assert (=> b!1130479 m!1043635))

(assert (=> b!1130479 m!1043635))

(declare-fun m!1043637 () Bool)

(assert (=> b!1130479 m!1043637))

(declare-fun m!1043639 () Bool)

(assert (=> b!1130491 m!1043639))

(declare-fun m!1043641 () Bool)

(assert (=> bm!48357 m!1043641))

(declare-fun m!1043643 () Bool)

(assert (=> b!1130500 m!1043643))

(declare-fun m!1043645 () Bool)

(assert (=> b!1130500 m!1043645))

(declare-fun m!1043647 () Bool)

(assert (=> b!1130488 m!1043647))

(declare-fun m!1043649 () Bool)

(assert (=> b!1130498 m!1043649))

(declare-fun m!1043651 () Bool)

(assert (=> bm!48356 m!1043651))

(declare-fun m!1043653 () Bool)

(assert (=> bm!48360 m!1043653))

(declare-fun m!1043655 () Bool)

(assert (=> b!1130481 m!1043655))

(declare-fun m!1043657 () Bool)

(assert (=> start!98206 m!1043657))

(declare-fun m!1043659 () Bool)

(assert (=> start!98206 m!1043659))

(declare-fun m!1043661 () Bool)

(assert (=> b!1130494 m!1043661))

(declare-fun m!1043663 () Bool)

(assert (=> b!1130494 m!1043663))

(declare-fun m!1043665 () Bool)

(assert (=> b!1130494 m!1043665))

(declare-fun m!1043667 () Bool)

(assert (=> b!1130494 m!1043667))

(declare-fun m!1043669 () Bool)

(assert (=> b!1130486 m!1043669))

(declare-fun m!1043671 () Bool)

(assert (=> b!1130486 m!1043671))

(declare-fun m!1043673 () Bool)

(assert (=> mapNonEmpty!44473 m!1043673))

(declare-fun m!1043675 () Bool)

(assert (=> bm!48355 m!1043675))

(declare-fun m!1043677 () Bool)

(assert (=> b!1130499 m!1043677))

(assert (=> b!1130499 m!1043677))

(declare-fun m!1043679 () Bool)

(assert (=> b!1130499 m!1043679))

(assert (=> bm!48361 m!1043627))

(declare-fun m!1043681 () Bool)

(assert (=> b!1130485 m!1043681))

(declare-fun m!1043683 () Bool)

(assert (=> b!1130485 m!1043683))

(check-sat (not b!1130488) (not b!1130483) (not b!1130494) (not b_lambda!18877) (not start!98206) (not b!1130499) (not bm!48360) (not b_next!23907) (not mapNonEmpty!44473) (not b!1130480) (not b!1130498) (not bm!48357) (not b!1130486) (not b!1130500) (not bm!48355) (not b!1130491) (not bm!48361) (not b!1130479) (not b!1130490) (not bm!48356) tp_is_empty!28437 (not b!1130481) (not b!1130485) b_and!38599)
(check-sat b_and!38599 (not b_next!23907))
