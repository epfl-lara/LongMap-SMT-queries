; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98938 () Bool)

(assert start!98938)

(declare-fun b_free!24543 () Bool)

(declare-fun b_next!24543 () Bool)

(assert (=> start!98938 (= b_free!24543 (not b_next!24543))))

(declare-fun tp!86340 () Bool)

(declare-fun b_and!39935 () Bool)

(assert (=> start!98938 (= tp!86340 b_and!39935)))

(declare-fun b!1159990 () Bool)

(declare-fun e!659637 () Bool)

(assert (=> b!1159990 (= e!659637 true)))

(declare-fun e!659646 () Bool)

(assert (=> b!1159990 e!659646))

(declare-fun res!769890 () Bool)

(assert (=> b!1159990 (=> (not res!769890) (not e!659646))))

(declare-datatypes ((V!43891 0))(
  ( (V!43892 (val!14593 Int)) )
))
(declare-datatypes ((tuple2!18584 0))(
  ( (tuple2!18585 (_1!9303 (_ BitVec 64)) (_2!9303 V!43891)) )
))
(declare-datatypes ((List!25321 0))(
  ( (Nil!25318) (Cons!25317 (h!26526 tuple2!18584) (t!36856 List!25321)) )
))
(declare-datatypes ((ListLongMap!16553 0))(
  ( (ListLongMap!16554 (toList!8292 List!25321)) )
))
(declare-fun lt!521655 () ListLongMap!16553)

(declare-fun lt!521661 () ListLongMap!16553)

(assert (=> b!1159990 (= res!769890 (= lt!521655 lt!521661))))

(declare-fun lt!521663 () ListLongMap!16553)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1401 (ListLongMap!16553 (_ BitVec 64)) ListLongMap!16553)

(assert (=> b!1159990 (= lt!521655 (-!1401 lt!521663 k0!934))))

(declare-fun lt!521664 () V!43891)

