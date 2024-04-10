; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98368 () Bool)

(assert start!98368)

(declare-fun b_free!23973 () Bool)

(declare-fun b_next!23973 () Bool)

(assert (=> start!98368 (= b_free!23973 (not b_next!23973))))

(declare-fun tp!84629 () Bool)

(declare-fun b_and!38795 () Bool)

(assert (=> start!98368 (= tp!84629 b_and!38795)))

(declare-fun b!1133949 () Bool)

(declare-fun e!645353 () Bool)

(declare-fun e!645358 () Bool)

(assert (=> b!1133949 (= e!645353 e!645358)))

(declare-fun res!757073 () Bool)

(assert (=> b!1133949 (=> res!757073 e!645358)))

(declare-datatypes ((V!43131 0))(
  ( (V!43132 (val!14308 Int)) )
))
(declare-datatypes ((tuple2!18048 0))(
  ( (tuple2!18049 (_1!9035 (_ BitVec 64)) (_2!9035 V!43131)) )
))
(declare-datatypes ((List!24808 0))(
  ( (Nil!24805) (Cons!24804 (h!26013 tuple2!18048) (t!35773 List!24808)) )
))
(declare-datatypes ((ListLongMap!16017 0))(
  ( (ListLongMap!16018 (toList!8024 List!24808)) )
))
(declare-fun lt!503964 () ListLongMap!16017)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6548 (ListLongMap!16017 (_ BitVec 64)) Bool)

(assert (=> b!1133949 (= res!757073 (not (contains!6548 lt!503964 k0!934)))))

(declare-fun zeroValue!944 () V!43131)

