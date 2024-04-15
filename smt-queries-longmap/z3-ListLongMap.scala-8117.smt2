; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99562 () Bool)

(assert start!99562)

(declare-fun b_free!25147 () Bool)

(declare-fun b_next!25147 () Bool)

(assert (=> start!99562 (= b_free!25147 (not b_next!25147))))

(declare-fun tp!88154 () Bool)

(declare-fun b_and!41139 () Bool)

(assert (=> start!99562 (= tp!88154 b_and!41139)))

(declare-fun mapIsEmpty!46343 () Bool)

(declare-fun mapRes!46343 () Bool)

(assert (=> mapIsEmpty!46343 mapRes!46343))

(declare-fun b!1178497 () Bool)

(declare-fun res!782933 () Bool)

(declare-fun e!669967 () Bool)

(assert (=> b!1178497 (=> (not res!782933) (not e!669967))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178497 (= res!782933 (validMask!0 mask!1564))))

(declare-fun b!1178498 () Bool)

(declare-fun e!669968 () Bool)

(declare-fun tp_is_empty!29677 () Bool)

(assert (=> b!1178498 (= e!669968 tp_is_empty!29677)))

(declare-fun b!1178499 () Bool)

(declare-fun res!782935 () Bool)

(assert (=> b!1178499 (=> (not res!782935) (not e!669967))))

(declare-datatypes ((array!76092 0))(
  ( (array!76093 (arr!36696 (Array (_ BitVec 32) (_ BitVec 64))) (size!37234 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76092)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1178499 (= res!782935 (= (select (arr!36696 _keys!1208) i!673) k0!934))))

(declare-fun b!1178500 () Bool)

(declare-fun res!782930 () Bool)

(assert (=> b!1178500 (=> (not res!782930) (not e!669967))))

(declare-datatypes ((List!25878 0))(
  ( (Nil!25875) (Cons!25874 (h!27083 (_ BitVec 64)) (t!38008 List!25878)) )
))
(declare-fun arrayNoDuplicates!0 (array!76092 (_ BitVec 32) List!25878) Bool)

(assert (=> b!1178500 (= res!782930 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25875))))

(declare-fun b!1178501 () Bool)

(declare-fun res!782927 () Bool)

(assert (=> b!1178501 (=> (not res!782927) (not e!669967))))

(assert (=> b!1178501 (= res!782927 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37234 _keys!1208))))))

(declare-fun b!1178502 () Bool)

(declare-fun res!782926 () Bool)

(declare-fun e!669975 () Bool)

(assert (=> b!1178502 (=> (not res!782926) (not e!669975))))

(declare-fun lt!532295 () array!76092)

