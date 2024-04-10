; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99330 () Bool)

(assert start!99330)

(declare-fun b_free!24909 () Bool)

(declare-fun b_next!24909 () Bool)

(assert (=> start!99330 (= b_free!24909 (not b_next!24909))))

(declare-fun tp!87440 () Bool)

(declare-fun b_and!40685 () Bool)

(assert (=> start!99330 (= tp!87440 b_and!40685)))

(declare-fun b!1170971 () Bool)

(declare-fun e!665575 () Bool)

(declare-fun tp_is_empty!29439 () Bool)

(assert (=> b!1170971 (= e!665575 tp_is_empty!29439)))

(declare-fun res!777210 () Bool)

(declare-fun e!665566 () Bool)

(assert (=> start!99330 (=> (not res!777210) (not e!665566))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75697 0))(
  ( (array!75698 (arr!36498 (Array (_ BitVec 32) (_ BitVec 64))) (size!37034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75697)

(assert (=> start!99330 (= res!777210 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37034 _keys!1208))))))

(assert (=> start!99330 e!665566))

(assert (=> start!99330 tp_is_empty!29439))

(declare-fun array_inv!27896 (array!75697) Bool)

(assert (=> start!99330 (array_inv!27896 _keys!1208)))

(assert (=> start!99330 true))

(assert (=> start!99330 tp!87440))

