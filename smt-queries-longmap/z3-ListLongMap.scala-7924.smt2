; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98386 () Bool)

(assert start!98386)

(declare-fun b_free!23991 () Bool)

(declare-fun b_next!23991 () Bool)

(assert (=> start!98386 (= b_free!23991 (not b_next!23991))))

(declare-fun tp!84683 () Bool)

(declare-fun b_and!38831 () Bool)

(assert (=> start!98386 (= tp!84683 b_and!38831)))

(declare-datatypes ((V!43155 0))(
  ( (V!43156 (val!14317 Int)) )
))
(declare-fun zeroValue!944 () V!43155)

(declare-datatypes ((tuple2!18064 0))(
  ( (tuple2!18065 (_1!9043 (_ BitVec 64)) (_2!9043 V!43155)) )
))
(declare-datatypes ((List!24822 0))(
  ( (Nil!24819) (Cons!24818 (h!26027 tuple2!18064) (t!35805 List!24822)) )
))
(declare-datatypes ((ListLongMap!16033 0))(
  ( (ListLongMap!16034 (toList!8032 List!24822)) )
))
(declare-fun call!49441 () ListLongMap!16033)

(declare-fun lt!504406 () ListLongMap!16033)

(declare-fun c!110838 () Bool)

(declare-fun lt!504413 () ListLongMap!16033)

(declare-fun bm!49431 () Bool)

(declare-fun c!110835 () Bool)

(declare-fun minValue!944 () V!43155)

(declare-fun +!3470 (ListLongMap!16033 tuple2!18064) ListLongMap!16033)

