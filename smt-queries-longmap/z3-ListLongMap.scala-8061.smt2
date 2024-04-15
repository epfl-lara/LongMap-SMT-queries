; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99200 () Bool)

(assert start!99200)

(declare-fun b_free!24811 () Bool)

(declare-fun b_next!24811 () Bool)

(assert (=> start!99200 (= b_free!24811 (not b_next!24811))))

(declare-fun tp!87144 () Bool)

(declare-fun b_and!40449 () Bool)

(assert (=> start!99200 (= tp!87144 b_and!40449)))

(declare-fun b!1167988 () Bool)

(declare-fun res!774912 () Bool)

(declare-fun e!663816 () Bool)

(assert (=> b!1167988 (=> (not res!774912) (not e!663816))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75430 0))(
  ( (array!75431 (arr!36366 (Array (_ BitVec 32) (_ BitVec 64))) (size!36904 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75430)

(assert (=> b!1167988 (= res!774912 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36904 _keys!1208))))))

(declare-fun b!1167989 () Bool)

(declare-fun e!663818 () Bool)

(assert (=> b!1167989 (= e!663816 e!663818)))

(declare-fun res!774913 () Bool)

(assert (=> b!1167989 (=> (not res!774913) (not e!663818))))

(declare-fun lt!525700 () array!75430)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75430 (_ BitVec 32)) Bool)

(assert (=> b!1167989 (= res!774913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525700 mask!1564))))

