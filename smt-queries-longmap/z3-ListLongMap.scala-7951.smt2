; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98782 () Bool)

(assert start!98782)

(declare-fun b_free!24151 () Bool)

(declare-fun b_next!24151 () Bool)

(assert (=> start!98782 (= b_free!24151 (not b_next!24151))))

(declare-fun tp!85164 () Bool)

(declare-fun b_and!39153 () Bool)

(assert (=> start!98782 (= tp!85164 b_and!39153)))

(declare-datatypes ((V!43369 0))(
  ( (V!43370 (val!14397 Int)) )
))
(declare-fun zeroValue!944 () V!43369)

(declare-datatypes ((tuple2!18230 0))(
  ( (tuple2!18231 (_1!9126 (_ BitVec 64)) (_2!9126 V!43369)) )
))
(declare-datatypes ((List!24989 0))(
  ( (Nil!24986) (Cons!24985 (h!26203 tuple2!18230) (t!36124 List!24989)) )
))
(declare-datatypes ((ListLongMap!16207 0))(
  ( (ListLongMap!16208 (toList!8119 List!24989)) )
))
(declare-fun call!51423 () ListLongMap!16207)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!74261 0))(
  ( (array!74262 (arr!35775 (Array (_ BitVec 32) (_ BitVec 64))) (size!36312 (_ BitVec 32))) )
))
(declare-fun lt!509438 () array!74261)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13631 0))(
  ( (ValueCellFull!13631 (v!17030 V!43369)) (EmptyCell!13631) )
))
(declare-datatypes ((array!74263 0))(
  ( (array!74264 (arr!35776 (Array (_ BitVec 32) ValueCell!13631)) (size!36313 (_ BitVec 32))) )
))
(declare-fun lt!509432 () array!74263)

(declare-fun minValue!944 () V!43369)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!51416 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4626 (array!74261 array!74263 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 32) Int) ListLongMap!16207)

