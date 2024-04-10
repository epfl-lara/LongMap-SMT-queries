; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98624 () Bool)

(assert start!98624)

(declare-fun b_free!24229 () Bool)

(declare-fun b_next!24229 () Bool)

(assert (=> start!98624 (= b_free!24229 (not b_next!24229))))

(declare-fun tp!85397 () Bool)

(declare-fun b_and!39307 () Bool)

(assert (=> start!98624 (= tp!85397 b_and!39307)))

(declare-datatypes ((V!43473 0))(
  ( (V!43474 (val!14436 Int)) )
))
(declare-fun zeroValue!944 () V!43473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!52287 () Bool)

(declare-datatypes ((array!74369 0))(
  ( (array!74370 (arr!35835 (Array (_ BitVec 32) (_ BitVec 64))) (size!36371 (_ BitVec 32))) )
))
(declare-fun lt!511415 () array!74369)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13670 0))(
  ( (ValueCellFull!13670 (v!17073 V!43473)) (EmptyCell!13670) )
))
(declare-datatypes ((array!74371 0))(
  ( (array!74372 (arr!35836 (Array (_ BitVec 32) ValueCell!13670)) (size!36372 (_ BitVec 32))) )
))
(declare-fun lt!511422 () array!74371)

(declare-fun minValue!944 () V!43473)

(declare-datatypes ((tuple2!18286 0))(
  ( (tuple2!18287 (_1!9154 (_ BitVec 64)) (_2!9154 V!43473)) )
))
(declare-datatypes ((List!25039 0))(
  ( (Nil!25036) (Cons!25035 (h!26244 tuple2!18286) (t!36260 List!25039)) )
))
(declare-datatypes ((ListLongMap!16255 0))(
  ( (ListLongMap!16256 (toList!8143 List!25039)) )
))
(declare-fun call!52290 () ListLongMap!16255)

(declare-fun getCurrentListMapNoExtraKeys!4619 (array!74369 array!74371 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 32) Int) ListLongMap!16255)

