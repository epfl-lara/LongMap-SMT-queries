; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100002 () Bool)

(assert start!100002)

(declare-fun b_free!25345 () Bool)

(declare-fun b_next!25345 () Bool)

(assert (=> start!100002 (= b_free!25345 (not b_next!25345))))

(declare-fun tp!88749 () Bool)

(declare-fun b_and!41559 () Bool)

(assert (=> start!100002 (= tp!88749 b_and!41559)))

(declare-fun b!1186270 () Bool)

(declare-fun e!674578 () Bool)

(declare-fun e!674577 () Bool)

(declare-fun mapRes!46640 () Bool)

(assert (=> b!1186270 (= e!674578 (and e!674577 mapRes!46640))))

(declare-fun condMapEmpty!46640 () Bool)

(declare-datatypes ((V!44961 0))(
  ( (V!44962 (val!14994 Int)) )
))
(declare-datatypes ((ValueCell!14228 0))(
  ( (ValueCellFull!14228 (v!17628 V!44961)) (EmptyCell!14228) )
))
(declare-datatypes ((array!76595 0))(
  ( (array!76596 (arr!36941 (Array (_ BitVec 32) ValueCell!14228)) (size!37478 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76595)

(declare-fun mapDefault!46640 () ValueCell!14228)

(assert (=> b!1186270 (= condMapEmpty!46640 (= (arr!36941 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14228)) mapDefault!46640)))))

(declare-fun b!1186271 () Bool)

(declare-fun e!674571 () Bool)

(declare-fun e!674572 () Bool)

(assert (=> b!1186271 (= e!674571 e!674572)))

(declare-fun res!788175 () Bool)

(assert (=> b!1186271 (=> res!788175 e!674572)))

(declare-datatypes ((array!76597 0))(
  ( (array!76598 (arr!36942 (Array (_ BitVec 32) (_ BitVec 64))) (size!37479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76597)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1186271 (= res!788175 (not (= (select (arr!36942 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186272 () Bool)

(declare-fun res!788172 () Bool)

(declare-fun e!674581 () Bool)

(assert (=> b!1186272 (=> (not res!788172) (not e!674581))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186272 (= res!788172 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37479 _keys!1208))))))

(declare-fun b!1186273 () Bool)

(declare-fun res!788183 () Bool)

(assert (=> b!1186273 (=> (not res!788183) (not e!674581))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1186273 (= res!788183 (and (= (size!37478 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37479 _keys!1208) (size!37478 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186274 () Bool)

(declare-fun res!788173 () Bool)

(assert (=> b!1186274 (=> (not res!788173) (not e!674581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186274 (= res!788173 (validKeyInArray!0 k0!934))))

(declare-fun b!1186275 () Bool)

(declare-fun res!788179 () Bool)

(declare-fun e!674574 () Bool)

(assert (=> b!1186275 (=> (not res!788179) (not e!674574))))

(declare-fun lt!538073 () array!76597)

(declare-datatypes ((List!26007 0))(
  ( (Nil!26004) (Cons!26003 (h!27221 (_ BitVec 64)) (t!38336 List!26007)) )
))
(declare-fun arrayNoDuplicates!0 (array!76597 (_ BitVec 32) List!26007) Bool)

(assert (=> b!1186275 (= res!788179 (arrayNoDuplicates!0 lt!538073 #b00000000000000000000000000000000 Nil!26004))))

(declare-fun b!1186276 () Bool)

(declare-fun tp_is_empty!29875 () Bool)

(assert (=> b!1186276 (= e!674577 tp_is_empty!29875)))

(declare-fun b!1186277 () Bool)

(declare-fun e!674580 () Bool)

(declare-fun e!674579 () Bool)

(assert (=> b!1186277 (= e!674580 e!674579)))

(declare-fun res!788184 () Bool)

(assert (=> b!1186277 (=> res!788184 e!674579)))

(assert (=> b!1186277 (= res!788184 (not (validKeyInArray!0 (select (arr!36942 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19274 0))(
  ( (tuple2!19275 (_1!9648 (_ BitVec 64)) (_2!9648 V!44961)) )
))
(declare-datatypes ((List!26008 0))(
  ( (Nil!26005) (Cons!26004 (h!27222 tuple2!19274) (t!38337 List!26008)) )
))
(declare-datatypes ((ListLongMap!17251 0))(
  ( (ListLongMap!17252 (toList!8641 List!26008)) )
))
(declare-fun lt!538072 () ListLongMap!17251)

(declare-fun lt!538080 () ListLongMap!17251)

(assert (=> b!1186277 (= lt!538072 lt!538080)))

(declare-fun lt!538081 () ListLongMap!17251)

(declare-fun -!1662 (ListLongMap!17251 (_ BitVec 64)) ListLongMap!17251)

(assert (=> b!1186277 (= lt!538080 (-!1662 lt!538081 k0!934))))

(declare-fun lt!538083 () array!76595)

(declare-fun minValue!944 () V!44961)

(declare-fun zeroValue!944 () V!44961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5112 (array!76597 array!76595 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) Int) ListLongMap!17251)

(assert (=> b!1186277 (= lt!538072 (getCurrentListMapNoExtraKeys!5112 lt!538073 lt!538083 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186277 (= lt!538081 (getCurrentListMapNoExtraKeys!5112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39247 0))(
  ( (Unit!39248) )
))
(declare-fun lt!538071 () Unit!39247)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 (array!76597 array!76595 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39247)

(assert (=> b!1186277 (= lt!538071 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186278 () Bool)

(declare-fun arrayContainsKey!0 (array!76597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186278 (= e!674572 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46640 () Bool)

(assert (=> mapIsEmpty!46640 mapRes!46640))

(declare-fun b!1186279 () Bool)

(declare-fun res!788186 () Bool)

(assert (=> b!1186279 (=> (not res!788186) (not e!674581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186279 (= res!788186 (validMask!0 mask!1564))))

(declare-fun b!1186280 () Bool)

(declare-fun res!788178 () Bool)

(assert (=> b!1186280 (=> (not res!788178) (not e!674581))))

(assert (=> b!1186280 (= res!788178 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26004))))

(declare-fun b!1186282 () Bool)

(assert (=> b!1186282 (= e!674579 true)))

(declare-fun lt!538075 () ListLongMap!17251)

(declare-fun lt!538084 () ListLongMap!17251)

(assert (=> b!1186282 (= (-!1662 lt!538075 k0!934) lt!538084)))

(declare-fun lt!538069 () V!44961)

(declare-fun lt!538077 () Unit!39247)

(declare-fun addRemoveCommutativeForDiffKeys!175 (ListLongMap!17251 (_ BitVec 64) V!44961 (_ BitVec 64)) Unit!39247)

(assert (=> b!1186282 (= lt!538077 (addRemoveCommutativeForDiffKeys!175 lt!538081 (select (arr!36942 _keys!1208) from!1455) lt!538069 k0!934))))

(declare-fun lt!538085 () ListLongMap!17251)

(assert (=> b!1186282 (and (= lt!538085 lt!538075) (= lt!538080 lt!538072))))

(declare-fun lt!538078 () tuple2!19274)

(declare-fun +!3959 (ListLongMap!17251 tuple2!19274) ListLongMap!17251)

(assert (=> b!1186282 (= lt!538075 (+!3959 lt!538081 lt!538078))))

(assert (=> b!1186282 (not (= (select (arr!36942 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538086 () Unit!39247)

(declare-fun e!674573 () Unit!39247)

(assert (=> b!1186282 (= lt!538086 e!674573)))

(declare-fun c!117539 () Bool)

(assert (=> b!1186282 (= c!117539 (= (select (arr!36942 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186282 e!674571))

(declare-fun res!788180 () Bool)

(assert (=> b!1186282 (=> (not res!788180) (not e!674571))))

(declare-fun lt!538087 () ListLongMap!17251)

(assert (=> b!1186282 (= res!788180 (= lt!538087 lt!538084))))

(assert (=> b!1186282 (= lt!538084 (+!3959 lt!538080 lt!538078))))

(assert (=> b!1186282 (= lt!538078 (tuple2!19275 (select (arr!36942 _keys!1208) from!1455) lt!538069))))

(declare-fun lt!538079 () V!44961)

(declare-fun get!18952 (ValueCell!14228 V!44961) V!44961)

(assert (=> b!1186282 (= lt!538069 (get!18952 (select (arr!36941 _values!996) from!1455) lt!538079))))

(declare-fun b!1186283 () Bool)

(declare-fun res!788185 () Bool)

(assert (=> b!1186283 (=> (not res!788185) (not e!674581))))

(assert (=> b!1186283 (= res!788185 (= (select (arr!36942 _keys!1208) i!673) k0!934))))

(declare-fun b!1186284 () Bool)

(declare-fun e!674576 () Bool)

(assert (=> b!1186284 (= e!674574 (not e!674576))))

(declare-fun res!788182 () Bool)

(assert (=> b!1186284 (=> res!788182 e!674576)))

(assert (=> b!1186284 (= res!788182 (bvsgt from!1455 i!673))))

(assert (=> b!1186284 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538082 () Unit!39247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76597 (_ BitVec 64) (_ BitVec 32)) Unit!39247)

(assert (=> b!1186284 (= lt!538082 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46640 () Bool)

(declare-fun tp!88748 () Bool)

(declare-fun e!674582 () Bool)

(assert (=> mapNonEmpty!46640 (= mapRes!46640 (and tp!88748 e!674582))))

(declare-fun mapKey!46640 () (_ BitVec 32))

(declare-fun mapRest!46640 () (Array (_ BitVec 32) ValueCell!14228))

(declare-fun mapValue!46640 () ValueCell!14228)

(assert (=> mapNonEmpty!46640 (= (arr!36941 _values!996) (store mapRest!46640 mapKey!46640 mapValue!46640))))

(declare-fun b!1186285 () Bool)

(assert (=> b!1186285 (= e!674576 e!674580)))

(declare-fun res!788174 () Bool)

(assert (=> b!1186285 (=> res!788174 e!674580)))

(assert (=> b!1186285 (= res!788174 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1186285 (= lt!538087 (getCurrentListMapNoExtraKeys!5112 lt!538073 lt!538083 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186285 (= lt!538083 (array!76596 (store (arr!36941 _values!996) i!673 (ValueCellFull!14228 lt!538079)) (size!37478 _values!996)))))

(declare-fun dynLambda!3073 (Int (_ BitVec 64)) V!44961)

(assert (=> b!1186285 (= lt!538079 (dynLambda!3073 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186285 (= lt!538085 (getCurrentListMapNoExtraKeys!5112 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186286 () Bool)

(assert (=> b!1186286 (= e!674582 tp_is_empty!29875)))

(declare-fun b!1186287 () Bool)

(declare-fun res!788181 () Bool)

(assert (=> b!1186287 (=> (not res!788181) (not e!674581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76597 (_ BitVec 32)) Bool)

(assert (=> b!1186287 (= res!788181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!788176 () Bool)

(assert (=> start!100002 (=> (not res!788176) (not e!674581))))

(assert (=> start!100002 (= res!788176 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37479 _keys!1208))))))

(assert (=> start!100002 e!674581))

(assert (=> start!100002 tp_is_empty!29875))

(declare-fun array_inv!28266 (array!76597) Bool)

(assert (=> start!100002 (array_inv!28266 _keys!1208)))

(assert (=> start!100002 true))

(assert (=> start!100002 tp!88749))

(declare-fun array_inv!28267 (array!76595) Bool)

(assert (=> start!100002 (and (array_inv!28267 _values!996) e!674578)))

(declare-fun b!1186281 () Bool)

(declare-fun Unit!39249 () Unit!39247)

(assert (=> b!1186281 (= e!674573 Unit!39249)))

(declare-fun lt!538070 () Unit!39247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39247)

(assert (=> b!1186281 (= lt!538070 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186281 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538076 () Unit!39247)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76597 (_ BitVec 32) (_ BitVec 32)) Unit!39247)

(assert (=> b!1186281 (= lt!538076 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186281 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26004)))

(declare-fun lt!538074 () Unit!39247)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76597 (_ BitVec 64) (_ BitVec 32) List!26007) Unit!39247)

(assert (=> b!1186281 (= lt!538074 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26004))))

(assert (=> b!1186281 false))

(declare-fun b!1186288 () Bool)

(assert (=> b!1186288 (= e!674581 e!674574)))

(declare-fun res!788177 () Bool)

(assert (=> b!1186288 (=> (not res!788177) (not e!674574))))

(assert (=> b!1186288 (= res!788177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538073 mask!1564))))

(assert (=> b!1186288 (= lt!538073 (array!76598 (store (arr!36942 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37479 _keys!1208)))))

(declare-fun b!1186289 () Bool)

(declare-fun Unit!39250 () Unit!39247)

(assert (=> b!1186289 (= e!674573 Unit!39250)))

(assert (= (and start!100002 res!788176) b!1186279))

(assert (= (and b!1186279 res!788186) b!1186273))

(assert (= (and b!1186273 res!788183) b!1186287))

(assert (= (and b!1186287 res!788181) b!1186280))

(assert (= (and b!1186280 res!788178) b!1186272))

(assert (= (and b!1186272 res!788172) b!1186274))

(assert (= (and b!1186274 res!788173) b!1186283))

(assert (= (and b!1186283 res!788185) b!1186288))

(assert (= (and b!1186288 res!788177) b!1186275))

(assert (= (and b!1186275 res!788179) b!1186284))

(assert (= (and b!1186284 (not res!788182)) b!1186285))

(assert (= (and b!1186285 (not res!788174)) b!1186277))

(assert (= (and b!1186277 (not res!788184)) b!1186282))

(assert (= (and b!1186282 res!788180) b!1186271))

(assert (= (and b!1186271 (not res!788175)) b!1186278))

(assert (= (and b!1186282 c!117539) b!1186281))

(assert (= (and b!1186282 (not c!117539)) b!1186289))

(assert (= (and b!1186270 condMapEmpty!46640) mapIsEmpty!46640))

(assert (= (and b!1186270 (not condMapEmpty!46640)) mapNonEmpty!46640))

(get-info :version)

(assert (= (and mapNonEmpty!46640 ((_ is ValueCellFull!14228) mapValue!46640)) b!1186286))

(assert (= (and b!1186270 ((_ is ValueCellFull!14228) mapDefault!46640)) b!1186276))

(assert (= start!100002 b!1186270))

(declare-fun b_lambda!20483 () Bool)

(assert (=> (not b_lambda!20483) (not b!1186285)))

(declare-fun t!38335 () Bool)

(declare-fun tb!10149 () Bool)

(assert (=> (and start!100002 (= defaultEntry!1004 defaultEntry!1004) t!38335) tb!10149))

(declare-fun result!20873 () Bool)

(assert (=> tb!10149 (= result!20873 tp_is_empty!29875)))

(assert (=> b!1186285 t!38335))

(declare-fun b_and!41561 () Bool)

(assert (= b_and!41559 (and (=> t!38335 result!20873) b_and!41561)))

(declare-fun m!1094907 () Bool)

(assert (=> b!1186287 m!1094907))

(declare-fun m!1094909 () Bool)

(assert (=> b!1186277 m!1094909))

(declare-fun m!1094911 () Bool)

(assert (=> b!1186277 m!1094911))

(declare-fun m!1094913 () Bool)

(assert (=> b!1186277 m!1094913))

(declare-fun m!1094915 () Bool)

(assert (=> b!1186277 m!1094915))

(declare-fun m!1094917 () Bool)

(assert (=> b!1186277 m!1094917))

(declare-fun m!1094919 () Bool)

(assert (=> b!1186277 m!1094919))

(assert (=> b!1186277 m!1094917))

(assert (=> b!1186271 m!1094917))

(declare-fun m!1094921 () Bool)

(assert (=> b!1186278 m!1094921))

(declare-fun m!1094923 () Bool)

(assert (=> start!100002 m!1094923))

(declare-fun m!1094925 () Bool)

(assert (=> start!100002 m!1094925))

(declare-fun m!1094927 () Bool)

(assert (=> b!1186288 m!1094927))

(declare-fun m!1094929 () Bool)

(assert (=> b!1186288 m!1094929))

(declare-fun m!1094931 () Bool)

(assert (=> b!1186275 m!1094931))

(declare-fun m!1094933 () Bool)

(assert (=> b!1186274 m!1094933))

(declare-fun m!1094935 () Bool)

(assert (=> b!1186281 m!1094935))

(declare-fun m!1094937 () Bool)

(assert (=> b!1186281 m!1094937))

(declare-fun m!1094939 () Bool)

(assert (=> b!1186281 m!1094939))

(declare-fun m!1094941 () Bool)

(assert (=> b!1186281 m!1094941))

(declare-fun m!1094943 () Bool)

(assert (=> b!1186281 m!1094943))

(declare-fun m!1094945 () Bool)

(assert (=> b!1186279 m!1094945))

(declare-fun m!1094947 () Bool)

(assert (=> b!1186284 m!1094947))

(declare-fun m!1094949 () Bool)

(assert (=> b!1186284 m!1094949))

(declare-fun m!1094951 () Bool)

(assert (=> b!1186283 m!1094951))

(declare-fun m!1094953 () Bool)

(assert (=> b!1186282 m!1094953))

(declare-fun m!1094955 () Bool)

(assert (=> b!1186282 m!1094955))

(assert (=> b!1186282 m!1094953))

(declare-fun m!1094957 () Bool)

(assert (=> b!1186282 m!1094957))

(assert (=> b!1186282 m!1094917))

(declare-fun m!1094959 () Bool)

(assert (=> b!1186282 m!1094959))

(declare-fun m!1094961 () Bool)

(assert (=> b!1186282 m!1094961))

(assert (=> b!1186282 m!1094917))

(declare-fun m!1094963 () Bool)

(assert (=> b!1186282 m!1094963))

(declare-fun m!1094965 () Bool)

(assert (=> mapNonEmpty!46640 m!1094965))

(declare-fun m!1094967 () Bool)

(assert (=> b!1186285 m!1094967))

(declare-fun m!1094969 () Bool)

(assert (=> b!1186285 m!1094969))

(declare-fun m!1094971 () Bool)

(assert (=> b!1186285 m!1094971))

(declare-fun m!1094973 () Bool)

(assert (=> b!1186285 m!1094973))

(declare-fun m!1094975 () Bool)

(assert (=> b!1186280 m!1094975))

(check-sat (not b!1186284) (not b!1186287) (not b!1186277) (not b!1186278) b_and!41561 (not b_lambda!20483) (not b!1186285) (not b!1186275) (not start!100002) tp_is_empty!29875 (not b!1186279) (not b!1186288) (not b!1186282) (not b!1186274) (not b!1186281) (not b!1186280) (not b_next!25345) (not mapNonEmpty!46640))
(check-sat b_and!41561 (not b_next!25345))
