; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99450 () Bool)

(assert start!99450)

(declare-fun b_free!25029 () Bool)

(declare-fun b_next!25029 () Bool)

(assert (=> start!99450 (= b_free!25029 (not b_next!25029))))

(declare-fun tp!87800 () Bool)

(declare-fun b_and!40925 () Bool)

(assert (=> start!99450 (= tp!87800 b_and!40925)))

(declare-fun mapIsEmpty!46166 () Bool)

(declare-fun mapRes!46166 () Bool)

(assert (=> mapIsEmpty!46166 mapRes!46166))

(declare-fun b!1174843 () Bool)

(declare-fun res!780212 () Bool)

(declare-fun e!667808 () Bool)

(assert (=> b!1174843 (=> (not res!780212) (not e!667808))))

(declare-datatypes ((array!75929 0))(
  ( (array!75930 (arr!36614 (Array (_ BitVec 32) (_ BitVec 64))) (size!37150 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44539 0))(
  ( (V!44540 (val!14836 Int)) )
))
(declare-datatypes ((ValueCell!14070 0))(
  ( (ValueCellFull!14070 (v!17474 V!44539)) (EmptyCell!14070) )
))
(declare-datatypes ((array!75931 0))(
  ( (array!75932 (arr!36615 (Array (_ BitVec 32) ValueCell!14070)) (size!37151 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75931)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1174843 (= res!780212 (and (= (size!37151 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37150 _keys!1208) (size!37151 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174844 () Bool)

(declare-fun e!667810 () Bool)

(declare-fun e!667799 () Bool)

(assert (=> b!1174844 (= e!667810 e!667799)))

(declare-fun res!780216 () Bool)

(assert (=> b!1174844 (=> res!780216 e!667799)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174844 (= res!780216 (not (= (select (arr!36614 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174845 () Bool)

(declare-fun res!780219 () Bool)

(assert (=> b!1174845 (=> (not res!780219) (not e!667808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174845 (= res!780219 (validMask!0 mask!1564))))

(declare-fun b!1174846 () Bool)

(declare-fun e!667809 () Bool)

(declare-fun tp_is_empty!29559 () Bool)

(assert (=> b!1174846 (= e!667809 tp_is_empty!29559)))

(declare-fun b!1174847 () Bool)

(declare-fun res!780214 () Bool)

(assert (=> b!1174847 (=> (not res!780214) (not e!667808))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174847 (= res!780214 (= (select (arr!36614 _keys!1208) i!673) k0!934))))

(declare-fun b!1174849 () Bool)

(declare-fun e!667806 () Bool)

(declare-fun e!667807 () Bool)

(assert (=> b!1174849 (= e!667806 (and e!667807 mapRes!46166))))

(declare-fun condMapEmpty!46166 () Bool)

(declare-fun mapDefault!46166 () ValueCell!14070)

(assert (=> b!1174849 (= condMapEmpty!46166 (= (arr!36615 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14070)) mapDefault!46166)))))

(declare-fun b!1174850 () Bool)

(declare-datatypes ((Unit!38770 0))(
  ( (Unit!38771) )
))
(declare-fun e!667801 () Unit!38770)

(declare-fun Unit!38772 () Unit!38770)

(assert (=> b!1174850 (= e!667801 Unit!38772)))

(declare-fun lt!529883 () Unit!38770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38770)

(assert (=> b!1174850 (= lt!529883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174850 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529890 () Unit!38770)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75929 (_ BitVec 32) (_ BitVec 32)) Unit!38770)

(assert (=> b!1174850 (= lt!529890 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25707 0))(
  ( (Nil!25704) (Cons!25703 (h!26912 (_ BitVec 64)) (t!37728 List!25707)) )
))
(declare-fun arrayNoDuplicates!0 (array!75929 (_ BitVec 32) List!25707) Bool)

(assert (=> b!1174850 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25704)))

(declare-fun lt!529877 () Unit!38770)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75929 (_ BitVec 64) (_ BitVec 32) List!25707) Unit!38770)

(assert (=> b!1174850 (= lt!529877 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25704))))

(assert (=> b!1174850 false))

(declare-fun b!1174851 () Bool)

(declare-fun e!667800 () Bool)

(assert (=> b!1174851 (= e!667808 e!667800)))

(declare-fun res!780223 () Bool)

(assert (=> b!1174851 (=> (not res!780223) (not e!667800))))

(declare-fun lt!529879 () array!75929)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75929 (_ BitVec 32)) Bool)

(assert (=> b!1174851 (= res!780223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529879 mask!1564))))

(assert (=> b!1174851 (= lt!529879 (array!75930 (store (arr!36614 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37150 _keys!1208)))))

(declare-fun b!1174852 () Bool)

(declare-fun res!780215 () Bool)

(assert (=> b!1174852 (=> (not res!780215) (not e!667808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174852 (= res!780215 (validKeyInArray!0 k0!934))))

(declare-fun b!1174853 () Bool)

(assert (=> b!1174853 (= e!667799 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174854 () Bool)

(declare-fun e!667805 () Bool)

(assert (=> b!1174854 (= e!667805 true)))

(assert (=> b!1174854 (not (= (select (arr!36614 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529878 () Unit!38770)

(assert (=> b!1174854 (= lt!529878 e!667801)))

(declare-fun c!116667 () Bool)

(assert (=> b!1174854 (= c!116667 (= (select (arr!36614 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174854 e!667810))

(declare-fun res!780220 () Bool)

(assert (=> b!1174854 (=> (not res!780220) (not e!667810))))

(declare-fun lt!529887 () V!44539)

(declare-datatypes ((tuple2!18970 0))(
  ( (tuple2!18971 (_1!9496 (_ BitVec 64)) (_2!9496 V!44539)) )
))
(declare-datatypes ((List!25708 0))(
  ( (Nil!25705) (Cons!25704 (h!26913 tuple2!18970) (t!37729 List!25708)) )
))
(declare-datatypes ((ListLongMap!16939 0))(
  ( (ListLongMap!16940 (toList!8485 List!25708)) )
))
(declare-fun lt!529882 () ListLongMap!16939)

(declare-fun lt!529885 () ListLongMap!16939)

(declare-fun +!3802 (ListLongMap!16939 tuple2!18970) ListLongMap!16939)

(declare-fun get!18692 (ValueCell!14070 V!44539) V!44539)

(assert (=> b!1174854 (= res!780220 (= lt!529885 (+!3802 lt!529882 (tuple2!18971 (select (arr!36614 _keys!1208) from!1455) (get!18692 (select (arr!36615 _values!996) from!1455) lt!529887)))))))

(declare-fun b!1174855 () Bool)

(declare-fun res!780213 () Bool)

(assert (=> b!1174855 (=> (not res!780213) (not e!667800))))

(assert (=> b!1174855 (= res!780213 (arrayNoDuplicates!0 lt!529879 #b00000000000000000000000000000000 Nil!25704))))

(declare-fun b!1174856 () Bool)

(declare-fun e!667803 () Bool)

(assert (=> b!1174856 (= e!667800 (not e!667803))))

(declare-fun res!780225 () Bool)

(assert (=> b!1174856 (=> res!780225 e!667803)))

(assert (=> b!1174856 (= res!780225 (bvsgt from!1455 i!673))))

(assert (=> b!1174856 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529888 () Unit!38770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75929 (_ BitVec 64) (_ BitVec 32)) Unit!38770)

(assert (=> b!1174856 (= lt!529888 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!780222 () Bool)

(assert (=> start!99450 (=> (not res!780222) (not e!667808))))

(assert (=> start!99450 (= res!780222 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37150 _keys!1208))))))

(assert (=> start!99450 e!667808))

(assert (=> start!99450 tp_is_empty!29559))

(declare-fun array_inv!27972 (array!75929) Bool)

(assert (=> start!99450 (array_inv!27972 _keys!1208)))

(assert (=> start!99450 true))

(assert (=> start!99450 tp!87800))

(declare-fun array_inv!27973 (array!75931) Bool)

(assert (=> start!99450 (and (array_inv!27973 _values!996) e!667806)))

(declare-fun b!1174848 () Bool)

(assert (=> b!1174848 (= e!667807 tp_is_empty!29559)))

(declare-fun b!1174857 () Bool)

(declare-fun e!667804 () Bool)

(assert (=> b!1174857 (= e!667803 e!667804)))

(declare-fun res!780221 () Bool)

(assert (=> b!1174857 (=> res!780221 e!667804)))

(assert (=> b!1174857 (= res!780221 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44539)

(declare-fun lt!529881 () array!75931)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44539)

(declare-fun getCurrentListMapNoExtraKeys!4945 (array!75929 array!75931 (_ BitVec 32) (_ BitVec 32) V!44539 V!44539 (_ BitVec 32) Int) ListLongMap!16939)

(assert (=> b!1174857 (= lt!529885 (getCurrentListMapNoExtraKeys!4945 lt!529879 lt!529881 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174857 (= lt!529881 (array!75932 (store (arr!36615 _values!996) i!673 (ValueCellFull!14070 lt!529887)) (size!37151 _values!996)))))

(declare-fun dynLambda!2913 (Int (_ BitVec 64)) V!44539)

(assert (=> b!1174857 (= lt!529887 (dynLambda!2913 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529889 () ListLongMap!16939)

(assert (=> b!1174857 (= lt!529889 (getCurrentListMapNoExtraKeys!4945 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174858 () Bool)

(declare-fun res!780217 () Bool)

(assert (=> b!1174858 (=> (not res!780217) (not e!667808))))

(assert (=> b!1174858 (= res!780217 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37150 _keys!1208))))))

(declare-fun b!1174859 () Bool)

(declare-fun res!780224 () Bool)

(assert (=> b!1174859 (=> (not res!780224) (not e!667808))))

(assert (=> b!1174859 (= res!780224 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25704))))

(declare-fun b!1174860 () Bool)

(declare-fun res!780218 () Bool)

(assert (=> b!1174860 (=> (not res!780218) (not e!667808))))

(assert (=> b!1174860 (= res!780218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46166 () Bool)

(declare-fun tp!87801 () Bool)

(assert (=> mapNonEmpty!46166 (= mapRes!46166 (and tp!87801 e!667809))))

(declare-fun mapValue!46166 () ValueCell!14070)

(declare-fun mapKey!46166 () (_ BitVec 32))

(declare-fun mapRest!46166 () (Array (_ BitVec 32) ValueCell!14070))

(assert (=> mapNonEmpty!46166 (= (arr!36615 _values!996) (store mapRest!46166 mapKey!46166 mapValue!46166))))

(declare-fun b!1174861 () Bool)

(declare-fun Unit!38773 () Unit!38770)

(assert (=> b!1174861 (= e!667801 Unit!38773)))

(declare-fun b!1174862 () Bool)

(assert (=> b!1174862 (= e!667804 e!667805)))

(declare-fun res!780226 () Bool)

(assert (=> b!1174862 (=> res!780226 e!667805)))

(assert (=> b!1174862 (= res!780226 (not (validKeyInArray!0 (select (arr!36614 _keys!1208) from!1455))))))

(declare-fun lt!529880 () ListLongMap!16939)

(assert (=> b!1174862 (= lt!529880 lt!529882)))

(declare-fun lt!529884 () ListLongMap!16939)

(declare-fun -!1542 (ListLongMap!16939 (_ BitVec 64)) ListLongMap!16939)

(assert (=> b!1174862 (= lt!529882 (-!1542 lt!529884 k0!934))))

(assert (=> b!1174862 (= lt!529880 (getCurrentListMapNoExtraKeys!4945 lt!529879 lt!529881 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174862 (= lt!529884 (getCurrentListMapNoExtraKeys!4945 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529886 () Unit!38770)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 (array!75929 array!75931 (_ BitVec 32) (_ BitVec 32) V!44539 V!44539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38770)

(assert (=> b!1174862 (= lt!529886 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99450 res!780222) b!1174845))

(assert (= (and b!1174845 res!780219) b!1174843))

(assert (= (and b!1174843 res!780212) b!1174860))

(assert (= (and b!1174860 res!780218) b!1174859))

(assert (= (and b!1174859 res!780224) b!1174858))

(assert (= (and b!1174858 res!780217) b!1174852))

(assert (= (and b!1174852 res!780215) b!1174847))

(assert (= (and b!1174847 res!780214) b!1174851))

(assert (= (and b!1174851 res!780223) b!1174855))

(assert (= (and b!1174855 res!780213) b!1174856))

(assert (= (and b!1174856 (not res!780225)) b!1174857))

(assert (= (and b!1174857 (not res!780221)) b!1174862))

(assert (= (and b!1174862 (not res!780226)) b!1174854))

(assert (= (and b!1174854 res!780220) b!1174844))

(assert (= (and b!1174844 (not res!780216)) b!1174853))

(assert (= (and b!1174854 c!116667) b!1174850))

(assert (= (and b!1174854 (not c!116667)) b!1174861))

(assert (= (and b!1174849 condMapEmpty!46166) mapIsEmpty!46166))

(assert (= (and b!1174849 (not condMapEmpty!46166)) mapNonEmpty!46166))

(get-info :version)

(assert (= (and mapNonEmpty!46166 ((_ is ValueCellFull!14070) mapValue!46166)) b!1174846))

(assert (= (and b!1174849 ((_ is ValueCellFull!14070) mapDefault!46166)) b!1174848))

(assert (= start!99450 b!1174849))

(declare-fun b_lambda!20173 () Bool)

(assert (=> (not b_lambda!20173) (not b!1174857)))

(declare-fun t!37727 () Bool)

(declare-fun tb!9841 () Bool)

(assert (=> (and start!99450 (= defaultEntry!1004 defaultEntry!1004) t!37727) tb!9841))

(declare-fun result!20249 () Bool)

(assert (=> tb!9841 (= result!20249 tp_is_empty!29559)))

(assert (=> b!1174857 t!37727))

(declare-fun b_and!40927 () Bool)

(assert (= b_and!40925 (and (=> t!37727 result!20249) b_and!40927)))

(declare-fun m!1082731 () Bool)

(assert (=> b!1174851 m!1082731))

(declare-fun m!1082733 () Bool)

(assert (=> b!1174851 m!1082733))

(declare-fun m!1082735 () Bool)

(assert (=> b!1174850 m!1082735))

(declare-fun m!1082737 () Bool)

(assert (=> b!1174850 m!1082737))

(declare-fun m!1082739 () Bool)

(assert (=> b!1174850 m!1082739))

(declare-fun m!1082741 () Bool)

(assert (=> b!1174850 m!1082741))

(declare-fun m!1082743 () Bool)

(assert (=> b!1174850 m!1082743))

(declare-fun m!1082745 () Bool)

(assert (=> b!1174847 m!1082745))

(declare-fun m!1082747 () Bool)

(assert (=> b!1174853 m!1082747))

(declare-fun m!1082749 () Bool)

(assert (=> b!1174852 m!1082749))

(declare-fun m!1082751 () Bool)

(assert (=> b!1174845 m!1082751))

(declare-fun m!1082753 () Bool)

(assert (=> b!1174855 m!1082753))

(declare-fun m!1082755 () Bool)

(assert (=> b!1174854 m!1082755))

(declare-fun m!1082757 () Bool)

(assert (=> b!1174854 m!1082757))

(assert (=> b!1174854 m!1082757))

(declare-fun m!1082759 () Bool)

(assert (=> b!1174854 m!1082759))

(declare-fun m!1082761 () Bool)

(assert (=> b!1174854 m!1082761))

(assert (=> b!1174844 m!1082755))

(declare-fun m!1082763 () Bool)

(assert (=> start!99450 m!1082763))

(declare-fun m!1082765 () Bool)

(assert (=> start!99450 m!1082765))

(declare-fun m!1082767 () Bool)

(assert (=> b!1174860 m!1082767))

(declare-fun m!1082769 () Bool)

(assert (=> b!1174856 m!1082769))

(declare-fun m!1082771 () Bool)

(assert (=> b!1174856 m!1082771))

(declare-fun m!1082773 () Bool)

(assert (=> b!1174857 m!1082773))

(declare-fun m!1082775 () Bool)

(assert (=> b!1174857 m!1082775))

(declare-fun m!1082777 () Bool)

(assert (=> b!1174857 m!1082777))

(declare-fun m!1082779 () Bool)

(assert (=> b!1174857 m!1082779))

(declare-fun m!1082781 () Bool)

(assert (=> mapNonEmpty!46166 m!1082781))

(declare-fun m!1082783 () Bool)

(assert (=> b!1174862 m!1082783))

(declare-fun m!1082785 () Bool)

(assert (=> b!1174862 m!1082785))

(declare-fun m!1082787 () Bool)

(assert (=> b!1174862 m!1082787))

(declare-fun m!1082789 () Bool)

(assert (=> b!1174862 m!1082789))

(assert (=> b!1174862 m!1082755))

(declare-fun m!1082791 () Bool)

(assert (=> b!1174862 m!1082791))

(assert (=> b!1174862 m!1082755))

(declare-fun m!1082793 () Bool)

(assert (=> b!1174859 m!1082793))

(check-sat (not b!1174845) (not b!1174859) (not b!1174852) (not b!1174862) (not b!1174853) (not b!1174860) (not b!1174855) (not b!1174850) (not b_lambda!20173) (not b!1174854) (not mapNonEmpty!46166) tp_is_empty!29559 (not b!1174857) (not b!1174851) (not b_next!25029) (not start!99450) b_and!40927 (not b!1174856))
(check-sat b_and!40927 (not b_next!25029))
