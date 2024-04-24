; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101310 () Bool)

(assert start!101310)

(declare-fun b_free!26035 () Bool)

(declare-fun b_next!26035 () Bool)

(assert (=> start!101310 (= b_free!26035 (not b_next!26035))))

(declare-fun tp!91124 () Bool)

(declare-fun b_and!43171 () Bool)

(assert (=> start!101310 (= tp!91124 b_and!43171)))

(declare-fun b!1212756 () Bool)

(declare-datatypes ((V!46113 0))(
  ( (V!46114 (val!15426 Int)) )
))
(declare-datatypes ((tuple2!19828 0))(
  ( (tuple2!19829 (_1!9925 (_ BitVec 64)) (_2!9925 V!46113)) )
))
(declare-datatypes ((List!26632 0))(
  ( (Nil!26629) (Cons!26628 (h!27846 tuple2!19828) (t!39639 List!26632)) )
))
(declare-datatypes ((ListLongMap!17805 0))(
  ( (ListLongMap!17806 (toList!8918 List!26632)) )
))
(declare-fun call!59952 () ListLongMap!17805)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!7012 (ListLongMap!17805 (_ BitVec 64)) Bool)

(assert (=> b!1212756 (contains!7012 call!59952 k0!934)))

(declare-fun lt!550753 () ListLongMap!17805)

(declare-datatypes ((Unit!40120 0))(
  ( (Unit!40121) )
))
(declare-fun lt!550748 () Unit!40120)

(declare-fun minValue!944 () V!46113)

(declare-fun addStillContains!1061 (ListLongMap!17805 (_ BitVec 64) V!46113 (_ BitVec 64)) Unit!40120)

