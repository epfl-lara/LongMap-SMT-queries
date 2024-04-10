; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98750 () Bool)

(assert start!98750)

(declare-fun b_free!24355 () Bool)

(declare-fun b_next!24355 () Bool)

(assert (=> start!98750 (= b_free!24355 (not b_next!24355))))

(declare-fun tp!85775 () Bool)

(declare-fun b_and!39559 () Bool)

(assert (=> start!98750 (= tp!85775 b_and!39559)))

(declare-fun call!53805 () Bool)

(declare-fun bm!53799 () Bool)

(declare-datatypes ((V!43641 0))(
  ( (V!43642 (val!14499 Int)) )
))
(declare-datatypes ((tuple2!18408 0))(
  ( (tuple2!18409 (_1!9215 (_ BitVec 64)) (_2!9215 V!43641)) )
))
(declare-datatypes ((List!25156 0))(
  ( (Nil!25153) (Cons!25152 (h!26361 tuple2!18408) (t!36503 List!25156)) )
))
(declare-datatypes ((ListLongMap!16377 0))(
  ( (ListLongMap!16378 (toList!8204 List!25156)) )
))
(declare-fun lt!515456 () ListLongMap!16377)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!114058 () Bool)

(declare-fun call!53806 () ListLongMap!16377)

(declare-fun contains!6723 (ListLongMap!16377 (_ BitVec 64)) Bool)

(assert (=> bm!53799 (= call!53805 (contains!6723 (ite c!114058 lt!515456 call!53806) k!934))))

(declare-fun b!1151342 () Bool)

(declare-fun e!654848 () Bool)

(declare-fun e!654851 () Bool)

(assert (=> b!1151342 (= e!654848 e!654851)))

(declare-fun res!765662 () Bool)

(assert (=> b!1151342 (=> res!765662 e!654851)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151342 (= res!765662 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43641)

(declare-datatypes ((array!74617 0))(
  ( (array!74618 (arr!35959 (Array (_ BitVec 32) (_ BitVec 64))) (size!36495 (_ BitVec 32))) )
))
(declare-fun lt!515464 () array!74617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!515451 () ListLongMap!16377)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13733 0))(
  ( (ValueCellFull!13733 (v!17136 V!43641)) (EmptyCell!13733) )
))
(declare-datatypes ((array!74619 0))(
  ( (array!74620 (arr!35960 (Array (_ BitVec 32) ValueCell!13733)) (size!36496 (_ BitVec 32))) )
))
(declare-fun lt!515467 () array!74619)

(declare-fun minValue!944 () V!43641)

(declare-fun getCurrentListMapNoExtraKeys!4676 (array!74617 array!74619 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) Int) ListLongMap!16377)

