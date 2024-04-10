; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100770 () Bool)

(assert start!100770)

(declare-fun b_free!25941 () Bool)

(declare-fun b_next!25941 () Bool)

(assert (=> start!100770 (= b_free!25941 (not b_next!25941))))

(declare-fun tp!90825 () Bool)

(declare-fun b_and!42865 () Bool)

(assert (=> start!100770 (= tp!90825 b_and!42865)))

(declare-datatypes ((array!78071 0))(
  ( (array!78072 (arr!37676 (Array (_ BitVec 32) (_ BitVec 64))) (size!38212 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78071)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!684896 () Bool)

(declare-fun b!1206037 () Bool)

(declare-fun arrayContainsKey!0 (array!78071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206037 (= e!684896 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206038 () Bool)

(declare-fun e!684901 () Bool)

(declare-fun e!684897 () Bool)

(assert (=> b!1206038 (= e!684901 e!684897)))

(declare-fun res!802115 () Bool)

(assert (=> b!1206038 (=> res!802115 e!684897)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206038 (= res!802115 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45987 0))(
  ( (V!45988 (val!15379 Int)) )
))
(declare-fun zeroValue!944 () V!45987)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19730 0))(
  ( (tuple2!19731 (_1!9876 (_ BitVec 64)) (_2!9876 V!45987)) )
))
(declare-datatypes ((List!26534 0))(
  ( (Nil!26531) (Cons!26530 (h!27739 tuple2!19730) (t!39455 List!26534)) )
))
(declare-datatypes ((ListLongMap!17699 0))(
  ( (ListLongMap!17700 (toList!8865 List!26534)) )
))
(declare-fun lt!547060 () ListLongMap!17699)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14613 0))(
  ( (ValueCellFull!14613 (v!18023 V!45987)) (EmptyCell!14613) )
))
(declare-datatypes ((array!78073 0))(
  ( (array!78074 (arr!37677 (Array (_ BitVec 32) ValueCell!14613)) (size!38213 (_ BitVec 32))) )
))
(declare-fun lt!547066 () array!78073)

(declare-fun minValue!944 () V!45987)

(declare-fun lt!547061 () array!78071)

(declare-fun getCurrentListMapNoExtraKeys!5300 (array!78071 array!78073 (_ BitVec 32) (_ BitVec 32) V!45987 V!45987 (_ BitVec 32) Int) ListLongMap!17699)

