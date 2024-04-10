; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101744 () Bool)

(assert start!101744)

(declare-fun b_free!26433 () Bool)

(declare-fun b_next!26433 () Bool)

(assert (=> start!101744 (= b_free!26433 (not b_next!26433))))

(declare-fun tp!92345 () Bool)

(declare-fun b_and!44127 () Bool)

(assert (=> start!101744 (= tp!92345 b_and!44127)))

(declare-fun b!1224885 () Bool)

(declare-fun e!695692 () Bool)

(declare-fun e!695690 () Bool)

(assert (=> b!1224885 (= e!695692 e!695690)))

(declare-fun res!813965 () Bool)

(assert (=> b!1224885 (=> res!813965 e!695690)))

(declare-datatypes ((array!79057 0))(
  ( (array!79058 (arr!38155 (Array (_ BitVec 32) (_ BitVec 64))) (size!38691 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79057)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224885 (= res!813965 (not (= (select (arr!38155 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224886 () Bool)

(declare-fun res!813964 () Bool)

(declare-fun e!695686 () Bool)

(assert (=> b!1224886 (=> (not res!813964) (not e!695686))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224886 (= res!813964 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38691 _keys!1208))))))

(declare-fun b!1224887 () Bool)

(declare-fun e!695681 () Bool)

(declare-fun e!695685 () Bool)

(assert (=> b!1224887 (= e!695681 (not e!695685))))

(declare-fun res!813960 () Bool)

(assert (=> b!1224887 (=> res!813960 e!695685)))

(assert (=> b!1224887 (= res!813960 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224887 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40591 0))(
  ( (Unit!40592) )
))
(declare-fun lt!557906 () Unit!40591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79057 (_ BitVec 64) (_ BitVec 32)) Unit!40591)

(assert (=> b!1224887 (= lt!557906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224888 () Bool)

(declare-fun e!695688 () Bool)

(assert (=> b!1224888 (= e!695685 e!695688)))

(declare-fun res!813966 () Bool)

(assert (=> b!1224888 (=> res!813966 e!695688)))

(assert (=> b!1224888 (= res!813966 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46643 0))(
  ( (V!46644 (val!15625 Int)) )
))
(declare-fun zeroValue!944 () V!46643)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14859 0))(
  ( (ValueCellFull!14859 (v!18287 V!46643)) (EmptyCell!14859) )
))
(declare-datatypes ((array!79059 0))(
  ( (array!79060 (arr!38156 (Array (_ BitVec 32) ValueCell!14859)) (size!38692 (_ BitVec 32))) )
))
(declare-fun lt!557896 () array!79059)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557903 () array!79057)

(declare-fun minValue!944 () V!46643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!20138 0))(
  ( (tuple2!20139 (_1!10080 (_ BitVec 64)) (_2!10080 V!46643)) )
))
(declare-datatypes ((List!26938 0))(
  ( (Nil!26935) (Cons!26934 (h!28143 tuple2!20138) (t!40351 List!26938)) )
))
(declare-datatypes ((ListLongMap!18107 0))(
  ( (ListLongMap!18108 (toList!9069 List!26938)) )
))
(declare-fun lt!557899 () ListLongMap!18107)

(declare-fun getCurrentListMapNoExtraKeys!5489 (array!79057 array!79059 (_ BitVec 32) (_ BitVec 32) V!46643 V!46643 (_ BitVec 32) Int) ListLongMap!18107)

