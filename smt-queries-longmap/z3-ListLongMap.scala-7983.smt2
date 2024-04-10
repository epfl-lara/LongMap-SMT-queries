; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98740 () Bool)

(assert start!98740)

(declare-fun b_free!24345 () Bool)

(declare-fun b_next!24345 () Bool)

(assert (=> start!98740 (= b_free!24345 (not b_next!24345))))

(declare-fun tp!85746 () Bool)

(declare-fun b_and!39539 () Bool)

(assert (=> start!98740 (= tp!85746 b_and!39539)))

(declare-fun b!1150882 () Bool)

(declare-fun c!113963 () Bool)

(declare-fun lt!515131 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1150882 (= c!113963 (and (not lt!515131) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37851 0))(
  ( (Unit!37852) )
))
(declare-fun e!654593 () Unit!37851)

(declare-fun e!654586 () Unit!37851)

(assert (=> b!1150882 (= e!654593 e!654586)))

(declare-fun b!1150883 () Bool)

(declare-fun lt!515120 () Unit!37851)

(assert (=> b!1150883 (= e!654586 lt!515120)))

(declare-fun call!53687 () Unit!37851)

(assert (=> b!1150883 (= lt!515120 call!53687)))

(declare-fun call!53686 () Bool)

(assert (=> b!1150883 call!53686))

(declare-fun mapNonEmpty!45137 () Bool)

(declare-fun mapRes!45137 () Bool)

(declare-fun tp!85745 () Bool)

(declare-fun e!654589 () Bool)

(assert (=> mapNonEmpty!45137 (= mapRes!45137 (and tp!85745 e!654589))))

(declare-datatypes ((V!43627 0))(
  ( (V!43628 (val!14494 Int)) )
))
(declare-datatypes ((ValueCell!13728 0))(
  ( (ValueCellFull!13728 (v!17131 V!43627)) (EmptyCell!13728) )
))
(declare-fun mapRest!45137 () (Array (_ BitVec 32) ValueCell!13728))

(declare-fun mapValue!45137 () ValueCell!13728)

(declare-fun mapKey!45137 () (_ BitVec 32))

