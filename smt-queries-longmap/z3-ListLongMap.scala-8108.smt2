; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99516 () Bool)

(assert start!99516)

(declare-fun b_free!25095 () Bool)

(declare-fun b_next!25095 () Bool)

(assert (=> start!99516 (= b_free!25095 (not b_next!25095))))

(declare-fun tp!87999 () Bool)

(declare-fun b_and!41057 () Bool)

(assert (=> start!99516 (= tp!87999 b_and!41057)))

(declare-fun b!1176930 () Bool)

(declare-fun e!669031 () Bool)

(assert (=> b!1176930 (= e!669031 true)))

(declare-fun e!669034 () Bool)

(assert (=> b!1176930 e!669034))

(declare-fun res!781751 () Bool)

(assert (=> b!1176930 (=> (not res!781751) (not e!669034))))

(declare-datatypes ((array!76057 0))(
  ( (array!76058 (arr!36678 (Array (_ BitVec 32) (_ BitVec 64))) (size!37214 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76057)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176930 (= res!781751 (not (= (select (arr!36678 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38860 0))(
  ( (Unit!38861) )
))
(declare-fun lt!531307 () Unit!38860)

(declare-fun e!669036 () Unit!38860)

(assert (=> b!1176930 (= lt!531307 e!669036)))

(declare-fun c!116766 () Bool)

(assert (=> b!1176930 (= c!116766 (= (select (arr!36678 _keys!1208) from!1455) k0!934))))

(declare-fun e!669037 () Bool)

(assert (=> b!1176930 e!669037))

(declare-fun res!781744 () Bool)

(assert (=> b!1176930 (=> (not res!781744) (not e!669037))))

(declare-datatypes ((V!44627 0))(
  ( (V!44628 (val!14869 Int)) )
))
(declare-datatypes ((tuple2!19018 0))(
  ( (tuple2!19019 (_1!9520 (_ BitVec 64)) (_2!9520 V!44627)) )
))
(declare-fun lt!531304 () tuple2!19018)

(declare-datatypes ((List!25756 0))(
  ( (Nil!25753) (Cons!25752 (h!26961 tuple2!19018) (t!37843 List!25756)) )
))
(declare-datatypes ((ListLongMap!16987 0))(
  ( (ListLongMap!16988 (toList!8509 List!25756)) )
))
(declare-fun lt!531316 () ListLongMap!16987)

(declare-fun lt!531314 () ListLongMap!16987)

(declare-fun +!3824 (ListLongMap!16987 tuple2!19018) ListLongMap!16987)

(assert (=> b!1176930 (= res!781744 (= lt!531314 (+!3824 lt!531316 lt!531304)))))

(declare-datatypes ((ValueCell!14103 0))(
  ( (ValueCellFull!14103 (v!17507 V!44627)) (EmptyCell!14103) )
))
(declare-datatypes ((array!76059 0))(
  ( (array!76060 (arr!36679 (Array (_ BitVec 32) ValueCell!14103)) (size!37215 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76059)

(declare-fun lt!531310 () V!44627)

(declare-fun get!18736 (ValueCell!14103 V!44627) V!44627)

(assert (=> b!1176930 (= lt!531304 (tuple2!19019 (select (arr!36678 _keys!1208) from!1455) (get!18736 (select (arr!36679 _values!996) from!1455) lt!531310)))))

(declare-fun mapNonEmpty!46265 () Bool)

(declare-fun mapRes!46265 () Bool)

(declare-fun tp!87998 () Bool)

(declare-fun e!669035 () Bool)

(assert (=> mapNonEmpty!46265 (= mapRes!46265 (and tp!87998 e!669035))))

(declare-fun mapValue!46265 () ValueCell!14103)

(declare-fun mapKey!46265 () (_ BitVec 32))

(declare-fun mapRest!46265 () (Array (_ BitVec 32) ValueCell!14103))

(assert (=> mapNonEmpty!46265 (= (arr!36679 _values!996) (store mapRest!46265 mapKey!46265 mapValue!46265))))

(declare-fun b!1176931 () Bool)

(declare-fun e!669039 () Bool)

(assert (=> b!1176931 (= e!669039 e!669031)))

(declare-fun res!781747 () Bool)

(assert (=> b!1176931 (=> res!781747 e!669031)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176931 (= res!781747 (not (validKeyInArray!0 (select (arr!36678 _keys!1208) from!1455))))))

(declare-fun lt!531305 () ListLongMap!16987)

(assert (=> b!1176931 (= lt!531305 lt!531316)))

(declare-fun lt!531313 () ListLongMap!16987)

(declare-fun -!1560 (ListLongMap!16987 (_ BitVec 64)) ListLongMap!16987)

(assert (=> b!1176931 (= lt!531316 (-!1560 lt!531313 k0!934))))

(declare-fun zeroValue!944 () V!44627)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531312 () array!76059)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44627)

(declare-fun lt!531315 () array!76057)

(declare-fun getCurrentListMapNoExtraKeys!4967 (array!76057 array!76059 (_ BitVec 32) (_ BitVec 32) V!44627 V!44627 (_ BitVec 32) Int) ListLongMap!16987)

(assert (=> b!1176931 (= lt!531305 (getCurrentListMapNoExtraKeys!4967 lt!531315 lt!531312 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176931 (= lt!531313 (getCurrentListMapNoExtraKeys!4967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!531306 () Unit!38860)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!787 (array!76057 array!76059 (_ BitVec 32) (_ BitVec 32) V!44627 V!44627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38860)

(assert (=> b!1176931 (= lt!531306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176932 () Bool)

(declare-fun res!781745 () Bool)

(declare-fun e!669038 () Bool)

(assert (=> b!1176932 (=> (not res!781745) (not e!669038))))

(assert (=> b!1176932 (= res!781745 (and (= (size!37215 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37214 _keys!1208) (size!37215 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176933 () Bool)

(declare-fun Unit!38862 () Unit!38860)

(assert (=> b!1176933 (= e!669036 Unit!38862)))

(declare-fun lt!531311 () Unit!38860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38860)

(assert (=> b!1176933 (= lt!531311 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176933 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531318 () Unit!38860)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76057 (_ BitVec 32) (_ BitVec 32)) Unit!38860)

(assert (=> b!1176933 (= lt!531318 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25757 0))(
  ( (Nil!25754) (Cons!25753 (h!26962 (_ BitVec 64)) (t!37844 List!25757)) )
))
(declare-fun arrayNoDuplicates!0 (array!76057 (_ BitVec 32) List!25757) Bool)

(assert (=> b!1176933 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25754)))

(declare-fun lt!531308 () Unit!38860)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76057 (_ BitVec 64) (_ BitVec 32) List!25757) Unit!38860)

(assert (=> b!1176933 (= lt!531308 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25754))))

(assert (=> b!1176933 false))

(declare-fun b!1176934 () Bool)

(declare-fun Unit!38863 () Unit!38860)

(assert (=> b!1176934 (= e!669036 Unit!38863)))

(declare-fun b!1176935 () Bool)

(declare-fun e!669029 () Bool)

(assert (=> b!1176935 (= e!669038 e!669029)))

(declare-fun res!781743 () Bool)

(assert (=> b!1176935 (=> (not res!781743) (not e!669029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76057 (_ BitVec 32)) Bool)

(assert (=> b!1176935 (= res!781743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531315 mask!1564))))

(assert (=> b!1176935 (= lt!531315 (array!76058 (store (arr!36678 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37214 _keys!1208)))))

(declare-fun b!1176936 () Bool)

(declare-fun res!781741 () Bool)

(assert (=> b!1176936 (=> (not res!781741) (not e!669038))))

(assert (=> b!1176936 (= res!781741 (validKeyInArray!0 k0!934))))

(declare-fun res!781750 () Bool)

(assert (=> start!99516 (=> (not res!781750) (not e!669038))))

(assert (=> start!99516 (= res!781750 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37214 _keys!1208))))))

(assert (=> start!99516 e!669038))

(declare-fun tp_is_empty!29625 () Bool)

(assert (=> start!99516 tp_is_empty!29625))

(declare-fun array_inv!28012 (array!76057) Bool)

(assert (=> start!99516 (array_inv!28012 _keys!1208)))

(assert (=> start!99516 true))

(assert (=> start!99516 tp!87999))

(declare-fun e!669040 () Bool)

(declare-fun array_inv!28013 (array!76059) Bool)

(assert (=> start!99516 (and (array_inv!28013 _values!996) e!669040)))

(declare-fun b!1176937 () Bool)

(assert (=> b!1176937 (= e!669035 tp_is_empty!29625)))

(declare-fun b!1176938 () Bool)

(declare-fun e!669028 () Bool)

(assert (=> b!1176938 (= e!669028 e!669039)))

(declare-fun res!781738 () Bool)

(assert (=> b!1176938 (=> res!781738 e!669039)))

(assert (=> b!1176938 (= res!781738 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176938 (= lt!531314 (getCurrentListMapNoExtraKeys!4967 lt!531315 lt!531312 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176938 (= lt!531312 (array!76060 (store (arr!36679 _values!996) i!673 (ValueCellFull!14103 lt!531310)) (size!37215 _values!996)))))

(declare-fun dynLambda!2931 (Int (_ BitVec 64)) V!44627)

(assert (=> b!1176938 (= lt!531310 (dynLambda!2931 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531317 () ListLongMap!16987)

(assert (=> b!1176938 (= lt!531317 (getCurrentListMapNoExtraKeys!4967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176939 () Bool)

(declare-fun e!669033 () Bool)

(assert (=> b!1176939 (= e!669040 (and e!669033 mapRes!46265))))

(declare-fun condMapEmpty!46265 () Bool)

(declare-fun mapDefault!46265 () ValueCell!14103)

(assert (=> b!1176939 (= condMapEmpty!46265 (= (arr!36679 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14103)) mapDefault!46265)))))

(declare-fun b!1176940 () Bool)

(declare-fun e!669030 () Bool)

(assert (=> b!1176940 (= e!669037 e!669030)))

(declare-fun res!781739 () Bool)

(assert (=> b!1176940 (=> res!781739 e!669030)))

(assert (=> b!1176940 (= res!781739 (not (= (select (arr!36678 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176941 () Bool)

(assert (=> b!1176941 (= e!669034 (= lt!531317 (+!3824 lt!531313 lt!531304)))))

(declare-fun b!1176942 () Bool)

(declare-fun res!781749 () Bool)

(assert (=> b!1176942 (=> (not res!781749) (not e!669038))))

(assert (=> b!1176942 (= res!781749 (= (select (arr!36678 _keys!1208) i!673) k0!934))))

(declare-fun b!1176943 () Bool)

(declare-fun res!781752 () Bool)

(assert (=> b!1176943 (=> (not res!781752) (not e!669038))))

(assert (=> b!1176943 (= res!781752 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37214 _keys!1208))))))

(declare-fun mapIsEmpty!46265 () Bool)

(assert (=> mapIsEmpty!46265 mapRes!46265))

(declare-fun b!1176944 () Bool)

(declare-fun res!781740 () Bool)

(assert (=> b!1176944 (=> (not res!781740) (not e!669038))))

(assert (=> b!1176944 (= res!781740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176945 () Bool)

(assert (=> b!1176945 (= e!669030 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176946 () Bool)

(assert (=> b!1176946 (= e!669033 tp_is_empty!29625)))

(declare-fun b!1176947 () Bool)

(declare-fun res!781746 () Bool)

(assert (=> b!1176947 (=> (not res!781746) (not e!669038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176947 (= res!781746 (validMask!0 mask!1564))))

(declare-fun b!1176948 () Bool)

(declare-fun res!781753 () Bool)

(assert (=> b!1176948 (=> (not res!781753) (not e!669038))))

(assert (=> b!1176948 (= res!781753 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25754))))

(declare-fun b!1176949 () Bool)

(assert (=> b!1176949 (= e!669029 (not e!669028))))

(declare-fun res!781742 () Bool)

(assert (=> b!1176949 (=> res!781742 e!669028)))

(assert (=> b!1176949 (= res!781742 (bvsgt from!1455 i!673))))

(assert (=> b!1176949 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531309 () Unit!38860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76057 (_ BitVec 64) (_ BitVec 32)) Unit!38860)

(assert (=> b!1176949 (= lt!531309 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176950 () Bool)

(declare-fun res!781748 () Bool)

(assert (=> b!1176950 (=> (not res!781748) (not e!669029))))

(assert (=> b!1176950 (= res!781748 (arrayNoDuplicates!0 lt!531315 #b00000000000000000000000000000000 Nil!25754))))

(assert (= (and start!99516 res!781750) b!1176947))

(assert (= (and b!1176947 res!781746) b!1176932))

(assert (= (and b!1176932 res!781745) b!1176944))

(assert (= (and b!1176944 res!781740) b!1176948))

(assert (= (and b!1176948 res!781753) b!1176943))

(assert (= (and b!1176943 res!781752) b!1176936))

(assert (= (and b!1176936 res!781741) b!1176942))

(assert (= (and b!1176942 res!781749) b!1176935))

(assert (= (and b!1176935 res!781743) b!1176950))

(assert (= (and b!1176950 res!781748) b!1176949))

(assert (= (and b!1176949 (not res!781742)) b!1176938))

(assert (= (and b!1176938 (not res!781738)) b!1176931))

(assert (= (and b!1176931 (not res!781747)) b!1176930))

(assert (= (and b!1176930 res!781744) b!1176940))

(assert (= (and b!1176940 (not res!781739)) b!1176945))

(assert (= (and b!1176930 c!116766) b!1176933))

(assert (= (and b!1176930 (not c!116766)) b!1176934))

(assert (= (and b!1176930 res!781751) b!1176941))

(assert (= (and b!1176939 condMapEmpty!46265) mapIsEmpty!46265))

(assert (= (and b!1176939 (not condMapEmpty!46265)) mapNonEmpty!46265))

(get-info :version)

(assert (= (and mapNonEmpty!46265 ((_ is ValueCellFull!14103) mapValue!46265)) b!1176937))

(assert (= (and b!1176939 ((_ is ValueCellFull!14103) mapDefault!46265)) b!1176946))

(assert (= start!99516 b!1176939))

(declare-fun b_lambda!20239 () Bool)

(assert (=> (not b_lambda!20239) (not b!1176938)))

(declare-fun t!37842 () Bool)

(declare-fun tb!9907 () Bool)

(assert (=> (and start!99516 (= defaultEntry!1004 defaultEntry!1004) t!37842) tb!9907))

(declare-fun result!20381 () Bool)

(assert (=> tb!9907 (= result!20381 tp_is_empty!29625)))

(assert (=> b!1176938 t!37842))

(declare-fun b_and!41059 () Bool)

(assert (= b_and!41057 (and (=> t!37842 result!20381) b_and!41059)))

(declare-fun m!1084869 () Bool)

(assert (=> b!1176936 m!1084869))

(declare-fun m!1084871 () Bool)

(assert (=> start!99516 m!1084871))

(declare-fun m!1084873 () Bool)

(assert (=> start!99516 m!1084873))

(declare-fun m!1084875 () Bool)

(assert (=> b!1176935 m!1084875))

(declare-fun m!1084877 () Bool)

(assert (=> b!1176935 m!1084877))

(declare-fun m!1084879 () Bool)

(assert (=> b!1176945 m!1084879))

(declare-fun m!1084881 () Bool)

(assert (=> b!1176947 m!1084881))

(declare-fun m!1084883 () Bool)

(assert (=> mapNonEmpty!46265 m!1084883))

(declare-fun m!1084885 () Bool)

(assert (=> b!1176950 m!1084885))

(declare-fun m!1084887 () Bool)

(assert (=> b!1176948 m!1084887))

(declare-fun m!1084889 () Bool)

(assert (=> b!1176931 m!1084889))

(declare-fun m!1084891 () Bool)

(assert (=> b!1176931 m!1084891))

(declare-fun m!1084893 () Bool)

(assert (=> b!1176931 m!1084893))

(declare-fun m!1084895 () Bool)

(assert (=> b!1176931 m!1084895))

(declare-fun m!1084897 () Bool)

(assert (=> b!1176931 m!1084897))

(assert (=> b!1176931 m!1084895))

(declare-fun m!1084899 () Bool)

(assert (=> b!1176931 m!1084899))

(declare-fun m!1084901 () Bool)

(assert (=> b!1176938 m!1084901))

(declare-fun m!1084903 () Bool)

(assert (=> b!1176938 m!1084903))

(declare-fun m!1084905 () Bool)

(assert (=> b!1176938 m!1084905))

(declare-fun m!1084907 () Bool)

(assert (=> b!1176938 m!1084907))

(declare-fun m!1084909 () Bool)

(assert (=> b!1176944 m!1084909))

(declare-fun m!1084911 () Bool)

(assert (=> b!1176949 m!1084911))

(declare-fun m!1084913 () Bool)

(assert (=> b!1176949 m!1084913))

(assert (=> b!1176930 m!1084895))

(declare-fun m!1084915 () Bool)

(assert (=> b!1176930 m!1084915))

(declare-fun m!1084917 () Bool)

(assert (=> b!1176930 m!1084917))

(assert (=> b!1176930 m!1084917))

(declare-fun m!1084919 () Bool)

(assert (=> b!1176930 m!1084919))

(declare-fun m!1084921 () Bool)

(assert (=> b!1176933 m!1084921))

(declare-fun m!1084923 () Bool)

(assert (=> b!1176933 m!1084923))

(declare-fun m!1084925 () Bool)

(assert (=> b!1176933 m!1084925))

(declare-fun m!1084927 () Bool)

(assert (=> b!1176933 m!1084927))

(declare-fun m!1084929 () Bool)

(assert (=> b!1176933 m!1084929))

(declare-fun m!1084931 () Bool)

(assert (=> b!1176942 m!1084931))

(declare-fun m!1084933 () Bool)

(assert (=> b!1176941 m!1084933))

(assert (=> b!1176940 m!1084895))

(check-sat (not b!1176944) (not b!1176938) (not b!1176945) (not b_lambda!20239) (not start!99516) (not b!1176930) tp_is_empty!29625 (not b!1176947) (not b!1176936) (not b_next!25095) (not b!1176935) (not b!1176950) (not b!1176933) (not b!1176948) (not b!1176931) b_and!41059 (not b!1176941) (not mapNonEmpty!46265) (not b!1176949))
(check-sat b_and!41059 (not b_next!25095))