(assert (=> b!1151342 (= lt!515451 (getCurrentListMapNoExtraKeys!4676 lt!515464 lt!515467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515461 () V!43641)

(declare-fun _values!996 () array!74619)

(assert (=> b!1151342 (= lt!515467 (array!74620 (store (arr!35960 _values!996) i!673 (ValueCellFull!13733 lt!515461)) (size!36496 _values!996)))))

(declare-fun dynLambda!2699 (Int (_ BitVec 64)) V!43641)

(assert (=> b!1151342 (= lt!515461 (dynLambda!2699 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515455 () ListLongMap!16377)

(declare-fun _keys!1208 () array!74617)

(assert (=> b!1151342 (= lt!515455 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!53807 () ListLongMap!16377)

(declare-fun bm!53800 () Bool)

(assert (=> bm!53800 (= call!53807 (getCurrentListMapNoExtraKeys!4676 lt!515464 lt!515467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151343 () Bool)

(declare-fun call!53808 () Bool)

(assert (=> b!1151343 call!53808))

(declare-datatypes ((Unit!37874 0))(
  ( (Unit!37875) )
))
(declare-fun lt!515452 () Unit!37874)

(declare-fun call!53809 () Unit!37874)

(assert (=> b!1151343 (= lt!515452 call!53809)))

(declare-fun e!654843 () Unit!37874)

(assert (=> b!1151343 (= e!654843 lt!515452)))

(declare-fun bm!53801 () Bool)

(declare-fun call!53802 () Unit!37874)

(assert (=> bm!53801 (= call!53809 call!53802)))

(declare-fun b!1151345 () Bool)

(declare-fun res!765654 () Bool)

(declare-fun e!654841 () Bool)

(assert (=> b!1151345 (=> (not res!765654) (not e!654841))))

(assert (=> b!1151345 (= res!765654 (and (= (size!36496 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36495 _keys!1208) (size!36496 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151346 () Bool)

(declare-fun e!654850 () Bool)

(assert (=> b!1151346 (= e!654850 (not e!654848))))

(declare-fun res!765657 () Bool)

(assert (=> b!1151346 (=> res!765657 e!654848)))

(assert (=> b!1151346 (= res!765657 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151346 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!515466 () Unit!37874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74617 (_ BitVec 64) (_ BitVec 32)) Unit!37874)

(assert (=> b!1151346 (= lt!515466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1151347 () Bool)

(declare-fun call!53804 () ListLongMap!16377)

(declare-fun e!654840 () Bool)

(declare-fun -!1335 (ListLongMap!16377 (_ BitVec 64)) ListLongMap!16377)

(assert (=> b!1151347 (= e!654840 (= call!53807 (-!1335 call!53804 k!934)))))

(declare-fun b!1151348 () Bool)

(declare-fun e!654849 () Bool)

(declare-fun tp_is_empty!28885 () Bool)

(assert (=> b!1151348 (= e!654849 tp_is_empty!28885)))

(declare-fun e!654842 () Bool)

(declare-fun b!1151349 () Bool)

(assert (=> b!1151349 (= e!654842 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151350 () Bool)

(assert (=> b!1151350 (= e!654841 e!654850)))

(declare-fun res!765655 () Bool)

(assert (=> b!1151350 (=> (not res!765655) (not e!654850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74617 (_ BitVec 32)) Bool)

(assert (=> b!1151350 (= res!765655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515464 mask!1564))))

(assert (=> b!1151350 (= lt!515464 (array!74618 (store (arr!35959 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36495 _keys!1208)))))

(declare-fun b!1151351 () Bool)

(declare-fun c!114053 () Bool)

(declare-fun lt!515448 () Bool)

(assert (=> b!1151351 (= c!114053 (and (not lt!515448) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654839 () Unit!37874)

(declare-fun e!654836 () Unit!37874)

(assert (=> b!1151351 (= e!654839 e!654836)))

(declare-fun b!1151352 () Bool)

(declare-fun res!765666 () Bool)

(assert (=> b!1151352 (=> (not res!765666) (not e!654850))))

(declare-datatypes ((List!25157 0))(
  ( (Nil!25154) (Cons!25153 (h!26362 (_ BitVec 64)) (t!36504 List!25157)) )
))
(declare-fun arrayNoDuplicates!0 (array!74617 (_ BitVec 32) List!25157) Bool)

(assert (=> b!1151352 (= res!765666 (arrayNoDuplicates!0 lt!515464 #b00000000000000000000000000000000 Nil!25154))))

(declare-fun b!1151353 () Bool)

(declare-fun Unit!37876 () Unit!37874)

(assert (=> b!1151353 (= e!654843 Unit!37876)))

(declare-fun b!1151354 () Bool)

(declare-fun e!654838 () Bool)

(assert (=> b!1151354 (= e!654838 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515448) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515458 () ListLongMap!16377)

(declare-fun bm!53802 () Bool)

(declare-fun addStillContains!871 (ListLongMap!16377 (_ BitVec 64) V!43641 (_ BitVec 64)) Unit!37874)

(assert (=> bm!53802 (= call!53802 (addStillContains!871 lt!515458 (ite (or c!114058 c!114053) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114058 c!114053) zeroValue!944 minValue!944) k!934))))

(declare-fun mapIsEmpty!45152 () Bool)

(declare-fun mapRes!45152 () Bool)

(assert (=> mapIsEmpty!45152 mapRes!45152))

(declare-fun b!1151355 () Bool)

(declare-fun res!765656 () Bool)

(assert (=> b!1151355 (=> (not res!765656) (not e!654841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151355 (= res!765656 (validMask!0 mask!1564))))

(declare-fun b!1151356 () Bool)

(declare-fun e!654852 () Unit!37874)

(declare-fun Unit!37877 () Unit!37874)

(assert (=> b!1151356 (= e!654852 Unit!37877)))

(assert (=> b!1151356 (= lt!515448 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1151356 (= c!114058 (and (not lt!515448) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515468 () Unit!37874)

(assert (=> b!1151356 (= lt!515468 e!654839)))

(declare-fun lt!515463 () Unit!37874)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!464 (array!74617 array!74619 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 64) (_ BitVec 32) Int) Unit!37874)

(assert (=> b!1151356 (= lt!515463 (lemmaListMapContainsThenArrayContainsFrom!464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114056 () Bool)

(assert (=> b!1151356 (= c!114056 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765663 () Bool)

(assert (=> b!1151356 (= res!765663 e!654838)))

(assert (=> b!1151356 (=> (not res!765663) (not e!654842))))

(assert (=> b!1151356 e!654842))

(declare-fun lt!515459 () Unit!37874)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74617 (_ BitVec 32) (_ BitVec 32)) Unit!37874)

(assert (=> b!1151356 (= lt!515459 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151356 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25154)))

(declare-fun lt!515460 () Unit!37874)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74617 (_ BitVec 64) (_ BitVec 32) List!25157) Unit!37874)

(assert (=> b!1151356 (= lt!515460 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25154))))

(assert (=> b!1151356 false))

(declare-fun b!1151357 () Bool)

(declare-fun lt!515457 () Unit!37874)

(assert (=> b!1151357 (= e!654836 lt!515457)))

(assert (=> b!1151357 (= lt!515457 call!53809)))

(assert (=> b!1151357 call!53808))

(declare-fun bm!53803 () Bool)

(assert (=> bm!53803 (= call!53808 call!53805)))

(declare-fun b!1151358 () Bool)

(assert (=> b!1151358 (= e!654838 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151359 () Bool)

(declare-fun e!654845 () Bool)

(assert (=> b!1151359 (= e!654851 e!654845)))

(declare-fun res!765668 () Bool)

(assert (=> b!1151359 (=> res!765668 e!654845)))

(assert (=> b!1151359 (= res!765668 (not (= (select (arr!35959 _keys!1208) from!1455) k!934)))))

(assert (=> b!1151359 e!654840))

(declare-fun c!114057 () Bool)

(assert (=> b!1151359 (= c!114057 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515462 () Unit!37874)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!572 (array!74617 array!74619 (_ BitVec 32) (_ BitVec 32) V!43641 V!43641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37874)

(assert (=> b!1151359 (= lt!515462 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151360 () Bool)

(assert (=> b!1151360 (= e!654840 (= call!53807 call!53804))))

(declare-fun res!765665 () Bool)

(assert (=> start!98750 (=> (not res!765665) (not e!654841))))

(assert (=> start!98750 (= res!765665 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36495 _keys!1208))))))

(assert (=> start!98750 e!654841))

(assert (=> start!98750 tp_is_empty!28885))

(declare-fun array_inv!27538 (array!74617) Bool)

(assert (=> start!98750 (array_inv!27538 _keys!1208)))

(assert (=> start!98750 true))

(assert (=> start!98750 tp!85775))

(declare-fun e!654837 () Bool)

(declare-fun array_inv!27539 (array!74619) Bool)

(assert (=> start!98750 (and (array_inv!27539 _values!996) e!654837)))

(declare-fun lt!515454 () ListLongMap!16377)

(declare-fun e!654846 () Bool)

(declare-fun b!1151344 () Bool)

(assert (=> b!1151344 (= e!654846 (= lt!515454 (getCurrentListMapNoExtraKeys!4676 lt!515464 lt!515467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151361 () Bool)

(declare-fun e!654844 () Bool)

(assert (=> b!1151361 (= e!654844 tp_is_empty!28885)))

(declare-fun b!1151362 () Bool)

(declare-fun res!765660 () Bool)

(assert (=> b!1151362 (=> (not res!765660) (not e!654841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151362 (= res!765660 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!45152 () Bool)

(declare-fun tp!85776 () Bool)

(assert (=> mapNonEmpty!45152 (= mapRes!45152 (and tp!85776 e!654849))))

(declare-fun mapKey!45152 () (_ BitVec 32))

(declare-fun mapRest!45152 () (Array (_ BitVec 32) ValueCell!13733))

(declare-fun mapValue!45152 () ValueCell!13733)

(assert (=> mapNonEmpty!45152 (= (arr!35960 _values!996) (store mapRest!45152 mapKey!45152 mapValue!45152))))

(declare-fun b!1151363 () Bool)

(assert (=> b!1151363 (= e!654845 true)))

(assert (=> b!1151363 e!654846))

(declare-fun res!765664 () Bool)

(assert (=> b!1151363 (=> (not res!765664) (not e!654846))))

(assert (=> b!1151363 (= res!765664 (= lt!515454 lt!515458))))

(assert (=> b!1151363 (= lt!515454 (-!1335 lt!515455 k!934))))

(declare-fun lt!515465 () V!43641)

(declare-fun +!3622 (ListLongMap!16377 tuple2!18408) ListLongMap!16377)

(assert (=> b!1151363 (= (-!1335 (+!3622 lt!515458 (tuple2!18409 (select (arr!35959 _keys!1208) from!1455) lt!515465)) (select (arr!35959 _keys!1208) from!1455)) lt!515458)))

(declare-fun lt!515450 () Unit!37874)

(declare-fun addThenRemoveForNewKeyIsSame!178 (ListLongMap!16377 (_ BitVec 64) V!43641) Unit!37874)

(assert (=> b!1151363 (= lt!515450 (addThenRemoveForNewKeyIsSame!178 lt!515458 (select (arr!35959 _keys!1208) from!1455) lt!515465))))

(declare-fun get!18310 (ValueCell!13733 V!43641) V!43641)

(assert (=> b!1151363 (= lt!515465 (get!18310 (select (arr!35960 _values!996) from!1455) lt!515461))))

(declare-fun lt!515453 () Unit!37874)

(assert (=> b!1151363 (= lt!515453 e!654852)))

(declare-fun c!114055 () Bool)

(assert (=> b!1151363 (= c!114055 (contains!6723 lt!515458 k!934))))

(assert (=> b!1151363 (= lt!515458 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151364 () Bool)

(declare-fun call!53803 () ListLongMap!16377)

(assert (=> b!1151364 (contains!6723 call!53803 k!934)))

(declare-fun lt!515449 () Unit!37874)

(assert (=> b!1151364 (= lt!515449 (addStillContains!871 lt!515456 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1151364 call!53805))

(assert (=> b!1151364 (= lt!515456 (+!3622 lt!515458 (tuple2!18409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515469 () Unit!37874)

(assert (=> b!1151364 (= lt!515469 call!53802)))

(assert (=> b!1151364 (= e!654839 lt!515449)))

(declare-fun bm!53804 () Bool)

(assert (=> bm!53804 (= call!53803 (+!3622 (ite c!114058 lt!515456 lt!515458) (ite c!114058 (tuple2!18409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114053 (tuple2!18409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151365 () Bool)

(declare-fun res!765661 () Bool)

(assert (=> b!1151365 (=> (not res!765661) (not e!654841))))

(assert (=> b!1151365 (= res!765661 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25154))))

(declare-fun b!1151366 () Bool)

(declare-fun res!765659 () Bool)

(assert (=> b!1151366 (=> (not res!765659) (not e!654841))))

(assert (=> b!1151366 (= res!765659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151367 () Bool)

(declare-fun res!765667 () Bool)

(assert (=> b!1151367 (=> (not res!765667) (not e!654841))))

(assert (=> b!1151367 (= res!765667 (= (select (arr!35959 _keys!1208) i!673) k!934))))

(declare-fun bm!53805 () Bool)

(assert (=> bm!53805 (= call!53804 (getCurrentListMapNoExtraKeys!4676 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151368 () Bool)

(assert (=> b!1151368 (= e!654837 (and e!654844 mapRes!45152))))

(declare-fun condMapEmpty!45152 () Bool)

(declare-fun mapDefault!45152 () ValueCell!13733)

