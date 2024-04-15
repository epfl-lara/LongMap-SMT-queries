; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98876 () Bool)

(assert start!98876)

(declare-fun b_free!24487 () Bool)

(declare-fun b_next!24487 () Bool)

(assert (=> start!98876 (= b_free!24487 (not b_next!24487))))

(declare-fun tp!86171 () Bool)

(declare-fun b_and!39801 () Bool)

(assert (=> start!98876 (= tp!86171 b_and!39801)))

(declare-fun b!1157290 () Bool)

(declare-fun res!768562 () Bool)

(declare-fun e!658125 () Bool)

(assert (=> b!1157290 (=> (not res!768562) (not e!658125))))

(declare-datatypes ((array!74796 0))(
  ( (array!74797 (arr!36049 (Array (_ BitVec 32) (_ BitVec 64))) (size!36587 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74796)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74796 (_ BitVec 32)) Bool)

(assert (=> b!1157290 (= res!768562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157291 () Bool)

(declare-fun e!658132 () Bool)

(declare-fun e!658135 () Bool)

(assert (=> b!1157291 (= e!658132 (not e!658135))))

(declare-fun res!768560 () Bool)

(assert (=> b!1157291 (=> res!768560 e!658135)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157291 (= res!768560 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157291 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37975 0))(
  ( (Unit!37976) )
))
(declare-fun lt!519624 () Unit!37975)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74796 (_ BitVec 64) (_ BitVec 32)) Unit!37975)

(assert (=> b!1157291 (= lt!519624 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157292 () Bool)

(declare-fun res!768570 () Bool)

(assert (=> b!1157292 (=> (not res!768570) (not e!658125))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43817 0))(
  ( (V!43818 (val!14565 Int)) )
))
(declare-datatypes ((ValueCell!13799 0))(
  ( (ValueCellFull!13799 (v!17201 V!43817)) (EmptyCell!13799) )
))
(declare-datatypes ((array!74798 0))(
  ( (array!74799 (arr!36050 (Array (_ BitVec 32) ValueCell!13799)) (size!36588 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74798)

(assert (=> b!1157292 (= res!768570 (and (= (size!36588 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36587 _keys!1208) (size!36588 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157293 () Bool)

(declare-fun res!768564 () Bool)

(assert (=> b!1157293 (=> (not res!768564) (not e!658125))))

(assert (=> b!1157293 (= res!768564 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36587 _keys!1208))))))

(declare-fun b!1157294 () Bool)

(declare-fun e!658138 () Bool)

(declare-fun tp_is_empty!29017 () Bool)

(assert (=> b!1157294 (= e!658138 tp_is_empty!29017)))

(declare-fun b!1157295 () Bool)

(declare-fun e!658130 () Bool)

(declare-fun e!658127 () Bool)

(assert (=> b!1157295 (= e!658130 e!658127)))

(declare-fun res!768563 () Bool)

(assert (=> b!1157295 (=> res!768563 e!658127)))

(assert (=> b!1157295 (= res!768563 (not (= (select (arr!36049 _keys!1208) from!1455) k0!934)))))

(declare-fun e!658140 () Bool)

(assert (=> b!1157295 e!658140))

(declare-fun c!115219 () Bool)

(assert (=> b!1157295 (= c!115219 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43817)

(declare-fun lt!519615 () Unit!37975)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43817)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 (array!74796 array!74798 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37975)

(assert (=> b!1157295 (= lt!519615 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157296 () Bool)

(declare-fun e!658128 () Unit!37975)

(declare-fun e!658137 () Unit!37975)

(assert (=> b!1157296 (= e!658128 e!658137)))

(declare-fun c!115216 () Bool)

(declare-fun lt!519618 () Bool)

(assert (=> b!1157296 (= c!115216 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519618))))

(declare-fun e!658139 () Bool)

(declare-fun b!1157297 () Bool)

(assert (=> b!1157297 (= e!658139 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519618) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157298 () Bool)

(declare-fun e!658136 () Unit!37975)

(declare-fun Unit!37977 () Unit!37975)

(assert (=> b!1157298 (= e!658136 Unit!37977)))

(assert (=> b!1157298 (= lt!519618 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115218 () Bool)

(assert (=> b!1157298 (= c!115218 (and (not lt!519618) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519623 () Unit!37975)

(declare-fun e!658131 () Unit!37975)

(assert (=> b!1157298 (= lt!519623 e!658131)))

(declare-fun lt!519616 () Unit!37975)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!508 (array!74796 array!74798 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 64) (_ BitVec 32) Int) Unit!37975)

(assert (=> b!1157298 (= lt!519616 (lemmaListMapContainsThenArrayContainsFrom!508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115220 () Bool)

(assert (=> b!1157298 (= c!115220 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768561 () Bool)

(assert (=> b!1157298 (= res!768561 e!658139)))

(declare-fun e!658126 () Bool)

(assert (=> b!1157298 (=> (not res!768561) (not e!658126))))

(assert (=> b!1157298 e!658126))

(declare-fun lt!519617 () Unit!37975)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74796 (_ BitVec 32) (_ BitVec 32)) Unit!37975)

(assert (=> b!1157298 (= lt!519617 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25341 0))(
  ( (Nil!25338) (Cons!25337 (h!26546 (_ BitVec 64)) (t!36811 List!25341)) )
))
(declare-fun arrayNoDuplicates!0 (array!74796 (_ BitVec 32) List!25341) Bool)

(assert (=> b!1157298 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25338)))

(declare-fun lt!519629 () Unit!37975)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74796 (_ BitVec 64) (_ BitVec 32) List!25341) Unit!37975)

(assert (=> b!1157298 (= lt!519629 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25338))))

(assert (=> b!1157298 false))

(declare-fun c!115217 () Bool)

(declare-fun bm!55360 () Bool)

(declare-fun call!55369 () Unit!37975)

(declare-datatypes ((tuple2!18614 0))(
  ( (tuple2!18615 (_1!9318 (_ BitVec 64)) (_2!9318 V!43817)) )
))
(declare-datatypes ((List!25342 0))(
  ( (Nil!25339) (Cons!25338 (h!26547 tuple2!18614) (t!36812 List!25342)) )
))
(declare-datatypes ((ListLongMap!16583 0))(
  ( (ListLongMap!16584 (toList!8307 List!25342)) )
))
(declare-fun lt!519628 () ListLongMap!16583)

(declare-fun addStillContains!926 (ListLongMap!16583 (_ BitVec 64) V!43817 (_ BitVec 64)) Unit!37975)

(assert (=> bm!55360 (= call!55369 (addStillContains!926 lt!519628 (ite (or c!115218 c!115217) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115218 c!115217) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1157299 () Bool)

(declare-fun Unit!37978 () Unit!37975)

(assert (=> b!1157299 (= e!658137 Unit!37978)))

(declare-fun b!1157300 () Bool)

(assert (=> b!1157300 (= e!658125 e!658132)))

(declare-fun res!768565 () Bool)

(assert (=> b!1157300 (=> (not res!768565) (not e!658132))))

(declare-fun lt!519625 () array!74796)

(assert (=> b!1157300 (= res!768565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519625 mask!1564))))

(assert (=> b!1157300 (= lt!519625 (array!74797 (store (arr!36049 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36587 _keys!1208)))))

(declare-fun lt!519613 () ListLongMap!16583)

(declare-fun e!658129 () Bool)

(declare-fun lt!519627 () array!74798)

(declare-fun b!1157301 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4787 (array!74796 array!74798 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) Int) ListLongMap!16583)

(assert (=> b!1157301 (= e!658129 (= lt!519613 (getCurrentListMapNoExtraKeys!4787 lt!519625 lt!519627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157302 () Bool)

(assert (=> b!1157302 (= e!658126 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45350 () Bool)

(declare-fun mapRes!45350 () Bool)

(assert (=> mapIsEmpty!45350 mapRes!45350))

(declare-fun bm!55361 () Bool)

(declare-fun call!55363 () Bool)

(declare-fun call!55366 () Bool)

(assert (=> bm!55361 (= call!55363 call!55366)))

(declare-fun b!1157303 () Bool)

(assert (=> b!1157303 (= e!658139 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55362 () Bool)

(declare-fun call!55367 () Unit!37975)

(assert (=> bm!55362 (= call!55367 call!55369)))

(declare-fun bm!55363 () Bool)

(declare-fun call!55370 () ListLongMap!16583)

(declare-fun call!55364 () ListLongMap!16583)

(assert (=> bm!55363 (= call!55370 call!55364)))

(declare-fun mapNonEmpty!45350 () Bool)

(declare-fun tp!86172 () Bool)

(assert (=> mapNonEmpty!45350 (= mapRes!45350 (and tp!86172 e!658138))))

(declare-fun mapValue!45350 () ValueCell!13799)

(declare-fun mapRest!45350 () (Array (_ BitVec 32) ValueCell!13799))

(declare-fun mapKey!45350 () (_ BitVec 32))

(assert (=> mapNonEmpty!45350 (= (arr!36050 _values!996) (store mapRest!45350 mapKey!45350 mapValue!45350))))

(declare-fun b!1157304 () Bool)

(declare-fun e!658133 () Bool)

(assert (=> b!1157304 (= e!658133 tp_is_empty!29017)))

(declare-fun bm!55364 () Bool)

(declare-fun lt!519614 () ListLongMap!16583)

(declare-fun contains!6759 (ListLongMap!16583 (_ BitVec 64)) Bool)

(assert (=> bm!55364 (= call!55366 (contains!6759 (ite c!115218 lt!519614 call!55370) k0!934))))

(declare-fun b!1157305 () Bool)

(declare-fun +!3716 (ListLongMap!16583 tuple2!18614) ListLongMap!16583)

(assert (=> b!1157305 (contains!6759 (+!3716 lt!519614 (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519621 () Unit!37975)

(assert (=> b!1157305 (= lt!519621 (addStillContains!926 lt!519614 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1157305 call!55366))

(assert (=> b!1157305 (= lt!519614 call!55364)))

(declare-fun lt!519619 () Unit!37975)

(assert (=> b!1157305 (= lt!519619 call!55369)))

(assert (=> b!1157305 (= e!658131 lt!519621)))

(declare-fun bm!55365 () Bool)

(assert (=> bm!55365 (= call!55364 (+!3716 lt!519628 (ite (or c!115218 c!115217) (tuple2!18615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1157306 () Bool)

(assert (=> b!1157306 (= c!115217 (and (not lt!519618) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157306 (= e!658131 e!658128)))

(declare-fun b!1157307 () Bool)

(declare-fun res!768572 () Bool)

(assert (=> b!1157307 (=> (not res!768572) (not e!658132))))

(assert (=> b!1157307 (= res!768572 (arrayNoDuplicates!0 lt!519625 #b00000000000000000000000000000000 Nil!25338))))

(declare-fun b!1157308 () Bool)

(declare-fun call!55365 () ListLongMap!16583)

(declare-fun call!55368 () ListLongMap!16583)

(declare-fun -!1364 (ListLongMap!16583 (_ BitVec 64)) ListLongMap!16583)

(assert (=> b!1157308 (= e!658140 (= call!55365 (-!1364 call!55368 k0!934)))))

(declare-fun b!1157309 () Bool)

(declare-fun res!768569 () Bool)

(assert (=> b!1157309 (=> (not res!768569) (not e!658125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157309 (= res!768569 (validMask!0 mask!1564))))

(declare-fun b!1157310 () Bool)

(declare-fun e!658124 () Bool)

(assert (=> b!1157310 (= e!658124 (and e!658133 mapRes!45350))))

(declare-fun condMapEmpty!45350 () Bool)

(declare-fun mapDefault!45350 () ValueCell!13799)

(assert (=> b!1157310 (= condMapEmpty!45350 (= (arr!36050 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13799)) mapDefault!45350)))))

(declare-fun b!1157311 () Bool)

(assert (=> b!1157311 call!55363))

(declare-fun lt!519632 () Unit!37975)

(assert (=> b!1157311 (= lt!519632 call!55367)))

(assert (=> b!1157311 (= e!658137 lt!519632)))

(declare-fun b!1157312 () Bool)

(declare-fun lt!519622 () Unit!37975)

(assert (=> b!1157312 (= e!658128 lt!519622)))

(assert (=> b!1157312 (= lt!519622 call!55367)))

(assert (=> b!1157312 call!55363))

(declare-fun b!1157313 () Bool)

(assert (=> b!1157313 (= e!658135 e!658130)))

(declare-fun res!768559 () Bool)

(assert (=> b!1157313 (=> res!768559 e!658130)))

(assert (=> b!1157313 (= res!768559 (not (= from!1455 i!673)))))

(declare-fun lt!519612 () ListLongMap!16583)

(assert (=> b!1157313 (= lt!519612 (getCurrentListMapNoExtraKeys!4787 lt!519625 lt!519627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519633 () V!43817)

(assert (=> b!1157313 (= lt!519627 (array!74799 (store (arr!36050 _values!996) i!673 (ValueCellFull!13799 lt!519633)) (size!36588 _values!996)))))

(declare-fun dynLambda!2741 (Int (_ BitVec 64)) V!43817)

(assert (=> b!1157313 (= lt!519633 (dynLambda!2741 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519620 () ListLongMap!16583)

(assert (=> b!1157313 (= lt!519620 (getCurrentListMapNoExtraKeys!4787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157314 () Bool)

(assert (=> b!1157314 (= e!658140 (= call!55365 call!55368))))

(declare-fun b!1157315 () Bool)

(declare-fun res!768558 () Bool)

(assert (=> b!1157315 (=> (not res!768558) (not e!658125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157315 (= res!768558 (validKeyInArray!0 k0!934))))

(declare-fun res!768571 () Bool)

(assert (=> start!98876 (=> (not res!768571) (not e!658125))))

(assert (=> start!98876 (= res!768571 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36587 _keys!1208))))))

(assert (=> start!98876 e!658125))

(assert (=> start!98876 tp_is_empty!29017))

(declare-fun array_inv!27702 (array!74796) Bool)

(assert (=> start!98876 (array_inv!27702 _keys!1208)))

(assert (=> start!98876 true))

(assert (=> start!98876 tp!86171))

(declare-fun array_inv!27703 (array!74798) Bool)

(assert (=> start!98876 (and (array_inv!27703 _values!996) e!658124)))

(declare-fun bm!55366 () Bool)

(assert (=> bm!55366 (= call!55368 (getCurrentListMapNoExtraKeys!4787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157316 () Bool)

(assert (=> b!1157316 (= e!658127 true)))

(assert (=> b!1157316 e!658129))

(declare-fun res!768567 () Bool)

(assert (=> b!1157316 (=> (not res!768567) (not e!658129))))

(assert (=> b!1157316 (= res!768567 (= lt!519613 lt!519628))))

(assert (=> b!1157316 (= lt!519613 (-!1364 lt!519620 k0!934))))

(declare-fun lt!519630 () V!43817)

(assert (=> b!1157316 (= (-!1364 (+!3716 lt!519628 (tuple2!18615 (select (arr!36049 _keys!1208) from!1455) lt!519630)) (select (arr!36049 _keys!1208) from!1455)) lt!519628)))

(declare-fun lt!519626 () Unit!37975)

(declare-fun addThenRemoveForNewKeyIsSame!216 (ListLongMap!16583 (_ BitVec 64) V!43817) Unit!37975)

(assert (=> b!1157316 (= lt!519626 (addThenRemoveForNewKeyIsSame!216 lt!519628 (select (arr!36049 _keys!1208) from!1455) lt!519630))))

(declare-fun get!18392 (ValueCell!13799 V!43817) V!43817)

(assert (=> b!1157316 (= lt!519630 (get!18392 (select (arr!36050 _values!996) from!1455) lt!519633))))

(declare-fun lt!519631 () Unit!37975)

(assert (=> b!1157316 (= lt!519631 e!658136)))

(declare-fun c!115215 () Bool)

(assert (=> b!1157316 (= c!115215 (contains!6759 lt!519628 k0!934))))

(assert (=> b!1157316 (= lt!519628 (getCurrentListMapNoExtraKeys!4787 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157317 () Bool)

(declare-fun res!768568 () Bool)

(assert (=> b!1157317 (=> (not res!768568) (not e!658125))))

(assert (=> b!1157317 (= res!768568 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25338))))

(declare-fun b!1157318 () Bool)

(declare-fun res!768566 () Bool)

(assert (=> b!1157318 (=> (not res!768566) (not e!658125))))

(assert (=> b!1157318 (= res!768566 (= (select (arr!36049 _keys!1208) i!673) k0!934))))

(declare-fun bm!55367 () Bool)

(assert (=> bm!55367 (= call!55365 (getCurrentListMapNoExtraKeys!4787 lt!519625 lt!519627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157319 () Bool)

(declare-fun Unit!37979 () Unit!37975)

(assert (=> b!1157319 (= e!658136 Unit!37979)))

(assert (= (and start!98876 res!768571) b!1157309))

(assert (= (and b!1157309 res!768569) b!1157292))

(assert (= (and b!1157292 res!768570) b!1157290))

(assert (= (and b!1157290 res!768562) b!1157317))

(assert (= (and b!1157317 res!768568) b!1157293))

(assert (= (and b!1157293 res!768564) b!1157315))

(assert (= (and b!1157315 res!768558) b!1157318))

(assert (= (and b!1157318 res!768566) b!1157300))

(assert (= (and b!1157300 res!768565) b!1157307))

(assert (= (and b!1157307 res!768572) b!1157291))

(assert (= (and b!1157291 (not res!768560)) b!1157313))

(assert (= (and b!1157313 (not res!768559)) b!1157295))

(assert (= (and b!1157295 c!115219) b!1157308))

(assert (= (and b!1157295 (not c!115219)) b!1157314))

(assert (= (or b!1157308 b!1157314) bm!55367))

(assert (= (or b!1157308 b!1157314) bm!55366))

(assert (= (and b!1157295 (not res!768563)) b!1157316))

(assert (= (and b!1157316 c!115215) b!1157298))

(assert (= (and b!1157316 (not c!115215)) b!1157319))

(assert (= (and b!1157298 c!115218) b!1157305))

(assert (= (and b!1157298 (not c!115218)) b!1157306))

(assert (= (and b!1157306 c!115217) b!1157312))

(assert (= (and b!1157306 (not c!115217)) b!1157296))

(assert (= (and b!1157296 c!115216) b!1157311))

(assert (= (and b!1157296 (not c!115216)) b!1157299))

(assert (= (or b!1157312 b!1157311) bm!55362))

(assert (= (or b!1157312 b!1157311) bm!55363))

(assert (= (or b!1157312 b!1157311) bm!55361))

(assert (= (or b!1157305 bm!55361) bm!55364))

(assert (= (or b!1157305 bm!55362) bm!55360))

(assert (= (or b!1157305 bm!55363) bm!55365))

(assert (= (and b!1157298 c!115220) b!1157303))

(assert (= (and b!1157298 (not c!115220)) b!1157297))

(assert (= (and b!1157298 res!768561) b!1157302))

(assert (= (and b!1157316 res!768567) b!1157301))

(assert (= (and b!1157310 condMapEmpty!45350) mapIsEmpty!45350))

(assert (= (and b!1157310 (not condMapEmpty!45350)) mapNonEmpty!45350))

(get-info :version)

(assert (= (and mapNonEmpty!45350 ((_ is ValueCellFull!13799) mapValue!45350)) b!1157294))

(assert (= (and b!1157310 ((_ is ValueCellFull!13799) mapDefault!45350)) b!1157304))

(assert (= start!98876 b!1157310))

(declare-fun b_lambda!19575 () Bool)

(assert (=> (not b_lambda!19575) (not b!1157313)))

(declare-fun t!36810 () Bool)

(declare-fun tb!9291 () Bool)

(assert (=> (and start!98876 (= defaultEntry!1004 defaultEntry!1004) t!36810) tb!9291))

(declare-fun result!19155 () Bool)

(assert (=> tb!9291 (= result!19155 tp_is_empty!29017)))

(assert (=> b!1157313 t!36810))

(declare-fun b_and!39803 () Bool)

(assert (= b_and!39801 (and (=> t!36810 result!19155) b_and!39803)))

(declare-fun m!1066155 () Bool)

(assert (=> b!1157308 m!1066155))

(declare-fun m!1066157 () Bool)

(assert (=> start!98876 m!1066157))

(declare-fun m!1066159 () Bool)

(assert (=> start!98876 m!1066159))

(declare-fun m!1066161 () Bool)

(assert (=> b!1157300 m!1066161))

(declare-fun m!1066163 () Bool)

(assert (=> b!1157300 m!1066163))

(declare-fun m!1066165 () Bool)

(assert (=> mapNonEmpty!45350 m!1066165))

(declare-fun m!1066167 () Bool)

(assert (=> b!1157313 m!1066167))

(declare-fun m!1066169 () Bool)

(assert (=> b!1157313 m!1066169))

(declare-fun m!1066171 () Bool)

(assert (=> b!1157313 m!1066171))

(declare-fun m!1066173 () Bool)

(assert (=> b!1157313 m!1066173))

(declare-fun m!1066175 () Bool)

(assert (=> bm!55364 m!1066175))

(declare-fun m!1066177 () Bool)

(assert (=> b!1157315 m!1066177))

(declare-fun m!1066179 () Bool)

(assert (=> b!1157295 m!1066179))

(declare-fun m!1066181 () Bool)

(assert (=> b!1157295 m!1066181))

(declare-fun m!1066183 () Bool)

(assert (=> b!1157303 m!1066183))

(declare-fun m!1066185 () Bool)

(assert (=> b!1157318 m!1066185))

(declare-fun m!1066187 () Bool)

(assert (=> b!1157307 m!1066187))

(declare-fun m!1066189 () Bool)

(assert (=> b!1157305 m!1066189))

(assert (=> b!1157305 m!1066189))

(declare-fun m!1066191 () Bool)

(assert (=> b!1157305 m!1066191))

(declare-fun m!1066193 () Bool)

(assert (=> b!1157305 m!1066193))

(declare-fun m!1066195 () Bool)

(assert (=> b!1157290 m!1066195))

(declare-fun m!1066197 () Bool)

(assert (=> b!1157301 m!1066197))

(declare-fun m!1066199 () Bool)

(assert (=> bm!55366 m!1066199))

(declare-fun m!1066201 () Bool)

(assert (=> b!1157317 m!1066201))

(declare-fun m!1066203 () Bool)

(assert (=> b!1157291 m!1066203))

(declare-fun m!1066205 () Bool)

(assert (=> b!1157291 m!1066205))

(declare-fun m!1066207 () Bool)

(assert (=> b!1157309 m!1066207))

(assert (=> bm!55367 m!1066197))

(declare-fun m!1066209 () Bool)

(assert (=> b!1157298 m!1066209))

(declare-fun m!1066211 () Bool)

(assert (=> b!1157298 m!1066211))

(declare-fun m!1066213 () Bool)

(assert (=> b!1157298 m!1066213))

(declare-fun m!1066215 () Bool)

(assert (=> b!1157298 m!1066215))

(assert (=> b!1157316 m!1066199))

(declare-fun m!1066217 () Bool)

(assert (=> b!1157316 m!1066217))

(declare-fun m!1066219 () Bool)

(assert (=> b!1157316 m!1066219))

(declare-fun m!1066221 () Bool)

(assert (=> b!1157316 m!1066221))

(declare-fun m!1066223 () Bool)

(assert (=> b!1157316 m!1066223))

(assert (=> b!1157316 m!1066179))

(declare-fun m!1066225 () Bool)

(assert (=> b!1157316 m!1066225))

(declare-fun m!1066227 () Bool)

(assert (=> b!1157316 m!1066227))

(assert (=> b!1157316 m!1066179))

(assert (=> b!1157316 m!1066219))

(assert (=> b!1157316 m!1066227))

(assert (=> b!1157316 m!1066179))

(declare-fun m!1066229 () Bool)

(assert (=> b!1157316 m!1066229))

(assert (=> b!1157302 m!1066183))

(declare-fun m!1066231 () Bool)

(assert (=> bm!55360 m!1066231))

(declare-fun m!1066233 () Bool)

(assert (=> bm!55365 m!1066233))

(check-sat (not b!1157300) (not b!1157298) (not b!1157317) (not b!1157309) (not bm!55364) b_and!39803 (not b!1157313) (not b!1157302) (not b!1157316) (not b!1157303) (not b!1157291) (not b!1157290) (not bm!55367) (not bm!55366) (not b!1157295) (not b!1157308) (not b!1157301) (not b!1157307) tp_is_empty!29017 (not b!1157315) (not mapNonEmpty!45350) (not bm!55365) (not b_next!24487) (not b_lambda!19575) (not bm!55360) (not b!1157305) (not start!98876))
(check-sat b_and!39803 (not b_next!24487))
