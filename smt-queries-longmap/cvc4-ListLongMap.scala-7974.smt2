; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98688 () Bool)

(assert start!98688)

(declare-fun b_free!24293 () Bool)

(declare-fun b_next!24293 () Bool)

(assert (=> start!98688 (= b_free!24293 (not b_next!24293))))

(declare-fun tp!85589 () Bool)

(declare-fun b_and!39435 () Bool)

(assert (=> start!98688 (= tp!85589 b_and!39435)))

(declare-fun b!1148490 () Bool)

(declare-datatypes ((Unit!37741 0))(
  ( (Unit!37742) )
))
(declare-fun e!653267 () Unit!37741)

(declare-fun lt!513437 () Unit!37741)

(assert (=> b!1148490 (= e!653267 lt!513437)))

(declare-fun call!53061 () Unit!37741)

(assert (=> b!1148490 (= lt!513437 call!53061)))

(declare-fun call!53062 () Bool)

(assert (=> b!1148490 call!53062))

(declare-fun b!1148491 () Bool)

(declare-fun res!764259 () Bool)

(declare-fun e!653257 () Bool)

(assert (=> b!1148491 (=> (not res!764259) (not e!653257))))

(declare-datatypes ((array!74493 0))(
  ( (array!74494 (arr!35897 (Array (_ BitVec 32) (_ BitVec 64))) (size!36433 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74493)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43557 0))(
  ( (V!43558 (val!14468 Int)) )
))
(declare-datatypes ((ValueCell!13702 0))(
  ( (ValueCellFull!13702 (v!17105 V!43557)) (EmptyCell!13702) )
))
(declare-datatypes ((array!74495 0))(
  ( (array!74496 (arr!35898 (Array (_ BitVec 32) ValueCell!13702)) (size!36434 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74495)

(assert (=> b!1148491 (= res!764259 (and (= (size!36434 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36433 _keys!1208) (size!36434 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148492 () Bool)

(declare-fun e!653271 () Unit!37741)

(assert (=> b!1148492 (= e!653267 e!653271)))

(declare-fun c!113499 () Bool)

(declare-fun lt!513427 () Bool)

(assert (=> b!1148492 (= c!113499 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513427))))

(declare-fun b!1148493 () Bool)

(declare-fun e!653270 () Bool)

(declare-fun e!653261 () Bool)

(assert (=> b!1148493 (= e!653270 e!653261)))

(declare-fun res!764272 () Bool)

(assert (=> b!1148493 (=> res!764272 e!653261)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1148493 (= res!764272 (not (= (select (arr!35897 _keys!1208) from!1455) k!934)))))

(declare-fun e!653256 () Bool)

(assert (=> b!1148493 e!653256))

(declare-fun c!113496 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148493 (= c!113496 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43557)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43557)

(declare-fun lt!513434 () Unit!37741)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!547 (array!74493 array!74495 (_ BitVec 32) (_ BitVec 32) V!43557 V!43557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37741)

(assert (=> b!1148493 (= lt!513434 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148494 () Bool)

(declare-fun e!653269 () Bool)

(declare-fun tp_is_empty!28823 () Bool)

(assert (=> b!1148494 (= e!653269 tp_is_empty!28823)))

(declare-fun b!1148495 () Bool)

(declare-fun res!764260 () Bool)

(assert (=> b!1148495 (=> (not res!764260) (not e!653257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148495 (= res!764260 (validKeyInArray!0 k!934))))

(declare-fun b!1148496 () Bool)

(declare-fun res!764265 () Bool)

(assert (=> b!1148496 (=> (not res!764265) (not e!653257))))

(declare-datatypes ((List!25099 0))(
  ( (Nil!25096) (Cons!25095 (h!26304 (_ BitVec 64)) (t!36384 List!25099)) )
))
(declare-fun arrayNoDuplicates!0 (array!74493 (_ BitVec 32) List!25099) Bool)

(assert (=> b!1148496 (= res!764265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25096))))

(declare-fun b!1148497 () Bool)

(declare-fun Unit!37743 () Unit!37741)

(assert (=> b!1148497 (= e!653271 Unit!37743)))

(declare-fun b!1148498 () Bool)

(declare-datatypes ((tuple2!18348 0))(
  ( (tuple2!18349 (_1!9185 (_ BitVec 64)) (_2!9185 V!43557)) )
))
(declare-datatypes ((List!25100 0))(
  ( (Nil!25097) (Cons!25096 (h!26305 tuple2!18348) (t!36385 List!25100)) )
))
(declare-datatypes ((ListLongMap!16317 0))(
  ( (ListLongMap!16318 (toList!8174 List!25100)) )
))
(declare-fun call!53065 () ListLongMap!16317)

(declare-fun call!53059 () ListLongMap!16317)

(declare-fun -!1309 (ListLongMap!16317 (_ BitVec 64)) ListLongMap!16317)

(assert (=> b!1148498 (= e!653256 (= call!53059 (-!1309 call!53065 k!934)))))

(declare-fun b!1148499 () Bool)

(declare-fun e!653264 () Unit!37741)

(declare-fun Unit!37744 () Unit!37741)

(assert (=> b!1148499 (= e!653264 Unit!37744)))

(assert (=> b!1148499 (= lt!513427 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113495 () Bool)

(assert (=> b!1148499 (= c!113495 (and (not lt!513427) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513428 () Unit!37741)

(declare-fun e!653260 () Unit!37741)

(assert (=> b!1148499 (= lt!513428 e!653260)))

(declare-fun lt!513424 () Unit!37741)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!442 (array!74493 array!74495 (_ BitVec 32) (_ BitVec 32) V!43557 V!43557 (_ BitVec 64) (_ BitVec 32) Int) Unit!37741)

(assert (=> b!1148499 (= lt!513424 (lemmaListMapContainsThenArrayContainsFrom!442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113497 () Bool)

(assert (=> b!1148499 (= c!113497 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764266 () Bool)

(declare-fun e!653255 () Bool)

(assert (=> b!1148499 (= res!764266 e!653255)))

(declare-fun e!653258 () Bool)

(assert (=> b!1148499 (=> (not res!764266) (not e!653258))))

(assert (=> b!1148499 e!653258))

(declare-fun lt!513438 () Unit!37741)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74493 (_ BitVec 32) (_ BitVec 32)) Unit!37741)

(assert (=> b!1148499 (= lt!513438 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148499 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25096)))

(declare-fun lt!513440 () Unit!37741)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74493 (_ BitVec 64) (_ BitVec 32) List!25099) Unit!37741)

(assert (=> b!1148499 (= lt!513440 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25096))))

(assert (=> b!1148499 false))

(declare-fun b!1148500 () Bool)

(declare-fun e!653268 () Bool)

(assert (=> b!1148500 (= e!653257 e!653268)))

(declare-fun res!764262 () Bool)

(assert (=> b!1148500 (=> (not res!764262) (not e!653268))))

(declare-fun lt!513423 () array!74493)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74493 (_ BitVec 32)) Bool)

(assert (=> b!1148500 (= res!764262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513423 mask!1564))))

(assert (=> b!1148500 (= lt!513423 (array!74494 (store (arr!35897 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36433 _keys!1208)))))

(declare-fun b!1148501 () Bool)

(declare-fun c!113500 () Bool)

(assert (=> b!1148501 (= c!113500 (and (not lt!513427) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1148501 (= e!653260 e!653267)))

(declare-fun b!1148502 () Bool)

(declare-fun e!653262 () Bool)

(assert (=> b!1148502 (= e!653268 (not e!653262))))

(declare-fun res!764261 () Bool)

(assert (=> b!1148502 (=> res!764261 e!653262)))

(assert (=> b!1148502 (= res!764261 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148502 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513432 () Unit!37741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74493 (_ BitVec 64) (_ BitVec 32)) Unit!37741)

(assert (=> b!1148502 (= lt!513432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1148503 () Bool)

(assert (=> b!1148503 (= e!653255 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!513426 () ListLongMap!16317)

(declare-fun bm!53055 () Bool)

(declare-fun lt!513439 () ListLongMap!16317)

(declare-fun call!53064 () ListLongMap!16317)

(declare-fun +!3596 (ListLongMap!16317 tuple2!18348) ListLongMap!16317)

(assert (=> bm!53055 (= call!53064 (+!3596 (ite c!113495 lt!513439 lt!513426) (ite c!113495 (tuple2!18349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113500 (tuple2!18349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!53063 () Bool)

(declare-fun bm!53056 () Bool)

(declare-fun call!53060 () ListLongMap!16317)

(declare-fun contains!6697 (ListLongMap!16317 (_ BitVec 64)) Bool)

(assert (=> bm!53056 (= call!53063 (contains!6697 (ite c!113495 lt!513439 call!53060) k!934))))

(declare-fun b!1148504 () Bool)

(assert (=> b!1148504 (contains!6697 call!53064 k!934)))

(declare-fun lt!513429 () Unit!37741)

(declare-fun call!53058 () Unit!37741)

(assert (=> b!1148504 (= lt!513429 call!53058)))

(assert (=> b!1148504 call!53063))

(assert (=> b!1148504 (= lt!513439 (+!3596 lt!513426 (tuple2!18349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513422 () Unit!37741)

(declare-fun addStillContains!846 (ListLongMap!16317 (_ BitVec 64) V!43557 (_ BitVec 64)) Unit!37741)

(assert (=> b!1148504 (= lt!513422 (addStillContains!846 lt!513426 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1148504 (= e!653260 lt!513429)))

(declare-fun bm!53057 () Bool)

(assert (=> bm!53057 (= call!53060 call!53064)))

(declare-fun bm!53058 () Bool)

(assert (=> bm!53058 (= call!53062 call!53063)))

(declare-fun b!1148505 () Bool)

(declare-fun res!764271 () Bool)

(assert (=> b!1148505 (=> (not res!764271) (not e!653257))))

(assert (=> b!1148505 (= res!764271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148506 () Bool)

(declare-fun res!764263 () Bool)

(assert (=> b!1148506 (=> (not res!764263) (not e!653257))))

(assert (=> b!1148506 (= res!764263 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36433 _keys!1208))))))

(declare-fun b!1148507 () Bool)

(assert (=> b!1148507 call!53062))

(declare-fun lt!513436 () Unit!37741)

(assert (=> b!1148507 (= lt!513436 call!53061)))

(assert (=> b!1148507 (= e!653271 lt!513436)))

(declare-fun lt!513431 () ListLongMap!16317)

(declare-fun e!653263 () Bool)

(declare-fun b!1148508 () Bool)

(assert (=> b!1148508 (= e!653263 (= (-!1309 lt!513431 k!934) lt!513426))))

(declare-fun b!1148509 () Bool)

(declare-fun res!764273 () Bool)

(assert (=> b!1148509 (=> (not res!764273) (not e!653268))))

(assert (=> b!1148509 (= res!764273 (arrayNoDuplicates!0 lt!513423 #b00000000000000000000000000000000 Nil!25096))))

(declare-fun mapNonEmpty!45059 () Bool)

(declare-fun mapRes!45059 () Bool)

(declare-fun tp!85590 () Bool)

(assert (=> mapNonEmpty!45059 (= mapRes!45059 (and tp!85590 e!653269))))

(declare-fun mapValue!45059 () ValueCell!13702)

(declare-fun mapRest!45059 () (Array (_ BitVec 32) ValueCell!13702))

(declare-fun mapKey!45059 () (_ BitVec 32))

(assert (=> mapNonEmpty!45059 (= (arr!35898 _values!996) (store mapRest!45059 mapKey!45059 mapValue!45059))))

(declare-fun b!1148510 () Bool)

(assert (=> b!1148510 (= e!653262 e!653270)))

(declare-fun res!764269 () Bool)

(assert (=> b!1148510 (=> res!764269 e!653270)))

(assert (=> b!1148510 (= res!764269 (not (= from!1455 i!673)))))

(declare-fun lt!513433 () ListLongMap!16317)

(declare-fun lt!513441 () array!74495)

(declare-fun getCurrentListMapNoExtraKeys!4647 (array!74493 array!74495 (_ BitVec 32) (_ BitVec 32) V!43557 V!43557 (_ BitVec 32) Int) ListLongMap!16317)

(assert (=> b!1148510 (= lt!513433 (getCurrentListMapNoExtraKeys!4647 lt!513423 lt!513441 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513435 () V!43557)

(assert (=> b!1148510 (= lt!513441 (array!74496 (store (arr!35898 _values!996) i!673 (ValueCellFull!13702 lt!513435)) (size!36434 _values!996)))))

(declare-fun dynLambda!2675 (Int (_ BitVec 64)) V!43557)

(assert (=> b!1148510 (= lt!513435 (dynLambda!2675 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148510 (= lt!513431 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45059 () Bool)

(assert (=> mapIsEmpty!45059 mapRes!45059))

(declare-fun bm!53059 () Bool)

(assert (=> bm!53059 (= call!53061 call!53058)))

(declare-fun b!1148511 () Bool)

(assert (=> b!1148511 (= e!653261 true)))

(assert (=> b!1148511 e!653263))

(declare-fun res!764268 () Bool)

(assert (=> b!1148511 (=> (not res!764268) (not e!653263))))

(declare-fun lt!513425 () V!43557)

(assert (=> b!1148511 (= res!764268 (= (-!1309 (+!3596 lt!513426 (tuple2!18349 (select (arr!35897 _keys!1208) from!1455) lt!513425)) (select (arr!35897 _keys!1208) from!1455)) lt!513426))))

(declare-fun lt!513421 () Unit!37741)

(declare-fun addThenRemoveForNewKeyIsSame!154 (ListLongMap!16317 (_ BitVec 64) V!43557) Unit!37741)

(assert (=> b!1148511 (= lt!513421 (addThenRemoveForNewKeyIsSame!154 lt!513426 (select (arr!35897 _keys!1208) from!1455) lt!513425))))

(declare-fun get!18264 (ValueCell!13702 V!43557) V!43557)

(assert (=> b!1148511 (= lt!513425 (get!18264 (select (arr!35898 _values!996) from!1455) lt!513435))))

(declare-fun lt!513430 () Unit!37741)

(assert (=> b!1148511 (= lt!513430 e!653264)))

(declare-fun c!113498 () Bool)

(assert (=> b!1148511 (= c!113498 (contains!6697 lt!513426 k!934))))

(assert (=> b!1148511 (= lt!513426 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53060 () Bool)

(assert (=> bm!53060 (= call!53059 (getCurrentListMapNoExtraKeys!4647 lt!513423 lt!513441 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53061 () Bool)

(assert (=> bm!53061 (= call!53065 (getCurrentListMapNoExtraKeys!4647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148512 () Bool)

(assert (=> b!1148512 (= e!653258 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148513 () Bool)

(assert (=> b!1148513 (= e!653255 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513427) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148514 () Bool)

(declare-fun e!653266 () Bool)

(declare-fun e!653259 () Bool)

(assert (=> b!1148514 (= e!653266 (and e!653259 mapRes!45059))))

(declare-fun condMapEmpty!45059 () Bool)

(declare-fun mapDefault!45059 () ValueCell!13702)

