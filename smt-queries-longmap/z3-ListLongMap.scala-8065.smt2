; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99466 () Bool)

(assert start!99466)

(declare-fun b_free!24835 () Bool)

(declare-fun b_next!24835 () Bool)

(assert (=> start!99466 (= b_free!24835 (not b_next!24835))))

(declare-fun tp!87215 () Bool)

(declare-fun b_and!40521 () Bool)

(assert (=> start!99466 (= tp!87215 b_and!40521)))

(declare-fun res!775945 () Bool)

(declare-fun e!665045 () Bool)

(assert (=> start!99466 (=> (not res!775945) (not e!665045))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75601 0))(
  ( (array!75602 (arr!36445 (Array (_ BitVec 32) (_ BitVec 64))) (size!36982 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75601)

(assert (=> start!99466 (= res!775945 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36982 _keys!1208))))))

(assert (=> start!99466 e!665045))

(declare-fun tp_is_empty!29365 () Bool)

(assert (=> start!99466 tp_is_empty!29365))

(declare-fun array_inv!27932 (array!75601) Bool)

(assert (=> start!99466 (array_inv!27932 _keys!1208)))

(assert (=> start!99466 true))

(assert (=> start!99466 tp!87215))

(declare-datatypes ((V!44281 0))(
  ( (V!44282 (val!14739 Int)) )
))
(declare-datatypes ((ValueCell!13973 0))(
  ( (ValueCellFull!13973 (v!17372 V!44281)) (EmptyCell!13973) )
))
(declare-datatypes ((array!75603 0))(
  ( (array!75604 (arr!36446 (Array (_ BitVec 32) ValueCell!13973)) (size!36983 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75603)

(declare-fun e!665047 () Bool)

(declare-fun array_inv!27933 (array!75603) Bool)

(assert (=> start!99466 (and (array_inv!27933 _values!996) e!665047)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1169994 () Bool)

(declare-fun e!665043 () Bool)

(assert (=> b!1169994 (= e!665043 (or (not (= (select (arr!36445 _keys!1208) from!1455) k0!934)) (bvslt (size!36982 _keys!1208) #b01111111111111111111111111111111)))))

(declare-datatypes ((tuple2!18842 0))(
  ( (tuple2!18843 (_1!9432 (_ BitVec 64)) (_2!9432 V!44281)) )
))
(declare-datatypes ((List!25582 0))(
  ( (Nil!25579) (Cons!25578 (h!26796 tuple2!18842) (t!37401 List!25582)) )
))
(declare-datatypes ((ListLongMap!16819 0))(
  ( (ListLongMap!16820 (toList!8425 List!25582)) )
))
(declare-fun lt!526679 () ListLongMap!16819)

(declare-fun lt!526675 () ListLongMap!16819)

(declare-fun lt!526681 () V!44281)

(declare-fun +!3770 (ListLongMap!16819 tuple2!18842) ListLongMap!16819)

(declare-fun get!18598 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1169994 (= lt!526679 (+!3770 lt!526675 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))))))

(declare-fun b!1169995 () Bool)

(declare-fun e!665041 () Bool)

(assert (=> b!1169995 (= e!665045 e!665041)))

(declare-fun res!775950 () Bool)

(assert (=> b!1169995 (=> (not res!775950) (not e!665041))))

(declare-fun lt!526680 () array!75601)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75601 (_ BitVec 32)) Bool)

(assert (=> b!1169995 (= res!775950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526680 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169995 (= lt!526680 (array!75602 (store (arr!36445 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36982 _keys!1208)))))

(declare-fun b!1169996 () Bool)

(declare-fun res!775948 () Bool)

(assert (=> b!1169996 (=> (not res!775948) (not e!665045))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1169996 (= res!775948 (and (= (size!36983 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36982 _keys!1208) (size!36983 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169997 () Bool)

(declare-fun e!665040 () Bool)

(assert (=> b!1169997 (= e!665040 e!665043)))

(declare-fun res!775946 () Bool)

(assert (=> b!1169997 (=> res!775946 e!665043)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169997 (= res!775946 (not (validKeyInArray!0 (select (arr!36445 _keys!1208) from!1455))))))

(declare-fun lt!526677 () ListLongMap!16819)

(assert (=> b!1169997 (= lt!526677 lt!526675)))

(declare-fun lt!526674 () ListLongMap!16819)

(declare-fun -!1485 (ListLongMap!16819 (_ BitVec 64)) ListLongMap!16819)

(assert (=> b!1169997 (= lt!526675 (-!1485 lt!526674 k0!934))))

(declare-fun zeroValue!944 () V!44281)

(declare-fun minValue!944 () V!44281)

(declare-fun lt!526673 () array!75603)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4916 (array!75601 array!75603 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) Int) ListLongMap!16819)

(assert (=> b!1169997 (= lt!526677 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169997 (= lt!526674 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38543 0))(
  ( (Unit!38544) )
))
(declare-fun lt!526676 () Unit!38543)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!710 (array!75601 array!75603 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38543)

(assert (=> b!1169997 (= lt!526676 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169998 () Bool)

(declare-fun res!775949 () Bool)

(assert (=> b!1169998 (=> (not res!775949) (not e!665045))))

(assert (=> b!1169998 (= res!775949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169999 () Bool)

(declare-fun res!775942 () Bool)

(assert (=> b!1169999 (=> (not res!775942) (not e!665045))))

(declare-datatypes ((List!25583 0))(
  ( (Nil!25580) (Cons!25579 (h!26797 (_ BitVec 64)) (t!37402 List!25583)) )
))
(declare-fun arrayNoDuplicates!0 (array!75601 (_ BitVec 32) List!25583) Bool)

(assert (=> b!1169999 (= res!775942 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25580))))

(declare-fun b!1170000 () Bool)

(declare-fun e!665044 () Bool)

(assert (=> b!1170000 (= e!665044 e!665040)))

(declare-fun res!775952 () Bool)

(assert (=> b!1170000 (=> res!775952 e!665040)))

(assert (=> b!1170000 (= res!775952 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170000 (= lt!526679 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170000 (= lt!526673 (array!75604 (store (arr!36446 _values!996) i!673 (ValueCellFull!13973 lt!526681)) (size!36983 _values!996)))))

(declare-fun dynLambda!2902 (Int (_ BitVec 64)) V!44281)

(assert (=> b!1170000 (= lt!526681 (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526678 () ListLongMap!16819)

(assert (=> b!1170000 (= lt!526678 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45872 () Bool)

(declare-fun mapRes!45872 () Bool)

(assert (=> mapIsEmpty!45872 mapRes!45872))

(declare-fun b!1170001 () Bool)

(declare-fun e!665042 () Bool)

(assert (=> b!1170001 (= e!665042 tp_is_empty!29365)))

(declare-fun b!1170002 () Bool)

(declare-fun e!665046 () Bool)

(assert (=> b!1170002 (= e!665047 (and e!665046 mapRes!45872))))

(declare-fun condMapEmpty!45872 () Bool)

(declare-fun mapDefault!45872 () ValueCell!13973)

(assert (=> b!1170002 (= condMapEmpty!45872 (= (arr!36446 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13973)) mapDefault!45872)))))

(declare-fun b!1170003 () Bool)

(declare-fun res!775943 () Bool)

(assert (=> b!1170003 (=> (not res!775943) (not e!665045))))

(assert (=> b!1170003 (= res!775943 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36982 _keys!1208))))))

(declare-fun b!1170004 () Bool)

(declare-fun res!775953 () Bool)

(assert (=> b!1170004 (=> (not res!775953) (not e!665041))))

(assert (=> b!1170004 (= res!775953 (arrayNoDuplicates!0 lt!526680 #b00000000000000000000000000000000 Nil!25580))))

(declare-fun b!1170005 () Bool)

(declare-fun res!775947 () Bool)

(assert (=> b!1170005 (=> (not res!775947) (not e!665045))))

(assert (=> b!1170005 (= res!775947 (= (select (arr!36445 _keys!1208) i!673) k0!934))))

(declare-fun b!1170006 () Bool)

(declare-fun res!775941 () Bool)

(assert (=> b!1170006 (=> (not res!775941) (not e!665045))))

(assert (=> b!1170006 (= res!775941 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45872 () Bool)

(declare-fun tp!87216 () Bool)

(assert (=> mapNonEmpty!45872 (= mapRes!45872 (and tp!87216 e!665042))))

(declare-fun mapValue!45872 () ValueCell!13973)

(declare-fun mapKey!45872 () (_ BitVec 32))

(declare-fun mapRest!45872 () (Array (_ BitVec 32) ValueCell!13973))

(assert (=> mapNonEmpty!45872 (= (arr!36446 _values!996) (store mapRest!45872 mapKey!45872 mapValue!45872))))

(declare-fun b!1170007 () Bool)

(assert (=> b!1170007 (= e!665046 tp_is_empty!29365)))

(declare-fun b!1170008 () Bool)

(declare-fun res!775944 () Bool)

(assert (=> b!1170008 (=> (not res!775944) (not e!665045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170008 (= res!775944 (validMask!0 mask!1564))))

(declare-fun b!1170009 () Bool)

(assert (=> b!1170009 (= e!665041 (not e!665044))))

(declare-fun res!775951 () Bool)

(assert (=> b!1170009 (=> res!775951 e!665044)))

(assert (=> b!1170009 (= res!775951 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170009 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526672 () Unit!38543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75601 (_ BitVec 64) (_ BitVec 32)) Unit!38543)

(assert (=> b!1170009 (= lt!526672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99466 res!775945) b!1170008))

(assert (= (and b!1170008 res!775944) b!1169996))

(assert (= (and b!1169996 res!775948) b!1169998))

(assert (= (and b!1169998 res!775949) b!1169999))

(assert (= (and b!1169999 res!775942) b!1170003))

(assert (= (and b!1170003 res!775943) b!1170006))

(assert (= (and b!1170006 res!775941) b!1170005))

(assert (= (and b!1170005 res!775947) b!1169995))

(assert (= (and b!1169995 res!775950) b!1170004))

(assert (= (and b!1170004 res!775953) b!1170009))

(assert (= (and b!1170009 (not res!775951)) b!1170000))

(assert (= (and b!1170000 (not res!775952)) b!1169997))

(assert (= (and b!1169997 (not res!775946)) b!1169994))

(assert (= (and b!1170002 condMapEmpty!45872) mapIsEmpty!45872))

(assert (= (and b!1170002 (not condMapEmpty!45872)) mapNonEmpty!45872))

(get-info :version)

(assert (= (and mapNonEmpty!45872 ((_ is ValueCellFull!13973) mapValue!45872)) b!1170001))

(assert (= (and b!1170002 ((_ is ValueCellFull!13973) mapDefault!45872)) b!1170007))

(assert (= start!99466 b!1170002))

(declare-fun b_lambda!19935 () Bool)

(assert (=> (not b_lambda!19935) (not b!1170000)))

(declare-fun t!37400 () Bool)

(declare-fun tb!9639 () Bool)

(assert (=> (and start!99466 (= defaultEntry!1004 defaultEntry!1004) t!37400) tb!9639))

(declare-fun result!19851 () Bool)

(assert (=> tb!9639 (= result!19851 tp_is_empty!29365)))

(assert (=> b!1170000 t!37400))

(declare-fun b_and!40523 () Bool)

(assert (= b_and!40521 (and (=> t!37400 result!19851) b_and!40523)))

(declare-fun m!1078121 () Bool)

(assert (=> start!99466 m!1078121))

(declare-fun m!1078123 () Bool)

(assert (=> start!99466 m!1078123))

(declare-fun m!1078125 () Bool)

(assert (=> b!1170005 m!1078125))

(declare-fun m!1078127 () Bool)

(assert (=> b!1169997 m!1078127))

(declare-fun m!1078129 () Bool)

(assert (=> b!1169997 m!1078129))

(declare-fun m!1078131 () Bool)

(assert (=> b!1169997 m!1078131))

(declare-fun m!1078133 () Bool)

(assert (=> b!1169997 m!1078133))

(declare-fun m!1078135 () Bool)

(assert (=> b!1169997 m!1078135))

(declare-fun m!1078137 () Bool)

(assert (=> b!1169997 m!1078137))

(assert (=> b!1169997 m!1078133))

(declare-fun m!1078139 () Bool)

(assert (=> b!1170008 m!1078139))

(declare-fun m!1078141 () Bool)

(assert (=> b!1169998 m!1078141))

(declare-fun m!1078143 () Bool)

(assert (=> b!1170004 m!1078143))

(declare-fun m!1078145 () Bool)

(assert (=> b!1170006 m!1078145))

(declare-fun m!1078147 () Bool)

(assert (=> b!1169999 m!1078147))

(declare-fun m!1078149 () Bool)

(assert (=> b!1170000 m!1078149))

(declare-fun m!1078151 () Bool)

(assert (=> b!1170000 m!1078151))

(declare-fun m!1078153 () Bool)

(assert (=> b!1170000 m!1078153))

(declare-fun m!1078155 () Bool)

(assert (=> b!1170000 m!1078155))

(declare-fun m!1078157 () Bool)

(assert (=> b!1169995 m!1078157))

(declare-fun m!1078159 () Bool)

(assert (=> b!1169995 m!1078159))

(declare-fun m!1078161 () Bool)

(assert (=> b!1170009 m!1078161))

(declare-fun m!1078163 () Bool)

(assert (=> b!1170009 m!1078163))

(declare-fun m!1078165 () Bool)

(assert (=> mapNonEmpty!45872 m!1078165))

(assert (=> b!1169994 m!1078133))

(declare-fun m!1078167 () Bool)

(assert (=> b!1169994 m!1078167))

(assert (=> b!1169994 m!1078167))

(declare-fun m!1078169 () Bool)

(assert (=> b!1169994 m!1078169))

(declare-fun m!1078171 () Bool)

(assert (=> b!1169994 m!1078171))

(check-sat (not b!1169998) (not b_next!24835) (not b!1170008) (not mapNonEmpty!45872) tp_is_empty!29365 (not b!1170000) (not b!1169999) (not b_lambda!19935) (not b!1169995) (not b!1169994) b_and!40523 (not b!1170006) (not start!99466) (not b!1170009) (not b!1169997) (not b!1170004))
(check-sat b_and!40523 (not b_next!24835))
(get-model)

(declare-fun b_lambda!19941 () Bool)

(assert (= b_lambda!19935 (or (and start!99466 b_free!24835) b_lambda!19941)))

(check-sat (not b!1169998) (not b_next!24835) (not b!1170008) (not mapNonEmpty!45872) tp_is_empty!29365 (not b!1170000) (not b!1169999) (not b_lambda!19941) (not b!1169995) (not b!1169994) b_and!40523 (not b!1170006) (not start!99466) (not b!1170009) (not b!1169997) (not b!1170004))
(check-sat b_and!40523 (not b_next!24835))
(get-model)

(declare-fun d!132365 () Bool)

(assert (=> d!132365 (= (array_inv!27932 _keys!1208) (bvsge (size!36982 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!99466 d!132365))

(declare-fun d!132367 () Bool)

(assert (=> d!132367 (= (array_inv!27933 _values!996) (bvsge (size!36983 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!99466 d!132367))

(declare-fun b!1170120 () Bool)

(declare-fun e!665110 () Bool)

(declare-fun call!57165 () Bool)

(assert (=> b!1170120 (= e!665110 call!57165)))

(declare-fun bm!57162 () Bool)

(assert (=> bm!57162 (= call!57165 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!526680 mask!1564))))

(declare-fun b!1170121 () Bool)

(declare-fun e!665108 () Bool)

(assert (=> b!1170121 (= e!665108 call!57165)))

(declare-fun b!1170122 () Bool)

(assert (=> b!1170122 (= e!665110 e!665108)))

(declare-fun lt!526748 () (_ BitVec 64))

(assert (=> b!1170122 (= lt!526748 (select (arr!36445 lt!526680) #b00000000000000000000000000000000))))

(declare-fun lt!526750 () Unit!38543)

(assert (=> b!1170122 (= lt!526750 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!526680 lt!526748 #b00000000000000000000000000000000))))

(assert (=> b!1170122 (arrayContainsKey!0 lt!526680 lt!526748 #b00000000000000000000000000000000)))

(declare-fun lt!526749 () Unit!38543)

(assert (=> b!1170122 (= lt!526749 lt!526750)))

(declare-fun res!776036 () Bool)

(declare-datatypes ((SeekEntryResult!9883 0))(
  ( (MissingZero!9883 (index!41903 (_ BitVec 32))) (Found!9883 (index!41904 (_ BitVec 32))) (Intermediate!9883 (undefined!10695 Bool) (index!41905 (_ BitVec 32)) (x!103597 (_ BitVec 32))) (Undefined!9883) (MissingVacant!9883 (index!41906 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!75601 (_ BitVec 32)) SeekEntryResult!9883)

(assert (=> b!1170122 (= res!776036 (= (seekEntryOrOpen!0 (select (arr!36445 lt!526680) #b00000000000000000000000000000000) lt!526680 mask!1564) (Found!9883 #b00000000000000000000000000000000)))))

(assert (=> b!1170122 (=> (not res!776036) (not e!665108))))

(declare-fun b!1170123 () Bool)

(declare-fun e!665109 () Bool)

(assert (=> b!1170123 (= e!665109 e!665110)))

(declare-fun c!116925 () Bool)

(assert (=> b!1170123 (= c!116925 (validKeyInArray!0 (select (arr!36445 lt!526680) #b00000000000000000000000000000000)))))

(declare-fun d!132369 () Bool)

(declare-fun res!776037 () Bool)

(assert (=> d!132369 (=> res!776037 e!665109)))

(assert (=> d!132369 (= res!776037 (bvsge #b00000000000000000000000000000000 (size!36982 lt!526680)))))

(assert (=> d!132369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526680 mask!1564) e!665109)))

(assert (= (and d!132369 (not res!776037)) b!1170123))

(assert (= (and b!1170123 c!116925) b!1170122))

(assert (= (and b!1170123 (not c!116925)) b!1170120))

(assert (= (and b!1170122 res!776036) b!1170121))

(assert (= (or b!1170121 b!1170120) bm!57162))

(declare-fun m!1078277 () Bool)

(assert (=> bm!57162 m!1078277))

(declare-fun m!1078279 () Bool)

(assert (=> b!1170122 m!1078279))

(declare-fun m!1078281 () Bool)

(assert (=> b!1170122 m!1078281))

(declare-fun m!1078283 () Bool)

(assert (=> b!1170122 m!1078283))

(assert (=> b!1170122 m!1078279))

(declare-fun m!1078285 () Bool)

(assert (=> b!1170122 m!1078285))

(assert (=> b!1170123 m!1078279))

(assert (=> b!1170123 m!1078279))

(declare-fun m!1078287 () Bool)

(assert (=> b!1170123 m!1078287))

(assert (=> b!1169995 d!132369))

(declare-fun d!132371 () Bool)

(declare-fun e!665113 () Bool)

(assert (=> d!132371 e!665113))

(declare-fun res!776043 () Bool)

(assert (=> d!132371 (=> (not res!776043) (not e!665113))))

(declare-fun lt!526762 () ListLongMap!16819)

(declare-fun contains!6868 (ListLongMap!16819 (_ BitVec 64)) Bool)

(assert (=> d!132371 (= res!776043 (contains!6868 lt!526762 (_1!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))))))

(declare-fun lt!526759 () List!25582)

(assert (=> d!132371 (= lt!526762 (ListLongMap!16820 lt!526759))))

(declare-fun lt!526760 () Unit!38543)

(declare-fun lt!526761 () Unit!38543)

(assert (=> d!132371 (= lt!526760 lt!526761)))

(declare-datatypes ((Option!677 0))(
  ( (Some!676 (v!17375 V!44281)) (None!675) )
))
(declare-fun getValueByKey!626 (List!25582 (_ BitVec 64)) Option!677)

(assert (=> d!132371 (= (getValueByKey!626 lt!526759 (_1!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))) (Some!676 (_2!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!308 (List!25582 (_ BitVec 64) V!44281) Unit!38543)

(assert (=> d!132371 (= lt!526761 (lemmaContainsTupThenGetReturnValue!308 lt!526759 (_1!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))) (_2!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))))))

(declare-fun insertStrictlySorted!401 (List!25582 (_ BitVec 64) V!44281) List!25582)

(assert (=> d!132371 (= lt!526759 (insertStrictlySorted!401 (toList!8425 lt!526675) (_1!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))) (_2!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))))))

(assert (=> d!132371 (= (+!3770 lt!526675 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))) lt!526762)))

(declare-fun b!1170128 () Bool)

(declare-fun res!776042 () Bool)

(assert (=> b!1170128 (=> (not res!776042) (not e!665113))))

(assert (=> b!1170128 (= res!776042 (= (getValueByKey!626 (toList!8425 lt!526762) (_1!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681)))) (Some!676 (_2!9432 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))))))))

(declare-fun b!1170129 () Bool)

(declare-fun contains!6869 (List!25582 tuple2!18842) Bool)

(assert (=> b!1170129 (= e!665113 (contains!6869 (toList!8425 lt!526762) (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681))))))

(assert (= (and d!132371 res!776043) b!1170128))

(assert (= (and b!1170128 res!776042) b!1170129))

(declare-fun m!1078289 () Bool)

(assert (=> d!132371 m!1078289))

(declare-fun m!1078291 () Bool)

(assert (=> d!132371 m!1078291))

(declare-fun m!1078293 () Bool)

(assert (=> d!132371 m!1078293))

(declare-fun m!1078295 () Bool)

(assert (=> d!132371 m!1078295))

(declare-fun m!1078297 () Bool)

(assert (=> b!1170128 m!1078297))

(declare-fun m!1078299 () Bool)

(assert (=> b!1170129 m!1078299))

(assert (=> b!1169994 d!132371))

(declare-fun d!132373 () Bool)

(declare-fun c!116928 () Bool)

(assert (=> d!132373 (= c!116928 ((_ is ValueCellFull!13973) (select (arr!36446 _values!996) from!1455)))))

(declare-fun e!665116 () V!44281)

(assert (=> d!132373 (= (get!18598 (select (arr!36446 _values!996) from!1455) lt!526681) e!665116)))

(declare-fun b!1170134 () Bool)

(declare-fun get!18600 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1170134 (= e!665116 (get!18600 (select (arr!36446 _values!996) from!1455) lt!526681))))

(declare-fun b!1170135 () Bool)

(declare-fun get!18601 (ValueCell!13973 V!44281) V!44281)

(assert (=> b!1170135 (= e!665116 (get!18601 (select (arr!36446 _values!996) from!1455) lt!526681))))

(assert (= (and d!132373 c!116928) b!1170134))

(assert (= (and d!132373 (not c!116928)) b!1170135))

(assert (=> b!1170134 m!1078167))

(declare-fun m!1078301 () Bool)

(assert (=> b!1170134 m!1078301))

(assert (=> b!1170135 m!1078167))

(declare-fun m!1078303 () Bool)

(assert (=> b!1170135 m!1078303))

(assert (=> b!1169994 d!132373))

(declare-fun b!1170146 () Bool)

(declare-fun e!665128 () Bool)

(declare-fun call!57168 () Bool)

(assert (=> b!1170146 (= e!665128 call!57168)))

(declare-fun b!1170147 () Bool)

(declare-fun e!665127 () Bool)

(declare-fun e!665126 () Bool)

(assert (=> b!1170147 (= e!665127 e!665126)))

(declare-fun res!776052 () Bool)

(assert (=> b!1170147 (=> (not res!776052) (not e!665126))))

(declare-fun e!665125 () Bool)

(assert (=> b!1170147 (= res!776052 (not e!665125))))

(declare-fun res!776051 () Bool)

(assert (=> b!1170147 (=> (not res!776051) (not e!665125))))

(assert (=> b!1170147 (= res!776051 (validKeyInArray!0 (select (arr!36445 lt!526680) #b00000000000000000000000000000000)))))

(declare-fun b!1170148 () Bool)

(assert (=> b!1170148 (= e!665128 call!57168)))

(declare-fun b!1170149 () Bool)

(declare-fun contains!6870 (List!25583 (_ BitVec 64)) Bool)

(assert (=> b!1170149 (= e!665125 (contains!6870 Nil!25580 (select (arr!36445 lt!526680) #b00000000000000000000000000000000)))))

(declare-fun b!1170150 () Bool)

(assert (=> b!1170150 (= e!665126 e!665128)))

(declare-fun c!116931 () Bool)

(assert (=> b!1170150 (= c!116931 (validKeyInArray!0 (select (arr!36445 lt!526680) #b00000000000000000000000000000000)))))

(declare-fun bm!57165 () Bool)

(assert (=> bm!57165 (= call!57168 (arrayNoDuplicates!0 lt!526680 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116931 (Cons!25579 (select (arr!36445 lt!526680) #b00000000000000000000000000000000) Nil!25580) Nil!25580)))))

(declare-fun d!132375 () Bool)

(declare-fun res!776050 () Bool)

(assert (=> d!132375 (=> res!776050 e!665127)))

(assert (=> d!132375 (= res!776050 (bvsge #b00000000000000000000000000000000 (size!36982 lt!526680)))))

(assert (=> d!132375 (= (arrayNoDuplicates!0 lt!526680 #b00000000000000000000000000000000 Nil!25580) e!665127)))

(assert (= (and d!132375 (not res!776050)) b!1170147))

(assert (= (and b!1170147 res!776051) b!1170149))

(assert (= (and b!1170147 res!776052) b!1170150))

(assert (= (and b!1170150 c!116931) b!1170146))

(assert (= (and b!1170150 (not c!116931)) b!1170148))

(assert (= (or b!1170146 b!1170148) bm!57165))

(assert (=> b!1170147 m!1078279))

(assert (=> b!1170147 m!1078279))

(assert (=> b!1170147 m!1078287))

(assert (=> b!1170149 m!1078279))

(assert (=> b!1170149 m!1078279))

(declare-fun m!1078305 () Bool)

(assert (=> b!1170149 m!1078305))

(assert (=> b!1170150 m!1078279))

(assert (=> b!1170150 m!1078279))

(assert (=> b!1170150 m!1078287))

(assert (=> bm!57165 m!1078279))

(declare-fun m!1078307 () Bool)

(assert (=> bm!57165 m!1078307))

(assert (=> b!1170004 d!132375))

(declare-fun b!1170151 () Bool)

(declare-fun e!665132 () Bool)

(declare-fun call!57169 () Bool)

(assert (=> b!1170151 (= e!665132 call!57169)))

(declare-fun b!1170152 () Bool)

(declare-fun e!665131 () Bool)

(declare-fun e!665130 () Bool)

(assert (=> b!1170152 (= e!665131 e!665130)))

(declare-fun res!776055 () Bool)

(assert (=> b!1170152 (=> (not res!776055) (not e!665130))))

(declare-fun e!665129 () Bool)

(assert (=> b!1170152 (= res!776055 (not e!665129))))

(declare-fun res!776054 () Bool)

(assert (=> b!1170152 (=> (not res!776054) (not e!665129))))

(assert (=> b!1170152 (= res!776054 (validKeyInArray!0 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1170153 () Bool)

(assert (=> b!1170153 (= e!665132 call!57169)))

(declare-fun b!1170154 () Bool)

(assert (=> b!1170154 (= e!665129 (contains!6870 Nil!25580 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1170155 () Bool)

(assert (=> b!1170155 (= e!665130 e!665132)))

(declare-fun c!116932 () Bool)

(assert (=> b!1170155 (= c!116932 (validKeyInArray!0 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57166 () Bool)

(assert (=> bm!57166 (= call!57169 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116932 (Cons!25579 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000) Nil!25580) Nil!25580)))))

(declare-fun d!132377 () Bool)

(declare-fun res!776053 () Bool)

(assert (=> d!132377 (=> res!776053 e!665131)))

(assert (=> d!132377 (= res!776053 (bvsge #b00000000000000000000000000000000 (size!36982 _keys!1208)))))

(assert (=> d!132377 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25580) e!665131)))

(assert (= (and d!132377 (not res!776053)) b!1170152))

(assert (= (and b!1170152 res!776054) b!1170154))

(assert (= (and b!1170152 res!776055) b!1170155))

(assert (= (and b!1170155 c!116932) b!1170151))

(assert (= (and b!1170155 (not c!116932)) b!1170153))

(assert (= (or b!1170151 b!1170153) bm!57166))

(declare-fun m!1078309 () Bool)

(assert (=> b!1170152 m!1078309))

(assert (=> b!1170152 m!1078309))

(declare-fun m!1078311 () Bool)

(assert (=> b!1170152 m!1078311))

(assert (=> b!1170154 m!1078309))

(assert (=> b!1170154 m!1078309))

(declare-fun m!1078313 () Bool)

(assert (=> b!1170154 m!1078313))

(assert (=> b!1170155 m!1078309))

(assert (=> b!1170155 m!1078309))

(assert (=> b!1170155 m!1078311))

(assert (=> bm!57166 m!1078309))

(declare-fun m!1078315 () Bool)

(assert (=> bm!57166 m!1078315))

(assert (=> b!1169999 d!132377))

(declare-fun b!1170156 () Bool)

(declare-fun e!665135 () Bool)

(declare-fun call!57170 () Bool)

(assert (=> b!1170156 (= e!665135 call!57170)))

(declare-fun bm!57167 () Bool)

(assert (=> bm!57167 (= call!57170 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1170157 () Bool)

(declare-fun e!665133 () Bool)

(assert (=> b!1170157 (= e!665133 call!57170)))

(declare-fun b!1170158 () Bool)

(assert (=> b!1170158 (= e!665135 e!665133)))

(declare-fun lt!526763 () (_ BitVec 64))

(assert (=> b!1170158 (= lt!526763 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!526765 () Unit!38543)

(assert (=> b!1170158 (= lt!526765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!526763 #b00000000000000000000000000000000))))

(assert (=> b!1170158 (arrayContainsKey!0 _keys!1208 lt!526763 #b00000000000000000000000000000000)))

(declare-fun lt!526764 () Unit!38543)

(assert (=> b!1170158 (= lt!526764 lt!526765)))

(declare-fun res!776056 () Bool)

(assert (=> b!1170158 (= res!776056 (= (seekEntryOrOpen!0 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9883 #b00000000000000000000000000000000)))))

(assert (=> b!1170158 (=> (not res!776056) (not e!665133))))

(declare-fun b!1170159 () Bool)

(declare-fun e!665134 () Bool)

(assert (=> b!1170159 (= e!665134 e!665135)))

(declare-fun c!116933 () Bool)

(assert (=> b!1170159 (= c!116933 (validKeyInArray!0 (select (arr!36445 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132379 () Bool)

(declare-fun res!776057 () Bool)

(assert (=> d!132379 (=> res!776057 e!665134)))

(assert (=> d!132379 (= res!776057 (bvsge #b00000000000000000000000000000000 (size!36982 _keys!1208)))))

(assert (=> d!132379 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!665134)))

(assert (= (and d!132379 (not res!776057)) b!1170159))

(assert (= (and b!1170159 c!116933) b!1170158))

(assert (= (and b!1170159 (not c!116933)) b!1170156))

(assert (= (and b!1170158 res!776056) b!1170157))

(assert (= (or b!1170157 b!1170156) bm!57167))

(declare-fun m!1078317 () Bool)

(assert (=> bm!57167 m!1078317))

(assert (=> b!1170158 m!1078309))

(declare-fun m!1078319 () Bool)

(assert (=> b!1170158 m!1078319))

(declare-fun m!1078321 () Bool)

(assert (=> b!1170158 m!1078321))

(assert (=> b!1170158 m!1078309))

(declare-fun m!1078323 () Bool)

(assert (=> b!1170158 m!1078323))

(assert (=> b!1170159 m!1078309))

(assert (=> b!1170159 m!1078309))

(assert (=> b!1170159 m!1078311))

(assert (=> b!1169998 d!132379))

(declare-fun b!1170184 () Bool)

(declare-fun e!665156 () ListLongMap!16819)

(assert (=> b!1170184 (= e!665156 (ListLongMap!16820 Nil!25579))))

(declare-fun b!1170185 () Bool)

(declare-fun lt!526786 () Unit!38543)

(declare-fun lt!526782 () Unit!38543)

(assert (=> b!1170185 (= lt!526786 lt!526782)))

(declare-fun lt!526780 () (_ BitVec 64))

(declare-fun lt!526784 () V!44281)

(declare-fun lt!526781 () (_ BitVec 64))

(declare-fun lt!526785 () ListLongMap!16819)

(assert (=> b!1170185 (not (contains!6868 (+!3770 lt!526785 (tuple2!18843 lt!526781 lt!526784)) lt!526780))))

(declare-fun addStillNotContains!287 (ListLongMap!16819 (_ BitVec 64) V!44281 (_ BitVec 64)) Unit!38543)

(assert (=> b!1170185 (= lt!526782 (addStillNotContains!287 lt!526785 lt!526781 lt!526784 lt!526780))))

(assert (=> b!1170185 (= lt!526780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1170185 (= lt!526784 (get!18598 (select (arr!36446 lt!526673) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1170185 (= lt!526781 (select (arr!36445 lt!526680) from!1455))))

(declare-fun call!57173 () ListLongMap!16819)

(assert (=> b!1170185 (= lt!526785 call!57173)))

(declare-fun e!665150 () ListLongMap!16819)

(assert (=> b!1170185 (= e!665150 (+!3770 call!57173 (tuple2!18843 (select (arr!36445 lt!526680) from!1455) (get!18598 (select (arr!36446 lt!526673) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1170186 () Bool)

(declare-fun e!665155 () Bool)

(declare-fun lt!526783 () ListLongMap!16819)

(declare-fun isEmpty!981 (ListLongMap!16819) Bool)

(assert (=> b!1170186 (= e!665155 (isEmpty!981 lt!526783))))

(declare-fun b!1170187 () Bool)

(declare-fun e!665151 () Bool)

(assert (=> b!1170187 (= e!665151 (validKeyInArray!0 (select (arr!36445 lt!526680) from!1455)))))

(assert (=> b!1170187 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1170188 () Bool)

(assert (=> b!1170188 (= e!665156 e!665150)))

(declare-fun c!116944 () Bool)

(assert (=> b!1170188 (= c!116944 (validKeyInArray!0 (select (arr!36445 lt!526680) from!1455)))))

(declare-fun b!1170189 () Bool)

(declare-fun e!665154 () Bool)

(declare-fun e!665153 () Bool)

(assert (=> b!1170189 (= e!665154 e!665153)))

(assert (=> b!1170189 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36982 lt!526680)))))

(declare-fun res!776067 () Bool)

(assert (=> b!1170189 (= res!776067 (contains!6868 lt!526783 (select (arr!36445 lt!526680) from!1455)))))

(assert (=> b!1170189 (=> (not res!776067) (not e!665153))))

(declare-fun b!1170190 () Bool)

(assert (=> b!1170190 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36982 lt!526680)))))

(assert (=> b!1170190 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36983 lt!526673)))))

(declare-fun apply!966 (ListLongMap!16819 (_ BitVec 64)) V!44281)

(assert (=> b!1170190 (= e!665153 (= (apply!966 lt!526783 (select (arr!36445 lt!526680) from!1455)) (get!18598 (select (arr!36446 lt!526673) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132381 () Bool)

(declare-fun e!665152 () Bool)

(assert (=> d!132381 e!665152))

(declare-fun res!776066 () Bool)

(assert (=> d!132381 (=> (not res!776066) (not e!665152))))

(assert (=> d!132381 (= res!776066 (not (contains!6868 lt!526783 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132381 (= lt!526783 e!665156)))

(declare-fun c!116943 () Bool)

(assert (=> d!132381 (= c!116943 (bvsge from!1455 (size!36982 lt!526680)))))

(assert (=> d!132381 (validMask!0 mask!1564)))

(assert (=> d!132381 (= (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526783)))

(declare-fun b!1170191 () Bool)

(assert (=> b!1170191 (= e!665154 e!665155)))

(declare-fun c!116945 () Bool)

(assert (=> b!1170191 (= c!116945 (bvslt from!1455 (size!36982 lt!526680)))))

(declare-fun b!1170192 () Bool)

(declare-fun res!776068 () Bool)

(assert (=> b!1170192 (=> (not res!776068) (not e!665152))))

(assert (=> b!1170192 (= res!776068 (not (contains!6868 lt!526783 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1170193 () Bool)

(assert (=> b!1170193 (= e!665150 call!57173)))

(declare-fun b!1170194 () Bool)

(assert (=> b!1170194 (= e!665155 (= lt!526783 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57170 () Bool)

(assert (=> bm!57170 (= call!57173 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1170195 () Bool)

(assert (=> b!1170195 (= e!665152 e!665154)))

(declare-fun c!116942 () Bool)

(assert (=> b!1170195 (= c!116942 e!665151)))

(declare-fun res!776069 () Bool)

(assert (=> b!1170195 (=> (not res!776069) (not e!665151))))

(assert (=> b!1170195 (= res!776069 (bvslt from!1455 (size!36982 lt!526680)))))

(assert (= (and d!132381 c!116943) b!1170184))

(assert (= (and d!132381 (not c!116943)) b!1170188))

(assert (= (and b!1170188 c!116944) b!1170185))

(assert (= (and b!1170188 (not c!116944)) b!1170193))

(assert (= (or b!1170185 b!1170193) bm!57170))

(assert (= (and d!132381 res!776066) b!1170192))

(assert (= (and b!1170192 res!776068) b!1170195))

(assert (= (and b!1170195 res!776069) b!1170187))

(assert (= (and b!1170195 c!116942) b!1170189))

(assert (= (and b!1170195 (not c!116942)) b!1170191))

(assert (= (and b!1170189 res!776067) b!1170190))

(assert (= (and b!1170191 c!116945) b!1170194))

(assert (= (and b!1170191 (not c!116945)) b!1170186))

(declare-fun b_lambda!19943 () Bool)

(assert (=> (not b_lambda!19943) (not b!1170185)))

(assert (=> b!1170185 t!37400))

(declare-fun b_and!40533 () Bool)

(assert (= b_and!40523 (and (=> t!37400 result!19851) b_and!40533)))

(declare-fun b_lambda!19945 () Bool)

(assert (=> (not b_lambda!19945) (not b!1170190)))

(assert (=> b!1170190 t!37400))

(declare-fun b_and!40535 () Bool)

(assert (= b_and!40533 (and (=> t!37400 result!19851) b_and!40535)))

(declare-fun m!1078325 () Bool)

(assert (=> b!1170185 m!1078325))

(declare-fun m!1078327 () Bool)

(assert (=> b!1170185 m!1078327))

(declare-fun m!1078329 () Bool)

(assert (=> b!1170185 m!1078329))

(declare-fun m!1078331 () Bool)

(assert (=> b!1170185 m!1078331))

(declare-fun m!1078333 () Bool)

(assert (=> b!1170185 m!1078333))

(assert (=> b!1170185 m!1078153))

(declare-fun m!1078335 () Bool)

(assert (=> b!1170185 m!1078335))

(assert (=> b!1170185 m!1078327))

(assert (=> b!1170185 m!1078153))

(declare-fun m!1078337 () Bool)

(assert (=> b!1170185 m!1078337))

(assert (=> b!1170185 m!1078329))

(declare-fun m!1078339 () Bool)

(assert (=> b!1170192 m!1078339))

(assert (=> b!1170190 m!1078327))

(assert (=> b!1170190 m!1078333))

(assert (=> b!1170190 m!1078327))

(assert (=> b!1170190 m!1078153))

(assert (=> b!1170190 m!1078337))

(assert (=> b!1170190 m!1078153))

(assert (=> b!1170190 m!1078333))

(declare-fun m!1078341 () Bool)

(assert (=> b!1170190 m!1078341))

(declare-fun m!1078343 () Bool)

(assert (=> b!1170194 m!1078343))

(declare-fun m!1078345 () Bool)

(assert (=> d!132381 m!1078345))

(assert (=> d!132381 m!1078139))

(assert (=> bm!57170 m!1078343))

(declare-fun m!1078347 () Bool)

(assert (=> b!1170186 m!1078347))

(assert (=> b!1170187 m!1078333))

(assert (=> b!1170187 m!1078333))

(declare-fun m!1078349 () Bool)

(assert (=> b!1170187 m!1078349))

(assert (=> b!1170189 m!1078333))

(assert (=> b!1170189 m!1078333))

(declare-fun m!1078351 () Bool)

(assert (=> b!1170189 m!1078351))

(assert (=> b!1170188 m!1078333))

(assert (=> b!1170188 m!1078333))

(assert (=> b!1170188 m!1078349))

(assert (=> b!1170000 d!132381))

(declare-fun b!1170196 () Bool)

(declare-fun e!665163 () ListLongMap!16819)

(assert (=> b!1170196 (= e!665163 (ListLongMap!16820 Nil!25579))))

(declare-fun b!1170197 () Bool)

(declare-fun lt!526793 () Unit!38543)

(declare-fun lt!526789 () Unit!38543)

(assert (=> b!1170197 (= lt!526793 lt!526789)))

(declare-fun lt!526787 () (_ BitVec 64))

(declare-fun lt!526788 () (_ BitVec 64))

(declare-fun lt!526791 () V!44281)

(declare-fun lt!526792 () ListLongMap!16819)

(assert (=> b!1170197 (not (contains!6868 (+!3770 lt!526792 (tuple2!18843 lt!526788 lt!526791)) lt!526787))))

(assert (=> b!1170197 (= lt!526789 (addStillNotContains!287 lt!526792 lt!526788 lt!526791 lt!526787))))

(assert (=> b!1170197 (= lt!526787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1170197 (= lt!526791 (get!18598 (select (arr!36446 _values!996) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1170197 (= lt!526788 (select (arr!36445 _keys!1208) from!1455))))

(declare-fun call!57174 () ListLongMap!16819)

(assert (=> b!1170197 (= lt!526792 call!57174)))

(declare-fun e!665157 () ListLongMap!16819)

(assert (=> b!1170197 (= e!665157 (+!3770 call!57174 (tuple2!18843 (select (arr!36445 _keys!1208) from!1455) (get!18598 (select (arr!36446 _values!996) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1170198 () Bool)

(declare-fun e!665162 () Bool)

(declare-fun lt!526790 () ListLongMap!16819)

(assert (=> b!1170198 (= e!665162 (isEmpty!981 lt!526790))))

(declare-fun b!1170199 () Bool)

(declare-fun e!665158 () Bool)

(assert (=> b!1170199 (= e!665158 (validKeyInArray!0 (select (arr!36445 _keys!1208) from!1455)))))

(assert (=> b!1170199 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1170200 () Bool)

(assert (=> b!1170200 (= e!665163 e!665157)))

(declare-fun c!116948 () Bool)

(assert (=> b!1170200 (= c!116948 (validKeyInArray!0 (select (arr!36445 _keys!1208) from!1455)))))

(declare-fun b!1170201 () Bool)

(declare-fun e!665161 () Bool)

(declare-fun e!665160 () Bool)

(assert (=> b!1170201 (= e!665161 e!665160)))

(assert (=> b!1170201 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36982 _keys!1208)))))

(declare-fun res!776071 () Bool)

(assert (=> b!1170201 (= res!776071 (contains!6868 lt!526790 (select (arr!36445 _keys!1208) from!1455)))))

(assert (=> b!1170201 (=> (not res!776071) (not e!665160))))

(declare-fun b!1170202 () Bool)

(assert (=> b!1170202 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36982 _keys!1208)))))

(assert (=> b!1170202 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36983 _values!996)))))

(assert (=> b!1170202 (= e!665160 (= (apply!966 lt!526790 (select (arr!36445 _keys!1208) from!1455)) (get!18598 (select (arr!36446 _values!996) from!1455) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132383 () Bool)

(declare-fun e!665159 () Bool)

(assert (=> d!132383 e!665159))

(declare-fun res!776070 () Bool)

(assert (=> d!132383 (=> (not res!776070) (not e!665159))))

(assert (=> d!132383 (= res!776070 (not (contains!6868 lt!526790 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132383 (= lt!526790 e!665163)))

(declare-fun c!116947 () Bool)

(assert (=> d!132383 (= c!116947 (bvsge from!1455 (size!36982 _keys!1208)))))

(assert (=> d!132383 (validMask!0 mask!1564)))

(assert (=> d!132383 (= (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526790)))

(declare-fun b!1170203 () Bool)

(assert (=> b!1170203 (= e!665161 e!665162)))

(declare-fun c!116949 () Bool)

(assert (=> b!1170203 (= c!116949 (bvslt from!1455 (size!36982 _keys!1208)))))

(declare-fun b!1170204 () Bool)

(declare-fun res!776072 () Bool)

(assert (=> b!1170204 (=> (not res!776072) (not e!665159))))

(assert (=> b!1170204 (= res!776072 (not (contains!6868 lt!526790 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1170205 () Bool)

(assert (=> b!1170205 (= e!665157 call!57174)))

(declare-fun b!1170206 () Bool)

(assert (=> b!1170206 (= e!665162 (= lt!526790 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57171 () Bool)

(assert (=> bm!57171 (= call!57174 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1170207 () Bool)

(assert (=> b!1170207 (= e!665159 e!665161)))

(declare-fun c!116946 () Bool)

(assert (=> b!1170207 (= c!116946 e!665158)))

(declare-fun res!776073 () Bool)

(assert (=> b!1170207 (=> (not res!776073) (not e!665158))))

(assert (=> b!1170207 (= res!776073 (bvslt from!1455 (size!36982 _keys!1208)))))

(assert (= (and d!132383 c!116947) b!1170196))

(assert (= (and d!132383 (not c!116947)) b!1170200))

(assert (= (and b!1170200 c!116948) b!1170197))

(assert (= (and b!1170200 (not c!116948)) b!1170205))

(assert (= (or b!1170197 b!1170205) bm!57171))

(assert (= (and d!132383 res!776070) b!1170204))

(assert (= (and b!1170204 res!776072) b!1170207))

(assert (= (and b!1170207 res!776073) b!1170199))

(assert (= (and b!1170207 c!116946) b!1170201))

(assert (= (and b!1170207 (not c!116946)) b!1170203))

(assert (= (and b!1170201 res!776071) b!1170202))

(assert (= (and b!1170203 c!116949) b!1170206))

(assert (= (and b!1170203 (not c!116949)) b!1170198))

(declare-fun b_lambda!19947 () Bool)

(assert (=> (not b_lambda!19947) (not b!1170197)))

(assert (=> b!1170197 t!37400))

(declare-fun b_and!40537 () Bool)

(assert (= b_and!40535 (and (=> t!37400 result!19851) b_and!40537)))

(declare-fun b_lambda!19949 () Bool)

(assert (=> (not b_lambda!19949) (not b!1170202)))

(assert (=> b!1170202 t!37400))

(declare-fun b_and!40539 () Bool)

(assert (= b_and!40537 (and (=> t!37400 result!19851) b_and!40539)))

(declare-fun m!1078353 () Bool)

(assert (=> b!1170197 m!1078353))

(assert (=> b!1170197 m!1078167))

(declare-fun m!1078355 () Bool)

(assert (=> b!1170197 m!1078355))

(declare-fun m!1078357 () Bool)

(assert (=> b!1170197 m!1078357))

(assert (=> b!1170197 m!1078133))

(assert (=> b!1170197 m!1078153))

(declare-fun m!1078359 () Bool)

(assert (=> b!1170197 m!1078359))

(assert (=> b!1170197 m!1078167))

(assert (=> b!1170197 m!1078153))

(declare-fun m!1078361 () Bool)

(assert (=> b!1170197 m!1078361))

(assert (=> b!1170197 m!1078355))

(declare-fun m!1078363 () Bool)

(assert (=> b!1170204 m!1078363))

(assert (=> b!1170202 m!1078167))

(assert (=> b!1170202 m!1078133))

(assert (=> b!1170202 m!1078167))

(assert (=> b!1170202 m!1078153))

(assert (=> b!1170202 m!1078361))

(assert (=> b!1170202 m!1078153))

(assert (=> b!1170202 m!1078133))

(declare-fun m!1078365 () Bool)

(assert (=> b!1170202 m!1078365))

(declare-fun m!1078367 () Bool)

(assert (=> b!1170206 m!1078367))

(declare-fun m!1078369 () Bool)

(assert (=> d!132383 m!1078369))

(assert (=> d!132383 m!1078139))

(assert (=> bm!57171 m!1078367))

(declare-fun m!1078371 () Bool)

(assert (=> b!1170198 m!1078371))

(assert (=> b!1170199 m!1078133))

(assert (=> b!1170199 m!1078133))

(assert (=> b!1170199 m!1078135))

(assert (=> b!1170201 m!1078133))

(assert (=> b!1170201 m!1078133))

(declare-fun m!1078373 () Bool)

(assert (=> b!1170201 m!1078373))

(assert (=> b!1170200 m!1078133))

(assert (=> b!1170200 m!1078133))

(assert (=> b!1170200 m!1078135))

(assert (=> b!1170000 d!132383))

(declare-fun d!132385 () Bool)

(declare-fun res!776078 () Bool)

(declare-fun e!665168 () Bool)

(assert (=> d!132385 (=> res!776078 e!665168)))

(assert (=> d!132385 (= res!776078 (= (select (arr!36445 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132385 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!665168)))

(declare-fun b!1170212 () Bool)

(declare-fun e!665169 () Bool)

(assert (=> b!1170212 (= e!665168 e!665169)))

(declare-fun res!776079 () Bool)

(assert (=> b!1170212 (=> (not res!776079) (not e!665169))))

(assert (=> b!1170212 (= res!776079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36982 _keys!1208)))))

(declare-fun b!1170213 () Bool)

(assert (=> b!1170213 (= e!665169 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132385 (not res!776078)) b!1170212))

(assert (= (and b!1170212 res!776079) b!1170213))

(assert (=> d!132385 m!1078309))

(declare-fun m!1078375 () Bool)

(assert (=> b!1170213 m!1078375))

(assert (=> b!1170009 d!132385))

(declare-fun d!132387 () Bool)

(assert (=> d!132387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526796 () Unit!38543)

(declare-fun choose!13 (array!75601 (_ BitVec 64) (_ BitVec 32)) Unit!38543)

(assert (=> d!132387 (= lt!526796 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132387 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132387 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!526796)))

(declare-fun bs!33452 () Bool)

(assert (= bs!33452 d!132387))

(assert (=> bs!33452 m!1078161))

(declare-fun m!1078377 () Bool)

(assert (=> bs!33452 m!1078377))

(assert (=> b!1170009 d!132387))

(declare-fun d!132389 () Bool)

(assert (=> d!132389 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1170008 d!132389))

(declare-fun d!132391 () Bool)

(assert (=> d!132391 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1170006 d!132391))

(declare-fun d!132393 () Bool)

(assert (=> d!132393 (= (validKeyInArray!0 (select (arr!36445 _keys!1208) from!1455)) (and (not (= (select (arr!36445 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!36445 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1169997 d!132393))

(declare-fun d!132395 () Bool)

(declare-fun lt!526799 () ListLongMap!16819)

(assert (=> d!132395 (not (contains!6868 lt!526799 k0!934))))

(declare-fun removeStrictlySorted!90 (List!25582 (_ BitVec 64)) List!25582)

(assert (=> d!132395 (= lt!526799 (ListLongMap!16820 (removeStrictlySorted!90 (toList!8425 lt!526674) k0!934)))))

(assert (=> d!132395 (= (-!1485 lt!526674 k0!934) lt!526799)))

(declare-fun bs!33453 () Bool)

(assert (= bs!33453 d!132395))

(declare-fun m!1078379 () Bool)

(assert (=> bs!33453 m!1078379))

(declare-fun m!1078381 () Bool)

(assert (=> bs!33453 m!1078381))

(assert (=> b!1169997 d!132395))

(declare-fun call!57180 () ListLongMap!16819)

(declare-fun bm!57176 () Bool)

(assert (=> bm!57176 (= call!57180 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57179 () ListLongMap!16819)

(declare-fun bm!57177 () Bool)

(assert (=> bm!57177 (= call!57179 (getCurrentListMapNoExtraKeys!4916 (array!75602 (store (arr!36445 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36982 _keys!1208)) (array!75604 (store (arr!36446 _values!996) i!673 (ValueCellFull!13973 (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36983 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132397 () Bool)

(declare-fun e!665175 () Bool)

(assert (=> d!132397 e!665175))

(declare-fun res!776082 () Bool)

(assert (=> d!132397 (=> (not res!776082) (not e!665175))))

(assert (=> d!132397 (= res!776082 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36982 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36982 _keys!1208))))))))

(declare-fun lt!526802 () Unit!38543)

(declare-fun choose!1788 (array!75601 array!75603 (_ BitVec 32) (_ BitVec 32) V!44281 V!44281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38543)

(assert (=> d!132397 (= lt!526802 (choose!1788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(assert (=> d!132397 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526802)))

(declare-fun b!1170220 () Bool)

(declare-fun e!665174 () Bool)

(assert (=> b!1170220 (= e!665174 (= call!57179 (-!1485 call!57180 k0!934)))))

(assert (=> b!1170220 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36983 _values!996)))))

(declare-fun b!1170221 () Bool)

(assert (=> b!1170221 (= e!665174 (= call!57179 call!57180))))

(assert (=> b!1170221 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36983 _values!996)))))

(declare-fun b!1170222 () Bool)

(assert (=> b!1170222 (= e!665175 e!665174)))

(declare-fun c!116952 () Bool)

(assert (=> b!1170222 (= c!116952 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!132397 res!776082) b!1170222))

(assert (= (and b!1170222 c!116952) b!1170220))

(assert (= (and b!1170222 (not c!116952)) b!1170221))

(assert (= (or b!1170220 b!1170221) bm!57176))

(assert (= (or b!1170220 b!1170221) bm!57177))

(declare-fun b_lambda!19951 () Bool)

(assert (=> (not b_lambda!19951) (not bm!57177)))

(assert (=> bm!57177 t!37400))

(declare-fun b_and!40541 () Bool)

(assert (= b_and!40539 (and (=> t!37400 result!19851) b_and!40541)))

(assert (=> bm!57176 m!1078127))

(assert (=> bm!57177 m!1078159))

(assert (=> bm!57177 m!1078153))

(declare-fun m!1078383 () Bool)

(assert (=> bm!57177 m!1078383))

(declare-fun m!1078385 () Bool)

(assert (=> bm!57177 m!1078385))

(declare-fun m!1078387 () Bool)

(assert (=> d!132397 m!1078387))

(declare-fun m!1078389 () Bool)

(assert (=> b!1170220 m!1078389))

(assert (=> b!1169997 d!132397))

(declare-fun b!1170223 () Bool)

(declare-fun e!665182 () ListLongMap!16819)

(assert (=> b!1170223 (= e!665182 (ListLongMap!16820 Nil!25579))))

(declare-fun b!1170224 () Bool)

(declare-fun lt!526809 () Unit!38543)

(declare-fun lt!526805 () Unit!38543)

(assert (=> b!1170224 (= lt!526809 lt!526805)))

(declare-fun lt!526804 () (_ BitVec 64))

(declare-fun lt!526807 () V!44281)

(declare-fun lt!526808 () ListLongMap!16819)

(declare-fun lt!526803 () (_ BitVec 64))

(assert (=> b!1170224 (not (contains!6868 (+!3770 lt!526808 (tuple2!18843 lt!526804 lt!526807)) lt!526803))))

(assert (=> b!1170224 (= lt!526805 (addStillNotContains!287 lt!526808 lt!526804 lt!526807 lt!526803))))

(assert (=> b!1170224 (= lt!526803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1170224 (= lt!526807 (get!18598 (select (arr!36446 lt!526673) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1170224 (= lt!526804 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!57181 () ListLongMap!16819)

(assert (=> b!1170224 (= lt!526808 call!57181)))

(declare-fun e!665176 () ListLongMap!16819)

(assert (=> b!1170224 (= e!665176 (+!3770 call!57181 (tuple2!18843 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18598 (select (arr!36446 lt!526673) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1170225 () Bool)

(declare-fun e!665181 () Bool)

(declare-fun lt!526806 () ListLongMap!16819)

(assert (=> b!1170225 (= e!665181 (isEmpty!981 lt!526806))))

(declare-fun b!1170226 () Bool)

(declare-fun e!665177 () Bool)

(assert (=> b!1170226 (= e!665177 (validKeyInArray!0 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1170226 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1170227 () Bool)

(assert (=> b!1170227 (= e!665182 e!665176)))

(declare-fun c!116955 () Bool)

(assert (=> b!1170227 (= c!116955 (validKeyInArray!0 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1170228 () Bool)

(declare-fun e!665180 () Bool)

(declare-fun e!665179 () Bool)

(assert (=> b!1170228 (= e!665180 e!665179)))

(assert (=> b!1170228 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 lt!526680)))))

(declare-fun res!776084 () Bool)

(assert (=> b!1170228 (= res!776084 (contains!6868 lt!526806 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1170228 (=> (not res!776084) (not e!665179))))

(declare-fun b!1170229 () Bool)

(assert (=> b!1170229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 lt!526680)))))

(assert (=> b!1170229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36983 lt!526673)))))

(assert (=> b!1170229 (= e!665179 (= (apply!966 lt!526806 (select (arr!36445 lt!526680) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18598 (select (arr!36446 lt!526673) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132399 () Bool)

(declare-fun e!665178 () Bool)

(assert (=> d!132399 e!665178))

(declare-fun res!776083 () Bool)

(assert (=> d!132399 (=> (not res!776083) (not e!665178))))

(assert (=> d!132399 (= res!776083 (not (contains!6868 lt!526806 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132399 (= lt!526806 e!665182)))

(declare-fun c!116954 () Bool)

(assert (=> d!132399 (= c!116954 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 lt!526680)))))

(assert (=> d!132399 (validMask!0 mask!1564)))

(assert (=> d!132399 (= (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526806)))

(declare-fun b!1170230 () Bool)

(assert (=> b!1170230 (= e!665180 e!665181)))

(declare-fun c!116956 () Bool)

(assert (=> b!1170230 (= c!116956 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 lt!526680)))))

(declare-fun b!1170231 () Bool)

(declare-fun res!776085 () Bool)

(assert (=> b!1170231 (=> (not res!776085) (not e!665178))))

(assert (=> b!1170231 (= res!776085 (not (contains!6868 lt!526806 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1170232 () Bool)

(assert (=> b!1170232 (= e!665176 call!57181)))

(declare-fun b!1170233 () Bool)

(assert (=> b!1170233 (= e!665181 (= lt!526806 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57178 () Bool)

(assert (=> bm!57178 (= call!57181 (getCurrentListMapNoExtraKeys!4916 lt!526680 lt!526673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1170234 () Bool)

(assert (=> b!1170234 (= e!665178 e!665180)))

(declare-fun c!116953 () Bool)

(assert (=> b!1170234 (= c!116953 e!665177)))

(declare-fun res!776086 () Bool)

(assert (=> b!1170234 (=> (not res!776086) (not e!665177))))

(assert (=> b!1170234 (= res!776086 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 lt!526680)))))

(assert (= (and d!132399 c!116954) b!1170223))

(assert (= (and d!132399 (not c!116954)) b!1170227))

(assert (= (and b!1170227 c!116955) b!1170224))

(assert (= (and b!1170227 (not c!116955)) b!1170232))

(assert (= (or b!1170224 b!1170232) bm!57178))

(assert (= (and d!132399 res!776083) b!1170231))

(assert (= (and b!1170231 res!776085) b!1170234))

(assert (= (and b!1170234 res!776086) b!1170226))

(assert (= (and b!1170234 c!116953) b!1170228))

(assert (= (and b!1170234 (not c!116953)) b!1170230))

(assert (= (and b!1170228 res!776084) b!1170229))

(assert (= (and b!1170230 c!116956) b!1170233))

(assert (= (and b!1170230 (not c!116956)) b!1170225))

(declare-fun b_lambda!19953 () Bool)

(assert (=> (not b_lambda!19953) (not b!1170224)))

(assert (=> b!1170224 t!37400))

(declare-fun b_and!40543 () Bool)

(assert (= b_and!40541 (and (=> t!37400 result!19851) b_and!40543)))

(declare-fun b_lambda!19955 () Bool)

(assert (=> (not b_lambda!19955) (not b!1170229)))

(assert (=> b!1170229 t!37400))

(declare-fun b_and!40545 () Bool)

(assert (= b_and!40543 (and (=> t!37400 result!19851) b_and!40545)))

(declare-fun m!1078391 () Bool)

(assert (=> b!1170224 m!1078391))

(declare-fun m!1078393 () Bool)

(assert (=> b!1170224 m!1078393))

(declare-fun m!1078395 () Bool)

(assert (=> b!1170224 m!1078395))

(declare-fun m!1078397 () Bool)

(assert (=> b!1170224 m!1078397))

(declare-fun m!1078399 () Bool)

(assert (=> b!1170224 m!1078399))

(assert (=> b!1170224 m!1078153))

(declare-fun m!1078401 () Bool)

(assert (=> b!1170224 m!1078401))

(assert (=> b!1170224 m!1078393))

(assert (=> b!1170224 m!1078153))

(declare-fun m!1078403 () Bool)

(assert (=> b!1170224 m!1078403))

(assert (=> b!1170224 m!1078395))

(declare-fun m!1078405 () Bool)

(assert (=> b!1170231 m!1078405))

(assert (=> b!1170229 m!1078393))

(assert (=> b!1170229 m!1078399))

(assert (=> b!1170229 m!1078393))

(assert (=> b!1170229 m!1078153))

(assert (=> b!1170229 m!1078403))

(assert (=> b!1170229 m!1078153))

(assert (=> b!1170229 m!1078399))

(declare-fun m!1078407 () Bool)

(assert (=> b!1170229 m!1078407))

(declare-fun m!1078409 () Bool)

(assert (=> b!1170233 m!1078409))

(declare-fun m!1078411 () Bool)

(assert (=> d!132399 m!1078411))

(assert (=> d!132399 m!1078139))

(assert (=> bm!57178 m!1078409))

(declare-fun m!1078413 () Bool)

(assert (=> b!1170225 m!1078413))

(assert (=> b!1170226 m!1078399))

(assert (=> b!1170226 m!1078399))

(declare-fun m!1078415 () Bool)

(assert (=> b!1170226 m!1078415))

(assert (=> b!1170228 m!1078399))

(assert (=> b!1170228 m!1078399))

(declare-fun m!1078417 () Bool)

(assert (=> b!1170228 m!1078417))

(assert (=> b!1170227 m!1078399))

(assert (=> b!1170227 m!1078399))

(assert (=> b!1170227 m!1078415))

(assert (=> b!1169997 d!132399))

(declare-fun b!1170235 () Bool)

(declare-fun e!665189 () ListLongMap!16819)

(assert (=> b!1170235 (= e!665189 (ListLongMap!16820 Nil!25579))))

(declare-fun b!1170236 () Bool)

(declare-fun lt!526816 () Unit!38543)

(declare-fun lt!526812 () Unit!38543)

(assert (=> b!1170236 (= lt!526816 lt!526812)))

(declare-fun lt!526814 () V!44281)

(declare-fun lt!526815 () ListLongMap!16819)

(declare-fun lt!526811 () (_ BitVec 64))

(declare-fun lt!526810 () (_ BitVec 64))

(assert (=> b!1170236 (not (contains!6868 (+!3770 lt!526815 (tuple2!18843 lt!526811 lt!526814)) lt!526810))))

(assert (=> b!1170236 (= lt!526812 (addStillNotContains!287 lt!526815 lt!526811 lt!526814 lt!526810))))

(assert (=> b!1170236 (= lt!526810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1170236 (= lt!526814 (get!18598 (select (arr!36446 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1170236 (= lt!526811 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!57182 () ListLongMap!16819)

(assert (=> b!1170236 (= lt!526815 call!57182)))

(declare-fun e!665183 () ListLongMap!16819)

(assert (=> b!1170236 (= e!665183 (+!3770 call!57182 (tuple2!18843 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18598 (select (arr!36446 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1170237 () Bool)

(declare-fun e!665188 () Bool)

(declare-fun lt!526813 () ListLongMap!16819)

(assert (=> b!1170237 (= e!665188 (isEmpty!981 lt!526813))))

(declare-fun b!1170238 () Bool)

(declare-fun e!665184 () Bool)

(assert (=> b!1170238 (= e!665184 (validKeyInArray!0 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1170238 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1170239 () Bool)

(assert (=> b!1170239 (= e!665189 e!665183)))

(declare-fun c!116959 () Bool)

(assert (=> b!1170239 (= c!116959 (validKeyInArray!0 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1170240 () Bool)

(declare-fun e!665187 () Bool)

(declare-fun e!665186 () Bool)

(assert (=> b!1170240 (= e!665187 e!665186)))

(assert (=> b!1170240 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(declare-fun res!776088 () Bool)

(assert (=> b!1170240 (= res!776088 (contains!6868 lt!526813 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1170240 (=> (not res!776088) (not e!665186))))

(declare-fun b!1170241 () Bool)

(assert (=> b!1170241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(assert (=> b!1170241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36983 _values!996)))))

(assert (=> b!1170241 (= e!665186 (= (apply!966 lt!526813 (select (arr!36445 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18598 (select (arr!36446 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!132401 () Bool)

(declare-fun e!665185 () Bool)

(assert (=> d!132401 e!665185))

(declare-fun res!776087 () Bool)

(assert (=> d!132401 (=> (not res!776087) (not e!665185))))

(assert (=> d!132401 (= res!776087 (not (contains!6868 lt!526813 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132401 (= lt!526813 e!665189)))

(declare-fun c!116958 () Bool)

(assert (=> d!132401 (= c!116958 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(assert (=> d!132401 (validMask!0 mask!1564)))

(assert (=> d!132401 (= (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526813)))

(declare-fun b!1170242 () Bool)

(assert (=> b!1170242 (= e!665187 e!665188)))

(declare-fun c!116960 () Bool)

(assert (=> b!1170242 (= c!116960 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(declare-fun b!1170243 () Bool)

(declare-fun res!776089 () Bool)

(assert (=> b!1170243 (=> (not res!776089) (not e!665185))))

(assert (=> b!1170243 (= res!776089 (not (contains!6868 lt!526813 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1170244 () Bool)

(assert (=> b!1170244 (= e!665183 call!57182)))

(declare-fun b!1170245 () Bool)

(assert (=> b!1170245 (= e!665188 (= lt!526813 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!57179 () Bool)

(assert (=> bm!57179 (= call!57182 (getCurrentListMapNoExtraKeys!4916 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1170246 () Bool)

(assert (=> b!1170246 (= e!665185 e!665187)))

(declare-fun c!116957 () Bool)

(assert (=> b!1170246 (= c!116957 e!665184)))

(declare-fun res!776090 () Bool)

(assert (=> b!1170246 (=> (not res!776090) (not e!665184))))

(assert (=> b!1170246 (= res!776090 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36982 _keys!1208)))))

(assert (= (and d!132401 c!116958) b!1170235))

(assert (= (and d!132401 (not c!116958)) b!1170239))

(assert (= (and b!1170239 c!116959) b!1170236))

(assert (= (and b!1170239 (not c!116959)) b!1170244))

(assert (= (or b!1170236 b!1170244) bm!57179))

(assert (= (and d!132401 res!776087) b!1170243))

(assert (= (and b!1170243 res!776089) b!1170246))

(assert (= (and b!1170246 res!776090) b!1170238))

(assert (= (and b!1170246 c!116957) b!1170240))

(assert (= (and b!1170246 (not c!116957)) b!1170242))

(assert (= (and b!1170240 res!776088) b!1170241))

(assert (= (and b!1170242 c!116960) b!1170245))

(assert (= (and b!1170242 (not c!116960)) b!1170237))

(declare-fun b_lambda!19957 () Bool)

(assert (=> (not b_lambda!19957) (not b!1170236)))

(assert (=> b!1170236 t!37400))

(declare-fun b_and!40547 () Bool)

(assert (= b_and!40545 (and (=> t!37400 result!19851) b_and!40547)))

(declare-fun b_lambda!19959 () Bool)

(assert (=> (not b_lambda!19959) (not b!1170241)))

(assert (=> b!1170241 t!37400))

(declare-fun b_and!40549 () Bool)

(assert (= b_and!40547 (and (=> t!37400 result!19851) b_and!40549)))

(declare-fun m!1078419 () Bool)

(assert (=> b!1170236 m!1078419))

(declare-fun m!1078421 () Bool)

(assert (=> b!1170236 m!1078421))

(declare-fun m!1078423 () Bool)

(assert (=> b!1170236 m!1078423))

(declare-fun m!1078425 () Bool)

(assert (=> b!1170236 m!1078425))

(declare-fun m!1078427 () Bool)

(assert (=> b!1170236 m!1078427))

(assert (=> b!1170236 m!1078153))

(declare-fun m!1078429 () Bool)

(assert (=> b!1170236 m!1078429))

(assert (=> b!1170236 m!1078421))

(assert (=> b!1170236 m!1078153))

(declare-fun m!1078431 () Bool)

(assert (=> b!1170236 m!1078431))

(assert (=> b!1170236 m!1078423))

(declare-fun m!1078433 () Bool)

(assert (=> b!1170243 m!1078433))

(assert (=> b!1170241 m!1078421))

(assert (=> b!1170241 m!1078427))

(assert (=> b!1170241 m!1078421))

(assert (=> b!1170241 m!1078153))

(assert (=> b!1170241 m!1078431))

(assert (=> b!1170241 m!1078153))

(assert (=> b!1170241 m!1078427))

(declare-fun m!1078435 () Bool)

(assert (=> b!1170241 m!1078435))

(declare-fun m!1078437 () Bool)

(assert (=> b!1170245 m!1078437))

(declare-fun m!1078439 () Bool)

(assert (=> d!132401 m!1078439))

(assert (=> d!132401 m!1078139))

(assert (=> bm!57179 m!1078437))

(declare-fun m!1078441 () Bool)

(assert (=> b!1170237 m!1078441))

(assert (=> b!1170238 m!1078427))

(assert (=> b!1170238 m!1078427))

(declare-fun m!1078443 () Bool)

(assert (=> b!1170238 m!1078443))

(assert (=> b!1170240 m!1078427))

(assert (=> b!1170240 m!1078427))

(declare-fun m!1078445 () Bool)

(assert (=> b!1170240 m!1078445))

(assert (=> b!1170239 m!1078427))

(assert (=> b!1170239 m!1078427))

(assert (=> b!1170239 m!1078443))

(assert (=> b!1169997 d!132401))

(declare-fun condMapEmpty!45881 () Bool)

(declare-fun mapDefault!45881 () ValueCell!13973)

(assert (=> mapNonEmpty!45872 (= condMapEmpty!45881 (= mapRest!45872 ((as const (Array (_ BitVec 32) ValueCell!13973)) mapDefault!45881)))))

(declare-fun e!665195 () Bool)

(declare-fun mapRes!45881 () Bool)

(assert (=> mapNonEmpty!45872 (= tp!87216 (and e!665195 mapRes!45881))))

(declare-fun mapIsEmpty!45881 () Bool)

(assert (=> mapIsEmpty!45881 mapRes!45881))

(declare-fun mapNonEmpty!45881 () Bool)

(declare-fun tp!87231 () Bool)

(declare-fun e!665194 () Bool)

(assert (=> mapNonEmpty!45881 (= mapRes!45881 (and tp!87231 e!665194))))

(declare-fun mapKey!45881 () (_ BitVec 32))

(declare-fun mapValue!45881 () ValueCell!13973)

(declare-fun mapRest!45881 () (Array (_ BitVec 32) ValueCell!13973))

(assert (=> mapNonEmpty!45881 (= mapRest!45872 (store mapRest!45881 mapKey!45881 mapValue!45881))))

(declare-fun b!1170254 () Bool)

(assert (=> b!1170254 (= e!665195 tp_is_empty!29365)))

(declare-fun b!1170253 () Bool)

(assert (=> b!1170253 (= e!665194 tp_is_empty!29365)))

(assert (= (and mapNonEmpty!45872 condMapEmpty!45881) mapIsEmpty!45881))

(assert (= (and mapNonEmpty!45872 (not condMapEmpty!45881)) mapNonEmpty!45881))

(assert (= (and mapNonEmpty!45881 ((_ is ValueCellFull!13973) mapValue!45881)) b!1170253))

(assert (= (and mapNonEmpty!45872 ((_ is ValueCellFull!13973) mapDefault!45881)) b!1170254))

(declare-fun m!1078447 () Bool)

(assert (=> mapNonEmpty!45881 m!1078447))

(declare-fun b_lambda!19961 () Bool)

(assert (= b_lambda!19951 (or (and start!99466 b_free!24835) b_lambda!19961)))

(declare-fun b_lambda!19963 () Bool)

(assert (= b_lambda!19943 (or (and start!99466 b_free!24835) b_lambda!19963)))

(declare-fun b_lambda!19965 () Bool)

(assert (= b_lambda!19959 (or (and start!99466 b_free!24835) b_lambda!19965)))

(declare-fun b_lambda!19967 () Bool)

(assert (= b_lambda!19957 (or (and start!99466 b_free!24835) b_lambda!19967)))

(declare-fun b_lambda!19969 () Bool)

(assert (= b_lambda!19955 (or (and start!99466 b_free!24835) b_lambda!19969)))

(declare-fun b_lambda!19971 () Bool)

(assert (= b_lambda!19947 (or (and start!99466 b_free!24835) b_lambda!19971)))

(declare-fun b_lambda!19973 () Bool)

(assert (= b_lambda!19949 (or (and start!99466 b_free!24835) b_lambda!19973)))

(declare-fun b_lambda!19975 () Bool)

(assert (= b_lambda!19953 (or (and start!99466 b_free!24835) b_lambda!19975)))

(declare-fun b_lambda!19977 () Bool)

(assert (= b_lambda!19945 (or (and start!99466 b_free!24835) b_lambda!19977)))

(check-sat (not mapNonEmpty!45881) (not b!1170231) (not b!1170194) (not b!1170204) (not bm!57176) (not b!1170149) (not b!1170237) (not b!1170134) (not d!132395) (not b!1170128) (not d!132399) (not b!1170225) (not b!1170122) (not d!132371) (not b!1170243) (not b!1170185) (not bm!57162) (not b_lambda!19961) (not b!1170228) (not b!1170202) (not b_next!24835) (not b!1170238) (not b!1170197) (not b_lambda!19967) (not bm!57167) (not b!1170236) b_and!40549 (not b!1170188) (not b!1170220) (not b!1170201) (not bm!57178) (not b!1170150) (not b!1170227) (not d!132383) (not b!1170240) (not b!1170213) (not b_lambda!19963) (not b!1170190) (not b_lambda!19969) (not bm!57179) tp_is_empty!29365 (not d!132397) (not b_lambda!19973) (not b_lambda!19971) (not b!1170147) (not b_lambda!19977) (not b!1170152) (not b!1170199) (not b!1170229) (not bm!57166) (not b!1170239) (not bm!57170) (not b!1170187) (not b!1170206) (not bm!57165) (not bm!57177) (not b!1170129) (not b!1170159) (not b!1170189) (not b!1170233) (not b!1170135) (not b!1170154) (not b_lambda!19941) (not b!1170245) (not b!1170192) (not d!132387) (not b!1170155) (not bm!57171) (not b!1170224) (not b!1170186) (not b_lambda!19965) (not d!132401) (not b!1170200) (not d!132381) (not b!1170123) (not b!1170226) (not b!1170198) (not b!1170158) (not b!1170241) (not b_lambda!19975))
(check-sat b_and!40549 (not b_next!24835))
