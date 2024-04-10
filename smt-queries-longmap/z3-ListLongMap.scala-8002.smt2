; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98854 () Bool)

(assert start!98854)

(declare-fun b_free!24459 () Bool)

(declare-fun b_next!24459 () Bool)

(assert (=> start!98854 (= b_free!24459 (not b_next!24459))))

(declare-fun tp!86087 () Bool)

(declare-fun b_and!39767 () Bool)

(assert (=> start!98854 (= tp!86087 b_and!39767)))

(declare-fun b!1156127 () Bool)

(declare-fun res!768000 () Bool)

(declare-fun e!657493 () Bool)

(assert (=> b!1156127 (=> (not res!768000) (not e!657493))))

(declare-datatypes ((array!74825 0))(
  ( (array!74826 (arr!36063 (Array (_ BitVec 32) (_ BitVec 64))) (size!36599 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74825)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74825 (_ BitVec 32)) Bool)

(assert (=> b!1156127 (= res!768000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156128 () Bool)

(declare-fun e!657494 () Bool)

(declare-fun tp_is_empty!28989 () Bool)

(assert (=> b!1156128 (= e!657494 tp_is_empty!28989)))

(declare-fun b!1156129 () Bool)

(declare-datatypes ((V!43779 0))(
  ( (V!43780 (val!14551 Int)) )
))
(declare-datatypes ((tuple2!18510 0))(
  ( (tuple2!18511 (_1!9266 (_ BitVec 64)) (_2!9266 V!43779)) )
))
(declare-datatypes ((List!25253 0))(
  ( (Nil!25250) (Cons!25249 (h!26458 tuple2!18510) (t!36704 List!25253)) )
))
(declare-datatypes ((ListLongMap!16479 0))(
  ( (ListLongMap!16480 (toList!8255 List!25253)) )
))
(declare-fun call!55055 () ListLongMap!16479)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6767 (ListLongMap!16479 (_ BitVec 64)) Bool)

(assert (=> b!1156129 (contains!6767 call!55055 k0!934)))

(declare-datatypes ((Unit!38081 0))(
  ( (Unit!38082) )
))
(declare-fun lt!518890 () Unit!38081)

(declare-fun call!55056 () Unit!38081)

(assert (=> b!1156129 (= lt!518890 call!55056)))

(declare-fun call!55057 () Bool)

(assert (=> b!1156129 call!55057))

(declare-fun lt!518887 () ListLongMap!16479)

(declare-fun lt!518898 () ListLongMap!16479)

(declare-fun zeroValue!944 () V!43779)

(declare-fun +!3668 (ListLongMap!16479 tuple2!18510) ListLongMap!16479)

(assert (=> b!1156129 (= lt!518887 (+!3668 lt!518898 (tuple2!18511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518888 () Unit!38081)

(declare-fun addStillContains!911 (ListLongMap!16479 (_ BitVec 64) V!43779 (_ BitVec 64)) Unit!38081)

(assert (=> b!1156129 (= lt!518888 (addStillContains!911 lt!518898 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!657490 () Unit!38081)

(assert (=> b!1156129 (= e!657490 lt!518890)))

(declare-fun bm!55047 () Bool)

(declare-fun c!114991 () Bool)

(declare-fun call!55050 () ListLongMap!16479)

(assert (=> bm!55047 (= call!55057 (contains!6767 (ite c!114991 lt!518887 call!55050) k0!934))))

(declare-fun call!55052 () ListLongMap!16479)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!55048 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!518900 () array!74825)

(declare-fun minValue!944 () V!43779)

(declare-datatypes ((ValueCell!13785 0))(
  ( (ValueCellFull!13785 (v!17188 V!43779)) (EmptyCell!13785) )
))
(declare-datatypes ((array!74827 0))(
  ( (array!74828 (arr!36064 (Array (_ BitVec 32) ValueCell!13785)) (size!36600 (_ BitVec 32))) )
))
(declare-fun lt!518889 () array!74827)

(declare-fun getCurrentListMapNoExtraKeys!4724 (array!74825 array!74827 (_ BitVec 32) (_ BitVec 32) V!43779 V!43779 (_ BitVec 32) Int) ListLongMap!16479)

(assert (=> bm!55048 (= call!55052 (getCurrentListMapNoExtraKeys!4724 lt!518900 lt!518889 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156130 () Bool)

(declare-fun res!768001 () Bool)

(declare-fun e!657491 () Bool)

(assert (=> b!1156130 (=> (not res!768001) (not e!657491))))

(declare-datatypes ((List!25254 0))(
  ( (Nil!25251) (Cons!25250 (h!26459 (_ BitVec 64)) (t!36705 List!25254)) )
))
(declare-fun arrayNoDuplicates!0 (array!74825 (_ BitVec 32) List!25254) Bool)

(assert (=> b!1156130 (= res!768001 (arrayNoDuplicates!0 lt!518900 #b00000000000000000000000000000000 Nil!25251))))

(declare-fun b!1156131 () Bool)

(declare-fun e!657492 () Unit!38081)

(declare-fun Unit!38083 () Unit!38081)

(assert (=> b!1156131 (= e!657492 Unit!38083)))

(declare-fun bm!55049 () Bool)

(declare-fun call!55054 () Unit!38081)

(assert (=> bm!55049 (= call!55054 call!55056)))

(declare-fun bm!55050 () Bool)

(assert (=> bm!55050 (= call!55050 call!55055)))

(declare-fun b!1156132 () Bool)

(declare-fun e!657488 () Bool)

(declare-fun arrayContainsKey!0 (array!74825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156132 (= e!657488 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156133 () Bool)

(declare-fun res!768006 () Bool)

(assert (=> b!1156133 (=> (not res!768006) (not e!657493))))

(assert (=> b!1156133 (= res!768006 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25251))))

(declare-fun b!1156134 () Bool)

(declare-fun e!657497 () Unit!38081)

(declare-fun lt!518895 () Unit!38081)

(assert (=> b!1156134 (= e!657497 lt!518895)))

(assert (=> b!1156134 (= lt!518895 call!55054)))

(declare-fun call!55053 () Bool)

(assert (=> b!1156134 call!55053))

(declare-fun b!1156126 () Bool)

(declare-fun e!657498 () Bool)

(assert (=> b!1156126 (= e!657491 (not e!657498))))

(declare-fun res!768005 () Bool)

(assert (=> b!1156126 (=> res!768005 e!657498)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156126 (= res!768005 (bvsgt from!1455 i!673))))

(assert (=> b!1156126 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518896 () Unit!38081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74825 (_ BitVec 64) (_ BitVec 32)) Unit!38081)

(assert (=> b!1156126 (= lt!518896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!768008 () Bool)

(assert (=> start!98854 (=> (not res!768008) (not e!657493))))

(assert (=> start!98854 (= res!768008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36599 _keys!1208))))))

(assert (=> start!98854 e!657493))

(assert (=> start!98854 tp_is_empty!28989))

(declare-fun array_inv!27602 (array!74825) Bool)

(assert (=> start!98854 (array_inv!27602 _keys!1208)))

(assert (=> start!98854 true))

(assert (=> start!98854 tp!86087))

(declare-fun _values!996 () array!74827)

(declare-fun e!657499 () Bool)

(declare-fun array_inv!27603 (array!74827) Bool)

(assert (=> start!98854 (and (array_inv!27603 _values!996) e!657499)))

(declare-fun b!1156135 () Bool)

(declare-fun res!768004 () Bool)

(assert (=> b!1156135 (=> (not res!768004) (not e!657493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156135 (= res!768004 (validMask!0 mask!1564))))

(declare-fun b!1156136 () Bool)

(declare-fun e!657501 () Bool)

(assert (=> b!1156136 (= e!657498 e!657501)))

(declare-fun res!767999 () Bool)

(assert (=> b!1156136 (=> res!767999 e!657501)))

(assert (=> b!1156136 (= res!767999 (not (= from!1455 i!673)))))

(declare-fun lt!518901 () ListLongMap!16479)

(assert (=> b!1156136 (= lt!518901 (getCurrentListMapNoExtraKeys!4724 lt!518900 lt!518889 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518884 () V!43779)

(assert (=> b!1156136 (= lt!518889 (array!74828 (store (arr!36064 _values!996) i!673 (ValueCellFull!13785 lt!518884)) (size!36600 _values!996)))))

(declare-fun dynLambda!2732 (Int (_ BitVec 64)) V!43779)

(assert (=> b!1156136 (= lt!518884 (dynLambda!2732 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518883 () ListLongMap!16479)

(assert (=> b!1156136 (= lt!518883 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156137 () Bool)

(assert (=> b!1156137 (= e!657493 e!657491)))

(declare-fun res!767998 () Bool)

(assert (=> b!1156137 (=> (not res!767998) (not e!657491))))

(assert (=> b!1156137 (= res!767998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518900 mask!1564))))

(assert (=> b!1156137 (= lt!518900 (array!74826 (store (arr!36063 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36599 _keys!1208)))))

(declare-fun b!1156138 () Bool)

(declare-fun res!768007 () Bool)

(assert (=> b!1156138 (=> (not res!768007) (not e!657493))))

(assert (=> b!1156138 (= res!768007 (= (select (arr!36063 _keys!1208) i!673) k0!934))))

(declare-fun b!1156139 () Bool)

(declare-fun e!657500 () Bool)

(assert (=> b!1156139 (= e!657500 tp_is_empty!28989)))

(declare-fun call!55051 () ListLongMap!16479)

(declare-fun bm!55051 () Bool)

(assert (=> bm!55051 (= call!55051 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156140 () Bool)

(declare-fun mapRes!45308 () Bool)

(assert (=> b!1156140 (= e!657499 (and e!657494 mapRes!45308))))

(declare-fun condMapEmpty!45308 () Bool)

(declare-fun mapDefault!45308 () ValueCell!13785)

(assert (=> b!1156140 (= condMapEmpty!45308 (= (arr!36064 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13785)) mapDefault!45308)))))

(declare-fun b!1156141 () Bool)

(declare-fun c!114989 () Bool)

(declare-fun lt!518893 () Bool)

(assert (=> b!1156141 (= c!114989 (and (not lt!518893) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1156141 (= e!657490 e!657497)))

(declare-fun b!1156142 () Bool)

(declare-fun res!767995 () Bool)

(assert (=> b!1156142 (=> (not res!767995) (not e!657493))))

(assert (=> b!1156142 (= res!767995 (and (= (size!36600 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36599 _keys!1208) (size!36600 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!657495 () Bool)

(declare-fun b!1156143 () Bool)

(declare-fun -!1373 (ListLongMap!16479 (_ BitVec 64)) ListLongMap!16479)

(assert (=> b!1156143 (= e!657495 (= call!55052 (-!1373 call!55051 k0!934)))))

(declare-fun b!1156144 () Bool)

(assert (=> b!1156144 (= e!657488 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518893) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156145 () Bool)

(declare-fun e!657504 () Bool)

(declare-fun lt!518882 () ListLongMap!16479)

(assert (=> b!1156145 (= e!657504 (= lt!518882 (getCurrentListMapNoExtraKeys!4724 lt!518900 lt!518889 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45308 () Bool)

(declare-fun tp!86088 () Bool)

(assert (=> mapNonEmpty!45308 (= mapRes!45308 (and tp!86088 e!657500))))

(declare-fun mapKey!45308 () (_ BitVec 32))

(declare-fun mapRest!45308 () (Array (_ BitVec 32) ValueCell!13785))

(declare-fun mapValue!45308 () ValueCell!13785)

(assert (=> mapNonEmpty!45308 (= (arr!36064 _values!996) (store mapRest!45308 mapKey!45308 mapValue!45308))))

(declare-fun b!1156146 () Bool)

(declare-fun e!657496 () Bool)

(assert (=> b!1156146 (= e!657501 e!657496)))

(declare-fun res!768002 () Bool)

(assert (=> b!1156146 (=> res!768002 e!657496)))

(assert (=> b!1156146 (= res!768002 (not (= (select (arr!36063 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156146 e!657495))

(declare-fun c!114994 () Bool)

(assert (=> b!1156146 (= c!114994 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518881 () Unit!38081)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!605 (array!74825 array!74827 (_ BitVec 32) (_ BitVec 32) V!43779 V!43779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38081)

(assert (=> b!1156146 (= lt!518881 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!605 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156147 () Bool)

(declare-fun res!767994 () Bool)

(assert (=> b!1156147 (=> (not res!767994) (not e!657493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156147 (= res!767994 (validKeyInArray!0 k0!934))))

(declare-fun b!1156148 () Bool)

(declare-fun Unit!38084 () Unit!38081)

(assert (=> b!1156148 (= e!657492 Unit!38084)))

(assert (=> b!1156148 (= lt!518893 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156148 (= c!114991 (and (not lt!518893) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518894 () Unit!38081)

(assert (=> b!1156148 (= lt!518894 e!657490)))

(declare-fun lt!518880 () Unit!38081)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!500 (array!74825 array!74827 (_ BitVec 32) (_ BitVec 32) V!43779 V!43779 (_ BitVec 64) (_ BitVec 32) Int) Unit!38081)

(assert (=> b!1156148 (= lt!518880 (lemmaListMapContainsThenArrayContainsFrom!500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114990 () Bool)

(assert (=> b!1156148 (= c!114990 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767996 () Bool)

(assert (=> b!1156148 (= res!767996 e!657488)))

(declare-fun e!657503 () Bool)

(assert (=> b!1156148 (=> (not res!767996) (not e!657503))))

(assert (=> b!1156148 e!657503))

(declare-fun lt!518892 () Unit!38081)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74825 (_ BitVec 32) (_ BitVec 32)) Unit!38081)

(assert (=> b!1156148 (= lt!518892 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156148 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25251)))

(declare-fun lt!518886 () Unit!38081)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74825 (_ BitVec 64) (_ BitVec 32) List!25254) Unit!38081)

(assert (=> b!1156148 (= lt!518886 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25251))))

(assert (=> b!1156148 false))

(declare-fun b!1156149 () Bool)

(declare-fun e!657489 () Unit!38081)

(assert (=> b!1156149 (= e!657497 e!657489)))

(declare-fun c!114992 () Bool)

(assert (=> b!1156149 (= c!114992 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518893))))

(declare-fun b!1156150 () Bool)

(assert (=> b!1156150 (= e!657496 true)))

(assert (=> b!1156150 e!657504))

(declare-fun res!767997 () Bool)

(assert (=> b!1156150 (=> (not res!767997) (not e!657504))))

(assert (=> b!1156150 (= res!767997 (= lt!518882 lt!518898))))

(assert (=> b!1156150 (= lt!518882 (-!1373 lt!518883 k0!934))))

(declare-fun lt!518885 () V!43779)

(assert (=> b!1156150 (= (-!1373 (+!3668 lt!518898 (tuple2!18511 (select (arr!36063 _keys!1208) from!1455) lt!518885)) (select (arr!36063 _keys!1208) from!1455)) lt!518898)))

(declare-fun lt!518897 () Unit!38081)

(declare-fun addThenRemoveForNewKeyIsSame!212 (ListLongMap!16479 (_ BitVec 64) V!43779) Unit!38081)

(assert (=> b!1156150 (= lt!518897 (addThenRemoveForNewKeyIsSame!212 lt!518898 (select (arr!36063 _keys!1208) from!1455) lt!518885))))

(declare-fun get!18378 (ValueCell!13785 V!43779) V!43779)

(assert (=> b!1156150 (= lt!518885 (get!18378 (select (arr!36064 _values!996) from!1455) lt!518884))))

(declare-fun lt!518899 () Unit!38081)

(assert (=> b!1156150 (= lt!518899 e!657492)))

(declare-fun c!114993 () Bool)

(assert (=> b!1156150 (= c!114993 (contains!6767 lt!518898 k0!934))))

(assert (=> b!1156150 (= lt!518898 (getCurrentListMapNoExtraKeys!4724 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55052 () Bool)

(assert (=> bm!55052 (= call!55053 call!55057)))

(declare-fun mapIsEmpty!45308 () Bool)

(assert (=> mapIsEmpty!45308 mapRes!45308))

(declare-fun b!1156151 () Bool)

(declare-fun Unit!38085 () Unit!38081)

(assert (=> b!1156151 (= e!657489 Unit!38085)))

(declare-fun bm!55053 () Bool)

(assert (=> bm!55053 (= call!55055 (+!3668 (ite c!114991 lt!518887 lt!518898) (ite c!114991 (tuple2!18511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114989 (tuple2!18511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!55054 () Bool)

(assert (=> bm!55054 (= call!55056 (addStillContains!911 (ite c!114991 lt!518887 lt!518898) (ite c!114991 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114989 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114991 minValue!944 (ite c!114989 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1156152 () Bool)

(declare-fun res!768003 () Bool)

(assert (=> b!1156152 (=> (not res!768003) (not e!657493))))

(assert (=> b!1156152 (= res!768003 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36599 _keys!1208))))))

(declare-fun b!1156153 () Bool)

(assert (=> b!1156153 (= e!657503 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156154 () Bool)

(assert (=> b!1156154 call!55053))

(declare-fun lt!518891 () Unit!38081)

(assert (=> b!1156154 (= lt!518891 call!55054)))

(assert (=> b!1156154 (= e!657489 lt!518891)))

(declare-fun b!1156155 () Bool)

(assert (=> b!1156155 (= e!657495 (= call!55052 call!55051))))

(assert (= (and start!98854 res!768008) b!1156135))

(assert (= (and b!1156135 res!768004) b!1156142))

(assert (= (and b!1156142 res!767995) b!1156127))

(assert (= (and b!1156127 res!768000) b!1156133))

(assert (= (and b!1156133 res!768006) b!1156152))

(assert (= (and b!1156152 res!768003) b!1156147))

(assert (= (and b!1156147 res!767994) b!1156138))

(assert (= (and b!1156138 res!768007) b!1156137))

(assert (= (and b!1156137 res!767998) b!1156130))

(assert (= (and b!1156130 res!768001) b!1156126))

(assert (= (and b!1156126 (not res!768005)) b!1156136))

(assert (= (and b!1156136 (not res!767999)) b!1156146))

(assert (= (and b!1156146 c!114994) b!1156143))

(assert (= (and b!1156146 (not c!114994)) b!1156155))

(assert (= (or b!1156143 b!1156155) bm!55048))

(assert (= (or b!1156143 b!1156155) bm!55051))

(assert (= (and b!1156146 (not res!768002)) b!1156150))

(assert (= (and b!1156150 c!114993) b!1156148))

(assert (= (and b!1156150 (not c!114993)) b!1156131))

(assert (= (and b!1156148 c!114991) b!1156129))

(assert (= (and b!1156148 (not c!114991)) b!1156141))

(assert (= (and b!1156141 c!114989) b!1156134))

(assert (= (and b!1156141 (not c!114989)) b!1156149))

(assert (= (and b!1156149 c!114992) b!1156154))

(assert (= (and b!1156149 (not c!114992)) b!1156151))

(assert (= (or b!1156134 b!1156154) bm!55049))

(assert (= (or b!1156134 b!1156154) bm!55050))

(assert (= (or b!1156134 b!1156154) bm!55052))

(assert (= (or b!1156129 bm!55052) bm!55047))

(assert (= (or b!1156129 bm!55049) bm!55054))

(assert (= (or b!1156129 bm!55050) bm!55053))

(assert (= (and b!1156148 c!114990) b!1156132))

(assert (= (and b!1156148 (not c!114990)) b!1156144))

(assert (= (and b!1156148 res!767996) b!1156153))

(assert (= (and b!1156150 res!767997) b!1156145))

(assert (= (and b!1156140 condMapEmpty!45308) mapIsEmpty!45308))

(assert (= (and b!1156140 (not condMapEmpty!45308)) mapNonEmpty!45308))

(get-info :version)

(assert (= (and mapNonEmpty!45308 ((_ is ValueCellFull!13785) mapValue!45308)) b!1156139))

(assert (= (and b!1156140 ((_ is ValueCellFull!13785) mapDefault!45308)) b!1156128))

(assert (= start!98854 b!1156140))

(declare-fun b_lambda!19565 () Bool)

(assert (=> (not b_lambda!19565) (not b!1156136)))

(declare-fun t!36703 () Bool)

(declare-fun tb!9271 () Bool)

(assert (=> (and start!98854 (= defaultEntry!1004 defaultEntry!1004) t!36703) tb!9271))

(declare-fun result!19107 () Bool)

(assert (=> tb!9271 (= result!19107 tp_is_empty!28989)))

(assert (=> b!1156136 t!36703))

(declare-fun b_and!39769 () Bool)

(assert (= b_and!39767 (and (=> t!36703 result!19107) b_and!39769)))

(declare-fun m!1065629 () Bool)

(assert (=> b!1156148 m!1065629))

(declare-fun m!1065631 () Bool)

(assert (=> b!1156148 m!1065631))

(declare-fun m!1065633 () Bool)

(assert (=> b!1156148 m!1065633))

(declare-fun m!1065635 () Bool)

(assert (=> b!1156148 m!1065635))

(declare-fun m!1065637 () Bool)

(assert (=> b!1156129 m!1065637))

(declare-fun m!1065639 () Bool)

(assert (=> b!1156129 m!1065639))

(declare-fun m!1065641 () Bool)

(assert (=> b!1156129 m!1065641))

(declare-fun m!1065643 () Bool)

(assert (=> bm!55054 m!1065643))

(declare-fun m!1065645 () Bool)

(assert (=> b!1156143 m!1065645))

(declare-fun m!1065647 () Bool)

(assert (=> bm!55053 m!1065647))

(declare-fun m!1065649 () Bool)

(assert (=> start!98854 m!1065649))

(declare-fun m!1065651 () Bool)

(assert (=> start!98854 m!1065651))

(declare-fun m!1065653 () Bool)

(assert (=> b!1156133 m!1065653))

(declare-fun m!1065655 () Bool)

(assert (=> b!1156146 m!1065655))

(declare-fun m!1065657 () Bool)

(assert (=> b!1156146 m!1065657))

(declare-fun m!1065659 () Bool)

(assert (=> bm!55051 m!1065659))

(declare-fun m!1065661 () Bool)

(assert (=> b!1156136 m!1065661))

(declare-fun m!1065663 () Bool)

(assert (=> b!1156136 m!1065663))

(declare-fun m!1065665 () Bool)

(assert (=> b!1156136 m!1065665))

(declare-fun m!1065667 () Bool)

(assert (=> b!1156136 m!1065667))

(declare-fun m!1065669 () Bool)

(assert (=> b!1156145 m!1065669))

(declare-fun m!1065671 () Bool)

(assert (=> b!1156126 m!1065671))

(declare-fun m!1065673 () Bool)

(assert (=> b!1156126 m!1065673))

(declare-fun m!1065675 () Bool)

(assert (=> b!1156147 m!1065675))

(declare-fun m!1065677 () Bool)

(assert (=> b!1156135 m!1065677))

(declare-fun m!1065679 () Bool)

(assert (=> bm!55047 m!1065679))

(declare-fun m!1065681 () Bool)

(assert (=> b!1156150 m!1065681))

(assert (=> b!1156150 m!1065659))

(declare-fun m!1065683 () Bool)

(assert (=> b!1156150 m!1065683))

(assert (=> b!1156150 m!1065683))

(declare-fun m!1065685 () Bool)

(assert (=> b!1156150 m!1065685))

(declare-fun m!1065687 () Bool)

(assert (=> b!1156150 m!1065687))

(declare-fun m!1065689 () Bool)

(assert (=> b!1156150 m!1065689))

(assert (=> b!1156150 m!1065687))

(assert (=> b!1156150 m!1065655))

(declare-fun m!1065691 () Bool)

(assert (=> b!1156150 m!1065691))

(assert (=> b!1156150 m!1065655))

(declare-fun m!1065693 () Bool)

(assert (=> b!1156150 m!1065693))

(assert (=> b!1156150 m!1065655))

(declare-fun m!1065695 () Bool)

(assert (=> b!1156153 m!1065695))

(declare-fun m!1065697 () Bool)

(assert (=> b!1156127 m!1065697))

(declare-fun m!1065699 () Bool)

(assert (=> b!1156137 m!1065699))

(declare-fun m!1065701 () Bool)

(assert (=> b!1156137 m!1065701))

(assert (=> bm!55048 m!1065669))

(declare-fun m!1065703 () Bool)

(assert (=> mapNonEmpty!45308 m!1065703))

(declare-fun m!1065705 () Bool)

(assert (=> b!1156130 m!1065705))

(declare-fun m!1065707 () Bool)

(assert (=> b!1156138 m!1065707))

(assert (=> b!1156132 m!1065695))

(check-sat b_and!39769 (not b!1156137) (not bm!55051) (not b!1156135) (not b!1156126) (not b!1156146) (not bm!55054) (not b!1156143) (not b!1156133) (not bm!55047) (not b_lambda!19565) (not b!1156132) (not bm!55048) (not mapNonEmpty!45308) (not bm!55053) (not b!1156145) (not b!1156153) (not start!98854) (not b!1156130) (not b!1156150) tp_is_empty!28989 (not b!1156127) (not b!1156148) (not b!1156147) (not b!1156136) (not b_next!24459) (not b!1156129))
(check-sat b_and!39769 (not b_next!24459))
