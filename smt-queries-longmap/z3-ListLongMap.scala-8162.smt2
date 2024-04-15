; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99832 () Bool)

(assert start!99832)

(declare-fun b_free!25417 () Bool)

(declare-fun b_next!25417 () Bool)

(assert (=> start!99832 (= b_free!25417 (not b_next!25417))))

(declare-fun tp!88965 () Bool)

(declare-fun b_and!41679 () Bool)

(assert (=> start!99832 (= tp!88965 b_and!41679)))

(declare-fun b!1187089 () Bool)

(declare-fun e!674957 () Bool)

(declare-fun e!674963 () Bool)

(assert (=> b!1187089 (= e!674957 e!674963)))

(declare-fun res!789230 () Bool)

(assert (=> b!1187089 (=> (not res!789230) (not e!674963))))

(declare-datatypes ((array!76628 0))(
  ( (array!76629 (arr!36964 (Array (_ BitVec 32) (_ BitVec 64))) (size!37502 (_ BitVec 32))) )
))
(declare-fun lt!539448 () array!76628)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76628 (_ BitVec 32)) Bool)

(assert (=> b!1187089 (= res!789230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539448 mask!1564))))

(declare-fun _keys!1208 () array!76628)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187089 (= lt!539448 (array!76629 (store (arr!36964 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37502 _keys!1208)))))

(declare-fun b!1187090 () Bool)

(declare-fun res!789219 () Bool)

(assert (=> b!1187090 (=> (not res!789219) (not e!674957))))

(declare-datatypes ((List!26120 0))(
  ( (Nil!26117) (Cons!26116 (h!27325 (_ BitVec 64)) (t!38520 List!26120)) )
))
(declare-fun arrayNoDuplicates!0 (array!76628 (_ BitVec 32) List!26120) Bool)

(assert (=> b!1187090 (= res!789219 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26117))))

(declare-fun b!1187091 () Bool)

(declare-datatypes ((Unit!39236 0))(
  ( (Unit!39237) )
))
(declare-fun e!674959 () Unit!39236)

(declare-fun Unit!39238 () Unit!39236)

(assert (=> b!1187091 (= e!674959 Unit!39238)))

(declare-fun lt!539457 () Unit!39236)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39236)

(assert (=> b!1187091 (= lt!539457 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539452 () Unit!39236)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76628 (_ BitVec 32) (_ BitVec 32)) Unit!39236)

(assert (=> b!1187091 (= lt!539452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187091 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26117)))

(declare-fun lt!539463 () Unit!39236)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76628 (_ BitVec 64) (_ BitVec 32) List!26120) Unit!39236)

(assert (=> b!1187091 (= lt!539463 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26117))))

(assert (=> b!1187091 false))

(declare-fun b!1187092 () Bool)

(declare-fun Unit!39239 () Unit!39236)

(assert (=> b!1187092 (= e!674959 Unit!39239)))

(declare-fun b!1187093 () Bool)

(declare-fun res!789228 () Bool)

(assert (=> b!1187093 (=> (not res!789228) (not e!674957))))

(assert (=> b!1187093 (= res!789228 (= (select (arr!36964 _keys!1208) i!673) k0!934))))

(declare-fun b!1187094 () Bool)

(declare-fun res!789224 () Bool)

