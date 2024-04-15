; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99364 () Bool)

(assert start!99364)

(declare-fun b_free!24949 () Bool)

(declare-fun b_next!24949 () Bool)

(assert (=> start!99364 (= b_free!24949 (not b_next!24949))))

(declare-fun tp!87561 () Bool)

(declare-fun b_and!40743 () Bool)

(assert (=> start!99364 (= tp!87561 b_and!40743)))

(declare-fun res!778298 () Bool)

(declare-fun e!666276 () Bool)

(assert (=> start!99364 (=> (not res!778298) (not e!666276))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75700 0))(
  ( (array!75701 (arr!36500 (Array (_ BitVec 32) (_ BitVec 64))) (size!37038 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75700)

(assert (=> start!99364 (= res!778298 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37038 _keys!1208))))))

(assert (=> start!99364 e!666276))

(declare-fun tp_is_empty!29479 () Bool)

(assert (=> start!99364 tp_is_empty!29479))

(declare-fun array_inv!27994 (array!75700) Bool)

(assert (=> start!99364 (array_inv!27994 _keys!1208)))

(assert (=> start!99364 true))

(assert (=> start!99364 tp!87561))

(declare-datatypes ((V!44433 0))(
  ( (V!44434 (val!14796 Int)) )
))
(declare-datatypes ((ValueCell!14030 0))(
  ( (ValueCellFull!14030 (v!17433 V!44433)) (EmptyCell!14030) )
))
(declare-datatypes ((array!75702 0))(
  ( (array!75703 (arr!36501 (Array (_ BitVec 32) ValueCell!14030)) (size!37039 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75702)

(declare-fun e!666269 () Bool)

(declare-fun array_inv!27995 (array!75702) Bool)

(assert (=> start!99364 (and (array_inv!27995 _values!996) e!666269)))

(declare-fun b!1172207 () Bool)

(declare-fun e!666277 () Bool)

(declare-fun mapRes!46046 () Bool)

(assert (=> b!1172207 (= e!666269 (and e!666277 mapRes!46046))))

(declare-fun condMapEmpty!46046 () Bool)

(declare-fun mapDefault!46046 () ValueCell!14030)

(assert (=> b!1172207 (= condMapEmpty!46046 (= (arr!36501 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14030)) mapDefault!46046)))))

(declare-fun b!1172208 () Bool)

(declare-fun e!666268 () Bool)

(declare-fun e!666266 () Bool)

(assert (=> b!1172208 (= e!666268 e!666266)))

(declare-fun res!778290 () Bool)

(assert (=> b!1172208 (=> res!778290 e!666266)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172208 (= res!778290 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528031 () array!75700)

(declare-fun lt!528026 () array!75702)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18992 0))(
  ( (tuple2!18993 (_1!9507 (_ BitVec 64)) (_2!9507 V!44433)) )
))
(declare-datatypes ((List!25708 0))(
  ( (Nil!25705) (Cons!25704 (h!26913 tuple2!18992) (t!37640 List!25708)) )
))
(declare-datatypes ((ListLongMap!16961 0))(
  ( (ListLongMap!16962 (toList!8496 List!25708)) )
))
(declare-fun lt!528029 () ListLongMap!16961)

(declare-fun minValue!944 () V!44433)

(declare-fun getCurrentListMapNoExtraKeys!4970 (array!75700 array!75702 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) Int) ListLongMap!16961)

