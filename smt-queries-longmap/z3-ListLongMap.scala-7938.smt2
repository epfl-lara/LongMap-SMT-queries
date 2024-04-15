; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98462 () Bool)

(assert start!98462)

(declare-fun b_free!24073 () Bool)

(declare-fun b_next!24073 () Bool)

(assert (=> start!98462 (= b_free!24073 (not b_next!24073))))

(declare-fun tp!84930 () Bool)

(declare-fun b_and!38973 () Bool)

(assert (=> start!98462 (= tp!84930 b_and!38973)))

(declare-fun b!1138433 () Bool)

(declare-fun call!50399 () Bool)

(assert (=> b!1138433 call!50399))

(declare-datatypes ((Unit!37157 0))(
  ( (Unit!37158) )
))
(declare-fun lt!506381 () Unit!37157)

(declare-fun call!50400 () Unit!37157)

(assert (=> b!1138433 (= lt!506381 call!50400)))

(declare-fun e!647766 () Unit!37157)

(assert (=> b!1138433 (= e!647766 lt!506381)))

(declare-fun b!1138434 () Bool)

(declare-fun res!759438 () Bool)

(declare-fun e!647763 () Bool)

(assert (=> b!1138434 (=> (not res!759438) (not e!647763))))

(declare-datatypes ((array!73988 0))(
  ( (array!73989 (arr!35645 (Array (_ BitVec 32) (_ BitVec 64))) (size!36183 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73988)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73988 (_ BitVec 32)) Bool)

(assert (=> b!1138434 (= res!759438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138435 () Bool)

(declare-fun e!647764 () Unit!37157)

(declare-fun Unit!37159 () Unit!37157)

(assert (=> b!1138435 (= e!647764 Unit!37159)))

(declare-fun lt!506370 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138435 (= lt!506370 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111491 () Bool)

(assert (=> b!1138435 (= c!111491 (and (not lt!506370) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506372 () Unit!37157)

(declare-fun e!647769 () Unit!37157)

(assert (=> b!1138435 (= lt!506372 e!647769)))

(declare-datatypes ((V!43265 0))(
  ( (V!43266 (val!14358 Int)) )
))
(declare-fun zeroValue!944 () V!43265)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13592 0))(
  ( (ValueCellFull!13592 (v!16994 V!43265)) (EmptyCell!13592) )
))
(declare-datatypes ((array!73990 0))(
  ( (array!73991 (arr!35646 (Array (_ BitVec 32) ValueCell!13592)) (size!36184 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73990)

(declare-fun minValue!944 () V!43265)

(declare-fun lt!506378 () Unit!37157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!366 (array!73988 array!73990 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 64) (_ BitVec 32) Int) Unit!37157)

(assert (=> b!1138435 (= lt!506378 (lemmaListMapContainsThenArrayContainsFrom!366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111490 () Bool)

(assert (=> b!1138435 (= c!111490 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759436 () Bool)

(declare-fun e!647755 () Bool)

(assert (=> b!1138435 (= res!759436 e!647755)))

(declare-fun e!647759 () Bool)

(assert (=> b!1138435 (=> (not res!759436) (not e!647759))))

(assert (=> b!1138435 e!647759))

(declare-fun lt!506365 () Unit!37157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73988 (_ BitVec 32) (_ BitVec 32)) Unit!37157)

(assert (=> b!1138435 (= lt!506365 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24970 0))(
  ( (Nil!24967) (Cons!24966 (h!26175 (_ BitVec 64)) (t!36026 List!24970)) )
))
(declare-fun arrayNoDuplicates!0 (array!73988 (_ BitVec 32) List!24970) Bool)

(assert (=> b!1138435 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24967)))

(declare-fun lt!506375 () Unit!37157)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73988 (_ BitVec 64) (_ BitVec 32) List!24970) Unit!37157)

(assert (=> b!1138435 (= lt!506375 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24967))))

(assert (=> b!1138435 false))

(declare-fun b!1138436 () Bool)

(declare-fun res!759434 () Bool)

(assert (=> b!1138436 (=> (not res!759434) (not e!647763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138436 (= res!759434 (validKeyInArray!0 k0!934))))

(declare-fun b!1138438 () Bool)

(declare-fun e!647768 () Bool)

(declare-fun e!647760 () Bool)

(assert (=> b!1138438 (= e!647768 e!647760)))

(declare-fun res!759435 () Bool)

(assert (=> b!1138438 (=> res!759435 e!647760)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138438 (= res!759435 (not (= from!1455 i!673)))))

(declare-fun lt!506366 () array!73988)

(declare-fun lt!506368 () array!73990)

(declare-datatypes ((tuple2!18230 0))(
  ( (tuple2!18231 (_1!9126 (_ BitVec 64)) (_2!9126 V!43265)) )
))
(declare-datatypes ((List!24971 0))(
  ( (Nil!24968) (Cons!24967 (h!26176 tuple2!18230) (t!36027 List!24971)) )
))
(declare-datatypes ((ListLongMap!16199 0))(
  ( (ListLongMap!16200 (toList!8115 List!24971)) )
))
(declare-fun lt!506380 () ListLongMap!16199)

(declare-fun getCurrentListMapNoExtraKeys!4610 (array!73988 array!73990 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) Int) ListLongMap!16199)

(assert (=> b!1138438 (= lt!506380 (getCurrentListMapNoExtraKeys!4610 lt!506366 lt!506368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2599 (Int (_ BitVec 64)) V!43265)

(assert (=> b!1138438 (= lt!506368 (array!73991 (store (arr!35646 _values!996) i!673 (ValueCellFull!13592 (dynLambda!2599 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36184 _values!996)))))

(declare-fun lt!506382 () ListLongMap!16199)

(assert (=> b!1138438 (= lt!506382 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138439 () Bool)

(declare-fun arrayContainsKey!0 (array!73988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138439 (= e!647755 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138440 () Bool)

(declare-fun lt!506367 () ListLongMap!16199)

(declare-fun contains!6588 (ListLongMap!16199 (_ BitVec 64)) Bool)

(declare-fun +!3542 (ListLongMap!16199 tuple2!18230) ListLongMap!16199)

(assert (=> b!1138440 (contains!6588 (+!3542 lt!506367 (tuple2!18231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506379 () Unit!37157)

(declare-fun addStillContains!762 (ListLongMap!16199 (_ BitVec 64) V!43265 (_ BitVec 64)) Unit!37157)

(assert (=> b!1138440 (= lt!506379 (addStillContains!762 lt!506367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50395 () Bool)

(assert (=> b!1138440 call!50395))

(declare-fun call!50402 () ListLongMap!16199)

(assert (=> b!1138440 (= lt!506367 call!50402)))

(declare-fun lt!506377 () Unit!37157)

(declare-fun call!50398 () Unit!37157)

(assert (=> b!1138440 (= lt!506377 call!50398)))

(assert (=> b!1138440 (= e!647769 lt!506379)))

(declare-fun b!1138441 () Bool)

(declare-fun c!111489 () Bool)

(assert (=> b!1138441 (= c!111489 (and (not lt!506370) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647757 () Unit!37157)

(assert (=> b!1138441 (= e!647769 e!647757)))

(declare-fun b!1138442 () Bool)

(declare-fun e!647767 () Bool)

(declare-fun call!50401 () ListLongMap!16199)

(declare-fun call!50397 () ListLongMap!16199)

(declare-fun -!1205 (ListLongMap!16199 (_ BitVec 64)) ListLongMap!16199)

(assert (=> b!1138442 (= e!647767 (= call!50397 (-!1205 call!50401 k0!934)))))

(declare-fun b!1138443 () Bool)

(assert (=> b!1138443 (= e!647767 (= call!50397 call!50401))))

(declare-fun b!1138444 () Bool)

(declare-fun e!647765 () Bool)

(assert (=> b!1138444 (= e!647760 e!647765)))

(declare-fun res!759442 () Bool)

(assert (=> b!1138444 (=> res!759442 e!647765)))

(assert (=> b!1138444 (= res!759442 (not (= (select (arr!35645 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138444 e!647767))

(declare-fun c!111494 () Bool)

(assert (=> b!1138444 (= c!111494 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506369 () Unit!37157)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!489 (array!73988 array!73990 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37157)

(assert (=> b!1138444 (= lt!506369 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138445 () Bool)

(assert (=> b!1138445 (= e!647755 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506370) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!50392 () Bool)

(assert (=> bm!50392 (= call!50400 call!50398)))

(declare-fun bm!50393 () Bool)

(declare-fun lt!506373 () ListLongMap!16199)

(assert (=> bm!50393 (= call!50402 (+!3542 lt!506373 (ite (or c!111491 c!111489) (tuple2!18231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1138446 () Bool)

(assert (=> b!1138446 (= e!647759 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138447 () Bool)

(declare-fun lt!506376 () Unit!37157)

(assert (=> b!1138447 (= e!647757 lt!506376)))

(assert (=> b!1138447 (= lt!506376 call!50400)))

(assert (=> b!1138447 call!50399))

(declare-fun b!1138448 () Bool)

(assert (=> b!1138448 (= e!647765 true)))

(declare-fun lt!506374 () Unit!37157)

(assert (=> b!1138448 (= lt!506374 e!647764)))

(declare-fun c!111492 () Bool)

(assert (=> b!1138448 (= c!111492 (contains!6588 lt!506373 k0!934))))

(assert (=> b!1138448 (= lt!506373 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!759431 () Bool)

(assert (=> start!98462 (=> (not res!759431) (not e!647763))))

(assert (=> start!98462 (= res!759431 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36183 _keys!1208))))))

(assert (=> start!98462 e!647763))

(declare-fun tp_is_empty!28603 () Bool)

(assert (=> start!98462 tp_is_empty!28603))

(declare-fun array_inv!27396 (array!73988) Bool)

(assert (=> start!98462 (array_inv!27396 _keys!1208)))

(assert (=> start!98462 true))

(assert (=> start!98462 tp!84930))

(declare-fun e!647754 () Bool)

(declare-fun array_inv!27397 (array!73990) Bool)

(assert (=> start!98462 (and (array_inv!27397 _values!996) e!647754)))

(declare-fun b!1138437 () Bool)

(declare-fun e!647761 () Bool)

(assert (=> b!1138437 (= e!647761 tp_is_empty!28603)))

(declare-fun b!1138449 () Bool)

(declare-fun res!759432 () Bool)

(declare-fun e!647756 () Bool)

(assert (=> b!1138449 (=> (not res!759432) (not e!647756))))

(assert (=> b!1138449 (= res!759432 (arrayNoDuplicates!0 lt!506366 #b00000000000000000000000000000000 Nil!24967))))

(declare-fun bm!50394 () Bool)

(assert (=> bm!50394 (= call!50397 (getCurrentListMapNoExtraKeys!4610 lt!506366 lt!506368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138450 () Bool)

(declare-fun Unit!37160 () Unit!37157)

(assert (=> b!1138450 (= e!647766 Unit!37160)))

(declare-fun bm!50395 () Bool)

(assert (=> bm!50395 (= call!50401 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138451 () Bool)

(declare-fun e!647762 () Bool)

(assert (=> b!1138451 (= e!647762 tp_is_empty!28603)))

(declare-fun b!1138452 () Bool)

(declare-fun res!759437 () Bool)

(assert (=> b!1138452 (=> (not res!759437) (not e!647763))))

(assert (=> b!1138452 (= res!759437 (and (= (size!36184 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36183 _keys!1208) (size!36184 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50396 () Bool)

(declare-fun call!50396 () ListLongMap!16199)

(assert (=> bm!50396 (= call!50396 call!50402)))

(declare-fun b!1138453 () Bool)

(assert (=> b!1138453 (= e!647763 e!647756)))

(declare-fun res!759430 () Bool)

(assert (=> b!1138453 (=> (not res!759430) (not e!647756))))

(assert (=> b!1138453 (= res!759430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506366 mask!1564))))

(assert (=> b!1138453 (= lt!506366 (array!73989 (store (arr!35645 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36183 _keys!1208)))))

(declare-fun mapIsEmpty!44729 () Bool)

(declare-fun mapRes!44729 () Bool)

(assert (=> mapIsEmpty!44729 mapRes!44729))

(declare-fun b!1138454 () Bool)

(declare-fun res!759433 () Bool)

(assert (=> b!1138454 (=> (not res!759433) (not e!647763))))

(assert (=> b!1138454 (= res!759433 (= (select (arr!35645 _keys!1208) i!673) k0!934))))

(declare-fun bm!50397 () Bool)

(assert (=> bm!50397 (= call!50399 call!50395)))

(declare-fun mapNonEmpty!44729 () Bool)

(declare-fun tp!84929 () Bool)

(assert (=> mapNonEmpty!44729 (= mapRes!44729 (and tp!84929 e!647761))))

(declare-fun mapKey!44729 () (_ BitVec 32))

(declare-fun mapRest!44729 () (Array (_ BitVec 32) ValueCell!13592))

(declare-fun mapValue!44729 () ValueCell!13592)

(assert (=> mapNonEmpty!44729 (= (arr!35646 _values!996) (store mapRest!44729 mapKey!44729 mapValue!44729))))

(declare-fun b!1138455 () Bool)

(assert (=> b!1138455 (= e!647754 (and e!647762 mapRes!44729))))

(declare-fun condMapEmpty!44729 () Bool)

(declare-fun mapDefault!44729 () ValueCell!13592)

(assert (=> b!1138455 (= condMapEmpty!44729 (= (arr!35646 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13592)) mapDefault!44729)))))

(declare-fun b!1138456 () Bool)

(declare-fun res!759443 () Bool)

(assert (=> b!1138456 (=> (not res!759443) (not e!647763))))

(assert (=> b!1138456 (= res!759443 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36183 _keys!1208))))))

(declare-fun bm!50398 () Bool)

(assert (=> bm!50398 (= call!50395 (contains!6588 (ite c!111491 lt!506367 call!50396) k0!934))))

(declare-fun b!1138457 () Bool)

(assert (=> b!1138457 (= e!647757 e!647766)))

(declare-fun c!111493 () Bool)

(assert (=> b!1138457 (= c!111493 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506370))))

(declare-fun bm!50399 () Bool)

(assert (=> bm!50399 (= call!50398 (addStillContains!762 lt!506373 (ite (or c!111491 c!111489) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111491 c!111489) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1138458 () Bool)

(declare-fun res!759439 () Bool)

(assert (=> b!1138458 (=> (not res!759439) (not e!647763))))

(assert (=> b!1138458 (= res!759439 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24967))))

(declare-fun b!1138459 () Bool)

(declare-fun Unit!37161 () Unit!37157)

(assert (=> b!1138459 (= e!647764 Unit!37161)))

(declare-fun b!1138460 () Bool)

(declare-fun res!759440 () Bool)

(assert (=> b!1138460 (=> (not res!759440) (not e!647763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138460 (= res!759440 (validMask!0 mask!1564))))

(declare-fun b!1138461 () Bool)

(assert (=> b!1138461 (= e!647756 (not e!647768))))

(declare-fun res!759441 () Bool)

(assert (=> b!1138461 (=> res!759441 e!647768)))

(assert (=> b!1138461 (= res!759441 (bvsgt from!1455 i!673))))

(assert (=> b!1138461 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506371 () Unit!37157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73988 (_ BitVec 64) (_ BitVec 32)) Unit!37157)

(assert (=> b!1138461 (= lt!506371 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98462 res!759431) b!1138460))

(assert (= (and b!1138460 res!759440) b!1138452))

(assert (= (and b!1138452 res!759437) b!1138434))

(assert (= (and b!1138434 res!759438) b!1138458))

(assert (= (and b!1138458 res!759439) b!1138456))

(assert (= (and b!1138456 res!759443) b!1138436))

(assert (= (and b!1138436 res!759434) b!1138454))

(assert (= (and b!1138454 res!759433) b!1138453))

(assert (= (and b!1138453 res!759430) b!1138449))

(assert (= (and b!1138449 res!759432) b!1138461))

(assert (= (and b!1138461 (not res!759441)) b!1138438))

(assert (= (and b!1138438 (not res!759435)) b!1138444))

(assert (= (and b!1138444 c!111494) b!1138442))

(assert (= (and b!1138444 (not c!111494)) b!1138443))

(assert (= (or b!1138442 b!1138443) bm!50394))

(assert (= (or b!1138442 b!1138443) bm!50395))

(assert (= (and b!1138444 (not res!759442)) b!1138448))

(assert (= (and b!1138448 c!111492) b!1138435))

(assert (= (and b!1138448 (not c!111492)) b!1138459))

(assert (= (and b!1138435 c!111491) b!1138440))

(assert (= (and b!1138435 (not c!111491)) b!1138441))

(assert (= (and b!1138441 c!111489) b!1138447))

(assert (= (and b!1138441 (not c!111489)) b!1138457))

(assert (= (and b!1138457 c!111493) b!1138433))

(assert (= (and b!1138457 (not c!111493)) b!1138450))

(assert (= (or b!1138447 b!1138433) bm!50392))

(assert (= (or b!1138447 b!1138433) bm!50396))

(assert (= (or b!1138447 b!1138433) bm!50397))

(assert (= (or b!1138440 bm!50397) bm!50398))

(assert (= (or b!1138440 bm!50392) bm!50399))

(assert (= (or b!1138440 bm!50396) bm!50393))

(assert (= (and b!1138435 c!111490) b!1138439))

(assert (= (and b!1138435 (not c!111490)) b!1138445))

(assert (= (and b!1138435 res!759436) b!1138446))

(assert (= (and b!1138455 condMapEmpty!44729) mapIsEmpty!44729))

(assert (= (and b!1138455 (not condMapEmpty!44729)) mapNonEmpty!44729))

(get-info :version)

(assert (= (and mapNonEmpty!44729 ((_ is ValueCellFull!13592) mapValue!44729)) b!1138437))

(assert (= (and b!1138455 ((_ is ValueCellFull!13592) mapDefault!44729)) b!1138451))

(assert (= start!98462 b!1138455))

(declare-fun b_lambda!19161 () Bool)

(assert (=> (not b_lambda!19161) (not b!1138438)))

(declare-fun t!36025 () Bool)

(declare-fun tb!8877 () Bool)

(assert (=> (and start!98462 (= defaultEntry!1004 defaultEntry!1004) t!36025) tb!8877))

(declare-fun result!18327 () Bool)

(assert (=> tb!8877 (= result!18327 tp_is_empty!28603)))

(assert (=> b!1138438 t!36025))

(declare-fun b_and!38975 () Bool)

(assert (= b_and!38973 (and (=> t!36025 result!18327) b_and!38975)))

(declare-fun m!1049783 () Bool)

(assert (=> b!1138436 m!1049783))

(declare-fun m!1049785 () Bool)

(assert (=> b!1138442 m!1049785))

(declare-fun m!1049787 () Bool)

(assert (=> b!1138449 m!1049787))

(declare-fun m!1049789 () Bool)

(assert (=> b!1138444 m!1049789))

(declare-fun m!1049791 () Bool)

(assert (=> b!1138444 m!1049791))

(declare-fun m!1049793 () Bool)

(assert (=> b!1138460 m!1049793))

(declare-fun m!1049795 () Bool)

(assert (=> b!1138458 m!1049795))

(declare-fun m!1049797 () Bool)

(assert (=> b!1138439 m!1049797))

(declare-fun m!1049799 () Bool)

(assert (=> b!1138448 m!1049799))

(declare-fun m!1049801 () Bool)

(assert (=> b!1138448 m!1049801))

(assert (=> b!1138446 m!1049797))

(declare-fun m!1049803 () Bool)

(assert (=> bm!50398 m!1049803))

(declare-fun m!1049805 () Bool)

(assert (=> mapNonEmpty!44729 m!1049805))

(declare-fun m!1049807 () Bool)

(assert (=> start!98462 m!1049807))

(declare-fun m!1049809 () Bool)

(assert (=> start!98462 m!1049809))

(declare-fun m!1049811 () Bool)

(assert (=> bm!50393 m!1049811))

(declare-fun m!1049813 () Bool)

(assert (=> b!1138434 m!1049813))

(declare-fun m!1049815 () Bool)

(assert (=> bm!50399 m!1049815))

(assert (=> bm!50395 m!1049801))

(declare-fun m!1049817 () Bool)

(assert (=> b!1138453 m!1049817))

(declare-fun m!1049819 () Bool)

(assert (=> b!1138453 m!1049819))

(declare-fun m!1049821 () Bool)

(assert (=> b!1138454 m!1049821))

(declare-fun m!1049823 () Bool)

(assert (=> b!1138438 m!1049823))

(declare-fun m!1049825 () Bool)

(assert (=> b!1138438 m!1049825))

(declare-fun m!1049827 () Bool)

(assert (=> b!1138438 m!1049827))

(declare-fun m!1049829 () Bool)

(assert (=> b!1138438 m!1049829))

(declare-fun m!1049831 () Bool)

(assert (=> bm!50394 m!1049831))

(declare-fun m!1049833 () Bool)

(assert (=> b!1138440 m!1049833))

(assert (=> b!1138440 m!1049833))

(declare-fun m!1049835 () Bool)

(assert (=> b!1138440 m!1049835))

(declare-fun m!1049837 () Bool)

(assert (=> b!1138440 m!1049837))

(declare-fun m!1049839 () Bool)

(assert (=> b!1138435 m!1049839))

(declare-fun m!1049841 () Bool)

(assert (=> b!1138435 m!1049841))

(declare-fun m!1049843 () Bool)

(assert (=> b!1138435 m!1049843))

(declare-fun m!1049845 () Bool)

(assert (=> b!1138435 m!1049845))

(declare-fun m!1049847 () Bool)

(assert (=> b!1138461 m!1049847))

(declare-fun m!1049849 () Bool)

(assert (=> b!1138461 m!1049849))

(check-sat (not b!1138444) (not b!1138440) (not bm!50393) (not b!1138453) (not mapNonEmpty!44729) (not b_lambda!19161) (not b!1138435) (not b!1138438) (not b!1138439) (not b!1138460) (not b!1138442) (not bm!50398) (not b!1138461) (not start!98462) (not bm!50399) (not bm!50395) (not b_next!24073) (not b!1138458) (not b!1138436) tp_is_empty!28603 (not b!1138449) (not b!1138434) b_and!38975 (not b!1138448) (not b!1138446) (not bm!50394))
(check-sat b_and!38975 (not b_next!24073))
