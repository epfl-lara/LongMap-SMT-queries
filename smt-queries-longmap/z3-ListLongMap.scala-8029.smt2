; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99008 () Bool)

(assert start!99008)

(declare-fun b_free!24619 () Bool)

(declare-fun b_next!24619 () Bool)

(assert (=> start!99008 (= b_free!24619 (not b_next!24619))))

(declare-fun tp!86567 () Bool)

(declare-fun b_and!40065 () Bool)

(assert (=> start!99008 (= tp!86567 b_and!40065)))

(declare-fun res!771539 () Bool)

(declare-fun e!661493 () Bool)

(assert (=> start!99008 (=> (not res!771539) (not e!661493))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75054 0))(
  ( (array!75055 (arr!36178 (Array (_ BitVec 32) (_ BitVec 64))) (size!36716 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75054)

(assert (=> start!99008 (= res!771539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36716 _keys!1208))))))

(assert (=> start!99008 e!661493))

(declare-fun tp_is_empty!29149 () Bool)

(assert (=> start!99008 tp_is_empty!29149))

(declare-fun array_inv!27790 (array!75054) Bool)

(assert (=> start!99008 (array_inv!27790 _keys!1208)))

(assert (=> start!99008 true))

(assert (=> start!99008 tp!86567))

(declare-datatypes ((V!43993 0))(
  ( (V!43994 (val!14631 Int)) )
))
(declare-datatypes ((ValueCell!13865 0))(
  ( (ValueCellFull!13865 (v!17267 V!43993)) (EmptyCell!13865) )
))
(declare-datatypes ((array!75056 0))(
  ( (array!75057 (arr!36179 (Array (_ BitVec 32) ValueCell!13865)) (size!36717 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75056)

(declare-fun e!661494 () Bool)

(declare-fun array_inv!27791 (array!75056) Bool)

(assert (=> start!99008 (and (array_inv!27791 _values!996) e!661494)))

(declare-fun bm!56944 () Bool)

(declare-datatypes ((tuple2!18738 0))(
  ( (tuple2!18739 (_1!9380 (_ BitVec 64)) (_2!9380 V!43993)) )
))
(declare-datatypes ((List!25456 0))(
  ( (Nil!25453) (Cons!25452 (h!26661 tuple2!18738) (t!37058 List!25456)) )
))
(declare-datatypes ((ListLongMap!16707 0))(
  ( (ListLongMap!16708 (toList!8369 List!25456)) )
))
(declare-fun call!56947 () ListLongMap!16707)

(declare-fun call!56951 () ListLongMap!16707)

(assert (=> bm!56944 (= call!56947 call!56951)))

(declare-fun b!1163362 () Bool)

(declare-fun c!116404 () Bool)

(declare-fun lt!523968 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1163362 (= c!116404 (and (not lt!523968) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38225 0))(
  ( (Unit!38226) )
))
(declare-fun e!661505 () Unit!38225)

(declare-fun e!661497 () Unit!38225)

(assert (=> b!1163362 (= e!661505 e!661497)))

(declare-fun b!1163363 () Bool)

(declare-fun e!661504 () Unit!38225)

(assert (=> b!1163363 (= e!661497 e!661504)))

(declare-fun c!116406 () Bool)

(assert (=> b!1163363 (= c!116406 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523968))))

(declare-fun zeroValue!944 () V!43993)

(declare-fun lt!523981 () ListLongMap!16707)

(declare-fun call!56948 () Unit!38225)

(declare-fun bm!56945 () Bool)

(declare-fun lt!523974 () ListLongMap!16707)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!116408 () Bool)

(declare-fun minValue!944 () V!43993)

(declare-fun addStillContains!978 (ListLongMap!16707 (_ BitVec 64) V!43993 (_ BitVec 64)) Unit!38225)

(assert (=> bm!56945 (= call!56948 (addStillContains!978 (ite c!116408 lt!523981 lt!523974) (ite c!116408 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116404 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116408 minValue!944 (ite c!116404 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163364 () Bool)

(declare-fun res!771538 () Bool)

(assert (=> b!1163364 (=> (not res!771538) (not e!661493))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163364 (= res!771538 (= (select (arr!36178 _keys!1208) i!673) k0!934))))

(declare-fun b!1163365 () Bool)

(declare-fun contains!6813 (ListLongMap!16707 (_ BitVec 64)) Bool)

(assert (=> b!1163365 (contains!6813 call!56951 k0!934)))

(declare-fun lt!523984 () Unit!38225)

(assert (=> b!1163365 (= lt!523984 call!56948)))

(declare-fun call!56952 () Bool)

(assert (=> b!1163365 call!56952))

(declare-fun +!3770 (ListLongMap!16707 tuple2!18738) ListLongMap!16707)

(assert (=> b!1163365 (= lt!523981 (+!3770 lt!523974 (tuple2!18739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523975 () Unit!38225)

(assert (=> b!1163365 (= lt!523975 (addStillContains!978 lt!523974 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163365 (= e!661505 lt!523984)))

(declare-fun e!661492 () Bool)

(declare-fun b!1163366 () Bool)

(declare-fun arrayContainsKey!0 (array!75054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163366 (= e!661492 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!661495 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!523979 () ListLongMap!16707)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523972 () array!75054)

(declare-fun b!1163367 () Bool)

(declare-fun lt!523971 () array!75056)

(declare-fun getCurrentListMapNoExtraKeys!4847 (array!75054 array!75056 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 32) Int) ListLongMap!16707)

(assert (=> b!1163367 (= e!661495 (= lt!523979 (getCurrentListMapNoExtraKeys!4847 lt!523972 lt!523971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163368 () Bool)

(declare-fun e!661499 () Bool)

(assert (=> b!1163368 (= e!661493 e!661499)))

(declare-fun res!771533 () Bool)

(assert (=> b!1163368 (=> (not res!771533) (not e!661499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75054 (_ BitVec 32)) Bool)

(assert (=> b!1163368 (= res!771533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523972 mask!1564))))

(assert (=> b!1163368 (= lt!523972 (array!75055 (store (arr!36178 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36716 _keys!1208)))))

(declare-fun b!1163369 () Bool)

(declare-fun e!661490 () Unit!38225)

(declare-fun Unit!38227 () Unit!38225)

(assert (=> b!1163369 (= e!661490 Unit!38227)))

(assert (=> b!1163369 (= lt!523968 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163369 (= c!116408 (and (not lt!523968) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523980 () Unit!38225)

(assert (=> b!1163369 (= lt!523980 e!661505)))

(declare-fun lt!523989 () Unit!38225)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!550 (array!75054 array!75056 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 64) (_ BitVec 32) Int) Unit!38225)

(assert (=> b!1163369 (= lt!523989 (lemmaListMapContainsThenArrayContainsFrom!550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116405 () Bool)

(assert (=> b!1163369 (= c!116405 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771534 () Bool)

(assert (=> b!1163369 (= res!771534 e!661492)))

(declare-fun e!661491 () Bool)

(assert (=> b!1163369 (=> (not res!771534) (not e!661491))))

(assert (=> b!1163369 e!661491))

(declare-fun lt!523976 () Unit!38225)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75054 (_ BitVec 32) (_ BitVec 32)) Unit!38225)

(assert (=> b!1163369 (= lt!523976 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25457 0))(
  ( (Nil!25454) (Cons!25453 (h!26662 (_ BitVec 64)) (t!37059 List!25457)) )
))
(declare-fun arrayNoDuplicates!0 (array!75054 (_ BitVec 32) List!25457) Bool)

(assert (=> b!1163369 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25454)))

(declare-fun lt!523969 () Unit!38225)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75054 (_ BitVec 64) (_ BitVec 32) List!25457) Unit!38225)

(assert (=> b!1163369 (= lt!523969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25454))))

(assert (=> b!1163369 false))

(declare-fun b!1163370 () Bool)

(declare-fun res!771537 () Bool)

(assert (=> b!1163370 (=> (not res!771537) (not e!661493))))

(assert (=> b!1163370 (= res!771537 (and (= (size!36717 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36716 _keys!1208) (size!36717 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163371 () Bool)

(assert (=> b!1163371 (= e!661491 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163372 () Bool)

(declare-fun res!771529 () Bool)

(assert (=> b!1163372 (=> (not res!771529) (not e!661493))))

(assert (=> b!1163372 (= res!771529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163373 () Bool)

(declare-fun Unit!38228 () Unit!38225)

(assert (=> b!1163373 (= e!661490 Unit!38228)))

(declare-fun b!1163374 () Bool)

(declare-fun e!661502 () Bool)

(declare-fun mapRes!45548 () Bool)

(assert (=> b!1163374 (= e!661494 (and e!661502 mapRes!45548))))

(declare-fun condMapEmpty!45548 () Bool)

(declare-fun mapDefault!45548 () ValueCell!13865)

(assert (=> b!1163374 (= condMapEmpty!45548 (= (arr!36179 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13865)) mapDefault!45548)))))

(declare-fun b!1163375 () Bool)

(assert (=> b!1163375 (= e!661492 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523968) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163376 () Bool)

(declare-fun res!771532 () Bool)

(assert (=> b!1163376 (=> (not res!771532) (not e!661493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163376 (= res!771532 (validMask!0 mask!1564))))

(declare-fun call!56954 () ListLongMap!16707)

(declare-fun bm!56946 () Bool)

(assert (=> bm!56946 (= call!56954 (getCurrentListMapNoExtraKeys!4847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163377 () Bool)

(declare-fun res!771531 () Bool)

(assert (=> b!1163377 (=> (not res!771531) (not e!661493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163377 (= res!771531 (validKeyInArray!0 k0!934))))

(declare-fun b!1163378 () Bool)

(declare-fun e!661498 () Bool)

(assert (=> b!1163378 (= e!661499 (not e!661498))))

(declare-fun res!771535 () Bool)

(assert (=> b!1163378 (=> res!771535 e!661498)))

(assert (=> b!1163378 (= res!771535 (bvsgt from!1455 i!673))))

(assert (=> b!1163378 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523978 () Unit!38225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75054 (_ BitVec 64) (_ BitVec 32)) Unit!38225)

(assert (=> b!1163378 (= lt!523978 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163379 () Bool)

(declare-fun e!661496 () Bool)

(assert (=> b!1163379 (= e!661498 e!661496)))

(declare-fun res!771540 () Bool)

(assert (=> b!1163379 (=> res!771540 e!661496)))

(assert (=> b!1163379 (= res!771540 (not (= from!1455 i!673)))))

(declare-fun lt!523987 () ListLongMap!16707)

(assert (=> b!1163379 (= lt!523987 (getCurrentListMapNoExtraKeys!4847 lt!523972 lt!523971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523973 () V!43993)

(assert (=> b!1163379 (= lt!523971 (array!75057 (store (arr!36179 _values!996) i!673 (ValueCellFull!13865 lt!523973)) (size!36717 _values!996)))))

(declare-fun dynLambda!2780 (Int (_ BitVec 64)) V!43993)

(assert (=> b!1163379 (= lt!523973 (dynLambda!2780 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523982 () ListLongMap!16707)

(assert (=> b!1163379 (= lt!523982 (getCurrentListMapNoExtraKeys!4847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45548 () Bool)

(declare-fun tp!86568 () Bool)

(declare-fun e!661501 () Bool)

(assert (=> mapNonEmpty!45548 (= mapRes!45548 (and tp!86568 e!661501))))

(declare-fun mapRest!45548 () (Array (_ BitVec 32) ValueCell!13865))

(declare-fun mapKey!45548 () (_ BitVec 32))

(declare-fun mapValue!45548 () ValueCell!13865)

(assert (=> mapNonEmpty!45548 (= (arr!36179 _values!996) (store mapRest!45548 mapKey!45548 mapValue!45548))))

(declare-fun b!1163380 () Bool)

(declare-fun call!56949 () Bool)

(assert (=> b!1163380 call!56949))

(declare-fun lt!523985 () Unit!38225)

(declare-fun call!56950 () Unit!38225)

(assert (=> b!1163380 (= lt!523985 call!56950)))

(assert (=> b!1163380 (= e!661504 lt!523985)))

(declare-fun bm!56947 () Bool)

(assert (=> bm!56947 (= call!56951 (+!3770 (ite c!116408 lt!523981 lt!523974) (ite c!116408 (tuple2!18739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116404 (tuple2!18739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163381 () Bool)

(declare-fun res!771542 () Bool)

(assert (=> b!1163381 (=> (not res!771542) (not e!661493))))

(assert (=> b!1163381 (= res!771542 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36716 _keys!1208))))))

(declare-fun bm!56948 () Bool)

(assert (=> bm!56948 (= call!56952 (contains!6813 (ite c!116408 lt!523981 call!56947) k0!934))))

(declare-fun bm!56949 () Bool)

(assert (=> bm!56949 (= call!56950 call!56948)))

(declare-fun mapIsEmpty!45548 () Bool)

(assert (=> mapIsEmpty!45548 mapRes!45548))

(declare-fun b!1163382 () Bool)

(declare-fun e!661506 () Bool)

(assert (=> b!1163382 (= e!661496 e!661506)))

(declare-fun res!771536 () Bool)

(assert (=> b!1163382 (=> res!771536 e!661506)))

(assert (=> b!1163382 (= res!771536 (not (= (select (arr!36178 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661503 () Bool)

(assert (=> b!1163382 e!661503))

(declare-fun c!116407 () Bool)

(assert (=> b!1163382 (= c!116407 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523988 () Unit!38225)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 (array!75054 array!75056 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38225)

(assert (=> b!1163382 (= lt!523988 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163383 () Bool)

(declare-fun res!771541 () Bool)

(assert (=> b!1163383 (=> (not res!771541) (not e!661493))))

(assert (=> b!1163383 (= res!771541 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25454))))

(declare-fun b!1163384 () Bool)

(assert (=> b!1163384 (= e!661506 true)))

(assert (=> b!1163384 e!661495))

(declare-fun res!771528 () Bool)

(assert (=> b!1163384 (=> (not res!771528) (not e!661495))))

(assert (=> b!1163384 (= res!771528 (= lt!523979 lt!523974))))

(declare-fun -!1415 (ListLongMap!16707 (_ BitVec 64)) ListLongMap!16707)

(assert (=> b!1163384 (= lt!523979 (-!1415 lt!523982 k0!934))))

(declare-fun lt!523983 () V!43993)

(assert (=> b!1163384 (= (-!1415 (+!3770 lt!523974 (tuple2!18739 (select (arr!36178 _keys!1208) from!1455) lt!523983)) (select (arr!36178 _keys!1208) from!1455)) lt!523974)))

(declare-fun lt!523986 () Unit!38225)

(declare-fun addThenRemoveForNewKeyIsSame!254 (ListLongMap!16707 (_ BitVec 64) V!43993) Unit!38225)

(assert (=> b!1163384 (= lt!523986 (addThenRemoveForNewKeyIsSame!254 lt!523974 (select (arr!36178 _keys!1208) from!1455) lt!523983))))

(declare-fun get!18474 (ValueCell!13865 V!43993) V!43993)

(assert (=> b!1163384 (= lt!523983 (get!18474 (select (arr!36179 _values!996) from!1455) lt!523973))))

(declare-fun lt!523977 () Unit!38225)

(assert (=> b!1163384 (= lt!523977 e!661490)))

(declare-fun c!116403 () Bool)

(assert (=> b!1163384 (= c!116403 (contains!6813 lt!523974 k0!934))))

(assert (=> b!1163384 (= lt!523974 (getCurrentListMapNoExtraKeys!4847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163385 () Bool)

(declare-fun call!56953 () ListLongMap!16707)

(assert (=> b!1163385 (= e!661503 (= call!56953 call!56954))))

(declare-fun b!1163386 () Bool)

(declare-fun res!771530 () Bool)

(assert (=> b!1163386 (=> (not res!771530) (not e!661499))))

(assert (=> b!1163386 (= res!771530 (arrayNoDuplicates!0 lt!523972 #b00000000000000000000000000000000 Nil!25454))))

(declare-fun bm!56950 () Bool)

(assert (=> bm!56950 (= call!56953 (getCurrentListMapNoExtraKeys!4847 lt!523972 lt!523971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163387 () Bool)

(assert (=> b!1163387 (= e!661501 tp_is_empty!29149)))

(declare-fun b!1163388 () Bool)

(assert (=> b!1163388 (= e!661502 tp_is_empty!29149)))

(declare-fun b!1163389 () Bool)

(assert (=> b!1163389 (= e!661503 (= call!56953 (-!1415 call!56954 k0!934)))))

(declare-fun bm!56951 () Bool)

(assert (=> bm!56951 (= call!56949 call!56952)))

(declare-fun b!1163390 () Bool)

(declare-fun Unit!38229 () Unit!38225)

(assert (=> b!1163390 (= e!661504 Unit!38229)))

(declare-fun b!1163391 () Bool)

(declare-fun lt!523970 () Unit!38225)

(assert (=> b!1163391 (= e!661497 lt!523970)))

(assert (=> b!1163391 (= lt!523970 call!56950)))

(assert (=> b!1163391 call!56949))

(assert (= (and start!99008 res!771539) b!1163376))

(assert (= (and b!1163376 res!771532) b!1163370))

(assert (= (and b!1163370 res!771537) b!1163372))

(assert (= (and b!1163372 res!771529) b!1163383))

(assert (= (and b!1163383 res!771541) b!1163381))

(assert (= (and b!1163381 res!771542) b!1163377))

(assert (= (and b!1163377 res!771531) b!1163364))

(assert (= (and b!1163364 res!771538) b!1163368))

(assert (= (and b!1163368 res!771533) b!1163386))

(assert (= (and b!1163386 res!771530) b!1163378))

(assert (= (and b!1163378 (not res!771535)) b!1163379))

(assert (= (and b!1163379 (not res!771540)) b!1163382))

(assert (= (and b!1163382 c!116407) b!1163389))

(assert (= (and b!1163382 (not c!116407)) b!1163385))

(assert (= (or b!1163389 b!1163385) bm!56950))

(assert (= (or b!1163389 b!1163385) bm!56946))

(assert (= (and b!1163382 (not res!771536)) b!1163384))

(assert (= (and b!1163384 c!116403) b!1163369))

(assert (= (and b!1163384 (not c!116403)) b!1163373))

(assert (= (and b!1163369 c!116408) b!1163365))

(assert (= (and b!1163369 (not c!116408)) b!1163362))

(assert (= (and b!1163362 c!116404) b!1163391))

(assert (= (and b!1163362 (not c!116404)) b!1163363))

(assert (= (and b!1163363 c!116406) b!1163380))

(assert (= (and b!1163363 (not c!116406)) b!1163390))

(assert (= (or b!1163391 b!1163380) bm!56949))

(assert (= (or b!1163391 b!1163380) bm!56944))

(assert (= (or b!1163391 b!1163380) bm!56951))

(assert (= (or b!1163365 bm!56951) bm!56948))

(assert (= (or b!1163365 bm!56949) bm!56945))

(assert (= (or b!1163365 bm!56944) bm!56947))

(assert (= (and b!1163369 c!116405) b!1163366))

(assert (= (and b!1163369 (not c!116405)) b!1163375))

(assert (= (and b!1163369 res!771534) b!1163371))

(assert (= (and b!1163384 res!771528) b!1163367))

(assert (= (and b!1163374 condMapEmpty!45548) mapIsEmpty!45548))

(assert (= (and b!1163374 (not condMapEmpty!45548)) mapNonEmpty!45548))

(get-info :version)

(assert (= (and mapNonEmpty!45548 ((_ is ValueCellFull!13865) mapValue!45548)) b!1163387))

(assert (= (and b!1163374 ((_ is ValueCellFull!13865) mapDefault!45548)) b!1163388))

(assert (= start!99008 b!1163374))

(declare-fun b_lambda!19707 () Bool)

(assert (=> (not b_lambda!19707) (not b!1163379)))

(declare-fun t!37057 () Bool)

(declare-fun tb!9423 () Bool)

(assert (=> (and start!99008 (= defaultEntry!1004 defaultEntry!1004) t!37057) tb!9423))

(declare-fun result!19419 () Bool)

(assert (=> tb!9423 (= result!19419 tp_is_empty!29149)))

(assert (=> b!1163379 t!37057))

(declare-fun b_and!40067 () Bool)

(assert (= b_and!40065 (and (=> t!37057 result!19419) b_and!40067)))

(declare-fun m!1071439 () Bool)

(assert (=> b!1163383 m!1071439))

(declare-fun m!1071441 () Bool)

(assert (=> b!1163386 m!1071441))

(declare-fun m!1071443 () Bool)

(assert (=> b!1163379 m!1071443))

(declare-fun m!1071445 () Bool)

(assert (=> b!1163379 m!1071445))

(declare-fun m!1071447 () Bool)

(assert (=> b!1163379 m!1071447))

(declare-fun m!1071449 () Bool)

(assert (=> b!1163379 m!1071449))

(declare-fun m!1071451 () Bool)

(assert (=> b!1163377 m!1071451))

(declare-fun m!1071453 () Bool)

(assert (=> b!1163365 m!1071453))

(declare-fun m!1071455 () Bool)

(assert (=> b!1163365 m!1071455))

(declare-fun m!1071457 () Bool)

(assert (=> b!1163365 m!1071457))

(declare-fun m!1071459 () Bool)

(assert (=> b!1163389 m!1071459))

(declare-fun m!1071461 () Bool)

(assert (=> b!1163368 m!1071461))

(declare-fun m!1071463 () Bool)

(assert (=> b!1163368 m!1071463))

(declare-fun m!1071465 () Bool)

(assert (=> bm!56945 m!1071465))

(declare-fun m!1071467 () Bool)

(assert (=> b!1163371 m!1071467))

(declare-fun m!1071469 () Bool)

(assert (=> bm!56948 m!1071469))

(declare-fun m!1071471 () Bool)

(assert (=> bm!56950 m!1071471))

(declare-fun m!1071473 () Bool)

(assert (=> b!1163369 m!1071473))

(declare-fun m!1071475 () Bool)

(assert (=> b!1163369 m!1071475))

(declare-fun m!1071477 () Bool)

(assert (=> b!1163369 m!1071477))

(declare-fun m!1071479 () Bool)

(assert (=> b!1163369 m!1071479))

(declare-fun m!1071481 () Bool)

(assert (=> mapNonEmpty!45548 m!1071481))

(declare-fun m!1071483 () Bool)

(assert (=> bm!56946 m!1071483))

(assert (=> b!1163367 m!1071471))

(declare-fun m!1071485 () Bool)

(assert (=> b!1163364 m!1071485))

(declare-fun m!1071487 () Bool)

(assert (=> b!1163382 m!1071487))

(declare-fun m!1071489 () Bool)

(assert (=> b!1163382 m!1071489))

(declare-fun m!1071491 () Bool)

(assert (=> start!99008 m!1071491))

(declare-fun m!1071493 () Bool)

(assert (=> start!99008 m!1071493))

(declare-fun m!1071495 () Bool)

(assert (=> b!1163378 m!1071495))

(declare-fun m!1071497 () Bool)

(assert (=> b!1163378 m!1071497))

(assert (=> b!1163384 m!1071483))

(assert (=> b!1163384 m!1071487))

(declare-fun m!1071499 () Bool)

(assert (=> b!1163384 m!1071499))

(declare-fun m!1071501 () Bool)

(assert (=> b!1163384 m!1071501))

(assert (=> b!1163384 m!1071501))

(declare-fun m!1071503 () Bool)

(assert (=> b!1163384 m!1071503))

(declare-fun m!1071505 () Bool)

(assert (=> b!1163384 m!1071505))

(assert (=> b!1163384 m!1071505))

(assert (=> b!1163384 m!1071487))

(declare-fun m!1071507 () Bool)

(assert (=> b!1163384 m!1071507))

(declare-fun m!1071509 () Bool)

(assert (=> b!1163384 m!1071509))

(declare-fun m!1071511 () Bool)

(assert (=> b!1163384 m!1071511))

(assert (=> b!1163384 m!1071487))

(declare-fun m!1071513 () Bool)

(assert (=> bm!56947 m!1071513))

(declare-fun m!1071515 () Bool)

(assert (=> b!1163376 m!1071515))

(declare-fun m!1071517 () Bool)

(assert (=> b!1163372 m!1071517))

(assert (=> b!1163366 m!1071467))

(check-sat (not b!1163376) (not b!1163367) b_and!40067 (not b!1163377) (not b!1163384) (not b!1163382) (not b!1163378) (not start!99008) (not b!1163379) (not b!1163371) tp_is_empty!29149 (not bm!56945) (not bm!56947) (not b!1163366) (not b!1163369) (not b!1163368) (not bm!56950) (not b!1163386) (not b!1163389) (not b!1163372) (not bm!56948) (not b!1163383) (not b!1163365) (not b_next!24619) (not b_lambda!19707) (not bm!56946) (not mapNonEmpty!45548))
(check-sat b_and!40067 (not b_next!24619))
