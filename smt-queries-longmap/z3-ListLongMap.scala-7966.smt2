; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98872 () Bool)

(assert start!98872)

(declare-fun b_free!24241 () Bool)

(declare-fun b_next!24241 () Bool)

(assert (=> start!98872 (= b_free!24241 (not b_next!24241))))

(declare-fun tp!85434 () Bool)

(declare-fun b_and!39333 () Bool)

(assert (=> start!98872 (= tp!85434 b_and!39333)))

(declare-fun b!1147388 () Bool)

(declare-fun c!113428 () Bool)

(declare-fun lt!512285 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1147388 (= c!113428 (and (not lt!512285) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37610 0))(
  ( (Unit!37611) )
))
(declare-fun e!652770 () Unit!37610)

(declare-fun e!652772 () Unit!37610)

(assert (=> b!1147388 (= e!652770 e!652772)))

(declare-fun b!1147389 () Bool)

(declare-fun e!652777 () Bool)

(assert (=> b!1147389 (= e!652777 true)))

(declare-fun e!652768 () Bool)

(assert (=> b!1147389 e!652768))

(declare-fun res!763599 () Bool)

(assert (=> b!1147389 (=> (not res!763599) (not e!652768))))

(declare-datatypes ((array!74437 0))(
  ( (array!74438 (arr!35863 (Array (_ BitVec 32) (_ BitVec 64))) (size!36400 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74437)

(declare-datatypes ((V!43489 0))(
  ( (V!43490 (val!14442 Int)) )
))
(declare-datatypes ((tuple2!18312 0))(
  ( (tuple2!18313 (_1!9167 (_ BitVec 64)) (_2!9167 V!43489)) )
))
(declare-datatypes ((List!25066 0))(
  ( (Nil!25063) (Cons!25062 (h!26280 tuple2!18312) (t!36291 List!25066)) )
))
(declare-datatypes ((ListLongMap!16289 0))(
  ( (ListLongMap!16290 (toList!8160 List!25066)) )
))
(declare-fun lt!512286 () ListLongMap!16289)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!512271 () V!43489)

(declare-fun -!1285 (ListLongMap!16289 (_ BitVec 64)) ListLongMap!16289)

(declare-fun +!3600 (ListLongMap!16289 tuple2!18312) ListLongMap!16289)

(assert (=> b!1147389 (= res!763599 (= (-!1285 (+!3600 lt!512286 (tuple2!18313 (select (arr!35863 _keys!1208) from!1455) lt!512271)) (select (arr!35863 _keys!1208) from!1455)) lt!512286))))

(declare-fun lt!512281 () Unit!37610)

(declare-fun addThenRemoveForNewKeyIsSame!138 (ListLongMap!16289 (_ BitVec 64) V!43489) Unit!37610)

(assert (=> b!1147389 (= lt!512281 (addThenRemoveForNewKeyIsSame!138 lt!512286 (select (arr!35863 _keys!1208) from!1455) lt!512271))))

(declare-fun lt!512276 () V!43489)

(declare-datatypes ((ValueCell!13676 0))(
  ( (ValueCellFull!13676 (v!17075 V!43489)) (EmptyCell!13676) )
))
(declare-datatypes ((array!74439 0))(
  ( (array!74440 (arr!35864 (Array (_ BitVec 32) ValueCell!13676)) (size!36401 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74439)

(declare-fun get!18263 (ValueCell!13676 V!43489) V!43489)

(assert (=> b!1147389 (= lt!512271 (get!18263 (select (arr!35864 _values!996) from!1455) lt!512276))))

(declare-fun lt!512267 () Unit!37610)

(declare-fun e!652769 () Unit!37610)

(assert (=> b!1147389 (= lt!512267 e!652769)))

(declare-fun c!113425 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6699 (ListLongMap!16289 (_ BitVec 64)) Bool)

(assert (=> b!1147389 (= c!113425 (contains!6699 lt!512286 k0!934))))

(declare-fun zeroValue!944 () V!43489)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43489)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4664 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 32) Int) ListLongMap!16289)

(assert (=> b!1147389 (= lt!512286 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147390 () Bool)

(declare-fun res!763608 () Bool)

(declare-fun e!652775 () Bool)

(assert (=> b!1147390 (=> (not res!763608) (not e!652775))))

(declare-datatypes ((List!25067 0))(
  ( (Nil!25064) (Cons!25063 (h!26281 (_ BitVec 64)) (t!36292 List!25067)) )
))
(declare-fun arrayNoDuplicates!0 (array!74437 (_ BitVec 32) List!25067) Bool)

(assert (=> b!1147390 (= res!763608 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25064))))

(declare-fun b!1147391 () Bool)

(declare-fun e!652767 () Bool)

(assert (=> b!1147391 (= e!652767 e!652777)))

(declare-fun res!763610 () Bool)

(assert (=> b!1147391 (=> res!763610 e!652777)))

(assert (=> b!1147391 (= res!763610 (not (= (select (arr!35863 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652762 () Bool)

(assert (=> b!1147391 e!652762))

(declare-fun c!113426 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147391 (= c!113426 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512283 () Unit!37610)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37610)

(assert (=> b!1147391 (= lt!512283 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!512282 () array!74439)

(declare-fun bm!52496 () Bool)

(declare-fun lt!512270 () array!74437)

(declare-fun call!52501 () ListLongMap!16289)

(assert (=> bm!52496 (= call!52501 (getCurrentListMapNoExtraKeys!4664 lt!512270 lt!512282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!652764 () Bool)

(declare-fun b!1147392 () Bool)

(declare-fun arrayContainsKey!0 (array!74437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147392 (= e!652764 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147387 () Bool)

(declare-fun call!52506 () ListLongMap!16289)

(assert (=> b!1147387 (= e!652762 (= call!52501 call!52506))))

(declare-fun res!763598 () Bool)

(assert (=> start!98872 (=> (not res!763598) (not e!652775))))

(assert (=> start!98872 (= res!763598 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36400 _keys!1208))))))

(assert (=> start!98872 e!652775))

(declare-fun tp_is_empty!28771 () Bool)

(assert (=> start!98872 tp_is_empty!28771))

(declare-fun array_inv!27522 (array!74437) Bool)

(assert (=> start!98872 (array_inv!27522 _keys!1208)))

(assert (=> start!98872 true))

(assert (=> start!98872 tp!85434))

(declare-fun e!652774 () Bool)

(declare-fun array_inv!27523 (array!74439) Bool)

(assert (=> start!98872 (and (array_inv!27523 _values!996) e!652774)))

(declare-fun bm!52497 () Bool)

(declare-fun lt!512269 () ListLongMap!16289)

(declare-fun call!52499 () Bool)

(declare-fun c!113430 () Bool)

(declare-fun call!52504 () ListLongMap!16289)

(assert (=> bm!52497 (= call!52499 (contains!6699 (ite c!113430 lt!512269 call!52504) k0!934))))

(declare-fun b!1147393 () Bool)

(declare-fun res!763607 () Bool)

(assert (=> b!1147393 (=> (not res!763607) (not e!652775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147393 (= res!763607 (validKeyInArray!0 k0!934))))

(declare-fun b!1147394 () Bool)

(assert (=> b!1147394 (= e!652762 (= call!52501 (-!1285 call!52506 k0!934)))))

(declare-fun b!1147395 () Bool)

(declare-fun lt!512278 () Unit!37610)

(assert (=> b!1147395 (= e!652772 lt!512278)))

(declare-fun call!52500 () Unit!37610)

(assert (=> b!1147395 (= lt!512278 call!52500)))

(declare-fun call!52503 () Bool)

(assert (=> b!1147395 call!52503))

(declare-fun e!652761 () Bool)

(declare-fun b!1147396 () Bool)

(assert (=> b!1147396 (= e!652761 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52498 () Bool)

(declare-fun call!52505 () ListLongMap!16289)

(assert (=> bm!52498 (= call!52505 (+!3600 (ite c!113430 lt!512269 lt!512286) (ite c!113430 (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113428 (tuple2!18313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147397 () Bool)

(declare-fun e!652776 () Bool)

(assert (=> b!1147397 (= e!652776 tp_is_empty!28771)))

(declare-fun b!1147398 () Bool)

(declare-fun res!763601 () Bool)

(assert (=> b!1147398 (=> (not res!763601) (not e!652775))))

(assert (=> b!1147398 (= res!763601 (and (= (size!36401 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36400 _keys!1208) (size!36401 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52499 () Bool)

(declare-fun call!52502 () Unit!37610)

(declare-fun addStillContains!827 (ListLongMap!16289 (_ BitVec 64) V!43489 (_ BitVec 64)) Unit!37610)

(assert (=> bm!52499 (= call!52502 (addStillContains!827 lt!512286 (ite (or c!113430 c!113428) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113430 c!113428) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1147399 () Bool)

(declare-fun res!763611 () Bool)

(assert (=> b!1147399 (=> (not res!763611) (not e!652775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147399 (= res!763611 (validMask!0 mask!1564))))

(declare-fun b!1147400 () Bool)

(assert (=> b!1147400 (= e!652761 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512285) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512277 () ListLongMap!16289)

(declare-fun b!1147401 () Bool)

(assert (=> b!1147401 (= e!652768 (= (-!1285 lt!512277 k0!934) lt!512286))))

(declare-fun b!1147402 () Bool)

(declare-fun Unit!37612 () Unit!37610)

(assert (=> b!1147402 (= e!652769 Unit!37612)))

(assert (=> b!1147402 (= lt!512285 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147402 (= c!113430 (and (not lt!512285) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512284 () Unit!37610)

(assert (=> b!1147402 (= lt!512284 e!652770)))

(declare-fun lt!512274 () Unit!37610)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!423 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43489 V!43489 (_ BitVec 64) (_ BitVec 32) Int) Unit!37610)

(assert (=> b!1147402 (= lt!512274 (lemmaListMapContainsThenArrayContainsFrom!423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113427 () Bool)

(assert (=> b!1147402 (= c!113427 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763604 () Bool)

(assert (=> b!1147402 (= res!763604 e!652761)))

(assert (=> b!1147402 (=> (not res!763604) (not e!652764))))

(assert (=> b!1147402 e!652764))

(declare-fun lt!512279 () Unit!37610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74437 (_ BitVec 32) (_ BitVec 32)) Unit!37610)

(assert (=> b!1147402 (= lt!512279 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147402 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25064)))

(declare-fun lt!512275 () Unit!37610)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74437 (_ BitVec 64) (_ BitVec 32) List!25067) Unit!37610)

(assert (=> b!1147402 (= lt!512275 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25064))))

(assert (=> b!1147402 false))

(declare-fun b!1147403 () Bool)

(declare-fun e!652773 () Unit!37610)

(assert (=> b!1147403 (= e!652772 e!652773)))

(declare-fun c!113429 () Bool)

(assert (=> b!1147403 (= c!113429 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512285))))

(declare-fun b!1147404 () Bool)

(declare-fun res!763602 () Bool)

(assert (=> b!1147404 (=> (not res!763602) (not e!652775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74437 (_ BitVec 32)) Bool)

(assert (=> b!1147404 (= res!763602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147405 () Bool)

(declare-fun res!763609 () Bool)

(assert (=> b!1147405 (=> (not res!763609) (not e!652775))))

(assert (=> b!1147405 (= res!763609 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36400 _keys!1208))))))

(declare-fun b!1147406 () Bool)

(declare-fun e!652771 () Bool)

(assert (=> b!1147406 (= e!652771 tp_is_empty!28771)))

(declare-fun b!1147407 () Bool)

(declare-fun mapRes!44981 () Bool)

(assert (=> b!1147407 (= e!652774 (and e!652771 mapRes!44981))))

(declare-fun condMapEmpty!44981 () Bool)

(declare-fun mapDefault!44981 () ValueCell!13676)

(assert (=> b!1147407 (= condMapEmpty!44981 (= (arr!35864 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13676)) mapDefault!44981)))))

(declare-fun b!1147408 () Bool)

(declare-fun e!652766 () Bool)

(assert (=> b!1147408 (= e!652766 e!652767)))

(declare-fun res!763603 () Bool)

(assert (=> b!1147408 (=> res!763603 e!652767)))

(assert (=> b!1147408 (= res!763603 (not (= from!1455 i!673)))))

(declare-fun lt!512272 () ListLongMap!16289)

(assert (=> b!1147408 (= lt!512272 (getCurrentListMapNoExtraKeys!4664 lt!512270 lt!512282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147408 (= lt!512282 (array!74440 (store (arr!35864 _values!996) i!673 (ValueCellFull!13676 lt!512276)) (size!36401 _values!996)))))

(declare-fun dynLambda!2692 (Int (_ BitVec 64)) V!43489)

(assert (=> b!1147408 (= lt!512276 (dynLambda!2692 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147408 (= lt!512277 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52500 () Bool)

(assert (=> bm!52500 (= call!52503 call!52499)))

(declare-fun b!1147409 () Bool)

(declare-fun Unit!37613 () Unit!37610)

(assert (=> b!1147409 (= e!652769 Unit!37613)))

(declare-fun b!1147410 () Bool)

(declare-fun e!652763 () Bool)

(assert (=> b!1147410 (= e!652763 (not e!652766))))

(declare-fun res!763600 () Bool)

(assert (=> b!1147410 (=> res!763600 e!652766)))

(assert (=> b!1147410 (= res!763600 (bvsgt from!1455 i!673))))

(assert (=> b!1147410 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512273 () Unit!37610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74437 (_ BitVec 64) (_ BitVec 32)) Unit!37610)

(assert (=> b!1147410 (= lt!512273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44981 () Bool)

(declare-fun tp!85433 () Bool)

(assert (=> mapNonEmpty!44981 (= mapRes!44981 (and tp!85433 e!652776))))

(declare-fun mapValue!44981 () ValueCell!13676)

(declare-fun mapRest!44981 () (Array (_ BitVec 32) ValueCell!13676))

(declare-fun mapKey!44981 () (_ BitVec 32))

(assert (=> mapNonEmpty!44981 (= (arr!35864 _values!996) (store mapRest!44981 mapKey!44981 mapValue!44981))))

(declare-fun bm!52501 () Bool)

(assert (=> bm!52501 (= call!52500 call!52502)))

(declare-fun b!1147411 () Bool)

(assert (=> b!1147411 call!52503))

(declare-fun lt!512287 () Unit!37610)

(assert (=> b!1147411 (= lt!512287 call!52500)))

(assert (=> b!1147411 (= e!652773 lt!512287)))

(declare-fun bm!52502 () Bool)

(assert (=> bm!52502 (= call!52506 (getCurrentListMapNoExtraKeys!4664 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147412 () Bool)

(assert (=> b!1147412 (= e!652775 e!652763)))

(declare-fun res!763597 () Bool)

(assert (=> b!1147412 (=> (not res!763597) (not e!652763))))

(assert (=> b!1147412 (= res!763597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512270 mask!1564))))

(assert (=> b!1147412 (= lt!512270 (array!74438 (store (arr!35863 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36400 _keys!1208)))))

(declare-fun b!1147413 () Bool)

(assert (=> b!1147413 (contains!6699 call!52505 k0!934)))

(declare-fun lt!512280 () Unit!37610)

(assert (=> b!1147413 (= lt!512280 (addStillContains!827 lt!512269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1147413 call!52499))

(assert (=> b!1147413 (= lt!512269 (+!3600 lt!512286 (tuple2!18313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512268 () Unit!37610)

(assert (=> b!1147413 (= lt!512268 call!52502)))

(assert (=> b!1147413 (= e!652770 lt!512280)))

(declare-fun b!1147414 () Bool)

(declare-fun Unit!37614 () Unit!37610)

(assert (=> b!1147414 (= e!652773 Unit!37614)))

(declare-fun mapIsEmpty!44981 () Bool)

(assert (=> mapIsEmpty!44981 mapRes!44981))

(declare-fun b!1147415 () Bool)

(declare-fun res!763606 () Bool)

(assert (=> b!1147415 (=> (not res!763606) (not e!652775))))

(assert (=> b!1147415 (= res!763606 (= (select (arr!35863 _keys!1208) i!673) k0!934))))

(declare-fun b!1147416 () Bool)

(declare-fun res!763605 () Bool)

(assert (=> b!1147416 (=> (not res!763605) (not e!652763))))

(assert (=> b!1147416 (= res!763605 (arrayNoDuplicates!0 lt!512270 #b00000000000000000000000000000000 Nil!25064))))

(declare-fun bm!52503 () Bool)

(assert (=> bm!52503 (= call!52504 call!52505)))

(assert (= (and start!98872 res!763598) b!1147399))

(assert (= (and b!1147399 res!763611) b!1147398))

(assert (= (and b!1147398 res!763601) b!1147404))

(assert (= (and b!1147404 res!763602) b!1147390))

(assert (= (and b!1147390 res!763608) b!1147405))

(assert (= (and b!1147405 res!763609) b!1147393))

(assert (= (and b!1147393 res!763607) b!1147415))

(assert (= (and b!1147415 res!763606) b!1147412))

(assert (= (and b!1147412 res!763597) b!1147416))

(assert (= (and b!1147416 res!763605) b!1147410))

(assert (= (and b!1147410 (not res!763600)) b!1147408))

(assert (= (and b!1147408 (not res!763603)) b!1147391))

(assert (= (and b!1147391 c!113426) b!1147394))

(assert (= (and b!1147391 (not c!113426)) b!1147387))

(assert (= (or b!1147394 b!1147387) bm!52496))

(assert (= (or b!1147394 b!1147387) bm!52502))

(assert (= (and b!1147391 (not res!763610)) b!1147389))

(assert (= (and b!1147389 c!113425) b!1147402))

(assert (= (and b!1147389 (not c!113425)) b!1147409))

(assert (= (and b!1147402 c!113430) b!1147413))

(assert (= (and b!1147402 (not c!113430)) b!1147388))

(assert (= (and b!1147388 c!113428) b!1147395))

(assert (= (and b!1147388 (not c!113428)) b!1147403))

(assert (= (and b!1147403 c!113429) b!1147411))

(assert (= (and b!1147403 (not c!113429)) b!1147414))

(assert (= (or b!1147395 b!1147411) bm!52501))

(assert (= (or b!1147395 b!1147411) bm!52503))

(assert (= (or b!1147395 b!1147411) bm!52500))

(assert (= (or b!1147413 bm!52500) bm!52497))

(assert (= (or b!1147413 bm!52501) bm!52499))

(assert (= (or b!1147413 bm!52503) bm!52498))

(assert (= (and b!1147402 c!113427) b!1147396))

(assert (= (and b!1147402 (not c!113427)) b!1147400))

(assert (= (and b!1147402 res!763604) b!1147392))

(assert (= (and b!1147389 res!763599) b!1147401))

(assert (= (and b!1147407 condMapEmpty!44981) mapIsEmpty!44981))

(assert (= (and b!1147407 (not condMapEmpty!44981)) mapNonEmpty!44981))

(get-info :version)

(assert (= (and mapNonEmpty!44981 ((_ is ValueCellFull!13676) mapValue!44981)) b!1147397))

(assert (= (and b!1147407 ((_ is ValueCellFull!13676) mapDefault!44981)) b!1147406))

(assert (= start!98872 b!1147407))

(declare-fun b_lambda!19341 () Bool)

(assert (=> (not b_lambda!19341) (not b!1147408)))

(declare-fun t!36290 () Bool)

(declare-fun tb!9045 () Bool)

(assert (=> (and start!98872 (= defaultEntry!1004 defaultEntry!1004) t!36290) tb!9045))

(declare-fun result!18663 () Bool)

(assert (=> tb!9045 (= result!18663 tp_is_empty!28771)))

(assert (=> b!1147408 t!36290))

(declare-fun b_and!39335 () Bool)

(assert (= b_and!39333 (and (=> t!36290 result!18663) b_and!39335)))

(declare-fun m!1058473 () Bool)

(assert (=> b!1147408 m!1058473))

(declare-fun m!1058475 () Bool)

(assert (=> b!1147408 m!1058475))

(declare-fun m!1058477 () Bool)

(assert (=> b!1147408 m!1058477))

(declare-fun m!1058479 () Bool)

(assert (=> b!1147408 m!1058479))

(declare-fun m!1058481 () Bool)

(assert (=> b!1147394 m!1058481))

(declare-fun m!1058483 () Bool)

(assert (=> b!1147392 m!1058483))

(declare-fun m!1058485 () Bool)

(assert (=> bm!52498 m!1058485))

(assert (=> b!1147396 m!1058483))

(declare-fun m!1058487 () Bool)

(assert (=> b!1147410 m!1058487))

(declare-fun m!1058489 () Bool)

(assert (=> b!1147410 m!1058489))

(declare-fun m!1058491 () Bool)

(assert (=> b!1147404 m!1058491))

(declare-fun m!1058493 () Bool)

(assert (=> b!1147390 m!1058493))

(declare-fun m!1058495 () Bool)

(assert (=> b!1147416 m!1058495))

(declare-fun m!1058497 () Bool)

(assert (=> bm!52496 m!1058497))

(declare-fun m!1058499 () Bool)

(assert (=> mapNonEmpty!44981 m!1058499))

(declare-fun m!1058501 () Bool)

(assert (=> b!1147399 m!1058501))

(declare-fun m!1058503 () Bool)

(assert (=> start!98872 m!1058503))

(declare-fun m!1058505 () Bool)

(assert (=> start!98872 m!1058505))

(declare-fun m!1058507 () Bool)

(assert (=> b!1147401 m!1058507))

(declare-fun m!1058509 () Bool)

(assert (=> bm!52499 m!1058509))

(declare-fun m!1058511 () Bool)

(assert (=> bm!52497 m!1058511))

(declare-fun m!1058513 () Bool)

(assert (=> b!1147402 m!1058513))

(declare-fun m!1058515 () Bool)

(assert (=> b!1147402 m!1058515))

(declare-fun m!1058517 () Bool)

(assert (=> b!1147402 m!1058517))

(declare-fun m!1058519 () Bool)

(assert (=> b!1147402 m!1058519))

(declare-fun m!1058521 () Bool)

(assert (=> b!1147413 m!1058521))

(declare-fun m!1058523 () Bool)

(assert (=> b!1147413 m!1058523))

(declare-fun m!1058525 () Bool)

(assert (=> b!1147413 m!1058525))

(declare-fun m!1058527 () Bool)

(assert (=> b!1147393 m!1058527))

(declare-fun m!1058529 () Bool)

(assert (=> b!1147389 m!1058529))

(declare-fun m!1058531 () Bool)

(assert (=> b!1147389 m!1058531))

(declare-fun m!1058533 () Bool)

(assert (=> b!1147389 m!1058533))

(declare-fun m!1058535 () Bool)

(assert (=> b!1147389 m!1058535))

(declare-fun m!1058537 () Bool)

(assert (=> b!1147389 m!1058537))

(declare-fun m!1058539 () Bool)

(assert (=> b!1147389 m!1058539))

(assert (=> b!1147389 m!1058537))

(assert (=> b!1147389 m!1058531))

(declare-fun m!1058541 () Bool)

(assert (=> b!1147389 m!1058541))

(assert (=> b!1147389 m!1058535))

(declare-fun m!1058543 () Bool)

(assert (=> b!1147389 m!1058543))

(assert (=> b!1147389 m!1058531))

(assert (=> bm!52502 m!1058529))

(assert (=> b!1147391 m!1058531))

(declare-fun m!1058545 () Bool)

(assert (=> b!1147391 m!1058545))

(declare-fun m!1058547 () Bool)

(assert (=> b!1147412 m!1058547))

(declare-fun m!1058549 () Bool)

(assert (=> b!1147412 m!1058549))

(declare-fun m!1058551 () Bool)

(assert (=> b!1147415 m!1058551))

(check-sat (not b!1147416) b_and!39335 (not b!1147412) (not mapNonEmpty!44981) (not b!1147413) (not bm!52498) (not b_next!24241) (not b_lambda!19341) (not bm!52499) (not b!1147402) (not b!1147399) (not b!1147394) (not b!1147410) (not b!1147396) (not b!1147404) (not b!1147393) (not b!1147391) (not bm!52497) (not bm!52502) tp_is_empty!28771 (not bm!52496) (not b!1147408) (not b!1147401) (not b!1147389) (not b!1147392) (not b!1147390) (not start!98872))
(check-sat b_and!39335 (not b_next!24241))
