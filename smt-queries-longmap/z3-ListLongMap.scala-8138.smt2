; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99696 () Bool)

(assert start!99696)

(declare-fun b_free!25275 () Bool)

(declare-fun b_next!25275 () Bool)

(assert (=> start!99696 (= b_free!25275 (not b_next!25275))))

(declare-fun tp!88538 () Bool)

(declare-fun b_and!41417 () Bool)

(assert (=> start!99696 (= tp!88538 b_and!41417)))

(declare-fun b!1182811 () Bool)

(declare-fun e!672487 () Bool)

(declare-fun e!672488 () Bool)

(assert (=> b!1182811 (= e!672487 e!672488)))

(declare-fun res!786092 () Bool)

(assert (=> b!1182811 (=> res!786092 e!672488)))

(declare-datatypes ((array!76413 0))(
  ( (array!76414 (arr!36856 (Array (_ BitVec 32) (_ BitVec 64))) (size!37392 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76413)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182811 (= res!786092 (not (= (select (arr!36856 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182812 () Bool)

(declare-fun res!786090 () Bool)

(declare-fun e!672480 () Bool)

(assert (=> b!1182812 (=> (not res!786090) (not e!672480))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44867 0))(
  ( (V!44868 (val!14959 Int)) )
))
(declare-datatypes ((ValueCell!14193 0))(
  ( (ValueCellFull!14193 (v!17597 V!44867)) (EmptyCell!14193) )
))
(declare-datatypes ((array!76415 0))(
  ( (array!76416 (arr!36857 (Array (_ BitVec 32) ValueCell!14193)) (size!37393 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76415)

(assert (=> b!1182812 (= res!786090 (and (= (size!37393 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37392 _keys!1208) (size!37393 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182813 () Bool)

(declare-fun e!672486 () Bool)

(declare-fun e!672490 () Bool)

(assert (=> b!1182813 (= e!672486 (not e!672490))))

(declare-fun res!786101 () Bool)

(assert (=> b!1182813 (=> res!786101 e!672490)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182813 (= res!786101 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182813 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39139 0))(
  ( (Unit!39140) )
))
(declare-fun lt!535597 () Unit!39139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76413 (_ BitVec 64) (_ BitVec 32)) Unit!39139)

(assert (=> b!1182813 (= lt!535597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182814 () Bool)

(declare-fun res!786102 () Bool)

(assert (=> b!1182814 (=> (not res!786102) (not e!672480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76413 (_ BitVec 32)) Bool)

(assert (=> b!1182814 (= res!786102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46535 () Bool)

(declare-fun mapRes!46535 () Bool)

(declare-fun tp!88539 () Bool)

(declare-fun e!672484 () Bool)

(assert (=> mapNonEmpty!46535 (= mapRes!46535 (and tp!88539 e!672484))))

(declare-fun mapRest!46535 () (Array (_ BitVec 32) ValueCell!14193))

(declare-fun mapValue!46535 () ValueCell!14193)

(declare-fun mapKey!46535 () (_ BitVec 32))

(assert (=> mapNonEmpty!46535 (= (arr!36857 _values!996) (store mapRest!46535 mapKey!46535 mapValue!46535))))

(declare-fun b!1182815 () Bool)

(declare-fun tp_is_empty!29805 () Bool)

(assert (=> b!1182815 (= e!672484 tp_is_empty!29805)))

(declare-fun b!1182816 () Bool)

(declare-fun e!672483 () Bool)

(assert (=> b!1182816 (= e!672483 true)))

(declare-datatypes ((tuple2!19174 0))(
  ( (tuple2!19175 (_1!9598 (_ BitVec 64)) (_2!9598 V!44867)) )
))
(declare-datatypes ((List!25915 0))(
  ( (Nil!25912) (Cons!25911 (h!27120 tuple2!19174) (t!38182 List!25915)) )
))
(declare-datatypes ((ListLongMap!17143 0))(
  ( (ListLongMap!17144 (toList!8587 List!25915)) )
))
(declare-fun lt!535594 () ListLongMap!17143)

(declare-fun lt!535602 () ListLongMap!17143)

(declare-fun -!1623 (ListLongMap!17143 (_ BitVec 64)) ListLongMap!17143)

(assert (=> b!1182816 (= (-!1623 lt!535594 k0!934) lt!535602)))

(declare-fun lt!535591 () ListLongMap!17143)

(declare-fun lt!535603 () V!44867)

(declare-fun lt!535608 () Unit!39139)

(declare-fun addRemoveCommutativeForDiffKeys!152 (ListLongMap!17143 (_ BitVec 64) V!44867 (_ BitVec 64)) Unit!39139)

(assert (=> b!1182816 (= lt!535608 (addRemoveCommutativeForDiffKeys!152 lt!535591 (select (arr!36856 _keys!1208) from!1455) lt!535603 k0!934))))

(declare-fun lt!535596 () ListLongMap!17143)

(declare-fun lt!535604 () ListLongMap!17143)

(declare-fun lt!535590 () ListLongMap!17143)

(assert (=> b!1182816 (and (= lt!535604 lt!535594) (= lt!535590 lt!535596))))

(declare-fun lt!535606 () tuple2!19174)

(declare-fun +!3889 (ListLongMap!17143 tuple2!19174) ListLongMap!17143)

(assert (=> b!1182816 (= lt!535594 (+!3889 lt!535591 lt!535606))))

(assert (=> b!1182816 (not (= (select (arr!36856 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535599 () Unit!39139)

(declare-fun e!672489 () Unit!39139)

(assert (=> b!1182816 (= lt!535599 e!672489)))

(declare-fun c!117036 () Bool)

(assert (=> b!1182816 (= c!117036 (= (select (arr!36856 _keys!1208) from!1455) k0!934))))

(assert (=> b!1182816 e!672487))

(declare-fun res!786098 () Bool)

(assert (=> b!1182816 (=> (not res!786098) (not e!672487))))

(declare-fun lt!535605 () ListLongMap!17143)

(assert (=> b!1182816 (= res!786098 (= lt!535605 lt!535602))))

(assert (=> b!1182816 (= lt!535602 (+!3889 lt!535590 lt!535606))))

(assert (=> b!1182816 (= lt!535606 (tuple2!19175 (select (arr!36856 _keys!1208) from!1455) lt!535603))))

(declare-fun lt!535598 () V!44867)

(declare-fun get!18854 (ValueCell!14193 V!44867) V!44867)

(assert (=> b!1182816 (= lt!535603 (get!18854 (select (arr!36857 _values!996) from!1455) lt!535598))))

(declare-fun b!1182817 () Bool)

(assert (=> b!1182817 (= e!672488 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182818 () Bool)

(declare-fun res!786091 () Bool)

(assert (=> b!1182818 (=> (not res!786091) (not e!672480))))

(assert (=> b!1182818 (= res!786091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37392 _keys!1208))))))

(declare-fun mapIsEmpty!46535 () Bool)

(assert (=> mapIsEmpty!46535 mapRes!46535))

(declare-fun b!1182819 () Bool)

(declare-fun res!786103 () Bool)

(assert (=> b!1182819 (=> (not res!786103) (not e!672480))))

(declare-datatypes ((List!25916 0))(
  ( (Nil!25913) (Cons!25912 (h!27121 (_ BitVec 64)) (t!38183 List!25916)) )
))
(declare-fun arrayNoDuplicates!0 (array!76413 (_ BitVec 32) List!25916) Bool)

(assert (=> b!1182819 (= res!786103 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25913))))

(declare-fun b!1182820 () Bool)

(declare-fun res!786089 () Bool)

(assert (=> b!1182820 (=> (not res!786089) (not e!672480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182820 (= res!786089 (validMask!0 mask!1564))))

(declare-fun b!1182821 () Bool)

(declare-fun Unit!39141 () Unit!39139)

(assert (=> b!1182821 (= e!672489 Unit!39141)))

(declare-fun b!1182822 () Bool)

(declare-fun res!786099 () Bool)

(assert (=> b!1182822 (=> (not res!786099) (not e!672486))))

(declare-fun lt!535601 () array!76413)

(assert (=> b!1182822 (= res!786099 (arrayNoDuplicates!0 lt!535601 #b00000000000000000000000000000000 Nil!25913))))

(declare-fun b!1182823 () Bool)

(declare-fun res!786100 () Bool)

(assert (=> b!1182823 (=> (not res!786100) (not e!672480))))

(assert (=> b!1182823 (= res!786100 (= (select (arr!36856 _keys!1208) i!673) k0!934))))

(declare-fun b!1182824 () Bool)

(declare-fun e!672485 () Bool)

(declare-fun e!672482 () Bool)

(assert (=> b!1182824 (= e!672485 (and e!672482 mapRes!46535))))

(declare-fun condMapEmpty!46535 () Bool)

(declare-fun mapDefault!46535 () ValueCell!14193)

(assert (=> b!1182824 (= condMapEmpty!46535 (= (arr!36857 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14193)) mapDefault!46535)))))

(declare-fun b!1182825 () Bool)

(assert (=> b!1182825 (= e!672482 tp_is_empty!29805)))

(declare-fun b!1182826 () Bool)

(declare-fun e!672481 () Bool)

(assert (=> b!1182826 (= e!672490 e!672481)))

(declare-fun res!786093 () Bool)

(assert (=> b!1182826 (=> res!786093 e!672481)))

(assert (=> b!1182826 (= res!786093 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44867)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535607 () array!76415)

(declare-fun minValue!944 () V!44867)

(declare-fun getCurrentListMapNoExtraKeys!5038 (array!76413 array!76415 (_ BitVec 32) (_ BitVec 32) V!44867 V!44867 (_ BitVec 32) Int) ListLongMap!17143)

(assert (=> b!1182826 (= lt!535605 (getCurrentListMapNoExtraKeys!5038 lt!535601 lt!535607 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182826 (= lt!535607 (array!76416 (store (arr!36857 _values!996) i!673 (ValueCellFull!14193 lt!535598)) (size!37393 _values!996)))))

(declare-fun dynLambda!2993 (Int (_ BitVec 64)) V!44867)

(assert (=> b!1182826 (= lt!535598 (dynLambda!2993 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182826 (= lt!535604 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182827 () Bool)

(declare-fun res!786094 () Bool)

(assert (=> b!1182827 (=> (not res!786094) (not e!672480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182827 (= res!786094 (validKeyInArray!0 k0!934))))

(declare-fun b!1182828 () Bool)

(declare-fun Unit!39142 () Unit!39139)

(assert (=> b!1182828 (= e!672489 Unit!39142)))

(declare-fun lt!535593 () Unit!39139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39139)

(assert (=> b!1182828 (= lt!535593 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182828 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535595 () Unit!39139)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76413 (_ BitVec 32) (_ BitVec 32)) Unit!39139)

(assert (=> b!1182828 (= lt!535595 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182828 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25913)))

(declare-fun lt!535592 () Unit!39139)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76413 (_ BitVec 64) (_ BitVec 32) List!25916) Unit!39139)

(assert (=> b!1182828 (= lt!535592 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25913))))

(assert (=> b!1182828 false))

(declare-fun b!1182829 () Bool)

(assert (=> b!1182829 (= e!672481 e!672483)))

(declare-fun res!786095 () Bool)

(assert (=> b!1182829 (=> res!786095 e!672483)))

(assert (=> b!1182829 (= res!786095 (not (validKeyInArray!0 (select (arr!36856 _keys!1208) from!1455))))))

(assert (=> b!1182829 (= lt!535596 lt!535590)))

(assert (=> b!1182829 (= lt!535590 (-!1623 lt!535591 k0!934))))

(assert (=> b!1182829 (= lt!535596 (getCurrentListMapNoExtraKeys!5038 lt!535601 lt!535607 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182829 (= lt!535591 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535600 () Unit!39139)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 (array!76413 array!76415 (_ BitVec 32) (_ BitVec 32) V!44867 V!44867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39139)

(assert (=> b!1182829 (= lt!535600 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182830 () Bool)

(assert (=> b!1182830 (= e!672480 e!672486)))

(declare-fun res!786096 () Bool)

(assert (=> b!1182830 (=> (not res!786096) (not e!672486))))

(assert (=> b!1182830 (= res!786096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535601 mask!1564))))

(assert (=> b!1182830 (= lt!535601 (array!76414 (store (arr!36856 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37392 _keys!1208)))))

(declare-fun res!786097 () Bool)

(assert (=> start!99696 (=> (not res!786097) (not e!672480))))

(assert (=> start!99696 (= res!786097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37392 _keys!1208))))))

(assert (=> start!99696 e!672480))

(assert (=> start!99696 tp_is_empty!29805))

(declare-fun array_inv!28140 (array!76413) Bool)

(assert (=> start!99696 (array_inv!28140 _keys!1208)))

(assert (=> start!99696 true))

(assert (=> start!99696 tp!88538))

(declare-fun array_inv!28141 (array!76415) Bool)

(assert (=> start!99696 (and (array_inv!28141 _values!996) e!672485)))

(assert (= (and start!99696 res!786097) b!1182820))

(assert (= (and b!1182820 res!786089) b!1182812))

(assert (= (and b!1182812 res!786090) b!1182814))

(assert (= (and b!1182814 res!786102) b!1182819))

(assert (= (and b!1182819 res!786103) b!1182818))

(assert (= (and b!1182818 res!786091) b!1182827))

(assert (= (and b!1182827 res!786094) b!1182823))

(assert (= (and b!1182823 res!786100) b!1182830))

(assert (= (and b!1182830 res!786096) b!1182822))

(assert (= (and b!1182822 res!786099) b!1182813))

(assert (= (and b!1182813 (not res!786101)) b!1182826))

(assert (= (and b!1182826 (not res!786093)) b!1182829))

(assert (= (and b!1182829 (not res!786095)) b!1182816))

(assert (= (and b!1182816 res!786098) b!1182811))

(assert (= (and b!1182811 (not res!786092)) b!1182817))

(assert (= (and b!1182816 c!117036) b!1182828))

(assert (= (and b!1182816 (not c!117036)) b!1182821))

(assert (= (and b!1182824 condMapEmpty!46535) mapIsEmpty!46535))

(assert (= (and b!1182824 (not condMapEmpty!46535)) mapNonEmpty!46535))

(get-info :version)

(assert (= (and mapNonEmpty!46535 ((_ is ValueCellFull!14193) mapValue!46535)) b!1182815))

(assert (= (and b!1182824 ((_ is ValueCellFull!14193) mapDefault!46535)) b!1182825))

(assert (= start!99696 b!1182824))

(declare-fun b_lambda!20419 () Bool)

(assert (=> (not b_lambda!20419) (not b!1182826)))

(declare-fun t!38181 () Bool)

(declare-fun tb!10087 () Bool)

(assert (=> (and start!99696 (= defaultEntry!1004 defaultEntry!1004) t!38181) tb!10087))

(declare-fun result!20741 () Bool)

(assert (=> tb!10087 (= result!20741 tp_is_empty!29805)))

(assert (=> b!1182826 t!38181))

(declare-fun b_and!41419 () Bool)

(assert (= b_and!41417 (and (=> t!38181 result!20741) b_and!41419)))

(declare-fun m!1090885 () Bool)

(assert (=> b!1182822 m!1090885))

(declare-fun m!1090887 () Bool)

(assert (=> b!1182814 m!1090887))

(declare-fun m!1090889 () Bool)

(assert (=> b!1182827 m!1090889))

(declare-fun m!1090891 () Bool)

(assert (=> b!1182816 m!1090891))

(assert (=> b!1182816 m!1090891))

(declare-fun m!1090893 () Bool)

(assert (=> b!1182816 m!1090893))

(declare-fun m!1090895 () Bool)

(assert (=> b!1182816 m!1090895))

(declare-fun m!1090897 () Bool)

(assert (=> b!1182816 m!1090897))

(declare-fun m!1090899 () Bool)

(assert (=> b!1182816 m!1090899))

(declare-fun m!1090901 () Bool)

(assert (=> b!1182816 m!1090901))

(declare-fun m!1090903 () Bool)

(assert (=> b!1182816 m!1090903))

(assert (=> b!1182816 m!1090895))

(declare-fun m!1090905 () Bool)

(assert (=> b!1182817 m!1090905))

(declare-fun m!1090907 () Bool)

(assert (=> b!1182819 m!1090907))

(declare-fun m!1090909 () Bool)

(assert (=> b!1182828 m!1090909))

(declare-fun m!1090911 () Bool)

(assert (=> b!1182828 m!1090911))

(declare-fun m!1090913 () Bool)

(assert (=> b!1182828 m!1090913))

(declare-fun m!1090915 () Bool)

(assert (=> b!1182828 m!1090915))

(declare-fun m!1090917 () Bool)

(assert (=> b!1182828 m!1090917))

(declare-fun m!1090919 () Bool)

(assert (=> b!1182820 m!1090919))

(declare-fun m!1090921 () Bool)

(assert (=> b!1182829 m!1090921))

(declare-fun m!1090923 () Bool)

(assert (=> b!1182829 m!1090923))

(declare-fun m!1090925 () Bool)

(assert (=> b!1182829 m!1090925))

(assert (=> b!1182829 m!1090895))

(declare-fun m!1090927 () Bool)

(assert (=> b!1182829 m!1090927))

(declare-fun m!1090929 () Bool)

(assert (=> b!1182829 m!1090929))

(assert (=> b!1182829 m!1090895))

(declare-fun m!1090931 () Bool)

(assert (=> start!99696 m!1090931))

(declare-fun m!1090933 () Bool)

(assert (=> start!99696 m!1090933))

(declare-fun m!1090935 () Bool)

(assert (=> b!1182823 m!1090935))

(declare-fun m!1090937 () Bool)

(assert (=> b!1182813 m!1090937))

(declare-fun m!1090939 () Bool)

(assert (=> b!1182813 m!1090939))

(declare-fun m!1090941 () Bool)

(assert (=> b!1182826 m!1090941))

(declare-fun m!1090943 () Bool)

(assert (=> b!1182826 m!1090943))

(declare-fun m!1090945 () Bool)

(assert (=> b!1182826 m!1090945))

(declare-fun m!1090947 () Bool)

(assert (=> b!1182826 m!1090947))

(assert (=> b!1182811 m!1090895))

(declare-fun m!1090949 () Bool)

(assert (=> mapNonEmpty!46535 m!1090949))

(declare-fun m!1090951 () Bool)

(assert (=> b!1182830 m!1090951))

(declare-fun m!1090953 () Bool)

(assert (=> b!1182830 m!1090953))

(check-sat (not b!1182829) (not b!1182826) (not b!1182817) (not mapNonEmpty!46535) (not b!1182814) (not b!1182830) (not b!1182813) b_and!41419 (not start!99696) (not b!1182819) (not b_lambda!20419) (not b!1182822) tp_is_empty!29805 (not b!1182820) (not b!1182827) (not b!1182816) (not b!1182828) (not b_next!25275))
(check-sat b_and!41419 (not b_next!25275))
