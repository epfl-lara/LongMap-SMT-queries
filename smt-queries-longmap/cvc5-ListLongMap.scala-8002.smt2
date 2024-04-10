; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98852 () Bool)

(assert start!98852)

(declare-fun b_free!24457 () Bool)

(declare-fun b_next!24457 () Bool)

(assert (=> start!98852 (= b_free!24457 (not b_next!24457))))

(declare-fun tp!86082 () Bool)

(declare-fun b_and!39763 () Bool)

(assert (=> start!98852 (= tp!86082 b_and!39763)))

(declare-datatypes ((V!43777 0))(
  ( (V!43778 (val!14550 Int)) )
))
(declare-fun zeroValue!944 () V!43777)

(declare-datatypes ((ValueCell!13784 0))(
  ( (ValueCellFull!13784 (v!17187 V!43777)) (EmptyCell!13784) )
))
(declare-datatypes ((array!74821 0))(
  ( (array!74822 (arr!36061 (Array (_ BitVec 32) ValueCell!13784)) (size!36597 (_ BitVec 32))) )
))
(declare-fun lt!518827 () array!74821)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657445 () Bool)

(declare-fun minValue!944 () V!43777)

(declare-datatypes ((tuple2!18508 0))(
  ( (tuple2!18509 (_1!9265 (_ BitVec 64)) (_2!9265 V!43777)) )
))
(declare-datatypes ((List!25251 0))(
  ( (Nil!25248) (Cons!25247 (h!26456 tuple2!18508) (t!36700 List!25251)) )
))
(declare-datatypes ((ListLongMap!16477 0))(
  ( (ListLongMap!16478 (toList!8254 List!25251)) )
))
(declare-fun lt!518820 () ListLongMap!16477)

(declare-fun b!1156034 () Bool)

(declare-datatypes ((array!74823 0))(
  ( (array!74824 (arr!36062 (Array (_ BitVec 32) (_ BitVec 64))) (size!36598 (_ BitVec 32))) )
))
(declare-fun lt!518823 () array!74823)

(declare-fun getCurrentListMapNoExtraKeys!4723 (array!74823 array!74821 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) Int) ListLongMap!16477)

