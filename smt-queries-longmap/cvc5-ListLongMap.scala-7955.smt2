; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98570 () Bool)

(assert start!98570)

(declare-fun b_free!24175 () Bool)

(declare-fun b_next!24175 () Bool)

(assert (=> start!98570 (= b_free!24175 (not b_next!24175))))

(declare-fun tp!85236 () Bool)

(declare-fun b_and!39199 () Bool)

(assert (=> start!98570 (= tp!85236 b_and!39199)))

(declare-fun b!1143096 () Bool)

(declare-fun e!650293 () Bool)

(declare-fun e!650286 () Bool)

(assert (=> b!1143096 (= e!650293 e!650286)))

(declare-fun res!761647 () Bool)

(assert (=> b!1143096 (=> res!761647 e!650286)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143096 (= res!761647 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43401 0))(
  ( (V!43402 (val!14409 Int)) )
))
(declare-fun zeroValue!944 () V!43401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18238 0))(
  ( (tuple2!18239 (_1!9130 (_ BitVec 64)) (_2!9130 V!43401)) )
))
(declare-datatypes ((List!24991 0))(
  ( (Nil!24988) (Cons!24987 (h!26196 tuple2!18238) (t!36158 List!24991)) )
))
(declare-datatypes ((ListLongMap!16207 0))(
  ( (ListLongMap!16208 (toList!8119 List!24991)) )
))
(declare-fun lt!509723 () ListLongMap!16207)

(declare-datatypes ((array!74263 0))(
  ( (array!74264 (arr!35782 (Array (_ BitVec 32) (_ BitVec 64))) (size!36318 (_ BitVec 32))) )
))
(declare-fun lt!509721 () array!74263)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13643 0))(
  ( (ValueCellFull!13643 (v!17046 V!43401)) (EmptyCell!13643) )
))
(declare-datatypes ((array!74265 0))(
  ( (array!74266 (arr!35783 (Array (_ BitVec 32) ValueCell!13643)) (size!36319 (_ BitVec 32))) )
))
(declare-fun lt!509705 () array!74265)

(declare-fun minValue!944 () V!43401)

(declare-fun getCurrentListMapNoExtraKeys!4599 (array!74263 array!74265 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) Int) ListLongMap!16207)

