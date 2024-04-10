; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98618 () Bool)

(assert start!98618)

(declare-fun b_free!24223 () Bool)

(declare-fun b_next!24223 () Bool)

(assert (=> start!98618 (= b_free!24223 (not b_next!24223))))

(declare-fun tp!85379 () Bool)

(declare-fun b_and!39295 () Bool)

(assert (=> start!98618 (= tp!85379 b_and!39295)))

(declare-fun b!1145270 () Bool)

(declare-datatypes ((Unit!37596 0))(
  ( (Unit!37597) )
))
(declare-fun e!651472 () Unit!37596)

(declare-fun Unit!37598 () Unit!37596)

(assert (=> b!1145270 (= e!651472 Unit!37598)))

(declare-fun res!762696 () Bool)

(declare-fun e!651485 () Bool)

(assert (=> start!98618 (=> (not res!762696) (not e!651485))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74357 0))(
  ( (array!74358 (arr!35829 (Array (_ BitVec 32) (_ BitVec 64))) (size!36365 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74357)

(assert (=> start!98618 (= res!762696 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36365 _keys!1208))))))

(assert (=> start!98618 e!651485))

(declare-fun tp_is_empty!28753 () Bool)

(assert (=> start!98618 tp_is_empty!28753))

(declare-fun array_inv!27450 (array!74357) Bool)

(assert (=> start!98618 (array_inv!27450 _keys!1208)))

(assert (=> start!98618 true))

(assert (=> start!98618 tp!85379))

