; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99558 () Bool)

(assert start!99558)

(declare-fun b_free!25137 () Bool)

(declare-fun b_next!25137 () Bool)

(assert (=> start!99558 (= b_free!25137 (not b_next!25137))))

(declare-fun tp!88125 () Bool)

(declare-fun b_and!41141 () Bool)

(assert (=> start!99558 (= tp!88125 b_and!41141)))

(declare-datatypes ((V!44683 0))(
  ( (V!44684 (val!14890 Int)) )
))
(declare-datatypes ((tuple2!19050 0))(
  ( (tuple2!19051 (_1!9536 (_ BitVec 64)) (_2!9536 V!44683)) )
))
(declare-fun lt!532261 () tuple2!19050)

(declare-fun b!1178295 () Bool)

(declare-datatypes ((List!25788 0))(
  ( (Nil!25785) (Cons!25784 (h!26993 tuple2!19050) (t!37917 List!25788)) )
))
(declare-datatypes ((ListLongMap!17019 0))(
  ( (ListLongMap!17020 (toList!8525 List!25788)) )
))
(declare-fun lt!532252 () ListLongMap!17019)

(declare-fun e!669854 () Bool)

(declare-fun lt!532257 () ListLongMap!17019)

(declare-fun +!3839 (ListLongMap!17019 tuple2!19050) ListLongMap!17019)

(assert (=> b!1178295 (= e!669854 (= lt!532252 (+!3839 lt!532257 lt!532261)))))

(declare-fun b!1178296 () Bool)

(declare-datatypes ((Unit!38915 0))(
  ( (Unit!38916) )
))
(declare-fun e!669850 () Unit!38915)

(declare-fun Unit!38917 () Unit!38915)

(assert (=> b!1178296 (= e!669850 Unit!38917)))

(declare-datatypes ((array!76137 0))(
  ( (array!76138 (arr!36718 (Array (_ BitVec 32) (_ BitVec 64))) (size!37254 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76137)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!532259 () Unit!38915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38915)

(assert (=> b!1178296 (= lt!532259 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178296 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532249 () Unit!38915)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76137 (_ BitVec 32) (_ BitVec 32)) Unit!38915)

(assert (=> b!1178296 (= lt!532249 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25789 0))(
  ( (Nil!25786) (Cons!25785 (h!26994 (_ BitVec 64)) (t!37918 List!25789)) )
))
(declare-fun arrayNoDuplicates!0 (array!76137 (_ BitVec 32) List!25789) Bool)

(assert (=> b!1178296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25786)))

(declare-fun lt!532263 () Unit!38915)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76137 (_ BitVec 64) (_ BitVec 32) List!25789) Unit!38915)

(assert (=> b!1178296 (= lt!532263 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25786))))

(assert (=> b!1178296 false))

(declare-fun b!1178297 () Bool)

(declare-fun e!669855 () Bool)

(declare-fun e!669849 () Bool)

(declare-fun mapRes!46328 () Bool)

(assert (=> b!1178297 (= e!669855 (and e!669849 mapRes!46328))))

(declare-fun condMapEmpty!46328 () Bool)

(declare-datatypes ((ValueCell!14124 0))(
  ( (ValueCellFull!14124 (v!17528 V!44683)) (EmptyCell!14124) )
))
(declare-datatypes ((array!76139 0))(
  ( (array!76140 (arr!36719 (Array (_ BitVec 32) ValueCell!14124)) (size!37255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76139)

(declare-fun mapDefault!46328 () ValueCell!14124)

(assert (=> b!1178297 (= condMapEmpty!46328 (= (arr!36719 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14124)) mapDefault!46328)))))

(declare-fun b!1178298 () Bool)

(declare-fun res!782753 () Bool)

(declare-fun e!669853 () Bool)

(assert (=> b!1178298 (=> (not res!782753) (not e!669853))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178298 (= res!782753 (validMask!0 mask!1564))))

(declare-fun b!1178300 () Bool)

(declare-fun Unit!38918 () Unit!38915)

(assert (=> b!1178300 (= e!669850 Unit!38918)))

(declare-fun b!1178301 () Bool)

(declare-fun e!669847 () Bool)

(declare-fun e!669857 () Bool)

(assert (=> b!1178301 (= e!669847 e!669857)))

(declare-fun res!782755 () Bool)

(assert (=> b!1178301 (=> res!782755 e!669857)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178301 (= res!782755 (not (validKeyInArray!0 (select (arr!36718 _keys!1208) from!1455))))))

(declare-fun lt!532256 () ListLongMap!17019)

(declare-fun lt!532250 () ListLongMap!17019)

(assert (=> b!1178301 (= lt!532256 lt!532250)))

(declare-fun -!1573 (ListLongMap!17019 (_ BitVec 64)) ListLongMap!17019)

(assert (=> b!1178301 (= lt!532250 (-!1573 lt!532257 k0!934))))

(declare-fun zeroValue!944 () V!44683)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44683)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!532258 () array!76139)

