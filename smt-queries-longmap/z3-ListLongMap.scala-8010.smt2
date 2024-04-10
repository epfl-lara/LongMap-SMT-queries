; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98902 () Bool)

(assert start!98902)

(declare-fun b_free!24507 () Bool)

(declare-fun b_next!24507 () Bool)

(assert (=> start!98902 (= b_free!24507 (not b_next!24507))))

(declare-fun tp!86232 () Bool)

(declare-fun b_and!39863 () Bool)

(assert (=> start!98902 (= tp!86232 b_and!39863)))

(declare-fun b!1158334 () Bool)

(declare-fun e!658717 () Bool)

(declare-fun tp_is_empty!29037 () Bool)

(assert (=> b!1158334 (= e!658717 tp_is_empty!29037)))

(declare-fun b!1158335 () Bool)

(declare-datatypes ((Unit!38167 0))(
  ( (Unit!38168) )
))
(declare-fun e!658720 () Unit!38167)

(declare-fun e!658722 () Unit!38167)

(assert (=> b!1158335 (= e!658720 e!658722)))

(declare-fun c!115426 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!520474 () Bool)

(assert (=> b!1158335 (= c!115426 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520474))))

(declare-fun b!1158336 () Bool)

(declare-fun e!658712 () Bool)

(assert (=> b!1158336 (= e!658712 tp_is_empty!29037)))

(declare-fun bm!55623 () Bool)

(declare-fun call!55628 () Unit!38167)

(declare-fun call!55629 () Unit!38167)

(assert (=> bm!55623 (= call!55628 call!55629)))

(declare-fun b!1158337 () Bool)

(declare-fun e!658724 () Bool)

(assert (=> b!1158337 (= e!658724 true)))

(declare-fun e!658716 () Bool)

(assert (=> b!1158337 e!658716))

(declare-fun res!769074 () Bool)

(assert (=> b!1158337 (=> (not res!769074) (not e!658716))))

(declare-datatypes ((V!43843 0))(
  ( (V!43844 (val!14575 Int)) )
))
(declare-datatypes ((tuple2!18552 0))(
  ( (tuple2!18553 (_1!9287 (_ BitVec 64)) (_2!9287 V!43843)) )
))
(declare-datatypes ((List!25291 0))(
  ( (Nil!25288) (Cons!25287 (h!26496 tuple2!18552) (t!36790 List!25291)) )
))
(declare-datatypes ((ListLongMap!16521 0))(
  ( (ListLongMap!16522 (toList!8276 List!25291)) )
))
(declare-fun lt!520485 () ListLongMap!16521)

(declare-fun lt!520483 () ListLongMap!16521)

(assert (=> b!1158337 (= res!769074 (= lt!520485 lt!520483))))

(declare-fun lt!520466 () ListLongMap!16521)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1389 (ListLongMap!16521 (_ BitVec 64)) ListLongMap!16521)

(assert (=> b!1158337 (= lt!520485 (-!1389 lt!520466 k0!934))))

