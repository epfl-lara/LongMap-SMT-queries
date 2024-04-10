; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98488 () Bool)

(assert start!98488)

(declare-fun b_free!24093 () Bool)

(declare-fun b_next!24093 () Bool)

(assert (=> start!98488 (= b_free!24093 (not b_next!24093))))

(declare-fun tp!84990 () Bool)

(declare-fun b_and!39035 () Bool)

(assert (=> start!98488 (= tp!84990 b_and!39035)))

(declare-fun b!1139447 () Bool)

(declare-fun e!648325 () Bool)

(declare-fun e!648316 () Bool)

(assert (=> b!1139447 (= e!648325 e!648316)))

(declare-fun res!759923 () Bool)

(assert (=> b!1139447 (=> res!759923 e!648316)))

(declare-datatypes ((array!74105 0))(
  ( (array!74106 (arr!35703 (Array (_ BitVec 32) (_ BitVec 64))) (size!36239 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74105)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139447 (= res!759923 (not (= (select (arr!35703 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648314 () Bool)

(assert (=> b!1139447 e!648314))

(declare-fun c!111698 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139447 (= c!111698 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43291 0))(
  ( (V!43292 (val!14368 Int)) )
))
(declare-fun zeroValue!944 () V!43291)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13602 0))(
  ( (ValueCellFull!13602 (v!17005 V!43291)) (EmptyCell!13602) )
))
(declare-datatypes ((array!74107 0))(
  ( (array!74108 (arr!35704 (Array (_ BitVec 32) ValueCell!13602)) (size!36240 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74107)

(declare-fun minValue!944 () V!43291)

(declare-datatypes ((Unit!37345 0))(
  ( (Unit!37346) )
))
(declare-fun lt!507140 () Unit!37345)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!479 (array!74105 array!74107 (_ BitVec 32) (_ BitVec 32) V!43291 V!43291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37345)

(assert (=> b!1139447 (= lt!507140 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139448 () Bool)

(declare-fun res!759922 () Bool)

(declare-fun e!648320 () Bool)

(assert (=> b!1139448 (=> (not res!759922) (not e!648320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139448 (= res!759922 (validMask!0 mask!1564))))

(declare-fun b!1139449 () Bool)

(declare-fun e!648319 () Bool)

(declare-fun tp_is_empty!28623 () Bool)

(assert (=> b!1139449 (= e!648319 tp_is_empty!28623)))

(declare-fun b!1139450 () Bool)

(declare-fun e!648315 () Unit!37345)

(declare-fun Unit!37347 () Unit!37345)

(assert (=> b!1139450 (= e!648315 Unit!37347)))

(declare-fun b!1139451 () Bool)

(declare-fun e!648327 () Bool)

(declare-fun mapRes!44759 () Bool)

(assert (=> b!1139451 (= e!648327 (and e!648319 mapRes!44759))))

(declare-fun condMapEmpty!44759 () Bool)

(declare-fun mapDefault!44759 () ValueCell!13602)

(assert (=> b!1139451 (= condMapEmpty!44759 (= (arr!35704 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13602)) mapDefault!44759)))))

(declare-fun bm!50655 () Bool)

(declare-datatypes ((tuple2!18162 0))(
  ( (tuple2!18163 (_1!9092 (_ BitVec 64)) (_2!9092 V!43291)) )
))
(declare-datatypes ((List!24918 0))(
  ( (Nil!24915) (Cons!24914 (h!26123 tuple2!18162) (t!36003 List!24918)) )
))
(declare-datatypes ((ListLongMap!16131 0))(
  ( (ListLongMap!16132 (toList!8081 List!24918)) )
))
(declare-fun call!50660 () ListLongMap!16131)

(declare-fun lt!507134 () array!74107)

(declare-fun lt!507133 () array!74105)

(declare-fun getCurrentListMapNoExtraKeys!4564 (array!74105 array!74107 (_ BitVec 32) (_ BitVec 32) V!43291 V!43291 (_ BitVec 32) Int) ListLongMap!16131)

(assert (=> bm!50655 (= call!50660 (getCurrentListMapNoExtraKeys!4564 lt!507133 lt!507134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139452 () Bool)

(declare-fun res!759918 () Bool)

(assert (=> b!1139452 (=> (not res!759918) (not e!648320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139452 (= res!759918 (validKeyInArray!0 k0!934))))

(declare-fun b!1139453 () Bool)

(declare-fun call!50658 () ListLongMap!16131)

(assert (=> b!1139453 (= e!648314 (= call!50660 call!50658))))

(declare-fun mapIsEmpty!44759 () Bool)

(assert (=> mapIsEmpty!44759 mapRes!44759))

(declare-fun b!1139454 () Bool)

(declare-fun lt!507139 () ListLongMap!16131)

(declare-fun contains!6616 (ListLongMap!16131 (_ BitVec 64)) Bool)

(declare-fun +!3513 (ListLongMap!16131 tuple2!18162) ListLongMap!16131)

(assert (=> b!1139454 (contains!6616 (+!3513 lt!507139 (tuple2!18163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!507138 () Unit!37345)

(declare-fun call!50665 () Unit!37345)

(assert (=> b!1139454 (= lt!507138 call!50665)))

(declare-fun call!50663 () Bool)

(assert (=> b!1139454 call!50663))

(declare-fun call!50661 () ListLongMap!16131)

(assert (=> b!1139454 (= lt!507139 call!50661)))

(declare-fun lt!507124 () Unit!37345)

(declare-fun lt!507141 () ListLongMap!16131)

(declare-fun addStillContains!771 (ListLongMap!16131 (_ BitVec 64) V!43291 (_ BitVec 64)) Unit!37345)

(assert (=> b!1139454 (= lt!507124 (addStillContains!771 lt!507141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!648326 () Unit!37345)

(assert (=> b!1139454 (= e!648326 lt!507138)))

(declare-fun b!1139455 () Bool)

(declare-fun -!1232 (ListLongMap!16131 (_ BitVec 64)) ListLongMap!16131)

(assert (=> b!1139455 (= e!648314 (= call!50660 (-!1232 call!50658 k0!934)))))

(declare-fun bm!50656 () Bool)

(declare-fun call!50662 () Unit!37345)

(assert (=> bm!50656 (= call!50662 call!50665)))

(declare-fun b!1139456 () Bool)

(declare-fun e!648312 () Bool)

(assert (=> b!1139456 (= e!648312 e!648325)))

(declare-fun res!759916 () Bool)

(assert (=> b!1139456 (=> res!759916 e!648325)))

(assert (=> b!1139456 (= res!759916 (not (= from!1455 i!673)))))

(declare-fun lt!507132 () ListLongMap!16131)

(assert (=> b!1139456 (= lt!507132 (getCurrentListMapNoExtraKeys!4564 lt!507133 lt!507134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507127 () V!43291)

(assert (=> b!1139456 (= lt!507134 (array!74108 (store (arr!35704 _values!996) i!673 (ValueCellFull!13602 lt!507127)) (size!36240 _values!996)))))

(declare-fun dynLambda!2613 (Int (_ BitVec 64)) V!43291)

(assert (=> b!1139456 (= lt!507127 (dynLambda!2613 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507123 () ListLongMap!16131)

(assert (=> b!1139456 (= lt!507123 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139457 () Bool)

(assert (=> b!1139457 (= e!648316 true)))

(declare-fun lt!507136 () V!43291)

(assert (=> b!1139457 (= (-!1232 (+!3513 lt!507141 (tuple2!18163 (select (arr!35703 _keys!1208) from!1455) lt!507136)) (select (arr!35703 _keys!1208) from!1455)) lt!507141)))

(declare-fun lt!507128 () Unit!37345)

(declare-fun addThenRemoveForNewKeyIsSame!87 (ListLongMap!16131 (_ BitVec 64) V!43291) Unit!37345)

(assert (=> b!1139457 (= lt!507128 (addThenRemoveForNewKeyIsSame!87 lt!507141 (select (arr!35703 _keys!1208) from!1455) lt!507136))))

(declare-fun get!18131 (ValueCell!13602 V!43291) V!43291)

(assert (=> b!1139457 (= lt!507136 (get!18131 (select (arr!35704 _values!996) from!1455) lt!507127))))

(declare-fun lt!507125 () Unit!37345)

(declare-fun e!648318 () Unit!37345)

(assert (=> b!1139457 (= lt!507125 e!648318)))

(declare-fun c!111695 () Bool)

(assert (=> b!1139457 (= c!111695 (contains!6616 lt!507141 k0!934))))

(assert (=> b!1139457 (= lt!507141 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139458 () Bool)

(declare-fun e!648322 () Unit!37345)

(declare-fun lt!507122 () Unit!37345)

(assert (=> b!1139458 (= e!648322 lt!507122)))

(assert (=> b!1139458 (= lt!507122 call!50662)))

(declare-fun call!50664 () Bool)

(assert (=> b!1139458 call!50664))

(declare-fun bm!50657 () Bool)

(declare-fun c!111696 () Bool)

(declare-fun call!50659 () ListLongMap!16131)

(assert (=> bm!50657 (= call!50663 (contains!6616 (ite c!111696 lt!507139 call!50659) k0!934))))

(declare-fun mapNonEmpty!44759 () Bool)

(declare-fun tp!84989 () Bool)

(declare-fun e!648321 () Bool)

(assert (=> mapNonEmpty!44759 (= mapRes!44759 (and tp!84989 e!648321))))

(declare-fun mapRest!44759 () (Array (_ BitVec 32) ValueCell!13602))

(declare-fun mapValue!44759 () ValueCell!13602)

(declare-fun mapKey!44759 () (_ BitVec 32))

(assert (=> mapNonEmpty!44759 (= (arr!35704 _values!996) (store mapRest!44759 mapKey!44759 mapValue!44759))))

(declare-fun b!1139460 () Bool)

(declare-fun c!111700 () Bool)

(declare-fun lt!507126 () Bool)

(assert (=> b!1139460 (= c!111700 (and (not lt!507126) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139460 (= e!648326 e!648322)))

(declare-fun b!1139461 () Bool)

(declare-fun res!759921 () Bool)

(assert (=> b!1139461 (=> (not res!759921) (not e!648320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74105 (_ BitVec 32)) Bool)

(assert (=> b!1139461 (= res!759921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139462 () Bool)

(assert (=> b!1139462 call!50664))

(declare-fun lt!507131 () Unit!37345)

(assert (=> b!1139462 (= lt!507131 call!50662)))

(assert (=> b!1139462 (= e!648315 lt!507131)))

(declare-fun b!1139463 () Bool)

(declare-fun e!648313 () Bool)

(assert (=> b!1139463 (= e!648313 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507126) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139464 () Bool)

(assert (=> b!1139464 (= e!648322 e!648315)))

(declare-fun c!111699 () Bool)

(assert (=> b!1139464 (= c!111699 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507126))))

(declare-fun b!1139465 () Bool)

(declare-fun Unit!37348 () Unit!37345)

(assert (=> b!1139465 (= e!648318 Unit!37348)))

(assert (=> b!1139465 (= lt!507126 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139465 (= c!111696 (and (not lt!507126) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507130 () Unit!37345)

(assert (=> b!1139465 (= lt!507130 e!648326)))

(declare-fun lt!507121 () Unit!37345)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!372 (array!74105 array!74107 (_ BitVec 32) (_ BitVec 32) V!43291 V!43291 (_ BitVec 64) (_ BitVec 32) Int) Unit!37345)

(assert (=> b!1139465 (= lt!507121 (lemmaListMapContainsThenArrayContainsFrom!372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111697 () Bool)

(assert (=> b!1139465 (= c!111697 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759926 () Bool)

(assert (=> b!1139465 (= res!759926 e!648313)))

(declare-fun e!648317 () Bool)

(assert (=> b!1139465 (=> (not res!759926) (not e!648317))))

(assert (=> b!1139465 e!648317))

(declare-fun lt!507135 () Unit!37345)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74105 (_ BitVec 32) (_ BitVec 32)) Unit!37345)

(assert (=> b!1139465 (= lt!507135 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24919 0))(
  ( (Nil!24916) (Cons!24915 (h!26124 (_ BitVec 64)) (t!36004 List!24919)) )
))
(declare-fun arrayNoDuplicates!0 (array!74105 (_ BitVec 32) List!24919) Bool)

(assert (=> b!1139465 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24916)))

(declare-fun lt!507129 () Unit!37345)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74105 (_ BitVec 64) (_ BitVec 32) List!24919) Unit!37345)

(assert (=> b!1139465 (= lt!507129 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24916))))

(assert (=> b!1139465 false))

(declare-fun bm!50658 () Bool)

(assert (=> bm!50658 (= call!50665 (addStillContains!771 (ite c!111696 lt!507139 lt!507141) (ite c!111696 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111700 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111696 minValue!944 (ite c!111700 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!50659 () Bool)

(assert (=> bm!50659 (= call!50658 (getCurrentListMapNoExtraKeys!4564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139466 () Bool)

(declare-fun arrayContainsKey!0 (array!74105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139466 (= e!648317 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50660 () Bool)

(assert (=> bm!50660 (= call!50659 call!50661)))

(declare-fun b!1139467 () Bool)

(declare-fun e!648324 () Bool)

(assert (=> b!1139467 (= e!648320 e!648324)))

(declare-fun res!759924 () Bool)

(assert (=> b!1139467 (=> (not res!759924) (not e!648324))))

(assert (=> b!1139467 (= res!759924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507133 mask!1564))))

(assert (=> b!1139467 (= lt!507133 (array!74106 (store (arr!35703 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36239 _keys!1208)))))

(declare-fun bm!50661 () Bool)

(assert (=> bm!50661 (= call!50664 call!50663)))

(declare-fun b!1139468 () Bool)

(declare-fun res!759929 () Bool)

(assert (=> b!1139468 (=> (not res!759929) (not e!648320))))

(assert (=> b!1139468 (= res!759929 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun b!1139469 () Bool)

(declare-fun res!759920 () Bool)

(assert (=> b!1139469 (=> (not res!759920) (not e!648324))))

(assert (=> b!1139469 (= res!759920 (arrayNoDuplicates!0 lt!507133 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun b!1139470 () Bool)

(assert (=> b!1139470 (= e!648324 (not e!648312))))

(declare-fun res!759919 () Bool)

(assert (=> b!1139470 (=> res!759919 e!648312)))

(assert (=> b!1139470 (= res!759919 (bvsgt from!1455 i!673))))

(assert (=> b!1139470 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507137 () Unit!37345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74105 (_ BitVec 64) (_ BitVec 32)) Unit!37345)

(assert (=> b!1139470 (= lt!507137 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139471 () Bool)

(declare-fun res!759917 () Bool)

(assert (=> b!1139471 (=> (not res!759917) (not e!648320))))

(assert (=> b!1139471 (= res!759917 (= (select (arr!35703 _keys!1208) i!673) k0!934))))

(declare-fun b!1139472 () Bool)

(declare-fun Unit!37349 () Unit!37345)

(assert (=> b!1139472 (= e!648318 Unit!37349)))

(declare-fun bm!50662 () Bool)

(assert (=> bm!50662 (= call!50661 (+!3513 lt!507141 (ite (or c!111696 c!111700) (tuple2!18163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139473 () Bool)

(assert (=> b!1139473 (= e!648321 tp_is_empty!28623)))

(declare-fun res!759925 () Bool)

(assert (=> start!98488 (=> (not res!759925) (not e!648320))))

(assert (=> start!98488 (= res!759925 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36239 _keys!1208))))))

(assert (=> start!98488 e!648320))

(assert (=> start!98488 tp_is_empty!28623))

(declare-fun array_inv!27366 (array!74105) Bool)

(assert (=> start!98488 (array_inv!27366 _keys!1208)))

(assert (=> start!98488 true))

(assert (=> start!98488 tp!84990))

(declare-fun array_inv!27367 (array!74107) Bool)

(assert (=> start!98488 (and (array_inv!27367 _values!996) e!648327)))

(declare-fun b!1139459 () Bool)

(assert (=> b!1139459 (= e!648313 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139474 () Bool)

(declare-fun res!759927 () Bool)

(assert (=> b!1139474 (=> (not res!759927) (not e!648320))))

(assert (=> b!1139474 (= res!759927 (and (= (size!36240 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36239 _keys!1208) (size!36240 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139475 () Bool)

(declare-fun res!759928 () Bool)

(assert (=> b!1139475 (=> (not res!759928) (not e!648320))))

(assert (=> b!1139475 (= res!759928 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36239 _keys!1208))))))

(assert (= (and start!98488 res!759925) b!1139448))

(assert (= (and b!1139448 res!759922) b!1139474))

(assert (= (and b!1139474 res!759927) b!1139461))

(assert (= (and b!1139461 res!759921) b!1139468))

(assert (= (and b!1139468 res!759929) b!1139475))

(assert (= (and b!1139475 res!759928) b!1139452))

(assert (= (and b!1139452 res!759918) b!1139471))

(assert (= (and b!1139471 res!759917) b!1139467))

(assert (= (and b!1139467 res!759924) b!1139469))

(assert (= (and b!1139469 res!759920) b!1139470))

(assert (= (and b!1139470 (not res!759919)) b!1139456))

(assert (= (and b!1139456 (not res!759916)) b!1139447))

(assert (= (and b!1139447 c!111698) b!1139455))

(assert (= (and b!1139447 (not c!111698)) b!1139453))

(assert (= (or b!1139455 b!1139453) bm!50655))

(assert (= (or b!1139455 b!1139453) bm!50659))

(assert (= (and b!1139447 (not res!759923)) b!1139457))

(assert (= (and b!1139457 c!111695) b!1139465))

(assert (= (and b!1139457 (not c!111695)) b!1139472))

(assert (= (and b!1139465 c!111696) b!1139454))

(assert (= (and b!1139465 (not c!111696)) b!1139460))

(assert (= (and b!1139460 c!111700) b!1139458))

(assert (= (and b!1139460 (not c!111700)) b!1139464))

(assert (= (and b!1139464 c!111699) b!1139462))

(assert (= (and b!1139464 (not c!111699)) b!1139450))

(assert (= (or b!1139458 b!1139462) bm!50656))

(assert (= (or b!1139458 b!1139462) bm!50660))

(assert (= (or b!1139458 b!1139462) bm!50661))

(assert (= (or b!1139454 bm!50661) bm!50657))

(assert (= (or b!1139454 bm!50656) bm!50658))

(assert (= (or b!1139454 bm!50660) bm!50662))

(assert (= (and b!1139465 c!111697) b!1139459))

(assert (= (and b!1139465 (not c!111697)) b!1139463))

(assert (= (and b!1139465 res!759926) b!1139466))

(assert (= (and b!1139451 condMapEmpty!44759) mapIsEmpty!44759))

(assert (= (and b!1139451 (not condMapEmpty!44759)) mapNonEmpty!44759))

(get-info :version)

(assert (= (and mapNonEmpty!44759 ((_ is ValueCellFull!13602) mapValue!44759)) b!1139473))

(assert (= (and b!1139451 ((_ is ValueCellFull!13602) mapDefault!44759)) b!1139449))

(assert (= start!98488 b!1139451))

(declare-fun b_lambda!19199 () Bool)

(assert (=> (not b_lambda!19199) (not b!1139456)))

(declare-fun t!36002 () Bool)

(declare-fun tb!8905 () Bool)

(assert (=> (and start!98488 (= defaultEntry!1004 defaultEntry!1004) t!36002) tb!8905))

(declare-fun result!18375 () Bool)

(assert (=> tb!8905 (= result!18375 tp_is_empty!28623)))

(assert (=> b!1139456 t!36002))

(declare-fun b_and!39037 () Bool)

(assert (= b_and!39035 (and (=> t!36002 result!18375) b_and!39037)))

(declare-fun m!1051077 () Bool)

(assert (=> b!1139471 m!1051077))

(declare-fun m!1051079 () Bool)

(assert (=> b!1139465 m!1051079))

(declare-fun m!1051081 () Bool)

(assert (=> b!1139465 m!1051081))

(declare-fun m!1051083 () Bool)

(assert (=> b!1139465 m!1051083))

(declare-fun m!1051085 () Bool)

(assert (=> b!1139465 m!1051085))

(declare-fun m!1051087 () Bool)

(assert (=> bm!50662 m!1051087))

(declare-fun m!1051089 () Bool)

(assert (=> b!1139456 m!1051089))

(declare-fun m!1051091 () Bool)

(assert (=> b!1139456 m!1051091))

(declare-fun m!1051093 () Bool)

(assert (=> b!1139456 m!1051093))

(declare-fun m!1051095 () Bool)

(assert (=> b!1139456 m!1051095))

(declare-fun m!1051097 () Bool)

(assert (=> bm!50658 m!1051097))

(declare-fun m!1051099 () Bool)

(assert (=> b!1139461 m!1051099))

(declare-fun m!1051101 () Bool)

(assert (=> b!1139469 m!1051101))

(declare-fun m!1051103 () Bool)

(assert (=> b!1139468 m!1051103))

(declare-fun m!1051105 () Bool)

(assert (=> b!1139459 m!1051105))

(declare-fun m!1051107 () Bool)

(assert (=> b!1139470 m!1051107))

(declare-fun m!1051109 () Bool)

(assert (=> b!1139470 m!1051109))

(declare-fun m!1051111 () Bool)

(assert (=> bm!50655 m!1051111))

(declare-fun m!1051113 () Bool)

(assert (=> b!1139467 m!1051113))

(declare-fun m!1051115 () Bool)

(assert (=> b!1139467 m!1051115))

(declare-fun m!1051117 () Bool)

(assert (=> b!1139457 m!1051117))

(declare-fun m!1051119 () Bool)

(assert (=> b!1139457 m!1051119))

(assert (=> b!1139457 m!1051119))

(declare-fun m!1051121 () Bool)

(assert (=> b!1139457 m!1051121))

(declare-fun m!1051123 () Bool)

(assert (=> b!1139457 m!1051123))

(declare-fun m!1051125 () Bool)

(assert (=> b!1139457 m!1051125))

(declare-fun m!1051127 () Bool)

(assert (=> b!1139457 m!1051127))

(assert (=> b!1139457 m!1051123))

(declare-fun m!1051129 () Bool)

(assert (=> b!1139457 m!1051129))

(assert (=> b!1139457 m!1051125))

(declare-fun m!1051131 () Bool)

(assert (=> b!1139457 m!1051131))

(assert (=> b!1139457 m!1051125))

(assert (=> b!1139447 m!1051125))

(declare-fun m!1051133 () Bool)

(assert (=> b!1139447 m!1051133))

(assert (=> b!1139466 m!1051105))

(declare-fun m!1051135 () Bool)

(assert (=> b!1139452 m!1051135))

(declare-fun m!1051137 () Bool)

(assert (=> bm!50657 m!1051137))

(declare-fun m!1051139 () Bool)

(assert (=> b!1139455 m!1051139))

(declare-fun m!1051141 () Bool)

(assert (=> start!98488 m!1051141))

(declare-fun m!1051143 () Bool)

(assert (=> start!98488 m!1051143))

(declare-fun m!1051145 () Bool)

(assert (=> b!1139448 m!1051145))

(declare-fun m!1051147 () Bool)

(assert (=> mapNonEmpty!44759 m!1051147))

(declare-fun m!1051149 () Bool)

(assert (=> b!1139454 m!1051149))

(assert (=> b!1139454 m!1051149))

(declare-fun m!1051151 () Bool)

(assert (=> b!1139454 m!1051151))

(declare-fun m!1051153 () Bool)

(assert (=> b!1139454 m!1051153))

(assert (=> bm!50659 m!1051117))

(check-sat (not bm!50655) (not b!1139466) (not b!1139465) (not mapNonEmpty!44759) (not b!1139454) (not b!1139455) (not b!1139459) (not bm!50662) (not b_next!24093) (not bm!50659) (not b!1139469) (not b!1139457) (not b!1139467) (not b_lambda!19199) (not b!1139468) (not start!98488) (not bm!50658) (not b!1139470) (not b!1139456) (not b!1139461) (not b!1139447) b_and!39037 tp_is_empty!28623 (not b!1139448) (not b!1139452) (not bm!50657))
(check-sat b_and!39037 (not b_next!24093))
