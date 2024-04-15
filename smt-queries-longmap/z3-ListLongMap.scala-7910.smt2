; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98198 () Bool)

(assert start!98198)

(declare-fun b_free!23905 () Bool)

(declare-fun b_next!23905 () Bool)

(assert (=> start!98198 (= b_free!23905 (not b_next!23905))))

(declare-fun tp!84419 () Bool)

(declare-fun b_and!38571 () Bool)

(assert (=> start!98198 (= tp!84419 b_and!38571)))

(declare-fun b!1130267 () Bool)

(declare-fun call!48313 () Bool)

(assert (=> b!1130267 call!48313))

(declare-datatypes ((Unit!36870 0))(
  ( (Unit!36871) )
))
(declare-fun lt!501773 () Unit!36870)

(declare-fun call!48311 () Unit!36870)

(assert (=> b!1130267 (= lt!501773 call!48311)))

(declare-fun e!643237 () Unit!36870)

(assert (=> b!1130267 (= e!643237 lt!501773)))

(declare-fun mapNonEmpty!44470 () Bool)

(declare-fun mapRes!44470 () Bool)

(declare-fun tp!84418 () Bool)

(declare-fun e!643248 () Bool)

(assert (=> mapNonEmpty!44470 (= mapRes!44470 (and tp!84418 e!643248))))