(declare-datatypes ((array!74917 0))(
  ( (array!74918 (arr!36109 (Array (_ BitVec 32) (_ BitVec 64))) (size!36645 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74917)

(declare-fun lt!520478 () V!43843)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3686 (ListLongMap!16521 tuple2!18552) ListLongMap!16521)

(assert (=> b!1158337 (= (-!1389 (+!3686 lt!520483 (tuple2!18553 (select (arr!36109 _keys!1208) from!1455) lt!520478)) (select (arr!36109 _keys!1208) from!1455)) lt!520483)))

(declare-fun lt!520477 () Unit!38167)

(declare-fun addThenRemoveForNewKeyIsSame!226 (ListLongMap!16521 (_ BitVec 64) V!43843) Unit!38167)

(assert (=> b!1158337 (= lt!520477 (addThenRemoveForNewKeyIsSame!226 lt!520483 (select (arr!36109 _keys!1208) from!1455) lt!520478))))

(declare-fun lt!520472 () V!43843)

(declare-datatypes ((ValueCell!13809 0))(
  ( (ValueCellFull!13809 (v!17212 V!43843)) (EmptyCell!13809) )
))
(declare-datatypes ((array!74919 0))(
  ( (array!74920 (arr!36110 (Array (_ BitVec 32) ValueCell!13809)) (size!36646 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74919)

(declare-fun get!18408 (ValueCell!13809 V!43843) V!43843)

(assert (=> b!1158337 (= lt!520478 (get!18408 (select (arr!36110 _values!996) from!1455) lt!520472))))

(declare-fun lt!520470 () Unit!38167)

(declare-fun e!658721 () Unit!38167)

(assert (=> b!1158337 (= lt!520470 e!658721)))

(declare-fun c!115423 () Bool)

(declare-fun contains!6786 (ListLongMap!16521 (_ BitVec 64)) Bool)

(assert (=> b!1158337 (= c!115423 (contains!6786 lt!520483 k0!934))))

(declare-fun zeroValue!944 () V!43843)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43843)

(declare-fun getCurrentListMapNoExtraKeys!4741 (array!74917 array!74919 (_ BitVec 32) (_ BitVec 32) V!43843 V!43843 (_ BitVec 32) Int) ListLongMap!16521)

(assert (=> b!1158337 (= lt!520483 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55630 () Bool)

(declare-fun bm!55624 () Bool)

(declare-fun call!55631 () ListLongMap!16521)

(declare-fun lt!520482 () ListLongMap!16521)

(declare-fun c!115425 () Bool)

(assert (=> bm!55624 (= call!55630 (contains!6786 (ite c!115425 lt!520482 call!55631) k0!934))))

(declare-fun b!1158338 () Bool)

(declare-fun res!769080 () Bool)

(declare-fun e!658728 () Bool)

(assert (=> b!1158338 (=> (not res!769080) (not e!658728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158338 (= res!769080 (validKeyInArray!0 k0!934))))

(declare-fun bm!55625 () Bool)

(declare-fun call!55627 () Bool)

(assert (=> bm!55625 (= call!55627 call!55630)))

(declare-fun b!1158339 () Bool)

(declare-fun res!769082 () Bool)

(assert (=> b!1158339 (=> (not res!769082) (not e!658728))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158339 (= res!769082 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36645 _keys!1208))))))

(declare-fun b!1158340 () Bool)

(declare-fun e!658718 () Bool)

(declare-fun e!658726 () Bool)

(assert (=> b!1158340 (= e!658718 e!658726)))

(declare-fun res!769086 () Bool)

(assert (=> b!1158340 (=> res!769086 e!658726)))

(assert (=> b!1158340 (= res!769086 (not (= from!1455 i!673)))))

(declare-fun lt!520484 () ListLongMap!16521)

(declare-fun lt!520473 () array!74919)

(declare-fun lt!520481 () array!74917)

(assert (=> b!1158340 (= lt!520484 (getCurrentListMapNoExtraKeys!4741 lt!520481 lt!520473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1158340 (= lt!520473 (array!74920 (store (arr!36110 _values!996) i!673 (ValueCellFull!13809 lt!520472)) (size!36646 _values!996)))))

(declare-fun dynLambda!2746 (Int (_ BitVec 64)) V!43843)

(assert (=> b!1158340 (= lt!520472 (dynLambda!2746 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1158340 (= lt!520466 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158341 () Bool)

(declare-fun lt!520480 () Unit!38167)

(assert (=> b!1158341 (= e!658720 lt!520480)))

(assert (=> b!1158341 (= lt!520480 call!55628)))

(assert (=> b!1158341 call!55627))

(declare-fun call!55633 () ListLongMap!16521)

(declare-fun c!115422 () Bool)

(declare-fun bm!55626 () Bool)

(assert (=> bm!55626 (= call!55633 (+!3686 (ite c!115425 lt!520482 lt!520483) (ite c!115425 (tuple2!18553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115422 (tuple2!18553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!658714 () Bool)

(declare-fun b!1158342 () Bool)

(declare-fun arrayContainsKey!0 (array!74917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158342 (= e!658714 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158343 () Bool)

(declare-fun res!769084 () Bool)

(assert (=> b!1158343 (=> (not res!769084) (not e!658728))))

(assert (=> b!1158343 (= res!769084 (and (= (size!36646 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36645 _keys!1208) (size!36646 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!769078 () Bool)

(assert (=> start!98902 (=> (not res!769078) (not e!658728))))

(assert (=> start!98902 (= res!769078 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36645 _keys!1208))))))

(assert (=> start!98902 e!658728))

(assert (=> start!98902 tp_is_empty!29037))

(declare-fun array_inv!27632 (array!74917) Bool)

(assert (=> start!98902 (array_inv!27632 _keys!1208)))

(assert (=> start!98902 true))

(assert (=> start!98902 tp!86232))

(declare-fun e!658727 () Bool)

(declare-fun array_inv!27633 (array!74919) Bool)

(assert (=> start!98902 (and (array_inv!27633 _values!996) e!658727)))

(declare-fun bm!55627 () Bool)

(declare-fun addStillContains!927 (ListLongMap!16521 (_ BitVec 64) V!43843 (_ BitVec 64)) Unit!38167)

(assert (=> bm!55627 (= call!55629 (addStillContains!927 (ite c!115425 lt!520482 lt!520483) (ite c!115425 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115422 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115425 minValue!944 (ite c!115422 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1158344 () Bool)

(assert (=> b!1158344 (= c!115422 (and (not lt!520474) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658715 () Unit!38167)

(assert (=> b!1158344 (= e!658715 e!658720)))

(declare-fun b!1158345 () Bool)

(declare-fun Unit!38169 () Unit!38167)

(assert (=> b!1158345 (= e!658722 Unit!38169)))

(declare-fun e!658723 () Bool)

(declare-fun b!1158346 () Bool)

(assert (=> b!1158346 (= e!658723 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45380 () Bool)

(declare-fun mapRes!45380 () Bool)

(declare-fun tp!86231 () Bool)

(assert (=> mapNonEmpty!45380 (= mapRes!45380 (and tp!86231 e!658717))))

(declare-fun mapValue!45380 () ValueCell!13809)

(declare-fun mapRest!45380 () (Array (_ BitVec 32) ValueCell!13809))

(declare-fun mapKey!45380 () (_ BitVec 32))

(assert (=> mapNonEmpty!45380 (= (arr!36110 _values!996) (store mapRest!45380 mapKey!45380 mapValue!45380))))

(declare-fun b!1158347 () Bool)

(declare-fun res!769085 () Bool)

(declare-fun e!658713 () Bool)

(assert (=> b!1158347 (=> (not res!769085) (not e!658713))))

(declare-datatypes ((List!25292 0))(
  ( (Nil!25289) (Cons!25288 (h!26497 (_ BitVec 64)) (t!36791 List!25292)) )
))
(declare-fun arrayNoDuplicates!0 (array!74917 (_ BitVec 32) List!25292) Bool)

(assert (=> b!1158347 (= res!769085 (arrayNoDuplicates!0 lt!520481 #b00000000000000000000000000000000 Nil!25289))))

(declare-fun b!1158348 () Bool)

(declare-fun Unit!38170 () Unit!38167)

(assert (=> b!1158348 (= e!658721 Unit!38170)))

(assert (=> b!1158348 (= lt!520474 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158348 (= c!115425 (and (not lt!520474) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520465 () Unit!38167)

(assert (=> b!1158348 (= lt!520465 e!658715)))

(declare-fun lt!520468 () Unit!38167)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!513 (array!74917 array!74919 (_ BitVec 32) (_ BitVec 32) V!43843 V!43843 (_ BitVec 64) (_ BitVec 32) Int) Unit!38167)

(assert (=> b!1158348 (= lt!520468 (lemmaListMapContainsThenArrayContainsFrom!513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115424 () Bool)

(assert (=> b!1158348 (= c!115424 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769087 () Bool)

(assert (=> b!1158348 (= res!769087 e!658723)))

(assert (=> b!1158348 (=> (not res!769087) (not e!658714))))

(assert (=> b!1158348 e!658714))

(declare-fun lt!520476 () Unit!38167)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74917 (_ BitVec 32) (_ BitVec 32)) Unit!38167)

(assert (=> b!1158348 (= lt!520476 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158348 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25289)))

(declare-fun lt!520464 () Unit!38167)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74917 (_ BitVec 64) (_ BitVec 32) List!25292) Unit!38167)

(assert (=> b!1158348 (= lt!520464 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25289))))

(assert (=> b!1158348 false))

(declare-fun b!1158349 () Bool)

(declare-fun res!769075 () Bool)

(assert (=> b!1158349 (=> (not res!769075) (not e!658728))))

(assert (=> b!1158349 (= res!769075 (= (select (arr!36109 _keys!1208) i!673) k0!934))))

(declare-fun bm!55628 () Bool)

(assert (=> bm!55628 (= call!55631 call!55633)))

(declare-fun e!658725 () Bool)

(declare-fun call!55632 () ListLongMap!16521)

(declare-fun b!1158350 () Bool)

(declare-fun call!55626 () ListLongMap!16521)

(assert (=> b!1158350 (= e!658725 (= call!55632 (-!1389 call!55626 k0!934)))))

(declare-fun bm!55629 () Bool)

(assert (=> bm!55629 (= call!55632 (getCurrentListMapNoExtraKeys!4741 lt!520481 lt!520473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158351 () Bool)

(declare-fun res!769079 () Bool)

(assert (=> b!1158351 (=> (not res!769079) (not e!658728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74917 (_ BitVec 32)) Bool)

(assert (=> b!1158351 (= res!769079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158352 () Bool)

(declare-fun res!769083 () Bool)

(assert (=> b!1158352 (=> (not res!769083) (not e!658728))))

(assert (=> b!1158352 (= res!769083 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25289))))

(declare-fun b!1158353 () Bool)

(assert (=> b!1158353 (= e!658728 e!658713)))

(declare-fun res!769077 () Bool)

(assert (=> b!1158353 (=> (not res!769077) (not e!658713))))

(assert (=> b!1158353 (= res!769077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520481 mask!1564))))

(assert (=> b!1158353 (= lt!520481 (array!74918 (store (arr!36109 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36645 _keys!1208)))))

(declare-fun b!1158354 () Bool)

(assert (=> b!1158354 (= e!658725 (= call!55632 call!55626))))

(declare-fun mapIsEmpty!45380 () Bool)

(assert (=> mapIsEmpty!45380 mapRes!45380))

(declare-fun b!1158355 () Bool)

(assert (=> b!1158355 call!55627))

(declare-fun lt!520469 () Unit!38167)

(assert (=> b!1158355 (= lt!520469 call!55628)))

(assert (=> b!1158355 (= e!658722 lt!520469)))

(declare-fun b!1158356 () Bool)

(assert (=> b!1158356 (contains!6786 call!55633 k0!934)))

(declare-fun lt!520467 () Unit!38167)

(assert (=> b!1158356 (= lt!520467 call!55629)))

(assert (=> b!1158356 call!55630))

(assert (=> b!1158356 (= lt!520482 (+!3686 lt!520483 (tuple2!18553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520475 () Unit!38167)

(assert (=> b!1158356 (= lt!520475 (addStillContains!927 lt!520483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1158356 (= e!658715 lt!520467)))

(declare-fun b!1158357 () Bool)

(assert (=> b!1158357 (= e!658713 (not e!658718))))

(declare-fun res!769076 () Bool)

(assert (=> b!1158357 (=> res!769076 e!658718)))

(assert (=> b!1158357 (= res!769076 (bvsgt from!1455 i!673))))

(assert (=> b!1158357 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520479 () Unit!38167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74917 (_ BitVec 64) (_ BitVec 32)) Unit!38167)

(assert (=> b!1158357 (= lt!520479 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!55630 () Bool)

(assert (=> bm!55630 (= call!55626 (getCurrentListMapNoExtraKeys!4741 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158358 () Bool)

(assert (=> b!1158358 (= e!658727 (and e!658712 mapRes!45380))))

(declare-fun condMapEmpty!45380 () Bool)

(declare-fun mapDefault!45380 () ValueCell!13809)

(assert (=> b!1158358 (= condMapEmpty!45380 (= (arr!36110 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13809)) mapDefault!45380)))))

(declare-fun b!1158359 () Bool)

(declare-fun res!769088 () Bool)

(assert (=> b!1158359 (=> (not res!769088) (not e!658728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158359 (= res!769088 (validMask!0 mask!1564))))

(declare-fun b!1158360 () Bool)

(declare-fun Unit!38171 () Unit!38167)

(assert (=> b!1158360 (= e!658721 Unit!38171)))

(declare-fun b!1158361 () Bool)

(assert (=> b!1158361 (= e!658723 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520474) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158362 () Bool)

(assert (=> b!1158362 (= e!658726 e!658724)))

(declare-fun res!769081 () Bool)

(assert (=> b!1158362 (=> res!769081 e!658724)))

(assert (=> b!1158362 (= res!769081 (not (= (select (arr!36109 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158362 e!658725))

(declare-fun c!115421 () Bool)

(assert (=> b!1158362 (= c!115421 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520471 () Unit!38167)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!620 (array!74917 array!74919 (_ BitVec 32) (_ BitVec 32) V!43843 V!43843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38167)

(assert (=> b!1158362 (= lt!520471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158363 () Bool)

(assert (=> b!1158363 (= e!658716 (= lt!520485 (getCurrentListMapNoExtraKeys!4741 lt!520481 lt!520473 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (= (and start!98902 res!769078) b!1158359))

(assert (= (and b!1158359 res!769088) b!1158343))

(assert (= (and b!1158343 res!769084) b!1158351))

(assert (= (and b!1158351 res!769079) b!1158352))

(assert (= (and b!1158352 res!769083) b!1158339))

(assert (= (and b!1158339 res!769082) b!1158338))

(assert (= (and b!1158338 res!769080) b!1158349))

(assert (= (and b!1158349 res!769075) b!1158353))

(assert (= (and b!1158353 res!769077) b!1158347))

(assert (= (and b!1158347 res!769085) b!1158357))

(assert (= (and b!1158357 (not res!769076)) b!1158340))

(assert (= (and b!1158340 (not res!769086)) b!1158362))

(assert (= (and b!1158362 c!115421) b!1158350))

(assert (= (and b!1158362 (not c!115421)) b!1158354))

(assert (= (or b!1158350 b!1158354) bm!55629))

(assert (= (or b!1158350 b!1158354) bm!55630))

(assert (= (and b!1158362 (not res!769081)) b!1158337))

(assert (= (and b!1158337 c!115423) b!1158348))

(assert (= (and b!1158337 (not c!115423)) b!1158360))

(assert (= (and b!1158348 c!115425) b!1158356))

(assert (= (and b!1158348 (not c!115425)) b!1158344))

(assert (= (and b!1158344 c!115422) b!1158341))

(assert (= (and b!1158344 (not c!115422)) b!1158335))

(assert (= (and b!1158335 c!115426) b!1158355))

(assert (= (and b!1158335 (not c!115426)) b!1158345))

(assert (= (or b!1158341 b!1158355) bm!55623))

(assert (= (or b!1158341 b!1158355) bm!55628))

(assert (= (or b!1158341 b!1158355) bm!55625))

(assert (= (or b!1158356 bm!55625) bm!55624))

(assert (= (or b!1158356 bm!55623) bm!55627))

(assert (= (or b!1158356 bm!55628) bm!55626))

(assert (= (and b!1158348 c!115424) b!1158346))

(assert (= (and b!1158348 (not c!115424)) b!1158361))

(assert (= (and b!1158348 res!769087) b!1158342))

(assert (= (and b!1158337 res!769074) b!1158363))

(assert (= (and b!1158358 condMapEmpty!45380) mapIsEmpty!45380))

(assert (= (and b!1158358 (not condMapEmpty!45380)) mapNonEmpty!45380))

(get-info :version)

(assert (= (and mapNonEmpty!45380 ((_ is ValueCellFull!13809) mapValue!45380)) b!1158334))

(assert (= (and b!1158358 ((_ is ValueCellFull!13809) mapDefault!45380)) b!1158336))

(assert (= start!98902 b!1158358))

(declare-fun b_lambda!19613 () Bool)

(assert (=> (not b_lambda!19613) (not b!1158340)))

(declare-fun t!36789 () Bool)

(declare-fun tb!9319 () Bool)

(assert (=> (and start!98902 (= defaultEntry!1004 defaultEntry!1004) t!36789) tb!9319))

(declare-fun result!19203 () Bool)

(assert (=> tb!9319 (= result!19203 tp_is_empty!29037)))

(assert (=> b!1158340 t!36789))

(declare-fun b_and!39865 () Bool)

(assert (= b_and!39863 (and (=> t!36789 result!19203) b_and!39865)))

(declare-fun m!1067549 () Bool)

(assert (=> b!1158357 m!1067549))

(declare-fun m!1067551 () Bool)

(assert (=> b!1158357 m!1067551))

(declare-fun m!1067553 () Bool)

(assert (=> bm!55626 m!1067553))

(declare-fun m!1067555 () Bool)

(assert (=> b!1158348 m!1067555))

(declare-fun m!1067557 () Bool)

(assert (=> b!1158348 m!1067557))

(declare-fun m!1067559 () Bool)

(assert (=> b!1158348 m!1067559))

(declare-fun m!1067561 () Bool)

(assert (=> b!1158348 m!1067561))

(declare-fun m!1067563 () Bool)

(assert (=> b!1158350 m!1067563))

(declare-fun m!1067565 () Bool)

(assert (=> b!1158363 m!1067565))

(declare-fun m!1067567 () Bool)

(assert (=> b!1158347 m!1067567))

(declare-fun m!1067569 () Bool)

(assert (=> mapNonEmpty!45380 m!1067569))

(declare-fun m!1067571 () Bool)

(assert (=> b!1158337 m!1067571))

(declare-fun m!1067573 () Bool)

(assert (=> b!1158337 m!1067573))

(assert (=> b!1158337 m!1067573))

(declare-fun m!1067575 () Bool)

(assert (=> b!1158337 m!1067575))

(declare-fun m!1067577 () Bool)

(assert (=> b!1158337 m!1067577))

(declare-fun m!1067579 () Bool)

(assert (=> b!1158337 m!1067579))

(declare-fun m!1067581 () Bool)

(assert (=> b!1158337 m!1067581))

(assert (=> b!1158337 m!1067577))

(assert (=> b!1158337 m!1067579))

(declare-fun m!1067583 () Bool)

(assert (=> b!1158337 m!1067583))

(assert (=> b!1158337 m!1067579))

(declare-fun m!1067585 () Bool)

(assert (=> b!1158337 m!1067585))

(declare-fun m!1067587 () Bool)

(assert (=> b!1158337 m!1067587))

(assert (=> b!1158362 m!1067579))

(declare-fun m!1067589 () Bool)

(assert (=> b!1158362 m!1067589))

(declare-fun m!1067591 () Bool)

(assert (=> start!98902 m!1067591))

(declare-fun m!1067593 () Bool)

(assert (=> start!98902 m!1067593))

(declare-fun m!1067595 () Bool)

(assert (=> b!1158352 m!1067595))

(declare-fun m!1067597 () Bool)

(assert (=> b!1158338 m!1067597))

(declare-fun m!1067599 () Bool)

(assert (=> b!1158349 m!1067599))

(declare-fun m!1067601 () Bool)

(assert (=> b!1158351 m!1067601))

(declare-fun m!1067603 () Bool)

(assert (=> b!1158340 m!1067603))

(declare-fun m!1067605 () Bool)

(assert (=> b!1158340 m!1067605))

(declare-fun m!1067607 () Bool)

(assert (=> b!1158340 m!1067607))

(declare-fun m!1067609 () Bool)

(assert (=> b!1158340 m!1067609))

(declare-fun m!1067611 () Bool)

(assert (=> b!1158359 m!1067611))

(assert (=> bm!55630 m!1067571))

(declare-fun m!1067613 () Bool)

(assert (=> bm!55624 m!1067613))

(declare-fun m!1067615 () Bool)

(assert (=> b!1158356 m!1067615))

(declare-fun m!1067617 () Bool)

(assert (=> b!1158356 m!1067617))

(declare-fun m!1067619 () Bool)

(assert (=> b!1158356 m!1067619))

(assert (=> bm!55629 m!1067565))

(declare-fun m!1067621 () Bool)

(assert (=> b!1158346 m!1067621))

(declare-fun m!1067623 () Bool)

(assert (=> b!1158353 m!1067623))

(declare-fun m!1067625 () Bool)

(assert (=> b!1158353 m!1067625))

(declare-fun m!1067627 () Bool)

(assert (=> bm!55627 m!1067627))

(assert (=> b!1158342 m!1067621))

(check-sat (not bm!55627) (not bm!55629) (not b!1158363) (not b!1158350) (not b!1158356) (not bm!55630) (not b!1158362) (not bm!55624) (not b!1158359) (not b!1158357) (not b!1158348) (not b!1158351) (not b!1158340) (not b!1158337) (not b!1158347) (not b!1158353) b_and!39865 (not start!98902) (not b!1158338) (not b_next!24507) (not b_lambda!19613) (not bm!55626) (not b!1158342) (not b!1158346) (not mapNonEmpty!45380) (not b!1158352) tp_is_empty!29037)
(check-sat b_and!39865 (not b_next!24507))
