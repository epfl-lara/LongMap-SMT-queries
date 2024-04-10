; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97384 () Bool)

(assert start!97384)

(declare-fun b_free!23355 () Bool)

(declare-fun b_next!23355 () Bool)

(assert (=> start!97384 (= b_free!23355 (not b_next!23355))))

(declare-fun tp!82364 () Bool)

(declare-fun b_and!37545 () Bool)

(assert (=> start!97384 (= tp!82364 b_and!37545)))

(declare-fun b!1110269 () Bool)

(declare-fun e!633210 () Bool)

(declare-fun tp_is_empty!27615 () Bool)

(assert (=> b!1110269 (= e!633210 tp_is_empty!27615)))

(declare-fun b!1110270 () Bool)

(declare-fun res!740930 () Bool)

(declare-fun e!633212 () Bool)

(assert (=> b!1110270 (=> (not res!740930) (not e!633212))))

(declare-datatypes ((array!72147 0))(
  ( (array!72148 (arr!34726 (Array (_ BitVec 32) (_ BitVec 64))) (size!35262 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72147)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1110270 (= res!740930 (= (select (arr!34726 _keys!1208) i!673) k0!934))))

(declare-fun res!740925 () Bool)

(assert (=> start!97384 (=> (not res!740925) (not e!633212))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97384 (= res!740925 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35262 _keys!1208))))))

(assert (=> start!97384 e!633212))

(assert (=> start!97384 tp_is_empty!27615))

(declare-fun array_inv!26720 (array!72147) Bool)

(assert (=> start!97384 (array_inv!26720 _keys!1208)))

(assert (=> start!97384 true))

(assert (=> start!97384 tp!82364))

