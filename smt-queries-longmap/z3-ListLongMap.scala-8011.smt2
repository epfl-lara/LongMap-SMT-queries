; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99142 () Bool)

(assert start!99142)

(declare-fun b_free!24511 () Bool)

(declare-fun b_next!24511 () Bool)

(assert (=> start!99142 (= b_free!24511 (not b_next!24511))))

(declare-fun tp!86244 () Bool)

(declare-fun b_and!39873 () Bool)

(assert (=> start!99142 (= tp!86244 b_and!39873)))

(declare-datatypes ((V!43849 0))(
  ( (V!43850 (val!14577 Int)) )
))
(declare-fun zeroValue!944 () V!43849)

(declare-datatypes ((tuple2!18580 0))(
  ( (tuple2!18581 (_1!9301 (_ BitVec 64)) (_2!9301 V!43849)) )
))
(declare-datatypes ((List!25321 0))(
  ( (Nil!25318) (Cons!25317 (h!26535 tuple2!18580) (t!36816 List!25321)) )
))
(declare-datatypes ((ListLongMap!16557 0))(
  ( (ListLongMap!16558 (toList!8294 List!25321)) )
))
(declare-fun call!55746 () ListLongMap!16557)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!74973 0))(
  ( (array!74974 (arr!36131 (Array (_ BitVec 32) (_ BitVec 64))) (size!36668 (_ BitVec 32))) )
))
(declare-fun lt!521085 () array!74973)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43849)

(declare-fun bm!55736 () Bool)

(declare-datatypes ((ValueCell!13811 0))(
  ( (ValueCellFull!13811 (v!17210 V!43849)) (EmptyCell!13811) )
))
(declare-datatypes ((array!74975 0))(
  ( (array!74976 (arr!36132 (Array (_ BitVec 32) ValueCell!13811)) (size!36669 (_ BitVec 32))) )
))
(declare-fun lt!521090 () array!74975)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4786 (array!74973 array!74975 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 32) Int) ListLongMap!16557)

