; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99684 () Bool)

(assert start!99684)

(declare-fun b_free!25027 () Bool)

(declare-fun b_next!25027 () Bool)

(assert (=> start!99684 (= b_free!25027 (not b_next!25027))))

(declare-fun tp!87794 () Bool)

(declare-fun b_and!40923 () Bool)

(assert (=> start!99684 (= tp!87794 b_and!40923)))

(declare-fun b!1176070 () Bool)

(declare-fun res!780687 () Bool)

(declare-fun e!668606 () Bool)

(assert (=> b!1176070 (=> (not res!780687) (not e!668606))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176070 (= res!780687 (validKeyInArray!0 k0!934))))

(declare-fun b!1176071 () Bool)

(declare-fun e!668603 () Bool)

(declare-fun e!668598 () Bool)

(assert (=> b!1176071 (= e!668603 e!668598)))

(declare-fun res!780683 () Bool)

(assert (=> b!1176071 (=> res!780683 e!668598)))

(declare-datatypes ((array!75979 0))(
  ( (array!75980 (arr!36633 (Array (_ BitVec 32) (_ BitVec 64))) (size!37170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75979)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176071 (= res!780683 (not (= (select (arr!36633 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176072 () Bool)

(declare-fun e!668602 () Bool)

(declare-fun e!668599 () Bool)

(assert (=> b!1176072 (= e!668602 e!668599)))

(declare-fun res!780685 () Bool)

(assert (=> b!1176072 (=> res!780685 e!668599)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176072 (= res!780685 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530329 () array!75979)

(declare-datatypes ((V!44537 0))(
  ( (V!44538 (val!14835 Int)) )
))
(declare-fun minValue!944 () V!44537)

(declare-datatypes ((ValueCell!14069 0))(
  ( (ValueCellFull!14069 (v!17469 V!44537)) (EmptyCell!14069) )
))
(declare-datatypes ((array!75981 0))(
  ( (array!75982 (arr!36634 (Array (_ BitVec 32) ValueCell!14069)) (size!37171 (_ BitVec 32))) )
))
(declare-fun lt!530331 () array!75981)

(declare-datatypes ((tuple2!19008 0))(
  ( (tuple2!19009 (_1!9515 (_ BitVec 64)) (_2!9515 V!44537)) )
))
(declare-datatypes ((List!25743 0))(
  ( (Nil!25740) (Cons!25739 (h!26957 tuple2!19008) (t!37754 List!25743)) )
))
(declare-datatypes ((ListLongMap!16985 0))(
  ( (ListLongMap!16986 (toList!8508 List!25743)) )
))
(declare-fun lt!530321 () ListLongMap!16985)

(declare-fun zeroValue!944 () V!44537)

(declare-fun getCurrentListMapNoExtraKeys!4991 (array!75979 array!75981 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) Int) ListLongMap!16985)

(assert (=> b!1176072 (= lt!530321 (getCurrentListMapNoExtraKeys!4991 lt!530329 lt!530331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530322 () V!44537)

(declare-fun _values!996 () array!75981)

(assert (=> b!1176072 (= lt!530331 (array!75982 (store (arr!36634 _values!996) i!673 (ValueCellFull!14069 lt!530322)) (size!37171 _values!996)))))

(declare-fun dynLambda!2969 (Int (_ BitVec 64)) V!44537)

(assert (=> b!1176072 (= lt!530322 (dynLambda!2969 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530330 () ListLongMap!16985)

(assert (=> b!1176072 (= lt!530330 (getCurrentListMapNoExtraKeys!4991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176073 () Bool)

(declare-fun e!668595 () Bool)

(declare-fun e!668605 () Bool)

(declare-fun mapRes!46163 () Bool)

(assert (=> b!1176073 (= e!668595 (and e!668605 mapRes!46163))))

(declare-fun condMapEmpty!46163 () Bool)

(declare-fun mapDefault!46163 () ValueCell!14069)

(assert (=> b!1176073 (= condMapEmpty!46163 (= (arr!36634 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14069)) mapDefault!46163)))))

(declare-fun b!1176074 () Bool)

(declare-datatypes ((Unit!38755 0))(
  ( (Unit!38756) )
))
(declare-fun e!668596 () Unit!38755)

(declare-fun Unit!38757 () Unit!38755)

(assert (=> b!1176074 (= e!668596 Unit!38757)))

(declare-fun lt!530323 () Unit!38755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38755)

(assert (=> b!1176074 (= lt!530323 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176074 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530327 () Unit!38755)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75979 (_ BitVec 32) (_ BitVec 32)) Unit!38755)

(assert (=> b!1176074 (= lt!530327 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25744 0))(
  ( (Nil!25741) (Cons!25740 (h!26958 (_ BitVec 64)) (t!37755 List!25744)) )
))
(declare-fun arrayNoDuplicates!0 (array!75979 (_ BitVec 32) List!25744) Bool)

(assert (=> b!1176074 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25741)))

(declare-fun lt!530326 () Unit!38755)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75979 (_ BitVec 64) (_ BitVec 32) List!25744) Unit!38755)

(assert (=> b!1176074 (= lt!530326 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25741))))

(assert (=> b!1176074 false))

(declare-fun mapIsEmpty!46163 () Bool)

(assert (=> mapIsEmpty!46163 mapRes!46163))

(declare-fun b!1176075 () Bool)

(declare-fun res!780688 () Bool)

(assert (=> b!1176075 (=> (not res!780688) (not e!668606))))

(assert (=> b!1176075 (= res!780688 (= (select (arr!36633 _keys!1208) i!673) k0!934))))

(declare-fun res!780689 () Bool)

(assert (=> start!99684 (=> (not res!780689) (not e!668606))))

(assert (=> start!99684 (= res!780689 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37170 _keys!1208))))))

(assert (=> start!99684 e!668606))

(declare-fun tp_is_empty!29557 () Bool)

(assert (=> start!99684 tp_is_empty!29557))

(declare-fun array_inv!28062 (array!75979) Bool)

(assert (=> start!99684 (array_inv!28062 _keys!1208)))

(assert (=> start!99684 true))

(assert (=> start!99684 tp!87794))

(declare-fun array_inv!28063 (array!75981) Bool)

(assert (=> start!99684 (and (array_inv!28063 _values!996) e!668595)))

(declare-fun b!1176076 () Bool)

(declare-fun e!668600 () Bool)

(assert (=> b!1176076 (= e!668600 (not e!668602))))

(declare-fun res!780678 () Bool)

(assert (=> b!1176076 (=> res!780678 e!668602)))

(assert (=> b!1176076 (= res!780678 (bvsgt from!1455 i!673))))

(assert (=> b!1176076 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530325 () Unit!38755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75979 (_ BitVec 64) (_ BitVec 32)) Unit!38755)

(assert (=> b!1176076 (= lt!530325 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176077 () Bool)

(assert (=> b!1176077 (= e!668606 e!668600)))

(declare-fun res!780686 () Bool)

(assert (=> b!1176077 (=> (not res!780686) (not e!668600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75979 (_ BitVec 32)) Bool)

(assert (=> b!1176077 (= res!780686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530329 mask!1564))))

(assert (=> b!1176077 (= lt!530329 (array!75980 (store (arr!36633 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37170 _keys!1208)))))

(declare-fun b!1176078 () Bool)

(declare-fun res!780680 () Bool)

(assert (=> b!1176078 (=> (not res!780680) (not e!668606))))

(assert (=> b!1176078 (= res!780680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176079 () Bool)

(declare-fun res!780677 () Bool)

(assert (=> b!1176079 (=> (not res!780677) (not e!668600))))

(assert (=> b!1176079 (= res!780677 (arrayNoDuplicates!0 lt!530329 #b00000000000000000000000000000000 Nil!25741))))

(declare-fun b!1176080 () Bool)

(declare-fun e!668601 () Bool)

(assert (=> b!1176080 (= e!668599 e!668601)))

(declare-fun res!780675 () Bool)

(assert (=> b!1176080 (=> res!780675 e!668601)))

(assert (=> b!1176080 (= res!780675 (not (validKeyInArray!0 (select (arr!36633 _keys!1208) from!1455))))))

(declare-fun lt!530332 () ListLongMap!16985)

(declare-fun lt!530324 () ListLongMap!16985)

(assert (=> b!1176080 (= lt!530332 lt!530324)))

(declare-fun lt!530320 () ListLongMap!16985)

(declare-fun -!1551 (ListLongMap!16985 (_ BitVec 64)) ListLongMap!16985)

(assert (=> b!1176080 (= lt!530324 (-!1551 lt!530320 k0!934))))

(assert (=> b!1176080 (= lt!530332 (getCurrentListMapNoExtraKeys!4991 lt!530329 lt!530331 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176080 (= lt!530320 (getCurrentListMapNoExtraKeys!4991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530328 () Unit!38755)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!776 (array!75979 array!75981 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38755)

(assert (=> b!1176080 (= lt!530328 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!776 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176081 () Bool)

(declare-fun res!780682 () Bool)

(assert (=> b!1176081 (=> (not res!780682) (not e!668606))))

(assert (=> b!1176081 (= res!780682 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37170 _keys!1208))))))

(declare-fun b!1176082 () Bool)

(assert (=> b!1176082 (= e!668605 tp_is_empty!29557)))

(declare-fun b!1176083 () Bool)

(declare-fun res!780676 () Bool)

(assert (=> b!1176083 (=> (not res!780676) (not e!668606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176083 (= res!780676 (validMask!0 mask!1564))))

(declare-fun b!1176084 () Bool)

(declare-fun Unit!38758 () Unit!38755)

(assert (=> b!1176084 (= e!668596 Unit!38758)))

(declare-fun b!1176085 () Bool)

(declare-fun res!780684 () Bool)

(assert (=> b!1176085 (=> (not res!780684) (not e!668606))))

(assert (=> b!1176085 (= res!780684 (and (= (size!37171 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37170 _keys!1208) (size!37171 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176086 () Bool)

(assert (=> b!1176086 (= e!668601 true)))

(assert (=> b!1176086 (not (= (select (arr!36633 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530319 () Unit!38755)

(assert (=> b!1176086 (= lt!530319 e!668596)))

(declare-fun c!117062 () Bool)

(assert (=> b!1176086 (= c!117062 (= (select (arr!36633 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176086 e!668603))

(declare-fun res!780679 () Bool)

(assert (=> b!1176086 (=> (not res!780679) (not e!668603))))

(declare-fun +!3840 (ListLongMap!16985 tuple2!19008) ListLongMap!16985)

(declare-fun get!18734 (ValueCell!14069 V!44537) V!44537)

(assert (=> b!1176086 (= res!780679 (= lt!530321 (+!3840 lt!530324 (tuple2!19009 (select (arr!36633 _keys!1208) from!1455) (get!18734 (select (arr!36634 _values!996) from!1455) lt!530322)))))))

(declare-fun b!1176087 () Bool)

(declare-fun e!668597 () Bool)

(assert (=> b!1176087 (= e!668597 tp_is_empty!29557)))

(declare-fun b!1176088 () Bool)

(declare-fun res!780681 () Bool)

(assert (=> b!1176088 (=> (not res!780681) (not e!668606))))

(assert (=> b!1176088 (= res!780681 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25741))))

(declare-fun mapNonEmpty!46163 () Bool)

(declare-fun tp!87795 () Bool)

(assert (=> mapNonEmpty!46163 (= mapRes!46163 (and tp!87795 e!668597))))

(declare-fun mapKey!46163 () (_ BitVec 32))

(declare-fun mapValue!46163 () ValueCell!14069)

(declare-fun mapRest!46163 () (Array (_ BitVec 32) ValueCell!14069))

(assert (=> mapNonEmpty!46163 (= (arr!36634 _values!996) (store mapRest!46163 mapKey!46163 mapValue!46163))))

(declare-fun b!1176089 () Bool)

(assert (=> b!1176089 (= e!668598 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99684 res!780689) b!1176083))

(assert (= (and b!1176083 res!780676) b!1176085))

(assert (= (and b!1176085 res!780684) b!1176078))

(assert (= (and b!1176078 res!780680) b!1176088))

(assert (= (and b!1176088 res!780681) b!1176081))

(assert (= (and b!1176081 res!780682) b!1176070))

(assert (= (and b!1176070 res!780687) b!1176075))

(assert (= (and b!1176075 res!780688) b!1176077))

(assert (= (and b!1176077 res!780686) b!1176079))

(assert (= (and b!1176079 res!780677) b!1176076))

(assert (= (and b!1176076 (not res!780678)) b!1176072))

(assert (= (and b!1176072 (not res!780685)) b!1176080))

(assert (= (and b!1176080 (not res!780675)) b!1176086))

(assert (= (and b!1176086 res!780679) b!1176071))

(assert (= (and b!1176071 (not res!780683)) b!1176089))

(assert (= (and b!1176086 c!117062) b!1176074))

(assert (= (and b!1176086 (not c!117062)) b!1176084))

(assert (= (and b!1176073 condMapEmpty!46163) mapIsEmpty!46163))

(assert (= (and b!1176073 (not condMapEmpty!46163)) mapNonEmpty!46163))

(get-info :version)

(assert (= (and mapNonEmpty!46163 ((_ is ValueCellFull!14069) mapValue!46163)) b!1176087))

(assert (= (and b!1176073 ((_ is ValueCellFull!14069) mapDefault!46163)) b!1176082))

(assert (= start!99684 b!1176073))

(declare-fun b_lambda!20165 () Bool)

(assert (=> (not b_lambda!20165) (not b!1176072)))

(declare-fun t!37753 () Bool)

(declare-fun tb!9831 () Bool)

(assert (=> (and start!99684 (= defaultEntry!1004 defaultEntry!1004) t!37753) tb!9831))

(declare-fun result!20237 () Bool)

(assert (=> tb!9831 (= result!20237 tp_is_empty!29557)))

(assert (=> b!1176072 t!37753))

(declare-fun b_and!40925 () Bool)

(assert (= b_and!40923 (and (=> t!37753 result!20237) b_and!40925)))

(declare-fun m!1084239 () Bool)

(assert (=> b!1176088 m!1084239))

(declare-fun m!1084241 () Bool)

(assert (=> start!99684 m!1084241))

(declare-fun m!1084243 () Bool)

(assert (=> start!99684 m!1084243))

(declare-fun m!1084245 () Bool)

(assert (=> b!1176076 m!1084245))

(declare-fun m!1084247 () Bool)

(assert (=> b!1176076 m!1084247))

(declare-fun m!1084249 () Bool)

(assert (=> b!1176089 m!1084249))

(declare-fun m!1084251 () Bool)

(assert (=> b!1176080 m!1084251))

(declare-fun m!1084253 () Bool)

(assert (=> b!1176080 m!1084253))

(declare-fun m!1084255 () Bool)

(assert (=> b!1176080 m!1084255))

(declare-fun m!1084257 () Bool)

(assert (=> b!1176080 m!1084257))

(assert (=> b!1176080 m!1084257))

(declare-fun m!1084259 () Bool)

(assert (=> b!1176080 m!1084259))

(declare-fun m!1084261 () Bool)

(assert (=> b!1176080 m!1084261))

(assert (=> b!1176086 m!1084257))

(declare-fun m!1084263 () Bool)

(assert (=> b!1176086 m!1084263))

(assert (=> b!1176086 m!1084263))

(declare-fun m!1084265 () Bool)

(assert (=> b!1176086 m!1084265))

(declare-fun m!1084267 () Bool)

(assert (=> b!1176086 m!1084267))

(assert (=> b!1176071 m!1084257))

(declare-fun m!1084269 () Bool)

(assert (=> b!1176079 m!1084269))

(declare-fun m!1084271 () Bool)

(assert (=> b!1176078 m!1084271))

(declare-fun m!1084273 () Bool)

(assert (=> b!1176075 m!1084273))

(declare-fun m!1084275 () Bool)

(assert (=> b!1176070 m!1084275))

(declare-fun m!1084277 () Bool)

(assert (=> b!1176074 m!1084277))

(declare-fun m!1084279 () Bool)

(assert (=> b!1176074 m!1084279))

(declare-fun m!1084281 () Bool)

(assert (=> b!1176074 m!1084281))

(declare-fun m!1084283 () Bool)

(assert (=> b!1176074 m!1084283))

(declare-fun m!1084285 () Bool)

(assert (=> b!1176074 m!1084285))

(declare-fun m!1084287 () Bool)

(assert (=> b!1176072 m!1084287))

(declare-fun m!1084289 () Bool)

(assert (=> b!1176072 m!1084289))

(declare-fun m!1084291 () Bool)

(assert (=> b!1176072 m!1084291))

(declare-fun m!1084293 () Bool)

(assert (=> b!1176072 m!1084293))

(declare-fun m!1084295 () Bool)

(assert (=> b!1176083 m!1084295))

(declare-fun m!1084297 () Bool)

(assert (=> mapNonEmpty!46163 m!1084297))

(declare-fun m!1084299 () Bool)

(assert (=> b!1176077 m!1084299))

(declare-fun m!1084301 () Bool)

(assert (=> b!1176077 m!1084301))

(check-sat (not b!1176076) (not b!1176088) (not b!1176074) tp_is_empty!29557 (not start!99684) (not b!1176089) (not b!1176086) (not b!1176080) b_and!40925 (not b!1176077) (not b_next!25027) (not b_lambda!20165) (not b!1176072) (not mapNonEmpty!46163) (not b!1176083) (not b!1176079) (not b!1176070) (not b!1176078))
(check-sat b_and!40925 (not b_next!25027))
