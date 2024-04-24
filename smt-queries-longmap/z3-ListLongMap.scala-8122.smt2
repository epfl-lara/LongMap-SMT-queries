; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99834 () Bool)

(assert start!99834)

(declare-fun b_free!25177 () Bool)

(declare-fun b_next!25177 () Bool)

(assert (=> start!99834 (= b_free!25177 (not b_next!25177))))

(declare-fun tp!88245 () Bool)

(declare-fun b_and!41223 () Bool)

(assert (=> start!99834 (= tp!88245 b_and!41223)))

(declare-fun b!1180886 () Bool)

(declare-fun res!784221 () Bool)

(declare-fun e!671466 () Bool)

(assert (=> b!1180886 (=> (not res!784221) (not e!671466))))

(declare-datatypes ((array!76267 0))(
  ( (array!76268 (arr!36777 (Array (_ BitVec 32) (_ BitVec 64))) (size!37314 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76267)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76267 (_ BitVec 32)) Bool)

(assert (=> b!1180886 (= res!784221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180887 () Bool)

(declare-fun e!671463 () Bool)

(declare-fun e!671465 () Bool)

(assert (=> b!1180887 (= e!671463 e!671465)))

(declare-fun res!784219 () Bool)

(assert (=> b!1180887 (=> res!784219 e!671465)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180887 (= res!784219 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44737 0))(
  ( (V!44738 (val!14910 Int)) )
))
(declare-fun zeroValue!944 () V!44737)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!533634 () array!76267)

(declare-datatypes ((tuple2!19136 0))(
  ( (tuple2!19137 (_1!9579 (_ BitVec 64)) (_2!9579 V!44737)) )
))
(declare-datatypes ((List!25866 0))(
  ( (Nil!25863) (Cons!25862 (h!27080 tuple2!19136) (t!38027 List!25866)) )
))
(declare-datatypes ((ListLongMap!17113 0))(
  ( (ListLongMap!17114 (toList!8572 List!25866)) )
))
(declare-fun lt!533643 () ListLongMap!17113)

(declare-fun minValue!944 () V!44737)

(declare-datatypes ((ValueCell!14144 0))(
  ( (ValueCellFull!14144 (v!17544 V!44737)) (EmptyCell!14144) )
))
(declare-datatypes ((array!76269 0))(
  ( (array!76270 (arr!36778 (Array (_ BitVec 32) ValueCell!14144)) (size!37315 (_ BitVec 32))) )
))
(declare-fun lt!533646 () array!76269)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5050 (array!76267 array!76269 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) Int) ListLongMap!17113)

(assert (=> b!1180887 (= lt!533643 (getCurrentListMapNoExtraKeys!5050 lt!533634 lt!533646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533645 () V!44737)

(declare-fun _values!996 () array!76269)

(assert (=> b!1180887 (= lt!533646 (array!76270 (store (arr!36778 _values!996) i!673 (ValueCellFull!14144 lt!533645)) (size!37315 _values!996)))))

(declare-fun dynLambda!3019 (Int (_ BitVec 64)) V!44737)

(assert (=> b!1180887 (= lt!533645 (dynLambda!3019 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533639 () ListLongMap!17113)

(assert (=> b!1180887 (= lt!533639 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180888 () Bool)

(declare-fun e!671471 () Bool)

(assert (=> b!1180888 (= e!671465 e!671471)))

(declare-fun res!784223 () Bool)

(assert (=> b!1180888 (=> res!784223 e!671471)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180888 (= res!784223 (not (validKeyInArray!0 (select (arr!36777 _keys!1208) from!1455))))))

(declare-fun lt!533633 () ListLongMap!17113)

(declare-fun lt!533638 () ListLongMap!17113)

(assert (=> b!1180888 (= lt!533633 lt!533638)))

(declare-fun lt!533644 () ListLongMap!17113)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1601 (ListLongMap!17113 (_ BitVec 64)) ListLongMap!17113)

(assert (=> b!1180888 (= lt!533638 (-!1601 lt!533644 k0!934))))

(assert (=> b!1180888 (= lt!533633 (getCurrentListMapNoExtraKeys!5050 lt!533634 lt!533646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180888 (= lt!533644 (getCurrentListMapNoExtraKeys!5050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38985 0))(
  ( (Unit!38986) )
))
(declare-fun lt!533647 () Unit!38985)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 (array!76267 array!76269 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38985)

(assert (=> b!1180888 (= lt!533647 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46388 () Bool)

(declare-fun mapRes!46388 () Bool)

(assert (=> mapIsEmpty!46388 mapRes!46388))

(declare-fun b!1180890 () Bool)

(declare-fun res!784217 () Bool)

(declare-fun e!671459 () Bool)

(assert (=> b!1180890 (=> (not res!784217) (not e!671459))))

(declare-datatypes ((List!25867 0))(
  ( (Nil!25864) (Cons!25863 (h!27081 (_ BitVec 64)) (t!38028 List!25867)) )
))
(declare-fun arrayNoDuplicates!0 (array!76267 (_ BitVec 32) List!25867) Bool)

(assert (=> b!1180890 (= res!784217 (arrayNoDuplicates!0 lt!533634 #b00000000000000000000000000000000 Nil!25864))))

(declare-fun b!1180891 () Bool)

(declare-fun e!671468 () Bool)

(declare-fun tp_is_empty!29707 () Bool)

(assert (=> b!1180891 (= e!671468 tp_is_empty!29707)))

(declare-fun b!1180892 () Bool)

(declare-fun res!784230 () Bool)

(assert (=> b!1180892 (=> (not res!784230) (not e!671466))))

(assert (=> b!1180892 (= res!784230 (and (= (size!37315 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37314 _keys!1208) (size!37315 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46388 () Bool)

(declare-fun tp!88244 () Bool)

(assert (=> mapNonEmpty!46388 (= mapRes!46388 (and tp!88244 e!671468))))

(declare-fun mapValue!46388 () ValueCell!14144)

(declare-fun mapRest!46388 () (Array (_ BitVec 32) ValueCell!14144))

(declare-fun mapKey!46388 () (_ BitVec 32))

(assert (=> mapNonEmpty!46388 (= (arr!36778 _values!996) (store mapRest!46388 mapKey!46388 mapValue!46388))))

(declare-fun res!784228 () Bool)

(assert (=> start!99834 (=> (not res!784228) (not e!671466))))

(assert (=> start!99834 (= res!784228 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37314 _keys!1208))))))

(assert (=> start!99834 e!671466))

(assert (=> start!99834 tp_is_empty!29707))

(declare-fun array_inv!28160 (array!76267) Bool)

(assert (=> start!99834 (array_inv!28160 _keys!1208)))

(assert (=> start!99834 true))

(assert (=> start!99834 tp!88245))

(declare-fun e!671461 () Bool)

(declare-fun array_inv!28161 (array!76269) Bool)

(assert (=> start!99834 (and (array_inv!28161 _values!996) e!671461)))

(declare-fun b!1180889 () Bool)

(declare-fun e!671467 () Unit!38985)

(declare-fun Unit!38987 () Unit!38985)

(assert (=> b!1180889 (= e!671467 Unit!38987)))

(declare-fun lt!533641 () Unit!38985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38985)

(assert (=> b!1180889 (= lt!533641 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180889 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533635 () Unit!38985)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76267 (_ BitVec 32) (_ BitVec 32)) Unit!38985)

(assert (=> b!1180889 (= lt!533635 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180889 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25864)))

(declare-fun lt!533640 () Unit!38985)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76267 (_ BitVec 64) (_ BitVec 32) List!25867) Unit!38985)

(assert (=> b!1180889 (= lt!533640 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25864))))

(assert (=> b!1180889 false))

(declare-fun e!671469 () Bool)

(declare-fun b!1180893 () Bool)

(assert (=> b!1180893 (= e!671469 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180894 () Bool)

(assert (=> b!1180894 (= e!671466 e!671459)))

(declare-fun res!784224 () Bool)

(assert (=> b!1180894 (=> (not res!784224) (not e!671459))))

(assert (=> b!1180894 (= res!784224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533634 mask!1564))))

(assert (=> b!1180894 (= lt!533634 (array!76268 (store (arr!36777 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37314 _keys!1208)))))

(declare-fun b!1180895 () Bool)

(declare-fun res!784231 () Bool)

(declare-fun e!671462 () Bool)

(assert (=> b!1180895 (=> (not res!784231) (not e!671462))))

(declare-fun lt!533642 () tuple2!19136)

(declare-fun +!3897 (ListLongMap!17113 tuple2!19136) ListLongMap!17113)

(assert (=> b!1180895 (= res!784231 (= lt!533639 (+!3897 lt!533644 lt!533642)))))

(declare-fun b!1180896 () Bool)

(declare-fun res!784229 () Bool)

(assert (=> b!1180896 (=> (not res!784229) (not e!671466))))

(assert (=> b!1180896 (= res!784229 (validKeyInArray!0 k0!934))))

(declare-fun b!1180897 () Bool)

(declare-fun res!784218 () Bool)

(assert (=> b!1180897 (=> (not res!784218) (not e!671466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180897 (= res!784218 (validMask!0 mask!1564))))

(declare-fun b!1180898 () Bool)

(declare-fun e!671460 () Bool)

(assert (=> b!1180898 (= e!671461 (and e!671460 mapRes!46388))))

(declare-fun condMapEmpty!46388 () Bool)

(declare-fun mapDefault!46388 () ValueCell!14144)

(assert (=> b!1180898 (= condMapEmpty!46388 (= (arr!36778 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14144)) mapDefault!46388)))))

(declare-fun b!1180899 () Bool)

(declare-fun e!671464 () Bool)

(assert (=> b!1180899 (= e!671464 e!671469)))

(declare-fun res!784232 () Bool)

(assert (=> b!1180899 (=> res!784232 e!671469)))

(assert (=> b!1180899 (= res!784232 (not (= (select (arr!36777 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180900 () Bool)

(assert (=> b!1180900 (= e!671462 (= lt!533638 lt!533633))))

(declare-fun b!1180901 () Bool)

(declare-fun Unit!38988 () Unit!38985)

(assert (=> b!1180901 (= e!671467 Unit!38988)))

(declare-fun b!1180902 () Bool)

(declare-fun res!784227 () Bool)

(assert (=> b!1180902 (=> (not res!784227) (not e!671466))))

(assert (=> b!1180902 (= res!784227 (= (select (arr!36777 _keys!1208) i!673) k0!934))))

(declare-fun b!1180903 () Bool)

(assert (=> b!1180903 (= e!671460 tp_is_empty!29707)))

(declare-fun b!1180904 () Bool)

(declare-fun res!784226 () Bool)

(assert (=> b!1180904 (=> (not res!784226) (not e!671466))))

(assert (=> b!1180904 (= res!784226 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25864))))

(declare-fun b!1180905 () Bool)

(assert (=> b!1180905 (= e!671459 (not e!671463))))

(declare-fun res!784216 () Bool)

(assert (=> b!1180905 (=> res!784216 e!671463)))

(assert (=> b!1180905 (= res!784216 (bvsgt from!1455 i!673))))

(assert (=> b!1180905 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533636 () Unit!38985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76267 (_ BitVec 64) (_ BitVec 32)) Unit!38985)

(assert (=> b!1180905 (= lt!533636 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180906 () Bool)

(assert (=> b!1180906 (= e!671471 true)))

(assert (=> b!1180906 e!671462))

(declare-fun res!784225 () Bool)

(assert (=> b!1180906 (=> (not res!784225) (not e!671462))))

(assert (=> b!1180906 (= res!784225 (not (= (select (arr!36777 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533637 () Unit!38985)

(assert (=> b!1180906 (= lt!533637 e!671467)))

(declare-fun c!117287 () Bool)

(assert (=> b!1180906 (= c!117287 (= (select (arr!36777 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180906 e!671464))

(declare-fun res!784222 () Bool)

(assert (=> b!1180906 (=> (not res!784222) (not e!671464))))

(assert (=> b!1180906 (= res!784222 (= lt!533643 (+!3897 lt!533638 lt!533642)))))

(declare-fun get!18836 (ValueCell!14144 V!44737) V!44737)

(assert (=> b!1180906 (= lt!533642 (tuple2!19137 (select (arr!36777 _keys!1208) from!1455) (get!18836 (select (arr!36778 _values!996) from!1455) lt!533645)))))

(declare-fun b!1180907 () Bool)

(declare-fun res!784220 () Bool)

(assert (=> b!1180907 (=> (not res!784220) (not e!671466))))

(assert (=> b!1180907 (= res!784220 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37314 _keys!1208))))))

(assert (= (and start!99834 res!784228) b!1180897))

(assert (= (and b!1180897 res!784218) b!1180892))

(assert (= (and b!1180892 res!784230) b!1180886))

(assert (= (and b!1180886 res!784221) b!1180904))

(assert (= (and b!1180904 res!784226) b!1180907))

(assert (= (and b!1180907 res!784220) b!1180896))

(assert (= (and b!1180896 res!784229) b!1180902))

(assert (= (and b!1180902 res!784227) b!1180894))

(assert (= (and b!1180894 res!784224) b!1180890))

(assert (= (and b!1180890 res!784217) b!1180905))

(assert (= (and b!1180905 (not res!784216)) b!1180887))

(assert (= (and b!1180887 (not res!784219)) b!1180888))

(assert (= (and b!1180888 (not res!784223)) b!1180906))

(assert (= (and b!1180906 res!784222) b!1180899))

(assert (= (and b!1180899 (not res!784232)) b!1180893))

(assert (= (and b!1180906 c!117287) b!1180889))

(assert (= (and b!1180906 (not c!117287)) b!1180901))

(assert (= (and b!1180906 res!784225) b!1180895))

(assert (= (and b!1180895 res!784231) b!1180900))

(assert (= (and b!1180898 condMapEmpty!46388) mapIsEmpty!46388))

(assert (= (and b!1180898 (not condMapEmpty!46388)) mapNonEmpty!46388))

(get-info :version)

(assert (= (and mapNonEmpty!46388 ((_ is ValueCellFull!14144) mapValue!46388)) b!1180891))

(assert (= (and b!1180898 ((_ is ValueCellFull!14144) mapDefault!46388)) b!1180903))

(assert (= start!99834 b!1180898))

(declare-fun b_lambda!20315 () Bool)

(assert (=> (not b_lambda!20315) (not b!1180887)))

(declare-fun t!38026 () Bool)

(declare-fun tb!9981 () Bool)

(assert (=> (and start!99834 (= defaultEntry!1004 defaultEntry!1004) t!38026) tb!9981))

(declare-fun result!20537 () Bool)

(assert (=> tb!9981 (= result!20537 tp_is_empty!29707)))

(assert (=> b!1180887 t!38026))

(declare-fun b_and!41225 () Bool)

(assert (= b_and!41223 (and (=> t!38026 result!20537) b_and!41225)))

(declare-fun m!1089147 () Bool)

(assert (=> b!1180887 m!1089147))

(declare-fun m!1089149 () Bool)

(assert (=> b!1180887 m!1089149))

(declare-fun m!1089151 () Bool)

(assert (=> b!1180887 m!1089151))

(declare-fun m!1089153 () Bool)

(assert (=> b!1180887 m!1089153))

(declare-fun m!1089155 () Bool)

(assert (=> b!1180894 m!1089155))

(declare-fun m!1089157 () Bool)

(assert (=> b!1180894 m!1089157))

(declare-fun m!1089159 () Bool)

(assert (=> b!1180893 m!1089159))

(declare-fun m!1089161 () Bool)

(assert (=> b!1180905 m!1089161))

(declare-fun m!1089163 () Bool)

(assert (=> b!1180905 m!1089163))

(declare-fun m!1089165 () Bool)

(assert (=> mapNonEmpty!46388 m!1089165))

(declare-fun m!1089167 () Bool)

(assert (=> b!1180899 m!1089167))

(declare-fun m!1089169 () Bool)

(assert (=> b!1180886 m!1089169))

(declare-fun m!1089171 () Bool)

(assert (=> b!1180897 m!1089171))

(declare-fun m!1089173 () Bool)

(assert (=> b!1180902 m!1089173))

(declare-fun m!1089175 () Bool)

(assert (=> b!1180904 m!1089175))

(declare-fun m!1089177 () Bool)

(assert (=> b!1180890 m!1089177))

(assert (=> b!1180906 m!1089167))

(declare-fun m!1089179 () Bool)

(assert (=> b!1180906 m!1089179))

(declare-fun m!1089181 () Bool)

(assert (=> b!1180906 m!1089181))

(assert (=> b!1180906 m!1089181))

(declare-fun m!1089183 () Bool)

(assert (=> b!1180906 m!1089183))

(declare-fun m!1089185 () Bool)

(assert (=> b!1180888 m!1089185))

(declare-fun m!1089187 () Bool)

(assert (=> b!1180888 m!1089187))

(declare-fun m!1089189 () Bool)

(assert (=> b!1180888 m!1089189))

(assert (=> b!1180888 m!1089167))

(declare-fun m!1089191 () Bool)

(assert (=> b!1180888 m!1089191))

(declare-fun m!1089193 () Bool)

(assert (=> b!1180888 m!1089193))

(assert (=> b!1180888 m!1089167))

(declare-fun m!1089195 () Bool)

(assert (=> b!1180889 m!1089195))

(declare-fun m!1089197 () Bool)

(assert (=> b!1180889 m!1089197))

(declare-fun m!1089199 () Bool)

(assert (=> b!1180889 m!1089199))

(declare-fun m!1089201 () Bool)

(assert (=> b!1180889 m!1089201))

(declare-fun m!1089203 () Bool)

(assert (=> b!1180889 m!1089203))

(declare-fun m!1089205 () Bool)

(assert (=> start!99834 m!1089205))

(declare-fun m!1089207 () Bool)

(assert (=> start!99834 m!1089207))

(declare-fun m!1089209 () Bool)

(assert (=> b!1180896 m!1089209))

(declare-fun m!1089211 () Bool)

(assert (=> b!1180895 m!1089211))

(check-sat tp_is_empty!29707 (not b!1180904) (not b!1180888) (not b!1180897) (not mapNonEmpty!46388) b_and!41225 (not b!1180889) (not b!1180894) (not b_next!25177) (not b!1180893) (not b!1180886) (not b!1180887) (not b!1180895) (not b!1180896) (not b!1180890) (not start!99834) (not b!1180906) (not b!1180905) (not b_lambda!20315))
(check-sat b_and!41225 (not b_next!25177))