(assert (=> b!1206038 (= lt!547060 (getCurrentListMapNoExtraKeys!5300 lt!547061 lt!547066 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78073)

(declare-fun dynLambda!3207 (Int (_ BitVec 64)) V!45987)

(assert (=> b!1206038 (= lt!547066 (array!78074 (store (arr!37677 _values!996) i!673 (ValueCellFull!14613 (dynLambda!3207 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38213 _values!996)))))

(declare-fun lt!547065 () ListLongMap!17699)

(assert (=> b!1206038 (= lt!547065 (getCurrentListMapNoExtraKeys!5300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206039 () Bool)

(declare-fun e!684893 () Bool)

(declare-fun e!684888 () Bool)

(assert (=> b!1206039 (= e!684893 e!684888)))

(declare-fun res!802110 () Bool)

(assert (=> b!1206039 (=> (not res!802110) (not e!684888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78071 (_ BitVec 32)) Bool)

(assert (=> b!1206039 (= res!802110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547061 mask!1564))))

(assert (=> b!1206039 (= lt!547061 (array!78072 (store (arr!37676 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38212 _keys!1208)))))

(declare-fun b!1206040 () Bool)

(declare-fun e!684890 () Bool)

(declare-fun tp_is_empty!30645 () Bool)

(assert (=> b!1206040 (= e!684890 tp_is_empty!30645)))

(declare-fun c!118386 () Bool)

(declare-fun lt!547059 () ListLongMap!17699)

(declare-fun call!58620 () ListLongMap!17699)

(declare-fun bm!58617 () Bool)

(declare-fun c!118385 () Bool)

(declare-fun +!3986 (ListLongMap!17699 tuple2!19730) ListLongMap!17699)

(assert (=> bm!58617 (= call!58620 (+!3986 lt!547059 (ite (or c!118385 c!118386) (tuple2!19731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206041 () Bool)

(declare-fun res!802117 () Bool)

(assert (=> b!1206041 (=> (not res!802117) (not e!684893))))

(assert (=> b!1206041 (= res!802117 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38212 _keys!1208))))))

(declare-fun b!1206042 () Bool)

(declare-fun e!684898 () Bool)

(declare-fun e!684894 () Bool)

(assert (=> b!1206042 (= e!684898 e!684894)))

(declare-fun res!802108 () Bool)

(assert (=> b!1206042 (=> res!802108 e!684894)))

(declare-fun contains!6923 (ListLongMap!17699 (_ BitVec 64)) Bool)

(assert (=> b!1206042 (= res!802108 (not (contains!6923 lt!547059 k0!934)))))

(assert (=> b!1206042 (= lt!547059 (getCurrentListMapNoExtraKeys!5300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206043 () Bool)

(assert (=> b!1206043 (= e!684888 (not e!684901))))

(declare-fun res!802105 () Bool)

(assert (=> b!1206043 (=> res!802105 e!684901)))

(assert (=> b!1206043 (= res!802105 (bvsgt from!1455 i!673))))

(assert (=> b!1206043 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39982 0))(
  ( (Unit!39983) )
))
(declare-fun lt!547062 () Unit!39982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78071 (_ BitVec 64) (_ BitVec 32)) Unit!39982)

(assert (=> b!1206043 (= lt!547062 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!58618 () Bool)

(declare-fun call!58623 () Bool)

(declare-fun call!58627 () Bool)

(assert (=> bm!58618 (= call!58623 call!58627)))

(declare-fun b!1206045 () Bool)

(declare-fun e!684899 () Unit!39982)

(declare-fun e!684895 () Unit!39982)

(assert (=> b!1206045 (= e!684899 e!684895)))

(declare-fun lt!547057 () Bool)

(assert (=> b!1206045 (= c!118386 (and (not lt!547057) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!47823 () Bool)

(declare-fun mapRes!47823 () Bool)

(declare-fun tp!90826 () Bool)

(assert (=> mapNonEmpty!47823 (= mapRes!47823 (and tp!90826 e!684890))))

(declare-fun mapKey!47823 () (_ BitVec 32))

(declare-fun mapValue!47823 () ValueCell!14613)

(declare-fun mapRest!47823 () (Array (_ BitVec 32) ValueCell!14613))

(assert (=> mapNonEmpty!47823 (= (arr!37677 _values!996) (store mapRest!47823 mapKey!47823 mapValue!47823))))

(declare-fun b!1206046 () Bool)

(declare-fun e!684902 () Bool)

(assert (=> b!1206046 (= e!684902 tp_is_empty!30645)))

(declare-fun call!58624 () Unit!39982)

(declare-fun lt!547069 () ListLongMap!17699)

(declare-fun bm!58619 () Bool)

(declare-fun addStillContains!1015 (ListLongMap!17699 (_ BitVec 64) V!45987 (_ BitVec 64)) Unit!39982)

(assert (=> bm!58619 (= call!58624 (addStillContains!1015 (ite c!118385 lt!547069 lt!547059) (ite c!118385 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118386 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118385 minValue!944 (ite c!118386 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!58620 () Bool)

(declare-fun call!58626 () ListLongMap!17699)

(assert (=> bm!58620 (= call!58626 (getCurrentListMapNoExtraKeys!5300 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58621 () Bool)

(declare-fun call!58625 () ListLongMap!17699)

(assert (=> bm!58621 (= call!58625 call!58620)))

(declare-fun b!1206047 () Bool)

(declare-fun e!684892 () Unit!39982)

(declare-fun Unit!39984 () Unit!39982)

(assert (=> b!1206047 (= e!684892 Unit!39984)))

(declare-fun b!1206048 () Bool)

(declare-fun res!802112 () Bool)

(assert (=> b!1206048 (=> (not res!802112) (not e!684893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206048 (= res!802112 (validMask!0 mask!1564))))

(declare-fun bm!58622 () Bool)

(declare-fun call!58622 () ListLongMap!17699)

(assert (=> bm!58622 (= call!58622 (getCurrentListMapNoExtraKeys!5300 lt!547061 lt!547066 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206049 () Bool)

(assert (=> b!1206049 (= e!684894 true)))

(assert (=> b!1206049 e!684896))

(declare-fun res!802113 () Bool)

(assert (=> b!1206049 (=> (not res!802113) (not e!684896))))

(declare-fun e!684889 () Bool)

(assert (=> b!1206049 (= res!802113 e!684889)))

(declare-fun c!118387 () Bool)

(assert (=> b!1206049 (= c!118387 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547063 () Unit!39982)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!571 (array!78071 array!78073 (_ BitVec 32) (_ BitVec 32) V!45987 V!45987 (_ BitVec 64) (_ BitVec 32) Int) Unit!39982)

(assert (=> b!1206049 (= lt!547063 (lemmaListMapContainsThenArrayContainsFrom!571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547067 () Unit!39982)

(assert (=> b!1206049 (= lt!547067 e!684899)))

(assert (=> b!1206049 (= c!118385 (and (not lt!547057) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206049 (= lt!547057 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206050 () Bool)

(declare-fun res!802103 () Bool)

(assert (=> b!1206050 (=> (not res!802103) (not e!684888))))

(declare-datatypes ((List!26535 0))(
  ( (Nil!26532) (Cons!26531 (h!27740 (_ BitVec 64)) (t!39456 List!26535)) )
))
(declare-fun arrayNoDuplicates!0 (array!78071 (_ BitVec 32) List!26535) Bool)

(assert (=> b!1206050 (= res!802103 (arrayNoDuplicates!0 lt!547061 #b00000000000000000000000000000000 Nil!26532))))

(declare-fun b!1206051 () Bool)

(declare-fun res!802109 () Bool)

(assert (=> b!1206051 (=> (not res!802109) (not e!684893))))

(assert (=> b!1206051 (= res!802109 (and (= (size!38213 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38212 _keys!1208) (size!38213 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206052 () Bool)

(declare-fun lt!547068 () Unit!39982)

(assert (=> b!1206052 (= e!684899 lt!547068)))

(declare-fun lt!547056 () Unit!39982)

(assert (=> b!1206052 (= lt!547056 (addStillContains!1015 lt!547059 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1206052 (= lt!547069 call!58620)))

(assert (=> b!1206052 call!58627))

(assert (=> b!1206052 (= lt!547068 call!58624)))

(assert (=> b!1206052 (contains!6923 (+!3986 lt!547069 (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1206053 () Bool)

(declare-fun res!802114 () Bool)

(assert (=> b!1206053 (=> (not res!802114) (not e!684893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206053 (= res!802114 (validKeyInArray!0 k0!934))))

(declare-fun b!1206054 () Bool)

(declare-fun res!802116 () Bool)

(assert (=> b!1206054 (=> (not res!802116) (not e!684893))))

(assert (=> b!1206054 (= res!802116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206055 () Bool)

(assert (=> b!1206055 (= e!684889 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206056 () Bool)

(assert (=> b!1206056 call!58623))

(declare-fun lt!547055 () Unit!39982)

(declare-fun call!58621 () Unit!39982)

(assert (=> b!1206056 (= lt!547055 call!58621)))

(assert (=> b!1206056 (= e!684895 lt!547055)))

(declare-fun b!1206057 () Bool)

(declare-fun lt!547064 () Unit!39982)

(assert (=> b!1206057 (= e!684892 lt!547064)))

(assert (=> b!1206057 (= lt!547064 call!58621)))

(assert (=> b!1206057 call!58623))

(declare-fun b!1206058 () Bool)

(declare-fun res!802107 () Bool)

(assert (=> b!1206058 (=> (not res!802107) (not e!684893))))

(assert (=> b!1206058 (= res!802107 (= (select (arr!37676 _keys!1208) i!673) k0!934))))

(declare-fun b!1206059 () Bool)

(assert (=> b!1206059 (= e!684897 e!684898)))

(declare-fun res!802104 () Bool)

(assert (=> b!1206059 (=> res!802104 e!684898)))

(assert (=> b!1206059 (= res!802104 (not (= (select (arr!37676 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684887 () Bool)

(assert (=> b!1206059 e!684887))

(declare-fun c!118388 () Bool)

(assert (=> b!1206059 (= c!118388 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547058 () Unit!39982)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1031 (array!78071 array!78073 (_ BitVec 32) (_ BitVec 32) V!45987 V!45987 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39982)

(assert (=> b!1206059 (= lt!547058 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1031 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!802111 () Bool)

(assert (=> start!100770 (=> (not res!802111) (not e!684893))))

(assert (=> start!100770 (= res!802111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38212 _keys!1208))))))

(assert (=> start!100770 e!684893))

(assert (=> start!100770 tp_is_empty!30645))

(declare-fun array_inv!28702 (array!78071) Bool)

(assert (=> start!100770 (array_inv!28702 _keys!1208)))

(assert (=> start!100770 true))

(assert (=> start!100770 tp!90825))

(declare-fun e!684900 () Bool)

(declare-fun array_inv!28703 (array!78073) Bool)

(assert (=> start!100770 (and (array_inv!28703 _values!996) e!684900)))

(declare-fun b!1206044 () Bool)

(declare-fun c!118389 () Bool)

(assert (=> b!1206044 (= c!118389 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547057))))

(assert (=> b!1206044 (= e!684895 e!684892)))

(declare-fun b!1206060 () Bool)

(assert (=> b!1206060 (= e!684900 (and e!684902 mapRes!47823))))

(declare-fun condMapEmpty!47823 () Bool)

(declare-fun mapDefault!47823 () ValueCell!14613)

(assert (=> b!1206060 (= condMapEmpty!47823 (= (arr!37677 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14613)) mapDefault!47823)))))

(declare-fun b!1206061 () Bool)

(assert (=> b!1206061 (= e!684889 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547057) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206062 () Bool)

(declare-fun res!802106 () Bool)

(assert (=> b!1206062 (=> (not res!802106) (not e!684893))))

(assert (=> b!1206062 (= res!802106 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26532))))

(declare-fun bm!58623 () Bool)

(assert (=> bm!58623 (= call!58621 call!58624)))

(declare-fun b!1206063 () Bool)

(assert (=> b!1206063 (= e!684887 (= call!58622 call!58626))))

(declare-fun mapIsEmpty!47823 () Bool)

(assert (=> mapIsEmpty!47823 mapRes!47823))

(declare-fun b!1206064 () Bool)

(declare-fun -!1824 (ListLongMap!17699 (_ BitVec 64)) ListLongMap!17699)

(assert (=> b!1206064 (= e!684887 (= call!58622 (-!1824 call!58626 k0!934)))))

(declare-fun bm!58624 () Bool)

(assert (=> bm!58624 (= call!58627 (contains!6923 (ite c!118385 lt!547069 call!58625) k0!934))))

(assert (= (and start!100770 res!802111) b!1206048))

(assert (= (and b!1206048 res!802112) b!1206051))

(assert (= (and b!1206051 res!802109) b!1206054))

(assert (= (and b!1206054 res!802116) b!1206062))

(assert (= (and b!1206062 res!802106) b!1206041))

(assert (= (and b!1206041 res!802117) b!1206053))

(assert (= (and b!1206053 res!802114) b!1206058))

(assert (= (and b!1206058 res!802107) b!1206039))

(assert (= (and b!1206039 res!802110) b!1206050))

(assert (= (and b!1206050 res!802103) b!1206043))

(assert (= (and b!1206043 (not res!802105)) b!1206038))

(assert (= (and b!1206038 (not res!802115)) b!1206059))

(assert (= (and b!1206059 c!118388) b!1206064))

(assert (= (and b!1206059 (not c!118388)) b!1206063))

(assert (= (or b!1206064 b!1206063) bm!58622))

(assert (= (or b!1206064 b!1206063) bm!58620))

(assert (= (and b!1206059 (not res!802104)) b!1206042))

(assert (= (and b!1206042 (not res!802108)) b!1206049))

(assert (= (and b!1206049 c!118385) b!1206052))

(assert (= (and b!1206049 (not c!118385)) b!1206045))

(assert (= (and b!1206045 c!118386) b!1206056))

(assert (= (and b!1206045 (not c!118386)) b!1206044))

(assert (= (and b!1206044 c!118389) b!1206057))

(assert (= (and b!1206044 (not c!118389)) b!1206047))

(assert (= (or b!1206056 b!1206057) bm!58623))

(assert (= (or b!1206056 b!1206057) bm!58621))

(assert (= (or b!1206056 b!1206057) bm!58618))

(assert (= (or b!1206052 bm!58618) bm!58624))

(assert (= (or b!1206052 bm!58623) bm!58619))

(assert (= (or b!1206052 bm!58621) bm!58617))

(assert (= (and b!1206049 c!118387) b!1206055))

(assert (= (and b!1206049 (not c!118387)) b!1206061))

(assert (= (and b!1206049 res!802113) b!1206037))

(assert (= (and b!1206060 condMapEmpty!47823) mapIsEmpty!47823))

(assert (= (and b!1206060 (not condMapEmpty!47823)) mapNonEmpty!47823))

(get-info :version)

(assert (= (and mapNonEmpty!47823 ((_ is ValueCellFull!14613) mapValue!47823)) b!1206040))

(assert (= (and b!1206060 ((_ is ValueCellFull!14613) mapDefault!47823)) b!1206046))

(assert (= start!100770 b!1206060))

(declare-fun b_lambda!21337 () Bool)

(assert (=> (not b_lambda!21337) (not b!1206038)))

(declare-fun t!39454 () Bool)

(declare-fun tb!10741 () Bool)

(assert (=> (and start!100770 (= defaultEntry!1004 defaultEntry!1004) t!39454) tb!10741))

(declare-fun result!22067 () Bool)

(assert (=> tb!10741 (= result!22067 tp_is_empty!30645)))

(assert (=> b!1206038 t!39454))

(declare-fun b_and!42867 () Bool)

(assert (= b_and!42865 (and (=> t!39454 result!22067) b_and!42867)))

(declare-fun m!1111777 () Bool)

(assert (=> b!1206059 m!1111777))

(declare-fun m!1111779 () Bool)

(assert (=> b!1206059 m!1111779))

(declare-fun m!1111781 () Bool)

(assert (=> b!1206064 m!1111781))

(declare-fun m!1111783 () Bool)

(assert (=> b!1206038 m!1111783))

(declare-fun m!1111785 () Bool)

(assert (=> b!1206038 m!1111785))

(declare-fun m!1111787 () Bool)

(assert (=> b!1206038 m!1111787))

(declare-fun m!1111789 () Bool)

(assert (=> b!1206038 m!1111789))

(declare-fun m!1111791 () Bool)

(assert (=> b!1206054 m!1111791))

(declare-fun m!1111793 () Bool)

(assert (=> bm!58622 m!1111793))

(declare-fun m!1111795 () Bool)

(assert (=> bm!58620 m!1111795))

(declare-fun m!1111797 () Bool)

(assert (=> bm!58624 m!1111797))

(declare-fun m!1111799 () Bool)

(assert (=> b!1206042 m!1111799))

(assert (=> b!1206042 m!1111795))

(declare-fun m!1111801 () Bool)

(assert (=> bm!58617 m!1111801))

(declare-fun m!1111803 () Bool)

(assert (=> start!100770 m!1111803))

(declare-fun m!1111805 () Bool)

(assert (=> start!100770 m!1111805))

(declare-fun m!1111807 () Bool)

(assert (=> b!1206050 m!1111807))

(declare-fun m!1111809 () Bool)

(assert (=> b!1206058 m!1111809))

(declare-fun m!1111811 () Bool)

(assert (=> mapNonEmpty!47823 m!1111811))

(declare-fun m!1111813 () Bool)

(assert (=> b!1206048 m!1111813))

(declare-fun m!1111815 () Bool)

(assert (=> bm!58619 m!1111815))

(declare-fun m!1111817 () Bool)

(assert (=> b!1206055 m!1111817))

(declare-fun m!1111819 () Bool)

(assert (=> b!1206039 m!1111819))

(declare-fun m!1111821 () Bool)

(assert (=> b!1206039 m!1111821))

(declare-fun m!1111823 () Bool)

(assert (=> b!1206062 m!1111823))

(declare-fun m!1111825 () Bool)

(assert (=> b!1206043 m!1111825))

(declare-fun m!1111827 () Bool)

(assert (=> b!1206043 m!1111827))

(declare-fun m!1111829 () Bool)

(assert (=> b!1206053 m!1111829))

(declare-fun m!1111831 () Bool)

(assert (=> b!1206052 m!1111831))

(declare-fun m!1111833 () Bool)

(assert (=> b!1206052 m!1111833))

(assert (=> b!1206052 m!1111833))

(declare-fun m!1111835 () Bool)

(assert (=> b!1206052 m!1111835))

(declare-fun m!1111837 () Bool)

(assert (=> b!1206049 m!1111837))

(assert (=> b!1206037 m!1111817))

(check-sat (not b_lambda!21337) (not b_next!25941) (not b!1206042) (not bm!58622) tp_is_empty!30645 (not bm!58617) (not b!1206059) (not b!1206038) b_and!42867 (not b!1206043) (not b!1206037) (not b!1206050) (not b!1206053) (not b!1206039) (not b!1206062) (not bm!58619) (not b!1206055) (not bm!58620) (not mapNonEmpty!47823) (not b!1206052) (not start!100770) (not b!1206054) (not b!1206064) (not bm!58624) (not b!1206048) (not b!1206049))
(check-sat b_and!42867 (not b_next!25941))
