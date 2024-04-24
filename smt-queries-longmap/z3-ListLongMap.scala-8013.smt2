; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99154 () Bool)

(assert start!99154)

(declare-fun b_free!24523 () Bool)

(declare-fun b_next!24523 () Bool)

(assert (=> start!99154 (= b_free!24523 (not b_next!24523))))

(declare-fun tp!86280 () Bool)

(declare-fun b_and!39897 () Bool)

(assert (=> start!99154 (= tp!86280 b_and!39897)))

(declare-fun bm!55880 () Bool)

(declare-fun call!55889 () Bool)

(declare-fun call!55888 () Bool)

(assert (=> bm!55880 (= call!55889 call!55888)))

(declare-fun b!1160359 () Bool)

(declare-datatypes ((Unit!38189 0))(
  ( (Unit!38190) )
))
(declare-fun e!659959 () Unit!38189)

(declare-fun Unit!38191 () Unit!38189)

(assert (=> b!1160359 (= e!659959 Unit!38191)))

(declare-fun c!115963 () Bool)

(declare-datatypes ((V!43865 0))(
  ( (V!43866 (val!14583 Int)) )
))
(declare-datatypes ((tuple2!18590 0))(
  ( (tuple2!18591 (_1!9306 (_ BitVec 64)) (_2!9306 V!43865)) )
))
(declare-datatypes ((List!25331 0))(
  ( (Nil!25328) (Cons!25327 (h!26545 tuple2!18590) (t!36838 List!25331)) )
))
(declare-datatypes ((ListLongMap!16567 0))(
  ( (ListLongMap!16568 (toList!8299 List!25331)) )
))
(declare-fun lt!521486 () ListLongMap!16567)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!55883 () ListLongMap!16567)

(declare-fun bm!55881 () Bool)

(declare-fun contains!6820 (ListLongMap!16567 (_ BitVec 64)) Bool)

(assert (=> bm!55881 (= call!55888 (contains!6820 (ite c!115963 lt!521486 call!55883) k0!934))))

(declare-fun b!1160360 () Bool)

(declare-fun e!659961 () Unit!38189)

(declare-fun lt!521495 () Unit!38189)

(assert (=> b!1160360 (= e!659961 lt!521495)))

(declare-fun call!55886 () Unit!38189)

(assert (=> b!1160360 (= lt!521495 call!55886)))

(assert (=> b!1160360 call!55889))

(declare-fun b!1160361 () Bool)

(declare-fun res!769942 () Bool)

(declare-fun e!659968 () Bool)

(assert (=> b!1160361 (=> (not res!769942) (not e!659968))))

(declare-datatypes ((array!74995 0))(
  ( (array!74996 (arr!36142 (Array (_ BitVec 32) (_ BitVec 64))) (size!36679 (_ BitVec 32))) )
))
(declare-fun lt!521477 () array!74995)

(declare-datatypes ((List!25332 0))(
  ( (Nil!25329) (Cons!25328 (h!26546 (_ BitVec 64)) (t!36839 List!25332)) )
))
(declare-fun arrayNoDuplicates!0 (array!74995 (_ BitVec 32) List!25332) Bool)