(assert (=> bm!51416 (= call!51423 (getCurrentListMapNoExtraKeys!4626 lt!509438 lt!509432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1143318 () Bool)

(declare-fun e!650538 () Bool)

(declare-fun lt!509437 () Bool)

(assert (=> b!1143318 (= e!650538 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun _keys!1208 () array!74261)

(declare-fun call!51421 () ListLongMap!16207)

(declare-fun _values!996 () array!74263)

(declare-fun bm!51417 () Bool)

(assert (=> bm!51417 (= call!51421 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!650548 () Bool)

(declare-fun b!1143319 () Bool)

(declare-fun arrayContainsKey!0 (array!74261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143319 (= e!650548 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!650540 () Bool)

(declare-fun b!1143320 () Bool)

(declare-fun -!1250 (ListLongMap!16207 (_ BitVec 64)) ListLongMap!16207)

(assert (=> b!1143320 (= e!650540 (= call!51423 (-!1250 call!51421 k0!934)))))

(declare-fun b!1143321 () Bool)

(assert (=> b!1143321 (= e!650538 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143322 () Bool)

(declare-fun res!761648 () Bool)

(declare-fun e!650544 () Bool)

(assert (=> b!1143322 (=> (not res!761648) (not e!650544))))

(assert (=> b!1143322 (= res!761648 (and (= (size!36313 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36312 _keys!1208) (size!36313 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143323 () Bool)

(declare-fun res!761653 () Bool)

(declare-fun e!650546 () Bool)

(assert (=> b!1143323 (=> (not res!761653) (not e!650546))))

(declare-datatypes ((List!24990 0))(
  ( (Nil!24987) (Cons!24986 (h!26204 (_ BitVec 64)) (t!36125 List!24990)) )
))
(declare-fun arrayNoDuplicates!0 (array!74261 (_ BitVec 32) List!24990) Bool)

(assert (=> b!1143323 (= res!761653 (arrayNoDuplicates!0 lt!509438 #b00000000000000000000000000000000 Nil!24987))))

(declare-fun b!1143317 () Bool)

(declare-fun e!650543 () Bool)

(declare-fun e!650536 () Bool)

(assert (=> b!1143317 (= e!650543 e!650536)))

(declare-fun res!761645 () Bool)

(assert (=> b!1143317 (=> res!761645 e!650536)))

(assert (=> b!1143317 (= res!761645 (not (= (select (arr!35775 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143317 e!650540))

(declare-fun c!112620 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143317 (= c!112620 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!37442 0))(
  ( (Unit!37443) )
))
(declare-fun lt!509436 () Unit!37442)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 (array!74261 array!74263 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37442)

(assert (=> b!1143317 (= lt!509436 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!761649 () Bool)

(assert (=> start!98782 (=> (not res!761649) (not e!650544))))

(assert (=> start!98782 (= res!761649 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36312 _keys!1208))))))

(assert (=> start!98782 e!650544))

(declare-fun tp_is_empty!28681 () Bool)

(assert (=> start!98782 tp_is_empty!28681))

(declare-fun array_inv!27466 (array!74261) Bool)

(assert (=> start!98782 (array_inv!27466 _keys!1208)))

(assert (=> start!98782 true))

(assert (=> start!98782 tp!85164))

(declare-fun e!650549 () Bool)

(declare-fun array_inv!27467 (array!74263) Bool)

(assert (=> start!98782 (and (array_inv!27467 _values!996) e!650549)))

(declare-fun b!1143324 () Bool)

(declare-fun e!650551 () Bool)

(declare-fun mapRes!44846 () Bool)

(assert (=> b!1143324 (= e!650549 (and e!650551 mapRes!44846))))

(declare-fun condMapEmpty!44846 () Bool)

(declare-fun mapDefault!44846 () ValueCell!13631)

(assert (=> b!1143324 (= condMapEmpty!44846 (= (arr!35776 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13631)) mapDefault!44846)))))

(declare-fun b!1143325 () Bool)

(declare-fun e!650541 () Unit!37442)

(declare-fun e!650545 () Unit!37442)

(assert (=> b!1143325 (= e!650541 e!650545)))

(declare-fun c!112615 () Bool)

(assert (=> b!1143325 (= c!112615 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509437))))

(declare-fun b!1143326 () Bool)

(declare-fun e!650542 () Bool)

(assert (=> b!1143326 (= e!650546 (not e!650542))))

(declare-fun res!761654 () Bool)

(assert (=> b!1143326 (=> res!761654 e!650542)))

(assert (=> b!1143326 (= res!761654 (bvsgt from!1455 i!673))))

(assert (=> b!1143326 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509445 () Unit!37442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74261 (_ BitVec 64) (_ BitVec 32)) Unit!37442)

(assert (=> b!1143326 (= lt!509445 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143327 () Bool)

(declare-fun Unit!37444 () Unit!37442)

(assert (=> b!1143327 (= e!650545 Unit!37444)))

(declare-fun lt!509439 () ListLongMap!16207)

(declare-fun c!112617 () Bool)

(declare-fun lt!509449 () ListLongMap!16207)

(declare-fun call!51425 () ListLongMap!16207)

(declare-fun bm!51418 () Bool)

(declare-fun c!112616 () Bool)

(declare-fun +!3566 (ListLongMap!16207 tuple2!18230) ListLongMap!16207)

(assert (=> bm!51418 (= call!51425 (+!3566 (ite c!112617 lt!509439 lt!509449) (ite c!112617 (tuple2!18231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112616 (tuple2!18231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!51424 () Bool)

(declare-fun bm!51419 () Bool)

(declare-fun call!51422 () ListLongMap!16207)

(declare-fun contains!6664 (ListLongMap!16207 (_ BitVec 64)) Bool)

(assert (=> bm!51419 (= call!51424 (contains!6664 (ite c!112617 lt!509439 call!51422) k0!934))))

(declare-fun bm!51420 () Bool)

(assert (=> bm!51420 (= call!51422 call!51425)))

(declare-fun b!1143328 () Bool)

(declare-fun e!650547 () Unit!37442)

(declare-fun Unit!37445 () Unit!37442)

(assert (=> b!1143328 (= e!650547 Unit!37445)))

(declare-fun b!1143329 () Bool)

(declare-fun res!761652 () Bool)

(assert (=> b!1143329 (=> (not res!761652) (not e!650544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74261 (_ BitVec 32)) Bool)

(assert (=> b!1143329 (= res!761652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143330 () Bool)

(declare-fun res!761647 () Bool)

(assert (=> b!1143330 (=> (not res!761647) (not e!650544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143330 (= res!761647 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44846 () Bool)

(assert (=> mapIsEmpty!44846 mapRes!44846))

(declare-fun bm!51421 () Bool)

(declare-fun call!51420 () Unit!37442)

(declare-fun call!51426 () Unit!37442)

(assert (=> bm!51421 (= call!51420 call!51426)))

(declare-fun b!1143331 () Bool)

(declare-fun lt!509451 () Unit!37442)

(assert (=> b!1143331 (= e!650541 lt!509451)))

(assert (=> b!1143331 (= lt!509451 call!51420)))

(declare-fun call!51419 () Bool)

(assert (=> b!1143331 call!51419))

(declare-fun b!1143332 () Bool)

(assert (=> b!1143332 (contains!6664 call!51425 k0!934)))

(declare-fun lt!509448 () Unit!37442)

(assert (=> b!1143332 (= lt!509448 call!51426)))

(assert (=> b!1143332 call!51424))

(assert (=> b!1143332 (= lt!509439 (+!3566 lt!509449 (tuple2!18231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509441 () Unit!37442)

(declare-fun addStillContains!793 (ListLongMap!16207 (_ BitVec 64) V!43369 (_ BitVec 64)) Unit!37442)

(assert (=> b!1143332 (= lt!509441 (addStillContains!793 lt!509449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!650539 () Unit!37442)

(assert (=> b!1143332 (= e!650539 lt!509448)))

(declare-fun b!1143333 () Bool)

(assert (=> b!1143333 call!51419))

(declare-fun lt!509433 () Unit!37442)

(assert (=> b!1143333 (= lt!509433 call!51420)))

(assert (=> b!1143333 (= e!650545 lt!509433)))

(declare-fun b!1143334 () Bool)

(declare-fun res!761643 () Bool)

(assert (=> b!1143334 (=> (not res!761643) (not e!650544))))

(assert (=> b!1143334 (= res!761643 (= (select (arr!35775 _keys!1208) i!673) k0!934))))

(declare-fun b!1143335 () Bool)

(declare-fun Unit!37446 () Unit!37442)

(assert (=> b!1143335 (= e!650547 Unit!37446)))

(assert (=> b!1143335 (= lt!509437 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143335 (= c!112617 (and (not lt!509437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509442 () Unit!37442)

(assert (=> b!1143335 (= lt!509442 e!650539)))

(declare-fun lt!509446 () Unit!37442)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!396 (array!74261 array!74263 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 64) (_ BitVec 32) Int) Unit!37442)

(assert (=> b!1143335 (= lt!509446 (lemmaListMapContainsThenArrayContainsFrom!396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112619 () Bool)

(assert (=> b!1143335 (= c!112619 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761644 () Bool)

(assert (=> b!1143335 (= res!761644 e!650538)))

(assert (=> b!1143335 (=> (not res!761644) (not e!650548))))

(assert (=> b!1143335 e!650548))

(declare-fun lt!509440 () Unit!37442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74261 (_ BitVec 32) (_ BitVec 32)) Unit!37442)

(assert (=> b!1143335 (= lt!509440 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143335 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24987)))

(declare-fun lt!509435 () Unit!37442)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74261 (_ BitVec 64) (_ BitVec 32) List!24990) Unit!37442)

(assert (=> b!1143335 (= lt!509435 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24987))))

(assert (=> b!1143335 false))

(declare-fun bm!51422 () Bool)

(assert (=> bm!51422 (= call!51419 call!51424)))

(declare-fun b!1143336 () Bool)

(assert (=> b!1143336 (= e!650551 tp_is_empty!28681)))

(declare-fun b!1143337 () Bool)

(assert (=> b!1143337 (= e!650540 (= call!51423 call!51421))))

(declare-fun b!1143338 () Bool)

(declare-fun res!761646 () Bool)

(assert (=> b!1143338 (=> (not res!761646) (not e!650544))))

(assert (=> b!1143338 (= res!761646 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24987))))

(declare-fun b!1143339 () Bool)

(assert (=> b!1143339 (= e!650544 e!650546)))

(declare-fun res!761655 () Bool)

(assert (=> b!1143339 (=> (not res!761655) (not e!650546))))

(assert (=> b!1143339 (= res!761655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509438 mask!1564))))

(assert (=> b!1143339 (= lt!509438 (array!74262 (store (arr!35775 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36312 _keys!1208)))))

(declare-fun b!1143340 () Bool)

(declare-fun res!761650 () Bool)

(assert (=> b!1143340 (=> (not res!761650) (not e!650544))))

(assert (=> b!1143340 (= res!761650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36312 _keys!1208))))))

(declare-fun bm!51423 () Bool)

(assert (=> bm!51423 (= call!51426 (addStillContains!793 (ite c!112617 lt!509439 lt!509449) (ite c!112617 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112616 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112617 minValue!944 (ite c!112616 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1143341 () Bool)

(assert (=> b!1143341 (= e!650542 e!650543)))

(declare-fun res!761642 () Bool)

(assert (=> b!1143341 (=> res!761642 e!650543)))

(assert (=> b!1143341 (= res!761642 (not (= from!1455 i!673)))))

(declare-fun lt!509443 () ListLongMap!16207)

(assert (=> b!1143341 (= lt!509443 (getCurrentListMapNoExtraKeys!4626 lt!509438 lt!509432 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509447 () V!43369)

(assert (=> b!1143341 (= lt!509432 (array!74264 (store (arr!35776 _values!996) i!673 (ValueCellFull!13631 lt!509447)) (size!36313 _values!996)))))

(declare-fun dynLambda!2664 (Int (_ BitVec 64)) V!43369)

(assert (=> b!1143341 (= lt!509447 (dynLambda!2664 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509444 () ListLongMap!16207)

(assert (=> b!1143341 (= lt!509444 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143342 () Bool)

(declare-fun e!650537 () Bool)

(assert (=> b!1143342 (= e!650537 tp_is_empty!28681)))

(declare-fun mapNonEmpty!44846 () Bool)

(declare-fun tp!85163 () Bool)

(assert (=> mapNonEmpty!44846 (= mapRes!44846 (and tp!85163 e!650537))))

(declare-fun mapRest!44846 () (Array (_ BitVec 32) ValueCell!13631))

(declare-fun mapValue!44846 () ValueCell!13631)

(declare-fun mapKey!44846 () (_ BitVec 32))

(assert (=> mapNonEmpty!44846 (= (arr!35776 _values!996) (store mapRest!44846 mapKey!44846 mapValue!44846))))

(declare-fun b!1143343 () Bool)

(assert (=> b!1143343 (= c!112616 (and (not lt!509437) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143343 (= e!650539 e!650541)))

(declare-fun b!1143344 () Bool)

(declare-fun res!761651 () Bool)

(assert (=> b!1143344 (=> (not res!761651) (not e!650544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143344 (= res!761651 (validMask!0 mask!1564))))

(declare-fun b!1143345 () Bool)

(assert (=> b!1143345 (= e!650536 true)))

(declare-fun lt!509452 () V!43369)

(assert (=> b!1143345 (= (-!1250 (+!3566 lt!509449 (tuple2!18231 (select (arr!35775 _keys!1208) from!1455) lt!509452)) (select (arr!35775 _keys!1208) from!1455)) lt!509449)))

(declare-fun lt!509450 () Unit!37442)

(declare-fun addThenRemoveForNewKeyIsSame!108 (ListLongMap!16207 (_ BitVec 64) V!43369) Unit!37442)

(assert (=> b!1143345 (= lt!509450 (addThenRemoveForNewKeyIsSame!108 lt!509449 (select (arr!35775 _keys!1208) from!1455) lt!509452))))

(declare-fun get!18203 (ValueCell!13631 V!43369) V!43369)

(assert (=> b!1143345 (= lt!509452 (get!18203 (select (arr!35776 _values!996) from!1455) lt!509447))))

(declare-fun lt!509434 () Unit!37442)

(assert (=> b!1143345 (= lt!509434 e!650547)))

(declare-fun c!112618 () Bool)

(assert (=> b!1143345 (= c!112618 (contains!6664 lt!509449 k0!934))))

(assert (=> b!1143345 (= lt!509449 (getCurrentListMapNoExtraKeys!4626 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98782 res!761649) b!1143344))

(assert (= (and b!1143344 res!761651) b!1143322))

(assert (= (and b!1143322 res!761648) b!1143329))

(assert (= (and b!1143329 res!761652) b!1143338))

(assert (= (and b!1143338 res!761646) b!1143340))

(assert (= (and b!1143340 res!761650) b!1143330))

(assert (= (and b!1143330 res!761647) b!1143334))

(assert (= (and b!1143334 res!761643) b!1143339))

(assert (= (and b!1143339 res!761655) b!1143323))

(assert (= (and b!1143323 res!761653) b!1143326))

(assert (= (and b!1143326 (not res!761654)) b!1143341))

(assert (= (and b!1143341 (not res!761642)) b!1143317))

(assert (= (and b!1143317 c!112620) b!1143320))

(assert (= (and b!1143317 (not c!112620)) b!1143337))

(assert (= (or b!1143320 b!1143337) bm!51416))

(assert (= (or b!1143320 b!1143337) bm!51417))

(assert (= (and b!1143317 (not res!761645)) b!1143345))

(assert (= (and b!1143345 c!112618) b!1143335))

(assert (= (and b!1143345 (not c!112618)) b!1143328))

(assert (= (and b!1143335 c!112617) b!1143332))

(assert (= (and b!1143335 (not c!112617)) b!1143343))

(assert (= (and b!1143343 c!112616) b!1143331))

(assert (= (and b!1143343 (not c!112616)) b!1143325))

(assert (= (and b!1143325 c!112615) b!1143333))

(assert (= (and b!1143325 (not c!112615)) b!1143327))

(assert (= (or b!1143331 b!1143333) bm!51421))

(assert (= (or b!1143331 b!1143333) bm!51420))

(assert (= (or b!1143331 b!1143333) bm!51422))

(assert (= (or b!1143332 bm!51422) bm!51419))

(assert (= (or b!1143332 bm!51421) bm!51423))

(assert (= (or b!1143332 bm!51420) bm!51418))

(assert (= (and b!1143335 c!112619) b!1143321))

(assert (= (and b!1143335 (not c!112619)) b!1143318))

(assert (= (and b!1143335 res!761644) b!1143319))

(assert (= (and b!1143324 condMapEmpty!44846) mapIsEmpty!44846))

(assert (= (and b!1143324 (not condMapEmpty!44846)) mapNonEmpty!44846))

(get-info :version)

(assert (= (and mapNonEmpty!44846 ((_ is ValueCellFull!13631) mapValue!44846)) b!1143342))

(assert (= (and b!1143324 ((_ is ValueCellFull!13631) mapDefault!44846)) b!1143336))

(assert (= start!98782 b!1143324))

(declare-fun b_lambda!19251 () Bool)

(assert (=> (not b_lambda!19251) (not b!1143341)))

(declare-fun t!36123 () Bool)

(declare-fun tb!8955 () Bool)

(assert (=> (and start!98782 (= defaultEntry!1004 defaultEntry!1004) t!36123) tb!8955))

(declare-fun result!18483 () Bool)

(assert (=> tb!8955 (= result!18483 tp_is_empty!28681)))

(assert (=> b!1143341 t!36123))

(declare-fun b_and!39155 () Bool)

(assert (= b_and!39153 (and (=> t!36123 result!18483) b_and!39155)))

(declare-fun m!1054919 () Bool)

(assert (=> b!1143334 m!1054919))

(declare-fun m!1054921 () Bool)

(assert (=> b!1143344 m!1054921))

(declare-fun m!1054923 () Bool)

(assert (=> bm!51417 m!1054923))

(declare-fun m!1054925 () Bool)

(assert (=> b!1143317 m!1054925))

(declare-fun m!1054927 () Bool)

(assert (=> b!1143317 m!1054927))

(declare-fun m!1054929 () Bool)

(assert (=> b!1143323 m!1054929))

(declare-fun m!1054931 () Bool)

(assert (=> mapNonEmpty!44846 m!1054931))

(declare-fun m!1054933 () Bool)

(assert (=> b!1143320 m!1054933))

(declare-fun m!1054935 () Bool)

(assert (=> start!98782 m!1054935))

(declare-fun m!1054937 () Bool)

(assert (=> start!98782 m!1054937))

(declare-fun m!1054939 () Bool)

(assert (=> b!1143332 m!1054939))

(declare-fun m!1054941 () Bool)

(assert (=> b!1143332 m!1054941))

(declare-fun m!1054943 () Bool)

(assert (=> b!1143332 m!1054943))

(assert (=> b!1143345 m!1054923))

(declare-fun m!1054945 () Bool)

(assert (=> b!1143345 m!1054945))

(assert (=> b!1143345 m!1054925))

(declare-fun m!1054947 () Bool)

(assert (=> b!1143345 m!1054947))

(declare-fun m!1054949 () Bool)

(assert (=> b!1143345 m!1054949))

(assert (=> b!1143345 m!1054925))

(declare-fun m!1054951 () Bool)

(assert (=> b!1143345 m!1054951))

(declare-fun m!1054953 () Bool)

(assert (=> b!1143345 m!1054953))

(assert (=> b!1143345 m!1054945))

(declare-fun m!1054955 () Bool)

(assert (=> b!1143345 m!1054955))

(assert (=> b!1143345 m!1054925))

(assert (=> b!1143345 m!1054949))

(declare-fun m!1054957 () Bool)

(assert (=> b!1143330 m!1054957))

(declare-fun m!1054959 () Bool)

(assert (=> bm!51419 m!1054959))

(declare-fun m!1054961 () Bool)

(assert (=> b!1143339 m!1054961))

(declare-fun m!1054963 () Bool)

(assert (=> b!1143339 m!1054963))

(declare-fun m!1054965 () Bool)

(assert (=> b!1143338 m!1054965))

(declare-fun m!1054967 () Bool)

(assert (=> bm!51416 m!1054967))

(declare-fun m!1054969 () Bool)

(assert (=> b!1143319 m!1054969))

(assert (=> b!1143321 m!1054969))

(declare-fun m!1054971 () Bool)

(assert (=> bm!51423 m!1054971))

(declare-fun m!1054973 () Bool)

(assert (=> b!1143335 m!1054973))

(declare-fun m!1054975 () Bool)

(assert (=> b!1143335 m!1054975))

(declare-fun m!1054977 () Bool)

(assert (=> b!1143335 m!1054977))

(declare-fun m!1054979 () Bool)

(assert (=> b!1143335 m!1054979))

(declare-fun m!1054981 () Bool)

(assert (=> bm!51418 m!1054981))

(declare-fun m!1054983 () Bool)

(assert (=> b!1143326 m!1054983))

(declare-fun m!1054985 () Bool)

(assert (=> b!1143326 m!1054985))

(declare-fun m!1054987 () Bool)

(assert (=> b!1143329 m!1054987))

(declare-fun m!1054989 () Bool)

(assert (=> b!1143341 m!1054989))

(declare-fun m!1054991 () Bool)

(assert (=> b!1143341 m!1054991))

(declare-fun m!1054993 () Bool)

(assert (=> b!1143341 m!1054993))

(declare-fun m!1054995 () Bool)

(assert (=> b!1143341 m!1054995))

(check-sat (not b!1143339) tp_is_empty!28681 (not b_lambda!19251) (not start!98782) (not b!1143323) (not b!1143341) (not b!1143345) (not b!1143321) (not b!1143319) (not b!1143335) (not b!1143338) (not b!1143320) (not b!1143326) (not b_next!24151) b_and!39155 (not mapNonEmpty!44846) (not b!1143332) (not bm!51419) (not bm!51417) (not bm!51423) (not b!1143330) (not bm!51416) (not b!1143329) (not bm!51418) (not b!1143344) (not b!1143317))
(check-sat b_and!39155 (not b_next!24151))
