; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98982 () Bool)

(assert start!98982)

(declare-fun b_free!24587 () Bool)

(declare-fun b_next!24587 () Bool)

(assert (=> start!98982 (= b_free!24587 (not b_next!24587))))

(declare-fun tp!86472 () Bool)

(declare-fun b_and!40023 () Bool)

(assert (=> start!98982 (= tp!86472 b_and!40023)))

(declare-fun b!1162014 () Bool)

(declare-fun e!660761 () Bool)

(declare-fun e!660754 () Bool)

(assert (=> b!1162014 (= e!660761 e!660754)))

(declare-fun res!770878 () Bool)

(assert (=> b!1162014 (=> res!770878 e!660754)))

(declare-datatypes ((array!75073 0))(
  ( (array!75074 (arr!36187 (Array (_ BitVec 32) (_ BitVec 64))) (size!36723 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75073)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1162014 (= res!770878 (not (= (select (arr!36187 _keys!1208) from!1455) k!934)))))

(declare-fun e!660759 () Bool)

(assert (=> b!1162014 e!660759))

(declare-fun c!116145 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162014 (= c!116145 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43949 0))(
  ( (V!43950 (val!14615 Int)) )
))
(declare-fun zeroValue!944 () V!43949)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!38329 0))(
  ( (Unit!38330) )
))
(declare-fun lt!523116 () Unit!38329)

