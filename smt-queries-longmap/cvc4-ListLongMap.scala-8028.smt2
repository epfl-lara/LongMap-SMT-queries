; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99012 () Bool)

(assert start!99012)

(declare-fun b_free!24617 () Bool)

(declare-fun b_next!24617 () Bool)

(assert (=> start!99012 (= b_free!24617 (not b_next!24617))))

(declare-fun tp!86562 () Bool)

(declare-fun b_and!40083 () Bool)

(assert (=> start!99012 (= tp!86562 b_and!40083)))

(declare-fun bm!56943 () Bool)

(declare-datatypes ((V!43989 0))(
  ( (V!43990 (val!14630 Int)) )
))
(declare-datatypes ((tuple2!18656 0))(
  ( (tuple2!18657 (_1!9339 (_ BitVec 64)) (_2!9339 V!43989)) )
))
(declare-datatypes ((List!25389 0))(
  ( (Nil!25386) (Cons!25385 (h!26594 tuple2!18656) (t!36998 List!25389)) )
))
(declare-datatypes ((ListLongMap!16625 0))(
  ( (ListLongMap!16626 (toList!8328 List!25389)) )
))
(declare-fun call!56946 () ListLongMap!16625)

(declare-fun call!56951 () ListLongMap!16625)

(assert (=> bm!56943 (= call!56946 call!56951)))

(declare-fun b!1163394 () Bool)

(declare-fun res!771550 () Bool)

(declare-fun e!661530 () Bool)

(assert (=> b!1163394 (=> (not res!771550) (not e!661530))))

