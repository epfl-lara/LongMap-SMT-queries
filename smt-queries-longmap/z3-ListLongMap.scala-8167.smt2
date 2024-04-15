; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99862 () Bool)

(assert start!99862)

(declare-fun b_free!25447 () Bool)

(declare-fun b_next!25447 () Bool)

(assert (=> start!99862 (= b_free!25447 (not b_next!25447))))

(declare-fun tp!89055 () Bool)

(declare-fun b_and!41739 () Bool)

(assert (=> start!99862 (= tp!89055 b_and!41739)))

(declare-fun b!1188019 () Bool)

(declare-fun e!675503 () Bool)

(declare-fun e!675504 () Bool)

(assert (=> b!1188019 (= e!675503 e!675504)))

(declare-fun res!789907 () Bool)

(assert (=> b!1188019 (=> res!789907 e!675504)))

(declare-datatypes ((array!76688 0))(
  ( (array!76689 (arr!36994 (Array (_ BitVec 32) (_ BitVec 64))) (size!37532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76688)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188019 (= res!789907 (not (= (select (arr!36994 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1188020 () Bool)

(declare-fun res!789894 () Bool)

(declare-fun e!675498 () Bool)

(assert (=> b!1188020 (=> (not res!789894) (not e!675498))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76688 (_ BitVec 32)) Bool)

(assert (=> b!1188020 (= res!789894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188021 () Bool)

(declare-fun res!789893 () Bool)

(assert (=> b!1188021 (=> (not res!789893) (not e!675498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188021 (= res!789893 (validKeyInArray!0 k0!934))))

(declare-fun b!1188022 () Bool)

(declare-fun res!789903 () Bool)

(declare-fun e!675497 () Bool)

(assert (=> b!1188022 (=> (not res!789903) (not e!675497))))

(declare-fun lt!540315 () array!76688)

(declare-datatypes ((List!26144 0))(
  ( (Nil!26141) (Cons!26140 (h!27349 (_ BitVec 64)) (t!38574 List!26144)) )
))
(declare-fun arrayNoDuplicates!0 (array!76688 (_ BitVec 32) List!26144) Bool)

(assert (=> b!1188022 (= res!789903 (arrayNoDuplicates!0 lt!540315 #b00000000000000000000000000000000 Nil!26141))))

(declare-fun b!1188023 () Bool)

(declare-fun e!675501 () Bool)

(declare-fun tp_is_empty!29977 () Bool)

(assert (=> b!1188023 (= e!675501 tp_is_empty!29977)))

(declare-fun b!1188024 () Bool)

(declare-fun res!789901 () Bool)

(assert (=> b!1188024 (=> (not res!789901) (not e!675498))))

(assert (=> b!1188024 (= res!789901 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26141))))

(declare-fun b!1188026 () Bool)

(declare-datatypes ((Unit!39285 0))(
  ( (Unit!39286) )
))
(declare-fun e!675499 () Unit!39285)

(declare-fun Unit!39287 () Unit!39285)

(assert (=> b!1188026 (= e!675499 Unit!39287)))

(declare-fun lt!540308 () Unit!39285)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39285)

(assert (=> b!1188026 (= lt!540308 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188026 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540309 () Unit!39285)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76688 (_ BitVec 32) (_ BitVec 32)) Unit!39285)

(assert (=> b!1188026 (= lt!540309 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1188026 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26141)))

(declare-fun lt!540310 () Unit!39285)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76688 (_ BitVec 64) (_ BitVec 32) List!26144) Unit!39285)

(assert (=> b!1188026 (= lt!540310 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26141))))

(assert (=> b!1188026 false))

(declare-fun b!1188027 () Bool)

(declare-fun e!675508 () Bool)

(declare-fun e!675506 () Bool)

(assert (=> b!1188027 (= e!675508 e!675506)))

(declare-fun res!789906 () Bool)

(assert (=> b!1188027 (=> res!789906 e!675506)))

(assert (=> b!1188027 (= res!789906 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45097 0))(
  ( (V!45098 (val!15045 Int)) )
))
(declare-fun zeroValue!944 () V!45097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14279 0))(
  ( (ValueCellFull!14279 (v!17682 V!45097)) (EmptyCell!14279) )
))
(declare-datatypes ((array!76690 0))(
  ( (array!76691 (arr!36995 (Array (_ BitVec 32) ValueCell!14279)) (size!37533 (_ BitVec 32))) )
))
(declare-fun lt!540317 () array!76690)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19432 0))(
  ( (tuple2!19433 (_1!9727 (_ BitVec 64)) (_2!9727 V!45097)) )
))
(declare-datatypes ((List!26145 0))(
  ( (Nil!26142) (Cons!26141 (h!27350 tuple2!19432) (t!38575 List!26145)) )
))
(declare-datatypes ((ListLongMap!17401 0))(
  ( (ListLongMap!17402 (toList!8716 List!26145)) )
))
(declare-fun lt!540304 () ListLongMap!17401)

(declare-fun minValue!944 () V!45097)

(declare-fun getCurrentListMapNoExtraKeys!5166 (array!76688 array!76690 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) Int) ListLongMap!17401)

(assert (=> b!1188027 (= lt!540304 (getCurrentListMapNoExtraKeys!5166 lt!540315 lt!540317 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540306 () V!45097)

(declare-fun _values!996 () array!76690)

(assert (=> b!1188027 (= lt!540317 (array!76691 (store (arr!36995 _values!996) i!673 (ValueCellFull!14279 lt!540306)) (size!37533 _values!996)))))

(declare-fun dynLambda!3063 (Int (_ BitVec 64)) V!45097)

(assert (=> b!1188027 (= lt!540306 (dynLambda!3063 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540311 () ListLongMap!17401)

(assert (=> b!1188027 (= lt!540311 (getCurrentListMapNoExtraKeys!5166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188028 () Bool)

(declare-fun e!675505 () Bool)

(assert (=> b!1188028 (= e!675505 tp_is_empty!29977)))

(declare-fun b!1188029 () Bool)

(declare-fun e!675507 () Bool)

(assert (=> b!1188029 (= e!675506 e!675507)))

(declare-fun res!789899 () Bool)

(assert (=> b!1188029 (=> res!789899 e!675507)))

(assert (=> b!1188029 (= res!789899 (not (validKeyInArray!0 (select (arr!36994 _keys!1208) from!1455))))))

(declare-fun lt!540314 () ListLongMap!17401)

(declare-fun lt!540313 () ListLongMap!17401)

(assert (=> b!1188029 (= lt!540314 lt!540313)))

(declare-fun lt!540302 () ListLongMap!17401)

(declare-fun -!1665 (ListLongMap!17401 (_ BitVec 64)) ListLongMap!17401)

(assert (=> b!1188029 (= lt!540313 (-!1665 lt!540302 k0!934))))

(assert (=> b!1188029 (= lt!540314 (getCurrentListMapNoExtraKeys!5166 lt!540315 lt!540317 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188029 (= lt!540302 (getCurrentListMapNoExtraKeys!5166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540307 () Unit!39285)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 (array!76688 array!76690 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39285)

(assert (=> b!1188029 (= lt!540307 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46793 () Bool)

(declare-fun mapRes!46793 () Bool)

(assert (=> mapIsEmpty!46793 mapRes!46793))

(declare-fun b!1188030 () Bool)

(declare-fun res!789898 () Bool)

(assert (=> b!1188030 (=> (not res!789898) (not e!675498))))

(assert (=> b!1188030 (= res!789898 (and (= (size!37533 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37532 _keys!1208) (size!37533 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188031 () Bool)

(declare-fun res!789904 () Bool)

(assert (=> b!1188031 (=> (not res!789904) (not e!675498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188031 (= res!789904 (validMask!0 mask!1564))))

(declare-fun b!1188032 () Bool)

(declare-fun res!789895 () Bool)

(assert (=> b!1188032 (=> (not res!789895) (not e!675498))))

(assert (=> b!1188032 (= res!789895 (= (select (arr!36994 _keys!1208) i!673) k0!934))))

(declare-fun b!1188033 () Bool)

(assert (=> b!1188033 (= e!675504 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46793 () Bool)

(declare-fun tp!89054 () Bool)

(assert (=> mapNonEmpty!46793 (= mapRes!46793 (and tp!89054 e!675505))))

(declare-fun mapKey!46793 () (_ BitVec 32))

(declare-fun mapRest!46793 () (Array (_ BitVec 32) ValueCell!14279))

(declare-fun mapValue!46793 () ValueCell!14279)

(assert (=> mapNonEmpty!46793 (= (arr!36995 _values!996) (store mapRest!46793 mapKey!46793 mapValue!46793))))

(declare-fun b!1188034 () Bool)

(declare-fun res!789905 () Bool)

(assert (=> b!1188034 (=> (not res!789905) (not e!675498))))

(assert (=> b!1188034 (= res!789905 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37532 _keys!1208))))))

(declare-fun b!1188035 () Bool)

(assert (=> b!1188035 (= e!675498 e!675497)))

(declare-fun res!789900 () Bool)

(assert (=> b!1188035 (=> (not res!789900) (not e!675497))))

(assert (=> b!1188035 (= res!789900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540315 mask!1564))))

(assert (=> b!1188035 (= lt!540315 (array!76689 (store (arr!36994 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37532 _keys!1208)))))

(declare-fun b!1188036 () Bool)

(declare-fun e!675502 () Bool)

(assert (=> b!1188036 (= e!675502 (and e!675501 mapRes!46793))))

(declare-fun condMapEmpty!46793 () Bool)

(declare-fun mapDefault!46793 () ValueCell!14279)

(assert (=> b!1188036 (= condMapEmpty!46793 (= (arr!36995 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14279)) mapDefault!46793)))))

(declare-fun b!1188025 () Bool)

(assert (=> b!1188025 (= e!675507 true)))

(declare-fun lt!540303 () ListLongMap!17401)

(declare-fun lt!540312 () ListLongMap!17401)

(assert (=> b!1188025 (= (-!1665 lt!540303 k0!934) lt!540312)))

(declare-fun lt!540300 () V!45097)

(declare-fun lt!540318 () Unit!39285)

(declare-fun addRemoveCommutativeForDiffKeys!208 (ListLongMap!17401 (_ BitVec 64) V!45097 (_ BitVec 64)) Unit!39285)

(assert (=> b!1188025 (= lt!540318 (addRemoveCommutativeForDiffKeys!208 lt!540302 (select (arr!36994 _keys!1208) from!1455) lt!540300 k0!934))))

(assert (=> b!1188025 (and (= lt!540311 lt!540303) (= lt!540313 lt!540314))))

(declare-fun lt!540316 () tuple2!19432)

(declare-fun +!3994 (ListLongMap!17401 tuple2!19432) ListLongMap!17401)

(assert (=> b!1188025 (= lt!540303 (+!3994 lt!540302 lt!540316))))

(assert (=> b!1188025 (not (= (select (arr!36994 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540305 () Unit!39285)

(assert (=> b!1188025 (= lt!540305 e!675499)))

(declare-fun c!117268 () Bool)

(assert (=> b!1188025 (= c!117268 (= (select (arr!36994 _keys!1208) from!1455) k0!934))))

(assert (=> b!1188025 e!675503))

(declare-fun res!789897 () Bool)

(assert (=> b!1188025 (=> (not res!789897) (not e!675503))))

(assert (=> b!1188025 (= res!789897 (= lt!540304 lt!540312))))

(assert (=> b!1188025 (= lt!540312 (+!3994 lt!540313 lt!540316))))

(assert (=> b!1188025 (= lt!540316 (tuple2!19433 (select (arr!36994 _keys!1208) from!1455) lt!540300))))

(declare-fun get!18965 (ValueCell!14279 V!45097) V!45097)

(assert (=> b!1188025 (= lt!540300 (get!18965 (select (arr!36995 _values!996) from!1455) lt!540306))))

(declare-fun res!789896 () Bool)

(assert (=> start!99862 (=> (not res!789896) (not e!675498))))

(assert (=> start!99862 (= res!789896 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37532 _keys!1208))))))

(assert (=> start!99862 e!675498))

(assert (=> start!99862 tp_is_empty!29977))

(declare-fun array_inv!28332 (array!76688) Bool)

(assert (=> start!99862 (array_inv!28332 _keys!1208)))

(assert (=> start!99862 true))

(assert (=> start!99862 tp!89055))

(declare-fun array_inv!28333 (array!76690) Bool)

(assert (=> start!99862 (and (array_inv!28333 _values!996) e!675502)))

(declare-fun b!1188037 () Bool)

(assert (=> b!1188037 (= e!675497 (not e!675508))))

(declare-fun res!789902 () Bool)

(assert (=> b!1188037 (=> res!789902 e!675508)))

(assert (=> b!1188037 (= res!789902 (bvsgt from!1455 i!673))))

(assert (=> b!1188037 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540301 () Unit!39285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76688 (_ BitVec 64) (_ BitVec 32)) Unit!39285)

(assert (=> b!1188037 (= lt!540301 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188038 () Bool)

(declare-fun Unit!39288 () Unit!39285)

(assert (=> b!1188038 (= e!675499 Unit!39288)))

(assert (= (and start!99862 res!789896) b!1188031))

(assert (= (and b!1188031 res!789904) b!1188030))

(assert (= (and b!1188030 res!789898) b!1188020))

(assert (= (and b!1188020 res!789894) b!1188024))

(assert (= (and b!1188024 res!789901) b!1188034))

(assert (= (and b!1188034 res!789905) b!1188021))

(assert (= (and b!1188021 res!789893) b!1188032))

(assert (= (and b!1188032 res!789895) b!1188035))

(assert (= (and b!1188035 res!789900) b!1188022))

(assert (= (and b!1188022 res!789903) b!1188037))

(assert (= (and b!1188037 (not res!789902)) b!1188027))

(assert (= (and b!1188027 (not res!789906)) b!1188029))

(assert (= (and b!1188029 (not res!789899)) b!1188025))

(assert (= (and b!1188025 res!789897) b!1188019))

(assert (= (and b!1188019 (not res!789907)) b!1188033))

(assert (= (and b!1188025 c!117268) b!1188026))

(assert (= (and b!1188025 (not c!117268)) b!1188038))

(assert (= (and b!1188036 condMapEmpty!46793) mapIsEmpty!46793))

(assert (= (and b!1188036 (not condMapEmpty!46793)) mapNonEmpty!46793))

(get-info :version)

(assert (= (and mapNonEmpty!46793 ((_ is ValueCellFull!14279) mapValue!46793)) b!1188028))

(assert (= (and b!1188036 ((_ is ValueCellFull!14279) mapDefault!46793)) b!1188023))

(assert (= start!99862 b!1188036))

(declare-fun b_lambda!20573 () Bool)

(assert (=> (not b_lambda!20573) (not b!1188027)))

(declare-fun t!38573 () Bool)

(declare-fun tb!10251 () Bool)

(assert (=> (and start!99862 (= defaultEntry!1004 defaultEntry!1004) t!38573) tb!10251))

(declare-fun result!21077 () Bool)

(assert (=> tb!10251 (= result!21077 tp_is_empty!29977)))

(assert (=> b!1188027 t!38573))

(declare-fun b_and!41741 () Bool)

(assert (= b_and!41739 (and (=> t!38573 result!21077) b_and!41741)))

(declare-fun m!1096295 () Bool)

(assert (=> b!1188024 m!1096295))

(declare-fun m!1096297 () Bool)

(assert (=> b!1188019 m!1096297))

(declare-fun m!1096299 () Bool)

(assert (=> b!1188020 m!1096299))

(declare-fun m!1096301 () Bool)

(assert (=> b!1188026 m!1096301))

(declare-fun m!1096303 () Bool)

(assert (=> b!1188026 m!1096303))

(declare-fun m!1096305 () Bool)

(assert (=> b!1188026 m!1096305))

(declare-fun m!1096307 () Bool)

(assert (=> b!1188026 m!1096307))

(declare-fun m!1096309 () Bool)

(assert (=> b!1188026 m!1096309))

(declare-fun m!1096311 () Bool)

(assert (=> b!1188021 m!1096311))

(declare-fun m!1096313 () Bool)

(assert (=> b!1188033 m!1096313))

(declare-fun m!1096315 () Bool)

(assert (=> b!1188035 m!1096315))

(declare-fun m!1096317 () Bool)

(assert (=> b!1188035 m!1096317))

(declare-fun m!1096319 () Bool)

(assert (=> mapNonEmpty!46793 m!1096319))

(declare-fun m!1096321 () Bool)

(assert (=> b!1188029 m!1096321))

(declare-fun m!1096323 () Bool)

(assert (=> b!1188029 m!1096323))

(assert (=> b!1188029 m!1096297))

(declare-fun m!1096325 () Bool)

(assert (=> b!1188029 m!1096325))

(assert (=> b!1188029 m!1096297))

(declare-fun m!1096327 () Bool)

(assert (=> b!1188029 m!1096327))

(declare-fun m!1096329 () Bool)

(assert (=> b!1188029 m!1096329))

(declare-fun m!1096331 () Bool)

(assert (=> b!1188022 m!1096331))

(declare-fun m!1096333 () Bool)

(assert (=> b!1188031 m!1096333))

(declare-fun m!1096335 () Bool)

(assert (=> b!1188025 m!1096335))

(declare-fun m!1096337 () Bool)

(assert (=> b!1188025 m!1096337))

(assert (=> b!1188025 m!1096297))

(declare-fun m!1096339 () Bool)

(assert (=> b!1188025 m!1096339))

(declare-fun m!1096341 () Bool)

(assert (=> b!1188025 m!1096341))

(assert (=> b!1188025 m!1096297))

(assert (=> b!1188025 m!1096335))

(declare-fun m!1096343 () Bool)

(assert (=> b!1188025 m!1096343))

(declare-fun m!1096345 () Bool)

(assert (=> b!1188025 m!1096345))

(declare-fun m!1096347 () Bool)

(assert (=> b!1188027 m!1096347))

(declare-fun m!1096349 () Bool)

(assert (=> b!1188027 m!1096349))

(declare-fun m!1096351 () Bool)

(assert (=> b!1188027 m!1096351))

(declare-fun m!1096353 () Bool)

(assert (=> b!1188027 m!1096353))

(declare-fun m!1096355 () Bool)

(assert (=> b!1188032 m!1096355))

(declare-fun m!1096357 () Bool)

(assert (=> start!99862 m!1096357))

(declare-fun m!1096359 () Bool)

(assert (=> start!99862 m!1096359))

(declare-fun m!1096361 () Bool)

(assert (=> b!1188037 m!1096361))

(declare-fun m!1096363 () Bool)

(assert (=> b!1188037 m!1096363))

(check-sat (not b!1188020) (not b!1188027) (not b!1188031) (not b!1188021) (not mapNonEmpty!46793) (not b_next!25447) (not b!1188035) tp_is_empty!29977 (not b_lambda!20573) (not b!1188029) b_and!41741 (not b!1188022) (not start!99862) (not b!1188024) (not b!1188033) (not b!1188025) (not b!1188037) (not b!1188026))
(check-sat b_and!41741 (not b_next!25447))