(declare-datatypes ((array!74597 0))(
  ( (array!74598 (arr!35949 (Array (_ BitVec 32) ValueCell!13728)) (size!36485 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74597)

(assert (=> mapNonEmpty!45137 (= (arr!35949 _values!996) (store mapRest!45137 mapKey!45137 mapValue!45137))))

(declare-fun bm!53679 () Bool)

(declare-fun call!53684 () Bool)

(assert (=> bm!53679 (= call!53686 call!53684)))

(declare-fun b!1150884 () Bool)

(declare-fun tp_is_empty!28875 () Bool)

(assert (=> b!1150884 (= e!654589 tp_is_empty!28875)))

(declare-fun mapIsEmpty!45137 () Bool)

(assert (=> mapIsEmpty!45137 mapRes!45137))

(declare-fun zeroValue!944 () V!43627)

(declare-fun b!1150885 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18400 0))(
  ( (tuple2!18401 (_1!9211 (_ BitVec 64)) (_2!9211 V!43627)) )
))
(declare-datatypes ((List!25148 0))(
  ( (Nil!25145) (Cons!25144 (h!26353 tuple2!18400) (t!36485 List!25148)) )
))
(declare-datatypes ((ListLongMap!16369 0))(
  ( (ListLongMap!16370 (toList!8200 List!25148)) )
))
(declare-fun lt!515123 () ListLongMap!16369)

(declare-fun e!654597 () Bool)

(declare-fun lt!515136 () array!74597)

(declare-datatypes ((array!74599 0))(
  ( (array!74600 (arr!35950 (Array (_ BitVec 32) (_ BitVec 64))) (size!36486 (_ BitVec 32))) )
))
(declare-fun lt!515125 () array!74599)

(declare-fun minValue!944 () V!43627)

(declare-fun getCurrentListMapNoExtraKeys!4672 (array!74599 array!74597 (_ BitVec 32) (_ BitVec 32) V!43627 V!43627 (_ BitVec 32) Int) ListLongMap!16369)

(assert (=> b!1150885 (= e!654597 (= lt!515123 (getCurrentListMapNoExtraKeys!4672 lt!515125 lt!515136 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!515139 () ListLongMap!16369)

(declare-fun bm!53680 () Bool)

(declare-fun lt!515124 () ListLongMap!16369)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!113967 () Bool)

(declare-fun call!53688 () Unit!37851)

(declare-fun addStillContains!868 (ListLongMap!16369 (_ BitVec 64) V!43627 (_ BitVec 64)) Unit!37851)

(assert (=> bm!53680 (= call!53688 (addStillContains!868 (ite c!113967 lt!515124 lt!515139) (ite c!113967 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113963 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113967 minValue!944 (ite c!113963 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150886 () Bool)

(declare-fun e!654592 () Bool)

(declare-fun e!654583 () Bool)

(assert (=> b!1150886 (= e!654592 e!654583)))

(declare-fun res!765439 () Bool)

(assert (=> b!1150886 (=> res!765439 e!654583)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150886 (= res!765439 (not (= from!1455 i!673)))))

(declare-fun lt!515126 () ListLongMap!16369)

(assert (=> b!1150886 (= lt!515126 (getCurrentListMapNoExtraKeys!4672 lt!515125 lt!515136 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515129 () V!43627)

(assert (=> b!1150886 (= lt!515136 (array!74598 (store (arr!35949 _values!996) i!673 (ValueCellFull!13728 lt!515129)) (size!36485 _values!996)))))

(declare-fun dynLambda!2695 (Int (_ BitVec 64)) V!43627)

(assert (=> b!1150886 (= lt!515129 (dynLambda!2695 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74599)

(declare-fun lt!515121 () ListLongMap!16369)

(assert (=> b!1150886 (= lt!515121 (getCurrentListMapNoExtraKeys!4672 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!53682 () ListLongMap!16369)

(declare-fun bm!53681 () Bool)

(declare-fun +!3618 (ListLongMap!16369 tuple2!18400) ListLongMap!16369)

(assert (=> bm!53681 (= call!53682 (+!3618 lt!515139 (ite (or c!113967 c!113963) (tuple2!18401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150887 () Bool)

(declare-fun res!765438 () Bool)

(declare-fun e!654594 () Bool)

(assert (=> b!1150887 (=> (not res!765438) (not e!654594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150887 (= res!765438 (validKeyInArray!0 k0!934))))

(declare-fun call!53685 () ListLongMap!16369)

(declare-fun bm!53682 () Bool)

(declare-fun contains!6719 (ListLongMap!16369 (_ BitVec 64)) Bool)

(assert (=> bm!53682 (= call!53684 (contains!6719 (ite c!113967 lt!515124 call!53685) k0!934))))

(declare-fun e!654582 () Bool)

(declare-fun b!1150888 () Bool)

(declare-fun arrayContainsKey!0 (array!74599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150888 (= e!654582 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150889 () Bool)

(declare-fun e!654591 () Bool)

(assert (=> b!1150889 (= e!654594 e!654591)))

(declare-fun res!765440 () Bool)

(assert (=> b!1150889 (=> (not res!765440) (not e!654591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74599 (_ BitVec 32)) Bool)

(assert (=> b!1150889 (= res!765440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515125 mask!1564))))

(assert (=> b!1150889 (= lt!515125 (array!74600 (store (arr!35950 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36486 _keys!1208)))))

(declare-fun b!1150890 () Bool)

(declare-fun e!654590 () Unit!37851)

(assert (=> b!1150890 (= e!654586 e!654590)))

(declare-fun c!113965 () Bool)

(assert (=> b!1150890 (= c!113965 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515131))))

(declare-fun b!1150891 () Bool)

(assert (=> b!1150891 (contains!6719 (+!3618 lt!515124 (tuple2!18401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!515135 () Unit!37851)

(assert (=> b!1150891 (= lt!515135 call!53688)))

(assert (=> b!1150891 call!53684))

(assert (=> b!1150891 (= lt!515124 call!53682)))

(declare-fun lt!515134 () Unit!37851)

(assert (=> b!1150891 (= lt!515134 (addStillContains!868 lt!515139 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150891 (= e!654593 lt!515135)))

(declare-fun call!53683 () ListLongMap!16369)

(declare-fun bm!53683 () Bool)

(assert (=> bm!53683 (= call!53683 (getCurrentListMapNoExtraKeys!4672 lt!515125 lt!515136 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150892 () Bool)

(declare-fun res!765436 () Bool)

(assert (=> b!1150892 (=> (not res!765436) (not e!654594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150892 (= res!765436 (validMask!0 mask!1564))))

(declare-fun b!1150893 () Bool)

(declare-fun e!654581 () Bool)

(declare-fun call!53689 () ListLongMap!16369)

(assert (=> b!1150893 (= e!654581 (= call!53683 call!53689))))

(declare-fun b!1150894 () Bool)

(declare-fun res!765437 () Bool)

(assert (=> b!1150894 (=> (not res!765437) (not e!654594))))

(assert (=> b!1150894 (= res!765437 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36486 _keys!1208))))))

(declare-fun b!1150895 () Bool)

(declare-fun res!765442 () Bool)

(assert (=> b!1150895 (=> (not res!765442) (not e!654594))))

(assert (=> b!1150895 (= res!765442 (and (= (size!36485 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36486 _keys!1208) (size!36485 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150896 () Bool)

(declare-fun e!654596 () Bool)

(declare-fun e!654587 () Bool)

(assert (=> b!1150896 (= e!654596 (and e!654587 mapRes!45137))))

(declare-fun condMapEmpty!45137 () Bool)

(declare-fun mapDefault!45137 () ValueCell!13728)

(assert (=> b!1150896 (= condMapEmpty!45137 (= (arr!35949 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13728)) mapDefault!45137)))))

(declare-fun b!1150897 () Bool)

(declare-fun e!654595 () Bool)

(assert (=> b!1150897 (= e!654583 e!654595)))

(declare-fun res!765430 () Bool)

(assert (=> b!1150897 (=> res!765430 e!654595)))

(assert (=> b!1150897 (= res!765430 (not (= (select (arr!35950 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150897 e!654581))

(declare-fun c!113966 () Bool)

(assert (=> b!1150897 (= c!113966 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515119 () Unit!37851)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!568 (array!74599 array!74597 (_ BitVec 32) (_ BitVec 32) V!43627 V!43627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37851)

(assert (=> b!1150897 (= lt!515119 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53684 () Bool)

(assert (=> bm!53684 (= call!53689 (getCurrentListMapNoExtraKeys!4672 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150898 () Bool)

(declare-fun Unit!37853 () Unit!37851)

(assert (=> b!1150898 (= e!654590 Unit!37853)))

(declare-fun b!1150899 () Bool)

(declare-fun e!654584 () Unit!37851)

(declare-fun Unit!37854 () Unit!37851)

(assert (=> b!1150899 (= e!654584 Unit!37854)))

(declare-fun b!1150900 () Bool)

(declare-fun res!765441 () Bool)

(assert (=> b!1150900 (=> (not res!765441) (not e!654591))))

(declare-datatypes ((List!25149 0))(
  ( (Nil!25146) (Cons!25145 (h!26354 (_ BitVec 64)) (t!36486 List!25149)) )
))
(declare-fun arrayNoDuplicates!0 (array!74599 (_ BitVec 32) List!25149) Bool)

(assert (=> b!1150900 (= res!765441 (arrayNoDuplicates!0 lt!515125 #b00000000000000000000000000000000 Nil!25146))))

(declare-fun b!1150901 () Bool)

(declare-fun res!765443 () Bool)

(assert (=> b!1150901 (=> (not res!765443) (not e!654594))))

(assert (=> b!1150901 (= res!765443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150902 () Bool)

(declare-fun -!1331 (ListLongMap!16369 (_ BitVec 64)) ListLongMap!16369)

(assert (=> b!1150902 (= e!654581 (= call!53683 (-!1331 call!53689 k0!934)))))

(declare-fun b!1150903 () Bool)

(declare-fun Unit!37855 () Unit!37851)

(assert (=> b!1150903 (= e!654584 Unit!37855)))

(assert (=> b!1150903 (= lt!515131 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150903 (= c!113967 (and (not lt!515131) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515118 () Unit!37851)

(assert (=> b!1150903 (= lt!515118 e!654593)))

(declare-fun lt!515128 () Unit!37851)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!460 (array!74599 array!74597 (_ BitVec 32) (_ BitVec 32) V!43627 V!43627 (_ BitVec 64) (_ BitVec 32) Int) Unit!37851)

(assert (=> b!1150903 (= lt!515128 (lemmaListMapContainsThenArrayContainsFrom!460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113968 () Bool)

(assert (=> b!1150903 (= c!113968 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765435 () Bool)

(declare-fun e!654585 () Bool)

(assert (=> b!1150903 (= res!765435 e!654585)))

(assert (=> b!1150903 (=> (not res!765435) (not e!654582))))

(assert (=> b!1150903 e!654582))

(declare-fun lt!515138 () Unit!37851)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74599 (_ BitVec 32) (_ BitVec 32)) Unit!37851)

(assert (=> b!1150903 (= lt!515138 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150903 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25146)))

(declare-fun lt!515127 () Unit!37851)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74599 (_ BitVec 64) (_ BitVec 32) List!25149) Unit!37851)

(assert (=> b!1150903 (= lt!515127 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25146))))

(assert (=> b!1150903 false))

(declare-fun b!1150904 () Bool)

(assert (=> b!1150904 (= e!654591 (not e!654592))))

(declare-fun res!765429 () Bool)

(assert (=> b!1150904 (=> res!765429 e!654592)))

(assert (=> b!1150904 (= res!765429 (bvsgt from!1455 i!673))))

(assert (=> b!1150904 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515133 () Unit!37851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74599 (_ BitVec 64) (_ BitVec 32)) Unit!37851)

(assert (=> b!1150904 (= lt!515133 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53685 () Bool)

(assert (=> bm!53685 (= call!53687 call!53688)))

(declare-fun bm!53686 () Bool)

(assert (=> bm!53686 (= call!53685 call!53682)))

(declare-fun b!1150905 () Bool)

(assert (=> b!1150905 (= e!654585 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515131) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150906 () Bool)

(declare-fun res!765431 () Bool)

(assert (=> b!1150906 (=> (not res!765431) (not e!654594))))

(assert (=> b!1150906 (= res!765431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25146))))

(declare-fun res!765433 () Bool)

(assert (=> start!98740 (=> (not res!765433) (not e!654594))))

(assert (=> start!98740 (= res!765433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36486 _keys!1208))))))

(assert (=> start!98740 e!654594))

(assert (=> start!98740 tp_is_empty!28875))

(declare-fun array_inv!27532 (array!74599) Bool)

(assert (=> start!98740 (array_inv!27532 _keys!1208)))

(assert (=> start!98740 true))

(assert (=> start!98740 tp!85746))

(declare-fun array_inv!27533 (array!74597) Bool)

(assert (=> start!98740 (and (array_inv!27533 _values!996) e!654596)))

(declare-fun b!1150907 () Bool)

(assert (=> b!1150907 call!53686))

(declare-fun lt!515132 () Unit!37851)

(assert (=> b!1150907 (= lt!515132 call!53687)))

(assert (=> b!1150907 (= e!654590 lt!515132)))

(declare-fun b!1150908 () Bool)

(assert (=> b!1150908 (= e!654587 tp_is_empty!28875)))

(declare-fun b!1150909 () Bool)

(assert (=> b!1150909 (= e!654595 true)))

(assert (=> b!1150909 e!654597))

(declare-fun res!765434 () Bool)

(assert (=> b!1150909 (=> (not res!765434) (not e!654597))))

(assert (=> b!1150909 (= res!765434 (= lt!515123 lt!515139))))

(assert (=> b!1150909 (= lt!515123 (-!1331 lt!515121 k0!934))))

(declare-fun lt!515137 () V!43627)

(assert (=> b!1150909 (= (-!1331 (+!3618 lt!515139 (tuple2!18401 (select (arr!35950 _keys!1208) from!1455) lt!515137)) (select (arr!35950 _keys!1208) from!1455)) lt!515139)))

(declare-fun lt!515122 () Unit!37851)

(declare-fun addThenRemoveForNewKeyIsSame!174 (ListLongMap!16369 (_ BitVec 64) V!43627) Unit!37851)

(assert (=> b!1150909 (= lt!515122 (addThenRemoveForNewKeyIsSame!174 lt!515139 (select (arr!35950 _keys!1208) from!1455) lt!515137))))

(declare-fun get!18302 (ValueCell!13728 V!43627) V!43627)

(assert (=> b!1150909 (= lt!515137 (get!18302 (select (arr!35949 _values!996) from!1455) lt!515129))))

(declare-fun lt!515130 () Unit!37851)

(assert (=> b!1150909 (= lt!515130 e!654584)))

(declare-fun c!113964 () Bool)

(assert (=> b!1150909 (= c!113964 (contains!6719 lt!515139 k0!934))))

(assert (=> b!1150909 (= lt!515139 (getCurrentListMapNoExtraKeys!4672 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150910 () Bool)

(assert (=> b!1150910 (= e!654585 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150911 () Bool)

(declare-fun res!765432 () Bool)

(assert (=> b!1150911 (=> (not res!765432) (not e!654594))))

(assert (=> b!1150911 (= res!765432 (= (select (arr!35950 _keys!1208) i!673) k0!934))))

(assert (= (and start!98740 res!765433) b!1150892))

(assert (= (and b!1150892 res!765436) b!1150895))

(assert (= (and b!1150895 res!765442) b!1150901))

(assert (= (and b!1150901 res!765443) b!1150906))

(assert (= (and b!1150906 res!765431) b!1150894))

(assert (= (and b!1150894 res!765437) b!1150887))

(assert (= (and b!1150887 res!765438) b!1150911))

(assert (= (and b!1150911 res!765432) b!1150889))

(assert (= (and b!1150889 res!765440) b!1150900))

(assert (= (and b!1150900 res!765441) b!1150904))

(assert (= (and b!1150904 (not res!765429)) b!1150886))

(assert (= (and b!1150886 (not res!765439)) b!1150897))

(assert (= (and b!1150897 c!113966) b!1150902))

(assert (= (and b!1150897 (not c!113966)) b!1150893))

(assert (= (or b!1150902 b!1150893) bm!53683))

(assert (= (or b!1150902 b!1150893) bm!53684))

(assert (= (and b!1150897 (not res!765430)) b!1150909))

(assert (= (and b!1150909 c!113964) b!1150903))

(assert (= (and b!1150909 (not c!113964)) b!1150899))

(assert (= (and b!1150903 c!113967) b!1150891))

(assert (= (and b!1150903 (not c!113967)) b!1150882))

(assert (= (and b!1150882 c!113963) b!1150883))

(assert (= (and b!1150882 (not c!113963)) b!1150890))

(assert (= (and b!1150890 c!113965) b!1150907))

(assert (= (and b!1150890 (not c!113965)) b!1150898))

(assert (= (or b!1150883 b!1150907) bm!53685))

(assert (= (or b!1150883 b!1150907) bm!53686))

(assert (= (or b!1150883 b!1150907) bm!53679))

(assert (= (or b!1150891 bm!53679) bm!53682))

(assert (= (or b!1150891 bm!53685) bm!53680))

(assert (= (or b!1150891 bm!53686) bm!53681))

(assert (= (and b!1150903 c!113968) b!1150910))

(assert (= (and b!1150903 (not c!113968)) b!1150905))

(assert (= (and b!1150903 res!765435) b!1150888))

(assert (= (and b!1150909 res!765434) b!1150885))

(assert (= (and b!1150896 condMapEmpty!45137) mapIsEmpty!45137))

(assert (= (and b!1150896 (not condMapEmpty!45137)) mapNonEmpty!45137))

(get-info :version)

(assert (= (and mapNonEmpty!45137 ((_ is ValueCellFull!13728) mapValue!45137)) b!1150884))

(assert (= (and b!1150896 ((_ is ValueCellFull!13728) mapDefault!45137)) b!1150908))

(assert (= start!98740 b!1150896))

(declare-fun b_lambda!19451 () Bool)

(assert (=> (not b_lambda!19451) (not b!1150886)))

(declare-fun t!36484 () Bool)

(declare-fun tb!9157 () Bool)

(assert (=> (and start!98740 (= defaultEntry!1004 defaultEntry!1004) t!36484) tb!9157))

(declare-fun result!18879 () Bool)

(assert (=> tb!9157 (= result!18879 tp_is_empty!28875)))

(assert (=> b!1150886 t!36484))

(declare-fun b_and!39541 () Bool)

(assert (= b_and!39539 (and (=> t!36484 result!18879) b_and!39541)))

(declare-fun m!1061065 () Bool)

(assert (=> b!1150887 m!1061065))

(declare-fun m!1061067 () Bool)

(assert (=> b!1150910 m!1061067))

(declare-fun m!1061069 () Bool)

(assert (=> b!1150889 m!1061069))

(declare-fun m!1061071 () Bool)

(assert (=> b!1150889 m!1061071))

(assert (=> b!1150888 m!1061067))

(declare-fun m!1061073 () Bool)

(assert (=> b!1150903 m!1061073))

(declare-fun m!1061075 () Bool)

(assert (=> b!1150903 m!1061075))

(declare-fun m!1061077 () Bool)

(assert (=> b!1150903 m!1061077))

(declare-fun m!1061079 () Bool)

(assert (=> b!1150903 m!1061079))

(declare-fun m!1061081 () Bool)

(assert (=> bm!53684 m!1061081))

(declare-fun m!1061083 () Bool)

(assert (=> b!1150897 m!1061083))

(declare-fun m!1061085 () Bool)

(assert (=> b!1150897 m!1061085))

(declare-fun m!1061087 () Bool)

(assert (=> b!1150904 m!1061087))

(declare-fun m!1061089 () Bool)

(assert (=> b!1150904 m!1061089))

(declare-fun m!1061091 () Bool)

(assert (=> b!1150892 m!1061091))

(declare-fun m!1061093 () Bool)

(assert (=> b!1150886 m!1061093))

(declare-fun m!1061095 () Bool)

(assert (=> b!1150886 m!1061095))

(declare-fun m!1061097 () Bool)

(assert (=> b!1150886 m!1061097))

(declare-fun m!1061099 () Bool)

(assert (=> b!1150886 m!1061099))

(declare-fun m!1061101 () Bool)

(assert (=> bm!53683 m!1061101))

(declare-fun m!1061103 () Bool)

(assert (=> bm!53682 m!1061103))

(declare-fun m!1061105 () Bool)

(assert (=> mapNonEmpty!45137 m!1061105))

(declare-fun m!1061107 () Bool)

(assert (=> bm!53681 m!1061107))

(assert (=> b!1150909 m!1061081))

(declare-fun m!1061109 () Bool)

(assert (=> b!1150909 m!1061109))

(assert (=> b!1150909 m!1061083))

(declare-fun m!1061111 () Bool)

(assert (=> b!1150909 m!1061111))

(declare-fun m!1061113 () Bool)

(assert (=> b!1150909 m!1061113))

(assert (=> b!1150909 m!1061109))

(declare-fun m!1061115 () Bool)

(assert (=> b!1150909 m!1061115))

(assert (=> b!1150909 m!1061083))

(declare-fun m!1061117 () Bool)

(assert (=> b!1150909 m!1061117))

(assert (=> b!1150909 m!1061083))

(assert (=> b!1150909 m!1061113))

(declare-fun m!1061119 () Bool)

(assert (=> b!1150909 m!1061119))

(declare-fun m!1061121 () Bool)

(assert (=> b!1150909 m!1061121))

(declare-fun m!1061123 () Bool)

(assert (=> b!1150902 m!1061123))

(declare-fun m!1061125 () Bool)

(assert (=> b!1150891 m!1061125))

(assert (=> b!1150891 m!1061125))

(declare-fun m!1061127 () Bool)

(assert (=> b!1150891 m!1061127))

(declare-fun m!1061129 () Bool)

(assert (=> b!1150891 m!1061129))

(declare-fun m!1061131 () Bool)

(assert (=> b!1150911 m!1061131))

(assert (=> b!1150885 m!1061101))

(declare-fun m!1061133 () Bool)

(assert (=> start!98740 m!1061133))

(declare-fun m!1061135 () Bool)

(assert (=> start!98740 m!1061135))

(declare-fun m!1061137 () Bool)

(assert (=> b!1150900 m!1061137))

(declare-fun m!1061139 () Bool)

(assert (=> bm!53680 m!1061139))

(declare-fun m!1061141 () Bool)

(assert (=> b!1150901 m!1061141))

(declare-fun m!1061143 () Bool)

(assert (=> b!1150906 m!1061143))

(check-sat (not b!1150901) (not b!1150889) (not start!98740) (not b!1150910) (not b!1150886) (not bm!53682) (not b!1150906) (not b!1150903) (not bm!53680) b_and!39541 (not bm!53681) (not b!1150904) (not b!1150885) (not b!1150909) (not bm!53684) tp_is_empty!28875 (not b_lambda!19451) (not b!1150891) (not b_next!24345) (not mapNonEmpty!45137) (not b!1150888) (not b!1150902) (not b!1150900) (not b!1150887) (not bm!53683) (not b!1150892) (not b!1150897))
(check-sat b_and!39541 (not b_next!24345))
