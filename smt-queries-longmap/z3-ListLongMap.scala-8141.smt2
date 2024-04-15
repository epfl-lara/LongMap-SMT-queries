; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99706 () Bool)

(assert start!99706)

(declare-fun b_free!25291 () Bool)

(declare-fun b_next!25291 () Bool)

(assert (=> start!99706 (= b_free!25291 (not b_next!25291))))

(declare-fun tp!88586 () Bool)

(declare-fun b_and!41427 () Bool)

(assert (=> start!99706 (= tp!88586 b_and!41427)))

(declare-fun b!1183183 () Bool)

(declare-datatypes ((Unit!39017 0))(
  ( (Unit!39018) )
))
(declare-fun e!672697 () Unit!39017)

(declare-fun Unit!39019 () Unit!39017)

(assert (=> b!1183183 (= e!672697 Unit!39019)))

(declare-fun b!1183184 () Bool)

(declare-fun e!672691 () Bool)

(declare-fun e!672699 () Bool)

(assert (=> b!1183184 (= e!672691 e!672699)))

(declare-fun res!786396 () Bool)

(assert (=> b!1183184 (=> res!786396 e!672699)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183184 (= res!786396 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44889 0))(
  ( (V!44890 (val!14967 Int)) )
))
(declare-fun zeroValue!944 () V!44889)

(declare-datatypes ((array!76376 0))(
  ( (array!76377 (arr!36838 (Array (_ BitVec 32) (_ BitVec 64))) (size!37376 (_ BitVec 32))) )
))
(declare-fun lt!535862 () array!76376)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19296 0))(
  ( (tuple2!19297 (_1!9659 (_ BitVec 64)) (_2!9659 V!44889)) )
))
(declare-datatypes ((List!26004 0))(
  ( (Nil!26001) (Cons!26000 (h!27209 tuple2!19296) (t!38278 List!26004)) )
))
(declare-datatypes ((ListLongMap!17265 0))(
  ( (ListLongMap!17266 (toList!8648 List!26004)) )
))
(declare-fun lt!535865 () ListLongMap!17265)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44889)

(declare-datatypes ((ValueCell!14201 0))(
  ( (ValueCellFull!14201 (v!17604 V!44889)) (EmptyCell!14201) )
))
(declare-datatypes ((array!76378 0))(
  ( (array!76379 (arr!36839 (Array (_ BitVec 32) ValueCell!14201)) (size!37377 (_ BitVec 32))) )
))
(declare-fun lt!535870 () array!76378)

(declare-fun getCurrentListMapNoExtraKeys!5103 (array!76376 array!76378 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) Int) ListLongMap!17265)

