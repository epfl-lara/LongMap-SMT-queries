; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101886 () Bool)

(assert start!101886)

(declare-fun b_free!26371 () Bool)

(declare-fun b_next!26371 () Bool)

(assert (=> start!101886 (= b_free!26371 (not b_next!26371))))

(declare-fun tp!92156 () Bool)

(declare-fun b_and!43987 () Bool)

(assert (=> start!101886 (= tp!92156 b_and!43987)))

(declare-datatypes ((array!78971 0))(
  ( (array!78972 (arr!38107 (Array (_ BitVec 32) (_ BitVec 64))) (size!38644 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78971)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!695245 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1224015 () Bool)

(declare-fun arrayContainsKey!0 (array!78971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224015 (= e!695245 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224016 () Bool)

(declare-fun e!695243 () Bool)

(declare-fun e!695240 () Bool)

(assert (=> b!1224016 (= e!695243 e!695240)))

(declare-fun res!812919 () Bool)

(assert (=> b!1224016 (=> (not res!812919) (not e!695240))))

(declare-fun lt!556851 () array!78971)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78971 (_ BitVec 32)) Bool)

(assert (=> b!1224016 (= res!812919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556851 mask!1564))))

(assert (=> b!1224016 (= lt!556851 (array!78972 (store (arr!38107 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38644 _keys!1208)))))

(declare-fun res!812925 () Bool)

(assert (=> start!101886 (=> (not res!812925) (not e!695243))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101886 (= res!812925 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38644 _keys!1208))))))

(assert (=> start!101886 e!695243))

(declare-fun tp_is_empty!31075 () Bool)

(assert (=> start!101886 tp_is_empty!31075))

(declare-fun array_inv!29072 (array!78971) Bool)

(assert (=> start!101886 (array_inv!29072 _keys!1208)))

(assert (=> start!101886 true))

(assert (=> start!101886 tp!92156))