(assert (=> b!1143096 (= lt!509723 (getCurrentListMapNoExtraKeys!4599 lt!509721 lt!509705 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509704 () V!43401)

(declare-fun _values!996 () array!74265)

(assert (=> b!1143096 (= lt!509705 (array!74266 (store (arr!35783 _values!996) i!673 (ValueCellFull!13643 lt!509704)) (size!36319 _values!996)))))

(declare-fun dynLambda!2638 (Int (_ BitVec 64)) V!43401)

(assert (=> b!1143096 (= lt!509704 (dynLambda!2638 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74263)

(declare-fun lt!509715 () ListLongMap!16207)

(assert (=> b!1143096 (= lt!509715 (getCurrentListMapNoExtraKeys!4599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143097 () Bool)

(declare-fun e!650283 () Bool)

(assert (=> b!1143097 (= e!650283 true)))

(declare-fun lt!509720 () ListLongMap!16207)

(declare-fun lt!509718 () V!43401)

(declare-fun -!1265 (ListLongMap!16207 (_ BitVec 64)) ListLongMap!16207)

(declare-fun +!3548 (ListLongMap!16207 tuple2!18238) ListLongMap!16207)

(assert (=> b!1143097 (= (-!1265 (+!3548 lt!509720 (tuple2!18239 (select (arr!35782 _keys!1208) from!1455) lt!509718)) (select (arr!35782 _keys!1208) from!1455)) lt!509720)))

(declare-datatypes ((Unit!37505 0))(
  ( (Unit!37506) )
))
(declare-fun lt!509714 () Unit!37505)

(declare-fun addThenRemoveForNewKeyIsSame!117 (ListLongMap!16207 (_ BitVec 64) V!43401) Unit!37505)

(assert (=> b!1143097 (= lt!509714 (addThenRemoveForNewKeyIsSame!117 lt!509720 (select (arr!35782 _keys!1208) from!1455) lt!509718))))

(declare-fun get!18189 (ValueCell!13643 V!43401) V!43401)

(assert (=> b!1143097 (= lt!509718 (get!18189 (select (arr!35783 _values!996) from!1455) lt!509704))))

(declare-fun lt!509717 () Unit!37505)

(declare-fun e!650294 () Unit!37505)

(assert (=> b!1143097 (= lt!509717 e!650294)))

(declare-fun c!112436 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6651 (ListLongMap!16207 (_ BitVec 64)) Bool)

(assert (=> b!1143097 (= c!112436 (contains!6651 lt!509720 k!934))))

(assert (=> b!1143097 (= lt!509720 (getCurrentListMapNoExtraKeys!4599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112437 () Bool)

(declare-fun bm!51639 () Bool)

(declare-fun lt!509711 () ListLongMap!16207)

(declare-fun c!112438 () Bool)

(declare-fun call!51642 () Unit!37505)

(declare-fun addStillContains!804 (ListLongMap!16207 (_ BitVec 64) V!43401 (_ BitVec 64)) Unit!37505)

(assert (=> bm!51639 (= call!51642 (addStillContains!804 (ite c!112437 lt!509711 lt!509720) (ite c!112437 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112438 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112437 minValue!944 (ite c!112438 zeroValue!944 minValue!944)) k!934))))

(declare-fun res!761646 () Bool)

(declare-fun e!650288 () Bool)

(assert (=> start!98570 (=> (not res!761646) (not e!650288))))

(assert (=> start!98570 (= res!761646 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36318 _keys!1208))))))

(assert (=> start!98570 e!650288))

(declare-fun tp_is_empty!28705 () Bool)

(assert (=> start!98570 tp_is_empty!28705))

(declare-fun array_inv!27418 (array!74263) Bool)

(assert (=> start!98570 (array_inv!27418 _keys!1208)))

(assert (=> start!98570 true))

(assert (=> start!98570 tp!85236))

(declare-fun e!650295 () Bool)

(declare-fun array_inv!27419 (array!74265) Bool)

(assert (=> start!98570 (and (array_inv!27419 _values!996) e!650295)))

(declare-fun b!1143098 () Bool)

(declare-fun e!650281 () Bool)

(assert (=> b!1143098 (= e!650281 tp_is_empty!28705)))

(declare-fun b!1143099 () Bool)

(declare-fun res!761640 () Bool)

(assert (=> b!1143099 (=> (not res!761640) (not e!650288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143099 (= res!761640 (validKeyInArray!0 k!934))))

(declare-fun b!1143100 () Bool)

(declare-fun e!650284 () Unit!37505)

(declare-fun Unit!37507 () Unit!37505)

(assert (=> b!1143100 (= e!650284 Unit!37507)))

(declare-fun b!1143101 () Bool)

(declare-fun e!650282 () Bool)

(assert (=> b!1143101 (= e!650282 tp_is_empty!28705)))

(declare-fun b!1143102 () Bool)

(declare-fun e!650290 () Unit!37505)

(declare-fun lt!509724 () Unit!37505)

(assert (=> b!1143102 (= e!650290 lt!509724)))

(declare-fun call!51645 () Unit!37505)

(assert (=> b!1143102 (= lt!509724 call!51645)))

(declare-fun call!51644 () Bool)

(assert (=> b!1143102 call!51644))

(declare-fun e!650289 () Bool)

(declare-fun lt!509712 () Bool)

(declare-fun b!1143103 () Bool)

(assert (=> b!1143103 (= e!650289 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509712) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143104 () Bool)

(declare-fun arrayContainsKey!0 (array!74263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143104 (= e!650289 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143105 () Bool)

(assert (=> b!1143105 (= c!112438 (and (not lt!509712) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650291 () Unit!37505)

(assert (=> b!1143105 (= e!650291 e!650290)))

(declare-fun mapNonEmpty!44882 () Bool)

(declare-fun mapRes!44882 () Bool)

(declare-fun tp!85235 () Bool)

(assert (=> mapNonEmpty!44882 (= mapRes!44882 (and tp!85235 e!650281))))

(declare-fun mapRest!44882 () (Array (_ BitVec 32) ValueCell!13643))

(declare-fun mapKey!44882 () (_ BitVec 32))

(declare-fun mapValue!44882 () ValueCell!13643)

(assert (=> mapNonEmpty!44882 (= (arr!35783 _values!996) (store mapRest!44882 mapKey!44882 mapValue!44882))))

(declare-fun b!1143106 () Bool)

(declare-fun res!761641 () Bool)

(declare-fun e!650280 () Bool)

(assert (=> b!1143106 (=> (not res!761641) (not e!650280))))

(declare-datatypes ((List!24992 0))(
  ( (Nil!24989) (Cons!24988 (h!26197 (_ BitVec 64)) (t!36159 List!24992)) )
))
(declare-fun arrayNoDuplicates!0 (array!74263 (_ BitVec 32) List!24992) Bool)

(assert (=> b!1143106 (= res!761641 (arrayNoDuplicates!0 lt!509721 #b00000000000000000000000000000000 Nil!24989))))

(declare-fun b!1143107 () Bool)

(assert (=> b!1143107 call!51644))

(declare-fun lt!509713 () Unit!37505)

(assert (=> b!1143107 (= lt!509713 call!51645)))

(assert (=> b!1143107 (= e!650284 lt!509713)))

(declare-fun call!51647 () ListLongMap!16207)

(declare-fun bm!51640 () Bool)

(declare-fun call!51643 () Bool)

(assert (=> bm!51640 (= call!51643 (contains!6651 (ite c!112437 lt!509711 call!51647) k!934))))

(declare-fun b!1143108 () Bool)

(assert (=> b!1143108 (= e!650290 e!650284)))

(declare-fun c!112434 () Bool)

(assert (=> b!1143108 (= c!112434 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509712))))

(declare-fun bm!51641 () Bool)

(declare-fun call!51646 () ListLongMap!16207)

(assert (=> bm!51641 (= call!51646 (getCurrentListMapNoExtraKeys!4599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51642 () Bool)

(assert (=> bm!51642 (= call!51645 call!51642)))

(declare-fun b!1143109 () Bool)

(declare-fun res!761644 () Bool)

(assert (=> b!1143109 (=> (not res!761644) (not e!650288))))

(assert (=> b!1143109 (= res!761644 (and (= (size!36319 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36318 _keys!1208) (size!36319 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143110 () Bool)

(declare-fun res!761648 () Bool)

(assert (=> b!1143110 (=> (not res!761648) (not e!650288))))

(assert (=> b!1143110 (= res!761648 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24989))))

(declare-fun b!1143111 () Bool)

(assert (=> b!1143111 (= e!650286 e!650283)))

(declare-fun res!761643 () Bool)

(assert (=> b!1143111 (=> res!761643 e!650283)))

(assert (=> b!1143111 (= res!761643 (not (= (select (arr!35782 _keys!1208) from!1455) k!934)))))

(declare-fun e!650292 () Bool)

(assert (=> b!1143111 e!650292))

(declare-fun c!112435 () Bool)

(assert (=> b!1143111 (= c!112435 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509722 () Unit!37505)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!507 (array!74263 array!74265 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37505)

(assert (=> b!1143111 (= lt!509722 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51649 () ListLongMap!16207)

(declare-fun bm!51643 () Bool)

(assert (=> bm!51643 (= call!51649 (+!3548 lt!509720 (ite (or c!112437 c!112438) (tuple2!18239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51644 () Bool)

(assert (=> bm!51644 (= call!51644 call!51643)))

(declare-fun mapIsEmpty!44882 () Bool)

(assert (=> mapIsEmpty!44882 mapRes!44882))

(declare-fun b!1143112 () Bool)

(declare-fun res!761639 () Bool)

(assert (=> b!1143112 (=> (not res!761639) (not e!650288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74263 (_ BitVec 32)) Bool)

(assert (=> b!1143112 (= res!761639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143113 () Bool)

(declare-fun Unit!37508 () Unit!37505)

(assert (=> b!1143113 (= e!650294 Unit!37508)))

(assert (=> b!1143113 (= lt!509712 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143113 (= c!112437 (and (not lt!509712) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509719 () Unit!37505)

(assert (=> b!1143113 (= lt!509719 e!650291)))

(declare-fun lt!509706 () Unit!37505)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!398 (array!74263 array!74265 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 64) (_ BitVec 32) Int) Unit!37505)

(assert (=> b!1143113 (= lt!509706 (lemmaListMapContainsThenArrayContainsFrom!398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112433 () Bool)

(assert (=> b!1143113 (= c!112433 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761649 () Bool)

(assert (=> b!1143113 (= res!761649 e!650289)))

(declare-fun e!650285 () Bool)

(assert (=> b!1143113 (=> (not res!761649) (not e!650285))))

(assert (=> b!1143113 e!650285))

(declare-fun lt!509716 () Unit!37505)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74263 (_ BitVec 32) (_ BitVec 32)) Unit!37505)

(assert (=> b!1143113 (= lt!509716 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143113 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24989)))

(declare-fun lt!509707 () Unit!37505)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74263 (_ BitVec 64) (_ BitVec 32) List!24992) Unit!37505)

(assert (=> b!1143113 (= lt!509707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24989))))

(assert (=> b!1143113 false))

(declare-fun b!1143114 () Bool)

(assert (=> b!1143114 (= e!650295 (and e!650282 mapRes!44882))))

(declare-fun condMapEmpty!44882 () Bool)

(declare-fun mapDefault!44882 () ValueCell!13643)

