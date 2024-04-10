; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99606 () Bool)

(assert start!99606)

(declare-fun b_free!25185 () Bool)

(declare-fun b_next!25185 () Bool)

(assert (=> start!99606 (= b_free!25185 (not b_next!25185))))

(declare-fun tp!88268 () Bool)

(declare-fun b_and!41237 () Bool)

(assert (=> start!99606 (= tp!88268 b_and!41237)))

(declare-fun b!1179869 () Bool)

(declare-fun res!783914 () Bool)

(declare-fun e!670785 () Bool)

(assert (=> b!1179869 (=> (not res!783914) (not e!670785))))

(declare-datatypes ((array!76233 0))(
  ( (array!76234 (arr!36766 (Array (_ BitVec 32) (_ BitVec 64))) (size!37302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76233)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44747 0))(
  ( (V!44748 (val!14914 Int)) )
))
(declare-datatypes ((ValueCell!14148 0))(
  ( (ValueCellFull!14148 (v!17552 V!44747)) (EmptyCell!14148) )
))
(declare-datatypes ((array!76235 0))(
  ( (array!76236 (arr!36767 (Array (_ BitVec 32) ValueCell!14148)) (size!37303 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76235)

(assert (=> b!1179869 (= res!783914 (and (= (size!37303 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37302 _keys!1208) (size!37303 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179870 () Bool)

(declare-fun e!670788 () Bool)

(declare-fun tp_is_empty!29715 () Bool)

(assert (=> b!1179870 (= e!670788 tp_is_empty!29715)))

(declare-fun mapIsEmpty!46400 () Bool)

(declare-fun mapRes!46400 () Bool)

(assert (=> mapIsEmpty!46400 mapRes!46400))

(declare-fun b!1179871 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!670795 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179871 (= e!670795 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179872 () Bool)

(declare-fun res!783913 () Bool)

(assert (=> b!1179872 (=> (not res!783913) (not e!670785))))

(assert (=> b!1179872 (= res!783913 (= (select (arr!36766 _keys!1208) i!673) k0!934))))

(declare-fun b!1179873 () Bool)

(declare-fun res!783918 () Bool)

(declare-fun e!670790 () Bool)

(assert (=> b!1179873 (=> (not res!783918) (not e!670790))))

(declare-datatypes ((tuple2!19094 0))(
  ( (tuple2!19095 (_1!9558 (_ BitVec 64)) (_2!9558 V!44747)) )
))
(declare-fun lt!533340 () tuple2!19094)

(declare-datatypes ((List!25832 0))(
  ( (Nil!25829) (Cons!25828 (h!27037 tuple2!19094) (t!38009 List!25832)) )
))
(declare-datatypes ((ListLongMap!17063 0))(
  ( (ListLongMap!17064 (toList!8547 List!25832)) )
))
(declare-fun lt!533330 () ListLongMap!17063)

(declare-fun lt!533335 () ListLongMap!17063)

(declare-fun +!3858 (ListLongMap!17063 tuple2!19094) ListLongMap!17063)

(assert (=> b!1179873 (= res!783918 (= lt!533335 (+!3858 lt!533330 lt!533340)))))

(declare-fun b!1179874 () Bool)

(declare-fun res!783915 () Bool)

(assert (=> b!1179874 (=> (not res!783915) (not e!670785))))

(assert (=> b!1179874 (= res!783915 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37302 _keys!1208))))))

(declare-fun b!1179875 () Bool)

(declare-fun e!670786 () Bool)

(declare-fun e!670787 () Bool)

(assert (=> b!1179875 (= e!670786 (not e!670787))))

(declare-fun res!783924 () Bool)

(assert (=> b!1179875 (=> res!783924 e!670787)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179875 (= res!783924 (bvsgt from!1455 i!673))))

(assert (=> b!1179875 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38993 0))(
  ( (Unit!38994) )
))
(declare-fun lt!533343 () Unit!38993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76233 (_ BitVec 64) (_ BitVec 32)) Unit!38993)

(assert (=> b!1179875 (= lt!533343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179876 () Bool)

(declare-fun e!670794 () Bool)

(declare-fun e!670784 () Bool)

(assert (=> b!1179876 (= e!670794 (and e!670784 mapRes!46400))))

(declare-fun condMapEmpty!46400 () Bool)

(declare-fun mapDefault!46400 () ValueCell!14148)

(assert (=> b!1179876 (= condMapEmpty!46400 (= (arr!36767 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14148)) mapDefault!46400)))))

(declare-fun b!1179877 () Bool)

(declare-fun e!670791 () Bool)

(declare-fun e!670792 () Bool)

(assert (=> b!1179877 (= e!670791 e!670792)))

(declare-fun res!783920 () Bool)

(assert (=> b!1179877 (=> res!783920 e!670792)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179877 (= res!783920 (not (validKeyInArray!0 (select (arr!36766 _keys!1208) from!1455))))))

(declare-fun lt!533336 () ListLongMap!17063)

(declare-fun lt!533329 () ListLongMap!17063)

(assert (=> b!1179877 (= lt!533336 lt!533329)))

(declare-fun -!1589 (ListLongMap!17063 (_ BitVec 64)) ListLongMap!17063)

(assert (=> b!1179877 (= lt!533329 (-!1589 lt!533330 k0!934))))

(declare-fun zeroValue!944 () V!44747)

(declare-fun lt!533332 () array!76233)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533341 () array!76235)

(declare-fun minValue!944 () V!44747)

(declare-fun getCurrentListMapNoExtraKeys!5001 (array!76233 array!76235 (_ BitVec 32) (_ BitVec 32) V!44747 V!44747 (_ BitVec 32) Int) ListLongMap!17063)

(assert (=> b!1179877 (= lt!533336 (getCurrentListMapNoExtraKeys!5001 lt!533332 lt!533341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179877 (= lt!533330 (getCurrentListMapNoExtraKeys!5001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533334 () Unit!38993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!816 (array!76233 array!76235 (_ BitVec 32) (_ BitVec 32) V!44747 V!44747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38993)

(assert (=> b!1179877 (= lt!533334 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179878 () Bool)

(declare-fun res!783917 () Bool)

(assert (=> b!1179878 (=> (not res!783917) (not e!670785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76233 (_ BitVec 32)) Bool)

(assert (=> b!1179878 (= res!783917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179879 () Bool)

(declare-fun e!670793 () Unit!38993)

(declare-fun Unit!38995 () Unit!38993)

(assert (=> b!1179879 (= e!670793 Unit!38995)))

(declare-fun res!783921 () Bool)

(assert (=> start!99606 (=> (not res!783921) (not e!670785))))

(assert (=> start!99606 (= res!783921 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37302 _keys!1208))))))

(assert (=> start!99606 e!670785))

(assert (=> start!99606 tp_is_empty!29715))

(declare-fun array_inv!28072 (array!76233) Bool)

(assert (=> start!99606 (array_inv!28072 _keys!1208)))

(assert (=> start!99606 true))

(assert (=> start!99606 tp!88268))

(declare-fun array_inv!28073 (array!76235) Bool)

(assert (=> start!99606 (and (array_inv!28073 _values!996) e!670794)))

(declare-fun b!1179880 () Bool)

(assert (=> b!1179880 (= e!670785 e!670786)))

(declare-fun res!783919 () Bool)

(assert (=> b!1179880 (=> (not res!783919) (not e!670786))))

(assert (=> b!1179880 (= res!783919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533332 mask!1564))))

(assert (=> b!1179880 (= lt!533332 (array!76234 (store (arr!36766 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37302 _keys!1208)))))

(declare-fun b!1179881 () Bool)

(declare-fun e!670783 () Bool)

(assert (=> b!1179881 (= e!670783 e!670795)))

(declare-fun res!783926 () Bool)

(assert (=> b!1179881 (=> res!783926 e!670795)))

(assert (=> b!1179881 (= res!783926 (not (= (select (arr!36766 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179882 () Bool)

(declare-fun res!783923 () Bool)

(assert (=> b!1179882 (=> (not res!783923) (not e!670785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179882 (= res!783923 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46400 () Bool)

(declare-fun tp!88269 () Bool)

(assert (=> mapNonEmpty!46400 (= mapRes!46400 (and tp!88269 e!670788))))

(declare-fun mapValue!46400 () ValueCell!14148)

(declare-fun mapKey!46400 () (_ BitVec 32))

(declare-fun mapRest!46400 () (Array (_ BitVec 32) ValueCell!14148))

(assert (=> mapNonEmpty!46400 (= (arr!36767 _values!996) (store mapRest!46400 mapKey!46400 mapValue!46400))))

(declare-fun b!1179883 () Bool)

(declare-fun res!783922 () Bool)

(assert (=> b!1179883 (=> (not res!783922) (not e!670786))))

(declare-datatypes ((List!25833 0))(
  ( (Nil!25830) (Cons!25829 (h!27038 (_ BitVec 64)) (t!38010 List!25833)) )
))
(declare-fun arrayNoDuplicates!0 (array!76233 (_ BitVec 32) List!25833) Bool)

(assert (=> b!1179883 (= res!783922 (arrayNoDuplicates!0 lt!533332 #b00000000000000000000000000000000 Nil!25830))))

(declare-fun b!1179884 () Bool)

(assert (=> b!1179884 (= e!670784 tp_is_empty!29715)))

(declare-fun b!1179885 () Bool)

(assert (=> b!1179885 (= e!670787 e!670791)))

(declare-fun res!783925 () Bool)

(assert (=> b!1179885 (=> res!783925 e!670791)))

(assert (=> b!1179885 (= res!783925 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!533331 () ListLongMap!17063)

(assert (=> b!1179885 (= lt!533331 (getCurrentListMapNoExtraKeys!5001 lt!533332 lt!533341 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533333 () V!44747)

(assert (=> b!1179885 (= lt!533341 (array!76236 (store (arr!36767 _values!996) i!673 (ValueCellFull!14148 lt!533333)) (size!37303 _values!996)))))

(declare-fun dynLambda!2961 (Int (_ BitVec 64)) V!44747)

(assert (=> b!1179885 (= lt!533333 (dynLambda!2961 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179885 (= lt!533335 (getCurrentListMapNoExtraKeys!5001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179886 () Bool)

(declare-fun Unit!38996 () Unit!38993)

(assert (=> b!1179886 (= e!670793 Unit!38996)))

(declare-fun lt!533339 () Unit!38993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38993)

(assert (=> b!1179886 (= lt!533339 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179886 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533337 () Unit!38993)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76233 (_ BitVec 32) (_ BitVec 32)) Unit!38993)

(assert (=> b!1179886 (= lt!533337 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179886 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25830)))

(declare-fun lt!533338 () Unit!38993)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76233 (_ BitVec 64) (_ BitVec 32) List!25833) Unit!38993)

(assert (=> b!1179886 (= lt!533338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25830))))

(assert (=> b!1179886 false))

(declare-fun b!1179887 () Bool)

(assert (=> b!1179887 (= e!670790 (= lt!533329 lt!533336))))

(declare-fun b!1179888 () Bool)

(assert (=> b!1179888 (= e!670792 true)))

(assert (=> b!1179888 e!670790))

(declare-fun res!783928 () Bool)

(assert (=> b!1179888 (=> (not res!783928) (not e!670790))))

(assert (=> b!1179888 (= res!783928 (not (= (select (arr!36766 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533342 () Unit!38993)

(assert (=> b!1179888 (= lt!533342 e!670793)))

(declare-fun c!116901 () Bool)

(assert (=> b!1179888 (= c!116901 (= (select (arr!36766 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179888 e!670783))

(declare-fun res!783916 () Bool)

(assert (=> b!1179888 (=> (not res!783916) (not e!670783))))

(assert (=> b!1179888 (= res!783916 (= lt!533331 (+!3858 lt!533329 lt!533340)))))

(declare-fun get!18798 (ValueCell!14148 V!44747) V!44747)

(assert (=> b!1179888 (= lt!533340 (tuple2!19095 (select (arr!36766 _keys!1208) from!1455) (get!18798 (select (arr!36767 _values!996) from!1455) lt!533333)))))

(declare-fun b!1179889 () Bool)

(declare-fun res!783912 () Bool)

(assert (=> b!1179889 (=> (not res!783912) (not e!670785))))

(assert (=> b!1179889 (= res!783912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25830))))

(declare-fun b!1179890 () Bool)

(declare-fun res!783927 () Bool)

(assert (=> b!1179890 (=> (not res!783927) (not e!670785))))

(assert (=> b!1179890 (= res!783927 (validKeyInArray!0 k0!934))))

(assert (= (and start!99606 res!783921) b!1179882))

(assert (= (and b!1179882 res!783923) b!1179869))

(assert (= (and b!1179869 res!783914) b!1179878))

(assert (= (and b!1179878 res!783917) b!1179889))

(assert (= (and b!1179889 res!783912) b!1179874))

(assert (= (and b!1179874 res!783915) b!1179890))

(assert (= (and b!1179890 res!783927) b!1179872))

(assert (= (and b!1179872 res!783913) b!1179880))

(assert (= (and b!1179880 res!783919) b!1179883))

(assert (= (and b!1179883 res!783922) b!1179875))

(assert (= (and b!1179875 (not res!783924)) b!1179885))

(assert (= (and b!1179885 (not res!783925)) b!1179877))

(assert (= (and b!1179877 (not res!783920)) b!1179888))

(assert (= (and b!1179888 res!783916) b!1179881))

(assert (= (and b!1179881 (not res!783926)) b!1179871))

(assert (= (and b!1179888 c!116901) b!1179886))

(assert (= (and b!1179888 (not c!116901)) b!1179879))

(assert (= (and b!1179888 res!783928) b!1179873))

(assert (= (and b!1179873 res!783918) b!1179887))

(assert (= (and b!1179876 condMapEmpty!46400) mapIsEmpty!46400))

(assert (= (and b!1179876 (not condMapEmpty!46400)) mapNonEmpty!46400))

(get-info :version)

(assert (= (and mapNonEmpty!46400 ((_ is ValueCellFull!14148) mapValue!46400)) b!1179870))

(assert (= (and b!1179876 ((_ is ValueCellFull!14148) mapDefault!46400)) b!1179884))

(assert (= start!99606 b!1179876))

(declare-fun b_lambda!20329 () Bool)

(assert (=> (not b_lambda!20329) (not b!1179885)))

(declare-fun t!38008 () Bool)

(declare-fun tb!9997 () Bool)

(assert (=> (and start!99606 (= defaultEntry!1004 defaultEntry!1004) t!38008) tb!9997))

(declare-fun result!20561 () Bool)

(assert (=> tb!9997 (= result!20561 tp_is_empty!29715)))

(assert (=> b!1179885 t!38008))

(declare-fun b_and!41239 () Bool)

(assert (= b_and!41237 (and (=> t!38008 result!20561) b_and!41239)))

(declare-fun m!1087839 () Bool)

(assert (=> b!1179882 m!1087839))

(declare-fun m!1087841 () Bool)

(assert (=> b!1179873 m!1087841))

(declare-fun m!1087843 () Bool)

(assert (=> b!1179875 m!1087843))

(declare-fun m!1087845 () Bool)

(assert (=> b!1179875 m!1087845))

(declare-fun m!1087847 () Bool)

(assert (=> b!1179872 m!1087847))

(declare-fun m!1087849 () Bool)

(assert (=> mapNonEmpty!46400 m!1087849))

(declare-fun m!1087851 () Bool)

(assert (=> b!1179883 m!1087851))

(declare-fun m!1087853 () Bool)

(assert (=> b!1179886 m!1087853))

(declare-fun m!1087855 () Bool)

(assert (=> b!1179886 m!1087855))

(declare-fun m!1087857 () Bool)

(assert (=> b!1179886 m!1087857))

(declare-fun m!1087859 () Bool)

(assert (=> b!1179886 m!1087859))

(declare-fun m!1087861 () Bool)

(assert (=> b!1179886 m!1087861))

(declare-fun m!1087863 () Bool)

(assert (=> b!1179881 m!1087863))

(assert (=> b!1179888 m!1087863))

(declare-fun m!1087865 () Bool)

(assert (=> b!1179888 m!1087865))

(declare-fun m!1087867 () Bool)

(assert (=> b!1179888 m!1087867))

(assert (=> b!1179888 m!1087867))

(declare-fun m!1087869 () Bool)

(assert (=> b!1179888 m!1087869))

(declare-fun m!1087871 () Bool)

(assert (=> b!1179889 m!1087871))

(declare-fun m!1087873 () Bool)

(assert (=> start!99606 m!1087873))

(declare-fun m!1087875 () Bool)

(assert (=> start!99606 m!1087875))

(declare-fun m!1087877 () Bool)

(assert (=> b!1179880 m!1087877))

(declare-fun m!1087879 () Bool)

(assert (=> b!1179880 m!1087879))

(declare-fun m!1087881 () Bool)

(assert (=> b!1179878 m!1087881))

(declare-fun m!1087883 () Bool)

(assert (=> b!1179871 m!1087883))

(declare-fun m!1087885 () Bool)

(assert (=> b!1179890 m!1087885))

(declare-fun m!1087887 () Bool)

(assert (=> b!1179877 m!1087887))

(declare-fun m!1087889 () Bool)

(assert (=> b!1179877 m!1087889))

(declare-fun m!1087891 () Bool)

(assert (=> b!1179877 m!1087891))

(assert (=> b!1179877 m!1087863))

(declare-fun m!1087893 () Bool)

(assert (=> b!1179877 m!1087893))

(assert (=> b!1179877 m!1087863))

(declare-fun m!1087895 () Bool)

(assert (=> b!1179877 m!1087895))

(declare-fun m!1087897 () Bool)

(assert (=> b!1179885 m!1087897))

(declare-fun m!1087899 () Bool)

(assert (=> b!1179885 m!1087899))

(declare-fun m!1087901 () Bool)

(assert (=> b!1179885 m!1087901))

(declare-fun m!1087903 () Bool)

(assert (=> b!1179885 m!1087903))

(check-sat (not b!1179888) (not b!1179882) (not b!1179877) (not b!1179889) (not b!1179871) (not b!1179875) b_and!41239 (not b_lambda!20329) (not b!1179885) (not start!99606) (not b_next!25185) (not b!1179890) tp_is_empty!29715 (not b!1179873) (not b!1179878) (not b!1179886) (not mapNonEmpty!46400) (not b!1179883) (not b!1179880))
(check-sat b_and!41239 (not b_next!25185))
