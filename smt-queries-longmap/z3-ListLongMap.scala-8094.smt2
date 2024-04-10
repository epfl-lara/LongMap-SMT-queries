; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99432 () Bool)

(assert start!99432)

(declare-fun b_free!25011 () Bool)

(declare-fun b_next!25011 () Bool)

(assert (=> start!99432 (= b_free!25011 (not b_next!25011))))

(declare-fun tp!87747 () Bool)

(declare-fun b_and!40889 () Bool)

(assert (=> start!99432 (= tp!87747 b_and!40889)))

(declare-fun b!1174285 () Bool)

(declare-fun res!779820 () Bool)

(declare-fun e!667485 () Bool)

(assert (=> b!1174285 (=> (not res!779820) (not e!667485))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75893 0))(
  ( (array!75894 (arr!36596 (Array (_ BitVec 32) (_ BitVec 64))) (size!37132 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75893)

(assert (=> b!1174285 (= res!779820 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37132 _keys!1208))))))

(declare-fun b!1174286 () Bool)

(declare-fun res!779821 () Bool)

(declare-fun e!667476 () Bool)

(assert (=> b!1174286 (=> (not res!779821) (not e!667476))))

(declare-fun lt!529500 () array!75893)

(declare-datatypes ((List!25690 0))(
  ( (Nil!25687) (Cons!25686 (h!26895 (_ BitVec 64)) (t!37693 List!25690)) )
))
(declare-fun arrayNoDuplicates!0 (array!75893 (_ BitVec 32) List!25690) Bool)