(declare-datatypes ((V!41947 0))(
  ( (V!41948 (val!13864 Int)) )
))
(declare-datatypes ((ValueCell!13098 0))(
  ( (ValueCellFull!13098 (v!16497 V!41947)) (EmptyCell!13098) )
))
(declare-datatypes ((array!72149 0))(
  ( (array!72150 (arr!34727 (Array (_ BitVec 32) ValueCell!13098)) (size!35263 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72149)

(declare-fun e!633208 () Bool)

(declare-fun array_inv!26721 (array!72149) Bool)

(assert (=> start!97384 (and (array_inv!26721 _values!996) e!633208)))

(declare-fun zeroValue!944 () V!41947)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41947)

(declare-fun lt!496134 () array!72147)

(declare-fun bm!46758 () Bool)

(declare-datatypes ((tuple2!17532 0))(
  ( (tuple2!17533 (_1!8777 (_ BitVec 64)) (_2!8777 V!41947)) )
))
(declare-datatypes ((List!24216 0))(
  ( (Nil!24213) (Cons!24212 (h!25421 tuple2!17532) (t!34617 List!24216)) )
))
(declare-datatypes ((ListLongMap!15501 0))(
  ( (ListLongMap!15502 (toList!7766 List!24216)) )
))
(declare-fun call!46762 () ListLongMap!15501)

(declare-fun getCurrentListMapNoExtraKeys!4260 (array!72147 array!72149 (_ BitVec 32) (_ BitVec 32) V!41947 V!41947 (_ BitVec 32) Int) ListLongMap!15501)

(declare-fun dynLambda!2388 (Int (_ BitVec 64)) V!41947)

(assert (=> bm!46758 (= call!46762 (getCurrentListMapNoExtraKeys!4260 lt!496134 (array!72150 (store (arr!34727 _values!996) i!673 (ValueCellFull!13098 (dynLambda!2388 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35263 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110271 () Bool)

(declare-fun res!740924 () Bool)

(assert (=> b!1110271 (=> (not res!740924) (not e!633212))))

(assert (=> b!1110271 (= res!740924 (and (= (size!35263 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35262 _keys!1208) (size!35263 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110272 () Bool)

(declare-fun e!633211 () Bool)

(assert (=> b!1110272 (= e!633211 true)))

(declare-fun e!633207 () Bool)

(assert (=> b!1110272 e!633207))

(declare-fun c!109224 () Bool)

(assert (=> b!1110272 (= c!109224 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36438 0))(
  ( (Unit!36439) )
))
(declare-fun lt!496136 () Unit!36438)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 (array!72147 array!72149 (_ BitVec 32) (_ BitVec 32) V!41947 V!41947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36438)

(assert (=> b!1110272 (= lt!496136 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110273 () Bool)

(declare-fun e!633213 () Bool)

(assert (=> b!1110273 (= e!633213 tp_is_empty!27615)))

(declare-fun b!1110274 () Bool)

(declare-fun call!46761 () ListLongMap!15501)

(declare-fun -!1039 (ListLongMap!15501 (_ BitVec 64)) ListLongMap!15501)

(assert (=> b!1110274 (= e!633207 (= call!46762 (-!1039 call!46761 k0!934)))))

(declare-fun mapIsEmpty!43240 () Bool)

(declare-fun mapRes!43240 () Bool)

(assert (=> mapIsEmpty!43240 mapRes!43240))

(declare-fun bm!46759 () Bool)

(assert (=> bm!46759 (= call!46761 (getCurrentListMapNoExtraKeys!4260 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43240 () Bool)

(declare-fun tp!82363 () Bool)

(assert (=> mapNonEmpty!43240 (= mapRes!43240 (and tp!82363 e!633213))))

(declare-fun mapKey!43240 () (_ BitVec 32))

(declare-fun mapValue!43240 () ValueCell!13098)

(declare-fun mapRest!43240 () (Array (_ BitVec 32) ValueCell!13098))

(assert (=> mapNonEmpty!43240 (= (arr!34727 _values!996) (store mapRest!43240 mapKey!43240 mapValue!43240))))

(declare-fun b!1110275 () Bool)

(declare-fun res!740932 () Bool)

(assert (=> b!1110275 (=> (not res!740932) (not e!633212))))

(assert (=> b!1110275 (= res!740932 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35262 _keys!1208))))))

(declare-fun b!1110276 () Bool)

(declare-fun e!633209 () Bool)

(assert (=> b!1110276 (= e!633209 (not e!633211))))

(declare-fun res!740927 () Bool)

(assert (=> b!1110276 (=> res!740927 e!633211)))

(assert (=> b!1110276 (= res!740927 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35262 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110276 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496135 () Unit!36438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72147 (_ BitVec 64) (_ BitVec 32)) Unit!36438)

(assert (=> b!1110276 (= lt!496135 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110277 () Bool)

(assert (=> b!1110277 (= e!633207 (= call!46762 call!46761))))

(declare-fun b!1110278 () Bool)

(assert (=> b!1110278 (= e!633212 e!633209)))

(declare-fun res!740931 () Bool)

(assert (=> b!1110278 (=> (not res!740931) (not e!633209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72147 (_ BitVec 32)) Bool)

(assert (=> b!1110278 (= res!740931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496134 mask!1564))))

(assert (=> b!1110278 (= lt!496134 (array!72148 (store (arr!34726 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35262 _keys!1208)))))

(declare-fun b!1110279 () Bool)

(declare-fun res!740922 () Bool)

(assert (=> b!1110279 (=> (not res!740922) (not e!633212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110279 (= res!740922 (validMask!0 mask!1564))))

(declare-fun b!1110280 () Bool)

(assert (=> b!1110280 (= e!633208 (and e!633210 mapRes!43240))))

(declare-fun condMapEmpty!43240 () Bool)

(declare-fun mapDefault!43240 () ValueCell!13098)

(assert (=> b!1110280 (= condMapEmpty!43240 (= (arr!34727 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13098)) mapDefault!43240)))))

(declare-fun b!1110281 () Bool)

(declare-fun res!740929 () Bool)

(assert (=> b!1110281 (=> (not res!740929) (not e!633209))))

(declare-datatypes ((List!24217 0))(
  ( (Nil!24214) (Cons!24213 (h!25422 (_ BitVec 64)) (t!34618 List!24217)) )
))
(declare-fun arrayNoDuplicates!0 (array!72147 (_ BitVec 32) List!24217) Bool)

(assert (=> b!1110281 (= res!740929 (arrayNoDuplicates!0 lt!496134 #b00000000000000000000000000000000 Nil!24214))))

(declare-fun b!1110282 () Bool)

(declare-fun res!740923 () Bool)

(assert (=> b!1110282 (=> (not res!740923) (not e!633212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110282 (= res!740923 (validKeyInArray!0 k0!934))))

(declare-fun b!1110283 () Bool)

(declare-fun res!740928 () Bool)

(assert (=> b!1110283 (=> (not res!740928) (not e!633212))))

(assert (=> b!1110283 (= res!740928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110284 () Bool)

(declare-fun res!740926 () Bool)

(assert (=> b!1110284 (=> (not res!740926) (not e!633212))))

(assert (=> b!1110284 (= res!740926 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24214))))

(assert (= (and start!97384 res!740925) b!1110279))

(assert (= (and b!1110279 res!740922) b!1110271))

(assert (= (and b!1110271 res!740924) b!1110283))

(assert (= (and b!1110283 res!740928) b!1110284))

(assert (= (and b!1110284 res!740926) b!1110275))

(assert (= (and b!1110275 res!740932) b!1110282))

(assert (= (and b!1110282 res!740923) b!1110270))

(assert (= (and b!1110270 res!740930) b!1110278))

(assert (= (and b!1110278 res!740931) b!1110281))

(assert (= (and b!1110281 res!740929) b!1110276))

(assert (= (and b!1110276 (not res!740927)) b!1110272))

(assert (= (and b!1110272 c!109224) b!1110274))

(assert (= (and b!1110272 (not c!109224)) b!1110277))

(assert (= (or b!1110274 b!1110277) bm!46758))

(assert (= (or b!1110274 b!1110277) bm!46759))

(assert (= (and b!1110280 condMapEmpty!43240) mapIsEmpty!43240))

(assert (= (and b!1110280 (not condMapEmpty!43240)) mapNonEmpty!43240))

(get-info :version)

(assert (= (and mapNonEmpty!43240 ((_ is ValueCellFull!13098) mapValue!43240)) b!1110273))

(assert (= (and b!1110280 ((_ is ValueCellFull!13098) mapDefault!43240)) b!1110269))

(assert (= start!97384 b!1110280))

(declare-fun b_lambda!18377 () Bool)

(assert (=> (not b_lambda!18377) (not bm!46758)))

(declare-fun t!34616 () Bool)

(declare-fun tb!8221 () Bool)

(assert (=> (and start!97384 (= defaultEntry!1004 defaultEntry!1004) t!34616) tb!8221))

(declare-fun result!17003 () Bool)

(assert (=> tb!8221 (= result!17003 tp_is_empty!27615)))

(assert (=> bm!46758 t!34616))

(declare-fun b_and!37547 () Bool)

(assert (= b_and!37545 (and (=> t!34616 result!17003) b_and!37547)))

(declare-fun m!1028347 () Bool)

(assert (=> bm!46759 m!1028347))

(declare-fun m!1028349 () Bool)

(assert (=> b!1110272 m!1028349))

(declare-fun m!1028351 () Bool)

(assert (=> b!1110283 m!1028351))

(declare-fun m!1028353 () Bool)

(assert (=> b!1110278 m!1028353))

(declare-fun m!1028355 () Bool)

(assert (=> b!1110278 m!1028355))

(declare-fun m!1028357 () Bool)

(assert (=> bm!46758 m!1028357))

(declare-fun m!1028359 () Bool)

(assert (=> bm!46758 m!1028359))

(declare-fun m!1028361 () Bool)

(assert (=> bm!46758 m!1028361))

(declare-fun m!1028363 () Bool)

(assert (=> b!1110282 m!1028363))

(declare-fun m!1028365 () Bool)

(assert (=> mapNonEmpty!43240 m!1028365))

(declare-fun m!1028367 () Bool)

(assert (=> b!1110279 m!1028367))

(declare-fun m!1028369 () Bool)

(assert (=> b!1110270 m!1028369))

(declare-fun m!1028371 () Bool)

(assert (=> b!1110281 m!1028371))

(declare-fun m!1028373 () Bool)

(assert (=> b!1110274 m!1028373))

(declare-fun m!1028375 () Bool)

(assert (=> b!1110284 m!1028375))

(declare-fun m!1028377 () Bool)

(assert (=> b!1110276 m!1028377))

(declare-fun m!1028379 () Bool)

(assert (=> b!1110276 m!1028379))

(declare-fun m!1028381 () Bool)

(assert (=> start!97384 m!1028381))

(declare-fun m!1028383 () Bool)

(assert (=> start!97384 m!1028383))

(check-sat (not b!1110283) (not b!1110276) (not b!1110284) (not b_lambda!18377) (not b!1110272) (not b!1110278) (not b!1110274) (not b!1110282) (not b_next!23355) (not start!97384) tp_is_empty!27615 (not bm!46759) (not mapNonEmpty!43240) (not bm!46758) (not b!1110281) (not b!1110279) b_and!37547)
(check-sat b_and!37547 (not b_next!23355))
