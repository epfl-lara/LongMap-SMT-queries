; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99742 () Bool)

(assert start!99742)

(declare-fun b_free!25327 () Bool)

(declare-fun b_next!25327 () Bool)

(assert (=> start!99742 (= b_free!25327 (not b_next!25327))))

(declare-fun tp!88694 () Bool)

(declare-fun b_and!41499 () Bool)

(assert (=> start!99742 (= tp!88694 b_and!41499)))

(declare-fun b!1184299 () Bool)

(declare-fun e!673345 () Bool)

(declare-fun tp_is_empty!29857 () Bool)

(assert (=> b!1184299 (= e!673345 tp_is_empty!29857)))

(declare-fun b!1184300 () Bool)

(declare-fun res!787204 () Bool)

(declare-fun e!673347 () Bool)

(assert (=> b!1184300 (=> (not res!787204) (not e!673347))))

(declare-datatypes ((array!76448 0))(
  ( (array!76449 (arr!36874 (Array (_ BitVec 32) (_ BitVec 64))) (size!37412 (_ BitVec 32))) )
))
(declare-fun lt!536884 () array!76448)

(declare-datatypes ((List!26038 0))(
  ( (Nil!26035) (Cons!26034 (h!27243 (_ BitVec 64)) (t!38348 List!26038)) )
))
(declare-fun arrayNoDuplicates!0 (array!76448 (_ BitVec 32) List!26038) Bool)

