; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98600 () Bool)

(assert start!98600)

(declare-fun b_free!24205 () Bool)

(declare-fun b_next!24205 () Bool)

(assert (=> start!98600 (= b_free!24205 (not b_next!24205))))

(declare-fun tp!85326 () Bool)

(declare-fun b_and!39259 () Bool)

(assert (=> start!98600 (= tp!85326 b_and!39259)))

(declare-fun b!1144442 () Bool)

(declare-datatypes ((Unit!37562 0))(
  ( (Unit!37563) )
))
(declare-fun e!651015 () Unit!37562)

(declare-fun Unit!37564 () Unit!37562)

(assert (=> b!1144442 (= e!651015 Unit!37564)))

(declare-fun b!1144443 () Bool)

(declare-fun e!651018 () Unit!37562)

(declare-fun e!651023 () Unit!37562)

(assert (=> b!1144443 (= e!651018 e!651023)))

(declare-fun c!112708 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!510667 () Bool)

(assert (=> b!1144443 (= c!112708 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510667))))

(declare-fun b!1144444 () Bool)

(declare-fun res!762289 () Bool)

(declare-fun e!651016 () Bool)

(assert (=> b!1144444 (=> (not res!762289) (not e!651016))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144444 (= res!762289 (validMask!0 mask!1564))))

(declare-fun b!1144445 () Bool)

(declare-fun Unit!37565 () Unit!37562)

(assert (=> b!1144445 (= e!651023 Unit!37565)))

