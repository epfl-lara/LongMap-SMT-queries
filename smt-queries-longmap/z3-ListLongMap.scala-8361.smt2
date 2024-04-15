; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101742 () Bool)

(assert start!101742)

(declare-fun b_free!26437 () Bool)

(declare-fun b_next!26437 () Bool)

(assert (=> start!101742 (= b_free!26437 (not b_next!26437))))

(declare-fun tp!92356 () Bool)

(declare-fun b_and!44117 () Bool)

(assert (=> start!101742 (= tp!92356 b_and!44117)))

(declare-fun b!1224900 () Bool)

(declare-fun e!695690 () Bool)

(declare-fun tp_is_empty!31141 () Bool)

(assert (=> b!1224900 (= e!695690 tp_is_empty!31141)))

(declare-fun b!1224901 () Bool)

(declare-fun res!813993 () Bool)

(declare-fun e!695688 () Bool)

(assert (=> b!1224901 (=> (not res!813993) (not e!695688))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224901 (= res!813993 (validMask!0 mask!1564))))

(declare-fun b!1224902 () Bool)

(declare-fun res!813987 () Bool)

(assert (=> b!1224902 (=> (not res!813987) (not e!695688))))

(declare-datatypes ((array!78986 0))(
  ( (array!78987 (arr!38120 (Array (_ BitVec 32) (_ BitVec 64))) (size!38658 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78986)

(declare-datatypes ((List!27004 0))(
  ( (Nil!27001) (Cons!27000 (h!28209 (_ BitVec 64)) (t!40412 List!27004)) )
))
(declare-fun arrayNoDuplicates!0 (array!78986 (_ BitVec 32) List!27004) Bool)

(assert (=> b!1224902 (= res!813987 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27001))))

(declare-fun b!1224903 () Bool)

(declare-fun res!813990 () Bool)

(assert (=> b!1224903 (=> (not res!813990) (not e!695688))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1224903 (= res!813990 (= (select (arr!38120 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48610 () Bool)

(declare-fun mapRes!48610 () Bool)

(declare-fun tp!92357 () Bool)

(assert (=> mapNonEmpty!48610 (= mapRes!48610 (and tp!92357 e!695690))))

(declare-fun mapKey!48610 () (_ BitVec 32))

(declare-datatypes ((V!46649 0))(
  ( (V!46650 (val!15627 Int)) )
))
(declare-datatypes ((ValueCell!14861 0))(
  ( (ValueCellFull!14861 (v!18288 V!46649)) (EmptyCell!14861) )
))
(declare-fun mapValue!48610 () ValueCell!14861)

(declare-fun mapRest!48610 () (Array (_ BitVec 32) ValueCell!14861))

(declare-datatypes ((array!78988 0))(
  ( (array!78989 (arr!38121 (Array (_ BitVec 32) ValueCell!14861)) (size!38659 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78988)

(assert (=> mapNonEmpty!48610 (= (arr!38121 _values!996) (store mapRest!48610 mapKey!48610 mapValue!48610))))

(declare-fun b!1224904 () Bool)

(declare-datatypes ((Unit!40442 0))(
  ( (Unit!40443) )
))
(declare-fun e!695693 () Unit!40442)

(declare-fun Unit!40444 () Unit!40442)

(assert (=> b!1224904 (= e!695693 Unit!40444)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!557828 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78986 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1224904 (= lt!557828 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224904 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557823 () Unit!40442)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78986 (_ BitVec 32) (_ BitVec 32)) Unit!40442)

(assert (=> b!1224904 (= lt!557823 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224904 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!27001)))

(declare-fun lt!557821 () Unit!40442)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78986 (_ BitVec 64) (_ BitVec 32) List!27004) Unit!40442)

(assert (=> b!1224904 (= lt!557821 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!27001))))

(assert (=> b!1224904 false))

(declare-fun b!1224905 () Bool)

(declare-fun res!813995 () Bool)

(assert (=> b!1224905 (=> (not res!813995) (not e!695688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78986 (_ BitVec 32)) Bool)

(assert (=> b!1224905 (= res!813995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!813983 () Bool)

(assert (=> start!101742 (=> (not res!813983) (not e!695688))))

(assert (=> start!101742 (= res!813983 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38658 _keys!1208))))))

(assert (=> start!101742 e!695688))

(assert (=> start!101742 tp_is_empty!31141))

(declare-fun array_inv!29118 (array!78986) Bool)

(assert (=> start!101742 (array_inv!29118 _keys!1208)))

(assert (=> start!101742 true))

(assert (=> start!101742 tp!92356))

(declare-fun e!695684 () Bool)

(declare-fun array_inv!29119 (array!78988) Bool)

(assert (=> start!101742 (and (array_inv!29119 _values!996) e!695684)))

(declare-fun b!1224906 () Bool)

(declare-fun e!695691 () Bool)

(assert (=> b!1224906 (= e!695691 true)))

(declare-datatypes ((tuple2!20224 0))(
  ( (tuple2!20225 (_1!10123 (_ BitVec 64)) (_2!10123 V!46649)) )
))
(declare-datatypes ((List!27005 0))(
  ( (Nil!27002) (Cons!27001 (h!28210 tuple2!20224) (t!40413 List!27005)) )
))
(declare-datatypes ((ListLongMap!18193 0))(
  ( (ListLongMap!18194 (toList!9112 List!27005)) )
))
(declare-fun lt!557835 () ListLongMap!18193)

(declare-fun lt!557839 () ListLongMap!18193)

(declare-fun -!1929 (ListLongMap!18193 (_ BitVec 64)) ListLongMap!18193)

(assert (=> b!1224906 (= (-!1929 lt!557835 k0!934) lt!557839)))

(declare-fun lt!557837 () ListLongMap!18193)

(declare-fun lt!557829 () V!46649)

(declare-fun lt!557831 () Unit!40442)

(declare-fun addRemoveCommutativeForDiffKeys!214 (ListLongMap!18193 (_ BitVec 64) V!46649 (_ BitVec 64)) Unit!40442)

(assert (=> b!1224906 (= lt!557831 (addRemoveCommutativeForDiffKeys!214 lt!557837 (select (arr!38120 _keys!1208) from!1455) lt!557829 k0!934))))

(declare-fun lt!557824 () ListLongMap!18193)

(declare-fun lt!557827 () ListLongMap!18193)

(declare-fun lt!557833 () ListLongMap!18193)

(assert (=> b!1224906 (and (= lt!557824 lt!557835) (= lt!557827 lt!557833))))

(declare-fun lt!557826 () tuple2!20224)

(declare-fun +!4172 (ListLongMap!18193 tuple2!20224) ListLongMap!18193)

(assert (=> b!1224906 (= lt!557835 (+!4172 lt!557837 lt!557826))))

(assert (=> b!1224906 (not (= (select (arr!38120 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557836 () Unit!40442)

(assert (=> b!1224906 (= lt!557836 e!695693)))

(declare-fun c!120455 () Bool)

(assert (=> b!1224906 (= c!120455 (= (select (arr!38120 _keys!1208) from!1455) k0!934))))

(declare-fun e!695685 () Bool)

(assert (=> b!1224906 e!695685))

(declare-fun res!813984 () Bool)

(assert (=> b!1224906 (=> (not res!813984) (not e!695685))))

(declare-fun lt!557822 () ListLongMap!18193)

(assert (=> b!1224906 (= res!813984 (= lt!557822 lt!557839))))

(assert (=> b!1224906 (= lt!557839 (+!4172 lt!557827 lt!557826))))

(assert (=> b!1224906 (= lt!557826 (tuple2!20225 (select (arr!38120 _keys!1208) from!1455) lt!557829))))

(declare-fun lt!557830 () V!46649)

(declare-fun get!19491 (ValueCell!14861 V!46649) V!46649)

(assert (=> b!1224906 (= lt!557829 (get!19491 (select (arr!38121 _values!996) from!1455) lt!557830))))

(declare-fun b!1224907 () Bool)

(declare-fun e!695689 () Bool)

(assert (=> b!1224907 (= e!695685 e!695689)))

(declare-fun res!813991 () Bool)

(assert (=> b!1224907 (=> res!813991 e!695689)))

(assert (=> b!1224907 (= res!813991 (not (= (select (arr!38120 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224908 () Bool)

(declare-fun res!813994 () Bool)

(assert (=> b!1224908 (=> (not res!813994) (not e!695688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224908 (= res!813994 (validKeyInArray!0 k0!934))))

(declare-fun b!1224909 () Bool)

(declare-fun e!695692 () Bool)

(declare-fun e!695687 () Bool)

(assert (=> b!1224909 (= e!695692 e!695687)))

(declare-fun res!813982 () Bool)

(assert (=> b!1224909 (=> res!813982 e!695687)))

(assert (=> b!1224909 (= res!813982 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46649)

(declare-fun lt!557838 () array!78986)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46649)

(declare-fun lt!557832 () array!78988)

(declare-fun getCurrentListMapNoExtraKeys!5542 (array!78986 array!78988 (_ BitVec 32) (_ BitVec 32) V!46649 V!46649 (_ BitVec 32) Int) ListLongMap!18193)

(assert (=> b!1224909 (= lt!557822 (getCurrentListMapNoExtraKeys!5542 lt!557838 lt!557832 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224909 (= lt!557832 (array!78989 (store (arr!38121 _values!996) i!673 (ValueCellFull!14861 lt!557830)) (size!38659 _values!996)))))

(declare-fun dynLambda!3387 (Int (_ BitVec 64)) V!46649)

(assert (=> b!1224909 (= lt!557830 (dynLambda!3387 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224909 (= lt!557824 (getCurrentListMapNoExtraKeys!5542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224910 () Bool)

(declare-fun e!695694 () Bool)

(assert (=> b!1224910 (= e!695694 (not e!695692))))

(declare-fun res!813985 () Bool)

(assert (=> b!1224910 (=> res!813985 e!695692)))

(assert (=> b!1224910 (= res!813985 (bvsgt from!1455 i!673))))

(assert (=> b!1224910 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557825 () Unit!40442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78986 (_ BitVec 64) (_ BitVec 32)) Unit!40442)

(assert (=> b!1224910 (= lt!557825 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224911 () Bool)

(declare-fun e!695695 () Bool)

(assert (=> b!1224911 (= e!695684 (and e!695695 mapRes!48610))))

(declare-fun condMapEmpty!48610 () Bool)

(declare-fun mapDefault!48610 () ValueCell!14861)

(assert (=> b!1224911 (= condMapEmpty!48610 (= (arr!38121 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14861)) mapDefault!48610)))))

(declare-fun b!1224912 () Bool)

(assert (=> b!1224912 (= e!695688 e!695694)))

(declare-fun res!813988 () Bool)

(assert (=> b!1224912 (=> (not res!813988) (not e!695694))))

(assert (=> b!1224912 (= res!813988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557838 mask!1564))))

(assert (=> b!1224912 (= lt!557838 (array!78987 (store (arr!38120 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38658 _keys!1208)))))

(declare-fun b!1224913 () Bool)

(declare-fun Unit!40445 () Unit!40442)

(assert (=> b!1224913 (= e!695693 Unit!40445)))

(declare-fun b!1224914 () Bool)

(declare-fun res!813986 () Bool)

(assert (=> b!1224914 (=> (not res!813986) (not e!695688))))

(assert (=> b!1224914 (= res!813986 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38658 _keys!1208))))))

(declare-fun b!1224915 () Bool)

(declare-fun res!813992 () Bool)

(assert (=> b!1224915 (=> (not res!813992) (not e!695688))))

(assert (=> b!1224915 (= res!813992 (and (= (size!38659 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38658 _keys!1208) (size!38659 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224916 () Bool)

(assert (=> b!1224916 (= e!695687 e!695691)))

(declare-fun res!813989 () Bool)

(assert (=> b!1224916 (=> res!813989 e!695691)))

(assert (=> b!1224916 (= res!813989 (not (validKeyInArray!0 (select (arr!38120 _keys!1208) from!1455))))))

(assert (=> b!1224916 (= lt!557833 lt!557827)))

(assert (=> b!1224916 (= lt!557827 (-!1929 lt!557837 k0!934))))

(assert (=> b!1224916 (= lt!557833 (getCurrentListMapNoExtraKeys!5542 lt!557838 lt!557832 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224916 (= lt!557837 (getCurrentListMapNoExtraKeys!5542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557834 () Unit!40442)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1163 (array!78986 array!78988 (_ BitVec 32) (_ BitVec 32) V!46649 V!46649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40442)

(assert (=> b!1224916 (= lt!557834 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1163 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224917 () Bool)

(assert (=> b!1224917 (= e!695689 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224918 () Bool)

(declare-fun res!813996 () Bool)

(assert (=> b!1224918 (=> (not res!813996) (not e!695694))))

(assert (=> b!1224918 (= res!813996 (arrayNoDuplicates!0 lt!557838 #b00000000000000000000000000000000 Nil!27001))))

(declare-fun mapIsEmpty!48610 () Bool)

(assert (=> mapIsEmpty!48610 mapRes!48610))

(declare-fun b!1224919 () Bool)

(assert (=> b!1224919 (= e!695695 tp_is_empty!31141)))

(assert (= (and start!101742 res!813983) b!1224901))

(assert (= (and b!1224901 res!813993) b!1224915))

(assert (= (and b!1224915 res!813992) b!1224905))

(assert (= (and b!1224905 res!813995) b!1224902))

(assert (= (and b!1224902 res!813987) b!1224914))

(assert (= (and b!1224914 res!813986) b!1224908))

(assert (= (and b!1224908 res!813994) b!1224903))

(assert (= (and b!1224903 res!813990) b!1224912))

(assert (= (and b!1224912 res!813988) b!1224918))

(assert (= (and b!1224918 res!813996) b!1224910))

(assert (= (and b!1224910 (not res!813985)) b!1224909))

(assert (= (and b!1224909 (not res!813982)) b!1224916))

(assert (= (and b!1224916 (not res!813989)) b!1224906))

(assert (= (and b!1224906 res!813984) b!1224907))

(assert (= (and b!1224907 (not res!813991)) b!1224917))

(assert (= (and b!1224906 c!120455) b!1224904))

(assert (= (and b!1224906 (not c!120455)) b!1224913))

(assert (= (and b!1224911 condMapEmpty!48610) mapIsEmpty!48610))

(assert (= (and b!1224911 (not condMapEmpty!48610)) mapNonEmpty!48610))

(get-info :version)

(assert (= (and mapNonEmpty!48610 ((_ is ValueCellFull!14861) mapValue!48610)) b!1224900))

(assert (= (and b!1224911 ((_ is ValueCellFull!14861) mapDefault!48610)) b!1224919))

(assert (= start!101742 b!1224911))

(declare-fun b_lambda!22407 () Bool)

(assert (=> (not b_lambda!22407) (not b!1224909)))

(declare-fun t!40411 () Bool)

(declare-fun tb!11229 () Bool)

(assert (=> (and start!101742 (= defaultEntry!1004 defaultEntry!1004) t!40411) tb!11229))

(declare-fun result!23079 () Bool)

(assert (=> tb!11229 (= result!23079 tp_is_empty!31141)))

(assert (=> b!1224909 t!40411))

(declare-fun b_and!44119 () Bool)

(assert (= b_and!44117 (and (=> t!40411 result!23079) b_and!44119)))

(declare-fun m!1129493 () Bool)

(assert (=> start!101742 m!1129493))

(declare-fun m!1129495 () Bool)

(assert (=> start!101742 m!1129495))

(declare-fun m!1129497 () Bool)

(assert (=> b!1224907 m!1129497))

(declare-fun m!1129499 () Bool)

(assert (=> b!1224905 m!1129499))

(declare-fun m!1129501 () Bool)

(assert (=> b!1224910 m!1129501))

(declare-fun m!1129503 () Bool)

(assert (=> b!1224910 m!1129503))

(declare-fun m!1129505 () Bool)

(assert (=> b!1224917 m!1129505))

(declare-fun m!1129507 () Bool)

(assert (=> b!1224916 m!1129507))

(declare-fun m!1129509 () Bool)

(assert (=> b!1224916 m!1129509))

(declare-fun m!1129511 () Bool)

(assert (=> b!1224916 m!1129511))

(declare-fun m!1129513 () Bool)

(assert (=> b!1224916 m!1129513))

(assert (=> b!1224916 m!1129497))

(declare-fun m!1129515 () Bool)

(assert (=> b!1224916 m!1129515))

(assert (=> b!1224916 m!1129497))

(declare-fun m!1129517 () Bool)

(assert (=> mapNonEmpty!48610 m!1129517))

(declare-fun m!1129519 () Bool)

(assert (=> b!1224912 m!1129519))

(declare-fun m!1129521 () Bool)

(assert (=> b!1224912 m!1129521))

(declare-fun m!1129523 () Bool)

(assert (=> b!1224906 m!1129523))

(assert (=> b!1224906 m!1129497))

(declare-fun m!1129525 () Bool)

(assert (=> b!1224906 m!1129525))

(assert (=> b!1224906 m!1129497))

(declare-fun m!1129527 () Bool)

(assert (=> b!1224906 m!1129527))

(declare-fun m!1129529 () Bool)

(assert (=> b!1224906 m!1129529))

(assert (=> b!1224906 m!1129529))

(declare-fun m!1129531 () Bool)

(assert (=> b!1224906 m!1129531))

(declare-fun m!1129533 () Bool)

(assert (=> b!1224906 m!1129533))

(declare-fun m!1129535 () Bool)

(assert (=> b!1224909 m!1129535))

(declare-fun m!1129537 () Bool)

(assert (=> b!1224909 m!1129537))

(declare-fun m!1129539 () Bool)

(assert (=> b!1224909 m!1129539))

(declare-fun m!1129541 () Bool)

(assert (=> b!1224909 m!1129541))

(declare-fun m!1129543 () Bool)

(assert (=> b!1224902 m!1129543))

(declare-fun m!1129545 () Bool)

(assert (=> b!1224904 m!1129545))

(declare-fun m!1129547 () Bool)

(assert (=> b!1224904 m!1129547))

(declare-fun m!1129549 () Bool)

(assert (=> b!1224904 m!1129549))

(declare-fun m!1129551 () Bool)

(assert (=> b!1224904 m!1129551))

(declare-fun m!1129553 () Bool)

(assert (=> b!1224904 m!1129553))

(declare-fun m!1129555 () Bool)

(assert (=> b!1224908 m!1129555))

(declare-fun m!1129557 () Bool)

(assert (=> b!1224901 m!1129557))

(declare-fun m!1129559 () Bool)

(assert (=> b!1224918 m!1129559))

(declare-fun m!1129561 () Bool)

(assert (=> b!1224903 m!1129561))

(check-sat (not b!1224908) (not b!1224906) (not b!1224918) (not b!1224905) (not b!1224916) (not b_lambda!22407) (not b!1224904) tp_is_empty!31141 (not b!1224909) (not b!1224902) (not b!1224912) (not start!101742) b_and!44119 (not mapNonEmpty!48610) (not b!1224910) (not b!1224901) (not b!1224917) (not b_next!26437))
(check-sat b_and!44119 (not b_next!26437))