(declare-datatypes ((V!46561 0))(
  ( (V!46562 (val!15594 Int)) )
))
(declare-datatypes ((ValueCell!14828 0))(
  ( (ValueCellFull!14828 (v!18251 V!46561)) (EmptyCell!14828) )
))
(declare-datatypes ((array!78973 0))(
  ( (array!78974 (arr!38108 (Array (_ BitVec 32) ValueCell!14828)) (size!38645 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78973)

(declare-fun e!695239 () Bool)

(declare-fun array_inv!29073 (array!78973) Bool)

(assert (=> start!101886 (and (array_inv!29073 _values!996) e!695239)))

(declare-fun b!1224017 () Bool)

(declare-fun e!695246 () Bool)

(declare-fun e!695244 () Bool)

(assert (=> b!1224017 (= e!695246 e!695244)))

(declare-fun res!812920 () Bool)

(assert (=> b!1224017 (=> res!812920 e!695244)))

(assert (=> b!1224017 (= res!812920 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46561)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20102 0))(
  ( (tuple2!20103 (_1!10062 (_ BitVec 64)) (_2!10062 V!46561)) )
))
(declare-datatypes ((List!26913 0))(
  ( (Nil!26910) (Cons!26909 (h!28127 tuple2!20102) (t!40256 List!26913)) )
))
(declare-datatypes ((ListLongMap!18079 0))(
  ( (ListLongMap!18080 (toList!9055 List!26913)) )
))
(declare-fun lt!556858 () ListLongMap!18079)

(declare-fun lt!556856 () array!78973)

(declare-fun minValue!944 () V!46561)

(declare-fun getCurrentListMapNoExtraKeys!5507 (array!78971 array!78973 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) Int) ListLongMap!18079)

(assert (=> b!1224017 (= lt!556858 (getCurrentListMapNoExtraKeys!5507 lt!556851 lt!556856 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556855 () V!46561)

(assert (=> b!1224017 (= lt!556856 (array!78974 (store (arr!38108 _values!996) i!673 (ValueCellFull!14828 lt!556855)) (size!38645 _values!996)))))

(declare-fun dynLambda!3406 (Int (_ BitVec 64)) V!46561)

(assert (=> b!1224017 (= lt!556855 (dynLambda!3406 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556857 () ListLongMap!18079)

(assert (=> b!1224017 (= lt!556857 (getCurrentListMapNoExtraKeys!5507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224018 () Bool)

(declare-fun res!812928 () Bool)

(assert (=> b!1224018 (=> (not res!812928) (not e!695243))))

(assert (=> b!1224018 (= res!812928 (= (select (arr!38107 _keys!1208) i!673) k0!934))))

(declare-fun b!1224019 () Bool)

(declare-fun res!812918 () Bool)

(assert (=> b!1224019 (=> (not res!812918) (not e!695243))))

(assert (=> b!1224019 (= res!812918 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38644 _keys!1208))))))

(declare-fun b!1224020 () Bool)

(declare-fun res!812929 () Bool)

(assert (=> b!1224020 (=> (not res!812929) (not e!695240))))

(declare-datatypes ((List!26914 0))(
  ( (Nil!26911) (Cons!26910 (h!28128 (_ BitVec 64)) (t!40257 List!26914)) )
))
(declare-fun arrayNoDuplicates!0 (array!78971 (_ BitVec 32) List!26914) Bool)

(assert (=> b!1224020 (= res!812929 (arrayNoDuplicates!0 lt!556851 #b00000000000000000000000000000000 Nil!26911))))

(declare-fun mapNonEmpty!48508 () Bool)

(declare-fun mapRes!48508 () Bool)

(declare-fun tp!92155 () Bool)

(declare-fun e!695241 () Bool)

(assert (=> mapNonEmpty!48508 (= mapRes!48508 (and tp!92155 e!695241))))

(declare-fun mapKey!48508 () (_ BitVec 32))

(declare-fun mapValue!48508 () ValueCell!14828)

(declare-fun mapRest!48508 () (Array (_ BitVec 32) ValueCell!14828))

(assert (=> mapNonEmpty!48508 (= (arr!38108 _values!996) (store mapRest!48508 mapKey!48508 mapValue!48508))))

(declare-fun b!1224021 () Bool)

(assert (=> b!1224021 (= e!695240 (not e!695246))))

(declare-fun res!812923 () Bool)

(assert (=> b!1224021 (=> res!812923 e!695246)))

(assert (=> b!1224021 (= res!812923 (bvsgt from!1455 i!673))))

(assert (=> b!1224021 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40471 0))(
  ( (Unit!40472) )
))
(declare-fun lt!556852 () Unit!40471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78971 (_ BitVec 64) (_ BitVec 32)) Unit!40471)

(assert (=> b!1224021 (= lt!556852 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224022 () Bool)

(declare-fun e!695248 () Unit!40471)

(declare-fun Unit!40473 () Unit!40471)

(assert (=> b!1224022 (= e!695248 Unit!40473)))

(declare-fun b!1224023 () Bool)

(declare-fun res!812915 () Bool)

(assert (=> b!1224023 (=> (not res!812915) (not e!695243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224023 (= res!812915 (validKeyInArray!0 k0!934))))

(declare-fun b!1224024 () Bool)

(declare-fun res!812924 () Bool)

(assert (=> b!1224024 (=> (not res!812924) (not e!695243))))

(assert (=> b!1224024 (= res!812924 (and (= (size!38645 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38644 _keys!1208) (size!38645 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224025 () Bool)

(declare-fun e!695250 () Bool)

(assert (=> b!1224025 (= e!695250 (bvslt from!1455 (size!38644 _keys!1208)))))

(assert (=> b!1224025 (not (= (select (arr!38107 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556848 () Unit!40471)

(assert (=> b!1224025 (= lt!556848 e!695248)))

(declare-fun c!120736 () Bool)

(assert (=> b!1224025 (= c!120736 (= (select (arr!38107 _keys!1208) from!1455) k0!934))))

(declare-fun e!695247 () Bool)

(assert (=> b!1224025 e!695247))

(declare-fun res!812927 () Bool)

(assert (=> b!1224025 (=> (not res!812927) (not e!695247))))

(declare-fun lt!556845 () ListLongMap!18079)

(declare-fun +!4157 (ListLongMap!18079 tuple2!20102) ListLongMap!18079)

(declare-fun get!19499 (ValueCell!14828 V!46561) V!46561)

(assert (=> b!1224025 (= res!812927 (= lt!556858 (+!4157 lt!556845 (tuple2!20103 (select (arr!38107 _keys!1208) from!1455) (get!19499 (select (arr!38108 _values!996) from!1455) lt!556855)))))))

(declare-fun mapIsEmpty!48508 () Bool)

(assert (=> mapIsEmpty!48508 mapRes!48508))

(declare-fun b!1224026 () Bool)

(declare-fun res!812926 () Bool)

(assert (=> b!1224026 (=> (not res!812926) (not e!695243))))

(assert (=> b!1224026 (= res!812926 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26911))))

(declare-fun b!1224027 () Bool)

(assert (=> b!1224027 (= e!695244 e!695250)))

(declare-fun res!812922 () Bool)

(assert (=> b!1224027 (=> res!812922 e!695250)))

(assert (=> b!1224027 (= res!812922 (not (validKeyInArray!0 (select (arr!38107 _keys!1208) from!1455))))))

(declare-fun lt!556846 () ListLongMap!18079)

(assert (=> b!1224027 (= lt!556846 lt!556845)))

(declare-fun lt!556847 () ListLongMap!18079)

(declare-fun -!1933 (ListLongMap!18079 (_ BitVec 64)) ListLongMap!18079)

(assert (=> b!1224027 (= lt!556845 (-!1933 lt!556847 k0!934))))

(assert (=> b!1224027 (= lt!556846 (getCurrentListMapNoExtraKeys!5507 lt!556851 lt!556856 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224027 (= lt!556847 (getCurrentListMapNoExtraKeys!5507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556853 () Unit!40471)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1148 (array!78971 array!78973 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40471)

(assert (=> b!1224027 (= lt!556853 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1148 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224028 () Bool)

(declare-fun res!812917 () Bool)

(assert (=> b!1224028 (=> (not res!812917) (not e!695243))))

(assert (=> b!1224028 (= res!812917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224029 () Bool)

(declare-fun e!695249 () Bool)

(assert (=> b!1224029 (= e!695239 (and e!695249 mapRes!48508))))

(declare-fun condMapEmpty!48508 () Bool)

(declare-fun mapDefault!48508 () ValueCell!14828)

(assert (=> b!1224029 (= condMapEmpty!48508 (= (arr!38108 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14828)) mapDefault!48508)))))

(declare-fun b!1224030 () Bool)

(declare-fun Unit!40474 () Unit!40471)

(assert (=> b!1224030 (= e!695248 Unit!40474)))

(declare-fun lt!556849 () Unit!40471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78971 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40471)

(assert (=> b!1224030 (= lt!556849 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224030 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556854 () Unit!40471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78971 (_ BitVec 32) (_ BitVec 32)) Unit!40471)

(assert (=> b!1224030 (= lt!556854 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224030 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26911)))

(declare-fun lt!556850 () Unit!40471)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78971 (_ BitVec 64) (_ BitVec 32) List!26914) Unit!40471)

(assert (=> b!1224030 (= lt!556850 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26911))))

(assert (=> b!1224030 false))

(declare-fun b!1224031 () Bool)

(assert (=> b!1224031 (= e!695241 tp_is_empty!31075)))

(declare-fun b!1224032 () Bool)

(assert (=> b!1224032 (= e!695247 e!695245)))

(declare-fun res!812921 () Bool)

(assert (=> b!1224032 (=> res!812921 e!695245)))

(assert (=> b!1224032 (= res!812921 (not (= (select (arr!38107 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224033 () Bool)

(declare-fun res!812916 () Bool)

(assert (=> b!1224033 (=> (not res!812916) (not e!695243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224033 (= res!812916 (validMask!0 mask!1564))))

(declare-fun b!1224034 () Bool)

(assert (=> b!1224034 (= e!695249 tp_is_empty!31075)))

(assert (= (and start!101886 res!812925) b!1224033))

(assert (= (and b!1224033 res!812916) b!1224024))

(assert (= (and b!1224024 res!812924) b!1224028))

(assert (= (and b!1224028 res!812917) b!1224026))

(assert (= (and b!1224026 res!812926) b!1224019))

(assert (= (and b!1224019 res!812918) b!1224023))

(assert (= (and b!1224023 res!812915) b!1224018))

(assert (= (and b!1224018 res!812928) b!1224016))

(assert (= (and b!1224016 res!812919) b!1224020))

(assert (= (and b!1224020 res!812929) b!1224021))

(assert (= (and b!1224021 (not res!812923)) b!1224017))

(assert (= (and b!1224017 (not res!812920)) b!1224027))

(assert (= (and b!1224027 (not res!812922)) b!1224025))

(assert (= (and b!1224025 res!812927) b!1224032))

(assert (= (and b!1224032 (not res!812921)) b!1224015))

(assert (= (and b!1224025 c!120736) b!1224030))

(assert (= (and b!1224025 (not c!120736)) b!1224022))

(assert (= (and b!1224029 condMapEmpty!48508) mapIsEmpty!48508))

(assert (= (and b!1224029 (not condMapEmpty!48508)) mapNonEmpty!48508))

(get-info :version)

(assert (= (and mapNonEmpty!48508 ((_ is ValueCellFull!14828) mapValue!48508)) b!1224031))

(assert (= (and b!1224029 ((_ is ValueCellFull!14828) mapDefault!48508)) b!1224034))

(assert (= start!101886 b!1224029))

(declare-fun b_lambda!22307 () Bool)

(assert (=> (not b_lambda!22307) (not b!1224017)))

(declare-fun t!40255 () Bool)

(declare-fun tb!11163 () Bool)

(assert (=> (and start!101886 (= defaultEntry!1004 defaultEntry!1004) t!40255) tb!11163))

(declare-fun result!22945 () Bool)

(assert (=> tb!11163 (= result!22945 tp_is_empty!31075)))

(assert (=> b!1224017 t!40255))

(declare-fun b_and!43989 () Bool)

(assert (= b_and!43987 (and (=> t!40255 result!22945) b_and!43989)))

(declare-fun m!1129259 () Bool)

(assert (=> b!1224018 m!1129259))

(declare-fun m!1129261 () Bool)

(assert (=> b!1224020 m!1129261))

(declare-fun m!1129263 () Bool)

(assert (=> start!101886 m!1129263))

(declare-fun m!1129265 () Bool)

(assert (=> start!101886 m!1129265))

(declare-fun m!1129267 () Bool)

(assert (=> b!1224028 m!1129267))

(declare-fun m!1129269 () Bool)

(assert (=> b!1224021 m!1129269))

(declare-fun m!1129271 () Bool)

(assert (=> b!1224021 m!1129271))

(declare-fun m!1129273 () Bool)

(assert (=> b!1224033 m!1129273))

(declare-fun m!1129275 () Bool)

(assert (=> mapNonEmpty!48508 m!1129275))

(declare-fun m!1129277 () Bool)

(assert (=> b!1224032 m!1129277))

(declare-fun m!1129279 () Bool)

(assert (=> b!1224030 m!1129279))

(declare-fun m!1129281 () Bool)

(assert (=> b!1224030 m!1129281))

(declare-fun m!1129283 () Bool)

(assert (=> b!1224030 m!1129283))

(declare-fun m!1129285 () Bool)

(assert (=> b!1224030 m!1129285))

(declare-fun m!1129287 () Bool)

(assert (=> b!1224030 m!1129287))

(declare-fun m!1129289 () Bool)

(assert (=> b!1224026 m!1129289))

(declare-fun m!1129291 () Bool)

(assert (=> b!1224017 m!1129291))

(declare-fun m!1129293 () Bool)

(assert (=> b!1224017 m!1129293))

(declare-fun m!1129295 () Bool)

(assert (=> b!1224017 m!1129295))

(declare-fun m!1129297 () Bool)

(assert (=> b!1224017 m!1129297))

(declare-fun m!1129299 () Bool)

(assert (=> b!1224027 m!1129299))

(declare-fun m!1129301 () Bool)

(assert (=> b!1224027 m!1129301))

(assert (=> b!1224027 m!1129277))

(declare-fun m!1129303 () Bool)

(assert (=> b!1224027 m!1129303))

(declare-fun m!1129305 () Bool)

(assert (=> b!1224027 m!1129305))

(assert (=> b!1224027 m!1129277))

(declare-fun m!1129307 () Bool)

(assert (=> b!1224027 m!1129307))

(declare-fun m!1129309 () Bool)

(assert (=> b!1224015 m!1129309))

(declare-fun m!1129311 () Bool)

(assert (=> b!1224016 m!1129311))

(declare-fun m!1129313 () Bool)

(assert (=> b!1224016 m!1129313))

(declare-fun m!1129315 () Bool)

(assert (=> b!1224023 m!1129315))

(assert (=> b!1224025 m!1129277))

(declare-fun m!1129317 () Bool)

(assert (=> b!1224025 m!1129317))

(assert (=> b!1224025 m!1129317))

(declare-fun m!1129319 () Bool)

(assert (=> b!1224025 m!1129319))

(declare-fun m!1129321 () Bool)

(assert (=> b!1224025 m!1129321))

(check-sat (not b!1224015) (not b!1224016) (not b!1224027) (not b!1224023) tp_is_empty!31075 (not start!101886) (not b!1224033) (not b!1224028) (not b!1224017) (not b!1224026) (not b!1224020) (not b_lambda!22307) (not mapNonEmpty!48508) (not b!1224025) b_and!43989 (not b!1224030) (not b!1224021) (not b_next!26371))
(check-sat b_and!43989 (not b_next!26371))
