; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98946 () Bool)

(assert start!98946)

(declare-fun b_free!24551 () Bool)

(declare-fun b_next!24551 () Bool)

(assert (=> start!98946 (= b_free!24551 (not b_next!24551))))

(declare-fun tp!86364 () Bool)

(declare-fun b_and!39951 () Bool)

(assert (=> start!98946 (= tp!86364 b_and!39951)))

(declare-fun b!1160358 () Bool)

(declare-fun e!659840 () Bool)

(declare-fun e!659850 () Bool)

(assert (=> b!1160358 (= e!659840 e!659850)))

(declare-fun res!770066 () Bool)

(assert (=> b!1160358 (=> res!770066 e!659850)))

(declare-datatypes ((array!75003 0))(
  ( (array!75004 (arr!36152 (Array (_ BitVec 32) (_ BitVec 64))) (size!36688 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75003)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1160358 (= res!770066 (not (= (select (arr!36152 _keys!1208) from!1455) k!934)))))

(declare-fun e!659848 () Bool)

(assert (=> b!1160358 e!659848))

(declare-fun c!115817 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160358 (= c!115817 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43901 0))(
  ( (V!43902 (val!14597 Int)) )
))
(declare-fun zeroValue!944 () V!43901)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13831 0))(
  ( (ValueCellFull!13831 (v!17234 V!43901)) (EmptyCell!13831) )
))
(declare-datatypes ((array!75005 0))(
  ( (array!75006 (arr!36153 (Array (_ BitVec 32) ValueCell!13831)) (size!36689 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75005)

(declare-fun minValue!944 () V!43901)

(declare-datatypes ((Unit!38253 0))(
  ( (Unit!38254) )
))
(declare-fun lt!521934 () Unit!38253)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!635 (array!75003 array!75005 (_ BitVec 32) (_ BitVec 32) V!43901 V!43901 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38253)

(assert (=> b!1160358 (= lt!521934 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160359 () Bool)

(declare-fun res!770069 () Bool)

(declare-fun e!659844 () Bool)

(assert (=> b!1160359 (=> (not res!770069) (not e!659844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160359 (= res!770069 (validKeyInArray!0 k!934))))

(declare-fun b!1160360 () Bool)

(assert (=> b!1160360 (= e!659850 true)))

(declare-fun e!659841 () Bool)

(assert (=> b!1160360 e!659841))

(declare-fun res!770077 () Bool)

(assert (=> b!1160360 (=> (not res!770077) (not e!659841))))

(declare-datatypes ((tuple2!18592 0))(
  ( (tuple2!18593 (_1!9307 (_ BitVec 64)) (_2!9307 V!43901)) )
))
(declare-datatypes ((List!25329 0))(
  ( (Nil!25326) (Cons!25325 (h!26534 tuple2!18592) (t!36872 List!25329)) )
))
(declare-datatypes ((ListLongMap!16561 0))(
  ( (ListLongMap!16562 (toList!8296 List!25329)) )
))
(declare-fun lt!521917 () ListLongMap!16561)

(declare-fun lt!521928 () ListLongMap!16561)

(assert (=> b!1160360 (= res!770077 (= lt!521917 lt!521928))))

(declare-fun lt!521922 () ListLongMap!16561)

(declare-fun -!1405 (ListLongMap!16561 (_ BitVec 64)) ListLongMap!16561)

(assert (=> b!1160360 (= lt!521917 (-!1405 lt!521922 k!934))))

(declare-fun lt!521926 () V!43901)

(declare-fun +!3701 (ListLongMap!16561 tuple2!18592) ListLongMap!16561)

(assert (=> b!1160360 (= (-!1405 (+!3701 lt!521928 (tuple2!18593 (select (arr!36152 _keys!1208) from!1455) lt!521926)) (select (arr!36152 _keys!1208) from!1455)) lt!521928)))

(declare-fun lt!521925 () Unit!38253)

(declare-fun addThenRemoveForNewKeyIsSame!239 (ListLongMap!16561 (_ BitVec 64) V!43901) Unit!38253)

(assert (=> b!1160360 (= lt!521925 (addThenRemoveForNewKeyIsSame!239 lt!521928 (select (arr!36152 _keys!1208) from!1455) lt!521926))))

(declare-fun lt!521930 () V!43901)

(declare-fun get!18435 (ValueCell!13831 V!43901) V!43901)

(assert (=> b!1160360 (= lt!521926 (get!18435 (select (arr!36153 _values!996) from!1455) lt!521930))))

(declare-fun lt!521919 () Unit!38253)

(declare-fun e!659839 () Unit!38253)

(assert (=> b!1160360 (= lt!521919 e!659839)))

(declare-fun c!115820 () Bool)

(declare-fun contains!6802 (ListLongMap!16561 (_ BitVec 64)) Bool)

(assert (=> b!1160360 (= c!115820 (contains!6802 lt!521928 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4760 (array!75003 array!75005 (_ BitVec 32) (_ BitVec 32) V!43901 V!43901 (_ BitVec 32) Int) ListLongMap!16561)

(assert (=> b!1160360 (= lt!521928 (getCurrentListMapNoExtraKeys!4760 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160361 () Bool)

(declare-fun e!659845 () Bool)

(declare-fun tp_is_empty!29081 () Bool)

(assert (=> b!1160361 (= e!659845 tp_is_empty!29081)))

(declare-fun b!1160362 () Bool)

(declare-fun e!659836 () Bool)

(declare-fun arrayContainsKey!0 (array!75003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160362 (= e!659836 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!521921 () array!75003)

(declare-fun call!56157 () ListLongMap!16561)

(declare-fun bm!56151 () Bool)

(declare-fun lt!521932 () array!75005)

(assert (=> bm!56151 (= call!56157 (getCurrentListMapNoExtraKeys!4760 lt!521921 lt!521932 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!521920 () Bool)

(declare-fun b!1160363 () Bool)

(assert (=> b!1160363 (= e!659836 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521920) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56152 () Bool)

(declare-fun call!56156 () Unit!38253)

(declare-fun call!56158 () Unit!38253)

(assert (=> bm!56152 (= call!56156 call!56158)))

(declare-fun b!1160365 () Bool)

(declare-fun Unit!38255 () Unit!38253)

(assert (=> b!1160365 (= e!659839 Unit!38255)))

(assert (=> b!1160365 (= lt!521920 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115818 () Bool)

(assert (=> b!1160365 (= c!115818 (and (not lt!521920) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521927 () Unit!38253)

(declare-fun e!659849 () Unit!38253)

(assert (=> b!1160365 (= lt!521927 e!659849)))

(declare-fun lt!521916 () Unit!38253)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!529 (array!75003 array!75005 (_ BitVec 32) (_ BitVec 32) V!43901 V!43901 (_ BitVec 64) (_ BitVec 32) Int) Unit!38253)

(assert (=> b!1160365 (= lt!521916 (lemmaListMapContainsThenArrayContainsFrom!529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115822 () Bool)

(assert (=> b!1160365 (= c!115822 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770070 () Bool)

(assert (=> b!1160365 (= res!770070 e!659836)))

(declare-fun e!659835 () Bool)

(assert (=> b!1160365 (=> (not res!770070) (not e!659835))))

(assert (=> b!1160365 e!659835))

(declare-fun lt!521933 () Unit!38253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75003 (_ BitVec 32) (_ BitVec 32)) Unit!38253)

(assert (=> b!1160365 (= lt!521933 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25330 0))(
  ( (Nil!25327) (Cons!25326 (h!26535 (_ BitVec 64)) (t!36873 List!25330)) )
))
(declare-fun arrayNoDuplicates!0 (array!75003 (_ BitVec 32) List!25330) Bool)

(assert (=> b!1160365 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25327)))

(declare-fun lt!521929 () Unit!38253)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75003 (_ BitVec 64) (_ BitVec 32) List!25330) Unit!38253)

(assert (=> b!1160365 (= lt!521929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25327))))

(assert (=> b!1160365 false))

(declare-fun bm!56153 () Bool)

(declare-fun lt!521937 () ListLongMap!16561)

(declare-fun c!115819 () Bool)

(declare-fun addStillContains!943 (ListLongMap!16561 (_ BitVec 64) V!43901 (_ BitVec 64)) Unit!38253)

(assert (=> bm!56153 (= call!56158 (addStillContains!943 (ite c!115818 lt!521937 lt!521928) (ite c!115818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115819 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115818 minValue!944 (ite c!115819 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1160366 () Bool)

(declare-fun res!770065 () Bool)

(assert (=> b!1160366 (=> (not res!770065) (not e!659844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160366 (= res!770065 (validMask!0 mask!1564))))

(declare-fun b!1160367 () Bool)

(declare-fun call!56159 () Bool)

(assert (=> b!1160367 call!56159))

(declare-fun lt!521935 () Unit!38253)

(assert (=> b!1160367 (= lt!521935 call!56156)))

(declare-fun e!659842 () Unit!38253)

(assert (=> b!1160367 (= e!659842 lt!521935)))

(declare-fun b!1160368 () Bool)

(declare-fun call!56154 () ListLongMap!16561)

(assert (=> b!1160368 (= e!659848 (= call!56157 call!56154))))

(declare-fun bm!56154 () Bool)

(declare-fun call!56155 () Bool)

(declare-fun call!56161 () ListLongMap!16561)

(assert (=> bm!56154 (= call!56155 (contains!6802 (ite c!115818 lt!521937 call!56161) k!934))))

(declare-fun call!56160 () ListLongMap!16561)

(declare-fun bm!56155 () Bool)

(assert (=> bm!56155 (= call!56160 (+!3701 lt!521928 (ite (or c!115818 c!115819) (tuple2!18593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1160369 () Bool)

(declare-fun e!659834 () Unit!38253)

(assert (=> b!1160369 (= e!659834 e!659842)))

(declare-fun c!115821 () Bool)

(assert (=> b!1160369 (= c!115821 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521920))))

(declare-fun mapNonEmpty!45446 () Bool)

(declare-fun mapRes!45446 () Bool)

(declare-fun tp!86363 () Bool)

(assert (=> mapNonEmpty!45446 (= mapRes!45446 (and tp!86363 e!659845))))

(declare-fun mapRest!45446 () (Array (_ BitVec 32) ValueCell!13831))

(declare-fun mapKey!45446 () (_ BitVec 32))

(declare-fun mapValue!45446 () ValueCell!13831)

(assert (=> mapNonEmpty!45446 (= (arr!36153 _values!996) (store mapRest!45446 mapKey!45446 mapValue!45446))))

(declare-fun b!1160370 () Bool)

(declare-fun e!659847 () Bool)

(assert (=> b!1160370 (= e!659847 tp_is_empty!29081)))

(declare-fun bm!56156 () Bool)

(assert (=> bm!56156 (= call!56159 call!56155)))

(declare-fun b!1160371 () Bool)

(declare-fun e!659843 () Bool)

(assert (=> b!1160371 (= e!659843 e!659840)))

(declare-fun res!770068 () Bool)

(assert (=> b!1160371 (=> res!770068 e!659840)))

(assert (=> b!1160371 (= res!770068 (not (= from!1455 i!673)))))

(declare-fun lt!521936 () ListLongMap!16561)

(assert (=> b!1160371 (= lt!521936 (getCurrentListMapNoExtraKeys!4760 lt!521921 lt!521932 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160371 (= lt!521932 (array!75006 (store (arr!36153 _values!996) i!673 (ValueCellFull!13831 lt!521930)) (size!36689 _values!996)))))

(declare-fun dynLambda!2760 (Int (_ BitVec 64)) V!43901)

(assert (=> b!1160371 (= lt!521930 (dynLambda!2760 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160371 (= lt!521922 (getCurrentListMapNoExtraKeys!4760 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160372 () Bool)

(declare-fun res!770073 () Bool)

(assert (=> b!1160372 (=> (not res!770073) (not e!659844))))

(assert (=> b!1160372 (= res!770073 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36688 _keys!1208))))))

(declare-fun bm!56157 () Bool)

(assert (=> bm!56157 (= call!56154 (getCurrentListMapNoExtraKeys!4760 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160373 () Bool)

(assert (=> b!1160373 (= e!659848 (= call!56157 (-!1405 call!56154 k!934)))))

(declare-fun bm!56158 () Bool)

(assert (=> bm!56158 (= call!56161 call!56160)))

(declare-fun b!1160374 () Bool)

(declare-fun lt!521923 () Unit!38253)

(assert (=> b!1160374 (= e!659834 lt!521923)))

(assert (=> b!1160374 (= lt!521923 call!56156)))

(assert (=> b!1160374 call!56159))

(declare-fun b!1160375 () Bool)

(assert (=> b!1160375 (= e!659841 (= lt!521917 (getCurrentListMapNoExtraKeys!4760 lt!521921 lt!521932 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160376 () Bool)

(declare-fun e!659837 () Bool)

(assert (=> b!1160376 (= e!659837 (not e!659843))))

(declare-fun res!770064 () Bool)

(assert (=> b!1160376 (=> res!770064 e!659843)))

(assert (=> b!1160376 (= res!770064 (bvsgt from!1455 i!673))))

(assert (=> b!1160376 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521931 () Unit!38253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75003 (_ BitVec 64) (_ BitVec 32)) Unit!38253)

(assert (=> b!1160376 (= lt!521931 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1160377 () Bool)

(declare-fun res!770078 () Bool)

(assert (=> b!1160377 (=> (not res!770078) (not e!659844))))

(assert (=> b!1160377 (= res!770078 (= (select (arr!36152 _keys!1208) i!673) k!934))))

(declare-fun b!1160378 () Bool)

(declare-fun res!770074 () Bool)

(assert (=> b!1160378 (=> (not res!770074) (not e!659844))))

(assert (=> b!1160378 (= res!770074 (and (= (size!36689 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36688 _keys!1208) (size!36689 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160379 () Bool)

(declare-fun res!770072 () Bool)

(assert (=> b!1160379 (=> (not res!770072) (not e!659837))))

(assert (=> b!1160379 (= res!770072 (arrayNoDuplicates!0 lt!521921 #b00000000000000000000000000000000 Nil!25327))))

(declare-fun b!1160380 () Bool)

(declare-fun Unit!38256 () Unit!38253)

(assert (=> b!1160380 (= e!659839 Unit!38256)))

(declare-fun b!1160381 () Bool)

(declare-fun e!659846 () Bool)

(assert (=> b!1160381 (= e!659846 (and e!659847 mapRes!45446))))

(declare-fun condMapEmpty!45446 () Bool)

(declare-fun mapDefault!45446 () ValueCell!13831)

