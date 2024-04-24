; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99624 () Bool)

(assert start!99624)

(declare-fun b_free!24967 () Bool)

(declare-fun b_next!24967 () Bool)

(assert (=> start!99624 (= b_free!24967 (not b_next!24967))))

(declare-fun tp!87615 () Bool)

(declare-fun b_and!40803 () Bool)

(assert (=> start!99624 (= tp!87615 b_and!40803)))

(declare-fun b!1174210 () Bool)

(declare-fun e!667516 () Bool)

(assert (=> b!1174210 (= e!667516 true)))

(declare-datatypes ((array!75861 0))(
  ( (array!75862 (arr!36574 (Array (_ BitVec 32) (_ BitVec 64))) (size!37111 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75861)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1174210 (not (= (select (arr!36574 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38657 0))(
  ( (Unit!38658) )
))
(declare-fun lt!529066 () Unit!38657)

(declare-fun e!667520 () Unit!38657)

(assert (=> b!1174210 (= lt!529066 e!667520)))

(declare-fun c!116972 () Bool)

(assert (=> b!1174210 (= c!116972 (= (select (arr!36574 _keys!1208) from!1455) k0!934))))

(declare-fun e!667524 () Bool)

(assert (=> b!1174210 e!667524))

(declare-fun res!779339 () Bool)

(assert (=> b!1174210 (=> (not res!779339) (not e!667524))))

(declare-datatypes ((V!44457 0))(
  ( (V!44458 (val!14805 Int)) )
))
(declare-datatypes ((tuple2!18952 0))(
  ( (tuple2!18953 (_1!9487 (_ BitVec 64)) (_2!9487 V!44457)) )
))
(declare-datatypes ((List!25689 0))(
  ( (Nil!25686) (Cons!25685 (h!26903 tuple2!18952) (t!37640 List!25689)) )
))
(declare-datatypes ((ListLongMap!16929 0))(
  ( (ListLongMap!16930 (toList!8480 List!25689)) )
))
(declare-fun lt!529063 () ListLongMap!16929)

(declare-fun lt!529060 () V!44457)

(declare-fun lt!529069 () ListLongMap!16929)

(declare-datatypes ((ValueCell!14039 0))(
  ( (ValueCellFull!14039 (v!17439 V!44457)) (EmptyCell!14039) )
))
(declare-datatypes ((array!75863 0))(
  ( (array!75864 (arr!36575 (Array (_ BitVec 32) ValueCell!14039)) (size!37112 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75863)

(declare-fun +!3813 (ListLongMap!16929 tuple2!18952) ListLongMap!16929)

(declare-fun get!18687 (ValueCell!14039 V!44457) V!44457)

(assert (=> b!1174210 (= res!779339 (= lt!529063 (+!3813 lt!529069 (tuple2!18953 (select (arr!36574 _keys!1208) from!1455) (get!18687 (select (arr!36575 _values!996) from!1455) lt!529060)))))))

(declare-fun b!1174211 () Bool)

(declare-fun e!667521 () Bool)

(declare-fun e!667526 () Bool)

(assert (=> b!1174211 (= e!667521 e!667526)))

(declare-fun res!779335 () Bool)

(assert (=> b!1174211 (=> (not res!779335) (not e!667526))))

(declare-fun lt!529059 () array!75861)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75861 (_ BitVec 32)) Bool)

(assert (=> b!1174211 (= res!779335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529059 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174211 (= lt!529059 (array!75862 (store (arr!36574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37111 _keys!1208)))))

(declare-fun b!1174212 () Bool)

(declare-fun res!779332 () Bool)

(assert (=> b!1174212 (=> (not res!779332) (not e!667521))))

(declare-datatypes ((List!25690 0))(
  ( (Nil!25687) (Cons!25686 (h!26904 (_ BitVec 64)) (t!37641 List!25690)) )
))
(declare-fun arrayNoDuplicates!0 (array!75861 (_ BitVec 32) List!25690) Bool)

(assert (=> b!1174212 (= res!779332 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25687))))

(declare-fun b!1174213 () Bool)

(declare-fun e!667518 () Bool)

(declare-fun tp_is_empty!29497 () Bool)

(assert (=> b!1174213 (= e!667518 tp_is_empty!29497)))

(declare-fun b!1174214 () Bool)

(declare-fun e!667523 () Bool)

(declare-fun e!667519 () Bool)

(assert (=> b!1174214 (= e!667523 e!667519)))

(declare-fun res!779331 () Bool)

(assert (=> b!1174214 (=> res!779331 e!667519)))

(assert (=> b!1174214 (= res!779331 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44457)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44457)

(declare-fun lt!529065 () array!75863)

(declare-fun getCurrentListMapNoExtraKeys!4966 (array!75861 array!75863 (_ BitVec 32) (_ BitVec 32) V!44457 V!44457 (_ BitVec 32) Int) ListLongMap!16929)

(assert (=> b!1174214 (= lt!529063 (getCurrentListMapNoExtraKeys!4966 lt!529059 lt!529065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174214 (= lt!529065 (array!75864 (store (arr!36575 _values!996) i!673 (ValueCellFull!14039 lt!529060)) (size!37112 _values!996)))))

(declare-fun dynLambda!2944 (Int (_ BitVec 64)) V!44457)

(assert (=> b!1174214 (= lt!529060 (dynLambda!2944 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529067 () ListLongMap!16929)

(assert (=> b!1174214 (= lt!529067 (getCurrentListMapNoExtraKeys!4966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174215 () Bool)

(declare-fun Unit!38659 () Unit!38657)

(assert (=> b!1174215 (= e!667520 Unit!38659)))

(declare-fun lt!529068 () Unit!38657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75861 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38657)

(assert (=> b!1174215 (= lt!529068 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174215 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529062 () Unit!38657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75861 (_ BitVec 32) (_ BitVec 32)) Unit!38657)

(assert (=> b!1174215 (= lt!529062 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174215 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25687)))

(declare-fun lt!529061 () Unit!38657)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75861 (_ BitVec 64) (_ BitVec 32) List!25690) Unit!38657)

(assert (=> b!1174215 (= lt!529061 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25687))))

(assert (=> b!1174215 false))

(declare-fun mapIsEmpty!46073 () Bool)

(declare-fun mapRes!46073 () Bool)

(assert (=> mapIsEmpty!46073 mapRes!46073))

(declare-fun mapNonEmpty!46073 () Bool)

(declare-fun tp!87614 () Bool)

(declare-fun e!667515 () Bool)

(assert (=> mapNonEmpty!46073 (= mapRes!46073 (and tp!87614 e!667515))))

(declare-fun mapKey!46073 () (_ BitVec 32))

(declare-fun mapRest!46073 () (Array (_ BitVec 32) ValueCell!14039))

(declare-fun mapValue!46073 () ValueCell!14039)

(assert (=> mapNonEmpty!46073 (= (arr!36575 _values!996) (store mapRest!46073 mapKey!46073 mapValue!46073))))

(declare-fun b!1174216 () Bool)

(assert (=> b!1174216 (= e!667526 (not e!667523))))

(declare-fun res!779338 () Bool)

(assert (=> b!1174216 (=> res!779338 e!667523)))

(assert (=> b!1174216 (= res!779338 (bvsgt from!1455 i!673))))

(assert (=> b!1174216 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529064 () Unit!38657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75861 (_ BitVec 64) (_ BitVec 32)) Unit!38657)

(assert (=> b!1174216 (= lt!529064 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174217 () Bool)

(declare-fun e!667525 () Bool)

(assert (=> b!1174217 (= e!667525 (and e!667518 mapRes!46073))))

(declare-fun condMapEmpty!46073 () Bool)

(declare-fun mapDefault!46073 () ValueCell!14039)

(assert (=> b!1174217 (= condMapEmpty!46073 (= (arr!36575 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14039)) mapDefault!46073)))))

(declare-fun b!1174218 () Bool)

(declare-fun res!779337 () Bool)

(assert (=> b!1174218 (=> (not res!779337) (not e!667521))))

(assert (=> b!1174218 (= res!779337 (= (select (arr!36574 _keys!1208) i!673) k0!934))))

(declare-fun b!1174220 () Bool)

(declare-fun res!779336 () Bool)

(assert (=> b!1174220 (=> (not res!779336) (not e!667521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174220 (= res!779336 (validKeyInArray!0 k0!934))))

(declare-fun b!1174221 () Bool)

(declare-fun res!779325 () Bool)

(assert (=> b!1174221 (=> (not res!779325) (not e!667526))))

(assert (=> b!1174221 (= res!779325 (arrayNoDuplicates!0 lt!529059 #b00000000000000000000000000000000 Nil!25687))))

(declare-fun b!1174222 () Bool)

(declare-fun Unit!38660 () Unit!38657)

(assert (=> b!1174222 (= e!667520 Unit!38660)))

(declare-fun b!1174223 () Bool)

(declare-fun res!779328 () Bool)

(assert (=> b!1174223 (=> (not res!779328) (not e!667521))))

(assert (=> b!1174223 (= res!779328 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37111 _keys!1208))))))

(declare-fun b!1174224 () Bool)

(assert (=> b!1174224 (= e!667519 e!667516)))

(declare-fun res!779330 () Bool)

(assert (=> b!1174224 (=> res!779330 e!667516)))

(assert (=> b!1174224 (= res!779330 (not (validKeyInArray!0 (select (arr!36574 _keys!1208) from!1455))))))

(declare-fun lt!529071 () ListLongMap!16929)

(assert (=> b!1174224 (= lt!529071 lt!529069)))

(declare-fun lt!529070 () ListLongMap!16929)

(declare-fun -!1530 (ListLongMap!16929 (_ BitVec 64)) ListLongMap!16929)

(assert (=> b!1174224 (= lt!529069 (-!1530 lt!529070 k0!934))))

(assert (=> b!1174224 (= lt!529071 (getCurrentListMapNoExtraKeys!4966 lt!529059 lt!529065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174224 (= lt!529070 (getCurrentListMapNoExtraKeys!4966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529072 () Unit!38657)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 (array!75861 array!75863 (_ BitVec 32) (_ BitVec 32) V!44457 V!44457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38657)

(assert (=> b!1174224 (= lt!529072 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174225 () Bool)

(declare-fun e!667522 () Bool)

(assert (=> b!1174225 (= e!667524 e!667522)))

(declare-fun res!779326 () Bool)

(assert (=> b!1174225 (=> res!779326 e!667522)))

(assert (=> b!1174225 (= res!779326 (not (= (select (arr!36574 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174226 () Bool)

(declare-fun res!779334 () Bool)

(assert (=> b!1174226 (=> (not res!779334) (not e!667521))))

(assert (=> b!1174226 (= res!779334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174227 () Bool)

(assert (=> b!1174227 (= e!667515 tp_is_empty!29497)))

(declare-fun b!1174228 () Bool)

(declare-fun res!779327 () Bool)

(assert (=> b!1174228 (=> (not res!779327) (not e!667521))))

(assert (=> b!1174228 (= res!779327 (and (= (size!37112 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37111 _keys!1208) (size!37112 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174229 () Bool)

(assert (=> b!1174229 (= e!667522 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!779333 () Bool)

(assert (=> start!99624 (=> (not res!779333) (not e!667521))))

(assert (=> start!99624 (= res!779333 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37111 _keys!1208))))))

(assert (=> start!99624 e!667521))

(assert (=> start!99624 tp_is_empty!29497))

(declare-fun array_inv!28022 (array!75861) Bool)

(assert (=> start!99624 (array_inv!28022 _keys!1208)))

(assert (=> start!99624 true))

(assert (=> start!99624 tp!87615))

(declare-fun array_inv!28023 (array!75863) Bool)

(assert (=> start!99624 (and (array_inv!28023 _values!996) e!667525)))

(declare-fun b!1174219 () Bool)

(declare-fun res!779329 () Bool)

(assert (=> b!1174219 (=> (not res!779329) (not e!667521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174219 (= res!779329 (validMask!0 mask!1564))))

(assert (= (and start!99624 res!779333) b!1174219))

(assert (= (and b!1174219 res!779329) b!1174228))

(assert (= (and b!1174228 res!779327) b!1174226))

(assert (= (and b!1174226 res!779334) b!1174212))

(assert (= (and b!1174212 res!779332) b!1174223))

(assert (= (and b!1174223 res!779328) b!1174220))

(assert (= (and b!1174220 res!779336) b!1174218))

(assert (= (and b!1174218 res!779337) b!1174211))

(assert (= (and b!1174211 res!779335) b!1174221))

(assert (= (and b!1174221 res!779325) b!1174216))

(assert (= (and b!1174216 (not res!779338)) b!1174214))

(assert (= (and b!1174214 (not res!779331)) b!1174224))

(assert (= (and b!1174224 (not res!779330)) b!1174210))

(assert (= (and b!1174210 res!779339) b!1174225))

(assert (= (and b!1174225 (not res!779326)) b!1174229))

(assert (= (and b!1174210 c!116972) b!1174215))

(assert (= (and b!1174210 (not c!116972)) b!1174222))

(assert (= (and b!1174217 condMapEmpty!46073) mapIsEmpty!46073))

(assert (= (and b!1174217 (not condMapEmpty!46073)) mapNonEmpty!46073))

(get-info :version)

(assert (= (and mapNonEmpty!46073 ((_ is ValueCellFull!14039) mapValue!46073)) b!1174227))

(assert (= (and b!1174217 ((_ is ValueCellFull!14039) mapDefault!46073)) b!1174213))

(assert (= start!99624 b!1174217))

(declare-fun b_lambda!20105 () Bool)

(assert (=> (not b_lambda!20105) (not b!1174214)))

(declare-fun t!37639 () Bool)

(declare-fun tb!9771 () Bool)

(assert (=> (and start!99624 (= defaultEntry!1004 defaultEntry!1004) t!37639) tb!9771))

(declare-fun result!20117 () Bool)

(assert (=> tb!9771 (= result!20117 tp_is_empty!29497)))

(assert (=> b!1174214 t!37639))

(declare-fun b_and!40805 () Bool)

(assert (= b_and!40803 (and (=> t!37639 result!20117) b_and!40805)))

(declare-fun m!1082319 () Bool)

(assert (=> b!1174215 m!1082319))

(declare-fun m!1082321 () Bool)

(assert (=> b!1174215 m!1082321))

(declare-fun m!1082323 () Bool)

(assert (=> b!1174215 m!1082323))

(declare-fun m!1082325 () Bool)

(assert (=> b!1174215 m!1082325))

(declare-fun m!1082327 () Bool)

(assert (=> b!1174215 m!1082327))

(declare-fun m!1082329 () Bool)

(assert (=> start!99624 m!1082329))

(declare-fun m!1082331 () Bool)

(assert (=> start!99624 m!1082331))

(declare-fun m!1082333 () Bool)

(assert (=> b!1174214 m!1082333))

(declare-fun m!1082335 () Bool)

(assert (=> b!1174214 m!1082335))

(declare-fun m!1082337 () Bool)

(assert (=> b!1174214 m!1082337))

(declare-fun m!1082339 () Bool)

(assert (=> b!1174214 m!1082339))

(declare-fun m!1082341 () Bool)

(assert (=> b!1174229 m!1082341))

(declare-fun m!1082343 () Bool)

(assert (=> b!1174226 m!1082343))

(declare-fun m!1082345 () Bool)

(assert (=> b!1174211 m!1082345))

(declare-fun m!1082347 () Bool)

(assert (=> b!1174211 m!1082347))

(declare-fun m!1082349 () Bool)

(assert (=> b!1174216 m!1082349))

(declare-fun m!1082351 () Bool)

(assert (=> b!1174216 m!1082351))

(declare-fun m!1082353 () Bool)

(assert (=> b!1174220 m!1082353))

(declare-fun m!1082355 () Bool)

(assert (=> b!1174210 m!1082355))

(declare-fun m!1082357 () Bool)

(assert (=> b!1174210 m!1082357))

(assert (=> b!1174210 m!1082357))

(declare-fun m!1082359 () Bool)

(assert (=> b!1174210 m!1082359))

(declare-fun m!1082361 () Bool)

(assert (=> b!1174210 m!1082361))

(declare-fun m!1082363 () Bool)

(assert (=> b!1174219 m!1082363))

(declare-fun m!1082365 () Bool)

(assert (=> mapNonEmpty!46073 m!1082365))

(assert (=> b!1174225 m!1082355))

(declare-fun m!1082367 () Bool)

(assert (=> b!1174224 m!1082367))

(declare-fun m!1082369 () Bool)

(assert (=> b!1174224 m!1082369))

(assert (=> b!1174224 m!1082355))

(declare-fun m!1082371 () Bool)

(assert (=> b!1174224 m!1082371))

(assert (=> b!1174224 m!1082355))

(declare-fun m!1082373 () Bool)

(assert (=> b!1174224 m!1082373))

(declare-fun m!1082375 () Bool)

(assert (=> b!1174224 m!1082375))

(declare-fun m!1082377 () Bool)

(assert (=> b!1174212 m!1082377))

(declare-fun m!1082379 () Bool)

(assert (=> b!1174218 m!1082379))

(declare-fun m!1082381 () Bool)

(assert (=> b!1174221 m!1082381))

(check-sat (not b!1174210) (not b!1174216) (not mapNonEmpty!46073) tp_is_empty!29497 b_and!40805 (not b!1174212) (not start!99624) (not b!1174221) (not b!1174224) (not b!1174219) (not b!1174214) (not b_next!24967) (not b!1174226) (not b!1174211) (not b!1174229) (not b_lambda!20105) (not b!1174215) (not b!1174220))
(check-sat b_and!40805 (not b_next!24967))