(declare-datatypes ((V!43465 0))(
  ( (V!43466 (val!14433 Int)) )
))
(declare-datatypes ((ValueCell!13667 0))(
  ( (ValueCellFull!13667 (v!17070 V!43465)) (EmptyCell!13667) )
))
(declare-datatypes ((array!74359 0))(
  ( (array!74360 (arr!35830 (Array (_ BitVec 32) ValueCell!13667)) (size!36366 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74359)

(declare-fun e!651484 () Bool)

(declare-fun array_inv!27451 (array!74359) Bool)

(assert (=> start!98618 (and (array_inv!27451 _values!996) e!651484)))

(declare-fun b!1145271 () Bool)

(declare-fun e!651470 () Bool)

(declare-fun e!651477 () Bool)

(assert (=> b!1145271 (= e!651470 e!651477)))

(declare-fun res!762688 () Bool)

(assert (=> b!1145271 (=> res!762688 e!651477)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1145271 (= res!762688 (not (= (select (arr!35829 _keys!1208) from!1455) k!934)))))

(declare-fun e!651473 () Bool)

(assert (=> b!1145271 e!651473))

(declare-fun c!112866 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145271 (= c!112866 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43465)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!511227 () Unit!37596)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!521 (array!74357 array!74359 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37596)

(assert (=> b!1145271 (= lt!511227 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145272 () Bool)

(declare-fun call!52221 () Bool)

(assert (=> b!1145272 call!52221))

(declare-fun lt!511235 () Unit!37596)

(declare-fun call!52218 () Unit!37596)

(assert (=> b!1145272 (= lt!511235 call!52218)))

(declare-fun e!651476 () Unit!37596)

(assert (=> b!1145272 (= e!651476 lt!511235)))

(declare-datatypes ((tuple2!18280 0))(
  ( (tuple2!18281 (_1!9151 (_ BitVec 64)) (_2!9151 V!43465)) )
))
(declare-datatypes ((List!25033 0))(
  ( (Nil!25030) (Cons!25029 (h!26238 tuple2!18280) (t!36248 List!25033)) )
))
(declare-datatypes ((ListLongMap!16249 0))(
  ( (ListLongMap!16250 (toList!8140 List!25033)) )
))
(declare-fun call!52219 () ListLongMap!16249)

(declare-fun lt!511224 () array!74359)

(declare-fun lt!511222 () array!74357)

(declare-fun bm!52215 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4616 (array!74357 array!74359 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 32) Int) ListLongMap!16249)

(assert (=> bm!52215 (= call!52219 (getCurrentListMapNoExtraKeys!4616 lt!511222 lt!511224 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52223 () Bool)

(declare-fun c!112865 () Bool)

(declare-fun bm!52216 () Bool)

(declare-fun lt!511230 () ListLongMap!16249)

(declare-fun call!52222 () ListLongMap!16249)

(declare-fun contains!6668 (ListLongMap!16249 (_ BitVec 64)) Bool)

(assert (=> bm!52216 (= call!52223 (contains!6668 (ite c!112865 lt!511230 call!52222) k!934))))

(declare-fun b!1145273 () Bool)

(declare-fun e!651483 () Bool)

(assert (=> b!1145273 (= e!651485 e!651483)))

(declare-fun res!762693 () Bool)

(assert (=> b!1145273 (=> (not res!762693) (not e!651483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74357 (_ BitVec 32)) Bool)

(assert (=> b!1145273 (= res!762693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511222 mask!1564))))

(assert (=> b!1145273 (= lt!511222 (array!74358 (store (arr!35829 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36365 _keys!1208)))))

(declare-fun b!1145274 () Bool)

(declare-fun e!651474 () Bool)

(assert (=> b!1145274 (= e!651474 tp_is_empty!28753)))

(declare-fun b!1145275 () Bool)

(assert (=> b!1145275 (= e!651477 true)))

(declare-fun e!651482 () Bool)

(assert (=> b!1145275 e!651482))

(declare-fun res!762684 () Bool)

(assert (=> b!1145275 (=> (not res!762684) (not e!651482))))

(declare-fun lt!511216 () ListLongMap!16249)

(declare-fun lt!511228 () V!43465)

(declare-fun -!1281 (ListLongMap!16249 (_ BitVec 64)) ListLongMap!16249)

(declare-fun +!3566 (ListLongMap!16249 tuple2!18280) ListLongMap!16249)

(assert (=> b!1145275 (= res!762684 (= (-!1281 (+!3566 lt!511216 (tuple2!18281 (select (arr!35829 _keys!1208) from!1455) lt!511228)) (select (arr!35829 _keys!1208) from!1455)) lt!511216))))

(declare-fun lt!511226 () Unit!37596)

(declare-fun addThenRemoveForNewKeyIsSame!131 (ListLongMap!16249 (_ BitVec 64) V!43465) Unit!37596)

(assert (=> b!1145275 (= lt!511226 (addThenRemoveForNewKeyIsSame!131 lt!511216 (select (arr!35829 _keys!1208) from!1455) lt!511228))))

(declare-fun lt!511236 () V!43465)

(declare-fun get!18219 (ValueCell!13667 V!43465) V!43465)

(assert (=> b!1145275 (= lt!511228 (get!18219 (select (arr!35830 _values!996) from!1455) lt!511236))))

(declare-fun lt!511234 () Unit!37596)

(assert (=> b!1145275 (= lt!511234 e!651472)))

(declare-fun c!112867 () Bool)

(assert (=> b!1145275 (= c!112867 (contains!6668 lt!511216 k!934))))

(assert (=> b!1145275 (= lt!511216 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145276 () Bool)

(declare-fun Unit!37599 () Unit!37596)

(assert (=> b!1145276 (= e!651472 Unit!37599)))

(declare-fun lt!511231 () Bool)

(assert (=> b!1145276 (= lt!511231 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1145276 (= c!112865 (and (not lt!511231) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511217 () Unit!37596)

(declare-fun e!651471 () Unit!37596)

(assert (=> b!1145276 (= lt!511217 e!651471)))

(declare-fun lt!511223 () Unit!37596)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!414 (array!74357 array!74359 (_ BitVec 32) (_ BitVec 32) V!43465 V!43465 (_ BitVec 64) (_ BitVec 32) Int) Unit!37596)

(assert (=> b!1145276 (= lt!511223 (lemmaListMapContainsThenArrayContainsFrom!414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112868 () Bool)

(assert (=> b!1145276 (= c!112868 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762690 () Bool)

(declare-fun e!651486 () Bool)

(assert (=> b!1145276 (= res!762690 e!651486)))

(declare-fun e!651481 () Bool)

(assert (=> b!1145276 (=> (not res!762690) (not e!651481))))

(assert (=> b!1145276 e!651481))

(declare-fun lt!511219 () Unit!37596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74357 (_ BitVec 32) (_ BitVec 32)) Unit!37596)

(assert (=> b!1145276 (= lt!511219 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25034 0))(
  ( (Nil!25031) (Cons!25030 (h!26239 (_ BitVec 64)) (t!36249 List!25034)) )
))
(declare-fun arrayNoDuplicates!0 (array!74357 (_ BitVec 32) List!25034) Bool)

(assert (=> b!1145276 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25031)))

(declare-fun lt!511220 () Unit!37596)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74357 (_ BitVec 64) (_ BitVec 32) List!25034) Unit!37596)

(assert (=> b!1145276 (= lt!511220 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25031))))

(assert (=> b!1145276 false))

(declare-fun b!1145277 () Bool)

(declare-fun call!52220 () ListLongMap!16249)

(assert (=> b!1145277 (= e!651473 (= call!52219 call!52220))))

(declare-fun b!1145278 () Bool)

(declare-fun e!651475 () Bool)

(assert (=> b!1145278 (= e!651475 tp_is_empty!28753)))

(declare-fun b!1145279 () Bool)

(declare-fun res!762697 () Bool)

(assert (=> b!1145279 (=> (not res!762697) (not e!651485))))

(assert (=> b!1145279 (= res!762697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145280 () Bool)

(declare-fun res!762691 () Bool)

(assert (=> b!1145280 (=> (not res!762691) (not e!651483))))

(assert (=> b!1145280 (= res!762691 (arrayNoDuplicates!0 lt!511222 #b00000000000000000000000000000000 Nil!25031))))

(declare-fun b!1145281 () Bool)

(declare-fun e!651479 () Unit!37596)

(declare-fun lt!511229 () Unit!37596)

(assert (=> b!1145281 (= e!651479 lt!511229)))

(assert (=> b!1145281 (= lt!511229 call!52218)))

(assert (=> b!1145281 call!52221))

(declare-fun b!1145282 () Bool)

(declare-fun res!762698 () Bool)

(assert (=> b!1145282 (=> (not res!762698) (not e!651485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145282 (= res!762698 (validKeyInArray!0 k!934))))

(declare-fun b!1145283 () Bool)

(assert (=> b!1145283 (= e!651479 e!651476)))

(declare-fun c!112869 () Bool)

(assert (=> b!1145283 (= c!112869 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511231))))

(declare-fun b!1145284 () Bool)

(declare-fun res!762692 () Bool)

(assert (=> b!1145284 (=> (not res!762692) (not e!651485))))

(assert (=> b!1145284 (= res!762692 (and (= (size!36366 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36365 _keys!1208) (size!36366 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145285 () Bool)

(declare-fun arrayContainsKey!0 (array!74357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145285 (= e!651481 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52217 () Bool)

(assert (=> bm!52217 (= call!52221 call!52223)))

(declare-fun call!52225 () ListLongMap!16249)

(declare-fun bm!52218 () Bool)

(declare-fun c!112870 () Bool)

(assert (=> bm!52218 (= call!52225 (+!3566 (ite c!112865 lt!511230 lt!511216) (ite c!112865 (tuple2!18281 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112870 (tuple2!18281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18281 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1145286 () Bool)

(declare-fun e!651480 () Bool)

(assert (=> b!1145286 (= e!651480 e!651470)))

(declare-fun res!762694 () Bool)

(assert (=> b!1145286 (=> res!762694 e!651470)))

(assert (=> b!1145286 (= res!762694 (not (= from!1455 i!673)))))

(declare-fun lt!511218 () ListLongMap!16249)

(assert (=> b!1145286 (= lt!511218 (getCurrentListMapNoExtraKeys!4616 lt!511222 lt!511224 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145286 (= lt!511224 (array!74360 (store (arr!35830 _values!996) i!673 (ValueCellFull!13667 lt!511236)) (size!36366 _values!996)))))

(declare-fun dynLambda!2652 (Int (_ BitVec 64)) V!43465)

(assert (=> b!1145286 (= lt!511236 (dynLambda!2652 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511221 () ListLongMap!16249)

(assert (=> b!1145286 (= lt!511221 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145287 () Bool)

(assert (=> b!1145287 (contains!6668 call!52225 k!934)))

(declare-fun lt!511232 () Unit!37596)

(declare-fun call!52224 () Unit!37596)

(assert (=> b!1145287 (= lt!511232 call!52224)))

(assert (=> b!1145287 call!52223))

(assert (=> b!1145287 (= lt!511230 (+!3566 lt!511216 (tuple2!18281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511225 () Unit!37596)

(declare-fun addStillContains!820 (ListLongMap!16249 (_ BitVec 64) V!43465 (_ BitVec 64)) Unit!37596)

(assert (=> b!1145287 (= lt!511225 (addStillContains!820 lt!511216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1145287 (= e!651471 lt!511232)))

(declare-fun b!1145288 () Bool)

(declare-fun res!762687 () Bool)

(assert (=> b!1145288 (=> (not res!762687) (not e!651485))))

(assert (=> b!1145288 (= res!762687 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25031))))

(declare-fun b!1145289 () Bool)

(assert (=> b!1145289 (= e!651482 (= (-!1281 lt!511221 k!934) lt!511216))))

(declare-fun b!1145290 () Bool)

(assert (=> b!1145290 (= e!651486 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511231) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52219 () Bool)

(assert (=> bm!52219 (= call!52222 call!52225)))

(declare-fun bm!52220 () Bool)

(assert (=> bm!52220 (= call!52220 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145291 () Bool)

(declare-fun Unit!37600 () Unit!37596)

(assert (=> b!1145291 (= e!651476 Unit!37600)))

(declare-fun mapIsEmpty!44954 () Bool)

(declare-fun mapRes!44954 () Bool)

(assert (=> mapIsEmpty!44954 mapRes!44954))

(declare-fun b!1145292 () Bool)

(declare-fun res!762685 () Bool)

(assert (=> b!1145292 (=> (not res!762685) (not e!651485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145292 (= res!762685 (validMask!0 mask!1564))))

(declare-fun bm!52221 () Bool)

(assert (=> bm!52221 (= call!52224 (addStillContains!820 (ite c!112865 lt!511230 lt!511216) (ite c!112865 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112870 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112865 minValue!944 (ite c!112870 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1145293 () Bool)

(assert (=> b!1145293 (= c!112870 (and (not lt!511231) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145293 (= e!651471 e!651479)))

(declare-fun b!1145294 () Bool)

(assert (=> b!1145294 (= e!651486 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145295 () Bool)

(assert (=> b!1145295 (= e!651484 (and e!651474 mapRes!44954))))

(declare-fun condMapEmpty!44954 () Bool)

(declare-fun mapDefault!44954 () ValueCell!13667)

