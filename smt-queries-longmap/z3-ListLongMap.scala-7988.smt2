; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99004 () Bool)

(assert start!99004)

(declare-fun b_free!24373 () Bool)

(declare-fun b_next!24373 () Bool)

(assert (=> start!99004 (= b_free!24373 (not b_next!24373))))

(declare-fun tp!85829 () Bool)

(declare-fun b_and!39597 () Bool)

(assert (=> start!99004 (= tp!85829 b_and!39597)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!656131 () Bool)

(declare-fun lt!516546 () Bool)

(declare-fun b!1153459 () Bool)

(assert (=> b!1153459 (= e!656131 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((array!74699 0))(
  ( (array!74700 (arr!35994 (Array (_ BitVec 32) (_ BitVec 64))) (size!36531 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74699)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1153460 () Bool)

(declare-fun arrayContainsKey!0 (array!74699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153460 (= e!656131 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153461 () Bool)

(declare-fun e!656133 () Bool)

(declare-fun e!656139 () Bool)

(assert (=> b!1153461 (= e!656133 e!656139)))

(declare-fun res!766579 () Bool)

(assert (=> b!1153461 (=> res!766579 e!656139)))

(assert (=> b!1153461 (= res!766579 (not (= (select (arr!35994 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656142 () Bool)

(assert (=> b!1153461 e!656142))

(declare-fun c!114613 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153461 (= c!114613 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43665 0))(
  ( (V!43666 (val!14508 Int)) )
))
(declare-fun zeroValue!944 () V!43665)

(declare-datatypes ((Unit!37891 0))(
  ( (Unit!37892) )
))
(declare-fun lt!516539 () Unit!37891)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13742 0))(
  ( (ValueCellFull!13742 (v!17141 V!43665)) (EmptyCell!13742) )
))
(declare-datatypes ((array!74701 0))(
  ( (array!74702 (arr!35995 (Array (_ BitVec 32) ValueCell!13742)) (size!36532 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74701)

(declare-fun minValue!944 () V!43665)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 (array!74699 array!74701 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1153461 (= lt!516539 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153462 () Bool)

(declare-fun e!656140 () Bool)

(declare-fun e!656130 () Bool)

(assert (=> b!1153462 (= e!656140 e!656130)))

(declare-fun res!766574 () Bool)

(assert (=> b!1153462 (=> (not res!766574) (not e!656130))))

(declare-fun lt!516527 () array!74699)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74699 (_ BitVec 32)) Bool)

(assert (=> b!1153462 (= res!766574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516527 mask!1564))))

(assert (=> b!1153462 (= lt!516527 (array!74700 (store (arr!35994 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36531 _keys!1208)))))

(declare-fun b!1153463 () Bool)

(declare-fun res!766577 () Bool)

(assert (=> b!1153463 (=> (not res!766577) (not e!656130))))

(declare-datatypes ((List!25193 0))(
  ( (Nil!25190) (Cons!25189 (h!26407 (_ BitVec 64)) (t!36550 List!25193)) )
))
(declare-fun arrayNoDuplicates!0 (array!74699 (_ BitVec 32) List!25193) Bool)

(assert (=> b!1153463 (= res!766577 (arrayNoDuplicates!0 lt!516527 #b00000000000000000000000000000000 Nil!25190))))

(declare-fun b!1153464 () Bool)

(declare-fun e!656129 () Unit!37891)

(declare-fun Unit!37893 () Unit!37891)

(assert (=> b!1153464 (= e!656129 Unit!37893)))

(assert (=> b!1153464 (= lt!516546 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114618 () Bool)

(assert (=> b!1153464 (= c!114618 (and (not lt!516546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516533 () Unit!37891)

(declare-fun e!656134 () Unit!37891)

(assert (=> b!1153464 (= lt!516533 e!656134)))

(declare-fun lt!516535 () Unit!37891)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!478 (array!74699 array!74701 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1153464 (= lt!516535 (lemmaListMapContainsThenArrayContainsFrom!478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114615 () Bool)

(assert (=> b!1153464 (= c!114615 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766573 () Bool)

(assert (=> b!1153464 (= res!766573 e!656131)))

(declare-fun e!656128 () Bool)

(assert (=> b!1153464 (=> (not res!766573) (not e!656128))))

(assert (=> b!1153464 e!656128))

(declare-fun lt!516547 () Unit!37891)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74699 (_ BitVec 32) (_ BitVec 32)) Unit!37891)

(assert (=> b!1153464 (= lt!516547 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153464 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25190)))

(declare-fun lt!516545 () Unit!37891)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74699 (_ BitVec 64) (_ BitVec 32) List!25193) Unit!37891)

(assert (=> b!1153464 (= lt!516545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25190))))

(assert (=> b!1153464 false))

(declare-fun b!1153465 () Bool)

(declare-fun e!656136 () Bool)

(declare-fun tp_is_empty!28903 () Bool)

(assert (=> b!1153465 (= e!656136 tp_is_empty!28903)))

(declare-fun bm!54080 () Bool)

(declare-fun call!54087 () Unit!37891)

(declare-fun call!54088 () Unit!37891)

(assert (=> bm!54080 (= call!54087 call!54088)))

(declare-fun bm!54081 () Bool)

(declare-fun call!54090 () Bool)

(declare-fun call!54086 () Bool)

(assert (=> bm!54081 (= call!54090 call!54086)))

(declare-fun b!1153466 () Bool)

(assert (=> b!1153466 (= e!656128 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153467 () Bool)

(declare-fun res!766572 () Bool)

(assert (=> b!1153467 (=> (not res!766572) (not e!656140))))

(assert (=> b!1153467 (= res!766572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153468 () Bool)

(declare-datatypes ((tuple2!18442 0))(
  ( (tuple2!18443 (_1!9232 (_ BitVec 64)) (_2!9232 V!43665)) )
))
(declare-datatypes ((List!25194 0))(
  ( (Nil!25191) (Cons!25190 (h!26408 tuple2!18442) (t!36551 List!25194)) )
))
(declare-datatypes ((ListLongMap!16419 0))(
  ( (ListLongMap!16420 (toList!8225 List!25194)) )
))
(declare-fun call!54083 () ListLongMap!16419)

(declare-fun call!54085 () ListLongMap!16419)

(assert (=> b!1153468 (= e!656142 (= call!54083 call!54085))))

(declare-fun bm!54082 () Bool)

(declare-fun call!54084 () ListLongMap!16419)

(declare-fun call!54089 () ListLongMap!16419)

(assert (=> bm!54082 (= call!54084 call!54089)))

(declare-fun b!1153469 () Bool)

(declare-fun lt!516541 () ListLongMap!16419)

(declare-fun contains!6757 (ListLongMap!16419 (_ BitVec 64)) Bool)

(declare-fun +!3658 (ListLongMap!16419 tuple2!18442) ListLongMap!16419)

(assert (=> b!1153469 (contains!6757 (+!3658 lt!516541 (tuple2!18443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516528 () Unit!37891)

(assert (=> b!1153469 (= lt!516528 call!54088)))

(assert (=> b!1153469 call!54086))

(assert (=> b!1153469 (= lt!516541 call!54089)))

(declare-fun lt!516538 () Unit!37891)

(declare-fun lt!516530 () ListLongMap!16419)

(declare-fun addStillContains!882 (ListLongMap!16419 (_ BitVec 64) V!43665 (_ BitVec 64)) Unit!37891)

(assert (=> b!1153469 (= lt!516538 (addStillContains!882 lt!516530 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1153469 (= e!656134 lt!516528)))

(declare-fun res!766567 () Bool)

(assert (=> start!99004 (=> (not res!766567) (not e!656140))))

(assert (=> start!99004 (= res!766567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36531 _keys!1208))))))

(assert (=> start!99004 e!656140))

(assert (=> start!99004 tp_is_empty!28903))

(declare-fun array_inv!27618 (array!74699) Bool)

(assert (=> start!99004 (array_inv!27618 _keys!1208)))

(assert (=> start!99004 true))

(assert (=> start!99004 tp!85829))

(declare-fun e!656135 () Bool)

(declare-fun array_inv!27619 (array!74701) Bool)

(assert (=> start!99004 (and (array_inv!27619 _values!996) e!656135)))

(declare-fun b!1153470 () Bool)

(assert (=> b!1153470 call!54090))

(declare-fun lt!516536 () Unit!37891)

(assert (=> b!1153470 (= lt!516536 call!54087)))

(declare-fun e!656143 () Unit!37891)

(assert (=> b!1153470 (= e!656143 lt!516536)))

(declare-fun b!1153471 () Bool)

(declare-fun e!656132 () Bool)

(assert (=> b!1153471 (= e!656132 tp_is_empty!28903)))

(declare-fun bm!54083 () Bool)

(assert (=> bm!54083 (= call!54086 (contains!6757 (ite c!114618 lt!516541 call!54084) k0!934))))

(declare-fun b!1153472 () Bool)

(declare-fun res!766576 () Bool)

(assert (=> b!1153472 (=> (not res!766576) (not e!656140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153472 (= res!766576 (validKeyInArray!0 k0!934))))

(declare-fun b!1153473 () Bool)

(declare-fun -!1343 (ListLongMap!16419 (_ BitVec 64)) ListLongMap!16419)

(assert (=> b!1153473 (= e!656142 (= call!54083 (-!1343 call!54085 k0!934)))))

(declare-fun b!1153474 () Bool)

(declare-fun e!656138 () Unit!37891)

(assert (=> b!1153474 (= e!656138 e!656143)))

(declare-fun c!114616 () Bool)

(assert (=> b!1153474 (= c!114616 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516546))))

(declare-fun mapNonEmpty!45179 () Bool)

(declare-fun mapRes!45179 () Bool)

(declare-fun tp!85830 () Bool)

(assert (=> mapNonEmpty!45179 (= mapRes!45179 (and tp!85830 e!656132))))

(declare-fun mapValue!45179 () ValueCell!13742)

(declare-fun mapKey!45179 () (_ BitVec 32))

(declare-fun mapRest!45179 () (Array (_ BitVec 32) ValueCell!13742))

(assert (=> mapNonEmpty!45179 (= (arr!35995 _values!996) (store mapRest!45179 mapKey!45179 mapValue!45179))))

(declare-fun b!1153475 () Bool)

(declare-fun Unit!37894 () Unit!37891)

(assert (=> b!1153475 (= e!656143 Unit!37894)))

(declare-fun b!1153476 () Bool)

(declare-fun e!656137 () Bool)

(assert (=> b!1153476 (= e!656130 (not e!656137))))

(declare-fun res!766568 () Bool)

(assert (=> b!1153476 (=> res!766568 e!656137)))

(assert (=> b!1153476 (= res!766568 (bvsgt from!1455 i!673))))

(assert (=> b!1153476 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516542 () Unit!37891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74699 (_ BitVec 64) (_ BitVec 32)) Unit!37891)

(assert (=> b!1153476 (= lt!516542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!656141 () Bool)

(declare-fun lt!516529 () ListLongMap!16419)

(declare-fun lt!516537 () array!74701)

(declare-fun b!1153477 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4724 (array!74699 array!74701 (_ BitVec 32) (_ BitVec 32) V!43665 V!43665 (_ BitVec 32) Int) ListLongMap!16419)

(assert (=> b!1153477 (= e!656141 (= lt!516529 (getCurrentListMapNoExtraKeys!4724 lt!516527 lt!516537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54084 () Bool)

(assert (=> bm!54084 (= call!54083 (getCurrentListMapNoExtraKeys!4724 lt!516527 lt!516537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153478 () Bool)

(declare-fun res!766580 () Bool)

(assert (=> b!1153478 (=> (not res!766580) (not e!656140))))

(assert (=> b!1153478 (= res!766580 (= (select (arr!35994 _keys!1208) i!673) k0!934))))

(declare-fun c!114614 () Bool)

(declare-fun bm!54085 () Bool)

(assert (=> bm!54085 (= call!54088 (addStillContains!882 (ite c!114618 lt!516541 lt!516530) (ite c!114618 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114614 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114618 minValue!944 (ite c!114614 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!54086 () Bool)

(assert (=> bm!54086 (= call!54085 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153479 () Bool)

(declare-fun res!766578 () Bool)

(assert (=> b!1153479 (=> (not res!766578) (not e!656140))))

(assert (=> b!1153479 (= res!766578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36531 _keys!1208))))))

(declare-fun b!1153480 () Bool)

(declare-fun Unit!37895 () Unit!37891)

(assert (=> b!1153480 (= e!656129 Unit!37895)))

(declare-fun b!1153481 () Bool)

(assert (=> b!1153481 (= c!114614 (and (not lt!516546) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153481 (= e!656134 e!656138)))

(declare-fun b!1153482 () Bool)

(declare-fun res!766581 () Bool)

(assert (=> b!1153482 (=> (not res!766581) (not e!656140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153482 (= res!766581 (validMask!0 mask!1564))))

(declare-fun b!1153483 () Bool)

(assert (=> b!1153483 (= e!656137 e!656133)))

(declare-fun res!766569 () Bool)

(assert (=> b!1153483 (=> res!766569 e!656133)))

(assert (=> b!1153483 (= res!766569 (not (= from!1455 i!673)))))

(declare-fun lt!516531 () ListLongMap!16419)

(assert (=> b!1153483 (= lt!516531 (getCurrentListMapNoExtraKeys!4724 lt!516527 lt!516537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516544 () V!43665)

(assert (=> b!1153483 (= lt!516537 (array!74702 (store (arr!35995 _values!996) i!673 (ValueCellFull!13742 lt!516544)) (size!36532 _values!996)))))

(declare-fun dynLambda!2747 (Int (_ BitVec 64)) V!43665)

(assert (=> b!1153483 (= lt!516544 (dynLambda!2747 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516534 () ListLongMap!16419)

(assert (=> b!1153483 (= lt!516534 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153484 () Bool)

(assert (=> b!1153484 (= e!656139 true)))

(assert (=> b!1153484 e!656141))

(declare-fun res!766571 () Bool)

(assert (=> b!1153484 (=> (not res!766571) (not e!656141))))

(assert (=> b!1153484 (= res!766571 (= lt!516529 lt!516530))))

(assert (=> b!1153484 (= lt!516529 (-!1343 lt!516534 k0!934))))

(declare-fun lt!516540 () V!43665)

(assert (=> b!1153484 (= (-!1343 (+!3658 lt!516530 (tuple2!18443 (select (arr!35994 _keys!1208) from!1455) lt!516540)) (select (arr!35994 _keys!1208) from!1455)) lt!516530)))

(declare-fun lt!516543 () Unit!37891)

(declare-fun addThenRemoveForNewKeyIsSame!186 (ListLongMap!16419 (_ BitVec 64) V!43665) Unit!37891)

(assert (=> b!1153484 (= lt!516543 (addThenRemoveForNewKeyIsSame!186 lt!516530 (select (arr!35994 _keys!1208) from!1455) lt!516540))))

(declare-fun get!18355 (ValueCell!13742 V!43665) V!43665)

(assert (=> b!1153484 (= lt!516540 (get!18355 (select (arr!35995 _values!996) from!1455) lt!516544))))

(declare-fun lt!516526 () Unit!37891)

(assert (=> b!1153484 (= lt!516526 e!656129)))

(declare-fun c!114617 () Bool)

(assert (=> b!1153484 (= c!114617 (contains!6757 lt!516530 k0!934))))

(assert (=> b!1153484 (= lt!516530 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153485 () Bool)

(declare-fun res!766570 () Bool)

(assert (=> b!1153485 (=> (not res!766570) (not e!656140))))

(assert (=> b!1153485 (= res!766570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25190))))

(declare-fun b!1153486 () Bool)

(declare-fun lt!516532 () Unit!37891)

(assert (=> b!1153486 (= e!656138 lt!516532)))

(assert (=> b!1153486 (= lt!516532 call!54087)))

(assert (=> b!1153486 call!54090))

(declare-fun bm!54087 () Bool)

(assert (=> bm!54087 (= call!54089 (+!3658 lt!516530 (ite (or c!114618 c!114614) (tuple2!18443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1153487 () Bool)

(assert (=> b!1153487 (= e!656135 (and e!656136 mapRes!45179))))

(declare-fun condMapEmpty!45179 () Bool)

(declare-fun mapDefault!45179 () ValueCell!13742)

(assert (=> b!1153487 (= condMapEmpty!45179 (= (arr!35995 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13742)) mapDefault!45179)))))

(declare-fun mapIsEmpty!45179 () Bool)

(assert (=> mapIsEmpty!45179 mapRes!45179))

(declare-fun b!1153488 () Bool)

(declare-fun res!766575 () Bool)

(assert (=> b!1153488 (=> (not res!766575) (not e!656140))))

(assert (=> b!1153488 (= res!766575 (and (= (size!36532 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36531 _keys!1208) (size!36532 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99004 res!766567) b!1153482))

(assert (= (and b!1153482 res!766581) b!1153488))

(assert (= (and b!1153488 res!766575) b!1153467))

(assert (= (and b!1153467 res!766572) b!1153485))

(assert (= (and b!1153485 res!766570) b!1153479))

(assert (= (and b!1153479 res!766578) b!1153472))

(assert (= (and b!1153472 res!766576) b!1153478))

(assert (= (and b!1153478 res!766580) b!1153462))

(assert (= (and b!1153462 res!766574) b!1153463))

(assert (= (and b!1153463 res!766577) b!1153476))

(assert (= (and b!1153476 (not res!766568)) b!1153483))

(assert (= (and b!1153483 (not res!766569)) b!1153461))

(assert (= (and b!1153461 c!114613) b!1153473))

(assert (= (and b!1153461 (not c!114613)) b!1153468))

(assert (= (or b!1153473 b!1153468) bm!54084))

(assert (= (or b!1153473 b!1153468) bm!54086))

(assert (= (and b!1153461 (not res!766579)) b!1153484))

(assert (= (and b!1153484 c!114617) b!1153464))

(assert (= (and b!1153484 (not c!114617)) b!1153480))

(assert (= (and b!1153464 c!114618) b!1153469))

(assert (= (and b!1153464 (not c!114618)) b!1153481))

(assert (= (and b!1153481 c!114614) b!1153486))

(assert (= (and b!1153481 (not c!114614)) b!1153474))

(assert (= (and b!1153474 c!114616) b!1153470))

(assert (= (and b!1153474 (not c!114616)) b!1153475))

(assert (= (or b!1153486 b!1153470) bm!54080))

(assert (= (or b!1153486 b!1153470) bm!54082))

(assert (= (or b!1153486 b!1153470) bm!54081))

(assert (= (or b!1153469 bm!54081) bm!54083))

(assert (= (or b!1153469 bm!54080) bm!54085))

(assert (= (or b!1153469 bm!54082) bm!54087))

(assert (= (and b!1153464 c!114615) b!1153460))

(assert (= (and b!1153464 (not c!114615)) b!1153459))

(assert (= (and b!1153464 res!766573) b!1153466))

(assert (= (and b!1153484 res!766571) b!1153477))

(assert (= (and b!1153487 condMapEmpty!45179) mapIsEmpty!45179))

(assert (= (and b!1153487 (not condMapEmpty!45179)) mapNonEmpty!45179))

(get-info :version)

(assert (= (and mapNonEmpty!45179 ((_ is ValueCellFull!13742) mapValue!45179)) b!1153471))

(assert (= (and b!1153487 ((_ is ValueCellFull!13742) mapDefault!45179)) b!1153465))

(assert (= start!99004 b!1153487))

(declare-fun b_lambda!19473 () Bool)

(assert (=> (not b_lambda!19473) (not b!1153483)))

(declare-fun t!36549 () Bool)

(declare-fun tb!9177 () Bool)

(assert (=> (and start!99004 (= defaultEntry!1004 defaultEntry!1004) t!36549) tb!9177))

(declare-fun result!18927 () Bool)

(assert (=> tb!9177 (= result!18927 tp_is_empty!28903)))

(assert (=> b!1153483 t!36549))

(declare-fun b_and!39599 () Bool)

(assert (= b_and!39597 (and (=> t!36549 result!18927) b_and!39599)))

(declare-fun m!1063753 () Bool)

(assert (=> bm!54084 m!1063753))

(declare-fun m!1063755 () Bool)

(assert (=> b!1153461 m!1063755))

(declare-fun m!1063757 () Bool)

(assert (=> b!1153461 m!1063757))

(declare-fun m!1063759 () Bool)

(assert (=> b!1153469 m!1063759))

(assert (=> b!1153469 m!1063759))

(declare-fun m!1063761 () Bool)

(assert (=> b!1153469 m!1063761))

(declare-fun m!1063763 () Bool)

(assert (=> b!1153469 m!1063763))

(declare-fun m!1063765 () Bool)

(assert (=> b!1153482 m!1063765))

(declare-fun m!1063767 () Bool)

(assert (=> bm!54087 m!1063767))

(assert (=> b!1153484 m!1063755))

(declare-fun m!1063769 () Bool)

(assert (=> b!1153484 m!1063769))

(declare-fun m!1063771 () Bool)

(assert (=> b!1153484 m!1063771))

(declare-fun m!1063773 () Bool)

(assert (=> b!1153484 m!1063773))

(declare-fun m!1063775 () Bool)

(assert (=> b!1153484 m!1063775))

(declare-fun m!1063777 () Bool)

(assert (=> b!1153484 m!1063777))

(assert (=> b!1153484 m!1063755))

(declare-fun m!1063779 () Bool)

(assert (=> b!1153484 m!1063779))

(declare-fun m!1063781 () Bool)

(assert (=> b!1153484 m!1063781))

(assert (=> b!1153484 m!1063773))

(declare-fun m!1063783 () Bool)

(assert (=> b!1153484 m!1063783))

(assert (=> b!1153484 m!1063777))

(assert (=> b!1153484 m!1063755))

(declare-fun m!1063785 () Bool)

(assert (=> b!1153476 m!1063785))

(declare-fun m!1063787 () Bool)

(assert (=> b!1153476 m!1063787))

(declare-fun m!1063789 () Bool)

(assert (=> b!1153485 m!1063789))

(declare-fun m!1063791 () Bool)

(assert (=> b!1153460 m!1063791))

(declare-fun m!1063793 () Bool)

(assert (=> b!1153483 m!1063793))

(declare-fun m!1063795 () Bool)

(assert (=> b!1153483 m!1063795))

(declare-fun m!1063797 () Bool)

(assert (=> b!1153483 m!1063797))

(declare-fun m!1063799 () Bool)

(assert (=> b!1153483 m!1063799))

(assert (=> bm!54086 m!1063771))

(declare-fun m!1063801 () Bool)

(assert (=> mapNonEmpty!45179 m!1063801))

(declare-fun m!1063803 () Bool)

(assert (=> start!99004 m!1063803))

(declare-fun m!1063805 () Bool)

(assert (=> start!99004 m!1063805))

(declare-fun m!1063807 () Bool)

(assert (=> b!1153467 m!1063807))

(declare-fun m!1063809 () Bool)

(assert (=> bm!54085 m!1063809))

(declare-fun m!1063811 () Bool)

(assert (=> b!1153472 m!1063811))

(declare-fun m!1063813 () Bool)

(assert (=> b!1153478 m!1063813))

(declare-fun m!1063815 () Bool)

(assert (=> b!1153463 m!1063815))

(assert (=> b!1153477 m!1063753))

(declare-fun m!1063817 () Bool)

(assert (=> bm!54083 m!1063817))

(declare-fun m!1063819 () Bool)

(assert (=> b!1153462 m!1063819))

(declare-fun m!1063821 () Bool)

(assert (=> b!1153462 m!1063821))

(declare-fun m!1063823 () Bool)

(assert (=> b!1153473 m!1063823))

(assert (=> b!1153466 m!1063791))

(declare-fun m!1063825 () Bool)

(assert (=> b!1153464 m!1063825))

(declare-fun m!1063827 () Bool)

(assert (=> b!1153464 m!1063827))

(declare-fun m!1063829 () Bool)

(assert (=> b!1153464 m!1063829))

(declare-fun m!1063831 () Bool)

(assert (=> b!1153464 m!1063831))

(check-sat (not b!1153466) (not b!1153469) (not b!1153463) (not b!1153462) (not b!1153464) (not b!1153473) b_and!39599 (not start!99004) (not b!1153484) (not b!1153467) (not b!1153483) (not b!1153472) (not b!1153482) (not b!1153461) (not bm!54085) (not b!1153460) (not bm!54086) (not bm!54083) tp_is_empty!28903 (not b_next!24373) (not b!1153485) (not bm!54087) (not mapNonEmpty!45179) (not b_lambda!19473) (not b!1153476) (not b!1153477) (not bm!54084))
(check-sat b_and!39599 (not b_next!24373))
