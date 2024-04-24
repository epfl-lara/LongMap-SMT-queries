; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99238 () Bool)

(assert start!99238)

(declare-fun b_free!24607 () Bool)

(declare-fun b_next!24607 () Bool)

(assert (=> start!99238 (= b_free!24607 (not b_next!24607))))

(declare-fun tp!86531 () Bool)

(declare-fun b_and!40065 () Bool)

(assert (=> start!99238 (= tp!86531 b_and!40065)))

(declare-fun bm!56888 () Bool)

(declare-datatypes ((V!43977 0))(
  ( (V!43978 (val!14625 Int)) )
))
(declare-datatypes ((tuple2!18674 0))(
  ( (tuple2!18675 (_1!9348 (_ BitVec 64)) (_2!9348 V!43977)) )
))
(declare-datatypes ((List!25408 0))(
  ( (Nil!25405) (Cons!25404 (h!26622 tuple2!18674) (t!36999 List!25408)) )
))
(declare-datatypes ((ListLongMap!16651 0))(
  ( (ListLongMap!16652 (toList!8341 List!25408)) )
))
(declare-fun call!56898 () ListLongMap!16651)

(declare-fun call!56897 () ListLongMap!16651)

(assert (=> bm!56888 (= call!56898 call!56897)))

(declare-fun b!1164223 () Bool)

(declare-fun c!116722 () Bool)

(declare-fun lt!524261 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1164223 (= c!116722 (and (not lt!524261) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38357 0))(
  ( (Unit!38358) )
))
(declare-fun e!662107 () Unit!38357)

(declare-fun e!662105 () Unit!38357)

(assert (=> b!1164223 (= e!662107 e!662105)))

(declare-fun b!1164224 () Bool)

(declare-fun res!771840 () Bool)

(declare-fun e!662094 () Bool)

(assert (=> b!1164224 (=> (not res!771840) (not e!662094))))

