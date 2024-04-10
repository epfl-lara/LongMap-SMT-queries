; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98492 () Bool)

(assert start!98492)

(declare-fun b_free!24097 () Bool)

(declare-fun b_next!24097 () Bool)

(assert (=> start!98492 (= b_free!24097 (not b_next!24097))))

(declare-fun tp!85002 () Bool)

(declare-fun b_and!39043 () Bool)

(assert (=> start!98492 (= tp!85002 b_and!39043)))

(declare-datatypes ((V!43297 0))(
  ( (V!43298 (val!14370 Int)) )
))
(declare-fun zeroValue!944 () V!43297)

(declare-datatypes ((Unit!37355 0))(
  ( (Unit!37356) )
))
(declare-fun call!50708 () Unit!37355)

(declare-fun bm!50703 () Bool)

(declare-datatypes ((tuple2!18166 0))(
  ( (tuple2!18167 (_1!9094 (_ BitVec 64)) (_2!9094 V!43297)) )
))
(declare-datatypes ((List!24922 0))(
  ( (Nil!24919) (Cons!24918 (h!26127 tuple2!18166) (t!36011 List!24922)) )
))
(declare-datatypes ((ListLongMap!16135 0))(
  ( (ListLongMap!16136 (toList!8083 List!24922)) )
))
(declare-fun lt!507264 () ListLongMap!16135)

(declare-fun minValue!944 () V!43297)

(declare-fun lt!507258 () ListLongMap!16135)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!111736 () Bool)

(declare-fun c!111733 () Bool)

(declare-fun addStillContains!773 (ListLongMap!16135 (_ BitVec 64) V!43297 (_ BitVec 64)) Unit!37355)