(declare-datatypes ((array!74323 0))(
  ( (array!74324 (arr!35812 (Array (_ BitVec 32) (_ BitVec 64))) (size!36348 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74323)

(declare-fun e!651022 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1144446 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144446 (= e!651022 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51999 () Bool)

(declare-datatypes ((V!43441 0))(
  ( (V!43442 (val!14424 Int)) )
))
(declare-datatypes ((tuple2!18266 0))(
  ( (tuple2!18267 (_1!9144 (_ BitVec 64)) (_2!9144 V!43441)) )
))
(declare-datatypes ((List!25019 0))(
  ( (Nil!25016) (Cons!25015 (h!26224 tuple2!18266) (t!36216 List!25019)) )
))
(declare-datatypes ((ListLongMap!16235 0))(
  ( (ListLongMap!16236 (toList!8133 List!25019)) )
))
(declare-fun call!52003 () ListLongMap!16235)

(declare-fun call!52005 () ListLongMap!16235)

(assert (=> bm!51999 (= call!52003 call!52005)))

(declare-fun bm!52000 () Bool)

(declare-fun call!52004 () Unit!37562)

(declare-fun call!52002 () Unit!37562)

(assert (=> bm!52000 (= call!52004 call!52002)))

(declare-fun b!1144447 () Bool)

(declare-fun Unit!37566 () Unit!37562)

(assert (=> b!1144447 (= e!651015 Unit!37566)))

(assert (=> b!1144447 (= lt!510667 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112705 () Bool)

(assert (=> b!1144447 (= c!112705 (and (not lt!510667) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510668 () Unit!37562)

(declare-fun e!651013 () Unit!37562)

(assert (=> b!1144447 (= lt!510668 e!651013)))

(declare-fun zeroValue!944 () V!43441)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510664 () Unit!37562)

(declare-datatypes ((ValueCell!13658 0))(
  ( (ValueCellFull!13658 (v!17061 V!43441)) (EmptyCell!13658) )
))
(declare-datatypes ((array!74325 0))(
  ( (array!74326 (arr!35813 (Array (_ BitVec 32) ValueCell!13658)) (size!36349 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74325)

(declare-fun minValue!944 () V!43441)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!408 (array!74323 array!74325 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 64) (_ BitVec 32) Int) Unit!37562)

(assert (=> b!1144447 (= lt!510664 (lemmaListMapContainsThenArrayContainsFrom!408 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112707 () Bool)

(assert (=> b!1144447 (= c!112707 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762293 () Bool)

(declare-fun e!651017 () Bool)

(assert (=> b!1144447 (= res!762293 e!651017)))

(assert (=> b!1144447 (=> (not res!762293) (not e!651022))))

(assert (=> b!1144447 e!651022))

(declare-fun lt!510657 () Unit!37562)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74323 (_ BitVec 32) (_ BitVec 32)) Unit!37562)

(assert (=> b!1144447 (= lt!510657 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25020 0))(
  ( (Nil!25017) (Cons!25016 (h!26225 (_ BitVec 64)) (t!36217 List!25020)) )
))
(declare-fun arrayNoDuplicates!0 (array!74323 (_ BitVec 32) List!25020) Bool)

(assert (=> b!1144447 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25017)))

(declare-fun lt!510650 () Unit!37562)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74323 (_ BitVec 64) (_ BitVec 32) List!25020) Unit!37562)

(assert (=> b!1144447 (= lt!510650 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25017))))

(assert (=> b!1144447 false))

(declare-fun b!1144448 () Bool)

(declare-fun e!651012 () Bool)

(declare-fun call!52009 () ListLongMap!16235)

(declare-fun call!52007 () ListLongMap!16235)

(declare-fun -!1276 (ListLongMap!16235 (_ BitVec 64)) ListLongMap!16235)

(assert (=> b!1144448 (= e!651012 (= call!52009 (-!1276 call!52007 k!934)))))

(declare-fun b!1144449 () Bool)

(declare-fun lt!510669 () Unit!37562)

(assert (=> b!1144449 (= e!651018 lt!510669)))

(assert (=> b!1144449 (= lt!510669 call!52004)))

(declare-fun call!52006 () Bool)

(assert (=> b!1144449 call!52006))

(declare-fun b!1144450 () Bool)

(declare-fun res!762292 () Bool)

(assert (=> b!1144450 (=> (not res!762292) (not e!651016))))

(assert (=> b!1144450 (= res!762292 (and (= (size!36349 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36348 _keys!1208) (size!36349 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!762280 () Bool)

(assert (=> start!98600 (=> (not res!762280) (not e!651016))))

(assert (=> start!98600 (= res!762280 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36348 _keys!1208))))))

(assert (=> start!98600 e!651016))

(declare-fun tp_is_empty!28735 () Bool)

(assert (=> start!98600 tp_is_empty!28735))

(declare-fun array_inv!27438 (array!74323) Bool)

(assert (=> start!98600 (array_inv!27438 _keys!1208)))

(assert (=> start!98600 true))

(assert (=> start!98600 tp!85326))

(declare-fun e!651020 () Bool)

(declare-fun array_inv!27439 (array!74325) Bool)

(assert (=> start!98600 (and (array_inv!27439 _values!996) e!651020)))

(declare-fun call!52008 () Bool)

(declare-fun bm!52001 () Bool)

(declare-fun lt!510649 () ListLongMap!16235)

(declare-fun contains!6662 (ListLongMap!16235 (_ BitVec 64)) Bool)

(assert (=> bm!52001 (= call!52008 (contains!6662 (ite c!112705 lt!510649 call!52003) k!934))))

(declare-fun lt!510658 () array!74323)

(declare-fun lt!510660 () array!74325)

(declare-fun bm!52002 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4611 (array!74323 array!74325 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) Int) ListLongMap!16235)

(assert (=> bm!52002 (= call!52009 (getCurrentListMapNoExtraKeys!4611 lt!510658 lt!510660 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52003 () Bool)

(assert (=> bm!52003 (= call!52006 call!52008)))

(declare-fun b!1144451 () Bool)

(declare-fun e!651025 () Bool)

(declare-fun e!651019 () Bool)

(assert (=> b!1144451 (= e!651025 e!651019)))

(declare-fun res!762290 () Bool)

(assert (=> b!1144451 (=> res!762290 e!651019)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144451 (= res!762290 (not (= from!1455 i!673)))))

(declare-fun lt!510662 () ListLongMap!16235)

(assert (=> b!1144451 (= lt!510662 (getCurrentListMapNoExtraKeys!4611 lt!510658 lt!510660 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!510659 () V!43441)

(assert (=> b!1144451 (= lt!510660 (array!74326 (store (arr!35813 _values!996) i!673 (ValueCellFull!13658 lt!510659)) (size!36349 _values!996)))))

(declare-fun dynLambda!2648 (Int (_ BitVec 64)) V!43441)

(assert (=> b!1144451 (= lt!510659 (dynLambda!2648 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510653 () ListLongMap!16235)

(assert (=> b!1144451 (= lt!510653 (getCurrentListMapNoExtraKeys!4611 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144452 () Bool)

(assert (=> b!1144452 (= e!651012 (= call!52009 call!52007))))

(declare-fun b!1144453 () Bool)

(assert (=> b!1144453 call!52006))

(declare-fun lt!510652 () Unit!37562)

(assert (=> b!1144453 (= lt!510652 call!52004)))

(assert (=> b!1144453 (= e!651023 lt!510652)))

(declare-fun b!1144454 () Bool)

(declare-fun res!762285 () Bool)

(assert (=> b!1144454 (=> (not res!762285) (not e!651016))))

(assert (=> b!1144454 (= res!762285 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36348 _keys!1208))))))

(declare-fun b!1144455 () Bool)

(declare-fun res!762287 () Bool)

(declare-fun e!651021 () Bool)

(assert (=> b!1144455 (=> (not res!762287) (not e!651021))))

(assert (=> b!1144455 (= res!762287 (arrayNoDuplicates!0 lt!510658 #b00000000000000000000000000000000 Nil!25017))))

(declare-fun c!112703 () Bool)

(declare-fun bm!52004 () Bool)

(declare-fun lt!510661 () ListLongMap!16235)

(declare-fun addStillContains!815 (ListLongMap!16235 (_ BitVec 64) V!43441 (_ BitVec 64)) Unit!37562)

(assert (=> bm!52004 (= call!52002 (addStillContains!815 lt!510661 (ite (or c!112705 c!112703) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112705 c!112703) zeroValue!944 minValue!944) k!934))))

(declare-fun mapIsEmpty!44927 () Bool)

(declare-fun mapRes!44927 () Bool)

(assert (=> mapIsEmpty!44927 mapRes!44927))

(declare-fun b!1144456 () Bool)

(assert (=> b!1144456 (= c!112703 (and (not lt!510667) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144456 (= e!651013 e!651018)))

(declare-fun b!1144457 () Bool)

(assert (=> b!1144457 (= e!651016 e!651021)))

(declare-fun res!762288 () Bool)

(assert (=> b!1144457 (=> (not res!762288) (not e!651021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74323 (_ BitVec 32)) Bool)

(assert (=> b!1144457 (= res!762288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510658 mask!1564))))

(assert (=> b!1144457 (= lt!510658 (array!74324 (store (arr!35812 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36348 _keys!1208)))))

(declare-fun b!1144458 () Bool)

(declare-fun e!651011 () Bool)

(assert (=> b!1144458 (= e!651011 (= (-!1276 lt!510653 k!934) lt!510661))))

(declare-fun bm!52005 () Bool)

(declare-fun +!3560 (ListLongMap!16235 tuple2!18266) ListLongMap!16235)

(assert (=> bm!52005 (= call!52005 (+!3560 (ite c!112705 lt!510649 lt!510661) (ite c!112705 (tuple2!18267 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112703 (tuple2!18267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18267 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1144459 () Bool)

(assert (=> b!1144459 (= e!651021 (not e!651025))))

(declare-fun res!762281 () Bool)

(assert (=> b!1144459 (=> res!762281 e!651025)))

(assert (=> b!1144459 (= res!762281 (bvsgt from!1455 i!673))))

(assert (=> b!1144459 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!510665 () Unit!37562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74323 (_ BitVec 64) (_ BitVec 32)) Unit!37562)

(assert (=> b!1144459 (= lt!510665 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1144460 () Bool)

(declare-fun res!762282 () Bool)

(assert (=> b!1144460 (=> (not res!762282) (not e!651016))))

(assert (=> b!1144460 (= res!762282 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25017))))

(declare-fun mapNonEmpty!44927 () Bool)

(declare-fun tp!85325 () Bool)

(declare-fun e!651024 () Bool)

(assert (=> mapNonEmpty!44927 (= mapRes!44927 (and tp!85325 e!651024))))

(declare-fun mapRest!44927 () (Array (_ BitVec 32) ValueCell!13658))

(declare-fun mapKey!44927 () (_ BitVec 32))

(declare-fun mapValue!44927 () ValueCell!13658)

(assert (=> mapNonEmpty!44927 (= (arr!35813 _values!996) (store mapRest!44927 mapKey!44927 mapValue!44927))))

(declare-fun b!1144461 () Bool)

(declare-fun res!762284 () Bool)

(assert (=> b!1144461 (=> (not res!762284) (not e!651016))))

(assert (=> b!1144461 (= res!762284 (= (select (arr!35812 _keys!1208) i!673) k!934))))

(declare-fun b!1144462 () Bool)

(declare-fun e!651014 () Bool)

(assert (=> b!1144462 (= e!651019 e!651014)))

(declare-fun res!762286 () Bool)

(assert (=> b!1144462 (=> res!762286 e!651014)))

(assert (=> b!1144462 (= res!762286 (not (= (select (arr!35812 _keys!1208) from!1455) k!934)))))

(assert (=> b!1144462 e!651012))

(declare-fun c!112704 () Bool)

(assert (=> b!1144462 (= c!112704 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510654 () Unit!37562)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!517 (array!74323 array!74325 (_ BitVec 32) (_ BitVec 32) V!43441 V!43441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37562)

(assert (=> b!1144462 (= lt!510654 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!517 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144463 () Bool)

(assert (=> b!1144463 (contains!6662 call!52005 k!934)))

(declare-fun lt!510666 () Unit!37562)

(assert (=> b!1144463 (= lt!510666 (addStillContains!815 lt!510649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1144463 call!52008))

(assert (=> b!1144463 (= lt!510649 (+!3560 lt!510661 (tuple2!18267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510651 () Unit!37562)

(assert (=> b!1144463 (= lt!510651 call!52002)))

(assert (=> b!1144463 (= e!651013 lt!510666)))

(declare-fun b!1144464 () Bool)

(declare-fun e!651026 () Bool)

(assert (=> b!1144464 (= e!651020 (and e!651026 mapRes!44927))))

(declare-fun condMapEmpty!44927 () Bool)

(declare-fun mapDefault!44927 () ValueCell!13658)