(assert (=> b!1184300 (= res!787204 (arrayNoDuplicates!0 lt!536884 #b00000000000000000000000000000000 Nil!26035))))

(declare-fun b!1184301 () Bool)

(declare-fun res!787206 () Bool)

(declare-fun e!673337 () Bool)

(assert (=> b!1184301 (=> (not res!787206) (not e!673337))))

(declare-fun _keys!1208 () array!76448)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44937 0))(
  ( (V!44938 (val!14985 Int)) )
))
(declare-datatypes ((ValueCell!14219 0))(
  ( (ValueCellFull!14219 (v!17622 V!44937)) (EmptyCell!14219) )
))
(declare-datatypes ((array!76450 0))(
  ( (array!76451 (arr!36875 (Array (_ BitVec 32) ValueCell!14219)) (size!37413 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76450)

(assert (=> b!1184301 (= res!787206 (and (= (size!37413 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37412 _keys!1208) (size!37413 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184302 () Bool)

(declare-datatypes ((Unit!39082 0))(
  ( (Unit!39083) )
))
(declare-fun e!673339 () Unit!39082)

(declare-fun Unit!39084 () Unit!39082)

(assert (=> b!1184302 (= e!673339 Unit!39084)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536892 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1184302 (= lt!536892 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184302 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536897 () Unit!39082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76448 (_ BitVec 32) (_ BitVec 32)) Unit!39082)

(assert (=> b!1184302 (= lt!536897 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184302 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26035)))

(declare-fun lt!536896 () Unit!39082)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76448 (_ BitVec 64) (_ BitVec 32) List!26038) Unit!39082)

(assert (=> b!1184302 (= lt!536896 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26035))))

(assert (=> b!1184302 false))

(declare-fun b!1184303 () Bool)

(declare-fun res!787207 () Bool)

(assert (=> b!1184303 (=> (not res!787207) (not e!673337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184303 (= res!787207 (validMask!0 mask!1564))))

(declare-fun b!1184304 () Bool)

(declare-fun e!673346 () Bool)

(declare-fun e!673342 () Bool)

(assert (=> b!1184304 (= e!673346 e!673342)))

(declare-fun res!787199 () Bool)

(assert (=> b!1184304 (=> res!787199 e!673342)))

(assert (=> b!1184304 (= res!787199 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44937)

(declare-fun lt!536885 () array!76450)

(declare-datatypes ((tuple2!19328 0))(
  ( (tuple2!19329 (_1!9675 (_ BitVec 64)) (_2!9675 V!44937)) )
))
(declare-datatypes ((List!26039 0))(
  ( (Nil!26036) (Cons!26035 (h!27244 tuple2!19328) (t!38349 List!26039)) )
))
(declare-datatypes ((ListLongMap!17297 0))(
  ( (ListLongMap!17298 (toList!8664 List!26039)) )
))
(declare-fun lt!536886 () ListLongMap!17297)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44937)

(declare-fun getCurrentListMapNoExtraKeys!5118 (array!76448 array!76450 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) Int) ListLongMap!17297)

(assert (=> b!1184304 (= lt!536886 (getCurrentListMapNoExtraKeys!5118 lt!536884 lt!536885 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536893 () V!44937)

(assert (=> b!1184304 (= lt!536885 (array!76451 (store (arr!36875 _values!996) i!673 (ValueCellFull!14219 lt!536893)) (size!37413 _values!996)))))

(declare-fun dynLambda!3020 (Int (_ BitVec 64)) V!44937)

(assert (=> b!1184304 (= lt!536893 (dynLambda!3020 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536883 () ListLongMap!17297)

(assert (=> b!1184304 (= lt!536883 (getCurrentListMapNoExtraKeys!5118 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184305 () Bool)

(declare-fun res!787203 () Bool)

(assert (=> b!1184305 (=> (not res!787203) (not e!673337))))

(assert (=> b!1184305 (= res!787203 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26035))))

(declare-fun b!1184306 () Bool)

(declare-fun e!673344 () Bool)

(declare-fun e!673338 () Bool)

(assert (=> b!1184306 (= e!673344 e!673338)))

(declare-fun res!787195 () Bool)

(assert (=> b!1184306 (=> res!787195 e!673338)))

(assert (=> b!1184306 (= res!787195 (not (= (select (arr!36874 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184307 () Bool)

(declare-fun Unit!39085 () Unit!39082)

(assert (=> b!1184307 (= e!673339 Unit!39085)))

(declare-fun b!1184308 () Bool)

(declare-fun e!673340 () Bool)

(assert (=> b!1184308 (= e!673340 true)))

(declare-fun lt!536882 () ListLongMap!17297)

(declare-fun lt!536895 () ListLongMap!17297)

(declare-fun -!1618 (ListLongMap!17297 (_ BitVec 64)) ListLongMap!17297)

(assert (=> b!1184308 (= (-!1618 lt!536882 k0!934) lt!536895)))

(declare-fun lt!536887 () Unit!39082)

(declare-fun lt!536889 () V!44937)

(declare-fun lt!536898 () ListLongMap!17297)

(declare-fun addRemoveCommutativeForDiffKeys!162 (ListLongMap!17297 (_ BitVec 64) V!44937 (_ BitVec 64)) Unit!39082)

(assert (=> b!1184308 (= lt!536887 (addRemoveCommutativeForDiffKeys!162 lt!536898 (select (arr!36874 _keys!1208) from!1455) lt!536889 k0!934))))

(declare-fun lt!536888 () ListLongMap!17297)

(declare-fun lt!536881 () ListLongMap!17297)

(assert (=> b!1184308 (and (= lt!536883 lt!536882) (= lt!536888 lt!536881))))

(declare-fun lt!536891 () tuple2!19328)

(declare-fun +!3948 (ListLongMap!17297 tuple2!19328) ListLongMap!17297)

(assert (=> b!1184308 (= lt!536882 (+!3948 lt!536898 lt!536891))))

(assert (=> b!1184308 (not (= (select (arr!36874 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536894 () Unit!39082)

(assert (=> b!1184308 (= lt!536894 e!673339)))

(declare-fun c!117088 () Bool)

(assert (=> b!1184308 (= c!117088 (= (select (arr!36874 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184308 e!673344))

(declare-fun res!787194 () Bool)

(assert (=> b!1184308 (=> (not res!787194) (not e!673344))))

(assert (=> b!1184308 (= res!787194 (= lt!536886 lt!536895))))

(assert (=> b!1184308 (= lt!536895 (+!3948 lt!536888 lt!536891))))

(assert (=> b!1184308 (= lt!536891 (tuple2!19329 (select (arr!36874 _keys!1208) from!1455) lt!536889))))

(declare-fun get!18879 (ValueCell!14219 V!44937) V!44937)

(assert (=> b!1184308 (= lt!536889 (get!18879 (select (arr!36875 _values!996) from!1455) lt!536893))))

(declare-fun b!1184309 () Bool)

(assert (=> b!1184309 (= e!673337 e!673347)))

(declare-fun res!787193 () Bool)

(assert (=> b!1184309 (=> (not res!787193) (not e!673347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76448 (_ BitVec 32)) Bool)

(assert (=> b!1184309 (= res!787193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536884 mask!1564))))

(assert (=> b!1184309 (= lt!536884 (array!76449 (store (arr!36874 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37412 _keys!1208)))))

(declare-fun b!1184310 () Bool)

(declare-fun e!673348 () Bool)

(declare-fun mapRes!46613 () Bool)

(assert (=> b!1184310 (= e!673348 (and e!673345 mapRes!46613))))

(declare-fun condMapEmpty!46613 () Bool)

(declare-fun mapDefault!46613 () ValueCell!14219)

(assert (=> b!1184310 (= condMapEmpty!46613 (= (arr!36875 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14219)) mapDefault!46613)))))

(declare-fun res!787196 () Bool)

(assert (=> start!99742 (=> (not res!787196) (not e!673337))))

(assert (=> start!99742 (= res!787196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37412 _keys!1208))))))

(assert (=> start!99742 e!673337))

(assert (=> start!99742 tp_is_empty!29857))

(declare-fun array_inv!28252 (array!76448) Bool)

(assert (=> start!99742 (array_inv!28252 _keys!1208)))

(assert (=> start!99742 true))

(assert (=> start!99742 tp!88694))

(declare-fun array_inv!28253 (array!76450) Bool)

(assert (=> start!99742 (and (array_inv!28253 _values!996) e!673348)))

(declare-fun b!1184311 () Bool)

(declare-fun res!787201 () Bool)

(assert (=> b!1184311 (=> (not res!787201) (not e!673337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184311 (= res!787201 (validKeyInArray!0 k0!934))))

(declare-fun b!1184312 () Bool)

(declare-fun res!787202 () Bool)

(assert (=> b!1184312 (=> (not res!787202) (not e!673337))))

(assert (=> b!1184312 (= res!787202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184313 () Bool)

(declare-fun res!787200 () Bool)

(assert (=> b!1184313 (=> (not res!787200) (not e!673337))))

(assert (=> b!1184313 (= res!787200 (= (select (arr!36874 _keys!1208) i!673) k0!934))))

(declare-fun b!1184314 () Bool)

(declare-fun res!787205 () Bool)

(assert (=> b!1184314 (=> (not res!787205) (not e!673337))))

(assert (=> b!1184314 (= res!787205 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37412 _keys!1208))))))

(declare-fun mapNonEmpty!46613 () Bool)

(declare-fun tp!88695 () Bool)

(declare-fun e!673341 () Bool)

(assert (=> mapNonEmpty!46613 (= mapRes!46613 (and tp!88695 e!673341))))

(declare-fun mapKey!46613 () (_ BitVec 32))

(declare-fun mapRest!46613 () (Array (_ BitVec 32) ValueCell!14219))

(declare-fun mapValue!46613 () ValueCell!14219)

(assert (=> mapNonEmpty!46613 (= (arr!36875 _values!996) (store mapRest!46613 mapKey!46613 mapValue!46613))))

(declare-fun b!1184315 () Bool)

(assert (=> b!1184315 (= e!673341 tp_is_empty!29857)))

(declare-fun b!1184316 () Bool)

(assert (=> b!1184316 (= e!673347 (not e!673346))))

(declare-fun res!787198 () Bool)

(assert (=> b!1184316 (=> res!787198 e!673346)))

(assert (=> b!1184316 (= res!787198 (bvsgt from!1455 i!673))))

(assert (=> b!1184316 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536890 () Unit!39082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76448 (_ BitVec 64) (_ BitVec 32)) Unit!39082)

(assert (=> b!1184316 (= lt!536890 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184317 () Bool)

(assert (=> b!1184317 (= e!673338 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184318 () Bool)

(assert (=> b!1184318 (= e!673342 e!673340)))

(declare-fun res!787197 () Bool)

(assert (=> b!1184318 (=> res!787197 e!673340)))

(assert (=> b!1184318 (= res!787197 (not (validKeyInArray!0 (select (arr!36874 _keys!1208) from!1455))))))

(assert (=> b!1184318 (= lt!536881 lt!536888)))

(assert (=> b!1184318 (= lt!536888 (-!1618 lt!536898 k0!934))))

(assert (=> b!1184318 (= lt!536881 (getCurrentListMapNoExtraKeys!5118 lt!536884 lt!536885 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184318 (= lt!536898 (getCurrentListMapNoExtraKeys!5118 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536880 () Unit!39082)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 (array!76448 array!76450 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39082)

(assert (=> b!1184318 (= lt!536880 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46613 () Bool)

(assert (=> mapIsEmpty!46613 mapRes!46613))

(assert (= (and start!99742 res!787196) b!1184303))

(assert (= (and b!1184303 res!787207) b!1184301))

(assert (= (and b!1184301 res!787206) b!1184312))

(assert (= (and b!1184312 res!787202) b!1184305))

(assert (= (and b!1184305 res!787203) b!1184314))

(assert (= (and b!1184314 res!787205) b!1184311))

(assert (= (and b!1184311 res!787201) b!1184313))

(assert (= (and b!1184313 res!787200) b!1184309))

(assert (= (and b!1184309 res!787193) b!1184300))

(assert (= (and b!1184300 res!787204) b!1184316))

(assert (= (and b!1184316 (not res!787198)) b!1184304))

(assert (= (and b!1184304 (not res!787199)) b!1184318))

(assert (= (and b!1184318 (not res!787197)) b!1184308))

(assert (= (and b!1184308 res!787194) b!1184306))

(assert (= (and b!1184306 (not res!787195)) b!1184317))

(assert (= (and b!1184308 c!117088) b!1184302))

(assert (= (and b!1184308 (not c!117088)) b!1184307))

(assert (= (and b!1184310 condMapEmpty!46613) mapIsEmpty!46613))

(assert (= (and b!1184310 (not condMapEmpty!46613)) mapNonEmpty!46613))

(get-info :version)

(assert (= (and mapNonEmpty!46613 ((_ is ValueCellFull!14219) mapValue!46613)) b!1184315))

(assert (= (and b!1184310 ((_ is ValueCellFull!14219) mapDefault!46613)) b!1184299))

(assert (= start!99742 b!1184310))

(declare-fun b_lambda!20453 () Bool)

(assert (=> (not b_lambda!20453) (not b!1184304)))

(declare-fun t!38347 () Bool)

(declare-fun tb!10131 () Bool)

(assert (=> (and start!99742 (= defaultEntry!1004 defaultEntry!1004) t!38347) tb!10131))

(declare-fun result!20837 () Bool)

(assert (=> tb!10131 (= result!20837 tp_is_empty!29857)))

(assert (=> b!1184304 t!38347))

(declare-fun b_and!41501 () Bool)

(assert (= b_and!41499 (and (=> t!38347 result!20837) b_and!41501)))

(declare-fun m!1092095 () Bool)

(assert (=> b!1184302 m!1092095))

(declare-fun m!1092097 () Bool)

(assert (=> b!1184302 m!1092097))

(declare-fun m!1092099 () Bool)

(assert (=> b!1184302 m!1092099))

(declare-fun m!1092101 () Bool)

(assert (=> b!1184302 m!1092101))

(declare-fun m!1092103 () Bool)

(assert (=> b!1184302 m!1092103))

(declare-fun m!1092105 () Bool)

(assert (=> b!1184318 m!1092105))

(declare-fun m!1092107 () Bool)

(assert (=> b!1184318 m!1092107))

(declare-fun m!1092109 () Bool)

(assert (=> b!1184318 m!1092109))

(declare-fun m!1092111 () Bool)

(assert (=> b!1184318 m!1092111))

(declare-fun m!1092113 () Bool)

(assert (=> b!1184318 m!1092113))

(assert (=> b!1184318 m!1092111))

(declare-fun m!1092115 () Bool)

(assert (=> b!1184318 m!1092115))

(declare-fun m!1092117 () Bool)

(assert (=> b!1184304 m!1092117))

(declare-fun m!1092119 () Bool)

(assert (=> b!1184304 m!1092119))

(declare-fun m!1092121 () Bool)

(assert (=> b!1184304 m!1092121))

(declare-fun m!1092123 () Bool)

(assert (=> b!1184304 m!1092123))

(declare-fun m!1092125 () Bool)

(assert (=> b!1184309 m!1092125))

(declare-fun m!1092127 () Bool)

(assert (=> b!1184309 m!1092127))

(declare-fun m!1092129 () Bool)

(assert (=> start!99742 m!1092129))

(declare-fun m!1092131 () Bool)

(assert (=> start!99742 m!1092131))

(declare-fun m!1092133 () Bool)

(assert (=> b!1184311 m!1092133))

(declare-fun m!1092135 () Bool)

(assert (=> b!1184308 m!1092135))

(declare-fun m!1092137 () Bool)

(assert (=> b!1184308 m!1092137))

(assert (=> b!1184308 m!1092111))

(assert (=> b!1184308 m!1092135))

(declare-fun m!1092139 () Bool)

(assert (=> b!1184308 m!1092139))

(declare-fun m!1092141 () Bool)

(assert (=> b!1184308 m!1092141))

(assert (=> b!1184308 m!1092111))

(declare-fun m!1092143 () Bool)

(assert (=> b!1184308 m!1092143))

(declare-fun m!1092145 () Bool)

(assert (=> b!1184308 m!1092145))

(declare-fun m!1092147 () Bool)

(assert (=> b!1184317 m!1092147))

(declare-fun m!1092149 () Bool)

(assert (=> b!1184300 m!1092149))

(declare-fun m!1092151 () Bool)

(assert (=> b!1184316 m!1092151))

(declare-fun m!1092153 () Bool)

(assert (=> b!1184316 m!1092153))

(assert (=> b!1184306 m!1092111))

(declare-fun m!1092155 () Bool)

(assert (=> b!1184303 m!1092155))

(declare-fun m!1092157 () Bool)

(assert (=> b!1184313 m!1092157))

(declare-fun m!1092159 () Bool)

(assert (=> b!1184312 m!1092159))

(declare-fun m!1092161 () Bool)

(assert (=> b!1184305 m!1092161))

(declare-fun m!1092163 () Bool)

(assert (=> mapNonEmpty!46613 m!1092163))

(check-sat (not b!1184316) (not b_lambda!20453) (not b!1184303) (not b!1184302) (not b!1184304) (not b!1184312) (not b!1184317) (not start!99742) (not b!1184305) (not mapNonEmpty!46613) (not b!1184309) (not b_next!25327) (not b!1184318) tp_is_empty!29857 b_and!41501 (not b!1184311) (not b!1184308) (not b!1184300))
(check-sat b_and!41501 (not b_next!25327))
