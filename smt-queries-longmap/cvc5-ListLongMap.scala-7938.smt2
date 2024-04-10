; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98468 () Bool)

(assert start!98468)

(declare-fun b_free!24073 () Bool)

(declare-fun b_next!24073 () Bool)

(assert (=> start!98468 (= b_free!24073 (not b_next!24073))))

(declare-fun tp!84930 () Bool)

(declare-fun b_and!38995 () Bool)

(assert (=> start!98468 (= tp!84930 b_and!38995)))

(declare-fun mapIsEmpty!44729 () Bool)

(declare-fun mapRes!44729 () Bool)

(assert (=> mapIsEmpty!44729 mapRes!44729))

(declare-fun b!1138557 () Bool)

(declare-fun res!759498 () Bool)

(declare-fun e!647840 () Bool)

(assert (=> b!1138557 (=> (not res!759498) (not e!647840))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74065 0))(
  ( (array!74066 (arr!35683 (Array (_ BitVec 32) (_ BitVec 64))) (size!36219 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74065)

(assert (=> b!1138557 (= res!759498 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36219 _keys!1208))))))

(declare-fun b!1138558 () Bool)

(declare-fun e!647842 () Bool)

(declare-fun e!647843 () Bool)

(assert (=> b!1138558 (= e!647842 e!647843)))

(declare-fun res!759499 () Bool)

(assert (=> b!1138558 (=> res!759499 e!647843)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1138558 (= res!759499 (not (= (select (arr!35683 _keys!1208) from!1455) k!934)))))

(declare-fun e!647835 () Bool)

(assert (=> b!1138558 e!647835))

(declare-fun c!111520 () Bool)