(assert (=> b!1178502 (= res!782926 (arrayNoDuplicates!0 lt!532295 #b00000000000000000000000000000000 Nil!25875))))

(declare-fun b!1178503 () Bool)

(declare-fun res!782932 () Bool)

(assert (=> b!1178503 (=> (not res!782932) (not e!669967))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44697 0))(
  ( (V!44698 (val!14895 Int)) )
))
(declare-datatypes ((ValueCell!14129 0))(
  ( (ValueCellFull!14129 (v!17532 V!44697)) (EmptyCell!14129) )
))
(declare-datatypes ((array!76094 0))(
  ( (array!76095 (arr!36697 (Array (_ BitVec 32) ValueCell!14129)) (size!37235 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76094)

(assert (=> b!1178503 (= res!782932 (and (= (size!37235 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37234 _keys!1208) (size!37235 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178504 () Bool)

(declare-fun res!782925 () Bool)

(assert (=> b!1178504 (=> (not res!782925) (not e!669967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178504 (= res!782925 (validKeyInArray!0 k0!934))))

(declare-fun b!1178505 () Bool)

(declare-fun e!669969 () Bool)

(assert (=> b!1178505 (= e!669969 tp_is_empty!29677)))

(declare-fun b!1178506 () Bool)

(declare-fun res!782928 () Bool)

(assert (=> b!1178506 (=> (not res!782928) (not e!669967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76092 (_ BitVec 32)) Bool)

(assert (=> b!1178506 (= res!782928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!669971 () Bool)

(declare-datatypes ((tuple2!19172 0))(
  ( (tuple2!19173 (_1!9597 (_ BitVec 64)) (_2!9597 V!44697)) )
))
(declare-datatypes ((List!25879 0))(
  ( (Nil!25876) (Cons!25875 (h!27084 tuple2!19172) (t!38009 List!25879)) )
))
(declare-datatypes ((ListLongMap!17141 0))(
  ( (ListLongMap!17142 (toList!8586 List!25879)) )
))
(declare-fun lt!532294 () ListLongMap!17141)

(declare-fun b!1178507 () Bool)

(declare-fun lt!532290 () ListLongMap!17141)

(declare-fun lt!532293 () tuple2!19172)

(declare-fun +!3887 (ListLongMap!17141 tuple2!19172) ListLongMap!17141)

(assert (=> b!1178507 (= e!669971 (= lt!532290 (+!3887 lt!532294 lt!532293)))))

(declare-fun b!1178496 () Bool)

(declare-datatypes ((Unit!38780 0))(
  ( (Unit!38781) )
))
(declare-fun e!669964 () Unit!38780)

(declare-fun Unit!38782 () Unit!38780)

(assert (=> b!1178496 (= e!669964 Unit!38782)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!532291 () Unit!38780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76092 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38780)

(assert (=> b!1178496 (= lt!532291 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178496 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532296 () Unit!38780)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76092 (_ BitVec 32) (_ BitVec 32)) Unit!38780)

(assert (=> b!1178496 (= lt!532296 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178496 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25875)))

(declare-fun lt!532287 () Unit!38780)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76092 (_ BitVec 64) (_ BitVec 32) List!25878) Unit!38780)

(assert (=> b!1178496 (= lt!532287 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25875))))

(assert (=> b!1178496 false))

(declare-fun res!782931 () Bool)

(assert (=> start!99562 (=> (not res!782931) (not e!669967))))

(assert (=> start!99562 (= res!782931 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37234 _keys!1208))))))

(assert (=> start!99562 e!669967))

(assert (=> start!99562 tp_is_empty!29677))

(declare-fun array_inv!28132 (array!76092) Bool)

(assert (=> start!99562 (array_inv!28132 _keys!1208)))

(assert (=> start!99562 true))

(assert (=> start!99562 tp!88154))

(declare-fun e!669976 () Bool)

(declare-fun array_inv!28133 (array!76094) Bool)

(assert (=> start!99562 (and (array_inv!28133 _values!996) e!669976)))

(declare-fun mapNonEmpty!46343 () Bool)

(declare-fun tp!88155 () Bool)

(assert (=> mapNonEmpty!46343 (= mapRes!46343 (and tp!88155 e!669969))))

(declare-fun mapRest!46343 () (Array (_ BitVec 32) ValueCell!14129))

(declare-fun mapValue!46343 () ValueCell!14129)

(declare-fun mapKey!46343 () (_ BitVec 32))

(assert (=> mapNonEmpty!46343 (= (arr!36697 _values!996) (store mapRest!46343 mapKey!46343 mapValue!46343))))

(declare-fun b!1178508 () Bool)

(assert (=> b!1178508 (= e!669976 (and e!669968 mapRes!46343))))

(declare-fun condMapEmpty!46343 () Bool)

(declare-fun mapDefault!46343 () ValueCell!14129)

(assert (=> b!1178508 (= condMapEmpty!46343 (= (arr!36697 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14129)) mapDefault!46343)))))

(declare-fun b!1178509 () Bool)

(declare-fun e!669974 () Bool)

(declare-fun e!669970 () Bool)

(assert (=> b!1178509 (= e!669974 e!669970)))

(declare-fun res!782922 () Bool)

(assert (=> b!1178509 (=> res!782922 e!669970)))

(assert (=> b!1178509 (= res!782922 (not (= (select (arr!36696 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178510 () Bool)

(assert (=> b!1178510 (= e!669967 e!669975)))

(declare-fun res!782934 () Bool)

(assert (=> b!1178510 (=> (not res!782934) (not e!669975))))

(assert (=> b!1178510 (= res!782934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532295 mask!1564))))

(assert (=> b!1178510 (= lt!532295 (array!76093 (store (arr!36696 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37234 _keys!1208)))))

(declare-fun b!1178511 () Bool)

(declare-fun Unit!38783 () Unit!38780)

(assert (=> b!1178511 (= e!669964 Unit!38783)))

(declare-fun b!1178512 () Bool)

(declare-fun e!669972 () Bool)

(declare-fun e!669973 () Bool)

(assert (=> b!1178512 (= e!669972 e!669973)))

(declare-fun res!782923 () Bool)

(assert (=> b!1178512 (=> res!782923 e!669973)))

(assert (=> b!1178512 (= res!782923 (not (validKeyInArray!0 (select (arr!36696 _keys!1208) from!1455))))))

(declare-fun lt!532285 () ListLongMap!17141)

(declare-fun lt!532284 () ListLongMap!17141)

(assert (=> b!1178512 (= lt!532285 lt!532284)))

(declare-fun -!1554 (ListLongMap!17141 (_ BitVec 64)) ListLongMap!17141)

(assert (=> b!1178512 (= lt!532284 (-!1554 lt!532294 k0!934))))

(declare-fun zeroValue!944 () V!44697)

(declare-fun lt!532282 () array!76094)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44697)

(declare-fun getCurrentListMapNoExtraKeys!5047 (array!76092 array!76094 (_ BitVec 32) (_ BitVec 32) V!44697 V!44697 (_ BitVec 32) Int) ListLongMap!17141)

(assert (=> b!1178512 (= lt!532285 (getCurrentListMapNoExtraKeys!5047 lt!532295 lt!532282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178512 (= lt!532294 (getCurrentListMapNoExtraKeys!5047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532286 () Unit!38780)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!818 (array!76092 array!76094 (_ BitVec 32) (_ BitVec 32) V!44697 V!44697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38780)

(assert (=> b!1178512 (= lt!532286 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178513 () Bool)

(declare-fun e!669965 () Bool)

(assert (=> b!1178513 (= e!669975 (not e!669965))))

(declare-fun res!782921 () Bool)

(assert (=> b!1178513 (=> res!782921 e!669965)))

(assert (=> b!1178513 (= res!782921 (bvsgt from!1455 i!673))))

(assert (=> b!1178513 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532292 () Unit!38780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76092 (_ BitVec 64) (_ BitVec 32)) Unit!38780)

(assert (=> b!1178513 (= lt!532292 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178514 () Bool)

(assert (=> b!1178514 (= e!669970 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178515 () Bool)

(assert (=> b!1178515 (= e!669973 true)))

(assert (=> b!1178515 e!669971))

(declare-fun res!782920 () Bool)

(assert (=> b!1178515 (=> (not res!782920) (not e!669971))))

(assert (=> b!1178515 (= res!782920 (not (= (select (arr!36696 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532283 () Unit!38780)

(assert (=> b!1178515 (= lt!532283 e!669964)))

(declare-fun c!116818 () Bool)

(assert (=> b!1178515 (= c!116818 (= (select (arr!36696 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178515 e!669974))

(declare-fun res!782929 () Bool)

(assert (=> b!1178515 (=> (not res!782929) (not e!669974))))

(declare-fun lt!532289 () ListLongMap!17141)

(assert (=> b!1178515 (= res!782929 (= lt!532289 (+!3887 lt!532284 lt!532293)))))

(declare-fun lt!532288 () V!44697)

(declare-fun get!18762 (ValueCell!14129 V!44697) V!44697)

(assert (=> b!1178515 (= lt!532293 (tuple2!19173 (select (arr!36696 _keys!1208) from!1455) (get!18762 (select (arr!36697 _values!996) from!1455) lt!532288)))))

(declare-fun b!1178516 () Bool)

(assert (=> b!1178516 (= e!669965 e!669972)))

(declare-fun res!782924 () Bool)

(assert (=> b!1178516 (=> res!782924 e!669972)))

(assert (=> b!1178516 (= res!782924 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1178516 (= lt!532289 (getCurrentListMapNoExtraKeys!5047 lt!532295 lt!532282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178516 (= lt!532282 (array!76095 (store (arr!36697 _values!996) i!673 (ValueCellFull!14129 lt!532288)) (size!37235 _values!996)))))

(declare-fun dynLambda!2960 (Int (_ BitVec 64)) V!44697)

(assert (=> b!1178516 (= lt!532288 (dynLambda!2960 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178516 (= lt!532290 (getCurrentListMapNoExtraKeys!5047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99562 res!782931) b!1178497))

(assert (= (and b!1178497 res!782933) b!1178503))

(assert (= (and b!1178503 res!782932) b!1178506))

(assert (= (and b!1178506 res!782928) b!1178500))

(assert (= (and b!1178500 res!782930) b!1178501))

(assert (= (and b!1178501 res!782927) b!1178504))

(assert (= (and b!1178504 res!782925) b!1178499))

(assert (= (and b!1178499 res!782935) b!1178510))

(assert (= (and b!1178510 res!782934) b!1178502))

(assert (= (and b!1178502 res!782926) b!1178513))

(assert (= (and b!1178513 (not res!782921)) b!1178516))

(assert (= (and b!1178516 (not res!782924)) b!1178512))

(assert (= (and b!1178512 (not res!782923)) b!1178515))

(assert (= (and b!1178515 res!782929) b!1178509))

(assert (= (and b!1178509 (not res!782922)) b!1178514))

(assert (= (and b!1178515 c!116818) b!1178496))

(assert (= (and b!1178515 (not c!116818)) b!1178511))

(assert (= (and b!1178515 res!782920) b!1178507))

(assert (= (and b!1178508 condMapEmpty!46343) mapIsEmpty!46343))

(assert (= (and b!1178508 (not condMapEmpty!46343)) mapNonEmpty!46343))

(get-info :version)

(assert (= (and mapNonEmpty!46343 ((_ is ValueCellFull!14129) mapValue!46343)) b!1178505))

(assert (= (and b!1178508 ((_ is ValueCellFull!14129) mapDefault!46343)) b!1178498))

(assert (= start!99562 b!1178508))

(declare-fun b_lambda!20273 () Bool)

(assert (=> (not b_lambda!20273) (not b!1178516)))

(declare-fun t!38007 () Bool)

(declare-fun tb!9951 () Bool)

(assert (=> (and start!99562 (= defaultEntry!1004 defaultEntry!1004) t!38007) tb!9951))

(declare-fun result!20477 () Bool)

(assert (=> tb!9951 (= result!20477 tp_is_empty!29677)))

(assert (=> b!1178516 t!38007))

(declare-fun b_and!41141 () Bool)

(assert (= b_and!41139 (and (=> t!38007 result!20477) b_and!41141)))

(declare-fun m!1085975 () Bool)

(assert (=> b!1178509 m!1085975))

(declare-fun m!1085977 () Bool)

(assert (=> b!1178496 m!1085977))

(declare-fun m!1085979 () Bool)

(assert (=> b!1178496 m!1085979))

(declare-fun m!1085981 () Bool)

(assert (=> b!1178496 m!1085981))

(declare-fun m!1085983 () Bool)

(assert (=> b!1178496 m!1085983))

(declare-fun m!1085985 () Bool)

(assert (=> b!1178496 m!1085985))

(declare-fun m!1085987 () Bool)

(assert (=> b!1178504 m!1085987))

(declare-fun m!1085989 () Bool)

(assert (=> b!1178516 m!1085989))

(declare-fun m!1085991 () Bool)

(assert (=> b!1178516 m!1085991))

(declare-fun m!1085993 () Bool)

(assert (=> b!1178516 m!1085993))

(declare-fun m!1085995 () Bool)

(assert (=> b!1178516 m!1085995))

(declare-fun m!1085997 () Bool)

(assert (=> b!1178512 m!1085997))

(declare-fun m!1085999 () Bool)

(assert (=> b!1178512 m!1085999))

(declare-fun m!1086001 () Bool)

(assert (=> b!1178512 m!1086001))

(assert (=> b!1178512 m!1085975))

(declare-fun m!1086003 () Bool)

(assert (=> b!1178512 m!1086003))

(declare-fun m!1086005 () Bool)

(assert (=> b!1178512 m!1086005))

(assert (=> b!1178512 m!1085975))

(declare-fun m!1086007 () Bool)

(assert (=> b!1178506 m!1086007))

(assert (=> b!1178515 m!1085975))

(declare-fun m!1086009 () Bool)

(assert (=> b!1178515 m!1086009))

(declare-fun m!1086011 () Bool)

(assert (=> b!1178515 m!1086011))

(assert (=> b!1178515 m!1086011))

(declare-fun m!1086013 () Bool)

(assert (=> b!1178515 m!1086013))

(declare-fun m!1086015 () Bool)

(assert (=> b!1178502 m!1086015))

(declare-fun m!1086017 () Bool)

(assert (=> b!1178510 m!1086017))

(declare-fun m!1086019 () Bool)

(assert (=> b!1178510 m!1086019))

(declare-fun m!1086021 () Bool)

(assert (=> b!1178497 m!1086021))

(declare-fun m!1086023 () Bool)

(assert (=> b!1178499 m!1086023))

(declare-fun m!1086025 () Bool)

(assert (=> b!1178514 m!1086025))

(declare-fun m!1086027 () Bool)

(assert (=> start!99562 m!1086027))

(declare-fun m!1086029 () Bool)

(assert (=> start!99562 m!1086029))

(declare-fun m!1086031 () Bool)

(assert (=> b!1178507 m!1086031))

(declare-fun m!1086033 () Bool)

(assert (=> mapNonEmpty!46343 m!1086033))

(declare-fun m!1086035 () Bool)

(assert (=> b!1178500 m!1086035))

(declare-fun m!1086037 () Bool)

(assert (=> b!1178513 m!1086037))

(declare-fun m!1086039 () Bool)

(assert (=> b!1178513 m!1086039))

(check-sat tp_is_empty!29677 (not b!1178502) (not b!1178510) (not b!1178497) (not b!1178507) (not b!1178512) b_and!41141 (not mapNonEmpty!46343) (not b!1178496) (not b!1178516) (not b!1178500) (not b!1178504) (not b!1178506) (not b_next!25147) (not b!1178515) (not b!1178513) (not start!99562) (not b_lambda!20273) (not b!1178514))
(check-sat b_and!41141 (not b_next!25147))
