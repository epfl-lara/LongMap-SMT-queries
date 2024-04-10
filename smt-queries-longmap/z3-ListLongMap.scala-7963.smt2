; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98620 () Bool)

(assert start!98620)

(declare-fun b_free!24225 () Bool)

(declare-fun b_next!24225 () Bool)

(assert (=> start!98620 (= b_free!24225 (not b_next!24225))))

(declare-fun tp!85385 () Bool)

(declare-fun b_and!39299 () Bool)

(assert (=> start!98620 (= tp!85385 b_and!39299)))

(declare-fun b!1145362 () Bool)

(declare-datatypes ((Unit!37601 0))(
  ( (Unit!37602) )
))
(declare-fun e!651528 () Unit!37601)

(declare-fun Unit!37603 () Unit!37601)

(assert (=> b!1145362 (= e!651528 Unit!37603)))

(declare-fun lt!511297 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1145362 (= lt!511297 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112883 () Bool)

(assert (=> b!1145362 (= c!112883 (and (not lt!511297) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511293 () Unit!37601)

(declare-fun e!651534 () Unit!37601)

(assert (=> b!1145362 (= lt!511293 e!651534)))

(declare-datatypes ((V!43467 0))(
  ( (V!43468 (val!14434 Int)) )
))
(declare-fun zeroValue!944 () V!43467)

(declare-datatypes ((array!74361 0))(
  ( (array!74362 (arr!35831 (Array (_ BitVec 32) (_ BitVec 64))) (size!36367 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74361)

(declare-fun lt!511294 () Unit!37601)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13668 0))(
  ( (ValueCellFull!13668 (v!17071 V!43467)) (EmptyCell!13668) )
))
(declare-datatypes ((array!74363 0))(
  ( (array!74364 (arr!35832 (Array (_ BitVec 32) ValueCell!13668)) (size!36368 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74363)

(declare-fun minValue!944 () V!43467)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!415 (array!74361 array!74363 (_ BitVec 32) (_ BitVec 32) V!43467 V!43467 (_ BitVec 64) (_ BitVec 32) Int) Unit!37601)

(assert (=> b!1145362 (= lt!511294 (lemmaListMapContainsThenArrayContainsFrom!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112884 () Bool)

(assert (=> b!1145362 (= c!112884 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762732 () Bool)

(declare-fun e!651522 () Bool)

(assert (=> b!1145362 (= res!762732 e!651522)))

(declare-fun e!651521 () Bool)

(assert (=> b!1145362 (=> (not res!762732) (not e!651521))))

(assert (=> b!1145362 e!651521))

(declare-fun lt!511282 () Unit!37601)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74361 (_ BitVec 32) (_ BitVec 32)) Unit!37601)

(assert (=> b!1145362 (= lt!511282 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25035 0))(
  ( (Nil!25032) (Cons!25031 (h!26240 (_ BitVec 64)) (t!36252 List!25035)) )
))
(declare-fun arrayNoDuplicates!0 (array!74361 (_ BitVec 32) List!25035) Bool)

(assert (=> b!1145362 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25032)))

(declare-fun lt!511296 () Unit!37601)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74361 (_ BitVec 64) (_ BitVec 32) List!25035) Unit!37601)

(assert (=> b!1145362 (= lt!511296 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25032))))

(assert (=> b!1145362 false))

(declare-fun b!1145363 () Bool)

(declare-fun e!651529 () Bool)

(declare-fun e!651523 () Bool)

(assert (=> b!1145363 (= e!651529 e!651523)))

(declare-fun res!762733 () Bool)

(assert (=> b!1145363 (=> (not res!762733) (not e!651523))))

(declare-fun lt!511284 () array!74361)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74361 (_ BitVec 32)) Bool)

(assert (=> b!1145363 (= res!762733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511284 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145363 (= lt!511284 (array!74362 (store (arr!35831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36367 _keys!1208)))))

(declare-fun b!1145364 () Bool)

(declare-fun res!762736 () Bool)

(assert (=> b!1145364 (=> (not res!762736) (not e!651529))))

(assert (=> b!1145364 (= res!762736 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25032))))

(declare-fun b!1145365 () Bool)

(declare-datatypes ((tuple2!18282 0))(
  ( (tuple2!18283 (_1!9152 (_ BitVec 64)) (_2!9152 V!43467)) )
))
(declare-datatypes ((List!25036 0))(
  ( (Nil!25033) (Cons!25032 (h!26241 tuple2!18282) (t!36253 List!25036)) )
))
(declare-datatypes ((ListLongMap!16251 0))(
  ( (ListLongMap!16252 (toList!8141 List!25036)) )
))
(declare-fun lt!511292 () ListLongMap!16251)

(declare-fun contains!6669 (ListLongMap!16251 (_ BitVec 64)) Bool)

(declare-fun +!3567 (ListLongMap!16251 tuple2!18282) ListLongMap!16251)

(assert (=> b!1145365 (contains!6669 (+!3567 lt!511292 (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511289 () Unit!37601)

(declare-fun call!52243 () Unit!37601)

(assert (=> b!1145365 (= lt!511289 call!52243)))

(declare-fun call!52244 () Bool)

(assert (=> b!1145365 call!52244))

(declare-fun call!52246 () ListLongMap!16251)

(assert (=> b!1145365 (= lt!511292 call!52246)))

(declare-fun lt!511298 () ListLongMap!16251)

(declare-fun lt!511280 () Unit!37601)

(declare-fun addStillContains!821 (ListLongMap!16251 (_ BitVec 64) V!43467 (_ BitVec 64)) Unit!37601)

(assert (=> b!1145365 (= lt!511280 (addStillContains!821 lt!511298 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1145365 (= e!651534 lt!511289)))

(declare-fun b!1145366 () Bool)

(declare-fun e!651524 () Bool)

(declare-fun tp_is_empty!28755 () Bool)

(assert (=> b!1145366 (= e!651524 tp_is_empty!28755)))

(declare-fun b!1145367 () Bool)

(declare-fun Unit!37604 () Unit!37601)

(assert (=> b!1145367 (= e!651528 Unit!37604)))

(declare-fun bm!52239 () Bool)

(declare-fun c!112885 () Bool)

(assert (=> bm!52239 (= call!52246 (+!3567 lt!511298 (ite (or c!112883 c!112885) (tuple2!18283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!651536 () Bool)

(declare-fun lt!511285 () ListLongMap!16251)

(declare-fun b!1145368 () Bool)

(declare-fun -!1282 (ListLongMap!16251 (_ BitVec 64)) ListLongMap!16251)

(assert (=> b!1145368 (= e!651536 (= (-!1282 lt!511285 k0!934) lt!511298))))

(declare-fun b!1145369 () Bool)

(declare-fun e!651527 () Unit!37601)

(declare-fun lt!511291 () Unit!37601)

(assert (=> b!1145369 (= e!651527 lt!511291)))

(declare-fun call!52247 () Unit!37601)

(assert (=> b!1145369 (= lt!511291 call!52247)))

(declare-fun call!52245 () Bool)

(assert (=> b!1145369 call!52245))

(declare-fun b!1145371 () Bool)

(declare-fun res!762740 () Bool)

(assert (=> b!1145371 (=> (not res!762740) (not e!651529))))

(assert (=> b!1145371 (= res!762740 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36367 _keys!1208))))))

(declare-fun b!1145372 () Bool)

(declare-fun res!762738 () Bool)

(assert (=> b!1145372 (=> (not res!762738) (not e!651529))))

(assert (=> b!1145372 (= res!762738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52240 () Bool)

(assert (=> bm!52240 (= call!52243 (addStillContains!821 (ite c!112883 lt!511292 lt!511298) (ite c!112883 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112885 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112883 minValue!944 (ite c!112885 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1145373 () Bool)

(declare-fun e!651535 () Bool)

(declare-fun call!52242 () ListLongMap!16251)

(declare-fun call!52248 () ListLongMap!16251)

(assert (=> b!1145373 (= e!651535 (= call!52242 call!52248))))

(declare-fun bm!52241 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4617 (array!74361 array!74363 (_ BitVec 32) (_ BitVec 32) V!43467 V!43467 (_ BitVec 32) Int) ListLongMap!16251)

(assert (=> bm!52241 (= call!52248 (getCurrentListMapNoExtraKeys!4617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145374 () Bool)

(assert (=> b!1145374 call!52245))

(declare-fun lt!511295 () Unit!37601)

(assert (=> b!1145374 (= lt!511295 call!52247)))

(declare-fun e!651537 () Unit!37601)

(assert (=> b!1145374 (= e!651537 lt!511295)))

(declare-fun b!1145375 () Bool)

(declare-fun e!651525 () Bool)

(assert (=> b!1145375 (= e!651523 (not e!651525))))

(declare-fun res!762741 () Bool)

(assert (=> b!1145375 (=> res!762741 e!651525)))

(assert (=> b!1145375 (= res!762741 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145375 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511299 () Unit!37601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74361 (_ BitVec 64) (_ BitVec 32)) Unit!37601)

(assert (=> b!1145375 (= lt!511299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145376 () Bool)

(assert (=> b!1145376 (= e!651527 e!651537)))

(declare-fun c!112887 () Bool)

(assert (=> b!1145376 (= c!112887 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511297))))

(declare-fun res!762735 () Bool)

(assert (=> start!98620 (=> (not res!762735) (not e!651529))))

(assert (=> start!98620 (= res!762735 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36367 _keys!1208))))))

(assert (=> start!98620 e!651529))

(assert (=> start!98620 tp_is_empty!28755))

(declare-fun array_inv!27452 (array!74361) Bool)

(assert (=> start!98620 (array_inv!27452 _keys!1208)))

(assert (=> start!98620 true))

(assert (=> start!98620 tp!85385))

(declare-fun e!651533 () Bool)

(declare-fun array_inv!27453 (array!74363) Bool)

(assert (=> start!98620 (and (array_inv!27453 _values!996) e!651533)))

(declare-fun b!1145370 () Bool)

(declare-fun e!651532 () Bool)

(assert (=> b!1145370 (= e!651532 true)))

(assert (=> b!1145370 e!651536))

(declare-fun res!762742 () Bool)

(assert (=> b!1145370 (=> (not res!762742) (not e!651536))))

(declare-fun lt!511290 () V!43467)

(assert (=> b!1145370 (= res!762742 (= (-!1282 (+!3567 lt!511298 (tuple2!18283 (select (arr!35831 _keys!1208) from!1455) lt!511290)) (select (arr!35831 _keys!1208) from!1455)) lt!511298))))

(declare-fun lt!511288 () Unit!37601)

(declare-fun addThenRemoveForNewKeyIsSame!132 (ListLongMap!16251 (_ BitVec 64) V!43467) Unit!37601)

(assert (=> b!1145370 (= lt!511288 (addThenRemoveForNewKeyIsSame!132 lt!511298 (select (arr!35831 _keys!1208) from!1455) lt!511290))))

(declare-fun lt!511286 () V!43467)

(declare-fun get!18220 (ValueCell!13668 V!43467) V!43467)

(assert (=> b!1145370 (= lt!511290 (get!18220 (select (arr!35832 _values!996) from!1455) lt!511286))))

(declare-fun lt!511283 () Unit!37601)

(assert (=> b!1145370 (= lt!511283 e!651528)))

(declare-fun c!112888 () Bool)

(assert (=> b!1145370 (= c!112888 (contains!6669 lt!511298 k0!934))))

(assert (=> b!1145370 (= lt!511298 (getCurrentListMapNoExtraKeys!4617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!511281 () array!74363)

(declare-fun bm!52242 () Bool)

(assert (=> bm!52242 (= call!52242 (getCurrentListMapNoExtraKeys!4617 lt!511284 lt!511281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145377 () Bool)

(declare-fun e!651531 () Bool)

(assert (=> b!1145377 (= e!651531 tp_is_empty!28755)))

(declare-fun bm!52243 () Bool)

(assert (=> bm!52243 (= call!52247 call!52243)))

(declare-fun b!1145378 () Bool)

(declare-fun e!651530 () Bool)

(assert (=> b!1145378 (= e!651530 e!651532)))

(declare-fun res!762729 () Bool)

(assert (=> b!1145378 (=> res!762729 e!651532)))

(assert (=> b!1145378 (= res!762729 (not (= (select (arr!35831 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145378 e!651535))

(declare-fun c!112886 () Bool)

(assert (=> b!1145378 (= c!112886 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511287 () Unit!37601)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!522 (array!74361 array!74363 (_ BitVec 32) (_ BitVec 32) V!43467 V!43467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37601)

(assert (=> b!1145378 (= lt!511287 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145379 () Bool)

(assert (=> b!1145379 (= e!651522 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511297) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145380 () Bool)

(declare-fun res!762730 () Bool)

(assert (=> b!1145380 (=> (not res!762730) (not e!651529))))

(assert (=> b!1145380 (= res!762730 (and (= (size!36368 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36367 _keys!1208) (size!36368 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145381 () Bool)

(declare-fun Unit!37605 () Unit!37601)

(assert (=> b!1145381 (= e!651537 Unit!37605)))

(declare-fun bm!52244 () Bool)

(assert (=> bm!52244 (= call!52245 call!52244)))

(declare-fun b!1145382 () Bool)

(declare-fun res!762743 () Bool)

(assert (=> b!1145382 (=> (not res!762743) (not e!651529))))

(assert (=> b!1145382 (= res!762743 (= (select (arr!35831 _keys!1208) i!673) k0!934))))

(declare-fun b!1145383 () Bool)

(declare-fun res!762739 () Bool)

(assert (=> b!1145383 (=> (not res!762739) (not e!651529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145383 (= res!762739 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44957 () Bool)

(declare-fun mapRes!44957 () Bool)

(declare-fun tp!85386 () Bool)

(assert (=> mapNonEmpty!44957 (= mapRes!44957 (and tp!85386 e!651524))))

(declare-fun mapKey!44957 () (_ BitVec 32))

(declare-fun mapValue!44957 () ValueCell!13668)

(declare-fun mapRest!44957 () (Array (_ BitVec 32) ValueCell!13668))

(assert (=> mapNonEmpty!44957 (= (arr!35832 _values!996) (store mapRest!44957 mapKey!44957 mapValue!44957))))

(declare-fun b!1145384 () Bool)

(assert (=> b!1145384 (= e!651535 (= call!52242 (-!1282 call!52248 k0!934)))))

(declare-fun b!1145385 () Bool)

(declare-fun res!762731 () Bool)

(assert (=> b!1145385 (=> (not res!762731) (not e!651529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145385 (= res!762731 (validKeyInArray!0 k0!934))))

(declare-fun b!1145386 () Bool)

(assert (=> b!1145386 (= e!651525 e!651530)))

(declare-fun res!762737 () Bool)

(assert (=> b!1145386 (=> res!762737 e!651530)))

(assert (=> b!1145386 (= res!762737 (not (= from!1455 i!673)))))

(declare-fun lt!511279 () ListLongMap!16251)

(assert (=> b!1145386 (= lt!511279 (getCurrentListMapNoExtraKeys!4617 lt!511284 lt!511281 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145386 (= lt!511281 (array!74364 (store (arr!35832 _values!996) i!673 (ValueCellFull!13668 lt!511286)) (size!36368 _values!996)))))

(declare-fun dynLambda!2653 (Int (_ BitVec 64)) V!43467)

(assert (=> b!1145386 (= lt!511286 (dynLambda!2653 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1145386 (= lt!511285 (getCurrentListMapNoExtraKeys!4617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145387 () Bool)

(assert (=> b!1145387 (= c!112885 (and (not lt!511297) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145387 (= e!651534 e!651527)))

(declare-fun mapIsEmpty!44957 () Bool)

(assert (=> mapIsEmpty!44957 mapRes!44957))

(declare-fun bm!52245 () Bool)

(declare-fun call!52249 () ListLongMap!16251)

(assert (=> bm!52245 (= call!52249 call!52246)))

(declare-fun b!1145388 () Bool)

(assert (=> b!1145388 (= e!651522 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145389 () Bool)

(assert (=> b!1145389 (= e!651533 (and e!651531 mapRes!44957))))

(declare-fun condMapEmpty!44957 () Bool)

(declare-fun mapDefault!44957 () ValueCell!13668)

(assert (=> b!1145389 (= condMapEmpty!44957 (= (arr!35832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13668)) mapDefault!44957)))))

(declare-fun bm!52246 () Bool)

(assert (=> bm!52246 (= call!52244 (contains!6669 (ite c!112883 lt!511292 call!52249) k0!934))))

(declare-fun b!1145390 () Bool)

(declare-fun res!762734 () Bool)

(assert (=> b!1145390 (=> (not res!762734) (not e!651523))))

(assert (=> b!1145390 (= res!762734 (arrayNoDuplicates!0 lt!511284 #b00000000000000000000000000000000 Nil!25032))))

(declare-fun b!1145391 () Bool)

(assert (=> b!1145391 (= e!651521 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98620 res!762735) b!1145383))

(assert (= (and b!1145383 res!762739) b!1145380))

(assert (= (and b!1145380 res!762730) b!1145372))

(assert (= (and b!1145372 res!762738) b!1145364))

(assert (= (and b!1145364 res!762736) b!1145371))

(assert (= (and b!1145371 res!762740) b!1145385))

(assert (= (and b!1145385 res!762731) b!1145382))

(assert (= (and b!1145382 res!762743) b!1145363))

(assert (= (and b!1145363 res!762733) b!1145390))

(assert (= (and b!1145390 res!762734) b!1145375))

(assert (= (and b!1145375 (not res!762741)) b!1145386))

(assert (= (and b!1145386 (not res!762737)) b!1145378))

(assert (= (and b!1145378 c!112886) b!1145384))

(assert (= (and b!1145378 (not c!112886)) b!1145373))

(assert (= (or b!1145384 b!1145373) bm!52242))

(assert (= (or b!1145384 b!1145373) bm!52241))

(assert (= (and b!1145378 (not res!762729)) b!1145370))

(assert (= (and b!1145370 c!112888) b!1145362))

(assert (= (and b!1145370 (not c!112888)) b!1145367))

(assert (= (and b!1145362 c!112883) b!1145365))

(assert (= (and b!1145362 (not c!112883)) b!1145387))

(assert (= (and b!1145387 c!112885) b!1145369))

(assert (= (and b!1145387 (not c!112885)) b!1145376))

(assert (= (and b!1145376 c!112887) b!1145374))

(assert (= (and b!1145376 (not c!112887)) b!1145381))

(assert (= (or b!1145369 b!1145374) bm!52243))

(assert (= (or b!1145369 b!1145374) bm!52245))

(assert (= (or b!1145369 b!1145374) bm!52244))

(assert (= (or b!1145365 bm!52244) bm!52246))

(assert (= (or b!1145365 bm!52243) bm!52240))

(assert (= (or b!1145365 bm!52245) bm!52239))

(assert (= (and b!1145362 c!112884) b!1145388))

(assert (= (and b!1145362 (not c!112884)) b!1145379))

(assert (= (and b!1145362 res!762732) b!1145391))

(assert (= (and b!1145370 res!762742) b!1145368))

(assert (= (and b!1145389 condMapEmpty!44957) mapIsEmpty!44957))

(assert (= (and b!1145389 (not condMapEmpty!44957)) mapNonEmpty!44957))

(get-info :version)

(assert (= (and mapNonEmpty!44957 ((_ is ValueCellFull!13668) mapValue!44957)) b!1145366))

(assert (= (and b!1145389 ((_ is ValueCellFull!13668) mapDefault!44957)) b!1145377))

(assert (= start!98620 b!1145389))

(declare-fun b_lambda!19331 () Bool)

(assert (=> (not b_lambda!19331) (not b!1145386)))

(declare-fun t!36251 () Bool)

(declare-fun tb!9037 () Bool)

(assert (=> (and start!98620 (= defaultEntry!1004 defaultEntry!1004) t!36251) tb!9037))

(declare-fun result!18639 () Bool)

(assert (=> tb!9037 (= result!18639 tp_is_empty!28755)))

(assert (=> b!1145386 t!36251))

(declare-fun b_and!39301 () Bool)

(assert (= b_and!39299 (and (=> t!36251 result!18639) b_and!39301)))

(declare-fun m!1056259 () Bool)

(assert (=> b!1145365 m!1056259))

(assert (=> b!1145365 m!1056259))

(declare-fun m!1056261 () Bool)

(assert (=> b!1145365 m!1056261))

(declare-fun m!1056263 () Bool)

(assert (=> b!1145365 m!1056263))

(declare-fun m!1056265 () Bool)

(assert (=> b!1145375 m!1056265))

(declare-fun m!1056267 () Bool)

(assert (=> b!1145375 m!1056267))

(declare-fun m!1056269 () Bool)

(assert (=> b!1145368 m!1056269))

(declare-fun m!1056271 () Bool)

(assert (=> b!1145363 m!1056271))

(declare-fun m!1056273 () Bool)

(assert (=> b!1145363 m!1056273))

(declare-fun m!1056275 () Bool)

(assert (=> bm!52241 m!1056275))

(declare-fun m!1056277 () Bool)

(assert (=> b!1145384 m!1056277))

(declare-fun m!1056279 () Bool)

(assert (=> b!1145391 m!1056279))

(declare-fun m!1056281 () Bool)

(assert (=> bm!52240 m!1056281))

(declare-fun m!1056283 () Bool)

(assert (=> bm!52239 m!1056283))

(declare-fun m!1056285 () Bool)

(assert (=> b!1145364 m!1056285))

(declare-fun m!1056287 () Bool)

(assert (=> b!1145382 m!1056287))

(declare-fun m!1056289 () Bool)

(assert (=> start!98620 m!1056289))

(declare-fun m!1056291 () Bool)

(assert (=> start!98620 m!1056291))

(declare-fun m!1056293 () Bool)

(assert (=> b!1145383 m!1056293))

(declare-fun m!1056295 () Bool)

(assert (=> bm!52246 m!1056295))

(declare-fun m!1056297 () Bool)

(assert (=> b!1145378 m!1056297))

(declare-fun m!1056299 () Bool)

(assert (=> b!1145378 m!1056299))

(declare-fun m!1056301 () Bool)

(assert (=> b!1145362 m!1056301))

(declare-fun m!1056303 () Bool)

(assert (=> b!1145362 m!1056303))

(declare-fun m!1056305 () Bool)

(assert (=> b!1145362 m!1056305))

(declare-fun m!1056307 () Bool)

(assert (=> b!1145362 m!1056307))

(declare-fun m!1056309 () Bool)

(assert (=> mapNonEmpty!44957 m!1056309))

(assert (=> b!1145388 m!1056279))

(declare-fun m!1056311 () Bool)

(assert (=> b!1145386 m!1056311))

(declare-fun m!1056313 () Bool)

(assert (=> b!1145386 m!1056313))

(declare-fun m!1056315 () Bool)

(assert (=> b!1145386 m!1056315))

(declare-fun m!1056317 () Bool)

(assert (=> b!1145386 m!1056317))

(declare-fun m!1056319 () Bool)

(assert (=> b!1145372 m!1056319))

(declare-fun m!1056321 () Bool)

(assert (=> b!1145370 m!1056321))

(declare-fun m!1056323 () Bool)

(assert (=> b!1145370 m!1056323))

(assert (=> b!1145370 m!1056321))

(assert (=> b!1145370 m!1056297))

(declare-fun m!1056325 () Bool)

(assert (=> b!1145370 m!1056325))

(assert (=> b!1145370 m!1056323))

(declare-fun m!1056327 () Bool)

(assert (=> b!1145370 m!1056327))

(declare-fun m!1056329 () Bool)

(assert (=> b!1145370 m!1056329))

(assert (=> b!1145370 m!1056297))

(assert (=> b!1145370 m!1056275))

(assert (=> b!1145370 m!1056297))

(declare-fun m!1056331 () Bool)

(assert (=> b!1145370 m!1056331))

(declare-fun m!1056333 () Bool)

(assert (=> b!1145385 m!1056333))

(declare-fun m!1056335 () Bool)

(assert (=> b!1145390 m!1056335))

(declare-fun m!1056337 () Bool)

(assert (=> bm!52242 m!1056337))

(check-sat (not bm!52240) (not b!1145385) (not bm!52241) (not b!1145390) (not b!1145386) (not b!1145378) (not b!1145375) (not bm!52239) (not bm!52246) (not b!1145383) (not b!1145372) (not b!1145364) (not b!1145370) (not bm!52242) (not b!1145368) (not start!98620) (not b!1145363) (not b!1145388) (not b!1145365) b_and!39301 (not b_next!24225) tp_is_empty!28755 (not mapNonEmpty!44957) (not b_lambda!19331) (not b!1145362) (not b!1145391) (not b!1145384))
(check-sat b_and!39301 (not b_next!24225))