(declare-datatypes ((array!74987 0))(
  ( (array!74988 (arr!36144 (Array (_ BitVec 32) (_ BitVec 64))) (size!36680 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74987)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3697 (ListLongMap!16553 tuple2!18584) ListLongMap!16553)

(assert (=> b!1159990 (= (-!1401 (+!3697 lt!521661 (tuple2!18585 (select (arr!36144 _keys!1208) from!1455) lt!521664)) (select (arr!36144 _keys!1208) from!1455)) lt!521661)))

(declare-datatypes ((Unit!38235 0))(
  ( (Unit!38236) )
))
(declare-fun lt!521672 () Unit!38235)

(declare-fun addThenRemoveForNewKeyIsSame!236 (ListLongMap!16553 (_ BitVec 64) V!43891) Unit!38235)

(assert (=> b!1159990 (= lt!521672 (addThenRemoveForNewKeyIsSame!236 lt!521661 (select (arr!36144 _keys!1208) from!1455) lt!521664))))

(declare-fun lt!521660 () V!43891)

(declare-datatypes ((ValueCell!13827 0))(
  ( (ValueCellFull!13827 (v!17230 V!43891)) (EmptyCell!13827) )
))
(declare-datatypes ((array!74989 0))(
  ( (array!74990 (arr!36145 (Array (_ BitVec 32) ValueCell!13827)) (size!36681 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74989)

(declare-fun get!18430 (ValueCell!13827 V!43891) V!43891)

(assert (=> b!1159990 (= lt!521664 (get!18430 (select (arr!36145 _values!996) from!1455) lt!521660))))

(declare-fun lt!521654 () Unit!38235)

(declare-fun e!659632 () Unit!38235)

(assert (=> b!1159990 (= lt!521654 e!659632)))

(declare-fun c!115748 () Bool)

(declare-fun contains!6798 (ListLongMap!16553 (_ BitVec 64)) Bool)

(assert (=> b!1159990 (= c!115748 (contains!6798 lt!521661 k0!934))))

(declare-fun zeroValue!944 () V!43891)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43891)

(declare-fun getCurrentListMapNoExtraKeys!4756 (array!74987 array!74989 (_ BitVec 32) (_ BitVec 32) V!43891 V!43891 (_ BitVec 32) Int) ListLongMap!16553)

(assert (=> b!1159990 (= lt!521661 (getCurrentListMapNoExtraKeys!4756 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159991 () Bool)

(declare-fun Unit!38237 () Unit!38235)

(assert (=> b!1159991 (= e!659632 Unit!38237)))

(declare-fun b!1159992 () Bool)

(declare-fun e!659638 () Bool)

(declare-fun e!659630 () Bool)

(declare-fun mapRes!45434 () Bool)

(assert (=> b!1159992 (= e!659638 (and e!659630 mapRes!45434))))

(declare-fun condMapEmpty!45434 () Bool)

(declare-fun mapDefault!45434 () ValueCell!13827)

(assert (=> b!1159992 (= condMapEmpty!45434 (= (arr!36145 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13827)) mapDefault!45434)))))

(declare-fun bm!56055 () Bool)

(declare-fun call!56065 () Unit!38235)

(declare-fun call!56062 () Unit!38235)

(assert (=> bm!56055 (= call!56065 call!56062)))

(declare-fun b!1159994 () Bool)

(declare-fun res!769895 () Bool)

(declare-fun e!659633 () Bool)

(assert (=> b!1159994 (=> (not res!769895) (not e!659633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159994 (= res!769895 (validMask!0 mask!1564))))

(declare-fun b!1159995 () Bool)

(declare-fun e!659639 () Bool)

(assert (=> b!1159995 (= e!659639 e!659637)))

(declare-fun res!769889 () Bool)

(assert (=> b!1159995 (=> res!769889 e!659637)))

(assert (=> b!1159995 (= res!769889 (not (= (select (arr!36144 _keys!1208) from!1455) k0!934)))))

(declare-fun e!659631 () Bool)

(assert (=> b!1159995 e!659631))

(declare-fun c!115747 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159995 (= c!115747 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521659 () Unit!38235)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!632 (array!74987 array!74989 (_ BitVec 32) (_ BitVec 32) V!43891 V!43891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38235)

(assert (=> b!1159995 (= lt!521659 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159996 () Bool)

(declare-fun e!659640 () Bool)

(declare-fun tp_is_empty!29073 () Bool)

(assert (=> b!1159996 (= e!659640 tp_is_empty!29073)))

(declare-fun b!1159997 () Bool)

(declare-fun call!56059 () ListLongMap!16553)

(declare-fun call!56063 () ListLongMap!16553)

(assert (=> b!1159997 (= e!659631 (= call!56059 call!56063))))

(declare-fun lt!521662 () ListLongMap!16553)

(declare-fun bm!56056 () Bool)

(declare-fun c!115746 () Bool)

(declare-fun c!115749 () Bool)

(declare-fun addStillContains!939 (ListLongMap!16553 (_ BitVec 64) V!43891 (_ BitVec 64)) Unit!38235)

(assert (=> bm!56056 (= call!56062 (addStillContains!939 (ite c!115746 lt!521662 lt!521661) (ite c!115746 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115749 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115746 minValue!944 (ite c!115749 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1159998 () Bool)

(assert (=> b!1159998 (= e!659630 tp_is_empty!29073)))

(declare-fun b!1159999 () Bool)

(declare-fun res!769891 () Bool)

(assert (=> b!1159999 (=> (not res!769891) (not e!659633))))

(declare-datatypes ((List!25322 0))(
  ( (Nil!25319) (Cons!25318 (h!26527 (_ BitVec 64)) (t!36857 List!25322)) )
))
(declare-fun arrayNoDuplicates!0 (array!74987 (_ BitVec 32) List!25322) Bool)

(assert (=> b!1159999 (= res!769891 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25319))))

(declare-fun lt!521657 () array!74989)

(declare-fun b!1160000 () Bool)

(declare-fun lt!521658 () array!74987)

(assert (=> b!1160000 (= e!659646 (= lt!521655 (getCurrentListMapNoExtraKeys!4756 lt!521658 lt!521657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160001 () Bool)

(declare-fun lt!521671 () Bool)

(declare-fun e!659644 () Bool)

(assert (=> b!1160001 (= e!659644 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521671) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160002 () Bool)

(declare-fun e!659641 () Bool)

(assert (=> b!1160002 (= e!659633 e!659641)))

(declare-fun res!769896 () Bool)

(assert (=> b!1160002 (=> (not res!769896) (not e!659641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74987 (_ BitVec 32)) Bool)

(assert (=> b!1160002 (= res!769896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521658 mask!1564))))

(assert (=> b!1160002 (= lt!521658 (array!74988 (store (arr!36144 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36680 _keys!1208)))))

(declare-fun b!1160003 () Bool)

(assert (=> b!1160003 (= e!659631 (= call!56059 (-!1401 call!56063 k0!934)))))

(declare-fun b!1160004 () Bool)

(declare-fun e!659645 () Bool)

(assert (=> b!1160004 (= e!659641 (not e!659645))))

(declare-fun res!769894 () Bool)

(assert (=> b!1160004 (=> res!769894 e!659645)))

(assert (=> b!1160004 (= res!769894 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160004 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521673 () Unit!38235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74987 (_ BitVec 64) (_ BitVec 32)) Unit!38235)

(assert (=> b!1160004 (= lt!521673 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160005 () Bool)

(declare-fun res!769892 () Bool)

(assert (=> b!1160005 (=> (not res!769892) (not e!659633))))

(assert (=> b!1160005 (= res!769892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160006 () Bool)

(declare-fun e!659635 () Unit!38235)

(declare-fun lt!521656 () Unit!38235)

(assert (=> b!1160006 (= e!659635 lt!521656)))

(assert (=> b!1160006 (= lt!521656 call!56065)))

(declare-fun call!56061 () Bool)

(assert (=> b!1160006 call!56061))

(declare-fun b!1160007 () Bool)

(assert (=> b!1160007 (contains!6798 (+!3697 lt!521662 (tuple2!18585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521665 () Unit!38235)

(assert (=> b!1160007 (= lt!521665 call!56062)))

(declare-fun call!56058 () Bool)

(assert (=> b!1160007 call!56058))

(declare-fun call!56060 () ListLongMap!16553)

(assert (=> b!1160007 (= lt!521662 call!56060)))

(declare-fun lt!521670 () Unit!38235)

(assert (=> b!1160007 (= lt!521670 (addStillContains!939 lt!521661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659636 () Unit!38235)

(assert (=> b!1160007 (= e!659636 lt!521665)))

(declare-fun b!1160008 () Bool)

(declare-fun res!769887 () Bool)

(assert (=> b!1160008 (=> (not res!769887) (not e!659641))))

(assert (=> b!1160008 (= res!769887 (arrayNoDuplicates!0 lt!521658 #b00000000000000000000000000000000 Nil!25319))))

(declare-fun b!1160009 () Bool)

(declare-fun res!769886 () Bool)

(assert (=> b!1160009 (=> (not res!769886) (not e!659633))))

(assert (=> b!1160009 (= res!769886 (and (= (size!36681 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36680 _keys!1208) (size!36681 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160010 () Bool)

(assert (=> b!1160010 (= e!659644 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56057 () Bool)

(declare-fun call!56064 () ListLongMap!16553)

(assert (=> bm!56057 (= call!56064 call!56060)))

(declare-fun b!1160011 () Bool)

(assert (=> b!1160011 (= c!115749 (and (not lt!521671) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160011 (= e!659636 e!659635)))

(declare-fun mapIsEmpty!45434 () Bool)

(assert (=> mapIsEmpty!45434 mapRes!45434))

(declare-fun res!769898 () Bool)

(assert (=> start!98938 (=> (not res!769898) (not e!659633))))

(assert (=> start!98938 (= res!769898 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36680 _keys!1208))))))

(assert (=> start!98938 e!659633))

(assert (=> start!98938 tp_is_empty!29073))

(declare-fun array_inv!27656 (array!74987) Bool)

(assert (=> start!98938 (array_inv!27656 _keys!1208)))

(assert (=> start!98938 true))

(assert (=> start!98938 tp!86340))

(declare-fun array_inv!27657 (array!74989) Bool)

(assert (=> start!98938 (and (array_inv!27657 _values!996) e!659638)))

(declare-fun b!1159993 () Bool)

(declare-fun e!659642 () Bool)

(assert (=> b!1159993 (= e!659642 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160012 () Bool)

(declare-fun Unit!38238 () Unit!38235)

(assert (=> b!1160012 (= e!659632 Unit!38238)))

(assert (=> b!1160012 (= lt!521671 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160012 (= c!115746 (and (not lt!521671) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521652 () Unit!38235)

(assert (=> b!1160012 (= lt!521652 e!659636)))

(declare-fun lt!521668 () Unit!38235)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!526 (array!74987 array!74989 (_ BitVec 32) (_ BitVec 32) V!43891 V!43891 (_ BitVec 64) (_ BitVec 32) Int) Unit!38235)

(assert (=> b!1160012 (= lt!521668 (lemmaListMapContainsThenArrayContainsFrom!526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115750 () Bool)

(assert (=> b!1160012 (= c!115750 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769897 () Bool)

(assert (=> b!1160012 (= res!769897 e!659644)))

(assert (=> b!1160012 (=> (not res!769897) (not e!659642))))

(assert (=> b!1160012 e!659642))

(declare-fun lt!521653 () Unit!38235)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74987 (_ BitVec 32) (_ BitVec 32)) Unit!38235)

(assert (=> b!1160012 (= lt!521653 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160012 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25319)))

(declare-fun lt!521669 () Unit!38235)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74987 (_ BitVec 64) (_ BitVec 32) List!25322) Unit!38235)

(assert (=> b!1160012 (= lt!521669 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25319))))

(assert (=> b!1160012 false))

(declare-fun bm!56058 () Bool)

(assert (=> bm!56058 (= call!56059 (getCurrentListMapNoExtraKeys!4756 lt!521658 lt!521657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56059 () Bool)

(assert (=> bm!56059 (= call!56061 call!56058)))

(declare-fun b!1160013 () Bool)

(assert (=> b!1160013 (= e!659645 e!659639)))

(declare-fun res!769884 () Bool)

(assert (=> b!1160013 (=> res!769884 e!659639)))

(assert (=> b!1160013 (= res!769884 (not (= from!1455 i!673)))))

(declare-fun lt!521666 () ListLongMap!16553)

(assert (=> b!1160013 (= lt!521666 (getCurrentListMapNoExtraKeys!4756 lt!521658 lt!521657 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160013 (= lt!521657 (array!74990 (store (arr!36145 _values!996) i!673 (ValueCellFull!13827 lt!521660)) (size!36681 _values!996)))))

(declare-fun dynLambda!2756 (Int (_ BitVec 64)) V!43891)

(assert (=> b!1160013 (= lt!521660 (dynLambda!2756 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160013 (= lt!521663 (getCurrentListMapNoExtraKeys!4756 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56060 () Bool)

(assert (=> bm!56060 (= call!56058 (contains!6798 (ite c!115746 lt!521662 call!56064) k0!934))))

(declare-fun b!1160014 () Bool)

(declare-fun e!659634 () Unit!38235)

(declare-fun Unit!38239 () Unit!38235)

(assert (=> b!1160014 (= e!659634 Unit!38239)))

(declare-fun mapNonEmpty!45434 () Bool)

(declare-fun tp!86339 () Bool)

(assert (=> mapNonEmpty!45434 (= mapRes!45434 (and tp!86339 e!659640))))

(declare-fun mapRest!45434 () (Array (_ BitVec 32) ValueCell!13827))

(declare-fun mapValue!45434 () ValueCell!13827)

(declare-fun mapKey!45434 () (_ BitVec 32))

(assert (=> mapNonEmpty!45434 (= (arr!36145 _values!996) (store mapRest!45434 mapKey!45434 mapValue!45434))))

(declare-fun bm!56061 () Bool)

(assert (=> bm!56061 (= call!56063 (getCurrentListMapNoExtraKeys!4756 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160015 () Bool)

(declare-fun res!769885 () Bool)

(assert (=> b!1160015 (=> (not res!769885) (not e!659633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160015 (= res!769885 (validKeyInArray!0 k0!934))))

(declare-fun b!1160016 () Bool)

(declare-fun res!769893 () Bool)

(assert (=> b!1160016 (=> (not res!769893) (not e!659633))))

(assert (=> b!1160016 (= res!769893 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36680 _keys!1208))))))

(declare-fun b!1160017 () Bool)

(assert (=> b!1160017 call!56061))

(declare-fun lt!521667 () Unit!38235)

(assert (=> b!1160017 (= lt!521667 call!56065)))

(assert (=> b!1160017 (= e!659634 lt!521667)))

(declare-fun b!1160018 () Bool)

(declare-fun res!769888 () Bool)

(assert (=> b!1160018 (=> (not res!769888) (not e!659633))))

(assert (=> b!1160018 (= res!769888 (= (select (arr!36144 _keys!1208) i!673) k0!934))))

(declare-fun b!1160019 () Bool)

(assert (=> b!1160019 (= e!659635 e!659634)))

(declare-fun c!115745 () Bool)

(assert (=> b!1160019 (= c!115745 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521671))))

(declare-fun bm!56062 () Bool)

(assert (=> bm!56062 (= call!56060 (+!3697 lt!521661 (ite (or c!115746 c!115749) (tuple2!18585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and start!98938 res!769898) b!1159994))

(assert (= (and b!1159994 res!769895) b!1160009))

(assert (= (and b!1160009 res!769886) b!1160005))

(assert (= (and b!1160005 res!769892) b!1159999))

(assert (= (and b!1159999 res!769891) b!1160016))

(assert (= (and b!1160016 res!769893) b!1160015))

(assert (= (and b!1160015 res!769885) b!1160018))

(assert (= (and b!1160018 res!769888) b!1160002))

(assert (= (and b!1160002 res!769896) b!1160008))

(assert (= (and b!1160008 res!769887) b!1160004))

(assert (= (and b!1160004 (not res!769894)) b!1160013))

(assert (= (and b!1160013 (not res!769884)) b!1159995))

(assert (= (and b!1159995 c!115747) b!1160003))

(assert (= (and b!1159995 (not c!115747)) b!1159997))

(assert (= (or b!1160003 b!1159997) bm!56058))

(assert (= (or b!1160003 b!1159997) bm!56061))

(assert (= (and b!1159995 (not res!769889)) b!1159990))

(assert (= (and b!1159990 c!115748) b!1160012))

(assert (= (and b!1159990 (not c!115748)) b!1159991))

(assert (= (and b!1160012 c!115746) b!1160007))

(assert (= (and b!1160012 (not c!115746)) b!1160011))

(assert (= (and b!1160011 c!115749) b!1160006))

(assert (= (and b!1160011 (not c!115749)) b!1160019))

(assert (= (and b!1160019 c!115745) b!1160017))

(assert (= (and b!1160019 (not c!115745)) b!1160014))

(assert (= (or b!1160006 b!1160017) bm!56055))

(assert (= (or b!1160006 b!1160017) bm!56057))

(assert (= (or b!1160006 b!1160017) bm!56059))

(assert (= (or b!1160007 bm!56059) bm!56060))

(assert (= (or b!1160007 bm!56055) bm!56056))

(assert (= (or b!1160007 bm!56057) bm!56062))

(assert (= (and b!1160012 c!115750) b!1160010))

(assert (= (and b!1160012 (not c!115750)) b!1160001))

(assert (= (and b!1160012 res!769897) b!1159993))

(assert (= (and b!1159990 res!769890) b!1160000))

(assert (= (and b!1159992 condMapEmpty!45434) mapIsEmpty!45434))

(assert (= (and b!1159992 (not condMapEmpty!45434)) mapNonEmpty!45434))

(get-info :version)

(assert (= (and mapNonEmpty!45434 ((_ is ValueCellFull!13827) mapValue!45434)) b!1159996))

(assert (= (and b!1159992 ((_ is ValueCellFull!13827) mapDefault!45434)) b!1159998))

(assert (= start!98938 b!1159992))

(declare-fun b_lambda!19649 () Bool)

(assert (=> (not b_lambda!19649) (not b!1160013)))

(declare-fun t!36855 () Bool)

(declare-fun tb!9355 () Bool)

(assert (=> (and start!98938 (= defaultEntry!1004 defaultEntry!1004) t!36855) tb!9355))

(declare-fun result!19275 () Bool)

(assert (=> tb!9355 (= result!19275 tp_is_empty!29073)))

(assert (=> b!1160013 t!36855))

(declare-fun b_and!39937 () Bool)

(assert (= b_and!39935 (and (=> t!36855 result!19275) b_and!39937)))

(declare-fun m!1068993 () Bool)

(assert (=> b!1160018 m!1068993))

(declare-fun m!1068995 () Bool)

(assert (=> b!1160007 m!1068995))

(assert (=> b!1160007 m!1068995))

(declare-fun m!1068997 () Bool)

(assert (=> b!1160007 m!1068997))

(declare-fun m!1068999 () Bool)

(assert (=> b!1160007 m!1068999))

(declare-fun m!1069001 () Bool)

(assert (=> bm!56062 m!1069001))

(declare-fun m!1069003 () Bool)

(assert (=> b!1159993 m!1069003))

(declare-fun m!1069005 () Bool)

(assert (=> b!1160012 m!1069005))

(declare-fun m!1069007 () Bool)

(assert (=> b!1160012 m!1069007))

(declare-fun m!1069009 () Bool)

(assert (=> b!1160012 m!1069009))

(declare-fun m!1069011 () Bool)

(assert (=> b!1160012 m!1069011))

(declare-fun m!1069013 () Bool)

(assert (=> b!1159990 m!1069013))

(declare-fun m!1069015 () Bool)

(assert (=> b!1159990 m!1069015))

(declare-fun m!1069017 () Bool)

(assert (=> b!1159990 m!1069017))

(declare-fun m!1069019 () Bool)

(assert (=> b!1159990 m!1069019))

(declare-fun m!1069021 () Bool)

(assert (=> b!1159990 m!1069021))

(declare-fun m!1069023 () Bool)

(assert (=> b!1159990 m!1069023))

(assert (=> b!1159990 m!1069023))

(assert (=> b!1159990 m!1069017))

(declare-fun m!1069025 () Bool)

(assert (=> b!1159990 m!1069025))

(declare-fun m!1069027 () Bool)

(assert (=> b!1159990 m!1069027))

(assert (=> b!1159990 m!1069017))

(assert (=> b!1159990 m!1069015))

(declare-fun m!1069029 () Bool)

(assert (=> b!1159990 m!1069029))

(declare-fun m!1069031 () Bool)

(assert (=> b!1160008 m!1069031))

(declare-fun m!1069033 () Bool)

(assert (=> b!1160002 m!1069033))

(declare-fun m!1069035 () Bool)

(assert (=> b!1160002 m!1069035))

(declare-fun m!1069037 () Bool)

(assert (=> b!1159999 m!1069037))

(assert (=> b!1160010 m!1069003))

(declare-fun m!1069039 () Bool)

(assert (=> b!1160000 m!1069039))

(declare-fun m!1069041 () Bool)

(assert (=> mapNonEmpty!45434 m!1069041))

(declare-fun m!1069043 () Bool)

(assert (=> start!98938 m!1069043))

(declare-fun m!1069045 () Bool)

(assert (=> start!98938 m!1069045))

(declare-fun m!1069047 () Bool)

(assert (=> b!1160005 m!1069047))

(declare-fun m!1069049 () Bool)

(assert (=> b!1159994 m!1069049))

(declare-fun m!1069051 () Bool)

(assert (=> bm!56060 m!1069051))

(declare-fun m!1069053 () Bool)

(assert (=> b!1160013 m!1069053))

(declare-fun m!1069055 () Bool)

(assert (=> b!1160013 m!1069055))

(declare-fun m!1069057 () Bool)

(assert (=> b!1160013 m!1069057))

(declare-fun m!1069059 () Bool)

(assert (=> b!1160013 m!1069059))

(declare-fun m!1069061 () Bool)

(assert (=> b!1160003 m!1069061))

(declare-fun m!1069063 () Bool)

(assert (=> bm!56056 m!1069063))

(assert (=> bm!56058 m!1069039))

(assert (=> b!1159995 m!1069017))

(declare-fun m!1069065 () Bool)

(assert (=> b!1159995 m!1069065))

(declare-fun m!1069067 () Bool)

(assert (=> b!1160004 m!1069067))

(declare-fun m!1069069 () Bool)

(assert (=> b!1160004 m!1069069))

(assert (=> bm!56061 m!1069013))

(declare-fun m!1069071 () Bool)

(assert (=> b!1160015 m!1069071))

(check-sat (not b!1160012) (not mapNonEmpty!45434) tp_is_empty!29073 (not b!1160004) (not b!1160015) (not bm!56058) (not bm!56062) (not b!1160007) b_and!39937 (not b!1159995) (not b!1159990) (not b!1160008) (not bm!56060) (not b!1160000) (not bm!56056) (not b!1160002) (not b!1159999) (not b!1159993) (not b!1160003) (not b!1160013) (not b!1160005) (not b_lambda!19649) (not b_next!24543) (not b!1159994) (not bm!56061) (not start!98938) (not b!1160010))
(check-sat b_and!39937 (not b_next!24543))