(declare-datatypes ((V!43041 0))(
  ( (V!43042 (val!14274 Int)) )
))
(declare-datatypes ((ValueCell!13508 0))(
  ( (ValueCellFull!13508 (v!16906 V!43041)) (EmptyCell!13508) )
))
(declare-datatypes ((array!73650 0))(
  ( (array!73651 (arr!35478 (Array (_ BitVec 32) ValueCell!13508)) (size!36016 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73650)

(declare-fun mapRest!44470 () (Array (_ BitVec 32) ValueCell!13508))

(declare-fun mapValue!44470 () ValueCell!13508)

(declare-fun mapKey!44470 () (_ BitVec 32))

(assert (=> mapNonEmpty!44470 (= (arr!35478 _values!996) (store mapRest!44470 mapKey!44470 mapValue!44470))))

(declare-fun b!1130268 () Bool)

(declare-fun tp_is_empty!28435 () Bool)

(assert (=> b!1130268 (= e!643248 tp_is_empty!28435)))

(declare-fun b!1130269 () Bool)

(declare-fun res!755210 () Bool)

(declare-fun e!643238 () Bool)

(assert (=> b!1130269 (=> (not res!755210) (not e!643238))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73652 0))(
  ( (array!73653 (arr!35479 (Array (_ BitVec 32) (_ BitVec 64))) (size!36017 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73652)

(assert (=> b!1130269 (= res!755210 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36017 _keys!1208))))))

(declare-fun b!1130270 () Bool)

(declare-fun e!643249 () Bool)

(declare-fun e!643244 () Bool)

(assert (=> b!1130270 (= e!643249 e!643244)))

(declare-fun res!755222 () Bool)

(assert (=> b!1130270 (=> res!755222 e!643244)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1130270 (= res!755222 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43041)

(declare-fun lt!501768 () array!73652)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18068 0))(
  ( (tuple2!18069 (_1!9045 (_ BitVec 64)) (_2!9045 V!43041)) )
))
(declare-datatypes ((List!24819 0))(
  ( (Nil!24816) (Cons!24815 (h!26024 tuple2!18068) (t!35707 List!24819)) )
))
(declare-datatypes ((ListLongMap!16037 0))(
  ( (ListLongMap!16038 (toList!8034 List!24819)) )
))
(declare-fun lt!501775 () ListLongMap!16037)

(declare-fun lt!501766 () array!73650)

(declare-fun minValue!944 () V!43041)

(declare-fun getCurrentListMapNoExtraKeys!4533 (array!73652 array!73650 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!16037)

(assert (=> b!1130270 (= lt!501775 (getCurrentListMapNoExtraKeys!4533 lt!501768 lt!501766 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2538 (Int (_ BitVec 64)) V!43041)

(assert (=> b!1130270 (= lt!501766 (array!73651 (store (arr!35478 _values!996) i!673 (ValueCellFull!13508 (dynLambda!2538 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36016 _values!996)))))

(declare-fun lt!501771 () ListLongMap!16037)

(assert (=> b!1130270 (= lt!501771 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48308 () Bool)

(declare-fun call!48314 () ListLongMap!16037)

(declare-fun call!48315 () ListLongMap!16037)

(assert (=> bm!48308 (= call!48314 call!48315)))

(declare-fun b!1130271 () Bool)

(declare-fun e!643243 () Unit!36870)

(declare-fun Unit!36872 () Unit!36870)

(assert (=> b!1130271 (= e!643243 Unit!36872)))

(declare-fun bm!48309 () Bool)

(declare-fun c!109990 () Bool)

(declare-fun lt!501769 () ListLongMap!16037)

(declare-fun c!109989 () Bool)

(declare-fun +!3475 (ListLongMap!16037 tuple2!18068) ListLongMap!16037)

(assert (=> bm!48309 (= call!48315 (+!3475 lt!501769 (ite (or c!109990 c!109989) (tuple2!18069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130272 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!643250 () Bool)

(declare-fun call!48312 () ListLongMap!16037)

(declare-fun call!48310 () ListLongMap!16037)

(declare-fun -!1145 (ListLongMap!16037 (_ BitVec 64)) ListLongMap!16037)

(assert (=> b!1130272 (= e!643250 (= call!48312 (-!1145 call!48310 k0!934)))))

(declare-fun bm!48310 () Bool)

(declare-fun lt!501767 () ListLongMap!16037)

(declare-fun call!48316 () Unit!36870)

(declare-fun addStillContains!692 (ListLongMap!16037 (_ BitVec 64) V!43041 (_ BitVec 64)) Unit!36870)

(assert (=> bm!48310 (= call!48316 (addStillContains!692 (ite c!109990 lt!501767 lt!501769) (ite c!109990 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109989 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109990 minValue!944 (ite c!109989 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1130273 () Bool)

(declare-fun lt!501770 () Unit!36870)

(assert (=> b!1130273 (= e!643243 lt!501770)))

(assert (=> b!1130273 (= lt!501770 call!48311)))

(assert (=> b!1130273 call!48313))

(declare-fun b!1130274 () Bool)

(declare-fun e!643239 () Unit!36870)

(assert (=> b!1130274 (= e!643239 e!643237)))

(declare-fun lt!501777 () Bool)

(assert (=> b!1130274 (= c!109989 (and (not lt!501777) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!44470 () Bool)

(assert (=> mapIsEmpty!44470 mapRes!44470))

(declare-fun bm!48311 () Bool)

(assert (=> bm!48311 (= call!48311 call!48316)))

(declare-fun bm!48307 () Bool)

(declare-fun call!48317 () Bool)

(assert (=> bm!48307 (= call!48313 call!48317)))

(declare-fun res!755214 () Bool)

(assert (=> start!98198 (=> (not res!755214) (not e!643238))))

(assert (=> start!98198 (= res!755214 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36017 _keys!1208))))))

(assert (=> start!98198 e!643238))

(assert (=> start!98198 tp_is_empty!28435))

(declare-fun array_inv!27294 (array!73652) Bool)

(assert (=> start!98198 (array_inv!27294 _keys!1208)))

(assert (=> start!98198 true))

(assert (=> start!98198 tp!84419))

(declare-fun e!643251 () Bool)

(declare-fun array_inv!27295 (array!73650) Bool)

(assert (=> start!98198 (and (array_inv!27295 _values!996) e!643251)))

(declare-fun b!1130275 () Bool)

(declare-fun lt!501765 () Unit!36870)

(assert (=> b!1130275 (= e!643239 lt!501765)))

(declare-fun lt!501772 () Unit!36870)

(assert (=> b!1130275 (= lt!501772 (addStillContains!692 lt!501769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1130275 (= lt!501767 call!48315)))

(assert (=> b!1130275 call!48317))

(assert (=> b!1130275 (= lt!501765 call!48316)))

(declare-fun contains!6486 (ListLongMap!16037 (_ BitVec 64)) Bool)

(assert (=> b!1130275 (contains!6486 (+!3475 lt!501767 (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130276 () Bool)

(declare-fun e!643246 () Bool)

(assert (=> b!1130276 (= e!643251 (and e!643246 mapRes!44470))))

(declare-fun condMapEmpty!44470 () Bool)

(declare-fun mapDefault!44470 () ValueCell!13508)

(assert (=> b!1130276 (= condMapEmpty!44470 (= (arr!35478 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13508)) mapDefault!44470)))))

(declare-fun b!1130277 () Bool)

(declare-fun e!643240 () Bool)

(assert (=> b!1130277 (= e!643244 e!643240)))

(declare-fun res!755213 () Bool)

(assert (=> b!1130277 (=> res!755213 e!643240)))

(assert (=> b!1130277 (= res!755213 (not (= (select (arr!35479 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130277 e!643250))

(declare-fun c!109992 () Bool)

(assert (=> b!1130277 (= c!109992 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501774 () Unit!36870)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!427 (array!73652 array!73650 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36870)

(assert (=> b!1130277 (= lt!501774 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130278 () Bool)

(declare-fun res!755212 () Bool)

(assert (=> b!1130278 (=> (not res!755212) (not e!643238))))

(assert (=> b!1130278 (= res!755212 (and (= (size!36016 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36017 _keys!1208) (size!36016 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130279 () Bool)

(declare-fun res!755221 () Bool)

(assert (=> b!1130279 (=> (not res!755221) (not e!643238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130279 (= res!755221 (validMask!0 mask!1564))))

(declare-fun b!1130280 () Bool)

(declare-fun e!643241 () Bool)

(declare-fun e!643247 () Bool)

(assert (=> b!1130280 (= e!643241 e!643247)))

(declare-fun res!755216 () Bool)

(assert (=> b!1130280 (=> res!755216 e!643247)))

(assert (=> b!1130280 (= res!755216 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36017 _keys!1208))))))

(declare-fun lt!501764 () Unit!36870)

(assert (=> b!1130280 (= lt!501764 e!643239)))

(assert (=> b!1130280 (= c!109990 (and (not lt!501777) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130280 (= lt!501777 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130281 () Bool)

(declare-fun e!643245 () Bool)

(assert (=> b!1130281 (= e!643245 (not e!643249))))

(declare-fun res!755218 () Bool)

(assert (=> b!1130281 (=> res!755218 e!643249)))

(assert (=> b!1130281 (= res!755218 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130281 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501763 () Unit!36870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73652 (_ BitVec 64) (_ BitVec 32)) Unit!36870)

(assert (=> b!1130281 (= lt!501763 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130282 () Bool)

(assert (=> b!1130282 (= e!643250 (= call!48312 call!48310))))

(declare-fun b!1130283 () Bool)

(assert (=> b!1130283 (= e!643240 e!643241)))

(declare-fun res!755223 () Bool)

(assert (=> b!1130283 (=> res!755223 e!643241)))

(assert (=> b!1130283 (= res!755223 (not (contains!6486 lt!501769 k0!934)))))

(assert (=> b!1130283 (= lt!501769 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130284 () Bool)

(declare-fun res!755217 () Bool)

(assert (=> b!1130284 (=> (not res!755217) (not e!643245))))

(declare-datatypes ((List!24820 0))(
  ( (Nil!24817) (Cons!24816 (h!26025 (_ BitVec 64)) (t!35708 List!24820)) )
))
(declare-fun arrayNoDuplicates!0 (array!73652 (_ BitVec 32) List!24820) Bool)

(assert (=> b!1130284 (= res!755217 (arrayNoDuplicates!0 lt!501768 #b00000000000000000000000000000000 Nil!24817))))

(declare-fun b!1130285 () Bool)

(declare-fun res!755215 () Bool)

(assert (=> b!1130285 (=> (not res!755215) (not e!643238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73652 (_ BitVec 32)) Bool)

(assert (=> b!1130285 (= res!755215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130286 () Bool)

(declare-fun c!109991 () Bool)

(assert (=> b!1130286 (= c!109991 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501777))))

(assert (=> b!1130286 (= e!643237 e!643243)))

(declare-fun b!1130287 () Bool)

(assert (=> b!1130287 (= e!643247 true)))

(declare-fun lt!501776 () Bool)

(declare-fun getCurrentListMap!4362 (array!73652 array!73650 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!16037)

(assert (=> b!1130287 (= lt!501776 (contains!6486 (getCurrentListMap!4362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!48312 () Bool)

(assert (=> bm!48312 (= call!48312 (getCurrentListMapNoExtraKeys!4533 lt!501768 lt!501766 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48313 () Bool)

(assert (=> bm!48313 (= call!48317 (contains!6486 (ite c!109990 lt!501767 call!48314) k0!934))))

(declare-fun b!1130288 () Bool)

(assert (=> b!1130288 (= e!643238 e!643245)))

(declare-fun res!755220 () Bool)

(assert (=> b!1130288 (=> (not res!755220) (not e!643245))))

(assert (=> b!1130288 (= res!755220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501768 mask!1564))))

(assert (=> b!1130288 (= lt!501768 (array!73653 (store (arr!35479 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36017 _keys!1208)))))

(declare-fun b!1130289 () Bool)

(declare-fun res!755211 () Bool)

(assert (=> b!1130289 (=> (not res!755211) (not e!643238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130289 (= res!755211 (validKeyInArray!0 k0!934))))

(declare-fun bm!48314 () Bool)

(assert (=> bm!48314 (= call!48310 (getCurrentListMapNoExtraKeys!4533 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130290 () Bool)

(assert (=> b!1130290 (= e!643246 tp_is_empty!28435)))

(declare-fun b!1130291 () Bool)

(declare-fun res!755219 () Bool)

(assert (=> b!1130291 (=> (not res!755219) (not e!643238))))

(assert (=> b!1130291 (= res!755219 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24817))))

(declare-fun b!1130292 () Bool)

(declare-fun res!755224 () Bool)

(assert (=> b!1130292 (=> (not res!755224) (not e!643238))))

(assert (=> b!1130292 (= res!755224 (= (select (arr!35479 _keys!1208) i!673) k0!934))))

(assert (= (and start!98198 res!755214) b!1130279))

(assert (= (and b!1130279 res!755221) b!1130278))

(assert (= (and b!1130278 res!755212) b!1130285))

(assert (= (and b!1130285 res!755215) b!1130291))

(assert (= (and b!1130291 res!755219) b!1130269))

(assert (= (and b!1130269 res!755210) b!1130289))

(assert (= (and b!1130289 res!755211) b!1130292))

(assert (= (and b!1130292 res!755224) b!1130288))

(assert (= (and b!1130288 res!755220) b!1130284))

(assert (= (and b!1130284 res!755217) b!1130281))

(assert (= (and b!1130281 (not res!755218)) b!1130270))

(assert (= (and b!1130270 (not res!755222)) b!1130277))

(assert (= (and b!1130277 c!109992) b!1130272))

(assert (= (and b!1130277 (not c!109992)) b!1130282))

(assert (= (or b!1130272 b!1130282) bm!48312))

(assert (= (or b!1130272 b!1130282) bm!48314))

(assert (= (and b!1130277 (not res!755213)) b!1130283))

(assert (= (and b!1130283 (not res!755223)) b!1130280))

(assert (= (and b!1130280 c!109990) b!1130275))

(assert (= (and b!1130280 (not c!109990)) b!1130274))

(assert (= (and b!1130274 c!109989) b!1130267))

(assert (= (and b!1130274 (not c!109989)) b!1130286))

(assert (= (and b!1130286 c!109991) b!1130273))

(assert (= (and b!1130286 (not c!109991)) b!1130271))

(assert (= (or b!1130267 b!1130273) bm!48311))

(assert (= (or b!1130267 b!1130273) bm!48308))

(assert (= (or b!1130267 b!1130273) bm!48307))

(assert (= (or b!1130275 bm!48307) bm!48313))

(assert (= (or b!1130275 bm!48311) bm!48310))

(assert (= (or b!1130275 bm!48308) bm!48309))

(assert (= (and b!1130280 (not res!755216)) b!1130287))

(assert (= (and b!1130276 condMapEmpty!44470) mapIsEmpty!44470))

(assert (= (and b!1130276 (not condMapEmpty!44470)) mapNonEmpty!44470))

(get-info :version)

(assert (= (and mapNonEmpty!44470 ((_ is ValueCellFull!13508) mapValue!44470)) b!1130268))

(assert (= (and b!1130276 ((_ is ValueCellFull!13508) mapDefault!44470)) b!1130290))

(assert (= start!98198 b!1130276))

(declare-fun b_lambda!18857 () Bool)

(assert (=> (not b_lambda!18857) (not b!1130270)))

(declare-fun t!35706 () Bool)

(declare-fun tb!8709 () Bool)

(assert (=> (and start!98198 (= defaultEntry!1004 defaultEntry!1004) t!35706) tb!8709))

(declare-fun result!17987 () Bool)

(assert (=> tb!8709 (= result!17987 tp_is_empty!28435)))

(assert (=> b!1130270 t!35706))

(declare-fun b_and!38573 () Bool)

(assert (= b_and!38571 (and (=> t!35706 result!17987) b_and!38573)))

(declare-fun m!1042929 () Bool)

(assert (=> bm!48314 m!1042929))

(declare-fun m!1042931 () Bool)

(assert (=> b!1130287 m!1042931))

(assert (=> b!1130287 m!1042931))

(declare-fun m!1042933 () Bool)

(assert (=> b!1130287 m!1042933))

(declare-fun m!1042935 () Bool)

(assert (=> b!1130279 m!1042935))

(declare-fun m!1042937 () Bool)

(assert (=> b!1130291 m!1042937))

(declare-fun m!1042939 () Bool)

(assert (=> b!1130270 m!1042939))

(declare-fun m!1042941 () Bool)

(assert (=> b!1130270 m!1042941))

(declare-fun m!1042943 () Bool)

(assert (=> b!1130270 m!1042943))

(declare-fun m!1042945 () Bool)

(assert (=> b!1130270 m!1042945))

(declare-fun m!1042947 () Bool)

(assert (=> b!1130285 m!1042947))

(declare-fun m!1042949 () Bool)

(assert (=> bm!48312 m!1042949))

(declare-fun m!1042951 () Bool)

(assert (=> b!1130292 m!1042951))

(declare-fun m!1042953 () Bool)

(assert (=> b!1130277 m!1042953))

(declare-fun m!1042955 () Bool)

(assert (=> b!1130277 m!1042955))

(declare-fun m!1042957 () Bool)

(assert (=> b!1130289 m!1042957))

(declare-fun m!1042959 () Bool)

(assert (=> mapNonEmpty!44470 m!1042959))

(declare-fun m!1042961 () Bool)

(assert (=> b!1130275 m!1042961))

(declare-fun m!1042963 () Bool)

(assert (=> b!1130275 m!1042963))

(assert (=> b!1130275 m!1042963))

(declare-fun m!1042965 () Bool)

(assert (=> b!1130275 m!1042965))

(declare-fun m!1042967 () Bool)

(assert (=> b!1130272 m!1042967))

(declare-fun m!1042969 () Bool)

(assert (=> bm!48310 m!1042969))

(declare-fun m!1042971 () Bool)

(assert (=> bm!48313 m!1042971))

(declare-fun m!1042973 () Bool)

(assert (=> b!1130284 m!1042973))

(declare-fun m!1042975 () Bool)

(assert (=> b!1130288 m!1042975))

(declare-fun m!1042977 () Bool)

(assert (=> b!1130288 m!1042977))

(declare-fun m!1042979 () Bool)

(assert (=> b!1130283 m!1042979))

(assert (=> b!1130283 m!1042929))

(declare-fun m!1042981 () Bool)

(assert (=> start!98198 m!1042981))

(declare-fun m!1042983 () Bool)

(assert (=> start!98198 m!1042983))

(declare-fun m!1042985 () Bool)

(assert (=> b!1130281 m!1042985))

(declare-fun m!1042987 () Bool)

(assert (=> b!1130281 m!1042987))

(declare-fun m!1042989 () Bool)

(assert (=> bm!48309 m!1042989))

(check-sat (not b!1130288) (not b_next!23905) (not mapNonEmpty!44470) b_and!38573 (not bm!48313) (not b!1130272) (not b!1130284) (not bm!48312) (not bm!48309) (not b!1130277) (not b!1130275) (not b!1130285) (not start!98198) (not b!1130270) (not b!1130279) (not b!1130291) (not b_lambda!18857) (not b!1130289) (not b!1130281) (not b!1130283) (not b!1130287) (not bm!48314) (not bm!48310) tp_is_empty!28435)
(check-sat b_and!38573 (not b_next!23905))