(declare-datatypes ((array!75133 0))(
  ( (array!75134 (arr!36217 (Array (_ BitVec 32) (_ BitVec 64))) (size!36753 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75133)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13864 0))(
  ( (ValueCellFull!13864 (v!17267 V!43989)) (EmptyCell!13864) )
))
(declare-datatypes ((array!75135 0))(
  ( (array!75136 (arr!36218 (Array (_ BitVec 32) ValueCell!13864)) (size!36754 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75135)

(assert (=> b!1163394 (= res!771550 (and (= (size!36754 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36753 _keys!1208) (size!36754 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163395 () Bool)

(declare-fun e!661522 () Bool)

(declare-fun tp_is_empty!29147 () Bool)

(assert (=> b!1163395 (= e!661522 tp_is_empty!29147)))

(declare-fun zeroValue!944 () V!43989)

(declare-fun lt!524103 () ListLongMap!16625)

(declare-fun c!116413 () Bool)

(declare-fun c!116412 () Bool)

(declare-fun bm!56944 () Bool)

(declare-fun minValue!944 () V!43989)

(declare-fun +!3731 (ListLongMap!16625 tuple2!18656) ListLongMap!16625)

(assert (=> bm!56944 (= call!56951 (+!3731 lt!524103 (ite (or c!116412 c!116413) (tuple2!18657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1163396 () Bool)

(declare-fun e!661518 () Bool)

(assert (=> b!1163396 (= e!661530 e!661518)))

(declare-fun res!771558 () Bool)

(assert (=> b!1163396 (=> (not res!771558) (not e!661518))))

(declare-fun lt!524099 () array!75133)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75133 (_ BitVec 32)) Bool)

(assert (=> b!1163396 (= res!771558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524099 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163396 (= lt!524099 (array!75134 (store (arr!36217 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36753 _keys!1208)))))

(declare-fun bm!56945 () Bool)

(declare-fun call!56953 () Bool)

(declare-fun call!56947 () Bool)

(assert (=> bm!56945 (= call!56953 call!56947)))

(declare-fun b!1163397 () Bool)

(declare-fun lt!524097 () ListLongMap!16625)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6832 (ListLongMap!16625 (_ BitVec 64)) Bool)

(assert (=> b!1163397 (contains!6832 (+!3731 lt!524097 (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-datatypes ((Unit!38395 0))(
  ( (Unit!38396) )
))
(declare-fun lt!524096 () Unit!38395)

(declare-fun addStillContains!971 (ListLongMap!16625 (_ BitVec 64) V!43989 (_ BitVec 64)) Unit!38395)

(assert (=> b!1163397 (= lt!524096 (addStillContains!971 lt!524097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1163397 call!56947))

(assert (=> b!1163397 (= lt!524097 call!56951)))

(declare-fun lt!524113 () Unit!38395)

(declare-fun call!56950 () Unit!38395)

(assert (=> b!1163397 (= lt!524113 call!56950)))

(declare-fun e!661526 () Unit!38395)

(assert (=> b!1163397 (= e!661526 lt!524096)))

(declare-fun b!1163398 () Bool)

(declare-fun res!771556 () Bool)

(assert (=> b!1163398 (=> (not res!771556) (not e!661530))))

(assert (=> b!1163398 (= res!771556 (= (select (arr!36217 _keys!1208) i!673) k!934))))

(declare-fun b!1163399 () Bool)

(declare-fun e!661523 () Bool)

(assert (=> b!1163399 (= e!661523 tp_is_empty!29147)))

(declare-fun bm!56946 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!56952 () ListLongMap!16625)

(declare-fun getCurrentListMapNoExtraKeys!4792 (array!75133 array!75135 (_ BitVec 32) (_ BitVec 32) V!43989 V!43989 (_ BitVec 32) Int) ListLongMap!16625)

(assert (=> bm!56946 (= call!56952 (getCurrentListMapNoExtraKeys!4792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163400 () Bool)

(declare-fun lt!524105 () Bool)

(assert (=> b!1163400 (= c!116413 (and (not lt!524105) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661529 () Unit!38395)

(assert (=> b!1163400 (= e!661526 e!661529)))

(declare-fun b!1163401 () Bool)

(declare-fun e!661531 () Unit!38395)

(declare-fun Unit!38397 () Unit!38395)

(assert (=> b!1163401 (= e!661531 Unit!38397)))

(declare-fun b!1163402 () Bool)

(declare-fun e!661519 () Unit!38395)

(declare-fun Unit!38398 () Unit!38395)

(assert (=> b!1163402 (= e!661519 Unit!38398)))

(assert (=> b!1163402 (= lt!524105 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163402 (= c!116412 (and (not lt!524105) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524115 () Unit!38395)

(assert (=> b!1163402 (= lt!524115 e!661526)))

(declare-fun lt!524101 () Unit!38395)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!556 (array!75133 array!75135 (_ BitVec 32) (_ BitVec 32) V!43989 V!43989 (_ BitVec 64) (_ BitVec 32) Int) Unit!38395)

(assert (=> b!1163402 (= lt!524101 (lemmaListMapContainsThenArrayContainsFrom!556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116416 () Bool)

(assert (=> b!1163402 (= c!116416 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771561 () Bool)

(declare-fun e!661527 () Bool)

(assert (=> b!1163402 (= res!771561 e!661527)))

(declare-fun e!661521 () Bool)

(assert (=> b!1163402 (=> (not res!771561) (not e!661521))))

(assert (=> b!1163402 e!661521))

(declare-fun lt!524112 () Unit!38395)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75133 (_ BitVec 32) (_ BitVec 32)) Unit!38395)

(assert (=> b!1163402 (= lt!524112 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25390 0))(
  ( (Nil!25387) (Cons!25386 (h!26595 (_ BitVec 64)) (t!36999 List!25390)) )
))
(declare-fun arrayNoDuplicates!0 (array!75133 (_ BitVec 32) List!25390) Bool)

(assert (=> b!1163402 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25387)))

(declare-fun lt!524107 () Unit!38395)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75133 (_ BitVec 64) (_ BitVec 32) List!25390) Unit!38395)

(assert (=> b!1163402 (= lt!524107 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25387))))

(assert (=> b!1163402 false))

(declare-fun bm!56947 () Bool)

(declare-fun call!56949 () Unit!38395)

(assert (=> bm!56947 (= call!56949 call!56950)))

(declare-fun b!1163403 () Bool)

(declare-fun call!56948 () ListLongMap!16625)

(declare-fun e!661525 () Bool)

(declare-fun -!1432 (ListLongMap!16625 (_ BitVec 64)) ListLongMap!16625)

(assert (=> b!1163403 (= e!661525 (= call!56948 (-!1432 call!56952 k!934)))))

(declare-fun b!1163404 () Bool)

(assert (=> b!1163404 call!56953))

(declare-fun lt!524102 () Unit!38395)

(assert (=> b!1163404 (= lt!524102 call!56949)))

(assert (=> b!1163404 (= e!661531 lt!524102)))

(declare-fun res!771555 () Bool)

(assert (=> start!99012 (=> (not res!771555) (not e!661530))))

(assert (=> start!99012 (= res!771555 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36753 _keys!1208))))))

(assert (=> start!99012 e!661530))

(assert (=> start!99012 tp_is_empty!29147))

(declare-fun array_inv!27714 (array!75133) Bool)

(assert (=> start!99012 (array_inv!27714 _keys!1208)))

(assert (=> start!99012 true))

(assert (=> start!99012 tp!86562))

(declare-fun e!661524 () Bool)

(declare-fun array_inv!27715 (array!75135) Bool)

(assert (=> start!99012 (and (array_inv!27715 _values!996) e!661524)))

(declare-fun b!1163405 () Bool)

(declare-fun e!661520 () Bool)

(assert (=> b!1163405 (= e!661520 true)))

(declare-fun e!661532 () Bool)

(assert (=> b!1163405 e!661532))

(declare-fun res!771562 () Bool)

(assert (=> b!1163405 (=> (not res!771562) (not e!661532))))

(declare-fun lt!524100 () ListLongMap!16625)

(assert (=> b!1163405 (= res!771562 (= lt!524100 lt!524103))))

(declare-fun lt!524095 () ListLongMap!16625)

(assert (=> b!1163405 (= lt!524100 (-!1432 lt!524095 k!934))))

(declare-fun lt!524108 () V!43989)

(assert (=> b!1163405 (= (-!1432 (+!3731 lt!524103 (tuple2!18657 (select (arr!36217 _keys!1208) from!1455) lt!524108)) (select (arr!36217 _keys!1208) from!1455)) lt!524103)))

(declare-fun lt!524098 () Unit!38395)

(declare-fun addThenRemoveForNewKeyIsSame!265 (ListLongMap!16625 (_ BitVec 64) V!43989) Unit!38395)

(assert (=> b!1163405 (= lt!524098 (addThenRemoveForNewKeyIsSame!265 lt!524103 (select (arr!36217 _keys!1208) from!1455) lt!524108))))

(declare-fun lt!524094 () V!43989)

(declare-fun get!18483 (ValueCell!13864 V!43989) V!43989)

(assert (=> b!1163405 (= lt!524108 (get!18483 (select (arr!36218 _values!996) from!1455) lt!524094))))

(declare-fun lt!524110 () Unit!38395)

(assert (=> b!1163405 (= lt!524110 e!661519)))

(declare-fun c!116415 () Bool)

(assert (=> b!1163405 (= c!116415 (contains!6832 lt!524103 k!934))))

(assert (=> b!1163405 (= lt!524103 (getCurrentListMapNoExtraKeys!4792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163406 () Bool)

(declare-fun res!771553 () Bool)

(assert (=> b!1163406 (=> (not res!771553) (not e!661518))))

(assert (=> b!1163406 (= res!771553 (arrayNoDuplicates!0 lt!524099 #b00000000000000000000000000000000 Nil!25387))))

(declare-fun bm!56948 () Bool)

(assert (=> bm!56948 (= call!56947 (contains!6832 (ite c!116412 lt!524097 call!56946) k!934))))

(declare-fun b!1163407 () Bool)

(assert (=> b!1163407 (= e!661527 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524105) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163408 () Bool)

(declare-fun res!771563 () Bool)

(assert (=> b!1163408 (=> (not res!771563) (not e!661530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163408 (= res!771563 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!45545 () Bool)

(declare-fun mapRes!45545 () Bool)

(declare-fun tp!86561 () Bool)

(assert (=> mapNonEmpty!45545 (= mapRes!45545 (and tp!86561 e!661522))))

(declare-fun mapValue!45545 () ValueCell!13864)

(declare-fun mapKey!45545 () (_ BitVec 32))

(declare-fun mapRest!45545 () (Array (_ BitVec 32) ValueCell!13864))

(assert (=> mapNonEmpty!45545 (= (arr!36218 _values!996) (store mapRest!45545 mapKey!45545 mapValue!45545))))

(declare-fun b!1163409 () Bool)

(declare-fun e!661517 () Bool)

(assert (=> b!1163409 (= e!661518 (not e!661517))))

(declare-fun res!771552 () Bool)

(assert (=> b!1163409 (=> res!771552 e!661517)))

(assert (=> b!1163409 (= res!771552 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163409 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!524111 () Unit!38395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75133 (_ BitVec 64) (_ BitVec 32)) Unit!38395)

(assert (=> b!1163409 (= lt!524111 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!56949 () Bool)

(assert (=> bm!56949 (= call!56950 (addStillContains!971 lt!524103 (ite (or c!116412 c!116413) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116412 c!116413) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1163410 () Bool)

(declare-fun lt!524109 () array!75135)

(assert (=> b!1163410 (= e!661532 (= lt!524100 (getCurrentListMapNoExtraKeys!4792 lt!524099 lt!524109 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163411 () Bool)

(assert (=> b!1163411 (= e!661521 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163412 () Bool)

(assert (=> b!1163412 (= e!661527 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163413 () Bool)

(declare-fun res!771560 () Bool)

(assert (=> b!1163413 (=> (not res!771560) (not e!661530))))

(assert (=> b!1163413 (= res!771560 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25387))))

(declare-fun b!1163414 () Bool)

(declare-fun res!771551 () Bool)

(assert (=> b!1163414 (=> (not res!771551) (not e!661530))))

(assert (=> b!1163414 (= res!771551 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36753 _keys!1208))))))

(declare-fun b!1163415 () Bool)

(declare-fun e!661533 () Bool)

(assert (=> b!1163415 (= e!661533 e!661520)))

(declare-fun res!771549 () Bool)

(assert (=> b!1163415 (=> res!771549 e!661520)))

(assert (=> b!1163415 (= res!771549 (not (= (select (arr!36217 _keys!1208) from!1455) k!934)))))

(assert (=> b!1163415 e!661525))

(declare-fun c!116411 () Bool)

(assert (=> b!1163415 (= c!116411 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524106 () Unit!38395)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!660 (array!75133 array!75135 (_ BitVec 32) (_ BitVec 32) V!43989 V!43989 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38395)

(assert (=> b!1163415 (= lt!524106 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!660 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163416 () Bool)

(declare-fun res!771557 () Bool)

(assert (=> b!1163416 (=> (not res!771557) (not e!661530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163416 (= res!771557 (validMask!0 mask!1564))))

(declare-fun b!1163417 () Bool)

(assert (=> b!1163417 (= e!661524 (and e!661523 mapRes!45545))))

(declare-fun condMapEmpty!45545 () Bool)

(declare-fun mapDefault!45545 () ValueCell!13864)