(assert (=> b!1224888 (= lt!557899 (getCurrentListMapNoExtraKeys!5489 lt!557903 lt!557896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557901 () V!46643)

(declare-fun _values!996 () array!79059)

(assert (=> b!1224888 (= lt!557896 (array!79060 (store (arr!38156 _values!996) i!673 (ValueCellFull!14859 lt!557901)) (size!38692 _values!996)))))

(declare-fun dynLambda!3361 (Int (_ BitVec 64)) V!46643)

(assert (=> b!1224888 (= lt!557901 (dynLambda!3361 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557898 () ListLongMap!18107)

(assert (=> b!1224888 (= lt!557898 (getCurrentListMapNoExtraKeys!5489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224889 () Bool)

(declare-fun e!695689 () Bool)

(declare-fun e!695682 () Bool)

(declare-fun mapRes!48604 () Bool)

(assert (=> b!1224889 (= e!695689 (and e!695682 mapRes!48604))))

(declare-fun condMapEmpty!48604 () Bool)

(declare-fun mapDefault!48604 () ValueCell!14859)

(assert (=> b!1224889 (= condMapEmpty!48604 (= (arr!38156 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14859)) mapDefault!48604)))))

(declare-fun mapNonEmpty!48604 () Bool)

(declare-fun tp!92344 () Bool)

(declare-fun e!695683 () Bool)

(assert (=> mapNonEmpty!48604 (= mapRes!48604 (and tp!92344 e!695683))))

(declare-fun mapValue!48604 () ValueCell!14859)

(declare-fun mapRest!48604 () (Array (_ BitVec 32) ValueCell!14859))

(declare-fun mapKey!48604 () (_ BitVec 32))

(assert (=> mapNonEmpty!48604 (= (arr!38156 _values!996) (store mapRest!48604 mapKey!48604 mapValue!48604))))

(declare-fun b!1224890 () Bool)

(declare-fun res!813958 () Bool)

(assert (=> b!1224890 (=> (not res!813958) (not e!695686))))

(assert (=> b!1224890 (= res!813958 (= (select (arr!38155 _keys!1208) i!673) k0!934))))

(declare-fun b!1224891 () Bool)

(declare-fun res!813953 () Bool)

(assert (=> b!1224891 (=> (not res!813953) (not e!695686))))

(assert (=> b!1224891 (= res!813953 (and (= (size!38692 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38691 _keys!1208) (size!38692 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!813957 () Bool)

(assert (=> start!101744 (=> (not res!813957) (not e!695686))))

(assert (=> start!101744 (= res!813957 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38691 _keys!1208))))))

(assert (=> start!101744 e!695686))

(declare-fun tp_is_empty!31137 () Bool)

(assert (=> start!101744 tp_is_empty!31137))

(declare-fun array_inv!29022 (array!79057) Bool)

(assert (=> start!101744 (array_inv!29022 _keys!1208)))

(assert (=> start!101744 true))

(assert (=> start!101744 tp!92345))

(declare-fun array_inv!29023 (array!79059) Bool)

(assert (=> start!101744 (and (array_inv!29023 _values!996) e!695689)))

(declare-fun b!1224892 () Bool)

(assert (=> b!1224892 (= e!695683 tp_is_empty!31137)))

(declare-fun b!1224893 () Bool)

(declare-fun e!695691 () Unit!40591)

(declare-fun Unit!40593 () Unit!40591)

(assert (=> b!1224893 (= e!695691 Unit!40593)))

(declare-fun lt!557891 () Unit!40591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40591)

(assert (=> b!1224893 (= lt!557891 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224893 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557893 () Unit!40591)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79057 (_ BitVec 32) (_ BitVec 32)) Unit!40591)

(assert (=> b!1224893 (= lt!557893 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26939 0))(
  ( (Nil!26936) (Cons!26935 (h!28144 (_ BitVec 64)) (t!40352 List!26939)) )
))
(declare-fun arrayNoDuplicates!0 (array!79057 (_ BitVec 32) List!26939) Bool)

(assert (=> b!1224893 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26936)))

(declare-fun lt!557888 () Unit!40591)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79057 (_ BitVec 64) (_ BitVec 32) List!26939) Unit!40591)

(assert (=> b!1224893 (= lt!557888 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26936))))

(assert (=> b!1224893 false))

(declare-fun mapIsEmpty!48604 () Bool)

(assert (=> mapIsEmpty!48604 mapRes!48604))

(declare-fun b!1224894 () Bool)

(assert (=> b!1224894 (= e!695682 tp_is_empty!31137)))

(declare-fun b!1224895 () Bool)

(declare-fun res!813961 () Bool)

(assert (=> b!1224895 (=> (not res!813961) (not e!695686))))

(assert (=> b!1224895 (= res!813961 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26936))))

(declare-fun b!1224896 () Bool)

(assert (=> b!1224896 (= e!695690 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224897 () Bool)

(declare-fun e!695684 () Bool)

(assert (=> b!1224897 (= e!695688 e!695684)))

(declare-fun res!813959 () Bool)

(assert (=> b!1224897 (=> res!813959 e!695684)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224897 (= res!813959 (not (validKeyInArray!0 (select (arr!38155 _keys!1208) from!1455))))))

(declare-fun lt!557905 () ListLongMap!18107)

(declare-fun lt!557890 () ListLongMap!18107)

(assert (=> b!1224897 (= lt!557905 lt!557890)))

(declare-fun lt!557902 () ListLongMap!18107)

(declare-fun -!1968 (ListLongMap!18107 (_ BitVec 64)) ListLongMap!18107)

(assert (=> b!1224897 (= lt!557890 (-!1968 lt!557902 k0!934))))

(assert (=> b!1224897 (= lt!557905 (getCurrentListMapNoExtraKeys!5489 lt!557903 lt!557896 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224897 (= lt!557902 (getCurrentListMapNoExtraKeys!5489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557892 () Unit!40591)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1175 (array!79057 array!79059 (_ BitVec 32) (_ BitVec 32) V!46643 V!46643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40591)

(assert (=> b!1224897 (= lt!557892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1175 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224898 () Bool)

(declare-fun res!813954 () Bool)

(assert (=> b!1224898 (=> (not res!813954) (not e!695686))))

(assert (=> b!1224898 (= res!813954 (validKeyInArray!0 k0!934))))

(declare-fun b!1224899 () Bool)

(declare-fun Unit!40594 () Unit!40591)

(assert (=> b!1224899 (= e!695691 Unit!40594)))

(declare-fun b!1224900 () Bool)

(declare-fun res!813962 () Bool)

(assert (=> b!1224900 (=> (not res!813962) (not e!695686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79057 (_ BitVec 32)) Bool)

(assert (=> b!1224900 (= res!813962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224901 () Bool)

(declare-fun res!813967 () Bool)

(assert (=> b!1224901 (=> (not res!813967) (not e!695686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224901 (= res!813967 (validMask!0 mask!1564))))

(declare-fun b!1224902 () Bool)

(assert (=> b!1224902 (= e!695686 e!695681)))

(declare-fun res!813956 () Bool)

(assert (=> b!1224902 (=> (not res!813956) (not e!695681))))

(assert (=> b!1224902 (= res!813956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557903 mask!1564))))

(assert (=> b!1224902 (= lt!557903 (array!79058 (store (arr!38155 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38691 _keys!1208)))))

(declare-fun b!1224903 () Bool)

(assert (=> b!1224903 (= e!695684 (bvslt i!673 (size!38692 _values!996)))))

(declare-fun lt!557904 () ListLongMap!18107)

(declare-fun lt!557895 () ListLongMap!18107)

(assert (=> b!1224903 (= (-!1968 lt!557904 k0!934) lt!557895)))

(declare-fun lt!557897 () Unit!40591)

(declare-fun lt!557900 () V!46643)

(declare-fun addRemoveCommutativeForDiffKeys!211 (ListLongMap!18107 (_ BitVec 64) V!46643 (_ BitVec 64)) Unit!40591)

(assert (=> b!1224903 (= lt!557897 (addRemoveCommutativeForDiffKeys!211 lt!557902 (select (arr!38155 _keys!1208) from!1455) lt!557900 k0!934))))

(assert (=> b!1224903 (and (= lt!557898 lt!557904) (= lt!557890 lt!557905))))

(declare-fun lt!557894 () tuple2!20138)

(declare-fun +!4124 (ListLongMap!18107 tuple2!20138) ListLongMap!18107)

(assert (=> b!1224903 (= lt!557904 (+!4124 lt!557902 lt!557894))))

(assert (=> b!1224903 (not (= (select (arr!38155 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557889 () Unit!40591)

(assert (=> b!1224903 (= lt!557889 e!695691)))

(declare-fun c!120470 () Bool)

(assert (=> b!1224903 (= c!120470 (= (select (arr!38155 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224903 e!695692))

(declare-fun res!813963 () Bool)

(assert (=> b!1224903 (=> (not res!813963) (not e!695692))))

(assert (=> b!1224903 (= res!813963 (= lt!557899 lt!557895))))

(assert (=> b!1224903 (= lt!557895 (+!4124 lt!557890 lt!557894))))

(assert (=> b!1224903 (= lt!557894 (tuple2!20139 (select (arr!38155 _keys!1208) from!1455) lt!557900))))

(declare-fun get!19488 (ValueCell!14859 V!46643) V!46643)

(assert (=> b!1224903 (= lt!557900 (get!19488 (select (arr!38156 _values!996) from!1455) lt!557901))))

(declare-fun b!1224904 () Bool)

(declare-fun res!813955 () Bool)

(assert (=> b!1224904 (=> (not res!813955) (not e!695681))))

(assert (=> b!1224904 (= res!813955 (arrayNoDuplicates!0 lt!557903 #b00000000000000000000000000000000 Nil!26936))))

(assert (= (and start!101744 res!813957) b!1224901))

(assert (= (and b!1224901 res!813967) b!1224891))

(assert (= (and b!1224891 res!813953) b!1224900))

(assert (= (and b!1224900 res!813962) b!1224895))

(assert (= (and b!1224895 res!813961) b!1224886))

(assert (= (and b!1224886 res!813964) b!1224898))

(assert (= (and b!1224898 res!813954) b!1224890))

(assert (= (and b!1224890 res!813958) b!1224902))

(assert (= (and b!1224902 res!813956) b!1224904))

(assert (= (and b!1224904 res!813955) b!1224887))

(assert (= (and b!1224887 (not res!813960)) b!1224888))

(assert (= (and b!1224888 (not res!813966)) b!1224897))

(assert (= (and b!1224897 (not res!813959)) b!1224903))

(assert (= (and b!1224903 res!813963) b!1224885))

(assert (= (and b!1224885 (not res!813965)) b!1224896))

(assert (= (and b!1224903 c!120470) b!1224893))

(assert (= (and b!1224903 (not c!120470)) b!1224899))

(assert (= (and b!1224889 condMapEmpty!48604) mapIsEmpty!48604))

(assert (= (and b!1224889 (not condMapEmpty!48604)) mapNonEmpty!48604))

(get-info :version)

(assert (= (and mapNonEmpty!48604 ((_ is ValueCellFull!14859) mapValue!48604)) b!1224892))

(assert (= (and b!1224889 ((_ is ValueCellFull!14859) mapDefault!48604)) b!1224894))

(assert (= start!101744 b!1224889))

(declare-fun b_lambda!22413 () Bool)

(assert (=> (not b_lambda!22413) (not b!1224888)))

(declare-fun t!40350 () Bool)

(declare-fun tb!11233 () Bool)

(assert (=> (and start!101744 (= defaultEntry!1004 defaultEntry!1004) t!40350) tb!11233))

(declare-fun result!23079 () Bool)

(assert (=> tb!11233 (= result!23079 tp_is_empty!31137)))

(assert (=> b!1224888 t!40350))

(declare-fun b_and!44129 () Bool)

(assert (= b_and!44127 (and (=> t!40350 result!23079) b_and!44129)))

(declare-fun m!1129917 () Bool)

(assert (=> b!1224901 m!1129917))

(declare-fun m!1129919 () Bool)

(assert (=> b!1224896 m!1129919))

(declare-fun m!1129921 () Bool)

(assert (=> b!1224893 m!1129921))

(declare-fun m!1129923 () Bool)

(assert (=> b!1224893 m!1129923))

(declare-fun m!1129925 () Bool)

(assert (=> b!1224893 m!1129925))

(declare-fun m!1129927 () Bool)

(assert (=> b!1224893 m!1129927))

(declare-fun m!1129929 () Bool)

(assert (=> b!1224893 m!1129929))

(declare-fun m!1129931 () Bool)

(assert (=> b!1224887 m!1129931))

(declare-fun m!1129933 () Bool)

(assert (=> b!1224887 m!1129933))

(declare-fun m!1129935 () Bool)

(assert (=> b!1224898 m!1129935))

(declare-fun m!1129937 () Bool)

(assert (=> b!1224900 m!1129937))

(declare-fun m!1129939 () Bool)

(assert (=> b!1224903 m!1129939))

(declare-fun m!1129941 () Bool)

(assert (=> b!1224903 m!1129941))

(declare-fun m!1129943 () Bool)

(assert (=> b!1224903 m!1129943))

(declare-fun m!1129945 () Bool)

(assert (=> b!1224903 m!1129945))

(declare-fun m!1129947 () Bool)

(assert (=> b!1224903 m!1129947))

(declare-fun m!1129949 () Bool)

(assert (=> b!1224903 m!1129949))

(assert (=> b!1224903 m!1129941))

(declare-fun m!1129951 () Bool)

(assert (=> b!1224903 m!1129951))

(assert (=> b!1224903 m!1129947))

(declare-fun m!1129953 () Bool)

(assert (=> b!1224904 m!1129953))

(declare-fun m!1129955 () Bool)

(assert (=> b!1224888 m!1129955))

(declare-fun m!1129957 () Bool)

(assert (=> b!1224888 m!1129957))

(declare-fun m!1129959 () Bool)

(assert (=> b!1224888 m!1129959))

(declare-fun m!1129961 () Bool)

(assert (=> b!1224888 m!1129961))

(declare-fun m!1129963 () Bool)

(assert (=> b!1224897 m!1129963))

(declare-fun m!1129965 () Bool)

(assert (=> b!1224897 m!1129965))

(declare-fun m!1129967 () Bool)

(assert (=> b!1224897 m!1129967))

(declare-fun m!1129969 () Bool)

(assert (=> b!1224897 m!1129969))

(assert (=> b!1224897 m!1129947))

(declare-fun m!1129971 () Bool)

(assert (=> b!1224897 m!1129971))

(assert (=> b!1224897 m!1129947))

(declare-fun m!1129973 () Bool)

(assert (=> b!1224902 m!1129973))

(declare-fun m!1129975 () Bool)

(assert (=> b!1224902 m!1129975))

(declare-fun m!1129977 () Bool)

(assert (=> b!1224890 m!1129977))

(declare-fun m!1129979 () Bool)

(assert (=> start!101744 m!1129979))

(declare-fun m!1129981 () Bool)

(assert (=> start!101744 m!1129981))

(assert (=> b!1224885 m!1129947))

(declare-fun m!1129983 () Bool)

(assert (=> mapNonEmpty!48604 m!1129983))

(declare-fun m!1129985 () Bool)

(assert (=> b!1224895 m!1129985))

(check-sat (not b!1224903) (not b!1224897) (not b!1224902) b_and!44129 (not b!1224900) (not b_lambda!22413) (not b!1224893) (not b!1224887) (not b!1224898) (not b!1224888) tp_is_empty!31137 (not b!1224904) (not b!1224901) (not b!1224896) (not mapNonEmpty!48604) (not b_next!26433) (not start!101744) (not b!1224895))
(check-sat b_and!44129 (not b_next!26433))
