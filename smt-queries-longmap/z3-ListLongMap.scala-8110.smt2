; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99528 () Bool)

(assert start!99528)

(declare-fun b_free!25107 () Bool)

(declare-fun b_next!25107 () Bool)

(assert (=> start!99528 (= b_free!25107 (not b_next!25107))))

(declare-fun tp!88035 () Bool)

(declare-fun b_and!41081 () Bool)

(assert (=> start!99528 (= tp!88035 b_and!41081)))

(declare-fun b!1177320 () Bool)

(declare-datatypes ((Unit!38877 0))(
  ( (Unit!38878) )
))
(declare-fun e!669262 () Unit!38877)

(declare-fun Unit!38879 () Unit!38877)

(assert (=> b!1177320 (= e!669262 Unit!38879)))

(declare-fun b!1177321 () Bool)

(declare-fun e!669265 () Bool)

(declare-fun e!669267 () Bool)

(assert (=> b!1177321 (= e!669265 e!669267)))

(declare-fun res!782031 () Bool)

(assert (=> b!1177321 (=> res!782031 e!669267)))

(declare-datatypes ((array!76081 0))(
  ( (array!76082 (arr!36690 (Array (_ BitVec 32) (_ BitVec 64))) (size!37226 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76081)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177321 (= res!782031 (not (= (select (arr!36690 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177322 () Bool)

(declare-fun e!669269 () Bool)

(declare-fun e!669274 () Bool)

(assert (=> b!1177322 (= e!669269 (not e!669274))))

(declare-fun res!782040 () Bool)

(assert (=> b!1177322 (=> res!782040 e!669274)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177322 (= res!782040 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531576 () Unit!38877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76081 (_ BitVec 64) (_ BitVec 32)) Unit!38877)

(assert (=> b!1177322 (= lt!531576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46283 () Bool)

(declare-fun mapRes!46283 () Bool)

(declare-fun tp!88034 () Bool)

(declare-fun e!669268 () Bool)

(assert (=> mapNonEmpty!46283 (= mapRes!46283 (and tp!88034 e!669268))))

(declare-datatypes ((V!44643 0))(
  ( (V!44644 (val!14875 Int)) )
))
(declare-datatypes ((ValueCell!14109 0))(
  ( (ValueCellFull!14109 (v!17513 V!44643)) (EmptyCell!14109) )
))
(declare-fun mapValue!46283 () ValueCell!14109)

(declare-fun mapKey!46283 () (_ BitVec 32))

(declare-datatypes ((array!76083 0))(
  ( (array!76084 (arr!36691 (Array (_ BitVec 32) ValueCell!14109)) (size!37227 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76083)

(declare-fun mapRest!46283 () (Array (_ BitVec 32) ValueCell!14109))

(assert (=> mapNonEmpty!46283 (= (arr!36691 _values!996) (store mapRest!46283 mapKey!46283 mapValue!46283))))

(declare-fun b!1177323 () Bool)

(declare-fun Unit!38880 () Unit!38877)

(assert (=> b!1177323 (= e!669262 Unit!38880)))

(declare-fun lt!531577 () Unit!38877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76081 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38877)

(assert (=> b!1177323 (= lt!531577 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177323 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531588 () Unit!38877)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76081 (_ BitVec 32) (_ BitVec 32)) Unit!38877)

(assert (=> b!1177323 (= lt!531588 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25767 0))(
  ( (Nil!25764) (Cons!25763 (h!26972 (_ BitVec 64)) (t!37866 List!25767)) )
))
(declare-fun arrayNoDuplicates!0 (array!76081 (_ BitVec 32) List!25767) Bool)

(assert (=> b!1177323 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25764)))

(declare-fun lt!531580 () Unit!38877)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76081 (_ BitVec 64) (_ BitVec 32) List!25767) Unit!38877)

(assert (=> b!1177323 (= lt!531580 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25764))))

(assert (=> b!1177323 false))

(declare-fun b!1177324 () Bool)

(declare-fun e!669263 () Bool)

(declare-fun e!669266 () Bool)

(assert (=> b!1177324 (= e!669263 (and e!669266 mapRes!46283))))

(declare-fun condMapEmpty!46283 () Bool)

(declare-fun mapDefault!46283 () ValueCell!14109)

(assert (=> b!1177324 (= condMapEmpty!46283 (= (arr!36691 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14109)) mapDefault!46283)))))

(declare-fun b!1177325 () Bool)

(declare-fun res!782038 () Bool)

(declare-fun e!669271 () Bool)

(assert (=> b!1177325 (=> (not res!782038) (not e!669271))))

(assert (=> b!1177325 (= res!782038 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25764))))

(declare-fun res!782027 () Bool)

(assert (=> start!99528 (=> (not res!782027) (not e!669271))))

(assert (=> start!99528 (= res!782027 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37226 _keys!1208))))))

(assert (=> start!99528 e!669271))

(declare-fun tp_is_empty!29637 () Bool)

(assert (=> start!99528 tp_is_empty!29637))

(declare-fun array_inv!28018 (array!76081) Bool)

(assert (=> start!99528 (array_inv!28018 _keys!1208)))

(assert (=> start!99528 true))

(assert (=> start!99528 tp!88035))

(declare-fun array_inv!28019 (array!76083) Bool)

(assert (=> start!99528 (and (array_inv!28019 _values!996) e!669263)))

(declare-fun mapIsEmpty!46283 () Bool)

(assert (=> mapIsEmpty!46283 mapRes!46283))

(declare-fun b!1177326 () Bool)

(assert (=> b!1177326 (= e!669271 e!669269)))

(declare-fun res!782037 () Bool)

(assert (=> b!1177326 (=> (not res!782037) (not e!669269))))

(declare-fun lt!531575 () array!76081)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76081 (_ BitVec 32)) Bool)

(assert (=> b!1177326 (= res!782037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531575 mask!1564))))

(assert (=> b!1177326 (= lt!531575 (array!76082 (store (arr!36690 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37226 _keys!1208)))))

(declare-fun b!1177327 () Bool)

(declare-fun e!669272 () Bool)

(assert (=> b!1177327 (= e!669274 e!669272)))

(declare-fun res!782035 () Bool)

(assert (=> b!1177327 (=> res!782035 e!669272)))

(assert (=> b!1177327 (= res!782035 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19030 0))(
  ( (tuple2!19031 (_1!9526 (_ BitVec 64)) (_2!9526 V!44643)) )
))
(declare-datatypes ((List!25768 0))(
  ( (Nil!25765) (Cons!25764 (h!26973 tuple2!19030) (t!37867 List!25768)) )
))
(declare-datatypes ((ListLongMap!16999 0))(
  ( (ListLongMap!17000 (toList!8515 List!25768)) )
))
(declare-fun lt!531583 () ListLongMap!16999)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44643)

(declare-fun lt!531584 () array!76083)

(declare-fun zeroValue!944 () V!44643)

(declare-fun getCurrentListMapNoExtraKeys!4972 (array!76081 array!76083 (_ BitVec 32) (_ BitVec 32) V!44643 V!44643 (_ BitVec 32) Int) ListLongMap!16999)

(assert (=> b!1177327 (= lt!531583 (getCurrentListMapNoExtraKeys!4972 lt!531575 lt!531584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531585 () V!44643)

(assert (=> b!1177327 (= lt!531584 (array!76084 (store (arr!36691 _values!996) i!673 (ValueCellFull!14109 lt!531585)) (size!37227 _values!996)))))

(declare-fun dynLambda!2935 (Int (_ BitVec 64)) V!44643)

(assert (=> b!1177327 (= lt!531585 (dynLambda!2935 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531574 () ListLongMap!16999)

(assert (=> b!1177327 (= lt!531574 (getCurrentListMapNoExtraKeys!4972 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177328 () Bool)

(declare-fun e!669264 () Bool)

(assert (=> b!1177328 (= e!669264 true)))

(declare-fun e!669273 () Bool)

(assert (=> b!1177328 e!669273))

(declare-fun res!782028 () Bool)

(assert (=> b!1177328 (=> (not res!782028) (not e!669273))))

(assert (=> b!1177328 (= res!782028 (not (= (select (arr!36690 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531581 () Unit!38877)

(assert (=> b!1177328 (= lt!531581 e!669262)))

(declare-fun c!116784 () Bool)

(assert (=> b!1177328 (= c!116784 (= (select (arr!36690 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177328 e!669265))

(declare-fun res!782033 () Bool)

(assert (=> b!1177328 (=> (not res!782033) (not e!669265))))

(declare-fun lt!531587 () ListLongMap!16999)

(declare-fun lt!531579 () tuple2!19030)

(declare-fun +!3830 (ListLongMap!16999 tuple2!19030) ListLongMap!16999)

(assert (=> b!1177328 (= res!782033 (= lt!531583 (+!3830 lt!531587 lt!531579)))))

(declare-fun get!18746 (ValueCell!14109 V!44643) V!44643)

(assert (=> b!1177328 (= lt!531579 (tuple2!19031 (select (arr!36690 _keys!1208) from!1455) (get!18746 (select (arr!36691 _values!996) from!1455) lt!531585)))))

(declare-fun b!1177329 () Bool)

(declare-fun res!782030 () Bool)

(assert (=> b!1177329 (=> (not res!782030) (not e!669271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177329 (= res!782030 (validMask!0 mask!1564))))

(declare-fun b!1177330 () Bool)

(declare-fun res!782029 () Bool)

(assert (=> b!1177330 (=> (not res!782029) (not e!669271))))

(assert (=> b!1177330 (= res!782029 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37226 _keys!1208))))))

(declare-fun b!1177331 () Bool)

(assert (=> b!1177331 (= e!669268 tp_is_empty!29637)))

(declare-fun lt!531586 () ListLongMap!16999)

(declare-fun b!1177332 () Bool)

(assert (=> b!1177332 (= e!669273 (= lt!531574 (+!3830 lt!531586 lt!531579)))))

(declare-fun b!1177333 () Bool)

(declare-fun res!782034 () Bool)

(assert (=> b!1177333 (=> (not res!782034) (not e!669271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177333 (= res!782034 (validKeyInArray!0 k0!934))))

(declare-fun b!1177334 () Bool)

(declare-fun res!782032 () Bool)

(assert (=> b!1177334 (=> (not res!782032) (not e!669271))))

(assert (=> b!1177334 (= res!782032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177335 () Bool)

(declare-fun res!782036 () Bool)

(assert (=> b!1177335 (=> (not res!782036) (not e!669269))))

(assert (=> b!1177335 (= res!782036 (arrayNoDuplicates!0 lt!531575 #b00000000000000000000000000000000 Nil!25764))))

(declare-fun b!1177336 () Bool)

(assert (=> b!1177336 (= e!669266 tp_is_empty!29637)))

(declare-fun b!1177337 () Bool)

(assert (=> b!1177337 (= e!669272 e!669264)))

(declare-fun res!782039 () Bool)

(assert (=> b!1177337 (=> res!782039 e!669264)))

(assert (=> b!1177337 (= res!782039 (not (validKeyInArray!0 (select (arr!36690 _keys!1208) from!1455))))))

(declare-fun lt!531578 () ListLongMap!16999)

(assert (=> b!1177337 (= lt!531578 lt!531587)))

(declare-fun -!1564 (ListLongMap!16999 (_ BitVec 64)) ListLongMap!16999)

(assert (=> b!1177337 (= lt!531587 (-!1564 lt!531586 k0!934))))

(assert (=> b!1177337 (= lt!531578 (getCurrentListMapNoExtraKeys!4972 lt!531575 lt!531584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177337 (= lt!531586 (getCurrentListMapNoExtraKeys!4972 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531582 () Unit!38877)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!791 (array!76081 array!76083 (_ BitVec 32) (_ BitVec 32) V!44643 V!44643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38877)

(assert (=> b!1177337 (= lt!531582 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177338 () Bool)

(declare-fun res!782041 () Bool)

(assert (=> b!1177338 (=> (not res!782041) (not e!669271))))

(assert (=> b!1177338 (= res!782041 (= (select (arr!36690 _keys!1208) i!673) k0!934))))

(declare-fun b!1177339 () Bool)

(declare-fun res!782026 () Bool)

(assert (=> b!1177339 (=> (not res!782026) (not e!669271))))

(assert (=> b!1177339 (= res!782026 (and (= (size!37227 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37226 _keys!1208) (size!37227 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177340 () Bool)

(assert (=> b!1177340 (= e!669267 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99528 res!782027) b!1177329))

(assert (= (and b!1177329 res!782030) b!1177339))

(assert (= (and b!1177339 res!782026) b!1177334))

(assert (= (and b!1177334 res!782032) b!1177325))

(assert (= (and b!1177325 res!782038) b!1177330))

(assert (= (and b!1177330 res!782029) b!1177333))

(assert (= (and b!1177333 res!782034) b!1177338))

(assert (= (and b!1177338 res!782041) b!1177326))

(assert (= (and b!1177326 res!782037) b!1177335))

(assert (= (and b!1177335 res!782036) b!1177322))

(assert (= (and b!1177322 (not res!782040)) b!1177327))

(assert (= (and b!1177327 (not res!782035)) b!1177337))

(assert (= (and b!1177337 (not res!782039)) b!1177328))

(assert (= (and b!1177328 res!782033) b!1177321))

(assert (= (and b!1177321 (not res!782031)) b!1177340))

(assert (= (and b!1177328 c!116784) b!1177323))

(assert (= (and b!1177328 (not c!116784)) b!1177320))

(assert (= (and b!1177328 res!782028) b!1177332))

(assert (= (and b!1177324 condMapEmpty!46283) mapIsEmpty!46283))

(assert (= (and b!1177324 (not condMapEmpty!46283)) mapNonEmpty!46283))

(get-info :version)

(assert (= (and mapNonEmpty!46283 ((_ is ValueCellFull!14109) mapValue!46283)) b!1177331))

(assert (= (and b!1177324 ((_ is ValueCellFull!14109) mapDefault!46283)) b!1177336))

(assert (= start!99528 b!1177324))

(declare-fun b_lambda!20251 () Bool)

(assert (=> (not b_lambda!20251) (not b!1177327)))

(declare-fun t!37865 () Bool)

(declare-fun tb!9919 () Bool)

(assert (=> (and start!99528 (= defaultEntry!1004 defaultEntry!1004) t!37865) tb!9919))

(declare-fun result!20405 () Bool)

(assert (=> tb!9919 (= result!20405 tp_is_empty!29637)))

(assert (=> b!1177327 t!37865))

(declare-fun b_and!41083 () Bool)

(assert (= b_and!41081 (and (=> t!37865 result!20405) b_and!41083)))

(declare-fun m!1085265 () Bool)

(assert (=> b!1177328 m!1085265))

(declare-fun m!1085267 () Bool)

(assert (=> b!1177328 m!1085267))

(declare-fun m!1085269 () Bool)

(assert (=> b!1177328 m!1085269))

(assert (=> b!1177328 m!1085269))

(declare-fun m!1085271 () Bool)

(assert (=> b!1177328 m!1085271))

(declare-fun m!1085273 () Bool)

(assert (=> b!1177340 m!1085273))

(declare-fun m!1085275 () Bool)

(assert (=> b!1177333 m!1085275))

(declare-fun m!1085277 () Bool)

(assert (=> b!1177329 m!1085277))

(declare-fun m!1085279 () Bool)

(assert (=> b!1177323 m!1085279))

(declare-fun m!1085281 () Bool)

(assert (=> b!1177323 m!1085281))

(declare-fun m!1085283 () Bool)

(assert (=> b!1177323 m!1085283))

(declare-fun m!1085285 () Bool)

(assert (=> b!1177323 m!1085285))

(declare-fun m!1085287 () Bool)

(assert (=> b!1177323 m!1085287))

(declare-fun m!1085289 () Bool)

(assert (=> b!1177325 m!1085289))

(declare-fun m!1085291 () Bool)

(assert (=> b!1177335 m!1085291))

(declare-fun m!1085293 () Bool)

(assert (=> start!99528 m!1085293))

(declare-fun m!1085295 () Bool)

(assert (=> start!99528 m!1085295))

(declare-fun m!1085297 () Bool)

(assert (=> b!1177326 m!1085297))

(declare-fun m!1085299 () Bool)

(assert (=> b!1177326 m!1085299))

(declare-fun m!1085301 () Bool)

(assert (=> b!1177327 m!1085301))

(declare-fun m!1085303 () Bool)

(assert (=> b!1177327 m!1085303))

(declare-fun m!1085305 () Bool)

(assert (=> b!1177327 m!1085305))

(declare-fun m!1085307 () Bool)

(assert (=> b!1177327 m!1085307))

(declare-fun m!1085309 () Bool)

(assert (=> b!1177322 m!1085309))

(declare-fun m!1085311 () Bool)

(assert (=> b!1177322 m!1085311))

(declare-fun m!1085313 () Bool)

(assert (=> b!1177338 m!1085313))

(assert (=> b!1177321 m!1085265))

(declare-fun m!1085315 () Bool)

(assert (=> b!1177337 m!1085315))

(declare-fun m!1085317 () Bool)

(assert (=> b!1177337 m!1085317))

(declare-fun m!1085319 () Bool)

(assert (=> b!1177337 m!1085319))

(assert (=> b!1177337 m!1085265))

(declare-fun m!1085321 () Bool)

(assert (=> b!1177337 m!1085321))

(assert (=> b!1177337 m!1085265))

(declare-fun m!1085323 () Bool)

(assert (=> b!1177337 m!1085323))

(declare-fun m!1085325 () Bool)

(assert (=> b!1177332 m!1085325))

(declare-fun m!1085327 () Bool)

(assert (=> mapNonEmpty!46283 m!1085327))

(declare-fun m!1085329 () Bool)

(assert (=> b!1177334 m!1085329))

(check-sat (not b!1177326) (not b_lambda!20251) (not b!1177325) (not b!1177332) (not b!1177333) (not b!1177329) (not b!1177335) (not b!1177323) tp_is_empty!29637 b_and!41083 (not start!99528) (not b!1177327) (not b!1177328) (not mapNonEmpty!46283) (not b!1177340) (not b!1177334) (not b!1177337) (not b!1177322) (not b_next!25107))
(check-sat b_and!41083 (not b_next!25107))
