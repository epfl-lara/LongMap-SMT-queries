; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101756 () Bool)

(assert start!101756)

(declare-fun b_free!26445 () Bool)

(declare-fun b_next!26445 () Bool)

(assert (=> start!101756 (= b_free!26445 (not b_next!26445))))

(declare-fun tp!92380 () Bool)

(declare-fun b_and!44151 () Bool)

(assert (=> start!101756 (= tp!92380 b_and!44151)))

(declare-fun b!1225257 () Bool)

(declare-fun e!695898 () Bool)

(declare-fun tp_is_empty!31149 () Bool)

(assert (=> b!1225257 (= e!695898 tp_is_empty!31149)))

(declare-fun b!1225258 () Bool)

(declare-fun res!814225 () Bool)

(declare-fun e!695905 () Bool)

(assert (=> b!1225258 (=> (not res!814225) (not e!695905))))

(declare-datatypes ((array!79079 0))(
  ( (array!79080 (arr!38166 (Array (_ BitVec 32) (_ BitVec 64))) (size!38702 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79079)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79079 (_ BitVec 32)) Bool)

(assert (=> b!1225258 (= res!814225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225259 () Bool)

(declare-fun res!814230 () Bool)

(assert (=> b!1225259 (=> (not res!814230) (not e!695905))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225259 (= res!814230 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38702 _keys!1208))))))

(declare-fun b!1225260 () Bool)

(declare-fun res!814232 () Bool)

(assert (=> b!1225260 (=> (not res!814232) (not e!695905))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225260 (= res!814232 (validKeyInArray!0 k0!934))))

(declare-fun b!1225261 () Bool)

(declare-fun e!695906 () Bool)

(assert (=> b!1225261 (= e!695905 e!695906)))

(declare-fun res!814237 () Bool)

(assert (=> b!1225261 (=> (not res!814237) (not e!695906))))

(declare-fun lt!558244 () array!79079)

(assert (=> b!1225261 (= res!814237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558244 mask!1564))))

(assert (=> b!1225261 (= lt!558244 (array!79080 (store (arr!38166 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38702 _keys!1208)))))

(declare-fun b!1225262 () Bool)

(declare-fun e!695900 () Bool)

(declare-fun e!695897 () Bool)

(assert (=> b!1225262 (= e!695900 e!695897)))

(declare-fun res!814231 () Bool)

(assert (=> b!1225262 (=> res!814231 e!695897)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225262 (= res!814231 (not (validKeyInArray!0 (select (arr!38166 _keys!1208) from!1455))))))

(declare-datatypes ((V!46659 0))(
  ( (V!46660 (val!15631 Int)) )
))
(declare-datatypes ((tuple2!20146 0))(
  ( (tuple2!20147 (_1!10084 (_ BitVec 64)) (_2!10084 V!46659)) )
))
(declare-datatypes ((List!26947 0))(
  ( (Nil!26944) (Cons!26943 (h!28152 tuple2!20146) (t!40372 List!26947)) )
))
(declare-datatypes ((ListLongMap!18115 0))(
  ( (ListLongMap!18116 (toList!9073 List!26947)) )
))
(declare-fun lt!558242 () ListLongMap!18115)

(declare-fun lt!558248 () ListLongMap!18115)

(assert (=> b!1225262 (= lt!558242 lt!558248)))

(declare-fun lt!558246 () ListLongMap!18115)

(declare-fun -!1972 (ListLongMap!18115 (_ BitVec 64)) ListLongMap!18115)

(assert (=> b!1225262 (= lt!558248 (-!1972 lt!558246 k0!934))))

(declare-fun zeroValue!944 () V!46659)

(declare-datatypes ((ValueCell!14865 0))(
  ( (ValueCellFull!14865 (v!18293 V!46659)) (EmptyCell!14865) )
))
(declare-datatypes ((array!79081 0))(
  ( (array!79082 (arr!38167 (Array (_ BitVec 32) ValueCell!14865)) (size!38703 (_ BitVec 32))) )
))
(declare-fun lt!558243 () array!79081)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46659)

