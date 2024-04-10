; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101544 () Bool)

(assert start!101544)

(declare-fun b_free!26331 () Bool)

(declare-fun b_next!26331 () Bool)

(assert (=> start!101544 (= b_free!26331 (not b_next!26331))))

(declare-fun tp!92029 () Bool)

(declare-fun b_and!43869 () Bool)

(assert (=> start!101544 (= tp!92029 b_and!43869)))

(declare-fun b!1221119 () Bool)

(declare-fun e!693430 () Bool)

(declare-fun e!693433 () Bool)

(assert (=> b!1221119 (= e!693430 e!693433)))

(declare-fun res!811235 () Bool)

(assert (=> b!1221119 (=> res!811235 e!693433)))

(declare-datatypes ((array!78849 0))(
  ( (array!78850 (arr!38054 (Array (_ BitVec 32) (_ BitVec 64))) (size!38590 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78849)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221119 (= res!811235 (or (bvsge (size!38590 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)) (bvsge from!1455 (size!38590 _keys!1208))))))

(declare-datatypes ((List!26853 0))(
  ( (Nil!26850) (Cons!26849 (h!28058 (_ BitVec 64)) (t!40164 List!26853)) )
))
(declare-fun arrayNoDuplicates!0 (array!78849 (_ BitVec 32) List!26853) Bool)

(assert (=> b!1221119 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26850)))

(declare-datatypes ((Unit!40456 0))(
  ( (Unit!40457) )
))
(declare-fun lt!555421 () Unit!40456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78849 (_ BitVec 32) (_ BitVec 32)) Unit!40456)

