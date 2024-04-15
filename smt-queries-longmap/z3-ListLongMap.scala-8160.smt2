; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99820 () Bool)

(assert start!99820)

(declare-fun b_free!25405 () Bool)

(declare-fun b_next!25405 () Bool)

(assert (=> start!99820 (= b_free!25405 (not b_next!25405))))

(declare-fun tp!88929 () Bool)

(declare-fun b_and!41655 () Bool)

(assert (=> start!99820 (= tp!88929 b_and!41655)))

(declare-fun b!1186717 () Bool)

(declare-fun res!788956 () Bool)

(declare-fun e!674750 () Bool)

(assert (=> b!1186717 (=> (not res!788956) (not e!674750))))

(declare-datatypes ((array!76604 0))(
  ( (array!76605 (arr!36952 (Array (_ BitVec 32) (_ BitVec 64))) (size!37490 (_ BitVec 32))) )
))
(declare-fun lt!539111 () array!76604)

(declare-datatypes ((List!26109 0))(
  ( (Nil!26106) (Cons!26105 (h!27314 (_ BitVec 64)) (t!38497 List!26109)) )
))
(declare-fun arrayNoDuplicates!0 (array!76604 (_ BitVec 32) List!26109) Bool)

(assert (=> b!1186717 (= res!788956 (arrayNoDuplicates!0 lt!539111 #b00000000000000000000000000000000 Nil!26106))))

(declare-fun b!1186718 () Bool)

(declare-fun res!788960 () Bool)

(declare-fun e!674748 () Bool)

(assert (=> b!1186718 (=> (not res!788960) (not e!674748))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76604)

(declare-datatypes ((V!45041 0))(
  ( (V!45042 (val!15024 Int)) )
))
(declare-datatypes ((ValueCell!14258 0))(
  ( (ValueCellFull!14258 (v!17661 V!45041)) (EmptyCell!14258) )
))
(declare-datatypes ((array!76606 0))(
  ( (array!76607 (arr!36953 (Array (_ BitVec 32) ValueCell!14258)) (size!37491 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76606)

(assert (=> b!1186718 (= res!788960 (and (= (size!37491 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37490 _keys!1208) (size!37491 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186719 () Bool)

(declare-fun res!788954 () Bool)

(assert (=> b!1186719 (=> (not res!788954) (not e!674748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76604 (_ BitVec 32)) Bool)

(assert (=> b!1186719 (= res!788954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186720 () Bool)

(declare-fun e!674745 () Bool)

(declare-fun e!674752 () Bool)

(assert (=> b!1186720 (= e!674745 e!674752)))

(declare-fun res!788953 () Bool)

(assert (=> b!1186720 (=> res!788953 e!674752)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186720 (= res!788953 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45041)

(declare-fun lt!539105 () array!76606)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19396 0))(
  ( (tuple2!19397 (_1!9709 (_ BitVec 64)) (_2!9709 V!45041)) )
))
(declare-datatypes ((List!26110 0))(
  ( (Nil!26107) (Cons!26106 (h!27315 tuple2!19396) (t!38498 List!26110)) )
))
(declare-datatypes ((ListLongMap!17365 0))(
  ( (ListLongMap!17366 (toList!8698 List!26110)) )
))
(declare-fun lt!539119 () ListLongMap!17365)

(declare-fun minValue!944 () V!45041)

(declare-fun getCurrentListMapNoExtraKeys!5149 (array!76604 array!76606 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) Int) ListLongMap!17365)

(assert (=> b!1186720 (= lt!539119 (getCurrentListMapNoExtraKeys!5149 lt!539111 lt!539105 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539120 () V!45041)

(assert (=> b!1186720 (= lt!539105 (array!76607 (store (arr!36953 _values!996) i!673 (ValueCellFull!14258 lt!539120)) (size!37491 _values!996)))))

(declare-fun dynLambda!3048 (Int (_ BitVec 64)) V!45041)

(assert (=> b!1186720 (= lt!539120 (dynLambda!3048 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539114 () ListLongMap!17365)

(assert (=> b!1186720 (= lt!539114 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186721 () Bool)

(declare-fun res!788950 () Bool)

(assert (=> b!1186721 (=> (not res!788950) (not e!674748))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186721 (= res!788950 (= (select (arr!36952 _keys!1208) i!673) k0!934))))

(declare-fun b!1186722 () Bool)

(declare-fun e!674743 () Bool)

(declare-fun tp_is_empty!29935 () Bool)

(assert (=> b!1186722 (= e!674743 tp_is_empty!29935)))

(declare-fun b!1186723 () Bool)

(declare-fun e!674746 () Bool)

(declare-fun e!674749 () Bool)

(assert (=> b!1186723 (= e!674746 e!674749)))

(declare-fun res!788948 () Bool)

(assert (=> b!1186723 (=> res!788948 e!674749)))

(assert (=> b!1186723 (= res!788948 (not (= (select (arr!36952 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186724 () Bool)

(declare-fun e!674742 () Bool)

(assert (=> b!1186724 (= e!674742 tp_is_empty!29935)))

(declare-fun b!1186725 () Bool)

(declare-datatypes ((Unit!39218 0))(
  ( (Unit!39219) )
))
(declare-fun e!674741 () Unit!39218)

(declare-fun Unit!39220 () Unit!39218)

(assert (=> b!1186725 (= e!674741 Unit!39220)))

(declare-fun res!788958 () Bool)

(assert (=> start!99820 (=> (not res!788958) (not e!674748))))

(assert (=> start!99820 (= res!788958 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37490 _keys!1208))))))

(assert (=> start!99820 e!674748))

(assert (=> start!99820 tp_is_empty!29935))

(declare-fun array_inv!28310 (array!76604) Bool)

(assert (=> start!99820 (array_inv!28310 _keys!1208)))

(assert (=> start!99820 true))

(assert (=> start!99820 tp!88929))

(declare-fun e!674751 () Bool)

(declare-fun array_inv!28311 (array!76606) Bool)

(assert (=> start!99820 (and (array_inv!28311 _values!996) e!674751)))

(declare-fun b!1186726 () Bool)

(declare-fun res!788962 () Bool)

(assert (=> b!1186726 (=> (not res!788962) (not e!674748))))

(assert (=> b!1186726 (= res!788962 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26106))))

(declare-fun b!1186727 () Bool)

(declare-fun arrayContainsKey!0 (array!76604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186727 (= e!674749 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186728 () Bool)

(assert (=> b!1186728 (= e!674748 e!674750)))

(declare-fun res!788952 () Bool)

(assert (=> b!1186728 (=> (not res!788952) (not e!674750))))

(assert (=> b!1186728 (= res!788952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539111 mask!1564))))

(assert (=> b!1186728 (= lt!539111 (array!76605 (store (arr!36952 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37490 _keys!1208)))))

(declare-fun b!1186729 () Bool)

(declare-fun Unit!39221 () Unit!39218)

(assert (=> b!1186729 (= e!674741 Unit!39221)))

(declare-fun lt!539110 () Unit!39218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39218)

(assert (=> b!1186729 (= lt!539110 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186729 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539108 () Unit!39218)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76604 (_ BitVec 32) (_ BitVec 32)) Unit!39218)

(assert (=> b!1186729 (= lt!539108 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186729 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26106)))

(declare-fun lt!539113 () Unit!39218)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76604 (_ BitVec 64) (_ BitVec 32) List!26109) Unit!39218)

(assert (=> b!1186729 (= lt!539113 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26106))))

(assert (=> b!1186729 false))

(declare-fun b!1186730 () Bool)

(declare-fun e!674744 () Bool)

(assert (=> b!1186730 (= e!674744 true)))

(declare-fun lt!539104 () ListLongMap!17365)

(declare-fun lt!539115 () ListLongMap!17365)

(declare-fun -!1648 (ListLongMap!17365 (_ BitVec 64)) ListLongMap!17365)

(assert (=> b!1186730 (= (-!1648 lt!539104 k0!934) lt!539115)))

(declare-fun lt!539107 () ListLongMap!17365)

(declare-fun lt!539117 () V!45041)

(declare-fun lt!539118 () Unit!39218)

(declare-fun addRemoveCommutativeForDiffKeys!191 (ListLongMap!17365 (_ BitVec 64) V!45041 (_ BitVec 64)) Unit!39218)

(assert (=> b!1186730 (= lt!539118 (addRemoveCommutativeForDiffKeys!191 lt!539107 (select (arr!36952 _keys!1208) from!1455) lt!539117 k0!934))))

(declare-fun lt!539106 () ListLongMap!17365)

(declare-fun lt!539109 () ListLongMap!17365)

(assert (=> b!1186730 (and (= lt!539114 lt!539104) (= lt!539109 lt!539106))))

(declare-fun lt!539121 () tuple2!19396)

(declare-fun +!3977 (ListLongMap!17365 tuple2!19396) ListLongMap!17365)

(assert (=> b!1186730 (= lt!539104 (+!3977 lt!539107 lt!539121))))

(assert (=> b!1186730 (not (= (select (arr!36952 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539116 () Unit!39218)

(assert (=> b!1186730 (= lt!539116 e!674741)))

(declare-fun c!117205 () Bool)

(assert (=> b!1186730 (= c!117205 (= (select (arr!36952 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186730 e!674746))

(declare-fun res!788957 () Bool)

(assert (=> b!1186730 (=> (not res!788957) (not e!674746))))

(assert (=> b!1186730 (= res!788957 (= lt!539119 lt!539115))))

(assert (=> b!1186730 (= lt!539115 (+!3977 lt!539109 lt!539121))))

(assert (=> b!1186730 (= lt!539121 (tuple2!19397 (select (arr!36952 _keys!1208) from!1455) lt!539117))))

(declare-fun get!18934 (ValueCell!14258 V!45041) V!45041)

(assert (=> b!1186730 (= lt!539117 (get!18934 (select (arr!36953 _values!996) from!1455) lt!539120))))

(declare-fun b!1186731 () Bool)

(declare-fun mapRes!46730 () Bool)

(assert (=> b!1186731 (= e!674751 (and e!674742 mapRes!46730))))

(declare-fun condMapEmpty!46730 () Bool)

(declare-fun mapDefault!46730 () ValueCell!14258)

(assert (=> b!1186731 (= condMapEmpty!46730 (= (arr!36953 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14258)) mapDefault!46730)))))

(declare-fun b!1186732 () Bool)

(declare-fun res!788951 () Bool)

(assert (=> b!1186732 (=> (not res!788951) (not e!674748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186732 (= res!788951 (validMask!0 mask!1564))))

(declare-fun b!1186733 () Bool)

(declare-fun res!788955 () Bool)

(assert (=> b!1186733 (=> (not res!788955) (not e!674748))))

(assert (=> b!1186733 (= res!788955 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37490 _keys!1208))))))

(declare-fun mapNonEmpty!46730 () Bool)

(declare-fun tp!88928 () Bool)

(assert (=> mapNonEmpty!46730 (= mapRes!46730 (and tp!88928 e!674743))))

(declare-fun mapKey!46730 () (_ BitVec 32))

(declare-fun mapValue!46730 () ValueCell!14258)

(declare-fun mapRest!46730 () (Array (_ BitVec 32) ValueCell!14258))

(assert (=> mapNonEmpty!46730 (= (arr!36953 _values!996) (store mapRest!46730 mapKey!46730 mapValue!46730))))

(declare-fun mapIsEmpty!46730 () Bool)

(assert (=> mapIsEmpty!46730 mapRes!46730))

(declare-fun b!1186734 () Bool)

(assert (=> b!1186734 (= e!674752 e!674744)))

(declare-fun res!788949 () Bool)

(assert (=> b!1186734 (=> res!788949 e!674744)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186734 (= res!788949 (not (validKeyInArray!0 (select (arr!36952 _keys!1208) from!1455))))))

(assert (=> b!1186734 (= lt!539106 lt!539109)))

(assert (=> b!1186734 (= lt!539109 (-!1648 lt!539107 k0!934))))

(assert (=> b!1186734 (= lt!539106 (getCurrentListMapNoExtraKeys!5149 lt!539111 lt!539105 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186734 (= lt!539107 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539112 () Unit!39218)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 (array!76604 array!76606 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39218)

(assert (=> b!1186734 (= lt!539112 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!903 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186735 () Bool)

(assert (=> b!1186735 (= e!674750 (not e!674745))))

(declare-fun res!788961 () Bool)

(assert (=> b!1186735 (=> res!788961 e!674745)))

(assert (=> b!1186735 (= res!788961 (bvsgt from!1455 i!673))))

(assert (=> b!1186735 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539103 () Unit!39218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76604 (_ BitVec 64) (_ BitVec 32)) Unit!39218)

(assert (=> b!1186735 (= lt!539103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186736 () Bool)

(declare-fun res!788959 () Bool)

(assert (=> b!1186736 (=> (not res!788959) (not e!674748))))

(assert (=> b!1186736 (= res!788959 (validKeyInArray!0 k0!934))))

(assert (= (and start!99820 res!788958) b!1186732))

(assert (= (and b!1186732 res!788951) b!1186718))

(assert (= (and b!1186718 res!788960) b!1186719))

(assert (= (and b!1186719 res!788954) b!1186726))

(assert (= (and b!1186726 res!788962) b!1186733))

(assert (= (and b!1186733 res!788955) b!1186736))

(assert (= (and b!1186736 res!788959) b!1186721))

(assert (= (and b!1186721 res!788950) b!1186728))

(assert (= (and b!1186728 res!788952) b!1186717))

(assert (= (and b!1186717 res!788956) b!1186735))

(assert (= (and b!1186735 (not res!788961)) b!1186720))

(assert (= (and b!1186720 (not res!788953)) b!1186734))

(assert (= (and b!1186734 (not res!788949)) b!1186730))

(assert (= (and b!1186730 res!788957) b!1186723))

(assert (= (and b!1186723 (not res!788948)) b!1186727))

(assert (= (and b!1186730 c!117205) b!1186729))

(assert (= (and b!1186730 (not c!117205)) b!1186725))

(assert (= (and b!1186731 condMapEmpty!46730) mapIsEmpty!46730))

(assert (= (and b!1186731 (not condMapEmpty!46730)) mapNonEmpty!46730))

(get-info :version)

(assert (= (and mapNonEmpty!46730 ((_ is ValueCellFull!14258) mapValue!46730)) b!1186722))

(assert (= (and b!1186731 ((_ is ValueCellFull!14258) mapDefault!46730)) b!1186724))

(assert (= start!99820 b!1186731))

(declare-fun b_lambda!20531 () Bool)

(assert (=> (not b_lambda!20531) (not b!1186720)))

(declare-fun t!38496 () Bool)

(declare-fun tb!10209 () Bool)

(assert (=> (and start!99820 (= defaultEntry!1004 defaultEntry!1004) t!38496) tb!10209))

(declare-fun result!20993 () Bool)

(assert (=> tb!10209 (= result!20993 tp_is_empty!29935)))

(assert (=> b!1186720 t!38496))

(declare-fun b_and!41657 () Bool)

(assert (= b_and!41655 (and (=> t!38496 result!20993) b_and!41657)))

(declare-fun m!1094825 () Bool)

(assert (=> b!1186727 m!1094825))

(declare-fun m!1094827 () Bool)

(assert (=> b!1186720 m!1094827))

(declare-fun m!1094829 () Bool)

(assert (=> b!1186720 m!1094829))

(declare-fun m!1094831 () Bool)

(assert (=> b!1186720 m!1094831))

(declare-fun m!1094833 () Bool)

(assert (=> b!1186720 m!1094833))

(declare-fun m!1094835 () Bool)

(assert (=> b!1186735 m!1094835))

(declare-fun m!1094837 () Bool)

(assert (=> b!1186735 m!1094837))

(declare-fun m!1094839 () Bool)

(assert (=> b!1186732 m!1094839))

(declare-fun m!1094841 () Bool)

(assert (=> b!1186721 m!1094841))

(declare-fun m!1094843 () Bool)

(assert (=> b!1186719 m!1094843))

(declare-fun m!1094845 () Bool)

(assert (=> b!1186717 m!1094845))

(declare-fun m!1094847 () Bool)

(assert (=> b!1186730 m!1094847))

(assert (=> b!1186730 m!1094847))

(declare-fun m!1094849 () Bool)

(assert (=> b!1186730 m!1094849))

(declare-fun m!1094851 () Bool)

(assert (=> b!1186730 m!1094851))

(declare-fun m!1094853 () Bool)

(assert (=> b!1186730 m!1094853))

(declare-fun m!1094855 () Bool)

(assert (=> b!1186730 m!1094855))

(assert (=> b!1186730 m!1094855))

(declare-fun m!1094857 () Bool)

(assert (=> b!1186730 m!1094857))

(declare-fun m!1094859 () Bool)

(assert (=> b!1186730 m!1094859))

(declare-fun m!1094861 () Bool)

(assert (=> b!1186726 m!1094861))

(declare-fun m!1094863 () Bool)

(assert (=> b!1186728 m!1094863))

(declare-fun m!1094865 () Bool)

(assert (=> b!1186728 m!1094865))

(declare-fun m!1094867 () Bool)

(assert (=> b!1186734 m!1094867))

(declare-fun m!1094869 () Bool)

(assert (=> b!1186734 m!1094869))

(assert (=> b!1186734 m!1094855))

(declare-fun m!1094871 () Bool)

(assert (=> b!1186734 m!1094871))

(assert (=> b!1186734 m!1094855))

(declare-fun m!1094873 () Bool)

(assert (=> b!1186734 m!1094873))

(declare-fun m!1094875 () Bool)

(assert (=> b!1186734 m!1094875))

(declare-fun m!1094877 () Bool)

(assert (=> mapNonEmpty!46730 m!1094877))

(assert (=> b!1186723 m!1094855))

(declare-fun m!1094879 () Bool)

(assert (=> start!99820 m!1094879))

(declare-fun m!1094881 () Bool)

(assert (=> start!99820 m!1094881))

(declare-fun m!1094883 () Bool)

(assert (=> b!1186736 m!1094883))

(declare-fun m!1094885 () Bool)

(assert (=> b!1186729 m!1094885))

(declare-fun m!1094887 () Bool)

(assert (=> b!1186729 m!1094887))

(declare-fun m!1094889 () Bool)

(assert (=> b!1186729 m!1094889))

(declare-fun m!1094891 () Bool)

(assert (=> b!1186729 m!1094891))

(declare-fun m!1094893 () Bool)

(assert (=> b!1186729 m!1094893))

(check-sat (not b!1186735) (not b!1186720) (not b!1186732) (not b_lambda!20531) (not b!1186719) (not b_next!25405) (not b!1186734) (not b!1186729) (not b!1186728) (not b!1186727) (not start!99820) (not b!1186726) (not b!1186730) (not b!1186736) tp_is_empty!29935 (not mapNonEmpty!46730) b_and!41657 (not b!1186717))
(check-sat b_and!41657 (not b_next!25405))
