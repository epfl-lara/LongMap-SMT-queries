; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98712 () Bool)

(assert start!98712)

(declare-fun b_free!24317 () Bool)

(declare-fun b_next!24317 () Bool)

(assert (=> start!98712 (= b_free!24317 (not b_next!24317))))

(declare-fun tp!85662 () Bool)

(declare-fun b_and!39483 () Bool)

(assert (=> start!98712 (= tp!85662 b_and!39483)))

(declare-fun b!1149594 () Bool)

(declare-fun e!653877 () Bool)

(declare-fun e!653874 () Bool)

(assert (=> b!1149594 (= e!653877 (not e!653874))))

(declare-fun res!764811 () Bool)

(assert (=> b!1149594 (=> res!764811 e!653874)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149594 (= res!764811 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74541 0))(
  ( (array!74542 (arr!35921 (Array (_ BitVec 32) (_ BitVec 64))) (size!36457 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74541)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149594 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37792 0))(
  ( (Unit!37793) )
))
(declare-fun lt!514200 () Unit!37792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74541 (_ BitVec 64) (_ BitVec 32)) Unit!37792)

(assert (=> b!1149594 (= lt!514200 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!53343 () Bool)

(declare-fun call!53352 () Bool)

(declare-fun call!53349 () Bool)

(assert (=> bm!53343 (= call!53352 call!53349)))

(declare-fun bm!53344 () Bool)

(declare-fun call!53348 () Unit!37792)

(declare-fun call!53351 () Unit!37792)

(assert (=> bm!53344 (= call!53348 call!53351)))

(declare-fun b!1149595 () Bool)

(declare-fun res!764799 () Bool)

(declare-fun e!653876 () Bool)

(assert (=> b!1149595 (=> (not res!764799) (not e!653876))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149595 (= res!764799 (validMask!0 mask!1564))))

(declare-fun b!1149596 () Bool)

(declare-fun e!653879 () Unit!37792)

(declare-fun Unit!37794 () Unit!37792)

(assert (=> b!1149596 (= e!653879 Unit!37794)))

(declare-fun b!1149597 () Bool)

(declare-fun res!764807 () Bool)

(assert (=> b!1149597 (=> (not res!764807) (not e!653876))))

(assert (=> b!1149597 (= res!764807 (= (select (arr!35921 _keys!1208) i!673) k!934))))

(declare-fun b!1149598 () Bool)

(declare-fun e!653870 () Bool)

(declare-fun tp_is_empty!28847 () Bool)

(assert (=> b!1149598 (= e!653870 tp_is_empty!28847)))

(declare-fun b!1149599 () Bool)

(declare-fun e!653869 () Bool)

(declare-fun e!653873 () Bool)

(assert (=> b!1149599 (= e!653869 e!653873)))

(declare-fun res!764802 () Bool)

(assert (=> b!1149599 (=> res!764802 e!653873)))

(assert (=> b!1149599 (= res!764802 (not (= (select (arr!35921 _keys!1208) from!1455) k!934)))))

(declare-fun e!653872 () Bool)

(assert (=> b!1149599 e!653872))

(declare-fun c!113711 () Bool)

(assert (=> b!1149599 (= c!113711 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43589 0))(
  ( (V!43590 (val!14480 Int)) )
))
(declare-fun zeroValue!944 () V!43589)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!514196 () Unit!37792)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13714 0))(
  ( (ValueCellFull!13714 (v!17117 V!43589)) (EmptyCell!13714) )
))
(declare-datatypes ((array!74543 0))(
  ( (array!74544 (arr!35922 (Array (_ BitVec 32) ValueCell!13714)) (size!36458 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74543)

(declare-fun minValue!944 () V!43589)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!556 (array!74541 array!74543 (_ BitVec 32) (_ BitVec 32) V!43589 V!43589 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37792)

(assert (=> b!1149599 (= lt!514196 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!18372 0))(
  ( (tuple2!18373 (_1!9197 (_ BitVec 64)) (_2!9197 V!43589)) )
))
(declare-datatypes ((List!25121 0))(
  ( (Nil!25118) (Cons!25117 (h!26326 tuple2!18372) (t!36430 List!25121)) )
))
(declare-datatypes ((ListLongMap!16341 0))(
  ( (ListLongMap!16342 (toList!8186 List!25121)) )
))
(declare-fun call!53350 () ListLongMap!16341)

(declare-fun call!53346 () ListLongMap!16341)

(declare-fun b!1149600 () Bool)

(declare-fun -!1320 (ListLongMap!16341 (_ BitVec 64)) ListLongMap!16341)

(assert (=> b!1149600 (= e!653872 (= call!53350 (-!1320 call!53346 k!934)))))

(declare-fun lt!514211 () array!74543)

(declare-fun b!1149601 () Bool)

(declare-fun lt!514204 () ListLongMap!16341)

(declare-fun lt!514212 () array!74541)

(declare-fun e!653883 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4659 (array!74541 array!74543 (_ BitVec 32) (_ BitVec 32) V!43589 V!43589 (_ BitVec 32) Int) ListLongMap!16341)

(assert (=> b!1149601 (= e!653883 (= lt!514204 (getCurrentListMapNoExtraKeys!4659 lt!514212 lt!514211 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149602 () Bool)

(declare-fun res!764810 () Bool)

(assert (=> b!1149602 (=> (not res!764810) (not e!653876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149602 (= res!764810 (validKeyInArray!0 k!934))))

(declare-fun b!1149603 () Bool)

(assert (=> b!1149603 call!53352))

(declare-fun lt!514209 () Unit!37792)

(assert (=> b!1149603 (= lt!514209 call!53348)))

(assert (=> b!1149603 (= e!653879 lt!514209)))

(declare-fun mapIsEmpty!45095 () Bool)

(declare-fun mapRes!45095 () Bool)

(assert (=> mapIsEmpty!45095 mapRes!45095))

(declare-fun b!1149604 () Bool)

(declare-fun res!764808 () Bool)

(assert (=> b!1149604 (=> (not res!764808) (not e!653876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74541 (_ BitVec 32)) Bool)

(assert (=> b!1149604 (= res!764808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53345 () Bool)

(assert (=> bm!53345 (= call!53346 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149605 () Bool)

(declare-fun res!764801 () Bool)

(assert (=> b!1149605 (=> (not res!764801) (not e!653876))))

(assert (=> b!1149605 (= res!764801 (and (= (size!36458 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36457 _keys!1208) (size!36458 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53346 () Bool)

(assert (=> bm!53346 (= call!53350 (getCurrentListMapNoExtraKeys!4659 lt!514212 lt!514211 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149606 () Bool)

(assert (=> b!1149606 (= e!653874 e!653869)))

(declare-fun res!764803 () Bool)

(assert (=> b!1149606 (=> res!764803 e!653869)))

(assert (=> b!1149606 (= res!764803 (not (= from!1455 i!673)))))

(declare-fun lt!514199 () ListLongMap!16341)

(assert (=> b!1149606 (= lt!514199 (getCurrentListMapNoExtraKeys!4659 lt!514212 lt!514211 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514201 () V!43589)

(assert (=> b!1149606 (= lt!514211 (array!74544 (store (arr!35922 _values!996) i!673 (ValueCellFull!13714 lt!514201)) (size!36458 _values!996)))))

(declare-fun dynLambda!2684 (Int (_ BitVec 64)) V!43589)

(assert (=> b!1149606 (= lt!514201 (dynLambda!2684 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514215 () ListLongMap!16341)

(assert (=> b!1149606 (= lt!514215 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53347 () Bool)

(declare-fun call!53353 () ListLongMap!16341)

(declare-fun call!53347 () ListLongMap!16341)

(assert (=> bm!53347 (= call!53353 call!53347)))

(declare-fun e!653875 () Bool)

(declare-fun b!1149607 () Bool)

(assert (=> b!1149607 (= e!653875 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149608 () Bool)

(declare-fun e!653878 () Bool)

(assert (=> b!1149608 (= e!653878 tp_is_empty!28847)))

(declare-fun mapNonEmpty!45095 () Bool)

(declare-fun tp!85661 () Bool)

(assert (=> mapNonEmpty!45095 (= mapRes!45095 (and tp!85661 e!653870))))

(declare-fun mapRest!45095 () (Array (_ BitVec 32) ValueCell!13714))

(declare-fun mapKey!45095 () (_ BitVec 32))

(declare-fun mapValue!45095 () ValueCell!13714)

(assert (=> mapNonEmpty!45095 (= (arr!35922 _values!996) (store mapRest!45095 mapKey!45095 mapValue!45095))))

(declare-fun b!1149609 () Bool)

(declare-fun res!764804 () Bool)

(assert (=> b!1149609 (=> (not res!764804) (not e!653876))))

(declare-datatypes ((List!25122 0))(
  ( (Nil!25119) (Cons!25118 (h!26327 (_ BitVec 64)) (t!36431 List!25122)) )
))
(declare-fun arrayNoDuplicates!0 (array!74541 (_ BitVec 32) List!25122) Bool)

(assert (=> b!1149609 (= res!764804 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25119))))

(declare-fun b!1149610 () Bool)

(declare-fun res!764812 () Bool)

(assert (=> b!1149610 (=> (not res!764812) (not e!653876))))

(assert (=> b!1149610 (= res!764812 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36457 _keys!1208))))))

(declare-fun b!1149611 () Bool)

(declare-fun e!653882 () Unit!37792)

(declare-fun lt!514210 () Unit!37792)

(assert (=> b!1149611 (= e!653882 lt!514210)))

(assert (=> b!1149611 (= lt!514210 call!53348)))

(assert (=> b!1149611 call!53352))

(declare-fun b!1149612 () Bool)

(assert (=> b!1149612 (= e!653872 (= call!53350 call!53346))))

(declare-fun b!1149613 () Bool)

(assert (=> b!1149613 (= e!653873 true)))

(assert (=> b!1149613 e!653883))

(declare-fun res!764800 () Bool)

(assert (=> b!1149613 (=> (not res!764800) (not e!653883))))

(declare-fun lt!514202 () ListLongMap!16341)

(assert (=> b!1149613 (= res!764800 (= lt!514204 lt!514202))))

(assert (=> b!1149613 (= lt!514204 (-!1320 lt!514215 k!934))))

(declare-fun lt!514197 () V!43589)

(declare-fun +!3607 (ListLongMap!16341 tuple2!18372) ListLongMap!16341)

(assert (=> b!1149613 (= (-!1320 (+!3607 lt!514202 (tuple2!18373 (select (arr!35921 _keys!1208) from!1455) lt!514197)) (select (arr!35921 _keys!1208) from!1455)) lt!514202)))

(declare-fun lt!514195 () Unit!37792)

(declare-fun addThenRemoveForNewKeyIsSame!164 (ListLongMap!16341 (_ BitVec 64) V!43589) Unit!37792)

(assert (=> b!1149613 (= lt!514195 (addThenRemoveForNewKeyIsSame!164 lt!514202 (select (arr!35921 _keys!1208) from!1455) lt!514197))))

(declare-fun get!18282 (ValueCell!13714 V!43589) V!43589)

(assert (=> b!1149613 (= lt!514197 (get!18282 (select (arr!35922 _values!996) from!1455) lt!514201))))

(declare-fun lt!514198 () Unit!37792)

(declare-fun e!653880 () Unit!37792)

(assert (=> b!1149613 (= lt!514198 e!653880)))

(declare-fun c!113714 () Bool)

(declare-fun contains!6707 (ListLongMap!16341 (_ BitVec 64)) Bool)

(assert (=> b!1149613 (= c!113714 (contains!6707 lt!514202 k!934))))

(assert (=> b!1149613 (= lt!514202 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53348 () Bool)

(declare-fun c!113716 () Bool)

(declare-fun c!113712 () Bool)

(assert (=> bm!53348 (= call!53347 (+!3607 lt!514202 (ite (or c!113716 c!113712) (tuple2!18373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149614 () Bool)

(declare-fun e!653867 () Bool)

(declare-fun lt!514206 () Bool)

(assert (=> b!1149614 (= e!653867 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514206) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149615 () Bool)

(declare-fun lt!514205 () ListLongMap!16341)

(assert (=> b!1149615 (contains!6707 (+!3607 lt!514205 (tuple2!18373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!514194 () Unit!37792)

(declare-fun addStillContains!857 (ListLongMap!16341 (_ BitVec 64) V!43589 (_ BitVec 64)) Unit!37792)

(assert (=> b!1149615 (= lt!514194 (addStillContains!857 lt!514205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1149615 call!53349))

(assert (=> b!1149615 (= lt!514205 call!53347)))

(declare-fun lt!514203 () Unit!37792)

(assert (=> b!1149615 (= lt!514203 call!53351)))

(declare-fun e!653868 () Unit!37792)

(assert (=> b!1149615 (= e!653868 lt!514194)))

(declare-fun b!1149616 () Bool)

(declare-fun Unit!37795 () Unit!37792)

(assert (=> b!1149616 (= e!653880 Unit!37795)))

(assert (=> b!1149616 (= lt!514206 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149616 (= c!113716 (and (not lt!514206) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514213 () Unit!37792)

(assert (=> b!1149616 (= lt!514213 e!653868)))

(declare-fun lt!514208 () Unit!37792)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!449 (array!74541 array!74543 (_ BitVec 32) (_ BitVec 32) V!43589 V!43589 (_ BitVec 64) (_ BitVec 32) Int) Unit!37792)

(assert (=> b!1149616 (= lt!514208 (lemmaListMapContainsThenArrayContainsFrom!449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113713 () Bool)

(assert (=> b!1149616 (= c!113713 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764809 () Bool)

(assert (=> b!1149616 (= res!764809 e!653867)))

(assert (=> b!1149616 (=> (not res!764809) (not e!653875))))

(assert (=> b!1149616 e!653875))

(declare-fun lt!514214 () Unit!37792)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74541 (_ BitVec 32) (_ BitVec 32)) Unit!37792)

(assert (=> b!1149616 (= lt!514214 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149616 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25119)))

(declare-fun lt!514207 () Unit!37792)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74541 (_ BitVec 64) (_ BitVec 32) List!25122) Unit!37792)

(assert (=> b!1149616 (= lt!514207 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25119))))

(assert (=> b!1149616 false))

(declare-fun b!1149617 () Bool)

(assert (=> b!1149617 (= e!653876 e!653877)))

(declare-fun res!764813 () Bool)

(assert (=> b!1149617 (=> (not res!764813) (not e!653877))))

(assert (=> b!1149617 (= res!764813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514212 mask!1564))))

(assert (=> b!1149617 (= lt!514212 (array!74542 (store (arr!35921 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36457 _keys!1208)))))

(declare-fun b!1149618 () Bool)

(assert (=> b!1149618 (= c!113712 (and (not lt!514206) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149618 (= e!653868 e!653882)))

(declare-fun bm!53349 () Bool)

(assert (=> bm!53349 (= call!53351 (addStillContains!857 lt!514202 (ite (or c!113716 c!113712) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113716 c!113712) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1149619 () Bool)

(declare-fun Unit!37796 () Unit!37792)

(assert (=> b!1149619 (= e!653880 Unit!37796)))

(declare-fun b!1149620 () Bool)

(declare-fun res!764805 () Bool)

(assert (=> b!1149620 (=> (not res!764805) (not e!653877))))

(assert (=> b!1149620 (= res!764805 (arrayNoDuplicates!0 lt!514212 #b00000000000000000000000000000000 Nil!25119))))

(declare-fun b!1149621 () Bool)

(assert (=> b!1149621 (= e!653867 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149622 () Bool)

(assert (=> b!1149622 (= e!653882 e!653879)))

(declare-fun c!113715 () Bool)

(assert (=> b!1149622 (= c!113715 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514206))))

(declare-fun bm!53350 () Bool)

(assert (=> bm!53350 (= call!53349 (contains!6707 (ite c!113716 lt!514205 call!53353) k!934))))

(declare-fun b!1149623 () Bool)

(declare-fun e!653881 () Bool)

(assert (=> b!1149623 (= e!653881 (and e!653878 mapRes!45095))))

(declare-fun condMapEmpty!45095 () Bool)

(declare-fun mapDefault!45095 () ValueCell!13714)

