; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98794 () Bool)

(assert start!98794)

(declare-fun b_free!24163 () Bool)

(declare-fun b_next!24163 () Bool)

(assert (=> start!98794 (= b_free!24163 (not b_next!24163))))

(declare-fun tp!85199 () Bool)

(declare-fun b_and!39177 () Bool)

(assert (=> start!98794 (= tp!85199 b_and!39177)))

(declare-datatypes ((array!74285 0))(
  ( (array!74286 (arr!35787 (Array (_ BitVec 32) (_ BitVec 64))) (size!36324 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74285)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!650839 () Bool)

(declare-fun b!1143851 () Bool)

(declare-fun arrayContainsKey!0 (array!74285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143851 (= e!650839 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143852 () Bool)

(declare-datatypes ((Unit!37459 0))(
  ( (Unit!37460) )
))
(declare-fun e!650830 () Unit!37459)

(declare-fun Unit!37461 () Unit!37459)

(assert (=> b!1143852 (= e!650830 Unit!37461)))

(declare-fun b!1143853 () Bool)

(declare-fun e!650826 () Bool)

(declare-fun tp_is_empty!28693 () Bool)

(assert (=> b!1143853 (= e!650826 tp_is_empty!28693)))

(declare-fun b!1143854 () Bool)

(declare-fun res!761902 () Bool)

(declare-fun e!650831 () Bool)

(assert (=> b!1143854 (=> (not res!761902) (not e!650831))))

(declare-datatypes ((List!24997 0))(
  ( (Nil!24994) (Cons!24993 (h!26211 (_ BitVec 64)) (t!36144 List!24997)) )
))
(declare-fun arrayNoDuplicates!0 (array!74285 (_ BitVec 32) List!24997) Bool)

(assert (=> b!1143854 (= res!761902 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24994))))

(declare-fun b!1143855 () Bool)

(declare-fun e!650838 () Bool)

(assert (=> b!1143855 (= e!650838 tp_is_empty!28693)))

(declare-fun b!1143856 () Bool)

(declare-fun Unit!37462 () Unit!37459)

(assert (=> b!1143856 (= e!650830 Unit!37462)))

(declare-fun lt!509816 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143856 (= lt!509816 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112727 () Bool)

(assert (=> b!1143856 (= c!112727 (and (not lt!509816) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509827 () Unit!37459)

(declare-fun e!650837 () Unit!37459)

(assert (=> b!1143856 (= lt!509827 e!650837)))

(declare-datatypes ((V!43385 0))(
  ( (V!43386 (val!14403 Int)) )
))
(declare-fun zeroValue!944 () V!43385)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509814 () Unit!37459)

(declare-datatypes ((ValueCell!13637 0))(
  ( (ValueCellFull!13637 (v!17036 V!43385)) (EmptyCell!13637) )
))
(declare-datatypes ((array!74287 0))(
  ( (array!74288 (arr!35788 (Array (_ BitVec 32) ValueCell!13637)) (size!36325 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74287)

(declare-fun minValue!944 () V!43385)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!398 (array!74285 array!74287 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 64) (_ BitVec 32) Int) Unit!37459)

(assert (=> b!1143856 (= lt!509814 (lemmaListMapContainsThenArrayContainsFrom!398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112724 () Bool)

(assert (=> b!1143856 (= c!112724 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761898 () Bool)

(declare-fun e!650832 () Bool)

(assert (=> b!1143856 (= res!761898 e!650832)))

(assert (=> b!1143856 (=> (not res!761898) (not e!650839))))

(assert (=> b!1143856 e!650839))

(declare-fun lt!509828 () Unit!37459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74285 (_ BitVec 32) (_ BitVec 32)) Unit!37459)

(assert (=> b!1143856 (= lt!509828 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143856 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24994)))

(declare-fun lt!509824 () Unit!37459)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74285 (_ BitVec 64) (_ BitVec 32) List!24997) Unit!37459)

(assert (=> b!1143856 (= lt!509824 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24994))))

(assert (=> b!1143856 false))

(declare-fun b!1143857 () Bool)

(declare-fun e!650836 () Bool)

(declare-fun e!650833 () Bool)

(assert (=> b!1143857 (= e!650836 e!650833)))

(declare-fun res!761895 () Bool)

(assert (=> b!1143857 (=> res!761895 e!650833)))

(assert (=> b!1143857 (= res!761895 (not (= (select (arr!35787 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650828 () Bool)

(assert (=> b!1143857 e!650828))

(declare-fun c!112723 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143857 (= c!112723 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509820 () Unit!37459)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!507 (array!74285 array!74287 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37459)

(assert (=> b!1143857 (= lt!509820 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!507 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143858 () Bool)

(declare-fun e!650835 () Bool)

(declare-fun e!650827 () Bool)

(assert (=> b!1143858 (= e!650835 (not e!650827))))

(declare-fun res!761901 () Bool)

(assert (=> b!1143858 (=> res!761901 e!650827)))

(assert (=> b!1143858 (= res!761901 (bvsgt from!1455 i!673))))

(assert (=> b!1143858 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509811 () Unit!37459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74285 (_ BitVec 64) (_ BitVec 32)) Unit!37459)

(assert (=> b!1143858 (= lt!509811 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143859 () Bool)

(declare-fun res!761907 () Bool)

(assert (=> b!1143859 (=> (not res!761907) (not e!650831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143859 (= res!761907 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44864 () Bool)

(declare-fun mapRes!44864 () Bool)

(declare-fun tp!85200 () Bool)

(assert (=> mapNonEmpty!44864 (= mapRes!44864 (and tp!85200 e!650838))))

(declare-fun mapValue!44864 () ValueCell!13637)

(declare-fun mapKey!44864 () (_ BitVec 32))

(declare-fun mapRest!44864 () (Array (_ BitVec 32) ValueCell!13637))

(assert (=> mapNonEmpty!44864 (= (arr!35788 _values!996) (store mapRest!44864 mapKey!44864 mapValue!44864))))

(declare-fun b!1143860 () Bool)

(declare-fun e!650829 () Unit!37459)

(declare-fun Unit!37463 () Unit!37459)

(assert (=> b!1143860 (= e!650829 Unit!37463)))

(declare-fun b!1143861 () Bool)

(declare-datatypes ((tuple2!18240 0))(
  ( (tuple2!18241 (_1!9131 (_ BitVec 64)) (_2!9131 V!43385)) )
))
(declare-datatypes ((List!24998 0))(
  ( (Nil!24995) (Cons!24994 (h!26212 tuple2!18240) (t!36145 List!24998)) )
))
(declare-datatypes ((ListLongMap!16217 0))(
  ( (ListLongMap!16218 (toList!8124 List!24998)) )
))
(declare-fun call!51570 () ListLongMap!16217)

(declare-fun contains!6669 (ListLongMap!16217 (_ BitVec 64)) Bool)

(assert (=> b!1143861 (contains!6669 call!51570 k0!934)))

(declare-fun lt!509817 () Unit!37459)

(declare-fun lt!509826 () ListLongMap!16217)

(declare-fun addStillContains!798 (ListLongMap!16217 (_ BitVec 64) V!43385 (_ BitVec 64)) Unit!37459)

(assert (=> b!1143861 (= lt!509817 (addStillContains!798 lt!509826 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!51566 () Bool)

(assert (=> b!1143861 call!51566))

(declare-fun lt!509810 () ListLongMap!16217)

(declare-fun +!3571 (ListLongMap!16217 tuple2!18240) ListLongMap!16217)

(assert (=> b!1143861 (= lt!509826 (+!3571 lt!509810 (tuple2!18241 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509823 () Unit!37459)

(declare-fun call!51569 () Unit!37459)

(assert (=> b!1143861 (= lt!509823 call!51569)))

(assert (=> b!1143861 (= e!650837 lt!509817)))

(declare-fun b!1143862 () Bool)

(declare-fun res!761905 () Bool)

(assert (=> b!1143862 (=> (not res!761905) (not e!650831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74285 (_ BitVec 32)) Bool)

(assert (=> b!1143862 (= res!761905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51560 () Bool)

(declare-fun call!51564 () ListLongMap!16217)

(declare-fun getCurrentListMapNoExtraKeys!4631 (array!74285 array!74287 (_ BitVec 32) (_ BitVec 32) V!43385 V!43385 (_ BitVec 32) Int) ListLongMap!16217)

(assert (=> bm!51560 (= call!51564 (getCurrentListMapNoExtraKeys!4631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51561 () Bool)

(declare-fun c!112726 () Bool)

(assert (=> bm!51561 (= call!51570 (+!3571 (ite c!112727 lt!509826 lt!509810) (ite c!112727 (tuple2!18241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112726 (tuple2!18241 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18241 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1143863 () Bool)

(declare-fun e!650834 () Unit!37459)

(assert (=> b!1143863 (= e!650834 e!650829)))

(declare-fun c!112725 () Bool)

(assert (=> b!1143863 (= c!112725 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509816))))

(declare-fun b!1143864 () Bool)

(declare-fun res!761900 () Bool)

(assert (=> b!1143864 (=> (not res!761900) (not e!650831))))

(assert (=> b!1143864 (= res!761900 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36324 _keys!1208))))))

(declare-fun mapIsEmpty!44864 () Bool)

(assert (=> mapIsEmpty!44864 mapRes!44864))

(declare-fun bm!51562 () Bool)

(assert (=> bm!51562 (= call!51569 (addStillContains!798 lt!509810 (ite (or c!112727 c!112726) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112727 c!112726) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1143865 () Bool)

(declare-fun res!761894 () Bool)

(assert (=> b!1143865 (=> (not res!761894) (not e!650831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143865 (= res!761894 (validMask!0 mask!1564))))

(declare-fun b!1143866 () Bool)

(declare-fun res!761903 () Bool)

(assert (=> b!1143866 (=> (not res!761903) (not e!650831))))

(assert (=> b!1143866 (= res!761903 (= (select (arr!35787 _keys!1208) i!673) k0!934))))

(declare-fun b!1143867 () Bool)

(assert (=> b!1143867 (= c!112726 (and (not lt!509816) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1143867 (= e!650837 e!650834)))

(declare-fun b!1143868 () Bool)

(declare-fun call!51568 () Bool)

(assert (=> b!1143868 call!51568))

(declare-fun lt!509821 () Unit!37459)

(declare-fun call!51567 () Unit!37459)

(assert (=> b!1143868 (= lt!509821 call!51567)))

(assert (=> b!1143868 (= e!650829 lt!509821)))

(declare-fun b!1143869 () Bool)

(declare-fun e!650824 () Bool)

(assert (=> b!1143869 (= e!650824 (and e!650826 mapRes!44864))))

(declare-fun condMapEmpty!44864 () Bool)

(declare-fun mapDefault!44864 () ValueCell!13637)

(assert (=> b!1143869 (= condMapEmpty!44864 (= (arr!35788 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13637)) mapDefault!44864)))))

(declare-fun bm!51563 () Bool)

(assert (=> bm!51563 (= call!51567 call!51569)))

(declare-fun b!1143870 () Bool)

(declare-fun res!761897 () Bool)

(assert (=> b!1143870 (=> (not res!761897) (not e!650831))))

(assert (=> b!1143870 (= res!761897 (and (= (size!36325 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36324 _keys!1208) (size!36325 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143871 () Bool)

(assert (=> b!1143871 (= e!650833 true)))

(declare-fun lt!509825 () V!43385)

(declare-fun -!1254 (ListLongMap!16217 (_ BitVec 64)) ListLongMap!16217)

(assert (=> b!1143871 (= (-!1254 (+!3571 lt!509810 (tuple2!18241 (select (arr!35787 _keys!1208) from!1455) lt!509825)) (select (arr!35787 _keys!1208) from!1455)) lt!509810)))

(declare-fun lt!509830 () Unit!37459)

(declare-fun addThenRemoveForNewKeyIsSame!112 (ListLongMap!16217 (_ BitVec 64) V!43385) Unit!37459)

(assert (=> b!1143871 (= lt!509830 (addThenRemoveForNewKeyIsSame!112 lt!509810 (select (arr!35787 _keys!1208) from!1455) lt!509825))))

(declare-fun lt!509822 () V!43385)

(declare-fun get!18211 (ValueCell!13637 V!43385) V!43385)

(assert (=> b!1143871 (= lt!509825 (get!18211 (select (arr!35788 _values!996) from!1455) lt!509822))))

(declare-fun lt!509812 () Unit!37459)

(assert (=> b!1143871 (= lt!509812 e!650830)))

(declare-fun c!112728 () Bool)

(assert (=> b!1143871 (= c!112728 (contains!6669 lt!509810 k0!934))))

(assert (=> b!1143871 (= lt!509810 (getCurrentListMapNoExtraKeys!4631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143872 () Bool)

(declare-fun lt!509813 () Unit!37459)

(assert (=> b!1143872 (= e!650834 lt!509813)))

(assert (=> b!1143872 (= lt!509813 call!51567)))

(assert (=> b!1143872 call!51568))

(declare-fun bm!51564 () Bool)

(declare-fun call!51563 () ListLongMap!16217)

(assert (=> bm!51564 (= call!51563 call!51570)))

(declare-fun b!1143873 () Bool)

(declare-fun res!761899 () Bool)

(assert (=> b!1143873 (=> (not res!761899) (not e!650835))))

(declare-fun lt!509829 () array!74285)

(assert (=> b!1143873 (= res!761899 (arrayNoDuplicates!0 lt!509829 #b00000000000000000000000000000000 Nil!24994))))

(declare-fun b!1143874 () Bool)

(declare-fun call!51565 () ListLongMap!16217)

(assert (=> b!1143874 (= e!650828 (= call!51565 (-!1254 call!51564 k0!934)))))

(declare-fun b!1143875 () Bool)

(assert (=> b!1143875 (= e!650831 e!650835)))

(declare-fun res!761906 () Bool)

(assert (=> b!1143875 (=> (not res!761906) (not e!650835))))

(assert (=> b!1143875 (= res!761906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509829 mask!1564))))

(assert (=> b!1143875 (= lt!509829 (array!74286 (store (arr!35787 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36324 _keys!1208)))))

(declare-fun res!761896 () Bool)

(assert (=> start!98794 (=> (not res!761896) (not e!650831))))

(assert (=> start!98794 (= res!761896 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36324 _keys!1208))))))

(assert (=> start!98794 e!650831))

(assert (=> start!98794 tp_is_empty!28693))

(declare-fun array_inv!27472 (array!74285) Bool)

(assert (=> start!98794 (array_inv!27472 _keys!1208)))

(assert (=> start!98794 true))

(assert (=> start!98794 tp!85199))

(declare-fun array_inv!27473 (array!74287) Bool)

(assert (=> start!98794 (and (array_inv!27473 _values!996) e!650824)))

(declare-fun b!1143876 () Bool)

(assert (=> b!1143876 (= e!650832 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143877 () Bool)

(assert (=> b!1143877 (= e!650828 (= call!51565 call!51564))))

(declare-fun bm!51565 () Bool)

(assert (=> bm!51565 (= call!51566 (contains!6669 (ite c!112727 lt!509826 call!51563) k0!934))))

(declare-fun bm!51566 () Bool)

(declare-fun lt!509819 () array!74287)

(assert (=> bm!51566 (= call!51565 (getCurrentListMapNoExtraKeys!4631 lt!509829 lt!509819 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143878 () Bool)

(assert (=> b!1143878 (= e!650832 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509816) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51567 () Bool)

(assert (=> bm!51567 (= call!51568 call!51566)))

(declare-fun b!1143879 () Bool)

(assert (=> b!1143879 (= e!650827 e!650836)))

(declare-fun res!761904 () Bool)

(assert (=> b!1143879 (=> res!761904 e!650836)))

(assert (=> b!1143879 (= res!761904 (not (= from!1455 i!673)))))

(declare-fun lt!509815 () ListLongMap!16217)

(assert (=> b!1143879 (= lt!509815 (getCurrentListMapNoExtraKeys!4631 lt!509829 lt!509819 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1143879 (= lt!509819 (array!74288 (store (arr!35788 _values!996) i!673 (ValueCellFull!13637 lt!509822)) (size!36325 _values!996)))))

(declare-fun dynLambda!2667 (Int (_ BitVec 64)) V!43385)

(assert (=> b!1143879 (= lt!509822 (dynLambda!2667 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509818 () ListLongMap!16217)

(assert (=> b!1143879 (= lt!509818 (getCurrentListMapNoExtraKeys!4631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98794 res!761896) b!1143865))

(assert (= (and b!1143865 res!761894) b!1143870))

(assert (= (and b!1143870 res!761897) b!1143862))

(assert (= (and b!1143862 res!761905) b!1143854))

(assert (= (and b!1143854 res!761902) b!1143864))

(assert (= (and b!1143864 res!761900) b!1143859))

(assert (= (and b!1143859 res!761907) b!1143866))

(assert (= (and b!1143866 res!761903) b!1143875))

(assert (= (and b!1143875 res!761906) b!1143873))

(assert (= (and b!1143873 res!761899) b!1143858))

(assert (= (and b!1143858 (not res!761901)) b!1143879))

(assert (= (and b!1143879 (not res!761904)) b!1143857))

(assert (= (and b!1143857 c!112723) b!1143874))

(assert (= (and b!1143857 (not c!112723)) b!1143877))

(assert (= (or b!1143874 b!1143877) bm!51566))

(assert (= (or b!1143874 b!1143877) bm!51560))

(assert (= (and b!1143857 (not res!761895)) b!1143871))

(assert (= (and b!1143871 c!112728) b!1143856))

(assert (= (and b!1143871 (not c!112728)) b!1143852))

(assert (= (and b!1143856 c!112727) b!1143861))

(assert (= (and b!1143856 (not c!112727)) b!1143867))

(assert (= (and b!1143867 c!112726) b!1143872))

(assert (= (and b!1143867 (not c!112726)) b!1143863))

(assert (= (and b!1143863 c!112725) b!1143868))

(assert (= (and b!1143863 (not c!112725)) b!1143860))

(assert (= (or b!1143872 b!1143868) bm!51563))

(assert (= (or b!1143872 b!1143868) bm!51564))

(assert (= (or b!1143872 b!1143868) bm!51567))

(assert (= (or b!1143861 bm!51567) bm!51565))

(assert (= (or b!1143861 bm!51563) bm!51562))

(assert (= (or b!1143861 bm!51564) bm!51561))

(assert (= (and b!1143856 c!112724) b!1143876))

(assert (= (and b!1143856 (not c!112724)) b!1143878))

(assert (= (and b!1143856 res!761898) b!1143851))

(assert (= (and b!1143869 condMapEmpty!44864) mapIsEmpty!44864))

(assert (= (and b!1143869 (not condMapEmpty!44864)) mapNonEmpty!44864))

(get-info :version)

(assert (= (and mapNonEmpty!44864 ((_ is ValueCellFull!13637) mapValue!44864)) b!1143855))

(assert (= (and b!1143869 ((_ is ValueCellFull!13637) mapDefault!44864)) b!1143853))

(assert (= start!98794 b!1143869))

(declare-fun b_lambda!19263 () Bool)

(assert (=> (not b_lambda!19263) (not b!1143879)))

(declare-fun t!36143 () Bool)

(declare-fun tb!8967 () Bool)

(assert (=> (and start!98794 (= defaultEntry!1004 defaultEntry!1004) t!36143) tb!8967))

(declare-fun result!18507 () Bool)

(assert (=> tb!8967 (= result!18507 tp_is_empty!28693)))

(assert (=> b!1143879 t!36143))

(declare-fun b_and!39179 () Bool)

(assert (= b_and!39177 (and (=> t!36143 result!18507) b_and!39179)))

(declare-fun m!1055387 () Bool)

(assert (=> b!1143861 m!1055387))

(declare-fun m!1055389 () Bool)

(assert (=> b!1143861 m!1055389))

(declare-fun m!1055391 () Bool)

(assert (=> b!1143861 m!1055391))

(declare-fun m!1055393 () Bool)

(assert (=> b!1143854 m!1055393))

(declare-fun m!1055395 () Bool)

(assert (=> b!1143875 m!1055395))

(declare-fun m!1055397 () Bool)

(assert (=> b!1143875 m!1055397))

(declare-fun m!1055399 () Bool)

(assert (=> bm!51561 m!1055399))

(declare-fun m!1055401 () Bool)

(assert (=> b!1143879 m!1055401))

(declare-fun m!1055403 () Bool)

(assert (=> b!1143879 m!1055403))

(declare-fun m!1055405 () Bool)

(assert (=> b!1143879 m!1055405))

(declare-fun m!1055407 () Bool)

(assert (=> b!1143879 m!1055407))

(declare-fun m!1055409 () Bool)

(assert (=> b!1143859 m!1055409))

(declare-fun m!1055411 () Bool)

(assert (=> b!1143851 m!1055411))

(declare-fun m!1055413 () Bool)

(assert (=> mapNonEmpty!44864 m!1055413))

(declare-fun m!1055415 () Bool)

(assert (=> b!1143856 m!1055415))

(declare-fun m!1055417 () Bool)

(assert (=> b!1143856 m!1055417))

(declare-fun m!1055419 () Bool)

(assert (=> b!1143856 m!1055419))

(declare-fun m!1055421 () Bool)

(assert (=> b!1143856 m!1055421))

(declare-fun m!1055423 () Bool)

(assert (=> bm!51560 m!1055423))

(declare-fun m!1055425 () Bool)

(assert (=> b!1143873 m!1055425))

(declare-fun m!1055427 () Bool)

(assert (=> b!1143862 m!1055427))

(declare-fun m!1055429 () Bool)

(assert (=> b!1143865 m!1055429))

(declare-fun m!1055431 () Bool)

(assert (=> b!1143874 m!1055431))

(declare-fun m!1055433 () Bool)

(assert (=> b!1143858 m!1055433))

(declare-fun m!1055435 () Bool)

(assert (=> b!1143858 m!1055435))

(declare-fun m!1055437 () Bool)

(assert (=> b!1143866 m!1055437))

(assert (=> b!1143876 m!1055411))

(declare-fun m!1055439 () Bool)

(assert (=> start!98794 m!1055439))

(declare-fun m!1055441 () Bool)

(assert (=> start!98794 m!1055441))

(declare-fun m!1055443 () Bool)

(assert (=> bm!51566 m!1055443))

(declare-fun m!1055445 () Bool)

(assert (=> bm!51565 m!1055445))

(declare-fun m!1055447 () Bool)

(assert (=> bm!51562 m!1055447))

(declare-fun m!1055449 () Bool)

(assert (=> b!1143871 m!1055449))

(assert (=> b!1143871 m!1055423))

(declare-fun m!1055451 () Bool)

(assert (=> b!1143871 m!1055451))

(declare-fun m!1055453 () Bool)

(assert (=> b!1143871 m!1055453))

(declare-fun m!1055455 () Bool)

(assert (=> b!1143871 m!1055455))

(declare-fun m!1055457 () Bool)

(assert (=> b!1143871 m!1055457))

(declare-fun m!1055459 () Bool)

(assert (=> b!1143871 m!1055459))

(assert (=> b!1143871 m!1055451))

(assert (=> b!1143871 m!1055449))

(assert (=> b!1143871 m!1055451))

(declare-fun m!1055461 () Bool)

(assert (=> b!1143871 m!1055461))

(assert (=> b!1143871 m!1055455))

(assert (=> b!1143857 m!1055451))

(declare-fun m!1055463 () Bool)

(assert (=> b!1143857 m!1055463))

(check-sat (not b!1143874) (not b!1143851) b_and!39179 (not bm!51566) (not start!98794) (not b!1143862) (not b_next!24163) (not b!1143865) (not b!1143879) (not b!1143873) (not b!1143875) (not b!1143876) (not bm!51561) (not b!1143856) (not b!1143854) (not bm!51560) (not b!1143858) (not bm!51565) (not mapNonEmpty!44864) (not b!1143861) (not bm!51562) (not b_lambda!19263) (not b!1143859) (not b!1143871) (not b!1143857) tp_is_empty!28693)
(check-sat b_and!39179 (not b_next!24163))
