; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98990 () Bool)

(assert start!98990)

(declare-fun b_free!24595 () Bool)

(declare-fun b_next!24595 () Bool)

(assert (=> start!98990 (= b_free!24595 (not b_next!24595))))

(declare-fun tp!86495 () Bool)

(declare-fun b_and!40039 () Bool)

(assert (=> start!98990 (= tp!86495 b_and!40039)))

(declare-fun bm!56679 () Bool)

(declare-fun call!56684 () Bool)

(declare-fun call!56687 () Bool)

(assert (=> bm!56679 (= call!56684 call!56687)))

(declare-fun b!1162382 () Bool)

(declare-datatypes ((V!43961 0))(
  ( (V!43962 (val!14619 Int)) )
))
(declare-datatypes ((tuple2!18634 0))(
  ( (tuple2!18635 (_1!9328 (_ BitVec 64)) (_2!9328 V!43961)) )
))
(declare-datatypes ((List!25368 0))(
  ( (Nil!25365) (Cons!25364 (h!26573 tuple2!18634) (t!36955 List!25368)) )
))
(declare-datatypes ((ListLongMap!16603 0))(
  ( (ListLongMap!16604 (toList!8317 List!25368)) )
))
(declare-fun call!56685 () ListLongMap!16603)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6822 (ListLongMap!16603 (_ BitVec 64)) Bool)

(assert (=> b!1162382 (contains!6822 call!56685 k!934)))

(declare-datatypes ((Unit!38349 0))(
  ( (Unit!38350) )
))
(declare-fun lt!523370 () Unit!38349)

(declare-fun minValue!944 () V!43961)

(declare-fun lt!523369 () ListLongMap!16603)

(declare-fun addStillContains!962 (ListLongMap!16603 (_ BitVec 64) V!43961 (_ BitVec 64)) Unit!38349)

