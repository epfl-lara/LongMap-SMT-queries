; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98848 () Bool)

(assert start!98848)

(declare-fun b_free!24217 () Bool)

(declare-fun b_next!24217 () Bool)

(assert (=> start!98848 (= b_free!24217 (not b_next!24217))))

(declare-fun tp!85362 () Bool)

(declare-fun b_and!39285 () Bool)

(assert (=> start!98848 (= tp!85362 b_and!39285)))

(declare-fun b!1146283 () Bool)

(declare-datatypes ((V!43457 0))(
  ( (V!43458 (val!14430 Int)) )
))
(declare-datatypes ((tuple2!18294 0))(
  ( (tuple2!18295 (_1!9158 (_ BitVec 64)) (_2!9158 V!43457)) )
))
(declare-datatypes ((List!25050 0))(
  ( (Nil!25047) (Cons!25046 (h!26264 tuple2!18294) (t!36251 List!25050)) )
))
(declare-datatypes ((ListLongMap!16271 0))(
  ( (ListLongMap!16272 (toList!8151 List!25050)) )
))
(declare-fun lt!511517 () ListLongMap!16271)

(declare-fun minValue!944 () V!43457)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6692 (ListLongMap!16271 (_ BitVec 64)) Bool)

(declare-fun +!3593 (ListLongMap!16271 tuple2!18294) ListLongMap!16271)

