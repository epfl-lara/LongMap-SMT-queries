; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101390 () Bool)

(assert start!101390)

(declare-fun b_free!26077 () Bool)

(declare-fun b_next!26077 () Bool)

(assert (=> start!101390 (= b_free!26077 (not b_next!26077))))

(declare-fun tp!91252 () Bool)

(declare-fun b_and!43273 () Bool)

(assert (=> start!101390 (= tp!91252 b_and!43273)))

(declare-datatypes ((V!46169 0))(
  ( (V!46170 (val!15447 Int)) )
))
(declare-datatypes ((tuple2!19868 0))(
  ( (tuple2!19869 (_1!9945 (_ BitVec 64)) (_2!9945 V!46169)) )
))
(declare-datatypes ((List!26670 0))(
  ( (Nil!26667) (Cons!26666 (h!27884 tuple2!19868) (t!39719 List!26670)) )
))
(declare-datatypes ((ListLongMap!17845 0))(
  ( (ListLongMap!17846 (toList!8938 List!26670)) )
))
(declare-fun call!60477 () ListLongMap!17845)

(declare-fun call!60478 () Bool)

(declare-fun c!120297 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!552258 () ListLongMap!17845)

(declare-fun bm!60469 () Bool)

(declare-fun contains!7032 (ListLongMap!17845 (_ BitVec 64)) Bool)

(assert (=> bm!60469 (= call!60478 (contains!7032 (ite c!120297 lt!552258 call!60477) k0!934))))

(declare-fun bm!60470 () Bool)

(declare-datatypes ((Unit!40209 0))(
  ( (Unit!40210) )
))
(declare-fun call!60475 () Unit!40209)

(declare-fun call!60476 () Unit!40209)

(assert (=> bm!60470 (= call!60475 call!60476)))

(declare-fun b!1214855 () Bool)

(declare-fun e!690036 () Unit!40209)

(declare-fun Unit!40211 () Unit!40209)

(assert (=> b!1214855 (= e!690036 Unit!40211)))

(declare-fun zeroValue!944 () V!46169)

(declare-fun c!120301 () Bool)

(declare-fun bm!60471 () Bool)

(declare-fun minValue!944 () V!46169)

(declare-fun lt!552252 () ListLongMap!17845)

(declare-fun addStillContains!1077 (ListLongMap!17845 (_ BitVec 64) V!46169 (_ BitVec 64)) Unit!40209)

