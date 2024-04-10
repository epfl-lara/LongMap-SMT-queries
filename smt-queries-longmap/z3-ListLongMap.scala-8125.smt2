; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99618 () Bool)

(assert start!99618)

(declare-fun b_free!25197 () Bool)

(declare-fun b_next!25197 () Bool)

(assert (=> start!99618 (= b_free!25197 (not b_next!25197))))

(declare-fun tp!88305 () Bool)

(declare-fun b_and!41261 () Bool)

(assert (=> start!99618 (= tp!88305 b_and!41261)))

(declare-fun b!1180277 () Bool)

(declare-fun e!671026 () Bool)

(declare-fun e!671023 () Bool)

(declare-fun mapRes!46418 () Bool)

(assert (=> b!1180277 (= e!671026 (and e!671023 mapRes!46418))))

(declare-fun condMapEmpty!46418 () Bool)

(declare-datatypes ((V!44763 0))(
  ( (V!44764 (val!14920 Int)) )
))
(declare-datatypes ((ValueCell!14154 0))(
  ( (ValueCellFull!14154 (v!17558 V!44763)) (EmptyCell!14154) )
))
(declare-datatypes ((array!76257 0))(
  ( (array!76258 (arr!36778 (Array (_ BitVec 32) ValueCell!14154)) (size!37314 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76257)

(declare-fun mapDefault!46418 () ValueCell!14154)

(assert (=> b!1180277 (= condMapEmpty!46418 (= (arr!36778 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14154)) mapDefault!46418)))))

(declare-fun b!1180278 () Bool)

(declare-fun res!784232 () Bool)

(declare-fun e!671027 () Bool)

(assert (=> b!1180278 (=> (not res!784232) (not e!671027))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180278 (= res!784232 (validMask!0 mask!1564))))

(declare-fun b!1180279 () Bool)

(declare-fun res!784218 () Bool)

(declare-fun e!671018 () Bool)

(assert (=> b!1180279 (=> (not res!784218) (not e!671018))))

(declare-datatypes ((tuple2!19106 0))(
  ( (tuple2!19107 (_1!9564 (_ BitVec 64)) (_2!9564 V!44763)) )
))
(declare-datatypes ((List!25844 0))(
  ( (Nil!25841) (Cons!25840 (h!27049 tuple2!19106) (t!38033 List!25844)) )
))
(declare-datatypes ((ListLongMap!17075 0))(
  ( (ListLongMap!17076 (toList!8553 List!25844)) )
))
(declare-fun lt!533611 () ListLongMap!17075)

(declare-fun lt!533605 () tuple2!19106)

(declare-fun lt!533609 () ListLongMap!17075)

(declare-fun +!3864 (ListLongMap!17075 tuple2!19106) ListLongMap!17075)

(assert (=> b!1180279 (= res!784218 (= lt!533611 (+!3864 lt!533609 lt!533605)))))

(declare-fun b!1180280 () Bool)

(declare-fun e!671024 () Bool)

(declare-fun e!671021 () Bool)

(assert (=> b!1180280 (= e!671024 (not e!671021))))

(declare-fun res!784225 () Bool)

(assert (=> b!1180280 (=> res!784225 e!671021)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180280 (= res!784225 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76259 0))(
  ( (array!76260 (arr!36779 (Array (_ BitVec 32) (_ BitVec 64))) (size!37315 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76259)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180280 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39012 0))(
  ( (Unit!39013) )
))
(declare-fun lt!533608 () Unit!39012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76259 (_ BitVec 64) (_ BitVec 32)) Unit!39012)

(assert (=> b!1180280 (= lt!533608 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!784230 () Bool)

(assert (=> start!99618 (=> (not res!784230) (not e!671027))))

(assert (=> start!99618 (= res!784230 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37315 _keys!1208))))))

(assert (=> start!99618 e!671027))

(declare-fun tp_is_empty!29727 () Bool)

(assert (=> start!99618 tp_is_empty!29727))

(declare-fun array_inv!28084 (array!76259) Bool)

(assert (=> start!99618 (array_inv!28084 _keys!1208)))

(assert (=> start!99618 true))

(assert (=> start!99618 tp!88305))

(declare-fun array_inv!28085 (array!76257) Bool)

(assert (=> start!99618 (and (array_inv!28085 _values!996) e!671026)))

(declare-fun b!1180281 () Bool)

(declare-fun lt!533599 () ListLongMap!17075)

(declare-fun lt!533606 () ListLongMap!17075)

(assert (=> b!1180281 (= e!671018 (= lt!533599 lt!533606))))

(declare-fun b!1180282 () Bool)

(declare-fun res!784219 () Bool)

(assert (=> b!1180282 (=> (not res!784219) (not e!671027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76259 (_ BitVec 32)) Bool)

(assert (=> b!1180282 (= res!784219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!671017 () Bool)

(declare-fun b!1180283 () Bool)

(assert (=> b!1180283 (= e!671017 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180284 () Bool)

(declare-fun e!671025 () Bool)

(assert (=> b!1180284 (= e!671021 e!671025)))

(declare-fun res!784233 () Bool)

(assert (=> b!1180284 (=> res!784233 e!671025)))

(assert (=> b!1180284 (= res!784233 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44763)

(declare-fun lt!533600 () ListLongMap!17075)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533601 () array!76259)

(declare-fun lt!533603 () array!76257)

(declare-fun minValue!944 () V!44763)

(declare-fun getCurrentListMapNoExtraKeys!5007 (array!76259 array!76257 (_ BitVec 32) (_ BitVec 32) V!44763 V!44763 (_ BitVec 32) Int) ListLongMap!17075)

(assert (=> b!1180284 (= lt!533600 (getCurrentListMapNoExtraKeys!5007 lt!533601 lt!533603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533607 () V!44763)

(assert (=> b!1180284 (= lt!533603 (array!76258 (store (arr!36778 _values!996) i!673 (ValueCellFull!14154 lt!533607)) (size!37314 _values!996)))))

(declare-fun dynLambda!2966 (Int (_ BitVec 64)) V!44763)

(assert (=> b!1180284 (= lt!533607 (dynLambda!2966 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180284 (= lt!533611 (getCurrentListMapNoExtraKeys!5007 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180285 () Bool)

(declare-fun res!784221 () Bool)

(assert (=> b!1180285 (=> (not res!784221) (not e!671027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180285 (= res!784221 (validKeyInArray!0 k0!934))))

(declare-fun b!1180286 () Bool)

(declare-fun res!784228 () Bool)

(assert (=> b!1180286 (=> (not res!784228) (not e!671027))))

(assert (=> b!1180286 (= res!784228 (and (= (size!37314 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37315 _keys!1208) (size!37314 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180287 () Bool)

(declare-fun e!671020 () Bool)

(assert (=> b!1180287 (= e!671020 tp_is_empty!29727)))

(declare-fun b!1180288 () Bool)

(declare-fun res!784234 () Bool)

(assert (=> b!1180288 (=> (not res!784234) (not e!671027))))

(declare-datatypes ((List!25845 0))(
  ( (Nil!25842) (Cons!25841 (h!27050 (_ BitVec 64)) (t!38034 List!25845)) )
))
(declare-fun arrayNoDuplicates!0 (array!76259 (_ BitVec 32) List!25845) Bool)

(assert (=> b!1180288 (= res!784234 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25842))))

(declare-fun b!1180289 () Bool)

(assert (=> b!1180289 (= e!671027 e!671024)))

(declare-fun res!784220 () Bool)

(assert (=> b!1180289 (=> (not res!784220) (not e!671024))))

(assert (=> b!1180289 (= res!784220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533601 mask!1564))))

(assert (=> b!1180289 (= lt!533601 (array!76260 (store (arr!36779 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37315 _keys!1208)))))

(declare-fun b!1180290 () Bool)

(declare-fun e!671028 () Unit!39012)

(declare-fun Unit!39014 () Unit!39012)

(assert (=> b!1180290 (= e!671028 Unit!39014)))

(declare-fun b!1180291 () Bool)

(assert (=> b!1180291 (= e!671023 tp_is_empty!29727)))

(declare-fun b!1180292 () Bool)

(declare-fun res!784227 () Bool)

(assert (=> b!1180292 (=> (not res!784227) (not e!671027))))

(assert (=> b!1180292 (= res!784227 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37315 _keys!1208))))))

(declare-fun b!1180293 () Bool)

(declare-fun e!671029 () Bool)

(assert (=> b!1180293 (= e!671029 e!671017)))

(declare-fun res!784223 () Bool)

(assert (=> b!1180293 (=> res!784223 e!671017)))

(assert (=> b!1180293 (= res!784223 (not (= (select (arr!36779 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180294 () Bool)

(declare-fun Unit!39015 () Unit!39012)

(assert (=> b!1180294 (= e!671028 Unit!39015)))

(declare-fun lt!533610 () Unit!39012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39012)

(assert (=> b!1180294 (= lt!533610 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180294 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533612 () Unit!39012)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76259 (_ BitVec 32) (_ BitVec 32)) Unit!39012)

(assert (=> b!1180294 (= lt!533612 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180294 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25842)))

(declare-fun lt!533604 () Unit!39012)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76259 (_ BitVec 64) (_ BitVec 32) List!25845) Unit!39012)

(assert (=> b!1180294 (= lt!533604 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25842))))

(assert (=> b!1180294 false))

(declare-fun b!1180295 () Bool)

(declare-fun res!784222 () Bool)

(assert (=> b!1180295 (=> (not res!784222) (not e!671024))))

(assert (=> b!1180295 (= res!784222 (arrayNoDuplicates!0 lt!533601 #b00000000000000000000000000000000 Nil!25842))))

(declare-fun mapNonEmpty!46418 () Bool)

(declare-fun tp!88304 () Bool)

(assert (=> mapNonEmpty!46418 (= mapRes!46418 (and tp!88304 e!671020))))

(declare-fun mapKey!46418 () (_ BitVec 32))

(declare-fun mapValue!46418 () ValueCell!14154)

(declare-fun mapRest!46418 () (Array (_ BitVec 32) ValueCell!14154))

(assert (=> mapNonEmpty!46418 (= (arr!36778 _values!996) (store mapRest!46418 mapKey!46418 mapValue!46418))))

(declare-fun b!1180296 () Bool)

(declare-fun res!784229 () Bool)

(assert (=> b!1180296 (=> (not res!784229) (not e!671027))))

(assert (=> b!1180296 (= res!784229 (= (select (arr!36779 _keys!1208) i!673) k0!934))))

(declare-fun b!1180297 () Bool)

(declare-fun e!671022 () Bool)

(assert (=> b!1180297 (= e!671022 true)))

(assert (=> b!1180297 e!671018))

(declare-fun res!784224 () Bool)

(assert (=> b!1180297 (=> (not res!784224) (not e!671018))))

(assert (=> b!1180297 (= res!784224 (not (= (select (arr!36779 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533613 () Unit!39012)

(assert (=> b!1180297 (= lt!533613 e!671028)))

(declare-fun c!116919 () Bool)

(assert (=> b!1180297 (= c!116919 (= (select (arr!36779 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180297 e!671029))

(declare-fun res!784231 () Bool)

(assert (=> b!1180297 (=> (not res!784231) (not e!671029))))

(assert (=> b!1180297 (= res!784231 (= lt!533600 (+!3864 lt!533599 lt!533605)))))

(declare-fun get!18807 (ValueCell!14154 V!44763) V!44763)

(assert (=> b!1180297 (= lt!533605 (tuple2!19107 (select (arr!36779 _keys!1208) from!1455) (get!18807 (select (arr!36778 _values!996) from!1455) lt!533607)))))

(declare-fun b!1180298 () Bool)

(assert (=> b!1180298 (= e!671025 e!671022)))

(declare-fun res!784226 () Bool)

(assert (=> b!1180298 (=> res!784226 e!671022)))

(assert (=> b!1180298 (= res!784226 (not (validKeyInArray!0 (select (arr!36779 _keys!1208) from!1455))))))

(assert (=> b!1180298 (= lt!533606 lt!533599)))

(declare-fun -!1595 (ListLongMap!17075 (_ BitVec 64)) ListLongMap!17075)

(assert (=> b!1180298 (= lt!533599 (-!1595 lt!533609 k0!934))))

(assert (=> b!1180298 (= lt!533606 (getCurrentListMapNoExtraKeys!5007 lt!533601 lt!533603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180298 (= lt!533609 (getCurrentListMapNoExtraKeys!5007 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533602 () Unit!39012)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!822 (array!76259 array!76257 (_ BitVec 32) (_ BitVec 32) V!44763 V!44763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39012)

(assert (=> b!1180298 (= lt!533602 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!822 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46418 () Bool)

(assert (=> mapIsEmpty!46418 mapRes!46418))

(assert (= (and start!99618 res!784230) b!1180278))

(assert (= (and b!1180278 res!784232) b!1180286))

(assert (= (and b!1180286 res!784228) b!1180282))

(assert (= (and b!1180282 res!784219) b!1180288))

(assert (= (and b!1180288 res!784234) b!1180292))

(assert (= (and b!1180292 res!784227) b!1180285))

(assert (= (and b!1180285 res!784221) b!1180296))

(assert (= (and b!1180296 res!784229) b!1180289))

(assert (= (and b!1180289 res!784220) b!1180295))

(assert (= (and b!1180295 res!784222) b!1180280))

(assert (= (and b!1180280 (not res!784225)) b!1180284))

(assert (= (and b!1180284 (not res!784233)) b!1180298))

(assert (= (and b!1180298 (not res!784226)) b!1180297))

(assert (= (and b!1180297 res!784231) b!1180293))

(assert (= (and b!1180293 (not res!784223)) b!1180283))

(assert (= (and b!1180297 c!116919) b!1180294))

(assert (= (and b!1180297 (not c!116919)) b!1180290))

(assert (= (and b!1180297 res!784224) b!1180279))

(assert (= (and b!1180279 res!784218) b!1180281))

(assert (= (and b!1180277 condMapEmpty!46418) mapIsEmpty!46418))

(assert (= (and b!1180277 (not condMapEmpty!46418)) mapNonEmpty!46418))

(get-info :version)

(assert (= (and mapNonEmpty!46418 ((_ is ValueCellFull!14154) mapValue!46418)) b!1180287))

(assert (= (and b!1180277 ((_ is ValueCellFull!14154) mapDefault!46418)) b!1180291))

(assert (= start!99618 b!1180277))

(declare-fun b_lambda!20341 () Bool)

(assert (=> (not b_lambda!20341) (not b!1180284)))

(declare-fun t!38032 () Bool)

(declare-fun tb!10009 () Bool)

(assert (=> (and start!99618 (= defaultEntry!1004 defaultEntry!1004) t!38032) tb!10009))

(declare-fun result!20585 () Bool)

(assert (=> tb!10009 (= result!20585 tp_is_empty!29727)))

(assert (=> b!1180284 t!38032))

(declare-fun b_and!41263 () Bool)

(assert (= b_and!41261 (and (=> t!38032 result!20585) b_and!41263)))

(declare-fun m!1088235 () Bool)

(assert (=> b!1180278 m!1088235))

(declare-fun m!1088237 () Bool)

(assert (=> b!1180279 m!1088237))

(declare-fun m!1088239 () Bool)

(assert (=> b!1180280 m!1088239))

(declare-fun m!1088241 () Bool)

(assert (=> b!1180280 m!1088241))

(declare-fun m!1088243 () Bool)

(assert (=> b!1180297 m!1088243))

(declare-fun m!1088245 () Bool)

(assert (=> b!1180297 m!1088245))

(declare-fun m!1088247 () Bool)

(assert (=> b!1180297 m!1088247))

(assert (=> b!1180297 m!1088247))

(declare-fun m!1088249 () Bool)

(assert (=> b!1180297 m!1088249))

(declare-fun m!1088251 () Bool)

(assert (=> mapNonEmpty!46418 m!1088251))

(declare-fun m!1088253 () Bool)

(assert (=> b!1180289 m!1088253))

(declare-fun m!1088255 () Bool)

(assert (=> b!1180289 m!1088255))

(declare-fun m!1088257 () Bool)

(assert (=> b!1180282 m!1088257))

(declare-fun m!1088259 () Bool)

(assert (=> b!1180288 m!1088259))

(declare-fun m!1088261 () Bool)

(assert (=> b!1180295 m!1088261))

(declare-fun m!1088263 () Bool)

(assert (=> b!1180296 m!1088263))

(declare-fun m!1088265 () Bool)

(assert (=> b!1180298 m!1088265))

(declare-fun m!1088267 () Bool)

(assert (=> b!1180298 m!1088267))

(declare-fun m!1088269 () Bool)

(assert (=> b!1180298 m!1088269))

(assert (=> b!1180298 m!1088243))

(declare-fun m!1088271 () Bool)

(assert (=> b!1180298 m!1088271))

(declare-fun m!1088273 () Bool)

(assert (=> b!1180298 m!1088273))

(assert (=> b!1180298 m!1088243))

(assert (=> b!1180293 m!1088243))

(declare-fun m!1088275 () Bool)

(assert (=> b!1180294 m!1088275))

(declare-fun m!1088277 () Bool)

(assert (=> b!1180294 m!1088277))

(declare-fun m!1088279 () Bool)

(assert (=> b!1180294 m!1088279))

(declare-fun m!1088281 () Bool)

(assert (=> b!1180294 m!1088281))

(declare-fun m!1088283 () Bool)

(assert (=> b!1180294 m!1088283))

(declare-fun m!1088285 () Bool)

(assert (=> b!1180284 m!1088285))

(declare-fun m!1088287 () Bool)

(assert (=> b!1180284 m!1088287))

(declare-fun m!1088289 () Bool)

(assert (=> b!1180284 m!1088289))

(declare-fun m!1088291 () Bool)

(assert (=> b!1180284 m!1088291))

(declare-fun m!1088293 () Bool)

(assert (=> b!1180285 m!1088293))

(declare-fun m!1088295 () Bool)

(assert (=> b!1180283 m!1088295))

(declare-fun m!1088297 () Bool)

(assert (=> start!99618 m!1088297))

(declare-fun m!1088299 () Bool)

(assert (=> start!99618 m!1088299))

(check-sat (not b!1180282) (not mapNonEmpty!46418) b_and!41263 (not b!1180284) (not b_next!25197) (not b!1180283) (not b!1180298) (not b!1180295) (not start!99618) (not b!1180279) (not b!1180280) (not b!1180294) (not b!1180297) (not b!1180289) (not b_lambda!20341) (not b!1180285) (not b!1180278) (not b!1180288) tp_is_empty!29727)
(check-sat b_and!41263 (not b_next!25197))