(assert (=> b!1146283 (contains!6692 (+!3593 lt!511517 (tuple2!18295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37571 0))(
  ( (Unit!37572) )
))
(declare-fun lt!511525 () Unit!37571)

(declare-fun addStillContains!819 (ListLongMap!16271 (_ BitVec 64) V!43457 (_ BitVec 64)) Unit!37571)

(assert (=> b!1146283 (= lt!511525 (addStillContains!819 lt!511517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52211 () Bool)

(assert (=> b!1146283 call!52211))

(declare-fun call!52218 () ListLongMap!16271)

(assert (=> b!1146283 (= lt!511517 call!52218)))

(declare-fun lt!511529 () Unit!37571)

(declare-fun call!52214 () Unit!37571)

(assert (=> b!1146283 (= lt!511529 call!52214)))

(declare-fun e!652165 () Unit!37571)

(assert (=> b!1146283 (= e!652165 lt!511525)))

(declare-fun b!1146284 () Bool)

(declare-fun e!652161 () Bool)

(declare-fun e!652150 () Bool)

(assert (=> b!1146284 (= e!652161 e!652150)))

(declare-fun res!763071 () Bool)

(assert (=> b!1146284 (=> (not res!763071) (not e!652150))))

(declare-datatypes ((array!74393 0))(
  ( (array!74394 (arr!35841 (Array (_ BitVec 32) (_ BitVec 64))) (size!36378 (_ BitVec 32))) )
))
(declare-fun lt!511524 () array!74393)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74393 (_ BitVec 32)) Bool)

(assert (=> b!1146284 (= res!763071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511524 mask!1564))))

(declare-fun _keys!1208 () array!74393)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146284 (= lt!511524 (array!74394 (store (arr!35841 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36378 _keys!1208)))))

(declare-fun b!1146285 () Bool)

(declare-fun res!763068 () Bool)

(assert (=> b!1146285 (=> (not res!763068) (not e!652150))))

(declare-datatypes ((List!25051 0))(
  ( (Nil!25048) (Cons!25047 (h!26265 (_ BitVec 64)) (t!36252 List!25051)) )
))
(declare-fun arrayNoDuplicates!0 (array!74393 (_ BitVec 32) List!25051) Bool)

(assert (=> b!1146285 (= res!763068 (arrayNoDuplicates!0 lt!511524 #b00000000000000000000000000000000 Nil!25048))))

(declare-fun bm!52208 () Bool)

(declare-fun call!52217 () Bool)

(assert (=> bm!52208 (= call!52217 call!52211)))

(declare-fun b!1146286 () Bool)

(declare-fun res!763062 () Bool)

(assert (=> b!1146286 (=> (not res!763062) (not e!652161))))

(assert (=> b!1146286 (= res!763062 (= (select (arr!35841 _keys!1208) i!673) k0!934))))

(declare-fun b!1146287 () Bool)

(declare-fun e!652160 () Unit!37571)

(declare-fun e!652158 () Unit!37571)

(assert (=> b!1146287 (= e!652160 e!652158)))

(declare-fun c!113210 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!511511 () Bool)

(assert (=> b!1146287 (= c!113210 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511511))))

(declare-fun b!1146288 () Bool)

(declare-fun e!652156 () Bool)

(declare-fun call!52212 () ListLongMap!16271)

(declare-fun call!52215 () ListLongMap!16271)

(assert (=> b!1146288 (= e!652156 (= call!52212 call!52215))))

(declare-fun bm!52209 () Bool)

(declare-fun call!52213 () Unit!37571)

(assert (=> bm!52209 (= call!52213 call!52214)))

(declare-fun e!652155 () Bool)

(declare-fun b!1146289 () Bool)

(assert (=> b!1146289 (= e!652155 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511511) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52210 () Bool)

(declare-fun call!52216 () ListLongMap!16271)

(assert (=> bm!52210 (= call!52216 call!52218)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13664 0))(
  ( (ValueCellFull!13664 (v!17063 V!43457)) (EmptyCell!13664) )
))
(declare-datatypes ((array!74395 0))(
  ( (array!74396 (arr!35842 (Array (_ BitVec 32) ValueCell!13664)) (size!36379 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74395)

(declare-fun c!113211 () Bool)

(declare-fun zeroValue!944 () V!43457)

(declare-fun lt!511522 () array!74395)

(declare-fun bm!52211 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4656 (array!74393 array!74395 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 32) Int) ListLongMap!16271)

(assert (=> bm!52211 (= call!52212 (getCurrentListMapNoExtraKeys!4656 (ite c!113211 _keys!1208 lt!511524) (ite c!113211 _values!996 lt!511522) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146290 () Bool)

(declare-fun e!652151 () Bool)

(declare-fun tp_is_empty!28747 () Bool)

(assert (=> b!1146290 (= e!652151 tp_is_empty!28747)))

(declare-fun b!1146291 () Bool)

(declare-fun e!652164 () Bool)

(declare-fun e!652152 () Bool)

(assert (=> b!1146291 (= e!652164 e!652152)))

(declare-fun res!763061 () Bool)

(assert (=> b!1146291 (=> res!763061 e!652152)))

(assert (=> b!1146291 (= res!763061 (not (= (select (arr!35841 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146291 e!652156))

(assert (=> b!1146291 (= c!113211 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511520 () Unit!37571)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 (array!74393 array!74395 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37571)

(assert (=> b!1146291 (= lt!511520 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146292 () Bool)

(declare-fun e!652159 () Unit!37571)

(declare-fun Unit!37573 () Unit!37571)

(assert (=> b!1146292 (= e!652159 Unit!37573)))

(declare-fun b!1146293 () Bool)

(declare-fun Unit!37574 () Unit!37571)

(assert (=> b!1146293 (= e!652158 Unit!37574)))

(declare-fun b!1146294 () Bool)

(assert (=> b!1146294 (= e!652152 true)))

(declare-fun e!652157 () Bool)

(assert (=> b!1146294 e!652157))

(declare-fun res!763066 () Bool)

(assert (=> b!1146294 (=> (not res!763066) (not e!652157))))

(declare-fun lt!511516 () ListLongMap!16271)

(declare-fun lt!511530 () V!43457)

(declare-fun -!1278 (ListLongMap!16271 (_ BitVec 64)) ListLongMap!16271)

(assert (=> b!1146294 (= res!763066 (= (-!1278 (+!3593 lt!511516 (tuple2!18295 (select (arr!35841 _keys!1208) from!1455) lt!511530)) (select (arr!35841 _keys!1208) from!1455)) lt!511516))))

(declare-fun lt!511518 () Unit!37571)

(declare-fun addThenRemoveForNewKeyIsSame!133 (ListLongMap!16271 (_ BitVec 64) V!43457) Unit!37571)

(assert (=> b!1146294 (= lt!511518 (addThenRemoveForNewKeyIsSame!133 lt!511516 (select (arr!35841 _keys!1208) from!1455) lt!511530))))

(declare-fun lt!511531 () V!43457)

(declare-fun get!18250 (ValueCell!13664 V!43457) V!43457)

(assert (=> b!1146294 (= lt!511530 (get!18250 (select (arr!35842 _values!996) from!1455) lt!511531))))

(declare-fun lt!511527 () Unit!37571)

(assert (=> b!1146294 (= lt!511527 e!652159)))

(declare-fun c!113213 () Bool)

(assert (=> b!1146294 (= c!113213 (contains!6692 lt!511516 k0!934))))

(assert (=> b!1146294 (= lt!511516 (getCurrentListMapNoExtraKeys!4656 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146295 () Bool)

(declare-fun e!652154 () Bool)

(assert (=> b!1146295 (= e!652154 e!652164)))

(declare-fun res!763063 () Bool)

(assert (=> b!1146295 (=> res!763063 e!652164)))

(assert (=> b!1146295 (= res!763063 (not (= from!1455 i!673)))))

(declare-fun lt!511523 () ListLongMap!16271)

(assert (=> b!1146295 (= lt!511523 (getCurrentListMapNoExtraKeys!4656 lt!511524 lt!511522 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146295 (= lt!511522 (array!74396 (store (arr!35842 _values!996) i!673 (ValueCellFull!13664 lt!511531)) (size!36379 _values!996)))))

(declare-fun dynLambda!2685 (Int (_ BitVec 64)) V!43457)

(assert (=> b!1146295 (= lt!511531 (dynLambda!2685 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511519 () ListLongMap!16271)

(assert (=> b!1146295 (= lt!511519 (getCurrentListMapNoExtraKeys!4656 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146296 () Bool)

(assert (=> b!1146296 (= e!652150 (not e!652154))))

(declare-fun res!763059 () Bool)

(assert (=> b!1146296 (=> res!763059 e!652154)))

(assert (=> b!1146296 (= res!763059 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146296 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511528 () Unit!37571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74393 (_ BitVec 64) (_ BitVec 32)) Unit!37571)

(assert (=> b!1146296 (= lt!511528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146297 () Bool)

(declare-fun e!652163 () Bool)

(assert (=> b!1146297 (= e!652163 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!113214 () Bool)

(declare-fun bm!52212 () Bool)

(declare-fun c!113209 () Bool)

(assert (=> bm!52212 (= call!52214 (addStillContains!819 lt!511516 (ite (or c!113214 c!113209) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113214 c!113209) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1146298 () Bool)

(assert (=> b!1146298 call!52217))

(declare-fun lt!511521 () Unit!37571)

(assert (=> b!1146298 (= lt!511521 call!52213)))

(assert (=> b!1146298 (= e!652158 lt!511521)))

(declare-fun b!1146299 () Bool)

(declare-fun lt!511513 () Unit!37571)

(assert (=> b!1146299 (= e!652160 lt!511513)))

(assert (=> b!1146299 (= lt!511513 call!52213)))

(assert (=> b!1146299 call!52217))

(declare-fun b!1146300 () Bool)

(assert (=> b!1146300 (= e!652157 (= (-!1278 lt!511519 k0!934) lt!511516))))

(declare-fun bm!52213 () Bool)

(assert (=> bm!52213 (= call!52215 (getCurrentListMapNoExtraKeys!4656 (ite c!113211 lt!511524 _keys!1208) (ite c!113211 lt!511522 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146301 () Bool)

(declare-fun res!763067 () Bool)

(assert (=> b!1146301 (=> (not res!763067) (not e!652161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146301 (= res!763067 (validMask!0 mask!1564))))

(declare-fun bm!52214 () Bool)

(assert (=> bm!52214 (= call!52211 (contains!6692 (ite c!113214 lt!511517 call!52216) k0!934))))

(declare-fun b!1146302 () Bool)

(assert (=> b!1146302 (= c!113209 (and (not lt!511511) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146302 (= e!652165 e!652160)))

(declare-fun b!1146303 () Bool)

(declare-fun res!763065 () Bool)

(assert (=> b!1146303 (=> (not res!763065) (not e!652161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146303 (= res!763065 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44945 () Bool)

(declare-fun mapRes!44945 () Bool)

(declare-fun tp!85361 () Bool)

(declare-fun e!652153 () Bool)

(assert (=> mapNonEmpty!44945 (= mapRes!44945 (and tp!85361 e!652153))))

(declare-fun mapKey!44945 () (_ BitVec 32))

(declare-fun mapRest!44945 () (Array (_ BitVec 32) ValueCell!13664))

(declare-fun mapValue!44945 () ValueCell!13664)

(assert (=> mapNonEmpty!44945 (= (arr!35842 _values!996) (store mapRest!44945 mapKey!44945 mapValue!44945))))

(declare-fun b!1146305 () Bool)

(declare-fun Unit!37575 () Unit!37571)

(assert (=> b!1146305 (= e!652159 Unit!37575)))

(assert (=> b!1146305 (= lt!511511 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146305 (= c!113214 (and (not lt!511511) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511526 () Unit!37571)

(assert (=> b!1146305 (= lt!511526 e!652165)))

(declare-fun lt!511514 () Unit!37571)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!417 (array!74393 array!74395 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 64) (_ BitVec 32) Int) Unit!37571)

(assert (=> b!1146305 (= lt!511514 (lemmaListMapContainsThenArrayContainsFrom!417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113212 () Bool)

(assert (=> b!1146305 (= c!113212 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763058 () Bool)

(assert (=> b!1146305 (= res!763058 e!652155)))

(assert (=> b!1146305 (=> (not res!763058) (not e!652163))))

(assert (=> b!1146305 e!652163))

(declare-fun lt!511515 () Unit!37571)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74393 (_ BitVec 32) (_ BitVec 32)) Unit!37571)

(assert (=> b!1146305 (= lt!511515 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146305 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25048)))

(declare-fun lt!511512 () Unit!37571)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74393 (_ BitVec 64) (_ BitVec 32) List!25051) Unit!37571)

(assert (=> b!1146305 (= lt!511512 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25048))))

(assert (=> b!1146305 false))

(declare-fun b!1146304 () Bool)

(declare-fun e!652149 () Bool)

(assert (=> b!1146304 (= e!652149 (and e!652151 mapRes!44945))))

(declare-fun condMapEmpty!44945 () Bool)

(declare-fun mapDefault!44945 () ValueCell!13664)

(assert (=> b!1146304 (= condMapEmpty!44945 (= (arr!35842 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13664)) mapDefault!44945)))))

(declare-fun res!763060 () Bool)

(assert (=> start!98848 (=> (not res!763060) (not e!652161))))

(assert (=> start!98848 (= res!763060 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36378 _keys!1208))))))

(assert (=> start!98848 e!652161))

(assert (=> start!98848 tp_is_empty!28747))

(declare-fun array_inv!27508 (array!74393) Bool)

(assert (=> start!98848 (array_inv!27508 _keys!1208)))

(assert (=> start!98848 true))

(assert (=> start!98848 tp!85362))

(declare-fun array_inv!27509 (array!74395) Bool)

(assert (=> start!98848 (and (array_inv!27509 _values!996) e!652149)))

(declare-fun b!1146306 () Bool)

(assert (=> b!1146306 (= e!652156 (= call!52215 (-!1278 call!52212 k0!934)))))

(declare-fun mapIsEmpty!44945 () Bool)

(assert (=> mapIsEmpty!44945 mapRes!44945))

(declare-fun b!1146307 () Bool)

(declare-fun res!763057 () Bool)

(assert (=> b!1146307 (=> (not res!763057) (not e!652161))))

(assert (=> b!1146307 (= res!763057 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25048))))

(declare-fun b!1146308 () Bool)

(declare-fun res!763069 () Bool)

(assert (=> b!1146308 (=> (not res!763069) (not e!652161))))

(assert (=> b!1146308 (= res!763069 (and (= (size!36379 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36378 _keys!1208) (size!36379 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146309 () Bool)

(assert (=> b!1146309 (= e!652153 tp_is_empty!28747)))

(declare-fun b!1146310 () Bool)

(assert (=> b!1146310 (= e!652155 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146311 () Bool)

(declare-fun res!763070 () Bool)

(assert (=> b!1146311 (=> (not res!763070) (not e!652161))))

(assert (=> b!1146311 (= res!763070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52215 () Bool)

(assert (=> bm!52215 (= call!52218 (+!3593 lt!511516 (ite (or c!113214 c!113209) (tuple2!18295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18295 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146312 () Bool)

(declare-fun res!763064 () Bool)

(assert (=> b!1146312 (=> (not res!763064) (not e!652161))))

(assert (=> b!1146312 (= res!763064 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36378 _keys!1208))))))

(assert (= (and start!98848 res!763060) b!1146301))

(assert (= (and b!1146301 res!763067) b!1146308))

(assert (= (and b!1146308 res!763069) b!1146311))

(assert (= (and b!1146311 res!763070) b!1146307))

(assert (= (and b!1146307 res!763057) b!1146312))

(assert (= (and b!1146312 res!763064) b!1146303))

(assert (= (and b!1146303 res!763065) b!1146286))

(assert (= (and b!1146286 res!763062) b!1146284))

(assert (= (and b!1146284 res!763071) b!1146285))

(assert (= (and b!1146285 res!763068) b!1146296))

(assert (= (and b!1146296 (not res!763059)) b!1146295))

(assert (= (and b!1146295 (not res!763063)) b!1146291))

(assert (= (and b!1146291 c!113211) b!1146306))

(assert (= (and b!1146291 (not c!113211)) b!1146288))

(assert (= (or b!1146306 b!1146288) bm!52211))

(assert (= (or b!1146306 b!1146288) bm!52213))

(assert (= (and b!1146291 (not res!763061)) b!1146294))

(assert (= (and b!1146294 c!113213) b!1146305))

(assert (= (and b!1146294 (not c!113213)) b!1146292))

(assert (= (and b!1146305 c!113214) b!1146283))

(assert (= (and b!1146305 (not c!113214)) b!1146302))

(assert (= (and b!1146302 c!113209) b!1146299))

(assert (= (and b!1146302 (not c!113209)) b!1146287))

(assert (= (and b!1146287 c!113210) b!1146298))

(assert (= (and b!1146287 (not c!113210)) b!1146293))

(assert (= (or b!1146299 b!1146298) bm!52209))

(assert (= (or b!1146299 b!1146298) bm!52210))

(assert (= (or b!1146299 b!1146298) bm!52208))

(assert (= (or b!1146283 bm!52208) bm!52214))

(assert (= (or b!1146283 bm!52209) bm!52212))

(assert (= (or b!1146283 bm!52210) bm!52215))

(assert (= (and b!1146305 c!113212) b!1146310))

(assert (= (and b!1146305 (not c!113212)) b!1146289))

(assert (= (and b!1146305 res!763058) b!1146297))

(assert (= (and b!1146294 res!763066) b!1146300))

(assert (= (and b!1146304 condMapEmpty!44945) mapIsEmpty!44945))

(assert (= (and b!1146304 (not condMapEmpty!44945)) mapNonEmpty!44945))

(get-info :version)

(assert (= (and mapNonEmpty!44945 ((_ is ValueCellFull!13664) mapValue!44945)) b!1146309))

(assert (= (and b!1146304 ((_ is ValueCellFull!13664) mapDefault!44945)) b!1146290))

(assert (= start!98848 b!1146304))

(declare-fun b_lambda!19317 () Bool)

(assert (=> (not b_lambda!19317) (not b!1146295)))

(declare-fun t!36250 () Bool)

(declare-fun tb!9021 () Bool)

(assert (=> (and start!98848 (= defaultEntry!1004 defaultEntry!1004) t!36250) tb!9021))

(declare-fun result!18615 () Bool)

(assert (=> tb!9021 (= result!18615 tp_is_empty!28747)))

(assert (=> b!1146295 t!36250))

(declare-fun b_and!39287 () Bool)

(assert (= b_and!39285 (and (=> t!36250 result!18615) b_and!39287)))

(declare-fun m!1057511 () Bool)

(assert (=> bm!52214 m!1057511))

(declare-fun m!1057513 () Bool)

(assert (=> b!1146301 m!1057513))

(declare-fun m!1057515 () Bool)

(assert (=> b!1146306 m!1057515))

(declare-fun m!1057517 () Bool)

(assert (=> b!1146297 m!1057517))

(declare-fun m!1057519 () Bool)

(assert (=> b!1146286 m!1057519))

(declare-fun m!1057521 () Bool)

(assert (=> bm!52215 m!1057521))

(declare-fun m!1057523 () Bool)

(assert (=> start!98848 m!1057523))

(declare-fun m!1057525 () Bool)

(assert (=> start!98848 m!1057525))

(declare-fun m!1057527 () Bool)

(assert (=> bm!52213 m!1057527))

(declare-fun m!1057529 () Bool)

(assert (=> b!1146291 m!1057529))

(declare-fun m!1057531 () Bool)

(assert (=> b!1146291 m!1057531))

(declare-fun m!1057533 () Bool)

(assert (=> b!1146311 m!1057533))

(assert (=> b!1146310 m!1057517))

(declare-fun m!1057535 () Bool)

(assert (=> b!1146307 m!1057535))

(declare-fun m!1057537 () Bool)

(assert (=> b!1146300 m!1057537))

(declare-fun m!1057539 () Bool)

(assert (=> b!1146294 m!1057539))

(assert (=> b!1146294 m!1057529))

(declare-fun m!1057541 () Bool)

(assert (=> b!1146294 m!1057541))

(declare-fun m!1057543 () Bool)

(assert (=> b!1146294 m!1057543))

(declare-fun m!1057545 () Bool)

(assert (=> b!1146294 m!1057545))

(declare-fun m!1057547 () Bool)

(assert (=> b!1146294 m!1057547))

(declare-fun m!1057549 () Bool)

(assert (=> b!1146294 m!1057549))

(assert (=> b!1146294 m!1057529))

(assert (=> b!1146294 m!1057543))

(assert (=> b!1146294 m!1057549))

(assert (=> b!1146294 m!1057529))

(declare-fun m!1057551 () Bool)

(assert (=> b!1146294 m!1057551))

(declare-fun m!1057553 () Bool)

(assert (=> b!1146305 m!1057553))

(declare-fun m!1057555 () Bool)

(assert (=> b!1146305 m!1057555))

(declare-fun m!1057557 () Bool)

(assert (=> b!1146305 m!1057557))

(declare-fun m!1057559 () Bool)

(assert (=> b!1146305 m!1057559))

(declare-fun m!1057561 () Bool)

(assert (=> b!1146303 m!1057561))

(declare-fun m!1057563 () Bool)

(assert (=> b!1146296 m!1057563))

(declare-fun m!1057565 () Bool)

(assert (=> b!1146296 m!1057565))

(declare-fun m!1057567 () Bool)

(assert (=> bm!52212 m!1057567))

(declare-fun m!1057569 () Bool)

(assert (=> b!1146285 m!1057569))

(declare-fun m!1057571 () Bool)

(assert (=> b!1146284 m!1057571))

(declare-fun m!1057573 () Bool)

(assert (=> b!1146284 m!1057573))

(declare-fun m!1057575 () Bool)

(assert (=> mapNonEmpty!44945 m!1057575))

(declare-fun m!1057577 () Bool)

(assert (=> b!1146283 m!1057577))

(assert (=> b!1146283 m!1057577))

(declare-fun m!1057579 () Bool)

(assert (=> b!1146283 m!1057579))

(declare-fun m!1057581 () Bool)

(assert (=> b!1146283 m!1057581))

(declare-fun m!1057583 () Bool)

(assert (=> b!1146295 m!1057583))

(declare-fun m!1057585 () Bool)

(assert (=> b!1146295 m!1057585))

(declare-fun m!1057587 () Bool)

(assert (=> b!1146295 m!1057587))

(declare-fun m!1057589 () Bool)

(assert (=> b!1146295 m!1057589))

(declare-fun m!1057591 () Bool)

(assert (=> bm!52211 m!1057591))

(check-sat (not b!1146294) (not b!1146306) (not b!1146300) (not bm!52213) (not mapNonEmpty!44945) (not b_next!24217) (not b!1146301) b_and!39287 (not b!1146283) (not b!1146303) (not b_lambda!19317) (not bm!52212) (not b!1146295) tp_is_empty!28747 (not b!1146296) (not b!1146291) (not b!1146305) (not b!1146297) (not b!1146310) (not b!1146311) (not bm!52211) (not bm!52214) (not bm!52215) (not b!1146307) (not b!1146284) (not b!1146285) (not start!98848))
(check-sat b_and!39287 (not b_next!24217))