(declare-fun getCurrentListMapNoExtraKeys!5492 (array!79079 array!79081 (_ BitVec 32) (_ BitVec 32) V!46659 V!46659 (_ BitVec 32) Int) ListLongMap!18115)

(assert (=> b!1225262 (= lt!558242 (getCurrentListMapNoExtraKeys!5492 lt!558244 lt!558243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!79081)

(assert (=> b!1225262 (= lt!558246 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40605 0))(
  ( (Unit!40606) )
))
(declare-fun lt!558231 () Unit!40605)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1178 (array!79079 array!79081 (_ BitVec 32) (_ BitVec 32) V!46659 V!46659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40605)

(assert (=> b!1225262 (= lt!558231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225263 () Bool)

(declare-fun e!695903 () Unit!40605)

(declare-fun Unit!40607 () Unit!40605)

(assert (=> b!1225263 (= e!695903 Unit!40607)))

(declare-fun lt!558241 () Unit!40605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79079 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40605)

(assert (=> b!1225263 (= lt!558241 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225263 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558245 () Unit!40605)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79079 (_ BitVec 32) (_ BitVec 32)) Unit!40605)

(assert (=> b!1225263 (= lt!558245 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26948 0))(
  ( (Nil!26945) (Cons!26944 (h!28153 (_ BitVec 64)) (t!40373 List!26948)) )
))
(declare-fun arrayNoDuplicates!0 (array!79079 (_ BitVec 32) List!26948) Bool)

(assert (=> b!1225263 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26945)))

(declare-fun lt!558232 () Unit!40605)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79079 (_ BitVec 64) (_ BitVec 32) List!26948) Unit!40605)

(assert (=> b!1225263 (= lt!558232 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26945))))

(assert (=> b!1225263 false))

(declare-fun b!1225264 () Bool)

(declare-fun e!695904 () Bool)

(declare-fun e!695901 () Bool)

(assert (=> b!1225264 (= e!695904 e!695901)))

(declare-fun res!814233 () Bool)

(assert (=> b!1225264 (=> res!814233 e!695901)))

(assert (=> b!1225264 (= res!814233 (not (= (select (arr!38166 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225265 () Bool)

(assert (=> b!1225265 (= e!695897 true)))

(declare-fun lt!558233 () ListLongMap!18115)

(declare-fun lt!558235 () ListLongMap!18115)

(assert (=> b!1225265 (= (-!1972 lt!558233 k0!934) lt!558235)))

(declare-fun lt!558230 () Unit!40605)

(declare-fun lt!558238 () V!46659)

(declare-fun addRemoveCommutativeForDiffKeys!215 (ListLongMap!18115 (_ BitVec 64) V!46659 (_ BitVec 64)) Unit!40605)

(assert (=> b!1225265 (= lt!558230 (addRemoveCommutativeForDiffKeys!215 lt!558246 (select (arr!38166 _keys!1208) from!1455) lt!558238 k0!934))))

(declare-fun lt!558237 () ListLongMap!18115)

(assert (=> b!1225265 (and (= lt!558237 lt!558233) (= lt!558248 lt!558242))))

(declare-fun lt!558247 () tuple2!20146)

(declare-fun +!4128 (ListLongMap!18115 tuple2!20146) ListLongMap!18115)

(assert (=> b!1225265 (= lt!558233 (+!4128 lt!558246 lt!558247))))

(assert (=> b!1225265 (not (= (select (arr!38166 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558239 () Unit!40605)

(assert (=> b!1225265 (= lt!558239 e!695903)))

(declare-fun c!120488 () Bool)

(assert (=> b!1225265 (= c!120488 (= (select (arr!38166 _keys!1208) from!1455) k0!934))))

(assert (=> b!1225265 e!695904))

(declare-fun res!814227 () Bool)

(assert (=> b!1225265 (=> (not res!814227) (not e!695904))))

(declare-fun lt!558240 () ListLongMap!18115)

(assert (=> b!1225265 (= res!814227 (= lt!558240 lt!558235))))

(assert (=> b!1225265 (= lt!558235 (+!4128 lt!558248 lt!558247))))

(assert (=> b!1225265 (= lt!558247 (tuple2!20147 (select (arr!38166 _keys!1208) from!1455) lt!558238))))

(declare-fun lt!558236 () V!46659)

(declare-fun get!19496 (ValueCell!14865 V!46659) V!46659)

(assert (=> b!1225265 (= lt!558238 (get!19496 (select (arr!38167 _values!996) from!1455) lt!558236))))

(declare-fun b!1225266 () Bool)

(declare-fun e!695902 () Bool)

(declare-fun mapRes!48622 () Bool)

(assert (=> b!1225266 (= e!695902 (and e!695898 mapRes!48622))))

(declare-fun condMapEmpty!48622 () Bool)

(declare-fun mapDefault!48622 () ValueCell!14865)

(assert (=> b!1225266 (= condMapEmpty!48622 (= (arr!38167 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14865)) mapDefault!48622)))))

(declare-fun b!1225267 () Bool)

(declare-fun e!695899 () Bool)

(assert (=> b!1225267 (= e!695906 (not e!695899))))

(declare-fun res!814236 () Bool)

(assert (=> b!1225267 (=> res!814236 e!695899)))

(assert (=> b!1225267 (= res!814236 (bvsgt from!1455 i!673))))

(assert (=> b!1225267 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558234 () Unit!40605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79079 (_ BitVec 64) (_ BitVec 32)) Unit!40605)

(assert (=> b!1225267 (= lt!558234 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225268 () Bool)

(declare-fun res!814234 () Bool)

(assert (=> b!1225268 (=> (not res!814234) (not e!695905))))

(assert (=> b!1225268 (= res!814234 (= (select (arr!38166 _keys!1208) i!673) k0!934))))

(declare-fun b!1225269 () Bool)

(declare-fun res!814229 () Bool)

(assert (=> b!1225269 (=> (not res!814229) (not e!695905))))

(assert (=> b!1225269 (= res!814229 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26945))))

(declare-fun res!814228 () Bool)

(assert (=> start!101756 (=> (not res!814228) (not e!695905))))

(assert (=> start!101756 (= res!814228 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38702 _keys!1208))))))

(assert (=> start!101756 e!695905))

(assert (=> start!101756 tp_is_empty!31149))

(declare-fun array_inv!29028 (array!79079) Bool)

(assert (=> start!101756 (array_inv!29028 _keys!1208)))

(assert (=> start!101756 true))

(assert (=> start!101756 tp!92380))

(declare-fun array_inv!29029 (array!79081) Bool)

(assert (=> start!101756 (and (array_inv!29029 _values!996) e!695902)))

(declare-fun b!1225270 () Bool)

(declare-fun Unit!40608 () Unit!40605)

(assert (=> b!1225270 (= e!695903 Unit!40608)))

(declare-fun b!1225271 () Bool)

(assert (=> b!1225271 (= e!695901 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48622 () Bool)

(declare-fun tp!92381 () Bool)

(declare-fun e!695907 () Bool)

(assert (=> mapNonEmpty!48622 (= mapRes!48622 (and tp!92381 e!695907))))

(declare-fun mapValue!48622 () ValueCell!14865)

(declare-fun mapKey!48622 () (_ BitVec 32))

(declare-fun mapRest!48622 () (Array (_ BitVec 32) ValueCell!14865))

(assert (=> mapNonEmpty!48622 (= (arr!38167 _values!996) (store mapRest!48622 mapKey!48622 mapValue!48622))))

(declare-fun b!1225272 () Bool)

(assert (=> b!1225272 (= e!695907 tp_is_empty!31149)))

(declare-fun b!1225273 () Bool)

(declare-fun res!814223 () Bool)

(assert (=> b!1225273 (=> (not res!814223) (not e!695906))))

(assert (=> b!1225273 (= res!814223 (arrayNoDuplicates!0 lt!558244 #b00000000000000000000000000000000 Nil!26945))))

(declare-fun b!1225274 () Bool)

(declare-fun res!814235 () Bool)

(assert (=> b!1225274 (=> (not res!814235) (not e!695905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225274 (= res!814235 (validMask!0 mask!1564))))

(declare-fun b!1225275 () Bool)

(declare-fun res!814224 () Bool)

(assert (=> b!1225275 (=> (not res!814224) (not e!695905))))

(assert (=> b!1225275 (= res!814224 (and (= (size!38703 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38702 _keys!1208) (size!38703 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225276 () Bool)

(assert (=> b!1225276 (= e!695899 e!695900)))

(declare-fun res!814226 () Bool)

(assert (=> b!1225276 (=> res!814226 e!695900)))

(assert (=> b!1225276 (= res!814226 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225276 (= lt!558240 (getCurrentListMapNoExtraKeys!5492 lt!558244 lt!558243 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225276 (= lt!558243 (array!79082 (store (arr!38167 _values!996) i!673 (ValueCellFull!14865 lt!558236)) (size!38703 _values!996)))))

(declare-fun dynLambda!3364 (Int (_ BitVec 64)) V!46659)

(assert (=> b!1225276 (= lt!558236 (dynLambda!3364 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1225276 (= lt!558237 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48622 () Bool)

(assert (=> mapIsEmpty!48622 mapRes!48622))

(assert (= (and start!101756 res!814228) b!1225274))

(assert (= (and b!1225274 res!814235) b!1225275))

(assert (= (and b!1225275 res!814224) b!1225258))

(assert (= (and b!1225258 res!814225) b!1225269))

(assert (= (and b!1225269 res!814229) b!1225259))

(assert (= (and b!1225259 res!814230) b!1225260))

(assert (= (and b!1225260 res!814232) b!1225268))

(assert (= (and b!1225268 res!814234) b!1225261))

(assert (= (and b!1225261 res!814237) b!1225273))

(assert (= (and b!1225273 res!814223) b!1225267))

(assert (= (and b!1225267 (not res!814236)) b!1225276))

(assert (= (and b!1225276 (not res!814226)) b!1225262))

(assert (= (and b!1225262 (not res!814231)) b!1225265))

(assert (= (and b!1225265 res!814227) b!1225264))

(assert (= (and b!1225264 (not res!814233)) b!1225271))

(assert (= (and b!1225265 c!120488) b!1225263))

(assert (= (and b!1225265 (not c!120488)) b!1225270))

(assert (= (and b!1225266 condMapEmpty!48622) mapIsEmpty!48622))

(assert (= (and b!1225266 (not condMapEmpty!48622)) mapNonEmpty!48622))

(get-info :version)

(assert (= (and mapNonEmpty!48622 ((_ is ValueCellFull!14865) mapValue!48622)) b!1225272))

(assert (= (and b!1225266 ((_ is ValueCellFull!14865) mapDefault!48622)) b!1225257))

(assert (= start!101756 b!1225266))

(declare-fun b_lambda!22425 () Bool)

(assert (=> (not b_lambda!22425) (not b!1225276)))

(declare-fun t!40371 () Bool)

(declare-fun tb!11245 () Bool)

(assert (=> (and start!101756 (= defaultEntry!1004 defaultEntry!1004) t!40371) tb!11245))

(declare-fun result!23103 () Bool)

(assert (=> tb!11245 (= result!23103 tp_is_empty!31149)))

(assert (=> b!1225276 t!40371))

(declare-fun b_and!44153 () Bool)

(assert (= b_and!44151 (and (=> t!40371 result!23103) b_and!44153)))

(declare-fun m!1130337 () Bool)

(assert (=> b!1225276 m!1130337))

(declare-fun m!1130339 () Bool)

(assert (=> b!1225276 m!1130339))

(declare-fun m!1130341 () Bool)

(assert (=> b!1225276 m!1130341))

(declare-fun m!1130343 () Bool)

(assert (=> b!1225276 m!1130343))

(declare-fun m!1130345 () Bool)

(assert (=> b!1225258 m!1130345))

(declare-fun m!1130347 () Bool)

(assert (=> b!1225264 m!1130347))

(declare-fun m!1130349 () Bool)

(assert (=> b!1225271 m!1130349))

(declare-fun m!1130351 () Bool)

(assert (=> b!1225263 m!1130351))

(declare-fun m!1130353 () Bool)

(assert (=> b!1225263 m!1130353))

(declare-fun m!1130355 () Bool)

(assert (=> b!1225263 m!1130355))

(declare-fun m!1130357 () Bool)

(assert (=> b!1225263 m!1130357))

(declare-fun m!1130359 () Bool)

(assert (=> b!1225263 m!1130359))

(declare-fun m!1130361 () Bool)

(assert (=> b!1225262 m!1130361))

(declare-fun m!1130363 () Bool)

(assert (=> b!1225262 m!1130363))

(assert (=> b!1225262 m!1130347))

(declare-fun m!1130365 () Bool)

(assert (=> b!1225262 m!1130365))

(assert (=> b!1225262 m!1130347))

(declare-fun m!1130367 () Bool)

(assert (=> b!1225262 m!1130367))

(declare-fun m!1130369 () Bool)

(assert (=> b!1225262 m!1130369))

(declare-fun m!1130371 () Bool)

(assert (=> b!1225261 m!1130371))

(declare-fun m!1130373 () Bool)

(assert (=> b!1225261 m!1130373))

(assert (=> b!1225265 m!1130347))

(declare-fun m!1130375 () Bool)

(assert (=> b!1225265 m!1130375))

(declare-fun m!1130377 () Bool)

(assert (=> b!1225265 m!1130377))

(declare-fun m!1130379 () Bool)

(assert (=> b!1225265 m!1130379))

(assert (=> b!1225265 m!1130347))

(declare-fun m!1130381 () Bool)

(assert (=> b!1225265 m!1130381))

(declare-fun m!1130383 () Bool)

(assert (=> b!1225265 m!1130383))

(assert (=> b!1225265 m!1130381))

(declare-fun m!1130385 () Bool)

(assert (=> b!1225265 m!1130385))

(declare-fun m!1130387 () Bool)

(assert (=> b!1225269 m!1130387))

(declare-fun m!1130389 () Bool)

(assert (=> b!1225268 m!1130389))

(declare-fun m!1130391 () Bool)

(assert (=> b!1225267 m!1130391))

(declare-fun m!1130393 () Bool)

(assert (=> b!1225267 m!1130393))

(declare-fun m!1130395 () Bool)

(assert (=> b!1225274 m!1130395))

(declare-fun m!1130397 () Bool)

(assert (=> b!1225260 m!1130397))

(declare-fun m!1130399 () Bool)

(assert (=> b!1225273 m!1130399))

(declare-fun m!1130401 () Bool)

(assert (=> start!101756 m!1130401))

(declare-fun m!1130403 () Bool)

(assert (=> start!101756 m!1130403))

(declare-fun m!1130405 () Bool)

(assert (=> mapNonEmpty!48622 m!1130405))

(check-sat (not b!1225269) (not b!1225273) (not b!1225263) (not b_lambda!22425) (not b_next!26445) (not b!1225261) (not b!1225267) (not b!1225265) (not b!1225271) (not start!101756) (not b!1225258) (not b!1225274) (not b!1225276) tp_is_empty!31149 b_and!44153 (not mapNonEmpty!48622) (not b!1225262) (not b!1225260))
(check-sat b_and!44153 (not b_next!26445))
