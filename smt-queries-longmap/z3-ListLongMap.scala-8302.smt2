; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101154 () Bool)

(assert start!101154)

(declare-fun b_free!26083 () Bool)

(declare-fun b_next!26083 () Bool)

(assert (=> start!101154 (= b_free!26083 (not b_next!26083))))

(declare-fun tp!91271 () Bool)

(declare-fun b_and!43265 () Bool)

(assert (=> start!101154 (= tp!91271 b_and!43265)))

(declare-datatypes ((V!46177 0))(
  ( (V!46178 (val!15450 Int)) )
))
(declare-fun zeroValue!944 () V!46177)

(declare-fun b!1213735 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78276 0))(
  ( (array!78277 (arr!37773 (Array (_ BitVec 32) (_ BitVec 64))) (size!38311 (_ BitVec 32))) )
))
(declare-fun lt!551793 () array!78276)

(declare-datatypes ((tuple2!19934 0))(
  ( (tuple2!19935 (_1!9978 (_ BitVec 64)) (_2!9978 V!46177)) )
))
(declare-datatypes ((List!26712 0))(
  ( (Nil!26709) (Cons!26708 (h!27917 tuple2!19934) (t!39766 List!26712)) )
))
(declare-datatypes ((ListLongMap!17903 0))(
  ( (ListLongMap!17904 (toList!8967 List!26712)) )
))
(declare-fun lt!551783 () ListLongMap!17903)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!689274 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14684 0))(
  ( (ValueCellFull!14684 (v!18102 V!46177)) (EmptyCell!14684) )
))
(declare-datatypes ((array!78278 0))(
  ( (array!78279 (arr!37774 (Array (_ BitVec 32) ValueCell!14684)) (size!38312 (_ BitVec 32))) )
))
(declare-fun lt!551785 () array!78278)

(declare-fun minValue!944 () V!46177)

(declare-fun getCurrentListMapNoExtraKeys!5407 (array!78276 array!78278 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 32) Int) ListLongMap!17903)

