; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100032 () Bool)

(assert start!100032)

(declare-fun b_free!25375 () Bool)

(declare-fun b_next!25375 () Bool)

(assert (=> start!100032 (= b_free!25375 (not b_next!25375))))

(declare-fun tp!88838 () Bool)

(declare-fun b_and!41619 () Bool)

(assert (=> start!100032 (= tp!88838 b_and!41619)))

(declare-fun b!1187200 () Bool)

(declare-fun res!788855 () Bool)

(declare-fun e!675111 () Bool)

(assert (=> b!1187200 (=> (not res!788855) (not e!675111))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187200 (= res!788855 (validKeyInArray!0 k0!934))))

(declare-fun b!1187201 () Bool)

(declare-fun e!675117 () Bool)

(declare-fun tp_is_empty!29905 () Bool)

(assert (=> b!1187201 (= e!675117 tp_is_empty!29905)))

(declare-fun b!1187202 () Bool)

(declare-fun e!675121 () Bool)

(declare-fun e!675115 () Bool)

(assert (=> b!1187202 (= e!675121 e!675115)))

(declare-fun res!788860 () Bool)

(assert (=> b!1187202 (=> res!788860 e!675115)))

(declare-datatypes ((array!76655 0))(
  ( (array!76656 (arr!36971 (Array (_ BitVec 32) (_ BitVec 64))) (size!37508 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76655)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1187202 (= res!788860 (not (validKeyInArray!0 (select (arr!36971 _keys!1208) from!1455))))))

(declare-datatypes ((V!45001 0))(
  ( (V!45002 (val!15009 Int)) )
))
(declare-datatypes ((tuple2!19300 0))(
  ( (tuple2!19301 (_1!9661 (_ BitVec 64)) (_2!9661 V!45001)) )
))
(declare-datatypes ((List!26035 0))(
  ( (Nil!26032) (Cons!26031 (h!27249 tuple2!19300) (t!38394 List!26035)) )
))
(declare-datatypes ((ListLongMap!17277 0))(
  ( (ListLongMap!17278 (toList!8654 List!26035)) )
))
(declare-fun lt!538936 () ListLongMap!17277)

(declare-fun lt!538930 () ListLongMap!17277)

(assert (=> b!1187202 (= lt!538936 lt!538930)))

(declare-fun lt!538933 () ListLongMap!17277)

(declare-fun -!1674 (ListLongMap!17277 (_ BitVec 64)) ListLongMap!17277)

(assert (=> b!1187202 (= lt!538930 (-!1674 lt!538933 k0!934))))

(declare-fun zeroValue!944 () V!45001)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!45001)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14243 0))(
  ( (ValueCellFull!14243 (v!17643 V!45001)) (EmptyCell!14243) )
))
(declare-datatypes ((array!76657 0))(
  ( (array!76658 (arr!36972 (Array (_ BitVec 32) ValueCell!14243)) (size!37509 (_ BitVec 32))) )
))
(declare-fun lt!538931 () array!76657)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538938 () array!76655)

(declare-fun getCurrentListMapNoExtraKeys!5123 (array!76655 array!76657 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) Int) ListLongMap!17277)

