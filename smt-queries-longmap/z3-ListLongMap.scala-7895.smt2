; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98350 () Bool)

(assert start!98350)

(declare-fun b_free!23815 () Bool)

(declare-fun b_next!23815 () Bool)

(assert (=> start!98350 (= b_free!23815 (not b_next!23815))))

(declare-fun tp!84149 () Bool)

(declare-fun b_and!38423 () Bool)

(assert (=> start!98350 (= tp!84149 b_and!38423)))

(declare-fun b!1128746 () Bool)

(declare-fun res!753937 () Bool)

(declare-fun e!642546 () Bool)

(assert (=> b!1128746 (=> (not res!753937) (not e!642546))))

(declare-datatypes ((array!73595 0))(
  ( (array!73596 (arr!35444 (Array (_ BitVec 32) (_ BitVec 64))) (size!35981 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73595)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73595 (_ BitVec 32)) Bool)

(assert (=> b!1128746 (= res!753937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128748 () Bool)

(declare-fun res!753927 () Bool)

(assert (=> b!1128748 (=> (not res!753927) (not e!642546))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128748 (= res!753927 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44335 () Bool)

(declare-fun mapRes!44335 () Bool)

(assert (=> mapIsEmpty!44335 mapRes!44335))

(declare-fun b!1128749 () Bool)

(declare-fun res!753933 () Bool)

(assert (=> b!1128749 (=> (not res!753933) (not e!642546))))

(declare-datatypes ((V!42921 0))(
  ( (V!42922 (val!14229 Int)) )
))
(declare-datatypes ((ValueCell!13463 0))(
  ( (ValueCellFull!13463 (v!16858 V!42921)) (EmptyCell!13463) )
))
(declare-datatypes ((array!73597 0))(
  ( (array!73598 (arr!35445 (Array (_ BitVec 32) ValueCell!13463)) (size!35982 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73597)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1128749 (= res!753933 (and (= (size!35982 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35981 _keys!1208) (size!35982 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128750 () Bool)

(declare-fun e!642547 () Bool)

(declare-fun e!642544 () Bool)

(assert (=> b!1128750 (= e!642547 (and e!642544 mapRes!44335))))

(declare-fun condMapEmpty!44335 () Bool)

(declare-fun mapDefault!44335 () ValueCell!13463)

(assert (=> b!1128750 (= condMapEmpty!44335 (= (arr!35445 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13463)) mapDefault!44335)))))

(declare-datatypes ((tuple2!17914 0))(
  ( (tuple2!17915 (_1!8968 (_ BitVec 64)) (_2!8968 V!42921)) )
))
(declare-datatypes ((List!24697 0))(
  ( (Nil!24694) (Cons!24693 (h!25911 tuple2!17914) (t!35496 List!24697)) )
))
(declare-datatypes ((ListLongMap!15891 0))(
  ( (ListLongMap!15892 (toList!7961 List!24697)) )
))
(declare-fun call!47794 () ListLongMap!15891)

(declare-fun e!642545 () Bool)

(declare-fun call!47795 () ListLongMap!15891)

(declare-fun b!1128751 () Bool)

(declare-fun -!1135 (ListLongMap!15891 (_ BitVec 64)) ListLongMap!15891)

(assert (=> b!1128751 (= e!642545 (= call!47795 (-!1135 call!47794 k0!934)))))

(declare-fun b!1128752 () Bool)

(assert (=> b!1128752 (= e!642545 (= call!47795 call!47794))))

(declare-fun b!1128753 () Bool)

(declare-fun e!642551 () Bool)

(declare-fun e!642550 () Bool)

(assert (=> b!1128753 (= e!642551 (not e!642550))))

(declare-fun res!753932 () Bool)

(assert (=> b!1128753 (=> res!753932 e!642550)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128753 (= res!753932 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128753 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36929 0))(
  ( (Unit!36930) )
))
(declare-fun lt!501096 () Unit!36929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73595 (_ BitVec 64) (_ BitVec 32)) Unit!36929)

(assert (=> b!1128753 (= lt!501096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128754 () Bool)

(declare-fun res!753934 () Bool)

(assert (=> b!1128754 (=> (not res!753934) (not e!642551))))

(declare-fun lt!501100 () array!73595)

(declare-datatypes ((List!24698 0))(
  ( (Nil!24695) (Cons!24694 (h!25912 (_ BitVec 64)) (t!35497 List!24698)) )
))
(declare-fun arrayNoDuplicates!0 (array!73595 (_ BitVec 32) List!24698) Bool)

(assert (=> b!1128754 (= res!753934 (arrayNoDuplicates!0 lt!501100 #b00000000000000000000000000000000 Nil!24695))))

(declare-fun b!1128755 () Bool)

(declare-fun e!642543 () Bool)

(declare-fun tp_is_empty!28345 () Bool)

(assert (=> b!1128755 (= e!642543 tp_is_empty!28345)))

(declare-fun lt!501097 () array!73597)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42921)

(declare-fun bm!47791 () Bool)

(declare-fun zeroValue!944 () V!42921)

(declare-fun getCurrentListMapNoExtraKeys!4481 (array!73595 array!73597 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) Int) ListLongMap!15891)

(assert (=> bm!47791 (= call!47795 (getCurrentListMapNoExtraKeys!4481 lt!501100 lt!501097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128756 () Bool)

(declare-fun res!753936 () Bool)

(assert (=> b!1128756 (=> (not res!753936) (not e!642546))))

(assert (=> b!1128756 (= res!753936 (= (select (arr!35444 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44335 () Bool)

(declare-fun tp!84148 () Bool)

(assert (=> mapNonEmpty!44335 (= mapRes!44335 (and tp!84148 e!642543))))

(declare-fun mapKey!44335 () (_ BitVec 32))

(declare-fun mapValue!44335 () ValueCell!13463)

(declare-fun mapRest!44335 () (Array (_ BitVec 32) ValueCell!13463))

(assert (=> mapNonEmpty!44335 (= (arr!35445 _values!996) (store mapRest!44335 mapKey!44335 mapValue!44335))))

(declare-fun b!1128757 () Bool)

(declare-fun e!642549 () Bool)

(assert (=> b!1128757 (= e!642550 e!642549)))

(declare-fun res!753926 () Bool)

(assert (=> b!1128757 (=> res!753926 e!642549)))

(assert (=> b!1128757 (= res!753926 (not (= from!1455 i!673)))))

(declare-fun lt!501098 () ListLongMap!15891)

(assert (=> b!1128757 (= lt!501098 (getCurrentListMapNoExtraKeys!4481 lt!501100 lt!501097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2550 (Int (_ BitVec 64)) V!42921)

(assert (=> b!1128757 (= lt!501097 (array!73598 (store (arr!35445 _values!996) i!673 (ValueCellFull!13463 (dynLambda!2550 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35982 _values!996)))))

(declare-fun lt!501095 () ListLongMap!15891)

(assert (=> b!1128757 (= lt!501095 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128758 () Bool)

(declare-fun res!753931 () Bool)

(assert (=> b!1128758 (=> (not res!753931) (not e!642546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128758 (= res!753931 (validMask!0 mask!1564))))

(declare-fun b!1128759 () Bool)

(declare-fun res!753929 () Bool)

(assert (=> b!1128759 (=> (not res!753929) (not e!642546))))

(assert (=> b!1128759 (= res!753929 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35981 _keys!1208))))))

(declare-fun b!1128760 () Bool)

(assert (=> b!1128760 (= e!642546 e!642551)))

(declare-fun res!753928 () Bool)

(assert (=> b!1128760 (=> (not res!753928) (not e!642551))))

(assert (=> b!1128760 (= res!753928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501100 mask!1564))))

(assert (=> b!1128760 (= lt!501100 (array!73596 (store (arr!35444 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35981 _keys!1208)))))

(declare-fun res!753935 () Bool)

(assert (=> start!98350 (=> (not res!753935) (not e!642546))))

(assert (=> start!98350 (= res!753935 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35981 _keys!1208))))))

(assert (=> start!98350 e!642546))

(assert (=> start!98350 tp_is_empty!28345))

(declare-fun array_inv!27252 (array!73595) Bool)

(assert (=> start!98350 (array_inv!27252 _keys!1208)))

(assert (=> start!98350 true))

(assert (=> start!98350 tp!84149))

(declare-fun array_inv!27253 (array!73597) Bool)

(assert (=> start!98350 (and (array_inv!27253 _values!996) e!642547)))

(declare-fun b!1128747 () Bool)

(declare-fun res!753925 () Bool)

(assert (=> b!1128747 (=> (not res!753925) (not e!642546))))

(assert (=> b!1128747 (= res!753925 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24695))))

(declare-fun bm!47792 () Bool)

(assert (=> bm!47792 (= call!47794 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128761 () Bool)

(assert (=> b!1128761 (= e!642544 tp_is_empty!28345)))

(declare-fun b!1128762 () Bool)

(declare-fun e!642552 () Bool)

(assert (=> b!1128762 (= e!642552 true)))

(declare-fun lt!501094 () Bool)

(declare-fun contains!6503 (ListLongMap!15891 (_ BitVec 64)) Bool)

(assert (=> b!1128762 (= lt!501094 (contains!6503 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128763 () Bool)

(assert (=> b!1128763 (= e!642549 e!642552)))

(declare-fun res!753930 () Bool)

(assert (=> b!1128763 (=> res!753930 e!642552)))

(assert (=> b!1128763 (= res!753930 (not (= (select (arr!35444 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128763 e!642545))

(declare-fun c!110123 () Bool)

(assert (=> b!1128763 (= c!110123 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501099 () Unit!36929)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!396 (array!73595 array!73597 (_ BitVec 32) (_ BitVec 32) V!42921 V!42921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36929)

(assert (=> b!1128763 (= lt!501099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98350 res!753935) b!1128758))

(assert (= (and b!1128758 res!753931) b!1128749))

(assert (= (and b!1128749 res!753933) b!1128746))

(assert (= (and b!1128746 res!753937) b!1128747))

(assert (= (and b!1128747 res!753925) b!1128759))

(assert (= (and b!1128759 res!753929) b!1128748))

(assert (= (and b!1128748 res!753927) b!1128756))

(assert (= (and b!1128756 res!753936) b!1128760))

(assert (= (and b!1128760 res!753928) b!1128754))

(assert (= (and b!1128754 res!753934) b!1128753))

(assert (= (and b!1128753 (not res!753932)) b!1128757))

(assert (= (and b!1128757 (not res!753926)) b!1128763))

(assert (= (and b!1128763 c!110123) b!1128751))

(assert (= (and b!1128763 (not c!110123)) b!1128752))

(assert (= (or b!1128751 b!1128752) bm!47791))

(assert (= (or b!1128751 b!1128752) bm!47792))

(assert (= (and b!1128763 (not res!753930)) b!1128762))

(assert (= (and b!1128750 condMapEmpty!44335) mapIsEmpty!44335))

(assert (= (and b!1128750 (not condMapEmpty!44335)) mapNonEmpty!44335))

(get-info :version)

(assert (= (and mapNonEmpty!44335 ((_ is ValueCellFull!13463) mapValue!44335)) b!1128755))

(assert (= (and b!1128750 ((_ is ValueCellFull!13463) mapDefault!44335)) b!1128761))

(assert (= start!98350 b!1128750))

(declare-fun b_lambda!18795 () Bool)

(assert (=> (not b_lambda!18795) (not b!1128757)))

(declare-fun t!35495 () Bool)

(declare-fun tb!8619 () Bool)

(assert (=> (and start!98350 (= defaultEntry!1004 defaultEntry!1004) t!35495) tb!8619))

(declare-fun result!17807 () Bool)

(assert (=> tb!8619 (= result!17807 tp_is_empty!28345)))

(assert (=> b!1128757 t!35495))

(declare-fun b_and!38425 () Bool)

(assert (= b_and!38423 (and (=> t!35495 result!17807) b_and!38425)))

(declare-fun m!1042875 () Bool)

(assert (=> b!1128756 m!1042875))

(declare-fun m!1042877 () Bool)

(assert (=> b!1128757 m!1042877))

(declare-fun m!1042879 () Bool)

(assert (=> b!1128757 m!1042879))

(declare-fun m!1042881 () Bool)

(assert (=> b!1128757 m!1042881))

(declare-fun m!1042883 () Bool)

(assert (=> b!1128757 m!1042883))

(declare-fun m!1042885 () Bool)

(assert (=> start!98350 m!1042885))

(declare-fun m!1042887 () Bool)

(assert (=> start!98350 m!1042887))

(declare-fun m!1042889 () Bool)

(assert (=> b!1128758 m!1042889))

(declare-fun m!1042891 () Bool)

(assert (=> b!1128748 m!1042891))

(declare-fun m!1042893 () Bool)

(assert (=> b!1128753 m!1042893))

(declare-fun m!1042895 () Bool)

(assert (=> b!1128753 m!1042895))

(declare-fun m!1042897 () Bool)

(assert (=> b!1128746 m!1042897))

(declare-fun m!1042899 () Bool)

(assert (=> mapNonEmpty!44335 m!1042899))

(declare-fun m!1042901 () Bool)

(assert (=> b!1128754 m!1042901))

(declare-fun m!1042903 () Bool)

(assert (=> b!1128762 m!1042903))

(assert (=> b!1128762 m!1042903))

(declare-fun m!1042905 () Bool)

(assert (=> b!1128762 m!1042905))

(declare-fun m!1042907 () Bool)

(assert (=> b!1128747 m!1042907))

(declare-fun m!1042909 () Bool)

(assert (=> b!1128763 m!1042909))

(declare-fun m!1042911 () Bool)

(assert (=> b!1128763 m!1042911))

(declare-fun m!1042913 () Bool)

(assert (=> b!1128760 m!1042913))

(declare-fun m!1042915 () Bool)

(assert (=> b!1128760 m!1042915))

(declare-fun m!1042917 () Bool)

(assert (=> b!1128751 m!1042917))

(assert (=> bm!47792 m!1042903))

(declare-fun m!1042919 () Bool)

(assert (=> bm!47791 m!1042919))

(check-sat (not b!1128747) (not b!1128760) (not bm!47791) (not b!1128748) tp_is_empty!28345 (not b!1128763) (not mapNonEmpty!44335) (not b!1128753) (not bm!47792) (not b_next!23815) (not b!1128757) b_and!38425 (not b!1128762) (not b_lambda!18795) (not b!1128754) (not b!1128746) (not b!1128758) (not b!1128751) (not start!98350))
(check-sat b_and!38425 (not b_next!23815))
