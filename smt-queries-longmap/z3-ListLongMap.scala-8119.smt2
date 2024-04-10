; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99582 () Bool)

(assert start!99582)

(declare-fun b_free!25161 () Bool)

(declare-fun b_next!25161 () Bool)

(assert (=> start!99582 (= b_free!25161 (not b_next!25161))))

(declare-fun tp!88196 () Bool)

(declare-fun b_and!41189 () Bool)

(assert (=> start!99582 (= tp!88196 b_and!41189)))

(declare-fun b!1179075 () Bool)

(declare-datatypes ((Unit!38958 0))(
  ( (Unit!38959) )
))
(declare-fun e!670315 () Unit!38958)

(declare-fun Unit!38960 () Unit!38958)

(assert (=> b!1179075 (= e!670315 Unit!38960)))

(declare-fun b!1179076 () Bool)

(declare-fun e!670323 () Bool)

(declare-fun e!670322 () Bool)

(assert (=> b!1179076 (= e!670323 e!670322)))

(declare-fun res!783322 () Bool)

(assert (=> b!1179076 (=> res!783322 e!670322)))

(declare-datatypes ((array!76185 0))(
  ( (array!76186 (arr!36742 (Array (_ BitVec 32) (_ BitVec 64))) (size!37278 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76185)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179076 (= res!783322 (not (= (select (arr!36742 _keys!1208) from!1455) k0!934)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1179077 () Bool)

(declare-fun arrayContainsKey!0 (array!76185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179077 (= e!670322 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179078 () Bool)

(declare-fun res!783327 () Bool)

(declare-fun e!670319 () Bool)

(assert (=> b!1179078 (=> (not res!783327) (not e!670319))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44715 0))(
  ( (V!44716 (val!14902 Int)) )
))
(declare-datatypes ((ValueCell!14136 0))(
  ( (ValueCellFull!14136 (v!17540 V!44715)) (EmptyCell!14136) )
))
(declare-datatypes ((array!76187 0))(
  ( (array!76188 (arr!36743 (Array (_ BitVec 32) ValueCell!14136)) (size!37279 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76187)

(assert (=> b!1179078 (= res!783327 (and (= (size!37279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37278 _keys!1208) (size!37279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179080 () Bool)

(declare-fun e!670318 () Bool)

(declare-fun tp_is_empty!29691 () Bool)

(assert (=> b!1179080 (= e!670318 tp_is_empty!29691)))

(declare-fun b!1179081 () Bool)

(declare-fun res!783335 () Bool)

(assert (=> b!1179081 (=> (not res!783335) (not e!670319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76185 (_ BitVec 32)) Bool)

(assert (=> b!1179081 (= res!783335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179082 () Bool)

(declare-fun e!670326 () Bool)

(declare-fun e!670320 () Bool)

(declare-fun mapRes!46364 () Bool)

(assert (=> b!1179082 (= e!670326 (and e!670320 mapRes!46364))))

(declare-fun condMapEmpty!46364 () Bool)

(declare-fun mapDefault!46364 () ValueCell!14136)

(assert (=> b!1179082 (= condMapEmpty!46364 (= (arr!36743 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14136)) mapDefault!46364)))))

(declare-fun b!1179083 () Bool)

(declare-fun res!783323 () Bool)

(assert (=> b!1179083 (=> (not res!783323) (not e!670319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179083 (= res!783323 (validMask!0 mask!1564))))

(declare-fun b!1179084 () Bool)

(declare-fun Unit!38961 () Unit!38958)

(assert (=> b!1179084 (= e!670315 Unit!38961)))

(declare-fun lt!532798 () Unit!38958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38958)

(assert (=> b!1179084 (= lt!532798 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179084 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532797 () Unit!38958)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76185 (_ BitVec 32) (_ BitVec 32)) Unit!38958)

(assert (=> b!1179084 (= lt!532797 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25811 0))(
  ( (Nil!25808) (Cons!25807 (h!27016 (_ BitVec 64)) (t!37964 List!25811)) )
))
(declare-fun arrayNoDuplicates!0 (array!76185 (_ BitVec 32) List!25811) Bool)

(assert (=> b!1179084 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25808)))

(declare-fun lt!532801 () Unit!38958)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76185 (_ BitVec 64) (_ BitVec 32) List!25811) Unit!38958)

(assert (=> b!1179084 (= lt!532801 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25808))))

(assert (=> b!1179084 false))

(declare-fun b!1179085 () Bool)

(declare-fun e!670317 () Bool)

(declare-fun e!670325 () Bool)

(assert (=> b!1179085 (= e!670317 e!670325)))

(declare-fun res!783333 () Bool)

(assert (=> b!1179085 (=> res!783333 e!670325)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179085 (= res!783333 (not (validKeyInArray!0 (select (arr!36742 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19074 0))(
  ( (tuple2!19075 (_1!9548 (_ BitVec 64)) (_2!9548 V!44715)) )
))
(declare-datatypes ((List!25812 0))(
  ( (Nil!25809) (Cons!25808 (h!27017 tuple2!19074) (t!37965 List!25812)) )
))
(declare-datatypes ((ListLongMap!17043 0))(
  ( (ListLongMap!17044 (toList!8537 List!25812)) )
))
(declare-fun lt!532791 () ListLongMap!17043)

(declare-fun lt!532790 () ListLongMap!17043)

(assert (=> b!1179085 (= lt!532791 lt!532790)))

(declare-fun lt!532803 () ListLongMap!17043)

(declare-fun -!1582 (ListLongMap!17043 (_ BitVec 64)) ListLongMap!17043)

(assert (=> b!1179085 (= lt!532790 (-!1582 lt!532803 k0!934))))

(declare-fun zeroValue!944 () V!44715)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532794 () array!76185)

(declare-fun lt!532789 () array!76187)

(declare-fun minValue!944 () V!44715)

(declare-fun getCurrentListMapNoExtraKeys!4992 (array!76185 array!76187 (_ BitVec 32) (_ BitVec 32) V!44715 V!44715 (_ BitVec 32) Int) ListLongMap!17043)

(assert (=> b!1179085 (= lt!532791 (getCurrentListMapNoExtraKeys!4992 lt!532794 lt!532789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179085 (= lt!532803 (getCurrentListMapNoExtraKeys!4992 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532793 () Unit!38958)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!809 (array!76185 array!76187 (_ BitVec 32) (_ BitVec 32) V!44715 V!44715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38958)

(assert (=> b!1179085 (= lt!532793 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179086 () Bool)

(declare-fun e!670324 () Bool)

(assert (=> b!1179086 (= e!670324 e!670317)))

(declare-fun res!783325 () Bool)

(assert (=> b!1179086 (=> res!783325 e!670317)))

(assert (=> b!1179086 (= res!783325 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!532792 () ListLongMap!17043)

(assert (=> b!1179086 (= lt!532792 (getCurrentListMapNoExtraKeys!4992 lt!532794 lt!532789 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532796 () V!44715)

(assert (=> b!1179086 (= lt!532789 (array!76188 (store (arr!36743 _values!996) i!673 (ValueCellFull!14136 lt!532796)) (size!37279 _values!996)))))

(declare-fun dynLambda!2952 (Int (_ BitVec 64)) V!44715)

(assert (=> b!1179086 (= lt!532796 (dynLambda!2952 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532802 () ListLongMap!17043)

(assert (=> b!1179086 (= lt!532802 (getCurrentListMapNoExtraKeys!4992 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179087 () Bool)

(declare-fun res!783330 () Bool)

(assert (=> b!1179087 (=> (not res!783330) (not e!670319))))

(assert (=> b!1179087 (= res!783330 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37278 _keys!1208))))))

(declare-fun b!1179088 () Bool)

(declare-fun res!783337 () Bool)

(assert (=> b!1179088 (=> (not res!783337) (not e!670319))))

(assert (=> b!1179088 (= res!783337 (= (select (arr!36742 _keys!1208) i!673) k0!934))))

(declare-fun lt!532795 () tuple2!19074)

(declare-fun b!1179089 () Bool)

(declare-fun e!670316 () Bool)

(declare-fun +!3851 (ListLongMap!17043 tuple2!19074) ListLongMap!17043)

(assert (=> b!1179089 (= e!670316 (= lt!532802 (+!3851 lt!532803 lt!532795)))))

(declare-fun b!1179090 () Bool)

(declare-fun res!783331 () Bool)

(assert (=> b!1179090 (=> (not res!783331) (not e!670319))))

(assert (=> b!1179090 (= res!783331 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25808))))

(declare-fun mapIsEmpty!46364 () Bool)

(assert (=> mapIsEmpty!46364 mapRes!46364))

(declare-fun b!1179091 () Bool)

(declare-fun e!670321 () Bool)

(assert (=> b!1179091 (= e!670321 (not e!670324))))

(declare-fun res!783334 () Bool)

(assert (=> b!1179091 (=> res!783334 e!670324)))

(assert (=> b!1179091 (= res!783334 (bvsgt from!1455 i!673))))

(assert (=> b!1179091 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532799 () Unit!38958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76185 (_ BitVec 64) (_ BitVec 32)) Unit!38958)

(assert (=> b!1179091 (= lt!532799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!783336 () Bool)

(assert (=> start!99582 (=> (not res!783336) (not e!670319))))

(assert (=> start!99582 (= res!783336 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37278 _keys!1208))))))

(assert (=> start!99582 e!670319))

(assert (=> start!99582 tp_is_empty!29691))

(declare-fun array_inv!28054 (array!76185) Bool)

(assert (=> start!99582 (array_inv!28054 _keys!1208)))

(assert (=> start!99582 true))

(assert (=> start!99582 tp!88196))

(declare-fun array_inv!28055 (array!76187) Bool)

(assert (=> start!99582 (and (array_inv!28055 _values!996) e!670326)))

(declare-fun b!1179079 () Bool)

(declare-fun res!783332 () Bool)

(assert (=> b!1179079 (=> (not res!783332) (not e!670321))))

(assert (=> b!1179079 (= res!783332 (arrayNoDuplicates!0 lt!532794 #b00000000000000000000000000000000 Nil!25808))))

(declare-fun b!1179092 () Bool)

(declare-fun res!783328 () Bool)

(assert (=> b!1179092 (=> (not res!783328) (not e!670319))))

(assert (=> b!1179092 (= res!783328 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46364 () Bool)

(declare-fun tp!88197 () Bool)

(assert (=> mapNonEmpty!46364 (= mapRes!46364 (and tp!88197 e!670318))))

(declare-fun mapValue!46364 () ValueCell!14136)

(declare-fun mapKey!46364 () (_ BitVec 32))

(declare-fun mapRest!46364 () (Array (_ BitVec 32) ValueCell!14136))

(assert (=> mapNonEmpty!46364 (= (arr!36743 _values!996) (store mapRest!46364 mapKey!46364 mapValue!46364))))

(declare-fun b!1179093 () Bool)

(assert (=> b!1179093 (= e!670319 e!670321)))

(declare-fun res!783326 () Bool)

(assert (=> b!1179093 (=> (not res!783326) (not e!670321))))

(assert (=> b!1179093 (= res!783326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532794 mask!1564))))

(assert (=> b!1179093 (= lt!532794 (array!76186 (store (arr!36742 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37278 _keys!1208)))))

(declare-fun b!1179094 () Bool)

(assert (=> b!1179094 (= e!670320 tp_is_empty!29691)))

(declare-fun b!1179095 () Bool)

(assert (=> b!1179095 (= e!670325 true)))

(assert (=> b!1179095 e!670316))

(declare-fun res!783329 () Bool)

(assert (=> b!1179095 (=> (not res!783329) (not e!670316))))

(assert (=> b!1179095 (= res!783329 (not (= (select (arr!36742 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532800 () Unit!38958)

(assert (=> b!1179095 (= lt!532800 e!670315)))

(declare-fun c!116865 () Bool)

(assert (=> b!1179095 (= c!116865 (= (select (arr!36742 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179095 e!670323))

(declare-fun res!783324 () Bool)

(assert (=> b!1179095 (=> (not res!783324) (not e!670323))))

(assert (=> b!1179095 (= res!783324 (= lt!532792 (+!3851 lt!532790 lt!532795)))))

(declare-fun get!18783 (ValueCell!14136 V!44715) V!44715)

(assert (=> b!1179095 (= lt!532795 (tuple2!19075 (select (arr!36742 _keys!1208) from!1455) (get!18783 (select (arr!36743 _values!996) from!1455) lt!532796)))))

(assert (= (and start!99582 res!783336) b!1179083))

(assert (= (and b!1179083 res!783323) b!1179078))

(assert (= (and b!1179078 res!783327) b!1179081))

(assert (= (and b!1179081 res!783335) b!1179090))

(assert (= (and b!1179090 res!783331) b!1179087))

(assert (= (and b!1179087 res!783330) b!1179092))

(assert (= (and b!1179092 res!783328) b!1179088))

(assert (= (and b!1179088 res!783337) b!1179093))

(assert (= (and b!1179093 res!783326) b!1179079))

(assert (= (and b!1179079 res!783332) b!1179091))

(assert (= (and b!1179091 (not res!783334)) b!1179086))

(assert (= (and b!1179086 (not res!783325)) b!1179085))

(assert (= (and b!1179085 (not res!783333)) b!1179095))

(assert (= (and b!1179095 res!783324) b!1179076))

(assert (= (and b!1179076 (not res!783322)) b!1179077))

(assert (= (and b!1179095 c!116865) b!1179084))

(assert (= (and b!1179095 (not c!116865)) b!1179075))

(assert (= (and b!1179095 res!783329) b!1179089))

(assert (= (and b!1179082 condMapEmpty!46364) mapIsEmpty!46364))

(assert (= (and b!1179082 (not condMapEmpty!46364)) mapNonEmpty!46364))

(get-info :version)

(assert (= (and mapNonEmpty!46364 ((_ is ValueCellFull!14136) mapValue!46364)) b!1179080))

(assert (= (and b!1179082 ((_ is ValueCellFull!14136) mapDefault!46364)) b!1179094))

(assert (= start!99582 b!1179082))

(declare-fun b_lambda!20305 () Bool)

(assert (=> (not b_lambda!20305) (not b!1179086)))

(declare-fun t!37963 () Bool)

(declare-fun tb!9973 () Bool)

(assert (=> (and start!99582 (= defaultEntry!1004 defaultEntry!1004) t!37963) tb!9973))

(declare-fun result!20513 () Bool)

(assert (=> tb!9973 (= result!20513 tp_is_empty!29691)))

(assert (=> b!1179086 t!37963))

(declare-fun b_and!41191 () Bool)

(assert (= b_and!41189 (and (=> t!37963 result!20513) b_and!41191)))

(declare-fun m!1087047 () Bool)

(assert (=> b!1179092 m!1087047))

(declare-fun m!1087049 () Bool)

(assert (=> b!1179095 m!1087049))

(declare-fun m!1087051 () Bool)

(assert (=> b!1179095 m!1087051))

(declare-fun m!1087053 () Bool)

(assert (=> b!1179095 m!1087053))

(assert (=> b!1179095 m!1087053))

(declare-fun m!1087055 () Bool)

(assert (=> b!1179095 m!1087055))

(declare-fun m!1087057 () Bool)

(assert (=> start!99582 m!1087057))

(declare-fun m!1087059 () Bool)

(assert (=> start!99582 m!1087059))

(assert (=> b!1179076 m!1087049))

(declare-fun m!1087061 () Bool)

(assert (=> b!1179084 m!1087061))

(declare-fun m!1087063 () Bool)

(assert (=> b!1179084 m!1087063))

(declare-fun m!1087065 () Bool)

(assert (=> b!1179084 m!1087065))

(declare-fun m!1087067 () Bool)

(assert (=> b!1179084 m!1087067))

(declare-fun m!1087069 () Bool)

(assert (=> b!1179084 m!1087069))

(declare-fun m!1087071 () Bool)

(assert (=> b!1179077 m!1087071))

(declare-fun m!1087073 () Bool)

(assert (=> b!1179081 m!1087073))

(declare-fun m!1087075 () Bool)

(assert (=> b!1179086 m!1087075))

(declare-fun m!1087077 () Bool)

(assert (=> b!1179086 m!1087077))

(declare-fun m!1087079 () Bool)

(assert (=> b!1179086 m!1087079))

(declare-fun m!1087081 () Bool)

(assert (=> b!1179086 m!1087081))

(declare-fun m!1087083 () Bool)

(assert (=> mapNonEmpty!46364 m!1087083))

(declare-fun m!1087085 () Bool)

(assert (=> b!1179085 m!1087085))

(declare-fun m!1087087 () Bool)

(assert (=> b!1179085 m!1087087))

(declare-fun m!1087089 () Bool)

(assert (=> b!1179085 m!1087089))

(assert (=> b!1179085 m!1087049))

(declare-fun m!1087091 () Bool)

(assert (=> b!1179085 m!1087091))

(declare-fun m!1087093 () Bool)

(assert (=> b!1179085 m!1087093))

(assert (=> b!1179085 m!1087049))

(declare-fun m!1087095 () Bool)

(assert (=> b!1179091 m!1087095))

(declare-fun m!1087097 () Bool)

(assert (=> b!1179091 m!1087097))

(declare-fun m!1087099 () Bool)

(assert (=> b!1179083 m!1087099))

(declare-fun m!1087101 () Bool)

(assert (=> b!1179079 m!1087101))

(declare-fun m!1087103 () Bool)

(assert (=> b!1179088 m!1087103))

(declare-fun m!1087105 () Bool)

(assert (=> b!1179093 m!1087105))

(declare-fun m!1087107 () Bool)

(assert (=> b!1179093 m!1087107))

(declare-fun m!1087109 () Bool)

(assert (=> b!1179089 m!1087109))

(declare-fun m!1087111 () Bool)

(assert (=> b!1179090 m!1087111))

(check-sat (not b!1179079) (not b!1179089) (not b!1179090) (not b!1179091) (not b!1179085) (not b_lambda!20305) b_and!41191 (not b!1179083) (not start!99582) (not b!1179084) (not mapNonEmpty!46364) tp_is_empty!29691 (not b!1179077) (not b!1179093) (not b!1179092) (not b_next!25161) (not b!1179081) (not b!1179086) (not b!1179095))
(check-sat b_and!41191 (not b_next!25161))