(declare-datatypes ((array!73867 0))(
  ( (array!73868 (arr!35584 (Array (_ BitVec 32) (_ BitVec 64))) (size!36120 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73867)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13542 0))(
  ( (ValueCellFull!13542 (v!16945 V!43131)) (EmptyCell!13542) )
))
(declare-datatypes ((array!73869 0))(
  ( (array!73870 (arr!35585 (Array (_ BitVec 32) ValueCell!13542)) (size!36121 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73869)

(declare-fun minValue!944 () V!43131)

(declare-fun getCurrentListMapNoExtraKeys!4510 (array!73867 array!73869 (_ BitVec 32) (_ BitVec 32) V!43131 V!43131 (_ BitVec 32) Int) ListLongMap!16017)

(assert (=> b!1133949 (= lt!503964 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133950 () Bool)

(declare-fun e!645360 () Bool)

(assert (=> b!1133950 (= e!645360 e!645353)))

(declare-fun res!757068 () Bool)

(assert (=> b!1133950 (=> res!757068 e!645353)))

(assert (=> b!1133950 (= res!757068 (not (= (select (arr!35584 _keys!1208) from!1455) k0!934)))))

(declare-fun e!645359 () Bool)

(assert (=> b!1133950 e!645359))

(declare-fun c!110702 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133950 (= c!110702 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!37155 0))(
  ( (Unit!37156) )
))
(declare-fun lt!503958 () Unit!37155)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!442 (array!73867 array!73869 (_ BitVec 32) (_ BitVec 32) V!43131 V!43131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37155)

(assert (=> b!1133950 (= lt!503958 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49215 () Bool)

(declare-fun call!49224 () ListLongMap!16017)

(declare-fun call!49218 () ListLongMap!16017)

(assert (=> bm!49215 (= call!49224 call!49218)))

(declare-fun b!1133951 () Bool)

(declare-fun e!645357 () Unit!37155)

(declare-fun e!645352 () Unit!37155)

(assert (=> b!1133951 (= e!645357 e!645352)))

(declare-fun c!110704 () Bool)

(declare-fun lt!503957 () Bool)

(assert (=> b!1133951 (= c!110704 (and (not lt!503957) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133952 () Bool)

(declare-fun e!645363 () Bool)

(declare-fun tp_is_empty!28503 () Bool)

(assert (=> b!1133952 (= e!645363 tp_is_empty!28503)))

(declare-fun b!1133953 () Bool)

(declare-fun res!757075 () Bool)

(declare-fun e!645356 () Bool)

(assert (=> b!1133953 (=> (not res!757075) (not e!645356))))

(declare-fun lt!503953 () array!73867)

(declare-datatypes ((List!24809 0))(
  ( (Nil!24806) (Cons!24805 (h!26014 (_ BitVec 64)) (t!35774 List!24809)) )
))
(declare-fun arrayNoDuplicates!0 (array!73867 (_ BitVec 32) List!24809) Bool)

(assert (=> b!1133953 (= res!757075 (arrayNoDuplicates!0 lt!503953 #b00000000000000000000000000000000 Nil!24806))))

(declare-fun b!1133954 () Bool)

(declare-fun e!645355 () Bool)

(declare-fun arrayContainsKey!0 (array!73867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133954 (= e!645355 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133955 () Bool)

(declare-fun res!757078 () Bool)

(declare-fun e!645351 () Bool)

(assert (=> b!1133955 (=> (not res!757078) (not e!645351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73867 (_ BitVec 32)) Bool)

(assert (=> b!1133955 (= res!757078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133956 () Bool)

(declare-fun e!645366 () Bool)

(assert (=> b!1133956 (= e!645356 (not e!645366))))

(declare-fun res!757079 () Bool)

(assert (=> b!1133956 (=> res!757079 e!645366)))

(assert (=> b!1133956 (= res!757079 (bvsgt from!1455 i!673))))

(assert (=> b!1133956 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503954 () Unit!37155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73867 (_ BitVec 64) (_ BitVec 32)) Unit!37155)

(assert (=> b!1133956 (= lt!503954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!110701 () Bool)

(declare-fun bm!49216 () Bool)

(declare-fun +!3464 (ListLongMap!16017 tuple2!18048) ListLongMap!16017)

(assert (=> bm!49216 (= call!49218 (+!3464 lt!503964 (ite (or c!110701 c!110704) (tuple2!18049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1133957 () Bool)

(declare-fun res!757072 () Bool)

(assert (=> b!1133957 (=> (not res!757072) (not e!645351))))

(assert (=> b!1133957 (= res!757072 (= (select (arr!35584 _keys!1208) i!673) k0!934))))

(declare-fun b!1133958 () Bool)

(assert (=> b!1133958 (= e!645358 true)))

(assert (=> b!1133958 e!645355))

(declare-fun res!757076 () Bool)

(assert (=> b!1133958 (=> (not res!757076) (not e!645355))))

(declare-fun e!645361 () Bool)

(assert (=> b!1133958 (= res!757076 e!645361)))

(declare-fun c!110700 () Bool)

(assert (=> b!1133958 (= c!110700 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503956 () Unit!37155)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!335 (array!73867 array!73869 (_ BitVec 32) (_ BitVec 32) V!43131 V!43131 (_ BitVec 64) (_ BitVec 32) Int) Unit!37155)

(assert (=> b!1133958 (= lt!503956 (lemmaListMapContainsThenArrayContainsFrom!335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503951 () Unit!37155)

(assert (=> b!1133958 (= lt!503951 e!645357)))

(assert (=> b!1133958 (= c!110701 (and (not lt!503957) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133958 (= lt!503957 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!44579 () Bool)

(declare-fun mapRes!44579 () Bool)

(declare-fun tp!84630 () Bool)

(declare-fun e!645365 () Bool)

(assert (=> mapNonEmpty!44579 (= mapRes!44579 (and tp!84630 e!645365))))

(declare-fun mapKey!44579 () (_ BitVec 32))

(declare-fun mapValue!44579 () ValueCell!13542)

(declare-fun mapRest!44579 () (Array (_ BitVec 32) ValueCell!13542))

(assert (=> mapNonEmpty!44579 (= (arr!35585 _values!996) (store mapRest!44579 mapKey!44579 mapValue!44579))))

(declare-fun b!1133959 () Bool)

(declare-fun call!49221 () Bool)

(assert (=> b!1133959 call!49221))

(declare-fun lt!503961 () Unit!37155)

(declare-fun call!49222 () Unit!37155)

(assert (=> b!1133959 (= lt!503961 call!49222)))

(assert (=> b!1133959 (= e!645352 lt!503961)))

(declare-fun b!1133960 () Bool)

(declare-fun e!645354 () Bool)

(assert (=> b!1133960 (= e!645354 (and e!645363 mapRes!44579))))

(declare-fun condMapEmpty!44579 () Bool)

(declare-fun mapDefault!44579 () ValueCell!13542)

(assert (=> b!1133960 (= condMapEmpty!44579 (= (arr!35585 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13542)) mapDefault!44579)))))

(declare-fun b!1133961 () Bool)

(assert (=> b!1133961 (= e!645361 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!49225 () ListLongMap!16017)

(declare-fun bm!49217 () Bool)

(assert (=> bm!49217 (= call!49225 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44579 () Bool)

(assert (=> mapIsEmpty!44579 mapRes!44579))

(declare-fun b!1133962 () Bool)

(declare-fun call!49220 () ListLongMap!16017)

(declare-fun -!1191 (ListLongMap!16017 (_ BitVec 64)) ListLongMap!16017)

(assert (=> b!1133962 (= e!645359 (= call!49220 (-!1191 call!49225 k0!934)))))

(declare-fun b!1133963 () Bool)

(assert (=> b!1133963 (= e!645365 tp_is_empty!28503)))

(declare-fun res!757082 () Bool)

(assert (=> start!98368 (=> (not res!757082) (not e!645351))))

(assert (=> start!98368 (= res!757082 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36120 _keys!1208))))))

(assert (=> start!98368 e!645351))

(assert (=> start!98368 tp_is_empty!28503))

(declare-fun array_inv!27292 (array!73867) Bool)

(assert (=> start!98368 (array_inv!27292 _keys!1208)))

(assert (=> start!98368 true))

(assert (=> start!98368 tp!84629))

(declare-fun array_inv!27293 (array!73869) Bool)

(assert (=> start!98368 (and (array_inv!27293 _values!996) e!645354)))

(declare-fun b!1133964 () Bool)

(assert (=> b!1133964 (= e!645361 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503957) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133965 () Bool)

(declare-fun e!645362 () Unit!37155)

(declare-fun lt!503962 () Unit!37155)

(assert (=> b!1133965 (= e!645362 lt!503962)))

(assert (=> b!1133965 (= lt!503962 call!49222)))

(assert (=> b!1133965 call!49221))

(declare-fun b!1133966 () Bool)

(declare-fun c!110703 () Bool)

(assert (=> b!1133966 (= c!110703 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503957))))

(assert (=> b!1133966 (= e!645352 e!645362)))

(declare-fun b!1133967 () Bool)

(assert (=> b!1133967 (= e!645359 (= call!49220 call!49225))))

(declare-fun b!1133968 () Bool)

(assert (=> b!1133968 (= e!645366 e!645360)))

(declare-fun res!757080 () Bool)

(assert (=> b!1133968 (=> res!757080 e!645360)))

(assert (=> b!1133968 (= res!757080 (not (= from!1455 i!673)))))

(declare-fun lt!503955 () array!73869)

(declare-fun lt!503952 () ListLongMap!16017)

(assert (=> b!1133968 (= lt!503952 (getCurrentListMapNoExtraKeys!4510 lt!503953 lt!503955 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2578 (Int (_ BitVec 64)) V!43131)

(assert (=> b!1133968 (= lt!503955 (array!73870 (store (arr!35585 _values!996) i!673 (ValueCellFull!13542 (dynLambda!2578 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36121 _values!996)))))

(declare-fun lt!503959 () ListLongMap!16017)

(assert (=> b!1133968 (= lt!503959 (getCurrentListMapNoExtraKeys!4510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133969 () Bool)

(declare-fun Unit!37157 () Unit!37155)

(assert (=> b!1133969 (= e!645362 Unit!37157)))

(declare-fun call!49223 () Unit!37155)

(declare-fun bm!49218 () Bool)

(declare-fun lt!503950 () ListLongMap!16017)

(declare-fun addStillContains!727 (ListLongMap!16017 (_ BitVec 64) V!43131 (_ BitVec 64)) Unit!37155)

(assert (=> bm!49218 (= call!49223 (addStillContains!727 (ite c!110701 lt!503950 lt!503964) (ite c!110701 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110704 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110701 minValue!944 (ite c!110704 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133970 () Bool)

(assert (=> b!1133970 (= e!645351 e!645356)))

(declare-fun res!757081 () Bool)

(assert (=> b!1133970 (=> (not res!757081) (not e!645356))))

(assert (=> b!1133970 (= res!757081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503953 mask!1564))))

(assert (=> b!1133970 (= lt!503953 (array!73868 (store (arr!35584 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36120 _keys!1208)))))

(declare-fun b!1133971 () Bool)

(declare-fun res!757069 () Bool)

(assert (=> b!1133971 (=> (not res!757069) (not e!645351))))

(assert (=> b!1133971 (= res!757069 (and (= (size!36121 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36120 _keys!1208) (size!36121 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49219 () Bool)

(declare-fun call!49219 () Bool)

(assert (=> bm!49219 (= call!49221 call!49219)))

(declare-fun b!1133972 () Bool)

(declare-fun res!757070 () Bool)

(assert (=> b!1133972 (=> (not res!757070) (not e!645351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133972 (= res!757070 (validKeyInArray!0 k0!934))))

(declare-fun b!1133973 () Bool)

(declare-fun lt!503960 () Unit!37155)

(assert (=> b!1133973 (= e!645357 lt!503960)))

(declare-fun lt!503963 () Unit!37155)

(assert (=> b!1133973 (= lt!503963 (addStillContains!727 lt!503964 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1133973 (= lt!503950 call!49218)))

(assert (=> b!1133973 call!49219))

(assert (=> b!1133973 (= lt!503960 call!49223)))

(assert (=> b!1133973 (contains!6548 (+!3464 lt!503950 (tuple2!18049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1133974 () Bool)

(declare-fun res!757071 () Bool)

(assert (=> b!1133974 (=> (not res!757071) (not e!645351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133974 (= res!757071 (validMask!0 mask!1564))))

(declare-fun bm!49220 () Bool)

(assert (=> bm!49220 (= call!49222 call!49223)))

(declare-fun b!1133975 () Bool)

(declare-fun res!757077 () Bool)

(assert (=> b!1133975 (=> (not res!757077) (not e!645351))))

(assert (=> b!1133975 (= res!757077 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24806))))

(declare-fun bm!49221 () Bool)

(assert (=> bm!49221 (= call!49219 (contains!6548 (ite c!110701 lt!503950 call!49224) k0!934))))

(declare-fun bm!49222 () Bool)

(assert (=> bm!49222 (= call!49220 (getCurrentListMapNoExtraKeys!4510 lt!503953 lt!503955 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133976 () Bool)

(declare-fun res!757074 () Bool)

(assert (=> b!1133976 (=> (not res!757074) (not e!645351))))

(assert (=> b!1133976 (= res!757074 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36120 _keys!1208))))))

(assert (= (and start!98368 res!757082) b!1133974))

(assert (= (and b!1133974 res!757071) b!1133971))

(assert (= (and b!1133971 res!757069) b!1133955))

(assert (= (and b!1133955 res!757078) b!1133975))

(assert (= (and b!1133975 res!757077) b!1133976))

(assert (= (and b!1133976 res!757074) b!1133972))

(assert (= (and b!1133972 res!757070) b!1133957))

(assert (= (and b!1133957 res!757072) b!1133970))

(assert (= (and b!1133970 res!757081) b!1133953))

(assert (= (and b!1133953 res!757075) b!1133956))

(assert (= (and b!1133956 (not res!757079)) b!1133968))

(assert (= (and b!1133968 (not res!757080)) b!1133950))

(assert (= (and b!1133950 c!110702) b!1133962))

(assert (= (and b!1133950 (not c!110702)) b!1133967))

(assert (= (or b!1133962 b!1133967) bm!49222))

(assert (= (or b!1133962 b!1133967) bm!49217))

(assert (= (and b!1133950 (not res!757068)) b!1133949))

(assert (= (and b!1133949 (not res!757073)) b!1133958))

(assert (= (and b!1133958 c!110701) b!1133973))

(assert (= (and b!1133958 (not c!110701)) b!1133951))

(assert (= (and b!1133951 c!110704) b!1133959))

(assert (= (and b!1133951 (not c!110704)) b!1133966))

(assert (= (and b!1133966 c!110703) b!1133965))

(assert (= (and b!1133966 (not c!110703)) b!1133969))

(assert (= (or b!1133959 b!1133965) bm!49220))

(assert (= (or b!1133959 b!1133965) bm!49215))

(assert (= (or b!1133959 b!1133965) bm!49219))

(assert (= (or b!1133973 bm!49219) bm!49221))

(assert (= (or b!1133973 bm!49220) bm!49218))

(assert (= (or b!1133973 bm!49215) bm!49216))

(assert (= (and b!1133958 c!110700) b!1133961))

(assert (= (and b!1133958 (not c!110700)) b!1133964))

(assert (= (and b!1133958 res!757076) b!1133954))

(assert (= (and b!1133960 condMapEmpty!44579) mapIsEmpty!44579))

(assert (= (and b!1133960 (not condMapEmpty!44579)) mapNonEmpty!44579))

(get-info :version)

(assert (= (and mapNonEmpty!44579 ((_ is ValueCellFull!13542) mapValue!44579)) b!1133963))

(assert (= (and b!1133960 ((_ is ValueCellFull!13542) mapDefault!44579)) b!1133952))

(assert (= start!98368 b!1133960))

(declare-fun b_lambda!19079 () Bool)

(assert (=> (not b_lambda!19079) (not b!1133968)))

(declare-fun t!35772 () Bool)

(declare-fun tb!8785 () Bool)

(assert (=> (and start!98368 (= defaultEntry!1004 defaultEntry!1004) t!35772) tb!8785))

(declare-fun result!18135 () Bool)

(assert (=> tb!8785 (= result!18135 tp_is_empty!28503)))

(assert (=> b!1133968 t!35772))

(declare-fun b_and!38797 () Bool)

(assert (= b_and!38795 (and (=> t!35772 result!18135) b_and!38797)))

(declare-fun m!1046885 () Bool)

(assert (=> bm!49216 m!1046885))

(declare-fun m!1046887 () Bool)

(assert (=> b!1133974 m!1046887))

(declare-fun m!1046889 () Bool)

(assert (=> start!98368 m!1046889))

(declare-fun m!1046891 () Bool)

(assert (=> start!98368 m!1046891))

(declare-fun m!1046893 () Bool)

(assert (=> mapNonEmpty!44579 m!1046893))

(declare-fun m!1046895 () Bool)

(assert (=> b!1133973 m!1046895))

(declare-fun m!1046897 () Bool)

(assert (=> b!1133973 m!1046897))

(assert (=> b!1133973 m!1046897))

(declare-fun m!1046899 () Bool)

(assert (=> b!1133973 m!1046899))

(declare-fun m!1046901 () Bool)

(assert (=> b!1133953 m!1046901))

(declare-fun m!1046903 () Bool)

(assert (=> bm!49217 m!1046903))

(declare-fun m!1046905 () Bool)

(assert (=> b!1133975 m!1046905))

(declare-fun m!1046907 () Bool)

(assert (=> b!1133958 m!1046907))

(declare-fun m!1046909 () Bool)

(assert (=> b!1133972 m!1046909))

(declare-fun m!1046911 () Bool)

(assert (=> b!1133970 m!1046911))

(declare-fun m!1046913 () Bool)

(assert (=> b!1133970 m!1046913))

(declare-fun m!1046915 () Bool)

(assert (=> b!1133956 m!1046915))

(declare-fun m!1046917 () Bool)

(assert (=> b!1133956 m!1046917))

(declare-fun m!1046919 () Bool)

(assert (=> bm!49222 m!1046919))

(declare-fun m!1046921 () Bool)

(assert (=> b!1133968 m!1046921))

(declare-fun m!1046923 () Bool)

(assert (=> b!1133968 m!1046923))

(declare-fun m!1046925 () Bool)

(assert (=> b!1133968 m!1046925))

(declare-fun m!1046927 () Bool)

(assert (=> b!1133968 m!1046927))

(declare-fun m!1046929 () Bool)

(assert (=> b!1133954 m!1046929))

(declare-fun m!1046931 () Bool)

(assert (=> b!1133955 m!1046931))

(declare-fun m!1046933 () Bool)

(assert (=> b!1133950 m!1046933))

(declare-fun m!1046935 () Bool)

(assert (=> b!1133950 m!1046935))

(assert (=> b!1133961 m!1046929))

(declare-fun m!1046937 () Bool)

(assert (=> b!1133949 m!1046937))

(assert (=> b!1133949 m!1046903))

(declare-fun m!1046939 () Bool)

(assert (=> bm!49221 m!1046939))

(declare-fun m!1046941 () Bool)

(assert (=> b!1133957 m!1046941))

(declare-fun m!1046943 () Bool)

(assert (=> bm!49218 m!1046943))

(declare-fun m!1046945 () Bool)

(assert (=> b!1133962 m!1046945))

(check-sat (not bm!49216) (not b!1133954) (not bm!49217) (not b!1133975) (not bm!49221) (not b!1133950) (not b!1133949) (not b!1133968) (not b!1133974) (not mapNonEmpty!44579) (not start!98368) (not b!1133953) (not bm!49218) (not b!1133956) (not b!1133970) (not b_lambda!19079) (not bm!49222) (not b!1133961) (not b_next!23973) (not b!1133955) (not b!1133958) (not b!1133972) tp_is_empty!28503 b_and!38797 (not b!1133962) (not b!1133973))
(check-sat b_and!38797 (not b_next!23973))