(assert (=> bm!52287 (= call!52290 (getCurrentListMapNoExtraKeys!4619 lt!511415 lt!511422 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145546 () Bool)

(declare-fun res!762820 () Bool)

(declare-fun e!651628 () Bool)

(assert (=> b!1145546 (=> (not res!762820) (not e!651628))))

(declare-fun _keys!1208 () array!74369)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1145546 (= res!762820 (= (select (arr!35835 _keys!1208) i!673) k!934))))

(declare-fun b!1145547 () Bool)

(declare-fun e!651632 () Bool)

(declare-fun tp_is_empty!28759 () Bool)

(assert (=> b!1145547 (= e!651632 tp_is_empty!28759)))

(declare-fun b!1145548 () Bool)

(declare-datatypes ((Unit!37610 0))(
  ( (Unit!37611) )
))
(declare-fun e!651627 () Unit!37610)

(declare-fun Unit!37612 () Unit!37610)

(assert (=> b!1145548 (= e!651627 Unit!37612)))

(declare-fun b!1145549 () Bool)

(declare-fun e!651633 () Bool)

(declare-fun e!651626 () Bool)

(assert (=> b!1145549 (= e!651633 (not e!651626))))

(declare-fun res!762827 () Bool)

(assert (=> b!1145549 (=> res!762827 e!651626)))

(assert (=> b!1145549 (= res!762827 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145549 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!511420 () Unit!37610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74369 (_ BitVec 64) (_ BitVec 32)) Unit!37610)

(assert (=> b!1145549 (= lt!511420 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!52288 () Bool)

(declare-fun call!52293 () ListLongMap!16255)

(declare-fun _values!996 () array!74371)

(assert (=> bm!52288 (= call!52293 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145550 () Bool)

(declare-fun res!762829 () Bool)

(assert (=> b!1145550 (=> (not res!762829) (not e!651628))))

(declare-datatypes ((List!25040 0))(
  ( (Nil!25037) (Cons!25036 (h!26245 (_ BitVec 64)) (t!36261 List!25040)) )
))
(declare-fun arrayNoDuplicates!0 (array!74369 (_ BitVec 32) List!25040) Bool)

(assert (=> b!1145550 (= res!762829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25037))))

(declare-fun b!1145551 () Bool)

(declare-fun e!651624 () Bool)

(assert (=> b!1145551 (= e!651624 tp_is_empty!28759)))

(declare-fun b!1145552 () Bool)

(declare-fun e!651630 () Unit!37610)

(declare-fun Unit!37613 () Unit!37610)

(assert (=> b!1145552 (= e!651630 Unit!37613)))

(declare-fun lt!511405 () Bool)

(assert (=> b!1145552 (= lt!511405 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112922 () Bool)

(assert (=> b!1145552 (= c!112922 (and (not lt!511405) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511424 () Unit!37610)

(declare-fun e!651634 () Unit!37610)

(assert (=> b!1145552 (= lt!511424 e!651634)))

(declare-fun lt!511419 () Unit!37610)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!416 (array!74369 array!74371 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 64) (_ BitVec 32) Int) Unit!37610)

(assert (=> b!1145552 (= lt!511419 (lemmaListMapContainsThenArrayContainsFrom!416 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112921 () Bool)

(assert (=> b!1145552 (= c!112921 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762825 () Bool)

(declare-fun e!651636 () Bool)

(assert (=> b!1145552 (= res!762825 e!651636)))

(declare-fun e!651623 () Bool)

(assert (=> b!1145552 (=> (not res!762825) (not e!651623))))

(assert (=> b!1145552 e!651623))

(declare-fun lt!511407 () Unit!37610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74369 (_ BitVec 32) (_ BitVec 32)) Unit!37610)

(assert (=> b!1145552 (= lt!511407 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1145552 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25037)))

(declare-fun lt!511425 () Unit!37610)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74369 (_ BitVec 64) (_ BitVec 32) List!25040) Unit!37610)

(assert (=> b!1145552 (= lt!511425 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25037))))

(assert (=> b!1145552 false))

(declare-fun b!1145553 () Bool)

(declare-fun res!762826 () Bool)

(assert (=> b!1145553 (=> (not res!762826) (not e!651628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145553 (= res!762826 (validMask!0 mask!1564))))

(declare-fun bm!52289 () Bool)

(declare-fun call!52295 () Bool)

(declare-fun call!52296 () Bool)

(assert (=> bm!52289 (= call!52295 call!52296)))

(declare-fun b!1145554 () Bool)

(declare-fun res!762828 () Bool)

(assert (=> b!1145554 (=> (not res!762828) (not e!651628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145554 (= res!762828 (validKeyInArray!0 k!934))))

(declare-fun b!1145555 () Bool)

(declare-fun e!651638 () Bool)

(assert (=> b!1145555 (= e!651638 (= call!52290 call!52293))))

(declare-fun e!651635 () Bool)

(declare-fun lt!511414 () ListLongMap!16255)

(declare-fun b!1145556 () Bool)

(declare-fun lt!511409 () ListLongMap!16255)

(declare-fun -!1283 (ListLongMap!16255 (_ BitVec 64)) ListLongMap!16255)

(assert (=> b!1145556 (= e!651635 (= (-!1283 lt!511414 k!934) lt!511409))))

(declare-fun b!1145557 () Bool)

(declare-fun lt!511408 () ListLongMap!16255)

(declare-fun contains!6671 (ListLongMap!16255 (_ BitVec 64)) Bool)

(declare-fun +!3569 (ListLongMap!16255 tuple2!18286) ListLongMap!16255)

(assert (=> b!1145557 (contains!6671 (+!3569 lt!511408 (tuple2!18287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!511410 () Unit!37610)

(declare-fun addStillContains!823 (ListLongMap!16255 (_ BitVec 64) V!43473 (_ BitVec 64)) Unit!37610)

(assert (=> b!1145557 (= lt!511410 (addStillContains!823 lt!511408 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1145557 call!52296))

(declare-fun call!52292 () ListLongMap!16255)

(assert (=> b!1145557 (= lt!511408 call!52292)))

(declare-fun lt!511423 () Unit!37610)

(declare-fun call!52297 () Unit!37610)

(assert (=> b!1145557 (= lt!511423 call!52297)))

(assert (=> b!1145557 (= e!651634 lt!511410)))

(declare-fun bm!52290 () Bool)

(declare-fun call!52294 () ListLongMap!16255)

(assert (=> bm!52290 (= call!52294 call!52292)))

(declare-fun res!762833 () Bool)

(assert (=> start!98624 (=> (not res!762833) (not e!651628))))

(assert (=> start!98624 (= res!762833 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36371 _keys!1208))))))

(assert (=> start!98624 e!651628))

(assert (=> start!98624 tp_is_empty!28759))

(declare-fun array_inv!27454 (array!74369) Bool)

(assert (=> start!98624 (array_inv!27454 _keys!1208)))

(assert (=> start!98624 true))

(assert (=> start!98624 tp!85397))

(declare-fun e!651639 () Bool)

(declare-fun array_inv!27455 (array!74371) Bool)

(assert (=> start!98624 (and (array_inv!27455 _values!996) e!651639)))

(declare-fun mapNonEmpty!44963 () Bool)

(declare-fun mapRes!44963 () Bool)

(declare-fun tp!85398 () Bool)

(assert (=> mapNonEmpty!44963 (= mapRes!44963 (and tp!85398 e!651632))))

(declare-fun mapKey!44963 () (_ BitVec 32))

(declare-fun mapRest!44963 () (Array (_ BitVec 32) ValueCell!13670))

(declare-fun mapValue!44963 () ValueCell!13670)

(assert (=> mapNonEmpty!44963 (= (arr!35836 _values!996) (store mapRest!44963 mapKey!44963 mapValue!44963))))

(declare-fun b!1145558 () Bool)

(assert (=> b!1145558 (= e!651636 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511405) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52291 () Bool)

(assert (=> bm!52291 (= call!52296 (contains!6671 (ite c!112922 lt!511408 call!52294) k!934))))

(declare-fun b!1145559 () Bool)

(declare-fun res!762822 () Bool)

(assert (=> b!1145559 (=> (not res!762822) (not e!651628))))

(assert (=> b!1145559 (= res!762822 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36371 _keys!1208))))))

(declare-fun b!1145560 () Bool)

(declare-fun res!762821 () Bool)

(assert (=> b!1145560 (=> (not res!762821) (not e!651628))))

(assert (=> b!1145560 (= res!762821 (and (= (size!36372 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36371 _keys!1208) (size!36372 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145561 () Bool)

(declare-fun e!651625 () Bool)

(assert (=> b!1145561 (= e!651625 true)))

(assert (=> b!1145561 e!651635))

(declare-fun res!762819 () Bool)

(assert (=> b!1145561 (=> (not res!762819) (not e!651635))))

(declare-fun lt!511411 () V!43473)

(assert (=> b!1145561 (= res!762819 (= (-!1283 (+!3569 lt!511409 (tuple2!18287 (select (arr!35835 _keys!1208) from!1455) lt!511411)) (select (arr!35835 _keys!1208) from!1455)) lt!511409))))

(declare-fun lt!511418 () Unit!37610)

(declare-fun addThenRemoveForNewKeyIsSame!133 (ListLongMap!16255 (_ BitVec 64) V!43473) Unit!37610)

(assert (=> b!1145561 (= lt!511418 (addThenRemoveForNewKeyIsSame!133 lt!511409 (select (arr!35835 _keys!1208) from!1455) lt!511411))))

(declare-fun lt!511413 () V!43473)

(declare-fun get!18223 (ValueCell!13670 V!43473) V!43473)

(assert (=> b!1145561 (= lt!511411 (get!18223 (select (arr!35836 _values!996) from!1455) lt!511413))))

(declare-fun lt!511416 () Unit!37610)

(assert (=> b!1145561 (= lt!511416 e!651630)))

(declare-fun c!112919 () Bool)

(assert (=> b!1145561 (= c!112919 (contains!6671 lt!511409 k!934))))

(assert (=> b!1145561 (= lt!511409 (getCurrentListMapNoExtraKeys!4619 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145562 () Bool)

(assert (=> b!1145562 (= e!651639 (and e!651624 mapRes!44963))))

(declare-fun condMapEmpty!44963 () Bool)

(declare-fun mapDefault!44963 () ValueCell!13670)

