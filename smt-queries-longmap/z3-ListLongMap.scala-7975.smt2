; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98692 () Bool)

(assert start!98692)

(declare-fun b_free!24297 () Bool)

(declare-fun b_next!24297 () Bool)

(assert (=> start!98692 (= b_free!24297 (not b_next!24297))))

(declare-fun tp!85601 () Bool)

(declare-fun b_and!39443 () Bool)

(assert (=> start!98692 (= tp!85601 b_and!39443)))

(declare-fun b!1148674 () Bool)

(declare-datatypes ((Unit!37750 0))(
  ( (Unit!37751) )
))
(declare-fun e!653364 () Unit!37750)

(declare-fun lt!513548 () Unit!37750)

(assert (=> b!1148674 (= e!653364 lt!513548)))

(declare-fun call!53112 () Unit!37750)

(assert (=> b!1148674 (= lt!513548 call!53112)))

(declare-fun call!53110 () Bool)

(assert (=> b!1148674 call!53110))

(declare-fun b!1148675 () Bool)

(declare-fun res!764358 () Bool)

(declare-fun e!653372 () Bool)

(assert (=> b!1148675 (=> (not res!764358) (not e!653372))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148675 (= res!764358 (validMask!0 mask!1564))))

(declare-fun b!1148676 () Bool)

(declare-fun res!764351 () Bool)

(assert (=> b!1148676 (=> (not res!764351) (not e!653372))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148676 (= res!764351 (validKeyInArray!0 k0!934))))

(declare-fun bm!53103 () Bool)

(declare-datatypes ((V!43563 0))(
  ( (V!43564 (val!14470 Int)) )
))
(declare-datatypes ((tuple2!18352 0))(
  ( (tuple2!18353 (_1!9187 (_ BitVec 64)) (_2!9187 V!43563)) )
))
(declare-datatypes ((List!25103 0))(
  ( (Nil!25100) (Cons!25099 (h!26308 tuple2!18352) (t!36392 List!25103)) )
))
(declare-datatypes ((ListLongMap!16321 0))(
  ( (ListLongMap!16322 (toList!8176 List!25103)) )
))
(declare-fun call!53109 () ListLongMap!16321)

(declare-fun call!53111 () ListLongMap!16321)

(assert (=> bm!53103 (= call!53109 call!53111)))

(declare-fun zeroValue!944 () V!43563)