(assert (=> b!1212756 (= lt!550748 (addStillContains!1061 lt!550753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!59949 () Bool)

(assert (=> b!1212756 call!59949))

(declare-fun lt!550745 () ListLongMap!17805)

(declare-fun zeroValue!944 () V!46113)

(declare-fun +!4078 (ListLongMap!17805 tuple2!19828) ListLongMap!17805)

(assert (=> b!1212756 (= lt!550753 (+!4078 lt!550745 (tuple2!19829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550752 () Unit!40120)

(declare-fun call!59954 () Unit!40120)

(assert (=> b!1212756 (= lt!550752 call!59954)))

(declare-fun e!688860 () Unit!40120)

(assert (=> b!1212756 (= e!688860 lt!550748)))

(declare-fun b!1212757 () Bool)

(declare-fun res!805298 () Bool)

(declare-fun e!688856 () Bool)

(assert (=> b!1212757 (=> (not res!805298) (not e!688856))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78297 0))(
  ( (array!78298 (arr!37778 (Array (_ BitVec 32) (_ BitVec 64))) (size!38315 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78297)

(assert (=> b!1212757 (= res!805298 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38315 _keys!1208))))))

(declare-fun b!1212758 () Bool)

(declare-fun e!688855 () Bool)

(declare-fun lt!550762 () ListLongMap!17805)

(declare-fun -!1847 (ListLongMap!17805 (_ BitVec 64)) ListLongMap!17805)

(assert (=> b!1212758 (= e!688855 (= (-!1847 lt!550762 k0!934) lt!550745))))

(declare-fun bm!59944 () Bool)

(declare-fun call!59951 () Unit!40120)

(assert (=> bm!59944 (= call!59951 call!59954)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!59945 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14660 0))(
  ( (ValueCellFull!14660 (v!18074 V!46113)) (EmptyCell!14660) )
))
(declare-datatypes ((array!78299 0))(
  ( (array!78300 (arr!37779 (Array (_ BitVec 32) ValueCell!14660)) (size!38316 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78299)

(declare-fun call!59947 () ListLongMap!17805)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5377 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) Int) ListLongMap!17805)

(assert (=> bm!59945 (= call!59947 (getCurrentListMapNoExtraKeys!5377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!59948 () ListLongMap!17805)

(declare-fun lt!550746 () array!78299)

(declare-fun bm!59946 () Bool)

(declare-fun lt!550747 () array!78297)

(assert (=> bm!59946 (= call!59948 (getCurrentListMapNoExtraKeys!5377 lt!550747 lt!550746 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!688859 () Bool)

(declare-fun b!1212759 () Bool)

(declare-fun arrayContainsKey!0 (array!78297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212759 (= e!688859 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212760 () Bool)

(declare-fun e!688858 () Unit!40120)

(declare-fun lt!550757 () Unit!40120)

(assert (=> b!1212760 (= e!688858 lt!550757)))

(assert (=> b!1212760 (= lt!550757 call!59951)))

(declare-fun call!59953 () Bool)

(assert (=> b!1212760 call!59953))

(declare-fun bm!59947 () Bool)

(assert (=> bm!59947 (= call!59953 call!59949)))

(declare-fun c!119872 () Bool)

(declare-fun c!119875 () Bool)

(declare-fun bm!59948 () Bool)

(assert (=> bm!59948 (= call!59954 (addStillContains!1061 lt!550745 (ite (or c!119875 c!119872) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119875 c!119872) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1212762 () Bool)

(declare-fun e!688849 () Bool)

(assert (=> b!1212762 (= e!688849 (= call!59948 call!59947))))

(declare-fun b!1212763 () Bool)

(declare-fun e!688853 () Bool)

(assert (=> b!1212763 (= e!688856 e!688853)))

(declare-fun res!805307 () Bool)

(assert (=> b!1212763 (=> (not res!805307) (not e!688853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78297 (_ BitVec 32)) Bool)

(assert (=> b!1212763 (= res!805307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550747 mask!1564))))

(assert (=> b!1212763 (= lt!550747 (array!78298 (store (arr!37778 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38315 _keys!1208)))))

(declare-fun b!1212764 () Bool)

(declare-fun res!805310 () Bool)

(assert (=> b!1212764 (=> (not res!805310) (not e!688853))))

(declare-datatypes ((List!26633 0))(
  ( (Nil!26630) (Cons!26629 (h!27847 (_ BitVec 64)) (t!39640 List!26633)) )
))
(declare-fun arrayNoDuplicates!0 (array!78297 (_ BitVec 32) List!26633) Bool)

(assert (=> b!1212764 (= res!805310 (arrayNoDuplicates!0 lt!550747 #b00000000000000000000000000000000 Nil!26630))))

(declare-fun b!1212765 () Bool)

(declare-fun e!688850 () Bool)

(declare-fun e!688854 () Bool)

(declare-fun mapRes!47980 () Bool)

(assert (=> b!1212765 (= e!688850 (and e!688854 mapRes!47980))))

(declare-fun condMapEmpty!47980 () Bool)

(declare-fun mapDefault!47980 () ValueCell!14660)

(assert (=> b!1212765 (= condMapEmpty!47980 (= (arr!37779 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14660)) mapDefault!47980)))))

(declare-fun b!1212766 () Bool)

(declare-fun e!688848 () Bool)

(declare-fun e!688845 () Bool)

(assert (=> b!1212766 (= e!688848 e!688845)))

(declare-fun res!805308 () Bool)

(assert (=> b!1212766 (=> res!805308 e!688845)))

(assert (=> b!1212766 (= res!805308 (not (= (select (arr!37778 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1212766 e!688849))

(declare-fun c!119877 () Bool)

(assert (=> b!1212766 (= c!119877 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550755 () Unit!40120)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40120)

(assert (=> b!1212766 (= lt!550755 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212767 () Bool)

(assert (=> b!1212767 call!59953))

(declare-fun lt!550749 () Unit!40120)

(assert (=> b!1212767 (= lt!550749 call!59951)))

(declare-fun e!688846 () Unit!40120)

(assert (=> b!1212767 (= e!688846 lt!550749)))

(declare-fun call!59950 () ListLongMap!17805)

(declare-fun bm!59949 () Bool)

(assert (=> bm!59949 (= call!59949 (contains!7012 (ite c!119875 lt!550753 call!59950) k0!934))))

(declare-fun b!1212768 () Bool)

(declare-fun e!688852 () Bool)

(assert (=> b!1212768 (= e!688853 (not e!688852))))

(declare-fun res!805297 () Bool)

(assert (=> b!1212768 (=> res!805297 e!688852)))

(assert (=> b!1212768 (= res!805297 (bvsgt from!1455 i!673))))

(assert (=> b!1212768 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550754 () Unit!40120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78297 (_ BitVec 64) (_ BitVec 32)) Unit!40120)

(assert (=> b!1212768 (= lt!550754 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212769 () Bool)

(assert (=> b!1212769 (= e!688858 e!688846)))

(declare-fun c!119873 () Bool)

(declare-fun lt!550751 () Bool)

(assert (=> b!1212769 (= c!119873 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550751))))

(declare-fun b!1212770 () Bool)

(declare-fun res!805305 () Bool)

(assert (=> b!1212770 (=> (not res!805305) (not e!688856))))

(assert (=> b!1212770 (= res!805305 (= (select (arr!37778 _keys!1208) i!673) k0!934))))

(declare-fun b!1212771 () Bool)

(assert (=> b!1212771 (= c!119872 (and (not lt!550751) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212771 (= e!688860 e!688858)))

(declare-fun bm!59950 () Bool)

(assert (=> bm!59950 (= call!59950 call!59952)))

(declare-fun b!1212772 () Bool)

(declare-fun e!688857 () Bool)

(assert (=> b!1212772 (= e!688857 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212773 () Bool)

(assert (=> b!1212773 (= e!688845 (bvslt i!673 (size!38316 _values!996)))))

(assert (=> b!1212773 e!688855))

(declare-fun res!805303 () Bool)

(assert (=> b!1212773 (=> (not res!805303) (not e!688855))))

(declare-fun lt!550761 () V!46113)

(assert (=> b!1212773 (= res!805303 (= (-!1847 (+!4078 lt!550745 (tuple2!19829 (select (arr!37778 _keys!1208) from!1455) lt!550761)) (select (arr!37778 _keys!1208) from!1455)) lt!550745))))

(declare-fun lt!550756 () Unit!40120)

(declare-fun addThenRemoveForNewKeyIsSame!275 (ListLongMap!17805 (_ BitVec 64) V!46113) Unit!40120)

(assert (=> b!1212773 (= lt!550756 (addThenRemoveForNewKeyIsSame!275 lt!550745 (select (arr!37778 _keys!1208) from!1455) lt!550761))))

(declare-fun lt!550763 () V!46113)

(declare-fun get!19298 (ValueCell!14660 V!46113) V!46113)

(assert (=> b!1212773 (= lt!550761 (get!19298 (select (arr!37779 _values!996) from!1455) lt!550763))))

(declare-fun lt!550759 () Unit!40120)

(declare-fun e!688844 () Unit!40120)

(assert (=> b!1212773 (= lt!550759 e!688844)))

(declare-fun c!119874 () Bool)

(assert (=> b!1212773 (= c!119874 (contains!7012 lt!550745 k0!934))))

(assert (=> b!1212773 (= lt!550745 (getCurrentListMapNoExtraKeys!5377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212774 () Bool)

(declare-fun Unit!40122 () Unit!40120)

(assert (=> b!1212774 (= e!688844 Unit!40122)))

(declare-fun mapIsEmpty!47980 () Bool)

(assert (=> mapIsEmpty!47980 mapRes!47980))

(declare-fun b!1212775 () Bool)

(declare-fun e!688847 () Bool)

(declare-fun tp_is_empty!30739 () Bool)

(assert (=> b!1212775 (= e!688847 tp_is_empty!30739)))

(declare-fun b!1212776 () Bool)

(declare-fun res!805311 () Bool)

(assert (=> b!1212776 (=> (not res!805311) (not e!688856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212776 (= res!805311 (validMask!0 mask!1564))))

(declare-fun bm!59951 () Bool)

(assert (=> bm!59951 (= call!59952 (+!4078 (ite c!119875 lt!550753 lt!550745) (ite c!119875 (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119872 (tuple2!19829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212777 () Bool)

(assert (=> b!1212777 (= e!688859 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550751) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212761 () Bool)

(assert (=> b!1212761 (= e!688849 (= call!59948 (-!1847 call!59947 k0!934)))))

(declare-fun res!805302 () Bool)

(assert (=> start!101310 (=> (not res!805302) (not e!688856))))

(assert (=> start!101310 (= res!805302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38315 _keys!1208))))))

(assert (=> start!101310 e!688856))

(assert (=> start!101310 tp_is_empty!30739))

(declare-fun array_inv!28838 (array!78297) Bool)

(assert (=> start!101310 (array_inv!28838 _keys!1208)))

(assert (=> start!101310 true))

(assert (=> start!101310 tp!91124))

(declare-fun array_inv!28839 (array!78299) Bool)

(assert (=> start!101310 (and (array_inv!28839 _values!996) e!688850)))

(declare-fun b!1212778 () Bool)

(assert (=> b!1212778 (= e!688852 e!688848)))

(declare-fun res!805309 () Bool)

(assert (=> b!1212778 (=> res!805309 e!688848)))

(assert (=> b!1212778 (= res!805309 (not (= from!1455 i!673)))))

(declare-fun lt!550758 () ListLongMap!17805)

(assert (=> b!1212778 (= lt!550758 (getCurrentListMapNoExtraKeys!5377 lt!550747 lt!550746 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212778 (= lt!550746 (array!78300 (store (arr!37779 _values!996) i!673 (ValueCellFull!14660 lt!550763)) (size!38316 _values!996)))))

(declare-fun dynLambda!3294 (Int (_ BitVec 64)) V!46113)

(assert (=> b!1212778 (= lt!550763 (dynLambda!3294 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212778 (= lt!550762 (getCurrentListMapNoExtraKeys!5377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212779 () Bool)

(declare-fun res!805301 () Bool)

(assert (=> b!1212779 (=> (not res!805301) (not e!688856))))

(assert (=> b!1212779 (= res!805301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47980 () Bool)

(declare-fun tp!91123 () Bool)

(assert (=> mapNonEmpty!47980 (= mapRes!47980 (and tp!91123 e!688847))))

(declare-fun mapRest!47980 () (Array (_ BitVec 32) ValueCell!14660))

(declare-fun mapKey!47980 () (_ BitVec 32))

(declare-fun mapValue!47980 () ValueCell!14660)

(assert (=> mapNonEmpty!47980 (= (arr!37779 _values!996) (store mapRest!47980 mapKey!47980 mapValue!47980))))

(declare-fun b!1212780 () Bool)

(declare-fun res!805304 () Bool)

(assert (=> b!1212780 (=> (not res!805304) (not e!688856))))

(assert (=> b!1212780 (= res!805304 (and (= (size!38316 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38315 _keys!1208) (size!38316 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212781 () Bool)

(declare-fun Unit!40123 () Unit!40120)

(assert (=> b!1212781 (= e!688846 Unit!40123)))

(declare-fun b!1212782 () Bool)

(declare-fun Unit!40124 () Unit!40120)

(assert (=> b!1212782 (= e!688844 Unit!40124)))

(assert (=> b!1212782 (= lt!550751 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212782 (= c!119875 (and (not lt!550751) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550744 () Unit!40120)

(assert (=> b!1212782 (= lt!550744 e!688860)))

(declare-fun lt!550743 () Unit!40120)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!609 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46113 V!46113 (_ BitVec 64) (_ BitVec 32) Int) Unit!40120)

(assert (=> b!1212782 (= lt!550743 (lemmaListMapContainsThenArrayContainsFrom!609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119876 () Bool)

(assert (=> b!1212782 (= c!119876 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805306 () Bool)

(assert (=> b!1212782 (= res!805306 e!688859)))

(assert (=> b!1212782 (=> (not res!805306) (not e!688857))))

(assert (=> b!1212782 e!688857))

(declare-fun lt!550760 () Unit!40120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78297 (_ BitVec 32) (_ BitVec 32)) Unit!40120)

(assert (=> b!1212782 (= lt!550760 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212782 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26630)))

(declare-fun lt!550750 () Unit!40120)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78297 (_ BitVec 64) (_ BitVec 32) List!26633) Unit!40120)

(assert (=> b!1212782 (= lt!550750 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26630))))

(assert (=> b!1212782 false))

(declare-fun b!1212783 () Bool)

(assert (=> b!1212783 (= e!688854 tp_is_empty!30739)))

(declare-fun b!1212784 () Bool)

(declare-fun res!805300 () Bool)

(assert (=> b!1212784 (=> (not res!805300) (not e!688856))))

(assert (=> b!1212784 (= res!805300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26630))))

(declare-fun b!1212785 () Bool)

(declare-fun res!805299 () Bool)

(assert (=> b!1212785 (=> (not res!805299) (not e!688856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212785 (= res!805299 (validKeyInArray!0 k0!934))))

(assert (= (and start!101310 res!805302) b!1212776))

(assert (= (and b!1212776 res!805311) b!1212780))

(assert (= (and b!1212780 res!805304) b!1212779))

(assert (= (and b!1212779 res!805301) b!1212784))

(assert (= (and b!1212784 res!805300) b!1212757))

(assert (= (and b!1212757 res!805298) b!1212785))

(assert (= (and b!1212785 res!805299) b!1212770))

(assert (= (and b!1212770 res!805305) b!1212763))

(assert (= (and b!1212763 res!805307) b!1212764))

(assert (= (and b!1212764 res!805310) b!1212768))

(assert (= (and b!1212768 (not res!805297)) b!1212778))

(assert (= (and b!1212778 (not res!805309)) b!1212766))

(assert (= (and b!1212766 c!119877) b!1212761))

(assert (= (and b!1212766 (not c!119877)) b!1212762))

(assert (= (or b!1212761 b!1212762) bm!59946))

(assert (= (or b!1212761 b!1212762) bm!59945))

(assert (= (and b!1212766 (not res!805308)) b!1212773))

(assert (= (and b!1212773 c!119874) b!1212782))

(assert (= (and b!1212773 (not c!119874)) b!1212774))

(assert (= (and b!1212782 c!119875) b!1212756))

(assert (= (and b!1212782 (not c!119875)) b!1212771))

(assert (= (and b!1212771 c!119872) b!1212760))

(assert (= (and b!1212771 (not c!119872)) b!1212769))

(assert (= (and b!1212769 c!119873) b!1212767))

(assert (= (and b!1212769 (not c!119873)) b!1212781))

(assert (= (or b!1212760 b!1212767) bm!59944))

(assert (= (or b!1212760 b!1212767) bm!59950))

(assert (= (or b!1212760 b!1212767) bm!59947))

(assert (= (or b!1212756 bm!59947) bm!59949))

(assert (= (or b!1212756 bm!59944) bm!59948))

(assert (= (or b!1212756 bm!59950) bm!59951))

(assert (= (and b!1212782 c!119876) b!1212759))

(assert (= (and b!1212782 (not c!119876)) b!1212777))

(assert (= (and b!1212782 res!805306) b!1212772))

(assert (= (and b!1212773 res!805303) b!1212758))

(assert (= (and b!1212765 condMapEmpty!47980) mapIsEmpty!47980))

(assert (= (and b!1212765 (not condMapEmpty!47980)) mapNonEmpty!47980))

(get-info :version)

(assert (= (and mapNonEmpty!47980 ((_ is ValueCellFull!14660) mapValue!47980)) b!1212775))

(assert (= (and b!1212765 ((_ is ValueCellFull!14660) mapDefault!47980)) b!1212783))

(assert (= start!101310 b!1212765))

(declare-fun b_lambda!21667 () Bool)

(assert (=> (not b_lambda!21667) (not b!1212778)))

(declare-fun t!39638 () Bool)

(declare-fun tb!10827 () Bool)

(assert (=> (and start!101310 (= defaultEntry!1004 defaultEntry!1004) t!39638) tb!10827))

(declare-fun result!22257 () Bool)

(assert (=> tb!10827 (= result!22257 tp_is_empty!30739)))

(assert (=> b!1212778 t!39638))

(declare-fun b_and!43173 () Bool)

(assert (= b_and!43171 (and (=> t!39638 result!22257) b_and!43173)))

(declare-fun m!1118499 () Bool)

(assert (=> b!1212768 m!1118499))

(declare-fun m!1118501 () Bool)

(assert (=> b!1212768 m!1118501))

(declare-fun m!1118503 () Bool)

(assert (=> b!1212763 m!1118503))

(declare-fun m!1118505 () Bool)

(assert (=> b!1212763 m!1118505))

(declare-fun m!1118507 () Bool)

(assert (=> b!1212784 m!1118507))

(declare-fun m!1118509 () Bool)

(assert (=> b!1212770 m!1118509))

(declare-fun m!1118511 () Bool)

(assert (=> start!101310 m!1118511))

(declare-fun m!1118513 () Bool)

(assert (=> start!101310 m!1118513))

(declare-fun m!1118515 () Bool)

(assert (=> mapNonEmpty!47980 m!1118515))

(declare-fun m!1118517 () Bool)

(assert (=> bm!59945 m!1118517))

(declare-fun m!1118519 () Bool)

(assert (=> b!1212779 m!1118519))

(declare-fun m!1118521 () Bool)

(assert (=> bm!59946 m!1118521))

(declare-fun m!1118523 () Bool)

(assert (=> b!1212778 m!1118523))

(declare-fun m!1118525 () Bool)

(assert (=> b!1212778 m!1118525))

(declare-fun m!1118527 () Bool)

(assert (=> b!1212778 m!1118527))

(declare-fun m!1118529 () Bool)

(assert (=> b!1212778 m!1118529))

(declare-fun m!1118531 () Bool)

(assert (=> b!1212773 m!1118531))

(declare-fun m!1118533 () Bool)

(assert (=> b!1212773 m!1118533))

(declare-fun m!1118535 () Bool)

(assert (=> b!1212773 m!1118535))

(assert (=> b!1212773 m!1118517))

(declare-fun m!1118537 () Bool)

(assert (=> b!1212773 m!1118537))

(assert (=> b!1212773 m!1118537))

(declare-fun m!1118539 () Bool)

(assert (=> b!1212773 m!1118539))

(assert (=> b!1212773 m!1118533))

(declare-fun m!1118541 () Bool)

(assert (=> b!1212773 m!1118541))

(declare-fun m!1118543 () Bool)

(assert (=> b!1212773 m!1118543))

(assert (=> b!1212773 m!1118531))

(assert (=> b!1212773 m!1118533))

(declare-fun m!1118545 () Bool)

(assert (=> b!1212761 m!1118545))

(declare-fun m!1118547 () Bool)

(assert (=> b!1212776 m!1118547))

(declare-fun m!1118549 () Bool)

(assert (=> b!1212758 m!1118549))

(declare-fun m!1118551 () Bool)

(assert (=> b!1212782 m!1118551))

(declare-fun m!1118553 () Bool)

(assert (=> b!1212782 m!1118553))

(declare-fun m!1118555 () Bool)

(assert (=> b!1212782 m!1118555))

(declare-fun m!1118557 () Bool)

(assert (=> b!1212782 m!1118557))

(declare-fun m!1118559 () Bool)

(assert (=> b!1212785 m!1118559))

(declare-fun m!1118561 () Bool)

(assert (=> b!1212759 m!1118561))

(declare-fun m!1118563 () Bool)

(assert (=> b!1212756 m!1118563))

(declare-fun m!1118565 () Bool)

(assert (=> b!1212756 m!1118565))

(declare-fun m!1118567 () Bool)

(assert (=> b!1212756 m!1118567))

(declare-fun m!1118569 () Bool)

(assert (=> bm!59948 m!1118569))

(declare-fun m!1118571 () Bool)

(assert (=> bm!59951 m!1118571))

(declare-fun m!1118573 () Bool)

(assert (=> b!1212764 m!1118573))

(declare-fun m!1118575 () Bool)

(assert (=> bm!59949 m!1118575))

(assert (=> b!1212772 m!1118561))

(assert (=> b!1212766 m!1118533))

(declare-fun m!1118577 () Bool)

(assert (=> b!1212766 m!1118577))

(check-sat tp_is_empty!30739 (not b!1212772) (not bm!59945) (not bm!59948) (not b!1212776) (not b!1212773) (not b!1212778) (not b!1212784) (not b!1212758) b_and!43173 (not b!1212756) (not bm!59949) (not b!1212782) (not b_lambda!21667) (not b!1212785) (not b!1212761) (not bm!59951) (not bm!59946) (not b_next!26035) (not b!1212759) (not b!1212779) (not mapNonEmpty!47980) (not b!1212763) (not b!1212766) (not b!1212764) (not b!1212768) (not start!101310))
(check-sat b_and!43173 (not b_next!26035))
