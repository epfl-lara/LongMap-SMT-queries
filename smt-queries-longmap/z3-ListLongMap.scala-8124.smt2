; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99612 () Bool)

(assert start!99612)

(declare-fun b_free!25191 () Bool)

(declare-fun b_next!25191 () Bool)

(assert (=> start!99612 (= b_free!25191 (not b_next!25191))))

(declare-fun tp!88287 () Bool)

(declare-fun b_and!41249 () Bool)

(assert (=> start!99612 (= tp!88287 b_and!41249)))

(declare-fun b!1180073 () Bool)

(declare-fun e!670906 () Bool)

(declare-fun e!670900 () Bool)

(declare-fun mapRes!46409 () Bool)

(assert (=> b!1180073 (= e!670906 (and e!670900 mapRes!46409))))

(declare-fun condMapEmpty!46409 () Bool)

(declare-datatypes ((V!44755 0))(
  ( (V!44756 (val!14917 Int)) )
))
(declare-datatypes ((ValueCell!14151 0))(
  ( (ValueCellFull!14151 (v!17555 V!44755)) (EmptyCell!14151) )
))
(declare-datatypes ((array!76245 0))(
  ( (array!76246 (arr!36772 (Array (_ BitVec 32) ValueCell!14151)) (size!37308 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76245)

(declare-fun mapDefault!46409 () ValueCell!14151)

(assert (=> b!1180073 (= condMapEmpty!46409 (= (arr!36772 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14151)) mapDefault!46409)))))

(declare-fun res!784073 () Bool)

(declare-fun e!670907 () Bool)

(assert (=> start!99612 (=> (not res!784073) (not e!670907))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76247 0))(
  ( (array!76248 (arr!36773 (Array (_ BitVec 32) (_ BitVec 64))) (size!37309 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76247)

(assert (=> start!99612 (= res!784073 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37309 _keys!1208))))))

(assert (=> start!99612 e!670907))

(declare-fun tp_is_empty!29721 () Bool)

(assert (=> start!99612 tp_is_empty!29721))

(declare-fun array_inv!28078 (array!76247) Bool)

(assert (=> start!99612 (array_inv!28078 _keys!1208)))

(assert (=> start!99612 true))

(assert (=> start!99612 tp!88287))

(declare-fun array_inv!28079 (array!76245) Bool)

(assert (=> start!99612 (and (array_inv!28079 _values!996) e!670906)))

(declare-fun b!1180074 () Bool)

(declare-fun res!784071 () Bool)

(declare-fun e!670904 () Bool)

(assert (=> b!1180074 (=> (not res!784071) (not e!670904))))

(declare-datatypes ((tuple2!19100 0))(
  ( (tuple2!19101 (_1!9561 (_ BitVec 64)) (_2!9561 V!44755)) )
))
(declare-datatypes ((List!25838 0))(
  ( (Nil!25835) (Cons!25834 (h!27043 tuple2!19100) (t!38021 List!25838)) )
))
(declare-datatypes ((ListLongMap!17069 0))(
  ( (ListLongMap!17070 (toList!8550 List!25838)) )
))
(declare-fun lt!533466 () ListLongMap!17069)

(declare-fun lt!533467 () ListLongMap!17069)

(declare-fun lt!533471 () tuple2!19100)

(declare-fun +!3861 (ListLongMap!17069 tuple2!19100) ListLongMap!17069)

(assert (=> b!1180074 (= res!784071 (= lt!533466 (+!3861 lt!533467 lt!533471)))))

(declare-fun b!1180075 () Bool)

(declare-fun e!670902 () Bool)

(assert (=> b!1180075 (= e!670902 tp_is_empty!29721)))

(declare-fun b!1180076 () Bool)

(declare-fun res!784081 () Bool)

(assert (=> b!1180076 (=> (not res!784081) (not e!670907))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76247 (_ BitVec 32)) Bool)

(assert (=> b!1180076 (= res!784081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180077 () Bool)

(declare-fun lt!533469 () ListLongMap!17069)

(declare-fun lt!533475 () ListLongMap!17069)

(assert (=> b!1180077 (= e!670904 (= lt!533469 lt!533475))))

(declare-fun b!1180078 () Bool)

(declare-fun e!670911 () Bool)

(declare-fun e!670908 () Bool)

(assert (=> b!1180078 (= e!670911 e!670908)))

(declare-fun res!784067 () Bool)

(assert (=> b!1180078 (=> res!784067 e!670908)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180078 (= res!784067 (not (= (select (arr!36773 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180079 () Bool)

(declare-fun res!784072 () Bool)

(assert (=> b!1180079 (=> (not res!784072) (not e!670907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180079 (= res!784072 (validKeyInArray!0 k0!934))))

(declare-fun b!1180080 () Bool)

(declare-fun e!670901 () Bool)

(declare-fun e!670910 () Bool)

(assert (=> b!1180080 (= e!670901 e!670910)))

(declare-fun res!784068 () Bool)

(assert (=> b!1180080 (=> res!784068 e!670910)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180080 (= res!784068 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44755)

(declare-fun lt!533470 () array!76247)

(declare-fun lt!533464 () array!76245)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44755)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!533474 () ListLongMap!17069)

(declare-fun getCurrentListMapNoExtraKeys!5004 (array!76247 array!76245 (_ BitVec 32) (_ BitVec 32) V!44755 V!44755 (_ BitVec 32) Int) ListLongMap!17069)

(assert (=> b!1180080 (= lt!533474 (getCurrentListMapNoExtraKeys!5004 lt!533470 lt!533464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533478 () V!44755)

(assert (=> b!1180080 (= lt!533464 (array!76246 (store (arr!36772 _values!996) i!673 (ValueCellFull!14151 lt!533478)) (size!37308 _values!996)))))

(declare-fun dynLambda!2964 (Int (_ BitVec 64)) V!44755)

(assert (=> b!1180080 (= lt!533478 (dynLambda!2964 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180080 (= lt!533466 (getCurrentListMapNoExtraKeys!5004 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180081 () Bool)

(declare-fun res!784066 () Bool)

(assert (=> b!1180081 (=> (not res!784066) (not e!670907))))

(assert (=> b!1180081 (= res!784066 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37309 _keys!1208))))))

(declare-fun b!1180082 () Bool)

(declare-fun e!670912 () Bool)

(assert (=> b!1180082 (= e!670907 e!670912)))

(declare-fun res!784080 () Bool)

(assert (=> b!1180082 (=> (not res!784080) (not e!670912))))

(assert (=> b!1180082 (= res!784080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533470 mask!1564))))

(assert (=> b!1180082 (= lt!533470 (array!76248 (store (arr!36773 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37309 _keys!1208)))))

(declare-fun b!1180083 () Bool)

(declare-fun e!670909 () Bool)

(assert (=> b!1180083 (= e!670909 true)))

(assert (=> b!1180083 e!670904))

(declare-fun res!784079 () Bool)

(assert (=> b!1180083 (=> (not res!784079) (not e!670904))))

(assert (=> b!1180083 (= res!784079 (not (= (select (arr!36773 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39003 0))(
  ( (Unit!39004) )
))
(declare-fun lt!533473 () Unit!39003)

(declare-fun e!670903 () Unit!39003)

(assert (=> b!1180083 (= lt!533473 e!670903)))

(declare-fun c!116910 () Bool)

(assert (=> b!1180083 (= c!116910 (= (select (arr!36773 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180083 e!670911))

(declare-fun res!784077 () Bool)

(assert (=> b!1180083 (=> (not res!784077) (not e!670911))))

(assert (=> b!1180083 (= res!784077 (= lt!533474 (+!3861 lt!533469 lt!533471)))))

(declare-fun get!18802 (ValueCell!14151 V!44755) V!44755)

(assert (=> b!1180083 (= lt!533471 (tuple2!19101 (select (arr!36773 _keys!1208) from!1455) (get!18802 (select (arr!36772 _values!996) from!1455) lt!533478)))))

(declare-fun b!1180084 () Bool)

(declare-fun res!784078 () Bool)

(assert (=> b!1180084 (=> (not res!784078) (not e!670907))))

(assert (=> b!1180084 (= res!784078 (and (= (size!37308 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37309 _keys!1208) (size!37308 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180085 () Bool)

(declare-fun res!784076 () Bool)

(assert (=> b!1180085 (=> (not res!784076) (not e!670907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180085 (= res!784076 (validMask!0 mask!1564))))

(declare-fun b!1180086 () Bool)

(declare-fun Unit!39005 () Unit!39003)

(assert (=> b!1180086 (= e!670903 Unit!39005)))

(declare-fun lt!533472 () Unit!39003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39003)

(assert (=> b!1180086 (= lt!533472 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180086 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533476 () Unit!39003)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76247 (_ BitVec 32) (_ BitVec 32)) Unit!39003)

(assert (=> b!1180086 (= lt!533476 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25839 0))(
  ( (Nil!25836) (Cons!25835 (h!27044 (_ BitVec 64)) (t!38022 List!25839)) )
))
(declare-fun arrayNoDuplicates!0 (array!76247 (_ BitVec 32) List!25839) Bool)

(assert (=> b!1180086 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25836)))

(declare-fun lt!533477 () Unit!39003)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76247 (_ BitVec 64) (_ BitVec 32) List!25839) Unit!39003)

(assert (=> b!1180086 (= lt!533477 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25836))))

(assert (=> b!1180086 false))

(declare-fun mapNonEmpty!46409 () Bool)

(declare-fun tp!88286 () Bool)

(assert (=> mapNonEmpty!46409 (= mapRes!46409 (and tp!88286 e!670902))))

(declare-fun mapKey!46409 () (_ BitVec 32))

(declare-fun mapValue!46409 () ValueCell!14151)

(declare-fun mapRest!46409 () (Array (_ BitVec 32) ValueCell!14151))

(assert (=> mapNonEmpty!46409 (= (arr!36772 _values!996) (store mapRest!46409 mapKey!46409 mapValue!46409))))

(declare-fun b!1180087 () Bool)

(declare-fun res!784069 () Bool)

(assert (=> b!1180087 (=> (not res!784069) (not e!670912))))

(assert (=> b!1180087 (= res!784069 (arrayNoDuplicates!0 lt!533470 #b00000000000000000000000000000000 Nil!25836))))

(declare-fun b!1180088 () Bool)

(declare-fun Unit!39006 () Unit!39003)

(assert (=> b!1180088 (= e!670903 Unit!39006)))

(declare-fun b!1180089 () Bool)

(assert (=> b!1180089 (= e!670910 e!670909)))

(declare-fun res!784070 () Bool)

(assert (=> b!1180089 (=> res!784070 e!670909)))

(assert (=> b!1180089 (= res!784070 (not (validKeyInArray!0 (select (arr!36773 _keys!1208) from!1455))))))

(assert (=> b!1180089 (= lt!533475 lt!533469)))

(declare-fun -!1592 (ListLongMap!17069 (_ BitVec 64)) ListLongMap!17069)

(assert (=> b!1180089 (= lt!533469 (-!1592 lt!533467 k0!934))))

(assert (=> b!1180089 (= lt!533475 (getCurrentListMapNoExtraKeys!5004 lt!533470 lt!533464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180089 (= lt!533467 (getCurrentListMapNoExtraKeys!5004 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533465 () Unit!39003)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!819 (array!76247 array!76245 (_ BitVec 32) (_ BitVec 32) V!44755 V!44755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39003)

(assert (=> b!1180089 (= lt!533465 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!819 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180090 () Bool)

(assert (=> b!1180090 (= e!670900 tp_is_empty!29721)))

(declare-fun b!1180091 () Bool)

(declare-fun res!784065 () Bool)

(assert (=> b!1180091 (=> (not res!784065) (not e!670907))))

(assert (=> b!1180091 (= res!784065 (= (select (arr!36773 _keys!1208) i!673) k0!934))))

(declare-fun b!1180092 () Bool)

(declare-fun res!784075 () Bool)

(assert (=> b!1180092 (=> (not res!784075) (not e!670907))))

(assert (=> b!1180092 (= res!784075 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25836))))

(declare-fun b!1180093 () Bool)

(assert (=> b!1180093 (= e!670908 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46409 () Bool)

(assert (=> mapIsEmpty!46409 mapRes!46409))

(declare-fun b!1180094 () Bool)

(assert (=> b!1180094 (= e!670912 (not e!670901))))

(declare-fun res!784074 () Bool)

(assert (=> b!1180094 (=> res!784074 e!670901)))

(assert (=> b!1180094 (= res!784074 (bvsgt from!1455 i!673))))

(assert (=> b!1180094 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533468 () Unit!39003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76247 (_ BitVec 64) (_ BitVec 32)) Unit!39003)

(assert (=> b!1180094 (= lt!533468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99612 res!784073) b!1180085))

(assert (= (and b!1180085 res!784076) b!1180084))

(assert (= (and b!1180084 res!784078) b!1180076))

(assert (= (and b!1180076 res!784081) b!1180092))

(assert (= (and b!1180092 res!784075) b!1180081))

(assert (= (and b!1180081 res!784066) b!1180079))

(assert (= (and b!1180079 res!784072) b!1180091))

(assert (= (and b!1180091 res!784065) b!1180082))

(assert (= (and b!1180082 res!784080) b!1180087))

(assert (= (and b!1180087 res!784069) b!1180094))

(assert (= (and b!1180094 (not res!784074)) b!1180080))

(assert (= (and b!1180080 (not res!784068)) b!1180089))

(assert (= (and b!1180089 (not res!784070)) b!1180083))

(assert (= (and b!1180083 res!784077) b!1180078))

(assert (= (and b!1180078 (not res!784067)) b!1180093))

(assert (= (and b!1180083 c!116910) b!1180086))

(assert (= (and b!1180083 (not c!116910)) b!1180088))

(assert (= (and b!1180083 res!784079) b!1180074))

(assert (= (and b!1180074 res!784071) b!1180077))

(assert (= (and b!1180073 condMapEmpty!46409) mapIsEmpty!46409))

(assert (= (and b!1180073 (not condMapEmpty!46409)) mapNonEmpty!46409))

(get-info :version)

(assert (= (and mapNonEmpty!46409 ((_ is ValueCellFull!14151) mapValue!46409)) b!1180075))

(assert (= (and b!1180073 ((_ is ValueCellFull!14151) mapDefault!46409)) b!1180090))

(assert (= start!99612 b!1180073))

(declare-fun b_lambda!20335 () Bool)

(assert (=> (not b_lambda!20335) (not b!1180080)))

(declare-fun t!38020 () Bool)

(declare-fun tb!10003 () Bool)

(assert (=> (and start!99612 (= defaultEntry!1004 defaultEntry!1004) t!38020) tb!10003))

(declare-fun result!20573 () Bool)

(assert (=> tb!10003 (= result!20573 tp_is_empty!29721)))

(assert (=> b!1180080 t!38020))

(declare-fun b_and!41251 () Bool)

(assert (= b_and!41249 (and (=> t!38020 result!20573) b_and!41251)))

(declare-fun m!1088037 () Bool)

(assert (=> b!1180094 m!1088037))

(declare-fun m!1088039 () Bool)

(assert (=> b!1180094 m!1088039))

(declare-fun m!1088041 () Bool)

(assert (=> b!1180093 m!1088041))

(declare-fun m!1088043 () Bool)

(assert (=> b!1180082 m!1088043))

(declare-fun m!1088045 () Bool)

(assert (=> b!1180082 m!1088045))

(declare-fun m!1088047 () Bool)

(assert (=> b!1180087 m!1088047))

(declare-fun m!1088049 () Bool)

(assert (=> b!1180076 m!1088049))

(declare-fun m!1088051 () Bool)

(assert (=> b!1180085 m!1088051))

(declare-fun m!1088053 () Bool)

(assert (=> b!1180074 m!1088053))

(declare-fun m!1088055 () Bool)

(assert (=> b!1180086 m!1088055))

(declare-fun m!1088057 () Bool)

(assert (=> b!1180086 m!1088057))

(declare-fun m!1088059 () Bool)

(assert (=> b!1180086 m!1088059))

(declare-fun m!1088061 () Bool)

(assert (=> b!1180086 m!1088061))

(declare-fun m!1088063 () Bool)

(assert (=> b!1180086 m!1088063))

(declare-fun m!1088065 () Bool)

(assert (=> b!1180089 m!1088065))

(declare-fun m!1088067 () Bool)

(assert (=> b!1180089 m!1088067))

(declare-fun m!1088069 () Bool)

(assert (=> b!1180089 m!1088069))

(declare-fun m!1088071 () Bool)

(assert (=> b!1180089 m!1088071))

(declare-fun m!1088073 () Bool)

(assert (=> b!1180089 m!1088073))

(assert (=> b!1180089 m!1088071))

(declare-fun m!1088075 () Bool)

(assert (=> b!1180089 m!1088075))

(assert (=> b!1180078 m!1088071))

(declare-fun m!1088077 () Bool)

(assert (=> b!1180079 m!1088077))

(declare-fun m!1088079 () Bool)

(assert (=> mapNonEmpty!46409 m!1088079))

(declare-fun m!1088081 () Bool)

(assert (=> b!1180092 m!1088081))

(declare-fun m!1088083 () Bool)

(assert (=> b!1180091 m!1088083))

(declare-fun m!1088085 () Bool)

(assert (=> b!1180080 m!1088085))

(declare-fun m!1088087 () Bool)

(assert (=> b!1180080 m!1088087))

(declare-fun m!1088089 () Bool)

(assert (=> b!1180080 m!1088089))

(declare-fun m!1088091 () Bool)

(assert (=> b!1180080 m!1088091))

(assert (=> b!1180083 m!1088071))

(declare-fun m!1088093 () Bool)

(assert (=> b!1180083 m!1088093))

(declare-fun m!1088095 () Bool)

(assert (=> b!1180083 m!1088095))

(assert (=> b!1180083 m!1088095))

(declare-fun m!1088097 () Bool)

(assert (=> b!1180083 m!1088097))

(declare-fun m!1088099 () Bool)

(assert (=> start!99612 m!1088099))

(declare-fun m!1088101 () Bool)

(assert (=> start!99612 m!1088101))

(check-sat (not b!1180079) tp_is_empty!29721 (not b!1180087) (not b!1180085) (not b!1180092) (not b!1180080) (not b!1180094) (not mapNonEmpty!46409) (not b!1180082) (not start!99612) (not b!1180083) (not b!1180086) (not b!1180093) (not b_lambda!20335) (not b!1180074) (not b!1180089) (not b_next!25191) (not b!1180076) b_and!41251)
(check-sat b_and!41251 (not b_next!25191))