(assert (=> b!1138558 (= c!111520 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43265 0))(
  ( (V!43266 (val!14358 Int)) )
))
(declare-fun zeroValue!944 () V!43265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13592 0))(
  ( (ValueCellFull!13592 (v!16995 V!43265)) (EmptyCell!13592) )
))
(declare-datatypes ((array!74067 0))(
  ( (array!74068 (arr!35684 (Array (_ BitVec 32) ValueCell!13592)) (size!36220 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74067)

(declare-fun minValue!944 () V!43265)

(declare-datatypes ((Unit!37302 0))(
  ( (Unit!37303) )
))
(declare-fun lt!506563 () Unit!37302)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!472 (array!74065 array!74067 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37302)

(assert (=> b!1138558 (= lt!506563 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!472 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50415 () Bool)

(declare-datatypes ((tuple2!18142 0))(
  ( (tuple2!18143 (_1!9082 (_ BitVec 64)) (_2!9082 V!43265)) )
))
(declare-datatypes ((List!24898 0))(
  ( (Nil!24895) (Cons!24894 (h!26103 tuple2!18142) (t!35963 List!24898)) )
))
(declare-datatypes ((ListLongMap!16111 0))(
  ( (ListLongMap!16112 (toList!8071 List!24898)) )
))
(declare-fun call!50419 () ListLongMap!16111)

(declare-fun call!50424 () ListLongMap!16111)

(assert (=> bm!50415 (= call!50419 call!50424)))

(declare-fun b!1138559 () Bool)

(declare-fun res!759506 () Bool)

(declare-fun e!647834 () Bool)

(assert (=> b!1138559 (=> (not res!759506) (not e!647834))))

(declare-fun lt!506566 () array!74065)

(declare-datatypes ((List!24899 0))(
  ( (Nil!24896) (Cons!24895 (h!26104 (_ BitVec 64)) (t!35964 List!24899)) )
))
(declare-fun arrayNoDuplicates!0 (array!74065 (_ BitVec 32) List!24899) Bool)

(assert (=> b!1138559 (= res!759506 (arrayNoDuplicates!0 lt!506566 #b00000000000000000000000000000000 Nil!24896))))

(declare-fun b!1138560 () Bool)

(declare-fun res!759508 () Bool)

(assert (=> b!1138560 (=> (not res!759508) (not e!647840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138560 (= res!759508 (validMask!0 mask!1564))))

(declare-fun bm!50416 () Bool)

(declare-fun call!50423 () Bool)

(declare-fun call!50425 () Bool)

(assert (=> bm!50416 (= call!50423 call!50425)))

(declare-fun b!1138561 () Bool)

(assert (=> b!1138561 (= e!647843 true)))

(declare-fun lt!506560 () Unit!37302)

(declare-fun e!647832 () Unit!37302)

(assert (=> b!1138561 (= lt!506560 e!647832)))

(declare-fun c!111519 () Bool)

(declare-fun lt!506558 () ListLongMap!16111)

(declare-fun contains!6607 (ListLongMap!16111 (_ BitVec 64)) Bool)

(assert (=> b!1138561 (= c!111519 (contains!6607 lt!506558 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4555 (array!74065 array!74067 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) Int) ListLongMap!16111)

(assert (=> b!1138561 (= lt!506558 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138563 () Bool)

(declare-fun e!647837 () Unit!37302)

(declare-fun lt!506557 () Unit!37302)

(assert (=> b!1138563 (= e!647837 lt!506557)))

(declare-fun call!50421 () Unit!37302)

(assert (=> b!1138563 (= lt!506557 call!50421)))

(assert (=> b!1138563 call!50423))

(declare-fun b!1138564 () Bool)

(declare-fun Unit!37304 () Unit!37302)

(assert (=> b!1138564 (= e!647832 Unit!37304)))

(declare-fun lt!506559 () Bool)

(assert (=> b!1138564 (= lt!506559 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111515 () Bool)

(assert (=> b!1138564 (= c!111515 (and (not lt!506559) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506569 () Unit!37302)

(declare-fun e!647847 () Unit!37302)

(assert (=> b!1138564 (= lt!506569 e!647847)))

(declare-fun lt!506564 () Unit!37302)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!365 (array!74065 array!74067 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 64) (_ BitVec 32) Int) Unit!37302)

(assert (=> b!1138564 (= lt!506564 (lemmaListMapContainsThenArrayContainsFrom!365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111518 () Bool)

(assert (=> b!1138564 (= c!111518 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759507 () Bool)

(declare-fun e!647841 () Bool)

(assert (=> b!1138564 (= res!759507 e!647841)))

(declare-fun e!647838 () Bool)

(assert (=> b!1138564 (=> (not res!759507) (not e!647838))))

(assert (=> b!1138564 e!647838))

(declare-fun lt!506571 () Unit!37302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74065 (_ BitVec 32) (_ BitVec 32)) Unit!37302)

(assert (=> b!1138564 (= lt!506571 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138564 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24896)))

(declare-fun lt!506567 () Unit!37302)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74065 (_ BitVec 64) (_ BitVec 32) List!24899) Unit!37302)

(assert (=> b!1138564 (= lt!506567 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24896))))

(assert (=> b!1138564 false))

(declare-fun b!1138565 () Bool)

(declare-fun e!647846 () Unit!37302)

(declare-fun Unit!37305 () Unit!37302)

(assert (=> b!1138565 (= e!647846 Unit!37305)))

(declare-fun b!1138566 () Bool)

(declare-fun res!759501 () Bool)

(assert (=> b!1138566 (=> (not res!759501) (not e!647840))))

(assert (=> b!1138566 (= res!759501 (and (= (size!36220 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36219 _keys!1208) (size!36220 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50417 () Bool)

(declare-fun call!50418 () ListLongMap!16111)

(assert (=> bm!50417 (= call!50418 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138567 () Bool)

(declare-fun e!647839 () Bool)

(declare-fun e!647836 () Bool)

(assert (=> b!1138567 (= e!647839 (and e!647836 mapRes!44729))))

(declare-fun condMapEmpty!44729 () Bool)

(declare-fun mapDefault!44729 () ValueCell!13592)

