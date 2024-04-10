; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98814 () Bool)

(assert start!98814)

(declare-fun b_free!24419 () Bool)

(declare-fun b_next!24419 () Bool)

(assert (=> start!98814 (= b_free!24419 (not b_next!24419))))

(declare-fun tp!85967 () Bool)

(declare-fun b_and!39687 () Bool)

(assert (=> start!98814 (= tp!85967 b_and!39687)))

(declare-fun b!1154286 () Bool)

(declare-fun e!656480 () Bool)

(declare-fun e!656471 () Bool)

(assert (=> b!1154286 (= e!656480 e!656471)))

(declare-fun res!767097 () Bool)

(assert (=> b!1154286 (=> res!767097 e!656471)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74745 0))(
  ( (array!74746 (arr!36023 (Array (_ BitVec 32) (_ BitVec 64))) (size!36559 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74745)

(assert (=> b!1154286 (= res!767097 (not (= (select (arr!36023 _keys!1208) from!1455) k!934)))))

(declare-fun e!656474 () Bool)

(assert (=> b!1154286 e!656474))

(declare-fun c!114631 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154286 (= c!114631 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43725 0))(
  ( (V!43726 (val!14531 Int)) )
))
(declare-fun zeroValue!944 () V!43725)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37995 0))(
  ( (Unit!37996) )
))
(declare-fun lt!517566 () Unit!37995)