(assert (=> bm!49431 (= call!49441 (+!3470 (ite c!110838 lt!504413 lt!504406) (ite c!110838 (tuple2!18065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110835 (tuple2!18065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1134792 () Bool)

(declare-fun e!645806 () Bool)

(declare-fun e!645818 () Bool)

(assert (=> b!1134792 (= e!645806 (not e!645818))))

(declare-fun res!757543 () Bool)

(assert (=> b!1134792 (=> res!757543 e!645818)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134792 (= res!757543 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73903 0))(
  ( (array!73904 (arr!35602 (Array (_ BitVec 32) (_ BitVec 64))) (size!36138 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73903)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134792 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37178 0))(
  ( (Unit!37179) )
))
(declare-fun lt!504408 () Unit!37178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73903 (_ BitVec 64) (_ BitVec 32)) Unit!37178)

(assert (=> b!1134792 (= lt!504408 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134793 () Bool)

(declare-fun c!110839 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504410 () Bool)

(assert (=> b!1134793 (= c!110839 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504410))))

(declare-fun e!645814 () Unit!37178)

(declare-fun e!645811 () Unit!37178)

(assert (=> b!1134793 (= e!645814 e!645811)))

(declare-fun bm!49432 () Bool)

(declare-fun call!49440 () Bool)

(declare-fun call!49438 () Bool)

(assert (=> bm!49432 (= call!49440 call!49438)))

(declare-fun b!1134794 () Bool)

(declare-fun res!757551 () Bool)

(declare-fun e!645816 () Bool)

(assert (=> b!1134794 (=> (not res!757551) (not e!645816))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73903 (_ BitVec 32)) Bool)

(assert (=> b!1134794 (= res!757551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134795 () Bool)

(declare-fun e!645808 () Bool)

(assert (=> b!1134795 (= e!645808 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134796 () Bool)

(declare-fun res!757547 () Bool)

(assert (=> b!1134796 (=> (not res!757547) (not e!645816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134796 (= res!757547 (validMask!0 mask!1564))))

(declare-fun b!1134797 () Bool)

(declare-fun res!757556 () Bool)

(assert (=> b!1134797 (=> (not res!757556) (not e!645816))))

(declare-datatypes ((List!24823 0))(
  ( (Nil!24820) (Cons!24819 (h!26028 (_ BitVec 64)) (t!35806 List!24823)) )
))
(declare-fun arrayNoDuplicates!0 (array!73903 (_ BitVec 32) List!24823) Bool)

(assert (=> b!1134797 (= res!757556 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24820))))

(declare-fun b!1134798 () Bool)

(declare-fun res!757546 () Bool)

(declare-fun e!645810 () Bool)

(assert (=> b!1134798 (=> res!757546 e!645810)))

(declare-fun contains!6558 (List!24823 (_ BitVec 64)) Bool)

(assert (=> b!1134798 (= res!757546 (contains!6558 Nil!24820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134799 () Bool)

(assert (=> b!1134799 call!49440))

(declare-fun lt!504414 () Unit!37178)

(declare-fun call!49439 () Unit!37178)

(assert (=> b!1134799 (= lt!504414 call!49439)))

(assert (=> b!1134799 (= e!645814 lt!504414)))

(declare-fun b!1134800 () Bool)

(declare-fun e!645807 () Bool)

(declare-fun tp_is_empty!28521 () Bool)

(assert (=> b!1134800 (= e!645807 tp_is_empty!28521)))

(declare-fun call!49437 () ListLongMap!16033)

(declare-fun bm!49433 () Bool)

(declare-fun contains!6559 (ListLongMap!16033 (_ BitVec 64)) Bool)

(assert (=> bm!49433 (= call!49438 (contains!6559 (ite c!110838 lt!504413 call!49437) k0!934))))

(declare-fun b!1134801 () Bool)

(declare-fun e!645815 () Unit!37178)

(assert (=> b!1134801 (= e!645815 e!645814)))

(assert (=> b!1134801 (= c!110835 (and (not lt!504410) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134802 () Bool)

(assert (=> b!1134802 (= e!645816 e!645806)))

(declare-fun res!757542 () Bool)

(assert (=> b!1134802 (=> (not res!757542) (not e!645806))))

(declare-fun lt!504415 () array!73903)

(assert (=> b!1134802 (= res!757542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504415 mask!1564))))

(assert (=> b!1134802 (= lt!504415 (array!73904 (store (arr!35602 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36138 _keys!1208)))))

(declare-fun b!1134803 () Bool)

(declare-fun Unit!37180 () Unit!37178)

(assert (=> b!1134803 (= e!645811 Unit!37180)))

(declare-fun b!1134804 () Bool)

(declare-fun lt!504412 () Unit!37178)

(assert (=> b!1134804 (= e!645815 lt!504412)))

(declare-fun lt!504416 () Unit!37178)

(declare-fun call!49436 () Unit!37178)

(assert (=> b!1134804 (= lt!504416 call!49436)))

(assert (=> b!1134804 (= lt!504413 (+!3470 lt!504406 (tuple2!18065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1134804 call!49438))

(declare-fun addStillContains!733 (ListLongMap!16033 (_ BitVec 64) V!43155 (_ BitVec 64)) Unit!37178)

(assert (=> b!1134804 (= lt!504412 (addStillContains!733 lt!504413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1134804 (contains!6559 call!49441 k0!934)))

(declare-fun bm!49434 () Bool)

(assert (=> bm!49434 (= call!49439 call!49436)))

(declare-fun b!1134805 () Bool)

(declare-fun res!757548 () Bool)

(assert (=> b!1134805 (=> (not res!757548) (not e!645816))))

(assert (=> b!1134805 (= res!757548 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36138 _keys!1208))))))

(declare-fun b!1134806 () Bool)

(declare-fun e!645822 () Bool)

(assert (=> b!1134806 (= e!645822 tp_is_empty!28521)))

(declare-fun call!49435 () ListLongMap!16033)

(declare-fun call!49434 () ListLongMap!16033)

(declare-fun b!1134807 () Bool)

(declare-fun e!645812 () Bool)

(declare-fun -!1196 (ListLongMap!16033 (_ BitVec 64)) ListLongMap!16033)

(assert (=> b!1134807 (= e!645812 (= call!49434 (-!1196 call!49435 k0!934)))))

(declare-fun mapIsEmpty!44606 () Bool)

(declare-fun mapRes!44606 () Bool)

(assert (=> mapIsEmpty!44606 mapRes!44606))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13551 0))(
  ( (ValueCellFull!13551 (v!16954 V!43155)) (EmptyCell!13551) )
))
(declare-datatypes ((array!73905 0))(
  ( (array!73906 (arr!35603 (Array (_ BitVec 32) ValueCell!13551)) (size!36139 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73905)

(declare-fun bm!49435 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4518 (array!73903 array!73905 (_ BitVec 32) (_ BitVec 32) V!43155 V!43155 (_ BitVec 32) Int) ListLongMap!16033)

(assert (=> bm!49435 (= call!49435 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!645821 () Bool)

(declare-fun b!1134808 () Bool)

(assert (=> b!1134808 (= e!645821 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134809 () Bool)

(declare-fun res!757555 () Bool)

(assert (=> b!1134809 (=> (not res!757555) (not e!645806))))

(assert (=> b!1134809 (= res!757555 (arrayNoDuplicates!0 lt!504415 #b00000000000000000000000000000000 Nil!24820))))

(declare-fun b!1134810 () Bool)

(declare-fun e!645817 () Bool)

(assert (=> b!1134810 (= e!645818 e!645817)))

(declare-fun res!757549 () Bool)

(assert (=> b!1134810 (=> res!757549 e!645817)))

(assert (=> b!1134810 (= res!757549 (not (= from!1455 i!673)))))

(declare-fun lt!504409 () array!73905)

(declare-fun lt!504407 () ListLongMap!16033)

(assert (=> b!1134810 (= lt!504407 (getCurrentListMapNoExtraKeys!4518 lt!504415 lt!504409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2583 (Int (_ BitVec 64)) V!43155)

(assert (=> b!1134810 (= lt!504409 (array!73906 (store (arr!35603 _values!996) i!673 (ValueCellFull!13551 (dynLambda!2583 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36139 _values!996)))))

(declare-fun lt!504404 () ListLongMap!16033)

(assert (=> b!1134810 (= lt!504404 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49436 () Bool)

(assert (=> bm!49436 (= call!49437 call!49441)))

(declare-fun b!1134811 () Bool)

(declare-fun res!757558 () Bool)

(assert (=> b!1134811 (=> (not res!757558) (not e!645816))))

(assert (=> b!1134811 (= res!757558 (= (select (arr!35602 _keys!1208) i!673) k0!934))))

(declare-fun b!1134812 () Bool)

(assert (=> b!1134812 (= e!645812 (= call!49434 call!49435))))

(declare-fun bm!49437 () Bool)

(assert (=> bm!49437 (= call!49436 (addStillContains!733 lt!504406 (ite (or c!110838 c!110835) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110838 c!110835) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1134813 () Bool)

(assert (=> b!1134813 (= e!645821 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49438 () Bool)

(assert (=> bm!49438 (= call!49434 (getCurrentListMapNoExtraKeys!4518 lt!504415 lt!504409 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134814 () Bool)

(assert (=> b!1134814 (= e!645810 true)))

(declare-fun lt!504403 () Bool)

(assert (=> b!1134814 (= lt!504403 (contains!6558 Nil!24820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134815 () Bool)

(declare-fun e!645819 () Bool)

(declare-fun e!645813 () Bool)

(assert (=> b!1134815 (= e!645819 e!645813)))

(declare-fun res!757557 () Bool)

(assert (=> b!1134815 (=> res!757557 e!645813)))

(assert (=> b!1134815 (= res!757557 (not (contains!6559 lt!504406 k0!934)))))

(assert (=> b!1134815 (= lt!504406 (getCurrentListMapNoExtraKeys!4518 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134816 () Bool)

(assert (=> b!1134816 (= e!645817 e!645819)))

(declare-fun res!757559 () Bool)

(assert (=> b!1134816 (=> res!757559 e!645819)))

(assert (=> b!1134816 (= res!757559 (not (= (select (arr!35602 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134816 e!645812))

(declare-fun c!110836 () Bool)

(assert (=> b!1134816 (= c!110836 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504402 () Unit!37178)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!448 (array!73903 array!73905 (_ BitVec 32) (_ BitVec 32) V!43155 V!43155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37178)

(assert (=> b!1134816 (= lt!504402 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134817 () Bool)

(declare-fun res!757550 () Bool)

(assert (=> b!1134817 (=> (not res!757550) (not e!645816))))

(assert (=> b!1134817 (= res!757550 (and (= (size!36139 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36138 _keys!1208) (size!36139 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134818 () Bool)

(declare-fun res!757544 () Bool)

(assert (=> b!1134818 (=> (not res!757544) (not e!645816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134818 (= res!757544 (validKeyInArray!0 k0!934))))

(declare-fun b!1134819 () Bool)

(declare-fun res!757554 () Bool)

(assert (=> b!1134819 (=> res!757554 e!645810)))

(declare-fun noDuplicate!1594 (List!24823) Bool)

(assert (=> b!1134819 (= res!757554 (not (noDuplicate!1594 Nil!24820)))))

(declare-fun b!1134820 () Bool)

(declare-fun lt!504401 () Unit!37178)

(assert (=> b!1134820 (= e!645811 lt!504401)))

(assert (=> b!1134820 (= lt!504401 call!49439)))

(assert (=> b!1134820 call!49440))

(declare-fun res!757552 () Bool)

(assert (=> start!98386 (=> (not res!757552) (not e!645816))))

(assert (=> start!98386 (= res!757552 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36138 _keys!1208))))))

(assert (=> start!98386 e!645816))

(assert (=> start!98386 tp_is_empty!28521))

(declare-fun array_inv!27304 (array!73903) Bool)

(assert (=> start!98386 (array_inv!27304 _keys!1208)))

(assert (=> start!98386 true))

(assert (=> start!98386 tp!84683))

(declare-fun e!645809 () Bool)

(declare-fun array_inv!27305 (array!73905) Bool)

(assert (=> start!98386 (and (array_inv!27305 _values!996) e!645809)))

(declare-fun mapNonEmpty!44606 () Bool)

(declare-fun tp!84684 () Bool)

(assert (=> mapNonEmpty!44606 (= mapRes!44606 (and tp!84684 e!645822))))

(declare-fun mapKey!44606 () (_ BitVec 32))

(declare-fun mapRest!44606 () (Array (_ BitVec 32) ValueCell!13551))

(declare-fun mapValue!44606 () ValueCell!13551)

(assert (=> mapNonEmpty!44606 (= (arr!35603 _values!996) (store mapRest!44606 mapKey!44606 mapValue!44606))))

(declare-fun b!1134821 () Bool)

(assert (=> b!1134821 (= e!645809 (and e!645807 mapRes!44606))))

(declare-fun condMapEmpty!44606 () Bool)

(declare-fun mapDefault!44606 () ValueCell!13551)

(assert (=> b!1134821 (= condMapEmpty!44606 (= (arr!35603 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13551)) mapDefault!44606)))))

(declare-fun b!1134822 () Bool)

(assert (=> b!1134822 (= e!645813 e!645810)))

(declare-fun res!757545 () Bool)

(assert (=> b!1134822 (=> res!757545 e!645810)))

(assert (=> b!1134822 (= res!757545 (or (bvsge (size!36138 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36138 _keys!1208)) (bvsge from!1455 (size!36138 _keys!1208))))))

(assert (=> b!1134822 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24820)))

(declare-fun lt!504417 () Unit!37178)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73903 (_ BitVec 32) (_ BitVec 32)) Unit!37178)

(assert (=> b!1134822 (= lt!504417 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1134822 e!645808))

(declare-fun res!757553 () Bool)

(assert (=> b!1134822 (=> (not res!757553) (not e!645808))))

(assert (=> b!1134822 (= res!757553 e!645821)))

(declare-fun c!110837 () Bool)

(assert (=> b!1134822 (= c!110837 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504411 () Unit!37178)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!338 (array!73903 array!73905 (_ BitVec 32) (_ BitVec 32) V!43155 V!43155 (_ BitVec 64) (_ BitVec 32) Int) Unit!37178)

(assert (=> b!1134822 (= lt!504411 (lemmaListMapContainsThenArrayContainsFrom!338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504405 () Unit!37178)

(assert (=> b!1134822 (= lt!504405 e!645815)))

(assert (=> b!1134822 (= c!110838 (and (not lt!504410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134822 (= lt!504410 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!98386 res!757552) b!1134796))

(assert (= (and b!1134796 res!757547) b!1134817))

(assert (= (and b!1134817 res!757550) b!1134794))

(assert (= (and b!1134794 res!757551) b!1134797))

(assert (= (and b!1134797 res!757556) b!1134805))

(assert (= (and b!1134805 res!757548) b!1134818))

(assert (= (and b!1134818 res!757544) b!1134811))

(assert (= (and b!1134811 res!757558) b!1134802))

(assert (= (and b!1134802 res!757542) b!1134809))

(assert (= (and b!1134809 res!757555) b!1134792))

(assert (= (and b!1134792 (not res!757543)) b!1134810))

(assert (= (and b!1134810 (not res!757549)) b!1134816))

(assert (= (and b!1134816 c!110836) b!1134807))

(assert (= (and b!1134816 (not c!110836)) b!1134812))

(assert (= (or b!1134807 b!1134812) bm!49438))

(assert (= (or b!1134807 b!1134812) bm!49435))

(assert (= (and b!1134816 (not res!757559)) b!1134815))

(assert (= (and b!1134815 (not res!757557)) b!1134822))

(assert (= (and b!1134822 c!110838) b!1134804))

(assert (= (and b!1134822 (not c!110838)) b!1134801))

(assert (= (and b!1134801 c!110835) b!1134799))

(assert (= (and b!1134801 (not c!110835)) b!1134793))

(assert (= (and b!1134793 c!110839) b!1134820))

(assert (= (and b!1134793 (not c!110839)) b!1134803))

(assert (= (or b!1134799 b!1134820) bm!49434))

(assert (= (or b!1134799 b!1134820) bm!49436))

(assert (= (or b!1134799 b!1134820) bm!49432))

(assert (= (or b!1134804 bm!49432) bm!49433))

(assert (= (or b!1134804 bm!49434) bm!49437))

(assert (= (or b!1134804 bm!49436) bm!49431))

(assert (= (and b!1134822 c!110837) b!1134808))

(assert (= (and b!1134822 (not c!110837)) b!1134813))

(assert (= (and b!1134822 res!757553) b!1134795))

(assert (= (and b!1134822 (not res!757545)) b!1134819))

(assert (= (and b!1134819 (not res!757554)) b!1134798))

(assert (= (and b!1134798 (not res!757546)) b!1134814))

(assert (= (and b!1134821 condMapEmpty!44606) mapIsEmpty!44606))

(assert (= (and b!1134821 (not condMapEmpty!44606)) mapNonEmpty!44606))

(get-info :version)

(assert (= (and mapNonEmpty!44606 ((_ is ValueCellFull!13551) mapValue!44606)) b!1134806))

(assert (= (and b!1134821 ((_ is ValueCellFull!13551) mapDefault!44606)) b!1134800))

(assert (= start!98386 b!1134821))

(declare-fun b_lambda!19097 () Bool)

(assert (=> (not b_lambda!19097) (not b!1134810)))

(declare-fun t!35804 () Bool)

(declare-fun tb!8803 () Bool)

(assert (=> (and start!98386 (= defaultEntry!1004 defaultEntry!1004) t!35804) tb!8803))

(declare-fun result!18171 () Bool)

(assert (=> tb!8803 (= result!18171 tp_is_empty!28521)))

(assert (=> b!1134810 t!35804))

(declare-fun b_and!38833 () Bool)

(assert (= b_and!38831 (and (=> t!35804 result!18171) b_and!38833)))

(declare-fun m!1047513 () Bool)

(assert (=> b!1134792 m!1047513))

(declare-fun m!1047515 () Bool)

(assert (=> b!1134792 m!1047515))

(declare-fun m!1047517 () Bool)

(assert (=> b!1134808 m!1047517))

(declare-fun m!1047519 () Bool)

(assert (=> b!1134798 m!1047519))

(declare-fun m!1047521 () Bool)

(assert (=> b!1134810 m!1047521))

(declare-fun m!1047523 () Bool)

(assert (=> b!1134810 m!1047523))

(declare-fun m!1047525 () Bool)

(assert (=> b!1134810 m!1047525))

(declare-fun m!1047527 () Bool)

(assert (=> b!1134810 m!1047527))

(declare-fun m!1047529 () Bool)

(assert (=> bm!49438 m!1047529))

(declare-fun m!1047531 () Bool)

(assert (=> b!1134804 m!1047531))

(declare-fun m!1047533 () Bool)

(assert (=> b!1134804 m!1047533))

(declare-fun m!1047535 () Bool)

(assert (=> b!1134804 m!1047535))

(declare-fun m!1047537 () Bool)

(assert (=> b!1134818 m!1047537))

(declare-fun m!1047539 () Bool)

(assert (=> b!1134814 m!1047539))

(declare-fun m!1047541 () Bool)

(assert (=> b!1134822 m!1047541))

(declare-fun m!1047543 () Bool)

(assert (=> b!1134822 m!1047543))

(declare-fun m!1047545 () Bool)

(assert (=> b!1134822 m!1047545))

(declare-fun m!1047547 () Bool)

(assert (=> b!1134816 m!1047547))

(declare-fun m!1047549 () Bool)

(assert (=> b!1134816 m!1047549))

(declare-fun m!1047551 () Bool)

(assert (=> b!1134797 m!1047551))

(assert (=> b!1134795 m!1047517))

(declare-fun m!1047553 () Bool)

(assert (=> b!1134807 m!1047553))

(declare-fun m!1047555 () Bool)

(assert (=> start!98386 m!1047555))

(declare-fun m!1047557 () Bool)

(assert (=> start!98386 m!1047557))

(declare-fun m!1047559 () Bool)

(assert (=> b!1134819 m!1047559))

(declare-fun m!1047561 () Bool)

(assert (=> b!1134809 m!1047561))

(declare-fun m!1047563 () Bool)

(assert (=> bm!49431 m!1047563))

(declare-fun m!1047565 () Bool)

(assert (=> b!1134802 m!1047565))

(declare-fun m!1047567 () Bool)

(assert (=> b!1134802 m!1047567))

(declare-fun m!1047569 () Bool)

(assert (=> bm!49433 m!1047569))

(declare-fun m!1047571 () Bool)

(assert (=> b!1134794 m!1047571))

(declare-fun m!1047573 () Bool)

(assert (=> b!1134811 m!1047573))

(declare-fun m!1047575 () Bool)

(assert (=> mapNonEmpty!44606 m!1047575))

(declare-fun m!1047577 () Bool)

(assert (=> bm!49435 m!1047577))

(declare-fun m!1047579 () Bool)

(assert (=> bm!49437 m!1047579))

(declare-fun m!1047581 () Bool)

(assert (=> b!1134815 m!1047581))

(assert (=> b!1134815 m!1047577))

(declare-fun m!1047583 () Bool)

(assert (=> b!1134796 m!1047583))

(check-sat (not b!1134794) (not bm!49433) (not start!98386) (not b!1134802) (not bm!49435) (not b!1134797) (not b_next!23991) (not b_lambda!19097) tp_is_empty!28521 (not b!1134814) (not b!1134810) (not b!1134796) (not b!1134804) (not bm!49437) (not b!1134819) (not b!1134822) (not b!1134816) (not b!1134815) (not b!1134808) (not bm!49431) (not b!1134809) (not b!1134792) (not bm!49438) (not b!1134818) (not b!1134795) b_and!38833 (not mapNonEmpty!44606) (not b!1134798) (not b!1134807))
(check-sat b_and!38833 (not b_next!23991))