(assert (=> b!1183184 (= lt!535865 (getCurrentListMapNoExtraKeys!5103 lt!535862 lt!535870 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535858 () V!44889)

(declare-fun _values!996 () array!76378)

(assert (=> b!1183184 (= lt!535870 (array!76379 (store (arr!36839 _values!996) i!673 (ValueCellFull!14201 lt!535858)) (size!37377 _values!996)))))

(declare-fun dynLambda!3009 (Int (_ BitVec 64)) V!44889)

(assert (=> b!1183184 (= lt!535858 (dynLambda!3009 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76376)

(declare-fun lt!535856 () ListLongMap!17265)

(assert (=> b!1183184 (= lt!535856 (getCurrentListMapNoExtraKeys!5103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183185 () Bool)

(declare-fun e!672700 () Bool)

(assert (=> b!1183185 (= e!672700 true)))

(declare-fun lt!535861 () ListLongMap!17265)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!535857 () ListLongMap!17265)

(declare-fun -!1604 (ListLongMap!17265 (_ BitVec 64)) ListLongMap!17265)

(assert (=> b!1183185 (= (-!1604 lt!535861 k0!934) lt!535857)))

(declare-fun lt!535867 () ListLongMap!17265)

(declare-fun lt!535872 () Unit!39017)

(declare-fun lt!535868 () V!44889)

(declare-fun addRemoveCommutativeForDiffKeys!152 (ListLongMap!17265 (_ BitVec 64) V!44889 (_ BitVec 64)) Unit!39017)

(assert (=> b!1183185 (= lt!535872 (addRemoveCommutativeForDiffKeys!152 lt!535867 (select (arr!36838 _keys!1208) from!1455) lt!535868 k0!934))))

(declare-fun lt!535866 () ListLongMap!17265)

(declare-fun lt!535864 () ListLongMap!17265)

(assert (=> b!1183185 (and (= lt!535856 lt!535861) (= lt!535864 lt!535866))))

(declare-fun lt!535854 () tuple2!19296)

(declare-fun +!3938 (ListLongMap!17265 tuple2!19296) ListLongMap!17265)

(assert (=> b!1183185 (= lt!535861 (+!3938 lt!535867 lt!535854))))

(assert (=> b!1183185 (not (= (select (arr!36838 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535859 () Unit!39017)

(assert (=> b!1183185 (= lt!535859 e!672697)))

(declare-fun c!117034 () Bool)

(assert (=> b!1183185 (= c!117034 (= (select (arr!36838 _keys!1208) from!1455) k0!934))))

(declare-fun e!672692 () Bool)

(assert (=> b!1183185 e!672692))

(declare-fun res!786390 () Bool)

(assert (=> b!1183185 (=> (not res!786390) (not e!672692))))

(assert (=> b!1183185 (= res!786390 (= lt!535865 lt!535857))))

(assert (=> b!1183185 (= lt!535857 (+!3938 lt!535864 lt!535854))))

(assert (=> b!1183185 (= lt!535854 (tuple2!19297 (select (arr!36838 _keys!1208) from!1455) lt!535868))))

(declare-fun get!18857 (ValueCell!14201 V!44889) V!44889)

(assert (=> b!1183185 (= lt!535868 (get!18857 (select (arr!36839 _values!996) from!1455) lt!535858))))

(declare-fun b!1183186 () Bool)

(declare-fun e!672698 () Bool)

(assert (=> b!1183186 (= e!672698 (not e!672691))))

(declare-fun res!786384 () Bool)

(assert (=> b!1183186 (=> res!786384 e!672691)))

(assert (=> b!1183186 (= res!786384 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183186 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535869 () Unit!39017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76376 (_ BitVec 64) (_ BitVec 32)) Unit!39017)

(assert (=> b!1183186 (= lt!535869 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183187 () Bool)

(assert (=> b!1183187 (= e!672699 e!672700)))

(declare-fun res!786394 () Bool)

(assert (=> b!1183187 (=> res!786394 e!672700)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183187 (= res!786394 (not (validKeyInArray!0 (select (arr!36838 _keys!1208) from!1455))))))

(assert (=> b!1183187 (= lt!535866 lt!535864)))

(assert (=> b!1183187 (= lt!535864 (-!1604 lt!535867 k0!934))))

(assert (=> b!1183187 (= lt!535866 (getCurrentListMapNoExtraKeys!5103 lt!535862 lt!535870 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183187 (= lt!535867 (getCurrentListMapNoExtraKeys!5103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535855 () Unit!39017)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!866 (array!76376 array!76378 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39017)

(assert (=> b!1183187 (= lt!535855 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!866 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183188 () Bool)

(declare-fun e!672696 () Bool)

(assert (=> b!1183188 (= e!672696 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183189 () Bool)

(assert (=> b!1183189 (= e!672692 e!672696)))

(declare-fun res!786397 () Bool)

(assert (=> b!1183189 (=> res!786397 e!672696)))

(assert (=> b!1183189 (= res!786397 (not (= (select (arr!36838 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183191 () Bool)

(declare-fun res!786395 () Bool)

(declare-fun e!672693 () Bool)

(assert (=> b!1183191 (=> (not res!786395) (not e!672693))))

(assert (=> b!1183191 (= res!786395 (and (= (size!37377 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37376 _keys!1208) (size!37377 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183192 () Bool)

(declare-fun e!672695 () Bool)

(declare-fun e!672694 () Bool)

(declare-fun mapRes!46559 () Bool)

(assert (=> b!1183192 (= e!672695 (and e!672694 mapRes!46559))))

(declare-fun condMapEmpty!46559 () Bool)

(declare-fun mapDefault!46559 () ValueCell!14201)

(assert (=> b!1183192 (= condMapEmpty!46559 (= (arr!36839 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14201)) mapDefault!46559)))))

(declare-fun b!1183193 () Bool)

(assert (=> b!1183193 (= e!672693 e!672698)))

(declare-fun res!786389 () Bool)

(assert (=> b!1183193 (=> (not res!786389) (not e!672698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76376 (_ BitVec 32)) Bool)

(assert (=> b!1183193 (= res!786389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535862 mask!1564))))

(assert (=> b!1183193 (= lt!535862 (array!76377 (store (arr!36838 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37376 _keys!1208)))))

(declare-fun b!1183194 () Bool)

(declare-fun e!672689 () Bool)

(declare-fun tp_is_empty!29821 () Bool)

(assert (=> b!1183194 (= e!672689 tp_is_empty!29821)))

(declare-fun b!1183195 () Bool)

(declare-fun res!786386 () Bool)

(assert (=> b!1183195 (=> (not res!786386) (not e!672693))))

(declare-datatypes ((List!26005 0))(
  ( (Nil!26002) (Cons!26001 (h!27210 (_ BitVec 64)) (t!38279 List!26005)) )
))
(declare-fun arrayNoDuplicates!0 (array!76376 (_ BitVec 32) List!26005) Bool)

(assert (=> b!1183195 (= res!786386 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26002))))

(declare-fun b!1183196 () Bool)

(assert (=> b!1183196 (= e!672694 tp_is_empty!29821)))

(declare-fun mapIsEmpty!46559 () Bool)

(assert (=> mapIsEmpty!46559 mapRes!46559))

(declare-fun b!1183197 () Bool)

(declare-fun res!786385 () Bool)

(assert (=> b!1183197 (=> (not res!786385) (not e!672693))))

(assert (=> b!1183197 (= res!786385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37376 _keys!1208))))))

(declare-fun res!786393 () Bool)

(assert (=> start!99706 (=> (not res!786393) (not e!672693))))

(assert (=> start!99706 (= res!786393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37376 _keys!1208))))))

(assert (=> start!99706 e!672693))

(assert (=> start!99706 tp_is_empty!29821))

(declare-fun array_inv!28228 (array!76376) Bool)

(assert (=> start!99706 (array_inv!28228 _keys!1208)))

(assert (=> start!99706 true))

(assert (=> start!99706 tp!88586))

(declare-fun array_inv!28229 (array!76378) Bool)

(assert (=> start!99706 (and (array_inv!28229 _values!996) e!672695)))

(declare-fun b!1183190 () Bool)

(declare-fun res!786391 () Bool)

(assert (=> b!1183190 (=> (not res!786391) (not e!672693))))

(assert (=> b!1183190 (= res!786391 (= (select (arr!36838 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46559 () Bool)

(declare-fun tp!88587 () Bool)

(assert (=> mapNonEmpty!46559 (= mapRes!46559 (and tp!88587 e!672689))))

(declare-fun mapValue!46559 () ValueCell!14201)

(declare-fun mapKey!46559 () (_ BitVec 32))

(declare-fun mapRest!46559 () (Array (_ BitVec 32) ValueCell!14201))

(assert (=> mapNonEmpty!46559 (= (arr!36839 _values!996) (store mapRest!46559 mapKey!46559 mapValue!46559))))

(declare-fun b!1183198 () Bool)

(declare-fun res!786387 () Bool)

(assert (=> b!1183198 (=> (not res!786387) (not e!672693))))

(assert (=> b!1183198 (= res!786387 (validKeyInArray!0 k0!934))))

(declare-fun b!1183199 () Bool)

(declare-fun res!786383 () Bool)

(assert (=> b!1183199 (=> (not res!786383) (not e!672693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183199 (= res!786383 (validMask!0 mask!1564))))

(declare-fun b!1183200 () Bool)

(declare-fun Unit!39020 () Unit!39017)

(assert (=> b!1183200 (= e!672697 Unit!39020)))

(declare-fun lt!535863 () Unit!39017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39017)

(assert (=> b!1183200 (= lt!535863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183200 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535860 () Unit!39017)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76376 (_ BitVec 32) (_ BitVec 32)) Unit!39017)

(assert (=> b!1183200 (= lt!535860 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183200 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26002)))

(declare-fun lt!535871 () Unit!39017)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76376 (_ BitVec 64) (_ BitVec 32) List!26005) Unit!39017)

(assert (=> b!1183200 (= lt!535871 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26002))))

(assert (=> b!1183200 false))

(declare-fun b!1183201 () Bool)

(declare-fun res!786392 () Bool)

(assert (=> b!1183201 (=> (not res!786392) (not e!672693))))

(assert (=> b!1183201 (= res!786392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183202 () Bool)

(declare-fun res!786388 () Bool)

(assert (=> b!1183202 (=> (not res!786388) (not e!672698))))

(assert (=> b!1183202 (= res!786388 (arrayNoDuplicates!0 lt!535862 #b00000000000000000000000000000000 Nil!26002))))

(assert (= (and start!99706 res!786393) b!1183199))

(assert (= (and b!1183199 res!786383) b!1183191))

(assert (= (and b!1183191 res!786395) b!1183201))

(assert (= (and b!1183201 res!786392) b!1183195))

(assert (= (and b!1183195 res!786386) b!1183197))

(assert (= (and b!1183197 res!786385) b!1183198))

(assert (= (and b!1183198 res!786387) b!1183190))

(assert (= (and b!1183190 res!786391) b!1183193))

(assert (= (and b!1183193 res!786389) b!1183202))

(assert (= (and b!1183202 res!786388) b!1183186))

(assert (= (and b!1183186 (not res!786384)) b!1183184))

(assert (= (and b!1183184 (not res!786396)) b!1183187))

(assert (= (and b!1183187 (not res!786394)) b!1183185))

(assert (= (and b!1183185 res!786390) b!1183189))

(assert (= (and b!1183189 (not res!786397)) b!1183188))

(assert (= (and b!1183185 c!117034) b!1183200))

(assert (= (and b!1183185 (not c!117034)) b!1183183))

(assert (= (and b!1183192 condMapEmpty!46559) mapIsEmpty!46559))

(assert (= (and b!1183192 (not condMapEmpty!46559)) mapNonEmpty!46559))

(get-info :version)

(assert (= (and mapNonEmpty!46559 ((_ is ValueCellFull!14201) mapValue!46559)) b!1183194))

(assert (= (and b!1183192 ((_ is ValueCellFull!14201) mapDefault!46559)) b!1183196))

(assert (= start!99706 b!1183192))

(declare-fun b_lambda!20417 () Bool)

(assert (=> (not b_lambda!20417) (not b!1183184)))

(declare-fun t!38277 () Bool)

(declare-fun tb!10095 () Bool)

(assert (=> (and start!99706 (= defaultEntry!1004 defaultEntry!1004) t!38277) tb!10095))

(declare-fun result!20765 () Bool)

(assert (=> tb!10095 (= result!20765 tp_is_empty!29821)))

(assert (=> b!1183184 t!38277))

(declare-fun b_and!41429 () Bool)

(assert (= b_and!41427 (and (=> t!38277 result!20765) b_and!41429)))

(declare-fun m!1090835 () Bool)

(assert (=> b!1183195 m!1090835))

(declare-fun m!1090837 () Bool)

(assert (=> b!1183199 m!1090837))

(declare-fun m!1090839 () Bool)

(assert (=> b!1183190 m!1090839))

(declare-fun m!1090841 () Bool)

(assert (=> b!1183186 m!1090841))

(declare-fun m!1090843 () Bool)

(assert (=> b!1183186 m!1090843))

(declare-fun m!1090845 () Bool)

(assert (=> start!99706 m!1090845))

(declare-fun m!1090847 () Bool)

(assert (=> start!99706 m!1090847))

(declare-fun m!1090849 () Bool)

(assert (=> b!1183188 m!1090849))

(declare-fun m!1090851 () Bool)

(assert (=> b!1183200 m!1090851))

(declare-fun m!1090853 () Bool)

(assert (=> b!1183200 m!1090853))

(declare-fun m!1090855 () Bool)

(assert (=> b!1183200 m!1090855))

(declare-fun m!1090857 () Bool)

(assert (=> b!1183200 m!1090857))

(declare-fun m!1090859 () Bool)

(assert (=> b!1183200 m!1090859))

(declare-fun m!1090861 () Bool)

(assert (=> b!1183198 m!1090861))

(declare-fun m!1090863 () Bool)

(assert (=> b!1183202 m!1090863))

(declare-fun m!1090865 () Bool)

(assert (=> b!1183184 m!1090865))

(declare-fun m!1090867 () Bool)

(assert (=> b!1183184 m!1090867))

(declare-fun m!1090869 () Bool)

(assert (=> b!1183184 m!1090869))

(declare-fun m!1090871 () Bool)

(assert (=> b!1183184 m!1090871))

(declare-fun m!1090873 () Bool)

(assert (=> b!1183189 m!1090873))

(declare-fun m!1090875 () Bool)

(assert (=> mapNonEmpty!46559 m!1090875))

(declare-fun m!1090877 () Bool)

(assert (=> b!1183185 m!1090877))

(declare-fun m!1090879 () Bool)

(assert (=> b!1183185 m!1090879))

(declare-fun m!1090881 () Bool)

(assert (=> b!1183185 m!1090881))

(assert (=> b!1183185 m!1090873))

(declare-fun m!1090883 () Bool)

(assert (=> b!1183185 m!1090883))

(declare-fun m!1090885 () Bool)

(assert (=> b!1183185 m!1090885))

(assert (=> b!1183185 m!1090873))

(assert (=> b!1183185 m!1090877))

(declare-fun m!1090887 () Bool)

(assert (=> b!1183185 m!1090887))

(declare-fun m!1090889 () Bool)

(assert (=> b!1183187 m!1090889))

(declare-fun m!1090891 () Bool)

(assert (=> b!1183187 m!1090891))

(declare-fun m!1090893 () Bool)

(assert (=> b!1183187 m!1090893))

(declare-fun m!1090895 () Bool)

(assert (=> b!1183187 m!1090895))

(assert (=> b!1183187 m!1090873))

(declare-fun m!1090897 () Bool)

(assert (=> b!1183187 m!1090897))

(assert (=> b!1183187 m!1090873))

(declare-fun m!1090899 () Bool)

(assert (=> b!1183201 m!1090899))

(declare-fun m!1090901 () Bool)

(assert (=> b!1183193 m!1090901))

(declare-fun m!1090903 () Bool)

(assert (=> b!1183193 m!1090903))

(check-sat (not b!1183195) tp_is_empty!29821 (not b!1183188) b_and!41429 (not b!1183201) (not b_next!25291) (not b!1183184) (not b!1183193) (not b!1183202) (not b!1183199) (not b!1183186) (not b!1183187) (not mapNonEmpty!46559) (not b!1183198) (not b!1183200) (not b!1183185) (not start!99706) (not b_lambda!20417))
(check-sat b_and!41429 (not b_next!25291))
