; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99214 () Bool)

(assert start!99214)

(declare-fun b_free!24583 () Bool)

(declare-fun b_next!24583 () Bool)

(assert (=> start!99214 (= b_free!24583 (not b_next!24583))))

(declare-fun tp!86459 () Bool)

(declare-fun b_and!40017 () Bool)

(assert (=> start!99214 (= tp!86459 b_and!40017)))

(declare-fun b!1163119 () Bool)

(declare-datatypes ((Unit!38303 0))(
  ( (Unit!38304) )
))
(declare-fun e!661496 () Unit!38303)

(declare-fun Unit!38305 () Unit!38303)

(assert (=> b!1163119 (= e!661496 Unit!38305)))

(declare-fun b!1163120 () Bool)

(declare-fun e!661486 () Bool)

(declare-fun e!661493 () Bool)

(assert (=> b!1163120 (= e!661486 (not e!661493))))

(declare-fun res!771303 () Bool)

(assert (=> b!1163120 (=> res!771303 e!661493)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163120 (= res!771303 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75115 0))(
  ( (array!75116 (arr!36202 (Array (_ BitVec 32) (_ BitVec 64))) (size!36739 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75115)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163120 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523466 () Unit!38303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75115 (_ BitVec 64) (_ BitVec 32)) Unit!38303)

(assert (=> b!1163120 (= lt!523466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163121 () Bool)

(declare-fun res!771300 () Bool)

(declare-fun e!661495 () Bool)

(assert (=> b!1163121 (=> (not res!771300) (not e!661495))))

(declare-datatypes ((List!25385 0))(
  ( (Nil!25382) (Cons!25381 (h!26599 (_ BitVec 64)) (t!36952 List!25385)) )
))
(declare-fun arrayNoDuplicates!0 (array!75115 (_ BitVec 32) List!25385) Bool)

(assert (=> b!1163121 (= res!771300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25382))))

(declare-fun bm!56600 () Bool)

(declare-datatypes ((V!43945 0))(
  ( (V!43946 (val!14613 Int)) )
))
(declare-datatypes ((tuple2!18650 0))(
  ( (tuple2!18651 (_1!9336 (_ BitVec 64)) (_2!9336 V!43945)) )
))
(declare-datatypes ((List!25386 0))(
  ( (Nil!25383) (Cons!25382 (h!26600 tuple2!18650) (t!36953 List!25386)) )
))
(declare-datatypes ((ListLongMap!16627 0))(
  ( (ListLongMap!16628 (toList!8329 List!25386)) )
))
(declare-fun lt!523458 () ListLongMap!16627)

(declare-fun c!116503 () Bool)

(declare-fun zeroValue!944 () V!43945)

(declare-fun call!56607 () Unit!38303)

(declare-fun minValue!944 () V!43945)

(declare-fun c!116505 () Bool)

(declare-fun addStillContains!964 (ListLongMap!16627 (_ BitVec 64) V!43945 (_ BitVec 64)) Unit!38303)

(assert (=> bm!56600 (= call!56607 (addStillContains!964 lt!523458 (ite (or c!116503 c!116505) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116503 c!116505) zeroValue!944 minValue!944) k0!934))))

(declare-fun lt!523467 () array!75115)

(declare-datatypes ((ValueCell!13847 0))(
  ( (ValueCellFull!13847 (v!17246 V!43945)) (EmptyCell!13847) )
))
(declare-datatypes ((array!75117 0))(
  ( (array!75118 (arr!36203 (Array (_ BitVec 32) ValueCell!13847)) (size!36740 (_ BitVec 32))) )
))
(declare-fun lt!523463 () array!75117)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!523457 () ListLongMap!16627)

(declare-fun e!661482 () Bool)

(declare-fun b!1163122 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4821 (array!75115 array!75117 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) Int) ListLongMap!16627)