(declare-datatypes ((ValueCell!13765 0))(
  ( (ValueCellFull!13765 (v!17168 V!43725)) (EmptyCell!13765) )
))
(declare-datatypes ((array!74747 0))(
  ( (array!74748 (arr!36024 (Array (_ BitVec 32) ValueCell!13765)) (size!36560 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74747)

(declare-fun minValue!944 () V!43725)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!592 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43725 V!43725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37995)

(assert (=> b!1154286 (= lt!517566 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!592 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154287 () Bool)

(declare-fun e!656483 () Unit!37995)

(declare-fun Unit!37997 () Unit!37995)

(assert (=> b!1154287 (= e!656483 Unit!37997)))

(declare-fun b!1154288 () Bool)

(declare-fun e!656478 () Bool)

(assert (=> b!1154288 (= e!656478 e!656480)))

(declare-fun res!767101 () Bool)

(assert (=> b!1154288 (=> res!767101 e!656480)))

(assert (=> b!1154288 (= res!767101 (not (= from!1455 i!673)))))

(declare-fun lt!517569 () array!74745)

(declare-fun lt!517561 () array!74747)

(declare-datatypes ((tuple2!18470 0))(
  ( (tuple2!18471 (_1!9246 (_ BitVec 64)) (_2!9246 V!43725)) )
))
(declare-datatypes ((List!25214 0))(
  ( (Nil!25211) (Cons!25210 (h!26419 tuple2!18470) (t!36625 List!25214)) )
))
(declare-datatypes ((ListLongMap!16439 0))(
  ( (ListLongMap!16440 (toList!8235 List!25214)) )
))
(declare-fun lt!517581 () ListLongMap!16439)

(declare-fun getCurrentListMapNoExtraKeys!4704 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43725 V!43725 (_ BitVec 32) Int) ListLongMap!16439)

(assert (=> b!1154288 (= lt!517581 (getCurrentListMapNoExtraKeys!4704 lt!517569 lt!517561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517574 () V!43725)

(assert (=> b!1154288 (= lt!517561 (array!74748 (store (arr!36024 _values!996) i!673 (ValueCellFull!13765 lt!517574)) (size!36560 _values!996)))))

(declare-fun dynLambda!2717 (Int (_ BitVec 64)) V!43725)

(assert (=> b!1154288 (= lt!517574 (dynLambda!2717 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517577 () ListLongMap!16439)

(assert (=> b!1154288 (= lt!517577 (getCurrentListMapNoExtraKeys!4704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!656477 () Bool)

(declare-fun b!1154289 () Bool)

(declare-fun arrayContainsKey!0 (array!74745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154289 (= e!656477 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154290 () Bool)

(declare-fun res!767094 () Bool)

(declare-fun e!656484 () Bool)

(assert (=> b!1154290 (=> (not res!767094) (not e!656484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154290 (= res!767094 (validMask!0 mask!1564))))

(declare-fun b!1154291 () Bool)

(declare-fun call!54576 () Bool)

(assert (=> b!1154291 call!54576))

(declare-fun lt!517562 () Unit!37995)

(declare-fun call!54573 () Unit!37995)

(assert (=> b!1154291 (= lt!517562 call!54573)))

(declare-fun e!656476 () Unit!37995)

(assert (=> b!1154291 (= e!656476 lt!517562)))

(declare-fun b!1154292 () Bool)

(declare-fun Unit!37998 () Unit!37995)

(assert (=> b!1154292 (= e!656476 Unit!37998)))

(declare-fun b!1154293 () Bool)

(declare-fun res!767099 () Bool)

(assert (=> b!1154293 (=> (not res!767099) (not e!656484))))

(assert (=> b!1154293 (= res!767099 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36559 _keys!1208))))))

(declare-fun b!1154294 () Bool)

(declare-fun e!656469 () Bool)

(declare-fun tp_is_empty!28949 () Bool)

(assert (=> b!1154294 (= e!656469 tp_is_empty!28949)))

(declare-fun b!1154296 () Bool)

(declare-fun e!656470 () Bool)

(assert (=> b!1154296 (= e!656470 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!114632 () Bool)

(declare-fun call!54570 () ListLongMap!16439)

(declare-fun lt!517572 () ListLongMap!16439)

(declare-fun lt!517578 () ListLongMap!16439)

(declare-fun bm!54567 () Bool)

(declare-fun c!114630 () Bool)

(declare-fun +!3648 (ListLongMap!16439 tuple2!18470) ListLongMap!16439)

(assert (=> bm!54567 (= call!54570 (+!3648 (ite c!114632 lt!517572 lt!517578) (ite c!114632 (tuple2!18471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114630 (tuple2!18471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!45248 () Bool)

(declare-fun mapRes!45248 () Bool)

(declare-fun tp!85968 () Bool)

(declare-fun e!656479 () Bool)

(assert (=> mapNonEmpty!45248 (= mapRes!45248 (and tp!85968 e!656479))))

(declare-fun mapKey!45248 () (_ BitVec 32))

(declare-fun mapRest!45248 () (Array (_ BitVec 32) ValueCell!13765))

(declare-fun mapValue!45248 () ValueCell!13765)

(assert (=> mapNonEmpty!45248 (= (arr!36024 _values!996) (store mapRest!45248 mapKey!45248 mapValue!45248))))

(declare-fun call!54572 () Unit!37995)

(declare-fun bm!54568 () Bool)

(declare-fun addStillContains!894 (ListLongMap!16439 (_ BitVec 64) V!43725 (_ BitVec 64)) Unit!37995)

(assert (=> bm!54568 (= call!54572 (addStillContains!894 (ite c!114632 lt!517572 lt!517578) (ite c!114632 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114630 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114632 minValue!944 (ite c!114630 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1154297 () Bool)

(declare-fun res!767095 () Bool)

(assert (=> b!1154297 (=> (not res!767095) (not e!656484))))

(assert (=> b!1154297 (= res!767095 (= (select (arr!36023 _keys!1208) i!673) k!934))))

(declare-fun b!1154298 () Bool)

(declare-fun res!767107 () Bool)

(assert (=> b!1154298 (=> (not res!767107) (not e!656484))))

(declare-datatypes ((List!25215 0))(
  ( (Nil!25212) (Cons!25211 (h!26420 (_ BitVec 64)) (t!36626 List!25215)) )
))
(declare-fun arrayNoDuplicates!0 (array!74745 (_ BitVec 32) List!25215) Bool)

(assert (=> b!1154298 (= res!767107 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25212))))

(declare-fun bm!54569 () Bool)

(declare-fun call!54577 () ListLongMap!16439)

(assert (=> bm!54569 (= call!54577 (getCurrentListMapNoExtraKeys!4704 lt!517569 lt!517561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154299 () Bool)

(declare-fun Unit!37999 () Unit!37995)

(assert (=> b!1154299 (= e!656483 Unit!37999)))

(declare-fun lt!517570 () Bool)

(assert (=> b!1154299 (= lt!517570 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154299 (= c!114632 (and (not lt!517570) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517571 () Unit!37995)

(declare-fun e!656472 () Unit!37995)

(assert (=> b!1154299 (= lt!517571 e!656472)))

(declare-fun lt!517563 () Unit!37995)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!485 (array!74745 array!74747 (_ BitVec 32) (_ BitVec 32) V!43725 V!43725 (_ BitVec 64) (_ BitVec 32) Int) Unit!37995)

(assert (=> b!1154299 (= lt!517563 (lemmaListMapContainsThenArrayContainsFrom!485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114633 () Bool)

(assert (=> b!1154299 (= c!114633 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767106 () Bool)

(assert (=> b!1154299 (= res!767106 e!656470)))

(assert (=> b!1154299 (=> (not res!767106) (not e!656477))))

(assert (=> b!1154299 e!656477))

(declare-fun lt!517564 () Unit!37995)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74745 (_ BitVec 32) (_ BitVec 32)) Unit!37995)

(assert (=> b!1154299 (= lt!517564 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154299 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25212)))

(declare-fun lt!517567 () Unit!37995)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74745 (_ BitVec 64) (_ BitVec 32) List!25215) Unit!37995)

(assert (=> b!1154299 (= lt!517567 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25212))))

(assert (=> b!1154299 false))

(declare-fun bm!54570 () Bool)

(declare-fun call!54575 () ListLongMap!16439)

(assert (=> bm!54570 (= call!54575 call!54570)))

(declare-fun b!1154300 () Bool)

(declare-fun e!656473 () Bool)

(assert (=> b!1154300 (= e!656473 (and e!656469 mapRes!45248))))

(declare-fun condMapEmpty!45248 () Bool)

(declare-fun mapDefault!45248 () ValueCell!13765)