(assert (=> b!1172208 (= lt!528029 (getCurrentListMapNoExtraKeys!4970 lt!528031 lt!528026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528022 () V!44433)

(assert (=> b!1172208 (= lt!528026 (array!75703 (store (arr!36501 _values!996) i!673 (ValueCellFull!14030 lt!528022)) (size!37039 _values!996)))))

(declare-fun dynLambda!2895 (Int (_ BitVec 64)) V!44433)

(assert (=> b!1172208 (= lt!528022 (dynLambda!2895 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528027 () ListLongMap!16961)

(assert (=> b!1172208 (= lt!528027 (getCurrentListMapNoExtraKeys!4970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172209 () Bool)

(declare-fun res!778297 () Bool)

(declare-fun e!666271 () Bool)

(assert (=> b!1172209 (=> res!778297 e!666271)))

(declare-datatypes ((List!25709 0))(
  ( (Nil!25706) (Cons!25705 (h!26914 (_ BitVec 64)) (t!37641 List!25709)) )
))
(declare-fun contains!6836 (List!25709 (_ BitVec 64)) Bool)

(assert (=> b!1172209 (= res!778297 (contains!6836 Nil!25706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172210 () Bool)

(declare-fun res!778283 () Bool)

(assert (=> b!1172210 (=> (not res!778283) (not e!666276))))

(assert (=> b!1172210 (= res!778283 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37038 _keys!1208))))))

(declare-fun mapIsEmpty!46046 () Bool)

(assert (=> mapIsEmpty!46046 mapRes!46046))

(declare-fun b!1172211 () Bool)

(declare-fun res!778286 () Bool)

(assert (=> b!1172211 (=> (not res!778286) (not e!666276))))

(assert (=> b!1172211 (= res!778286 (and (= (size!37039 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37038 _keys!1208) (size!37039 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172212 () Bool)

(assert (=> b!1172212 (= e!666271 true)))

(declare-fun lt!528023 () Bool)

(assert (=> b!1172212 (= lt!528023 (contains!6836 Nil!25706 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172213 () Bool)

(declare-fun e!666267 () Bool)

(declare-fun e!666270 () Bool)

(assert (=> b!1172213 (= e!666267 e!666270)))

(declare-fun res!778288 () Bool)

(assert (=> b!1172213 (=> res!778288 e!666270)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1172213 (= res!778288 (not (= (select (arr!36500 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666272 () Bool)

(assert (=> b!1172213 e!666272))

(declare-fun res!778293 () Bool)

(assert (=> b!1172213 (=> (not res!778293) (not e!666272))))

(declare-fun lt!528033 () ListLongMap!16961)

(declare-fun +!3813 (ListLongMap!16961 tuple2!18992) ListLongMap!16961)

(declare-fun get!18629 (ValueCell!14030 V!44433) V!44433)

(assert (=> b!1172213 (= res!778293 (= lt!528029 (+!3813 lt!528033 (tuple2!18993 (select (arr!36500 _keys!1208) from!1455) (get!18629 (select (arr!36501 _values!996) from!1455) lt!528022)))))))

(declare-fun b!1172214 () Bool)

(declare-fun res!778296 () Bool)

(assert (=> b!1172214 (=> res!778296 e!666271)))

(declare-fun noDuplicate!1632 (List!25709) Bool)

(assert (=> b!1172214 (= res!778296 (not (noDuplicate!1632 Nil!25706)))))

(declare-fun b!1172215 () Bool)

(assert (=> b!1172215 (= e!666266 e!666267)))

(declare-fun res!778291 () Bool)

(assert (=> b!1172215 (=> res!778291 e!666267)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172215 (= res!778291 (not (validKeyInArray!0 (select (arr!36500 _keys!1208) from!1455))))))

(declare-fun lt!528028 () ListLongMap!16961)

(assert (=> b!1172215 (= lt!528028 lt!528033)))

(declare-fun lt!528024 () ListLongMap!16961)

(declare-fun -!1489 (ListLongMap!16961 (_ BitVec 64)) ListLongMap!16961)

(assert (=> b!1172215 (= lt!528033 (-!1489 lt!528024 k0!934))))

(assert (=> b!1172215 (= lt!528028 (getCurrentListMapNoExtraKeys!4970 lt!528031 lt!528026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172215 (= lt!528024 (getCurrentListMapNoExtraKeys!4970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38475 0))(
  ( (Unit!38476) )
))
(declare-fun lt!528032 () Unit!38475)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 (array!75700 array!75702 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38475)

(assert (=> b!1172215 (= lt!528032 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172216 () Bool)

(declare-fun e!666273 () Bool)

(assert (=> b!1172216 (= e!666273 tp_is_empty!29479)))

(declare-fun b!1172217 () Bool)

(declare-fun res!778294 () Bool)

(assert (=> b!1172217 (=> (not res!778294) (not e!666276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172217 (= res!778294 (validMask!0 mask!1564))))

(declare-fun b!1172218 () Bool)

(declare-fun e!666265 () Bool)

(assert (=> b!1172218 (= e!666276 e!666265)))

(declare-fun res!778282 () Bool)

(assert (=> b!1172218 (=> (not res!778282) (not e!666265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75700 (_ BitVec 32)) Bool)

(assert (=> b!1172218 (= res!778282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528031 mask!1564))))

(assert (=> b!1172218 (= lt!528031 (array!75701 (store (arr!36500 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37038 _keys!1208)))))

(declare-fun b!1172219 () Bool)

(declare-fun res!778285 () Bool)

(assert (=> b!1172219 (=> (not res!778285) (not e!666276))))

(assert (=> b!1172219 (= res!778285 (= (select (arr!36500 _keys!1208) i!673) k0!934))))

(declare-fun b!1172220 () Bool)

(declare-fun res!778287 () Bool)

(assert (=> b!1172220 (=> (not res!778287) (not e!666276))))

(declare-fun arrayNoDuplicates!0 (array!75700 (_ BitVec 32) List!25709) Bool)

(assert (=> b!1172220 (= res!778287 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25706))))

(declare-fun b!1172221 () Bool)

(assert (=> b!1172221 (= e!666265 (not e!666268))))

(declare-fun res!778284 () Bool)

(assert (=> b!1172221 (=> res!778284 e!666268)))

(assert (=> b!1172221 (= res!778284 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172221 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528021 () Unit!38475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75700 (_ BitVec 64) (_ BitVec 32)) Unit!38475)

(assert (=> b!1172221 (= lt!528021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172222 () Bool)

(assert (=> b!1172222 (= e!666277 tp_is_empty!29479)))

(declare-fun b!1172223 () Bool)

(declare-fun res!778289 () Bool)

(assert (=> b!1172223 (=> (not res!778289) (not e!666276))))

(assert (=> b!1172223 (= res!778289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172224 () Bool)

(declare-fun res!778292 () Bool)

(assert (=> b!1172224 (=> (not res!778292) (not e!666276))))

(assert (=> b!1172224 (= res!778292 (validKeyInArray!0 k0!934))))

(declare-fun b!1172225 () Bool)

(declare-fun e!666274 () Bool)

(assert (=> b!1172225 (= e!666274 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172226 () Bool)

(declare-fun res!778300 () Bool)

(assert (=> b!1172226 (=> (not res!778300) (not e!666265))))

(assert (=> b!1172226 (= res!778300 (arrayNoDuplicates!0 lt!528031 #b00000000000000000000000000000000 Nil!25706))))

(declare-fun b!1172227 () Bool)

(assert (=> b!1172227 (= e!666270 e!666271)))

(declare-fun res!778299 () Bool)

(assert (=> b!1172227 (=> res!778299 e!666271)))

(assert (=> b!1172227 (= res!778299 (or (bvsge (size!37038 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37038 _keys!1208)) (bvsge from!1455 (size!37038 _keys!1208))))))

(assert (=> b!1172227 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25706)))

(declare-fun lt!528030 () Unit!38475)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75700 (_ BitVec 32) (_ BitVec 32)) Unit!38475)

(assert (=> b!1172227 (= lt!528030 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172227 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528025 () Unit!38475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38475)

(assert (=> b!1172227 (= lt!528025 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172228 () Bool)

(assert (=> b!1172228 (= e!666272 e!666274)))

(declare-fun res!778295 () Bool)

(assert (=> b!1172228 (=> res!778295 e!666274)))

(assert (=> b!1172228 (= res!778295 (not (= (select (arr!36500 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46046 () Bool)

(declare-fun tp!87560 () Bool)

(assert (=> mapNonEmpty!46046 (= mapRes!46046 (and tp!87560 e!666273))))

(declare-fun mapRest!46046 () (Array (_ BitVec 32) ValueCell!14030))

(declare-fun mapValue!46046 () ValueCell!14030)

(declare-fun mapKey!46046 () (_ BitVec 32))

(assert (=> mapNonEmpty!46046 (= (arr!36501 _values!996) (store mapRest!46046 mapKey!46046 mapValue!46046))))

(assert (= (and start!99364 res!778298) b!1172217))

(assert (= (and b!1172217 res!778294) b!1172211))

(assert (= (and b!1172211 res!778286) b!1172223))

(assert (= (and b!1172223 res!778289) b!1172220))

(assert (= (and b!1172220 res!778287) b!1172210))

(assert (= (and b!1172210 res!778283) b!1172224))

(assert (= (and b!1172224 res!778292) b!1172219))

(assert (= (and b!1172219 res!778285) b!1172218))

(assert (= (and b!1172218 res!778282) b!1172226))

(assert (= (and b!1172226 res!778300) b!1172221))

(assert (= (and b!1172221 (not res!778284)) b!1172208))

(assert (= (and b!1172208 (not res!778290)) b!1172215))

(assert (= (and b!1172215 (not res!778291)) b!1172213))

(assert (= (and b!1172213 res!778293) b!1172228))

(assert (= (and b!1172228 (not res!778295)) b!1172225))

(assert (= (and b!1172213 (not res!778288)) b!1172227))

(assert (= (and b!1172227 (not res!778299)) b!1172214))

(assert (= (and b!1172214 (not res!778296)) b!1172209))

(assert (= (and b!1172209 (not res!778297)) b!1172212))

(assert (= (and b!1172207 condMapEmpty!46046) mapIsEmpty!46046))

(assert (= (and b!1172207 (not condMapEmpty!46046)) mapNonEmpty!46046))

(get-info :version)

(assert (= (and mapNonEmpty!46046 ((_ is ValueCellFull!14030) mapValue!46046)) b!1172216))

(assert (= (and b!1172207 ((_ is ValueCellFull!14030) mapDefault!46046)) b!1172222))

(assert (= start!99364 b!1172207))

(declare-fun b_lambda!20075 () Bool)

(assert (=> (not b_lambda!20075) (not b!1172208)))

(declare-fun t!37639 () Bool)

(declare-fun tb!9753 () Bool)

(assert (=> (and start!99364 (= defaultEntry!1004 defaultEntry!1004) t!37639) tb!9753))

(declare-fun result!20081 () Bool)

(assert (=> tb!9753 (= result!20081 tp_is_empty!29479)))

(assert (=> b!1172208 t!37639))

(declare-fun b_and!40745 () Bool)

(assert (= b_and!40743 (and (=> t!37639 result!20081) b_and!40745)))

(declare-fun m!1079537 () Bool)

(assert (=> b!1172228 m!1079537))

(declare-fun m!1079539 () Bool)

(assert (=> b!1172227 m!1079539))

(declare-fun m!1079541 () Bool)

(assert (=> b!1172227 m!1079541))

(declare-fun m!1079543 () Bool)

(assert (=> b!1172227 m!1079543))

(declare-fun m!1079545 () Bool)

(assert (=> b!1172227 m!1079545))

(declare-fun m!1079547 () Bool)

(assert (=> mapNonEmpty!46046 m!1079547))

(declare-fun m!1079549 () Bool)

(assert (=> b!1172218 m!1079549))

(declare-fun m!1079551 () Bool)

(assert (=> b!1172218 m!1079551))

(declare-fun m!1079553 () Bool)

(assert (=> start!99364 m!1079553))

(declare-fun m!1079555 () Bool)

(assert (=> start!99364 m!1079555))

(declare-fun m!1079557 () Bool)

(assert (=> b!1172221 m!1079557))

(declare-fun m!1079559 () Bool)

(assert (=> b!1172221 m!1079559))

(declare-fun m!1079561 () Bool)

(assert (=> b!1172215 m!1079561))

(declare-fun m!1079563 () Bool)

(assert (=> b!1172215 m!1079563))

(assert (=> b!1172215 m!1079537))

(declare-fun m!1079565 () Bool)

(assert (=> b!1172215 m!1079565))

(assert (=> b!1172215 m!1079537))

(declare-fun m!1079567 () Bool)

(assert (=> b!1172215 m!1079567))

(declare-fun m!1079569 () Bool)

(assert (=> b!1172215 m!1079569))

(declare-fun m!1079571 () Bool)

(assert (=> b!1172220 m!1079571))

(assert (=> b!1172213 m!1079537))

(declare-fun m!1079573 () Bool)

(assert (=> b!1172213 m!1079573))

(assert (=> b!1172213 m!1079573))

(declare-fun m!1079575 () Bool)

(assert (=> b!1172213 m!1079575))

(declare-fun m!1079577 () Bool)

(assert (=> b!1172213 m!1079577))

(declare-fun m!1079579 () Bool)

(assert (=> b!1172225 m!1079579))

(declare-fun m!1079581 () Bool)

(assert (=> b!1172219 m!1079581))

(declare-fun m!1079583 () Bool)

(assert (=> b!1172214 m!1079583))

(declare-fun m!1079585 () Bool)

(assert (=> b!1172209 m!1079585))

(declare-fun m!1079587 () Bool)

(assert (=> b!1172217 m!1079587))

(declare-fun m!1079589 () Bool)

(assert (=> b!1172212 m!1079589))

(declare-fun m!1079591 () Bool)

(assert (=> b!1172226 m!1079591))

(declare-fun m!1079593 () Bool)

(assert (=> b!1172224 m!1079593))

(declare-fun m!1079595 () Bool)

(assert (=> b!1172208 m!1079595))

(declare-fun m!1079597 () Bool)

(assert (=> b!1172208 m!1079597))

(declare-fun m!1079599 () Bool)

(assert (=> b!1172208 m!1079599))

(declare-fun m!1079601 () Bool)

(assert (=> b!1172208 m!1079601))

(declare-fun m!1079603 () Bool)

(assert (=> b!1172223 m!1079603))

(check-sat (not b!1172213) (not b!1172217) b_and!40745 (not b!1172226) (not b!1172220) (not start!99364) (not b_lambda!20075) (not b!1172227) (not b!1172221) (not mapNonEmpty!46046) tp_is_empty!29479 (not b!1172208) (not b!1172223) (not b!1172225) (not b_next!24949) (not b!1172212) (not b!1172215) (not b!1172214) (not b!1172209) (not b!1172218) (not b!1172224))
(check-sat b_and!40745 (not b_next!24949))
