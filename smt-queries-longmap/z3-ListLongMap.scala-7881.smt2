; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98266 () Bool)

(assert start!98266)

(declare-fun b_free!23731 () Bool)

(declare-fun b_next!23731 () Bool)

(assert (=> start!98266 (= b_free!23731 (not b_next!23731))))

(declare-fun tp!83897 () Bool)

(declare-fun b_and!38255 () Bool)

(assert (=> start!98266 (= tp!83897 b_and!38255)))

(declare-fun b!1126335 () Bool)

(declare-fun e!641258 () Bool)

(declare-fun e!641267 () Bool)

(declare-fun mapRes!44209 () Bool)

(assert (=> b!1126335 (= e!641258 (and e!641267 mapRes!44209))))

(declare-fun condMapEmpty!44209 () Bool)

(declare-datatypes ((V!42809 0))(
  ( (V!42810 (val!14187 Int)) )
))
(declare-datatypes ((ValueCell!13421 0))(
  ( (ValueCellFull!13421 (v!16816 V!42809)) (EmptyCell!13421) )
))
(declare-datatypes ((array!73435 0))(
  ( (array!73436 (arr!35364 (Array (_ BitVec 32) ValueCell!13421)) (size!35901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73435)

(declare-fun mapDefault!44209 () ValueCell!13421)

(assert (=> b!1126335 (= condMapEmpty!44209 (= (arr!35364 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13421)) mapDefault!44209)))))

(declare-fun zeroValue!944 () V!42809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17840 0))(
  ( (tuple2!17841 (_1!8931 (_ BitVec 64)) (_2!8931 V!42809)) )
))
(declare-datatypes ((List!24629 0))(
  ( (Nil!24626) (Cons!24625 (h!25843 tuple2!17840) (t!35344 List!24629)) )
))
(declare-datatypes ((ListLongMap!15817 0))(
  ( (ListLongMap!15818 (toList!7924 List!24629)) )
))
(declare-fun call!47542 () ListLongMap!15817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47539 () Bool)

(declare-fun minValue!944 () V!42809)

(declare-fun lt!500198 () array!73435)

(declare-datatypes ((array!73437 0))(
  ( (array!73438 (arr!35365 (Array (_ BitVec 32) (_ BitVec 64))) (size!35902 (_ BitVec 32))) )
))
(declare-fun lt!500196 () array!73437)

(declare-fun getCurrentListMapNoExtraKeys!4449 (array!73437 array!73435 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) Int) ListLongMap!15817)