(assert (=> b!1213735 (= e!689274 (= lt!551783 (getCurrentListMapNoExtraKeys!5407 lt!551793 lt!551785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun _keys!1208 () array!78276)

(declare-fun e!689278 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1213736 () Bool)

(declare-fun arrayContainsKey!0 (array!78276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213736 (= e!689278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!48055 () Bool)

(declare-fun mapRes!48055 () Bool)

(assert (=> mapIsEmpty!48055 mapRes!48055))

(declare-fun e!689287 () Bool)

(declare-fun b!1213737 () Bool)

(assert (=> b!1213737 (= e!689287 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60459 () ListLongMap!17903)

(declare-fun c!119934 () Bool)

(declare-fun lt!551784 () ListLongMap!17903)

(declare-fun bm!60454 () Bool)

(declare-fun c!119936 () Bool)

(declare-fun lt!551794 () ListLongMap!17903)

(declare-fun +!4085 (ListLongMap!17903 tuple2!19934) ListLongMap!17903)

(assert (=> bm!60454 (= call!60459 (+!4085 (ite c!119936 lt!551784 lt!551794) (ite c!119936 (tuple2!19935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119934 (tuple2!19935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1213738 () Bool)

(declare-fun call!60464 () ListLongMap!17903)

(declare-fun e!689280 () Bool)

(declare-fun call!60463 () ListLongMap!17903)

(declare-fun -!1843 (ListLongMap!17903 (_ BitVec 64)) ListLongMap!17903)

(assert (=> b!1213738 (= e!689280 (= call!60463 (-!1843 call!60464 k0!934)))))

(declare-fun b!1213739 () Bool)

(declare-fun e!689289 () Bool)

(declare-fun e!689282 () Bool)

(assert (=> b!1213739 (= e!689289 e!689282)))

(declare-fun res!805875 () Bool)

(assert (=> b!1213739 (=> res!805875 e!689282)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213739 (= res!805875 (not (= from!1455 i!673)))))

(declare-fun lt!551792 () ListLongMap!17903)

(assert (=> b!1213739 (= lt!551792 (getCurrentListMapNoExtraKeys!5407 lt!551793 lt!551785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551782 () V!46177)

(declare-fun _values!996 () array!78278)

(assert (=> b!1213739 (= lt!551785 (array!78279 (store (arr!37774 _values!996) i!673 (ValueCellFull!14684 lt!551782)) (size!38312 _values!996)))))

(declare-fun dynLambda!3261 (Int (_ BitVec 64)) V!46177)

(assert (=> b!1213739 (= lt!551782 (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551787 () ListLongMap!17903)

(assert (=> b!1213739 (= lt!551787 (getCurrentListMapNoExtraKeys!5407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213740 () Bool)

(declare-datatypes ((Unit!40099 0))(
  ( (Unit!40100) )
))
(declare-fun e!689284 () Unit!40099)

(declare-fun e!689276 () Unit!40099)

(assert (=> b!1213740 (= e!689284 e!689276)))

(declare-fun c!119932 () Bool)

(declare-fun lt!551797 () Bool)

(assert (=> b!1213740 (= c!119932 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551797))))

(declare-fun b!1213741 () Bool)

(declare-fun e!689279 () Bool)

(assert (=> b!1213741 (= e!689279 (not e!689289))))

(declare-fun res!805886 () Bool)

(assert (=> b!1213741 (=> res!805886 e!689289)))

(assert (=> b!1213741 (= res!805886 (bvsgt from!1455 i!673))))

(assert (=> b!1213741 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551780 () Unit!40099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78276 (_ BitVec 64) (_ BitVec 32)) Unit!40099)

(assert (=> b!1213741 (= lt!551780 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1213742 () Bool)

(declare-fun res!805876 () Bool)

(declare-fun e!689277 () Bool)

(assert (=> b!1213742 (=> (not res!805876) (not e!689277))))

(assert (=> b!1213742 (= res!805876 (and (= (size!38312 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38311 _keys!1208) (size!38312 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213743 () Bool)

(declare-fun e!689281 () Unit!40099)

(declare-fun Unit!40101 () Unit!40099)

(assert (=> b!1213743 (= e!689281 Unit!40101)))

(declare-fun b!1213744 () Bool)

(declare-fun res!805879 () Bool)

(assert (=> b!1213744 (=> (not res!805879) (not e!689277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213744 (= res!805879 (validMask!0 mask!1564))))

(declare-fun b!1213745 () Bool)

(declare-fun res!805881 () Bool)

(assert (=> b!1213745 (=> (not res!805881) (not e!689277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213745 (= res!805881 (validKeyInArray!0 k0!934))))

(declare-fun b!1213746 () Bool)

(declare-fun res!805884 () Bool)

(assert (=> b!1213746 (=> (not res!805884) (not e!689279))))

(declare-datatypes ((List!26713 0))(
  ( (Nil!26710) (Cons!26709 (h!27918 (_ BitVec 64)) (t!39767 List!26713)) )
))
(declare-fun arrayNoDuplicates!0 (array!78276 (_ BitVec 32) List!26713) Bool)

(assert (=> b!1213746 (= res!805884 (arrayNoDuplicates!0 lt!551793 #b00000000000000000000000000000000 Nil!26710))))

(declare-fun b!1213747 () Bool)

(declare-fun Unit!40102 () Unit!40099)

(assert (=> b!1213747 (= e!689281 Unit!40102)))

(assert (=> b!1213747 (= lt!551797 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213747 (= c!119936 (and (not lt!551797) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551799 () Unit!40099)

(declare-fun e!689286 () Unit!40099)

(assert (=> b!1213747 (= lt!551799 e!689286)))

(declare-fun lt!551781 () Unit!40099)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!610 (array!78276 array!78278 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 64) (_ BitVec 32) Int) Unit!40099)

(assert (=> b!1213747 (= lt!551781 (lemmaListMapContainsThenArrayContainsFrom!610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119937 () Bool)

(assert (=> b!1213747 (= c!119937 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805874 () Bool)

(assert (=> b!1213747 (= res!805874 e!689278)))

(assert (=> b!1213747 (=> (not res!805874) (not e!689287))))

(assert (=> b!1213747 e!689287))

(declare-fun lt!551786 () Unit!40099)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78276 (_ BitVec 32) (_ BitVec 32)) Unit!40099)

(assert (=> b!1213747 (= lt!551786 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213747 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26710)))

(declare-fun lt!551791 () Unit!40099)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78276 (_ BitVec 64) (_ BitVec 32) List!26713) Unit!40099)

(assert (=> b!1213747 (= lt!551791 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26710))))

(assert (=> b!1213747 false))

(declare-fun b!1213748 () Bool)

(declare-fun res!805878 () Bool)

(assert (=> b!1213748 (=> (not res!805878) (not e!689277))))

(assert (=> b!1213748 (= res!805878 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38311 _keys!1208))))))

(declare-fun b!1213749 () Bool)

(declare-fun res!805888 () Bool)

(assert (=> b!1213749 (=> (not res!805888) (not e!689277))))

(assert (=> b!1213749 (= res!805888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26710))))

(declare-fun bm!60455 () Bool)

(declare-fun call!60460 () Unit!40099)

(declare-fun addStillContains!1070 (ListLongMap!17903 (_ BitVec 64) V!46177 (_ BitVec 64)) Unit!40099)

(assert (=> bm!60455 (= call!60460 (addStillContains!1070 (ite c!119936 lt!551784 lt!551794) (ite c!119936 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119934 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119936 minValue!944 (ite c!119934 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!60456 () Bool)

(declare-fun call!60458 () Unit!40099)

(assert (=> bm!60456 (= call!60458 call!60460)))

(declare-fun res!805887 () Bool)

(assert (=> start!101154 (=> (not res!805887) (not e!689277))))

(assert (=> start!101154 (= res!805887 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38311 _keys!1208))))))

(assert (=> start!101154 e!689277))

(declare-fun tp_is_empty!30787 () Bool)

(assert (=> start!101154 tp_is_empty!30787))

(declare-fun array_inv!28876 (array!78276) Bool)

(assert (=> start!101154 (array_inv!28876 _keys!1208)))

(assert (=> start!101154 true))

(assert (=> start!101154 tp!91271))

(declare-fun e!689290 () Bool)

(declare-fun array_inv!28877 (array!78278) Bool)

(assert (=> start!101154 (and (array_inv!28877 _values!996) e!689290)))

(declare-fun bm!60457 () Bool)

(assert (=> bm!60457 (= call!60463 (getCurrentListMapNoExtraKeys!5407 lt!551793 lt!551785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213750 () Bool)

(declare-fun call!60461 () Bool)

(assert (=> b!1213750 call!60461))

(declare-fun lt!551798 () Unit!40099)

(assert (=> b!1213750 (= lt!551798 call!60458)))

(assert (=> b!1213750 (= e!689276 lt!551798)))

(declare-fun b!1213751 () Bool)

(declare-fun e!689288 () Bool)

(assert (=> b!1213751 (= e!689288 tp_is_empty!30787)))

(declare-fun call!60462 () ListLongMap!17903)

(declare-fun bm!60458 () Bool)

(declare-fun call!60457 () Bool)

(declare-fun contains!6974 (ListLongMap!17903 (_ BitVec 64)) Bool)

(assert (=> bm!60458 (= call!60457 (contains!6974 (ite c!119936 lt!551784 call!60462) k0!934))))

(declare-fun b!1213752 () Bool)

(declare-fun e!689285 () Bool)

(assert (=> b!1213752 (= e!689282 e!689285)))

(declare-fun res!805883 () Bool)

(assert (=> b!1213752 (=> res!805883 e!689285)))

(assert (=> b!1213752 (= res!805883 (not (= (select (arr!37773 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213752 e!689280))

(declare-fun c!119935 () Bool)

(assert (=> b!1213752 (= c!119935 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551790 () Unit!40099)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1078 (array!78276 array!78278 (_ BitVec 32) (_ BitVec 32) V!46177 V!46177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40099)

(assert (=> b!1213752 (= lt!551790 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1078 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60459 () Bool)

(assert (=> bm!60459 (= call!60462 call!60459)))

(declare-fun b!1213753 () Bool)

(declare-fun e!689275 () Bool)

(assert (=> b!1213753 (= e!689275 tp_is_empty!30787)))

(declare-fun b!1213754 () Bool)

(declare-fun lt!551795 () Unit!40099)

(assert (=> b!1213754 (= e!689284 lt!551795)))

(assert (=> b!1213754 (= lt!551795 call!60458)))

(assert (=> b!1213754 call!60461))

(declare-fun b!1213755 () Bool)

(declare-fun res!805880 () Bool)

(assert (=> b!1213755 (=> (not res!805880) (not e!689277))))

(assert (=> b!1213755 (= res!805880 (= (select (arr!37773 _keys!1208) i!673) k0!934))))

(declare-fun b!1213756 () Bool)

(assert (=> b!1213756 (contains!6974 call!60459 k0!934)))

(declare-fun lt!551789 () Unit!40099)

(assert (=> b!1213756 (= lt!551789 call!60460)))

(assert (=> b!1213756 call!60457))

(assert (=> b!1213756 (= lt!551784 (+!4085 lt!551794 (tuple2!19935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551800 () Unit!40099)

(assert (=> b!1213756 (= lt!551800 (addStillContains!1070 lt!551794 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1213756 (= e!689286 lt!551789)))

(declare-fun b!1213757 () Bool)

(assert (=> b!1213757 (= e!689278 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551797) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213758 () Bool)

(assert (=> b!1213758 (= c!119934 (and (not lt!551797) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1213758 (= e!689286 e!689284)))

(declare-fun bm!60460 () Bool)

(assert (=> bm!60460 (= call!60461 call!60457)))

(declare-fun b!1213759 () Bool)

(assert (=> b!1213759 (= e!689285 true)))

(assert (=> b!1213759 e!689274))

(declare-fun res!805885 () Bool)

(assert (=> b!1213759 (=> (not res!805885) (not e!689274))))

(assert (=> b!1213759 (= res!805885 (= lt!551783 lt!551794))))

(assert (=> b!1213759 (= lt!551783 (-!1843 lt!551787 k0!934))))

(declare-fun lt!551788 () V!46177)

(assert (=> b!1213759 (= (-!1843 (+!4085 lt!551794 (tuple2!19935 (select (arr!37773 _keys!1208) from!1455) lt!551788)) (select (arr!37773 _keys!1208) from!1455)) lt!551794)))

(declare-fun lt!551796 () Unit!40099)

(declare-fun addThenRemoveForNewKeyIsSame!275 (ListLongMap!17903 (_ BitVec 64) V!46177) Unit!40099)

(assert (=> b!1213759 (= lt!551796 (addThenRemoveForNewKeyIsSame!275 lt!551794 (select (arr!37773 _keys!1208) from!1455) lt!551788))))

(declare-fun get!19274 (ValueCell!14684 V!46177) V!46177)

(assert (=> b!1213759 (= lt!551788 (get!19274 (select (arr!37774 _values!996) from!1455) lt!551782))))

(declare-fun lt!551801 () Unit!40099)

(assert (=> b!1213759 (= lt!551801 e!689281)))

(declare-fun c!119933 () Bool)

(assert (=> b!1213759 (= c!119933 (contains!6974 lt!551794 k0!934))))

(assert (=> b!1213759 (= lt!551794 (getCurrentListMapNoExtraKeys!5407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60461 () Bool)

(assert (=> bm!60461 (= call!60464 (getCurrentListMapNoExtraKeys!5407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48055 () Bool)

(declare-fun tp!91270 () Bool)

(assert (=> mapNonEmpty!48055 (= mapRes!48055 (and tp!91270 e!689288))))

(declare-fun mapKey!48055 () (_ BitVec 32))

(declare-fun mapValue!48055 () ValueCell!14684)

(declare-fun mapRest!48055 () (Array (_ BitVec 32) ValueCell!14684))

(assert (=> mapNonEmpty!48055 (= (arr!37774 _values!996) (store mapRest!48055 mapKey!48055 mapValue!48055))))

(declare-fun b!1213760 () Bool)

(assert (=> b!1213760 (= e!689280 (= call!60463 call!60464))))

(declare-fun b!1213761 () Bool)

(declare-fun Unit!40103 () Unit!40099)

(assert (=> b!1213761 (= e!689276 Unit!40103)))

(declare-fun b!1213762 () Bool)

(assert (=> b!1213762 (= e!689290 (and e!689275 mapRes!48055))))

(declare-fun condMapEmpty!48055 () Bool)

(declare-fun mapDefault!48055 () ValueCell!14684)

(assert (=> b!1213762 (= condMapEmpty!48055 (= (arr!37774 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14684)) mapDefault!48055)))))

(declare-fun b!1213763 () Bool)

(declare-fun res!805882 () Bool)

(assert (=> b!1213763 (=> (not res!805882) (not e!689277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78276 (_ BitVec 32)) Bool)

(assert (=> b!1213763 (= res!805882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213764 () Bool)

(assert (=> b!1213764 (= e!689277 e!689279)))

(declare-fun res!805877 () Bool)

(assert (=> b!1213764 (=> (not res!805877) (not e!689279))))

(assert (=> b!1213764 (= res!805877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551793 mask!1564))))

(assert (=> b!1213764 (= lt!551793 (array!78277 (store (arr!37773 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38311 _keys!1208)))))

(assert (= (and start!101154 res!805887) b!1213744))

(assert (= (and b!1213744 res!805879) b!1213742))

(assert (= (and b!1213742 res!805876) b!1213763))

(assert (= (and b!1213763 res!805882) b!1213749))

(assert (= (and b!1213749 res!805888) b!1213748))

(assert (= (and b!1213748 res!805878) b!1213745))

(assert (= (and b!1213745 res!805881) b!1213755))

(assert (= (and b!1213755 res!805880) b!1213764))

(assert (= (and b!1213764 res!805877) b!1213746))

(assert (= (and b!1213746 res!805884) b!1213741))

(assert (= (and b!1213741 (not res!805886)) b!1213739))

(assert (= (and b!1213739 (not res!805875)) b!1213752))

(assert (= (and b!1213752 c!119935) b!1213738))

(assert (= (and b!1213752 (not c!119935)) b!1213760))

(assert (= (or b!1213738 b!1213760) bm!60461))

(assert (= (or b!1213738 b!1213760) bm!60457))

(assert (= (and b!1213752 (not res!805883)) b!1213759))

(assert (= (and b!1213759 c!119933) b!1213747))

(assert (= (and b!1213759 (not c!119933)) b!1213743))

(assert (= (and b!1213747 c!119936) b!1213756))

(assert (= (and b!1213747 (not c!119936)) b!1213758))

(assert (= (and b!1213758 c!119934) b!1213754))

(assert (= (and b!1213758 (not c!119934)) b!1213740))

(assert (= (and b!1213740 c!119932) b!1213750))

(assert (= (and b!1213740 (not c!119932)) b!1213761))

(assert (= (or b!1213754 b!1213750) bm!60456))

(assert (= (or b!1213754 b!1213750) bm!60459))

(assert (= (or b!1213754 b!1213750) bm!60460))

(assert (= (or b!1213756 bm!60460) bm!60458))

(assert (= (or b!1213756 bm!60456) bm!60455))

(assert (= (or b!1213756 bm!60459) bm!60454))

(assert (= (and b!1213747 c!119937) b!1213736))

(assert (= (and b!1213747 (not c!119937)) b!1213757))

(assert (= (and b!1213747 res!805874) b!1213737))

(assert (= (and b!1213759 res!805885) b!1213735))

(assert (= (and b!1213762 condMapEmpty!48055) mapIsEmpty!48055))

(assert (= (and b!1213762 (not condMapEmpty!48055)) mapNonEmpty!48055))

(get-info :version)

(assert (= (and mapNonEmpty!48055 ((_ is ValueCellFull!14684) mapValue!48055)) b!1213751))

(assert (= (and b!1213762 ((_ is ValueCellFull!14684) mapDefault!48055)) b!1213753))

(assert (= start!101154 b!1213762))

(declare-fun b_lambda!21749 () Bool)

(assert (=> (not b_lambda!21749) (not b!1213739)))

(declare-fun t!39765 () Bool)

(declare-fun tb!10875 () Bool)

(assert (=> (and start!101154 (= defaultEntry!1004 defaultEntry!1004) t!39765) tb!10875))

(declare-fun result!22355 () Bool)

(assert (=> tb!10875 (= result!22355 tp_is_empty!30787)))

(assert (=> b!1213739 t!39765))

(declare-fun b_and!43267 () Bool)

(assert (= b_and!43265 (and (=> t!39765 result!22355) b_and!43267)))

(declare-fun m!1118535 () Bool)

(assert (=> b!1213741 m!1118535))

(declare-fun m!1118537 () Bool)

(assert (=> b!1213741 m!1118537))

(declare-fun m!1118539 () Bool)

(assert (=> bm!60457 m!1118539))

(declare-fun m!1118541 () Bool)

(assert (=> b!1213752 m!1118541))

(declare-fun m!1118543 () Bool)

(assert (=> b!1213752 m!1118543))

(declare-fun m!1118545 () Bool)

(assert (=> b!1213749 m!1118545))

(declare-fun m!1118547 () Bool)

(assert (=> bm!60458 m!1118547))

(declare-fun m!1118549 () Bool)

(assert (=> b!1213746 m!1118549))

(declare-fun m!1118551 () Bool)

(assert (=> b!1213756 m!1118551))

(declare-fun m!1118553 () Bool)

(assert (=> b!1213756 m!1118553))

(declare-fun m!1118555 () Bool)

(assert (=> b!1213756 m!1118555))

(declare-fun m!1118557 () Bool)

(assert (=> b!1213744 m!1118557))

(declare-fun m!1118559 () Bool)

(assert (=> start!101154 m!1118559))

(declare-fun m!1118561 () Bool)

(assert (=> start!101154 m!1118561))

(declare-fun m!1118563 () Bool)

(assert (=> b!1213755 m!1118563))

(declare-fun m!1118565 () Bool)

(assert (=> b!1213764 m!1118565))

(declare-fun m!1118567 () Bool)

(assert (=> b!1213764 m!1118567))

(declare-fun m!1118569 () Bool)

(assert (=> bm!60454 m!1118569))

(declare-fun m!1118571 () Bool)

(assert (=> b!1213737 m!1118571))

(assert (=> b!1213735 m!1118539))

(declare-fun m!1118573 () Bool)

(assert (=> b!1213747 m!1118573))

(declare-fun m!1118575 () Bool)

(assert (=> b!1213747 m!1118575))

(declare-fun m!1118577 () Bool)

(assert (=> b!1213747 m!1118577))

(declare-fun m!1118579 () Bool)

(assert (=> b!1213747 m!1118579))

(declare-fun m!1118581 () Bool)

(assert (=> b!1213738 m!1118581))

(declare-fun m!1118583 () Bool)

(assert (=> b!1213739 m!1118583))

(declare-fun m!1118585 () Bool)

(assert (=> b!1213739 m!1118585))

(declare-fun m!1118587 () Bool)

(assert (=> b!1213739 m!1118587))

(declare-fun m!1118589 () Bool)

(assert (=> b!1213739 m!1118589))

(declare-fun m!1118591 () Bool)

(assert (=> bm!60461 m!1118591))

(declare-fun m!1118593 () Bool)

(assert (=> bm!60455 m!1118593))

(assert (=> b!1213759 m!1118591))

(declare-fun m!1118595 () Bool)

(assert (=> b!1213759 m!1118595))

(declare-fun m!1118597 () Bool)

(assert (=> b!1213759 m!1118597))

(declare-fun m!1118599 () Bool)

(assert (=> b!1213759 m!1118599))

(assert (=> b!1213759 m!1118541))

(declare-fun m!1118601 () Bool)

(assert (=> b!1213759 m!1118601))

(declare-fun m!1118603 () Bool)

(assert (=> b!1213759 m!1118603))

(assert (=> b!1213759 m!1118599))

(assert (=> b!1213759 m!1118595))

(declare-fun m!1118605 () Bool)

(assert (=> b!1213759 m!1118605))

(assert (=> b!1213759 m!1118541))

(declare-fun m!1118607 () Bool)

(assert (=> b!1213759 m!1118607))

(assert (=> b!1213759 m!1118541))

(declare-fun m!1118609 () Bool)

(assert (=> b!1213745 m!1118609))

(assert (=> b!1213736 m!1118571))

(declare-fun m!1118611 () Bool)

(assert (=> b!1213763 m!1118611))

(declare-fun m!1118613 () Bool)

(assert (=> mapNonEmpty!48055 m!1118613))

(check-sat (not b!1213749) (not b!1213764) (not bm!60461) (not b!1213735) (not b_next!26083) (not b_lambda!21749) tp_is_empty!30787 (not b!1213741) (not bm!60455) (not b!1213738) (not b!1213745) (not b!1213759) (not b!1213737) (not start!101154) (not bm!60458) (not b!1213763) (not mapNonEmpty!48055) (not b!1213744) (not b!1213752) (not b!1213746) b_and!43267 (not b!1213756) (not bm!60454) (not bm!60457) (not b!1213736) (not b!1213739) (not b!1213747))
(check-sat b_and!43267 (not b_next!26083))
