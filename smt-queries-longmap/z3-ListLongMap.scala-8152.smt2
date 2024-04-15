; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99772 () Bool)

(assert start!99772)

(declare-fun b_free!25357 () Bool)

(declare-fun b_next!25357 () Bool)

(assert (=> start!99772 (= b_free!25357 (not b_next!25357))))

(declare-fun tp!88784 () Bool)

(declare-fun b_and!41559 () Bool)

(assert (=> start!99772 (= tp!88784 b_and!41559)))

(declare-fun b!1185229 () Bool)

(declare-fun e!673883 () Bool)

(declare-fun e!673886 () Bool)

(declare-fun mapRes!46658 () Bool)

(assert (=> b!1185229 (= e!673883 (and e!673886 mapRes!46658))))

(declare-fun condMapEmpty!46658 () Bool)

(declare-datatypes ((V!44977 0))(
  ( (V!44978 (val!15000 Int)) )
))
(declare-datatypes ((ValueCell!14234 0))(
  ( (ValueCellFull!14234 (v!17637 V!44977)) (EmptyCell!14234) )
))
(declare-datatypes ((array!76508 0))(
  ( (array!76509 (arr!36904 (Array (_ BitVec 32) ValueCell!14234)) (size!37442 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76508)

(declare-fun mapDefault!46658 () ValueCell!14234)

(assert (=> b!1185229 (= condMapEmpty!46658 (= (arr!36904 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14234)) mapDefault!46658)))))

(declare-fun b!1185230 () Bool)

(declare-datatypes ((Unit!39136 0))(
  ( (Unit!39137) )
))
(declare-fun e!673880 () Unit!39136)

(declare-fun Unit!39138 () Unit!39136)

(assert (=> b!1185230 (= e!673880 Unit!39138)))

(declare-fun b!1185231 () Bool)

(declare-fun e!673877 () Bool)

(declare-fun tp_is_empty!29887 () Bool)

(assert (=> b!1185231 (= e!673877 tp_is_empty!29887)))

(declare-fun res!787870 () Bool)

(declare-fun e!673884 () Bool)

(assert (=> start!99772 (=> (not res!787870) (not e!673884))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76510 0))(
  ( (array!76511 (arr!36905 (Array (_ BitVec 32) (_ BitVec 64))) (size!37443 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76510)

(assert (=> start!99772 (= res!787870 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37443 _keys!1208))))))

(assert (=> start!99772 e!673884))

(assert (=> start!99772 tp_is_empty!29887))

(declare-fun array_inv!28278 (array!76510) Bool)

(assert (=> start!99772 (array_inv!28278 _keys!1208)))

(assert (=> start!99772 true))

(assert (=> start!99772 tp!88784))

(declare-fun array_inv!28279 (array!76508) Bool)

(assert (=> start!99772 (and (array_inv!28279 _values!996) e!673883)))

(declare-fun b!1185232 () Bool)

(declare-fun res!787871 () Bool)

(assert (=> b!1185232 (=> (not res!787871) (not e!673884))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1185232 (= res!787871 (= (select (arr!36905 _keys!1208) i!673) k0!934))))

(declare-fun b!1185233 () Bool)

(declare-fun e!673882 () Bool)

(assert (=> b!1185233 (= e!673882 true)))

(declare-datatypes ((tuple2!19354 0))(
  ( (tuple2!19355 (_1!9688 (_ BitVec 64)) (_2!9688 V!44977)) )
))
(declare-datatypes ((List!26066 0))(
  ( (Nil!26063) (Cons!26062 (h!27271 tuple2!19354) (t!38406 List!26066)) )
))
(declare-datatypes ((ListLongMap!17323 0))(
  ( (ListLongMap!17324 (toList!8677 List!26066)) )
))
(declare-fun lt!537747 () ListLongMap!17323)

(declare-fun lt!537753 () ListLongMap!17323)

(declare-fun -!1631 (ListLongMap!17323 (_ BitVec 64)) ListLongMap!17323)

(assert (=> b!1185233 (= (-!1631 lt!537747 k0!934) lt!537753)))

(declare-fun lt!537739 () ListLongMap!17323)

(declare-fun lt!537751 () V!44977)

(declare-fun lt!537745 () Unit!39136)

(declare-fun addRemoveCommutativeForDiffKeys!174 (ListLongMap!17323 (_ BitVec 64) V!44977 (_ BitVec 64)) Unit!39136)

(assert (=> b!1185233 (= lt!537745 (addRemoveCommutativeForDiffKeys!174 lt!537739 (select (arr!36905 _keys!1208) from!1455) lt!537751 k0!934))))

(declare-fun lt!537744 () ListLongMap!17323)

(declare-fun lt!537742 () ListLongMap!17323)

(declare-fun lt!537741 () ListLongMap!17323)

(assert (=> b!1185233 (and (= lt!537742 lt!537747) (= lt!537744 lt!537741))))

(declare-fun lt!537752 () tuple2!19354)

(declare-fun +!3960 (ListLongMap!17323 tuple2!19354) ListLongMap!17323)

(assert (=> b!1185233 (= lt!537747 (+!3960 lt!537739 lt!537752))))

(assert (=> b!1185233 (not (= (select (arr!36905 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537735 () Unit!39136)

(assert (=> b!1185233 (= lt!537735 e!673880)))

(declare-fun c!117133 () Bool)

(assert (=> b!1185233 (= c!117133 (= (select (arr!36905 _keys!1208) from!1455) k0!934))))

(declare-fun e!673885 () Bool)

(assert (=> b!1185233 e!673885))

(declare-fun res!787882 () Bool)

(assert (=> b!1185233 (=> (not res!787882) (not e!673885))))

(declare-fun lt!537749 () ListLongMap!17323)

(assert (=> b!1185233 (= res!787882 (= lt!537749 lt!537753))))

(assert (=> b!1185233 (= lt!537753 (+!3960 lt!537744 lt!537752))))

(assert (=> b!1185233 (= lt!537752 (tuple2!19355 (select (arr!36905 _keys!1208) from!1455) lt!537751))))

(declare-fun lt!537743 () V!44977)

(declare-fun get!18901 (ValueCell!14234 V!44977) V!44977)

(assert (=> b!1185233 (= lt!537751 (get!18901 (select (arr!36904 _values!996) from!1455) lt!537743))))

(declare-fun b!1185234 () Bool)

(declare-fun res!787876 () Bool)

(assert (=> b!1185234 (=> (not res!787876) (not e!673884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185234 (= res!787876 (validKeyInArray!0 k0!934))))

(declare-fun b!1185235 () Bool)

(declare-fun res!787869 () Bool)

(assert (=> b!1185235 (=> (not res!787869) (not e!673884))))

(assert (=> b!1185235 (= res!787869 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37443 _keys!1208))))))

(declare-fun b!1185236 () Bool)

(declare-fun e!673888 () Bool)

(assert (=> b!1185236 (= e!673888 e!673882)))

(declare-fun res!787878 () Bool)

(assert (=> b!1185236 (=> res!787878 e!673882)))

(assert (=> b!1185236 (= res!787878 (not (validKeyInArray!0 (select (arr!36905 _keys!1208) from!1455))))))

(assert (=> b!1185236 (= lt!537741 lt!537744)))

(assert (=> b!1185236 (= lt!537744 (-!1631 lt!537739 k0!934))))

(declare-fun zeroValue!944 () V!44977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!537748 () array!76508)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537738 () array!76510)

(declare-fun minValue!944 () V!44977)

(declare-fun getCurrentListMapNoExtraKeys!5130 (array!76510 array!76508 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) Int) ListLongMap!17323)

(assert (=> b!1185236 (= lt!537741 (getCurrentListMapNoExtraKeys!5130 lt!537738 lt!537748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185236 (= lt!537739 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537740 () Unit!39136)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!889 (array!76510 array!76508 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39136)

(assert (=> b!1185236 (= lt!537740 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185237 () Bool)

(declare-fun e!673887 () Bool)

(assert (=> b!1185237 (= e!673887 e!673888)))

(declare-fun res!787874 () Bool)

(assert (=> b!1185237 (=> res!787874 e!673888)))

(assert (=> b!1185237 (= res!787874 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185237 (= lt!537749 (getCurrentListMapNoExtraKeys!5130 lt!537738 lt!537748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185237 (= lt!537748 (array!76509 (store (arr!36904 _values!996) i!673 (ValueCellFull!14234 lt!537743)) (size!37442 _values!996)))))

(declare-fun dynLambda!3031 (Int (_ BitVec 64)) V!44977)

(assert (=> b!1185237 (= lt!537743 (dynLambda!3031 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185237 (= lt!537742 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185238 () Bool)

(declare-fun res!787875 () Bool)

(declare-fun e!673878 () Bool)

(assert (=> b!1185238 (=> (not res!787875) (not e!673878))))

(declare-datatypes ((List!26067 0))(
  ( (Nil!26064) (Cons!26063 (h!27272 (_ BitVec 64)) (t!38407 List!26067)) )
))
(declare-fun arrayNoDuplicates!0 (array!76510 (_ BitVec 32) List!26067) Bool)

(assert (=> b!1185238 (= res!787875 (arrayNoDuplicates!0 lt!537738 #b00000000000000000000000000000000 Nil!26064))))

(declare-fun mapIsEmpty!46658 () Bool)

(assert (=> mapIsEmpty!46658 mapRes!46658))

(declare-fun b!1185239 () Bool)

(declare-fun res!787879 () Bool)

(assert (=> b!1185239 (=> (not res!787879) (not e!673884))))

(assert (=> b!1185239 (= res!787879 (and (= (size!37442 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37443 _keys!1208) (size!37442 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185240 () Bool)

(assert (=> b!1185240 (= e!673886 tp_is_empty!29887)))

(declare-fun b!1185241 () Bool)

(declare-fun Unit!39139 () Unit!39136)

(assert (=> b!1185241 (= e!673880 Unit!39139)))

(declare-fun lt!537746 () Unit!39136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76510 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39136)

(assert (=> b!1185241 (= lt!537746 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185241 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537736 () Unit!39136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76510 (_ BitVec 32) (_ BitVec 32)) Unit!39136)

(assert (=> b!1185241 (= lt!537736 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185241 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26064)))

(declare-fun lt!537750 () Unit!39136)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76510 (_ BitVec 64) (_ BitVec 32) List!26067) Unit!39136)

(assert (=> b!1185241 (= lt!537750 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26064))))

(assert (=> b!1185241 false))

(declare-fun b!1185242 () Bool)

(declare-fun res!787880 () Bool)

(assert (=> b!1185242 (=> (not res!787880) (not e!673884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185242 (= res!787880 (validMask!0 mask!1564))))

(declare-fun b!1185243 () Bool)

(declare-fun res!787877 () Bool)

(assert (=> b!1185243 (=> (not res!787877) (not e!673884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76510 (_ BitVec 32)) Bool)

(assert (=> b!1185243 (= res!787877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185244 () Bool)

(assert (=> b!1185244 (= e!673878 (not e!673887))))

(declare-fun res!787873 () Bool)

(assert (=> b!1185244 (=> res!787873 e!673887)))

(assert (=> b!1185244 (= res!787873 (bvsgt from!1455 i!673))))

(assert (=> b!1185244 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537737 () Unit!39136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76510 (_ BitVec 64) (_ BitVec 32)) Unit!39136)

(assert (=> b!1185244 (= lt!537737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185245 () Bool)

(declare-fun e!673881 () Bool)

(assert (=> b!1185245 (= e!673885 e!673881)))

(declare-fun res!787872 () Bool)

(assert (=> b!1185245 (=> res!787872 e!673881)))

(assert (=> b!1185245 (= res!787872 (not (= (select (arr!36905 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185246 () Bool)

(declare-fun res!787868 () Bool)

(assert (=> b!1185246 (=> (not res!787868) (not e!673884))))

(assert (=> b!1185246 (= res!787868 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26064))))

(declare-fun mapNonEmpty!46658 () Bool)

(declare-fun tp!88785 () Bool)

(assert (=> mapNonEmpty!46658 (= mapRes!46658 (and tp!88785 e!673877))))

(declare-fun mapRest!46658 () (Array (_ BitVec 32) ValueCell!14234))

(declare-fun mapKey!46658 () (_ BitVec 32))

(declare-fun mapValue!46658 () ValueCell!14234)

(assert (=> mapNonEmpty!46658 (= (arr!36904 _values!996) (store mapRest!46658 mapKey!46658 mapValue!46658))))

(declare-fun b!1185247 () Bool)

(assert (=> b!1185247 (= e!673881 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185248 () Bool)

(assert (=> b!1185248 (= e!673884 e!673878)))

(declare-fun res!787881 () Bool)

(assert (=> b!1185248 (=> (not res!787881) (not e!673878))))

(assert (=> b!1185248 (= res!787881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537738 mask!1564))))

(assert (=> b!1185248 (= lt!537738 (array!76511 (store (arr!36905 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37443 _keys!1208)))))

(assert (= (and start!99772 res!787870) b!1185242))

(assert (= (and b!1185242 res!787880) b!1185239))

(assert (= (and b!1185239 res!787879) b!1185243))

(assert (= (and b!1185243 res!787877) b!1185246))

(assert (= (and b!1185246 res!787868) b!1185235))

(assert (= (and b!1185235 res!787869) b!1185234))

(assert (= (and b!1185234 res!787876) b!1185232))

(assert (= (and b!1185232 res!787871) b!1185248))

(assert (= (and b!1185248 res!787881) b!1185238))

(assert (= (and b!1185238 res!787875) b!1185244))

(assert (= (and b!1185244 (not res!787873)) b!1185237))

(assert (= (and b!1185237 (not res!787874)) b!1185236))

(assert (= (and b!1185236 (not res!787878)) b!1185233))

(assert (= (and b!1185233 res!787882) b!1185245))

(assert (= (and b!1185245 (not res!787872)) b!1185247))

(assert (= (and b!1185233 c!117133) b!1185241))

(assert (= (and b!1185233 (not c!117133)) b!1185230))

(assert (= (and b!1185229 condMapEmpty!46658) mapIsEmpty!46658))

(assert (= (and b!1185229 (not condMapEmpty!46658)) mapNonEmpty!46658))

(get-info :version)

(assert (= (and mapNonEmpty!46658 ((_ is ValueCellFull!14234) mapValue!46658)) b!1185231))

(assert (= (and b!1185229 ((_ is ValueCellFull!14234) mapDefault!46658)) b!1185240))

(assert (= start!99772 b!1185229))

(declare-fun b_lambda!20483 () Bool)

(assert (=> (not b_lambda!20483) (not b!1185237)))

(declare-fun t!38405 () Bool)

(declare-fun tb!10161 () Bool)

(assert (=> (and start!99772 (= defaultEntry!1004 defaultEntry!1004) t!38405) tb!10161))

(declare-fun result!20897 () Bool)

(assert (=> tb!10161 (= result!20897 tp_is_empty!29887)))

(assert (=> b!1185237 t!38405))

(declare-fun b_and!41561 () Bool)

(assert (= b_and!41559 (and (=> t!38405 result!20897) b_and!41561)))

(declare-fun m!1093145 () Bool)

(assert (=> b!1185244 m!1093145))

(declare-fun m!1093147 () Bool)

(assert (=> b!1185244 m!1093147))

(declare-fun m!1093149 () Bool)

(assert (=> b!1185236 m!1093149))

(declare-fun m!1093151 () Bool)

(assert (=> b!1185236 m!1093151))

(declare-fun m!1093153 () Bool)

(assert (=> b!1185236 m!1093153))

(declare-fun m!1093155 () Bool)

(assert (=> b!1185236 m!1093155))

(declare-fun m!1093157 () Bool)

(assert (=> b!1185236 m!1093157))

(declare-fun m!1093159 () Bool)

(assert (=> b!1185236 m!1093159))

(assert (=> b!1185236 m!1093155))

(declare-fun m!1093161 () Bool)

(assert (=> b!1185233 m!1093161))

(declare-fun m!1093163 () Bool)

(assert (=> b!1185233 m!1093163))

(declare-fun m!1093165 () Bool)

(assert (=> b!1185233 m!1093165))

(assert (=> b!1185233 m!1093161))

(declare-fun m!1093167 () Bool)

(assert (=> b!1185233 m!1093167))

(declare-fun m!1093169 () Bool)

(assert (=> b!1185233 m!1093169))

(assert (=> b!1185233 m!1093155))

(assert (=> b!1185233 m!1093155))

(declare-fun m!1093171 () Bool)

(assert (=> b!1185233 m!1093171))

(declare-fun m!1093173 () Bool)

(assert (=> b!1185237 m!1093173))

(declare-fun m!1093175 () Bool)

(assert (=> b!1185237 m!1093175))

(declare-fun m!1093177 () Bool)

(assert (=> b!1185237 m!1093177))

(declare-fun m!1093179 () Bool)

(assert (=> b!1185237 m!1093179))

(declare-fun m!1093181 () Bool)

(assert (=> b!1185243 m!1093181))

(declare-fun m!1093183 () Bool)

(assert (=> b!1185238 m!1093183))

(declare-fun m!1093185 () Bool)

(assert (=> b!1185242 m!1093185))

(assert (=> b!1185245 m!1093155))

(declare-fun m!1093187 () Bool)

(assert (=> start!99772 m!1093187))

(declare-fun m!1093189 () Bool)

(assert (=> start!99772 m!1093189))

(declare-fun m!1093191 () Bool)

(assert (=> mapNonEmpty!46658 m!1093191))

(declare-fun m!1093193 () Bool)

(assert (=> b!1185241 m!1093193))

(declare-fun m!1093195 () Bool)

(assert (=> b!1185241 m!1093195))

(declare-fun m!1093197 () Bool)

(assert (=> b!1185241 m!1093197))

(declare-fun m!1093199 () Bool)

(assert (=> b!1185241 m!1093199))

(declare-fun m!1093201 () Bool)

(assert (=> b!1185241 m!1093201))

(declare-fun m!1093203 () Bool)

(assert (=> b!1185246 m!1093203))

(declare-fun m!1093205 () Bool)

(assert (=> b!1185248 m!1093205))

(declare-fun m!1093207 () Bool)

(assert (=> b!1185248 m!1093207))

(declare-fun m!1093209 () Bool)

(assert (=> b!1185234 m!1093209))

(declare-fun m!1093211 () Bool)

(assert (=> b!1185247 m!1093211))

(declare-fun m!1093213 () Bool)

(assert (=> b!1185232 m!1093213))

(check-sat (not b!1185241) tp_is_empty!29887 (not b!1185244) (not b!1185233) (not b!1185237) (not b!1185236) (not b!1185248) (not b_next!25357) (not b_lambda!20483) (not mapNonEmpty!46658) (not b!1185243) (not start!99772) (not b!1185247) b_and!41561 (not b!1185238) (not b!1185234) (not b!1185242) (not b!1185246))
(check-sat b_and!41561 (not b_next!25357))