(declare-datatypes ((array!74501 0))(
  ( (array!74502 (arr!35901 (Array (_ BitVec 32) (_ BitVec 64))) (size!36437 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74501)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!53104 () Bool)

(declare-datatypes ((ValueCell!13704 0))(
  ( (ValueCellFull!13704 (v!17107 V!43563)) (EmptyCell!13704) )
))
(declare-datatypes ((array!74503 0))(
  ( (array!74504 (arr!35902 (Array (_ BitVec 32) ValueCell!13704)) (size!36438 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74503)

(declare-fun minValue!944 () V!43563)

(declare-fun call!53106 () ListLongMap!16321)

(declare-fun getCurrentListMapNoExtraKeys!4649 (array!74501 array!74503 (_ BitVec 32) (_ BitVec 32) V!43563 V!43563 (_ BitVec 32) Int) ListLongMap!16321)

(assert (=> bm!53104 (= call!53106 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148678 () Bool)

(declare-fun e!653358 () Bool)

(declare-fun call!53108 () ListLongMap!16321)

(assert (=> b!1148678 (= e!653358 (= call!53108 call!53106))))

(declare-fun b!1148679 () Bool)

(declare-fun c!113533 () Bool)

(declare-fun lt!513547 () Bool)

(assert (=> b!1148679 (= c!113533 (and (not lt!513547) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653359 () Unit!37750)

(assert (=> b!1148679 (= e!653359 e!653364)))

(declare-fun b!1148680 () Bool)

(declare-fun e!653366 () Unit!37750)

(assert (=> b!1148680 (= e!653364 e!653366)))

(declare-fun c!113532 () Bool)

(assert (=> b!1148680 (= c!113532 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513547))))

(declare-fun b!1148681 () Bool)

(declare-fun e!653357 () Bool)

(assert (=> b!1148681 (= e!653372 e!653357)))

(declare-fun res!764357 () Bool)

(assert (=> b!1148681 (=> (not res!764357) (not e!653357))))

(declare-fun lt!513562 () array!74501)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74501 (_ BitVec 32)) Bool)

(assert (=> b!1148681 (= res!764357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513562 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148681 (= lt!513562 (array!74502 (store (arr!35901 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36437 _keys!1208)))))

(declare-fun b!1148682 () Bool)

(declare-fun e!653369 () Bool)

(declare-fun e!653365 () Bool)

(declare-fun mapRes!45065 () Bool)

(assert (=> b!1148682 (= e!653369 (and e!653365 mapRes!45065))))

(declare-fun condMapEmpty!45065 () Bool)

(declare-fun mapDefault!45065 () ValueCell!13704)

(assert (=> b!1148682 (= condMapEmpty!45065 (= (arr!35902 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13704)) mapDefault!45065)))))

(declare-fun mapNonEmpty!45065 () Bool)

(declare-fun tp!85602 () Bool)

(declare-fun e!653371 () Bool)

(assert (=> mapNonEmpty!45065 (= mapRes!45065 (and tp!85602 e!653371))))

(declare-fun mapRest!45065 () (Array (_ BitVec 32) ValueCell!13704))

(declare-fun mapKey!45065 () (_ BitVec 32))

(declare-fun mapValue!45065 () ValueCell!13704)

(assert (=> mapNonEmpty!45065 (= (arr!35902 _values!996) (store mapRest!45065 mapKey!45065 mapValue!45065))))

(declare-fun b!1148683 () Bool)

(declare-fun res!764350 () Bool)

(assert (=> b!1148683 (=> (not res!764350) (not e!653372))))

(assert (=> b!1148683 (= res!764350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148684 () Bool)

(assert (=> b!1148684 call!53110))

(declare-fun lt!513564 () Unit!37750)

(assert (=> b!1148684 (= lt!513564 call!53112)))

(assert (=> b!1148684 (= e!653366 lt!513564)))

(declare-fun b!1148685 () Bool)

(declare-fun lt!513557 () ListLongMap!16321)

(declare-fun contains!6699 (ListLongMap!16321 (_ BitVec 64)) Bool)

(declare-fun +!3598 (ListLongMap!16321 tuple2!18352) ListLongMap!16321)

(assert (=> b!1148685 (contains!6699 (+!3598 lt!513557 (tuple2!18353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513561 () Unit!37750)

(declare-fun addStillContains!848 (ListLongMap!16321 (_ BitVec 64) V!43563 (_ BitVec 64)) Unit!37750)

(assert (=> b!1148685 (= lt!513561 (addStillContains!848 lt!513557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53113 () Bool)

(assert (=> b!1148685 call!53113))

(assert (=> b!1148685 (= lt!513557 call!53111)))

(declare-fun lt!513559 () Unit!37750)

(declare-fun call!53107 () Unit!37750)

(assert (=> b!1148685 (= lt!513559 call!53107)))

(assert (=> b!1148685 (= e!653359 lt!513561)))

(declare-fun b!1148686 () Bool)

(declare-fun res!764363 () Bool)

(assert (=> b!1148686 (=> (not res!764363) (not e!653372))))

(assert (=> b!1148686 (= res!764363 (and (= (size!36438 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36437 _keys!1208) (size!36438 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148687 () Bool)

(declare-fun e!653367 () Bool)

(declare-fun e!653363 () Bool)

(assert (=> b!1148687 (= e!653367 e!653363)))

(declare-fun res!764360 () Bool)

(assert (=> b!1148687 (=> res!764360 e!653363)))

(assert (=> b!1148687 (= res!764360 (not (= (select (arr!35901 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148687 e!653358))

(declare-fun c!113531 () Bool)

(assert (=> b!1148687 (= c!113531 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513551 () Unit!37750)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!549 (array!74501 array!74503 (_ BitVec 32) (_ BitVec 32) V!43563 V!43563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37750)

(assert (=> b!1148687 (= lt!513551 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!549 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148688 () Bool)

(assert (=> b!1148688 (= e!653363 true)))

(declare-fun e!653373 () Bool)

(assert (=> b!1148688 e!653373))

(declare-fun res!764362 () Bool)

(assert (=> b!1148688 (=> (not res!764362) (not e!653373))))

(declare-fun lt!513553 () V!43563)

(declare-fun lt!513558 () ListLongMap!16321)

(declare-fun -!1311 (ListLongMap!16321 (_ BitVec 64)) ListLongMap!16321)

(assert (=> b!1148688 (= res!764362 (= (-!1311 (+!3598 lt!513558 (tuple2!18353 (select (arr!35901 _keys!1208) from!1455) lt!513553)) (select (arr!35901 _keys!1208) from!1455)) lt!513558))))

(declare-fun lt!513550 () Unit!37750)

(declare-fun addThenRemoveForNewKeyIsSame!156 (ListLongMap!16321 (_ BitVec 64) V!43563) Unit!37750)

(assert (=> b!1148688 (= lt!513550 (addThenRemoveForNewKeyIsSame!156 lt!513558 (select (arr!35901 _keys!1208) from!1455) lt!513553))))

(declare-fun lt!513560 () V!43563)

(declare-fun get!18268 (ValueCell!13704 V!43563) V!43563)

(assert (=> b!1148688 (= lt!513553 (get!18268 (select (arr!35902 _values!996) from!1455) lt!513560))))

(declare-fun lt!513554 () Unit!37750)

(declare-fun e!653362 () Unit!37750)

(assert (=> b!1148688 (= lt!513554 e!653362)))

(declare-fun c!113534 () Bool)

(assert (=> b!1148688 (= c!113534 (contains!6699 lt!513558 k0!934))))

(assert (=> b!1148688 (= lt!513558 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148689 () Bool)

(declare-fun Unit!37752 () Unit!37750)

(assert (=> b!1148689 (= e!653362 Unit!37752)))

(declare-fun bm!53105 () Bool)

(assert (=> bm!53105 (= call!53110 call!53113)))

(declare-fun mapIsEmpty!45065 () Bool)

(assert (=> mapIsEmpty!45065 mapRes!45065))

(declare-fun b!1148690 () Bool)

(declare-fun e!653368 () Bool)

(assert (=> b!1148690 (= e!653368 e!653367)))

(declare-fun res!764352 () Bool)

(assert (=> b!1148690 (=> res!764352 e!653367)))

(assert (=> b!1148690 (= res!764352 (not (= from!1455 i!673)))))

(declare-fun lt!513566 () ListLongMap!16321)

(declare-fun lt!513563 () array!74503)

(assert (=> b!1148690 (= lt!513566 (getCurrentListMapNoExtraKeys!4649 lt!513562 lt!513563 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148690 (= lt!513563 (array!74504 (store (arr!35902 _values!996) i!673 (ValueCellFull!13704 lt!513560)) (size!36438 _values!996)))))

(declare-fun dynLambda!2677 (Int (_ BitVec 64)) V!43563)

(assert (=> b!1148690 (= lt!513560 (dynLambda!2677 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513555 () ListLongMap!16321)

(assert (=> b!1148690 (= lt!513555 (getCurrentListMapNoExtraKeys!4649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!113536 () Bool)

(declare-fun bm!53106 () Bool)

(assert (=> bm!53106 (= call!53113 (contains!6699 (ite c!113536 lt!513557 call!53109) k0!934))))

(declare-fun b!1148691 () Bool)

(declare-fun tp_is_empty!28827 () Bool)

(assert (=> b!1148691 (= e!653371 tp_is_empty!28827)))

(declare-fun res!764353 () Bool)

(assert (=> start!98692 (=> (not res!764353) (not e!653372))))

(assert (=> start!98692 (= res!764353 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36437 _keys!1208))))))

(assert (=> start!98692 e!653372))

(assert (=> start!98692 tp_is_empty!28827))

(declare-fun array_inv!27496 (array!74501) Bool)

(assert (=> start!98692 (array_inv!27496 _keys!1208)))

(assert (=> start!98692 true))

(assert (=> start!98692 tp!85601))

(declare-fun array_inv!27497 (array!74503) Bool)

(assert (=> start!98692 (and (array_inv!27497 _values!996) e!653369)))

(declare-fun b!1148677 () Bool)

(declare-fun Unit!37753 () Unit!37750)

(assert (=> b!1148677 (= e!653366 Unit!37753)))

(declare-fun b!1148692 () Bool)

(declare-fun res!764354 () Bool)

(assert (=> b!1148692 (=> (not res!764354) (not e!653372))))

(assert (=> b!1148692 (= res!764354 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36437 _keys!1208))))))

(declare-fun bm!53107 () Bool)

(assert (=> bm!53107 (= call!53108 (getCurrentListMapNoExtraKeys!4649 lt!513562 lt!513563 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148693 () Bool)

(assert (=> b!1148693 (= e!653373 (= (-!1311 lt!513555 k0!934) lt!513558))))

(declare-fun e!653360 () Bool)

(declare-fun b!1148694 () Bool)

(declare-fun arrayContainsKey!0 (array!74501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148694 (= e!653360 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148695 () Bool)

(declare-fun Unit!37754 () Unit!37750)

(assert (=> b!1148695 (= e!653362 Unit!37754)))

(assert (=> b!1148695 (= lt!513547 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148695 (= c!113536 (and (not lt!513547) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513565 () Unit!37750)

(assert (=> b!1148695 (= lt!513565 e!653359)))

(declare-fun lt!513556 () Unit!37750)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!444 (array!74501 array!74503 (_ BitVec 32) (_ BitVec 32) V!43563 V!43563 (_ BitVec 64) (_ BitVec 32) Int) Unit!37750)

(assert (=> b!1148695 (= lt!513556 (lemmaListMapContainsThenArrayContainsFrom!444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113535 () Bool)

(assert (=> b!1148695 (= c!113535 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764359 () Bool)

(declare-fun e!653370 () Bool)

(assert (=> b!1148695 (= res!764359 e!653370)))

(assert (=> b!1148695 (=> (not res!764359) (not e!653360))))

(assert (=> b!1148695 e!653360))

(declare-fun lt!513567 () Unit!37750)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74501 (_ BitVec 32) (_ BitVec 32)) Unit!37750)

(assert (=> b!1148695 (= lt!513567 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25104 0))(
  ( (Nil!25101) (Cons!25100 (h!26309 (_ BitVec 64)) (t!36393 List!25104)) )
))
(declare-fun arrayNoDuplicates!0 (array!74501 (_ BitVec 32) List!25104) Bool)

(assert (=> b!1148695 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25101)))

(declare-fun lt!513552 () Unit!37750)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74501 (_ BitVec 64) (_ BitVec 32) List!25104) Unit!37750)

(assert (=> b!1148695 (= lt!513552 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25101))))

(assert (=> b!1148695 false))

(declare-fun b!1148696 () Bool)

(assert (=> b!1148696 (= e!653370 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513547) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148697 () Bool)

(assert (=> b!1148697 (= e!653357 (not e!653368))))

(declare-fun res!764356 () Bool)

(assert (=> b!1148697 (=> res!764356 e!653368)))

(assert (=> b!1148697 (= res!764356 (bvsgt from!1455 i!673))))

(assert (=> b!1148697 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513549 () Unit!37750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74501 (_ BitVec 64) (_ BitVec 32)) Unit!37750)

(assert (=> b!1148697 (= lt!513549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148698 () Bool)

(assert (=> b!1148698 (= e!653370 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148699 () Bool)

(declare-fun res!764361 () Bool)

(assert (=> b!1148699 (=> (not res!764361) (not e!653372))))

(assert (=> b!1148699 (= res!764361 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25101))))

(declare-fun b!1148700 () Bool)

(assert (=> b!1148700 (= e!653358 (= call!53108 (-!1311 call!53106 k0!934)))))

(declare-fun bm!53108 () Bool)

(assert (=> bm!53108 (= call!53111 (+!3598 lt!513558 (ite (or c!113536 c!113533) (tuple2!18353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!53109 () Bool)

(assert (=> bm!53109 (= call!53107 (addStillContains!848 lt!513558 (ite (or c!113536 c!113533) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113536 c!113533) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148701 () Bool)

(declare-fun res!764355 () Bool)

(assert (=> b!1148701 (=> (not res!764355) (not e!653372))))

(assert (=> b!1148701 (= res!764355 (= (select (arr!35901 _keys!1208) i!673) k0!934))))

(declare-fun b!1148702 () Bool)

(assert (=> b!1148702 (= e!653365 tp_is_empty!28827)))

(declare-fun b!1148703 () Bool)

(declare-fun res!764349 () Bool)

(assert (=> b!1148703 (=> (not res!764349) (not e!653357))))

(assert (=> b!1148703 (= res!764349 (arrayNoDuplicates!0 lt!513562 #b00000000000000000000000000000000 Nil!25101))))

(declare-fun bm!53110 () Bool)

(assert (=> bm!53110 (= call!53112 call!53107)))

(assert (= (and start!98692 res!764353) b!1148675))

(assert (= (and b!1148675 res!764358) b!1148686))

(assert (= (and b!1148686 res!764363) b!1148683))

(assert (= (and b!1148683 res!764350) b!1148699))

(assert (= (and b!1148699 res!764361) b!1148692))

(assert (= (and b!1148692 res!764354) b!1148676))

(assert (= (and b!1148676 res!764351) b!1148701))

(assert (= (and b!1148701 res!764355) b!1148681))

(assert (= (and b!1148681 res!764357) b!1148703))

(assert (= (and b!1148703 res!764349) b!1148697))

(assert (= (and b!1148697 (not res!764356)) b!1148690))

(assert (= (and b!1148690 (not res!764352)) b!1148687))

(assert (= (and b!1148687 c!113531) b!1148700))

(assert (= (and b!1148687 (not c!113531)) b!1148678))

(assert (= (or b!1148700 b!1148678) bm!53107))

(assert (= (or b!1148700 b!1148678) bm!53104))

(assert (= (and b!1148687 (not res!764360)) b!1148688))

(assert (= (and b!1148688 c!113534) b!1148695))

(assert (= (and b!1148688 (not c!113534)) b!1148689))

(assert (= (and b!1148695 c!113536) b!1148685))

(assert (= (and b!1148695 (not c!113536)) b!1148679))

(assert (= (and b!1148679 c!113533) b!1148674))

(assert (= (and b!1148679 (not c!113533)) b!1148680))

(assert (= (and b!1148680 c!113532) b!1148684))

(assert (= (and b!1148680 (not c!113532)) b!1148677))

(assert (= (or b!1148674 b!1148684) bm!53110))

(assert (= (or b!1148674 b!1148684) bm!53103))

(assert (= (or b!1148674 b!1148684) bm!53105))

(assert (= (or b!1148685 bm!53105) bm!53106))

(assert (= (or b!1148685 bm!53110) bm!53109))

(assert (= (or b!1148685 bm!53103) bm!53108))

(assert (= (and b!1148695 c!113535) b!1148698))

(assert (= (and b!1148695 (not c!113535)) b!1148696))

(assert (= (and b!1148695 res!764359) b!1148694))

(assert (= (and b!1148688 res!764362) b!1148693))

(assert (= (and b!1148682 condMapEmpty!45065) mapIsEmpty!45065))

(assert (= (and b!1148682 (not condMapEmpty!45065)) mapNonEmpty!45065))

(get-info :version)

(assert (= (and mapNonEmpty!45065 ((_ is ValueCellFull!13704) mapValue!45065)) b!1148691))

(assert (= (and b!1148682 ((_ is ValueCellFull!13704) mapDefault!45065)) b!1148702))

(assert (= start!98692 b!1148682))

(declare-fun b_lambda!19403 () Bool)

(assert (=> (not b_lambda!19403) (not b!1148690)))

(declare-fun t!36391 () Bool)

(declare-fun tb!9109 () Bool)

(assert (=> (and start!98692 (= defaultEntry!1004 defaultEntry!1004) t!36391) tb!9109))

(declare-fun result!18783 () Bool)

(assert (=> tb!9109 (= result!18783 tp_is_empty!28827)))

(assert (=> b!1148690 t!36391))

(declare-fun b_and!39445 () Bool)

(assert (= b_and!39443 (and (=> t!36391 result!18783) b_and!39445)))

(declare-fun m!1059141 () Bool)

(assert (=> b!1148701 m!1059141))

(declare-fun m!1059143 () Bool)

(assert (=> bm!53108 m!1059143))

(declare-fun m!1059145 () Bool)

(assert (=> b!1148683 m!1059145))

(declare-fun m!1059147 () Bool)

(assert (=> b!1148699 m!1059147))

(declare-fun m!1059149 () Bool)

(assert (=> bm!53109 m!1059149))

(declare-fun m!1059151 () Bool)

(assert (=> b!1148688 m!1059151))

(declare-fun m!1059153 () Bool)

(assert (=> b!1148688 m!1059153))

(declare-fun m!1059155 () Bool)

(assert (=> b!1148688 m!1059155))

(declare-fun m!1059157 () Bool)

(assert (=> b!1148688 m!1059157))

(declare-fun m!1059159 () Bool)

(assert (=> b!1148688 m!1059159))

(declare-fun m!1059161 () Bool)

(assert (=> b!1148688 m!1059161))

(assert (=> b!1148688 m!1059157))

(assert (=> b!1148688 m!1059159))

(declare-fun m!1059163 () Bool)

(assert (=> b!1148688 m!1059163))

(assert (=> b!1148688 m!1059153))

(declare-fun m!1059165 () Bool)

(assert (=> b!1148688 m!1059165))

(assert (=> b!1148688 m!1059159))

(declare-fun m!1059167 () Bool)

(assert (=> bm!53106 m!1059167))

(declare-fun m!1059169 () Bool)

(assert (=> b!1148681 m!1059169))

(declare-fun m!1059171 () Bool)

(assert (=> b!1148681 m!1059171))

(declare-fun m!1059173 () Bool)

(assert (=> mapNonEmpty!45065 m!1059173))

(declare-fun m!1059175 () Bool)

(assert (=> b!1148694 m!1059175))

(declare-fun m!1059177 () Bool)

(assert (=> b!1148693 m!1059177))

(declare-fun m!1059179 () Bool)

(assert (=> start!98692 m!1059179))

(declare-fun m!1059181 () Bool)

(assert (=> start!98692 m!1059181))

(declare-fun m!1059183 () Bool)

(assert (=> b!1148700 m!1059183))

(declare-fun m!1059185 () Bool)

(assert (=> b!1148695 m!1059185))

(declare-fun m!1059187 () Bool)

(assert (=> b!1148695 m!1059187))

(declare-fun m!1059189 () Bool)

(assert (=> b!1148695 m!1059189))

(declare-fun m!1059191 () Bool)

(assert (=> b!1148695 m!1059191))

(declare-fun m!1059193 () Bool)

(assert (=> b!1148703 m!1059193))

(assert (=> b!1148698 m!1059175))

(declare-fun m!1059195 () Bool)

(assert (=> b!1148685 m!1059195))

(assert (=> b!1148685 m!1059195))

(declare-fun m!1059197 () Bool)

(assert (=> b!1148685 m!1059197))

(declare-fun m!1059199 () Bool)

(assert (=> b!1148685 m!1059199))

(declare-fun m!1059201 () Bool)

(assert (=> b!1148675 m!1059201))

(declare-fun m!1059203 () Bool)

(assert (=> b!1148697 m!1059203))

(declare-fun m!1059205 () Bool)

(assert (=> b!1148697 m!1059205))

(declare-fun m!1059207 () Bool)

(assert (=> bm!53107 m!1059207))

(assert (=> b!1148687 m!1059159))

(declare-fun m!1059209 () Bool)

(assert (=> b!1148687 m!1059209))

(declare-fun m!1059211 () Bool)

(assert (=> b!1148690 m!1059211))

(declare-fun m!1059213 () Bool)

(assert (=> b!1148690 m!1059213))

(declare-fun m!1059215 () Bool)

(assert (=> b!1148690 m!1059215))

(declare-fun m!1059217 () Bool)

(assert (=> b!1148690 m!1059217))

(declare-fun m!1059219 () Bool)

(assert (=> b!1148676 m!1059219))

(assert (=> bm!53104 m!1059151))

(check-sat (not start!98692) (not b!1148697) (not b_lambda!19403) (not b!1148681) tp_is_empty!28827 (not bm!53106) (not b!1148695) (not b!1148685) (not b!1148703) (not b!1148683) (not bm!53107) (not b!1148699) b_and!39445 (not b!1148688) (not b!1148693) (not b_next!24297) (not b!1148690) (not b!1148676) (not b!1148687) (not b!1148700) (not bm!53109) (not bm!53108) (not b!1148675) (not b!1148698) (not bm!53104) (not b!1148694) (not mapNonEmpty!45065))
(check-sat b_and!39445 (not b_next!24297))