(assert (=> b!1221119 (= lt!555421 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221119 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!555419 () Unit!40456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78849 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40456)

(assert (=> b!1221119 (= lt!555419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221120 () Bool)

(declare-fun e!693434 () Bool)

(declare-fun e!693436 () Bool)

(assert (=> b!1221120 (= e!693434 e!693436)))

(declare-fun res!811242 () Bool)

(assert (=> b!1221120 (=> res!811242 e!693436)))

(assert (=> b!1221120 (= res!811242 (not (= (select (arr!38054 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221121 () Bool)

(declare-fun e!693426 () Bool)

(declare-fun e!693427 () Bool)

(assert (=> b!1221121 (= e!693426 e!693427)))

(declare-fun res!811246 () Bool)

(assert (=> b!1221121 (=> (not res!811246) (not e!693427))))

(declare-fun lt!555415 () array!78849)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78849 (_ BitVec 32)) Bool)

(assert (=> b!1221121 (= res!811246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555415 mask!1564))))

(assert (=> b!1221121 (= lt!555415 (array!78850 (store (arr!38054 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38590 _keys!1208)))))

(declare-fun b!1221122 () Bool)

(declare-fun e!693424 () Bool)

(declare-fun tp_is_empty!31035 () Bool)

(assert (=> b!1221122 (= e!693424 tp_is_empty!31035)))

(declare-fun b!1221123 () Bool)

(declare-fun noDuplicate!1630 (List!26853) Bool)

(assert (=> b!1221123 (= e!693433 (noDuplicate!1630 Nil!26850))))

(declare-fun b!1221124 () Bool)

(declare-fun e!693428 () Bool)

(declare-fun e!693429 () Bool)

(declare-fun mapRes!48442 () Bool)

(assert (=> b!1221124 (= e!693428 (and e!693429 mapRes!48442))))

(declare-fun condMapEmpty!48442 () Bool)

(declare-datatypes ((V!46507 0))(
  ( (V!46508 (val!15574 Int)) )
))
(declare-datatypes ((ValueCell!14808 0))(
  ( (ValueCellFull!14808 (v!18232 V!46507)) (EmptyCell!14808) )
))
(declare-datatypes ((array!78851 0))(
  ( (array!78852 (arr!38055 (Array (_ BitVec 32) ValueCell!14808)) (size!38591 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78851)

(declare-fun mapDefault!48442 () ValueCell!14808)

(assert (=> b!1221124 (= condMapEmpty!48442 (= (arr!38055 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14808)) mapDefault!48442)))))

(declare-fun b!1221125 () Bool)

(declare-fun res!811233 () Bool)

(assert (=> b!1221125 (=> (not res!811233) (not e!693426))))

(assert (=> b!1221125 (= res!811233 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26850))))

(declare-fun b!1221126 () Bool)

(assert (=> b!1221126 (= e!693436 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221127 () Bool)

(declare-fun res!811234 () Bool)

(assert (=> b!1221127 (=> (not res!811234) (not e!693426))))

(assert (=> b!1221127 (= res!811234 (= (select (arr!38054 _keys!1208) i!673) k0!934))))

(declare-fun res!811239 () Bool)

(assert (=> start!101544 (=> (not res!811239) (not e!693426))))

(assert (=> start!101544 (= res!811239 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38590 _keys!1208))))))

(assert (=> start!101544 e!693426))

(assert (=> start!101544 tp_is_empty!31035))

(declare-fun array_inv!28954 (array!78849) Bool)

(assert (=> start!101544 (array_inv!28954 _keys!1208)))

(assert (=> start!101544 true))

(assert (=> start!101544 tp!92029))

(declare-fun array_inv!28955 (array!78851) Bool)

(assert (=> start!101544 (and (array_inv!28955 _values!996) e!693428)))

(declare-fun b!1221128 () Bool)

(declare-fun e!693425 () Bool)

(declare-fun e!693432 () Bool)

(assert (=> b!1221128 (= e!693425 e!693432)))

(declare-fun res!811236 () Bool)

(assert (=> b!1221128 (=> res!811236 e!693432)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221128 (= res!811236 (not (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20052 0))(
  ( (tuple2!20053 (_1!10037 (_ BitVec 64)) (_2!10037 V!46507)) )
))
(declare-datatypes ((List!26854 0))(
  ( (Nil!26851) (Cons!26850 (h!28059 tuple2!20052) (t!40165 List!26854)) )
))
(declare-datatypes ((ListLongMap!18021 0))(
  ( (ListLongMap!18022 (toList!9026 List!26854)) )
))
(declare-fun lt!555418 () ListLongMap!18021)

(declare-fun lt!555416 () ListLongMap!18021)

(assert (=> b!1221128 (= lt!555418 lt!555416)))

(declare-fun lt!555422 () ListLongMap!18021)

(declare-fun -!1933 (ListLongMap!18021 (_ BitVec 64)) ListLongMap!18021)

(assert (=> b!1221128 (= lt!555416 (-!1933 lt!555422 k0!934))))

(declare-fun zeroValue!944 () V!46507)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555412 () array!78851)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46507)

(declare-fun getCurrentListMapNoExtraKeys!5448 (array!78849 array!78851 (_ BitVec 32) (_ BitVec 32) V!46507 V!46507 (_ BitVec 32) Int) ListLongMap!18021)

(assert (=> b!1221128 (= lt!555418 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221128 (= lt!555422 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555413 () Unit!40456)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 (array!78849 array!78851 (_ BitVec 32) (_ BitVec 32) V!46507 V!46507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40456)

(assert (=> b!1221128 (= lt!555413 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221129 () Bool)

(declare-fun res!811241 () Bool)

(assert (=> b!1221129 (=> (not res!811241) (not e!693426))))

(assert (=> b!1221129 (= res!811241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48442 () Bool)

(declare-fun tp!92030 () Bool)

(assert (=> mapNonEmpty!48442 (= mapRes!48442 (and tp!92030 e!693424))))

(declare-fun mapValue!48442 () ValueCell!14808)

(declare-fun mapRest!48442 () (Array (_ BitVec 32) ValueCell!14808))

(declare-fun mapKey!48442 () (_ BitVec 32))

(assert (=> mapNonEmpty!48442 (= (arr!38055 _values!996) (store mapRest!48442 mapKey!48442 mapValue!48442))))

(declare-fun b!1221130 () Bool)

(declare-fun res!811248 () Bool)

(assert (=> b!1221130 (=> (not res!811248) (not e!693426))))

(assert (=> b!1221130 (= res!811248 (and (= (size!38591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38590 _keys!1208) (size!38591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48442 () Bool)

(assert (=> mapIsEmpty!48442 mapRes!48442))

(declare-fun b!1221131 () Bool)

(assert (=> b!1221131 (= e!693429 tp_is_empty!31035)))

(declare-fun b!1221132 () Bool)

(declare-fun e!693431 () Bool)

(assert (=> b!1221132 (= e!693427 (not e!693431))))

(declare-fun res!811232 () Bool)

(assert (=> b!1221132 (=> res!811232 e!693431)))

(assert (=> b!1221132 (= res!811232 (bvsgt from!1455 i!673))))

(assert (=> b!1221132 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555414 () Unit!40456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78849 (_ BitVec 64) (_ BitVec 32)) Unit!40456)

(assert (=> b!1221132 (= lt!555414 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221133 () Bool)

(declare-fun res!811237 () Bool)

(assert (=> b!1221133 (=> (not res!811237) (not e!693426))))

(assert (=> b!1221133 (= res!811237 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38590 _keys!1208))))))

(declare-fun b!1221134 () Bool)

(assert (=> b!1221134 (= e!693432 e!693430)))

(declare-fun res!811238 () Bool)

(assert (=> b!1221134 (=> res!811238 e!693430)))

(assert (=> b!1221134 (= res!811238 (not (= (select (arr!38054 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1221134 e!693434))

(declare-fun res!811244 () Bool)

(assert (=> b!1221134 (=> (not res!811244) (not e!693434))))

(declare-fun lt!555423 () V!46507)

(declare-fun lt!555417 () ListLongMap!18021)

(declare-fun +!4091 (ListLongMap!18021 tuple2!20052) ListLongMap!18021)

(declare-fun get!19418 (ValueCell!14808 V!46507) V!46507)

(assert (=> b!1221134 (= res!811244 (= lt!555417 (+!4091 lt!555416 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))))))

(declare-fun b!1221135 () Bool)

(declare-fun res!811245 () Bool)

(assert (=> b!1221135 (=> (not res!811245) (not e!693426))))

(assert (=> b!1221135 (= res!811245 (validKeyInArray!0 k0!934))))

(declare-fun b!1221136 () Bool)

(declare-fun res!811243 () Bool)

(assert (=> b!1221136 (=> (not res!811243) (not e!693427))))

(assert (=> b!1221136 (= res!811243 (arrayNoDuplicates!0 lt!555415 #b00000000000000000000000000000000 Nil!26850))))

(declare-fun b!1221137 () Bool)

(declare-fun res!811247 () Bool)

(assert (=> b!1221137 (=> (not res!811247) (not e!693426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221137 (= res!811247 (validMask!0 mask!1564))))

(declare-fun b!1221138 () Bool)

(assert (=> b!1221138 (= e!693431 e!693425)))

(declare-fun res!811240 () Bool)

(assert (=> b!1221138 (=> res!811240 e!693425)))

(assert (=> b!1221138 (= res!811240 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1221138 (= lt!555417 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221138 (= lt!555412 (array!78852 (store (arr!38055 _values!996) i!673 (ValueCellFull!14808 lt!555423)) (size!38591 _values!996)))))

(declare-fun dynLambda!3328 (Int (_ BitVec 64)) V!46507)

(assert (=> b!1221138 (= lt!555423 (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555420 () ListLongMap!18021)

(assert (=> b!1221138 (= lt!555420 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101544 res!811239) b!1221137))

(assert (= (and b!1221137 res!811247) b!1221130))

(assert (= (and b!1221130 res!811248) b!1221129))

(assert (= (and b!1221129 res!811241) b!1221125))

(assert (= (and b!1221125 res!811233) b!1221133))

(assert (= (and b!1221133 res!811237) b!1221135))

(assert (= (and b!1221135 res!811245) b!1221127))

(assert (= (and b!1221127 res!811234) b!1221121))

(assert (= (and b!1221121 res!811246) b!1221136))

(assert (= (and b!1221136 res!811243) b!1221132))

(assert (= (and b!1221132 (not res!811232)) b!1221138))

(assert (= (and b!1221138 (not res!811240)) b!1221128))

(assert (= (and b!1221128 (not res!811236)) b!1221134))

(assert (= (and b!1221134 res!811244) b!1221120))

(assert (= (and b!1221120 (not res!811242)) b!1221126))

(assert (= (and b!1221134 (not res!811238)) b!1221119))

(assert (= (and b!1221119 (not res!811235)) b!1221123))

(assert (= (and b!1221124 condMapEmpty!48442) mapIsEmpty!48442))

(assert (= (and b!1221124 (not condMapEmpty!48442)) mapNonEmpty!48442))

(get-info :version)

(assert (= (and mapNonEmpty!48442 ((_ is ValueCellFull!14808) mapValue!48442)) b!1221122))

(assert (= (and b!1221124 ((_ is ValueCellFull!14808) mapDefault!48442)) b!1221131))

(assert (= start!101544 b!1221124))

(declare-fun b_lambda!22197 () Bool)

(assert (=> (not b_lambda!22197) (not b!1221138)))

(declare-fun t!40163 () Bool)

(declare-fun tb!11131 () Bool)

(assert (=> (and start!101544 (= defaultEntry!1004 defaultEntry!1004) t!40163) tb!11131))

(declare-fun result!22869 () Bool)

(assert (=> tb!11131 (= result!22869 tp_is_empty!31035)))

(assert (=> b!1221138 t!40163))

(declare-fun b_and!43871 () Bool)

(assert (= b_and!43869 (and (=> t!40163 result!22869) b_and!43871)))

(declare-fun m!1125967 () Bool)

(assert (=> b!1221136 m!1125967))

(declare-fun m!1125969 () Bool)

(assert (=> b!1221126 m!1125969))

(declare-fun m!1125971 () Bool)

(assert (=> b!1221138 m!1125971))

(declare-fun m!1125973 () Bool)

(assert (=> b!1221138 m!1125973))

(declare-fun m!1125975 () Bool)

(assert (=> b!1221138 m!1125975))

(declare-fun m!1125977 () Bool)

(assert (=> b!1221138 m!1125977))

(declare-fun m!1125979 () Bool)

(assert (=> b!1221134 m!1125979))

(declare-fun m!1125981 () Bool)

(assert (=> b!1221134 m!1125981))

(assert (=> b!1221134 m!1125981))

(declare-fun m!1125983 () Bool)

(assert (=> b!1221134 m!1125983))

(declare-fun m!1125985 () Bool)

(assert (=> b!1221134 m!1125985))

(declare-fun m!1125987 () Bool)

(assert (=> b!1221121 m!1125987))

(declare-fun m!1125989 () Bool)

(assert (=> b!1221121 m!1125989))

(declare-fun m!1125991 () Bool)

(assert (=> b!1221137 m!1125991))

(declare-fun m!1125993 () Bool)

(assert (=> b!1221125 m!1125993))

(declare-fun m!1125995 () Bool)

(assert (=> b!1221132 m!1125995))

(declare-fun m!1125997 () Bool)

(assert (=> b!1221132 m!1125997))

(assert (=> b!1221120 m!1125979))

(declare-fun m!1125999 () Bool)

(assert (=> b!1221127 m!1125999))

(declare-fun m!1126001 () Bool)

(assert (=> b!1221123 m!1126001))

(declare-fun m!1126003 () Bool)

(assert (=> b!1221129 m!1126003))

(declare-fun m!1126005 () Bool)

(assert (=> start!101544 m!1126005))

(declare-fun m!1126007 () Bool)

(assert (=> start!101544 m!1126007))

(declare-fun m!1126009 () Bool)

(assert (=> mapNonEmpty!48442 m!1126009))

(declare-fun m!1126011 () Bool)

(assert (=> b!1221128 m!1126011))

(declare-fun m!1126013 () Bool)

(assert (=> b!1221128 m!1126013))

(declare-fun m!1126015 () Bool)

(assert (=> b!1221128 m!1126015))

(declare-fun m!1126017 () Bool)

(assert (=> b!1221128 m!1126017))

(assert (=> b!1221128 m!1125979))

(declare-fun m!1126019 () Bool)

(assert (=> b!1221128 m!1126019))

(assert (=> b!1221128 m!1125979))

(declare-fun m!1126021 () Bool)

(assert (=> b!1221135 m!1126021))

(declare-fun m!1126023 () Bool)

(assert (=> b!1221119 m!1126023))

(declare-fun m!1126025 () Bool)

(assert (=> b!1221119 m!1126025))

(declare-fun m!1126027 () Bool)

(assert (=> b!1221119 m!1126027))

(declare-fun m!1126029 () Bool)

(assert (=> b!1221119 m!1126029))

(check-sat tp_is_empty!31035 (not b!1221119) (not mapNonEmpty!48442) (not b!1221137) (not b!1221132) b_and!43871 (not b!1221129) (not b_lambda!22197) (not start!101544) (not b!1221126) (not b!1221121) (not b!1221128) (not b!1221135) (not b!1221136) (not b!1221123) (not b!1221125) (not b!1221138) (not b_next!26331) (not b!1221134))
(check-sat b_and!43871 (not b_next!26331))
(get-model)

(declare-fun b_lambda!22201 () Bool)

(assert (= b_lambda!22197 (or (and start!101544 b_free!26331) b_lambda!22201)))

(check-sat tp_is_empty!31035 (not b_lambda!22201) (not b!1221119) (not mapNonEmpty!48442) (not b!1221137) (not b!1221132) b_and!43871 (not b!1221129) (not start!101544) (not b!1221126) (not b!1221121) (not b!1221128) (not b!1221135) (not b!1221136) (not b!1221123) (not b!1221125) (not b!1221138) (not b_next!26331) (not b!1221134))
(check-sat b_and!43871 (not b_next!26331))
(get-model)

(declare-fun d!133797 () Bool)

(declare-fun res!811304 () Bool)

(declare-fun e!693480 () Bool)

(assert (=> d!133797 (=> res!811304 e!693480)))

(assert (=> d!133797 (= res!811304 ((_ is Nil!26850) Nil!26850))))

(assert (=> d!133797 (= (noDuplicate!1630 Nil!26850) e!693480)))

(declare-fun b!1221207 () Bool)

(declare-fun e!693481 () Bool)

(assert (=> b!1221207 (= e!693480 e!693481)))

(declare-fun res!811305 () Bool)

(assert (=> b!1221207 (=> (not res!811305) (not e!693481))))

(declare-fun contains!7020 (List!26853 (_ BitVec 64)) Bool)

(assert (=> b!1221207 (= res!811305 (not (contains!7020 (t!40164 Nil!26850) (h!28058 Nil!26850))))))

(declare-fun b!1221208 () Bool)

(assert (=> b!1221208 (= e!693481 (noDuplicate!1630 (t!40164 Nil!26850)))))

(assert (= (and d!133797 (not res!811304)) b!1221207))

(assert (= (and b!1221207 res!811305) b!1221208))

(declare-fun m!1126095 () Bool)

(assert (=> b!1221207 m!1126095))

(declare-fun m!1126097 () Bool)

(assert (=> b!1221208 m!1126097))

(assert (=> b!1221123 d!133797))

(declare-fun d!133799 () Bool)

(declare-fun res!811310 () Bool)

(declare-fun e!693486 () Bool)

(assert (=> d!133799 (=> res!811310 e!693486)))

(assert (=> d!133799 (= res!811310 (= (select (arr!38054 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133799 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693486)))

(declare-fun b!1221213 () Bool)

(declare-fun e!693487 () Bool)

(assert (=> b!1221213 (= e!693486 e!693487)))

(declare-fun res!811311 () Bool)

(assert (=> b!1221213 (=> (not res!811311) (not e!693487))))

(assert (=> b!1221213 (= res!811311 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38590 _keys!1208)))))

(declare-fun b!1221214 () Bool)

(assert (=> b!1221214 (= e!693487 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133799 (not res!811310)) b!1221213))

(assert (= (and b!1221213 res!811311) b!1221214))

(declare-fun m!1126099 () Bool)

(assert (=> d!133799 m!1126099))

(declare-fun m!1126101 () Bool)

(assert (=> b!1221214 m!1126101))

(assert (=> b!1221132 d!133799))

(declare-fun d!133801 () Bool)

(assert (=> d!133801 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555462 () Unit!40456)

(declare-fun choose!13 (array!78849 (_ BitVec 64) (_ BitVec 32)) Unit!40456)

(assert (=> d!133801 (= lt!555462 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133801 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133801 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!555462)))

(declare-fun bs!34376 () Bool)

(assert (= bs!34376 d!133801))

(assert (=> bs!34376 m!1125995))

(declare-fun m!1126103 () Bool)

(assert (=> bs!34376 m!1126103))

(assert (=> b!1221132 d!133801))

(declare-fun d!133803 () Bool)

(assert (=> d!133803 (= (array_inv!28954 _keys!1208) (bvsge (size!38590 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101544 d!133803))

(declare-fun d!133805 () Bool)

(assert (=> d!133805 (= (array_inv!28955 _values!996) (bvsge (size!38591 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101544 d!133805))

(declare-fun b!1221225 () Bool)

(declare-fun e!693498 () Bool)

(declare-fun call!60710 () Bool)

(assert (=> b!1221225 (= e!693498 call!60710)))

(declare-fun bm!60707 () Bool)

(declare-fun c!120242 () Bool)

(assert (=> bm!60707 (= call!60710 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120242 (Cons!26849 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000) Nil!26850) Nil!26850)))))

(declare-fun b!1221226 () Bool)

(declare-fun e!693497 () Bool)

(assert (=> b!1221226 (= e!693497 e!693498)))

(assert (=> b!1221226 (= c!120242 (validKeyInArray!0 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133807 () Bool)

(declare-fun res!811318 () Bool)

(declare-fun e!693496 () Bool)

(assert (=> d!133807 (=> res!811318 e!693496)))

(assert (=> d!133807 (= res!811318 (bvsge #b00000000000000000000000000000000 (size!38590 _keys!1208)))))

(assert (=> d!133807 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26850) e!693496)))

(declare-fun b!1221227 () Bool)

(assert (=> b!1221227 (= e!693498 call!60710)))

(declare-fun b!1221228 () Bool)

(declare-fun e!693499 () Bool)

(assert (=> b!1221228 (= e!693499 (contains!7020 Nil!26850 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221229 () Bool)

(assert (=> b!1221229 (= e!693496 e!693497)))

(declare-fun res!811320 () Bool)

(assert (=> b!1221229 (=> (not res!811320) (not e!693497))))

(assert (=> b!1221229 (= res!811320 (not e!693499))))

(declare-fun res!811319 () Bool)

(assert (=> b!1221229 (=> (not res!811319) (not e!693499))))

(assert (=> b!1221229 (= res!811319 (validKeyInArray!0 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133807 (not res!811318)) b!1221229))

(assert (= (and b!1221229 res!811319) b!1221228))

(assert (= (and b!1221229 res!811320) b!1221226))

(assert (= (and b!1221226 c!120242) b!1221225))

(assert (= (and b!1221226 (not c!120242)) b!1221227))

(assert (= (or b!1221225 b!1221227) bm!60707))

(assert (=> bm!60707 m!1126099))

(declare-fun m!1126105 () Bool)

(assert (=> bm!60707 m!1126105))

(assert (=> b!1221226 m!1126099))

(assert (=> b!1221226 m!1126099))

(declare-fun m!1126107 () Bool)

(assert (=> b!1221226 m!1126107))

(assert (=> b!1221228 m!1126099))

(assert (=> b!1221228 m!1126099))

(declare-fun m!1126109 () Bool)

(assert (=> b!1221228 m!1126109))

(assert (=> b!1221229 m!1126099))

(assert (=> b!1221229 m!1126099))

(assert (=> b!1221229 m!1126107))

(assert (=> b!1221125 d!133807))

(declare-fun d!133809 () Bool)

(declare-fun e!693502 () Bool)

(assert (=> d!133809 e!693502))

(declare-fun res!811325 () Bool)

(assert (=> d!133809 (=> (not res!811325) (not e!693502))))

(declare-fun lt!555473 () ListLongMap!18021)

(declare-fun contains!7021 (ListLongMap!18021 (_ BitVec 64)) Bool)

(assert (=> d!133809 (= res!811325 (contains!7021 lt!555473 (_1!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))))))

(declare-fun lt!555471 () List!26854)

(assert (=> d!133809 (= lt!555473 (ListLongMap!18022 lt!555471))))

(declare-fun lt!555472 () Unit!40456)

(declare-fun lt!555474 () Unit!40456)

(assert (=> d!133809 (= lt!555472 lt!555474)))

(declare-datatypes ((Option!697 0))(
  ( (Some!696 (v!18234 V!46507)) (None!695) )
))
(declare-fun getValueByKey!646 (List!26854 (_ BitVec 64)) Option!697)

(assert (=> d!133809 (= (getValueByKey!646 lt!555471 (_1!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))) (Some!696 (_2!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!323 (List!26854 (_ BitVec 64) V!46507) Unit!40456)

(assert (=> d!133809 (= lt!555474 (lemmaContainsTupThenGetReturnValue!323 lt!555471 (_1!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423))) (_2!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))))))

(declare-fun insertStrictlySorted!416 (List!26854 (_ BitVec 64) V!46507) List!26854)

(assert (=> d!133809 (= lt!555471 (insertStrictlySorted!416 (toList!9026 lt!555416) (_1!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423))) (_2!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))))))

(assert (=> d!133809 (= (+!4091 lt!555416 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423))) lt!555473)))

(declare-fun b!1221234 () Bool)

(declare-fun res!811326 () Bool)

(assert (=> b!1221234 (=> (not res!811326) (not e!693502))))

(assert (=> b!1221234 (= res!811326 (= (getValueByKey!646 (toList!9026 lt!555473) (_1!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423)))) (Some!696 (_2!10037 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423))))))))

(declare-fun b!1221235 () Bool)

(declare-fun contains!7022 (List!26854 tuple2!20052) Bool)

(assert (=> b!1221235 (= e!693502 (contains!7022 (toList!9026 lt!555473) (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423))))))

(assert (= (and d!133809 res!811325) b!1221234))

(assert (= (and b!1221234 res!811326) b!1221235))

(declare-fun m!1126111 () Bool)

(assert (=> d!133809 m!1126111))

(declare-fun m!1126113 () Bool)

(assert (=> d!133809 m!1126113))

(declare-fun m!1126115 () Bool)

(assert (=> d!133809 m!1126115))

(declare-fun m!1126117 () Bool)

(assert (=> d!133809 m!1126117))

(declare-fun m!1126119 () Bool)

(assert (=> b!1221234 m!1126119))

(declare-fun m!1126121 () Bool)

(assert (=> b!1221235 m!1126121))

(assert (=> b!1221134 d!133809))

(declare-fun d!133811 () Bool)

(declare-fun c!120245 () Bool)

(assert (=> d!133811 (= c!120245 ((_ is ValueCellFull!14808) (select (arr!38055 _values!996) from!1455)))))

(declare-fun e!693505 () V!46507)

(assert (=> d!133811 (= (get!19418 (select (arr!38055 _values!996) from!1455) lt!555423) e!693505)))

(declare-fun b!1221240 () Bool)

(declare-fun get!19419 (ValueCell!14808 V!46507) V!46507)

(assert (=> b!1221240 (= e!693505 (get!19419 (select (arr!38055 _values!996) from!1455) lt!555423))))

(declare-fun b!1221241 () Bool)

(declare-fun get!19420 (ValueCell!14808 V!46507) V!46507)

(assert (=> b!1221241 (= e!693505 (get!19420 (select (arr!38055 _values!996) from!1455) lt!555423))))

(assert (= (and d!133811 c!120245) b!1221240))

(assert (= (and d!133811 (not c!120245)) b!1221241))

(assert (=> b!1221240 m!1125981))

(declare-fun m!1126123 () Bool)

(assert (=> b!1221240 m!1126123))

(assert (=> b!1221241 m!1125981))

(declare-fun m!1126125 () Bool)

(assert (=> b!1221241 m!1126125))

(assert (=> b!1221134 d!133811))

(declare-fun d!133813 () Bool)

(declare-fun res!811327 () Bool)

(declare-fun e!693506 () Bool)

(assert (=> d!133813 (=> res!811327 e!693506)))

(assert (=> d!133813 (= res!811327 (= (select (arr!38054 _keys!1208) i!673) k0!934))))

(assert (=> d!133813 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693506)))

(declare-fun b!1221242 () Bool)

(declare-fun e!693507 () Bool)

(assert (=> b!1221242 (= e!693506 e!693507)))

(declare-fun res!811328 () Bool)

(assert (=> b!1221242 (=> (not res!811328) (not e!693507))))

(assert (=> b!1221242 (= res!811328 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38590 _keys!1208)))))

(declare-fun b!1221243 () Bool)

(assert (=> b!1221243 (= e!693507 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133813 (not res!811327)) b!1221242))

(assert (= (and b!1221242 res!811328) b!1221243))

(assert (=> d!133813 m!1125999))

(declare-fun m!1126127 () Bool)

(assert (=> b!1221243 m!1126127))

(assert (=> b!1221126 d!133813))

(declare-fun d!133815 () Bool)

(assert (=> d!133815 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221135 d!133815))

(declare-fun b!1221244 () Bool)

(declare-fun e!693510 () Bool)

(declare-fun call!60711 () Bool)

(assert (=> b!1221244 (= e!693510 call!60711)))

(declare-fun bm!60708 () Bool)

(declare-fun c!120246 () Bool)

(assert (=> bm!60708 (= call!60711 (arrayNoDuplicates!0 lt!555415 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120246 (Cons!26849 (select (arr!38054 lt!555415) #b00000000000000000000000000000000) Nil!26850) Nil!26850)))))

(declare-fun b!1221245 () Bool)

(declare-fun e!693509 () Bool)

(assert (=> b!1221245 (= e!693509 e!693510)))

(assert (=> b!1221245 (= c!120246 (validKeyInArray!0 (select (arr!38054 lt!555415) #b00000000000000000000000000000000)))))

(declare-fun d!133817 () Bool)

(declare-fun res!811329 () Bool)

(declare-fun e!693508 () Bool)

(assert (=> d!133817 (=> res!811329 e!693508)))

(assert (=> d!133817 (= res!811329 (bvsge #b00000000000000000000000000000000 (size!38590 lt!555415)))))

(assert (=> d!133817 (= (arrayNoDuplicates!0 lt!555415 #b00000000000000000000000000000000 Nil!26850) e!693508)))

(declare-fun b!1221246 () Bool)

(assert (=> b!1221246 (= e!693510 call!60711)))

(declare-fun b!1221247 () Bool)

(declare-fun e!693511 () Bool)

(assert (=> b!1221247 (= e!693511 (contains!7020 Nil!26850 (select (arr!38054 lt!555415) #b00000000000000000000000000000000)))))

(declare-fun b!1221248 () Bool)

(assert (=> b!1221248 (= e!693508 e!693509)))

(declare-fun res!811331 () Bool)

(assert (=> b!1221248 (=> (not res!811331) (not e!693509))))

(assert (=> b!1221248 (= res!811331 (not e!693511))))

(declare-fun res!811330 () Bool)

(assert (=> b!1221248 (=> (not res!811330) (not e!693511))))

(assert (=> b!1221248 (= res!811330 (validKeyInArray!0 (select (arr!38054 lt!555415) #b00000000000000000000000000000000)))))

(assert (= (and d!133817 (not res!811329)) b!1221248))

(assert (= (and b!1221248 res!811330) b!1221247))

(assert (= (and b!1221248 res!811331) b!1221245))

(assert (= (and b!1221245 c!120246) b!1221244))

(assert (= (and b!1221245 (not c!120246)) b!1221246))

(assert (= (or b!1221244 b!1221246) bm!60708))

(declare-fun m!1126129 () Bool)

(assert (=> bm!60708 m!1126129))

(declare-fun m!1126131 () Bool)

(assert (=> bm!60708 m!1126131))

(assert (=> b!1221245 m!1126129))

(assert (=> b!1221245 m!1126129))

(declare-fun m!1126133 () Bool)

(assert (=> b!1221245 m!1126133))

(assert (=> b!1221247 m!1126129))

(assert (=> b!1221247 m!1126129))

(declare-fun m!1126135 () Bool)

(assert (=> b!1221247 m!1126135))

(assert (=> b!1221248 m!1126129))

(assert (=> b!1221248 m!1126129))

(assert (=> b!1221248 m!1126133))

(assert (=> b!1221136 d!133817))

(declare-fun b!1221273 () Bool)

(declare-fun e!693528 () Bool)

(declare-fun e!693531 () Bool)

(assert (=> b!1221273 (= e!693528 e!693531)))

(declare-fun c!120257 () Bool)

(assert (=> b!1221273 (= c!120257 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 lt!555415)))))

(declare-fun b!1221274 () Bool)

(declare-fun e!693526 () Bool)

(assert (=> b!1221274 (= e!693526 (validKeyInArray!0 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221274 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60711 () Bool)

(declare-fun call!60714 () ListLongMap!18021)

(assert (=> bm!60711 (= call!60714 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221275 () Bool)

(declare-fun e!693530 () Bool)

(assert (=> b!1221275 (= e!693528 e!693530)))

(assert (=> b!1221275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 lt!555415)))))

(declare-fun res!811343 () Bool)

(declare-fun lt!555495 () ListLongMap!18021)

(assert (=> b!1221275 (= res!811343 (contains!7021 lt!555495 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221275 (=> (not res!811343) (not e!693530))))

(declare-fun b!1221276 () Bool)

(declare-fun e!693527 () ListLongMap!18021)

(assert (=> b!1221276 (= e!693527 (ListLongMap!18022 Nil!26851))))

(declare-fun b!1221277 () Bool)

(declare-fun e!693532 () Bool)

(assert (=> b!1221277 (= e!693532 e!693528)))

(declare-fun c!120256 () Bool)

(assert (=> b!1221277 (= c!120256 e!693526)))

(declare-fun res!811340 () Bool)

(assert (=> b!1221277 (=> (not res!811340) (not e!693526))))

(assert (=> b!1221277 (= res!811340 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 lt!555415)))))

(declare-fun b!1221278 () Bool)

(assert (=> b!1221278 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 lt!555415)))))

(assert (=> b!1221278 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38591 lt!555412)))))

(declare-fun apply!975 (ListLongMap!18021 (_ BitVec 64)) V!46507)

(assert (=> b!1221278 (= e!693530 (= (apply!975 lt!555495 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19418 (select (arr!38055 lt!555412) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221279 () Bool)

(declare-fun lt!555494 () Unit!40456)

(declare-fun lt!555489 () Unit!40456)

(assert (=> b!1221279 (= lt!555494 lt!555489)))

(declare-fun lt!555491 () V!46507)

(declare-fun lt!555490 () ListLongMap!18021)

(declare-fun lt!555493 () (_ BitVec 64))

(declare-fun lt!555492 () (_ BitVec 64))

(assert (=> b!1221279 (not (contains!7021 (+!4091 lt!555490 (tuple2!20053 lt!555492 lt!555491)) lt!555493))))

(declare-fun addStillNotContains!303 (ListLongMap!18021 (_ BitVec 64) V!46507 (_ BitVec 64)) Unit!40456)

(assert (=> b!1221279 (= lt!555489 (addStillNotContains!303 lt!555490 lt!555492 lt!555491 lt!555493))))

(assert (=> b!1221279 (= lt!555493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221279 (= lt!555491 (get!19418 (select (arr!38055 lt!555412) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221279 (= lt!555492 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221279 (= lt!555490 call!60714)))

(declare-fun e!693529 () ListLongMap!18021)

(assert (=> b!1221279 (= e!693529 (+!4091 call!60714 (tuple2!20053 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19418 (select (arr!38055 lt!555412) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221280 () Bool)

(assert (=> b!1221280 (= e!693529 call!60714)))

(declare-fun d!133819 () Bool)

(assert (=> d!133819 e!693532))

(declare-fun res!811341 () Bool)

(assert (=> d!133819 (=> (not res!811341) (not e!693532))))

(assert (=> d!133819 (= res!811341 (not (contains!7021 lt!555495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133819 (= lt!555495 e!693527)))

(declare-fun c!120258 () Bool)

(assert (=> d!133819 (= c!120258 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 lt!555415)))))

(assert (=> d!133819 (validMask!0 mask!1564)))

(assert (=> d!133819 (= (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555495)))

(declare-fun b!1221281 () Bool)

(assert (=> b!1221281 (= e!693527 e!693529)))

(declare-fun c!120255 () Bool)

(assert (=> b!1221281 (= c!120255 (validKeyInArray!0 (select (arr!38054 lt!555415) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221282 () Bool)

(declare-fun isEmpty!999 (ListLongMap!18021) Bool)

(assert (=> b!1221282 (= e!693531 (isEmpty!999 lt!555495))))

(declare-fun b!1221283 () Bool)

(declare-fun res!811342 () Bool)

(assert (=> b!1221283 (=> (not res!811342) (not e!693532))))

(assert (=> b!1221283 (= res!811342 (not (contains!7021 lt!555495 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221284 () Bool)

(assert (=> b!1221284 (= e!693531 (= lt!555495 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133819 c!120258) b!1221276))

(assert (= (and d!133819 (not c!120258)) b!1221281))

(assert (= (and b!1221281 c!120255) b!1221279))

(assert (= (and b!1221281 (not c!120255)) b!1221280))

(assert (= (or b!1221279 b!1221280) bm!60711))

(assert (= (and d!133819 res!811341) b!1221283))

(assert (= (and b!1221283 res!811342) b!1221277))

(assert (= (and b!1221277 res!811340) b!1221274))

(assert (= (and b!1221277 c!120256) b!1221275))

(assert (= (and b!1221277 (not c!120256)) b!1221273))

(assert (= (and b!1221275 res!811343) b!1221278))

(assert (= (and b!1221273 c!120257) b!1221284))

(assert (= (and b!1221273 (not c!120257)) b!1221282))

(declare-fun b_lambda!22203 () Bool)

(assert (=> (not b_lambda!22203) (not b!1221278)))

(assert (=> b!1221278 t!40163))

(declare-fun b_and!43877 () Bool)

(assert (= b_and!43871 (and (=> t!40163 result!22869) b_and!43877)))

(declare-fun b_lambda!22205 () Bool)

(assert (=> (not b_lambda!22205) (not b!1221279)))

(assert (=> b!1221279 t!40163))

(declare-fun b_and!43879 () Bool)

(assert (= b_and!43877 (and (=> t!40163 result!22869) b_and!43879)))

(declare-fun m!1126137 () Bool)

(assert (=> b!1221282 m!1126137))

(declare-fun m!1126139 () Bool)

(assert (=> b!1221283 m!1126139))

(declare-fun m!1126141 () Bool)

(assert (=> b!1221281 m!1126141))

(assert (=> b!1221281 m!1126141))

(declare-fun m!1126143 () Bool)

(assert (=> b!1221281 m!1126143))

(declare-fun m!1126145 () Bool)

(assert (=> b!1221279 m!1126145))

(assert (=> b!1221279 m!1126145))

(assert (=> b!1221279 m!1125975))

(declare-fun m!1126147 () Bool)

(assert (=> b!1221279 m!1126147))

(declare-fun m!1126149 () Bool)

(assert (=> b!1221279 m!1126149))

(declare-fun m!1126151 () Bool)

(assert (=> b!1221279 m!1126151))

(declare-fun m!1126153 () Bool)

(assert (=> b!1221279 m!1126153))

(assert (=> b!1221279 m!1125975))

(assert (=> b!1221279 m!1126153))

(declare-fun m!1126155 () Bool)

(assert (=> b!1221279 m!1126155))

(assert (=> b!1221279 m!1126141))

(assert (=> b!1221278 m!1126145))

(assert (=> b!1221278 m!1126141))

(assert (=> b!1221278 m!1126145))

(assert (=> b!1221278 m!1125975))

(assert (=> b!1221278 m!1126147))

(assert (=> b!1221278 m!1126141))

(declare-fun m!1126157 () Bool)

(assert (=> b!1221278 m!1126157))

(assert (=> b!1221278 m!1125975))

(assert (=> b!1221274 m!1126141))

(assert (=> b!1221274 m!1126141))

(assert (=> b!1221274 m!1126143))

(declare-fun m!1126159 () Bool)

(assert (=> b!1221284 m!1126159))

(assert (=> b!1221275 m!1126141))

(assert (=> b!1221275 m!1126141))

(declare-fun m!1126161 () Bool)

(assert (=> b!1221275 m!1126161))

(assert (=> bm!60711 m!1126159))

(declare-fun m!1126163 () Bool)

(assert (=> d!133819 m!1126163))

(assert (=> d!133819 m!1125991))

(assert (=> b!1221128 d!133819))

(declare-fun d!133821 () Bool)

(assert (=> d!133821 (= (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455)) (and (not (= (select (arr!38054 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38054 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221128 d!133821))

(declare-fun bm!60716 () Bool)

(declare-fun call!60719 () ListLongMap!18021)

(assert (=> bm!60716 (= call!60719 (getCurrentListMapNoExtraKeys!5448 (array!78850 (store (arr!38054 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38590 _keys!1208)) (array!78852 (store (arr!38055 _values!996) i!673 (ValueCellFull!14808 (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38591 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133823 () Bool)

(declare-fun e!693537 () Bool)

(assert (=> d!133823 e!693537))

(declare-fun res!811346 () Bool)

(assert (=> d!133823 (=> (not res!811346) (not e!693537))))

(assert (=> d!133823 (= res!811346 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38590 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38590 _keys!1208))))))))

(declare-fun lt!555498 () Unit!40456)

(declare-fun choose!1826 (array!78849 array!78851 (_ BitVec 32) (_ BitVec 32) V!46507 V!46507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40456)

(assert (=> d!133823 (= lt!555498 (choose!1826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133823 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(assert (=> d!133823 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1140 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555498)))

(declare-fun call!60720 () ListLongMap!18021)

(declare-fun e!693538 () Bool)

(declare-fun b!1221291 () Bool)

(assert (=> b!1221291 (= e!693538 (= call!60719 (-!1933 call!60720 k0!934)))))

(assert (=> b!1221291 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38591 _values!996)))))

(declare-fun b!1221292 () Bool)

(assert (=> b!1221292 (= e!693537 e!693538)))

(declare-fun c!120261 () Bool)

(assert (=> b!1221292 (= c!120261 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1221293 () Bool)

(assert (=> b!1221293 (= e!693538 (= call!60719 call!60720))))

(assert (=> b!1221293 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38591 _values!996)))))

(declare-fun bm!60717 () Bool)

(assert (=> bm!60717 (= call!60720 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133823 res!811346) b!1221292))

(assert (= (and b!1221292 c!120261) b!1221291))

(assert (= (and b!1221292 (not c!120261)) b!1221293))

(assert (= (or b!1221291 b!1221293) bm!60717))

(assert (= (or b!1221291 b!1221293) bm!60716))

(declare-fun b_lambda!22207 () Bool)

(assert (=> (not b_lambda!22207) (not bm!60716)))

(assert (=> bm!60716 t!40163))

(declare-fun b_and!43881 () Bool)

(assert (= b_and!43879 (and (=> t!40163 result!22869) b_and!43881)))

(assert (=> bm!60716 m!1125989))

(assert (=> bm!60716 m!1125975))

(declare-fun m!1126165 () Bool)

(assert (=> bm!60716 m!1126165))

(declare-fun m!1126167 () Bool)

(assert (=> bm!60716 m!1126167))

(declare-fun m!1126169 () Bool)

(assert (=> d!133823 m!1126169))

(declare-fun m!1126171 () Bool)

(assert (=> b!1221291 m!1126171))

(assert (=> bm!60717 m!1126011))

(assert (=> b!1221128 d!133823))

(declare-fun b!1221294 () Bool)

(declare-fun e!693541 () Bool)

(declare-fun e!693544 () Bool)

(assert (=> b!1221294 (= e!693541 e!693544)))

(declare-fun c!120264 () Bool)

(assert (=> b!1221294 (= c!120264 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(declare-fun b!1221295 () Bool)

(declare-fun e!693539 () Bool)

(assert (=> b!1221295 (= e!693539 (validKeyInArray!0 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221295 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun call!60721 () ListLongMap!18021)

(declare-fun bm!60718 () Bool)

(assert (=> bm!60718 (= call!60721 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221296 () Bool)

(declare-fun e!693543 () Bool)

(assert (=> b!1221296 (= e!693541 e!693543)))

(assert (=> b!1221296 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(declare-fun lt!555505 () ListLongMap!18021)

(declare-fun res!811350 () Bool)

(assert (=> b!1221296 (= res!811350 (contains!7021 lt!555505 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221296 (=> (not res!811350) (not e!693543))))

(declare-fun b!1221297 () Bool)

(declare-fun e!693540 () ListLongMap!18021)

(assert (=> b!1221297 (= e!693540 (ListLongMap!18022 Nil!26851))))

(declare-fun b!1221298 () Bool)

(declare-fun e!693545 () Bool)

(assert (=> b!1221298 (= e!693545 e!693541)))

(declare-fun c!120263 () Bool)

(assert (=> b!1221298 (= c!120263 e!693539)))

(declare-fun res!811347 () Bool)

(assert (=> b!1221298 (=> (not res!811347) (not e!693539))))

(assert (=> b!1221298 (= res!811347 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(declare-fun b!1221299 () Bool)

(assert (=> b!1221299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(assert (=> b!1221299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38591 _values!996)))))

(assert (=> b!1221299 (= e!693543 (= (apply!975 lt!555505 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19418 (select (arr!38055 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221300 () Bool)

(declare-fun lt!555504 () Unit!40456)

(declare-fun lt!555499 () Unit!40456)

(assert (=> b!1221300 (= lt!555504 lt!555499)))

(declare-fun lt!555503 () (_ BitVec 64))

(declare-fun lt!555500 () ListLongMap!18021)

(declare-fun lt!555502 () (_ BitVec 64))

(declare-fun lt!555501 () V!46507)

(assert (=> b!1221300 (not (contains!7021 (+!4091 lt!555500 (tuple2!20053 lt!555502 lt!555501)) lt!555503))))

(assert (=> b!1221300 (= lt!555499 (addStillNotContains!303 lt!555500 lt!555502 lt!555501 lt!555503))))

(assert (=> b!1221300 (= lt!555503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221300 (= lt!555501 (get!19418 (select (arr!38055 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221300 (= lt!555502 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1221300 (= lt!555500 call!60721)))

(declare-fun e!693542 () ListLongMap!18021)

(assert (=> b!1221300 (= e!693542 (+!4091 call!60721 (tuple2!20053 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19418 (select (arr!38055 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221301 () Bool)

(assert (=> b!1221301 (= e!693542 call!60721)))

(declare-fun d!133825 () Bool)

(assert (=> d!133825 e!693545))

(declare-fun res!811348 () Bool)

(assert (=> d!133825 (=> (not res!811348) (not e!693545))))

(assert (=> d!133825 (= res!811348 (not (contains!7021 lt!555505 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133825 (= lt!555505 e!693540)))

(declare-fun c!120265 () Bool)

(assert (=> d!133825 (= c!120265 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208)))))

(assert (=> d!133825 (validMask!0 mask!1564)))

(assert (=> d!133825 (= (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555505)))

(declare-fun b!1221302 () Bool)

(assert (=> b!1221302 (= e!693540 e!693542)))

(declare-fun c!120262 () Bool)

(assert (=> b!1221302 (= c!120262 (validKeyInArray!0 (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1221303 () Bool)

(assert (=> b!1221303 (= e!693544 (isEmpty!999 lt!555505))))

(declare-fun b!1221304 () Bool)

(declare-fun res!811349 () Bool)

(assert (=> b!1221304 (=> (not res!811349) (not e!693545))))

(assert (=> b!1221304 (= res!811349 (not (contains!7021 lt!555505 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221305 () Bool)

(assert (=> b!1221305 (= e!693544 (= lt!555505 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133825 c!120265) b!1221297))

(assert (= (and d!133825 (not c!120265)) b!1221302))

(assert (= (and b!1221302 c!120262) b!1221300))

(assert (= (and b!1221302 (not c!120262)) b!1221301))

(assert (= (or b!1221300 b!1221301) bm!60718))

(assert (= (and d!133825 res!811348) b!1221304))

(assert (= (and b!1221304 res!811349) b!1221298))

(assert (= (and b!1221298 res!811347) b!1221295))

(assert (= (and b!1221298 c!120263) b!1221296))

(assert (= (and b!1221298 (not c!120263)) b!1221294))

(assert (= (and b!1221296 res!811350) b!1221299))

(assert (= (and b!1221294 c!120264) b!1221305))

(assert (= (and b!1221294 (not c!120264)) b!1221303))

(declare-fun b_lambda!22209 () Bool)

(assert (=> (not b_lambda!22209) (not b!1221299)))

(assert (=> b!1221299 t!40163))

(declare-fun b_and!43883 () Bool)

(assert (= b_and!43881 (and (=> t!40163 result!22869) b_and!43883)))

(declare-fun b_lambda!22211 () Bool)

(assert (=> (not b_lambda!22211) (not b!1221300)))

(assert (=> b!1221300 t!40163))

(declare-fun b_and!43885 () Bool)

(assert (= b_and!43883 (and (=> t!40163 result!22869) b_and!43885)))

(declare-fun m!1126173 () Bool)

(assert (=> b!1221303 m!1126173))

(declare-fun m!1126175 () Bool)

(assert (=> b!1221304 m!1126175))

(declare-fun m!1126177 () Bool)

(assert (=> b!1221302 m!1126177))

(assert (=> b!1221302 m!1126177))

(declare-fun m!1126179 () Bool)

(assert (=> b!1221302 m!1126179))

(declare-fun m!1126181 () Bool)

(assert (=> b!1221300 m!1126181))

(assert (=> b!1221300 m!1126181))

(assert (=> b!1221300 m!1125975))

(declare-fun m!1126183 () Bool)

(assert (=> b!1221300 m!1126183))

(declare-fun m!1126185 () Bool)

(assert (=> b!1221300 m!1126185))

(declare-fun m!1126187 () Bool)

(assert (=> b!1221300 m!1126187))

(declare-fun m!1126189 () Bool)

(assert (=> b!1221300 m!1126189))

(assert (=> b!1221300 m!1125975))

(assert (=> b!1221300 m!1126189))

(declare-fun m!1126191 () Bool)

(assert (=> b!1221300 m!1126191))

(assert (=> b!1221300 m!1126177))

(assert (=> b!1221299 m!1126181))

(assert (=> b!1221299 m!1126177))

(assert (=> b!1221299 m!1126181))

(assert (=> b!1221299 m!1125975))

(assert (=> b!1221299 m!1126183))

(assert (=> b!1221299 m!1126177))

(declare-fun m!1126193 () Bool)

(assert (=> b!1221299 m!1126193))

(assert (=> b!1221299 m!1125975))

(assert (=> b!1221295 m!1126177))

(assert (=> b!1221295 m!1126177))

(assert (=> b!1221295 m!1126179))

(declare-fun m!1126195 () Bool)

(assert (=> b!1221305 m!1126195))

(assert (=> b!1221296 m!1126177))

(assert (=> b!1221296 m!1126177))

(declare-fun m!1126197 () Bool)

(assert (=> b!1221296 m!1126197))

(assert (=> bm!60718 m!1126195))

(declare-fun m!1126199 () Bool)

(assert (=> d!133825 m!1126199))

(assert (=> d!133825 m!1125991))

(assert (=> b!1221128 d!133825))

(declare-fun d!133827 () Bool)

(declare-fun lt!555508 () ListLongMap!18021)

(assert (=> d!133827 (not (contains!7021 lt!555508 k0!934))))

(declare-fun removeStrictlySorted!108 (List!26854 (_ BitVec 64)) List!26854)

(assert (=> d!133827 (= lt!555508 (ListLongMap!18022 (removeStrictlySorted!108 (toList!9026 lt!555422) k0!934)))))

(assert (=> d!133827 (= (-!1933 lt!555422 k0!934) lt!555508)))

(declare-fun bs!34377 () Bool)

(assert (= bs!34377 d!133827))

(declare-fun m!1126201 () Bool)

(assert (=> bs!34377 m!1126201))

(declare-fun m!1126203 () Bool)

(assert (=> bs!34377 m!1126203))

(assert (=> b!1221128 d!133827))

(declare-fun d!133829 () Bool)

(assert (=> d!133829 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1221137 d!133829))

(declare-fun b!1221314 () Bool)

(declare-fun e!693553 () Bool)

(declare-fun call!60724 () Bool)

(assert (=> b!1221314 (= e!693553 call!60724)))

(declare-fun b!1221315 () Bool)

(declare-fun e!693552 () Bool)

(assert (=> b!1221315 (= e!693552 call!60724)))

(declare-fun b!1221316 () Bool)

(declare-fun e!693554 () Bool)

(assert (=> b!1221316 (= e!693554 e!693553)))

(declare-fun c!120268 () Bool)

(assert (=> b!1221316 (= c!120268 (validKeyInArray!0 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133831 () Bool)

(declare-fun res!811355 () Bool)

(assert (=> d!133831 (=> res!811355 e!693554)))

(assert (=> d!133831 (= res!811355 (bvsge #b00000000000000000000000000000000 (size!38590 _keys!1208)))))

(assert (=> d!133831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693554)))

(declare-fun b!1221317 () Bool)

(assert (=> b!1221317 (= e!693553 e!693552)))

(declare-fun lt!555515 () (_ BitVec 64))

(assert (=> b!1221317 (= lt!555515 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555517 () Unit!40456)

(assert (=> b!1221317 (= lt!555517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555515 #b00000000000000000000000000000000))))

(assert (=> b!1221317 (arrayContainsKey!0 _keys!1208 lt!555515 #b00000000000000000000000000000000)))

(declare-fun lt!555516 () Unit!40456)

(assert (=> b!1221317 (= lt!555516 lt!555517)))

(declare-fun res!811356 () Bool)

(declare-datatypes ((SeekEntryResult!9948 0))(
  ( (MissingZero!9948 (index!42163 (_ BitVec 32))) (Found!9948 (index!42164 (_ BitVec 32))) (Intermediate!9948 (undefined!10760 Bool) (index!42165 (_ BitVec 32)) (x!107558 (_ BitVec 32))) (Undefined!9948) (MissingVacant!9948 (index!42166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78849 (_ BitVec 32)) SeekEntryResult!9948)

(assert (=> b!1221317 (= res!811356 (= (seekEntryOrOpen!0 (select (arr!38054 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9948 #b00000000000000000000000000000000)))))

(assert (=> b!1221317 (=> (not res!811356) (not e!693552))))

(declare-fun bm!60721 () Bool)

(assert (=> bm!60721 (= call!60724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133831 (not res!811355)) b!1221316))

(assert (= (and b!1221316 c!120268) b!1221317))

(assert (= (and b!1221316 (not c!120268)) b!1221314))

(assert (= (and b!1221317 res!811356) b!1221315))

(assert (= (or b!1221315 b!1221314) bm!60721))

(assert (=> b!1221316 m!1126099))

(assert (=> b!1221316 m!1126099))

(assert (=> b!1221316 m!1126107))

(assert (=> b!1221317 m!1126099))

(declare-fun m!1126205 () Bool)

(assert (=> b!1221317 m!1126205))

(declare-fun m!1126207 () Bool)

(assert (=> b!1221317 m!1126207))

(assert (=> b!1221317 m!1126099))

(declare-fun m!1126209 () Bool)

(assert (=> b!1221317 m!1126209))

(declare-fun m!1126211 () Bool)

(assert (=> bm!60721 m!1126211))

(assert (=> b!1221129 d!133831))

(declare-fun b!1221318 () Bool)

(declare-fun e!693557 () Bool)

(declare-fun e!693560 () Bool)

(assert (=> b!1221318 (= e!693557 e!693560)))

(declare-fun c!120271 () Bool)

(assert (=> b!1221318 (= c!120271 (bvslt from!1455 (size!38590 lt!555415)))))

(declare-fun b!1221319 () Bool)

(declare-fun e!693555 () Bool)

(assert (=> b!1221319 (= e!693555 (validKeyInArray!0 (select (arr!38054 lt!555415) from!1455)))))

(assert (=> b!1221319 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun call!60725 () ListLongMap!18021)

(declare-fun bm!60722 () Bool)

(assert (=> bm!60722 (= call!60725 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221320 () Bool)

(declare-fun e!693559 () Bool)

(assert (=> b!1221320 (= e!693557 e!693559)))

(assert (=> b!1221320 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38590 lt!555415)))))

(declare-fun lt!555524 () ListLongMap!18021)

(declare-fun res!811360 () Bool)

(assert (=> b!1221320 (= res!811360 (contains!7021 lt!555524 (select (arr!38054 lt!555415) from!1455)))))

(assert (=> b!1221320 (=> (not res!811360) (not e!693559))))

(declare-fun b!1221321 () Bool)

(declare-fun e!693556 () ListLongMap!18021)

(assert (=> b!1221321 (= e!693556 (ListLongMap!18022 Nil!26851))))

(declare-fun b!1221322 () Bool)

(declare-fun e!693561 () Bool)

(assert (=> b!1221322 (= e!693561 e!693557)))

(declare-fun c!120270 () Bool)

(assert (=> b!1221322 (= c!120270 e!693555)))

(declare-fun res!811357 () Bool)

(assert (=> b!1221322 (=> (not res!811357) (not e!693555))))

(assert (=> b!1221322 (= res!811357 (bvslt from!1455 (size!38590 lt!555415)))))

(declare-fun b!1221323 () Bool)

(assert (=> b!1221323 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38590 lt!555415)))))

(assert (=> b!1221323 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38591 lt!555412)))))

(assert (=> b!1221323 (= e!693559 (= (apply!975 lt!555524 (select (arr!38054 lt!555415) from!1455)) (get!19418 (select (arr!38055 lt!555412) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221324 () Bool)

(declare-fun lt!555523 () Unit!40456)

(declare-fun lt!555518 () Unit!40456)

(assert (=> b!1221324 (= lt!555523 lt!555518)))

(declare-fun lt!555521 () (_ BitVec 64))

(declare-fun lt!555520 () V!46507)

(declare-fun lt!555522 () (_ BitVec 64))

(declare-fun lt!555519 () ListLongMap!18021)

(assert (=> b!1221324 (not (contains!7021 (+!4091 lt!555519 (tuple2!20053 lt!555521 lt!555520)) lt!555522))))

(assert (=> b!1221324 (= lt!555518 (addStillNotContains!303 lt!555519 lt!555521 lt!555520 lt!555522))))

(assert (=> b!1221324 (= lt!555522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221324 (= lt!555520 (get!19418 (select (arr!38055 lt!555412) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221324 (= lt!555521 (select (arr!38054 lt!555415) from!1455))))

(assert (=> b!1221324 (= lt!555519 call!60725)))

(declare-fun e!693558 () ListLongMap!18021)

(assert (=> b!1221324 (= e!693558 (+!4091 call!60725 (tuple2!20053 (select (arr!38054 lt!555415) from!1455) (get!19418 (select (arr!38055 lt!555412) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221325 () Bool)

(assert (=> b!1221325 (= e!693558 call!60725)))

(declare-fun d!133833 () Bool)

(assert (=> d!133833 e!693561))

(declare-fun res!811358 () Bool)

(assert (=> d!133833 (=> (not res!811358) (not e!693561))))

(assert (=> d!133833 (= res!811358 (not (contains!7021 lt!555524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133833 (= lt!555524 e!693556)))

(declare-fun c!120272 () Bool)

(assert (=> d!133833 (= c!120272 (bvsge from!1455 (size!38590 lt!555415)))))

(assert (=> d!133833 (validMask!0 mask!1564)))

(assert (=> d!133833 (= (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555524)))

(declare-fun b!1221326 () Bool)

(assert (=> b!1221326 (= e!693556 e!693558)))

(declare-fun c!120269 () Bool)

(assert (=> b!1221326 (= c!120269 (validKeyInArray!0 (select (arr!38054 lt!555415) from!1455)))))

(declare-fun b!1221327 () Bool)

(assert (=> b!1221327 (= e!693560 (isEmpty!999 lt!555524))))

(declare-fun b!1221328 () Bool)

(declare-fun res!811359 () Bool)

(assert (=> b!1221328 (=> (not res!811359) (not e!693561))))

(assert (=> b!1221328 (= res!811359 (not (contains!7021 lt!555524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221329 () Bool)

(assert (=> b!1221329 (= e!693560 (= lt!555524 (getCurrentListMapNoExtraKeys!5448 lt!555415 lt!555412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133833 c!120272) b!1221321))

(assert (= (and d!133833 (not c!120272)) b!1221326))

(assert (= (and b!1221326 c!120269) b!1221324))

(assert (= (and b!1221326 (not c!120269)) b!1221325))

(assert (= (or b!1221324 b!1221325) bm!60722))

(assert (= (and d!133833 res!811358) b!1221328))

(assert (= (and b!1221328 res!811359) b!1221322))

(assert (= (and b!1221322 res!811357) b!1221319))

(assert (= (and b!1221322 c!120270) b!1221320))

(assert (= (and b!1221322 (not c!120270)) b!1221318))

(assert (= (and b!1221320 res!811360) b!1221323))

(assert (= (and b!1221318 c!120271) b!1221329))

(assert (= (and b!1221318 (not c!120271)) b!1221327))

(declare-fun b_lambda!22213 () Bool)

(assert (=> (not b_lambda!22213) (not b!1221323)))

(assert (=> b!1221323 t!40163))

(declare-fun b_and!43887 () Bool)

(assert (= b_and!43885 (and (=> t!40163 result!22869) b_and!43887)))

(declare-fun b_lambda!22215 () Bool)

(assert (=> (not b_lambda!22215) (not b!1221324)))

(assert (=> b!1221324 t!40163))

(declare-fun b_and!43889 () Bool)

(assert (= b_and!43887 (and (=> t!40163 result!22869) b_and!43889)))

(declare-fun m!1126213 () Bool)

(assert (=> b!1221327 m!1126213))

(declare-fun m!1126215 () Bool)

(assert (=> b!1221328 m!1126215))

(declare-fun m!1126217 () Bool)

(assert (=> b!1221326 m!1126217))

(assert (=> b!1221326 m!1126217))

(declare-fun m!1126219 () Bool)

(assert (=> b!1221326 m!1126219))

(declare-fun m!1126221 () Bool)

(assert (=> b!1221324 m!1126221))

(assert (=> b!1221324 m!1126221))

(assert (=> b!1221324 m!1125975))

(declare-fun m!1126223 () Bool)

(assert (=> b!1221324 m!1126223))

(declare-fun m!1126225 () Bool)

(assert (=> b!1221324 m!1126225))

(declare-fun m!1126227 () Bool)

(assert (=> b!1221324 m!1126227))

(declare-fun m!1126229 () Bool)

(assert (=> b!1221324 m!1126229))

(assert (=> b!1221324 m!1125975))

(assert (=> b!1221324 m!1126229))

(declare-fun m!1126231 () Bool)

(assert (=> b!1221324 m!1126231))

(assert (=> b!1221324 m!1126217))

(assert (=> b!1221323 m!1126221))

(assert (=> b!1221323 m!1126217))

(assert (=> b!1221323 m!1126221))

(assert (=> b!1221323 m!1125975))

(assert (=> b!1221323 m!1126223))

(assert (=> b!1221323 m!1126217))

(declare-fun m!1126233 () Bool)

(assert (=> b!1221323 m!1126233))

(assert (=> b!1221323 m!1125975))

(assert (=> b!1221319 m!1126217))

(assert (=> b!1221319 m!1126217))

(assert (=> b!1221319 m!1126219))

(declare-fun m!1126235 () Bool)

(assert (=> b!1221329 m!1126235))

(assert (=> b!1221320 m!1126217))

(assert (=> b!1221320 m!1126217))

(declare-fun m!1126237 () Bool)

(assert (=> b!1221320 m!1126237))

(assert (=> bm!60722 m!1126235))

(declare-fun m!1126239 () Bool)

(assert (=> d!133833 m!1126239))

(assert (=> d!133833 m!1125991))

(assert (=> b!1221138 d!133833))

(declare-fun b!1221330 () Bool)

(declare-fun e!693564 () Bool)

(declare-fun e!693567 () Bool)

(assert (=> b!1221330 (= e!693564 e!693567)))

(declare-fun c!120275 () Bool)

(assert (=> b!1221330 (= c!120275 (bvslt from!1455 (size!38590 _keys!1208)))))

(declare-fun b!1221331 () Bool)

(declare-fun e!693562 () Bool)

(assert (=> b!1221331 (= e!693562 (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455)))))

(assert (=> b!1221331 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60723 () Bool)

(declare-fun call!60726 () ListLongMap!18021)

(assert (=> bm!60723 (= call!60726 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1221332 () Bool)

(declare-fun e!693566 () Bool)

(assert (=> b!1221332 (= e!693564 e!693566)))

(assert (=> b!1221332 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38590 _keys!1208)))))

(declare-fun lt!555531 () ListLongMap!18021)

(declare-fun res!811364 () Bool)

(assert (=> b!1221332 (= res!811364 (contains!7021 lt!555531 (select (arr!38054 _keys!1208) from!1455)))))

(assert (=> b!1221332 (=> (not res!811364) (not e!693566))))

(declare-fun b!1221333 () Bool)

(declare-fun e!693563 () ListLongMap!18021)

(assert (=> b!1221333 (= e!693563 (ListLongMap!18022 Nil!26851))))

(declare-fun b!1221334 () Bool)

(declare-fun e!693568 () Bool)

(assert (=> b!1221334 (= e!693568 e!693564)))

(declare-fun c!120274 () Bool)

(assert (=> b!1221334 (= c!120274 e!693562)))

(declare-fun res!811361 () Bool)

(assert (=> b!1221334 (=> (not res!811361) (not e!693562))))

(assert (=> b!1221334 (= res!811361 (bvslt from!1455 (size!38590 _keys!1208)))))

(declare-fun b!1221335 () Bool)

(assert (=> b!1221335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38590 _keys!1208)))))

(assert (=> b!1221335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38591 _values!996)))))

(assert (=> b!1221335 (= e!693566 (= (apply!975 lt!555531 (select (arr!38054 _keys!1208) from!1455)) (get!19418 (select (arr!38055 _values!996) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221336 () Bool)

(declare-fun lt!555530 () Unit!40456)

(declare-fun lt!555525 () Unit!40456)

(assert (=> b!1221336 (= lt!555530 lt!555525)))

(declare-fun lt!555527 () V!46507)

(declare-fun lt!555529 () (_ BitVec 64))

(declare-fun lt!555526 () ListLongMap!18021)

(declare-fun lt!555528 () (_ BitVec 64))

(assert (=> b!1221336 (not (contains!7021 (+!4091 lt!555526 (tuple2!20053 lt!555528 lt!555527)) lt!555529))))

(assert (=> b!1221336 (= lt!555525 (addStillNotContains!303 lt!555526 lt!555528 lt!555527 lt!555529))))

(assert (=> b!1221336 (= lt!555529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221336 (= lt!555527 (get!19418 (select (arr!38055 _values!996) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221336 (= lt!555528 (select (arr!38054 _keys!1208) from!1455))))

(assert (=> b!1221336 (= lt!555526 call!60726)))

(declare-fun e!693565 () ListLongMap!18021)

(assert (=> b!1221336 (= e!693565 (+!4091 call!60726 (tuple2!20053 (select (arr!38054 _keys!1208) from!1455) (get!19418 (select (arr!38055 _values!996) from!1455) (dynLambda!3328 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221337 () Bool)

(assert (=> b!1221337 (= e!693565 call!60726)))

(declare-fun d!133835 () Bool)

(assert (=> d!133835 e!693568))

(declare-fun res!811362 () Bool)

(assert (=> d!133835 (=> (not res!811362) (not e!693568))))

(assert (=> d!133835 (= res!811362 (not (contains!7021 lt!555531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133835 (= lt!555531 e!693563)))

(declare-fun c!120276 () Bool)

(assert (=> d!133835 (= c!120276 (bvsge from!1455 (size!38590 _keys!1208)))))

(assert (=> d!133835 (validMask!0 mask!1564)))

(assert (=> d!133835 (= (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555531)))

(declare-fun b!1221338 () Bool)

(assert (=> b!1221338 (= e!693563 e!693565)))

(declare-fun c!120273 () Bool)

(assert (=> b!1221338 (= c!120273 (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455)))))

(declare-fun b!1221339 () Bool)

(assert (=> b!1221339 (= e!693567 (isEmpty!999 lt!555531))))

(declare-fun b!1221340 () Bool)

(declare-fun res!811363 () Bool)

(assert (=> b!1221340 (=> (not res!811363) (not e!693568))))

(assert (=> b!1221340 (= res!811363 (not (contains!7021 lt!555531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221341 () Bool)

(assert (=> b!1221341 (= e!693567 (= lt!555531 (getCurrentListMapNoExtraKeys!5448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133835 c!120276) b!1221333))

(assert (= (and d!133835 (not c!120276)) b!1221338))

(assert (= (and b!1221338 c!120273) b!1221336))

(assert (= (and b!1221338 (not c!120273)) b!1221337))

(assert (= (or b!1221336 b!1221337) bm!60723))

(assert (= (and d!133835 res!811362) b!1221340))

(assert (= (and b!1221340 res!811363) b!1221334))

(assert (= (and b!1221334 res!811361) b!1221331))

(assert (= (and b!1221334 c!120274) b!1221332))

(assert (= (and b!1221334 (not c!120274)) b!1221330))

(assert (= (and b!1221332 res!811364) b!1221335))

(assert (= (and b!1221330 c!120275) b!1221341))

(assert (= (and b!1221330 (not c!120275)) b!1221339))

(declare-fun b_lambda!22217 () Bool)

(assert (=> (not b_lambda!22217) (not b!1221335)))

(assert (=> b!1221335 t!40163))

(declare-fun b_and!43891 () Bool)

(assert (= b_and!43889 (and (=> t!40163 result!22869) b_and!43891)))

(declare-fun b_lambda!22219 () Bool)

(assert (=> (not b_lambda!22219) (not b!1221336)))

(assert (=> b!1221336 t!40163))

(declare-fun b_and!43893 () Bool)

(assert (= b_and!43891 (and (=> t!40163 result!22869) b_and!43893)))

(declare-fun m!1126241 () Bool)

(assert (=> b!1221339 m!1126241))

(declare-fun m!1126243 () Bool)

(assert (=> b!1221340 m!1126243))

(assert (=> b!1221338 m!1125979))

(assert (=> b!1221338 m!1125979))

(assert (=> b!1221338 m!1126019))

(assert (=> b!1221336 m!1125981))

(assert (=> b!1221336 m!1125981))

(assert (=> b!1221336 m!1125975))

(declare-fun m!1126245 () Bool)

(assert (=> b!1221336 m!1126245))

(declare-fun m!1126247 () Bool)

(assert (=> b!1221336 m!1126247))

(declare-fun m!1126249 () Bool)

(assert (=> b!1221336 m!1126249))

(declare-fun m!1126251 () Bool)

(assert (=> b!1221336 m!1126251))

(assert (=> b!1221336 m!1125975))

(assert (=> b!1221336 m!1126251))

(declare-fun m!1126253 () Bool)

(assert (=> b!1221336 m!1126253))

(assert (=> b!1221336 m!1125979))

(assert (=> b!1221335 m!1125981))

(assert (=> b!1221335 m!1125979))

(assert (=> b!1221335 m!1125981))

(assert (=> b!1221335 m!1125975))

(assert (=> b!1221335 m!1126245))

(assert (=> b!1221335 m!1125979))

(declare-fun m!1126255 () Bool)

(assert (=> b!1221335 m!1126255))

(assert (=> b!1221335 m!1125975))

(assert (=> b!1221331 m!1125979))

(assert (=> b!1221331 m!1125979))

(assert (=> b!1221331 m!1126019))

(declare-fun m!1126257 () Bool)

(assert (=> b!1221341 m!1126257))

(assert (=> b!1221332 m!1125979))

(assert (=> b!1221332 m!1125979))

(declare-fun m!1126259 () Bool)

(assert (=> b!1221332 m!1126259))

(assert (=> bm!60723 m!1126257))

(declare-fun m!1126261 () Bool)

(assert (=> d!133835 m!1126261))

(assert (=> d!133835 m!1125991))

(assert (=> b!1221138 d!133835))

(declare-fun b!1221342 () Bool)

(declare-fun e!693571 () Bool)

(declare-fun call!60727 () Bool)

(assert (=> b!1221342 (= e!693571 call!60727)))

(declare-fun bm!60724 () Bool)

(declare-fun c!120277 () Bool)

(assert (=> bm!60724 (= call!60727 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120277 (Cons!26849 (select (arr!38054 _keys!1208) from!1455) Nil!26850) Nil!26850)))))

(declare-fun b!1221343 () Bool)

(declare-fun e!693570 () Bool)

(assert (=> b!1221343 (= e!693570 e!693571)))

(assert (=> b!1221343 (= c!120277 (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455)))))

(declare-fun d!133837 () Bool)

(declare-fun res!811365 () Bool)

(declare-fun e!693569 () Bool)

(assert (=> d!133837 (=> res!811365 e!693569)))

(assert (=> d!133837 (= res!811365 (bvsge from!1455 (size!38590 _keys!1208)))))

(assert (=> d!133837 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26850) e!693569)))

(declare-fun b!1221344 () Bool)

(assert (=> b!1221344 (= e!693571 call!60727)))

(declare-fun b!1221345 () Bool)

(declare-fun e!693572 () Bool)

(assert (=> b!1221345 (= e!693572 (contains!7020 Nil!26850 (select (arr!38054 _keys!1208) from!1455)))))

(declare-fun b!1221346 () Bool)

(assert (=> b!1221346 (= e!693569 e!693570)))

(declare-fun res!811367 () Bool)

(assert (=> b!1221346 (=> (not res!811367) (not e!693570))))

(assert (=> b!1221346 (= res!811367 (not e!693572))))

(declare-fun res!811366 () Bool)

(assert (=> b!1221346 (=> (not res!811366) (not e!693572))))

(assert (=> b!1221346 (= res!811366 (validKeyInArray!0 (select (arr!38054 _keys!1208) from!1455)))))

(assert (= (and d!133837 (not res!811365)) b!1221346))

(assert (= (and b!1221346 res!811366) b!1221345))

(assert (= (and b!1221346 res!811367) b!1221343))

(assert (= (and b!1221343 c!120277) b!1221342))

(assert (= (and b!1221343 (not c!120277)) b!1221344))

(assert (= (or b!1221342 b!1221344) bm!60724))

(assert (=> bm!60724 m!1125979))

(declare-fun m!1126263 () Bool)

(assert (=> bm!60724 m!1126263))

(assert (=> b!1221343 m!1125979))

(assert (=> b!1221343 m!1125979))

(assert (=> b!1221343 m!1126019))

(assert (=> b!1221345 m!1125979))

(assert (=> b!1221345 m!1125979))

(declare-fun m!1126265 () Bool)

(assert (=> b!1221345 m!1126265))

(assert (=> b!1221346 m!1125979))

(assert (=> b!1221346 m!1125979))

(assert (=> b!1221346 m!1126019))

(assert (=> b!1221119 d!133837))

(declare-fun d!133839 () Bool)

(assert (=> d!133839 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26850)))

(declare-fun lt!555534 () Unit!40456)

(declare-fun choose!39 (array!78849 (_ BitVec 32) (_ BitVec 32)) Unit!40456)

(assert (=> d!133839 (= lt!555534 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133839 (bvslt (size!38590 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133839 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555534)))

(declare-fun bs!34378 () Bool)

(assert (= bs!34378 d!133839))

(assert (=> bs!34378 m!1126023))

(declare-fun m!1126267 () Bool)

(assert (=> bs!34378 m!1126267))

(assert (=> b!1221119 d!133839))

(declare-fun d!133841 () Bool)

(declare-fun res!811368 () Bool)

(declare-fun e!693573 () Bool)

(assert (=> d!133841 (=> res!811368 e!693573)))

(assert (=> d!133841 (= res!811368 (= (select (arr!38054 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133841 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693573)))

(declare-fun b!1221347 () Bool)

(declare-fun e!693574 () Bool)

(assert (=> b!1221347 (= e!693573 e!693574)))

(declare-fun res!811369 () Bool)

(assert (=> b!1221347 (=> (not res!811369) (not e!693574))))

(assert (=> b!1221347 (= res!811369 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38590 _keys!1208)))))

(declare-fun b!1221348 () Bool)

(assert (=> b!1221348 (= e!693574 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133841 (not res!811368)) b!1221347))

(assert (= (and b!1221347 res!811369) b!1221348))

(assert (=> d!133841 m!1126177))

(declare-fun m!1126269 () Bool)

(assert (=> b!1221348 m!1126269))

(assert (=> b!1221119 d!133841))

(declare-fun d!133843 () Bool)

(assert (=> d!133843 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555537 () Unit!40456)

(declare-fun choose!114 (array!78849 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40456)

(assert (=> d!133843 (= lt!555537 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133843 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133843 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555537)))

(declare-fun bs!34379 () Bool)

(assert (= bs!34379 d!133843))

(assert (=> bs!34379 m!1126027))

(declare-fun m!1126271 () Bool)

(assert (=> bs!34379 m!1126271))

(assert (=> b!1221119 d!133843))

(declare-fun b!1221349 () Bool)

(declare-fun e!693576 () Bool)

(declare-fun call!60728 () Bool)

(assert (=> b!1221349 (= e!693576 call!60728)))

(declare-fun b!1221350 () Bool)

(declare-fun e!693575 () Bool)

(assert (=> b!1221350 (= e!693575 call!60728)))

(declare-fun b!1221351 () Bool)

(declare-fun e!693577 () Bool)

(assert (=> b!1221351 (= e!693577 e!693576)))

(declare-fun c!120278 () Bool)

(assert (=> b!1221351 (= c!120278 (validKeyInArray!0 (select (arr!38054 lt!555415) #b00000000000000000000000000000000)))))

(declare-fun d!133845 () Bool)

(declare-fun res!811370 () Bool)

(assert (=> d!133845 (=> res!811370 e!693577)))

(assert (=> d!133845 (= res!811370 (bvsge #b00000000000000000000000000000000 (size!38590 lt!555415)))))

(assert (=> d!133845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555415 mask!1564) e!693577)))

(declare-fun b!1221352 () Bool)

(assert (=> b!1221352 (= e!693576 e!693575)))

(declare-fun lt!555538 () (_ BitVec 64))

(assert (=> b!1221352 (= lt!555538 (select (arr!38054 lt!555415) #b00000000000000000000000000000000))))

(declare-fun lt!555540 () Unit!40456)

(assert (=> b!1221352 (= lt!555540 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555415 lt!555538 #b00000000000000000000000000000000))))

(assert (=> b!1221352 (arrayContainsKey!0 lt!555415 lt!555538 #b00000000000000000000000000000000)))

(declare-fun lt!555539 () Unit!40456)

(assert (=> b!1221352 (= lt!555539 lt!555540)))

(declare-fun res!811371 () Bool)

(assert (=> b!1221352 (= res!811371 (= (seekEntryOrOpen!0 (select (arr!38054 lt!555415) #b00000000000000000000000000000000) lt!555415 mask!1564) (Found!9948 #b00000000000000000000000000000000)))))

(assert (=> b!1221352 (=> (not res!811371) (not e!693575))))

(declare-fun bm!60725 () Bool)

(assert (=> bm!60725 (= call!60728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555415 mask!1564))))

(assert (= (and d!133845 (not res!811370)) b!1221351))

(assert (= (and b!1221351 c!120278) b!1221352))

(assert (= (and b!1221351 (not c!120278)) b!1221349))

(assert (= (and b!1221352 res!811371) b!1221350))

(assert (= (or b!1221350 b!1221349) bm!60725))

(assert (=> b!1221351 m!1126129))

(assert (=> b!1221351 m!1126129))

(assert (=> b!1221351 m!1126133))

(assert (=> b!1221352 m!1126129))

(declare-fun m!1126273 () Bool)

(assert (=> b!1221352 m!1126273))

(declare-fun m!1126275 () Bool)

(assert (=> b!1221352 m!1126275))

(assert (=> b!1221352 m!1126129))

(declare-fun m!1126277 () Bool)

(assert (=> b!1221352 m!1126277))

(declare-fun m!1126279 () Bool)

(assert (=> bm!60725 m!1126279))

(assert (=> b!1221121 d!133845))

(declare-fun mapIsEmpty!48448 () Bool)

(declare-fun mapRes!48448 () Bool)

(assert (=> mapIsEmpty!48448 mapRes!48448))

(declare-fun mapNonEmpty!48448 () Bool)

(declare-fun tp!92039 () Bool)

(declare-fun e!693582 () Bool)

(assert (=> mapNonEmpty!48448 (= mapRes!48448 (and tp!92039 e!693582))))

(declare-fun mapKey!48448 () (_ BitVec 32))

(declare-fun mapValue!48448 () ValueCell!14808)

(declare-fun mapRest!48448 () (Array (_ BitVec 32) ValueCell!14808))

(assert (=> mapNonEmpty!48448 (= mapRest!48442 (store mapRest!48448 mapKey!48448 mapValue!48448))))

(declare-fun b!1221360 () Bool)

(declare-fun e!693583 () Bool)

(assert (=> b!1221360 (= e!693583 tp_is_empty!31035)))

(declare-fun condMapEmpty!48448 () Bool)

(declare-fun mapDefault!48448 () ValueCell!14808)

(assert (=> mapNonEmpty!48442 (= condMapEmpty!48448 (= mapRest!48442 ((as const (Array (_ BitVec 32) ValueCell!14808)) mapDefault!48448)))))

(assert (=> mapNonEmpty!48442 (= tp!92030 (and e!693583 mapRes!48448))))

(declare-fun b!1221359 () Bool)

(assert (=> b!1221359 (= e!693582 tp_is_empty!31035)))

(assert (= (and mapNonEmpty!48442 condMapEmpty!48448) mapIsEmpty!48448))

(assert (= (and mapNonEmpty!48442 (not condMapEmpty!48448)) mapNonEmpty!48448))

(assert (= (and mapNonEmpty!48448 ((_ is ValueCellFull!14808) mapValue!48448)) b!1221359))

(assert (= (and mapNonEmpty!48442 ((_ is ValueCellFull!14808) mapDefault!48448)) b!1221360))

(declare-fun m!1126281 () Bool)

(assert (=> mapNonEmpty!48448 m!1126281))

(declare-fun b_lambda!22221 () Bool)

(assert (= b_lambda!22211 (or (and start!101544 b_free!26331) b_lambda!22221)))

(declare-fun b_lambda!22223 () Bool)

(assert (= b_lambda!22219 (or (and start!101544 b_free!26331) b_lambda!22223)))

(declare-fun b_lambda!22225 () Bool)

(assert (= b_lambda!22217 (or (and start!101544 b_free!26331) b_lambda!22225)))

(declare-fun b_lambda!22227 () Bool)

(assert (= b_lambda!22209 (or (and start!101544 b_free!26331) b_lambda!22227)))

(declare-fun b_lambda!22229 () Bool)

(assert (= b_lambda!22215 (or (and start!101544 b_free!26331) b_lambda!22229)))

(declare-fun b_lambda!22231 () Bool)

(assert (= b_lambda!22207 (or (and start!101544 b_free!26331) b_lambda!22231)))

(declare-fun b_lambda!22233 () Bool)

(assert (= b_lambda!22203 (or (and start!101544 b_free!26331) b_lambda!22233)))

(declare-fun b_lambda!22235 () Bool)

(assert (= b_lambda!22205 (or (and start!101544 b_free!26331) b_lambda!22235)))

(declare-fun b_lambda!22237 () Bool)

(assert (= b_lambda!22213 (or (and start!101544 b_free!26331) b_lambda!22237)))

(check-sat (not b!1221331) (not b!1221329) (not b!1221346) (not b!1221282) (not b!1221341) (not d!133835) tp_is_empty!31035 (not b!1221284) (not b!1221207) (not b!1221228) (not b!1221323) (not b_lambda!22237) (not b!1221351) (not b_lambda!22201) (not b!1221336) (not b!1221240) (not b!1221304) (not b!1221275) (not d!133827) (not b!1221278) (not d!133819) b_and!43893 (not b!1221338) (not d!133823) (not b!1221274) (not b!1221324) (not b!1221305) (not b!1221303) (not b_lambda!22233) (not b!1221229) (not bm!60716) (not b!1221226) (not b!1221295) (not b!1221317) (not b!1221328) (not bm!60724) (not b_lambda!22231) (not b!1221332) (not b!1221248) (not b_lambda!22223) (not b_lambda!22229) (not b!1221243) (not b!1221320) (not bm!60708) (not b!1221296) (not b!1221241) (not bm!60711) (not b!1221326) (not bm!60717) (not b!1221302) (not b!1221339) (not b!1221208) (not b!1221335) (not b_lambda!22235) (not d!133833) (not bm!60721) (not b!1221291) (not b!1221245) (not b!1221340) (not b_lambda!22221) (not b!1221316) (not d!133801) (not b!1221300) (not b!1221283) (not b!1221235) (not b!1221348) (not bm!60723) (not b!1221214) (not bm!60707) (not b!1221327) (not mapNonEmpty!48448) (not d!133809) (not d!133843) (not b!1221247) (not b_lambda!22227) (not b_next!26331) (not b!1221345) (not b_lambda!22225) (not b!1221299) (not b!1221352) (not b!1221343) (not b!1221234) (not b!1221319) (not bm!60725) (not b!1221279) (not b!1221281) (not bm!60718) (not d!133839) (not bm!60722) (not d!133825))
(check-sat b_and!43893 (not b_next!26331))
