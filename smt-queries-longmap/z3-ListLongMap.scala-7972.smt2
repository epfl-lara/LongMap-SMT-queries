; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98908 () Bool)

(assert start!98908)

(declare-fun b_free!24277 () Bool)

(declare-fun b_next!24277 () Bool)

(assert (=> start!98908 (= b_free!24277 (not b_next!24277))))

(declare-fun tp!85541 () Bool)

(declare-fun b_and!39405 () Bool)

(assert (=> start!98908 (= tp!85541 b_and!39405)))

(declare-fun b!1149043 () Bool)

(declare-datatypes ((Unit!37690 0))(
  ( (Unit!37691) )
))
(declare-fun e!653692 () Unit!37690)

(declare-fun Unit!37692 () Unit!37690)

(assert (=> b!1149043 (= e!653692 Unit!37692)))

(declare-fun b!1149044 () Bool)

(declare-fun e!653693 () Unit!37690)

(declare-fun lt!513410 () Unit!37690)

(assert (=> b!1149044 (= e!653693 lt!513410)))

(declare-fun call!52936 () Unit!37690)

(assert (=> b!1149044 (= lt!513410 call!52936)))

(declare-fun call!52938 () Bool)

(assert (=> b!1149044 call!52938))

(declare-fun b!1149045 () Bool)

(declare-fun e!653689 () Bool)

(declare-fun e!653688 () Bool)

(assert (=> b!1149045 (= e!653689 e!653688)))

(declare-fun res!764416 () Bool)

(assert (=> b!1149045 (=> res!764416 e!653688)))

