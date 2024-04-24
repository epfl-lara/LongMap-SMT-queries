; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99618 () Bool)

(assert start!99618)

(declare-fun b_free!24961 () Bool)

(declare-fun b_next!24961 () Bool)

(assert (=> start!99618 (= b_free!24961 (not b_next!24961))))

(declare-fun tp!87597 () Bool)

(declare-fun b_and!40791 () Bool)

(assert (=> start!99618 (= tp!87597 b_and!40791)))

(declare-fun b!1174024 () Bool)

(declare-fun res!779199 () Bool)

(declare-fun e!667413 () Bool)

(assert (=> b!1174024 (=> (not res!779199) (not e!667413))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174024 (= res!779199 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46064 () Bool)

(declare-fun mapRes!46064 () Bool)

(declare-fun tp!87596 () Bool)

(declare-fun e!667408 () Bool)

(assert (=> mapNonEmpty!46064 (= mapRes!46064 (and tp!87596 e!667408))))

(declare-datatypes ((V!44449 0))(
  ( (V!44450 (val!14802 Int)) )
))
(declare-datatypes ((ValueCell!14036 0))(
  ( (ValueCellFull!14036 (v!17436 V!44449)) (EmptyCell!14036) )
))
(declare-fun mapValue!46064 () ValueCell!14036)

(declare-fun mapRest!46064 () (Array (_ BitVec 32) ValueCell!14036))

(declare-fun mapKey!46064 () (_ BitVec 32))

(declare-datatypes ((array!75849 0))(
  ( (array!75850 (arr!36568 (Array (_ BitVec 32) ValueCell!14036)) (size!37105 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75849)

(assert (=> mapNonEmpty!46064 (= (arr!36568 _values!996) (store mapRest!46064 mapKey!46064 mapValue!46064))))

(declare-fun mapIsEmpty!46064 () Bool)

(assert (=> mapIsEmpty!46064 mapRes!46064))

(declare-fun b!1174025 () Bool)

(declare-datatypes ((Unit!38645 0))(
  ( (Unit!38646) )
))
(declare-fun e!667418 () Unit!38645)

(declare-fun Unit!38647 () Unit!38645)

(assert (=> b!1174025 (= e!667418 Unit!38647)))

(declare-datatypes ((array!75851 0))(
  ( (array!75852 (arr!36569 (Array (_ BitVec 32) (_ BitVec 64))) (size!37106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75851)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!528941 () Unit!38645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75851 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38645)

(assert (=> b!1174025 (= lt!528941 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174025 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528944 () Unit!38645)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75851 (_ BitVec 32) (_ BitVec 32)) Unit!38645)

(assert (=> b!1174025 (= lt!528944 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25683 0))(
  ( (Nil!25680) (Cons!25679 (h!26897 (_ BitVec 64)) (t!37628 List!25683)) )
))
(declare-fun arrayNoDuplicates!0 (array!75851 (_ BitVec 32) List!25683) Bool)

(assert (=> b!1174025 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25680)))

(declare-fun lt!528933 () Unit!38645)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75851 (_ BitVec 64) (_ BitVec 32) List!25683) Unit!38645)

(assert (=> b!1174025 (= lt!528933 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25680))))

(assert (=> b!1174025 false))

(declare-fun b!1174026 () Bool)

(declare-fun res!779204 () Bool)

(assert (=> b!1174026 (=> (not res!779204) (not e!667413))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75851 (_ BitVec 32)) Bool)

(assert (=> b!1174026 (= res!779204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174027 () Bool)

(declare-fun e!667416 () Bool)

(assert (=> b!1174027 (= e!667416 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174028 () Bool)

(declare-fun Unit!38648 () Unit!38645)

(assert (=> b!1174028 (= e!667418 Unit!38648)))

(declare-fun b!1174029 () Bool)

(declare-fun e!667407 () Bool)

(assert (=> b!1174029 (= e!667407 e!667416)))

(declare-fun res!779203 () Bool)

(assert (=> b!1174029 (=> res!779203 e!667416)))

(assert (=> b!1174029 (= res!779203 (not (= (select (arr!36569 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174030 () Bool)

(declare-fun e!667412 () Bool)

(assert (=> b!1174030 (= e!667413 e!667412)))

(declare-fun res!779198 () Bool)

(assert (=> b!1174030 (=> (not res!779198) (not e!667412))))

(declare-fun lt!528943 () array!75851)

(assert (=> b!1174030 (= res!779198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528943 mask!1564))))

(assert (=> b!1174030 (= lt!528943 (array!75852 (store (arr!36569 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37106 _keys!1208)))))

(declare-fun b!1174031 () Bool)

(declare-fun res!779201 () Bool)

(assert (=> b!1174031 (=> (not res!779201) (not e!667412))))

(assert (=> b!1174031 (= res!779201 (arrayNoDuplicates!0 lt!528943 #b00000000000000000000000000000000 Nil!25680))))

(declare-fun b!1174033 () Bool)

(declare-fun e!667411 () Bool)

(declare-fun e!667415 () Bool)

(assert (=> b!1174033 (= e!667411 e!667415)))

(declare-fun res!779196 () Bool)

(assert (=> b!1174033 (=> res!779196 e!667415)))

(assert (=> b!1174033 (= res!779196 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528942 () array!75849)

(declare-fun minValue!944 () V!44449)

(declare-datatypes ((tuple2!18946 0))(
  ( (tuple2!18947 (_1!9484 (_ BitVec 64)) (_2!9484 V!44449)) )
))
(declare-datatypes ((List!25684 0))(
  ( (Nil!25681) (Cons!25680 (h!26898 tuple2!18946) (t!37629 List!25684)) )
))
(declare-datatypes ((ListLongMap!16923 0))(
  ( (ListLongMap!16924 (toList!8477 List!25684)) )
))
(declare-fun lt!528939 () ListLongMap!16923)

(declare-fun zeroValue!944 () V!44449)

(declare-fun getCurrentListMapNoExtraKeys!4964 (array!75851 array!75849 (_ BitVec 32) (_ BitVec 32) V!44449 V!44449 (_ BitVec 32) Int) ListLongMap!16923)

(assert (=> b!1174033 (= lt!528939 (getCurrentListMapNoExtraKeys!4964 lt!528943 lt!528942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528940 () V!44449)

(assert (=> b!1174033 (= lt!528942 (array!75850 (store (arr!36568 _values!996) i!673 (ValueCellFull!14036 lt!528940)) (size!37105 _values!996)))))

(declare-fun dynLambda!2942 (Int (_ BitVec 64)) V!44449)

(assert (=> b!1174033 (= lt!528940 (dynLambda!2942 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528934 () ListLongMap!16923)

(assert (=> b!1174033 (= lt!528934 (getCurrentListMapNoExtraKeys!4964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174034 () Bool)

(declare-fun e!667414 () Bool)

(declare-fun tp_is_empty!29491 () Bool)

(assert (=> b!1174034 (= e!667414 tp_is_empty!29491)))

(declare-fun b!1174035 () Bool)

(declare-fun res!779200 () Bool)

(assert (=> b!1174035 (=> (not res!779200) (not e!667413))))

(assert (=> b!1174035 (= res!779200 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37106 _keys!1208))))))

(declare-fun b!1174036 () Bool)

(assert (=> b!1174036 (= e!667408 tp_is_empty!29491)))

(declare-fun b!1174032 () Bool)

(declare-fun res!779202 () Bool)

(assert (=> b!1174032 (=> (not res!779202) (not e!667413))))

(assert (=> b!1174032 (= res!779202 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25680))))

(declare-fun res!779197 () Bool)

(assert (=> start!99618 (=> (not res!779197) (not e!667413))))

(assert (=> start!99618 (= res!779197 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37106 _keys!1208))))))

(assert (=> start!99618 e!667413))

(assert (=> start!99618 tp_is_empty!29491))

(declare-fun array_inv!28018 (array!75851) Bool)

(assert (=> start!99618 (array_inv!28018 _keys!1208)))

(assert (=> start!99618 true))

(assert (=> start!99618 tp!87597))

(declare-fun e!667409 () Bool)

(declare-fun array_inv!28019 (array!75849) Bool)

(assert (=> start!99618 (and (array_inv!28019 _values!996) e!667409)))

(declare-fun b!1174037 () Bool)

(declare-fun e!667410 () Bool)

(assert (=> b!1174037 (= e!667410 true)))

(assert (=> b!1174037 (not (= (select (arr!36569 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528937 () Unit!38645)

(assert (=> b!1174037 (= lt!528937 e!667418)))

(declare-fun c!116963 () Bool)

(assert (=> b!1174037 (= c!116963 (= (select (arr!36569 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174037 e!667407))

(declare-fun res!779193 () Bool)

(assert (=> b!1174037 (=> (not res!779193) (not e!667407))))

(declare-fun lt!528935 () ListLongMap!16923)

(declare-fun +!3810 (ListLongMap!16923 tuple2!18946) ListLongMap!16923)

(declare-fun get!18682 (ValueCell!14036 V!44449) V!44449)

(assert (=> b!1174037 (= res!779193 (= lt!528939 (+!3810 lt!528935 (tuple2!18947 (select (arr!36569 _keys!1208) from!1455) (get!18682 (select (arr!36568 _values!996) from!1455) lt!528940)))))))

(declare-fun b!1174038 () Bool)

(declare-fun res!779194 () Bool)

(assert (=> b!1174038 (=> (not res!779194) (not e!667413))))

(assert (=> b!1174038 (= res!779194 (= (select (arr!36569 _keys!1208) i!673) k0!934))))

(declare-fun b!1174039 () Bool)

(assert (=> b!1174039 (= e!667412 (not e!667411))))

(declare-fun res!779195 () Bool)

(assert (=> b!1174039 (=> res!779195 e!667411)))

(assert (=> b!1174039 (= res!779195 (bvsgt from!1455 i!673))))

(assert (=> b!1174039 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528936 () Unit!38645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75851 (_ BitVec 64) (_ BitVec 32)) Unit!38645)

(assert (=> b!1174039 (= lt!528936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174040 () Bool)

(assert (=> b!1174040 (= e!667409 (and e!667414 mapRes!46064))))

(declare-fun condMapEmpty!46064 () Bool)

(declare-fun mapDefault!46064 () ValueCell!14036)

(assert (=> b!1174040 (= condMapEmpty!46064 (= (arr!36568 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14036)) mapDefault!46064)))))

(declare-fun b!1174041 () Bool)

(declare-fun res!779192 () Bool)

(assert (=> b!1174041 (=> (not res!779192) (not e!667413))))

(assert (=> b!1174041 (= res!779192 (and (= (size!37105 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37106 _keys!1208) (size!37105 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174042 () Bool)

(assert (=> b!1174042 (= e!667415 e!667410)))

(declare-fun res!779191 () Bool)

(assert (=> b!1174042 (=> res!779191 e!667410)))

(assert (=> b!1174042 (= res!779191 (not (validKeyInArray!0 (select (arr!36569 _keys!1208) from!1455))))))

(declare-fun lt!528945 () ListLongMap!16923)

(assert (=> b!1174042 (= lt!528945 lt!528935)))

(declare-fun lt!528938 () ListLongMap!16923)

(declare-fun -!1528 (ListLongMap!16923 (_ BitVec 64)) ListLongMap!16923)

(assert (=> b!1174042 (= lt!528935 (-!1528 lt!528938 k0!934))))

(assert (=> b!1174042 (= lt!528945 (getCurrentListMapNoExtraKeys!4964 lt!528943 lt!528942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174042 (= lt!528938 (getCurrentListMapNoExtraKeys!4964 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528946 () Unit!38645)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 (array!75851 array!75849 (_ BitVec 32) (_ BitVec 32) V!44449 V!44449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38645)

(assert (=> b!1174042 (= lt!528946 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!753 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174043 () Bool)

(declare-fun res!779190 () Bool)

(assert (=> b!1174043 (=> (not res!779190) (not e!667413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174043 (= res!779190 (validMask!0 mask!1564))))

(assert (= (and start!99618 res!779197) b!1174043))

(assert (= (and b!1174043 res!779190) b!1174041))

(assert (= (and b!1174041 res!779192) b!1174026))

(assert (= (and b!1174026 res!779204) b!1174032))

(assert (= (and b!1174032 res!779202) b!1174035))

(assert (= (and b!1174035 res!779200) b!1174024))

(assert (= (and b!1174024 res!779199) b!1174038))

(assert (= (and b!1174038 res!779194) b!1174030))

(assert (= (and b!1174030 res!779198) b!1174031))

(assert (= (and b!1174031 res!779201) b!1174039))

(assert (= (and b!1174039 (not res!779195)) b!1174033))

(assert (= (and b!1174033 (not res!779196)) b!1174042))

(assert (= (and b!1174042 (not res!779191)) b!1174037))

(assert (= (and b!1174037 res!779193) b!1174029))

(assert (= (and b!1174029 (not res!779203)) b!1174027))

(assert (= (and b!1174037 c!116963) b!1174025))

(assert (= (and b!1174037 (not c!116963)) b!1174028))

(assert (= (and b!1174040 condMapEmpty!46064) mapIsEmpty!46064))

(assert (= (and b!1174040 (not condMapEmpty!46064)) mapNonEmpty!46064))

(get-info :version)

(assert (= (and mapNonEmpty!46064 ((_ is ValueCellFull!14036) mapValue!46064)) b!1174036))

(assert (= (and b!1174040 ((_ is ValueCellFull!14036) mapDefault!46064)) b!1174034))

(assert (= start!99618 b!1174040))

(declare-fun b_lambda!20099 () Bool)

(assert (=> (not b_lambda!20099) (not b!1174033)))

(declare-fun t!37627 () Bool)

(declare-fun tb!9765 () Bool)

(assert (=> (and start!99618 (= defaultEntry!1004 defaultEntry!1004) t!37627) tb!9765))

(declare-fun result!20105 () Bool)

(assert (=> tb!9765 (= result!20105 tp_is_empty!29491)))

(assert (=> b!1174033 t!37627))

(declare-fun b_and!40793 () Bool)

(assert (= b_and!40791 (and (=> t!37627 result!20105) b_and!40793)))

(declare-fun m!1082127 () Bool)

(assert (=> b!1174043 m!1082127))

(declare-fun m!1082129 () Bool)

(assert (=> b!1174031 m!1082129))

(declare-fun m!1082131 () Bool)

(assert (=> mapNonEmpty!46064 m!1082131))

(declare-fun m!1082133 () Bool)

(assert (=> b!1174029 m!1082133))

(declare-fun m!1082135 () Bool)

(assert (=> b!1174024 m!1082135))

(declare-fun m!1082137 () Bool)

(assert (=> b!1174030 m!1082137))

(declare-fun m!1082139 () Bool)

(assert (=> b!1174030 m!1082139))

(declare-fun m!1082141 () Bool)

(assert (=> start!99618 m!1082141))

(declare-fun m!1082143 () Bool)

(assert (=> start!99618 m!1082143))

(declare-fun m!1082145 () Bool)

(assert (=> b!1174025 m!1082145))

(declare-fun m!1082147 () Bool)

(assert (=> b!1174025 m!1082147))

(declare-fun m!1082149 () Bool)

(assert (=> b!1174025 m!1082149))

(declare-fun m!1082151 () Bool)

(assert (=> b!1174025 m!1082151))

(declare-fun m!1082153 () Bool)

(assert (=> b!1174025 m!1082153))

(declare-fun m!1082155 () Bool)

(assert (=> b!1174027 m!1082155))

(declare-fun m!1082157 () Bool)

(assert (=> b!1174038 m!1082157))

(declare-fun m!1082159 () Bool)

(assert (=> b!1174042 m!1082159))

(declare-fun m!1082161 () Bool)

(assert (=> b!1174042 m!1082161))

(assert (=> b!1174042 m!1082133))

(declare-fun m!1082163 () Bool)

(assert (=> b!1174042 m!1082163))

(assert (=> b!1174042 m!1082133))

(declare-fun m!1082165 () Bool)

(assert (=> b!1174042 m!1082165))

(declare-fun m!1082167 () Bool)

(assert (=> b!1174042 m!1082167))

(declare-fun m!1082169 () Bool)

(assert (=> b!1174026 m!1082169))

(declare-fun m!1082171 () Bool)

(assert (=> b!1174033 m!1082171))

(declare-fun m!1082173 () Bool)

(assert (=> b!1174033 m!1082173))

(declare-fun m!1082175 () Bool)

(assert (=> b!1174033 m!1082175))

(declare-fun m!1082177 () Bool)

(assert (=> b!1174033 m!1082177))

(declare-fun m!1082179 () Bool)

(assert (=> b!1174039 m!1082179))

(declare-fun m!1082181 () Bool)

(assert (=> b!1174039 m!1082181))

(declare-fun m!1082183 () Bool)

(assert (=> b!1174032 m!1082183))

(assert (=> b!1174037 m!1082133))

(declare-fun m!1082185 () Bool)

(assert (=> b!1174037 m!1082185))

(assert (=> b!1174037 m!1082185))

(declare-fun m!1082187 () Bool)

(assert (=> b!1174037 m!1082187))

(declare-fun m!1082189 () Bool)

(assert (=> b!1174037 m!1082189))

(check-sat (not start!99618) (not b_next!24961) (not b!1174024) (not b!1174031) (not b!1174027) (not mapNonEmpty!46064) (not b!1174042) (not b_lambda!20099) (not b!1174037) b_and!40793 (not b!1174030) tp_is_empty!29491 (not b!1174033) (not b!1174039) (not b!1174043) (not b!1174025) (not b!1174032) (not b!1174026))
(check-sat b_and!40793 (not b_next!24961))