(declare-datatypes ((array!75163 0))(
  ( (array!75164 (arr!36226 (Array (_ BitVec 32) (_ BitVec 64))) (size!36763 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75163)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75163 (_ BitVec 32)) Bool)

(assert (=> b!1164224 (= res!771840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!662102 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1164225 () Bool)

(declare-fun arrayContainsKey!0 (array!75163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164225 (= e!662102 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!662104 () Bool)

(declare-fun b!1164226 () Bool)

(assert (=> b!1164226 (= e!662104 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!771833 () Bool)

(assert (=> start!99238 (=> (not res!771833) (not e!662094))))

(assert (=> start!99238 (= res!771833 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36763 _keys!1208))))))

(assert (=> start!99238 e!662094))

(declare-fun tp_is_empty!29137 () Bool)

(assert (=> start!99238 tp_is_empty!29137))

(declare-fun array_inv!27782 (array!75163) Bool)

(assert (=> start!99238 (array_inv!27782 _keys!1208)))

(assert (=> start!99238 true))

(assert (=> start!99238 tp!86531))

(declare-datatypes ((ValueCell!13859 0))(
  ( (ValueCellFull!13859 (v!17258 V!43977)) (EmptyCell!13859) )
))
(declare-datatypes ((array!75165 0))(
  ( (array!75166 (arr!36227 (Array (_ BitVec 32) ValueCell!13859)) (size!36764 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75165)

(declare-fun e!662108 () Bool)

(declare-fun array_inv!27783 (array!75165) Bool)

(assert (=> start!99238 (and (array_inv!27783 _values!996) e!662108)))

(declare-fun b!1164227 () Bool)

(declare-fun call!56895 () Bool)

(assert (=> b!1164227 call!56895))

(declare-fun lt!524253 () Unit!38357)

(declare-fun call!56893 () Unit!38357)

(assert (=> b!1164227 (= lt!524253 call!56893)))

(declare-fun e!662096 () Unit!38357)

(assert (=> b!1164227 (= e!662096 lt!524253)))

(declare-fun bm!56889 () Bool)

(declare-fun call!56894 () Unit!38357)

(assert (=> bm!56889 (= call!56893 call!56894)))

(declare-fun mapIsEmpty!45530 () Bool)

(declare-fun mapRes!45530 () Bool)

(assert (=> mapIsEmpty!45530 mapRes!45530))

(declare-fun zeroValue!944 () V!43977)

(declare-fun lt!524258 () ListLongMap!16651)

(declare-fun c!116724 () Bool)

(declare-fun bm!56890 () Bool)

(declare-fun minValue!944 () V!43977)

(declare-fun +!3756 (ListLongMap!16651 tuple2!18674) ListLongMap!16651)

(assert (=> bm!56890 (= call!56897 (+!3756 lt!524258 (ite (or c!116724 c!116722) (tuple2!18675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1164228 () Bool)

(declare-fun e!662097 () Bool)

(assert (=> b!1164228 (= e!662108 (and e!662097 mapRes!45530))))

(declare-fun condMapEmpty!45530 () Bool)

(declare-fun mapDefault!45530 () ValueCell!13859)

(assert (=> b!1164228 (= condMapEmpty!45530 (= (arr!36227 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13859)) mapDefault!45530)))))

(declare-fun b!1164229 () Bool)

(declare-fun e!662109 () Bool)

(assert (=> b!1164229 (= e!662109 true)))

(declare-fun e!662103 () Bool)

(assert (=> b!1164229 e!662103))

(declare-fun res!771841 () Bool)

(assert (=> b!1164229 (=> (not res!771841) (not e!662103))))

(declare-fun lt!524268 () ListLongMap!16651)

(assert (=> b!1164229 (= res!771841 (= lt!524268 lt!524258))))

(declare-fun lt!524269 () ListLongMap!16651)

(declare-fun -!1435 (ListLongMap!16651 (_ BitVec 64)) ListLongMap!16651)

(assert (=> b!1164229 (= lt!524268 (-!1435 lt!524269 k0!934))))

(declare-fun lt!524250 () V!43977)

(assert (=> b!1164229 (= (-!1435 (+!3756 lt!524258 (tuple2!18675 (select (arr!36226 _keys!1208) from!1455) lt!524250)) (select (arr!36226 _keys!1208) from!1455)) lt!524258)))

(declare-fun lt!524251 () Unit!38357)

(declare-fun addThenRemoveForNewKeyIsSame!263 (ListLongMap!16651 (_ BitVec 64) V!43977) Unit!38357)

(assert (=> b!1164229 (= lt!524251 (addThenRemoveForNewKeyIsSame!263 lt!524258 (select (arr!36226 _keys!1208) from!1455) lt!524250))))

(declare-fun lt!524248 () V!43977)

(declare-fun get!18510 (ValueCell!13859 V!43977) V!43977)

(assert (=> b!1164229 (= lt!524250 (get!18510 (select (arr!36227 _values!996) from!1455) lt!524248))))

(declare-fun lt!524255 () Unit!38357)

(declare-fun e!662098 () Unit!38357)

(assert (=> b!1164229 (= lt!524255 e!662098)))

(declare-fun c!116720 () Bool)

(declare-fun contains!6858 (ListLongMap!16651 (_ BitVec 64)) Bool)

(assert (=> b!1164229 (= c!116720 (contains!6858 lt!524258 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4832 (array!75163 array!75165 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 32) Int) ListLongMap!16651)

(assert (=> b!1164229 (= lt!524258 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164230 () Bool)

(declare-fun res!771837 () Bool)

(declare-fun e!662099 () Bool)

(assert (=> b!1164230 (=> (not res!771837) (not e!662099))))

(declare-fun lt!524265 () array!75163)

(declare-datatypes ((List!25409 0))(
  ( (Nil!25406) (Cons!25405 (h!26623 (_ BitVec 64)) (t!37000 List!25409)) )
))
(declare-fun arrayNoDuplicates!0 (array!75163 (_ BitVec 32) List!25409) Bool)

(assert (=> b!1164230 (= res!771837 (arrayNoDuplicates!0 lt!524265 #b00000000000000000000000000000000 Nil!25406))))

(declare-fun b!1164231 () Bool)

(declare-fun e!662106 () Bool)

(declare-fun e!662110 () Bool)

(assert (=> b!1164231 (= e!662106 e!662110)))

(declare-fun res!771842 () Bool)

(assert (=> b!1164231 (=> res!771842 e!662110)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164231 (= res!771842 (not (= from!1455 i!673)))))

(declare-fun lt!524249 () ListLongMap!16651)

(declare-fun lt!524257 () array!75165)

(assert (=> b!1164231 (= lt!524249 (getCurrentListMapNoExtraKeys!4832 lt!524265 lt!524257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1164231 (= lt!524257 (array!75166 (store (arr!36227 _values!996) i!673 (ValueCellFull!13859 lt!524248)) (size!36764 _values!996)))))

(declare-fun dynLambda!2823 (Int (_ BitVec 64)) V!43977)

(assert (=> b!1164231 (= lt!524248 (dynLambda!2823 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1164231 (= lt!524269 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164232 () Bool)

(declare-fun res!771843 () Bool)

(assert (=> b!1164232 (=> (not res!771843) (not e!662094))))

(assert (=> b!1164232 (= res!771843 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25406))))

(declare-fun bm!56891 () Bool)

(declare-fun addStillContains!975 (ListLongMap!16651 (_ BitVec 64) V!43977 (_ BitVec 64)) Unit!38357)

(assert (=> bm!56891 (= call!56894 (addStillContains!975 lt!524258 (ite (or c!116724 c!116722) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116724 c!116722) zeroValue!944 minValue!944) k0!934))))

(declare-fun lt!524263 () ListLongMap!16651)

(declare-fun bm!56892 () Bool)

(declare-fun call!56896 () Bool)

(assert (=> bm!56892 (= call!56896 (contains!6858 (ite c!116724 lt!524263 call!56898) k0!934))))

(declare-fun bm!56893 () Bool)

(declare-fun call!56892 () ListLongMap!16651)

(assert (=> bm!56893 (= call!56892 (getCurrentListMapNoExtraKeys!4832 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164233 () Bool)

(declare-fun e!662100 () Bool)

(declare-fun call!56891 () ListLongMap!16651)

(assert (=> b!1164233 (= e!662100 (= call!56891 call!56892))))

(declare-fun b!1164234 () Bool)

(declare-fun res!771839 () Bool)

(assert (=> b!1164234 (=> (not res!771839) (not e!662094))))

(assert (=> b!1164234 (= res!771839 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36763 _keys!1208))))))

(declare-fun mapNonEmpty!45530 () Bool)

(declare-fun tp!86532 () Bool)

(declare-fun e!662101 () Bool)

(assert (=> mapNonEmpty!45530 (= mapRes!45530 (and tp!86532 e!662101))))

(declare-fun mapRest!45530 () (Array (_ BitVec 32) ValueCell!13859))

(declare-fun mapKey!45530 () (_ BitVec 32))

(declare-fun mapValue!45530 () ValueCell!13859)

(assert (=> mapNonEmpty!45530 (= (arr!36227 _values!996) (store mapRest!45530 mapKey!45530 mapValue!45530))))

(declare-fun b!1164235 () Bool)

(declare-fun res!771836 () Bool)

(assert (=> b!1164235 (=> (not res!771836) (not e!662094))))

(assert (=> b!1164235 (= res!771836 (and (= (size!36764 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36763 _keys!1208) (size!36764 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56894 () Bool)

(assert (=> bm!56894 (= call!56891 (getCurrentListMapNoExtraKeys!4832 lt!524265 lt!524257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164236 () Bool)

(declare-fun res!771844 () Bool)

(assert (=> b!1164236 (=> (not res!771844) (not e!662094))))

(assert (=> b!1164236 (= res!771844 (= (select (arr!36226 _keys!1208) i!673) k0!934))))

(declare-fun b!1164237 () Bool)

(assert (=> b!1164237 (= e!662094 e!662099)))

(declare-fun res!771838 () Bool)

(assert (=> b!1164237 (=> (not res!771838) (not e!662099))))

(assert (=> b!1164237 (= res!771838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524265 mask!1564))))

(assert (=> b!1164237 (= lt!524265 (array!75164 (store (arr!36226 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36763 _keys!1208)))))

(declare-fun b!1164238 () Bool)

(declare-fun Unit!38359 () Unit!38357)

(assert (=> b!1164238 (= e!662096 Unit!38359)))

(declare-fun b!1164239 () Bool)

(assert (=> b!1164239 (= e!662100 (= call!56891 (-!1435 call!56892 k0!934)))))

(declare-fun b!1164240 () Bool)

(assert (=> b!1164240 (= e!662103 (= lt!524268 (getCurrentListMapNoExtraKeys!4832 lt!524265 lt!524257 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1164241 () Bool)

(assert (=> b!1164241 (= e!662099 (not e!662106))))

(declare-fun res!771845 () Bool)

(assert (=> b!1164241 (=> res!771845 e!662106)))

(assert (=> b!1164241 (= res!771845 (bvsgt from!1455 i!673))))

(assert (=> b!1164241 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524252 () Unit!38357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75163 (_ BitVec 64) (_ BitVec 32)) Unit!38357)

(assert (=> b!1164241 (= lt!524252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164242 () Bool)

(assert (=> b!1164242 (= e!662105 e!662096)))

(declare-fun c!116723 () Bool)

(assert (=> b!1164242 (= c!116723 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524261))))

(declare-fun b!1164243 () Bool)

(declare-fun Unit!38360 () Unit!38357)

(assert (=> b!1164243 (= e!662098 Unit!38360)))

(declare-fun b!1164244 () Bool)

(assert (=> b!1164244 (= e!662097 tp_is_empty!29137)))

(declare-fun b!1164245 () Bool)

(assert (=> b!1164245 (= e!662101 tp_is_empty!29137)))

(declare-fun b!1164246 () Bool)

(declare-fun res!771846 () Bool)

(assert (=> b!1164246 (=> (not res!771846) (not e!662094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164246 (= res!771846 (validMask!0 mask!1564))))

(declare-fun b!1164247 () Bool)

(assert (=> b!1164247 (= e!662110 e!662109)))

(declare-fun res!771835 () Bool)

(assert (=> b!1164247 (=> res!771835 e!662109)))

(assert (=> b!1164247 (= res!771835 (not (= (select (arr!36226 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1164247 e!662100))

(declare-fun c!116721 () Bool)

(assert (=> b!1164247 (= c!116721 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524256 () Unit!38357)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!662 (array!75163 array!75165 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38357)

(assert (=> b!1164247 (= lt!524256 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!662 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56895 () Bool)

(assert (=> bm!56895 (= call!56895 call!56896)))

(declare-fun b!1164248 () Bool)

(declare-fun res!771832 () Bool)

(assert (=> b!1164248 (=> (not res!771832) (not e!662094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164248 (= res!771832 (validKeyInArray!0 k0!934))))

(declare-fun b!1164249 () Bool)

(declare-fun Unit!38361 () Unit!38357)

(assert (=> b!1164249 (= e!662098 Unit!38361)))

(assert (=> b!1164249 (= lt!524261 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1164249 (= c!116724 (and (not lt!524261) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524260 () Unit!38357)

(assert (=> b!1164249 (= lt!524260 e!662107)))

(declare-fun lt!524262 () Unit!38357)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!557 (array!75163 array!75165 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 64) (_ BitVec 32) Int) Unit!38357)

(assert (=> b!1164249 (= lt!524262 (lemmaListMapContainsThenArrayContainsFrom!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116719 () Bool)

(assert (=> b!1164249 (= c!116719 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771834 () Bool)

(assert (=> b!1164249 (= res!771834 e!662104)))

(assert (=> b!1164249 (=> (not res!771834) (not e!662102))))

(assert (=> b!1164249 e!662102))

(declare-fun lt!524259 () Unit!38357)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75163 (_ BitVec 32) (_ BitVec 32)) Unit!38357)

(assert (=> b!1164249 (= lt!524259 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1164249 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25406)))

(declare-fun lt!524267 () Unit!38357)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75163 (_ BitVec 64) (_ BitVec 32) List!25409) Unit!38357)

(assert (=> b!1164249 (= lt!524267 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25406))))

(assert (=> b!1164249 false))

(declare-fun b!1164250 () Bool)

(declare-fun lt!524264 () Unit!38357)

(assert (=> b!1164250 (= e!662105 lt!524264)))

(assert (=> b!1164250 (= lt!524264 call!56893)))

(assert (=> b!1164250 call!56895))

(declare-fun b!1164251 () Bool)

(assert (=> b!1164251 (contains!6858 (+!3756 lt!524263 (tuple2!18675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524254 () Unit!38357)

(assert (=> b!1164251 (= lt!524254 (addStillContains!975 lt!524263 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1164251 call!56896))

(assert (=> b!1164251 (= lt!524263 call!56897)))

(declare-fun lt!524266 () Unit!38357)

(assert (=> b!1164251 (= lt!524266 call!56894)))

(assert (=> b!1164251 (= e!662107 lt!524254)))

(declare-fun b!1164252 () Bool)

(assert (=> b!1164252 (= e!662104 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524261) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!99238 res!771833) b!1164246))

(assert (= (and b!1164246 res!771846) b!1164235))

(assert (= (and b!1164235 res!771836) b!1164224))

(assert (= (and b!1164224 res!771840) b!1164232))

(assert (= (and b!1164232 res!771843) b!1164234))

(assert (= (and b!1164234 res!771839) b!1164248))

(assert (= (and b!1164248 res!771832) b!1164236))

(assert (= (and b!1164236 res!771844) b!1164237))

(assert (= (and b!1164237 res!771838) b!1164230))

(assert (= (and b!1164230 res!771837) b!1164241))

(assert (= (and b!1164241 (not res!771845)) b!1164231))

(assert (= (and b!1164231 (not res!771842)) b!1164247))

(assert (= (and b!1164247 c!116721) b!1164239))

(assert (= (and b!1164247 (not c!116721)) b!1164233))

(assert (= (or b!1164239 b!1164233) bm!56894))

(assert (= (or b!1164239 b!1164233) bm!56893))

(assert (= (and b!1164247 (not res!771835)) b!1164229))

(assert (= (and b!1164229 c!116720) b!1164249))

(assert (= (and b!1164229 (not c!116720)) b!1164243))

(assert (= (and b!1164249 c!116724) b!1164251))

(assert (= (and b!1164249 (not c!116724)) b!1164223))

(assert (= (and b!1164223 c!116722) b!1164250))

(assert (= (and b!1164223 (not c!116722)) b!1164242))

(assert (= (and b!1164242 c!116723) b!1164227))

(assert (= (and b!1164242 (not c!116723)) b!1164238))

(assert (= (or b!1164250 b!1164227) bm!56889))

(assert (= (or b!1164250 b!1164227) bm!56888))

(assert (= (or b!1164250 b!1164227) bm!56895))

(assert (= (or b!1164251 bm!56895) bm!56892))

(assert (= (or b!1164251 bm!56889) bm!56891))

(assert (= (or b!1164251 bm!56888) bm!56890))

(assert (= (and b!1164249 c!116719) b!1164226))

(assert (= (and b!1164249 (not c!116719)) b!1164252))

(assert (= (and b!1164249 res!771834) b!1164225))

(assert (= (and b!1164229 res!771841) b!1164240))

(assert (= (and b!1164228 condMapEmpty!45530) mapIsEmpty!45530))

(assert (= (and b!1164228 (not condMapEmpty!45530)) mapNonEmpty!45530))

(get-info :version)

(assert (= (and mapNonEmpty!45530 ((_ is ValueCellFull!13859) mapValue!45530)) b!1164245))

(assert (= (and b!1164228 ((_ is ValueCellFull!13859) mapDefault!45530)) b!1164244))

(assert (= start!99238 b!1164228))

(declare-fun b_lambda!19707 () Bool)

(assert (=> (not b_lambda!19707) (not b!1164231)))

(declare-fun t!36998 () Bool)

(declare-fun tb!9411 () Bool)

(assert (=> (and start!99238 (= defaultEntry!1004 defaultEntry!1004) t!36998) tb!9411))

(declare-fun result!19395 () Bool)

(assert (=> tb!9411 (= result!19395 tp_is_empty!29137)))

(assert (=> b!1164231 t!36998))

(declare-fun b_and!40067 () Bool)

(assert (= b_and!40065 (and (=> t!36998 result!19395) b_and!40067)))

(declare-fun m!1073141 () Bool)

(assert (=> b!1164239 m!1073141))

(declare-fun m!1073143 () Bool)

(assert (=> bm!56890 m!1073143))

(declare-fun m!1073145 () Bool)

(assert (=> b!1164248 m!1073145))

(declare-fun m!1073147 () Bool)

(assert (=> bm!56893 m!1073147))

(declare-fun m!1073149 () Bool)

(assert (=> b!1164224 m!1073149))

(declare-fun m!1073151 () Bool)

(assert (=> b!1164232 m!1073151))

(declare-fun m!1073153 () Bool)

(assert (=> bm!56894 m!1073153))

(declare-fun m!1073155 () Bool)

(assert (=> b!1164247 m!1073155))

(declare-fun m!1073157 () Bool)

(assert (=> b!1164247 m!1073157))

(declare-fun m!1073159 () Bool)

(assert (=> b!1164230 m!1073159))

(declare-fun m!1073161 () Bool)

(assert (=> b!1164236 m!1073161))

(declare-fun m!1073163 () Bool)

(assert (=> bm!56891 m!1073163))

(declare-fun m!1073165 () Bool)

(assert (=> bm!56892 m!1073165))

(declare-fun m!1073167 () Bool)

(assert (=> b!1164249 m!1073167))

(declare-fun m!1073169 () Bool)

(assert (=> b!1164249 m!1073169))

(declare-fun m!1073171 () Bool)

(assert (=> b!1164249 m!1073171))

(declare-fun m!1073173 () Bool)

(assert (=> b!1164249 m!1073173))

(declare-fun m!1073175 () Bool)

(assert (=> b!1164241 m!1073175))

(declare-fun m!1073177 () Bool)

(assert (=> b!1164241 m!1073177))

(declare-fun m!1073179 () Bool)

(assert (=> b!1164226 m!1073179))

(assert (=> b!1164229 m!1073147))

(declare-fun m!1073181 () Bool)

(assert (=> b!1164229 m!1073181))

(declare-fun m!1073183 () Bool)

(assert (=> b!1164229 m!1073183))

(assert (=> b!1164229 m!1073155))

(declare-fun m!1073185 () Bool)

(assert (=> b!1164229 m!1073185))

(assert (=> b!1164229 m!1073155))

(declare-fun m!1073187 () Bool)

(assert (=> b!1164229 m!1073187))

(declare-fun m!1073189 () Bool)

(assert (=> b!1164229 m!1073189))

(assert (=> b!1164229 m!1073183))

(assert (=> b!1164229 m!1073155))

(declare-fun m!1073191 () Bool)

(assert (=> b!1164229 m!1073191))

(assert (=> b!1164229 m!1073181))

(declare-fun m!1073193 () Bool)

(assert (=> b!1164229 m!1073193))

(declare-fun m!1073195 () Bool)

(assert (=> b!1164251 m!1073195))

(assert (=> b!1164251 m!1073195))

(declare-fun m!1073197 () Bool)

(assert (=> b!1164251 m!1073197))

(declare-fun m!1073199 () Bool)

(assert (=> b!1164251 m!1073199))

(assert (=> b!1164240 m!1073153))

(declare-fun m!1073201 () Bool)

(assert (=> b!1164237 m!1073201))

(declare-fun m!1073203 () Bool)

(assert (=> b!1164237 m!1073203))

(declare-fun m!1073205 () Bool)

(assert (=> mapNonEmpty!45530 m!1073205))

(declare-fun m!1073207 () Bool)

(assert (=> start!99238 m!1073207))

(declare-fun m!1073209 () Bool)

(assert (=> start!99238 m!1073209))

(declare-fun m!1073211 () Bool)

(assert (=> b!1164231 m!1073211))

(declare-fun m!1073213 () Bool)

(assert (=> b!1164231 m!1073213))

(declare-fun m!1073215 () Bool)

(assert (=> b!1164231 m!1073215))

(declare-fun m!1073217 () Bool)

(assert (=> b!1164231 m!1073217))

(assert (=> b!1164225 m!1073179))

(declare-fun m!1073219 () Bool)

(assert (=> b!1164246 m!1073219))

(check-sat (not b!1164246) (not b!1164229) (not b_next!24607) (not b!1164249) (not b!1164248) tp_is_empty!29137 (not b_lambda!19707) b_and!40067 (not b!1164251) (not bm!56893) (not b!1164240) (not bm!56891) (not b!1164239) (not b!1164225) (not bm!56890) (not b!1164237) (not bm!56892) (not b!1164230) (not b!1164226) (not bm!56894) (not b!1164224) (not b!1164232) (not b!1164241) (not b!1164247) (not b!1164231) (not mapNonEmpty!45530) (not start!99238))
(check-sat b_and!40067 (not b_next!24607))
