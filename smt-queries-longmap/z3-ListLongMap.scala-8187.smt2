; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99982 () Bool)

(assert start!99982)

(declare-fun b_free!25567 () Bool)

(declare-fun b_next!25567 () Bool)

(assert (=> start!99982 (= b_free!25567 (not b_next!25567))))

(declare-fun tp!89414 () Bool)

(declare-fun b_and!41979 () Bool)

(assert (=> start!99982 (= tp!89414 b_and!41979)))

(declare-fun b!1190874 () Bool)

(declare-fun e!676971 () Bool)

(declare-fun tp_is_empty!30097 () Bool)

(assert (=> b!1190874 (= e!676971 tp_is_empty!30097)))

(declare-fun b!1190875 () Bool)

(declare-fun res!792075 () Bool)

(declare-fun e!676966 () Bool)

(assert (=> b!1190875 (=> (not res!792075) (not e!676966))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190875 (= res!792075 (validKeyInArray!0 k0!934))))

(declare-fun b!1190876 () Bool)

(declare-fun e!676970 () Bool)

(declare-fun mapRes!46973 () Bool)

(assert (=> b!1190876 (= e!676970 (and e!676971 mapRes!46973))))

(declare-fun condMapEmpty!46973 () Bool)

(declare-datatypes ((V!45257 0))(
  ( (V!45258 (val!15105 Int)) )
))
(declare-datatypes ((ValueCell!14339 0))(
  ( (ValueCellFull!14339 (v!17742 V!45257)) (EmptyCell!14339) )
))
(declare-datatypes ((array!76918 0))(
  ( (array!76919 (arr!37109 (Array (_ BitVec 32) ValueCell!14339)) (size!37647 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76918)

(declare-fun mapDefault!46973 () ValueCell!14339)

(assert (=> b!1190876 (= condMapEmpty!46973 (= (arr!37109 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14339)) mapDefault!46973)))))

(declare-fun b!1190877 () Bool)

(declare-fun e!676965 () Bool)

(declare-fun e!676972 () Bool)

(assert (=> b!1190877 (= e!676965 (not e!676972))))

(declare-fun res!792076 () Bool)

(assert (=> b!1190877 (=> res!792076 e!676972)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190877 (= res!792076 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76920 0))(
  ( (array!76921 (arr!37110 (Array (_ BitVec 32) (_ BitVec 64))) (size!37648 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76920)

(declare-fun arrayContainsKey!0 (array!76920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190877 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39385 0))(
  ( (Unit!39386) )
))
(declare-fun lt!541473 () Unit!39385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76920 (_ BitVec 64) (_ BitVec 32)) Unit!39385)

(assert (=> b!1190877 (= lt!541473 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190878 () Bool)

(declare-fun e!676969 () Bool)

(assert (=> b!1190878 (= e!676972 e!676969)))

(declare-fun res!792082 () Bool)

(assert (=> b!1190878 (=> res!792082 e!676969)))

(assert (=> b!1190878 (= res!792082 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541471 () array!76918)

(declare-fun minValue!944 () V!45257)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19524 0))(
  ( (tuple2!19525 (_1!9773 (_ BitVec 64)) (_2!9773 V!45257)) )
))
(declare-datatypes ((List!26236 0))(
  ( (Nil!26233) (Cons!26232 (h!27441 tuple2!19524) (t!38786 List!26236)) )
))
(declare-datatypes ((ListLongMap!17493 0))(
  ( (ListLongMap!17494 (toList!8762 List!26236)) )
))
(declare-fun lt!541472 () ListLongMap!17493)

(declare-fun lt!541474 () array!76920)

(declare-fun getCurrentListMapNoExtraKeys!5212 (array!76920 array!76918 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) Int) ListLongMap!17493)

(assert (=> b!1190878 (= lt!541472 (getCurrentListMapNoExtraKeys!5212 lt!541474 lt!541471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3102 (Int (_ BitVec 64)) V!45257)

(assert (=> b!1190878 (= lt!541471 (array!76919 (store (arr!37109 _values!996) i!673 (ValueCellFull!14339 (dynLambda!3102 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37647 _values!996)))))

(declare-fun lt!541475 () ListLongMap!17493)

(assert (=> b!1190878 (= lt!541475 (getCurrentListMapNoExtraKeys!5212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46973 () Bool)

(declare-fun tp!89415 () Bool)

(declare-fun e!676967 () Bool)

(assert (=> mapNonEmpty!46973 (= mapRes!46973 (and tp!89415 e!676967))))

(declare-fun mapValue!46973 () ValueCell!14339)

(declare-fun mapRest!46973 () (Array (_ BitVec 32) ValueCell!14339))

(declare-fun mapKey!46973 () (_ BitVec 32))

(assert (=> mapNonEmpty!46973 (= (arr!37109 _values!996) (store mapRest!46973 mapKey!46973 mapValue!46973))))

(declare-fun b!1190880 () Bool)

(assert (=> b!1190880 (= e!676966 e!676965)))

(declare-fun res!792083 () Bool)

(assert (=> b!1190880 (=> (not res!792083) (not e!676965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76920 (_ BitVec 32)) Bool)

(assert (=> b!1190880 (= res!792083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541474 mask!1564))))

(assert (=> b!1190880 (= lt!541474 (array!76921 (store (arr!37110 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37648 _keys!1208)))))

(declare-fun b!1190881 () Bool)

(declare-fun res!792077 () Bool)

(assert (=> b!1190881 (=> (not res!792077) (not e!676966))))

(assert (=> b!1190881 (= res!792077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190882 () Bool)

(assert (=> b!1190882 (= e!676969 true)))

(declare-fun -!1705 (ListLongMap!17493 (_ BitVec 64)) ListLongMap!17493)

(assert (=> b!1190882 (= (getCurrentListMapNoExtraKeys!5212 lt!541474 lt!541471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1705 (getCurrentListMapNoExtraKeys!5212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541476 () Unit!39385)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 (array!76920 array!76918 (_ BitVec 32) (_ BitVec 32) V!45257 V!45257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39385)

(assert (=> b!1190882 (= lt!541476 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190883 () Bool)

(assert (=> b!1190883 (= e!676967 tp_is_empty!30097)))

(declare-fun b!1190884 () Bool)

(declare-fun res!792080 () Bool)

(assert (=> b!1190884 (=> (not res!792080) (not e!676966))))

(assert (=> b!1190884 (= res!792080 (= (select (arr!37110 _keys!1208) i!673) k0!934))))

(declare-fun b!1190885 () Bool)

(declare-fun res!792078 () Bool)

(assert (=> b!1190885 (=> (not res!792078) (not e!676966))))

(assert (=> b!1190885 (= res!792078 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37648 _keys!1208))))))

(declare-fun mapIsEmpty!46973 () Bool)

(assert (=> mapIsEmpty!46973 mapRes!46973))

(declare-fun b!1190886 () Bool)

(declare-fun res!792085 () Bool)

(assert (=> b!1190886 (=> (not res!792085) (not e!676965))))

(declare-datatypes ((List!26237 0))(
  ( (Nil!26234) (Cons!26233 (h!27442 (_ BitVec 64)) (t!38787 List!26237)) )
))
(declare-fun arrayNoDuplicates!0 (array!76920 (_ BitVec 32) List!26237) Bool)

(assert (=> b!1190886 (= res!792085 (arrayNoDuplicates!0 lt!541474 #b00000000000000000000000000000000 Nil!26234))))

(declare-fun b!1190887 () Bool)

(declare-fun res!792074 () Bool)

(assert (=> b!1190887 (=> (not res!792074) (not e!676966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190887 (= res!792074 (validMask!0 mask!1564))))

(declare-fun b!1190888 () Bool)

(declare-fun res!792081 () Bool)

(assert (=> b!1190888 (=> (not res!792081) (not e!676966))))

(assert (=> b!1190888 (= res!792081 (and (= (size!37647 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37648 _keys!1208) (size!37647 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190879 () Bool)

(declare-fun res!792079 () Bool)

(assert (=> b!1190879 (=> (not res!792079) (not e!676966))))

(assert (=> b!1190879 (= res!792079 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26234))))

(declare-fun res!792084 () Bool)

(assert (=> start!99982 (=> (not res!792084) (not e!676966))))

(assert (=> start!99982 (= res!792084 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37648 _keys!1208))))))

(assert (=> start!99982 e!676966))

(assert (=> start!99982 tp_is_empty!30097))

(declare-fun array_inv!28424 (array!76920) Bool)

(assert (=> start!99982 (array_inv!28424 _keys!1208)))

(assert (=> start!99982 true))

(assert (=> start!99982 tp!89414))

(declare-fun array_inv!28425 (array!76918) Bool)

(assert (=> start!99982 (and (array_inv!28425 _values!996) e!676970)))

(assert (= (and start!99982 res!792084) b!1190887))

(assert (= (and b!1190887 res!792074) b!1190888))

(assert (= (and b!1190888 res!792081) b!1190881))

(assert (= (and b!1190881 res!792077) b!1190879))

(assert (= (and b!1190879 res!792079) b!1190885))

(assert (= (and b!1190885 res!792078) b!1190875))

(assert (= (and b!1190875 res!792075) b!1190884))

(assert (= (and b!1190884 res!792080) b!1190880))

(assert (= (and b!1190880 res!792083) b!1190886))

(assert (= (and b!1190886 res!792085) b!1190877))

(assert (= (and b!1190877 (not res!792076)) b!1190878))

(assert (= (and b!1190878 (not res!792082)) b!1190882))

(assert (= (and b!1190876 condMapEmpty!46973) mapIsEmpty!46973))

(assert (= (and b!1190876 (not condMapEmpty!46973)) mapNonEmpty!46973))

(get-info :version)

(assert (= (and mapNonEmpty!46973 ((_ is ValueCellFull!14339) mapValue!46973)) b!1190883))

(assert (= (and b!1190876 ((_ is ValueCellFull!14339) mapDefault!46973)) b!1190874))

(assert (= start!99982 b!1190876))

(declare-fun b_lambda!20693 () Bool)

(assert (=> (not b_lambda!20693) (not b!1190878)))

(declare-fun t!38785 () Bool)

(declare-fun tb!10371 () Bool)

(assert (=> (and start!99982 (= defaultEntry!1004 defaultEntry!1004) t!38785) tb!10371))

(declare-fun result!21317 () Bool)

(assert (=> tb!10371 (= result!21317 tp_is_empty!30097)))

(assert (=> b!1190878 t!38785))

(declare-fun b_and!41981 () Bool)

(assert (= b_and!41979 (and (=> t!38785 result!21317) b_and!41981)))

(declare-fun m!1098899 () Bool)

(assert (=> mapNonEmpty!46973 m!1098899))

(declare-fun m!1098901 () Bool)

(assert (=> b!1190882 m!1098901))

(declare-fun m!1098903 () Bool)

(assert (=> b!1190882 m!1098903))

(assert (=> b!1190882 m!1098903))

(declare-fun m!1098905 () Bool)

(assert (=> b!1190882 m!1098905))

(declare-fun m!1098907 () Bool)

(assert (=> b!1190882 m!1098907))

(declare-fun m!1098909 () Bool)

(assert (=> b!1190880 m!1098909))

(declare-fun m!1098911 () Bool)

(assert (=> b!1190880 m!1098911))

(declare-fun m!1098913 () Bool)

(assert (=> b!1190879 m!1098913))

(declare-fun m!1098915 () Bool)

(assert (=> b!1190875 m!1098915))

(declare-fun m!1098917 () Bool)

(assert (=> start!99982 m!1098917))

(declare-fun m!1098919 () Bool)

(assert (=> start!99982 m!1098919))

(declare-fun m!1098921 () Bool)

(assert (=> b!1190886 m!1098921))

(declare-fun m!1098923 () Bool)

(assert (=> b!1190881 m!1098923))

(declare-fun m!1098925 () Bool)

(assert (=> b!1190877 m!1098925))

(declare-fun m!1098927 () Bool)

(assert (=> b!1190877 m!1098927))

(declare-fun m!1098929 () Bool)

(assert (=> b!1190887 m!1098929))

(declare-fun m!1098931 () Bool)

(assert (=> b!1190878 m!1098931))

(declare-fun m!1098933 () Bool)

(assert (=> b!1190878 m!1098933))

(declare-fun m!1098935 () Bool)

(assert (=> b!1190878 m!1098935))

(declare-fun m!1098937 () Bool)

(assert (=> b!1190878 m!1098937))

(declare-fun m!1098939 () Bool)

(assert (=> b!1190884 m!1098939))

(check-sat b_and!41981 (not mapNonEmpty!46973) tp_is_empty!30097 (not b!1190881) (not start!99982) (not b_next!25567) (not b!1190887) (not b!1190877) (not b!1190882) (not b!1190875) (not b!1190886) (not b!1190879) (not b!1190880) (not b_lambda!20693) (not b!1190878))
(check-sat b_and!41981 (not b_next!25567))