(declare-datatypes ((V!44379 0))(
  ( (V!44380 (val!14776 Int)) )
))
(declare-datatypes ((ValueCell!14010 0))(
  ( (ValueCellFull!14010 (v!17414 V!44379)) (EmptyCell!14010) )
))
(declare-datatypes ((array!75699 0))(
  ( (array!75700 (arr!36499 (Array (_ BitVec 32) ValueCell!14010)) (size!37035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75699)

(declare-fun e!665569 () Bool)

(declare-fun array_inv!27897 (array!75699) Bool)

(assert (=> start!99330 (and (array_inv!27897 _values!996) e!665569)))

(declare-fun b!1170972 () Bool)

(declare-fun e!665573 () Bool)

(declare-fun e!665571 () Bool)

(assert (=> b!1170972 (= e!665573 e!665571)))

(declare-fun res!777212 () Bool)

(assert (=> b!1170972 (=> res!777212 e!665571)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1170972 (= res!777212 (not (= (select (arr!36498 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170973 () Bool)

(declare-fun res!777211 () Bool)

(assert (=> b!1170973 (=> (not res!777211) (not e!665566))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75697 (_ BitVec 32)) Bool)

(assert (=> b!1170973 (= res!777211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170974 () Bool)

(declare-fun e!665572 () Bool)

(declare-fun e!665567 () Bool)

(assert (=> b!1170974 (= e!665572 (not e!665567))))

(declare-fun res!777222 () Bool)

(assert (=> b!1170974 (=> res!777222 e!665567)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170974 (= res!777222 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170974 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38626 0))(
  ( (Unit!38627) )
))
(declare-fun lt!527438 () Unit!38626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75697 (_ BitVec 64) (_ BitVec 32)) Unit!38626)

(assert (=> b!1170974 (= lt!527438 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170975 () Bool)

(declare-fun res!777213 () Bool)

(assert (=> b!1170975 (=> (not res!777213) (not e!665566))))

(assert (=> b!1170975 (= res!777213 (= (select (arr!36498 _keys!1208) i!673) k0!934))))

(declare-fun b!1170976 () Bool)

(declare-fun mapRes!45986 () Bool)

(assert (=> b!1170976 (= e!665569 (and e!665575 mapRes!45986))))

(declare-fun condMapEmpty!45986 () Bool)

(declare-fun mapDefault!45986 () ValueCell!14010)

(assert (=> b!1170976 (= condMapEmpty!45986 (= (arr!36499 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14010)) mapDefault!45986)))))

(declare-fun b!1170977 () Bool)

(declare-fun res!777214 () Bool)

(declare-fun e!665563 () Bool)

(assert (=> b!1170977 (=> res!777214 e!665563)))

(declare-datatypes ((List!25608 0))(
  ( (Nil!25605) (Cons!25604 (h!26813 (_ BitVec 64)) (t!37509 List!25608)) )
))
(declare-fun contains!6842 (List!25608 (_ BitVec 64)) Bool)

(assert (=> b!1170977 (= res!777214 (contains!6842 Nil!25605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170978 () Bool)

(assert (=> b!1170978 (= e!665571 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45986 () Bool)

(assert (=> mapIsEmpty!45986 mapRes!45986))

(declare-fun b!1170979 () Bool)

(assert (=> b!1170979 (= e!665566 e!665572)))

(declare-fun res!777221 () Bool)

(assert (=> b!1170979 (=> (not res!777221) (not e!665572))))

(declare-fun lt!527442 () array!75697)

(assert (=> b!1170979 (= res!777221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527442 mask!1564))))

(assert (=> b!1170979 (= lt!527442 (array!75698 (store (arr!36498 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37034 _keys!1208)))))

(declare-fun b!1170980 () Bool)

(declare-fun e!665568 () Bool)

(assert (=> b!1170980 (= e!665567 e!665568)))

(declare-fun res!777226 () Bool)

(assert (=> b!1170980 (=> res!777226 e!665568)))

(assert (=> b!1170980 (= res!777226 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44379)

(declare-fun zeroValue!944 () V!44379)

(declare-datatypes ((tuple2!18872 0))(
  ( (tuple2!18873 (_1!9447 (_ BitVec 64)) (_2!9447 V!44379)) )
))
(declare-datatypes ((List!25609 0))(
  ( (Nil!25606) (Cons!25605 (h!26814 tuple2!18872) (t!37510 List!25609)) )
))
(declare-datatypes ((ListLongMap!16841 0))(
  ( (ListLongMap!16842 (toList!8436 List!25609)) )
))
(declare-fun lt!527444 () ListLongMap!16841)

(declare-fun lt!527436 () array!75699)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4900 (array!75697 array!75699 (_ BitVec 32) (_ BitVec 32) V!44379 V!44379 (_ BitVec 32) Int) ListLongMap!16841)

(assert (=> b!1170980 (= lt!527444 (getCurrentListMapNoExtraKeys!4900 lt!527442 lt!527436 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527445 () V!44379)

(assert (=> b!1170980 (= lt!527436 (array!75700 (store (arr!36499 _values!996) i!673 (ValueCellFull!14010 lt!527445)) (size!37035 _values!996)))))

(declare-fun dynLambda!2876 (Int (_ BitVec 64)) V!44379)

(assert (=> b!1170980 (= lt!527445 (dynLambda!2876 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527435 () ListLongMap!16841)

(assert (=> b!1170980 (= lt!527435 (getCurrentListMapNoExtraKeys!4900 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170981 () Bool)

(declare-fun e!665564 () Bool)

(assert (=> b!1170981 (= e!665564 tp_is_empty!29439)))

(declare-fun mapNonEmpty!45986 () Bool)

(declare-fun tp!87441 () Bool)

(assert (=> mapNonEmpty!45986 (= mapRes!45986 (and tp!87441 e!665564))))

(declare-fun mapRest!45986 () (Array (_ BitVec 32) ValueCell!14010))

(declare-fun mapValue!45986 () ValueCell!14010)

(declare-fun mapKey!45986 () (_ BitVec 32))

(assert (=> mapNonEmpty!45986 (= (arr!36499 _values!996) (store mapRest!45986 mapKey!45986 mapValue!45986))))

(declare-fun b!1170982 () Bool)

(declare-fun res!777208 () Bool)

(assert (=> b!1170982 (=> (not res!777208) (not e!665566))))

(assert (=> b!1170982 (= res!777208 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37034 _keys!1208))))))

(declare-fun b!1170983 () Bool)

(declare-fun res!777218 () Bool)

(assert (=> b!1170983 (=> (not res!777218) (not e!665566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170983 (= res!777218 (validMask!0 mask!1564))))

(declare-fun b!1170984 () Bool)

(declare-fun res!777223 () Bool)

(assert (=> b!1170984 (=> (not res!777223) (not e!665566))))

(declare-fun arrayNoDuplicates!0 (array!75697 (_ BitVec 32) List!25608) Bool)

(assert (=> b!1170984 (= res!777223 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25605))))

(declare-fun b!1170985 () Bool)

(declare-fun e!665565 () Bool)

(declare-fun e!665570 () Bool)

(assert (=> b!1170985 (= e!665565 e!665570)))

(declare-fun res!777215 () Bool)

(assert (=> b!1170985 (=> res!777215 e!665570)))

(assert (=> b!1170985 (= res!777215 (not (= (select (arr!36498 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1170985 e!665573))

(declare-fun res!777216 () Bool)

(assert (=> b!1170985 (=> (not res!777216) (not e!665573))))

(declare-fun lt!527443 () ListLongMap!16841)

(declare-fun +!3764 (ListLongMap!16841 tuple2!18872) ListLongMap!16841)

(declare-fun get!18614 (ValueCell!14010 V!44379) V!44379)

(assert (=> b!1170985 (= res!777216 (= lt!527444 (+!3764 lt!527443 (tuple2!18873 (select (arr!36498 _keys!1208) from!1455) (get!18614 (select (arr!36499 _values!996) from!1455) lt!527445)))))))

(declare-fun b!1170986 () Bool)

(declare-fun res!777225 () Bool)

(assert (=> b!1170986 (=> (not res!777225) (not e!665572))))

(assert (=> b!1170986 (= res!777225 (arrayNoDuplicates!0 lt!527442 #b00000000000000000000000000000000 Nil!25605))))

(declare-fun b!1170987 () Bool)

(declare-fun res!777209 () Bool)

(assert (=> b!1170987 (=> res!777209 e!665563)))

(declare-fun noDuplicate!1605 (List!25608) Bool)

(assert (=> b!1170987 (= res!777209 (not (noDuplicate!1605 Nil!25605)))))

(declare-fun b!1170988 () Bool)

(assert (=> b!1170988 (= e!665563 true)))

(declare-fun lt!527433 () Bool)

(assert (=> b!1170988 (= lt!527433 (contains!6842 Nil!25605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1170989 () Bool)

(assert (=> b!1170989 (= e!665570 e!665563)))

(declare-fun res!777224 () Bool)

(assert (=> b!1170989 (=> res!777224 e!665563)))

(assert (=> b!1170989 (= res!777224 (or (bvsge (size!37034 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37034 _keys!1208)) (bvsge from!1455 (size!37034 _keys!1208))))))

(assert (=> b!1170989 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25605)))

(declare-fun lt!527440 () Unit!38626)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75697 (_ BitVec 32) (_ BitVec 32)) Unit!38626)

(assert (=> b!1170989 (= lt!527440 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1170989 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527439 () Unit!38626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38626)

(assert (=> b!1170989 (= lt!527439 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170990 () Bool)

(assert (=> b!1170990 (= e!665568 e!665565)))

(declare-fun res!777219 () Bool)

(assert (=> b!1170990 (=> res!777219 e!665565)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170990 (= res!777219 (not (validKeyInArray!0 (select (arr!36498 _keys!1208) from!1455))))))

(declare-fun lt!527437 () ListLongMap!16841)

(assert (=> b!1170990 (= lt!527437 lt!527443)))

(declare-fun lt!527434 () ListLongMap!16841)

(declare-fun -!1506 (ListLongMap!16841 (_ BitVec 64)) ListLongMap!16841)

(assert (=> b!1170990 (= lt!527443 (-!1506 lt!527434 k0!934))))

(assert (=> b!1170990 (= lt!527437 (getCurrentListMapNoExtraKeys!4900 lt!527442 lt!527436 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170990 (= lt!527434 (getCurrentListMapNoExtraKeys!4900 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527441 () Unit!38626)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!733 (array!75697 array!75699 (_ BitVec 32) (_ BitVec 32) V!44379 V!44379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38626)

(assert (=> b!1170990 (= lt!527441 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170991 () Bool)

(declare-fun res!777217 () Bool)

(assert (=> b!1170991 (=> (not res!777217) (not e!665566))))

(assert (=> b!1170991 (= res!777217 (and (= (size!37035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37034 _keys!1208) (size!37035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170992 () Bool)

(declare-fun res!777220 () Bool)

(assert (=> b!1170992 (=> (not res!777220) (not e!665566))))

(assert (=> b!1170992 (= res!777220 (validKeyInArray!0 k0!934))))

(assert (= (and start!99330 res!777210) b!1170983))

(assert (= (and b!1170983 res!777218) b!1170991))

(assert (= (and b!1170991 res!777217) b!1170973))

(assert (= (and b!1170973 res!777211) b!1170984))

(assert (= (and b!1170984 res!777223) b!1170982))

(assert (= (and b!1170982 res!777208) b!1170992))

(assert (= (and b!1170992 res!777220) b!1170975))

(assert (= (and b!1170975 res!777213) b!1170979))

(assert (= (and b!1170979 res!777221) b!1170986))

(assert (= (and b!1170986 res!777225) b!1170974))

(assert (= (and b!1170974 (not res!777222)) b!1170980))

(assert (= (and b!1170980 (not res!777226)) b!1170990))

(assert (= (and b!1170990 (not res!777219)) b!1170985))

(assert (= (and b!1170985 res!777216) b!1170972))

(assert (= (and b!1170972 (not res!777212)) b!1170978))

(assert (= (and b!1170985 (not res!777215)) b!1170989))

(assert (= (and b!1170989 (not res!777224)) b!1170987))

(assert (= (and b!1170987 (not res!777209)) b!1170977))

(assert (= (and b!1170977 (not res!777214)) b!1170988))

(assert (= (and b!1170976 condMapEmpty!45986) mapIsEmpty!45986))

(assert (= (and b!1170976 (not condMapEmpty!45986)) mapNonEmpty!45986))

(get-info :version)

(assert (= (and mapNonEmpty!45986 ((_ is ValueCellFull!14010) mapValue!45986)) b!1170981))

(assert (= (and b!1170976 ((_ is ValueCellFull!14010) mapDefault!45986)) b!1170971))

(assert (= start!99330 b!1170976))

(declare-fun b_lambda!20053 () Bool)

(assert (=> (not b_lambda!20053) (not b!1170980)))

(declare-fun t!37508 () Bool)

(declare-fun tb!9721 () Bool)

(assert (=> (and start!99330 (= defaultEntry!1004 defaultEntry!1004) t!37508) tb!9721))

(declare-fun result!20009 () Bool)

(assert (=> tb!9721 (= result!20009 tp_is_empty!29439)))

(assert (=> b!1170980 t!37508))

(declare-fun b_and!40687 () Bool)

(assert (= b_and!40685 (and (=> t!37508 result!20009) b_and!40687)))

(declare-fun m!1078787 () Bool)

(assert (=> b!1170986 m!1078787))

(declare-fun m!1078789 () Bool)

(assert (=> b!1170985 m!1078789))

(declare-fun m!1078791 () Bool)

(assert (=> b!1170985 m!1078791))

(assert (=> b!1170985 m!1078791))

(declare-fun m!1078793 () Bool)

(assert (=> b!1170985 m!1078793))

(declare-fun m!1078795 () Bool)

(assert (=> b!1170985 m!1078795))

(declare-fun m!1078797 () Bool)

(assert (=> start!99330 m!1078797))

(declare-fun m!1078799 () Bool)

(assert (=> start!99330 m!1078799))

(declare-fun m!1078801 () Bool)

(assert (=> b!1170989 m!1078801))

(declare-fun m!1078803 () Bool)

(assert (=> b!1170989 m!1078803))

(declare-fun m!1078805 () Bool)

(assert (=> b!1170989 m!1078805))

(declare-fun m!1078807 () Bool)

(assert (=> b!1170989 m!1078807))

(declare-fun m!1078809 () Bool)

(assert (=> b!1170987 m!1078809))

(declare-fun m!1078811 () Bool)

(assert (=> b!1170977 m!1078811))

(declare-fun m!1078813 () Bool)

(assert (=> b!1170973 m!1078813))

(declare-fun m!1078815 () Bool)

(assert (=> b!1170992 m!1078815))

(declare-fun m!1078817 () Bool)

(assert (=> mapNonEmpty!45986 m!1078817))

(declare-fun m!1078819 () Bool)

(assert (=> b!1170979 m!1078819))

(declare-fun m!1078821 () Bool)

(assert (=> b!1170979 m!1078821))

(declare-fun m!1078823 () Bool)

(assert (=> b!1170974 m!1078823))

(declare-fun m!1078825 () Bool)

(assert (=> b!1170974 m!1078825))

(declare-fun m!1078827 () Bool)

(assert (=> b!1170978 m!1078827))

(declare-fun m!1078829 () Bool)

(assert (=> b!1170990 m!1078829))

(declare-fun m!1078831 () Bool)

(assert (=> b!1170990 m!1078831))

(declare-fun m!1078833 () Bool)

(assert (=> b!1170990 m!1078833))

(declare-fun m!1078835 () Bool)

(assert (=> b!1170990 m!1078835))

(assert (=> b!1170990 m!1078789))

(declare-fun m!1078837 () Bool)

(assert (=> b!1170990 m!1078837))

(assert (=> b!1170990 m!1078789))

(declare-fun m!1078839 () Bool)

(assert (=> b!1170984 m!1078839))

(declare-fun m!1078841 () Bool)

(assert (=> b!1170983 m!1078841))

(declare-fun m!1078843 () Bool)

(assert (=> b!1170988 m!1078843))

(declare-fun m!1078845 () Bool)

(assert (=> b!1170975 m!1078845))

(assert (=> b!1170972 m!1078789))

(declare-fun m!1078847 () Bool)

(assert (=> b!1170980 m!1078847))

(declare-fun m!1078849 () Bool)

(assert (=> b!1170980 m!1078849))

(declare-fun m!1078851 () Bool)

(assert (=> b!1170980 m!1078851))

(declare-fun m!1078853 () Bool)

(assert (=> b!1170980 m!1078853))

(check-sat (not b!1170986) (not b!1170979) (not b!1170990) tp_is_empty!29439 (not b!1170977) (not b!1170973) (not b!1170987) (not b!1170980) (not b_next!24909) (not b!1170989) (not b!1170974) (not b!1170985) (not b!1170983) (not start!99330) (not b_lambda!20053) b_and!40687 (not b!1170984) (not b!1170988) (not b!1170992) (not b!1170978) (not mapNonEmpty!45986))
(check-sat b_and!40687 (not b_next!24909))