(assert (=> b!1156034 (= e!657445 (= lt!518820 (getCurrentListMapNoExtraKeys!4723 lt!518823 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!55028 () ListLongMap!16477)

(declare-fun c!114974 () Bool)

(declare-fun lt!518816 () ListLongMap!16477)

(declare-fun c!114975 () Bool)

(declare-fun bm!55023 () Bool)

(declare-fun +!3667 (ListLongMap!16477 tuple2!18508) ListLongMap!16477)

(assert (=> bm!55023 (= call!55028 (+!3667 lt!518816 (ite (or c!114974 c!114975) (tuple2!18509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun _keys!1208 () array!74823)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!657437 () Bool)

(declare-fun b!1156035 () Bool)

(declare-fun arrayContainsKey!0 (array!74823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156035 (= e!657437 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156036 () Bool)

(declare-fun res!767963 () Bool)

(declare-fun e!657446 () Bool)

(assert (=> b!1156036 (=> (not res!767963) (not e!657446))))

(declare-datatypes ((List!25252 0))(
  ( (Nil!25249) (Cons!25248 (h!26457 (_ BitVec 64)) (t!36701 List!25252)) )
))
(declare-fun arrayNoDuplicates!0 (array!74823 (_ BitVec 32) List!25252) Bool)

(assert (=> b!1156036 (= res!767963 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25249))))

(declare-fun b!1156037 () Bool)

(declare-fun e!657447 () Bool)

(assert (=> b!1156037 (= e!657446 e!657447)))

(declare-fun res!767961 () Bool)

(assert (=> b!1156037 (=> (not res!767961) (not e!657447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74823 (_ BitVec 32)) Bool)

(assert (=> b!1156037 (= res!767961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518823 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156037 (= lt!518823 (array!74824 (store (arr!36062 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36598 _keys!1208)))))

(declare-fun b!1156038 () Bool)

(declare-fun res!767959 () Bool)

(assert (=> b!1156038 (=> (not res!767959) (not e!657446))))

(assert (=> b!1156038 (= res!767959 (= (select (arr!36062 _keys!1208) i!673) k!934))))

(declare-fun b!1156039 () Bool)

(declare-fun e!657439 () Bool)

(assert (=> b!1156039 (= e!657439 true)))

(assert (=> b!1156039 e!657445))

(declare-fun res!767962 () Bool)

(assert (=> b!1156039 (=> (not res!767962) (not e!657445))))

(assert (=> b!1156039 (= res!767962 (= lt!518820 lt!518816))))

(declare-fun lt!518821 () ListLongMap!16477)

(declare-fun -!1372 (ListLongMap!16477 (_ BitVec 64)) ListLongMap!16477)

(assert (=> b!1156039 (= lt!518820 (-!1372 lt!518821 k!934))))

(declare-fun lt!518835 () V!43777)

(assert (=> b!1156039 (= (-!1372 (+!3667 lt!518816 (tuple2!18509 (select (arr!36062 _keys!1208) from!1455) lt!518835)) (select (arr!36062 _keys!1208) from!1455)) lt!518816)))

(declare-datatypes ((Unit!38077 0))(
  ( (Unit!38078) )
))
(declare-fun lt!518824 () Unit!38077)

(declare-fun addThenRemoveForNewKeyIsSame!211 (ListLongMap!16477 (_ BitVec 64) V!43777) Unit!38077)

(assert (=> b!1156039 (= lt!518824 (addThenRemoveForNewKeyIsSame!211 lt!518816 (select (arr!36062 _keys!1208) from!1455) lt!518835))))

(declare-fun _values!996 () array!74821)

(declare-fun lt!518829 () V!43777)

(declare-fun get!18377 (ValueCell!13784 V!43777) V!43777)

(assert (=> b!1156039 (= lt!518835 (get!18377 (select (arr!36061 _values!996) from!1455) lt!518829))))

(declare-fun lt!518815 () Unit!38077)

(declare-fun e!657444 () Unit!38077)

(assert (=> b!1156039 (= lt!518815 e!657444)))

(declare-fun c!114972 () Bool)

(declare-fun contains!6766 (ListLongMap!16477 (_ BitVec 64)) Bool)

(assert (=> b!1156039 (= c!114972 (contains!6766 lt!518816 k!934))))

(assert (=> b!1156039 (= lt!518816 (getCurrentListMapNoExtraKeys!4723 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156040 () Bool)

(declare-fun lt!518826 () ListLongMap!16477)

(assert (=> b!1156040 (contains!6766 (+!3667 lt!518826 (tuple2!18509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!518817 () Unit!38077)

(declare-fun call!55030 () Unit!38077)

(assert (=> b!1156040 (= lt!518817 call!55030)))

(declare-fun call!55031 () Bool)

(assert (=> b!1156040 call!55031))

(assert (=> b!1156040 (= lt!518826 call!55028)))

(declare-fun lt!518831 () Unit!38077)

(declare-fun addStillContains!910 (ListLongMap!16477 (_ BitVec 64) V!43777 (_ BitVec 64)) Unit!38077)

(assert (=> b!1156040 (= lt!518831 (addStillContains!910 lt!518816 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!657441 () Unit!38077)

(assert (=> b!1156040 (= e!657441 lt!518817)))

(declare-fun call!55033 () ListLongMap!16477)

(declare-fun bm!55024 () Bool)

(assert (=> bm!55024 (= call!55031 (contains!6766 (ite c!114974 lt!518826 call!55033) k!934))))

(declare-fun b!1156041 () Bool)

(declare-fun e!657449 () Bool)

(declare-fun call!55032 () ListLongMap!16477)

(declare-fun call!55029 () ListLongMap!16477)

(assert (=> b!1156041 (= e!657449 (= call!55032 call!55029))))

(declare-fun bm!55025 () Bool)

(assert (=> bm!55025 (= call!55033 call!55028)))

(declare-fun b!1156042 () Bool)

(declare-fun Unit!38079 () Unit!38077)

(assert (=> b!1156042 (= e!657444 Unit!38079)))

(declare-fun b!1156043 () Bool)

(declare-fun e!657438 () Bool)

(assert (=> b!1156043 (= e!657447 (not e!657438))))

(declare-fun res!767951 () Bool)

(assert (=> b!1156043 (=> res!767951 e!657438)))

(assert (=> b!1156043 (= res!767951 (bvsgt from!1455 i!673))))

(assert (=> b!1156043 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!518819 () Unit!38077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74823 (_ BitVec 64) (_ BitVec 32)) Unit!38077)

(assert (=> b!1156043 (= lt!518819 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1156044 () Bool)

(declare-fun e!657443 () Unit!38077)

(declare-fun e!657442 () Unit!38077)

(assert (=> b!1156044 (= e!657443 e!657442)))

(declare-fun c!114976 () Bool)

(declare-fun lt!518828 () Bool)

(assert (=> b!1156044 (= c!114976 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518828))))

(declare-fun bm!55026 () Bool)

(assert (=> bm!55026 (= call!55032 (getCurrentListMapNoExtraKeys!4723 lt!518823 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156045 () Bool)

(declare-fun res!767955 () Bool)

(assert (=> b!1156045 (=> (not res!767955) (not e!657446))))

(assert (=> b!1156045 (= res!767955 (and (= (size!36597 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36598 _keys!1208) (size!36597 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156046 () Bool)

(declare-fun res!767958 () Bool)

(assert (=> b!1156046 (=> (not res!767958) (not e!657446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156046 (= res!767958 (validKeyInArray!0 k!934))))

(declare-fun b!1156047 () Bool)

(declare-fun Unit!38080 () Unit!38077)

(assert (=> b!1156047 (= e!657444 Unit!38080)))

(assert (=> b!1156047 (= lt!518828 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156047 (= c!114974 (and (not lt!518828) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518818 () Unit!38077)

(assert (=> b!1156047 (= lt!518818 e!657441)))

(declare-fun lt!518822 () Unit!38077)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!499 (array!74823 array!74821 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 64) (_ BitVec 32) Int) Unit!38077)

(assert (=> b!1156047 (= lt!518822 (lemmaListMapContainsThenArrayContainsFrom!499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114971 () Bool)

(assert (=> b!1156047 (= c!114971 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767949 () Bool)

(declare-fun e!657451 () Bool)

(assert (=> b!1156047 (= res!767949 e!657451)))

(assert (=> b!1156047 (=> (not res!767949) (not e!657437))))

(assert (=> b!1156047 e!657437))

(declare-fun lt!518832 () Unit!38077)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74823 (_ BitVec 32) (_ BitVec 32)) Unit!38077)

(assert (=> b!1156047 (= lt!518832 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156047 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25249)))

(declare-fun lt!518825 () Unit!38077)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74823 (_ BitVec 64) (_ BitVec 32) List!25252) Unit!38077)

(assert (=> b!1156047 (= lt!518825 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25249))))

(assert (=> b!1156047 false))

(declare-fun b!1156048 () Bool)

(assert (=> b!1156048 (= c!114975 (and (not lt!518828) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156048 (= e!657441 e!657443)))

(declare-fun res!767952 () Bool)

(assert (=> start!98852 (=> (not res!767952) (not e!657446))))

(assert (=> start!98852 (= res!767952 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36598 _keys!1208))))))

(assert (=> start!98852 e!657446))

(declare-fun tp_is_empty!28987 () Bool)

(assert (=> start!98852 tp_is_empty!28987))

(declare-fun array_inv!27600 (array!74823) Bool)

(assert (=> start!98852 (array_inv!27600 _keys!1208)))

(assert (=> start!98852 true))

(assert (=> start!98852 tp!86082))

(declare-fun e!657452 () Bool)

(declare-fun array_inv!27601 (array!74821) Bool)

(assert (=> start!98852 (and (array_inv!27601 _values!996) e!657452)))

(declare-fun bm!55027 () Bool)

(declare-fun call!55026 () Unit!38077)

(assert (=> bm!55027 (= call!55026 call!55030)))

(declare-fun bm!55028 () Bool)

(assert (=> bm!55028 (= call!55030 (addStillContains!910 (ite c!114974 lt!518826 lt!518816) (ite c!114974 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114975 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114974 minValue!944 (ite c!114975 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1156049 () Bool)

(assert (=> b!1156049 (= e!657449 (= call!55032 (-!1372 call!55029 k!934)))))

(declare-fun b!1156050 () Bool)

(declare-fun res!767957 () Bool)

(assert (=> b!1156050 (=> (not res!767957) (not e!657446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156050 (= res!767957 (validMask!0 mask!1564))))

(declare-fun b!1156051 () Bool)

(declare-fun call!55027 () Bool)

(assert (=> b!1156051 call!55027))

(declare-fun lt!518814 () Unit!38077)

(assert (=> b!1156051 (= lt!518814 call!55026)))

(assert (=> b!1156051 (= e!657442 lt!518814)))

(declare-fun b!1156052 () Bool)

(declare-fun e!657448 () Bool)

(assert (=> b!1156052 (= e!657448 tp_is_empty!28987)))

(declare-fun b!1156053 () Bool)

(declare-fun res!767950 () Bool)

(assert (=> b!1156053 (=> (not res!767950) (not e!657446))))

(assert (=> b!1156053 (= res!767950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156054 () Bool)

(declare-fun e!657450 () Bool)

(assert (=> b!1156054 (= e!657450 tp_is_empty!28987)))

(declare-fun bm!55029 () Bool)

(assert (=> bm!55029 (= call!55029 (getCurrentListMapNoExtraKeys!4723 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45305 () Bool)

(declare-fun mapRes!45305 () Bool)

(declare-fun tp!86081 () Bool)

(assert (=> mapNonEmpty!45305 (= mapRes!45305 (and tp!86081 e!657450))))

(declare-fun mapRest!45305 () (Array (_ BitVec 32) ValueCell!13784))

(declare-fun mapValue!45305 () ValueCell!13784)

(declare-fun mapKey!45305 () (_ BitVec 32))

(assert (=> mapNonEmpty!45305 (= (arr!36061 _values!996) (store mapRest!45305 mapKey!45305 mapValue!45305))))

(declare-fun b!1156055 () Bool)

(declare-fun e!657440 () Bool)

(assert (=> b!1156055 (= e!657440 e!657439)))

(declare-fun res!767954 () Bool)

(assert (=> b!1156055 (=> res!767954 e!657439)))

(assert (=> b!1156055 (= res!767954 (not (= (select (arr!36062 _keys!1208) from!1455) k!934)))))

(assert (=> b!1156055 e!657449))

(declare-fun c!114973 () Bool)

(assert (=> b!1156055 (= c!114973 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518830 () Unit!38077)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!604 (array!74823 array!74821 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38077)

(assert (=> b!1156055 (= lt!518830 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156056 () Bool)

(assert (=> b!1156056 (= e!657451 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55030 () Bool)

(assert (=> bm!55030 (= call!55027 call!55031)))

(declare-fun b!1156057 () Bool)

(declare-fun res!767953 () Bool)

(assert (=> b!1156057 (=> (not res!767953) (not e!657446))))

(assert (=> b!1156057 (= res!767953 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36598 _keys!1208))))))

(declare-fun b!1156058 () Bool)

(declare-fun lt!518834 () Unit!38077)

(assert (=> b!1156058 (= e!657443 lt!518834)))

(assert (=> b!1156058 (= lt!518834 call!55026)))

(assert (=> b!1156058 call!55027))

(declare-fun b!1156059 () Bool)

(assert (=> b!1156059 (= e!657438 e!657440)))

(declare-fun res!767956 () Bool)

(assert (=> b!1156059 (=> res!767956 e!657440)))

(assert (=> b!1156059 (= res!767956 (not (= from!1455 i!673)))))

(declare-fun lt!518833 () ListLongMap!16477)

(assert (=> b!1156059 (= lt!518833 (getCurrentListMapNoExtraKeys!4723 lt!518823 lt!518827 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1156059 (= lt!518827 (array!74822 (store (arr!36061 _values!996) i!673 (ValueCellFull!13784 lt!518829)) (size!36597 _values!996)))))

(declare-fun dynLambda!2731 (Int (_ BitVec 64)) V!43777)

(assert (=> b!1156059 (= lt!518829 (dynLambda!2731 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1156059 (= lt!518821 (getCurrentListMapNoExtraKeys!4723 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156060 () Bool)

(assert (=> b!1156060 (= e!657452 (and e!657448 mapRes!45305))))

(declare-fun condMapEmpty!45305 () Bool)

(declare-fun mapDefault!45305 () ValueCell!13784)

