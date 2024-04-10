; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98520 () Bool)

(assert start!98520)

(declare-fun b_free!24125 () Bool)

(declare-fun b_next!24125 () Bool)

(assert (=> start!98520 (= b_free!24125 (not b_next!24125))))

(declare-fun tp!85086 () Bool)

(declare-fun b_and!39099 () Bool)

(assert (=> start!98520 (= tp!85086 b_and!39099)))

(declare-datatypes ((V!43333 0))(
  ( (V!43334 (val!14384 Int)) )
))
(declare-fun zeroValue!944 () V!43333)

(declare-datatypes ((array!74167 0))(
  ( (array!74168 (arr!35734 (Array (_ BitVec 32) (_ BitVec 64))) (size!36270 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74167)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18192 0))(
  ( (tuple2!18193 (_1!9107 (_ BitVec 64)) (_2!9107 V!43333)) )
))
(declare-datatypes ((List!24947 0))(
  ( (Nil!24944) (Cons!24943 (h!26152 tuple2!18192) (t!36064 List!24947)) )
))
(declare-datatypes ((ListLongMap!16161 0))(
  ( (ListLongMap!16162 (toList!8096 List!24947)) )
))
(declare-fun call!51042 () ListLongMap!16161)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!51039 () Bool)

(declare-datatypes ((ValueCell!13618 0))(
  ( (ValueCellFull!13618 (v!17021 V!43333)) (EmptyCell!13618) )
))
(declare-datatypes ((array!74169 0))(
  ( (array!74170 (arr!35735 (Array (_ BitVec 32) ValueCell!13618)) (size!36271 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74169)

(declare-fun minValue!944 () V!43333)

(declare-fun getCurrentListMapNoExtraKeys!4578 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43333 V!43333 (_ BitVec 32) Int) ListLongMap!16161)

(assert (=> bm!51039 (= call!51042 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140871 () Bool)

(declare-fun res!760590 () Bool)

(declare-fun e!649083 () Bool)

(assert (=> b!1140871 (=> (not res!760590) (not e!649083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74167 (_ BitVec 32)) Bool)

(assert (=> b!1140871 (= res!760590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140872 () Bool)

(declare-fun e!649095 () Bool)

(declare-fun e!649085 () Bool)

(assert (=> b!1140872 (= e!649095 (not e!649085))))

(declare-fun res!760599 () Bool)

(assert (=> b!1140872 (=> res!760599 e!649085)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140872 (= res!760599 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140872 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37414 0))(
  ( (Unit!37415) )
))
(declare-fun lt!508134 () Unit!37414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74167 (_ BitVec 64) (_ BitVec 32)) Unit!37414)

(assert (=> b!1140872 (= lt!508134 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1140873 () Bool)

(declare-fun e!649086 () Bool)

(assert (=> b!1140873 (= e!649086 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140874 () Bool)

(declare-fun e!649087 () Bool)

(declare-fun e!649080 () Bool)

(assert (=> b!1140874 (= e!649087 e!649080)))

(declare-fun res!760596 () Bool)

(assert (=> b!1140874 (=> res!760596 e!649080)))

(assert (=> b!1140874 (= res!760596 (not (= (select (arr!35734 _keys!1208) from!1455) k!934)))))

(declare-fun e!649082 () Bool)

(assert (=> b!1140874 e!649082))

(declare-fun c!111983 () Bool)

(assert (=> b!1140874 (= c!111983 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508144 () Unit!37414)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!491 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43333 V!43333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37414)

(assert (=> b!1140874 (= lt!508144 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!508130 () ListLongMap!16161)

(declare-fun lt!508137 () ListLongMap!16161)

(declare-fun bm!51040 () Bool)

(declare-fun c!111985 () Bool)

(declare-fun c!111988 () Bool)

(declare-fun call!51047 () Unit!37414)

(declare-fun addStillContains!785 (ListLongMap!16161 (_ BitVec 64) V!43333 (_ BitVec 64)) Unit!37414)

(assert (=> bm!51040 (= call!51047 (addStillContains!785 (ite c!111988 lt!508137 lt!508130) (ite c!111988 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111985 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111988 minValue!944 (ite c!111985 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1140875 () Bool)

(declare-fun e!649084 () Unit!37414)

(declare-fun e!649090 () Unit!37414)

(assert (=> b!1140875 (= e!649084 e!649090)))

(declare-fun c!111986 () Bool)

(declare-fun lt!508148 () Bool)

(assert (=> b!1140875 (= c!111986 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508148))))

(declare-fun b!1140876 () Bool)

(assert (=> b!1140876 (= e!649083 e!649095)))

(declare-fun res!760592 () Bool)

(assert (=> b!1140876 (=> (not res!760592) (not e!649095))))

(declare-fun lt!508129 () array!74167)

(assert (=> b!1140876 (= res!760592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508129 mask!1564))))

(assert (=> b!1140876 (= lt!508129 (array!74168 (store (arr!35734 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36270 _keys!1208)))))

(declare-fun b!1140877 () Bool)

(declare-fun call!51044 () Bool)

(assert (=> b!1140877 call!51044))

(declare-fun lt!508132 () Unit!37414)

(declare-fun call!51048 () Unit!37414)

(assert (=> b!1140877 (= lt!508132 call!51048)))

(assert (=> b!1140877 (= e!649090 lt!508132)))

(declare-fun b!1140878 () Bool)

(declare-fun call!51046 () ListLongMap!16161)

(declare-fun -!1246 (ListLongMap!16161 (_ BitVec 64)) ListLongMap!16161)

(assert (=> b!1140878 (= e!649082 (= call!51046 (-!1246 call!51042 k!934)))))

(declare-fun bm!51041 () Bool)

(declare-fun call!51049 () ListLongMap!16161)

(declare-fun call!51043 () Bool)

(declare-fun contains!6631 (ListLongMap!16161 (_ BitVec 64)) Bool)

(assert (=> bm!51041 (= call!51043 (contains!6631 (ite c!111988 lt!508137 call!51049) k!934))))

(declare-fun b!1140879 () Bool)

(declare-fun res!760600 () Bool)

(assert (=> b!1140879 (=> (not res!760600) (not e!649083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140879 (= res!760600 (validMask!0 mask!1564))))

(declare-fun b!1140880 () Bool)

(declare-fun res!760594 () Bool)

(assert (=> b!1140880 (=> (not res!760594) (not e!649083))))

(declare-datatypes ((List!24948 0))(
  ( (Nil!24945) (Cons!24944 (h!26153 (_ BitVec 64)) (t!36065 List!24948)) )
))
(declare-fun arrayNoDuplicates!0 (array!74167 (_ BitVec 32) List!24948) Bool)

(assert (=> b!1140880 (= res!760594 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24945))))

(declare-fun bm!51042 () Bool)

(declare-fun call!51045 () ListLongMap!16161)

(declare-fun +!3528 (ListLongMap!16161 tuple2!18192) ListLongMap!16161)

(assert (=> bm!51042 (= call!51045 (+!3528 (ite c!111988 lt!508137 lt!508130) (ite c!111988 (tuple2!18193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111985 (tuple2!18193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1140881 () Bool)

(assert (=> b!1140881 (= e!649080 true)))

(declare-fun lt!508138 () V!43333)

(assert (=> b!1140881 (= (-!1246 (+!3528 lt!508130 (tuple2!18193 (select (arr!35734 _keys!1208) from!1455) lt!508138)) (select (arr!35734 _keys!1208) from!1455)) lt!508130)))

(declare-fun lt!508140 () Unit!37414)

(declare-fun addThenRemoveForNewKeyIsSame!100 (ListLongMap!16161 (_ BitVec 64) V!43333) Unit!37414)

(assert (=> b!1140881 (= lt!508140 (addThenRemoveForNewKeyIsSame!100 lt!508130 (select (arr!35734 _keys!1208) from!1455) lt!508138))))

(declare-fun lt!508136 () V!43333)

(declare-fun get!18154 (ValueCell!13618 V!43333) V!43333)

(assert (=> b!1140881 (= lt!508138 (get!18154 (select (arr!35735 _values!996) from!1455) lt!508136))))

(declare-fun lt!508133 () Unit!37414)

(declare-fun e!649092 () Unit!37414)

(assert (=> b!1140881 (= lt!508133 e!649092)))

(declare-fun c!111987 () Bool)

(assert (=> b!1140881 (= c!111987 (contains!6631 lt!508130 k!934))))

(assert (=> b!1140881 (= lt!508130 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140882 () Bool)

(assert (=> b!1140882 (= c!111985 (and (not lt!508148) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649093 () Unit!37414)

(assert (=> b!1140882 (= e!649093 e!649084)))

(declare-fun b!1140883 () Bool)

(declare-fun res!760589 () Bool)

(assert (=> b!1140883 (=> (not res!760589) (not e!649083))))

(assert (=> b!1140883 (= res!760589 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36270 _keys!1208))))))

(declare-fun b!1140884 () Bool)

(assert (=> b!1140884 (= e!649082 (= call!51046 call!51042))))

(declare-fun bm!51043 () Bool)

(declare-fun lt!508146 () array!74169)

(assert (=> bm!51043 (= call!51046 (getCurrentListMapNoExtraKeys!4578 lt!508129 lt!508146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!760595 () Bool)

(assert (=> start!98520 (=> (not res!760595) (not e!649083))))

(assert (=> start!98520 (= res!760595 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36270 _keys!1208))))))

(assert (=> start!98520 e!649083))

(declare-fun tp_is_empty!28655 () Bool)

(assert (=> start!98520 tp_is_empty!28655))

(declare-fun array_inv!27390 (array!74167) Bool)

(assert (=> start!98520 (array_inv!27390 _keys!1208)))

(assert (=> start!98520 true))

(assert (=> start!98520 tp!85086))

(declare-fun e!649091 () Bool)

(declare-fun array_inv!27391 (array!74169) Bool)

(assert (=> start!98520 (and (array_inv!27391 _values!996) e!649091)))

(declare-fun b!1140885 () Bool)

(declare-fun e!649089 () Bool)

(assert (=> b!1140885 (= e!649089 tp_is_empty!28655)))

(declare-fun b!1140886 () Bool)

(assert (=> b!1140886 (= e!649085 e!649087)))

(declare-fun res!760593 () Bool)

(assert (=> b!1140886 (=> res!760593 e!649087)))

(assert (=> b!1140886 (= res!760593 (not (= from!1455 i!673)))))

(declare-fun lt!508145 () ListLongMap!16161)

(assert (=> b!1140886 (= lt!508145 (getCurrentListMapNoExtraKeys!4578 lt!508129 lt!508146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140886 (= lt!508146 (array!74170 (store (arr!35735 _values!996) i!673 (ValueCellFull!13618 lt!508136)) (size!36271 _values!996)))))

(declare-fun dynLambda!2624 (Int (_ BitVec 64)) V!43333)

(assert (=> b!1140886 (= lt!508136 (dynLambda!2624 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508141 () ListLongMap!16161)

(assert (=> b!1140886 (= lt!508141 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44807 () Bool)

(declare-fun mapRes!44807 () Bool)

(declare-fun tp!85085 () Bool)

(declare-fun e!649094 () Bool)

(assert (=> mapNonEmpty!44807 (= mapRes!44807 (and tp!85085 e!649094))))

(declare-fun mapValue!44807 () ValueCell!13618)

(declare-fun mapRest!44807 () (Array (_ BitVec 32) ValueCell!13618))

(declare-fun mapKey!44807 () (_ BitVec 32))

(assert (=> mapNonEmpty!44807 (= (arr!35735 _values!996) (store mapRest!44807 mapKey!44807 mapValue!44807))))

(declare-fun b!1140887 () Bool)

(declare-fun Unit!37416 () Unit!37414)

(assert (=> b!1140887 (= e!649092 Unit!37416)))

(assert (=> b!1140887 (= lt!508148 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140887 (= c!111988 (and (not lt!508148) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508147 () Unit!37414)

(assert (=> b!1140887 (= lt!508147 e!649093)))

(declare-fun lt!508149 () Unit!37414)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!384 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43333 V!43333 (_ BitVec 64) (_ BitVec 32) Int) Unit!37414)

(assert (=> b!1140887 (= lt!508149 (lemmaListMapContainsThenArrayContainsFrom!384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111984 () Bool)

(assert (=> b!1140887 (= c!111984 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760601 () Bool)

(assert (=> b!1140887 (= res!760601 e!649086)))

(declare-fun e!649088 () Bool)

(assert (=> b!1140887 (=> (not res!760601) (not e!649088))))

(assert (=> b!1140887 e!649088))

(declare-fun lt!508131 () Unit!37414)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74167 (_ BitVec 32) (_ BitVec 32)) Unit!37414)

(assert (=> b!1140887 (= lt!508131 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140887 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24945)))

(declare-fun lt!508139 () Unit!37414)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74167 (_ BitVec 64) (_ BitVec 32) List!24948) Unit!37414)

(assert (=> b!1140887 (= lt!508139 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24945))))

(assert (=> b!1140887 false))

(declare-fun b!1140888 () Bool)

(declare-fun Unit!37417 () Unit!37414)

(assert (=> b!1140888 (= e!649090 Unit!37417)))

(declare-fun b!1140889 () Bool)

(declare-fun Unit!37418 () Unit!37414)

(assert (=> b!1140889 (= e!649092 Unit!37418)))

(declare-fun b!1140890 () Bool)

(assert (=> b!1140890 (= e!649088 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44807 () Bool)

(assert (=> mapIsEmpty!44807 mapRes!44807))

(declare-fun b!1140891 () Bool)

(assert (=> b!1140891 (= e!649086 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508148) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51044 () Bool)

(assert (=> bm!51044 (= call!51044 call!51043)))

(declare-fun b!1140892 () Bool)

(declare-fun res!760591 () Bool)

(assert (=> b!1140892 (=> (not res!760591) (not e!649083))))

(assert (=> b!1140892 (= res!760591 (= (select (arr!35734 _keys!1208) i!673) k!934))))

(declare-fun b!1140893 () Bool)

(assert (=> b!1140893 (contains!6631 call!51045 k!934)))

(declare-fun lt!508135 () Unit!37414)

(assert (=> b!1140893 (= lt!508135 call!51047)))

(assert (=> b!1140893 call!51043))

(assert (=> b!1140893 (= lt!508137 (+!3528 lt!508130 (tuple2!18193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508142 () Unit!37414)

(assert (=> b!1140893 (= lt!508142 (addStillContains!785 lt!508130 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1140893 (= e!649093 lt!508135)))

(declare-fun b!1140894 () Bool)

(declare-fun res!760598 () Bool)

(assert (=> b!1140894 (=> (not res!760598) (not e!649083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140894 (= res!760598 (validKeyInArray!0 k!934))))

(declare-fun bm!51045 () Bool)

(assert (=> bm!51045 (= call!51049 call!51045)))

(declare-fun b!1140895 () Bool)

(declare-fun res!760597 () Bool)

(assert (=> b!1140895 (=> (not res!760597) (not e!649083))))

(assert (=> b!1140895 (= res!760597 (and (= (size!36271 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36270 _keys!1208) (size!36271 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140896 () Bool)

(assert (=> b!1140896 (= e!649094 tp_is_empty!28655)))

(declare-fun b!1140897 () Bool)

(declare-fun res!760588 () Bool)

(assert (=> b!1140897 (=> (not res!760588) (not e!649095))))

(assert (=> b!1140897 (= res!760588 (arrayNoDuplicates!0 lt!508129 #b00000000000000000000000000000000 Nil!24945))))

(declare-fun b!1140898 () Bool)

(declare-fun lt!508143 () Unit!37414)

(assert (=> b!1140898 (= e!649084 lt!508143)))

(assert (=> b!1140898 (= lt!508143 call!51048)))

(assert (=> b!1140898 call!51044))

(declare-fun bm!51046 () Bool)

(assert (=> bm!51046 (= call!51048 call!51047)))

(declare-fun b!1140899 () Bool)

(assert (=> b!1140899 (= e!649091 (and e!649089 mapRes!44807))))

(declare-fun condMapEmpty!44807 () Bool)

(declare-fun mapDefault!44807 () ValueCell!13618)

