; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99642 () Bool)

(assert start!99642)

(declare-fun b_free!25221 () Bool)

(declare-fun b_next!25221 () Bool)

(assert (=> start!99642 (= b_free!25221 (not b_next!25221))))

(declare-fun tp!88376 () Bool)

(declare-fun b_and!41309 () Bool)

(assert (=> start!99642 (= tp!88376 b_and!41309)))

(declare-fun res!784838 () Bool)

(declare-fun e!671493 () Bool)

(assert (=> start!99642 (=> (not res!784838) (not e!671493))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76305 0))(
  ( (array!76306 (arr!36802 (Array (_ BitVec 32) (_ BitVec 64))) (size!37338 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76305)

(assert (=> start!99642 (= res!784838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37338 _keys!1208))))))

(assert (=> start!99642 e!671493))

(declare-fun tp_is_empty!29751 () Bool)

(assert (=> start!99642 tp_is_empty!29751))

(declare-fun array_inv!28100 (array!76305) Bool)

(assert (=> start!99642 (array_inv!28100 _keys!1208)))

(assert (=> start!99642 true))

(assert (=> start!99642 tp!88376))

(declare-datatypes ((V!44795 0))(
  ( (V!44796 (val!14932 Int)) )
))
(declare-datatypes ((ValueCell!14166 0))(
  ( (ValueCellFull!14166 (v!17570 V!44795)) (EmptyCell!14166) )
))
(declare-datatypes ((array!76307 0))(
  ( (array!76308 (arr!36803 (Array (_ BitVec 32) ValueCell!14166)) (size!37339 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76307)

(declare-fun e!671496 () Bool)

(declare-fun array_inv!28101 (array!76307) Bool)

(assert (=> start!99642 (and (array_inv!28101 _values!996) e!671496)))

(declare-fun b!1181093 () Bool)

(declare-fun e!671488 () Bool)

(assert (=> b!1181093 (= e!671493 e!671488)))

(declare-fun res!784830 () Bool)

(assert (=> b!1181093 (=> (not res!784830) (not e!671488))))

(declare-fun lt!534143 () array!76305)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76305 (_ BitVec 32)) Bool)

(assert (=> b!1181093 (= res!784830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534143 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1181093 (= lt!534143 (array!76306 (store (arr!36802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37338 _keys!1208)))))

(declare-fun b!1181094 () Bool)

(declare-fun res!784846 () Bool)

(assert (=> b!1181094 (=> (not res!784846) (not e!671493))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1181094 (= res!784846 (and (= (size!37339 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37338 _keys!1208) (size!37339 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181095 () Bool)

(declare-fun e!671492 () Bool)

(declare-datatypes ((tuple2!19124 0))(
  ( (tuple2!19125 (_1!9573 (_ BitVec 64)) (_2!9573 V!44795)) )
))
(declare-datatypes ((List!25865 0))(
  ( (Nil!25862) (Cons!25861 (h!27070 tuple2!19124) (t!38078 List!25865)) )
))
(declare-datatypes ((ListLongMap!17093 0))(
  ( (ListLongMap!17094 (toList!8562 List!25865)) )
))
(declare-fun lt!534153 () ListLongMap!17093)

(declare-fun lt!534145 () ListLongMap!17093)

(assert (=> b!1181095 (= e!671492 (= lt!534153 lt!534145))))

(declare-fun b!1181096 () Bool)

(declare-fun res!784843 () Bool)

(assert (=> b!1181096 (=> (not res!784843) (not e!671493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181096 (= res!784843 (validMask!0 mask!1564))))

(declare-fun b!1181097 () Bool)

(declare-fun e!671491 () Bool)

(declare-fun e!671497 () Bool)

(assert (=> b!1181097 (= e!671491 e!671497)))

(declare-fun res!784836 () Bool)

(assert (=> b!1181097 (=> res!784836 e!671497)))

(assert (=> b!1181097 (= res!784836 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44795)

(declare-fun lt!534140 () array!76307)

(declare-fun lt!534139 () ListLongMap!17093)

(declare-fun minValue!944 () V!44795)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5016 (array!76305 array!76307 (_ BitVec 32) (_ BitVec 32) V!44795 V!44795 (_ BitVec 32) Int) ListLongMap!17093)

(assert (=> b!1181097 (= lt!534139 (getCurrentListMapNoExtraKeys!5016 lt!534143 lt!534140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534144 () V!44795)

(assert (=> b!1181097 (= lt!534140 (array!76308 (store (arr!36803 _values!996) i!673 (ValueCellFull!14166 lt!534144)) (size!37339 _values!996)))))

(declare-fun dynLambda!2973 (Int (_ BitVec 64)) V!44795)

(assert (=> b!1181097 (= lt!534144 (dynLambda!2973 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534150 () ListLongMap!17093)

(assert (=> b!1181097 (= lt!534150 (getCurrentListMapNoExtraKeys!5016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181098 () Bool)

(declare-fun res!784842 () Bool)

(assert (=> b!1181098 (=> (not res!784842) (not e!671493))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1181098 (= res!784842 (= (select (arr!36802 _keys!1208) i!673) k0!934))))

(declare-fun b!1181099 () Bool)

(declare-fun res!784835 () Bool)

(assert (=> b!1181099 (=> (not res!784835) (not e!671488))))

(declare-datatypes ((List!25866 0))(
  ( (Nil!25863) (Cons!25862 (h!27071 (_ BitVec 64)) (t!38079 List!25866)) )
))
(declare-fun arrayNoDuplicates!0 (array!76305 (_ BitVec 32) List!25866) Bool)

(assert (=> b!1181099 (= res!784835 (arrayNoDuplicates!0 lt!534143 #b00000000000000000000000000000000 Nil!25863))))

(declare-fun b!1181100 () Bool)

(declare-fun e!671495 () Bool)

(assert (=> b!1181100 (= e!671497 e!671495)))

(declare-fun res!784837 () Bool)

(assert (=> b!1181100 (=> res!784837 e!671495)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181100 (= res!784837 (not (validKeyInArray!0 (select (arr!36802 _keys!1208) from!1455))))))

(assert (=> b!1181100 (= lt!534145 lt!534153)))

(declare-fun lt!534142 () ListLongMap!17093)

(declare-fun -!1603 (ListLongMap!17093 (_ BitVec 64)) ListLongMap!17093)

(assert (=> b!1181100 (= lt!534153 (-!1603 lt!534142 k0!934))))

(assert (=> b!1181100 (= lt!534145 (getCurrentListMapNoExtraKeys!5016 lt!534143 lt!534140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181100 (= lt!534142 (getCurrentListMapNoExtraKeys!5016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39051 0))(
  ( (Unit!39052) )
))
(declare-fun lt!534147 () Unit!39051)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!830 (array!76305 array!76307 (_ BitVec 32) (_ BitVec 32) V!44795 V!44795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39051)

(assert (=> b!1181100 (= lt!534147 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181101 () Bool)

(declare-fun res!784833 () Bool)

(assert (=> b!1181101 (=> (not res!784833) (not e!671493))))

(assert (=> b!1181101 (= res!784833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181102 () Bool)

(declare-fun res!784839 () Bool)

(assert (=> b!1181102 (=> (not res!784839) (not e!671493))))

(assert (=> b!1181102 (= res!784839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25863))))

(declare-fun b!1181103 () Bool)

(assert (=> b!1181103 (= e!671488 (not e!671491))))

(declare-fun res!784834 () Bool)

(assert (=> b!1181103 (=> res!784834 e!671491)))

(assert (=> b!1181103 (= res!784834 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181103 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534148 () Unit!39051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76305 (_ BitVec 64) (_ BitVec 32)) Unit!39051)

(assert (=> b!1181103 (= lt!534148 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181104 () Bool)

(declare-fun e!671489 () Bool)

(assert (=> b!1181104 (= e!671489 tp_is_empty!29751)))

(declare-fun b!1181105 () Bool)

(declare-fun res!784845 () Bool)

(assert (=> b!1181105 (=> (not res!784845) (not e!671492))))

(declare-fun lt!534152 () tuple2!19124)

(declare-fun +!3870 (ListLongMap!17093 tuple2!19124) ListLongMap!17093)

(assert (=> b!1181105 (= res!784845 (= lt!534150 (+!3870 lt!534142 lt!534152)))))

(declare-fun b!1181106 () Bool)

(declare-fun res!784832 () Bool)

(assert (=> b!1181106 (=> (not res!784832) (not e!671493))))

(assert (=> b!1181106 (= res!784832 (validKeyInArray!0 k0!934))))

(declare-fun b!1181107 () Bool)

(declare-fun res!784841 () Bool)

(assert (=> b!1181107 (=> (not res!784841) (not e!671493))))

(assert (=> b!1181107 (= res!784841 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37338 _keys!1208))))))

(declare-fun mapNonEmpty!46454 () Bool)

(declare-fun mapRes!46454 () Bool)

(declare-fun tp!88377 () Bool)

(declare-fun e!671494 () Bool)

(assert (=> mapNonEmpty!46454 (= mapRes!46454 (and tp!88377 e!671494))))

(declare-fun mapValue!46454 () ValueCell!14166)

(declare-fun mapKey!46454 () (_ BitVec 32))

(declare-fun mapRest!46454 () (Array (_ BitVec 32) ValueCell!14166))

(assert (=> mapNonEmpty!46454 (= (arr!36803 _values!996) (store mapRest!46454 mapKey!46454 mapValue!46454))))

(declare-fun b!1181108 () Bool)

(declare-fun e!671486 () Bool)

(declare-fun e!671490 () Bool)

(assert (=> b!1181108 (= e!671486 e!671490)))

(declare-fun res!784844 () Bool)

(assert (=> b!1181108 (=> res!784844 e!671490)))

(assert (=> b!1181108 (= res!784844 (not (= (select (arr!36802 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181109 () Bool)

(declare-fun e!671487 () Unit!39051)

(declare-fun Unit!39053 () Unit!39051)

(assert (=> b!1181109 (= e!671487 Unit!39053)))

(declare-fun b!1181110 () Bool)

(declare-fun Unit!39054 () Unit!39051)

(assert (=> b!1181110 (= e!671487 Unit!39054)))

(declare-fun lt!534141 () Unit!39051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39051)

(assert (=> b!1181110 (= lt!534141 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181110 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534149 () Unit!39051)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76305 (_ BitVec 32) (_ BitVec 32)) Unit!39051)

(assert (=> b!1181110 (= lt!534149 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181110 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25863)))

(declare-fun lt!534151 () Unit!39051)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76305 (_ BitVec 64) (_ BitVec 32) List!25866) Unit!39051)

(assert (=> b!1181110 (= lt!534151 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25863))))

(assert (=> b!1181110 false))

(declare-fun b!1181111 () Bool)

(assert (=> b!1181111 (= e!671496 (and e!671489 mapRes!46454))))

(declare-fun condMapEmpty!46454 () Bool)

(declare-fun mapDefault!46454 () ValueCell!14166)

(assert (=> b!1181111 (= condMapEmpty!46454 (= (arr!36803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14166)) mapDefault!46454)))))

(declare-fun b!1181112 () Bool)

(assert (=> b!1181112 (= e!671490 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181113 () Bool)

(assert (=> b!1181113 (= e!671494 tp_is_empty!29751)))

(declare-fun mapIsEmpty!46454 () Bool)

(assert (=> mapIsEmpty!46454 mapRes!46454))

(declare-fun b!1181114 () Bool)

(assert (=> b!1181114 (= e!671495 true)))

(assert (=> b!1181114 e!671492))

(declare-fun res!784831 () Bool)

(assert (=> b!1181114 (=> (not res!784831) (not e!671492))))

(assert (=> b!1181114 (= res!784831 (not (= (select (arr!36802 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534146 () Unit!39051)

(assert (=> b!1181114 (= lt!534146 e!671487)))

(declare-fun c!116955 () Bool)

(assert (=> b!1181114 (= c!116955 (= (select (arr!36802 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181114 e!671486))

(declare-fun res!784840 () Bool)

(assert (=> b!1181114 (=> (not res!784840) (not e!671486))))

(assert (=> b!1181114 (= res!784840 (= lt!534139 (+!3870 lt!534153 lt!534152)))))

(declare-fun get!18820 (ValueCell!14166 V!44795) V!44795)

(assert (=> b!1181114 (= lt!534152 (tuple2!19125 (select (arr!36802 _keys!1208) from!1455) (get!18820 (select (arr!36803 _values!996) from!1455) lt!534144)))))

(assert (= (and start!99642 res!784838) b!1181096))

(assert (= (and b!1181096 res!784843) b!1181094))

(assert (= (and b!1181094 res!784846) b!1181101))

(assert (= (and b!1181101 res!784833) b!1181102))

(assert (= (and b!1181102 res!784839) b!1181107))

(assert (= (and b!1181107 res!784841) b!1181106))

(assert (= (and b!1181106 res!784832) b!1181098))

(assert (= (and b!1181098 res!784842) b!1181093))

(assert (= (and b!1181093 res!784830) b!1181099))

(assert (= (and b!1181099 res!784835) b!1181103))

(assert (= (and b!1181103 (not res!784834)) b!1181097))

(assert (= (and b!1181097 (not res!784836)) b!1181100))

(assert (= (and b!1181100 (not res!784837)) b!1181114))

(assert (= (and b!1181114 res!784840) b!1181108))

(assert (= (and b!1181108 (not res!784844)) b!1181112))

(assert (= (and b!1181114 c!116955) b!1181110))

(assert (= (and b!1181114 (not c!116955)) b!1181109))

(assert (= (and b!1181114 res!784831) b!1181105))

(assert (= (and b!1181105 res!784845) b!1181095))

(assert (= (and b!1181111 condMapEmpty!46454) mapIsEmpty!46454))

(assert (= (and b!1181111 (not condMapEmpty!46454)) mapNonEmpty!46454))

(get-info :version)

(assert (= (and mapNonEmpty!46454 ((_ is ValueCellFull!14166) mapValue!46454)) b!1181113))

(assert (= (and b!1181111 ((_ is ValueCellFull!14166) mapDefault!46454)) b!1181104))

(assert (= start!99642 b!1181111))

(declare-fun b_lambda!20365 () Bool)

(assert (=> (not b_lambda!20365) (not b!1181097)))

(declare-fun t!38077 () Bool)

(declare-fun tb!10033 () Bool)

(assert (=> (and start!99642 (= defaultEntry!1004 defaultEntry!1004) t!38077) tb!10033))

(declare-fun result!20633 () Bool)

(assert (=> tb!10033 (= result!20633 tp_is_empty!29751)))

(assert (=> b!1181097 t!38077))

(declare-fun b_and!41311 () Bool)

(assert (= b_and!41309 (and (=> t!38077 result!20633) b_and!41311)))

(declare-fun m!1089027 () Bool)

(assert (=> b!1181103 m!1089027))

(declare-fun m!1089029 () Bool)

(assert (=> b!1181103 m!1089029))

(declare-fun m!1089031 () Bool)

(assert (=> b!1181105 m!1089031))

(declare-fun m!1089033 () Bool)

(assert (=> b!1181098 m!1089033))

(declare-fun m!1089035 () Bool)

(assert (=> b!1181102 m!1089035))

(declare-fun m!1089037 () Bool)

(assert (=> b!1181108 m!1089037))

(declare-fun m!1089039 () Bool)

(assert (=> b!1181099 m!1089039))

(declare-fun m!1089041 () Bool)

(assert (=> b!1181093 m!1089041))

(declare-fun m!1089043 () Bool)

(assert (=> b!1181093 m!1089043))

(assert (=> b!1181114 m!1089037))

(declare-fun m!1089045 () Bool)

(assert (=> b!1181114 m!1089045))

(declare-fun m!1089047 () Bool)

(assert (=> b!1181114 m!1089047))

(assert (=> b!1181114 m!1089047))

(declare-fun m!1089049 () Bool)

(assert (=> b!1181114 m!1089049))

(declare-fun m!1089051 () Bool)

(assert (=> b!1181097 m!1089051))

(declare-fun m!1089053 () Bool)

(assert (=> b!1181097 m!1089053))

(declare-fun m!1089055 () Bool)

(assert (=> b!1181097 m!1089055))

(declare-fun m!1089057 () Bool)

(assert (=> b!1181097 m!1089057))

(declare-fun m!1089059 () Bool)

(assert (=> b!1181096 m!1089059))

(declare-fun m!1089061 () Bool)

(assert (=> b!1181112 m!1089061))

(declare-fun m!1089063 () Bool)

(assert (=> start!99642 m!1089063))

(declare-fun m!1089065 () Bool)

(assert (=> start!99642 m!1089065))

(declare-fun m!1089067 () Bool)

(assert (=> b!1181101 m!1089067))

(declare-fun m!1089069 () Bool)

(assert (=> b!1181106 m!1089069))

(declare-fun m!1089071 () Bool)

(assert (=> b!1181100 m!1089071))

(assert (=> b!1181100 m!1089037))

(declare-fun m!1089073 () Bool)

(assert (=> b!1181100 m!1089073))

(declare-fun m!1089075 () Bool)

(assert (=> b!1181100 m!1089075))

(assert (=> b!1181100 m!1089037))

(declare-fun m!1089077 () Bool)

(assert (=> b!1181100 m!1089077))

(declare-fun m!1089079 () Bool)

(assert (=> b!1181100 m!1089079))

(declare-fun m!1089081 () Bool)

(assert (=> b!1181110 m!1089081))

(declare-fun m!1089083 () Bool)

(assert (=> b!1181110 m!1089083))

(declare-fun m!1089085 () Bool)

(assert (=> b!1181110 m!1089085))

(declare-fun m!1089087 () Bool)

(assert (=> b!1181110 m!1089087))

(declare-fun m!1089089 () Bool)

(assert (=> b!1181110 m!1089089))

(declare-fun m!1089091 () Bool)

(assert (=> mapNonEmpty!46454 m!1089091))

(check-sat b_and!41311 (not b!1181101) tp_is_empty!29751 (not b!1181099) (not b_lambda!20365) (not b!1181100) (not b!1181106) (not b!1181110) (not b!1181096) (not b!1181093) (not mapNonEmpty!46454) (not b!1181105) (not b!1181102) (not b_next!25221) (not b!1181097) (not b!1181114) (not b!1181103) (not start!99642) (not b!1181112))
(check-sat b_and!41311 (not b_next!25221))