(assert (=> bm!47539 (= call!47542 (getCurrentListMapNoExtraKeys!4449 lt!500196 lt!500198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126336 () Bool)

(declare-fun res!752230 () Bool)

(declare-fun e!641259 () Bool)

(assert (=> b!1126336 (=> res!752230 e!641259)))

(assert (=> b!1126336 (= res!752230 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1126337 () Bool)

(declare-fun e!641263 () Bool)

(declare-fun e!641264 () Bool)

(assert (=> b!1126337 (= e!641263 e!641264)))

(declare-fun res!752239 () Bool)

(assert (=> b!1126337 (=> res!752239 e!641264)))

(declare-fun _keys!1208 () array!73437)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1126337 (= res!752239 (not (= (select (arr!35365 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641261 () Bool)

(assert (=> b!1126337 e!641261))

(declare-fun c!109997 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126337 (= c!109997 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36871 0))(
  ( (Unit!36872) )
))
(declare-fun lt!500200 () Unit!36871)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 (array!73437 array!73435 (_ BitVec 32) (_ BitVec 32) V!42809 V!42809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36871)

(assert (=> b!1126337 (= lt!500200 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126338 () Bool)

(declare-fun e!641265 () Bool)

(assert (=> b!1126338 (= e!641265 e!641263)))

(declare-fun res!752242 () Bool)

(assert (=> b!1126338 (=> res!752242 e!641263)))

(assert (=> b!1126338 (= res!752242 (not (= from!1455 i!673)))))

(declare-fun lt!500197 () ListLongMap!15817)

(assert (=> b!1126338 (= lt!500197 (getCurrentListMapNoExtraKeys!4449 lt!500196 lt!500198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2527 (Int (_ BitVec 64)) V!42809)

(assert (=> b!1126338 (= lt!500198 (array!73436 (store (arr!35364 _values!996) i!673 (ValueCellFull!13421 (dynLambda!2527 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35901 _values!996)))))

(declare-fun lt!500203 () ListLongMap!15817)

(assert (=> b!1126338 (= lt!500203 (getCurrentListMapNoExtraKeys!4449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!752240 () Bool)

(declare-fun e!641268 () Bool)

(assert (=> start!98266 (=> (not res!752240) (not e!641268))))

(assert (=> start!98266 (= res!752240 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35902 _keys!1208))))))

(assert (=> start!98266 e!641268))

(declare-fun tp_is_empty!28261 () Bool)

(assert (=> start!98266 tp_is_empty!28261))

(declare-fun array_inv!27202 (array!73437) Bool)

(assert (=> start!98266 (array_inv!27202 _keys!1208)))

(assert (=> start!98266 true))

(assert (=> start!98266 tp!83897))

(declare-fun array_inv!27203 (array!73435) Bool)

(assert (=> start!98266 (and (array_inv!27203 _values!996) e!641258)))

(declare-fun b!1126339 () Bool)

(declare-fun res!752232 () Bool)

(assert (=> b!1126339 (=> (not res!752232) (not e!641268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126339 (= res!752232 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44209 () Bool)

(assert (=> mapIsEmpty!44209 mapRes!44209))

(declare-fun b!1126340 () Bool)

(declare-fun res!752231 () Bool)

(assert (=> b!1126340 (=> (not res!752231) (not e!641268))))

(assert (=> b!1126340 (= res!752231 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35902 _keys!1208))))))

(declare-fun b!1126341 () Bool)

(declare-fun res!752234 () Bool)

(assert (=> b!1126341 (=> (not res!752234) (not e!641268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73437 (_ BitVec 32)) Bool)

(assert (=> b!1126341 (= res!752234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126342 () Bool)

(declare-fun e!641266 () Bool)

(assert (=> b!1126342 (= e!641268 e!641266)))

(declare-fun res!752237 () Bool)

(assert (=> b!1126342 (=> (not res!752237) (not e!641266))))

(assert (=> b!1126342 (= res!752237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500196 mask!1564))))

(assert (=> b!1126342 (= lt!500196 (array!73438 (store (arr!35365 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35902 _keys!1208)))))

(declare-fun call!47543 () ListLongMap!15817)

(declare-fun bm!47540 () Bool)

(assert (=> bm!47540 (= call!47543 (getCurrentListMapNoExtraKeys!4449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126343 () Bool)

(declare-fun res!752233 () Bool)

(assert (=> b!1126343 (=> (not res!752233) (not e!641268))))

(assert (=> b!1126343 (= res!752233 (= (select (arr!35365 _keys!1208) i!673) k0!934))))

(declare-fun b!1126344 () Bool)

(declare-fun res!752235 () Bool)

(assert (=> b!1126344 (=> (not res!752235) (not e!641268))))

(assert (=> b!1126344 (= res!752235 (and (= (size!35901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35902 _keys!1208) (size!35901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126345 () Bool)

(assert (=> b!1126345 (= e!641266 (not e!641265))))

(declare-fun res!752241 () Bool)

(assert (=> b!1126345 (=> res!752241 e!641265)))

(assert (=> b!1126345 (= res!752241 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126345 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500201 () Unit!36871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73437 (_ BitVec 64) (_ BitVec 32)) Unit!36871)

(assert (=> b!1126345 (= lt!500201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126346 () Bool)

(declare-fun res!752236 () Bool)

(assert (=> b!1126346 (=> (not res!752236) (not e!641268))))

(declare-datatypes ((List!24630 0))(
  ( (Nil!24627) (Cons!24626 (h!25844 (_ BitVec 64)) (t!35345 List!24630)) )
))
(declare-fun arrayNoDuplicates!0 (array!73437 (_ BitVec 32) List!24630) Bool)

(assert (=> b!1126346 (= res!752236 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24627))))

(declare-fun b!1126347 () Bool)

(assert (=> b!1126347 (= e!641261 (= call!47542 call!47543))))

(declare-fun mapNonEmpty!44209 () Bool)

(declare-fun tp!83896 () Bool)

(declare-fun e!641260 () Bool)

(assert (=> mapNonEmpty!44209 (= mapRes!44209 (and tp!83896 e!641260))))

(declare-fun mapKey!44209 () (_ BitVec 32))

(declare-fun mapRest!44209 () (Array (_ BitVec 32) ValueCell!13421))

(declare-fun mapValue!44209 () ValueCell!13421)

(assert (=> mapNonEmpty!44209 (= (arr!35364 _values!996) (store mapRest!44209 mapKey!44209 mapValue!44209))))

(declare-fun b!1126348 () Bool)

(assert (=> b!1126348 (= e!641259 true)))

(declare-fun lt!500202 () ListLongMap!15817)

(declare-fun contains!6475 (ListLongMap!15817 (_ BitVec 64)) Bool)

(declare-fun +!3452 (ListLongMap!15817 tuple2!17840) ListLongMap!15817)

(assert (=> b!1126348 (contains!6475 (+!3452 lt!500202 (tuple2!17841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!500199 () Unit!36871)

(declare-fun addStillContains!678 (ListLongMap!15817 (_ BitVec 64) V!42809 (_ BitVec 64)) Unit!36871)

(assert (=> b!1126348 (= lt!500199 (addStillContains!678 lt!500202 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1126349 () Bool)

(assert (=> b!1126349 (= e!641264 e!641259)))

(declare-fun res!752238 () Bool)

(assert (=> b!1126349 (=> res!752238 e!641259)))

(assert (=> b!1126349 (= res!752238 (not (contains!6475 lt!500202 k0!934)))))

(assert (=> b!1126349 (= lt!500202 (getCurrentListMapNoExtraKeys!4449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126350 () Bool)

(assert (=> b!1126350 (= e!641267 tp_is_empty!28261)))

(declare-fun b!1126351 () Bool)

(declare-fun res!752229 () Bool)

(assert (=> b!1126351 (=> (not res!752229) (not e!641268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126351 (= res!752229 (validKeyInArray!0 k0!934))))

(declare-fun b!1126352 () Bool)

(declare-fun -!1110 (ListLongMap!15817 (_ BitVec 64)) ListLongMap!15817)

(assert (=> b!1126352 (= e!641261 (= call!47542 (-!1110 call!47543 k0!934)))))

(declare-fun b!1126353 () Bool)

(assert (=> b!1126353 (= e!641260 tp_is_empty!28261)))

(declare-fun b!1126354 () Bool)

(declare-fun res!752228 () Bool)

(assert (=> b!1126354 (=> (not res!752228) (not e!641266))))

(assert (=> b!1126354 (= res!752228 (arrayNoDuplicates!0 lt!500196 #b00000000000000000000000000000000 Nil!24627))))

(assert (= (and start!98266 res!752240) b!1126339))

(assert (= (and b!1126339 res!752232) b!1126344))

(assert (= (and b!1126344 res!752235) b!1126341))

(assert (= (and b!1126341 res!752234) b!1126346))

(assert (= (and b!1126346 res!752236) b!1126340))

(assert (= (and b!1126340 res!752231) b!1126351))

(assert (= (and b!1126351 res!752229) b!1126343))

(assert (= (and b!1126343 res!752233) b!1126342))

(assert (= (and b!1126342 res!752237) b!1126354))

(assert (= (and b!1126354 res!752228) b!1126345))

(assert (= (and b!1126345 (not res!752241)) b!1126338))

(assert (= (and b!1126338 (not res!752242)) b!1126337))

(assert (= (and b!1126337 c!109997) b!1126352))

(assert (= (and b!1126337 (not c!109997)) b!1126347))

(assert (= (or b!1126352 b!1126347) bm!47539))

(assert (= (or b!1126352 b!1126347) bm!47540))

(assert (= (and b!1126337 (not res!752239)) b!1126349))

(assert (= (and b!1126349 (not res!752238)) b!1126336))

(assert (= (and b!1126336 (not res!752230)) b!1126348))

(assert (= (and b!1126335 condMapEmpty!44209) mapIsEmpty!44209))

(assert (= (and b!1126335 (not condMapEmpty!44209)) mapNonEmpty!44209))

(get-info :version)

(assert (= (and mapNonEmpty!44209 ((_ is ValueCellFull!13421) mapValue!44209)) b!1126353))

(assert (= (and b!1126335 ((_ is ValueCellFull!13421) mapDefault!44209)) b!1126350))

(assert (= start!98266 b!1126335))

(declare-fun b_lambda!18711 () Bool)

(assert (=> (not b_lambda!18711) (not b!1126338)))

(declare-fun t!35343 () Bool)

(declare-fun tb!8535 () Bool)

(assert (=> (and start!98266 (= defaultEntry!1004 defaultEntry!1004) t!35343) tb!8535))

(declare-fun result!17639 () Bool)

(assert (=> tb!8535 (= result!17639 tp_is_empty!28261)))

(assert (=> b!1126338 t!35343))

(declare-fun b_and!38257 () Bool)

(assert (= b_and!38255 (and (=> t!35343 result!17639) b_and!38257)))

(declare-fun m!1040885 () Bool)

(assert (=> b!1126341 m!1040885))

(declare-fun m!1040887 () Bool)

(assert (=> b!1126352 m!1040887))

(declare-fun m!1040889 () Bool)

(assert (=> b!1126348 m!1040889))

(assert (=> b!1126348 m!1040889))

(declare-fun m!1040891 () Bool)

(assert (=> b!1126348 m!1040891))

(declare-fun m!1040893 () Bool)

(assert (=> b!1126348 m!1040893))

(declare-fun m!1040895 () Bool)

(assert (=> b!1126346 m!1040895))

(declare-fun m!1040897 () Bool)

(assert (=> b!1126345 m!1040897))

(declare-fun m!1040899 () Bool)

(assert (=> b!1126345 m!1040899))

(declare-fun m!1040901 () Bool)

(assert (=> mapNonEmpty!44209 m!1040901))

(declare-fun m!1040903 () Bool)

(assert (=> b!1126339 m!1040903))

(declare-fun m!1040905 () Bool)

(assert (=> b!1126351 m!1040905))

(declare-fun m!1040907 () Bool)

(assert (=> start!98266 m!1040907))

(declare-fun m!1040909 () Bool)

(assert (=> start!98266 m!1040909))

(declare-fun m!1040911 () Bool)

(assert (=> b!1126338 m!1040911))

(declare-fun m!1040913 () Bool)

(assert (=> b!1126338 m!1040913))

(declare-fun m!1040915 () Bool)

(assert (=> b!1126338 m!1040915))

(declare-fun m!1040917 () Bool)

(assert (=> b!1126338 m!1040917))

(declare-fun m!1040919 () Bool)

(assert (=> b!1126342 m!1040919))

(declare-fun m!1040921 () Bool)

(assert (=> b!1126342 m!1040921))

(declare-fun m!1040923 () Bool)

(assert (=> bm!47539 m!1040923))

(declare-fun m!1040925 () Bool)

(assert (=> b!1126349 m!1040925))

(declare-fun m!1040927 () Bool)

(assert (=> b!1126349 m!1040927))

(assert (=> bm!47540 m!1040927))

(declare-fun m!1040929 () Bool)

(assert (=> b!1126337 m!1040929))

(declare-fun m!1040931 () Bool)

(assert (=> b!1126337 m!1040931))

(declare-fun m!1040933 () Bool)

(assert (=> b!1126354 m!1040933))

(declare-fun m!1040935 () Bool)

(assert (=> b!1126343 m!1040935))

(check-sat (not b!1126348) (not start!98266) (not b!1126349) (not b!1126338) (not bm!47540) (not b_next!23731) (not bm!47539) (not b!1126342) (not b!1126354) (not b_lambda!18711) (not b!1126339) b_and!38257 (not b!1126346) (not b!1126352) (not b!1126341) tp_is_empty!28261 (not mapNonEmpty!44209) (not b!1126337) (not b!1126351) (not b!1126345))
(check-sat b_and!38257 (not b_next!23731))