(assert (=> b!1163122 (= e!661482 (= lt!523457 (getCurrentListMapNoExtraKeys!4821 lt!523467 lt!523463 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163123 () Bool)

(declare-fun res!771306 () Bool)

(assert (=> b!1163123 (=> (not res!771306) (not e!661486))))

(assert (=> b!1163123 (= res!771306 (arrayNoDuplicates!0 lt!523467 #b00000000000000000000000000000000 Nil!25382))))

(declare-fun e!661497 () Bool)

(declare-fun b!1163124 () Bool)

(assert (=> b!1163124 (= e!661497 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56601 () Bool)

(declare-fun call!56610 () ListLongMap!16627)

(declare-fun lt!523472 () ListLongMap!16627)

(declare-fun +!3745 (ListLongMap!16627 tuple2!18650) ListLongMap!16627)

(assert (=> bm!56601 (= call!56610 (+!3745 (ite c!116503 lt!523472 lt!523458) (ite c!116503 (tuple2!18651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116505 (tuple2!18651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163125 () Bool)

(declare-fun e!661492 () Bool)

(declare-fun e!661483 () Bool)

(assert (=> b!1163125 (= e!661492 e!661483)))

(declare-fun res!771293 () Bool)

(assert (=> b!1163125 (=> res!771293 e!661483)))

(assert (=> b!1163125 (= res!771293 (not (= (select (arr!36202 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661484 () Bool)

(assert (=> b!1163125 e!661484))

(declare-fun c!116504 () Bool)

(assert (=> b!1163125 (= c!116504 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523471 () Unit!38303)

(declare-fun _values!996 () array!75117)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!652 (array!75115 array!75117 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38303)

(assert (=> b!1163125 (= lt!523471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!652 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!661485 () Bool)

(declare-fun b!1163126 () Bool)

(assert (=> b!1163126 (= e!661485 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163127 () Bool)

(declare-fun e!661488 () Bool)

(declare-fun tp_is_empty!29113 () Bool)

(assert (=> b!1163127 (= e!661488 tp_is_empty!29113)))

(declare-fun b!1163128 () Bool)

(declare-fun e!661490 () Bool)

(assert (=> b!1163128 (= e!661490 tp_is_empty!29113)))

(declare-fun bm!56602 () Bool)

(declare-fun call!56603 () Bool)

(declare-fun call!56606 () Bool)

(assert (=> bm!56602 (= call!56603 call!56606)))

(declare-fun b!1163129 () Bool)

(assert (=> b!1163129 (= e!661483 true)))

(assert (=> b!1163129 e!661482))

(declare-fun res!771301 () Bool)

(assert (=> b!1163129 (=> (not res!771301) (not e!661482))))

(assert (=> b!1163129 (= res!771301 (= lt!523457 lt!523458))))

(declare-fun lt!523473 () ListLongMap!16627)

(declare-fun -!1424 (ListLongMap!16627 (_ BitVec 64)) ListLongMap!16627)

(assert (=> b!1163129 (= lt!523457 (-!1424 lt!523473 k0!934))))

(declare-fun lt!523470 () V!43945)

(assert (=> b!1163129 (= (-!1424 (+!3745 lt!523458 (tuple2!18651 (select (arr!36202 _keys!1208) from!1455) lt!523470)) (select (arr!36202 _keys!1208) from!1455)) lt!523458)))

(declare-fun lt!523465 () Unit!38303)

(declare-fun addThenRemoveForNewKeyIsSame!252 (ListLongMap!16627 (_ BitVec 64) V!43945) Unit!38303)

(assert (=> b!1163129 (= lt!523465 (addThenRemoveForNewKeyIsSame!252 lt!523458 (select (arr!36202 _keys!1208) from!1455) lt!523470))))

(declare-fun lt!523476 () V!43945)

(declare-fun get!18491 (ValueCell!13847 V!43945) V!43945)

(assert (=> b!1163129 (= lt!523470 (get!18491 (select (arr!36203 _values!996) from!1455) lt!523476))))

(declare-fun lt!523469 () Unit!38303)

(declare-fun e!661498 () Unit!38303)

(assert (=> b!1163129 (= lt!523469 e!661498)))

(declare-fun c!116506 () Bool)

(declare-fun contains!6846 (ListLongMap!16627 (_ BitVec 64)) Bool)

(assert (=> b!1163129 (= c!116506 (contains!6846 lt!523458 k0!934))))

(assert (=> b!1163129 (= lt!523458 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56603 () Bool)

(declare-fun call!56605 () ListLongMap!16627)

(assert (=> bm!56603 (= call!56606 (contains!6846 (ite c!116503 lt!523472 call!56605) k0!934))))

(declare-fun b!1163131 () Bool)

(declare-fun res!771298 () Bool)

(assert (=> b!1163131 (=> (not res!771298) (not e!661495))))

(assert (=> b!1163131 (= res!771298 (= (select (arr!36202 _keys!1208) i!673) k0!934))))

(declare-fun res!771295 () Bool)

(assert (=> start!99214 (=> (not res!771295) (not e!661495))))

(assert (=> start!99214 (= res!771295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36739 _keys!1208))))))

(assert (=> start!99214 e!661495))

(assert (=> start!99214 tp_is_empty!29113))

(declare-fun array_inv!27764 (array!75115) Bool)

(assert (=> start!99214 (array_inv!27764 _keys!1208)))

(assert (=> start!99214 true))

(assert (=> start!99214 tp!86459))

(declare-fun e!661489 () Bool)

(declare-fun array_inv!27765 (array!75117) Bool)

(assert (=> start!99214 (and (array_inv!27765 _values!996) e!661489)))

(declare-fun b!1163130 () Bool)

(declare-fun lt!523459 () Bool)

(assert (=> b!1163130 (= e!661485 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523459) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!56608 () ListLongMap!16627)

(declare-fun bm!56604 () Bool)

(assert (=> bm!56604 (= call!56608 (getCurrentListMapNoExtraKeys!4821 lt!523467 lt!523463 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163132 () Bool)

(declare-fun res!771302 () Bool)

(assert (=> b!1163132 (=> (not res!771302) (not e!661495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163132 (= res!771302 (validMask!0 mask!1564))))

(declare-fun call!56604 () ListLongMap!16627)

(declare-fun bm!56605 () Bool)

(assert (=> bm!56605 (= call!56604 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163133 () Bool)

(assert (=> b!1163133 call!56603))

(declare-fun lt!523456 () Unit!38303)

(declare-fun call!56609 () Unit!38303)

(assert (=> b!1163133 (= lt!523456 call!56609)))

(assert (=> b!1163133 (= e!661496 lt!523456)))

(declare-fun mapIsEmpty!45494 () Bool)

(declare-fun mapRes!45494 () Bool)

(assert (=> mapIsEmpty!45494 mapRes!45494))

(declare-fun b!1163134 () Bool)

(assert (=> b!1163134 (= c!116505 (and (not lt!523459) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661491 () Unit!38303)

(declare-fun e!661494 () Unit!38303)

(assert (=> b!1163134 (= e!661491 e!661494)))

(declare-fun b!1163135 () Bool)

(assert (=> b!1163135 (= e!661484 (= call!56608 (-!1424 call!56604 k0!934)))))

(declare-fun mapNonEmpty!45494 () Bool)

(declare-fun tp!86460 () Bool)

(assert (=> mapNonEmpty!45494 (= mapRes!45494 (and tp!86460 e!661488))))

(declare-fun mapValue!45494 () ValueCell!13847)

(declare-fun mapRest!45494 () (Array (_ BitVec 32) ValueCell!13847))

(declare-fun mapKey!45494 () (_ BitVec 32))

(assert (=> mapNonEmpty!45494 (= (arr!36203 _values!996) (store mapRest!45494 mapKey!45494 mapValue!45494))))

(declare-fun b!1163136 () Bool)

(declare-fun res!771294 () Bool)

(assert (=> b!1163136 (=> (not res!771294) (not e!661495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75115 (_ BitVec 32)) Bool)

(assert (=> b!1163136 (= res!771294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163137 () Bool)

(assert (=> b!1163137 (= e!661494 e!661496)))

(declare-fun c!116507 () Bool)

(assert (=> b!1163137 (= c!116507 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523459))))

(declare-fun b!1163138 () Bool)

(assert (=> b!1163138 (= e!661484 (= call!56608 call!56604))))

(declare-fun b!1163139 () Bool)

(assert (=> b!1163139 (= e!661489 (and e!661490 mapRes!45494))))

(declare-fun condMapEmpty!45494 () Bool)

(declare-fun mapDefault!45494 () ValueCell!13847)

(assert (=> b!1163139 (= condMapEmpty!45494 (= (arr!36203 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13847)) mapDefault!45494)))))

(declare-fun b!1163140 () Bool)

(assert (=> b!1163140 (contains!6846 call!56610 k0!934)))

(declare-fun lt!523460 () Unit!38303)

(assert (=> b!1163140 (= lt!523460 (addStillContains!964 lt!523472 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1163140 call!56606))

(assert (=> b!1163140 (= lt!523472 (+!3745 lt!523458 (tuple2!18651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523475 () Unit!38303)

(assert (=> b!1163140 (= lt!523475 call!56607)))

(assert (=> b!1163140 (= e!661491 lt!523460)))

(declare-fun bm!56606 () Bool)

(assert (=> bm!56606 (= call!56605 call!56610)))

(declare-fun bm!56607 () Bool)

(assert (=> bm!56607 (= call!56609 call!56607)))

(declare-fun b!1163141 () Bool)

(declare-fun res!771305 () Bool)

(assert (=> b!1163141 (=> (not res!771305) (not e!661495))))

(assert (=> b!1163141 (= res!771305 (and (= (size!36740 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36739 _keys!1208) (size!36740 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1163142 () Bool)

(declare-fun res!771296 () Bool)

(assert (=> b!1163142 (=> (not res!771296) (not e!661495))))

(assert (=> b!1163142 (= res!771296 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36739 _keys!1208))))))

(declare-fun b!1163143 () Bool)

(declare-fun res!771299 () Bool)

(assert (=> b!1163143 (=> (not res!771299) (not e!661495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163143 (= res!771299 (validKeyInArray!0 k0!934))))

(declare-fun b!1163144 () Bool)

(assert (=> b!1163144 (= e!661495 e!661486)))

(declare-fun res!771304 () Bool)

(assert (=> b!1163144 (=> (not res!771304) (not e!661486))))

(assert (=> b!1163144 (= res!771304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523467 mask!1564))))

(assert (=> b!1163144 (= lt!523467 (array!75116 (store (arr!36202 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36739 _keys!1208)))))

(declare-fun b!1163145 () Bool)

(assert (=> b!1163145 (= e!661493 e!661492)))

(declare-fun res!771292 () Bool)

(assert (=> b!1163145 (=> res!771292 e!661492)))

(assert (=> b!1163145 (= res!771292 (not (= from!1455 i!673)))))

(declare-fun lt!523462 () ListLongMap!16627)

(assert (=> b!1163145 (= lt!523462 (getCurrentListMapNoExtraKeys!4821 lt!523467 lt!523463 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163145 (= lt!523463 (array!75118 (store (arr!36203 _values!996) i!673 (ValueCellFull!13847 lt!523476)) (size!36740 _values!996)))))

(declare-fun dynLambda!2815 (Int (_ BitVec 64)) V!43945)

(assert (=> b!1163145 (= lt!523476 (dynLambda!2815 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163145 (= lt!523473 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163146 () Bool)

(declare-fun Unit!38306 () Unit!38303)

(assert (=> b!1163146 (= e!661498 Unit!38306)))

(assert (=> b!1163146 (= lt!523459 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163146 (= c!116503 (and (not lt!523459) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523464 () Unit!38303)

(assert (=> b!1163146 (= lt!523464 e!661491)))

(declare-fun lt!523477 () Unit!38303)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!547 (array!75115 array!75117 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 64) (_ BitVec 32) Int) Unit!38303)

(assert (=> b!1163146 (= lt!523477 (lemmaListMapContainsThenArrayContainsFrom!547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116508 () Bool)

(assert (=> b!1163146 (= c!116508 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771297 () Bool)

(assert (=> b!1163146 (= res!771297 e!661485)))

(assert (=> b!1163146 (=> (not res!771297) (not e!661497))))

(assert (=> b!1163146 e!661497))

(declare-fun lt!523461 () Unit!38303)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75115 (_ BitVec 32) (_ BitVec 32)) Unit!38303)

(assert (=> b!1163146 (= lt!523461 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163146 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25382)))

(declare-fun lt!523468 () Unit!38303)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75115 (_ BitVec 64) (_ BitVec 32) List!25385) Unit!38303)

(assert (=> b!1163146 (= lt!523468 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25382))))

(assert (=> b!1163146 false))

(declare-fun b!1163147 () Bool)

(declare-fun lt!523474 () Unit!38303)

(assert (=> b!1163147 (= e!661494 lt!523474)))

(assert (=> b!1163147 (= lt!523474 call!56609)))

(assert (=> b!1163147 call!56603))

(declare-fun b!1163148 () Bool)

(declare-fun Unit!38307 () Unit!38303)

(assert (=> b!1163148 (= e!661498 Unit!38307)))

(assert (= (and start!99214 res!771295) b!1163132))

(assert (= (and b!1163132 res!771302) b!1163141))

(assert (= (and b!1163141 res!771305) b!1163136))

(assert (= (and b!1163136 res!771294) b!1163121))

(assert (= (and b!1163121 res!771300) b!1163142))

(assert (= (and b!1163142 res!771296) b!1163143))

(assert (= (and b!1163143 res!771299) b!1163131))

(assert (= (and b!1163131 res!771298) b!1163144))

(assert (= (and b!1163144 res!771304) b!1163123))

(assert (= (and b!1163123 res!771306) b!1163120))

(assert (= (and b!1163120 (not res!771303)) b!1163145))

(assert (= (and b!1163145 (not res!771292)) b!1163125))

(assert (= (and b!1163125 c!116504) b!1163135))

(assert (= (and b!1163125 (not c!116504)) b!1163138))

(assert (= (or b!1163135 b!1163138) bm!56604))

(assert (= (or b!1163135 b!1163138) bm!56605))

(assert (= (and b!1163125 (not res!771293)) b!1163129))

(assert (= (and b!1163129 c!116506) b!1163146))

(assert (= (and b!1163129 (not c!116506)) b!1163148))

(assert (= (and b!1163146 c!116503) b!1163140))

(assert (= (and b!1163146 (not c!116503)) b!1163134))

(assert (= (and b!1163134 c!116505) b!1163147))

(assert (= (and b!1163134 (not c!116505)) b!1163137))

(assert (= (and b!1163137 c!116507) b!1163133))

(assert (= (and b!1163137 (not c!116507)) b!1163119))

(assert (= (or b!1163147 b!1163133) bm!56607))

(assert (= (or b!1163147 b!1163133) bm!56606))

(assert (= (or b!1163147 b!1163133) bm!56602))

(assert (= (or b!1163140 bm!56602) bm!56603))

(assert (= (or b!1163140 bm!56607) bm!56600))

(assert (= (or b!1163140 bm!56606) bm!56601))

(assert (= (and b!1163146 c!116508) b!1163126))

(assert (= (and b!1163146 (not c!116508)) b!1163130))

(assert (= (and b!1163146 res!771297) b!1163124))

(assert (= (and b!1163129 res!771301) b!1163122))

(assert (= (and b!1163139 condMapEmpty!45494) mapIsEmpty!45494))

(assert (= (and b!1163139 (not condMapEmpty!45494)) mapNonEmpty!45494))

(get-info :version)

(assert (= (and mapNonEmpty!45494 ((_ is ValueCellFull!13847) mapValue!45494)) b!1163127))

(assert (= (and b!1163139 ((_ is ValueCellFull!13847) mapDefault!45494)) b!1163128))

(assert (= start!99214 b!1163139))

(declare-fun b_lambda!19683 () Bool)

(assert (=> (not b_lambda!19683) (not b!1163145)))

(declare-fun t!36951 () Bool)

(declare-fun tb!9387 () Bool)

(assert (=> (and start!99214 (= defaultEntry!1004 defaultEntry!1004) t!36951) tb!9387))

(declare-fun result!19347 () Bool)

(assert (=> tb!9387 (= result!19347 tp_is_empty!29113)))

(assert (=> b!1163145 t!36951))

(declare-fun b_and!40019 () Bool)

(assert (= b_and!40017 (and (=> t!36951 result!19347) b_and!40019)))

(declare-fun m!1072173 () Bool)

(assert (=> b!1163146 m!1072173))

(declare-fun m!1072175 () Bool)

(assert (=> b!1163146 m!1072175))

(declare-fun m!1072177 () Bool)

(assert (=> b!1163146 m!1072177))

(declare-fun m!1072179 () Bool)

(assert (=> b!1163146 m!1072179))

(declare-fun m!1072181 () Bool)

(assert (=> b!1163120 m!1072181))

(declare-fun m!1072183 () Bool)

(assert (=> b!1163120 m!1072183))

(declare-fun m!1072185 () Bool)

(assert (=> b!1163145 m!1072185))

(declare-fun m!1072187 () Bool)

(assert (=> b!1163145 m!1072187))

(declare-fun m!1072189 () Bool)

(assert (=> b!1163145 m!1072189))

(declare-fun m!1072191 () Bool)

(assert (=> b!1163145 m!1072191))

(declare-fun m!1072193 () Bool)

(assert (=> bm!56604 m!1072193))

(declare-fun m!1072195 () Bool)

(assert (=> bm!56601 m!1072195))

(declare-fun m!1072197 () Bool)

(assert (=> b!1163125 m!1072197))

(declare-fun m!1072199 () Bool)

(assert (=> b!1163125 m!1072199))

(declare-fun m!1072201 () Bool)

(assert (=> bm!56605 m!1072201))

(declare-fun m!1072203 () Bool)

(assert (=> bm!56603 m!1072203))

(declare-fun m!1072205 () Bool)

(assert (=> b!1163143 m!1072205))

(declare-fun m!1072207 () Bool)

(assert (=> b!1163135 m!1072207))

(declare-fun m!1072209 () Bool)

(assert (=> b!1163126 m!1072209))

(assert (=> b!1163129 m!1072201))

(declare-fun m!1072211 () Bool)

(assert (=> b!1163129 m!1072211))

(declare-fun m!1072213 () Bool)

(assert (=> b!1163129 m!1072213))

(assert (=> b!1163129 m!1072197))

(declare-fun m!1072215 () Bool)

(assert (=> b!1163129 m!1072215))

(declare-fun m!1072217 () Bool)

(assert (=> b!1163129 m!1072217))

(declare-fun m!1072219 () Bool)

(assert (=> b!1163129 m!1072219))

(assert (=> b!1163129 m!1072197))

(declare-fun m!1072221 () Bool)

(assert (=> b!1163129 m!1072221))

(assert (=> b!1163129 m!1072197))

(assert (=> b!1163129 m!1072211))

(declare-fun m!1072223 () Bool)

(assert (=> b!1163129 m!1072223))

(assert (=> b!1163129 m!1072213))

(declare-fun m!1072225 () Bool)

(assert (=> start!99214 m!1072225))

(declare-fun m!1072227 () Bool)

(assert (=> start!99214 m!1072227))

(assert (=> b!1163122 m!1072193))

(declare-fun m!1072229 () Bool)

(assert (=> b!1163140 m!1072229))

(declare-fun m!1072231 () Bool)

(assert (=> b!1163140 m!1072231))

(declare-fun m!1072233 () Bool)

(assert (=> b!1163140 m!1072233))

(declare-fun m!1072235 () Bool)

(assert (=> b!1163123 m!1072235))

(declare-fun m!1072237 () Bool)

(assert (=> b!1163131 m!1072237))

(declare-fun m!1072239 () Bool)

(assert (=> bm!56600 m!1072239))

(declare-fun m!1072241 () Bool)

(assert (=> b!1163144 m!1072241))

(declare-fun m!1072243 () Bool)

(assert (=> b!1163144 m!1072243))

(assert (=> b!1163124 m!1072209))

(declare-fun m!1072245 () Bool)

(assert (=> b!1163132 m!1072245))

(declare-fun m!1072247 () Bool)

(assert (=> mapNonEmpty!45494 m!1072247))

(declare-fun m!1072249 () Bool)

(assert (=> b!1163121 m!1072249))

(declare-fun m!1072251 () Bool)

(assert (=> b!1163136 m!1072251))

(check-sat (not mapNonEmpty!45494) (not b!1163140) (not b!1163126) (not b!1163124) (not bm!56603) (not start!99214) (not b!1163136) (not bm!56600) (not b!1163132) (not bm!56605) (not b!1163120) (not bm!56604) (not b!1163121) b_and!40019 (not b!1163135) (not b_lambda!19683) (not b_next!24583) (not bm!56601) (not b!1163144) tp_is_empty!29113 (not b!1163145) (not b!1163125) (not b!1163122) (not b!1163143) (not b!1163123) (not b!1163129) (not b!1163146))
(check-sat b_and!40019 (not b_next!24583))