(assert (=> b!1162382 (= lt!523370 (addStillContains!962 lt!523369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1162382 call!56687))

(declare-fun lt!523375 () ListLongMap!16603)

(declare-fun zeroValue!944 () V!43961)

(declare-fun +!3721 (ListLongMap!16603 tuple2!18634) ListLongMap!16603)

(assert (=> b!1162382 (= lt!523369 (+!3721 lt!523375 (tuple2!18635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523371 () Unit!38349)

(declare-fun call!56682 () Unit!38349)

(assert (=> b!1162382 (= lt!523371 call!56682)))

(declare-fun e!660957 () Unit!38349)

(assert (=> b!1162382 (= e!660957 lt!523370)))

(declare-fun b!1162383 () Bool)

(declare-fun e!660960 () Unit!38349)

(declare-fun Unit!38351 () Unit!38349)

(assert (=> b!1162383 (= e!660960 Unit!38351)))

(declare-fun lt!523373 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1162383 (= lt!523373 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116214 () Bool)

(assert (=> b!1162383 (= c!116214 (and (not lt!523373) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523381 () Unit!38349)

(assert (=> b!1162383 (= lt!523381 e!660957)))

(declare-datatypes ((array!75089 0))(
  ( (array!75090 (arr!36195 (Array (_ BitVec 32) (_ BitVec 64))) (size!36731 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75089)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!523386 () Unit!38349)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13853 0))(
  ( (ValueCellFull!13853 (v!17256 V!43961)) (EmptyCell!13853) )
))
(declare-datatypes ((array!75091 0))(
  ( (array!75092 (arr!36196 (Array (_ BitVec 32) ValueCell!13853)) (size!36732 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75091)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!547 (array!75089 array!75091 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 64) (_ BitVec 32) Int) Unit!38349)

(assert (=> b!1162383 (= lt!523386 (lemmaListMapContainsThenArrayContainsFrom!547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116215 () Bool)

(assert (=> b!1162383 (= c!116215 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771061 () Bool)

(declare-fun e!660963 () Bool)

(assert (=> b!1162383 (= res!771061 e!660963)))

(declare-fun e!660971 () Bool)

(assert (=> b!1162383 (=> (not res!771061) (not e!660971))))

(assert (=> b!1162383 e!660971))

(declare-fun lt!523389 () Unit!38349)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75089 (_ BitVec 32) (_ BitVec 32)) Unit!38349)

(assert (=> b!1162383 (= lt!523389 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25369 0))(
  ( (Nil!25366) (Cons!25365 (h!26574 (_ BitVec 64)) (t!36956 List!25369)) )
))
(declare-fun arrayNoDuplicates!0 (array!75089 (_ BitVec 32) List!25369) Bool)

(assert (=> b!1162383 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25366)))

(declare-fun lt!523377 () Unit!38349)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75089 (_ BitVec 64) (_ BitVec 32) List!25369) Unit!38349)

(assert (=> b!1162383 (= lt!523377 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25366))))

(assert (=> b!1162383 false))

(declare-fun b!1162384 () Bool)

(declare-fun c!116218 () Bool)

(assert (=> b!1162384 (= c!116218 (and (not lt!523373) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660962 () Unit!38349)

(assert (=> b!1162384 (= e!660957 e!660962)))

(declare-fun b!1162385 () Bool)

(declare-fun arrayContainsKey!0 (array!75089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162385 (= e!660963 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162386 () Bool)

(declare-fun e!660969 () Bool)

(declare-fun e!660970 () Bool)

(assert (=> b!1162386 (= e!660969 e!660970)))

(declare-fun res!771060 () Bool)

(assert (=> b!1162386 (=> res!771060 e!660970)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162386 (= res!771060 (not (= from!1455 i!673)))))

(declare-fun lt!523380 () array!75091)

(declare-fun lt!523376 () ListLongMap!16603)

(declare-fun lt!523378 () array!75089)

(declare-fun getCurrentListMapNoExtraKeys!4781 (array!75089 array!75091 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) Int) ListLongMap!16603)

(assert (=> b!1162386 (= lt!523376 (getCurrentListMapNoExtraKeys!4781 lt!523378 lt!523380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523388 () V!43961)

(assert (=> b!1162386 (= lt!523380 (array!75092 (store (arr!36196 _values!996) i!673 (ValueCellFull!13853 lt!523388)) (size!36732 _values!996)))))

(declare-fun dynLambda!2777 (Int (_ BitVec 64)) V!43961)

(assert (=> b!1162386 (= lt!523388 (dynLambda!2777 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523374 () ListLongMap!16603)

(assert (=> b!1162386 (= lt!523374 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162387 () Bool)

(declare-fun e!660956 () Bool)

(declare-fun tp_is_empty!29125 () Bool)

(assert (=> b!1162387 (= e!660956 tp_is_empty!29125)))

(declare-fun b!1162388 () Bool)

(declare-fun e!660966 () Bool)

(declare-fun e!660959 () Bool)

(assert (=> b!1162388 (= e!660966 e!660959)))

(declare-fun res!771063 () Bool)

(assert (=> b!1162388 (=> (not res!771063) (not e!660959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75089 (_ BitVec 32)) Bool)

(assert (=> b!1162388 (= res!771063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523378 mask!1564))))

(assert (=> b!1162388 (= lt!523378 (array!75090 (store (arr!36195 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36731 _keys!1208)))))

(declare-fun b!1162389 () Bool)

(declare-fun lt!523379 () Unit!38349)

(assert (=> b!1162389 (= e!660962 lt!523379)))

(declare-fun call!56686 () Unit!38349)

(assert (=> b!1162389 (= lt!523379 call!56686)))

(assert (=> b!1162389 call!56684))

(declare-fun bm!56680 () Bool)

(declare-fun call!56688 () ListLongMap!16603)

(assert (=> bm!56680 (= call!56688 call!56685)))

(declare-fun b!1162390 () Bool)

(assert (=> b!1162390 (= e!660959 (not e!660969))))

(declare-fun res!771059 () Bool)

(assert (=> b!1162390 (=> res!771059 e!660969)))

(assert (=> b!1162390 (= res!771059 (bvsgt from!1455 i!673))))

(assert (=> b!1162390 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!523368 () Unit!38349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75089 (_ BitVec 64) (_ BitVec 32)) Unit!38349)

(assert (=> b!1162390 (= lt!523368 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1162391 () Bool)

(declare-fun res!771058 () Bool)

(assert (=> b!1162391 (=> (not res!771058) (not e!660966))))

(assert (=> b!1162391 (= res!771058 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25366))))

(declare-fun b!1162392 () Bool)

(declare-fun res!771067 () Bool)

(assert (=> b!1162392 (=> (not res!771067) (not e!660966))))

(assert (=> b!1162392 (= res!771067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45512 () Bool)

(declare-fun mapRes!45512 () Bool)

(assert (=> mapIsEmpty!45512 mapRes!45512))

(declare-fun b!1162393 () Bool)

(declare-fun e!660968 () Unit!38349)

(declare-fun Unit!38352 () Unit!38349)

(assert (=> b!1162393 (= e!660968 Unit!38352)))

(declare-fun b!1162394 () Bool)

(declare-fun res!771054 () Bool)

(assert (=> b!1162394 (=> (not res!771054) (not e!660959))))

(assert (=> b!1162394 (= res!771054 (arrayNoDuplicates!0 lt!523378 #b00000000000000000000000000000000 Nil!25366))))

(declare-fun bm!56681 () Bool)

(assert (=> bm!56681 (= call!56686 call!56682)))

(declare-fun b!1162395 () Bool)

(declare-fun res!771056 () Bool)

(assert (=> b!1162395 (=> (not res!771056) (not e!660966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162395 (= res!771056 (validKeyInArray!0 k!934))))

(declare-fun bm!56682 () Bool)

(declare-fun call!56689 () ListLongMap!16603)

(assert (=> bm!56682 (= call!56689 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162396 () Bool)

(declare-fun Unit!38353 () Unit!38349)

(assert (=> b!1162396 (= e!660960 Unit!38353)))

(declare-fun b!1162397 () Bool)

(assert (=> b!1162397 call!56684))

(declare-fun lt!523384 () Unit!38349)

(assert (=> b!1162397 (= lt!523384 call!56686)))

(assert (=> b!1162397 (= e!660968 lt!523384)))

(declare-fun call!56683 () ListLongMap!16603)

(declare-fun e!660964 () Bool)

(declare-fun b!1162398 () Bool)

(declare-fun -!1423 (ListLongMap!16603 (_ BitVec 64)) ListLongMap!16603)

(assert (=> b!1162398 (= e!660964 (= call!56683 (-!1423 call!56689 k!934)))))

(declare-fun res!771068 () Bool)

(assert (=> start!98990 (=> (not res!771068) (not e!660966))))

(assert (=> start!98990 (= res!771068 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36731 _keys!1208))))))

(assert (=> start!98990 e!660966))

(assert (=> start!98990 tp_is_empty!29125))

(declare-fun array_inv!27696 (array!75089) Bool)

(assert (=> start!98990 (array_inv!27696 _keys!1208)))

(assert (=> start!98990 true))

(assert (=> start!98990 tp!86495))

(declare-fun e!660972 () Bool)

(declare-fun array_inv!27697 (array!75091) Bool)

(assert (=> start!98990 (and (array_inv!27697 _values!996) e!660972)))

(declare-fun b!1162399 () Bool)

(assert (=> b!1162399 (= e!660964 (= call!56683 call!56689))))

(declare-fun b!1162400 () Bool)

(declare-fun e!660967 () Bool)

(assert (=> b!1162400 (= e!660970 e!660967)))

(declare-fun res!771065 () Bool)

(assert (=> b!1162400 (=> res!771065 e!660967)))

(assert (=> b!1162400 (= res!771065 (not (= (select (arr!36195 _keys!1208) from!1455) k!934)))))

(assert (=> b!1162400 e!660964))

(declare-fun c!116213 () Bool)

(assert (=> b!1162400 (= c!116213 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523382 () Unit!38349)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!652 (array!75089 array!75091 (_ BitVec 32) (_ BitVec 32) V!43961 V!43961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38349)

(assert (=> b!1162400 (= lt!523382 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!652 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56683 () Bool)

(assert (=> bm!56683 (= call!56683 (getCurrentListMapNoExtraKeys!4781 lt!523378 lt!523380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162401 () Bool)

(declare-fun res!771064 () Bool)

(assert (=> b!1162401 (=> (not res!771064) (not e!660966))))

(assert (=> b!1162401 (= res!771064 (= (select (arr!36195 _keys!1208) i!673) k!934))))

(declare-fun bm!56684 () Bool)

(assert (=> bm!56684 (= call!56685 (+!3721 (ite c!116214 lt!523369 lt!523375) (ite c!116214 (tuple2!18635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116218 (tuple2!18635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!45512 () Bool)

(declare-fun tp!86496 () Bool)

(assert (=> mapNonEmpty!45512 (= mapRes!45512 (and tp!86496 e!660956))))

(declare-fun mapRest!45512 () (Array (_ BitVec 32) ValueCell!13853))

(declare-fun mapValue!45512 () ValueCell!13853)

(declare-fun mapKey!45512 () (_ BitVec 32))

(assert (=> mapNonEmpty!45512 (= (arr!36196 _values!996) (store mapRest!45512 mapKey!45512 mapValue!45512))))

(declare-fun b!1162402 () Bool)

(assert (=> b!1162402 (= e!660967 true)))

(declare-fun e!660958 () Bool)

(assert (=> b!1162402 e!660958))

(declare-fun res!771066 () Bool)

(assert (=> b!1162402 (=> (not res!771066) (not e!660958))))

(declare-fun lt!523383 () ListLongMap!16603)

(assert (=> b!1162402 (= res!771066 (= lt!523383 lt!523375))))

(assert (=> b!1162402 (= lt!523383 (-!1423 lt!523374 k!934))))

(declare-fun lt!523387 () V!43961)

(assert (=> b!1162402 (= (-!1423 (+!3721 lt!523375 (tuple2!18635 (select (arr!36195 _keys!1208) from!1455) lt!523387)) (select (arr!36195 _keys!1208) from!1455)) lt!523375)))

(declare-fun lt!523372 () Unit!38349)

(declare-fun addThenRemoveForNewKeyIsSame!257 (ListLongMap!16603 (_ BitVec 64) V!43961) Unit!38349)

(assert (=> b!1162402 (= lt!523372 (addThenRemoveForNewKeyIsSame!257 lt!523375 (select (arr!36195 _keys!1208) from!1455) lt!523387))))

(declare-fun get!18469 (ValueCell!13853 V!43961) V!43961)

(assert (=> b!1162402 (= lt!523387 (get!18469 (select (arr!36196 _values!996) from!1455) lt!523388))))

(declare-fun lt!523385 () Unit!38349)

(assert (=> b!1162402 (= lt!523385 e!660960)))

(declare-fun c!116216 () Bool)

(assert (=> b!1162402 (= c!116216 (contains!6822 lt!523375 k!934))))

(assert (=> b!1162402 (= lt!523375 (getCurrentListMapNoExtraKeys!4781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162403 () Bool)

(assert (=> b!1162403 (= e!660963 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523373) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56685 () Bool)

(assert (=> bm!56685 (= call!56682 (addStillContains!962 lt!523375 (ite (or c!116214 c!116218) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116214 c!116218) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1162404 () Bool)

(declare-fun res!771055 () Bool)

(assert (=> b!1162404 (=> (not res!771055) (not e!660966))))

(assert (=> b!1162404 (= res!771055 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36731 _keys!1208))))))

(declare-fun b!1162405 () Bool)

(declare-fun e!660961 () Bool)

(assert (=> b!1162405 (= e!660961 tp_is_empty!29125)))

(declare-fun b!1162406 () Bool)

(declare-fun res!771062 () Bool)

(assert (=> b!1162406 (=> (not res!771062) (not e!660966))))

(assert (=> b!1162406 (= res!771062 (and (= (size!36732 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36731 _keys!1208) (size!36732 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162407 () Bool)

(assert (=> b!1162407 (= e!660958 (= lt!523383 (getCurrentListMapNoExtraKeys!4781 lt!523378 lt!523380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56686 () Bool)

(assert (=> bm!56686 (= call!56687 (contains!6822 (ite c!116214 lt!523369 call!56688) k!934))))

(declare-fun b!1162408 () Bool)

(assert (=> b!1162408 (= e!660972 (and e!660961 mapRes!45512))))

(declare-fun condMapEmpty!45512 () Bool)

(declare-fun mapDefault!45512 () ValueCell!13853)