(assert (=> b!1187094 (=> (not res!789224) (not e!674957))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45057 0))(
  ( (V!45058 (val!15030 Int)) )
))
(declare-datatypes ((ValueCell!14264 0))(
  ( (ValueCellFull!14264 (v!17667 V!45057)) (EmptyCell!14264) )
))
(declare-datatypes ((array!76630 0))(
  ( (array!76631 (arr!36965 (Array (_ BitVec 32) ValueCell!14264)) (size!37503 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76630)

(assert (=> b!1187094 (= res!789224 (and (= (size!37503 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37502 _keys!1208) (size!37503 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187095 () Bool)

(declare-fun res!789221 () Bool)

(assert (=> b!1187095 (=> (not res!789221) (not e!674957))))

(assert (=> b!1187095 (= res!789221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46748 () Bool)

(declare-fun mapRes!46748 () Bool)

(assert (=> mapIsEmpty!46748 mapRes!46748))

(declare-fun b!1187096 () Bool)

(declare-fun res!789227 () Bool)

(assert (=> b!1187096 (=> (not res!789227) (not e!674957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187096 (= res!789227 (validMask!0 mask!1564))))

(declare-fun res!789226 () Bool)

(assert (=> start!99832 (=> (not res!789226) (not e!674957))))

(assert (=> start!99832 (= res!789226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37502 _keys!1208))))))

(assert (=> start!99832 e!674957))

(declare-fun tp_is_empty!29947 () Bool)

(assert (=> start!99832 tp_is_empty!29947))

(declare-fun array_inv!28316 (array!76628) Bool)

(assert (=> start!99832 (array_inv!28316 _keys!1208)))

(assert (=> start!99832 true))

(assert (=> start!99832 tp!88965))

(declare-fun e!674964 () Bool)

(declare-fun array_inv!28317 (array!76630) Bool)

(assert (=> start!99832 (and (array_inv!28317 _values!996) e!674964)))

(declare-fun b!1187097 () Bool)

(declare-fun e!674965 () Bool)

(declare-fun e!674967 () Bool)

(assert (=> b!1187097 (= e!674965 e!674967)))

(declare-fun res!789223 () Bool)

(assert (=> b!1187097 (=> res!789223 e!674967)))

(assert (=> b!1187097 (= res!789223 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45057)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45057)

(declare-datatypes ((tuple2!19408 0))(
  ( (tuple2!19409 (_1!9715 (_ BitVec 64)) (_2!9715 V!45057)) )
))
(declare-datatypes ((List!26121 0))(
  ( (Nil!26118) (Cons!26117 (h!27326 tuple2!19408) (t!38521 List!26121)) )
))
(declare-datatypes ((ListLongMap!17377 0))(
  ( (ListLongMap!17378 (toList!8704 List!26121)) )
))
(declare-fun lt!539450 () ListLongMap!17377)

(declare-fun lt!539446 () array!76630)

(declare-fun getCurrentListMapNoExtraKeys!5154 (array!76628 array!76630 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) Int) ListLongMap!17377)

(assert (=> b!1187097 (= lt!539450 (getCurrentListMapNoExtraKeys!5154 lt!539448 lt!539446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539453 () V!45057)

(assert (=> b!1187097 (= lt!539446 (array!76631 (store (arr!36965 _values!996) i!673 (ValueCellFull!14264 lt!539453)) (size!37503 _values!996)))))

(declare-fun dynLambda!3053 (Int (_ BitVec 64)) V!45057)

(assert (=> b!1187097 (= lt!539453 (dynLambda!3053 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539461 () ListLongMap!17377)

(assert (=> b!1187097 (= lt!539461 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187098 () Bool)

(declare-fun e!674968 () Bool)

(assert (=> b!1187098 (= e!674967 e!674968)))

(declare-fun res!789225 () Bool)

(assert (=> b!1187098 (=> res!789225 e!674968)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187098 (= res!789225 (not (validKeyInArray!0 (select (arr!36964 _keys!1208) from!1455))))))

(declare-fun lt!539451 () ListLongMap!17377)

(declare-fun lt!539460 () ListLongMap!17377)

(assert (=> b!1187098 (= lt!539451 lt!539460)))

(declare-fun lt!539456 () ListLongMap!17377)

(declare-fun -!1654 (ListLongMap!17377 (_ BitVec 64)) ListLongMap!17377)

(assert (=> b!1187098 (= lt!539460 (-!1654 lt!539456 k0!934))))

(assert (=> b!1187098 (= lt!539451 (getCurrentListMapNoExtraKeys!5154 lt!539448 lt!539446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187098 (= lt!539456 (getCurrentListMapNoExtraKeys!5154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539459 () Unit!39236)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 (array!76628 array!76630 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39236)

(assert (=> b!1187098 (= lt!539459 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187099 () Bool)

(declare-fun e!674958 () Bool)

(assert (=> b!1187099 (= e!674964 (and e!674958 mapRes!46748))))

(declare-fun condMapEmpty!46748 () Bool)

(declare-fun mapDefault!46748 () ValueCell!14264)

(assert (=> b!1187099 (= condMapEmpty!46748 (= (arr!36965 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14264)) mapDefault!46748)))))

(declare-fun b!1187100 () Bool)

(declare-fun res!789222 () Bool)

(assert (=> b!1187100 (=> (not res!789222) (not e!674963))))

(assert (=> b!1187100 (= res!789222 (arrayNoDuplicates!0 lt!539448 #b00000000000000000000000000000000 Nil!26117))))

(declare-fun b!1187101 () Bool)

(assert (=> b!1187101 (= e!674958 tp_is_empty!29947)))

(declare-fun b!1187102 () Bool)

(assert (=> b!1187102 (= e!674963 (not e!674965))))

(declare-fun res!789231 () Bool)

(assert (=> b!1187102 (=> res!789231 e!674965)))

(assert (=> b!1187102 (= res!789231 (bvsgt from!1455 i!673))))

(assert (=> b!1187102 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539454 () Unit!39236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76628 (_ BitVec 64) (_ BitVec 32)) Unit!39236)

(assert (=> b!1187102 (= lt!539454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187103 () Bool)

(assert (=> b!1187103 (= e!674968 true)))

(declare-fun lt!539449 () ListLongMap!17377)

(declare-fun lt!539447 () ListLongMap!17377)

(assert (=> b!1187103 (= (-!1654 lt!539449 k0!934) lt!539447)))

(declare-fun lt!539455 () V!45057)

(declare-fun lt!539445 () Unit!39236)

(declare-fun addRemoveCommutativeForDiffKeys!197 (ListLongMap!17377 (_ BitVec 64) V!45057 (_ BitVec 64)) Unit!39236)

(assert (=> b!1187103 (= lt!539445 (addRemoveCommutativeForDiffKeys!197 lt!539456 (select (arr!36964 _keys!1208) from!1455) lt!539455 k0!934))))

(assert (=> b!1187103 (and (= lt!539461 lt!539449) (= lt!539460 lt!539451))))

(declare-fun lt!539458 () tuple2!19408)

(declare-fun +!3983 (ListLongMap!17377 tuple2!19408) ListLongMap!17377)

(assert (=> b!1187103 (= lt!539449 (+!3983 lt!539456 lt!539458))))

(assert (=> b!1187103 (not (= (select (arr!36964 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539462 () Unit!39236)

(assert (=> b!1187103 (= lt!539462 e!674959)))

(declare-fun c!117223 () Bool)

(assert (=> b!1187103 (= c!117223 (= (select (arr!36964 _keys!1208) from!1455) k0!934))))

(declare-fun e!674961 () Bool)

(assert (=> b!1187103 e!674961))

(declare-fun res!789232 () Bool)

(assert (=> b!1187103 (=> (not res!789232) (not e!674961))))

(assert (=> b!1187103 (= res!789232 (= lt!539450 lt!539447))))

(assert (=> b!1187103 (= lt!539447 (+!3983 lt!539460 lt!539458))))

(assert (=> b!1187103 (= lt!539458 (tuple2!19409 (select (arr!36964 _keys!1208) from!1455) lt!539455))))

(declare-fun get!18944 (ValueCell!14264 V!45057) V!45057)

(assert (=> b!1187103 (= lt!539455 (get!18944 (select (arr!36965 _values!996) from!1455) lt!539453))))

(declare-fun b!1187104 () Bool)

(declare-fun e!674960 () Bool)

(assert (=> b!1187104 (= e!674960 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187105 () Bool)

(declare-fun res!789218 () Bool)

(assert (=> b!1187105 (=> (not res!789218) (not e!674957))))

(assert (=> b!1187105 (= res!789218 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46748 () Bool)

(declare-fun tp!88964 () Bool)

(declare-fun e!674966 () Bool)

(assert (=> mapNonEmpty!46748 (= mapRes!46748 (and tp!88964 e!674966))))

(declare-fun mapValue!46748 () ValueCell!14264)

(declare-fun mapRest!46748 () (Array (_ BitVec 32) ValueCell!14264))

(declare-fun mapKey!46748 () (_ BitVec 32))

(assert (=> mapNonEmpty!46748 (= (arr!36965 _values!996) (store mapRest!46748 mapKey!46748 mapValue!46748))))

(declare-fun b!1187106 () Bool)

(declare-fun res!789220 () Bool)

(assert (=> b!1187106 (=> (not res!789220) (not e!674957))))

(assert (=> b!1187106 (= res!789220 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37502 _keys!1208))))))

(declare-fun b!1187107 () Bool)

(assert (=> b!1187107 (= e!674966 tp_is_empty!29947)))

(declare-fun b!1187108 () Bool)

(assert (=> b!1187108 (= e!674961 e!674960)))

(declare-fun res!789229 () Bool)

(assert (=> b!1187108 (=> res!789229 e!674960)))

(assert (=> b!1187108 (= res!789229 (not (= (select (arr!36964 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99832 res!789226) b!1187096))

(assert (= (and b!1187096 res!789227) b!1187094))

(assert (= (and b!1187094 res!789224) b!1187095))

(assert (= (and b!1187095 res!789221) b!1187090))

(assert (= (and b!1187090 res!789219) b!1187106))

(assert (= (and b!1187106 res!789220) b!1187105))

(assert (= (and b!1187105 res!789218) b!1187093))

(assert (= (and b!1187093 res!789228) b!1187089))

(assert (= (and b!1187089 res!789230) b!1187100))

(assert (= (and b!1187100 res!789222) b!1187102))

(assert (= (and b!1187102 (not res!789231)) b!1187097))

(assert (= (and b!1187097 (not res!789223)) b!1187098))

(assert (= (and b!1187098 (not res!789225)) b!1187103))

(assert (= (and b!1187103 res!789232) b!1187108))

(assert (= (and b!1187108 (not res!789229)) b!1187104))

(assert (= (and b!1187103 c!117223) b!1187091))

(assert (= (and b!1187103 (not c!117223)) b!1187092))

(assert (= (and b!1187099 condMapEmpty!46748) mapIsEmpty!46748))

(assert (= (and b!1187099 (not condMapEmpty!46748)) mapNonEmpty!46748))

(get-info :version)

(assert (= (and mapNonEmpty!46748 ((_ is ValueCellFull!14264) mapValue!46748)) b!1187107))

(assert (= (and b!1187099 ((_ is ValueCellFull!14264) mapDefault!46748)) b!1187101))

(assert (= start!99832 b!1187099))

(declare-fun b_lambda!20543 () Bool)

(assert (=> (not b_lambda!20543) (not b!1187097)))

(declare-fun t!38519 () Bool)

(declare-fun tb!10221 () Bool)

(assert (=> (and start!99832 (= defaultEntry!1004 defaultEntry!1004) t!38519) tb!10221))

(declare-fun result!21017 () Bool)

(assert (=> tb!10221 (= result!21017 tp_is_empty!29947)))

(assert (=> b!1187097 t!38519))

(declare-fun b_and!41681 () Bool)

(assert (= b_and!41679 (and (=> t!38519 result!21017) b_and!41681)))

(declare-fun m!1095245 () Bool)

(assert (=> start!99832 m!1095245))

(declare-fun m!1095247 () Bool)

(assert (=> start!99832 m!1095247))

(declare-fun m!1095249 () Bool)

(assert (=> b!1187093 m!1095249))

(declare-fun m!1095251 () Bool)

(assert (=> b!1187098 m!1095251))

(declare-fun m!1095253 () Bool)

(assert (=> b!1187098 m!1095253))

(declare-fun m!1095255 () Bool)

(assert (=> b!1187098 m!1095255))

(declare-fun m!1095257 () Bool)

(assert (=> b!1187098 m!1095257))

(declare-fun m!1095259 () Bool)

(assert (=> b!1187098 m!1095259))

(declare-fun m!1095261 () Bool)

(assert (=> b!1187098 m!1095261))

(assert (=> b!1187098 m!1095259))

(declare-fun m!1095263 () Bool)

(assert (=> b!1187100 m!1095263))

(declare-fun m!1095265 () Bool)

(assert (=> b!1187102 m!1095265))

(declare-fun m!1095267 () Bool)

(assert (=> b!1187102 m!1095267))

(declare-fun m!1095269 () Bool)

(assert (=> b!1187097 m!1095269))

(declare-fun m!1095271 () Bool)

(assert (=> b!1187097 m!1095271))

(declare-fun m!1095273 () Bool)

(assert (=> b!1187097 m!1095273))

(declare-fun m!1095275 () Bool)

(assert (=> b!1187097 m!1095275))

(declare-fun m!1095277 () Bool)

(assert (=> b!1187091 m!1095277))

(declare-fun m!1095279 () Bool)

(assert (=> b!1187091 m!1095279))

(declare-fun m!1095281 () Bool)

(assert (=> b!1187091 m!1095281))

(declare-fun m!1095283 () Bool)

(assert (=> b!1187091 m!1095283))

(declare-fun m!1095285 () Bool)

(assert (=> b!1187091 m!1095285))

(declare-fun m!1095287 () Bool)

(assert (=> b!1187103 m!1095287))

(declare-fun m!1095289 () Bool)

(assert (=> b!1187103 m!1095289))

(declare-fun m!1095291 () Bool)

(assert (=> b!1187103 m!1095291))

(assert (=> b!1187103 m!1095289))

(declare-fun m!1095293 () Bool)

(assert (=> b!1187103 m!1095293))

(assert (=> b!1187103 m!1095259))

(declare-fun m!1095295 () Bool)

(assert (=> b!1187103 m!1095295))

(assert (=> b!1187103 m!1095259))

(declare-fun m!1095297 () Bool)

(assert (=> b!1187103 m!1095297))

(declare-fun m!1095299 () Bool)

(assert (=> b!1187095 m!1095299))

(assert (=> b!1187108 m!1095259))

(declare-fun m!1095301 () Bool)

(assert (=> b!1187105 m!1095301))

(declare-fun m!1095303 () Bool)

(assert (=> mapNonEmpty!46748 m!1095303))

(declare-fun m!1095305 () Bool)

(assert (=> b!1187089 m!1095305))

(declare-fun m!1095307 () Bool)

(assert (=> b!1187089 m!1095307))

(declare-fun m!1095309 () Bool)

(assert (=> b!1187104 m!1095309))

(declare-fun m!1095311 () Bool)

(assert (=> b!1187090 m!1095311))

(declare-fun m!1095313 () Bool)

(assert (=> b!1187096 m!1095313))

(check-sat (not b_lambda!20543) b_and!41681 (not b!1187091) (not b!1187097) (not b!1187090) (not b!1187089) (not b!1187100) (not b!1187104) (not b!1187103) (not start!99832) (not b!1187095) (not mapNonEmpty!46748) (not b!1187102) (not b!1187105) (not b!1187096) (not b_next!25417) (not b!1187098) tp_is_empty!29947)
(check-sat b_and!41681 (not b_next!25417))