(assert (=> b!1160361 (= res!769942 (arrayNoDuplicates!0 lt!521477 #b00000000000000000000000000000000 Nil!25329))))

(declare-fun b!1160362 () Bool)

(declare-fun c!115968 () Bool)

(declare-fun lt!521483 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1160362 (= c!115968 (and (not lt!521483) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659955 () Unit!38189)

(assert (=> b!1160362 (= e!659955 e!659961)))

(declare-fun mapIsEmpty!45404 () Bool)

(declare-fun mapRes!45404 () Bool)

(assert (=> mapIsEmpty!45404 mapRes!45404))

(declare-fun b!1160363 () Bool)

(declare-fun res!769954 () Bool)

(declare-fun e!659956 () Bool)

(assert (=> b!1160363 (=> (not res!769954) (not e!659956))))

(declare-fun _keys!1208 () array!74995)

(assert (=> b!1160363 (= res!769954 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25329))))

(declare-fun b!1160364 () Bool)

(assert (=> b!1160364 (= e!659961 e!659959)))

(declare-fun c!115966 () Bool)

(assert (=> b!1160364 (= c!115966 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521483))))

(declare-fun b!1160365 () Bool)

(declare-fun res!769946 () Bool)

(assert (=> b!1160365 (=> (not res!769946) (not e!659956))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160365 (= res!769946 (= (select (arr!36142 _keys!1208) i!673) k0!934))))

(declare-fun b!1160366 () Bool)

(declare-fun e!659952 () Bool)

(declare-fun e!659960 () Bool)

(assert (=> b!1160366 (= e!659952 e!659960)))

(declare-fun res!769956 () Bool)

(assert (=> b!1160366 (=> res!769956 e!659960)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1160366 (= res!769956 (not (= (select (arr!36142 _keys!1208) from!1455) k0!934)))))

(declare-fun e!659962 () Bool)

(assert (=> b!1160366 e!659962))

(declare-fun c!115964 () Bool)

(assert (=> b!1160366 (= c!115964 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43865)

(declare-fun lt!521497 () Unit!38189)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13817 0))(
  ( (ValueCellFull!13817 (v!17216 V!43865)) (EmptyCell!13817) )
))
(declare-datatypes ((array!74997 0))(
  ( (array!74998 (arr!36143 (Array (_ BitVec 32) ValueCell!13817)) (size!36680 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74997)

(declare-fun minValue!944 () V!43865)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!635 (array!74995 array!74997 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38189)

(assert (=> b!1160366 (= lt!521497 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160367 () Bool)

(declare-fun e!659964 () Bool)

(assert (=> b!1160367 (= e!659964 e!659952)))

(declare-fun res!769943 () Bool)

(assert (=> b!1160367 (=> res!769943 e!659952)))

(assert (=> b!1160367 (= res!769943 (not (= from!1455 i!673)))))

(declare-fun lt!521478 () ListLongMap!16567)

(declare-fun lt!521489 () array!74997)

(declare-fun getCurrentListMapNoExtraKeys!4791 (array!74995 array!74997 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 32) Int) ListLongMap!16567)

(assert (=> b!1160367 (= lt!521478 (getCurrentListMapNoExtraKeys!4791 lt!521477 lt!521489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521480 () V!43865)

(assert (=> b!1160367 (= lt!521489 (array!74998 (store (arr!36143 _values!996) i!673 (ValueCellFull!13817 lt!521480)) (size!36680 _values!996)))))

(declare-fun dynLambda!2800 (Int (_ BitVec 64)) V!43865)

(assert (=> b!1160367 (= lt!521480 (dynLambda!2800 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521488 () ListLongMap!16567)

(assert (=> b!1160367 (= lt!521488 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160368 () Bool)

(declare-fun e!659954 () Bool)

(declare-fun tp_is_empty!29053 () Bool)

(assert (=> b!1160368 (= e!659954 tp_is_empty!29053)))

(declare-fun b!1160369 () Bool)

(assert (=> b!1160369 (= e!659968 (not e!659964))))

(declare-fun res!769945 () Bool)

(assert (=> b!1160369 (=> res!769945 e!659964)))

(assert (=> b!1160369 (= res!769945 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160369 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521485 () Unit!38189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74995 (_ BitVec 64) (_ BitVec 32)) Unit!38189)

(assert (=> b!1160369 (= lt!521485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160370 () Bool)

(assert (=> b!1160370 call!55889))

(declare-fun lt!521490 () Unit!38189)

(assert (=> b!1160370 (= lt!521490 call!55886)))

(assert (=> b!1160370 (= e!659959 lt!521490)))

(declare-fun call!55884 () ListLongMap!16567)

(declare-fun bm!55882 () Bool)

(assert (=> bm!55882 (= call!55884 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55883 () Bool)

(declare-fun lt!521494 () ListLongMap!16567)

(declare-fun call!55887 () ListLongMap!16567)

(declare-fun +!3719 (ListLongMap!16567 tuple2!18590) ListLongMap!16567)

(assert (=> bm!55883 (= call!55887 (+!3719 lt!521494 (ite (or c!115963 c!115968) (tuple2!18591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1160371 () Bool)

(declare-fun res!769955 () Bool)

(assert (=> b!1160371 (=> (not res!769955) (not e!659956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74995 (_ BitVec 32)) Bool)

(assert (=> b!1160371 (= res!769955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160372 () Bool)

(declare-fun e!659965 () Bool)

(assert (=> b!1160372 (= e!659965 tp_is_empty!29053)))

(declare-fun mapNonEmpty!45404 () Bool)

(declare-fun tp!86279 () Bool)

(assert (=> mapNonEmpty!45404 (= mapRes!45404 (and tp!86279 e!659954))))

(declare-fun mapKey!45404 () (_ BitVec 32))

(declare-fun mapRest!45404 () (Array (_ BitVec 32) ValueCell!13817))

(declare-fun mapValue!45404 () ValueCell!13817)

(assert (=> mapNonEmpty!45404 (= (arr!36143 _values!996) (store mapRest!45404 mapKey!45404 mapValue!45404))))

(declare-fun b!1160373 () Bool)

(declare-fun e!659967 () Bool)

(assert (=> b!1160373 (= e!659967 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160374 () Bool)

(declare-fun res!769953 () Bool)

(assert (=> b!1160374 (=> (not res!769953) (not e!659956))))

(assert (=> b!1160374 (= res!769953 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36679 _keys!1208))))))

(declare-fun b!1160375 () Bool)

(declare-fun call!55890 () ListLongMap!16567)

(assert (=> b!1160375 (= e!659962 (= call!55890 call!55884))))

(declare-fun b!1160376 () Bool)

(declare-fun -!1399 (ListLongMap!16567 (_ BitVec 64)) ListLongMap!16567)

(assert (=> b!1160376 (= e!659962 (= call!55890 (-!1399 call!55884 k0!934)))))

(declare-fun b!1160377 () Bool)

(declare-fun e!659958 () Unit!38189)

(declare-fun Unit!38192 () Unit!38189)

(assert (=> b!1160377 (= e!659958 Unit!38192)))

(assert (=> b!1160377 (= lt!521483 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160377 (= c!115963 (and (not lt!521483) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521476 () Unit!38189)

(assert (=> b!1160377 (= lt!521476 e!659955)))

(declare-fun lt!521487 () Unit!38189)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!528 (array!74995 array!74997 (_ BitVec 32) (_ BitVec 32) V!43865 V!43865 (_ BitVec 64) (_ BitVec 32) Int) Unit!38189)

(assert (=> b!1160377 (= lt!521487 (lemmaListMapContainsThenArrayContainsFrom!528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115965 () Bool)

(assert (=> b!1160377 (= c!115965 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769944 () Bool)

(assert (=> b!1160377 (= res!769944 e!659967)))

(declare-fun e!659966 () Bool)

(assert (=> b!1160377 (=> (not res!769944) (not e!659966))))

(assert (=> b!1160377 e!659966))

(declare-fun lt!521479 () Unit!38189)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74995 (_ BitVec 32) (_ BitVec 32)) Unit!38189)

(assert (=> b!1160377 (= lt!521479 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160377 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25329)))

(declare-fun lt!521484 () Unit!38189)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74995 (_ BitVec 64) (_ BitVec 32) List!25332) Unit!38189)

(assert (=> b!1160377 (= lt!521484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25329))))

(assert (=> b!1160377 false))

(declare-fun bm!55884 () Bool)

(assert (=> bm!55884 (= call!55890 (getCurrentListMapNoExtraKeys!4791 lt!521477 lt!521489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160378 () Bool)

(assert (=> b!1160378 (= e!659960 true)))

(declare-fun e!659963 () Bool)

(assert (=> b!1160378 e!659963))

(declare-fun res!769947 () Bool)

(assert (=> b!1160378 (=> (not res!769947) (not e!659963))))

(declare-fun lt!521491 () ListLongMap!16567)

(assert (=> b!1160378 (= res!769947 (= lt!521491 lt!521494))))

(assert (=> b!1160378 (= lt!521491 (-!1399 lt!521488 k0!934))))

(declare-fun lt!521496 () V!43865)

(assert (=> b!1160378 (= (-!1399 (+!3719 lt!521494 (tuple2!18591 (select (arr!36142 _keys!1208) from!1455) lt!521496)) (select (arr!36142 _keys!1208) from!1455)) lt!521494)))

(declare-fun lt!521482 () Unit!38189)

(declare-fun addThenRemoveForNewKeyIsSame!231 (ListLongMap!16567 (_ BitVec 64) V!43865) Unit!38189)

(assert (=> b!1160378 (= lt!521482 (addThenRemoveForNewKeyIsSame!231 lt!521494 (select (arr!36142 _keys!1208) from!1455) lt!521496))))

(declare-fun get!18450 (ValueCell!13817 V!43865) V!43865)

(assert (=> b!1160378 (= lt!521496 (get!18450 (select (arr!36143 _values!996) from!1455) lt!521480))))

(declare-fun lt!521493 () Unit!38189)

(assert (=> b!1160378 (= lt!521493 e!659958)))

(declare-fun c!115967 () Bool)

(assert (=> b!1160378 (= c!115967 (contains!6820 lt!521494 k0!934))))

(assert (=> b!1160378 (= lt!521494 (getCurrentListMapNoExtraKeys!4791 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160379 () Bool)

(assert (=> b!1160379 (= e!659967 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521483) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!769950 () Bool)

(assert (=> start!99154 (=> (not res!769950) (not e!659956))))

(assert (=> start!99154 (= res!769950 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36679 _keys!1208))))))

(assert (=> start!99154 e!659956))

(assert (=> start!99154 tp_is_empty!29053))

(declare-fun array_inv!27724 (array!74995) Bool)

(assert (=> start!99154 (array_inv!27724 _keys!1208)))

(assert (=> start!99154 true))

(assert (=> start!99154 tp!86280))

(declare-fun e!659953 () Bool)

(declare-fun array_inv!27725 (array!74997) Bool)

(assert (=> start!99154 (and (array_inv!27725 _values!996) e!659953)))

(declare-fun bm!55885 () Bool)

(declare-fun call!55885 () Unit!38189)

(assert (=> bm!55885 (= call!55886 call!55885)))

(declare-fun b!1160380 () Bool)

(declare-fun res!769949 () Bool)

(assert (=> b!1160380 (=> (not res!769949) (not e!659956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160380 (= res!769949 (validKeyInArray!0 k0!934))))

(declare-fun b!1160381 () Bool)

(assert (=> b!1160381 (contains!6820 (+!3719 lt!521486 (tuple2!18591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521481 () Unit!38189)

(declare-fun addStillContains!940 (ListLongMap!16567 (_ BitVec 64) V!43865 (_ BitVec 64)) Unit!38189)

(assert (=> b!1160381 (= lt!521481 (addStillContains!940 lt!521486 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160381 call!55888))

(assert (=> b!1160381 (= lt!521486 call!55887)))

(declare-fun lt!521492 () Unit!38189)

(assert (=> b!1160381 (= lt!521492 call!55885)))

(assert (=> b!1160381 (= e!659955 lt!521481)))

(declare-fun b!1160382 () Bool)

(assert (=> b!1160382 (= e!659956 e!659968)))

(declare-fun res!769952 () Bool)

(assert (=> b!1160382 (=> (not res!769952) (not e!659968))))

(assert (=> b!1160382 (= res!769952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521477 mask!1564))))

(assert (=> b!1160382 (= lt!521477 (array!74996 (store (arr!36142 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36679 _keys!1208)))))

(declare-fun b!1160383 () Bool)

(declare-fun res!769951 () Bool)

(assert (=> b!1160383 (=> (not res!769951) (not e!659956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160383 (= res!769951 (validMask!0 mask!1564))))

(declare-fun bm!55886 () Bool)

(assert (=> bm!55886 (= call!55885 (addStillContains!940 lt!521494 (ite (or c!115963 c!115968) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115963 c!115968) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160384 () Bool)

(declare-fun res!769948 () Bool)

(assert (=> b!1160384 (=> (not res!769948) (not e!659956))))

(assert (=> b!1160384 (= res!769948 (and (= (size!36680 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36679 _keys!1208) (size!36680 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160385 () Bool)

(assert (=> b!1160385 (= e!659966 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55887 () Bool)

(assert (=> bm!55887 (= call!55883 call!55887)))

(declare-fun b!1160386 () Bool)

(assert (=> b!1160386 (= e!659963 (= lt!521491 (getCurrentListMapNoExtraKeys!4791 lt!521477 lt!521489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160387 () Bool)

(declare-fun Unit!38193 () Unit!38189)

(assert (=> b!1160387 (= e!659958 Unit!38193)))

(declare-fun b!1160388 () Bool)

(assert (=> b!1160388 (= e!659953 (and e!659965 mapRes!45404))))

(declare-fun condMapEmpty!45404 () Bool)

(declare-fun mapDefault!45404 () ValueCell!13817)

(assert (=> b!1160388 (= condMapEmpty!45404 (= (arr!36143 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13817)) mapDefault!45404)))))

(assert (= (and start!99154 res!769950) b!1160383))

(assert (= (and b!1160383 res!769951) b!1160384))

(assert (= (and b!1160384 res!769948) b!1160371))

(assert (= (and b!1160371 res!769955) b!1160363))

(assert (= (and b!1160363 res!769954) b!1160374))

(assert (= (and b!1160374 res!769953) b!1160380))

(assert (= (and b!1160380 res!769949) b!1160365))

(assert (= (and b!1160365 res!769946) b!1160382))

(assert (= (and b!1160382 res!769952) b!1160361))

(assert (= (and b!1160361 res!769942) b!1160369))

(assert (= (and b!1160369 (not res!769945)) b!1160367))

(assert (= (and b!1160367 (not res!769943)) b!1160366))

(assert (= (and b!1160366 c!115964) b!1160376))

(assert (= (and b!1160366 (not c!115964)) b!1160375))

(assert (= (or b!1160376 b!1160375) bm!55884))

(assert (= (or b!1160376 b!1160375) bm!55882))

(assert (= (and b!1160366 (not res!769956)) b!1160378))

(assert (= (and b!1160378 c!115967) b!1160377))

(assert (= (and b!1160378 (not c!115967)) b!1160387))

(assert (= (and b!1160377 c!115963) b!1160381))

(assert (= (and b!1160377 (not c!115963)) b!1160362))

(assert (= (and b!1160362 c!115968) b!1160360))

(assert (= (and b!1160362 (not c!115968)) b!1160364))

(assert (= (and b!1160364 c!115966) b!1160370))

(assert (= (and b!1160364 (not c!115966)) b!1160359))

(assert (= (or b!1160360 b!1160370) bm!55885))

(assert (= (or b!1160360 b!1160370) bm!55887))

(assert (= (or b!1160360 b!1160370) bm!55880))

(assert (= (or b!1160381 bm!55880) bm!55881))

(assert (= (or b!1160381 bm!55885) bm!55886))

(assert (= (or b!1160381 bm!55887) bm!55883))

(assert (= (and b!1160377 c!115965) b!1160373))

(assert (= (and b!1160377 (not c!115965)) b!1160379))

(assert (= (and b!1160377 res!769944) b!1160385))

(assert (= (and b!1160378 res!769947) b!1160386))

(assert (= (and b!1160388 condMapEmpty!45404) mapIsEmpty!45404))

(assert (= (and b!1160388 (not condMapEmpty!45404)) mapNonEmpty!45404))

(get-info :version)

(assert (= (and mapNonEmpty!45404 ((_ is ValueCellFull!13817) mapValue!45404)) b!1160368))

(assert (= (and b!1160388 ((_ is ValueCellFull!13817) mapDefault!45404)) b!1160372))

(assert (= start!99154 b!1160388))

(declare-fun b_lambda!19623 () Bool)

(assert (=> (not b_lambda!19623) (not b!1160367)))

(declare-fun t!36837 () Bool)

(declare-fun tb!9327 () Bool)

(assert (=> (and start!99154 (= defaultEntry!1004 defaultEntry!1004) t!36837) tb!9327))

(declare-fun result!19227 () Bool)

(assert (=> tb!9327 (= result!19227 tp_is_empty!29053)))

(assert (=> b!1160367 t!36837))

(declare-fun b_and!39899 () Bool)

(assert (= b_and!39897 (and (=> t!36837 result!19227) b_and!39899)))

(declare-fun m!1069761 () Bool)

(assert (=> b!1160361 m!1069761))

(declare-fun m!1069763 () Bool)

(assert (=> bm!55881 m!1069763))

(declare-fun m!1069765 () Bool)

(assert (=> b!1160378 m!1069765))

(declare-fun m!1069767 () Bool)

(assert (=> b!1160378 m!1069767))

(declare-fun m!1069769 () Bool)

(assert (=> b!1160378 m!1069769))

(declare-fun m!1069771 () Bool)

(assert (=> b!1160378 m!1069771))

(declare-fun m!1069773 () Bool)

(assert (=> b!1160378 m!1069773))

(assert (=> b!1160378 m!1069769))

(declare-fun m!1069775 () Bool)

(assert (=> b!1160378 m!1069775))

(declare-fun m!1069777 () Bool)

(assert (=> b!1160378 m!1069777))

(assert (=> b!1160378 m!1069771))

(assert (=> b!1160378 m!1069767))

(declare-fun m!1069779 () Bool)

(assert (=> b!1160378 m!1069779))

(assert (=> b!1160378 m!1069771))

(declare-fun m!1069781 () Bool)

(assert (=> b!1160378 m!1069781))

(declare-fun m!1069783 () Bool)

(assert (=> b!1160367 m!1069783))

(declare-fun m!1069785 () Bool)

(assert (=> b!1160367 m!1069785))

(declare-fun m!1069787 () Bool)

(assert (=> b!1160367 m!1069787))

(declare-fun m!1069789 () Bool)

(assert (=> b!1160367 m!1069789))

(assert (=> bm!55882 m!1069765))

(declare-fun m!1069791 () Bool)

(assert (=> b!1160365 m!1069791))

(declare-fun m!1069793 () Bool)

(assert (=> b!1160380 m!1069793))

(declare-fun m!1069795 () Bool)

(assert (=> b!1160369 m!1069795))

(declare-fun m!1069797 () Bool)

(assert (=> b!1160369 m!1069797))

(declare-fun m!1069799 () Bool)

(assert (=> b!1160376 m!1069799))

(declare-fun m!1069801 () Bool)

(assert (=> b!1160385 m!1069801))

(declare-fun m!1069803 () Bool)

(assert (=> b!1160381 m!1069803))

(assert (=> b!1160381 m!1069803))

(declare-fun m!1069805 () Bool)

(assert (=> b!1160381 m!1069805))

(declare-fun m!1069807 () Bool)

(assert (=> b!1160381 m!1069807))

(declare-fun m!1069809 () Bool)

(assert (=> mapNonEmpty!45404 m!1069809))

(declare-fun m!1069811 () Bool)

(assert (=> start!99154 m!1069811))

(declare-fun m!1069813 () Bool)

(assert (=> start!99154 m!1069813))

(declare-fun m!1069815 () Bool)

(assert (=> b!1160377 m!1069815))

(declare-fun m!1069817 () Bool)

(assert (=> b!1160377 m!1069817))

(declare-fun m!1069819 () Bool)

(assert (=> b!1160377 m!1069819))

(declare-fun m!1069821 () Bool)

(assert (=> b!1160377 m!1069821))

(assert (=> b!1160366 m!1069771))

(declare-fun m!1069823 () Bool)

(assert (=> b!1160366 m!1069823))

(assert (=> b!1160373 m!1069801))

(declare-fun m!1069825 () Bool)

(assert (=> b!1160363 m!1069825))

(declare-fun m!1069827 () Bool)

(assert (=> bm!55886 m!1069827))

(declare-fun m!1069829 () Bool)

(assert (=> b!1160383 m!1069829))

(declare-fun m!1069831 () Bool)

(assert (=> b!1160386 m!1069831))

(assert (=> bm!55884 m!1069831))

(declare-fun m!1069833 () Bool)

(assert (=> b!1160382 m!1069833))

(declare-fun m!1069835 () Bool)

(assert (=> b!1160382 m!1069835))

(declare-fun m!1069837 () Bool)

(assert (=> b!1160371 m!1069837))

(declare-fun m!1069839 () Bool)

(assert (=> bm!55883 m!1069839))

(check-sat (not bm!55882) (not mapNonEmpty!45404) (not b!1160378) (not b!1160377) (not b!1160386) b_and!39899 (not b!1160382) (not bm!55886) tp_is_empty!29053 (not b!1160366) (not b!1160380) (not b!1160373) (not bm!55881) (not b!1160361) (not b!1160367) (not b!1160371) (not bm!55884) (not b_next!24523) (not b!1160383) (not b!1160385) (not b!1160381) (not b!1160369) (not bm!55883) (not b!1160363) (not b_lambda!19623) (not b!1160376) (not start!99154))
(check-sat b_and!39899 (not b_next!24523))