(assert (=> bm!50703 (= call!50708 (addStillContains!773 (ite c!111733 lt!507258 lt!507264) (ite c!111733 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111736 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111733 minValue!944 (ite c!111736 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1139625 () Bool)

(declare-fun e!648410 () Bool)

(declare-fun e!648418 () Bool)

(assert (=> b!1139625 (= e!648410 e!648418)))

(declare-fun res!760010 () Bool)

(assert (=> b!1139625 (=> res!760010 e!648418)))

(declare-datatypes ((array!74113 0))(
  ( (array!74114 (arr!35707 (Array (_ BitVec 32) (_ BitVec 64))) (size!36243 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74113)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139625 (= res!760010 (not (= (select (arr!35707 _keys!1208) from!1455) k!934)))))

(declare-fun e!648423 () Bool)

(assert (=> b!1139625 e!648423))

(declare-fun c!111732 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139625 (= c!111732 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507267 () Unit!37355)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13604 0))(
  ( (ValueCellFull!13604 (v!17007 V!43297)) (EmptyCell!13604) )
))
(declare-datatypes ((array!74115 0))(
  ( (array!74116 (arr!35708 (Array (_ BitVec 32) ValueCell!13604)) (size!36244 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74115)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!481 (array!74113 array!74115 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37355)

(assert (=> b!1139625 (= lt!507267 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139626 () Bool)

(declare-fun e!648416 () Unit!37355)

(declare-fun e!648417 () Unit!37355)

(assert (=> b!1139626 (= e!648416 e!648417)))

(declare-fun c!111731 () Bool)

(declare-fun lt!507255 () Bool)

(assert (=> b!1139626 (= c!111731 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507255))))

(declare-fun b!1139627 () Bool)

(declare-fun res!760007 () Bool)

(declare-fun e!648408 () Bool)

(assert (=> b!1139627 (=> (not res!760007) (not e!648408))))

(assert (=> b!1139627 (= res!760007 (and (= (size!36244 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36243 _keys!1208) (size!36244 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!50709 () ListLongMap!16135)

(declare-fun b!1139628 () Bool)

(declare-fun call!50711 () ListLongMap!16135)

(declare-fun -!1234 (ListLongMap!16135 (_ BitVec 64)) ListLongMap!16135)

(assert (=> b!1139628 (= e!648423 (= call!50711 (-!1234 call!50709 k!934)))))

(declare-fun b!1139629 () Bool)

(declare-fun res!760003 () Bool)

(assert (=> b!1139629 (=> (not res!760003) (not e!648408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139629 (= res!760003 (validKeyInArray!0 k!934))))

(declare-fun bm!50704 () Bool)

(declare-fun call!50712 () Unit!37355)

(assert (=> bm!50704 (= call!50712 call!50708)))

(declare-fun b!1139631 () Bool)

(declare-fun e!648411 () Bool)

(declare-fun tp_is_empty!28627 () Bool)

(assert (=> b!1139631 (= e!648411 tp_is_empty!28627)))

(declare-fun mapNonEmpty!44765 () Bool)

(declare-fun mapRes!44765 () Bool)

(declare-fun tp!85001 () Bool)

(declare-fun e!648414 () Bool)

(assert (=> mapNonEmpty!44765 (= mapRes!44765 (and tp!85001 e!648414))))

(declare-fun mapValue!44765 () ValueCell!13604)

(declare-fun mapKey!44765 () (_ BitVec 32))

(declare-fun mapRest!44765 () (Array (_ BitVec 32) ValueCell!13604))

(assert (=> mapNonEmpty!44765 (= (arr!35708 _values!996) (store mapRest!44765 mapKey!44765 mapValue!44765))))

(declare-fun b!1139632 () Bool)

(declare-fun res!760004 () Bool)

(assert (=> b!1139632 (=> (not res!760004) (not e!648408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74113 (_ BitVec 32)) Bool)

(assert (=> b!1139632 (= res!760004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139633 () Bool)

(declare-fun contains!6618 (ListLongMap!16135 (_ BitVec 64)) Bool)

(declare-fun +!3515 (ListLongMap!16135 tuple2!18166) ListLongMap!16135)

(assert (=> b!1139633 (contains!6618 (+!3515 lt!507258 (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!507257 () Unit!37355)

(assert (=> b!1139633 (= lt!507257 call!50708)))

(declare-fun call!50706 () Bool)

(assert (=> b!1139633 call!50706))

(declare-fun call!50707 () ListLongMap!16135)

(assert (=> b!1139633 (= lt!507258 call!50707)))

(declare-fun lt!507253 () Unit!37355)

(assert (=> b!1139633 (= lt!507253 (addStillContains!773 lt!507264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!648413 () Unit!37355)

(assert (=> b!1139633 (= e!648413 lt!507257)))

(declare-fun b!1139634 () Bool)

(declare-fun e!648415 () Bool)

(declare-fun arrayContainsKey!0 (array!74113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139634 (= e!648415 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139635 () Bool)

(declare-fun e!648409 () Bool)

(assert (=> b!1139635 (= e!648408 e!648409)))

(declare-fun res!760008 () Bool)

(assert (=> b!1139635 (=> (not res!760008) (not e!648409))))

(declare-fun lt!507256 () array!74113)

(assert (=> b!1139635 (= res!760008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507256 mask!1564))))

(assert (=> b!1139635 (= lt!507256 (array!74114 (store (arr!35707 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36243 _keys!1208)))))

(declare-fun b!1139636 () Bool)

(declare-fun res!760000 () Bool)

(assert (=> b!1139636 (=> (not res!760000) (not e!648408))))

(assert (=> b!1139636 (= res!760000 (= (select (arr!35707 _keys!1208) i!673) k!934))))

(declare-fun b!1139637 () Bool)

(declare-fun res!760002 () Bool)

(assert (=> b!1139637 (=> (not res!760002) (not e!648408))))

(declare-datatypes ((List!24923 0))(
  ( (Nil!24920) (Cons!24919 (h!26128 (_ BitVec 64)) (t!36012 List!24923)) )
))
(declare-fun arrayNoDuplicates!0 (array!74113 (_ BitVec 32) List!24923) Bool)

(assert (=> b!1139637 (= res!760002 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24920))))

(declare-fun bm!50705 () Bool)

(assert (=> bm!50705 (= call!50707 (+!3515 lt!507264 (ite (or c!111733 c!111736) (tuple2!18167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!50706 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4566 (array!74113 array!74115 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 32) Int) ListLongMap!16135)

(assert (=> bm!50706 (= call!50709 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50707 () Bool)

(declare-fun lt!507259 () array!74115)

(assert (=> bm!50707 (= call!50711 (getCurrentListMapNoExtraKeys!4566 lt!507256 lt!507259 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139638 () Bool)

(declare-fun res!760011 () Bool)

(assert (=> b!1139638 (=> (not res!760011) (not e!648408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139638 (= res!760011 (validMask!0 mask!1564))))

(declare-fun b!1139639 () Bool)

(declare-fun e!648412 () Bool)

(assert (=> b!1139639 (= e!648412 e!648410)))

(declare-fun res!760012 () Bool)

(assert (=> b!1139639 (=> res!760012 e!648410)))

(assert (=> b!1139639 (= res!760012 (not (= from!1455 i!673)))))

(declare-fun lt!507261 () ListLongMap!16135)

(assert (=> b!1139639 (= lt!507261 (getCurrentListMapNoExtraKeys!4566 lt!507256 lt!507259 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507249 () V!43297)

(assert (=> b!1139639 (= lt!507259 (array!74116 (store (arr!35708 _values!996) i!673 (ValueCellFull!13604 lt!507249)) (size!36244 _values!996)))))

(declare-fun dynLambda!2615 (Int (_ BitVec 64)) V!43297)

(assert (=> b!1139639 (= lt!507249 (dynLambda!2615 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507263 () ListLongMap!16135)

(assert (=> b!1139639 (= lt!507263 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139640 () Bool)

(declare-fun e!648420 () Bool)

(assert (=> b!1139640 (= e!648420 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139641 () Bool)

(declare-fun e!648421 () Unit!37355)

(declare-fun Unit!37357 () Unit!37355)

(assert (=> b!1139641 (= e!648421 Unit!37357)))

(declare-fun bm!50708 () Bool)

(declare-fun call!50710 () ListLongMap!16135)

(assert (=> bm!50708 (= call!50706 (contains!6618 (ite c!111733 lt!507258 call!50710) k!934))))

(declare-fun b!1139642 () Bool)

(declare-fun call!50713 () Bool)

(assert (=> b!1139642 call!50713))

(declare-fun lt!507265 () Unit!37355)

(assert (=> b!1139642 (= lt!507265 call!50712)))

(assert (=> b!1139642 (= e!648417 lt!507265)))

(declare-fun b!1139643 () Bool)

(assert (=> b!1139643 (= e!648423 (= call!50711 call!50709))))

(declare-fun mapIsEmpty!44765 () Bool)

(assert (=> mapIsEmpty!44765 mapRes!44765))

(declare-fun b!1139644 () Bool)

(assert (=> b!1139644 (= e!648418 true)))

(declare-fun lt!507252 () V!43297)

(assert (=> b!1139644 (= (-!1234 (+!3515 lt!507264 (tuple2!18167 (select (arr!35707 _keys!1208) from!1455) lt!507252)) (select (arr!35707 _keys!1208) from!1455)) lt!507264)))

(declare-fun lt!507262 () Unit!37355)

(declare-fun addThenRemoveForNewKeyIsSame!89 (ListLongMap!16135 (_ BitVec 64) V!43297) Unit!37355)

(assert (=> b!1139644 (= lt!507262 (addThenRemoveForNewKeyIsSame!89 lt!507264 (select (arr!35707 _keys!1208) from!1455) lt!507252))))

(declare-fun get!18135 (ValueCell!13604 V!43297) V!43297)

(assert (=> b!1139644 (= lt!507252 (get!18135 (select (arr!35708 _values!996) from!1455) lt!507249))))

(declare-fun lt!507266 () Unit!37355)

(assert (=> b!1139644 (= lt!507266 e!648421)))

(declare-fun c!111735 () Bool)

(assert (=> b!1139644 (= c!111735 (contains!6618 lt!507264 k!934))))

(assert (=> b!1139644 (= lt!507264 (getCurrentListMapNoExtraKeys!4566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50709 () Bool)

(assert (=> bm!50709 (= call!50713 call!50706)))

(declare-fun b!1139645 () Bool)

(declare-fun lt!507260 () Unit!37355)

(assert (=> b!1139645 (= e!648416 lt!507260)))

(assert (=> b!1139645 (= lt!507260 call!50712)))

(assert (=> b!1139645 call!50713))

(declare-fun bm!50710 () Bool)

(assert (=> bm!50710 (= call!50710 call!50707)))

(declare-fun res!760001 () Bool)

(assert (=> start!98492 (=> (not res!760001) (not e!648408))))

(assert (=> start!98492 (= res!760001 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36243 _keys!1208))))))

(assert (=> start!98492 e!648408))

(assert (=> start!98492 tp_is_empty!28627))

(declare-fun array_inv!27370 (array!74113) Bool)

(assert (=> start!98492 (array_inv!27370 _keys!1208)))

(assert (=> start!98492 true))

(assert (=> start!98492 tp!85002))

(declare-fun e!648422 () Bool)

(declare-fun array_inv!27371 (array!74115) Bool)

(assert (=> start!98492 (and (array_inv!27371 _values!996) e!648422)))

(declare-fun b!1139630 () Bool)

(declare-fun Unit!37358 () Unit!37355)

(assert (=> b!1139630 (= e!648417 Unit!37358)))

(declare-fun b!1139646 () Bool)

(declare-fun Unit!37359 () Unit!37355)

(assert (=> b!1139646 (= e!648421 Unit!37359)))

(assert (=> b!1139646 (= lt!507255 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139646 (= c!111733 (and (not lt!507255) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507248 () Unit!37355)

(assert (=> b!1139646 (= lt!507248 e!648413)))

(declare-fun lt!507251 () Unit!37355)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!374 (array!74113 array!74115 (_ BitVec 32) (_ BitVec 32) V!43297 V!43297 (_ BitVec 64) (_ BitVec 32) Int) Unit!37355)

(assert (=> b!1139646 (= lt!507251 (lemmaListMapContainsThenArrayContainsFrom!374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111734 () Bool)

(assert (=> b!1139646 (= c!111734 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760005 () Bool)

(assert (=> b!1139646 (= res!760005 e!648420)))

(assert (=> b!1139646 (=> (not res!760005) (not e!648415))))

(assert (=> b!1139646 e!648415))

(declare-fun lt!507250 () Unit!37355)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74113 (_ BitVec 32) (_ BitVec 32)) Unit!37355)

(assert (=> b!1139646 (= lt!507250 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139646 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24920)))

(declare-fun lt!507247 () Unit!37355)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74113 (_ BitVec 64) (_ BitVec 32) List!24923) Unit!37355)

(assert (=> b!1139646 (= lt!507247 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24920))))

(assert (=> b!1139646 false))

(declare-fun b!1139647 () Bool)

(assert (=> b!1139647 (= e!648409 (not e!648412))))

(declare-fun res!760006 () Bool)

(assert (=> b!1139647 (=> res!760006 e!648412)))

(assert (=> b!1139647 (= res!760006 (bvsgt from!1455 i!673))))

(assert (=> b!1139647 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507254 () Unit!37355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74113 (_ BitVec 64) (_ BitVec 32)) Unit!37355)

(assert (=> b!1139647 (= lt!507254 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139648 () Bool)

(declare-fun res!760013 () Bool)

(assert (=> b!1139648 (=> (not res!760013) (not e!648409))))

(assert (=> b!1139648 (= res!760013 (arrayNoDuplicates!0 lt!507256 #b00000000000000000000000000000000 Nil!24920))))

(declare-fun b!1139649 () Bool)

(declare-fun res!760009 () Bool)

(assert (=> b!1139649 (=> (not res!760009) (not e!648408))))

(assert (=> b!1139649 (= res!760009 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36243 _keys!1208))))))

(declare-fun b!1139650 () Bool)

(assert (=> b!1139650 (= c!111736 (and (not lt!507255) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139650 (= e!648413 e!648416)))

(declare-fun b!1139651 () Bool)

(assert (=> b!1139651 (= e!648422 (and e!648411 mapRes!44765))))

(declare-fun condMapEmpty!44765 () Bool)

(declare-fun mapDefault!44765 () ValueCell!13604)

