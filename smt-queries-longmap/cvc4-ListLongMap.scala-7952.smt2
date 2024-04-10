; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98556 () Bool)

(assert start!98556)

(declare-fun b_free!24161 () Bool)

(declare-fun b_next!24161 () Bool)

(assert (=> start!98556 (= b_free!24161 (not b_next!24161))))

(declare-fun tp!85193 () Bool)

(declare-fun b_and!39171 () Bool)

(assert (=> start!98556 (= tp!85193 b_and!39171)))

(declare-datatypes ((array!74235 0))(
  ( (array!74236 (arr!35768 (Array (_ BitVec 32) (_ BitVec 64))) (size!36304 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74235)

(declare-fun e!649957 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1142473 () Bool)

(declare-fun arrayContainsKey!0 (array!74235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142473 (= e!649957 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43381 0))(
  ( (V!43382 (val!14402 Int)) )
))
(declare-datatypes ((tuple2!18224 0))(
  ( (tuple2!18225 (_1!9123 (_ BitVec 64)) (_2!9123 V!43381)) )
))
(declare-datatypes ((List!24978 0))(
  ( (Nil!24975) (Cons!24974 (h!26183 tuple2!18224) (t!36131 List!24978)) )
))
(declare-datatypes ((ListLongMap!16193 0))(
  ( (ListLongMap!16194 (toList!8112 List!24978)) )
))
(declare-fun call!51479 () ListLongMap!16193)

(declare-fun e!649954 () Bool)

(declare-fun b!1142474 () Bool)

(declare-fun call!51474 () ListLongMap!16193)

(declare-fun -!1260 (ListLongMap!16193 (_ BitVec 64)) ListLongMap!16193)

(assert (=> b!1142474 (= e!649954 (= call!51474 (-!1260 call!51479 k!934)))))

(declare-fun b!1142475 () Bool)

(declare-datatypes ((Unit!37477 0))(
  ( (Unit!37478) )
))
(declare-fun e!649950 () Unit!37477)

(declare-fun Unit!37479 () Unit!37477)

(assert (=> b!1142475 (= e!649950 Unit!37479)))

(declare-fun lt!509273 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142475 (= lt!509273 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112309 () Bool)

(assert (=> b!1142475 (= c!112309 (and (not lt!509273) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509282 () Unit!37477)

(declare-fun e!649959 () Unit!37477)

(assert (=> b!1142475 (= lt!509282 e!649959)))

(declare-fun zeroValue!944 () V!43381)

(declare-fun lt!509283 () Unit!37477)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13636 0))(
  ( (ValueCellFull!13636 (v!17039 V!43381)) (EmptyCell!13636) )
))
(declare-datatypes ((array!74237 0))(
  ( (array!74238 (arr!35769 (Array (_ BitVec 32) ValueCell!13636)) (size!36305 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74237)

(declare-fun minValue!944 () V!43381)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!394 (array!74235 array!74237 (_ BitVec 32) (_ BitVec 32) V!43381 V!43381 (_ BitVec 64) (_ BitVec 32) Int) Unit!37477)

(assert (=> b!1142475 (= lt!509283 (lemmaListMapContainsThenArrayContainsFrom!394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112312 () Bool)

(assert (=> b!1142475 (= c!112312 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761355 () Bool)

(assert (=> b!1142475 (= res!761355 e!649957)))

(declare-fun e!649956 () Bool)

(assert (=> b!1142475 (=> (not res!761355) (not e!649956))))

(assert (=> b!1142475 e!649956))

(declare-fun lt!509280 () Unit!37477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74235 (_ BitVec 32) (_ BitVec 32)) Unit!37477)

(assert (=> b!1142475 (= lt!509280 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24979 0))(
  ( (Nil!24976) (Cons!24975 (h!26184 (_ BitVec 64)) (t!36132 List!24979)) )
))
(declare-fun arrayNoDuplicates!0 (array!74235 (_ BitVec 32) List!24979) Bool)

(assert (=> b!1142475 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24976)))

(declare-fun lt!509277 () Unit!37477)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74235 (_ BitVec 64) (_ BitVec 32) List!24979) Unit!37477)

(assert (=> b!1142475 (= lt!509277 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24976))))

(assert (=> b!1142475 false))

(declare-fun b!1142476 () Bool)

(declare-fun call!51475 () Bool)

(assert (=> b!1142476 call!51475))

(declare-fun lt!509278 () Unit!37477)

(declare-fun call!51481 () Unit!37477)

(assert (=> b!1142476 (= lt!509278 call!51481)))

(declare-fun e!649949 () Unit!37477)

(assert (=> b!1142476 (= e!649949 lt!509278)))

(declare-fun b!1142478 () Bool)

(declare-fun c!112310 () Bool)

(assert (=> b!1142478 (= c!112310 (and (not lt!509273) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649951 () Unit!37477)

(assert (=> b!1142478 (= e!649959 e!649951)))

(declare-fun bm!51471 () Bool)

(declare-fun call!51478 () Bool)

(assert (=> bm!51471 (= call!51475 call!51478)))

(declare-fun b!1142479 () Bool)

(declare-fun lt!509269 () Unit!37477)

(assert (=> b!1142479 (= e!649951 lt!509269)))

(assert (=> b!1142479 (= lt!509269 call!51481)))

(assert (=> b!1142479 call!51475))

(declare-fun b!1142480 () Bool)

(declare-fun e!649953 () Bool)

(declare-fun tp_is_empty!28691 () Bool)

(assert (=> b!1142480 (= e!649953 tp_is_empty!28691)))

(declare-fun b!1142481 () Bool)

(assert (=> b!1142481 (= e!649956 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!509267 () array!74235)

(declare-fun bm!51472 () Bool)

(declare-fun lt!509268 () array!74237)

(declare-fun getCurrentListMapNoExtraKeys!4592 (array!74235 array!74237 (_ BitVec 32) (_ BitVec 32) V!43381 V!43381 (_ BitVec 32) Int) ListLongMap!16193)

(assert (=> bm!51472 (= call!51474 (getCurrentListMapNoExtraKeys!4592 lt!509267 lt!509268 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142482 () Bool)

(declare-fun res!761351 () Bool)

(declare-fun e!649955 () Bool)

(assert (=> b!1142482 (=> (not res!761351) (not e!649955))))

(assert (=> b!1142482 (= res!761351 (arrayNoDuplicates!0 lt!509267 #b00000000000000000000000000000000 Nil!24976))))

(declare-fun b!1142483 () Bool)

(assert (=> b!1142483 (= e!649951 e!649949)))

(declare-fun c!112308 () Bool)

(assert (=> b!1142483 (= c!112308 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509273))))

(declare-fun b!1142484 () Bool)

(declare-fun call!51477 () ListLongMap!16193)

(declare-fun contains!6645 (ListLongMap!16193 (_ BitVec 64)) Bool)

(assert (=> b!1142484 (contains!6645 call!51477 k!934)))

(declare-fun lt!509272 () Unit!37477)

(declare-fun lt!509265 () ListLongMap!16193)

(declare-fun addStillContains!798 (ListLongMap!16193 (_ BitVec 64) V!43381 (_ BitVec 64)) Unit!37477)

(assert (=> b!1142484 (= lt!509272 (addStillContains!798 lt!509265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1142484 call!51478))

(declare-fun lt!509279 () ListLongMap!16193)

(declare-fun +!3542 (ListLongMap!16193 tuple2!18224) ListLongMap!16193)

(assert (=> b!1142484 (= lt!509265 (+!3542 lt!509279 (tuple2!18225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509271 () Unit!37477)

(declare-fun call!51476 () Unit!37477)

(assert (=> b!1142484 (= lt!509271 call!51476)))

(assert (=> b!1142484 (= e!649959 lt!509272)))

(declare-fun b!1142485 () Bool)

(declare-fun res!761350 () Bool)

(declare-fun e!649958 () Bool)

(assert (=> b!1142485 (=> (not res!761350) (not e!649958))))

(assert (=> b!1142485 (= res!761350 (and (= (size!36305 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36304 _keys!1208) (size!36305 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1142486 () Bool)

(assert (=> b!1142486 (= e!649954 (= call!51474 call!51479))))

(declare-fun b!1142487 () Bool)

(declare-fun Unit!37480 () Unit!37477)

(assert (=> b!1142487 (= e!649950 Unit!37480)))

(declare-fun b!1142488 () Bool)

(declare-fun res!761348 () Bool)

(assert (=> b!1142488 (=> (not res!761348) (not e!649958))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142488 (= res!761348 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36304 _keys!1208))))))

(declare-fun b!1142489 () Bool)

(declare-fun e!649947 () Bool)

(declare-fun mapRes!44861 () Bool)

(assert (=> b!1142489 (= e!649947 (and e!649953 mapRes!44861))))

(declare-fun condMapEmpty!44861 () Bool)

(declare-fun mapDefault!44861 () ValueCell!13636)

