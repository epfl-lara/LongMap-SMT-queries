; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99026 () Bool)

(assert start!99026)

(declare-fun b_free!24637 () Bool)

(declare-fun b_next!24637 () Bool)

(assert (=> start!99026 (= b_free!24637 (not b_next!24637))))

(declare-fun tp!86622 () Bool)

(declare-fun b_and!40101 () Bool)

(assert (=> start!99026 (= tp!86622 b_and!40101)))

(declare-fun b!1164014 () Bool)

(declare-fun res!771892 () Bool)

(declare-fun e!661839 () Bool)

(assert (=> b!1164014 (=> (not res!771892) (not e!661839))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164014 (= res!771892 (validMask!0 mask!1564))))

(declare-fun b!1164015 () Bool)

(declare-fun e!661843 () Bool)

(assert (=> b!1164015 (= e!661843 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75090 0))(
  ( (array!75091 (arr!36196 (Array (_ BitVec 32) (_ BitVec 64))) (size!36734 (_ BitVec 32))) )
))
(declare-fun lt!524365 () array!75090)

(declare-datatypes ((V!44017 0))(
  ( (V!44018 (val!14640 Int)) )
))
(declare-datatypes ((ValueCell!13874 0))(
  ( (ValueCellFull!13874 (v!17276 V!44017)) (EmptyCell!13874) )
))
(declare-datatypes ((array!75092 0))(
  ( (array!75093 (arr!36197 (Array (_ BitVec 32) ValueCell!13874)) (size!36735 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75092)

(declare-fun minValue!944 () V!44017)

(declare-datatypes ((tuple2!18754 0))(
  ( (tuple2!18755 (_1!9388 (_ BitVec 64)) (_2!9388 V!44017)) )
))
(declare-datatypes ((List!25471 0))(
  ( (Nil!25468) (Cons!25467 (h!26676 tuple2!18754) (t!37091 List!25471)) )
))
(declare-datatypes ((ListLongMap!16723 0))(
  ( (ListLongMap!16724 (toList!8377 List!25471)) )
))
(declare-fun lt!524367 () ListLongMap!16723)

(declare-fun zeroValue!944 () V!44017)

(declare-fun getCurrentListMapNoExtraKeys!4853 (array!75090 array!75092 (_ BitVec 32) (_ BitVec 32) V!44017 V!44017 (_ BitVec 32) Int) ListLongMap!16723)

(declare-fun dynLambda!2786 (Int (_ BitVec 64)) V!44017)

(assert (=> b!1164015 (= lt!524367 (getCurrentListMapNoExtraKeys!4853 lt!524365 (array!75093 (store (arr!36197 _values!996) i!673 (ValueCellFull!13874 (dynLambda!2786 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36735 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75090)

(declare-fun lt!524364 () ListLongMap!16723)

(assert (=> b!1164015 (= lt!524364 (getCurrentListMapNoExtraKeys!4853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164016 () Bool)

(declare-fun res!771889 () Bool)

(assert (=> b!1164016 (=> (not res!771889) (not e!661839))))

(declare-datatypes ((List!25472 0))(
  ( (Nil!25469) (Cons!25468 (h!26677 (_ BitVec 64)) (t!37092 List!25472)) )
))
(declare-fun arrayNoDuplicates!0 (array!75090 (_ BitVec 32) List!25472) Bool)

(assert (=> b!1164016 (= res!771889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25469))))

(declare-fun b!1164017 () Bool)

(declare-fun e!661844 () Bool)

(declare-fun e!661840 () Bool)

(declare-fun mapRes!45575 () Bool)

(assert (=> b!1164017 (= e!661844 (and e!661840 mapRes!45575))))

(declare-fun condMapEmpty!45575 () Bool)

(declare-fun mapDefault!45575 () ValueCell!13874)

(assert (=> b!1164017 (= condMapEmpty!45575 (= (arr!36197 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13874)) mapDefault!45575)))))

(declare-fun b!1164018 () Bool)

(declare-fun e!661842 () Bool)

(assert (=> b!1164018 (= e!661842 (not e!661843))))

(declare-fun res!771894 () Bool)

(assert (=> b!1164018 (=> res!771894 e!661843)))

(assert (=> b!1164018 (= res!771894 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164018 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38255 0))(
  ( (Unit!38256) )
))
(declare-fun lt!524366 () Unit!38255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75090 (_ BitVec 64) (_ BitVec 32)) Unit!38255)

(assert (=> b!1164018 (= lt!524366 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164019 () Bool)

(declare-fun res!771895 () Bool)

(assert (=> b!1164019 (=> (not res!771895) (not e!661839))))

(assert (=> b!1164019 (= res!771895 (and (= (size!36735 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36734 _keys!1208) (size!36735 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164020 () Bool)

(declare-fun res!771891 () Bool)

(assert (=> b!1164020 (=> (not res!771891) (not e!661839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75090 (_ BitVec 32)) Bool)

(assert (=> b!1164020 (= res!771891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164021 () Bool)

(declare-fun res!771896 () Bool)

(assert (=> b!1164021 (=> (not res!771896) (not e!661839))))

(assert (=> b!1164021 (= res!771896 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36734 _keys!1208))))))

(declare-fun mapNonEmpty!45575 () Bool)

(declare-fun tp!86621 () Bool)

(declare-fun e!661845 () Bool)

(assert (=> mapNonEmpty!45575 (= mapRes!45575 (and tp!86621 e!661845))))

(declare-fun mapKey!45575 () (_ BitVec 32))

(declare-fun mapRest!45575 () (Array (_ BitVec 32) ValueCell!13874))

(declare-fun mapValue!45575 () ValueCell!13874)

(assert (=> mapNonEmpty!45575 (= (arr!36197 _values!996) (store mapRest!45575 mapKey!45575 mapValue!45575))))

(declare-fun res!771899 () Bool)

(assert (=> start!99026 (=> (not res!771899) (not e!661839))))

(assert (=> start!99026 (= res!771899 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36734 _keys!1208))))))

(assert (=> start!99026 e!661839))

(declare-fun tp_is_empty!29167 () Bool)

(assert (=> start!99026 tp_is_empty!29167))

(declare-fun array_inv!27798 (array!75090) Bool)

(assert (=> start!99026 (array_inv!27798 _keys!1208)))

(assert (=> start!99026 true))

(assert (=> start!99026 tp!86622))

(declare-fun array_inv!27799 (array!75092) Bool)

(assert (=> start!99026 (and (array_inv!27799 _values!996) e!661844)))

(declare-fun b!1164022 () Bool)

(declare-fun res!771898 () Bool)

(assert (=> b!1164022 (=> (not res!771898) (not e!661839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164022 (= res!771898 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45575 () Bool)

(assert (=> mapIsEmpty!45575 mapRes!45575))

(declare-fun b!1164023 () Bool)

(assert (=> b!1164023 (= e!661845 tp_is_empty!29167)))

(declare-fun b!1164024 () Bool)

(assert (=> b!1164024 (= e!661839 e!661842)))

(declare-fun res!771890 () Bool)

(assert (=> b!1164024 (=> (not res!771890) (not e!661842))))

(assert (=> b!1164024 (= res!771890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524365 mask!1564))))

(assert (=> b!1164024 (= lt!524365 (array!75091 (store (arr!36196 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36734 _keys!1208)))))

(declare-fun b!1164025 () Bool)

(assert (=> b!1164025 (= e!661840 tp_is_empty!29167)))

(declare-fun b!1164026 () Bool)

(declare-fun res!771897 () Bool)

(assert (=> b!1164026 (=> (not res!771897) (not e!661842))))

(assert (=> b!1164026 (= res!771897 (arrayNoDuplicates!0 lt!524365 #b00000000000000000000000000000000 Nil!25469))))

(declare-fun b!1164027 () Bool)

(declare-fun res!771893 () Bool)

(assert (=> b!1164027 (=> (not res!771893) (not e!661839))))

(assert (=> b!1164027 (= res!771893 (= (select (arr!36196 _keys!1208) i!673) k0!934))))

(assert (= (and start!99026 res!771899) b!1164014))

(assert (= (and b!1164014 res!771892) b!1164019))

(assert (= (and b!1164019 res!771895) b!1164020))

(assert (= (and b!1164020 res!771891) b!1164016))

(assert (= (and b!1164016 res!771889) b!1164021))

(assert (= (and b!1164021 res!771896) b!1164022))

(assert (= (and b!1164022 res!771898) b!1164027))

(assert (= (and b!1164027 res!771893) b!1164024))

(assert (= (and b!1164024 res!771890) b!1164026))

(assert (= (and b!1164026 res!771897) b!1164018))

(assert (= (and b!1164018 (not res!771894)) b!1164015))

(assert (= (and b!1164017 condMapEmpty!45575) mapIsEmpty!45575))

(assert (= (and b!1164017 (not condMapEmpty!45575)) mapNonEmpty!45575))

(get-info :version)

(assert (= (and mapNonEmpty!45575 ((_ is ValueCellFull!13874) mapValue!45575)) b!1164023))

(assert (= (and b!1164017 ((_ is ValueCellFull!13874) mapDefault!45575)) b!1164025))

(assert (= start!99026 b!1164017))

(declare-fun b_lambda!19725 () Bool)

(assert (=> (not b_lambda!19725) (not b!1164015)))

(declare-fun t!37090 () Bool)

(declare-fun tb!9441 () Bool)

(assert (=> (and start!99026 (= defaultEntry!1004 defaultEntry!1004) t!37090) tb!9441))

(declare-fun result!19455 () Bool)

(assert (=> tb!9441 (= result!19455 tp_is_empty!29167)))

(assert (=> b!1164015 t!37090))

(declare-fun b_and!40103 () Bool)

(assert (= b_and!40101 (and (=> t!37090 result!19455) b_and!40103)))

(declare-fun m!1072021 () Bool)

(assert (=> b!1164024 m!1072021))

(declare-fun m!1072023 () Bool)

(assert (=> b!1164024 m!1072023))

(declare-fun m!1072025 () Bool)

(assert (=> b!1164026 m!1072025))

(declare-fun m!1072027 () Bool)

(assert (=> b!1164018 m!1072027))

(declare-fun m!1072029 () Bool)

(assert (=> b!1164018 m!1072029))

(declare-fun m!1072031 () Bool)

(assert (=> b!1164027 m!1072031))

(declare-fun m!1072033 () Bool)

(assert (=> b!1164014 m!1072033))

(declare-fun m!1072035 () Bool)

(assert (=> start!99026 m!1072035))

(declare-fun m!1072037 () Bool)

(assert (=> start!99026 m!1072037))

(declare-fun m!1072039 () Bool)

(assert (=> b!1164020 m!1072039))

(declare-fun m!1072041 () Bool)

(assert (=> b!1164016 m!1072041))

(declare-fun m!1072043 () Bool)

(assert (=> b!1164022 m!1072043))

(declare-fun m!1072045 () Bool)

(assert (=> mapNonEmpty!45575 m!1072045))

(declare-fun m!1072047 () Bool)

(assert (=> b!1164015 m!1072047))

(declare-fun m!1072049 () Bool)

(assert (=> b!1164015 m!1072049))

(declare-fun m!1072051 () Bool)

(assert (=> b!1164015 m!1072051))

(declare-fun m!1072053 () Bool)

(assert (=> b!1164015 m!1072053))

(check-sat (not b!1164014) b_and!40103 tp_is_empty!29167 (not b!1164026) (not start!99026) (not b!1164020) (not b!1164016) (not b_lambda!19725) (not b!1164024) (not mapNonEmpty!45575) (not b!1164015) (not b_next!24637) (not b!1164022) (not b!1164018))
(check-sat b_and!40103 (not b_next!24637))