(assert (=> bm!60471 (= call!60476 (addStillContains!1077 lt!552252 (ite (or c!120297 c!120301) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!120297 c!120301) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1214856 () Bool)

(declare-fun e!690031 () Bool)

(declare-fun call!60474 () ListLongMap!17845)

(declare-fun call!60472 () ListLongMap!17845)

(assert (=> b!1214856 (= e!690031 (= call!60474 call!60472))))

(declare-fun mapIsEmpty!48046 () Bool)

(declare-fun mapRes!48046 () Bool)

(assert (=> mapIsEmpty!48046 mapRes!48046))

(declare-fun b!1214857 () Bool)

(declare-fun res!806312 () Bool)

(declare-fun e!690027 () Bool)

(assert (=> b!1214857 (=> (not res!806312) (not e!690027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214857 (= res!806312 (validKeyInArray!0 k0!934))))

(declare-fun res!806306 () Bool)

(assert (=> start!101390 (=> (not res!806306) (not e!690027))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78383 0))(
  ( (array!78384 (arr!37820 (Array (_ BitVec 32) (_ BitVec 64))) (size!38357 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78383)

(assert (=> start!101390 (= res!806306 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38357 _keys!1208))))))

(assert (=> start!101390 e!690027))

(declare-fun tp_is_empty!30781 () Bool)

(assert (=> start!101390 tp_is_empty!30781))

(declare-fun array_inv!28866 (array!78383) Bool)

(assert (=> start!101390 (array_inv!28866 _keys!1208)))

(assert (=> start!101390 true))

(assert (=> start!101390 tp!91252))

(declare-datatypes ((ValueCell!14681 0))(
  ( (ValueCellFull!14681 (v!18096 V!46169)) (EmptyCell!14681) )
))
(declare-datatypes ((array!78385 0))(
  ( (array!78386 (arr!37821 (Array (_ BitVec 32) ValueCell!14681)) (size!38358 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78385)

(declare-fun e!690021 () Bool)

(declare-fun array_inv!28867 (array!78385) Bool)

(assert (=> start!101390 (and (array_inv!28867 _values!996) e!690021)))

(declare-fun bm!60472 () Bool)

(declare-fun call!60473 () Bool)

(assert (=> bm!60472 (= call!60473 call!60478)))

(declare-fun b!1214858 () Bool)

(declare-fun res!806320 () Bool)

(assert (=> b!1214858 (=> (not res!806320) (not e!690027))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1214858 (= res!806320 (and (= (size!38358 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38357 _keys!1208) (size!38358 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214859 () Bool)

(declare-fun e!690035 () Unit!40209)

(declare-fun Unit!40212 () Unit!40209)

(assert (=> b!1214859 (= e!690035 Unit!40212)))

(declare-fun e!690029 () Bool)

(declare-fun b!1214860 () Bool)

(declare-fun arrayContainsKey!0 (array!78383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214860 (= e!690029 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214861 () Bool)

(declare-fun res!806316 () Bool)

(assert (=> b!1214861 (=> (not res!806316) (not e!690027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214861 (= res!806316 (validMask!0 mask!1564))))

(declare-fun b!1214862 () Bool)

(declare-fun res!806319 () Bool)

(assert (=> b!1214862 (=> (not res!806319) (not e!690027))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214862 (= res!806319 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38357 _keys!1208))))))

(declare-fun b!1214863 () Bool)

(declare-fun Unit!40213 () Unit!40209)

(assert (=> b!1214863 (= e!690036 Unit!40213)))

(declare-fun lt!552255 () Bool)

(assert (=> b!1214863 (= lt!552255 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1214863 (= c!120297 (and (not lt!552255) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552257 () Unit!40209)

(declare-fun e!690025 () Unit!40209)

(assert (=> b!1214863 (= lt!552257 e!690025)))

(declare-fun lt!552248 () Unit!40209)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!624 (array!78383 array!78385 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 64) (_ BitVec 32) Int) Unit!40209)

(assert (=> b!1214863 (= lt!552248 (lemmaListMapContainsThenArrayContainsFrom!624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120299 () Bool)

(assert (=> b!1214863 (= c!120299 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806310 () Bool)

(assert (=> b!1214863 (= res!806310 e!690029)))

(declare-fun e!690022 () Bool)

(assert (=> b!1214863 (=> (not res!806310) (not e!690022))))

(assert (=> b!1214863 e!690022))

(declare-fun lt!552259 () Unit!40209)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78383 (_ BitVec 32) (_ BitVec 32)) Unit!40209)

(assert (=> b!1214863 (= lt!552259 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26671 0))(
  ( (Nil!26668) (Cons!26667 (h!27885 (_ BitVec 64)) (t!39720 List!26671)) )
))
(declare-fun arrayNoDuplicates!0 (array!78383 (_ BitVec 32) List!26671) Bool)

(assert (=> b!1214863 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26668)))

(declare-fun lt!552243 () Unit!40209)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78383 (_ BitVec 64) (_ BitVec 32) List!26671) Unit!40209)

(assert (=> b!1214863 (= lt!552243 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26668))))

(assert (=> b!1214863 false))

(declare-fun lt!552247 () array!78383)

(declare-fun bm!60473 () Bool)

(declare-fun lt!552246 () array!78385)

(declare-fun getCurrentListMapNoExtraKeys!5397 (array!78383 array!78385 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 32) Int) ListLongMap!17845)

(assert (=> bm!60473 (= call!60474 (getCurrentListMapNoExtraKeys!5397 lt!552247 lt!552246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214864 () Bool)

(declare-fun e!690028 () Bool)

(assert (=> b!1214864 (= e!690021 (and e!690028 mapRes!48046))))

(declare-fun condMapEmpty!48046 () Bool)

(declare-fun mapDefault!48046 () ValueCell!14681)

(assert (=> b!1214864 (= condMapEmpty!48046 (= (arr!37821 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14681)) mapDefault!48046)))))

(declare-fun b!1214865 () Bool)

(declare-fun e!690034 () Bool)

(assert (=> b!1214865 (= e!690027 e!690034)))

(declare-fun res!806315 () Bool)

(assert (=> b!1214865 (=> (not res!806315) (not e!690034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78383 (_ BitVec 32)) Bool)

(assert (=> b!1214865 (= res!806315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552247 mask!1564))))

(assert (=> b!1214865 (= lt!552247 (array!78384 (store (arr!37820 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38357 _keys!1208)))))

(declare-fun b!1214866 () Bool)

(assert (=> b!1214866 (= e!690022 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214867 () Bool)

(declare-fun e!690037 () Bool)

(assert (=> b!1214867 (= e!690037 tp_is_empty!30781)))

(declare-fun b!1214868 () Bool)

(declare-fun res!806308 () Bool)

(assert (=> b!1214868 (=> (not res!806308) (not e!690027))))

(assert (=> b!1214868 (= res!806308 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun b!1214869 () Bool)

(assert (=> b!1214869 (= c!120301 (and (not lt!552255) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!690023 () Unit!40209)

(assert (=> b!1214869 (= e!690025 e!690023)))

(declare-fun mapNonEmpty!48046 () Bool)

(declare-fun tp!91253 () Bool)

(assert (=> mapNonEmpty!48046 (= mapRes!48046 (and tp!91253 e!690037))))

(declare-fun mapRest!48046 () (Array (_ BitVec 32) ValueCell!14681))

(declare-fun mapValue!48046 () ValueCell!14681)

(declare-fun mapKey!48046 () (_ BitVec 32))

(assert (=> mapNonEmpty!48046 (= (arr!37821 _values!996) (store mapRest!48046 mapKey!48046 mapValue!48046))))

(declare-fun b!1214870 () Bool)

(declare-fun e!690024 () Bool)

(declare-fun e!690026 () Bool)

(assert (=> b!1214870 (= e!690024 e!690026)))

(declare-fun res!806313 () Bool)

(assert (=> b!1214870 (=> res!806313 e!690026)))

(assert (=> b!1214870 (= res!806313 (not (= from!1455 i!673)))))

(declare-fun lt!552253 () ListLongMap!17845)

(assert (=> b!1214870 (= lt!552253 (getCurrentListMapNoExtraKeys!5397 lt!552247 lt!552246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552263 () V!46169)

(assert (=> b!1214870 (= lt!552246 (array!78386 (store (arr!37821 _values!996) i!673 (ValueCellFull!14681 lt!552263)) (size!38358 _values!996)))))

(declare-fun dynLambda!3310 (Int (_ BitVec 64)) V!46169)

(assert (=> b!1214870 (= lt!552263 (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!552260 () ListLongMap!17845)

(assert (=> b!1214870 (= lt!552260 (getCurrentListMapNoExtraKeys!5397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214871 () Bool)

(declare-fun res!806314 () Bool)

(assert (=> b!1214871 (=> (not res!806314) (not e!690027))))

(assert (=> b!1214871 (= res!806314 (= (select (arr!37820 _keys!1208) i!673) k0!934))))

(declare-fun b!1214872 () Bool)

(assert (=> b!1214872 (= e!690034 (not e!690024))))

(declare-fun res!806311 () Bool)

(assert (=> b!1214872 (=> res!806311 e!690024)))

(assert (=> b!1214872 (= res!806311 (bvsgt from!1455 i!673))))

(assert (=> b!1214872 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552261 () Unit!40209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78383 (_ BitVec 64) (_ BitVec 32)) Unit!40209)

(assert (=> b!1214872 (= lt!552261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214873 () Bool)

(declare-fun lt!552244 () Unit!40209)

(assert (=> b!1214873 (= e!690023 lt!552244)))

(assert (=> b!1214873 (= lt!552244 call!60475)))

(assert (=> b!1214873 call!60473))

(declare-fun b!1214874 () Bool)

(assert (=> b!1214874 (= e!690029 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552255) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60474 () Bool)

(assert (=> bm!60474 (= call!60472 (getCurrentListMapNoExtraKeys!5397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60475 () Bool)

(declare-fun call!60479 () ListLongMap!17845)

(declare-fun +!4095 (ListLongMap!17845 tuple2!19868) ListLongMap!17845)

(assert (=> bm!60475 (= call!60479 (+!4095 lt!552252 (ite (or c!120297 c!120301) (tuple2!19869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1214875 () Bool)

(declare-fun res!806309 () Bool)

(assert (=> b!1214875 (=> (not res!806309) (not e!690027))))

(assert (=> b!1214875 (= res!806309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214876 () Bool)

(assert (=> b!1214876 (contains!7032 (+!4095 lt!552258 (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!552249 () Unit!40209)

(assert (=> b!1214876 (= lt!552249 (addStillContains!1077 lt!552258 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1214876 call!60478))

(assert (=> b!1214876 (= lt!552258 call!60479)))

(declare-fun lt!552250 () Unit!40209)

(assert (=> b!1214876 (= lt!552250 call!60476)))

(assert (=> b!1214876 (= e!690025 lt!552249)))

(declare-fun b!1214877 () Bool)

(declare-fun e!690032 () Bool)

(assert (=> b!1214877 (= e!690026 e!690032)))

(declare-fun res!806317 () Bool)

(assert (=> b!1214877 (=> res!806317 e!690032)))

(assert (=> b!1214877 (= res!806317 (not (= (select (arr!37820 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1214877 e!690031))

(declare-fun c!120298 () Bool)

(assert (=> b!1214877 (= c!120298 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552256 () Unit!40209)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 (array!78383 array!78385 (_ BitVec 32) (_ BitVec 32) V!46169 V!46169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40209)

(assert (=> b!1214877 (= lt!552256 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214878 () Bool)

(assert (=> b!1214878 (= e!690032 true)))

(declare-fun e!690030 () Bool)

(assert (=> b!1214878 e!690030))

(declare-fun res!806318 () Bool)

(assert (=> b!1214878 (=> (not res!806318) (not e!690030))))

(declare-fun lt!552251 () ListLongMap!17845)

(assert (=> b!1214878 (= res!806318 (= lt!552251 lt!552252))))

(declare-fun -!1862 (ListLongMap!17845 (_ BitVec 64)) ListLongMap!17845)

(assert (=> b!1214878 (= lt!552251 (-!1862 lt!552260 k0!934))))

(declare-fun lt!552254 () V!46169)

(assert (=> b!1214878 (= (-!1862 (+!4095 lt!552252 (tuple2!19869 (select (arr!37820 _keys!1208) from!1455) lt!552254)) (select (arr!37820 _keys!1208) from!1455)) lt!552252)))

(declare-fun lt!552264 () Unit!40209)

(declare-fun addThenRemoveForNewKeyIsSame!288 (ListLongMap!17845 (_ BitVec 64) V!46169) Unit!40209)

(assert (=> b!1214878 (= lt!552264 (addThenRemoveForNewKeyIsSame!288 lt!552252 (select (arr!37820 _keys!1208) from!1455) lt!552254))))

(declare-fun get!19327 (ValueCell!14681 V!46169) V!46169)

(assert (=> b!1214878 (= lt!552254 (get!19327 (select (arr!37821 _values!996) from!1455) lt!552263))))

(declare-fun lt!552245 () Unit!40209)

(assert (=> b!1214878 (= lt!552245 e!690036)))

(declare-fun c!120300 () Bool)

(assert (=> b!1214878 (= c!120300 (contains!7032 lt!552252 k0!934))))

(assert (=> b!1214878 (= lt!552252 (getCurrentListMapNoExtraKeys!5397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214879 () Bool)

(assert (=> b!1214879 call!60473))

(declare-fun lt!552262 () Unit!40209)

(assert (=> b!1214879 (= lt!552262 call!60475)))

(assert (=> b!1214879 (= e!690035 lt!552262)))

(declare-fun b!1214880 () Bool)

(declare-fun res!806307 () Bool)

(assert (=> b!1214880 (=> (not res!806307) (not e!690034))))

(assert (=> b!1214880 (= res!806307 (arrayNoDuplicates!0 lt!552247 #b00000000000000000000000000000000 Nil!26668))))

(declare-fun b!1214881 () Bool)

(assert (=> b!1214881 (= e!690028 tp_is_empty!30781)))

(declare-fun b!1214882 () Bool)

(assert (=> b!1214882 (= e!690031 (= call!60474 (-!1862 call!60472 k0!934)))))

(declare-fun b!1214883 () Bool)

(assert (=> b!1214883 (= e!690023 e!690035)))

(declare-fun c!120302 () Bool)

(assert (=> b!1214883 (= c!120302 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552255))))

(declare-fun b!1214884 () Bool)

(assert (=> b!1214884 (= e!690030 (= lt!552251 (getCurrentListMapNoExtraKeys!5397 lt!552247 lt!552246 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!60476 () Bool)

(assert (=> bm!60476 (= call!60477 call!60479)))

(assert (= (and start!101390 res!806306) b!1214861))

(assert (= (and b!1214861 res!806316) b!1214858))

(assert (= (and b!1214858 res!806320) b!1214875))

(assert (= (and b!1214875 res!806309) b!1214868))

(assert (= (and b!1214868 res!806308) b!1214862))

(assert (= (and b!1214862 res!806319) b!1214857))

(assert (= (and b!1214857 res!806312) b!1214871))

(assert (= (and b!1214871 res!806314) b!1214865))

(assert (= (and b!1214865 res!806315) b!1214880))

(assert (= (and b!1214880 res!806307) b!1214872))

(assert (= (and b!1214872 (not res!806311)) b!1214870))

(assert (= (and b!1214870 (not res!806313)) b!1214877))

(assert (= (and b!1214877 c!120298) b!1214882))

(assert (= (and b!1214877 (not c!120298)) b!1214856))

(assert (= (or b!1214882 b!1214856) bm!60473))

(assert (= (or b!1214882 b!1214856) bm!60474))

(assert (= (and b!1214877 (not res!806317)) b!1214878))

(assert (= (and b!1214878 c!120300) b!1214863))

(assert (= (and b!1214878 (not c!120300)) b!1214855))

(assert (= (and b!1214863 c!120297) b!1214876))

(assert (= (and b!1214863 (not c!120297)) b!1214869))

(assert (= (and b!1214869 c!120301) b!1214873))

(assert (= (and b!1214869 (not c!120301)) b!1214883))

(assert (= (and b!1214883 c!120302) b!1214879))

(assert (= (and b!1214883 (not c!120302)) b!1214859))

(assert (= (or b!1214873 b!1214879) bm!60470))

(assert (= (or b!1214873 b!1214879) bm!60476))

(assert (= (or b!1214873 b!1214879) bm!60472))

(assert (= (or b!1214876 bm!60472) bm!60469))

(assert (= (or b!1214876 bm!60470) bm!60471))

(assert (= (or b!1214876 bm!60476) bm!60475))

(assert (= (and b!1214863 c!120299) b!1214860))

(assert (= (and b!1214863 (not c!120299)) b!1214874))

(assert (= (and b!1214863 res!806310) b!1214866))

(assert (= (and b!1214878 res!806318) b!1214884))

(assert (= (and b!1214864 condMapEmpty!48046) mapIsEmpty!48046))

(assert (= (and b!1214864 (not condMapEmpty!48046)) mapNonEmpty!48046))

(get-info :version)

(assert (= (and mapNonEmpty!48046 ((_ is ValueCellFull!14681) mapValue!48046)) b!1214867))

(assert (= (and b!1214864 ((_ is ValueCellFull!14681) mapDefault!48046)) b!1214881))

(assert (= start!101390 b!1214864))

(declare-fun b_lambda!21747 () Bool)

(assert (=> (not b_lambda!21747) (not b!1214870)))

(declare-fun t!39718 () Bool)

(declare-fun tb!10869 () Bool)

(assert (=> (and start!101390 (= defaultEntry!1004 defaultEntry!1004) t!39718) tb!10869))

(declare-fun result!22343 () Bool)

(assert (=> tb!10869 (= result!22343 tp_is_empty!30781)))

(assert (=> b!1214870 t!39718))

(declare-fun b_and!43275 () Bool)

(assert (= b_and!43273 (and (=> t!39718 result!22343) b_and!43275)))

(declare-fun m!1120445 () Bool)

(assert (=> b!1214860 m!1120445))

(declare-fun m!1120447 () Bool)

(assert (=> b!1214871 m!1120447))

(declare-fun m!1120449 () Bool)

(assert (=> bm!60469 m!1120449))

(declare-fun m!1120451 () Bool)

(assert (=> mapNonEmpty!48046 m!1120451))

(declare-fun m!1120453 () Bool)

(assert (=> b!1214884 m!1120453))

(declare-fun m!1120455 () Bool)

(assert (=> b!1214878 m!1120455))

(declare-fun m!1120457 () Bool)

(assert (=> b!1214878 m!1120457))

(declare-fun m!1120459 () Bool)

(assert (=> b!1214878 m!1120459))

(assert (=> b!1214878 m!1120459))

(declare-fun m!1120461 () Bool)

(assert (=> b!1214878 m!1120461))

(declare-fun m!1120463 () Bool)

(assert (=> b!1214878 m!1120463))

(declare-fun m!1120465 () Bool)

(assert (=> b!1214878 m!1120465))

(declare-fun m!1120467 () Bool)

(assert (=> b!1214878 m!1120467))

(declare-fun m!1120469 () Bool)

(assert (=> b!1214878 m!1120469))

(assert (=> b!1214878 m!1120467))

(assert (=> b!1214878 m!1120465))

(assert (=> b!1214878 m!1120467))

(declare-fun m!1120471 () Bool)

(assert (=> b!1214878 m!1120471))

(declare-fun m!1120473 () Bool)

(assert (=> b!1214863 m!1120473))

(declare-fun m!1120475 () Bool)

(assert (=> b!1214863 m!1120475))

(declare-fun m!1120477 () Bool)

(assert (=> b!1214863 m!1120477))

(declare-fun m!1120479 () Bool)

(assert (=> b!1214863 m!1120479))

(declare-fun m!1120481 () Bool)

(assert (=> b!1214870 m!1120481))

(declare-fun m!1120483 () Bool)

(assert (=> b!1214870 m!1120483))

(declare-fun m!1120485 () Bool)

(assert (=> b!1214870 m!1120485))

(declare-fun m!1120487 () Bool)

(assert (=> b!1214870 m!1120487))

(declare-fun m!1120489 () Bool)

(assert (=> bm!60475 m!1120489))

(assert (=> bm!60474 m!1120455))

(assert (=> b!1214877 m!1120467))

(declare-fun m!1120491 () Bool)

(assert (=> b!1214877 m!1120491))

(declare-fun m!1120493 () Bool)

(assert (=> b!1214861 m!1120493))

(declare-fun m!1120495 () Bool)

(assert (=> b!1214865 m!1120495))

(declare-fun m!1120497 () Bool)

(assert (=> b!1214865 m!1120497))

(declare-fun m!1120499 () Bool)

(assert (=> b!1214880 m!1120499))

(declare-fun m!1120501 () Bool)

(assert (=> b!1214875 m!1120501))

(declare-fun m!1120503 () Bool)

(assert (=> bm!60471 m!1120503))

(declare-fun m!1120505 () Bool)

(assert (=> b!1214876 m!1120505))

(assert (=> b!1214876 m!1120505))

(declare-fun m!1120507 () Bool)

(assert (=> b!1214876 m!1120507))

(declare-fun m!1120509 () Bool)

(assert (=> b!1214876 m!1120509))

(declare-fun m!1120511 () Bool)

(assert (=> b!1214882 m!1120511))

(declare-fun m!1120513 () Bool)

(assert (=> b!1214857 m!1120513))

(assert (=> b!1214866 m!1120445))

(assert (=> bm!60473 m!1120453))

(declare-fun m!1120515 () Bool)

(assert (=> b!1214868 m!1120515))

(declare-fun m!1120517 () Bool)

(assert (=> b!1214872 m!1120517))

(declare-fun m!1120519 () Bool)

(assert (=> b!1214872 m!1120519))

(declare-fun m!1120521 () Bool)

(assert (=> start!101390 m!1120521))

(declare-fun m!1120523 () Bool)

(assert (=> start!101390 m!1120523))

(check-sat (not b!1214870) (not b!1214861) (not b!1214865) (not b!1214877) (not b_next!26077) (not b!1214882) (not b!1214878) (not b!1214868) (not b!1214860) (not bm!60473) (not b!1214876) b_and!43275 (not b!1214857) tp_is_empty!30781 (not b!1214880) (not b_lambda!21747) (not bm!60475) (not bm!60469) (not b!1214872) (not b!1214863) (not b!1214875) (not mapNonEmpty!48046) (not start!101390) (not bm!60471) (not bm!60474) (not b!1214866) (not b!1214884))
(check-sat b_and!43275 (not b_next!26077))