(declare-datatypes ((ValueCell!13849 0))(
  ( (ValueCellFull!13849 (v!17252 V!43949)) (EmptyCell!13849) )
))
(declare-datatypes ((array!75075 0))(
  ( (array!75076 (arr!36188 (Array (_ BitVec 32) ValueCell!13849)) (size!36724 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75075)

(declare-fun minValue!944 () V!43949)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!649 (array!75073 array!75075 (_ BitVec 32) (_ BitVec 32) V!43949 V!43949 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38329)

(assert (=> b!1162014 (= lt!523116 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!649 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162015 () Bool)

(declare-fun res!770887 () Bool)

(declare-fun e!660753 () Bool)

(assert (=> b!1162015 (=> (not res!770887) (not e!660753))))

(assert (=> b!1162015 (= res!770887 (and (= (size!36724 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36723 _keys!1208) (size!36724 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162016 () Bool)

(declare-fun e!660756 () Unit!38329)

(declare-fun Unit!38331 () Unit!38329)

(assert (=> b!1162016 (= e!660756 Unit!38331)))

(declare-fun lt!523118 () Bool)

(assert (=> b!1162016 (= lt!523118 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116146 () Bool)

(assert (=> b!1162016 (= c!116146 (and (not lt!523118) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523124 () Unit!38329)

(declare-fun e!660766 () Unit!38329)

(assert (=> b!1162016 (= lt!523124 e!660766)))

(declare-fun lt!523114 () Unit!38329)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!543 (array!75073 array!75075 (_ BitVec 32) (_ BitVec 32) V!43949 V!43949 (_ BitVec 64) (_ BitVec 32) Int) Unit!38329)

(assert (=> b!1162016 (= lt!523114 (lemmaListMapContainsThenArrayContainsFrom!543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116142 () Bool)

(assert (=> b!1162016 (= c!116142 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770874 () Bool)

(declare-fun e!660768 () Bool)

(assert (=> b!1162016 (= res!770874 e!660768)))

(declare-fun e!660767 () Bool)

(assert (=> b!1162016 (=> (not res!770874) (not e!660767))))

(assert (=> b!1162016 e!660767))

(declare-fun lt!523111 () Unit!38329)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75073 (_ BitVec 32) (_ BitVec 32)) Unit!38329)

(assert (=> b!1162016 (= lt!523111 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25360 0))(
  ( (Nil!25357) (Cons!25356 (h!26565 (_ BitVec 64)) (t!36939 List!25360)) )
))
(declare-fun arrayNoDuplicates!0 (array!75073 (_ BitVec 32) List!25360) Bool)

(assert (=> b!1162016 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25357)))

(declare-fun lt!523108 () Unit!38329)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75073 (_ BitVec 64) (_ BitVec 32) List!25360) Unit!38329)

(assert (=> b!1162016 (= lt!523108 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25357))))

(assert (=> b!1162016 false))

(declare-datatypes ((tuple2!18626 0))(
  ( (tuple2!18627 (_1!9324 (_ BitVec 64)) (_2!9324 V!43949)) )
))
(declare-datatypes ((List!25361 0))(
  ( (Nil!25358) (Cons!25357 (h!26566 tuple2!18626) (t!36940 List!25361)) )
))
(declare-datatypes ((ListLongMap!16595 0))(
  ( (ListLongMap!16596 (toList!8313 List!25361)) )
))
(declare-fun call!56588 () ListLongMap!16595)

(declare-fun call!56587 () Bool)

(declare-fun lt!523104 () ListLongMap!16595)

(declare-fun bm!56583 () Bool)

(declare-fun contains!6818 (ListLongMap!16595 (_ BitVec 64)) Bool)

(assert (=> bm!56583 (= call!56587 (contains!6818 (ite c!116146 lt!523104 call!56588) k!934))))

(declare-fun b!1162017 () Bool)

(declare-fun call!56593 () ListLongMap!16595)

(declare-fun call!56592 () ListLongMap!16595)

(assert (=> b!1162017 (= e!660759 (= call!56593 call!56592))))

(declare-fun b!1162018 () Bool)

(declare-fun -!1419 (ListLongMap!16595 (_ BitVec 64)) ListLongMap!16595)

(assert (=> b!1162018 (= e!660759 (= call!56593 (-!1419 call!56592 k!934)))))

(declare-fun b!1162019 () Bool)

(declare-fun res!770882 () Bool)

(assert (=> b!1162019 (=> (not res!770882) (not e!660753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162019 (= res!770882 (validKeyInArray!0 k!934))))

(declare-fun b!1162020 () Bool)

(assert (=> b!1162020 (= e!660754 true)))

(declare-fun e!660764 () Bool)

(assert (=> b!1162020 e!660764))

(declare-fun res!770877 () Bool)

(assert (=> b!1162020 (=> (not res!770877) (not e!660764))))

(declare-fun lt!523121 () ListLongMap!16595)

(declare-fun lt!523123 () ListLongMap!16595)

(assert (=> b!1162020 (= res!770877 (= lt!523121 lt!523123))))

(declare-fun lt!523125 () ListLongMap!16595)

(assert (=> b!1162020 (= lt!523121 (-!1419 lt!523125 k!934))))

(declare-fun lt!523122 () V!43949)

(declare-fun +!3717 (ListLongMap!16595 tuple2!18626) ListLongMap!16595)

(assert (=> b!1162020 (= (-!1419 (+!3717 lt!523123 (tuple2!18627 (select (arr!36187 _keys!1208) from!1455) lt!523122)) (select (arr!36187 _keys!1208) from!1455)) lt!523123)))

(declare-fun lt!523115 () Unit!38329)

(declare-fun addThenRemoveForNewKeyIsSame!253 (ListLongMap!16595 (_ BitVec 64) V!43949) Unit!38329)

(assert (=> b!1162020 (= lt!523115 (addThenRemoveForNewKeyIsSame!253 lt!523123 (select (arr!36187 _keys!1208) from!1455) lt!523122))))

(declare-fun lt!523107 () V!43949)

(declare-fun get!18461 (ValueCell!13849 V!43949) V!43949)

(assert (=> b!1162020 (= lt!523122 (get!18461 (select (arr!36188 _values!996) from!1455) lt!523107))))

(declare-fun lt!523113 () Unit!38329)

(assert (=> b!1162020 (= lt!523113 e!660756)))

(declare-fun c!116141 () Bool)

(assert (=> b!1162020 (= c!116141 (contains!6818 lt!523123 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4777 (array!75073 array!75075 (_ BitVec 32) (_ BitVec 32) V!43949 V!43949 (_ BitVec 32) Int) ListLongMap!16595)

(assert (=> b!1162020 (= lt!523123 (getCurrentListMapNoExtraKeys!4777 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162021 () Bool)

(declare-fun c!116144 () Bool)

(assert (=> b!1162021 (= c!116144 (and (not lt!523118) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660757 () Unit!38329)

(assert (=> b!1162021 (= e!660766 e!660757)))

(declare-fun lt!523110 () array!75075)

(declare-fun bm!56584 () Bool)

(declare-fun lt!523109 () array!75073)

(assert (=> bm!56584 (= call!56593 (getCurrentListMapNoExtraKeys!4777 lt!523109 lt!523110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162022 () Bool)

(declare-fun e!660752 () Bool)

(assert (=> b!1162022 (= e!660752 e!660761)))

(declare-fun res!770875 () Bool)

(assert (=> b!1162022 (=> res!770875 e!660761)))

(assert (=> b!1162022 (= res!770875 (not (= from!1455 i!673)))))

(declare-fun lt!523106 () ListLongMap!16595)

(assert (=> b!1162022 (= lt!523106 (getCurrentListMapNoExtraKeys!4777 lt!523109 lt!523110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162022 (= lt!523110 (array!75076 (store (arr!36188 _values!996) i!673 (ValueCellFull!13849 lt!523107)) (size!36724 _values!996)))))

(declare-fun dynLambda!2773 (Int (_ BitVec 64)) V!43949)

(assert (=> b!1162022 (= lt!523107 (dynLambda!2773 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162022 (= lt!523125 (getCurrentListMapNoExtraKeys!4777 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45500 () Bool)

(declare-fun mapRes!45500 () Bool)

(declare-fun tp!86471 () Bool)

(declare-fun e!660758 () Bool)

(assert (=> mapNonEmpty!45500 (= mapRes!45500 (and tp!86471 e!660758))))

(declare-fun mapRest!45500 () (Array (_ BitVec 32) ValueCell!13849))

(declare-fun mapKey!45500 () (_ BitVec 32))

(declare-fun mapValue!45500 () ValueCell!13849)

(assert (=> mapNonEmpty!45500 (= (arr!36188 _values!996) (store mapRest!45500 mapKey!45500 mapValue!45500))))

(declare-fun b!1162023 () Bool)

(declare-fun e!660763 () Bool)

(declare-fun tp_is_empty!29117 () Bool)

(assert (=> b!1162023 (= e!660763 tp_is_empty!29117)))

(declare-fun b!1162024 () Bool)

(assert (=> b!1162024 (= e!660764 (= lt!523121 (getCurrentListMapNoExtraKeys!4777 lt!523109 lt!523110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162025 () Bool)

(assert (=> b!1162025 (= e!660768 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523118) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56585 () Bool)

(declare-fun call!56591 () Unit!38329)

(declare-fun addStillContains!958 (ListLongMap!16595 (_ BitVec 64) V!43949 (_ BitVec 64)) Unit!38329)

(assert (=> bm!56585 (= call!56591 (addStillContains!958 (ite c!116146 lt!523104 lt!523123) (ite c!116146 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116144 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116146 minValue!944 (ite c!116144 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1162026 () Bool)

(declare-fun lt!523105 () Unit!38329)

(assert (=> b!1162026 (= e!660757 lt!523105)))

(declare-fun call!56586 () Unit!38329)

(assert (=> b!1162026 (= lt!523105 call!56586)))

(declare-fun call!56590 () Bool)

(assert (=> b!1162026 call!56590))

(declare-fun b!1162027 () Bool)

(declare-fun e!660760 () Unit!38329)

(declare-fun Unit!38332 () Unit!38329)

(assert (=> b!1162027 (= e!660760 Unit!38332)))

(declare-fun b!1162028 () Bool)

(declare-fun res!770884 () Bool)

(assert (=> b!1162028 (=> (not res!770884) (not e!660753))))

(assert (=> b!1162028 (= res!770884 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25357))))

(declare-fun b!1162029 () Bool)

(declare-fun res!770885 () Bool)

(declare-fun e!660765 () Bool)

(assert (=> b!1162029 (=> (not res!770885) (not e!660765))))

(assert (=> b!1162029 (= res!770885 (arrayNoDuplicates!0 lt!523109 #b00000000000000000000000000000000 Nil!25357))))

(declare-fun b!1162030 () Bool)

(declare-fun arrayContainsKey!0 (array!75073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162030 (= e!660768 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162031 () Bool)

(declare-fun Unit!38333 () Unit!38329)

(assert (=> b!1162031 (= e!660756 Unit!38333)))

(declare-fun b!1162032 () Bool)

(declare-fun call!56589 () ListLongMap!16595)

(assert (=> b!1162032 (contains!6818 call!56589 k!934)))

(declare-fun lt!523120 () Unit!38329)

(assert (=> b!1162032 (= lt!523120 call!56591)))

(assert (=> b!1162032 call!56587))

(assert (=> b!1162032 (= lt!523104 (+!3717 lt!523123 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523119 () Unit!38329)

(assert (=> b!1162032 (= lt!523119 (addStillContains!958 lt!523123 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1162032 (= e!660766 lt!523120)))

(declare-fun b!1162033 () Bool)

(assert (=> b!1162033 call!56590))

(declare-fun lt!523117 () Unit!38329)

(assert (=> b!1162033 (= lt!523117 call!56586)))

(assert (=> b!1162033 (= e!660760 lt!523117)))

(declare-fun b!1162034 () Bool)

(assert (=> b!1162034 (= e!660757 e!660760)))

(declare-fun c!116143 () Bool)

(assert (=> b!1162034 (= c!116143 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523118))))

(declare-fun res!770880 () Bool)

(assert (=> start!98982 (=> (not res!770880) (not e!660753))))

(assert (=> start!98982 (= res!770880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36723 _keys!1208))))))

(assert (=> start!98982 e!660753))

(assert (=> start!98982 tp_is_empty!29117))

(declare-fun array_inv!27690 (array!75073) Bool)

(assert (=> start!98982 (array_inv!27690 _keys!1208)))

(assert (=> start!98982 true))

(assert (=> start!98982 tp!86472))

(declare-fun e!660762 () Bool)

(declare-fun array_inv!27691 (array!75075) Bool)

(assert (=> start!98982 (and (array_inv!27691 _values!996) e!660762)))

(declare-fun bm!56586 () Bool)

(assert (=> bm!56586 (= call!56589 (+!3717 (ite c!116146 lt!523104 lt!523123) (ite c!116146 (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116144 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!56587 () Bool)

(assert (=> bm!56587 (= call!56586 call!56591)))

(declare-fun mapIsEmpty!45500 () Bool)

(assert (=> mapIsEmpty!45500 mapRes!45500))

(declare-fun bm!56588 () Bool)

(assert (=> bm!56588 (= call!56590 call!56587)))

(declare-fun b!1162035 () Bool)

(declare-fun res!770879 () Bool)

(assert (=> b!1162035 (=> (not res!770879) (not e!660753))))

(assert (=> b!1162035 (= res!770879 (= (select (arr!36187 _keys!1208) i!673) k!934))))

(declare-fun b!1162036 () Bool)

(declare-fun res!770881 () Bool)

(assert (=> b!1162036 (=> (not res!770881) (not e!660753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75073 (_ BitVec 32)) Bool)

(assert (=> b!1162036 (= res!770881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162037 () Bool)

(assert (=> b!1162037 (= e!660762 (and e!660763 mapRes!45500))))

(declare-fun condMapEmpty!45500 () Bool)

(declare-fun mapDefault!45500 () ValueCell!13849)

