; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98928 () Bool)

(assert start!98928)

(declare-fun b_free!24533 () Bool)

(declare-fun b_next!24533 () Bool)

(assert (=> start!98928 (= b_free!24533 (not b_next!24533))))

(declare-fun tp!86309 () Bool)

(declare-fun b_and!39915 () Bool)

(assert (=> start!98928 (= tp!86309 b_and!39915)))

(declare-datatypes ((V!43877 0))(
  ( (V!43878 (val!14588 Int)) )
))
(declare-fun zeroValue!944 () V!43877)

(declare-datatypes ((array!74967 0))(
  ( (array!74968 (arr!36134 (Array (_ BitVec 32) (_ BitVec 64))) (size!36670 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74967)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18574 0))(
  ( (tuple2!18575 (_1!9298 (_ BitVec 64)) (_2!9298 V!43877)) )
))
(declare-datatypes ((List!25312 0))(
  ( (Nil!25309) (Cons!25308 (h!26517 tuple2!18574) (t!36837 List!25312)) )
))
(declare-datatypes ((ListLongMap!16543 0))(
  ( (ListLongMap!16544 (toList!8287 List!25312)) )
))
(declare-fun call!55939 () ListLongMap!16543)

(declare-datatypes ((ValueCell!13822 0))(
  ( (ValueCellFull!13822 (v!17225 V!43877)) (EmptyCell!13822) )
))
(declare-datatypes ((array!74969 0))(
  ( (array!74970 (arr!36135 (Array (_ BitVec 32) ValueCell!13822)) (size!36671 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74969)

(declare-fun minValue!944 () V!43877)

(declare-fun bm!55935 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4751 (array!74967 array!74969 (_ BitVec 32) (_ BitVec 32) V!43877 V!43877 (_ BitVec 32) Int) ListLongMap!16543)

(assert (=> bm!55935 (= call!55939 (getCurrentListMapNoExtraKeys!4751 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55945 () ListLongMap!16543)

(declare-fun c!115658 () Bool)

(declare-fun bm!55936 () Bool)

(declare-fun c!115657 () Bool)

(declare-fun lt!521331 () ListLongMap!16543)

(declare-fun lt!521343 () ListLongMap!16543)

(declare-fun +!3694 (ListLongMap!16543 tuple2!18574) ListLongMap!16543)

(assert (=> bm!55936 (= call!55945 (+!3694 (ite c!115658 lt!521331 lt!521343) (ite c!115658 (tuple2!18575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115657 (tuple2!18575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1159530 () Bool)

(declare-fun e!659377 () Bool)

(declare-fun call!55942 () ListLongMap!16543)

(assert (=> b!1159530 (= e!659377 (= call!55942 call!55939))))

(declare-fun b!1159531 () Bool)

(declare-fun e!659375 () Bool)

(declare-fun e!659380 () Bool)

(assert (=> b!1159531 (= e!659375 e!659380)))

(declare-fun res!769660 () Bool)

(assert (=> b!1159531 (=> (not res!769660) (not e!659380))))

(declare-fun lt!521341 () array!74967)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74967 (_ BitVec 32)) Bool)

(assert (=> b!1159531 (= res!769660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521341 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159531 (= lt!521341 (array!74968 (store (arr!36134 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36670 _keys!1208)))))

(declare-fun b!1159532 () Bool)

(declare-datatypes ((Unit!38216 0))(
  ( (Unit!38217) )
))
(declare-fun e!659384 () Unit!38216)

(declare-fun e!659389 () Unit!38216)

(assert (=> b!1159532 (= e!659384 e!659389)))

(declare-fun c!115660 () Bool)

(declare-fun lt!521337 () Bool)

(assert (=> b!1159532 (= c!115660 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521337))))

(declare-fun b!1159533 () Bool)

(declare-fun e!659385 () Bool)

(assert (=> b!1159533 (= e!659385 true)))

(declare-fun e!659379 () Bool)

(assert (=> b!1159533 e!659379))

(declare-fun res!769665 () Bool)

(assert (=> b!1159533 (=> (not res!769665) (not e!659379))))

(declare-fun lt!521336 () ListLongMap!16543)

(assert (=> b!1159533 (= res!769665 (= lt!521336 lt!521343))))

(declare-fun lt!521329 () ListLongMap!16543)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1397 (ListLongMap!16543 (_ BitVec 64)) ListLongMap!16543)

(assert (=> b!1159533 (= lt!521336 (-!1397 lt!521329 k!934))))

(declare-fun lt!521340 () V!43877)

(assert (=> b!1159533 (= (-!1397 (+!3694 lt!521343 (tuple2!18575 (select (arr!36134 _keys!1208) from!1455) lt!521340)) (select (arr!36134 _keys!1208) from!1455)) lt!521343)))

(declare-fun lt!521330 () Unit!38216)

(declare-fun addThenRemoveForNewKeyIsSame!233 (ListLongMap!16543 (_ BitVec 64) V!43877) Unit!38216)

(assert (=> b!1159533 (= lt!521330 (addThenRemoveForNewKeyIsSame!233 lt!521343 (select (arr!36134 _keys!1208) from!1455) lt!521340))))

(declare-fun lt!521328 () V!43877)

(declare-fun get!18423 (ValueCell!13822 V!43877) V!43877)

(assert (=> b!1159533 (= lt!521340 (get!18423 (select (arr!36135 _values!996) from!1455) lt!521328))))

(declare-fun lt!521334 () Unit!38216)

(declare-fun e!659378 () Unit!38216)

(assert (=> b!1159533 (= lt!521334 e!659378)))

(declare-fun c!115656 () Bool)

(declare-fun contains!6795 (ListLongMap!16543 (_ BitVec 64)) Bool)

(assert (=> b!1159533 (= c!115656 (contains!6795 lt!521343 k!934))))

(assert (=> b!1159533 (= lt!521343 (getCurrentListMapNoExtraKeys!4751 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!769664 () Bool)

(assert (=> start!98928 (=> (not res!769664) (not e!659375))))

(assert (=> start!98928 (= res!769664 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36670 _keys!1208))))))

(assert (=> start!98928 e!659375))

(declare-fun tp_is_empty!29063 () Bool)

(assert (=> start!98928 tp_is_empty!29063))

(declare-fun array_inv!27650 (array!74967) Bool)

(assert (=> start!98928 (array_inv!27650 _keys!1208)))

(assert (=> start!98928 true))

(assert (=> start!98928 tp!86309))

(declare-fun e!659391 () Bool)

(declare-fun array_inv!27651 (array!74969) Bool)

(assert (=> start!98928 (and (array_inv!27651 _values!996) e!659391)))

(declare-fun b!1159534 () Bool)

(declare-fun Unit!38218 () Unit!38216)

(assert (=> b!1159534 (= e!659389 Unit!38218)))

(declare-fun b!1159535 () Bool)

(declare-fun res!769673 () Bool)

(assert (=> b!1159535 (=> (not res!769673) (not e!659380))))

(declare-datatypes ((List!25313 0))(
  ( (Nil!25310) (Cons!25309 (h!26518 (_ BitVec 64)) (t!36838 List!25313)) )
))
(declare-fun arrayNoDuplicates!0 (array!74967 (_ BitVec 32) List!25313) Bool)

(assert (=> b!1159535 (= res!769673 (arrayNoDuplicates!0 lt!521341 #b00000000000000000000000000000000 Nil!25310))))

(declare-fun bm!55937 () Bool)

(declare-fun call!55940 () Unit!38216)

(declare-fun call!55938 () Unit!38216)

(assert (=> bm!55937 (= call!55940 call!55938)))

(declare-fun b!1159536 () Bool)

(declare-fun res!769663 () Bool)

(assert (=> b!1159536 (=> (not res!769663) (not e!659375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159536 (= res!769663 (validMask!0 mask!1564))))

(declare-fun b!1159537 () Bool)

(assert (=> b!1159537 (contains!6795 call!55945 k!934)))

(declare-fun lt!521322 () Unit!38216)

(declare-fun addStillContains!936 (ListLongMap!16543 (_ BitVec 64) V!43877 (_ BitVec 64)) Unit!38216)

(assert (=> b!1159537 (= lt!521322 (addStillContains!936 lt!521331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!55944 () Bool)

(assert (=> b!1159537 call!55944))

(assert (=> b!1159537 (= lt!521331 (+!3694 lt!521343 (tuple2!18575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521332 () Unit!38216)

(assert (=> b!1159537 (= lt!521332 call!55938)))

(declare-fun e!659382 () Unit!38216)

(assert (=> b!1159537 (= e!659382 lt!521322)))

(declare-fun b!1159538 () Bool)

(declare-fun res!769670 () Bool)

(assert (=> b!1159538 (=> (not res!769670) (not e!659375))))

(assert (=> b!1159538 (= res!769670 (= (select (arr!36134 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45419 () Bool)

(declare-fun mapRes!45419 () Bool)

(declare-fun tp!86310 () Bool)

(declare-fun e!659383 () Bool)

(assert (=> mapNonEmpty!45419 (= mapRes!45419 (and tp!86310 e!659383))))

(declare-fun mapKey!45419 () (_ BitVec 32))

(declare-fun mapValue!45419 () ValueCell!13822)

(declare-fun mapRest!45419 () (Array (_ BitVec 32) ValueCell!13822))

(assert (=> mapNonEmpty!45419 (= (arr!36135 _values!996) (store mapRest!45419 mapKey!45419 mapValue!45419))))

(declare-fun b!1159539 () Bool)

(declare-fun res!769661 () Bool)

(assert (=> b!1159539 (=> (not res!769661) (not e!659375))))

(assert (=> b!1159539 (= res!769661 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36670 _keys!1208))))))

(declare-fun b!1159540 () Bool)

(declare-fun res!769667 () Bool)

(assert (=> b!1159540 (=> (not res!769667) (not e!659375))))

(assert (=> b!1159540 (= res!769667 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25310))))

(declare-fun b!1159541 () Bool)

(declare-fun e!659390 () Bool)

(assert (=> b!1159541 (= e!659390 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521337) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159542 () Bool)

(declare-fun Unit!38219 () Unit!38216)

(assert (=> b!1159542 (= e!659378 Unit!38219)))

(assert (=> b!1159542 (= lt!521337 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159542 (= c!115658 (and (not lt!521337) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521323 () Unit!38216)

(assert (=> b!1159542 (= lt!521323 e!659382)))

(declare-fun lt!521335 () Unit!38216)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!522 (array!74967 array!74969 (_ BitVec 32) (_ BitVec 32) V!43877 V!43877 (_ BitVec 64) (_ BitVec 32) Int) Unit!38216)

(assert (=> b!1159542 (= lt!521335 (lemmaListMapContainsThenArrayContainsFrom!522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115655 () Bool)

(assert (=> b!1159542 (= c!115655 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769662 () Bool)

(assert (=> b!1159542 (= res!769662 e!659390)))

(declare-fun e!659386 () Bool)

(assert (=> b!1159542 (=> (not res!769662) (not e!659386))))

(assert (=> b!1159542 e!659386))

(declare-fun lt!521338 () Unit!38216)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74967 (_ BitVec 32) (_ BitVec 32)) Unit!38216)

(assert (=> b!1159542 (= lt!521338 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159542 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25310)))

(declare-fun lt!521327 () Unit!38216)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74967 (_ BitVec 64) (_ BitVec 32) List!25313) Unit!38216)

(assert (=> b!1159542 (= lt!521327 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25310))))

(assert (=> b!1159542 false))

(declare-fun lt!521326 () array!74969)

(declare-fun bm!55938 () Bool)

(assert (=> bm!55938 (= call!55942 (getCurrentListMapNoExtraKeys!4751 lt!521341 lt!521326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159543 () Bool)

(assert (=> b!1159543 (= c!115657 (and (not lt!521337) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159543 (= e!659382 e!659384)))

(declare-fun b!1159544 () Bool)

(declare-fun e!659381 () Bool)

(assert (=> b!1159544 (= e!659380 (not e!659381))))

(declare-fun res!769666 () Bool)

(assert (=> b!1159544 (=> res!769666 e!659381)))

(assert (=> b!1159544 (= res!769666 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159544 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521333 () Unit!38216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74967 (_ BitVec 64) (_ BitVec 32)) Unit!38216)

(assert (=> b!1159544 (= lt!521333 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1159545 () Bool)

(declare-fun res!769671 () Bool)

(assert (=> b!1159545 (=> (not res!769671) (not e!659375))))

(assert (=> b!1159545 (= res!769671 (and (= (size!36671 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36670 _keys!1208) (size!36671 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159546 () Bool)

(declare-fun e!659376 () Bool)

(assert (=> b!1159546 (= e!659376 e!659385)))

(declare-fun res!769669 () Bool)

(assert (=> b!1159546 (=> res!769669 e!659385)))

(assert (=> b!1159546 (= res!769669 (not (= (select (arr!36134 _keys!1208) from!1455) k!934)))))

(assert (=> b!1159546 e!659377))

(declare-fun c!115659 () Bool)

(assert (=> b!1159546 (= c!115659 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521324 () Unit!38216)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!628 (array!74967 array!74969 (_ BitVec 32) (_ BitVec 32) V!43877 V!43877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38216)

(assert (=> b!1159546 (= lt!521324 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159547 () Bool)

(declare-fun res!769668 () Bool)

(assert (=> b!1159547 (=> (not res!769668) (not e!659375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159547 (= res!769668 (validKeyInArray!0 k!934))))

(declare-fun b!1159548 () Bool)

(declare-fun lt!521342 () Unit!38216)

(assert (=> b!1159548 (= e!659384 lt!521342)))

(assert (=> b!1159548 (= lt!521342 call!55940)))

(declare-fun call!55941 () Bool)

(assert (=> b!1159548 call!55941))

(declare-fun b!1159549 () Bool)

(declare-fun Unit!38220 () Unit!38216)

(assert (=> b!1159549 (= e!659378 Unit!38220)))

(declare-fun bm!55939 () Bool)

(assert (=> bm!55939 (= call!55938 (addStillContains!936 lt!521343 (ite (or c!115658 c!115657) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115658 c!115657) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!55940 () Bool)

(declare-fun call!55943 () ListLongMap!16543)

(assert (=> bm!55940 (= call!55943 call!55945)))

(declare-fun bm!55941 () Bool)

(assert (=> bm!55941 (= call!55944 (contains!6795 (ite c!115658 lt!521331 call!55943) k!934))))

(declare-fun b!1159550 () Bool)

(assert (=> b!1159550 (= e!659386 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159551 () Bool)

(declare-fun res!769659 () Bool)

(assert (=> b!1159551 (=> (not res!769659) (not e!659375))))

(assert (=> b!1159551 (= res!769659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!55942 () Bool)

(assert (=> bm!55942 (= call!55941 call!55944)))

(declare-fun b!1159552 () Bool)

(declare-fun e!659387 () Bool)

(assert (=> b!1159552 (= e!659387 tp_is_empty!29063)))

(declare-fun b!1159553 () Bool)

(assert (=> b!1159553 call!55941))

(declare-fun lt!521325 () Unit!38216)

(assert (=> b!1159553 (= lt!521325 call!55940)))

(assert (=> b!1159553 (= e!659389 lt!521325)))

(declare-fun mapIsEmpty!45419 () Bool)

(assert (=> mapIsEmpty!45419 mapRes!45419))

(declare-fun b!1159554 () Bool)

(assert (=> b!1159554 (= e!659383 tp_is_empty!29063)))

(declare-fun b!1159555 () Bool)

(assert (=> b!1159555 (= e!659379 (= lt!521336 (getCurrentListMapNoExtraKeys!4751 lt!521341 lt!521326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159556 () Bool)

(assert (=> b!1159556 (= e!659391 (and e!659387 mapRes!45419))))

(declare-fun condMapEmpty!45419 () Bool)

(declare-fun mapDefault!45419 () ValueCell!13822)