(declare-fun lt!532260 () array!76137)

(declare-fun getCurrentListMapNoExtraKeys!4982 (array!76137 array!76139 (_ BitVec 32) (_ BitVec 32) V!44683 V!44683 (_ BitVec 32) Int) ListLongMap!17019)

(assert (=> b!1178301 (= lt!532256 (getCurrentListMapNoExtraKeys!4982 lt!532260 lt!532258 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178301 (= lt!532257 (getCurrentListMapNoExtraKeys!4982 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532255 () Unit!38915)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!800 (array!76137 array!76139 (_ BitVec 32) (_ BitVec 32) V!44683 V!44683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38915)

(assert (=> b!1178301 (= lt!532255 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178302 () Bool)

(declare-fun res!782751 () Bool)

(assert (=> b!1178302 (=> (not res!782751) (not e!669853))))

(assert (=> b!1178302 (= res!782751 (validKeyInArray!0 k0!934))))

(declare-fun b!1178303 () Bool)

(declare-fun e!669856 () Bool)

(assert (=> b!1178303 (= e!669853 e!669856)))

(declare-fun res!782758 () Bool)

(assert (=> b!1178303 (=> (not res!782758) (not e!669856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76137 (_ BitVec 32)) Bool)

(assert (=> b!1178303 (= res!782758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532260 mask!1564))))

(assert (=> b!1178303 (= lt!532260 (array!76138 (store (arr!36718 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37254 _keys!1208)))))

(declare-fun mapIsEmpty!46328 () Bool)

(assert (=> mapIsEmpty!46328 mapRes!46328))

(declare-fun b!1178304 () Bool)

(declare-fun e!669858 () Bool)

(assert (=> b!1178304 (= e!669856 (not e!669858))))

(declare-fun res!782760 () Bool)

(assert (=> b!1178304 (=> res!782760 e!669858)))

(assert (=> b!1178304 (= res!782760 (bvsgt from!1455 i!673))))

(assert (=> b!1178304 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532251 () Unit!38915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76137 (_ BitVec 64) (_ BitVec 32)) Unit!38915)

(assert (=> b!1178304 (= lt!532251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178305 () Bool)

(declare-fun res!782752 () Bool)

(assert (=> b!1178305 (=> (not res!782752) (not e!669853))))

(assert (=> b!1178305 (= res!782752 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25786))))

(declare-fun b!1178306 () Bool)

(declare-fun res!782757 () Bool)

(assert (=> b!1178306 (=> (not res!782757) (not e!669853))))

(assert (=> b!1178306 (= res!782757 (and (= (size!37255 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37254 _keys!1208) (size!37255 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178307 () Bool)

(declare-fun res!782746 () Bool)

(assert (=> b!1178307 (=> (not res!782746) (not e!669853))))

(assert (=> b!1178307 (= res!782746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178308 () Bool)

(declare-fun e!669851 () Bool)

(declare-fun e!669848 () Bool)

(assert (=> b!1178308 (= e!669851 e!669848)))

(declare-fun res!782761 () Bool)

(assert (=> b!1178308 (=> res!782761 e!669848)))

(assert (=> b!1178308 (= res!782761 (not (= (select (arr!36718 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178309 () Bool)

(declare-fun tp_is_empty!29667 () Bool)

(assert (=> b!1178309 (= e!669849 tp_is_empty!29667)))

(declare-fun b!1178310 () Bool)

(declare-fun e!669852 () Bool)

(assert (=> b!1178310 (= e!669852 tp_is_empty!29667)))

(declare-fun res!782749 () Bool)

(assert (=> start!99558 (=> (not res!782749) (not e!669853))))

(assert (=> start!99558 (= res!782749 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37254 _keys!1208))))))

(assert (=> start!99558 e!669853))

(assert (=> start!99558 tp_is_empty!29667))

(declare-fun array_inv!28036 (array!76137) Bool)

(assert (=> start!99558 (array_inv!28036 _keys!1208)))

(assert (=> start!99558 true))

(assert (=> start!99558 tp!88125))

(declare-fun array_inv!28037 (array!76139) Bool)

(assert (=> start!99558 (and (array_inv!28037 _values!996) e!669855)))

(declare-fun b!1178299 () Bool)

(declare-fun res!782756 () Bool)

(assert (=> b!1178299 (=> (not res!782756) (not e!669853))))

(assert (=> b!1178299 (= res!782756 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37254 _keys!1208))))))

(declare-fun b!1178311 () Bool)

(declare-fun res!782759 () Bool)

(assert (=> b!1178311 (=> (not res!782759) (not e!669853))))

(assert (=> b!1178311 (= res!782759 (= (select (arr!36718 _keys!1208) i!673) k0!934))))

(declare-fun b!1178312 () Bool)

(assert (=> b!1178312 (= e!669858 e!669847)))

(declare-fun res!782750 () Bool)

(assert (=> b!1178312 (=> res!782750 e!669847)))

(assert (=> b!1178312 (= res!782750 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!532254 () ListLongMap!17019)

(assert (=> b!1178312 (= lt!532254 (getCurrentListMapNoExtraKeys!4982 lt!532260 lt!532258 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532253 () V!44683)

(assert (=> b!1178312 (= lt!532258 (array!76140 (store (arr!36719 _values!996) i!673 (ValueCellFull!14124 lt!532253)) (size!37255 _values!996)))))

(declare-fun dynLambda!2944 (Int (_ BitVec 64)) V!44683)

(assert (=> b!1178312 (= lt!532253 (dynLambda!2944 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178312 (= lt!532252 (getCurrentListMapNoExtraKeys!4982 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178313 () Bool)

(declare-fun res!782747 () Bool)

(assert (=> b!1178313 (=> (not res!782747) (not e!669856))))

(assert (=> b!1178313 (= res!782747 (arrayNoDuplicates!0 lt!532260 #b00000000000000000000000000000000 Nil!25786))))

(declare-fun mapNonEmpty!46328 () Bool)

(declare-fun tp!88124 () Bool)

(assert (=> mapNonEmpty!46328 (= mapRes!46328 (and tp!88124 e!669852))))

(declare-fun mapRest!46328 () (Array (_ BitVec 32) ValueCell!14124))

(declare-fun mapValue!46328 () ValueCell!14124)

(declare-fun mapKey!46328 () (_ BitVec 32))

(assert (=> mapNonEmpty!46328 (= (arr!36719 _values!996) (store mapRest!46328 mapKey!46328 mapValue!46328))))

(declare-fun b!1178314 () Bool)

(assert (=> b!1178314 (= e!669848 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178315 () Bool)

(assert (=> b!1178315 (= e!669857 true)))

(assert (=> b!1178315 e!669854))

(declare-fun res!782754 () Bool)

(assert (=> b!1178315 (=> (not res!782754) (not e!669854))))

(assert (=> b!1178315 (= res!782754 (not (= (select (arr!36718 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532262 () Unit!38915)

(assert (=> b!1178315 (= lt!532262 e!669850)))

(declare-fun c!116829 () Bool)

(assert (=> b!1178315 (= c!116829 (= (select (arr!36718 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178315 e!669851))

(declare-fun res!782748 () Bool)

(assert (=> b!1178315 (=> (not res!782748) (not e!669851))))

(assert (=> b!1178315 (= res!782748 (= lt!532254 (+!3839 lt!532250 lt!532261)))))

(declare-fun get!18765 (ValueCell!14124 V!44683) V!44683)

(assert (=> b!1178315 (= lt!532261 (tuple2!19051 (select (arr!36718 _keys!1208) from!1455) (get!18765 (select (arr!36719 _values!996) from!1455) lt!532253)))))

(assert (= (and start!99558 res!782749) b!1178298))

(assert (= (and b!1178298 res!782753) b!1178306))

(assert (= (and b!1178306 res!782757) b!1178307))

(assert (= (and b!1178307 res!782746) b!1178305))

(assert (= (and b!1178305 res!782752) b!1178299))

(assert (= (and b!1178299 res!782756) b!1178302))

(assert (= (and b!1178302 res!782751) b!1178311))

(assert (= (and b!1178311 res!782759) b!1178303))

(assert (= (and b!1178303 res!782758) b!1178313))

(assert (= (and b!1178313 res!782747) b!1178304))

(assert (= (and b!1178304 (not res!782760)) b!1178312))

(assert (= (and b!1178312 (not res!782750)) b!1178301))

(assert (= (and b!1178301 (not res!782755)) b!1178315))

(assert (= (and b!1178315 res!782748) b!1178308))

(assert (= (and b!1178308 (not res!782761)) b!1178314))

(assert (= (and b!1178315 c!116829) b!1178296))

(assert (= (and b!1178315 (not c!116829)) b!1178300))

(assert (= (and b!1178315 res!782754) b!1178295))

(assert (= (and b!1178297 condMapEmpty!46328) mapIsEmpty!46328))

(assert (= (and b!1178297 (not condMapEmpty!46328)) mapNonEmpty!46328))

(get-info :version)

(assert (= (and mapNonEmpty!46328 ((_ is ValueCellFull!14124) mapValue!46328)) b!1178310))

(assert (= (and b!1178297 ((_ is ValueCellFull!14124) mapDefault!46328)) b!1178309))

(assert (= start!99558 b!1178297))

(declare-fun b_lambda!20281 () Bool)

(assert (=> (not b_lambda!20281) (not b!1178312)))

(declare-fun t!37916 () Bool)

(declare-fun tb!9949 () Bool)

(assert (=> (and start!99558 (= defaultEntry!1004 defaultEntry!1004) t!37916) tb!9949))

(declare-fun result!20465 () Bool)

(assert (=> tb!9949 (= result!20465 tp_is_empty!29667)))

(assert (=> b!1178312 t!37916))

(declare-fun b_and!41143 () Bool)

(assert (= b_and!41141 (and (=> t!37916 result!20465) b_and!41143)))

(declare-fun m!1086255 () Bool)

(assert (=> start!99558 m!1086255))

(declare-fun m!1086257 () Bool)

(assert (=> start!99558 m!1086257))

(declare-fun m!1086259 () Bool)

(assert (=> b!1178301 m!1086259))

(declare-fun m!1086261 () Bool)

(assert (=> b!1178301 m!1086261))

(declare-fun m!1086263 () Bool)

(assert (=> b!1178301 m!1086263))

(declare-fun m!1086265 () Bool)

(assert (=> b!1178301 m!1086265))

(assert (=> b!1178301 m!1086261))

(declare-fun m!1086267 () Bool)

(assert (=> b!1178301 m!1086267))

(declare-fun m!1086269 () Bool)

(assert (=> b!1178301 m!1086269))

(declare-fun m!1086271 () Bool)

(assert (=> b!1178295 m!1086271))

(declare-fun m!1086273 () Bool)

(assert (=> b!1178311 m!1086273))

(assert (=> b!1178315 m!1086261))

(declare-fun m!1086275 () Bool)

(assert (=> b!1178315 m!1086275))

(declare-fun m!1086277 () Bool)

(assert (=> b!1178315 m!1086277))

(assert (=> b!1178315 m!1086277))

(declare-fun m!1086279 () Bool)

(assert (=> b!1178315 m!1086279))

(declare-fun m!1086281 () Bool)

(assert (=> mapNonEmpty!46328 m!1086281))

(declare-fun m!1086283 () Bool)

(assert (=> b!1178313 m!1086283))

(declare-fun m!1086285 () Bool)

(assert (=> b!1178302 m!1086285))

(declare-fun m!1086287 () Bool)

(assert (=> b!1178305 m!1086287))

(declare-fun m!1086289 () Bool)

(assert (=> b!1178314 m!1086289))

(declare-fun m!1086291 () Bool)

(assert (=> b!1178304 m!1086291))

(declare-fun m!1086293 () Bool)

(assert (=> b!1178304 m!1086293))

(declare-fun m!1086295 () Bool)

(assert (=> b!1178303 m!1086295))

(declare-fun m!1086297 () Bool)

(assert (=> b!1178303 m!1086297))

(declare-fun m!1086299 () Bool)

(assert (=> b!1178298 m!1086299))

(declare-fun m!1086301 () Bool)

(assert (=> b!1178307 m!1086301))

(declare-fun m!1086303 () Bool)

(assert (=> b!1178312 m!1086303))

(declare-fun m!1086305 () Bool)

(assert (=> b!1178312 m!1086305))

(declare-fun m!1086307 () Bool)

(assert (=> b!1178312 m!1086307))

(declare-fun m!1086309 () Bool)

(assert (=> b!1178312 m!1086309))

(declare-fun m!1086311 () Bool)

(assert (=> b!1178296 m!1086311))

(declare-fun m!1086313 () Bool)

(assert (=> b!1178296 m!1086313))

(declare-fun m!1086315 () Bool)

(assert (=> b!1178296 m!1086315))

(declare-fun m!1086317 () Bool)

(assert (=> b!1178296 m!1086317))

(declare-fun m!1086319 () Bool)

(assert (=> b!1178296 m!1086319))

(assert (=> b!1178308 m!1086261))

(check-sat (not b_next!25137) (not b!1178314) (not b!1178305) (not b!1178313) (not b_lambda!20281) b_and!41143 (not b!1178307) (not b!1178295) (not b!1178302) (not b!1178303) (not b!1178298) (not b!1178296) (not b!1178315) tp_is_empty!29667 (not b!1178304) (not start!99558) (not b!1178312) (not mapNonEmpty!46328) (not b!1178301))
(check-sat b_and!41143 (not b_next!25137))
