; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100098 () Bool)

(assert start!100098)

(declare-fun b_free!25441 () Bool)

(declare-fun b_next!25441 () Bool)

(assert (=> start!100098 (= b_free!25441 (not b_next!25441))))

(declare-fun tp!89036 () Bool)

(declare-fun b_and!41751 () Bool)

(assert (=> start!100098 (= tp!89036 b_and!41751)))

(declare-fun b!1189246 () Bool)

(declare-fun e!676308 () Bool)

(declare-fun e!676306 () Bool)

(assert (=> b!1189246 (= e!676308 (not e!676306))))

(declare-fun res!790338 () Bool)

(assert (=> b!1189246 (=> res!790338 e!676306)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189246 (= res!790338 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76783 0))(
  ( (array!76784 (arr!37035 (Array (_ BitVec 32) (_ BitVec 64))) (size!37572 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76783)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189246 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39385 0))(
  ( (Unit!39386) )
))
(declare-fun lt!540814 () Unit!39385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76783 (_ BitVec 64) (_ BitVec 32)) Unit!39385)

(assert (=> b!1189246 (= lt!540814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189247 () Bool)

(declare-fun e!676310 () Bool)

(assert (=> b!1189247 (= e!676310 true)))

(declare-datatypes ((V!45089 0))(
  ( (V!45090 (val!15042 Int)) )
))
(declare-datatypes ((tuple2!19348 0))(
  ( (tuple2!19349 (_1!9685 (_ BitVec 64)) (_2!9685 V!45089)) )
))
(declare-datatypes ((List!26088 0))(
  ( (Nil!26085) (Cons!26084 (h!27302 tuple2!19348) (t!38513 List!26088)) )
))
(declare-datatypes ((ListLongMap!17325 0))(
  ( (ListLongMap!17326 (toList!8678 List!26088)) )
))
(declare-fun lt!540816 () ListLongMap!17325)

(declare-fun lt!540806 () ListLongMap!17325)

(declare-fun -!1697 (ListLongMap!17325 (_ BitVec 64)) ListLongMap!17325)

(assert (=> b!1189247 (= (-!1697 lt!540816 k0!934) lt!540806)))

(declare-fun lt!540812 () ListLongMap!17325)

(declare-fun lt!540819 () V!45089)

(declare-fun lt!540810 () Unit!39385)

(declare-fun addRemoveCommutativeForDiffKeys!209 (ListLongMap!17325 (_ BitVec 64) V!45089 (_ BitVec 64)) Unit!39385)

(assert (=> b!1189247 (= lt!540810 (addRemoveCommutativeForDiffKeys!209 lt!540812 (select (arr!37035 _keys!1208) from!1455) lt!540819 k0!934))))

(declare-fun lt!540823 () ListLongMap!17325)

(declare-fun lt!540809 () ListLongMap!17325)

(declare-fun lt!540817 () ListLongMap!17325)

(assert (=> b!1189247 (and (= lt!540809 lt!540816) (= lt!540823 lt!540817))))

(declare-fun lt!540813 () tuple2!19348)

(declare-fun +!3993 (ListLongMap!17325 tuple2!19348) ListLongMap!17325)

(assert (=> b!1189247 (= lt!540816 (+!3993 lt!540812 lt!540813))))

(assert (=> b!1189247 (not (= (select (arr!37035 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540805 () Unit!39385)

(declare-fun e!676299 () Unit!39385)

(assert (=> b!1189247 (= lt!540805 e!676299)))

(declare-fun c!117683 () Bool)

(assert (=> b!1189247 (= c!117683 (= (select (arr!37035 _keys!1208) from!1455) k0!934))))

(declare-fun e!676302 () Bool)

(assert (=> b!1189247 e!676302))

(declare-fun res!790332 () Bool)

(assert (=> b!1189247 (=> (not res!790332) (not e!676302))))

(declare-fun lt!540818 () ListLongMap!17325)

(assert (=> b!1189247 (= res!790332 (= lt!540818 lt!540806))))

(assert (=> b!1189247 (= lt!540806 (+!3993 lt!540823 lt!540813))))

(assert (=> b!1189247 (= lt!540813 (tuple2!19349 (select (arr!37035 _keys!1208) from!1455) lt!540819))))

(declare-fun lt!540811 () V!45089)

(declare-datatypes ((ValueCell!14276 0))(
  ( (ValueCellFull!14276 (v!17676 V!45089)) (EmptyCell!14276) )
))
(declare-datatypes ((array!76785 0))(
  ( (array!76786 (arr!37036 (Array (_ BitVec 32) ValueCell!14276)) (size!37573 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76785)

(declare-fun get!19018 (ValueCell!14276 V!45089) V!45089)

(assert (=> b!1189247 (= lt!540819 (get!19018 (select (arr!37036 _values!996) from!1455) lt!540811))))

(declare-fun b!1189248 () Bool)

(declare-fun res!790345 () Bool)

(declare-fun e!676305 () Bool)

(assert (=> b!1189248 (=> (not res!790345) (not e!676305))))

(declare-datatypes ((List!26089 0))(
  ( (Nil!26086) (Cons!26085 (h!27303 (_ BitVec 64)) (t!38514 List!26089)) )
))
(declare-fun arrayNoDuplicates!0 (array!76783 (_ BitVec 32) List!26089) Bool)

(assert (=> b!1189248 (= res!790345 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26086))))

(declare-fun mapNonEmpty!46784 () Bool)

(declare-fun mapRes!46784 () Bool)

(declare-fun tp!89037 () Bool)

(declare-fun e!676307 () Bool)

(assert (=> mapNonEmpty!46784 (= mapRes!46784 (and tp!89037 e!676307))))

(declare-fun mapRest!46784 () (Array (_ BitVec 32) ValueCell!14276))

(declare-fun mapKey!46784 () (_ BitVec 32))

(declare-fun mapValue!46784 () ValueCell!14276)

(assert (=> mapNonEmpty!46784 (= (arr!37036 _values!996) (store mapRest!46784 mapKey!46784 mapValue!46784))))

(declare-fun b!1189249 () Bool)

(declare-fun res!790333 () Bool)

(assert (=> b!1189249 (=> (not res!790333) (not e!676305))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189249 (= res!790333 (validMask!0 mask!1564))))

(declare-fun b!1189250 () Bool)

(declare-fun e!676301 () Bool)

(assert (=> b!1189250 (= e!676301 e!676310)))

(declare-fun res!790337 () Bool)

(assert (=> b!1189250 (=> res!790337 e!676310)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189250 (= res!790337 (not (validKeyInArray!0 (select (arr!37035 _keys!1208) from!1455))))))

(assert (=> b!1189250 (= lt!540817 lt!540823)))

(assert (=> b!1189250 (= lt!540823 (-!1697 lt!540812 k0!934))))

(declare-fun zeroValue!944 () V!45089)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!540822 () array!76785)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540808 () array!76783)

(declare-fun minValue!944 () V!45089)

(declare-fun getCurrentListMapNoExtraKeys!5146 (array!76783 array!76785 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) Int) ListLongMap!17325)

(assert (=> b!1189250 (= lt!540817 (getCurrentListMapNoExtraKeys!5146 lt!540808 lt!540822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1189250 (= lt!540812 (getCurrentListMapNoExtraKeys!5146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540821 () Unit!39385)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!912 (array!76783 array!76785 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39385)

(assert (=> b!1189250 (= lt!540821 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189251 () Bool)

(assert (=> b!1189251 (= e!676306 e!676301)))

(declare-fun res!790346 () Bool)

(assert (=> b!1189251 (=> res!790346 e!676301)))

(assert (=> b!1189251 (= res!790346 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1189251 (= lt!540818 (getCurrentListMapNoExtraKeys!5146 lt!540808 lt!540822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1189251 (= lt!540822 (array!76786 (store (arr!37036 _values!996) i!673 (ValueCellFull!14276 lt!540811)) (size!37573 _values!996)))))

(declare-fun dynLambda!3105 (Int (_ BitVec 64)) V!45089)

(assert (=> b!1189251 (= lt!540811 (dynLambda!3105 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1189251 (= lt!540809 (getCurrentListMapNoExtraKeys!5146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189252 () Bool)

(declare-fun e!676300 () Bool)

(assert (=> b!1189252 (= e!676302 e!676300)))

(declare-fun res!790344 () Bool)

(assert (=> b!1189252 (=> res!790344 e!676300)))

(assert (=> b!1189252 (= res!790344 (not (= (select (arr!37035 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1189253 () Bool)

(declare-fun res!790339 () Bool)

(assert (=> b!1189253 (=> (not res!790339) (not e!676305))))

(assert (=> b!1189253 (= res!790339 (and (= (size!37573 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37572 _keys!1208) (size!37573 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189254 () Bool)

(declare-fun tp_is_empty!29971 () Bool)

(assert (=> b!1189254 (= e!676307 tp_is_empty!29971)))

(declare-fun b!1189255 () Bool)

(declare-fun e!676309 () Bool)

(assert (=> b!1189255 (= e!676309 tp_is_empty!29971)))

(declare-fun b!1189256 () Bool)

(declare-fun Unit!39387 () Unit!39385)

(assert (=> b!1189256 (= e!676299 Unit!39387)))

(declare-fun lt!540820 () Unit!39385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76783 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39385)

(assert (=> b!1189256 (= lt!540820 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1189256 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540815 () Unit!39385)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76783 (_ BitVec 32) (_ BitVec 32)) Unit!39385)

(assert (=> b!1189256 (= lt!540815 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1189256 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26086)))

(declare-fun lt!540807 () Unit!39385)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76783 (_ BitVec 64) (_ BitVec 32) List!26089) Unit!39385)

(assert (=> b!1189256 (= lt!540807 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26086))))

(assert (=> b!1189256 false))

(declare-fun b!1189257 () Bool)

(assert (=> b!1189257 (= e!676305 e!676308)))

(declare-fun res!790343 () Bool)

(assert (=> b!1189257 (=> (not res!790343) (not e!676308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76783 (_ BitVec 32)) Bool)

(assert (=> b!1189257 (= res!790343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540808 mask!1564))))

(assert (=> b!1189257 (= lt!540808 (array!76784 (store (arr!37035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37572 _keys!1208)))))

(declare-fun b!1189258 () Bool)

(declare-fun e!676304 () Bool)

(assert (=> b!1189258 (= e!676304 (and e!676309 mapRes!46784))))

(declare-fun condMapEmpty!46784 () Bool)

(declare-fun mapDefault!46784 () ValueCell!14276)

(assert (=> b!1189258 (= condMapEmpty!46784 (= (arr!37036 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14276)) mapDefault!46784)))))

(declare-fun res!790340 () Bool)

(assert (=> start!100098 (=> (not res!790340) (not e!676305))))

(assert (=> start!100098 (= res!790340 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37572 _keys!1208))))))

(assert (=> start!100098 e!676305))

(assert (=> start!100098 tp_is_empty!29971))

(declare-fun array_inv!28324 (array!76783) Bool)

(assert (=> start!100098 (array_inv!28324 _keys!1208)))

(assert (=> start!100098 true))

(assert (=> start!100098 tp!89036))

(declare-fun array_inv!28325 (array!76785) Bool)

(assert (=> start!100098 (and (array_inv!28325 _values!996) e!676304)))

(declare-fun mapIsEmpty!46784 () Bool)

(assert (=> mapIsEmpty!46784 mapRes!46784))

(declare-fun b!1189259 () Bool)

(declare-fun Unit!39388 () Unit!39385)

(assert (=> b!1189259 (= e!676299 Unit!39388)))

(declare-fun b!1189260 () Bool)

(declare-fun res!790335 () Bool)

(assert (=> b!1189260 (=> (not res!790335) (not e!676305))))

(assert (=> b!1189260 (= res!790335 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37572 _keys!1208))))))

(declare-fun b!1189261 () Bool)

(assert (=> b!1189261 (= e!676300 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189262 () Bool)

(declare-fun res!790336 () Bool)

(assert (=> b!1189262 (=> (not res!790336) (not e!676305))))

(assert (=> b!1189262 (= res!790336 (= (select (arr!37035 _keys!1208) i!673) k0!934))))

(declare-fun b!1189263 () Bool)

(declare-fun res!790341 () Bool)

(assert (=> b!1189263 (=> (not res!790341) (not e!676308))))

(assert (=> b!1189263 (= res!790341 (arrayNoDuplicates!0 lt!540808 #b00000000000000000000000000000000 Nil!26086))))

(declare-fun b!1189264 () Bool)

(declare-fun res!790342 () Bool)

(assert (=> b!1189264 (=> (not res!790342) (not e!676305))))

(assert (=> b!1189264 (= res!790342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189265 () Bool)

(declare-fun res!790334 () Bool)

(assert (=> b!1189265 (=> (not res!790334) (not e!676305))))

(assert (=> b!1189265 (= res!790334 (validKeyInArray!0 k0!934))))

(assert (= (and start!100098 res!790340) b!1189249))

(assert (= (and b!1189249 res!790333) b!1189253))

(assert (= (and b!1189253 res!790339) b!1189264))

(assert (= (and b!1189264 res!790342) b!1189248))

(assert (= (and b!1189248 res!790345) b!1189260))

(assert (= (and b!1189260 res!790335) b!1189265))

(assert (= (and b!1189265 res!790334) b!1189262))

(assert (= (and b!1189262 res!790336) b!1189257))

(assert (= (and b!1189257 res!790343) b!1189263))

(assert (= (and b!1189263 res!790341) b!1189246))

(assert (= (and b!1189246 (not res!790338)) b!1189251))

(assert (= (and b!1189251 (not res!790346)) b!1189250))

(assert (= (and b!1189250 (not res!790337)) b!1189247))

(assert (= (and b!1189247 res!790332) b!1189252))

(assert (= (and b!1189252 (not res!790344)) b!1189261))

(assert (= (and b!1189247 c!117683) b!1189256))

(assert (= (and b!1189247 (not c!117683)) b!1189259))

(assert (= (and b!1189258 condMapEmpty!46784) mapIsEmpty!46784))

(assert (= (and b!1189258 (not condMapEmpty!46784)) mapNonEmpty!46784))

(get-info :version)

(assert (= (and mapNonEmpty!46784 ((_ is ValueCellFull!14276) mapValue!46784)) b!1189254))

(assert (= (and b!1189258 ((_ is ValueCellFull!14276) mapDefault!46784)) b!1189255))

(assert (= start!100098 b!1189258))

(declare-fun b_lambda!20579 () Bool)

(assert (=> (not b_lambda!20579) (not b!1189251)))

(declare-fun t!38512 () Bool)

(declare-fun tb!10245 () Bool)

(assert (=> (and start!100098 (= defaultEntry!1004 defaultEntry!1004) t!38512) tb!10245))

(declare-fun result!21065 () Bool)

(assert (=> tb!10245 (= result!21065 tp_is_empty!29971)))

(assert (=> b!1189251 t!38512))

(declare-fun b_and!41753 () Bool)

(assert (= b_and!41751 (and (=> t!38512 result!21065) b_and!41753)))

(declare-fun m!1098267 () Bool)

(assert (=> b!1189251 m!1098267))

(declare-fun m!1098269 () Bool)

(assert (=> b!1189251 m!1098269))

(declare-fun m!1098271 () Bool)

(assert (=> b!1189251 m!1098271))

(declare-fun m!1098273 () Bool)

(assert (=> b!1189251 m!1098273))

(declare-fun m!1098275 () Bool)

(assert (=> start!100098 m!1098275))

(declare-fun m!1098277 () Bool)

(assert (=> start!100098 m!1098277))

(declare-fun m!1098279 () Bool)

(assert (=> b!1189257 m!1098279))

(declare-fun m!1098281 () Bool)

(assert (=> b!1189257 m!1098281))

(declare-fun m!1098283 () Bool)

(assert (=> b!1189264 m!1098283))

(declare-fun m!1098285 () Bool)

(assert (=> b!1189249 m!1098285))

(declare-fun m!1098287 () Bool)

(assert (=> b!1189246 m!1098287))

(declare-fun m!1098289 () Bool)

(assert (=> b!1189246 m!1098289))

(declare-fun m!1098291 () Bool)

(assert (=> b!1189252 m!1098291))

(declare-fun m!1098293 () Bool)

(assert (=> mapNonEmpty!46784 m!1098293))

(declare-fun m!1098295 () Bool)

(assert (=> b!1189250 m!1098295))

(declare-fun m!1098297 () Bool)

(assert (=> b!1189250 m!1098297))

(declare-fun m!1098299 () Bool)

(assert (=> b!1189250 m!1098299))

(declare-fun m!1098301 () Bool)

(assert (=> b!1189250 m!1098301))

(assert (=> b!1189250 m!1098291))

(declare-fun m!1098303 () Bool)

(assert (=> b!1189250 m!1098303))

(assert (=> b!1189250 m!1098291))

(declare-fun m!1098305 () Bool)

(assert (=> b!1189248 m!1098305))

(declare-fun m!1098307 () Bool)

(assert (=> b!1189261 m!1098307))

(declare-fun m!1098309 () Bool)

(assert (=> b!1189256 m!1098309))

(declare-fun m!1098311 () Bool)

(assert (=> b!1189256 m!1098311))

(declare-fun m!1098313 () Bool)

(assert (=> b!1189256 m!1098313))

(declare-fun m!1098315 () Bool)

(assert (=> b!1189256 m!1098315))

(declare-fun m!1098317 () Bool)

(assert (=> b!1189256 m!1098317))

(declare-fun m!1098319 () Bool)

(assert (=> b!1189263 m!1098319))

(declare-fun m!1098321 () Bool)

(assert (=> b!1189262 m!1098321))

(declare-fun m!1098323 () Bool)

(assert (=> b!1189247 m!1098323))

(declare-fun m!1098325 () Bool)

(assert (=> b!1189247 m!1098325))

(declare-fun m!1098327 () Bool)

(assert (=> b!1189247 m!1098327))

(assert (=> b!1189247 m!1098291))

(declare-fun m!1098329 () Bool)

(assert (=> b!1189247 m!1098329))

(assert (=> b!1189247 m!1098323))

(declare-fun m!1098331 () Bool)

(assert (=> b!1189247 m!1098331))

(declare-fun m!1098333 () Bool)

(assert (=> b!1189247 m!1098333))

(assert (=> b!1189247 m!1098291))

(declare-fun m!1098335 () Bool)

(assert (=> b!1189265 m!1098335))

(check-sat (not b!1189250) (not b_lambda!20579) (not b!1189265) (not start!100098) (not b!1189263) (not b!1189246) (not b!1189264) (not b_next!25441) (not b!1189256) (not b!1189249) (not b!1189247) (not b!1189251) (not b!1189257) b_and!41753 (not b!1189248) tp_is_empty!29971 (not mapNonEmpty!46784) (not b!1189261))
(check-sat b_and!41753 (not b_next!25441))