(assert (=> b!1187202 (= lt!538936 (getCurrentListMapNoExtraKeys!5123 lt!538938 lt!538931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76657)

(assert (=> b!1187202 (= lt!538933 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39296 0))(
  ( (Unit!39297) )
))
(declare-fun lt!538941 () Unit!39296)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 (array!76655 array!76657 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39296)

(assert (=> b!1187202 (= lt!538941 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187203 () Bool)

(declare-fun res!788847 () Bool)

(assert (=> b!1187203 (=> (not res!788847) (not e!675111))))

(assert (=> b!1187203 (= res!788847 (= (select (arr!36971 _keys!1208) i!673) k0!934))))

(declare-fun b!1187204 () Bool)

(declare-fun res!788850 () Bool)

(declare-fun e!675112 () Bool)

(assert (=> b!1187204 (=> (not res!788850) (not e!675112))))

(declare-datatypes ((List!26036 0))(
  ( (Nil!26033) (Cons!26032 (h!27250 (_ BitVec 64)) (t!38395 List!26036)) )
))
(declare-fun arrayNoDuplicates!0 (array!76655 (_ BitVec 32) List!26036) Bool)

(assert (=> b!1187204 (= res!788850 (arrayNoDuplicates!0 lt!538938 #b00000000000000000000000000000000 Nil!26033))))

(declare-fun b!1187205 () Bool)

(declare-fun res!788853 () Bool)

(assert (=> b!1187205 (=> (not res!788853) (not e!675111))))

(assert (=> b!1187205 (= res!788853 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26033))))

(declare-fun b!1187206 () Bool)

(declare-fun e!675118 () Bool)

(declare-fun e!675120 () Bool)

(declare-fun mapRes!46685 () Bool)

(assert (=> b!1187206 (= e!675118 (and e!675120 mapRes!46685))))

(declare-fun condMapEmpty!46685 () Bool)

(declare-fun mapDefault!46685 () ValueCell!14243)

(assert (=> b!1187206 (= condMapEmpty!46685 (= (arr!36972 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14243)) mapDefault!46685)))))

(declare-fun b!1187207 () Bool)

(declare-fun e!675113 () Bool)

(assert (=> b!1187207 (= e!675112 (not e!675113))))

(declare-fun res!788849 () Bool)

(assert (=> b!1187207 (=> res!788849 e!675113)))

(assert (=> b!1187207 (= res!788849 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187207 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538925 () Unit!39296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76655 (_ BitVec 64) (_ BitVec 32)) Unit!39296)

(assert (=> b!1187207 (= lt!538925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187208 () Bool)

(declare-fun res!788859 () Bool)

(assert (=> b!1187208 (=> (not res!788859) (not e!675111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76655 (_ BitVec 32)) Bool)

(assert (=> b!1187208 (= res!788859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!788857 () Bool)

(assert (=> start!100032 (=> (not res!788857) (not e!675111))))

(assert (=> start!100032 (= res!788857 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37508 _keys!1208))))))

(assert (=> start!100032 e!675111))

(assert (=> start!100032 tp_is_empty!29905))

(declare-fun array_inv!28288 (array!76655) Bool)

(assert (=> start!100032 (array_inv!28288 _keys!1208)))

(assert (=> start!100032 true))

(assert (=> start!100032 tp!88838))

(declare-fun array_inv!28289 (array!76657) Bool)

(assert (=> start!100032 (and (array_inv!28289 _values!996) e!675118)))

(declare-fun b!1187209 () Bool)

(assert (=> b!1187209 (= e!675115 true)))

(declare-fun lt!538932 () ListLongMap!17277)

(declare-fun lt!538939 () ListLongMap!17277)

(assert (=> b!1187209 (= (-!1674 lt!538932 k0!934) lt!538939)))

(declare-fun lt!538935 () Unit!39296)

(declare-fun lt!538924 () V!45001)

(declare-fun addRemoveCommutativeForDiffKeys!187 (ListLongMap!17277 (_ BitVec 64) V!45001 (_ BitVec 64)) Unit!39296)

(assert (=> b!1187209 (= lt!538935 (addRemoveCommutativeForDiffKeys!187 lt!538933 (select (arr!36971 _keys!1208) from!1455) lt!538924 k0!934))))

(declare-fun lt!538940 () ListLongMap!17277)

(assert (=> b!1187209 (and (= lt!538940 lt!538932) (= lt!538930 lt!538936))))

(declare-fun lt!538927 () tuple2!19300)

(declare-fun +!3971 (ListLongMap!17277 tuple2!19300) ListLongMap!17277)

(assert (=> b!1187209 (= lt!538932 (+!3971 lt!538933 lt!538927))))

(assert (=> b!1187209 (not (= (select (arr!36971 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538926 () Unit!39296)

(declare-fun e!675114 () Unit!39296)

(assert (=> b!1187209 (= lt!538926 e!675114)))

(declare-fun c!117584 () Bool)

(assert (=> b!1187209 (= c!117584 (= (select (arr!36971 _keys!1208) from!1455) k0!934))))

(declare-fun e!675119 () Bool)

(assert (=> b!1187209 e!675119))

(declare-fun res!788852 () Bool)

(assert (=> b!1187209 (=> (not res!788852) (not e!675119))))

(declare-fun lt!538937 () ListLongMap!17277)

(assert (=> b!1187209 (= res!788852 (= lt!538937 lt!538939))))

(assert (=> b!1187209 (= lt!538939 (+!3971 lt!538930 lt!538927))))

(assert (=> b!1187209 (= lt!538927 (tuple2!19301 (select (arr!36971 _keys!1208) from!1455) lt!538924))))

(declare-fun lt!538942 () V!45001)

(declare-fun get!18974 (ValueCell!14243 V!45001) V!45001)

(assert (=> b!1187209 (= lt!538924 (get!18974 (select (arr!36972 _values!996) from!1455) lt!538942))))

(declare-fun b!1187210 () Bool)

(assert (=> b!1187210 (= e!675111 e!675112)))

(declare-fun res!788861 () Bool)

(assert (=> b!1187210 (=> (not res!788861) (not e!675112))))

(assert (=> b!1187210 (= res!788861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538938 mask!1564))))

(assert (=> b!1187210 (= lt!538938 (array!76656 (store (arr!36971 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37508 _keys!1208)))))

(declare-fun mapIsEmpty!46685 () Bool)

(assert (=> mapIsEmpty!46685 mapRes!46685))

(declare-fun b!1187211 () Bool)

(declare-fun Unit!39298 () Unit!39296)

(assert (=> b!1187211 (= e!675114 Unit!39298)))

(declare-fun b!1187212 () Bool)

(declare-fun Unit!39299 () Unit!39296)

(assert (=> b!1187212 (= e!675114 Unit!39299)))

(declare-fun lt!538928 () Unit!39296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39296)

(assert (=> b!1187212 (= lt!538928 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187212 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538929 () Unit!39296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76655 (_ BitVec 32) (_ BitVec 32)) Unit!39296)

(assert (=> b!1187212 (= lt!538929 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187212 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26033)))

(declare-fun lt!538934 () Unit!39296)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76655 (_ BitVec 64) (_ BitVec 32) List!26036) Unit!39296)

(assert (=> b!1187212 (= lt!538934 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26033))))

(assert (=> b!1187212 false))

(declare-fun b!1187213 () Bool)

(declare-fun e!675116 () Bool)

(assert (=> b!1187213 (= e!675119 e!675116)))

(declare-fun res!788854 () Bool)

(assert (=> b!1187213 (=> res!788854 e!675116)))

(assert (=> b!1187213 (= res!788854 (not (= (select (arr!36971 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187214 () Bool)

(assert (=> b!1187214 (= e!675113 e!675121)))

(declare-fun res!788851 () Bool)

(assert (=> b!1187214 (=> res!788851 e!675121)))

(assert (=> b!1187214 (= res!788851 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187214 (= lt!538937 (getCurrentListMapNoExtraKeys!5123 lt!538938 lt!538931 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187214 (= lt!538931 (array!76658 (store (arr!36972 _values!996) i!673 (ValueCellFull!14243 lt!538942)) (size!37509 _values!996)))))

(declare-fun dynLambda!3084 (Int (_ BitVec 64)) V!45001)

(assert (=> b!1187214 (= lt!538942 (dynLambda!3084 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187214 (= lt!538940 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187215 () Bool)

(declare-fun res!788858 () Bool)

(assert (=> b!1187215 (=> (not res!788858) (not e!675111))))

(assert (=> b!1187215 (= res!788858 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37508 _keys!1208))))))

(declare-fun mapNonEmpty!46685 () Bool)

(declare-fun tp!88839 () Bool)

(assert (=> mapNonEmpty!46685 (= mapRes!46685 (and tp!88839 e!675117))))

(declare-fun mapRest!46685 () (Array (_ BitVec 32) ValueCell!14243))

(declare-fun mapKey!46685 () (_ BitVec 32))

(declare-fun mapValue!46685 () ValueCell!14243)

(assert (=> mapNonEmpty!46685 (= (arr!36972 _values!996) (store mapRest!46685 mapKey!46685 mapValue!46685))))

(declare-fun b!1187216 () Bool)

(assert (=> b!1187216 (= e!675116 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187217 () Bool)

(declare-fun res!788848 () Bool)

(assert (=> b!1187217 (=> (not res!788848) (not e!675111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187217 (= res!788848 (validMask!0 mask!1564))))

(declare-fun b!1187218 () Bool)

(declare-fun res!788856 () Bool)

(assert (=> b!1187218 (=> (not res!788856) (not e!675111))))

(assert (=> b!1187218 (= res!788856 (and (= (size!37509 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37508 _keys!1208) (size!37509 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187219 () Bool)

(assert (=> b!1187219 (= e!675120 tp_is_empty!29905)))

(assert (= (and start!100032 res!788857) b!1187217))

(assert (= (and b!1187217 res!788848) b!1187218))

(assert (= (and b!1187218 res!788856) b!1187208))

(assert (= (and b!1187208 res!788859) b!1187205))

(assert (= (and b!1187205 res!788853) b!1187215))

(assert (= (and b!1187215 res!788858) b!1187200))

(assert (= (and b!1187200 res!788855) b!1187203))

(assert (= (and b!1187203 res!788847) b!1187210))

(assert (= (and b!1187210 res!788861) b!1187204))

(assert (= (and b!1187204 res!788850) b!1187207))

(assert (= (and b!1187207 (not res!788849)) b!1187214))

(assert (= (and b!1187214 (not res!788851)) b!1187202))

(assert (= (and b!1187202 (not res!788860)) b!1187209))

(assert (= (and b!1187209 res!788852) b!1187213))

(assert (= (and b!1187213 (not res!788854)) b!1187216))

(assert (= (and b!1187209 c!117584) b!1187212))

(assert (= (and b!1187209 (not c!117584)) b!1187211))

(assert (= (and b!1187206 condMapEmpty!46685) mapIsEmpty!46685))

(assert (= (and b!1187206 (not condMapEmpty!46685)) mapNonEmpty!46685))

(get-info :version)

(assert (= (and mapNonEmpty!46685 ((_ is ValueCellFull!14243) mapValue!46685)) b!1187201))

(assert (= (and b!1187206 ((_ is ValueCellFull!14243) mapDefault!46685)) b!1187219))

(assert (= start!100032 b!1187206))

(declare-fun b_lambda!20513 () Bool)

(assert (=> (not b_lambda!20513) (not b!1187214)))

(declare-fun t!38393 () Bool)

(declare-fun tb!10179 () Bool)

(assert (=> (and start!100032 (= defaultEntry!1004 defaultEntry!1004) t!38393) tb!10179))

(declare-fun result!20933 () Bool)

(assert (=> tb!10179 (= result!20933 tp_is_empty!29905)))

(assert (=> b!1187214 t!38393))

(declare-fun b_and!41621 () Bool)

(assert (= b_and!41619 (and (=> t!38393 result!20933) b_and!41621)))

(declare-fun m!1095957 () Bool)

(assert (=> b!1187205 m!1095957))

(declare-fun m!1095959 () Bool)

(assert (=> b!1187209 m!1095959))

(declare-fun m!1095961 () Bool)

(assert (=> b!1187209 m!1095961))

(assert (=> b!1187209 m!1095959))

(declare-fun m!1095963 () Bool)

(assert (=> b!1187209 m!1095963))

(declare-fun m!1095965 () Bool)

(assert (=> b!1187209 m!1095965))

(declare-fun m!1095967 () Bool)

(assert (=> b!1187209 m!1095967))

(declare-fun m!1095969 () Bool)

(assert (=> b!1187209 m!1095969))

(assert (=> b!1187209 m!1095963))

(declare-fun m!1095971 () Bool)

(assert (=> b!1187209 m!1095971))

(assert (=> b!1187213 m!1095963))

(declare-fun m!1095973 () Bool)

(assert (=> b!1187208 m!1095973))

(declare-fun m!1095975 () Bool)

(assert (=> b!1187200 m!1095975))

(declare-fun m!1095977 () Bool)

(assert (=> b!1187204 m!1095977))

(declare-fun m!1095979 () Bool)

(assert (=> b!1187210 m!1095979))

(declare-fun m!1095981 () Bool)

(assert (=> b!1187210 m!1095981))

(declare-fun m!1095983 () Bool)

(assert (=> b!1187212 m!1095983))

(declare-fun m!1095985 () Bool)

(assert (=> b!1187212 m!1095985))

(declare-fun m!1095987 () Bool)

(assert (=> b!1187212 m!1095987))

(declare-fun m!1095989 () Bool)

(assert (=> b!1187212 m!1095989))

(declare-fun m!1095991 () Bool)

(assert (=> b!1187212 m!1095991))

(declare-fun m!1095993 () Bool)

(assert (=> b!1187202 m!1095993))

(assert (=> b!1187202 m!1095963))

(declare-fun m!1095995 () Bool)

(assert (=> b!1187202 m!1095995))

(assert (=> b!1187202 m!1095963))

(declare-fun m!1095997 () Bool)

(assert (=> b!1187202 m!1095997))

(declare-fun m!1095999 () Bool)

(assert (=> b!1187202 m!1095999))

(declare-fun m!1096001 () Bool)

(assert (=> b!1187202 m!1096001))

(declare-fun m!1096003 () Bool)

(assert (=> b!1187203 m!1096003))

(declare-fun m!1096005 () Bool)

(assert (=> b!1187207 m!1096005))

(declare-fun m!1096007 () Bool)

(assert (=> b!1187207 m!1096007))

(declare-fun m!1096009 () Bool)

(assert (=> b!1187216 m!1096009))

(declare-fun m!1096011 () Bool)

(assert (=> b!1187217 m!1096011))

(declare-fun m!1096013 () Bool)

(assert (=> start!100032 m!1096013))

(declare-fun m!1096015 () Bool)

(assert (=> start!100032 m!1096015))

(declare-fun m!1096017 () Bool)

(assert (=> b!1187214 m!1096017))

(declare-fun m!1096019 () Bool)

(assert (=> b!1187214 m!1096019))

(declare-fun m!1096021 () Bool)

(assert (=> b!1187214 m!1096021))

(declare-fun m!1096023 () Bool)

(assert (=> b!1187214 m!1096023))

(declare-fun m!1096025 () Bool)

(assert (=> mapNonEmpty!46685 m!1096025))

(check-sat (not b!1187208) (not b!1187202) (not b!1187204) (not b!1187209) tp_is_empty!29905 (not b!1187210) (not b_lambda!20513) (not b!1187217) (not b!1187200) b_and!41621 (not b!1187212) (not b!1187205) (not mapNonEmpty!46685) (not b!1187214) (not b_next!25375) (not b!1187207) (not b!1187216) (not start!100032))
(check-sat b_and!41621 (not b_next!25375))