(assert (=> b!1167989 (= lt!525700 (array!75431 (store (arr!36366 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36904 _keys!1208)))))

(declare-fun b!1167990 () Bool)

(declare-fun res!774914 () Bool)

(assert (=> b!1167990 (=> (not res!774914) (not e!663816))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44249 0))(
  ( (V!44250 (val!14727 Int)) )
))
(declare-datatypes ((ValueCell!13961 0))(
  ( (ValueCellFull!13961 (v!17363 V!44249)) (EmptyCell!13961) )
))
(declare-datatypes ((array!75432 0))(
  ( (array!75433 (arr!36367 (Array (_ BitVec 32) ValueCell!13961)) (size!36905 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75432)

(assert (=> b!1167990 (= res!774914 (and (= (size!36905 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36904 _keys!1208) (size!36905 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167991 () Bool)

(declare-fun res!774917 () Bool)

(assert (=> b!1167991 (=> (not res!774917) (not e!663816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167991 (= res!774917 (validMask!0 mask!1564))))

(declare-fun b!1167992 () Bool)

(declare-fun res!774908 () Bool)

(assert (=> b!1167992 (=> (not res!774908) (not e!663818))))

(declare-datatypes ((List!25597 0))(
  ( (Nil!25594) (Cons!25593 (h!26802 (_ BitVec 64)) (t!37391 List!25597)) )
))
(declare-fun arrayNoDuplicates!0 (array!75430 (_ BitVec 32) List!25597) Bool)

(assert (=> b!1167992 (= res!774908 (arrayNoDuplicates!0 lt!525700 #b00000000000000000000000000000000 Nil!25594))))

(declare-fun b!1167993 () Bool)

(declare-fun e!663819 () Bool)

(declare-fun e!663817 () Bool)

(assert (=> b!1167993 (= e!663819 e!663817)))

(declare-fun res!774909 () Bool)

(assert (=> b!1167993 (=> res!774909 e!663817)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1167993 (= res!774909 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44249)

(declare-fun lt!525701 () array!75432)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18882 0))(
  ( (tuple2!18883 (_1!9452 (_ BitVec 64)) (_2!9452 V!44249)) )
))
(declare-datatypes ((List!25598 0))(
  ( (Nil!25595) (Cons!25594 (h!26803 tuple2!18882) (t!37392 List!25598)) )
))
(declare-datatypes ((ListLongMap!16851 0))(
  ( (ListLongMap!16852 (toList!8441 List!25598)) )
))
(declare-fun lt!525702 () ListLongMap!16851)

(declare-fun minValue!944 () V!44249)

(declare-fun getCurrentListMapNoExtraKeys!4917 (array!75430 array!75432 (_ BitVec 32) (_ BitVec 32) V!44249 V!44249 (_ BitVec 32) Int) ListLongMap!16851)

(assert (=> b!1167993 (= lt!525702 (getCurrentListMapNoExtraKeys!4917 lt!525700 lt!525701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2845 (Int (_ BitVec 64)) V!44249)

(assert (=> b!1167993 (= lt!525701 (array!75433 (store (arr!36367 _values!996) i!673 (ValueCellFull!13961 (dynLambda!2845 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36905 _values!996)))))

(declare-fun lt!525704 () ListLongMap!16851)

(assert (=> b!1167993 (= lt!525704 (getCurrentListMapNoExtraKeys!4917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167994 () Bool)

(declare-fun e!663813 () Bool)

(declare-fun tp_is_empty!29341 () Bool)

(assert (=> b!1167994 (= e!663813 tp_is_empty!29341)))

(declare-fun res!774911 () Bool)

(assert (=> start!99200 (=> (not res!774911) (not e!663816))))

(assert (=> start!99200 (= res!774911 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36904 _keys!1208))))))

(assert (=> start!99200 e!663816))

(assert (=> start!99200 tp_is_empty!29341))

(declare-fun array_inv!27904 (array!75430) Bool)

(assert (=> start!99200 (array_inv!27904 _keys!1208)))

(assert (=> start!99200 true))

(assert (=> start!99200 tp!87144))

(declare-fun e!663815 () Bool)

(declare-fun array_inv!27905 (array!75432) Bool)

(assert (=> start!99200 (and (array_inv!27905 _values!996) e!663815)))

(declare-fun b!1167995 () Bool)

(declare-fun res!774906 () Bool)

(assert (=> b!1167995 (=> (not res!774906) (not e!663816))))

(assert (=> b!1167995 (= res!774906 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25594))))

(declare-fun b!1167996 () Bool)

(declare-fun e!663814 () Bool)

(assert (=> b!1167996 (= e!663814 tp_is_empty!29341)))

(declare-fun b!1167997 () Bool)

(assert (=> b!1167997 (= e!663817 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1450 (ListLongMap!16851 (_ BitVec 64)) ListLongMap!16851)

(assert (=> b!1167997 (= (getCurrentListMapNoExtraKeys!4917 lt!525700 lt!525701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1450 (getCurrentListMapNoExtraKeys!4917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38371 0))(
  ( (Unit!38372) )
))
(declare-fun lt!525705 () Unit!38371)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 (array!75430 array!75432 (_ BitVec 32) (_ BitVec 32) V!44249 V!44249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38371)

(assert (=> b!1167997 (= lt!525705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!714 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167998 () Bool)

(declare-fun res!774907 () Bool)

(assert (=> b!1167998 (=> (not res!774907) (not e!663816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167998 (= res!774907 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45836 () Bool)

(declare-fun mapRes!45836 () Bool)

(declare-fun tp!87143 () Bool)

(assert (=> mapNonEmpty!45836 (= mapRes!45836 (and tp!87143 e!663813))))

(declare-fun mapRest!45836 () (Array (_ BitVec 32) ValueCell!13961))

(declare-fun mapValue!45836 () ValueCell!13961)

(declare-fun mapKey!45836 () (_ BitVec 32))

(assert (=> mapNonEmpty!45836 (= (arr!36367 _values!996) (store mapRest!45836 mapKey!45836 mapValue!45836))))

(declare-fun b!1167999 () Bool)

(declare-fun res!774916 () Bool)

(assert (=> b!1167999 (=> (not res!774916) (not e!663816))))

(assert (=> b!1167999 (= res!774916 (= (select (arr!36366 _keys!1208) i!673) k0!934))))

(declare-fun b!1168000 () Bool)

(assert (=> b!1168000 (= e!663815 (and e!663814 mapRes!45836))))

(declare-fun condMapEmpty!45836 () Bool)

(declare-fun mapDefault!45836 () ValueCell!13961)

(assert (=> b!1168000 (= condMapEmpty!45836 (= (arr!36367 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13961)) mapDefault!45836)))))

(declare-fun b!1168001 () Bool)

(declare-fun res!774910 () Bool)

(assert (=> b!1168001 (=> (not res!774910) (not e!663816))))

(assert (=> b!1168001 (= res!774910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168002 () Bool)

(assert (=> b!1168002 (= e!663818 (not e!663819))))

(declare-fun res!774915 () Bool)

(assert (=> b!1168002 (=> res!774915 e!663819)))

(assert (=> b!1168002 (= res!774915 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168002 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525703 () Unit!38371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75430 (_ BitVec 64) (_ BitVec 32)) Unit!38371)

(assert (=> b!1168002 (= lt!525703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45836 () Bool)

(assert (=> mapIsEmpty!45836 mapRes!45836))

(assert (= (and start!99200 res!774911) b!1167991))

(assert (= (and b!1167991 res!774917) b!1167990))

(assert (= (and b!1167990 res!774914) b!1168001))

(assert (= (and b!1168001 res!774910) b!1167995))

(assert (= (and b!1167995 res!774906) b!1167988))

(assert (= (and b!1167988 res!774912) b!1167998))

(assert (= (and b!1167998 res!774907) b!1167999))

(assert (= (and b!1167999 res!774916) b!1167989))

(assert (= (and b!1167989 res!774913) b!1167992))

(assert (= (and b!1167992 res!774908) b!1168002))

(assert (= (and b!1168002 (not res!774915)) b!1167993))

(assert (= (and b!1167993 (not res!774909)) b!1167997))

(assert (= (and b!1168000 condMapEmpty!45836) mapIsEmpty!45836))

(assert (= (and b!1168000 (not condMapEmpty!45836)) mapNonEmpty!45836))

(get-info :version)

(assert (= (and mapNonEmpty!45836 ((_ is ValueCellFull!13961) mapValue!45836)) b!1167994))

(assert (= (and b!1168000 ((_ is ValueCellFull!13961) mapDefault!45836)) b!1167996))

(assert (= start!99200 b!1168000))

(declare-fun b_lambda!19899 () Bool)

(assert (=> (not b_lambda!19899) (not b!1167993)))

(declare-fun t!37390 () Bool)

(declare-fun tb!9615 () Bool)

(assert (=> (and start!99200 (= defaultEntry!1004 defaultEntry!1004) t!37390) tb!9615))

(declare-fun result!19803 () Bool)

(assert (=> tb!9615 (= result!19803 tp_is_empty!29341)))

(assert (=> b!1167993 t!37390))

(declare-fun b_and!40451 () Bool)

(assert (= b_and!40449 (and (=> t!37390 result!19803) b_and!40451)))

(declare-fun m!1075363 () Bool)

(assert (=> b!1167993 m!1075363))

(declare-fun m!1075365 () Bool)

(assert (=> b!1167993 m!1075365))

(declare-fun m!1075367 () Bool)

(assert (=> b!1167993 m!1075367))

(declare-fun m!1075369 () Bool)

(assert (=> b!1167993 m!1075369))

(declare-fun m!1075371 () Bool)

(assert (=> b!1168002 m!1075371))

(declare-fun m!1075373 () Bool)

(assert (=> b!1168002 m!1075373))

(declare-fun m!1075375 () Bool)

(assert (=> b!1167989 m!1075375))

(declare-fun m!1075377 () Bool)

(assert (=> b!1167989 m!1075377))

(declare-fun m!1075379 () Bool)

(assert (=> b!1167999 m!1075379))

(declare-fun m!1075381 () Bool)

(assert (=> b!1168001 m!1075381))

(declare-fun m!1075383 () Bool)

(assert (=> b!1167992 m!1075383))

(declare-fun m!1075385 () Bool)

(assert (=> b!1167997 m!1075385))

(declare-fun m!1075387 () Bool)

(assert (=> b!1167997 m!1075387))

(assert (=> b!1167997 m!1075387))

(declare-fun m!1075389 () Bool)

(assert (=> b!1167997 m!1075389))

(declare-fun m!1075391 () Bool)

(assert (=> b!1167997 m!1075391))

(declare-fun m!1075393 () Bool)

(assert (=> mapNonEmpty!45836 m!1075393))

(declare-fun m!1075395 () Bool)

(assert (=> b!1167995 m!1075395))

(declare-fun m!1075397 () Bool)

(assert (=> start!99200 m!1075397))

(declare-fun m!1075399 () Bool)

(assert (=> start!99200 m!1075399))

(declare-fun m!1075401 () Bool)

(assert (=> b!1167998 m!1075401))

(declare-fun m!1075403 () Bool)

(assert (=> b!1167991 m!1075403))

(check-sat (not b_next!24811) b_and!40451 (not b!1168002) (not start!99200) (not b!1167991) (not b!1167997) (not b_lambda!19899) (not mapNonEmpty!45836) (not b!1167995) (not b!1168001) (not b!1167993) (not b!1167998) tp_is_empty!29341 (not b!1167992) (not b!1167989))
(check-sat b_and!40451 (not b_next!24811))