(declare-datatypes ((array!74509 0))(
  ( (array!74510 (arr!35899 (Array (_ BitVec 32) (_ BitVec 64))) (size!36436 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74509)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1149045 (= res!764416 (not (= (select (arr!35899 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653694 () Bool)

(assert (=> b!1149045 e!653694))

(declare-fun c!113752 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149045 (= c!113752 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43537 0))(
  ( (V!43538 (val!14460 Int)) )
))
(declare-fun zeroValue!944 () V!43537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13694 0))(
  ( (ValueCellFull!13694 (v!17093 V!43537)) (EmptyCell!13694) )
))
(declare-datatypes ((array!74511 0))(
  ( (array!74512 (arr!35900 (Array (_ BitVec 32) ValueCell!13694)) (size!36437 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74511)

(declare-fun minValue!944 () V!43537)

(declare-fun lt!513405 () Unit!37690)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 (array!74509 array!74511 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37690)

(assert (=> b!1149045 (= lt!513405 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!513414 () Bool)

(declare-fun e!653684 () Bool)

(declare-fun b!1149046 () Bool)

(assert (=> b!1149046 (= e!653684 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513414) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149047 () Bool)

(declare-fun res!764412 () Bool)

(declare-fun e!653681 () Bool)

(assert (=> b!1149047 (=> (not res!764412) (not e!653681))))

(declare-fun lt!513420 () array!74509)

(declare-datatypes ((List!25102 0))(
  ( (Nil!25099) (Cons!25098 (h!26316 (_ BitVec 64)) (t!36363 List!25102)) )
))
(declare-fun arrayNoDuplicates!0 (array!74509 (_ BitVec 32) List!25102) Bool)

(assert (=> b!1149047 (= res!764412 (arrayNoDuplicates!0 lt!513420 #b00000000000000000000000000000000 Nil!25099))))

(declare-fun b!1149048 () Bool)

(declare-datatypes ((tuple2!18348 0))(
  ( (tuple2!18349 (_1!9185 (_ BitVec 64)) (_2!9185 V!43537)) )
))
(declare-datatypes ((List!25103 0))(
  ( (Nil!25100) (Cons!25099 (h!26317 tuple2!18348) (t!36364 List!25103)) )
))
(declare-datatypes ((ListLongMap!16325 0))(
  ( (ListLongMap!16326 (toList!8178 List!25103)) )
))
(declare-fun lt!513409 () ListLongMap!16325)

(declare-fun contains!6716 (ListLongMap!16325 (_ BitVec 64)) Bool)

(declare-fun +!3618 (ListLongMap!16325 tuple2!18348) ListLongMap!16325)

(assert (=> b!1149048 (contains!6716 (+!3618 lt!513409 (tuple2!18349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513408 () Unit!37690)

(declare-fun addStillContains!843 (ListLongMap!16325 (_ BitVec 64) V!43537 (_ BitVec 64)) Unit!37690)

(assert (=> b!1149048 (= lt!513408 (addStillContains!843 lt!513409 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52933 () Bool)

(assert (=> b!1149048 call!52933))

(declare-fun call!52935 () ListLongMap!16325)

(assert (=> b!1149048 (= lt!513409 call!52935)))

(declare-fun lt!513402 () Unit!37690)

(declare-fun call!52937 () Unit!37690)

(assert (=> b!1149048 (= lt!513402 call!52937)))

(declare-fun e!653683 () Unit!37690)

(assert (=> b!1149048 (= e!653683 lt!513408)))

(declare-fun mapIsEmpty!45035 () Bool)

(declare-fun mapRes!45035 () Bool)

(assert (=> mapIsEmpty!45035 mapRes!45035))

(declare-fun b!1149049 () Bool)

(assert (=> b!1149049 call!52938))

(declare-fun lt!513412 () Unit!37690)

(assert (=> b!1149049 (= lt!513412 call!52936)))

(declare-fun e!653687 () Unit!37690)

(assert (=> b!1149049 (= e!653687 lt!513412)))

(declare-fun b!1149050 () Bool)

(declare-fun res!764420 () Bool)

(declare-fun e!653679 () Bool)

(assert (=> b!1149050 (=> (not res!764420) (not e!653679))))

(assert (=> b!1149050 (= res!764420 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36436 _keys!1208))))))

(declare-fun b!1149051 () Bool)

(declare-fun e!653680 () Bool)

(declare-fun tp_is_empty!28807 () Bool)

(assert (=> b!1149051 (= e!653680 tp_is_empty!28807)))

(declare-fun b!1149052 () Bool)

(declare-fun e!653695 () Bool)

(assert (=> b!1149052 (= e!653695 e!653689)))

(declare-fun res!764421 () Bool)

(assert (=> b!1149052 (=> res!764421 e!653689)))

(assert (=> b!1149052 (= res!764421 (not (= from!1455 i!673)))))

(declare-fun lt!513411 () ListLongMap!16325)

(declare-fun lt!513404 () array!74511)

(declare-fun getCurrentListMapNoExtraKeys!4681 (array!74509 array!74511 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 32) Int) ListLongMap!16325)

(assert (=> b!1149052 (= lt!513411 (getCurrentListMapNoExtraKeys!4681 lt!513420 lt!513404 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513421 () V!43537)

(assert (=> b!1149052 (= lt!513404 (array!74512 (store (arr!35900 _values!996) i!673 (ValueCellFull!13694 lt!513421)) (size!36437 _values!996)))))

(declare-fun dynLambda!2708 (Int (_ BitVec 64)) V!43537)

(assert (=> b!1149052 (= lt!513421 (dynLambda!2708 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513407 () ListLongMap!16325)

(assert (=> b!1149052 (= lt!513407 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52928 () Bool)

(declare-fun call!52932 () ListLongMap!16325)

(assert (=> bm!52928 (= call!52932 call!52935)))

(declare-fun b!1149053 () Bool)

(declare-fun res!764411 () Bool)

(assert (=> b!1149053 (=> (not res!764411) (not e!653679))))

(assert (=> b!1149053 (= res!764411 (and (= (size!36437 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36436 _keys!1208) (size!36437 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149054 () Bool)

(declare-fun e!653682 () Bool)

(declare-fun e!653690 () Bool)

(assert (=> b!1149054 (= e!653682 (and e!653690 mapRes!45035))))

(declare-fun condMapEmpty!45035 () Bool)

(declare-fun mapDefault!45035 () ValueCell!13694)

(assert (=> b!1149054 (= condMapEmpty!45035 (= (arr!35900 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13694)) mapDefault!45035)))))

(declare-fun b!1149055 () Bool)

(declare-fun arrayContainsKey!0 (array!74509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149055 (= e!653684 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149056 () Bool)

(assert (=> b!1149056 (= e!653679 e!653681)))

(declare-fun res!764409 () Bool)

(assert (=> b!1149056 (=> (not res!764409) (not e!653681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74509 (_ BitVec 32)) Bool)

(assert (=> b!1149056 (= res!764409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513420 mask!1564))))

(assert (=> b!1149056 (= lt!513420 (array!74510 (store (arr!35899 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36436 _keys!1208)))))

(declare-fun b!1149057 () Bool)

(declare-fun res!764414 () Bool)

(assert (=> b!1149057 (=> (not res!764414) (not e!653679))))

(assert (=> b!1149057 (= res!764414 (= (select (arr!35899 _keys!1208) i!673) k0!934))))

(declare-fun b!1149058 () Bool)

(declare-fun Unit!37693 () Unit!37690)

(assert (=> b!1149058 (= e!653687 Unit!37693)))

(declare-fun b!1149059 () Bool)

(declare-fun e!653686 () Bool)

(assert (=> b!1149059 (= e!653686 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149060 () Bool)

(assert (=> b!1149060 (= e!653690 tp_is_empty!28807)))

(declare-fun b!1149061 () Bool)

(declare-fun call!52934 () ListLongMap!16325)

(declare-fun call!52931 () ListLongMap!16325)

(declare-fun -!1302 (ListLongMap!16325 (_ BitVec 64)) ListLongMap!16325)

(assert (=> b!1149061 (= e!653694 (= call!52931 (-!1302 call!52934 k0!934)))))

(declare-fun b!1149062 () Bool)

(declare-fun res!764418 () Bool)

(assert (=> b!1149062 (=> (not res!764418) (not e!653679))))

(assert (=> b!1149062 (= res!764418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!764410 () Bool)

(assert (=> start!98908 (=> (not res!764410) (not e!653679))))

(assert (=> start!98908 (= res!764410 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36436 _keys!1208))))))

(assert (=> start!98908 e!653679))

(assert (=> start!98908 tp_is_empty!28807))

(declare-fun array_inv!27552 (array!74509) Bool)

(assert (=> start!98908 (array_inv!27552 _keys!1208)))

(assert (=> start!98908 true))

(assert (=> start!98908 tp!85541))

(declare-fun array_inv!27553 (array!74511) Bool)

(assert (=> start!98908 (and (array_inv!27553 _values!996) e!653682)))

(declare-fun bm!52929 () Bool)

(declare-fun c!113749 () Bool)

(assert (=> bm!52929 (= call!52933 (contains!6716 (ite c!113749 lt!513409 call!52932) k0!934))))

(declare-fun b!1149063 () Bool)

(assert (=> b!1149063 (= e!653681 (not e!653695))))

(declare-fun res!764413 () Bool)

(assert (=> b!1149063 (=> res!764413 e!653695)))

(assert (=> b!1149063 (= res!764413 (bvsgt from!1455 i!673))))

(assert (=> b!1149063 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513403 () Unit!37690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74509 (_ BitVec 64) (_ BitVec 32)) Unit!37690)

(assert (=> b!1149063 (= lt!513403 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149064 () Bool)

(assert (=> b!1149064 (= e!653693 e!653687)))

(declare-fun c!113751 () Bool)

(assert (=> b!1149064 (= c!113751 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513414))))

(declare-fun bm!52930 () Bool)

(assert (=> bm!52930 (= call!52936 call!52937)))

(declare-fun b!1149065 () Bool)

(declare-fun res!764417 () Bool)

(assert (=> b!1149065 (=> (not res!764417) (not e!653679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149065 (= res!764417 (validMask!0 mask!1564))))

(declare-fun b!1149066 () Bool)

(declare-fun Unit!37694 () Unit!37690)

(assert (=> b!1149066 (= e!653692 Unit!37694)))

(assert (=> b!1149066 (= lt!513414 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149066 (= c!113749 (and (not lt!513414) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513419 () Unit!37690)

(assert (=> b!1149066 (= lt!513419 e!653683)))

(declare-fun lt!513418 () Unit!37690)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!440 (array!74509 array!74511 (_ BitVec 32) (_ BitVec 32) V!43537 V!43537 (_ BitVec 64) (_ BitVec 32) Int) Unit!37690)

(assert (=> b!1149066 (= lt!513418 (lemmaListMapContainsThenArrayContainsFrom!440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113750 () Bool)

(assert (=> b!1149066 (= c!113750 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764407 () Bool)

(assert (=> b!1149066 (= res!764407 e!653684)))

(assert (=> b!1149066 (=> (not res!764407) (not e!653686))))

(assert (=> b!1149066 e!653686))

(declare-fun lt!513413 () Unit!37690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74509 (_ BitVec 32) (_ BitVec 32)) Unit!37690)

(assert (=> b!1149066 (= lt!513413 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149066 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25099)))

(declare-fun lt!513415 () Unit!37690)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74509 (_ BitVec 64) (_ BitVec 32) List!25102) Unit!37690)

(assert (=> b!1149066 (= lt!513415 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25099))))

(assert (=> b!1149066 false))

(declare-fun bm!52931 () Bool)

(assert (=> bm!52931 (= call!52934 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113754 () Bool)

(declare-fun lt!513416 () ListLongMap!16325)

(declare-fun bm!52932 () Bool)

(assert (=> bm!52932 (= call!52935 (+!3618 lt!513416 (ite (or c!113749 c!113754) (tuple2!18349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!52933 () Bool)

(assert (=> bm!52933 (= call!52937 (addStillContains!843 lt!513416 (ite (or c!113749 c!113754) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113749 c!113754) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!52934 () Bool)

(assert (=> bm!52934 (= call!52938 call!52933)))

(declare-fun b!1149067 () Bool)

(declare-fun res!764408 () Bool)

(assert (=> b!1149067 (=> (not res!764408) (not e!653679))))

(assert (=> b!1149067 (= res!764408 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25099))))

(declare-fun bm!52935 () Bool)

(assert (=> bm!52935 (= call!52931 (getCurrentListMapNoExtraKeys!4681 lt!513420 lt!513404 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45035 () Bool)

(declare-fun tp!85542 () Bool)

(assert (=> mapNonEmpty!45035 (= mapRes!45035 (and tp!85542 e!653680))))

(declare-fun mapKey!45035 () (_ BitVec 32))

(declare-fun mapRest!45035 () (Array (_ BitVec 32) ValueCell!13694))

(declare-fun mapValue!45035 () ValueCell!13694)

(assert (=> mapNonEmpty!45035 (= (arr!35900 _values!996) (store mapRest!45035 mapKey!45035 mapValue!45035))))

(declare-fun b!1149068 () Bool)

(assert (=> b!1149068 (= e!653688 true)))

(declare-fun e!653691 () Bool)

(assert (=> b!1149068 e!653691))

(declare-fun res!764419 () Bool)

(assert (=> b!1149068 (=> (not res!764419) (not e!653691))))

(declare-fun lt!513406 () V!43537)

(assert (=> b!1149068 (= res!764419 (= (-!1302 (+!3618 lt!513416 (tuple2!18349 (select (arr!35899 _keys!1208) from!1455) lt!513406)) (select (arr!35899 _keys!1208) from!1455)) lt!513416))))

(declare-fun lt!513417 () Unit!37690)

(declare-fun addThenRemoveForNewKeyIsSame!154 (ListLongMap!16325 (_ BitVec 64) V!43537) Unit!37690)

(assert (=> b!1149068 (= lt!513417 (addThenRemoveForNewKeyIsSame!154 lt!513416 (select (arr!35899 _keys!1208) from!1455) lt!513406))))

(declare-fun get!18291 (ValueCell!13694 V!43537) V!43537)

(assert (=> b!1149068 (= lt!513406 (get!18291 (select (arr!35900 _values!996) from!1455) lt!513421))))

(declare-fun lt!513401 () Unit!37690)

(assert (=> b!1149068 (= lt!513401 e!653692)))

(declare-fun c!113753 () Bool)

(assert (=> b!1149068 (= c!113753 (contains!6716 lt!513416 k0!934))))

(assert (=> b!1149068 (= lt!513416 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149069 () Bool)

(assert (=> b!1149069 (= c!113754 (and (not lt!513414) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149069 (= e!653683 e!653693)))

(declare-fun b!1149070 () Bool)

(assert (=> b!1149070 (= e!653691 (= (-!1302 lt!513407 k0!934) lt!513416))))

(declare-fun b!1149071 () Bool)

(declare-fun res!764415 () Bool)

(assert (=> b!1149071 (=> (not res!764415) (not e!653679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149071 (= res!764415 (validKeyInArray!0 k0!934))))

(declare-fun b!1149072 () Bool)

(assert (=> b!1149072 (= e!653694 (= call!52931 call!52934))))

(assert (= (and start!98908 res!764410) b!1149065))

(assert (= (and b!1149065 res!764417) b!1149053))

(assert (= (and b!1149053 res!764411) b!1149062))

(assert (= (and b!1149062 res!764418) b!1149067))

(assert (= (and b!1149067 res!764408) b!1149050))

(assert (= (and b!1149050 res!764420) b!1149071))

(assert (= (and b!1149071 res!764415) b!1149057))

(assert (= (and b!1149057 res!764414) b!1149056))

(assert (= (and b!1149056 res!764409) b!1149047))

(assert (= (and b!1149047 res!764412) b!1149063))

(assert (= (and b!1149063 (not res!764413)) b!1149052))

(assert (= (and b!1149052 (not res!764421)) b!1149045))

(assert (= (and b!1149045 c!113752) b!1149061))

(assert (= (and b!1149045 (not c!113752)) b!1149072))

(assert (= (or b!1149061 b!1149072) bm!52935))

(assert (= (or b!1149061 b!1149072) bm!52931))

(assert (= (and b!1149045 (not res!764416)) b!1149068))

(assert (= (and b!1149068 c!113753) b!1149066))

(assert (= (and b!1149068 (not c!113753)) b!1149043))

(assert (= (and b!1149066 c!113749) b!1149048))

(assert (= (and b!1149066 (not c!113749)) b!1149069))

(assert (= (and b!1149069 c!113754) b!1149044))

(assert (= (and b!1149069 (not c!113754)) b!1149064))

(assert (= (and b!1149064 c!113751) b!1149049))

(assert (= (and b!1149064 (not c!113751)) b!1149058))

(assert (= (or b!1149044 b!1149049) bm!52930))

(assert (= (or b!1149044 b!1149049) bm!52928))

(assert (= (or b!1149044 b!1149049) bm!52934))

(assert (= (or b!1149048 bm!52934) bm!52929))

(assert (= (or b!1149048 bm!52930) bm!52933))

(assert (= (or b!1149048 bm!52928) bm!52932))

(assert (= (and b!1149066 c!113750) b!1149055))

(assert (= (and b!1149066 (not c!113750)) b!1149046))

(assert (= (and b!1149066 res!764407) b!1149059))

(assert (= (and b!1149068 res!764419) b!1149070))

(assert (= (and b!1149054 condMapEmpty!45035) mapIsEmpty!45035))

(assert (= (and b!1149054 (not condMapEmpty!45035)) mapNonEmpty!45035))

(get-info :version)

(assert (= (and mapNonEmpty!45035 ((_ is ValueCellFull!13694) mapValue!45035)) b!1149051))

(assert (= (and b!1149054 ((_ is ValueCellFull!13694) mapDefault!45035)) b!1149060))

(assert (= start!98908 b!1149054))

(declare-fun b_lambda!19377 () Bool)

(assert (=> (not b_lambda!19377) (not b!1149052)))

(declare-fun t!36362 () Bool)

(declare-fun tb!9081 () Bool)

(assert (=> (and start!98908 (= defaultEntry!1004 defaultEntry!1004) t!36362) tb!9081))

(declare-fun result!18735 () Bool)

(assert (=> tb!9081 (= result!18735 tp_is_empty!28807)))

(assert (=> b!1149052 t!36362))

(declare-fun b_and!39407 () Bool)

(assert (= b_and!39405 (and (=> t!36362 result!18735) b_and!39407)))

(declare-fun m!1059913 () Bool)

(assert (=> b!1149052 m!1059913))

(declare-fun m!1059915 () Bool)

(assert (=> b!1149052 m!1059915))

(declare-fun m!1059917 () Bool)

(assert (=> b!1149052 m!1059917))

(declare-fun m!1059919 () Bool)

(assert (=> b!1149052 m!1059919))

(declare-fun m!1059921 () Bool)

(assert (=> bm!52932 m!1059921))

(declare-fun m!1059923 () Bool)

(assert (=> bm!52933 m!1059923))

(declare-fun m!1059925 () Bool)

(assert (=> b!1149071 m!1059925))

(declare-fun m!1059927 () Bool)

(assert (=> bm!52935 m!1059927))

(declare-fun m!1059929 () Bool)

(assert (=> bm!52931 m!1059929))

(declare-fun m!1059931 () Bool)

(assert (=> mapNonEmpty!45035 m!1059931))

(declare-fun m!1059933 () Bool)

(assert (=> start!98908 m!1059933))

(declare-fun m!1059935 () Bool)

(assert (=> start!98908 m!1059935))

(assert (=> b!1149068 m!1059929))

(declare-fun m!1059937 () Bool)

(assert (=> b!1149068 m!1059937))

(assert (=> b!1149068 m!1059937))

(declare-fun m!1059939 () Bool)

(assert (=> b!1149068 m!1059939))

(declare-fun m!1059941 () Bool)

(assert (=> b!1149068 m!1059941))

(declare-fun m!1059943 () Bool)

(assert (=> b!1149068 m!1059943))

(declare-fun m!1059945 () Bool)

(assert (=> b!1149068 m!1059945))

(assert (=> b!1149068 m!1059939))

(declare-fun m!1059947 () Bool)

(assert (=> b!1149068 m!1059947))

(assert (=> b!1149068 m!1059939))

(assert (=> b!1149068 m!1059943))

(declare-fun m!1059949 () Bool)

(assert (=> b!1149068 m!1059949))

(declare-fun m!1059951 () Bool)

(assert (=> b!1149065 m!1059951))

(declare-fun m!1059953 () Bool)

(assert (=> b!1149062 m!1059953))

(declare-fun m!1059955 () Bool)

(assert (=> b!1149048 m!1059955))

(assert (=> b!1149048 m!1059955))

(declare-fun m!1059957 () Bool)

(assert (=> b!1149048 m!1059957))

(declare-fun m!1059959 () Bool)

(assert (=> b!1149048 m!1059959))

(declare-fun m!1059961 () Bool)

(assert (=> b!1149056 m!1059961))

(declare-fun m!1059963 () Bool)

(assert (=> b!1149056 m!1059963))

(declare-fun m!1059965 () Bool)

(assert (=> b!1149070 m!1059965))

(assert (=> b!1149045 m!1059939))

(declare-fun m!1059967 () Bool)

(assert (=> b!1149045 m!1059967))

(declare-fun m!1059969 () Bool)

(assert (=> b!1149061 m!1059969))

(declare-fun m!1059971 () Bool)

(assert (=> b!1149066 m!1059971))

(declare-fun m!1059973 () Bool)

(assert (=> b!1149066 m!1059973))

(declare-fun m!1059975 () Bool)

(assert (=> b!1149066 m!1059975))

(declare-fun m!1059977 () Bool)

(assert (=> b!1149066 m!1059977))

(declare-fun m!1059979 () Bool)

(assert (=> b!1149055 m!1059979))

(declare-fun m!1059981 () Bool)

(assert (=> b!1149047 m!1059981))

(declare-fun m!1059983 () Bool)

(assert (=> b!1149057 m!1059983))

(declare-fun m!1059985 () Bool)

(assert (=> b!1149063 m!1059985))

(declare-fun m!1059987 () Bool)

(assert (=> b!1149063 m!1059987))

(declare-fun m!1059989 () Bool)

(assert (=> b!1149067 m!1059989))

(declare-fun m!1059991 () Bool)

(assert (=> bm!52929 m!1059991))

(assert (=> b!1149059 m!1059979))

(check-sat (not bm!52929) (not bm!52931) (not b_next!24277) (not b!1149056) (not mapNonEmpty!45035) (not bm!52935) (not b!1149066) (not b!1149047) tp_is_empty!28807 (not b!1149062) b_and!39407 (not b!1149059) (not b!1149063) (not b!1149052) (not b!1149048) (not b_lambda!19377) (not bm!52932) (not b!1149071) (not b!1149068) (not bm!52933) (not b!1149065) (not b!1149055) (not b!1149067) (not b!1149061) (not b!1149070) (not start!98908) (not b!1149045))
(check-sat b_and!39407 (not b_next!24277))
