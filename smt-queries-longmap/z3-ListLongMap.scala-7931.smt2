; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98662 () Bool)

(assert start!98662)

(declare-fun b_free!24031 () Bool)

(declare-fun b_next!24031 () Bool)

(assert (=> start!98662 (= b_free!24031 (not b_next!24031))))

(declare-fun tp!84803 () Bool)

(declare-fun b_and!38913 () Bool)

(assert (=> start!98662 (= tp!84803 b_and!38913)))

(declare-datatypes ((array!74023 0))(
  ( (array!74024 (arr!35656 (Array (_ BitVec 32) (_ BitVec 64))) (size!36193 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74023)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1137977 () Bool)

(declare-fun e!647656 () Bool)

(declare-fun arrayContainsKey!0 (array!74023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137977 (= e!647656 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137978 () Bool)

(declare-fun res!759125 () Bool)

(declare-fun e!647657 () Bool)

(assert (=> b!1137978 (=> (not res!759125) (not e!647657))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74023 (_ BitVec 32)) Bool)

(assert (=> b!1137978 (= res!759125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137979 () Bool)

(declare-fun res!759122 () Bool)

(assert (=> b!1137979 (=> (not res!759122) (not e!647657))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137979 (= res!759122 (= (select (arr!35656 _keys!1208) i!673) k0!934))))

(declare-fun b!1137980 () Bool)

(declare-datatypes ((Unit!37197 0))(
  ( (Unit!37198) )
))
(declare-fun e!647660 () Unit!37197)

(declare-fun Unit!37199 () Unit!37197)

(assert (=> b!1137980 (= e!647660 Unit!37199)))

(declare-fun lt!505909 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1137980 (= lt!505909 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111536 () Bool)

(assert (=> b!1137980 (= c!111536 (and (not lt!505909) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505912 () Unit!37197)

(declare-fun e!647658 () Unit!37197)

(assert (=> b!1137980 (= lt!505912 e!647658)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!43209 0))(
  ( (V!43210 (val!14337 Int)) )
))
(declare-datatypes ((ValueCell!13571 0))(
  ( (ValueCellFull!13571 (v!16970 V!43209)) (EmptyCell!13571) )
))
(declare-datatypes ((array!74025 0))(
  ( (array!74026 (arr!35657 (Array (_ BitVec 32) ValueCell!13571)) (size!36194 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74025)

(declare-fun minValue!944 () V!43209)

(declare-fun zeroValue!944 () V!43209)

(declare-fun lt!505914 () Unit!37197)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!349 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 64) (_ BitVec 32) Int) Unit!37197)

(assert (=> b!1137980 (= lt!505914 (lemmaListMapContainsThenArrayContainsFrom!349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111540 () Bool)

(assert (=> b!1137980 (= c!111540 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759123 () Bool)

(declare-fun e!647665 () Bool)

(assert (=> b!1137980 (= res!759123 e!647665)))

(assert (=> b!1137980 (=> (not res!759123) (not e!647656))))

(assert (=> b!1137980 e!647656))

(declare-fun lt!505911 () Unit!37197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74023 (_ BitVec 32) (_ BitVec 32)) Unit!37197)

(assert (=> b!1137980 (= lt!505911 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24877 0))(
  ( (Nil!24874) (Cons!24873 (h!26091 (_ BitVec 64)) (t!35892 List!24877)) )
))
(declare-fun arrayNoDuplicates!0 (array!74023 (_ BitVec 32) List!24877) Bool)

(assert (=> b!1137980 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24874)))

(declare-fun lt!505917 () Unit!37197)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74023 (_ BitVec 64) (_ BitVec 32) List!24877) Unit!37197)

(assert (=> b!1137980 (= lt!505917 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24874))))

(assert (=> b!1137980 false))

(declare-fun b!1137981 () Bool)

(declare-fun res!759132 () Bool)

(declare-fun e!647668 () Bool)

(assert (=> b!1137981 (=> (not res!759132) (not e!647668))))

(declare-fun lt!505922 () array!74023)

(assert (=> b!1137981 (= res!759132 (arrayNoDuplicates!0 lt!505922 #b00000000000000000000000000000000 Nil!24874))))

(declare-fun e!647667 () Bool)

(declare-fun b!1137982 () Bool)

(declare-datatypes ((tuple2!18112 0))(
  ( (tuple2!18113 (_1!9067 (_ BitVec 64)) (_2!9067 V!43209)) )
))
(declare-datatypes ((List!24878 0))(
  ( (Nil!24875) (Cons!24874 (h!26092 tuple2!18112) (t!35893 List!24878)) )
))
(declare-datatypes ((ListLongMap!16089 0))(
  ( (ListLongMap!16090 (toList!8060 List!24878)) )
))
(declare-fun call!49985 () ListLongMap!16089)

(declare-fun call!49982 () ListLongMap!16089)

(declare-fun -!1203 (ListLongMap!16089 (_ BitVec 64)) ListLongMap!16089)

(assert (=> b!1137982 (= e!647667 (= call!49982 (-!1203 call!49985 k0!934)))))

(declare-fun bm!49976 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4571 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) Int) ListLongMap!16089)

(assert (=> bm!49976 (= call!49985 (getCurrentListMapNoExtraKeys!4571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137983 () Bool)

(assert (=> b!1137983 (= e!647657 e!647668)))

(declare-fun res!759129 () Bool)

(assert (=> b!1137983 (=> (not res!759129) (not e!647668))))

(assert (=> b!1137983 (= res!759129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505922 mask!1564))))

(assert (=> b!1137983 (= lt!505922 (array!74024 (store (arr!35656 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36193 _keys!1208)))))

(declare-fun b!1137984 () Bool)

(assert (=> b!1137984 (= e!647665 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49977 () Bool)

(declare-fun call!49984 () ListLongMap!16089)

(declare-fun call!49986 () ListLongMap!16089)

(assert (=> bm!49977 (= call!49984 call!49986)))

(declare-fun b!1137985 () Bool)

(declare-fun e!647661 () Bool)

(assert (=> b!1137985 (= e!647661 true)))

(declare-fun lt!505919 () Unit!37197)

(assert (=> b!1137985 (= lt!505919 e!647660)))

(declare-fun c!111538 () Bool)

(declare-fun lt!505915 () ListLongMap!16089)

(declare-fun contains!6612 (ListLongMap!16089 (_ BitVec 64)) Bool)

(assert (=> b!1137985 (= c!111538 (contains!6612 lt!505915 k0!934))))

(assert (=> b!1137985 (= lt!505915 (getCurrentListMapNoExtraKeys!4571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137986 () Bool)

(declare-fun e!647669 () Unit!37197)

(declare-fun lt!505916 () Unit!37197)

(assert (=> b!1137986 (= e!647669 lt!505916)))

(declare-fun call!49983 () Unit!37197)

(assert (=> b!1137986 (= lt!505916 call!49983)))

(declare-fun call!49980 () Bool)

(assert (=> b!1137986 call!49980))

(declare-fun b!1137987 () Bool)

(declare-fun e!647671 () Unit!37197)

(declare-fun Unit!37200 () Unit!37197)

(assert (=> b!1137987 (= e!647671 Unit!37200)))

(declare-fun b!1137988 () Bool)

(assert (=> b!1137988 (= e!647665 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505909) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137989 () Bool)

(assert (=> b!1137989 call!49980))

(declare-fun lt!505907 () Unit!37197)

(assert (=> b!1137989 (= lt!505907 call!49983)))

(assert (=> b!1137989 (= e!647671 lt!505907)))

(declare-fun lt!505921 () array!74025)

(declare-fun bm!49978 () Bool)

(assert (=> bm!49978 (= call!49982 (getCurrentListMapNoExtraKeys!4571 lt!505922 lt!505921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49979 () Bool)

(declare-fun call!49979 () Bool)

(assert (=> bm!49979 (= call!49980 call!49979)))

(declare-fun b!1137990 () Bool)

(declare-fun e!647662 () Bool)

(declare-fun e!647663 () Bool)

(declare-fun mapRes!44666 () Bool)

(assert (=> b!1137990 (= e!647662 (and e!647663 mapRes!44666))))

(declare-fun condMapEmpty!44666 () Bool)

(declare-fun mapDefault!44666 () ValueCell!13571)

(assert (=> b!1137990 (= condMapEmpty!44666 (= (arr!35657 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13571)) mapDefault!44666)))))

(declare-fun b!1137991 () Bool)

(declare-fun res!759124 () Bool)

(assert (=> b!1137991 (=> (not res!759124) (not e!647657))))

(assert (=> b!1137991 (= res!759124 (and (= (size!36194 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36193 _keys!1208) (size!36194 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!111537 () Bool)

(declare-fun bm!49980 () Bool)

(declare-fun +!3515 (ListLongMap!16089 tuple2!18112) ListLongMap!16089)

(assert (=> bm!49980 (= call!49986 (+!3515 lt!505915 (ite (or c!111536 c!111537) (tuple2!18113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137992 () Bool)

(declare-fun tp_is_empty!28561 () Bool)

(assert (=> b!1137992 (= e!647663 tp_is_empty!28561)))

(declare-fun b!1137993 () Bool)

(declare-fun res!759131 () Bool)

(assert (=> b!1137993 (=> (not res!759131) (not e!647657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137993 (= res!759131 (validKeyInArray!0 k0!934))))

(declare-fun b!1137994 () Bool)

(declare-fun Unit!37201 () Unit!37197)

(assert (=> b!1137994 (= e!647660 Unit!37201)))

(declare-fun b!1137995 () Bool)

(assert (=> b!1137995 (= c!111537 (and (not lt!505909) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137995 (= e!647658 e!647669)))

(declare-fun res!759130 () Bool)

(assert (=> start!98662 (=> (not res!759130) (not e!647657))))

(assert (=> start!98662 (= res!759130 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36193 _keys!1208))))))

(assert (=> start!98662 e!647657))

(assert (=> start!98662 tp_is_empty!28561))

(declare-fun array_inv!27390 (array!74023) Bool)

(assert (=> start!98662 (array_inv!27390 _keys!1208)))

(assert (=> start!98662 true))

(assert (=> start!98662 tp!84803))

(declare-fun array_inv!27391 (array!74025) Bool)

(assert (=> start!98662 (and (array_inv!27391 _values!996) e!647662)))

(declare-fun b!1137996 () Bool)

(assert (=> b!1137996 (= e!647667 (= call!49982 call!49985))))

(declare-fun mapIsEmpty!44666 () Bool)

(assert (=> mapIsEmpty!44666 mapRes!44666))

(declare-fun b!1137997 () Bool)

(declare-fun res!759134 () Bool)

(assert (=> b!1137997 (=> (not res!759134) (not e!647657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137997 (= res!759134 (validMask!0 mask!1564))))

(declare-fun b!1137998 () Bool)

(declare-fun e!647659 () Bool)

(assert (=> b!1137998 (= e!647659 e!647661)))

(declare-fun res!759128 () Bool)

(assert (=> b!1137998 (=> res!759128 e!647661)))

(assert (=> b!1137998 (= res!759128 (not (= (select (arr!35656 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137998 e!647667))

(declare-fun c!111539 () Bool)

(assert (=> b!1137998 (= c!111539 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505924 () Unit!37197)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!461 (array!74023 array!74025 (_ BitVec 32) (_ BitVec 32) V!43209 V!43209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37197)

(assert (=> b!1137998 (= lt!505924 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49981 () Unit!37197)

(declare-fun bm!49981 () Bool)

(declare-fun addStillContains!741 (ListLongMap!16089 (_ BitVec 64) V!43209 (_ BitVec 64)) Unit!37197)

(assert (=> bm!49981 (= call!49981 (addStillContains!741 lt!505915 (ite (or c!111536 c!111537) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111536 c!111537) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1137999 () Bool)

(declare-fun e!647664 () Bool)

(assert (=> b!1137999 (= e!647664 tp_is_empty!28561)))

(declare-fun bm!49982 () Bool)

(assert (=> bm!49982 (= call!49983 call!49981)))

(declare-fun b!1138000 () Bool)

(declare-fun res!759135 () Bool)

(assert (=> b!1138000 (=> (not res!759135) (not e!647657))))

(assert (=> b!1138000 (= res!759135 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24874))))

(declare-fun b!1138001 () Bool)

(declare-fun e!647670 () Bool)

(assert (=> b!1138001 (= e!647668 (not e!647670))))

(declare-fun res!759133 () Bool)

(assert (=> b!1138001 (=> res!759133 e!647670)))

(assert (=> b!1138001 (= res!759133 (bvsgt from!1455 i!673))))

(assert (=> b!1138001 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505910 () Unit!37197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74023 (_ BitVec 64) (_ BitVec 32)) Unit!37197)

(assert (=> b!1138001 (= lt!505910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44666 () Bool)

(declare-fun tp!84804 () Bool)

(assert (=> mapNonEmpty!44666 (= mapRes!44666 (and tp!84804 e!647664))))

(declare-fun mapRest!44666 () (Array (_ BitVec 32) ValueCell!13571))

(declare-fun mapKey!44666 () (_ BitVec 32))

(declare-fun mapValue!44666 () ValueCell!13571)

(assert (=> mapNonEmpty!44666 (= (arr!35657 _values!996) (store mapRest!44666 mapKey!44666 mapValue!44666))))

(declare-fun b!1138002 () Bool)

(declare-fun lt!505913 () ListLongMap!16089)

(assert (=> b!1138002 (contains!6612 (+!3515 lt!505913 (tuple2!18113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505908 () Unit!37197)

(assert (=> b!1138002 (= lt!505908 (addStillContains!741 lt!505913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1138002 call!49979))

(assert (=> b!1138002 (= lt!505913 call!49986)))

(declare-fun lt!505923 () Unit!37197)

(assert (=> b!1138002 (= lt!505923 call!49981)))

(assert (=> b!1138002 (= e!647658 lt!505908)))

(declare-fun bm!49983 () Bool)

(assert (=> bm!49983 (= call!49979 (contains!6612 (ite c!111536 lt!505913 call!49984) k0!934))))

(declare-fun b!1138003 () Bool)

(assert (=> b!1138003 (= e!647670 e!647659)))

(declare-fun res!759127 () Bool)

(assert (=> b!1138003 (=> res!759127 e!647659)))

(assert (=> b!1138003 (= res!759127 (not (= from!1455 i!673)))))

(declare-fun lt!505920 () ListLongMap!16089)

(assert (=> b!1138003 (= lt!505920 (getCurrentListMapNoExtraKeys!4571 lt!505922 lt!505921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2621 (Int (_ BitVec 64)) V!43209)

(assert (=> b!1138003 (= lt!505921 (array!74026 (store (arr!35657 _values!996) i!673 (ValueCellFull!13571 (dynLambda!2621 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36194 _values!996)))))

(declare-fun lt!505918 () ListLongMap!16089)

(assert (=> b!1138003 (= lt!505918 (getCurrentListMapNoExtraKeys!4571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138004 () Bool)

(assert (=> b!1138004 (= e!647669 e!647671)))

(declare-fun c!111535 () Bool)

(assert (=> b!1138004 (= c!111535 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505909))))

(declare-fun b!1138005 () Bool)

(declare-fun res!759126 () Bool)

(assert (=> b!1138005 (=> (not res!759126) (not e!647657))))

(assert (=> b!1138005 (= res!759126 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36193 _keys!1208))))))

(assert (= (and start!98662 res!759130) b!1137997))

(assert (= (and b!1137997 res!759134) b!1137991))

(assert (= (and b!1137991 res!759124) b!1137978))

(assert (= (and b!1137978 res!759125) b!1138000))

(assert (= (and b!1138000 res!759135) b!1138005))

(assert (= (and b!1138005 res!759126) b!1137993))

(assert (= (and b!1137993 res!759131) b!1137979))

(assert (= (and b!1137979 res!759122) b!1137983))

(assert (= (and b!1137983 res!759129) b!1137981))

(assert (= (and b!1137981 res!759132) b!1138001))

(assert (= (and b!1138001 (not res!759133)) b!1138003))

(assert (= (and b!1138003 (not res!759127)) b!1137998))

(assert (= (and b!1137998 c!111539) b!1137982))

(assert (= (and b!1137998 (not c!111539)) b!1137996))

(assert (= (or b!1137982 b!1137996) bm!49978))

(assert (= (or b!1137982 b!1137996) bm!49976))

(assert (= (and b!1137998 (not res!759128)) b!1137985))

(assert (= (and b!1137985 c!111538) b!1137980))

(assert (= (and b!1137985 (not c!111538)) b!1137994))

(assert (= (and b!1137980 c!111536) b!1138002))

(assert (= (and b!1137980 (not c!111536)) b!1137995))

(assert (= (and b!1137995 c!111537) b!1137986))

(assert (= (and b!1137995 (not c!111537)) b!1138004))

(assert (= (and b!1138004 c!111535) b!1137989))

(assert (= (and b!1138004 (not c!111535)) b!1137987))

(assert (= (or b!1137986 b!1137989) bm!49982))

(assert (= (or b!1137986 b!1137989) bm!49977))

(assert (= (or b!1137986 b!1137989) bm!49979))

(assert (= (or b!1138002 bm!49979) bm!49983))

(assert (= (or b!1138002 bm!49982) bm!49981))

(assert (= (or b!1138002 bm!49977) bm!49980))

(assert (= (and b!1137980 c!111540) b!1137984))

(assert (= (and b!1137980 (not c!111540)) b!1137988))

(assert (= (and b!1137980 res!759123) b!1137977))

(assert (= (and b!1137990 condMapEmpty!44666) mapIsEmpty!44666))

(assert (= (and b!1137990 (not condMapEmpty!44666)) mapNonEmpty!44666))

(get-info :version)

(assert (= (and mapNonEmpty!44666 ((_ is ValueCellFull!13571) mapValue!44666)) b!1137999))

(assert (= (and b!1137990 ((_ is ValueCellFull!13571) mapDefault!44666)) b!1137992))

(assert (= start!98662 b!1137990))

(declare-fun b_lambda!19131 () Bool)

(assert (=> (not b_lambda!19131) (not b!1138003)))

(declare-fun t!35891 () Bool)

(declare-fun tb!8835 () Bool)

(assert (=> (and start!98662 (= defaultEntry!1004 defaultEntry!1004) t!35891) tb!8835))

(declare-fun result!18243 () Bool)

(assert (=> tb!8835 (= result!18243 tp_is_empty!28561)))

(assert (=> b!1138003 t!35891))

(declare-fun b_and!38915 () Bool)

(assert (= b_and!38913 (and (=> t!35891 result!18243) b_and!38915)))

(declare-fun m!1050531 () Bool)

(assert (=> b!1137981 m!1050531))

(declare-fun m!1050533 () Bool)

(assert (=> mapNonEmpty!44666 m!1050533))

(declare-fun m!1050535 () Bool)

(assert (=> b!1137978 m!1050535))

(declare-fun m!1050537 () Bool)

(assert (=> b!1138002 m!1050537))

(assert (=> b!1138002 m!1050537))

(declare-fun m!1050539 () Bool)

(assert (=> b!1138002 m!1050539))

(declare-fun m!1050541 () Bool)

(assert (=> b!1138002 m!1050541))

(declare-fun m!1050543 () Bool)

(assert (=> b!1137983 m!1050543))

(declare-fun m!1050545 () Bool)

(assert (=> b!1137983 m!1050545))

(declare-fun m!1050547 () Bool)

(assert (=> bm!49981 m!1050547))

(declare-fun m!1050549 () Bool)

(assert (=> bm!49978 m!1050549))

(declare-fun m!1050551 () Bool)

(assert (=> bm!49976 m!1050551))

(declare-fun m!1050553 () Bool)

(assert (=> start!98662 m!1050553))

(declare-fun m!1050555 () Bool)

(assert (=> start!98662 m!1050555))

(declare-fun m!1050557 () Bool)

(assert (=> b!1137982 m!1050557))

(declare-fun m!1050559 () Bool)

(assert (=> b!1138000 m!1050559))

(declare-fun m!1050561 () Bool)

(assert (=> b!1137977 m!1050561))

(declare-fun m!1050563 () Bool)

(assert (=> b!1137997 m!1050563))

(declare-fun m!1050565 () Bool)

(assert (=> b!1137979 m!1050565))

(declare-fun m!1050567 () Bool)

(assert (=> bm!49980 m!1050567))

(declare-fun m!1050569 () Bool)

(assert (=> b!1137998 m!1050569))

(declare-fun m!1050571 () Bool)

(assert (=> b!1137998 m!1050571))

(assert (=> b!1137984 m!1050561))

(declare-fun m!1050573 () Bool)

(assert (=> b!1137980 m!1050573))

(declare-fun m!1050575 () Bool)

(assert (=> b!1137980 m!1050575))

(declare-fun m!1050577 () Bool)

(assert (=> b!1137980 m!1050577))

(declare-fun m!1050579 () Bool)

(assert (=> b!1137980 m!1050579))

(declare-fun m!1050581 () Bool)

(assert (=> b!1138001 m!1050581))

(declare-fun m!1050583 () Bool)

(assert (=> b!1138001 m!1050583))

(declare-fun m!1050585 () Bool)

(assert (=> b!1137985 m!1050585))

(assert (=> b!1137985 m!1050551))

(declare-fun m!1050587 () Bool)

(assert (=> bm!49983 m!1050587))

(declare-fun m!1050589 () Bool)

(assert (=> b!1137993 m!1050589))

(declare-fun m!1050591 () Bool)

(assert (=> b!1138003 m!1050591))

(declare-fun m!1050593 () Bool)

(assert (=> b!1138003 m!1050593))

(declare-fun m!1050595 () Bool)

(assert (=> b!1138003 m!1050595))

(declare-fun m!1050597 () Bool)

(assert (=> b!1138003 m!1050597))

(check-sat (not b!1137983) (not b!1137982) (not b!1137997) (not bm!49978) (not b_lambda!19131) (not b!1138000) (not b!1138002) (not b!1138001) (not b!1137985) (not bm!49981) (not b!1137977) (not b!1138003) (not bm!49980) (not b!1137993) b_and!38915 (not start!98662) tp_is_empty!28561 (not b!1137984) (not b!1137981) (not bm!49976) (not b!1137978) (not b_next!24031) (not b!1137998) (not b!1137980) (not bm!49983) (not mapNonEmpty!44666))
(check-sat b_and!38915 (not b_next!24031))
