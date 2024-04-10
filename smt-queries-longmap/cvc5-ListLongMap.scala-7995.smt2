; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98810 () Bool)

(assert start!98810)

(declare-fun b_free!24415 () Bool)

(declare-fun b_next!24415 () Bool)

(assert (=> start!98810 (= b_free!24415 (not b_next!24415))))

(declare-fun tp!85955 () Bool)

(declare-fun b_and!39679 () Bool)

(assert (=> start!98810 (= tp!85955 b_and!39679)))

(declare-fun bm!54519 () Bool)

(declare-datatypes ((V!43721 0))(
  ( (V!43722 (val!14529 Int)) )
))
(declare-datatypes ((tuple2!18466 0))(
  ( (tuple2!18467 (_1!9244 (_ BitVec 64)) (_2!9244 V!43721)) )
))
(declare-datatypes ((List!25210 0))(
  ( (Nil!25207) (Cons!25206 (h!26415 tuple2!18466) (t!36617 List!25210)) )
))
(declare-datatypes ((ListLongMap!16435 0))(
  ( (ListLongMap!16436 (toList!8233 List!25210)) )
))
(declare-fun call!54523 () ListLongMap!16435)

(declare-fun call!54525 () ListLongMap!16435)

(assert (=> bm!54519 (= call!54523 call!54525)))

(declare-fun zeroValue!944 () V!43721)

(declare-fun c!114593 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37987 0))(
  ( (Unit!37988) )
))
(declare-fun call!54526 () Unit!37987)

(declare-fun bm!54520 () Bool)

(declare-fun c!114596 () Bool)

(declare-fun minValue!944 () V!43721)

(declare-fun lt!517435 () ListLongMap!16435)

(declare-fun lt!517440 () ListLongMap!16435)

(declare-fun addStillContains!892 (ListLongMap!16435 (_ BitVec 64) V!43721 (_ BitVec 64)) Unit!37987)

(assert (=> bm!54520 (= call!54526 (addStillContains!892 (ite c!114593 lt!517440 lt!517435) (ite c!114593 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114596 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114593 minValue!944 (ite c!114596 zeroValue!944 minValue!944)) k!934))))

(declare-fun mapIsEmpty!45242 () Bool)

(declare-fun mapRes!45242 () Bool)

(assert (=> mapIsEmpty!45242 mapRes!45242))

(declare-fun b!1154102 () Bool)

(declare-fun res!767011 () Bool)

(declare-fun e!656373 () Bool)

(assert (=> b!1154102 (=> (not res!767011) (not e!656373))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74737 0))(
  ( (array!74738 (arr!36019 (Array (_ BitVec 32) (_ BitVec 64))) (size!36555 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74737)

(assert (=> b!1154102 (= res!767011 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36555 _keys!1208))))))

(declare-fun b!1154103 () Bool)

(declare-fun e!656369 () Bool)

(declare-fun tp_is_empty!28945 () Bool)

(assert (=> b!1154103 (= e!656369 tp_is_empty!28945)))

(declare-fun b!1154104 () Bool)

(declare-fun e!656371 () Bool)

(assert (=> b!1154104 (= e!656371 true)))

(declare-fun e!656377 () Bool)

(assert (=> b!1154104 e!656377))

(declare-fun res!767010 () Bool)

(assert (=> b!1154104 (=> (not res!767010) (not e!656377))))

(declare-fun lt!517428 () ListLongMap!16435)

(assert (=> b!1154104 (= res!767010 (= lt!517428 lt!517435))))

(declare-fun lt!517441 () ListLongMap!16435)

(declare-fun -!1355 (ListLongMap!16435 (_ BitVec 64)) ListLongMap!16435)

(assert (=> b!1154104 (= lt!517428 (-!1355 lt!517441 k!934))))

(declare-fun lt!517436 () V!43721)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3646 (ListLongMap!16435 tuple2!18466) ListLongMap!16435)

(assert (=> b!1154104 (= (-!1355 (+!3646 lt!517435 (tuple2!18467 (select (arr!36019 _keys!1208) from!1455) lt!517436)) (select (arr!36019 _keys!1208) from!1455)) lt!517435)))

(declare-fun lt!517433 () Unit!37987)

(declare-fun addThenRemoveForNewKeyIsSame!195 (ListLongMap!16435 (_ BitVec 64) V!43721) Unit!37987)

(assert (=> b!1154104 (= lt!517433 (addThenRemoveForNewKeyIsSame!195 lt!517435 (select (arr!36019 _keys!1208) from!1455) lt!517436))))

(declare-fun lt!517434 () V!43721)