(assert (=> bm!55736 (= call!55746 (getCurrentListMapNoExtraKeys!4786 lt!521085 lt!521090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159807 () Bool)

(declare-datatypes ((Unit!38170 0))(
  ( (Unit!38171) )
))
(declare-fun e!659646 () Unit!38170)

(declare-fun Unit!38172 () Unit!38170)

(assert (=> b!1159807 (= e!659646 Unit!38172)))

(declare-fun e!659650 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1159808 () Bool)

(declare-fun lt!521100 () Bool)

(assert (=> b!1159808 (= e!659650 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521100) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159809 () Bool)

(declare-fun res!769678 () Bool)

(declare-fun e!659652 () Bool)

(assert (=> b!1159809 (=> (not res!769678) (not e!659652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159809 (= res!769678 (validMask!0 mask!1564))))

(declare-fun call!55741 () ListLongMap!16557)

(declare-fun _values!996 () array!74975)

(declare-fun _keys!1208 () array!74973)

(declare-fun bm!55737 () Bool)

(assert (=> bm!55737 (= call!55741 (getCurrentListMapNoExtraKeys!4786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159810 () Bool)

(declare-fun res!769684 () Bool)

(assert (=> b!1159810 (=> (not res!769684) (not e!659652))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159810 (= res!769684 (= (select (arr!36131 _keys!1208) i!673) k0!934))))

(declare-fun b!1159811 () Bool)

(declare-fun e!659657 () Unit!38170)

(declare-fun lt!521098 () Unit!38170)

(assert (=> b!1159811 (= e!659657 lt!521098)))

(declare-fun call!55743 () Unit!38170)

(assert (=> b!1159811 (= lt!521098 call!55743)))

(declare-fun call!55742 () Bool)

(assert (=> b!1159811 call!55742))

(declare-fun bm!55738 () Bool)

(declare-fun call!55745 () Unit!38170)

(assert (=> bm!55738 (= call!55743 call!55745)))

(declare-fun b!1159812 () Bool)

(assert (=> b!1159812 call!55742))

(declare-fun lt!521099 () Unit!38170)

(assert (=> b!1159812 (= lt!521099 call!55743)))

(assert (=> b!1159812 (= e!659646 lt!521099)))

(declare-fun b!1159813 () Bool)

(declare-fun call!55739 () ListLongMap!16557)

(declare-fun contains!6816 (ListLongMap!16557 (_ BitVec 64)) Bool)

(assert (=> b!1159813 (contains!6816 call!55739 k0!934)))

(declare-fun lt!521083 () Unit!38170)

(assert (=> b!1159813 (= lt!521083 call!55745)))

(declare-fun call!55740 () Bool)

(assert (=> b!1159813 call!55740))

(declare-fun lt!521088 () ListLongMap!16557)

(declare-fun lt!521086 () ListLongMap!16557)

(declare-fun +!3715 (ListLongMap!16557 tuple2!18580) ListLongMap!16557)

(assert (=> b!1159813 (= lt!521088 (+!3715 lt!521086 (tuple2!18581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521092 () Unit!38170)

(declare-fun addStillContains!937 (ListLongMap!16557 (_ BitVec 64) V!43849 (_ BitVec 64)) Unit!38170)

(assert (=> b!1159813 (= lt!521092 (addStillContains!937 lt!521086 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659659 () Unit!38170)

(assert (=> b!1159813 (= e!659659 lt!521083)))

(declare-fun bm!55739 () Bool)

(assert (=> bm!55739 (= call!55742 call!55740)))

(declare-fun b!1159814 () Bool)

(declare-fun e!659662 () Unit!38170)

(declare-fun Unit!38173 () Unit!38170)

(assert (=> b!1159814 (= e!659662 Unit!38173)))

(declare-fun bm!55740 () Bool)

(declare-fun call!55744 () ListLongMap!16557)

(assert (=> bm!55740 (= call!55744 call!55739)))

(declare-fun lt!521094 () ListLongMap!16557)

(declare-fun e!659647 () Bool)

(declare-fun b!1159815 () Bool)

(assert (=> b!1159815 (= e!659647 (= lt!521094 (getCurrentListMapNoExtraKeys!4786 lt!521085 lt!521090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun res!769680 () Bool)

(assert (=> start!99142 (=> (not res!769680) (not e!659652))))

(assert (=> start!99142 (= res!769680 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36668 _keys!1208))))))

(assert (=> start!99142 e!659652))

(declare-fun tp_is_empty!29041 () Bool)

(assert (=> start!99142 tp_is_empty!29041))

(declare-fun array_inv!27716 (array!74973) Bool)

(assert (=> start!99142 (array_inv!27716 _keys!1208)))

(assert (=> start!99142 true))

(assert (=> start!99142 tp!86244))

(declare-fun e!659649 () Bool)

(declare-fun array_inv!27717 (array!74975) Bool)

(assert (=> start!99142 (and (array_inv!27717 _values!996) e!659649)))

(declare-fun b!1159816 () Bool)

(declare-fun arrayContainsKey!0 (array!74973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159816 (= e!659650 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159817 () Bool)

(declare-fun res!769679 () Bool)

(declare-fun e!659656 () Bool)

(assert (=> b!1159817 (=> (not res!769679) (not e!659656))))

(declare-datatypes ((List!25322 0))(
  ( (Nil!25319) (Cons!25318 (h!26536 (_ BitVec 64)) (t!36817 List!25322)) )
))
(declare-fun arrayNoDuplicates!0 (array!74973 (_ BitVec 32) List!25322) Bool)

(assert (=> b!1159817 (= res!769679 (arrayNoDuplicates!0 lt!521085 #b00000000000000000000000000000000 Nil!25319))))

(declare-fun b!1159818 () Bool)

(declare-fun res!769682 () Bool)

(assert (=> b!1159818 (=> (not res!769682) (not e!659652))))

(assert (=> b!1159818 (= res!769682 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36668 _keys!1208))))))

(declare-fun b!1159819 () Bool)

(declare-fun e!659653 () Bool)

(assert (=> b!1159819 (= e!659653 tp_is_empty!29041)))

(declare-fun c!115858 () Bool)

(declare-fun c!115855 () Bool)

(declare-fun bm!55741 () Bool)

(assert (=> bm!55741 (= call!55739 (+!3715 (ite c!115855 lt!521088 lt!521086) (ite c!115855 (tuple2!18581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115858 (tuple2!18581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!55742 () Bool)

(assert (=> bm!55742 (= call!55745 (addStillContains!937 (ite c!115855 lt!521088 lt!521086) (ite c!115855 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115858 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115855 minValue!944 (ite c!115858 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1159820 () Bool)

(declare-fun e!659648 () Bool)

(declare-fun -!1395 (ListLongMap!16557 (_ BitVec 64)) ListLongMap!16557)

(assert (=> b!1159820 (= e!659648 (= call!55746 (-!1395 call!55741 k0!934)))))

(declare-fun b!1159821 () Bool)

(assert (=> b!1159821 (= e!659652 e!659656)))

(declare-fun res!769675 () Bool)

(assert (=> b!1159821 (=> (not res!769675) (not e!659656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74973 (_ BitVec 32)) Bool)

(assert (=> b!1159821 (= res!769675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521085 mask!1564))))

(assert (=> b!1159821 (= lt!521085 (array!74974 (store (arr!36131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36668 _keys!1208)))))

(declare-fun b!1159822 () Bool)

(assert (=> b!1159822 (= e!659657 e!659646)))

(declare-fun c!115860 () Bool)

(assert (=> b!1159822 (= c!115860 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521100))))

(declare-fun b!1159823 () Bool)

(declare-fun e!659651 () Bool)

(assert (=> b!1159823 (= e!659651 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159824 () Bool)

(declare-fun res!769685 () Bool)

(assert (=> b!1159824 (=> (not res!769685) (not e!659652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159824 (= res!769685 (validKeyInArray!0 k0!934))))

(declare-fun b!1159825 () Bool)

(declare-fun e!659654 () Bool)

(declare-fun e!659655 () Bool)

(assert (=> b!1159825 (= e!659654 e!659655)))

(declare-fun res!769674 () Bool)

(assert (=> b!1159825 (=> res!769674 e!659655)))

(assert (=> b!1159825 (= res!769674 (not (= from!1455 i!673)))))

(declare-fun lt!521101 () ListLongMap!16557)

(assert (=> b!1159825 (= lt!521101 (getCurrentListMapNoExtraKeys!4786 lt!521085 lt!521090 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521097 () V!43849)

(assert (=> b!1159825 (= lt!521090 (array!74976 (store (arr!36132 _values!996) i!673 (ValueCellFull!13811 lt!521097)) (size!36669 _values!996)))))

(declare-fun dynLambda!2797 (Int (_ BitVec 64)) V!43849)

(assert (=> b!1159825 (= lt!521097 (dynLambda!2797 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521095 () ListLongMap!16557)

(assert (=> b!1159825 (= lt!521095 (getCurrentListMapNoExtraKeys!4786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159826 () Bool)

(declare-fun Unit!38174 () Unit!38170)

(assert (=> b!1159826 (= e!659662 Unit!38174)))

(assert (=> b!1159826 (= lt!521100 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159826 (= c!115855 (and (not lt!521100) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521084 () Unit!38170)

(assert (=> b!1159826 (= lt!521084 e!659659)))

(declare-fun lt!521081 () Unit!38170)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!524 (array!74973 array!74975 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 64) (_ BitVec 32) Int) Unit!38170)

(assert (=> b!1159826 (= lt!521081 (lemmaListMapContainsThenArrayContainsFrom!524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115856 () Bool)

(assert (=> b!1159826 (= c!115856 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769677 () Bool)

(assert (=> b!1159826 (= res!769677 e!659650)))

(assert (=> b!1159826 (=> (not res!769677) (not e!659651))))

(assert (=> b!1159826 e!659651))

(declare-fun lt!521091 () Unit!38170)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74973 (_ BitVec 32) (_ BitVec 32)) Unit!38170)

(assert (=> b!1159826 (= lt!521091 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159826 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25319)))

(declare-fun lt!521082 () Unit!38170)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74973 (_ BitVec 64) (_ BitVec 32) List!25322) Unit!38170)

(assert (=> b!1159826 (= lt!521082 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25319))))

(assert (=> b!1159826 false))

(declare-fun bm!55743 () Bool)

(assert (=> bm!55743 (= call!55740 (contains!6816 (ite c!115855 lt!521088 call!55744) k0!934))))

(declare-fun b!1159827 () Bool)

(assert (=> b!1159827 (= e!659656 (not e!659654))))

(declare-fun res!769681 () Bool)

(assert (=> b!1159827 (=> res!769681 e!659654)))

(assert (=> b!1159827 (= res!769681 (bvsgt from!1455 i!673))))

(assert (=> b!1159827 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521096 () Unit!38170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74973 (_ BitVec 64) (_ BitVec 32)) Unit!38170)

(assert (=> b!1159827 (= lt!521096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159828 () Bool)

(declare-fun res!769676 () Bool)

(assert (=> b!1159828 (=> (not res!769676) (not e!659652))))

(assert (=> b!1159828 (= res!769676 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25319))))

(declare-fun b!1159829 () Bool)

(assert (=> b!1159829 (= c!115858 (and (not lt!521100) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1159829 (= e!659659 e!659657)))

(declare-fun b!1159830 () Bool)

(declare-fun e!659661 () Bool)

(assert (=> b!1159830 (= e!659661 tp_is_empty!29041)))

(declare-fun mapNonEmpty!45386 () Bool)

(declare-fun mapRes!45386 () Bool)

(declare-fun tp!86243 () Bool)

(assert (=> mapNonEmpty!45386 (= mapRes!45386 (and tp!86243 e!659653))))

(declare-fun mapKey!45386 () (_ BitVec 32))

(declare-fun mapValue!45386 () ValueCell!13811)

(declare-fun mapRest!45386 () (Array (_ BitVec 32) ValueCell!13811))

(assert (=> mapNonEmpty!45386 (= (arr!36132 _values!996) (store mapRest!45386 mapKey!45386 mapValue!45386))))

(declare-fun b!1159831 () Bool)

(assert (=> b!1159831 (= e!659649 (and e!659661 mapRes!45386))))

(declare-fun condMapEmpty!45386 () Bool)

(declare-fun mapDefault!45386 () ValueCell!13811)

(assert (=> b!1159831 (= condMapEmpty!45386 (= (arr!36132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13811)) mapDefault!45386)))))

(declare-fun b!1159832 () Bool)

(declare-fun res!769673 () Bool)

(assert (=> b!1159832 (=> (not res!769673) (not e!659652))))

(assert (=> b!1159832 (= res!769673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159833 () Bool)

(declare-fun e!659658 () Bool)

(assert (=> b!1159833 (= e!659658 true)))

(assert (=> b!1159833 e!659647))

(declare-fun res!769672 () Bool)

(assert (=> b!1159833 (=> (not res!769672) (not e!659647))))

(assert (=> b!1159833 (= res!769672 (= lt!521094 lt!521086))))

(assert (=> b!1159833 (= lt!521094 (-!1395 lt!521095 k0!934))))

(declare-fun lt!521087 () V!43849)

(assert (=> b!1159833 (= (-!1395 (+!3715 lt!521086 (tuple2!18581 (select (arr!36131 _keys!1208) from!1455) lt!521087)) (select (arr!36131 _keys!1208) from!1455)) lt!521086)))

(declare-fun lt!521089 () Unit!38170)

(declare-fun addThenRemoveForNewKeyIsSame!229 (ListLongMap!16557 (_ BitVec 64) V!43849) Unit!38170)

(assert (=> b!1159833 (= lt!521089 (addThenRemoveForNewKeyIsSame!229 lt!521086 (select (arr!36131 _keys!1208) from!1455) lt!521087))))

(declare-fun get!18444 (ValueCell!13811 V!43849) V!43849)

(assert (=> b!1159833 (= lt!521087 (get!18444 (select (arr!36132 _values!996) from!1455) lt!521097))))

(declare-fun lt!521080 () Unit!38170)

(assert (=> b!1159833 (= lt!521080 e!659662)))

(declare-fun c!115857 () Bool)

(assert (=> b!1159833 (= c!115857 (contains!6816 lt!521086 k0!934))))

(assert (=> b!1159833 (= lt!521086 (getCurrentListMapNoExtraKeys!4786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45386 () Bool)

(assert (=> mapIsEmpty!45386 mapRes!45386))

(declare-fun b!1159834 () Bool)

(declare-fun res!769686 () Bool)

(assert (=> b!1159834 (=> (not res!769686) (not e!659652))))

(assert (=> b!1159834 (= res!769686 (and (= (size!36669 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36668 _keys!1208) (size!36669 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159835 () Bool)

(assert (=> b!1159835 (= e!659655 e!659658)))

(declare-fun res!769683 () Bool)

(assert (=> b!1159835 (=> res!769683 e!659658)))

(assert (=> b!1159835 (= res!769683 (not (= (select (arr!36131 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159835 e!659648))

(declare-fun c!115859 () Bool)

(assert (=> b!1159835 (= c!115859 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521093 () Unit!38170)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!632 (array!74973 array!74975 (_ BitVec 32) (_ BitVec 32) V!43849 V!43849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38170)

(assert (=> b!1159835 (= lt!521093 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!632 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159836 () Bool)

(assert (=> b!1159836 (= e!659648 (= call!55746 call!55741))))

(assert (= (and start!99142 res!769680) b!1159809))

(assert (= (and b!1159809 res!769678) b!1159834))

(assert (= (and b!1159834 res!769686) b!1159832))

(assert (= (and b!1159832 res!769673) b!1159828))

(assert (= (and b!1159828 res!769676) b!1159818))

(assert (= (and b!1159818 res!769682) b!1159824))

(assert (= (and b!1159824 res!769685) b!1159810))

(assert (= (and b!1159810 res!769684) b!1159821))

(assert (= (and b!1159821 res!769675) b!1159817))

(assert (= (and b!1159817 res!769679) b!1159827))

(assert (= (and b!1159827 (not res!769681)) b!1159825))

(assert (= (and b!1159825 (not res!769674)) b!1159835))

(assert (= (and b!1159835 c!115859) b!1159820))

(assert (= (and b!1159835 (not c!115859)) b!1159836))

(assert (= (or b!1159820 b!1159836) bm!55736))

(assert (= (or b!1159820 b!1159836) bm!55737))

(assert (= (and b!1159835 (not res!769683)) b!1159833))

(assert (= (and b!1159833 c!115857) b!1159826))

(assert (= (and b!1159833 (not c!115857)) b!1159814))

(assert (= (and b!1159826 c!115855) b!1159813))

(assert (= (and b!1159826 (not c!115855)) b!1159829))

(assert (= (and b!1159829 c!115858) b!1159811))

(assert (= (and b!1159829 (not c!115858)) b!1159822))

(assert (= (and b!1159822 c!115860) b!1159812))

(assert (= (and b!1159822 (not c!115860)) b!1159807))

(assert (= (or b!1159811 b!1159812) bm!55738))

(assert (= (or b!1159811 b!1159812) bm!55740))

(assert (= (or b!1159811 b!1159812) bm!55739))

(assert (= (or b!1159813 bm!55739) bm!55743))

(assert (= (or b!1159813 bm!55738) bm!55742))

(assert (= (or b!1159813 bm!55740) bm!55741))

(assert (= (and b!1159826 c!115856) b!1159816))

(assert (= (and b!1159826 (not c!115856)) b!1159808))

(assert (= (and b!1159826 res!769677) b!1159823))

(assert (= (and b!1159833 res!769672) b!1159815))

(assert (= (and b!1159831 condMapEmpty!45386) mapIsEmpty!45386))

(assert (= (and b!1159831 (not condMapEmpty!45386)) mapNonEmpty!45386))

(get-info :version)

(assert (= (and mapNonEmpty!45386 ((_ is ValueCellFull!13811) mapValue!45386)) b!1159819))

(assert (= (and b!1159831 ((_ is ValueCellFull!13811) mapDefault!45386)) b!1159830))

(assert (= start!99142 b!1159831))

(declare-fun b_lambda!19611 () Bool)

(assert (=> (not b_lambda!19611) (not b!1159825)))

(declare-fun t!36815 () Bool)

(declare-fun tb!9315 () Bool)

(assert (=> (and start!99142 (= defaultEntry!1004 defaultEntry!1004) t!36815) tb!9315))

(declare-fun result!19203 () Bool)

(assert (=> tb!9315 (= result!19203 tp_is_empty!29041)))

(assert (=> b!1159825 t!36815))

(declare-fun b_and!39875 () Bool)

(assert (= b_and!39873 (and (=> t!36815 result!19203) b_and!39875)))

(declare-fun m!1069281 () Bool)

(assert (=> b!1159809 m!1069281))

(declare-fun m!1069283 () Bool)

(assert (=> bm!55742 m!1069283))

(declare-fun m!1069285 () Bool)

(assert (=> mapNonEmpty!45386 m!1069285))

(declare-fun m!1069287 () Bool)

(assert (=> b!1159821 m!1069287))

(declare-fun m!1069289 () Bool)

(assert (=> b!1159821 m!1069289))

(declare-fun m!1069291 () Bool)

(assert (=> b!1159815 m!1069291))

(declare-fun m!1069293 () Bool)

(assert (=> b!1159828 m!1069293))

(declare-fun m!1069295 () Bool)

(assert (=> bm!55743 m!1069295))

(declare-fun m!1069297 () Bool)

(assert (=> b!1159833 m!1069297))

(declare-fun m!1069299 () Bool)

(assert (=> b!1159833 m!1069299))

(declare-fun m!1069301 () Bool)

(assert (=> b!1159833 m!1069301))

(declare-fun m!1069303 () Bool)

(assert (=> b!1159833 m!1069303))

(declare-fun m!1069305 () Bool)

(assert (=> b!1159833 m!1069305))

(declare-fun m!1069307 () Bool)

(assert (=> b!1159833 m!1069307))

(declare-fun m!1069309 () Bool)

(assert (=> b!1159833 m!1069309))

(assert (=> b!1159833 m!1069299))

(declare-fun m!1069311 () Bool)

(assert (=> b!1159833 m!1069311))

(assert (=> b!1159833 m!1069305))

(assert (=> b!1159833 m!1069307))

(declare-fun m!1069313 () Bool)

(assert (=> b!1159833 m!1069313))

(assert (=> b!1159833 m!1069307))

(declare-fun m!1069315 () Bool)

(assert (=> b!1159827 m!1069315))

(declare-fun m!1069317 () Bool)

(assert (=> b!1159827 m!1069317))

(declare-fun m!1069319 () Bool)

(assert (=> b!1159825 m!1069319))

(declare-fun m!1069321 () Bool)

(assert (=> b!1159825 m!1069321))

(declare-fun m!1069323 () Bool)

(assert (=> b!1159825 m!1069323))

(declare-fun m!1069325 () Bool)

(assert (=> b!1159825 m!1069325))

(declare-fun m!1069327 () Bool)

(assert (=> b!1159817 m!1069327))

(declare-fun m!1069329 () Bool)

(assert (=> b!1159813 m!1069329))

(declare-fun m!1069331 () Bool)

(assert (=> b!1159813 m!1069331))

(declare-fun m!1069333 () Bool)

(assert (=> b!1159813 m!1069333))

(declare-fun m!1069335 () Bool)

(assert (=> b!1159810 m!1069335))

(assert (=> bm!55737 m!1069297))

(declare-fun m!1069337 () Bool)

(assert (=> bm!55741 m!1069337))

(declare-fun m!1069339 () Bool)

(assert (=> b!1159816 m!1069339))

(declare-fun m!1069341 () Bool)

(assert (=> b!1159832 m!1069341))

(declare-fun m!1069343 () Bool)

(assert (=> b!1159826 m!1069343))

(declare-fun m!1069345 () Bool)

(assert (=> b!1159826 m!1069345))

(declare-fun m!1069347 () Bool)

(assert (=> b!1159826 m!1069347))

(declare-fun m!1069349 () Bool)

(assert (=> b!1159826 m!1069349))

(assert (=> b!1159823 m!1069339))

(assert (=> bm!55736 m!1069291))

(assert (=> b!1159835 m!1069307))

(declare-fun m!1069351 () Bool)

(assert (=> b!1159835 m!1069351))

(declare-fun m!1069353 () Bool)

(assert (=> b!1159820 m!1069353))

(declare-fun m!1069355 () Bool)

(assert (=> b!1159824 m!1069355))

(declare-fun m!1069357 () Bool)

(assert (=> start!99142 m!1069357))

(declare-fun m!1069359 () Bool)

(assert (=> start!99142 m!1069359))

(check-sat (not b!1159826) (not mapNonEmpty!45386) (not b!1159816) (not b!1159821) (not b!1159835) (not b!1159824) (not b!1159827) (not b!1159817) (not b_next!24511) (not b!1159825) tp_is_empty!29041 (not b!1159813) (not bm!55737) (not bm!55743) (not b!1159828) (not b!1159815) (not start!99142) (not b_lambda!19611) (not bm!55741) (not bm!55736) (not b!1159833) (not b!1159832) (not bm!55742) (not b!1159809) b_and!39875 (not b!1159823) (not b!1159820))
(check-sat b_and!39875 (not b_next!24511))