(assert (=> b!1174286 (= res!779821 (arrayNoDuplicates!0 lt!529500 #b00000000000000000000000000000000 Nil!25687))))

(declare-fun b!1174287 () Bool)

(declare-fun res!779812 () Bool)

(assert (=> b!1174287 (=> (not res!779812) (not e!667485))))

(assert (=> b!1174287 (= res!779812 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25687))))

(declare-fun b!1174288 () Bool)

(declare-fun res!779816 () Bool)

(assert (=> b!1174288 (=> (not res!779816) (not e!667485))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1174288 (= res!779816 (= (select (arr!36596 _keys!1208) i!673) k0!934))))

(declare-fun b!1174289 () Bool)

(declare-fun res!779819 () Bool)

(assert (=> b!1174289 (=> (not res!779819) (not e!667485))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44515 0))(
  ( (V!44516 (val!14827 Int)) )
))
(declare-datatypes ((ValueCell!14061 0))(
  ( (ValueCellFull!14061 (v!17465 V!44515)) (EmptyCell!14061) )
))
(declare-datatypes ((array!75895 0))(
  ( (array!75896 (arr!36597 (Array (_ BitVec 32) ValueCell!14061)) (size!37133 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75895)

(assert (=> b!1174289 (= res!779819 (and (= (size!37133 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37132 _keys!1208) (size!37133 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174290 () Bool)

(declare-fun res!779811 () Bool)

(assert (=> b!1174290 (=> (not res!779811) (not e!667485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174290 (= res!779811 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46139 () Bool)

(declare-fun mapRes!46139 () Bool)

(assert (=> mapIsEmpty!46139 mapRes!46139))

(declare-fun b!1174291 () Bool)

(assert (=> b!1174291 (= e!667485 e!667476)))

(declare-fun res!779818 () Bool)

(assert (=> b!1174291 (=> (not res!779818) (not e!667476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75893 (_ BitVec 32)) Bool)

(assert (=> b!1174291 (= res!779818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529500 mask!1564))))

(assert (=> b!1174291 (= lt!529500 (array!75894 (store (arr!36596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37132 _keys!1208)))))

(declare-fun b!1174292 () Bool)

(declare-fun e!667486 () Bool)

(assert (=> b!1174292 (= e!667486 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174292 (not (= (select (arr!36596 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38738 0))(
  ( (Unit!38739) )
))
(declare-fun lt!529510 () Unit!38738)

(declare-fun e!667482 () Unit!38738)

(assert (=> b!1174292 (= lt!529510 e!667482)))

(declare-fun c!116640 () Bool)

(assert (=> b!1174292 (= c!116640 (= (select (arr!36596 _keys!1208) from!1455) k0!934))))

(declare-fun e!667479 () Bool)

(assert (=> b!1174292 e!667479))

(declare-fun res!779817 () Bool)

(assert (=> b!1174292 (=> (not res!779817) (not e!667479))))

(declare-fun lt!529499 () V!44515)

(declare-datatypes ((tuple2!18952 0))(
  ( (tuple2!18953 (_1!9487 (_ BitVec 64)) (_2!9487 V!44515)) )
))
(declare-datatypes ((List!25691 0))(
  ( (Nil!25688) (Cons!25687 (h!26896 tuple2!18952) (t!37694 List!25691)) )
))
(declare-datatypes ((ListLongMap!16921 0))(
  ( (ListLongMap!16922 (toList!8476 List!25691)) )
))
(declare-fun lt!529512 () ListLongMap!16921)

(declare-fun lt!529505 () ListLongMap!16921)

(declare-fun +!3794 (ListLongMap!16921 tuple2!18952) ListLongMap!16921)

(declare-fun get!18678 (ValueCell!14061 V!44515) V!44515)

(assert (=> b!1174292 (= res!779817 (= lt!529505 (+!3794 lt!529512 (tuple2!18953 (select (arr!36596 _keys!1208) from!1455) (get!18678 (select (arr!36597 _values!996) from!1455) lt!529499)))))))

(declare-fun b!1174293 () Bool)

(declare-fun res!779808 () Bool)

(assert (=> b!1174293 (=> (not res!779808) (not e!667485))))

(assert (=> b!1174293 (= res!779808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174294 () Bool)

(declare-fun e!667484 () Bool)

(declare-fun tp_is_empty!29541 () Bool)

(assert (=> b!1174294 (= e!667484 tp_is_empty!29541)))

(declare-fun b!1174296 () Bool)

(declare-fun Unit!38740 () Unit!38738)

(assert (=> b!1174296 (= e!667482 Unit!38740)))

(declare-fun lt!529506 () Unit!38738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75893 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38738)

(assert (=> b!1174296 (= lt!529506 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174296 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529511 () Unit!38738)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75893 (_ BitVec 32) (_ BitVec 32)) Unit!38738)

(assert (=> b!1174296 (= lt!529511 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25687)))

(declare-fun lt!529509 () Unit!38738)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75893 (_ BitVec 64) (_ BitVec 32) List!25690) Unit!38738)

(assert (=> b!1174296 (= lt!529509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25687))))

(assert (=> b!1174296 false))

(declare-fun b!1174297 () Bool)

(declare-fun res!779815 () Bool)

(assert (=> b!1174297 (=> (not res!779815) (not e!667485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174297 (= res!779815 (validMask!0 mask!1564))))

(declare-fun b!1174298 () Bool)

(declare-fun e!667475 () Bool)

(declare-fun e!667481 () Bool)

(assert (=> b!1174298 (= e!667475 e!667481)))

(declare-fun res!779807 () Bool)

(assert (=> b!1174298 (=> res!779807 e!667481)))

(assert (=> b!1174298 (= res!779807 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44515)

(declare-fun lt!529508 () array!75895)

(declare-fun zeroValue!944 () V!44515)

(declare-fun getCurrentListMapNoExtraKeys!4937 (array!75893 array!75895 (_ BitVec 32) (_ BitVec 32) V!44515 V!44515 (_ BitVec 32) Int) ListLongMap!16921)

(assert (=> b!1174298 (= lt!529505 (getCurrentListMapNoExtraKeys!4937 lt!529500 lt!529508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174298 (= lt!529508 (array!75896 (store (arr!36597 _values!996) i!673 (ValueCellFull!14061 lt!529499)) (size!37133 _values!996)))))

(declare-fun dynLambda!2905 (Int (_ BitVec 64)) V!44515)

(assert (=> b!1174298 (= lt!529499 (dynLambda!2905 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529501 () ListLongMap!16921)

(assert (=> b!1174298 (= lt!529501 (getCurrentListMapNoExtraKeys!4937 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46139 () Bool)

(declare-fun tp!87746 () Bool)

(declare-fun e!667480 () Bool)

(assert (=> mapNonEmpty!46139 (= mapRes!46139 (and tp!87746 e!667480))))

(declare-fun mapKey!46139 () (_ BitVec 32))

(declare-fun mapRest!46139 () (Array (_ BitVec 32) ValueCell!14061))

(declare-fun mapValue!46139 () ValueCell!14061)

(assert (=> mapNonEmpty!46139 (= (arr!36597 _values!996) (store mapRest!46139 mapKey!46139 mapValue!46139))))

(declare-fun b!1174299 () Bool)

(declare-fun Unit!38741 () Unit!38738)

(assert (=> b!1174299 (= e!667482 Unit!38741)))

(declare-fun b!1174300 () Bool)

(assert (=> b!1174300 (= e!667480 tp_is_empty!29541)))

(declare-fun b!1174301 () Bool)

(assert (=> b!1174301 (= e!667481 e!667486)))

(declare-fun res!779813 () Bool)

(assert (=> b!1174301 (=> res!779813 e!667486)))

(assert (=> b!1174301 (= res!779813 (not (validKeyInArray!0 (select (arr!36596 _keys!1208) from!1455))))))

(declare-fun lt!529507 () ListLongMap!16921)

(assert (=> b!1174301 (= lt!529507 lt!529512)))

(declare-fun lt!529504 () ListLongMap!16921)

(declare-fun -!1537 (ListLongMap!16921 (_ BitVec 64)) ListLongMap!16921)

(assert (=> b!1174301 (= lt!529512 (-!1537 lt!529504 k0!934))))

(assert (=> b!1174301 (= lt!529507 (getCurrentListMapNoExtraKeys!4937 lt!529500 lt!529508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174301 (= lt!529504 (getCurrentListMapNoExtraKeys!4937 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529503 () Unit!38738)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 (array!75893 array!75895 (_ BitVec 32) (_ BitVec 32) V!44515 V!44515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38738)

(assert (=> b!1174301 (= lt!529503 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!667483 () Bool)

(declare-fun b!1174302 () Bool)

(assert (=> b!1174302 (= e!667483 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!779810 () Bool)

(assert (=> start!99432 (=> (not res!779810) (not e!667485))))

(assert (=> start!99432 (= res!779810 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37132 _keys!1208))))))

(assert (=> start!99432 e!667485))

(assert (=> start!99432 tp_is_empty!29541))

(declare-fun array_inv!27956 (array!75893) Bool)

(assert (=> start!99432 (array_inv!27956 _keys!1208)))

(assert (=> start!99432 true))

(assert (=> start!99432 tp!87747))

(declare-fun e!667478 () Bool)

(declare-fun array_inv!27957 (array!75895) Bool)

(assert (=> start!99432 (and (array_inv!27957 _values!996) e!667478)))

(declare-fun b!1174295 () Bool)

(assert (=> b!1174295 (= e!667479 e!667483)))

(declare-fun res!779814 () Bool)

(assert (=> b!1174295 (=> res!779814 e!667483)))

(assert (=> b!1174295 (= res!779814 (not (= (select (arr!36596 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174303 () Bool)

(assert (=> b!1174303 (= e!667478 (and e!667484 mapRes!46139))))

(declare-fun condMapEmpty!46139 () Bool)

(declare-fun mapDefault!46139 () ValueCell!14061)

(assert (=> b!1174303 (= condMapEmpty!46139 (= (arr!36597 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14061)) mapDefault!46139)))))

(declare-fun b!1174304 () Bool)

(assert (=> b!1174304 (= e!667476 (not e!667475))))

(declare-fun res!779809 () Bool)

(assert (=> b!1174304 (=> res!779809 e!667475)))

(assert (=> b!1174304 (= res!779809 (bvsgt from!1455 i!673))))

(assert (=> b!1174304 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529502 () Unit!38738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75893 (_ BitVec 64) (_ BitVec 32)) Unit!38738)

(assert (=> b!1174304 (= lt!529502 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99432 res!779810) b!1174297))

(assert (= (and b!1174297 res!779815) b!1174289))

(assert (= (and b!1174289 res!779819) b!1174293))

(assert (= (and b!1174293 res!779808) b!1174287))

(assert (= (and b!1174287 res!779812) b!1174285))

(assert (= (and b!1174285 res!779820) b!1174290))

(assert (= (and b!1174290 res!779811) b!1174288))

(assert (= (and b!1174288 res!779816) b!1174291))

(assert (= (and b!1174291 res!779818) b!1174286))

(assert (= (and b!1174286 res!779821) b!1174304))

(assert (= (and b!1174304 (not res!779809)) b!1174298))

(assert (= (and b!1174298 (not res!779807)) b!1174301))

(assert (= (and b!1174301 (not res!779813)) b!1174292))

(assert (= (and b!1174292 res!779817) b!1174295))

(assert (= (and b!1174295 (not res!779814)) b!1174302))

(assert (= (and b!1174292 c!116640) b!1174296))

(assert (= (and b!1174292 (not c!116640)) b!1174299))

(assert (= (and b!1174303 condMapEmpty!46139) mapIsEmpty!46139))

(assert (= (and b!1174303 (not condMapEmpty!46139)) mapNonEmpty!46139))

(get-info :version)

(assert (= (and mapNonEmpty!46139 ((_ is ValueCellFull!14061) mapValue!46139)) b!1174300))

(assert (= (and b!1174303 ((_ is ValueCellFull!14061) mapDefault!46139)) b!1174294))

(assert (= start!99432 b!1174303))

(declare-fun b_lambda!20155 () Bool)

(assert (=> (not b_lambda!20155) (not b!1174298)))

(declare-fun t!37692 () Bool)

(declare-fun tb!9823 () Bool)

(assert (=> (and start!99432 (= defaultEntry!1004 defaultEntry!1004) t!37692) tb!9823))

(declare-fun result!20213 () Bool)

(assert (=> tb!9823 (= result!20213 tp_is_empty!29541)))

(assert (=> b!1174298 t!37692))

(declare-fun b_and!40891 () Bool)

(assert (= b_and!40889 (and (=> t!37692 result!20213) b_and!40891)))

(declare-fun m!1082155 () Bool)

(assert (=> b!1174288 m!1082155))

(declare-fun m!1082157 () Bool)

(assert (=> start!99432 m!1082157))

(declare-fun m!1082159 () Bool)

(assert (=> start!99432 m!1082159))

(declare-fun m!1082161 () Bool)

(assert (=> b!1174302 m!1082161))

(declare-fun m!1082163 () Bool)

(assert (=> mapNonEmpty!46139 m!1082163))

(declare-fun m!1082165 () Bool)

(assert (=> b!1174290 m!1082165))

(declare-fun m!1082167 () Bool)

(assert (=> b!1174293 m!1082167))

(declare-fun m!1082169 () Bool)

(assert (=> b!1174292 m!1082169))

(declare-fun m!1082171 () Bool)

(assert (=> b!1174292 m!1082171))

(assert (=> b!1174292 m!1082171))

(declare-fun m!1082173 () Bool)

(assert (=> b!1174292 m!1082173))

(declare-fun m!1082175 () Bool)

(assert (=> b!1174292 m!1082175))

(declare-fun m!1082177 () Bool)

(assert (=> b!1174291 m!1082177))

(declare-fun m!1082179 () Bool)

(assert (=> b!1174291 m!1082179))

(declare-fun m!1082181 () Bool)

(assert (=> b!1174287 m!1082181))

(declare-fun m!1082183 () Bool)

(assert (=> b!1174296 m!1082183))

(declare-fun m!1082185 () Bool)

(assert (=> b!1174296 m!1082185))

(declare-fun m!1082187 () Bool)

(assert (=> b!1174296 m!1082187))

(declare-fun m!1082189 () Bool)

(assert (=> b!1174296 m!1082189))

(declare-fun m!1082191 () Bool)

(assert (=> b!1174296 m!1082191))

(declare-fun m!1082193 () Bool)

(assert (=> b!1174286 m!1082193))

(assert (=> b!1174295 m!1082169))

(declare-fun m!1082195 () Bool)

(assert (=> b!1174298 m!1082195))

(declare-fun m!1082197 () Bool)

(assert (=> b!1174298 m!1082197))

(declare-fun m!1082199 () Bool)

(assert (=> b!1174298 m!1082199))

(declare-fun m!1082201 () Bool)

(assert (=> b!1174298 m!1082201))

(declare-fun m!1082203 () Bool)

(assert (=> b!1174297 m!1082203))

(declare-fun m!1082205 () Bool)

(assert (=> b!1174301 m!1082205))

(declare-fun m!1082207 () Bool)

(assert (=> b!1174301 m!1082207))

(declare-fun m!1082209 () Bool)

(assert (=> b!1174301 m!1082209))

(declare-fun m!1082211 () Bool)

(assert (=> b!1174301 m!1082211))

(assert (=> b!1174301 m!1082169))

(declare-fun m!1082213 () Bool)

(assert (=> b!1174301 m!1082213))

(assert (=> b!1174301 m!1082169))

(declare-fun m!1082215 () Bool)

(assert (=> b!1174304 m!1082215))

(declare-fun m!1082217 () Bool)

(assert (=> b!1174304 m!1082217))

(check-sat (not b!1174296) (not b!1174287) (not b!1174290) (not b_next!25011) (not b!1174301) (not b!1174286) b_and!40891 (not b!1174304) tp_is_empty!29541 (not b!1174292) (not b!1174298) (not b_lambda!20155) (not b!1174297) (not start!99432) (not b!1174291) (not mapNonEmpty!46139) (not b!1174293) (not b!1174302))
(check-sat b_and!40891 (not b_next!25011))