(declare-datatypes ((ValueCell!13763 0))(
  ( (ValueCellFull!13763 (v!17166 V!43721)) (EmptyCell!13763) )
))
(declare-datatypes ((array!74739 0))(
  ( (array!74740 (arr!36020 (Array (_ BitVec 32) ValueCell!13763)) (size!36556 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74739)

(declare-fun get!18347 (ValueCell!13763 V!43721) V!43721)

(assert (=> b!1154104 (= lt!517436 (get!18347 (select (arr!36020 _values!996) from!1455) lt!517434))))

(declare-fun lt!517445 () Unit!37987)

(declare-fun e!656375 () Unit!37987)

(assert (=> b!1154104 (= lt!517445 e!656375)))

(declare-fun c!114594 () Bool)

(declare-fun contains!6747 (ListLongMap!16435 (_ BitVec 64)) Bool)

(assert (=> b!1154104 (= c!114594 (contains!6747 lt!517435 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4702 (array!74737 array!74739 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) Int) ListLongMap!16435)

(assert (=> b!1154104 (= lt!517435 (getCurrentListMapNoExtraKeys!4702 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154105 () Bool)

(declare-fun call!54524 () Bool)

(assert (=> b!1154105 call!54524))

(declare-fun lt!517430 () Unit!37987)

(declare-fun call!54527 () Unit!37987)

(assert (=> b!1154105 (= lt!517430 call!54527)))

(declare-fun e!656372 () Unit!37987)

(assert (=> b!1154105 (= e!656372 lt!517430)))

(declare-fun b!1154106 () Bool)

(declare-fun e!656382 () Bool)

(assert (=> b!1154106 (= e!656382 e!656371)))

(declare-fun res!767008 () Bool)

(assert (=> b!1154106 (=> res!767008 e!656371)))

(assert (=> b!1154106 (= res!767008 (not (= (select (arr!36019 _keys!1208) from!1455) k!934)))))

(declare-fun e!656378 () Bool)

(assert (=> b!1154106 e!656378))

(declare-fun c!114595 () Bool)

(assert (=> b!1154106 (= c!114595 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517447 () Unit!37987)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!590 (array!74737 array!74739 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37987)

(assert (=> b!1154106 (= lt!517447 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154107 () Bool)

(declare-fun lt!517437 () Bool)

(assert (=> b!1154107 (= c!114596 (and (not lt!517437) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!656368 () Unit!37987)

(declare-fun e!656376 () Unit!37987)

(assert (=> b!1154107 (= e!656368 e!656376)))

(declare-fun b!1154108 () Bool)

(assert (=> b!1154108 (contains!6747 call!54525 k!934)))

(declare-fun lt!517449 () Unit!37987)

(assert (=> b!1154108 (= lt!517449 call!54526)))

(declare-fun call!54528 () Bool)

(assert (=> b!1154108 call!54528))

(assert (=> b!1154108 (= lt!517440 (+!3646 lt!517435 (tuple2!18467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517429 () Unit!37987)

(assert (=> b!1154108 (= lt!517429 (addStillContains!892 lt!517435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1154108 (= e!656368 lt!517449)))

(declare-fun b!1154109 () Bool)

(declare-fun e!656366 () Bool)

(assert (=> b!1154109 (= e!656366 tp_is_empty!28945)))

(declare-fun b!1154110 () Bool)

(declare-fun call!54529 () ListLongMap!16435)

(declare-fun call!54522 () ListLongMap!16435)

(assert (=> b!1154110 (= e!656378 (= call!54529 call!54522))))

(declare-fun lt!517439 () array!74739)

(declare-fun lt!517438 () array!74737)

(declare-fun b!1154111 () Bool)

(assert (=> b!1154111 (= e!656377 (= lt!517428 (getCurrentListMapNoExtraKeys!4702 lt!517438 lt!517439 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154112 () Bool)

(declare-fun res!767017 () Bool)

(assert (=> b!1154112 (=> (not res!767017) (not e!656373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74737 (_ BitVec 32)) Bool)

(assert (=> b!1154112 (= res!767017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!656381 () Bool)

(declare-fun b!1154113 () Bool)

(assert (=> b!1154113 (= e!656381 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154114 () Bool)

(declare-fun res!767015 () Bool)

(assert (=> b!1154114 (=> (not res!767015) (not e!656373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154114 (= res!767015 (validKeyInArray!0 k!934))))

(declare-fun b!1154115 () Bool)

(assert (=> b!1154115 (= e!656378 (= call!54529 (-!1355 call!54522 k!934)))))

(declare-fun b!1154116 () Bool)

(declare-fun e!656367 () Bool)

(assert (=> b!1154116 (= e!656367 e!656382)))

(declare-fun res!767016 () Bool)

(assert (=> b!1154116 (=> res!767016 e!656382)))

(assert (=> b!1154116 (= res!767016 (not (= from!1455 i!673)))))

(declare-fun lt!517446 () ListLongMap!16435)

(assert (=> b!1154116 (= lt!517446 (getCurrentListMapNoExtraKeys!4702 lt!517438 lt!517439 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1154116 (= lt!517439 (array!74740 (store (arr!36020 _values!996) i!673 (ValueCellFull!13763 lt!517434)) (size!36556 _values!996)))))

(declare-fun dynLambda!2715 (Int (_ BitVec 64)) V!43721)

(assert (=> b!1154116 (= lt!517434 (dynLambda!2715 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1154116 (= lt!517441 (getCurrentListMapNoExtraKeys!4702 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154117 () Bool)

(declare-fun arrayContainsKey!0 (array!74737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154117 (= e!656381 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54521 () Bool)

(assert (=> bm!54521 (= call!54529 (getCurrentListMapNoExtraKeys!4702 lt!517438 lt!517439 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154118 () Bool)

(declare-fun res!767013 () Bool)

(assert (=> b!1154118 (=> (not res!767013) (not e!656373))))

(declare-datatypes ((List!25211 0))(
  ( (Nil!25208) (Cons!25207 (h!26416 (_ BitVec 64)) (t!36618 List!25211)) )
))
(declare-fun arrayNoDuplicates!0 (array!74737 (_ BitVec 32) List!25211) Bool)

(assert (=> b!1154118 (= res!767013 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25208))))

(declare-fun bm!54522 () Bool)

(assert (=> bm!54522 (= call!54528 (contains!6747 (ite c!114593 lt!517440 call!54523) k!934))))

(declare-fun b!1154119 () Bool)

(declare-fun Unit!37989 () Unit!37987)

(assert (=> b!1154119 (= e!656375 Unit!37989)))

(assert (=> b!1154119 (= lt!517437 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154119 (= c!114593 (and (not lt!517437) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517443 () Unit!37987)

(assert (=> b!1154119 (= lt!517443 e!656368)))

(declare-fun lt!517432 () Unit!37987)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!483 (array!74737 array!74739 (_ BitVec 32) (_ BitVec 32) V!43721 V!43721 (_ BitVec 64) (_ BitVec 32) Int) Unit!37987)

(assert (=> b!1154119 (= lt!517432 (lemmaListMapContainsThenArrayContainsFrom!483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114597 () Bool)

(assert (=> b!1154119 (= c!114597 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767014 () Bool)

(assert (=> b!1154119 (= res!767014 e!656381)))

(declare-fun e!656370 () Bool)

(assert (=> b!1154119 (=> (not res!767014) (not e!656370))))

(assert (=> b!1154119 e!656370))

(declare-fun lt!517442 () Unit!37987)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74737 (_ BitVec 32) (_ BitVec 32)) Unit!37987)

(assert (=> b!1154119 (= lt!517442 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154119 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25208)))

(declare-fun lt!517444 () Unit!37987)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74737 (_ BitVec 64) (_ BitVec 32) List!25211) Unit!37987)

(assert (=> b!1154119 (= lt!517444 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25208))))

(assert (=> b!1154119 false))

(declare-fun b!1154120 () Bool)

(declare-fun e!656379 () Bool)

(assert (=> b!1154120 (= e!656373 e!656379)))

(declare-fun res!767018 () Bool)

(assert (=> b!1154120 (=> (not res!767018) (not e!656379))))

(assert (=> b!1154120 (= res!767018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517438 mask!1564))))

(assert (=> b!1154120 (= lt!517438 (array!74738 (store (arr!36019 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36555 _keys!1208)))))

(declare-fun bm!54523 () Bool)

(assert (=> bm!54523 (= call!54527 call!54526)))

(declare-fun b!1154121 () Bool)

(declare-fun lt!517431 () Unit!37987)

(assert (=> b!1154121 (= e!656376 lt!517431)))

(assert (=> b!1154121 (= lt!517431 call!54527)))

(assert (=> b!1154121 call!54524))

(declare-fun b!1154122 () Bool)

(declare-fun e!656380 () Bool)

(assert (=> b!1154122 (= e!656380 (and e!656369 mapRes!45242))))

(declare-fun condMapEmpty!45242 () Bool)

(declare-fun mapDefault!45242 () ValueCell!13763)

