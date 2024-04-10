; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98916 () Bool)

(assert start!98916)

(declare-fun b_free!24521 () Bool)

(declare-fun b_next!24521 () Bool)

(assert (=> start!98916 (= b_free!24521 (not b_next!24521))))

(declare-fun tp!86274 () Bool)

(declare-fun b_and!39891 () Bool)

(assert (=> start!98916 (= tp!86274 b_and!39891)))

(declare-fun b!1158978 () Bool)

(declare-fun res!769398 () Bool)

(declare-fun e!659080 () Bool)

(assert (=> b!1158978 (=> (not res!769398) (not e!659080))))

(declare-datatypes ((array!74943 0))(
  ( (array!74944 (arr!36122 (Array (_ BitVec 32) (_ BitVec 64))) (size!36658 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74943)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43861 0))(
  ( (V!43862 (val!14582 Int)) )
))
(declare-datatypes ((ValueCell!13816 0))(
  ( (ValueCellFull!13816 (v!17219 V!43861)) (EmptyCell!13816) )
))
(declare-datatypes ((array!74945 0))(
  ( (array!74946 (arr!36123 (Array (_ BitVec 32) ValueCell!13816)) (size!36659 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74945)

(assert (=> b!1158978 (= res!769398 (and (= (size!36659 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36658 _keys!1208) (size!36659 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158979 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!520930 () Bool)

(declare-fun e!659085 () Bool)

(assert (=> b!1158979 (= e!659085 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158980 () Bool)

(declare-fun e!659077 () Bool)

(assert (=> b!1158980 (= e!659077 true)))

(declare-fun e!659072 () Bool)

(assert (=> b!1158980 e!659072))

(declare-fun res!769392 () Bool)

(assert (=> b!1158980 (=> (not res!769392) (not e!659072))))

(declare-datatypes ((tuple2!18564 0))(
  ( (tuple2!18565 (_1!9293 (_ BitVec 64)) (_2!9293 V!43861)) )
))
(declare-datatypes ((List!25302 0))(
  ( (Nil!25299) (Cons!25298 (h!26507 tuple2!18564) (t!36815 List!25302)) )
))
(declare-datatypes ((ListLongMap!16533 0))(
  ( (ListLongMap!16534 (toList!8282 List!25302)) )
))
(declare-fun lt!520947 () ListLongMap!16533)

(declare-fun lt!520941 () ListLongMap!16533)

(assert (=> b!1158980 (= res!769392 (= lt!520947 lt!520941))))

(declare-fun lt!520931 () ListLongMap!16533)

(declare-fun -!1393 (ListLongMap!16533 (_ BitVec 64)) ListLongMap!16533)

(assert (=> b!1158980 (= lt!520947 (-!1393 lt!520931 k!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!520926 () V!43861)

(declare-fun +!3690 (ListLongMap!16533 tuple2!18564) ListLongMap!16533)

(assert (=> b!1158980 (= (-!1393 (+!3690 lt!520941 (tuple2!18565 (select (arr!36122 _keys!1208) from!1455) lt!520926)) (select (arr!36122 _keys!1208) from!1455)) lt!520941)))

(declare-datatypes ((Unit!38192 0))(
  ( (Unit!38193) )
))
(declare-fun lt!520942 () Unit!38192)

(declare-fun addThenRemoveForNewKeyIsSame!229 (ListLongMap!16533 (_ BitVec 64) V!43861) Unit!38192)

(assert (=> b!1158980 (= lt!520942 (addThenRemoveForNewKeyIsSame!229 lt!520941 (select (arr!36122 _keys!1208) from!1455) lt!520926))))

(declare-fun lt!520932 () V!43861)

(declare-fun get!18415 (ValueCell!13816 V!43861) V!43861)

(assert (=> b!1158980 (= lt!520926 (get!18415 (select (arr!36123 _values!996) from!1455) lt!520932))))

(declare-fun lt!520936 () Unit!38192)

(declare-fun e!659084 () Unit!38192)

(assert (=> b!1158980 (= lt!520936 e!659084)))

(declare-fun c!115547 () Bool)

(declare-fun contains!6791 (ListLongMap!16533 (_ BitVec 64)) Bool)

(assert (=> b!1158980 (= c!115547 (contains!6791 lt!520941 k!934))))

(declare-fun zeroValue!944 () V!43861)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43861)

(declare-fun getCurrentListMapNoExtraKeys!4746 (array!74943 array!74945 (_ BitVec 32) (_ BitVec 32) V!43861 V!43861 (_ BitVec 32) Int) ListLongMap!16533)

(assert (=> b!1158980 (= lt!520941 (getCurrentListMapNoExtraKeys!4746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158981 () Bool)

(declare-fun Unit!38194 () Unit!38192)

(assert (=> b!1158981 (= e!659084 Unit!38194)))

(assert (=> b!1158981 (= lt!520930 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115551 () Bool)

(assert (=> b!1158981 (= c!115551 (and (not lt!520930) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520933 () Unit!38192)

(declare-fun e!659073 () Unit!38192)

(assert (=> b!1158981 (= lt!520933 e!659073)))

(declare-fun lt!520935 () Unit!38192)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!517 (array!74943 array!74945 (_ BitVec 32) (_ BitVec 32) V!43861 V!43861 (_ BitVec 64) (_ BitVec 32) Int) Unit!38192)

(assert (=> b!1158981 (= lt!520935 (lemmaListMapContainsThenArrayContainsFrom!517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115549 () Bool)

(assert (=> b!1158981 (= c!115549 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769395 () Bool)

(assert (=> b!1158981 (= res!769395 e!659085)))

(declare-fun e!659069 () Bool)

(assert (=> b!1158981 (=> (not res!769395) (not e!659069))))

(assert (=> b!1158981 e!659069))

(declare-fun lt!520940 () Unit!38192)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74943 (_ BitVec 32) (_ BitVec 32)) Unit!38192)

(assert (=> b!1158981 (= lt!520940 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25303 0))(
  ( (Nil!25300) (Cons!25299 (h!26508 (_ BitVec 64)) (t!36816 List!25303)) )
))
(declare-fun arrayNoDuplicates!0 (array!74943 (_ BitVec 32) List!25303) Bool)

(assert (=> b!1158981 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25300)))

(declare-fun lt!520927 () Unit!38192)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74943 (_ BitVec 64) (_ BitVec 32) List!25303) Unit!38192)

(assert (=> b!1158981 (= lt!520927 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25300))))

(assert (=> b!1158981 false))

(declare-fun bm!55791 () Bool)

(declare-fun call!55796 () Unit!38192)

(declare-fun lt!520943 () ListLongMap!16533)

(declare-fun c!115552 () Bool)

(declare-fun addStillContains!932 (ListLongMap!16533 (_ BitVec 64) V!43861 (_ BitVec 64)) Unit!38192)

(assert (=> bm!55791 (= call!55796 (addStillContains!932 (ite c!115551 lt!520943 lt!520941) (ite c!115551 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115552 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115551 minValue!944 (ite c!115552 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1158982 () Bool)

(declare-fun call!55799 () ListLongMap!16533)

(assert (=> b!1158982 (contains!6791 call!55799 k!934)))

(declare-fun lt!520944 () Unit!38192)

(assert (=> b!1158982 (= lt!520944 call!55796)))

(declare-fun call!55795 () Bool)

(assert (=> b!1158982 call!55795))

(assert (=> b!1158982 (= lt!520943 (+!3690 lt!520941 (tuple2!18565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520928 () Unit!38192)

(assert (=> b!1158982 (= lt!520928 (addStillContains!932 lt!520941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1158982 (= e!659073 lt!520944)))

(declare-fun bm!55792 () Bool)

(assert (=> bm!55792 (= call!55799 (+!3690 (ite c!115551 lt!520943 lt!520941) (ite c!115551 (tuple2!18565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115552 (tuple2!18565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158983 () Bool)

(declare-fun e!659078 () Unit!38192)

(declare-fun lt!520937 () Unit!38192)

(assert (=> b!1158983 (= e!659078 lt!520937)))

(declare-fun call!55797 () Unit!38192)

(assert (=> b!1158983 (= lt!520937 call!55797)))

(declare-fun call!55798 () Bool)

(assert (=> b!1158983 call!55798))

(declare-fun b!1158984 () Bool)

(declare-fun res!769397 () Bool)

(assert (=> b!1158984 (=> (not res!769397) (not e!659080))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158984 (= res!769397 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36658 _keys!1208))))))

(declare-fun call!55801 () ListLongMap!16533)

(declare-fun lt!520945 () array!74945)

(declare-fun bm!55793 () Bool)

(declare-fun lt!520934 () array!74943)

(assert (=> bm!55793 (= call!55801 (getCurrentListMapNoExtraKeys!4746 lt!520934 lt!520945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158985 () Bool)

(declare-fun res!769400 () Bool)

(declare-fun e!659076 () Bool)

(assert (=> b!1158985 (=> (not res!769400) (not e!659076))))

(assert (=> b!1158985 (= res!769400 (arrayNoDuplicates!0 lt!520934 #b00000000000000000000000000000000 Nil!25300))))

(declare-fun bm!55794 () Bool)

(assert (=> bm!55794 (= call!55798 call!55795)))

(declare-fun b!1158986 () Bool)

(declare-fun e!659070 () Bool)

(declare-fun call!55800 () ListLongMap!16533)

(assert (=> b!1158986 (= e!659070 (= call!55801 call!55800))))

(declare-fun b!1158987 () Bool)

(declare-fun res!769396 () Bool)

(assert (=> b!1158987 (=> (not res!769396) (not e!659080))))

(assert (=> b!1158987 (= res!769396 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25300))))

(declare-fun b!1158988 () Bool)

(declare-fun Unit!38195 () Unit!38192)

(assert (=> b!1158988 (= e!659084 Unit!38195)))

(declare-fun b!1158989 () Bool)

(assert (=> b!1158989 (= e!659072 (= lt!520947 (getCurrentListMapNoExtraKeys!4746 lt!520934 lt!520945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158990 () Bool)

(declare-fun arrayContainsKey!0 (array!74943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158990 (= e!659069 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158991 () Bool)

(declare-fun res!769402 () Bool)

(assert (=> b!1158991 (=> (not res!769402) (not e!659080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158991 (= res!769402 (validKeyInArray!0 k!934))))

(declare-fun b!1158992 () Bool)

(declare-fun e!659081 () Unit!38192)

(assert (=> b!1158992 (= e!659078 e!659081)))

(declare-fun c!115550 () Bool)

(assert (=> b!1158992 (= c!115550 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520930))))

(declare-fun b!1158993 () Bool)

(declare-fun e!659071 () Bool)

(declare-fun tp_is_empty!29051 () Bool)

(assert (=> b!1158993 (= e!659071 tp_is_empty!29051)))

(declare-fun b!1158994 () Bool)

(declare-fun e!659079 () Bool)

(assert (=> b!1158994 (= e!659076 (not e!659079))))

(declare-fun res!769394 () Bool)

(assert (=> b!1158994 (=> res!769394 e!659079)))

(assert (=> b!1158994 (= res!769394 (bvsgt from!1455 i!673))))

(assert (=> b!1158994 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!520938 () Unit!38192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74943 (_ BitVec 64) (_ BitVec 32)) Unit!38192)

(assert (=> b!1158994 (= lt!520938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1158995 () Bool)

(declare-fun e!659074 () Bool)

(assert (=> b!1158995 (= e!659074 tp_is_empty!29051)))

(declare-fun bm!55795 () Bool)

(assert (=> bm!55795 (= call!55797 call!55796)))

(declare-fun b!1158996 () Bool)

(assert (=> b!1158996 (= e!659070 (= call!55801 (-!1393 call!55800 k!934)))))

(declare-fun b!1158997 () Bool)

(assert (=> b!1158997 (= e!659080 e!659076)))

(declare-fun res!769401 () Bool)

(assert (=> b!1158997 (=> (not res!769401) (not e!659076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74943 (_ BitVec 32)) Bool)

(assert (=> b!1158997 (= res!769401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520934 mask!1564))))

(assert (=> b!1158997 (= lt!520934 (array!74944 (store (arr!36122 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36658 _keys!1208)))))

(declare-fun b!1158998 () Bool)

(assert (=> b!1158998 (= e!659085 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45401 () Bool)

(declare-fun mapRes!45401 () Bool)

(assert (=> mapIsEmpty!45401 mapRes!45401))

(declare-fun b!1158999 () Bool)

(assert (=> b!1158999 (= c!115552 (and (not lt!520930) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158999 (= e!659073 e!659078)))

(declare-fun b!1159000 () Bool)

(declare-fun res!769391 () Bool)

(assert (=> b!1159000 (=> (not res!769391) (not e!659080))))

(assert (=> b!1159000 (= res!769391 (= (select (arr!36122 _keys!1208) i!673) k!934))))

(declare-fun b!1159001 () Bool)

(declare-fun e!659075 () Bool)

(assert (=> b!1159001 (= e!659079 e!659075)))

(declare-fun res!769393 () Bool)

(assert (=> b!1159001 (=> res!769393 e!659075)))

(assert (=> b!1159001 (= res!769393 (not (= from!1455 i!673)))))

(declare-fun lt!520929 () ListLongMap!16533)

(assert (=> b!1159001 (= lt!520929 (getCurrentListMapNoExtraKeys!4746 lt!520934 lt!520945 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1159001 (= lt!520945 (array!74946 (store (arr!36123 _values!996) i!673 (ValueCellFull!13816 lt!520932)) (size!36659 _values!996)))))

(declare-fun dynLambda!2750 (Int (_ BitVec 64)) V!43861)

(assert (=> b!1159001 (= lt!520932 (dynLambda!2750 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1159001 (= lt!520931 (getCurrentListMapNoExtraKeys!4746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159002 () Bool)

(assert (=> b!1159002 (= e!659075 e!659077)))

(declare-fun res!769399 () Bool)

(assert (=> b!1159002 (=> res!769399 e!659077)))

(assert (=> b!1159002 (= res!769399 (not (= (select (arr!36122 _keys!1208) from!1455) k!934)))))

(assert (=> b!1159002 e!659070))

(declare-fun c!115548 () Bool)

(assert (=> b!1159002 (= c!115548 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520939 () Unit!38192)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!624 (array!74943 array!74945 (_ BitVec 32) (_ BitVec 32) V!43861 V!43861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38192)

(assert (=> b!1159002 (= lt!520939 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55796 () Bool)

(assert (=> bm!55796 (= call!55800 (getCurrentListMapNoExtraKeys!4746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!769403 () Bool)

(assert (=> start!98916 (=> (not res!769403) (not e!659080))))

(assert (=> start!98916 (= res!769403 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36658 _keys!1208))))))

(assert (=> start!98916 e!659080))

(assert (=> start!98916 tp_is_empty!29051))

(declare-fun array_inv!27642 (array!74943) Bool)

(assert (=> start!98916 (array_inv!27642 _keys!1208)))

(assert (=> start!98916 true))

(assert (=> start!98916 tp!86274))

(declare-fun e!659082 () Bool)

(declare-fun array_inv!27643 (array!74945) Bool)

(assert (=> start!98916 (and (array_inv!27643 _values!996) e!659082)))

(declare-fun b!1159003 () Bool)

(declare-fun Unit!38196 () Unit!38192)

(assert (=> b!1159003 (= e!659081 Unit!38196)))

(declare-fun b!1159004 () Bool)

(assert (=> b!1159004 (= e!659082 (and e!659074 mapRes!45401))))

(declare-fun condMapEmpty!45401 () Bool)

(declare-fun mapDefault!45401 () ValueCell!13816)

