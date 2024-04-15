; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98966 () Bool)

(assert start!98966)

(declare-fun b_free!24577 () Bool)

(declare-fun b_next!24577 () Bool)

(assert (=> start!98966 (= b_free!24577 (not b_next!24577))))

(declare-fun tp!86441 () Bool)

(declare-fun b_and!39981 () Bool)

(assert (=> start!98966 (= tp!86441 b_and!39981)))

(declare-datatypes ((V!43937 0))(
  ( (V!43938 (val!14610 Int)) )
))
(declare-fun zeroValue!944 () V!43937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13844 0))(
  ( (ValueCellFull!13844 (v!17246 V!43937)) (EmptyCell!13844) )
))
(declare-datatypes ((array!74972 0))(
  ( (array!74973 (arr!36137 (Array (_ BitVec 32) ValueCell!13844)) (size!36675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74972)

(declare-datatypes ((tuple2!18702 0))(
  ( (tuple2!18703 (_1!9362 (_ BitVec 64)) (_2!9362 V!43937)) )
))
(declare-datatypes ((List!25420 0))(
  ( (Nil!25417) (Cons!25416 (h!26625 tuple2!18702) (t!36980 List!25420)) )
))
(declare-datatypes ((ListLongMap!16671 0))(
  ( (ListLongMap!16672 (toList!8351 List!25420)) )
))
(declare-fun call!56450 () ListLongMap!16671)

(declare-fun minValue!944 () V!43937)

(declare-fun bm!56440 () Bool)

(declare-datatypes ((array!74974 0))(
  ( (array!74975 (arr!36138 (Array (_ BitVec 32) (_ BitVec 64))) (size!36676 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74974)

(declare-fun getCurrentListMapNoExtraKeys!4829 (array!74974 array!74972 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) Int) ListLongMap!16671)

(assert (=> bm!56440 (= call!56450 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45485 () Bool)

(declare-fun mapRes!45485 () Bool)

(declare-fun tp!86442 () Bool)

(declare-fun e!660424 () Bool)

(assert (=> mapNonEmpty!45485 (= mapRes!45485 (and tp!86442 e!660424))))

(declare-fun mapValue!45485 () ValueCell!13844)

(declare-fun mapRest!45485 () (Array (_ BitVec 32) ValueCell!13844))

(declare-fun mapKey!45485 () (_ BitVec 32))

(assert (=> mapNonEmpty!45485 (= (arr!36137 _values!996) (store mapRest!45485 mapKey!45485 mapValue!45485))))

(declare-fun b!1161430 () Bool)

(declare-fun res!770596 () Bool)

(declare-fun e!660435 () Bool)

(assert (=> b!1161430 (=> (not res!770596) (not e!660435))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161430 (= res!770596 (validKeyInArray!0 k0!934))))

(declare-fun bm!56441 () Bool)

(declare-fun lt!522599 () array!74974)

(declare-fun call!56449 () ListLongMap!16671)

(declare-fun lt!522585 () array!74972)

(assert (=> bm!56441 (= call!56449 (getCurrentListMapNoExtraKeys!4829 lt!522599 lt!522585 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45485 () Bool)

(assert (=> mapIsEmpty!45485 mapRes!45485))

(declare-fun b!1161431 () Bool)

(declare-fun res!770586 () Bool)

(assert (=> b!1161431 (=> (not res!770586) (not e!660435))))

(declare-datatypes ((List!25421 0))(
  ( (Nil!25418) (Cons!25417 (h!26626 (_ BitVec 64)) (t!36981 List!25421)) )
))
(declare-fun arrayNoDuplicates!0 (array!74974 (_ BitVec 32) List!25421) Bool)

(assert (=> b!1161431 (= res!770586 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25418))))

(declare-fun e!660420 () Bool)

(declare-fun b!1161432 () Bool)

(declare-fun arrayContainsKey!0 (array!74974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161432 (= e!660420 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161433 () Bool)

(declare-fun e!660428 () Bool)

(assert (=> b!1161433 (= e!660428 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1161434 () Bool)

(declare-fun res!770592 () Bool)

(assert (=> b!1161434 (=> (not res!770592) (not e!660435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74974 (_ BitVec 32)) Bool)

(assert (=> b!1161434 (= res!770592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161435 () Bool)

(declare-fun c!116025 () Bool)

(declare-fun lt!522602 () Bool)

(assert (=> b!1161435 (= c!116025 (and (not lt!522602) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38146 0))(
  ( (Unit!38147) )
))
(declare-fun e!660432 () Unit!38146)

(declare-fun e!660423 () Unit!38146)

(assert (=> b!1161435 (= e!660432 e!660423)))

(declare-fun b!1161436 () Bool)

(declare-fun lt!522601 () Unit!38146)

(assert (=> b!1161436 (= e!660423 lt!522601)))

(declare-fun call!56446 () Unit!38146)

(assert (=> b!1161436 (= lt!522601 call!56446)))

(declare-fun call!56447 () Bool)

(assert (=> b!1161436 call!56447))

(declare-fun b!1161437 () Bool)

(declare-fun e!660425 () Unit!38146)

(declare-fun Unit!38148 () Unit!38146)

(assert (=> b!1161437 (= e!660425 Unit!38148)))

(assert (=> b!1161437 (= lt!522602 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116029 () Bool)

(assert (=> b!1161437 (= c!116029 (and (not lt!522602) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522587 () Unit!38146)

(assert (=> b!1161437 (= lt!522587 e!660432)))

(declare-fun lt!522595 () Unit!38146)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!536 (array!74974 array!74972 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 64) (_ BitVec 32) Int) Unit!38146)

(assert (=> b!1161437 (= lt!522595 (lemmaListMapContainsThenArrayContainsFrom!536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116026 () Bool)

(assert (=> b!1161437 (= c!116026 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770588 () Bool)

(assert (=> b!1161437 (= res!770588 e!660420)))

(assert (=> b!1161437 (=> (not res!770588) (not e!660428))))

(assert (=> b!1161437 e!660428))

(declare-fun lt!522593 () Unit!38146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74974 (_ BitVec 32) (_ BitVec 32)) Unit!38146)

(assert (=> b!1161437 (= lt!522593 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1161437 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25418)))

(declare-fun lt!522589 () Unit!38146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74974 (_ BitVec 64) (_ BitVec 32) List!25421) Unit!38146)

(assert (=> b!1161437 (= lt!522589 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25418))))

(assert (=> b!1161437 false))

(declare-fun b!1161438 () Bool)

(declare-fun e!660431 () Bool)

(assert (=> b!1161438 (= e!660431 true)))

(declare-fun e!660429 () Bool)

(assert (=> b!1161438 e!660429))

(declare-fun res!770585 () Bool)

(assert (=> b!1161438 (=> (not res!770585) (not e!660429))))

(declare-fun lt!522596 () ListLongMap!16671)

(declare-fun lt!522603 () ListLongMap!16671)

(assert (=> b!1161438 (= res!770585 (= lt!522596 lt!522603))))

(declare-fun lt!522590 () ListLongMap!16671)

(declare-fun -!1400 (ListLongMap!16671 (_ BitVec 64)) ListLongMap!16671)

(assert (=> b!1161438 (= lt!522596 (-!1400 lt!522590 k0!934))))

(declare-fun lt!522586 () V!43937)

(declare-fun +!3755 (ListLongMap!16671 tuple2!18702) ListLongMap!16671)

(assert (=> b!1161438 (= (-!1400 (+!3755 lt!522603 (tuple2!18703 (select (arr!36138 _keys!1208) from!1455) lt!522586)) (select (arr!36138 _keys!1208) from!1455)) lt!522603)))

(declare-fun lt!522588 () Unit!38146)

(declare-fun addThenRemoveForNewKeyIsSame!244 (ListLongMap!16671 (_ BitVec 64) V!43937) Unit!38146)

(assert (=> b!1161438 (= lt!522588 (addThenRemoveForNewKeyIsSame!244 lt!522603 (select (arr!36138 _keys!1208) from!1455) lt!522586))))

(declare-fun lt!522592 () V!43937)

(declare-fun get!18450 (ValueCell!13844 V!43937) V!43937)

(assert (=> b!1161438 (= lt!522586 (get!18450 (select (arr!36137 _values!996) from!1455) lt!522592))))

(declare-fun lt!522591 () Unit!38146)

(assert (=> b!1161438 (= lt!522591 e!660425)))

(declare-fun c!116028 () Bool)

(declare-fun contains!6797 (ListLongMap!16671 (_ BitVec 64)) Bool)

(assert (=> b!1161438 (= c!116028 (contains!6797 lt!522603 k0!934))))

(assert (=> b!1161438 (= lt!522603 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161439 () Bool)

(declare-fun res!770583 () Bool)

(assert (=> b!1161439 (=> (not res!770583) (not e!660435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161439 (= res!770583 (validMask!0 mask!1564))))

(declare-fun bm!56442 () Bool)

(declare-fun call!56443 () Unit!38146)

(assert (=> bm!56442 (= call!56446 call!56443)))

(declare-fun b!1161440 () Bool)

(declare-fun e!660422 () Bool)

(assert (=> b!1161440 (= e!660422 (= call!56449 call!56450))))

(declare-fun b!1161441 () Bool)

(declare-fun e!660434 () Bool)

(assert (=> b!1161441 (= e!660434 e!660431)))

(declare-fun res!770584 () Bool)

(assert (=> b!1161441 (=> res!770584 e!660431)))

(assert (=> b!1161441 (= res!770584 (not (= (select (arr!36138 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1161441 e!660422))

(declare-fun c!116027 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161441 (= c!116027 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522600 () Unit!38146)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!667 (array!74974 array!74972 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38146)

(assert (=> b!1161441 (= lt!522600 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!667 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161442 () Bool)

(declare-fun e!660430 () Bool)

(assert (=> b!1161442 (= e!660430 e!660434)))

(declare-fun res!770597 () Bool)

(assert (=> b!1161442 (=> res!770597 e!660434)))

(assert (=> b!1161442 (= res!770597 (not (= from!1455 i!673)))))

(declare-fun lt!522597 () ListLongMap!16671)

(assert (=> b!1161442 (= lt!522597 (getCurrentListMapNoExtraKeys!4829 lt!522599 lt!522585 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161442 (= lt!522585 (array!74973 (store (arr!36137 _values!996) i!673 (ValueCellFull!13844 lt!522592)) (size!36675 _values!996)))))

(declare-fun dynLambda!2768 (Int (_ BitVec 64)) V!43937)

(assert (=> b!1161442 (= lt!522592 (dynLambda!2768 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161442 (= lt!522590 (getCurrentListMapNoExtraKeys!4829 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1161443 () Bool)

(declare-fun res!770591 () Bool)

(assert (=> b!1161443 (=> (not res!770591) (not e!660435))))

(assert (=> b!1161443 (= res!770591 (and (= (size!36675 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36676 _keys!1208) (size!36675 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!56444 () Bool)

(declare-fun bm!56443 () Bool)

(declare-fun call!56445 () ListLongMap!16671)

(declare-fun lt!522594 () ListLongMap!16671)

(assert (=> bm!56443 (= call!56444 (contains!6797 (ite c!116029 lt!522594 call!56445) k0!934))))

(declare-fun b!1161444 () Bool)

(declare-fun e!660419 () Bool)

(assert (=> b!1161444 (= e!660419 (not e!660430))))

(declare-fun res!770594 () Bool)

(assert (=> b!1161444 (=> res!770594 e!660430)))

(assert (=> b!1161444 (= res!770594 (bvsgt from!1455 i!673))))

(assert (=> b!1161444 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522598 () Unit!38146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74974 (_ BitVec 64) (_ BitVec 32)) Unit!38146)

(assert (=> b!1161444 (= lt!522598 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1161445 () Bool)

(assert (=> b!1161445 (= e!660435 e!660419)))

(declare-fun res!770595 () Bool)

(assert (=> b!1161445 (=> (not res!770595) (not e!660419))))

(assert (=> b!1161445 (= res!770595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522599 mask!1564))))

(assert (=> b!1161445 (= lt!522599 (array!74975 (store (arr!36138 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36676 _keys!1208)))))

(declare-fun b!1161446 () Bool)

(declare-fun e!660421 () Unit!38146)

(assert (=> b!1161446 (= e!660423 e!660421)))

(declare-fun c!116030 () Bool)

(assert (=> b!1161446 (= c!116030 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522602))))

(declare-fun bm!56444 () Bool)

(declare-fun addStillContains!963 (ListLongMap!16671 (_ BitVec 64) V!43937 (_ BitVec 64)) Unit!38146)

(assert (=> bm!56444 (= call!56443 (addStillContains!963 (ite c!116029 lt!522594 lt!522603) (ite c!116029 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116025 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116029 minValue!944 (ite c!116025 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1161447 () Bool)

(assert (=> b!1161447 (= e!660422 (= call!56449 (-!1400 call!56450 k0!934)))))

(declare-fun b!1161448 () Bool)

(declare-fun res!770590 () Bool)

(assert (=> b!1161448 (=> (not res!770590) (not e!660419))))

(assert (=> b!1161448 (= res!770590 (arrayNoDuplicates!0 lt!522599 #b00000000000000000000000000000000 Nil!25418))))

(declare-fun bm!56445 () Bool)

(assert (=> bm!56445 (= call!56447 call!56444)))

(declare-fun b!1161449 () Bool)

(declare-fun res!770593 () Bool)

(assert (=> b!1161449 (=> (not res!770593) (not e!660435))))

(assert (=> b!1161449 (= res!770593 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36676 _keys!1208))))))

(declare-fun b!1161450 () Bool)

(declare-fun Unit!38149 () Unit!38146)

(assert (=> b!1161450 (= e!660425 Unit!38149)))

(declare-fun call!56448 () ListLongMap!16671)

(declare-fun bm!56446 () Bool)

(assert (=> bm!56446 (= call!56448 (+!3755 lt!522603 (ite (or c!116029 c!116025) (tuple2!18703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1161451 () Bool)

(assert (=> b!1161451 (contains!6797 (+!3755 lt!522594 (tuple2!18703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522582 () Unit!38146)

(assert (=> b!1161451 (= lt!522582 call!56443)))

(assert (=> b!1161451 call!56444))

(assert (=> b!1161451 (= lt!522594 call!56448)))

(declare-fun lt!522583 () Unit!38146)

(assert (=> b!1161451 (= lt!522583 (addStillContains!963 lt!522603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1161451 (= e!660432 lt!522582)))

(declare-fun bm!56447 () Bool)

(assert (=> bm!56447 (= call!56445 call!56448)))

(declare-fun b!1161452 () Bool)

(declare-fun e!660433 () Bool)

(declare-fun tp_is_empty!29107 () Bool)

(assert (=> b!1161452 (= e!660433 tp_is_empty!29107)))

(declare-fun b!1161453 () Bool)

(declare-fun res!770589 () Bool)

(assert (=> b!1161453 (=> (not res!770589) (not e!660435))))

(assert (=> b!1161453 (= res!770589 (= (select (arr!36138 _keys!1208) i!673) k0!934))))

(declare-fun res!770587 () Bool)

(assert (=> start!98966 (=> (not res!770587) (not e!660435))))

(assert (=> start!98966 (= res!770587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36676 _keys!1208))))))

(assert (=> start!98966 e!660435))

(assert (=> start!98966 tp_is_empty!29107))

(declare-fun array_inv!27764 (array!74974) Bool)

(assert (=> start!98966 (array_inv!27764 _keys!1208)))

(assert (=> start!98966 true))

(assert (=> start!98966 tp!86441))

(declare-fun e!660427 () Bool)

(declare-fun array_inv!27765 (array!74972) Bool)

(assert (=> start!98966 (and (array_inv!27765 _values!996) e!660427)))

(declare-fun b!1161454 () Bool)

(assert (=> b!1161454 (= e!660420 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522602) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161455 () Bool)

(assert (=> b!1161455 (= e!660424 tp_is_empty!29107)))

(declare-fun b!1161456 () Bool)

(assert (=> b!1161456 (= e!660429 (= lt!522596 (getCurrentListMapNoExtraKeys!4829 lt!522599 lt!522585 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1161457 () Bool)

(declare-fun Unit!38150 () Unit!38146)

(assert (=> b!1161457 (= e!660421 Unit!38150)))

(declare-fun b!1161458 () Bool)

(assert (=> b!1161458 (= e!660427 (and e!660433 mapRes!45485))))

(declare-fun condMapEmpty!45485 () Bool)

(declare-fun mapDefault!45485 () ValueCell!13844)

(assert (=> b!1161458 (= condMapEmpty!45485 (= (arr!36137 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13844)) mapDefault!45485)))))

(declare-fun b!1161459 () Bool)

(assert (=> b!1161459 call!56447))

(declare-fun lt!522584 () Unit!38146)

(assert (=> b!1161459 (= lt!522584 call!56446)))

(assert (=> b!1161459 (= e!660421 lt!522584)))

(assert (= (and start!98966 res!770587) b!1161439))

(assert (= (and b!1161439 res!770583) b!1161443))

(assert (= (and b!1161443 res!770591) b!1161434))

(assert (= (and b!1161434 res!770592) b!1161431))

(assert (= (and b!1161431 res!770586) b!1161449))

(assert (= (and b!1161449 res!770593) b!1161430))

(assert (= (and b!1161430 res!770596) b!1161453))

(assert (= (and b!1161453 res!770589) b!1161445))

(assert (= (and b!1161445 res!770595) b!1161448))

(assert (= (and b!1161448 res!770590) b!1161444))

(assert (= (and b!1161444 (not res!770594)) b!1161442))

(assert (= (and b!1161442 (not res!770597)) b!1161441))

(assert (= (and b!1161441 c!116027) b!1161447))

(assert (= (and b!1161441 (not c!116027)) b!1161440))

(assert (= (or b!1161447 b!1161440) bm!56441))

(assert (= (or b!1161447 b!1161440) bm!56440))

(assert (= (and b!1161441 (not res!770584)) b!1161438))

(assert (= (and b!1161438 c!116028) b!1161437))

(assert (= (and b!1161438 (not c!116028)) b!1161450))

(assert (= (and b!1161437 c!116029) b!1161451))

(assert (= (and b!1161437 (not c!116029)) b!1161435))

(assert (= (and b!1161435 c!116025) b!1161436))

(assert (= (and b!1161435 (not c!116025)) b!1161446))

(assert (= (and b!1161446 c!116030) b!1161459))

(assert (= (and b!1161446 (not c!116030)) b!1161457))

(assert (= (or b!1161436 b!1161459) bm!56442))

(assert (= (or b!1161436 b!1161459) bm!56447))

(assert (= (or b!1161436 b!1161459) bm!56445))

(assert (= (or b!1161451 bm!56445) bm!56443))

(assert (= (or b!1161451 bm!56442) bm!56444))

(assert (= (or b!1161451 bm!56447) bm!56446))

(assert (= (and b!1161437 c!116026) b!1161432))

(assert (= (and b!1161437 (not c!116026)) b!1161454))

(assert (= (and b!1161437 res!770588) b!1161433))

(assert (= (and b!1161438 res!770585) b!1161456))

(assert (= (and b!1161458 condMapEmpty!45485) mapIsEmpty!45485))

(assert (= (and b!1161458 (not condMapEmpty!45485)) mapNonEmpty!45485))

(get-info :version)

(assert (= (and mapNonEmpty!45485 ((_ is ValueCellFull!13844) mapValue!45485)) b!1161455))

(assert (= (and b!1161458 ((_ is ValueCellFull!13844) mapDefault!45485)) b!1161452))

(assert (= start!98966 b!1161458))

(declare-fun b_lambda!19665 () Bool)

(assert (=> (not b_lambda!19665) (not b!1161442)))

(declare-fun t!36979 () Bool)

(declare-fun tb!9381 () Bool)

(assert (=> (and start!98966 (= defaultEntry!1004 defaultEntry!1004) t!36979) tb!9381))

(declare-fun result!19335 () Bool)

(assert (=> tb!9381 (= result!19335 tp_is_empty!29107)))

(assert (=> b!1161442 t!36979))

(declare-fun b_and!39983 () Bool)

(assert (= b_and!39981 (and (=> t!36979 result!19335) b_and!39983)))

(declare-fun m!1069755 () Bool)

(assert (=> bm!56444 m!1069755))

(declare-fun m!1069757 () Bool)

(assert (=> bm!56440 m!1069757))

(declare-fun m!1069759 () Bool)

(assert (=> b!1161441 m!1069759))

(declare-fun m!1069761 () Bool)

(assert (=> b!1161441 m!1069761))

(declare-fun m!1069763 () Bool)

(assert (=> start!98966 m!1069763))

(declare-fun m!1069765 () Bool)

(assert (=> start!98966 m!1069765))

(assert (=> b!1161438 m!1069757))

(declare-fun m!1069767 () Bool)

(assert (=> b!1161438 m!1069767))

(declare-fun m!1069769 () Bool)

(assert (=> b!1161438 m!1069769))

(assert (=> b!1161438 m!1069759))

(declare-fun m!1069771 () Bool)

(assert (=> b!1161438 m!1069771))

(assert (=> b!1161438 m!1069769))

(declare-fun m!1069773 () Bool)

(assert (=> b!1161438 m!1069773))

(declare-fun m!1069775 () Bool)

(assert (=> b!1161438 m!1069775))

(assert (=> b!1161438 m!1069773))

(assert (=> b!1161438 m!1069759))

(declare-fun m!1069777 () Bool)

(assert (=> b!1161438 m!1069777))

(assert (=> b!1161438 m!1069759))

(declare-fun m!1069779 () Bool)

(assert (=> b!1161438 m!1069779))

(declare-fun m!1069781 () Bool)

(assert (=> bm!56446 m!1069781))

(declare-fun m!1069783 () Bool)

(assert (=> bm!56443 m!1069783))

(declare-fun m!1069785 () Bool)

(assert (=> b!1161444 m!1069785))

(declare-fun m!1069787 () Bool)

(assert (=> b!1161444 m!1069787))

(declare-fun m!1069789 () Bool)

(assert (=> b!1161445 m!1069789))

(declare-fun m!1069791 () Bool)

(assert (=> b!1161445 m!1069791))

(declare-fun m!1069793 () Bool)

(assert (=> bm!56441 m!1069793))

(declare-fun m!1069795 () Bool)

(assert (=> b!1161447 m!1069795))

(declare-fun m!1069797 () Bool)

(assert (=> b!1161430 m!1069797))

(declare-fun m!1069799 () Bool)

(assert (=> b!1161453 m!1069799))

(declare-fun m!1069801 () Bool)

(assert (=> b!1161431 m!1069801))

(declare-fun m!1069803 () Bool)

(assert (=> b!1161448 m!1069803))

(assert (=> b!1161456 m!1069793))

(declare-fun m!1069805 () Bool)

(assert (=> b!1161451 m!1069805))

(assert (=> b!1161451 m!1069805))

(declare-fun m!1069807 () Bool)

(assert (=> b!1161451 m!1069807))

(declare-fun m!1069809 () Bool)

(assert (=> b!1161451 m!1069809))

(declare-fun m!1069811 () Bool)

(assert (=> b!1161432 m!1069811))

(declare-fun m!1069813 () Bool)

(assert (=> b!1161434 m!1069813))

(declare-fun m!1069815 () Bool)

(assert (=> b!1161437 m!1069815))

(declare-fun m!1069817 () Bool)

(assert (=> b!1161437 m!1069817))

(declare-fun m!1069819 () Bool)

(assert (=> b!1161437 m!1069819))

(declare-fun m!1069821 () Bool)

(assert (=> b!1161437 m!1069821))

(declare-fun m!1069823 () Bool)

(assert (=> mapNonEmpty!45485 m!1069823))

(declare-fun m!1069825 () Bool)

(assert (=> b!1161439 m!1069825))

(assert (=> b!1161433 m!1069811))

(declare-fun m!1069827 () Bool)

(assert (=> b!1161442 m!1069827))

(declare-fun m!1069829 () Bool)

(assert (=> b!1161442 m!1069829))

(declare-fun m!1069831 () Bool)

(assert (=> b!1161442 m!1069831))

(declare-fun m!1069833 () Bool)

(assert (=> b!1161442 m!1069833))

(check-sat tp_is_empty!29107 (not b!1161437) (not b!1161447) (not b!1161430) (not b!1161448) (not b!1161439) (not b!1161456) (not bm!56440) (not bm!56446) (not b!1161432) (not b!1161441) (not b!1161442) (not bm!56441) (not mapNonEmpty!45485) (not b!1161438) (not bm!56444) b_and!39983 (not b!1161431) (not b!1161433) (not start!98966) (not b!1161444) (not b!1161434) (not bm!56443) (not b!1161451) (not b_lambda!19665) (not b_next!24577) (not b!1161445))
(check-sat b_and!39983 (not b_next!24577))
